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

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2 - BLOCK
    )
    :vars
    (
      ?AUTO_3 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2 ?AUTO_3 ) ( CLEAR ?AUTO_2 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2 ?AUTO_3 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2 ?AUTO_3 )
      ( MAKE-ON-TABLE ?AUTO_2 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6 - BLOCK
    )
    :vars
    (
      ?AUTO_7 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6 ?AUTO_7 ) ( CLEAR ?AUTO_6 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6 ?AUTO_7 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6 ?AUTO_7 )
      ( MAKE-ON-TABLE ?AUTO_6 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8 - BLOCK
    )
    :vars
    (
      ?AUTO_9 - BLOCK
      ?AUTO_10 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8 ?AUTO_9 ) ( CLEAR ?AUTO_8 ) ( not ( = ?AUTO_8 ?AUTO_9 ) ) ( HOLDING ?AUTO_10 ) ( not ( = ?AUTO_8 ?AUTO_10 ) ) ( not ( = ?AUTO_9 ?AUTO_10 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10 )
      ( MAKE-ON-TABLE ?AUTO_8 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8 ) )
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
    )
    :precondition
    ( and ( ON ?AUTO_11 ?AUTO_12 ) ( not ( = ?AUTO_11 ?AUTO_12 ) ) ( not ( = ?AUTO_11 ?AUTO_13 ) ) ( not ( = ?AUTO_12 ?AUTO_13 ) ) ( ON ?AUTO_13 ?AUTO_11 ) ( CLEAR ?AUTO_13 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_13 ?AUTO_11 )
      ( MAKE-ON-TABLE ?AUTO_11 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_11 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_16 - BLOCK
      ?AUTO_17 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_16 ) ( CLEAR ?AUTO_17 ) ( not ( = ?AUTO_16 ?AUTO_17 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_16 ?AUTO_17 )
      ( MAKE-ON-VERIFY ?AUTO_16 ?AUTO_17 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_18 - BLOCK
      ?AUTO_19 - BLOCK
    )
    :vars
    (
      ?AUTO_20 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_19 ) ( not ( = ?AUTO_18 ?AUTO_19 ) ) ( ON ?AUTO_18 ?AUTO_20 ) ( CLEAR ?AUTO_18 ) ( HAND-EMPTY ) ( not ( = ?AUTO_18 ?AUTO_20 ) ) ( not ( = ?AUTO_19 ?AUTO_20 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_18 ?AUTO_20 )
      ( MAKE-ON ?AUTO_18 ?AUTO_19 )
      ( MAKE-ON-VERIFY ?AUTO_18 ?AUTO_19 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_21 - BLOCK
      ?AUTO_22 - BLOCK
    )
    :vars
    (
      ?AUTO_23 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_21 ?AUTO_22 ) ) ( ON ?AUTO_21 ?AUTO_23 ) ( CLEAR ?AUTO_21 ) ( not ( = ?AUTO_21 ?AUTO_23 ) ) ( not ( = ?AUTO_22 ?AUTO_23 ) ) ( HOLDING ?AUTO_22 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_22 )
      ( MAKE-ON ?AUTO_21 ?AUTO_22 )
      ( MAKE-ON-VERIFY ?AUTO_21 ?AUTO_22 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_24 - BLOCK
      ?AUTO_25 - BLOCK
    )
    :vars
    (
      ?AUTO_26 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_24 ?AUTO_25 ) ) ( ON ?AUTO_24 ?AUTO_26 ) ( not ( = ?AUTO_24 ?AUTO_26 ) ) ( not ( = ?AUTO_25 ?AUTO_26 ) ) ( ON ?AUTO_25 ?AUTO_24 ) ( CLEAR ?AUTO_25 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_25 ?AUTO_24 )
      ( MAKE-ON ?AUTO_24 ?AUTO_25 )
      ( MAKE-ON-VERIFY ?AUTO_24 ?AUTO_25 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_27 - BLOCK
      ?AUTO_28 - BLOCK
    )
    :vars
    (
      ?AUTO_29 - BLOCK
      ?AUTO_30 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_27 ?AUTO_28 ) ) ( ON ?AUTO_27 ?AUTO_29 ) ( not ( = ?AUTO_27 ?AUTO_29 ) ) ( not ( = ?AUTO_28 ?AUTO_29 ) ) ( ON ?AUTO_28 ?AUTO_27 ) ( CLEAR ?AUTO_28 ) ( HOLDING ?AUTO_30 ) ( not ( = ?AUTO_27 ?AUTO_30 ) ) ( not ( = ?AUTO_28 ?AUTO_30 ) ) ( not ( = ?AUTO_29 ?AUTO_30 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_30 )
      ( MAKE-ON ?AUTO_27 ?AUTO_28 )
      ( MAKE-ON-VERIFY ?AUTO_27 ?AUTO_28 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_31 - BLOCK
      ?AUTO_32 - BLOCK
    )
    :vars
    (
      ?AUTO_33 - BLOCK
      ?AUTO_34 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_31 ?AUTO_32 ) ) ( ON ?AUTO_31 ?AUTO_33 ) ( not ( = ?AUTO_31 ?AUTO_33 ) ) ( not ( = ?AUTO_32 ?AUTO_33 ) ) ( ON ?AUTO_32 ?AUTO_31 ) ( not ( = ?AUTO_31 ?AUTO_34 ) ) ( not ( = ?AUTO_32 ?AUTO_34 ) ) ( not ( = ?AUTO_33 ?AUTO_34 ) ) ( ON ?AUTO_34 ?AUTO_32 ) ( CLEAR ?AUTO_34 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_34 ?AUTO_32 )
      ( MAKE-ON ?AUTO_31 ?AUTO_32 )
      ( MAKE-ON-VERIFY ?AUTO_31 ?AUTO_32 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_37 - BLOCK
      ?AUTO_38 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_37 ) ( CLEAR ?AUTO_38 ) ( not ( = ?AUTO_37 ?AUTO_38 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_37 ?AUTO_38 )
      ( MAKE-ON-VERIFY ?AUTO_37 ?AUTO_38 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_39 - BLOCK
      ?AUTO_40 - BLOCK
    )
    :vars
    (
      ?AUTO_41 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_40 ) ( not ( = ?AUTO_39 ?AUTO_40 ) ) ( ON ?AUTO_39 ?AUTO_41 ) ( CLEAR ?AUTO_39 ) ( HAND-EMPTY ) ( not ( = ?AUTO_39 ?AUTO_41 ) ) ( not ( = ?AUTO_40 ?AUTO_41 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_39 ?AUTO_41 )
      ( MAKE-ON ?AUTO_39 ?AUTO_40 )
      ( MAKE-ON-VERIFY ?AUTO_39 ?AUTO_40 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_42 - BLOCK
      ?AUTO_43 - BLOCK
    )
    :vars
    (
      ?AUTO_44 - BLOCK
      ?AUTO_45 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_42 ?AUTO_43 ) ) ( ON ?AUTO_42 ?AUTO_44 ) ( CLEAR ?AUTO_42 ) ( not ( = ?AUTO_42 ?AUTO_44 ) ) ( not ( = ?AUTO_43 ?AUTO_44 ) ) ( HOLDING ?AUTO_43 ) ( CLEAR ?AUTO_45 ) ( not ( = ?AUTO_42 ?AUTO_45 ) ) ( not ( = ?AUTO_43 ?AUTO_45 ) ) ( not ( = ?AUTO_44 ?AUTO_45 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_43 ?AUTO_45 )
      ( MAKE-ON ?AUTO_42 ?AUTO_43 )
      ( MAKE-ON-VERIFY ?AUTO_42 ?AUTO_43 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_48 - BLOCK
      ?AUTO_49 - BLOCK
    )
    :vars
    (
      ?AUTO_50 - BLOCK
      ?AUTO_51 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_49 ) ( not ( = ?AUTO_48 ?AUTO_49 ) ) ( ON ?AUTO_48 ?AUTO_50 ) ( CLEAR ?AUTO_48 ) ( not ( = ?AUTO_48 ?AUTO_50 ) ) ( not ( = ?AUTO_49 ?AUTO_50 ) ) ( HOLDING ?AUTO_51 ) ( not ( = ?AUTO_48 ?AUTO_51 ) ) ( not ( = ?AUTO_49 ?AUTO_51 ) ) ( not ( = ?AUTO_50 ?AUTO_51 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_51 )
      ( MAKE-ON ?AUTO_48 ?AUTO_49 )
      ( MAKE-ON-VERIFY ?AUTO_48 ?AUTO_49 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_52 - BLOCK
      ?AUTO_53 - BLOCK
    )
    :vars
    (
      ?AUTO_55 - BLOCK
      ?AUTO_54 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_52 ?AUTO_53 ) ) ( ON ?AUTO_52 ?AUTO_55 ) ( CLEAR ?AUTO_52 ) ( not ( = ?AUTO_52 ?AUTO_55 ) ) ( not ( = ?AUTO_53 ?AUTO_55 ) ) ( not ( = ?AUTO_52 ?AUTO_54 ) ) ( not ( = ?AUTO_53 ?AUTO_54 ) ) ( not ( = ?AUTO_55 ?AUTO_54 ) ) ( ON ?AUTO_54 ?AUTO_53 ) ( CLEAR ?AUTO_54 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_54 ?AUTO_53 )
      ( MAKE-ON ?AUTO_52 ?AUTO_53 )
      ( MAKE-ON-VERIFY ?AUTO_52 ?AUTO_53 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_56 - BLOCK
      ?AUTO_57 - BLOCK
    )
    :vars
    (
      ?AUTO_59 - BLOCK
      ?AUTO_58 - BLOCK
      ?AUTO_60 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_56 ?AUTO_57 ) ) ( ON ?AUTO_56 ?AUTO_59 ) ( CLEAR ?AUTO_56 ) ( not ( = ?AUTO_56 ?AUTO_59 ) ) ( not ( = ?AUTO_57 ?AUTO_59 ) ) ( not ( = ?AUTO_56 ?AUTO_58 ) ) ( not ( = ?AUTO_57 ?AUTO_58 ) ) ( not ( = ?AUTO_59 ?AUTO_58 ) ) ( ON ?AUTO_58 ?AUTO_57 ) ( CLEAR ?AUTO_58 ) ( HOLDING ?AUTO_60 ) ( not ( = ?AUTO_56 ?AUTO_60 ) ) ( not ( = ?AUTO_57 ?AUTO_60 ) ) ( not ( = ?AUTO_59 ?AUTO_60 ) ) ( not ( = ?AUTO_58 ?AUTO_60 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_60 )
      ( MAKE-ON ?AUTO_56 ?AUTO_57 )
      ( MAKE-ON-VERIFY ?AUTO_56 ?AUTO_57 ) )
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
      ?AUTO_65 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_61 ?AUTO_62 ) ) ( ON ?AUTO_61 ?AUTO_64 ) ( CLEAR ?AUTO_61 ) ( not ( = ?AUTO_61 ?AUTO_64 ) ) ( not ( = ?AUTO_62 ?AUTO_64 ) ) ( not ( = ?AUTO_61 ?AUTO_63 ) ) ( not ( = ?AUTO_62 ?AUTO_63 ) ) ( not ( = ?AUTO_64 ?AUTO_63 ) ) ( ON ?AUTO_63 ?AUTO_62 ) ( not ( = ?AUTO_61 ?AUTO_65 ) ) ( not ( = ?AUTO_62 ?AUTO_65 ) ) ( not ( = ?AUTO_64 ?AUTO_65 ) ) ( not ( = ?AUTO_63 ?AUTO_65 ) ) ( ON ?AUTO_65 ?AUTO_63 ) ( CLEAR ?AUTO_65 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_65 ?AUTO_63 )
      ( MAKE-ON ?AUTO_61 ?AUTO_62 )
      ( MAKE-ON-VERIFY ?AUTO_61 ?AUTO_62 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_68 - BLOCK
      ?AUTO_69 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_68 ) ( CLEAR ?AUTO_69 ) ( not ( = ?AUTO_68 ?AUTO_69 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_68 ?AUTO_69 )
      ( MAKE-ON-VERIFY ?AUTO_68 ?AUTO_69 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_70 - BLOCK
      ?AUTO_71 - BLOCK
    )
    :vars
    (
      ?AUTO_72 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_71 ) ( not ( = ?AUTO_70 ?AUTO_71 ) ) ( ON ?AUTO_70 ?AUTO_72 ) ( CLEAR ?AUTO_70 ) ( HAND-EMPTY ) ( not ( = ?AUTO_70 ?AUTO_72 ) ) ( not ( = ?AUTO_71 ?AUTO_72 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_70 ?AUTO_72 )
      ( MAKE-ON ?AUTO_70 ?AUTO_71 )
      ( MAKE-ON-VERIFY ?AUTO_70 ?AUTO_71 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_73 - BLOCK
      ?AUTO_74 - BLOCK
    )
    :vars
    (
      ?AUTO_75 - BLOCK
      ?AUTO_76 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_73 ?AUTO_74 ) ) ( ON ?AUTO_73 ?AUTO_75 ) ( CLEAR ?AUTO_73 ) ( not ( = ?AUTO_73 ?AUTO_75 ) ) ( not ( = ?AUTO_74 ?AUTO_75 ) ) ( HOLDING ?AUTO_74 ) ( CLEAR ?AUTO_76 ) ( not ( = ?AUTO_73 ?AUTO_76 ) ) ( not ( = ?AUTO_74 ?AUTO_76 ) ) ( not ( = ?AUTO_75 ?AUTO_76 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_74 ?AUTO_76 )
      ( MAKE-ON ?AUTO_73 ?AUTO_74 )
      ( MAKE-ON-VERIFY ?AUTO_73 ?AUTO_74 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_77 - BLOCK
      ?AUTO_78 - BLOCK
    )
    :vars
    (
      ?AUTO_79 - BLOCK
      ?AUTO_80 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_77 ?AUTO_78 ) ) ( ON ?AUTO_77 ?AUTO_79 ) ( not ( = ?AUTO_77 ?AUTO_79 ) ) ( not ( = ?AUTO_78 ?AUTO_79 ) ) ( CLEAR ?AUTO_80 ) ( not ( = ?AUTO_77 ?AUTO_80 ) ) ( not ( = ?AUTO_78 ?AUTO_80 ) ) ( not ( = ?AUTO_79 ?AUTO_80 ) ) ( ON ?AUTO_78 ?AUTO_77 ) ( CLEAR ?AUTO_78 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_78 ?AUTO_77 )
      ( MAKE-ON ?AUTO_77 ?AUTO_78 )
      ( MAKE-ON-VERIFY ?AUTO_77 ?AUTO_78 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_81 - BLOCK
      ?AUTO_82 - BLOCK
    )
    :vars
    (
      ?AUTO_83 - BLOCK
      ?AUTO_84 - BLOCK
      ?AUTO_85 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_81 ?AUTO_82 ) ) ( ON ?AUTO_81 ?AUTO_83 ) ( not ( = ?AUTO_81 ?AUTO_83 ) ) ( not ( = ?AUTO_82 ?AUTO_83 ) ) ( not ( = ?AUTO_81 ?AUTO_84 ) ) ( not ( = ?AUTO_82 ?AUTO_84 ) ) ( not ( = ?AUTO_83 ?AUTO_84 ) ) ( ON ?AUTO_82 ?AUTO_81 ) ( CLEAR ?AUTO_82 ) ( HOLDING ?AUTO_84 ) ( CLEAR ?AUTO_85 ) ( not ( = ?AUTO_81 ?AUTO_85 ) ) ( not ( = ?AUTO_82 ?AUTO_85 ) ) ( not ( = ?AUTO_83 ?AUTO_85 ) ) ( not ( = ?AUTO_84 ?AUTO_85 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_84 ?AUTO_85 )
      ( MAKE-ON ?AUTO_81 ?AUTO_82 )
      ( MAKE-ON-VERIFY ?AUTO_81 ?AUTO_82 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_97 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_97 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_97 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_97 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_98 - BLOCK
    )
    :vars
    (
      ?AUTO_99 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_98 ?AUTO_99 ) ( CLEAR ?AUTO_98 ) ( HAND-EMPTY ) ( not ( = ?AUTO_98 ?AUTO_99 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_98 ?AUTO_99 )
      ( MAKE-ON-TABLE ?AUTO_98 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_98 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_100 - BLOCK
    )
    :vars
    (
      ?AUTO_101 - BLOCK
      ?AUTO_102 - BLOCK
      ?AUTO_103 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_100 ?AUTO_101 ) ( CLEAR ?AUTO_100 ) ( not ( = ?AUTO_100 ?AUTO_101 ) ) ( HOLDING ?AUTO_102 ) ( CLEAR ?AUTO_103 ) ( not ( = ?AUTO_100 ?AUTO_102 ) ) ( not ( = ?AUTO_100 ?AUTO_103 ) ) ( not ( = ?AUTO_101 ?AUTO_102 ) ) ( not ( = ?AUTO_101 ?AUTO_103 ) ) ( not ( = ?AUTO_102 ?AUTO_103 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_102 ?AUTO_103 )
      ( MAKE-ON-TABLE ?AUTO_100 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_100 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_104 - BLOCK
    )
    :vars
    (
      ?AUTO_105 - BLOCK
      ?AUTO_107 - BLOCK
      ?AUTO_106 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_104 ?AUTO_105 ) ( not ( = ?AUTO_104 ?AUTO_105 ) ) ( CLEAR ?AUTO_107 ) ( not ( = ?AUTO_104 ?AUTO_106 ) ) ( not ( = ?AUTO_104 ?AUTO_107 ) ) ( not ( = ?AUTO_105 ?AUTO_106 ) ) ( not ( = ?AUTO_105 ?AUTO_107 ) ) ( not ( = ?AUTO_106 ?AUTO_107 ) ) ( ON ?AUTO_106 ?AUTO_104 ) ( CLEAR ?AUTO_106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_106 ?AUTO_104 )
      ( MAKE-ON-TABLE ?AUTO_104 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_104 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
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
    ( and ( ON ?AUTO_108 ?AUTO_109 ) ( not ( = ?AUTO_108 ?AUTO_109 ) ) ( not ( = ?AUTO_108 ?AUTO_110 ) ) ( not ( = ?AUTO_108 ?AUTO_111 ) ) ( not ( = ?AUTO_109 ?AUTO_110 ) ) ( not ( = ?AUTO_109 ?AUTO_111 ) ) ( not ( = ?AUTO_110 ?AUTO_111 ) ) ( ON ?AUTO_110 ?AUTO_108 ) ( CLEAR ?AUTO_110 ) ( HOLDING ?AUTO_111 ) ( CLEAR ?AUTO_112 ) ( not ( = ?AUTO_108 ?AUTO_112 ) ) ( not ( = ?AUTO_109 ?AUTO_112 ) ) ( not ( = ?AUTO_110 ?AUTO_112 ) ) ( not ( = ?AUTO_111 ?AUTO_112 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_111 ?AUTO_112 )
      ( MAKE-ON-TABLE ?AUTO_108 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_108 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_113 - BLOCK
    )
    :vars
    (
      ?AUTO_115 - BLOCK
      ?AUTO_114 - BLOCK
      ?AUTO_117 - BLOCK
      ?AUTO_116 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_113 ?AUTO_115 ) ( not ( = ?AUTO_113 ?AUTO_115 ) ) ( not ( = ?AUTO_113 ?AUTO_114 ) ) ( not ( = ?AUTO_113 ?AUTO_117 ) ) ( not ( = ?AUTO_115 ?AUTO_114 ) ) ( not ( = ?AUTO_115 ?AUTO_117 ) ) ( not ( = ?AUTO_114 ?AUTO_117 ) ) ( ON ?AUTO_114 ?AUTO_113 ) ( CLEAR ?AUTO_116 ) ( not ( = ?AUTO_113 ?AUTO_116 ) ) ( not ( = ?AUTO_115 ?AUTO_116 ) ) ( not ( = ?AUTO_114 ?AUTO_116 ) ) ( not ( = ?AUTO_117 ?AUTO_116 ) ) ( ON ?AUTO_117 ?AUTO_114 ) ( CLEAR ?AUTO_117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_117 ?AUTO_114 )
      ( MAKE-ON-TABLE ?AUTO_113 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_113 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_118 - BLOCK
    )
    :vars
    (
      ?AUTO_119 - BLOCK
      ?AUTO_122 - BLOCK
      ?AUTO_120 - BLOCK
      ?AUTO_121 - BLOCK
      ?AUTO_123 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_118 ?AUTO_119 ) ( not ( = ?AUTO_118 ?AUTO_119 ) ) ( not ( = ?AUTO_118 ?AUTO_122 ) ) ( not ( = ?AUTO_118 ?AUTO_120 ) ) ( not ( = ?AUTO_119 ?AUTO_122 ) ) ( not ( = ?AUTO_119 ?AUTO_120 ) ) ( not ( = ?AUTO_122 ?AUTO_120 ) ) ( ON ?AUTO_122 ?AUTO_118 ) ( not ( = ?AUTO_118 ?AUTO_121 ) ) ( not ( = ?AUTO_119 ?AUTO_121 ) ) ( not ( = ?AUTO_122 ?AUTO_121 ) ) ( not ( = ?AUTO_120 ?AUTO_121 ) ) ( ON ?AUTO_120 ?AUTO_122 ) ( CLEAR ?AUTO_120 ) ( HOLDING ?AUTO_121 ) ( CLEAR ?AUTO_123 ) ( not ( = ?AUTO_118 ?AUTO_123 ) ) ( not ( = ?AUTO_119 ?AUTO_123 ) ) ( not ( = ?AUTO_122 ?AUTO_123 ) ) ( not ( = ?AUTO_120 ?AUTO_123 ) ) ( not ( = ?AUTO_121 ?AUTO_123 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_121 ?AUTO_123 )
      ( MAKE-ON-TABLE ?AUTO_118 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_118 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_130 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_130 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_130 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_130 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_131 - BLOCK
    )
    :vars
    (
      ?AUTO_132 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_131 ?AUTO_132 ) ( CLEAR ?AUTO_131 ) ( HAND-EMPTY ) ( not ( = ?AUTO_131 ?AUTO_132 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_131 ?AUTO_132 )
      ( MAKE-ON-TABLE ?AUTO_131 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_131 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_133 - BLOCK
    )
    :vars
    (
      ?AUTO_134 - BLOCK
      ?AUTO_135 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_133 ?AUTO_134 ) ( CLEAR ?AUTO_133 ) ( not ( = ?AUTO_133 ?AUTO_134 ) ) ( HOLDING ?AUTO_135 ) ( not ( = ?AUTO_133 ?AUTO_135 ) ) ( not ( = ?AUTO_134 ?AUTO_135 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_135 )
      ( MAKE-ON-TABLE ?AUTO_133 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_133 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_136 - BLOCK
    )
    :vars
    (
      ?AUTO_137 - BLOCK
      ?AUTO_138 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_136 ?AUTO_137 ) ( not ( = ?AUTO_136 ?AUTO_137 ) ) ( not ( = ?AUTO_136 ?AUTO_138 ) ) ( not ( = ?AUTO_137 ?AUTO_138 ) ) ( ON ?AUTO_138 ?AUTO_136 ) ( CLEAR ?AUTO_138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_138 ?AUTO_136 )
      ( MAKE-ON-TABLE ?AUTO_136 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_136 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_139 - BLOCK
    )
    :vars
    (
      ?AUTO_140 - BLOCK
      ?AUTO_141 - BLOCK
      ?AUTO_142 - BLOCK
      ?AUTO_143 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_139 ?AUTO_140 ) ( not ( = ?AUTO_139 ?AUTO_140 ) ) ( not ( = ?AUTO_139 ?AUTO_141 ) ) ( not ( = ?AUTO_140 ?AUTO_141 ) ) ( ON ?AUTO_141 ?AUTO_139 ) ( CLEAR ?AUTO_141 ) ( HOLDING ?AUTO_142 ) ( CLEAR ?AUTO_143 ) ( not ( = ?AUTO_139 ?AUTO_142 ) ) ( not ( = ?AUTO_139 ?AUTO_143 ) ) ( not ( = ?AUTO_140 ?AUTO_142 ) ) ( not ( = ?AUTO_140 ?AUTO_143 ) ) ( not ( = ?AUTO_141 ?AUTO_142 ) ) ( not ( = ?AUTO_141 ?AUTO_143 ) ) ( not ( = ?AUTO_142 ?AUTO_143 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_142 ?AUTO_143 )
      ( MAKE-ON-TABLE ?AUTO_139 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_139 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_144 - BLOCK
    )
    :vars
    (
      ?AUTO_145 - BLOCK
      ?AUTO_146 - BLOCK
      ?AUTO_147 - BLOCK
      ?AUTO_148 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_144 ?AUTO_145 ) ( not ( = ?AUTO_144 ?AUTO_145 ) ) ( not ( = ?AUTO_144 ?AUTO_146 ) ) ( not ( = ?AUTO_145 ?AUTO_146 ) ) ( ON ?AUTO_146 ?AUTO_144 ) ( CLEAR ?AUTO_147 ) ( not ( = ?AUTO_144 ?AUTO_148 ) ) ( not ( = ?AUTO_144 ?AUTO_147 ) ) ( not ( = ?AUTO_145 ?AUTO_148 ) ) ( not ( = ?AUTO_145 ?AUTO_147 ) ) ( not ( = ?AUTO_146 ?AUTO_148 ) ) ( not ( = ?AUTO_146 ?AUTO_147 ) ) ( not ( = ?AUTO_148 ?AUTO_147 ) ) ( ON ?AUTO_148 ?AUTO_146 ) ( CLEAR ?AUTO_148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_148 ?AUTO_146 )
      ( MAKE-ON-TABLE ?AUTO_144 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_144 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_149 - BLOCK
    )
    :vars
    (
      ?AUTO_152 - BLOCK
      ?AUTO_151 - BLOCK
      ?AUTO_153 - BLOCK
      ?AUTO_150 - BLOCK
      ?AUTO_154 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_149 ?AUTO_152 ) ( not ( = ?AUTO_149 ?AUTO_152 ) ) ( not ( = ?AUTO_149 ?AUTO_151 ) ) ( not ( = ?AUTO_152 ?AUTO_151 ) ) ( ON ?AUTO_151 ?AUTO_149 ) ( not ( = ?AUTO_149 ?AUTO_153 ) ) ( not ( = ?AUTO_149 ?AUTO_150 ) ) ( not ( = ?AUTO_152 ?AUTO_153 ) ) ( not ( = ?AUTO_152 ?AUTO_150 ) ) ( not ( = ?AUTO_151 ?AUTO_153 ) ) ( not ( = ?AUTO_151 ?AUTO_150 ) ) ( not ( = ?AUTO_153 ?AUTO_150 ) ) ( ON ?AUTO_153 ?AUTO_151 ) ( CLEAR ?AUTO_153 ) ( HOLDING ?AUTO_150 ) ( CLEAR ?AUTO_154 ) ( not ( = ?AUTO_149 ?AUTO_154 ) ) ( not ( = ?AUTO_152 ?AUTO_154 ) ) ( not ( = ?AUTO_151 ?AUTO_154 ) ) ( not ( = ?AUTO_153 ?AUTO_154 ) ) ( not ( = ?AUTO_150 ?AUTO_154 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_150 ?AUTO_154 )
      ( MAKE-ON-TABLE ?AUTO_149 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_149 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_155 - BLOCK
    )
    :vars
    (
      ?AUTO_160 - BLOCK
      ?AUTO_157 - BLOCK
      ?AUTO_156 - BLOCK
      ?AUTO_158 - BLOCK
      ?AUTO_159 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_155 ?AUTO_160 ) ( not ( = ?AUTO_155 ?AUTO_160 ) ) ( not ( = ?AUTO_155 ?AUTO_157 ) ) ( not ( = ?AUTO_160 ?AUTO_157 ) ) ( ON ?AUTO_157 ?AUTO_155 ) ( not ( = ?AUTO_155 ?AUTO_156 ) ) ( not ( = ?AUTO_155 ?AUTO_158 ) ) ( not ( = ?AUTO_160 ?AUTO_156 ) ) ( not ( = ?AUTO_160 ?AUTO_158 ) ) ( not ( = ?AUTO_157 ?AUTO_156 ) ) ( not ( = ?AUTO_157 ?AUTO_158 ) ) ( not ( = ?AUTO_156 ?AUTO_158 ) ) ( ON ?AUTO_156 ?AUTO_157 ) ( CLEAR ?AUTO_159 ) ( not ( = ?AUTO_155 ?AUTO_159 ) ) ( not ( = ?AUTO_160 ?AUTO_159 ) ) ( not ( = ?AUTO_157 ?AUTO_159 ) ) ( not ( = ?AUTO_156 ?AUTO_159 ) ) ( not ( = ?AUTO_158 ?AUTO_159 ) ) ( ON ?AUTO_158 ?AUTO_156 ) ( CLEAR ?AUTO_158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_158 ?AUTO_156 )
      ( MAKE-ON-TABLE ?AUTO_155 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_155 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_161 - BLOCK
    )
    :vars
    (
      ?AUTO_166 - BLOCK
      ?AUTO_163 - BLOCK
      ?AUTO_162 - BLOCK
      ?AUTO_164 - BLOCK
      ?AUTO_165 - BLOCK
      ?AUTO_167 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_161 ?AUTO_166 ) ( not ( = ?AUTO_161 ?AUTO_166 ) ) ( not ( = ?AUTO_161 ?AUTO_163 ) ) ( not ( = ?AUTO_166 ?AUTO_163 ) ) ( ON ?AUTO_163 ?AUTO_161 ) ( not ( = ?AUTO_161 ?AUTO_162 ) ) ( not ( = ?AUTO_161 ?AUTO_164 ) ) ( not ( = ?AUTO_166 ?AUTO_162 ) ) ( not ( = ?AUTO_166 ?AUTO_164 ) ) ( not ( = ?AUTO_163 ?AUTO_162 ) ) ( not ( = ?AUTO_163 ?AUTO_164 ) ) ( not ( = ?AUTO_162 ?AUTO_164 ) ) ( ON ?AUTO_162 ?AUTO_163 ) ( not ( = ?AUTO_161 ?AUTO_165 ) ) ( not ( = ?AUTO_166 ?AUTO_165 ) ) ( not ( = ?AUTO_163 ?AUTO_165 ) ) ( not ( = ?AUTO_162 ?AUTO_165 ) ) ( not ( = ?AUTO_164 ?AUTO_165 ) ) ( ON ?AUTO_164 ?AUTO_162 ) ( CLEAR ?AUTO_164 ) ( HOLDING ?AUTO_165 ) ( CLEAR ?AUTO_167 ) ( not ( = ?AUTO_161 ?AUTO_167 ) ) ( not ( = ?AUTO_166 ?AUTO_167 ) ) ( not ( = ?AUTO_163 ?AUTO_167 ) ) ( not ( = ?AUTO_162 ?AUTO_167 ) ) ( not ( = ?AUTO_164 ?AUTO_167 ) ) ( not ( = ?AUTO_165 ?AUTO_167 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_165 ?AUTO_167 )
      ( MAKE-ON-TABLE ?AUTO_161 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_161 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_175 - BLOCK
      ?AUTO_176 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_175 ) ( CLEAR ?AUTO_176 ) ( not ( = ?AUTO_175 ?AUTO_176 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_175 ?AUTO_176 )
      ( MAKE-ON-VERIFY ?AUTO_175 ?AUTO_176 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_177 - BLOCK
      ?AUTO_178 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_178 ) ( not ( = ?AUTO_177 ?AUTO_178 ) ) ( ON-TABLE ?AUTO_177 ) ( CLEAR ?AUTO_177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_177 )
      ( MAKE-ON ?AUTO_177 ?AUTO_178 )
      ( MAKE-ON-VERIFY ?AUTO_177 ?AUTO_178 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_179 - BLOCK
      ?AUTO_180 - BLOCK
    )
    :vars
    (
      ?AUTO_181 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_180 ) ( not ( = ?AUTO_179 ?AUTO_180 ) ) ( ON-TABLE ?AUTO_179 ) ( CLEAR ?AUTO_179 ) ( HOLDING ?AUTO_181 ) ( not ( = ?AUTO_179 ?AUTO_181 ) ) ( not ( = ?AUTO_180 ?AUTO_181 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_181 )
      ( MAKE-ON ?AUTO_179 ?AUTO_180 )
      ( MAKE-ON-VERIFY ?AUTO_179 ?AUTO_180 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_182 - BLOCK
      ?AUTO_183 - BLOCK
    )
    :vars
    (
      ?AUTO_184 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_183 ) ( not ( = ?AUTO_182 ?AUTO_183 ) ) ( ON-TABLE ?AUTO_182 ) ( not ( = ?AUTO_182 ?AUTO_184 ) ) ( not ( = ?AUTO_183 ?AUTO_184 ) ) ( ON ?AUTO_184 ?AUTO_182 ) ( CLEAR ?AUTO_184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_184 ?AUTO_182 )
      ( MAKE-ON ?AUTO_182 ?AUTO_183 )
      ( MAKE-ON-VERIFY ?AUTO_182 ?AUTO_183 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_185 - BLOCK
      ?AUTO_186 - BLOCK
    )
    :vars
    (
      ?AUTO_187 - BLOCK
      ?AUTO_188 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_186 ) ( not ( = ?AUTO_185 ?AUTO_186 ) ) ( ON-TABLE ?AUTO_185 ) ( not ( = ?AUTO_185 ?AUTO_187 ) ) ( not ( = ?AUTO_186 ?AUTO_187 ) ) ( ON ?AUTO_187 ?AUTO_185 ) ( CLEAR ?AUTO_187 ) ( HOLDING ?AUTO_188 ) ( not ( = ?AUTO_185 ?AUTO_188 ) ) ( not ( = ?AUTO_186 ?AUTO_188 ) ) ( not ( = ?AUTO_187 ?AUTO_188 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_188 )
      ( MAKE-ON ?AUTO_185 ?AUTO_186 )
      ( MAKE-ON-VERIFY ?AUTO_185 ?AUTO_186 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_189 - BLOCK
      ?AUTO_190 - BLOCK
    )
    :vars
    (
      ?AUTO_191 - BLOCK
      ?AUTO_192 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_190 ) ( not ( = ?AUTO_189 ?AUTO_190 ) ) ( ON-TABLE ?AUTO_189 ) ( not ( = ?AUTO_189 ?AUTO_191 ) ) ( not ( = ?AUTO_190 ?AUTO_191 ) ) ( ON ?AUTO_191 ?AUTO_189 ) ( not ( = ?AUTO_189 ?AUTO_192 ) ) ( not ( = ?AUTO_190 ?AUTO_192 ) ) ( not ( = ?AUTO_191 ?AUTO_192 ) ) ( ON ?AUTO_192 ?AUTO_191 ) ( CLEAR ?AUTO_192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_192 ?AUTO_191 )
      ( MAKE-ON ?AUTO_189 ?AUTO_190 )
      ( MAKE-ON-VERIFY ?AUTO_189 ?AUTO_190 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_193 - BLOCK
      ?AUTO_194 - BLOCK
    )
    :vars
    (
      ?AUTO_195 - BLOCK
      ?AUTO_196 - BLOCK
      ?AUTO_197 - BLOCK
      ?AUTO_198 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_194 ) ( not ( = ?AUTO_193 ?AUTO_194 ) ) ( ON-TABLE ?AUTO_193 ) ( not ( = ?AUTO_193 ?AUTO_195 ) ) ( not ( = ?AUTO_194 ?AUTO_195 ) ) ( ON ?AUTO_195 ?AUTO_193 ) ( not ( = ?AUTO_193 ?AUTO_196 ) ) ( not ( = ?AUTO_194 ?AUTO_196 ) ) ( not ( = ?AUTO_195 ?AUTO_196 ) ) ( ON ?AUTO_196 ?AUTO_195 ) ( CLEAR ?AUTO_196 ) ( HOLDING ?AUTO_197 ) ( CLEAR ?AUTO_198 ) ( not ( = ?AUTO_193 ?AUTO_197 ) ) ( not ( = ?AUTO_193 ?AUTO_198 ) ) ( not ( = ?AUTO_194 ?AUTO_197 ) ) ( not ( = ?AUTO_194 ?AUTO_198 ) ) ( not ( = ?AUTO_195 ?AUTO_197 ) ) ( not ( = ?AUTO_195 ?AUTO_198 ) ) ( not ( = ?AUTO_196 ?AUTO_197 ) ) ( not ( = ?AUTO_196 ?AUTO_198 ) ) ( not ( = ?AUTO_197 ?AUTO_198 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_197 ?AUTO_198 )
      ( MAKE-ON ?AUTO_193 ?AUTO_194 )
      ( MAKE-ON-VERIFY ?AUTO_193 ?AUTO_194 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_199 - BLOCK
      ?AUTO_200 - BLOCK
    )
    :vars
    (
      ?AUTO_201 - BLOCK
      ?AUTO_202 - BLOCK
      ?AUTO_204 - BLOCK
      ?AUTO_203 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_200 ) ( not ( = ?AUTO_199 ?AUTO_200 ) ) ( ON-TABLE ?AUTO_199 ) ( not ( = ?AUTO_199 ?AUTO_201 ) ) ( not ( = ?AUTO_200 ?AUTO_201 ) ) ( ON ?AUTO_201 ?AUTO_199 ) ( not ( = ?AUTO_199 ?AUTO_202 ) ) ( not ( = ?AUTO_200 ?AUTO_202 ) ) ( not ( = ?AUTO_201 ?AUTO_202 ) ) ( ON ?AUTO_202 ?AUTO_201 ) ( CLEAR ?AUTO_204 ) ( not ( = ?AUTO_199 ?AUTO_203 ) ) ( not ( = ?AUTO_199 ?AUTO_204 ) ) ( not ( = ?AUTO_200 ?AUTO_203 ) ) ( not ( = ?AUTO_200 ?AUTO_204 ) ) ( not ( = ?AUTO_201 ?AUTO_203 ) ) ( not ( = ?AUTO_201 ?AUTO_204 ) ) ( not ( = ?AUTO_202 ?AUTO_203 ) ) ( not ( = ?AUTO_202 ?AUTO_204 ) ) ( not ( = ?AUTO_203 ?AUTO_204 ) ) ( ON ?AUTO_203 ?AUTO_202 ) ( CLEAR ?AUTO_203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_203 ?AUTO_202 )
      ( MAKE-ON ?AUTO_199 ?AUTO_200 )
      ( MAKE-ON-VERIFY ?AUTO_199 ?AUTO_200 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_205 - BLOCK
      ?AUTO_206 - BLOCK
    )
    :vars
    (
      ?AUTO_208 - BLOCK
      ?AUTO_207 - BLOCK
      ?AUTO_209 - BLOCK
      ?AUTO_210 - BLOCK
      ?AUTO_211 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_206 ) ( not ( = ?AUTO_205 ?AUTO_206 ) ) ( ON-TABLE ?AUTO_205 ) ( not ( = ?AUTO_205 ?AUTO_208 ) ) ( not ( = ?AUTO_206 ?AUTO_208 ) ) ( ON ?AUTO_208 ?AUTO_205 ) ( not ( = ?AUTO_205 ?AUTO_207 ) ) ( not ( = ?AUTO_206 ?AUTO_207 ) ) ( not ( = ?AUTO_208 ?AUTO_207 ) ) ( ON ?AUTO_207 ?AUTO_208 ) ( not ( = ?AUTO_205 ?AUTO_209 ) ) ( not ( = ?AUTO_205 ?AUTO_210 ) ) ( not ( = ?AUTO_206 ?AUTO_209 ) ) ( not ( = ?AUTO_206 ?AUTO_210 ) ) ( not ( = ?AUTO_208 ?AUTO_209 ) ) ( not ( = ?AUTO_208 ?AUTO_210 ) ) ( not ( = ?AUTO_207 ?AUTO_209 ) ) ( not ( = ?AUTO_207 ?AUTO_210 ) ) ( not ( = ?AUTO_209 ?AUTO_210 ) ) ( ON ?AUTO_209 ?AUTO_207 ) ( CLEAR ?AUTO_209 ) ( HOLDING ?AUTO_210 ) ( CLEAR ?AUTO_211 ) ( not ( = ?AUTO_205 ?AUTO_211 ) ) ( not ( = ?AUTO_206 ?AUTO_211 ) ) ( not ( = ?AUTO_208 ?AUTO_211 ) ) ( not ( = ?AUTO_207 ?AUTO_211 ) ) ( not ( = ?AUTO_209 ?AUTO_211 ) ) ( not ( = ?AUTO_210 ?AUTO_211 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_210 ?AUTO_211 )
      ( MAKE-ON ?AUTO_205 ?AUTO_206 )
      ( MAKE-ON-VERIFY ?AUTO_205 ?AUTO_206 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_212 - BLOCK
      ?AUTO_213 - BLOCK
    )
    :vars
    (
      ?AUTO_216 - BLOCK
      ?AUTO_214 - BLOCK
      ?AUTO_217 - BLOCK
      ?AUTO_215 - BLOCK
      ?AUTO_218 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_213 ) ( not ( = ?AUTO_212 ?AUTO_213 ) ) ( ON-TABLE ?AUTO_212 ) ( not ( = ?AUTO_212 ?AUTO_216 ) ) ( not ( = ?AUTO_213 ?AUTO_216 ) ) ( ON ?AUTO_216 ?AUTO_212 ) ( not ( = ?AUTO_212 ?AUTO_214 ) ) ( not ( = ?AUTO_213 ?AUTO_214 ) ) ( not ( = ?AUTO_216 ?AUTO_214 ) ) ( ON ?AUTO_214 ?AUTO_216 ) ( not ( = ?AUTO_212 ?AUTO_217 ) ) ( not ( = ?AUTO_212 ?AUTO_215 ) ) ( not ( = ?AUTO_213 ?AUTO_217 ) ) ( not ( = ?AUTO_213 ?AUTO_215 ) ) ( not ( = ?AUTO_216 ?AUTO_217 ) ) ( not ( = ?AUTO_216 ?AUTO_215 ) ) ( not ( = ?AUTO_214 ?AUTO_217 ) ) ( not ( = ?AUTO_214 ?AUTO_215 ) ) ( not ( = ?AUTO_217 ?AUTO_215 ) ) ( ON ?AUTO_217 ?AUTO_214 ) ( CLEAR ?AUTO_218 ) ( not ( = ?AUTO_212 ?AUTO_218 ) ) ( not ( = ?AUTO_213 ?AUTO_218 ) ) ( not ( = ?AUTO_216 ?AUTO_218 ) ) ( not ( = ?AUTO_214 ?AUTO_218 ) ) ( not ( = ?AUTO_217 ?AUTO_218 ) ) ( not ( = ?AUTO_215 ?AUTO_218 ) ) ( ON ?AUTO_215 ?AUTO_217 ) ( CLEAR ?AUTO_215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_215 ?AUTO_217 )
      ( MAKE-ON ?AUTO_212 ?AUTO_213 )
      ( MAKE-ON-VERIFY ?AUTO_212 ?AUTO_213 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_219 - BLOCK
      ?AUTO_220 - BLOCK
    )
    :vars
    (
      ?AUTO_223 - BLOCK
      ?AUTO_225 - BLOCK
      ?AUTO_221 - BLOCK
      ?AUTO_224 - BLOCK
      ?AUTO_222 - BLOCK
      ?AUTO_226 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_220 ) ( not ( = ?AUTO_219 ?AUTO_220 ) ) ( ON-TABLE ?AUTO_219 ) ( not ( = ?AUTO_219 ?AUTO_223 ) ) ( not ( = ?AUTO_220 ?AUTO_223 ) ) ( ON ?AUTO_223 ?AUTO_219 ) ( not ( = ?AUTO_219 ?AUTO_225 ) ) ( not ( = ?AUTO_220 ?AUTO_225 ) ) ( not ( = ?AUTO_223 ?AUTO_225 ) ) ( ON ?AUTO_225 ?AUTO_223 ) ( not ( = ?AUTO_219 ?AUTO_221 ) ) ( not ( = ?AUTO_219 ?AUTO_224 ) ) ( not ( = ?AUTO_220 ?AUTO_221 ) ) ( not ( = ?AUTO_220 ?AUTO_224 ) ) ( not ( = ?AUTO_223 ?AUTO_221 ) ) ( not ( = ?AUTO_223 ?AUTO_224 ) ) ( not ( = ?AUTO_225 ?AUTO_221 ) ) ( not ( = ?AUTO_225 ?AUTO_224 ) ) ( not ( = ?AUTO_221 ?AUTO_224 ) ) ( ON ?AUTO_221 ?AUTO_225 ) ( not ( = ?AUTO_219 ?AUTO_222 ) ) ( not ( = ?AUTO_220 ?AUTO_222 ) ) ( not ( = ?AUTO_223 ?AUTO_222 ) ) ( not ( = ?AUTO_225 ?AUTO_222 ) ) ( not ( = ?AUTO_221 ?AUTO_222 ) ) ( not ( = ?AUTO_224 ?AUTO_222 ) ) ( ON ?AUTO_224 ?AUTO_221 ) ( CLEAR ?AUTO_224 ) ( HOLDING ?AUTO_222 ) ( CLEAR ?AUTO_226 ) ( not ( = ?AUTO_219 ?AUTO_226 ) ) ( not ( = ?AUTO_220 ?AUTO_226 ) ) ( not ( = ?AUTO_223 ?AUTO_226 ) ) ( not ( = ?AUTO_225 ?AUTO_226 ) ) ( not ( = ?AUTO_221 ?AUTO_226 ) ) ( not ( = ?AUTO_224 ?AUTO_226 ) ) ( not ( = ?AUTO_222 ?AUTO_226 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_222 ?AUTO_226 )
      ( MAKE-ON ?AUTO_219 ?AUTO_220 )
      ( MAKE-ON-VERIFY ?AUTO_219 ?AUTO_220 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_233 - BLOCK
      ?AUTO_234 - BLOCK
    )
    :vars
    (
      ?AUTO_237 - BLOCK
      ?AUTO_238 - BLOCK
      ?AUTO_239 - BLOCK
      ?AUTO_236 - BLOCK
      ?AUTO_235 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_233 ?AUTO_234 ) ) ( ON-TABLE ?AUTO_233 ) ( not ( = ?AUTO_233 ?AUTO_237 ) ) ( not ( = ?AUTO_234 ?AUTO_237 ) ) ( ON ?AUTO_237 ?AUTO_233 ) ( not ( = ?AUTO_233 ?AUTO_238 ) ) ( not ( = ?AUTO_234 ?AUTO_238 ) ) ( not ( = ?AUTO_237 ?AUTO_238 ) ) ( ON ?AUTO_238 ?AUTO_237 ) ( not ( = ?AUTO_233 ?AUTO_239 ) ) ( not ( = ?AUTO_233 ?AUTO_236 ) ) ( not ( = ?AUTO_234 ?AUTO_239 ) ) ( not ( = ?AUTO_234 ?AUTO_236 ) ) ( not ( = ?AUTO_237 ?AUTO_239 ) ) ( not ( = ?AUTO_237 ?AUTO_236 ) ) ( not ( = ?AUTO_238 ?AUTO_239 ) ) ( not ( = ?AUTO_238 ?AUTO_236 ) ) ( not ( = ?AUTO_239 ?AUTO_236 ) ) ( ON ?AUTO_239 ?AUTO_238 ) ( CLEAR ?AUTO_235 ) ( not ( = ?AUTO_233 ?AUTO_235 ) ) ( not ( = ?AUTO_234 ?AUTO_235 ) ) ( not ( = ?AUTO_237 ?AUTO_235 ) ) ( not ( = ?AUTO_238 ?AUTO_235 ) ) ( not ( = ?AUTO_239 ?AUTO_235 ) ) ( not ( = ?AUTO_236 ?AUTO_235 ) ) ( ON ?AUTO_236 ?AUTO_239 ) ( CLEAR ?AUTO_236 ) ( HOLDING ?AUTO_234 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_234 )
      ( MAKE-ON ?AUTO_233 ?AUTO_234 )
      ( MAKE-ON-VERIFY ?AUTO_233 ?AUTO_234 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_244 - BLOCK
      ?AUTO_245 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_244 ) ( CLEAR ?AUTO_245 ) ( not ( = ?AUTO_244 ?AUTO_245 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_244 ?AUTO_245 )
      ( MAKE-ON-VERIFY ?AUTO_244 ?AUTO_245 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_246 - BLOCK
      ?AUTO_247 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_247 ) ( not ( = ?AUTO_246 ?AUTO_247 ) ) ( ON-TABLE ?AUTO_246 ) ( CLEAR ?AUTO_246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_246 )
      ( MAKE-ON ?AUTO_246 ?AUTO_247 )
      ( MAKE-ON-VERIFY ?AUTO_246 ?AUTO_247 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_248 - BLOCK
      ?AUTO_249 - BLOCK
    )
    :vars
    (
      ?AUTO_250 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_248 ?AUTO_249 ) ) ( ON-TABLE ?AUTO_248 ) ( CLEAR ?AUTO_248 ) ( HOLDING ?AUTO_249 ) ( CLEAR ?AUTO_250 ) ( not ( = ?AUTO_248 ?AUTO_250 ) ) ( not ( = ?AUTO_249 ?AUTO_250 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_249 ?AUTO_250 )
      ( MAKE-ON ?AUTO_248 ?AUTO_249 )
      ( MAKE-ON-VERIFY ?AUTO_248 ?AUTO_249 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_255 - BLOCK
      ?AUTO_256 - BLOCK
    )
    :vars
    (
      ?AUTO_257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_255 ?AUTO_256 ) ) ( ON-TABLE ?AUTO_255 ) ( CLEAR ?AUTO_255 ) ( not ( = ?AUTO_255 ?AUTO_257 ) ) ( not ( = ?AUTO_256 ?AUTO_257 ) ) ( ON ?AUTO_257 ?AUTO_256 ) ( CLEAR ?AUTO_257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_257 ?AUTO_256 )
      ( MAKE-ON ?AUTO_255 ?AUTO_256 )
      ( MAKE-ON-VERIFY ?AUTO_255 ?AUTO_256 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_258 - BLOCK
      ?AUTO_259 - BLOCK
    )
    :vars
    (
      ?AUTO_260 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_258 ?AUTO_259 ) ) ( not ( = ?AUTO_258 ?AUTO_260 ) ) ( not ( = ?AUTO_259 ?AUTO_260 ) ) ( ON ?AUTO_260 ?AUTO_259 ) ( CLEAR ?AUTO_260 ) ( HOLDING ?AUTO_258 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_258 )
      ( MAKE-ON ?AUTO_258 ?AUTO_259 )
      ( MAKE-ON-VERIFY ?AUTO_258 ?AUTO_259 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_261 - BLOCK
      ?AUTO_262 - BLOCK
    )
    :vars
    (
      ?AUTO_263 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_261 ?AUTO_262 ) ) ( not ( = ?AUTO_261 ?AUTO_263 ) ) ( not ( = ?AUTO_262 ?AUTO_263 ) ) ( ON ?AUTO_263 ?AUTO_262 ) ( ON ?AUTO_261 ?AUTO_263 ) ( CLEAR ?AUTO_261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_261 ?AUTO_263 )
      ( MAKE-ON ?AUTO_261 ?AUTO_262 )
      ( MAKE-ON-VERIFY ?AUTO_261 ?AUTO_262 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_264 - BLOCK
      ?AUTO_265 - BLOCK
    )
    :vars
    (
      ?AUTO_266 - BLOCK
      ?AUTO_267 - BLOCK
      ?AUTO_268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_264 ?AUTO_265 ) ) ( not ( = ?AUTO_264 ?AUTO_266 ) ) ( not ( = ?AUTO_265 ?AUTO_266 ) ) ( ON ?AUTO_266 ?AUTO_265 ) ( ON ?AUTO_264 ?AUTO_266 ) ( CLEAR ?AUTO_264 ) ( HOLDING ?AUTO_267 ) ( CLEAR ?AUTO_268 ) ( not ( = ?AUTO_264 ?AUTO_267 ) ) ( not ( = ?AUTO_264 ?AUTO_268 ) ) ( not ( = ?AUTO_265 ?AUTO_267 ) ) ( not ( = ?AUTO_265 ?AUTO_268 ) ) ( not ( = ?AUTO_266 ?AUTO_267 ) ) ( not ( = ?AUTO_266 ?AUTO_268 ) ) ( not ( = ?AUTO_267 ?AUTO_268 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_267 ?AUTO_268 )
      ( MAKE-ON ?AUTO_264 ?AUTO_265 )
      ( MAKE-ON-VERIFY ?AUTO_264 ?AUTO_265 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_269 - BLOCK
      ?AUTO_270 - BLOCK
    )
    :vars
    (
      ?AUTO_271 - BLOCK
      ?AUTO_272 - BLOCK
      ?AUTO_273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_269 ?AUTO_270 ) ) ( not ( = ?AUTO_269 ?AUTO_271 ) ) ( not ( = ?AUTO_270 ?AUTO_271 ) ) ( ON ?AUTO_271 ?AUTO_270 ) ( ON ?AUTO_269 ?AUTO_271 ) ( CLEAR ?AUTO_272 ) ( not ( = ?AUTO_269 ?AUTO_273 ) ) ( not ( = ?AUTO_269 ?AUTO_272 ) ) ( not ( = ?AUTO_270 ?AUTO_273 ) ) ( not ( = ?AUTO_270 ?AUTO_272 ) ) ( not ( = ?AUTO_271 ?AUTO_273 ) ) ( not ( = ?AUTO_271 ?AUTO_272 ) ) ( not ( = ?AUTO_273 ?AUTO_272 ) ) ( ON ?AUTO_273 ?AUTO_269 ) ( CLEAR ?AUTO_273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_273 ?AUTO_269 )
      ( MAKE-ON ?AUTO_269 ?AUTO_270 )
      ( MAKE-ON-VERIFY ?AUTO_269 ?AUTO_270 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_274 - BLOCK
      ?AUTO_275 - BLOCK
    )
    :vars
    (
      ?AUTO_277 - BLOCK
      ?AUTO_276 - BLOCK
      ?AUTO_278 - BLOCK
      ?AUTO_279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_274 ?AUTO_275 ) ) ( not ( = ?AUTO_274 ?AUTO_277 ) ) ( not ( = ?AUTO_275 ?AUTO_277 ) ) ( ON ?AUTO_277 ?AUTO_275 ) ( ON ?AUTO_274 ?AUTO_277 ) ( not ( = ?AUTO_274 ?AUTO_276 ) ) ( not ( = ?AUTO_274 ?AUTO_278 ) ) ( not ( = ?AUTO_275 ?AUTO_276 ) ) ( not ( = ?AUTO_275 ?AUTO_278 ) ) ( not ( = ?AUTO_277 ?AUTO_276 ) ) ( not ( = ?AUTO_277 ?AUTO_278 ) ) ( not ( = ?AUTO_276 ?AUTO_278 ) ) ( ON ?AUTO_276 ?AUTO_274 ) ( CLEAR ?AUTO_276 ) ( HOLDING ?AUTO_278 ) ( CLEAR ?AUTO_279 ) ( not ( = ?AUTO_274 ?AUTO_279 ) ) ( not ( = ?AUTO_275 ?AUTO_279 ) ) ( not ( = ?AUTO_277 ?AUTO_279 ) ) ( not ( = ?AUTO_276 ?AUTO_279 ) ) ( not ( = ?AUTO_278 ?AUTO_279 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_278 ?AUTO_279 )
      ( MAKE-ON ?AUTO_274 ?AUTO_275 )
      ( MAKE-ON-VERIFY ?AUTO_274 ?AUTO_275 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_280 - BLOCK
      ?AUTO_281 - BLOCK
    )
    :vars
    (
      ?AUTO_282 - BLOCK
      ?AUTO_283 - BLOCK
      ?AUTO_285 - BLOCK
      ?AUTO_284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_280 ?AUTO_281 ) ) ( not ( = ?AUTO_280 ?AUTO_282 ) ) ( not ( = ?AUTO_281 ?AUTO_282 ) ) ( ON ?AUTO_282 ?AUTO_281 ) ( ON ?AUTO_280 ?AUTO_282 ) ( not ( = ?AUTO_280 ?AUTO_283 ) ) ( not ( = ?AUTO_280 ?AUTO_285 ) ) ( not ( = ?AUTO_281 ?AUTO_283 ) ) ( not ( = ?AUTO_281 ?AUTO_285 ) ) ( not ( = ?AUTO_282 ?AUTO_283 ) ) ( not ( = ?AUTO_282 ?AUTO_285 ) ) ( not ( = ?AUTO_283 ?AUTO_285 ) ) ( ON ?AUTO_283 ?AUTO_280 ) ( CLEAR ?AUTO_284 ) ( not ( = ?AUTO_280 ?AUTO_284 ) ) ( not ( = ?AUTO_281 ?AUTO_284 ) ) ( not ( = ?AUTO_282 ?AUTO_284 ) ) ( not ( = ?AUTO_283 ?AUTO_284 ) ) ( not ( = ?AUTO_285 ?AUTO_284 ) ) ( ON ?AUTO_285 ?AUTO_283 ) ( CLEAR ?AUTO_285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_285 ?AUTO_283 )
      ( MAKE-ON ?AUTO_280 ?AUTO_281 )
      ( MAKE-ON-VERIFY ?AUTO_280 ?AUTO_281 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_286 - BLOCK
      ?AUTO_287 - BLOCK
    )
    :vars
    (
      ?AUTO_289 - BLOCK
      ?AUTO_290 - BLOCK
      ?AUTO_291 - BLOCK
      ?AUTO_288 - BLOCK
      ?AUTO_292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_286 ?AUTO_287 ) ) ( not ( = ?AUTO_286 ?AUTO_289 ) ) ( not ( = ?AUTO_287 ?AUTO_289 ) ) ( ON ?AUTO_289 ?AUTO_287 ) ( ON ?AUTO_286 ?AUTO_289 ) ( not ( = ?AUTO_286 ?AUTO_290 ) ) ( not ( = ?AUTO_286 ?AUTO_291 ) ) ( not ( = ?AUTO_287 ?AUTO_290 ) ) ( not ( = ?AUTO_287 ?AUTO_291 ) ) ( not ( = ?AUTO_289 ?AUTO_290 ) ) ( not ( = ?AUTO_289 ?AUTO_291 ) ) ( not ( = ?AUTO_290 ?AUTO_291 ) ) ( ON ?AUTO_290 ?AUTO_286 ) ( not ( = ?AUTO_286 ?AUTO_288 ) ) ( not ( = ?AUTO_287 ?AUTO_288 ) ) ( not ( = ?AUTO_289 ?AUTO_288 ) ) ( not ( = ?AUTO_290 ?AUTO_288 ) ) ( not ( = ?AUTO_291 ?AUTO_288 ) ) ( ON ?AUTO_291 ?AUTO_290 ) ( CLEAR ?AUTO_291 ) ( HOLDING ?AUTO_288 ) ( CLEAR ?AUTO_292 ) ( not ( = ?AUTO_286 ?AUTO_292 ) ) ( not ( = ?AUTO_287 ?AUTO_292 ) ) ( not ( = ?AUTO_289 ?AUTO_292 ) ) ( not ( = ?AUTO_290 ?AUTO_292 ) ) ( not ( = ?AUTO_291 ?AUTO_292 ) ) ( not ( = ?AUTO_288 ?AUTO_292 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_288 ?AUTO_292 )
      ( MAKE-ON ?AUTO_286 ?AUTO_287 )
      ( MAKE-ON-VERIFY ?AUTO_286 ?AUTO_287 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_305 - BLOCK
      ?AUTO_306 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_305 ) ( CLEAR ?AUTO_306 ) ( not ( = ?AUTO_305 ?AUTO_306 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_305 ?AUTO_306 )
      ( MAKE-ON-VERIFY ?AUTO_305 ?AUTO_306 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_307 - BLOCK
      ?AUTO_308 - BLOCK
    )
    :vars
    (
      ?AUTO_309 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_308 ) ( not ( = ?AUTO_307 ?AUTO_308 ) ) ( ON ?AUTO_307 ?AUTO_309 ) ( CLEAR ?AUTO_307 ) ( HAND-EMPTY ) ( not ( = ?AUTO_307 ?AUTO_309 ) ) ( not ( = ?AUTO_308 ?AUTO_309 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_307 ?AUTO_309 )
      ( MAKE-ON ?AUTO_307 ?AUTO_308 )
      ( MAKE-ON-VERIFY ?AUTO_307 ?AUTO_308 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_310 - BLOCK
      ?AUTO_311 - BLOCK
    )
    :vars
    (
      ?AUTO_312 - BLOCK
      ?AUTO_313 - BLOCK
      ?AUTO_314 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_311 ) ( not ( = ?AUTO_310 ?AUTO_311 ) ) ( ON ?AUTO_310 ?AUTO_312 ) ( CLEAR ?AUTO_310 ) ( not ( = ?AUTO_310 ?AUTO_312 ) ) ( not ( = ?AUTO_311 ?AUTO_312 ) ) ( HOLDING ?AUTO_313 ) ( CLEAR ?AUTO_314 ) ( not ( = ?AUTO_310 ?AUTO_313 ) ) ( not ( = ?AUTO_310 ?AUTO_314 ) ) ( not ( = ?AUTO_311 ?AUTO_313 ) ) ( not ( = ?AUTO_311 ?AUTO_314 ) ) ( not ( = ?AUTO_312 ?AUTO_313 ) ) ( not ( = ?AUTO_312 ?AUTO_314 ) ) ( not ( = ?AUTO_313 ?AUTO_314 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_313 ?AUTO_314 )
      ( MAKE-ON ?AUTO_310 ?AUTO_311 )
      ( MAKE-ON-VERIFY ?AUTO_310 ?AUTO_311 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_321 - BLOCK
      ?AUTO_322 - BLOCK
    )
    :vars
    (
      ?AUTO_323 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_321 ?AUTO_322 ) ) ( ON ?AUTO_321 ?AUTO_323 ) ( CLEAR ?AUTO_321 ) ( not ( = ?AUTO_321 ?AUTO_323 ) ) ( not ( = ?AUTO_322 ?AUTO_323 ) ) ( HOLDING ?AUTO_322 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_322 )
      ( MAKE-ON ?AUTO_321 ?AUTO_322 )
      ( MAKE-ON-VERIFY ?AUTO_321 ?AUTO_322 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_328 - BLOCK
      ?AUTO_329 - BLOCK
    )
    :vars
    (
      ?AUTO_330 - BLOCK
      ?AUTO_331 - BLOCK
      ?AUTO_332 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_328 ?AUTO_329 ) ) ( ON ?AUTO_328 ?AUTO_330 ) ( CLEAR ?AUTO_328 ) ( not ( = ?AUTO_328 ?AUTO_330 ) ) ( not ( = ?AUTO_329 ?AUTO_330 ) ) ( CLEAR ?AUTO_331 ) ( not ( = ?AUTO_328 ?AUTO_332 ) ) ( not ( = ?AUTO_328 ?AUTO_331 ) ) ( not ( = ?AUTO_329 ?AUTO_332 ) ) ( not ( = ?AUTO_329 ?AUTO_331 ) ) ( not ( = ?AUTO_330 ?AUTO_332 ) ) ( not ( = ?AUTO_330 ?AUTO_331 ) ) ( not ( = ?AUTO_332 ?AUTO_331 ) ) ( ON ?AUTO_332 ?AUTO_329 ) ( CLEAR ?AUTO_332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_332 ?AUTO_329 )
      ( MAKE-ON ?AUTO_328 ?AUTO_329 )
      ( MAKE-ON-VERIFY ?AUTO_328 ?AUTO_329 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_355 - BLOCK
      ?AUTO_356 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_355 ) ( CLEAR ?AUTO_356 ) ( not ( = ?AUTO_355 ?AUTO_356 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_355 ?AUTO_356 )
      ( MAKE-ON-VERIFY ?AUTO_355 ?AUTO_356 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_357 - BLOCK
      ?AUTO_358 - BLOCK
    )
    :vars
    (
      ?AUTO_359 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_358 ) ( not ( = ?AUTO_357 ?AUTO_358 ) ) ( ON ?AUTO_357 ?AUTO_359 ) ( CLEAR ?AUTO_357 ) ( HAND-EMPTY ) ( not ( = ?AUTO_357 ?AUTO_359 ) ) ( not ( = ?AUTO_358 ?AUTO_359 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_357 ?AUTO_359 )
      ( MAKE-ON ?AUTO_357 ?AUTO_358 )
      ( MAKE-ON-VERIFY ?AUTO_357 ?AUTO_358 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_360 - BLOCK
      ?AUTO_361 - BLOCK
    )
    :vars
    (
      ?AUTO_362 - BLOCK
      ?AUTO_363 - BLOCK
      ?AUTO_364 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_361 ) ( not ( = ?AUTO_360 ?AUTO_361 ) ) ( ON ?AUTO_360 ?AUTO_362 ) ( CLEAR ?AUTO_360 ) ( not ( = ?AUTO_360 ?AUTO_362 ) ) ( not ( = ?AUTO_361 ?AUTO_362 ) ) ( HOLDING ?AUTO_363 ) ( CLEAR ?AUTO_364 ) ( not ( = ?AUTO_360 ?AUTO_363 ) ) ( not ( = ?AUTO_360 ?AUTO_364 ) ) ( not ( = ?AUTO_361 ?AUTO_363 ) ) ( not ( = ?AUTO_361 ?AUTO_364 ) ) ( not ( = ?AUTO_362 ?AUTO_363 ) ) ( not ( = ?AUTO_362 ?AUTO_364 ) ) ( not ( = ?AUTO_363 ?AUTO_364 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_363 ?AUTO_364 )
      ( MAKE-ON ?AUTO_360 ?AUTO_361 )
      ( MAKE-ON-VERIFY ?AUTO_360 ?AUTO_361 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_365 - BLOCK
      ?AUTO_366 - BLOCK
    )
    :vars
    (
      ?AUTO_367 - BLOCK
      ?AUTO_368 - BLOCK
      ?AUTO_369 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_366 ) ( not ( = ?AUTO_365 ?AUTO_366 ) ) ( ON ?AUTO_365 ?AUTO_367 ) ( not ( = ?AUTO_365 ?AUTO_367 ) ) ( not ( = ?AUTO_366 ?AUTO_367 ) ) ( CLEAR ?AUTO_368 ) ( not ( = ?AUTO_365 ?AUTO_369 ) ) ( not ( = ?AUTO_365 ?AUTO_368 ) ) ( not ( = ?AUTO_366 ?AUTO_369 ) ) ( not ( = ?AUTO_366 ?AUTO_368 ) ) ( not ( = ?AUTO_367 ?AUTO_369 ) ) ( not ( = ?AUTO_367 ?AUTO_368 ) ) ( not ( = ?AUTO_369 ?AUTO_368 ) ) ( ON ?AUTO_369 ?AUTO_365 ) ( CLEAR ?AUTO_369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_369 ?AUTO_365 )
      ( MAKE-ON ?AUTO_365 ?AUTO_366 )
      ( MAKE-ON-VERIFY ?AUTO_365 ?AUTO_366 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_370 - BLOCK
      ?AUTO_371 - BLOCK
    )
    :vars
    (
      ?AUTO_372 - BLOCK
      ?AUTO_374 - BLOCK
      ?AUTO_373 - BLOCK
      ?AUTO_375 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_370 ?AUTO_371 ) ) ( ON ?AUTO_370 ?AUTO_372 ) ( not ( = ?AUTO_370 ?AUTO_372 ) ) ( not ( = ?AUTO_371 ?AUTO_372 ) ) ( CLEAR ?AUTO_374 ) ( not ( = ?AUTO_370 ?AUTO_373 ) ) ( not ( = ?AUTO_370 ?AUTO_374 ) ) ( not ( = ?AUTO_371 ?AUTO_373 ) ) ( not ( = ?AUTO_371 ?AUTO_374 ) ) ( not ( = ?AUTO_372 ?AUTO_373 ) ) ( not ( = ?AUTO_372 ?AUTO_374 ) ) ( not ( = ?AUTO_373 ?AUTO_374 ) ) ( ON ?AUTO_373 ?AUTO_370 ) ( CLEAR ?AUTO_373 ) ( HOLDING ?AUTO_371 ) ( CLEAR ?AUTO_375 ) ( not ( = ?AUTO_370 ?AUTO_375 ) ) ( not ( = ?AUTO_371 ?AUTO_375 ) ) ( not ( = ?AUTO_372 ?AUTO_375 ) ) ( not ( = ?AUTO_374 ?AUTO_375 ) ) ( not ( = ?AUTO_373 ?AUTO_375 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_371 ?AUTO_375 )
      ( MAKE-ON ?AUTO_370 ?AUTO_371 )
      ( MAKE-ON-VERIFY ?AUTO_370 ?AUTO_371 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_378 - BLOCK
      ?AUTO_379 - BLOCK
    )
    :vars
    (
      ?AUTO_381 - BLOCK
      ?AUTO_382 - BLOCK
      ?AUTO_380 - BLOCK
      ?AUTO_383 - BLOCK
      ?AUTO_384 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_379 ) ( not ( = ?AUTO_378 ?AUTO_379 ) ) ( ON ?AUTO_378 ?AUTO_381 ) ( not ( = ?AUTO_378 ?AUTO_381 ) ) ( not ( = ?AUTO_379 ?AUTO_381 ) ) ( CLEAR ?AUTO_382 ) ( not ( = ?AUTO_378 ?AUTO_380 ) ) ( not ( = ?AUTO_378 ?AUTO_382 ) ) ( not ( = ?AUTO_379 ?AUTO_380 ) ) ( not ( = ?AUTO_379 ?AUTO_382 ) ) ( not ( = ?AUTO_381 ?AUTO_380 ) ) ( not ( = ?AUTO_381 ?AUTO_382 ) ) ( not ( = ?AUTO_380 ?AUTO_382 ) ) ( ON ?AUTO_380 ?AUTO_378 ) ( CLEAR ?AUTO_380 ) ( HOLDING ?AUTO_383 ) ( CLEAR ?AUTO_384 ) ( not ( = ?AUTO_378 ?AUTO_383 ) ) ( not ( = ?AUTO_378 ?AUTO_384 ) ) ( not ( = ?AUTO_379 ?AUTO_383 ) ) ( not ( = ?AUTO_379 ?AUTO_384 ) ) ( not ( = ?AUTO_381 ?AUTO_383 ) ) ( not ( = ?AUTO_381 ?AUTO_384 ) ) ( not ( = ?AUTO_382 ?AUTO_383 ) ) ( not ( = ?AUTO_382 ?AUTO_384 ) ) ( not ( = ?AUTO_380 ?AUTO_383 ) ) ( not ( = ?AUTO_380 ?AUTO_384 ) ) ( not ( = ?AUTO_383 ?AUTO_384 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_383 ?AUTO_384 )
      ( MAKE-ON ?AUTO_378 ?AUTO_379 )
      ( MAKE-ON-VERIFY ?AUTO_378 ?AUTO_379 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_417 - BLOCK
      ?AUTO_418 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_417 ) ( CLEAR ?AUTO_418 ) ( not ( = ?AUTO_417 ?AUTO_418 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_417 ?AUTO_418 )
      ( MAKE-ON-VERIFY ?AUTO_417 ?AUTO_418 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_419 - BLOCK
      ?AUTO_420 - BLOCK
    )
    :vars
    (
      ?AUTO_421 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_420 ) ( not ( = ?AUTO_419 ?AUTO_420 ) ) ( ON ?AUTO_419 ?AUTO_421 ) ( CLEAR ?AUTO_419 ) ( HAND-EMPTY ) ( not ( = ?AUTO_419 ?AUTO_421 ) ) ( not ( = ?AUTO_420 ?AUTO_421 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_419 ?AUTO_421 )
      ( MAKE-ON ?AUTO_419 ?AUTO_420 )
      ( MAKE-ON-VERIFY ?AUTO_419 ?AUTO_420 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_422 - BLOCK
      ?AUTO_423 - BLOCK
    )
    :vars
    (
      ?AUTO_424 - BLOCK
      ?AUTO_425 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_422 ?AUTO_423 ) ) ( ON ?AUTO_422 ?AUTO_424 ) ( CLEAR ?AUTO_422 ) ( not ( = ?AUTO_422 ?AUTO_424 ) ) ( not ( = ?AUTO_423 ?AUTO_424 ) ) ( HOLDING ?AUTO_423 ) ( CLEAR ?AUTO_425 ) ( not ( = ?AUTO_422 ?AUTO_425 ) ) ( not ( = ?AUTO_423 ?AUTO_425 ) ) ( not ( = ?AUTO_424 ?AUTO_425 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_423 ?AUTO_425 )
      ( MAKE-ON ?AUTO_422 ?AUTO_423 )
      ( MAKE-ON-VERIFY ?AUTO_422 ?AUTO_423 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_495 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_495 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_495 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_495 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_496 - BLOCK
    )
    :vars
    (
      ?AUTO_497 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_496 ?AUTO_497 ) ( CLEAR ?AUTO_496 ) ( HAND-EMPTY ) ( not ( = ?AUTO_496 ?AUTO_497 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_496 ?AUTO_497 )
      ( MAKE-ON-TABLE ?AUTO_496 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_496 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_498 - BLOCK
    )
    :vars
    (
      ?AUTO_499 - BLOCK
      ?AUTO_500 - BLOCK
      ?AUTO_501 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_498 ?AUTO_499 ) ( CLEAR ?AUTO_498 ) ( not ( = ?AUTO_498 ?AUTO_499 ) ) ( HOLDING ?AUTO_500 ) ( CLEAR ?AUTO_501 ) ( not ( = ?AUTO_498 ?AUTO_500 ) ) ( not ( = ?AUTO_498 ?AUTO_501 ) ) ( not ( = ?AUTO_499 ?AUTO_500 ) ) ( not ( = ?AUTO_499 ?AUTO_501 ) ) ( not ( = ?AUTO_500 ?AUTO_501 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_500 ?AUTO_501 )
      ( MAKE-ON-TABLE ?AUTO_498 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_498 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_504 - BLOCK
    )
    :vars
    (
      ?AUTO_507 - BLOCK
      ?AUTO_505 - BLOCK
      ?AUTO_506 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_504 ?AUTO_507 ) ( not ( = ?AUTO_504 ?AUTO_507 ) ) ( CLEAR ?AUTO_505 ) ( not ( = ?AUTO_504 ?AUTO_506 ) ) ( not ( = ?AUTO_504 ?AUTO_505 ) ) ( not ( = ?AUTO_507 ?AUTO_506 ) ) ( not ( = ?AUTO_507 ?AUTO_505 ) ) ( not ( = ?AUTO_506 ?AUTO_505 ) ) ( ON ?AUTO_506 ?AUTO_504 ) ( CLEAR ?AUTO_506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_506 ?AUTO_504 )
      ( MAKE-ON-TABLE ?AUTO_504 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_504 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_508 - BLOCK
    )
    :vars
    (
      ?AUTO_511 - BLOCK
      ?AUTO_510 - BLOCK
      ?AUTO_509 - BLOCK
      ?AUTO_512 - BLOCK
      ?AUTO_513 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_508 ?AUTO_511 ) ( not ( = ?AUTO_508 ?AUTO_511 ) ) ( CLEAR ?AUTO_510 ) ( not ( = ?AUTO_508 ?AUTO_509 ) ) ( not ( = ?AUTO_508 ?AUTO_510 ) ) ( not ( = ?AUTO_511 ?AUTO_509 ) ) ( not ( = ?AUTO_511 ?AUTO_510 ) ) ( not ( = ?AUTO_509 ?AUTO_510 ) ) ( ON ?AUTO_509 ?AUTO_508 ) ( CLEAR ?AUTO_509 ) ( HOLDING ?AUTO_512 ) ( CLEAR ?AUTO_513 ) ( not ( = ?AUTO_508 ?AUTO_512 ) ) ( not ( = ?AUTO_508 ?AUTO_513 ) ) ( not ( = ?AUTO_511 ?AUTO_512 ) ) ( not ( = ?AUTO_511 ?AUTO_513 ) ) ( not ( = ?AUTO_510 ?AUTO_512 ) ) ( not ( = ?AUTO_510 ?AUTO_513 ) ) ( not ( = ?AUTO_509 ?AUTO_512 ) ) ( not ( = ?AUTO_509 ?AUTO_513 ) ) ( not ( = ?AUTO_512 ?AUTO_513 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_512 ?AUTO_513 )
      ( MAKE-ON-TABLE ?AUTO_508 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_508 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_514 - BLOCK
    )
    :vars
    (
      ?AUTO_519 - BLOCK
      ?AUTO_515 - BLOCK
      ?AUTO_516 - BLOCK
      ?AUTO_518 - BLOCK
      ?AUTO_517 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_514 ?AUTO_519 ) ( not ( = ?AUTO_514 ?AUTO_519 ) ) ( CLEAR ?AUTO_515 ) ( not ( = ?AUTO_514 ?AUTO_516 ) ) ( not ( = ?AUTO_514 ?AUTO_515 ) ) ( not ( = ?AUTO_519 ?AUTO_516 ) ) ( not ( = ?AUTO_519 ?AUTO_515 ) ) ( not ( = ?AUTO_516 ?AUTO_515 ) ) ( ON ?AUTO_516 ?AUTO_514 ) ( CLEAR ?AUTO_518 ) ( not ( = ?AUTO_514 ?AUTO_517 ) ) ( not ( = ?AUTO_514 ?AUTO_518 ) ) ( not ( = ?AUTO_519 ?AUTO_517 ) ) ( not ( = ?AUTO_519 ?AUTO_518 ) ) ( not ( = ?AUTO_515 ?AUTO_517 ) ) ( not ( = ?AUTO_515 ?AUTO_518 ) ) ( not ( = ?AUTO_516 ?AUTO_517 ) ) ( not ( = ?AUTO_516 ?AUTO_518 ) ) ( not ( = ?AUTO_517 ?AUTO_518 ) ) ( ON ?AUTO_517 ?AUTO_516 ) ( CLEAR ?AUTO_517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_517 ?AUTO_516 )
      ( MAKE-ON-TABLE ?AUTO_514 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_514 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_520 - BLOCK
    )
    :vars
    (
      ?AUTO_525 - BLOCK
      ?AUTO_522 - BLOCK
      ?AUTO_521 - BLOCK
      ?AUTO_524 - BLOCK
      ?AUTO_523 - BLOCK
      ?AUTO_526 - BLOCK
      ?AUTO_527 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_520 ?AUTO_525 ) ( not ( = ?AUTO_520 ?AUTO_525 ) ) ( CLEAR ?AUTO_522 ) ( not ( = ?AUTO_520 ?AUTO_521 ) ) ( not ( = ?AUTO_520 ?AUTO_522 ) ) ( not ( = ?AUTO_525 ?AUTO_521 ) ) ( not ( = ?AUTO_525 ?AUTO_522 ) ) ( not ( = ?AUTO_521 ?AUTO_522 ) ) ( ON ?AUTO_521 ?AUTO_520 ) ( CLEAR ?AUTO_524 ) ( not ( = ?AUTO_520 ?AUTO_523 ) ) ( not ( = ?AUTO_520 ?AUTO_524 ) ) ( not ( = ?AUTO_525 ?AUTO_523 ) ) ( not ( = ?AUTO_525 ?AUTO_524 ) ) ( not ( = ?AUTO_522 ?AUTO_523 ) ) ( not ( = ?AUTO_522 ?AUTO_524 ) ) ( not ( = ?AUTO_521 ?AUTO_523 ) ) ( not ( = ?AUTO_521 ?AUTO_524 ) ) ( not ( = ?AUTO_523 ?AUTO_524 ) ) ( ON ?AUTO_523 ?AUTO_521 ) ( CLEAR ?AUTO_523 ) ( HOLDING ?AUTO_526 ) ( CLEAR ?AUTO_527 ) ( not ( = ?AUTO_520 ?AUTO_526 ) ) ( not ( = ?AUTO_520 ?AUTO_527 ) ) ( not ( = ?AUTO_525 ?AUTO_526 ) ) ( not ( = ?AUTO_525 ?AUTO_527 ) ) ( not ( = ?AUTO_522 ?AUTO_526 ) ) ( not ( = ?AUTO_522 ?AUTO_527 ) ) ( not ( = ?AUTO_521 ?AUTO_526 ) ) ( not ( = ?AUTO_521 ?AUTO_527 ) ) ( not ( = ?AUTO_524 ?AUTO_526 ) ) ( not ( = ?AUTO_524 ?AUTO_527 ) ) ( not ( = ?AUTO_523 ?AUTO_526 ) ) ( not ( = ?AUTO_523 ?AUTO_527 ) ) ( not ( = ?AUTO_526 ?AUTO_527 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_526 ?AUTO_527 )
      ( MAKE-ON-TABLE ?AUTO_520 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_520 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_547 - BLOCK
      ?AUTO_548 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_547 ) ( CLEAR ?AUTO_548 ) ( not ( = ?AUTO_547 ?AUTO_548 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_547 ?AUTO_548 )
      ( MAKE-ON-VERIFY ?AUTO_547 ?AUTO_548 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_549 - BLOCK
      ?AUTO_550 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_550 ) ( not ( = ?AUTO_549 ?AUTO_550 ) ) ( ON-TABLE ?AUTO_549 ) ( CLEAR ?AUTO_549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_549 )
      ( MAKE-ON ?AUTO_549 ?AUTO_550 )
      ( MAKE-ON-VERIFY ?AUTO_549 ?AUTO_550 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_551 - BLOCK
      ?AUTO_552 - BLOCK
    )
    :vars
    (
      ?AUTO_553 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_552 ) ( not ( = ?AUTO_551 ?AUTO_552 ) ) ( ON-TABLE ?AUTO_551 ) ( CLEAR ?AUTO_551 ) ( HOLDING ?AUTO_553 ) ( not ( = ?AUTO_551 ?AUTO_553 ) ) ( not ( = ?AUTO_552 ?AUTO_553 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_553 )
      ( MAKE-ON ?AUTO_551 ?AUTO_552 )
      ( MAKE-ON-VERIFY ?AUTO_551 ?AUTO_552 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_554 - BLOCK
      ?AUTO_555 - BLOCK
    )
    :vars
    (
      ?AUTO_556 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_555 ) ( not ( = ?AUTO_554 ?AUTO_555 ) ) ( ON-TABLE ?AUTO_554 ) ( not ( = ?AUTO_554 ?AUTO_556 ) ) ( not ( = ?AUTO_555 ?AUTO_556 ) ) ( ON ?AUTO_556 ?AUTO_554 ) ( CLEAR ?AUTO_556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_556 ?AUTO_554 )
      ( MAKE-ON ?AUTO_554 ?AUTO_555 )
      ( MAKE-ON-VERIFY ?AUTO_554 ?AUTO_555 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_557 - BLOCK
      ?AUTO_558 - BLOCK
    )
    :vars
    (
      ?AUTO_559 - BLOCK
      ?AUTO_560 - BLOCK
      ?AUTO_561 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_558 ) ( not ( = ?AUTO_557 ?AUTO_558 ) ) ( ON-TABLE ?AUTO_557 ) ( not ( = ?AUTO_557 ?AUTO_559 ) ) ( not ( = ?AUTO_558 ?AUTO_559 ) ) ( ON ?AUTO_559 ?AUTO_557 ) ( CLEAR ?AUTO_559 ) ( HOLDING ?AUTO_560 ) ( CLEAR ?AUTO_561 ) ( not ( = ?AUTO_557 ?AUTO_560 ) ) ( not ( = ?AUTO_557 ?AUTO_561 ) ) ( not ( = ?AUTO_558 ?AUTO_560 ) ) ( not ( = ?AUTO_558 ?AUTO_561 ) ) ( not ( = ?AUTO_559 ?AUTO_560 ) ) ( not ( = ?AUTO_559 ?AUTO_561 ) ) ( not ( = ?AUTO_560 ?AUTO_561 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_560 ?AUTO_561 )
      ( MAKE-ON ?AUTO_557 ?AUTO_558 )
      ( MAKE-ON-VERIFY ?AUTO_557 ?AUTO_558 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_566 - BLOCK
      ?AUTO_567 - BLOCK
    )
    :vars
    (
      ?AUTO_570 - BLOCK
      ?AUTO_569 - BLOCK
      ?AUTO_568 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_567 ) ( not ( = ?AUTO_566 ?AUTO_567 ) ) ( ON-TABLE ?AUTO_566 ) ( not ( = ?AUTO_566 ?AUTO_570 ) ) ( not ( = ?AUTO_567 ?AUTO_570 ) ) ( ON ?AUTO_570 ?AUTO_566 ) ( CLEAR ?AUTO_569 ) ( not ( = ?AUTO_566 ?AUTO_568 ) ) ( not ( = ?AUTO_566 ?AUTO_569 ) ) ( not ( = ?AUTO_567 ?AUTO_568 ) ) ( not ( = ?AUTO_567 ?AUTO_569 ) ) ( not ( = ?AUTO_570 ?AUTO_568 ) ) ( not ( = ?AUTO_570 ?AUTO_569 ) ) ( not ( = ?AUTO_568 ?AUTO_569 ) ) ( ON ?AUTO_568 ?AUTO_570 ) ( CLEAR ?AUTO_568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_568 ?AUTO_570 )
      ( MAKE-ON ?AUTO_566 ?AUTO_567 )
      ( MAKE-ON-VERIFY ?AUTO_566 ?AUTO_567 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_571 - BLOCK
      ?AUTO_572 - BLOCK
    )
    :vars
    (
      ?AUTO_575 - BLOCK
      ?AUTO_574 - BLOCK
      ?AUTO_573 - BLOCK
      ?AUTO_576 - BLOCK
      ?AUTO_577 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_572 ) ( not ( = ?AUTO_571 ?AUTO_572 ) ) ( ON-TABLE ?AUTO_571 ) ( not ( = ?AUTO_571 ?AUTO_575 ) ) ( not ( = ?AUTO_572 ?AUTO_575 ) ) ( ON ?AUTO_575 ?AUTO_571 ) ( CLEAR ?AUTO_574 ) ( not ( = ?AUTO_571 ?AUTO_573 ) ) ( not ( = ?AUTO_571 ?AUTO_574 ) ) ( not ( = ?AUTO_572 ?AUTO_573 ) ) ( not ( = ?AUTO_572 ?AUTO_574 ) ) ( not ( = ?AUTO_575 ?AUTO_573 ) ) ( not ( = ?AUTO_575 ?AUTO_574 ) ) ( not ( = ?AUTO_573 ?AUTO_574 ) ) ( ON ?AUTO_573 ?AUTO_575 ) ( CLEAR ?AUTO_573 ) ( HOLDING ?AUTO_576 ) ( CLEAR ?AUTO_577 ) ( not ( = ?AUTO_571 ?AUTO_576 ) ) ( not ( = ?AUTO_571 ?AUTO_577 ) ) ( not ( = ?AUTO_572 ?AUTO_576 ) ) ( not ( = ?AUTO_572 ?AUTO_577 ) ) ( not ( = ?AUTO_575 ?AUTO_576 ) ) ( not ( = ?AUTO_575 ?AUTO_577 ) ) ( not ( = ?AUTO_574 ?AUTO_576 ) ) ( not ( = ?AUTO_574 ?AUTO_577 ) ) ( not ( = ?AUTO_573 ?AUTO_576 ) ) ( not ( = ?AUTO_573 ?AUTO_577 ) ) ( not ( = ?AUTO_576 ?AUTO_577 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_576 ?AUTO_577 )
      ( MAKE-ON ?AUTO_571 ?AUTO_572 )
      ( MAKE-ON-VERIFY ?AUTO_571 ?AUTO_572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_578 - BLOCK
      ?AUTO_579 - BLOCK
    )
    :vars
    (
      ?AUTO_584 - BLOCK
      ?AUTO_580 - BLOCK
      ?AUTO_581 - BLOCK
      ?AUTO_583 - BLOCK
      ?AUTO_582 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_579 ) ( not ( = ?AUTO_578 ?AUTO_579 ) ) ( ON-TABLE ?AUTO_578 ) ( not ( = ?AUTO_578 ?AUTO_584 ) ) ( not ( = ?AUTO_579 ?AUTO_584 ) ) ( ON ?AUTO_584 ?AUTO_578 ) ( CLEAR ?AUTO_580 ) ( not ( = ?AUTO_578 ?AUTO_581 ) ) ( not ( = ?AUTO_578 ?AUTO_580 ) ) ( not ( = ?AUTO_579 ?AUTO_581 ) ) ( not ( = ?AUTO_579 ?AUTO_580 ) ) ( not ( = ?AUTO_584 ?AUTO_581 ) ) ( not ( = ?AUTO_584 ?AUTO_580 ) ) ( not ( = ?AUTO_581 ?AUTO_580 ) ) ( ON ?AUTO_581 ?AUTO_584 ) ( CLEAR ?AUTO_583 ) ( not ( = ?AUTO_578 ?AUTO_582 ) ) ( not ( = ?AUTO_578 ?AUTO_583 ) ) ( not ( = ?AUTO_579 ?AUTO_582 ) ) ( not ( = ?AUTO_579 ?AUTO_583 ) ) ( not ( = ?AUTO_584 ?AUTO_582 ) ) ( not ( = ?AUTO_584 ?AUTO_583 ) ) ( not ( = ?AUTO_580 ?AUTO_582 ) ) ( not ( = ?AUTO_580 ?AUTO_583 ) ) ( not ( = ?AUTO_581 ?AUTO_582 ) ) ( not ( = ?AUTO_581 ?AUTO_583 ) ) ( not ( = ?AUTO_582 ?AUTO_583 ) ) ( ON ?AUTO_582 ?AUTO_581 ) ( CLEAR ?AUTO_582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_582 ?AUTO_581 )
      ( MAKE-ON ?AUTO_578 ?AUTO_579 )
      ( MAKE-ON-VERIFY ?AUTO_578 ?AUTO_579 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_585 - BLOCK
      ?AUTO_586 - BLOCK
    )
    :vars
    (
      ?AUTO_591 - BLOCK
      ?AUTO_588 - BLOCK
      ?AUTO_587 - BLOCK
      ?AUTO_590 - BLOCK
      ?AUTO_589 - BLOCK
      ?AUTO_592 - BLOCK
      ?AUTO_593 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_586 ) ( not ( = ?AUTO_585 ?AUTO_586 ) ) ( ON-TABLE ?AUTO_585 ) ( not ( = ?AUTO_585 ?AUTO_591 ) ) ( not ( = ?AUTO_586 ?AUTO_591 ) ) ( ON ?AUTO_591 ?AUTO_585 ) ( CLEAR ?AUTO_588 ) ( not ( = ?AUTO_585 ?AUTO_587 ) ) ( not ( = ?AUTO_585 ?AUTO_588 ) ) ( not ( = ?AUTO_586 ?AUTO_587 ) ) ( not ( = ?AUTO_586 ?AUTO_588 ) ) ( not ( = ?AUTO_591 ?AUTO_587 ) ) ( not ( = ?AUTO_591 ?AUTO_588 ) ) ( not ( = ?AUTO_587 ?AUTO_588 ) ) ( ON ?AUTO_587 ?AUTO_591 ) ( CLEAR ?AUTO_590 ) ( not ( = ?AUTO_585 ?AUTO_589 ) ) ( not ( = ?AUTO_585 ?AUTO_590 ) ) ( not ( = ?AUTO_586 ?AUTO_589 ) ) ( not ( = ?AUTO_586 ?AUTO_590 ) ) ( not ( = ?AUTO_591 ?AUTO_589 ) ) ( not ( = ?AUTO_591 ?AUTO_590 ) ) ( not ( = ?AUTO_588 ?AUTO_589 ) ) ( not ( = ?AUTO_588 ?AUTO_590 ) ) ( not ( = ?AUTO_587 ?AUTO_589 ) ) ( not ( = ?AUTO_587 ?AUTO_590 ) ) ( not ( = ?AUTO_589 ?AUTO_590 ) ) ( ON ?AUTO_589 ?AUTO_587 ) ( CLEAR ?AUTO_589 ) ( HOLDING ?AUTO_592 ) ( CLEAR ?AUTO_593 ) ( not ( = ?AUTO_585 ?AUTO_592 ) ) ( not ( = ?AUTO_585 ?AUTO_593 ) ) ( not ( = ?AUTO_586 ?AUTO_592 ) ) ( not ( = ?AUTO_586 ?AUTO_593 ) ) ( not ( = ?AUTO_591 ?AUTO_592 ) ) ( not ( = ?AUTO_591 ?AUTO_593 ) ) ( not ( = ?AUTO_588 ?AUTO_592 ) ) ( not ( = ?AUTO_588 ?AUTO_593 ) ) ( not ( = ?AUTO_587 ?AUTO_592 ) ) ( not ( = ?AUTO_587 ?AUTO_593 ) ) ( not ( = ?AUTO_590 ?AUTO_592 ) ) ( not ( = ?AUTO_590 ?AUTO_593 ) ) ( not ( = ?AUTO_589 ?AUTO_592 ) ) ( not ( = ?AUTO_589 ?AUTO_593 ) ) ( not ( = ?AUTO_592 ?AUTO_593 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_592 ?AUTO_593 )
      ( MAKE-ON ?AUTO_585 ?AUTO_586 )
      ( MAKE-ON-VERIFY ?AUTO_585 ?AUTO_586 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_630 - BLOCK
      ?AUTO_631 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_630 ) ( CLEAR ?AUTO_631 ) ( not ( = ?AUTO_630 ?AUTO_631 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_630 ?AUTO_631 )
      ( MAKE-ON-VERIFY ?AUTO_630 ?AUTO_631 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_632 - BLOCK
      ?AUTO_633 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_633 ) ( not ( = ?AUTO_632 ?AUTO_633 ) ) ( ON-TABLE ?AUTO_632 ) ( CLEAR ?AUTO_632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_632 )
      ( MAKE-ON ?AUTO_632 ?AUTO_633 )
      ( MAKE-ON-VERIFY ?AUTO_632 ?AUTO_633 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_634 - BLOCK
      ?AUTO_635 - BLOCK
    )
    :vars
    (
      ?AUTO_636 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_634 ?AUTO_635 ) ) ( ON-TABLE ?AUTO_634 ) ( CLEAR ?AUTO_634 ) ( HOLDING ?AUTO_635 ) ( CLEAR ?AUTO_636 ) ( not ( = ?AUTO_634 ?AUTO_636 ) ) ( not ( = ?AUTO_635 ?AUTO_636 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_635 ?AUTO_636 )
      ( MAKE-ON ?AUTO_634 ?AUTO_635 )
      ( MAKE-ON-VERIFY ?AUTO_634 ?AUTO_635 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_772 - BLOCK
      ?AUTO_773 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_772 ) ( CLEAR ?AUTO_773 ) ( not ( = ?AUTO_772 ?AUTO_773 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_772 ?AUTO_773 )
      ( MAKE-ON-VERIFY ?AUTO_772 ?AUTO_773 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_774 - BLOCK
      ?AUTO_775 - BLOCK
    )
    :vars
    (
      ?AUTO_776 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_775 ) ( not ( = ?AUTO_774 ?AUTO_775 ) ) ( ON ?AUTO_774 ?AUTO_776 ) ( CLEAR ?AUTO_774 ) ( HAND-EMPTY ) ( not ( = ?AUTO_774 ?AUTO_776 ) ) ( not ( = ?AUTO_775 ?AUTO_776 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_774 ?AUTO_776 )
      ( MAKE-ON ?AUTO_774 ?AUTO_775 )
      ( MAKE-ON-VERIFY ?AUTO_774 ?AUTO_775 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_777 - BLOCK
      ?AUTO_778 - BLOCK
    )
    :vars
    (
      ?AUTO_779 - BLOCK
      ?AUTO_780 - BLOCK
      ?AUTO_781 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_778 ) ( not ( = ?AUTO_777 ?AUTO_778 ) ) ( ON ?AUTO_777 ?AUTO_779 ) ( CLEAR ?AUTO_777 ) ( not ( = ?AUTO_777 ?AUTO_779 ) ) ( not ( = ?AUTO_778 ?AUTO_779 ) ) ( HOLDING ?AUTO_780 ) ( CLEAR ?AUTO_781 ) ( not ( = ?AUTO_777 ?AUTO_780 ) ) ( not ( = ?AUTO_777 ?AUTO_781 ) ) ( not ( = ?AUTO_778 ?AUTO_780 ) ) ( not ( = ?AUTO_778 ?AUTO_781 ) ) ( not ( = ?AUTO_779 ?AUTO_780 ) ) ( not ( = ?AUTO_779 ?AUTO_781 ) ) ( not ( = ?AUTO_780 ?AUTO_781 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_780 ?AUTO_781 )
      ( MAKE-ON ?AUTO_777 ?AUTO_778 )
      ( MAKE-ON-VERIFY ?AUTO_777 ?AUTO_778 ) )
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
    :vars
    (
      ?AUTO_851 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_850 ) ( not ( = ?AUTO_849 ?AUTO_850 ) ) ( ON ?AUTO_849 ?AUTO_851 ) ( CLEAR ?AUTO_849 ) ( HAND-EMPTY ) ( not ( = ?AUTO_849 ?AUTO_851 ) ) ( not ( = ?AUTO_850 ?AUTO_851 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_849 ?AUTO_851 )
      ( MAKE-ON ?AUTO_849 ?AUTO_850 )
      ( MAKE-ON-VERIFY ?AUTO_849 ?AUTO_850 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_852 - BLOCK
      ?AUTO_853 - BLOCK
    )
    :vars
    (
      ?AUTO_854 - BLOCK
      ?AUTO_855 - BLOCK
      ?AUTO_856 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_853 ) ( not ( = ?AUTO_852 ?AUTO_853 ) ) ( ON ?AUTO_852 ?AUTO_854 ) ( CLEAR ?AUTO_852 ) ( not ( = ?AUTO_852 ?AUTO_854 ) ) ( not ( = ?AUTO_853 ?AUTO_854 ) ) ( HOLDING ?AUTO_855 ) ( CLEAR ?AUTO_856 ) ( not ( = ?AUTO_852 ?AUTO_855 ) ) ( not ( = ?AUTO_852 ?AUTO_856 ) ) ( not ( = ?AUTO_853 ?AUTO_855 ) ) ( not ( = ?AUTO_853 ?AUTO_856 ) ) ( not ( = ?AUTO_854 ?AUTO_855 ) ) ( not ( = ?AUTO_854 ?AUTO_856 ) ) ( not ( = ?AUTO_855 ?AUTO_856 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_855 ?AUTO_856 )
      ( MAKE-ON ?AUTO_852 ?AUTO_853 )
      ( MAKE-ON-VERIFY ?AUTO_852 ?AUTO_853 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_857 - BLOCK
      ?AUTO_858 - BLOCK
    )
    :vars
    (
      ?AUTO_859 - BLOCK
      ?AUTO_861 - BLOCK
      ?AUTO_860 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_858 ) ( not ( = ?AUTO_857 ?AUTO_858 ) ) ( ON ?AUTO_857 ?AUTO_859 ) ( not ( = ?AUTO_857 ?AUTO_859 ) ) ( not ( = ?AUTO_858 ?AUTO_859 ) ) ( CLEAR ?AUTO_861 ) ( not ( = ?AUTO_857 ?AUTO_860 ) ) ( not ( = ?AUTO_857 ?AUTO_861 ) ) ( not ( = ?AUTO_858 ?AUTO_860 ) ) ( not ( = ?AUTO_858 ?AUTO_861 ) ) ( not ( = ?AUTO_859 ?AUTO_860 ) ) ( not ( = ?AUTO_859 ?AUTO_861 ) ) ( not ( = ?AUTO_860 ?AUTO_861 ) ) ( ON ?AUTO_860 ?AUTO_857 ) ( CLEAR ?AUTO_860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_860 ?AUTO_857 )
      ( MAKE-ON ?AUTO_857 ?AUTO_858 )
      ( MAKE-ON-VERIFY ?AUTO_857 ?AUTO_858 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_862 - BLOCK
      ?AUTO_863 - BLOCK
    )
    :vars
    (
      ?AUTO_864 - BLOCK
      ?AUTO_865 - BLOCK
      ?AUTO_866 - BLOCK
      ?AUTO_867 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_862 ?AUTO_863 ) ) ( ON ?AUTO_862 ?AUTO_864 ) ( not ( = ?AUTO_862 ?AUTO_864 ) ) ( not ( = ?AUTO_863 ?AUTO_864 ) ) ( CLEAR ?AUTO_865 ) ( not ( = ?AUTO_862 ?AUTO_866 ) ) ( not ( = ?AUTO_862 ?AUTO_865 ) ) ( not ( = ?AUTO_863 ?AUTO_866 ) ) ( not ( = ?AUTO_863 ?AUTO_865 ) ) ( not ( = ?AUTO_864 ?AUTO_866 ) ) ( not ( = ?AUTO_864 ?AUTO_865 ) ) ( not ( = ?AUTO_866 ?AUTO_865 ) ) ( ON ?AUTO_866 ?AUTO_862 ) ( CLEAR ?AUTO_866 ) ( HOLDING ?AUTO_863 ) ( CLEAR ?AUTO_867 ) ( not ( = ?AUTO_862 ?AUTO_867 ) ) ( not ( = ?AUTO_863 ?AUTO_867 ) ) ( not ( = ?AUTO_864 ?AUTO_867 ) ) ( not ( = ?AUTO_865 ?AUTO_867 ) ) ( not ( = ?AUTO_866 ?AUTO_867 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_863 ?AUTO_867 )
      ( MAKE-ON ?AUTO_862 ?AUTO_863 )
      ( MAKE-ON-VERIFY ?AUTO_862 ?AUTO_863 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_870 - BLOCK
      ?AUTO_871 - BLOCK
    )
    :vars
    (
      ?AUTO_874 - BLOCK
      ?AUTO_872 - BLOCK
      ?AUTO_873 - BLOCK
      ?AUTO_875 - BLOCK
      ?AUTO_876 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_871 ) ( not ( = ?AUTO_870 ?AUTO_871 ) ) ( ON ?AUTO_870 ?AUTO_874 ) ( not ( = ?AUTO_870 ?AUTO_874 ) ) ( not ( = ?AUTO_871 ?AUTO_874 ) ) ( CLEAR ?AUTO_872 ) ( not ( = ?AUTO_870 ?AUTO_873 ) ) ( not ( = ?AUTO_870 ?AUTO_872 ) ) ( not ( = ?AUTO_871 ?AUTO_873 ) ) ( not ( = ?AUTO_871 ?AUTO_872 ) ) ( not ( = ?AUTO_874 ?AUTO_873 ) ) ( not ( = ?AUTO_874 ?AUTO_872 ) ) ( not ( = ?AUTO_873 ?AUTO_872 ) ) ( ON ?AUTO_873 ?AUTO_870 ) ( CLEAR ?AUTO_873 ) ( HOLDING ?AUTO_875 ) ( CLEAR ?AUTO_876 ) ( not ( = ?AUTO_870 ?AUTO_875 ) ) ( not ( = ?AUTO_870 ?AUTO_876 ) ) ( not ( = ?AUTO_871 ?AUTO_875 ) ) ( not ( = ?AUTO_871 ?AUTO_876 ) ) ( not ( = ?AUTO_874 ?AUTO_875 ) ) ( not ( = ?AUTO_874 ?AUTO_876 ) ) ( not ( = ?AUTO_872 ?AUTO_875 ) ) ( not ( = ?AUTO_872 ?AUTO_876 ) ) ( not ( = ?AUTO_873 ?AUTO_875 ) ) ( not ( = ?AUTO_873 ?AUTO_876 ) ) ( not ( = ?AUTO_875 ?AUTO_876 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_875 ?AUTO_876 )
      ( MAKE-ON ?AUTO_870 ?AUTO_871 )
      ( MAKE-ON-VERIFY ?AUTO_870 ?AUTO_871 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_985 - BLOCK
      ?AUTO_986 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_985 ) ( CLEAR ?AUTO_986 ) ( not ( = ?AUTO_985 ?AUTO_986 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_985 ?AUTO_986 )
      ( MAKE-ON-VERIFY ?AUTO_985 ?AUTO_986 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_987 - BLOCK
      ?AUTO_988 - BLOCK
    )
    :vars
    (
      ?AUTO_989 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_988 ) ( not ( = ?AUTO_987 ?AUTO_988 ) ) ( ON ?AUTO_987 ?AUTO_989 ) ( CLEAR ?AUTO_987 ) ( HAND-EMPTY ) ( not ( = ?AUTO_987 ?AUTO_989 ) ) ( not ( = ?AUTO_988 ?AUTO_989 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_987 ?AUTO_989 )
      ( MAKE-ON ?AUTO_987 ?AUTO_988 )
      ( MAKE-ON-VERIFY ?AUTO_987 ?AUTO_988 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_990 - BLOCK
      ?AUTO_991 - BLOCK
    )
    :vars
    (
      ?AUTO_992 - BLOCK
      ?AUTO_993 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_990 ?AUTO_991 ) ) ( ON ?AUTO_990 ?AUTO_992 ) ( CLEAR ?AUTO_990 ) ( not ( = ?AUTO_990 ?AUTO_992 ) ) ( not ( = ?AUTO_991 ?AUTO_992 ) ) ( HOLDING ?AUTO_991 ) ( CLEAR ?AUTO_993 ) ( not ( = ?AUTO_990 ?AUTO_993 ) ) ( not ( = ?AUTO_991 ?AUTO_993 ) ) ( not ( = ?AUTO_992 ?AUTO_993 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_991 ?AUTO_993 )
      ( MAKE-ON ?AUTO_990 ?AUTO_991 )
      ( MAKE-ON-VERIFY ?AUTO_990 ?AUTO_991 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_996 - BLOCK
      ?AUTO_997 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_996 ) ( CLEAR ?AUTO_997 ) ( not ( = ?AUTO_996 ?AUTO_997 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_996 ?AUTO_997 )
      ( MAKE-ON-VERIFY ?AUTO_996 ?AUTO_997 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_998 - BLOCK
      ?AUTO_999 - BLOCK
    )
    :vars
    (
      ?AUTO_1000 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_999 ) ( not ( = ?AUTO_998 ?AUTO_999 ) ) ( ON ?AUTO_998 ?AUTO_1000 ) ( CLEAR ?AUTO_998 ) ( HAND-EMPTY ) ( not ( = ?AUTO_998 ?AUTO_1000 ) ) ( not ( = ?AUTO_999 ?AUTO_1000 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_998 ?AUTO_1000 )
      ( MAKE-ON ?AUTO_998 ?AUTO_999 )
      ( MAKE-ON-VERIFY ?AUTO_998 ?AUTO_999 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1002 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1002 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1002 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1002 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1003 - BLOCK
    )
    :vars
    (
      ?AUTO_1004 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1003 ?AUTO_1004 ) ( CLEAR ?AUTO_1003 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1003 ?AUTO_1004 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1003 ?AUTO_1004 )
      ( MAKE-ON-TABLE ?AUTO_1003 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1003 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1005 - BLOCK
    )
    :vars
    (
      ?AUTO_1006 - BLOCK
      ?AUTO_1007 - BLOCK
      ?AUTO_1008 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1005 ?AUTO_1006 ) ( CLEAR ?AUTO_1005 ) ( not ( = ?AUTO_1005 ?AUTO_1006 ) ) ( HOLDING ?AUTO_1007 ) ( CLEAR ?AUTO_1008 ) ( not ( = ?AUTO_1005 ?AUTO_1007 ) ) ( not ( = ?AUTO_1005 ?AUTO_1008 ) ) ( not ( = ?AUTO_1006 ?AUTO_1007 ) ) ( not ( = ?AUTO_1006 ?AUTO_1008 ) ) ( not ( = ?AUTO_1007 ?AUTO_1008 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1007 ?AUTO_1008 )
      ( MAKE-ON-TABLE ?AUTO_1005 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1005 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1009 - BLOCK
    )
    :vars
    (
      ?AUTO_1010 - BLOCK
      ?AUTO_1012 - BLOCK
      ?AUTO_1011 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1009 ?AUTO_1010 ) ( not ( = ?AUTO_1009 ?AUTO_1010 ) ) ( CLEAR ?AUTO_1012 ) ( not ( = ?AUTO_1009 ?AUTO_1011 ) ) ( not ( = ?AUTO_1009 ?AUTO_1012 ) ) ( not ( = ?AUTO_1010 ?AUTO_1011 ) ) ( not ( = ?AUTO_1010 ?AUTO_1012 ) ) ( not ( = ?AUTO_1011 ?AUTO_1012 ) ) ( ON ?AUTO_1011 ?AUTO_1009 ) ( CLEAR ?AUTO_1011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1011 ?AUTO_1009 )
      ( MAKE-ON-TABLE ?AUTO_1009 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1009 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1015 - BLOCK
      ?AUTO_1016 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1015 ) ( CLEAR ?AUTO_1016 ) ( not ( = ?AUTO_1015 ?AUTO_1016 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1015 ?AUTO_1016 )
      ( MAKE-ON-VERIFY ?AUTO_1015 ?AUTO_1016 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1017 - BLOCK
      ?AUTO_1018 - BLOCK
    )
    :vars
    (
      ?AUTO_1019 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1018 ) ( not ( = ?AUTO_1017 ?AUTO_1018 ) ) ( ON ?AUTO_1017 ?AUTO_1019 ) ( CLEAR ?AUTO_1017 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1017 ?AUTO_1019 ) ) ( not ( = ?AUTO_1018 ?AUTO_1019 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1017 ?AUTO_1019 )
      ( MAKE-ON ?AUTO_1017 ?AUTO_1018 )
      ( MAKE-ON-VERIFY ?AUTO_1017 ?AUTO_1018 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1020 - BLOCK
      ?AUTO_1021 - BLOCK
    )
    :vars
    (
      ?AUTO_1022 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1020 ?AUTO_1021 ) ) ( ON ?AUTO_1020 ?AUTO_1022 ) ( CLEAR ?AUTO_1020 ) ( not ( = ?AUTO_1020 ?AUTO_1022 ) ) ( not ( = ?AUTO_1021 ?AUTO_1022 ) ) ( HOLDING ?AUTO_1021 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1021 )
      ( MAKE-ON ?AUTO_1020 ?AUTO_1021 )
      ( MAKE-ON-VERIFY ?AUTO_1020 ?AUTO_1021 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1031 - BLOCK
      ?AUTO_1032 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1031 ) ( CLEAR ?AUTO_1032 ) ( not ( = ?AUTO_1031 ?AUTO_1032 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1031 ?AUTO_1032 )
      ( MAKE-ON-VERIFY ?AUTO_1031 ?AUTO_1032 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1033 - BLOCK
      ?AUTO_1034 - BLOCK
    )
    :vars
    (
      ?AUTO_1035 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1034 ) ( not ( = ?AUTO_1033 ?AUTO_1034 ) ) ( ON ?AUTO_1033 ?AUTO_1035 ) ( CLEAR ?AUTO_1033 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1033 ?AUTO_1035 ) ) ( not ( = ?AUTO_1034 ?AUTO_1035 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1033 ?AUTO_1035 )
      ( MAKE-ON ?AUTO_1033 ?AUTO_1034 )
      ( MAKE-ON-VERIFY ?AUTO_1033 ?AUTO_1034 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1036 - BLOCK
      ?AUTO_1037 - BLOCK
    )
    :vars
    (
      ?AUTO_1038 - BLOCK
      ?AUTO_1039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1036 ?AUTO_1037 ) ) ( ON ?AUTO_1036 ?AUTO_1038 ) ( CLEAR ?AUTO_1036 ) ( not ( = ?AUTO_1036 ?AUTO_1038 ) ) ( not ( = ?AUTO_1037 ?AUTO_1038 ) ) ( HOLDING ?AUTO_1037 ) ( CLEAR ?AUTO_1039 ) ( not ( = ?AUTO_1036 ?AUTO_1039 ) ) ( not ( = ?AUTO_1037 ?AUTO_1039 ) ) ( not ( = ?AUTO_1038 ?AUTO_1039 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1037 ?AUTO_1039 )
      ( MAKE-ON ?AUTO_1036 ?AUTO_1037 )
      ( MAKE-ON-VERIFY ?AUTO_1036 ?AUTO_1037 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1042 - BLOCK
      ?AUTO_1043 - BLOCK
    )
    :vars
    (
      ?AUTO_1044 - BLOCK
      ?AUTO_1045 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1043 ) ( not ( = ?AUTO_1042 ?AUTO_1043 ) ) ( ON ?AUTO_1042 ?AUTO_1044 ) ( CLEAR ?AUTO_1042 ) ( not ( = ?AUTO_1042 ?AUTO_1044 ) ) ( not ( = ?AUTO_1043 ?AUTO_1044 ) ) ( HOLDING ?AUTO_1045 ) ( not ( = ?AUTO_1042 ?AUTO_1045 ) ) ( not ( = ?AUTO_1043 ?AUTO_1045 ) ) ( not ( = ?AUTO_1044 ?AUTO_1045 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1045 )
      ( MAKE-ON ?AUTO_1042 ?AUTO_1043 )
      ( MAKE-ON-VERIFY ?AUTO_1042 ?AUTO_1043 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1046 - BLOCK
      ?AUTO_1047 - BLOCK
    )
    :vars
    (
      ?AUTO_1048 - BLOCK
      ?AUTO_1049 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1047 ) ( not ( = ?AUTO_1046 ?AUTO_1047 ) ) ( ON ?AUTO_1046 ?AUTO_1048 ) ( not ( = ?AUTO_1046 ?AUTO_1048 ) ) ( not ( = ?AUTO_1047 ?AUTO_1048 ) ) ( not ( = ?AUTO_1046 ?AUTO_1049 ) ) ( not ( = ?AUTO_1047 ?AUTO_1049 ) ) ( not ( = ?AUTO_1048 ?AUTO_1049 ) ) ( ON ?AUTO_1049 ?AUTO_1046 ) ( CLEAR ?AUTO_1049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1049 ?AUTO_1046 )
      ( MAKE-ON ?AUTO_1046 ?AUTO_1047 )
      ( MAKE-ON-VERIFY ?AUTO_1046 ?AUTO_1047 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1050 - BLOCK
      ?AUTO_1051 - BLOCK
    )
    :vars
    (
      ?AUTO_1053 - BLOCK
      ?AUTO_1052 - BLOCK
      ?AUTO_1054 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1050 ?AUTO_1051 ) ) ( ON ?AUTO_1050 ?AUTO_1053 ) ( not ( = ?AUTO_1050 ?AUTO_1053 ) ) ( not ( = ?AUTO_1051 ?AUTO_1053 ) ) ( not ( = ?AUTO_1050 ?AUTO_1052 ) ) ( not ( = ?AUTO_1051 ?AUTO_1052 ) ) ( not ( = ?AUTO_1053 ?AUTO_1052 ) ) ( ON ?AUTO_1052 ?AUTO_1050 ) ( CLEAR ?AUTO_1052 ) ( HOLDING ?AUTO_1051 ) ( CLEAR ?AUTO_1054 ) ( not ( = ?AUTO_1050 ?AUTO_1054 ) ) ( not ( = ?AUTO_1051 ?AUTO_1054 ) ) ( not ( = ?AUTO_1053 ?AUTO_1054 ) ) ( not ( = ?AUTO_1052 ?AUTO_1054 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1051 ?AUTO_1054 )
      ( MAKE-ON ?AUTO_1050 ?AUTO_1051 )
      ( MAKE-ON-VERIFY ?AUTO_1050 ?AUTO_1051 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1055 - BLOCK
      ?AUTO_1056 - BLOCK
    )
    :vars
    (
      ?AUTO_1058 - BLOCK
      ?AUTO_1059 - BLOCK
      ?AUTO_1057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1055 ?AUTO_1056 ) ) ( ON ?AUTO_1055 ?AUTO_1058 ) ( not ( = ?AUTO_1055 ?AUTO_1058 ) ) ( not ( = ?AUTO_1056 ?AUTO_1058 ) ) ( not ( = ?AUTO_1055 ?AUTO_1059 ) ) ( not ( = ?AUTO_1056 ?AUTO_1059 ) ) ( not ( = ?AUTO_1058 ?AUTO_1059 ) ) ( ON ?AUTO_1059 ?AUTO_1055 ) ( CLEAR ?AUTO_1057 ) ( not ( = ?AUTO_1055 ?AUTO_1057 ) ) ( not ( = ?AUTO_1056 ?AUTO_1057 ) ) ( not ( = ?AUTO_1058 ?AUTO_1057 ) ) ( not ( = ?AUTO_1059 ?AUTO_1057 ) ) ( ON ?AUTO_1056 ?AUTO_1059 ) ( CLEAR ?AUTO_1056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1056 ?AUTO_1059 )
      ( MAKE-ON ?AUTO_1055 ?AUTO_1056 )
      ( MAKE-ON-VERIFY ?AUTO_1055 ?AUTO_1056 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1062 - BLOCK
      ?AUTO_1063 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1062 ) ( CLEAR ?AUTO_1063 ) ( not ( = ?AUTO_1062 ?AUTO_1063 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1062 ?AUTO_1063 )
      ( MAKE-ON-VERIFY ?AUTO_1062 ?AUTO_1063 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1064 - BLOCK
      ?AUTO_1065 - BLOCK
    )
    :vars
    (
      ?AUTO_1066 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1065 ) ( not ( = ?AUTO_1064 ?AUTO_1065 ) ) ( ON ?AUTO_1064 ?AUTO_1066 ) ( CLEAR ?AUTO_1064 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1064 ?AUTO_1066 ) ) ( not ( = ?AUTO_1065 ?AUTO_1066 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1064 ?AUTO_1066 )
      ( MAKE-ON ?AUTO_1064 ?AUTO_1065 )
      ( MAKE-ON-VERIFY ?AUTO_1064 ?AUTO_1065 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1067 - BLOCK
      ?AUTO_1068 - BLOCK
    )
    :vars
    (
      ?AUTO_1069 - BLOCK
      ?AUTO_1070 - BLOCK
      ?AUTO_1071 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1068 ) ( not ( = ?AUTO_1067 ?AUTO_1068 ) ) ( ON ?AUTO_1067 ?AUTO_1069 ) ( CLEAR ?AUTO_1067 ) ( not ( = ?AUTO_1067 ?AUTO_1069 ) ) ( not ( = ?AUTO_1068 ?AUTO_1069 ) ) ( HOLDING ?AUTO_1070 ) ( CLEAR ?AUTO_1071 ) ( not ( = ?AUTO_1067 ?AUTO_1070 ) ) ( not ( = ?AUTO_1067 ?AUTO_1071 ) ) ( not ( = ?AUTO_1068 ?AUTO_1070 ) ) ( not ( = ?AUTO_1068 ?AUTO_1071 ) ) ( not ( = ?AUTO_1069 ?AUTO_1070 ) ) ( not ( = ?AUTO_1069 ?AUTO_1071 ) ) ( not ( = ?AUTO_1070 ?AUTO_1071 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1070 ?AUTO_1071 )
      ( MAKE-ON ?AUTO_1067 ?AUTO_1068 )
      ( MAKE-ON-VERIFY ?AUTO_1067 ?AUTO_1068 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1072 - BLOCK
      ?AUTO_1073 - BLOCK
    )
    :vars
    (
      ?AUTO_1074 - BLOCK
      ?AUTO_1075 - BLOCK
      ?AUTO_1076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1072 ?AUTO_1073 ) ) ( ON ?AUTO_1072 ?AUTO_1074 ) ( CLEAR ?AUTO_1072 ) ( not ( = ?AUTO_1072 ?AUTO_1074 ) ) ( not ( = ?AUTO_1073 ?AUTO_1074 ) ) ( CLEAR ?AUTO_1075 ) ( not ( = ?AUTO_1072 ?AUTO_1076 ) ) ( not ( = ?AUTO_1072 ?AUTO_1075 ) ) ( not ( = ?AUTO_1073 ?AUTO_1076 ) ) ( not ( = ?AUTO_1073 ?AUTO_1075 ) ) ( not ( = ?AUTO_1074 ?AUTO_1076 ) ) ( not ( = ?AUTO_1074 ?AUTO_1075 ) ) ( not ( = ?AUTO_1076 ?AUTO_1075 ) ) ( ON ?AUTO_1076 ?AUTO_1073 ) ( CLEAR ?AUTO_1076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1076 ?AUTO_1073 )
      ( MAKE-ON ?AUTO_1072 ?AUTO_1073 )
      ( MAKE-ON-VERIFY ?AUTO_1072 ?AUTO_1073 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1077 - BLOCK
      ?AUTO_1078 - BLOCK
    )
    :vars
    (
      ?AUTO_1081 - BLOCK
      ?AUTO_1080 - BLOCK
      ?AUTO_1079 - BLOCK
      ?AUTO_1082 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1077 ?AUTO_1078 ) ) ( ON ?AUTO_1077 ?AUTO_1081 ) ( CLEAR ?AUTO_1077 ) ( not ( = ?AUTO_1077 ?AUTO_1081 ) ) ( not ( = ?AUTO_1078 ?AUTO_1081 ) ) ( not ( = ?AUTO_1077 ?AUTO_1080 ) ) ( not ( = ?AUTO_1077 ?AUTO_1079 ) ) ( not ( = ?AUTO_1078 ?AUTO_1080 ) ) ( not ( = ?AUTO_1078 ?AUTO_1079 ) ) ( not ( = ?AUTO_1081 ?AUTO_1080 ) ) ( not ( = ?AUTO_1081 ?AUTO_1079 ) ) ( not ( = ?AUTO_1080 ?AUTO_1079 ) ) ( ON ?AUTO_1080 ?AUTO_1078 ) ( CLEAR ?AUTO_1080 ) ( HOLDING ?AUTO_1079 ) ( CLEAR ?AUTO_1082 ) ( not ( = ?AUTO_1077 ?AUTO_1082 ) ) ( not ( = ?AUTO_1078 ?AUTO_1082 ) ) ( not ( = ?AUTO_1081 ?AUTO_1082 ) ) ( not ( = ?AUTO_1080 ?AUTO_1082 ) ) ( not ( = ?AUTO_1079 ?AUTO_1082 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1079 ?AUTO_1082 )
      ( MAKE-ON ?AUTO_1077 ?AUTO_1078 )
      ( MAKE-ON-VERIFY ?AUTO_1077 ?AUTO_1078 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1083 - BLOCK
      ?AUTO_1084 - BLOCK
    )
    :vars
    (
      ?AUTO_1088 - BLOCK
      ?AUTO_1085 - BLOCK
      ?AUTO_1086 - BLOCK
      ?AUTO_1087 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1083 ?AUTO_1084 ) ) ( ON ?AUTO_1083 ?AUTO_1088 ) ( not ( = ?AUTO_1083 ?AUTO_1088 ) ) ( not ( = ?AUTO_1084 ?AUTO_1088 ) ) ( not ( = ?AUTO_1083 ?AUTO_1085 ) ) ( not ( = ?AUTO_1083 ?AUTO_1086 ) ) ( not ( = ?AUTO_1084 ?AUTO_1085 ) ) ( not ( = ?AUTO_1084 ?AUTO_1086 ) ) ( not ( = ?AUTO_1088 ?AUTO_1085 ) ) ( not ( = ?AUTO_1088 ?AUTO_1086 ) ) ( not ( = ?AUTO_1085 ?AUTO_1086 ) ) ( ON ?AUTO_1085 ?AUTO_1084 ) ( CLEAR ?AUTO_1085 ) ( CLEAR ?AUTO_1087 ) ( not ( = ?AUTO_1083 ?AUTO_1087 ) ) ( not ( = ?AUTO_1084 ?AUTO_1087 ) ) ( not ( = ?AUTO_1088 ?AUTO_1087 ) ) ( not ( = ?AUTO_1085 ?AUTO_1087 ) ) ( not ( = ?AUTO_1086 ?AUTO_1087 ) ) ( ON ?AUTO_1086 ?AUTO_1083 ) ( CLEAR ?AUTO_1086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1086 ?AUTO_1083 )
      ( MAKE-ON ?AUTO_1083 ?AUTO_1084 )
      ( MAKE-ON-VERIFY ?AUTO_1083 ?AUTO_1084 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1089 - BLOCK
      ?AUTO_1090 - BLOCK
    )
    :vars
    (
      ?AUTO_1094 - BLOCK
      ?AUTO_1092 - BLOCK
      ?AUTO_1091 - BLOCK
      ?AUTO_1093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1089 ?AUTO_1090 ) ) ( ON ?AUTO_1089 ?AUTO_1094 ) ( not ( = ?AUTO_1089 ?AUTO_1094 ) ) ( not ( = ?AUTO_1090 ?AUTO_1094 ) ) ( not ( = ?AUTO_1089 ?AUTO_1092 ) ) ( not ( = ?AUTO_1089 ?AUTO_1091 ) ) ( not ( = ?AUTO_1090 ?AUTO_1092 ) ) ( not ( = ?AUTO_1090 ?AUTO_1091 ) ) ( not ( = ?AUTO_1094 ?AUTO_1092 ) ) ( not ( = ?AUTO_1094 ?AUTO_1091 ) ) ( not ( = ?AUTO_1092 ?AUTO_1091 ) ) ( ON ?AUTO_1092 ?AUTO_1090 ) ( CLEAR ?AUTO_1092 ) ( not ( = ?AUTO_1089 ?AUTO_1093 ) ) ( not ( = ?AUTO_1090 ?AUTO_1093 ) ) ( not ( = ?AUTO_1094 ?AUTO_1093 ) ) ( not ( = ?AUTO_1092 ?AUTO_1093 ) ) ( not ( = ?AUTO_1091 ?AUTO_1093 ) ) ( ON ?AUTO_1091 ?AUTO_1089 ) ( CLEAR ?AUTO_1091 ) ( HOLDING ?AUTO_1093 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1093 )
      ( MAKE-ON ?AUTO_1089 ?AUTO_1090 )
      ( MAKE-ON-VERIFY ?AUTO_1089 ?AUTO_1090 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1095 - BLOCK
      ?AUTO_1096 - BLOCK
    )
    :vars
    (
      ?AUTO_1098 - BLOCK
      ?AUTO_1097 - BLOCK
      ?AUTO_1099 - BLOCK
      ?AUTO_1100 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1095 ?AUTO_1096 ) ) ( ON ?AUTO_1095 ?AUTO_1098 ) ( not ( = ?AUTO_1095 ?AUTO_1098 ) ) ( not ( = ?AUTO_1096 ?AUTO_1098 ) ) ( not ( = ?AUTO_1095 ?AUTO_1097 ) ) ( not ( = ?AUTO_1095 ?AUTO_1099 ) ) ( not ( = ?AUTO_1096 ?AUTO_1097 ) ) ( not ( = ?AUTO_1096 ?AUTO_1099 ) ) ( not ( = ?AUTO_1098 ?AUTO_1097 ) ) ( not ( = ?AUTO_1098 ?AUTO_1099 ) ) ( not ( = ?AUTO_1097 ?AUTO_1099 ) ) ( ON ?AUTO_1097 ?AUTO_1096 ) ( not ( = ?AUTO_1095 ?AUTO_1100 ) ) ( not ( = ?AUTO_1096 ?AUTO_1100 ) ) ( not ( = ?AUTO_1098 ?AUTO_1100 ) ) ( not ( = ?AUTO_1097 ?AUTO_1100 ) ) ( not ( = ?AUTO_1099 ?AUTO_1100 ) ) ( ON ?AUTO_1099 ?AUTO_1095 ) ( CLEAR ?AUTO_1099 ) ( ON ?AUTO_1100 ?AUTO_1097 ) ( CLEAR ?AUTO_1100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1100 ?AUTO_1097 )
      ( MAKE-ON ?AUTO_1095 ?AUTO_1096 )
      ( MAKE-ON-VERIFY ?AUTO_1095 ?AUTO_1096 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1101 - BLOCK
      ?AUTO_1102 - BLOCK
    )
    :vars
    (
      ?AUTO_1103 - BLOCK
      ?AUTO_1104 - BLOCK
      ?AUTO_1105 - BLOCK
      ?AUTO_1106 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1101 ?AUTO_1102 ) ) ( ON ?AUTO_1101 ?AUTO_1103 ) ( not ( = ?AUTO_1101 ?AUTO_1103 ) ) ( not ( = ?AUTO_1102 ?AUTO_1103 ) ) ( not ( = ?AUTO_1101 ?AUTO_1104 ) ) ( not ( = ?AUTO_1101 ?AUTO_1105 ) ) ( not ( = ?AUTO_1102 ?AUTO_1104 ) ) ( not ( = ?AUTO_1102 ?AUTO_1105 ) ) ( not ( = ?AUTO_1103 ?AUTO_1104 ) ) ( not ( = ?AUTO_1103 ?AUTO_1105 ) ) ( not ( = ?AUTO_1104 ?AUTO_1105 ) ) ( ON ?AUTO_1104 ?AUTO_1102 ) ( not ( = ?AUTO_1101 ?AUTO_1106 ) ) ( not ( = ?AUTO_1102 ?AUTO_1106 ) ) ( not ( = ?AUTO_1103 ?AUTO_1106 ) ) ( not ( = ?AUTO_1104 ?AUTO_1106 ) ) ( not ( = ?AUTO_1105 ?AUTO_1106 ) ) ( ON ?AUTO_1106 ?AUTO_1104 ) ( CLEAR ?AUTO_1106 ) ( HOLDING ?AUTO_1105 ) ( CLEAR ?AUTO_1101 ) )
    :subtasks
    ( ( !STACK ?AUTO_1105 ?AUTO_1101 )
      ( MAKE-ON ?AUTO_1101 ?AUTO_1102 )
      ( MAKE-ON-VERIFY ?AUTO_1101 ?AUTO_1102 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1107 - BLOCK
      ?AUTO_1108 - BLOCK
    )
    :vars
    (
      ?AUTO_1109 - BLOCK
      ?AUTO_1110 - BLOCK
      ?AUTO_1111 - BLOCK
      ?AUTO_1112 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1107 ?AUTO_1108 ) ) ( ON ?AUTO_1107 ?AUTO_1109 ) ( not ( = ?AUTO_1107 ?AUTO_1109 ) ) ( not ( = ?AUTO_1108 ?AUTO_1109 ) ) ( not ( = ?AUTO_1107 ?AUTO_1110 ) ) ( not ( = ?AUTO_1107 ?AUTO_1111 ) ) ( not ( = ?AUTO_1108 ?AUTO_1110 ) ) ( not ( = ?AUTO_1108 ?AUTO_1111 ) ) ( not ( = ?AUTO_1109 ?AUTO_1110 ) ) ( not ( = ?AUTO_1109 ?AUTO_1111 ) ) ( not ( = ?AUTO_1110 ?AUTO_1111 ) ) ( ON ?AUTO_1110 ?AUTO_1108 ) ( not ( = ?AUTO_1107 ?AUTO_1112 ) ) ( not ( = ?AUTO_1108 ?AUTO_1112 ) ) ( not ( = ?AUTO_1109 ?AUTO_1112 ) ) ( not ( = ?AUTO_1110 ?AUTO_1112 ) ) ( not ( = ?AUTO_1111 ?AUTO_1112 ) ) ( ON ?AUTO_1112 ?AUTO_1110 ) ( CLEAR ?AUTO_1107 ) ( ON ?AUTO_1111 ?AUTO_1112 ) ( CLEAR ?AUTO_1111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1111 ?AUTO_1112 )
      ( MAKE-ON ?AUTO_1107 ?AUTO_1108 )
      ( MAKE-ON-VERIFY ?AUTO_1107 ?AUTO_1108 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1115 - BLOCK
      ?AUTO_1116 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1115 ) ( CLEAR ?AUTO_1116 ) ( not ( = ?AUTO_1115 ?AUTO_1116 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1115 ?AUTO_1116 )
      ( MAKE-ON-VERIFY ?AUTO_1115 ?AUTO_1116 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1117 - BLOCK
      ?AUTO_1118 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1118 ) ( not ( = ?AUTO_1117 ?AUTO_1118 ) ) ( ON-TABLE ?AUTO_1117 ) ( CLEAR ?AUTO_1117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1117 )
      ( MAKE-ON ?AUTO_1117 ?AUTO_1118 )
      ( MAKE-ON-VERIFY ?AUTO_1117 ?AUTO_1118 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1119 - BLOCK
      ?AUTO_1120 - BLOCK
    )
    :vars
    (
      ?AUTO_1121 - BLOCK
      ?AUTO_1122 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1120 ) ( not ( = ?AUTO_1119 ?AUTO_1120 ) ) ( ON-TABLE ?AUTO_1119 ) ( CLEAR ?AUTO_1119 ) ( HOLDING ?AUTO_1121 ) ( CLEAR ?AUTO_1122 ) ( not ( = ?AUTO_1119 ?AUTO_1121 ) ) ( not ( = ?AUTO_1119 ?AUTO_1122 ) ) ( not ( = ?AUTO_1120 ?AUTO_1121 ) ) ( not ( = ?AUTO_1120 ?AUTO_1122 ) ) ( not ( = ?AUTO_1121 ?AUTO_1122 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1121 ?AUTO_1122 )
      ( MAKE-ON ?AUTO_1119 ?AUTO_1120 )
      ( MAKE-ON-VERIFY ?AUTO_1119 ?AUTO_1120 ) )
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
    )
    :precondition
    ( and ( not ( = ?AUTO_1125 ?AUTO_1126 ) ) ( ON-TABLE ?AUTO_1125 ) ( CLEAR ?AUTO_1125 ) ( HOLDING ?AUTO_1126 ) ( CLEAR ?AUTO_1127 ) ( not ( = ?AUTO_1125 ?AUTO_1127 ) ) ( not ( = ?AUTO_1126 ?AUTO_1127 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1126 ?AUTO_1127 )
      ( MAKE-ON ?AUTO_1125 ?AUTO_1126 )
      ( MAKE-ON-VERIFY ?AUTO_1125 ?AUTO_1126 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1136 - BLOCK
      ?AUTO_1137 - BLOCK
    )
    :vars
    (
      ?AUTO_1138 - BLOCK
      ?AUTO_1139 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1136 ?AUTO_1137 ) ) ( ON-TABLE ?AUTO_1136 ) ( CLEAR ?AUTO_1136 ) ( CLEAR ?AUTO_1138 ) ( not ( = ?AUTO_1136 ?AUTO_1139 ) ) ( not ( = ?AUTO_1136 ?AUTO_1138 ) ) ( not ( = ?AUTO_1137 ?AUTO_1139 ) ) ( not ( = ?AUTO_1137 ?AUTO_1138 ) ) ( not ( = ?AUTO_1139 ?AUTO_1138 ) ) ( ON ?AUTO_1139 ?AUTO_1137 ) ( CLEAR ?AUTO_1139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1139 ?AUTO_1137 )
      ( MAKE-ON ?AUTO_1136 ?AUTO_1137 )
      ( MAKE-ON-VERIFY ?AUTO_1136 ?AUTO_1137 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1140 - BLOCK
      ?AUTO_1141 - BLOCK
    )
    :vars
    (
      ?AUTO_1142 - BLOCK
      ?AUTO_1143 - BLOCK
      ?AUTO_1144 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1140 ?AUTO_1141 ) ) ( ON-TABLE ?AUTO_1140 ) ( CLEAR ?AUTO_1140 ) ( not ( = ?AUTO_1140 ?AUTO_1142 ) ) ( not ( = ?AUTO_1140 ?AUTO_1143 ) ) ( not ( = ?AUTO_1141 ?AUTO_1142 ) ) ( not ( = ?AUTO_1141 ?AUTO_1143 ) ) ( not ( = ?AUTO_1142 ?AUTO_1143 ) ) ( ON ?AUTO_1142 ?AUTO_1141 ) ( CLEAR ?AUTO_1142 ) ( HOLDING ?AUTO_1143 ) ( CLEAR ?AUTO_1144 ) ( not ( = ?AUTO_1140 ?AUTO_1144 ) ) ( not ( = ?AUTO_1141 ?AUTO_1144 ) ) ( not ( = ?AUTO_1142 ?AUTO_1144 ) ) ( not ( = ?AUTO_1143 ?AUTO_1144 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1143 ?AUTO_1144 )
      ( MAKE-ON ?AUTO_1140 ?AUTO_1141 )
      ( MAKE-ON-VERIFY ?AUTO_1140 ?AUTO_1141 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1145 - BLOCK
      ?AUTO_1146 - BLOCK
    )
    :vars
    (
      ?AUTO_1149 - BLOCK
      ?AUTO_1147 - BLOCK
      ?AUTO_1148 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1145 ?AUTO_1146 ) ) ( ON-TABLE ?AUTO_1145 ) ( CLEAR ?AUTO_1145 ) ( not ( = ?AUTO_1145 ?AUTO_1149 ) ) ( not ( = ?AUTO_1145 ?AUTO_1147 ) ) ( not ( = ?AUTO_1146 ?AUTO_1149 ) ) ( not ( = ?AUTO_1146 ?AUTO_1147 ) ) ( not ( = ?AUTO_1149 ?AUTO_1147 ) ) ( ON ?AUTO_1149 ?AUTO_1146 ) ( CLEAR ?AUTO_1148 ) ( not ( = ?AUTO_1145 ?AUTO_1148 ) ) ( not ( = ?AUTO_1146 ?AUTO_1148 ) ) ( not ( = ?AUTO_1149 ?AUTO_1148 ) ) ( not ( = ?AUTO_1147 ?AUTO_1148 ) ) ( ON ?AUTO_1147 ?AUTO_1149 ) ( CLEAR ?AUTO_1147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1147 ?AUTO_1149 )
      ( MAKE-ON ?AUTO_1145 ?AUTO_1146 )
      ( MAKE-ON-VERIFY ?AUTO_1145 ?AUTO_1146 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1151 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1151 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1151 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1151 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1152 - BLOCK
    )
    :vars
    (
      ?AUTO_1153 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1152 ?AUTO_1153 ) ( CLEAR ?AUTO_1152 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1152 ?AUTO_1153 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1152 ?AUTO_1153 )
      ( MAKE-ON-TABLE ?AUTO_1152 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1152 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1156 - BLOCK
      ?AUTO_1157 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1156 ) ( CLEAR ?AUTO_1157 ) ( not ( = ?AUTO_1156 ?AUTO_1157 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1156 ?AUTO_1157 )
      ( MAKE-ON-VERIFY ?AUTO_1156 ?AUTO_1157 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1158 - BLOCK
      ?AUTO_1159 - BLOCK
    )
    :vars
    (
      ?AUTO_1160 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1159 ) ( not ( = ?AUTO_1158 ?AUTO_1159 ) ) ( ON ?AUTO_1158 ?AUTO_1160 ) ( CLEAR ?AUTO_1158 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1158 ?AUTO_1160 ) ) ( not ( = ?AUTO_1159 ?AUTO_1160 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1158 ?AUTO_1160 )
      ( MAKE-ON ?AUTO_1158 ?AUTO_1159 )
      ( MAKE-ON-VERIFY ?AUTO_1158 ?AUTO_1159 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1161 - BLOCK
      ?AUTO_1162 - BLOCK
    )
    :vars
    (
      ?AUTO_1163 - BLOCK
      ?AUTO_1164 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1162 ) ( not ( = ?AUTO_1161 ?AUTO_1162 ) ) ( ON ?AUTO_1161 ?AUTO_1163 ) ( CLEAR ?AUTO_1161 ) ( not ( = ?AUTO_1161 ?AUTO_1163 ) ) ( not ( = ?AUTO_1162 ?AUTO_1163 ) ) ( HOLDING ?AUTO_1164 ) ( not ( = ?AUTO_1161 ?AUTO_1164 ) ) ( not ( = ?AUTO_1162 ?AUTO_1164 ) ) ( not ( = ?AUTO_1163 ?AUTO_1164 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1164 )
      ( MAKE-ON ?AUTO_1161 ?AUTO_1162 )
      ( MAKE-ON-VERIFY ?AUTO_1161 ?AUTO_1162 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1165 - BLOCK
      ?AUTO_1166 - BLOCK
    )
    :vars
    (
      ?AUTO_1167 - BLOCK
      ?AUTO_1168 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1165 ?AUTO_1166 ) ) ( ON ?AUTO_1165 ?AUTO_1167 ) ( CLEAR ?AUTO_1165 ) ( not ( = ?AUTO_1165 ?AUTO_1167 ) ) ( not ( = ?AUTO_1166 ?AUTO_1167 ) ) ( not ( = ?AUTO_1165 ?AUTO_1168 ) ) ( not ( = ?AUTO_1166 ?AUTO_1168 ) ) ( not ( = ?AUTO_1167 ?AUTO_1168 ) ) ( ON ?AUTO_1168 ?AUTO_1166 ) ( CLEAR ?AUTO_1168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1168 ?AUTO_1166 )
      ( MAKE-ON ?AUTO_1165 ?AUTO_1166 )
      ( MAKE-ON-VERIFY ?AUTO_1165 ?AUTO_1166 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1171 - BLOCK
      ?AUTO_1172 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1171 ) ( CLEAR ?AUTO_1172 ) ( not ( = ?AUTO_1171 ?AUTO_1172 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1171 ?AUTO_1172 )
      ( MAKE-ON-VERIFY ?AUTO_1171 ?AUTO_1172 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1173 - BLOCK
      ?AUTO_1174 - BLOCK
    )
    :vars
    (
      ?AUTO_1175 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1174 ) ( not ( = ?AUTO_1173 ?AUTO_1174 ) ) ( ON ?AUTO_1173 ?AUTO_1175 ) ( CLEAR ?AUTO_1173 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1173 ?AUTO_1175 ) ) ( not ( = ?AUTO_1174 ?AUTO_1175 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1173 ?AUTO_1175 )
      ( MAKE-ON ?AUTO_1173 ?AUTO_1174 )
      ( MAKE-ON-VERIFY ?AUTO_1173 ?AUTO_1174 ) )
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
    )
    :precondition
    ( and ( CLEAR ?AUTO_1177 ) ( not ( = ?AUTO_1176 ?AUTO_1177 ) ) ( ON ?AUTO_1176 ?AUTO_1178 ) ( CLEAR ?AUTO_1176 ) ( not ( = ?AUTO_1176 ?AUTO_1178 ) ) ( not ( = ?AUTO_1177 ?AUTO_1178 ) ) ( HOLDING ?AUTO_1179 ) ( CLEAR ?AUTO_1180 ) ( not ( = ?AUTO_1176 ?AUTO_1179 ) ) ( not ( = ?AUTO_1176 ?AUTO_1180 ) ) ( not ( = ?AUTO_1177 ?AUTO_1179 ) ) ( not ( = ?AUTO_1177 ?AUTO_1180 ) ) ( not ( = ?AUTO_1178 ?AUTO_1179 ) ) ( not ( = ?AUTO_1178 ?AUTO_1180 ) ) ( not ( = ?AUTO_1179 ?AUTO_1180 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1179 ?AUTO_1180 )
      ( MAKE-ON ?AUTO_1176 ?AUTO_1177 )
      ( MAKE-ON-VERIFY ?AUTO_1176 ?AUTO_1177 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1189 - BLOCK
      ?AUTO_1190 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1189 ) ( CLEAR ?AUTO_1190 ) ( not ( = ?AUTO_1189 ?AUTO_1190 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1189 ?AUTO_1190 )
      ( MAKE-ON-VERIFY ?AUTO_1189 ?AUTO_1190 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1191 - BLOCK
      ?AUTO_1192 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1192 ) ( not ( = ?AUTO_1191 ?AUTO_1192 ) ) ( ON-TABLE ?AUTO_1191 ) ( CLEAR ?AUTO_1191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1191 )
      ( MAKE-ON ?AUTO_1191 ?AUTO_1192 )
      ( MAKE-ON-VERIFY ?AUTO_1191 ?AUTO_1192 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1193 - BLOCK
      ?AUTO_1194 - BLOCK
    )
    :vars
    (
      ?AUTO_1195 - BLOCK
      ?AUTO_1196 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1194 ) ( not ( = ?AUTO_1193 ?AUTO_1194 ) ) ( ON-TABLE ?AUTO_1193 ) ( CLEAR ?AUTO_1193 ) ( HOLDING ?AUTO_1195 ) ( CLEAR ?AUTO_1196 ) ( not ( = ?AUTO_1193 ?AUTO_1195 ) ) ( not ( = ?AUTO_1193 ?AUTO_1196 ) ) ( not ( = ?AUTO_1194 ?AUTO_1195 ) ) ( not ( = ?AUTO_1194 ?AUTO_1196 ) ) ( not ( = ?AUTO_1195 ?AUTO_1196 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1195 ?AUTO_1196 )
      ( MAKE-ON ?AUTO_1193 ?AUTO_1194 )
      ( MAKE-ON-VERIFY ?AUTO_1193 ?AUTO_1194 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1197 - BLOCK
      ?AUTO_1198 - BLOCK
    )
    :vars
    (
      ?AUTO_1199 - BLOCK
      ?AUTO_1200 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1198 ) ( not ( = ?AUTO_1197 ?AUTO_1198 ) ) ( ON-TABLE ?AUTO_1197 ) ( CLEAR ?AUTO_1199 ) ( not ( = ?AUTO_1197 ?AUTO_1200 ) ) ( not ( = ?AUTO_1197 ?AUTO_1199 ) ) ( not ( = ?AUTO_1198 ?AUTO_1200 ) ) ( not ( = ?AUTO_1198 ?AUTO_1199 ) ) ( not ( = ?AUTO_1200 ?AUTO_1199 ) ) ( ON ?AUTO_1200 ?AUTO_1197 ) ( CLEAR ?AUTO_1200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1200 ?AUTO_1197 )
      ( MAKE-ON ?AUTO_1197 ?AUTO_1198 )
      ( MAKE-ON-VERIFY ?AUTO_1197 ?AUTO_1198 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1201 - BLOCK
      ?AUTO_1202 - BLOCK
    )
    :vars
    (
      ?AUTO_1204 - BLOCK
      ?AUTO_1203 - BLOCK
      ?AUTO_1205 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1201 ?AUTO_1202 ) ) ( ON-TABLE ?AUTO_1201 ) ( CLEAR ?AUTO_1204 ) ( not ( = ?AUTO_1201 ?AUTO_1203 ) ) ( not ( = ?AUTO_1201 ?AUTO_1204 ) ) ( not ( = ?AUTO_1202 ?AUTO_1203 ) ) ( not ( = ?AUTO_1202 ?AUTO_1204 ) ) ( not ( = ?AUTO_1203 ?AUTO_1204 ) ) ( ON ?AUTO_1203 ?AUTO_1201 ) ( CLEAR ?AUTO_1203 ) ( HOLDING ?AUTO_1202 ) ( CLEAR ?AUTO_1205 ) ( not ( = ?AUTO_1201 ?AUTO_1205 ) ) ( not ( = ?AUTO_1202 ?AUTO_1205 ) ) ( not ( = ?AUTO_1204 ?AUTO_1205 ) ) ( not ( = ?AUTO_1203 ?AUTO_1205 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1202 ?AUTO_1205 )
      ( MAKE-ON ?AUTO_1201 ?AUTO_1202 )
      ( MAKE-ON-VERIFY ?AUTO_1201 ?AUTO_1202 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1208 - BLOCK
      ?AUTO_1209 - BLOCK
    )
    :vars
    (
      ?AUTO_1211 - BLOCK
      ?AUTO_1210 - BLOCK
      ?AUTO_1212 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1209 ) ( not ( = ?AUTO_1208 ?AUTO_1209 ) ) ( ON-TABLE ?AUTO_1208 ) ( CLEAR ?AUTO_1211 ) ( not ( = ?AUTO_1208 ?AUTO_1210 ) ) ( not ( = ?AUTO_1208 ?AUTO_1211 ) ) ( not ( = ?AUTO_1209 ?AUTO_1210 ) ) ( not ( = ?AUTO_1209 ?AUTO_1211 ) ) ( not ( = ?AUTO_1210 ?AUTO_1211 ) ) ( ON ?AUTO_1210 ?AUTO_1208 ) ( CLEAR ?AUTO_1210 ) ( HOLDING ?AUTO_1212 ) ( not ( = ?AUTO_1208 ?AUTO_1212 ) ) ( not ( = ?AUTO_1209 ?AUTO_1212 ) ) ( not ( = ?AUTO_1211 ?AUTO_1212 ) ) ( not ( = ?AUTO_1210 ?AUTO_1212 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1212 )
      ( MAKE-ON ?AUTO_1208 ?AUTO_1209 )
      ( MAKE-ON-VERIFY ?AUTO_1208 ?AUTO_1209 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1216 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1216 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1216 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1216 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1217 - BLOCK
    )
    :vars
    (
      ?AUTO_1218 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1217 ?AUTO_1218 ) ( CLEAR ?AUTO_1217 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1217 ?AUTO_1218 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1217 ?AUTO_1218 )
      ( MAKE-ON-TABLE ?AUTO_1217 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1217 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1219 - BLOCK
    )
    :vars
    (
      ?AUTO_1220 - BLOCK
      ?AUTO_1221 - BLOCK
      ?AUTO_1222 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1219 ?AUTO_1220 ) ( CLEAR ?AUTO_1219 ) ( not ( = ?AUTO_1219 ?AUTO_1220 ) ) ( HOLDING ?AUTO_1221 ) ( CLEAR ?AUTO_1222 ) ( not ( = ?AUTO_1219 ?AUTO_1221 ) ) ( not ( = ?AUTO_1219 ?AUTO_1222 ) ) ( not ( = ?AUTO_1220 ?AUTO_1221 ) ) ( not ( = ?AUTO_1220 ?AUTO_1222 ) ) ( not ( = ?AUTO_1221 ?AUTO_1222 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1221 ?AUTO_1222 )
      ( MAKE-ON-TABLE ?AUTO_1219 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1219 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1227 - BLOCK
    )
    :vars
    (
      ?AUTO_1228 - BLOCK
      ?AUTO_1230 - BLOCK
      ?AUTO_1229 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1227 ?AUTO_1228 ) ( not ( = ?AUTO_1227 ?AUTO_1228 ) ) ( CLEAR ?AUTO_1230 ) ( not ( = ?AUTO_1227 ?AUTO_1229 ) ) ( not ( = ?AUTO_1227 ?AUTO_1230 ) ) ( not ( = ?AUTO_1228 ?AUTO_1229 ) ) ( not ( = ?AUTO_1228 ?AUTO_1230 ) ) ( not ( = ?AUTO_1229 ?AUTO_1230 ) ) ( ON ?AUTO_1229 ?AUTO_1227 ) ( CLEAR ?AUTO_1229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1229 ?AUTO_1227 )
      ( MAKE-ON-TABLE ?AUTO_1227 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1227 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1231 - BLOCK
    )
    :vars
    (
      ?AUTO_1233 - BLOCK
      ?AUTO_1234 - BLOCK
      ?AUTO_1232 - BLOCK
      ?AUTO_1235 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1231 ?AUTO_1233 ) ( not ( = ?AUTO_1231 ?AUTO_1233 ) ) ( CLEAR ?AUTO_1234 ) ( not ( = ?AUTO_1231 ?AUTO_1232 ) ) ( not ( = ?AUTO_1231 ?AUTO_1234 ) ) ( not ( = ?AUTO_1233 ?AUTO_1232 ) ) ( not ( = ?AUTO_1233 ?AUTO_1234 ) ) ( not ( = ?AUTO_1232 ?AUTO_1234 ) ) ( ON ?AUTO_1232 ?AUTO_1231 ) ( CLEAR ?AUTO_1232 ) ( HOLDING ?AUTO_1235 ) ( not ( = ?AUTO_1231 ?AUTO_1235 ) ) ( not ( = ?AUTO_1233 ?AUTO_1235 ) ) ( not ( = ?AUTO_1234 ?AUTO_1235 ) ) ( not ( = ?AUTO_1232 ?AUTO_1235 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1235 )
      ( MAKE-ON-TABLE ?AUTO_1231 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1231 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1239 - BLOCK
      ?AUTO_1240 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1239 ) ( CLEAR ?AUTO_1240 ) ( not ( = ?AUTO_1239 ?AUTO_1240 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1239 ?AUTO_1240 )
      ( MAKE-ON-VERIFY ?AUTO_1239 ?AUTO_1240 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1241 - BLOCK
      ?AUTO_1242 - BLOCK
    )
    :vars
    (
      ?AUTO_1243 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1242 ) ( not ( = ?AUTO_1241 ?AUTO_1242 ) ) ( ON ?AUTO_1241 ?AUTO_1243 ) ( CLEAR ?AUTO_1241 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1241 ?AUTO_1243 ) ) ( not ( = ?AUTO_1242 ?AUTO_1243 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1241 ?AUTO_1243 )
      ( MAKE-ON ?AUTO_1241 ?AUTO_1242 )
      ( MAKE-ON-VERIFY ?AUTO_1241 ?AUTO_1242 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1244 - BLOCK
      ?AUTO_1245 - BLOCK
    )
    :vars
    (
      ?AUTO_1246 - BLOCK
      ?AUTO_1247 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1245 ) ( not ( = ?AUTO_1244 ?AUTO_1245 ) ) ( ON ?AUTO_1244 ?AUTO_1246 ) ( CLEAR ?AUTO_1244 ) ( not ( = ?AUTO_1244 ?AUTO_1246 ) ) ( not ( = ?AUTO_1245 ?AUTO_1246 ) ) ( HOLDING ?AUTO_1247 ) ( not ( = ?AUTO_1244 ?AUTO_1247 ) ) ( not ( = ?AUTO_1245 ?AUTO_1247 ) ) ( not ( = ?AUTO_1246 ?AUTO_1247 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1247 )
      ( MAKE-ON ?AUTO_1244 ?AUTO_1245 )
      ( MAKE-ON-VERIFY ?AUTO_1244 ?AUTO_1245 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1248 - BLOCK
      ?AUTO_1249 - BLOCK
    )
    :vars
    (
      ?AUTO_1250 - BLOCK
      ?AUTO_1251 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1249 ) ( not ( = ?AUTO_1248 ?AUTO_1249 ) ) ( ON ?AUTO_1248 ?AUTO_1250 ) ( not ( = ?AUTO_1248 ?AUTO_1250 ) ) ( not ( = ?AUTO_1249 ?AUTO_1250 ) ) ( not ( = ?AUTO_1248 ?AUTO_1251 ) ) ( not ( = ?AUTO_1249 ?AUTO_1251 ) ) ( not ( = ?AUTO_1250 ?AUTO_1251 ) ) ( ON ?AUTO_1251 ?AUTO_1248 ) ( CLEAR ?AUTO_1251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1251 ?AUTO_1248 )
      ( MAKE-ON ?AUTO_1248 ?AUTO_1249 )
      ( MAKE-ON-VERIFY ?AUTO_1248 ?AUTO_1249 ) )
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
      ?AUTO_1254 - BLOCK
      ?AUTO_1256 - BLOCK
      ?AUTO_1257 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1253 ) ( not ( = ?AUTO_1252 ?AUTO_1253 ) ) ( ON ?AUTO_1252 ?AUTO_1255 ) ( not ( = ?AUTO_1252 ?AUTO_1255 ) ) ( not ( = ?AUTO_1253 ?AUTO_1255 ) ) ( not ( = ?AUTO_1252 ?AUTO_1254 ) ) ( not ( = ?AUTO_1253 ?AUTO_1254 ) ) ( not ( = ?AUTO_1255 ?AUTO_1254 ) ) ( ON ?AUTO_1254 ?AUTO_1252 ) ( CLEAR ?AUTO_1254 ) ( HOLDING ?AUTO_1256 ) ( CLEAR ?AUTO_1257 ) ( not ( = ?AUTO_1252 ?AUTO_1256 ) ) ( not ( = ?AUTO_1252 ?AUTO_1257 ) ) ( not ( = ?AUTO_1253 ?AUTO_1256 ) ) ( not ( = ?AUTO_1253 ?AUTO_1257 ) ) ( not ( = ?AUTO_1255 ?AUTO_1256 ) ) ( not ( = ?AUTO_1255 ?AUTO_1257 ) ) ( not ( = ?AUTO_1254 ?AUTO_1256 ) ) ( not ( = ?AUTO_1254 ?AUTO_1257 ) ) ( not ( = ?AUTO_1256 ?AUTO_1257 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1256 ?AUTO_1257 )
      ( MAKE-ON ?AUTO_1252 ?AUTO_1253 )
      ( MAKE-ON-VERIFY ?AUTO_1252 ?AUTO_1253 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1266 - BLOCK
      ?AUTO_1267 - BLOCK
    )
    :vars
    (
      ?AUTO_1270 - BLOCK
      ?AUTO_1271 - BLOCK
      ?AUTO_1269 - BLOCK
      ?AUTO_1268 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1267 ) ( not ( = ?AUTO_1266 ?AUTO_1267 ) ) ( ON ?AUTO_1266 ?AUTO_1270 ) ( not ( = ?AUTO_1266 ?AUTO_1270 ) ) ( not ( = ?AUTO_1267 ?AUTO_1270 ) ) ( not ( = ?AUTO_1266 ?AUTO_1271 ) ) ( not ( = ?AUTO_1267 ?AUTO_1271 ) ) ( not ( = ?AUTO_1270 ?AUTO_1271 ) ) ( ON ?AUTO_1271 ?AUTO_1266 ) ( CLEAR ?AUTO_1269 ) ( not ( = ?AUTO_1266 ?AUTO_1268 ) ) ( not ( = ?AUTO_1266 ?AUTO_1269 ) ) ( not ( = ?AUTO_1267 ?AUTO_1268 ) ) ( not ( = ?AUTO_1267 ?AUTO_1269 ) ) ( not ( = ?AUTO_1270 ?AUTO_1268 ) ) ( not ( = ?AUTO_1270 ?AUTO_1269 ) ) ( not ( = ?AUTO_1271 ?AUTO_1268 ) ) ( not ( = ?AUTO_1271 ?AUTO_1269 ) ) ( not ( = ?AUTO_1268 ?AUTO_1269 ) ) ( ON ?AUTO_1268 ?AUTO_1271 ) ( CLEAR ?AUTO_1268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1268 ?AUTO_1271 )
      ( MAKE-ON ?AUTO_1266 ?AUTO_1267 )
      ( MAKE-ON-VERIFY ?AUTO_1266 ?AUTO_1267 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1272 - BLOCK
      ?AUTO_1273 - BLOCK
    )
    :vars
    (
      ?AUTO_1276 - BLOCK
      ?AUTO_1275 - BLOCK
      ?AUTO_1277 - BLOCK
      ?AUTO_1274 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1272 ?AUTO_1273 ) ) ( ON ?AUTO_1272 ?AUTO_1276 ) ( not ( = ?AUTO_1272 ?AUTO_1276 ) ) ( not ( = ?AUTO_1273 ?AUTO_1276 ) ) ( not ( = ?AUTO_1272 ?AUTO_1275 ) ) ( not ( = ?AUTO_1273 ?AUTO_1275 ) ) ( not ( = ?AUTO_1276 ?AUTO_1275 ) ) ( ON ?AUTO_1275 ?AUTO_1272 ) ( CLEAR ?AUTO_1277 ) ( not ( = ?AUTO_1272 ?AUTO_1274 ) ) ( not ( = ?AUTO_1272 ?AUTO_1277 ) ) ( not ( = ?AUTO_1273 ?AUTO_1274 ) ) ( not ( = ?AUTO_1273 ?AUTO_1277 ) ) ( not ( = ?AUTO_1276 ?AUTO_1274 ) ) ( not ( = ?AUTO_1276 ?AUTO_1277 ) ) ( not ( = ?AUTO_1275 ?AUTO_1274 ) ) ( not ( = ?AUTO_1275 ?AUTO_1277 ) ) ( not ( = ?AUTO_1274 ?AUTO_1277 ) ) ( ON ?AUTO_1274 ?AUTO_1275 ) ( CLEAR ?AUTO_1274 ) ( HOLDING ?AUTO_1273 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1273 )
      ( MAKE-ON ?AUTO_1272 ?AUTO_1273 )
      ( MAKE-ON-VERIFY ?AUTO_1272 ?AUTO_1273 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1282 - BLOCK
      ?AUTO_1283 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1282 ) ( CLEAR ?AUTO_1283 ) ( not ( = ?AUTO_1282 ?AUTO_1283 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1282 ?AUTO_1283 )
      ( MAKE-ON-VERIFY ?AUTO_1282 ?AUTO_1283 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1284 - BLOCK
      ?AUTO_1285 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1285 ) ( not ( = ?AUTO_1284 ?AUTO_1285 ) ) ( ON-TABLE ?AUTO_1284 ) ( CLEAR ?AUTO_1284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1284 )
      ( MAKE-ON ?AUTO_1284 ?AUTO_1285 )
      ( MAKE-ON-VERIFY ?AUTO_1284 ?AUTO_1285 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1286 - BLOCK
      ?AUTO_1287 - BLOCK
    )
    :vars
    (
      ?AUTO_1288 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1286 ?AUTO_1287 ) ) ( ON-TABLE ?AUTO_1286 ) ( CLEAR ?AUTO_1286 ) ( HOLDING ?AUTO_1287 ) ( CLEAR ?AUTO_1288 ) ( not ( = ?AUTO_1286 ?AUTO_1288 ) ) ( not ( = ?AUTO_1287 ?AUTO_1288 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1287 ?AUTO_1288 )
      ( MAKE-ON ?AUTO_1286 ?AUTO_1287 )
      ( MAKE-ON-VERIFY ?AUTO_1286 ?AUTO_1287 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1347 - BLOCK
      ?AUTO_1348 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1347 ) ( CLEAR ?AUTO_1348 ) ( not ( = ?AUTO_1347 ?AUTO_1348 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1347 ?AUTO_1348 )
      ( MAKE-ON-VERIFY ?AUTO_1347 ?AUTO_1348 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1349 - BLOCK
      ?AUTO_1350 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1350 ) ( not ( = ?AUTO_1349 ?AUTO_1350 ) ) ( ON-TABLE ?AUTO_1349 ) ( CLEAR ?AUTO_1349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1349 )
      ( MAKE-ON ?AUTO_1349 ?AUTO_1350 )
      ( MAKE-ON-VERIFY ?AUTO_1349 ?AUTO_1350 ) )
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
    )
    :precondition
    ( and ( not ( = ?AUTO_1351 ?AUTO_1352 ) ) ( ON-TABLE ?AUTO_1351 ) ( CLEAR ?AUTO_1351 ) ( HOLDING ?AUTO_1352 ) ( CLEAR ?AUTO_1353 ) ( not ( = ?AUTO_1351 ?AUTO_1353 ) ) ( not ( = ?AUTO_1352 ?AUTO_1353 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1352 ?AUTO_1353 )
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
    )
    :precondition
    ( and ( CLEAR ?AUTO_1357 ) ( not ( = ?AUTO_1356 ?AUTO_1357 ) ) ( ON-TABLE ?AUTO_1356 ) ( CLEAR ?AUTO_1356 ) ( HOLDING ?AUTO_1358 ) ( CLEAR ?AUTO_1359 ) ( not ( = ?AUTO_1356 ?AUTO_1358 ) ) ( not ( = ?AUTO_1356 ?AUTO_1359 ) ) ( not ( = ?AUTO_1357 ?AUTO_1358 ) ) ( not ( = ?AUTO_1357 ?AUTO_1359 ) ) ( not ( = ?AUTO_1358 ?AUTO_1359 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1358 ?AUTO_1359 )
      ( MAKE-ON ?AUTO_1356 ?AUTO_1357 )
      ( MAKE-ON-VERIFY ?AUTO_1356 ?AUTO_1357 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1360 - BLOCK
      ?AUTO_1361 - BLOCK
    )
    :vars
    (
      ?AUTO_1362 - BLOCK
      ?AUTO_1363 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1361 ) ( not ( = ?AUTO_1360 ?AUTO_1361 ) ) ( ON-TABLE ?AUTO_1360 ) ( CLEAR ?AUTO_1362 ) ( not ( = ?AUTO_1360 ?AUTO_1363 ) ) ( not ( = ?AUTO_1360 ?AUTO_1362 ) ) ( not ( = ?AUTO_1361 ?AUTO_1363 ) ) ( not ( = ?AUTO_1361 ?AUTO_1362 ) ) ( not ( = ?AUTO_1363 ?AUTO_1362 ) ) ( ON ?AUTO_1363 ?AUTO_1360 ) ( CLEAR ?AUTO_1363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1363 ?AUTO_1360 )
      ( MAKE-ON ?AUTO_1360 ?AUTO_1361 )
      ( MAKE-ON-VERIFY ?AUTO_1360 ?AUTO_1361 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1364 - BLOCK
      ?AUTO_1365 - BLOCK
    )
    :vars
    (
      ?AUTO_1366 - BLOCK
      ?AUTO_1367 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1364 ?AUTO_1365 ) ) ( ON-TABLE ?AUTO_1364 ) ( CLEAR ?AUTO_1366 ) ( not ( = ?AUTO_1364 ?AUTO_1367 ) ) ( not ( = ?AUTO_1364 ?AUTO_1366 ) ) ( not ( = ?AUTO_1365 ?AUTO_1367 ) ) ( not ( = ?AUTO_1365 ?AUTO_1366 ) ) ( not ( = ?AUTO_1367 ?AUTO_1366 ) ) ( ON ?AUTO_1367 ?AUTO_1364 ) ( CLEAR ?AUTO_1367 ) ( HOLDING ?AUTO_1365 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1365 )
      ( MAKE-ON ?AUTO_1364 ?AUTO_1365 )
      ( MAKE-ON-VERIFY ?AUTO_1364 ?AUTO_1365 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1368 - BLOCK
      ?AUTO_1369 - BLOCK
    )
    :vars
    (
      ?AUTO_1370 - BLOCK
      ?AUTO_1371 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1368 ?AUTO_1369 ) ) ( ON-TABLE ?AUTO_1368 ) ( CLEAR ?AUTO_1370 ) ( not ( = ?AUTO_1368 ?AUTO_1371 ) ) ( not ( = ?AUTO_1368 ?AUTO_1370 ) ) ( not ( = ?AUTO_1369 ?AUTO_1371 ) ) ( not ( = ?AUTO_1369 ?AUTO_1370 ) ) ( not ( = ?AUTO_1371 ?AUTO_1370 ) ) ( ON ?AUTO_1371 ?AUTO_1368 ) ( ON ?AUTO_1369 ?AUTO_1371 ) ( CLEAR ?AUTO_1369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1369 ?AUTO_1371 )
      ( MAKE-ON ?AUTO_1368 ?AUTO_1369 )
      ( MAKE-ON-VERIFY ?AUTO_1368 ?AUTO_1369 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1372 - BLOCK
      ?AUTO_1373 - BLOCK
    )
    :vars
    (
      ?AUTO_1375 - BLOCK
      ?AUTO_1374 - BLOCK
      ?AUTO_1376 - BLOCK
      ?AUTO_1377 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1372 ?AUTO_1373 ) ) ( ON-TABLE ?AUTO_1372 ) ( CLEAR ?AUTO_1375 ) ( not ( = ?AUTO_1372 ?AUTO_1374 ) ) ( not ( = ?AUTO_1372 ?AUTO_1375 ) ) ( not ( = ?AUTO_1373 ?AUTO_1374 ) ) ( not ( = ?AUTO_1373 ?AUTO_1375 ) ) ( not ( = ?AUTO_1374 ?AUTO_1375 ) ) ( ON ?AUTO_1374 ?AUTO_1372 ) ( ON ?AUTO_1373 ?AUTO_1374 ) ( CLEAR ?AUTO_1373 ) ( HOLDING ?AUTO_1376 ) ( CLEAR ?AUTO_1377 ) ( not ( = ?AUTO_1372 ?AUTO_1376 ) ) ( not ( = ?AUTO_1372 ?AUTO_1377 ) ) ( not ( = ?AUTO_1373 ?AUTO_1376 ) ) ( not ( = ?AUTO_1373 ?AUTO_1377 ) ) ( not ( = ?AUTO_1375 ?AUTO_1376 ) ) ( not ( = ?AUTO_1375 ?AUTO_1377 ) ) ( not ( = ?AUTO_1374 ?AUTO_1376 ) ) ( not ( = ?AUTO_1374 ?AUTO_1377 ) ) ( not ( = ?AUTO_1376 ?AUTO_1377 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1376 ?AUTO_1377 )
      ( MAKE-ON ?AUTO_1372 ?AUTO_1373 )
      ( MAKE-ON-VERIFY ?AUTO_1372 ?AUTO_1373 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1386 - BLOCK
      ?AUTO_1387 - BLOCK
    )
    :vars
    (
      ?AUTO_1389 - BLOCK
      ?AUTO_1391 - BLOCK
      ?AUTO_1390 - BLOCK
      ?AUTO_1388 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1386 ?AUTO_1387 ) ) ( ON-TABLE ?AUTO_1386 ) ( CLEAR ?AUTO_1389 ) ( not ( = ?AUTO_1386 ?AUTO_1391 ) ) ( not ( = ?AUTO_1386 ?AUTO_1389 ) ) ( not ( = ?AUTO_1387 ?AUTO_1391 ) ) ( not ( = ?AUTO_1387 ?AUTO_1389 ) ) ( not ( = ?AUTO_1391 ?AUTO_1389 ) ) ( ON ?AUTO_1391 ?AUTO_1386 ) ( ON ?AUTO_1387 ?AUTO_1391 ) ( CLEAR ?AUTO_1390 ) ( not ( = ?AUTO_1386 ?AUTO_1388 ) ) ( not ( = ?AUTO_1386 ?AUTO_1390 ) ) ( not ( = ?AUTO_1387 ?AUTO_1388 ) ) ( not ( = ?AUTO_1387 ?AUTO_1390 ) ) ( not ( = ?AUTO_1389 ?AUTO_1388 ) ) ( not ( = ?AUTO_1389 ?AUTO_1390 ) ) ( not ( = ?AUTO_1391 ?AUTO_1388 ) ) ( not ( = ?AUTO_1391 ?AUTO_1390 ) ) ( not ( = ?AUTO_1388 ?AUTO_1390 ) ) ( ON ?AUTO_1388 ?AUTO_1387 ) ( CLEAR ?AUTO_1388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1388 ?AUTO_1387 )
      ( MAKE-ON ?AUTO_1386 ?AUTO_1387 )
      ( MAKE-ON-VERIFY ?AUTO_1386 ?AUTO_1387 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1392 - BLOCK
      ?AUTO_1393 - BLOCK
    )
    :vars
    (
      ?AUTO_1394 - BLOCK
      ?AUTO_1396 - BLOCK
      ?AUTO_1397 - BLOCK
      ?AUTO_1395 - BLOCK
      ?AUTO_1398 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1392 ?AUTO_1393 ) ) ( ON-TABLE ?AUTO_1392 ) ( CLEAR ?AUTO_1394 ) ( not ( = ?AUTO_1392 ?AUTO_1396 ) ) ( not ( = ?AUTO_1392 ?AUTO_1394 ) ) ( not ( = ?AUTO_1393 ?AUTO_1396 ) ) ( not ( = ?AUTO_1393 ?AUTO_1394 ) ) ( not ( = ?AUTO_1396 ?AUTO_1394 ) ) ( ON ?AUTO_1396 ?AUTO_1392 ) ( ON ?AUTO_1393 ?AUTO_1396 ) ( CLEAR ?AUTO_1397 ) ( not ( = ?AUTO_1392 ?AUTO_1395 ) ) ( not ( = ?AUTO_1392 ?AUTO_1397 ) ) ( not ( = ?AUTO_1393 ?AUTO_1395 ) ) ( not ( = ?AUTO_1393 ?AUTO_1397 ) ) ( not ( = ?AUTO_1394 ?AUTO_1395 ) ) ( not ( = ?AUTO_1394 ?AUTO_1397 ) ) ( not ( = ?AUTO_1396 ?AUTO_1395 ) ) ( not ( = ?AUTO_1396 ?AUTO_1397 ) ) ( not ( = ?AUTO_1395 ?AUTO_1397 ) ) ( ON ?AUTO_1395 ?AUTO_1393 ) ( CLEAR ?AUTO_1395 ) ( HOLDING ?AUTO_1398 ) ( not ( = ?AUTO_1392 ?AUTO_1398 ) ) ( not ( = ?AUTO_1393 ?AUTO_1398 ) ) ( not ( = ?AUTO_1394 ?AUTO_1398 ) ) ( not ( = ?AUTO_1396 ?AUTO_1398 ) ) ( not ( = ?AUTO_1397 ?AUTO_1398 ) ) ( not ( = ?AUTO_1395 ?AUTO_1398 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1398 )
      ( MAKE-ON ?AUTO_1392 ?AUTO_1393 )
      ( MAKE-ON-VERIFY ?AUTO_1392 ?AUTO_1393 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1400 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1400 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1400 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1400 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1401 - BLOCK
    )
    :vars
    (
      ?AUTO_1402 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1401 ?AUTO_1402 ) ( CLEAR ?AUTO_1401 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1401 ?AUTO_1402 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1401 ?AUTO_1402 )
      ( MAKE-ON-TABLE ?AUTO_1401 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1401 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1404 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1404 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1404 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1404 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1405 - BLOCK
    )
    :vars
    (
      ?AUTO_1406 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1405 ?AUTO_1406 ) ( CLEAR ?AUTO_1405 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1405 ?AUTO_1406 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1405 ?AUTO_1406 )
      ( MAKE-ON-TABLE ?AUTO_1405 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1405 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1407 - BLOCK
    )
    :vars
    (
      ?AUTO_1408 - BLOCK
      ?AUTO_1409 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1407 ?AUTO_1408 ) ( CLEAR ?AUTO_1407 ) ( not ( = ?AUTO_1407 ?AUTO_1408 ) ) ( HOLDING ?AUTO_1409 ) ( not ( = ?AUTO_1407 ?AUTO_1409 ) ) ( not ( = ?AUTO_1408 ?AUTO_1409 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1409 )
      ( MAKE-ON-TABLE ?AUTO_1407 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1407 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1410 - BLOCK
    )
    :vars
    (
      ?AUTO_1411 - BLOCK
      ?AUTO_1412 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1410 ?AUTO_1411 ) ( not ( = ?AUTO_1410 ?AUTO_1411 ) ) ( not ( = ?AUTO_1410 ?AUTO_1412 ) ) ( not ( = ?AUTO_1411 ?AUTO_1412 ) ) ( ON ?AUTO_1412 ?AUTO_1410 ) ( CLEAR ?AUTO_1412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1412 ?AUTO_1410 )
      ( MAKE-ON-TABLE ?AUTO_1410 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1410 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1415 - BLOCK
      ?AUTO_1416 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1415 ) ( CLEAR ?AUTO_1416 ) ( not ( = ?AUTO_1415 ?AUTO_1416 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1415 ?AUTO_1416 )
      ( MAKE-ON-VERIFY ?AUTO_1415 ?AUTO_1416 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1417 - BLOCK
      ?AUTO_1418 - BLOCK
    )
    :vars
    (
      ?AUTO_1419 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1418 ) ( not ( = ?AUTO_1417 ?AUTO_1418 ) ) ( ON ?AUTO_1417 ?AUTO_1419 ) ( CLEAR ?AUTO_1417 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1417 ?AUTO_1419 ) ) ( not ( = ?AUTO_1418 ?AUTO_1419 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1417 ?AUTO_1419 )
      ( MAKE-ON ?AUTO_1417 ?AUTO_1418 )
      ( MAKE-ON-VERIFY ?AUTO_1417 ?AUTO_1418 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1420 - BLOCK
      ?AUTO_1421 - BLOCK
    )
    :vars
    (
      ?AUTO_1422 - BLOCK
      ?AUTO_1423 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1421 ) ( not ( = ?AUTO_1420 ?AUTO_1421 ) ) ( ON ?AUTO_1420 ?AUTO_1422 ) ( CLEAR ?AUTO_1420 ) ( not ( = ?AUTO_1420 ?AUTO_1422 ) ) ( not ( = ?AUTO_1421 ?AUTO_1422 ) ) ( HOLDING ?AUTO_1423 ) ( not ( = ?AUTO_1420 ?AUTO_1423 ) ) ( not ( = ?AUTO_1421 ?AUTO_1423 ) ) ( not ( = ?AUTO_1422 ?AUTO_1423 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1423 )
      ( MAKE-ON ?AUTO_1420 ?AUTO_1421 )
      ( MAKE-ON-VERIFY ?AUTO_1420 ?AUTO_1421 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1424 - BLOCK
      ?AUTO_1425 - BLOCK
    )
    :vars
    (
      ?AUTO_1426 - BLOCK
      ?AUTO_1427 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1425 ) ( not ( = ?AUTO_1424 ?AUTO_1425 ) ) ( ON ?AUTO_1424 ?AUTO_1426 ) ( not ( = ?AUTO_1424 ?AUTO_1426 ) ) ( not ( = ?AUTO_1425 ?AUTO_1426 ) ) ( not ( = ?AUTO_1424 ?AUTO_1427 ) ) ( not ( = ?AUTO_1425 ?AUTO_1427 ) ) ( not ( = ?AUTO_1426 ?AUTO_1427 ) ) ( ON ?AUTO_1427 ?AUTO_1424 ) ( CLEAR ?AUTO_1427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1427 ?AUTO_1424 )
      ( MAKE-ON ?AUTO_1424 ?AUTO_1425 )
      ( MAKE-ON-VERIFY ?AUTO_1424 ?AUTO_1425 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1428 - BLOCK
      ?AUTO_1429 - BLOCK
    )
    :vars
    (
      ?AUTO_1430 - BLOCK
      ?AUTO_1431 - BLOCK
      ?AUTO_1432 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1429 ) ( not ( = ?AUTO_1428 ?AUTO_1429 ) ) ( ON ?AUTO_1428 ?AUTO_1430 ) ( not ( = ?AUTO_1428 ?AUTO_1430 ) ) ( not ( = ?AUTO_1429 ?AUTO_1430 ) ) ( not ( = ?AUTO_1428 ?AUTO_1431 ) ) ( not ( = ?AUTO_1429 ?AUTO_1431 ) ) ( not ( = ?AUTO_1430 ?AUTO_1431 ) ) ( ON ?AUTO_1431 ?AUTO_1428 ) ( CLEAR ?AUTO_1431 ) ( HOLDING ?AUTO_1432 ) ( not ( = ?AUTO_1428 ?AUTO_1432 ) ) ( not ( = ?AUTO_1429 ?AUTO_1432 ) ) ( not ( = ?AUTO_1430 ?AUTO_1432 ) ) ( not ( = ?AUTO_1431 ?AUTO_1432 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1432 )
      ( MAKE-ON ?AUTO_1428 ?AUTO_1429 )
      ( MAKE-ON-VERIFY ?AUTO_1428 ?AUTO_1429 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1433 - BLOCK
      ?AUTO_1434 - BLOCK
    )
    :vars
    (
      ?AUTO_1435 - BLOCK
      ?AUTO_1436 - BLOCK
      ?AUTO_1437 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1434 ) ( not ( = ?AUTO_1433 ?AUTO_1434 ) ) ( ON ?AUTO_1433 ?AUTO_1435 ) ( not ( = ?AUTO_1433 ?AUTO_1435 ) ) ( not ( = ?AUTO_1434 ?AUTO_1435 ) ) ( not ( = ?AUTO_1433 ?AUTO_1436 ) ) ( not ( = ?AUTO_1434 ?AUTO_1436 ) ) ( not ( = ?AUTO_1435 ?AUTO_1436 ) ) ( ON ?AUTO_1436 ?AUTO_1433 ) ( not ( = ?AUTO_1433 ?AUTO_1437 ) ) ( not ( = ?AUTO_1434 ?AUTO_1437 ) ) ( not ( = ?AUTO_1435 ?AUTO_1437 ) ) ( not ( = ?AUTO_1436 ?AUTO_1437 ) ) ( ON ?AUTO_1437 ?AUTO_1436 ) ( CLEAR ?AUTO_1437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1437 ?AUTO_1436 )
      ( MAKE-ON ?AUTO_1433 ?AUTO_1434 )
      ( MAKE-ON-VERIFY ?AUTO_1433 ?AUTO_1434 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1439 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1439 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1439 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1439 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1440 - BLOCK
    )
    :vars
    (
      ?AUTO_1441 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1440 ?AUTO_1441 ) ( CLEAR ?AUTO_1440 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1440 ?AUTO_1441 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1440 ?AUTO_1441 )
      ( MAKE-ON-TABLE ?AUTO_1440 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1440 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1442 - BLOCK
    )
    :vars
    (
      ?AUTO_1443 - BLOCK
      ?AUTO_1444 - BLOCK
      ?AUTO_1445 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1442 ?AUTO_1443 ) ( CLEAR ?AUTO_1442 ) ( not ( = ?AUTO_1442 ?AUTO_1443 ) ) ( HOLDING ?AUTO_1444 ) ( CLEAR ?AUTO_1445 ) ( not ( = ?AUTO_1442 ?AUTO_1444 ) ) ( not ( = ?AUTO_1442 ?AUTO_1445 ) ) ( not ( = ?AUTO_1443 ?AUTO_1444 ) ) ( not ( = ?AUTO_1443 ?AUTO_1445 ) ) ( not ( = ?AUTO_1444 ?AUTO_1445 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1444 ?AUTO_1445 )
      ( MAKE-ON-TABLE ?AUTO_1442 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1442 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1446 - BLOCK
    )
    :vars
    (
      ?AUTO_1447 - BLOCK
      ?AUTO_1449 - BLOCK
      ?AUTO_1448 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1446 ?AUTO_1447 ) ( not ( = ?AUTO_1446 ?AUTO_1447 ) ) ( CLEAR ?AUTO_1449 ) ( not ( = ?AUTO_1446 ?AUTO_1448 ) ) ( not ( = ?AUTO_1446 ?AUTO_1449 ) ) ( not ( = ?AUTO_1447 ?AUTO_1448 ) ) ( not ( = ?AUTO_1447 ?AUTO_1449 ) ) ( not ( = ?AUTO_1448 ?AUTO_1449 ) ) ( ON ?AUTO_1448 ?AUTO_1446 ) ( CLEAR ?AUTO_1448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1448 ?AUTO_1446 )
      ( MAKE-ON-TABLE ?AUTO_1446 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1446 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1450 - BLOCK
    )
    :vars
    (
      ?AUTO_1451 - BLOCK
      ?AUTO_1453 - BLOCK
      ?AUTO_1452 - BLOCK
      ?AUTO_1454 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1450 ?AUTO_1451 ) ( not ( = ?AUTO_1450 ?AUTO_1451 ) ) ( CLEAR ?AUTO_1453 ) ( not ( = ?AUTO_1450 ?AUTO_1452 ) ) ( not ( = ?AUTO_1450 ?AUTO_1453 ) ) ( not ( = ?AUTO_1451 ?AUTO_1452 ) ) ( not ( = ?AUTO_1451 ?AUTO_1453 ) ) ( not ( = ?AUTO_1452 ?AUTO_1453 ) ) ( ON ?AUTO_1452 ?AUTO_1450 ) ( CLEAR ?AUTO_1452 ) ( HOLDING ?AUTO_1454 ) ( not ( = ?AUTO_1450 ?AUTO_1454 ) ) ( not ( = ?AUTO_1451 ?AUTO_1454 ) ) ( not ( = ?AUTO_1453 ?AUTO_1454 ) ) ( not ( = ?AUTO_1452 ?AUTO_1454 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1454 )
      ( MAKE-ON-TABLE ?AUTO_1450 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1450 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1455 - BLOCK
    )
    :vars
    (
      ?AUTO_1456 - BLOCK
      ?AUTO_1459 - BLOCK
      ?AUTO_1457 - BLOCK
      ?AUTO_1458 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1455 ?AUTO_1456 ) ( not ( = ?AUTO_1455 ?AUTO_1456 ) ) ( CLEAR ?AUTO_1459 ) ( not ( = ?AUTO_1455 ?AUTO_1457 ) ) ( not ( = ?AUTO_1455 ?AUTO_1459 ) ) ( not ( = ?AUTO_1456 ?AUTO_1457 ) ) ( not ( = ?AUTO_1456 ?AUTO_1459 ) ) ( not ( = ?AUTO_1457 ?AUTO_1459 ) ) ( ON ?AUTO_1457 ?AUTO_1455 ) ( not ( = ?AUTO_1455 ?AUTO_1458 ) ) ( not ( = ?AUTO_1456 ?AUTO_1458 ) ) ( not ( = ?AUTO_1459 ?AUTO_1458 ) ) ( not ( = ?AUTO_1457 ?AUTO_1458 ) ) ( ON ?AUTO_1458 ?AUTO_1457 ) ( CLEAR ?AUTO_1458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1458 ?AUTO_1457 )
      ( MAKE-ON-TABLE ?AUTO_1455 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1455 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1460 - BLOCK
    )
    :vars
    (
      ?AUTO_1464 - BLOCK
      ?AUTO_1463 - BLOCK
      ?AUTO_1462 - BLOCK
      ?AUTO_1461 - BLOCK
      ?AUTO_1465 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1460 ?AUTO_1464 ) ( not ( = ?AUTO_1460 ?AUTO_1464 ) ) ( CLEAR ?AUTO_1463 ) ( not ( = ?AUTO_1460 ?AUTO_1462 ) ) ( not ( = ?AUTO_1460 ?AUTO_1463 ) ) ( not ( = ?AUTO_1464 ?AUTO_1462 ) ) ( not ( = ?AUTO_1464 ?AUTO_1463 ) ) ( not ( = ?AUTO_1462 ?AUTO_1463 ) ) ( ON ?AUTO_1462 ?AUTO_1460 ) ( not ( = ?AUTO_1460 ?AUTO_1461 ) ) ( not ( = ?AUTO_1464 ?AUTO_1461 ) ) ( not ( = ?AUTO_1463 ?AUTO_1461 ) ) ( not ( = ?AUTO_1462 ?AUTO_1461 ) ) ( ON ?AUTO_1461 ?AUTO_1462 ) ( CLEAR ?AUTO_1461 ) ( HOLDING ?AUTO_1465 ) ( not ( = ?AUTO_1460 ?AUTO_1465 ) ) ( not ( = ?AUTO_1464 ?AUTO_1465 ) ) ( not ( = ?AUTO_1463 ?AUTO_1465 ) ) ( not ( = ?AUTO_1462 ?AUTO_1465 ) ) ( not ( = ?AUTO_1461 ?AUTO_1465 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1465 )
      ( MAKE-ON-TABLE ?AUTO_1460 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1460 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1466 - BLOCK
    )
    :vars
    (
      ?AUTO_1469 - BLOCK
      ?AUTO_1471 - BLOCK
      ?AUTO_1467 - BLOCK
      ?AUTO_1468 - BLOCK
      ?AUTO_1470 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1466 ?AUTO_1469 ) ( not ( = ?AUTO_1466 ?AUTO_1469 ) ) ( CLEAR ?AUTO_1471 ) ( not ( = ?AUTO_1466 ?AUTO_1467 ) ) ( not ( = ?AUTO_1466 ?AUTO_1471 ) ) ( not ( = ?AUTO_1469 ?AUTO_1467 ) ) ( not ( = ?AUTO_1469 ?AUTO_1471 ) ) ( not ( = ?AUTO_1467 ?AUTO_1471 ) ) ( ON ?AUTO_1467 ?AUTO_1466 ) ( not ( = ?AUTO_1466 ?AUTO_1468 ) ) ( not ( = ?AUTO_1469 ?AUTO_1468 ) ) ( not ( = ?AUTO_1471 ?AUTO_1468 ) ) ( not ( = ?AUTO_1467 ?AUTO_1468 ) ) ( ON ?AUTO_1468 ?AUTO_1467 ) ( not ( = ?AUTO_1466 ?AUTO_1470 ) ) ( not ( = ?AUTO_1469 ?AUTO_1470 ) ) ( not ( = ?AUTO_1471 ?AUTO_1470 ) ) ( not ( = ?AUTO_1467 ?AUTO_1470 ) ) ( not ( = ?AUTO_1468 ?AUTO_1470 ) ) ( ON ?AUTO_1470 ?AUTO_1468 ) ( CLEAR ?AUTO_1470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1470 ?AUTO_1468 )
      ( MAKE-ON-TABLE ?AUTO_1466 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1466 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1474 - BLOCK
      ?AUTO_1475 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1474 ) ( CLEAR ?AUTO_1475 ) ( not ( = ?AUTO_1474 ?AUTO_1475 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1474 ?AUTO_1475 )
      ( MAKE-ON-VERIFY ?AUTO_1474 ?AUTO_1475 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1476 - BLOCK
      ?AUTO_1477 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1477 ) ( not ( = ?AUTO_1476 ?AUTO_1477 ) ) ( ON-TABLE ?AUTO_1476 ) ( CLEAR ?AUTO_1476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1476 )
      ( MAKE-ON ?AUTO_1476 ?AUTO_1477 )
      ( MAKE-ON-VERIFY ?AUTO_1476 ?AUTO_1477 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1478 - BLOCK
      ?AUTO_1479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1478 ?AUTO_1479 ) ) ( ON-TABLE ?AUTO_1478 ) ( CLEAR ?AUTO_1478 ) ( HOLDING ?AUTO_1479 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1479 )
      ( MAKE-ON ?AUTO_1478 ?AUTO_1479 )
      ( MAKE-ON-VERIFY ?AUTO_1478 ?AUTO_1479 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1482 - BLOCK
      ?AUTO_1483 - BLOCK
    )
    :vars
    (
      ?AUTO_1484 - BLOCK
      ?AUTO_1485 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1483 ) ( not ( = ?AUTO_1482 ?AUTO_1483 ) ) ( ON-TABLE ?AUTO_1482 ) ( CLEAR ?AUTO_1482 ) ( HOLDING ?AUTO_1484 ) ( CLEAR ?AUTO_1485 ) ( not ( = ?AUTO_1482 ?AUTO_1484 ) ) ( not ( = ?AUTO_1482 ?AUTO_1485 ) ) ( not ( = ?AUTO_1483 ?AUTO_1484 ) ) ( not ( = ?AUTO_1483 ?AUTO_1485 ) ) ( not ( = ?AUTO_1484 ?AUTO_1485 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1484 ?AUTO_1485 )
      ( MAKE-ON ?AUTO_1482 ?AUTO_1483 )
      ( MAKE-ON-VERIFY ?AUTO_1482 ?AUTO_1483 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1486 - BLOCK
      ?AUTO_1487 - BLOCK
    )
    :vars
    (
      ?AUTO_1488 - BLOCK
      ?AUTO_1489 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1486 ?AUTO_1487 ) ) ( ON-TABLE ?AUTO_1486 ) ( CLEAR ?AUTO_1486 ) ( CLEAR ?AUTO_1488 ) ( not ( = ?AUTO_1486 ?AUTO_1489 ) ) ( not ( = ?AUTO_1486 ?AUTO_1488 ) ) ( not ( = ?AUTO_1487 ?AUTO_1489 ) ) ( not ( = ?AUTO_1487 ?AUTO_1488 ) ) ( not ( = ?AUTO_1489 ?AUTO_1488 ) ) ( ON ?AUTO_1489 ?AUTO_1487 ) ( CLEAR ?AUTO_1489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1489 ?AUTO_1487 )
      ( MAKE-ON ?AUTO_1486 ?AUTO_1487 )
      ( MAKE-ON-VERIFY ?AUTO_1486 ?AUTO_1487 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1490 - BLOCK
      ?AUTO_1491 - BLOCK
    )
    :vars
    (
      ?AUTO_1493 - BLOCK
      ?AUTO_1492 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1490 ?AUTO_1491 ) ) ( CLEAR ?AUTO_1493 ) ( not ( = ?AUTO_1490 ?AUTO_1492 ) ) ( not ( = ?AUTO_1490 ?AUTO_1493 ) ) ( not ( = ?AUTO_1491 ?AUTO_1492 ) ) ( not ( = ?AUTO_1491 ?AUTO_1493 ) ) ( not ( = ?AUTO_1492 ?AUTO_1493 ) ) ( ON ?AUTO_1492 ?AUTO_1491 ) ( CLEAR ?AUTO_1492 ) ( HOLDING ?AUTO_1490 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1490 )
      ( MAKE-ON ?AUTO_1490 ?AUTO_1491 )
      ( MAKE-ON-VERIFY ?AUTO_1490 ?AUTO_1491 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1494 - BLOCK
      ?AUTO_1495 - BLOCK
    )
    :vars
    (
      ?AUTO_1496 - BLOCK
      ?AUTO_1497 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1494 ?AUTO_1495 ) ) ( CLEAR ?AUTO_1496 ) ( not ( = ?AUTO_1494 ?AUTO_1497 ) ) ( not ( = ?AUTO_1494 ?AUTO_1496 ) ) ( not ( = ?AUTO_1495 ?AUTO_1497 ) ) ( not ( = ?AUTO_1495 ?AUTO_1496 ) ) ( not ( = ?AUTO_1497 ?AUTO_1496 ) ) ( ON ?AUTO_1497 ?AUTO_1495 ) ( ON ?AUTO_1494 ?AUTO_1497 ) ( CLEAR ?AUTO_1494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1494 ?AUTO_1497 )
      ( MAKE-ON ?AUTO_1494 ?AUTO_1495 )
      ( MAKE-ON-VERIFY ?AUTO_1494 ?AUTO_1495 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1498 - BLOCK
      ?AUTO_1499 - BLOCK
    )
    :vars
    (
      ?AUTO_1500 - BLOCK
      ?AUTO_1501 - BLOCK
      ?AUTO_1502 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1498 ?AUTO_1499 ) ) ( CLEAR ?AUTO_1500 ) ( not ( = ?AUTO_1498 ?AUTO_1501 ) ) ( not ( = ?AUTO_1498 ?AUTO_1500 ) ) ( not ( = ?AUTO_1499 ?AUTO_1501 ) ) ( not ( = ?AUTO_1499 ?AUTO_1500 ) ) ( not ( = ?AUTO_1501 ?AUTO_1500 ) ) ( ON ?AUTO_1501 ?AUTO_1499 ) ( ON ?AUTO_1498 ?AUTO_1501 ) ( CLEAR ?AUTO_1498 ) ( HOLDING ?AUTO_1502 ) ( not ( = ?AUTO_1498 ?AUTO_1502 ) ) ( not ( = ?AUTO_1499 ?AUTO_1502 ) ) ( not ( = ?AUTO_1500 ?AUTO_1502 ) ) ( not ( = ?AUTO_1501 ?AUTO_1502 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1502 )
      ( MAKE-ON ?AUTO_1498 ?AUTO_1499 )
      ( MAKE-ON-VERIFY ?AUTO_1498 ?AUTO_1499 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1503 - BLOCK
      ?AUTO_1504 - BLOCK
    )
    :vars
    (
      ?AUTO_1505 - BLOCK
      ?AUTO_1506 - BLOCK
      ?AUTO_1507 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1503 ?AUTO_1504 ) ) ( CLEAR ?AUTO_1505 ) ( not ( = ?AUTO_1503 ?AUTO_1506 ) ) ( not ( = ?AUTO_1503 ?AUTO_1505 ) ) ( not ( = ?AUTO_1504 ?AUTO_1506 ) ) ( not ( = ?AUTO_1504 ?AUTO_1505 ) ) ( not ( = ?AUTO_1506 ?AUTO_1505 ) ) ( ON ?AUTO_1506 ?AUTO_1504 ) ( ON ?AUTO_1503 ?AUTO_1506 ) ( not ( = ?AUTO_1503 ?AUTO_1507 ) ) ( not ( = ?AUTO_1504 ?AUTO_1507 ) ) ( not ( = ?AUTO_1505 ?AUTO_1507 ) ) ( not ( = ?AUTO_1506 ?AUTO_1507 ) ) ( ON ?AUTO_1507 ?AUTO_1503 ) ( CLEAR ?AUTO_1507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1507 ?AUTO_1503 )
      ( MAKE-ON ?AUTO_1503 ?AUTO_1504 )
      ( MAKE-ON-VERIFY ?AUTO_1503 ?AUTO_1504 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1510 - BLOCK
      ?AUTO_1511 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1510 ) ( CLEAR ?AUTO_1511 ) ( not ( = ?AUTO_1510 ?AUTO_1511 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1510 ?AUTO_1511 )
      ( MAKE-ON-VERIFY ?AUTO_1510 ?AUTO_1511 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1512 - BLOCK
      ?AUTO_1513 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1513 ) ( not ( = ?AUTO_1512 ?AUTO_1513 ) ) ( ON-TABLE ?AUTO_1512 ) ( CLEAR ?AUTO_1512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1512 )
      ( MAKE-ON ?AUTO_1512 ?AUTO_1513 )
      ( MAKE-ON-VERIFY ?AUTO_1512 ?AUTO_1513 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1514 - BLOCK
      ?AUTO_1515 - BLOCK
    )
    :vars
    (
      ?AUTO_1516 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1514 ?AUTO_1515 ) ) ( ON-TABLE ?AUTO_1514 ) ( CLEAR ?AUTO_1514 ) ( HOLDING ?AUTO_1515 ) ( CLEAR ?AUTO_1516 ) ( not ( = ?AUTO_1514 ?AUTO_1516 ) ) ( not ( = ?AUTO_1515 ?AUTO_1516 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1515 ?AUTO_1516 )
      ( MAKE-ON ?AUTO_1514 ?AUTO_1515 )
      ( MAKE-ON-VERIFY ?AUTO_1514 ?AUTO_1515 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1519 - BLOCK
      ?AUTO_1520 - BLOCK
    )
    :vars
    (
      ?AUTO_1521 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1520 ) ( not ( = ?AUTO_1519 ?AUTO_1520 ) ) ( ON-TABLE ?AUTO_1519 ) ( CLEAR ?AUTO_1519 ) ( HOLDING ?AUTO_1521 ) ( not ( = ?AUTO_1519 ?AUTO_1521 ) ) ( not ( = ?AUTO_1520 ?AUTO_1521 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1521 )
      ( MAKE-ON ?AUTO_1519 ?AUTO_1520 )
      ( MAKE-ON-VERIFY ?AUTO_1519 ?AUTO_1520 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1522 - BLOCK
      ?AUTO_1523 - BLOCK
    )
    :vars
    (
      ?AUTO_1524 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1523 ) ( not ( = ?AUTO_1522 ?AUTO_1523 ) ) ( ON-TABLE ?AUTO_1522 ) ( not ( = ?AUTO_1522 ?AUTO_1524 ) ) ( not ( = ?AUTO_1523 ?AUTO_1524 ) ) ( ON ?AUTO_1524 ?AUTO_1522 ) ( CLEAR ?AUTO_1524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1524 ?AUTO_1522 )
      ( MAKE-ON ?AUTO_1522 ?AUTO_1523 )
      ( MAKE-ON-VERIFY ?AUTO_1522 ?AUTO_1523 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1525 - BLOCK
      ?AUTO_1526 - BLOCK
    )
    :vars
    (
      ?AUTO_1527 - BLOCK
      ?AUTO_1528 - BLOCK
      ?AUTO_1529 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1526 ) ( not ( = ?AUTO_1525 ?AUTO_1526 ) ) ( ON-TABLE ?AUTO_1525 ) ( not ( = ?AUTO_1525 ?AUTO_1527 ) ) ( not ( = ?AUTO_1526 ?AUTO_1527 ) ) ( ON ?AUTO_1527 ?AUTO_1525 ) ( CLEAR ?AUTO_1527 ) ( HOLDING ?AUTO_1528 ) ( CLEAR ?AUTO_1529 ) ( not ( = ?AUTO_1525 ?AUTO_1528 ) ) ( not ( = ?AUTO_1525 ?AUTO_1529 ) ) ( not ( = ?AUTO_1526 ?AUTO_1528 ) ) ( not ( = ?AUTO_1526 ?AUTO_1529 ) ) ( not ( = ?AUTO_1527 ?AUTO_1528 ) ) ( not ( = ?AUTO_1527 ?AUTO_1529 ) ) ( not ( = ?AUTO_1528 ?AUTO_1529 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1528 ?AUTO_1529 )
      ( MAKE-ON ?AUTO_1525 ?AUTO_1526 )
      ( MAKE-ON-VERIFY ?AUTO_1525 ?AUTO_1526 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1530 - BLOCK
      ?AUTO_1531 - BLOCK
    )
    :vars
    (
      ?AUTO_1532 - BLOCK
      ?AUTO_1534 - BLOCK
      ?AUTO_1533 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1531 ) ( not ( = ?AUTO_1530 ?AUTO_1531 ) ) ( ON-TABLE ?AUTO_1530 ) ( not ( = ?AUTO_1530 ?AUTO_1532 ) ) ( not ( = ?AUTO_1531 ?AUTO_1532 ) ) ( ON ?AUTO_1532 ?AUTO_1530 ) ( CLEAR ?AUTO_1534 ) ( not ( = ?AUTO_1530 ?AUTO_1533 ) ) ( not ( = ?AUTO_1530 ?AUTO_1534 ) ) ( not ( = ?AUTO_1531 ?AUTO_1533 ) ) ( not ( = ?AUTO_1531 ?AUTO_1534 ) ) ( not ( = ?AUTO_1532 ?AUTO_1533 ) ) ( not ( = ?AUTO_1532 ?AUTO_1534 ) ) ( not ( = ?AUTO_1533 ?AUTO_1534 ) ) ( ON ?AUTO_1533 ?AUTO_1532 ) ( CLEAR ?AUTO_1533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1533 ?AUTO_1532 )
      ( MAKE-ON ?AUTO_1530 ?AUTO_1531 )
      ( MAKE-ON-VERIFY ?AUTO_1530 ?AUTO_1531 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1535 - BLOCK
      ?AUTO_1536 - BLOCK
    )
    :vars
    (
      ?AUTO_1538 - BLOCK
      ?AUTO_1537 - BLOCK
      ?AUTO_1539 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1535 ?AUTO_1536 ) ) ( ON-TABLE ?AUTO_1535 ) ( not ( = ?AUTO_1535 ?AUTO_1538 ) ) ( not ( = ?AUTO_1536 ?AUTO_1538 ) ) ( ON ?AUTO_1538 ?AUTO_1535 ) ( CLEAR ?AUTO_1537 ) ( not ( = ?AUTO_1535 ?AUTO_1539 ) ) ( not ( = ?AUTO_1535 ?AUTO_1537 ) ) ( not ( = ?AUTO_1536 ?AUTO_1539 ) ) ( not ( = ?AUTO_1536 ?AUTO_1537 ) ) ( not ( = ?AUTO_1538 ?AUTO_1539 ) ) ( not ( = ?AUTO_1538 ?AUTO_1537 ) ) ( not ( = ?AUTO_1539 ?AUTO_1537 ) ) ( ON ?AUTO_1539 ?AUTO_1538 ) ( CLEAR ?AUTO_1539 ) ( HOLDING ?AUTO_1536 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1536 )
      ( MAKE-ON ?AUTO_1535 ?AUTO_1536 )
      ( MAKE-ON-VERIFY ?AUTO_1535 ?AUTO_1536 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1540 - BLOCK
      ?AUTO_1541 - BLOCK
    )
    :vars
    (
      ?AUTO_1542 - BLOCK
      ?AUTO_1543 - BLOCK
      ?AUTO_1544 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1540 ?AUTO_1541 ) ) ( ON-TABLE ?AUTO_1540 ) ( not ( = ?AUTO_1540 ?AUTO_1542 ) ) ( not ( = ?AUTO_1541 ?AUTO_1542 ) ) ( ON ?AUTO_1542 ?AUTO_1540 ) ( CLEAR ?AUTO_1543 ) ( not ( = ?AUTO_1540 ?AUTO_1544 ) ) ( not ( = ?AUTO_1540 ?AUTO_1543 ) ) ( not ( = ?AUTO_1541 ?AUTO_1544 ) ) ( not ( = ?AUTO_1541 ?AUTO_1543 ) ) ( not ( = ?AUTO_1542 ?AUTO_1544 ) ) ( not ( = ?AUTO_1542 ?AUTO_1543 ) ) ( not ( = ?AUTO_1544 ?AUTO_1543 ) ) ( ON ?AUTO_1544 ?AUTO_1542 ) ( ON ?AUTO_1541 ?AUTO_1544 ) ( CLEAR ?AUTO_1541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1541 ?AUTO_1544 )
      ( MAKE-ON ?AUTO_1540 ?AUTO_1541 )
      ( MAKE-ON-VERIFY ?AUTO_1540 ?AUTO_1541 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1545 - BLOCK
      ?AUTO_1546 - BLOCK
    )
    :vars
    (
      ?AUTO_1547 - BLOCK
      ?AUTO_1548 - BLOCK
      ?AUTO_1549 - BLOCK
      ?AUTO_1550 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1545 ?AUTO_1546 ) ) ( ON-TABLE ?AUTO_1545 ) ( not ( = ?AUTO_1545 ?AUTO_1547 ) ) ( not ( = ?AUTO_1546 ?AUTO_1547 ) ) ( ON ?AUTO_1547 ?AUTO_1545 ) ( CLEAR ?AUTO_1548 ) ( not ( = ?AUTO_1545 ?AUTO_1549 ) ) ( not ( = ?AUTO_1545 ?AUTO_1548 ) ) ( not ( = ?AUTO_1546 ?AUTO_1549 ) ) ( not ( = ?AUTO_1546 ?AUTO_1548 ) ) ( not ( = ?AUTO_1547 ?AUTO_1549 ) ) ( not ( = ?AUTO_1547 ?AUTO_1548 ) ) ( not ( = ?AUTO_1549 ?AUTO_1548 ) ) ( ON ?AUTO_1549 ?AUTO_1547 ) ( ON ?AUTO_1546 ?AUTO_1549 ) ( CLEAR ?AUTO_1546 ) ( HOLDING ?AUTO_1550 ) ( not ( = ?AUTO_1545 ?AUTO_1550 ) ) ( not ( = ?AUTO_1546 ?AUTO_1550 ) ) ( not ( = ?AUTO_1547 ?AUTO_1550 ) ) ( not ( = ?AUTO_1548 ?AUTO_1550 ) ) ( not ( = ?AUTO_1549 ?AUTO_1550 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1550 )
      ( MAKE-ON ?AUTO_1545 ?AUTO_1546 )
      ( MAKE-ON-VERIFY ?AUTO_1545 ?AUTO_1546 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1551 - BLOCK
      ?AUTO_1552 - BLOCK
    )
    :vars
    (
      ?AUTO_1553 - BLOCK
      ?AUTO_1554 - BLOCK
      ?AUTO_1555 - BLOCK
      ?AUTO_1556 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1551 ?AUTO_1552 ) ) ( ON-TABLE ?AUTO_1551 ) ( not ( = ?AUTO_1551 ?AUTO_1553 ) ) ( not ( = ?AUTO_1552 ?AUTO_1553 ) ) ( ON ?AUTO_1553 ?AUTO_1551 ) ( CLEAR ?AUTO_1554 ) ( not ( = ?AUTO_1551 ?AUTO_1555 ) ) ( not ( = ?AUTO_1551 ?AUTO_1554 ) ) ( not ( = ?AUTO_1552 ?AUTO_1555 ) ) ( not ( = ?AUTO_1552 ?AUTO_1554 ) ) ( not ( = ?AUTO_1553 ?AUTO_1555 ) ) ( not ( = ?AUTO_1553 ?AUTO_1554 ) ) ( not ( = ?AUTO_1555 ?AUTO_1554 ) ) ( ON ?AUTO_1555 ?AUTO_1553 ) ( ON ?AUTO_1552 ?AUTO_1555 ) ( not ( = ?AUTO_1551 ?AUTO_1556 ) ) ( not ( = ?AUTO_1552 ?AUTO_1556 ) ) ( not ( = ?AUTO_1553 ?AUTO_1556 ) ) ( not ( = ?AUTO_1554 ?AUTO_1556 ) ) ( not ( = ?AUTO_1555 ?AUTO_1556 ) ) ( ON ?AUTO_1556 ?AUTO_1552 ) ( CLEAR ?AUTO_1556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1556 ?AUTO_1552 )
      ( MAKE-ON ?AUTO_1551 ?AUTO_1552 )
      ( MAKE-ON-VERIFY ?AUTO_1551 ?AUTO_1552 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1558 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1558 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1558 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1558 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1559 - BLOCK
    )
    :vars
    (
      ?AUTO_1560 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1559 ?AUTO_1560 ) ( CLEAR ?AUTO_1559 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1559 ?AUTO_1560 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1559 ?AUTO_1560 )
      ( MAKE-ON-TABLE ?AUTO_1559 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1559 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1562 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1562 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1562 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1562 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1563 - BLOCK
    )
    :vars
    (
      ?AUTO_1564 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1563 ?AUTO_1564 ) ( CLEAR ?AUTO_1563 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1563 ?AUTO_1564 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1563 ?AUTO_1564 )
      ( MAKE-ON-TABLE ?AUTO_1563 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1563 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1565 - BLOCK
    )
    :vars
    (
      ?AUTO_1566 - BLOCK
      ?AUTO_1567 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1565 ?AUTO_1566 ) ( CLEAR ?AUTO_1565 ) ( not ( = ?AUTO_1565 ?AUTO_1566 ) ) ( HOLDING ?AUTO_1567 ) ( not ( = ?AUTO_1565 ?AUTO_1567 ) ) ( not ( = ?AUTO_1566 ?AUTO_1567 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1567 )
      ( MAKE-ON-TABLE ?AUTO_1565 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1565 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1570 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1570 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1570 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1570 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1571 - BLOCK
    )
    :vars
    (
      ?AUTO_1572 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1571 ?AUTO_1572 ) ( CLEAR ?AUTO_1571 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1571 ?AUTO_1572 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1571 ?AUTO_1572 )
      ( MAKE-ON-TABLE ?AUTO_1571 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1571 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1573 - BLOCK
    )
    :vars
    (
      ?AUTO_1574 - BLOCK
      ?AUTO_1575 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1573 ?AUTO_1574 ) ( CLEAR ?AUTO_1573 ) ( not ( = ?AUTO_1573 ?AUTO_1574 ) ) ( HOLDING ?AUTO_1575 ) ( not ( = ?AUTO_1573 ?AUTO_1575 ) ) ( not ( = ?AUTO_1574 ?AUTO_1575 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1575 )
      ( MAKE-ON-TABLE ?AUTO_1573 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1573 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1576 - BLOCK
    )
    :vars
    (
      ?AUTO_1577 - BLOCK
      ?AUTO_1578 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1576 ?AUTO_1577 ) ( not ( = ?AUTO_1576 ?AUTO_1577 ) ) ( not ( = ?AUTO_1576 ?AUTO_1578 ) ) ( not ( = ?AUTO_1577 ?AUTO_1578 ) ) ( ON ?AUTO_1578 ?AUTO_1576 ) ( CLEAR ?AUTO_1578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1578 ?AUTO_1576 )
      ( MAKE-ON-TABLE ?AUTO_1576 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1576 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1579 - BLOCK
    )
    :vars
    (
      ?AUTO_1580 - BLOCK
      ?AUTO_1581 - BLOCK
      ?AUTO_1582 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1579 ?AUTO_1580 ) ( not ( = ?AUTO_1579 ?AUTO_1580 ) ) ( not ( = ?AUTO_1579 ?AUTO_1581 ) ) ( not ( = ?AUTO_1580 ?AUTO_1581 ) ) ( ON ?AUTO_1581 ?AUTO_1579 ) ( CLEAR ?AUTO_1581 ) ( HOLDING ?AUTO_1582 ) ( not ( = ?AUTO_1579 ?AUTO_1582 ) ) ( not ( = ?AUTO_1580 ?AUTO_1582 ) ) ( not ( = ?AUTO_1581 ?AUTO_1582 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1582 )
      ( MAKE-ON-TABLE ?AUTO_1579 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1579 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1585 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1585 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1585 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1585 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1586 - BLOCK
    )
    :vars
    (
      ?AUTO_1587 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1586 ?AUTO_1587 ) ( CLEAR ?AUTO_1586 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1586 ?AUTO_1587 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1586 ?AUTO_1587 )
      ( MAKE-ON-TABLE ?AUTO_1586 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1586 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1588 - BLOCK
    )
    :vars
    (
      ?AUTO_1589 - BLOCK
      ?AUTO_1590 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1588 ?AUTO_1589 ) ( CLEAR ?AUTO_1588 ) ( not ( = ?AUTO_1588 ?AUTO_1589 ) ) ( HOLDING ?AUTO_1590 ) ( not ( = ?AUTO_1588 ?AUTO_1590 ) ) ( not ( = ?AUTO_1589 ?AUTO_1590 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1590 )
      ( MAKE-ON-TABLE ?AUTO_1588 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1588 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1598 - BLOCK
      ?AUTO_1599 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1598 ) ( CLEAR ?AUTO_1599 ) ( not ( = ?AUTO_1598 ?AUTO_1599 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1598 ?AUTO_1599 )
      ( MAKE-ON-VERIFY ?AUTO_1598 ?AUTO_1599 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1600 - BLOCK
      ?AUTO_1601 - BLOCK
    )
    :vars
    (
      ?AUTO_1602 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1601 ) ( not ( = ?AUTO_1600 ?AUTO_1601 ) ) ( ON ?AUTO_1600 ?AUTO_1602 ) ( CLEAR ?AUTO_1600 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1600 ?AUTO_1602 ) ) ( not ( = ?AUTO_1601 ?AUTO_1602 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1600 ?AUTO_1602 )
      ( MAKE-ON ?AUTO_1600 ?AUTO_1601 )
      ( MAKE-ON-VERIFY ?AUTO_1600 ?AUTO_1601 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1603 - BLOCK
      ?AUTO_1604 - BLOCK
    )
    :vars
    (
      ?AUTO_1605 - BLOCK
      ?AUTO_1606 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1604 ) ( not ( = ?AUTO_1603 ?AUTO_1604 ) ) ( ON ?AUTO_1603 ?AUTO_1605 ) ( CLEAR ?AUTO_1603 ) ( not ( = ?AUTO_1603 ?AUTO_1605 ) ) ( not ( = ?AUTO_1604 ?AUTO_1605 ) ) ( HOLDING ?AUTO_1606 ) ( not ( = ?AUTO_1603 ?AUTO_1606 ) ) ( not ( = ?AUTO_1604 ?AUTO_1606 ) ) ( not ( = ?AUTO_1605 ?AUTO_1606 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1606 )
      ( MAKE-ON ?AUTO_1603 ?AUTO_1604 )
      ( MAKE-ON-VERIFY ?AUTO_1603 ?AUTO_1604 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1607 - BLOCK
      ?AUTO_1608 - BLOCK
    )
    :vars
    (
      ?AUTO_1609 - BLOCK
      ?AUTO_1610 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1608 ) ( not ( = ?AUTO_1607 ?AUTO_1608 ) ) ( ON ?AUTO_1607 ?AUTO_1609 ) ( not ( = ?AUTO_1607 ?AUTO_1609 ) ) ( not ( = ?AUTO_1608 ?AUTO_1609 ) ) ( not ( = ?AUTO_1607 ?AUTO_1610 ) ) ( not ( = ?AUTO_1608 ?AUTO_1610 ) ) ( not ( = ?AUTO_1609 ?AUTO_1610 ) ) ( ON ?AUTO_1610 ?AUTO_1607 ) ( CLEAR ?AUTO_1610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1610 ?AUTO_1607 )
      ( MAKE-ON ?AUTO_1607 ?AUTO_1608 )
      ( MAKE-ON-VERIFY ?AUTO_1607 ?AUTO_1608 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1611 - BLOCK
      ?AUTO_1612 - BLOCK
    )
    :vars
    (
      ?AUTO_1613 - BLOCK
      ?AUTO_1614 - BLOCK
      ?AUTO_1615 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1612 ) ( not ( = ?AUTO_1611 ?AUTO_1612 ) ) ( ON ?AUTO_1611 ?AUTO_1613 ) ( not ( = ?AUTO_1611 ?AUTO_1613 ) ) ( not ( = ?AUTO_1612 ?AUTO_1613 ) ) ( not ( = ?AUTO_1611 ?AUTO_1614 ) ) ( not ( = ?AUTO_1612 ?AUTO_1614 ) ) ( not ( = ?AUTO_1613 ?AUTO_1614 ) ) ( ON ?AUTO_1614 ?AUTO_1611 ) ( CLEAR ?AUTO_1614 ) ( HOLDING ?AUTO_1615 ) ( not ( = ?AUTO_1611 ?AUTO_1615 ) ) ( not ( = ?AUTO_1612 ?AUTO_1615 ) ) ( not ( = ?AUTO_1613 ?AUTO_1615 ) ) ( not ( = ?AUTO_1614 ?AUTO_1615 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1615 )
      ( MAKE-ON ?AUTO_1611 ?AUTO_1612 )
      ( MAKE-ON-VERIFY ?AUTO_1611 ?AUTO_1612 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1618 - BLOCK
      ?AUTO_1619 - BLOCK
    )
    :vars
    (
      ?AUTO_1621 - BLOCK
      ?AUTO_1620 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1618 ?AUTO_1619 ) ) ( ON ?AUTO_1618 ?AUTO_1621 ) ( not ( = ?AUTO_1618 ?AUTO_1621 ) ) ( not ( = ?AUTO_1619 ?AUTO_1621 ) ) ( not ( = ?AUTO_1618 ?AUTO_1620 ) ) ( not ( = ?AUTO_1619 ?AUTO_1620 ) ) ( not ( = ?AUTO_1621 ?AUTO_1620 ) ) ( ON ?AUTO_1620 ?AUTO_1618 ) ( CLEAR ?AUTO_1620 ) ( HOLDING ?AUTO_1619 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1619 )
      ( MAKE-ON ?AUTO_1618 ?AUTO_1619 )
      ( MAKE-ON-VERIFY ?AUTO_1618 ?AUTO_1619 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1626 - BLOCK
      ?AUTO_1627 - BLOCK
    )
    :vars
    (
      ?AUTO_1630 - BLOCK
      ?AUTO_1629 - BLOCK
      ?AUTO_1628 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1627 ) ( not ( = ?AUTO_1626 ?AUTO_1627 ) ) ( ON ?AUTO_1626 ?AUTO_1630 ) ( not ( = ?AUTO_1626 ?AUTO_1630 ) ) ( not ( = ?AUTO_1627 ?AUTO_1630 ) ) ( not ( = ?AUTO_1626 ?AUTO_1629 ) ) ( not ( = ?AUTO_1627 ?AUTO_1629 ) ) ( not ( = ?AUTO_1630 ?AUTO_1629 ) ) ( ON ?AUTO_1629 ?AUTO_1626 ) ( not ( = ?AUTO_1626 ?AUTO_1628 ) ) ( not ( = ?AUTO_1627 ?AUTO_1628 ) ) ( not ( = ?AUTO_1630 ?AUTO_1628 ) ) ( not ( = ?AUTO_1629 ?AUTO_1628 ) ) ( ON ?AUTO_1628 ?AUTO_1629 ) ( CLEAR ?AUTO_1628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1628 ?AUTO_1629 )
      ( MAKE-ON ?AUTO_1626 ?AUTO_1627 )
      ( MAKE-ON-VERIFY ?AUTO_1626 ?AUTO_1627 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1633 - BLOCK
      ?AUTO_1634 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1633 ) ( CLEAR ?AUTO_1634 ) ( not ( = ?AUTO_1633 ?AUTO_1634 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1633 ?AUTO_1634 )
      ( MAKE-ON-VERIFY ?AUTO_1633 ?AUTO_1634 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1635 - BLOCK
      ?AUTO_1636 - BLOCK
    )
    :vars
    (
      ?AUTO_1637 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1636 ) ( not ( = ?AUTO_1635 ?AUTO_1636 ) ) ( ON ?AUTO_1635 ?AUTO_1637 ) ( CLEAR ?AUTO_1635 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1635 ?AUTO_1637 ) ) ( not ( = ?AUTO_1636 ?AUTO_1637 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1635 ?AUTO_1637 )
      ( MAKE-ON ?AUTO_1635 ?AUTO_1636 )
      ( MAKE-ON-VERIFY ?AUTO_1635 ?AUTO_1636 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1638 - BLOCK
      ?AUTO_1639 - BLOCK
    )
    :vars
    (
      ?AUTO_1640 - BLOCK
      ?AUTO_1641 - BLOCK
      ?AUTO_1642 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1639 ) ( not ( = ?AUTO_1638 ?AUTO_1639 ) ) ( ON ?AUTO_1638 ?AUTO_1640 ) ( CLEAR ?AUTO_1638 ) ( not ( = ?AUTO_1638 ?AUTO_1640 ) ) ( not ( = ?AUTO_1639 ?AUTO_1640 ) ) ( HOLDING ?AUTO_1641 ) ( CLEAR ?AUTO_1642 ) ( not ( = ?AUTO_1638 ?AUTO_1641 ) ) ( not ( = ?AUTO_1638 ?AUTO_1642 ) ) ( not ( = ?AUTO_1639 ?AUTO_1641 ) ) ( not ( = ?AUTO_1639 ?AUTO_1642 ) ) ( not ( = ?AUTO_1640 ?AUTO_1641 ) ) ( not ( = ?AUTO_1640 ?AUTO_1642 ) ) ( not ( = ?AUTO_1641 ?AUTO_1642 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1641 ?AUTO_1642 )
      ( MAKE-ON ?AUTO_1638 ?AUTO_1639 )
      ( MAKE-ON-VERIFY ?AUTO_1638 ?AUTO_1639 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1643 - BLOCK
      ?AUTO_1644 - BLOCK
    )
    :vars
    (
      ?AUTO_1645 - BLOCK
      ?AUTO_1646 - BLOCK
      ?AUTO_1647 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1644 ) ( not ( = ?AUTO_1643 ?AUTO_1644 ) ) ( ON ?AUTO_1643 ?AUTO_1645 ) ( not ( = ?AUTO_1643 ?AUTO_1645 ) ) ( not ( = ?AUTO_1644 ?AUTO_1645 ) ) ( CLEAR ?AUTO_1646 ) ( not ( = ?AUTO_1643 ?AUTO_1647 ) ) ( not ( = ?AUTO_1643 ?AUTO_1646 ) ) ( not ( = ?AUTO_1644 ?AUTO_1647 ) ) ( not ( = ?AUTO_1644 ?AUTO_1646 ) ) ( not ( = ?AUTO_1645 ?AUTO_1647 ) ) ( not ( = ?AUTO_1645 ?AUTO_1646 ) ) ( not ( = ?AUTO_1647 ?AUTO_1646 ) ) ( ON ?AUTO_1647 ?AUTO_1643 ) ( CLEAR ?AUTO_1647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1647 ?AUTO_1643 )
      ( MAKE-ON ?AUTO_1643 ?AUTO_1644 )
      ( MAKE-ON-VERIFY ?AUTO_1643 ?AUTO_1644 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1648 - BLOCK
      ?AUTO_1649 - BLOCK
    )
    :vars
    (
      ?AUTO_1650 - BLOCK
      ?AUTO_1652 - BLOCK
      ?AUTO_1651 - BLOCK
      ?AUTO_1653 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1649 ) ( not ( = ?AUTO_1648 ?AUTO_1649 ) ) ( ON ?AUTO_1648 ?AUTO_1650 ) ( not ( = ?AUTO_1648 ?AUTO_1650 ) ) ( not ( = ?AUTO_1649 ?AUTO_1650 ) ) ( CLEAR ?AUTO_1652 ) ( not ( = ?AUTO_1648 ?AUTO_1651 ) ) ( not ( = ?AUTO_1648 ?AUTO_1652 ) ) ( not ( = ?AUTO_1649 ?AUTO_1651 ) ) ( not ( = ?AUTO_1649 ?AUTO_1652 ) ) ( not ( = ?AUTO_1650 ?AUTO_1651 ) ) ( not ( = ?AUTO_1650 ?AUTO_1652 ) ) ( not ( = ?AUTO_1651 ?AUTO_1652 ) ) ( ON ?AUTO_1651 ?AUTO_1648 ) ( CLEAR ?AUTO_1651 ) ( HOLDING ?AUTO_1653 ) ( not ( = ?AUTO_1648 ?AUTO_1653 ) ) ( not ( = ?AUTO_1649 ?AUTO_1653 ) ) ( not ( = ?AUTO_1650 ?AUTO_1653 ) ) ( not ( = ?AUTO_1652 ?AUTO_1653 ) ) ( not ( = ?AUTO_1651 ?AUTO_1653 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1653 )
      ( MAKE-ON ?AUTO_1648 ?AUTO_1649 )
      ( MAKE-ON-VERIFY ?AUTO_1648 ?AUTO_1649 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1654 - BLOCK
      ?AUTO_1655 - BLOCK
    )
    :vars
    (
      ?AUTO_1657 - BLOCK
      ?AUTO_1658 - BLOCK
      ?AUTO_1656 - BLOCK
      ?AUTO_1659 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1655 ) ( not ( = ?AUTO_1654 ?AUTO_1655 ) ) ( ON ?AUTO_1654 ?AUTO_1657 ) ( not ( = ?AUTO_1654 ?AUTO_1657 ) ) ( not ( = ?AUTO_1655 ?AUTO_1657 ) ) ( CLEAR ?AUTO_1658 ) ( not ( = ?AUTO_1654 ?AUTO_1656 ) ) ( not ( = ?AUTO_1654 ?AUTO_1658 ) ) ( not ( = ?AUTO_1655 ?AUTO_1656 ) ) ( not ( = ?AUTO_1655 ?AUTO_1658 ) ) ( not ( = ?AUTO_1657 ?AUTO_1656 ) ) ( not ( = ?AUTO_1657 ?AUTO_1658 ) ) ( not ( = ?AUTO_1656 ?AUTO_1658 ) ) ( ON ?AUTO_1656 ?AUTO_1654 ) ( not ( = ?AUTO_1654 ?AUTO_1659 ) ) ( not ( = ?AUTO_1655 ?AUTO_1659 ) ) ( not ( = ?AUTO_1657 ?AUTO_1659 ) ) ( not ( = ?AUTO_1658 ?AUTO_1659 ) ) ( not ( = ?AUTO_1656 ?AUTO_1659 ) ) ( ON ?AUTO_1659 ?AUTO_1656 ) ( CLEAR ?AUTO_1659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1659 ?AUTO_1656 )
      ( MAKE-ON ?AUTO_1654 ?AUTO_1655 )
      ( MAKE-ON-VERIFY ?AUTO_1654 ?AUTO_1655 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1660 - BLOCK
      ?AUTO_1661 - BLOCK
    )
    :vars
    (
      ?AUTO_1664 - BLOCK
      ?AUTO_1663 - BLOCK
      ?AUTO_1665 - BLOCK
      ?AUTO_1662 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1660 ?AUTO_1661 ) ) ( ON ?AUTO_1660 ?AUTO_1664 ) ( not ( = ?AUTO_1660 ?AUTO_1664 ) ) ( not ( = ?AUTO_1661 ?AUTO_1664 ) ) ( CLEAR ?AUTO_1663 ) ( not ( = ?AUTO_1660 ?AUTO_1665 ) ) ( not ( = ?AUTO_1660 ?AUTO_1663 ) ) ( not ( = ?AUTO_1661 ?AUTO_1665 ) ) ( not ( = ?AUTO_1661 ?AUTO_1663 ) ) ( not ( = ?AUTO_1664 ?AUTO_1665 ) ) ( not ( = ?AUTO_1664 ?AUTO_1663 ) ) ( not ( = ?AUTO_1665 ?AUTO_1663 ) ) ( ON ?AUTO_1665 ?AUTO_1660 ) ( not ( = ?AUTO_1660 ?AUTO_1662 ) ) ( not ( = ?AUTO_1661 ?AUTO_1662 ) ) ( not ( = ?AUTO_1664 ?AUTO_1662 ) ) ( not ( = ?AUTO_1663 ?AUTO_1662 ) ) ( not ( = ?AUTO_1665 ?AUTO_1662 ) ) ( ON ?AUTO_1662 ?AUTO_1665 ) ( CLEAR ?AUTO_1662 ) ( HOLDING ?AUTO_1661 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1661 )
      ( MAKE-ON ?AUTO_1660 ?AUTO_1661 )
      ( MAKE-ON-VERIFY ?AUTO_1660 ?AUTO_1661 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1668 - BLOCK
      ?AUTO_1669 - BLOCK
    )
    :vars
    (
      ?AUTO_1670 - BLOCK
      ?AUTO_1673 - BLOCK
      ?AUTO_1671 - BLOCK
      ?AUTO_1672 - BLOCK
      ?AUTO_1674 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1669 ) ( not ( = ?AUTO_1668 ?AUTO_1669 ) ) ( ON ?AUTO_1668 ?AUTO_1670 ) ( not ( = ?AUTO_1668 ?AUTO_1670 ) ) ( not ( = ?AUTO_1669 ?AUTO_1670 ) ) ( CLEAR ?AUTO_1673 ) ( not ( = ?AUTO_1668 ?AUTO_1671 ) ) ( not ( = ?AUTO_1668 ?AUTO_1673 ) ) ( not ( = ?AUTO_1669 ?AUTO_1671 ) ) ( not ( = ?AUTO_1669 ?AUTO_1673 ) ) ( not ( = ?AUTO_1670 ?AUTO_1671 ) ) ( not ( = ?AUTO_1670 ?AUTO_1673 ) ) ( not ( = ?AUTO_1671 ?AUTO_1673 ) ) ( ON ?AUTO_1671 ?AUTO_1668 ) ( not ( = ?AUTO_1668 ?AUTO_1672 ) ) ( not ( = ?AUTO_1669 ?AUTO_1672 ) ) ( not ( = ?AUTO_1670 ?AUTO_1672 ) ) ( not ( = ?AUTO_1673 ?AUTO_1672 ) ) ( not ( = ?AUTO_1671 ?AUTO_1672 ) ) ( ON ?AUTO_1672 ?AUTO_1671 ) ( CLEAR ?AUTO_1672 ) ( HOLDING ?AUTO_1674 ) ( not ( = ?AUTO_1668 ?AUTO_1674 ) ) ( not ( = ?AUTO_1669 ?AUTO_1674 ) ) ( not ( = ?AUTO_1670 ?AUTO_1674 ) ) ( not ( = ?AUTO_1673 ?AUTO_1674 ) ) ( not ( = ?AUTO_1671 ?AUTO_1674 ) ) ( not ( = ?AUTO_1672 ?AUTO_1674 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1674 )
      ( MAKE-ON ?AUTO_1668 ?AUTO_1669 )
      ( MAKE-ON-VERIFY ?AUTO_1668 ?AUTO_1669 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1675 - BLOCK
      ?AUTO_1676 - BLOCK
    )
    :vars
    (
      ?AUTO_1678 - BLOCK
      ?AUTO_1681 - BLOCK
      ?AUTO_1677 - BLOCK
      ?AUTO_1679 - BLOCK
      ?AUTO_1680 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1675 ?AUTO_1676 ) ) ( ON ?AUTO_1675 ?AUTO_1678 ) ( not ( = ?AUTO_1675 ?AUTO_1678 ) ) ( not ( = ?AUTO_1676 ?AUTO_1678 ) ) ( CLEAR ?AUTO_1681 ) ( not ( = ?AUTO_1675 ?AUTO_1677 ) ) ( not ( = ?AUTO_1675 ?AUTO_1681 ) ) ( not ( = ?AUTO_1676 ?AUTO_1677 ) ) ( not ( = ?AUTO_1676 ?AUTO_1681 ) ) ( not ( = ?AUTO_1678 ?AUTO_1677 ) ) ( not ( = ?AUTO_1678 ?AUTO_1681 ) ) ( not ( = ?AUTO_1677 ?AUTO_1681 ) ) ( ON ?AUTO_1677 ?AUTO_1675 ) ( not ( = ?AUTO_1675 ?AUTO_1679 ) ) ( not ( = ?AUTO_1676 ?AUTO_1679 ) ) ( not ( = ?AUTO_1678 ?AUTO_1679 ) ) ( not ( = ?AUTO_1681 ?AUTO_1679 ) ) ( not ( = ?AUTO_1677 ?AUTO_1679 ) ) ( ON ?AUTO_1679 ?AUTO_1677 ) ( CLEAR ?AUTO_1679 ) ( not ( = ?AUTO_1675 ?AUTO_1680 ) ) ( not ( = ?AUTO_1676 ?AUTO_1680 ) ) ( not ( = ?AUTO_1678 ?AUTO_1680 ) ) ( not ( = ?AUTO_1681 ?AUTO_1680 ) ) ( not ( = ?AUTO_1677 ?AUTO_1680 ) ) ( not ( = ?AUTO_1679 ?AUTO_1680 ) ) ( ON ?AUTO_1680 ?AUTO_1676 ) ( CLEAR ?AUTO_1680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1680 ?AUTO_1676 )
      ( MAKE-ON ?AUTO_1675 ?AUTO_1676 )
      ( MAKE-ON-VERIFY ?AUTO_1675 ?AUTO_1676 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1682 - BLOCK
      ?AUTO_1683 - BLOCK
    )
    :vars
    (
      ?AUTO_1687 - BLOCK
      ?AUTO_1686 - BLOCK
      ?AUTO_1688 - BLOCK
      ?AUTO_1685 - BLOCK
      ?AUTO_1684 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1682 ?AUTO_1683 ) ) ( ON ?AUTO_1682 ?AUTO_1687 ) ( not ( = ?AUTO_1682 ?AUTO_1687 ) ) ( not ( = ?AUTO_1683 ?AUTO_1687 ) ) ( not ( = ?AUTO_1682 ?AUTO_1686 ) ) ( not ( = ?AUTO_1682 ?AUTO_1688 ) ) ( not ( = ?AUTO_1683 ?AUTO_1686 ) ) ( not ( = ?AUTO_1683 ?AUTO_1688 ) ) ( not ( = ?AUTO_1687 ?AUTO_1686 ) ) ( not ( = ?AUTO_1687 ?AUTO_1688 ) ) ( not ( = ?AUTO_1686 ?AUTO_1688 ) ) ( ON ?AUTO_1686 ?AUTO_1682 ) ( not ( = ?AUTO_1682 ?AUTO_1685 ) ) ( not ( = ?AUTO_1683 ?AUTO_1685 ) ) ( not ( = ?AUTO_1687 ?AUTO_1685 ) ) ( not ( = ?AUTO_1688 ?AUTO_1685 ) ) ( not ( = ?AUTO_1686 ?AUTO_1685 ) ) ( ON ?AUTO_1685 ?AUTO_1686 ) ( CLEAR ?AUTO_1685 ) ( not ( = ?AUTO_1682 ?AUTO_1684 ) ) ( not ( = ?AUTO_1683 ?AUTO_1684 ) ) ( not ( = ?AUTO_1687 ?AUTO_1684 ) ) ( not ( = ?AUTO_1688 ?AUTO_1684 ) ) ( not ( = ?AUTO_1686 ?AUTO_1684 ) ) ( not ( = ?AUTO_1685 ?AUTO_1684 ) ) ( ON ?AUTO_1684 ?AUTO_1683 ) ( CLEAR ?AUTO_1684 ) ( HOLDING ?AUTO_1688 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1688 )
      ( MAKE-ON ?AUTO_1682 ?AUTO_1683 )
      ( MAKE-ON-VERIFY ?AUTO_1682 ?AUTO_1683 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1689 - BLOCK
      ?AUTO_1690 - BLOCK
    )
    :vars
    (
      ?AUTO_1692 - BLOCK
      ?AUTO_1695 - BLOCK
      ?AUTO_1691 - BLOCK
      ?AUTO_1693 - BLOCK
      ?AUTO_1694 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1689 ?AUTO_1690 ) ) ( ON ?AUTO_1689 ?AUTO_1692 ) ( not ( = ?AUTO_1689 ?AUTO_1692 ) ) ( not ( = ?AUTO_1690 ?AUTO_1692 ) ) ( not ( = ?AUTO_1689 ?AUTO_1695 ) ) ( not ( = ?AUTO_1689 ?AUTO_1691 ) ) ( not ( = ?AUTO_1690 ?AUTO_1695 ) ) ( not ( = ?AUTO_1690 ?AUTO_1691 ) ) ( not ( = ?AUTO_1692 ?AUTO_1695 ) ) ( not ( = ?AUTO_1692 ?AUTO_1691 ) ) ( not ( = ?AUTO_1695 ?AUTO_1691 ) ) ( ON ?AUTO_1695 ?AUTO_1689 ) ( not ( = ?AUTO_1689 ?AUTO_1693 ) ) ( not ( = ?AUTO_1690 ?AUTO_1693 ) ) ( not ( = ?AUTO_1692 ?AUTO_1693 ) ) ( not ( = ?AUTO_1691 ?AUTO_1693 ) ) ( not ( = ?AUTO_1695 ?AUTO_1693 ) ) ( ON ?AUTO_1693 ?AUTO_1695 ) ( not ( = ?AUTO_1689 ?AUTO_1694 ) ) ( not ( = ?AUTO_1690 ?AUTO_1694 ) ) ( not ( = ?AUTO_1692 ?AUTO_1694 ) ) ( not ( = ?AUTO_1691 ?AUTO_1694 ) ) ( not ( = ?AUTO_1695 ?AUTO_1694 ) ) ( not ( = ?AUTO_1693 ?AUTO_1694 ) ) ( ON ?AUTO_1694 ?AUTO_1690 ) ( CLEAR ?AUTO_1694 ) ( ON ?AUTO_1691 ?AUTO_1693 ) ( CLEAR ?AUTO_1691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1691 ?AUTO_1693 )
      ( MAKE-ON ?AUTO_1689 ?AUTO_1690 )
      ( MAKE-ON-VERIFY ?AUTO_1689 ?AUTO_1690 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1698 - BLOCK
      ?AUTO_1699 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1698 ) ( CLEAR ?AUTO_1699 ) ( not ( = ?AUTO_1698 ?AUTO_1699 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1698 ?AUTO_1699 )
      ( MAKE-ON-VERIFY ?AUTO_1698 ?AUTO_1699 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1700 - BLOCK
      ?AUTO_1701 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1701 ) ( not ( = ?AUTO_1700 ?AUTO_1701 ) ) ( ON-TABLE ?AUTO_1700 ) ( CLEAR ?AUTO_1700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1700 )
      ( MAKE-ON ?AUTO_1700 ?AUTO_1701 )
      ( MAKE-ON-VERIFY ?AUTO_1700 ?AUTO_1701 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1702 - BLOCK
      ?AUTO_1703 - BLOCK
    )
    :vars
    (
      ?AUTO_1704 - BLOCK
      ?AUTO_1705 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1703 ) ( not ( = ?AUTO_1702 ?AUTO_1703 ) ) ( ON-TABLE ?AUTO_1702 ) ( CLEAR ?AUTO_1702 ) ( HOLDING ?AUTO_1704 ) ( CLEAR ?AUTO_1705 ) ( not ( = ?AUTO_1702 ?AUTO_1704 ) ) ( not ( = ?AUTO_1702 ?AUTO_1705 ) ) ( not ( = ?AUTO_1703 ?AUTO_1704 ) ) ( not ( = ?AUTO_1703 ?AUTO_1705 ) ) ( not ( = ?AUTO_1704 ?AUTO_1705 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1704 ?AUTO_1705 )
      ( MAKE-ON ?AUTO_1702 ?AUTO_1703 )
      ( MAKE-ON-VERIFY ?AUTO_1702 ?AUTO_1703 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1706 - BLOCK
      ?AUTO_1707 - BLOCK
    )
    :vars
    (
      ?AUTO_1708 - BLOCK
      ?AUTO_1709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1706 ?AUTO_1707 ) ) ( ON-TABLE ?AUTO_1706 ) ( CLEAR ?AUTO_1706 ) ( CLEAR ?AUTO_1708 ) ( not ( = ?AUTO_1706 ?AUTO_1709 ) ) ( not ( = ?AUTO_1706 ?AUTO_1708 ) ) ( not ( = ?AUTO_1707 ?AUTO_1709 ) ) ( not ( = ?AUTO_1707 ?AUTO_1708 ) ) ( not ( = ?AUTO_1709 ?AUTO_1708 ) ) ( ON ?AUTO_1709 ?AUTO_1707 ) ( CLEAR ?AUTO_1709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1709 ?AUTO_1707 )
      ( MAKE-ON ?AUTO_1706 ?AUTO_1707 )
      ( MAKE-ON-VERIFY ?AUTO_1706 ?AUTO_1707 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1710 - BLOCK
      ?AUTO_1711 - BLOCK
    )
    :vars
    (
      ?AUTO_1712 - BLOCK
      ?AUTO_1713 - BLOCK
      ?AUTO_1714 - BLOCK
      ?AUTO_1715 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1710 ?AUTO_1711 ) ) ( ON-TABLE ?AUTO_1710 ) ( CLEAR ?AUTO_1710 ) ( CLEAR ?AUTO_1712 ) ( not ( = ?AUTO_1710 ?AUTO_1713 ) ) ( not ( = ?AUTO_1710 ?AUTO_1712 ) ) ( not ( = ?AUTO_1711 ?AUTO_1713 ) ) ( not ( = ?AUTO_1711 ?AUTO_1712 ) ) ( not ( = ?AUTO_1713 ?AUTO_1712 ) ) ( ON ?AUTO_1713 ?AUTO_1711 ) ( CLEAR ?AUTO_1713 ) ( HOLDING ?AUTO_1714 ) ( CLEAR ?AUTO_1715 ) ( not ( = ?AUTO_1710 ?AUTO_1714 ) ) ( not ( = ?AUTO_1710 ?AUTO_1715 ) ) ( not ( = ?AUTO_1711 ?AUTO_1714 ) ) ( not ( = ?AUTO_1711 ?AUTO_1715 ) ) ( not ( = ?AUTO_1712 ?AUTO_1714 ) ) ( not ( = ?AUTO_1712 ?AUTO_1715 ) ) ( not ( = ?AUTO_1713 ?AUTO_1714 ) ) ( not ( = ?AUTO_1713 ?AUTO_1715 ) ) ( not ( = ?AUTO_1714 ?AUTO_1715 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1714 ?AUTO_1715 )
      ( MAKE-ON ?AUTO_1710 ?AUTO_1711 )
      ( MAKE-ON-VERIFY ?AUTO_1710 ?AUTO_1711 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1716 - BLOCK
      ?AUTO_1717 - BLOCK
    )
    :vars
    (
      ?AUTO_1718 - BLOCK
      ?AUTO_1719 - BLOCK
      ?AUTO_1721 - BLOCK
      ?AUTO_1720 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1716 ?AUTO_1717 ) ) ( ON-TABLE ?AUTO_1716 ) ( CLEAR ?AUTO_1716 ) ( CLEAR ?AUTO_1718 ) ( not ( = ?AUTO_1716 ?AUTO_1719 ) ) ( not ( = ?AUTO_1716 ?AUTO_1718 ) ) ( not ( = ?AUTO_1717 ?AUTO_1719 ) ) ( not ( = ?AUTO_1717 ?AUTO_1718 ) ) ( not ( = ?AUTO_1719 ?AUTO_1718 ) ) ( ON ?AUTO_1719 ?AUTO_1717 ) ( CLEAR ?AUTO_1721 ) ( not ( = ?AUTO_1716 ?AUTO_1720 ) ) ( not ( = ?AUTO_1716 ?AUTO_1721 ) ) ( not ( = ?AUTO_1717 ?AUTO_1720 ) ) ( not ( = ?AUTO_1717 ?AUTO_1721 ) ) ( not ( = ?AUTO_1718 ?AUTO_1720 ) ) ( not ( = ?AUTO_1718 ?AUTO_1721 ) ) ( not ( = ?AUTO_1719 ?AUTO_1720 ) ) ( not ( = ?AUTO_1719 ?AUTO_1721 ) ) ( not ( = ?AUTO_1720 ?AUTO_1721 ) ) ( ON ?AUTO_1720 ?AUTO_1719 ) ( CLEAR ?AUTO_1720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1720 ?AUTO_1719 )
      ( MAKE-ON ?AUTO_1716 ?AUTO_1717 )
      ( MAKE-ON-VERIFY ?AUTO_1716 ?AUTO_1717 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1722 - BLOCK
      ?AUTO_1723 - BLOCK
    )
    :vars
    (
      ?AUTO_1727 - BLOCK
      ?AUTO_1724 - BLOCK
      ?AUTO_1725 - BLOCK
      ?AUTO_1726 - BLOCK
      ?AUTO_1728 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1722 ?AUTO_1723 ) ) ( ON-TABLE ?AUTO_1722 ) ( CLEAR ?AUTO_1722 ) ( CLEAR ?AUTO_1727 ) ( not ( = ?AUTO_1722 ?AUTO_1724 ) ) ( not ( = ?AUTO_1722 ?AUTO_1727 ) ) ( not ( = ?AUTO_1723 ?AUTO_1724 ) ) ( not ( = ?AUTO_1723 ?AUTO_1727 ) ) ( not ( = ?AUTO_1724 ?AUTO_1727 ) ) ( ON ?AUTO_1724 ?AUTO_1723 ) ( CLEAR ?AUTO_1725 ) ( not ( = ?AUTO_1722 ?AUTO_1726 ) ) ( not ( = ?AUTO_1722 ?AUTO_1725 ) ) ( not ( = ?AUTO_1723 ?AUTO_1726 ) ) ( not ( = ?AUTO_1723 ?AUTO_1725 ) ) ( not ( = ?AUTO_1727 ?AUTO_1726 ) ) ( not ( = ?AUTO_1727 ?AUTO_1725 ) ) ( not ( = ?AUTO_1724 ?AUTO_1726 ) ) ( not ( = ?AUTO_1724 ?AUTO_1725 ) ) ( not ( = ?AUTO_1726 ?AUTO_1725 ) ) ( ON ?AUTO_1726 ?AUTO_1724 ) ( CLEAR ?AUTO_1726 ) ( HOLDING ?AUTO_1728 ) ( not ( = ?AUTO_1722 ?AUTO_1728 ) ) ( not ( = ?AUTO_1723 ?AUTO_1728 ) ) ( not ( = ?AUTO_1727 ?AUTO_1728 ) ) ( not ( = ?AUTO_1724 ?AUTO_1728 ) ) ( not ( = ?AUTO_1725 ?AUTO_1728 ) ) ( not ( = ?AUTO_1726 ?AUTO_1728 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1728 )
      ( MAKE-ON ?AUTO_1722 ?AUTO_1723 )
      ( MAKE-ON-VERIFY ?AUTO_1722 ?AUTO_1723 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1729 - BLOCK
      ?AUTO_1730 - BLOCK
    )
    :vars
    (
      ?AUTO_1732 - BLOCK
      ?AUTO_1733 - BLOCK
      ?AUTO_1731 - BLOCK
      ?AUTO_1734 - BLOCK
      ?AUTO_1735 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1729 ?AUTO_1730 ) ) ( ON-TABLE ?AUTO_1729 ) ( CLEAR ?AUTO_1729 ) ( CLEAR ?AUTO_1732 ) ( not ( = ?AUTO_1729 ?AUTO_1733 ) ) ( not ( = ?AUTO_1729 ?AUTO_1732 ) ) ( not ( = ?AUTO_1730 ?AUTO_1733 ) ) ( not ( = ?AUTO_1730 ?AUTO_1732 ) ) ( not ( = ?AUTO_1733 ?AUTO_1732 ) ) ( ON ?AUTO_1733 ?AUTO_1730 ) ( CLEAR ?AUTO_1731 ) ( not ( = ?AUTO_1729 ?AUTO_1734 ) ) ( not ( = ?AUTO_1729 ?AUTO_1731 ) ) ( not ( = ?AUTO_1730 ?AUTO_1734 ) ) ( not ( = ?AUTO_1730 ?AUTO_1731 ) ) ( not ( = ?AUTO_1732 ?AUTO_1734 ) ) ( not ( = ?AUTO_1732 ?AUTO_1731 ) ) ( not ( = ?AUTO_1733 ?AUTO_1734 ) ) ( not ( = ?AUTO_1733 ?AUTO_1731 ) ) ( not ( = ?AUTO_1734 ?AUTO_1731 ) ) ( ON ?AUTO_1734 ?AUTO_1733 ) ( not ( = ?AUTO_1729 ?AUTO_1735 ) ) ( not ( = ?AUTO_1730 ?AUTO_1735 ) ) ( not ( = ?AUTO_1732 ?AUTO_1735 ) ) ( not ( = ?AUTO_1733 ?AUTO_1735 ) ) ( not ( = ?AUTO_1731 ?AUTO_1735 ) ) ( not ( = ?AUTO_1734 ?AUTO_1735 ) ) ( ON ?AUTO_1735 ?AUTO_1734 ) ( CLEAR ?AUTO_1735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1735 ?AUTO_1734 )
      ( MAKE-ON ?AUTO_1729 ?AUTO_1730 )
      ( MAKE-ON-VERIFY ?AUTO_1729 ?AUTO_1730 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1736 - BLOCK
      ?AUTO_1737 - BLOCK
    )
    :vars
    (
      ?AUTO_1738 - BLOCK
      ?AUTO_1739 - BLOCK
      ?AUTO_1740 - BLOCK
      ?AUTO_1742 - BLOCK
      ?AUTO_1741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1736 ?AUTO_1737 ) ) ( ON-TABLE ?AUTO_1736 ) ( CLEAR ?AUTO_1736 ) ( not ( = ?AUTO_1736 ?AUTO_1738 ) ) ( not ( = ?AUTO_1736 ?AUTO_1739 ) ) ( not ( = ?AUTO_1737 ?AUTO_1738 ) ) ( not ( = ?AUTO_1737 ?AUTO_1739 ) ) ( not ( = ?AUTO_1738 ?AUTO_1739 ) ) ( ON ?AUTO_1738 ?AUTO_1737 ) ( CLEAR ?AUTO_1740 ) ( not ( = ?AUTO_1736 ?AUTO_1742 ) ) ( not ( = ?AUTO_1736 ?AUTO_1740 ) ) ( not ( = ?AUTO_1737 ?AUTO_1742 ) ) ( not ( = ?AUTO_1737 ?AUTO_1740 ) ) ( not ( = ?AUTO_1739 ?AUTO_1742 ) ) ( not ( = ?AUTO_1739 ?AUTO_1740 ) ) ( not ( = ?AUTO_1738 ?AUTO_1742 ) ) ( not ( = ?AUTO_1738 ?AUTO_1740 ) ) ( not ( = ?AUTO_1742 ?AUTO_1740 ) ) ( ON ?AUTO_1742 ?AUTO_1738 ) ( not ( = ?AUTO_1736 ?AUTO_1741 ) ) ( not ( = ?AUTO_1737 ?AUTO_1741 ) ) ( not ( = ?AUTO_1739 ?AUTO_1741 ) ) ( not ( = ?AUTO_1738 ?AUTO_1741 ) ) ( not ( = ?AUTO_1740 ?AUTO_1741 ) ) ( not ( = ?AUTO_1742 ?AUTO_1741 ) ) ( ON ?AUTO_1741 ?AUTO_1742 ) ( CLEAR ?AUTO_1741 ) ( HOLDING ?AUTO_1739 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1739 )
      ( MAKE-ON ?AUTO_1736 ?AUTO_1737 )
      ( MAKE-ON-VERIFY ?AUTO_1736 ?AUTO_1737 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1743 - BLOCK
      ?AUTO_1744 - BLOCK
    )
    :vars
    (
      ?AUTO_1745 - BLOCK
      ?AUTO_1747 - BLOCK
      ?AUTO_1749 - BLOCK
      ?AUTO_1748 - BLOCK
      ?AUTO_1746 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1743 ?AUTO_1744 ) ) ( ON-TABLE ?AUTO_1743 ) ( not ( = ?AUTO_1743 ?AUTO_1745 ) ) ( not ( = ?AUTO_1743 ?AUTO_1747 ) ) ( not ( = ?AUTO_1744 ?AUTO_1745 ) ) ( not ( = ?AUTO_1744 ?AUTO_1747 ) ) ( not ( = ?AUTO_1745 ?AUTO_1747 ) ) ( ON ?AUTO_1745 ?AUTO_1744 ) ( CLEAR ?AUTO_1749 ) ( not ( = ?AUTO_1743 ?AUTO_1748 ) ) ( not ( = ?AUTO_1743 ?AUTO_1749 ) ) ( not ( = ?AUTO_1744 ?AUTO_1748 ) ) ( not ( = ?AUTO_1744 ?AUTO_1749 ) ) ( not ( = ?AUTO_1747 ?AUTO_1748 ) ) ( not ( = ?AUTO_1747 ?AUTO_1749 ) ) ( not ( = ?AUTO_1745 ?AUTO_1748 ) ) ( not ( = ?AUTO_1745 ?AUTO_1749 ) ) ( not ( = ?AUTO_1748 ?AUTO_1749 ) ) ( ON ?AUTO_1748 ?AUTO_1745 ) ( not ( = ?AUTO_1743 ?AUTO_1746 ) ) ( not ( = ?AUTO_1744 ?AUTO_1746 ) ) ( not ( = ?AUTO_1747 ?AUTO_1746 ) ) ( not ( = ?AUTO_1745 ?AUTO_1746 ) ) ( not ( = ?AUTO_1749 ?AUTO_1746 ) ) ( not ( = ?AUTO_1748 ?AUTO_1746 ) ) ( ON ?AUTO_1746 ?AUTO_1748 ) ( CLEAR ?AUTO_1746 ) ( ON ?AUTO_1747 ?AUTO_1743 ) ( CLEAR ?AUTO_1747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1747 ?AUTO_1743 )
      ( MAKE-ON ?AUTO_1743 ?AUTO_1744 )
      ( MAKE-ON-VERIFY ?AUTO_1743 ?AUTO_1744 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1750 - BLOCK
      ?AUTO_1751 - BLOCK
    )
    :vars
    (
      ?AUTO_1753 - BLOCK
      ?AUTO_1755 - BLOCK
      ?AUTO_1756 - BLOCK
      ?AUTO_1754 - BLOCK
      ?AUTO_1752 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1750 ?AUTO_1751 ) ) ( ON-TABLE ?AUTO_1750 ) ( not ( = ?AUTO_1750 ?AUTO_1753 ) ) ( not ( = ?AUTO_1750 ?AUTO_1755 ) ) ( not ( = ?AUTO_1751 ?AUTO_1753 ) ) ( not ( = ?AUTO_1751 ?AUTO_1755 ) ) ( not ( = ?AUTO_1753 ?AUTO_1755 ) ) ( ON ?AUTO_1753 ?AUTO_1751 ) ( not ( = ?AUTO_1750 ?AUTO_1756 ) ) ( not ( = ?AUTO_1750 ?AUTO_1754 ) ) ( not ( = ?AUTO_1751 ?AUTO_1756 ) ) ( not ( = ?AUTO_1751 ?AUTO_1754 ) ) ( not ( = ?AUTO_1755 ?AUTO_1756 ) ) ( not ( = ?AUTO_1755 ?AUTO_1754 ) ) ( not ( = ?AUTO_1753 ?AUTO_1756 ) ) ( not ( = ?AUTO_1753 ?AUTO_1754 ) ) ( not ( = ?AUTO_1756 ?AUTO_1754 ) ) ( ON ?AUTO_1756 ?AUTO_1753 ) ( not ( = ?AUTO_1750 ?AUTO_1752 ) ) ( not ( = ?AUTO_1751 ?AUTO_1752 ) ) ( not ( = ?AUTO_1755 ?AUTO_1752 ) ) ( not ( = ?AUTO_1753 ?AUTO_1752 ) ) ( not ( = ?AUTO_1754 ?AUTO_1752 ) ) ( not ( = ?AUTO_1756 ?AUTO_1752 ) ) ( ON ?AUTO_1752 ?AUTO_1756 ) ( CLEAR ?AUTO_1752 ) ( ON ?AUTO_1755 ?AUTO_1750 ) ( CLEAR ?AUTO_1755 ) ( HOLDING ?AUTO_1754 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1754 )
      ( MAKE-ON ?AUTO_1750 ?AUTO_1751 )
      ( MAKE-ON-VERIFY ?AUTO_1750 ?AUTO_1751 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1757 - BLOCK
      ?AUTO_1758 - BLOCK
    )
    :vars
    (
      ?AUTO_1760 - BLOCK
      ?AUTO_1762 - BLOCK
      ?AUTO_1761 - BLOCK
      ?AUTO_1763 - BLOCK
      ?AUTO_1759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1757 ?AUTO_1758 ) ) ( ON-TABLE ?AUTO_1757 ) ( not ( = ?AUTO_1757 ?AUTO_1760 ) ) ( not ( = ?AUTO_1757 ?AUTO_1762 ) ) ( not ( = ?AUTO_1758 ?AUTO_1760 ) ) ( not ( = ?AUTO_1758 ?AUTO_1762 ) ) ( not ( = ?AUTO_1760 ?AUTO_1762 ) ) ( ON ?AUTO_1760 ?AUTO_1758 ) ( not ( = ?AUTO_1757 ?AUTO_1761 ) ) ( not ( = ?AUTO_1757 ?AUTO_1763 ) ) ( not ( = ?AUTO_1758 ?AUTO_1761 ) ) ( not ( = ?AUTO_1758 ?AUTO_1763 ) ) ( not ( = ?AUTO_1762 ?AUTO_1761 ) ) ( not ( = ?AUTO_1762 ?AUTO_1763 ) ) ( not ( = ?AUTO_1760 ?AUTO_1761 ) ) ( not ( = ?AUTO_1760 ?AUTO_1763 ) ) ( not ( = ?AUTO_1761 ?AUTO_1763 ) ) ( ON ?AUTO_1761 ?AUTO_1760 ) ( not ( = ?AUTO_1757 ?AUTO_1759 ) ) ( not ( = ?AUTO_1758 ?AUTO_1759 ) ) ( not ( = ?AUTO_1762 ?AUTO_1759 ) ) ( not ( = ?AUTO_1760 ?AUTO_1759 ) ) ( not ( = ?AUTO_1763 ?AUTO_1759 ) ) ( not ( = ?AUTO_1761 ?AUTO_1759 ) ) ( ON ?AUTO_1759 ?AUTO_1761 ) ( CLEAR ?AUTO_1759 ) ( ON ?AUTO_1762 ?AUTO_1757 ) ( ON ?AUTO_1763 ?AUTO_1762 ) ( CLEAR ?AUTO_1763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1763 ?AUTO_1762 )
      ( MAKE-ON ?AUTO_1757 ?AUTO_1758 )
      ( MAKE-ON-VERIFY ?AUTO_1757 ?AUTO_1758 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1764 - BLOCK
      ?AUTO_1765 - BLOCK
    )
    :vars
    (
      ?AUTO_1767 - BLOCK
      ?AUTO_1768 - BLOCK
      ?AUTO_1770 - BLOCK
      ?AUTO_1769 - BLOCK
      ?AUTO_1766 - BLOCK
      ?AUTO_1771 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1764 ?AUTO_1765 ) ) ( ON-TABLE ?AUTO_1764 ) ( not ( = ?AUTO_1764 ?AUTO_1767 ) ) ( not ( = ?AUTO_1764 ?AUTO_1768 ) ) ( not ( = ?AUTO_1765 ?AUTO_1767 ) ) ( not ( = ?AUTO_1765 ?AUTO_1768 ) ) ( not ( = ?AUTO_1767 ?AUTO_1768 ) ) ( ON ?AUTO_1767 ?AUTO_1765 ) ( not ( = ?AUTO_1764 ?AUTO_1770 ) ) ( not ( = ?AUTO_1764 ?AUTO_1769 ) ) ( not ( = ?AUTO_1765 ?AUTO_1770 ) ) ( not ( = ?AUTO_1765 ?AUTO_1769 ) ) ( not ( = ?AUTO_1768 ?AUTO_1770 ) ) ( not ( = ?AUTO_1768 ?AUTO_1769 ) ) ( not ( = ?AUTO_1767 ?AUTO_1770 ) ) ( not ( = ?AUTO_1767 ?AUTO_1769 ) ) ( not ( = ?AUTO_1770 ?AUTO_1769 ) ) ( ON ?AUTO_1770 ?AUTO_1767 ) ( not ( = ?AUTO_1764 ?AUTO_1766 ) ) ( not ( = ?AUTO_1765 ?AUTO_1766 ) ) ( not ( = ?AUTO_1768 ?AUTO_1766 ) ) ( not ( = ?AUTO_1767 ?AUTO_1766 ) ) ( not ( = ?AUTO_1769 ?AUTO_1766 ) ) ( not ( = ?AUTO_1770 ?AUTO_1766 ) ) ( ON ?AUTO_1766 ?AUTO_1770 ) ( CLEAR ?AUTO_1766 ) ( ON ?AUTO_1768 ?AUTO_1764 ) ( ON ?AUTO_1769 ?AUTO_1768 ) ( CLEAR ?AUTO_1769 ) ( HOLDING ?AUTO_1771 ) ( not ( = ?AUTO_1764 ?AUTO_1771 ) ) ( not ( = ?AUTO_1765 ?AUTO_1771 ) ) ( not ( = ?AUTO_1767 ?AUTO_1771 ) ) ( not ( = ?AUTO_1768 ?AUTO_1771 ) ) ( not ( = ?AUTO_1770 ?AUTO_1771 ) ) ( not ( = ?AUTO_1769 ?AUTO_1771 ) ) ( not ( = ?AUTO_1766 ?AUTO_1771 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1771 )
      ( MAKE-ON ?AUTO_1764 ?AUTO_1765 )
      ( MAKE-ON-VERIFY ?AUTO_1764 ?AUTO_1765 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1772 - BLOCK
      ?AUTO_1773 - BLOCK
    )
    :vars
    (
      ?AUTO_1774 - BLOCK
      ?AUTO_1779 - BLOCK
      ?AUTO_1777 - BLOCK
      ?AUTO_1778 - BLOCK
      ?AUTO_1775 - BLOCK
      ?AUTO_1776 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1772 ?AUTO_1773 ) ) ( ON-TABLE ?AUTO_1772 ) ( not ( = ?AUTO_1772 ?AUTO_1774 ) ) ( not ( = ?AUTO_1772 ?AUTO_1779 ) ) ( not ( = ?AUTO_1773 ?AUTO_1774 ) ) ( not ( = ?AUTO_1773 ?AUTO_1779 ) ) ( not ( = ?AUTO_1774 ?AUTO_1779 ) ) ( ON ?AUTO_1774 ?AUTO_1773 ) ( not ( = ?AUTO_1772 ?AUTO_1777 ) ) ( not ( = ?AUTO_1772 ?AUTO_1778 ) ) ( not ( = ?AUTO_1773 ?AUTO_1777 ) ) ( not ( = ?AUTO_1773 ?AUTO_1778 ) ) ( not ( = ?AUTO_1779 ?AUTO_1777 ) ) ( not ( = ?AUTO_1779 ?AUTO_1778 ) ) ( not ( = ?AUTO_1774 ?AUTO_1777 ) ) ( not ( = ?AUTO_1774 ?AUTO_1778 ) ) ( not ( = ?AUTO_1777 ?AUTO_1778 ) ) ( ON ?AUTO_1777 ?AUTO_1774 ) ( not ( = ?AUTO_1772 ?AUTO_1775 ) ) ( not ( = ?AUTO_1773 ?AUTO_1775 ) ) ( not ( = ?AUTO_1779 ?AUTO_1775 ) ) ( not ( = ?AUTO_1774 ?AUTO_1775 ) ) ( not ( = ?AUTO_1778 ?AUTO_1775 ) ) ( not ( = ?AUTO_1777 ?AUTO_1775 ) ) ( ON ?AUTO_1775 ?AUTO_1777 ) ( ON ?AUTO_1779 ?AUTO_1772 ) ( ON ?AUTO_1778 ?AUTO_1779 ) ( CLEAR ?AUTO_1778 ) ( not ( = ?AUTO_1772 ?AUTO_1776 ) ) ( not ( = ?AUTO_1773 ?AUTO_1776 ) ) ( not ( = ?AUTO_1774 ?AUTO_1776 ) ) ( not ( = ?AUTO_1779 ?AUTO_1776 ) ) ( not ( = ?AUTO_1777 ?AUTO_1776 ) ) ( not ( = ?AUTO_1778 ?AUTO_1776 ) ) ( not ( = ?AUTO_1775 ?AUTO_1776 ) ) ( ON ?AUTO_1776 ?AUTO_1775 ) ( CLEAR ?AUTO_1776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1776 ?AUTO_1775 )
      ( MAKE-ON ?AUTO_1772 ?AUTO_1773 )
      ( MAKE-ON-VERIFY ?AUTO_1772 ?AUTO_1773 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1781 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1781 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1781 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1781 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1782 - BLOCK
    )
    :vars
    (
      ?AUTO_1783 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1782 ?AUTO_1783 ) ( CLEAR ?AUTO_1782 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1782 ?AUTO_1783 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1782 ?AUTO_1783 )
      ( MAKE-ON-TABLE ?AUTO_1782 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1782 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1784 - BLOCK
    )
    :vars
    (
      ?AUTO_1785 - BLOCK
      ?AUTO_1786 - BLOCK
      ?AUTO_1787 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1784 ?AUTO_1785 ) ( CLEAR ?AUTO_1784 ) ( not ( = ?AUTO_1784 ?AUTO_1785 ) ) ( HOLDING ?AUTO_1786 ) ( CLEAR ?AUTO_1787 ) ( not ( = ?AUTO_1784 ?AUTO_1786 ) ) ( not ( = ?AUTO_1784 ?AUTO_1787 ) ) ( not ( = ?AUTO_1785 ?AUTO_1786 ) ) ( not ( = ?AUTO_1785 ?AUTO_1787 ) ) ( not ( = ?AUTO_1786 ?AUTO_1787 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1786 ?AUTO_1787 )
      ( MAKE-ON-TABLE ?AUTO_1784 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1784 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1794 - BLOCK
    )
    :vars
    (
      ?AUTO_1795 - BLOCK
      ?AUTO_1797 - BLOCK
      ?AUTO_1796 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1794 ?AUTO_1795 ) ( not ( = ?AUTO_1794 ?AUTO_1795 ) ) ( CLEAR ?AUTO_1797 ) ( not ( = ?AUTO_1794 ?AUTO_1796 ) ) ( not ( = ?AUTO_1794 ?AUTO_1797 ) ) ( not ( = ?AUTO_1795 ?AUTO_1796 ) ) ( not ( = ?AUTO_1795 ?AUTO_1797 ) ) ( not ( = ?AUTO_1796 ?AUTO_1797 ) ) ( ON ?AUTO_1796 ?AUTO_1794 ) ( CLEAR ?AUTO_1796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1796 ?AUTO_1794 )
      ( MAKE-ON-TABLE ?AUTO_1794 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1794 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1798 - BLOCK
    )
    :vars
    (
      ?AUTO_1800 - BLOCK
      ?AUTO_1801 - BLOCK
      ?AUTO_1799 - BLOCK
      ?AUTO_1802 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1798 ?AUTO_1800 ) ( not ( = ?AUTO_1798 ?AUTO_1800 ) ) ( CLEAR ?AUTO_1801 ) ( not ( = ?AUTO_1798 ?AUTO_1799 ) ) ( not ( = ?AUTO_1798 ?AUTO_1801 ) ) ( not ( = ?AUTO_1800 ?AUTO_1799 ) ) ( not ( = ?AUTO_1800 ?AUTO_1801 ) ) ( not ( = ?AUTO_1799 ?AUTO_1801 ) ) ( ON ?AUTO_1799 ?AUTO_1798 ) ( CLEAR ?AUTO_1799 ) ( HOLDING ?AUTO_1802 ) ( not ( = ?AUTO_1798 ?AUTO_1802 ) ) ( not ( = ?AUTO_1800 ?AUTO_1802 ) ) ( not ( = ?AUTO_1801 ?AUTO_1802 ) ) ( not ( = ?AUTO_1799 ?AUTO_1802 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1802 )
      ( MAKE-ON-TABLE ?AUTO_1798 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1798 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1807 - BLOCK
    )
    :vars
    (
      ?AUTO_1809 - BLOCK
      ?AUTO_1810 - BLOCK
      ?AUTO_1808 - BLOCK
      ?AUTO_1811 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1807 ?AUTO_1809 ) ( not ( = ?AUTO_1807 ?AUTO_1809 ) ) ( CLEAR ?AUTO_1810 ) ( not ( = ?AUTO_1807 ?AUTO_1808 ) ) ( not ( = ?AUTO_1807 ?AUTO_1810 ) ) ( not ( = ?AUTO_1809 ?AUTO_1808 ) ) ( not ( = ?AUTO_1809 ?AUTO_1810 ) ) ( not ( = ?AUTO_1808 ?AUTO_1810 ) ) ( ON ?AUTO_1808 ?AUTO_1807 ) ( not ( = ?AUTO_1807 ?AUTO_1811 ) ) ( not ( = ?AUTO_1809 ?AUTO_1811 ) ) ( not ( = ?AUTO_1810 ?AUTO_1811 ) ) ( not ( = ?AUTO_1808 ?AUTO_1811 ) ) ( ON ?AUTO_1811 ?AUTO_1808 ) ( CLEAR ?AUTO_1811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1811 ?AUTO_1808 )
      ( MAKE-ON-TABLE ?AUTO_1807 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1807 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1814 - BLOCK
      ?AUTO_1815 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1814 ) ( CLEAR ?AUTO_1815 ) ( not ( = ?AUTO_1814 ?AUTO_1815 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1814 ?AUTO_1815 )
      ( MAKE-ON-VERIFY ?AUTO_1814 ?AUTO_1815 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1816 - BLOCK
      ?AUTO_1817 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1817 ) ( not ( = ?AUTO_1816 ?AUTO_1817 ) ) ( ON-TABLE ?AUTO_1816 ) ( CLEAR ?AUTO_1816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1816 )
      ( MAKE-ON ?AUTO_1816 ?AUTO_1817 )
      ( MAKE-ON-VERIFY ?AUTO_1816 ?AUTO_1817 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1818 - BLOCK
      ?AUTO_1819 - BLOCK
    )
    :vars
    (
      ?AUTO_1820 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1819 ) ( not ( = ?AUTO_1818 ?AUTO_1819 ) ) ( ON-TABLE ?AUTO_1818 ) ( CLEAR ?AUTO_1818 ) ( HOLDING ?AUTO_1820 ) ( not ( = ?AUTO_1818 ?AUTO_1820 ) ) ( not ( = ?AUTO_1819 ?AUTO_1820 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1820 )
      ( MAKE-ON ?AUTO_1818 ?AUTO_1819 )
      ( MAKE-ON-VERIFY ?AUTO_1818 ?AUTO_1819 ) )
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
    )
    :precondition
    ( and ( CLEAR ?AUTO_1822 ) ( not ( = ?AUTO_1821 ?AUTO_1822 ) ) ( ON-TABLE ?AUTO_1821 ) ( not ( = ?AUTO_1821 ?AUTO_1823 ) ) ( not ( = ?AUTO_1822 ?AUTO_1823 ) ) ( ON ?AUTO_1823 ?AUTO_1821 ) ( CLEAR ?AUTO_1823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1823 ?AUTO_1821 )
      ( MAKE-ON ?AUTO_1821 ?AUTO_1822 )
      ( MAKE-ON-VERIFY ?AUTO_1821 ?AUTO_1822 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1824 - BLOCK
      ?AUTO_1825 - BLOCK
    )
    :vars
    (
      ?AUTO_1826 - BLOCK
      ?AUTO_1827 - BLOCK
      ?AUTO_1828 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1825 ) ( not ( = ?AUTO_1824 ?AUTO_1825 ) ) ( ON-TABLE ?AUTO_1824 ) ( not ( = ?AUTO_1824 ?AUTO_1826 ) ) ( not ( = ?AUTO_1825 ?AUTO_1826 ) ) ( ON ?AUTO_1826 ?AUTO_1824 ) ( CLEAR ?AUTO_1826 ) ( HOLDING ?AUTO_1827 ) ( CLEAR ?AUTO_1828 ) ( not ( = ?AUTO_1824 ?AUTO_1827 ) ) ( not ( = ?AUTO_1824 ?AUTO_1828 ) ) ( not ( = ?AUTO_1825 ?AUTO_1827 ) ) ( not ( = ?AUTO_1825 ?AUTO_1828 ) ) ( not ( = ?AUTO_1826 ?AUTO_1827 ) ) ( not ( = ?AUTO_1826 ?AUTO_1828 ) ) ( not ( = ?AUTO_1827 ?AUTO_1828 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1827 ?AUTO_1828 )
      ( MAKE-ON ?AUTO_1824 ?AUTO_1825 )
      ( MAKE-ON-VERIFY ?AUTO_1824 ?AUTO_1825 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1831 - BLOCK
      ?AUTO_1832 - BLOCK
    )
    :vars
    (
      ?AUTO_1833 - BLOCK
      ?AUTO_1834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1831 ?AUTO_1832 ) ) ( ON-TABLE ?AUTO_1831 ) ( not ( = ?AUTO_1831 ?AUTO_1833 ) ) ( not ( = ?AUTO_1832 ?AUTO_1833 ) ) ( ON ?AUTO_1833 ?AUTO_1831 ) ( CLEAR ?AUTO_1833 ) ( HOLDING ?AUTO_1832 ) ( CLEAR ?AUTO_1834 ) ( not ( = ?AUTO_1831 ?AUTO_1834 ) ) ( not ( = ?AUTO_1832 ?AUTO_1834 ) ) ( not ( = ?AUTO_1833 ?AUTO_1834 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1832 ?AUTO_1834 )
      ( MAKE-ON ?AUTO_1831 ?AUTO_1832 )
      ( MAKE-ON-VERIFY ?AUTO_1831 ?AUTO_1832 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1849 - BLOCK
      ?AUTO_1850 - BLOCK
    )
    :vars
    (
      ?AUTO_1854 - BLOCK
      ?AUTO_1853 - BLOCK
      ?AUTO_1852 - BLOCK
      ?AUTO_1851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1849 ?AUTO_1850 ) ) ( CLEAR ?AUTO_1854 ) ( not ( = ?AUTO_1849 ?AUTO_1853 ) ) ( not ( = ?AUTO_1849 ?AUTO_1854 ) ) ( not ( = ?AUTO_1850 ?AUTO_1853 ) ) ( not ( = ?AUTO_1850 ?AUTO_1854 ) ) ( not ( = ?AUTO_1853 ?AUTO_1854 ) ) ( ON ?AUTO_1853 ?AUTO_1850 ) ( CLEAR ?AUTO_1852 ) ( not ( = ?AUTO_1849 ?AUTO_1851 ) ) ( not ( = ?AUTO_1849 ?AUTO_1852 ) ) ( not ( = ?AUTO_1850 ?AUTO_1851 ) ) ( not ( = ?AUTO_1850 ?AUTO_1852 ) ) ( not ( = ?AUTO_1854 ?AUTO_1851 ) ) ( not ( = ?AUTO_1854 ?AUTO_1852 ) ) ( not ( = ?AUTO_1853 ?AUTO_1851 ) ) ( not ( = ?AUTO_1853 ?AUTO_1852 ) ) ( not ( = ?AUTO_1851 ?AUTO_1852 ) ) ( ON ?AUTO_1851 ?AUTO_1853 ) ( CLEAR ?AUTO_1851 ) ( HOLDING ?AUTO_1849 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1849 )
      ( MAKE-ON ?AUTO_1849 ?AUTO_1850 )
      ( MAKE-ON-VERIFY ?AUTO_1849 ?AUTO_1850 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1855 - BLOCK
      ?AUTO_1856 - BLOCK
    )
    :vars
    (
      ?AUTO_1857 - BLOCK
      ?AUTO_1860 - BLOCK
      ?AUTO_1859 - BLOCK
      ?AUTO_1858 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1855 ?AUTO_1856 ) ) ( not ( = ?AUTO_1855 ?AUTO_1857 ) ) ( not ( = ?AUTO_1855 ?AUTO_1860 ) ) ( not ( = ?AUTO_1856 ?AUTO_1857 ) ) ( not ( = ?AUTO_1856 ?AUTO_1860 ) ) ( not ( = ?AUTO_1857 ?AUTO_1860 ) ) ( ON ?AUTO_1857 ?AUTO_1856 ) ( CLEAR ?AUTO_1859 ) ( not ( = ?AUTO_1855 ?AUTO_1858 ) ) ( not ( = ?AUTO_1855 ?AUTO_1859 ) ) ( not ( = ?AUTO_1856 ?AUTO_1858 ) ) ( not ( = ?AUTO_1856 ?AUTO_1859 ) ) ( not ( = ?AUTO_1860 ?AUTO_1858 ) ) ( not ( = ?AUTO_1860 ?AUTO_1859 ) ) ( not ( = ?AUTO_1857 ?AUTO_1858 ) ) ( not ( = ?AUTO_1857 ?AUTO_1859 ) ) ( not ( = ?AUTO_1858 ?AUTO_1859 ) ) ( ON ?AUTO_1858 ?AUTO_1857 ) ( CLEAR ?AUTO_1858 ) ( ON ?AUTO_1855 ?AUTO_1860 ) ( CLEAR ?AUTO_1855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1855 ?AUTO_1860 )
      ( MAKE-ON ?AUTO_1855 ?AUTO_1856 )
      ( MAKE-ON-VERIFY ?AUTO_1855 ?AUTO_1856 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1861 - BLOCK
      ?AUTO_1862 - BLOCK
    )
    :vars
    (
      ?AUTO_1864 - BLOCK
      ?AUTO_1866 - BLOCK
      ?AUTO_1863 - BLOCK
      ?AUTO_1865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1861 ?AUTO_1862 ) ) ( not ( = ?AUTO_1861 ?AUTO_1864 ) ) ( not ( = ?AUTO_1861 ?AUTO_1866 ) ) ( not ( = ?AUTO_1862 ?AUTO_1864 ) ) ( not ( = ?AUTO_1862 ?AUTO_1866 ) ) ( not ( = ?AUTO_1864 ?AUTO_1866 ) ) ( ON ?AUTO_1864 ?AUTO_1862 ) ( not ( = ?AUTO_1861 ?AUTO_1863 ) ) ( not ( = ?AUTO_1861 ?AUTO_1865 ) ) ( not ( = ?AUTO_1862 ?AUTO_1863 ) ) ( not ( = ?AUTO_1862 ?AUTO_1865 ) ) ( not ( = ?AUTO_1866 ?AUTO_1863 ) ) ( not ( = ?AUTO_1866 ?AUTO_1865 ) ) ( not ( = ?AUTO_1864 ?AUTO_1863 ) ) ( not ( = ?AUTO_1864 ?AUTO_1865 ) ) ( not ( = ?AUTO_1863 ?AUTO_1865 ) ) ( ON ?AUTO_1863 ?AUTO_1864 ) ( CLEAR ?AUTO_1863 ) ( ON ?AUTO_1861 ?AUTO_1866 ) ( CLEAR ?AUTO_1861 ) ( HOLDING ?AUTO_1865 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1865 )
      ( MAKE-ON ?AUTO_1861 ?AUTO_1862 )
      ( MAKE-ON-VERIFY ?AUTO_1861 ?AUTO_1862 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1867 - BLOCK
      ?AUTO_1868 - BLOCK
    )
    :vars
    (
      ?AUTO_1871 - BLOCK
      ?AUTO_1869 - BLOCK
      ?AUTO_1870 - BLOCK
      ?AUTO_1872 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1867 ?AUTO_1868 ) ) ( not ( = ?AUTO_1867 ?AUTO_1871 ) ) ( not ( = ?AUTO_1867 ?AUTO_1869 ) ) ( not ( = ?AUTO_1868 ?AUTO_1871 ) ) ( not ( = ?AUTO_1868 ?AUTO_1869 ) ) ( not ( = ?AUTO_1871 ?AUTO_1869 ) ) ( ON ?AUTO_1871 ?AUTO_1868 ) ( not ( = ?AUTO_1867 ?AUTO_1870 ) ) ( not ( = ?AUTO_1867 ?AUTO_1872 ) ) ( not ( = ?AUTO_1868 ?AUTO_1870 ) ) ( not ( = ?AUTO_1868 ?AUTO_1872 ) ) ( not ( = ?AUTO_1869 ?AUTO_1870 ) ) ( not ( = ?AUTO_1869 ?AUTO_1872 ) ) ( not ( = ?AUTO_1871 ?AUTO_1870 ) ) ( not ( = ?AUTO_1871 ?AUTO_1872 ) ) ( not ( = ?AUTO_1870 ?AUTO_1872 ) ) ( ON ?AUTO_1870 ?AUTO_1871 ) ( ON ?AUTO_1867 ?AUTO_1869 ) ( CLEAR ?AUTO_1867 ) ( ON ?AUTO_1872 ?AUTO_1870 ) ( CLEAR ?AUTO_1872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1872 ?AUTO_1870 )
      ( MAKE-ON ?AUTO_1867 ?AUTO_1868 )
      ( MAKE-ON-VERIFY ?AUTO_1867 ?AUTO_1868 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1875 - BLOCK
      ?AUTO_1876 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1875 ) ( CLEAR ?AUTO_1876 ) ( not ( = ?AUTO_1875 ?AUTO_1876 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1875 ?AUTO_1876 )
      ( MAKE-ON-VERIFY ?AUTO_1875 ?AUTO_1876 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1877 - BLOCK
      ?AUTO_1878 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1878 ) ( not ( = ?AUTO_1877 ?AUTO_1878 ) ) ( ON-TABLE ?AUTO_1877 ) ( CLEAR ?AUTO_1877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1877 )
      ( MAKE-ON ?AUTO_1877 ?AUTO_1878 )
      ( MAKE-ON-VERIFY ?AUTO_1877 ?AUTO_1878 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1879 - BLOCK
      ?AUTO_1880 - BLOCK
    )
    :vars
    (
      ?AUTO_1881 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1879 ?AUTO_1880 ) ) ( ON-TABLE ?AUTO_1879 ) ( CLEAR ?AUTO_1879 ) ( HOLDING ?AUTO_1880 ) ( CLEAR ?AUTO_1881 ) ( not ( = ?AUTO_1879 ?AUTO_1881 ) ) ( not ( = ?AUTO_1880 ?AUTO_1881 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1880 ?AUTO_1881 )
      ( MAKE-ON ?AUTO_1879 ?AUTO_1880 )
      ( MAKE-ON-VERIFY ?AUTO_1879 ?AUTO_1880 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1930 - BLOCK
      ?AUTO_1931 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1930 ) ( CLEAR ?AUTO_1931 ) ( not ( = ?AUTO_1930 ?AUTO_1931 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1930 ?AUTO_1931 )
      ( MAKE-ON-VERIFY ?AUTO_1930 ?AUTO_1931 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1932 - BLOCK
      ?AUTO_1933 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1933 ) ( not ( = ?AUTO_1932 ?AUTO_1933 ) ) ( ON-TABLE ?AUTO_1932 ) ( CLEAR ?AUTO_1932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1932 )
      ( MAKE-ON ?AUTO_1932 ?AUTO_1933 )
      ( MAKE-ON-VERIFY ?AUTO_1932 ?AUTO_1933 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1934 - BLOCK
      ?AUTO_1935 - BLOCK
    )
    :vars
    (
      ?AUTO_1936 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1934 ?AUTO_1935 ) ) ( ON-TABLE ?AUTO_1934 ) ( CLEAR ?AUTO_1934 ) ( HOLDING ?AUTO_1935 ) ( CLEAR ?AUTO_1936 ) ( not ( = ?AUTO_1934 ?AUTO_1936 ) ) ( not ( = ?AUTO_1935 ?AUTO_1936 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1935 ?AUTO_1936 )
      ( MAKE-ON ?AUTO_1934 ?AUTO_1935 )
      ( MAKE-ON-VERIFY ?AUTO_1934 ?AUTO_1935 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1939 - BLOCK
      ?AUTO_1940 - BLOCK
    )
    :vars
    (
      ?AUTO_1941 - BLOCK
      ?AUTO_1942 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1940 ) ( not ( = ?AUTO_1939 ?AUTO_1940 ) ) ( ON-TABLE ?AUTO_1939 ) ( CLEAR ?AUTO_1939 ) ( HOLDING ?AUTO_1941 ) ( CLEAR ?AUTO_1942 ) ( not ( = ?AUTO_1939 ?AUTO_1941 ) ) ( not ( = ?AUTO_1939 ?AUTO_1942 ) ) ( not ( = ?AUTO_1940 ?AUTO_1941 ) ) ( not ( = ?AUTO_1940 ?AUTO_1942 ) ) ( not ( = ?AUTO_1941 ?AUTO_1942 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1941 ?AUTO_1942 )
      ( MAKE-ON ?AUTO_1939 ?AUTO_1940 )
      ( MAKE-ON-VERIFY ?AUTO_1939 ?AUTO_1940 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1945 - BLOCK
      ?AUTO_1946 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1945 ) ( CLEAR ?AUTO_1946 ) ( not ( = ?AUTO_1945 ?AUTO_1946 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1945 ?AUTO_1946 )
      ( MAKE-ON-VERIFY ?AUTO_1945 ?AUTO_1946 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1947 - BLOCK
      ?AUTO_1948 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1948 ) ( not ( = ?AUTO_1947 ?AUTO_1948 ) ) ( ON-TABLE ?AUTO_1947 ) ( CLEAR ?AUTO_1947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1947 )
      ( MAKE-ON ?AUTO_1947 ?AUTO_1948 )
      ( MAKE-ON-VERIFY ?AUTO_1947 ?AUTO_1948 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1950 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1950 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1950 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1950 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1951 - BLOCK
    )
    :vars
    (
      ?AUTO_1952 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1951 ?AUTO_1952 ) ( CLEAR ?AUTO_1951 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1951 ?AUTO_1952 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1951 ?AUTO_1952 )
      ( MAKE-ON-TABLE ?AUTO_1951 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1951 ) )
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
    )
    :precondition
    ( and ( ON ?AUTO_1953 ?AUTO_1954 ) ( CLEAR ?AUTO_1953 ) ( not ( = ?AUTO_1953 ?AUTO_1954 ) ) ( HOLDING ?AUTO_1955 ) ( CLEAR ?AUTO_1956 ) ( not ( = ?AUTO_1953 ?AUTO_1955 ) ) ( not ( = ?AUTO_1953 ?AUTO_1956 ) ) ( not ( = ?AUTO_1954 ?AUTO_1955 ) ) ( not ( = ?AUTO_1954 ?AUTO_1956 ) ) ( not ( = ?AUTO_1955 ?AUTO_1956 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1955 ?AUTO_1956 )
      ( MAKE-ON-TABLE ?AUTO_1953 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1953 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1959 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1959 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1959 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1959 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1960 - BLOCK
    )
    :vars
    (
      ?AUTO_1961 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1960 ?AUTO_1961 ) ( CLEAR ?AUTO_1960 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1960 ?AUTO_1961 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1960 ?AUTO_1961 )
      ( MAKE-ON-TABLE ?AUTO_1960 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1960 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1962 - BLOCK
    )
    :vars
    (
      ?AUTO_1963 - BLOCK
      ?AUTO_1964 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1962 ?AUTO_1963 ) ( CLEAR ?AUTO_1962 ) ( not ( = ?AUTO_1962 ?AUTO_1963 ) ) ( HOLDING ?AUTO_1964 ) ( not ( = ?AUTO_1962 ?AUTO_1964 ) ) ( not ( = ?AUTO_1963 ?AUTO_1964 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1964 )
      ( MAKE-ON-TABLE ?AUTO_1962 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1962 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1965 - BLOCK
    )
    :vars
    (
      ?AUTO_1966 - BLOCK
      ?AUTO_1967 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1965 ?AUTO_1966 ) ( not ( = ?AUTO_1965 ?AUTO_1966 ) ) ( not ( = ?AUTO_1965 ?AUTO_1967 ) ) ( not ( = ?AUTO_1966 ?AUTO_1967 ) ) ( ON ?AUTO_1967 ?AUTO_1965 ) ( CLEAR ?AUTO_1967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1967 ?AUTO_1965 )
      ( MAKE-ON-TABLE ?AUTO_1965 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1965 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1968 - BLOCK
    )
    :vars
    (
      ?AUTO_1970 - BLOCK
      ?AUTO_1969 - BLOCK
      ?AUTO_1971 - BLOCK
      ?AUTO_1972 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1968 ?AUTO_1970 ) ( not ( = ?AUTO_1968 ?AUTO_1970 ) ) ( not ( = ?AUTO_1968 ?AUTO_1969 ) ) ( not ( = ?AUTO_1970 ?AUTO_1969 ) ) ( ON ?AUTO_1969 ?AUTO_1968 ) ( CLEAR ?AUTO_1969 ) ( HOLDING ?AUTO_1971 ) ( CLEAR ?AUTO_1972 ) ( not ( = ?AUTO_1968 ?AUTO_1971 ) ) ( not ( = ?AUTO_1968 ?AUTO_1972 ) ) ( not ( = ?AUTO_1970 ?AUTO_1971 ) ) ( not ( = ?AUTO_1970 ?AUTO_1972 ) ) ( not ( = ?AUTO_1969 ?AUTO_1971 ) ) ( not ( = ?AUTO_1969 ?AUTO_1972 ) ) ( not ( = ?AUTO_1971 ?AUTO_1972 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1971 ?AUTO_1972 )
      ( MAKE-ON-TABLE ?AUTO_1968 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1968 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1975 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1975 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1975 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1975 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1976 - BLOCK
    )
    :vars
    (
      ?AUTO_1977 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1976 ?AUTO_1977 ) ( CLEAR ?AUTO_1976 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1976 ?AUTO_1977 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1976 ?AUTO_1977 )
      ( MAKE-ON-TABLE ?AUTO_1976 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1976 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1978 - BLOCK
    )
    :vars
    (
      ?AUTO_1979 - BLOCK
      ?AUTO_1980 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1978 ?AUTO_1979 ) ( CLEAR ?AUTO_1978 ) ( not ( = ?AUTO_1978 ?AUTO_1979 ) ) ( HOLDING ?AUTO_1980 ) ( not ( = ?AUTO_1978 ?AUTO_1980 ) ) ( not ( = ?AUTO_1979 ?AUTO_1980 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1980 )
      ( MAKE-ON-TABLE ?AUTO_1978 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1978 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1981 - BLOCK
    )
    :vars
    (
      ?AUTO_1982 - BLOCK
      ?AUTO_1983 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1981 ?AUTO_1982 ) ( not ( = ?AUTO_1981 ?AUTO_1982 ) ) ( not ( = ?AUTO_1981 ?AUTO_1983 ) ) ( not ( = ?AUTO_1982 ?AUTO_1983 ) ) ( ON ?AUTO_1983 ?AUTO_1981 ) ( CLEAR ?AUTO_1983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1983 ?AUTO_1981 )
      ( MAKE-ON-TABLE ?AUTO_1981 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1981 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1984 - BLOCK
    )
    :vars
    (
      ?AUTO_1985 - BLOCK
      ?AUTO_1986 - BLOCK
      ?AUTO_1987 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1984 ?AUTO_1985 ) ( not ( = ?AUTO_1984 ?AUTO_1985 ) ) ( not ( = ?AUTO_1984 ?AUTO_1986 ) ) ( not ( = ?AUTO_1985 ?AUTO_1986 ) ) ( ON ?AUTO_1986 ?AUTO_1984 ) ( CLEAR ?AUTO_1986 ) ( HOLDING ?AUTO_1987 ) ( not ( = ?AUTO_1984 ?AUTO_1987 ) ) ( not ( = ?AUTO_1985 ?AUTO_1987 ) ) ( not ( = ?AUTO_1986 ?AUTO_1987 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1987 )
      ( MAKE-ON-TABLE ?AUTO_1984 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1984 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1988 - BLOCK
    )
    :vars
    (
      ?AUTO_1989 - BLOCK
      ?AUTO_1990 - BLOCK
      ?AUTO_1991 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1988 ?AUTO_1989 ) ( not ( = ?AUTO_1988 ?AUTO_1989 ) ) ( not ( = ?AUTO_1988 ?AUTO_1990 ) ) ( not ( = ?AUTO_1989 ?AUTO_1990 ) ) ( ON ?AUTO_1990 ?AUTO_1988 ) ( not ( = ?AUTO_1988 ?AUTO_1991 ) ) ( not ( = ?AUTO_1989 ?AUTO_1991 ) ) ( not ( = ?AUTO_1990 ?AUTO_1991 ) ) ( ON ?AUTO_1991 ?AUTO_1990 ) ( CLEAR ?AUTO_1991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1991 ?AUTO_1990 )
      ( MAKE-ON-TABLE ?AUTO_1988 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1988 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1992 - BLOCK
    )
    :vars
    (
      ?AUTO_1995 - BLOCK
      ?AUTO_1993 - BLOCK
      ?AUTO_1994 - BLOCK
      ?AUTO_1996 - BLOCK
      ?AUTO_1997 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1992 ?AUTO_1995 ) ( not ( = ?AUTO_1992 ?AUTO_1995 ) ) ( not ( = ?AUTO_1992 ?AUTO_1993 ) ) ( not ( = ?AUTO_1995 ?AUTO_1993 ) ) ( ON ?AUTO_1993 ?AUTO_1992 ) ( not ( = ?AUTO_1992 ?AUTO_1994 ) ) ( not ( = ?AUTO_1995 ?AUTO_1994 ) ) ( not ( = ?AUTO_1993 ?AUTO_1994 ) ) ( ON ?AUTO_1994 ?AUTO_1993 ) ( CLEAR ?AUTO_1994 ) ( HOLDING ?AUTO_1996 ) ( CLEAR ?AUTO_1997 ) ( not ( = ?AUTO_1992 ?AUTO_1996 ) ) ( not ( = ?AUTO_1992 ?AUTO_1997 ) ) ( not ( = ?AUTO_1995 ?AUTO_1996 ) ) ( not ( = ?AUTO_1995 ?AUTO_1997 ) ) ( not ( = ?AUTO_1993 ?AUTO_1996 ) ) ( not ( = ?AUTO_1993 ?AUTO_1997 ) ) ( not ( = ?AUTO_1994 ?AUTO_1996 ) ) ( not ( = ?AUTO_1994 ?AUTO_1997 ) ) ( not ( = ?AUTO_1996 ?AUTO_1997 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1996 ?AUTO_1997 )
      ( MAKE-ON-TABLE ?AUTO_1992 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1992 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2001 - BLOCK
      ?AUTO_2002 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2001 ) ( CLEAR ?AUTO_2002 ) ( not ( = ?AUTO_2001 ?AUTO_2002 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2001 ?AUTO_2002 )
      ( MAKE-ON-VERIFY ?AUTO_2001 ?AUTO_2002 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2003 - BLOCK
      ?AUTO_2004 - BLOCK
    )
    :vars
    (
      ?AUTO_2005 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2004 ) ( not ( = ?AUTO_2003 ?AUTO_2004 ) ) ( ON ?AUTO_2003 ?AUTO_2005 ) ( CLEAR ?AUTO_2003 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2003 ?AUTO_2005 ) ) ( not ( = ?AUTO_2004 ?AUTO_2005 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2003 ?AUTO_2005 )
      ( MAKE-ON ?AUTO_2003 ?AUTO_2004 )
      ( MAKE-ON-VERIFY ?AUTO_2003 ?AUTO_2004 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2006 - BLOCK
      ?AUTO_2007 - BLOCK
    )
    :vars
    (
      ?AUTO_2008 - BLOCK
      ?AUTO_2009 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2007 ) ( not ( = ?AUTO_2006 ?AUTO_2007 ) ) ( ON ?AUTO_2006 ?AUTO_2008 ) ( CLEAR ?AUTO_2006 ) ( not ( = ?AUTO_2006 ?AUTO_2008 ) ) ( not ( = ?AUTO_2007 ?AUTO_2008 ) ) ( HOLDING ?AUTO_2009 ) ( not ( = ?AUTO_2006 ?AUTO_2009 ) ) ( not ( = ?AUTO_2007 ?AUTO_2009 ) ) ( not ( = ?AUTO_2008 ?AUTO_2009 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2009 )
      ( MAKE-ON ?AUTO_2006 ?AUTO_2007 )
      ( MAKE-ON-VERIFY ?AUTO_2006 ?AUTO_2007 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2010 - BLOCK
      ?AUTO_2011 - BLOCK
    )
    :vars
    (
      ?AUTO_2012 - BLOCK
      ?AUTO_2013 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2011 ) ( not ( = ?AUTO_2010 ?AUTO_2011 ) ) ( ON ?AUTO_2010 ?AUTO_2012 ) ( not ( = ?AUTO_2010 ?AUTO_2012 ) ) ( not ( = ?AUTO_2011 ?AUTO_2012 ) ) ( not ( = ?AUTO_2010 ?AUTO_2013 ) ) ( not ( = ?AUTO_2011 ?AUTO_2013 ) ) ( not ( = ?AUTO_2012 ?AUTO_2013 ) ) ( ON ?AUTO_2013 ?AUTO_2010 ) ( CLEAR ?AUTO_2013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2013 ?AUTO_2010 )
      ( MAKE-ON ?AUTO_2010 ?AUTO_2011 )
      ( MAKE-ON-VERIFY ?AUTO_2010 ?AUTO_2011 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2014 - BLOCK
      ?AUTO_2015 - BLOCK
    )
    :vars
    (
      ?AUTO_2016 - BLOCK
      ?AUTO_2017 - BLOCK
      ?AUTO_2018 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2015 ) ( not ( = ?AUTO_2014 ?AUTO_2015 ) ) ( ON ?AUTO_2014 ?AUTO_2016 ) ( not ( = ?AUTO_2014 ?AUTO_2016 ) ) ( not ( = ?AUTO_2015 ?AUTO_2016 ) ) ( not ( = ?AUTO_2014 ?AUTO_2017 ) ) ( not ( = ?AUTO_2015 ?AUTO_2017 ) ) ( not ( = ?AUTO_2016 ?AUTO_2017 ) ) ( ON ?AUTO_2017 ?AUTO_2014 ) ( CLEAR ?AUTO_2017 ) ( HOLDING ?AUTO_2018 ) ( not ( = ?AUTO_2014 ?AUTO_2018 ) ) ( not ( = ?AUTO_2015 ?AUTO_2018 ) ) ( not ( = ?AUTO_2016 ?AUTO_2018 ) ) ( not ( = ?AUTO_2017 ?AUTO_2018 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2018 )
      ( MAKE-ON ?AUTO_2014 ?AUTO_2015 )
      ( MAKE-ON-VERIFY ?AUTO_2014 ?AUTO_2015 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2019 - BLOCK
      ?AUTO_2020 - BLOCK
    )
    :vars
    (
      ?AUTO_2021 - BLOCK
      ?AUTO_2022 - BLOCK
      ?AUTO_2023 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2020 ) ( not ( = ?AUTO_2019 ?AUTO_2020 ) ) ( ON ?AUTO_2019 ?AUTO_2021 ) ( not ( = ?AUTO_2019 ?AUTO_2021 ) ) ( not ( = ?AUTO_2020 ?AUTO_2021 ) ) ( not ( = ?AUTO_2019 ?AUTO_2022 ) ) ( not ( = ?AUTO_2020 ?AUTO_2022 ) ) ( not ( = ?AUTO_2021 ?AUTO_2022 ) ) ( ON ?AUTO_2022 ?AUTO_2019 ) ( not ( = ?AUTO_2019 ?AUTO_2023 ) ) ( not ( = ?AUTO_2020 ?AUTO_2023 ) ) ( not ( = ?AUTO_2021 ?AUTO_2023 ) ) ( not ( = ?AUTO_2022 ?AUTO_2023 ) ) ( ON ?AUTO_2023 ?AUTO_2022 ) ( CLEAR ?AUTO_2023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2023 ?AUTO_2022 )
      ( MAKE-ON ?AUTO_2019 ?AUTO_2020 )
      ( MAKE-ON-VERIFY ?AUTO_2019 ?AUTO_2020 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2024 - BLOCK
      ?AUTO_2025 - BLOCK
    )
    :vars
    (
      ?AUTO_2026 - BLOCK
      ?AUTO_2027 - BLOCK
      ?AUTO_2028 - BLOCK
      ?AUTO_2029 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2025 ) ( not ( = ?AUTO_2024 ?AUTO_2025 ) ) ( ON ?AUTO_2024 ?AUTO_2026 ) ( not ( = ?AUTO_2024 ?AUTO_2026 ) ) ( not ( = ?AUTO_2025 ?AUTO_2026 ) ) ( not ( = ?AUTO_2024 ?AUTO_2027 ) ) ( not ( = ?AUTO_2025 ?AUTO_2027 ) ) ( not ( = ?AUTO_2026 ?AUTO_2027 ) ) ( ON ?AUTO_2027 ?AUTO_2024 ) ( not ( = ?AUTO_2024 ?AUTO_2028 ) ) ( not ( = ?AUTO_2025 ?AUTO_2028 ) ) ( not ( = ?AUTO_2026 ?AUTO_2028 ) ) ( not ( = ?AUTO_2027 ?AUTO_2028 ) ) ( ON ?AUTO_2028 ?AUTO_2027 ) ( CLEAR ?AUTO_2028 ) ( HOLDING ?AUTO_2029 ) ( not ( = ?AUTO_2024 ?AUTO_2029 ) ) ( not ( = ?AUTO_2025 ?AUTO_2029 ) ) ( not ( = ?AUTO_2026 ?AUTO_2029 ) ) ( not ( = ?AUTO_2027 ?AUTO_2029 ) ) ( not ( = ?AUTO_2028 ?AUTO_2029 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2029 )
      ( MAKE-ON ?AUTO_2024 ?AUTO_2025 )
      ( MAKE-ON-VERIFY ?AUTO_2024 ?AUTO_2025 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2030 - BLOCK
      ?AUTO_2031 - BLOCK
    )
    :vars
    (
      ?AUTO_2033 - BLOCK
      ?AUTO_2032 - BLOCK
      ?AUTO_2035 - BLOCK
      ?AUTO_2034 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2031 ) ( not ( = ?AUTO_2030 ?AUTO_2031 ) ) ( ON ?AUTO_2030 ?AUTO_2033 ) ( not ( = ?AUTO_2030 ?AUTO_2033 ) ) ( not ( = ?AUTO_2031 ?AUTO_2033 ) ) ( not ( = ?AUTO_2030 ?AUTO_2032 ) ) ( not ( = ?AUTO_2031 ?AUTO_2032 ) ) ( not ( = ?AUTO_2033 ?AUTO_2032 ) ) ( ON ?AUTO_2032 ?AUTO_2030 ) ( not ( = ?AUTO_2030 ?AUTO_2035 ) ) ( not ( = ?AUTO_2031 ?AUTO_2035 ) ) ( not ( = ?AUTO_2033 ?AUTO_2035 ) ) ( not ( = ?AUTO_2032 ?AUTO_2035 ) ) ( ON ?AUTO_2035 ?AUTO_2032 ) ( not ( = ?AUTO_2030 ?AUTO_2034 ) ) ( not ( = ?AUTO_2031 ?AUTO_2034 ) ) ( not ( = ?AUTO_2033 ?AUTO_2034 ) ) ( not ( = ?AUTO_2032 ?AUTO_2034 ) ) ( not ( = ?AUTO_2035 ?AUTO_2034 ) ) ( ON ?AUTO_2034 ?AUTO_2035 ) ( CLEAR ?AUTO_2034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2034 ?AUTO_2035 )
      ( MAKE-ON ?AUTO_2030 ?AUTO_2031 )
      ( MAKE-ON-VERIFY ?AUTO_2030 ?AUTO_2031 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2036 - BLOCK
      ?AUTO_2037 - BLOCK
    )
    :vars
    (
      ?AUTO_2039 - BLOCK
      ?AUTO_2038 - BLOCK
      ?AUTO_2041 - BLOCK
      ?AUTO_2040 - BLOCK
      ?AUTO_2042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2036 ?AUTO_2037 ) ) ( ON ?AUTO_2036 ?AUTO_2039 ) ( not ( = ?AUTO_2036 ?AUTO_2039 ) ) ( not ( = ?AUTO_2037 ?AUTO_2039 ) ) ( not ( = ?AUTO_2036 ?AUTO_2038 ) ) ( not ( = ?AUTO_2037 ?AUTO_2038 ) ) ( not ( = ?AUTO_2039 ?AUTO_2038 ) ) ( ON ?AUTO_2038 ?AUTO_2036 ) ( not ( = ?AUTO_2036 ?AUTO_2041 ) ) ( not ( = ?AUTO_2037 ?AUTO_2041 ) ) ( not ( = ?AUTO_2039 ?AUTO_2041 ) ) ( not ( = ?AUTO_2038 ?AUTO_2041 ) ) ( ON ?AUTO_2041 ?AUTO_2038 ) ( not ( = ?AUTO_2036 ?AUTO_2040 ) ) ( not ( = ?AUTO_2037 ?AUTO_2040 ) ) ( not ( = ?AUTO_2039 ?AUTO_2040 ) ) ( not ( = ?AUTO_2038 ?AUTO_2040 ) ) ( not ( = ?AUTO_2041 ?AUTO_2040 ) ) ( ON ?AUTO_2040 ?AUTO_2041 ) ( CLEAR ?AUTO_2040 ) ( HOLDING ?AUTO_2037 ) ( CLEAR ?AUTO_2042 ) ( not ( = ?AUTO_2036 ?AUTO_2042 ) ) ( not ( = ?AUTO_2037 ?AUTO_2042 ) ) ( not ( = ?AUTO_2039 ?AUTO_2042 ) ) ( not ( = ?AUTO_2038 ?AUTO_2042 ) ) ( not ( = ?AUTO_2041 ?AUTO_2042 ) ) ( not ( = ?AUTO_2040 ?AUTO_2042 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2037 ?AUTO_2042 )
      ( MAKE-ON ?AUTO_2036 ?AUTO_2037 )
      ( MAKE-ON-VERIFY ?AUTO_2036 ?AUTO_2037 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2047 - BLOCK
      ?AUTO_2048 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2047 ) ( CLEAR ?AUTO_2048 ) ( not ( = ?AUTO_2047 ?AUTO_2048 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2047 ?AUTO_2048 )
      ( MAKE-ON-VERIFY ?AUTO_2047 ?AUTO_2048 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2049 - BLOCK
      ?AUTO_2050 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2050 ) ( not ( = ?AUTO_2049 ?AUTO_2050 ) ) ( ON-TABLE ?AUTO_2049 ) ( CLEAR ?AUTO_2049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2049 )
      ( MAKE-ON ?AUTO_2049 ?AUTO_2050 )
      ( MAKE-ON-VERIFY ?AUTO_2049 ?AUTO_2050 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2051 - BLOCK
      ?AUTO_2052 - BLOCK
    )
    :vars
    (
      ?AUTO_2053 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2051 ?AUTO_2052 ) ) ( ON-TABLE ?AUTO_2051 ) ( CLEAR ?AUTO_2051 ) ( HOLDING ?AUTO_2052 ) ( CLEAR ?AUTO_2053 ) ( not ( = ?AUTO_2051 ?AUTO_2053 ) ) ( not ( = ?AUTO_2052 ?AUTO_2053 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2052 ?AUTO_2053 )
      ( MAKE-ON ?AUTO_2051 ?AUTO_2052 )
      ( MAKE-ON-VERIFY ?AUTO_2051 ?AUTO_2052 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2054 - BLOCK
      ?AUTO_2055 - BLOCK
    )
    :vars
    (
      ?AUTO_2056 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2054 ?AUTO_2055 ) ) ( ON-TABLE ?AUTO_2054 ) ( CLEAR ?AUTO_2056 ) ( not ( = ?AUTO_2054 ?AUTO_2056 ) ) ( not ( = ?AUTO_2055 ?AUTO_2056 ) ) ( ON ?AUTO_2055 ?AUTO_2054 ) ( CLEAR ?AUTO_2055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2055 ?AUTO_2054 )
      ( MAKE-ON ?AUTO_2054 ?AUTO_2055 )
      ( MAKE-ON-VERIFY ?AUTO_2054 ?AUTO_2055 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2057 - BLOCK
      ?AUTO_2058 - BLOCK
    )
    :vars
    (
      ?AUTO_2059 - BLOCK
      ?AUTO_2060 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2057 ?AUTO_2058 ) ) ( ON-TABLE ?AUTO_2057 ) ( CLEAR ?AUTO_2059 ) ( not ( = ?AUTO_2057 ?AUTO_2059 ) ) ( not ( = ?AUTO_2058 ?AUTO_2059 ) ) ( ON ?AUTO_2058 ?AUTO_2057 ) ( CLEAR ?AUTO_2058 ) ( HOLDING ?AUTO_2060 ) ( not ( = ?AUTO_2057 ?AUTO_2060 ) ) ( not ( = ?AUTO_2058 ?AUTO_2060 ) ) ( not ( = ?AUTO_2059 ?AUTO_2060 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2060 )
      ( MAKE-ON ?AUTO_2057 ?AUTO_2058 )
      ( MAKE-ON-VERIFY ?AUTO_2057 ?AUTO_2058 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2061 - BLOCK
      ?AUTO_2062 - BLOCK
    )
    :vars
    (
      ?AUTO_2063 - BLOCK
      ?AUTO_2064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2061 ?AUTO_2062 ) ) ( ON-TABLE ?AUTO_2061 ) ( CLEAR ?AUTO_2063 ) ( not ( = ?AUTO_2061 ?AUTO_2063 ) ) ( not ( = ?AUTO_2062 ?AUTO_2063 ) ) ( ON ?AUTO_2062 ?AUTO_2061 ) ( not ( = ?AUTO_2061 ?AUTO_2064 ) ) ( not ( = ?AUTO_2062 ?AUTO_2064 ) ) ( not ( = ?AUTO_2063 ?AUTO_2064 ) ) ( ON ?AUTO_2064 ?AUTO_2062 ) ( CLEAR ?AUTO_2064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2064 ?AUTO_2062 )
      ( MAKE-ON ?AUTO_2061 ?AUTO_2062 )
      ( MAKE-ON-VERIFY ?AUTO_2061 ?AUTO_2062 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2065 - BLOCK
      ?AUTO_2066 - BLOCK
    )
    :vars
    (
      ?AUTO_2067 - BLOCK
      ?AUTO_2068 - BLOCK
      ?AUTO_2069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2065 ?AUTO_2066 ) ) ( ON-TABLE ?AUTO_2065 ) ( CLEAR ?AUTO_2067 ) ( not ( = ?AUTO_2065 ?AUTO_2067 ) ) ( not ( = ?AUTO_2066 ?AUTO_2067 ) ) ( ON ?AUTO_2066 ?AUTO_2065 ) ( not ( = ?AUTO_2065 ?AUTO_2068 ) ) ( not ( = ?AUTO_2066 ?AUTO_2068 ) ) ( not ( = ?AUTO_2067 ?AUTO_2068 ) ) ( ON ?AUTO_2068 ?AUTO_2066 ) ( CLEAR ?AUTO_2068 ) ( HOLDING ?AUTO_2069 ) ( not ( = ?AUTO_2065 ?AUTO_2069 ) ) ( not ( = ?AUTO_2066 ?AUTO_2069 ) ) ( not ( = ?AUTO_2067 ?AUTO_2069 ) ) ( not ( = ?AUTO_2068 ?AUTO_2069 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2069 )
      ( MAKE-ON ?AUTO_2065 ?AUTO_2066 )
      ( MAKE-ON-VERIFY ?AUTO_2065 ?AUTO_2066 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2070 - BLOCK
      ?AUTO_2071 - BLOCK
    )
    :vars
    (
      ?AUTO_2072 - BLOCK
      ?AUTO_2073 - BLOCK
      ?AUTO_2074 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2070 ?AUTO_2071 ) ) ( ON-TABLE ?AUTO_2070 ) ( CLEAR ?AUTO_2072 ) ( not ( = ?AUTO_2070 ?AUTO_2072 ) ) ( not ( = ?AUTO_2071 ?AUTO_2072 ) ) ( ON ?AUTO_2071 ?AUTO_2070 ) ( not ( = ?AUTO_2070 ?AUTO_2073 ) ) ( not ( = ?AUTO_2071 ?AUTO_2073 ) ) ( not ( = ?AUTO_2072 ?AUTO_2073 ) ) ( ON ?AUTO_2073 ?AUTO_2071 ) ( not ( = ?AUTO_2070 ?AUTO_2074 ) ) ( not ( = ?AUTO_2071 ?AUTO_2074 ) ) ( not ( = ?AUTO_2072 ?AUTO_2074 ) ) ( not ( = ?AUTO_2073 ?AUTO_2074 ) ) ( ON ?AUTO_2074 ?AUTO_2073 ) ( CLEAR ?AUTO_2074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2074 ?AUTO_2073 )
      ( MAKE-ON ?AUTO_2070 ?AUTO_2071 )
      ( MAKE-ON-VERIFY ?AUTO_2070 ?AUTO_2071 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2075 - BLOCK
      ?AUTO_2076 - BLOCK
    )
    :vars
    (
      ?AUTO_2077 - BLOCK
      ?AUTO_2078 - BLOCK
      ?AUTO_2079 - BLOCK
      ?AUTO_2080 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2075 ?AUTO_2076 ) ) ( ON-TABLE ?AUTO_2075 ) ( CLEAR ?AUTO_2077 ) ( not ( = ?AUTO_2075 ?AUTO_2077 ) ) ( not ( = ?AUTO_2076 ?AUTO_2077 ) ) ( ON ?AUTO_2076 ?AUTO_2075 ) ( not ( = ?AUTO_2075 ?AUTO_2078 ) ) ( not ( = ?AUTO_2076 ?AUTO_2078 ) ) ( not ( = ?AUTO_2077 ?AUTO_2078 ) ) ( ON ?AUTO_2078 ?AUTO_2076 ) ( not ( = ?AUTO_2075 ?AUTO_2079 ) ) ( not ( = ?AUTO_2076 ?AUTO_2079 ) ) ( not ( = ?AUTO_2077 ?AUTO_2079 ) ) ( not ( = ?AUTO_2078 ?AUTO_2079 ) ) ( ON ?AUTO_2079 ?AUTO_2078 ) ( CLEAR ?AUTO_2079 ) ( HOLDING ?AUTO_2080 ) ( not ( = ?AUTO_2075 ?AUTO_2080 ) ) ( not ( = ?AUTO_2076 ?AUTO_2080 ) ) ( not ( = ?AUTO_2077 ?AUTO_2080 ) ) ( not ( = ?AUTO_2078 ?AUTO_2080 ) ) ( not ( = ?AUTO_2079 ?AUTO_2080 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2080 )
      ( MAKE-ON ?AUTO_2075 ?AUTO_2076 )
      ( MAKE-ON-VERIFY ?AUTO_2075 ?AUTO_2076 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2081 - BLOCK
      ?AUTO_2082 - BLOCK
    )
    :vars
    (
      ?AUTO_2084 - BLOCK
      ?AUTO_2083 - BLOCK
      ?AUTO_2086 - BLOCK
      ?AUTO_2085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2081 ?AUTO_2082 ) ) ( ON-TABLE ?AUTO_2081 ) ( CLEAR ?AUTO_2084 ) ( not ( = ?AUTO_2081 ?AUTO_2084 ) ) ( not ( = ?AUTO_2082 ?AUTO_2084 ) ) ( ON ?AUTO_2082 ?AUTO_2081 ) ( not ( = ?AUTO_2081 ?AUTO_2083 ) ) ( not ( = ?AUTO_2082 ?AUTO_2083 ) ) ( not ( = ?AUTO_2084 ?AUTO_2083 ) ) ( ON ?AUTO_2083 ?AUTO_2082 ) ( not ( = ?AUTO_2081 ?AUTO_2086 ) ) ( not ( = ?AUTO_2082 ?AUTO_2086 ) ) ( not ( = ?AUTO_2084 ?AUTO_2086 ) ) ( not ( = ?AUTO_2083 ?AUTO_2086 ) ) ( ON ?AUTO_2086 ?AUTO_2083 ) ( not ( = ?AUTO_2081 ?AUTO_2085 ) ) ( not ( = ?AUTO_2082 ?AUTO_2085 ) ) ( not ( = ?AUTO_2084 ?AUTO_2085 ) ) ( not ( = ?AUTO_2083 ?AUTO_2085 ) ) ( not ( = ?AUTO_2086 ?AUTO_2085 ) ) ( ON ?AUTO_2085 ?AUTO_2086 ) ( CLEAR ?AUTO_2085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2085 ?AUTO_2086 )
      ( MAKE-ON ?AUTO_2081 ?AUTO_2082 )
      ( MAKE-ON-VERIFY ?AUTO_2081 ?AUTO_2082 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2087 - BLOCK
      ?AUTO_2088 - BLOCK
    )
    :vars
    (
      ?AUTO_2091 - BLOCK
      ?AUTO_2089 - BLOCK
      ?AUTO_2090 - BLOCK
      ?AUTO_2092 - BLOCK
      ?AUTO_2093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2087 ?AUTO_2088 ) ) ( ON-TABLE ?AUTO_2087 ) ( not ( = ?AUTO_2087 ?AUTO_2091 ) ) ( not ( = ?AUTO_2088 ?AUTO_2091 ) ) ( ON ?AUTO_2088 ?AUTO_2087 ) ( not ( = ?AUTO_2087 ?AUTO_2089 ) ) ( not ( = ?AUTO_2088 ?AUTO_2089 ) ) ( not ( = ?AUTO_2091 ?AUTO_2089 ) ) ( ON ?AUTO_2089 ?AUTO_2088 ) ( not ( = ?AUTO_2087 ?AUTO_2090 ) ) ( not ( = ?AUTO_2088 ?AUTO_2090 ) ) ( not ( = ?AUTO_2091 ?AUTO_2090 ) ) ( not ( = ?AUTO_2089 ?AUTO_2090 ) ) ( ON ?AUTO_2090 ?AUTO_2089 ) ( not ( = ?AUTO_2087 ?AUTO_2092 ) ) ( not ( = ?AUTO_2088 ?AUTO_2092 ) ) ( not ( = ?AUTO_2091 ?AUTO_2092 ) ) ( not ( = ?AUTO_2089 ?AUTO_2092 ) ) ( not ( = ?AUTO_2090 ?AUTO_2092 ) ) ( ON ?AUTO_2092 ?AUTO_2090 ) ( CLEAR ?AUTO_2092 ) ( HOLDING ?AUTO_2091 ) ( CLEAR ?AUTO_2093 ) ( not ( = ?AUTO_2087 ?AUTO_2093 ) ) ( not ( = ?AUTO_2088 ?AUTO_2093 ) ) ( not ( = ?AUTO_2091 ?AUTO_2093 ) ) ( not ( = ?AUTO_2089 ?AUTO_2093 ) ) ( not ( = ?AUTO_2090 ?AUTO_2093 ) ) ( not ( = ?AUTO_2092 ?AUTO_2093 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2091 ?AUTO_2093 )
      ( MAKE-ON ?AUTO_2087 ?AUTO_2088 )
      ( MAKE-ON-VERIFY ?AUTO_2087 ?AUTO_2088 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2098 - BLOCK
      ?AUTO_2099 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2098 ) ( CLEAR ?AUTO_2099 ) ( not ( = ?AUTO_2098 ?AUTO_2099 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2098 ?AUTO_2099 )
      ( MAKE-ON-VERIFY ?AUTO_2098 ?AUTO_2099 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2100 - BLOCK
      ?AUTO_2101 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2101 ) ( not ( = ?AUTO_2100 ?AUTO_2101 ) ) ( ON-TABLE ?AUTO_2100 ) ( CLEAR ?AUTO_2100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2100 )
      ( MAKE-ON ?AUTO_2100 ?AUTO_2101 )
      ( MAKE-ON-VERIFY ?AUTO_2100 ?AUTO_2101 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2102 - BLOCK
      ?AUTO_2103 - BLOCK
    )
    :vars
    (
      ?AUTO_2104 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2102 ?AUTO_2103 ) ) ( ON-TABLE ?AUTO_2102 ) ( CLEAR ?AUTO_2102 ) ( HOLDING ?AUTO_2103 ) ( CLEAR ?AUTO_2104 ) ( not ( = ?AUTO_2102 ?AUTO_2104 ) ) ( not ( = ?AUTO_2103 ?AUTO_2104 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2103 ?AUTO_2104 )
      ( MAKE-ON ?AUTO_2102 ?AUTO_2103 )
      ( MAKE-ON-VERIFY ?AUTO_2102 ?AUTO_2103 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2107 - BLOCK
      ?AUTO_2108 - BLOCK
    )
    :vars
    (
      ?AUTO_2109 - BLOCK
      ?AUTO_2110 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2108 ) ( not ( = ?AUTO_2107 ?AUTO_2108 ) ) ( ON-TABLE ?AUTO_2107 ) ( CLEAR ?AUTO_2107 ) ( HOLDING ?AUTO_2109 ) ( CLEAR ?AUTO_2110 ) ( not ( = ?AUTO_2107 ?AUTO_2109 ) ) ( not ( = ?AUTO_2107 ?AUTO_2110 ) ) ( not ( = ?AUTO_2108 ?AUTO_2109 ) ) ( not ( = ?AUTO_2108 ?AUTO_2110 ) ) ( not ( = ?AUTO_2109 ?AUTO_2110 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2109 ?AUTO_2110 )
      ( MAKE-ON ?AUTO_2107 ?AUTO_2108 )
      ( MAKE-ON-VERIFY ?AUTO_2107 ?AUTO_2108 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2111 - BLOCK
      ?AUTO_2112 - BLOCK
    )
    :vars
    (
      ?AUTO_2113 - BLOCK
      ?AUTO_2114 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2111 ?AUTO_2112 ) ) ( ON-TABLE ?AUTO_2111 ) ( CLEAR ?AUTO_2111 ) ( CLEAR ?AUTO_2113 ) ( not ( = ?AUTO_2111 ?AUTO_2114 ) ) ( not ( = ?AUTO_2111 ?AUTO_2113 ) ) ( not ( = ?AUTO_2112 ?AUTO_2114 ) ) ( not ( = ?AUTO_2112 ?AUTO_2113 ) ) ( not ( = ?AUTO_2114 ?AUTO_2113 ) ) ( ON ?AUTO_2114 ?AUTO_2112 ) ( CLEAR ?AUTO_2114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2114 ?AUTO_2112 )
      ( MAKE-ON ?AUTO_2111 ?AUTO_2112 )
      ( MAKE-ON-VERIFY ?AUTO_2111 ?AUTO_2112 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2115 - BLOCK
      ?AUTO_2116 - BLOCK
    )
    :vars
    (
      ?AUTO_2118 - BLOCK
      ?AUTO_2117 - BLOCK
      ?AUTO_2119 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2115 ?AUTO_2116 ) ) ( ON-TABLE ?AUTO_2115 ) ( CLEAR ?AUTO_2115 ) ( CLEAR ?AUTO_2118 ) ( not ( = ?AUTO_2115 ?AUTO_2117 ) ) ( not ( = ?AUTO_2115 ?AUTO_2118 ) ) ( not ( = ?AUTO_2116 ?AUTO_2117 ) ) ( not ( = ?AUTO_2116 ?AUTO_2118 ) ) ( not ( = ?AUTO_2117 ?AUTO_2118 ) ) ( ON ?AUTO_2117 ?AUTO_2116 ) ( CLEAR ?AUTO_2117 ) ( HOLDING ?AUTO_2119 ) ( not ( = ?AUTO_2115 ?AUTO_2119 ) ) ( not ( = ?AUTO_2116 ?AUTO_2119 ) ) ( not ( = ?AUTO_2118 ?AUTO_2119 ) ) ( not ( = ?AUTO_2117 ?AUTO_2119 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2119 )
      ( MAKE-ON ?AUTO_2115 ?AUTO_2116 )
      ( MAKE-ON-VERIFY ?AUTO_2115 ?AUTO_2116 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2120 - BLOCK
      ?AUTO_2121 - BLOCK
    )
    :vars
    (
      ?AUTO_2124 - BLOCK
      ?AUTO_2123 - BLOCK
      ?AUTO_2122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2120 ?AUTO_2121 ) ) ( ON-TABLE ?AUTO_2120 ) ( CLEAR ?AUTO_2120 ) ( CLEAR ?AUTO_2124 ) ( not ( = ?AUTO_2120 ?AUTO_2123 ) ) ( not ( = ?AUTO_2120 ?AUTO_2124 ) ) ( not ( = ?AUTO_2121 ?AUTO_2123 ) ) ( not ( = ?AUTO_2121 ?AUTO_2124 ) ) ( not ( = ?AUTO_2123 ?AUTO_2124 ) ) ( ON ?AUTO_2123 ?AUTO_2121 ) ( not ( = ?AUTO_2120 ?AUTO_2122 ) ) ( not ( = ?AUTO_2121 ?AUTO_2122 ) ) ( not ( = ?AUTO_2124 ?AUTO_2122 ) ) ( not ( = ?AUTO_2123 ?AUTO_2122 ) ) ( ON ?AUTO_2122 ?AUTO_2123 ) ( CLEAR ?AUTO_2122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2122 ?AUTO_2123 )
      ( MAKE-ON ?AUTO_2120 ?AUTO_2121 )
      ( MAKE-ON-VERIFY ?AUTO_2120 ?AUTO_2121 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2125 - BLOCK
      ?AUTO_2126 - BLOCK
    )
    :vars
    (
      ?AUTO_2129 - BLOCK
      ?AUTO_2128 - BLOCK
      ?AUTO_2127 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2125 ?AUTO_2126 ) ) ( CLEAR ?AUTO_2129 ) ( not ( = ?AUTO_2125 ?AUTO_2128 ) ) ( not ( = ?AUTO_2125 ?AUTO_2129 ) ) ( not ( = ?AUTO_2126 ?AUTO_2128 ) ) ( not ( = ?AUTO_2126 ?AUTO_2129 ) ) ( not ( = ?AUTO_2128 ?AUTO_2129 ) ) ( ON ?AUTO_2128 ?AUTO_2126 ) ( not ( = ?AUTO_2125 ?AUTO_2127 ) ) ( not ( = ?AUTO_2126 ?AUTO_2127 ) ) ( not ( = ?AUTO_2129 ?AUTO_2127 ) ) ( not ( = ?AUTO_2128 ?AUTO_2127 ) ) ( ON ?AUTO_2127 ?AUTO_2128 ) ( CLEAR ?AUTO_2127 ) ( HOLDING ?AUTO_2125 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2125 )
      ( MAKE-ON ?AUTO_2125 ?AUTO_2126 )
      ( MAKE-ON-VERIFY ?AUTO_2125 ?AUTO_2126 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2130 - BLOCK
      ?AUTO_2131 - BLOCK
    )
    :vars
    (
      ?AUTO_2134 - BLOCK
      ?AUTO_2133 - BLOCK
      ?AUTO_2132 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2130 ?AUTO_2131 ) ) ( CLEAR ?AUTO_2134 ) ( not ( = ?AUTO_2130 ?AUTO_2133 ) ) ( not ( = ?AUTO_2130 ?AUTO_2134 ) ) ( not ( = ?AUTO_2131 ?AUTO_2133 ) ) ( not ( = ?AUTO_2131 ?AUTO_2134 ) ) ( not ( = ?AUTO_2133 ?AUTO_2134 ) ) ( ON ?AUTO_2133 ?AUTO_2131 ) ( not ( = ?AUTO_2130 ?AUTO_2132 ) ) ( not ( = ?AUTO_2131 ?AUTO_2132 ) ) ( not ( = ?AUTO_2134 ?AUTO_2132 ) ) ( not ( = ?AUTO_2133 ?AUTO_2132 ) ) ( ON ?AUTO_2132 ?AUTO_2133 ) ( ON ?AUTO_2130 ?AUTO_2132 ) ( CLEAR ?AUTO_2130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2130 ?AUTO_2132 )
      ( MAKE-ON ?AUTO_2130 ?AUTO_2131 )
      ( MAKE-ON-VERIFY ?AUTO_2130 ?AUTO_2131 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2135 - BLOCK
      ?AUTO_2136 - BLOCK
    )
    :vars
    (
      ?AUTO_2139 - BLOCK
      ?AUTO_2138 - BLOCK
      ?AUTO_2137 - BLOCK
      ?AUTO_2140 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2135 ?AUTO_2136 ) ) ( CLEAR ?AUTO_2139 ) ( not ( = ?AUTO_2135 ?AUTO_2138 ) ) ( not ( = ?AUTO_2135 ?AUTO_2139 ) ) ( not ( = ?AUTO_2136 ?AUTO_2138 ) ) ( not ( = ?AUTO_2136 ?AUTO_2139 ) ) ( not ( = ?AUTO_2138 ?AUTO_2139 ) ) ( ON ?AUTO_2138 ?AUTO_2136 ) ( not ( = ?AUTO_2135 ?AUTO_2137 ) ) ( not ( = ?AUTO_2136 ?AUTO_2137 ) ) ( not ( = ?AUTO_2139 ?AUTO_2137 ) ) ( not ( = ?AUTO_2138 ?AUTO_2137 ) ) ( ON ?AUTO_2137 ?AUTO_2138 ) ( ON ?AUTO_2135 ?AUTO_2137 ) ( CLEAR ?AUTO_2135 ) ( HOLDING ?AUTO_2140 ) ( not ( = ?AUTO_2135 ?AUTO_2140 ) ) ( not ( = ?AUTO_2136 ?AUTO_2140 ) ) ( not ( = ?AUTO_2139 ?AUTO_2140 ) ) ( not ( = ?AUTO_2138 ?AUTO_2140 ) ) ( not ( = ?AUTO_2137 ?AUTO_2140 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2140 )
      ( MAKE-ON ?AUTO_2135 ?AUTO_2136 )
      ( MAKE-ON-VERIFY ?AUTO_2135 ?AUTO_2136 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2141 - BLOCK
      ?AUTO_2142 - BLOCK
    )
    :vars
    (
      ?AUTO_2145 - BLOCK
      ?AUTO_2144 - BLOCK
      ?AUTO_2143 - BLOCK
      ?AUTO_2146 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2141 ?AUTO_2142 ) ) ( CLEAR ?AUTO_2145 ) ( not ( = ?AUTO_2141 ?AUTO_2144 ) ) ( not ( = ?AUTO_2141 ?AUTO_2145 ) ) ( not ( = ?AUTO_2142 ?AUTO_2144 ) ) ( not ( = ?AUTO_2142 ?AUTO_2145 ) ) ( not ( = ?AUTO_2144 ?AUTO_2145 ) ) ( ON ?AUTO_2144 ?AUTO_2142 ) ( not ( = ?AUTO_2141 ?AUTO_2143 ) ) ( not ( = ?AUTO_2142 ?AUTO_2143 ) ) ( not ( = ?AUTO_2145 ?AUTO_2143 ) ) ( not ( = ?AUTO_2144 ?AUTO_2143 ) ) ( ON ?AUTO_2143 ?AUTO_2144 ) ( ON ?AUTO_2141 ?AUTO_2143 ) ( not ( = ?AUTO_2141 ?AUTO_2146 ) ) ( not ( = ?AUTO_2142 ?AUTO_2146 ) ) ( not ( = ?AUTO_2145 ?AUTO_2146 ) ) ( not ( = ?AUTO_2144 ?AUTO_2146 ) ) ( not ( = ?AUTO_2143 ?AUTO_2146 ) ) ( ON ?AUTO_2146 ?AUTO_2141 ) ( CLEAR ?AUTO_2146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2146 ?AUTO_2141 )
      ( MAKE-ON ?AUTO_2141 ?AUTO_2142 )
      ( MAKE-ON-VERIFY ?AUTO_2141 ?AUTO_2142 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2147 - BLOCK
      ?AUTO_2148 - BLOCK
    )
    :vars
    (
      ?AUTO_2150 - BLOCK
      ?AUTO_2152 - BLOCK
      ?AUTO_2151 - BLOCK
      ?AUTO_2149 - BLOCK
      ?AUTO_2153 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2147 ?AUTO_2148 ) ) ( not ( = ?AUTO_2147 ?AUTO_2150 ) ) ( not ( = ?AUTO_2147 ?AUTO_2152 ) ) ( not ( = ?AUTO_2148 ?AUTO_2150 ) ) ( not ( = ?AUTO_2148 ?AUTO_2152 ) ) ( not ( = ?AUTO_2150 ?AUTO_2152 ) ) ( ON ?AUTO_2150 ?AUTO_2148 ) ( not ( = ?AUTO_2147 ?AUTO_2151 ) ) ( not ( = ?AUTO_2148 ?AUTO_2151 ) ) ( not ( = ?AUTO_2152 ?AUTO_2151 ) ) ( not ( = ?AUTO_2150 ?AUTO_2151 ) ) ( ON ?AUTO_2151 ?AUTO_2150 ) ( ON ?AUTO_2147 ?AUTO_2151 ) ( not ( = ?AUTO_2147 ?AUTO_2149 ) ) ( not ( = ?AUTO_2148 ?AUTO_2149 ) ) ( not ( = ?AUTO_2152 ?AUTO_2149 ) ) ( not ( = ?AUTO_2150 ?AUTO_2149 ) ) ( not ( = ?AUTO_2151 ?AUTO_2149 ) ) ( ON ?AUTO_2149 ?AUTO_2147 ) ( CLEAR ?AUTO_2149 ) ( HOLDING ?AUTO_2152 ) ( CLEAR ?AUTO_2153 ) ( not ( = ?AUTO_2147 ?AUTO_2153 ) ) ( not ( = ?AUTO_2148 ?AUTO_2153 ) ) ( not ( = ?AUTO_2150 ?AUTO_2153 ) ) ( not ( = ?AUTO_2152 ?AUTO_2153 ) ) ( not ( = ?AUTO_2151 ?AUTO_2153 ) ) ( not ( = ?AUTO_2149 ?AUTO_2153 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2152 ?AUTO_2153 )
      ( MAKE-ON ?AUTO_2147 ?AUTO_2148 )
      ( MAKE-ON-VERIFY ?AUTO_2147 ?AUTO_2148 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2155 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2155 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2155 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2155 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2156 - BLOCK
    )
    :vars
    (
      ?AUTO_2157 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2156 ?AUTO_2157 ) ( CLEAR ?AUTO_2156 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2156 ?AUTO_2157 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2156 ?AUTO_2157 )
      ( MAKE-ON-TABLE ?AUTO_2156 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2156 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2159 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2159 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2159 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2159 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2160 - BLOCK
    )
    :vars
    (
      ?AUTO_2161 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2160 ?AUTO_2161 ) ( CLEAR ?AUTO_2160 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2160 ?AUTO_2161 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2160 ?AUTO_2161 )
      ( MAKE-ON-TABLE ?AUTO_2160 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2160 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2162 - BLOCK
    )
    :vars
    (
      ?AUTO_2163 - BLOCK
      ?AUTO_2164 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2162 ?AUTO_2163 ) ( CLEAR ?AUTO_2162 ) ( not ( = ?AUTO_2162 ?AUTO_2163 ) ) ( HOLDING ?AUTO_2164 ) ( not ( = ?AUTO_2162 ?AUTO_2164 ) ) ( not ( = ?AUTO_2163 ?AUTO_2164 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2164 )
      ( MAKE-ON-TABLE ?AUTO_2162 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2162 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2165 - BLOCK
    )
    :vars
    (
      ?AUTO_2166 - BLOCK
      ?AUTO_2167 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2165 ?AUTO_2166 ) ( not ( = ?AUTO_2165 ?AUTO_2166 ) ) ( not ( = ?AUTO_2165 ?AUTO_2167 ) ) ( not ( = ?AUTO_2166 ?AUTO_2167 ) ) ( ON ?AUTO_2167 ?AUTO_2165 ) ( CLEAR ?AUTO_2167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2167 ?AUTO_2165 )
      ( MAKE-ON-TABLE ?AUTO_2165 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2165 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2170 - BLOCK
      ?AUTO_2171 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2170 ) ( CLEAR ?AUTO_2171 ) ( not ( = ?AUTO_2170 ?AUTO_2171 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2170 ?AUTO_2171 )
      ( MAKE-ON-VERIFY ?AUTO_2170 ?AUTO_2171 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2172 - BLOCK
      ?AUTO_2173 - BLOCK
    )
    :vars
    (
      ?AUTO_2174 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2173 ) ( not ( = ?AUTO_2172 ?AUTO_2173 ) ) ( ON ?AUTO_2172 ?AUTO_2174 ) ( CLEAR ?AUTO_2172 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2172 ?AUTO_2174 ) ) ( not ( = ?AUTO_2173 ?AUTO_2174 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2172 ?AUTO_2174 )
      ( MAKE-ON ?AUTO_2172 ?AUTO_2173 )
      ( MAKE-ON-VERIFY ?AUTO_2172 ?AUTO_2173 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2175 - BLOCK
      ?AUTO_2176 - BLOCK
    )
    :vars
    (
      ?AUTO_2177 - BLOCK
      ?AUTO_2178 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2176 ) ( not ( = ?AUTO_2175 ?AUTO_2176 ) ) ( ON ?AUTO_2175 ?AUTO_2177 ) ( CLEAR ?AUTO_2175 ) ( not ( = ?AUTO_2175 ?AUTO_2177 ) ) ( not ( = ?AUTO_2176 ?AUTO_2177 ) ) ( HOLDING ?AUTO_2178 ) ( not ( = ?AUTO_2175 ?AUTO_2178 ) ) ( not ( = ?AUTO_2176 ?AUTO_2178 ) ) ( not ( = ?AUTO_2177 ?AUTO_2178 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2178 )
      ( MAKE-ON ?AUTO_2175 ?AUTO_2176 )
      ( MAKE-ON-VERIFY ?AUTO_2175 ?AUTO_2176 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2187 - BLOCK
      ?AUTO_2188 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2187 ) ( CLEAR ?AUTO_2188 ) ( not ( = ?AUTO_2187 ?AUTO_2188 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2187 ?AUTO_2188 )
      ( MAKE-ON-VERIFY ?AUTO_2187 ?AUTO_2188 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2189 - BLOCK
      ?AUTO_2190 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2190 ) ( not ( = ?AUTO_2189 ?AUTO_2190 ) ) ( ON-TABLE ?AUTO_2189 ) ( CLEAR ?AUTO_2189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2189 )
      ( MAKE-ON ?AUTO_2189 ?AUTO_2190 )
      ( MAKE-ON-VERIFY ?AUTO_2189 ?AUTO_2190 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2191 - BLOCK
      ?AUTO_2192 - BLOCK
    )
    :vars
    (
      ?AUTO_2193 - BLOCK
      ?AUTO_2194 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2192 ) ( not ( = ?AUTO_2191 ?AUTO_2192 ) ) ( ON-TABLE ?AUTO_2191 ) ( CLEAR ?AUTO_2191 ) ( HOLDING ?AUTO_2193 ) ( CLEAR ?AUTO_2194 ) ( not ( = ?AUTO_2191 ?AUTO_2193 ) ) ( not ( = ?AUTO_2191 ?AUTO_2194 ) ) ( not ( = ?AUTO_2192 ?AUTO_2193 ) ) ( not ( = ?AUTO_2192 ?AUTO_2194 ) ) ( not ( = ?AUTO_2193 ?AUTO_2194 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2193 ?AUTO_2194 )
      ( MAKE-ON ?AUTO_2191 ?AUTO_2192 )
      ( MAKE-ON-VERIFY ?AUTO_2191 ?AUTO_2192 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2195 - BLOCK
      ?AUTO_2196 - BLOCK
    )
    :vars
    (
      ?AUTO_2197 - BLOCK
      ?AUTO_2198 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2195 ?AUTO_2196 ) ) ( ON-TABLE ?AUTO_2195 ) ( CLEAR ?AUTO_2195 ) ( CLEAR ?AUTO_2197 ) ( not ( = ?AUTO_2195 ?AUTO_2198 ) ) ( not ( = ?AUTO_2195 ?AUTO_2197 ) ) ( not ( = ?AUTO_2196 ?AUTO_2198 ) ) ( not ( = ?AUTO_2196 ?AUTO_2197 ) ) ( not ( = ?AUTO_2198 ?AUTO_2197 ) ) ( ON ?AUTO_2198 ?AUTO_2196 ) ( CLEAR ?AUTO_2198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2198 ?AUTO_2196 )
      ( MAKE-ON ?AUTO_2195 ?AUTO_2196 )
      ( MAKE-ON-VERIFY ?AUTO_2195 ?AUTO_2196 ) )
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
      ?AUTO_2203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2199 ?AUTO_2200 ) ) ( ON-TABLE ?AUTO_2199 ) ( CLEAR ?AUTO_2199 ) ( CLEAR ?AUTO_2201 ) ( not ( = ?AUTO_2199 ?AUTO_2202 ) ) ( not ( = ?AUTO_2199 ?AUTO_2201 ) ) ( not ( = ?AUTO_2200 ?AUTO_2202 ) ) ( not ( = ?AUTO_2200 ?AUTO_2201 ) ) ( not ( = ?AUTO_2202 ?AUTO_2201 ) ) ( ON ?AUTO_2202 ?AUTO_2200 ) ( CLEAR ?AUTO_2202 ) ( HOLDING ?AUTO_2203 ) ( not ( = ?AUTO_2199 ?AUTO_2203 ) ) ( not ( = ?AUTO_2200 ?AUTO_2203 ) ) ( not ( = ?AUTO_2201 ?AUTO_2203 ) ) ( not ( = ?AUTO_2202 ?AUTO_2203 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2203 )
      ( MAKE-ON ?AUTO_2199 ?AUTO_2200 )
      ( MAKE-ON-VERIFY ?AUTO_2199 ?AUTO_2200 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2204 - BLOCK
      ?AUTO_2205 - BLOCK
    )
    :vars
    (
      ?AUTO_2208 - BLOCK
      ?AUTO_2207 - BLOCK
      ?AUTO_2206 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2204 ?AUTO_2205 ) ) ( ON-TABLE ?AUTO_2204 ) ( CLEAR ?AUTO_2208 ) ( not ( = ?AUTO_2204 ?AUTO_2207 ) ) ( not ( = ?AUTO_2204 ?AUTO_2208 ) ) ( not ( = ?AUTO_2205 ?AUTO_2207 ) ) ( not ( = ?AUTO_2205 ?AUTO_2208 ) ) ( not ( = ?AUTO_2207 ?AUTO_2208 ) ) ( ON ?AUTO_2207 ?AUTO_2205 ) ( CLEAR ?AUTO_2207 ) ( not ( = ?AUTO_2204 ?AUTO_2206 ) ) ( not ( = ?AUTO_2205 ?AUTO_2206 ) ) ( not ( = ?AUTO_2208 ?AUTO_2206 ) ) ( not ( = ?AUTO_2207 ?AUTO_2206 ) ) ( ON ?AUTO_2206 ?AUTO_2204 ) ( CLEAR ?AUTO_2206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2206 ?AUTO_2204 )
      ( MAKE-ON ?AUTO_2204 ?AUTO_2205 )
      ( MAKE-ON-VERIFY ?AUTO_2204 ?AUTO_2205 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2209 - BLOCK
      ?AUTO_2210 - BLOCK
    )
    :vars
    (
      ?AUTO_2213 - BLOCK
      ?AUTO_2211 - BLOCK
      ?AUTO_2212 - BLOCK
      ?AUTO_2214 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2209 ?AUTO_2210 ) ) ( ON-TABLE ?AUTO_2209 ) ( CLEAR ?AUTO_2213 ) ( not ( = ?AUTO_2209 ?AUTO_2211 ) ) ( not ( = ?AUTO_2209 ?AUTO_2213 ) ) ( not ( = ?AUTO_2210 ?AUTO_2211 ) ) ( not ( = ?AUTO_2210 ?AUTO_2213 ) ) ( not ( = ?AUTO_2211 ?AUTO_2213 ) ) ( ON ?AUTO_2211 ?AUTO_2210 ) ( CLEAR ?AUTO_2211 ) ( not ( = ?AUTO_2209 ?AUTO_2212 ) ) ( not ( = ?AUTO_2210 ?AUTO_2212 ) ) ( not ( = ?AUTO_2213 ?AUTO_2212 ) ) ( not ( = ?AUTO_2211 ?AUTO_2212 ) ) ( ON ?AUTO_2212 ?AUTO_2209 ) ( CLEAR ?AUTO_2212 ) ( HOLDING ?AUTO_2214 ) ( not ( = ?AUTO_2209 ?AUTO_2214 ) ) ( not ( = ?AUTO_2210 ?AUTO_2214 ) ) ( not ( = ?AUTO_2213 ?AUTO_2214 ) ) ( not ( = ?AUTO_2211 ?AUTO_2214 ) ) ( not ( = ?AUTO_2212 ?AUTO_2214 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2214 )
      ( MAKE-ON ?AUTO_2209 ?AUTO_2210 )
      ( MAKE-ON-VERIFY ?AUTO_2209 ?AUTO_2210 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2215 - BLOCK
      ?AUTO_2216 - BLOCK
    )
    :vars
    (
      ?AUTO_2219 - BLOCK
      ?AUTO_2217 - BLOCK
      ?AUTO_2218 - BLOCK
      ?AUTO_2220 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2215 ?AUTO_2216 ) ) ( ON-TABLE ?AUTO_2215 ) ( CLEAR ?AUTO_2219 ) ( not ( = ?AUTO_2215 ?AUTO_2217 ) ) ( not ( = ?AUTO_2215 ?AUTO_2219 ) ) ( not ( = ?AUTO_2216 ?AUTO_2217 ) ) ( not ( = ?AUTO_2216 ?AUTO_2219 ) ) ( not ( = ?AUTO_2217 ?AUTO_2219 ) ) ( ON ?AUTO_2217 ?AUTO_2216 ) ( CLEAR ?AUTO_2217 ) ( not ( = ?AUTO_2215 ?AUTO_2218 ) ) ( not ( = ?AUTO_2216 ?AUTO_2218 ) ) ( not ( = ?AUTO_2219 ?AUTO_2218 ) ) ( not ( = ?AUTO_2217 ?AUTO_2218 ) ) ( ON ?AUTO_2218 ?AUTO_2215 ) ( not ( = ?AUTO_2215 ?AUTO_2220 ) ) ( not ( = ?AUTO_2216 ?AUTO_2220 ) ) ( not ( = ?AUTO_2219 ?AUTO_2220 ) ) ( not ( = ?AUTO_2217 ?AUTO_2220 ) ) ( not ( = ?AUTO_2218 ?AUTO_2220 ) ) ( ON ?AUTO_2220 ?AUTO_2218 ) ( CLEAR ?AUTO_2220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2220 ?AUTO_2218 )
      ( MAKE-ON ?AUTO_2215 ?AUTO_2216 )
      ( MAKE-ON-VERIFY ?AUTO_2215 ?AUTO_2216 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2222 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2222 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2222 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2222 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2223 - BLOCK
    )
    :vars
    (
      ?AUTO_2224 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2223 ?AUTO_2224 ) ( CLEAR ?AUTO_2223 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2223 ?AUTO_2224 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2223 ?AUTO_2224 )
      ( MAKE-ON-TABLE ?AUTO_2223 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2223 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2226 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2226 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2226 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2226 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2227 - BLOCK
    )
    :vars
    (
      ?AUTO_2228 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2227 ?AUTO_2228 ) ( CLEAR ?AUTO_2227 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2227 ?AUTO_2228 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2227 ?AUTO_2228 )
      ( MAKE-ON-TABLE ?AUTO_2227 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2227 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2229 - BLOCK
    )
    :vars
    (
      ?AUTO_2230 - BLOCK
      ?AUTO_2231 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2229 ?AUTO_2230 ) ( CLEAR ?AUTO_2229 ) ( not ( = ?AUTO_2229 ?AUTO_2230 ) ) ( HOLDING ?AUTO_2231 ) ( not ( = ?AUTO_2229 ?AUTO_2231 ) ) ( not ( = ?AUTO_2230 ?AUTO_2231 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2231 )
      ( MAKE-ON-TABLE ?AUTO_2229 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2229 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2232 - BLOCK
    )
    :vars
    (
      ?AUTO_2233 - BLOCK
      ?AUTO_2234 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2232 ?AUTO_2233 ) ( not ( = ?AUTO_2232 ?AUTO_2233 ) ) ( not ( = ?AUTO_2232 ?AUTO_2234 ) ) ( not ( = ?AUTO_2233 ?AUTO_2234 ) ) ( ON ?AUTO_2234 ?AUTO_2232 ) ( CLEAR ?AUTO_2234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2234 ?AUTO_2232 )
      ( MAKE-ON-TABLE ?AUTO_2232 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2232 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2236 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2236 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2236 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2236 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2237 - BLOCK
    )
    :vars
    (
      ?AUTO_2238 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2237 ?AUTO_2238 ) ( CLEAR ?AUTO_2237 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2237 ?AUTO_2238 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2237 ?AUTO_2238 )
      ( MAKE-ON-TABLE ?AUTO_2237 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2237 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2239 - BLOCK
    )
    :vars
    (
      ?AUTO_2240 - BLOCK
      ?AUTO_2241 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2239 ?AUTO_2240 ) ( CLEAR ?AUTO_2239 ) ( not ( = ?AUTO_2239 ?AUTO_2240 ) ) ( HOLDING ?AUTO_2241 ) ( not ( = ?AUTO_2239 ?AUTO_2241 ) ) ( not ( = ?AUTO_2240 ?AUTO_2241 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2241 )
      ( MAKE-ON-TABLE ?AUTO_2239 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2239 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2247 - BLOCK
      ?AUTO_2248 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2247 ) ( CLEAR ?AUTO_2248 ) ( not ( = ?AUTO_2247 ?AUTO_2248 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2247 ?AUTO_2248 )
      ( MAKE-ON-VERIFY ?AUTO_2247 ?AUTO_2248 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2249 - BLOCK
      ?AUTO_2250 - BLOCK
    )
    :vars
    (
      ?AUTO_2251 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2250 ) ( not ( = ?AUTO_2249 ?AUTO_2250 ) ) ( ON ?AUTO_2249 ?AUTO_2251 ) ( CLEAR ?AUTO_2249 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2249 ?AUTO_2251 ) ) ( not ( = ?AUTO_2250 ?AUTO_2251 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2249 ?AUTO_2251 )
      ( MAKE-ON ?AUTO_2249 ?AUTO_2250 )
      ( MAKE-ON-VERIFY ?AUTO_2249 ?AUTO_2250 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2252 - BLOCK
      ?AUTO_2253 - BLOCK
    )
    :vars
    (
      ?AUTO_2254 - BLOCK
      ?AUTO_2255 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2253 ) ( not ( = ?AUTO_2252 ?AUTO_2253 ) ) ( ON ?AUTO_2252 ?AUTO_2254 ) ( CLEAR ?AUTO_2252 ) ( not ( = ?AUTO_2252 ?AUTO_2254 ) ) ( not ( = ?AUTO_2253 ?AUTO_2254 ) ) ( HOLDING ?AUTO_2255 ) ( not ( = ?AUTO_2252 ?AUTO_2255 ) ) ( not ( = ?AUTO_2253 ?AUTO_2255 ) ) ( not ( = ?AUTO_2254 ?AUTO_2255 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2255 )
      ( MAKE-ON ?AUTO_2252 ?AUTO_2253 )
      ( MAKE-ON-VERIFY ?AUTO_2252 ?AUTO_2253 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2256 - BLOCK
      ?AUTO_2257 - BLOCK
    )
    :vars
    (
      ?AUTO_2258 - BLOCK
      ?AUTO_2259 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2257 ) ( not ( = ?AUTO_2256 ?AUTO_2257 ) ) ( ON ?AUTO_2256 ?AUTO_2258 ) ( not ( = ?AUTO_2256 ?AUTO_2258 ) ) ( not ( = ?AUTO_2257 ?AUTO_2258 ) ) ( not ( = ?AUTO_2256 ?AUTO_2259 ) ) ( not ( = ?AUTO_2257 ?AUTO_2259 ) ) ( not ( = ?AUTO_2258 ?AUTO_2259 ) ) ( ON ?AUTO_2259 ?AUTO_2256 ) ( CLEAR ?AUTO_2259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2259 ?AUTO_2256 )
      ( MAKE-ON ?AUTO_2256 ?AUTO_2257 )
      ( MAKE-ON-VERIFY ?AUTO_2256 ?AUTO_2257 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2260 - BLOCK
      ?AUTO_2261 - BLOCK
    )
    :vars
    (
      ?AUTO_2262 - BLOCK
      ?AUTO_2263 - BLOCK
      ?AUTO_2264 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2261 ) ( not ( = ?AUTO_2260 ?AUTO_2261 ) ) ( ON ?AUTO_2260 ?AUTO_2262 ) ( not ( = ?AUTO_2260 ?AUTO_2262 ) ) ( not ( = ?AUTO_2261 ?AUTO_2262 ) ) ( not ( = ?AUTO_2260 ?AUTO_2263 ) ) ( not ( = ?AUTO_2261 ?AUTO_2263 ) ) ( not ( = ?AUTO_2262 ?AUTO_2263 ) ) ( ON ?AUTO_2263 ?AUTO_2260 ) ( CLEAR ?AUTO_2263 ) ( HOLDING ?AUTO_2264 ) ( not ( = ?AUTO_2260 ?AUTO_2264 ) ) ( not ( = ?AUTO_2261 ?AUTO_2264 ) ) ( not ( = ?AUTO_2262 ?AUTO_2264 ) ) ( not ( = ?AUTO_2263 ?AUTO_2264 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2264 )
      ( MAKE-ON ?AUTO_2260 ?AUTO_2261 )
      ( MAKE-ON-VERIFY ?AUTO_2260 ?AUTO_2261 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2272 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2272 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2272 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2272 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2273 - BLOCK
    )
    :vars
    (
      ?AUTO_2274 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2273 ?AUTO_2274 ) ( CLEAR ?AUTO_2273 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2273 ?AUTO_2274 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2273 ?AUTO_2274 )
      ( MAKE-ON-TABLE ?AUTO_2273 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2273 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2275 - BLOCK
    )
    :vars
    (
      ?AUTO_2276 - BLOCK
      ?AUTO_2277 - BLOCK
      ?AUTO_2278 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2275 ?AUTO_2276 ) ( CLEAR ?AUTO_2275 ) ( not ( = ?AUTO_2275 ?AUTO_2276 ) ) ( HOLDING ?AUTO_2277 ) ( CLEAR ?AUTO_2278 ) ( not ( = ?AUTO_2275 ?AUTO_2277 ) ) ( not ( = ?AUTO_2275 ?AUTO_2278 ) ) ( not ( = ?AUTO_2276 ?AUTO_2277 ) ) ( not ( = ?AUTO_2276 ?AUTO_2278 ) ) ( not ( = ?AUTO_2277 ?AUTO_2278 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2277 ?AUTO_2278 )
      ( MAKE-ON-TABLE ?AUTO_2275 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2275 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2279 - BLOCK
    )
    :vars
    (
      ?AUTO_2280 - BLOCK
      ?AUTO_2282 - BLOCK
      ?AUTO_2281 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2279 ?AUTO_2280 ) ( not ( = ?AUTO_2279 ?AUTO_2280 ) ) ( CLEAR ?AUTO_2282 ) ( not ( = ?AUTO_2279 ?AUTO_2281 ) ) ( not ( = ?AUTO_2279 ?AUTO_2282 ) ) ( not ( = ?AUTO_2280 ?AUTO_2281 ) ) ( not ( = ?AUTO_2280 ?AUTO_2282 ) ) ( not ( = ?AUTO_2281 ?AUTO_2282 ) ) ( ON ?AUTO_2281 ?AUTO_2279 ) ( CLEAR ?AUTO_2281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2281 ?AUTO_2279 )
      ( MAKE-ON-TABLE ?AUTO_2279 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2279 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2283 - BLOCK
    )
    :vars
    (
      ?AUTO_2284 - BLOCK
      ?AUTO_2286 - BLOCK
      ?AUTO_2285 - BLOCK
      ?AUTO_2287 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2283 ?AUTO_2284 ) ( not ( = ?AUTO_2283 ?AUTO_2284 ) ) ( CLEAR ?AUTO_2286 ) ( not ( = ?AUTO_2283 ?AUTO_2285 ) ) ( not ( = ?AUTO_2283 ?AUTO_2286 ) ) ( not ( = ?AUTO_2284 ?AUTO_2285 ) ) ( not ( = ?AUTO_2284 ?AUTO_2286 ) ) ( not ( = ?AUTO_2285 ?AUTO_2286 ) ) ( ON ?AUTO_2285 ?AUTO_2283 ) ( CLEAR ?AUTO_2285 ) ( HOLDING ?AUTO_2287 ) ( not ( = ?AUTO_2283 ?AUTO_2287 ) ) ( not ( = ?AUTO_2284 ?AUTO_2287 ) ) ( not ( = ?AUTO_2286 ?AUTO_2287 ) ) ( not ( = ?AUTO_2285 ?AUTO_2287 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2287 )
      ( MAKE-ON-TABLE ?AUTO_2283 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2283 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2288 - BLOCK
    )
    :vars
    (
      ?AUTO_2289 - BLOCK
      ?AUTO_2292 - BLOCK
      ?AUTO_2290 - BLOCK
      ?AUTO_2291 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2288 ?AUTO_2289 ) ( not ( = ?AUTO_2288 ?AUTO_2289 ) ) ( CLEAR ?AUTO_2292 ) ( not ( = ?AUTO_2288 ?AUTO_2290 ) ) ( not ( = ?AUTO_2288 ?AUTO_2292 ) ) ( not ( = ?AUTO_2289 ?AUTO_2290 ) ) ( not ( = ?AUTO_2289 ?AUTO_2292 ) ) ( not ( = ?AUTO_2290 ?AUTO_2292 ) ) ( ON ?AUTO_2290 ?AUTO_2288 ) ( not ( = ?AUTO_2288 ?AUTO_2291 ) ) ( not ( = ?AUTO_2289 ?AUTO_2291 ) ) ( not ( = ?AUTO_2292 ?AUTO_2291 ) ) ( not ( = ?AUTO_2290 ?AUTO_2291 ) ) ( ON ?AUTO_2291 ?AUTO_2290 ) ( CLEAR ?AUTO_2291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2291 ?AUTO_2290 )
      ( MAKE-ON-TABLE ?AUTO_2288 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2288 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2293 - BLOCK
    )
    :vars
    (
      ?AUTO_2297 - BLOCK
      ?AUTO_2296 - BLOCK
      ?AUTO_2295 - BLOCK
      ?AUTO_2294 - BLOCK
      ?AUTO_2298 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2293 ?AUTO_2297 ) ( not ( = ?AUTO_2293 ?AUTO_2297 ) ) ( CLEAR ?AUTO_2296 ) ( not ( = ?AUTO_2293 ?AUTO_2295 ) ) ( not ( = ?AUTO_2293 ?AUTO_2296 ) ) ( not ( = ?AUTO_2297 ?AUTO_2295 ) ) ( not ( = ?AUTO_2297 ?AUTO_2296 ) ) ( not ( = ?AUTO_2295 ?AUTO_2296 ) ) ( ON ?AUTO_2295 ?AUTO_2293 ) ( not ( = ?AUTO_2293 ?AUTO_2294 ) ) ( not ( = ?AUTO_2297 ?AUTO_2294 ) ) ( not ( = ?AUTO_2296 ?AUTO_2294 ) ) ( not ( = ?AUTO_2295 ?AUTO_2294 ) ) ( ON ?AUTO_2294 ?AUTO_2295 ) ( CLEAR ?AUTO_2294 ) ( HOLDING ?AUTO_2298 ) ( not ( = ?AUTO_2293 ?AUTO_2298 ) ) ( not ( = ?AUTO_2297 ?AUTO_2298 ) ) ( not ( = ?AUTO_2296 ?AUTO_2298 ) ) ( not ( = ?AUTO_2295 ?AUTO_2298 ) ) ( not ( = ?AUTO_2294 ?AUTO_2298 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2298 )
      ( MAKE-ON-TABLE ?AUTO_2293 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2293 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2304 - BLOCK
      ?AUTO_2305 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2304 ) ( CLEAR ?AUTO_2305 ) ( not ( = ?AUTO_2304 ?AUTO_2305 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2304 ?AUTO_2305 )
      ( MAKE-ON-VERIFY ?AUTO_2304 ?AUTO_2305 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2306 - BLOCK
      ?AUTO_2307 - BLOCK
    )
    :vars
    (
      ?AUTO_2308 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2307 ) ( not ( = ?AUTO_2306 ?AUTO_2307 ) ) ( ON ?AUTO_2306 ?AUTO_2308 ) ( CLEAR ?AUTO_2306 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2306 ?AUTO_2308 ) ) ( not ( = ?AUTO_2307 ?AUTO_2308 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2306 ?AUTO_2308 )
      ( MAKE-ON ?AUTO_2306 ?AUTO_2307 )
      ( MAKE-ON-VERIFY ?AUTO_2306 ?AUTO_2307 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2309 - BLOCK
      ?AUTO_2310 - BLOCK
    )
    :vars
    (
      ?AUTO_2311 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2309 ?AUTO_2310 ) ) ( ON ?AUTO_2309 ?AUTO_2311 ) ( CLEAR ?AUTO_2309 ) ( not ( = ?AUTO_2309 ?AUTO_2311 ) ) ( not ( = ?AUTO_2310 ?AUTO_2311 ) ) ( HOLDING ?AUTO_2310 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2310 )
      ( MAKE-ON ?AUTO_2309 ?AUTO_2310 )
      ( MAKE-ON-VERIFY ?AUTO_2309 ?AUTO_2310 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2314 - BLOCK
      ?AUTO_2315 - BLOCK
    )
    :vars
    (
      ?AUTO_2316 - BLOCK
      ?AUTO_2317 - BLOCK
      ?AUTO_2318 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2315 ) ( not ( = ?AUTO_2314 ?AUTO_2315 ) ) ( ON ?AUTO_2314 ?AUTO_2316 ) ( CLEAR ?AUTO_2314 ) ( not ( = ?AUTO_2314 ?AUTO_2316 ) ) ( not ( = ?AUTO_2315 ?AUTO_2316 ) ) ( HOLDING ?AUTO_2317 ) ( CLEAR ?AUTO_2318 ) ( not ( = ?AUTO_2314 ?AUTO_2317 ) ) ( not ( = ?AUTO_2314 ?AUTO_2318 ) ) ( not ( = ?AUTO_2315 ?AUTO_2317 ) ) ( not ( = ?AUTO_2315 ?AUTO_2318 ) ) ( not ( = ?AUTO_2316 ?AUTO_2317 ) ) ( not ( = ?AUTO_2316 ?AUTO_2318 ) ) ( not ( = ?AUTO_2317 ?AUTO_2318 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2317 ?AUTO_2318 )
      ( MAKE-ON ?AUTO_2314 ?AUTO_2315 )
      ( MAKE-ON-VERIFY ?AUTO_2314 ?AUTO_2315 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2319 - BLOCK
      ?AUTO_2320 - BLOCK
    )
    :vars
    (
      ?AUTO_2321 - BLOCK
      ?AUTO_2322 - BLOCK
      ?AUTO_2323 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2319 ?AUTO_2320 ) ) ( ON ?AUTO_2319 ?AUTO_2321 ) ( CLEAR ?AUTO_2319 ) ( not ( = ?AUTO_2319 ?AUTO_2321 ) ) ( not ( = ?AUTO_2320 ?AUTO_2321 ) ) ( CLEAR ?AUTO_2322 ) ( not ( = ?AUTO_2319 ?AUTO_2323 ) ) ( not ( = ?AUTO_2319 ?AUTO_2322 ) ) ( not ( = ?AUTO_2320 ?AUTO_2323 ) ) ( not ( = ?AUTO_2320 ?AUTO_2322 ) ) ( not ( = ?AUTO_2321 ?AUTO_2323 ) ) ( not ( = ?AUTO_2321 ?AUTO_2322 ) ) ( not ( = ?AUTO_2323 ?AUTO_2322 ) ) ( ON ?AUTO_2323 ?AUTO_2320 ) ( CLEAR ?AUTO_2323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2323 ?AUTO_2320 )
      ( MAKE-ON ?AUTO_2319 ?AUTO_2320 )
      ( MAKE-ON-VERIFY ?AUTO_2319 ?AUTO_2320 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2324 - BLOCK
      ?AUTO_2325 - BLOCK
    )
    :vars
    (
      ?AUTO_2326 - BLOCK
      ?AUTO_2327 - BLOCK
      ?AUTO_2328 - BLOCK
      ?AUTO_2329 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2324 ?AUTO_2325 ) ) ( ON ?AUTO_2324 ?AUTO_2326 ) ( CLEAR ?AUTO_2324 ) ( not ( = ?AUTO_2324 ?AUTO_2326 ) ) ( not ( = ?AUTO_2325 ?AUTO_2326 ) ) ( CLEAR ?AUTO_2327 ) ( not ( = ?AUTO_2324 ?AUTO_2328 ) ) ( not ( = ?AUTO_2324 ?AUTO_2327 ) ) ( not ( = ?AUTO_2325 ?AUTO_2328 ) ) ( not ( = ?AUTO_2325 ?AUTO_2327 ) ) ( not ( = ?AUTO_2326 ?AUTO_2328 ) ) ( not ( = ?AUTO_2326 ?AUTO_2327 ) ) ( not ( = ?AUTO_2328 ?AUTO_2327 ) ) ( ON ?AUTO_2328 ?AUTO_2325 ) ( CLEAR ?AUTO_2328 ) ( HOLDING ?AUTO_2329 ) ( not ( = ?AUTO_2324 ?AUTO_2329 ) ) ( not ( = ?AUTO_2325 ?AUTO_2329 ) ) ( not ( = ?AUTO_2326 ?AUTO_2329 ) ) ( not ( = ?AUTO_2327 ?AUTO_2329 ) ) ( not ( = ?AUTO_2328 ?AUTO_2329 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2329 )
      ( MAKE-ON ?AUTO_2324 ?AUTO_2325 )
      ( MAKE-ON-VERIFY ?AUTO_2324 ?AUTO_2325 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2330 - BLOCK
      ?AUTO_2331 - BLOCK
    )
    :vars
    (
      ?AUTO_2333 - BLOCK
      ?AUTO_2332 - BLOCK
      ?AUTO_2334 - BLOCK
      ?AUTO_2335 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2330 ?AUTO_2331 ) ) ( ON ?AUTO_2330 ?AUTO_2333 ) ( CLEAR ?AUTO_2330 ) ( not ( = ?AUTO_2330 ?AUTO_2333 ) ) ( not ( = ?AUTO_2331 ?AUTO_2333 ) ) ( CLEAR ?AUTO_2332 ) ( not ( = ?AUTO_2330 ?AUTO_2334 ) ) ( not ( = ?AUTO_2330 ?AUTO_2332 ) ) ( not ( = ?AUTO_2331 ?AUTO_2334 ) ) ( not ( = ?AUTO_2331 ?AUTO_2332 ) ) ( not ( = ?AUTO_2333 ?AUTO_2334 ) ) ( not ( = ?AUTO_2333 ?AUTO_2332 ) ) ( not ( = ?AUTO_2334 ?AUTO_2332 ) ) ( ON ?AUTO_2334 ?AUTO_2331 ) ( not ( = ?AUTO_2330 ?AUTO_2335 ) ) ( not ( = ?AUTO_2331 ?AUTO_2335 ) ) ( not ( = ?AUTO_2333 ?AUTO_2335 ) ) ( not ( = ?AUTO_2332 ?AUTO_2335 ) ) ( not ( = ?AUTO_2334 ?AUTO_2335 ) ) ( ON ?AUTO_2335 ?AUTO_2334 ) ( CLEAR ?AUTO_2335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2335 ?AUTO_2334 )
      ( MAKE-ON ?AUTO_2330 ?AUTO_2331 )
      ( MAKE-ON-VERIFY ?AUTO_2330 ?AUTO_2331 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2336 - BLOCK
      ?AUTO_2337 - BLOCK
    )
    :vars
    (
      ?AUTO_2341 - BLOCK
      ?AUTO_2340 - BLOCK
      ?AUTO_2338 - BLOCK
      ?AUTO_2339 - BLOCK
      ?AUTO_2342 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2336 ?AUTO_2337 ) ) ( ON ?AUTO_2336 ?AUTO_2341 ) ( CLEAR ?AUTO_2336 ) ( not ( = ?AUTO_2336 ?AUTO_2341 ) ) ( not ( = ?AUTO_2337 ?AUTO_2341 ) ) ( CLEAR ?AUTO_2340 ) ( not ( = ?AUTO_2336 ?AUTO_2338 ) ) ( not ( = ?AUTO_2336 ?AUTO_2340 ) ) ( not ( = ?AUTO_2337 ?AUTO_2338 ) ) ( not ( = ?AUTO_2337 ?AUTO_2340 ) ) ( not ( = ?AUTO_2341 ?AUTO_2338 ) ) ( not ( = ?AUTO_2341 ?AUTO_2340 ) ) ( not ( = ?AUTO_2338 ?AUTO_2340 ) ) ( ON ?AUTO_2338 ?AUTO_2337 ) ( not ( = ?AUTO_2336 ?AUTO_2339 ) ) ( not ( = ?AUTO_2337 ?AUTO_2339 ) ) ( not ( = ?AUTO_2341 ?AUTO_2339 ) ) ( not ( = ?AUTO_2340 ?AUTO_2339 ) ) ( not ( = ?AUTO_2338 ?AUTO_2339 ) ) ( ON ?AUTO_2339 ?AUTO_2338 ) ( CLEAR ?AUTO_2339 ) ( HOLDING ?AUTO_2342 ) ( not ( = ?AUTO_2336 ?AUTO_2342 ) ) ( not ( = ?AUTO_2337 ?AUTO_2342 ) ) ( not ( = ?AUTO_2341 ?AUTO_2342 ) ) ( not ( = ?AUTO_2340 ?AUTO_2342 ) ) ( not ( = ?AUTO_2338 ?AUTO_2342 ) ) ( not ( = ?AUTO_2339 ?AUTO_2342 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2342 )
      ( MAKE-ON ?AUTO_2336 ?AUTO_2337 )
      ( MAKE-ON-VERIFY ?AUTO_2336 ?AUTO_2337 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2343 - BLOCK
      ?AUTO_2344 - BLOCK
    )
    :vars
    (
      ?AUTO_2345 - BLOCK
      ?AUTO_2349 - BLOCK
      ?AUTO_2347 - BLOCK
      ?AUTO_2348 - BLOCK
      ?AUTO_2346 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2343 ?AUTO_2344 ) ) ( ON ?AUTO_2343 ?AUTO_2345 ) ( not ( = ?AUTO_2343 ?AUTO_2345 ) ) ( not ( = ?AUTO_2344 ?AUTO_2345 ) ) ( CLEAR ?AUTO_2349 ) ( not ( = ?AUTO_2343 ?AUTO_2347 ) ) ( not ( = ?AUTO_2343 ?AUTO_2349 ) ) ( not ( = ?AUTO_2344 ?AUTO_2347 ) ) ( not ( = ?AUTO_2344 ?AUTO_2349 ) ) ( not ( = ?AUTO_2345 ?AUTO_2347 ) ) ( not ( = ?AUTO_2345 ?AUTO_2349 ) ) ( not ( = ?AUTO_2347 ?AUTO_2349 ) ) ( ON ?AUTO_2347 ?AUTO_2344 ) ( not ( = ?AUTO_2343 ?AUTO_2348 ) ) ( not ( = ?AUTO_2344 ?AUTO_2348 ) ) ( not ( = ?AUTO_2345 ?AUTO_2348 ) ) ( not ( = ?AUTO_2349 ?AUTO_2348 ) ) ( not ( = ?AUTO_2347 ?AUTO_2348 ) ) ( ON ?AUTO_2348 ?AUTO_2347 ) ( CLEAR ?AUTO_2348 ) ( not ( = ?AUTO_2343 ?AUTO_2346 ) ) ( not ( = ?AUTO_2344 ?AUTO_2346 ) ) ( not ( = ?AUTO_2345 ?AUTO_2346 ) ) ( not ( = ?AUTO_2349 ?AUTO_2346 ) ) ( not ( = ?AUTO_2347 ?AUTO_2346 ) ) ( not ( = ?AUTO_2348 ?AUTO_2346 ) ) ( ON ?AUTO_2346 ?AUTO_2343 ) ( CLEAR ?AUTO_2346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2346 ?AUTO_2343 )
      ( MAKE-ON ?AUTO_2343 ?AUTO_2344 )
      ( MAKE-ON-VERIFY ?AUTO_2343 ?AUTO_2344 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2350 - BLOCK
      ?AUTO_2351 - BLOCK
    )
    :vars
    (
      ?AUTO_2354 - BLOCK
      ?AUTO_2356 - BLOCK
      ?AUTO_2353 - BLOCK
      ?AUTO_2352 - BLOCK
      ?AUTO_2355 - BLOCK
      ?AUTO_2357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2350 ?AUTO_2351 ) ) ( ON ?AUTO_2350 ?AUTO_2354 ) ( not ( = ?AUTO_2350 ?AUTO_2354 ) ) ( not ( = ?AUTO_2351 ?AUTO_2354 ) ) ( CLEAR ?AUTO_2356 ) ( not ( = ?AUTO_2350 ?AUTO_2353 ) ) ( not ( = ?AUTO_2350 ?AUTO_2356 ) ) ( not ( = ?AUTO_2351 ?AUTO_2353 ) ) ( not ( = ?AUTO_2351 ?AUTO_2356 ) ) ( not ( = ?AUTO_2354 ?AUTO_2353 ) ) ( not ( = ?AUTO_2354 ?AUTO_2356 ) ) ( not ( = ?AUTO_2353 ?AUTO_2356 ) ) ( ON ?AUTO_2353 ?AUTO_2351 ) ( not ( = ?AUTO_2350 ?AUTO_2352 ) ) ( not ( = ?AUTO_2351 ?AUTO_2352 ) ) ( not ( = ?AUTO_2354 ?AUTO_2352 ) ) ( not ( = ?AUTO_2356 ?AUTO_2352 ) ) ( not ( = ?AUTO_2353 ?AUTO_2352 ) ) ( ON ?AUTO_2352 ?AUTO_2353 ) ( CLEAR ?AUTO_2352 ) ( not ( = ?AUTO_2350 ?AUTO_2355 ) ) ( not ( = ?AUTO_2351 ?AUTO_2355 ) ) ( not ( = ?AUTO_2354 ?AUTO_2355 ) ) ( not ( = ?AUTO_2356 ?AUTO_2355 ) ) ( not ( = ?AUTO_2353 ?AUTO_2355 ) ) ( not ( = ?AUTO_2352 ?AUTO_2355 ) ) ( ON ?AUTO_2355 ?AUTO_2350 ) ( CLEAR ?AUTO_2355 ) ( HOLDING ?AUTO_2357 ) ( not ( = ?AUTO_2350 ?AUTO_2357 ) ) ( not ( = ?AUTO_2351 ?AUTO_2357 ) ) ( not ( = ?AUTO_2354 ?AUTO_2357 ) ) ( not ( = ?AUTO_2356 ?AUTO_2357 ) ) ( not ( = ?AUTO_2353 ?AUTO_2357 ) ) ( not ( = ?AUTO_2352 ?AUTO_2357 ) ) ( not ( = ?AUTO_2355 ?AUTO_2357 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2357 )
      ( MAKE-ON ?AUTO_2350 ?AUTO_2351 )
      ( MAKE-ON-VERIFY ?AUTO_2350 ?AUTO_2351 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2358 - BLOCK
      ?AUTO_2359 - BLOCK
    )
    :vars
    (
      ?AUTO_2365 - BLOCK
      ?AUTO_2361 - BLOCK
      ?AUTO_2363 - BLOCK
      ?AUTO_2362 - BLOCK
      ?AUTO_2360 - BLOCK
      ?AUTO_2364 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2358 ?AUTO_2359 ) ) ( ON ?AUTO_2358 ?AUTO_2365 ) ( not ( = ?AUTO_2358 ?AUTO_2365 ) ) ( not ( = ?AUTO_2359 ?AUTO_2365 ) ) ( CLEAR ?AUTO_2361 ) ( not ( = ?AUTO_2358 ?AUTO_2363 ) ) ( not ( = ?AUTO_2358 ?AUTO_2361 ) ) ( not ( = ?AUTO_2359 ?AUTO_2363 ) ) ( not ( = ?AUTO_2359 ?AUTO_2361 ) ) ( not ( = ?AUTO_2365 ?AUTO_2363 ) ) ( not ( = ?AUTO_2365 ?AUTO_2361 ) ) ( not ( = ?AUTO_2363 ?AUTO_2361 ) ) ( ON ?AUTO_2363 ?AUTO_2359 ) ( not ( = ?AUTO_2358 ?AUTO_2362 ) ) ( not ( = ?AUTO_2359 ?AUTO_2362 ) ) ( not ( = ?AUTO_2365 ?AUTO_2362 ) ) ( not ( = ?AUTO_2361 ?AUTO_2362 ) ) ( not ( = ?AUTO_2363 ?AUTO_2362 ) ) ( ON ?AUTO_2362 ?AUTO_2363 ) ( CLEAR ?AUTO_2362 ) ( not ( = ?AUTO_2358 ?AUTO_2360 ) ) ( not ( = ?AUTO_2359 ?AUTO_2360 ) ) ( not ( = ?AUTO_2365 ?AUTO_2360 ) ) ( not ( = ?AUTO_2361 ?AUTO_2360 ) ) ( not ( = ?AUTO_2363 ?AUTO_2360 ) ) ( not ( = ?AUTO_2362 ?AUTO_2360 ) ) ( ON ?AUTO_2360 ?AUTO_2358 ) ( not ( = ?AUTO_2358 ?AUTO_2364 ) ) ( not ( = ?AUTO_2359 ?AUTO_2364 ) ) ( not ( = ?AUTO_2365 ?AUTO_2364 ) ) ( not ( = ?AUTO_2361 ?AUTO_2364 ) ) ( not ( = ?AUTO_2363 ?AUTO_2364 ) ) ( not ( = ?AUTO_2362 ?AUTO_2364 ) ) ( not ( = ?AUTO_2360 ?AUTO_2364 ) ) ( ON ?AUTO_2364 ?AUTO_2360 ) ( CLEAR ?AUTO_2364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2364 ?AUTO_2360 )
      ( MAKE-ON ?AUTO_2358 ?AUTO_2359 )
      ( MAKE-ON-VERIFY ?AUTO_2358 ?AUTO_2359 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2368 - BLOCK
      ?AUTO_2369 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2368 ) ( CLEAR ?AUTO_2369 ) ( not ( = ?AUTO_2368 ?AUTO_2369 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2368 ?AUTO_2369 )
      ( MAKE-ON-VERIFY ?AUTO_2368 ?AUTO_2369 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2370 - BLOCK
      ?AUTO_2371 - BLOCK
    )
    :vars
    (
      ?AUTO_2372 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2371 ) ( not ( = ?AUTO_2370 ?AUTO_2371 ) ) ( ON ?AUTO_2370 ?AUTO_2372 ) ( CLEAR ?AUTO_2370 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2370 ?AUTO_2372 ) ) ( not ( = ?AUTO_2371 ?AUTO_2372 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2370 ?AUTO_2372 )
      ( MAKE-ON ?AUTO_2370 ?AUTO_2371 )
      ( MAKE-ON-VERIFY ?AUTO_2370 ?AUTO_2371 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2373 - BLOCK
      ?AUTO_2374 - BLOCK
    )
    :vars
    (
      ?AUTO_2375 - BLOCK
      ?AUTO_2376 - BLOCK
      ?AUTO_2377 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2374 ) ( not ( = ?AUTO_2373 ?AUTO_2374 ) ) ( ON ?AUTO_2373 ?AUTO_2375 ) ( CLEAR ?AUTO_2373 ) ( not ( = ?AUTO_2373 ?AUTO_2375 ) ) ( not ( = ?AUTO_2374 ?AUTO_2375 ) ) ( HOLDING ?AUTO_2376 ) ( CLEAR ?AUTO_2377 ) ( not ( = ?AUTO_2373 ?AUTO_2376 ) ) ( not ( = ?AUTO_2373 ?AUTO_2377 ) ) ( not ( = ?AUTO_2374 ?AUTO_2376 ) ) ( not ( = ?AUTO_2374 ?AUTO_2377 ) ) ( not ( = ?AUTO_2375 ?AUTO_2376 ) ) ( not ( = ?AUTO_2375 ?AUTO_2377 ) ) ( not ( = ?AUTO_2376 ?AUTO_2377 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2376 ?AUTO_2377 )
      ( MAKE-ON ?AUTO_2373 ?AUTO_2374 )
      ( MAKE-ON-VERIFY ?AUTO_2373 ?AUTO_2374 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2378 - BLOCK
      ?AUTO_2379 - BLOCK
    )
    :vars
    (
      ?AUTO_2380 - BLOCK
      ?AUTO_2382 - BLOCK
      ?AUTO_2381 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2378 ?AUTO_2379 ) ) ( ON ?AUTO_2378 ?AUTO_2380 ) ( CLEAR ?AUTO_2378 ) ( not ( = ?AUTO_2378 ?AUTO_2380 ) ) ( not ( = ?AUTO_2379 ?AUTO_2380 ) ) ( CLEAR ?AUTO_2382 ) ( not ( = ?AUTO_2378 ?AUTO_2381 ) ) ( not ( = ?AUTO_2378 ?AUTO_2382 ) ) ( not ( = ?AUTO_2379 ?AUTO_2381 ) ) ( not ( = ?AUTO_2379 ?AUTO_2382 ) ) ( not ( = ?AUTO_2380 ?AUTO_2381 ) ) ( not ( = ?AUTO_2380 ?AUTO_2382 ) ) ( not ( = ?AUTO_2381 ?AUTO_2382 ) ) ( ON ?AUTO_2381 ?AUTO_2379 ) ( CLEAR ?AUTO_2381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2381 ?AUTO_2379 )
      ( MAKE-ON ?AUTO_2378 ?AUTO_2379 )
      ( MAKE-ON-VERIFY ?AUTO_2378 ?AUTO_2379 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2383 - BLOCK
      ?AUTO_2384 - BLOCK
    )
    :vars
    (
      ?AUTO_2387 - BLOCK
      ?AUTO_2385 - BLOCK
      ?AUTO_2386 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2383 ?AUTO_2384 ) ) ( ON ?AUTO_2383 ?AUTO_2387 ) ( CLEAR ?AUTO_2383 ) ( not ( = ?AUTO_2383 ?AUTO_2387 ) ) ( not ( = ?AUTO_2384 ?AUTO_2387 ) ) ( not ( = ?AUTO_2383 ?AUTO_2385 ) ) ( not ( = ?AUTO_2383 ?AUTO_2386 ) ) ( not ( = ?AUTO_2384 ?AUTO_2385 ) ) ( not ( = ?AUTO_2384 ?AUTO_2386 ) ) ( not ( = ?AUTO_2387 ?AUTO_2385 ) ) ( not ( = ?AUTO_2387 ?AUTO_2386 ) ) ( not ( = ?AUTO_2385 ?AUTO_2386 ) ) ( ON ?AUTO_2385 ?AUTO_2384 ) ( CLEAR ?AUTO_2385 ) ( HOLDING ?AUTO_2386 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2386 )
      ( MAKE-ON ?AUTO_2383 ?AUTO_2384 )
      ( MAKE-ON-VERIFY ?AUTO_2383 ?AUTO_2384 ) )
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
      ?AUTO_2391 - BLOCK
      ?AUTO_2390 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2388 ?AUTO_2389 ) ) ( ON ?AUTO_2388 ?AUTO_2392 ) ( not ( = ?AUTO_2388 ?AUTO_2392 ) ) ( not ( = ?AUTO_2389 ?AUTO_2392 ) ) ( not ( = ?AUTO_2388 ?AUTO_2391 ) ) ( not ( = ?AUTO_2388 ?AUTO_2390 ) ) ( not ( = ?AUTO_2389 ?AUTO_2391 ) ) ( not ( = ?AUTO_2389 ?AUTO_2390 ) ) ( not ( = ?AUTO_2392 ?AUTO_2391 ) ) ( not ( = ?AUTO_2392 ?AUTO_2390 ) ) ( not ( = ?AUTO_2391 ?AUTO_2390 ) ) ( ON ?AUTO_2391 ?AUTO_2389 ) ( CLEAR ?AUTO_2391 ) ( ON ?AUTO_2390 ?AUTO_2388 ) ( CLEAR ?AUTO_2390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2390 ?AUTO_2388 )
      ( MAKE-ON ?AUTO_2388 ?AUTO_2389 )
      ( MAKE-ON-VERIFY ?AUTO_2388 ?AUTO_2389 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2393 - BLOCK
      ?AUTO_2394 - BLOCK
    )
    :vars
    (
      ?AUTO_2396 - BLOCK
      ?AUTO_2395 - BLOCK
      ?AUTO_2397 - BLOCK
      ?AUTO_2398 - BLOCK
      ?AUTO_2399 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2393 ?AUTO_2394 ) ) ( ON ?AUTO_2393 ?AUTO_2396 ) ( not ( = ?AUTO_2393 ?AUTO_2396 ) ) ( not ( = ?AUTO_2394 ?AUTO_2396 ) ) ( not ( = ?AUTO_2393 ?AUTO_2395 ) ) ( not ( = ?AUTO_2393 ?AUTO_2397 ) ) ( not ( = ?AUTO_2394 ?AUTO_2395 ) ) ( not ( = ?AUTO_2394 ?AUTO_2397 ) ) ( not ( = ?AUTO_2396 ?AUTO_2395 ) ) ( not ( = ?AUTO_2396 ?AUTO_2397 ) ) ( not ( = ?AUTO_2395 ?AUTO_2397 ) ) ( ON ?AUTO_2395 ?AUTO_2394 ) ( CLEAR ?AUTO_2395 ) ( ON ?AUTO_2397 ?AUTO_2393 ) ( CLEAR ?AUTO_2397 ) ( HOLDING ?AUTO_2398 ) ( CLEAR ?AUTO_2399 ) ( not ( = ?AUTO_2393 ?AUTO_2398 ) ) ( not ( = ?AUTO_2393 ?AUTO_2399 ) ) ( not ( = ?AUTO_2394 ?AUTO_2398 ) ) ( not ( = ?AUTO_2394 ?AUTO_2399 ) ) ( not ( = ?AUTO_2396 ?AUTO_2398 ) ) ( not ( = ?AUTO_2396 ?AUTO_2399 ) ) ( not ( = ?AUTO_2395 ?AUTO_2398 ) ) ( not ( = ?AUTO_2395 ?AUTO_2399 ) ) ( not ( = ?AUTO_2397 ?AUTO_2398 ) ) ( not ( = ?AUTO_2397 ?AUTO_2399 ) ) ( not ( = ?AUTO_2398 ?AUTO_2399 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2398 ?AUTO_2399 )
      ( MAKE-ON ?AUTO_2393 ?AUTO_2394 )
      ( MAKE-ON-VERIFY ?AUTO_2393 ?AUTO_2394 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2400 - BLOCK
      ?AUTO_2401 - BLOCK
    )
    :vars
    (
      ?AUTO_2404 - BLOCK
      ?AUTO_2402 - BLOCK
      ?AUTO_2403 - BLOCK
      ?AUTO_2406 - BLOCK
      ?AUTO_2405 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2400 ?AUTO_2401 ) ) ( ON ?AUTO_2400 ?AUTO_2404 ) ( not ( = ?AUTO_2400 ?AUTO_2404 ) ) ( not ( = ?AUTO_2401 ?AUTO_2404 ) ) ( not ( = ?AUTO_2400 ?AUTO_2402 ) ) ( not ( = ?AUTO_2400 ?AUTO_2403 ) ) ( not ( = ?AUTO_2401 ?AUTO_2402 ) ) ( not ( = ?AUTO_2401 ?AUTO_2403 ) ) ( not ( = ?AUTO_2404 ?AUTO_2402 ) ) ( not ( = ?AUTO_2404 ?AUTO_2403 ) ) ( not ( = ?AUTO_2402 ?AUTO_2403 ) ) ( ON ?AUTO_2402 ?AUTO_2401 ) ( CLEAR ?AUTO_2402 ) ( ON ?AUTO_2403 ?AUTO_2400 ) ( CLEAR ?AUTO_2406 ) ( not ( = ?AUTO_2400 ?AUTO_2405 ) ) ( not ( = ?AUTO_2400 ?AUTO_2406 ) ) ( not ( = ?AUTO_2401 ?AUTO_2405 ) ) ( not ( = ?AUTO_2401 ?AUTO_2406 ) ) ( not ( = ?AUTO_2404 ?AUTO_2405 ) ) ( not ( = ?AUTO_2404 ?AUTO_2406 ) ) ( not ( = ?AUTO_2402 ?AUTO_2405 ) ) ( not ( = ?AUTO_2402 ?AUTO_2406 ) ) ( not ( = ?AUTO_2403 ?AUTO_2405 ) ) ( not ( = ?AUTO_2403 ?AUTO_2406 ) ) ( not ( = ?AUTO_2405 ?AUTO_2406 ) ) ( ON ?AUTO_2405 ?AUTO_2403 ) ( CLEAR ?AUTO_2405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2405 ?AUTO_2403 )
      ( MAKE-ON ?AUTO_2400 ?AUTO_2401 )
      ( MAKE-ON-VERIFY ?AUTO_2400 ?AUTO_2401 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2407 - BLOCK
      ?AUTO_2408 - BLOCK
    )
    :vars
    (
      ?AUTO_2413 - BLOCK
      ?AUTO_2411 - BLOCK
      ?AUTO_2412 - BLOCK
      ?AUTO_2409 - BLOCK
      ?AUTO_2410 - BLOCK
      ?AUTO_2414 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2407 ?AUTO_2408 ) ) ( ON ?AUTO_2407 ?AUTO_2413 ) ( not ( = ?AUTO_2407 ?AUTO_2413 ) ) ( not ( = ?AUTO_2408 ?AUTO_2413 ) ) ( not ( = ?AUTO_2407 ?AUTO_2411 ) ) ( not ( = ?AUTO_2407 ?AUTO_2412 ) ) ( not ( = ?AUTO_2408 ?AUTO_2411 ) ) ( not ( = ?AUTO_2408 ?AUTO_2412 ) ) ( not ( = ?AUTO_2413 ?AUTO_2411 ) ) ( not ( = ?AUTO_2413 ?AUTO_2412 ) ) ( not ( = ?AUTO_2411 ?AUTO_2412 ) ) ( ON ?AUTO_2411 ?AUTO_2408 ) ( CLEAR ?AUTO_2411 ) ( ON ?AUTO_2412 ?AUTO_2407 ) ( CLEAR ?AUTO_2409 ) ( not ( = ?AUTO_2407 ?AUTO_2410 ) ) ( not ( = ?AUTO_2407 ?AUTO_2409 ) ) ( not ( = ?AUTO_2408 ?AUTO_2410 ) ) ( not ( = ?AUTO_2408 ?AUTO_2409 ) ) ( not ( = ?AUTO_2413 ?AUTO_2410 ) ) ( not ( = ?AUTO_2413 ?AUTO_2409 ) ) ( not ( = ?AUTO_2411 ?AUTO_2410 ) ) ( not ( = ?AUTO_2411 ?AUTO_2409 ) ) ( not ( = ?AUTO_2412 ?AUTO_2410 ) ) ( not ( = ?AUTO_2412 ?AUTO_2409 ) ) ( not ( = ?AUTO_2410 ?AUTO_2409 ) ) ( ON ?AUTO_2410 ?AUTO_2412 ) ( CLEAR ?AUTO_2410 ) ( HOLDING ?AUTO_2414 ) ( not ( = ?AUTO_2407 ?AUTO_2414 ) ) ( not ( = ?AUTO_2408 ?AUTO_2414 ) ) ( not ( = ?AUTO_2413 ?AUTO_2414 ) ) ( not ( = ?AUTO_2411 ?AUTO_2414 ) ) ( not ( = ?AUTO_2412 ?AUTO_2414 ) ) ( not ( = ?AUTO_2409 ?AUTO_2414 ) ) ( not ( = ?AUTO_2410 ?AUTO_2414 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2414 )
      ( MAKE-ON ?AUTO_2407 ?AUTO_2408 )
      ( MAKE-ON-VERIFY ?AUTO_2407 ?AUTO_2408 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2415 - BLOCK
      ?AUTO_2416 - BLOCK
    )
    :vars
    (
      ?AUTO_2419 - BLOCK
      ?AUTO_2421 - BLOCK
      ?AUTO_2420 - BLOCK
      ?AUTO_2417 - BLOCK
      ?AUTO_2418 - BLOCK
      ?AUTO_2422 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2415 ?AUTO_2416 ) ) ( ON ?AUTO_2415 ?AUTO_2419 ) ( not ( = ?AUTO_2415 ?AUTO_2419 ) ) ( not ( = ?AUTO_2416 ?AUTO_2419 ) ) ( not ( = ?AUTO_2415 ?AUTO_2421 ) ) ( not ( = ?AUTO_2415 ?AUTO_2420 ) ) ( not ( = ?AUTO_2416 ?AUTO_2421 ) ) ( not ( = ?AUTO_2416 ?AUTO_2420 ) ) ( not ( = ?AUTO_2419 ?AUTO_2421 ) ) ( not ( = ?AUTO_2419 ?AUTO_2420 ) ) ( not ( = ?AUTO_2421 ?AUTO_2420 ) ) ( ON ?AUTO_2421 ?AUTO_2416 ) ( CLEAR ?AUTO_2421 ) ( ON ?AUTO_2420 ?AUTO_2415 ) ( CLEAR ?AUTO_2417 ) ( not ( = ?AUTO_2415 ?AUTO_2418 ) ) ( not ( = ?AUTO_2415 ?AUTO_2417 ) ) ( not ( = ?AUTO_2416 ?AUTO_2418 ) ) ( not ( = ?AUTO_2416 ?AUTO_2417 ) ) ( not ( = ?AUTO_2419 ?AUTO_2418 ) ) ( not ( = ?AUTO_2419 ?AUTO_2417 ) ) ( not ( = ?AUTO_2421 ?AUTO_2418 ) ) ( not ( = ?AUTO_2421 ?AUTO_2417 ) ) ( not ( = ?AUTO_2420 ?AUTO_2418 ) ) ( not ( = ?AUTO_2420 ?AUTO_2417 ) ) ( not ( = ?AUTO_2418 ?AUTO_2417 ) ) ( ON ?AUTO_2418 ?AUTO_2420 ) ( not ( = ?AUTO_2415 ?AUTO_2422 ) ) ( not ( = ?AUTO_2416 ?AUTO_2422 ) ) ( not ( = ?AUTO_2419 ?AUTO_2422 ) ) ( not ( = ?AUTO_2421 ?AUTO_2422 ) ) ( not ( = ?AUTO_2420 ?AUTO_2422 ) ) ( not ( = ?AUTO_2417 ?AUTO_2422 ) ) ( not ( = ?AUTO_2418 ?AUTO_2422 ) ) ( ON ?AUTO_2422 ?AUTO_2418 ) ( CLEAR ?AUTO_2422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2422 ?AUTO_2418 )
      ( MAKE-ON ?AUTO_2415 ?AUTO_2416 )
      ( MAKE-ON-VERIFY ?AUTO_2415 ?AUTO_2416 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2423 - BLOCK
      ?AUTO_2424 - BLOCK
    )
    :vars
    (
      ?AUTO_2429 - BLOCK
      ?AUTO_2430 - BLOCK
      ?AUTO_2426 - BLOCK
      ?AUTO_2425 - BLOCK
      ?AUTO_2428 - BLOCK
      ?AUTO_2427 - BLOCK
      ?AUTO_2431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2423 ?AUTO_2424 ) ) ( ON ?AUTO_2423 ?AUTO_2429 ) ( not ( = ?AUTO_2423 ?AUTO_2429 ) ) ( not ( = ?AUTO_2424 ?AUTO_2429 ) ) ( not ( = ?AUTO_2423 ?AUTO_2430 ) ) ( not ( = ?AUTO_2423 ?AUTO_2426 ) ) ( not ( = ?AUTO_2424 ?AUTO_2430 ) ) ( not ( = ?AUTO_2424 ?AUTO_2426 ) ) ( not ( = ?AUTO_2429 ?AUTO_2430 ) ) ( not ( = ?AUTO_2429 ?AUTO_2426 ) ) ( not ( = ?AUTO_2430 ?AUTO_2426 ) ) ( ON ?AUTO_2430 ?AUTO_2424 ) ( CLEAR ?AUTO_2430 ) ( ON ?AUTO_2426 ?AUTO_2423 ) ( CLEAR ?AUTO_2425 ) ( not ( = ?AUTO_2423 ?AUTO_2428 ) ) ( not ( = ?AUTO_2423 ?AUTO_2425 ) ) ( not ( = ?AUTO_2424 ?AUTO_2428 ) ) ( not ( = ?AUTO_2424 ?AUTO_2425 ) ) ( not ( = ?AUTO_2429 ?AUTO_2428 ) ) ( not ( = ?AUTO_2429 ?AUTO_2425 ) ) ( not ( = ?AUTO_2430 ?AUTO_2428 ) ) ( not ( = ?AUTO_2430 ?AUTO_2425 ) ) ( not ( = ?AUTO_2426 ?AUTO_2428 ) ) ( not ( = ?AUTO_2426 ?AUTO_2425 ) ) ( not ( = ?AUTO_2428 ?AUTO_2425 ) ) ( ON ?AUTO_2428 ?AUTO_2426 ) ( not ( = ?AUTO_2423 ?AUTO_2427 ) ) ( not ( = ?AUTO_2424 ?AUTO_2427 ) ) ( not ( = ?AUTO_2429 ?AUTO_2427 ) ) ( not ( = ?AUTO_2430 ?AUTO_2427 ) ) ( not ( = ?AUTO_2426 ?AUTO_2427 ) ) ( not ( = ?AUTO_2425 ?AUTO_2427 ) ) ( not ( = ?AUTO_2428 ?AUTO_2427 ) ) ( ON ?AUTO_2427 ?AUTO_2428 ) ( CLEAR ?AUTO_2427 ) ( HOLDING ?AUTO_2431 ) ( not ( = ?AUTO_2423 ?AUTO_2431 ) ) ( not ( = ?AUTO_2424 ?AUTO_2431 ) ) ( not ( = ?AUTO_2429 ?AUTO_2431 ) ) ( not ( = ?AUTO_2430 ?AUTO_2431 ) ) ( not ( = ?AUTO_2426 ?AUTO_2431 ) ) ( not ( = ?AUTO_2425 ?AUTO_2431 ) ) ( not ( = ?AUTO_2428 ?AUTO_2431 ) ) ( not ( = ?AUTO_2427 ?AUTO_2431 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2431 )
      ( MAKE-ON ?AUTO_2423 ?AUTO_2424 )
      ( MAKE-ON-VERIFY ?AUTO_2423 ?AUTO_2424 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2432 - BLOCK
      ?AUTO_2433 - BLOCK
    )
    :vars
    (
      ?AUTO_2438 - BLOCK
      ?AUTO_2434 - BLOCK
      ?AUTO_2435 - BLOCK
      ?AUTO_2436 - BLOCK
      ?AUTO_2437 - BLOCK
      ?AUTO_2439 - BLOCK
      ?AUTO_2440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2432 ?AUTO_2433 ) ) ( ON ?AUTO_2432 ?AUTO_2438 ) ( not ( = ?AUTO_2432 ?AUTO_2438 ) ) ( not ( = ?AUTO_2433 ?AUTO_2438 ) ) ( not ( = ?AUTO_2432 ?AUTO_2434 ) ) ( not ( = ?AUTO_2432 ?AUTO_2435 ) ) ( not ( = ?AUTO_2433 ?AUTO_2434 ) ) ( not ( = ?AUTO_2433 ?AUTO_2435 ) ) ( not ( = ?AUTO_2438 ?AUTO_2434 ) ) ( not ( = ?AUTO_2438 ?AUTO_2435 ) ) ( not ( = ?AUTO_2434 ?AUTO_2435 ) ) ( ON ?AUTO_2434 ?AUTO_2433 ) ( ON ?AUTO_2435 ?AUTO_2432 ) ( CLEAR ?AUTO_2436 ) ( not ( = ?AUTO_2432 ?AUTO_2437 ) ) ( not ( = ?AUTO_2432 ?AUTO_2436 ) ) ( not ( = ?AUTO_2433 ?AUTO_2437 ) ) ( not ( = ?AUTO_2433 ?AUTO_2436 ) ) ( not ( = ?AUTO_2438 ?AUTO_2437 ) ) ( not ( = ?AUTO_2438 ?AUTO_2436 ) ) ( not ( = ?AUTO_2434 ?AUTO_2437 ) ) ( not ( = ?AUTO_2434 ?AUTO_2436 ) ) ( not ( = ?AUTO_2435 ?AUTO_2437 ) ) ( not ( = ?AUTO_2435 ?AUTO_2436 ) ) ( not ( = ?AUTO_2437 ?AUTO_2436 ) ) ( ON ?AUTO_2437 ?AUTO_2435 ) ( not ( = ?AUTO_2432 ?AUTO_2439 ) ) ( not ( = ?AUTO_2433 ?AUTO_2439 ) ) ( not ( = ?AUTO_2438 ?AUTO_2439 ) ) ( not ( = ?AUTO_2434 ?AUTO_2439 ) ) ( not ( = ?AUTO_2435 ?AUTO_2439 ) ) ( not ( = ?AUTO_2436 ?AUTO_2439 ) ) ( not ( = ?AUTO_2437 ?AUTO_2439 ) ) ( ON ?AUTO_2439 ?AUTO_2437 ) ( CLEAR ?AUTO_2439 ) ( not ( = ?AUTO_2432 ?AUTO_2440 ) ) ( not ( = ?AUTO_2433 ?AUTO_2440 ) ) ( not ( = ?AUTO_2438 ?AUTO_2440 ) ) ( not ( = ?AUTO_2434 ?AUTO_2440 ) ) ( not ( = ?AUTO_2435 ?AUTO_2440 ) ) ( not ( = ?AUTO_2436 ?AUTO_2440 ) ) ( not ( = ?AUTO_2437 ?AUTO_2440 ) ) ( not ( = ?AUTO_2439 ?AUTO_2440 ) ) ( ON ?AUTO_2440 ?AUTO_2434 ) ( CLEAR ?AUTO_2440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2440 ?AUTO_2434 )
      ( MAKE-ON ?AUTO_2432 ?AUTO_2433 )
      ( MAKE-ON-VERIFY ?AUTO_2432 ?AUTO_2433 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2441 - BLOCK
      ?AUTO_2442 - BLOCK
    )
    :vars
    (
      ?AUTO_2446 - BLOCK
      ?AUTO_2447 - BLOCK
      ?AUTO_2443 - BLOCK
      ?AUTO_2449 - BLOCK
      ?AUTO_2448 - BLOCK
      ?AUTO_2445 - BLOCK
      ?AUTO_2444 - BLOCK
      ?AUTO_2450 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2441 ?AUTO_2442 ) ) ( ON ?AUTO_2441 ?AUTO_2446 ) ( not ( = ?AUTO_2441 ?AUTO_2446 ) ) ( not ( = ?AUTO_2442 ?AUTO_2446 ) ) ( not ( = ?AUTO_2441 ?AUTO_2447 ) ) ( not ( = ?AUTO_2441 ?AUTO_2443 ) ) ( not ( = ?AUTO_2442 ?AUTO_2447 ) ) ( not ( = ?AUTO_2442 ?AUTO_2443 ) ) ( not ( = ?AUTO_2446 ?AUTO_2447 ) ) ( not ( = ?AUTO_2446 ?AUTO_2443 ) ) ( not ( = ?AUTO_2447 ?AUTO_2443 ) ) ( ON ?AUTO_2447 ?AUTO_2442 ) ( ON ?AUTO_2443 ?AUTO_2441 ) ( CLEAR ?AUTO_2449 ) ( not ( = ?AUTO_2441 ?AUTO_2448 ) ) ( not ( = ?AUTO_2441 ?AUTO_2449 ) ) ( not ( = ?AUTO_2442 ?AUTO_2448 ) ) ( not ( = ?AUTO_2442 ?AUTO_2449 ) ) ( not ( = ?AUTO_2446 ?AUTO_2448 ) ) ( not ( = ?AUTO_2446 ?AUTO_2449 ) ) ( not ( = ?AUTO_2447 ?AUTO_2448 ) ) ( not ( = ?AUTO_2447 ?AUTO_2449 ) ) ( not ( = ?AUTO_2443 ?AUTO_2448 ) ) ( not ( = ?AUTO_2443 ?AUTO_2449 ) ) ( not ( = ?AUTO_2448 ?AUTO_2449 ) ) ( ON ?AUTO_2448 ?AUTO_2443 ) ( not ( = ?AUTO_2441 ?AUTO_2445 ) ) ( not ( = ?AUTO_2442 ?AUTO_2445 ) ) ( not ( = ?AUTO_2446 ?AUTO_2445 ) ) ( not ( = ?AUTO_2447 ?AUTO_2445 ) ) ( not ( = ?AUTO_2443 ?AUTO_2445 ) ) ( not ( = ?AUTO_2449 ?AUTO_2445 ) ) ( not ( = ?AUTO_2448 ?AUTO_2445 ) ) ( ON ?AUTO_2445 ?AUTO_2448 ) ( CLEAR ?AUTO_2445 ) ( not ( = ?AUTO_2441 ?AUTO_2444 ) ) ( not ( = ?AUTO_2442 ?AUTO_2444 ) ) ( not ( = ?AUTO_2446 ?AUTO_2444 ) ) ( not ( = ?AUTO_2447 ?AUTO_2444 ) ) ( not ( = ?AUTO_2443 ?AUTO_2444 ) ) ( not ( = ?AUTO_2449 ?AUTO_2444 ) ) ( not ( = ?AUTO_2448 ?AUTO_2444 ) ) ( not ( = ?AUTO_2445 ?AUTO_2444 ) ) ( ON ?AUTO_2444 ?AUTO_2447 ) ( CLEAR ?AUTO_2444 ) ( HOLDING ?AUTO_2450 ) ( not ( = ?AUTO_2441 ?AUTO_2450 ) ) ( not ( = ?AUTO_2442 ?AUTO_2450 ) ) ( not ( = ?AUTO_2446 ?AUTO_2450 ) ) ( not ( = ?AUTO_2447 ?AUTO_2450 ) ) ( not ( = ?AUTO_2443 ?AUTO_2450 ) ) ( not ( = ?AUTO_2449 ?AUTO_2450 ) ) ( not ( = ?AUTO_2448 ?AUTO_2450 ) ) ( not ( = ?AUTO_2445 ?AUTO_2450 ) ) ( not ( = ?AUTO_2444 ?AUTO_2450 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2450 )
      ( MAKE-ON ?AUTO_2441 ?AUTO_2442 )
      ( MAKE-ON-VERIFY ?AUTO_2441 ?AUTO_2442 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2451 - BLOCK
      ?AUTO_2452 - BLOCK
    )
    :vars
    (
      ?AUTO_2457 - BLOCK
      ?AUTO_2456 - BLOCK
      ?AUTO_2454 - BLOCK
      ?AUTO_2459 - BLOCK
      ?AUTO_2455 - BLOCK
      ?AUTO_2458 - BLOCK
      ?AUTO_2453 - BLOCK
      ?AUTO_2460 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2451 ?AUTO_2452 ) ) ( ON ?AUTO_2451 ?AUTO_2457 ) ( not ( = ?AUTO_2451 ?AUTO_2457 ) ) ( not ( = ?AUTO_2452 ?AUTO_2457 ) ) ( not ( = ?AUTO_2451 ?AUTO_2456 ) ) ( not ( = ?AUTO_2451 ?AUTO_2454 ) ) ( not ( = ?AUTO_2452 ?AUTO_2456 ) ) ( not ( = ?AUTO_2452 ?AUTO_2454 ) ) ( not ( = ?AUTO_2457 ?AUTO_2456 ) ) ( not ( = ?AUTO_2457 ?AUTO_2454 ) ) ( not ( = ?AUTO_2456 ?AUTO_2454 ) ) ( ON ?AUTO_2456 ?AUTO_2452 ) ( ON ?AUTO_2454 ?AUTO_2451 ) ( CLEAR ?AUTO_2459 ) ( not ( = ?AUTO_2451 ?AUTO_2455 ) ) ( not ( = ?AUTO_2451 ?AUTO_2459 ) ) ( not ( = ?AUTO_2452 ?AUTO_2455 ) ) ( not ( = ?AUTO_2452 ?AUTO_2459 ) ) ( not ( = ?AUTO_2457 ?AUTO_2455 ) ) ( not ( = ?AUTO_2457 ?AUTO_2459 ) ) ( not ( = ?AUTO_2456 ?AUTO_2455 ) ) ( not ( = ?AUTO_2456 ?AUTO_2459 ) ) ( not ( = ?AUTO_2454 ?AUTO_2455 ) ) ( not ( = ?AUTO_2454 ?AUTO_2459 ) ) ( not ( = ?AUTO_2455 ?AUTO_2459 ) ) ( ON ?AUTO_2455 ?AUTO_2454 ) ( not ( = ?AUTO_2451 ?AUTO_2458 ) ) ( not ( = ?AUTO_2452 ?AUTO_2458 ) ) ( not ( = ?AUTO_2457 ?AUTO_2458 ) ) ( not ( = ?AUTO_2456 ?AUTO_2458 ) ) ( not ( = ?AUTO_2454 ?AUTO_2458 ) ) ( not ( = ?AUTO_2459 ?AUTO_2458 ) ) ( not ( = ?AUTO_2455 ?AUTO_2458 ) ) ( ON ?AUTO_2458 ?AUTO_2455 ) ( CLEAR ?AUTO_2458 ) ( not ( = ?AUTO_2451 ?AUTO_2453 ) ) ( not ( = ?AUTO_2452 ?AUTO_2453 ) ) ( not ( = ?AUTO_2457 ?AUTO_2453 ) ) ( not ( = ?AUTO_2456 ?AUTO_2453 ) ) ( not ( = ?AUTO_2454 ?AUTO_2453 ) ) ( not ( = ?AUTO_2459 ?AUTO_2453 ) ) ( not ( = ?AUTO_2455 ?AUTO_2453 ) ) ( not ( = ?AUTO_2458 ?AUTO_2453 ) ) ( ON ?AUTO_2453 ?AUTO_2456 ) ( not ( = ?AUTO_2451 ?AUTO_2460 ) ) ( not ( = ?AUTO_2452 ?AUTO_2460 ) ) ( not ( = ?AUTO_2457 ?AUTO_2460 ) ) ( not ( = ?AUTO_2456 ?AUTO_2460 ) ) ( not ( = ?AUTO_2454 ?AUTO_2460 ) ) ( not ( = ?AUTO_2459 ?AUTO_2460 ) ) ( not ( = ?AUTO_2455 ?AUTO_2460 ) ) ( not ( = ?AUTO_2458 ?AUTO_2460 ) ) ( not ( = ?AUTO_2453 ?AUTO_2460 ) ) ( ON ?AUTO_2460 ?AUTO_2453 ) ( CLEAR ?AUTO_2460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2460 ?AUTO_2453 )
      ( MAKE-ON ?AUTO_2451 ?AUTO_2452 )
      ( MAKE-ON-VERIFY ?AUTO_2451 ?AUTO_2452 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2462 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2462 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2462 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2462 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2463 - BLOCK
    )
    :vars
    (
      ?AUTO_2464 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2463 ?AUTO_2464 ) ( CLEAR ?AUTO_2463 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2463 ?AUTO_2464 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2463 ?AUTO_2464 )
      ( MAKE-ON-TABLE ?AUTO_2463 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2463 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2466 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2466 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2466 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2466 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2467 - BLOCK
    )
    :vars
    (
      ?AUTO_2468 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2467 ?AUTO_2468 ) ( CLEAR ?AUTO_2467 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2467 ?AUTO_2468 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2467 ?AUTO_2468 )
      ( MAKE-ON-TABLE ?AUTO_2467 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2467 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2469 - BLOCK
    )
    :vars
    (
      ?AUTO_2470 - BLOCK
      ?AUTO_2471 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2469 ?AUTO_2470 ) ( CLEAR ?AUTO_2469 ) ( not ( = ?AUTO_2469 ?AUTO_2470 ) ) ( HOLDING ?AUTO_2471 ) ( not ( = ?AUTO_2469 ?AUTO_2471 ) ) ( not ( = ?AUTO_2470 ?AUTO_2471 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2471 )
      ( MAKE-ON-TABLE ?AUTO_2469 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2469 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2472 - BLOCK
    )
    :vars
    (
      ?AUTO_2473 - BLOCK
      ?AUTO_2474 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2472 ?AUTO_2473 ) ( not ( = ?AUTO_2472 ?AUTO_2473 ) ) ( not ( = ?AUTO_2472 ?AUTO_2474 ) ) ( not ( = ?AUTO_2473 ?AUTO_2474 ) ) ( ON ?AUTO_2474 ?AUTO_2472 ) ( CLEAR ?AUTO_2474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2474 ?AUTO_2472 )
      ( MAKE-ON-TABLE ?AUTO_2472 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2472 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2477 - BLOCK
      ?AUTO_2478 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2477 ) ( CLEAR ?AUTO_2478 ) ( not ( = ?AUTO_2477 ?AUTO_2478 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2477 ?AUTO_2478 )
      ( MAKE-ON-VERIFY ?AUTO_2477 ?AUTO_2478 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2479 - BLOCK
      ?AUTO_2480 - BLOCK
    )
    :vars
    (
      ?AUTO_2481 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2480 ) ( not ( = ?AUTO_2479 ?AUTO_2480 ) ) ( ON ?AUTO_2479 ?AUTO_2481 ) ( CLEAR ?AUTO_2479 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2479 ?AUTO_2481 ) ) ( not ( = ?AUTO_2480 ?AUTO_2481 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2479 ?AUTO_2481 )
      ( MAKE-ON ?AUTO_2479 ?AUTO_2480 )
      ( MAKE-ON-VERIFY ?AUTO_2479 ?AUTO_2480 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2482 - BLOCK
      ?AUTO_2483 - BLOCK
    )
    :vars
    (
      ?AUTO_2484 - BLOCK
      ?AUTO_2485 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2483 ) ( not ( = ?AUTO_2482 ?AUTO_2483 ) ) ( ON ?AUTO_2482 ?AUTO_2484 ) ( CLEAR ?AUTO_2482 ) ( not ( = ?AUTO_2482 ?AUTO_2484 ) ) ( not ( = ?AUTO_2483 ?AUTO_2484 ) ) ( HOLDING ?AUTO_2485 ) ( not ( = ?AUTO_2482 ?AUTO_2485 ) ) ( not ( = ?AUTO_2483 ?AUTO_2485 ) ) ( not ( = ?AUTO_2484 ?AUTO_2485 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2485 )
      ( MAKE-ON ?AUTO_2482 ?AUTO_2483 )
      ( MAKE-ON-VERIFY ?AUTO_2482 ?AUTO_2483 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2486 - BLOCK
      ?AUTO_2487 - BLOCK
    )
    :vars
    (
      ?AUTO_2488 - BLOCK
      ?AUTO_2489 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2487 ) ( not ( = ?AUTO_2486 ?AUTO_2487 ) ) ( ON ?AUTO_2486 ?AUTO_2488 ) ( not ( = ?AUTO_2486 ?AUTO_2488 ) ) ( not ( = ?AUTO_2487 ?AUTO_2488 ) ) ( not ( = ?AUTO_2486 ?AUTO_2489 ) ) ( not ( = ?AUTO_2487 ?AUTO_2489 ) ) ( not ( = ?AUTO_2488 ?AUTO_2489 ) ) ( ON ?AUTO_2489 ?AUTO_2486 ) ( CLEAR ?AUTO_2489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2489 ?AUTO_2486 )
      ( MAKE-ON ?AUTO_2486 ?AUTO_2487 )
      ( MAKE-ON-VERIFY ?AUTO_2486 ?AUTO_2487 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2490 - BLOCK
      ?AUTO_2491 - BLOCK
    )
    :vars
    (
      ?AUTO_2492 - BLOCK
      ?AUTO_2493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2490 ?AUTO_2491 ) ) ( ON ?AUTO_2490 ?AUTO_2492 ) ( not ( = ?AUTO_2490 ?AUTO_2492 ) ) ( not ( = ?AUTO_2491 ?AUTO_2492 ) ) ( not ( = ?AUTO_2490 ?AUTO_2493 ) ) ( not ( = ?AUTO_2491 ?AUTO_2493 ) ) ( not ( = ?AUTO_2492 ?AUTO_2493 ) ) ( ON ?AUTO_2493 ?AUTO_2490 ) ( CLEAR ?AUTO_2493 ) ( HOLDING ?AUTO_2491 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2491 )
      ( MAKE-ON ?AUTO_2490 ?AUTO_2491 )
      ( MAKE-ON-VERIFY ?AUTO_2490 ?AUTO_2491 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2494 - BLOCK
      ?AUTO_2495 - BLOCK
    )
    :vars
    (
      ?AUTO_2497 - BLOCK
      ?AUTO_2496 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2494 ?AUTO_2495 ) ) ( ON ?AUTO_2494 ?AUTO_2497 ) ( not ( = ?AUTO_2494 ?AUTO_2497 ) ) ( not ( = ?AUTO_2495 ?AUTO_2497 ) ) ( not ( = ?AUTO_2494 ?AUTO_2496 ) ) ( not ( = ?AUTO_2495 ?AUTO_2496 ) ) ( not ( = ?AUTO_2497 ?AUTO_2496 ) ) ( ON ?AUTO_2496 ?AUTO_2494 ) ( ON ?AUTO_2495 ?AUTO_2496 ) ( CLEAR ?AUTO_2495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2495 ?AUTO_2496 )
      ( MAKE-ON ?AUTO_2494 ?AUTO_2495 )
      ( MAKE-ON-VERIFY ?AUTO_2494 ?AUTO_2495 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2499 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2499 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2499 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2499 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2500 - BLOCK
    )
    :vars
    (
      ?AUTO_2501 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2500 ?AUTO_2501 ) ( CLEAR ?AUTO_2500 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2500 ?AUTO_2501 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2500 ?AUTO_2501 )
      ( MAKE-ON-TABLE ?AUTO_2500 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2500 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2502 - BLOCK
    )
    :vars
    (
      ?AUTO_2503 - BLOCK
      ?AUTO_2504 - BLOCK
      ?AUTO_2505 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2502 ?AUTO_2503 ) ( CLEAR ?AUTO_2502 ) ( not ( = ?AUTO_2502 ?AUTO_2503 ) ) ( HOLDING ?AUTO_2504 ) ( CLEAR ?AUTO_2505 ) ( not ( = ?AUTO_2502 ?AUTO_2504 ) ) ( not ( = ?AUTO_2502 ?AUTO_2505 ) ) ( not ( = ?AUTO_2503 ?AUTO_2504 ) ) ( not ( = ?AUTO_2503 ?AUTO_2505 ) ) ( not ( = ?AUTO_2504 ?AUTO_2505 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2504 ?AUTO_2505 )
      ( MAKE-ON-TABLE ?AUTO_2502 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2502 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2506 - BLOCK
    )
    :vars
    (
      ?AUTO_2507 - BLOCK
      ?AUTO_2509 - BLOCK
      ?AUTO_2508 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2506 ?AUTO_2507 ) ( not ( = ?AUTO_2506 ?AUTO_2507 ) ) ( CLEAR ?AUTO_2509 ) ( not ( = ?AUTO_2506 ?AUTO_2508 ) ) ( not ( = ?AUTO_2506 ?AUTO_2509 ) ) ( not ( = ?AUTO_2507 ?AUTO_2508 ) ) ( not ( = ?AUTO_2507 ?AUTO_2509 ) ) ( not ( = ?AUTO_2508 ?AUTO_2509 ) ) ( ON ?AUTO_2508 ?AUTO_2506 ) ( CLEAR ?AUTO_2508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2508 ?AUTO_2506 )
      ( MAKE-ON-TABLE ?AUTO_2506 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2506 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2510 - BLOCK
    )
    :vars
    (
      ?AUTO_2511 - BLOCK
      ?AUTO_2513 - BLOCK
      ?AUTO_2512 - BLOCK
      ?AUTO_2514 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2510 ?AUTO_2511 ) ( not ( = ?AUTO_2510 ?AUTO_2511 ) ) ( CLEAR ?AUTO_2513 ) ( not ( = ?AUTO_2510 ?AUTO_2512 ) ) ( not ( = ?AUTO_2510 ?AUTO_2513 ) ) ( not ( = ?AUTO_2511 ?AUTO_2512 ) ) ( not ( = ?AUTO_2511 ?AUTO_2513 ) ) ( not ( = ?AUTO_2512 ?AUTO_2513 ) ) ( ON ?AUTO_2512 ?AUTO_2510 ) ( CLEAR ?AUTO_2512 ) ( HOLDING ?AUTO_2514 ) ( not ( = ?AUTO_2510 ?AUTO_2514 ) ) ( not ( = ?AUTO_2511 ?AUTO_2514 ) ) ( not ( = ?AUTO_2513 ?AUTO_2514 ) ) ( not ( = ?AUTO_2512 ?AUTO_2514 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2514 )
      ( MAKE-ON-TABLE ?AUTO_2510 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2510 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2515 - BLOCK
    )
    :vars
    (
      ?AUTO_2516 - BLOCK
      ?AUTO_2519 - BLOCK
      ?AUTO_2517 - BLOCK
      ?AUTO_2518 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2515 ?AUTO_2516 ) ( not ( = ?AUTO_2515 ?AUTO_2516 ) ) ( CLEAR ?AUTO_2519 ) ( not ( = ?AUTO_2515 ?AUTO_2517 ) ) ( not ( = ?AUTO_2515 ?AUTO_2519 ) ) ( not ( = ?AUTO_2516 ?AUTO_2517 ) ) ( not ( = ?AUTO_2516 ?AUTO_2519 ) ) ( not ( = ?AUTO_2517 ?AUTO_2519 ) ) ( ON ?AUTO_2517 ?AUTO_2515 ) ( not ( = ?AUTO_2515 ?AUTO_2518 ) ) ( not ( = ?AUTO_2516 ?AUTO_2518 ) ) ( not ( = ?AUTO_2519 ?AUTO_2518 ) ) ( not ( = ?AUTO_2517 ?AUTO_2518 ) ) ( ON ?AUTO_2518 ?AUTO_2517 ) ( CLEAR ?AUTO_2518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2518 ?AUTO_2517 )
      ( MAKE-ON-TABLE ?AUTO_2515 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2515 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2520 - BLOCK
    )
    :vars
    (
      ?AUTO_2524 - BLOCK
      ?AUTO_2522 - BLOCK
      ?AUTO_2523 - BLOCK
      ?AUTO_2521 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2520 ?AUTO_2524 ) ( not ( = ?AUTO_2520 ?AUTO_2524 ) ) ( not ( = ?AUTO_2520 ?AUTO_2522 ) ) ( not ( = ?AUTO_2520 ?AUTO_2523 ) ) ( not ( = ?AUTO_2524 ?AUTO_2522 ) ) ( not ( = ?AUTO_2524 ?AUTO_2523 ) ) ( not ( = ?AUTO_2522 ?AUTO_2523 ) ) ( ON ?AUTO_2522 ?AUTO_2520 ) ( not ( = ?AUTO_2520 ?AUTO_2521 ) ) ( not ( = ?AUTO_2524 ?AUTO_2521 ) ) ( not ( = ?AUTO_2523 ?AUTO_2521 ) ) ( not ( = ?AUTO_2522 ?AUTO_2521 ) ) ( ON ?AUTO_2521 ?AUTO_2522 ) ( CLEAR ?AUTO_2521 ) ( HOLDING ?AUTO_2523 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2523 )
      ( MAKE-ON-TABLE ?AUTO_2520 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2520 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2525 - BLOCK
    )
    :vars
    (
      ?AUTO_2528 - BLOCK
      ?AUTO_2526 - BLOCK
      ?AUTO_2529 - BLOCK
      ?AUTO_2527 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2525 ?AUTO_2528 ) ( not ( = ?AUTO_2525 ?AUTO_2528 ) ) ( not ( = ?AUTO_2525 ?AUTO_2526 ) ) ( not ( = ?AUTO_2525 ?AUTO_2529 ) ) ( not ( = ?AUTO_2528 ?AUTO_2526 ) ) ( not ( = ?AUTO_2528 ?AUTO_2529 ) ) ( not ( = ?AUTO_2526 ?AUTO_2529 ) ) ( ON ?AUTO_2526 ?AUTO_2525 ) ( not ( = ?AUTO_2525 ?AUTO_2527 ) ) ( not ( = ?AUTO_2528 ?AUTO_2527 ) ) ( not ( = ?AUTO_2529 ?AUTO_2527 ) ) ( not ( = ?AUTO_2526 ?AUTO_2527 ) ) ( ON ?AUTO_2527 ?AUTO_2526 ) ( ON ?AUTO_2529 ?AUTO_2527 ) ( CLEAR ?AUTO_2529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2529 ?AUTO_2527 )
      ( MAKE-ON-TABLE ?AUTO_2525 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2525 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2532 - BLOCK
      ?AUTO_2533 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2532 ) ( CLEAR ?AUTO_2533 ) ( not ( = ?AUTO_2532 ?AUTO_2533 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2532 ?AUTO_2533 )
      ( MAKE-ON-VERIFY ?AUTO_2532 ?AUTO_2533 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2534 - BLOCK
      ?AUTO_2535 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2535 ) ( not ( = ?AUTO_2534 ?AUTO_2535 ) ) ( ON-TABLE ?AUTO_2534 ) ( CLEAR ?AUTO_2534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2534 )
      ( MAKE-ON ?AUTO_2534 ?AUTO_2535 )
      ( MAKE-ON-VERIFY ?AUTO_2534 ?AUTO_2535 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2536 - BLOCK
      ?AUTO_2537 - BLOCK
    )
    :vars
    (
      ?AUTO_2538 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2537 ) ( not ( = ?AUTO_2536 ?AUTO_2537 ) ) ( ON-TABLE ?AUTO_2536 ) ( CLEAR ?AUTO_2536 ) ( HOLDING ?AUTO_2538 ) ( not ( = ?AUTO_2536 ?AUTO_2538 ) ) ( not ( = ?AUTO_2537 ?AUTO_2538 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2538 )
      ( MAKE-ON ?AUTO_2536 ?AUTO_2537 )
      ( MAKE-ON-VERIFY ?AUTO_2536 ?AUTO_2537 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2539 - BLOCK
      ?AUTO_2540 - BLOCK
    )
    :vars
    (
      ?AUTO_2541 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2540 ) ( not ( = ?AUTO_2539 ?AUTO_2540 ) ) ( ON-TABLE ?AUTO_2539 ) ( not ( = ?AUTO_2539 ?AUTO_2541 ) ) ( not ( = ?AUTO_2540 ?AUTO_2541 ) ) ( ON ?AUTO_2541 ?AUTO_2539 ) ( CLEAR ?AUTO_2541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2541 ?AUTO_2539 )
      ( MAKE-ON ?AUTO_2539 ?AUTO_2540 )
      ( MAKE-ON-VERIFY ?AUTO_2539 ?AUTO_2540 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2542 - BLOCK
      ?AUTO_2543 - BLOCK
    )
    :vars
    (
      ?AUTO_2544 - BLOCK
      ?AUTO_2545 - BLOCK
      ?AUTO_2546 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2543 ) ( not ( = ?AUTO_2542 ?AUTO_2543 ) ) ( ON-TABLE ?AUTO_2542 ) ( not ( = ?AUTO_2542 ?AUTO_2544 ) ) ( not ( = ?AUTO_2543 ?AUTO_2544 ) ) ( ON ?AUTO_2544 ?AUTO_2542 ) ( CLEAR ?AUTO_2544 ) ( HOLDING ?AUTO_2545 ) ( CLEAR ?AUTO_2546 ) ( not ( = ?AUTO_2542 ?AUTO_2545 ) ) ( not ( = ?AUTO_2542 ?AUTO_2546 ) ) ( not ( = ?AUTO_2543 ?AUTO_2545 ) ) ( not ( = ?AUTO_2543 ?AUTO_2546 ) ) ( not ( = ?AUTO_2544 ?AUTO_2545 ) ) ( not ( = ?AUTO_2544 ?AUTO_2546 ) ) ( not ( = ?AUTO_2545 ?AUTO_2546 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2545 ?AUTO_2546 )
      ( MAKE-ON ?AUTO_2542 ?AUTO_2543 )
      ( MAKE-ON-VERIFY ?AUTO_2542 ?AUTO_2543 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2547 - BLOCK
      ?AUTO_2548 - BLOCK
    )
    :vars
    (
      ?AUTO_2549 - BLOCK
      ?AUTO_2550 - BLOCK
      ?AUTO_2551 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2548 ) ( not ( = ?AUTO_2547 ?AUTO_2548 ) ) ( ON-TABLE ?AUTO_2547 ) ( not ( = ?AUTO_2547 ?AUTO_2549 ) ) ( not ( = ?AUTO_2548 ?AUTO_2549 ) ) ( ON ?AUTO_2549 ?AUTO_2547 ) ( CLEAR ?AUTO_2550 ) ( not ( = ?AUTO_2547 ?AUTO_2551 ) ) ( not ( = ?AUTO_2547 ?AUTO_2550 ) ) ( not ( = ?AUTO_2548 ?AUTO_2551 ) ) ( not ( = ?AUTO_2548 ?AUTO_2550 ) ) ( not ( = ?AUTO_2549 ?AUTO_2551 ) ) ( not ( = ?AUTO_2549 ?AUTO_2550 ) ) ( not ( = ?AUTO_2551 ?AUTO_2550 ) ) ( ON ?AUTO_2551 ?AUTO_2549 ) ( CLEAR ?AUTO_2551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2551 ?AUTO_2549 )
      ( MAKE-ON ?AUTO_2547 ?AUTO_2548 )
      ( MAKE-ON-VERIFY ?AUTO_2547 ?AUTO_2548 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2552 - BLOCK
      ?AUTO_2553 - BLOCK
    )
    :vars
    (
      ?AUTO_2556 - BLOCK
      ?AUTO_2555 - BLOCK
      ?AUTO_2554 - BLOCK
      ?AUTO_2557 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2553 ) ( not ( = ?AUTO_2552 ?AUTO_2553 ) ) ( ON-TABLE ?AUTO_2552 ) ( not ( = ?AUTO_2552 ?AUTO_2556 ) ) ( not ( = ?AUTO_2553 ?AUTO_2556 ) ) ( ON ?AUTO_2556 ?AUTO_2552 ) ( CLEAR ?AUTO_2555 ) ( not ( = ?AUTO_2552 ?AUTO_2554 ) ) ( not ( = ?AUTO_2552 ?AUTO_2555 ) ) ( not ( = ?AUTO_2553 ?AUTO_2554 ) ) ( not ( = ?AUTO_2553 ?AUTO_2555 ) ) ( not ( = ?AUTO_2556 ?AUTO_2554 ) ) ( not ( = ?AUTO_2556 ?AUTO_2555 ) ) ( not ( = ?AUTO_2554 ?AUTO_2555 ) ) ( ON ?AUTO_2554 ?AUTO_2556 ) ( CLEAR ?AUTO_2554 ) ( HOLDING ?AUTO_2557 ) ( not ( = ?AUTO_2552 ?AUTO_2557 ) ) ( not ( = ?AUTO_2553 ?AUTO_2557 ) ) ( not ( = ?AUTO_2556 ?AUTO_2557 ) ) ( not ( = ?AUTO_2555 ?AUTO_2557 ) ) ( not ( = ?AUTO_2554 ?AUTO_2557 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2557 )
      ( MAKE-ON ?AUTO_2552 ?AUTO_2553 )
      ( MAKE-ON-VERIFY ?AUTO_2552 ?AUTO_2553 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2558 - BLOCK
      ?AUTO_2559 - BLOCK
    )
    :vars
    (
      ?AUTO_2562 - BLOCK
      ?AUTO_2560 - BLOCK
      ?AUTO_2561 - BLOCK
      ?AUTO_2563 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2559 ) ( not ( = ?AUTO_2558 ?AUTO_2559 ) ) ( ON-TABLE ?AUTO_2558 ) ( not ( = ?AUTO_2558 ?AUTO_2562 ) ) ( not ( = ?AUTO_2559 ?AUTO_2562 ) ) ( ON ?AUTO_2562 ?AUTO_2558 ) ( CLEAR ?AUTO_2560 ) ( not ( = ?AUTO_2558 ?AUTO_2561 ) ) ( not ( = ?AUTO_2558 ?AUTO_2560 ) ) ( not ( = ?AUTO_2559 ?AUTO_2561 ) ) ( not ( = ?AUTO_2559 ?AUTO_2560 ) ) ( not ( = ?AUTO_2562 ?AUTO_2561 ) ) ( not ( = ?AUTO_2562 ?AUTO_2560 ) ) ( not ( = ?AUTO_2561 ?AUTO_2560 ) ) ( ON ?AUTO_2561 ?AUTO_2562 ) ( not ( = ?AUTO_2558 ?AUTO_2563 ) ) ( not ( = ?AUTO_2559 ?AUTO_2563 ) ) ( not ( = ?AUTO_2562 ?AUTO_2563 ) ) ( not ( = ?AUTO_2560 ?AUTO_2563 ) ) ( not ( = ?AUTO_2561 ?AUTO_2563 ) ) ( ON ?AUTO_2563 ?AUTO_2561 ) ( CLEAR ?AUTO_2563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2563 ?AUTO_2561 )
      ( MAKE-ON ?AUTO_2558 ?AUTO_2559 )
      ( MAKE-ON-VERIFY ?AUTO_2558 ?AUTO_2559 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2564 - BLOCK
      ?AUTO_2565 - BLOCK
    )
    :vars
    (
      ?AUTO_2569 - BLOCK
      ?AUTO_2567 - BLOCK
      ?AUTO_2568 - BLOCK
      ?AUTO_2566 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2565 ) ( not ( = ?AUTO_2564 ?AUTO_2565 ) ) ( ON-TABLE ?AUTO_2564 ) ( not ( = ?AUTO_2564 ?AUTO_2569 ) ) ( not ( = ?AUTO_2565 ?AUTO_2569 ) ) ( ON ?AUTO_2569 ?AUTO_2564 ) ( not ( = ?AUTO_2564 ?AUTO_2567 ) ) ( not ( = ?AUTO_2564 ?AUTO_2568 ) ) ( not ( = ?AUTO_2565 ?AUTO_2567 ) ) ( not ( = ?AUTO_2565 ?AUTO_2568 ) ) ( not ( = ?AUTO_2569 ?AUTO_2567 ) ) ( not ( = ?AUTO_2569 ?AUTO_2568 ) ) ( not ( = ?AUTO_2567 ?AUTO_2568 ) ) ( ON ?AUTO_2567 ?AUTO_2569 ) ( not ( = ?AUTO_2564 ?AUTO_2566 ) ) ( not ( = ?AUTO_2565 ?AUTO_2566 ) ) ( not ( = ?AUTO_2569 ?AUTO_2566 ) ) ( not ( = ?AUTO_2568 ?AUTO_2566 ) ) ( not ( = ?AUTO_2567 ?AUTO_2566 ) ) ( ON ?AUTO_2566 ?AUTO_2567 ) ( CLEAR ?AUTO_2566 ) ( HOLDING ?AUTO_2568 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2568 )
      ( MAKE-ON ?AUTO_2564 ?AUTO_2565 )
      ( MAKE-ON-VERIFY ?AUTO_2564 ?AUTO_2565 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2570 - BLOCK
      ?AUTO_2571 - BLOCK
    )
    :vars
    (
      ?AUTO_2573 - BLOCK
      ?AUTO_2572 - BLOCK
      ?AUTO_2575 - BLOCK
      ?AUTO_2574 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2571 ) ( not ( = ?AUTO_2570 ?AUTO_2571 ) ) ( ON-TABLE ?AUTO_2570 ) ( not ( = ?AUTO_2570 ?AUTO_2573 ) ) ( not ( = ?AUTO_2571 ?AUTO_2573 ) ) ( ON ?AUTO_2573 ?AUTO_2570 ) ( not ( = ?AUTO_2570 ?AUTO_2572 ) ) ( not ( = ?AUTO_2570 ?AUTO_2575 ) ) ( not ( = ?AUTO_2571 ?AUTO_2572 ) ) ( not ( = ?AUTO_2571 ?AUTO_2575 ) ) ( not ( = ?AUTO_2573 ?AUTO_2572 ) ) ( not ( = ?AUTO_2573 ?AUTO_2575 ) ) ( not ( = ?AUTO_2572 ?AUTO_2575 ) ) ( ON ?AUTO_2572 ?AUTO_2573 ) ( not ( = ?AUTO_2570 ?AUTO_2574 ) ) ( not ( = ?AUTO_2571 ?AUTO_2574 ) ) ( not ( = ?AUTO_2573 ?AUTO_2574 ) ) ( not ( = ?AUTO_2575 ?AUTO_2574 ) ) ( not ( = ?AUTO_2572 ?AUTO_2574 ) ) ( ON ?AUTO_2574 ?AUTO_2572 ) ( ON ?AUTO_2575 ?AUTO_2574 ) ( CLEAR ?AUTO_2575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2575 ?AUTO_2574 )
      ( MAKE-ON ?AUTO_2570 ?AUTO_2571 )
      ( MAKE-ON-VERIFY ?AUTO_2570 ?AUTO_2571 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2577 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2577 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2577 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2577 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2578 - BLOCK
    )
    :vars
    (
      ?AUTO_2579 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2578 ?AUTO_2579 ) ( CLEAR ?AUTO_2578 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2578 ?AUTO_2579 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2578 ?AUTO_2579 )
      ( MAKE-ON-TABLE ?AUTO_2578 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2578 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2582 - BLOCK
      ?AUTO_2583 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2582 ) ( CLEAR ?AUTO_2583 ) ( not ( = ?AUTO_2582 ?AUTO_2583 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2582 ?AUTO_2583 )
      ( MAKE-ON-VERIFY ?AUTO_2582 ?AUTO_2583 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2584 - BLOCK
      ?AUTO_2585 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2585 ) ( not ( = ?AUTO_2584 ?AUTO_2585 ) ) ( ON-TABLE ?AUTO_2584 ) ( CLEAR ?AUTO_2584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2584 )
      ( MAKE-ON ?AUTO_2584 ?AUTO_2585 )
      ( MAKE-ON-VERIFY ?AUTO_2584 ?AUTO_2585 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2586 - BLOCK
      ?AUTO_2587 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2586 ?AUTO_2587 ) ) ( ON-TABLE ?AUTO_2586 ) ( CLEAR ?AUTO_2586 ) ( HOLDING ?AUTO_2587 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2587 )
      ( MAKE-ON ?AUTO_2586 ?AUTO_2587 )
      ( MAKE-ON-VERIFY ?AUTO_2586 ?AUTO_2587 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2592 - BLOCK
      ?AUTO_2593 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2592 ) ( CLEAR ?AUTO_2593 ) ( not ( = ?AUTO_2592 ?AUTO_2593 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2592 ?AUTO_2593 )
      ( MAKE-ON-VERIFY ?AUTO_2592 ?AUTO_2593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2594 - BLOCK
      ?AUTO_2595 - BLOCK
    )
    :vars
    (
      ?AUTO_2596 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2595 ) ( not ( = ?AUTO_2594 ?AUTO_2595 ) ) ( ON ?AUTO_2594 ?AUTO_2596 ) ( CLEAR ?AUTO_2594 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2594 ?AUTO_2596 ) ) ( not ( = ?AUTO_2595 ?AUTO_2596 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2594 ?AUTO_2596 )
      ( MAKE-ON ?AUTO_2594 ?AUTO_2595 )
      ( MAKE-ON-VERIFY ?AUTO_2594 ?AUTO_2595 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2597 - BLOCK
      ?AUTO_2598 - BLOCK
    )
    :vars
    (
      ?AUTO_2599 - BLOCK
      ?AUTO_2600 - BLOCK
      ?AUTO_2601 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2598 ) ( not ( = ?AUTO_2597 ?AUTO_2598 ) ) ( ON ?AUTO_2597 ?AUTO_2599 ) ( CLEAR ?AUTO_2597 ) ( not ( = ?AUTO_2597 ?AUTO_2599 ) ) ( not ( = ?AUTO_2598 ?AUTO_2599 ) ) ( HOLDING ?AUTO_2600 ) ( CLEAR ?AUTO_2601 ) ( not ( = ?AUTO_2597 ?AUTO_2600 ) ) ( not ( = ?AUTO_2597 ?AUTO_2601 ) ) ( not ( = ?AUTO_2598 ?AUTO_2600 ) ) ( not ( = ?AUTO_2598 ?AUTO_2601 ) ) ( not ( = ?AUTO_2599 ?AUTO_2600 ) ) ( not ( = ?AUTO_2599 ?AUTO_2601 ) ) ( not ( = ?AUTO_2600 ?AUTO_2601 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2600 ?AUTO_2601 )
      ( MAKE-ON ?AUTO_2597 ?AUTO_2598 )
      ( MAKE-ON-VERIFY ?AUTO_2597 ?AUTO_2598 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2606 - BLOCK
      ?AUTO_2607 - BLOCK
    )
    :vars
    (
      ?AUTO_2610 - BLOCK
      ?AUTO_2609 - BLOCK
      ?AUTO_2608 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2607 ) ( not ( = ?AUTO_2606 ?AUTO_2607 ) ) ( ON ?AUTO_2606 ?AUTO_2610 ) ( not ( = ?AUTO_2606 ?AUTO_2610 ) ) ( not ( = ?AUTO_2607 ?AUTO_2610 ) ) ( CLEAR ?AUTO_2609 ) ( not ( = ?AUTO_2606 ?AUTO_2608 ) ) ( not ( = ?AUTO_2606 ?AUTO_2609 ) ) ( not ( = ?AUTO_2607 ?AUTO_2608 ) ) ( not ( = ?AUTO_2607 ?AUTO_2609 ) ) ( not ( = ?AUTO_2610 ?AUTO_2608 ) ) ( not ( = ?AUTO_2610 ?AUTO_2609 ) ) ( not ( = ?AUTO_2608 ?AUTO_2609 ) ) ( ON ?AUTO_2608 ?AUTO_2606 ) ( CLEAR ?AUTO_2608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2608 ?AUTO_2606 )
      ( MAKE-ON ?AUTO_2606 ?AUTO_2607 )
      ( MAKE-ON-VERIFY ?AUTO_2606 ?AUTO_2607 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2613 - BLOCK
      ?AUTO_2614 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2613 ) ( CLEAR ?AUTO_2614 ) ( not ( = ?AUTO_2613 ?AUTO_2614 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2613 ?AUTO_2614 )
      ( MAKE-ON-VERIFY ?AUTO_2613 ?AUTO_2614 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2615 - BLOCK
      ?AUTO_2616 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2616 ) ( not ( = ?AUTO_2615 ?AUTO_2616 ) ) ( ON-TABLE ?AUTO_2615 ) ( CLEAR ?AUTO_2615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2615 )
      ( MAKE-ON ?AUTO_2615 ?AUTO_2616 )
      ( MAKE-ON-VERIFY ?AUTO_2615 ?AUTO_2616 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2617 - BLOCK
      ?AUTO_2618 - BLOCK
    )
    :vars
    (
      ?AUTO_2619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2617 ?AUTO_2618 ) ) ( ON-TABLE ?AUTO_2617 ) ( CLEAR ?AUTO_2617 ) ( HOLDING ?AUTO_2618 ) ( CLEAR ?AUTO_2619 ) ( not ( = ?AUTO_2617 ?AUTO_2619 ) ) ( not ( = ?AUTO_2618 ?AUTO_2619 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2618 ?AUTO_2619 )
      ( MAKE-ON ?AUTO_2617 ?AUTO_2618 )
      ( MAKE-ON-VERIFY ?AUTO_2617 ?AUTO_2618 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2620 - BLOCK
      ?AUTO_2621 - BLOCK
    )
    :vars
    (
      ?AUTO_2622 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2620 ?AUTO_2621 ) ) ( ON-TABLE ?AUTO_2620 ) ( CLEAR ?AUTO_2622 ) ( not ( = ?AUTO_2620 ?AUTO_2622 ) ) ( not ( = ?AUTO_2621 ?AUTO_2622 ) ) ( ON ?AUTO_2621 ?AUTO_2620 ) ( CLEAR ?AUTO_2621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2621 ?AUTO_2620 )
      ( MAKE-ON ?AUTO_2620 ?AUTO_2621 )
      ( MAKE-ON-VERIFY ?AUTO_2620 ?AUTO_2621 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2623 - BLOCK
      ?AUTO_2624 - BLOCK
    )
    :vars
    (
      ?AUTO_2625 - BLOCK
      ?AUTO_2626 - BLOCK
      ?AUTO_2627 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2623 ?AUTO_2624 ) ) ( ON-TABLE ?AUTO_2623 ) ( CLEAR ?AUTO_2625 ) ( not ( = ?AUTO_2623 ?AUTO_2625 ) ) ( not ( = ?AUTO_2624 ?AUTO_2625 ) ) ( ON ?AUTO_2624 ?AUTO_2623 ) ( CLEAR ?AUTO_2624 ) ( HOLDING ?AUTO_2626 ) ( CLEAR ?AUTO_2627 ) ( not ( = ?AUTO_2623 ?AUTO_2626 ) ) ( not ( = ?AUTO_2623 ?AUTO_2627 ) ) ( not ( = ?AUTO_2624 ?AUTO_2626 ) ) ( not ( = ?AUTO_2624 ?AUTO_2627 ) ) ( not ( = ?AUTO_2625 ?AUTO_2626 ) ) ( not ( = ?AUTO_2625 ?AUTO_2627 ) ) ( not ( = ?AUTO_2626 ?AUTO_2627 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2626 ?AUTO_2627 )
      ( MAKE-ON ?AUTO_2623 ?AUTO_2624 )
      ( MAKE-ON-VERIFY ?AUTO_2623 ?AUTO_2624 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2632 - BLOCK
      ?AUTO_2633 - BLOCK
    )
    :vars
    (
      ?AUTO_2636 - BLOCK
      ?AUTO_2634 - BLOCK
      ?AUTO_2635 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2632 ?AUTO_2633 ) ) ( ON-TABLE ?AUTO_2632 ) ( CLEAR ?AUTO_2636 ) ( not ( = ?AUTO_2632 ?AUTO_2636 ) ) ( not ( = ?AUTO_2633 ?AUTO_2636 ) ) ( ON ?AUTO_2633 ?AUTO_2632 ) ( CLEAR ?AUTO_2634 ) ( not ( = ?AUTO_2632 ?AUTO_2635 ) ) ( not ( = ?AUTO_2632 ?AUTO_2634 ) ) ( not ( = ?AUTO_2633 ?AUTO_2635 ) ) ( not ( = ?AUTO_2633 ?AUTO_2634 ) ) ( not ( = ?AUTO_2636 ?AUTO_2635 ) ) ( not ( = ?AUTO_2636 ?AUTO_2634 ) ) ( not ( = ?AUTO_2635 ?AUTO_2634 ) ) ( ON ?AUTO_2635 ?AUTO_2633 ) ( CLEAR ?AUTO_2635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2635 ?AUTO_2633 )
      ( MAKE-ON ?AUTO_2632 ?AUTO_2633 )
      ( MAKE-ON-VERIFY ?AUTO_2632 ?AUTO_2633 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2639 - BLOCK
      ?AUTO_2640 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2639 ) ( CLEAR ?AUTO_2640 ) ( not ( = ?AUTO_2639 ?AUTO_2640 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2639 ?AUTO_2640 )
      ( MAKE-ON-VERIFY ?AUTO_2639 ?AUTO_2640 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2641 - BLOCK
      ?AUTO_2642 - BLOCK
    )
    :vars
    (
      ?AUTO_2643 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2642 ) ( not ( = ?AUTO_2641 ?AUTO_2642 ) ) ( ON ?AUTO_2641 ?AUTO_2643 ) ( CLEAR ?AUTO_2641 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2641 ?AUTO_2643 ) ) ( not ( = ?AUTO_2642 ?AUTO_2643 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2641 ?AUTO_2643 )
      ( MAKE-ON ?AUTO_2641 ?AUTO_2642 )
      ( MAKE-ON-VERIFY ?AUTO_2641 ?AUTO_2642 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2644 - BLOCK
      ?AUTO_2645 - BLOCK
    )
    :vars
    (
      ?AUTO_2646 - BLOCK
      ?AUTO_2647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2644 ?AUTO_2645 ) ) ( ON ?AUTO_2644 ?AUTO_2646 ) ( CLEAR ?AUTO_2644 ) ( not ( = ?AUTO_2644 ?AUTO_2646 ) ) ( not ( = ?AUTO_2645 ?AUTO_2646 ) ) ( HOLDING ?AUTO_2645 ) ( CLEAR ?AUTO_2647 ) ( not ( = ?AUTO_2644 ?AUTO_2647 ) ) ( not ( = ?AUTO_2645 ?AUTO_2647 ) ) ( not ( = ?AUTO_2646 ?AUTO_2647 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2645 ?AUTO_2647 )
      ( MAKE-ON ?AUTO_2644 ?AUTO_2645 )
      ( MAKE-ON-VERIFY ?AUTO_2644 ?AUTO_2645 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2650 - BLOCK
      ?AUTO_2651 - BLOCK
    )
    :vars
    (
      ?AUTO_2652 - BLOCK
      ?AUTO_2653 - BLOCK
      ?AUTO_2654 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2651 ) ( not ( = ?AUTO_2650 ?AUTO_2651 ) ) ( ON ?AUTO_2650 ?AUTO_2652 ) ( CLEAR ?AUTO_2650 ) ( not ( = ?AUTO_2650 ?AUTO_2652 ) ) ( not ( = ?AUTO_2651 ?AUTO_2652 ) ) ( HOLDING ?AUTO_2653 ) ( CLEAR ?AUTO_2654 ) ( not ( = ?AUTO_2650 ?AUTO_2653 ) ) ( not ( = ?AUTO_2650 ?AUTO_2654 ) ) ( not ( = ?AUTO_2651 ?AUTO_2653 ) ) ( not ( = ?AUTO_2651 ?AUTO_2654 ) ) ( not ( = ?AUTO_2652 ?AUTO_2653 ) ) ( not ( = ?AUTO_2652 ?AUTO_2654 ) ) ( not ( = ?AUTO_2653 ?AUTO_2654 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2653 ?AUTO_2654 )
      ( MAKE-ON ?AUTO_2650 ?AUTO_2651 )
      ( MAKE-ON-VERIFY ?AUTO_2650 ?AUTO_2651 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2655 - BLOCK
      ?AUTO_2656 - BLOCK
    )
    :vars
    (
      ?AUTO_2657 - BLOCK
      ?AUTO_2658 - BLOCK
      ?AUTO_2659 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2655 ?AUTO_2656 ) ) ( ON ?AUTO_2655 ?AUTO_2657 ) ( CLEAR ?AUTO_2655 ) ( not ( = ?AUTO_2655 ?AUTO_2657 ) ) ( not ( = ?AUTO_2656 ?AUTO_2657 ) ) ( CLEAR ?AUTO_2658 ) ( not ( = ?AUTO_2655 ?AUTO_2659 ) ) ( not ( = ?AUTO_2655 ?AUTO_2658 ) ) ( not ( = ?AUTO_2656 ?AUTO_2659 ) ) ( not ( = ?AUTO_2656 ?AUTO_2658 ) ) ( not ( = ?AUTO_2657 ?AUTO_2659 ) ) ( not ( = ?AUTO_2657 ?AUTO_2658 ) ) ( not ( = ?AUTO_2659 ?AUTO_2658 ) ) ( ON ?AUTO_2659 ?AUTO_2656 ) ( CLEAR ?AUTO_2659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2659 ?AUTO_2656 )
      ( MAKE-ON ?AUTO_2655 ?AUTO_2656 )
      ( MAKE-ON-VERIFY ?AUTO_2655 ?AUTO_2656 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2660 - BLOCK
      ?AUTO_2661 - BLOCK
    )
    :vars
    (
      ?AUTO_2662 - BLOCK
      ?AUTO_2663 - BLOCK
      ?AUTO_2664 - BLOCK
      ?AUTO_2665 - BLOCK
      ?AUTO_2666 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2660 ?AUTO_2661 ) ) ( ON ?AUTO_2660 ?AUTO_2662 ) ( CLEAR ?AUTO_2660 ) ( not ( = ?AUTO_2660 ?AUTO_2662 ) ) ( not ( = ?AUTO_2661 ?AUTO_2662 ) ) ( CLEAR ?AUTO_2663 ) ( not ( = ?AUTO_2660 ?AUTO_2664 ) ) ( not ( = ?AUTO_2660 ?AUTO_2663 ) ) ( not ( = ?AUTO_2661 ?AUTO_2664 ) ) ( not ( = ?AUTO_2661 ?AUTO_2663 ) ) ( not ( = ?AUTO_2662 ?AUTO_2664 ) ) ( not ( = ?AUTO_2662 ?AUTO_2663 ) ) ( not ( = ?AUTO_2664 ?AUTO_2663 ) ) ( ON ?AUTO_2664 ?AUTO_2661 ) ( CLEAR ?AUTO_2664 ) ( HOLDING ?AUTO_2665 ) ( CLEAR ?AUTO_2666 ) ( not ( = ?AUTO_2660 ?AUTO_2665 ) ) ( not ( = ?AUTO_2660 ?AUTO_2666 ) ) ( not ( = ?AUTO_2661 ?AUTO_2665 ) ) ( not ( = ?AUTO_2661 ?AUTO_2666 ) ) ( not ( = ?AUTO_2662 ?AUTO_2665 ) ) ( not ( = ?AUTO_2662 ?AUTO_2666 ) ) ( not ( = ?AUTO_2663 ?AUTO_2665 ) ) ( not ( = ?AUTO_2663 ?AUTO_2666 ) ) ( not ( = ?AUTO_2664 ?AUTO_2665 ) ) ( not ( = ?AUTO_2664 ?AUTO_2666 ) ) ( not ( = ?AUTO_2665 ?AUTO_2666 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2665 ?AUTO_2666 )
      ( MAKE-ON ?AUTO_2660 ?AUTO_2661 )
      ( MAKE-ON-VERIFY ?AUTO_2660 ?AUTO_2661 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2671 - BLOCK
      ?AUTO_2672 - BLOCK
    )
    :vars
    (
      ?AUTO_2677 - BLOCK
      ?AUTO_2676 - BLOCK
      ?AUTO_2673 - BLOCK
      ?AUTO_2674 - BLOCK
      ?AUTO_2675 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2671 ?AUTO_2672 ) ) ( ON ?AUTO_2671 ?AUTO_2677 ) ( CLEAR ?AUTO_2671 ) ( not ( = ?AUTO_2671 ?AUTO_2677 ) ) ( not ( = ?AUTO_2672 ?AUTO_2677 ) ) ( CLEAR ?AUTO_2676 ) ( not ( = ?AUTO_2671 ?AUTO_2673 ) ) ( not ( = ?AUTO_2671 ?AUTO_2676 ) ) ( not ( = ?AUTO_2672 ?AUTO_2673 ) ) ( not ( = ?AUTO_2672 ?AUTO_2676 ) ) ( not ( = ?AUTO_2677 ?AUTO_2673 ) ) ( not ( = ?AUTO_2677 ?AUTO_2676 ) ) ( not ( = ?AUTO_2673 ?AUTO_2676 ) ) ( ON ?AUTO_2673 ?AUTO_2672 ) ( CLEAR ?AUTO_2674 ) ( not ( = ?AUTO_2671 ?AUTO_2675 ) ) ( not ( = ?AUTO_2671 ?AUTO_2674 ) ) ( not ( = ?AUTO_2672 ?AUTO_2675 ) ) ( not ( = ?AUTO_2672 ?AUTO_2674 ) ) ( not ( = ?AUTO_2677 ?AUTO_2675 ) ) ( not ( = ?AUTO_2677 ?AUTO_2674 ) ) ( not ( = ?AUTO_2676 ?AUTO_2675 ) ) ( not ( = ?AUTO_2676 ?AUTO_2674 ) ) ( not ( = ?AUTO_2673 ?AUTO_2675 ) ) ( not ( = ?AUTO_2673 ?AUTO_2674 ) ) ( not ( = ?AUTO_2675 ?AUTO_2674 ) ) ( ON ?AUTO_2675 ?AUTO_2673 ) ( CLEAR ?AUTO_2675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2675 ?AUTO_2673 )
      ( MAKE-ON ?AUTO_2671 ?AUTO_2672 )
      ( MAKE-ON-VERIFY ?AUTO_2671 ?AUTO_2672 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2679 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2679 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2679 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2679 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2680 - BLOCK
    )
    :vars
    (
      ?AUTO_2681 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2680 ?AUTO_2681 ) ( CLEAR ?AUTO_2680 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2680 ?AUTO_2681 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2680 ?AUTO_2681 )
      ( MAKE-ON-TABLE ?AUTO_2680 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2680 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2682 - BLOCK
    )
    :vars
    (
      ?AUTO_2683 - BLOCK
      ?AUTO_2684 - BLOCK
      ?AUTO_2685 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2682 ?AUTO_2683 ) ( CLEAR ?AUTO_2682 ) ( not ( = ?AUTO_2682 ?AUTO_2683 ) ) ( HOLDING ?AUTO_2684 ) ( CLEAR ?AUTO_2685 ) ( not ( = ?AUTO_2682 ?AUTO_2684 ) ) ( not ( = ?AUTO_2682 ?AUTO_2685 ) ) ( not ( = ?AUTO_2683 ?AUTO_2684 ) ) ( not ( = ?AUTO_2683 ?AUTO_2685 ) ) ( not ( = ?AUTO_2684 ?AUTO_2685 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2684 ?AUTO_2685 )
      ( MAKE-ON-TABLE ?AUTO_2682 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2682 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2686 - BLOCK
    )
    :vars
    (
      ?AUTO_2687 - BLOCK
      ?AUTO_2689 - BLOCK
      ?AUTO_2688 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2686 ?AUTO_2687 ) ( not ( = ?AUTO_2686 ?AUTO_2687 ) ) ( CLEAR ?AUTO_2689 ) ( not ( = ?AUTO_2686 ?AUTO_2688 ) ) ( not ( = ?AUTO_2686 ?AUTO_2689 ) ) ( not ( = ?AUTO_2687 ?AUTO_2688 ) ) ( not ( = ?AUTO_2687 ?AUTO_2689 ) ) ( not ( = ?AUTO_2688 ?AUTO_2689 ) ) ( ON ?AUTO_2688 ?AUTO_2686 ) ( CLEAR ?AUTO_2688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2688 ?AUTO_2686 )
      ( MAKE-ON-TABLE ?AUTO_2686 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2686 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2690 - BLOCK
    )
    :vars
    (
      ?AUTO_2691 - BLOCK
      ?AUTO_2692 - BLOCK
      ?AUTO_2693 - BLOCK
      ?AUTO_2694 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2690 ?AUTO_2691 ) ( not ( = ?AUTO_2690 ?AUTO_2691 ) ) ( not ( = ?AUTO_2690 ?AUTO_2692 ) ) ( not ( = ?AUTO_2690 ?AUTO_2693 ) ) ( not ( = ?AUTO_2691 ?AUTO_2692 ) ) ( not ( = ?AUTO_2691 ?AUTO_2693 ) ) ( not ( = ?AUTO_2692 ?AUTO_2693 ) ) ( ON ?AUTO_2692 ?AUTO_2690 ) ( CLEAR ?AUTO_2692 ) ( HOLDING ?AUTO_2693 ) ( CLEAR ?AUTO_2694 ) ( not ( = ?AUTO_2690 ?AUTO_2694 ) ) ( not ( = ?AUTO_2691 ?AUTO_2694 ) ) ( not ( = ?AUTO_2692 ?AUTO_2694 ) ) ( not ( = ?AUTO_2693 ?AUTO_2694 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2693 ?AUTO_2694 )
      ( MAKE-ON-TABLE ?AUTO_2690 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2690 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2703 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2703 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2703 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2703 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2704 - BLOCK
    )
    :vars
    (
      ?AUTO_2705 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2704 ?AUTO_2705 ) ( CLEAR ?AUTO_2704 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2704 ?AUTO_2705 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2704 ?AUTO_2705 )
      ( MAKE-ON-TABLE ?AUTO_2704 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2704 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2706 - BLOCK
    )
    :vars
    (
      ?AUTO_2707 - BLOCK
      ?AUTO_2708 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2706 ?AUTO_2707 ) ( CLEAR ?AUTO_2706 ) ( not ( = ?AUTO_2706 ?AUTO_2707 ) ) ( HOLDING ?AUTO_2708 ) ( not ( = ?AUTO_2706 ?AUTO_2708 ) ) ( not ( = ?AUTO_2707 ?AUTO_2708 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2708 )
      ( MAKE-ON-TABLE ?AUTO_2706 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2706 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2709 - BLOCK
    )
    :vars
    (
      ?AUTO_2711 - BLOCK
      ?AUTO_2710 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2709 ?AUTO_2711 ) ( not ( = ?AUTO_2709 ?AUTO_2711 ) ) ( not ( = ?AUTO_2709 ?AUTO_2710 ) ) ( not ( = ?AUTO_2711 ?AUTO_2710 ) ) ( ON ?AUTO_2710 ?AUTO_2709 ) ( CLEAR ?AUTO_2710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2710 ?AUTO_2709 )
      ( MAKE-ON-TABLE ?AUTO_2709 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2709 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2712 - BLOCK
    )
    :vars
    (
      ?AUTO_2713 - BLOCK
      ?AUTO_2714 - BLOCK
      ?AUTO_2715 - BLOCK
      ?AUTO_2716 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2712 ?AUTO_2713 ) ( not ( = ?AUTO_2712 ?AUTO_2713 ) ) ( not ( = ?AUTO_2712 ?AUTO_2714 ) ) ( not ( = ?AUTO_2713 ?AUTO_2714 ) ) ( ON ?AUTO_2714 ?AUTO_2712 ) ( CLEAR ?AUTO_2714 ) ( HOLDING ?AUTO_2715 ) ( CLEAR ?AUTO_2716 ) ( not ( = ?AUTO_2712 ?AUTO_2715 ) ) ( not ( = ?AUTO_2712 ?AUTO_2716 ) ) ( not ( = ?AUTO_2713 ?AUTO_2715 ) ) ( not ( = ?AUTO_2713 ?AUTO_2716 ) ) ( not ( = ?AUTO_2714 ?AUTO_2715 ) ) ( not ( = ?AUTO_2714 ?AUTO_2716 ) ) ( not ( = ?AUTO_2715 ?AUTO_2716 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2715 ?AUTO_2716 )
      ( MAKE-ON-TABLE ?AUTO_2712 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2712 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2717 - BLOCK
    )
    :vars
    (
      ?AUTO_2719 - BLOCK
      ?AUTO_2718 - BLOCK
      ?AUTO_2720 - BLOCK
      ?AUTO_2721 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2717 ?AUTO_2719 ) ( not ( = ?AUTO_2717 ?AUTO_2719 ) ) ( not ( = ?AUTO_2717 ?AUTO_2718 ) ) ( not ( = ?AUTO_2719 ?AUTO_2718 ) ) ( ON ?AUTO_2718 ?AUTO_2717 ) ( CLEAR ?AUTO_2720 ) ( not ( = ?AUTO_2717 ?AUTO_2721 ) ) ( not ( = ?AUTO_2717 ?AUTO_2720 ) ) ( not ( = ?AUTO_2719 ?AUTO_2721 ) ) ( not ( = ?AUTO_2719 ?AUTO_2720 ) ) ( not ( = ?AUTO_2718 ?AUTO_2721 ) ) ( not ( = ?AUTO_2718 ?AUTO_2720 ) ) ( not ( = ?AUTO_2721 ?AUTO_2720 ) ) ( ON ?AUTO_2721 ?AUTO_2718 ) ( CLEAR ?AUTO_2721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2721 ?AUTO_2718 )
      ( MAKE-ON-TABLE ?AUTO_2717 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2717 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2722 - BLOCK
    )
    :vars
    (
      ?AUTO_2724 - BLOCK
      ?AUTO_2726 - BLOCK
      ?AUTO_2725 - BLOCK
      ?AUTO_2723 - BLOCK
      ?AUTO_2727 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2722 ?AUTO_2724 ) ( not ( = ?AUTO_2722 ?AUTO_2724 ) ) ( not ( = ?AUTO_2722 ?AUTO_2726 ) ) ( not ( = ?AUTO_2724 ?AUTO_2726 ) ) ( ON ?AUTO_2726 ?AUTO_2722 ) ( not ( = ?AUTO_2722 ?AUTO_2725 ) ) ( not ( = ?AUTO_2722 ?AUTO_2723 ) ) ( not ( = ?AUTO_2724 ?AUTO_2725 ) ) ( not ( = ?AUTO_2724 ?AUTO_2723 ) ) ( not ( = ?AUTO_2726 ?AUTO_2725 ) ) ( not ( = ?AUTO_2726 ?AUTO_2723 ) ) ( not ( = ?AUTO_2725 ?AUTO_2723 ) ) ( ON ?AUTO_2725 ?AUTO_2726 ) ( CLEAR ?AUTO_2725 ) ( HOLDING ?AUTO_2723 ) ( CLEAR ?AUTO_2727 ) ( not ( = ?AUTO_2722 ?AUTO_2727 ) ) ( not ( = ?AUTO_2724 ?AUTO_2727 ) ) ( not ( = ?AUTO_2726 ?AUTO_2727 ) ) ( not ( = ?AUTO_2725 ?AUTO_2727 ) ) ( not ( = ?AUTO_2723 ?AUTO_2727 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2723 ?AUTO_2727 )
      ( MAKE-ON-TABLE ?AUTO_2722 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2722 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2737 - BLOCK
      ?AUTO_2738 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2737 ) ( CLEAR ?AUTO_2738 ) ( not ( = ?AUTO_2737 ?AUTO_2738 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2737 ?AUTO_2738 )
      ( MAKE-ON-VERIFY ?AUTO_2737 ?AUTO_2738 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2739 - BLOCK
      ?AUTO_2740 - BLOCK
    )
    :vars
    (
      ?AUTO_2741 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2740 ) ( not ( = ?AUTO_2739 ?AUTO_2740 ) ) ( ON ?AUTO_2739 ?AUTO_2741 ) ( CLEAR ?AUTO_2739 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2739 ?AUTO_2741 ) ) ( not ( = ?AUTO_2740 ?AUTO_2741 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2739 ?AUTO_2741 )
      ( MAKE-ON ?AUTO_2739 ?AUTO_2740 )
      ( MAKE-ON-VERIFY ?AUTO_2739 ?AUTO_2740 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2742 - BLOCK
      ?AUTO_2743 - BLOCK
    )
    :vars
    (
      ?AUTO_2744 - BLOCK
      ?AUTO_2745 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2743 ) ( not ( = ?AUTO_2742 ?AUTO_2743 ) ) ( ON ?AUTO_2742 ?AUTO_2744 ) ( CLEAR ?AUTO_2742 ) ( not ( = ?AUTO_2742 ?AUTO_2744 ) ) ( not ( = ?AUTO_2743 ?AUTO_2744 ) ) ( HOLDING ?AUTO_2745 ) ( not ( = ?AUTO_2742 ?AUTO_2745 ) ) ( not ( = ?AUTO_2743 ?AUTO_2745 ) ) ( not ( = ?AUTO_2744 ?AUTO_2745 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2745 )
      ( MAKE-ON ?AUTO_2742 ?AUTO_2743 )
      ( MAKE-ON-VERIFY ?AUTO_2742 ?AUTO_2743 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2746 - BLOCK
      ?AUTO_2747 - BLOCK
    )
    :vars
    (
      ?AUTO_2748 - BLOCK
      ?AUTO_2749 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2747 ) ( not ( = ?AUTO_2746 ?AUTO_2747 ) ) ( ON ?AUTO_2746 ?AUTO_2748 ) ( not ( = ?AUTO_2746 ?AUTO_2748 ) ) ( not ( = ?AUTO_2747 ?AUTO_2748 ) ) ( not ( = ?AUTO_2746 ?AUTO_2749 ) ) ( not ( = ?AUTO_2747 ?AUTO_2749 ) ) ( not ( = ?AUTO_2748 ?AUTO_2749 ) ) ( ON ?AUTO_2749 ?AUTO_2746 ) ( CLEAR ?AUTO_2749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2749 ?AUTO_2746 )
      ( MAKE-ON ?AUTO_2746 ?AUTO_2747 )
      ( MAKE-ON-VERIFY ?AUTO_2746 ?AUTO_2747 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2750 - BLOCK
      ?AUTO_2751 - BLOCK
    )
    :vars
    (
      ?AUTO_2752 - BLOCK
      ?AUTO_2753 - BLOCK
      ?AUTO_2754 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2751 ) ( not ( = ?AUTO_2750 ?AUTO_2751 ) ) ( ON ?AUTO_2750 ?AUTO_2752 ) ( not ( = ?AUTO_2750 ?AUTO_2752 ) ) ( not ( = ?AUTO_2751 ?AUTO_2752 ) ) ( not ( = ?AUTO_2750 ?AUTO_2753 ) ) ( not ( = ?AUTO_2751 ?AUTO_2753 ) ) ( not ( = ?AUTO_2752 ?AUTO_2753 ) ) ( ON ?AUTO_2753 ?AUTO_2750 ) ( CLEAR ?AUTO_2753 ) ( HOLDING ?AUTO_2754 ) ( not ( = ?AUTO_2750 ?AUTO_2754 ) ) ( not ( = ?AUTO_2751 ?AUTO_2754 ) ) ( not ( = ?AUTO_2752 ?AUTO_2754 ) ) ( not ( = ?AUTO_2753 ?AUTO_2754 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2754 )
      ( MAKE-ON ?AUTO_2750 ?AUTO_2751 )
      ( MAKE-ON-VERIFY ?AUTO_2750 ?AUTO_2751 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2755 - BLOCK
      ?AUTO_2756 - BLOCK
    )
    :vars
    (
      ?AUTO_2757 - BLOCK
      ?AUTO_2758 - BLOCK
      ?AUTO_2759 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2756 ) ( not ( = ?AUTO_2755 ?AUTO_2756 ) ) ( ON ?AUTO_2755 ?AUTO_2757 ) ( not ( = ?AUTO_2755 ?AUTO_2757 ) ) ( not ( = ?AUTO_2756 ?AUTO_2757 ) ) ( not ( = ?AUTO_2755 ?AUTO_2758 ) ) ( not ( = ?AUTO_2756 ?AUTO_2758 ) ) ( not ( = ?AUTO_2757 ?AUTO_2758 ) ) ( ON ?AUTO_2758 ?AUTO_2755 ) ( not ( = ?AUTO_2755 ?AUTO_2759 ) ) ( not ( = ?AUTO_2756 ?AUTO_2759 ) ) ( not ( = ?AUTO_2757 ?AUTO_2759 ) ) ( not ( = ?AUTO_2758 ?AUTO_2759 ) ) ( ON ?AUTO_2759 ?AUTO_2758 ) ( CLEAR ?AUTO_2759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2759 ?AUTO_2758 )
      ( MAKE-ON ?AUTO_2755 ?AUTO_2756 )
      ( MAKE-ON-VERIFY ?AUTO_2755 ?AUTO_2756 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2760 - BLOCK
      ?AUTO_2761 - BLOCK
    )
    :vars
    (
      ?AUTO_2763 - BLOCK
      ?AUTO_2762 - BLOCK
      ?AUTO_2764 - BLOCK
      ?AUTO_2765 - BLOCK
      ?AUTO_2766 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2761 ) ( not ( = ?AUTO_2760 ?AUTO_2761 ) ) ( ON ?AUTO_2760 ?AUTO_2763 ) ( not ( = ?AUTO_2760 ?AUTO_2763 ) ) ( not ( = ?AUTO_2761 ?AUTO_2763 ) ) ( not ( = ?AUTO_2760 ?AUTO_2762 ) ) ( not ( = ?AUTO_2761 ?AUTO_2762 ) ) ( not ( = ?AUTO_2763 ?AUTO_2762 ) ) ( ON ?AUTO_2762 ?AUTO_2760 ) ( not ( = ?AUTO_2760 ?AUTO_2764 ) ) ( not ( = ?AUTO_2761 ?AUTO_2764 ) ) ( not ( = ?AUTO_2763 ?AUTO_2764 ) ) ( not ( = ?AUTO_2762 ?AUTO_2764 ) ) ( ON ?AUTO_2764 ?AUTO_2762 ) ( CLEAR ?AUTO_2764 ) ( HOLDING ?AUTO_2765 ) ( CLEAR ?AUTO_2766 ) ( not ( = ?AUTO_2760 ?AUTO_2765 ) ) ( not ( = ?AUTO_2760 ?AUTO_2766 ) ) ( not ( = ?AUTO_2761 ?AUTO_2765 ) ) ( not ( = ?AUTO_2761 ?AUTO_2766 ) ) ( not ( = ?AUTO_2763 ?AUTO_2765 ) ) ( not ( = ?AUTO_2763 ?AUTO_2766 ) ) ( not ( = ?AUTO_2762 ?AUTO_2765 ) ) ( not ( = ?AUTO_2762 ?AUTO_2766 ) ) ( not ( = ?AUTO_2764 ?AUTO_2765 ) ) ( not ( = ?AUTO_2764 ?AUTO_2766 ) ) ( not ( = ?AUTO_2765 ?AUTO_2766 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2765 ?AUTO_2766 )
      ( MAKE-ON ?AUTO_2760 ?AUTO_2761 )
      ( MAKE-ON-VERIFY ?AUTO_2760 ?AUTO_2761 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2767 - BLOCK
      ?AUTO_2768 - BLOCK
    )
    :vars
    (
      ?AUTO_2769 - BLOCK
      ?AUTO_2770 - BLOCK
      ?AUTO_2772 - BLOCK
      ?AUTO_2773 - BLOCK
      ?AUTO_2771 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2768 ) ( not ( = ?AUTO_2767 ?AUTO_2768 ) ) ( ON ?AUTO_2767 ?AUTO_2769 ) ( not ( = ?AUTO_2767 ?AUTO_2769 ) ) ( not ( = ?AUTO_2768 ?AUTO_2769 ) ) ( not ( = ?AUTO_2767 ?AUTO_2770 ) ) ( not ( = ?AUTO_2768 ?AUTO_2770 ) ) ( not ( = ?AUTO_2769 ?AUTO_2770 ) ) ( ON ?AUTO_2770 ?AUTO_2767 ) ( not ( = ?AUTO_2767 ?AUTO_2772 ) ) ( not ( = ?AUTO_2768 ?AUTO_2772 ) ) ( not ( = ?AUTO_2769 ?AUTO_2772 ) ) ( not ( = ?AUTO_2770 ?AUTO_2772 ) ) ( ON ?AUTO_2772 ?AUTO_2770 ) ( CLEAR ?AUTO_2773 ) ( not ( = ?AUTO_2767 ?AUTO_2771 ) ) ( not ( = ?AUTO_2767 ?AUTO_2773 ) ) ( not ( = ?AUTO_2768 ?AUTO_2771 ) ) ( not ( = ?AUTO_2768 ?AUTO_2773 ) ) ( not ( = ?AUTO_2769 ?AUTO_2771 ) ) ( not ( = ?AUTO_2769 ?AUTO_2773 ) ) ( not ( = ?AUTO_2770 ?AUTO_2771 ) ) ( not ( = ?AUTO_2770 ?AUTO_2773 ) ) ( not ( = ?AUTO_2772 ?AUTO_2771 ) ) ( not ( = ?AUTO_2772 ?AUTO_2773 ) ) ( not ( = ?AUTO_2771 ?AUTO_2773 ) ) ( ON ?AUTO_2771 ?AUTO_2772 ) ( CLEAR ?AUTO_2771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2771 ?AUTO_2772 )
      ( MAKE-ON ?AUTO_2767 ?AUTO_2768 )
      ( MAKE-ON-VERIFY ?AUTO_2767 ?AUTO_2768 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2774 - BLOCK
      ?AUTO_2775 - BLOCK
    )
    :vars
    (
      ?AUTO_2777 - BLOCK
      ?AUTO_2776 - BLOCK
      ?AUTO_2780 - BLOCK
      ?AUTO_2779 - BLOCK
      ?AUTO_2778 - BLOCK
      ?AUTO_2781 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2775 ) ( not ( = ?AUTO_2774 ?AUTO_2775 ) ) ( ON ?AUTO_2774 ?AUTO_2777 ) ( not ( = ?AUTO_2774 ?AUTO_2777 ) ) ( not ( = ?AUTO_2775 ?AUTO_2777 ) ) ( not ( = ?AUTO_2774 ?AUTO_2776 ) ) ( not ( = ?AUTO_2775 ?AUTO_2776 ) ) ( not ( = ?AUTO_2777 ?AUTO_2776 ) ) ( ON ?AUTO_2776 ?AUTO_2774 ) ( not ( = ?AUTO_2774 ?AUTO_2780 ) ) ( not ( = ?AUTO_2775 ?AUTO_2780 ) ) ( not ( = ?AUTO_2777 ?AUTO_2780 ) ) ( not ( = ?AUTO_2776 ?AUTO_2780 ) ) ( ON ?AUTO_2780 ?AUTO_2776 ) ( not ( = ?AUTO_2774 ?AUTO_2779 ) ) ( not ( = ?AUTO_2774 ?AUTO_2778 ) ) ( not ( = ?AUTO_2775 ?AUTO_2779 ) ) ( not ( = ?AUTO_2775 ?AUTO_2778 ) ) ( not ( = ?AUTO_2777 ?AUTO_2779 ) ) ( not ( = ?AUTO_2777 ?AUTO_2778 ) ) ( not ( = ?AUTO_2776 ?AUTO_2779 ) ) ( not ( = ?AUTO_2776 ?AUTO_2778 ) ) ( not ( = ?AUTO_2780 ?AUTO_2779 ) ) ( not ( = ?AUTO_2780 ?AUTO_2778 ) ) ( not ( = ?AUTO_2779 ?AUTO_2778 ) ) ( ON ?AUTO_2779 ?AUTO_2780 ) ( CLEAR ?AUTO_2779 ) ( HOLDING ?AUTO_2778 ) ( CLEAR ?AUTO_2781 ) ( not ( = ?AUTO_2774 ?AUTO_2781 ) ) ( not ( = ?AUTO_2775 ?AUTO_2781 ) ) ( not ( = ?AUTO_2777 ?AUTO_2781 ) ) ( not ( = ?AUTO_2776 ?AUTO_2781 ) ) ( not ( = ?AUTO_2780 ?AUTO_2781 ) ) ( not ( = ?AUTO_2779 ?AUTO_2781 ) ) ( not ( = ?AUTO_2778 ?AUTO_2781 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2778 ?AUTO_2781 )
      ( MAKE-ON ?AUTO_2774 ?AUTO_2775 )
      ( MAKE-ON-VERIFY ?AUTO_2774 ?AUTO_2775 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2788 - BLOCK
      ?AUTO_2789 - BLOCK
    )
    :vars
    (
      ?AUTO_2792 - BLOCK
      ?AUTO_2791 - BLOCK
      ?AUTO_2790 - BLOCK
      ?AUTO_2793 - BLOCK
      ?AUTO_2794 - BLOCK
      ?AUTO_2795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2788 ?AUTO_2789 ) ) ( ON ?AUTO_2788 ?AUTO_2792 ) ( not ( = ?AUTO_2788 ?AUTO_2792 ) ) ( not ( = ?AUTO_2789 ?AUTO_2792 ) ) ( not ( = ?AUTO_2788 ?AUTO_2791 ) ) ( not ( = ?AUTO_2789 ?AUTO_2791 ) ) ( not ( = ?AUTO_2792 ?AUTO_2791 ) ) ( ON ?AUTO_2791 ?AUTO_2788 ) ( not ( = ?AUTO_2788 ?AUTO_2790 ) ) ( not ( = ?AUTO_2789 ?AUTO_2790 ) ) ( not ( = ?AUTO_2792 ?AUTO_2790 ) ) ( not ( = ?AUTO_2791 ?AUTO_2790 ) ) ( ON ?AUTO_2790 ?AUTO_2791 ) ( CLEAR ?AUTO_2793 ) ( not ( = ?AUTO_2788 ?AUTO_2794 ) ) ( not ( = ?AUTO_2788 ?AUTO_2793 ) ) ( not ( = ?AUTO_2789 ?AUTO_2794 ) ) ( not ( = ?AUTO_2789 ?AUTO_2793 ) ) ( not ( = ?AUTO_2792 ?AUTO_2794 ) ) ( not ( = ?AUTO_2792 ?AUTO_2793 ) ) ( not ( = ?AUTO_2791 ?AUTO_2794 ) ) ( not ( = ?AUTO_2791 ?AUTO_2793 ) ) ( not ( = ?AUTO_2790 ?AUTO_2794 ) ) ( not ( = ?AUTO_2790 ?AUTO_2793 ) ) ( not ( = ?AUTO_2794 ?AUTO_2793 ) ) ( ON ?AUTO_2794 ?AUTO_2790 ) ( CLEAR ?AUTO_2794 ) ( HOLDING ?AUTO_2789 ) ( CLEAR ?AUTO_2795 ) ( not ( = ?AUTO_2788 ?AUTO_2795 ) ) ( not ( = ?AUTO_2789 ?AUTO_2795 ) ) ( not ( = ?AUTO_2792 ?AUTO_2795 ) ) ( not ( = ?AUTO_2791 ?AUTO_2795 ) ) ( not ( = ?AUTO_2790 ?AUTO_2795 ) ) ( not ( = ?AUTO_2793 ?AUTO_2795 ) ) ( not ( = ?AUTO_2794 ?AUTO_2795 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2789 ?AUTO_2795 )
      ( MAKE-ON ?AUTO_2788 ?AUTO_2789 )
      ( MAKE-ON-VERIFY ?AUTO_2788 ?AUTO_2789 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2804 - BLOCK
      ?AUTO_2805 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2804 ) ( CLEAR ?AUTO_2805 ) ( not ( = ?AUTO_2804 ?AUTO_2805 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2804 ?AUTO_2805 )
      ( MAKE-ON-VERIFY ?AUTO_2804 ?AUTO_2805 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2806 - BLOCK
      ?AUTO_2807 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2807 ) ( not ( = ?AUTO_2806 ?AUTO_2807 ) ) ( ON-TABLE ?AUTO_2806 ) ( CLEAR ?AUTO_2806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2806 )
      ( MAKE-ON ?AUTO_2806 ?AUTO_2807 )
      ( MAKE-ON-VERIFY ?AUTO_2806 ?AUTO_2807 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2808 - BLOCK
      ?AUTO_2809 - BLOCK
    )
    :vars
    (
      ?AUTO_2810 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2808 ?AUTO_2809 ) ) ( ON-TABLE ?AUTO_2808 ) ( CLEAR ?AUTO_2808 ) ( HOLDING ?AUTO_2809 ) ( CLEAR ?AUTO_2810 ) ( not ( = ?AUTO_2808 ?AUTO_2810 ) ) ( not ( = ?AUTO_2809 ?AUTO_2810 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2809 ?AUTO_2810 )
      ( MAKE-ON ?AUTO_2808 ?AUTO_2809 )
      ( MAKE-ON-VERIFY ?AUTO_2808 ?AUTO_2809 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2897 - BLOCK
      ?AUTO_2898 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2897 ) ( CLEAR ?AUTO_2898 ) ( not ( = ?AUTO_2897 ?AUTO_2898 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2897 ?AUTO_2898 )
      ( MAKE-ON-VERIFY ?AUTO_2897 ?AUTO_2898 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2899 - BLOCK
      ?AUTO_2900 - BLOCK
    )
    :vars
    (
      ?AUTO_2901 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2900 ) ( not ( = ?AUTO_2899 ?AUTO_2900 ) ) ( ON ?AUTO_2899 ?AUTO_2901 ) ( CLEAR ?AUTO_2899 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2899 ?AUTO_2901 ) ) ( not ( = ?AUTO_2900 ?AUTO_2901 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2899 ?AUTO_2901 )
      ( MAKE-ON ?AUTO_2899 ?AUTO_2900 )
      ( MAKE-ON-VERIFY ?AUTO_2899 ?AUTO_2900 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2902 - BLOCK
      ?AUTO_2903 - BLOCK
    )
    :vars
    (
      ?AUTO_2904 - BLOCK
      ?AUTO_2905 - BLOCK
      ?AUTO_2906 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2903 ) ( not ( = ?AUTO_2902 ?AUTO_2903 ) ) ( ON ?AUTO_2902 ?AUTO_2904 ) ( CLEAR ?AUTO_2902 ) ( not ( = ?AUTO_2902 ?AUTO_2904 ) ) ( not ( = ?AUTO_2903 ?AUTO_2904 ) ) ( HOLDING ?AUTO_2905 ) ( CLEAR ?AUTO_2906 ) ( not ( = ?AUTO_2902 ?AUTO_2905 ) ) ( not ( = ?AUTO_2902 ?AUTO_2906 ) ) ( not ( = ?AUTO_2903 ?AUTO_2905 ) ) ( not ( = ?AUTO_2903 ?AUTO_2906 ) ) ( not ( = ?AUTO_2904 ?AUTO_2905 ) ) ( not ( = ?AUTO_2904 ?AUTO_2906 ) ) ( not ( = ?AUTO_2905 ?AUTO_2906 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2905 ?AUTO_2906 )
      ( MAKE-ON ?AUTO_2902 ?AUTO_2903 )
      ( MAKE-ON-VERIFY ?AUTO_2902 ?AUTO_2903 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2911 - BLOCK
      ?AUTO_2912 - BLOCK
    )
    :vars
    (
      ?AUTO_2915 - BLOCK
      ?AUTO_2914 - BLOCK
      ?AUTO_2913 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2911 ?AUTO_2912 ) ) ( ON ?AUTO_2911 ?AUTO_2915 ) ( CLEAR ?AUTO_2911 ) ( not ( = ?AUTO_2911 ?AUTO_2915 ) ) ( not ( = ?AUTO_2912 ?AUTO_2915 ) ) ( CLEAR ?AUTO_2914 ) ( not ( = ?AUTO_2911 ?AUTO_2913 ) ) ( not ( = ?AUTO_2911 ?AUTO_2914 ) ) ( not ( = ?AUTO_2912 ?AUTO_2913 ) ) ( not ( = ?AUTO_2912 ?AUTO_2914 ) ) ( not ( = ?AUTO_2915 ?AUTO_2913 ) ) ( not ( = ?AUTO_2915 ?AUTO_2914 ) ) ( not ( = ?AUTO_2913 ?AUTO_2914 ) ) ( ON ?AUTO_2913 ?AUTO_2912 ) ( CLEAR ?AUTO_2913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2913 ?AUTO_2912 )
      ( MAKE-ON ?AUTO_2911 ?AUTO_2912 )
      ( MAKE-ON-VERIFY ?AUTO_2911 ?AUTO_2912 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2916 - BLOCK
      ?AUTO_2917 - BLOCK
    )
    :vars
    (
      ?AUTO_2920 - BLOCK
      ?AUTO_2919 - BLOCK
      ?AUTO_2918 - BLOCK
      ?AUTO_2921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2916 ?AUTO_2917 ) ) ( ON ?AUTO_2916 ?AUTO_2920 ) ( CLEAR ?AUTO_2916 ) ( not ( = ?AUTO_2916 ?AUTO_2920 ) ) ( not ( = ?AUTO_2917 ?AUTO_2920 ) ) ( CLEAR ?AUTO_2919 ) ( not ( = ?AUTO_2916 ?AUTO_2918 ) ) ( not ( = ?AUTO_2916 ?AUTO_2919 ) ) ( not ( = ?AUTO_2917 ?AUTO_2918 ) ) ( not ( = ?AUTO_2917 ?AUTO_2919 ) ) ( not ( = ?AUTO_2920 ?AUTO_2918 ) ) ( not ( = ?AUTO_2920 ?AUTO_2919 ) ) ( not ( = ?AUTO_2918 ?AUTO_2919 ) ) ( ON ?AUTO_2918 ?AUTO_2917 ) ( CLEAR ?AUTO_2918 ) ( HOLDING ?AUTO_2921 ) ( not ( = ?AUTO_2916 ?AUTO_2921 ) ) ( not ( = ?AUTO_2917 ?AUTO_2921 ) ) ( not ( = ?AUTO_2920 ?AUTO_2921 ) ) ( not ( = ?AUTO_2919 ?AUTO_2921 ) ) ( not ( = ?AUTO_2918 ?AUTO_2921 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2921 )
      ( MAKE-ON ?AUTO_2916 ?AUTO_2917 )
      ( MAKE-ON-VERIFY ?AUTO_2916 ?AUTO_2917 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2922 - BLOCK
      ?AUTO_2923 - BLOCK
    )
    :vars
    (
      ?AUTO_2926 - BLOCK
      ?AUTO_2925 - BLOCK
      ?AUTO_2924 - BLOCK
      ?AUTO_2927 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2922 ?AUTO_2923 ) ) ( ON ?AUTO_2922 ?AUTO_2926 ) ( CLEAR ?AUTO_2922 ) ( not ( = ?AUTO_2922 ?AUTO_2926 ) ) ( not ( = ?AUTO_2923 ?AUTO_2926 ) ) ( CLEAR ?AUTO_2925 ) ( not ( = ?AUTO_2922 ?AUTO_2924 ) ) ( not ( = ?AUTO_2922 ?AUTO_2925 ) ) ( not ( = ?AUTO_2923 ?AUTO_2924 ) ) ( not ( = ?AUTO_2923 ?AUTO_2925 ) ) ( not ( = ?AUTO_2926 ?AUTO_2924 ) ) ( not ( = ?AUTO_2926 ?AUTO_2925 ) ) ( not ( = ?AUTO_2924 ?AUTO_2925 ) ) ( ON ?AUTO_2924 ?AUTO_2923 ) ( not ( = ?AUTO_2922 ?AUTO_2927 ) ) ( not ( = ?AUTO_2923 ?AUTO_2927 ) ) ( not ( = ?AUTO_2926 ?AUTO_2927 ) ) ( not ( = ?AUTO_2925 ?AUTO_2927 ) ) ( not ( = ?AUTO_2924 ?AUTO_2927 ) ) ( ON ?AUTO_2927 ?AUTO_2924 ) ( CLEAR ?AUTO_2927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2927 ?AUTO_2924 )
      ( MAKE-ON ?AUTO_2922 ?AUTO_2923 )
      ( MAKE-ON-VERIFY ?AUTO_2922 ?AUTO_2923 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2928 - BLOCK
      ?AUTO_2929 - BLOCK
    )
    :vars
    (
      ?AUTO_2932 - BLOCK
      ?AUTO_2933 - BLOCK
      ?AUTO_2931 - BLOCK
      ?AUTO_2930 - BLOCK
      ?AUTO_2934 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2928 ?AUTO_2929 ) ) ( ON ?AUTO_2928 ?AUTO_2932 ) ( CLEAR ?AUTO_2928 ) ( not ( = ?AUTO_2928 ?AUTO_2932 ) ) ( not ( = ?AUTO_2929 ?AUTO_2932 ) ) ( CLEAR ?AUTO_2933 ) ( not ( = ?AUTO_2928 ?AUTO_2931 ) ) ( not ( = ?AUTO_2928 ?AUTO_2933 ) ) ( not ( = ?AUTO_2929 ?AUTO_2931 ) ) ( not ( = ?AUTO_2929 ?AUTO_2933 ) ) ( not ( = ?AUTO_2932 ?AUTO_2931 ) ) ( not ( = ?AUTO_2932 ?AUTO_2933 ) ) ( not ( = ?AUTO_2931 ?AUTO_2933 ) ) ( ON ?AUTO_2931 ?AUTO_2929 ) ( not ( = ?AUTO_2928 ?AUTO_2930 ) ) ( not ( = ?AUTO_2929 ?AUTO_2930 ) ) ( not ( = ?AUTO_2932 ?AUTO_2930 ) ) ( not ( = ?AUTO_2933 ?AUTO_2930 ) ) ( not ( = ?AUTO_2931 ?AUTO_2930 ) ) ( ON ?AUTO_2930 ?AUTO_2931 ) ( CLEAR ?AUTO_2930 ) ( HOLDING ?AUTO_2934 ) ( not ( = ?AUTO_2928 ?AUTO_2934 ) ) ( not ( = ?AUTO_2929 ?AUTO_2934 ) ) ( not ( = ?AUTO_2932 ?AUTO_2934 ) ) ( not ( = ?AUTO_2933 ?AUTO_2934 ) ) ( not ( = ?AUTO_2931 ?AUTO_2934 ) ) ( not ( = ?AUTO_2930 ?AUTO_2934 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2934 )
      ( MAKE-ON ?AUTO_2928 ?AUTO_2929 )
      ( MAKE-ON-VERIFY ?AUTO_2928 ?AUTO_2929 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2935 - BLOCK
      ?AUTO_2936 - BLOCK
    )
    :vars
    (
      ?AUTO_2941 - BLOCK
      ?AUTO_2937 - BLOCK
      ?AUTO_2938 - BLOCK
      ?AUTO_2939 - BLOCK
      ?AUTO_2940 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2935 ?AUTO_2936 ) ) ( ON ?AUTO_2935 ?AUTO_2941 ) ( CLEAR ?AUTO_2935 ) ( not ( = ?AUTO_2935 ?AUTO_2941 ) ) ( not ( = ?AUTO_2936 ?AUTO_2941 ) ) ( CLEAR ?AUTO_2937 ) ( not ( = ?AUTO_2935 ?AUTO_2938 ) ) ( not ( = ?AUTO_2935 ?AUTO_2937 ) ) ( not ( = ?AUTO_2936 ?AUTO_2938 ) ) ( not ( = ?AUTO_2936 ?AUTO_2937 ) ) ( not ( = ?AUTO_2941 ?AUTO_2938 ) ) ( not ( = ?AUTO_2941 ?AUTO_2937 ) ) ( not ( = ?AUTO_2938 ?AUTO_2937 ) ) ( ON ?AUTO_2938 ?AUTO_2936 ) ( not ( = ?AUTO_2935 ?AUTO_2939 ) ) ( not ( = ?AUTO_2936 ?AUTO_2939 ) ) ( not ( = ?AUTO_2941 ?AUTO_2939 ) ) ( not ( = ?AUTO_2937 ?AUTO_2939 ) ) ( not ( = ?AUTO_2938 ?AUTO_2939 ) ) ( ON ?AUTO_2939 ?AUTO_2938 ) ( not ( = ?AUTO_2935 ?AUTO_2940 ) ) ( not ( = ?AUTO_2936 ?AUTO_2940 ) ) ( not ( = ?AUTO_2941 ?AUTO_2940 ) ) ( not ( = ?AUTO_2937 ?AUTO_2940 ) ) ( not ( = ?AUTO_2938 ?AUTO_2940 ) ) ( not ( = ?AUTO_2939 ?AUTO_2940 ) ) ( ON ?AUTO_2940 ?AUTO_2939 ) ( CLEAR ?AUTO_2940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2940 ?AUTO_2939 )
      ( MAKE-ON ?AUTO_2935 ?AUTO_2936 )
      ( MAKE-ON-VERIFY ?AUTO_2935 ?AUTO_2936 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2942 - BLOCK
      ?AUTO_2943 - BLOCK
    )
    :vars
    (
      ?AUTO_2947 - BLOCK
      ?AUTO_2944 - BLOCK
      ?AUTO_2945 - BLOCK
      ?AUTO_2946 - BLOCK
      ?AUTO_2948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2942 ?AUTO_2943 ) ) ( not ( = ?AUTO_2942 ?AUTO_2947 ) ) ( not ( = ?AUTO_2943 ?AUTO_2947 ) ) ( CLEAR ?AUTO_2944 ) ( not ( = ?AUTO_2942 ?AUTO_2945 ) ) ( not ( = ?AUTO_2942 ?AUTO_2944 ) ) ( not ( = ?AUTO_2943 ?AUTO_2945 ) ) ( not ( = ?AUTO_2943 ?AUTO_2944 ) ) ( not ( = ?AUTO_2947 ?AUTO_2945 ) ) ( not ( = ?AUTO_2947 ?AUTO_2944 ) ) ( not ( = ?AUTO_2945 ?AUTO_2944 ) ) ( ON ?AUTO_2945 ?AUTO_2943 ) ( not ( = ?AUTO_2942 ?AUTO_2946 ) ) ( not ( = ?AUTO_2943 ?AUTO_2946 ) ) ( not ( = ?AUTO_2947 ?AUTO_2946 ) ) ( not ( = ?AUTO_2944 ?AUTO_2946 ) ) ( not ( = ?AUTO_2945 ?AUTO_2946 ) ) ( ON ?AUTO_2946 ?AUTO_2945 ) ( not ( = ?AUTO_2942 ?AUTO_2948 ) ) ( not ( = ?AUTO_2943 ?AUTO_2948 ) ) ( not ( = ?AUTO_2947 ?AUTO_2948 ) ) ( not ( = ?AUTO_2944 ?AUTO_2948 ) ) ( not ( = ?AUTO_2945 ?AUTO_2948 ) ) ( not ( = ?AUTO_2946 ?AUTO_2948 ) ) ( ON ?AUTO_2948 ?AUTO_2946 ) ( CLEAR ?AUTO_2948 ) ( HOLDING ?AUTO_2942 ) ( CLEAR ?AUTO_2947 ) )
    :subtasks
    ( ( !STACK ?AUTO_2942 ?AUTO_2947 )
      ( MAKE-ON ?AUTO_2942 ?AUTO_2943 )
      ( MAKE-ON-VERIFY ?AUTO_2942 ?AUTO_2943 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2949 - BLOCK
      ?AUTO_2950 - BLOCK
    )
    :vars
    (
      ?AUTO_2953 - BLOCK
      ?AUTO_2955 - BLOCK
      ?AUTO_2952 - BLOCK
      ?AUTO_2954 - BLOCK
      ?AUTO_2951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2949 ?AUTO_2950 ) ) ( not ( = ?AUTO_2949 ?AUTO_2953 ) ) ( not ( = ?AUTO_2950 ?AUTO_2953 ) ) ( CLEAR ?AUTO_2955 ) ( not ( = ?AUTO_2949 ?AUTO_2952 ) ) ( not ( = ?AUTO_2949 ?AUTO_2955 ) ) ( not ( = ?AUTO_2950 ?AUTO_2952 ) ) ( not ( = ?AUTO_2950 ?AUTO_2955 ) ) ( not ( = ?AUTO_2953 ?AUTO_2952 ) ) ( not ( = ?AUTO_2953 ?AUTO_2955 ) ) ( not ( = ?AUTO_2952 ?AUTO_2955 ) ) ( ON ?AUTO_2952 ?AUTO_2950 ) ( not ( = ?AUTO_2949 ?AUTO_2954 ) ) ( not ( = ?AUTO_2950 ?AUTO_2954 ) ) ( not ( = ?AUTO_2953 ?AUTO_2954 ) ) ( not ( = ?AUTO_2955 ?AUTO_2954 ) ) ( not ( = ?AUTO_2952 ?AUTO_2954 ) ) ( ON ?AUTO_2954 ?AUTO_2952 ) ( not ( = ?AUTO_2949 ?AUTO_2951 ) ) ( not ( = ?AUTO_2950 ?AUTO_2951 ) ) ( not ( = ?AUTO_2953 ?AUTO_2951 ) ) ( not ( = ?AUTO_2955 ?AUTO_2951 ) ) ( not ( = ?AUTO_2952 ?AUTO_2951 ) ) ( not ( = ?AUTO_2954 ?AUTO_2951 ) ) ( ON ?AUTO_2951 ?AUTO_2954 ) ( CLEAR ?AUTO_2953 ) ( ON ?AUTO_2949 ?AUTO_2951 ) ( CLEAR ?AUTO_2949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2949 ?AUTO_2951 )
      ( MAKE-ON ?AUTO_2949 ?AUTO_2950 )
      ( MAKE-ON-VERIFY ?AUTO_2949 ?AUTO_2950 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2956 - BLOCK
      ?AUTO_2957 - BLOCK
    )
    :vars
    (
      ?AUTO_2960 - BLOCK
      ?AUTO_2961 - BLOCK
      ?AUTO_2958 - BLOCK
      ?AUTO_2962 - BLOCK
      ?AUTO_2959 - BLOCK
      ?AUTO_2963 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2956 ?AUTO_2957 ) ) ( not ( = ?AUTO_2956 ?AUTO_2960 ) ) ( not ( = ?AUTO_2957 ?AUTO_2960 ) ) ( CLEAR ?AUTO_2961 ) ( not ( = ?AUTO_2956 ?AUTO_2958 ) ) ( not ( = ?AUTO_2956 ?AUTO_2961 ) ) ( not ( = ?AUTO_2957 ?AUTO_2958 ) ) ( not ( = ?AUTO_2957 ?AUTO_2961 ) ) ( not ( = ?AUTO_2960 ?AUTO_2958 ) ) ( not ( = ?AUTO_2960 ?AUTO_2961 ) ) ( not ( = ?AUTO_2958 ?AUTO_2961 ) ) ( ON ?AUTO_2958 ?AUTO_2957 ) ( not ( = ?AUTO_2956 ?AUTO_2962 ) ) ( not ( = ?AUTO_2957 ?AUTO_2962 ) ) ( not ( = ?AUTO_2960 ?AUTO_2962 ) ) ( not ( = ?AUTO_2961 ?AUTO_2962 ) ) ( not ( = ?AUTO_2958 ?AUTO_2962 ) ) ( ON ?AUTO_2962 ?AUTO_2958 ) ( not ( = ?AUTO_2956 ?AUTO_2959 ) ) ( not ( = ?AUTO_2957 ?AUTO_2959 ) ) ( not ( = ?AUTO_2960 ?AUTO_2959 ) ) ( not ( = ?AUTO_2961 ?AUTO_2959 ) ) ( not ( = ?AUTO_2958 ?AUTO_2959 ) ) ( not ( = ?AUTO_2962 ?AUTO_2959 ) ) ( ON ?AUTO_2959 ?AUTO_2962 ) ( ON ?AUTO_2956 ?AUTO_2959 ) ( CLEAR ?AUTO_2956 ) ( HOLDING ?AUTO_2960 ) ( CLEAR ?AUTO_2963 ) ( not ( = ?AUTO_2956 ?AUTO_2963 ) ) ( not ( = ?AUTO_2957 ?AUTO_2963 ) ) ( not ( = ?AUTO_2960 ?AUTO_2963 ) ) ( not ( = ?AUTO_2961 ?AUTO_2963 ) ) ( not ( = ?AUTO_2958 ?AUTO_2963 ) ) ( not ( = ?AUTO_2962 ?AUTO_2963 ) ) ( not ( = ?AUTO_2959 ?AUTO_2963 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2960 ?AUTO_2963 )
      ( MAKE-ON ?AUTO_2956 ?AUTO_2957 )
      ( MAKE-ON-VERIFY ?AUTO_2956 ?AUTO_2957 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2980 - BLOCK
      ?AUTO_2981 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2980 ) ( CLEAR ?AUTO_2981 ) ( not ( = ?AUTO_2980 ?AUTO_2981 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2980 ?AUTO_2981 )
      ( MAKE-ON-VERIFY ?AUTO_2980 ?AUTO_2981 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2982 - BLOCK
      ?AUTO_2983 - BLOCK
    )
    :vars
    (
      ?AUTO_2984 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2983 ) ( not ( = ?AUTO_2982 ?AUTO_2983 ) ) ( ON ?AUTO_2982 ?AUTO_2984 ) ( CLEAR ?AUTO_2982 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2982 ?AUTO_2984 ) ) ( not ( = ?AUTO_2983 ?AUTO_2984 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2982 ?AUTO_2984 )
      ( MAKE-ON ?AUTO_2982 ?AUTO_2983 )
      ( MAKE-ON-VERIFY ?AUTO_2982 ?AUTO_2983 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2985 - BLOCK
      ?AUTO_2986 - BLOCK
    )
    :vars
    (
      ?AUTO_2987 - BLOCK
      ?AUTO_2988 - BLOCK
      ?AUTO_2989 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2986 ) ( not ( = ?AUTO_2985 ?AUTO_2986 ) ) ( ON ?AUTO_2985 ?AUTO_2987 ) ( CLEAR ?AUTO_2985 ) ( not ( = ?AUTO_2985 ?AUTO_2987 ) ) ( not ( = ?AUTO_2986 ?AUTO_2987 ) ) ( HOLDING ?AUTO_2988 ) ( CLEAR ?AUTO_2989 ) ( not ( = ?AUTO_2985 ?AUTO_2988 ) ) ( not ( = ?AUTO_2985 ?AUTO_2989 ) ) ( not ( = ?AUTO_2986 ?AUTO_2988 ) ) ( not ( = ?AUTO_2986 ?AUTO_2989 ) ) ( not ( = ?AUTO_2987 ?AUTO_2988 ) ) ( not ( = ?AUTO_2987 ?AUTO_2989 ) ) ( not ( = ?AUTO_2988 ?AUTO_2989 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2988 ?AUTO_2989 )
      ( MAKE-ON ?AUTO_2985 ?AUTO_2986 )
      ( MAKE-ON-VERIFY ?AUTO_2985 ?AUTO_2986 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2990 - BLOCK
      ?AUTO_2991 - BLOCK
    )
    :vars
    (
      ?AUTO_2992 - BLOCK
      ?AUTO_2993 - BLOCK
      ?AUTO_2994 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2991 ) ( not ( = ?AUTO_2990 ?AUTO_2991 ) ) ( ON ?AUTO_2990 ?AUTO_2992 ) ( not ( = ?AUTO_2990 ?AUTO_2992 ) ) ( not ( = ?AUTO_2991 ?AUTO_2992 ) ) ( CLEAR ?AUTO_2993 ) ( not ( = ?AUTO_2990 ?AUTO_2994 ) ) ( not ( = ?AUTO_2990 ?AUTO_2993 ) ) ( not ( = ?AUTO_2991 ?AUTO_2994 ) ) ( not ( = ?AUTO_2991 ?AUTO_2993 ) ) ( not ( = ?AUTO_2992 ?AUTO_2994 ) ) ( not ( = ?AUTO_2992 ?AUTO_2993 ) ) ( not ( = ?AUTO_2994 ?AUTO_2993 ) ) ( ON ?AUTO_2994 ?AUTO_2990 ) ( CLEAR ?AUTO_2994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2994 ?AUTO_2990 )
      ( MAKE-ON ?AUTO_2990 ?AUTO_2991 )
      ( MAKE-ON-VERIFY ?AUTO_2990 ?AUTO_2991 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2995 - BLOCK
      ?AUTO_2996 - BLOCK
    )
    :vars
    (
      ?AUTO_2997 - BLOCK
      ?AUTO_2999 - BLOCK
      ?AUTO_2998 - BLOCK
      ?AUTO_3000 - BLOCK
      ?AUTO_3001 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2996 ) ( not ( = ?AUTO_2995 ?AUTO_2996 ) ) ( ON ?AUTO_2995 ?AUTO_2997 ) ( not ( = ?AUTO_2995 ?AUTO_2997 ) ) ( not ( = ?AUTO_2996 ?AUTO_2997 ) ) ( CLEAR ?AUTO_2999 ) ( not ( = ?AUTO_2995 ?AUTO_2998 ) ) ( not ( = ?AUTO_2995 ?AUTO_2999 ) ) ( not ( = ?AUTO_2996 ?AUTO_2998 ) ) ( not ( = ?AUTO_2996 ?AUTO_2999 ) ) ( not ( = ?AUTO_2997 ?AUTO_2998 ) ) ( not ( = ?AUTO_2997 ?AUTO_2999 ) ) ( not ( = ?AUTO_2998 ?AUTO_2999 ) ) ( ON ?AUTO_2998 ?AUTO_2995 ) ( CLEAR ?AUTO_2998 ) ( HOLDING ?AUTO_3000 ) ( CLEAR ?AUTO_3001 ) ( not ( = ?AUTO_2995 ?AUTO_3000 ) ) ( not ( = ?AUTO_2995 ?AUTO_3001 ) ) ( not ( = ?AUTO_2996 ?AUTO_3000 ) ) ( not ( = ?AUTO_2996 ?AUTO_3001 ) ) ( not ( = ?AUTO_2997 ?AUTO_3000 ) ) ( not ( = ?AUTO_2997 ?AUTO_3001 ) ) ( not ( = ?AUTO_2999 ?AUTO_3000 ) ) ( not ( = ?AUTO_2999 ?AUTO_3001 ) ) ( not ( = ?AUTO_2998 ?AUTO_3000 ) ) ( not ( = ?AUTO_2998 ?AUTO_3001 ) ) ( not ( = ?AUTO_3000 ?AUTO_3001 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3000 ?AUTO_3001 )
      ( MAKE-ON ?AUTO_2995 ?AUTO_2996 )
      ( MAKE-ON-VERIFY ?AUTO_2995 ?AUTO_2996 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3012 - BLOCK
      ?AUTO_3013 - BLOCK
    )
    :vars
    (
      ?AUTO_3015 - BLOCK
      ?AUTO_3016 - BLOCK
      ?AUTO_3014 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3012 ?AUTO_3013 ) ) ( ON ?AUTO_3012 ?AUTO_3015 ) ( not ( = ?AUTO_3012 ?AUTO_3015 ) ) ( not ( = ?AUTO_3013 ?AUTO_3015 ) ) ( CLEAR ?AUTO_3016 ) ( not ( = ?AUTO_3012 ?AUTO_3014 ) ) ( not ( = ?AUTO_3012 ?AUTO_3016 ) ) ( not ( = ?AUTO_3013 ?AUTO_3014 ) ) ( not ( = ?AUTO_3013 ?AUTO_3016 ) ) ( not ( = ?AUTO_3015 ?AUTO_3014 ) ) ( not ( = ?AUTO_3015 ?AUTO_3016 ) ) ( not ( = ?AUTO_3014 ?AUTO_3016 ) ) ( ON ?AUTO_3014 ?AUTO_3012 ) ( CLEAR ?AUTO_3014 ) ( HOLDING ?AUTO_3013 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3013 )
      ( MAKE-ON ?AUTO_3012 ?AUTO_3013 )
      ( MAKE-ON-VERIFY ?AUTO_3012 ?AUTO_3013 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3023 - BLOCK
      ?AUTO_3024 - BLOCK
    )
    :vars
    (
      ?AUTO_3025 - BLOCK
      ?AUTO_3026 - BLOCK
      ?AUTO_3027 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3023 ?AUTO_3024 ) ) ( not ( = ?AUTO_3023 ?AUTO_3025 ) ) ( not ( = ?AUTO_3024 ?AUTO_3025 ) ) ( CLEAR ?AUTO_3026 ) ( not ( = ?AUTO_3023 ?AUTO_3027 ) ) ( not ( = ?AUTO_3023 ?AUTO_3026 ) ) ( not ( = ?AUTO_3024 ?AUTO_3027 ) ) ( not ( = ?AUTO_3024 ?AUTO_3026 ) ) ( not ( = ?AUTO_3025 ?AUTO_3027 ) ) ( not ( = ?AUTO_3025 ?AUTO_3026 ) ) ( not ( = ?AUTO_3027 ?AUTO_3026 ) ) ( ON ?AUTO_3027 ?AUTO_3024 ) ( CLEAR ?AUTO_3027 ) ( HOLDING ?AUTO_3023 ) ( CLEAR ?AUTO_3025 ) )
    :subtasks
    ( ( !STACK ?AUTO_3023 ?AUTO_3025 )
      ( MAKE-ON ?AUTO_3023 ?AUTO_3024 )
      ( MAKE-ON-VERIFY ?AUTO_3023 ?AUTO_3024 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3028 - BLOCK
      ?AUTO_3029 - BLOCK
    )
    :vars
    (
      ?AUTO_3031 - BLOCK
      ?AUTO_3032 - BLOCK
      ?AUTO_3030 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3028 ?AUTO_3029 ) ) ( not ( = ?AUTO_3028 ?AUTO_3031 ) ) ( not ( = ?AUTO_3029 ?AUTO_3031 ) ) ( CLEAR ?AUTO_3032 ) ( not ( = ?AUTO_3028 ?AUTO_3030 ) ) ( not ( = ?AUTO_3028 ?AUTO_3032 ) ) ( not ( = ?AUTO_3029 ?AUTO_3030 ) ) ( not ( = ?AUTO_3029 ?AUTO_3032 ) ) ( not ( = ?AUTO_3031 ?AUTO_3030 ) ) ( not ( = ?AUTO_3031 ?AUTO_3032 ) ) ( not ( = ?AUTO_3030 ?AUTO_3032 ) ) ( ON ?AUTO_3030 ?AUTO_3029 ) ( CLEAR ?AUTO_3030 ) ( CLEAR ?AUTO_3031 ) ( ON-TABLE ?AUTO_3028 ) ( CLEAR ?AUTO_3028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3028 )
      ( MAKE-ON ?AUTO_3028 ?AUTO_3029 )
      ( MAKE-ON-VERIFY ?AUTO_3028 ?AUTO_3029 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3033 - BLOCK
      ?AUTO_3034 - BLOCK
    )
    :vars
    (
      ?AUTO_3035 - BLOCK
      ?AUTO_3036 - BLOCK
      ?AUTO_3037 - BLOCK
      ?AUTO_3038 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3033 ?AUTO_3034 ) ) ( not ( = ?AUTO_3033 ?AUTO_3035 ) ) ( not ( = ?AUTO_3034 ?AUTO_3035 ) ) ( CLEAR ?AUTO_3036 ) ( not ( = ?AUTO_3033 ?AUTO_3037 ) ) ( not ( = ?AUTO_3033 ?AUTO_3036 ) ) ( not ( = ?AUTO_3034 ?AUTO_3037 ) ) ( not ( = ?AUTO_3034 ?AUTO_3036 ) ) ( not ( = ?AUTO_3035 ?AUTO_3037 ) ) ( not ( = ?AUTO_3035 ?AUTO_3036 ) ) ( not ( = ?AUTO_3037 ?AUTO_3036 ) ) ( ON ?AUTO_3037 ?AUTO_3034 ) ( CLEAR ?AUTO_3037 ) ( ON-TABLE ?AUTO_3033 ) ( CLEAR ?AUTO_3033 ) ( HOLDING ?AUTO_3035 ) ( CLEAR ?AUTO_3038 ) ( not ( = ?AUTO_3033 ?AUTO_3038 ) ) ( not ( = ?AUTO_3034 ?AUTO_3038 ) ) ( not ( = ?AUTO_3035 ?AUTO_3038 ) ) ( not ( = ?AUTO_3036 ?AUTO_3038 ) ) ( not ( = ?AUTO_3037 ?AUTO_3038 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3035 ?AUTO_3038 )
      ( MAKE-ON ?AUTO_3033 ?AUTO_3034 )
      ( MAKE-ON-VERIFY ?AUTO_3033 ?AUTO_3034 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3039 - BLOCK
      ?AUTO_3040 - BLOCK
    )
    :vars
    (
      ?AUTO_3041 - BLOCK
      ?AUTO_3044 - BLOCK
      ?AUTO_3043 - BLOCK
      ?AUTO_3042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3039 ?AUTO_3040 ) ) ( not ( = ?AUTO_3039 ?AUTO_3041 ) ) ( not ( = ?AUTO_3040 ?AUTO_3041 ) ) ( CLEAR ?AUTO_3044 ) ( not ( = ?AUTO_3039 ?AUTO_3043 ) ) ( not ( = ?AUTO_3039 ?AUTO_3044 ) ) ( not ( = ?AUTO_3040 ?AUTO_3043 ) ) ( not ( = ?AUTO_3040 ?AUTO_3044 ) ) ( not ( = ?AUTO_3041 ?AUTO_3043 ) ) ( not ( = ?AUTO_3041 ?AUTO_3044 ) ) ( not ( = ?AUTO_3043 ?AUTO_3044 ) ) ( ON ?AUTO_3043 ?AUTO_3040 ) ( CLEAR ?AUTO_3043 ) ( ON-TABLE ?AUTO_3039 ) ( CLEAR ?AUTO_3042 ) ( not ( = ?AUTO_3039 ?AUTO_3042 ) ) ( not ( = ?AUTO_3040 ?AUTO_3042 ) ) ( not ( = ?AUTO_3041 ?AUTO_3042 ) ) ( not ( = ?AUTO_3044 ?AUTO_3042 ) ) ( not ( = ?AUTO_3043 ?AUTO_3042 ) ) ( ON ?AUTO_3041 ?AUTO_3039 ) ( CLEAR ?AUTO_3041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3041 ?AUTO_3039 )
      ( MAKE-ON ?AUTO_3039 ?AUTO_3040 )
      ( MAKE-ON-VERIFY ?AUTO_3039 ?AUTO_3040 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3045 - BLOCK
      ?AUTO_3046 - BLOCK
    )
    :vars
    (
      ?AUTO_3047 - BLOCK
      ?AUTO_3050 - BLOCK
      ?AUTO_3049 - BLOCK
      ?AUTO_3048 - BLOCK
      ?AUTO_3051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3045 ?AUTO_3046 ) ) ( not ( = ?AUTO_3045 ?AUTO_3047 ) ) ( not ( = ?AUTO_3046 ?AUTO_3047 ) ) ( not ( = ?AUTO_3045 ?AUTO_3050 ) ) ( not ( = ?AUTO_3045 ?AUTO_3049 ) ) ( not ( = ?AUTO_3046 ?AUTO_3050 ) ) ( not ( = ?AUTO_3046 ?AUTO_3049 ) ) ( not ( = ?AUTO_3047 ?AUTO_3050 ) ) ( not ( = ?AUTO_3047 ?AUTO_3049 ) ) ( not ( = ?AUTO_3050 ?AUTO_3049 ) ) ( ON ?AUTO_3050 ?AUTO_3046 ) ( CLEAR ?AUTO_3050 ) ( ON-TABLE ?AUTO_3045 ) ( CLEAR ?AUTO_3048 ) ( not ( = ?AUTO_3045 ?AUTO_3048 ) ) ( not ( = ?AUTO_3046 ?AUTO_3048 ) ) ( not ( = ?AUTO_3047 ?AUTO_3048 ) ) ( not ( = ?AUTO_3049 ?AUTO_3048 ) ) ( not ( = ?AUTO_3050 ?AUTO_3048 ) ) ( ON ?AUTO_3047 ?AUTO_3045 ) ( CLEAR ?AUTO_3047 ) ( HOLDING ?AUTO_3049 ) ( CLEAR ?AUTO_3051 ) ( not ( = ?AUTO_3045 ?AUTO_3051 ) ) ( not ( = ?AUTO_3046 ?AUTO_3051 ) ) ( not ( = ?AUTO_3047 ?AUTO_3051 ) ) ( not ( = ?AUTO_3050 ?AUTO_3051 ) ) ( not ( = ?AUTO_3049 ?AUTO_3051 ) ) ( not ( = ?AUTO_3048 ?AUTO_3051 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3049 ?AUTO_3051 )
      ( MAKE-ON ?AUTO_3045 ?AUTO_3046 )
      ( MAKE-ON-VERIFY ?AUTO_3045 ?AUTO_3046 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3056 - BLOCK
      ?AUTO_3057 - BLOCK
    )
    :vars
    (
      ?AUTO_3059 - BLOCK
      ?AUTO_3060 - BLOCK
      ?AUTO_3061 - BLOCK
      ?AUTO_3062 - BLOCK
      ?AUTO_3058 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3056 ?AUTO_3057 ) ) ( not ( = ?AUTO_3056 ?AUTO_3059 ) ) ( not ( = ?AUTO_3057 ?AUTO_3059 ) ) ( not ( = ?AUTO_3056 ?AUTO_3060 ) ) ( not ( = ?AUTO_3056 ?AUTO_3061 ) ) ( not ( = ?AUTO_3057 ?AUTO_3060 ) ) ( not ( = ?AUTO_3057 ?AUTO_3061 ) ) ( not ( = ?AUTO_3059 ?AUTO_3060 ) ) ( not ( = ?AUTO_3059 ?AUTO_3061 ) ) ( not ( = ?AUTO_3060 ?AUTO_3061 ) ) ( ON ?AUTO_3060 ?AUTO_3057 ) ( CLEAR ?AUTO_3060 ) ( ON-TABLE ?AUTO_3056 ) ( CLEAR ?AUTO_3062 ) ( not ( = ?AUTO_3056 ?AUTO_3062 ) ) ( not ( = ?AUTO_3057 ?AUTO_3062 ) ) ( not ( = ?AUTO_3059 ?AUTO_3062 ) ) ( not ( = ?AUTO_3061 ?AUTO_3062 ) ) ( not ( = ?AUTO_3060 ?AUTO_3062 ) ) ( ON ?AUTO_3059 ?AUTO_3056 ) ( CLEAR ?AUTO_3058 ) ( not ( = ?AUTO_3056 ?AUTO_3058 ) ) ( not ( = ?AUTO_3057 ?AUTO_3058 ) ) ( not ( = ?AUTO_3059 ?AUTO_3058 ) ) ( not ( = ?AUTO_3060 ?AUTO_3058 ) ) ( not ( = ?AUTO_3061 ?AUTO_3058 ) ) ( not ( = ?AUTO_3062 ?AUTO_3058 ) ) ( ON ?AUTO_3061 ?AUTO_3059 ) ( CLEAR ?AUTO_3061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3061 ?AUTO_3059 )
      ( MAKE-ON ?AUTO_3056 ?AUTO_3057 )
      ( MAKE-ON-VERIFY ?AUTO_3056 ?AUTO_3057 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3065 - BLOCK
      ?AUTO_3066 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3065 ) ( CLEAR ?AUTO_3066 ) ( not ( = ?AUTO_3065 ?AUTO_3066 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3065 ?AUTO_3066 )
      ( MAKE-ON-VERIFY ?AUTO_3065 ?AUTO_3066 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3067 - BLOCK
      ?AUTO_3068 - BLOCK
    )
    :vars
    (
      ?AUTO_3069 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3068 ) ( not ( = ?AUTO_3067 ?AUTO_3068 ) ) ( ON ?AUTO_3067 ?AUTO_3069 ) ( CLEAR ?AUTO_3067 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3067 ?AUTO_3069 ) ) ( not ( = ?AUTO_3068 ?AUTO_3069 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3067 ?AUTO_3069 )
      ( MAKE-ON ?AUTO_3067 ?AUTO_3068 )
      ( MAKE-ON-VERIFY ?AUTO_3067 ?AUTO_3068 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3070 - BLOCK
      ?AUTO_3071 - BLOCK
    )
    :vars
    (
      ?AUTO_3072 - BLOCK
      ?AUTO_3073 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3070 ?AUTO_3071 ) ) ( ON ?AUTO_3070 ?AUTO_3072 ) ( CLEAR ?AUTO_3070 ) ( not ( = ?AUTO_3070 ?AUTO_3072 ) ) ( not ( = ?AUTO_3071 ?AUTO_3072 ) ) ( HOLDING ?AUTO_3071 ) ( CLEAR ?AUTO_3073 ) ( not ( = ?AUTO_3070 ?AUTO_3073 ) ) ( not ( = ?AUTO_3071 ?AUTO_3073 ) ) ( not ( = ?AUTO_3072 ?AUTO_3073 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3071 ?AUTO_3073 )
      ( MAKE-ON ?AUTO_3070 ?AUTO_3071 )
      ( MAKE-ON-VERIFY ?AUTO_3070 ?AUTO_3071 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3146 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3146 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3146 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3146 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3147 - BLOCK
    )
    :vars
    (
      ?AUTO_3148 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3147 ?AUTO_3148 ) ( CLEAR ?AUTO_3147 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3147 ?AUTO_3148 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3147 ?AUTO_3148 )
      ( MAKE-ON-TABLE ?AUTO_3147 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3147 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3149 - BLOCK
    )
    :vars
    (
      ?AUTO_3150 - BLOCK
      ?AUTO_3151 - BLOCK
      ?AUTO_3152 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3149 ?AUTO_3150 ) ( CLEAR ?AUTO_3149 ) ( not ( = ?AUTO_3149 ?AUTO_3150 ) ) ( HOLDING ?AUTO_3151 ) ( CLEAR ?AUTO_3152 ) ( not ( = ?AUTO_3149 ?AUTO_3151 ) ) ( not ( = ?AUTO_3149 ?AUTO_3152 ) ) ( not ( = ?AUTO_3150 ?AUTO_3151 ) ) ( not ( = ?AUTO_3150 ?AUTO_3152 ) ) ( not ( = ?AUTO_3151 ?AUTO_3152 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3151 ?AUTO_3152 )
      ( MAKE-ON-TABLE ?AUTO_3149 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3149 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3155 - BLOCK
    )
    :vars
    (
      ?AUTO_3158 - BLOCK
      ?AUTO_3156 - BLOCK
      ?AUTO_3157 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3155 ?AUTO_3158 ) ( not ( = ?AUTO_3155 ?AUTO_3158 ) ) ( CLEAR ?AUTO_3156 ) ( not ( = ?AUTO_3155 ?AUTO_3157 ) ) ( not ( = ?AUTO_3155 ?AUTO_3156 ) ) ( not ( = ?AUTO_3158 ?AUTO_3157 ) ) ( not ( = ?AUTO_3158 ?AUTO_3156 ) ) ( not ( = ?AUTO_3157 ?AUTO_3156 ) ) ( ON ?AUTO_3157 ?AUTO_3155 ) ( CLEAR ?AUTO_3157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3157 ?AUTO_3155 )
      ( MAKE-ON-TABLE ?AUTO_3155 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3155 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3159 - BLOCK
    )
    :vars
    (
      ?AUTO_3162 - BLOCK
      ?AUTO_3161 - BLOCK
      ?AUTO_3160 - BLOCK
      ?AUTO_3163 - BLOCK
      ?AUTO_3164 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3159 ?AUTO_3162 ) ( not ( = ?AUTO_3159 ?AUTO_3162 ) ) ( CLEAR ?AUTO_3161 ) ( not ( = ?AUTO_3159 ?AUTO_3160 ) ) ( not ( = ?AUTO_3159 ?AUTO_3161 ) ) ( not ( = ?AUTO_3162 ?AUTO_3160 ) ) ( not ( = ?AUTO_3162 ?AUTO_3161 ) ) ( not ( = ?AUTO_3160 ?AUTO_3161 ) ) ( ON ?AUTO_3160 ?AUTO_3159 ) ( CLEAR ?AUTO_3160 ) ( HOLDING ?AUTO_3163 ) ( CLEAR ?AUTO_3164 ) ( not ( = ?AUTO_3159 ?AUTO_3163 ) ) ( not ( = ?AUTO_3159 ?AUTO_3164 ) ) ( not ( = ?AUTO_3162 ?AUTO_3163 ) ) ( not ( = ?AUTO_3162 ?AUTO_3164 ) ) ( not ( = ?AUTO_3161 ?AUTO_3163 ) ) ( not ( = ?AUTO_3161 ?AUTO_3164 ) ) ( not ( = ?AUTO_3160 ?AUTO_3163 ) ) ( not ( = ?AUTO_3160 ?AUTO_3164 ) ) ( not ( = ?AUTO_3163 ?AUTO_3164 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3163 ?AUTO_3164 )
      ( MAKE-ON-TABLE ?AUTO_3159 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3159 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3165 - BLOCK
    )
    :vars
    (
      ?AUTO_3170 - BLOCK
      ?AUTO_3166 - BLOCK
      ?AUTO_3167 - BLOCK
      ?AUTO_3169 - BLOCK
      ?AUTO_3168 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3165 ?AUTO_3170 ) ( not ( = ?AUTO_3165 ?AUTO_3170 ) ) ( CLEAR ?AUTO_3166 ) ( not ( = ?AUTO_3165 ?AUTO_3167 ) ) ( not ( = ?AUTO_3165 ?AUTO_3166 ) ) ( not ( = ?AUTO_3170 ?AUTO_3167 ) ) ( not ( = ?AUTO_3170 ?AUTO_3166 ) ) ( not ( = ?AUTO_3167 ?AUTO_3166 ) ) ( ON ?AUTO_3167 ?AUTO_3165 ) ( CLEAR ?AUTO_3169 ) ( not ( = ?AUTO_3165 ?AUTO_3168 ) ) ( not ( = ?AUTO_3165 ?AUTO_3169 ) ) ( not ( = ?AUTO_3170 ?AUTO_3168 ) ) ( not ( = ?AUTO_3170 ?AUTO_3169 ) ) ( not ( = ?AUTO_3166 ?AUTO_3168 ) ) ( not ( = ?AUTO_3166 ?AUTO_3169 ) ) ( not ( = ?AUTO_3167 ?AUTO_3168 ) ) ( not ( = ?AUTO_3167 ?AUTO_3169 ) ) ( not ( = ?AUTO_3168 ?AUTO_3169 ) ) ( ON ?AUTO_3168 ?AUTO_3167 ) ( CLEAR ?AUTO_3168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3168 ?AUTO_3167 )
      ( MAKE-ON-TABLE ?AUTO_3165 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3165 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3171 - BLOCK
    )
    :vars
    (
      ?AUTO_3174 - BLOCK
      ?AUTO_3175 - BLOCK
      ?AUTO_3176 - BLOCK
      ?AUTO_3173 - BLOCK
      ?AUTO_3172 - BLOCK
      ?AUTO_3177 - BLOCK
      ?AUTO_3178 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3171 ?AUTO_3174 ) ( not ( = ?AUTO_3171 ?AUTO_3174 ) ) ( CLEAR ?AUTO_3175 ) ( not ( = ?AUTO_3171 ?AUTO_3176 ) ) ( not ( = ?AUTO_3171 ?AUTO_3175 ) ) ( not ( = ?AUTO_3174 ?AUTO_3176 ) ) ( not ( = ?AUTO_3174 ?AUTO_3175 ) ) ( not ( = ?AUTO_3176 ?AUTO_3175 ) ) ( ON ?AUTO_3176 ?AUTO_3171 ) ( CLEAR ?AUTO_3173 ) ( not ( = ?AUTO_3171 ?AUTO_3172 ) ) ( not ( = ?AUTO_3171 ?AUTO_3173 ) ) ( not ( = ?AUTO_3174 ?AUTO_3172 ) ) ( not ( = ?AUTO_3174 ?AUTO_3173 ) ) ( not ( = ?AUTO_3175 ?AUTO_3172 ) ) ( not ( = ?AUTO_3175 ?AUTO_3173 ) ) ( not ( = ?AUTO_3176 ?AUTO_3172 ) ) ( not ( = ?AUTO_3176 ?AUTO_3173 ) ) ( not ( = ?AUTO_3172 ?AUTO_3173 ) ) ( ON ?AUTO_3172 ?AUTO_3176 ) ( CLEAR ?AUTO_3172 ) ( HOLDING ?AUTO_3177 ) ( CLEAR ?AUTO_3178 ) ( not ( = ?AUTO_3171 ?AUTO_3177 ) ) ( not ( = ?AUTO_3171 ?AUTO_3178 ) ) ( not ( = ?AUTO_3174 ?AUTO_3177 ) ) ( not ( = ?AUTO_3174 ?AUTO_3178 ) ) ( not ( = ?AUTO_3175 ?AUTO_3177 ) ) ( not ( = ?AUTO_3175 ?AUTO_3178 ) ) ( not ( = ?AUTO_3176 ?AUTO_3177 ) ) ( not ( = ?AUTO_3176 ?AUTO_3178 ) ) ( not ( = ?AUTO_3173 ?AUTO_3177 ) ) ( not ( = ?AUTO_3173 ?AUTO_3178 ) ) ( not ( = ?AUTO_3172 ?AUTO_3177 ) ) ( not ( = ?AUTO_3172 ?AUTO_3178 ) ) ( not ( = ?AUTO_3177 ?AUTO_3178 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3177 ?AUTO_3178 )
      ( MAKE-ON-TABLE ?AUTO_3171 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3171 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3184 - BLOCK
    )
    :vars
    (
      ?AUTO_3187 - BLOCK
      ?AUTO_3189 - BLOCK
      ?AUTO_3186 - BLOCK
      ?AUTO_3188 - BLOCK
      ?AUTO_3185 - BLOCK
      ?AUTO_3190 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3184 ?AUTO_3187 ) ( not ( = ?AUTO_3184 ?AUTO_3187 ) ) ( CLEAR ?AUTO_3189 ) ( not ( = ?AUTO_3184 ?AUTO_3186 ) ) ( not ( = ?AUTO_3184 ?AUTO_3189 ) ) ( not ( = ?AUTO_3187 ?AUTO_3186 ) ) ( not ( = ?AUTO_3187 ?AUTO_3189 ) ) ( not ( = ?AUTO_3186 ?AUTO_3189 ) ) ( ON ?AUTO_3186 ?AUTO_3184 ) ( CLEAR ?AUTO_3188 ) ( not ( = ?AUTO_3184 ?AUTO_3185 ) ) ( not ( = ?AUTO_3184 ?AUTO_3188 ) ) ( not ( = ?AUTO_3187 ?AUTO_3185 ) ) ( not ( = ?AUTO_3187 ?AUTO_3188 ) ) ( not ( = ?AUTO_3189 ?AUTO_3185 ) ) ( not ( = ?AUTO_3189 ?AUTO_3188 ) ) ( not ( = ?AUTO_3186 ?AUTO_3185 ) ) ( not ( = ?AUTO_3186 ?AUTO_3188 ) ) ( not ( = ?AUTO_3185 ?AUTO_3188 ) ) ( ON ?AUTO_3185 ?AUTO_3186 ) ( CLEAR ?AUTO_3185 ) ( HOLDING ?AUTO_3190 ) ( not ( = ?AUTO_3184 ?AUTO_3190 ) ) ( not ( = ?AUTO_3187 ?AUTO_3190 ) ) ( not ( = ?AUTO_3189 ?AUTO_3190 ) ) ( not ( = ?AUTO_3186 ?AUTO_3190 ) ) ( not ( = ?AUTO_3188 ?AUTO_3190 ) ) ( not ( = ?AUTO_3185 ?AUTO_3190 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3190 )
      ( MAKE-ON-TABLE ?AUTO_3184 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3184 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3204 - BLOCK
      ?AUTO_3205 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3204 ) ( CLEAR ?AUTO_3205 ) ( not ( = ?AUTO_3204 ?AUTO_3205 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3204 ?AUTO_3205 )
      ( MAKE-ON-VERIFY ?AUTO_3204 ?AUTO_3205 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3206 - BLOCK
      ?AUTO_3207 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3207 ) ( not ( = ?AUTO_3206 ?AUTO_3207 ) ) ( ON-TABLE ?AUTO_3206 ) ( CLEAR ?AUTO_3206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3206 )
      ( MAKE-ON ?AUTO_3206 ?AUTO_3207 )
      ( MAKE-ON-VERIFY ?AUTO_3206 ?AUTO_3207 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3208 - BLOCK
      ?AUTO_3209 - BLOCK
    )
    :vars
    (
      ?AUTO_3210 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3209 ) ( not ( = ?AUTO_3208 ?AUTO_3209 ) ) ( ON-TABLE ?AUTO_3208 ) ( CLEAR ?AUTO_3208 ) ( HOLDING ?AUTO_3210 ) ( not ( = ?AUTO_3208 ?AUTO_3210 ) ) ( not ( = ?AUTO_3209 ?AUTO_3210 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3210 )
      ( MAKE-ON ?AUTO_3208 ?AUTO_3209 )
      ( MAKE-ON-VERIFY ?AUTO_3208 ?AUTO_3209 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3211 - BLOCK
      ?AUTO_3212 - BLOCK
    )
    :vars
    (
      ?AUTO_3213 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3212 ) ( not ( = ?AUTO_3211 ?AUTO_3212 ) ) ( ON-TABLE ?AUTO_3211 ) ( not ( = ?AUTO_3211 ?AUTO_3213 ) ) ( not ( = ?AUTO_3212 ?AUTO_3213 ) ) ( ON ?AUTO_3213 ?AUTO_3211 ) ( CLEAR ?AUTO_3213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3213 ?AUTO_3211 )
      ( MAKE-ON ?AUTO_3211 ?AUTO_3212 )
      ( MAKE-ON-VERIFY ?AUTO_3211 ?AUTO_3212 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3214 - BLOCK
      ?AUTO_3215 - BLOCK
    )
    :vars
    (
      ?AUTO_3216 - BLOCK
      ?AUTO_3217 - BLOCK
      ?AUTO_3218 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3215 ) ( not ( = ?AUTO_3214 ?AUTO_3215 ) ) ( ON-TABLE ?AUTO_3214 ) ( not ( = ?AUTO_3214 ?AUTO_3216 ) ) ( not ( = ?AUTO_3215 ?AUTO_3216 ) ) ( ON ?AUTO_3216 ?AUTO_3214 ) ( CLEAR ?AUTO_3216 ) ( HOLDING ?AUTO_3217 ) ( CLEAR ?AUTO_3218 ) ( not ( = ?AUTO_3214 ?AUTO_3217 ) ) ( not ( = ?AUTO_3214 ?AUTO_3218 ) ) ( not ( = ?AUTO_3215 ?AUTO_3217 ) ) ( not ( = ?AUTO_3215 ?AUTO_3218 ) ) ( not ( = ?AUTO_3216 ?AUTO_3217 ) ) ( not ( = ?AUTO_3216 ?AUTO_3218 ) ) ( not ( = ?AUTO_3217 ?AUTO_3218 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3217 ?AUTO_3218 )
      ( MAKE-ON ?AUTO_3214 ?AUTO_3215 )
      ( MAKE-ON-VERIFY ?AUTO_3214 ?AUTO_3215 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3219 - BLOCK
      ?AUTO_3220 - BLOCK
    )
    :vars
    (
      ?AUTO_3221 - BLOCK
      ?AUTO_3223 - BLOCK
      ?AUTO_3222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3219 ?AUTO_3220 ) ) ( ON-TABLE ?AUTO_3219 ) ( not ( = ?AUTO_3219 ?AUTO_3221 ) ) ( not ( = ?AUTO_3220 ?AUTO_3221 ) ) ( ON ?AUTO_3221 ?AUTO_3219 ) ( CLEAR ?AUTO_3221 ) ( CLEAR ?AUTO_3223 ) ( not ( = ?AUTO_3219 ?AUTO_3222 ) ) ( not ( = ?AUTO_3219 ?AUTO_3223 ) ) ( not ( = ?AUTO_3220 ?AUTO_3222 ) ) ( not ( = ?AUTO_3220 ?AUTO_3223 ) ) ( not ( = ?AUTO_3221 ?AUTO_3222 ) ) ( not ( = ?AUTO_3221 ?AUTO_3223 ) ) ( not ( = ?AUTO_3222 ?AUTO_3223 ) ) ( ON ?AUTO_3222 ?AUTO_3220 ) ( CLEAR ?AUTO_3222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3222 ?AUTO_3220 )
      ( MAKE-ON ?AUTO_3219 ?AUTO_3220 )
      ( MAKE-ON-VERIFY ?AUTO_3219 ?AUTO_3220 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3224 - BLOCK
      ?AUTO_3225 - BLOCK
    )
    :vars
    (
      ?AUTO_3227 - BLOCK
      ?AUTO_3228 - BLOCK
      ?AUTO_3226 - BLOCK
      ?AUTO_3229 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3224 ?AUTO_3225 ) ) ( ON-TABLE ?AUTO_3224 ) ( not ( = ?AUTO_3224 ?AUTO_3227 ) ) ( not ( = ?AUTO_3225 ?AUTO_3227 ) ) ( ON ?AUTO_3227 ?AUTO_3224 ) ( CLEAR ?AUTO_3227 ) ( not ( = ?AUTO_3224 ?AUTO_3228 ) ) ( not ( = ?AUTO_3224 ?AUTO_3226 ) ) ( not ( = ?AUTO_3225 ?AUTO_3228 ) ) ( not ( = ?AUTO_3225 ?AUTO_3226 ) ) ( not ( = ?AUTO_3227 ?AUTO_3228 ) ) ( not ( = ?AUTO_3227 ?AUTO_3226 ) ) ( not ( = ?AUTO_3228 ?AUTO_3226 ) ) ( ON ?AUTO_3228 ?AUTO_3225 ) ( CLEAR ?AUTO_3228 ) ( HOLDING ?AUTO_3226 ) ( CLEAR ?AUTO_3229 ) ( not ( = ?AUTO_3224 ?AUTO_3229 ) ) ( not ( = ?AUTO_3225 ?AUTO_3229 ) ) ( not ( = ?AUTO_3227 ?AUTO_3229 ) ) ( not ( = ?AUTO_3228 ?AUTO_3229 ) ) ( not ( = ?AUTO_3226 ?AUTO_3229 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3226 ?AUTO_3229 )
      ( MAKE-ON ?AUTO_3224 ?AUTO_3225 )
      ( MAKE-ON-VERIFY ?AUTO_3224 ?AUTO_3225 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3230 - BLOCK
      ?AUTO_3231 - BLOCK
    )
    :vars
    (
      ?AUTO_3232 - BLOCK
      ?AUTO_3235 - BLOCK
      ?AUTO_3233 - BLOCK
      ?AUTO_3234 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3230 ?AUTO_3231 ) ) ( ON-TABLE ?AUTO_3230 ) ( not ( = ?AUTO_3230 ?AUTO_3232 ) ) ( not ( = ?AUTO_3231 ?AUTO_3232 ) ) ( ON ?AUTO_3232 ?AUTO_3230 ) ( not ( = ?AUTO_3230 ?AUTO_3235 ) ) ( not ( = ?AUTO_3230 ?AUTO_3233 ) ) ( not ( = ?AUTO_3231 ?AUTO_3235 ) ) ( not ( = ?AUTO_3231 ?AUTO_3233 ) ) ( not ( = ?AUTO_3232 ?AUTO_3235 ) ) ( not ( = ?AUTO_3232 ?AUTO_3233 ) ) ( not ( = ?AUTO_3235 ?AUTO_3233 ) ) ( ON ?AUTO_3235 ?AUTO_3231 ) ( CLEAR ?AUTO_3235 ) ( CLEAR ?AUTO_3234 ) ( not ( = ?AUTO_3230 ?AUTO_3234 ) ) ( not ( = ?AUTO_3231 ?AUTO_3234 ) ) ( not ( = ?AUTO_3232 ?AUTO_3234 ) ) ( not ( = ?AUTO_3235 ?AUTO_3234 ) ) ( not ( = ?AUTO_3233 ?AUTO_3234 ) ) ( ON ?AUTO_3233 ?AUTO_3232 ) ( CLEAR ?AUTO_3233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3233 ?AUTO_3232 )
      ( MAKE-ON ?AUTO_3230 ?AUTO_3231 )
      ( MAKE-ON-VERIFY ?AUTO_3230 ?AUTO_3231 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3236 - BLOCK
      ?AUTO_3237 - BLOCK
    )
    :vars
    (
      ?AUTO_3238 - BLOCK
      ?AUTO_3240 - BLOCK
      ?AUTO_3241 - BLOCK
      ?AUTO_3239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3236 ?AUTO_3237 ) ) ( ON-TABLE ?AUTO_3236 ) ( not ( = ?AUTO_3236 ?AUTO_3238 ) ) ( not ( = ?AUTO_3237 ?AUTO_3238 ) ) ( ON ?AUTO_3238 ?AUTO_3236 ) ( not ( = ?AUTO_3236 ?AUTO_3240 ) ) ( not ( = ?AUTO_3236 ?AUTO_3241 ) ) ( not ( = ?AUTO_3237 ?AUTO_3240 ) ) ( not ( = ?AUTO_3237 ?AUTO_3241 ) ) ( not ( = ?AUTO_3238 ?AUTO_3240 ) ) ( not ( = ?AUTO_3238 ?AUTO_3241 ) ) ( not ( = ?AUTO_3240 ?AUTO_3241 ) ) ( CLEAR ?AUTO_3239 ) ( not ( = ?AUTO_3236 ?AUTO_3239 ) ) ( not ( = ?AUTO_3237 ?AUTO_3239 ) ) ( not ( = ?AUTO_3238 ?AUTO_3239 ) ) ( not ( = ?AUTO_3240 ?AUTO_3239 ) ) ( not ( = ?AUTO_3241 ?AUTO_3239 ) ) ( ON ?AUTO_3241 ?AUTO_3238 ) ( CLEAR ?AUTO_3241 ) ( HOLDING ?AUTO_3240 ) ( CLEAR ?AUTO_3237 ) )
    :subtasks
    ( ( !STACK ?AUTO_3240 ?AUTO_3237 )
      ( MAKE-ON ?AUTO_3236 ?AUTO_3237 )
      ( MAKE-ON-VERIFY ?AUTO_3236 ?AUTO_3237 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3242 - BLOCK
      ?AUTO_3243 - BLOCK
    )
    :vars
    (
      ?AUTO_3245 - BLOCK
      ?AUTO_3247 - BLOCK
      ?AUTO_3246 - BLOCK
      ?AUTO_3244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3242 ?AUTO_3243 ) ) ( ON-TABLE ?AUTO_3242 ) ( not ( = ?AUTO_3242 ?AUTO_3245 ) ) ( not ( = ?AUTO_3243 ?AUTO_3245 ) ) ( ON ?AUTO_3245 ?AUTO_3242 ) ( not ( = ?AUTO_3242 ?AUTO_3247 ) ) ( not ( = ?AUTO_3242 ?AUTO_3246 ) ) ( not ( = ?AUTO_3243 ?AUTO_3247 ) ) ( not ( = ?AUTO_3243 ?AUTO_3246 ) ) ( not ( = ?AUTO_3245 ?AUTO_3247 ) ) ( not ( = ?AUTO_3245 ?AUTO_3246 ) ) ( not ( = ?AUTO_3247 ?AUTO_3246 ) ) ( CLEAR ?AUTO_3244 ) ( not ( = ?AUTO_3242 ?AUTO_3244 ) ) ( not ( = ?AUTO_3243 ?AUTO_3244 ) ) ( not ( = ?AUTO_3245 ?AUTO_3244 ) ) ( not ( = ?AUTO_3247 ?AUTO_3244 ) ) ( not ( = ?AUTO_3246 ?AUTO_3244 ) ) ( ON ?AUTO_3246 ?AUTO_3245 ) ( CLEAR ?AUTO_3243 ) ( ON ?AUTO_3247 ?AUTO_3246 ) ( CLEAR ?AUTO_3247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3247 ?AUTO_3246 )
      ( MAKE-ON ?AUTO_3242 ?AUTO_3243 )
      ( MAKE-ON-VERIFY ?AUTO_3242 ?AUTO_3243 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3248 - BLOCK
      ?AUTO_3249 - BLOCK
    )
    :vars
    (
      ?AUTO_3253 - BLOCK
      ?AUTO_3251 - BLOCK
      ?AUTO_3252 - BLOCK
      ?AUTO_3250 - BLOCK
      ?AUTO_3254 - BLOCK
      ?AUTO_3255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3248 ?AUTO_3249 ) ) ( ON-TABLE ?AUTO_3248 ) ( not ( = ?AUTO_3248 ?AUTO_3253 ) ) ( not ( = ?AUTO_3249 ?AUTO_3253 ) ) ( ON ?AUTO_3253 ?AUTO_3248 ) ( not ( = ?AUTO_3248 ?AUTO_3251 ) ) ( not ( = ?AUTO_3248 ?AUTO_3252 ) ) ( not ( = ?AUTO_3249 ?AUTO_3251 ) ) ( not ( = ?AUTO_3249 ?AUTO_3252 ) ) ( not ( = ?AUTO_3253 ?AUTO_3251 ) ) ( not ( = ?AUTO_3253 ?AUTO_3252 ) ) ( not ( = ?AUTO_3251 ?AUTO_3252 ) ) ( CLEAR ?AUTO_3250 ) ( not ( = ?AUTO_3248 ?AUTO_3250 ) ) ( not ( = ?AUTO_3249 ?AUTO_3250 ) ) ( not ( = ?AUTO_3253 ?AUTO_3250 ) ) ( not ( = ?AUTO_3251 ?AUTO_3250 ) ) ( not ( = ?AUTO_3252 ?AUTO_3250 ) ) ( ON ?AUTO_3252 ?AUTO_3253 ) ( CLEAR ?AUTO_3249 ) ( ON ?AUTO_3251 ?AUTO_3252 ) ( CLEAR ?AUTO_3251 ) ( HOLDING ?AUTO_3254 ) ( CLEAR ?AUTO_3255 ) ( not ( = ?AUTO_3248 ?AUTO_3254 ) ) ( not ( = ?AUTO_3248 ?AUTO_3255 ) ) ( not ( = ?AUTO_3249 ?AUTO_3254 ) ) ( not ( = ?AUTO_3249 ?AUTO_3255 ) ) ( not ( = ?AUTO_3253 ?AUTO_3254 ) ) ( not ( = ?AUTO_3253 ?AUTO_3255 ) ) ( not ( = ?AUTO_3251 ?AUTO_3254 ) ) ( not ( = ?AUTO_3251 ?AUTO_3255 ) ) ( not ( = ?AUTO_3252 ?AUTO_3254 ) ) ( not ( = ?AUTO_3252 ?AUTO_3255 ) ) ( not ( = ?AUTO_3250 ?AUTO_3254 ) ) ( not ( = ?AUTO_3250 ?AUTO_3255 ) ) ( not ( = ?AUTO_3254 ?AUTO_3255 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3254 ?AUTO_3255 )
      ( MAKE-ON ?AUTO_3248 ?AUTO_3249 )
      ( MAKE-ON-VERIFY ?AUTO_3248 ?AUTO_3249 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3260 - BLOCK
      ?AUTO_3261 - BLOCK
    )
    :vars
    (
      ?AUTO_3264 - BLOCK
      ?AUTO_3267 - BLOCK
      ?AUTO_3266 - BLOCK
      ?AUTO_3263 - BLOCK
      ?AUTO_3262 - BLOCK
      ?AUTO_3265 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3260 ?AUTO_3261 ) ) ( ON-TABLE ?AUTO_3260 ) ( not ( = ?AUTO_3260 ?AUTO_3264 ) ) ( not ( = ?AUTO_3261 ?AUTO_3264 ) ) ( ON ?AUTO_3264 ?AUTO_3260 ) ( not ( = ?AUTO_3260 ?AUTO_3267 ) ) ( not ( = ?AUTO_3260 ?AUTO_3266 ) ) ( not ( = ?AUTO_3261 ?AUTO_3267 ) ) ( not ( = ?AUTO_3261 ?AUTO_3266 ) ) ( not ( = ?AUTO_3264 ?AUTO_3267 ) ) ( not ( = ?AUTO_3264 ?AUTO_3266 ) ) ( not ( = ?AUTO_3267 ?AUTO_3266 ) ) ( CLEAR ?AUTO_3263 ) ( not ( = ?AUTO_3260 ?AUTO_3263 ) ) ( not ( = ?AUTO_3261 ?AUTO_3263 ) ) ( not ( = ?AUTO_3264 ?AUTO_3263 ) ) ( not ( = ?AUTO_3267 ?AUTO_3263 ) ) ( not ( = ?AUTO_3266 ?AUTO_3263 ) ) ( ON ?AUTO_3266 ?AUTO_3264 ) ( ON ?AUTO_3267 ?AUTO_3266 ) ( CLEAR ?AUTO_3267 ) ( CLEAR ?AUTO_3262 ) ( not ( = ?AUTO_3260 ?AUTO_3265 ) ) ( not ( = ?AUTO_3260 ?AUTO_3262 ) ) ( not ( = ?AUTO_3261 ?AUTO_3265 ) ) ( not ( = ?AUTO_3261 ?AUTO_3262 ) ) ( not ( = ?AUTO_3264 ?AUTO_3265 ) ) ( not ( = ?AUTO_3264 ?AUTO_3262 ) ) ( not ( = ?AUTO_3267 ?AUTO_3265 ) ) ( not ( = ?AUTO_3267 ?AUTO_3262 ) ) ( not ( = ?AUTO_3266 ?AUTO_3265 ) ) ( not ( = ?AUTO_3266 ?AUTO_3262 ) ) ( not ( = ?AUTO_3263 ?AUTO_3265 ) ) ( not ( = ?AUTO_3263 ?AUTO_3262 ) ) ( not ( = ?AUTO_3265 ?AUTO_3262 ) ) ( ON ?AUTO_3265 ?AUTO_3261 ) ( CLEAR ?AUTO_3265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3265 ?AUTO_3261 )
      ( MAKE-ON ?AUTO_3260 ?AUTO_3261 )
      ( MAKE-ON-VERIFY ?AUTO_3260 ?AUTO_3261 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3268 - BLOCK
      ?AUTO_3269 - BLOCK
    )
    :vars
    (
      ?AUTO_3275 - BLOCK
      ?AUTO_3272 - BLOCK
      ?AUTO_3270 - BLOCK
      ?AUTO_3273 - BLOCK
      ?AUTO_3274 - BLOCK
      ?AUTO_3271 - BLOCK
      ?AUTO_3276 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3268 ?AUTO_3269 ) ) ( ON-TABLE ?AUTO_3268 ) ( not ( = ?AUTO_3268 ?AUTO_3275 ) ) ( not ( = ?AUTO_3269 ?AUTO_3275 ) ) ( ON ?AUTO_3275 ?AUTO_3268 ) ( not ( = ?AUTO_3268 ?AUTO_3272 ) ) ( not ( = ?AUTO_3268 ?AUTO_3270 ) ) ( not ( = ?AUTO_3269 ?AUTO_3272 ) ) ( not ( = ?AUTO_3269 ?AUTO_3270 ) ) ( not ( = ?AUTO_3275 ?AUTO_3272 ) ) ( not ( = ?AUTO_3275 ?AUTO_3270 ) ) ( not ( = ?AUTO_3272 ?AUTO_3270 ) ) ( CLEAR ?AUTO_3273 ) ( not ( = ?AUTO_3268 ?AUTO_3273 ) ) ( not ( = ?AUTO_3269 ?AUTO_3273 ) ) ( not ( = ?AUTO_3275 ?AUTO_3273 ) ) ( not ( = ?AUTO_3272 ?AUTO_3273 ) ) ( not ( = ?AUTO_3270 ?AUTO_3273 ) ) ( ON ?AUTO_3270 ?AUTO_3275 ) ( ON ?AUTO_3272 ?AUTO_3270 ) ( CLEAR ?AUTO_3272 ) ( CLEAR ?AUTO_3274 ) ( not ( = ?AUTO_3268 ?AUTO_3271 ) ) ( not ( = ?AUTO_3268 ?AUTO_3274 ) ) ( not ( = ?AUTO_3269 ?AUTO_3271 ) ) ( not ( = ?AUTO_3269 ?AUTO_3274 ) ) ( not ( = ?AUTO_3275 ?AUTO_3271 ) ) ( not ( = ?AUTO_3275 ?AUTO_3274 ) ) ( not ( = ?AUTO_3272 ?AUTO_3271 ) ) ( not ( = ?AUTO_3272 ?AUTO_3274 ) ) ( not ( = ?AUTO_3270 ?AUTO_3271 ) ) ( not ( = ?AUTO_3270 ?AUTO_3274 ) ) ( not ( = ?AUTO_3273 ?AUTO_3271 ) ) ( not ( = ?AUTO_3273 ?AUTO_3274 ) ) ( not ( = ?AUTO_3271 ?AUTO_3274 ) ) ( ON ?AUTO_3271 ?AUTO_3269 ) ( CLEAR ?AUTO_3271 ) ( HOLDING ?AUTO_3276 ) ( not ( = ?AUTO_3268 ?AUTO_3276 ) ) ( not ( = ?AUTO_3269 ?AUTO_3276 ) ) ( not ( = ?AUTO_3275 ?AUTO_3276 ) ) ( not ( = ?AUTO_3272 ?AUTO_3276 ) ) ( not ( = ?AUTO_3270 ?AUTO_3276 ) ) ( not ( = ?AUTO_3273 ?AUTO_3276 ) ) ( not ( = ?AUTO_3274 ?AUTO_3276 ) ) ( not ( = ?AUTO_3271 ?AUTO_3276 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3276 )
      ( MAKE-ON ?AUTO_3268 ?AUTO_3269 )
      ( MAKE-ON-VERIFY ?AUTO_3268 ?AUTO_3269 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3277 - BLOCK
      ?AUTO_3278 - BLOCK
    )
    :vars
    (
      ?AUTO_3285 - BLOCK
      ?AUTO_3280 - BLOCK
      ?AUTO_3279 - BLOCK
      ?AUTO_3283 - BLOCK
      ?AUTO_3282 - BLOCK
      ?AUTO_3281 - BLOCK
      ?AUTO_3284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3277 ?AUTO_3278 ) ) ( ON-TABLE ?AUTO_3277 ) ( not ( = ?AUTO_3277 ?AUTO_3285 ) ) ( not ( = ?AUTO_3278 ?AUTO_3285 ) ) ( ON ?AUTO_3285 ?AUTO_3277 ) ( not ( = ?AUTO_3277 ?AUTO_3280 ) ) ( not ( = ?AUTO_3277 ?AUTO_3279 ) ) ( not ( = ?AUTO_3278 ?AUTO_3280 ) ) ( not ( = ?AUTO_3278 ?AUTO_3279 ) ) ( not ( = ?AUTO_3285 ?AUTO_3280 ) ) ( not ( = ?AUTO_3285 ?AUTO_3279 ) ) ( not ( = ?AUTO_3280 ?AUTO_3279 ) ) ( CLEAR ?AUTO_3283 ) ( not ( = ?AUTO_3277 ?AUTO_3283 ) ) ( not ( = ?AUTO_3278 ?AUTO_3283 ) ) ( not ( = ?AUTO_3285 ?AUTO_3283 ) ) ( not ( = ?AUTO_3280 ?AUTO_3283 ) ) ( not ( = ?AUTO_3279 ?AUTO_3283 ) ) ( ON ?AUTO_3279 ?AUTO_3285 ) ( ON ?AUTO_3280 ?AUTO_3279 ) ( CLEAR ?AUTO_3280 ) ( CLEAR ?AUTO_3282 ) ( not ( = ?AUTO_3277 ?AUTO_3281 ) ) ( not ( = ?AUTO_3277 ?AUTO_3282 ) ) ( not ( = ?AUTO_3278 ?AUTO_3281 ) ) ( not ( = ?AUTO_3278 ?AUTO_3282 ) ) ( not ( = ?AUTO_3285 ?AUTO_3281 ) ) ( not ( = ?AUTO_3285 ?AUTO_3282 ) ) ( not ( = ?AUTO_3280 ?AUTO_3281 ) ) ( not ( = ?AUTO_3280 ?AUTO_3282 ) ) ( not ( = ?AUTO_3279 ?AUTO_3281 ) ) ( not ( = ?AUTO_3279 ?AUTO_3282 ) ) ( not ( = ?AUTO_3283 ?AUTO_3281 ) ) ( not ( = ?AUTO_3283 ?AUTO_3282 ) ) ( not ( = ?AUTO_3281 ?AUTO_3282 ) ) ( ON ?AUTO_3281 ?AUTO_3278 ) ( not ( = ?AUTO_3277 ?AUTO_3284 ) ) ( not ( = ?AUTO_3278 ?AUTO_3284 ) ) ( not ( = ?AUTO_3285 ?AUTO_3284 ) ) ( not ( = ?AUTO_3280 ?AUTO_3284 ) ) ( not ( = ?AUTO_3279 ?AUTO_3284 ) ) ( not ( = ?AUTO_3283 ?AUTO_3284 ) ) ( not ( = ?AUTO_3282 ?AUTO_3284 ) ) ( not ( = ?AUTO_3281 ?AUTO_3284 ) ) ( ON ?AUTO_3284 ?AUTO_3281 ) ( CLEAR ?AUTO_3284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3284 ?AUTO_3281 )
      ( MAKE-ON ?AUTO_3277 ?AUTO_3278 )
      ( MAKE-ON-VERIFY ?AUTO_3277 ?AUTO_3278 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3286 - BLOCK
      ?AUTO_3287 - BLOCK
    )
    :vars
    (
      ?AUTO_3289 - BLOCK
      ?AUTO_3291 - BLOCK
      ?AUTO_3288 - BLOCK
      ?AUTO_3292 - BLOCK
      ?AUTO_3293 - BLOCK
      ?AUTO_3294 - BLOCK
      ?AUTO_3290 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3286 ?AUTO_3287 ) ) ( ON-TABLE ?AUTO_3286 ) ( not ( = ?AUTO_3286 ?AUTO_3289 ) ) ( not ( = ?AUTO_3287 ?AUTO_3289 ) ) ( ON ?AUTO_3289 ?AUTO_3286 ) ( not ( = ?AUTO_3286 ?AUTO_3291 ) ) ( not ( = ?AUTO_3286 ?AUTO_3288 ) ) ( not ( = ?AUTO_3287 ?AUTO_3291 ) ) ( not ( = ?AUTO_3287 ?AUTO_3288 ) ) ( not ( = ?AUTO_3289 ?AUTO_3291 ) ) ( not ( = ?AUTO_3289 ?AUTO_3288 ) ) ( not ( = ?AUTO_3291 ?AUTO_3288 ) ) ( not ( = ?AUTO_3286 ?AUTO_3292 ) ) ( not ( = ?AUTO_3287 ?AUTO_3292 ) ) ( not ( = ?AUTO_3289 ?AUTO_3292 ) ) ( not ( = ?AUTO_3291 ?AUTO_3292 ) ) ( not ( = ?AUTO_3288 ?AUTO_3292 ) ) ( ON ?AUTO_3288 ?AUTO_3289 ) ( ON ?AUTO_3291 ?AUTO_3288 ) ( CLEAR ?AUTO_3291 ) ( CLEAR ?AUTO_3293 ) ( not ( = ?AUTO_3286 ?AUTO_3294 ) ) ( not ( = ?AUTO_3286 ?AUTO_3293 ) ) ( not ( = ?AUTO_3287 ?AUTO_3294 ) ) ( not ( = ?AUTO_3287 ?AUTO_3293 ) ) ( not ( = ?AUTO_3289 ?AUTO_3294 ) ) ( not ( = ?AUTO_3289 ?AUTO_3293 ) ) ( not ( = ?AUTO_3291 ?AUTO_3294 ) ) ( not ( = ?AUTO_3291 ?AUTO_3293 ) ) ( not ( = ?AUTO_3288 ?AUTO_3294 ) ) ( not ( = ?AUTO_3288 ?AUTO_3293 ) ) ( not ( = ?AUTO_3292 ?AUTO_3294 ) ) ( not ( = ?AUTO_3292 ?AUTO_3293 ) ) ( not ( = ?AUTO_3294 ?AUTO_3293 ) ) ( ON ?AUTO_3294 ?AUTO_3287 ) ( not ( = ?AUTO_3286 ?AUTO_3290 ) ) ( not ( = ?AUTO_3287 ?AUTO_3290 ) ) ( not ( = ?AUTO_3289 ?AUTO_3290 ) ) ( not ( = ?AUTO_3291 ?AUTO_3290 ) ) ( not ( = ?AUTO_3288 ?AUTO_3290 ) ) ( not ( = ?AUTO_3292 ?AUTO_3290 ) ) ( not ( = ?AUTO_3293 ?AUTO_3290 ) ) ( not ( = ?AUTO_3294 ?AUTO_3290 ) ) ( ON ?AUTO_3290 ?AUTO_3294 ) ( CLEAR ?AUTO_3290 ) ( HOLDING ?AUTO_3292 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3292 )
      ( MAKE-ON ?AUTO_3286 ?AUTO_3287 )
      ( MAKE-ON-VERIFY ?AUTO_3286 ?AUTO_3287 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3295 - BLOCK
      ?AUTO_3296 - BLOCK
    )
    :vars
    (
      ?AUTO_3303 - BLOCK
      ?AUTO_3298 - BLOCK
      ?AUTO_3301 - BLOCK
      ?AUTO_3297 - BLOCK
      ?AUTO_3300 - BLOCK
      ?AUTO_3302 - BLOCK
      ?AUTO_3299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3295 ?AUTO_3296 ) ) ( ON-TABLE ?AUTO_3295 ) ( not ( = ?AUTO_3295 ?AUTO_3303 ) ) ( not ( = ?AUTO_3296 ?AUTO_3303 ) ) ( ON ?AUTO_3303 ?AUTO_3295 ) ( not ( = ?AUTO_3295 ?AUTO_3298 ) ) ( not ( = ?AUTO_3295 ?AUTO_3301 ) ) ( not ( = ?AUTO_3296 ?AUTO_3298 ) ) ( not ( = ?AUTO_3296 ?AUTO_3301 ) ) ( not ( = ?AUTO_3303 ?AUTO_3298 ) ) ( not ( = ?AUTO_3303 ?AUTO_3301 ) ) ( not ( = ?AUTO_3298 ?AUTO_3301 ) ) ( not ( = ?AUTO_3295 ?AUTO_3297 ) ) ( not ( = ?AUTO_3296 ?AUTO_3297 ) ) ( not ( = ?AUTO_3303 ?AUTO_3297 ) ) ( not ( = ?AUTO_3298 ?AUTO_3297 ) ) ( not ( = ?AUTO_3301 ?AUTO_3297 ) ) ( ON ?AUTO_3301 ?AUTO_3303 ) ( ON ?AUTO_3298 ?AUTO_3301 ) ( CLEAR ?AUTO_3298 ) ( CLEAR ?AUTO_3300 ) ( not ( = ?AUTO_3295 ?AUTO_3302 ) ) ( not ( = ?AUTO_3295 ?AUTO_3300 ) ) ( not ( = ?AUTO_3296 ?AUTO_3302 ) ) ( not ( = ?AUTO_3296 ?AUTO_3300 ) ) ( not ( = ?AUTO_3303 ?AUTO_3302 ) ) ( not ( = ?AUTO_3303 ?AUTO_3300 ) ) ( not ( = ?AUTO_3298 ?AUTO_3302 ) ) ( not ( = ?AUTO_3298 ?AUTO_3300 ) ) ( not ( = ?AUTO_3301 ?AUTO_3302 ) ) ( not ( = ?AUTO_3301 ?AUTO_3300 ) ) ( not ( = ?AUTO_3297 ?AUTO_3302 ) ) ( not ( = ?AUTO_3297 ?AUTO_3300 ) ) ( not ( = ?AUTO_3302 ?AUTO_3300 ) ) ( ON ?AUTO_3302 ?AUTO_3296 ) ( not ( = ?AUTO_3295 ?AUTO_3299 ) ) ( not ( = ?AUTO_3296 ?AUTO_3299 ) ) ( not ( = ?AUTO_3303 ?AUTO_3299 ) ) ( not ( = ?AUTO_3298 ?AUTO_3299 ) ) ( not ( = ?AUTO_3301 ?AUTO_3299 ) ) ( not ( = ?AUTO_3297 ?AUTO_3299 ) ) ( not ( = ?AUTO_3300 ?AUTO_3299 ) ) ( not ( = ?AUTO_3302 ?AUTO_3299 ) ) ( ON ?AUTO_3299 ?AUTO_3302 ) ( ON ?AUTO_3297 ?AUTO_3299 ) ( CLEAR ?AUTO_3297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3297 ?AUTO_3299 )
      ( MAKE-ON ?AUTO_3295 ?AUTO_3296 )
      ( MAKE-ON-VERIFY ?AUTO_3295 ?AUTO_3296 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3304 - BLOCK
      ?AUTO_3305 - BLOCK
    )
    :vars
    (
      ?AUTO_3310 - BLOCK
      ?AUTO_3306 - BLOCK
      ?AUTO_3308 - BLOCK
      ?AUTO_3309 - BLOCK
      ?AUTO_3311 - BLOCK
      ?AUTO_3307 - BLOCK
      ?AUTO_3312 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3304 ?AUTO_3305 ) ) ( ON-TABLE ?AUTO_3304 ) ( not ( = ?AUTO_3304 ?AUTO_3310 ) ) ( not ( = ?AUTO_3305 ?AUTO_3310 ) ) ( ON ?AUTO_3310 ?AUTO_3304 ) ( not ( = ?AUTO_3304 ?AUTO_3306 ) ) ( not ( = ?AUTO_3304 ?AUTO_3308 ) ) ( not ( = ?AUTO_3305 ?AUTO_3306 ) ) ( not ( = ?AUTO_3305 ?AUTO_3308 ) ) ( not ( = ?AUTO_3310 ?AUTO_3306 ) ) ( not ( = ?AUTO_3310 ?AUTO_3308 ) ) ( not ( = ?AUTO_3306 ?AUTO_3308 ) ) ( not ( = ?AUTO_3304 ?AUTO_3309 ) ) ( not ( = ?AUTO_3305 ?AUTO_3309 ) ) ( not ( = ?AUTO_3310 ?AUTO_3309 ) ) ( not ( = ?AUTO_3306 ?AUTO_3309 ) ) ( not ( = ?AUTO_3308 ?AUTO_3309 ) ) ( ON ?AUTO_3308 ?AUTO_3310 ) ( CLEAR ?AUTO_3311 ) ( not ( = ?AUTO_3304 ?AUTO_3307 ) ) ( not ( = ?AUTO_3304 ?AUTO_3311 ) ) ( not ( = ?AUTO_3305 ?AUTO_3307 ) ) ( not ( = ?AUTO_3305 ?AUTO_3311 ) ) ( not ( = ?AUTO_3310 ?AUTO_3307 ) ) ( not ( = ?AUTO_3310 ?AUTO_3311 ) ) ( not ( = ?AUTO_3306 ?AUTO_3307 ) ) ( not ( = ?AUTO_3306 ?AUTO_3311 ) ) ( not ( = ?AUTO_3308 ?AUTO_3307 ) ) ( not ( = ?AUTO_3308 ?AUTO_3311 ) ) ( not ( = ?AUTO_3309 ?AUTO_3307 ) ) ( not ( = ?AUTO_3309 ?AUTO_3311 ) ) ( not ( = ?AUTO_3307 ?AUTO_3311 ) ) ( ON ?AUTO_3307 ?AUTO_3305 ) ( not ( = ?AUTO_3304 ?AUTO_3312 ) ) ( not ( = ?AUTO_3305 ?AUTO_3312 ) ) ( not ( = ?AUTO_3310 ?AUTO_3312 ) ) ( not ( = ?AUTO_3306 ?AUTO_3312 ) ) ( not ( = ?AUTO_3308 ?AUTO_3312 ) ) ( not ( = ?AUTO_3309 ?AUTO_3312 ) ) ( not ( = ?AUTO_3311 ?AUTO_3312 ) ) ( not ( = ?AUTO_3307 ?AUTO_3312 ) ) ( ON ?AUTO_3312 ?AUTO_3307 ) ( ON ?AUTO_3309 ?AUTO_3312 ) ( CLEAR ?AUTO_3309 ) ( HOLDING ?AUTO_3306 ) ( CLEAR ?AUTO_3308 ) )
    :subtasks
    ( ( !STACK ?AUTO_3306 ?AUTO_3308 )
      ( MAKE-ON ?AUTO_3304 ?AUTO_3305 )
      ( MAKE-ON-VERIFY ?AUTO_3304 ?AUTO_3305 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3313 - BLOCK
      ?AUTO_3314 - BLOCK
    )
    :vars
    (
      ?AUTO_3321 - BLOCK
      ?AUTO_3317 - BLOCK
      ?AUTO_3316 - BLOCK
      ?AUTO_3320 - BLOCK
      ?AUTO_3319 - BLOCK
      ?AUTO_3315 - BLOCK
      ?AUTO_3318 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3313 ?AUTO_3314 ) ) ( ON-TABLE ?AUTO_3313 ) ( not ( = ?AUTO_3313 ?AUTO_3321 ) ) ( not ( = ?AUTO_3314 ?AUTO_3321 ) ) ( ON ?AUTO_3321 ?AUTO_3313 ) ( not ( = ?AUTO_3313 ?AUTO_3317 ) ) ( not ( = ?AUTO_3313 ?AUTO_3316 ) ) ( not ( = ?AUTO_3314 ?AUTO_3317 ) ) ( not ( = ?AUTO_3314 ?AUTO_3316 ) ) ( not ( = ?AUTO_3321 ?AUTO_3317 ) ) ( not ( = ?AUTO_3321 ?AUTO_3316 ) ) ( not ( = ?AUTO_3317 ?AUTO_3316 ) ) ( not ( = ?AUTO_3313 ?AUTO_3320 ) ) ( not ( = ?AUTO_3314 ?AUTO_3320 ) ) ( not ( = ?AUTO_3321 ?AUTO_3320 ) ) ( not ( = ?AUTO_3317 ?AUTO_3320 ) ) ( not ( = ?AUTO_3316 ?AUTO_3320 ) ) ( ON ?AUTO_3316 ?AUTO_3321 ) ( CLEAR ?AUTO_3319 ) ( not ( = ?AUTO_3313 ?AUTO_3315 ) ) ( not ( = ?AUTO_3313 ?AUTO_3319 ) ) ( not ( = ?AUTO_3314 ?AUTO_3315 ) ) ( not ( = ?AUTO_3314 ?AUTO_3319 ) ) ( not ( = ?AUTO_3321 ?AUTO_3315 ) ) ( not ( = ?AUTO_3321 ?AUTO_3319 ) ) ( not ( = ?AUTO_3317 ?AUTO_3315 ) ) ( not ( = ?AUTO_3317 ?AUTO_3319 ) ) ( not ( = ?AUTO_3316 ?AUTO_3315 ) ) ( not ( = ?AUTO_3316 ?AUTO_3319 ) ) ( not ( = ?AUTO_3320 ?AUTO_3315 ) ) ( not ( = ?AUTO_3320 ?AUTO_3319 ) ) ( not ( = ?AUTO_3315 ?AUTO_3319 ) ) ( ON ?AUTO_3315 ?AUTO_3314 ) ( not ( = ?AUTO_3313 ?AUTO_3318 ) ) ( not ( = ?AUTO_3314 ?AUTO_3318 ) ) ( not ( = ?AUTO_3321 ?AUTO_3318 ) ) ( not ( = ?AUTO_3317 ?AUTO_3318 ) ) ( not ( = ?AUTO_3316 ?AUTO_3318 ) ) ( not ( = ?AUTO_3320 ?AUTO_3318 ) ) ( not ( = ?AUTO_3319 ?AUTO_3318 ) ) ( not ( = ?AUTO_3315 ?AUTO_3318 ) ) ( ON ?AUTO_3318 ?AUTO_3315 ) ( ON ?AUTO_3320 ?AUTO_3318 ) ( CLEAR ?AUTO_3316 ) ( ON ?AUTO_3317 ?AUTO_3320 ) ( CLEAR ?AUTO_3317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3317 ?AUTO_3320 )
      ( MAKE-ON ?AUTO_3313 ?AUTO_3314 )
      ( MAKE-ON-VERIFY ?AUTO_3313 ?AUTO_3314 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3322 - BLOCK
      ?AUTO_3323 - BLOCK
    )
    :vars
    (
      ?AUTO_3327 - BLOCK
      ?AUTO_3328 - BLOCK
      ?AUTO_3329 - BLOCK
      ?AUTO_3326 - BLOCK
      ?AUTO_3330 - BLOCK
      ?AUTO_3324 - BLOCK
      ?AUTO_3325 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3322 ?AUTO_3323 ) ) ( ON-TABLE ?AUTO_3322 ) ( not ( = ?AUTO_3322 ?AUTO_3327 ) ) ( not ( = ?AUTO_3323 ?AUTO_3327 ) ) ( ON ?AUTO_3327 ?AUTO_3322 ) ( not ( = ?AUTO_3322 ?AUTO_3328 ) ) ( not ( = ?AUTO_3322 ?AUTO_3329 ) ) ( not ( = ?AUTO_3323 ?AUTO_3328 ) ) ( not ( = ?AUTO_3323 ?AUTO_3329 ) ) ( not ( = ?AUTO_3327 ?AUTO_3328 ) ) ( not ( = ?AUTO_3327 ?AUTO_3329 ) ) ( not ( = ?AUTO_3328 ?AUTO_3329 ) ) ( not ( = ?AUTO_3322 ?AUTO_3326 ) ) ( not ( = ?AUTO_3323 ?AUTO_3326 ) ) ( not ( = ?AUTO_3327 ?AUTO_3326 ) ) ( not ( = ?AUTO_3328 ?AUTO_3326 ) ) ( not ( = ?AUTO_3329 ?AUTO_3326 ) ) ( CLEAR ?AUTO_3330 ) ( not ( = ?AUTO_3322 ?AUTO_3324 ) ) ( not ( = ?AUTO_3322 ?AUTO_3330 ) ) ( not ( = ?AUTO_3323 ?AUTO_3324 ) ) ( not ( = ?AUTO_3323 ?AUTO_3330 ) ) ( not ( = ?AUTO_3327 ?AUTO_3324 ) ) ( not ( = ?AUTO_3327 ?AUTO_3330 ) ) ( not ( = ?AUTO_3328 ?AUTO_3324 ) ) ( not ( = ?AUTO_3328 ?AUTO_3330 ) ) ( not ( = ?AUTO_3329 ?AUTO_3324 ) ) ( not ( = ?AUTO_3329 ?AUTO_3330 ) ) ( not ( = ?AUTO_3326 ?AUTO_3324 ) ) ( not ( = ?AUTO_3326 ?AUTO_3330 ) ) ( not ( = ?AUTO_3324 ?AUTO_3330 ) ) ( ON ?AUTO_3324 ?AUTO_3323 ) ( not ( = ?AUTO_3322 ?AUTO_3325 ) ) ( not ( = ?AUTO_3323 ?AUTO_3325 ) ) ( not ( = ?AUTO_3327 ?AUTO_3325 ) ) ( not ( = ?AUTO_3328 ?AUTO_3325 ) ) ( not ( = ?AUTO_3329 ?AUTO_3325 ) ) ( not ( = ?AUTO_3326 ?AUTO_3325 ) ) ( not ( = ?AUTO_3330 ?AUTO_3325 ) ) ( not ( = ?AUTO_3324 ?AUTO_3325 ) ) ( ON ?AUTO_3325 ?AUTO_3324 ) ( ON ?AUTO_3326 ?AUTO_3325 ) ( ON ?AUTO_3328 ?AUTO_3326 ) ( CLEAR ?AUTO_3328 ) ( HOLDING ?AUTO_3329 ) ( CLEAR ?AUTO_3327 ) )
    :subtasks
    ( ( !STACK ?AUTO_3329 ?AUTO_3327 )
      ( MAKE-ON ?AUTO_3322 ?AUTO_3323 )
      ( MAKE-ON-VERIFY ?AUTO_3322 ?AUTO_3323 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3331 - BLOCK
      ?AUTO_3332 - BLOCK
    )
    :vars
    (
      ?AUTO_3335 - BLOCK
      ?AUTO_3336 - BLOCK
      ?AUTO_3333 - BLOCK
      ?AUTO_3334 - BLOCK
      ?AUTO_3338 - BLOCK
      ?AUTO_3337 - BLOCK
      ?AUTO_3339 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3331 ?AUTO_3332 ) ) ( ON-TABLE ?AUTO_3331 ) ( not ( = ?AUTO_3331 ?AUTO_3335 ) ) ( not ( = ?AUTO_3332 ?AUTO_3335 ) ) ( ON ?AUTO_3335 ?AUTO_3331 ) ( not ( = ?AUTO_3331 ?AUTO_3336 ) ) ( not ( = ?AUTO_3331 ?AUTO_3333 ) ) ( not ( = ?AUTO_3332 ?AUTO_3336 ) ) ( not ( = ?AUTO_3332 ?AUTO_3333 ) ) ( not ( = ?AUTO_3335 ?AUTO_3336 ) ) ( not ( = ?AUTO_3335 ?AUTO_3333 ) ) ( not ( = ?AUTO_3336 ?AUTO_3333 ) ) ( not ( = ?AUTO_3331 ?AUTO_3334 ) ) ( not ( = ?AUTO_3332 ?AUTO_3334 ) ) ( not ( = ?AUTO_3335 ?AUTO_3334 ) ) ( not ( = ?AUTO_3336 ?AUTO_3334 ) ) ( not ( = ?AUTO_3333 ?AUTO_3334 ) ) ( CLEAR ?AUTO_3338 ) ( not ( = ?AUTO_3331 ?AUTO_3337 ) ) ( not ( = ?AUTO_3331 ?AUTO_3338 ) ) ( not ( = ?AUTO_3332 ?AUTO_3337 ) ) ( not ( = ?AUTO_3332 ?AUTO_3338 ) ) ( not ( = ?AUTO_3335 ?AUTO_3337 ) ) ( not ( = ?AUTO_3335 ?AUTO_3338 ) ) ( not ( = ?AUTO_3336 ?AUTO_3337 ) ) ( not ( = ?AUTO_3336 ?AUTO_3338 ) ) ( not ( = ?AUTO_3333 ?AUTO_3337 ) ) ( not ( = ?AUTO_3333 ?AUTO_3338 ) ) ( not ( = ?AUTO_3334 ?AUTO_3337 ) ) ( not ( = ?AUTO_3334 ?AUTO_3338 ) ) ( not ( = ?AUTO_3337 ?AUTO_3338 ) ) ( ON ?AUTO_3337 ?AUTO_3332 ) ( not ( = ?AUTO_3331 ?AUTO_3339 ) ) ( not ( = ?AUTO_3332 ?AUTO_3339 ) ) ( not ( = ?AUTO_3335 ?AUTO_3339 ) ) ( not ( = ?AUTO_3336 ?AUTO_3339 ) ) ( not ( = ?AUTO_3333 ?AUTO_3339 ) ) ( not ( = ?AUTO_3334 ?AUTO_3339 ) ) ( not ( = ?AUTO_3338 ?AUTO_3339 ) ) ( not ( = ?AUTO_3337 ?AUTO_3339 ) ) ( ON ?AUTO_3339 ?AUTO_3337 ) ( ON ?AUTO_3334 ?AUTO_3339 ) ( ON ?AUTO_3336 ?AUTO_3334 ) ( CLEAR ?AUTO_3336 ) ( CLEAR ?AUTO_3335 ) ( ON-TABLE ?AUTO_3333 ) ( CLEAR ?AUTO_3333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3333 )
      ( MAKE-ON ?AUTO_3331 ?AUTO_3332 )
      ( MAKE-ON-VERIFY ?AUTO_3331 ?AUTO_3332 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3340 - BLOCK
      ?AUTO_3341 - BLOCK
    )
    :vars
    (
      ?AUTO_3346 - BLOCK
      ?AUTO_3342 - BLOCK
      ?AUTO_3347 - BLOCK
      ?AUTO_3343 - BLOCK
      ?AUTO_3344 - BLOCK
      ?AUTO_3348 - BLOCK
      ?AUTO_3345 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3340 ?AUTO_3341 ) ) ( ON-TABLE ?AUTO_3340 ) ( not ( = ?AUTO_3340 ?AUTO_3346 ) ) ( not ( = ?AUTO_3341 ?AUTO_3346 ) ) ( not ( = ?AUTO_3340 ?AUTO_3342 ) ) ( not ( = ?AUTO_3340 ?AUTO_3347 ) ) ( not ( = ?AUTO_3341 ?AUTO_3342 ) ) ( not ( = ?AUTO_3341 ?AUTO_3347 ) ) ( not ( = ?AUTO_3346 ?AUTO_3342 ) ) ( not ( = ?AUTO_3346 ?AUTO_3347 ) ) ( not ( = ?AUTO_3342 ?AUTO_3347 ) ) ( not ( = ?AUTO_3340 ?AUTO_3343 ) ) ( not ( = ?AUTO_3341 ?AUTO_3343 ) ) ( not ( = ?AUTO_3346 ?AUTO_3343 ) ) ( not ( = ?AUTO_3342 ?AUTO_3343 ) ) ( not ( = ?AUTO_3347 ?AUTO_3343 ) ) ( CLEAR ?AUTO_3344 ) ( not ( = ?AUTO_3340 ?AUTO_3348 ) ) ( not ( = ?AUTO_3340 ?AUTO_3344 ) ) ( not ( = ?AUTO_3341 ?AUTO_3348 ) ) ( not ( = ?AUTO_3341 ?AUTO_3344 ) ) ( not ( = ?AUTO_3346 ?AUTO_3348 ) ) ( not ( = ?AUTO_3346 ?AUTO_3344 ) ) ( not ( = ?AUTO_3342 ?AUTO_3348 ) ) ( not ( = ?AUTO_3342 ?AUTO_3344 ) ) ( not ( = ?AUTO_3347 ?AUTO_3348 ) ) ( not ( = ?AUTO_3347 ?AUTO_3344 ) ) ( not ( = ?AUTO_3343 ?AUTO_3348 ) ) ( not ( = ?AUTO_3343 ?AUTO_3344 ) ) ( not ( = ?AUTO_3348 ?AUTO_3344 ) ) ( ON ?AUTO_3348 ?AUTO_3341 ) ( not ( = ?AUTO_3340 ?AUTO_3345 ) ) ( not ( = ?AUTO_3341 ?AUTO_3345 ) ) ( not ( = ?AUTO_3346 ?AUTO_3345 ) ) ( not ( = ?AUTO_3342 ?AUTO_3345 ) ) ( not ( = ?AUTO_3347 ?AUTO_3345 ) ) ( not ( = ?AUTO_3343 ?AUTO_3345 ) ) ( not ( = ?AUTO_3344 ?AUTO_3345 ) ) ( not ( = ?AUTO_3348 ?AUTO_3345 ) ) ( ON ?AUTO_3345 ?AUTO_3348 ) ( ON ?AUTO_3343 ?AUTO_3345 ) ( ON ?AUTO_3342 ?AUTO_3343 ) ( CLEAR ?AUTO_3342 ) ( ON-TABLE ?AUTO_3347 ) ( CLEAR ?AUTO_3347 ) ( HOLDING ?AUTO_3346 ) ( CLEAR ?AUTO_3340 ) )
    :subtasks
    ( ( !STACK ?AUTO_3346 ?AUTO_3340 )
      ( MAKE-ON ?AUTO_3340 ?AUTO_3341 )
      ( MAKE-ON-VERIFY ?AUTO_3340 ?AUTO_3341 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3349 - BLOCK
      ?AUTO_3350 - BLOCK
    )
    :vars
    (
      ?AUTO_3353 - BLOCK
      ?AUTO_3355 - BLOCK
      ?AUTO_3351 - BLOCK
      ?AUTO_3356 - BLOCK
      ?AUTO_3354 - BLOCK
      ?AUTO_3352 - BLOCK
      ?AUTO_3357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3349 ?AUTO_3350 ) ) ( ON-TABLE ?AUTO_3349 ) ( not ( = ?AUTO_3349 ?AUTO_3353 ) ) ( not ( = ?AUTO_3350 ?AUTO_3353 ) ) ( not ( = ?AUTO_3349 ?AUTO_3355 ) ) ( not ( = ?AUTO_3349 ?AUTO_3351 ) ) ( not ( = ?AUTO_3350 ?AUTO_3355 ) ) ( not ( = ?AUTO_3350 ?AUTO_3351 ) ) ( not ( = ?AUTO_3353 ?AUTO_3355 ) ) ( not ( = ?AUTO_3353 ?AUTO_3351 ) ) ( not ( = ?AUTO_3355 ?AUTO_3351 ) ) ( not ( = ?AUTO_3349 ?AUTO_3356 ) ) ( not ( = ?AUTO_3350 ?AUTO_3356 ) ) ( not ( = ?AUTO_3353 ?AUTO_3356 ) ) ( not ( = ?AUTO_3355 ?AUTO_3356 ) ) ( not ( = ?AUTO_3351 ?AUTO_3356 ) ) ( CLEAR ?AUTO_3354 ) ( not ( = ?AUTO_3349 ?AUTO_3352 ) ) ( not ( = ?AUTO_3349 ?AUTO_3354 ) ) ( not ( = ?AUTO_3350 ?AUTO_3352 ) ) ( not ( = ?AUTO_3350 ?AUTO_3354 ) ) ( not ( = ?AUTO_3353 ?AUTO_3352 ) ) ( not ( = ?AUTO_3353 ?AUTO_3354 ) ) ( not ( = ?AUTO_3355 ?AUTO_3352 ) ) ( not ( = ?AUTO_3355 ?AUTO_3354 ) ) ( not ( = ?AUTO_3351 ?AUTO_3352 ) ) ( not ( = ?AUTO_3351 ?AUTO_3354 ) ) ( not ( = ?AUTO_3356 ?AUTO_3352 ) ) ( not ( = ?AUTO_3356 ?AUTO_3354 ) ) ( not ( = ?AUTO_3352 ?AUTO_3354 ) ) ( ON ?AUTO_3352 ?AUTO_3350 ) ( not ( = ?AUTO_3349 ?AUTO_3357 ) ) ( not ( = ?AUTO_3350 ?AUTO_3357 ) ) ( not ( = ?AUTO_3353 ?AUTO_3357 ) ) ( not ( = ?AUTO_3355 ?AUTO_3357 ) ) ( not ( = ?AUTO_3351 ?AUTO_3357 ) ) ( not ( = ?AUTO_3356 ?AUTO_3357 ) ) ( not ( = ?AUTO_3354 ?AUTO_3357 ) ) ( not ( = ?AUTO_3352 ?AUTO_3357 ) ) ( ON ?AUTO_3357 ?AUTO_3352 ) ( ON ?AUTO_3356 ?AUTO_3357 ) ( ON ?AUTO_3355 ?AUTO_3356 ) ( CLEAR ?AUTO_3355 ) ( ON-TABLE ?AUTO_3351 ) ( CLEAR ?AUTO_3349 ) ( ON ?AUTO_3353 ?AUTO_3351 ) ( CLEAR ?AUTO_3353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3353 ?AUTO_3351 )
      ( MAKE-ON ?AUTO_3349 ?AUTO_3350 )
      ( MAKE-ON-VERIFY ?AUTO_3349 ?AUTO_3350 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3364 - BLOCK
      ?AUTO_3365 - BLOCK
    )
    :vars
    (
      ?AUTO_3369 - BLOCK
      ?AUTO_3370 - BLOCK
      ?AUTO_3371 - BLOCK
      ?AUTO_3367 - BLOCK
      ?AUTO_3368 - BLOCK
      ?AUTO_3366 - BLOCK
      ?AUTO_3372 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3364 ?AUTO_3365 ) ) ( ON-TABLE ?AUTO_3364 ) ( not ( = ?AUTO_3364 ?AUTO_3369 ) ) ( not ( = ?AUTO_3365 ?AUTO_3369 ) ) ( not ( = ?AUTO_3364 ?AUTO_3370 ) ) ( not ( = ?AUTO_3364 ?AUTO_3371 ) ) ( not ( = ?AUTO_3365 ?AUTO_3370 ) ) ( not ( = ?AUTO_3365 ?AUTO_3371 ) ) ( not ( = ?AUTO_3369 ?AUTO_3370 ) ) ( not ( = ?AUTO_3369 ?AUTO_3371 ) ) ( not ( = ?AUTO_3370 ?AUTO_3371 ) ) ( not ( = ?AUTO_3364 ?AUTO_3367 ) ) ( not ( = ?AUTO_3365 ?AUTO_3367 ) ) ( not ( = ?AUTO_3369 ?AUTO_3367 ) ) ( not ( = ?AUTO_3370 ?AUTO_3367 ) ) ( not ( = ?AUTO_3371 ?AUTO_3367 ) ) ( not ( = ?AUTO_3364 ?AUTO_3368 ) ) ( not ( = ?AUTO_3364 ?AUTO_3366 ) ) ( not ( = ?AUTO_3365 ?AUTO_3368 ) ) ( not ( = ?AUTO_3365 ?AUTO_3366 ) ) ( not ( = ?AUTO_3369 ?AUTO_3368 ) ) ( not ( = ?AUTO_3369 ?AUTO_3366 ) ) ( not ( = ?AUTO_3370 ?AUTO_3368 ) ) ( not ( = ?AUTO_3370 ?AUTO_3366 ) ) ( not ( = ?AUTO_3371 ?AUTO_3368 ) ) ( not ( = ?AUTO_3371 ?AUTO_3366 ) ) ( not ( = ?AUTO_3367 ?AUTO_3368 ) ) ( not ( = ?AUTO_3367 ?AUTO_3366 ) ) ( not ( = ?AUTO_3368 ?AUTO_3366 ) ) ( ON ?AUTO_3368 ?AUTO_3365 ) ( not ( = ?AUTO_3364 ?AUTO_3372 ) ) ( not ( = ?AUTO_3365 ?AUTO_3372 ) ) ( not ( = ?AUTO_3369 ?AUTO_3372 ) ) ( not ( = ?AUTO_3370 ?AUTO_3372 ) ) ( not ( = ?AUTO_3371 ?AUTO_3372 ) ) ( not ( = ?AUTO_3367 ?AUTO_3372 ) ) ( not ( = ?AUTO_3366 ?AUTO_3372 ) ) ( not ( = ?AUTO_3368 ?AUTO_3372 ) ) ( ON ?AUTO_3372 ?AUTO_3368 ) ( ON ?AUTO_3367 ?AUTO_3372 ) ( ON ?AUTO_3370 ?AUTO_3367 ) ( CLEAR ?AUTO_3370 ) ( ON-TABLE ?AUTO_3371 ) ( CLEAR ?AUTO_3371 ) ( CLEAR ?AUTO_3364 ) ( ON ?AUTO_3369 ?AUTO_3366 ) ( CLEAR ?AUTO_3369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3369 ?AUTO_3366 )
      ( MAKE-ON ?AUTO_3364 ?AUTO_3365 )
      ( MAKE-ON-VERIFY ?AUTO_3364 ?AUTO_3365 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3375 - BLOCK
      ?AUTO_3376 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3375 ) ( CLEAR ?AUTO_3376 ) ( not ( = ?AUTO_3375 ?AUTO_3376 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3375 ?AUTO_3376 )
      ( MAKE-ON-VERIFY ?AUTO_3375 ?AUTO_3376 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3377 - BLOCK
      ?AUTO_3378 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3378 ) ( not ( = ?AUTO_3377 ?AUTO_3378 ) ) ( ON-TABLE ?AUTO_3377 ) ( CLEAR ?AUTO_3377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3377 )
      ( MAKE-ON ?AUTO_3377 ?AUTO_3378 )
      ( MAKE-ON-VERIFY ?AUTO_3377 ?AUTO_3378 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3379 - BLOCK
      ?AUTO_3380 - BLOCK
    )
    :vars
    (
      ?AUTO_3381 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3379 ?AUTO_3380 ) ) ( ON-TABLE ?AUTO_3379 ) ( CLEAR ?AUTO_3379 ) ( HOLDING ?AUTO_3380 ) ( CLEAR ?AUTO_3381 ) ( not ( = ?AUTO_3379 ?AUTO_3381 ) ) ( not ( = ?AUTO_3380 ?AUTO_3381 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3380 ?AUTO_3381 )
      ( MAKE-ON ?AUTO_3379 ?AUTO_3380 )
      ( MAKE-ON-VERIFY ?AUTO_3379 ?AUTO_3380 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3539 - BLOCK
      ?AUTO_3540 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3539 ) ( CLEAR ?AUTO_3540 ) ( not ( = ?AUTO_3539 ?AUTO_3540 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3539 ?AUTO_3540 )
      ( MAKE-ON-VERIFY ?AUTO_3539 ?AUTO_3540 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3541 - BLOCK
      ?AUTO_3542 - BLOCK
    )
    :vars
    (
      ?AUTO_3543 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3542 ) ( not ( = ?AUTO_3541 ?AUTO_3542 ) ) ( ON ?AUTO_3541 ?AUTO_3543 ) ( CLEAR ?AUTO_3541 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3541 ?AUTO_3543 ) ) ( not ( = ?AUTO_3542 ?AUTO_3543 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3541 ?AUTO_3543 )
      ( MAKE-ON ?AUTO_3541 ?AUTO_3542 )
      ( MAKE-ON-VERIFY ?AUTO_3541 ?AUTO_3542 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3544 - BLOCK
      ?AUTO_3545 - BLOCK
    )
    :vars
    (
      ?AUTO_3546 - BLOCK
      ?AUTO_3547 - BLOCK
      ?AUTO_3548 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3545 ) ( not ( = ?AUTO_3544 ?AUTO_3545 ) ) ( ON ?AUTO_3544 ?AUTO_3546 ) ( CLEAR ?AUTO_3544 ) ( not ( = ?AUTO_3544 ?AUTO_3546 ) ) ( not ( = ?AUTO_3545 ?AUTO_3546 ) ) ( HOLDING ?AUTO_3547 ) ( CLEAR ?AUTO_3548 ) ( not ( = ?AUTO_3544 ?AUTO_3547 ) ) ( not ( = ?AUTO_3544 ?AUTO_3548 ) ) ( not ( = ?AUTO_3545 ?AUTO_3547 ) ) ( not ( = ?AUTO_3545 ?AUTO_3548 ) ) ( not ( = ?AUTO_3546 ?AUTO_3547 ) ) ( not ( = ?AUTO_3546 ?AUTO_3548 ) ) ( not ( = ?AUTO_3547 ?AUTO_3548 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3547 ?AUTO_3548 )
      ( MAKE-ON ?AUTO_3544 ?AUTO_3545 )
      ( MAKE-ON-VERIFY ?AUTO_3544 ?AUTO_3545 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3587 - BLOCK
      ?AUTO_3588 - BLOCK
    )
    :vars
    (
      ?AUTO_3590 - BLOCK
      ?AUTO_3589 - BLOCK
      ?AUTO_3591 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3587 ?AUTO_3588 ) ) ( not ( = ?AUTO_3587 ?AUTO_3590 ) ) ( not ( = ?AUTO_3588 ?AUTO_3590 ) ) ( CLEAR ?AUTO_3589 ) ( not ( = ?AUTO_3587 ?AUTO_3591 ) ) ( not ( = ?AUTO_3587 ?AUTO_3589 ) ) ( not ( = ?AUTO_3588 ?AUTO_3591 ) ) ( not ( = ?AUTO_3588 ?AUTO_3589 ) ) ( not ( = ?AUTO_3590 ?AUTO_3591 ) ) ( not ( = ?AUTO_3590 ?AUTO_3589 ) ) ( not ( = ?AUTO_3591 ?AUTO_3589 ) ) ( ON ?AUTO_3591 ?AUTO_3588 ) ( CLEAR ?AUTO_3591 ) ( HOLDING ?AUTO_3587 ) ( CLEAR ?AUTO_3590 ) )
    :subtasks
    ( ( !STACK ?AUTO_3587 ?AUTO_3590 )
      ( MAKE-ON ?AUTO_3587 ?AUTO_3588 )
      ( MAKE-ON-VERIFY ?AUTO_3587 ?AUTO_3588 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3592 - BLOCK
      ?AUTO_3593 - BLOCK
    )
    :vars
    (
      ?AUTO_3595 - BLOCK
      ?AUTO_3596 - BLOCK
      ?AUTO_3594 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3592 ?AUTO_3593 ) ) ( not ( = ?AUTO_3592 ?AUTO_3595 ) ) ( not ( = ?AUTO_3593 ?AUTO_3595 ) ) ( CLEAR ?AUTO_3596 ) ( not ( = ?AUTO_3592 ?AUTO_3594 ) ) ( not ( = ?AUTO_3592 ?AUTO_3596 ) ) ( not ( = ?AUTO_3593 ?AUTO_3594 ) ) ( not ( = ?AUTO_3593 ?AUTO_3596 ) ) ( not ( = ?AUTO_3595 ?AUTO_3594 ) ) ( not ( = ?AUTO_3595 ?AUTO_3596 ) ) ( not ( = ?AUTO_3594 ?AUTO_3596 ) ) ( ON ?AUTO_3594 ?AUTO_3593 ) ( CLEAR ?AUTO_3595 ) ( ON ?AUTO_3592 ?AUTO_3594 ) ( CLEAR ?AUTO_3592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3592 ?AUTO_3594 )
      ( MAKE-ON ?AUTO_3592 ?AUTO_3593 )
      ( MAKE-ON-VERIFY ?AUTO_3592 ?AUTO_3593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3597 - BLOCK
      ?AUTO_3598 - BLOCK
    )
    :vars
    (
      ?AUTO_3599 - BLOCK
      ?AUTO_3601 - BLOCK
      ?AUTO_3600 - BLOCK
      ?AUTO_3602 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3597 ?AUTO_3598 ) ) ( not ( = ?AUTO_3597 ?AUTO_3599 ) ) ( not ( = ?AUTO_3598 ?AUTO_3599 ) ) ( CLEAR ?AUTO_3601 ) ( not ( = ?AUTO_3597 ?AUTO_3600 ) ) ( not ( = ?AUTO_3597 ?AUTO_3601 ) ) ( not ( = ?AUTO_3598 ?AUTO_3600 ) ) ( not ( = ?AUTO_3598 ?AUTO_3601 ) ) ( not ( = ?AUTO_3599 ?AUTO_3600 ) ) ( not ( = ?AUTO_3599 ?AUTO_3601 ) ) ( not ( = ?AUTO_3600 ?AUTO_3601 ) ) ( ON ?AUTO_3600 ?AUTO_3598 ) ( ON ?AUTO_3597 ?AUTO_3600 ) ( CLEAR ?AUTO_3597 ) ( HOLDING ?AUTO_3599 ) ( CLEAR ?AUTO_3602 ) ( not ( = ?AUTO_3597 ?AUTO_3602 ) ) ( not ( = ?AUTO_3598 ?AUTO_3602 ) ) ( not ( = ?AUTO_3599 ?AUTO_3602 ) ) ( not ( = ?AUTO_3601 ?AUTO_3602 ) ) ( not ( = ?AUTO_3600 ?AUTO_3602 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3599 ?AUTO_3602 )
      ( MAKE-ON ?AUTO_3597 ?AUTO_3598 )
      ( MAKE-ON-VERIFY ?AUTO_3597 ?AUTO_3598 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3619 - BLOCK
      ?AUTO_3620 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3619 ) ( CLEAR ?AUTO_3620 ) ( not ( = ?AUTO_3619 ?AUTO_3620 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3619 ?AUTO_3620 )
      ( MAKE-ON-VERIFY ?AUTO_3619 ?AUTO_3620 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3621 - BLOCK
      ?AUTO_3622 - BLOCK
    )
    :vars
    (
      ?AUTO_3623 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3622 ) ( not ( = ?AUTO_3621 ?AUTO_3622 ) ) ( ON ?AUTO_3621 ?AUTO_3623 ) ( CLEAR ?AUTO_3621 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3621 ?AUTO_3623 ) ) ( not ( = ?AUTO_3622 ?AUTO_3623 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3621 ?AUTO_3623 )
      ( MAKE-ON ?AUTO_3621 ?AUTO_3622 )
      ( MAKE-ON-VERIFY ?AUTO_3621 ?AUTO_3622 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3624 - BLOCK
      ?AUTO_3625 - BLOCK
    )
    :vars
    (
      ?AUTO_3626 - BLOCK
      ?AUTO_3627 - BLOCK
      ?AUTO_3628 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3625 ) ( not ( = ?AUTO_3624 ?AUTO_3625 ) ) ( ON ?AUTO_3624 ?AUTO_3626 ) ( CLEAR ?AUTO_3624 ) ( not ( = ?AUTO_3624 ?AUTO_3626 ) ) ( not ( = ?AUTO_3625 ?AUTO_3626 ) ) ( HOLDING ?AUTO_3627 ) ( CLEAR ?AUTO_3628 ) ( not ( = ?AUTO_3624 ?AUTO_3627 ) ) ( not ( = ?AUTO_3624 ?AUTO_3628 ) ) ( not ( = ?AUTO_3625 ?AUTO_3627 ) ) ( not ( = ?AUTO_3625 ?AUTO_3628 ) ) ( not ( = ?AUTO_3626 ?AUTO_3627 ) ) ( not ( = ?AUTO_3626 ?AUTO_3628 ) ) ( not ( = ?AUTO_3627 ?AUTO_3628 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3627 ?AUTO_3628 )
      ( MAKE-ON ?AUTO_3624 ?AUTO_3625 )
      ( MAKE-ON-VERIFY ?AUTO_3624 ?AUTO_3625 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3629 - BLOCK
      ?AUTO_3630 - BLOCK
    )
    :vars
    (
      ?AUTO_3631 - BLOCK
      ?AUTO_3632 - BLOCK
      ?AUTO_3633 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3630 ) ( not ( = ?AUTO_3629 ?AUTO_3630 ) ) ( ON ?AUTO_3629 ?AUTO_3631 ) ( not ( = ?AUTO_3629 ?AUTO_3631 ) ) ( not ( = ?AUTO_3630 ?AUTO_3631 ) ) ( CLEAR ?AUTO_3632 ) ( not ( = ?AUTO_3629 ?AUTO_3633 ) ) ( not ( = ?AUTO_3629 ?AUTO_3632 ) ) ( not ( = ?AUTO_3630 ?AUTO_3633 ) ) ( not ( = ?AUTO_3630 ?AUTO_3632 ) ) ( not ( = ?AUTO_3631 ?AUTO_3633 ) ) ( not ( = ?AUTO_3631 ?AUTO_3632 ) ) ( not ( = ?AUTO_3633 ?AUTO_3632 ) ) ( ON ?AUTO_3633 ?AUTO_3629 ) ( CLEAR ?AUTO_3633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3633 ?AUTO_3629 )
      ( MAKE-ON ?AUTO_3629 ?AUTO_3630 )
      ( MAKE-ON-VERIFY ?AUTO_3629 ?AUTO_3630 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3634 - BLOCK
      ?AUTO_3635 - BLOCK
    )
    :vars
    (
      ?AUTO_3636 - BLOCK
      ?AUTO_3638 - BLOCK
      ?AUTO_3637 - BLOCK
      ?AUTO_3639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3634 ?AUTO_3635 ) ) ( ON ?AUTO_3634 ?AUTO_3636 ) ( not ( = ?AUTO_3634 ?AUTO_3636 ) ) ( not ( = ?AUTO_3635 ?AUTO_3636 ) ) ( CLEAR ?AUTO_3638 ) ( not ( = ?AUTO_3634 ?AUTO_3637 ) ) ( not ( = ?AUTO_3634 ?AUTO_3638 ) ) ( not ( = ?AUTO_3635 ?AUTO_3637 ) ) ( not ( = ?AUTO_3635 ?AUTO_3638 ) ) ( not ( = ?AUTO_3636 ?AUTO_3637 ) ) ( not ( = ?AUTO_3636 ?AUTO_3638 ) ) ( not ( = ?AUTO_3637 ?AUTO_3638 ) ) ( ON ?AUTO_3637 ?AUTO_3634 ) ( CLEAR ?AUTO_3637 ) ( HOLDING ?AUTO_3635 ) ( CLEAR ?AUTO_3639 ) ( not ( = ?AUTO_3634 ?AUTO_3639 ) ) ( not ( = ?AUTO_3635 ?AUTO_3639 ) ) ( not ( = ?AUTO_3636 ?AUTO_3639 ) ) ( not ( = ?AUTO_3638 ?AUTO_3639 ) ) ( not ( = ?AUTO_3637 ?AUTO_3639 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3635 ?AUTO_3639 )
      ( MAKE-ON ?AUTO_3634 ?AUTO_3635 )
      ( MAKE-ON-VERIFY ?AUTO_3634 ?AUTO_3635 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3642 - BLOCK
      ?AUTO_3643 - BLOCK
    )
    :vars
    (
      ?AUTO_3646 - BLOCK
      ?AUTO_3645 - BLOCK
      ?AUTO_3644 - BLOCK
      ?AUTO_3647 - BLOCK
      ?AUTO_3648 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3643 ) ( not ( = ?AUTO_3642 ?AUTO_3643 ) ) ( ON ?AUTO_3642 ?AUTO_3646 ) ( not ( = ?AUTO_3642 ?AUTO_3646 ) ) ( not ( = ?AUTO_3643 ?AUTO_3646 ) ) ( CLEAR ?AUTO_3645 ) ( not ( = ?AUTO_3642 ?AUTO_3644 ) ) ( not ( = ?AUTO_3642 ?AUTO_3645 ) ) ( not ( = ?AUTO_3643 ?AUTO_3644 ) ) ( not ( = ?AUTO_3643 ?AUTO_3645 ) ) ( not ( = ?AUTO_3646 ?AUTO_3644 ) ) ( not ( = ?AUTO_3646 ?AUTO_3645 ) ) ( not ( = ?AUTO_3644 ?AUTO_3645 ) ) ( ON ?AUTO_3644 ?AUTO_3642 ) ( CLEAR ?AUTO_3644 ) ( HOLDING ?AUTO_3647 ) ( CLEAR ?AUTO_3648 ) ( not ( = ?AUTO_3642 ?AUTO_3647 ) ) ( not ( = ?AUTO_3642 ?AUTO_3648 ) ) ( not ( = ?AUTO_3643 ?AUTO_3647 ) ) ( not ( = ?AUTO_3643 ?AUTO_3648 ) ) ( not ( = ?AUTO_3646 ?AUTO_3647 ) ) ( not ( = ?AUTO_3646 ?AUTO_3648 ) ) ( not ( = ?AUTO_3645 ?AUTO_3647 ) ) ( not ( = ?AUTO_3645 ?AUTO_3648 ) ) ( not ( = ?AUTO_3644 ?AUTO_3647 ) ) ( not ( = ?AUTO_3644 ?AUTO_3648 ) ) ( not ( = ?AUTO_3647 ?AUTO_3648 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3647 ?AUTO_3648 )
      ( MAKE-ON ?AUTO_3642 ?AUTO_3643 )
      ( MAKE-ON-VERIFY ?AUTO_3642 ?AUTO_3643 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3761 - BLOCK
      ?AUTO_3762 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3761 ) ( CLEAR ?AUTO_3762 ) ( not ( = ?AUTO_3761 ?AUTO_3762 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3761 ?AUTO_3762 )
      ( MAKE-ON-VERIFY ?AUTO_3761 ?AUTO_3762 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3763 - BLOCK
      ?AUTO_3764 - BLOCK
    )
    :vars
    (
      ?AUTO_3765 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3764 ) ( not ( = ?AUTO_3763 ?AUTO_3764 ) ) ( ON ?AUTO_3763 ?AUTO_3765 ) ( CLEAR ?AUTO_3763 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3763 ?AUTO_3765 ) ) ( not ( = ?AUTO_3764 ?AUTO_3765 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3763 ?AUTO_3765 )
      ( MAKE-ON ?AUTO_3763 ?AUTO_3764 )
      ( MAKE-ON-VERIFY ?AUTO_3763 ?AUTO_3764 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3766 - BLOCK
      ?AUTO_3767 - BLOCK
    )
    :vars
    (
      ?AUTO_3768 - BLOCK
      ?AUTO_3769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3766 ?AUTO_3767 ) ) ( ON ?AUTO_3766 ?AUTO_3768 ) ( CLEAR ?AUTO_3766 ) ( not ( = ?AUTO_3766 ?AUTO_3768 ) ) ( not ( = ?AUTO_3767 ?AUTO_3768 ) ) ( HOLDING ?AUTO_3767 ) ( CLEAR ?AUTO_3769 ) ( not ( = ?AUTO_3766 ?AUTO_3769 ) ) ( not ( = ?AUTO_3767 ?AUTO_3769 ) ) ( not ( = ?AUTO_3768 ?AUTO_3769 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3767 ?AUTO_3769 )
      ( MAKE-ON ?AUTO_3766 ?AUTO_3767 )
      ( MAKE-ON-VERIFY ?AUTO_3766 ?AUTO_3767 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3771 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3771 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3771 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3771 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3772 - BLOCK
    )
    :vars
    (
      ?AUTO_3773 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3772 ?AUTO_3773 ) ( CLEAR ?AUTO_3772 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3772 ?AUTO_3773 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3772 ?AUTO_3773 )
      ( MAKE-ON-TABLE ?AUTO_3772 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3772 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3776 - BLOCK
      ?AUTO_3777 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3776 ) ( CLEAR ?AUTO_3777 ) ( not ( = ?AUTO_3776 ?AUTO_3777 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3776 ?AUTO_3777 )
      ( MAKE-ON-VERIFY ?AUTO_3776 ?AUTO_3777 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3778 - BLOCK
      ?AUTO_3779 - BLOCK
    )
    :vars
    (
      ?AUTO_3780 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3779 ) ( not ( = ?AUTO_3778 ?AUTO_3779 ) ) ( ON ?AUTO_3778 ?AUTO_3780 ) ( CLEAR ?AUTO_3778 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3778 ?AUTO_3780 ) ) ( not ( = ?AUTO_3779 ?AUTO_3780 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3778 ?AUTO_3780 )
      ( MAKE-ON ?AUTO_3778 ?AUTO_3779 )
      ( MAKE-ON-VERIFY ?AUTO_3778 ?AUTO_3779 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3781 - BLOCK
      ?AUTO_3782 - BLOCK
    )
    :vars
    (
      ?AUTO_3783 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3781 ?AUTO_3782 ) ) ( ON ?AUTO_3781 ?AUTO_3783 ) ( CLEAR ?AUTO_3781 ) ( not ( = ?AUTO_3781 ?AUTO_3783 ) ) ( not ( = ?AUTO_3782 ?AUTO_3783 ) ) ( HOLDING ?AUTO_3782 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3782 )
      ( MAKE-ON ?AUTO_3781 ?AUTO_3782 )
      ( MAKE-ON-VERIFY ?AUTO_3781 ?AUTO_3782 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3787 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3787 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3787 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3787 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3788 - BLOCK
    )
    :vars
    (
      ?AUTO_3789 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3788 ?AUTO_3789 ) ( CLEAR ?AUTO_3788 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3788 ?AUTO_3789 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3788 ?AUTO_3789 )
      ( MAKE-ON-TABLE ?AUTO_3788 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3788 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3790 - BLOCK
    )
    :vars
    (
      ?AUTO_3791 - BLOCK
      ?AUTO_3792 - BLOCK
      ?AUTO_3793 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3790 ?AUTO_3791 ) ( CLEAR ?AUTO_3790 ) ( not ( = ?AUTO_3790 ?AUTO_3791 ) ) ( HOLDING ?AUTO_3792 ) ( CLEAR ?AUTO_3793 ) ( not ( = ?AUTO_3790 ?AUTO_3792 ) ) ( not ( = ?AUTO_3790 ?AUTO_3793 ) ) ( not ( = ?AUTO_3791 ?AUTO_3792 ) ) ( not ( = ?AUTO_3791 ?AUTO_3793 ) ) ( not ( = ?AUTO_3792 ?AUTO_3793 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3792 ?AUTO_3793 )
      ( MAKE-ON-TABLE ?AUTO_3790 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3790 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3794 - BLOCK
    )
    :vars
    (
      ?AUTO_3795 - BLOCK
      ?AUTO_3797 - BLOCK
      ?AUTO_3796 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3794 ?AUTO_3795 ) ( not ( = ?AUTO_3794 ?AUTO_3795 ) ) ( CLEAR ?AUTO_3797 ) ( not ( = ?AUTO_3794 ?AUTO_3796 ) ) ( not ( = ?AUTO_3794 ?AUTO_3797 ) ) ( not ( = ?AUTO_3795 ?AUTO_3796 ) ) ( not ( = ?AUTO_3795 ?AUTO_3797 ) ) ( not ( = ?AUTO_3796 ?AUTO_3797 ) ) ( ON ?AUTO_3796 ?AUTO_3794 ) ( CLEAR ?AUTO_3796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3796 ?AUTO_3794 )
      ( MAKE-ON-TABLE ?AUTO_3794 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3794 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3798 - BLOCK
    )
    :vars
    (
      ?AUTO_3799 - BLOCK
      ?AUTO_3800 - BLOCK
      ?AUTO_3801 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3798 ?AUTO_3799 ) ( not ( = ?AUTO_3798 ?AUTO_3799 ) ) ( not ( = ?AUTO_3798 ?AUTO_3800 ) ) ( not ( = ?AUTO_3798 ?AUTO_3801 ) ) ( not ( = ?AUTO_3799 ?AUTO_3800 ) ) ( not ( = ?AUTO_3799 ?AUTO_3801 ) ) ( not ( = ?AUTO_3800 ?AUTO_3801 ) ) ( ON ?AUTO_3800 ?AUTO_3798 ) ( CLEAR ?AUTO_3800 ) ( HOLDING ?AUTO_3801 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3801 )
      ( MAKE-ON-TABLE ?AUTO_3798 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3798 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3805 - BLOCK
      ?AUTO_3806 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3805 ) ( CLEAR ?AUTO_3806 ) ( not ( = ?AUTO_3805 ?AUTO_3806 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3805 ?AUTO_3806 )
      ( MAKE-ON-VERIFY ?AUTO_3805 ?AUTO_3806 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3807 - BLOCK
      ?AUTO_3808 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3808 ) ( not ( = ?AUTO_3807 ?AUTO_3808 ) ) ( ON-TABLE ?AUTO_3807 ) ( CLEAR ?AUTO_3807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3807 )
      ( MAKE-ON ?AUTO_3807 ?AUTO_3808 )
      ( MAKE-ON-VERIFY ?AUTO_3807 ?AUTO_3808 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3809 - BLOCK
      ?AUTO_3810 - BLOCK
    )
    :vars
    (
      ?AUTO_3811 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3810 ) ( not ( = ?AUTO_3809 ?AUTO_3810 ) ) ( ON-TABLE ?AUTO_3809 ) ( CLEAR ?AUTO_3809 ) ( HOLDING ?AUTO_3811 ) ( not ( = ?AUTO_3809 ?AUTO_3811 ) ) ( not ( = ?AUTO_3810 ?AUTO_3811 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3811 )
      ( MAKE-ON ?AUTO_3809 ?AUTO_3810 )
      ( MAKE-ON-VERIFY ?AUTO_3809 ?AUTO_3810 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3812 - BLOCK
      ?AUTO_3813 - BLOCK
    )
    :vars
    (
      ?AUTO_3814 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3813 ) ( not ( = ?AUTO_3812 ?AUTO_3813 ) ) ( ON-TABLE ?AUTO_3812 ) ( not ( = ?AUTO_3812 ?AUTO_3814 ) ) ( not ( = ?AUTO_3813 ?AUTO_3814 ) ) ( ON ?AUTO_3814 ?AUTO_3812 ) ( CLEAR ?AUTO_3814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3814 ?AUTO_3812 )
      ( MAKE-ON ?AUTO_3812 ?AUTO_3813 )
      ( MAKE-ON-VERIFY ?AUTO_3812 ?AUTO_3813 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3815 - BLOCK
      ?AUTO_3816 - BLOCK
    )
    :vars
    (
      ?AUTO_3817 - BLOCK
      ?AUTO_3818 - BLOCK
      ?AUTO_3819 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3816 ) ( not ( = ?AUTO_3815 ?AUTO_3816 ) ) ( ON-TABLE ?AUTO_3815 ) ( not ( = ?AUTO_3815 ?AUTO_3817 ) ) ( not ( = ?AUTO_3816 ?AUTO_3817 ) ) ( ON ?AUTO_3817 ?AUTO_3815 ) ( CLEAR ?AUTO_3817 ) ( HOLDING ?AUTO_3818 ) ( CLEAR ?AUTO_3819 ) ( not ( = ?AUTO_3815 ?AUTO_3818 ) ) ( not ( = ?AUTO_3815 ?AUTO_3819 ) ) ( not ( = ?AUTO_3816 ?AUTO_3818 ) ) ( not ( = ?AUTO_3816 ?AUTO_3819 ) ) ( not ( = ?AUTO_3817 ?AUTO_3818 ) ) ( not ( = ?AUTO_3817 ?AUTO_3819 ) ) ( not ( = ?AUTO_3818 ?AUTO_3819 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3818 ?AUTO_3819 )
      ( MAKE-ON ?AUTO_3815 ?AUTO_3816 )
      ( MAKE-ON-VERIFY ?AUTO_3815 ?AUTO_3816 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3820 - BLOCK
      ?AUTO_3821 - BLOCK
    )
    :vars
    (
      ?AUTO_3822 - BLOCK
      ?AUTO_3824 - BLOCK
      ?AUTO_3823 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3821 ) ( not ( = ?AUTO_3820 ?AUTO_3821 ) ) ( ON-TABLE ?AUTO_3820 ) ( not ( = ?AUTO_3820 ?AUTO_3822 ) ) ( not ( = ?AUTO_3821 ?AUTO_3822 ) ) ( ON ?AUTO_3822 ?AUTO_3820 ) ( CLEAR ?AUTO_3824 ) ( not ( = ?AUTO_3820 ?AUTO_3823 ) ) ( not ( = ?AUTO_3820 ?AUTO_3824 ) ) ( not ( = ?AUTO_3821 ?AUTO_3823 ) ) ( not ( = ?AUTO_3821 ?AUTO_3824 ) ) ( not ( = ?AUTO_3822 ?AUTO_3823 ) ) ( not ( = ?AUTO_3822 ?AUTO_3824 ) ) ( not ( = ?AUTO_3823 ?AUTO_3824 ) ) ( ON ?AUTO_3823 ?AUTO_3822 ) ( CLEAR ?AUTO_3823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3823 ?AUTO_3822 )
      ( MAKE-ON ?AUTO_3820 ?AUTO_3821 )
      ( MAKE-ON-VERIFY ?AUTO_3820 ?AUTO_3821 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3825 - BLOCK
      ?AUTO_3826 - BLOCK
    )
    :vars
    (
      ?AUTO_3829 - BLOCK
      ?AUTO_3828 - BLOCK
      ?AUTO_3827 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3826 ) ( not ( = ?AUTO_3825 ?AUTO_3826 ) ) ( ON-TABLE ?AUTO_3825 ) ( not ( = ?AUTO_3825 ?AUTO_3829 ) ) ( not ( = ?AUTO_3826 ?AUTO_3829 ) ) ( ON ?AUTO_3829 ?AUTO_3825 ) ( not ( = ?AUTO_3825 ?AUTO_3828 ) ) ( not ( = ?AUTO_3825 ?AUTO_3827 ) ) ( not ( = ?AUTO_3826 ?AUTO_3828 ) ) ( not ( = ?AUTO_3826 ?AUTO_3827 ) ) ( not ( = ?AUTO_3829 ?AUTO_3828 ) ) ( not ( = ?AUTO_3829 ?AUTO_3827 ) ) ( not ( = ?AUTO_3828 ?AUTO_3827 ) ) ( ON ?AUTO_3828 ?AUTO_3829 ) ( CLEAR ?AUTO_3828 ) ( HOLDING ?AUTO_3827 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3827 )
      ( MAKE-ON ?AUTO_3825 ?AUTO_3826 )
      ( MAKE-ON-VERIFY ?AUTO_3825 ?AUTO_3826 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3830 - BLOCK
      ?AUTO_3831 - BLOCK
    )
    :vars
    (
      ?AUTO_3834 - BLOCK
      ?AUTO_3832 - BLOCK
      ?AUTO_3833 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3830 ?AUTO_3831 ) ) ( ON-TABLE ?AUTO_3830 ) ( not ( = ?AUTO_3830 ?AUTO_3834 ) ) ( not ( = ?AUTO_3831 ?AUTO_3834 ) ) ( ON ?AUTO_3834 ?AUTO_3830 ) ( not ( = ?AUTO_3830 ?AUTO_3832 ) ) ( not ( = ?AUTO_3830 ?AUTO_3833 ) ) ( not ( = ?AUTO_3831 ?AUTO_3832 ) ) ( not ( = ?AUTO_3831 ?AUTO_3833 ) ) ( not ( = ?AUTO_3834 ?AUTO_3832 ) ) ( not ( = ?AUTO_3834 ?AUTO_3833 ) ) ( not ( = ?AUTO_3832 ?AUTO_3833 ) ) ( ON ?AUTO_3832 ?AUTO_3834 ) ( CLEAR ?AUTO_3832 ) ( ON ?AUTO_3833 ?AUTO_3831 ) ( CLEAR ?AUTO_3833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3833 ?AUTO_3831 )
      ( MAKE-ON ?AUTO_3830 ?AUTO_3831 )
      ( MAKE-ON-VERIFY ?AUTO_3830 ?AUTO_3831 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3836 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3836 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3836 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3836 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3837 - BLOCK
    )
    :vars
    (
      ?AUTO_3838 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3837 ?AUTO_3838 ) ( CLEAR ?AUTO_3837 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3837 ?AUTO_3838 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3837 ?AUTO_3838 )
      ( MAKE-ON-TABLE ?AUTO_3837 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3837 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3841 - BLOCK
      ?AUTO_3842 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3841 ) ( CLEAR ?AUTO_3842 ) ( not ( = ?AUTO_3841 ?AUTO_3842 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3841 ?AUTO_3842 )
      ( MAKE-ON-VERIFY ?AUTO_3841 ?AUTO_3842 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3843 - BLOCK
      ?AUTO_3844 - BLOCK
    )
    :vars
    (
      ?AUTO_3845 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3844 ) ( not ( = ?AUTO_3843 ?AUTO_3844 ) ) ( ON ?AUTO_3843 ?AUTO_3845 ) ( CLEAR ?AUTO_3843 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3843 ?AUTO_3845 ) ) ( not ( = ?AUTO_3844 ?AUTO_3845 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3843 ?AUTO_3845 )
      ( MAKE-ON ?AUTO_3843 ?AUTO_3844 )
      ( MAKE-ON-VERIFY ?AUTO_3843 ?AUTO_3844 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3846 - BLOCK
      ?AUTO_3847 - BLOCK
    )
    :vars
    (
      ?AUTO_3848 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3846 ?AUTO_3847 ) ) ( ON ?AUTO_3846 ?AUTO_3848 ) ( CLEAR ?AUTO_3846 ) ( not ( = ?AUTO_3846 ?AUTO_3848 ) ) ( not ( = ?AUTO_3847 ?AUTO_3848 ) ) ( HOLDING ?AUTO_3847 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3847 )
      ( MAKE-ON ?AUTO_3846 ?AUTO_3847 )
      ( MAKE-ON-VERIFY ?AUTO_3846 ?AUTO_3847 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3853 - BLOCK
      ?AUTO_3854 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3853 ) ( CLEAR ?AUTO_3854 ) ( not ( = ?AUTO_3853 ?AUTO_3854 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3853 ?AUTO_3854 )
      ( MAKE-ON-VERIFY ?AUTO_3853 ?AUTO_3854 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3855 - BLOCK
      ?AUTO_3856 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3856 ) ( not ( = ?AUTO_3855 ?AUTO_3856 ) ) ( ON-TABLE ?AUTO_3855 ) ( CLEAR ?AUTO_3855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3855 )
      ( MAKE-ON ?AUTO_3855 ?AUTO_3856 )
      ( MAKE-ON-VERIFY ?AUTO_3855 ?AUTO_3856 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3857 - BLOCK
      ?AUTO_3858 - BLOCK
    )
    :vars
    (
      ?AUTO_3859 - BLOCK
      ?AUTO_3860 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3858 ) ( not ( = ?AUTO_3857 ?AUTO_3858 ) ) ( ON-TABLE ?AUTO_3857 ) ( CLEAR ?AUTO_3857 ) ( HOLDING ?AUTO_3859 ) ( CLEAR ?AUTO_3860 ) ( not ( = ?AUTO_3857 ?AUTO_3859 ) ) ( not ( = ?AUTO_3857 ?AUTO_3860 ) ) ( not ( = ?AUTO_3858 ?AUTO_3859 ) ) ( not ( = ?AUTO_3858 ?AUTO_3860 ) ) ( not ( = ?AUTO_3859 ?AUTO_3860 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3859 ?AUTO_3860 )
      ( MAKE-ON ?AUTO_3857 ?AUTO_3858 )
      ( MAKE-ON-VERIFY ?AUTO_3857 ?AUTO_3858 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3861 - BLOCK
      ?AUTO_3862 - BLOCK
    )
    :vars
    (
      ?AUTO_3863 - BLOCK
      ?AUTO_3864 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3861 ?AUTO_3862 ) ) ( ON-TABLE ?AUTO_3861 ) ( CLEAR ?AUTO_3861 ) ( CLEAR ?AUTO_3863 ) ( not ( = ?AUTO_3861 ?AUTO_3864 ) ) ( not ( = ?AUTO_3861 ?AUTO_3863 ) ) ( not ( = ?AUTO_3862 ?AUTO_3864 ) ) ( not ( = ?AUTO_3862 ?AUTO_3863 ) ) ( not ( = ?AUTO_3864 ?AUTO_3863 ) ) ( ON ?AUTO_3864 ?AUTO_3862 ) ( CLEAR ?AUTO_3864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3864 ?AUTO_3862 )
      ( MAKE-ON ?AUTO_3861 ?AUTO_3862 )
      ( MAKE-ON-VERIFY ?AUTO_3861 ?AUTO_3862 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3865 - BLOCK
      ?AUTO_3866 - BLOCK
    )
    :vars
    (
      ?AUTO_3868 - BLOCK
      ?AUTO_3867 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3865 ?AUTO_3866 ) ) ( ON-TABLE ?AUTO_3865 ) ( CLEAR ?AUTO_3865 ) ( not ( = ?AUTO_3865 ?AUTO_3868 ) ) ( not ( = ?AUTO_3865 ?AUTO_3867 ) ) ( not ( = ?AUTO_3866 ?AUTO_3868 ) ) ( not ( = ?AUTO_3866 ?AUTO_3867 ) ) ( not ( = ?AUTO_3868 ?AUTO_3867 ) ) ( ON ?AUTO_3868 ?AUTO_3866 ) ( CLEAR ?AUTO_3868 ) ( HOLDING ?AUTO_3867 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3867 )
      ( MAKE-ON ?AUTO_3865 ?AUTO_3866 )
      ( MAKE-ON-VERIFY ?AUTO_3865 ?AUTO_3866 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3869 - BLOCK
      ?AUTO_3870 - BLOCK
    )
    :vars
    (
      ?AUTO_3871 - BLOCK
      ?AUTO_3872 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3869 ?AUTO_3870 ) ) ( ON-TABLE ?AUTO_3869 ) ( not ( = ?AUTO_3869 ?AUTO_3871 ) ) ( not ( = ?AUTO_3869 ?AUTO_3872 ) ) ( not ( = ?AUTO_3870 ?AUTO_3871 ) ) ( not ( = ?AUTO_3870 ?AUTO_3872 ) ) ( not ( = ?AUTO_3871 ?AUTO_3872 ) ) ( ON ?AUTO_3871 ?AUTO_3870 ) ( CLEAR ?AUTO_3871 ) ( ON ?AUTO_3872 ?AUTO_3869 ) ( CLEAR ?AUTO_3872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3872 ?AUTO_3869 )
      ( MAKE-ON ?AUTO_3869 ?AUTO_3870 )
      ( MAKE-ON-VERIFY ?AUTO_3869 ?AUTO_3870 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3875 - BLOCK
      ?AUTO_3876 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3875 ) ( CLEAR ?AUTO_3876 ) ( not ( = ?AUTO_3875 ?AUTO_3876 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3875 ?AUTO_3876 )
      ( MAKE-ON-VERIFY ?AUTO_3875 ?AUTO_3876 ) )
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
    )
    :precondition
    ( and ( CLEAR ?AUTO_3878 ) ( not ( = ?AUTO_3877 ?AUTO_3878 ) ) ( ON ?AUTO_3877 ?AUTO_3879 ) ( CLEAR ?AUTO_3877 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3877 ?AUTO_3879 ) ) ( not ( = ?AUTO_3878 ?AUTO_3879 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3877 ?AUTO_3879 )
      ( MAKE-ON ?AUTO_3877 ?AUTO_3878 )
      ( MAKE-ON-VERIFY ?AUTO_3877 ?AUTO_3878 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3880 - BLOCK
      ?AUTO_3881 - BLOCK
    )
    :vars
    (
      ?AUTO_3882 - BLOCK
      ?AUTO_3883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3880 ?AUTO_3881 ) ) ( ON ?AUTO_3880 ?AUTO_3882 ) ( CLEAR ?AUTO_3880 ) ( not ( = ?AUTO_3880 ?AUTO_3882 ) ) ( not ( = ?AUTO_3881 ?AUTO_3882 ) ) ( HOLDING ?AUTO_3881 ) ( CLEAR ?AUTO_3883 ) ( not ( = ?AUTO_3880 ?AUTO_3883 ) ) ( not ( = ?AUTO_3881 ?AUTO_3883 ) ) ( not ( = ?AUTO_3882 ?AUTO_3883 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3881 ?AUTO_3883 )
      ( MAKE-ON ?AUTO_3880 ?AUTO_3881 )
      ( MAKE-ON-VERIFY ?AUTO_3880 ?AUTO_3881 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3890 - BLOCK
      ?AUTO_3891 - BLOCK
    )
    :vars
    (
      ?AUTO_3892 - BLOCK
      ?AUTO_3893 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3891 ) ( not ( = ?AUTO_3890 ?AUTO_3891 ) ) ( ON ?AUTO_3890 ?AUTO_3892 ) ( CLEAR ?AUTO_3890 ) ( not ( = ?AUTO_3890 ?AUTO_3892 ) ) ( not ( = ?AUTO_3891 ?AUTO_3892 ) ) ( HOLDING ?AUTO_3893 ) ( not ( = ?AUTO_3890 ?AUTO_3893 ) ) ( not ( = ?AUTO_3891 ?AUTO_3893 ) ) ( not ( = ?AUTO_3892 ?AUTO_3893 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3893 )
      ( MAKE-ON ?AUTO_3890 ?AUTO_3891 )
      ( MAKE-ON-VERIFY ?AUTO_3890 ?AUTO_3891 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3894 - BLOCK
      ?AUTO_3895 - BLOCK
    )
    :vars
    (
      ?AUTO_3896 - BLOCK
      ?AUTO_3897 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3894 ?AUTO_3895 ) ) ( ON ?AUTO_3894 ?AUTO_3896 ) ( CLEAR ?AUTO_3894 ) ( not ( = ?AUTO_3894 ?AUTO_3896 ) ) ( not ( = ?AUTO_3895 ?AUTO_3896 ) ) ( not ( = ?AUTO_3894 ?AUTO_3897 ) ) ( not ( = ?AUTO_3895 ?AUTO_3897 ) ) ( not ( = ?AUTO_3896 ?AUTO_3897 ) ) ( ON ?AUTO_3897 ?AUTO_3895 ) ( CLEAR ?AUTO_3897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3897 ?AUTO_3895 )
      ( MAKE-ON ?AUTO_3894 ?AUTO_3895 )
      ( MAKE-ON-VERIFY ?AUTO_3894 ?AUTO_3895 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3899 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3899 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3899 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3899 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3900 - BLOCK
    )
    :vars
    (
      ?AUTO_3901 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3900 ?AUTO_3901 ) ( CLEAR ?AUTO_3900 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3900 ?AUTO_3901 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3900 ?AUTO_3901 )
      ( MAKE-ON-TABLE ?AUTO_3900 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3900 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3904 - BLOCK
      ?AUTO_3905 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3904 ) ( CLEAR ?AUTO_3905 ) ( not ( = ?AUTO_3904 ?AUTO_3905 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3904 ?AUTO_3905 )
      ( MAKE-ON-VERIFY ?AUTO_3904 ?AUTO_3905 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3906 - BLOCK
      ?AUTO_3907 - BLOCK
    )
    :vars
    (
      ?AUTO_3908 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3907 ) ( not ( = ?AUTO_3906 ?AUTO_3907 ) ) ( ON ?AUTO_3906 ?AUTO_3908 ) ( CLEAR ?AUTO_3906 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3906 ?AUTO_3908 ) ) ( not ( = ?AUTO_3907 ?AUTO_3908 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3906 ?AUTO_3908 )
      ( MAKE-ON ?AUTO_3906 ?AUTO_3907 )
      ( MAKE-ON-VERIFY ?AUTO_3906 ?AUTO_3907 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3909 - BLOCK
      ?AUTO_3910 - BLOCK
    )
    :vars
    (
      ?AUTO_3911 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3909 ?AUTO_3910 ) ) ( ON ?AUTO_3909 ?AUTO_3911 ) ( CLEAR ?AUTO_3909 ) ( not ( = ?AUTO_3909 ?AUTO_3911 ) ) ( not ( = ?AUTO_3910 ?AUTO_3911 ) ) ( HOLDING ?AUTO_3910 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3910 )
      ( MAKE-ON ?AUTO_3909 ?AUTO_3910 )
      ( MAKE-ON-VERIFY ?AUTO_3909 ?AUTO_3910 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3912 - BLOCK
      ?AUTO_3913 - BLOCK
    )
    :vars
    (
      ?AUTO_3914 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3912 ?AUTO_3913 ) ) ( ON ?AUTO_3912 ?AUTO_3914 ) ( not ( = ?AUTO_3912 ?AUTO_3914 ) ) ( not ( = ?AUTO_3913 ?AUTO_3914 ) ) ( ON ?AUTO_3913 ?AUTO_3912 ) ( CLEAR ?AUTO_3913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3913 ?AUTO_3912 )
      ( MAKE-ON ?AUTO_3912 ?AUTO_3913 )
      ( MAKE-ON-VERIFY ?AUTO_3912 ?AUTO_3913 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3917 - BLOCK
      ?AUTO_3918 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3917 ) ( CLEAR ?AUTO_3918 ) ( not ( = ?AUTO_3917 ?AUTO_3918 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3917 ?AUTO_3918 )
      ( MAKE-ON-VERIFY ?AUTO_3917 ?AUTO_3918 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3919 - BLOCK
      ?AUTO_3920 - BLOCK
    )
    :vars
    (
      ?AUTO_3921 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3920 ) ( not ( = ?AUTO_3919 ?AUTO_3920 ) ) ( ON ?AUTO_3919 ?AUTO_3921 ) ( CLEAR ?AUTO_3919 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3919 ?AUTO_3921 ) ) ( not ( = ?AUTO_3920 ?AUTO_3921 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3919 ?AUTO_3921 )
      ( MAKE-ON ?AUTO_3919 ?AUTO_3920 )
      ( MAKE-ON-VERIFY ?AUTO_3919 ?AUTO_3920 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3922 - BLOCK
      ?AUTO_3923 - BLOCK
    )
    :vars
    (
      ?AUTO_3924 - BLOCK
      ?AUTO_3925 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3922 ?AUTO_3923 ) ) ( ON ?AUTO_3922 ?AUTO_3924 ) ( CLEAR ?AUTO_3922 ) ( not ( = ?AUTO_3922 ?AUTO_3924 ) ) ( not ( = ?AUTO_3923 ?AUTO_3924 ) ) ( HOLDING ?AUTO_3923 ) ( CLEAR ?AUTO_3925 ) ( not ( = ?AUTO_3922 ?AUTO_3925 ) ) ( not ( = ?AUTO_3923 ?AUTO_3925 ) ) ( not ( = ?AUTO_3924 ?AUTO_3925 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3923 ?AUTO_3925 )
      ( MAKE-ON ?AUTO_3922 ?AUTO_3923 )
      ( MAKE-ON-VERIFY ?AUTO_3922 ?AUTO_3923 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3928 - BLOCK
      ?AUTO_3929 - BLOCK
    )
    :vars
    (
      ?AUTO_3930 - BLOCK
      ?AUTO_3931 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3929 ) ( not ( = ?AUTO_3928 ?AUTO_3929 ) ) ( ON ?AUTO_3928 ?AUTO_3930 ) ( CLEAR ?AUTO_3928 ) ( not ( = ?AUTO_3928 ?AUTO_3930 ) ) ( not ( = ?AUTO_3929 ?AUTO_3930 ) ) ( HOLDING ?AUTO_3931 ) ( not ( = ?AUTO_3928 ?AUTO_3931 ) ) ( not ( = ?AUTO_3929 ?AUTO_3931 ) ) ( not ( = ?AUTO_3930 ?AUTO_3931 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3931 )
      ( MAKE-ON ?AUTO_3928 ?AUTO_3929 )
      ( MAKE-ON-VERIFY ?AUTO_3928 ?AUTO_3929 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3932 - BLOCK
      ?AUTO_3933 - BLOCK
    )
    :vars
    (
      ?AUTO_3934 - BLOCK
      ?AUTO_3935 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3932 ?AUTO_3933 ) ) ( ON ?AUTO_3932 ?AUTO_3934 ) ( CLEAR ?AUTO_3932 ) ( not ( = ?AUTO_3932 ?AUTO_3934 ) ) ( not ( = ?AUTO_3933 ?AUTO_3934 ) ) ( not ( = ?AUTO_3932 ?AUTO_3935 ) ) ( not ( = ?AUTO_3933 ?AUTO_3935 ) ) ( not ( = ?AUTO_3934 ?AUTO_3935 ) ) ( ON ?AUTO_3935 ?AUTO_3933 ) ( CLEAR ?AUTO_3935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3935 ?AUTO_3933 )
      ( MAKE-ON ?AUTO_3932 ?AUTO_3933 )
      ( MAKE-ON-VERIFY ?AUTO_3932 ?AUTO_3933 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3938 - BLOCK
      ?AUTO_3939 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3938 ) ( CLEAR ?AUTO_3939 ) ( not ( = ?AUTO_3938 ?AUTO_3939 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3938 ?AUTO_3939 )
      ( MAKE-ON-VERIFY ?AUTO_3938 ?AUTO_3939 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3940 - BLOCK
      ?AUTO_3941 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3941 ) ( not ( = ?AUTO_3940 ?AUTO_3941 ) ) ( ON-TABLE ?AUTO_3940 ) ( CLEAR ?AUTO_3940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3940 )
      ( MAKE-ON ?AUTO_3940 ?AUTO_3941 )
      ( MAKE-ON-VERIFY ?AUTO_3940 ?AUTO_3941 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3942 - BLOCK
      ?AUTO_3943 - BLOCK
    )
    :vars
    (
      ?AUTO_3944 - BLOCK
      ?AUTO_3945 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3943 ) ( not ( = ?AUTO_3942 ?AUTO_3943 ) ) ( ON-TABLE ?AUTO_3942 ) ( CLEAR ?AUTO_3942 ) ( HOLDING ?AUTO_3944 ) ( CLEAR ?AUTO_3945 ) ( not ( = ?AUTO_3942 ?AUTO_3944 ) ) ( not ( = ?AUTO_3942 ?AUTO_3945 ) ) ( not ( = ?AUTO_3943 ?AUTO_3944 ) ) ( not ( = ?AUTO_3943 ?AUTO_3945 ) ) ( not ( = ?AUTO_3944 ?AUTO_3945 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3944 ?AUTO_3945 )
      ( MAKE-ON ?AUTO_3942 ?AUTO_3943 )
      ( MAKE-ON-VERIFY ?AUTO_3942 ?AUTO_3943 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3946 - BLOCK
      ?AUTO_3947 - BLOCK
    )
    :vars
    (
      ?AUTO_3948 - BLOCK
      ?AUTO_3949 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3947 ) ( not ( = ?AUTO_3946 ?AUTO_3947 ) ) ( ON-TABLE ?AUTO_3946 ) ( CLEAR ?AUTO_3948 ) ( not ( = ?AUTO_3946 ?AUTO_3949 ) ) ( not ( = ?AUTO_3946 ?AUTO_3948 ) ) ( not ( = ?AUTO_3947 ?AUTO_3949 ) ) ( not ( = ?AUTO_3947 ?AUTO_3948 ) ) ( not ( = ?AUTO_3949 ?AUTO_3948 ) ) ( ON ?AUTO_3949 ?AUTO_3946 ) ( CLEAR ?AUTO_3949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3949 ?AUTO_3946 )
      ( MAKE-ON ?AUTO_3946 ?AUTO_3947 )
      ( MAKE-ON-VERIFY ?AUTO_3946 ?AUTO_3947 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3950 - BLOCK
      ?AUTO_3951 - BLOCK
    )
    :vars
    (
      ?AUTO_3952 - BLOCK
      ?AUTO_3953 - BLOCK
      ?AUTO_3954 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3951 ) ( not ( = ?AUTO_3950 ?AUTO_3951 ) ) ( ON-TABLE ?AUTO_3950 ) ( not ( = ?AUTO_3950 ?AUTO_3952 ) ) ( not ( = ?AUTO_3950 ?AUTO_3953 ) ) ( not ( = ?AUTO_3951 ?AUTO_3952 ) ) ( not ( = ?AUTO_3951 ?AUTO_3953 ) ) ( not ( = ?AUTO_3952 ?AUTO_3953 ) ) ( ON ?AUTO_3952 ?AUTO_3950 ) ( CLEAR ?AUTO_3952 ) ( HOLDING ?AUTO_3953 ) ( CLEAR ?AUTO_3954 ) ( not ( = ?AUTO_3950 ?AUTO_3954 ) ) ( not ( = ?AUTO_3951 ?AUTO_3954 ) ) ( not ( = ?AUTO_3952 ?AUTO_3954 ) ) ( not ( = ?AUTO_3953 ?AUTO_3954 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3953 ?AUTO_3954 )
      ( MAKE-ON ?AUTO_3950 ?AUTO_3951 )
      ( MAKE-ON-VERIFY ?AUTO_3950 ?AUTO_3951 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3955 - BLOCK
      ?AUTO_3956 - BLOCK
    )
    :vars
    (
      ?AUTO_3957 - BLOCK
      ?AUTO_3958 - BLOCK
      ?AUTO_3959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3955 ?AUTO_3956 ) ) ( ON-TABLE ?AUTO_3955 ) ( not ( = ?AUTO_3955 ?AUTO_3957 ) ) ( not ( = ?AUTO_3955 ?AUTO_3958 ) ) ( not ( = ?AUTO_3956 ?AUTO_3957 ) ) ( not ( = ?AUTO_3956 ?AUTO_3958 ) ) ( not ( = ?AUTO_3957 ?AUTO_3958 ) ) ( ON ?AUTO_3957 ?AUTO_3955 ) ( CLEAR ?AUTO_3957 ) ( CLEAR ?AUTO_3959 ) ( not ( = ?AUTO_3955 ?AUTO_3959 ) ) ( not ( = ?AUTO_3956 ?AUTO_3959 ) ) ( not ( = ?AUTO_3957 ?AUTO_3959 ) ) ( not ( = ?AUTO_3958 ?AUTO_3959 ) ) ( ON ?AUTO_3958 ?AUTO_3956 ) ( CLEAR ?AUTO_3958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3958 ?AUTO_3956 )
      ( MAKE-ON ?AUTO_3955 ?AUTO_3956 )
      ( MAKE-ON-VERIFY ?AUTO_3955 ?AUTO_3956 ) )
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
    )
    :precondition
    ( and ( not ( = ?AUTO_3960 ?AUTO_3961 ) ) ( ON-TABLE ?AUTO_3960 ) ( not ( = ?AUTO_3960 ?AUTO_3962 ) ) ( not ( = ?AUTO_3960 ?AUTO_3963 ) ) ( not ( = ?AUTO_3961 ?AUTO_3962 ) ) ( not ( = ?AUTO_3961 ?AUTO_3963 ) ) ( not ( = ?AUTO_3962 ?AUTO_3963 ) ) ( ON ?AUTO_3962 ?AUTO_3960 ) ( CLEAR ?AUTO_3962 ) ( not ( = ?AUTO_3960 ?AUTO_3964 ) ) ( not ( = ?AUTO_3961 ?AUTO_3964 ) ) ( not ( = ?AUTO_3962 ?AUTO_3964 ) ) ( not ( = ?AUTO_3963 ?AUTO_3964 ) ) ( ON ?AUTO_3963 ?AUTO_3961 ) ( CLEAR ?AUTO_3963 ) ( HOLDING ?AUTO_3964 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3964 )
      ( MAKE-ON ?AUTO_3960 ?AUTO_3961 )
      ( MAKE-ON-VERIFY ?AUTO_3960 ?AUTO_3961 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3965 - BLOCK
      ?AUTO_3966 - BLOCK
    )
    :vars
    (
      ?AUTO_3967 - BLOCK
      ?AUTO_3968 - BLOCK
      ?AUTO_3969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3965 ?AUTO_3966 ) ) ( ON-TABLE ?AUTO_3965 ) ( not ( = ?AUTO_3965 ?AUTO_3967 ) ) ( not ( = ?AUTO_3965 ?AUTO_3968 ) ) ( not ( = ?AUTO_3966 ?AUTO_3967 ) ) ( not ( = ?AUTO_3966 ?AUTO_3968 ) ) ( not ( = ?AUTO_3967 ?AUTO_3968 ) ) ( ON ?AUTO_3967 ?AUTO_3965 ) ( CLEAR ?AUTO_3967 ) ( not ( = ?AUTO_3965 ?AUTO_3969 ) ) ( not ( = ?AUTO_3966 ?AUTO_3969 ) ) ( not ( = ?AUTO_3967 ?AUTO_3969 ) ) ( not ( = ?AUTO_3968 ?AUTO_3969 ) ) ( ON ?AUTO_3968 ?AUTO_3966 ) ( ON ?AUTO_3969 ?AUTO_3968 ) ( CLEAR ?AUTO_3969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3969 ?AUTO_3968 )
      ( MAKE-ON ?AUTO_3965 ?AUTO_3966 )
      ( MAKE-ON-VERIFY ?AUTO_3965 ?AUTO_3966 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3972 - BLOCK
      ?AUTO_3973 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3972 ) ( CLEAR ?AUTO_3973 ) ( not ( = ?AUTO_3972 ?AUTO_3973 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3972 ?AUTO_3973 )
      ( MAKE-ON-VERIFY ?AUTO_3972 ?AUTO_3973 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3974 - BLOCK
      ?AUTO_3975 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3975 ) ( not ( = ?AUTO_3974 ?AUTO_3975 ) ) ( ON-TABLE ?AUTO_3974 ) ( CLEAR ?AUTO_3974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3974 )
      ( MAKE-ON ?AUTO_3974 ?AUTO_3975 )
      ( MAKE-ON-VERIFY ?AUTO_3974 ?AUTO_3975 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3976 - BLOCK
      ?AUTO_3977 - BLOCK
    )
    :vars
    (
      ?AUTO_3978 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3976 ?AUTO_3977 ) ) ( ON-TABLE ?AUTO_3976 ) ( CLEAR ?AUTO_3976 ) ( HOLDING ?AUTO_3977 ) ( CLEAR ?AUTO_3978 ) ( not ( = ?AUTO_3976 ?AUTO_3978 ) ) ( not ( = ?AUTO_3977 ?AUTO_3978 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3977 ?AUTO_3978 )
      ( MAKE-ON ?AUTO_3976 ?AUTO_3977 )
      ( MAKE-ON-VERIFY ?AUTO_3976 ?AUTO_3977 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3983 - BLOCK
      ?AUTO_3984 - BLOCK
    )
    :vars
    (
      ?AUTO_3986 - BLOCK
      ?AUTO_3985 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3983 ?AUTO_3984 ) ) ( ON-TABLE ?AUTO_3983 ) ( CLEAR ?AUTO_3983 ) ( CLEAR ?AUTO_3986 ) ( not ( = ?AUTO_3983 ?AUTO_3985 ) ) ( not ( = ?AUTO_3983 ?AUTO_3986 ) ) ( not ( = ?AUTO_3984 ?AUTO_3985 ) ) ( not ( = ?AUTO_3984 ?AUTO_3986 ) ) ( not ( = ?AUTO_3985 ?AUTO_3986 ) ) ( ON ?AUTO_3985 ?AUTO_3984 ) ( CLEAR ?AUTO_3985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3985 ?AUTO_3984 )
      ( MAKE-ON ?AUTO_3983 ?AUTO_3984 )
      ( MAKE-ON-VERIFY ?AUTO_3983 ?AUTO_3984 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3987 - BLOCK
      ?AUTO_3988 - BLOCK
    )
    :vars
    (
      ?AUTO_3989 - BLOCK
      ?AUTO_3990 - BLOCK
      ?AUTO_3991 - BLOCK
      ?AUTO_3992 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3987 ?AUTO_3988 ) ) ( ON-TABLE ?AUTO_3987 ) ( CLEAR ?AUTO_3987 ) ( CLEAR ?AUTO_3989 ) ( not ( = ?AUTO_3987 ?AUTO_3990 ) ) ( not ( = ?AUTO_3987 ?AUTO_3989 ) ) ( not ( = ?AUTO_3988 ?AUTO_3990 ) ) ( not ( = ?AUTO_3988 ?AUTO_3989 ) ) ( not ( = ?AUTO_3990 ?AUTO_3989 ) ) ( ON ?AUTO_3990 ?AUTO_3988 ) ( CLEAR ?AUTO_3990 ) ( HOLDING ?AUTO_3991 ) ( CLEAR ?AUTO_3992 ) ( not ( = ?AUTO_3987 ?AUTO_3991 ) ) ( not ( = ?AUTO_3987 ?AUTO_3992 ) ) ( not ( = ?AUTO_3988 ?AUTO_3991 ) ) ( not ( = ?AUTO_3988 ?AUTO_3992 ) ) ( not ( = ?AUTO_3989 ?AUTO_3991 ) ) ( not ( = ?AUTO_3989 ?AUTO_3992 ) ) ( not ( = ?AUTO_3990 ?AUTO_3991 ) ) ( not ( = ?AUTO_3990 ?AUTO_3992 ) ) ( not ( = ?AUTO_3991 ?AUTO_3992 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3991 ?AUTO_3992 )
      ( MAKE-ON ?AUTO_3987 ?AUTO_3988 )
      ( MAKE-ON-VERIFY ?AUTO_3987 ?AUTO_3988 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3995 - BLOCK
      ?AUTO_3996 - BLOCK
    )
    :vars
    (
      ?AUTO_3998 - BLOCK
      ?AUTO_3997 - BLOCK
      ?AUTO_3999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3995 ?AUTO_3996 ) ) ( ON-TABLE ?AUTO_3995 ) ( CLEAR ?AUTO_3995 ) ( CLEAR ?AUTO_3998 ) ( not ( = ?AUTO_3995 ?AUTO_3997 ) ) ( not ( = ?AUTO_3995 ?AUTO_3998 ) ) ( not ( = ?AUTO_3996 ?AUTO_3997 ) ) ( not ( = ?AUTO_3996 ?AUTO_3998 ) ) ( not ( = ?AUTO_3997 ?AUTO_3998 ) ) ( ON ?AUTO_3997 ?AUTO_3996 ) ( CLEAR ?AUTO_3997 ) ( HOLDING ?AUTO_3999 ) ( not ( = ?AUTO_3995 ?AUTO_3999 ) ) ( not ( = ?AUTO_3996 ?AUTO_3999 ) ) ( not ( = ?AUTO_3998 ?AUTO_3999 ) ) ( not ( = ?AUTO_3997 ?AUTO_3999 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3999 )
      ( MAKE-ON ?AUTO_3995 ?AUTO_3996 )
      ( MAKE-ON-VERIFY ?AUTO_3995 ?AUTO_3996 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4001 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4001 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4001 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4001 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4002 - BLOCK
    )
    :vars
    (
      ?AUTO_4003 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4002 ?AUTO_4003 ) ( CLEAR ?AUTO_4002 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4002 ?AUTO_4003 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4002 ?AUTO_4003 )
      ( MAKE-ON-TABLE ?AUTO_4002 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4002 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4005 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4005 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4005 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4005 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4006 - BLOCK
    )
    :vars
    (
      ?AUTO_4007 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4006 ?AUTO_4007 ) ( CLEAR ?AUTO_4006 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4006 ?AUTO_4007 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4006 ?AUTO_4007 )
      ( MAKE-ON-TABLE ?AUTO_4006 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4006 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4008 - BLOCK
    )
    :vars
    (
      ?AUTO_4009 - BLOCK
      ?AUTO_4010 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4008 ?AUTO_4009 ) ( CLEAR ?AUTO_4008 ) ( not ( = ?AUTO_4008 ?AUTO_4009 ) ) ( HOLDING ?AUTO_4010 ) ( not ( = ?AUTO_4008 ?AUTO_4010 ) ) ( not ( = ?AUTO_4009 ?AUTO_4010 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4010 )
      ( MAKE-ON-TABLE ?AUTO_4008 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4008 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4014 - BLOCK
      ?AUTO_4015 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4014 ) ( CLEAR ?AUTO_4015 ) ( not ( = ?AUTO_4014 ?AUTO_4015 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4014 ?AUTO_4015 )
      ( MAKE-ON-VERIFY ?AUTO_4014 ?AUTO_4015 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4016 - BLOCK
      ?AUTO_4017 - BLOCK
    )
    :vars
    (
      ?AUTO_4018 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4017 ) ( not ( = ?AUTO_4016 ?AUTO_4017 ) ) ( ON ?AUTO_4016 ?AUTO_4018 ) ( CLEAR ?AUTO_4016 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4016 ?AUTO_4018 ) ) ( not ( = ?AUTO_4017 ?AUTO_4018 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4016 ?AUTO_4018 )
      ( MAKE-ON ?AUTO_4016 ?AUTO_4017 )
      ( MAKE-ON-VERIFY ?AUTO_4016 ?AUTO_4017 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4019 - BLOCK
      ?AUTO_4020 - BLOCK
    )
    :vars
    (
      ?AUTO_4021 - BLOCK
      ?AUTO_4022 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4020 ) ( not ( = ?AUTO_4019 ?AUTO_4020 ) ) ( ON ?AUTO_4019 ?AUTO_4021 ) ( CLEAR ?AUTO_4019 ) ( not ( = ?AUTO_4019 ?AUTO_4021 ) ) ( not ( = ?AUTO_4020 ?AUTO_4021 ) ) ( HOLDING ?AUTO_4022 ) ( not ( = ?AUTO_4019 ?AUTO_4022 ) ) ( not ( = ?AUTO_4020 ?AUTO_4022 ) ) ( not ( = ?AUTO_4021 ?AUTO_4022 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4022 )
      ( MAKE-ON ?AUTO_4019 ?AUTO_4020 )
      ( MAKE-ON-VERIFY ?AUTO_4019 ?AUTO_4020 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4025 - BLOCK
      ?AUTO_4026 - BLOCK
    )
    :vars
    (
      ?AUTO_4027 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4025 ?AUTO_4026 ) ) ( ON ?AUTO_4025 ?AUTO_4027 ) ( CLEAR ?AUTO_4025 ) ( not ( = ?AUTO_4025 ?AUTO_4027 ) ) ( not ( = ?AUTO_4026 ?AUTO_4027 ) ) ( HOLDING ?AUTO_4026 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4026 )
      ( MAKE-ON ?AUTO_4025 ?AUTO_4026 )
      ( MAKE-ON-VERIFY ?AUTO_4025 ?AUTO_4026 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4031 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4031 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4031 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4031 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4032 - BLOCK
    )
    :vars
    (
      ?AUTO_4033 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4032 ?AUTO_4033 ) ( CLEAR ?AUTO_4032 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4032 ?AUTO_4033 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4032 ?AUTO_4033 )
      ( MAKE-ON-TABLE ?AUTO_4032 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4032 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4034 - BLOCK
    )
    :vars
    (
      ?AUTO_4035 - BLOCK
      ?AUTO_4036 - BLOCK
      ?AUTO_4037 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4034 ?AUTO_4035 ) ( CLEAR ?AUTO_4034 ) ( not ( = ?AUTO_4034 ?AUTO_4035 ) ) ( HOLDING ?AUTO_4036 ) ( CLEAR ?AUTO_4037 ) ( not ( = ?AUTO_4034 ?AUTO_4036 ) ) ( not ( = ?AUTO_4034 ?AUTO_4037 ) ) ( not ( = ?AUTO_4035 ?AUTO_4036 ) ) ( not ( = ?AUTO_4035 ?AUTO_4037 ) ) ( not ( = ?AUTO_4036 ?AUTO_4037 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4036 ?AUTO_4037 )
      ( MAKE-ON-TABLE ?AUTO_4034 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4034 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4042 - BLOCK
    )
    :vars
    (
      ?AUTO_4043 - BLOCK
      ?AUTO_4045 - BLOCK
      ?AUTO_4044 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4042 ?AUTO_4043 ) ( not ( = ?AUTO_4042 ?AUTO_4043 ) ) ( CLEAR ?AUTO_4045 ) ( not ( = ?AUTO_4042 ?AUTO_4044 ) ) ( not ( = ?AUTO_4042 ?AUTO_4045 ) ) ( not ( = ?AUTO_4043 ?AUTO_4044 ) ) ( not ( = ?AUTO_4043 ?AUTO_4045 ) ) ( not ( = ?AUTO_4044 ?AUTO_4045 ) ) ( ON ?AUTO_4044 ?AUTO_4042 ) ( CLEAR ?AUTO_4044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4044 ?AUTO_4042 )
      ( MAKE-ON-TABLE ?AUTO_4042 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4042 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4048 - BLOCK
      ?AUTO_4049 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4048 ) ( CLEAR ?AUTO_4049 ) ( not ( = ?AUTO_4048 ?AUTO_4049 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4048 ?AUTO_4049 )
      ( MAKE-ON-VERIFY ?AUTO_4048 ?AUTO_4049 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4050 - BLOCK
      ?AUTO_4051 - BLOCK
    )
    :vars
    (
      ?AUTO_4052 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4051 ) ( not ( = ?AUTO_4050 ?AUTO_4051 ) ) ( ON ?AUTO_4050 ?AUTO_4052 ) ( CLEAR ?AUTO_4050 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4050 ?AUTO_4052 ) ) ( not ( = ?AUTO_4051 ?AUTO_4052 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4050 ?AUTO_4052 )
      ( MAKE-ON ?AUTO_4050 ?AUTO_4051 )
      ( MAKE-ON-VERIFY ?AUTO_4050 ?AUTO_4051 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4053 - BLOCK
      ?AUTO_4054 - BLOCK
    )
    :vars
    (
      ?AUTO_4055 - BLOCK
      ?AUTO_4056 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4054 ) ( not ( = ?AUTO_4053 ?AUTO_4054 ) ) ( ON ?AUTO_4053 ?AUTO_4055 ) ( CLEAR ?AUTO_4053 ) ( not ( = ?AUTO_4053 ?AUTO_4055 ) ) ( not ( = ?AUTO_4054 ?AUTO_4055 ) ) ( HOLDING ?AUTO_4056 ) ( not ( = ?AUTO_4053 ?AUTO_4056 ) ) ( not ( = ?AUTO_4054 ?AUTO_4056 ) ) ( not ( = ?AUTO_4055 ?AUTO_4056 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4056 )
      ( MAKE-ON ?AUTO_4053 ?AUTO_4054 )
      ( MAKE-ON-VERIFY ?AUTO_4053 ?AUTO_4054 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4057 - BLOCK
      ?AUTO_4058 - BLOCK
    )
    :vars
    (
      ?AUTO_4059 - BLOCK
      ?AUTO_4060 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4058 ) ( not ( = ?AUTO_4057 ?AUTO_4058 ) ) ( ON ?AUTO_4057 ?AUTO_4059 ) ( not ( = ?AUTO_4057 ?AUTO_4059 ) ) ( not ( = ?AUTO_4058 ?AUTO_4059 ) ) ( not ( = ?AUTO_4057 ?AUTO_4060 ) ) ( not ( = ?AUTO_4058 ?AUTO_4060 ) ) ( not ( = ?AUTO_4059 ?AUTO_4060 ) ) ( ON ?AUTO_4060 ?AUTO_4057 ) ( CLEAR ?AUTO_4060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4060 ?AUTO_4057 )
      ( MAKE-ON ?AUTO_4057 ?AUTO_4058 )
      ( MAKE-ON-VERIFY ?AUTO_4057 ?AUTO_4058 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4061 - BLOCK
      ?AUTO_4062 - BLOCK
    )
    :vars
    (
      ?AUTO_4063 - BLOCK
      ?AUTO_4064 - BLOCK
      ?AUTO_4065 - BLOCK
      ?AUTO_4066 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4062 ) ( not ( = ?AUTO_4061 ?AUTO_4062 ) ) ( ON ?AUTO_4061 ?AUTO_4063 ) ( not ( = ?AUTO_4061 ?AUTO_4063 ) ) ( not ( = ?AUTO_4062 ?AUTO_4063 ) ) ( not ( = ?AUTO_4061 ?AUTO_4064 ) ) ( not ( = ?AUTO_4062 ?AUTO_4064 ) ) ( not ( = ?AUTO_4063 ?AUTO_4064 ) ) ( ON ?AUTO_4064 ?AUTO_4061 ) ( CLEAR ?AUTO_4064 ) ( HOLDING ?AUTO_4065 ) ( CLEAR ?AUTO_4066 ) ( not ( = ?AUTO_4061 ?AUTO_4065 ) ) ( not ( = ?AUTO_4061 ?AUTO_4066 ) ) ( not ( = ?AUTO_4062 ?AUTO_4065 ) ) ( not ( = ?AUTO_4062 ?AUTO_4066 ) ) ( not ( = ?AUTO_4063 ?AUTO_4065 ) ) ( not ( = ?AUTO_4063 ?AUTO_4066 ) ) ( not ( = ?AUTO_4064 ?AUTO_4065 ) ) ( not ( = ?AUTO_4064 ?AUTO_4066 ) ) ( not ( = ?AUTO_4065 ?AUTO_4066 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4065 ?AUTO_4066 )
      ( MAKE-ON ?AUTO_4061 ?AUTO_4062 )
      ( MAKE-ON-VERIFY ?AUTO_4061 ?AUTO_4062 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4069 - BLOCK
      ?AUTO_4070 - BLOCK
    )
    :vars
    (
      ?AUTO_4072 - BLOCK
      ?AUTO_4071 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4069 ?AUTO_4070 ) ) ( ON ?AUTO_4069 ?AUTO_4072 ) ( not ( = ?AUTO_4069 ?AUTO_4072 ) ) ( not ( = ?AUTO_4070 ?AUTO_4072 ) ) ( not ( = ?AUTO_4069 ?AUTO_4071 ) ) ( not ( = ?AUTO_4070 ?AUTO_4071 ) ) ( not ( = ?AUTO_4072 ?AUTO_4071 ) ) ( ON ?AUTO_4071 ?AUTO_4069 ) ( CLEAR ?AUTO_4071 ) ( HOLDING ?AUTO_4070 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4070 )
      ( MAKE-ON ?AUTO_4069 ?AUTO_4070 )
      ( MAKE-ON-VERIFY ?AUTO_4069 ?AUTO_4070 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4077 - BLOCK
      ?AUTO_4078 - BLOCK
    )
    :vars
    (
      ?AUTO_4082 - BLOCK
      ?AUTO_4079 - BLOCK
      ?AUTO_4080 - BLOCK
      ?AUTO_4081 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4078 ) ( not ( = ?AUTO_4077 ?AUTO_4078 ) ) ( ON ?AUTO_4077 ?AUTO_4082 ) ( not ( = ?AUTO_4077 ?AUTO_4082 ) ) ( not ( = ?AUTO_4078 ?AUTO_4082 ) ) ( not ( = ?AUTO_4077 ?AUTO_4079 ) ) ( not ( = ?AUTO_4078 ?AUTO_4079 ) ) ( not ( = ?AUTO_4082 ?AUTO_4079 ) ) ( ON ?AUTO_4079 ?AUTO_4077 ) ( CLEAR ?AUTO_4080 ) ( not ( = ?AUTO_4077 ?AUTO_4081 ) ) ( not ( = ?AUTO_4077 ?AUTO_4080 ) ) ( not ( = ?AUTO_4078 ?AUTO_4081 ) ) ( not ( = ?AUTO_4078 ?AUTO_4080 ) ) ( not ( = ?AUTO_4082 ?AUTO_4081 ) ) ( not ( = ?AUTO_4082 ?AUTO_4080 ) ) ( not ( = ?AUTO_4079 ?AUTO_4081 ) ) ( not ( = ?AUTO_4079 ?AUTO_4080 ) ) ( not ( = ?AUTO_4081 ?AUTO_4080 ) ) ( ON ?AUTO_4081 ?AUTO_4079 ) ( CLEAR ?AUTO_4081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4081 ?AUTO_4079 )
      ( MAKE-ON ?AUTO_4077 ?AUTO_4078 )
      ( MAKE-ON-VERIFY ?AUTO_4077 ?AUTO_4078 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4085 - BLOCK
      ?AUTO_4086 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4085 ) ( CLEAR ?AUTO_4086 ) ( not ( = ?AUTO_4085 ?AUTO_4086 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4085 ?AUTO_4086 )
      ( MAKE-ON-VERIFY ?AUTO_4085 ?AUTO_4086 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4087 - BLOCK
      ?AUTO_4088 - BLOCK
    )
    :vars
    (
      ?AUTO_4089 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4088 ) ( not ( = ?AUTO_4087 ?AUTO_4088 ) ) ( ON ?AUTO_4087 ?AUTO_4089 ) ( CLEAR ?AUTO_4087 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4087 ?AUTO_4089 ) ) ( not ( = ?AUTO_4088 ?AUTO_4089 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4087 ?AUTO_4089 )
      ( MAKE-ON ?AUTO_4087 ?AUTO_4088 )
      ( MAKE-ON-VERIFY ?AUTO_4087 ?AUTO_4088 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4090 - BLOCK
      ?AUTO_4091 - BLOCK
    )
    :vars
    (
      ?AUTO_4092 - BLOCK
      ?AUTO_4093 - BLOCK
      ?AUTO_4094 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4091 ) ( not ( = ?AUTO_4090 ?AUTO_4091 ) ) ( ON ?AUTO_4090 ?AUTO_4092 ) ( CLEAR ?AUTO_4090 ) ( not ( = ?AUTO_4090 ?AUTO_4092 ) ) ( not ( = ?AUTO_4091 ?AUTO_4092 ) ) ( HOLDING ?AUTO_4093 ) ( CLEAR ?AUTO_4094 ) ( not ( = ?AUTO_4090 ?AUTO_4093 ) ) ( not ( = ?AUTO_4090 ?AUTO_4094 ) ) ( not ( = ?AUTO_4091 ?AUTO_4093 ) ) ( not ( = ?AUTO_4091 ?AUTO_4094 ) ) ( not ( = ?AUTO_4092 ?AUTO_4093 ) ) ( not ( = ?AUTO_4092 ?AUTO_4094 ) ) ( not ( = ?AUTO_4093 ?AUTO_4094 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4093 ?AUTO_4094 )
      ( MAKE-ON ?AUTO_4090 ?AUTO_4091 )
      ( MAKE-ON-VERIFY ?AUTO_4090 ?AUTO_4091 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4095 - BLOCK
      ?AUTO_4096 - BLOCK
    )
    :vars
    (
      ?AUTO_4097 - BLOCK
      ?AUTO_4098 - BLOCK
      ?AUTO_4099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4095 ?AUTO_4096 ) ) ( ON ?AUTO_4095 ?AUTO_4097 ) ( CLEAR ?AUTO_4095 ) ( not ( = ?AUTO_4095 ?AUTO_4097 ) ) ( not ( = ?AUTO_4096 ?AUTO_4097 ) ) ( CLEAR ?AUTO_4098 ) ( not ( = ?AUTO_4095 ?AUTO_4099 ) ) ( not ( = ?AUTO_4095 ?AUTO_4098 ) ) ( not ( = ?AUTO_4096 ?AUTO_4099 ) ) ( not ( = ?AUTO_4096 ?AUTO_4098 ) ) ( not ( = ?AUTO_4097 ?AUTO_4099 ) ) ( not ( = ?AUTO_4097 ?AUTO_4098 ) ) ( not ( = ?AUTO_4099 ?AUTO_4098 ) ) ( ON ?AUTO_4099 ?AUTO_4096 ) ( CLEAR ?AUTO_4099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4099 ?AUTO_4096 )
      ( MAKE-ON ?AUTO_4095 ?AUTO_4096 )
      ( MAKE-ON-VERIFY ?AUTO_4095 ?AUTO_4096 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4100 - BLOCK
      ?AUTO_4101 - BLOCK
    )
    :vars
    (
      ?AUTO_4104 - BLOCK
      ?AUTO_4102 - BLOCK
      ?AUTO_4103 - BLOCK
      ?AUTO_4105 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4100 ?AUTO_4101 ) ) ( ON ?AUTO_4100 ?AUTO_4104 ) ( CLEAR ?AUTO_4100 ) ( not ( = ?AUTO_4100 ?AUTO_4104 ) ) ( not ( = ?AUTO_4101 ?AUTO_4104 ) ) ( CLEAR ?AUTO_4102 ) ( not ( = ?AUTO_4100 ?AUTO_4103 ) ) ( not ( = ?AUTO_4100 ?AUTO_4102 ) ) ( not ( = ?AUTO_4101 ?AUTO_4103 ) ) ( not ( = ?AUTO_4101 ?AUTO_4102 ) ) ( not ( = ?AUTO_4104 ?AUTO_4103 ) ) ( not ( = ?AUTO_4104 ?AUTO_4102 ) ) ( not ( = ?AUTO_4103 ?AUTO_4102 ) ) ( ON ?AUTO_4103 ?AUTO_4101 ) ( CLEAR ?AUTO_4103 ) ( HOLDING ?AUTO_4105 ) ( not ( = ?AUTO_4100 ?AUTO_4105 ) ) ( not ( = ?AUTO_4101 ?AUTO_4105 ) ) ( not ( = ?AUTO_4104 ?AUTO_4105 ) ) ( not ( = ?AUTO_4102 ?AUTO_4105 ) ) ( not ( = ?AUTO_4103 ?AUTO_4105 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4105 )
      ( MAKE-ON ?AUTO_4100 ?AUTO_4101 )
      ( MAKE-ON-VERIFY ?AUTO_4100 ?AUTO_4101 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4106 - BLOCK
      ?AUTO_4107 - BLOCK
    )
    :vars
    (
      ?AUTO_4110 - BLOCK
      ?AUTO_4108 - BLOCK
      ?AUTO_4109 - BLOCK
      ?AUTO_4111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4106 ?AUTO_4107 ) ) ( ON ?AUTO_4106 ?AUTO_4110 ) ( CLEAR ?AUTO_4106 ) ( not ( = ?AUTO_4106 ?AUTO_4110 ) ) ( not ( = ?AUTO_4107 ?AUTO_4110 ) ) ( CLEAR ?AUTO_4108 ) ( not ( = ?AUTO_4106 ?AUTO_4109 ) ) ( not ( = ?AUTO_4106 ?AUTO_4108 ) ) ( not ( = ?AUTO_4107 ?AUTO_4109 ) ) ( not ( = ?AUTO_4107 ?AUTO_4108 ) ) ( not ( = ?AUTO_4110 ?AUTO_4109 ) ) ( not ( = ?AUTO_4110 ?AUTO_4108 ) ) ( not ( = ?AUTO_4109 ?AUTO_4108 ) ) ( ON ?AUTO_4109 ?AUTO_4107 ) ( not ( = ?AUTO_4106 ?AUTO_4111 ) ) ( not ( = ?AUTO_4107 ?AUTO_4111 ) ) ( not ( = ?AUTO_4110 ?AUTO_4111 ) ) ( not ( = ?AUTO_4108 ?AUTO_4111 ) ) ( not ( = ?AUTO_4109 ?AUTO_4111 ) ) ( ON ?AUTO_4111 ?AUTO_4109 ) ( CLEAR ?AUTO_4111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4111 ?AUTO_4109 )
      ( MAKE-ON ?AUTO_4106 ?AUTO_4107 )
      ( MAKE-ON-VERIFY ?AUTO_4106 ?AUTO_4107 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4112 - BLOCK
      ?AUTO_4113 - BLOCK
    )
    :vars
    (
      ?AUTO_4116 - BLOCK
      ?AUTO_4117 - BLOCK
      ?AUTO_4115 - BLOCK
      ?AUTO_4114 - BLOCK
      ?AUTO_4118 - BLOCK
      ?AUTO_4119 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4112 ?AUTO_4113 ) ) ( ON ?AUTO_4112 ?AUTO_4116 ) ( CLEAR ?AUTO_4112 ) ( not ( = ?AUTO_4112 ?AUTO_4116 ) ) ( not ( = ?AUTO_4113 ?AUTO_4116 ) ) ( CLEAR ?AUTO_4117 ) ( not ( = ?AUTO_4112 ?AUTO_4115 ) ) ( not ( = ?AUTO_4112 ?AUTO_4117 ) ) ( not ( = ?AUTO_4113 ?AUTO_4115 ) ) ( not ( = ?AUTO_4113 ?AUTO_4117 ) ) ( not ( = ?AUTO_4116 ?AUTO_4115 ) ) ( not ( = ?AUTO_4116 ?AUTO_4117 ) ) ( not ( = ?AUTO_4115 ?AUTO_4117 ) ) ( ON ?AUTO_4115 ?AUTO_4113 ) ( not ( = ?AUTO_4112 ?AUTO_4114 ) ) ( not ( = ?AUTO_4113 ?AUTO_4114 ) ) ( not ( = ?AUTO_4116 ?AUTO_4114 ) ) ( not ( = ?AUTO_4117 ?AUTO_4114 ) ) ( not ( = ?AUTO_4115 ?AUTO_4114 ) ) ( ON ?AUTO_4114 ?AUTO_4115 ) ( CLEAR ?AUTO_4114 ) ( HOLDING ?AUTO_4118 ) ( CLEAR ?AUTO_4119 ) ( not ( = ?AUTO_4112 ?AUTO_4118 ) ) ( not ( = ?AUTO_4112 ?AUTO_4119 ) ) ( not ( = ?AUTO_4113 ?AUTO_4118 ) ) ( not ( = ?AUTO_4113 ?AUTO_4119 ) ) ( not ( = ?AUTO_4116 ?AUTO_4118 ) ) ( not ( = ?AUTO_4116 ?AUTO_4119 ) ) ( not ( = ?AUTO_4117 ?AUTO_4118 ) ) ( not ( = ?AUTO_4117 ?AUTO_4119 ) ) ( not ( = ?AUTO_4115 ?AUTO_4118 ) ) ( not ( = ?AUTO_4115 ?AUTO_4119 ) ) ( not ( = ?AUTO_4114 ?AUTO_4118 ) ) ( not ( = ?AUTO_4114 ?AUTO_4119 ) ) ( not ( = ?AUTO_4118 ?AUTO_4119 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4118 ?AUTO_4119 )
      ( MAKE-ON ?AUTO_4112 ?AUTO_4113 )
      ( MAKE-ON-VERIFY ?AUTO_4112 ?AUTO_4113 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4120 - BLOCK
      ?AUTO_4121 - BLOCK
    )
    :vars
    (
      ?AUTO_4127 - BLOCK
      ?AUTO_4122 - BLOCK
      ?AUTO_4124 - BLOCK
      ?AUTO_4125 - BLOCK
      ?AUTO_4123 - BLOCK
      ?AUTO_4126 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4120 ?AUTO_4121 ) ) ( ON ?AUTO_4120 ?AUTO_4127 ) ( not ( = ?AUTO_4120 ?AUTO_4127 ) ) ( not ( = ?AUTO_4121 ?AUTO_4127 ) ) ( CLEAR ?AUTO_4122 ) ( not ( = ?AUTO_4120 ?AUTO_4124 ) ) ( not ( = ?AUTO_4120 ?AUTO_4122 ) ) ( not ( = ?AUTO_4121 ?AUTO_4124 ) ) ( not ( = ?AUTO_4121 ?AUTO_4122 ) ) ( not ( = ?AUTO_4127 ?AUTO_4124 ) ) ( not ( = ?AUTO_4127 ?AUTO_4122 ) ) ( not ( = ?AUTO_4124 ?AUTO_4122 ) ) ( ON ?AUTO_4124 ?AUTO_4121 ) ( not ( = ?AUTO_4120 ?AUTO_4125 ) ) ( not ( = ?AUTO_4121 ?AUTO_4125 ) ) ( not ( = ?AUTO_4127 ?AUTO_4125 ) ) ( not ( = ?AUTO_4122 ?AUTO_4125 ) ) ( not ( = ?AUTO_4124 ?AUTO_4125 ) ) ( ON ?AUTO_4125 ?AUTO_4124 ) ( CLEAR ?AUTO_4125 ) ( CLEAR ?AUTO_4123 ) ( not ( = ?AUTO_4120 ?AUTO_4126 ) ) ( not ( = ?AUTO_4120 ?AUTO_4123 ) ) ( not ( = ?AUTO_4121 ?AUTO_4126 ) ) ( not ( = ?AUTO_4121 ?AUTO_4123 ) ) ( not ( = ?AUTO_4127 ?AUTO_4126 ) ) ( not ( = ?AUTO_4127 ?AUTO_4123 ) ) ( not ( = ?AUTO_4122 ?AUTO_4126 ) ) ( not ( = ?AUTO_4122 ?AUTO_4123 ) ) ( not ( = ?AUTO_4124 ?AUTO_4126 ) ) ( not ( = ?AUTO_4124 ?AUTO_4123 ) ) ( not ( = ?AUTO_4125 ?AUTO_4126 ) ) ( not ( = ?AUTO_4125 ?AUTO_4123 ) ) ( not ( = ?AUTO_4126 ?AUTO_4123 ) ) ( ON ?AUTO_4126 ?AUTO_4120 ) ( CLEAR ?AUTO_4126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4126 ?AUTO_4120 )
      ( MAKE-ON ?AUTO_4120 ?AUTO_4121 )
      ( MAKE-ON-VERIFY ?AUTO_4120 ?AUTO_4121 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4128 - BLOCK
      ?AUTO_4129 - BLOCK
    )
    :vars
    (
      ?AUTO_4134 - BLOCK
      ?AUTO_4132 - BLOCK
      ?AUTO_4130 - BLOCK
      ?AUTO_4131 - BLOCK
      ?AUTO_4133 - BLOCK
      ?AUTO_4135 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4128 ?AUTO_4129 ) ) ( ON ?AUTO_4128 ?AUTO_4134 ) ( not ( = ?AUTO_4128 ?AUTO_4134 ) ) ( not ( = ?AUTO_4129 ?AUTO_4134 ) ) ( not ( = ?AUTO_4128 ?AUTO_4132 ) ) ( not ( = ?AUTO_4128 ?AUTO_4130 ) ) ( not ( = ?AUTO_4129 ?AUTO_4132 ) ) ( not ( = ?AUTO_4129 ?AUTO_4130 ) ) ( not ( = ?AUTO_4134 ?AUTO_4132 ) ) ( not ( = ?AUTO_4134 ?AUTO_4130 ) ) ( not ( = ?AUTO_4132 ?AUTO_4130 ) ) ( ON ?AUTO_4132 ?AUTO_4129 ) ( not ( = ?AUTO_4128 ?AUTO_4131 ) ) ( not ( = ?AUTO_4129 ?AUTO_4131 ) ) ( not ( = ?AUTO_4134 ?AUTO_4131 ) ) ( not ( = ?AUTO_4130 ?AUTO_4131 ) ) ( not ( = ?AUTO_4132 ?AUTO_4131 ) ) ( ON ?AUTO_4131 ?AUTO_4132 ) ( CLEAR ?AUTO_4131 ) ( CLEAR ?AUTO_4133 ) ( not ( = ?AUTO_4128 ?AUTO_4135 ) ) ( not ( = ?AUTO_4128 ?AUTO_4133 ) ) ( not ( = ?AUTO_4129 ?AUTO_4135 ) ) ( not ( = ?AUTO_4129 ?AUTO_4133 ) ) ( not ( = ?AUTO_4134 ?AUTO_4135 ) ) ( not ( = ?AUTO_4134 ?AUTO_4133 ) ) ( not ( = ?AUTO_4130 ?AUTO_4135 ) ) ( not ( = ?AUTO_4130 ?AUTO_4133 ) ) ( not ( = ?AUTO_4132 ?AUTO_4135 ) ) ( not ( = ?AUTO_4132 ?AUTO_4133 ) ) ( not ( = ?AUTO_4131 ?AUTO_4135 ) ) ( not ( = ?AUTO_4131 ?AUTO_4133 ) ) ( not ( = ?AUTO_4135 ?AUTO_4133 ) ) ( ON ?AUTO_4135 ?AUTO_4128 ) ( CLEAR ?AUTO_4135 ) ( HOLDING ?AUTO_4130 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4130 )
      ( MAKE-ON ?AUTO_4128 ?AUTO_4129 )
      ( MAKE-ON-VERIFY ?AUTO_4128 ?AUTO_4129 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4140 - BLOCK
      ?AUTO_4141 - BLOCK
    )
    :vars
    (
      ?AUTO_4145 - BLOCK
      ?AUTO_4142 - BLOCK
      ?AUTO_4147 - BLOCK
      ?AUTO_4146 - BLOCK
      ?AUTO_4143 - BLOCK
      ?AUTO_4144 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4140 ?AUTO_4141 ) ) ( ON ?AUTO_4140 ?AUTO_4145 ) ( not ( = ?AUTO_4140 ?AUTO_4145 ) ) ( not ( = ?AUTO_4141 ?AUTO_4145 ) ) ( not ( = ?AUTO_4140 ?AUTO_4142 ) ) ( not ( = ?AUTO_4140 ?AUTO_4147 ) ) ( not ( = ?AUTO_4141 ?AUTO_4142 ) ) ( not ( = ?AUTO_4141 ?AUTO_4147 ) ) ( not ( = ?AUTO_4145 ?AUTO_4142 ) ) ( not ( = ?AUTO_4145 ?AUTO_4147 ) ) ( not ( = ?AUTO_4142 ?AUTO_4147 ) ) ( ON ?AUTO_4142 ?AUTO_4141 ) ( not ( = ?AUTO_4140 ?AUTO_4146 ) ) ( not ( = ?AUTO_4141 ?AUTO_4146 ) ) ( not ( = ?AUTO_4145 ?AUTO_4146 ) ) ( not ( = ?AUTO_4147 ?AUTO_4146 ) ) ( not ( = ?AUTO_4142 ?AUTO_4146 ) ) ( ON ?AUTO_4146 ?AUTO_4142 ) ( CLEAR ?AUTO_4143 ) ( not ( = ?AUTO_4140 ?AUTO_4144 ) ) ( not ( = ?AUTO_4140 ?AUTO_4143 ) ) ( not ( = ?AUTO_4141 ?AUTO_4144 ) ) ( not ( = ?AUTO_4141 ?AUTO_4143 ) ) ( not ( = ?AUTO_4145 ?AUTO_4144 ) ) ( not ( = ?AUTO_4145 ?AUTO_4143 ) ) ( not ( = ?AUTO_4147 ?AUTO_4144 ) ) ( not ( = ?AUTO_4147 ?AUTO_4143 ) ) ( not ( = ?AUTO_4142 ?AUTO_4144 ) ) ( not ( = ?AUTO_4142 ?AUTO_4143 ) ) ( not ( = ?AUTO_4146 ?AUTO_4144 ) ) ( not ( = ?AUTO_4146 ?AUTO_4143 ) ) ( not ( = ?AUTO_4144 ?AUTO_4143 ) ) ( ON ?AUTO_4144 ?AUTO_4140 ) ( CLEAR ?AUTO_4144 ) ( ON ?AUTO_4147 ?AUTO_4146 ) ( CLEAR ?AUTO_4147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4147 ?AUTO_4146 )
      ( MAKE-ON ?AUTO_4140 ?AUTO_4141 )
      ( MAKE-ON-VERIFY ?AUTO_4140 ?AUTO_4141 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4150 - BLOCK
      ?AUTO_4151 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4150 ) ( CLEAR ?AUTO_4151 ) ( not ( = ?AUTO_4150 ?AUTO_4151 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4150 ?AUTO_4151 )
      ( MAKE-ON-VERIFY ?AUTO_4150 ?AUTO_4151 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4152 - BLOCK
      ?AUTO_4153 - BLOCK
    )
    :vars
    (
      ?AUTO_4154 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4153 ) ( not ( = ?AUTO_4152 ?AUTO_4153 ) ) ( ON ?AUTO_4152 ?AUTO_4154 ) ( CLEAR ?AUTO_4152 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4152 ?AUTO_4154 ) ) ( not ( = ?AUTO_4153 ?AUTO_4154 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4152 ?AUTO_4154 )
      ( MAKE-ON ?AUTO_4152 ?AUTO_4153 )
      ( MAKE-ON-VERIFY ?AUTO_4152 ?AUTO_4153 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4155 - BLOCK
      ?AUTO_4156 - BLOCK
    )
    :vars
    (
      ?AUTO_4157 - BLOCK
      ?AUTO_4158 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4155 ?AUTO_4156 ) ) ( ON ?AUTO_4155 ?AUTO_4157 ) ( CLEAR ?AUTO_4155 ) ( not ( = ?AUTO_4155 ?AUTO_4157 ) ) ( not ( = ?AUTO_4156 ?AUTO_4157 ) ) ( HOLDING ?AUTO_4156 ) ( CLEAR ?AUTO_4158 ) ( not ( = ?AUTO_4155 ?AUTO_4158 ) ) ( not ( = ?AUTO_4156 ?AUTO_4158 ) ) ( not ( = ?AUTO_4157 ?AUTO_4158 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4156 ?AUTO_4158 )
      ( MAKE-ON ?AUTO_4155 ?AUTO_4156 )
      ( MAKE-ON-VERIFY ?AUTO_4155 ?AUTO_4156 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4159 - BLOCK
      ?AUTO_4160 - BLOCK
    )
    :vars
    (
      ?AUTO_4161 - BLOCK
      ?AUTO_4162 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4159 ?AUTO_4160 ) ) ( ON ?AUTO_4159 ?AUTO_4161 ) ( not ( = ?AUTO_4159 ?AUTO_4161 ) ) ( not ( = ?AUTO_4160 ?AUTO_4161 ) ) ( CLEAR ?AUTO_4162 ) ( not ( = ?AUTO_4159 ?AUTO_4162 ) ) ( not ( = ?AUTO_4160 ?AUTO_4162 ) ) ( not ( = ?AUTO_4161 ?AUTO_4162 ) ) ( ON ?AUTO_4160 ?AUTO_4159 ) ( CLEAR ?AUTO_4160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4160 ?AUTO_4159 )
      ( MAKE-ON ?AUTO_4159 ?AUTO_4160 )
      ( MAKE-ON-VERIFY ?AUTO_4159 ?AUTO_4160 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4163 - BLOCK
      ?AUTO_4164 - BLOCK
    )
    :vars
    (
      ?AUTO_4165 - BLOCK
      ?AUTO_4166 - BLOCK
      ?AUTO_4167 - BLOCK
      ?AUTO_4168 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4163 ?AUTO_4164 ) ) ( ON ?AUTO_4163 ?AUTO_4165 ) ( not ( = ?AUTO_4163 ?AUTO_4165 ) ) ( not ( = ?AUTO_4164 ?AUTO_4165 ) ) ( CLEAR ?AUTO_4166 ) ( not ( = ?AUTO_4163 ?AUTO_4166 ) ) ( not ( = ?AUTO_4164 ?AUTO_4166 ) ) ( not ( = ?AUTO_4165 ?AUTO_4166 ) ) ( ON ?AUTO_4164 ?AUTO_4163 ) ( CLEAR ?AUTO_4164 ) ( HOLDING ?AUTO_4167 ) ( CLEAR ?AUTO_4168 ) ( not ( = ?AUTO_4163 ?AUTO_4167 ) ) ( not ( = ?AUTO_4163 ?AUTO_4168 ) ) ( not ( = ?AUTO_4164 ?AUTO_4167 ) ) ( not ( = ?AUTO_4164 ?AUTO_4168 ) ) ( not ( = ?AUTO_4165 ?AUTO_4167 ) ) ( not ( = ?AUTO_4165 ?AUTO_4168 ) ) ( not ( = ?AUTO_4166 ?AUTO_4167 ) ) ( not ( = ?AUTO_4166 ?AUTO_4168 ) ) ( not ( = ?AUTO_4167 ?AUTO_4168 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4167 ?AUTO_4168 )
      ( MAKE-ON ?AUTO_4163 ?AUTO_4164 )
      ( MAKE-ON-VERIFY ?AUTO_4163 ?AUTO_4164 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4177 - BLOCK
      ?AUTO_4178 - BLOCK
    )
    :vars
    (
      ?AUTO_4180 - BLOCK
      ?AUTO_4179 - BLOCK
      ?AUTO_4182 - BLOCK
      ?AUTO_4181 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4177 ?AUTO_4178 ) ) ( ON ?AUTO_4177 ?AUTO_4180 ) ( not ( = ?AUTO_4177 ?AUTO_4180 ) ) ( not ( = ?AUTO_4178 ?AUTO_4180 ) ) ( CLEAR ?AUTO_4179 ) ( not ( = ?AUTO_4177 ?AUTO_4179 ) ) ( not ( = ?AUTO_4178 ?AUTO_4179 ) ) ( not ( = ?AUTO_4180 ?AUTO_4179 ) ) ( ON ?AUTO_4178 ?AUTO_4177 ) ( CLEAR ?AUTO_4182 ) ( not ( = ?AUTO_4177 ?AUTO_4181 ) ) ( not ( = ?AUTO_4177 ?AUTO_4182 ) ) ( not ( = ?AUTO_4178 ?AUTO_4181 ) ) ( not ( = ?AUTO_4178 ?AUTO_4182 ) ) ( not ( = ?AUTO_4180 ?AUTO_4181 ) ) ( not ( = ?AUTO_4180 ?AUTO_4182 ) ) ( not ( = ?AUTO_4179 ?AUTO_4181 ) ) ( not ( = ?AUTO_4179 ?AUTO_4182 ) ) ( not ( = ?AUTO_4181 ?AUTO_4182 ) ) ( ON ?AUTO_4181 ?AUTO_4178 ) ( CLEAR ?AUTO_4181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4181 ?AUTO_4178 )
      ( MAKE-ON ?AUTO_4177 ?AUTO_4178 )
      ( MAKE-ON-VERIFY ?AUTO_4177 ?AUTO_4178 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4183 - BLOCK
      ?AUTO_4184 - BLOCK
    )
    :vars
    (
      ?AUTO_4188 - BLOCK
      ?AUTO_4185 - BLOCK
      ?AUTO_4187 - BLOCK
      ?AUTO_4186 - BLOCK
      ?AUTO_4189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4183 ?AUTO_4184 ) ) ( ON ?AUTO_4183 ?AUTO_4188 ) ( not ( = ?AUTO_4183 ?AUTO_4188 ) ) ( not ( = ?AUTO_4184 ?AUTO_4188 ) ) ( CLEAR ?AUTO_4185 ) ( not ( = ?AUTO_4183 ?AUTO_4185 ) ) ( not ( = ?AUTO_4184 ?AUTO_4185 ) ) ( not ( = ?AUTO_4188 ?AUTO_4185 ) ) ( ON ?AUTO_4184 ?AUTO_4183 ) ( CLEAR ?AUTO_4187 ) ( not ( = ?AUTO_4183 ?AUTO_4186 ) ) ( not ( = ?AUTO_4183 ?AUTO_4187 ) ) ( not ( = ?AUTO_4184 ?AUTO_4186 ) ) ( not ( = ?AUTO_4184 ?AUTO_4187 ) ) ( not ( = ?AUTO_4188 ?AUTO_4186 ) ) ( not ( = ?AUTO_4188 ?AUTO_4187 ) ) ( not ( = ?AUTO_4185 ?AUTO_4186 ) ) ( not ( = ?AUTO_4185 ?AUTO_4187 ) ) ( not ( = ?AUTO_4186 ?AUTO_4187 ) ) ( ON ?AUTO_4186 ?AUTO_4184 ) ( CLEAR ?AUTO_4186 ) ( HOLDING ?AUTO_4189 ) ( not ( = ?AUTO_4183 ?AUTO_4189 ) ) ( not ( = ?AUTO_4184 ?AUTO_4189 ) ) ( not ( = ?AUTO_4188 ?AUTO_4189 ) ) ( not ( = ?AUTO_4185 ?AUTO_4189 ) ) ( not ( = ?AUTO_4187 ?AUTO_4189 ) ) ( not ( = ?AUTO_4186 ?AUTO_4189 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4189 )
      ( MAKE-ON ?AUTO_4183 ?AUTO_4184 )
      ( MAKE-ON-VERIFY ?AUTO_4183 ?AUTO_4184 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4198 - BLOCK
      ?AUTO_4199 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4198 ) ( CLEAR ?AUTO_4199 ) ( not ( = ?AUTO_4198 ?AUTO_4199 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4198 ?AUTO_4199 )
      ( MAKE-ON-VERIFY ?AUTO_4198 ?AUTO_4199 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4200 - BLOCK
      ?AUTO_4201 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4201 ) ( not ( = ?AUTO_4200 ?AUTO_4201 ) ) ( ON-TABLE ?AUTO_4200 ) ( CLEAR ?AUTO_4200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4200 )
      ( MAKE-ON ?AUTO_4200 ?AUTO_4201 )
      ( MAKE-ON-VERIFY ?AUTO_4200 ?AUTO_4201 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4202 - BLOCK
      ?AUTO_4203 - BLOCK
    )
    :vars
    (
      ?AUTO_4204 - BLOCK
      ?AUTO_4205 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4203 ) ( not ( = ?AUTO_4202 ?AUTO_4203 ) ) ( ON-TABLE ?AUTO_4202 ) ( CLEAR ?AUTO_4202 ) ( HOLDING ?AUTO_4204 ) ( CLEAR ?AUTO_4205 ) ( not ( = ?AUTO_4202 ?AUTO_4204 ) ) ( not ( = ?AUTO_4202 ?AUTO_4205 ) ) ( not ( = ?AUTO_4203 ?AUTO_4204 ) ) ( not ( = ?AUTO_4203 ?AUTO_4205 ) ) ( not ( = ?AUTO_4204 ?AUTO_4205 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4204 ?AUTO_4205 )
      ( MAKE-ON ?AUTO_4202 ?AUTO_4203 )
      ( MAKE-ON-VERIFY ?AUTO_4202 ?AUTO_4203 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4206 - BLOCK
      ?AUTO_4207 - BLOCK
    )
    :vars
    (
      ?AUTO_4208 - BLOCK
      ?AUTO_4209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4206 ?AUTO_4207 ) ) ( ON-TABLE ?AUTO_4206 ) ( CLEAR ?AUTO_4206 ) ( CLEAR ?AUTO_4208 ) ( not ( = ?AUTO_4206 ?AUTO_4209 ) ) ( not ( = ?AUTO_4206 ?AUTO_4208 ) ) ( not ( = ?AUTO_4207 ?AUTO_4209 ) ) ( not ( = ?AUTO_4207 ?AUTO_4208 ) ) ( not ( = ?AUTO_4209 ?AUTO_4208 ) ) ( ON ?AUTO_4209 ?AUTO_4207 ) ( CLEAR ?AUTO_4209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4209 ?AUTO_4207 )
      ( MAKE-ON ?AUTO_4206 ?AUTO_4207 )
      ( MAKE-ON-VERIFY ?AUTO_4206 ?AUTO_4207 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4210 - BLOCK
      ?AUTO_4211 - BLOCK
    )
    :vars
    (
      ?AUTO_4213 - BLOCK
      ?AUTO_4212 - BLOCK
      ?AUTO_4214 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4210 ?AUTO_4211 ) ) ( ON-TABLE ?AUTO_4210 ) ( CLEAR ?AUTO_4210 ) ( not ( = ?AUTO_4210 ?AUTO_4213 ) ) ( not ( = ?AUTO_4210 ?AUTO_4212 ) ) ( not ( = ?AUTO_4211 ?AUTO_4213 ) ) ( not ( = ?AUTO_4211 ?AUTO_4212 ) ) ( not ( = ?AUTO_4213 ?AUTO_4212 ) ) ( ON ?AUTO_4213 ?AUTO_4211 ) ( CLEAR ?AUTO_4213 ) ( HOLDING ?AUTO_4212 ) ( CLEAR ?AUTO_4214 ) ( not ( = ?AUTO_4210 ?AUTO_4214 ) ) ( not ( = ?AUTO_4211 ?AUTO_4214 ) ) ( not ( = ?AUTO_4213 ?AUTO_4214 ) ) ( not ( = ?AUTO_4212 ?AUTO_4214 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4212 ?AUTO_4214 )
      ( MAKE-ON ?AUTO_4210 ?AUTO_4211 )
      ( MAKE-ON-VERIFY ?AUTO_4210 ?AUTO_4211 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4215 - BLOCK
      ?AUTO_4216 - BLOCK
    )
    :vars
    (
      ?AUTO_4217 - BLOCK
      ?AUTO_4218 - BLOCK
      ?AUTO_4219 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4215 ?AUTO_4216 ) ) ( ON-TABLE ?AUTO_4215 ) ( CLEAR ?AUTO_4215 ) ( not ( = ?AUTO_4215 ?AUTO_4217 ) ) ( not ( = ?AUTO_4215 ?AUTO_4218 ) ) ( not ( = ?AUTO_4216 ?AUTO_4217 ) ) ( not ( = ?AUTO_4216 ?AUTO_4218 ) ) ( not ( = ?AUTO_4217 ?AUTO_4218 ) ) ( ON ?AUTO_4217 ?AUTO_4216 ) ( CLEAR ?AUTO_4219 ) ( not ( = ?AUTO_4215 ?AUTO_4219 ) ) ( not ( = ?AUTO_4216 ?AUTO_4219 ) ) ( not ( = ?AUTO_4217 ?AUTO_4219 ) ) ( not ( = ?AUTO_4218 ?AUTO_4219 ) ) ( ON ?AUTO_4218 ?AUTO_4217 ) ( CLEAR ?AUTO_4218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4218 ?AUTO_4217 )
      ( MAKE-ON ?AUTO_4215 ?AUTO_4216 )
      ( MAKE-ON-VERIFY ?AUTO_4215 ?AUTO_4216 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4220 - BLOCK
      ?AUTO_4221 - BLOCK
    )
    :vars
    (
      ?AUTO_4222 - BLOCK
      ?AUTO_4223 - BLOCK
      ?AUTO_4224 - BLOCK
      ?AUTO_4225 - BLOCK
      ?AUTO_4226 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4220 ?AUTO_4221 ) ) ( ON-TABLE ?AUTO_4220 ) ( CLEAR ?AUTO_4220 ) ( not ( = ?AUTO_4220 ?AUTO_4222 ) ) ( not ( = ?AUTO_4220 ?AUTO_4223 ) ) ( not ( = ?AUTO_4221 ?AUTO_4222 ) ) ( not ( = ?AUTO_4221 ?AUTO_4223 ) ) ( not ( = ?AUTO_4222 ?AUTO_4223 ) ) ( ON ?AUTO_4222 ?AUTO_4221 ) ( CLEAR ?AUTO_4224 ) ( not ( = ?AUTO_4220 ?AUTO_4224 ) ) ( not ( = ?AUTO_4221 ?AUTO_4224 ) ) ( not ( = ?AUTO_4222 ?AUTO_4224 ) ) ( not ( = ?AUTO_4223 ?AUTO_4224 ) ) ( ON ?AUTO_4223 ?AUTO_4222 ) ( CLEAR ?AUTO_4223 ) ( HOLDING ?AUTO_4225 ) ( CLEAR ?AUTO_4226 ) ( not ( = ?AUTO_4220 ?AUTO_4225 ) ) ( not ( = ?AUTO_4220 ?AUTO_4226 ) ) ( not ( = ?AUTO_4221 ?AUTO_4225 ) ) ( not ( = ?AUTO_4221 ?AUTO_4226 ) ) ( not ( = ?AUTO_4222 ?AUTO_4225 ) ) ( not ( = ?AUTO_4222 ?AUTO_4226 ) ) ( not ( = ?AUTO_4223 ?AUTO_4225 ) ) ( not ( = ?AUTO_4223 ?AUTO_4226 ) ) ( not ( = ?AUTO_4224 ?AUTO_4225 ) ) ( not ( = ?AUTO_4224 ?AUTO_4226 ) ) ( not ( = ?AUTO_4225 ?AUTO_4226 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4225 ?AUTO_4226 )
      ( MAKE-ON ?AUTO_4220 ?AUTO_4221 )
      ( MAKE-ON-VERIFY ?AUTO_4220 ?AUTO_4221 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4229 - BLOCK
      ?AUTO_4230 - BLOCK
    )
    :vars
    (
      ?AUTO_4231 - BLOCK
      ?AUTO_4232 - BLOCK
      ?AUTO_4233 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4229 ?AUTO_4230 ) ) ( not ( = ?AUTO_4229 ?AUTO_4231 ) ) ( not ( = ?AUTO_4229 ?AUTO_4232 ) ) ( not ( = ?AUTO_4230 ?AUTO_4231 ) ) ( not ( = ?AUTO_4230 ?AUTO_4232 ) ) ( not ( = ?AUTO_4231 ?AUTO_4232 ) ) ( ON ?AUTO_4231 ?AUTO_4230 ) ( CLEAR ?AUTO_4233 ) ( not ( = ?AUTO_4229 ?AUTO_4233 ) ) ( not ( = ?AUTO_4230 ?AUTO_4233 ) ) ( not ( = ?AUTO_4231 ?AUTO_4233 ) ) ( not ( = ?AUTO_4232 ?AUTO_4233 ) ) ( ON ?AUTO_4232 ?AUTO_4231 ) ( CLEAR ?AUTO_4232 ) ( HOLDING ?AUTO_4229 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4229 )
      ( MAKE-ON ?AUTO_4229 ?AUTO_4230 )
      ( MAKE-ON-VERIFY ?AUTO_4229 ?AUTO_4230 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4238 - BLOCK
      ?AUTO_4239 - BLOCK
    )
    :vars
    (
      ?AUTO_4240 - BLOCK
      ?AUTO_4244 - BLOCK
      ?AUTO_4243 - BLOCK
      ?AUTO_4242 - BLOCK
      ?AUTO_4245 - BLOCK
      ?AUTO_4241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4238 ?AUTO_4239 ) ) ( ON ?AUTO_4238 ?AUTO_4240 ) ( CLEAR ?AUTO_4238 ) ( not ( = ?AUTO_4238 ?AUTO_4240 ) ) ( not ( = ?AUTO_4239 ?AUTO_4240 ) ) ( CLEAR ?AUTO_4244 ) ( not ( = ?AUTO_4238 ?AUTO_4243 ) ) ( not ( = ?AUTO_4238 ?AUTO_4244 ) ) ( not ( = ?AUTO_4239 ?AUTO_4243 ) ) ( not ( = ?AUTO_4239 ?AUTO_4244 ) ) ( not ( = ?AUTO_4240 ?AUTO_4243 ) ) ( not ( = ?AUTO_4240 ?AUTO_4244 ) ) ( not ( = ?AUTO_4243 ?AUTO_4244 ) ) ( ON ?AUTO_4243 ?AUTO_4239 ) ( not ( = ?AUTO_4238 ?AUTO_4242 ) ) ( not ( = ?AUTO_4239 ?AUTO_4242 ) ) ( not ( = ?AUTO_4240 ?AUTO_4242 ) ) ( not ( = ?AUTO_4244 ?AUTO_4242 ) ) ( not ( = ?AUTO_4243 ?AUTO_4242 ) ) ( ON ?AUTO_4242 ?AUTO_4243 ) ( CLEAR ?AUTO_4245 ) ( not ( = ?AUTO_4238 ?AUTO_4241 ) ) ( not ( = ?AUTO_4238 ?AUTO_4245 ) ) ( not ( = ?AUTO_4239 ?AUTO_4241 ) ) ( not ( = ?AUTO_4239 ?AUTO_4245 ) ) ( not ( = ?AUTO_4240 ?AUTO_4241 ) ) ( not ( = ?AUTO_4240 ?AUTO_4245 ) ) ( not ( = ?AUTO_4244 ?AUTO_4241 ) ) ( not ( = ?AUTO_4244 ?AUTO_4245 ) ) ( not ( = ?AUTO_4243 ?AUTO_4241 ) ) ( not ( = ?AUTO_4243 ?AUTO_4245 ) ) ( not ( = ?AUTO_4242 ?AUTO_4241 ) ) ( not ( = ?AUTO_4242 ?AUTO_4245 ) ) ( not ( = ?AUTO_4241 ?AUTO_4245 ) ) ( ON ?AUTO_4241 ?AUTO_4242 ) ( CLEAR ?AUTO_4241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4241 ?AUTO_4242 )
      ( MAKE-ON ?AUTO_4238 ?AUTO_4239 )
      ( MAKE-ON-VERIFY ?AUTO_4238 ?AUTO_4239 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4246 - BLOCK
      ?AUTO_4247 - BLOCK
    )
    :vars
    (
      ?AUTO_4252 - BLOCK
      ?AUTO_4248 - BLOCK
      ?AUTO_4249 - BLOCK
      ?AUTO_4250 - BLOCK
      ?AUTO_4253 - BLOCK
      ?AUTO_4251 - BLOCK
      ?AUTO_4254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4246 ?AUTO_4247 ) ) ( ON ?AUTO_4246 ?AUTO_4252 ) ( CLEAR ?AUTO_4246 ) ( not ( = ?AUTO_4246 ?AUTO_4252 ) ) ( not ( = ?AUTO_4247 ?AUTO_4252 ) ) ( CLEAR ?AUTO_4248 ) ( not ( = ?AUTO_4246 ?AUTO_4249 ) ) ( not ( = ?AUTO_4246 ?AUTO_4248 ) ) ( not ( = ?AUTO_4247 ?AUTO_4249 ) ) ( not ( = ?AUTO_4247 ?AUTO_4248 ) ) ( not ( = ?AUTO_4252 ?AUTO_4249 ) ) ( not ( = ?AUTO_4252 ?AUTO_4248 ) ) ( not ( = ?AUTO_4249 ?AUTO_4248 ) ) ( ON ?AUTO_4249 ?AUTO_4247 ) ( not ( = ?AUTO_4246 ?AUTO_4250 ) ) ( not ( = ?AUTO_4247 ?AUTO_4250 ) ) ( not ( = ?AUTO_4252 ?AUTO_4250 ) ) ( not ( = ?AUTO_4248 ?AUTO_4250 ) ) ( not ( = ?AUTO_4249 ?AUTO_4250 ) ) ( ON ?AUTO_4250 ?AUTO_4249 ) ( CLEAR ?AUTO_4253 ) ( not ( = ?AUTO_4246 ?AUTO_4251 ) ) ( not ( = ?AUTO_4246 ?AUTO_4253 ) ) ( not ( = ?AUTO_4247 ?AUTO_4251 ) ) ( not ( = ?AUTO_4247 ?AUTO_4253 ) ) ( not ( = ?AUTO_4252 ?AUTO_4251 ) ) ( not ( = ?AUTO_4252 ?AUTO_4253 ) ) ( not ( = ?AUTO_4248 ?AUTO_4251 ) ) ( not ( = ?AUTO_4248 ?AUTO_4253 ) ) ( not ( = ?AUTO_4249 ?AUTO_4251 ) ) ( not ( = ?AUTO_4249 ?AUTO_4253 ) ) ( not ( = ?AUTO_4250 ?AUTO_4251 ) ) ( not ( = ?AUTO_4250 ?AUTO_4253 ) ) ( not ( = ?AUTO_4251 ?AUTO_4253 ) ) ( ON ?AUTO_4251 ?AUTO_4250 ) ( CLEAR ?AUTO_4251 ) ( HOLDING ?AUTO_4254 ) ( not ( = ?AUTO_4246 ?AUTO_4254 ) ) ( not ( = ?AUTO_4247 ?AUTO_4254 ) ) ( not ( = ?AUTO_4252 ?AUTO_4254 ) ) ( not ( = ?AUTO_4248 ?AUTO_4254 ) ) ( not ( = ?AUTO_4249 ?AUTO_4254 ) ) ( not ( = ?AUTO_4250 ?AUTO_4254 ) ) ( not ( = ?AUTO_4253 ?AUTO_4254 ) ) ( not ( = ?AUTO_4251 ?AUTO_4254 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4254 )
      ( MAKE-ON ?AUTO_4246 ?AUTO_4247 )
      ( MAKE-ON-VERIFY ?AUTO_4246 ?AUTO_4247 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4257 - BLOCK
      ?AUTO_4258 - BLOCK
    )
    :vars
    (
      ?AUTO_4259 - BLOCK
      ?AUTO_4264 - BLOCK
      ?AUTO_4262 - BLOCK
      ?AUTO_4261 - BLOCK
      ?AUTO_4263 - BLOCK
      ?AUTO_4260 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4257 ?AUTO_4258 ) ) ( ON ?AUTO_4257 ?AUTO_4259 ) ( CLEAR ?AUTO_4257 ) ( not ( = ?AUTO_4257 ?AUTO_4259 ) ) ( not ( = ?AUTO_4258 ?AUTO_4259 ) ) ( not ( = ?AUTO_4257 ?AUTO_4264 ) ) ( not ( = ?AUTO_4257 ?AUTO_4262 ) ) ( not ( = ?AUTO_4258 ?AUTO_4264 ) ) ( not ( = ?AUTO_4258 ?AUTO_4262 ) ) ( not ( = ?AUTO_4259 ?AUTO_4264 ) ) ( not ( = ?AUTO_4259 ?AUTO_4262 ) ) ( not ( = ?AUTO_4264 ?AUTO_4262 ) ) ( ON ?AUTO_4264 ?AUTO_4258 ) ( not ( = ?AUTO_4257 ?AUTO_4261 ) ) ( not ( = ?AUTO_4258 ?AUTO_4261 ) ) ( not ( = ?AUTO_4259 ?AUTO_4261 ) ) ( not ( = ?AUTO_4262 ?AUTO_4261 ) ) ( not ( = ?AUTO_4264 ?AUTO_4261 ) ) ( ON ?AUTO_4261 ?AUTO_4264 ) ( CLEAR ?AUTO_4263 ) ( not ( = ?AUTO_4257 ?AUTO_4260 ) ) ( not ( = ?AUTO_4257 ?AUTO_4263 ) ) ( not ( = ?AUTO_4258 ?AUTO_4260 ) ) ( not ( = ?AUTO_4258 ?AUTO_4263 ) ) ( not ( = ?AUTO_4259 ?AUTO_4260 ) ) ( not ( = ?AUTO_4259 ?AUTO_4263 ) ) ( not ( = ?AUTO_4262 ?AUTO_4260 ) ) ( not ( = ?AUTO_4262 ?AUTO_4263 ) ) ( not ( = ?AUTO_4264 ?AUTO_4260 ) ) ( not ( = ?AUTO_4264 ?AUTO_4263 ) ) ( not ( = ?AUTO_4261 ?AUTO_4260 ) ) ( not ( = ?AUTO_4261 ?AUTO_4263 ) ) ( not ( = ?AUTO_4260 ?AUTO_4263 ) ) ( ON ?AUTO_4260 ?AUTO_4261 ) ( CLEAR ?AUTO_4260 ) ( HOLDING ?AUTO_4262 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4262 )
      ( MAKE-ON ?AUTO_4257 ?AUTO_4258 )
      ( MAKE-ON-VERIFY ?AUTO_4257 ?AUTO_4258 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4269 - BLOCK
      ?AUTO_4270 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4269 ) ( CLEAR ?AUTO_4270 ) ( not ( = ?AUTO_4269 ?AUTO_4270 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4269 ?AUTO_4270 )
      ( MAKE-ON-VERIFY ?AUTO_4269 ?AUTO_4270 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4271 - BLOCK
      ?AUTO_4272 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4272 ) ( not ( = ?AUTO_4271 ?AUTO_4272 ) ) ( ON-TABLE ?AUTO_4271 ) ( CLEAR ?AUTO_4271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4271 )
      ( MAKE-ON ?AUTO_4271 ?AUTO_4272 )
      ( MAKE-ON-VERIFY ?AUTO_4271 ?AUTO_4272 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4273 - BLOCK
      ?AUTO_4274 - BLOCK
    )
    :vars
    (
      ?AUTO_4275 - BLOCK
      ?AUTO_4276 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4274 ) ( not ( = ?AUTO_4273 ?AUTO_4274 ) ) ( ON-TABLE ?AUTO_4273 ) ( CLEAR ?AUTO_4273 ) ( HOLDING ?AUTO_4275 ) ( CLEAR ?AUTO_4276 ) ( not ( = ?AUTO_4273 ?AUTO_4275 ) ) ( not ( = ?AUTO_4273 ?AUTO_4276 ) ) ( not ( = ?AUTO_4274 ?AUTO_4275 ) ) ( not ( = ?AUTO_4274 ?AUTO_4276 ) ) ( not ( = ?AUTO_4275 ?AUTO_4276 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4275 ?AUTO_4276 )
      ( MAKE-ON ?AUTO_4273 ?AUTO_4274 )
      ( MAKE-ON-VERIFY ?AUTO_4273 ?AUTO_4274 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4287 - BLOCK
      ?AUTO_4288 - BLOCK
    )
    :vars
    (
      ?AUTO_4289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4287 ?AUTO_4288 ) ) ( ON-TABLE ?AUTO_4287 ) ( CLEAR ?AUTO_4287 ) ( HOLDING ?AUTO_4288 ) ( CLEAR ?AUTO_4289 ) ( not ( = ?AUTO_4287 ?AUTO_4289 ) ) ( not ( = ?AUTO_4288 ?AUTO_4289 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4288 ?AUTO_4289 )
      ( MAKE-ON ?AUTO_4287 ?AUTO_4288 )
      ( MAKE-ON-VERIFY ?AUTO_4287 ?AUTO_4288 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4302 - BLOCK
      ?AUTO_4303 - BLOCK
    )
    :vars
    (
      ?AUTO_4306 - BLOCK
      ?AUTO_4305 - BLOCK
      ?AUTO_4304 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4302 ?AUTO_4303 ) ) ( ON-TABLE ?AUTO_4302 ) ( not ( = ?AUTO_4302 ?AUTO_4306 ) ) ( not ( = ?AUTO_4302 ?AUTO_4305 ) ) ( not ( = ?AUTO_4303 ?AUTO_4306 ) ) ( not ( = ?AUTO_4303 ?AUTO_4305 ) ) ( not ( = ?AUTO_4306 ?AUTO_4305 ) ) ( ON ?AUTO_4306 ?AUTO_4303 ) ( CLEAR ?AUTO_4306 ) ( CLEAR ?AUTO_4304 ) ( not ( = ?AUTO_4302 ?AUTO_4304 ) ) ( not ( = ?AUTO_4303 ?AUTO_4304 ) ) ( not ( = ?AUTO_4306 ?AUTO_4304 ) ) ( not ( = ?AUTO_4305 ?AUTO_4304 ) ) ( ON ?AUTO_4305 ?AUTO_4302 ) ( CLEAR ?AUTO_4305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4305 ?AUTO_4302 )
      ( MAKE-ON ?AUTO_4302 ?AUTO_4303 )
      ( MAKE-ON-VERIFY ?AUTO_4302 ?AUTO_4303 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4307 - BLOCK
      ?AUTO_4308 - BLOCK
    )
    :vars
    (
      ?AUTO_4311 - BLOCK
      ?AUTO_4309 - BLOCK
      ?AUTO_4310 - BLOCK
      ?AUTO_4312 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4307 ?AUTO_4308 ) ) ( ON-TABLE ?AUTO_4307 ) ( not ( = ?AUTO_4307 ?AUTO_4311 ) ) ( not ( = ?AUTO_4307 ?AUTO_4309 ) ) ( not ( = ?AUTO_4308 ?AUTO_4311 ) ) ( not ( = ?AUTO_4308 ?AUTO_4309 ) ) ( not ( = ?AUTO_4311 ?AUTO_4309 ) ) ( ON ?AUTO_4311 ?AUTO_4308 ) ( CLEAR ?AUTO_4311 ) ( CLEAR ?AUTO_4310 ) ( not ( = ?AUTO_4307 ?AUTO_4310 ) ) ( not ( = ?AUTO_4308 ?AUTO_4310 ) ) ( not ( = ?AUTO_4311 ?AUTO_4310 ) ) ( not ( = ?AUTO_4309 ?AUTO_4310 ) ) ( ON ?AUTO_4309 ?AUTO_4307 ) ( CLEAR ?AUTO_4309 ) ( HOLDING ?AUTO_4312 ) ( not ( = ?AUTO_4307 ?AUTO_4312 ) ) ( not ( = ?AUTO_4308 ?AUTO_4312 ) ) ( not ( = ?AUTO_4311 ?AUTO_4312 ) ) ( not ( = ?AUTO_4309 ?AUTO_4312 ) ) ( not ( = ?AUTO_4310 ?AUTO_4312 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4312 )
      ( MAKE-ON ?AUTO_4307 ?AUTO_4308 )
      ( MAKE-ON-VERIFY ?AUTO_4307 ?AUTO_4308 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4313 - BLOCK
      ?AUTO_4314 - BLOCK
    )
    :vars
    (
      ?AUTO_4316 - BLOCK
      ?AUTO_4318 - BLOCK
      ?AUTO_4315 - BLOCK
      ?AUTO_4317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4313 ?AUTO_4314 ) ) ( ON-TABLE ?AUTO_4313 ) ( not ( = ?AUTO_4313 ?AUTO_4316 ) ) ( not ( = ?AUTO_4313 ?AUTO_4318 ) ) ( not ( = ?AUTO_4314 ?AUTO_4316 ) ) ( not ( = ?AUTO_4314 ?AUTO_4318 ) ) ( not ( = ?AUTO_4316 ?AUTO_4318 ) ) ( ON ?AUTO_4316 ?AUTO_4314 ) ( CLEAR ?AUTO_4315 ) ( not ( = ?AUTO_4313 ?AUTO_4315 ) ) ( not ( = ?AUTO_4314 ?AUTO_4315 ) ) ( not ( = ?AUTO_4316 ?AUTO_4315 ) ) ( not ( = ?AUTO_4318 ?AUTO_4315 ) ) ( ON ?AUTO_4318 ?AUTO_4313 ) ( CLEAR ?AUTO_4318 ) ( not ( = ?AUTO_4313 ?AUTO_4317 ) ) ( not ( = ?AUTO_4314 ?AUTO_4317 ) ) ( not ( = ?AUTO_4316 ?AUTO_4317 ) ) ( not ( = ?AUTO_4318 ?AUTO_4317 ) ) ( not ( = ?AUTO_4315 ?AUTO_4317 ) ) ( ON ?AUTO_4317 ?AUTO_4316 ) ( CLEAR ?AUTO_4317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4317 ?AUTO_4316 )
      ( MAKE-ON ?AUTO_4313 ?AUTO_4314 )
      ( MAKE-ON-VERIFY ?AUTO_4313 ?AUTO_4314 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4320 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4320 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4320 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4320 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4321 - BLOCK
    )
    :vars
    (
      ?AUTO_4322 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4321 ?AUTO_4322 ) ( CLEAR ?AUTO_4321 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4321 ?AUTO_4322 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4321 ?AUTO_4322 )
      ( MAKE-ON-TABLE ?AUTO_4321 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4321 ) )
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
    )
    :precondition
    ( and ( not ( = ?AUTO_4330 ?AUTO_4331 ) ) ( ON ?AUTO_4330 ?AUTO_4332 ) ( CLEAR ?AUTO_4330 ) ( not ( = ?AUTO_4330 ?AUTO_4332 ) ) ( not ( = ?AUTO_4331 ?AUTO_4332 ) ) ( HOLDING ?AUTO_4331 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4331 )
      ( MAKE-ON ?AUTO_4330 ?AUTO_4331 )
      ( MAKE-ON-VERIFY ?AUTO_4330 ?AUTO_4331 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4336 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4336 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4336 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4336 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4337 - BLOCK
    )
    :vars
    (
      ?AUTO_4338 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4337 ?AUTO_4338 ) ( CLEAR ?AUTO_4337 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4337 ?AUTO_4338 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4337 ?AUTO_4338 )
      ( MAKE-ON-TABLE ?AUTO_4337 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4337 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4339 - BLOCK
    )
    :vars
    (
      ?AUTO_4340 - BLOCK
      ?AUTO_4341 - BLOCK
      ?AUTO_4342 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4339 ?AUTO_4340 ) ( CLEAR ?AUTO_4339 ) ( not ( = ?AUTO_4339 ?AUTO_4340 ) ) ( HOLDING ?AUTO_4341 ) ( CLEAR ?AUTO_4342 ) ( not ( = ?AUTO_4339 ?AUTO_4341 ) ) ( not ( = ?AUTO_4339 ?AUTO_4342 ) ) ( not ( = ?AUTO_4340 ?AUTO_4341 ) ) ( not ( = ?AUTO_4340 ?AUTO_4342 ) ) ( not ( = ?AUTO_4341 ?AUTO_4342 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4341 ?AUTO_4342 )
      ( MAKE-ON-TABLE ?AUTO_4339 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4339 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4345 - BLOCK
    )
    :vars
    (
      ?AUTO_4348 - BLOCK
      ?AUTO_4346 - BLOCK
      ?AUTO_4347 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4345 ?AUTO_4348 ) ( not ( = ?AUTO_4345 ?AUTO_4348 ) ) ( CLEAR ?AUTO_4346 ) ( not ( = ?AUTO_4345 ?AUTO_4347 ) ) ( not ( = ?AUTO_4345 ?AUTO_4346 ) ) ( not ( = ?AUTO_4348 ?AUTO_4347 ) ) ( not ( = ?AUTO_4348 ?AUTO_4346 ) ) ( not ( = ?AUTO_4347 ?AUTO_4346 ) ) ( ON ?AUTO_4347 ?AUTO_4345 ) ( CLEAR ?AUTO_4347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4347 ?AUTO_4345 )
      ( MAKE-ON-TABLE ?AUTO_4345 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4345 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4351 - BLOCK
      ?AUTO_4352 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4351 ) ( CLEAR ?AUTO_4352 ) ( not ( = ?AUTO_4351 ?AUTO_4352 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4351 ?AUTO_4352 )
      ( MAKE-ON-VERIFY ?AUTO_4351 ?AUTO_4352 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4353 - BLOCK
      ?AUTO_4354 - BLOCK
    )
    :vars
    (
      ?AUTO_4355 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4354 ) ( not ( = ?AUTO_4353 ?AUTO_4354 ) ) ( ON ?AUTO_4353 ?AUTO_4355 ) ( CLEAR ?AUTO_4353 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4353 ?AUTO_4355 ) ) ( not ( = ?AUTO_4354 ?AUTO_4355 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4353 ?AUTO_4355 )
      ( MAKE-ON ?AUTO_4353 ?AUTO_4354 )
      ( MAKE-ON-VERIFY ?AUTO_4353 ?AUTO_4354 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4356 - BLOCK
      ?AUTO_4357 - BLOCK
    )
    :vars
    (
      ?AUTO_4358 - BLOCK
      ?AUTO_4359 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4357 ) ( not ( = ?AUTO_4356 ?AUTO_4357 ) ) ( ON ?AUTO_4356 ?AUTO_4358 ) ( CLEAR ?AUTO_4356 ) ( not ( = ?AUTO_4356 ?AUTO_4358 ) ) ( not ( = ?AUTO_4357 ?AUTO_4358 ) ) ( HOLDING ?AUTO_4359 ) ( not ( = ?AUTO_4356 ?AUTO_4359 ) ) ( not ( = ?AUTO_4357 ?AUTO_4359 ) ) ( not ( = ?AUTO_4358 ?AUTO_4359 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4359 )
      ( MAKE-ON ?AUTO_4356 ?AUTO_4357 )
      ( MAKE-ON-VERIFY ?AUTO_4356 ?AUTO_4357 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4360 - BLOCK
      ?AUTO_4361 - BLOCK
    )
    :vars
    (
      ?AUTO_4362 - BLOCK
      ?AUTO_4363 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4361 ) ( not ( = ?AUTO_4360 ?AUTO_4361 ) ) ( ON ?AUTO_4360 ?AUTO_4362 ) ( not ( = ?AUTO_4360 ?AUTO_4362 ) ) ( not ( = ?AUTO_4361 ?AUTO_4362 ) ) ( not ( = ?AUTO_4360 ?AUTO_4363 ) ) ( not ( = ?AUTO_4361 ?AUTO_4363 ) ) ( not ( = ?AUTO_4362 ?AUTO_4363 ) ) ( ON ?AUTO_4363 ?AUTO_4360 ) ( CLEAR ?AUTO_4363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4363 ?AUTO_4360 )
      ( MAKE-ON ?AUTO_4360 ?AUTO_4361 )
      ( MAKE-ON-VERIFY ?AUTO_4360 ?AUTO_4361 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4364 - BLOCK
      ?AUTO_4365 - BLOCK
    )
    :vars
    (
      ?AUTO_4366 - BLOCK
      ?AUTO_4367 - BLOCK
      ?AUTO_4368 - BLOCK
      ?AUTO_4369 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4365 ) ( not ( = ?AUTO_4364 ?AUTO_4365 ) ) ( ON ?AUTO_4364 ?AUTO_4366 ) ( not ( = ?AUTO_4364 ?AUTO_4366 ) ) ( not ( = ?AUTO_4365 ?AUTO_4366 ) ) ( not ( = ?AUTO_4364 ?AUTO_4367 ) ) ( not ( = ?AUTO_4365 ?AUTO_4367 ) ) ( not ( = ?AUTO_4366 ?AUTO_4367 ) ) ( ON ?AUTO_4367 ?AUTO_4364 ) ( CLEAR ?AUTO_4367 ) ( HOLDING ?AUTO_4368 ) ( CLEAR ?AUTO_4369 ) ( not ( = ?AUTO_4364 ?AUTO_4368 ) ) ( not ( = ?AUTO_4364 ?AUTO_4369 ) ) ( not ( = ?AUTO_4365 ?AUTO_4368 ) ) ( not ( = ?AUTO_4365 ?AUTO_4369 ) ) ( not ( = ?AUTO_4366 ?AUTO_4368 ) ) ( not ( = ?AUTO_4366 ?AUTO_4369 ) ) ( not ( = ?AUTO_4367 ?AUTO_4368 ) ) ( not ( = ?AUTO_4367 ?AUTO_4369 ) ) ( not ( = ?AUTO_4368 ?AUTO_4369 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4368 ?AUTO_4369 )
      ( MAKE-ON ?AUTO_4364 ?AUTO_4365 )
      ( MAKE-ON-VERIFY ?AUTO_4364 ?AUTO_4365 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4370 - BLOCK
      ?AUTO_4371 - BLOCK
    )
    :vars
    (
      ?AUTO_4372 - BLOCK
      ?AUTO_4373 - BLOCK
      ?AUTO_4375 - BLOCK
      ?AUTO_4374 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4370 ?AUTO_4371 ) ) ( ON ?AUTO_4370 ?AUTO_4372 ) ( not ( = ?AUTO_4370 ?AUTO_4372 ) ) ( not ( = ?AUTO_4371 ?AUTO_4372 ) ) ( not ( = ?AUTO_4370 ?AUTO_4373 ) ) ( not ( = ?AUTO_4371 ?AUTO_4373 ) ) ( not ( = ?AUTO_4372 ?AUTO_4373 ) ) ( ON ?AUTO_4373 ?AUTO_4370 ) ( CLEAR ?AUTO_4373 ) ( CLEAR ?AUTO_4375 ) ( not ( = ?AUTO_4370 ?AUTO_4374 ) ) ( not ( = ?AUTO_4370 ?AUTO_4375 ) ) ( not ( = ?AUTO_4371 ?AUTO_4374 ) ) ( not ( = ?AUTO_4371 ?AUTO_4375 ) ) ( not ( = ?AUTO_4372 ?AUTO_4374 ) ) ( not ( = ?AUTO_4372 ?AUTO_4375 ) ) ( not ( = ?AUTO_4373 ?AUTO_4374 ) ) ( not ( = ?AUTO_4373 ?AUTO_4375 ) ) ( not ( = ?AUTO_4374 ?AUTO_4375 ) ) ( ON ?AUTO_4374 ?AUTO_4371 ) ( CLEAR ?AUTO_4374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4374 ?AUTO_4371 )
      ( MAKE-ON ?AUTO_4370 ?AUTO_4371 )
      ( MAKE-ON-VERIFY ?AUTO_4370 ?AUTO_4371 ) )
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
      ?AUTO_4381 - BLOCK
      ?AUTO_4380 - BLOCK
      ?AUTO_4379 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4376 ?AUTO_4377 ) ) ( ON ?AUTO_4376 ?AUTO_4378 ) ( not ( = ?AUTO_4376 ?AUTO_4378 ) ) ( not ( = ?AUTO_4377 ?AUTO_4378 ) ) ( not ( = ?AUTO_4376 ?AUTO_4381 ) ) ( not ( = ?AUTO_4377 ?AUTO_4381 ) ) ( not ( = ?AUTO_4378 ?AUTO_4381 ) ) ( ON ?AUTO_4381 ?AUTO_4376 ) ( CLEAR ?AUTO_4381 ) ( not ( = ?AUTO_4376 ?AUTO_4380 ) ) ( not ( = ?AUTO_4376 ?AUTO_4379 ) ) ( not ( = ?AUTO_4377 ?AUTO_4380 ) ) ( not ( = ?AUTO_4377 ?AUTO_4379 ) ) ( not ( = ?AUTO_4378 ?AUTO_4380 ) ) ( not ( = ?AUTO_4378 ?AUTO_4379 ) ) ( not ( = ?AUTO_4381 ?AUTO_4380 ) ) ( not ( = ?AUTO_4381 ?AUTO_4379 ) ) ( not ( = ?AUTO_4380 ?AUTO_4379 ) ) ( ON ?AUTO_4380 ?AUTO_4377 ) ( CLEAR ?AUTO_4380 ) ( HOLDING ?AUTO_4379 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4379 )
      ( MAKE-ON ?AUTO_4376 ?AUTO_4377 )
      ( MAKE-ON-VERIFY ?AUTO_4376 ?AUTO_4377 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4382 - BLOCK
      ?AUTO_4383 - BLOCK
    )
    :vars
    (
      ?AUTO_4386 - BLOCK
      ?AUTO_4385 - BLOCK
      ?AUTO_4387 - BLOCK
      ?AUTO_4384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4382 ?AUTO_4383 ) ) ( ON ?AUTO_4382 ?AUTO_4386 ) ( not ( = ?AUTO_4382 ?AUTO_4386 ) ) ( not ( = ?AUTO_4383 ?AUTO_4386 ) ) ( not ( = ?AUTO_4382 ?AUTO_4385 ) ) ( not ( = ?AUTO_4383 ?AUTO_4385 ) ) ( not ( = ?AUTO_4386 ?AUTO_4385 ) ) ( ON ?AUTO_4385 ?AUTO_4382 ) ( not ( = ?AUTO_4382 ?AUTO_4387 ) ) ( not ( = ?AUTO_4382 ?AUTO_4384 ) ) ( not ( = ?AUTO_4383 ?AUTO_4387 ) ) ( not ( = ?AUTO_4383 ?AUTO_4384 ) ) ( not ( = ?AUTO_4386 ?AUTO_4387 ) ) ( not ( = ?AUTO_4386 ?AUTO_4384 ) ) ( not ( = ?AUTO_4385 ?AUTO_4387 ) ) ( not ( = ?AUTO_4385 ?AUTO_4384 ) ) ( not ( = ?AUTO_4387 ?AUTO_4384 ) ) ( ON ?AUTO_4387 ?AUTO_4383 ) ( CLEAR ?AUTO_4387 ) ( ON ?AUTO_4384 ?AUTO_4385 ) ( CLEAR ?AUTO_4384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4384 ?AUTO_4385 )
      ( MAKE-ON ?AUTO_4382 ?AUTO_4383 )
      ( MAKE-ON-VERIFY ?AUTO_4382 ?AUTO_4383 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4390 - BLOCK
      ?AUTO_4391 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4390 ) ( CLEAR ?AUTO_4391 ) ( not ( = ?AUTO_4390 ?AUTO_4391 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4390 ?AUTO_4391 )
      ( MAKE-ON-VERIFY ?AUTO_4390 ?AUTO_4391 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4392 - BLOCK
      ?AUTO_4393 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4393 ) ( not ( = ?AUTO_4392 ?AUTO_4393 ) ) ( ON-TABLE ?AUTO_4392 ) ( CLEAR ?AUTO_4392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4392 )
      ( MAKE-ON ?AUTO_4392 ?AUTO_4393 )
      ( MAKE-ON-VERIFY ?AUTO_4392 ?AUTO_4393 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4394 - BLOCK
      ?AUTO_4395 - BLOCK
    )
    :vars
    (
      ?AUTO_4396 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4394 ?AUTO_4395 ) ) ( ON-TABLE ?AUTO_4394 ) ( CLEAR ?AUTO_4394 ) ( HOLDING ?AUTO_4395 ) ( CLEAR ?AUTO_4396 ) ( not ( = ?AUTO_4394 ?AUTO_4396 ) ) ( not ( = ?AUTO_4395 ?AUTO_4396 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4395 ?AUTO_4396 )
      ( MAKE-ON ?AUTO_4394 ?AUTO_4395 )
      ( MAKE-ON-VERIFY ?AUTO_4394 ?AUTO_4395 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4397 - BLOCK
      ?AUTO_4398 - BLOCK
    )
    :vars
    (
      ?AUTO_4399 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4397 ?AUTO_4398 ) ) ( ON-TABLE ?AUTO_4397 ) ( CLEAR ?AUTO_4399 ) ( not ( = ?AUTO_4397 ?AUTO_4399 ) ) ( not ( = ?AUTO_4398 ?AUTO_4399 ) ) ( ON ?AUTO_4398 ?AUTO_4397 ) ( CLEAR ?AUTO_4398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4398 ?AUTO_4397 )
      ( MAKE-ON ?AUTO_4397 ?AUTO_4398 )
      ( MAKE-ON-VERIFY ?AUTO_4397 ?AUTO_4398 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4400 - BLOCK
      ?AUTO_4401 - BLOCK
    )
    :vars
    (
      ?AUTO_4402 - BLOCK
      ?AUTO_4403 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4400 ?AUTO_4401 ) ) ( ON-TABLE ?AUTO_4400 ) ( CLEAR ?AUTO_4402 ) ( not ( = ?AUTO_4400 ?AUTO_4402 ) ) ( not ( = ?AUTO_4401 ?AUTO_4402 ) ) ( ON ?AUTO_4401 ?AUTO_4400 ) ( CLEAR ?AUTO_4401 ) ( HOLDING ?AUTO_4403 ) ( not ( = ?AUTO_4400 ?AUTO_4403 ) ) ( not ( = ?AUTO_4401 ?AUTO_4403 ) ) ( not ( = ?AUTO_4402 ?AUTO_4403 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4403 )
      ( MAKE-ON ?AUTO_4400 ?AUTO_4401 )
      ( MAKE-ON-VERIFY ?AUTO_4400 ?AUTO_4401 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4404 - BLOCK
      ?AUTO_4405 - BLOCK
    )
    :vars
    (
      ?AUTO_4406 - BLOCK
      ?AUTO_4407 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4404 ?AUTO_4405 ) ) ( ON-TABLE ?AUTO_4404 ) ( CLEAR ?AUTO_4406 ) ( not ( = ?AUTO_4404 ?AUTO_4406 ) ) ( not ( = ?AUTO_4405 ?AUTO_4406 ) ) ( ON ?AUTO_4405 ?AUTO_4404 ) ( not ( = ?AUTO_4404 ?AUTO_4407 ) ) ( not ( = ?AUTO_4405 ?AUTO_4407 ) ) ( not ( = ?AUTO_4406 ?AUTO_4407 ) ) ( ON ?AUTO_4407 ?AUTO_4405 ) ( CLEAR ?AUTO_4407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4407 ?AUTO_4405 )
      ( MAKE-ON ?AUTO_4404 ?AUTO_4405 )
      ( MAKE-ON-VERIFY ?AUTO_4404 ?AUTO_4405 ) )
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
      ?AUTO_4411 - BLOCK
      ?AUTO_4412 - BLOCK
      ?AUTO_4413 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4408 ?AUTO_4409 ) ) ( ON-TABLE ?AUTO_4408 ) ( CLEAR ?AUTO_4410 ) ( not ( = ?AUTO_4408 ?AUTO_4410 ) ) ( not ( = ?AUTO_4409 ?AUTO_4410 ) ) ( ON ?AUTO_4409 ?AUTO_4408 ) ( not ( = ?AUTO_4408 ?AUTO_4411 ) ) ( not ( = ?AUTO_4409 ?AUTO_4411 ) ) ( not ( = ?AUTO_4410 ?AUTO_4411 ) ) ( ON ?AUTO_4411 ?AUTO_4409 ) ( CLEAR ?AUTO_4411 ) ( HOLDING ?AUTO_4412 ) ( CLEAR ?AUTO_4413 ) ( not ( = ?AUTO_4408 ?AUTO_4412 ) ) ( not ( = ?AUTO_4408 ?AUTO_4413 ) ) ( not ( = ?AUTO_4409 ?AUTO_4412 ) ) ( not ( = ?AUTO_4409 ?AUTO_4413 ) ) ( not ( = ?AUTO_4410 ?AUTO_4412 ) ) ( not ( = ?AUTO_4410 ?AUTO_4413 ) ) ( not ( = ?AUTO_4411 ?AUTO_4412 ) ) ( not ( = ?AUTO_4411 ?AUTO_4413 ) ) ( not ( = ?AUTO_4412 ?AUTO_4413 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4412 ?AUTO_4413 )
      ( MAKE-ON ?AUTO_4408 ?AUTO_4409 )
      ( MAKE-ON-VERIFY ?AUTO_4408 ?AUTO_4409 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4416 - BLOCK
      ?AUTO_4417 - BLOCK
    )
    :vars
    (
      ?AUTO_4418 - BLOCK
      ?AUTO_4419 - BLOCK
      ?AUTO_4420 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4416 ?AUTO_4417 ) ) ( ON-TABLE ?AUTO_4416 ) ( CLEAR ?AUTO_4418 ) ( not ( = ?AUTO_4416 ?AUTO_4418 ) ) ( not ( = ?AUTO_4417 ?AUTO_4418 ) ) ( ON ?AUTO_4417 ?AUTO_4416 ) ( not ( = ?AUTO_4416 ?AUTO_4419 ) ) ( not ( = ?AUTO_4417 ?AUTO_4419 ) ) ( not ( = ?AUTO_4418 ?AUTO_4419 ) ) ( ON ?AUTO_4419 ?AUTO_4417 ) ( CLEAR ?AUTO_4419 ) ( HOLDING ?AUTO_4420 ) ( not ( = ?AUTO_4416 ?AUTO_4420 ) ) ( not ( = ?AUTO_4417 ?AUTO_4420 ) ) ( not ( = ?AUTO_4418 ?AUTO_4420 ) ) ( not ( = ?AUTO_4419 ?AUTO_4420 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4420 )
      ( MAKE-ON ?AUTO_4416 ?AUTO_4417 )
      ( MAKE-ON-VERIFY ?AUTO_4416 ?AUTO_4417 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4421 - BLOCK
      ?AUTO_4422 - BLOCK
    )
    :vars
    (
      ?AUTO_4424 - BLOCK
      ?AUTO_4423 - BLOCK
      ?AUTO_4425 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4421 ?AUTO_4422 ) ) ( ON-TABLE ?AUTO_4421 ) ( CLEAR ?AUTO_4424 ) ( not ( = ?AUTO_4421 ?AUTO_4424 ) ) ( not ( = ?AUTO_4422 ?AUTO_4424 ) ) ( ON ?AUTO_4422 ?AUTO_4421 ) ( not ( = ?AUTO_4421 ?AUTO_4423 ) ) ( not ( = ?AUTO_4422 ?AUTO_4423 ) ) ( not ( = ?AUTO_4424 ?AUTO_4423 ) ) ( ON ?AUTO_4423 ?AUTO_4422 ) ( not ( = ?AUTO_4421 ?AUTO_4425 ) ) ( not ( = ?AUTO_4422 ?AUTO_4425 ) ) ( not ( = ?AUTO_4424 ?AUTO_4425 ) ) ( not ( = ?AUTO_4423 ?AUTO_4425 ) ) ( ON ?AUTO_4425 ?AUTO_4423 ) ( CLEAR ?AUTO_4425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4425 ?AUTO_4423 )
      ( MAKE-ON ?AUTO_4421 ?AUTO_4422 )
      ( MAKE-ON-VERIFY ?AUTO_4421 ?AUTO_4422 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4428 - BLOCK
      ?AUTO_4429 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4428 ) ( CLEAR ?AUTO_4429 ) ( not ( = ?AUTO_4428 ?AUTO_4429 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4428 ?AUTO_4429 )
      ( MAKE-ON-VERIFY ?AUTO_4428 ?AUTO_4429 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4430 - BLOCK
      ?AUTO_4431 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4431 ) ( not ( = ?AUTO_4430 ?AUTO_4431 ) ) ( ON-TABLE ?AUTO_4430 ) ( CLEAR ?AUTO_4430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4430 )
      ( MAKE-ON ?AUTO_4430 ?AUTO_4431 )
      ( MAKE-ON-VERIFY ?AUTO_4430 ?AUTO_4431 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4432 - BLOCK
      ?AUTO_4433 - BLOCK
    )
    :vars
    (
      ?AUTO_4434 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4432 ?AUTO_4433 ) ) ( ON-TABLE ?AUTO_4432 ) ( CLEAR ?AUTO_4432 ) ( HOLDING ?AUTO_4433 ) ( CLEAR ?AUTO_4434 ) ( not ( = ?AUTO_4432 ?AUTO_4434 ) ) ( not ( = ?AUTO_4433 ?AUTO_4434 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4433 ?AUTO_4434 )
      ( MAKE-ON ?AUTO_4432 ?AUTO_4433 )
      ( MAKE-ON-VERIFY ?AUTO_4432 ?AUTO_4433 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4437 - BLOCK
      ?AUTO_4438 - BLOCK
    )
    :vars
    (
      ?AUTO_4439 - BLOCK
      ?AUTO_4440 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4438 ) ( not ( = ?AUTO_4437 ?AUTO_4438 ) ) ( ON-TABLE ?AUTO_4437 ) ( CLEAR ?AUTO_4437 ) ( HOLDING ?AUTO_4439 ) ( CLEAR ?AUTO_4440 ) ( not ( = ?AUTO_4437 ?AUTO_4439 ) ) ( not ( = ?AUTO_4437 ?AUTO_4440 ) ) ( not ( = ?AUTO_4438 ?AUTO_4439 ) ) ( not ( = ?AUTO_4438 ?AUTO_4440 ) ) ( not ( = ?AUTO_4439 ?AUTO_4440 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4439 ?AUTO_4440 )
      ( MAKE-ON ?AUTO_4437 ?AUTO_4438 )
      ( MAKE-ON-VERIFY ?AUTO_4437 ?AUTO_4438 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4441 - BLOCK
      ?AUTO_4442 - BLOCK
    )
    :vars
    (
      ?AUTO_4443 - BLOCK
      ?AUTO_4444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4441 ?AUTO_4442 ) ) ( ON-TABLE ?AUTO_4441 ) ( CLEAR ?AUTO_4441 ) ( CLEAR ?AUTO_4443 ) ( not ( = ?AUTO_4441 ?AUTO_4444 ) ) ( not ( = ?AUTO_4441 ?AUTO_4443 ) ) ( not ( = ?AUTO_4442 ?AUTO_4444 ) ) ( not ( = ?AUTO_4442 ?AUTO_4443 ) ) ( not ( = ?AUTO_4444 ?AUTO_4443 ) ) ( ON ?AUTO_4444 ?AUTO_4442 ) ( CLEAR ?AUTO_4444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4444 ?AUTO_4442 )
      ( MAKE-ON ?AUTO_4441 ?AUTO_4442 )
      ( MAKE-ON-VERIFY ?AUTO_4441 ?AUTO_4442 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4445 - BLOCK
      ?AUTO_4446 - BLOCK
    )
    :vars
    (
      ?AUTO_4448 - BLOCK
      ?AUTO_4447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4445 ?AUTO_4446 ) ) ( CLEAR ?AUTO_4448 ) ( not ( = ?AUTO_4445 ?AUTO_4447 ) ) ( not ( = ?AUTO_4445 ?AUTO_4448 ) ) ( not ( = ?AUTO_4446 ?AUTO_4447 ) ) ( not ( = ?AUTO_4446 ?AUTO_4448 ) ) ( not ( = ?AUTO_4447 ?AUTO_4448 ) ) ( ON ?AUTO_4447 ?AUTO_4446 ) ( CLEAR ?AUTO_4447 ) ( HOLDING ?AUTO_4445 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4445 )
      ( MAKE-ON ?AUTO_4445 ?AUTO_4446 )
      ( MAKE-ON-VERIFY ?AUTO_4445 ?AUTO_4446 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4449 - BLOCK
      ?AUTO_4450 - BLOCK
    )
    :vars
    (
      ?AUTO_4451 - BLOCK
      ?AUTO_4452 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4449 ?AUTO_4450 ) ) ( CLEAR ?AUTO_4451 ) ( not ( = ?AUTO_4449 ?AUTO_4452 ) ) ( not ( = ?AUTO_4449 ?AUTO_4451 ) ) ( not ( = ?AUTO_4450 ?AUTO_4452 ) ) ( not ( = ?AUTO_4450 ?AUTO_4451 ) ) ( not ( = ?AUTO_4452 ?AUTO_4451 ) ) ( ON ?AUTO_4452 ?AUTO_4450 ) ( ON ?AUTO_4449 ?AUTO_4452 ) ( CLEAR ?AUTO_4449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4449 ?AUTO_4452 )
      ( MAKE-ON ?AUTO_4449 ?AUTO_4450 )
      ( MAKE-ON-VERIFY ?AUTO_4449 ?AUTO_4450 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4453 - BLOCK
      ?AUTO_4454 - BLOCK
    )
    :vars
    (
      ?AUTO_4455 - BLOCK
      ?AUTO_4456 - BLOCK
      ?AUTO_4457 - BLOCK
      ?AUTO_4458 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4453 ?AUTO_4454 ) ) ( CLEAR ?AUTO_4455 ) ( not ( = ?AUTO_4453 ?AUTO_4456 ) ) ( not ( = ?AUTO_4453 ?AUTO_4455 ) ) ( not ( = ?AUTO_4454 ?AUTO_4456 ) ) ( not ( = ?AUTO_4454 ?AUTO_4455 ) ) ( not ( = ?AUTO_4456 ?AUTO_4455 ) ) ( ON ?AUTO_4456 ?AUTO_4454 ) ( ON ?AUTO_4453 ?AUTO_4456 ) ( CLEAR ?AUTO_4453 ) ( HOLDING ?AUTO_4457 ) ( CLEAR ?AUTO_4458 ) ( not ( = ?AUTO_4453 ?AUTO_4457 ) ) ( not ( = ?AUTO_4453 ?AUTO_4458 ) ) ( not ( = ?AUTO_4454 ?AUTO_4457 ) ) ( not ( = ?AUTO_4454 ?AUTO_4458 ) ) ( not ( = ?AUTO_4455 ?AUTO_4457 ) ) ( not ( = ?AUTO_4455 ?AUTO_4458 ) ) ( not ( = ?AUTO_4456 ?AUTO_4457 ) ) ( not ( = ?AUTO_4456 ?AUTO_4458 ) ) ( not ( = ?AUTO_4457 ?AUTO_4458 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4457 ?AUTO_4458 )
      ( MAKE-ON ?AUTO_4453 ?AUTO_4454 )
      ( MAKE-ON-VERIFY ?AUTO_4453 ?AUTO_4454 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4461 - BLOCK
      ?AUTO_4462 - BLOCK
    )
    :vars
    (
      ?AUTO_4463 - BLOCK
      ?AUTO_4464 - BLOCK
      ?AUTO_4465 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4461 ?AUTO_4462 ) ) ( CLEAR ?AUTO_4463 ) ( not ( = ?AUTO_4461 ?AUTO_4464 ) ) ( not ( = ?AUTO_4461 ?AUTO_4463 ) ) ( not ( = ?AUTO_4462 ?AUTO_4464 ) ) ( not ( = ?AUTO_4462 ?AUTO_4463 ) ) ( not ( = ?AUTO_4464 ?AUTO_4463 ) ) ( ON ?AUTO_4464 ?AUTO_4462 ) ( ON ?AUTO_4461 ?AUTO_4464 ) ( CLEAR ?AUTO_4461 ) ( HOLDING ?AUTO_4465 ) ( not ( = ?AUTO_4461 ?AUTO_4465 ) ) ( not ( = ?AUTO_4462 ?AUTO_4465 ) ) ( not ( = ?AUTO_4463 ?AUTO_4465 ) ) ( not ( = ?AUTO_4464 ?AUTO_4465 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4465 )
      ( MAKE-ON ?AUTO_4461 ?AUTO_4462 )
      ( MAKE-ON-VERIFY ?AUTO_4461 ?AUTO_4462 ) )
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
      ?AUTO_4470 - BLOCK
      ?AUTO_4469 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4466 ?AUTO_4467 ) ) ( CLEAR ?AUTO_4468 ) ( not ( = ?AUTO_4466 ?AUTO_4470 ) ) ( not ( = ?AUTO_4466 ?AUTO_4468 ) ) ( not ( = ?AUTO_4467 ?AUTO_4470 ) ) ( not ( = ?AUTO_4467 ?AUTO_4468 ) ) ( not ( = ?AUTO_4470 ?AUTO_4468 ) ) ( ON ?AUTO_4470 ?AUTO_4467 ) ( ON ?AUTO_4466 ?AUTO_4470 ) ( not ( = ?AUTO_4466 ?AUTO_4469 ) ) ( not ( = ?AUTO_4467 ?AUTO_4469 ) ) ( not ( = ?AUTO_4468 ?AUTO_4469 ) ) ( not ( = ?AUTO_4470 ?AUTO_4469 ) ) ( ON ?AUTO_4469 ?AUTO_4466 ) ( CLEAR ?AUTO_4469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4469 ?AUTO_4466 )
      ( MAKE-ON ?AUTO_4466 ?AUTO_4467 )
      ( MAKE-ON-VERIFY ?AUTO_4466 ?AUTO_4467 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4472 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4472 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4472 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4472 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4473 - BLOCK
    )
    :vars
    (
      ?AUTO_4474 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4473 ?AUTO_4474 ) ( CLEAR ?AUTO_4473 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4473 ?AUTO_4474 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4473 ?AUTO_4474 )
      ( MAKE-ON-TABLE ?AUTO_4473 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4473 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4476 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4476 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4476 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4476 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4477 - BLOCK
    )
    :vars
    (
      ?AUTO_4478 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4477 ?AUTO_4478 ) ( CLEAR ?AUTO_4477 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4477 ?AUTO_4478 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4477 ?AUTO_4478 )
      ( MAKE-ON-TABLE ?AUTO_4477 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4477 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4479 - BLOCK
    )
    :vars
    (
      ?AUTO_4480 - BLOCK
      ?AUTO_4481 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4479 ?AUTO_4480 ) ( CLEAR ?AUTO_4479 ) ( not ( = ?AUTO_4479 ?AUTO_4480 ) ) ( HOLDING ?AUTO_4481 ) ( not ( = ?AUTO_4479 ?AUTO_4481 ) ) ( not ( = ?AUTO_4480 ?AUTO_4481 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4481 )
      ( MAKE-ON-TABLE ?AUTO_4479 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4479 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4482 - BLOCK
    )
    :vars
    (
      ?AUTO_4484 - BLOCK
      ?AUTO_4483 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4482 ?AUTO_4484 ) ( not ( = ?AUTO_4482 ?AUTO_4484 ) ) ( not ( = ?AUTO_4482 ?AUTO_4483 ) ) ( not ( = ?AUTO_4484 ?AUTO_4483 ) ) ( ON ?AUTO_4483 ?AUTO_4482 ) ( CLEAR ?AUTO_4483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4483 ?AUTO_4482 )
      ( MAKE-ON-TABLE ?AUTO_4482 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4482 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4486 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4486 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4486 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4486 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4487 - BLOCK
    )
    :vars
    (
      ?AUTO_4488 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4487 ?AUTO_4488 ) ( CLEAR ?AUTO_4487 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4487 ?AUTO_4488 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4487 ?AUTO_4488 )
      ( MAKE-ON-TABLE ?AUTO_4487 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4487 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4489 - BLOCK
    )
    :vars
    (
      ?AUTO_4490 - BLOCK
      ?AUTO_4491 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4489 ?AUTO_4490 ) ( CLEAR ?AUTO_4489 ) ( not ( = ?AUTO_4489 ?AUTO_4490 ) ) ( HOLDING ?AUTO_4491 ) ( not ( = ?AUTO_4489 ?AUTO_4491 ) ) ( not ( = ?AUTO_4490 ?AUTO_4491 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4491 )
      ( MAKE-ON-TABLE ?AUTO_4489 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4489 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4492 - BLOCK
    )
    :vars
    (
      ?AUTO_4493 - BLOCK
      ?AUTO_4494 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4492 ?AUTO_4493 ) ( not ( = ?AUTO_4492 ?AUTO_4493 ) ) ( not ( = ?AUTO_4492 ?AUTO_4494 ) ) ( not ( = ?AUTO_4493 ?AUTO_4494 ) ) ( ON ?AUTO_4494 ?AUTO_4492 ) ( CLEAR ?AUTO_4494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4494 ?AUTO_4492 )
      ( MAKE-ON-TABLE ?AUTO_4492 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4492 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4495 - BLOCK
    )
    :vars
    (
      ?AUTO_4496 - BLOCK
      ?AUTO_4497 - BLOCK
      ?AUTO_4498 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4495 ?AUTO_4496 ) ( not ( = ?AUTO_4495 ?AUTO_4496 ) ) ( not ( = ?AUTO_4495 ?AUTO_4497 ) ) ( not ( = ?AUTO_4496 ?AUTO_4497 ) ) ( ON ?AUTO_4497 ?AUTO_4495 ) ( CLEAR ?AUTO_4497 ) ( HOLDING ?AUTO_4498 ) ( not ( = ?AUTO_4495 ?AUTO_4498 ) ) ( not ( = ?AUTO_4496 ?AUTO_4498 ) ) ( not ( = ?AUTO_4497 ?AUTO_4498 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4498 )
      ( MAKE-ON-TABLE ?AUTO_4495 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4495 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4499 - BLOCK
    )
    :vars
    (
      ?AUTO_4500 - BLOCK
      ?AUTO_4501 - BLOCK
      ?AUTO_4502 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4499 ?AUTO_4500 ) ( not ( = ?AUTO_4499 ?AUTO_4500 ) ) ( not ( = ?AUTO_4499 ?AUTO_4501 ) ) ( not ( = ?AUTO_4500 ?AUTO_4501 ) ) ( ON ?AUTO_4501 ?AUTO_4499 ) ( not ( = ?AUTO_4499 ?AUTO_4502 ) ) ( not ( = ?AUTO_4500 ?AUTO_4502 ) ) ( not ( = ?AUTO_4501 ?AUTO_4502 ) ) ( ON ?AUTO_4502 ?AUTO_4501 ) ( CLEAR ?AUTO_4502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4502 ?AUTO_4501 )
      ( MAKE-ON-TABLE ?AUTO_4499 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4499 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4505 - BLOCK
      ?AUTO_4506 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4505 ) ( CLEAR ?AUTO_4506 ) ( not ( = ?AUTO_4505 ?AUTO_4506 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4505 ?AUTO_4506 )
      ( MAKE-ON-VERIFY ?AUTO_4505 ?AUTO_4506 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4507 - BLOCK
      ?AUTO_4508 - BLOCK
    )
    :vars
    (
      ?AUTO_4509 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4508 ) ( not ( = ?AUTO_4507 ?AUTO_4508 ) ) ( ON ?AUTO_4507 ?AUTO_4509 ) ( CLEAR ?AUTO_4507 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4507 ?AUTO_4509 ) ) ( not ( = ?AUTO_4508 ?AUTO_4509 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4507 ?AUTO_4509 )
      ( MAKE-ON ?AUTO_4507 ?AUTO_4508 )
      ( MAKE-ON-VERIFY ?AUTO_4507 ?AUTO_4508 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4510 - BLOCK
      ?AUTO_4511 - BLOCK
    )
    :vars
    (
      ?AUTO_4512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4510 ?AUTO_4511 ) ) ( ON ?AUTO_4510 ?AUTO_4512 ) ( CLEAR ?AUTO_4510 ) ( not ( = ?AUTO_4510 ?AUTO_4512 ) ) ( not ( = ?AUTO_4511 ?AUTO_4512 ) ) ( HOLDING ?AUTO_4511 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4511 )
      ( MAKE-ON ?AUTO_4510 ?AUTO_4511 )
      ( MAKE-ON-VERIFY ?AUTO_4510 ?AUTO_4511 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4513 - BLOCK
      ?AUTO_4514 - BLOCK
    )
    :vars
    (
      ?AUTO_4515 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4513 ?AUTO_4514 ) ) ( ON ?AUTO_4513 ?AUTO_4515 ) ( not ( = ?AUTO_4513 ?AUTO_4515 ) ) ( not ( = ?AUTO_4514 ?AUTO_4515 ) ) ( ON ?AUTO_4514 ?AUTO_4513 ) ( CLEAR ?AUTO_4514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4514 ?AUTO_4513 )
      ( MAKE-ON ?AUTO_4513 ?AUTO_4514 )
      ( MAKE-ON-VERIFY ?AUTO_4513 ?AUTO_4514 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4516 - BLOCK
      ?AUTO_4517 - BLOCK
    )
    :vars
    (
      ?AUTO_4518 - BLOCK
      ?AUTO_4519 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4516 ?AUTO_4517 ) ) ( ON ?AUTO_4516 ?AUTO_4518 ) ( not ( = ?AUTO_4516 ?AUTO_4518 ) ) ( not ( = ?AUTO_4517 ?AUTO_4518 ) ) ( ON ?AUTO_4517 ?AUTO_4516 ) ( CLEAR ?AUTO_4517 ) ( HOLDING ?AUTO_4519 ) ( not ( = ?AUTO_4516 ?AUTO_4519 ) ) ( not ( = ?AUTO_4517 ?AUTO_4519 ) ) ( not ( = ?AUTO_4518 ?AUTO_4519 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4519 )
      ( MAKE-ON ?AUTO_4516 ?AUTO_4517 )
      ( MAKE-ON-VERIFY ?AUTO_4516 ?AUTO_4517 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4520 - BLOCK
      ?AUTO_4521 - BLOCK
    )
    :vars
    (
      ?AUTO_4522 - BLOCK
      ?AUTO_4523 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4520 ?AUTO_4521 ) ) ( ON ?AUTO_4520 ?AUTO_4522 ) ( not ( = ?AUTO_4520 ?AUTO_4522 ) ) ( not ( = ?AUTO_4521 ?AUTO_4522 ) ) ( ON ?AUTO_4521 ?AUTO_4520 ) ( not ( = ?AUTO_4520 ?AUTO_4523 ) ) ( not ( = ?AUTO_4521 ?AUTO_4523 ) ) ( not ( = ?AUTO_4522 ?AUTO_4523 ) ) ( ON ?AUTO_4523 ?AUTO_4521 ) ( CLEAR ?AUTO_4523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4523 ?AUTO_4521 )
      ( MAKE-ON ?AUTO_4520 ?AUTO_4521 )
      ( MAKE-ON-VERIFY ?AUTO_4520 ?AUTO_4521 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4524 - BLOCK
      ?AUTO_4525 - BLOCK
    )
    :vars
    (
      ?AUTO_4527 - BLOCK
      ?AUTO_4526 - BLOCK
      ?AUTO_4528 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4524 ?AUTO_4525 ) ) ( ON ?AUTO_4524 ?AUTO_4527 ) ( not ( = ?AUTO_4524 ?AUTO_4527 ) ) ( not ( = ?AUTO_4525 ?AUTO_4527 ) ) ( ON ?AUTO_4525 ?AUTO_4524 ) ( not ( = ?AUTO_4524 ?AUTO_4526 ) ) ( not ( = ?AUTO_4525 ?AUTO_4526 ) ) ( not ( = ?AUTO_4527 ?AUTO_4526 ) ) ( ON ?AUTO_4526 ?AUTO_4525 ) ( CLEAR ?AUTO_4526 ) ( HOLDING ?AUTO_4528 ) ( not ( = ?AUTO_4524 ?AUTO_4528 ) ) ( not ( = ?AUTO_4525 ?AUTO_4528 ) ) ( not ( = ?AUTO_4527 ?AUTO_4528 ) ) ( not ( = ?AUTO_4526 ?AUTO_4528 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4528 )
      ( MAKE-ON ?AUTO_4524 ?AUTO_4525 )
      ( MAKE-ON-VERIFY ?AUTO_4524 ?AUTO_4525 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4529 - BLOCK
      ?AUTO_4530 - BLOCK
    )
    :vars
    (
      ?AUTO_4532 - BLOCK
      ?AUTO_4531 - BLOCK
      ?AUTO_4533 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4529 ?AUTO_4530 ) ) ( ON ?AUTO_4529 ?AUTO_4532 ) ( not ( = ?AUTO_4529 ?AUTO_4532 ) ) ( not ( = ?AUTO_4530 ?AUTO_4532 ) ) ( ON ?AUTO_4530 ?AUTO_4529 ) ( not ( = ?AUTO_4529 ?AUTO_4531 ) ) ( not ( = ?AUTO_4530 ?AUTO_4531 ) ) ( not ( = ?AUTO_4532 ?AUTO_4531 ) ) ( ON ?AUTO_4531 ?AUTO_4530 ) ( not ( = ?AUTO_4529 ?AUTO_4533 ) ) ( not ( = ?AUTO_4530 ?AUTO_4533 ) ) ( not ( = ?AUTO_4532 ?AUTO_4533 ) ) ( not ( = ?AUTO_4531 ?AUTO_4533 ) ) ( ON ?AUTO_4533 ?AUTO_4531 ) ( CLEAR ?AUTO_4533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4533 ?AUTO_4531 )
      ( MAKE-ON ?AUTO_4529 ?AUTO_4530 )
      ( MAKE-ON-VERIFY ?AUTO_4529 ?AUTO_4530 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4536 - BLOCK
      ?AUTO_4537 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4536 ) ( CLEAR ?AUTO_4537 ) ( not ( = ?AUTO_4536 ?AUTO_4537 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4536 ?AUTO_4537 )
      ( MAKE-ON-VERIFY ?AUTO_4536 ?AUTO_4537 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4538 - BLOCK
      ?AUTO_4539 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4539 ) ( not ( = ?AUTO_4538 ?AUTO_4539 ) ) ( ON-TABLE ?AUTO_4538 ) ( CLEAR ?AUTO_4538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4538 )
      ( MAKE-ON ?AUTO_4538 ?AUTO_4539 )
      ( MAKE-ON-VERIFY ?AUTO_4538 ?AUTO_4539 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4540 - BLOCK
      ?AUTO_4541 - BLOCK
    )
    :vars
    (
      ?AUTO_4542 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4540 ?AUTO_4541 ) ) ( ON-TABLE ?AUTO_4540 ) ( CLEAR ?AUTO_4540 ) ( HOLDING ?AUTO_4541 ) ( CLEAR ?AUTO_4542 ) ( not ( = ?AUTO_4540 ?AUTO_4542 ) ) ( not ( = ?AUTO_4541 ?AUTO_4542 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4541 ?AUTO_4542 )
      ( MAKE-ON ?AUTO_4540 ?AUTO_4541 )
      ( MAKE-ON-VERIFY ?AUTO_4540 ?AUTO_4541 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4545 - BLOCK
      ?AUTO_4546 - BLOCK
    )
    :vars
    (
      ?AUTO_4547 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4546 ) ( not ( = ?AUTO_4545 ?AUTO_4546 ) ) ( ON-TABLE ?AUTO_4545 ) ( CLEAR ?AUTO_4545 ) ( HOLDING ?AUTO_4547 ) ( not ( = ?AUTO_4545 ?AUTO_4547 ) ) ( not ( = ?AUTO_4546 ?AUTO_4547 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4547 )
      ( MAKE-ON ?AUTO_4545 ?AUTO_4546 )
      ( MAKE-ON-VERIFY ?AUTO_4545 ?AUTO_4546 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4548 - BLOCK
      ?AUTO_4549 - BLOCK
    )
    :vars
    (
      ?AUTO_4550 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4548 ?AUTO_4549 ) ) ( ON-TABLE ?AUTO_4548 ) ( CLEAR ?AUTO_4548 ) ( not ( = ?AUTO_4548 ?AUTO_4550 ) ) ( not ( = ?AUTO_4549 ?AUTO_4550 ) ) ( ON ?AUTO_4550 ?AUTO_4549 ) ( CLEAR ?AUTO_4550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4550 ?AUTO_4549 )
      ( MAKE-ON ?AUTO_4548 ?AUTO_4549 )
      ( MAKE-ON-VERIFY ?AUTO_4548 ?AUTO_4549 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4551 - BLOCK
      ?AUTO_4552 - BLOCK
    )
    :vars
    (
      ?AUTO_4553 - BLOCK
      ?AUTO_4554 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4551 ?AUTO_4552 ) ) ( ON-TABLE ?AUTO_4551 ) ( CLEAR ?AUTO_4551 ) ( not ( = ?AUTO_4551 ?AUTO_4553 ) ) ( not ( = ?AUTO_4552 ?AUTO_4553 ) ) ( ON ?AUTO_4553 ?AUTO_4552 ) ( CLEAR ?AUTO_4553 ) ( HOLDING ?AUTO_4554 ) ( not ( = ?AUTO_4551 ?AUTO_4554 ) ) ( not ( = ?AUTO_4552 ?AUTO_4554 ) ) ( not ( = ?AUTO_4553 ?AUTO_4554 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4554 )
      ( MAKE-ON ?AUTO_4551 ?AUTO_4552 )
      ( MAKE-ON-VERIFY ?AUTO_4551 ?AUTO_4552 ) )
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
      ?AUTO_4558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4555 ?AUTO_4556 ) ) ( ON-TABLE ?AUTO_4555 ) ( CLEAR ?AUTO_4555 ) ( not ( = ?AUTO_4555 ?AUTO_4557 ) ) ( not ( = ?AUTO_4556 ?AUTO_4557 ) ) ( ON ?AUTO_4557 ?AUTO_4556 ) ( not ( = ?AUTO_4555 ?AUTO_4558 ) ) ( not ( = ?AUTO_4556 ?AUTO_4558 ) ) ( not ( = ?AUTO_4557 ?AUTO_4558 ) ) ( ON ?AUTO_4558 ?AUTO_4557 ) ( CLEAR ?AUTO_4558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4558 ?AUTO_4557 )
      ( MAKE-ON ?AUTO_4555 ?AUTO_4556 )
      ( MAKE-ON-VERIFY ?AUTO_4555 ?AUTO_4556 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4559 - BLOCK
      ?AUTO_4560 - BLOCK
    )
    :vars
    (
      ?AUTO_4562 - BLOCK
      ?AUTO_4561 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4559 ?AUTO_4560 ) ) ( not ( = ?AUTO_4559 ?AUTO_4562 ) ) ( not ( = ?AUTO_4560 ?AUTO_4562 ) ) ( ON ?AUTO_4562 ?AUTO_4560 ) ( not ( = ?AUTO_4559 ?AUTO_4561 ) ) ( not ( = ?AUTO_4560 ?AUTO_4561 ) ) ( not ( = ?AUTO_4562 ?AUTO_4561 ) ) ( ON ?AUTO_4561 ?AUTO_4562 ) ( CLEAR ?AUTO_4561 ) ( HOLDING ?AUTO_4559 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4559 )
      ( MAKE-ON ?AUTO_4559 ?AUTO_4560 )
      ( MAKE-ON-VERIFY ?AUTO_4559 ?AUTO_4560 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4563 - BLOCK
      ?AUTO_4564 - BLOCK
    )
    :vars
    (
      ?AUTO_4566 - BLOCK
      ?AUTO_4565 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4563 ?AUTO_4564 ) ) ( not ( = ?AUTO_4563 ?AUTO_4566 ) ) ( not ( = ?AUTO_4564 ?AUTO_4566 ) ) ( ON ?AUTO_4566 ?AUTO_4564 ) ( not ( = ?AUTO_4563 ?AUTO_4565 ) ) ( not ( = ?AUTO_4564 ?AUTO_4565 ) ) ( not ( = ?AUTO_4566 ?AUTO_4565 ) ) ( ON ?AUTO_4565 ?AUTO_4566 ) ( ON ?AUTO_4563 ?AUTO_4565 ) ( CLEAR ?AUTO_4563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4563 ?AUTO_4565 )
      ( MAKE-ON ?AUTO_4563 ?AUTO_4564 )
      ( MAKE-ON-VERIFY ?AUTO_4563 ?AUTO_4564 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4569 - BLOCK
      ?AUTO_4570 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4569 ) ( CLEAR ?AUTO_4570 ) ( not ( = ?AUTO_4569 ?AUTO_4570 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4569 ?AUTO_4570 )
      ( MAKE-ON-VERIFY ?AUTO_4569 ?AUTO_4570 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4571 - BLOCK
      ?AUTO_4572 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4572 ) ( not ( = ?AUTO_4571 ?AUTO_4572 ) ) ( ON-TABLE ?AUTO_4571 ) ( CLEAR ?AUTO_4571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4571 )
      ( MAKE-ON ?AUTO_4571 ?AUTO_4572 )
      ( MAKE-ON-VERIFY ?AUTO_4571 ?AUTO_4572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4573 - BLOCK
      ?AUTO_4574 - BLOCK
    )
    :vars
    (
      ?AUTO_4575 - BLOCK
      ?AUTO_4576 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4574 ) ( not ( = ?AUTO_4573 ?AUTO_4574 ) ) ( ON-TABLE ?AUTO_4573 ) ( CLEAR ?AUTO_4573 ) ( HOLDING ?AUTO_4575 ) ( CLEAR ?AUTO_4576 ) ( not ( = ?AUTO_4573 ?AUTO_4575 ) ) ( not ( = ?AUTO_4573 ?AUTO_4576 ) ) ( not ( = ?AUTO_4574 ?AUTO_4575 ) ) ( not ( = ?AUTO_4574 ?AUTO_4576 ) ) ( not ( = ?AUTO_4575 ?AUTO_4576 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4575 ?AUTO_4576 )
      ( MAKE-ON ?AUTO_4573 ?AUTO_4574 )
      ( MAKE-ON-VERIFY ?AUTO_4573 ?AUTO_4574 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4597 - BLOCK
      ?AUTO_4598 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4597 ) ( CLEAR ?AUTO_4598 ) ( not ( = ?AUTO_4597 ?AUTO_4598 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4597 ?AUTO_4598 )
      ( MAKE-ON-VERIFY ?AUTO_4597 ?AUTO_4598 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4599 - BLOCK
      ?AUTO_4600 - BLOCK
    )
    :vars
    (
      ?AUTO_4601 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4600 ) ( not ( = ?AUTO_4599 ?AUTO_4600 ) ) ( ON ?AUTO_4599 ?AUTO_4601 ) ( CLEAR ?AUTO_4599 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4599 ?AUTO_4601 ) ) ( not ( = ?AUTO_4600 ?AUTO_4601 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4599 ?AUTO_4601 )
      ( MAKE-ON ?AUTO_4599 ?AUTO_4600 )
      ( MAKE-ON-VERIFY ?AUTO_4599 ?AUTO_4600 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4602 - BLOCK
      ?AUTO_4603 - BLOCK
    )
    :vars
    (
      ?AUTO_4604 - BLOCK
      ?AUTO_4605 - BLOCK
      ?AUTO_4606 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4603 ) ( not ( = ?AUTO_4602 ?AUTO_4603 ) ) ( ON ?AUTO_4602 ?AUTO_4604 ) ( CLEAR ?AUTO_4602 ) ( not ( = ?AUTO_4602 ?AUTO_4604 ) ) ( not ( = ?AUTO_4603 ?AUTO_4604 ) ) ( HOLDING ?AUTO_4605 ) ( CLEAR ?AUTO_4606 ) ( not ( = ?AUTO_4602 ?AUTO_4605 ) ) ( not ( = ?AUTO_4602 ?AUTO_4606 ) ) ( not ( = ?AUTO_4603 ?AUTO_4605 ) ) ( not ( = ?AUTO_4603 ?AUTO_4606 ) ) ( not ( = ?AUTO_4604 ?AUTO_4605 ) ) ( not ( = ?AUTO_4604 ?AUTO_4606 ) ) ( not ( = ?AUTO_4605 ?AUTO_4606 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4605 ?AUTO_4606 )
      ( MAKE-ON ?AUTO_4602 ?AUTO_4603 )
      ( MAKE-ON-VERIFY ?AUTO_4602 ?AUTO_4603 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4615 - BLOCK
      ?AUTO_4616 - BLOCK
    )
    :vars
    (
      ?AUTO_4617 - BLOCK
      ?AUTO_4618 - BLOCK
      ?AUTO_4619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4615 ?AUTO_4616 ) ) ( ON ?AUTO_4615 ?AUTO_4617 ) ( CLEAR ?AUTO_4615 ) ( not ( = ?AUTO_4615 ?AUTO_4617 ) ) ( not ( = ?AUTO_4616 ?AUTO_4617 ) ) ( CLEAR ?AUTO_4618 ) ( not ( = ?AUTO_4615 ?AUTO_4619 ) ) ( not ( = ?AUTO_4615 ?AUTO_4618 ) ) ( not ( = ?AUTO_4616 ?AUTO_4619 ) ) ( not ( = ?AUTO_4616 ?AUTO_4618 ) ) ( not ( = ?AUTO_4617 ?AUTO_4619 ) ) ( not ( = ?AUTO_4617 ?AUTO_4618 ) ) ( not ( = ?AUTO_4619 ?AUTO_4618 ) ) ( ON ?AUTO_4619 ?AUTO_4616 ) ( CLEAR ?AUTO_4619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4619 ?AUTO_4616 )
      ( MAKE-ON ?AUTO_4615 ?AUTO_4616 )
      ( MAKE-ON-VERIFY ?AUTO_4615 ?AUTO_4616 ) )
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
      ?AUTO_4622 - BLOCK
      ?AUTO_4624 - BLOCK
      ?AUTO_4625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4620 ?AUTO_4621 ) ) ( ON ?AUTO_4620 ?AUTO_4623 ) ( CLEAR ?AUTO_4620 ) ( not ( = ?AUTO_4620 ?AUTO_4623 ) ) ( not ( = ?AUTO_4621 ?AUTO_4623 ) ) ( CLEAR ?AUTO_4622 ) ( not ( = ?AUTO_4620 ?AUTO_4624 ) ) ( not ( = ?AUTO_4620 ?AUTO_4622 ) ) ( not ( = ?AUTO_4621 ?AUTO_4624 ) ) ( not ( = ?AUTO_4621 ?AUTO_4622 ) ) ( not ( = ?AUTO_4623 ?AUTO_4624 ) ) ( not ( = ?AUTO_4623 ?AUTO_4622 ) ) ( not ( = ?AUTO_4624 ?AUTO_4622 ) ) ( ON ?AUTO_4624 ?AUTO_4621 ) ( CLEAR ?AUTO_4624 ) ( HOLDING ?AUTO_4625 ) ( not ( = ?AUTO_4620 ?AUTO_4625 ) ) ( not ( = ?AUTO_4621 ?AUTO_4625 ) ) ( not ( = ?AUTO_4623 ?AUTO_4625 ) ) ( not ( = ?AUTO_4622 ?AUTO_4625 ) ) ( not ( = ?AUTO_4624 ?AUTO_4625 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4625 )
      ( MAKE-ON ?AUTO_4620 ?AUTO_4621 )
      ( MAKE-ON-VERIFY ?AUTO_4620 ?AUTO_4621 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4626 - BLOCK
      ?AUTO_4627 - BLOCK
    )
    :vars
    (
      ?AUTO_4628 - BLOCK
      ?AUTO_4629 - BLOCK
      ?AUTO_4630 - BLOCK
      ?AUTO_4631 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4626 ?AUTO_4627 ) ) ( ON ?AUTO_4626 ?AUTO_4628 ) ( CLEAR ?AUTO_4626 ) ( not ( = ?AUTO_4626 ?AUTO_4628 ) ) ( not ( = ?AUTO_4627 ?AUTO_4628 ) ) ( CLEAR ?AUTO_4629 ) ( not ( = ?AUTO_4626 ?AUTO_4630 ) ) ( not ( = ?AUTO_4626 ?AUTO_4629 ) ) ( not ( = ?AUTO_4627 ?AUTO_4630 ) ) ( not ( = ?AUTO_4627 ?AUTO_4629 ) ) ( not ( = ?AUTO_4628 ?AUTO_4630 ) ) ( not ( = ?AUTO_4628 ?AUTO_4629 ) ) ( not ( = ?AUTO_4630 ?AUTO_4629 ) ) ( ON ?AUTO_4630 ?AUTO_4627 ) ( not ( = ?AUTO_4626 ?AUTO_4631 ) ) ( not ( = ?AUTO_4627 ?AUTO_4631 ) ) ( not ( = ?AUTO_4628 ?AUTO_4631 ) ) ( not ( = ?AUTO_4629 ?AUTO_4631 ) ) ( not ( = ?AUTO_4630 ?AUTO_4631 ) ) ( ON ?AUTO_4631 ?AUTO_4630 ) ( CLEAR ?AUTO_4631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4631 ?AUTO_4630 )
      ( MAKE-ON ?AUTO_4626 ?AUTO_4627 )
      ( MAKE-ON-VERIFY ?AUTO_4626 ?AUTO_4627 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4632 - BLOCK
      ?AUTO_4633 - BLOCK
    )
    :vars
    (
      ?AUTO_4635 - BLOCK
      ?AUTO_4636 - BLOCK
      ?AUTO_4634 - BLOCK
      ?AUTO_4637 - BLOCK
      ?AUTO_4638 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4632 ?AUTO_4633 ) ) ( ON ?AUTO_4632 ?AUTO_4635 ) ( CLEAR ?AUTO_4632 ) ( not ( = ?AUTO_4632 ?AUTO_4635 ) ) ( not ( = ?AUTO_4633 ?AUTO_4635 ) ) ( CLEAR ?AUTO_4636 ) ( not ( = ?AUTO_4632 ?AUTO_4634 ) ) ( not ( = ?AUTO_4632 ?AUTO_4636 ) ) ( not ( = ?AUTO_4633 ?AUTO_4634 ) ) ( not ( = ?AUTO_4633 ?AUTO_4636 ) ) ( not ( = ?AUTO_4635 ?AUTO_4634 ) ) ( not ( = ?AUTO_4635 ?AUTO_4636 ) ) ( not ( = ?AUTO_4634 ?AUTO_4636 ) ) ( ON ?AUTO_4634 ?AUTO_4633 ) ( not ( = ?AUTO_4632 ?AUTO_4637 ) ) ( not ( = ?AUTO_4633 ?AUTO_4637 ) ) ( not ( = ?AUTO_4635 ?AUTO_4637 ) ) ( not ( = ?AUTO_4636 ?AUTO_4637 ) ) ( not ( = ?AUTO_4634 ?AUTO_4637 ) ) ( ON ?AUTO_4637 ?AUTO_4634 ) ( CLEAR ?AUTO_4637 ) ( HOLDING ?AUTO_4638 ) ( not ( = ?AUTO_4632 ?AUTO_4638 ) ) ( not ( = ?AUTO_4633 ?AUTO_4638 ) ) ( not ( = ?AUTO_4635 ?AUTO_4638 ) ) ( not ( = ?AUTO_4636 ?AUTO_4638 ) ) ( not ( = ?AUTO_4634 ?AUTO_4638 ) ) ( not ( = ?AUTO_4637 ?AUTO_4638 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4638 )
      ( MAKE-ON ?AUTO_4632 ?AUTO_4633 )
      ( MAKE-ON-VERIFY ?AUTO_4632 ?AUTO_4633 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4639 - BLOCK
      ?AUTO_4640 - BLOCK
    )
    :vars
    (
      ?AUTO_4642 - BLOCK
      ?AUTO_4645 - BLOCK
      ?AUTO_4641 - BLOCK
      ?AUTO_4644 - BLOCK
      ?AUTO_4643 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4639 ?AUTO_4640 ) ) ( ON ?AUTO_4639 ?AUTO_4642 ) ( CLEAR ?AUTO_4639 ) ( not ( = ?AUTO_4639 ?AUTO_4642 ) ) ( not ( = ?AUTO_4640 ?AUTO_4642 ) ) ( CLEAR ?AUTO_4645 ) ( not ( = ?AUTO_4639 ?AUTO_4641 ) ) ( not ( = ?AUTO_4639 ?AUTO_4645 ) ) ( not ( = ?AUTO_4640 ?AUTO_4641 ) ) ( not ( = ?AUTO_4640 ?AUTO_4645 ) ) ( not ( = ?AUTO_4642 ?AUTO_4641 ) ) ( not ( = ?AUTO_4642 ?AUTO_4645 ) ) ( not ( = ?AUTO_4641 ?AUTO_4645 ) ) ( ON ?AUTO_4641 ?AUTO_4640 ) ( not ( = ?AUTO_4639 ?AUTO_4644 ) ) ( not ( = ?AUTO_4640 ?AUTO_4644 ) ) ( not ( = ?AUTO_4642 ?AUTO_4644 ) ) ( not ( = ?AUTO_4645 ?AUTO_4644 ) ) ( not ( = ?AUTO_4641 ?AUTO_4644 ) ) ( ON ?AUTO_4644 ?AUTO_4641 ) ( not ( = ?AUTO_4639 ?AUTO_4643 ) ) ( not ( = ?AUTO_4640 ?AUTO_4643 ) ) ( not ( = ?AUTO_4642 ?AUTO_4643 ) ) ( not ( = ?AUTO_4645 ?AUTO_4643 ) ) ( not ( = ?AUTO_4641 ?AUTO_4643 ) ) ( not ( = ?AUTO_4644 ?AUTO_4643 ) ) ( ON ?AUTO_4643 ?AUTO_4644 ) ( CLEAR ?AUTO_4643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4643 ?AUTO_4644 )
      ( MAKE-ON ?AUTO_4639 ?AUTO_4640 )
      ( MAKE-ON-VERIFY ?AUTO_4639 ?AUTO_4640 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4646 - BLOCK
      ?AUTO_4647 - BLOCK
    )
    :vars
    (
      ?AUTO_4648 - BLOCK
      ?AUTO_4651 - BLOCK
      ?AUTO_4649 - BLOCK
      ?AUTO_4652 - BLOCK
      ?AUTO_4650 - BLOCK
      ?AUTO_4653 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4646 ?AUTO_4647 ) ) ( ON ?AUTO_4646 ?AUTO_4648 ) ( CLEAR ?AUTO_4646 ) ( not ( = ?AUTO_4646 ?AUTO_4648 ) ) ( not ( = ?AUTO_4647 ?AUTO_4648 ) ) ( CLEAR ?AUTO_4651 ) ( not ( = ?AUTO_4646 ?AUTO_4649 ) ) ( not ( = ?AUTO_4646 ?AUTO_4651 ) ) ( not ( = ?AUTO_4647 ?AUTO_4649 ) ) ( not ( = ?AUTO_4647 ?AUTO_4651 ) ) ( not ( = ?AUTO_4648 ?AUTO_4649 ) ) ( not ( = ?AUTO_4648 ?AUTO_4651 ) ) ( not ( = ?AUTO_4649 ?AUTO_4651 ) ) ( ON ?AUTO_4649 ?AUTO_4647 ) ( not ( = ?AUTO_4646 ?AUTO_4652 ) ) ( not ( = ?AUTO_4647 ?AUTO_4652 ) ) ( not ( = ?AUTO_4648 ?AUTO_4652 ) ) ( not ( = ?AUTO_4651 ?AUTO_4652 ) ) ( not ( = ?AUTO_4649 ?AUTO_4652 ) ) ( ON ?AUTO_4652 ?AUTO_4649 ) ( not ( = ?AUTO_4646 ?AUTO_4650 ) ) ( not ( = ?AUTO_4647 ?AUTO_4650 ) ) ( not ( = ?AUTO_4648 ?AUTO_4650 ) ) ( not ( = ?AUTO_4651 ?AUTO_4650 ) ) ( not ( = ?AUTO_4649 ?AUTO_4650 ) ) ( not ( = ?AUTO_4652 ?AUTO_4650 ) ) ( ON ?AUTO_4650 ?AUTO_4652 ) ( CLEAR ?AUTO_4650 ) ( HOLDING ?AUTO_4653 ) ( not ( = ?AUTO_4646 ?AUTO_4653 ) ) ( not ( = ?AUTO_4647 ?AUTO_4653 ) ) ( not ( = ?AUTO_4648 ?AUTO_4653 ) ) ( not ( = ?AUTO_4651 ?AUTO_4653 ) ) ( not ( = ?AUTO_4649 ?AUTO_4653 ) ) ( not ( = ?AUTO_4652 ?AUTO_4653 ) ) ( not ( = ?AUTO_4650 ?AUTO_4653 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4653 )
      ( MAKE-ON ?AUTO_4646 ?AUTO_4647 )
      ( MAKE-ON-VERIFY ?AUTO_4646 ?AUTO_4647 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4654 - BLOCK
      ?AUTO_4655 - BLOCK
    )
    :vars
    (
      ?AUTO_4658 - BLOCK
      ?AUTO_4661 - BLOCK
      ?AUTO_4657 - BLOCK
      ?AUTO_4656 - BLOCK
      ?AUTO_4659 - BLOCK
      ?AUTO_4660 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4654 ?AUTO_4655 ) ) ( ON ?AUTO_4654 ?AUTO_4658 ) ( CLEAR ?AUTO_4654 ) ( not ( = ?AUTO_4654 ?AUTO_4658 ) ) ( not ( = ?AUTO_4655 ?AUTO_4658 ) ) ( CLEAR ?AUTO_4661 ) ( not ( = ?AUTO_4654 ?AUTO_4657 ) ) ( not ( = ?AUTO_4654 ?AUTO_4661 ) ) ( not ( = ?AUTO_4655 ?AUTO_4657 ) ) ( not ( = ?AUTO_4655 ?AUTO_4661 ) ) ( not ( = ?AUTO_4658 ?AUTO_4657 ) ) ( not ( = ?AUTO_4658 ?AUTO_4661 ) ) ( not ( = ?AUTO_4657 ?AUTO_4661 ) ) ( ON ?AUTO_4657 ?AUTO_4655 ) ( not ( = ?AUTO_4654 ?AUTO_4656 ) ) ( not ( = ?AUTO_4655 ?AUTO_4656 ) ) ( not ( = ?AUTO_4658 ?AUTO_4656 ) ) ( not ( = ?AUTO_4661 ?AUTO_4656 ) ) ( not ( = ?AUTO_4657 ?AUTO_4656 ) ) ( ON ?AUTO_4656 ?AUTO_4657 ) ( not ( = ?AUTO_4654 ?AUTO_4659 ) ) ( not ( = ?AUTO_4655 ?AUTO_4659 ) ) ( not ( = ?AUTO_4658 ?AUTO_4659 ) ) ( not ( = ?AUTO_4661 ?AUTO_4659 ) ) ( not ( = ?AUTO_4657 ?AUTO_4659 ) ) ( not ( = ?AUTO_4656 ?AUTO_4659 ) ) ( ON ?AUTO_4659 ?AUTO_4656 ) ( not ( = ?AUTO_4654 ?AUTO_4660 ) ) ( not ( = ?AUTO_4655 ?AUTO_4660 ) ) ( not ( = ?AUTO_4658 ?AUTO_4660 ) ) ( not ( = ?AUTO_4661 ?AUTO_4660 ) ) ( not ( = ?AUTO_4657 ?AUTO_4660 ) ) ( not ( = ?AUTO_4656 ?AUTO_4660 ) ) ( not ( = ?AUTO_4659 ?AUTO_4660 ) ) ( ON ?AUTO_4660 ?AUTO_4659 ) ( CLEAR ?AUTO_4660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4660 ?AUTO_4659 )
      ( MAKE-ON ?AUTO_4654 ?AUTO_4655 )
      ( MAKE-ON-VERIFY ?AUTO_4654 ?AUTO_4655 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4663 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4663 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4663 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4663 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4664 - BLOCK
    )
    :vars
    (
      ?AUTO_4665 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4664 ?AUTO_4665 ) ( CLEAR ?AUTO_4664 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4664 ?AUTO_4665 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4664 ?AUTO_4665 )
      ( MAKE-ON-TABLE ?AUTO_4664 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4664 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4666 - BLOCK
    )
    :vars
    (
      ?AUTO_4667 - BLOCK
      ?AUTO_4668 - BLOCK
      ?AUTO_4669 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4666 ?AUTO_4667 ) ( CLEAR ?AUTO_4666 ) ( not ( = ?AUTO_4666 ?AUTO_4667 ) ) ( HOLDING ?AUTO_4668 ) ( CLEAR ?AUTO_4669 ) ( not ( = ?AUTO_4666 ?AUTO_4668 ) ) ( not ( = ?AUTO_4666 ?AUTO_4669 ) ) ( not ( = ?AUTO_4667 ?AUTO_4668 ) ) ( not ( = ?AUTO_4667 ?AUTO_4669 ) ) ( not ( = ?AUTO_4668 ?AUTO_4669 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4668 ?AUTO_4669 )
      ( MAKE-ON-TABLE ?AUTO_4666 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4666 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4670 - BLOCK
    )
    :vars
    (
      ?AUTO_4671 - BLOCK
      ?AUTO_4673 - BLOCK
      ?AUTO_4672 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4670 ?AUTO_4671 ) ( not ( = ?AUTO_4670 ?AUTO_4671 ) ) ( CLEAR ?AUTO_4673 ) ( not ( = ?AUTO_4670 ?AUTO_4672 ) ) ( not ( = ?AUTO_4670 ?AUTO_4673 ) ) ( not ( = ?AUTO_4671 ?AUTO_4672 ) ) ( not ( = ?AUTO_4671 ?AUTO_4673 ) ) ( not ( = ?AUTO_4672 ?AUTO_4673 ) ) ( ON ?AUTO_4672 ?AUTO_4670 ) ( CLEAR ?AUTO_4672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4672 ?AUTO_4670 )
      ( MAKE-ON-TABLE ?AUTO_4670 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4670 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4674 - BLOCK
    )
    :vars
    (
      ?AUTO_4675 - BLOCK
      ?AUTO_4677 - BLOCK
      ?AUTO_4676 - BLOCK
      ?AUTO_4678 - BLOCK
      ?AUTO_4679 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4674 ?AUTO_4675 ) ( not ( = ?AUTO_4674 ?AUTO_4675 ) ) ( CLEAR ?AUTO_4677 ) ( not ( = ?AUTO_4674 ?AUTO_4676 ) ) ( not ( = ?AUTO_4674 ?AUTO_4677 ) ) ( not ( = ?AUTO_4675 ?AUTO_4676 ) ) ( not ( = ?AUTO_4675 ?AUTO_4677 ) ) ( not ( = ?AUTO_4676 ?AUTO_4677 ) ) ( ON ?AUTO_4676 ?AUTO_4674 ) ( CLEAR ?AUTO_4676 ) ( HOLDING ?AUTO_4678 ) ( CLEAR ?AUTO_4679 ) ( not ( = ?AUTO_4674 ?AUTO_4678 ) ) ( not ( = ?AUTO_4674 ?AUTO_4679 ) ) ( not ( = ?AUTO_4675 ?AUTO_4678 ) ) ( not ( = ?AUTO_4675 ?AUTO_4679 ) ) ( not ( = ?AUTO_4677 ?AUTO_4678 ) ) ( not ( = ?AUTO_4677 ?AUTO_4679 ) ) ( not ( = ?AUTO_4676 ?AUTO_4678 ) ) ( not ( = ?AUTO_4676 ?AUTO_4679 ) ) ( not ( = ?AUTO_4678 ?AUTO_4679 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4678 ?AUTO_4679 )
      ( MAKE-ON-TABLE ?AUTO_4674 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4674 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4692 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4692 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4692 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4692 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4693 - BLOCK
    )
    :vars
    (
      ?AUTO_4694 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4693 ?AUTO_4694 ) ( CLEAR ?AUTO_4693 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4693 ?AUTO_4694 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4693 ?AUTO_4694 )
      ( MAKE-ON-TABLE ?AUTO_4693 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4693 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4695 - BLOCK
    )
    :vars
    (
      ?AUTO_4696 - BLOCK
      ?AUTO_4697 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4695 ?AUTO_4696 ) ( CLEAR ?AUTO_4695 ) ( not ( = ?AUTO_4695 ?AUTO_4696 ) ) ( HOLDING ?AUTO_4697 ) ( not ( = ?AUTO_4695 ?AUTO_4697 ) ) ( not ( = ?AUTO_4696 ?AUTO_4697 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4697 )
      ( MAKE-ON-TABLE ?AUTO_4695 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4695 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4698 - BLOCK
    )
    :vars
    (
      ?AUTO_4699 - BLOCK
      ?AUTO_4700 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4698 ?AUTO_4699 ) ( not ( = ?AUTO_4698 ?AUTO_4699 ) ) ( not ( = ?AUTO_4698 ?AUTO_4700 ) ) ( not ( = ?AUTO_4699 ?AUTO_4700 ) ) ( ON ?AUTO_4700 ?AUTO_4698 ) ( CLEAR ?AUTO_4700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4700 ?AUTO_4698 )
      ( MAKE-ON-TABLE ?AUTO_4698 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4698 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4701 - BLOCK
    )
    :vars
    (
      ?AUTO_4702 - BLOCK
      ?AUTO_4703 - BLOCK
      ?AUTO_4704 - BLOCK
      ?AUTO_4705 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4701 ?AUTO_4702 ) ( not ( = ?AUTO_4701 ?AUTO_4702 ) ) ( not ( = ?AUTO_4701 ?AUTO_4703 ) ) ( not ( = ?AUTO_4702 ?AUTO_4703 ) ) ( ON ?AUTO_4703 ?AUTO_4701 ) ( CLEAR ?AUTO_4703 ) ( HOLDING ?AUTO_4704 ) ( CLEAR ?AUTO_4705 ) ( not ( = ?AUTO_4701 ?AUTO_4704 ) ) ( not ( = ?AUTO_4701 ?AUTO_4705 ) ) ( not ( = ?AUTO_4702 ?AUTO_4704 ) ) ( not ( = ?AUTO_4702 ?AUTO_4705 ) ) ( not ( = ?AUTO_4703 ?AUTO_4704 ) ) ( not ( = ?AUTO_4703 ?AUTO_4705 ) ) ( not ( = ?AUTO_4704 ?AUTO_4705 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4704 ?AUTO_4705 )
      ( MAKE-ON-TABLE ?AUTO_4701 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4701 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4706 - BLOCK
    )
    :vars
    (
      ?AUTO_4707 - BLOCK
      ?AUTO_4708 - BLOCK
      ?AUTO_4709 - BLOCK
      ?AUTO_4710 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4706 ?AUTO_4707 ) ( not ( = ?AUTO_4706 ?AUTO_4707 ) ) ( not ( = ?AUTO_4706 ?AUTO_4708 ) ) ( not ( = ?AUTO_4707 ?AUTO_4708 ) ) ( ON ?AUTO_4708 ?AUTO_4706 ) ( CLEAR ?AUTO_4709 ) ( not ( = ?AUTO_4706 ?AUTO_4710 ) ) ( not ( = ?AUTO_4706 ?AUTO_4709 ) ) ( not ( = ?AUTO_4707 ?AUTO_4710 ) ) ( not ( = ?AUTO_4707 ?AUTO_4709 ) ) ( not ( = ?AUTO_4708 ?AUTO_4710 ) ) ( not ( = ?AUTO_4708 ?AUTO_4709 ) ) ( not ( = ?AUTO_4710 ?AUTO_4709 ) ) ( ON ?AUTO_4710 ?AUTO_4708 ) ( CLEAR ?AUTO_4710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4710 ?AUTO_4708 )
      ( MAKE-ON-TABLE ?AUTO_4706 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4706 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4711 - BLOCK
    )
    :vars
    (
      ?AUTO_4714 - BLOCK
      ?AUTO_4712 - BLOCK
      ?AUTO_4713 - BLOCK
      ?AUTO_4715 - BLOCK
      ?AUTO_4716 - BLOCK
      ?AUTO_4717 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4711 ?AUTO_4714 ) ( not ( = ?AUTO_4711 ?AUTO_4714 ) ) ( not ( = ?AUTO_4711 ?AUTO_4712 ) ) ( not ( = ?AUTO_4714 ?AUTO_4712 ) ) ( ON ?AUTO_4712 ?AUTO_4711 ) ( CLEAR ?AUTO_4713 ) ( not ( = ?AUTO_4711 ?AUTO_4715 ) ) ( not ( = ?AUTO_4711 ?AUTO_4713 ) ) ( not ( = ?AUTO_4714 ?AUTO_4715 ) ) ( not ( = ?AUTO_4714 ?AUTO_4713 ) ) ( not ( = ?AUTO_4712 ?AUTO_4715 ) ) ( not ( = ?AUTO_4712 ?AUTO_4713 ) ) ( not ( = ?AUTO_4715 ?AUTO_4713 ) ) ( ON ?AUTO_4715 ?AUTO_4712 ) ( CLEAR ?AUTO_4715 ) ( HOLDING ?AUTO_4716 ) ( CLEAR ?AUTO_4717 ) ( not ( = ?AUTO_4711 ?AUTO_4716 ) ) ( not ( = ?AUTO_4711 ?AUTO_4717 ) ) ( not ( = ?AUTO_4714 ?AUTO_4716 ) ) ( not ( = ?AUTO_4714 ?AUTO_4717 ) ) ( not ( = ?AUTO_4712 ?AUTO_4716 ) ) ( not ( = ?AUTO_4712 ?AUTO_4717 ) ) ( not ( = ?AUTO_4713 ?AUTO_4716 ) ) ( not ( = ?AUTO_4713 ?AUTO_4717 ) ) ( not ( = ?AUTO_4715 ?AUTO_4716 ) ) ( not ( = ?AUTO_4715 ?AUTO_4717 ) ) ( not ( = ?AUTO_4716 ?AUTO_4717 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4716 ?AUTO_4717 )
      ( MAKE-ON-TABLE ?AUTO_4711 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4711 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4731 - BLOCK
      ?AUTO_4732 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4731 ) ( CLEAR ?AUTO_4732 ) ( not ( = ?AUTO_4731 ?AUTO_4732 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4731 ?AUTO_4732 )
      ( MAKE-ON-VERIFY ?AUTO_4731 ?AUTO_4732 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4733 - BLOCK
      ?AUTO_4734 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4734 ) ( not ( = ?AUTO_4733 ?AUTO_4734 ) ) ( ON-TABLE ?AUTO_4733 ) ( CLEAR ?AUTO_4733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4733 )
      ( MAKE-ON ?AUTO_4733 ?AUTO_4734 )
      ( MAKE-ON-VERIFY ?AUTO_4733 ?AUTO_4734 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4735 - BLOCK
      ?AUTO_4736 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4735 ?AUTO_4736 ) ) ( ON-TABLE ?AUTO_4735 ) ( CLEAR ?AUTO_4735 ) ( HOLDING ?AUTO_4736 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4736 )
      ( MAKE-ON ?AUTO_4735 ?AUTO_4736 )
      ( MAKE-ON-VERIFY ?AUTO_4735 ?AUTO_4736 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4853 - BLOCK
      ?AUTO_4854 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4853 ) ( CLEAR ?AUTO_4854 ) ( not ( = ?AUTO_4853 ?AUTO_4854 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4853 ?AUTO_4854 )
      ( MAKE-ON-VERIFY ?AUTO_4853 ?AUTO_4854 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4855 - BLOCK
      ?AUTO_4856 - BLOCK
    )
    :vars
    (
      ?AUTO_4857 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4856 ) ( not ( = ?AUTO_4855 ?AUTO_4856 ) ) ( ON ?AUTO_4855 ?AUTO_4857 ) ( CLEAR ?AUTO_4855 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4855 ?AUTO_4857 ) ) ( not ( = ?AUTO_4856 ?AUTO_4857 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4855 ?AUTO_4857 )
      ( MAKE-ON ?AUTO_4855 ?AUTO_4856 )
      ( MAKE-ON-VERIFY ?AUTO_4855 ?AUTO_4856 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4858 - BLOCK
      ?AUTO_4859 - BLOCK
    )
    :vars
    (
      ?AUTO_4860 - BLOCK
      ?AUTO_4861 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4858 ?AUTO_4859 ) ) ( ON ?AUTO_4858 ?AUTO_4860 ) ( CLEAR ?AUTO_4858 ) ( not ( = ?AUTO_4858 ?AUTO_4860 ) ) ( not ( = ?AUTO_4859 ?AUTO_4860 ) ) ( HOLDING ?AUTO_4859 ) ( CLEAR ?AUTO_4861 ) ( not ( = ?AUTO_4858 ?AUTO_4861 ) ) ( not ( = ?AUTO_4859 ?AUTO_4861 ) ) ( not ( = ?AUTO_4860 ?AUTO_4861 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4859 ?AUTO_4861 )
      ( MAKE-ON ?AUTO_4858 ?AUTO_4859 )
      ( MAKE-ON-VERIFY ?AUTO_4858 ?AUTO_4859 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4864 - BLOCK
      ?AUTO_4865 - BLOCK
    )
    :vars
    (
      ?AUTO_4866 - BLOCK
      ?AUTO_4867 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4865 ) ( not ( = ?AUTO_4864 ?AUTO_4865 ) ) ( ON ?AUTO_4864 ?AUTO_4866 ) ( CLEAR ?AUTO_4864 ) ( not ( = ?AUTO_4864 ?AUTO_4866 ) ) ( not ( = ?AUTO_4865 ?AUTO_4866 ) ) ( HOLDING ?AUTO_4867 ) ( not ( = ?AUTO_4864 ?AUTO_4867 ) ) ( not ( = ?AUTO_4865 ?AUTO_4867 ) ) ( not ( = ?AUTO_4866 ?AUTO_4867 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4867 )
      ( MAKE-ON ?AUTO_4864 ?AUTO_4865 )
      ( MAKE-ON-VERIFY ?AUTO_4864 ?AUTO_4865 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4963 - BLOCK
      ?AUTO_4964 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4963 ) ( CLEAR ?AUTO_4964 ) ( not ( = ?AUTO_4963 ?AUTO_4964 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4963 ?AUTO_4964 )
      ( MAKE-ON-VERIFY ?AUTO_4963 ?AUTO_4964 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4965 - BLOCK
      ?AUTO_4966 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4966 ) ( not ( = ?AUTO_4965 ?AUTO_4966 ) ) ( ON-TABLE ?AUTO_4965 ) ( CLEAR ?AUTO_4965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4965 )
      ( MAKE-ON ?AUTO_4965 ?AUTO_4966 )
      ( MAKE-ON-VERIFY ?AUTO_4965 ?AUTO_4966 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4967 - BLOCK
      ?AUTO_4968 - BLOCK
    )
    :vars
    (
      ?AUTO_4969 - BLOCK
      ?AUTO_4970 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4968 ) ( not ( = ?AUTO_4967 ?AUTO_4968 ) ) ( ON-TABLE ?AUTO_4967 ) ( CLEAR ?AUTO_4967 ) ( HOLDING ?AUTO_4969 ) ( CLEAR ?AUTO_4970 ) ( not ( = ?AUTO_4967 ?AUTO_4969 ) ) ( not ( = ?AUTO_4967 ?AUTO_4970 ) ) ( not ( = ?AUTO_4968 ?AUTO_4969 ) ) ( not ( = ?AUTO_4968 ?AUTO_4970 ) ) ( not ( = ?AUTO_4969 ?AUTO_4970 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4969 ?AUTO_4970 )
      ( MAKE-ON ?AUTO_4967 ?AUTO_4968 )
      ( MAKE-ON-VERIFY ?AUTO_4967 ?AUTO_4968 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4971 - BLOCK
      ?AUTO_4972 - BLOCK
    )
    :vars
    (
      ?AUTO_4973 - BLOCK
      ?AUTO_4974 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4972 ) ( not ( = ?AUTO_4971 ?AUTO_4972 ) ) ( ON-TABLE ?AUTO_4971 ) ( CLEAR ?AUTO_4973 ) ( not ( = ?AUTO_4971 ?AUTO_4974 ) ) ( not ( = ?AUTO_4971 ?AUTO_4973 ) ) ( not ( = ?AUTO_4972 ?AUTO_4974 ) ) ( not ( = ?AUTO_4972 ?AUTO_4973 ) ) ( not ( = ?AUTO_4974 ?AUTO_4973 ) ) ( ON ?AUTO_4974 ?AUTO_4971 ) ( CLEAR ?AUTO_4974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4974 ?AUTO_4971 )
      ( MAKE-ON ?AUTO_4971 ?AUTO_4972 )
      ( MAKE-ON-VERIFY ?AUTO_4971 ?AUTO_4972 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4975 - BLOCK
      ?AUTO_4976 - BLOCK
    )
    :vars
    (
      ?AUTO_4977 - BLOCK
      ?AUTO_4978 - BLOCK
      ?AUTO_4979 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4976 ) ( not ( = ?AUTO_4975 ?AUTO_4976 ) ) ( ON-TABLE ?AUTO_4975 ) ( not ( = ?AUTO_4975 ?AUTO_4977 ) ) ( not ( = ?AUTO_4975 ?AUTO_4978 ) ) ( not ( = ?AUTO_4976 ?AUTO_4977 ) ) ( not ( = ?AUTO_4976 ?AUTO_4978 ) ) ( not ( = ?AUTO_4977 ?AUTO_4978 ) ) ( ON ?AUTO_4977 ?AUTO_4975 ) ( CLEAR ?AUTO_4977 ) ( HOLDING ?AUTO_4978 ) ( CLEAR ?AUTO_4979 ) ( not ( = ?AUTO_4975 ?AUTO_4979 ) ) ( not ( = ?AUTO_4976 ?AUTO_4979 ) ) ( not ( = ?AUTO_4977 ?AUTO_4979 ) ) ( not ( = ?AUTO_4978 ?AUTO_4979 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4978 ?AUTO_4979 )
      ( MAKE-ON ?AUTO_4975 ?AUTO_4976 )
      ( MAKE-ON-VERIFY ?AUTO_4975 ?AUTO_4976 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4984 - BLOCK
      ?AUTO_4985 - BLOCK
    )
    :vars
    (
      ?AUTO_4988 - BLOCK
      ?AUTO_4987 - BLOCK
      ?AUTO_4986 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4984 ?AUTO_4985 ) ) ( ON-TABLE ?AUTO_4984 ) ( not ( = ?AUTO_4984 ?AUTO_4988 ) ) ( not ( = ?AUTO_4984 ?AUTO_4987 ) ) ( not ( = ?AUTO_4985 ?AUTO_4988 ) ) ( not ( = ?AUTO_4985 ?AUTO_4987 ) ) ( not ( = ?AUTO_4988 ?AUTO_4987 ) ) ( ON ?AUTO_4988 ?AUTO_4984 ) ( CLEAR ?AUTO_4988 ) ( CLEAR ?AUTO_4986 ) ( not ( = ?AUTO_4984 ?AUTO_4986 ) ) ( not ( = ?AUTO_4985 ?AUTO_4986 ) ) ( not ( = ?AUTO_4988 ?AUTO_4986 ) ) ( not ( = ?AUTO_4987 ?AUTO_4986 ) ) ( ON ?AUTO_4987 ?AUTO_4985 ) ( CLEAR ?AUTO_4987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4987 ?AUTO_4985 )
      ( MAKE-ON ?AUTO_4984 ?AUTO_4985 )
      ( MAKE-ON-VERIFY ?AUTO_4984 ?AUTO_4985 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4989 - BLOCK
      ?AUTO_4990 - BLOCK
    )
    :vars
    (
      ?AUTO_4993 - BLOCK
      ?AUTO_4991 - BLOCK
      ?AUTO_4992 - BLOCK
      ?AUTO_4994 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4989 ?AUTO_4990 ) ) ( ON-TABLE ?AUTO_4989 ) ( not ( = ?AUTO_4989 ?AUTO_4993 ) ) ( not ( = ?AUTO_4989 ?AUTO_4991 ) ) ( not ( = ?AUTO_4990 ?AUTO_4993 ) ) ( not ( = ?AUTO_4990 ?AUTO_4991 ) ) ( not ( = ?AUTO_4993 ?AUTO_4991 ) ) ( ON ?AUTO_4993 ?AUTO_4989 ) ( CLEAR ?AUTO_4993 ) ( CLEAR ?AUTO_4992 ) ( not ( = ?AUTO_4989 ?AUTO_4992 ) ) ( not ( = ?AUTO_4990 ?AUTO_4992 ) ) ( not ( = ?AUTO_4993 ?AUTO_4992 ) ) ( not ( = ?AUTO_4991 ?AUTO_4992 ) ) ( ON ?AUTO_4991 ?AUTO_4990 ) ( CLEAR ?AUTO_4991 ) ( HOLDING ?AUTO_4994 ) ( not ( = ?AUTO_4989 ?AUTO_4994 ) ) ( not ( = ?AUTO_4990 ?AUTO_4994 ) ) ( not ( = ?AUTO_4993 ?AUTO_4994 ) ) ( not ( = ?AUTO_4991 ?AUTO_4994 ) ) ( not ( = ?AUTO_4992 ?AUTO_4994 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4994 )
      ( MAKE-ON ?AUTO_4989 ?AUTO_4990 )
      ( MAKE-ON-VERIFY ?AUTO_4989 ?AUTO_4990 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4995 - BLOCK
      ?AUTO_4996 - BLOCK
    )
    :vars
    (
      ?AUTO_5000 - BLOCK
      ?AUTO_4997 - BLOCK
      ?AUTO_4998 - BLOCK
      ?AUTO_4999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4995 ?AUTO_4996 ) ) ( ON-TABLE ?AUTO_4995 ) ( not ( = ?AUTO_4995 ?AUTO_5000 ) ) ( not ( = ?AUTO_4995 ?AUTO_4997 ) ) ( not ( = ?AUTO_4996 ?AUTO_5000 ) ) ( not ( = ?AUTO_4996 ?AUTO_4997 ) ) ( not ( = ?AUTO_5000 ?AUTO_4997 ) ) ( ON ?AUTO_5000 ?AUTO_4995 ) ( CLEAR ?AUTO_5000 ) ( CLEAR ?AUTO_4998 ) ( not ( = ?AUTO_4995 ?AUTO_4998 ) ) ( not ( = ?AUTO_4996 ?AUTO_4998 ) ) ( not ( = ?AUTO_5000 ?AUTO_4998 ) ) ( not ( = ?AUTO_4997 ?AUTO_4998 ) ) ( ON ?AUTO_4997 ?AUTO_4996 ) ( not ( = ?AUTO_4995 ?AUTO_4999 ) ) ( not ( = ?AUTO_4996 ?AUTO_4999 ) ) ( not ( = ?AUTO_5000 ?AUTO_4999 ) ) ( not ( = ?AUTO_4997 ?AUTO_4999 ) ) ( not ( = ?AUTO_4998 ?AUTO_4999 ) ) ( ON ?AUTO_4999 ?AUTO_4997 ) ( CLEAR ?AUTO_4999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4999 ?AUTO_4997 )
      ( MAKE-ON ?AUTO_4995 ?AUTO_4996 )
      ( MAKE-ON-VERIFY ?AUTO_4995 ?AUTO_4996 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5001 - BLOCK
      ?AUTO_5002 - BLOCK
    )
    :vars
    (
      ?AUTO_5005 - BLOCK
      ?AUTO_5006 - BLOCK
      ?AUTO_5004 - BLOCK
      ?AUTO_5003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5001 ?AUTO_5002 ) ) ( ON-TABLE ?AUTO_5001 ) ( not ( = ?AUTO_5001 ?AUTO_5005 ) ) ( not ( = ?AUTO_5001 ?AUTO_5006 ) ) ( not ( = ?AUTO_5002 ?AUTO_5005 ) ) ( not ( = ?AUTO_5002 ?AUTO_5006 ) ) ( not ( = ?AUTO_5005 ?AUTO_5006 ) ) ( CLEAR ?AUTO_5004 ) ( not ( = ?AUTO_5001 ?AUTO_5004 ) ) ( not ( = ?AUTO_5002 ?AUTO_5004 ) ) ( not ( = ?AUTO_5005 ?AUTO_5004 ) ) ( not ( = ?AUTO_5006 ?AUTO_5004 ) ) ( ON ?AUTO_5006 ?AUTO_5002 ) ( not ( = ?AUTO_5001 ?AUTO_5003 ) ) ( not ( = ?AUTO_5002 ?AUTO_5003 ) ) ( not ( = ?AUTO_5005 ?AUTO_5003 ) ) ( not ( = ?AUTO_5006 ?AUTO_5003 ) ) ( not ( = ?AUTO_5004 ?AUTO_5003 ) ) ( ON ?AUTO_5003 ?AUTO_5006 ) ( CLEAR ?AUTO_5003 ) ( HOLDING ?AUTO_5005 ) ( CLEAR ?AUTO_5001 ) )
    :subtasks
    ( ( !STACK ?AUTO_5005 ?AUTO_5001 )
      ( MAKE-ON ?AUTO_5001 ?AUTO_5002 )
      ( MAKE-ON-VERIFY ?AUTO_5001 ?AUTO_5002 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5007 - BLOCK
      ?AUTO_5008 - BLOCK
    )
    :vars
    (
      ?AUTO_5012 - BLOCK
      ?AUTO_5009 - BLOCK
      ?AUTO_5010 - BLOCK
      ?AUTO_5011 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5007 ?AUTO_5008 ) ) ( ON-TABLE ?AUTO_5007 ) ( not ( = ?AUTO_5007 ?AUTO_5012 ) ) ( not ( = ?AUTO_5007 ?AUTO_5009 ) ) ( not ( = ?AUTO_5008 ?AUTO_5012 ) ) ( not ( = ?AUTO_5008 ?AUTO_5009 ) ) ( not ( = ?AUTO_5012 ?AUTO_5009 ) ) ( CLEAR ?AUTO_5010 ) ( not ( = ?AUTO_5007 ?AUTO_5010 ) ) ( not ( = ?AUTO_5008 ?AUTO_5010 ) ) ( not ( = ?AUTO_5012 ?AUTO_5010 ) ) ( not ( = ?AUTO_5009 ?AUTO_5010 ) ) ( ON ?AUTO_5009 ?AUTO_5008 ) ( not ( = ?AUTO_5007 ?AUTO_5011 ) ) ( not ( = ?AUTO_5008 ?AUTO_5011 ) ) ( not ( = ?AUTO_5012 ?AUTO_5011 ) ) ( not ( = ?AUTO_5009 ?AUTO_5011 ) ) ( not ( = ?AUTO_5010 ?AUTO_5011 ) ) ( ON ?AUTO_5011 ?AUTO_5009 ) ( CLEAR ?AUTO_5007 ) ( ON ?AUTO_5012 ?AUTO_5011 ) ( CLEAR ?AUTO_5012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5012 ?AUTO_5011 )
      ( MAKE-ON ?AUTO_5007 ?AUTO_5008 )
      ( MAKE-ON-VERIFY ?AUTO_5007 ?AUTO_5008 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5013 - BLOCK
      ?AUTO_5014 - BLOCK
    )
    :vars
    (
      ?AUTO_5017 - BLOCK
      ?AUTO_5018 - BLOCK
      ?AUTO_5015 - BLOCK
      ?AUTO_5016 - BLOCK
      ?AUTO_5019 - BLOCK
      ?AUTO_5020 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5013 ?AUTO_5014 ) ) ( ON-TABLE ?AUTO_5013 ) ( not ( = ?AUTO_5013 ?AUTO_5017 ) ) ( not ( = ?AUTO_5013 ?AUTO_5018 ) ) ( not ( = ?AUTO_5014 ?AUTO_5017 ) ) ( not ( = ?AUTO_5014 ?AUTO_5018 ) ) ( not ( = ?AUTO_5017 ?AUTO_5018 ) ) ( CLEAR ?AUTO_5015 ) ( not ( = ?AUTO_5013 ?AUTO_5015 ) ) ( not ( = ?AUTO_5014 ?AUTO_5015 ) ) ( not ( = ?AUTO_5017 ?AUTO_5015 ) ) ( not ( = ?AUTO_5018 ?AUTO_5015 ) ) ( ON ?AUTO_5018 ?AUTO_5014 ) ( not ( = ?AUTO_5013 ?AUTO_5016 ) ) ( not ( = ?AUTO_5014 ?AUTO_5016 ) ) ( not ( = ?AUTO_5017 ?AUTO_5016 ) ) ( not ( = ?AUTO_5018 ?AUTO_5016 ) ) ( not ( = ?AUTO_5015 ?AUTO_5016 ) ) ( ON ?AUTO_5016 ?AUTO_5018 ) ( CLEAR ?AUTO_5013 ) ( ON ?AUTO_5017 ?AUTO_5016 ) ( CLEAR ?AUTO_5017 ) ( HOLDING ?AUTO_5019 ) ( CLEAR ?AUTO_5020 ) ( not ( = ?AUTO_5013 ?AUTO_5019 ) ) ( not ( = ?AUTO_5013 ?AUTO_5020 ) ) ( not ( = ?AUTO_5014 ?AUTO_5019 ) ) ( not ( = ?AUTO_5014 ?AUTO_5020 ) ) ( not ( = ?AUTO_5017 ?AUTO_5019 ) ) ( not ( = ?AUTO_5017 ?AUTO_5020 ) ) ( not ( = ?AUTO_5018 ?AUTO_5019 ) ) ( not ( = ?AUTO_5018 ?AUTO_5020 ) ) ( not ( = ?AUTO_5015 ?AUTO_5019 ) ) ( not ( = ?AUTO_5015 ?AUTO_5020 ) ) ( not ( = ?AUTO_5016 ?AUTO_5019 ) ) ( not ( = ?AUTO_5016 ?AUTO_5020 ) ) ( not ( = ?AUTO_5019 ?AUTO_5020 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5019 ?AUTO_5020 )
      ( MAKE-ON ?AUTO_5013 ?AUTO_5014 )
      ( MAKE-ON-VERIFY ?AUTO_5013 ?AUTO_5014 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5029 - BLOCK
      ?AUTO_5030 - BLOCK
    )
    :vars
    (
      ?AUTO_5033 - BLOCK
      ?AUTO_5035 - BLOCK
      ?AUTO_5036 - BLOCK
      ?AUTO_5031 - BLOCK
      ?AUTO_5034 - BLOCK
      ?AUTO_5032 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5029 ?AUTO_5030 ) ) ( ON-TABLE ?AUTO_5029 ) ( not ( = ?AUTO_5029 ?AUTO_5033 ) ) ( not ( = ?AUTO_5029 ?AUTO_5035 ) ) ( not ( = ?AUTO_5030 ?AUTO_5033 ) ) ( not ( = ?AUTO_5030 ?AUTO_5035 ) ) ( not ( = ?AUTO_5033 ?AUTO_5035 ) ) ( CLEAR ?AUTO_5036 ) ( not ( = ?AUTO_5029 ?AUTO_5036 ) ) ( not ( = ?AUTO_5030 ?AUTO_5036 ) ) ( not ( = ?AUTO_5033 ?AUTO_5036 ) ) ( not ( = ?AUTO_5035 ?AUTO_5036 ) ) ( ON ?AUTO_5035 ?AUTO_5030 ) ( not ( = ?AUTO_5029 ?AUTO_5031 ) ) ( not ( = ?AUTO_5030 ?AUTO_5031 ) ) ( not ( = ?AUTO_5033 ?AUTO_5031 ) ) ( not ( = ?AUTO_5035 ?AUTO_5031 ) ) ( not ( = ?AUTO_5036 ?AUTO_5031 ) ) ( ON ?AUTO_5031 ?AUTO_5035 ) ( ON ?AUTO_5033 ?AUTO_5031 ) ( CLEAR ?AUTO_5033 ) ( CLEAR ?AUTO_5034 ) ( not ( = ?AUTO_5029 ?AUTO_5032 ) ) ( not ( = ?AUTO_5029 ?AUTO_5034 ) ) ( not ( = ?AUTO_5030 ?AUTO_5032 ) ) ( not ( = ?AUTO_5030 ?AUTO_5034 ) ) ( not ( = ?AUTO_5033 ?AUTO_5032 ) ) ( not ( = ?AUTO_5033 ?AUTO_5034 ) ) ( not ( = ?AUTO_5035 ?AUTO_5032 ) ) ( not ( = ?AUTO_5035 ?AUTO_5034 ) ) ( not ( = ?AUTO_5036 ?AUTO_5032 ) ) ( not ( = ?AUTO_5036 ?AUTO_5034 ) ) ( not ( = ?AUTO_5031 ?AUTO_5032 ) ) ( not ( = ?AUTO_5031 ?AUTO_5034 ) ) ( not ( = ?AUTO_5032 ?AUTO_5034 ) ) ( ON ?AUTO_5032 ?AUTO_5029 ) ( CLEAR ?AUTO_5032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5032 ?AUTO_5029 )
      ( MAKE-ON ?AUTO_5029 ?AUTO_5030 )
      ( MAKE-ON-VERIFY ?AUTO_5029 ?AUTO_5030 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5037 - BLOCK
      ?AUTO_5038 - BLOCK
    )
    :vars
    (
      ?AUTO_5039 - BLOCK
      ?AUTO_5043 - BLOCK
      ?AUTO_5040 - BLOCK
      ?AUTO_5042 - BLOCK
      ?AUTO_5044 - BLOCK
      ?AUTO_5041 - BLOCK
      ?AUTO_5045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5037 ?AUTO_5038 ) ) ( ON-TABLE ?AUTO_5037 ) ( not ( = ?AUTO_5037 ?AUTO_5039 ) ) ( not ( = ?AUTO_5037 ?AUTO_5043 ) ) ( not ( = ?AUTO_5038 ?AUTO_5039 ) ) ( not ( = ?AUTO_5038 ?AUTO_5043 ) ) ( not ( = ?AUTO_5039 ?AUTO_5043 ) ) ( CLEAR ?AUTO_5040 ) ( not ( = ?AUTO_5037 ?AUTO_5040 ) ) ( not ( = ?AUTO_5038 ?AUTO_5040 ) ) ( not ( = ?AUTO_5039 ?AUTO_5040 ) ) ( not ( = ?AUTO_5043 ?AUTO_5040 ) ) ( ON ?AUTO_5043 ?AUTO_5038 ) ( not ( = ?AUTO_5037 ?AUTO_5042 ) ) ( not ( = ?AUTO_5038 ?AUTO_5042 ) ) ( not ( = ?AUTO_5039 ?AUTO_5042 ) ) ( not ( = ?AUTO_5043 ?AUTO_5042 ) ) ( not ( = ?AUTO_5040 ?AUTO_5042 ) ) ( ON ?AUTO_5042 ?AUTO_5043 ) ( ON ?AUTO_5039 ?AUTO_5042 ) ( CLEAR ?AUTO_5039 ) ( CLEAR ?AUTO_5044 ) ( not ( = ?AUTO_5037 ?AUTO_5041 ) ) ( not ( = ?AUTO_5037 ?AUTO_5044 ) ) ( not ( = ?AUTO_5038 ?AUTO_5041 ) ) ( not ( = ?AUTO_5038 ?AUTO_5044 ) ) ( not ( = ?AUTO_5039 ?AUTO_5041 ) ) ( not ( = ?AUTO_5039 ?AUTO_5044 ) ) ( not ( = ?AUTO_5043 ?AUTO_5041 ) ) ( not ( = ?AUTO_5043 ?AUTO_5044 ) ) ( not ( = ?AUTO_5040 ?AUTO_5041 ) ) ( not ( = ?AUTO_5040 ?AUTO_5044 ) ) ( not ( = ?AUTO_5042 ?AUTO_5041 ) ) ( not ( = ?AUTO_5042 ?AUTO_5044 ) ) ( not ( = ?AUTO_5041 ?AUTO_5044 ) ) ( ON ?AUTO_5041 ?AUTO_5037 ) ( CLEAR ?AUTO_5041 ) ( HOLDING ?AUTO_5045 ) ( not ( = ?AUTO_5037 ?AUTO_5045 ) ) ( not ( = ?AUTO_5038 ?AUTO_5045 ) ) ( not ( = ?AUTO_5039 ?AUTO_5045 ) ) ( not ( = ?AUTO_5043 ?AUTO_5045 ) ) ( not ( = ?AUTO_5040 ?AUTO_5045 ) ) ( not ( = ?AUTO_5042 ?AUTO_5045 ) ) ( not ( = ?AUTO_5044 ?AUTO_5045 ) ) ( not ( = ?AUTO_5041 ?AUTO_5045 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5045 )
      ( MAKE-ON ?AUTO_5037 ?AUTO_5038 )
      ( MAKE-ON-VERIFY ?AUTO_5037 ?AUTO_5038 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5046 - BLOCK
      ?AUTO_5047 - BLOCK
    )
    :vars
    (
      ?AUTO_5054 - BLOCK
      ?AUTO_5052 - BLOCK
      ?AUTO_5051 - BLOCK
      ?AUTO_5053 - BLOCK
      ?AUTO_5049 - BLOCK
      ?AUTO_5050 - BLOCK
      ?AUTO_5048 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5046 ?AUTO_5047 ) ) ( ON-TABLE ?AUTO_5046 ) ( not ( = ?AUTO_5046 ?AUTO_5054 ) ) ( not ( = ?AUTO_5046 ?AUTO_5052 ) ) ( not ( = ?AUTO_5047 ?AUTO_5054 ) ) ( not ( = ?AUTO_5047 ?AUTO_5052 ) ) ( not ( = ?AUTO_5054 ?AUTO_5052 ) ) ( CLEAR ?AUTO_5051 ) ( not ( = ?AUTO_5046 ?AUTO_5051 ) ) ( not ( = ?AUTO_5047 ?AUTO_5051 ) ) ( not ( = ?AUTO_5054 ?AUTO_5051 ) ) ( not ( = ?AUTO_5052 ?AUTO_5051 ) ) ( ON ?AUTO_5052 ?AUTO_5047 ) ( not ( = ?AUTO_5046 ?AUTO_5053 ) ) ( not ( = ?AUTO_5047 ?AUTO_5053 ) ) ( not ( = ?AUTO_5054 ?AUTO_5053 ) ) ( not ( = ?AUTO_5052 ?AUTO_5053 ) ) ( not ( = ?AUTO_5051 ?AUTO_5053 ) ) ( ON ?AUTO_5053 ?AUTO_5052 ) ( ON ?AUTO_5054 ?AUTO_5053 ) ( CLEAR ?AUTO_5054 ) ( CLEAR ?AUTO_5049 ) ( not ( = ?AUTO_5046 ?AUTO_5050 ) ) ( not ( = ?AUTO_5046 ?AUTO_5049 ) ) ( not ( = ?AUTO_5047 ?AUTO_5050 ) ) ( not ( = ?AUTO_5047 ?AUTO_5049 ) ) ( not ( = ?AUTO_5054 ?AUTO_5050 ) ) ( not ( = ?AUTO_5054 ?AUTO_5049 ) ) ( not ( = ?AUTO_5052 ?AUTO_5050 ) ) ( not ( = ?AUTO_5052 ?AUTO_5049 ) ) ( not ( = ?AUTO_5051 ?AUTO_5050 ) ) ( not ( = ?AUTO_5051 ?AUTO_5049 ) ) ( not ( = ?AUTO_5053 ?AUTO_5050 ) ) ( not ( = ?AUTO_5053 ?AUTO_5049 ) ) ( not ( = ?AUTO_5050 ?AUTO_5049 ) ) ( ON ?AUTO_5050 ?AUTO_5046 ) ( not ( = ?AUTO_5046 ?AUTO_5048 ) ) ( not ( = ?AUTO_5047 ?AUTO_5048 ) ) ( not ( = ?AUTO_5054 ?AUTO_5048 ) ) ( not ( = ?AUTO_5052 ?AUTO_5048 ) ) ( not ( = ?AUTO_5051 ?AUTO_5048 ) ) ( not ( = ?AUTO_5053 ?AUTO_5048 ) ) ( not ( = ?AUTO_5049 ?AUTO_5048 ) ) ( not ( = ?AUTO_5050 ?AUTO_5048 ) ) ( ON ?AUTO_5048 ?AUTO_5050 ) ( CLEAR ?AUTO_5048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5048 ?AUTO_5050 )
      ( MAKE-ON ?AUTO_5046 ?AUTO_5047 )
      ( MAKE-ON-VERIFY ?AUTO_5046 ?AUTO_5047 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5055 - BLOCK
      ?AUTO_5056 - BLOCK
    )
    :vars
    (
      ?AUTO_5058 - BLOCK
      ?AUTO_5060 - BLOCK
      ?AUTO_5061 - BLOCK
      ?AUTO_5059 - BLOCK
      ?AUTO_5063 - BLOCK
      ?AUTO_5062 - BLOCK
      ?AUTO_5057 - BLOCK
      ?AUTO_5064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5055 ?AUTO_5056 ) ) ( ON-TABLE ?AUTO_5055 ) ( not ( = ?AUTO_5055 ?AUTO_5058 ) ) ( not ( = ?AUTO_5055 ?AUTO_5060 ) ) ( not ( = ?AUTO_5056 ?AUTO_5058 ) ) ( not ( = ?AUTO_5056 ?AUTO_5060 ) ) ( not ( = ?AUTO_5058 ?AUTO_5060 ) ) ( CLEAR ?AUTO_5061 ) ( not ( = ?AUTO_5055 ?AUTO_5061 ) ) ( not ( = ?AUTO_5056 ?AUTO_5061 ) ) ( not ( = ?AUTO_5058 ?AUTO_5061 ) ) ( not ( = ?AUTO_5060 ?AUTO_5061 ) ) ( ON ?AUTO_5060 ?AUTO_5056 ) ( not ( = ?AUTO_5055 ?AUTO_5059 ) ) ( not ( = ?AUTO_5056 ?AUTO_5059 ) ) ( not ( = ?AUTO_5058 ?AUTO_5059 ) ) ( not ( = ?AUTO_5060 ?AUTO_5059 ) ) ( not ( = ?AUTO_5061 ?AUTO_5059 ) ) ( ON ?AUTO_5059 ?AUTO_5060 ) ( ON ?AUTO_5058 ?AUTO_5059 ) ( CLEAR ?AUTO_5058 ) ( CLEAR ?AUTO_5063 ) ( not ( = ?AUTO_5055 ?AUTO_5062 ) ) ( not ( = ?AUTO_5055 ?AUTO_5063 ) ) ( not ( = ?AUTO_5056 ?AUTO_5062 ) ) ( not ( = ?AUTO_5056 ?AUTO_5063 ) ) ( not ( = ?AUTO_5058 ?AUTO_5062 ) ) ( not ( = ?AUTO_5058 ?AUTO_5063 ) ) ( not ( = ?AUTO_5060 ?AUTO_5062 ) ) ( not ( = ?AUTO_5060 ?AUTO_5063 ) ) ( not ( = ?AUTO_5061 ?AUTO_5062 ) ) ( not ( = ?AUTO_5061 ?AUTO_5063 ) ) ( not ( = ?AUTO_5059 ?AUTO_5062 ) ) ( not ( = ?AUTO_5059 ?AUTO_5063 ) ) ( not ( = ?AUTO_5062 ?AUTO_5063 ) ) ( ON ?AUTO_5062 ?AUTO_5055 ) ( not ( = ?AUTO_5055 ?AUTO_5057 ) ) ( not ( = ?AUTO_5056 ?AUTO_5057 ) ) ( not ( = ?AUTO_5058 ?AUTO_5057 ) ) ( not ( = ?AUTO_5060 ?AUTO_5057 ) ) ( not ( = ?AUTO_5061 ?AUTO_5057 ) ) ( not ( = ?AUTO_5059 ?AUTO_5057 ) ) ( not ( = ?AUTO_5063 ?AUTO_5057 ) ) ( not ( = ?AUTO_5062 ?AUTO_5057 ) ) ( ON ?AUTO_5057 ?AUTO_5062 ) ( CLEAR ?AUTO_5057 ) ( HOLDING ?AUTO_5064 ) ( not ( = ?AUTO_5055 ?AUTO_5064 ) ) ( not ( = ?AUTO_5056 ?AUTO_5064 ) ) ( not ( = ?AUTO_5058 ?AUTO_5064 ) ) ( not ( = ?AUTO_5060 ?AUTO_5064 ) ) ( not ( = ?AUTO_5061 ?AUTO_5064 ) ) ( not ( = ?AUTO_5059 ?AUTO_5064 ) ) ( not ( = ?AUTO_5063 ?AUTO_5064 ) ) ( not ( = ?AUTO_5062 ?AUTO_5064 ) ) ( not ( = ?AUTO_5057 ?AUTO_5064 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5064 )
      ( MAKE-ON ?AUTO_5055 ?AUTO_5056 )
      ( MAKE-ON-VERIFY ?AUTO_5055 ?AUTO_5056 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5065 - BLOCK
      ?AUTO_5066 - BLOCK
    )
    :vars
    (
      ?AUTO_5069 - BLOCK
      ?AUTO_5073 - BLOCK
      ?AUTO_5072 - BLOCK
      ?AUTO_5071 - BLOCK
      ?AUTO_5070 - BLOCK
      ?AUTO_5068 - BLOCK
      ?AUTO_5067 - BLOCK
      ?AUTO_5074 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5065 ?AUTO_5066 ) ) ( ON-TABLE ?AUTO_5065 ) ( not ( = ?AUTO_5065 ?AUTO_5069 ) ) ( not ( = ?AUTO_5065 ?AUTO_5073 ) ) ( not ( = ?AUTO_5066 ?AUTO_5069 ) ) ( not ( = ?AUTO_5066 ?AUTO_5073 ) ) ( not ( = ?AUTO_5069 ?AUTO_5073 ) ) ( CLEAR ?AUTO_5072 ) ( not ( = ?AUTO_5065 ?AUTO_5072 ) ) ( not ( = ?AUTO_5066 ?AUTO_5072 ) ) ( not ( = ?AUTO_5069 ?AUTO_5072 ) ) ( not ( = ?AUTO_5073 ?AUTO_5072 ) ) ( ON ?AUTO_5073 ?AUTO_5066 ) ( not ( = ?AUTO_5065 ?AUTO_5071 ) ) ( not ( = ?AUTO_5066 ?AUTO_5071 ) ) ( not ( = ?AUTO_5069 ?AUTO_5071 ) ) ( not ( = ?AUTO_5073 ?AUTO_5071 ) ) ( not ( = ?AUTO_5072 ?AUTO_5071 ) ) ( ON ?AUTO_5071 ?AUTO_5073 ) ( ON ?AUTO_5069 ?AUTO_5071 ) ( CLEAR ?AUTO_5069 ) ( CLEAR ?AUTO_5070 ) ( not ( = ?AUTO_5065 ?AUTO_5068 ) ) ( not ( = ?AUTO_5065 ?AUTO_5070 ) ) ( not ( = ?AUTO_5066 ?AUTO_5068 ) ) ( not ( = ?AUTO_5066 ?AUTO_5070 ) ) ( not ( = ?AUTO_5069 ?AUTO_5068 ) ) ( not ( = ?AUTO_5069 ?AUTO_5070 ) ) ( not ( = ?AUTO_5073 ?AUTO_5068 ) ) ( not ( = ?AUTO_5073 ?AUTO_5070 ) ) ( not ( = ?AUTO_5072 ?AUTO_5068 ) ) ( not ( = ?AUTO_5072 ?AUTO_5070 ) ) ( not ( = ?AUTO_5071 ?AUTO_5068 ) ) ( not ( = ?AUTO_5071 ?AUTO_5070 ) ) ( not ( = ?AUTO_5068 ?AUTO_5070 ) ) ( ON ?AUTO_5068 ?AUTO_5065 ) ( not ( = ?AUTO_5065 ?AUTO_5067 ) ) ( not ( = ?AUTO_5066 ?AUTO_5067 ) ) ( not ( = ?AUTO_5069 ?AUTO_5067 ) ) ( not ( = ?AUTO_5073 ?AUTO_5067 ) ) ( not ( = ?AUTO_5072 ?AUTO_5067 ) ) ( not ( = ?AUTO_5071 ?AUTO_5067 ) ) ( not ( = ?AUTO_5070 ?AUTO_5067 ) ) ( not ( = ?AUTO_5068 ?AUTO_5067 ) ) ( ON ?AUTO_5067 ?AUTO_5068 ) ( not ( = ?AUTO_5065 ?AUTO_5074 ) ) ( not ( = ?AUTO_5066 ?AUTO_5074 ) ) ( not ( = ?AUTO_5069 ?AUTO_5074 ) ) ( not ( = ?AUTO_5073 ?AUTO_5074 ) ) ( not ( = ?AUTO_5072 ?AUTO_5074 ) ) ( not ( = ?AUTO_5071 ?AUTO_5074 ) ) ( not ( = ?AUTO_5070 ?AUTO_5074 ) ) ( not ( = ?AUTO_5068 ?AUTO_5074 ) ) ( not ( = ?AUTO_5067 ?AUTO_5074 ) ) ( ON ?AUTO_5074 ?AUTO_5067 ) ( CLEAR ?AUTO_5074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5074 ?AUTO_5067 )
      ( MAKE-ON ?AUTO_5065 ?AUTO_5066 )
      ( MAKE-ON-VERIFY ?AUTO_5065 ?AUTO_5066 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5075 - BLOCK
      ?AUTO_5076 - BLOCK
    )
    :vars
    (
      ?AUTO_5084 - BLOCK
      ?AUTO_5080 - BLOCK
      ?AUTO_5081 - BLOCK
      ?AUTO_5082 - BLOCK
      ?AUTO_5083 - BLOCK
      ?AUTO_5077 - BLOCK
      ?AUTO_5078 - BLOCK
      ?AUTO_5079 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5075 ?AUTO_5076 ) ) ( ON-TABLE ?AUTO_5075 ) ( not ( = ?AUTO_5075 ?AUTO_5084 ) ) ( not ( = ?AUTO_5075 ?AUTO_5080 ) ) ( not ( = ?AUTO_5076 ?AUTO_5084 ) ) ( not ( = ?AUTO_5076 ?AUTO_5080 ) ) ( not ( = ?AUTO_5084 ?AUTO_5080 ) ) ( not ( = ?AUTO_5075 ?AUTO_5081 ) ) ( not ( = ?AUTO_5076 ?AUTO_5081 ) ) ( not ( = ?AUTO_5084 ?AUTO_5081 ) ) ( not ( = ?AUTO_5080 ?AUTO_5081 ) ) ( ON ?AUTO_5080 ?AUTO_5076 ) ( not ( = ?AUTO_5075 ?AUTO_5082 ) ) ( not ( = ?AUTO_5076 ?AUTO_5082 ) ) ( not ( = ?AUTO_5084 ?AUTO_5082 ) ) ( not ( = ?AUTO_5080 ?AUTO_5082 ) ) ( not ( = ?AUTO_5081 ?AUTO_5082 ) ) ( ON ?AUTO_5082 ?AUTO_5080 ) ( ON ?AUTO_5084 ?AUTO_5082 ) ( CLEAR ?AUTO_5084 ) ( CLEAR ?AUTO_5083 ) ( not ( = ?AUTO_5075 ?AUTO_5077 ) ) ( not ( = ?AUTO_5075 ?AUTO_5083 ) ) ( not ( = ?AUTO_5076 ?AUTO_5077 ) ) ( not ( = ?AUTO_5076 ?AUTO_5083 ) ) ( not ( = ?AUTO_5084 ?AUTO_5077 ) ) ( not ( = ?AUTO_5084 ?AUTO_5083 ) ) ( not ( = ?AUTO_5080 ?AUTO_5077 ) ) ( not ( = ?AUTO_5080 ?AUTO_5083 ) ) ( not ( = ?AUTO_5081 ?AUTO_5077 ) ) ( not ( = ?AUTO_5081 ?AUTO_5083 ) ) ( not ( = ?AUTO_5082 ?AUTO_5077 ) ) ( not ( = ?AUTO_5082 ?AUTO_5083 ) ) ( not ( = ?AUTO_5077 ?AUTO_5083 ) ) ( ON ?AUTO_5077 ?AUTO_5075 ) ( not ( = ?AUTO_5075 ?AUTO_5078 ) ) ( not ( = ?AUTO_5076 ?AUTO_5078 ) ) ( not ( = ?AUTO_5084 ?AUTO_5078 ) ) ( not ( = ?AUTO_5080 ?AUTO_5078 ) ) ( not ( = ?AUTO_5081 ?AUTO_5078 ) ) ( not ( = ?AUTO_5082 ?AUTO_5078 ) ) ( not ( = ?AUTO_5083 ?AUTO_5078 ) ) ( not ( = ?AUTO_5077 ?AUTO_5078 ) ) ( ON ?AUTO_5078 ?AUTO_5077 ) ( not ( = ?AUTO_5075 ?AUTO_5079 ) ) ( not ( = ?AUTO_5076 ?AUTO_5079 ) ) ( not ( = ?AUTO_5084 ?AUTO_5079 ) ) ( not ( = ?AUTO_5080 ?AUTO_5079 ) ) ( not ( = ?AUTO_5081 ?AUTO_5079 ) ) ( not ( = ?AUTO_5082 ?AUTO_5079 ) ) ( not ( = ?AUTO_5083 ?AUTO_5079 ) ) ( not ( = ?AUTO_5077 ?AUTO_5079 ) ) ( not ( = ?AUTO_5078 ?AUTO_5079 ) ) ( ON ?AUTO_5079 ?AUTO_5078 ) ( CLEAR ?AUTO_5079 ) ( HOLDING ?AUTO_5081 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5081 )
      ( MAKE-ON ?AUTO_5075 ?AUTO_5076 )
      ( MAKE-ON-VERIFY ?AUTO_5075 ?AUTO_5076 ) )
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
      ?AUTO_5094 - BLOCK
      ?AUTO_5093 - BLOCK
      ?AUTO_5087 - BLOCK
      ?AUTO_5090 - BLOCK
      ?AUTO_5092 - BLOCK
      ?AUTO_5091 - BLOCK
      ?AUTO_5088 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5085 ?AUTO_5086 ) ) ( ON-TABLE ?AUTO_5085 ) ( not ( = ?AUTO_5085 ?AUTO_5089 ) ) ( not ( = ?AUTO_5085 ?AUTO_5094 ) ) ( not ( = ?AUTO_5086 ?AUTO_5089 ) ) ( not ( = ?AUTO_5086 ?AUTO_5094 ) ) ( not ( = ?AUTO_5089 ?AUTO_5094 ) ) ( not ( = ?AUTO_5085 ?AUTO_5093 ) ) ( not ( = ?AUTO_5086 ?AUTO_5093 ) ) ( not ( = ?AUTO_5089 ?AUTO_5093 ) ) ( not ( = ?AUTO_5094 ?AUTO_5093 ) ) ( ON ?AUTO_5094 ?AUTO_5086 ) ( not ( = ?AUTO_5085 ?AUTO_5087 ) ) ( not ( = ?AUTO_5086 ?AUTO_5087 ) ) ( not ( = ?AUTO_5089 ?AUTO_5087 ) ) ( not ( = ?AUTO_5094 ?AUTO_5087 ) ) ( not ( = ?AUTO_5093 ?AUTO_5087 ) ) ( ON ?AUTO_5087 ?AUTO_5094 ) ( ON ?AUTO_5089 ?AUTO_5087 ) ( CLEAR ?AUTO_5089 ) ( CLEAR ?AUTO_5090 ) ( not ( = ?AUTO_5085 ?AUTO_5092 ) ) ( not ( = ?AUTO_5085 ?AUTO_5090 ) ) ( not ( = ?AUTO_5086 ?AUTO_5092 ) ) ( not ( = ?AUTO_5086 ?AUTO_5090 ) ) ( not ( = ?AUTO_5089 ?AUTO_5092 ) ) ( not ( = ?AUTO_5089 ?AUTO_5090 ) ) ( not ( = ?AUTO_5094 ?AUTO_5092 ) ) ( not ( = ?AUTO_5094 ?AUTO_5090 ) ) ( not ( = ?AUTO_5093 ?AUTO_5092 ) ) ( not ( = ?AUTO_5093 ?AUTO_5090 ) ) ( not ( = ?AUTO_5087 ?AUTO_5092 ) ) ( not ( = ?AUTO_5087 ?AUTO_5090 ) ) ( not ( = ?AUTO_5092 ?AUTO_5090 ) ) ( ON ?AUTO_5092 ?AUTO_5085 ) ( not ( = ?AUTO_5085 ?AUTO_5091 ) ) ( not ( = ?AUTO_5086 ?AUTO_5091 ) ) ( not ( = ?AUTO_5089 ?AUTO_5091 ) ) ( not ( = ?AUTO_5094 ?AUTO_5091 ) ) ( not ( = ?AUTO_5093 ?AUTO_5091 ) ) ( not ( = ?AUTO_5087 ?AUTO_5091 ) ) ( not ( = ?AUTO_5090 ?AUTO_5091 ) ) ( not ( = ?AUTO_5092 ?AUTO_5091 ) ) ( ON ?AUTO_5091 ?AUTO_5092 ) ( not ( = ?AUTO_5085 ?AUTO_5088 ) ) ( not ( = ?AUTO_5086 ?AUTO_5088 ) ) ( not ( = ?AUTO_5089 ?AUTO_5088 ) ) ( not ( = ?AUTO_5094 ?AUTO_5088 ) ) ( not ( = ?AUTO_5093 ?AUTO_5088 ) ) ( not ( = ?AUTO_5087 ?AUTO_5088 ) ) ( not ( = ?AUTO_5090 ?AUTO_5088 ) ) ( not ( = ?AUTO_5092 ?AUTO_5088 ) ) ( not ( = ?AUTO_5091 ?AUTO_5088 ) ) ( ON ?AUTO_5088 ?AUTO_5091 ) ( ON ?AUTO_5093 ?AUTO_5088 ) ( CLEAR ?AUTO_5093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5093 ?AUTO_5088 )
      ( MAKE-ON ?AUTO_5085 ?AUTO_5086 )
      ( MAKE-ON-VERIFY ?AUTO_5085 ?AUTO_5086 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5096 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5096 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5096 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5096 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5097 - BLOCK
    )
    :vars
    (
      ?AUTO_5098 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5097 ?AUTO_5098 ) ( CLEAR ?AUTO_5097 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5097 ?AUTO_5098 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5097 ?AUTO_5098 )
      ( MAKE-ON-TABLE ?AUTO_5097 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5097 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5100 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5100 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5100 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5100 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5101 - BLOCK
    )
    :vars
    (
      ?AUTO_5102 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5101 ?AUTO_5102 ) ( CLEAR ?AUTO_5101 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5101 ?AUTO_5102 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5101 ?AUTO_5102 )
      ( MAKE-ON-TABLE ?AUTO_5101 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5101 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5103 - BLOCK
    )
    :vars
    (
      ?AUTO_5104 - BLOCK
      ?AUTO_5105 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5103 ?AUTO_5104 ) ( CLEAR ?AUTO_5103 ) ( not ( = ?AUTO_5103 ?AUTO_5104 ) ) ( HOLDING ?AUTO_5105 ) ( not ( = ?AUTO_5103 ?AUTO_5105 ) ) ( not ( = ?AUTO_5104 ?AUTO_5105 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5105 )
      ( MAKE-ON-TABLE ?AUTO_5103 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5103 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5106 - BLOCK
    )
    :vars
    (
      ?AUTO_5107 - BLOCK
      ?AUTO_5108 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5106 ?AUTO_5107 ) ( not ( = ?AUTO_5106 ?AUTO_5107 ) ) ( not ( = ?AUTO_5106 ?AUTO_5108 ) ) ( not ( = ?AUTO_5107 ?AUTO_5108 ) ) ( ON ?AUTO_5108 ?AUTO_5106 ) ( CLEAR ?AUTO_5108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5108 ?AUTO_5106 )
      ( MAKE-ON-TABLE ?AUTO_5106 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5106 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5110 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5110 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5110 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5110 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5111 - BLOCK
    )
    :vars
    (
      ?AUTO_5112 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5111 ?AUTO_5112 ) ( CLEAR ?AUTO_5111 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5111 ?AUTO_5112 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5111 ?AUTO_5112 )
      ( MAKE-ON-TABLE ?AUTO_5111 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5111 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5113 - BLOCK
    )
    :vars
    (
      ?AUTO_5114 - BLOCK
      ?AUTO_5115 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5113 ?AUTO_5114 ) ( CLEAR ?AUTO_5113 ) ( not ( = ?AUTO_5113 ?AUTO_5114 ) ) ( HOLDING ?AUTO_5115 ) ( not ( = ?AUTO_5113 ?AUTO_5115 ) ) ( not ( = ?AUTO_5114 ?AUTO_5115 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5115 )
      ( MAKE-ON-TABLE ?AUTO_5113 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5113 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5116 - BLOCK
    )
    :vars
    (
      ?AUTO_5117 - BLOCK
      ?AUTO_5118 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5116 ?AUTO_5117 ) ( not ( = ?AUTO_5116 ?AUTO_5117 ) ) ( not ( = ?AUTO_5116 ?AUTO_5118 ) ) ( not ( = ?AUTO_5117 ?AUTO_5118 ) ) ( ON ?AUTO_5118 ?AUTO_5116 ) ( CLEAR ?AUTO_5118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5118 ?AUTO_5116 )
      ( MAKE-ON-TABLE ?AUTO_5116 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5116 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5119 - BLOCK
    )
    :vars
    (
      ?AUTO_5120 - BLOCK
      ?AUTO_5121 - BLOCK
      ?AUTO_5122 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5119 ?AUTO_5120 ) ( not ( = ?AUTO_5119 ?AUTO_5120 ) ) ( not ( = ?AUTO_5119 ?AUTO_5121 ) ) ( not ( = ?AUTO_5120 ?AUTO_5121 ) ) ( ON ?AUTO_5121 ?AUTO_5119 ) ( CLEAR ?AUTO_5121 ) ( HOLDING ?AUTO_5122 ) ( not ( = ?AUTO_5119 ?AUTO_5122 ) ) ( not ( = ?AUTO_5120 ?AUTO_5122 ) ) ( not ( = ?AUTO_5121 ?AUTO_5122 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5122 )
      ( MAKE-ON-TABLE ?AUTO_5119 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5119 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5123 - BLOCK
    )
    :vars
    (
      ?AUTO_5124 - BLOCK
      ?AUTO_5125 - BLOCK
      ?AUTO_5126 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5123 ?AUTO_5124 ) ( not ( = ?AUTO_5123 ?AUTO_5124 ) ) ( not ( = ?AUTO_5123 ?AUTO_5125 ) ) ( not ( = ?AUTO_5124 ?AUTO_5125 ) ) ( ON ?AUTO_5125 ?AUTO_5123 ) ( not ( = ?AUTO_5123 ?AUTO_5126 ) ) ( not ( = ?AUTO_5124 ?AUTO_5126 ) ) ( not ( = ?AUTO_5125 ?AUTO_5126 ) ) ( ON ?AUTO_5126 ?AUTO_5125 ) ( CLEAR ?AUTO_5126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5126 ?AUTO_5125 )
      ( MAKE-ON-TABLE ?AUTO_5123 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5123 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5128 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5128 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5128 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5128 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5129 - BLOCK
    )
    :vars
    (
      ?AUTO_5130 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5129 ?AUTO_5130 ) ( CLEAR ?AUTO_5129 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5129 ?AUTO_5130 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5129 ?AUTO_5130 )
      ( MAKE-ON-TABLE ?AUTO_5129 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5129 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5131 - BLOCK
    )
    :vars
    (
      ?AUTO_5132 - BLOCK
      ?AUTO_5133 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5131 ?AUTO_5132 ) ( CLEAR ?AUTO_5131 ) ( not ( = ?AUTO_5131 ?AUTO_5132 ) ) ( HOLDING ?AUTO_5133 ) ( not ( = ?AUTO_5131 ?AUTO_5133 ) ) ( not ( = ?AUTO_5132 ?AUTO_5133 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5133 )
      ( MAKE-ON-TABLE ?AUTO_5131 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5131 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5134 - BLOCK
    )
    :vars
    (
      ?AUTO_5135 - BLOCK
      ?AUTO_5136 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5134 ?AUTO_5135 ) ( not ( = ?AUTO_5134 ?AUTO_5135 ) ) ( not ( = ?AUTO_5134 ?AUTO_5136 ) ) ( not ( = ?AUTO_5135 ?AUTO_5136 ) ) ( ON ?AUTO_5136 ?AUTO_5134 ) ( CLEAR ?AUTO_5136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5136 ?AUTO_5134 )
      ( MAKE-ON-TABLE ?AUTO_5134 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5134 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5137 - BLOCK
    )
    :vars
    (
      ?AUTO_5138 - BLOCK
      ?AUTO_5139 - BLOCK
      ?AUTO_5140 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5137 ?AUTO_5138 ) ( not ( = ?AUTO_5137 ?AUTO_5138 ) ) ( not ( = ?AUTO_5137 ?AUTO_5139 ) ) ( not ( = ?AUTO_5138 ?AUTO_5139 ) ) ( ON ?AUTO_5139 ?AUTO_5137 ) ( CLEAR ?AUTO_5139 ) ( HOLDING ?AUTO_5140 ) ( not ( = ?AUTO_5137 ?AUTO_5140 ) ) ( not ( = ?AUTO_5138 ?AUTO_5140 ) ) ( not ( = ?AUTO_5139 ?AUTO_5140 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5140 )
      ( MAKE-ON-TABLE ?AUTO_5137 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5137 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5141 - BLOCK
    )
    :vars
    (
      ?AUTO_5142 - BLOCK
      ?AUTO_5143 - BLOCK
      ?AUTO_5144 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5141 ?AUTO_5142 ) ( not ( = ?AUTO_5141 ?AUTO_5142 ) ) ( not ( = ?AUTO_5141 ?AUTO_5143 ) ) ( not ( = ?AUTO_5142 ?AUTO_5143 ) ) ( ON ?AUTO_5143 ?AUTO_5141 ) ( not ( = ?AUTO_5141 ?AUTO_5144 ) ) ( not ( = ?AUTO_5142 ?AUTO_5144 ) ) ( not ( = ?AUTO_5143 ?AUTO_5144 ) ) ( ON ?AUTO_5144 ?AUTO_5143 ) ( CLEAR ?AUTO_5144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5144 ?AUTO_5143 )
      ( MAKE-ON-TABLE ?AUTO_5141 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5141 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5145 - BLOCK
    )
    :vars
    (
      ?AUTO_5148 - BLOCK
      ?AUTO_5146 - BLOCK
      ?AUTO_5147 - BLOCK
      ?AUTO_5149 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5145 ?AUTO_5148 ) ( not ( = ?AUTO_5145 ?AUTO_5148 ) ) ( not ( = ?AUTO_5145 ?AUTO_5146 ) ) ( not ( = ?AUTO_5148 ?AUTO_5146 ) ) ( ON ?AUTO_5146 ?AUTO_5145 ) ( not ( = ?AUTO_5145 ?AUTO_5147 ) ) ( not ( = ?AUTO_5148 ?AUTO_5147 ) ) ( not ( = ?AUTO_5146 ?AUTO_5147 ) ) ( ON ?AUTO_5147 ?AUTO_5146 ) ( CLEAR ?AUTO_5147 ) ( HOLDING ?AUTO_5149 ) ( not ( = ?AUTO_5145 ?AUTO_5149 ) ) ( not ( = ?AUTO_5148 ?AUTO_5149 ) ) ( not ( = ?AUTO_5146 ?AUTO_5149 ) ) ( not ( = ?AUTO_5147 ?AUTO_5149 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5149 )
      ( MAKE-ON-TABLE ?AUTO_5145 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5145 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5150 - BLOCK
    )
    :vars
    (
      ?AUTO_5151 - BLOCK
      ?AUTO_5154 - BLOCK
      ?AUTO_5152 - BLOCK
      ?AUTO_5153 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5150 ?AUTO_5151 ) ( not ( = ?AUTO_5150 ?AUTO_5151 ) ) ( not ( = ?AUTO_5150 ?AUTO_5154 ) ) ( not ( = ?AUTO_5151 ?AUTO_5154 ) ) ( ON ?AUTO_5154 ?AUTO_5150 ) ( not ( = ?AUTO_5150 ?AUTO_5152 ) ) ( not ( = ?AUTO_5151 ?AUTO_5152 ) ) ( not ( = ?AUTO_5154 ?AUTO_5152 ) ) ( ON ?AUTO_5152 ?AUTO_5154 ) ( not ( = ?AUTO_5150 ?AUTO_5153 ) ) ( not ( = ?AUTO_5151 ?AUTO_5153 ) ) ( not ( = ?AUTO_5154 ?AUTO_5153 ) ) ( not ( = ?AUTO_5152 ?AUTO_5153 ) ) ( ON ?AUTO_5153 ?AUTO_5152 ) ( CLEAR ?AUTO_5153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5153 ?AUTO_5152 )
      ( MAKE-ON-TABLE ?AUTO_5150 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5150 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5157 - BLOCK
      ?AUTO_5158 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5157 ) ( CLEAR ?AUTO_5158 ) ( not ( = ?AUTO_5157 ?AUTO_5158 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5157 ?AUTO_5158 )
      ( MAKE-ON-VERIFY ?AUTO_5157 ?AUTO_5158 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5159 - BLOCK
      ?AUTO_5160 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5160 ) ( not ( = ?AUTO_5159 ?AUTO_5160 ) ) ( ON-TABLE ?AUTO_5159 ) ( CLEAR ?AUTO_5159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5159 )
      ( MAKE-ON ?AUTO_5159 ?AUTO_5160 )
      ( MAKE-ON-VERIFY ?AUTO_5159 ?AUTO_5160 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5161 - BLOCK
      ?AUTO_5162 - BLOCK
    )
    :vars
    (
      ?AUTO_5163 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5162 ) ( not ( = ?AUTO_5161 ?AUTO_5162 ) ) ( ON-TABLE ?AUTO_5161 ) ( CLEAR ?AUTO_5161 ) ( HOLDING ?AUTO_5163 ) ( not ( = ?AUTO_5161 ?AUTO_5163 ) ) ( not ( = ?AUTO_5162 ?AUTO_5163 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5163 )
      ( MAKE-ON ?AUTO_5161 ?AUTO_5162 )
      ( MAKE-ON-VERIFY ?AUTO_5161 ?AUTO_5162 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5164 - BLOCK
      ?AUTO_5165 - BLOCK
    )
    :vars
    (
      ?AUTO_5166 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5164 ?AUTO_5165 ) ) ( ON-TABLE ?AUTO_5164 ) ( CLEAR ?AUTO_5164 ) ( not ( = ?AUTO_5164 ?AUTO_5166 ) ) ( not ( = ?AUTO_5165 ?AUTO_5166 ) ) ( ON ?AUTO_5166 ?AUTO_5165 ) ( CLEAR ?AUTO_5166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5166 ?AUTO_5165 )
      ( MAKE-ON ?AUTO_5164 ?AUTO_5165 )
      ( MAKE-ON-VERIFY ?AUTO_5164 ?AUTO_5165 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5167 - BLOCK
      ?AUTO_5168 - BLOCK
    )
    :vars
    (
      ?AUTO_5169 - BLOCK
      ?AUTO_5170 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5167 ?AUTO_5168 ) ) ( ON-TABLE ?AUTO_5167 ) ( CLEAR ?AUTO_5167 ) ( not ( = ?AUTO_5167 ?AUTO_5169 ) ) ( not ( = ?AUTO_5168 ?AUTO_5169 ) ) ( ON ?AUTO_5169 ?AUTO_5168 ) ( CLEAR ?AUTO_5169 ) ( HOLDING ?AUTO_5170 ) ( not ( = ?AUTO_5167 ?AUTO_5170 ) ) ( not ( = ?AUTO_5168 ?AUTO_5170 ) ) ( not ( = ?AUTO_5169 ?AUTO_5170 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5170 )
      ( MAKE-ON ?AUTO_5167 ?AUTO_5168 )
      ( MAKE-ON-VERIFY ?AUTO_5167 ?AUTO_5168 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5171 - BLOCK
      ?AUTO_5172 - BLOCK
    )
    :vars
    (
      ?AUTO_5173 - BLOCK
      ?AUTO_5174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5171 ?AUTO_5172 ) ) ( ON-TABLE ?AUTO_5171 ) ( CLEAR ?AUTO_5171 ) ( not ( = ?AUTO_5171 ?AUTO_5173 ) ) ( not ( = ?AUTO_5172 ?AUTO_5173 ) ) ( ON ?AUTO_5173 ?AUTO_5172 ) ( not ( = ?AUTO_5171 ?AUTO_5174 ) ) ( not ( = ?AUTO_5172 ?AUTO_5174 ) ) ( not ( = ?AUTO_5173 ?AUTO_5174 ) ) ( ON ?AUTO_5174 ?AUTO_5173 ) ( CLEAR ?AUTO_5174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5174 ?AUTO_5173 )
      ( MAKE-ON ?AUTO_5171 ?AUTO_5172 )
      ( MAKE-ON-VERIFY ?AUTO_5171 ?AUTO_5172 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5175 - BLOCK
      ?AUTO_5176 - BLOCK
    )
    :vars
    (
      ?AUTO_5177 - BLOCK
      ?AUTO_5178 - BLOCK
      ?AUTO_5179 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5175 ?AUTO_5176 ) ) ( ON-TABLE ?AUTO_5175 ) ( CLEAR ?AUTO_5175 ) ( not ( = ?AUTO_5175 ?AUTO_5177 ) ) ( not ( = ?AUTO_5176 ?AUTO_5177 ) ) ( ON ?AUTO_5177 ?AUTO_5176 ) ( not ( = ?AUTO_5175 ?AUTO_5178 ) ) ( not ( = ?AUTO_5176 ?AUTO_5178 ) ) ( not ( = ?AUTO_5177 ?AUTO_5178 ) ) ( ON ?AUTO_5178 ?AUTO_5177 ) ( CLEAR ?AUTO_5178 ) ( HOLDING ?AUTO_5179 ) ( not ( = ?AUTO_5175 ?AUTO_5179 ) ) ( not ( = ?AUTO_5176 ?AUTO_5179 ) ) ( not ( = ?AUTO_5177 ?AUTO_5179 ) ) ( not ( = ?AUTO_5178 ?AUTO_5179 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5179 )
      ( MAKE-ON ?AUTO_5175 ?AUTO_5176 )
      ( MAKE-ON-VERIFY ?AUTO_5175 ?AUTO_5176 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5180 - BLOCK
      ?AUTO_5181 - BLOCK
    )
    :vars
    (
      ?AUTO_5182 - BLOCK
      ?AUTO_5183 - BLOCK
      ?AUTO_5184 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5180 ?AUTO_5181 ) ) ( ON-TABLE ?AUTO_5180 ) ( CLEAR ?AUTO_5180 ) ( not ( = ?AUTO_5180 ?AUTO_5182 ) ) ( not ( = ?AUTO_5181 ?AUTO_5182 ) ) ( ON ?AUTO_5182 ?AUTO_5181 ) ( not ( = ?AUTO_5180 ?AUTO_5183 ) ) ( not ( = ?AUTO_5181 ?AUTO_5183 ) ) ( not ( = ?AUTO_5182 ?AUTO_5183 ) ) ( ON ?AUTO_5183 ?AUTO_5182 ) ( not ( = ?AUTO_5180 ?AUTO_5184 ) ) ( not ( = ?AUTO_5181 ?AUTO_5184 ) ) ( not ( = ?AUTO_5182 ?AUTO_5184 ) ) ( not ( = ?AUTO_5183 ?AUTO_5184 ) ) ( ON ?AUTO_5184 ?AUTO_5183 ) ( CLEAR ?AUTO_5184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5184 ?AUTO_5183 )
      ( MAKE-ON ?AUTO_5180 ?AUTO_5181 )
      ( MAKE-ON-VERIFY ?AUTO_5180 ?AUTO_5181 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5185 - BLOCK
      ?AUTO_5186 - BLOCK
    )
    :vars
    (
      ?AUTO_5187 - BLOCK
      ?AUTO_5188 - BLOCK
      ?AUTO_5189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5185 ?AUTO_5186 ) ) ( not ( = ?AUTO_5185 ?AUTO_5187 ) ) ( not ( = ?AUTO_5186 ?AUTO_5187 ) ) ( ON ?AUTO_5187 ?AUTO_5186 ) ( not ( = ?AUTO_5185 ?AUTO_5188 ) ) ( not ( = ?AUTO_5186 ?AUTO_5188 ) ) ( not ( = ?AUTO_5187 ?AUTO_5188 ) ) ( ON ?AUTO_5188 ?AUTO_5187 ) ( not ( = ?AUTO_5185 ?AUTO_5189 ) ) ( not ( = ?AUTO_5186 ?AUTO_5189 ) ) ( not ( = ?AUTO_5187 ?AUTO_5189 ) ) ( not ( = ?AUTO_5188 ?AUTO_5189 ) ) ( ON ?AUTO_5189 ?AUTO_5188 ) ( CLEAR ?AUTO_5189 ) ( HOLDING ?AUTO_5185 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5185 )
      ( MAKE-ON ?AUTO_5185 ?AUTO_5186 )
      ( MAKE-ON-VERIFY ?AUTO_5185 ?AUTO_5186 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5190 - BLOCK
      ?AUTO_5191 - BLOCK
    )
    :vars
    (
      ?AUTO_5193 - BLOCK
      ?AUTO_5192 - BLOCK
      ?AUTO_5194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5190 ?AUTO_5191 ) ) ( not ( = ?AUTO_5190 ?AUTO_5193 ) ) ( not ( = ?AUTO_5191 ?AUTO_5193 ) ) ( ON ?AUTO_5193 ?AUTO_5191 ) ( not ( = ?AUTO_5190 ?AUTO_5192 ) ) ( not ( = ?AUTO_5191 ?AUTO_5192 ) ) ( not ( = ?AUTO_5193 ?AUTO_5192 ) ) ( ON ?AUTO_5192 ?AUTO_5193 ) ( not ( = ?AUTO_5190 ?AUTO_5194 ) ) ( not ( = ?AUTO_5191 ?AUTO_5194 ) ) ( not ( = ?AUTO_5193 ?AUTO_5194 ) ) ( not ( = ?AUTO_5192 ?AUTO_5194 ) ) ( ON ?AUTO_5194 ?AUTO_5192 ) ( ON ?AUTO_5190 ?AUTO_5194 ) ( CLEAR ?AUTO_5190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5190 ?AUTO_5194 )
      ( MAKE-ON ?AUTO_5190 ?AUTO_5191 )
      ( MAKE-ON-VERIFY ?AUTO_5190 ?AUTO_5191 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5196 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5196 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5196 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5196 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5197 - BLOCK
    )
    :vars
    (
      ?AUTO_5198 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5197 ?AUTO_5198 ) ( CLEAR ?AUTO_5197 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5197 ?AUTO_5198 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5197 ?AUTO_5198 )
      ( MAKE-ON-TABLE ?AUTO_5197 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5197 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5200 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5200 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5200 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5200 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5201 - BLOCK
    )
    :vars
    (
      ?AUTO_5202 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5201 ?AUTO_5202 ) ( CLEAR ?AUTO_5201 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5201 ?AUTO_5202 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5201 ?AUTO_5202 )
      ( MAKE-ON-TABLE ?AUTO_5201 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5201 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5203 - BLOCK
    )
    :vars
    (
      ?AUTO_5204 - BLOCK
      ?AUTO_5205 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5203 ?AUTO_5204 ) ( CLEAR ?AUTO_5203 ) ( not ( = ?AUTO_5203 ?AUTO_5204 ) ) ( HOLDING ?AUTO_5205 ) ( not ( = ?AUTO_5203 ?AUTO_5205 ) ) ( not ( = ?AUTO_5204 ?AUTO_5205 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5205 )
      ( MAKE-ON-TABLE ?AUTO_5203 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5203 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5209 - BLOCK
      ?AUTO_5210 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5209 ) ( CLEAR ?AUTO_5210 ) ( not ( = ?AUTO_5209 ?AUTO_5210 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5209 ?AUTO_5210 )
      ( MAKE-ON-VERIFY ?AUTO_5209 ?AUTO_5210 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5211 - BLOCK
      ?AUTO_5212 - BLOCK
    )
    :vars
    (
      ?AUTO_5213 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5212 ) ( not ( = ?AUTO_5211 ?AUTO_5212 ) ) ( ON ?AUTO_5211 ?AUTO_5213 ) ( CLEAR ?AUTO_5211 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5211 ?AUTO_5213 ) ) ( not ( = ?AUTO_5212 ?AUTO_5213 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5211 ?AUTO_5213 )
      ( MAKE-ON ?AUTO_5211 ?AUTO_5212 )
      ( MAKE-ON-VERIFY ?AUTO_5211 ?AUTO_5212 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5214 - BLOCK
      ?AUTO_5215 - BLOCK
    )
    :vars
    (
      ?AUTO_5216 - BLOCK
      ?AUTO_5217 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5215 ) ( not ( = ?AUTO_5214 ?AUTO_5215 ) ) ( ON ?AUTO_5214 ?AUTO_5216 ) ( CLEAR ?AUTO_5214 ) ( not ( = ?AUTO_5214 ?AUTO_5216 ) ) ( not ( = ?AUTO_5215 ?AUTO_5216 ) ) ( HOLDING ?AUTO_5217 ) ( not ( = ?AUTO_5214 ?AUTO_5217 ) ) ( not ( = ?AUTO_5215 ?AUTO_5217 ) ) ( not ( = ?AUTO_5216 ?AUTO_5217 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5217 )
      ( MAKE-ON ?AUTO_5214 ?AUTO_5215 )
      ( MAKE-ON-VERIFY ?AUTO_5214 ?AUTO_5215 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5220 - BLOCK
      ?AUTO_5221 - BLOCK
    )
    :vars
    (
      ?AUTO_5222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5220 ?AUTO_5221 ) ) ( ON ?AUTO_5220 ?AUTO_5222 ) ( CLEAR ?AUTO_5220 ) ( not ( = ?AUTO_5220 ?AUTO_5222 ) ) ( not ( = ?AUTO_5221 ?AUTO_5222 ) ) ( HOLDING ?AUTO_5221 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5221 )
      ( MAKE-ON ?AUTO_5220 ?AUTO_5221 )
      ( MAKE-ON-VERIFY ?AUTO_5220 ?AUTO_5221 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5227 - BLOCK
      ?AUTO_5228 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5227 ) ( CLEAR ?AUTO_5228 ) ( not ( = ?AUTO_5227 ?AUTO_5228 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5227 ?AUTO_5228 )
      ( MAKE-ON-VERIFY ?AUTO_5227 ?AUTO_5228 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5229 - BLOCK
      ?AUTO_5230 - BLOCK
    )
    :vars
    (
      ?AUTO_5231 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5230 ) ( not ( = ?AUTO_5229 ?AUTO_5230 ) ) ( ON ?AUTO_5229 ?AUTO_5231 ) ( CLEAR ?AUTO_5229 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5229 ?AUTO_5231 ) ) ( not ( = ?AUTO_5230 ?AUTO_5231 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5229 ?AUTO_5231 )
      ( MAKE-ON ?AUTO_5229 ?AUTO_5230 )
      ( MAKE-ON-VERIFY ?AUTO_5229 ?AUTO_5230 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5232 - BLOCK
      ?AUTO_5233 - BLOCK
    )
    :vars
    (
      ?AUTO_5234 - BLOCK
      ?AUTO_5235 - BLOCK
      ?AUTO_5236 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5233 ) ( not ( = ?AUTO_5232 ?AUTO_5233 ) ) ( ON ?AUTO_5232 ?AUTO_5234 ) ( CLEAR ?AUTO_5232 ) ( not ( = ?AUTO_5232 ?AUTO_5234 ) ) ( not ( = ?AUTO_5233 ?AUTO_5234 ) ) ( HOLDING ?AUTO_5235 ) ( CLEAR ?AUTO_5236 ) ( not ( = ?AUTO_5232 ?AUTO_5235 ) ) ( not ( = ?AUTO_5232 ?AUTO_5236 ) ) ( not ( = ?AUTO_5233 ?AUTO_5235 ) ) ( not ( = ?AUTO_5233 ?AUTO_5236 ) ) ( not ( = ?AUTO_5234 ?AUTO_5235 ) ) ( not ( = ?AUTO_5234 ?AUTO_5236 ) ) ( not ( = ?AUTO_5235 ?AUTO_5236 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5235 ?AUTO_5236 )
      ( MAKE-ON ?AUTO_5232 ?AUTO_5233 )
      ( MAKE-ON-VERIFY ?AUTO_5232 ?AUTO_5233 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5237 - BLOCK
      ?AUTO_5238 - BLOCK
    )
    :vars
    (
      ?AUTO_5239 - BLOCK
      ?AUTO_5240 - BLOCK
      ?AUTO_5241 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5238 ) ( not ( = ?AUTO_5237 ?AUTO_5238 ) ) ( ON ?AUTO_5237 ?AUTO_5239 ) ( not ( = ?AUTO_5237 ?AUTO_5239 ) ) ( not ( = ?AUTO_5238 ?AUTO_5239 ) ) ( CLEAR ?AUTO_5240 ) ( not ( = ?AUTO_5237 ?AUTO_5241 ) ) ( not ( = ?AUTO_5237 ?AUTO_5240 ) ) ( not ( = ?AUTO_5238 ?AUTO_5241 ) ) ( not ( = ?AUTO_5238 ?AUTO_5240 ) ) ( not ( = ?AUTO_5239 ?AUTO_5241 ) ) ( not ( = ?AUTO_5239 ?AUTO_5240 ) ) ( not ( = ?AUTO_5241 ?AUTO_5240 ) ) ( ON ?AUTO_5241 ?AUTO_5237 ) ( CLEAR ?AUTO_5241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5241 ?AUTO_5237 )
      ( MAKE-ON ?AUTO_5237 ?AUTO_5238 )
      ( MAKE-ON-VERIFY ?AUTO_5237 ?AUTO_5238 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5242 - BLOCK
      ?AUTO_5243 - BLOCK
    )
    :vars
    (
      ?AUTO_5244 - BLOCK
      ?AUTO_5246 - BLOCK
      ?AUTO_5245 - BLOCK
      ?AUTO_5247 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5243 ) ( not ( = ?AUTO_5242 ?AUTO_5243 ) ) ( ON ?AUTO_5242 ?AUTO_5244 ) ( not ( = ?AUTO_5242 ?AUTO_5244 ) ) ( not ( = ?AUTO_5243 ?AUTO_5244 ) ) ( CLEAR ?AUTO_5246 ) ( not ( = ?AUTO_5242 ?AUTO_5245 ) ) ( not ( = ?AUTO_5242 ?AUTO_5246 ) ) ( not ( = ?AUTO_5243 ?AUTO_5245 ) ) ( not ( = ?AUTO_5243 ?AUTO_5246 ) ) ( not ( = ?AUTO_5244 ?AUTO_5245 ) ) ( not ( = ?AUTO_5244 ?AUTO_5246 ) ) ( not ( = ?AUTO_5245 ?AUTO_5246 ) ) ( ON ?AUTO_5245 ?AUTO_5242 ) ( CLEAR ?AUTO_5245 ) ( HOLDING ?AUTO_5247 ) ( not ( = ?AUTO_5242 ?AUTO_5247 ) ) ( not ( = ?AUTO_5243 ?AUTO_5247 ) ) ( not ( = ?AUTO_5244 ?AUTO_5247 ) ) ( not ( = ?AUTO_5246 ?AUTO_5247 ) ) ( not ( = ?AUTO_5245 ?AUTO_5247 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5247 )
      ( MAKE-ON ?AUTO_5242 ?AUTO_5243 )
      ( MAKE-ON-VERIFY ?AUTO_5242 ?AUTO_5243 ) )
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
      ?AUTO_5254 - BLOCK
      ?AUTO_5257 - BLOCK
      ?AUTO_5255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5252 ?AUTO_5253 ) ) ( ON ?AUTO_5252 ?AUTO_5256 ) ( not ( = ?AUTO_5252 ?AUTO_5256 ) ) ( not ( = ?AUTO_5253 ?AUTO_5256 ) ) ( CLEAR ?AUTO_5254 ) ( not ( = ?AUTO_5252 ?AUTO_5257 ) ) ( not ( = ?AUTO_5252 ?AUTO_5254 ) ) ( not ( = ?AUTO_5253 ?AUTO_5257 ) ) ( not ( = ?AUTO_5253 ?AUTO_5254 ) ) ( not ( = ?AUTO_5256 ?AUTO_5257 ) ) ( not ( = ?AUTO_5256 ?AUTO_5254 ) ) ( not ( = ?AUTO_5257 ?AUTO_5254 ) ) ( ON ?AUTO_5257 ?AUTO_5252 ) ( CLEAR ?AUTO_5257 ) ( not ( = ?AUTO_5252 ?AUTO_5255 ) ) ( not ( = ?AUTO_5253 ?AUTO_5255 ) ) ( not ( = ?AUTO_5256 ?AUTO_5255 ) ) ( not ( = ?AUTO_5254 ?AUTO_5255 ) ) ( not ( = ?AUTO_5257 ?AUTO_5255 ) ) ( ON ?AUTO_5255 ?AUTO_5253 ) ( CLEAR ?AUTO_5255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5255 ?AUTO_5253 )
      ( MAKE-ON ?AUTO_5252 ?AUTO_5253 )
      ( MAKE-ON-VERIFY ?AUTO_5252 ?AUTO_5253 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5260 - BLOCK
      ?AUTO_5261 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5260 ) ( CLEAR ?AUTO_5261 ) ( not ( = ?AUTO_5260 ?AUTO_5261 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5260 ?AUTO_5261 )
      ( MAKE-ON-VERIFY ?AUTO_5260 ?AUTO_5261 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5262 - BLOCK
      ?AUTO_5263 - BLOCK
    )
    :vars
    (
      ?AUTO_5264 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5263 ) ( not ( = ?AUTO_5262 ?AUTO_5263 ) ) ( ON ?AUTO_5262 ?AUTO_5264 ) ( CLEAR ?AUTO_5262 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5262 ?AUTO_5264 ) ) ( not ( = ?AUTO_5263 ?AUTO_5264 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5262 ?AUTO_5264 )
      ( MAKE-ON ?AUTO_5262 ?AUTO_5263 )
      ( MAKE-ON-VERIFY ?AUTO_5262 ?AUTO_5263 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5265 - BLOCK
      ?AUTO_5266 - BLOCK
    )
    :vars
    (
      ?AUTO_5267 - BLOCK
      ?AUTO_5268 - BLOCK
      ?AUTO_5269 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5266 ) ( not ( = ?AUTO_5265 ?AUTO_5266 ) ) ( ON ?AUTO_5265 ?AUTO_5267 ) ( CLEAR ?AUTO_5265 ) ( not ( = ?AUTO_5265 ?AUTO_5267 ) ) ( not ( = ?AUTO_5266 ?AUTO_5267 ) ) ( HOLDING ?AUTO_5268 ) ( CLEAR ?AUTO_5269 ) ( not ( = ?AUTO_5265 ?AUTO_5268 ) ) ( not ( = ?AUTO_5265 ?AUTO_5269 ) ) ( not ( = ?AUTO_5266 ?AUTO_5268 ) ) ( not ( = ?AUTO_5266 ?AUTO_5269 ) ) ( not ( = ?AUTO_5267 ?AUTO_5268 ) ) ( not ( = ?AUTO_5267 ?AUTO_5269 ) ) ( not ( = ?AUTO_5268 ?AUTO_5269 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5268 ?AUTO_5269 )
      ( MAKE-ON ?AUTO_5265 ?AUTO_5266 )
      ( MAKE-ON-VERIFY ?AUTO_5265 ?AUTO_5266 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5270 - BLOCK
      ?AUTO_5271 - BLOCK
    )
    :vars
    (
      ?AUTO_5272 - BLOCK
      ?AUTO_5273 - BLOCK
      ?AUTO_5274 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5271 ) ( not ( = ?AUTO_5270 ?AUTO_5271 ) ) ( ON ?AUTO_5270 ?AUTO_5272 ) ( not ( = ?AUTO_5270 ?AUTO_5272 ) ) ( not ( = ?AUTO_5271 ?AUTO_5272 ) ) ( CLEAR ?AUTO_5273 ) ( not ( = ?AUTO_5270 ?AUTO_5274 ) ) ( not ( = ?AUTO_5270 ?AUTO_5273 ) ) ( not ( = ?AUTO_5271 ?AUTO_5274 ) ) ( not ( = ?AUTO_5271 ?AUTO_5273 ) ) ( not ( = ?AUTO_5272 ?AUTO_5274 ) ) ( not ( = ?AUTO_5272 ?AUTO_5273 ) ) ( not ( = ?AUTO_5274 ?AUTO_5273 ) ) ( ON ?AUTO_5274 ?AUTO_5270 ) ( CLEAR ?AUTO_5274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5274 ?AUTO_5270 )
      ( MAKE-ON ?AUTO_5270 ?AUTO_5271 )
      ( MAKE-ON-VERIFY ?AUTO_5270 ?AUTO_5271 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5275 - BLOCK
      ?AUTO_5276 - BLOCK
    )
    :vars
    (
      ?AUTO_5277 - BLOCK
      ?AUTO_5279 - BLOCK
      ?AUTO_5278 - BLOCK
      ?AUTO_5280 - BLOCK
      ?AUTO_5281 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5276 ) ( not ( = ?AUTO_5275 ?AUTO_5276 ) ) ( ON ?AUTO_5275 ?AUTO_5277 ) ( not ( = ?AUTO_5275 ?AUTO_5277 ) ) ( not ( = ?AUTO_5276 ?AUTO_5277 ) ) ( CLEAR ?AUTO_5279 ) ( not ( = ?AUTO_5275 ?AUTO_5278 ) ) ( not ( = ?AUTO_5275 ?AUTO_5279 ) ) ( not ( = ?AUTO_5276 ?AUTO_5278 ) ) ( not ( = ?AUTO_5276 ?AUTO_5279 ) ) ( not ( = ?AUTO_5277 ?AUTO_5278 ) ) ( not ( = ?AUTO_5277 ?AUTO_5279 ) ) ( not ( = ?AUTO_5278 ?AUTO_5279 ) ) ( ON ?AUTO_5278 ?AUTO_5275 ) ( CLEAR ?AUTO_5278 ) ( HOLDING ?AUTO_5280 ) ( CLEAR ?AUTO_5281 ) ( not ( = ?AUTO_5275 ?AUTO_5280 ) ) ( not ( = ?AUTO_5275 ?AUTO_5281 ) ) ( not ( = ?AUTO_5276 ?AUTO_5280 ) ) ( not ( = ?AUTO_5276 ?AUTO_5281 ) ) ( not ( = ?AUTO_5277 ?AUTO_5280 ) ) ( not ( = ?AUTO_5277 ?AUTO_5281 ) ) ( not ( = ?AUTO_5279 ?AUTO_5280 ) ) ( not ( = ?AUTO_5279 ?AUTO_5281 ) ) ( not ( = ?AUTO_5278 ?AUTO_5280 ) ) ( not ( = ?AUTO_5278 ?AUTO_5281 ) ) ( not ( = ?AUTO_5280 ?AUTO_5281 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5280 ?AUTO_5281 )
      ( MAKE-ON ?AUTO_5275 ?AUTO_5276 )
      ( MAKE-ON-VERIFY ?AUTO_5275 ?AUTO_5276 ) )
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
      ?AUTO_5288 - BLOCK
      ?AUTO_5285 - BLOCK
      ?AUTO_5287 - BLOCK
      ?AUTO_5286 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5283 ) ( not ( = ?AUTO_5282 ?AUTO_5283 ) ) ( ON ?AUTO_5282 ?AUTO_5284 ) ( not ( = ?AUTO_5282 ?AUTO_5284 ) ) ( not ( = ?AUTO_5283 ?AUTO_5284 ) ) ( CLEAR ?AUTO_5288 ) ( not ( = ?AUTO_5282 ?AUTO_5285 ) ) ( not ( = ?AUTO_5282 ?AUTO_5288 ) ) ( not ( = ?AUTO_5283 ?AUTO_5285 ) ) ( not ( = ?AUTO_5283 ?AUTO_5288 ) ) ( not ( = ?AUTO_5284 ?AUTO_5285 ) ) ( not ( = ?AUTO_5284 ?AUTO_5288 ) ) ( not ( = ?AUTO_5285 ?AUTO_5288 ) ) ( ON ?AUTO_5285 ?AUTO_5282 ) ( CLEAR ?AUTO_5287 ) ( not ( = ?AUTO_5282 ?AUTO_5286 ) ) ( not ( = ?AUTO_5282 ?AUTO_5287 ) ) ( not ( = ?AUTO_5283 ?AUTO_5286 ) ) ( not ( = ?AUTO_5283 ?AUTO_5287 ) ) ( not ( = ?AUTO_5284 ?AUTO_5286 ) ) ( not ( = ?AUTO_5284 ?AUTO_5287 ) ) ( not ( = ?AUTO_5288 ?AUTO_5286 ) ) ( not ( = ?AUTO_5288 ?AUTO_5287 ) ) ( not ( = ?AUTO_5285 ?AUTO_5286 ) ) ( not ( = ?AUTO_5285 ?AUTO_5287 ) ) ( not ( = ?AUTO_5286 ?AUTO_5287 ) ) ( ON ?AUTO_5286 ?AUTO_5285 ) ( CLEAR ?AUTO_5286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5286 ?AUTO_5285 )
      ( MAKE-ON ?AUTO_5282 ?AUTO_5283 )
      ( MAKE-ON-VERIFY ?AUTO_5282 ?AUTO_5283 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5289 - BLOCK
      ?AUTO_5290 - BLOCK
    )
    :vars
    (
      ?AUTO_5292 - BLOCK
      ?AUTO_5295 - BLOCK
      ?AUTO_5291 - BLOCK
      ?AUTO_5294 - BLOCK
      ?AUTO_5293 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5289 ?AUTO_5290 ) ) ( ON ?AUTO_5289 ?AUTO_5292 ) ( not ( = ?AUTO_5289 ?AUTO_5292 ) ) ( not ( = ?AUTO_5290 ?AUTO_5292 ) ) ( CLEAR ?AUTO_5295 ) ( not ( = ?AUTO_5289 ?AUTO_5291 ) ) ( not ( = ?AUTO_5289 ?AUTO_5295 ) ) ( not ( = ?AUTO_5290 ?AUTO_5291 ) ) ( not ( = ?AUTO_5290 ?AUTO_5295 ) ) ( not ( = ?AUTO_5292 ?AUTO_5291 ) ) ( not ( = ?AUTO_5292 ?AUTO_5295 ) ) ( not ( = ?AUTO_5291 ?AUTO_5295 ) ) ( ON ?AUTO_5291 ?AUTO_5289 ) ( CLEAR ?AUTO_5294 ) ( not ( = ?AUTO_5289 ?AUTO_5293 ) ) ( not ( = ?AUTO_5289 ?AUTO_5294 ) ) ( not ( = ?AUTO_5290 ?AUTO_5293 ) ) ( not ( = ?AUTO_5290 ?AUTO_5294 ) ) ( not ( = ?AUTO_5292 ?AUTO_5293 ) ) ( not ( = ?AUTO_5292 ?AUTO_5294 ) ) ( not ( = ?AUTO_5295 ?AUTO_5293 ) ) ( not ( = ?AUTO_5295 ?AUTO_5294 ) ) ( not ( = ?AUTO_5291 ?AUTO_5293 ) ) ( not ( = ?AUTO_5291 ?AUTO_5294 ) ) ( not ( = ?AUTO_5293 ?AUTO_5294 ) ) ( ON ?AUTO_5293 ?AUTO_5291 ) ( CLEAR ?AUTO_5293 ) ( HOLDING ?AUTO_5290 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5290 )
      ( MAKE-ON ?AUTO_5289 ?AUTO_5290 )
      ( MAKE-ON-VERIFY ?AUTO_5289 ?AUTO_5290 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5298 - BLOCK
      ?AUTO_5299 - BLOCK
    )
    :vars
    (
      ?AUTO_5303 - BLOCK
      ?AUTO_5302 - BLOCK
      ?AUTO_5300 - BLOCK
      ?AUTO_5301 - BLOCK
      ?AUTO_5304 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5299 ) ( not ( = ?AUTO_5298 ?AUTO_5299 ) ) ( ON ?AUTO_5298 ?AUTO_5303 ) ( not ( = ?AUTO_5298 ?AUTO_5303 ) ) ( not ( = ?AUTO_5299 ?AUTO_5303 ) ) ( not ( = ?AUTO_5298 ?AUTO_5302 ) ) ( not ( = ?AUTO_5298 ?AUTO_5300 ) ) ( not ( = ?AUTO_5299 ?AUTO_5302 ) ) ( not ( = ?AUTO_5299 ?AUTO_5300 ) ) ( not ( = ?AUTO_5303 ?AUTO_5302 ) ) ( not ( = ?AUTO_5303 ?AUTO_5300 ) ) ( not ( = ?AUTO_5302 ?AUTO_5300 ) ) ( ON ?AUTO_5302 ?AUTO_5298 ) ( CLEAR ?AUTO_5301 ) ( not ( = ?AUTO_5298 ?AUTO_5304 ) ) ( not ( = ?AUTO_5298 ?AUTO_5301 ) ) ( not ( = ?AUTO_5299 ?AUTO_5304 ) ) ( not ( = ?AUTO_5299 ?AUTO_5301 ) ) ( not ( = ?AUTO_5303 ?AUTO_5304 ) ) ( not ( = ?AUTO_5303 ?AUTO_5301 ) ) ( not ( = ?AUTO_5300 ?AUTO_5304 ) ) ( not ( = ?AUTO_5300 ?AUTO_5301 ) ) ( not ( = ?AUTO_5302 ?AUTO_5304 ) ) ( not ( = ?AUTO_5302 ?AUTO_5301 ) ) ( not ( = ?AUTO_5304 ?AUTO_5301 ) ) ( ON ?AUTO_5304 ?AUTO_5302 ) ( CLEAR ?AUTO_5304 ) ( HOLDING ?AUTO_5300 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5300 )
      ( MAKE-ON ?AUTO_5298 ?AUTO_5299 )
      ( MAKE-ON-VERIFY ?AUTO_5298 ?AUTO_5299 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5305 - BLOCK
      ?AUTO_5306 - BLOCK
    )
    :vars
    (
      ?AUTO_5309 - BLOCK
      ?AUTO_5311 - BLOCK
      ?AUTO_5307 - BLOCK
      ?AUTO_5310 - BLOCK
      ?AUTO_5308 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5306 ) ( not ( = ?AUTO_5305 ?AUTO_5306 ) ) ( ON ?AUTO_5305 ?AUTO_5309 ) ( not ( = ?AUTO_5305 ?AUTO_5309 ) ) ( not ( = ?AUTO_5306 ?AUTO_5309 ) ) ( not ( = ?AUTO_5305 ?AUTO_5311 ) ) ( not ( = ?AUTO_5305 ?AUTO_5307 ) ) ( not ( = ?AUTO_5306 ?AUTO_5311 ) ) ( not ( = ?AUTO_5306 ?AUTO_5307 ) ) ( not ( = ?AUTO_5309 ?AUTO_5311 ) ) ( not ( = ?AUTO_5309 ?AUTO_5307 ) ) ( not ( = ?AUTO_5311 ?AUTO_5307 ) ) ( ON ?AUTO_5311 ?AUTO_5305 ) ( not ( = ?AUTO_5305 ?AUTO_5310 ) ) ( not ( = ?AUTO_5305 ?AUTO_5308 ) ) ( not ( = ?AUTO_5306 ?AUTO_5310 ) ) ( not ( = ?AUTO_5306 ?AUTO_5308 ) ) ( not ( = ?AUTO_5309 ?AUTO_5310 ) ) ( not ( = ?AUTO_5309 ?AUTO_5308 ) ) ( not ( = ?AUTO_5307 ?AUTO_5310 ) ) ( not ( = ?AUTO_5307 ?AUTO_5308 ) ) ( not ( = ?AUTO_5311 ?AUTO_5310 ) ) ( not ( = ?AUTO_5311 ?AUTO_5308 ) ) ( not ( = ?AUTO_5310 ?AUTO_5308 ) ) ( ON ?AUTO_5310 ?AUTO_5311 ) ( CLEAR ?AUTO_5310 ) ( ON ?AUTO_5307 ?AUTO_5308 ) ( CLEAR ?AUTO_5307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5307 ?AUTO_5308 )
      ( MAKE-ON ?AUTO_5305 ?AUTO_5306 )
      ( MAKE-ON-VERIFY ?AUTO_5305 ?AUTO_5306 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5314 - BLOCK
      ?AUTO_5315 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5314 ) ( CLEAR ?AUTO_5315 ) ( not ( = ?AUTO_5314 ?AUTO_5315 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5314 ?AUTO_5315 )
      ( MAKE-ON-VERIFY ?AUTO_5314 ?AUTO_5315 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5316 - BLOCK
      ?AUTO_5317 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5317 ) ( not ( = ?AUTO_5316 ?AUTO_5317 ) ) ( ON-TABLE ?AUTO_5316 ) ( CLEAR ?AUTO_5316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5316 )
      ( MAKE-ON ?AUTO_5316 ?AUTO_5317 )
      ( MAKE-ON-VERIFY ?AUTO_5316 ?AUTO_5317 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5318 - BLOCK
      ?AUTO_5319 - BLOCK
    )
    :vars
    (
      ?AUTO_5320 - BLOCK
      ?AUTO_5321 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5319 ) ( not ( = ?AUTO_5318 ?AUTO_5319 ) ) ( ON-TABLE ?AUTO_5318 ) ( CLEAR ?AUTO_5318 ) ( HOLDING ?AUTO_5320 ) ( CLEAR ?AUTO_5321 ) ( not ( = ?AUTO_5318 ?AUTO_5320 ) ) ( not ( = ?AUTO_5318 ?AUTO_5321 ) ) ( not ( = ?AUTO_5319 ?AUTO_5320 ) ) ( not ( = ?AUTO_5319 ?AUTO_5321 ) ) ( not ( = ?AUTO_5320 ?AUTO_5321 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5320 ?AUTO_5321 )
      ( MAKE-ON ?AUTO_5318 ?AUTO_5319 )
      ( MAKE-ON-VERIFY ?AUTO_5318 ?AUTO_5319 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5322 - BLOCK
      ?AUTO_5323 - BLOCK
    )
    :vars
    (
      ?AUTO_5324 - BLOCK
      ?AUTO_5325 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5323 ) ( not ( = ?AUTO_5322 ?AUTO_5323 ) ) ( ON-TABLE ?AUTO_5322 ) ( CLEAR ?AUTO_5324 ) ( not ( = ?AUTO_5322 ?AUTO_5325 ) ) ( not ( = ?AUTO_5322 ?AUTO_5324 ) ) ( not ( = ?AUTO_5323 ?AUTO_5325 ) ) ( not ( = ?AUTO_5323 ?AUTO_5324 ) ) ( not ( = ?AUTO_5325 ?AUTO_5324 ) ) ( ON ?AUTO_5325 ?AUTO_5322 ) ( CLEAR ?AUTO_5325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5325 ?AUTO_5322 )
      ( MAKE-ON ?AUTO_5322 ?AUTO_5323 )
      ( MAKE-ON-VERIFY ?AUTO_5322 ?AUTO_5323 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5326 - BLOCK
      ?AUTO_5327 - BLOCK
    )
    :vars
    (
      ?AUTO_5329 - BLOCK
      ?AUTO_5328 - BLOCK
      ?AUTO_5330 - BLOCK
      ?AUTO_5331 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5327 ) ( not ( = ?AUTO_5326 ?AUTO_5327 ) ) ( ON-TABLE ?AUTO_5326 ) ( CLEAR ?AUTO_5329 ) ( not ( = ?AUTO_5326 ?AUTO_5328 ) ) ( not ( = ?AUTO_5326 ?AUTO_5329 ) ) ( not ( = ?AUTO_5327 ?AUTO_5328 ) ) ( not ( = ?AUTO_5327 ?AUTO_5329 ) ) ( not ( = ?AUTO_5328 ?AUTO_5329 ) ) ( ON ?AUTO_5328 ?AUTO_5326 ) ( CLEAR ?AUTO_5328 ) ( HOLDING ?AUTO_5330 ) ( CLEAR ?AUTO_5331 ) ( not ( = ?AUTO_5326 ?AUTO_5330 ) ) ( not ( = ?AUTO_5326 ?AUTO_5331 ) ) ( not ( = ?AUTO_5327 ?AUTO_5330 ) ) ( not ( = ?AUTO_5327 ?AUTO_5331 ) ) ( not ( = ?AUTO_5329 ?AUTO_5330 ) ) ( not ( = ?AUTO_5329 ?AUTO_5331 ) ) ( not ( = ?AUTO_5328 ?AUTO_5330 ) ) ( not ( = ?AUTO_5328 ?AUTO_5331 ) ) ( not ( = ?AUTO_5330 ?AUTO_5331 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5330 ?AUTO_5331 )
      ( MAKE-ON ?AUTO_5326 ?AUTO_5327 )
      ( MAKE-ON-VERIFY ?AUTO_5326 ?AUTO_5327 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5332 - BLOCK
      ?AUTO_5333 - BLOCK
    )
    :vars
    (
      ?AUTO_5335 - BLOCK
      ?AUTO_5334 - BLOCK
      ?AUTO_5337 - BLOCK
      ?AUTO_5336 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5333 ) ( not ( = ?AUTO_5332 ?AUTO_5333 ) ) ( ON-TABLE ?AUTO_5332 ) ( CLEAR ?AUTO_5335 ) ( not ( = ?AUTO_5332 ?AUTO_5334 ) ) ( not ( = ?AUTO_5332 ?AUTO_5335 ) ) ( not ( = ?AUTO_5333 ?AUTO_5334 ) ) ( not ( = ?AUTO_5333 ?AUTO_5335 ) ) ( not ( = ?AUTO_5334 ?AUTO_5335 ) ) ( ON ?AUTO_5334 ?AUTO_5332 ) ( CLEAR ?AUTO_5337 ) ( not ( = ?AUTO_5332 ?AUTO_5336 ) ) ( not ( = ?AUTO_5332 ?AUTO_5337 ) ) ( not ( = ?AUTO_5333 ?AUTO_5336 ) ) ( not ( = ?AUTO_5333 ?AUTO_5337 ) ) ( not ( = ?AUTO_5335 ?AUTO_5336 ) ) ( not ( = ?AUTO_5335 ?AUTO_5337 ) ) ( not ( = ?AUTO_5334 ?AUTO_5336 ) ) ( not ( = ?AUTO_5334 ?AUTO_5337 ) ) ( not ( = ?AUTO_5336 ?AUTO_5337 ) ) ( ON ?AUTO_5336 ?AUTO_5334 ) ( CLEAR ?AUTO_5336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5336 ?AUTO_5334 )
      ( MAKE-ON ?AUTO_5332 ?AUTO_5333 )
      ( MAKE-ON-VERIFY ?AUTO_5332 ?AUTO_5333 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5338 - BLOCK
      ?AUTO_5339 - BLOCK
    )
    :vars
    (
      ?AUTO_5341 - BLOCK
      ?AUTO_5340 - BLOCK
      ?AUTO_5342 - BLOCK
      ?AUTO_5343 - BLOCK
      ?AUTO_5344 - BLOCK
      ?AUTO_5345 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5339 ) ( not ( = ?AUTO_5338 ?AUTO_5339 ) ) ( ON-TABLE ?AUTO_5338 ) ( CLEAR ?AUTO_5341 ) ( not ( = ?AUTO_5338 ?AUTO_5340 ) ) ( not ( = ?AUTO_5338 ?AUTO_5341 ) ) ( not ( = ?AUTO_5339 ?AUTO_5340 ) ) ( not ( = ?AUTO_5339 ?AUTO_5341 ) ) ( not ( = ?AUTO_5340 ?AUTO_5341 ) ) ( ON ?AUTO_5340 ?AUTO_5338 ) ( CLEAR ?AUTO_5342 ) ( not ( = ?AUTO_5338 ?AUTO_5343 ) ) ( not ( = ?AUTO_5338 ?AUTO_5342 ) ) ( not ( = ?AUTO_5339 ?AUTO_5343 ) ) ( not ( = ?AUTO_5339 ?AUTO_5342 ) ) ( not ( = ?AUTO_5341 ?AUTO_5343 ) ) ( not ( = ?AUTO_5341 ?AUTO_5342 ) ) ( not ( = ?AUTO_5340 ?AUTO_5343 ) ) ( not ( = ?AUTO_5340 ?AUTO_5342 ) ) ( not ( = ?AUTO_5343 ?AUTO_5342 ) ) ( ON ?AUTO_5343 ?AUTO_5340 ) ( CLEAR ?AUTO_5343 ) ( HOLDING ?AUTO_5344 ) ( CLEAR ?AUTO_5345 ) ( not ( = ?AUTO_5338 ?AUTO_5344 ) ) ( not ( = ?AUTO_5338 ?AUTO_5345 ) ) ( not ( = ?AUTO_5339 ?AUTO_5344 ) ) ( not ( = ?AUTO_5339 ?AUTO_5345 ) ) ( not ( = ?AUTO_5341 ?AUTO_5344 ) ) ( not ( = ?AUTO_5341 ?AUTO_5345 ) ) ( not ( = ?AUTO_5340 ?AUTO_5344 ) ) ( not ( = ?AUTO_5340 ?AUTO_5345 ) ) ( not ( = ?AUTO_5342 ?AUTO_5344 ) ) ( not ( = ?AUTO_5342 ?AUTO_5345 ) ) ( not ( = ?AUTO_5343 ?AUTO_5344 ) ) ( not ( = ?AUTO_5343 ?AUTO_5345 ) ) ( not ( = ?AUTO_5344 ?AUTO_5345 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5344 ?AUTO_5345 )
      ( MAKE-ON ?AUTO_5338 ?AUTO_5339 )
      ( MAKE-ON-VERIFY ?AUTO_5338 ?AUTO_5339 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5346 - BLOCK
      ?AUTO_5347 - BLOCK
    )
    :vars
    (
      ?AUTO_5349 - BLOCK
      ?AUTO_5348 - BLOCK
      ?AUTO_5350 - BLOCK
      ?AUTO_5353 - BLOCK
      ?AUTO_5352 - BLOCK
      ?AUTO_5351 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5347 ) ( not ( = ?AUTO_5346 ?AUTO_5347 ) ) ( ON-TABLE ?AUTO_5346 ) ( CLEAR ?AUTO_5349 ) ( not ( = ?AUTO_5346 ?AUTO_5348 ) ) ( not ( = ?AUTO_5346 ?AUTO_5349 ) ) ( not ( = ?AUTO_5347 ?AUTO_5348 ) ) ( not ( = ?AUTO_5347 ?AUTO_5349 ) ) ( not ( = ?AUTO_5348 ?AUTO_5349 ) ) ( ON ?AUTO_5348 ?AUTO_5346 ) ( CLEAR ?AUTO_5350 ) ( not ( = ?AUTO_5346 ?AUTO_5353 ) ) ( not ( = ?AUTO_5346 ?AUTO_5350 ) ) ( not ( = ?AUTO_5347 ?AUTO_5353 ) ) ( not ( = ?AUTO_5347 ?AUTO_5350 ) ) ( not ( = ?AUTO_5349 ?AUTO_5353 ) ) ( not ( = ?AUTO_5349 ?AUTO_5350 ) ) ( not ( = ?AUTO_5348 ?AUTO_5353 ) ) ( not ( = ?AUTO_5348 ?AUTO_5350 ) ) ( not ( = ?AUTO_5353 ?AUTO_5350 ) ) ( ON ?AUTO_5353 ?AUTO_5348 ) ( CLEAR ?AUTO_5352 ) ( not ( = ?AUTO_5346 ?AUTO_5351 ) ) ( not ( = ?AUTO_5346 ?AUTO_5352 ) ) ( not ( = ?AUTO_5347 ?AUTO_5351 ) ) ( not ( = ?AUTO_5347 ?AUTO_5352 ) ) ( not ( = ?AUTO_5349 ?AUTO_5351 ) ) ( not ( = ?AUTO_5349 ?AUTO_5352 ) ) ( not ( = ?AUTO_5348 ?AUTO_5351 ) ) ( not ( = ?AUTO_5348 ?AUTO_5352 ) ) ( not ( = ?AUTO_5350 ?AUTO_5351 ) ) ( not ( = ?AUTO_5350 ?AUTO_5352 ) ) ( not ( = ?AUTO_5353 ?AUTO_5351 ) ) ( not ( = ?AUTO_5353 ?AUTO_5352 ) ) ( not ( = ?AUTO_5351 ?AUTO_5352 ) ) ( ON ?AUTO_5351 ?AUTO_5353 ) ( CLEAR ?AUTO_5351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5351 ?AUTO_5353 )
      ( MAKE-ON ?AUTO_5346 ?AUTO_5347 )
      ( MAKE-ON-VERIFY ?AUTO_5346 ?AUTO_5347 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5354 - BLOCK
      ?AUTO_5355 - BLOCK
    )
    :vars
    (
      ?AUTO_5356 - BLOCK
      ?AUTO_5357 - BLOCK
      ?AUTO_5358 - BLOCK
      ?AUTO_5361 - BLOCK
      ?AUTO_5359 - BLOCK
      ?AUTO_5360 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5355 ) ( not ( = ?AUTO_5354 ?AUTO_5355 ) ) ( ON-TABLE ?AUTO_5354 ) ( not ( = ?AUTO_5354 ?AUTO_5356 ) ) ( not ( = ?AUTO_5354 ?AUTO_5357 ) ) ( not ( = ?AUTO_5355 ?AUTO_5356 ) ) ( not ( = ?AUTO_5355 ?AUTO_5357 ) ) ( not ( = ?AUTO_5356 ?AUTO_5357 ) ) ( ON ?AUTO_5356 ?AUTO_5354 ) ( CLEAR ?AUTO_5358 ) ( not ( = ?AUTO_5354 ?AUTO_5361 ) ) ( not ( = ?AUTO_5354 ?AUTO_5358 ) ) ( not ( = ?AUTO_5355 ?AUTO_5361 ) ) ( not ( = ?AUTO_5355 ?AUTO_5358 ) ) ( not ( = ?AUTO_5357 ?AUTO_5361 ) ) ( not ( = ?AUTO_5357 ?AUTO_5358 ) ) ( not ( = ?AUTO_5356 ?AUTO_5361 ) ) ( not ( = ?AUTO_5356 ?AUTO_5358 ) ) ( not ( = ?AUTO_5361 ?AUTO_5358 ) ) ( ON ?AUTO_5361 ?AUTO_5356 ) ( CLEAR ?AUTO_5359 ) ( not ( = ?AUTO_5354 ?AUTO_5360 ) ) ( not ( = ?AUTO_5354 ?AUTO_5359 ) ) ( not ( = ?AUTO_5355 ?AUTO_5360 ) ) ( not ( = ?AUTO_5355 ?AUTO_5359 ) ) ( not ( = ?AUTO_5357 ?AUTO_5360 ) ) ( not ( = ?AUTO_5357 ?AUTO_5359 ) ) ( not ( = ?AUTO_5356 ?AUTO_5360 ) ) ( not ( = ?AUTO_5356 ?AUTO_5359 ) ) ( not ( = ?AUTO_5358 ?AUTO_5360 ) ) ( not ( = ?AUTO_5358 ?AUTO_5359 ) ) ( not ( = ?AUTO_5361 ?AUTO_5360 ) ) ( not ( = ?AUTO_5361 ?AUTO_5359 ) ) ( not ( = ?AUTO_5360 ?AUTO_5359 ) ) ( ON ?AUTO_5360 ?AUTO_5361 ) ( CLEAR ?AUTO_5360 ) ( HOLDING ?AUTO_5357 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5357 )
      ( MAKE-ON ?AUTO_5354 ?AUTO_5355 )
      ( MAKE-ON-VERIFY ?AUTO_5354 ?AUTO_5355 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5362 - BLOCK
      ?AUTO_5363 - BLOCK
    )
    :vars
    (
      ?AUTO_5366 - BLOCK
      ?AUTO_5364 - BLOCK
      ?AUTO_5369 - BLOCK
      ?AUTO_5367 - BLOCK
      ?AUTO_5368 - BLOCK
      ?AUTO_5365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5362 ?AUTO_5363 ) ) ( ON-TABLE ?AUTO_5362 ) ( not ( = ?AUTO_5362 ?AUTO_5366 ) ) ( not ( = ?AUTO_5362 ?AUTO_5364 ) ) ( not ( = ?AUTO_5363 ?AUTO_5366 ) ) ( not ( = ?AUTO_5363 ?AUTO_5364 ) ) ( not ( = ?AUTO_5366 ?AUTO_5364 ) ) ( ON ?AUTO_5366 ?AUTO_5362 ) ( CLEAR ?AUTO_5369 ) ( not ( = ?AUTO_5362 ?AUTO_5367 ) ) ( not ( = ?AUTO_5362 ?AUTO_5369 ) ) ( not ( = ?AUTO_5363 ?AUTO_5367 ) ) ( not ( = ?AUTO_5363 ?AUTO_5369 ) ) ( not ( = ?AUTO_5364 ?AUTO_5367 ) ) ( not ( = ?AUTO_5364 ?AUTO_5369 ) ) ( not ( = ?AUTO_5366 ?AUTO_5367 ) ) ( not ( = ?AUTO_5366 ?AUTO_5369 ) ) ( not ( = ?AUTO_5367 ?AUTO_5369 ) ) ( ON ?AUTO_5367 ?AUTO_5366 ) ( CLEAR ?AUTO_5368 ) ( not ( = ?AUTO_5362 ?AUTO_5365 ) ) ( not ( = ?AUTO_5362 ?AUTO_5368 ) ) ( not ( = ?AUTO_5363 ?AUTO_5365 ) ) ( not ( = ?AUTO_5363 ?AUTO_5368 ) ) ( not ( = ?AUTO_5364 ?AUTO_5365 ) ) ( not ( = ?AUTO_5364 ?AUTO_5368 ) ) ( not ( = ?AUTO_5366 ?AUTO_5365 ) ) ( not ( = ?AUTO_5366 ?AUTO_5368 ) ) ( not ( = ?AUTO_5369 ?AUTO_5365 ) ) ( not ( = ?AUTO_5369 ?AUTO_5368 ) ) ( not ( = ?AUTO_5367 ?AUTO_5365 ) ) ( not ( = ?AUTO_5367 ?AUTO_5368 ) ) ( not ( = ?AUTO_5365 ?AUTO_5368 ) ) ( ON ?AUTO_5365 ?AUTO_5367 ) ( CLEAR ?AUTO_5365 ) ( ON ?AUTO_5364 ?AUTO_5363 ) ( CLEAR ?AUTO_5364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5364 ?AUTO_5363 )
      ( MAKE-ON ?AUTO_5362 ?AUTO_5363 )
      ( MAKE-ON-VERIFY ?AUTO_5362 ?AUTO_5363 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5370 - BLOCK
      ?AUTO_5371 - BLOCK
    )
    :vars
    (
      ?AUTO_5377 - BLOCK
      ?AUTO_5372 - BLOCK
      ?AUTO_5374 - BLOCK
      ?AUTO_5376 - BLOCK
      ?AUTO_5375 - BLOCK
      ?AUTO_5373 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5370 ?AUTO_5371 ) ) ( ON-TABLE ?AUTO_5370 ) ( not ( = ?AUTO_5370 ?AUTO_5377 ) ) ( not ( = ?AUTO_5370 ?AUTO_5372 ) ) ( not ( = ?AUTO_5371 ?AUTO_5377 ) ) ( not ( = ?AUTO_5371 ?AUTO_5372 ) ) ( not ( = ?AUTO_5377 ?AUTO_5372 ) ) ( ON ?AUTO_5377 ?AUTO_5370 ) ( CLEAR ?AUTO_5374 ) ( not ( = ?AUTO_5370 ?AUTO_5376 ) ) ( not ( = ?AUTO_5370 ?AUTO_5374 ) ) ( not ( = ?AUTO_5371 ?AUTO_5376 ) ) ( not ( = ?AUTO_5371 ?AUTO_5374 ) ) ( not ( = ?AUTO_5372 ?AUTO_5376 ) ) ( not ( = ?AUTO_5372 ?AUTO_5374 ) ) ( not ( = ?AUTO_5377 ?AUTO_5376 ) ) ( not ( = ?AUTO_5377 ?AUTO_5374 ) ) ( not ( = ?AUTO_5376 ?AUTO_5374 ) ) ( ON ?AUTO_5376 ?AUTO_5377 ) ( not ( = ?AUTO_5370 ?AUTO_5375 ) ) ( not ( = ?AUTO_5370 ?AUTO_5373 ) ) ( not ( = ?AUTO_5371 ?AUTO_5375 ) ) ( not ( = ?AUTO_5371 ?AUTO_5373 ) ) ( not ( = ?AUTO_5372 ?AUTO_5375 ) ) ( not ( = ?AUTO_5372 ?AUTO_5373 ) ) ( not ( = ?AUTO_5377 ?AUTO_5375 ) ) ( not ( = ?AUTO_5377 ?AUTO_5373 ) ) ( not ( = ?AUTO_5374 ?AUTO_5375 ) ) ( not ( = ?AUTO_5374 ?AUTO_5373 ) ) ( not ( = ?AUTO_5376 ?AUTO_5375 ) ) ( not ( = ?AUTO_5376 ?AUTO_5373 ) ) ( not ( = ?AUTO_5375 ?AUTO_5373 ) ) ( ON ?AUTO_5375 ?AUTO_5376 ) ( CLEAR ?AUTO_5375 ) ( ON ?AUTO_5372 ?AUTO_5371 ) ( CLEAR ?AUTO_5372 ) ( HOLDING ?AUTO_5373 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5373 )
      ( MAKE-ON ?AUTO_5370 ?AUTO_5371 )
      ( MAKE-ON-VERIFY ?AUTO_5370 ?AUTO_5371 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5378 - BLOCK
      ?AUTO_5379 - BLOCK
    )
    :vars
    (
      ?AUTO_5381 - BLOCK
      ?AUTO_5382 - BLOCK
      ?AUTO_5380 - BLOCK
      ?AUTO_5385 - BLOCK
      ?AUTO_5384 - BLOCK
      ?AUTO_5383 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5378 ?AUTO_5379 ) ) ( ON-TABLE ?AUTO_5378 ) ( not ( = ?AUTO_5378 ?AUTO_5381 ) ) ( not ( = ?AUTO_5378 ?AUTO_5382 ) ) ( not ( = ?AUTO_5379 ?AUTO_5381 ) ) ( not ( = ?AUTO_5379 ?AUTO_5382 ) ) ( not ( = ?AUTO_5381 ?AUTO_5382 ) ) ( ON ?AUTO_5381 ?AUTO_5378 ) ( not ( = ?AUTO_5378 ?AUTO_5380 ) ) ( not ( = ?AUTO_5378 ?AUTO_5385 ) ) ( not ( = ?AUTO_5379 ?AUTO_5380 ) ) ( not ( = ?AUTO_5379 ?AUTO_5385 ) ) ( not ( = ?AUTO_5382 ?AUTO_5380 ) ) ( not ( = ?AUTO_5382 ?AUTO_5385 ) ) ( not ( = ?AUTO_5381 ?AUTO_5380 ) ) ( not ( = ?AUTO_5381 ?AUTO_5385 ) ) ( not ( = ?AUTO_5380 ?AUTO_5385 ) ) ( ON ?AUTO_5380 ?AUTO_5381 ) ( not ( = ?AUTO_5378 ?AUTO_5384 ) ) ( not ( = ?AUTO_5378 ?AUTO_5383 ) ) ( not ( = ?AUTO_5379 ?AUTO_5384 ) ) ( not ( = ?AUTO_5379 ?AUTO_5383 ) ) ( not ( = ?AUTO_5382 ?AUTO_5384 ) ) ( not ( = ?AUTO_5382 ?AUTO_5383 ) ) ( not ( = ?AUTO_5381 ?AUTO_5384 ) ) ( not ( = ?AUTO_5381 ?AUTO_5383 ) ) ( not ( = ?AUTO_5385 ?AUTO_5384 ) ) ( not ( = ?AUTO_5385 ?AUTO_5383 ) ) ( not ( = ?AUTO_5380 ?AUTO_5384 ) ) ( not ( = ?AUTO_5380 ?AUTO_5383 ) ) ( not ( = ?AUTO_5384 ?AUTO_5383 ) ) ( ON ?AUTO_5384 ?AUTO_5380 ) ( CLEAR ?AUTO_5384 ) ( ON ?AUTO_5382 ?AUTO_5379 ) ( CLEAR ?AUTO_5382 ) ( ON ?AUTO_5383 ?AUTO_5385 ) ( CLEAR ?AUTO_5383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5383 ?AUTO_5385 )
      ( MAKE-ON ?AUTO_5378 ?AUTO_5379 )
      ( MAKE-ON-VERIFY ?AUTO_5378 ?AUTO_5379 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5387 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5387 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5387 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5387 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5388 - BLOCK
    )
    :vars
    (
      ?AUTO_5389 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5388 ?AUTO_5389 ) ( CLEAR ?AUTO_5388 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5388 ?AUTO_5389 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5388 ?AUTO_5389 )
      ( MAKE-ON-TABLE ?AUTO_5388 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5388 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5391 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5391 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5391 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5391 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5392 - BLOCK
    )
    :vars
    (
      ?AUTO_5393 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5392 ?AUTO_5393 ) ( CLEAR ?AUTO_5392 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5392 ?AUTO_5393 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5392 ?AUTO_5393 )
      ( MAKE-ON-TABLE ?AUTO_5392 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5392 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5394 - BLOCK
    )
    :vars
    (
      ?AUTO_5395 - BLOCK
      ?AUTO_5396 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5394 ?AUTO_5395 ) ( CLEAR ?AUTO_5394 ) ( not ( = ?AUTO_5394 ?AUTO_5395 ) ) ( HOLDING ?AUTO_5396 ) ( not ( = ?AUTO_5394 ?AUTO_5396 ) ) ( not ( = ?AUTO_5395 ?AUTO_5396 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5396 )
      ( MAKE-ON-TABLE ?AUTO_5394 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5394 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5397 - BLOCK
    )
    :vars
    (
      ?AUTO_5399 - BLOCK
      ?AUTO_5398 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5397 ?AUTO_5399 ) ( not ( = ?AUTO_5397 ?AUTO_5399 ) ) ( not ( = ?AUTO_5397 ?AUTO_5398 ) ) ( not ( = ?AUTO_5399 ?AUTO_5398 ) ) ( ON ?AUTO_5398 ?AUTO_5397 ) ( CLEAR ?AUTO_5398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5398 ?AUTO_5397 )
      ( MAKE-ON-TABLE ?AUTO_5397 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5397 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5401 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5401 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5401 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5401 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5402 - BLOCK
    )
    :vars
    (
      ?AUTO_5403 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5402 ?AUTO_5403 ) ( CLEAR ?AUTO_5402 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5402 ?AUTO_5403 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5402 ?AUTO_5403 )
      ( MAKE-ON-TABLE ?AUTO_5402 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5402 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5404 - BLOCK
    )
    :vars
    (
      ?AUTO_5405 - BLOCK
      ?AUTO_5406 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5404 ?AUTO_5405 ) ( CLEAR ?AUTO_5404 ) ( not ( = ?AUTO_5404 ?AUTO_5405 ) ) ( HOLDING ?AUTO_5406 ) ( not ( = ?AUTO_5404 ?AUTO_5406 ) ) ( not ( = ?AUTO_5405 ?AUTO_5406 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5406 )
      ( MAKE-ON-TABLE ?AUTO_5404 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5404 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5407 - BLOCK
    )
    :vars
    (
      ?AUTO_5408 - BLOCK
      ?AUTO_5409 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5407 ?AUTO_5408 ) ( not ( = ?AUTO_5407 ?AUTO_5408 ) ) ( not ( = ?AUTO_5407 ?AUTO_5409 ) ) ( not ( = ?AUTO_5408 ?AUTO_5409 ) ) ( ON ?AUTO_5409 ?AUTO_5407 ) ( CLEAR ?AUTO_5409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5409 ?AUTO_5407 )
      ( MAKE-ON-TABLE ?AUTO_5407 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5407 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5410 - BLOCK
    )
    :vars
    (
      ?AUTO_5411 - BLOCK
      ?AUTO_5412 - BLOCK
      ?AUTO_5413 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5410 ?AUTO_5411 ) ( not ( = ?AUTO_5410 ?AUTO_5411 ) ) ( not ( = ?AUTO_5410 ?AUTO_5412 ) ) ( not ( = ?AUTO_5411 ?AUTO_5412 ) ) ( ON ?AUTO_5412 ?AUTO_5410 ) ( CLEAR ?AUTO_5412 ) ( HOLDING ?AUTO_5413 ) ( not ( = ?AUTO_5410 ?AUTO_5413 ) ) ( not ( = ?AUTO_5411 ?AUTO_5413 ) ) ( not ( = ?AUTO_5412 ?AUTO_5413 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5413 )
      ( MAKE-ON-TABLE ?AUTO_5410 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5410 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5414 - BLOCK
    )
    :vars
    (
      ?AUTO_5415 - BLOCK
      ?AUTO_5416 - BLOCK
      ?AUTO_5417 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5414 ?AUTO_5415 ) ( not ( = ?AUTO_5414 ?AUTO_5415 ) ) ( not ( = ?AUTO_5414 ?AUTO_5416 ) ) ( not ( = ?AUTO_5415 ?AUTO_5416 ) ) ( ON ?AUTO_5416 ?AUTO_5414 ) ( not ( = ?AUTO_5414 ?AUTO_5417 ) ) ( not ( = ?AUTO_5415 ?AUTO_5417 ) ) ( not ( = ?AUTO_5416 ?AUTO_5417 ) ) ( ON ?AUTO_5417 ?AUTO_5416 ) ( CLEAR ?AUTO_5417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5417 ?AUTO_5416 )
      ( MAKE-ON-TABLE ?AUTO_5414 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5414 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5420 - BLOCK
      ?AUTO_5421 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5420 ) ( CLEAR ?AUTO_5421 ) ( not ( = ?AUTO_5420 ?AUTO_5421 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5420 ?AUTO_5421 )
      ( MAKE-ON-VERIFY ?AUTO_5420 ?AUTO_5421 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5422 - BLOCK
      ?AUTO_5423 - BLOCK
    )
    :vars
    (
      ?AUTO_5424 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5423 ) ( not ( = ?AUTO_5422 ?AUTO_5423 ) ) ( ON ?AUTO_5422 ?AUTO_5424 ) ( CLEAR ?AUTO_5422 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5422 ?AUTO_5424 ) ) ( not ( = ?AUTO_5423 ?AUTO_5424 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5422 ?AUTO_5424 )
      ( MAKE-ON ?AUTO_5422 ?AUTO_5423 )
      ( MAKE-ON-VERIFY ?AUTO_5422 ?AUTO_5423 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5425 - BLOCK
      ?AUTO_5426 - BLOCK
    )
    :vars
    (
      ?AUTO_5427 - BLOCK
      ?AUTO_5428 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5426 ) ( not ( = ?AUTO_5425 ?AUTO_5426 ) ) ( ON ?AUTO_5425 ?AUTO_5427 ) ( CLEAR ?AUTO_5425 ) ( not ( = ?AUTO_5425 ?AUTO_5427 ) ) ( not ( = ?AUTO_5426 ?AUTO_5427 ) ) ( HOLDING ?AUTO_5428 ) ( not ( = ?AUTO_5425 ?AUTO_5428 ) ) ( not ( = ?AUTO_5426 ?AUTO_5428 ) ) ( not ( = ?AUTO_5427 ?AUTO_5428 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5428 )
      ( MAKE-ON ?AUTO_5425 ?AUTO_5426 )
      ( MAKE-ON-VERIFY ?AUTO_5425 ?AUTO_5426 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5429 - BLOCK
      ?AUTO_5430 - BLOCK
    )
    :vars
    (
      ?AUTO_5431 - BLOCK
      ?AUTO_5432 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5429 ?AUTO_5430 ) ) ( ON ?AUTO_5429 ?AUTO_5431 ) ( CLEAR ?AUTO_5429 ) ( not ( = ?AUTO_5429 ?AUTO_5431 ) ) ( not ( = ?AUTO_5430 ?AUTO_5431 ) ) ( not ( = ?AUTO_5429 ?AUTO_5432 ) ) ( not ( = ?AUTO_5430 ?AUTO_5432 ) ) ( not ( = ?AUTO_5431 ?AUTO_5432 ) ) ( ON ?AUTO_5432 ?AUTO_5430 ) ( CLEAR ?AUTO_5432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5432 ?AUTO_5430 )
      ( MAKE-ON ?AUTO_5429 ?AUTO_5430 )
      ( MAKE-ON-VERIFY ?AUTO_5429 ?AUTO_5430 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5433 - BLOCK
      ?AUTO_5434 - BLOCK
    )
    :vars
    (
      ?AUTO_5435 - BLOCK
      ?AUTO_5436 - BLOCK
      ?AUTO_5437 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5433 ?AUTO_5434 ) ) ( ON ?AUTO_5433 ?AUTO_5435 ) ( CLEAR ?AUTO_5433 ) ( not ( = ?AUTO_5433 ?AUTO_5435 ) ) ( not ( = ?AUTO_5434 ?AUTO_5435 ) ) ( not ( = ?AUTO_5433 ?AUTO_5436 ) ) ( not ( = ?AUTO_5434 ?AUTO_5436 ) ) ( not ( = ?AUTO_5435 ?AUTO_5436 ) ) ( ON ?AUTO_5436 ?AUTO_5434 ) ( CLEAR ?AUTO_5436 ) ( HOLDING ?AUTO_5437 ) ( not ( = ?AUTO_5433 ?AUTO_5437 ) ) ( not ( = ?AUTO_5434 ?AUTO_5437 ) ) ( not ( = ?AUTO_5435 ?AUTO_5437 ) ) ( not ( = ?AUTO_5436 ?AUTO_5437 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5437 )
      ( MAKE-ON ?AUTO_5433 ?AUTO_5434 )
      ( MAKE-ON-VERIFY ?AUTO_5433 ?AUTO_5434 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5438 - BLOCK
      ?AUTO_5439 - BLOCK
    )
    :vars
    (
      ?AUTO_5440 - BLOCK
      ?AUTO_5441 - BLOCK
      ?AUTO_5442 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5438 ?AUTO_5439 ) ) ( ON ?AUTO_5438 ?AUTO_5440 ) ( CLEAR ?AUTO_5438 ) ( not ( = ?AUTO_5438 ?AUTO_5440 ) ) ( not ( = ?AUTO_5439 ?AUTO_5440 ) ) ( not ( = ?AUTO_5438 ?AUTO_5441 ) ) ( not ( = ?AUTO_5439 ?AUTO_5441 ) ) ( not ( = ?AUTO_5440 ?AUTO_5441 ) ) ( ON ?AUTO_5441 ?AUTO_5439 ) ( not ( = ?AUTO_5438 ?AUTO_5442 ) ) ( not ( = ?AUTO_5439 ?AUTO_5442 ) ) ( not ( = ?AUTO_5440 ?AUTO_5442 ) ) ( not ( = ?AUTO_5441 ?AUTO_5442 ) ) ( ON ?AUTO_5442 ?AUTO_5441 ) ( CLEAR ?AUTO_5442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5442 ?AUTO_5441 )
      ( MAKE-ON ?AUTO_5438 ?AUTO_5439 )
      ( MAKE-ON-VERIFY ?AUTO_5438 ?AUTO_5439 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5443 - BLOCK
      ?AUTO_5444 - BLOCK
    )
    :vars
    (
      ?AUTO_5446 - BLOCK
      ?AUTO_5445 - BLOCK
      ?AUTO_5447 - BLOCK
      ?AUTO_5448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5443 ?AUTO_5444 ) ) ( ON ?AUTO_5443 ?AUTO_5446 ) ( CLEAR ?AUTO_5443 ) ( not ( = ?AUTO_5443 ?AUTO_5446 ) ) ( not ( = ?AUTO_5444 ?AUTO_5446 ) ) ( not ( = ?AUTO_5443 ?AUTO_5445 ) ) ( not ( = ?AUTO_5444 ?AUTO_5445 ) ) ( not ( = ?AUTO_5446 ?AUTO_5445 ) ) ( ON ?AUTO_5445 ?AUTO_5444 ) ( not ( = ?AUTO_5443 ?AUTO_5447 ) ) ( not ( = ?AUTO_5444 ?AUTO_5447 ) ) ( not ( = ?AUTO_5446 ?AUTO_5447 ) ) ( not ( = ?AUTO_5445 ?AUTO_5447 ) ) ( ON ?AUTO_5447 ?AUTO_5445 ) ( CLEAR ?AUTO_5447 ) ( HOLDING ?AUTO_5448 ) ( not ( = ?AUTO_5443 ?AUTO_5448 ) ) ( not ( = ?AUTO_5444 ?AUTO_5448 ) ) ( not ( = ?AUTO_5446 ?AUTO_5448 ) ) ( not ( = ?AUTO_5445 ?AUTO_5448 ) ) ( not ( = ?AUTO_5447 ?AUTO_5448 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5448 )
      ( MAKE-ON ?AUTO_5443 ?AUTO_5444 )
      ( MAKE-ON-VERIFY ?AUTO_5443 ?AUTO_5444 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5449 - BLOCK
      ?AUTO_5450 - BLOCK
    )
    :vars
    (
      ?AUTO_5451 - BLOCK
      ?AUTO_5452 - BLOCK
      ?AUTO_5454 - BLOCK
      ?AUTO_5453 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5449 ?AUTO_5450 ) ) ( ON ?AUTO_5449 ?AUTO_5451 ) ( CLEAR ?AUTO_5449 ) ( not ( = ?AUTO_5449 ?AUTO_5451 ) ) ( not ( = ?AUTO_5450 ?AUTO_5451 ) ) ( not ( = ?AUTO_5449 ?AUTO_5452 ) ) ( not ( = ?AUTO_5450 ?AUTO_5452 ) ) ( not ( = ?AUTO_5451 ?AUTO_5452 ) ) ( ON ?AUTO_5452 ?AUTO_5450 ) ( not ( = ?AUTO_5449 ?AUTO_5454 ) ) ( not ( = ?AUTO_5450 ?AUTO_5454 ) ) ( not ( = ?AUTO_5451 ?AUTO_5454 ) ) ( not ( = ?AUTO_5452 ?AUTO_5454 ) ) ( ON ?AUTO_5454 ?AUTO_5452 ) ( not ( = ?AUTO_5449 ?AUTO_5453 ) ) ( not ( = ?AUTO_5450 ?AUTO_5453 ) ) ( not ( = ?AUTO_5451 ?AUTO_5453 ) ) ( not ( = ?AUTO_5452 ?AUTO_5453 ) ) ( not ( = ?AUTO_5454 ?AUTO_5453 ) ) ( ON ?AUTO_5453 ?AUTO_5454 ) ( CLEAR ?AUTO_5453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5453 ?AUTO_5454 )
      ( MAKE-ON ?AUTO_5449 ?AUTO_5450 )
      ( MAKE-ON-VERIFY ?AUTO_5449 ?AUTO_5450 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5457 - BLOCK
      ?AUTO_5458 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5457 ) ( CLEAR ?AUTO_5458 ) ( not ( = ?AUTO_5457 ?AUTO_5458 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5457 ?AUTO_5458 )
      ( MAKE-ON-VERIFY ?AUTO_5457 ?AUTO_5458 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5459 - BLOCK
      ?AUTO_5460 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5460 ) ( not ( = ?AUTO_5459 ?AUTO_5460 ) ) ( ON-TABLE ?AUTO_5459 ) ( CLEAR ?AUTO_5459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5459 )
      ( MAKE-ON ?AUTO_5459 ?AUTO_5460 )
      ( MAKE-ON-VERIFY ?AUTO_5459 ?AUTO_5460 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5461 - BLOCK
      ?AUTO_5462 - BLOCK
    )
    :vars
    (
      ?AUTO_5463 - BLOCK
      ?AUTO_5464 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5462 ) ( not ( = ?AUTO_5461 ?AUTO_5462 ) ) ( ON-TABLE ?AUTO_5461 ) ( CLEAR ?AUTO_5461 ) ( HOLDING ?AUTO_5463 ) ( CLEAR ?AUTO_5464 ) ( not ( = ?AUTO_5461 ?AUTO_5463 ) ) ( not ( = ?AUTO_5461 ?AUTO_5464 ) ) ( not ( = ?AUTO_5462 ?AUTO_5463 ) ) ( not ( = ?AUTO_5462 ?AUTO_5464 ) ) ( not ( = ?AUTO_5463 ?AUTO_5464 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5463 ?AUTO_5464 )
      ( MAKE-ON ?AUTO_5461 ?AUTO_5462 )
      ( MAKE-ON-VERIFY ?AUTO_5461 ?AUTO_5462 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5467 - BLOCK
      ?AUTO_5468 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5467 ?AUTO_5468 ) ) ( ON-TABLE ?AUTO_5467 ) ( CLEAR ?AUTO_5467 ) ( HOLDING ?AUTO_5468 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5468 )
      ( MAKE-ON ?AUTO_5467 ?AUTO_5468 )
      ( MAKE-ON-VERIFY ?AUTO_5467 ?AUTO_5468 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5473 - BLOCK
      ?AUTO_5474 - BLOCK
    )
    :vars
    (
      ?AUTO_5476 - BLOCK
      ?AUTO_5475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5473 ?AUTO_5474 ) ) ( ON-TABLE ?AUTO_5473 ) ( CLEAR ?AUTO_5473 ) ( CLEAR ?AUTO_5476 ) ( not ( = ?AUTO_5473 ?AUTO_5475 ) ) ( not ( = ?AUTO_5473 ?AUTO_5476 ) ) ( not ( = ?AUTO_5474 ?AUTO_5475 ) ) ( not ( = ?AUTO_5474 ?AUTO_5476 ) ) ( not ( = ?AUTO_5475 ?AUTO_5476 ) ) ( ON ?AUTO_5475 ?AUTO_5474 ) ( CLEAR ?AUTO_5475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5475 ?AUTO_5474 )
      ( MAKE-ON ?AUTO_5473 ?AUTO_5474 )
      ( MAKE-ON-VERIFY ?AUTO_5473 ?AUTO_5474 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5477 - BLOCK
      ?AUTO_5478 - BLOCK
    )
    :vars
    (
      ?AUTO_5480 - BLOCK
      ?AUTO_5479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5477 ?AUTO_5478 ) ) ( CLEAR ?AUTO_5480 ) ( not ( = ?AUTO_5477 ?AUTO_5479 ) ) ( not ( = ?AUTO_5477 ?AUTO_5480 ) ) ( not ( = ?AUTO_5478 ?AUTO_5479 ) ) ( not ( = ?AUTO_5478 ?AUTO_5480 ) ) ( not ( = ?AUTO_5479 ?AUTO_5480 ) ) ( ON ?AUTO_5479 ?AUTO_5478 ) ( CLEAR ?AUTO_5479 ) ( HOLDING ?AUTO_5477 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5477 )
      ( MAKE-ON ?AUTO_5477 ?AUTO_5478 )
      ( MAKE-ON-VERIFY ?AUTO_5477 ?AUTO_5478 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5481 - BLOCK
      ?AUTO_5482 - BLOCK
    )
    :vars
    (
      ?AUTO_5484 - BLOCK
      ?AUTO_5483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5481 ?AUTO_5482 ) ) ( CLEAR ?AUTO_5484 ) ( not ( = ?AUTO_5481 ?AUTO_5483 ) ) ( not ( = ?AUTO_5481 ?AUTO_5484 ) ) ( not ( = ?AUTO_5482 ?AUTO_5483 ) ) ( not ( = ?AUTO_5482 ?AUTO_5484 ) ) ( not ( = ?AUTO_5483 ?AUTO_5484 ) ) ( ON ?AUTO_5483 ?AUTO_5482 ) ( ON ?AUTO_5481 ?AUTO_5483 ) ( CLEAR ?AUTO_5481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5481 ?AUTO_5483 )
      ( MAKE-ON ?AUTO_5481 ?AUTO_5482 )
      ( MAKE-ON-VERIFY ?AUTO_5481 ?AUTO_5482 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5486 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5486 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5486 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5486 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5487 - BLOCK
    )
    :vars
    (
      ?AUTO_5488 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5487 ?AUTO_5488 ) ( CLEAR ?AUTO_5487 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5487 ?AUTO_5488 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5487 ?AUTO_5488 )
      ( MAKE-ON-TABLE ?AUTO_5487 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5487 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5489 - BLOCK
    )
    :vars
    (
      ?AUTO_5490 - BLOCK
      ?AUTO_5491 - BLOCK
      ?AUTO_5492 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5489 ?AUTO_5490 ) ( CLEAR ?AUTO_5489 ) ( not ( = ?AUTO_5489 ?AUTO_5490 ) ) ( HOLDING ?AUTO_5491 ) ( CLEAR ?AUTO_5492 ) ( not ( = ?AUTO_5489 ?AUTO_5491 ) ) ( not ( = ?AUTO_5489 ?AUTO_5492 ) ) ( not ( = ?AUTO_5490 ?AUTO_5491 ) ) ( not ( = ?AUTO_5490 ?AUTO_5492 ) ) ( not ( = ?AUTO_5491 ?AUTO_5492 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5491 ?AUTO_5492 )
      ( MAKE-ON-TABLE ?AUTO_5489 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5489 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5495 - BLOCK
    )
    :vars
    (
      ?AUTO_5498 - BLOCK
      ?AUTO_5496 - BLOCK
      ?AUTO_5497 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5495 ?AUTO_5498 ) ( not ( = ?AUTO_5495 ?AUTO_5498 ) ) ( CLEAR ?AUTO_5496 ) ( not ( = ?AUTO_5495 ?AUTO_5497 ) ) ( not ( = ?AUTO_5495 ?AUTO_5496 ) ) ( not ( = ?AUTO_5498 ?AUTO_5497 ) ) ( not ( = ?AUTO_5498 ?AUTO_5496 ) ) ( not ( = ?AUTO_5497 ?AUTO_5496 ) ) ( ON ?AUTO_5497 ?AUTO_5495 ) ( CLEAR ?AUTO_5497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5497 ?AUTO_5495 )
      ( MAKE-ON-TABLE ?AUTO_5495 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5495 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5499 - BLOCK
    )
    :vars
    (
      ?AUTO_5502 - BLOCK
      ?AUTO_5501 - BLOCK
      ?AUTO_5500 - BLOCK
      ?AUTO_5503 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5499 ?AUTO_5502 ) ( not ( = ?AUTO_5499 ?AUTO_5502 ) ) ( CLEAR ?AUTO_5501 ) ( not ( = ?AUTO_5499 ?AUTO_5500 ) ) ( not ( = ?AUTO_5499 ?AUTO_5501 ) ) ( not ( = ?AUTO_5502 ?AUTO_5500 ) ) ( not ( = ?AUTO_5502 ?AUTO_5501 ) ) ( not ( = ?AUTO_5500 ?AUTO_5501 ) ) ( ON ?AUTO_5500 ?AUTO_5499 ) ( CLEAR ?AUTO_5500 ) ( HOLDING ?AUTO_5503 ) ( not ( = ?AUTO_5499 ?AUTO_5503 ) ) ( not ( = ?AUTO_5502 ?AUTO_5503 ) ) ( not ( = ?AUTO_5501 ?AUTO_5503 ) ) ( not ( = ?AUTO_5500 ?AUTO_5503 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5503 )
      ( MAKE-ON-TABLE ?AUTO_5499 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5499 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5510 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5510 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5510 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5510 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5511 - BLOCK
    )
    :vars
    (
      ?AUTO_5512 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5511 ?AUTO_5512 ) ( CLEAR ?AUTO_5511 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5511 ?AUTO_5512 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5511 ?AUTO_5512 )
      ( MAKE-ON-TABLE ?AUTO_5511 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5511 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5513 - BLOCK
    )
    :vars
    (
      ?AUTO_5514 - BLOCK
      ?AUTO_5515 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5513 ?AUTO_5514 ) ( CLEAR ?AUTO_5513 ) ( not ( = ?AUTO_5513 ?AUTO_5514 ) ) ( HOLDING ?AUTO_5515 ) ( not ( = ?AUTO_5513 ?AUTO_5515 ) ) ( not ( = ?AUTO_5514 ?AUTO_5515 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5515 )
      ( MAKE-ON-TABLE ?AUTO_5513 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5513 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5516 - BLOCK
    )
    :vars
    (
      ?AUTO_5517 - BLOCK
      ?AUTO_5518 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5516 ?AUTO_5517 ) ( not ( = ?AUTO_5516 ?AUTO_5517 ) ) ( not ( = ?AUTO_5516 ?AUTO_5518 ) ) ( not ( = ?AUTO_5517 ?AUTO_5518 ) ) ( ON ?AUTO_5518 ?AUTO_5516 ) ( CLEAR ?AUTO_5518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5518 ?AUTO_5516 )
      ( MAKE-ON-TABLE ?AUTO_5516 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5516 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5519 - BLOCK
    )
    :vars
    (
      ?AUTO_5520 - BLOCK
      ?AUTO_5521 - BLOCK
      ?AUTO_5522 - BLOCK
      ?AUTO_5523 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5519 ?AUTO_5520 ) ( not ( = ?AUTO_5519 ?AUTO_5520 ) ) ( not ( = ?AUTO_5519 ?AUTO_5521 ) ) ( not ( = ?AUTO_5520 ?AUTO_5521 ) ) ( ON ?AUTO_5521 ?AUTO_5519 ) ( CLEAR ?AUTO_5521 ) ( HOLDING ?AUTO_5522 ) ( CLEAR ?AUTO_5523 ) ( not ( = ?AUTO_5519 ?AUTO_5522 ) ) ( not ( = ?AUTO_5519 ?AUTO_5523 ) ) ( not ( = ?AUTO_5520 ?AUTO_5522 ) ) ( not ( = ?AUTO_5520 ?AUTO_5523 ) ) ( not ( = ?AUTO_5521 ?AUTO_5522 ) ) ( not ( = ?AUTO_5521 ?AUTO_5523 ) ) ( not ( = ?AUTO_5522 ?AUTO_5523 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5522 ?AUTO_5523 )
      ( MAKE-ON-TABLE ?AUTO_5519 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5519 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5526 - BLOCK
    )
    :vars
    (
      ?AUTO_5530 - BLOCK
      ?AUTO_5529 - BLOCK
      ?AUTO_5528 - BLOCK
      ?AUTO_5527 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5526 ?AUTO_5530 ) ( not ( = ?AUTO_5526 ?AUTO_5530 ) ) ( not ( = ?AUTO_5526 ?AUTO_5529 ) ) ( not ( = ?AUTO_5530 ?AUTO_5529 ) ) ( ON ?AUTO_5529 ?AUTO_5526 ) ( CLEAR ?AUTO_5528 ) ( not ( = ?AUTO_5526 ?AUTO_5527 ) ) ( not ( = ?AUTO_5526 ?AUTO_5528 ) ) ( not ( = ?AUTO_5530 ?AUTO_5527 ) ) ( not ( = ?AUTO_5530 ?AUTO_5528 ) ) ( not ( = ?AUTO_5529 ?AUTO_5527 ) ) ( not ( = ?AUTO_5529 ?AUTO_5528 ) ) ( not ( = ?AUTO_5527 ?AUTO_5528 ) ) ( ON ?AUTO_5527 ?AUTO_5529 ) ( CLEAR ?AUTO_5527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5527 ?AUTO_5529 )
      ( MAKE-ON-TABLE ?AUTO_5526 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5526 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5531 - BLOCK
    )
    :vars
    (
      ?AUTO_5532 - BLOCK
      ?AUTO_5533 - BLOCK
      ?AUTO_5535 - BLOCK
      ?AUTO_5534 - BLOCK
      ?AUTO_5536 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5531 ?AUTO_5532 ) ( not ( = ?AUTO_5531 ?AUTO_5532 ) ) ( not ( = ?AUTO_5531 ?AUTO_5533 ) ) ( not ( = ?AUTO_5532 ?AUTO_5533 ) ) ( ON ?AUTO_5533 ?AUTO_5531 ) ( CLEAR ?AUTO_5535 ) ( not ( = ?AUTO_5531 ?AUTO_5534 ) ) ( not ( = ?AUTO_5531 ?AUTO_5535 ) ) ( not ( = ?AUTO_5532 ?AUTO_5534 ) ) ( not ( = ?AUTO_5532 ?AUTO_5535 ) ) ( not ( = ?AUTO_5533 ?AUTO_5534 ) ) ( not ( = ?AUTO_5533 ?AUTO_5535 ) ) ( not ( = ?AUTO_5534 ?AUTO_5535 ) ) ( ON ?AUTO_5534 ?AUTO_5533 ) ( CLEAR ?AUTO_5534 ) ( HOLDING ?AUTO_5536 ) ( not ( = ?AUTO_5531 ?AUTO_5536 ) ) ( not ( = ?AUTO_5532 ?AUTO_5536 ) ) ( not ( = ?AUTO_5533 ?AUTO_5536 ) ) ( not ( = ?AUTO_5535 ?AUTO_5536 ) ) ( not ( = ?AUTO_5534 ?AUTO_5536 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5536 )
      ( MAKE-ON-TABLE ?AUTO_5531 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5531 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5543 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5543 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5543 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5543 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5544 - BLOCK
    )
    :vars
    (
      ?AUTO_5545 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5544 ?AUTO_5545 ) ( CLEAR ?AUTO_5544 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5544 ?AUTO_5545 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5544 ?AUTO_5545 )
      ( MAKE-ON-TABLE ?AUTO_5544 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5544 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5546 - BLOCK
    )
    :vars
    (
      ?AUTO_5547 - BLOCK
      ?AUTO_5548 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5546 ?AUTO_5547 ) ( CLEAR ?AUTO_5546 ) ( not ( = ?AUTO_5546 ?AUTO_5547 ) ) ( HOLDING ?AUTO_5548 ) ( not ( = ?AUTO_5546 ?AUTO_5548 ) ) ( not ( = ?AUTO_5547 ?AUTO_5548 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5548 )
      ( MAKE-ON-TABLE ?AUTO_5546 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5546 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5549 - BLOCK
    )
    :vars
    (
      ?AUTO_5550 - BLOCK
      ?AUTO_5551 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5549 ?AUTO_5550 ) ( not ( = ?AUTO_5549 ?AUTO_5550 ) ) ( not ( = ?AUTO_5549 ?AUTO_5551 ) ) ( not ( = ?AUTO_5550 ?AUTO_5551 ) ) ( ON ?AUTO_5551 ?AUTO_5549 ) ( CLEAR ?AUTO_5551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5551 ?AUTO_5549 )
      ( MAKE-ON-TABLE ?AUTO_5549 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5549 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5552 - BLOCK
    )
    :vars
    (
      ?AUTO_5553 - BLOCK
      ?AUTO_5554 - BLOCK
      ?AUTO_5555 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5552 ?AUTO_5553 ) ( not ( = ?AUTO_5552 ?AUTO_5553 ) ) ( not ( = ?AUTO_5552 ?AUTO_5554 ) ) ( not ( = ?AUTO_5553 ?AUTO_5554 ) ) ( ON ?AUTO_5554 ?AUTO_5552 ) ( CLEAR ?AUTO_5554 ) ( HOLDING ?AUTO_5555 ) ( not ( = ?AUTO_5552 ?AUTO_5555 ) ) ( not ( = ?AUTO_5553 ?AUTO_5555 ) ) ( not ( = ?AUTO_5554 ?AUTO_5555 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5555 )
      ( MAKE-ON-TABLE ?AUTO_5552 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5552 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5556 - BLOCK
    )
    :vars
    (
      ?AUTO_5557 - BLOCK
      ?AUTO_5558 - BLOCK
      ?AUTO_5559 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5556 ?AUTO_5557 ) ( not ( = ?AUTO_5556 ?AUTO_5557 ) ) ( not ( = ?AUTO_5556 ?AUTO_5558 ) ) ( not ( = ?AUTO_5557 ?AUTO_5558 ) ) ( ON ?AUTO_5558 ?AUTO_5556 ) ( not ( = ?AUTO_5556 ?AUTO_5559 ) ) ( not ( = ?AUTO_5557 ?AUTO_5559 ) ) ( not ( = ?AUTO_5558 ?AUTO_5559 ) ) ( ON ?AUTO_5559 ?AUTO_5558 ) ( CLEAR ?AUTO_5559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5559 ?AUTO_5558 )
      ( MAKE-ON-TABLE ?AUTO_5556 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5556 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5560 - BLOCK
    )
    :vars
    (
      ?AUTO_5563 - BLOCK
      ?AUTO_5561 - BLOCK
      ?AUTO_5562 - BLOCK
      ?AUTO_5564 - BLOCK
      ?AUTO_5565 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5560 ?AUTO_5563 ) ( not ( = ?AUTO_5560 ?AUTO_5563 ) ) ( not ( = ?AUTO_5560 ?AUTO_5561 ) ) ( not ( = ?AUTO_5563 ?AUTO_5561 ) ) ( ON ?AUTO_5561 ?AUTO_5560 ) ( not ( = ?AUTO_5560 ?AUTO_5562 ) ) ( not ( = ?AUTO_5563 ?AUTO_5562 ) ) ( not ( = ?AUTO_5561 ?AUTO_5562 ) ) ( ON ?AUTO_5562 ?AUTO_5561 ) ( CLEAR ?AUTO_5562 ) ( HOLDING ?AUTO_5564 ) ( CLEAR ?AUTO_5565 ) ( not ( = ?AUTO_5560 ?AUTO_5564 ) ) ( not ( = ?AUTO_5560 ?AUTO_5565 ) ) ( not ( = ?AUTO_5563 ?AUTO_5564 ) ) ( not ( = ?AUTO_5563 ?AUTO_5565 ) ) ( not ( = ?AUTO_5561 ?AUTO_5564 ) ) ( not ( = ?AUTO_5561 ?AUTO_5565 ) ) ( not ( = ?AUTO_5562 ?AUTO_5564 ) ) ( not ( = ?AUTO_5562 ?AUTO_5565 ) ) ( not ( = ?AUTO_5564 ?AUTO_5565 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5564 ?AUTO_5565 )
      ( MAKE-ON-TABLE ?AUTO_5560 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5560 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5568 - BLOCK
    )
    :vars
    (
      ?AUTO_5573 - BLOCK
      ?AUTO_5570 - BLOCK
      ?AUTO_5569 - BLOCK
      ?AUTO_5572 - BLOCK
      ?AUTO_5571 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5568 ?AUTO_5573 ) ( not ( = ?AUTO_5568 ?AUTO_5573 ) ) ( not ( = ?AUTO_5568 ?AUTO_5570 ) ) ( not ( = ?AUTO_5573 ?AUTO_5570 ) ) ( ON ?AUTO_5570 ?AUTO_5568 ) ( not ( = ?AUTO_5568 ?AUTO_5569 ) ) ( not ( = ?AUTO_5573 ?AUTO_5569 ) ) ( not ( = ?AUTO_5570 ?AUTO_5569 ) ) ( ON ?AUTO_5569 ?AUTO_5570 ) ( CLEAR ?AUTO_5572 ) ( not ( = ?AUTO_5568 ?AUTO_5571 ) ) ( not ( = ?AUTO_5568 ?AUTO_5572 ) ) ( not ( = ?AUTO_5573 ?AUTO_5571 ) ) ( not ( = ?AUTO_5573 ?AUTO_5572 ) ) ( not ( = ?AUTO_5570 ?AUTO_5571 ) ) ( not ( = ?AUTO_5570 ?AUTO_5572 ) ) ( not ( = ?AUTO_5569 ?AUTO_5571 ) ) ( not ( = ?AUTO_5569 ?AUTO_5572 ) ) ( not ( = ?AUTO_5571 ?AUTO_5572 ) ) ( ON ?AUTO_5571 ?AUTO_5569 ) ( CLEAR ?AUTO_5571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5571 ?AUTO_5569 )
      ( MAKE-ON-TABLE ?AUTO_5568 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5568 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5574 - BLOCK
    )
    :vars
    (
      ?AUTO_5578 - BLOCK
      ?AUTO_5577 - BLOCK
      ?AUTO_5576 - BLOCK
      ?AUTO_5575 - BLOCK
      ?AUTO_5579 - BLOCK
      ?AUTO_5580 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5574 ?AUTO_5578 ) ( not ( = ?AUTO_5574 ?AUTO_5578 ) ) ( not ( = ?AUTO_5574 ?AUTO_5577 ) ) ( not ( = ?AUTO_5578 ?AUTO_5577 ) ) ( ON ?AUTO_5577 ?AUTO_5574 ) ( not ( = ?AUTO_5574 ?AUTO_5576 ) ) ( not ( = ?AUTO_5578 ?AUTO_5576 ) ) ( not ( = ?AUTO_5577 ?AUTO_5576 ) ) ( ON ?AUTO_5576 ?AUTO_5577 ) ( CLEAR ?AUTO_5575 ) ( not ( = ?AUTO_5574 ?AUTO_5579 ) ) ( not ( = ?AUTO_5574 ?AUTO_5575 ) ) ( not ( = ?AUTO_5578 ?AUTO_5579 ) ) ( not ( = ?AUTO_5578 ?AUTO_5575 ) ) ( not ( = ?AUTO_5577 ?AUTO_5579 ) ) ( not ( = ?AUTO_5577 ?AUTO_5575 ) ) ( not ( = ?AUTO_5576 ?AUTO_5579 ) ) ( not ( = ?AUTO_5576 ?AUTO_5575 ) ) ( not ( = ?AUTO_5579 ?AUTO_5575 ) ) ( ON ?AUTO_5579 ?AUTO_5576 ) ( CLEAR ?AUTO_5579 ) ( HOLDING ?AUTO_5580 ) ( not ( = ?AUTO_5574 ?AUTO_5580 ) ) ( not ( = ?AUTO_5578 ?AUTO_5580 ) ) ( not ( = ?AUTO_5577 ?AUTO_5580 ) ) ( not ( = ?AUTO_5576 ?AUTO_5580 ) ) ( not ( = ?AUTO_5575 ?AUTO_5580 ) ) ( not ( = ?AUTO_5579 ?AUTO_5580 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5580 )
      ( MAKE-ON-TABLE ?AUTO_5574 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5574 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5588 - BLOCK
      ?AUTO_5589 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5588 ) ( CLEAR ?AUTO_5589 ) ( not ( = ?AUTO_5588 ?AUTO_5589 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5588 ?AUTO_5589 )
      ( MAKE-ON-VERIFY ?AUTO_5588 ?AUTO_5589 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5590 - BLOCK
      ?AUTO_5591 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5591 ) ( not ( = ?AUTO_5590 ?AUTO_5591 ) ) ( ON-TABLE ?AUTO_5590 ) ( CLEAR ?AUTO_5590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5590 )
      ( MAKE-ON ?AUTO_5590 ?AUTO_5591 )
      ( MAKE-ON-VERIFY ?AUTO_5590 ?AUTO_5591 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5592 - BLOCK
      ?AUTO_5593 - BLOCK
    )
    :vars
    (
      ?AUTO_5594 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5593 ) ( not ( = ?AUTO_5592 ?AUTO_5593 ) ) ( ON-TABLE ?AUTO_5592 ) ( CLEAR ?AUTO_5592 ) ( HOLDING ?AUTO_5594 ) ( not ( = ?AUTO_5592 ?AUTO_5594 ) ) ( not ( = ?AUTO_5593 ?AUTO_5594 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5594 )
      ( MAKE-ON ?AUTO_5592 ?AUTO_5593 )
      ( MAKE-ON-VERIFY ?AUTO_5592 ?AUTO_5593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5595 - BLOCK
      ?AUTO_5596 - BLOCK
    )
    :vars
    (
      ?AUTO_5597 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5595 ?AUTO_5596 ) ) ( ON-TABLE ?AUTO_5595 ) ( CLEAR ?AUTO_5595 ) ( not ( = ?AUTO_5595 ?AUTO_5597 ) ) ( not ( = ?AUTO_5596 ?AUTO_5597 ) ) ( ON ?AUTO_5597 ?AUTO_5596 ) ( CLEAR ?AUTO_5597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5597 ?AUTO_5596 )
      ( MAKE-ON ?AUTO_5595 ?AUTO_5596 )
      ( MAKE-ON-VERIFY ?AUTO_5595 ?AUTO_5596 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5598 - BLOCK
      ?AUTO_5599 - BLOCK
    )
    :vars
    (
      ?AUTO_5600 - BLOCK
      ?AUTO_5601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5598 ?AUTO_5599 ) ) ( ON-TABLE ?AUTO_5598 ) ( CLEAR ?AUTO_5598 ) ( not ( = ?AUTO_5598 ?AUTO_5600 ) ) ( not ( = ?AUTO_5599 ?AUTO_5600 ) ) ( ON ?AUTO_5600 ?AUTO_5599 ) ( CLEAR ?AUTO_5600 ) ( HOLDING ?AUTO_5601 ) ( not ( = ?AUTO_5598 ?AUTO_5601 ) ) ( not ( = ?AUTO_5599 ?AUTO_5601 ) ) ( not ( = ?AUTO_5600 ?AUTO_5601 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5601 )
      ( MAKE-ON ?AUTO_5598 ?AUTO_5599 )
      ( MAKE-ON-VERIFY ?AUTO_5598 ?AUTO_5599 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5602 - BLOCK
      ?AUTO_5603 - BLOCK
    )
    :vars
    (
      ?AUTO_5604 - BLOCK
      ?AUTO_5605 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5602 ?AUTO_5603 ) ) ( ON-TABLE ?AUTO_5602 ) ( CLEAR ?AUTO_5602 ) ( not ( = ?AUTO_5602 ?AUTO_5604 ) ) ( not ( = ?AUTO_5603 ?AUTO_5604 ) ) ( ON ?AUTO_5604 ?AUTO_5603 ) ( not ( = ?AUTO_5602 ?AUTO_5605 ) ) ( not ( = ?AUTO_5603 ?AUTO_5605 ) ) ( not ( = ?AUTO_5604 ?AUTO_5605 ) ) ( ON ?AUTO_5605 ?AUTO_5604 ) ( CLEAR ?AUTO_5605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5605 ?AUTO_5604 )
      ( MAKE-ON ?AUTO_5602 ?AUTO_5603 )
      ( MAKE-ON-VERIFY ?AUTO_5602 ?AUTO_5603 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5606 - BLOCK
      ?AUTO_5607 - BLOCK
    )
    :vars
    (
      ?AUTO_5608 - BLOCK
      ?AUTO_5609 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5606 ?AUTO_5607 ) ) ( not ( = ?AUTO_5606 ?AUTO_5608 ) ) ( not ( = ?AUTO_5607 ?AUTO_5608 ) ) ( ON ?AUTO_5608 ?AUTO_5607 ) ( not ( = ?AUTO_5606 ?AUTO_5609 ) ) ( not ( = ?AUTO_5607 ?AUTO_5609 ) ) ( not ( = ?AUTO_5608 ?AUTO_5609 ) ) ( ON ?AUTO_5609 ?AUTO_5608 ) ( CLEAR ?AUTO_5609 ) ( HOLDING ?AUTO_5606 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5606 )
      ( MAKE-ON ?AUTO_5606 ?AUTO_5607 )
      ( MAKE-ON-VERIFY ?AUTO_5606 ?AUTO_5607 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5610 - BLOCK
      ?AUTO_5611 - BLOCK
    )
    :vars
    (
      ?AUTO_5613 - BLOCK
      ?AUTO_5612 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5610 ?AUTO_5611 ) ) ( not ( = ?AUTO_5610 ?AUTO_5613 ) ) ( not ( = ?AUTO_5611 ?AUTO_5613 ) ) ( ON ?AUTO_5613 ?AUTO_5611 ) ( not ( = ?AUTO_5610 ?AUTO_5612 ) ) ( not ( = ?AUTO_5611 ?AUTO_5612 ) ) ( not ( = ?AUTO_5613 ?AUTO_5612 ) ) ( ON ?AUTO_5612 ?AUTO_5613 ) ( ON ?AUTO_5610 ?AUTO_5612 ) ( CLEAR ?AUTO_5610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5610 ?AUTO_5612 )
      ( MAKE-ON ?AUTO_5610 ?AUTO_5611 )
      ( MAKE-ON-VERIFY ?AUTO_5610 ?AUTO_5611 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5614 - BLOCK
      ?AUTO_5615 - BLOCK
    )
    :vars
    (
      ?AUTO_5616 - BLOCK
      ?AUTO_5617 - BLOCK
      ?AUTO_5618 - BLOCK
      ?AUTO_5619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5614 ?AUTO_5615 ) ) ( not ( = ?AUTO_5614 ?AUTO_5616 ) ) ( not ( = ?AUTO_5615 ?AUTO_5616 ) ) ( ON ?AUTO_5616 ?AUTO_5615 ) ( not ( = ?AUTO_5614 ?AUTO_5617 ) ) ( not ( = ?AUTO_5615 ?AUTO_5617 ) ) ( not ( = ?AUTO_5616 ?AUTO_5617 ) ) ( ON ?AUTO_5617 ?AUTO_5616 ) ( ON ?AUTO_5614 ?AUTO_5617 ) ( CLEAR ?AUTO_5614 ) ( HOLDING ?AUTO_5618 ) ( CLEAR ?AUTO_5619 ) ( not ( = ?AUTO_5614 ?AUTO_5618 ) ) ( not ( = ?AUTO_5614 ?AUTO_5619 ) ) ( not ( = ?AUTO_5615 ?AUTO_5618 ) ) ( not ( = ?AUTO_5615 ?AUTO_5619 ) ) ( not ( = ?AUTO_5616 ?AUTO_5618 ) ) ( not ( = ?AUTO_5616 ?AUTO_5619 ) ) ( not ( = ?AUTO_5617 ?AUTO_5618 ) ) ( not ( = ?AUTO_5617 ?AUTO_5619 ) ) ( not ( = ?AUTO_5618 ?AUTO_5619 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5618 ?AUTO_5619 )
      ( MAKE-ON ?AUTO_5614 ?AUTO_5615 )
      ( MAKE-ON-VERIFY ?AUTO_5614 ?AUTO_5615 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5624 - BLOCK
      ?AUTO_5625 - BLOCK
    )
    :vars
    (
      ?AUTO_5629 - BLOCK
      ?AUTO_5626 - BLOCK
      ?AUTO_5627 - BLOCK
      ?AUTO_5628 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5624 ?AUTO_5625 ) ) ( not ( = ?AUTO_5624 ?AUTO_5629 ) ) ( not ( = ?AUTO_5625 ?AUTO_5629 ) ) ( ON ?AUTO_5629 ?AUTO_5625 ) ( not ( = ?AUTO_5624 ?AUTO_5626 ) ) ( not ( = ?AUTO_5625 ?AUTO_5626 ) ) ( not ( = ?AUTO_5629 ?AUTO_5626 ) ) ( ON ?AUTO_5626 ?AUTO_5629 ) ( ON ?AUTO_5624 ?AUTO_5626 ) ( CLEAR ?AUTO_5627 ) ( not ( = ?AUTO_5624 ?AUTO_5628 ) ) ( not ( = ?AUTO_5624 ?AUTO_5627 ) ) ( not ( = ?AUTO_5625 ?AUTO_5628 ) ) ( not ( = ?AUTO_5625 ?AUTO_5627 ) ) ( not ( = ?AUTO_5629 ?AUTO_5628 ) ) ( not ( = ?AUTO_5629 ?AUTO_5627 ) ) ( not ( = ?AUTO_5626 ?AUTO_5628 ) ) ( not ( = ?AUTO_5626 ?AUTO_5627 ) ) ( not ( = ?AUTO_5628 ?AUTO_5627 ) ) ( ON ?AUTO_5628 ?AUTO_5624 ) ( CLEAR ?AUTO_5628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5628 ?AUTO_5624 )
      ( MAKE-ON ?AUTO_5624 ?AUTO_5625 )
      ( MAKE-ON-VERIFY ?AUTO_5624 ?AUTO_5625 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5630 - BLOCK
      ?AUTO_5631 - BLOCK
    )
    :vars
    (
      ?AUTO_5635 - BLOCK
      ?AUTO_5633 - BLOCK
      ?AUTO_5632 - BLOCK
      ?AUTO_5634 - BLOCK
      ?AUTO_5636 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5630 ?AUTO_5631 ) ) ( not ( = ?AUTO_5630 ?AUTO_5635 ) ) ( not ( = ?AUTO_5631 ?AUTO_5635 ) ) ( ON ?AUTO_5635 ?AUTO_5631 ) ( not ( = ?AUTO_5630 ?AUTO_5633 ) ) ( not ( = ?AUTO_5631 ?AUTO_5633 ) ) ( not ( = ?AUTO_5635 ?AUTO_5633 ) ) ( ON ?AUTO_5633 ?AUTO_5635 ) ( ON ?AUTO_5630 ?AUTO_5633 ) ( CLEAR ?AUTO_5632 ) ( not ( = ?AUTO_5630 ?AUTO_5634 ) ) ( not ( = ?AUTO_5630 ?AUTO_5632 ) ) ( not ( = ?AUTO_5631 ?AUTO_5634 ) ) ( not ( = ?AUTO_5631 ?AUTO_5632 ) ) ( not ( = ?AUTO_5635 ?AUTO_5634 ) ) ( not ( = ?AUTO_5635 ?AUTO_5632 ) ) ( not ( = ?AUTO_5633 ?AUTO_5634 ) ) ( not ( = ?AUTO_5633 ?AUTO_5632 ) ) ( not ( = ?AUTO_5634 ?AUTO_5632 ) ) ( ON ?AUTO_5634 ?AUTO_5630 ) ( CLEAR ?AUTO_5634 ) ( HOLDING ?AUTO_5636 ) ( not ( = ?AUTO_5630 ?AUTO_5636 ) ) ( not ( = ?AUTO_5631 ?AUTO_5636 ) ) ( not ( = ?AUTO_5635 ?AUTO_5636 ) ) ( not ( = ?AUTO_5633 ?AUTO_5636 ) ) ( not ( = ?AUTO_5632 ?AUTO_5636 ) ) ( not ( = ?AUTO_5634 ?AUTO_5636 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5636 )
      ( MAKE-ON ?AUTO_5630 ?AUTO_5631 )
      ( MAKE-ON-VERIFY ?AUTO_5630 ?AUTO_5631 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5649 - BLOCK
      ?AUTO_5650 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5649 ) ( CLEAR ?AUTO_5650 ) ( not ( = ?AUTO_5649 ?AUTO_5650 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5649 ?AUTO_5650 )
      ( MAKE-ON-VERIFY ?AUTO_5649 ?AUTO_5650 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5651 - BLOCK
      ?AUTO_5652 - BLOCK
    )
    :vars
    (
      ?AUTO_5653 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5652 ) ( not ( = ?AUTO_5651 ?AUTO_5652 ) ) ( ON ?AUTO_5651 ?AUTO_5653 ) ( CLEAR ?AUTO_5651 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5651 ?AUTO_5653 ) ) ( not ( = ?AUTO_5652 ?AUTO_5653 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5651 ?AUTO_5653 )
      ( MAKE-ON ?AUTO_5651 ?AUTO_5652 )
      ( MAKE-ON-VERIFY ?AUTO_5651 ?AUTO_5652 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5654 - BLOCK
      ?AUTO_5655 - BLOCK
    )
    :vars
    (
      ?AUTO_5656 - BLOCK
      ?AUTO_5657 - BLOCK
      ?AUTO_5658 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5655 ) ( not ( = ?AUTO_5654 ?AUTO_5655 ) ) ( ON ?AUTO_5654 ?AUTO_5656 ) ( CLEAR ?AUTO_5654 ) ( not ( = ?AUTO_5654 ?AUTO_5656 ) ) ( not ( = ?AUTO_5655 ?AUTO_5656 ) ) ( HOLDING ?AUTO_5657 ) ( CLEAR ?AUTO_5658 ) ( not ( = ?AUTO_5654 ?AUTO_5657 ) ) ( not ( = ?AUTO_5654 ?AUTO_5658 ) ) ( not ( = ?AUTO_5655 ?AUTO_5657 ) ) ( not ( = ?AUTO_5655 ?AUTO_5658 ) ) ( not ( = ?AUTO_5656 ?AUTO_5657 ) ) ( not ( = ?AUTO_5656 ?AUTO_5658 ) ) ( not ( = ?AUTO_5657 ?AUTO_5658 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5657 ?AUTO_5658 )
      ( MAKE-ON ?AUTO_5654 ?AUTO_5655 )
      ( MAKE-ON-VERIFY ?AUTO_5654 ?AUTO_5655 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5665 - BLOCK
      ?AUTO_5666 - BLOCK
    )
    :vars
    (
      ?AUTO_5667 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5665 ?AUTO_5666 ) ) ( ON ?AUTO_5665 ?AUTO_5667 ) ( CLEAR ?AUTO_5665 ) ( not ( = ?AUTO_5665 ?AUTO_5667 ) ) ( not ( = ?AUTO_5666 ?AUTO_5667 ) ) ( HOLDING ?AUTO_5666 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5666 )
      ( MAKE-ON ?AUTO_5665 ?AUTO_5666 )
      ( MAKE-ON-VERIFY ?AUTO_5665 ?AUTO_5666 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5672 - BLOCK
      ?AUTO_5673 - BLOCK
    )
    :vars
    (
      ?AUTO_5674 - BLOCK
      ?AUTO_5675 - BLOCK
      ?AUTO_5676 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5672 ?AUTO_5673 ) ) ( ON ?AUTO_5672 ?AUTO_5674 ) ( CLEAR ?AUTO_5672 ) ( not ( = ?AUTO_5672 ?AUTO_5674 ) ) ( not ( = ?AUTO_5673 ?AUTO_5674 ) ) ( CLEAR ?AUTO_5675 ) ( not ( = ?AUTO_5672 ?AUTO_5676 ) ) ( not ( = ?AUTO_5672 ?AUTO_5675 ) ) ( not ( = ?AUTO_5673 ?AUTO_5676 ) ) ( not ( = ?AUTO_5673 ?AUTO_5675 ) ) ( not ( = ?AUTO_5674 ?AUTO_5676 ) ) ( not ( = ?AUTO_5674 ?AUTO_5675 ) ) ( not ( = ?AUTO_5676 ?AUTO_5675 ) ) ( ON ?AUTO_5676 ?AUTO_5673 ) ( CLEAR ?AUTO_5676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5676 ?AUTO_5673 )
      ( MAKE-ON ?AUTO_5672 ?AUTO_5673 )
      ( MAKE-ON-VERIFY ?AUTO_5672 ?AUTO_5673 ) )
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
      ?AUTO_5682 - BLOCK
      ?AUTO_5683 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5677 ?AUTO_5678 ) ) ( ON ?AUTO_5677 ?AUTO_5679 ) ( CLEAR ?AUTO_5677 ) ( not ( = ?AUTO_5677 ?AUTO_5679 ) ) ( not ( = ?AUTO_5678 ?AUTO_5679 ) ) ( CLEAR ?AUTO_5680 ) ( not ( = ?AUTO_5677 ?AUTO_5681 ) ) ( not ( = ?AUTO_5677 ?AUTO_5680 ) ) ( not ( = ?AUTO_5678 ?AUTO_5681 ) ) ( not ( = ?AUTO_5678 ?AUTO_5680 ) ) ( not ( = ?AUTO_5679 ?AUTO_5681 ) ) ( not ( = ?AUTO_5679 ?AUTO_5680 ) ) ( not ( = ?AUTO_5681 ?AUTO_5680 ) ) ( ON ?AUTO_5681 ?AUTO_5678 ) ( CLEAR ?AUTO_5681 ) ( HOLDING ?AUTO_5682 ) ( CLEAR ?AUTO_5683 ) ( not ( = ?AUTO_5677 ?AUTO_5682 ) ) ( not ( = ?AUTO_5677 ?AUTO_5683 ) ) ( not ( = ?AUTO_5678 ?AUTO_5682 ) ) ( not ( = ?AUTO_5678 ?AUTO_5683 ) ) ( not ( = ?AUTO_5679 ?AUTO_5682 ) ) ( not ( = ?AUTO_5679 ?AUTO_5683 ) ) ( not ( = ?AUTO_5680 ?AUTO_5682 ) ) ( not ( = ?AUTO_5680 ?AUTO_5683 ) ) ( not ( = ?AUTO_5681 ?AUTO_5682 ) ) ( not ( = ?AUTO_5681 ?AUTO_5683 ) ) ( not ( = ?AUTO_5682 ?AUTO_5683 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5682 ?AUTO_5683 )
      ( MAKE-ON ?AUTO_5677 ?AUTO_5678 )
      ( MAKE-ON-VERIFY ?AUTO_5677 ?AUTO_5678 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5686 - BLOCK
      ?AUTO_5687 - BLOCK
    )
    :vars
    (
      ?AUTO_5689 - BLOCK
      ?AUTO_5690 - BLOCK
      ?AUTO_5688 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5686 ?AUTO_5687 ) ) ( not ( = ?AUTO_5686 ?AUTO_5689 ) ) ( not ( = ?AUTO_5687 ?AUTO_5689 ) ) ( CLEAR ?AUTO_5690 ) ( not ( = ?AUTO_5686 ?AUTO_5688 ) ) ( not ( = ?AUTO_5686 ?AUTO_5690 ) ) ( not ( = ?AUTO_5687 ?AUTO_5688 ) ) ( not ( = ?AUTO_5687 ?AUTO_5690 ) ) ( not ( = ?AUTO_5689 ?AUTO_5688 ) ) ( not ( = ?AUTO_5689 ?AUTO_5690 ) ) ( not ( = ?AUTO_5688 ?AUTO_5690 ) ) ( ON ?AUTO_5688 ?AUTO_5687 ) ( CLEAR ?AUTO_5688 ) ( HOLDING ?AUTO_5686 ) ( CLEAR ?AUTO_5689 ) )
    :subtasks
    ( ( !STACK ?AUTO_5686 ?AUTO_5689 )
      ( MAKE-ON ?AUTO_5686 ?AUTO_5687 )
      ( MAKE-ON-VERIFY ?AUTO_5686 ?AUTO_5687 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5691 - BLOCK
      ?AUTO_5692 - BLOCK
    )
    :vars
    (
      ?AUTO_5694 - BLOCK
      ?AUTO_5695 - BLOCK
      ?AUTO_5693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5691 ?AUTO_5692 ) ) ( not ( = ?AUTO_5691 ?AUTO_5694 ) ) ( not ( = ?AUTO_5692 ?AUTO_5694 ) ) ( CLEAR ?AUTO_5695 ) ( not ( = ?AUTO_5691 ?AUTO_5693 ) ) ( not ( = ?AUTO_5691 ?AUTO_5695 ) ) ( not ( = ?AUTO_5692 ?AUTO_5693 ) ) ( not ( = ?AUTO_5692 ?AUTO_5695 ) ) ( not ( = ?AUTO_5694 ?AUTO_5693 ) ) ( not ( = ?AUTO_5694 ?AUTO_5695 ) ) ( not ( = ?AUTO_5693 ?AUTO_5695 ) ) ( ON ?AUTO_5693 ?AUTO_5692 ) ( CLEAR ?AUTO_5694 ) ( ON ?AUTO_5691 ?AUTO_5693 ) ( CLEAR ?AUTO_5691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5691 ?AUTO_5693 )
      ( MAKE-ON ?AUTO_5691 ?AUTO_5692 )
      ( MAKE-ON-VERIFY ?AUTO_5691 ?AUTO_5692 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5696 - BLOCK
      ?AUTO_5697 - BLOCK
    )
    :vars
    (
      ?AUTO_5699 - BLOCK
      ?AUTO_5700 - BLOCK
      ?AUTO_5698 - BLOCK
      ?AUTO_5701 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5696 ?AUTO_5697 ) ) ( not ( = ?AUTO_5696 ?AUTO_5699 ) ) ( not ( = ?AUTO_5697 ?AUTO_5699 ) ) ( CLEAR ?AUTO_5700 ) ( not ( = ?AUTO_5696 ?AUTO_5698 ) ) ( not ( = ?AUTO_5696 ?AUTO_5700 ) ) ( not ( = ?AUTO_5697 ?AUTO_5698 ) ) ( not ( = ?AUTO_5697 ?AUTO_5700 ) ) ( not ( = ?AUTO_5699 ?AUTO_5698 ) ) ( not ( = ?AUTO_5699 ?AUTO_5700 ) ) ( not ( = ?AUTO_5698 ?AUTO_5700 ) ) ( ON ?AUTO_5698 ?AUTO_5697 ) ( CLEAR ?AUTO_5699 ) ( ON ?AUTO_5696 ?AUTO_5698 ) ( CLEAR ?AUTO_5696 ) ( HOLDING ?AUTO_5701 ) ( not ( = ?AUTO_5696 ?AUTO_5701 ) ) ( not ( = ?AUTO_5697 ?AUTO_5701 ) ) ( not ( = ?AUTO_5699 ?AUTO_5701 ) ) ( not ( = ?AUTO_5700 ?AUTO_5701 ) ) ( not ( = ?AUTO_5698 ?AUTO_5701 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5701 )
      ( MAKE-ON ?AUTO_5696 ?AUTO_5697 )
      ( MAKE-ON-VERIFY ?AUTO_5696 ?AUTO_5697 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5708 - BLOCK
      ?AUTO_5709 - BLOCK
    )
    :vars
    (
      ?AUTO_5710 - BLOCK
      ?AUTO_5711 - BLOCK
      ?AUTO_5712 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5708 ?AUTO_5709 ) ) ( not ( = ?AUTO_5708 ?AUTO_5710 ) ) ( not ( = ?AUTO_5709 ?AUTO_5710 ) ) ( CLEAR ?AUTO_5711 ) ( not ( = ?AUTO_5708 ?AUTO_5712 ) ) ( not ( = ?AUTO_5708 ?AUTO_5711 ) ) ( not ( = ?AUTO_5709 ?AUTO_5712 ) ) ( not ( = ?AUTO_5709 ?AUTO_5711 ) ) ( not ( = ?AUTO_5710 ?AUTO_5712 ) ) ( not ( = ?AUTO_5710 ?AUTO_5711 ) ) ( not ( = ?AUTO_5712 ?AUTO_5711 ) ) ( ON ?AUTO_5712 ?AUTO_5709 ) ( ON ?AUTO_5708 ?AUTO_5712 ) ( CLEAR ?AUTO_5708 ) ( HOLDING ?AUTO_5710 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5710 )
      ( MAKE-ON ?AUTO_5708 ?AUTO_5709 )
      ( MAKE-ON-VERIFY ?AUTO_5708 ?AUTO_5709 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5717 - BLOCK
      ?AUTO_5718 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5717 ) ( CLEAR ?AUTO_5718 ) ( not ( = ?AUTO_5717 ?AUTO_5718 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5717 ?AUTO_5718 )
      ( MAKE-ON-VERIFY ?AUTO_5717 ?AUTO_5718 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5719 - BLOCK
      ?AUTO_5720 - BLOCK
    )
    :vars
    (
      ?AUTO_5721 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5720 ) ( not ( = ?AUTO_5719 ?AUTO_5720 ) ) ( ON ?AUTO_5719 ?AUTO_5721 ) ( CLEAR ?AUTO_5719 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5719 ?AUTO_5721 ) ) ( not ( = ?AUTO_5720 ?AUTO_5721 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5719 ?AUTO_5721 )
      ( MAKE-ON ?AUTO_5719 ?AUTO_5720 )
      ( MAKE-ON-VERIFY ?AUTO_5719 ?AUTO_5720 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5722 - BLOCK
      ?AUTO_5723 - BLOCK
    )
    :vars
    (
      ?AUTO_5724 - BLOCK
      ?AUTO_5725 - BLOCK
      ?AUTO_5726 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5723 ) ( not ( = ?AUTO_5722 ?AUTO_5723 ) ) ( ON ?AUTO_5722 ?AUTO_5724 ) ( CLEAR ?AUTO_5722 ) ( not ( = ?AUTO_5722 ?AUTO_5724 ) ) ( not ( = ?AUTO_5723 ?AUTO_5724 ) ) ( HOLDING ?AUTO_5725 ) ( CLEAR ?AUTO_5726 ) ( not ( = ?AUTO_5722 ?AUTO_5725 ) ) ( not ( = ?AUTO_5722 ?AUTO_5726 ) ) ( not ( = ?AUTO_5723 ?AUTO_5725 ) ) ( not ( = ?AUTO_5723 ?AUTO_5726 ) ) ( not ( = ?AUTO_5724 ?AUTO_5725 ) ) ( not ( = ?AUTO_5724 ?AUTO_5726 ) ) ( not ( = ?AUTO_5725 ?AUTO_5726 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5725 ?AUTO_5726 )
      ( MAKE-ON ?AUTO_5722 ?AUTO_5723 )
      ( MAKE-ON-VERIFY ?AUTO_5722 ?AUTO_5723 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5727 - BLOCK
      ?AUTO_5728 - BLOCK
    )
    :vars
    (
      ?AUTO_5729 - BLOCK
      ?AUTO_5730 - BLOCK
      ?AUTO_5731 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5728 ) ( not ( = ?AUTO_5727 ?AUTO_5728 ) ) ( ON ?AUTO_5727 ?AUTO_5729 ) ( not ( = ?AUTO_5727 ?AUTO_5729 ) ) ( not ( = ?AUTO_5728 ?AUTO_5729 ) ) ( CLEAR ?AUTO_5730 ) ( not ( = ?AUTO_5727 ?AUTO_5731 ) ) ( not ( = ?AUTO_5727 ?AUTO_5730 ) ) ( not ( = ?AUTO_5728 ?AUTO_5731 ) ) ( not ( = ?AUTO_5728 ?AUTO_5730 ) ) ( not ( = ?AUTO_5729 ?AUTO_5731 ) ) ( not ( = ?AUTO_5729 ?AUTO_5730 ) ) ( not ( = ?AUTO_5731 ?AUTO_5730 ) ) ( ON ?AUTO_5731 ?AUTO_5727 ) ( CLEAR ?AUTO_5731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5731 ?AUTO_5727 )
      ( MAKE-ON ?AUTO_5727 ?AUTO_5728 )
      ( MAKE-ON-VERIFY ?AUTO_5727 ?AUTO_5728 ) )
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
      ?AUTO_5736 - BLOCK
      ?AUTO_5735 - BLOCK
      ?AUTO_5737 - BLOCK
      ?AUTO_5738 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5733 ) ( not ( = ?AUTO_5732 ?AUTO_5733 ) ) ( ON ?AUTO_5732 ?AUTO_5734 ) ( not ( = ?AUTO_5732 ?AUTO_5734 ) ) ( not ( = ?AUTO_5733 ?AUTO_5734 ) ) ( CLEAR ?AUTO_5736 ) ( not ( = ?AUTO_5732 ?AUTO_5735 ) ) ( not ( = ?AUTO_5732 ?AUTO_5736 ) ) ( not ( = ?AUTO_5733 ?AUTO_5735 ) ) ( not ( = ?AUTO_5733 ?AUTO_5736 ) ) ( not ( = ?AUTO_5734 ?AUTO_5735 ) ) ( not ( = ?AUTO_5734 ?AUTO_5736 ) ) ( not ( = ?AUTO_5735 ?AUTO_5736 ) ) ( ON ?AUTO_5735 ?AUTO_5732 ) ( CLEAR ?AUTO_5735 ) ( HOLDING ?AUTO_5737 ) ( CLEAR ?AUTO_5738 ) ( not ( = ?AUTO_5732 ?AUTO_5737 ) ) ( not ( = ?AUTO_5732 ?AUTO_5738 ) ) ( not ( = ?AUTO_5733 ?AUTO_5737 ) ) ( not ( = ?AUTO_5733 ?AUTO_5738 ) ) ( not ( = ?AUTO_5734 ?AUTO_5737 ) ) ( not ( = ?AUTO_5734 ?AUTO_5738 ) ) ( not ( = ?AUTO_5736 ?AUTO_5737 ) ) ( not ( = ?AUTO_5736 ?AUTO_5738 ) ) ( not ( = ?AUTO_5735 ?AUTO_5737 ) ) ( not ( = ?AUTO_5735 ?AUTO_5738 ) ) ( not ( = ?AUTO_5737 ?AUTO_5738 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5737 ?AUTO_5738 )
      ( MAKE-ON ?AUTO_5732 ?AUTO_5733 )
      ( MAKE-ON-VERIFY ?AUTO_5732 ?AUTO_5733 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5741 - BLOCK
      ?AUTO_5742 - BLOCK
    )
    :vars
    (
      ?AUTO_5745 - BLOCK
      ?AUTO_5744 - BLOCK
      ?AUTO_5743 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5741 ?AUTO_5742 ) ) ( ON ?AUTO_5741 ?AUTO_5745 ) ( not ( = ?AUTO_5741 ?AUTO_5745 ) ) ( not ( = ?AUTO_5742 ?AUTO_5745 ) ) ( CLEAR ?AUTO_5744 ) ( not ( = ?AUTO_5741 ?AUTO_5743 ) ) ( not ( = ?AUTO_5741 ?AUTO_5744 ) ) ( not ( = ?AUTO_5742 ?AUTO_5743 ) ) ( not ( = ?AUTO_5742 ?AUTO_5744 ) ) ( not ( = ?AUTO_5745 ?AUTO_5743 ) ) ( not ( = ?AUTO_5745 ?AUTO_5744 ) ) ( not ( = ?AUTO_5743 ?AUTO_5744 ) ) ( ON ?AUTO_5743 ?AUTO_5741 ) ( CLEAR ?AUTO_5743 ) ( HOLDING ?AUTO_5742 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5742 )
      ( MAKE-ON ?AUTO_5741 ?AUTO_5742 )
      ( MAKE-ON-VERIFY ?AUTO_5741 ?AUTO_5742 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5750 - BLOCK
      ?AUTO_5751 - BLOCK
    )
    :vars
    (
      ?AUTO_5756 - BLOCK
      ?AUTO_5752 - BLOCK
      ?AUTO_5755 - BLOCK
      ?AUTO_5753 - BLOCK
      ?AUTO_5754 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5750 ?AUTO_5751 ) ) ( ON ?AUTO_5750 ?AUTO_5756 ) ( not ( = ?AUTO_5750 ?AUTO_5756 ) ) ( not ( = ?AUTO_5751 ?AUTO_5756 ) ) ( CLEAR ?AUTO_5752 ) ( not ( = ?AUTO_5750 ?AUTO_5755 ) ) ( not ( = ?AUTO_5750 ?AUTO_5752 ) ) ( not ( = ?AUTO_5751 ?AUTO_5755 ) ) ( not ( = ?AUTO_5751 ?AUTO_5752 ) ) ( not ( = ?AUTO_5756 ?AUTO_5755 ) ) ( not ( = ?AUTO_5756 ?AUTO_5752 ) ) ( not ( = ?AUTO_5755 ?AUTO_5752 ) ) ( ON ?AUTO_5755 ?AUTO_5750 ) ( CLEAR ?AUTO_5755 ) ( CLEAR ?AUTO_5753 ) ( not ( = ?AUTO_5750 ?AUTO_5754 ) ) ( not ( = ?AUTO_5750 ?AUTO_5753 ) ) ( not ( = ?AUTO_5751 ?AUTO_5754 ) ) ( not ( = ?AUTO_5751 ?AUTO_5753 ) ) ( not ( = ?AUTO_5756 ?AUTO_5754 ) ) ( not ( = ?AUTO_5756 ?AUTO_5753 ) ) ( not ( = ?AUTO_5752 ?AUTO_5754 ) ) ( not ( = ?AUTO_5752 ?AUTO_5753 ) ) ( not ( = ?AUTO_5755 ?AUTO_5754 ) ) ( not ( = ?AUTO_5755 ?AUTO_5753 ) ) ( not ( = ?AUTO_5754 ?AUTO_5753 ) ) ( ON ?AUTO_5754 ?AUTO_5751 ) ( CLEAR ?AUTO_5754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5754 ?AUTO_5751 )
      ( MAKE-ON ?AUTO_5750 ?AUTO_5751 )
      ( MAKE-ON-VERIFY ?AUTO_5750 ?AUTO_5751 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5757 - BLOCK
      ?AUTO_5758 - BLOCK
    )
    :vars
    (
      ?AUTO_5760 - BLOCK
      ?AUTO_5761 - BLOCK
      ?AUTO_5759 - BLOCK
      ?AUTO_5762 - BLOCK
      ?AUTO_5763 - BLOCK
      ?AUTO_5764 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5757 ?AUTO_5758 ) ) ( ON ?AUTO_5757 ?AUTO_5760 ) ( not ( = ?AUTO_5757 ?AUTO_5760 ) ) ( not ( = ?AUTO_5758 ?AUTO_5760 ) ) ( CLEAR ?AUTO_5761 ) ( not ( = ?AUTO_5757 ?AUTO_5759 ) ) ( not ( = ?AUTO_5757 ?AUTO_5761 ) ) ( not ( = ?AUTO_5758 ?AUTO_5759 ) ) ( not ( = ?AUTO_5758 ?AUTO_5761 ) ) ( not ( = ?AUTO_5760 ?AUTO_5759 ) ) ( not ( = ?AUTO_5760 ?AUTO_5761 ) ) ( not ( = ?AUTO_5759 ?AUTO_5761 ) ) ( ON ?AUTO_5759 ?AUTO_5757 ) ( CLEAR ?AUTO_5759 ) ( CLEAR ?AUTO_5762 ) ( not ( = ?AUTO_5757 ?AUTO_5763 ) ) ( not ( = ?AUTO_5757 ?AUTO_5762 ) ) ( not ( = ?AUTO_5758 ?AUTO_5763 ) ) ( not ( = ?AUTO_5758 ?AUTO_5762 ) ) ( not ( = ?AUTO_5760 ?AUTO_5763 ) ) ( not ( = ?AUTO_5760 ?AUTO_5762 ) ) ( not ( = ?AUTO_5761 ?AUTO_5763 ) ) ( not ( = ?AUTO_5761 ?AUTO_5762 ) ) ( not ( = ?AUTO_5759 ?AUTO_5763 ) ) ( not ( = ?AUTO_5759 ?AUTO_5762 ) ) ( not ( = ?AUTO_5763 ?AUTO_5762 ) ) ( ON ?AUTO_5763 ?AUTO_5758 ) ( CLEAR ?AUTO_5763 ) ( HOLDING ?AUTO_5764 ) ( not ( = ?AUTO_5757 ?AUTO_5764 ) ) ( not ( = ?AUTO_5758 ?AUTO_5764 ) ) ( not ( = ?AUTO_5760 ?AUTO_5764 ) ) ( not ( = ?AUTO_5761 ?AUTO_5764 ) ) ( not ( = ?AUTO_5759 ?AUTO_5764 ) ) ( not ( = ?AUTO_5762 ?AUTO_5764 ) ) ( not ( = ?AUTO_5763 ?AUTO_5764 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5764 )
      ( MAKE-ON ?AUTO_5757 ?AUTO_5758 )
      ( MAKE-ON-VERIFY ?AUTO_5757 ?AUTO_5758 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5765 - BLOCK
      ?AUTO_5766 - BLOCK
    )
    :vars
    (
      ?AUTO_5768 - BLOCK
      ?AUTO_5770 - BLOCK
      ?AUTO_5767 - BLOCK
      ?AUTO_5771 - BLOCK
      ?AUTO_5769 - BLOCK
      ?AUTO_5772 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5765 ?AUTO_5766 ) ) ( ON ?AUTO_5765 ?AUTO_5768 ) ( not ( = ?AUTO_5765 ?AUTO_5768 ) ) ( not ( = ?AUTO_5766 ?AUTO_5768 ) ) ( CLEAR ?AUTO_5770 ) ( not ( = ?AUTO_5765 ?AUTO_5767 ) ) ( not ( = ?AUTO_5765 ?AUTO_5770 ) ) ( not ( = ?AUTO_5766 ?AUTO_5767 ) ) ( not ( = ?AUTO_5766 ?AUTO_5770 ) ) ( not ( = ?AUTO_5768 ?AUTO_5767 ) ) ( not ( = ?AUTO_5768 ?AUTO_5770 ) ) ( not ( = ?AUTO_5767 ?AUTO_5770 ) ) ( ON ?AUTO_5767 ?AUTO_5765 ) ( CLEAR ?AUTO_5767 ) ( CLEAR ?AUTO_5771 ) ( not ( = ?AUTO_5765 ?AUTO_5769 ) ) ( not ( = ?AUTO_5765 ?AUTO_5771 ) ) ( not ( = ?AUTO_5766 ?AUTO_5769 ) ) ( not ( = ?AUTO_5766 ?AUTO_5771 ) ) ( not ( = ?AUTO_5768 ?AUTO_5769 ) ) ( not ( = ?AUTO_5768 ?AUTO_5771 ) ) ( not ( = ?AUTO_5770 ?AUTO_5769 ) ) ( not ( = ?AUTO_5770 ?AUTO_5771 ) ) ( not ( = ?AUTO_5767 ?AUTO_5769 ) ) ( not ( = ?AUTO_5767 ?AUTO_5771 ) ) ( not ( = ?AUTO_5769 ?AUTO_5771 ) ) ( ON ?AUTO_5769 ?AUTO_5766 ) ( not ( = ?AUTO_5765 ?AUTO_5772 ) ) ( not ( = ?AUTO_5766 ?AUTO_5772 ) ) ( not ( = ?AUTO_5768 ?AUTO_5772 ) ) ( not ( = ?AUTO_5770 ?AUTO_5772 ) ) ( not ( = ?AUTO_5767 ?AUTO_5772 ) ) ( not ( = ?AUTO_5771 ?AUTO_5772 ) ) ( not ( = ?AUTO_5769 ?AUTO_5772 ) ) ( ON ?AUTO_5772 ?AUTO_5769 ) ( CLEAR ?AUTO_5772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5772 ?AUTO_5769 )
      ( MAKE-ON ?AUTO_5765 ?AUTO_5766 )
      ( MAKE-ON-VERIFY ?AUTO_5765 ?AUTO_5766 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5773 - BLOCK
      ?AUTO_5774 - BLOCK
    )
    :vars
    (
      ?AUTO_5776 - BLOCK
      ?AUTO_5775 - BLOCK
      ?AUTO_5780 - BLOCK
      ?AUTO_5779 - BLOCK
      ?AUTO_5778 - BLOCK
      ?AUTO_5777 - BLOCK
      ?AUTO_5781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5773 ?AUTO_5774 ) ) ( ON ?AUTO_5773 ?AUTO_5776 ) ( not ( = ?AUTO_5773 ?AUTO_5776 ) ) ( not ( = ?AUTO_5774 ?AUTO_5776 ) ) ( not ( = ?AUTO_5773 ?AUTO_5775 ) ) ( not ( = ?AUTO_5773 ?AUTO_5780 ) ) ( not ( = ?AUTO_5774 ?AUTO_5775 ) ) ( not ( = ?AUTO_5774 ?AUTO_5780 ) ) ( not ( = ?AUTO_5776 ?AUTO_5775 ) ) ( not ( = ?AUTO_5776 ?AUTO_5780 ) ) ( not ( = ?AUTO_5775 ?AUTO_5780 ) ) ( ON ?AUTO_5775 ?AUTO_5773 ) ( CLEAR ?AUTO_5775 ) ( CLEAR ?AUTO_5779 ) ( not ( = ?AUTO_5773 ?AUTO_5778 ) ) ( not ( = ?AUTO_5773 ?AUTO_5779 ) ) ( not ( = ?AUTO_5774 ?AUTO_5778 ) ) ( not ( = ?AUTO_5774 ?AUTO_5779 ) ) ( not ( = ?AUTO_5776 ?AUTO_5778 ) ) ( not ( = ?AUTO_5776 ?AUTO_5779 ) ) ( not ( = ?AUTO_5780 ?AUTO_5778 ) ) ( not ( = ?AUTO_5780 ?AUTO_5779 ) ) ( not ( = ?AUTO_5775 ?AUTO_5778 ) ) ( not ( = ?AUTO_5775 ?AUTO_5779 ) ) ( not ( = ?AUTO_5778 ?AUTO_5779 ) ) ( ON ?AUTO_5778 ?AUTO_5774 ) ( not ( = ?AUTO_5773 ?AUTO_5777 ) ) ( not ( = ?AUTO_5774 ?AUTO_5777 ) ) ( not ( = ?AUTO_5776 ?AUTO_5777 ) ) ( not ( = ?AUTO_5780 ?AUTO_5777 ) ) ( not ( = ?AUTO_5775 ?AUTO_5777 ) ) ( not ( = ?AUTO_5779 ?AUTO_5777 ) ) ( not ( = ?AUTO_5778 ?AUTO_5777 ) ) ( ON ?AUTO_5777 ?AUTO_5778 ) ( CLEAR ?AUTO_5777 ) ( HOLDING ?AUTO_5780 ) ( CLEAR ?AUTO_5781 ) ( not ( = ?AUTO_5773 ?AUTO_5781 ) ) ( not ( = ?AUTO_5774 ?AUTO_5781 ) ) ( not ( = ?AUTO_5776 ?AUTO_5781 ) ) ( not ( = ?AUTO_5775 ?AUTO_5781 ) ) ( not ( = ?AUTO_5780 ?AUTO_5781 ) ) ( not ( = ?AUTO_5779 ?AUTO_5781 ) ) ( not ( = ?AUTO_5778 ?AUTO_5781 ) ) ( not ( = ?AUTO_5777 ?AUTO_5781 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5780 ?AUTO_5781 )
      ( MAKE-ON ?AUTO_5773 ?AUTO_5774 )
      ( MAKE-ON-VERIFY ?AUTO_5773 ?AUTO_5774 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5784 - BLOCK
      ?AUTO_5785 - BLOCK
    )
    :vars
    (
      ?AUTO_5788 - BLOCK
      ?AUTO_5791 - BLOCK
      ?AUTO_5789 - BLOCK
      ?AUTO_5786 - BLOCK
      ?AUTO_5787 - BLOCK
      ?AUTO_5790 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5784 ?AUTO_5785 ) ) ( ON ?AUTO_5784 ?AUTO_5788 ) ( not ( = ?AUTO_5784 ?AUTO_5788 ) ) ( not ( = ?AUTO_5785 ?AUTO_5788 ) ) ( CLEAR ?AUTO_5791 ) ( not ( = ?AUTO_5784 ?AUTO_5789 ) ) ( not ( = ?AUTO_5784 ?AUTO_5791 ) ) ( not ( = ?AUTO_5785 ?AUTO_5789 ) ) ( not ( = ?AUTO_5785 ?AUTO_5791 ) ) ( not ( = ?AUTO_5788 ?AUTO_5789 ) ) ( not ( = ?AUTO_5788 ?AUTO_5791 ) ) ( not ( = ?AUTO_5789 ?AUTO_5791 ) ) ( CLEAR ?AUTO_5786 ) ( not ( = ?AUTO_5784 ?AUTO_5787 ) ) ( not ( = ?AUTO_5784 ?AUTO_5786 ) ) ( not ( = ?AUTO_5785 ?AUTO_5787 ) ) ( not ( = ?AUTO_5785 ?AUTO_5786 ) ) ( not ( = ?AUTO_5788 ?AUTO_5787 ) ) ( not ( = ?AUTO_5788 ?AUTO_5786 ) ) ( not ( = ?AUTO_5791 ?AUTO_5787 ) ) ( not ( = ?AUTO_5791 ?AUTO_5786 ) ) ( not ( = ?AUTO_5789 ?AUTO_5787 ) ) ( not ( = ?AUTO_5789 ?AUTO_5786 ) ) ( not ( = ?AUTO_5787 ?AUTO_5786 ) ) ( ON ?AUTO_5787 ?AUTO_5785 ) ( not ( = ?AUTO_5784 ?AUTO_5790 ) ) ( not ( = ?AUTO_5785 ?AUTO_5790 ) ) ( not ( = ?AUTO_5788 ?AUTO_5790 ) ) ( not ( = ?AUTO_5791 ?AUTO_5790 ) ) ( not ( = ?AUTO_5789 ?AUTO_5790 ) ) ( not ( = ?AUTO_5786 ?AUTO_5790 ) ) ( not ( = ?AUTO_5787 ?AUTO_5790 ) ) ( ON ?AUTO_5790 ?AUTO_5787 ) ( CLEAR ?AUTO_5790 ) ( HOLDING ?AUTO_5789 ) ( CLEAR ?AUTO_5784 ) )
    :subtasks
    ( ( !STACK ?AUTO_5789 ?AUTO_5784 )
      ( MAKE-ON ?AUTO_5784 ?AUTO_5785 )
      ( MAKE-ON-VERIFY ?AUTO_5784 ?AUTO_5785 ) )
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
      ?AUTO_5799 - BLOCK
      ?AUTO_5797 - BLOCK
      ?AUTO_5796 - BLOCK
      ?AUTO_5795 - BLOCK
      ?AUTO_5798 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5792 ?AUTO_5793 ) ) ( ON ?AUTO_5792 ?AUTO_5794 ) ( not ( = ?AUTO_5792 ?AUTO_5794 ) ) ( not ( = ?AUTO_5793 ?AUTO_5794 ) ) ( CLEAR ?AUTO_5799 ) ( not ( = ?AUTO_5792 ?AUTO_5797 ) ) ( not ( = ?AUTO_5792 ?AUTO_5799 ) ) ( not ( = ?AUTO_5793 ?AUTO_5797 ) ) ( not ( = ?AUTO_5793 ?AUTO_5799 ) ) ( not ( = ?AUTO_5794 ?AUTO_5797 ) ) ( not ( = ?AUTO_5794 ?AUTO_5799 ) ) ( not ( = ?AUTO_5797 ?AUTO_5799 ) ) ( CLEAR ?AUTO_5796 ) ( not ( = ?AUTO_5792 ?AUTO_5795 ) ) ( not ( = ?AUTO_5792 ?AUTO_5796 ) ) ( not ( = ?AUTO_5793 ?AUTO_5795 ) ) ( not ( = ?AUTO_5793 ?AUTO_5796 ) ) ( not ( = ?AUTO_5794 ?AUTO_5795 ) ) ( not ( = ?AUTO_5794 ?AUTO_5796 ) ) ( not ( = ?AUTO_5799 ?AUTO_5795 ) ) ( not ( = ?AUTO_5799 ?AUTO_5796 ) ) ( not ( = ?AUTO_5797 ?AUTO_5795 ) ) ( not ( = ?AUTO_5797 ?AUTO_5796 ) ) ( not ( = ?AUTO_5795 ?AUTO_5796 ) ) ( ON ?AUTO_5795 ?AUTO_5793 ) ( not ( = ?AUTO_5792 ?AUTO_5798 ) ) ( not ( = ?AUTO_5793 ?AUTO_5798 ) ) ( not ( = ?AUTO_5794 ?AUTO_5798 ) ) ( not ( = ?AUTO_5799 ?AUTO_5798 ) ) ( not ( = ?AUTO_5797 ?AUTO_5798 ) ) ( not ( = ?AUTO_5796 ?AUTO_5798 ) ) ( not ( = ?AUTO_5795 ?AUTO_5798 ) ) ( ON ?AUTO_5798 ?AUTO_5795 ) ( CLEAR ?AUTO_5792 ) ( ON ?AUTO_5797 ?AUTO_5798 ) ( CLEAR ?AUTO_5797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5797 ?AUTO_5798 )
      ( MAKE-ON ?AUTO_5792 ?AUTO_5793 )
      ( MAKE-ON-VERIFY ?AUTO_5792 ?AUTO_5793 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5800 - BLOCK
      ?AUTO_5801 - BLOCK
    )
    :vars
    (
      ?AUTO_5806 - BLOCK
      ?AUTO_5804 - BLOCK
      ?AUTO_5803 - BLOCK
      ?AUTO_5807 - BLOCK
      ?AUTO_5805 - BLOCK
      ?AUTO_5802 - BLOCK
      ?AUTO_5808 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5800 ?AUTO_5801 ) ) ( ON ?AUTO_5800 ?AUTO_5806 ) ( not ( = ?AUTO_5800 ?AUTO_5806 ) ) ( not ( = ?AUTO_5801 ?AUTO_5806 ) ) ( CLEAR ?AUTO_5804 ) ( not ( = ?AUTO_5800 ?AUTO_5803 ) ) ( not ( = ?AUTO_5800 ?AUTO_5804 ) ) ( not ( = ?AUTO_5801 ?AUTO_5803 ) ) ( not ( = ?AUTO_5801 ?AUTO_5804 ) ) ( not ( = ?AUTO_5806 ?AUTO_5803 ) ) ( not ( = ?AUTO_5806 ?AUTO_5804 ) ) ( not ( = ?AUTO_5803 ?AUTO_5804 ) ) ( CLEAR ?AUTO_5807 ) ( not ( = ?AUTO_5800 ?AUTO_5805 ) ) ( not ( = ?AUTO_5800 ?AUTO_5807 ) ) ( not ( = ?AUTO_5801 ?AUTO_5805 ) ) ( not ( = ?AUTO_5801 ?AUTO_5807 ) ) ( not ( = ?AUTO_5806 ?AUTO_5805 ) ) ( not ( = ?AUTO_5806 ?AUTO_5807 ) ) ( not ( = ?AUTO_5804 ?AUTO_5805 ) ) ( not ( = ?AUTO_5804 ?AUTO_5807 ) ) ( not ( = ?AUTO_5803 ?AUTO_5805 ) ) ( not ( = ?AUTO_5803 ?AUTO_5807 ) ) ( not ( = ?AUTO_5805 ?AUTO_5807 ) ) ( ON ?AUTO_5805 ?AUTO_5801 ) ( not ( = ?AUTO_5800 ?AUTO_5802 ) ) ( not ( = ?AUTO_5801 ?AUTO_5802 ) ) ( not ( = ?AUTO_5806 ?AUTO_5802 ) ) ( not ( = ?AUTO_5804 ?AUTO_5802 ) ) ( not ( = ?AUTO_5803 ?AUTO_5802 ) ) ( not ( = ?AUTO_5807 ?AUTO_5802 ) ) ( not ( = ?AUTO_5805 ?AUTO_5802 ) ) ( ON ?AUTO_5802 ?AUTO_5805 ) ( CLEAR ?AUTO_5800 ) ( ON ?AUTO_5803 ?AUTO_5802 ) ( CLEAR ?AUTO_5803 ) ( HOLDING ?AUTO_5808 ) ( not ( = ?AUTO_5800 ?AUTO_5808 ) ) ( not ( = ?AUTO_5801 ?AUTO_5808 ) ) ( not ( = ?AUTO_5806 ?AUTO_5808 ) ) ( not ( = ?AUTO_5804 ?AUTO_5808 ) ) ( not ( = ?AUTO_5803 ?AUTO_5808 ) ) ( not ( = ?AUTO_5807 ?AUTO_5808 ) ) ( not ( = ?AUTO_5805 ?AUTO_5808 ) ) ( not ( = ?AUTO_5802 ?AUTO_5808 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5808 )
      ( MAKE-ON ?AUTO_5800 ?AUTO_5801 )
      ( MAKE-ON-VERIFY ?AUTO_5800 ?AUTO_5801 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5809 - BLOCK
      ?AUTO_5810 - BLOCK
    )
    :vars
    (
      ?AUTO_5811 - BLOCK
      ?AUTO_5813 - BLOCK
      ?AUTO_5816 - BLOCK
      ?AUTO_5815 - BLOCK
      ?AUTO_5814 - BLOCK
      ?AUTO_5812 - BLOCK
      ?AUTO_5817 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5809 ?AUTO_5810 ) ) ( ON ?AUTO_5809 ?AUTO_5811 ) ( not ( = ?AUTO_5809 ?AUTO_5811 ) ) ( not ( = ?AUTO_5810 ?AUTO_5811 ) ) ( CLEAR ?AUTO_5813 ) ( not ( = ?AUTO_5809 ?AUTO_5816 ) ) ( not ( = ?AUTO_5809 ?AUTO_5813 ) ) ( not ( = ?AUTO_5810 ?AUTO_5816 ) ) ( not ( = ?AUTO_5810 ?AUTO_5813 ) ) ( not ( = ?AUTO_5811 ?AUTO_5816 ) ) ( not ( = ?AUTO_5811 ?AUTO_5813 ) ) ( not ( = ?AUTO_5816 ?AUTO_5813 ) ) ( CLEAR ?AUTO_5815 ) ( not ( = ?AUTO_5809 ?AUTO_5814 ) ) ( not ( = ?AUTO_5809 ?AUTO_5815 ) ) ( not ( = ?AUTO_5810 ?AUTO_5814 ) ) ( not ( = ?AUTO_5810 ?AUTO_5815 ) ) ( not ( = ?AUTO_5811 ?AUTO_5814 ) ) ( not ( = ?AUTO_5811 ?AUTO_5815 ) ) ( not ( = ?AUTO_5813 ?AUTO_5814 ) ) ( not ( = ?AUTO_5813 ?AUTO_5815 ) ) ( not ( = ?AUTO_5816 ?AUTO_5814 ) ) ( not ( = ?AUTO_5816 ?AUTO_5815 ) ) ( not ( = ?AUTO_5814 ?AUTO_5815 ) ) ( ON ?AUTO_5814 ?AUTO_5810 ) ( not ( = ?AUTO_5809 ?AUTO_5812 ) ) ( not ( = ?AUTO_5810 ?AUTO_5812 ) ) ( not ( = ?AUTO_5811 ?AUTO_5812 ) ) ( not ( = ?AUTO_5813 ?AUTO_5812 ) ) ( not ( = ?AUTO_5816 ?AUTO_5812 ) ) ( not ( = ?AUTO_5815 ?AUTO_5812 ) ) ( not ( = ?AUTO_5814 ?AUTO_5812 ) ) ( ON ?AUTO_5812 ?AUTO_5814 ) ( ON ?AUTO_5816 ?AUTO_5812 ) ( CLEAR ?AUTO_5816 ) ( not ( = ?AUTO_5809 ?AUTO_5817 ) ) ( not ( = ?AUTO_5810 ?AUTO_5817 ) ) ( not ( = ?AUTO_5811 ?AUTO_5817 ) ) ( not ( = ?AUTO_5813 ?AUTO_5817 ) ) ( not ( = ?AUTO_5816 ?AUTO_5817 ) ) ( not ( = ?AUTO_5815 ?AUTO_5817 ) ) ( not ( = ?AUTO_5814 ?AUTO_5817 ) ) ( not ( = ?AUTO_5812 ?AUTO_5817 ) ) ( ON ?AUTO_5817 ?AUTO_5809 ) ( CLEAR ?AUTO_5817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5817 ?AUTO_5809 )
      ( MAKE-ON ?AUTO_5809 ?AUTO_5810 )
      ( MAKE-ON-VERIFY ?AUTO_5809 ?AUTO_5810 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5818 - BLOCK
      ?AUTO_5819 - BLOCK
    )
    :vars
    (
      ?AUTO_5820 - BLOCK
      ?AUTO_5822 - BLOCK
      ?AUTO_5825 - BLOCK
      ?AUTO_5823 - BLOCK
      ?AUTO_5824 - BLOCK
      ?AUTO_5826 - BLOCK
      ?AUTO_5821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5818 ?AUTO_5819 ) ) ( ON ?AUTO_5818 ?AUTO_5820 ) ( not ( = ?AUTO_5818 ?AUTO_5820 ) ) ( not ( = ?AUTO_5819 ?AUTO_5820 ) ) ( not ( = ?AUTO_5818 ?AUTO_5822 ) ) ( not ( = ?AUTO_5818 ?AUTO_5825 ) ) ( not ( = ?AUTO_5819 ?AUTO_5822 ) ) ( not ( = ?AUTO_5819 ?AUTO_5825 ) ) ( not ( = ?AUTO_5820 ?AUTO_5822 ) ) ( not ( = ?AUTO_5820 ?AUTO_5825 ) ) ( not ( = ?AUTO_5822 ?AUTO_5825 ) ) ( CLEAR ?AUTO_5823 ) ( not ( = ?AUTO_5818 ?AUTO_5824 ) ) ( not ( = ?AUTO_5818 ?AUTO_5823 ) ) ( not ( = ?AUTO_5819 ?AUTO_5824 ) ) ( not ( = ?AUTO_5819 ?AUTO_5823 ) ) ( not ( = ?AUTO_5820 ?AUTO_5824 ) ) ( not ( = ?AUTO_5820 ?AUTO_5823 ) ) ( not ( = ?AUTO_5825 ?AUTO_5824 ) ) ( not ( = ?AUTO_5825 ?AUTO_5823 ) ) ( not ( = ?AUTO_5822 ?AUTO_5824 ) ) ( not ( = ?AUTO_5822 ?AUTO_5823 ) ) ( not ( = ?AUTO_5824 ?AUTO_5823 ) ) ( ON ?AUTO_5824 ?AUTO_5819 ) ( not ( = ?AUTO_5818 ?AUTO_5826 ) ) ( not ( = ?AUTO_5819 ?AUTO_5826 ) ) ( not ( = ?AUTO_5820 ?AUTO_5826 ) ) ( not ( = ?AUTO_5825 ?AUTO_5826 ) ) ( not ( = ?AUTO_5822 ?AUTO_5826 ) ) ( not ( = ?AUTO_5823 ?AUTO_5826 ) ) ( not ( = ?AUTO_5824 ?AUTO_5826 ) ) ( ON ?AUTO_5826 ?AUTO_5824 ) ( ON ?AUTO_5822 ?AUTO_5826 ) ( CLEAR ?AUTO_5822 ) ( not ( = ?AUTO_5818 ?AUTO_5821 ) ) ( not ( = ?AUTO_5819 ?AUTO_5821 ) ) ( not ( = ?AUTO_5820 ?AUTO_5821 ) ) ( not ( = ?AUTO_5825 ?AUTO_5821 ) ) ( not ( = ?AUTO_5822 ?AUTO_5821 ) ) ( not ( = ?AUTO_5823 ?AUTO_5821 ) ) ( not ( = ?AUTO_5824 ?AUTO_5821 ) ) ( not ( = ?AUTO_5826 ?AUTO_5821 ) ) ( ON ?AUTO_5821 ?AUTO_5818 ) ( CLEAR ?AUTO_5821 ) ( HOLDING ?AUTO_5825 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5825 )
      ( MAKE-ON ?AUTO_5818 ?AUTO_5819 )
      ( MAKE-ON-VERIFY ?AUTO_5818 ?AUTO_5819 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5827 - BLOCK
      ?AUTO_5828 - BLOCK
    )
    :vars
    (
      ?AUTO_5834 - BLOCK
      ?AUTO_5831 - BLOCK
      ?AUTO_5832 - BLOCK
      ?AUTO_5829 - BLOCK
      ?AUTO_5835 - BLOCK
      ?AUTO_5833 - BLOCK
      ?AUTO_5830 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5827 ?AUTO_5828 ) ) ( ON ?AUTO_5827 ?AUTO_5834 ) ( not ( = ?AUTO_5827 ?AUTO_5834 ) ) ( not ( = ?AUTO_5828 ?AUTO_5834 ) ) ( not ( = ?AUTO_5827 ?AUTO_5831 ) ) ( not ( = ?AUTO_5827 ?AUTO_5832 ) ) ( not ( = ?AUTO_5828 ?AUTO_5831 ) ) ( not ( = ?AUTO_5828 ?AUTO_5832 ) ) ( not ( = ?AUTO_5834 ?AUTO_5831 ) ) ( not ( = ?AUTO_5834 ?AUTO_5832 ) ) ( not ( = ?AUTO_5831 ?AUTO_5832 ) ) ( CLEAR ?AUTO_5829 ) ( not ( = ?AUTO_5827 ?AUTO_5835 ) ) ( not ( = ?AUTO_5827 ?AUTO_5829 ) ) ( not ( = ?AUTO_5828 ?AUTO_5835 ) ) ( not ( = ?AUTO_5828 ?AUTO_5829 ) ) ( not ( = ?AUTO_5834 ?AUTO_5835 ) ) ( not ( = ?AUTO_5834 ?AUTO_5829 ) ) ( not ( = ?AUTO_5832 ?AUTO_5835 ) ) ( not ( = ?AUTO_5832 ?AUTO_5829 ) ) ( not ( = ?AUTO_5831 ?AUTO_5835 ) ) ( not ( = ?AUTO_5831 ?AUTO_5829 ) ) ( not ( = ?AUTO_5835 ?AUTO_5829 ) ) ( ON ?AUTO_5835 ?AUTO_5828 ) ( not ( = ?AUTO_5827 ?AUTO_5833 ) ) ( not ( = ?AUTO_5828 ?AUTO_5833 ) ) ( not ( = ?AUTO_5834 ?AUTO_5833 ) ) ( not ( = ?AUTO_5832 ?AUTO_5833 ) ) ( not ( = ?AUTO_5831 ?AUTO_5833 ) ) ( not ( = ?AUTO_5829 ?AUTO_5833 ) ) ( not ( = ?AUTO_5835 ?AUTO_5833 ) ) ( ON ?AUTO_5833 ?AUTO_5835 ) ( ON ?AUTO_5831 ?AUTO_5833 ) ( CLEAR ?AUTO_5831 ) ( not ( = ?AUTO_5827 ?AUTO_5830 ) ) ( not ( = ?AUTO_5828 ?AUTO_5830 ) ) ( not ( = ?AUTO_5834 ?AUTO_5830 ) ) ( not ( = ?AUTO_5832 ?AUTO_5830 ) ) ( not ( = ?AUTO_5831 ?AUTO_5830 ) ) ( not ( = ?AUTO_5829 ?AUTO_5830 ) ) ( not ( = ?AUTO_5835 ?AUTO_5830 ) ) ( not ( = ?AUTO_5833 ?AUTO_5830 ) ) ( ON ?AUTO_5830 ?AUTO_5827 ) ( ON ?AUTO_5832 ?AUTO_5830 ) ( CLEAR ?AUTO_5832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5832 ?AUTO_5830 )
      ( MAKE-ON ?AUTO_5827 ?AUTO_5828 )
      ( MAKE-ON-VERIFY ?AUTO_5827 ?AUTO_5828 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5836 - BLOCK
      ?AUTO_5837 - BLOCK
    )
    :vars
    (
      ?AUTO_5840 - BLOCK
      ?AUTO_5844 - BLOCK
      ?AUTO_5843 - BLOCK
      ?AUTO_5842 - BLOCK
      ?AUTO_5839 - BLOCK
      ?AUTO_5841 - BLOCK
      ?AUTO_5838 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5836 ?AUTO_5837 ) ) ( ON ?AUTO_5836 ?AUTO_5840 ) ( not ( = ?AUTO_5836 ?AUTO_5840 ) ) ( not ( = ?AUTO_5837 ?AUTO_5840 ) ) ( not ( = ?AUTO_5836 ?AUTO_5844 ) ) ( not ( = ?AUTO_5836 ?AUTO_5843 ) ) ( not ( = ?AUTO_5837 ?AUTO_5844 ) ) ( not ( = ?AUTO_5837 ?AUTO_5843 ) ) ( not ( = ?AUTO_5840 ?AUTO_5844 ) ) ( not ( = ?AUTO_5840 ?AUTO_5843 ) ) ( not ( = ?AUTO_5844 ?AUTO_5843 ) ) ( not ( = ?AUTO_5836 ?AUTO_5842 ) ) ( not ( = ?AUTO_5836 ?AUTO_5839 ) ) ( not ( = ?AUTO_5837 ?AUTO_5842 ) ) ( not ( = ?AUTO_5837 ?AUTO_5839 ) ) ( not ( = ?AUTO_5840 ?AUTO_5842 ) ) ( not ( = ?AUTO_5840 ?AUTO_5839 ) ) ( not ( = ?AUTO_5843 ?AUTO_5842 ) ) ( not ( = ?AUTO_5843 ?AUTO_5839 ) ) ( not ( = ?AUTO_5844 ?AUTO_5842 ) ) ( not ( = ?AUTO_5844 ?AUTO_5839 ) ) ( not ( = ?AUTO_5842 ?AUTO_5839 ) ) ( ON ?AUTO_5842 ?AUTO_5837 ) ( not ( = ?AUTO_5836 ?AUTO_5841 ) ) ( not ( = ?AUTO_5837 ?AUTO_5841 ) ) ( not ( = ?AUTO_5840 ?AUTO_5841 ) ) ( not ( = ?AUTO_5843 ?AUTO_5841 ) ) ( not ( = ?AUTO_5844 ?AUTO_5841 ) ) ( not ( = ?AUTO_5839 ?AUTO_5841 ) ) ( not ( = ?AUTO_5842 ?AUTO_5841 ) ) ( ON ?AUTO_5841 ?AUTO_5842 ) ( ON ?AUTO_5844 ?AUTO_5841 ) ( CLEAR ?AUTO_5844 ) ( not ( = ?AUTO_5836 ?AUTO_5838 ) ) ( not ( = ?AUTO_5837 ?AUTO_5838 ) ) ( not ( = ?AUTO_5840 ?AUTO_5838 ) ) ( not ( = ?AUTO_5843 ?AUTO_5838 ) ) ( not ( = ?AUTO_5844 ?AUTO_5838 ) ) ( not ( = ?AUTO_5839 ?AUTO_5838 ) ) ( not ( = ?AUTO_5842 ?AUTO_5838 ) ) ( not ( = ?AUTO_5841 ?AUTO_5838 ) ) ( ON ?AUTO_5838 ?AUTO_5836 ) ( ON ?AUTO_5843 ?AUTO_5838 ) ( CLEAR ?AUTO_5843 ) ( HOLDING ?AUTO_5839 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5839 )
      ( MAKE-ON ?AUTO_5836 ?AUTO_5837 )
      ( MAKE-ON-VERIFY ?AUTO_5836 ?AUTO_5837 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5845 - BLOCK
      ?AUTO_5846 - BLOCK
    )
    :vars
    (
      ?AUTO_5852 - BLOCK
      ?AUTO_5853 - BLOCK
      ?AUTO_5849 - BLOCK
      ?AUTO_5851 - BLOCK
      ?AUTO_5847 - BLOCK
      ?AUTO_5850 - BLOCK
      ?AUTO_5848 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5845 ?AUTO_5846 ) ) ( ON ?AUTO_5845 ?AUTO_5852 ) ( not ( = ?AUTO_5845 ?AUTO_5852 ) ) ( not ( = ?AUTO_5846 ?AUTO_5852 ) ) ( not ( = ?AUTO_5845 ?AUTO_5853 ) ) ( not ( = ?AUTO_5845 ?AUTO_5849 ) ) ( not ( = ?AUTO_5846 ?AUTO_5853 ) ) ( not ( = ?AUTO_5846 ?AUTO_5849 ) ) ( not ( = ?AUTO_5852 ?AUTO_5853 ) ) ( not ( = ?AUTO_5852 ?AUTO_5849 ) ) ( not ( = ?AUTO_5853 ?AUTO_5849 ) ) ( not ( = ?AUTO_5845 ?AUTO_5851 ) ) ( not ( = ?AUTO_5845 ?AUTO_5847 ) ) ( not ( = ?AUTO_5846 ?AUTO_5851 ) ) ( not ( = ?AUTO_5846 ?AUTO_5847 ) ) ( not ( = ?AUTO_5852 ?AUTO_5851 ) ) ( not ( = ?AUTO_5852 ?AUTO_5847 ) ) ( not ( = ?AUTO_5849 ?AUTO_5851 ) ) ( not ( = ?AUTO_5849 ?AUTO_5847 ) ) ( not ( = ?AUTO_5853 ?AUTO_5851 ) ) ( not ( = ?AUTO_5853 ?AUTO_5847 ) ) ( not ( = ?AUTO_5851 ?AUTO_5847 ) ) ( ON ?AUTO_5851 ?AUTO_5846 ) ( not ( = ?AUTO_5845 ?AUTO_5850 ) ) ( not ( = ?AUTO_5846 ?AUTO_5850 ) ) ( not ( = ?AUTO_5852 ?AUTO_5850 ) ) ( not ( = ?AUTO_5849 ?AUTO_5850 ) ) ( not ( = ?AUTO_5853 ?AUTO_5850 ) ) ( not ( = ?AUTO_5847 ?AUTO_5850 ) ) ( not ( = ?AUTO_5851 ?AUTO_5850 ) ) ( ON ?AUTO_5850 ?AUTO_5851 ) ( ON ?AUTO_5853 ?AUTO_5850 ) ( CLEAR ?AUTO_5853 ) ( not ( = ?AUTO_5845 ?AUTO_5848 ) ) ( not ( = ?AUTO_5846 ?AUTO_5848 ) ) ( not ( = ?AUTO_5852 ?AUTO_5848 ) ) ( not ( = ?AUTO_5849 ?AUTO_5848 ) ) ( not ( = ?AUTO_5853 ?AUTO_5848 ) ) ( not ( = ?AUTO_5847 ?AUTO_5848 ) ) ( not ( = ?AUTO_5851 ?AUTO_5848 ) ) ( not ( = ?AUTO_5850 ?AUTO_5848 ) ) ( ON ?AUTO_5848 ?AUTO_5845 ) ( ON ?AUTO_5849 ?AUTO_5848 ) ( ON ?AUTO_5847 ?AUTO_5849 ) ( CLEAR ?AUTO_5847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5847 ?AUTO_5849 )
      ( MAKE-ON ?AUTO_5845 ?AUTO_5846 )
      ( MAKE-ON-VERIFY ?AUTO_5845 ?AUTO_5846 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5856 - BLOCK
      ?AUTO_5857 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5856 ) ( CLEAR ?AUTO_5857 ) ( not ( = ?AUTO_5856 ?AUTO_5857 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5856 ?AUTO_5857 )
      ( MAKE-ON-VERIFY ?AUTO_5856 ?AUTO_5857 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5858 - BLOCK
      ?AUTO_5859 - BLOCK
    )
    :vars
    (
      ?AUTO_5860 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5859 ) ( not ( = ?AUTO_5858 ?AUTO_5859 ) ) ( ON ?AUTO_5858 ?AUTO_5860 ) ( CLEAR ?AUTO_5858 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5858 ?AUTO_5860 ) ) ( not ( = ?AUTO_5859 ?AUTO_5860 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5858 ?AUTO_5860 )
      ( MAKE-ON ?AUTO_5858 ?AUTO_5859 )
      ( MAKE-ON-VERIFY ?AUTO_5858 ?AUTO_5859 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5861 - BLOCK
      ?AUTO_5862 - BLOCK
    )
    :vars
    (
      ?AUTO_5863 - BLOCK
      ?AUTO_5864 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5861 ?AUTO_5862 ) ) ( ON ?AUTO_5861 ?AUTO_5863 ) ( CLEAR ?AUTO_5861 ) ( not ( = ?AUTO_5861 ?AUTO_5863 ) ) ( not ( = ?AUTO_5862 ?AUTO_5863 ) ) ( HOLDING ?AUTO_5862 ) ( CLEAR ?AUTO_5864 ) ( not ( = ?AUTO_5861 ?AUTO_5864 ) ) ( not ( = ?AUTO_5862 ?AUTO_5864 ) ) ( not ( = ?AUTO_5863 ?AUTO_5864 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5862 ?AUTO_5864 )
      ( MAKE-ON ?AUTO_5861 ?AUTO_5862 )
      ( MAKE-ON-VERIFY ?AUTO_5861 ?AUTO_5862 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5946 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5946 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5946 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5946 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5947 - BLOCK
    )
    :vars
    (
      ?AUTO_5948 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5947 ?AUTO_5948 ) ( CLEAR ?AUTO_5947 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5947 ?AUTO_5948 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5947 ?AUTO_5948 )
      ( MAKE-ON-TABLE ?AUTO_5947 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5947 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5949 - BLOCK
    )
    :vars
    (
      ?AUTO_5950 - BLOCK
      ?AUTO_5951 - BLOCK
      ?AUTO_5952 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5949 ?AUTO_5950 ) ( CLEAR ?AUTO_5949 ) ( not ( = ?AUTO_5949 ?AUTO_5950 ) ) ( HOLDING ?AUTO_5951 ) ( CLEAR ?AUTO_5952 ) ( not ( = ?AUTO_5949 ?AUTO_5951 ) ) ( not ( = ?AUTO_5949 ?AUTO_5952 ) ) ( not ( = ?AUTO_5950 ?AUTO_5951 ) ) ( not ( = ?AUTO_5950 ?AUTO_5952 ) ) ( not ( = ?AUTO_5951 ?AUTO_5952 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5951 ?AUTO_5952 )
      ( MAKE-ON-TABLE ?AUTO_5949 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5949 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5987 - BLOCK
      ?AUTO_5988 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5987 ) ( CLEAR ?AUTO_5988 ) ( not ( = ?AUTO_5987 ?AUTO_5988 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5987 ?AUTO_5988 )
      ( MAKE-ON-VERIFY ?AUTO_5987 ?AUTO_5988 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5989 - BLOCK
      ?AUTO_5990 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5990 ) ( not ( = ?AUTO_5989 ?AUTO_5990 ) ) ( ON-TABLE ?AUTO_5989 ) ( CLEAR ?AUTO_5989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5989 )
      ( MAKE-ON ?AUTO_5989 ?AUTO_5990 )
      ( MAKE-ON-VERIFY ?AUTO_5989 ?AUTO_5990 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5991 - BLOCK
      ?AUTO_5992 - BLOCK
    )
    :vars
    (
      ?AUTO_5993 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5992 ) ( not ( = ?AUTO_5991 ?AUTO_5992 ) ) ( ON-TABLE ?AUTO_5991 ) ( CLEAR ?AUTO_5991 ) ( HOLDING ?AUTO_5993 ) ( not ( = ?AUTO_5991 ?AUTO_5993 ) ) ( not ( = ?AUTO_5992 ?AUTO_5993 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5993 )
      ( MAKE-ON ?AUTO_5991 ?AUTO_5992 )
      ( MAKE-ON-VERIFY ?AUTO_5991 ?AUTO_5992 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5994 - BLOCK
      ?AUTO_5995 - BLOCK
    )
    :vars
    (
      ?AUTO_5996 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5995 ) ( not ( = ?AUTO_5994 ?AUTO_5995 ) ) ( ON-TABLE ?AUTO_5994 ) ( not ( = ?AUTO_5994 ?AUTO_5996 ) ) ( not ( = ?AUTO_5995 ?AUTO_5996 ) ) ( ON ?AUTO_5996 ?AUTO_5994 ) ( CLEAR ?AUTO_5996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5996 ?AUTO_5994 )
      ( MAKE-ON ?AUTO_5994 ?AUTO_5995 )
      ( MAKE-ON-VERIFY ?AUTO_5994 ?AUTO_5995 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5997 - BLOCK
      ?AUTO_5998 - BLOCK
    )
    :vars
    (
      ?AUTO_5999 - BLOCK
      ?AUTO_6000 - BLOCK
      ?AUTO_6001 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5998 ) ( not ( = ?AUTO_5997 ?AUTO_5998 ) ) ( ON-TABLE ?AUTO_5997 ) ( not ( = ?AUTO_5997 ?AUTO_5999 ) ) ( not ( = ?AUTO_5998 ?AUTO_5999 ) ) ( ON ?AUTO_5999 ?AUTO_5997 ) ( CLEAR ?AUTO_5999 ) ( HOLDING ?AUTO_6000 ) ( CLEAR ?AUTO_6001 ) ( not ( = ?AUTO_5997 ?AUTO_6000 ) ) ( not ( = ?AUTO_5997 ?AUTO_6001 ) ) ( not ( = ?AUTO_5998 ?AUTO_6000 ) ) ( not ( = ?AUTO_5998 ?AUTO_6001 ) ) ( not ( = ?AUTO_5999 ?AUTO_6000 ) ) ( not ( = ?AUTO_5999 ?AUTO_6001 ) ) ( not ( = ?AUTO_6000 ?AUTO_6001 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6000 ?AUTO_6001 )
      ( MAKE-ON ?AUTO_5997 ?AUTO_5998 )
      ( MAKE-ON-VERIFY ?AUTO_5997 ?AUTO_5998 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6006 - BLOCK
      ?AUTO_6007 - BLOCK
    )
    :vars
    (
      ?AUTO_6010 - BLOCK
      ?AUTO_6008 - BLOCK
      ?AUTO_6009 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6006 ?AUTO_6007 ) ) ( ON-TABLE ?AUTO_6006 ) ( not ( = ?AUTO_6006 ?AUTO_6010 ) ) ( not ( = ?AUTO_6007 ?AUTO_6010 ) ) ( ON ?AUTO_6010 ?AUTO_6006 ) ( CLEAR ?AUTO_6010 ) ( CLEAR ?AUTO_6008 ) ( not ( = ?AUTO_6006 ?AUTO_6009 ) ) ( not ( = ?AUTO_6006 ?AUTO_6008 ) ) ( not ( = ?AUTO_6007 ?AUTO_6009 ) ) ( not ( = ?AUTO_6007 ?AUTO_6008 ) ) ( not ( = ?AUTO_6010 ?AUTO_6009 ) ) ( not ( = ?AUTO_6010 ?AUTO_6008 ) ) ( not ( = ?AUTO_6009 ?AUTO_6008 ) ) ( ON ?AUTO_6009 ?AUTO_6007 ) ( CLEAR ?AUTO_6009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6009 ?AUTO_6007 )
      ( MAKE-ON ?AUTO_6006 ?AUTO_6007 )
      ( MAKE-ON-VERIFY ?AUTO_6006 ?AUTO_6007 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6011 - BLOCK
      ?AUTO_6012 - BLOCK
    )
    :vars
    (
      ?AUTO_6015 - BLOCK
      ?AUTO_6013 - BLOCK
      ?AUTO_6014 - BLOCK
      ?AUTO_6016 - BLOCK
      ?AUTO_6017 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6011 ?AUTO_6012 ) ) ( ON-TABLE ?AUTO_6011 ) ( not ( = ?AUTO_6011 ?AUTO_6015 ) ) ( not ( = ?AUTO_6012 ?AUTO_6015 ) ) ( ON ?AUTO_6015 ?AUTO_6011 ) ( CLEAR ?AUTO_6015 ) ( CLEAR ?AUTO_6013 ) ( not ( = ?AUTO_6011 ?AUTO_6014 ) ) ( not ( = ?AUTO_6011 ?AUTO_6013 ) ) ( not ( = ?AUTO_6012 ?AUTO_6014 ) ) ( not ( = ?AUTO_6012 ?AUTO_6013 ) ) ( not ( = ?AUTO_6015 ?AUTO_6014 ) ) ( not ( = ?AUTO_6015 ?AUTO_6013 ) ) ( not ( = ?AUTO_6014 ?AUTO_6013 ) ) ( ON ?AUTO_6014 ?AUTO_6012 ) ( CLEAR ?AUTO_6014 ) ( HOLDING ?AUTO_6016 ) ( CLEAR ?AUTO_6017 ) ( not ( = ?AUTO_6011 ?AUTO_6016 ) ) ( not ( = ?AUTO_6011 ?AUTO_6017 ) ) ( not ( = ?AUTO_6012 ?AUTO_6016 ) ) ( not ( = ?AUTO_6012 ?AUTO_6017 ) ) ( not ( = ?AUTO_6015 ?AUTO_6016 ) ) ( not ( = ?AUTO_6015 ?AUTO_6017 ) ) ( not ( = ?AUTO_6013 ?AUTO_6016 ) ) ( not ( = ?AUTO_6013 ?AUTO_6017 ) ) ( not ( = ?AUTO_6014 ?AUTO_6016 ) ) ( not ( = ?AUTO_6014 ?AUTO_6017 ) ) ( not ( = ?AUTO_6016 ?AUTO_6017 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6016 ?AUTO_6017 )
      ( MAKE-ON ?AUTO_6011 ?AUTO_6012 )
      ( MAKE-ON-VERIFY ?AUTO_6011 ?AUTO_6012 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6018 - BLOCK
      ?AUTO_6019 - BLOCK
    )
    :vars
    (
      ?AUTO_6024 - BLOCK
      ?AUTO_6020 - BLOCK
      ?AUTO_6021 - BLOCK
      ?AUTO_6023 - BLOCK
      ?AUTO_6022 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6018 ?AUTO_6019 ) ) ( ON-TABLE ?AUTO_6018 ) ( not ( = ?AUTO_6018 ?AUTO_6024 ) ) ( not ( = ?AUTO_6019 ?AUTO_6024 ) ) ( ON ?AUTO_6024 ?AUTO_6018 ) ( CLEAR ?AUTO_6024 ) ( CLEAR ?AUTO_6020 ) ( not ( = ?AUTO_6018 ?AUTO_6021 ) ) ( not ( = ?AUTO_6018 ?AUTO_6020 ) ) ( not ( = ?AUTO_6019 ?AUTO_6021 ) ) ( not ( = ?AUTO_6019 ?AUTO_6020 ) ) ( not ( = ?AUTO_6024 ?AUTO_6021 ) ) ( not ( = ?AUTO_6024 ?AUTO_6020 ) ) ( not ( = ?AUTO_6021 ?AUTO_6020 ) ) ( ON ?AUTO_6021 ?AUTO_6019 ) ( CLEAR ?AUTO_6023 ) ( not ( = ?AUTO_6018 ?AUTO_6022 ) ) ( not ( = ?AUTO_6018 ?AUTO_6023 ) ) ( not ( = ?AUTO_6019 ?AUTO_6022 ) ) ( not ( = ?AUTO_6019 ?AUTO_6023 ) ) ( not ( = ?AUTO_6024 ?AUTO_6022 ) ) ( not ( = ?AUTO_6024 ?AUTO_6023 ) ) ( not ( = ?AUTO_6020 ?AUTO_6022 ) ) ( not ( = ?AUTO_6020 ?AUTO_6023 ) ) ( not ( = ?AUTO_6021 ?AUTO_6022 ) ) ( not ( = ?AUTO_6021 ?AUTO_6023 ) ) ( not ( = ?AUTO_6022 ?AUTO_6023 ) ) ( ON ?AUTO_6022 ?AUTO_6021 ) ( CLEAR ?AUTO_6022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6022 ?AUTO_6021 )
      ( MAKE-ON ?AUTO_6018 ?AUTO_6019 )
      ( MAKE-ON-VERIFY ?AUTO_6018 ?AUTO_6019 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6025 - BLOCK
      ?AUTO_6026 - BLOCK
    )
    :vars
    (
      ?AUTO_6031 - BLOCK
      ?AUTO_6027 - BLOCK
      ?AUTO_6028 - BLOCK
      ?AUTO_6030 - BLOCK
      ?AUTO_6029 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6025 ?AUTO_6026 ) ) ( ON-TABLE ?AUTO_6025 ) ( not ( = ?AUTO_6025 ?AUTO_6031 ) ) ( not ( = ?AUTO_6026 ?AUTO_6031 ) ) ( CLEAR ?AUTO_6027 ) ( not ( = ?AUTO_6025 ?AUTO_6028 ) ) ( not ( = ?AUTO_6025 ?AUTO_6027 ) ) ( not ( = ?AUTO_6026 ?AUTO_6028 ) ) ( not ( = ?AUTO_6026 ?AUTO_6027 ) ) ( not ( = ?AUTO_6031 ?AUTO_6028 ) ) ( not ( = ?AUTO_6031 ?AUTO_6027 ) ) ( not ( = ?AUTO_6028 ?AUTO_6027 ) ) ( ON ?AUTO_6028 ?AUTO_6026 ) ( CLEAR ?AUTO_6030 ) ( not ( = ?AUTO_6025 ?AUTO_6029 ) ) ( not ( = ?AUTO_6025 ?AUTO_6030 ) ) ( not ( = ?AUTO_6026 ?AUTO_6029 ) ) ( not ( = ?AUTO_6026 ?AUTO_6030 ) ) ( not ( = ?AUTO_6031 ?AUTO_6029 ) ) ( not ( = ?AUTO_6031 ?AUTO_6030 ) ) ( not ( = ?AUTO_6027 ?AUTO_6029 ) ) ( not ( = ?AUTO_6027 ?AUTO_6030 ) ) ( not ( = ?AUTO_6028 ?AUTO_6029 ) ) ( not ( = ?AUTO_6028 ?AUTO_6030 ) ) ( not ( = ?AUTO_6029 ?AUTO_6030 ) ) ( ON ?AUTO_6029 ?AUTO_6028 ) ( CLEAR ?AUTO_6029 ) ( HOLDING ?AUTO_6031 ) ( CLEAR ?AUTO_6025 ) )
    :subtasks
    ( ( !STACK ?AUTO_6031 ?AUTO_6025 )
      ( MAKE-ON ?AUTO_6025 ?AUTO_6026 )
      ( MAKE-ON-VERIFY ?AUTO_6025 ?AUTO_6026 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6032 - BLOCK
      ?AUTO_6033 - BLOCK
    )
    :vars
    (
      ?AUTO_6036 - BLOCK
      ?AUTO_6037 - BLOCK
      ?AUTO_6035 - BLOCK
      ?AUTO_6034 - BLOCK
      ?AUTO_6038 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6032 ?AUTO_6033 ) ) ( ON-TABLE ?AUTO_6032 ) ( not ( = ?AUTO_6032 ?AUTO_6036 ) ) ( not ( = ?AUTO_6033 ?AUTO_6036 ) ) ( CLEAR ?AUTO_6037 ) ( not ( = ?AUTO_6032 ?AUTO_6035 ) ) ( not ( = ?AUTO_6032 ?AUTO_6037 ) ) ( not ( = ?AUTO_6033 ?AUTO_6035 ) ) ( not ( = ?AUTO_6033 ?AUTO_6037 ) ) ( not ( = ?AUTO_6036 ?AUTO_6035 ) ) ( not ( = ?AUTO_6036 ?AUTO_6037 ) ) ( not ( = ?AUTO_6035 ?AUTO_6037 ) ) ( ON ?AUTO_6035 ?AUTO_6033 ) ( CLEAR ?AUTO_6034 ) ( not ( = ?AUTO_6032 ?AUTO_6038 ) ) ( not ( = ?AUTO_6032 ?AUTO_6034 ) ) ( not ( = ?AUTO_6033 ?AUTO_6038 ) ) ( not ( = ?AUTO_6033 ?AUTO_6034 ) ) ( not ( = ?AUTO_6036 ?AUTO_6038 ) ) ( not ( = ?AUTO_6036 ?AUTO_6034 ) ) ( not ( = ?AUTO_6037 ?AUTO_6038 ) ) ( not ( = ?AUTO_6037 ?AUTO_6034 ) ) ( not ( = ?AUTO_6035 ?AUTO_6038 ) ) ( not ( = ?AUTO_6035 ?AUTO_6034 ) ) ( not ( = ?AUTO_6038 ?AUTO_6034 ) ) ( ON ?AUTO_6038 ?AUTO_6035 ) ( CLEAR ?AUTO_6038 ) ( CLEAR ?AUTO_6032 ) ( ON-TABLE ?AUTO_6036 ) ( CLEAR ?AUTO_6036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6036 )
      ( MAKE-ON ?AUTO_6032 ?AUTO_6033 )
      ( MAKE-ON-VERIFY ?AUTO_6032 ?AUTO_6033 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6043 - BLOCK
      ?AUTO_6044 - BLOCK
    )
    :vars
    (
      ?AUTO_6049 - BLOCK
      ?AUTO_6045 - BLOCK
      ?AUTO_6046 - BLOCK
      ?AUTO_6048 - BLOCK
      ?AUTO_6047 - BLOCK
      ?AUTO_6050 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6043 ?AUTO_6044 ) ) ( ON-TABLE ?AUTO_6043 ) ( not ( = ?AUTO_6043 ?AUTO_6049 ) ) ( not ( = ?AUTO_6044 ?AUTO_6049 ) ) ( ON ?AUTO_6049 ?AUTO_6043 ) ( CLEAR ?AUTO_6049 ) ( CLEAR ?AUTO_6045 ) ( not ( = ?AUTO_6043 ?AUTO_6046 ) ) ( not ( = ?AUTO_6043 ?AUTO_6045 ) ) ( not ( = ?AUTO_6044 ?AUTO_6046 ) ) ( not ( = ?AUTO_6044 ?AUTO_6045 ) ) ( not ( = ?AUTO_6049 ?AUTO_6046 ) ) ( not ( = ?AUTO_6049 ?AUTO_6045 ) ) ( not ( = ?AUTO_6046 ?AUTO_6045 ) ) ( ON ?AUTO_6046 ?AUTO_6044 ) ( CLEAR ?AUTO_6048 ) ( not ( = ?AUTO_6043 ?AUTO_6047 ) ) ( not ( = ?AUTO_6043 ?AUTO_6048 ) ) ( not ( = ?AUTO_6044 ?AUTO_6047 ) ) ( not ( = ?AUTO_6044 ?AUTO_6048 ) ) ( not ( = ?AUTO_6049 ?AUTO_6047 ) ) ( not ( = ?AUTO_6049 ?AUTO_6048 ) ) ( not ( = ?AUTO_6045 ?AUTO_6047 ) ) ( not ( = ?AUTO_6045 ?AUTO_6048 ) ) ( not ( = ?AUTO_6046 ?AUTO_6047 ) ) ( not ( = ?AUTO_6046 ?AUTO_6048 ) ) ( not ( = ?AUTO_6047 ?AUTO_6048 ) ) ( ON ?AUTO_6047 ?AUTO_6046 ) ( CLEAR ?AUTO_6047 ) ( HOLDING ?AUTO_6050 ) ( not ( = ?AUTO_6043 ?AUTO_6050 ) ) ( not ( = ?AUTO_6044 ?AUTO_6050 ) ) ( not ( = ?AUTO_6049 ?AUTO_6050 ) ) ( not ( = ?AUTO_6045 ?AUTO_6050 ) ) ( not ( = ?AUTO_6046 ?AUTO_6050 ) ) ( not ( = ?AUTO_6048 ?AUTO_6050 ) ) ( not ( = ?AUTO_6047 ?AUTO_6050 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6050 )
      ( MAKE-ON ?AUTO_6043 ?AUTO_6044 )
      ( MAKE-ON-VERIFY ?AUTO_6043 ?AUTO_6044 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6051 - BLOCK
      ?AUTO_6052 - BLOCK
    )
    :vars
    (
      ?AUTO_6057 - BLOCK
      ?AUTO_6053 - BLOCK
      ?AUTO_6054 - BLOCK
      ?AUTO_6056 - BLOCK
      ?AUTO_6058 - BLOCK
      ?AUTO_6055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6051 ?AUTO_6052 ) ) ( ON-TABLE ?AUTO_6051 ) ( not ( = ?AUTO_6051 ?AUTO_6057 ) ) ( not ( = ?AUTO_6052 ?AUTO_6057 ) ) ( ON ?AUTO_6057 ?AUTO_6051 ) ( CLEAR ?AUTO_6053 ) ( not ( = ?AUTO_6051 ?AUTO_6054 ) ) ( not ( = ?AUTO_6051 ?AUTO_6053 ) ) ( not ( = ?AUTO_6052 ?AUTO_6054 ) ) ( not ( = ?AUTO_6052 ?AUTO_6053 ) ) ( not ( = ?AUTO_6057 ?AUTO_6054 ) ) ( not ( = ?AUTO_6057 ?AUTO_6053 ) ) ( not ( = ?AUTO_6054 ?AUTO_6053 ) ) ( ON ?AUTO_6054 ?AUTO_6052 ) ( CLEAR ?AUTO_6056 ) ( not ( = ?AUTO_6051 ?AUTO_6058 ) ) ( not ( = ?AUTO_6051 ?AUTO_6056 ) ) ( not ( = ?AUTO_6052 ?AUTO_6058 ) ) ( not ( = ?AUTO_6052 ?AUTO_6056 ) ) ( not ( = ?AUTO_6057 ?AUTO_6058 ) ) ( not ( = ?AUTO_6057 ?AUTO_6056 ) ) ( not ( = ?AUTO_6053 ?AUTO_6058 ) ) ( not ( = ?AUTO_6053 ?AUTO_6056 ) ) ( not ( = ?AUTO_6054 ?AUTO_6058 ) ) ( not ( = ?AUTO_6054 ?AUTO_6056 ) ) ( not ( = ?AUTO_6058 ?AUTO_6056 ) ) ( ON ?AUTO_6058 ?AUTO_6054 ) ( CLEAR ?AUTO_6058 ) ( not ( = ?AUTO_6051 ?AUTO_6055 ) ) ( not ( = ?AUTO_6052 ?AUTO_6055 ) ) ( not ( = ?AUTO_6057 ?AUTO_6055 ) ) ( not ( = ?AUTO_6053 ?AUTO_6055 ) ) ( not ( = ?AUTO_6054 ?AUTO_6055 ) ) ( not ( = ?AUTO_6056 ?AUTO_6055 ) ) ( not ( = ?AUTO_6058 ?AUTO_6055 ) ) ( ON ?AUTO_6055 ?AUTO_6057 ) ( CLEAR ?AUTO_6055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6055 ?AUTO_6057 )
      ( MAKE-ON ?AUTO_6051 ?AUTO_6052 )
      ( MAKE-ON-VERIFY ?AUTO_6051 ?AUTO_6052 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6059 - BLOCK
      ?AUTO_6060 - BLOCK
    )
    :vars
    (
      ?AUTO_6061 - BLOCK
      ?AUTO_6064 - BLOCK
      ?AUTO_6065 - BLOCK
      ?AUTO_6062 - BLOCK
      ?AUTO_6066 - BLOCK
      ?AUTO_6063 - BLOCK
      ?AUTO_6067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6059 ?AUTO_6060 ) ) ( ON-TABLE ?AUTO_6059 ) ( not ( = ?AUTO_6059 ?AUTO_6061 ) ) ( not ( = ?AUTO_6060 ?AUTO_6061 ) ) ( ON ?AUTO_6061 ?AUTO_6059 ) ( CLEAR ?AUTO_6064 ) ( not ( = ?AUTO_6059 ?AUTO_6065 ) ) ( not ( = ?AUTO_6059 ?AUTO_6064 ) ) ( not ( = ?AUTO_6060 ?AUTO_6065 ) ) ( not ( = ?AUTO_6060 ?AUTO_6064 ) ) ( not ( = ?AUTO_6061 ?AUTO_6065 ) ) ( not ( = ?AUTO_6061 ?AUTO_6064 ) ) ( not ( = ?AUTO_6065 ?AUTO_6064 ) ) ( ON ?AUTO_6065 ?AUTO_6060 ) ( CLEAR ?AUTO_6062 ) ( not ( = ?AUTO_6059 ?AUTO_6066 ) ) ( not ( = ?AUTO_6059 ?AUTO_6062 ) ) ( not ( = ?AUTO_6060 ?AUTO_6066 ) ) ( not ( = ?AUTO_6060 ?AUTO_6062 ) ) ( not ( = ?AUTO_6061 ?AUTO_6066 ) ) ( not ( = ?AUTO_6061 ?AUTO_6062 ) ) ( not ( = ?AUTO_6064 ?AUTO_6066 ) ) ( not ( = ?AUTO_6064 ?AUTO_6062 ) ) ( not ( = ?AUTO_6065 ?AUTO_6066 ) ) ( not ( = ?AUTO_6065 ?AUTO_6062 ) ) ( not ( = ?AUTO_6066 ?AUTO_6062 ) ) ( ON ?AUTO_6066 ?AUTO_6065 ) ( CLEAR ?AUTO_6066 ) ( not ( = ?AUTO_6059 ?AUTO_6063 ) ) ( not ( = ?AUTO_6060 ?AUTO_6063 ) ) ( not ( = ?AUTO_6061 ?AUTO_6063 ) ) ( not ( = ?AUTO_6064 ?AUTO_6063 ) ) ( not ( = ?AUTO_6065 ?AUTO_6063 ) ) ( not ( = ?AUTO_6062 ?AUTO_6063 ) ) ( not ( = ?AUTO_6066 ?AUTO_6063 ) ) ( ON ?AUTO_6063 ?AUTO_6061 ) ( CLEAR ?AUTO_6063 ) ( HOLDING ?AUTO_6067 ) ( not ( = ?AUTO_6059 ?AUTO_6067 ) ) ( not ( = ?AUTO_6060 ?AUTO_6067 ) ) ( not ( = ?AUTO_6061 ?AUTO_6067 ) ) ( not ( = ?AUTO_6064 ?AUTO_6067 ) ) ( not ( = ?AUTO_6065 ?AUTO_6067 ) ) ( not ( = ?AUTO_6062 ?AUTO_6067 ) ) ( not ( = ?AUTO_6066 ?AUTO_6067 ) ) ( not ( = ?AUTO_6063 ?AUTO_6067 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6067 )
      ( MAKE-ON ?AUTO_6059 ?AUTO_6060 )
      ( MAKE-ON-VERIFY ?AUTO_6059 ?AUTO_6060 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6068 - BLOCK
      ?AUTO_6069 - BLOCK
    )
    :vars
    (
      ?AUTO_6075 - BLOCK
      ?AUTO_6073 - BLOCK
      ?AUTO_6076 - BLOCK
      ?AUTO_6071 - BLOCK
      ?AUTO_6072 - BLOCK
      ?AUTO_6074 - BLOCK
      ?AUTO_6070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6068 ?AUTO_6069 ) ) ( ON-TABLE ?AUTO_6068 ) ( not ( = ?AUTO_6068 ?AUTO_6075 ) ) ( not ( = ?AUTO_6069 ?AUTO_6075 ) ) ( ON ?AUTO_6075 ?AUTO_6068 ) ( CLEAR ?AUTO_6073 ) ( not ( = ?AUTO_6068 ?AUTO_6076 ) ) ( not ( = ?AUTO_6068 ?AUTO_6073 ) ) ( not ( = ?AUTO_6069 ?AUTO_6076 ) ) ( not ( = ?AUTO_6069 ?AUTO_6073 ) ) ( not ( = ?AUTO_6075 ?AUTO_6076 ) ) ( not ( = ?AUTO_6075 ?AUTO_6073 ) ) ( not ( = ?AUTO_6076 ?AUTO_6073 ) ) ( ON ?AUTO_6076 ?AUTO_6069 ) ( CLEAR ?AUTO_6071 ) ( not ( = ?AUTO_6068 ?AUTO_6072 ) ) ( not ( = ?AUTO_6068 ?AUTO_6071 ) ) ( not ( = ?AUTO_6069 ?AUTO_6072 ) ) ( not ( = ?AUTO_6069 ?AUTO_6071 ) ) ( not ( = ?AUTO_6075 ?AUTO_6072 ) ) ( not ( = ?AUTO_6075 ?AUTO_6071 ) ) ( not ( = ?AUTO_6073 ?AUTO_6072 ) ) ( not ( = ?AUTO_6073 ?AUTO_6071 ) ) ( not ( = ?AUTO_6076 ?AUTO_6072 ) ) ( not ( = ?AUTO_6076 ?AUTO_6071 ) ) ( not ( = ?AUTO_6072 ?AUTO_6071 ) ) ( ON ?AUTO_6072 ?AUTO_6076 ) ( CLEAR ?AUTO_6072 ) ( not ( = ?AUTO_6068 ?AUTO_6074 ) ) ( not ( = ?AUTO_6069 ?AUTO_6074 ) ) ( not ( = ?AUTO_6075 ?AUTO_6074 ) ) ( not ( = ?AUTO_6073 ?AUTO_6074 ) ) ( not ( = ?AUTO_6076 ?AUTO_6074 ) ) ( not ( = ?AUTO_6071 ?AUTO_6074 ) ) ( not ( = ?AUTO_6072 ?AUTO_6074 ) ) ( ON ?AUTO_6074 ?AUTO_6075 ) ( not ( = ?AUTO_6068 ?AUTO_6070 ) ) ( not ( = ?AUTO_6069 ?AUTO_6070 ) ) ( not ( = ?AUTO_6075 ?AUTO_6070 ) ) ( not ( = ?AUTO_6073 ?AUTO_6070 ) ) ( not ( = ?AUTO_6076 ?AUTO_6070 ) ) ( not ( = ?AUTO_6071 ?AUTO_6070 ) ) ( not ( = ?AUTO_6072 ?AUTO_6070 ) ) ( not ( = ?AUTO_6074 ?AUTO_6070 ) ) ( ON ?AUTO_6070 ?AUTO_6074 ) ( CLEAR ?AUTO_6070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6070 ?AUTO_6074 )
      ( MAKE-ON ?AUTO_6068 ?AUTO_6069 )
      ( MAKE-ON-VERIFY ?AUTO_6068 ?AUTO_6069 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6077 - BLOCK
      ?AUTO_6078 - BLOCK
    )
    :vars
    (
      ?AUTO_6083 - BLOCK
      ?AUTO_6082 - BLOCK
      ?AUTO_6085 - BLOCK
      ?AUTO_6081 - BLOCK
      ?AUTO_6079 - BLOCK
      ?AUTO_6084 - BLOCK
      ?AUTO_6080 - BLOCK
      ?AUTO_6086 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6077 ?AUTO_6078 ) ) ( ON-TABLE ?AUTO_6077 ) ( not ( = ?AUTO_6077 ?AUTO_6083 ) ) ( not ( = ?AUTO_6078 ?AUTO_6083 ) ) ( ON ?AUTO_6083 ?AUTO_6077 ) ( not ( = ?AUTO_6077 ?AUTO_6082 ) ) ( not ( = ?AUTO_6077 ?AUTO_6085 ) ) ( not ( = ?AUTO_6078 ?AUTO_6082 ) ) ( not ( = ?AUTO_6078 ?AUTO_6085 ) ) ( not ( = ?AUTO_6083 ?AUTO_6082 ) ) ( not ( = ?AUTO_6083 ?AUTO_6085 ) ) ( not ( = ?AUTO_6082 ?AUTO_6085 ) ) ( ON ?AUTO_6082 ?AUTO_6078 ) ( CLEAR ?AUTO_6081 ) ( not ( = ?AUTO_6077 ?AUTO_6079 ) ) ( not ( = ?AUTO_6077 ?AUTO_6081 ) ) ( not ( = ?AUTO_6078 ?AUTO_6079 ) ) ( not ( = ?AUTO_6078 ?AUTO_6081 ) ) ( not ( = ?AUTO_6083 ?AUTO_6079 ) ) ( not ( = ?AUTO_6083 ?AUTO_6081 ) ) ( not ( = ?AUTO_6085 ?AUTO_6079 ) ) ( not ( = ?AUTO_6085 ?AUTO_6081 ) ) ( not ( = ?AUTO_6082 ?AUTO_6079 ) ) ( not ( = ?AUTO_6082 ?AUTO_6081 ) ) ( not ( = ?AUTO_6079 ?AUTO_6081 ) ) ( ON ?AUTO_6079 ?AUTO_6082 ) ( CLEAR ?AUTO_6079 ) ( not ( = ?AUTO_6077 ?AUTO_6084 ) ) ( not ( = ?AUTO_6078 ?AUTO_6084 ) ) ( not ( = ?AUTO_6083 ?AUTO_6084 ) ) ( not ( = ?AUTO_6085 ?AUTO_6084 ) ) ( not ( = ?AUTO_6082 ?AUTO_6084 ) ) ( not ( = ?AUTO_6081 ?AUTO_6084 ) ) ( not ( = ?AUTO_6079 ?AUTO_6084 ) ) ( ON ?AUTO_6084 ?AUTO_6083 ) ( not ( = ?AUTO_6077 ?AUTO_6080 ) ) ( not ( = ?AUTO_6078 ?AUTO_6080 ) ) ( not ( = ?AUTO_6083 ?AUTO_6080 ) ) ( not ( = ?AUTO_6085 ?AUTO_6080 ) ) ( not ( = ?AUTO_6082 ?AUTO_6080 ) ) ( not ( = ?AUTO_6081 ?AUTO_6080 ) ) ( not ( = ?AUTO_6079 ?AUTO_6080 ) ) ( not ( = ?AUTO_6084 ?AUTO_6080 ) ) ( ON ?AUTO_6080 ?AUTO_6084 ) ( CLEAR ?AUTO_6080 ) ( HOLDING ?AUTO_6085 ) ( CLEAR ?AUTO_6086 ) ( not ( = ?AUTO_6077 ?AUTO_6086 ) ) ( not ( = ?AUTO_6078 ?AUTO_6086 ) ) ( not ( = ?AUTO_6083 ?AUTO_6086 ) ) ( not ( = ?AUTO_6082 ?AUTO_6086 ) ) ( not ( = ?AUTO_6085 ?AUTO_6086 ) ) ( not ( = ?AUTO_6081 ?AUTO_6086 ) ) ( not ( = ?AUTO_6079 ?AUTO_6086 ) ) ( not ( = ?AUTO_6084 ?AUTO_6086 ) ) ( not ( = ?AUTO_6080 ?AUTO_6086 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6085 ?AUTO_6086 )
      ( MAKE-ON ?AUTO_6077 ?AUTO_6078 )
      ( MAKE-ON-VERIFY ?AUTO_6077 ?AUTO_6078 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6089 - BLOCK
      ?AUTO_6090 - BLOCK
    )
    :vars
    (
      ?AUTO_6094 - BLOCK
      ?AUTO_6091 - BLOCK
      ?AUTO_6093 - BLOCK
      ?AUTO_6096 - BLOCK
      ?AUTO_6092 - BLOCK
      ?AUTO_6095 - BLOCK
      ?AUTO_6097 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6089 ?AUTO_6090 ) ) ( ON-TABLE ?AUTO_6089 ) ( not ( = ?AUTO_6089 ?AUTO_6094 ) ) ( not ( = ?AUTO_6090 ?AUTO_6094 ) ) ( ON ?AUTO_6094 ?AUTO_6089 ) ( CLEAR ?AUTO_6091 ) ( not ( = ?AUTO_6089 ?AUTO_6093 ) ) ( not ( = ?AUTO_6089 ?AUTO_6091 ) ) ( not ( = ?AUTO_6090 ?AUTO_6093 ) ) ( not ( = ?AUTO_6090 ?AUTO_6091 ) ) ( not ( = ?AUTO_6094 ?AUTO_6093 ) ) ( not ( = ?AUTO_6094 ?AUTO_6091 ) ) ( not ( = ?AUTO_6093 ?AUTO_6091 ) ) ( ON ?AUTO_6093 ?AUTO_6090 ) ( CLEAR ?AUTO_6096 ) ( not ( = ?AUTO_6089 ?AUTO_6092 ) ) ( not ( = ?AUTO_6089 ?AUTO_6096 ) ) ( not ( = ?AUTO_6090 ?AUTO_6092 ) ) ( not ( = ?AUTO_6090 ?AUTO_6096 ) ) ( not ( = ?AUTO_6094 ?AUTO_6092 ) ) ( not ( = ?AUTO_6094 ?AUTO_6096 ) ) ( not ( = ?AUTO_6091 ?AUTO_6092 ) ) ( not ( = ?AUTO_6091 ?AUTO_6096 ) ) ( not ( = ?AUTO_6093 ?AUTO_6092 ) ) ( not ( = ?AUTO_6093 ?AUTO_6096 ) ) ( not ( = ?AUTO_6092 ?AUTO_6096 ) ) ( not ( = ?AUTO_6089 ?AUTO_6095 ) ) ( not ( = ?AUTO_6090 ?AUTO_6095 ) ) ( not ( = ?AUTO_6094 ?AUTO_6095 ) ) ( not ( = ?AUTO_6091 ?AUTO_6095 ) ) ( not ( = ?AUTO_6093 ?AUTO_6095 ) ) ( not ( = ?AUTO_6096 ?AUTO_6095 ) ) ( not ( = ?AUTO_6092 ?AUTO_6095 ) ) ( ON ?AUTO_6095 ?AUTO_6094 ) ( not ( = ?AUTO_6089 ?AUTO_6097 ) ) ( not ( = ?AUTO_6090 ?AUTO_6097 ) ) ( not ( = ?AUTO_6094 ?AUTO_6097 ) ) ( not ( = ?AUTO_6091 ?AUTO_6097 ) ) ( not ( = ?AUTO_6093 ?AUTO_6097 ) ) ( not ( = ?AUTO_6096 ?AUTO_6097 ) ) ( not ( = ?AUTO_6092 ?AUTO_6097 ) ) ( not ( = ?AUTO_6095 ?AUTO_6097 ) ) ( ON ?AUTO_6097 ?AUTO_6095 ) ( CLEAR ?AUTO_6097 ) ( HOLDING ?AUTO_6092 ) ( CLEAR ?AUTO_6093 ) )
    :subtasks
    ( ( !STACK ?AUTO_6092 ?AUTO_6093 )
      ( MAKE-ON ?AUTO_6089 ?AUTO_6090 )
      ( MAKE-ON-VERIFY ?AUTO_6089 ?AUTO_6090 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6098 - BLOCK
      ?AUTO_6099 - BLOCK
    )
    :vars
    (
      ?AUTO_6104 - BLOCK
      ?AUTO_6100 - BLOCK
      ?AUTO_6106 - BLOCK
      ?AUTO_6105 - BLOCK
      ?AUTO_6101 - BLOCK
      ?AUTO_6103 - BLOCK
      ?AUTO_6102 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6098 ?AUTO_6099 ) ) ( ON-TABLE ?AUTO_6098 ) ( not ( = ?AUTO_6098 ?AUTO_6104 ) ) ( not ( = ?AUTO_6099 ?AUTO_6104 ) ) ( ON ?AUTO_6104 ?AUTO_6098 ) ( CLEAR ?AUTO_6100 ) ( not ( = ?AUTO_6098 ?AUTO_6106 ) ) ( not ( = ?AUTO_6098 ?AUTO_6100 ) ) ( not ( = ?AUTO_6099 ?AUTO_6106 ) ) ( not ( = ?AUTO_6099 ?AUTO_6100 ) ) ( not ( = ?AUTO_6104 ?AUTO_6106 ) ) ( not ( = ?AUTO_6104 ?AUTO_6100 ) ) ( not ( = ?AUTO_6106 ?AUTO_6100 ) ) ( ON ?AUTO_6106 ?AUTO_6099 ) ( CLEAR ?AUTO_6105 ) ( not ( = ?AUTO_6098 ?AUTO_6101 ) ) ( not ( = ?AUTO_6098 ?AUTO_6105 ) ) ( not ( = ?AUTO_6099 ?AUTO_6101 ) ) ( not ( = ?AUTO_6099 ?AUTO_6105 ) ) ( not ( = ?AUTO_6104 ?AUTO_6101 ) ) ( not ( = ?AUTO_6104 ?AUTO_6105 ) ) ( not ( = ?AUTO_6100 ?AUTO_6101 ) ) ( not ( = ?AUTO_6100 ?AUTO_6105 ) ) ( not ( = ?AUTO_6106 ?AUTO_6101 ) ) ( not ( = ?AUTO_6106 ?AUTO_6105 ) ) ( not ( = ?AUTO_6101 ?AUTO_6105 ) ) ( not ( = ?AUTO_6098 ?AUTO_6103 ) ) ( not ( = ?AUTO_6099 ?AUTO_6103 ) ) ( not ( = ?AUTO_6104 ?AUTO_6103 ) ) ( not ( = ?AUTO_6100 ?AUTO_6103 ) ) ( not ( = ?AUTO_6106 ?AUTO_6103 ) ) ( not ( = ?AUTO_6105 ?AUTO_6103 ) ) ( not ( = ?AUTO_6101 ?AUTO_6103 ) ) ( ON ?AUTO_6103 ?AUTO_6104 ) ( not ( = ?AUTO_6098 ?AUTO_6102 ) ) ( not ( = ?AUTO_6099 ?AUTO_6102 ) ) ( not ( = ?AUTO_6104 ?AUTO_6102 ) ) ( not ( = ?AUTO_6100 ?AUTO_6102 ) ) ( not ( = ?AUTO_6106 ?AUTO_6102 ) ) ( not ( = ?AUTO_6105 ?AUTO_6102 ) ) ( not ( = ?AUTO_6101 ?AUTO_6102 ) ) ( not ( = ?AUTO_6103 ?AUTO_6102 ) ) ( ON ?AUTO_6102 ?AUTO_6103 ) ( CLEAR ?AUTO_6106 ) ( ON ?AUTO_6101 ?AUTO_6102 ) ( CLEAR ?AUTO_6101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6101 ?AUTO_6102 )
      ( MAKE-ON ?AUTO_6098 ?AUTO_6099 )
      ( MAKE-ON-VERIFY ?AUTO_6098 ?AUTO_6099 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6107 - BLOCK
      ?AUTO_6108 - BLOCK
    )
    :vars
    (
      ?AUTO_6109 - BLOCK
      ?AUTO_6115 - BLOCK
      ?AUTO_6113 - BLOCK
      ?AUTO_6114 - BLOCK
      ?AUTO_6112 - BLOCK
      ?AUTO_6110 - BLOCK
      ?AUTO_6111 - BLOCK
      ?AUTO_6116 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6107 ?AUTO_6108 ) ) ( ON-TABLE ?AUTO_6107 ) ( not ( = ?AUTO_6107 ?AUTO_6109 ) ) ( not ( = ?AUTO_6108 ?AUTO_6109 ) ) ( ON ?AUTO_6109 ?AUTO_6107 ) ( CLEAR ?AUTO_6115 ) ( not ( = ?AUTO_6107 ?AUTO_6113 ) ) ( not ( = ?AUTO_6107 ?AUTO_6115 ) ) ( not ( = ?AUTO_6108 ?AUTO_6113 ) ) ( not ( = ?AUTO_6108 ?AUTO_6115 ) ) ( not ( = ?AUTO_6109 ?AUTO_6113 ) ) ( not ( = ?AUTO_6109 ?AUTO_6115 ) ) ( not ( = ?AUTO_6113 ?AUTO_6115 ) ) ( ON ?AUTO_6113 ?AUTO_6108 ) ( CLEAR ?AUTO_6114 ) ( not ( = ?AUTO_6107 ?AUTO_6112 ) ) ( not ( = ?AUTO_6107 ?AUTO_6114 ) ) ( not ( = ?AUTO_6108 ?AUTO_6112 ) ) ( not ( = ?AUTO_6108 ?AUTO_6114 ) ) ( not ( = ?AUTO_6109 ?AUTO_6112 ) ) ( not ( = ?AUTO_6109 ?AUTO_6114 ) ) ( not ( = ?AUTO_6115 ?AUTO_6112 ) ) ( not ( = ?AUTO_6115 ?AUTO_6114 ) ) ( not ( = ?AUTO_6113 ?AUTO_6112 ) ) ( not ( = ?AUTO_6113 ?AUTO_6114 ) ) ( not ( = ?AUTO_6112 ?AUTO_6114 ) ) ( not ( = ?AUTO_6107 ?AUTO_6110 ) ) ( not ( = ?AUTO_6108 ?AUTO_6110 ) ) ( not ( = ?AUTO_6109 ?AUTO_6110 ) ) ( not ( = ?AUTO_6115 ?AUTO_6110 ) ) ( not ( = ?AUTO_6113 ?AUTO_6110 ) ) ( not ( = ?AUTO_6114 ?AUTO_6110 ) ) ( not ( = ?AUTO_6112 ?AUTO_6110 ) ) ( ON ?AUTO_6110 ?AUTO_6109 ) ( not ( = ?AUTO_6107 ?AUTO_6111 ) ) ( not ( = ?AUTO_6108 ?AUTO_6111 ) ) ( not ( = ?AUTO_6109 ?AUTO_6111 ) ) ( not ( = ?AUTO_6115 ?AUTO_6111 ) ) ( not ( = ?AUTO_6113 ?AUTO_6111 ) ) ( not ( = ?AUTO_6114 ?AUTO_6111 ) ) ( not ( = ?AUTO_6112 ?AUTO_6111 ) ) ( not ( = ?AUTO_6110 ?AUTO_6111 ) ) ( ON ?AUTO_6111 ?AUTO_6110 ) ( CLEAR ?AUTO_6113 ) ( ON ?AUTO_6112 ?AUTO_6111 ) ( CLEAR ?AUTO_6112 ) ( HOLDING ?AUTO_6116 ) ( not ( = ?AUTO_6107 ?AUTO_6116 ) ) ( not ( = ?AUTO_6108 ?AUTO_6116 ) ) ( not ( = ?AUTO_6109 ?AUTO_6116 ) ) ( not ( = ?AUTO_6115 ?AUTO_6116 ) ) ( not ( = ?AUTO_6113 ?AUTO_6116 ) ) ( not ( = ?AUTO_6114 ?AUTO_6116 ) ) ( not ( = ?AUTO_6112 ?AUTO_6116 ) ) ( not ( = ?AUTO_6110 ?AUTO_6116 ) ) ( not ( = ?AUTO_6111 ?AUTO_6116 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6116 )
      ( MAKE-ON ?AUTO_6107 ?AUTO_6108 )
      ( MAKE-ON-VERIFY ?AUTO_6107 ?AUTO_6108 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6117 - BLOCK
      ?AUTO_6118 - BLOCK
    )
    :vars
    (
      ?AUTO_6122 - BLOCK
      ?AUTO_6120 - BLOCK
      ?AUTO_6124 - BLOCK
      ?AUTO_6121 - BLOCK
      ?AUTO_6125 - BLOCK
      ?AUTO_6123 - BLOCK
      ?AUTO_6119 - BLOCK
      ?AUTO_6126 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6117 ?AUTO_6118 ) ) ( ON-TABLE ?AUTO_6117 ) ( not ( = ?AUTO_6117 ?AUTO_6122 ) ) ( not ( = ?AUTO_6118 ?AUTO_6122 ) ) ( ON ?AUTO_6122 ?AUTO_6117 ) ( CLEAR ?AUTO_6120 ) ( not ( = ?AUTO_6117 ?AUTO_6124 ) ) ( not ( = ?AUTO_6117 ?AUTO_6120 ) ) ( not ( = ?AUTO_6118 ?AUTO_6124 ) ) ( not ( = ?AUTO_6118 ?AUTO_6120 ) ) ( not ( = ?AUTO_6122 ?AUTO_6124 ) ) ( not ( = ?AUTO_6122 ?AUTO_6120 ) ) ( not ( = ?AUTO_6124 ?AUTO_6120 ) ) ( ON ?AUTO_6124 ?AUTO_6118 ) ( CLEAR ?AUTO_6121 ) ( not ( = ?AUTO_6117 ?AUTO_6125 ) ) ( not ( = ?AUTO_6117 ?AUTO_6121 ) ) ( not ( = ?AUTO_6118 ?AUTO_6125 ) ) ( not ( = ?AUTO_6118 ?AUTO_6121 ) ) ( not ( = ?AUTO_6122 ?AUTO_6125 ) ) ( not ( = ?AUTO_6122 ?AUTO_6121 ) ) ( not ( = ?AUTO_6120 ?AUTO_6125 ) ) ( not ( = ?AUTO_6120 ?AUTO_6121 ) ) ( not ( = ?AUTO_6124 ?AUTO_6125 ) ) ( not ( = ?AUTO_6124 ?AUTO_6121 ) ) ( not ( = ?AUTO_6125 ?AUTO_6121 ) ) ( not ( = ?AUTO_6117 ?AUTO_6123 ) ) ( not ( = ?AUTO_6118 ?AUTO_6123 ) ) ( not ( = ?AUTO_6122 ?AUTO_6123 ) ) ( not ( = ?AUTO_6120 ?AUTO_6123 ) ) ( not ( = ?AUTO_6124 ?AUTO_6123 ) ) ( not ( = ?AUTO_6121 ?AUTO_6123 ) ) ( not ( = ?AUTO_6125 ?AUTO_6123 ) ) ( ON ?AUTO_6123 ?AUTO_6122 ) ( not ( = ?AUTO_6117 ?AUTO_6119 ) ) ( not ( = ?AUTO_6118 ?AUTO_6119 ) ) ( not ( = ?AUTO_6122 ?AUTO_6119 ) ) ( not ( = ?AUTO_6120 ?AUTO_6119 ) ) ( not ( = ?AUTO_6124 ?AUTO_6119 ) ) ( not ( = ?AUTO_6121 ?AUTO_6119 ) ) ( not ( = ?AUTO_6125 ?AUTO_6119 ) ) ( not ( = ?AUTO_6123 ?AUTO_6119 ) ) ( ON ?AUTO_6119 ?AUTO_6123 ) ( ON ?AUTO_6125 ?AUTO_6119 ) ( CLEAR ?AUTO_6125 ) ( not ( = ?AUTO_6117 ?AUTO_6126 ) ) ( not ( = ?AUTO_6118 ?AUTO_6126 ) ) ( not ( = ?AUTO_6122 ?AUTO_6126 ) ) ( not ( = ?AUTO_6120 ?AUTO_6126 ) ) ( not ( = ?AUTO_6124 ?AUTO_6126 ) ) ( not ( = ?AUTO_6121 ?AUTO_6126 ) ) ( not ( = ?AUTO_6125 ?AUTO_6126 ) ) ( not ( = ?AUTO_6123 ?AUTO_6126 ) ) ( not ( = ?AUTO_6119 ?AUTO_6126 ) ) ( ON ?AUTO_6126 ?AUTO_6124 ) ( CLEAR ?AUTO_6126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6126 ?AUTO_6124 )
      ( MAKE-ON ?AUTO_6117 ?AUTO_6118 )
      ( MAKE-ON-VERIFY ?AUTO_6117 ?AUTO_6118 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6127 - BLOCK
      ?AUTO_6128 - BLOCK
    )
    :vars
    (
      ?AUTO_6135 - BLOCK
      ?AUTO_6129 - BLOCK
      ?AUTO_6133 - BLOCK
      ?AUTO_6132 - BLOCK
      ?AUTO_6136 - BLOCK
      ?AUTO_6134 - BLOCK
      ?AUTO_6130 - BLOCK
      ?AUTO_6131 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6127 ?AUTO_6128 ) ) ( ON-TABLE ?AUTO_6127 ) ( not ( = ?AUTO_6127 ?AUTO_6135 ) ) ( not ( = ?AUTO_6128 ?AUTO_6135 ) ) ( ON ?AUTO_6135 ?AUTO_6127 ) ( CLEAR ?AUTO_6129 ) ( not ( = ?AUTO_6127 ?AUTO_6133 ) ) ( not ( = ?AUTO_6127 ?AUTO_6129 ) ) ( not ( = ?AUTO_6128 ?AUTO_6133 ) ) ( not ( = ?AUTO_6128 ?AUTO_6129 ) ) ( not ( = ?AUTO_6135 ?AUTO_6133 ) ) ( not ( = ?AUTO_6135 ?AUTO_6129 ) ) ( not ( = ?AUTO_6133 ?AUTO_6129 ) ) ( ON ?AUTO_6133 ?AUTO_6128 ) ( not ( = ?AUTO_6127 ?AUTO_6132 ) ) ( not ( = ?AUTO_6127 ?AUTO_6136 ) ) ( not ( = ?AUTO_6128 ?AUTO_6132 ) ) ( not ( = ?AUTO_6128 ?AUTO_6136 ) ) ( not ( = ?AUTO_6135 ?AUTO_6132 ) ) ( not ( = ?AUTO_6135 ?AUTO_6136 ) ) ( not ( = ?AUTO_6129 ?AUTO_6132 ) ) ( not ( = ?AUTO_6129 ?AUTO_6136 ) ) ( not ( = ?AUTO_6133 ?AUTO_6132 ) ) ( not ( = ?AUTO_6133 ?AUTO_6136 ) ) ( not ( = ?AUTO_6132 ?AUTO_6136 ) ) ( not ( = ?AUTO_6127 ?AUTO_6134 ) ) ( not ( = ?AUTO_6128 ?AUTO_6134 ) ) ( not ( = ?AUTO_6135 ?AUTO_6134 ) ) ( not ( = ?AUTO_6129 ?AUTO_6134 ) ) ( not ( = ?AUTO_6133 ?AUTO_6134 ) ) ( not ( = ?AUTO_6136 ?AUTO_6134 ) ) ( not ( = ?AUTO_6132 ?AUTO_6134 ) ) ( ON ?AUTO_6134 ?AUTO_6135 ) ( not ( = ?AUTO_6127 ?AUTO_6130 ) ) ( not ( = ?AUTO_6128 ?AUTO_6130 ) ) ( not ( = ?AUTO_6135 ?AUTO_6130 ) ) ( not ( = ?AUTO_6129 ?AUTO_6130 ) ) ( not ( = ?AUTO_6133 ?AUTO_6130 ) ) ( not ( = ?AUTO_6136 ?AUTO_6130 ) ) ( not ( = ?AUTO_6132 ?AUTO_6130 ) ) ( not ( = ?AUTO_6134 ?AUTO_6130 ) ) ( ON ?AUTO_6130 ?AUTO_6134 ) ( ON ?AUTO_6132 ?AUTO_6130 ) ( CLEAR ?AUTO_6132 ) ( not ( = ?AUTO_6127 ?AUTO_6131 ) ) ( not ( = ?AUTO_6128 ?AUTO_6131 ) ) ( not ( = ?AUTO_6135 ?AUTO_6131 ) ) ( not ( = ?AUTO_6129 ?AUTO_6131 ) ) ( not ( = ?AUTO_6133 ?AUTO_6131 ) ) ( not ( = ?AUTO_6136 ?AUTO_6131 ) ) ( not ( = ?AUTO_6132 ?AUTO_6131 ) ) ( not ( = ?AUTO_6134 ?AUTO_6131 ) ) ( not ( = ?AUTO_6130 ?AUTO_6131 ) ) ( ON ?AUTO_6131 ?AUTO_6133 ) ( CLEAR ?AUTO_6131 ) ( HOLDING ?AUTO_6136 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6136 )
      ( MAKE-ON ?AUTO_6127 ?AUTO_6128 )
      ( MAKE-ON-VERIFY ?AUTO_6127 ?AUTO_6128 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6137 - BLOCK
      ?AUTO_6138 - BLOCK
    )
    :vars
    (
      ?AUTO_6145 - BLOCK
      ?AUTO_6144 - BLOCK
      ?AUTO_6141 - BLOCK
      ?AUTO_6139 - BLOCK
      ?AUTO_6140 - BLOCK
      ?AUTO_6142 - BLOCK
      ?AUTO_6146 - BLOCK
      ?AUTO_6143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6137 ?AUTO_6138 ) ) ( ON-TABLE ?AUTO_6137 ) ( not ( = ?AUTO_6137 ?AUTO_6145 ) ) ( not ( = ?AUTO_6138 ?AUTO_6145 ) ) ( ON ?AUTO_6145 ?AUTO_6137 ) ( CLEAR ?AUTO_6144 ) ( not ( = ?AUTO_6137 ?AUTO_6141 ) ) ( not ( = ?AUTO_6137 ?AUTO_6144 ) ) ( not ( = ?AUTO_6138 ?AUTO_6141 ) ) ( not ( = ?AUTO_6138 ?AUTO_6144 ) ) ( not ( = ?AUTO_6145 ?AUTO_6141 ) ) ( not ( = ?AUTO_6145 ?AUTO_6144 ) ) ( not ( = ?AUTO_6141 ?AUTO_6144 ) ) ( ON ?AUTO_6141 ?AUTO_6138 ) ( not ( = ?AUTO_6137 ?AUTO_6139 ) ) ( not ( = ?AUTO_6137 ?AUTO_6140 ) ) ( not ( = ?AUTO_6138 ?AUTO_6139 ) ) ( not ( = ?AUTO_6138 ?AUTO_6140 ) ) ( not ( = ?AUTO_6145 ?AUTO_6139 ) ) ( not ( = ?AUTO_6145 ?AUTO_6140 ) ) ( not ( = ?AUTO_6144 ?AUTO_6139 ) ) ( not ( = ?AUTO_6144 ?AUTO_6140 ) ) ( not ( = ?AUTO_6141 ?AUTO_6139 ) ) ( not ( = ?AUTO_6141 ?AUTO_6140 ) ) ( not ( = ?AUTO_6139 ?AUTO_6140 ) ) ( not ( = ?AUTO_6137 ?AUTO_6142 ) ) ( not ( = ?AUTO_6138 ?AUTO_6142 ) ) ( not ( = ?AUTO_6145 ?AUTO_6142 ) ) ( not ( = ?AUTO_6144 ?AUTO_6142 ) ) ( not ( = ?AUTO_6141 ?AUTO_6142 ) ) ( not ( = ?AUTO_6140 ?AUTO_6142 ) ) ( not ( = ?AUTO_6139 ?AUTO_6142 ) ) ( ON ?AUTO_6142 ?AUTO_6145 ) ( not ( = ?AUTO_6137 ?AUTO_6146 ) ) ( not ( = ?AUTO_6138 ?AUTO_6146 ) ) ( not ( = ?AUTO_6145 ?AUTO_6146 ) ) ( not ( = ?AUTO_6144 ?AUTO_6146 ) ) ( not ( = ?AUTO_6141 ?AUTO_6146 ) ) ( not ( = ?AUTO_6140 ?AUTO_6146 ) ) ( not ( = ?AUTO_6139 ?AUTO_6146 ) ) ( not ( = ?AUTO_6142 ?AUTO_6146 ) ) ( ON ?AUTO_6146 ?AUTO_6142 ) ( ON ?AUTO_6139 ?AUTO_6146 ) ( CLEAR ?AUTO_6139 ) ( not ( = ?AUTO_6137 ?AUTO_6143 ) ) ( not ( = ?AUTO_6138 ?AUTO_6143 ) ) ( not ( = ?AUTO_6145 ?AUTO_6143 ) ) ( not ( = ?AUTO_6144 ?AUTO_6143 ) ) ( not ( = ?AUTO_6141 ?AUTO_6143 ) ) ( not ( = ?AUTO_6140 ?AUTO_6143 ) ) ( not ( = ?AUTO_6139 ?AUTO_6143 ) ) ( not ( = ?AUTO_6142 ?AUTO_6143 ) ) ( not ( = ?AUTO_6146 ?AUTO_6143 ) ) ( ON ?AUTO_6143 ?AUTO_6141 ) ( ON ?AUTO_6140 ?AUTO_6143 ) ( CLEAR ?AUTO_6140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6140 ?AUTO_6143 )
      ( MAKE-ON ?AUTO_6137 ?AUTO_6138 )
      ( MAKE-ON-VERIFY ?AUTO_6137 ?AUTO_6138 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6147 - BLOCK
      ?AUTO_6148 - BLOCK
    )
    :vars
    (
      ?AUTO_6156 - BLOCK
      ?AUTO_6150 - BLOCK
      ?AUTO_6152 - BLOCK
      ?AUTO_6154 - BLOCK
      ?AUTO_6151 - BLOCK
      ?AUTO_6149 - BLOCK
      ?AUTO_6155 - BLOCK
      ?AUTO_6153 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6147 ?AUTO_6148 ) ) ( ON-TABLE ?AUTO_6147 ) ( not ( = ?AUTO_6147 ?AUTO_6156 ) ) ( not ( = ?AUTO_6148 ?AUTO_6156 ) ) ( ON ?AUTO_6156 ?AUTO_6147 ) ( not ( = ?AUTO_6147 ?AUTO_6150 ) ) ( not ( = ?AUTO_6147 ?AUTO_6152 ) ) ( not ( = ?AUTO_6148 ?AUTO_6150 ) ) ( not ( = ?AUTO_6148 ?AUTO_6152 ) ) ( not ( = ?AUTO_6156 ?AUTO_6150 ) ) ( not ( = ?AUTO_6156 ?AUTO_6152 ) ) ( not ( = ?AUTO_6150 ?AUTO_6152 ) ) ( ON ?AUTO_6150 ?AUTO_6148 ) ( not ( = ?AUTO_6147 ?AUTO_6154 ) ) ( not ( = ?AUTO_6147 ?AUTO_6151 ) ) ( not ( = ?AUTO_6148 ?AUTO_6154 ) ) ( not ( = ?AUTO_6148 ?AUTO_6151 ) ) ( not ( = ?AUTO_6156 ?AUTO_6154 ) ) ( not ( = ?AUTO_6156 ?AUTO_6151 ) ) ( not ( = ?AUTO_6152 ?AUTO_6154 ) ) ( not ( = ?AUTO_6152 ?AUTO_6151 ) ) ( not ( = ?AUTO_6150 ?AUTO_6154 ) ) ( not ( = ?AUTO_6150 ?AUTO_6151 ) ) ( not ( = ?AUTO_6154 ?AUTO_6151 ) ) ( not ( = ?AUTO_6147 ?AUTO_6149 ) ) ( not ( = ?AUTO_6148 ?AUTO_6149 ) ) ( not ( = ?AUTO_6156 ?AUTO_6149 ) ) ( not ( = ?AUTO_6152 ?AUTO_6149 ) ) ( not ( = ?AUTO_6150 ?AUTO_6149 ) ) ( not ( = ?AUTO_6151 ?AUTO_6149 ) ) ( not ( = ?AUTO_6154 ?AUTO_6149 ) ) ( ON ?AUTO_6149 ?AUTO_6156 ) ( not ( = ?AUTO_6147 ?AUTO_6155 ) ) ( not ( = ?AUTO_6148 ?AUTO_6155 ) ) ( not ( = ?AUTO_6156 ?AUTO_6155 ) ) ( not ( = ?AUTO_6152 ?AUTO_6155 ) ) ( not ( = ?AUTO_6150 ?AUTO_6155 ) ) ( not ( = ?AUTO_6151 ?AUTO_6155 ) ) ( not ( = ?AUTO_6154 ?AUTO_6155 ) ) ( not ( = ?AUTO_6149 ?AUTO_6155 ) ) ( ON ?AUTO_6155 ?AUTO_6149 ) ( ON ?AUTO_6154 ?AUTO_6155 ) ( CLEAR ?AUTO_6154 ) ( not ( = ?AUTO_6147 ?AUTO_6153 ) ) ( not ( = ?AUTO_6148 ?AUTO_6153 ) ) ( not ( = ?AUTO_6156 ?AUTO_6153 ) ) ( not ( = ?AUTO_6152 ?AUTO_6153 ) ) ( not ( = ?AUTO_6150 ?AUTO_6153 ) ) ( not ( = ?AUTO_6151 ?AUTO_6153 ) ) ( not ( = ?AUTO_6154 ?AUTO_6153 ) ) ( not ( = ?AUTO_6149 ?AUTO_6153 ) ) ( not ( = ?AUTO_6155 ?AUTO_6153 ) ) ( ON ?AUTO_6153 ?AUTO_6150 ) ( ON ?AUTO_6151 ?AUTO_6153 ) ( CLEAR ?AUTO_6151 ) ( HOLDING ?AUTO_6152 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6152 )
      ( MAKE-ON ?AUTO_6147 ?AUTO_6148 )
      ( MAKE-ON-VERIFY ?AUTO_6147 ?AUTO_6148 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6157 - BLOCK
      ?AUTO_6158 - BLOCK
    )
    :vars
    (
      ?AUTO_6165 - BLOCK
      ?AUTO_6162 - BLOCK
      ?AUTO_6166 - BLOCK
      ?AUTO_6159 - BLOCK
      ?AUTO_6163 - BLOCK
      ?AUTO_6160 - BLOCK
      ?AUTO_6164 - BLOCK
      ?AUTO_6161 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6157 ?AUTO_6158 ) ) ( ON-TABLE ?AUTO_6157 ) ( not ( = ?AUTO_6157 ?AUTO_6165 ) ) ( not ( = ?AUTO_6158 ?AUTO_6165 ) ) ( ON ?AUTO_6165 ?AUTO_6157 ) ( not ( = ?AUTO_6157 ?AUTO_6162 ) ) ( not ( = ?AUTO_6157 ?AUTO_6166 ) ) ( not ( = ?AUTO_6158 ?AUTO_6162 ) ) ( not ( = ?AUTO_6158 ?AUTO_6166 ) ) ( not ( = ?AUTO_6165 ?AUTO_6162 ) ) ( not ( = ?AUTO_6165 ?AUTO_6166 ) ) ( not ( = ?AUTO_6162 ?AUTO_6166 ) ) ( ON ?AUTO_6162 ?AUTO_6158 ) ( not ( = ?AUTO_6157 ?AUTO_6159 ) ) ( not ( = ?AUTO_6157 ?AUTO_6163 ) ) ( not ( = ?AUTO_6158 ?AUTO_6159 ) ) ( not ( = ?AUTO_6158 ?AUTO_6163 ) ) ( not ( = ?AUTO_6165 ?AUTO_6159 ) ) ( not ( = ?AUTO_6165 ?AUTO_6163 ) ) ( not ( = ?AUTO_6166 ?AUTO_6159 ) ) ( not ( = ?AUTO_6166 ?AUTO_6163 ) ) ( not ( = ?AUTO_6162 ?AUTO_6159 ) ) ( not ( = ?AUTO_6162 ?AUTO_6163 ) ) ( not ( = ?AUTO_6159 ?AUTO_6163 ) ) ( not ( = ?AUTO_6157 ?AUTO_6160 ) ) ( not ( = ?AUTO_6158 ?AUTO_6160 ) ) ( not ( = ?AUTO_6165 ?AUTO_6160 ) ) ( not ( = ?AUTO_6166 ?AUTO_6160 ) ) ( not ( = ?AUTO_6162 ?AUTO_6160 ) ) ( not ( = ?AUTO_6163 ?AUTO_6160 ) ) ( not ( = ?AUTO_6159 ?AUTO_6160 ) ) ( ON ?AUTO_6160 ?AUTO_6165 ) ( not ( = ?AUTO_6157 ?AUTO_6164 ) ) ( not ( = ?AUTO_6158 ?AUTO_6164 ) ) ( not ( = ?AUTO_6165 ?AUTO_6164 ) ) ( not ( = ?AUTO_6166 ?AUTO_6164 ) ) ( not ( = ?AUTO_6162 ?AUTO_6164 ) ) ( not ( = ?AUTO_6163 ?AUTO_6164 ) ) ( not ( = ?AUTO_6159 ?AUTO_6164 ) ) ( not ( = ?AUTO_6160 ?AUTO_6164 ) ) ( ON ?AUTO_6164 ?AUTO_6160 ) ( ON ?AUTO_6159 ?AUTO_6164 ) ( CLEAR ?AUTO_6159 ) ( not ( = ?AUTO_6157 ?AUTO_6161 ) ) ( not ( = ?AUTO_6158 ?AUTO_6161 ) ) ( not ( = ?AUTO_6165 ?AUTO_6161 ) ) ( not ( = ?AUTO_6166 ?AUTO_6161 ) ) ( not ( = ?AUTO_6162 ?AUTO_6161 ) ) ( not ( = ?AUTO_6163 ?AUTO_6161 ) ) ( not ( = ?AUTO_6159 ?AUTO_6161 ) ) ( not ( = ?AUTO_6160 ?AUTO_6161 ) ) ( not ( = ?AUTO_6164 ?AUTO_6161 ) ) ( ON ?AUTO_6161 ?AUTO_6162 ) ( ON ?AUTO_6163 ?AUTO_6161 ) ( ON ?AUTO_6166 ?AUTO_6163 ) ( CLEAR ?AUTO_6166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6166 ?AUTO_6163 )
      ( MAKE-ON ?AUTO_6157 ?AUTO_6158 )
      ( MAKE-ON-VERIFY ?AUTO_6157 ?AUTO_6158 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6169 - BLOCK
      ?AUTO_6170 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6169 ) ( CLEAR ?AUTO_6170 ) ( not ( = ?AUTO_6169 ?AUTO_6170 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6169 ?AUTO_6170 )
      ( MAKE-ON-VERIFY ?AUTO_6169 ?AUTO_6170 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6171 - BLOCK
      ?AUTO_6172 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6172 ) ( not ( = ?AUTO_6171 ?AUTO_6172 ) ) ( ON-TABLE ?AUTO_6171 ) ( CLEAR ?AUTO_6171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6171 )
      ( MAKE-ON ?AUTO_6171 ?AUTO_6172 )
      ( MAKE-ON-VERIFY ?AUTO_6171 ?AUTO_6172 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6173 - BLOCK
      ?AUTO_6174 - BLOCK
    )
    :vars
    (
      ?AUTO_6175 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6173 ?AUTO_6174 ) ) ( ON-TABLE ?AUTO_6173 ) ( CLEAR ?AUTO_6173 ) ( HOLDING ?AUTO_6174 ) ( CLEAR ?AUTO_6175 ) ( not ( = ?AUTO_6173 ?AUTO_6175 ) ) ( not ( = ?AUTO_6174 ?AUTO_6175 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6174 ?AUTO_6175 )
      ( MAKE-ON ?AUTO_6173 ?AUTO_6174 )
      ( MAKE-ON-VERIFY ?AUTO_6173 ?AUTO_6174 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6177 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6177 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6177 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6177 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6178 - BLOCK
    )
    :vars
    (
      ?AUTO_6179 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6178 ?AUTO_6179 ) ( CLEAR ?AUTO_6178 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6178 ?AUTO_6179 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6178 ?AUTO_6179 )
      ( MAKE-ON-TABLE ?AUTO_6178 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6178 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6181 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6181 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6181 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6181 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6182 - BLOCK
    )
    :vars
    (
      ?AUTO_6183 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6182 ?AUTO_6183 ) ( CLEAR ?AUTO_6182 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6182 ?AUTO_6183 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6182 ?AUTO_6183 )
      ( MAKE-ON-TABLE ?AUTO_6182 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6182 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6184 - BLOCK
    )
    :vars
    (
      ?AUTO_6185 - BLOCK
      ?AUTO_6186 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6184 ?AUTO_6185 ) ( CLEAR ?AUTO_6184 ) ( not ( = ?AUTO_6184 ?AUTO_6185 ) ) ( HOLDING ?AUTO_6186 ) ( not ( = ?AUTO_6184 ?AUTO_6186 ) ) ( not ( = ?AUTO_6185 ?AUTO_6186 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6186 )
      ( MAKE-ON-TABLE ?AUTO_6184 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6184 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6187 - BLOCK
    )
    :vars
    (
      ?AUTO_6188 - BLOCK
      ?AUTO_6189 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6187 ?AUTO_6188 ) ( not ( = ?AUTO_6187 ?AUTO_6188 ) ) ( not ( = ?AUTO_6187 ?AUTO_6189 ) ) ( not ( = ?AUTO_6188 ?AUTO_6189 ) ) ( ON ?AUTO_6189 ?AUTO_6187 ) ( CLEAR ?AUTO_6189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6189 ?AUTO_6187 )
      ( MAKE-ON-TABLE ?AUTO_6187 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6187 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6191 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6191 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6191 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6191 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6192 - BLOCK
    )
    :vars
    (
      ?AUTO_6193 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6192 ?AUTO_6193 ) ( CLEAR ?AUTO_6192 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6192 ?AUTO_6193 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6192 ?AUTO_6193 )
      ( MAKE-ON-TABLE ?AUTO_6192 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6192 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6194 - BLOCK
    )
    :vars
    (
      ?AUTO_6195 - BLOCK
      ?AUTO_6196 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6194 ?AUTO_6195 ) ( CLEAR ?AUTO_6194 ) ( not ( = ?AUTO_6194 ?AUTO_6195 ) ) ( HOLDING ?AUTO_6196 ) ( not ( = ?AUTO_6194 ?AUTO_6196 ) ) ( not ( = ?AUTO_6195 ?AUTO_6196 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6196 )
      ( MAKE-ON-TABLE ?AUTO_6194 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6194 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6197 - BLOCK
    )
    :vars
    (
      ?AUTO_6198 - BLOCK
      ?AUTO_6199 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6197 ?AUTO_6198 ) ( not ( = ?AUTO_6197 ?AUTO_6198 ) ) ( not ( = ?AUTO_6197 ?AUTO_6199 ) ) ( not ( = ?AUTO_6198 ?AUTO_6199 ) ) ( ON ?AUTO_6199 ?AUTO_6197 ) ( CLEAR ?AUTO_6199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6199 ?AUTO_6197 )
      ( MAKE-ON-TABLE ?AUTO_6197 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6197 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6200 - BLOCK
    )
    :vars
    (
      ?AUTO_6202 - BLOCK
      ?AUTO_6201 - BLOCK
      ?AUTO_6203 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6200 ?AUTO_6202 ) ( not ( = ?AUTO_6200 ?AUTO_6202 ) ) ( not ( = ?AUTO_6200 ?AUTO_6201 ) ) ( not ( = ?AUTO_6202 ?AUTO_6201 ) ) ( ON ?AUTO_6201 ?AUTO_6200 ) ( CLEAR ?AUTO_6201 ) ( HOLDING ?AUTO_6203 ) ( not ( = ?AUTO_6200 ?AUTO_6203 ) ) ( not ( = ?AUTO_6202 ?AUTO_6203 ) ) ( not ( = ?AUTO_6201 ?AUTO_6203 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6203 )
      ( MAKE-ON-TABLE ?AUTO_6200 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6200 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6204 - BLOCK
    )
    :vars
    (
      ?AUTO_6206 - BLOCK
      ?AUTO_6205 - BLOCK
      ?AUTO_6207 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6204 ?AUTO_6206 ) ( not ( = ?AUTO_6204 ?AUTO_6206 ) ) ( not ( = ?AUTO_6204 ?AUTO_6205 ) ) ( not ( = ?AUTO_6206 ?AUTO_6205 ) ) ( ON ?AUTO_6205 ?AUTO_6204 ) ( not ( = ?AUTO_6204 ?AUTO_6207 ) ) ( not ( = ?AUTO_6206 ?AUTO_6207 ) ) ( not ( = ?AUTO_6205 ?AUTO_6207 ) ) ( ON ?AUTO_6207 ?AUTO_6205 ) ( CLEAR ?AUTO_6207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6207 ?AUTO_6205 )
      ( MAKE-ON-TABLE ?AUTO_6204 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6204 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6210 - BLOCK
      ?AUTO_6211 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6210 ) ( CLEAR ?AUTO_6211 ) ( not ( = ?AUTO_6210 ?AUTO_6211 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6210 ?AUTO_6211 )
      ( MAKE-ON-VERIFY ?AUTO_6210 ?AUTO_6211 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6212 - BLOCK
      ?AUTO_6213 - BLOCK
    )
    :vars
    (
      ?AUTO_6214 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6213 ) ( not ( = ?AUTO_6212 ?AUTO_6213 ) ) ( ON ?AUTO_6212 ?AUTO_6214 ) ( CLEAR ?AUTO_6212 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6212 ?AUTO_6214 ) ) ( not ( = ?AUTO_6213 ?AUTO_6214 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6212 ?AUTO_6214 )
      ( MAKE-ON ?AUTO_6212 ?AUTO_6213 )
      ( MAKE-ON-VERIFY ?AUTO_6212 ?AUTO_6213 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6215 - BLOCK
      ?AUTO_6216 - BLOCK
    )
    :vars
    (
      ?AUTO_6217 - BLOCK
      ?AUTO_6218 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6216 ) ( not ( = ?AUTO_6215 ?AUTO_6216 ) ) ( ON ?AUTO_6215 ?AUTO_6217 ) ( CLEAR ?AUTO_6215 ) ( not ( = ?AUTO_6215 ?AUTO_6217 ) ) ( not ( = ?AUTO_6216 ?AUTO_6217 ) ) ( HOLDING ?AUTO_6218 ) ( not ( = ?AUTO_6215 ?AUTO_6218 ) ) ( not ( = ?AUTO_6216 ?AUTO_6218 ) ) ( not ( = ?AUTO_6217 ?AUTO_6218 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6218 )
      ( MAKE-ON ?AUTO_6215 ?AUTO_6216 )
      ( MAKE-ON-VERIFY ?AUTO_6215 ?AUTO_6216 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6219 - BLOCK
      ?AUTO_6220 - BLOCK
    )
    :vars
    (
      ?AUTO_6221 - BLOCK
      ?AUTO_6222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6219 ?AUTO_6220 ) ) ( ON ?AUTO_6219 ?AUTO_6221 ) ( CLEAR ?AUTO_6219 ) ( not ( = ?AUTO_6219 ?AUTO_6221 ) ) ( not ( = ?AUTO_6220 ?AUTO_6221 ) ) ( not ( = ?AUTO_6219 ?AUTO_6222 ) ) ( not ( = ?AUTO_6220 ?AUTO_6222 ) ) ( not ( = ?AUTO_6221 ?AUTO_6222 ) ) ( ON ?AUTO_6222 ?AUTO_6220 ) ( CLEAR ?AUTO_6222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6222 ?AUTO_6220 )
      ( MAKE-ON ?AUTO_6219 ?AUTO_6220 )
      ( MAKE-ON-VERIFY ?AUTO_6219 ?AUTO_6220 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6223 - BLOCK
      ?AUTO_6224 - BLOCK
    )
    :vars
    (
      ?AUTO_6225 - BLOCK
      ?AUTO_6226 - BLOCK
      ?AUTO_6227 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6223 ?AUTO_6224 ) ) ( ON ?AUTO_6223 ?AUTO_6225 ) ( CLEAR ?AUTO_6223 ) ( not ( = ?AUTO_6223 ?AUTO_6225 ) ) ( not ( = ?AUTO_6224 ?AUTO_6225 ) ) ( not ( = ?AUTO_6223 ?AUTO_6226 ) ) ( not ( = ?AUTO_6224 ?AUTO_6226 ) ) ( not ( = ?AUTO_6225 ?AUTO_6226 ) ) ( ON ?AUTO_6226 ?AUTO_6224 ) ( CLEAR ?AUTO_6226 ) ( HOLDING ?AUTO_6227 ) ( not ( = ?AUTO_6223 ?AUTO_6227 ) ) ( not ( = ?AUTO_6224 ?AUTO_6227 ) ) ( not ( = ?AUTO_6225 ?AUTO_6227 ) ) ( not ( = ?AUTO_6226 ?AUTO_6227 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6227 )
      ( MAKE-ON ?AUTO_6223 ?AUTO_6224 )
      ( MAKE-ON-VERIFY ?AUTO_6223 ?AUTO_6224 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6228 - BLOCK
      ?AUTO_6229 - BLOCK
    )
    :vars
    (
      ?AUTO_6230 - BLOCK
      ?AUTO_6231 - BLOCK
      ?AUTO_6232 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6228 ?AUTO_6229 ) ) ( ON ?AUTO_6228 ?AUTO_6230 ) ( CLEAR ?AUTO_6228 ) ( not ( = ?AUTO_6228 ?AUTO_6230 ) ) ( not ( = ?AUTO_6229 ?AUTO_6230 ) ) ( not ( = ?AUTO_6228 ?AUTO_6231 ) ) ( not ( = ?AUTO_6229 ?AUTO_6231 ) ) ( not ( = ?AUTO_6230 ?AUTO_6231 ) ) ( ON ?AUTO_6231 ?AUTO_6229 ) ( not ( = ?AUTO_6228 ?AUTO_6232 ) ) ( not ( = ?AUTO_6229 ?AUTO_6232 ) ) ( not ( = ?AUTO_6230 ?AUTO_6232 ) ) ( not ( = ?AUTO_6231 ?AUTO_6232 ) ) ( ON ?AUTO_6232 ?AUTO_6231 ) ( CLEAR ?AUTO_6232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6232 ?AUTO_6231 )
      ( MAKE-ON ?AUTO_6228 ?AUTO_6229 )
      ( MAKE-ON-VERIFY ?AUTO_6228 ?AUTO_6229 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6233 - BLOCK
      ?AUTO_6234 - BLOCK
    )
    :vars
    (
      ?AUTO_6236 - BLOCK
      ?AUTO_6235 - BLOCK
      ?AUTO_6237 - BLOCK
      ?AUTO_6238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6233 ?AUTO_6234 ) ) ( ON ?AUTO_6233 ?AUTO_6236 ) ( CLEAR ?AUTO_6233 ) ( not ( = ?AUTO_6233 ?AUTO_6236 ) ) ( not ( = ?AUTO_6234 ?AUTO_6236 ) ) ( not ( = ?AUTO_6233 ?AUTO_6235 ) ) ( not ( = ?AUTO_6234 ?AUTO_6235 ) ) ( not ( = ?AUTO_6236 ?AUTO_6235 ) ) ( ON ?AUTO_6235 ?AUTO_6234 ) ( not ( = ?AUTO_6233 ?AUTO_6237 ) ) ( not ( = ?AUTO_6234 ?AUTO_6237 ) ) ( not ( = ?AUTO_6236 ?AUTO_6237 ) ) ( not ( = ?AUTO_6235 ?AUTO_6237 ) ) ( ON ?AUTO_6237 ?AUTO_6235 ) ( CLEAR ?AUTO_6237 ) ( HOLDING ?AUTO_6238 ) ( not ( = ?AUTO_6233 ?AUTO_6238 ) ) ( not ( = ?AUTO_6234 ?AUTO_6238 ) ) ( not ( = ?AUTO_6236 ?AUTO_6238 ) ) ( not ( = ?AUTO_6235 ?AUTO_6238 ) ) ( not ( = ?AUTO_6237 ?AUTO_6238 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6238 )
      ( MAKE-ON ?AUTO_6233 ?AUTO_6234 )
      ( MAKE-ON-VERIFY ?AUTO_6233 ?AUTO_6234 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6239 - BLOCK
      ?AUTO_6240 - BLOCK
    )
    :vars
    (
      ?AUTO_6241 - BLOCK
      ?AUTO_6242 - BLOCK
      ?AUTO_6244 - BLOCK
      ?AUTO_6243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6239 ?AUTO_6240 ) ) ( ON ?AUTO_6239 ?AUTO_6241 ) ( CLEAR ?AUTO_6239 ) ( not ( = ?AUTO_6239 ?AUTO_6241 ) ) ( not ( = ?AUTO_6240 ?AUTO_6241 ) ) ( not ( = ?AUTO_6239 ?AUTO_6242 ) ) ( not ( = ?AUTO_6240 ?AUTO_6242 ) ) ( not ( = ?AUTO_6241 ?AUTO_6242 ) ) ( ON ?AUTO_6242 ?AUTO_6240 ) ( not ( = ?AUTO_6239 ?AUTO_6244 ) ) ( not ( = ?AUTO_6240 ?AUTO_6244 ) ) ( not ( = ?AUTO_6241 ?AUTO_6244 ) ) ( not ( = ?AUTO_6242 ?AUTO_6244 ) ) ( ON ?AUTO_6244 ?AUTO_6242 ) ( not ( = ?AUTO_6239 ?AUTO_6243 ) ) ( not ( = ?AUTO_6240 ?AUTO_6243 ) ) ( not ( = ?AUTO_6241 ?AUTO_6243 ) ) ( not ( = ?AUTO_6242 ?AUTO_6243 ) ) ( not ( = ?AUTO_6244 ?AUTO_6243 ) ) ( ON ?AUTO_6243 ?AUTO_6244 ) ( CLEAR ?AUTO_6243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6243 ?AUTO_6244 )
      ( MAKE-ON ?AUTO_6239 ?AUTO_6240 )
      ( MAKE-ON-VERIFY ?AUTO_6239 ?AUTO_6240 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6246 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6246 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6246 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6246 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6247 - BLOCK
    )
    :vars
    (
      ?AUTO_6248 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6247 ?AUTO_6248 ) ( CLEAR ?AUTO_6247 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6247 ?AUTO_6248 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6247 ?AUTO_6248 )
      ( MAKE-ON-TABLE ?AUTO_6247 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6247 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6249 - BLOCK
    )
    :vars
    (
      ?AUTO_6250 - BLOCK
      ?AUTO_6251 - BLOCK
      ?AUTO_6252 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6249 ?AUTO_6250 ) ( CLEAR ?AUTO_6249 ) ( not ( = ?AUTO_6249 ?AUTO_6250 ) ) ( HOLDING ?AUTO_6251 ) ( CLEAR ?AUTO_6252 ) ( not ( = ?AUTO_6249 ?AUTO_6251 ) ) ( not ( = ?AUTO_6249 ?AUTO_6252 ) ) ( not ( = ?AUTO_6250 ?AUTO_6251 ) ) ( not ( = ?AUTO_6250 ?AUTO_6252 ) ) ( not ( = ?AUTO_6251 ?AUTO_6252 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6251 ?AUTO_6252 )
      ( MAKE-ON-TABLE ?AUTO_6249 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6249 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6253 - BLOCK
    )
    :vars
    (
      ?AUTO_6254 - BLOCK
      ?AUTO_6256 - BLOCK
      ?AUTO_6255 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6253 ?AUTO_6254 ) ( not ( = ?AUTO_6253 ?AUTO_6254 ) ) ( CLEAR ?AUTO_6256 ) ( not ( = ?AUTO_6253 ?AUTO_6255 ) ) ( not ( = ?AUTO_6253 ?AUTO_6256 ) ) ( not ( = ?AUTO_6254 ?AUTO_6255 ) ) ( not ( = ?AUTO_6254 ?AUTO_6256 ) ) ( not ( = ?AUTO_6255 ?AUTO_6256 ) ) ( ON ?AUTO_6255 ?AUTO_6253 ) ( CLEAR ?AUTO_6255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6255 ?AUTO_6253 )
      ( MAKE-ON-TABLE ?AUTO_6253 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6253 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6257 - BLOCK
    )
    :vars
    (
      ?AUTO_6259 - BLOCK
      ?AUTO_6260 - BLOCK
      ?AUTO_6258 - BLOCK
      ?AUTO_6261 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6257 ?AUTO_6259 ) ( not ( = ?AUTO_6257 ?AUTO_6259 ) ) ( CLEAR ?AUTO_6260 ) ( not ( = ?AUTO_6257 ?AUTO_6258 ) ) ( not ( = ?AUTO_6257 ?AUTO_6260 ) ) ( not ( = ?AUTO_6259 ?AUTO_6258 ) ) ( not ( = ?AUTO_6259 ?AUTO_6260 ) ) ( not ( = ?AUTO_6258 ?AUTO_6260 ) ) ( ON ?AUTO_6258 ?AUTO_6257 ) ( CLEAR ?AUTO_6258 ) ( HOLDING ?AUTO_6261 ) ( not ( = ?AUTO_6257 ?AUTO_6261 ) ) ( not ( = ?AUTO_6259 ?AUTO_6261 ) ) ( not ( = ?AUTO_6260 ?AUTO_6261 ) ) ( not ( = ?AUTO_6258 ?AUTO_6261 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6261 )
      ( MAKE-ON-TABLE ?AUTO_6257 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6257 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6268 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6268 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6268 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6268 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6269 - BLOCK
    )
    :vars
    (
      ?AUTO_6270 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6269 ?AUTO_6270 ) ( CLEAR ?AUTO_6269 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6269 ?AUTO_6270 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6269 ?AUTO_6270 )
      ( MAKE-ON-TABLE ?AUTO_6269 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6269 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6271 - BLOCK
    )
    :vars
    (
      ?AUTO_6272 - BLOCK
      ?AUTO_6273 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6271 ?AUTO_6272 ) ( CLEAR ?AUTO_6271 ) ( not ( = ?AUTO_6271 ?AUTO_6272 ) ) ( HOLDING ?AUTO_6273 ) ( not ( = ?AUTO_6271 ?AUTO_6273 ) ) ( not ( = ?AUTO_6272 ?AUTO_6273 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6273 )
      ( MAKE-ON-TABLE ?AUTO_6271 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6271 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6274 - BLOCK
    )
    :vars
    (
      ?AUTO_6275 - BLOCK
      ?AUTO_6276 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6274 ?AUTO_6275 ) ( not ( = ?AUTO_6274 ?AUTO_6275 ) ) ( not ( = ?AUTO_6274 ?AUTO_6276 ) ) ( not ( = ?AUTO_6275 ?AUTO_6276 ) ) ( ON ?AUTO_6276 ?AUTO_6274 ) ( CLEAR ?AUTO_6276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6276 ?AUTO_6274 )
      ( MAKE-ON-TABLE ?AUTO_6274 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6274 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6277 - BLOCK
    )
    :vars
    (
      ?AUTO_6278 - BLOCK
      ?AUTO_6279 - BLOCK
      ?AUTO_6280 - BLOCK
      ?AUTO_6281 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6277 ?AUTO_6278 ) ( not ( = ?AUTO_6277 ?AUTO_6278 ) ) ( not ( = ?AUTO_6277 ?AUTO_6279 ) ) ( not ( = ?AUTO_6278 ?AUTO_6279 ) ) ( ON ?AUTO_6279 ?AUTO_6277 ) ( CLEAR ?AUTO_6279 ) ( HOLDING ?AUTO_6280 ) ( CLEAR ?AUTO_6281 ) ( not ( = ?AUTO_6277 ?AUTO_6280 ) ) ( not ( = ?AUTO_6277 ?AUTO_6281 ) ) ( not ( = ?AUTO_6278 ?AUTO_6280 ) ) ( not ( = ?AUTO_6278 ?AUTO_6281 ) ) ( not ( = ?AUTO_6279 ?AUTO_6280 ) ) ( not ( = ?AUTO_6279 ?AUTO_6281 ) ) ( not ( = ?AUTO_6280 ?AUTO_6281 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6280 ?AUTO_6281 )
      ( MAKE-ON-TABLE ?AUTO_6277 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6277 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6282 - BLOCK
    )
    :vars
    (
      ?AUTO_6283 - BLOCK
      ?AUTO_6284 - BLOCK
      ?AUTO_6285 - BLOCK
      ?AUTO_6286 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6282 ?AUTO_6283 ) ( not ( = ?AUTO_6282 ?AUTO_6283 ) ) ( not ( = ?AUTO_6282 ?AUTO_6284 ) ) ( not ( = ?AUTO_6283 ?AUTO_6284 ) ) ( ON ?AUTO_6284 ?AUTO_6282 ) ( CLEAR ?AUTO_6285 ) ( not ( = ?AUTO_6282 ?AUTO_6286 ) ) ( not ( = ?AUTO_6282 ?AUTO_6285 ) ) ( not ( = ?AUTO_6283 ?AUTO_6286 ) ) ( not ( = ?AUTO_6283 ?AUTO_6285 ) ) ( not ( = ?AUTO_6284 ?AUTO_6286 ) ) ( not ( = ?AUTO_6284 ?AUTO_6285 ) ) ( not ( = ?AUTO_6286 ?AUTO_6285 ) ) ( ON ?AUTO_6286 ?AUTO_6284 ) ( CLEAR ?AUTO_6286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6286 ?AUTO_6284 )
      ( MAKE-ON-TABLE ?AUTO_6282 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6282 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6287 - BLOCK
    )
    :vars
    (
      ?AUTO_6291 - BLOCK
      ?AUTO_6288 - BLOCK
      ?AUTO_6289 - BLOCK
      ?AUTO_6290 - BLOCK
      ?AUTO_6292 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6287 ?AUTO_6291 ) ( not ( = ?AUTO_6287 ?AUTO_6291 ) ) ( not ( = ?AUTO_6287 ?AUTO_6288 ) ) ( not ( = ?AUTO_6291 ?AUTO_6288 ) ) ( ON ?AUTO_6288 ?AUTO_6287 ) ( CLEAR ?AUTO_6289 ) ( not ( = ?AUTO_6287 ?AUTO_6290 ) ) ( not ( = ?AUTO_6287 ?AUTO_6289 ) ) ( not ( = ?AUTO_6291 ?AUTO_6290 ) ) ( not ( = ?AUTO_6291 ?AUTO_6289 ) ) ( not ( = ?AUTO_6288 ?AUTO_6290 ) ) ( not ( = ?AUTO_6288 ?AUTO_6289 ) ) ( not ( = ?AUTO_6290 ?AUTO_6289 ) ) ( ON ?AUTO_6290 ?AUTO_6288 ) ( CLEAR ?AUTO_6290 ) ( HOLDING ?AUTO_6292 ) ( not ( = ?AUTO_6287 ?AUTO_6292 ) ) ( not ( = ?AUTO_6291 ?AUTO_6292 ) ) ( not ( = ?AUTO_6288 ?AUTO_6292 ) ) ( not ( = ?AUTO_6289 ?AUTO_6292 ) ) ( not ( = ?AUTO_6290 ?AUTO_6292 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6292 )
      ( MAKE-ON-TABLE ?AUTO_6287 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6287 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6300 - BLOCK
      ?AUTO_6301 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6300 ) ( CLEAR ?AUTO_6301 ) ( not ( = ?AUTO_6300 ?AUTO_6301 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6300 ?AUTO_6301 )
      ( MAKE-ON-VERIFY ?AUTO_6300 ?AUTO_6301 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6302 - BLOCK
      ?AUTO_6303 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6303 ) ( not ( = ?AUTO_6302 ?AUTO_6303 ) ) ( ON-TABLE ?AUTO_6302 ) ( CLEAR ?AUTO_6302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6302 )
      ( MAKE-ON ?AUTO_6302 ?AUTO_6303 )
      ( MAKE-ON-VERIFY ?AUTO_6302 ?AUTO_6303 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6304 - BLOCK
      ?AUTO_6305 - BLOCK
    )
    :vars
    (
      ?AUTO_6306 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6305 ) ( not ( = ?AUTO_6304 ?AUTO_6305 ) ) ( ON-TABLE ?AUTO_6304 ) ( CLEAR ?AUTO_6304 ) ( HOLDING ?AUTO_6306 ) ( not ( = ?AUTO_6304 ?AUTO_6306 ) ) ( not ( = ?AUTO_6305 ?AUTO_6306 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6306 )
      ( MAKE-ON ?AUTO_6304 ?AUTO_6305 )
      ( MAKE-ON-VERIFY ?AUTO_6304 ?AUTO_6305 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6307 - BLOCK
      ?AUTO_6308 - BLOCK
    )
    :vars
    (
      ?AUTO_6309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6307 ?AUTO_6308 ) ) ( ON-TABLE ?AUTO_6307 ) ( CLEAR ?AUTO_6307 ) ( not ( = ?AUTO_6307 ?AUTO_6309 ) ) ( not ( = ?AUTO_6308 ?AUTO_6309 ) ) ( ON ?AUTO_6309 ?AUTO_6308 ) ( CLEAR ?AUTO_6309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6309 ?AUTO_6308 )
      ( MAKE-ON ?AUTO_6307 ?AUTO_6308 )
      ( MAKE-ON-VERIFY ?AUTO_6307 ?AUTO_6308 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6310 - BLOCK
      ?AUTO_6311 - BLOCK
    )
    :vars
    (
      ?AUTO_6312 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6310 ?AUTO_6311 ) ) ( not ( = ?AUTO_6310 ?AUTO_6312 ) ) ( not ( = ?AUTO_6311 ?AUTO_6312 ) ) ( ON ?AUTO_6312 ?AUTO_6311 ) ( CLEAR ?AUTO_6312 ) ( HOLDING ?AUTO_6310 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6310 )
      ( MAKE-ON ?AUTO_6310 ?AUTO_6311 )
      ( MAKE-ON-VERIFY ?AUTO_6310 ?AUTO_6311 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6313 - BLOCK
      ?AUTO_6314 - BLOCK
    )
    :vars
    (
      ?AUTO_6315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6313 ?AUTO_6314 ) ) ( not ( = ?AUTO_6313 ?AUTO_6315 ) ) ( not ( = ?AUTO_6314 ?AUTO_6315 ) ) ( ON ?AUTO_6315 ?AUTO_6314 ) ( ON ?AUTO_6313 ?AUTO_6315 ) ( CLEAR ?AUTO_6313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6313 ?AUTO_6315 )
      ( MAKE-ON ?AUTO_6313 ?AUTO_6314 )
      ( MAKE-ON-VERIFY ?AUTO_6313 ?AUTO_6314 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6316 - BLOCK
      ?AUTO_6317 - BLOCK
    )
    :vars
    (
      ?AUTO_6318 - BLOCK
      ?AUTO_6319 - BLOCK
      ?AUTO_6320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6316 ?AUTO_6317 ) ) ( not ( = ?AUTO_6316 ?AUTO_6318 ) ) ( not ( = ?AUTO_6317 ?AUTO_6318 ) ) ( ON ?AUTO_6318 ?AUTO_6317 ) ( ON ?AUTO_6316 ?AUTO_6318 ) ( CLEAR ?AUTO_6316 ) ( HOLDING ?AUTO_6319 ) ( CLEAR ?AUTO_6320 ) ( not ( = ?AUTO_6316 ?AUTO_6319 ) ) ( not ( = ?AUTO_6316 ?AUTO_6320 ) ) ( not ( = ?AUTO_6317 ?AUTO_6319 ) ) ( not ( = ?AUTO_6317 ?AUTO_6320 ) ) ( not ( = ?AUTO_6318 ?AUTO_6319 ) ) ( not ( = ?AUTO_6318 ?AUTO_6320 ) ) ( not ( = ?AUTO_6319 ?AUTO_6320 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6319 ?AUTO_6320 )
      ( MAKE-ON ?AUTO_6316 ?AUTO_6317 )
      ( MAKE-ON-VERIFY ?AUTO_6316 ?AUTO_6317 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6321 - BLOCK
      ?AUTO_6322 - BLOCK
    )
    :vars
    (
      ?AUTO_6323 - BLOCK
      ?AUTO_6325 - BLOCK
      ?AUTO_6324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6321 ?AUTO_6322 ) ) ( not ( = ?AUTO_6321 ?AUTO_6323 ) ) ( not ( = ?AUTO_6322 ?AUTO_6323 ) ) ( ON ?AUTO_6323 ?AUTO_6322 ) ( ON ?AUTO_6321 ?AUTO_6323 ) ( CLEAR ?AUTO_6325 ) ( not ( = ?AUTO_6321 ?AUTO_6324 ) ) ( not ( = ?AUTO_6321 ?AUTO_6325 ) ) ( not ( = ?AUTO_6322 ?AUTO_6324 ) ) ( not ( = ?AUTO_6322 ?AUTO_6325 ) ) ( not ( = ?AUTO_6323 ?AUTO_6324 ) ) ( not ( = ?AUTO_6323 ?AUTO_6325 ) ) ( not ( = ?AUTO_6324 ?AUTO_6325 ) ) ( ON ?AUTO_6324 ?AUTO_6321 ) ( CLEAR ?AUTO_6324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6324 ?AUTO_6321 )
      ( MAKE-ON ?AUTO_6321 ?AUTO_6322 )
      ( MAKE-ON-VERIFY ?AUTO_6321 ?AUTO_6322 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6326 - BLOCK
      ?AUTO_6327 - BLOCK
    )
    :vars
    (
      ?AUTO_6330 - BLOCK
      ?AUTO_6328 - BLOCK
      ?AUTO_6329 - BLOCK
      ?AUTO_6331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6326 ?AUTO_6327 ) ) ( not ( = ?AUTO_6326 ?AUTO_6330 ) ) ( not ( = ?AUTO_6327 ?AUTO_6330 ) ) ( ON ?AUTO_6330 ?AUTO_6327 ) ( ON ?AUTO_6326 ?AUTO_6330 ) ( CLEAR ?AUTO_6328 ) ( not ( = ?AUTO_6326 ?AUTO_6329 ) ) ( not ( = ?AUTO_6326 ?AUTO_6328 ) ) ( not ( = ?AUTO_6327 ?AUTO_6329 ) ) ( not ( = ?AUTO_6327 ?AUTO_6328 ) ) ( not ( = ?AUTO_6330 ?AUTO_6329 ) ) ( not ( = ?AUTO_6330 ?AUTO_6328 ) ) ( not ( = ?AUTO_6329 ?AUTO_6328 ) ) ( ON ?AUTO_6329 ?AUTO_6326 ) ( CLEAR ?AUTO_6329 ) ( HOLDING ?AUTO_6331 ) ( not ( = ?AUTO_6326 ?AUTO_6331 ) ) ( not ( = ?AUTO_6327 ?AUTO_6331 ) ) ( not ( = ?AUTO_6330 ?AUTO_6331 ) ) ( not ( = ?AUTO_6328 ?AUTO_6331 ) ) ( not ( = ?AUTO_6329 ?AUTO_6331 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6331 )
      ( MAKE-ON ?AUTO_6326 ?AUTO_6327 )
      ( MAKE-ON-VERIFY ?AUTO_6326 ?AUTO_6327 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6344 - BLOCK
      ?AUTO_6345 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6344 ) ( CLEAR ?AUTO_6345 ) ( not ( = ?AUTO_6344 ?AUTO_6345 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6344 ?AUTO_6345 )
      ( MAKE-ON-VERIFY ?AUTO_6344 ?AUTO_6345 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6346 - BLOCK
      ?AUTO_6347 - BLOCK
    )
    :vars
    (
      ?AUTO_6348 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6347 ) ( not ( = ?AUTO_6346 ?AUTO_6347 ) ) ( ON ?AUTO_6346 ?AUTO_6348 ) ( CLEAR ?AUTO_6346 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6346 ?AUTO_6348 ) ) ( not ( = ?AUTO_6347 ?AUTO_6348 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6346 ?AUTO_6348 )
      ( MAKE-ON ?AUTO_6346 ?AUTO_6347 )
      ( MAKE-ON-VERIFY ?AUTO_6346 ?AUTO_6347 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6349 - BLOCK
      ?AUTO_6350 - BLOCK
    )
    :vars
    (
      ?AUTO_6351 - BLOCK
      ?AUTO_6352 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6349 ?AUTO_6350 ) ) ( ON ?AUTO_6349 ?AUTO_6351 ) ( CLEAR ?AUTO_6349 ) ( not ( = ?AUTO_6349 ?AUTO_6351 ) ) ( not ( = ?AUTO_6350 ?AUTO_6351 ) ) ( HOLDING ?AUTO_6350 ) ( CLEAR ?AUTO_6352 ) ( not ( = ?AUTO_6349 ?AUTO_6352 ) ) ( not ( = ?AUTO_6350 ?AUTO_6352 ) ) ( not ( = ?AUTO_6351 ?AUTO_6352 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6350 ?AUTO_6352 )
      ( MAKE-ON ?AUTO_6349 ?AUTO_6350 )
      ( MAKE-ON-VERIFY ?AUTO_6349 ?AUTO_6350 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6355 - BLOCK
      ?AUTO_6356 - BLOCK
    )
    :vars
    (
      ?AUTO_6357 - BLOCK
      ?AUTO_6358 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6356 ) ( not ( = ?AUTO_6355 ?AUTO_6356 ) ) ( ON ?AUTO_6355 ?AUTO_6357 ) ( CLEAR ?AUTO_6355 ) ( not ( = ?AUTO_6355 ?AUTO_6357 ) ) ( not ( = ?AUTO_6356 ?AUTO_6357 ) ) ( HOLDING ?AUTO_6358 ) ( not ( = ?AUTO_6355 ?AUTO_6358 ) ) ( not ( = ?AUTO_6356 ?AUTO_6358 ) ) ( not ( = ?AUTO_6357 ?AUTO_6358 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6358 )
      ( MAKE-ON ?AUTO_6355 ?AUTO_6356 )
      ( MAKE-ON-VERIFY ?AUTO_6355 ?AUTO_6356 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6400 - BLOCK
      ?AUTO_6401 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6400 ) ( CLEAR ?AUTO_6401 ) ( not ( = ?AUTO_6400 ?AUTO_6401 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6400 ?AUTO_6401 )
      ( MAKE-ON-VERIFY ?AUTO_6400 ?AUTO_6401 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6402 - BLOCK
      ?AUTO_6403 - BLOCK
    )
    :vars
    (
      ?AUTO_6404 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6403 ) ( not ( = ?AUTO_6402 ?AUTO_6403 ) ) ( ON ?AUTO_6402 ?AUTO_6404 ) ( CLEAR ?AUTO_6402 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6402 ?AUTO_6404 ) ) ( not ( = ?AUTO_6403 ?AUTO_6404 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6402 ?AUTO_6404 )
      ( MAKE-ON ?AUTO_6402 ?AUTO_6403 )
      ( MAKE-ON-VERIFY ?AUTO_6402 ?AUTO_6403 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6405 - BLOCK
      ?AUTO_6406 - BLOCK
    )
    :vars
    (
      ?AUTO_6407 - BLOCK
      ?AUTO_6408 - BLOCK
      ?AUTO_6409 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6406 ) ( not ( = ?AUTO_6405 ?AUTO_6406 ) ) ( ON ?AUTO_6405 ?AUTO_6407 ) ( CLEAR ?AUTO_6405 ) ( not ( = ?AUTO_6405 ?AUTO_6407 ) ) ( not ( = ?AUTO_6406 ?AUTO_6407 ) ) ( HOLDING ?AUTO_6408 ) ( CLEAR ?AUTO_6409 ) ( not ( = ?AUTO_6405 ?AUTO_6408 ) ) ( not ( = ?AUTO_6405 ?AUTO_6409 ) ) ( not ( = ?AUTO_6406 ?AUTO_6408 ) ) ( not ( = ?AUTO_6406 ?AUTO_6409 ) ) ( not ( = ?AUTO_6407 ?AUTO_6408 ) ) ( not ( = ?AUTO_6407 ?AUTO_6409 ) ) ( not ( = ?AUTO_6408 ?AUTO_6409 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6408 ?AUTO_6409 )
      ( MAKE-ON ?AUTO_6405 ?AUTO_6406 )
      ( MAKE-ON-VERIFY ?AUTO_6405 ?AUTO_6406 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6410 - BLOCK
      ?AUTO_6411 - BLOCK
    )
    :vars
    (
      ?AUTO_6412 - BLOCK
      ?AUTO_6413 - BLOCK
      ?AUTO_6414 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6411 ) ( not ( = ?AUTO_6410 ?AUTO_6411 ) ) ( ON ?AUTO_6410 ?AUTO_6412 ) ( not ( = ?AUTO_6410 ?AUTO_6412 ) ) ( not ( = ?AUTO_6411 ?AUTO_6412 ) ) ( CLEAR ?AUTO_6413 ) ( not ( = ?AUTO_6410 ?AUTO_6414 ) ) ( not ( = ?AUTO_6410 ?AUTO_6413 ) ) ( not ( = ?AUTO_6411 ?AUTO_6414 ) ) ( not ( = ?AUTO_6411 ?AUTO_6413 ) ) ( not ( = ?AUTO_6412 ?AUTO_6414 ) ) ( not ( = ?AUTO_6412 ?AUTO_6413 ) ) ( not ( = ?AUTO_6414 ?AUTO_6413 ) ) ( ON ?AUTO_6414 ?AUTO_6410 ) ( CLEAR ?AUTO_6414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6414 ?AUTO_6410 )
      ( MAKE-ON ?AUTO_6410 ?AUTO_6411 )
      ( MAKE-ON-VERIFY ?AUTO_6410 ?AUTO_6411 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6415 - BLOCK
      ?AUTO_6416 - BLOCK
    )
    :vars
    (
      ?AUTO_6417 - BLOCK
      ?AUTO_6418 - BLOCK
      ?AUTO_6419 - BLOCK
      ?AUTO_6420 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6416 ) ( not ( = ?AUTO_6415 ?AUTO_6416 ) ) ( ON ?AUTO_6415 ?AUTO_6417 ) ( not ( = ?AUTO_6415 ?AUTO_6417 ) ) ( not ( = ?AUTO_6416 ?AUTO_6417 ) ) ( not ( = ?AUTO_6415 ?AUTO_6418 ) ) ( not ( = ?AUTO_6415 ?AUTO_6419 ) ) ( not ( = ?AUTO_6416 ?AUTO_6418 ) ) ( not ( = ?AUTO_6416 ?AUTO_6419 ) ) ( not ( = ?AUTO_6417 ?AUTO_6418 ) ) ( not ( = ?AUTO_6417 ?AUTO_6419 ) ) ( not ( = ?AUTO_6418 ?AUTO_6419 ) ) ( ON ?AUTO_6418 ?AUTO_6415 ) ( CLEAR ?AUTO_6418 ) ( HOLDING ?AUTO_6419 ) ( CLEAR ?AUTO_6420 ) ( not ( = ?AUTO_6415 ?AUTO_6420 ) ) ( not ( = ?AUTO_6416 ?AUTO_6420 ) ) ( not ( = ?AUTO_6417 ?AUTO_6420 ) ) ( not ( = ?AUTO_6418 ?AUTO_6420 ) ) ( not ( = ?AUTO_6419 ?AUTO_6420 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6419 ?AUTO_6420 )
      ( MAKE-ON ?AUTO_6415 ?AUTO_6416 )
      ( MAKE-ON-VERIFY ?AUTO_6415 ?AUTO_6416 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6423 - BLOCK
      ?AUTO_6424 - BLOCK
    )
    :vars
    (
      ?AUTO_6426 - BLOCK
      ?AUTO_6427 - BLOCK
      ?AUTO_6425 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6423 ?AUTO_6424 ) ) ( ON ?AUTO_6423 ?AUTO_6426 ) ( not ( = ?AUTO_6423 ?AUTO_6426 ) ) ( not ( = ?AUTO_6424 ?AUTO_6426 ) ) ( CLEAR ?AUTO_6427 ) ( not ( = ?AUTO_6423 ?AUTO_6425 ) ) ( not ( = ?AUTO_6423 ?AUTO_6427 ) ) ( not ( = ?AUTO_6424 ?AUTO_6425 ) ) ( not ( = ?AUTO_6424 ?AUTO_6427 ) ) ( not ( = ?AUTO_6426 ?AUTO_6425 ) ) ( not ( = ?AUTO_6426 ?AUTO_6427 ) ) ( not ( = ?AUTO_6425 ?AUTO_6427 ) ) ( ON ?AUTO_6425 ?AUTO_6423 ) ( CLEAR ?AUTO_6425 ) ( HOLDING ?AUTO_6424 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6424 )
      ( MAKE-ON ?AUTO_6423 ?AUTO_6424 )
      ( MAKE-ON-VERIFY ?AUTO_6423 ?AUTO_6424 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6432 - BLOCK
      ?AUTO_6433 - BLOCK
    )
    :vars
    (
      ?AUTO_6436 - BLOCK
      ?AUTO_6437 - BLOCK
      ?AUTO_6434 - BLOCK
      ?AUTO_6435 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6432 ?AUTO_6433 ) ) ( ON ?AUTO_6432 ?AUTO_6436 ) ( not ( = ?AUTO_6432 ?AUTO_6436 ) ) ( not ( = ?AUTO_6433 ?AUTO_6436 ) ) ( not ( = ?AUTO_6432 ?AUTO_6437 ) ) ( not ( = ?AUTO_6432 ?AUTO_6434 ) ) ( not ( = ?AUTO_6433 ?AUTO_6437 ) ) ( not ( = ?AUTO_6433 ?AUTO_6434 ) ) ( not ( = ?AUTO_6436 ?AUTO_6437 ) ) ( not ( = ?AUTO_6436 ?AUTO_6434 ) ) ( not ( = ?AUTO_6437 ?AUTO_6434 ) ) ( ON ?AUTO_6437 ?AUTO_6432 ) ( CLEAR ?AUTO_6437 ) ( CLEAR ?AUTO_6435 ) ( not ( = ?AUTO_6432 ?AUTO_6435 ) ) ( not ( = ?AUTO_6433 ?AUTO_6435 ) ) ( not ( = ?AUTO_6436 ?AUTO_6435 ) ) ( not ( = ?AUTO_6437 ?AUTO_6435 ) ) ( not ( = ?AUTO_6434 ?AUTO_6435 ) ) ( ON ?AUTO_6434 ?AUTO_6433 ) ( CLEAR ?AUTO_6434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6434 ?AUTO_6433 )
      ( MAKE-ON ?AUTO_6432 ?AUTO_6433 )
      ( MAKE-ON-VERIFY ?AUTO_6432 ?AUTO_6433 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6438 - BLOCK
      ?AUTO_6439 - BLOCK
    )
    :vars
    (
      ?AUTO_6442 - BLOCK
      ?AUTO_6441 - BLOCK
      ?AUTO_6443 - BLOCK
      ?AUTO_6440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6438 ?AUTO_6439 ) ) ( ON ?AUTO_6438 ?AUTO_6442 ) ( not ( = ?AUTO_6438 ?AUTO_6442 ) ) ( not ( = ?AUTO_6439 ?AUTO_6442 ) ) ( not ( = ?AUTO_6438 ?AUTO_6441 ) ) ( not ( = ?AUTO_6438 ?AUTO_6443 ) ) ( not ( = ?AUTO_6439 ?AUTO_6441 ) ) ( not ( = ?AUTO_6439 ?AUTO_6443 ) ) ( not ( = ?AUTO_6442 ?AUTO_6441 ) ) ( not ( = ?AUTO_6442 ?AUTO_6443 ) ) ( not ( = ?AUTO_6441 ?AUTO_6443 ) ) ( CLEAR ?AUTO_6440 ) ( not ( = ?AUTO_6438 ?AUTO_6440 ) ) ( not ( = ?AUTO_6439 ?AUTO_6440 ) ) ( not ( = ?AUTO_6442 ?AUTO_6440 ) ) ( not ( = ?AUTO_6441 ?AUTO_6440 ) ) ( not ( = ?AUTO_6443 ?AUTO_6440 ) ) ( ON ?AUTO_6443 ?AUTO_6439 ) ( CLEAR ?AUTO_6443 ) ( HOLDING ?AUTO_6441 ) ( CLEAR ?AUTO_6438 ) )
    :subtasks
    ( ( !STACK ?AUTO_6441 ?AUTO_6438 )
      ( MAKE-ON ?AUTO_6438 ?AUTO_6439 )
      ( MAKE-ON-VERIFY ?AUTO_6438 ?AUTO_6439 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6444 - BLOCK
      ?AUTO_6445 - BLOCK
    )
    :vars
    (
      ?AUTO_6449 - BLOCK
      ?AUTO_6447 - BLOCK
      ?AUTO_6448 - BLOCK
      ?AUTO_6446 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6444 ?AUTO_6445 ) ) ( ON ?AUTO_6444 ?AUTO_6449 ) ( not ( = ?AUTO_6444 ?AUTO_6449 ) ) ( not ( = ?AUTO_6445 ?AUTO_6449 ) ) ( not ( = ?AUTO_6444 ?AUTO_6447 ) ) ( not ( = ?AUTO_6444 ?AUTO_6448 ) ) ( not ( = ?AUTO_6445 ?AUTO_6447 ) ) ( not ( = ?AUTO_6445 ?AUTO_6448 ) ) ( not ( = ?AUTO_6449 ?AUTO_6447 ) ) ( not ( = ?AUTO_6449 ?AUTO_6448 ) ) ( not ( = ?AUTO_6447 ?AUTO_6448 ) ) ( CLEAR ?AUTO_6446 ) ( not ( = ?AUTO_6444 ?AUTO_6446 ) ) ( not ( = ?AUTO_6445 ?AUTO_6446 ) ) ( not ( = ?AUTO_6449 ?AUTO_6446 ) ) ( not ( = ?AUTO_6447 ?AUTO_6446 ) ) ( not ( = ?AUTO_6448 ?AUTO_6446 ) ) ( ON ?AUTO_6448 ?AUTO_6445 ) ( CLEAR ?AUTO_6444 ) ( ON ?AUTO_6447 ?AUTO_6448 ) ( CLEAR ?AUTO_6447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6447 ?AUTO_6448 )
      ( MAKE-ON ?AUTO_6444 ?AUTO_6445 )
      ( MAKE-ON-VERIFY ?AUTO_6444 ?AUTO_6445 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6450 - BLOCK
      ?AUTO_6451 - BLOCK
    )
    :vars
    (
      ?AUTO_6453 - BLOCK
      ?AUTO_6454 - BLOCK
      ?AUTO_6452 - BLOCK
      ?AUTO_6455 - BLOCK
      ?AUTO_6456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6450 ?AUTO_6451 ) ) ( ON ?AUTO_6450 ?AUTO_6453 ) ( not ( = ?AUTO_6450 ?AUTO_6453 ) ) ( not ( = ?AUTO_6451 ?AUTO_6453 ) ) ( not ( = ?AUTO_6450 ?AUTO_6454 ) ) ( not ( = ?AUTO_6450 ?AUTO_6452 ) ) ( not ( = ?AUTO_6451 ?AUTO_6454 ) ) ( not ( = ?AUTO_6451 ?AUTO_6452 ) ) ( not ( = ?AUTO_6453 ?AUTO_6454 ) ) ( not ( = ?AUTO_6453 ?AUTO_6452 ) ) ( not ( = ?AUTO_6454 ?AUTO_6452 ) ) ( CLEAR ?AUTO_6455 ) ( not ( = ?AUTO_6450 ?AUTO_6455 ) ) ( not ( = ?AUTO_6451 ?AUTO_6455 ) ) ( not ( = ?AUTO_6453 ?AUTO_6455 ) ) ( not ( = ?AUTO_6454 ?AUTO_6455 ) ) ( not ( = ?AUTO_6452 ?AUTO_6455 ) ) ( ON ?AUTO_6452 ?AUTO_6451 ) ( CLEAR ?AUTO_6450 ) ( ON ?AUTO_6454 ?AUTO_6452 ) ( CLEAR ?AUTO_6454 ) ( HOLDING ?AUTO_6456 ) ( not ( = ?AUTO_6450 ?AUTO_6456 ) ) ( not ( = ?AUTO_6451 ?AUTO_6456 ) ) ( not ( = ?AUTO_6453 ?AUTO_6456 ) ) ( not ( = ?AUTO_6454 ?AUTO_6456 ) ) ( not ( = ?AUTO_6452 ?AUTO_6456 ) ) ( not ( = ?AUTO_6455 ?AUTO_6456 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6456 )
      ( MAKE-ON ?AUTO_6450 ?AUTO_6451 )
      ( MAKE-ON-VERIFY ?AUTO_6450 ?AUTO_6451 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6457 - BLOCK
      ?AUTO_6458 - BLOCK
    )
    :vars
    (
      ?AUTO_6461 - BLOCK
      ?AUTO_6459 - BLOCK
      ?AUTO_6460 - BLOCK
      ?AUTO_6462 - BLOCK
      ?AUTO_6463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6457 ?AUTO_6458 ) ) ( ON ?AUTO_6457 ?AUTO_6461 ) ( not ( = ?AUTO_6457 ?AUTO_6461 ) ) ( not ( = ?AUTO_6458 ?AUTO_6461 ) ) ( not ( = ?AUTO_6457 ?AUTO_6459 ) ) ( not ( = ?AUTO_6457 ?AUTO_6460 ) ) ( not ( = ?AUTO_6458 ?AUTO_6459 ) ) ( not ( = ?AUTO_6458 ?AUTO_6460 ) ) ( not ( = ?AUTO_6461 ?AUTO_6459 ) ) ( not ( = ?AUTO_6461 ?AUTO_6460 ) ) ( not ( = ?AUTO_6459 ?AUTO_6460 ) ) ( CLEAR ?AUTO_6462 ) ( not ( = ?AUTO_6457 ?AUTO_6462 ) ) ( not ( = ?AUTO_6458 ?AUTO_6462 ) ) ( not ( = ?AUTO_6461 ?AUTO_6462 ) ) ( not ( = ?AUTO_6459 ?AUTO_6462 ) ) ( not ( = ?AUTO_6460 ?AUTO_6462 ) ) ( ON ?AUTO_6460 ?AUTO_6458 ) ( ON ?AUTO_6459 ?AUTO_6460 ) ( CLEAR ?AUTO_6459 ) ( not ( = ?AUTO_6457 ?AUTO_6463 ) ) ( not ( = ?AUTO_6458 ?AUTO_6463 ) ) ( not ( = ?AUTO_6461 ?AUTO_6463 ) ) ( not ( = ?AUTO_6459 ?AUTO_6463 ) ) ( not ( = ?AUTO_6460 ?AUTO_6463 ) ) ( not ( = ?AUTO_6462 ?AUTO_6463 ) ) ( ON ?AUTO_6463 ?AUTO_6457 ) ( CLEAR ?AUTO_6463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6463 ?AUTO_6457 )
      ( MAKE-ON ?AUTO_6457 ?AUTO_6458 )
      ( MAKE-ON-VERIFY ?AUTO_6457 ?AUTO_6458 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6464 - BLOCK
      ?AUTO_6465 - BLOCK
    )
    :vars
    (
      ?AUTO_6470 - BLOCK
      ?AUTO_6466 - BLOCK
      ?AUTO_6468 - BLOCK
      ?AUTO_6469 - BLOCK
      ?AUTO_6467 - BLOCK
      ?AUTO_6471 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6464 ?AUTO_6465 ) ) ( ON ?AUTO_6464 ?AUTO_6470 ) ( not ( = ?AUTO_6464 ?AUTO_6470 ) ) ( not ( = ?AUTO_6465 ?AUTO_6470 ) ) ( not ( = ?AUTO_6464 ?AUTO_6466 ) ) ( not ( = ?AUTO_6464 ?AUTO_6468 ) ) ( not ( = ?AUTO_6465 ?AUTO_6466 ) ) ( not ( = ?AUTO_6465 ?AUTO_6468 ) ) ( not ( = ?AUTO_6470 ?AUTO_6466 ) ) ( not ( = ?AUTO_6470 ?AUTO_6468 ) ) ( not ( = ?AUTO_6466 ?AUTO_6468 ) ) ( CLEAR ?AUTO_6469 ) ( not ( = ?AUTO_6464 ?AUTO_6469 ) ) ( not ( = ?AUTO_6465 ?AUTO_6469 ) ) ( not ( = ?AUTO_6470 ?AUTO_6469 ) ) ( not ( = ?AUTO_6466 ?AUTO_6469 ) ) ( not ( = ?AUTO_6468 ?AUTO_6469 ) ) ( ON ?AUTO_6468 ?AUTO_6465 ) ( ON ?AUTO_6466 ?AUTO_6468 ) ( CLEAR ?AUTO_6466 ) ( not ( = ?AUTO_6464 ?AUTO_6467 ) ) ( not ( = ?AUTO_6465 ?AUTO_6467 ) ) ( not ( = ?AUTO_6470 ?AUTO_6467 ) ) ( not ( = ?AUTO_6466 ?AUTO_6467 ) ) ( not ( = ?AUTO_6468 ?AUTO_6467 ) ) ( not ( = ?AUTO_6469 ?AUTO_6467 ) ) ( ON ?AUTO_6467 ?AUTO_6464 ) ( CLEAR ?AUTO_6467 ) ( HOLDING ?AUTO_6471 ) ( not ( = ?AUTO_6464 ?AUTO_6471 ) ) ( not ( = ?AUTO_6465 ?AUTO_6471 ) ) ( not ( = ?AUTO_6470 ?AUTO_6471 ) ) ( not ( = ?AUTO_6466 ?AUTO_6471 ) ) ( not ( = ?AUTO_6468 ?AUTO_6471 ) ) ( not ( = ?AUTO_6469 ?AUTO_6471 ) ) ( not ( = ?AUTO_6467 ?AUTO_6471 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6471 )
      ( MAKE-ON ?AUTO_6464 ?AUTO_6465 )
      ( MAKE-ON-VERIFY ?AUTO_6464 ?AUTO_6465 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6472 - BLOCK
      ?AUTO_6473 - BLOCK
    )
    :vars
    (
      ?AUTO_6475 - BLOCK
      ?AUTO_6476 - BLOCK
      ?AUTO_6479 - BLOCK
      ?AUTO_6474 - BLOCK
      ?AUTO_6477 - BLOCK
      ?AUTO_6478 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6472 ?AUTO_6473 ) ) ( ON ?AUTO_6472 ?AUTO_6475 ) ( not ( = ?AUTO_6472 ?AUTO_6475 ) ) ( not ( = ?AUTO_6473 ?AUTO_6475 ) ) ( not ( = ?AUTO_6472 ?AUTO_6476 ) ) ( not ( = ?AUTO_6472 ?AUTO_6479 ) ) ( not ( = ?AUTO_6473 ?AUTO_6476 ) ) ( not ( = ?AUTO_6473 ?AUTO_6479 ) ) ( not ( = ?AUTO_6475 ?AUTO_6476 ) ) ( not ( = ?AUTO_6475 ?AUTO_6479 ) ) ( not ( = ?AUTO_6476 ?AUTO_6479 ) ) ( CLEAR ?AUTO_6474 ) ( not ( = ?AUTO_6472 ?AUTO_6474 ) ) ( not ( = ?AUTO_6473 ?AUTO_6474 ) ) ( not ( = ?AUTO_6475 ?AUTO_6474 ) ) ( not ( = ?AUTO_6476 ?AUTO_6474 ) ) ( not ( = ?AUTO_6479 ?AUTO_6474 ) ) ( ON ?AUTO_6479 ?AUTO_6473 ) ( ON ?AUTO_6476 ?AUTO_6479 ) ( CLEAR ?AUTO_6476 ) ( not ( = ?AUTO_6472 ?AUTO_6477 ) ) ( not ( = ?AUTO_6473 ?AUTO_6477 ) ) ( not ( = ?AUTO_6475 ?AUTO_6477 ) ) ( not ( = ?AUTO_6476 ?AUTO_6477 ) ) ( not ( = ?AUTO_6479 ?AUTO_6477 ) ) ( not ( = ?AUTO_6474 ?AUTO_6477 ) ) ( ON ?AUTO_6477 ?AUTO_6472 ) ( not ( = ?AUTO_6472 ?AUTO_6478 ) ) ( not ( = ?AUTO_6473 ?AUTO_6478 ) ) ( not ( = ?AUTO_6475 ?AUTO_6478 ) ) ( not ( = ?AUTO_6476 ?AUTO_6478 ) ) ( not ( = ?AUTO_6479 ?AUTO_6478 ) ) ( not ( = ?AUTO_6474 ?AUTO_6478 ) ) ( not ( = ?AUTO_6477 ?AUTO_6478 ) ) ( ON ?AUTO_6478 ?AUTO_6477 ) ( CLEAR ?AUTO_6478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6478 ?AUTO_6477 )
      ( MAKE-ON ?AUTO_6472 ?AUTO_6473 )
      ( MAKE-ON-VERIFY ?AUTO_6472 ?AUTO_6473 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6480 - BLOCK
      ?AUTO_6481 - BLOCK
    )
    :vars
    (
      ?AUTO_6485 - BLOCK
      ?AUTO_6482 - BLOCK
      ?AUTO_6483 - BLOCK
      ?AUTO_6487 - BLOCK
      ?AUTO_6486 - BLOCK
      ?AUTO_6484 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6480 ?AUTO_6481 ) ) ( ON ?AUTO_6480 ?AUTO_6485 ) ( not ( = ?AUTO_6480 ?AUTO_6485 ) ) ( not ( = ?AUTO_6481 ?AUTO_6485 ) ) ( not ( = ?AUTO_6480 ?AUTO_6482 ) ) ( not ( = ?AUTO_6480 ?AUTO_6483 ) ) ( not ( = ?AUTO_6481 ?AUTO_6482 ) ) ( not ( = ?AUTO_6481 ?AUTO_6483 ) ) ( not ( = ?AUTO_6485 ?AUTO_6482 ) ) ( not ( = ?AUTO_6485 ?AUTO_6483 ) ) ( not ( = ?AUTO_6482 ?AUTO_6483 ) ) ( not ( = ?AUTO_6480 ?AUTO_6487 ) ) ( not ( = ?AUTO_6481 ?AUTO_6487 ) ) ( not ( = ?AUTO_6485 ?AUTO_6487 ) ) ( not ( = ?AUTO_6482 ?AUTO_6487 ) ) ( not ( = ?AUTO_6483 ?AUTO_6487 ) ) ( ON ?AUTO_6483 ?AUTO_6481 ) ( ON ?AUTO_6482 ?AUTO_6483 ) ( CLEAR ?AUTO_6482 ) ( not ( = ?AUTO_6480 ?AUTO_6486 ) ) ( not ( = ?AUTO_6481 ?AUTO_6486 ) ) ( not ( = ?AUTO_6485 ?AUTO_6486 ) ) ( not ( = ?AUTO_6482 ?AUTO_6486 ) ) ( not ( = ?AUTO_6483 ?AUTO_6486 ) ) ( not ( = ?AUTO_6487 ?AUTO_6486 ) ) ( ON ?AUTO_6486 ?AUTO_6480 ) ( not ( = ?AUTO_6480 ?AUTO_6484 ) ) ( not ( = ?AUTO_6481 ?AUTO_6484 ) ) ( not ( = ?AUTO_6485 ?AUTO_6484 ) ) ( not ( = ?AUTO_6482 ?AUTO_6484 ) ) ( not ( = ?AUTO_6483 ?AUTO_6484 ) ) ( not ( = ?AUTO_6487 ?AUTO_6484 ) ) ( not ( = ?AUTO_6486 ?AUTO_6484 ) ) ( ON ?AUTO_6484 ?AUTO_6486 ) ( CLEAR ?AUTO_6484 ) ( HOLDING ?AUTO_6487 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6487 )
      ( MAKE-ON ?AUTO_6480 ?AUTO_6481 )
      ( MAKE-ON-VERIFY ?AUTO_6480 ?AUTO_6481 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6488 - BLOCK
      ?AUTO_6489 - BLOCK
    )
    :vars
    (
      ?AUTO_6491 - BLOCK
      ?AUTO_6492 - BLOCK
      ?AUTO_6490 - BLOCK
      ?AUTO_6493 - BLOCK
      ?AUTO_6494 - BLOCK
      ?AUTO_6495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6488 ?AUTO_6489 ) ) ( ON ?AUTO_6488 ?AUTO_6491 ) ( not ( = ?AUTO_6488 ?AUTO_6491 ) ) ( not ( = ?AUTO_6489 ?AUTO_6491 ) ) ( not ( = ?AUTO_6488 ?AUTO_6492 ) ) ( not ( = ?AUTO_6488 ?AUTO_6490 ) ) ( not ( = ?AUTO_6489 ?AUTO_6492 ) ) ( not ( = ?AUTO_6489 ?AUTO_6490 ) ) ( not ( = ?AUTO_6491 ?AUTO_6492 ) ) ( not ( = ?AUTO_6491 ?AUTO_6490 ) ) ( not ( = ?AUTO_6492 ?AUTO_6490 ) ) ( not ( = ?AUTO_6488 ?AUTO_6493 ) ) ( not ( = ?AUTO_6489 ?AUTO_6493 ) ) ( not ( = ?AUTO_6491 ?AUTO_6493 ) ) ( not ( = ?AUTO_6492 ?AUTO_6493 ) ) ( not ( = ?AUTO_6490 ?AUTO_6493 ) ) ( ON ?AUTO_6490 ?AUTO_6489 ) ( ON ?AUTO_6492 ?AUTO_6490 ) ( CLEAR ?AUTO_6492 ) ( not ( = ?AUTO_6488 ?AUTO_6494 ) ) ( not ( = ?AUTO_6489 ?AUTO_6494 ) ) ( not ( = ?AUTO_6491 ?AUTO_6494 ) ) ( not ( = ?AUTO_6492 ?AUTO_6494 ) ) ( not ( = ?AUTO_6490 ?AUTO_6494 ) ) ( not ( = ?AUTO_6493 ?AUTO_6494 ) ) ( ON ?AUTO_6494 ?AUTO_6488 ) ( not ( = ?AUTO_6488 ?AUTO_6495 ) ) ( not ( = ?AUTO_6489 ?AUTO_6495 ) ) ( not ( = ?AUTO_6491 ?AUTO_6495 ) ) ( not ( = ?AUTO_6492 ?AUTO_6495 ) ) ( not ( = ?AUTO_6490 ?AUTO_6495 ) ) ( not ( = ?AUTO_6493 ?AUTO_6495 ) ) ( not ( = ?AUTO_6494 ?AUTO_6495 ) ) ( ON ?AUTO_6495 ?AUTO_6494 ) ( ON ?AUTO_6493 ?AUTO_6495 ) ( CLEAR ?AUTO_6493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6493 ?AUTO_6495 )
      ( MAKE-ON ?AUTO_6488 ?AUTO_6489 )
      ( MAKE-ON-VERIFY ?AUTO_6488 ?AUTO_6489 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6498 - BLOCK
      ?AUTO_6499 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6498 ) ( CLEAR ?AUTO_6499 ) ( not ( = ?AUTO_6498 ?AUTO_6499 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6498 ?AUTO_6499 )
      ( MAKE-ON-VERIFY ?AUTO_6498 ?AUTO_6499 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6500 - BLOCK
      ?AUTO_6501 - BLOCK
    )
    :vars
    (
      ?AUTO_6502 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6501 ) ( not ( = ?AUTO_6500 ?AUTO_6501 ) ) ( ON ?AUTO_6500 ?AUTO_6502 ) ( CLEAR ?AUTO_6500 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6500 ?AUTO_6502 ) ) ( not ( = ?AUTO_6501 ?AUTO_6502 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6500 ?AUTO_6502 )
      ( MAKE-ON ?AUTO_6500 ?AUTO_6501 )
      ( MAKE-ON-VERIFY ?AUTO_6500 ?AUTO_6501 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6503 - BLOCK
      ?AUTO_6504 - BLOCK
    )
    :vars
    (
      ?AUTO_6505 - BLOCK
      ?AUTO_6506 - BLOCK
      ?AUTO_6507 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6504 ) ( not ( = ?AUTO_6503 ?AUTO_6504 ) ) ( ON ?AUTO_6503 ?AUTO_6505 ) ( CLEAR ?AUTO_6503 ) ( not ( = ?AUTO_6503 ?AUTO_6505 ) ) ( not ( = ?AUTO_6504 ?AUTO_6505 ) ) ( HOLDING ?AUTO_6506 ) ( CLEAR ?AUTO_6507 ) ( not ( = ?AUTO_6503 ?AUTO_6506 ) ) ( not ( = ?AUTO_6503 ?AUTO_6507 ) ) ( not ( = ?AUTO_6504 ?AUTO_6506 ) ) ( not ( = ?AUTO_6504 ?AUTO_6507 ) ) ( not ( = ?AUTO_6505 ?AUTO_6506 ) ) ( not ( = ?AUTO_6505 ?AUTO_6507 ) ) ( not ( = ?AUTO_6506 ?AUTO_6507 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6506 ?AUTO_6507 )
      ( MAKE-ON ?AUTO_6503 ?AUTO_6504 )
      ( MAKE-ON-VERIFY ?AUTO_6503 ?AUTO_6504 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6508 - BLOCK
      ?AUTO_6509 - BLOCK
    )
    :vars
    (
      ?AUTO_6510 - BLOCK
      ?AUTO_6511 - BLOCK
      ?AUTO_6512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6508 ?AUTO_6509 ) ) ( ON ?AUTO_6508 ?AUTO_6510 ) ( CLEAR ?AUTO_6508 ) ( not ( = ?AUTO_6508 ?AUTO_6510 ) ) ( not ( = ?AUTO_6509 ?AUTO_6510 ) ) ( CLEAR ?AUTO_6511 ) ( not ( = ?AUTO_6508 ?AUTO_6512 ) ) ( not ( = ?AUTO_6508 ?AUTO_6511 ) ) ( not ( = ?AUTO_6509 ?AUTO_6512 ) ) ( not ( = ?AUTO_6509 ?AUTO_6511 ) ) ( not ( = ?AUTO_6510 ?AUTO_6512 ) ) ( not ( = ?AUTO_6510 ?AUTO_6511 ) ) ( not ( = ?AUTO_6512 ?AUTO_6511 ) ) ( ON ?AUTO_6512 ?AUTO_6509 ) ( CLEAR ?AUTO_6512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6512 ?AUTO_6509 )
      ( MAKE-ON ?AUTO_6508 ?AUTO_6509 )
      ( MAKE-ON-VERIFY ?AUTO_6508 ?AUTO_6509 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6513 - BLOCK
      ?AUTO_6514 - BLOCK
    )
    :vars
    (
      ?AUTO_6517 - BLOCK
      ?AUTO_6515 - BLOCK
      ?AUTO_6516 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6513 ?AUTO_6514 ) ) ( not ( = ?AUTO_6513 ?AUTO_6517 ) ) ( not ( = ?AUTO_6514 ?AUTO_6517 ) ) ( CLEAR ?AUTO_6515 ) ( not ( = ?AUTO_6513 ?AUTO_6516 ) ) ( not ( = ?AUTO_6513 ?AUTO_6515 ) ) ( not ( = ?AUTO_6514 ?AUTO_6516 ) ) ( not ( = ?AUTO_6514 ?AUTO_6515 ) ) ( not ( = ?AUTO_6517 ?AUTO_6516 ) ) ( not ( = ?AUTO_6517 ?AUTO_6515 ) ) ( not ( = ?AUTO_6516 ?AUTO_6515 ) ) ( ON ?AUTO_6516 ?AUTO_6514 ) ( CLEAR ?AUTO_6516 ) ( HOLDING ?AUTO_6513 ) ( CLEAR ?AUTO_6517 ) )
    :subtasks
    ( ( !STACK ?AUTO_6513 ?AUTO_6517 )
      ( MAKE-ON ?AUTO_6513 ?AUTO_6514 )
      ( MAKE-ON-VERIFY ?AUTO_6513 ?AUTO_6514 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6518 - BLOCK
      ?AUTO_6519 - BLOCK
    )
    :vars
    (
      ?AUTO_6522 - BLOCK
      ?AUTO_6520 - BLOCK
      ?AUTO_6521 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6518 ?AUTO_6519 ) ) ( not ( = ?AUTO_6518 ?AUTO_6522 ) ) ( not ( = ?AUTO_6519 ?AUTO_6522 ) ) ( CLEAR ?AUTO_6520 ) ( not ( = ?AUTO_6518 ?AUTO_6521 ) ) ( not ( = ?AUTO_6518 ?AUTO_6520 ) ) ( not ( = ?AUTO_6519 ?AUTO_6521 ) ) ( not ( = ?AUTO_6519 ?AUTO_6520 ) ) ( not ( = ?AUTO_6522 ?AUTO_6521 ) ) ( not ( = ?AUTO_6522 ?AUTO_6520 ) ) ( not ( = ?AUTO_6521 ?AUTO_6520 ) ) ( ON ?AUTO_6521 ?AUTO_6519 ) ( CLEAR ?AUTO_6522 ) ( ON ?AUTO_6518 ?AUTO_6521 ) ( CLEAR ?AUTO_6518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6518 ?AUTO_6521 )
      ( MAKE-ON ?AUTO_6518 ?AUTO_6519 )
      ( MAKE-ON-VERIFY ?AUTO_6518 ?AUTO_6519 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6523 - BLOCK
      ?AUTO_6524 - BLOCK
    )
    :vars
    (
      ?AUTO_6527 - BLOCK
      ?AUTO_6525 - BLOCK
      ?AUTO_6526 - BLOCK
      ?AUTO_6528 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6523 ?AUTO_6524 ) ) ( not ( = ?AUTO_6523 ?AUTO_6527 ) ) ( not ( = ?AUTO_6524 ?AUTO_6527 ) ) ( CLEAR ?AUTO_6525 ) ( not ( = ?AUTO_6523 ?AUTO_6526 ) ) ( not ( = ?AUTO_6523 ?AUTO_6525 ) ) ( not ( = ?AUTO_6524 ?AUTO_6526 ) ) ( not ( = ?AUTO_6524 ?AUTO_6525 ) ) ( not ( = ?AUTO_6527 ?AUTO_6526 ) ) ( not ( = ?AUTO_6527 ?AUTO_6525 ) ) ( not ( = ?AUTO_6526 ?AUTO_6525 ) ) ( ON ?AUTO_6526 ?AUTO_6524 ) ( ON ?AUTO_6523 ?AUTO_6526 ) ( CLEAR ?AUTO_6523 ) ( HOLDING ?AUTO_6527 ) ( CLEAR ?AUTO_6528 ) ( not ( = ?AUTO_6523 ?AUTO_6528 ) ) ( not ( = ?AUTO_6524 ?AUTO_6528 ) ) ( not ( = ?AUTO_6527 ?AUTO_6528 ) ) ( not ( = ?AUTO_6525 ?AUTO_6528 ) ) ( not ( = ?AUTO_6526 ?AUTO_6528 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6527 ?AUTO_6528 )
      ( MAKE-ON ?AUTO_6523 ?AUTO_6524 )
      ( MAKE-ON-VERIFY ?AUTO_6523 ?AUTO_6524 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6549 - BLOCK
      ?AUTO_6550 - BLOCK
    )
    :vars
    (
      ?AUTO_6551 - BLOCK
      ?AUTO_6553 - BLOCK
      ?AUTO_6552 - BLOCK
      ?AUTO_6554 - BLOCK
      ?AUTO_6555 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6549 ?AUTO_6550 ) ) ( ON ?AUTO_6549 ?AUTO_6551 ) ( not ( = ?AUTO_6549 ?AUTO_6551 ) ) ( not ( = ?AUTO_6550 ?AUTO_6551 ) ) ( not ( = ?AUTO_6549 ?AUTO_6553 ) ) ( not ( = ?AUTO_6549 ?AUTO_6552 ) ) ( not ( = ?AUTO_6550 ?AUTO_6553 ) ) ( not ( = ?AUTO_6550 ?AUTO_6552 ) ) ( not ( = ?AUTO_6551 ?AUTO_6553 ) ) ( not ( = ?AUTO_6551 ?AUTO_6552 ) ) ( not ( = ?AUTO_6553 ?AUTO_6552 ) ) ( CLEAR ?AUTO_6554 ) ( not ( = ?AUTO_6549 ?AUTO_6554 ) ) ( not ( = ?AUTO_6550 ?AUTO_6554 ) ) ( not ( = ?AUTO_6551 ?AUTO_6554 ) ) ( not ( = ?AUTO_6553 ?AUTO_6554 ) ) ( not ( = ?AUTO_6552 ?AUTO_6554 ) ) ( ON ?AUTO_6552 ?AUTO_6550 ) ( CLEAR ?AUTO_6549 ) ( ON ?AUTO_6553 ?AUTO_6552 ) ( not ( = ?AUTO_6549 ?AUTO_6555 ) ) ( not ( = ?AUTO_6550 ?AUTO_6555 ) ) ( not ( = ?AUTO_6551 ?AUTO_6555 ) ) ( not ( = ?AUTO_6553 ?AUTO_6555 ) ) ( not ( = ?AUTO_6552 ?AUTO_6555 ) ) ( not ( = ?AUTO_6554 ?AUTO_6555 ) ) ( ON ?AUTO_6555 ?AUTO_6553 ) ( CLEAR ?AUTO_6555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6555 ?AUTO_6553 )
      ( MAKE-ON ?AUTO_6549 ?AUTO_6550 )
      ( MAKE-ON-VERIFY ?AUTO_6549 ?AUTO_6550 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6556 - BLOCK
      ?AUTO_6557 - BLOCK
    )
    :vars
    (
      ?AUTO_6558 - BLOCK
      ?AUTO_6561 - BLOCK
      ?AUTO_6559 - BLOCK
      ?AUTO_6562 - BLOCK
      ?AUTO_6560 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6556 ?AUTO_6557 ) ) ( ON ?AUTO_6556 ?AUTO_6558 ) ( not ( = ?AUTO_6556 ?AUTO_6558 ) ) ( not ( = ?AUTO_6557 ?AUTO_6558 ) ) ( not ( = ?AUTO_6556 ?AUTO_6561 ) ) ( not ( = ?AUTO_6556 ?AUTO_6559 ) ) ( not ( = ?AUTO_6557 ?AUTO_6561 ) ) ( not ( = ?AUTO_6557 ?AUTO_6559 ) ) ( not ( = ?AUTO_6558 ?AUTO_6561 ) ) ( not ( = ?AUTO_6558 ?AUTO_6559 ) ) ( not ( = ?AUTO_6561 ?AUTO_6559 ) ) ( not ( = ?AUTO_6556 ?AUTO_6562 ) ) ( not ( = ?AUTO_6557 ?AUTO_6562 ) ) ( not ( = ?AUTO_6558 ?AUTO_6562 ) ) ( not ( = ?AUTO_6561 ?AUTO_6562 ) ) ( not ( = ?AUTO_6559 ?AUTO_6562 ) ) ( ON ?AUTO_6559 ?AUTO_6557 ) ( CLEAR ?AUTO_6556 ) ( ON ?AUTO_6561 ?AUTO_6559 ) ( not ( = ?AUTO_6556 ?AUTO_6560 ) ) ( not ( = ?AUTO_6557 ?AUTO_6560 ) ) ( not ( = ?AUTO_6558 ?AUTO_6560 ) ) ( not ( = ?AUTO_6561 ?AUTO_6560 ) ) ( not ( = ?AUTO_6559 ?AUTO_6560 ) ) ( not ( = ?AUTO_6562 ?AUTO_6560 ) ) ( ON ?AUTO_6560 ?AUTO_6561 ) ( CLEAR ?AUTO_6560 ) ( HOLDING ?AUTO_6562 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6562 )
      ( MAKE-ON ?AUTO_6556 ?AUTO_6557 )
      ( MAKE-ON-VERIFY ?AUTO_6556 ?AUTO_6557 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6563 - BLOCK
      ?AUTO_6564 - BLOCK
    )
    :vars
    (
      ?AUTO_6568 - BLOCK
      ?AUTO_6565 - BLOCK
      ?AUTO_6567 - BLOCK
      ?AUTO_6566 - BLOCK
      ?AUTO_6569 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6563 ?AUTO_6564 ) ) ( ON ?AUTO_6563 ?AUTO_6568 ) ( not ( = ?AUTO_6563 ?AUTO_6568 ) ) ( not ( = ?AUTO_6564 ?AUTO_6568 ) ) ( not ( = ?AUTO_6563 ?AUTO_6565 ) ) ( not ( = ?AUTO_6563 ?AUTO_6567 ) ) ( not ( = ?AUTO_6564 ?AUTO_6565 ) ) ( not ( = ?AUTO_6564 ?AUTO_6567 ) ) ( not ( = ?AUTO_6568 ?AUTO_6565 ) ) ( not ( = ?AUTO_6568 ?AUTO_6567 ) ) ( not ( = ?AUTO_6565 ?AUTO_6567 ) ) ( not ( = ?AUTO_6563 ?AUTO_6566 ) ) ( not ( = ?AUTO_6564 ?AUTO_6566 ) ) ( not ( = ?AUTO_6568 ?AUTO_6566 ) ) ( not ( = ?AUTO_6565 ?AUTO_6566 ) ) ( not ( = ?AUTO_6567 ?AUTO_6566 ) ) ( ON ?AUTO_6567 ?AUTO_6564 ) ( CLEAR ?AUTO_6563 ) ( ON ?AUTO_6565 ?AUTO_6567 ) ( not ( = ?AUTO_6563 ?AUTO_6569 ) ) ( not ( = ?AUTO_6564 ?AUTO_6569 ) ) ( not ( = ?AUTO_6568 ?AUTO_6569 ) ) ( not ( = ?AUTO_6565 ?AUTO_6569 ) ) ( not ( = ?AUTO_6567 ?AUTO_6569 ) ) ( not ( = ?AUTO_6566 ?AUTO_6569 ) ) ( ON ?AUTO_6569 ?AUTO_6565 ) ( ON ?AUTO_6566 ?AUTO_6569 ) ( CLEAR ?AUTO_6566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6566 ?AUTO_6569 )
      ( MAKE-ON ?AUTO_6563 ?AUTO_6564 )
      ( MAKE-ON-VERIFY ?AUTO_6563 ?AUTO_6564 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6571 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6571 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6571 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6571 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6572 - BLOCK
    )
    :vars
    (
      ?AUTO_6573 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6572 ?AUTO_6573 ) ( CLEAR ?AUTO_6572 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6572 ?AUTO_6573 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6572 ?AUTO_6573 )
      ( MAKE-ON-TABLE ?AUTO_6572 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6572 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6574 - BLOCK
    )
    :vars
    (
      ?AUTO_6575 - BLOCK
      ?AUTO_6576 - BLOCK
      ?AUTO_6577 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6574 ?AUTO_6575 ) ( CLEAR ?AUTO_6574 ) ( not ( = ?AUTO_6574 ?AUTO_6575 ) ) ( HOLDING ?AUTO_6576 ) ( CLEAR ?AUTO_6577 ) ( not ( = ?AUTO_6574 ?AUTO_6576 ) ) ( not ( = ?AUTO_6574 ?AUTO_6577 ) ) ( not ( = ?AUTO_6575 ?AUTO_6576 ) ) ( not ( = ?AUTO_6575 ?AUTO_6577 ) ) ( not ( = ?AUTO_6576 ?AUTO_6577 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6576 ?AUTO_6577 )
      ( MAKE-ON-TABLE ?AUTO_6574 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6574 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6578 - BLOCK
    )
    :vars
    (
      ?AUTO_6579 - BLOCK
      ?AUTO_6581 - BLOCK
      ?AUTO_6580 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6578 ?AUTO_6579 ) ( not ( = ?AUTO_6578 ?AUTO_6579 ) ) ( CLEAR ?AUTO_6581 ) ( not ( = ?AUTO_6578 ?AUTO_6580 ) ) ( not ( = ?AUTO_6578 ?AUTO_6581 ) ) ( not ( = ?AUTO_6579 ?AUTO_6580 ) ) ( not ( = ?AUTO_6579 ?AUTO_6581 ) ) ( not ( = ?AUTO_6580 ?AUTO_6581 ) ) ( ON ?AUTO_6580 ?AUTO_6578 ) ( CLEAR ?AUTO_6580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6580 ?AUTO_6578 )
      ( MAKE-ON-TABLE ?AUTO_6578 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6578 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6582 - BLOCK
    )
    :vars
    (
      ?AUTO_6583 - BLOCK
      ?AUTO_6585 - BLOCK
      ?AUTO_6584 - BLOCK
      ?AUTO_6586 - BLOCK
      ?AUTO_6587 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6582 ?AUTO_6583 ) ( not ( = ?AUTO_6582 ?AUTO_6583 ) ) ( CLEAR ?AUTO_6585 ) ( not ( = ?AUTO_6582 ?AUTO_6584 ) ) ( not ( = ?AUTO_6582 ?AUTO_6585 ) ) ( not ( = ?AUTO_6583 ?AUTO_6584 ) ) ( not ( = ?AUTO_6583 ?AUTO_6585 ) ) ( not ( = ?AUTO_6584 ?AUTO_6585 ) ) ( ON ?AUTO_6584 ?AUTO_6582 ) ( CLEAR ?AUTO_6584 ) ( HOLDING ?AUTO_6586 ) ( CLEAR ?AUTO_6587 ) ( not ( = ?AUTO_6582 ?AUTO_6586 ) ) ( not ( = ?AUTO_6582 ?AUTO_6587 ) ) ( not ( = ?AUTO_6583 ?AUTO_6586 ) ) ( not ( = ?AUTO_6583 ?AUTO_6587 ) ) ( not ( = ?AUTO_6585 ?AUTO_6586 ) ) ( not ( = ?AUTO_6585 ?AUTO_6587 ) ) ( not ( = ?AUTO_6584 ?AUTO_6586 ) ) ( not ( = ?AUTO_6584 ?AUTO_6587 ) ) ( not ( = ?AUTO_6586 ?AUTO_6587 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6586 ?AUTO_6587 )
      ( MAKE-ON-TABLE ?AUTO_6582 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6582 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6610 - BLOCK
      ?AUTO_6611 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6610 ) ( CLEAR ?AUTO_6611 ) ( not ( = ?AUTO_6610 ?AUTO_6611 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6610 ?AUTO_6611 )
      ( MAKE-ON-VERIFY ?AUTO_6610 ?AUTO_6611 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6612 - BLOCK
      ?AUTO_6613 - BLOCK
    )
    :vars
    (
      ?AUTO_6614 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6613 ) ( not ( = ?AUTO_6612 ?AUTO_6613 ) ) ( ON ?AUTO_6612 ?AUTO_6614 ) ( CLEAR ?AUTO_6612 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6612 ?AUTO_6614 ) ) ( not ( = ?AUTO_6613 ?AUTO_6614 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6612 ?AUTO_6614 )
      ( MAKE-ON ?AUTO_6612 ?AUTO_6613 )
      ( MAKE-ON-VERIFY ?AUTO_6612 ?AUTO_6613 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6615 - BLOCK
      ?AUTO_6616 - BLOCK
    )
    :vars
    (
      ?AUTO_6617 - BLOCK
      ?AUTO_6618 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6616 ) ( not ( = ?AUTO_6615 ?AUTO_6616 ) ) ( ON ?AUTO_6615 ?AUTO_6617 ) ( CLEAR ?AUTO_6615 ) ( not ( = ?AUTO_6615 ?AUTO_6617 ) ) ( not ( = ?AUTO_6616 ?AUTO_6617 ) ) ( HOLDING ?AUTO_6618 ) ( not ( = ?AUTO_6615 ?AUTO_6618 ) ) ( not ( = ?AUTO_6616 ?AUTO_6618 ) ) ( not ( = ?AUTO_6617 ?AUTO_6618 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6618 )
      ( MAKE-ON ?AUTO_6615 ?AUTO_6616 )
      ( MAKE-ON-VERIFY ?AUTO_6615 ?AUTO_6616 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6619 - BLOCK
      ?AUTO_6620 - BLOCK
    )
    :vars
    (
      ?AUTO_6621 - BLOCK
      ?AUTO_6622 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6620 ) ( not ( = ?AUTO_6619 ?AUTO_6620 ) ) ( ON ?AUTO_6619 ?AUTO_6621 ) ( not ( = ?AUTO_6619 ?AUTO_6621 ) ) ( not ( = ?AUTO_6620 ?AUTO_6621 ) ) ( not ( = ?AUTO_6619 ?AUTO_6622 ) ) ( not ( = ?AUTO_6620 ?AUTO_6622 ) ) ( not ( = ?AUTO_6621 ?AUTO_6622 ) ) ( ON ?AUTO_6622 ?AUTO_6619 ) ( CLEAR ?AUTO_6622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6622 ?AUTO_6619 )
      ( MAKE-ON ?AUTO_6619 ?AUTO_6620 )
      ( MAKE-ON-VERIFY ?AUTO_6619 ?AUTO_6620 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6623 - BLOCK
      ?AUTO_6624 - BLOCK
    )
    :vars
    (
      ?AUTO_6625 - BLOCK
      ?AUTO_6626 - BLOCK
      ?AUTO_6627 - BLOCK
      ?AUTO_6628 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6624 ) ( not ( = ?AUTO_6623 ?AUTO_6624 ) ) ( ON ?AUTO_6623 ?AUTO_6625 ) ( not ( = ?AUTO_6623 ?AUTO_6625 ) ) ( not ( = ?AUTO_6624 ?AUTO_6625 ) ) ( not ( = ?AUTO_6623 ?AUTO_6626 ) ) ( not ( = ?AUTO_6624 ?AUTO_6626 ) ) ( not ( = ?AUTO_6625 ?AUTO_6626 ) ) ( ON ?AUTO_6626 ?AUTO_6623 ) ( CLEAR ?AUTO_6626 ) ( HOLDING ?AUTO_6627 ) ( CLEAR ?AUTO_6628 ) ( not ( = ?AUTO_6623 ?AUTO_6627 ) ) ( not ( = ?AUTO_6623 ?AUTO_6628 ) ) ( not ( = ?AUTO_6624 ?AUTO_6627 ) ) ( not ( = ?AUTO_6624 ?AUTO_6628 ) ) ( not ( = ?AUTO_6625 ?AUTO_6627 ) ) ( not ( = ?AUTO_6625 ?AUTO_6628 ) ) ( not ( = ?AUTO_6626 ?AUTO_6627 ) ) ( not ( = ?AUTO_6626 ?AUTO_6628 ) ) ( not ( = ?AUTO_6627 ?AUTO_6628 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6627 ?AUTO_6628 )
      ( MAKE-ON ?AUTO_6623 ?AUTO_6624 )
      ( MAKE-ON-VERIFY ?AUTO_6623 ?AUTO_6624 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6629 - BLOCK
      ?AUTO_6630 - BLOCK
    )
    :vars
    (
      ?AUTO_6631 - BLOCK
      ?AUTO_6632 - BLOCK
      ?AUTO_6634 - BLOCK
      ?AUTO_6633 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6630 ) ( not ( = ?AUTO_6629 ?AUTO_6630 ) ) ( ON ?AUTO_6629 ?AUTO_6631 ) ( not ( = ?AUTO_6629 ?AUTO_6631 ) ) ( not ( = ?AUTO_6630 ?AUTO_6631 ) ) ( not ( = ?AUTO_6629 ?AUTO_6632 ) ) ( not ( = ?AUTO_6630 ?AUTO_6632 ) ) ( not ( = ?AUTO_6631 ?AUTO_6632 ) ) ( ON ?AUTO_6632 ?AUTO_6629 ) ( CLEAR ?AUTO_6634 ) ( not ( = ?AUTO_6629 ?AUTO_6633 ) ) ( not ( = ?AUTO_6629 ?AUTO_6634 ) ) ( not ( = ?AUTO_6630 ?AUTO_6633 ) ) ( not ( = ?AUTO_6630 ?AUTO_6634 ) ) ( not ( = ?AUTO_6631 ?AUTO_6633 ) ) ( not ( = ?AUTO_6631 ?AUTO_6634 ) ) ( not ( = ?AUTO_6632 ?AUTO_6633 ) ) ( not ( = ?AUTO_6632 ?AUTO_6634 ) ) ( not ( = ?AUTO_6633 ?AUTO_6634 ) ) ( ON ?AUTO_6633 ?AUTO_6632 ) ( CLEAR ?AUTO_6633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6633 ?AUTO_6632 )
      ( MAKE-ON ?AUTO_6629 ?AUTO_6630 )
      ( MAKE-ON-VERIFY ?AUTO_6629 ?AUTO_6630 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6635 - BLOCK
      ?AUTO_6636 - BLOCK
    )
    :vars
    (
      ?AUTO_6637 - BLOCK
      ?AUTO_6638 - BLOCK
      ?AUTO_6640 - BLOCK
      ?AUTO_6639 - BLOCK
      ?AUTO_6641 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6635 ?AUTO_6636 ) ) ( ON ?AUTO_6635 ?AUTO_6637 ) ( not ( = ?AUTO_6635 ?AUTO_6637 ) ) ( not ( = ?AUTO_6636 ?AUTO_6637 ) ) ( not ( = ?AUTO_6635 ?AUTO_6638 ) ) ( not ( = ?AUTO_6636 ?AUTO_6638 ) ) ( not ( = ?AUTO_6637 ?AUTO_6638 ) ) ( ON ?AUTO_6638 ?AUTO_6635 ) ( CLEAR ?AUTO_6640 ) ( not ( = ?AUTO_6635 ?AUTO_6639 ) ) ( not ( = ?AUTO_6635 ?AUTO_6640 ) ) ( not ( = ?AUTO_6636 ?AUTO_6639 ) ) ( not ( = ?AUTO_6636 ?AUTO_6640 ) ) ( not ( = ?AUTO_6637 ?AUTO_6639 ) ) ( not ( = ?AUTO_6637 ?AUTO_6640 ) ) ( not ( = ?AUTO_6638 ?AUTO_6639 ) ) ( not ( = ?AUTO_6638 ?AUTO_6640 ) ) ( not ( = ?AUTO_6639 ?AUTO_6640 ) ) ( ON ?AUTO_6639 ?AUTO_6638 ) ( CLEAR ?AUTO_6639 ) ( HOLDING ?AUTO_6636 ) ( CLEAR ?AUTO_6641 ) ( not ( = ?AUTO_6635 ?AUTO_6641 ) ) ( not ( = ?AUTO_6636 ?AUTO_6641 ) ) ( not ( = ?AUTO_6637 ?AUTO_6641 ) ) ( not ( = ?AUTO_6638 ?AUTO_6641 ) ) ( not ( = ?AUTO_6640 ?AUTO_6641 ) ) ( not ( = ?AUTO_6639 ?AUTO_6641 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6636 ?AUTO_6641 )
      ( MAKE-ON ?AUTO_6635 ?AUTO_6636 )
      ( MAKE-ON-VERIFY ?AUTO_6635 ?AUTO_6636 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6646 - BLOCK
      ?AUTO_6647 - BLOCK
    )
    :vars
    (
      ?AUTO_6651 - BLOCK
      ?AUTO_6650 - BLOCK
      ?AUTO_6649 - BLOCK
      ?AUTO_6648 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6646 ?AUTO_6647 ) ) ( ON ?AUTO_6646 ?AUTO_6651 ) ( not ( = ?AUTO_6646 ?AUTO_6651 ) ) ( not ( = ?AUTO_6647 ?AUTO_6651 ) ) ( not ( = ?AUTO_6646 ?AUTO_6650 ) ) ( not ( = ?AUTO_6647 ?AUTO_6650 ) ) ( not ( = ?AUTO_6651 ?AUTO_6650 ) ) ( ON ?AUTO_6650 ?AUTO_6646 ) ( CLEAR ?AUTO_6650 ) ( CLEAR ?AUTO_6649 ) ( not ( = ?AUTO_6646 ?AUTO_6648 ) ) ( not ( = ?AUTO_6646 ?AUTO_6649 ) ) ( not ( = ?AUTO_6647 ?AUTO_6648 ) ) ( not ( = ?AUTO_6647 ?AUTO_6649 ) ) ( not ( = ?AUTO_6651 ?AUTO_6648 ) ) ( not ( = ?AUTO_6651 ?AUTO_6649 ) ) ( not ( = ?AUTO_6650 ?AUTO_6648 ) ) ( not ( = ?AUTO_6650 ?AUTO_6649 ) ) ( not ( = ?AUTO_6648 ?AUTO_6649 ) ) ( ON ?AUTO_6648 ?AUTO_6647 ) ( CLEAR ?AUTO_6648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6648 ?AUTO_6647 )
      ( MAKE-ON ?AUTO_6646 ?AUTO_6647 )
      ( MAKE-ON-VERIFY ?AUTO_6646 ?AUTO_6647 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6652 - BLOCK
      ?AUTO_6653 - BLOCK
    )
    :vars
    (
      ?AUTO_6656 - BLOCK
      ?AUTO_6657 - BLOCK
      ?AUTO_6654 - BLOCK
      ?AUTO_6655 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6652 ?AUTO_6653 ) ) ( ON ?AUTO_6652 ?AUTO_6656 ) ( not ( = ?AUTO_6652 ?AUTO_6656 ) ) ( not ( = ?AUTO_6653 ?AUTO_6656 ) ) ( not ( = ?AUTO_6652 ?AUTO_6657 ) ) ( not ( = ?AUTO_6653 ?AUTO_6657 ) ) ( not ( = ?AUTO_6656 ?AUTO_6657 ) ) ( CLEAR ?AUTO_6654 ) ( not ( = ?AUTO_6652 ?AUTO_6655 ) ) ( not ( = ?AUTO_6652 ?AUTO_6654 ) ) ( not ( = ?AUTO_6653 ?AUTO_6655 ) ) ( not ( = ?AUTO_6653 ?AUTO_6654 ) ) ( not ( = ?AUTO_6656 ?AUTO_6655 ) ) ( not ( = ?AUTO_6656 ?AUTO_6654 ) ) ( not ( = ?AUTO_6657 ?AUTO_6655 ) ) ( not ( = ?AUTO_6657 ?AUTO_6654 ) ) ( not ( = ?AUTO_6655 ?AUTO_6654 ) ) ( ON ?AUTO_6655 ?AUTO_6653 ) ( CLEAR ?AUTO_6655 ) ( HOLDING ?AUTO_6657 ) ( CLEAR ?AUTO_6652 ) )
    :subtasks
    ( ( !STACK ?AUTO_6657 ?AUTO_6652 )
      ( MAKE-ON ?AUTO_6652 ?AUTO_6653 )
      ( MAKE-ON-VERIFY ?AUTO_6652 ?AUTO_6653 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6664 - BLOCK
      ?AUTO_6665 - BLOCK
    )
    :vars
    (
      ?AUTO_6667 - BLOCK
      ?AUTO_6666 - BLOCK
      ?AUTO_6669 - BLOCK
      ?AUTO_6668 - BLOCK
      ?AUTO_6670 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6664 ?AUTO_6665 ) ) ( ON ?AUTO_6664 ?AUTO_6667 ) ( not ( = ?AUTO_6664 ?AUTO_6667 ) ) ( not ( = ?AUTO_6665 ?AUTO_6667 ) ) ( not ( = ?AUTO_6664 ?AUTO_6666 ) ) ( not ( = ?AUTO_6665 ?AUTO_6666 ) ) ( not ( = ?AUTO_6667 ?AUTO_6666 ) ) ( ON ?AUTO_6666 ?AUTO_6664 ) ( CLEAR ?AUTO_6666 ) ( CLEAR ?AUTO_6669 ) ( not ( = ?AUTO_6664 ?AUTO_6668 ) ) ( not ( = ?AUTO_6664 ?AUTO_6669 ) ) ( not ( = ?AUTO_6665 ?AUTO_6668 ) ) ( not ( = ?AUTO_6665 ?AUTO_6669 ) ) ( not ( = ?AUTO_6667 ?AUTO_6668 ) ) ( not ( = ?AUTO_6667 ?AUTO_6669 ) ) ( not ( = ?AUTO_6666 ?AUTO_6668 ) ) ( not ( = ?AUTO_6666 ?AUTO_6669 ) ) ( not ( = ?AUTO_6668 ?AUTO_6669 ) ) ( ON ?AUTO_6668 ?AUTO_6665 ) ( CLEAR ?AUTO_6668 ) ( HOLDING ?AUTO_6670 ) ( not ( = ?AUTO_6664 ?AUTO_6670 ) ) ( not ( = ?AUTO_6665 ?AUTO_6670 ) ) ( not ( = ?AUTO_6667 ?AUTO_6670 ) ) ( not ( = ?AUTO_6666 ?AUTO_6670 ) ) ( not ( = ?AUTO_6669 ?AUTO_6670 ) ) ( not ( = ?AUTO_6668 ?AUTO_6670 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6670 )
      ( MAKE-ON ?AUTO_6664 ?AUTO_6665 )
      ( MAKE-ON-VERIFY ?AUTO_6664 ?AUTO_6665 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6671 - BLOCK
      ?AUTO_6672 - BLOCK
    )
    :vars
    (
      ?AUTO_6676 - BLOCK
      ?AUTO_6674 - BLOCK
      ?AUTO_6673 - BLOCK
      ?AUTO_6677 - BLOCK
      ?AUTO_6675 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6671 ?AUTO_6672 ) ) ( ON ?AUTO_6671 ?AUTO_6676 ) ( not ( = ?AUTO_6671 ?AUTO_6676 ) ) ( not ( = ?AUTO_6672 ?AUTO_6676 ) ) ( not ( = ?AUTO_6671 ?AUTO_6674 ) ) ( not ( = ?AUTO_6672 ?AUTO_6674 ) ) ( not ( = ?AUTO_6676 ?AUTO_6674 ) ) ( ON ?AUTO_6674 ?AUTO_6671 ) ( CLEAR ?AUTO_6673 ) ( not ( = ?AUTO_6671 ?AUTO_6677 ) ) ( not ( = ?AUTO_6671 ?AUTO_6673 ) ) ( not ( = ?AUTO_6672 ?AUTO_6677 ) ) ( not ( = ?AUTO_6672 ?AUTO_6673 ) ) ( not ( = ?AUTO_6676 ?AUTO_6677 ) ) ( not ( = ?AUTO_6676 ?AUTO_6673 ) ) ( not ( = ?AUTO_6674 ?AUTO_6677 ) ) ( not ( = ?AUTO_6674 ?AUTO_6673 ) ) ( not ( = ?AUTO_6677 ?AUTO_6673 ) ) ( ON ?AUTO_6677 ?AUTO_6672 ) ( CLEAR ?AUTO_6677 ) ( not ( = ?AUTO_6671 ?AUTO_6675 ) ) ( not ( = ?AUTO_6672 ?AUTO_6675 ) ) ( not ( = ?AUTO_6676 ?AUTO_6675 ) ) ( not ( = ?AUTO_6674 ?AUTO_6675 ) ) ( not ( = ?AUTO_6673 ?AUTO_6675 ) ) ( not ( = ?AUTO_6677 ?AUTO_6675 ) ) ( ON ?AUTO_6675 ?AUTO_6674 ) ( CLEAR ?AUTO_6675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6675 ?AUTO_6674 )
      ( MAKE-ON ?AUTO_6671 ?AUTO_6672 )
      ( MAKE-ON-VERIFY ?AUTO_6671 ?AUTO_6672 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6678 - BLOCK
      ?AUTO_6679 - BLOCK
    )
    :vars
    (
      ?AUTO_6683 - BLOCK
      ?AUTO_6681 - BLOCK
      ?AUTO_6680 - BLOCK
      ?AUTO_6682 - BLOCK
      ?AUTO_6684 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6678 ?AUTO_6679 ) ) ( ON ?AUTO_6678 ?AUTO_6683 ) ( not ( = ?AUTO_6678 ?AUTO_6683 ) ) ( not ( = ?AUTO_6679 ?AUTO_6683 ) ) ( not ( = ?AUTO_6678 ?AUTO_6681 ) ) ( not ( = ?AUTO_6679 ?AUTO_6681 ) ) ( not ( = ?AUTO_6683 ?AUTO_6681 ) ) ( ON ?AUTO_6681 ?AUTO_6678 ) ( CLEAR ?AUTO_6680 ) ( not ( = ?AUTO_6678 ?AUTO_6682 ) ) ( not ( = ?AUTO_6678 ?AUTO_6680 ) ) ( not ( = ?AUTO_6679 ?AUTO_6682 ) ) ( not ( = ?AUTO_6679 ?AUTO_6680 ) ) ( not ( = ?AUTO_6683 ?AUTO_6682 ) ) ( not ( = ?AUTO_6683 ?AUTO_6680 ) ) ( not ( = ?AUTO_6681 ?AUTO_6682 ) ) ( not ( = ?AUTO_6681 ?AUTO_6680 ) ) ( not ( = ?AUTO_6682 ?AUTO_6680 ) ) ( not ( = ?AUTO_6678 ?AUTO_6684 ) ) ( not ( = ?AUTO_6679 ?AUTO_6684 ) ) ( not ( = ?AUTO_6683 ?AUTO_6684 ) ) ( not ( = ?AUTO_6681 ?AUTO_6684 ) ) ( not ( = ?AUTO_6680 ?AUTO_6684 ) ) ( not ( = ?AUTO_6682 ?AUTO_6684 ) ) ( ON ?AUTO_6684 ?AUTO_6681 ) ( CLEAR ?AUTO_6684 ) ( HOLDING ?AUTO_6682 ) ( CLEAR ?AUTO_6679 ) )
    :subtasks
    ( ( !STACK ?AUTO_6682 ?AUTO_6679 )
      ( MAKE-ON ?AUTO_6678 ?AUTO_6679 )
      ( MAKE-ON-VERIFY ?AUTO_6678 ?AUTO_6679 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6685 - BLOCK
      ?AUTO_6686 - BLOCK
    )
    :vars
    (
      ?AUTO_6691 - BLOCK
      ?AUTO_6688 - BLOCK
      ?AUTO_6687 - BLOCK
      ?AUTO_6690 - BLOCK
      ?AUTO_6689 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6685 ?AUTO_6686 ) ) ( ON ?AUTO_6685 ?AUTO_6691 ) ( not ( = ?AUTO_6685 ?AUTO_6691 ) ) ( not ( = ?AUTO_6686 ?AUTO_6691 ) ) ( not ( = ?AUTO_6685 ?AUTO_6688 ) ) ( not ( = ?AUTO_6686 ?AUTO_6688 ) ) ( not ( = ?AUTO_6691 ?AUTO_6688 ) ) ( ON ?AUTO_6688 ?AUTO_6685 ) ( CLEAR ?AUTO_6687 ) ( not ( = ?AUTO_6685 ?AUTO_6690 ) ) ( not ( = ?AUTO_6685 ?AUTO_6687 ) ) ( not ( = ?AUTO_6686 ?AUTO_6690 ) ) ( not ( = ?AUTO_6686 ?AUTO_6687 ) ) ( not ( = ?AUTO_6691 ?AUTO_6690 ) ) ( not ( = ?AUTO_6691 ?AUTO_6687 ) ) ( not ( = ?AUTO_6688 ?AUTO_6690 ) ) ( not ( = ?AUTO_6688 ?AUTO_6687 ) ) ( not ( = ?AUTO_6690 ?AUTO_6687 ) ) ( not ( = ?AUTO_6685 ?AUTO_6689 ) ) ( not ( = ?AUTO_6686 ?AUTO_6689 ) ) ( not ( = ?AUTO_6691 ?AUTO_6689 ) ) ( not ( = ?AUTO_6688 ?AUTO_6689 ) ) ( not ( = ?AUTO_6687 ?AUTO_6689 ) ) ( not ( = ?AUTO_6690 ?AUTO_6689 ) ) ( ON ?AUTO_6689 ?AUTO_6688 ) ( CLEAR ?AUTO_6686 ) ( ON ?AUTO_6690 ?AUTO_6689 ) ( CLEAR ?AUTO_6690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6690 ?AUTO_6689 )
      ( MAKE-ON ?AUTO_6685 ?AUTO_6686 )
      ( MAKE-ON-VERIFY ?AUTO_6685 ?AUTO_6686 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6692 - BLOCK
      ?AUTO_6693 - BLOCK
    )
    :vars
    (
      ?AUTO_6698 - BLOCK
      ?AUTO_6694 - BLOCK
      ?AUTO_6697 - BLOCK
      ?AUTO_6696 - BLOCK
      ?AUTO_6695 - BLOCK
      ?AUTO_6699 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6692 ?AUTO_6693 ) ) ( ON ?AUTO_6692 ?AUTO_6698 ) ( not ( = ?AUTO_6692 ?AUTO_6698 ) ) ( not ( = ?AUTO_6693 ?AUTO_6698 ) ) ( not ( = ?AUTO_6692 ?AUTO_6694 ) ) ( not ( = ?AUTO_6693 ?AUTO_6694 ) ) ( not ( = ?AUTO_6698 ?AUTO_6694 ) ) ( ON ?AUTO_6694 ?AUTO_6692 ) ( CLEAR ?AUTO_6697 ) ( not ( = ?AUTO_6692 ?AUTO_6696 ) ) ( not ( = ?AUTO_6692 ?AUTO_6697 ) ) ( not ( = ?AUTO_6693 ?AUTO_6696 ) ) ( not ( = ?AUTO_6693 ?AUTO_6697 ) ) ( not ( = ?AUTO_6698 ?AUTO_6696 ) ) ( not ( = ?AUTO_6698 ?AUTO_6697 ) ) ( not ( = ?AUTO_6694 ?AUTO_6696 ) ) ( not ( = ?AUTO_6694 ?AUTO_6697 ) ) ( not ( = ?AUTO_6696 ?AUTO_6697 ) ) ( not ( = ?AUTO_6692 ?AUTO_6695 ) ) ( not ( = ?AUTO_6693 ?AUTO_6695 ) ) ( not ( = ?AUTO_6698 ?AUTO_6695 ) ) ( not ( = ?AUTO_6694 ?AUTO_6695 ) ) ( not ( = ?AUTO_6697 ?AUTO_6695 ) ) ( not ( = ?AUTO_6696 ?AUTO_6695 ) ) ( ON ?AUTO_6695 ?AUTO_6694 ) ( CLEAR ?AUTO_6693 ) ( ON ?AUTO_6696 ?AUTO_6695 ) ( CLEAR ?AUTO_6696 ) ( HOLDING ?AUTO_6699 ) ( not ( = ?AUTO_6692 ?AUTO_6699 ) ) ( not ( = ?AUTO_6693 ?AUTO_6699 ) ) ( not ( = ?AUTO_6698 ?AUTO_6699 ) ) ( not ( = ?AUTO_6694 ?AUTO_6699 ) ) ( not ( = ?AUTO_6697 ?AUTO_6699 ) ) ( not ( = ?AUTO_6696 ?AUTO_6699 ) ) ( not ( = ?AUTO_6695 ?AUTO_6699 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6699 )
      ( MAKE-ON ?AUTO_6692 ?AUTO_6693 )
      ( MAKE-ON-VERIFY ?AUTO_6692 ?AUTO_6693 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6700 - BLOCK
      ?AUTO_6701 - BLOCK
    )
    :vars
    (
      ?AUTO_6705 - BLOCK
      ?AUTO_6703 - BLOCK
      ?AUTO_6706 - BLOCK
      ?AUTO_6704 - BLOCK
      ?AUTO_6702 - BLOCK
      ?AUTO_6707 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6700 ?AUTO_6701 ) ) ( ON ?AUTO_6700 ?AUTO_6705 ) ( not ( = ?AUTO_6700 ?AUTO_6705 ) ) ( not ( = ?AUTO_6701 ?AUTO_6705 ) ) ( not ( = ?AUTO_6700 ?AUTO_6703 ) ) ( not ( = ?AUTO_6701 ?AUTO_6703 ) ) ( not ( = ?AUTO_6705 ?AUTO_6703 ) ) ( ON ?AUTO_6703 ?AUTO_6700 ) ( CLEAR ?AUTO_6706 ) ( not ( = ?AUTO_6700 ?AUTO_6704 ) ) ( not ( = ?AUTO_6700 ?AUTO_6706 ) ) ( not ( = ?AUTO_6701 ?AUTO_6704 ) ) ( not ( = ?AUTO_6701 ?AUTO_6706 ) ) ( not ( = ?AUTO_6705 ?AUTO_6704 ) ) ( not ( = ?AUTO_6705 ?AUTO_6706 ) ) ( not ( = ?AUTO_6703 ?AUTO_6704 ) ) ( not ( = ?AUTO_6703 ?AUTO_6706 ) ) ( not ( = ?AUTO_6704 ?AUTO_6706 ) ) ( not ( = ?AUTO_6700 ?AUTO_6702 ) ) ( not ( = ?AUTO_6701 ?AUTO_6702 ) ) ( not ( = ?AUTO_6705 ?AUTO_6702 ) ) ( not ( = ?AUTO_6703 ?AUTO_6702 ) ) ( not ( = ?AUTO_6706 ?AUTO_6702 ) ) ( not ( = ?AUTO_6704 ?AUTO_6702 ) ) ( ON ?AUTO_6702 ?AUTO_6703 ) ( ON ?AUTO_6704 ?AUTO_6702 ) ( CLEAR ?AUTO_6704 ) ( not ( = ?AUTO_6700 ?AUTO_6707 ) ) ( not ( = ?AUTO_6701 ?AUTO_6707 ) ) ( not ( = ?AUTO_6705 ?AUTO_6707 ) ) ( not ( = ?AUTO_6703 ?AUTO_6707 ) ) ( not ( = ?AUTO_6706 ?AUTO_6707 ) ) ( not ( = ?AUTO_6704 ?AUTO_6707 ) ) ( not ( = ?AUTO_6702 ?AUTO_6707 ) ) ( ON ?AUTO_6707 ?AUTO_6701 ) ( CLEAR ?AUTO_6707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6707 ?AUTO_6701 )
      ( MAKE-ON ?AUTO_6700 ?AUTO_6701 )
      ( MAKE-ON-VERIFY ?AUTO_6700 ?AUTO_6701 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6708 - BLOCK
      ?AUTO_6709 - BLOCK
    )
    :vars
    (
      ?AUTO_6710 - BLOCK
      ?AUTO_6713 - BLOCK
      ?AUTO_6715 - BLOCK
      ?AUTO_6714 - BLOCK
      ?AUTO_6712 - BLOCK
      ?AUTO_6711 - BLOCK
      ?AUTO_6716 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6708 ?AUTO_6709 ) ) ( ON ?AUTO_6708 ?AUTO_6710 ) ( not ( = ?AUTO_6708 ?AUTO_6710 ) ) ( not ( = ?AUTO_6709 ?AUTO_6710 ) ) ( not ( = ?AUTO_6708 ?AUTO_6713 ) ) ( not ( = ?AUTO_6709 ?AUTO_6713 ) ) ( not ( = ?AUTO_6710 ?AUTO_6713 ) ) ( ON ?AUTO_6713 ?AUTO_6708 ) ( CLEAR ?AUTO_6715 ) ( not ( = ?AUTO_6708 ?AUTO_6714 ) ) ( not ( = ?AUTO_6708 ?AUTO_6715 ) ) ( not ( = ?AUTO_6709 ?AUTO_6714 ) ) ( not ( = ?AUTO_6709 ?AUTO_6715 ) ) ( not ( = ?AUTO_6710 ?AUTO_6714 ) ) ( not ( = ?AUTO_6710 ?AUTO_6715 ) ) ( not ( = ?AUTO_6713 ?AUTO_6714 ) ) ( not ( = ?AUTO_6713 ?AUTO_6715 ) ) ( not ( = ?AUTO_6714 ?AUTO_6715 ) ) ( not ( = ?AUTO_6708 ?AUTO_6712 ) ) ( not ( = ?AUTO_6709 ?AUTO_6712 ) ) ( not ( = ?AUTO_6710 ?AUTO_6712 ) ) ( not ( = ?AUTO_6713 ?AUTO_6712 ) ) ( not ( = ?AUTO_6715 ?AUTO_6712 ) ) ( not ( = ?AUTO_6714 ?AUTO_6712 ) ) ( ON ?AUTO_6712 ?AUTO_6713 ) ( ON ?AUTO_6714 ?AUTO_6712 ) ( CLEAR ?AUTO_6714 ) ( not ( = ?AUTO_6708 ?AUTO_6711 ) ) ( not ( = ?AUTO_6709 ?AUTO_6711 ) ) ( not ( = ?AUTO_6710 ?AUTO_6711 ) ) ( not ( = ?AUTO_6713 ?AUTO_6711 ) ) ( not ( = ?AUTO_6715 ?AUTO_6711 ) ) ( not ( = ?AUTO_6714 ?AUTO_6711 ) ) ( not ( = ?AUTO_6712 ?AUTO_6711 ) ) ( ON ?AUTO_6711 ?AUTO_6709 ) ( CLEAR ?AUTO_6711 ) ( HOLDING ?AUTO_6716 ) ( not ( = ?AUTO_6708 ?AUTO_6716 ) ) ( not ( = ?AUTO_6709 ?AUTO_6716 ) ) ( not ( = ?AUTO_6710 ?AUTO_6716 ) ) ( not ( = ?AUTO_6713 ?AUTO_6716 ) ) ( not ( = ?AUTO_6715 ?AUTO_6716 ) ) ( not ( = ?AUTO_6714 ?AUTO_6716 ) ) ( not ( = ?AUTO_6712 ?AUTO_6716 ) ) ( not ( = ?AUTO_6711 ?AUTO_6716 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6716 )
      ( MAKE-ON ?AUTO_6708 ?AUTO_6709 )
      ( MAKE-ON-VERIFY ?AUTO_6708 ?AUTO_6709 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6717 - BLOCK
      ?AUTO_6718 - BLOCK
    )
    :vars
    (
      ?AUTO_6724 - BLOCK
      ?AUTO_6725 - BLOCK
      ?AUTO_6723 - BLOCK
      ?AUTO_6722 - BLOCK
      ?AUTO_6719 - BLOCK
      ?AUTO_6720 - BLOCK
      ?AUTO_6721 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6717 ?AUTO_6718 ) ) ( ON ?AUTO_6717 ?AUTO_6724 ) ( not ( = ?AUTO_6717 ?AUTO_6724 ) ) ( not ( = ?AUTO_6718 ?AUTO_6724 ) ) ( not ( = ?AUTO_6717 ?AUTO_6725 ) ) ( not ( = ?AUTO_6718 ?AUTO_6725 ) ) ( not ( = ?AUTO_6724 ?AUTO_6725 ) ) ( ON ?AUTO_6725 ?AUTO_6717 ) ( CLEAR ?AUTO_6723 ) ( not ( = ?AUTO_6717 ?AUTO_6722 ) ) ( not ( = ?AUTO_6717 ?AUTO_6723 ) ) ( not ( = ?AUTO_6718 ?AUTO_6722 ) ) ( not ( = ?AUTO_6718 ?AUTO_6723 ) ) ( not ( = ?AUTO_6724 ?AUTO_6722 ) ) ( not ( = ?AUTO_6724 ?AUTO_6723 ) ) ( not ( = ?AUTO_6725 ?AUTO_6722 ) ) ( not ( = ?AUTO_6725 ?AUTO_6723 ) ) ( not ( = ?AUTO_6722 ?AUTO_6723 ) ) ( not ( = ?AUTO_6717 ?AUTO_6719 ) ) ( not ( = ?AUTO_6718 ?AUTO_6719 ) ) ( not ( = ?AUTO_6724 ?AUTO_6719 ) ) ( not ( = ?AUTO_6725 ?AUTO_6719 ) ) ( not ( = ?AUTO_6723 ?AUTO_6719 ) ) ( not ( = ?AUTO_6722 ?AUTO_6719 ) ) ( ON ?AUTO_6719 ?AUTO_6725 ) ( ON ?AUTO_6722 ?AUTO_6719 ) ( CLEAR ?AUTO_6722 ) ( not ( = ?AUTO_6717 ?AUTO_6720 ) ) ( not ( = ?AUTO_6718 ?AUTO_6720 ) ) ( not ( = ?AUTO_6724 ?AUTO_6720 ) ) ( not ( = ?AUTO_6725 ?AUTO_6720 ) ) ( not ( = ?AUTO_6723 ?AUTO_6720 ) ) ( not ( = ?AUTO_6722 ?AUTO_6720 ) ) ( not ( = ?AUTO_6719 ?AUTO_6720 ) ) ( ON ?AUTO_6720 ?AUTO_6718 ) ( not ( = ?AUTO_6717 ?AUTO_6721 ) ) ( not ( = ?AUTO_6718 ?AUTO_6721 ) ) ( not ( = ?AUTO_6724 ?AUTO_6721 ) ) ( not ( = ?AUTO_6725 ?AUTO_6721 ) ) ( not ( = ?AUTO_6723 ?AUTO_6721 ) ) ( not ( = ?AUTO_6722 ?AUTO_6721 ) ) ( not ( = ?AUTO_6719 ?AUTO_6721 ) ) ( not ( = ?AUTO_6720 ?AUTO_6721 ) ) ( ON ?AUTO_6721 ?AUTO_6720 ) ( CLEAR ?AUTO_6721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6721 ?AUTO_6720 )
      ( MAKE-ON ?AUTO_6717 ?AUTO_6718 )
      ( MAKE-ON-VERIFY ?AUTO_6717 ?AUTO_6718 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6726 - BLOCK
      ?AUTO_6727 - BLOCK
    )
    :vars
    (
      ?AUTO_6734 - BLOCK
      ?AUTO_6733 - BLOCK
      ?AUTO_6729 - BLOCK
      ?AUTO_6728 - BLOCK
      ?AUTO_6731 - BLOCK
      ?AUTO_6730 - BLOCK
      ?AUTO_6732 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6726 ?AUTO_6727 ) ) ( ON ?AUTO_6726 ?AUTO_6734 ) ( not ( = ?AUTO_6726 ?AUTO_6734 ) ) ( not ( = ?AUTO_6727 ?AUTO_6734 ) ) ( not ( = ?AUTO_6726 ?AUTO_6733 ) ) ( not ( = ?AUTO_6727 ?AUTO_6733 ) ) ( not ( = ?AUTO_6734 ?AUTO_6733 ) ) ( ON ?AUTO_6733 ?AUTO_6726 ) ( not ( = ?AUTO_6726 ?AUTO_6729 ) ) ( not ( = ?AUTO_6726 ?AUTO_6728 ) ) ( not ( = ?AUTO_6727 ?AUTO_6729 ) ) ( not ( = ?AUTO_6727 ?AUTO_6728 ) ) ( not ( = ?AUTO_6734 ?AUTO_6729 ) ) ( not ( = ?AUTO_6734 ?AUTO_6728 ) ) ( not ( = ?AUTO_6733 ?AUTO_6729 ) ) ( not ( = ?AUTO_6733 ?AUTO_6728 ) ) ( not ( = ?AUTO_6729 ?AUTO_6728 ) ) ( not ( = ?AUTO_6726 ?AUTO_6731 ) ) ( not ( = ?AUTO_6727 ?AUTO_6731 ) ) ( not ( = ?AUTO_6734 ?AUTO_6731 ) ) ( not ( = ?AUTO_6733 ?AUTO_6731 ) ) ( not ( = ?AUTO_6728 ?AUTO_6731 ) ) ( not ( = ?AUTO_6729 ?AUTO_6731 ) ) ( ON ?AUTO_6731 ?AUTO_6733 ) ( ON ?AUTO_6729 ?AUTO_6731 ) ( CLEAR ?AUTO_6729 ) ( not ( = ?AUTO_6726 ?AUTO_6730 ) ) ( not ( = ?AUTO_6727 ?AUTO_6730 ) ) ( not ( = ?AUTO_6734 ?AUTO_6730 ) ) ( not ( = ?AUTO_6733 ?AUTO_6730 ) ) ( not ( = ?AUTO_6728 ?AUTO_6730 ) ) ( not ( = ?AUTO_6729 ?AUTO_6730 ) ) ( not ( = ?AUTO_6731 ?AUTO_6730 ) ) ( ON ?AUTO_6730 ?AUTO_6727 ) ( not ( = ?AUTO_6726 ?AUTO_6732 ) ) ( not ( = ?AUTO_6727 ?AUTO_6732 ) ) ( not ( = ?AUTO_6734 ?AUTO_6732 ) ) ( not ( = ?AUTO_6733 ?AUTO_6732 ) ) ( not ( = ?AUTO_6728 ?AUTO_6732 ) ) ( not ( = ?AUTO_6729 ?AUTO_6732 ) ) ( not ( = ?AUTO_6731 ?AUTO_6732 ) ) ( not ( = ?AUTO_6730 ?AUTO_6732 ) ) ( ON ?AUTO_6732 ?AUTO_6730 ) ( CLEAR ?AUTO_6732 ) ( HOLDING ?AUTO_6728 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6728 )
      ( MAKE-ON ?AUTO_6726 ?AUTO_6727 )
      ( MAKE-ON-VERIFY ?AUTO_6726 ?AUTO_6727 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6735 - BLOCK
      ?AUTO_6736 - BLOCK
    )
    :vars
    (
      ?AUTO_6741 - BLOCK
      ?AUTO_6743 - BLOCK
      ?AUTO_6742 - BLOCK
      ?AUTO_6740 - BLOCK
      ?AUTO_6737 - BLOCK
      ?AUTO_6738 - BLOCK
      ?AUTO_6739 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6735 ?AUTO_6736 ) ) ( ON ?AUTO_6735 ?AUTO_6741 ) ( not ( = ?AUTO_6735 ?AUTO_6741 ) ) ( not ( = ?AUTO_6736 ?AUTO_6741 ) ) ( not ( = ?AUTO_6735 ?AUTO_6743 ) ) ( not ( = ?AUTO_6736 ?AUTO_6743 ) ) ( not ( = ?AUTO_6741 ?AUTO_6743 ) ) ( ON ?AUTO_6743 ?AUTO_6735 ) ( not ( = ?AUTO_6735 ?AUTO_6742 ) ) ( not ( = ?AUTO_6735 ?AUTO_6740 ) ) ( not ( = ?AUTO_6736 ?AUTO_6742 ) ) ( not ( = ?AUTO_6736 ?AUTO_6740 ) ) ( not ( = ?AUTO_6741 ?AUTO_6742 ) ) ( not ( = ?AUTO_6741 ?AUTO_6740 ) ) ( not ( = ?AUTO_6743 ?AUTO_6742 ) ) ( not ( = ?AUTO_6743 ?AUTO_6740 ) ) ( not ( = ?AUTO_6742 ?AUTO_6740 ) ) ( not ( = ?AUTO_6735 ?AUTO_6737 ) ) ( not ( = ?AUTO_6736 ?AUTO_6737 ) ) ( not ( = ?AUTO_6741 ?AUTO_6737 ) ) ( not ( = ?AUTO_6743 ?AUTO_6737 ) ) ( not ( = ?AUTO_6740 ?AUTO_6737 ) ) ( not ( = ?AUTO_6742 ?AUTO_6737 ) ) ( ON ?AUTO_6737 ?AUTO_6743 ) ( ON ?AUTO_6742 ?AUTO_6737 ) ( CLEAR ?AUTO_6742 ) ( not ( = ?AUTO_6735 ?AUTO_6738 ) ) ( not ( = ?AUTO_6736 ?AUTO_6738 ) ) ( not ( = ?AUTO_6741 ?AUTO_6738 ) ) ( not ( = ?AUTO_6743 ?AUTO_6738 ) ) ( not ( = ?AUTO_6740 ?AUTO_6738 ) ) ( not ( = ?AUTO_6742 ?AUTO_6738 ) ) ( not ( = ?AUTO_6737 ?AUTO_6738 ) ) ( ON ?AUTO_6738 ?AUTO_6736 ) ( not ( = ?AUTO_6735 ?AUTO_6739 ) ) ( not ( = ?AUTO_6736 ?AUTO_6739 ) ) ( not ( = ?AUTO_6741 ?AUTO_6739 ) ) ( not ( = ?AUTO_6743 ?AUTO_6739 ) ) ( not ( = ?AUTO_6740 ?AUTO_6739 ) ) ( not ( = ?AUTO_6742 ?AUTO_6739 ) ) ( not ( = ?AUTO_6737 ?AUTO_6739 ) ) ( not ( = ?AUTO_6738 ?AUTO_6739 ) ) ( ON ?AUTO_6739 ?AUTO_6738 ) ( ON ?AUTO_6740 ?AUTO_6739 ) ( CLEAR ?AUTO_6740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6740 ?AUTO_6739 )
      ( MAKE-ON ?AUTO_6735 ?AUTO_6736 )
      ( MAKE-ON-VERIFY ?AUTO_6735 ?AUTO_6736 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6746 - BLOCK
      ?AUTO_6747 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6746 ) ( CLEAR ?AUTO_6747 ) ( not ( = ?AUTO_6746 ?AUTO_6747 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6746 ?AUTO_6747 )
      ( MAKE-ON-VERIFY ?AUTO_6746 ?AUTO_6747 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6748 - BLOCK
      ?AUTO_6749 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6749 ) ( not ( = ?AUTO_6748 ?AUTO_6749 ) ) ( ON-TABLE ?AUTO_6748 ) ( CLEAR ?AUTO_6748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6748 )
      ( MAKE-ON ?AUTO_6748 ?AUTO_6749 )
      ( MAKE-ON-VERIFY ?AUTO_6748 ?AUTO_6749 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6750 - BLOCK
      ?AUTO_6751 - BLOCK
    )
    :vars
    (
      ?AUTO_6752 - BLOCK
      ?AUTO_6753 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6751 ) ( not ( = ?AUTO_6750 ?AUTO_6751 ) ) ( ON-TABLE ?AUTO_6750 ) ( CLEAR ?AUTO_6750 ) ( HOLDING ?AUTO_6752 ) ( CLEAR ?AUTO_6753 ) ( not ( = ?AUTO_6750 ?AUTO_6752 ) ) ( not ( = ?AUTO_6750 ?AUTO_6753 ) ) ( not ( = ?AUTO_6751 ?AUTO_6752 ) ) ( not ( = ?AUTO_6751 ?AUTO_6753 ) ) ( not ( = ?AUTO_6752 ?AUTO_6753 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6752 ?AUTO_6753 )
      ( MAKE-ON ?AUTO_6750 ?AUTO_6751 )
      ( MAKE-ON-VERIFY ?AUTO_6750 ?AUTO_6751 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6754 - BLOCK
      ?AUTO_6755 - BLOCK
    )
    :vars
    (
      ?AUTO_6756 - BLOCK
      ?AUTO_6757 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6755 ) ( not ( = ?AUTO_6754 ?AUTO_6755 ) ) ( ON-TABLE ?AUTO_6754 ) ( CLEAR ?AUTO_6756 ) ( not ( = ?AUTO_6754 ?AUTO_6757 ) ) ( not ( = ?AUTO_6754 ?AUTO_6756 ) ) ( not ( = ?AUTO_6755 ?AUTO_6757 ) ) ( not ( = ?AUTO_6755 ?AUTO_6756 ) ) ( not ( = ?AUTO_6757 ?AUTO_6756 ) ) ( ON ?AUTO_6757 ?AUTO_6754 ) ( CLEAR ?AUTO_6757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6757 ?AUTO_6754 )
      ( MAKE-ON ?AUTO_6754 ?AUTO_6755 )
      ( MAKE-ON-VERIFY ?AUTO_6754 ?AUTO_6755 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6758 - BLOCK
      ?AUTO_6759 - BLOCK
    )
    :vars
    (
      ?AUTO_6761 - BLOCK
      ?AUTO_6760 - BLOCK
      ?AUTO_6762 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6759 ) ( not ( = ?AUTO_6758 ?AUTO_6759 ) ) ( ON-TABLE ?AUTO_6758 ) ( CLEAR ?AUTO_6761 ) ( not ( = ?AUTO_6758 ?AUTO_6760 ) ) ( not ( = ?AUTO_6758 ?AUTO_6761 ) ) ( not ( = ?AUTO_6759 ?AUTO_6760 ) ) ( not ( = ?AUTO_6759 ?AUTO_6761 ) ) ( not ( = ?AUTO_6760 ?AUTO_6761 ) ) ( ON ?AUTO_6760 ?AUTO_6758 ) ( CLEAR ?AUTO_6760 ) ( HOLDING ?AUTO_6762 ) ( not ( = ?AUTO_6758 ?AUTO_6762 ) ) ( not ( = ?AUTO_6759 ?AUTO_6762 ) ) ( not ( = ?AUTO_6761 ?AUTO_6762 ) ) ( not ( = ?AUTO_6760 ?AUTO_6762 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6762 )
      ( MAKE-ON ?AUTO_6758 ?AUTO_6759 )
      ( MAKE-ON-VERIFY ?AUTO_6758 ?AUTO_6759 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6763 - BLOCK
      ?AUTO_6764 - BLOCK
    )
    :vars
    (
      ?AUTO_6765 - BLOCK
      ?AUTO_6766 - BLOCK
      ?AUTO_6767 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6764 ) ( not ( = ?AUTO_6763 ?AUTO_6764 ) ) ( ON-TABLE ?AUTO_6763 ) ( CLEAR ?AUTO_6765 ) ( not ( = ?AUTO_6763 ?AUTO_6766 ) ) ( not ( = ?AUTO_6763 ?AUTO_6765 ) ) ( not ( = ?AUTO_6764 ?AUTO_6766 ) ) ( not ( = ?AUTO_6764 ?AUTO_6765 ) ) ( not ( = ?AUTO_6766 ?AUTO_6765 ) ) ( ON ?AUTO_6766 ?AUTO_6763 ) ( not ( = ?AUTO_6763 ?AUTO_6767 ) ) ( not ( = ?AUTO_6764 ?AUTO_6767 ) ) ( not ( = ?AUTO_6765 ?AUTO_6767 ) ) ( not ( = ?AUTO_6766 ?AUTO_6767 ) ) ( ON ?AUTO_6767 ?AUTO_6766 ) ( CLEAR ?AUTO_6767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6767 ?AUTO_6766 )
      ( MAKE-ON ?AUTO_6763 ?AUTO_6764 )
      ( MAKE-ON-VERIFY ?AUTO_6763 ?AUTO_6764 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6768 - BLOCK
      ?AUTO_6769 - BLOCK
    )
    :vars
    (
      ?AUTO_6771 - BLOCK
      ?AUTO_6770 - BLOCK
      ?AUTO_6772 - BLOCK
      ?AUTO_6773 - BLOCK
      ?AUTO_6774 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6769 ) ( not ( = ?AUTO_6768 ?AUTO_6769 ) ) ( ON-TABLE ?AUTO_6768 ) ( CLEAR ?AUTO_6771 ) ( not ( = ?AUTO_6768 ?AUTO_6770 ) ) ( not ( = ?AUTO_6768 ?AUTO_6771 ) ) ( not ( = ?AUTO_6769 ?AUTO_6770 ) ) ( not ( = ?AUTO_6769 ?AUTO_6771 ) ) ( not ( = ?AUTO_6770 ?AUTO_6771 ) ) ( ON ?AUTO_6770 ?AUTO_6768 ) ( not ( = ?AUTO_6768 ?AUTO_6772 ) ) ( not ( = ?AUTO_6769 ?AUTO_6772 ) ) ( not ( = ?AUTO_6771 ?AUTO_6772 ) ) ( not ( = ?AUTO_6770 ?AUTO_6772 ) ) ( ON ?AUTO_6772 ?AUTO_6770 ) ( CLEAR ?AUTO_6772 ) ( HOLDING ?AUTO_6773 ) ( CLEAR ?AUTO_6774 ) ( not ( = ?AUTO_6768 ?AUTO_6773 ) ) ( not ( = ?AUTO_6768 ?AUTO_6774 ) ) ( not ( = ?AUTO_6769 ?AUTO_6773 ) ) ( not ( = ?AUTO_6769 ?AUTO_6774 ) ) ( not ( = ?AUTO_6771 ?AUTO_6773 ) ) ( not ( = ?AUTO_6771 ?AUTO_6774 ) ) ( not ( = ?AUTO_6770 ?AUTO_6773 ) ) ( not ( = ?AUTO_6770 ?AUTO_6774 ) ) ( not ( = ?AUTO_6772 ?AUTO_6773 ) ) ( not ( = ?AUTO_6772 ?AUTO_6774 ) ) ( not ( = ?AUTO_6773 ?AUTO_6774 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6773 ?AUTO_6774 )
      ( MAKE-ON ?AUTO_6768 ?AUTO_6769 )
      ( MAKE-ON-VERIFY ?AUTO_6768 ?AUTO_6769 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6775 - BLOCK
      ?AUTO_6776 - BLOCK
    )
    :vars
    (
      ?AUTO_6779 - BLOCK
      ?AUTO_6777 - BLOCK
      ?AUTO_6778 - BLOCK
      ?AUTO_6780 - BLOCK
      ?AUTO_6781 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6776 ) ( not ( = ?AUTO_6775 ?AUTO_6776 ) ) ( ON-TABLE ?AUTO_6775 ) ( CLEAR ?AUTO_6779 ) ( not ( = ?AUTO_6775 ?AUTO_6777 ) ) ( not ( = ?AUTO_6775 ?AUTO_6779 ) ) ( not ( = ?AUTO_6776 ?AUTO_6777 ) ) ( not ( = ?AUTO_6776 ?AUTO_6779 ) ) ( not ( = ?AUTO_6777 ?AUTO_6779 ) ) ( ON ?AUTO_6777 ?AUTO_6775 ) ( not ( = ?AUTO_6775 ?AUTO_6778 ) ) ( not ( = ?AUTO_6776 ?AUTO_6778 ) ) ( not ( = ?AUTO_6779 ?AUTO_6778 ) ) ( not ( = ?AUTO_6777 ?AUTO_6778 ) ) ( ON ?AUTO_6778 ?AUTO_6777 ) ( CLEAR ?AUTO_6780 ) ( not ( = ?AUTO_6775 ?AUTO_6781 ) ) ( not ( = ?AUTO_6775 ?AUTO_6780 ) ) ( not ( = ?AUTO_6776 ?AUTO_6781 ) ) ( not ( = ?AUTO_6776 ?AUTO_6780 ) ) ( not ( = ?AUTO_6779 ?AUTO_6781 ) ) ( not ( = ?AUTO_6779 ?AUTO_6780 ) ) ( not ( = ?AUTO_6777 ?AUTO_6781 ) ) ( not ( = ?AUTO_6777 ?AUTO_6780 ) ) ( not ( = ?AUTO_6778 ?AUTO_6781 ) ) ( not ( = ?AUTO_6778 ?AUTO_6780 ) ) ( not ( = ?AUTO_6781 ?AUTO_6780 ) ) ( ON ?AUTO_6781 ?AUTO_6778 ) ( CLEAR ?AUTO_6781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6781 ?AUTO_6778 )
      ( MAKE-ON ?AUTO_6775 ?AUTO_6776 )
      ( MAKE-ON-VERIFY ?AUTO_6775 ?AUTO_6776 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6782 - BLOCK
      ?AUTO_6783 - BLOCK
    )
    :vars
    (
      ?AUTO_6784 - BLOCK
      ?AUTO_6786 - BLOCK
      ?AUTO_6785 - BLOCK
      ?AUTO_6787 - BLOCK
      ?AUTO_6788 - BLOCK
      ?AUTO_6789 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6783 ) ( not ( = ?AUTO_6782 ?AUTO_6783 ) ) ( ON-TABLE ?AUTO_6782 ) ( not ( = ?AUTO_6782 ?AUTO_6784 ) ) ( not ( = ?AUTO_6782 ?AUTO_6786 ) ) ( not ( = ?AUTO_6783 ?AUTO_6784 ) ) ( not ( = ?AUTO_6783 ?AUTO_6786 ) ) ( not ( = ?AUTO_6784 ?AUTO_6786 ) ) ( ON ?AUTO_6784 ?AUTO_6782 ) ( not ( = ?AUTO_6782 ?AUTO_6785 ) ) ( not ( = ?AUTO_6783 ?AUTO_6785 ) ) ( not ( = ?AUTO_6786 ?AUTO_6785 ) ) ( not ( = ?AUTO_6784 ?AUTO_6785 ) ) ( ON ?AUTO_6785 ?AUTO_6784 ) ( CLEAR ?AUTO_6787 ) ( not ( = ?AUTO_6782 ?AUTO_6788 ) ) ( not ( = ?AUTO_6782 ?AUTO_6787 ) ) ( not ( = ?AUTO_6783 ?AUTO_6788 ) ) ( not ( = ?AUTO_6783 ?AUTO_6787 ) ) ( not ( = ?AUTO_6786 ?AUTO_6788 ) ) ( not ( = ?AUTO_6786 ?AUTO_6787 ) ) ( not ( = ?AUTO_6784 ?AUTO_6788 ) ) ( not ( = ?AUTO_6784 ?AUTO_6787 ) ) ( not ( = ?AUTO_6785 ?AUTO_6788 ) ) ( not ( = ?AUTO_6785 ?AUTO_6787 ) ) ( not ( = ?AUTO_6788 ?AUTO_6787 ) ) ( ON ?AUTO_6788 ?AUTO_6785 ) ( CLEAR ?AUTO_6788 ) ( HOLDING ?AUTO_6786 ) ( CLEAR ?AUTO_6789 ) ( not ( = ?AUTO_6782 ?AUTO_6789 ) ) ( not ( = ?AUTO_6783 ?AUTO_6789 ) ) ( not ( = ?AUTO_6784 ?AUTO_6789 ) ) ( not ( = ?AUTO_6786 ?AUTO_6789 ) ) ( not ( = ?AUTO_6785 ?AUTO_6789 ) ) ( not ( = ?AUTO_6787 ?AUTO_6789 ) ) ( not ( = ?AUTO_6788 ?AUTO_6789 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6786 ?AUTO_6789 )
      ( MAKE-ON ?AUTO_6782 ?AUTO_6783 )
      ( MAKE-ON-VERIFY ?AUTO_6782 ?AUTO_6783 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6810 - BLOCK
      ?AUTO_6811 - BLOCK
    )
    :vars
    (
      ?AUTO_6812 - BLOCK
      ?AUTO_6816 - BLOCK
      ?AUTO_6813 - BLOCK
      ?AUTO_6815 - BLOCK
      ?AUTO_6817 - BLOCK
      ?AUTO_6814 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6811 ) ( not ( = ?AUTO_6810 ?AUTO_6811 ) ) ( ON-TABLE ?AUTO_6810 ) ( not ( = ?AUTO_6810 ?AUTO_6812 ) ) ( not ( = ?AUTO_6810 ?AUTO_6816 ) ) ( not ( = ?AUTO_6811 ?AUTO_6812 ) ) ( not ( = ?AUTO_6811 ?AUTO_6816 ) ) ( not ( = ?AUTO_6812 ?AUTO_6816 ) ) ( ON ?AUTO_6812 ?AUTO_6810 ) ( not ( = ?AUTO_6810 ?AUTO_6813 ) ) ( not ( = ?AUTO_6811 ?AUTO_6813 ) ) ( not ( = ?AUTO_6816 ?AUTO_6813 ) ) ( not ( = ?AUTO_6812 ?AUTO_6813 ) ) ( ON ?AUTO_6813 ?AUTO_6812 ) ( CLEAR ?AUTO_6815 ) ( not ( = ?AUTO_6810 ?AUTO_6817 ) ) ( not ( = ?AUTO_6810 ?AUTO_6815 ) ) ( not ( = ?AUTO_6811 ?AUTO_6817 ) ) ( not ( = ?AUTO_6811 ?AUTO_6815 ) ) ( not ( = ?AUTO_6816 ?AUTO_6817 ) ) ( not ( = ?AUTO_6816 ?AUTO_6815 ) ) ( not ( = ?AUTO_6812 ?AUTO_6817 ) ) ( not ( = ?AUTO_6812 ?AUTO_6815 ) ) ( not ( = ?AUTO_6813 ?AUTO_6817 ) ) ( not ( = ?AUTO_6813 ?AUTO_6815 ) ) ( not ( = ?AUTO_6817 ?AUTO_6815 ) ) ( ON ?AUTO_6817 ?AUTO_6813 ) ( CLEAR ?AUTO_6814 ) ( not ( = ?AUTO_6810 ?AUTO_6814 ) ) ( not ( = ?AUTO_6811 ?AUTO_6814 ) ) ( not ( = ?AUTO_6812 ?AUTO_6814 ) ) ( not ( = ?AUTO_6816 ?AUTO_6814 ) ) ( not ( = ?AUTO_6813 ?AUTO_6814 ) ) ( not ( = ?AUTO_6815 ?AUTO_6814 ) ) ( not ( = ?AUTO_6817 ?AUTO_6814 ) ) ( ON ?AUTO_6816 ?AUTO_6817 ) ( CLEAR ?AUTO_6816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6816 ?AUTO_6817 )
      ( MAKE-ON ?AUTO_6810 ?AUTO_6811 )
      ( MAKE-ON-VERIFY ?AUTO_6810 ?AUTO_6811 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6818 - BLOCK
      ?AUTO_6819 - BLOCK
    )
    :vars
    (
      ?AUTO_6823 - BLOCK
      ?AUTO_6822 - BLOCK
      ?AUTO_6820 - BLOCK
      ?AUTO_6825 - BLOCK
      ?AUTO_6821 - BLOCK
      ?AUTO_6824 - BLOCK
      ?AUTO_6826 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6819 ) ( not ( = ?AUTO_6818 ?AUTO_6819 ) ) ( ON-TABLE ?AUTO_6818 ) ( not ( = ?AUTO_6818 ?AUTO_6823 ) ) ( not ( = ?AUTO_6818 ?AUTO_6822 ) ) ( not ( = ?AUTO_6819 ?AUTO_6823 ) ) ( not ( = ?AUTO_6819 ?AUTO_6822 ) ) ( not ( = ?AUTO_6823 ?AUTO_6822 ) ) ( ON ?AUTO_6823 ?AUTO_6818 ) ( not ( = ?AUTO_6818 ?AUTO_6820 ) ) ( not ( = ?AUTO_6819 ?AUTO_6820 ) ) ( not ( = ?AUTO_6822 ?AUTO_6820 ) ) ( not ( = ?AUTO_6823 ?AUTO_6820 ) ) ( ON ?AUTO_6820 ?AUTO_6823 ) ( CLEAR ?AUTO_6825 ) ( not ( = ?AUTO_6818 ?AUTO_6821 ) ) ( not ( = ?AUTO_6818 ?AUTO_6825 ) ) ( not ( = ?AUTO_6819 ?AUTO_6821 ) ) ( not ( = ?AUTO_6819 ?AUTO_6825 ) ) ( not ( = ?AUTO_6822 ?AUTO_6821 ) ) ( not ( = ?AUTO_6822 ?AUTO_6825 ) ) ( not ( = ?AUTO_6823 ?AUTO_6821 ) ) ( not ( = ?AUTO_6823 ?AUTO_6825 ) ) ( not ( = ?AUTO_6820 ?AUTO_6821 ) ) ( not ( = ?AUTO_6820 ?AUTO_6825 ) ) ( not ( = ?AUTO_6821 ?AUTO_6825 ) ) ( ON ?AUTO_6821 ?AUTO_6820 ) ( CLEAR ?AUTO_6824 ) ( not ( = ?AUTO_6818 ?AUTO_6824 ) ) ( not ( = ?AUTO_6819 ?AUTO_6824 ) ) ( not ( = ?AUTO_6823 ?AUTO_6824 ) ) ( not ( = ?AUTO_6822 ?AUTO_6824 ) ) ( not ( = ?AUTO_6820 ?AUTO_6824 ) ) ( not ( = ?AUTO_6825 ?AUTO_6824 ) ) ( not ( = ?AUTO_6821 ?AUTO_6824 ) ) ( ON ?AUTO_6822 ?AUTO_6821 ) ( CLEAR ?AUTO_6822 ) ( HOLDING ?AUTO_6826 ) ( not ( = ?AUTO_6818 ?AUTO_6826 ) ) ( not ( = ?AUTO_6819 ?AUTO_6826 ) ) ( not ( = ?AUTO_6823 ?AUTO_6826 ) ) ( not ( = ?AUTO_6822 ?AUTO_6826 ) ) ( not ( = ?AUTO_6820 ?AUTO_6826 ) ) ( not ( = ?AUTO_6825 ?AUTO_6826 ) ) ( not ( = ?AUTO_6821 ?AUTO_6826 ) ) ( not ( = ?AUTO_6824 ?AUTO_6826 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6826 )
      ( MAKE-ON ?AUTO_6818 ?AUTO_6819 )
      ( MAKE-ON-VERIFY ?AUTO_6818 ?AUTO_6819 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6829 - BLOCK
      ?AUTO_6830 - BLOCK
    )
    :vars
    (
      ?AUTO_6835 - BLOCK
      ?AUTO_6832 - BLOCK
      ?AUTO_6831 - BLOCK
      ?AUTO_6836 - BLOCK
      ?AUTO_6833 - BLOCK
      ?AUTO_6834 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6830 ) ( not ( = ?AUTO_6829 ?AUTO_6830 ) ) ( ON-TABLE ?AUTO_6829 ) ( not ( = ?AUTO_6829 ?AUTO_6835 ) ) ( not ( = ?AUTO_6829 ?AUTO_6832 ) ) ( not ( = ?AUTO_6830 ?AUTO_6835 ) ) ( not ( = ?AUTO_6830 ?AUTO_6832 ) ) ( not ( = ?AUTO_6835 ?AUTO_6832 ) ) ( ON ?AUTO_6835 ?AUTO_6829 ) ( not ( = ?AUTO_6829 ?AUTO_6831 ) ) ( not ( = ?AUTO_6830 ?AUTO_6831 ) ) ( not ( = ?AUTO_6832 ?AUTO_6831 ) ) ( not ( = ?AUTO_6835 ?AUTO_6831 ) ) ( ON ?AUTO_6831 ?AUTO_6835 ) ( not ( = ?AUTO_6829 ?AUTO_6836 ) ) ( not ( = ?AUTO_6829 ?AUTO_6833 ) ) ( not ( = ?AUTO_6830 ?AUTO_6836 ) ) ( not ( = ?AUTO_6830 ?AUTO_6833 ) ) ( not ( = ?AUTO_6832 ?AUTO_6836 ) ) ( not ( = ?AUTO_6832 ?AUTO_6833 ) ) ( not ( = ?AUTO_6835 ?AUTO_6836 ) ) ( not ( = ?AUTO_6835 ?AUTO_6833 ) ) ( not ( = ?AUTO_6831 ?AUTO_6836 ) ) ( not ( = ?AUTO_6831 ?AUTO_6833 ) ) ( not ( = ?AUTO_6836 ?AUTO_6833 ) ) ( ON ?AUTO_6836 ?AUTO_6831 ) ( CLEAR ?AUTO_6834 ) ( not ( = ?AUTO_6829 ?AUTO_6834 ) ) ( not ( = ?AUTO_6830 ?AUTO_6834 ) ) ( not ( = ?AUTO_6835 ?AUTO_6834 ) ) ( not ( = ?AUTO_6832 ?AUTO_6834 ) ) ( not ( = ?AUTO_6831 ?AUTO_6834 ) ) ( not ( = ?AUTO_6833 ?AUTO_6834 ) ) ( not ( = ?AUTO_6836 ?AUTO_6834 ) ) ( ON ?AUTO_6832 ?AUTO_6836 ) ( CLEAR ?AUTO_6832 ) ( HOLDING ?AUTO_6833 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6833 )
      ( MAKE-ON ?AUTO_6829 ?AUTO_6830 )
      ( MAKE-ON-VERIFY ?AUTO_6829 ?AUTO_6830 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6837 - BLOCK
      ?AUTO_6838 - BLOCK
    )
    :vars
    (
      ?AUTO_6843 - BLOCK
      ?AUTO_6841 - BLOCK
      ?AUTO_6842 - BLOCK
      ?AUTO_6840 - BLOCK
      ?AUTO_6839 - BLOCK
      ?AUTO_6844 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6838 ) ( not ( = ?AUTO_6837 ?AUTO_6838 ) ) ( ON-TABLE ?AUTO_6837 ) ( not ( = ?AUTO_6837 ?AUTO_6843 ) ) ( not ( = ?AUTO_6837 ?AUTO_6841 ) ) ( not ( = ?AUTO_6838 ?AUTO_6843 ) ) ( not ( = ?AUTO_6838 ?AUTO_6841 ) ) ( not ( = ?AUTO_6843 ?AUTO_6841 ) ) ( ON ?AUTO_6843 ?AUTO_6837 ) ( not ( = ?AUTO_6837 ?AUTO_6842 ) ) ( not ( = ?AUTO_6838 ?AUTO_6842 ) ) ( not ( = ?AUTO_6841 ?AUTO_6842 ) ) ( not ( = ?AUTO_6843 ?AUTO_6842 ) ) ( ON ?AUTO_6842 ?AUTO_6843 ) ( not ( = ?AUTO_6837 ?AUTO_6840 ) ) ( not ( = ?AUTO_6837 ?AUTO_6839 ) ) ( not ( = ?AUTO_6838 ?AUTO_6840 ) ) ( not ( = ?AUTO_6838 ?AUTO_6839 ) ) ( not ( = ?AUTO_6841 ?AUTO_6840 ) ) ( not ( = ?AUTO_6841 ?AUTO_6839 ) ) ( not ( = ?AUTO_6843 ?AUTO_6840 ) ) ( not ( = ?AUTO_6843 ?AUTO_6839 ) ) ( not ( = ?AUTO_6842 ?AUTO_6840 ) ) ( not ( = ?AUTO_6842 ?AUTO_6839 ) ) ( not ( = ?AUTO_6840 ?AUTO_6839 ) ) ( ON ?AUTO_6840 ?AUTO_6842 ) ( not ( = ?AUTO_6837 ?AUTO_6844 ) ) ( not ( = ?AUTO_6838 ?AUTO_6844 ) ) ( not ( = ?AUTO_6843 ?AUTO_6844 ) ) ( not ( = ?AUTO_6841 ?AUTO_6844 ) ) ( not ( = ?AUTO_6842 ?AUTO_6844 ) ) ( not ( = ?AUTO_6839 ?AUTO_6844 ) ) ( not ( = ?AUTO_6840 ?AUTO_6844 ) ) ( ON ?AUTO_6841 ?AUTO_6840 ) ( CLEAR ?AUTO_6841 ) ( ON ?AUTO_6839 ?AUTO_6844 ) ( CLEAR ?AUTO_6839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6839 ?AUTO_6844 )
      ( MAKE-ON ?AUTO_6837 ?AUTO_6838 )
      ( MAKE-ON-VERIFY ?AUTO_6837 ?AUTO_6838 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6845 - BLOCK
      ?AUTO_6846 - BLOCK
    )
    :vars
    (
      ?AUTO_6850 - BLOCK
      ?AUTO_6849 - BLOCK
      ?AUTO_6852 - BLOCK
      ?AUTO_6848 - BLOCK
      ?AUTO_6847 - BLOCK
      ?AUTO_6851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6845 ?AUTO_6846 ) ) ( ON-TABLE ?AUTO_6845 ) ( not ( = ?AUTO_6845 ?AUTO_6850 ) ) ( not ( = ?AUTO_6845 ?AUTO_6849 ) ) ( not ( = ?AUTO_6846 ?AUTO_6850 ) ) ( not ( = ?AUTO_6846 ?AUTO_6849 ) ) ( not ( = ?AUTO_6850 ?AUTO_6849 ) ) ( ON ?AUTO_6850 ?AUTO_6845 ) ( not ( = ?AUTO_6845 ?AUTO_6852 ) ) ( not ( = ?AUTO_6846 ?AUTO_6852 ) ) ( not ( = ?AUTO_6849 ?AUTO_6852 ) ) ( not ( = ?AUTO_6850 ?AUTO_6852 ) ) ( ON ?AUTO_6852 ?AUTO_6850 ) ( not ( = ?AUTO_6845 ?AUTO_6848 ) ) ( not ( = ?AUTO_6845 ?AUTO_6847 ) ) ( not ( = ?AUTO_6846 ?AUTO_6848 ) ) ( not ( = ?AUTO_6846 ?AUTO_6847 ) ) ( not ( = ?AUTO_6849 ?AUTO_6848 ) ) ( not ( = ?AUTO_6849 ?AUTO_6847 ) ) ( not ( = ?AUTO_6850 ?AUTO_6848 ) ) ( not ( = ?AUTO_6850 ?AUTO_6847 ) ) ( not ( = ?AUTO_6852 ?AUTO_6848 ) ) ( not ( = ?AUTO_6852 ?AUTO_6847 ) ) ( not ( = ?AUTO_6848 ?AUTO_6847 ) ) ( ON ?AUTO_6848 ?AUTO_6852 ) ( not ( = ?AUTO_6845 ?AUTO_6851 ) ) ( not ( = ?AUTO_6846 ?AUTO_6851 ) ) ( not ( = ?AUTO_6850 ?AUTO_6851 ) ) ( not ( = ?AUTO_6849 ?AUTO_6851 ) ) ( not ( = ?AUTO_6852 ?AUTO_6851 ) ) ( not ( = ?AUTO_6847 ?AUTO_6851 ) ) ( not ( = ?AUTO_6848 ?AUTO_6851 ) ) ( ON ?AUTO_6849 ?AUTO_6848 ) ( CLEAR ?AUTO_6849 ) ( ON ?AUTO_6847 ?AUTO_6851 ) ( CLEAR ?AUTO_6847 ) ( HOLDING ?AUTO_6846 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6846 )
      ( MAKE-ON ?AUTO_6845 ?AUTO_6846 )
      ( MAKE-ON-VERIFY ?AUTO_6845 ?AUTO_6846 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6853 - BLOCK
      ?AUTO_6854 - BLOCK
    )
    :vars
    (
      ?AUTO_6857 - BLOCK
      ?AUTO_6859 - BLOCK
      ?AUTO_6856 - BLOCK
      ?AUTO_6855 - BLOCK
      ?AUTO_6858 - BLOCK
      ?AUTO_6860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6853 ?AUTO_6854 ) ) ( ON-TABLE ?AUTO_6853 ) ( not ( = ?AUTO_6853 ?AUTO_6857 ) ) ( not ( = ?AUTO_6853 ?AUTO_6859 ) ) ( not ( = ?AUTO_6854 ?AUTO_6857 ) ) ( not ( = ?AUTO_6854 ?AUTO_6859 ) ) ( not ( = ?AUTO_6857 ?AUTO_6859 ) ) ( ON ?AUTO_6857 ?AUTO_6853 ) ( not ( = ?AUTO_6853 ?AUTO_6856 ) ) ( not ( = ?AUTO_6854 ?AUTO_6856 ) ) ( not ( = ?AUTO_6859 ?AUTO_6856 ) ) ( not ( = ?AUTO_6857 ?AUTO_6856 ) ) ( ON ?AUTO_6856 ?AUTO_6857 ) ( not ( = ?AUTO_6853 ?AUTO_6855 ) ) ( not ( = ?AUTO_6853 ?AUTO_6858 ) ) ( not ( = ?AUTO_6854 ?AUTO_6855 ) ) ( not ( = ?AUTO_6854 ?AUTO_6858 ) ) ( not ( = ?AUTO_6859 ?AUTO_6855 ) ) ( not ( = ?AUTO_6859 ?AUTO_6858 ) ) ( not ( = ?AUTO_6857 ?AUTO_6855 ) ) ( not ( = ?AUTO_6857 ?AUTO_6858 ) ) ( not ( = ?AUTO_6856 ?AUTO_6855 ) ) ( not ( = ?AUTO_6856 ?AUTO_6858 ) ) ( not ( = ?AUTO_6855 ?AUTO_6858 ) ) ( ON ?AUTO_6855 ?AUTO_6856 ) ( not ( = ?AUTO_6853 ?AUTO_6860 ) ) ( not ( = ?AUTO_6854 ?AUTO_6860 ) ) ( not ( = ?AUTO_6857 ?AUTO_6860 ) ) ( not ( = ?AUTO_6859 ?AUTO_6860 ) ) ( not ( = ?AUTO_6856 ?AUTO_6860 ) ) ( not ( = ?AUTO_6858 ?AUTO_6860 ) ) ( not ( = ?AUTO_6855 ?AUTO_6860 ) ) ( ON ?AUTO_6859 ?AUTO_6855 ) ( CLEAR ?AUTO_6859 ) ( ON ?AUTO_6858 ?AUTO_6860 ) ( ON ?AUTO_6854 ?AUTO_6858 ) ( CLEAR ?AUTO_6854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6854 ?AUTO_6858 )
      ( MAKE-ON ?AUTO_6853 ?AUTO_6854 )
      ( MAKE-ON-VERIFY ?AUTO_6853 ?AUTO_6854 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6863 - BLOCK
      ?AUTO_6864 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6863 ) ( CLEAR ?AUTO_6864 ) ( not ( = ?AUTO_6863 ?AUTO_6864 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6863 ?AUTO_6864 )
      ( MAKE-ON-VERIFY ?AUTO_6863 ?AUTO_6864 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6865 - BLOCK
      ?AUTO_6866 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6866 ) ( not ( = ?AUTO_6865 ?AUTO_6866 ) ) ( ON-TABLE ?AUTO_6865 ) ( CLEAR ?AUTO_6865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6865 )
      ( MAKE-ON ?AUTO_6865 ?AUTO_6866 )
      ( MAKE-ON-VERIFY ?AUTO_6865 ?AUTO_6866 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6867 - BLOCK
      ?AUTO_6868 - BLOCK
    )
    :vars
    (
      ?AUTO_6869 - BLOCK
      ?AUTO_6870 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6868 ) ( not ( = ?AUTO_6867 ?AUTO_6868 ) ) ( ON-TABLE ?AUTO_6867 ) ( CLEAR ?AUTO_6867 ) ( HOLDING ?AUTO_6869 ) ( CLEAR ?AUTO_6870 ) ( not ( = ?AUTO_6867 ?AUTO_6869 ) ) ( not ( = ?AUTO_6867 ?AUTO_6870 ) ) ( not ( = ?AUTO_6868 ?AUTO_6869 ) ) ( not ( = ?AUTO_6868 ?AUTO_6870 ) ) ( not ( = ?AUTO_6869 ?AUTO_6870 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6869 ?AUTO_6870 )
      ( MAKE-ON ?AUTO_6867 ?AUTO_6868 )
      ( MAKE-ON-VERIFY ?AUTO_6867 ?AUTO_6868 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6873 - BLOCK
      ?AUTO_6874 - BLOCK
    )
    :vars
    (
      ?AUTO_6875 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6873 ?AUTO_6874 ) ) ( ON-TABLE ?AUTO_6873 ) ( CLEAR ?AUTO_6873 ) ( HOLDING ?AUTO_6874 ) ( CLEAR ?AUTO_6875 ) ( not ( = ?AUTO_6873 ?AUTO_6875 ) ) ( not ( = ?AUTO_6874 ?AUTO_6875 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6874 ?AUTO_6875 )
      ( MAKE-ON ?AUTO_6873 ?AUTO_6874 )
      ( MAKE-ON-VERIFY ?AUTO_6873 ?AUTO_6874 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6944 - BLOCK
      ?AUTO_6945 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6944 ) ( CLEAR ?AUTO_6945 ) ( not ( = ?AUTO_6944 ?AUTO_6945 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6944 ?AUTO_6945 )
      ( MAKE-ON-VERIFY ?AUTO_6944 ?AUTO_6945 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6946 - BLOCK
      ?AUTO_6947 - BLOCK
    )
    :vars
    (
      ?AUTO_6948 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6947 ) ( not ( = ?AUTO_6946 ?AUTO_6947 ) ) ( ON ?AUTO_6946 ?AUTO_6948 ) ( CLEAR ?AUTO_6946 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6946 ?AUTO_6948 ) ) ( not ( = ?AUTO_6947 ?AUTO_6948 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6946 ?AUTO_6948 )
      ( MAKE-ON ?AUTO_6946 ?AUTO_6947 )
      ( MAKE-ON-VERIFY ?AUTO_6946 ?AUTO_6947 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6949 - BLOCK
      ?AUTO_6950 - BLOCK
    )
    :vars
    (
      ?AUTO_6951 - BLOCK
      ?AUTO_6952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6949 ?AUTO_6950 ) ) ( ON ?AUTO_6949 ?AUTO_6951 ) ( CLEAR ?AUTO_6949 ) ( not ( = ?AUTO_6949 ?AUTO_6951 ) ) ( not ( = ?AUTO_6950 ?AUTO_6951 ) ) ( HOLDING ?AUTO_6950 ) ( CLEAR ?AUTO_6952 ) ( not ( = ?AUTO_6949 ?AUTO_6952 ) ) ( not ( = ?AUTO_6950 ?AUTO_6952 ) ) ( not ( = ?AUTO_6951 ?AUTO_6952 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6950 ?AUTO_6952 )
      ( MAKE-ON ?AUTO_6949 ?AUTO_6950 )
      ( MAKE-ON-VERIFY ?AUTO_6949 ?AUTO_6950 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6955 - BLOCK
      ?AUTO_6956 - BLOCK
    )
    :vars
    (
      ?AUTO_6957 - BLOCK
      ?AUTO_6958 - BLOCK
      ?AUTO_6959 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6956 ) ( not ( = ?AUTO_6955 ?AUTO_6956 ) ) ( ON ?AUTO_6955 ?AUTO_6957 ) ( CLEAR ?AUTO_6955 ) ( not ( = ?AUTO_6955 ?AUTO_6957 ) ) ( not ( = ?AUTO_6956 ?AUTO_6957 ) ) ( HOLDING ?AUTO_6958 ) ( CLEAR ?AUTO_6959 ) ( not ( = ?AUTO_6955 ?AUTO_6958 ) ) ( not ( = ?AUTO_6955 ?AUTO_6959 ) ) ( not ( = ?AUTO_6956 ?AUTO_6958 ) ) ( not ( = ?AUTO_6956 ?AUTO_6959 ) ) ( not ( = ?AUTO_6957 ?AUTO_6958 ) ) ( not ( = ?AUTO_6957 ?AUTO_6959 ) ) ( not ( = ?AUTO_6958 ?AUTO_6959 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6958 ?AUTO_6959 )
      ( MAKE-ON ?AUTO_6955 ?AUTO_6956 )
      ( MAKE-ON-VERIFY ?AUTO_6955 ?AUTO_6956 ) )
  )

)

