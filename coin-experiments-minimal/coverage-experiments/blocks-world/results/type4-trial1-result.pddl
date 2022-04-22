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

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_14 - BLOCK
      ?AUTO_15 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_14 ) ( CLEAR ?AUTO_15 ) ( not ( = ?AUTO_14 ?AUTO_15 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_14 ?AUTO_15 )
      ( MAKE-ON-VERIFY ?AUTO_14 ?AUTO_15 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_16 - BLOCK
      ?AUTO_17 - BLOCK
    )
    :vars
    (
      ?AUTO_18 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_17 ) ( not ( = ?AUTO_16 ?AUTO_17 ) ) ( ON ?AUTO_16 ?AUTO_18 ) ( CLEAR ?AUTO_16 ) ( HAND-EMPTY ) ( not ( = ?AUTO_16 ?AUTO_18 ) ) ( not ( = ?AUTO_17 ?AUTO_18 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_16 ?AUTO_18 )
      ( MAKE-ON ?AUTO_16 ?AUTO_17 )
      ( MAKE-ON-VERIFY ?AUTO_16 ?AUTO_17 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_19 - BLOCK
      ?AUTO_20 - BLOCK
    )
    :vars
    (
      ?AUTO_21 - BLOCK
      ?AUTO_22 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_20 ) ( not ( = ?AUTO_19 ?AUTO_20 ) ) ( ON ?AUTO_19 ?AUTO_21 ) ( CLEAR ?AUTO_19 ) ( not ( = ?AUTO_19 ?AUTO_21 ) ) ( not ( = ?AUTO_20 ?AUTO_21 ) ) ( HOLDING ?AUTO_22 ) ( not ( = ?AUTO_19 ?AUTO_22 ) ) ( not ( = ?AUTO_20 ?AUTO_22 ) ) ( not ( = ?AUTO_21 ?AUTO_22 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_22 )
      ( MAKE-ON ?AUTO_19 ?AUTO_20 )
      ( MAKE-ON-VERIFY ?AUTO_19 ?AUTO_20 ) )
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
      ?AUTO_26 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_24 ) ( not ( = ?AUTO_23 ?AUTO_24 ) ) ( ON ?AUTO_23 ?AUTO_25 ) ( not ( = ?AUTO_23 ?AUTO_25 ) ) ( not ( = ?AUTO_24 ?AUTO_25 ) ) ( not ( = ?AUTO_23 ?AUTO_26 ) ) ( not ( = ?AUTO_24 ?AUTO_26 ) ) ( not ( = ?AUTO_25 ?AUTO_26 ) ) ( ON ?AUTO_26 ?AUTO_23 ) ( CLEAR ?AUTO_26 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_26 ?AUTO_23 )
      ( MAKE-ON ?AUTO_23 ?AUTO_24 )
      ( MAKE-ON-VERIFY ?AUTO_23 ?AUTO_24 ) )
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
    ( and ( not ( = ?AUTO_27 ?AUTO_28 ) ) ( ON ?AUTO_27 ?AUTO_29 ) ( not ( = ?AUTO_27 ?AUTO_29 ) ) ( not ( = ?AUTO_28 ?AUTO_29 ) ) ( not ( = ?AUTO_27 ?AUTO_30 ) ) ( not ( = ?AUTO_28 ?AUTO_30 ) ) ( not ( = ?AUTO_29 ?AUTO_30 ) ) ( ON ?AUTO_30 ?AUTO_27 ) ( CLEAR ?AUTO_30 ) ( HOLDING ?AUTO_28 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_28 )
      ( MAKE-ON ?AUTO_27 ?AUTO_28 )
      ( MAKE-ON-VERIFY ?AUTO_27 ?AUTO_28 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_35 - BLOCK
      ?AUTO_36 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_35 ) ( CLEAR ?AUTO_36 ) ( not ( = ?AUTO_35 ?AUTO_36 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_35 ?AUTO_36 )
      ( MAKE-ON-VERIFY ?AUTO_35 ?AUTO_36 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_37 - BLOCK
      ?AUTO_38 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_38 ) ( not ( = ?AUTO_37 ?AUTO_38 ) ) ( ON-TABLE ?AUTO_37 ) ( CLEAR ?AUTO_37 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_37 )
      ( MAKE-ON ?AUTO_37 ?AUTO_38 )
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
      ?AUTO_42 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_40 ) ( not ( = ?AUTO_39 ?AUTO_40 ) ) ( ON-TABLE ?AUTO_39 ) ( CLEAR ?AUTO_39 ) ( HOLDING ?AUTO_41 ) ( CLEAR ?AUTO_42 ) ( not ( = ?AUTO_39 ?AUTO_41 ) ) ( not ( = ?AUTO_39 ?AUTO_42 ) ) ( not ( = ?AUTO_40 ?AUTO_41 ) ) ( not ( = ?AUTO_40 ?AUTO_42 ) ) ( not ( = ?AUTO_41 ?AUTO_42 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_41 ?AUTO_42 )
      ( MAKE-ON ?AUTO_39 ?AUTO_40 )
      ( MAKE-ON-VERIFY ?AUTO_39 ?AUTO_40 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_43 - BLOCK
      ?AUTO_44 - BLOCK
    )
    :vars
    (
      ?AUTO_45 - BLOCK
      ?AUTO_46 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_44 ) ( not ( = ?AUTO_43 ?AUTO_44 ) ) ( ON-TABLE ?AUTO_43 ) ( CLEAR ?AUTO_45 ) ( not ( = ?AUTO_43 ?AUTO_46 ) ) ( not ( = ?AUTO_43 ?AUTO_45 ) ) ( not ( = ?AUTO_44 ?AUTO_46 ) ) ( not ( = ?AUTO_44 ?AUTO_45 ) ) ( not ( = ?AUTO_46 ?AUTO_45 ) ) ( ON ?AUTO_46 ?AUTO_43 ) ( CLEAR ?AUTO_46 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_46 ?AUTO_43 )
      ( MAKE-ON ?AUTO_43 ?AUTO_44 )
      ( MAKE-ON-VERIFY ?AUTO_43 ?AUTO_44 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_47 - BLOCK
      ?AUTO_48 - BLOCK
    )
    :vars
    (
      ?AUTO_50 - BLOCK
      ?AUTO_49 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_47 ?AUTO_48 ) ) ( ON-TABLE ?AUTO_47 ) ( CLEAR ?AUTO_50 ) ( not ( = ?AUTO_47 ?AUTO_49 ) ) ( not ( = ?AUTO_47 ?AUTO_50 ) ) ( not ( = ?AUTO_48 ?AUTO_49 ) ) ( not ( = ?AUTO_48 ?AUTO_50 ) ) ( not ( = ?AUTO_49 ?AUTO_50 ) ) ( ON ?AUTO_49 ?AUTO_47 ) ( CLEAR ?AUTO_49 ) ( HOLDING ?AUTO_48 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_48 )
      ( MAKE-ON ?AUTO_47 ?AUTO_48 )
      ( MAKE-ON-VERIFY ?AUTO_47 ?AUTO_48 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_51 - BLOCK
      ?AUTO_52 - BLOCK
    )
    :vars
    (
      ?AUTO_54 - BLOCK
      ?AUTO_53 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_51 ?AUTO_52 ) ) ( ON-TABLE ?AUTO_51 ) ( CLEAR ?AUTO_54 ) ( not ( = ?AUTO_51 ?AUTO_53 ) ) ( not ( = ?AUTO_51 ?AUTO_54 ) ) ( not ( = ?AUTO_52 ?AUTO_53 ) ) ( not ( = ?AUTO_52 ?AUTO_54 ) ) ( not ( = ?AUTO_53 ?AUTO_54 ) ) ( ON ?AUTO_53 ?AUTO_51 ) ( ON ?AUTO_52 ?AUTO_53 ) ( CLEAR ?AUTO_52 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_52 ?AUTO_53 )
      ( MAKE-ON ?AUTO_51 ?AUTO_52 )
      ( MAKE-ON-VERIFY ?AUTO_51 ?AUTO_52 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_55 - BLOCK
      ?AUTO_56 - BLOCK
    )
    :vars
    (
      ?AUTO_58 - BLOCK
      ?AUTO_57 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_55 ?AUTO_56 ) ) ( ON-TABLE ?AUTO_55 ) ( not ( = ?AUTO_55 ?AUTO_58 ) ) ( not ( = ?AUTO_55 ?AUTO_57 ) ) ( not ( = ?AUTO_56 ?AUTO_58 ) ) ( not ( = ?AUTO_56 ?AUTO_57 ) ) ( not ( = ?AUTO_58 ?AUTO_57 ) ) ( ON ?AUTO_58 ?AUTO_55 ) ( ON ?AUTO_56 ?AUTO_58 ) ( CLEAR ?AUTO_56 ) ( HOLDING ?AUTO_57 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_57 )
      ( MAKE-ON ?AUTO_55 ?AUTO_56 )
      ( MAKE-ON-VERIFY ?AUTO_55 ?AUTO_56 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_63 - BLOCK
      ?AUTO_64 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_63 ) ( CLEAR ?AUTO_64 ) ( not ( = ?AUTO_63 ?AUTO_64 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_63 ?AUTO_64 )
      ( MAKE-ON-VERIFY ?AUTO_63 ?AUTO_64 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_65 - BLOCK
      ?AUTO_66 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_66 ) ( not ( = ?AUTO_65 ?AUTO_66 ) ) ( ON-TABLE ?AUTO_65 ) ( CLEAR ?AUTO_65 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_65 )
      ( MAKE-ON ?AUTO_65 ?AUTO_66 )
      ( MAKE-ON-VERIFY ?AUTO_65 ?AUTO_66 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_67 - BLOCK
      ?AUTO_68 - BLOCK
    )
    :vars
    (
      ?AUTO_69 - BLOCK
      ?AUTO_70 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_68 ) ( not ( = ?AUTO_67 ?AUTO_68 ) ) ( ON-TABLE ?AUTO_67 ) ( CLEAR ?AUTO_67 ) ( HOLDING ?AUTO_69 ) ( CLEAR ?AUTO_70 ) ( not ( = ?AUTO_67 ?AUTO_69 ) ) ( not ( = ?AUTO_67 ?AUTO_70 ) ) ( not ( = ?AUTO_68 ?AUTO_69 ) ) ( not ( = ?AUTO_68 ?AUTO_70 ) ) ( not ( = ?AUTO_69 ?AUTO_70 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_69 ?AUTO_70 )
      ( MAKE-ON ?AUTO_67 ?AUTO_68 )
      ( MAKE-ON-VERIFY ?AUTO_67 ?AUTO_68 ) )
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
    )
    :precondition
    ( and ( not ( = ?AUTO_73 ?AUTO_74 ) ) ( ON-TABLE ?AUTO_73 ) ( CLEAR ?AUTO_73 ) ( HOLDING ?AUTO_74 ) ( CLEAR ?AUTO_75 ) ( not ( = ?AUTO_73 ?AUTO_75 ) ) ( not ( = ?AUTO_74 ?AUTO_75 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_74 ?AUTO_75 )
      ( MAKE-ON ?AUTO_73 ?AUTO_74 )
      ( MAKE-ON-VERIFY ?AUTO_73 ?AUTO_74 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_80 - BLOCK
      ?AUTO_81 - BLOCK
    )
    :vars
    (
      ?AUTO_83 - BLOCK
      ?AUTO_82 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_80 ?AUTO_81 ) ) ( ON-TABLE ?AUTO_80 ) ( CLEAR ?AUTO_80 ) ( CLEAR ?AUTO_83 ) ( not ( = ?AUTO_80 ?AUTO_82 ) ) ( not ( = ?AUTO_80 ?AUTO_83 ) ) ( not ( = ?AUTO_81 ?AUTO_82 ) ) ( not ( = ?AUTO_81 ?AUTO_83 ) ) ( not ( = ?AUTO_82 ?AUTO_83 ) ) ( ON ?AUTO_82 ?AUTO_81 ) ( CLEAR ?AUTO_82 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_82 ?AUTO_81 )
      ( MAKE-ON ?AUTO_80 ?AUTO_81 )
      ( MAKE-ON-VERIFY ?AUTO_80 ?AUTO_81 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_84 - BLOCK
      ?AUTO_85 - BLOCK
    )
    :vars
    (
      ?AUTO_86 - BLOCK
      ?AUTO_87 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_84 ?AUTO_85 ) ) ( ON-TABLE ?AUTO_84 ) ( CLEAR ?AUTO_84 ) ( not ( = ?AUTO_84 ?AUTO_86 ) ) ( not ( = ?AUTO_84 ?AUTO_87 ) ) ( not ( = ?AUTO_85 ?AUTO_86 ) ) ( not ( = ?AUTO_85 ?AUTO_87 ) ) ( not ( = ?AUTO_86 ?AUTO_87 ) ) ( ON ?AUTO_86 ?AUTO_85 ) ( CLEAR ?AUTO_86 ) ( HOLDING ?AUTO_87 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_87 )
      ( MAKE-ON ?AUTO_84 ?AUTO_85 )
      ( MAKE-ON-VERIFY ?AUTO_84 ?AUTO_85 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_88 - BLOCK
      ?AUTO_89 - BLOCK
    )
    :vars
    (
      ?AUTO_91 - BLOCK
      ?AUTO_90 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_88 ?AUTO_89 ) ) ( ON-TABLE ?AUTO_88 ) ( not ( = ?AUTO_88 ?AUTO_91 ) ) ( not ( = ?AUTO_88 ?AUTO_90 ) ) ( not ( = ?AUTO_89 ?AUTO_91 ) ) ( not ( = ?AUTO_89 ?AUTO_90 ) ) ( not ( = ?AUTO_91 ?AUTO_90 ) ) ( ON ?AUTO_91 ?AUTO_89 ) ( CLEAR ?AUTO_91 ) ( ON ?AUTO_90 ?AUTO_88 ) ( CLEAR ?AUTO_90 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_90 ?AUTO_88 )
      ( MAKE-ON ?AUTO_88 ?AUTO_89 )
      ( MAKE-ON-VERIFY ?AUTO_88 ?AUTO_89 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_93 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_93 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_93 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_93 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_94 - BLOCK
    )
    :vars
    (
      ?AUTO_95 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_94 ?AUTO_95 ) ( CLEAR ?AUTO_94 ) ( HAND-EMPTY ) ( not ( = ?AUTO_94 ?AUTO_95 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_94 ?AUTO_95 )
      ( MAKE-ON-TABLE ?AUTO_94 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_94 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_98 - BLOCK
      ?AUTO_99 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_98 ) ( CLEAR ?AUTO_99 ) ( not ( = ?AUTO_98 ?AUTO_99 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_98 ?AUTO_99 )
      ( MAKE-ON-VERIFY ?AUTO_98 ?AUTO_99 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_100 - BLOCK
      ?AUTO_101 - BLOCK
    )
    :vars
    (
      ?AUTO_102 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_101 ) ( not ( = ?AUTO_100 ?AUTO_101 ) ) ( ON ?AUTO_100 ?AUTO_102 ) ( CLEAR ?AUTO_100 ) ( HAND-EMPTY ) ( not ( = ?AUTO_100 ?AUTO_102 ) ) ( not ( = ?AUTO_101 ?AUTO_102 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_100 ?AUTO_102 )
      ( MAKE-ON ?AUTO_100 ?AUTO_101 )
      ( MAKE-ON-VERIFY ?AUTO_100 ?AUTO_101 ) )
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
    ( and ( CLEAR ?AUTO_104 ) ( not ( = ?AUTO_103 ?AUTO_104 ) ) ( ON ?AUTO_103 ?AUTO_105 ) ( CLEAR ?AUTO_103 ) ( not ( = ?AUTO_103 ?AUTO_105 ) ) ( not ( = ?AUTO_104 ?AUTO_105 ) ) ( HOLDING ?AUTO_106 ) ( not ( = ?AUTO_103 ?AUTO_106 ) ) ( not ( = ?AUTO_104 ?AUTO_106 ) ) ( not ( = ?AUTO_105 ?AUTO_106 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_106 )
      ( MAKE-ON ?AUTO_103 ?AUTO_104 )
      ( MAKE-ON-VERIFY ?AUTO_103 ?AUTO_104 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_110 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_110 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_110 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_110 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_111 - BLOCK
    )
    :vars
    (
      ?AUTO_112 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_111 ?AUTO_112 ) ( CLEAR ?AUTO_111 ) ( HAND-EMPTY ) ( not ( = ?AUTO_111 ?AUTO_112 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_111 ?AUTO_112 )
      ( MAKE-ON-TABLE ?AUTO_111 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_111 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_113 - BLOCK
    )
    :vars
    (
      ?AUTO_114 - BLOCK
      ?AUTO_115 - BLOCK
      ?AUTO_116 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_113 ?AUTO_114 ) ( CLEAR ?AUTO_113 ) ( not ( = ?AUTO_113 ?AUTO_114 ) ) ( HOLDING ?AUTO_115 ) ( CLEAR ?AUTO_116 ) ( not ( = ?AUTO_113 ?AUTO_115 ) ) ( not ( = ?AUTO_113 ?AUTO_116 ) ) ( not ( = ?AUTO_114 ?AUTO_115 ) ) ( not ( = ?AUTO_114 ?AUTO_116 ) ) ( not ( = ?AUTO_115 ?AUTO_116 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_115 ?AUTO_116 )
      ( MAKE-ON-TABLE ?AUTO_113 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_113 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_117 - BLOCK
    )
    :vars
    (
      ?AUTO_118 - BLOCK
      ?AUTO_120 - BLOCK
      ?AUTO_119 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_117 ?AUTO_118 ) ( not ( = ?AUTO_117 ?AUTO_118 ) ) ( CLEAR ?AUTO_120 ) ( not ( = ?AUTO_117 ?AUTO_119 ) ) ( not ( = ?AUTO_117 ?AUTO_120 ) ) ( not ( = ?AUTO_118 ?AUTO_119 ) ) ( not ( = ?AUTO_118 ?AUTO_120 ) ) ( not ( = ?AUTO_119 ?AUTO_120 ) ) ( ON ?AUTO_119 ?AUTO_117 ) ( CLEAR ?AUTO_119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_119 ?AUTO_117 )
      ( MAKE-ON-TABLE ?AUTO_117 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_117 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_121 - BLOCK
    )
    :vars
    (
      ?AUTO_122 - BLOCK
      ?AUTO_124 - BLOCK
      ?AUTO_123 - BLOCK
      ?AUTO_125 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_121 ?AUTO_122 ) ( not ( = ?AUTO_121 ?AUTO_122 ) ) ( CLEAR ?AUTO_124 ) ( not ( = ?AUTO_121 ?AUTO_123 ) ) ( not ( = ?AUTO_121 ?AUTO_124 ) ) ( not ( = ?AUTO_122 ?AUTO_123 ) ) ( not ( = ?AUTO_122 ?AUTO_124 ) ) ( not ( = ?AUTO_123 ?AUTO_124 ) ) ( ON ?AUTO_123 ?AUTO_121 ) ( CLEAR ?AUTO_123 ) ( HOLDING ?AUTO_125 ) ( not ( = ?AUTO_121 ?AUTO_125 ) ) ( not ( = ?AUTO_122 ?AUTO_125 ) ) ( not ( = ?AUTO_124 ?AUTO_125 ) ) ( not ( = ?AUTO_123 ?AUTO_125 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_125 )
      ( MAKE-ON-TABLE ?AUTO_121 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_121 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_129 - BLOCK
      ?AUTO_130 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_129 ) ( CLEAR ?AUTO_130 ) ( not ( = ?AUTO_129 ?AUTO_130 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_129 ?AUTO_130 )
      ( MAKE-ON-VERIFY ?AUTO_129 ?AUTO_130 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_131 - BLOCK
      ?AUTO_132 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_132 ) ( not ( = ?AUTO_131 ?AUTO_132 ) ) ( ON-TABLE ?AUTO_131 ) ( CLEAR ?AUTO_131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_131 )
      ( MAKE-ON ?AUTO_131 ?AUTO_132 )
      ( MAKE-ON-VERIFY ?AUTO_131 ?AUTO_132 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_133 - BLOCK
      ?AUTO_134 - BLOCK
    )
    :vars
    (
      ?AUTO_135 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_134 ) ( not ( = ?AUTO_133 ?AUTO_134 ) ) ( ON-TABLE ?AUTO_133 ) ( CLEAR ?AUTO_133 ) ( HOLDING ?AUTO_135 ) ( not ( = ?AUTO_133 ?AUTO_135 ) ) ( not ( = ?AUTO_134 ?AUTO_135 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_135 )
      ( MAKE-ON ?AUTO_133 ?AUTO_134 )
      ( MAKE-ON-VERIFY ?AUTO_133 ?AUTO_134 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_136 - BLOCK
      ?AUTO_137 - BLOCK
    )
    :vars
    (
      ?AUTO_138 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_137 ) ( not ( = ?AUTO_136 ?AUTO_137 ) ) ( ON-TABLE ?AUTO_136 ) ( not ( = ?AUTO_136 ?AUTO_138 ) ) ( not ( = ?AUTO_137 ?AUTO_138 ) ) ( ON ?AUTO_138 ?AUTO_136 ) ( CLEAR ?AUTO_138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_138 ?AUTO_136 )
      ( MAKE-ON ?AUTO_136 ?AUTO_137 )
      ( MAKE-ON-VERIFY ?AUTO_136 ?AUTO_137 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_139 - BLOCK
      ?AUTO_140 - BLOCK
    )
    :vars
    (
      ?AUTO_141 - BLOCK
      ?AUTO_142 - BLOCK
      ?AUTO_143 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_140 ) ( not ( = ?AUTO_139 ?AUTO_140 ) ) ( ON-TABLE ?AUTO_139 ) ( not ( = ?AUTO_139 ?AUTO_141 ) ) ( not ( = ?AUTO_140 ?AUTO_141 ) ) ( ON ?AUTO_141 ?AUTO_139 ) ( CLEAR ?AUTO_141 ) ( HOLDING ?AUTO_142 ) ( CLEAR ?AUTO_143 ) ( not ( = ?AUTO_139 ?AUTO_142 ) ) ( not ( = ?AUTO_139 ?AUTO_143 ) ) ( not ( = ?AUTO_140 ?AUTO_142 ) ) ( not ( = ?AUTO_140 ?AUTO_143 ) ) ( not ( = ?AUTO_141 ?AUTO_142 ) ) ( not ( = ?AUTO_141 ?AUTO_143 ) ) ( not ( = ?AUTO_142 ?AUTO_143 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_142 ?AUTO_143 )
      ( MAKE-ON ?AUTO_139 ?AUTO_140 )
      ( MAKE-ON-VERIFY ?AUTO_139 ?AUTO_140 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_144 - BLOCK
      ?AUTO_145 - BLOCK
    )
    :vars
    (
      ?AUTO_146 - BLOCK
      ?AUTO_147 - BLOCK
      ?AUTO_148 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_145 ) ( not ( = ?AUTO_144 ?AUTO_145 ) ) ( ON-TABLE ?AUTO_144 ) ( not ( = ?AUTO_144 ?AUTO_146 ) ) ( not ( = ?AUTO_145 ?AUTO_146 ) ) ( ON ?AUTO_146 ?AUTO_144 ) ( CLEAR ?AUTO_147 ) ( not ( = ?AUTO_144 ?AUTO_148 ) ) ( not ( = ?AUTO_144 ?AUTO_147 ) ) ( not ( = ?AUTO_145 ?AUTO_148 ) ) ( not ( = ?AUTO_145 ?AUTO_147 ) ) ( not ( = ?AUTO_146 ?AUTO_148 ) ) ( not ( = ?AUTO_146 ?AUTO_147 ) ) ( not ( = ?AUTO_148 ?AUTO_147 ) ) ( ON ?AUTO_148 ?AUTO_146 ) ( CLEAR ?AUTO_148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_148 ?AUTO_146 )
      ( MAKE-ON ?AUTO_144 ?AUTO_145 )
      ( MAKE-ON-VERIFY ?AUTO_144 ?AUTO_145 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_149 - BLOCK
      ?AUTO_150 - BLOCK
    )
    :vars
    (
      ?AUTO_153 - BLOCK
      ?AUTO_152 - BLOCK
      ?AUTO_151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_149 ?AUTO_150 ) ) ( ON-TABLE ?AUTO_149 ) ( not ( = ?AUTO_149 ?AUTO_153 ) ) ( not ( = ?AUTO_150 ?AUTO_153 ) ) ( ON ?AUTO_153 ?AUTO_149 ) ( CLEAR ?AUTO_152 ) ( not ( = ?AUTO_149 ?AUTO_151 ) ) ( not ( = ?AUTO_149 ?AUTO_152 ) ) ( not ( = ?AUTO_150 ?AUTO_151 ) ) ( not ( = ?AUTO_150 ?AUTO_152 ) ) ( not ( = ?AUTO_153 ?AUTO_151 ) ) ( not ( = ?AUTO_153 ?AUTO_152 ) ) ( not ( = ?AUTO_151 ?AUTO_152 ) ) ( ON ?AUTO_151 ?AUTO_153 ) ( CLEAR ?AUTO_151 ) ( HOLDING ?AUTO_150 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_150 )
      ( MAKE-ON ?AUTO_149 ?AUTO_150 )
      ( MAKE-ON-VERIFY ?AUTO_149 ?AUTO_150 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_158 - BLOCK
      ?AUTO_159 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_158 ) ( CLEAR ?AUTO_159 ) ( not ( = ?AUTO_158 ?AUTO_159 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_158 ?AUTO_159 )
      ( MAKE-ON-VERIFY ?AUTO_158 ?AUTO_159 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_160 - BLOCK
      ?AUTO_161 - BLOCK
    )
    :vars
    (
      ?AUTO_162 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_161 ) ( not ( = ?AUTO_160 ?AUTO_161 ) ) ( ON ?AUTO_160 ?AUTO_162 ) ( CLEAR ?AUTO_160 ) ( HAND-EMPTY ) ( not ( = ?AUTO_160 ?AUTO_162 ) ) ( not ( = ?AUTO_161 ?AUTO_162 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_160 ?AUTO_162 )
      ( MAKE-ON ?AUTO_160 ?AUTO_161 )
      ( MAKE-ON-VERIFY ?AUTO_160 ?AUTO_161 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_163 - BLOCK
      ?AUTO_164 - BLOCK
    )
    :vars
    (
      ?AUTO_165 - BLOCK
      ?AUTO_166 - BLOCK
      ?AUTO_167 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_164 ) ( not ( = ?AUTO_163 ?AUTO_164 ) ) ( ON ?AUTO_163 ?AUTO_165 ) ( CLEAR ?AUTO_163 ) ( not ( = ?AUTO_163 ?AUTO_165 ) ) ( not ( = ?AUTO_164 ?AUTO_165 ) ) ( HOLDING ?AUTO_166 ) ( CLEAR ?AUTO_167 ) ( not ( = ?AUTO_163 ?AUTO_166 ) ) ( not ( = ?AUTO_163 ?AUTO_167 ) ) ( not ( = ?AUTO_164 ?AUTO_166 ) ) ( not ( = ?AUTO_164 ?AUTO_167 ) ) ( not ( = ?AUTO_165 ?AUTO_166 ) ) ( not ( = ?AUTO_165 ?AUTO_167 ) ) ( not ( = ?AUTO_166 ?AUTO_167 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_166 ?AUTO_167 )
      ( MAKE-ON ?AUTO_163 ?AUTO_164 )
      ( MAKE-ON-VERIFY ?AUTO_163 ?AUTO_164 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_180 - BLOCK
      ?AUTO_181 - BLOCK
    )
    :vars
    (
      ?AUTO_184 - BLOCK
      ?AUTO_183 - BLOCK
      ?AUTO_182 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_180 ?AUTO_181 ) ) ( ON ?AUTO_180 ?AUTO_184 ) ( CLEAR ?AUTO_180 ) ( not ( = ?AUTO_180 ?AUTO_184 ) ) ( not ( = ?AUTO_181 ?AUTO_184 ) ) ( CLEAR ?AUTO_183 ) ( not ( = ?AUTO_180 ?AUTO_182 ) ) ( not ( = ?AUTO_180 ?AUTO_183 ) ) ( not ( = ?AUTO_181 ?AUTO_182 ) ) ( not ( = ?AUTO_181 ?AUTO_183 ) ) ( not ( = ?AUTO_184 ?AUTO_182 ) ) ( not ( = ?AUTO_184 ?AUTO_183 ) ) ( not ( = ?AUTO_182 ?AUTO_183 ) ) ( ON ?AUTO_182 ?AUTO_181 ) ( CLEAR ?AUTO_182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_182 ?AUTO_181 )
      ( MAKE-ON ?AUTO_180 ?AUTO_181 )
      ( MAKE-ON-VERIFY ?AUTO_180 ?AUTO_181 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_187 - BLOCK
      ?AUTO_188 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_187 ) ( CLEAR ?AUTO_188 ) ( not ( = ?AUTO_187 ?AUTO_188 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_187 ?AUTO_188 )
      ( MAKE-ON-VERIFY ?AUTO_187 ?AUTO_188 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_189 - BLOCK
      ?AUTO_190 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_190 ) ( not ( = ?AUTO_189 ?AUTO_190 ) ) ( ON-TABLE ?AUTO_189 ) ( CLEAR ?AUTO_189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_189 )
      ( MAKE-ON ?AUTO_189 ?AUTO_190 )
      ( MAKE-ON-VERIFY ?AUTO_189 ?AUTO_190 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_191 - BLOCK
      ?AUTO_192 - BLOCK
    )
    :vars
    (
      ?AUTO_193 - BLOCK
      ?AUTO_194 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_192 ) ( not ( = ?AUTO_191 ?AUTO_192 ) ) ( ON-TABLE ?AUTO_191 ) ( CLEAR ?AUTO_191 ) ( HOLDING ?AUTO_193 ) ( CLEAR ?AUTO_194 ) ( not ( = ?AUTO_191 ?AUTO_193 ) ) ( not ( = ?AUTO_191 ?AUTO_194 ) ) ( not ( = ?AUTO_192 ?AUTO_193 ) ) ( not ( = ?AUTO_192 ?AUTO_194 ) ) ( not ( = ?AUTO_193 ?AUTO_194 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_193 ?AUTO_194 )
      ( MAKE-ON ?AUTO_191 ?AUTO_192 )
      ( MAKE-ON-VERIFY ?AUTO_191 ?AUTO_192 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_195 - BLOCK
      ?AUTO_196 - BLOCK
    )
    :vars
    (
      ?AUTO_197 - BLOCK
      ?AUTO_198 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_196 ) ( not ( = ?AUTO_195 ?AUTO_196 ) ) ( ON-TABLE ?AUTO_195 ) ( CLEAR ?AUTO_197 ) ( not ( = ?AUTO_195 ?AUTO_198 ) ) ( not ( = ?AUTO_195 ?AUTO_197 ) ) ( not ( = ?AUTO_196 ?AUTO_198 ) ) ( not ( = ?AUTO_196 ?AUTO_197 ) ) ( not ( = ?AUTO_198 ?AUTO_197 ) ) ( ON ?AUTO_198 ?AUTO_195 ) ( CLEAR ?AUTO_198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_198 ?AUTO_195 )
      ( MAKE-ON ?AUTO_195 ?AUTO_196 )
      ( MAKE-ON-VERIFY ?AUTO_195 ?AUTO_196 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_199 - BLOCK
      ?AUTO_200 - BLOCK
    )
    :vars
    (
      ?AUTO_202 - BLOCK
      ?AUTO_201 - BLOCK
      ?AUTO_203 - BLOCK
      ?AUTO_204 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_200 ) ( not ( = ?AUTO_199 ?AUTO_200 ) ) ( ON-TABLE ?AUTO_199 ) ( CLEAR ?AUTO_202 ) ( not ( = ?AUTO_199 ?AUTO_201 ) ) ( not ( = ?AUTO_199 ?AUTO_202 ) ) ( not ( = ?AUTO_200 ?AUTO_201 ) ) ( not ( = ?AUTO_200 ?AUTO_202 ) ) ( not ( = ?AUTO_201 ?AUTO_202 ) ) ( ON ?AUTO_201 ?AUTO_199 ) ( CLEAR ?AUTO_201 ) ( HOLDING ?AUTO_203 ) ( CLEAR ?AUTO_204 ) ( not ( = ?AUTO_199 ?AUTO_203 ) ) ( not ( = ?AUTO_199 ?AUTO_204 ) ) ( not ( = ?AUTO_200 ?AUTO_203 ) ) ( not ( = ?AUTO_200 ?AUTO_204 ) ) ( not ( = ?AUTO_202 ?AUTO_203 ) ) ( not ( = ?AUTO_202 ?AUTO_204 ) ) ( not ( = ?AUTO_201 ?AUTO_203 ) ) ( not ( = ?AUTO_201 ?AUTO_204 ) ) ( not ( = ?AUTO_203 ?AUTO_204 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_203 ?AUTO_204 )
      ( MAKE-ON ?AUTO_199 ?AUTO_200 )
      ( MAKE-ON-VERIFY ?AUTO_199 ?AUTO_200 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_207 - BLOCK
      ?AUTO_208 - BLOCK
    )
    :vars
    (
      ?AUTO_210 - BLOCK
      ?AUTO_209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_207 ?AUTO_208 ) ) ( ON-TABLE ?AUTO_207 ) ( CLEAR ?AUTO_210 ) ( not ( = ?AUTO_207 ?AUTO_209 ) ) ( not ( = ?AUTO_207 ?AUTO_210 ) ) ( not ( = ?AUTO_208 ?AUTO_209 ) ) ( not ( = ?AUTO_208 ?AUTO_210 ) ) ( not ( = ?AUTO_209 ?AUTO_210 ) ) ( ON ?AUTO_209 ?AUTO_207 ) ( CLEAR ?AUTO_209 ) ( HOLDING ?AUTO_208 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_208 )
      ( MAKE-ON ?AUTO_207 ?AUTO_208 )
      ( MAKE-ON-VERIFY ?AUTO_207 ?AUTO_208 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_215 - BLOCK
      ?AUTO_216 - BLOCK
    )
    :vars
    (
      ?AUTO_217 - BLOCK
      ?AUTO_218 - BLOCK
      ?AUTO_219 - BLOCK
      ?AUTO_220 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_215 ?AUTO_216 ) ) ( ON-TABLE ?AUTO_215 ) ( CLEAR ?AUTO_217 ) ( not ( = ?AUTO_215 ?AUTO_218 ) ) ( not ( = ?AUTO_215 ?AUTO_217 ) ) ( not ( = ?AUTO_216 ?AUTO_218 ) ) ( not ( = ?AUTO_216 ?AUTO_217 ) ) ( not ( = ?AUTO_218 ?AUTO_217 ) ) ( ON ?AUTO_218 ?AUTO_215 ) ( CLEAR ?AUTO_218 ) ( CLEAR ?AUTO_219 ) ( not ( = ?AUTO_215 ?AUTO_220 ) ) ( not ( = ?AUTO_215 ?AUTO_219 ) ) ( not ( = ?AUTO_216 ?AUTO_220 ) ) ( not ( = ?AUTO_216 ?AUTO_219 ) ) ( not ( = ?AUTO_217 ?AUTO_220 ) ) ( not ( = ?AUTO_217 ?AUTO_219 ) ) ( not ( = ?AUTO_218 ?AUTO_220 ) ) ( not ( = ?AUTO_218 ?AUTO_219 ) ) ( not ( = ?AUTO_220 ?AUTO_219 ) ) ( ON ?AUTO_220 ?AUTO_216 ) ( CLEAR ?AUTO_220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_220 ?AUTO_216 )
      ( MAKE-ON ?AUTO_215 ?AUTO_216 )
      ( MAKE-ON-VERIFY ?AUTO_215 ?AUTO_216 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_221 - BLOCK
      ?AUTO_222 - BLOCK
    )
    :vars
    (
      ?AUTO_226 - BLOCK
      ?AUTO_223 - BLOCK
      ?AUTO_225 - BLOCK
      ?AUTO_224 - BLOCK
      ?AUTO_227 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_221 ?AUTO_222 ) ) ( ON-TABLE ?AUTO_221 ) ( CLEAR ?AUTO_226 ) ( not ( = ?AUTO_221 ?AUTO_223 ) ) ( not ( = ?AUTO_221 ?AUTO_226 ) ) ( not ( = ?AUTO_222 ?AUTO_223 ) ) ( not ( = ?AUTO_222 ?AUTO_226 ) ) ( not ( = ?AUTO_223 ?AUTO_226 ) ) ( ON ?AUTO_223 ?AUTO_221 ) ( CLEAR ?AUTO_223 ) ( CLEAR ?AUTO_225 ) ( not ( = ?AUTO_221 ?AUTO_224 ) ) ( not ( = ?AUTO_221 ?AUTO_225 ) ) ( not ( = ?AUTO_222 ?AUTO_224 ) ) ( not ( = ?AUTO_222 ?AUTO_225 ) ) ( not ( = ?AUTO_226 ?AUTO_224 ) ) ( not ( = ?AUTO_226 ?AUTO_225 ) ) ( not ( = ?AUTO_223 ?AUTO_224 ) ) ( not ( = ?AUTO_223 ?AUTO_225 ) ) ( not ( = ?AUTO_224 ?AUTO_225 ) ) ( ON ?AUTO_224 ?AUTO_222 ) ( CLEAR ?AUTO_224 ) ( HOLDING ?AUTO_227 ) ( not ( = ?AUTO_221 ?AUTO_227 ) ) ( not ( = ?AUTO_222 ?AUTO_227 ) ) ( not ( = ?AUTO_226 ?AUTO_227 ) ) ( not ( = ?AUTO_223 ?AUTO_227 ) ) ( not ( = ?AUTO_225 ?AUTO_227 ) ) ( not ( = ?AUTO_224 ?AUTO_227 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_227 )
      ( MAKE-ON ?AUTO_221 ?AUTO_222 )
      ( MAKE-ON-VERIFY ?AUTO_221 ?AUTO_222 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_232 - BLOCK
      ?AUTO_233 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_232 ) ( CLEAR ?AUTO_233 ) ( not ( = ?AUTO_232 ?AUTO_233 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_232 ?AUTO_233 )
      ( MAKE-ON-VERIFY ?AUTO_232 ?AUTO_233 ) )
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
    )
    :precondition
    ( and ( CLEAR ?AUTO_235 ) ( not ( = ?AUTO_234 ?AUTO_235 ) ) ( ON ?AUTO_234 ?AUTO_236 ) ( CLEAR ?AUTO_234 ) ( HAND-EMPTY ) ( not ( = ?AUTO_234 ?AUTO_236 ) ) ( not ( = ?AUTO_235 ?AUTO_236 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_234 ?AUTO_236 )
      ( MAKE-ON ?AUTO_234 ?AUTO_235 )
      ( MAKE-ON-VERIFY ?AUTO_234 ?AUTO_235 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_237 - BLOCK
      ?AUTO_238 - BLOCK
    )
    :vars
    (
      ?AUTO_239 - BLOCK
      ?AUTO_240 - BLOCK
      ?AUTO_241 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_238 ) ( not ( = ?AUTO_237 ?AUTO_238 ) ) ( ON ?AUTO_237 ?AUTO_239 ) ( CLEAR ?AUTO_237 ) ( not ( = ?AUTO_237 ?AUTO_239 ) ) ( not ( = ?AUTO_238 ?AUTO_239 ) ) ( HOLDING ?AUTO_240 ) ( CLEAR ?AUTO_241 ) ( not ( = ?AUTO_237 ?AUTO_240 ) ) ( not ( = ?AUTO_237 ?AUTO_241 ) ) ( not ( = ?AUTO_238 ?AUTO_240 ) ) ( not ( = ?AUTO_238 ?AUTO_241 ) ) ( not ( = ?AUTO_239 ?AUTO_240 ) ) ( not ( = ?AUTO_239 ?AUTO_241 ) ) ( not ( = ?AUTO_240 ?AUTO_241 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_240 ?AUTO_241 )
      ( MAKE-ON ?AUTO_237 ?AUTO_238 )
      ( MAKE-ON-VERIFY ?AUTO_237 ?AUTO_238 ) )
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
      ?AUTO_251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_248 ?AUTO_249 ) ) ( ON ?AUTO_248 ?AUTO_250 ) ( CLEAR ?AUTO_248 ) ( not ( = ?AUTO_248 ?AUTO_250 ) ) ( not ( = ?AUTO_249 ?AUTO_250 ) ) ( HOLDING ?AUTO_249 ) ( CLEAR ?AUTO_251 ) ( not ( = ?AUTO_248 ?AUTO_251 ) ) ( not ( = ?AUTO_249 ?AUTO_251 ) ) ( not ( = ?AUTO_250 ?AUTO_251 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_249 ?AUTO_251 )
      ( MAKE-ON ?AUTO_248 ?AUTO_249 )
      ( MAKE-ON-VERIFY ?AUTO_248 ?AUTO_249 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_256 - BLOCK
      ?AUTO_257 - BLOCK
    )
    :vars
    (
      ?AUTO_258 - BLOCK
      ?AUTO_259 - BLOCK
      ?AUTO_260 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_256 ?AUTO_257 ) ) ( ON ?AUTO_256 ?AUTO_258 ) ( CLEAR ?AUTO_256 ) ( not ( = ?AUTO_256 ?AUTO_258 ) ) ( not ( = ?AUTO_257 ?AUTO_258 ) ) ( CLEAR ?AUTO_259 ) ( not ( = ?AUTO_256 ?AUTO_260 ) ) ( not ( = ?AUTO_256 ?AUTO_259 ) ) ( not ( = ?AUTO_257 ?AUTO_260 ) ) ( not ( = ?AUTO_257 ?AUTO_259 ) ) ( not ( = ?AUTO_258 ?AUTO_260 ) ) ( not ( = ?AUTO_258 ?AUTO_259 ) ) ( not ( = ?AUTO_260 ?AUTO_259 ) ) ( ON ?AUTO_260 ?AUTO_257 ) ( CLEAR ?AUTO_260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_260 ?AUTO_257 )
      ( MAKE-ON ?AUTO_256 ?AUTO_257 )
      ( MAKE-ON-VERIFY ?AUTO_256 ?AUTO_257 ) )
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
      ?AUTO_264 - BLOCK
      ?AUTO_265 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_261 ?AUTO_262 ) ) ( not ( = ?AUTO_261 ?AUTO_263 ) ) ( not ( = ?AUTO_262 ?AUTO_263 ) ) ( CLEAR ?AUTO_264 ) ( not ( = ?AUTO_261 ?AUTO_265 ) ) ( not ( = ?AUTO_261 ?AUTO_264 ) ) ( not ( = ?AUTO_262 ?AUTO_265 ) ) ( not ( = ?AUTO_262 ?AUTO_264 ) ) ( not ( = ?AUTO_263 ?AUTO_265 ) ) ( not ( = ?AUTO_263 ?AUTO_264 ) ) ( not ( = ?AUTO_265 ?AUTO_264 ) ) ( ON ?AUTO_265 ?AUTO_262 ) ( CLEAR ?AUTO_265 ) ( HOLDING ?AUTO_261 ) ( CLEAR ?AUTO_263 ) )
    :subtasks
    ( ( !STACK ?AUTO_261 ?AUTO_263 )
      ( MAKE-ON ?AUTO_261 ?AUTO_262 )
      ( MAKE-ON-VERIFY ?AUTO_261 ?AUTO_262 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_266 - BLOCK
      ?AUTO_267 - BLOCK
    )
    :vars
    (
      ?AUTO_269 - BLOCK
      ?AUTO_268 - BLOCK
      ?AUTO_270 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_266 ?AUTO_267 ) ) ( not ( = ?AUTO_266 ?AUTO_269 ) ) ( not ( = ?AUTO_267 ?AUTO_269 ) ) ( CLEAR ?AUTO_268 ) ( not ( = ?AUTO_266 ?AUTO_270 ) ) ( not ( = ?AUTO_266 ?AUTO_268 ) ) ( not ( = ?AUTO_267 ?AUTO_270 ) ) ( not ( = ?AUTO_267 ?AUTO_268 ) ) ( not ( = ?AUTO_269 ?AUTO_270 ) ) ( not ( = ?AUTO_269 ?AUTO_268 ) ) ( not ( = ?AUTO_270 ?AUTO_268 ) ) ( ON ?AUTO_270 ?AUTO_267 ) ( CLEAR ?AUTO_269 ) ( ON ?AUTO_266 ?AUTO_270 ) ( CLEAR ?AUTO_266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_266 ?AUTO_270 )
      ( MAKE-ON ?AUTO_266 ?AUTO_267 )
      ( MAKE-ON-VERIFY ?AUTO_266 ?AUTO_267 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_271 - BLOCK
      ?AUTO_272 - BLOCK
    )
    :vars
    (
      ?AUTO_275 - BLOCK
      ?AUTO_274 - BLOCK
      ?AUTO_273 - BLOCK
      ?AUTO_276 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_271 ?AUTO_272 ) ) ( not ( = ?AUTO_271 ?AUTO_275 ) ) ( not ( = ?AUTO_272 ?AUTO_275 ) ) ( CLEAR ?AUTO_274 ) ( not ( = ?AUTO_271 ?AUTO_273 ) ) ( not ( = ?AUTO_271 ?AUTO_274 ) ) ( not ( = ?AUTO_272 ?AUTO_273 ) ) ( not ( = ?AUTO_272 ?AUTO_274 ) ) ( not ( = ?AUTO_275 ?AUTO_273 ) ) ( not ( = ?AUTO_275 ?AUTO_274 ) ) ( not ( = ?AUTO_273 ?AUTO_274 ) ) ( ON ?AUTO_273 ?AUTO_272 ) ( CLEAR ?AUTO_275 ) ( ON ?AUTO_271 ?AUTO_273 ) ( CLEAR ?AUTO_271 ) ( HOLDING ?AUTO_276 ) ( not ( = ?AUTO_271 ?AUTO_276 ) ) ( not ( = ?AUTO_272 ?AUTO_276 ) ) ( not ( = ?AUTO_275 ?AUTO_276 ) ) ( not ( = ?AUTO_274 ?AUTO_276 ) ) ( not ( = ?AUTO_273 ?AUTO_276 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_276 )
      ( MAKE-ON ?AUTO_271 ?AUTO_272 )
      ( MAKE-ON-VERIFY ?AUTO_271 ?AUTO_272 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_281 - BLOCK
      ?AUTO_282 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_281 ) ( CLEAR ?AUTO_282 ) ( not ( = ?AUTO_281 ?AUTO_282 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_281 ?AUTO_282 )
      ( MAKE-ON-VERIFY ?AUTO_281 ?AUTO_282 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_283 - BLOCK
      ?AUTO_284 - BLOCK
    )
    :vars
    (
      ?AUTO_285 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_284 ) ( not ( = ?AUTO_283 ?AUTO_284 ) ) ( ON ?AUTO_283 ?AUTO_285 ) ( CLEAR ?AUTO_283 ) ( HAND-EMPTY ) ( not ( = ?AUTO_283 ?AUTO_285 ) ) ( not ( = ?AUTO_284 ?AUTO_285 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_283 ?AUTO_285 )
      ( MAKE-ON ?AUTO_283 ?AUTO_284 )
      ( MAKE-ON-VERIFY ?AUTO_283 ?AUTO_284 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_286 - BLOCK
      ?AUTO_287 - BLOCK
    )
    :vars
    (
      ?AUTO_288 - BLOCK
      ?AUTO_289 - BLOCK
      ?AUTO_290 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_287 ) ( not ( = ?AUTO_286 ?AUTO_287 ) ) ( ON ?AUTO_286 ?AUTO_288 ) ( CLEAR ?AUTO_286 ) ( not ( = ?AUTO_286 ?AUTO_288 ) ) ( not ( = ?AUTO_287 ?AUTO_288 ) ) ( HOLDING ?AUTO_289 ) ( CLEAR ?AUTO_290 ) ( not ( = ?AUTO_286 ?AUTO_289 ) ) ( not ( = ?AUTO_286 ?AUTO_290 ) ) ( not ( = ?AUTO_287 ?AUTO_289 ) ) ( not ( = ?AUTO_287 ?AUTO_290 ) ) ( not ( = ?AUTO_288 ?AUTO_289 ) ) ( not ( = ?AUTO_288 ?AUTO_290 ) ) ( not ( = ?AUTO_289 ?AUTO_290 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_289 ?AUTO_290 )
      ( MAKE-ON ?AUTO_286 ?AUTO_287 )
      ( MAKE-ON-VERIFY ?AUTO_286 ?AUTO_287 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_293 - BLOCK
      ?AUTO_294 - BLOCK
    )
    :vars
    (
      ?AUTO_295 - BLOCK
      ?AUTO_296 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_293 ?AUTO_294 ) ) ( ON ?AUTO_293 ?AUTO_295 ) ( CLEAR ?AUTO_293 ) ( not ( = ?AUTO_293 ?AUTO_295 ) ) ( not ( = ?AUTO_294 ?AUTO_295 ) ) ( HOLDING ?AUTO_294 ) ( CLEAR ?AUTO_296 ) ( not ( = ?AUTO_293 ?AUTO_296 ) ) ( not ( = ?AUTO_294 ?AUTO_296 ) ) ( not ( = ?AUTO_295 ?AUTO_296 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_294 ?AUTO_296 )
      ( MAKE-ON ?AUTO_293 ?AUTO_294 )
      ( MAKE-ON-VERIFY ?AUTO_293 ?AUTO_294 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_352 - BLOCK
      ?AUTO_353 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_352 ) ( CLEAR ?AUTO_353 ) ( not ( = ?AUTO_352 ?AUTO_353 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_352 ?AUTO_353 )
      ( MAKE-ON-VERIFY ?AUTO_352 ?AUTO_353 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_354 - BLOCK
      ?AUTO_355 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_355 ) ( not ( = ?AUTO_354 ?AUTO_355 ) ) ( ON-TABLE ?AUTO_354 ) ( CLEAR ?AUTO_354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_354 )
      ( MAKE-ON ?AUTO_354 ?AUTO_355 )
      ( MAKE-ON-VERIFY ?AUTO_354 ?AUTO_355 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_356 - BLOCK
      ?AUTO_357 - BLOCK
    )
    :vars
    (
      ?AUTO_358 - BLOCK
      ?AUTO_359 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_357 ) ( not ( = ?AUTO_356 ?AUTO_357 ) ) ( ON-TABLE ?AUTO_356 ) ( CLEAR ?AUTO_356 ) ( HOLDING ?AUTO_358 ) ( CLEAR ?AUTO_359 ) ( not ( = ?AUTO_356 ?AUTO_358 ) ) ( not ( = ?AUTO_356 ?AUTO_359 ) ) ( not ( = ?AUTO_357 ?AUTO_358 ) ) ( not ( = ?AUTO_357 ?AUTO_359 ) ) ( not ( = ?AUTO_358 ?AUTO_359 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_358 ?AUTO_359 )
      ( MAKE-ON ?AUTO_356 ?AUTO_357 )
      ( MAKE-ON-VERIFY ?AUTO_356 ?AUTO_357 ) )
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
    )
    :precondition
    ( and ( CLEAR ?AUTO_361 ) ( not ( = ?AUTO_360 ?AUTO_361 ) ) ( ON-TABLE ?AUTO_360 ) ( CLEAR ?AUTO_362 ) ( not ( = ?AUTO_360 ?AUTO_363 ) ) ( not ( = ?AUTO_360 ?AUTO_362 ) ) ( not ( = ?AUTO_361 ?AUTO_363 ) ) ( not ( = ?AUTO_361 ?AUTO_362 ) ) ( not ( = ?AUTO_363 ?AUTO_362 ) ) ( ON ?AUTO_363 ?AUTO_360 ) ( CLEAR ?AUTO_363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_363 ?AUTO_360 )
      ( MAKE-ON ?AUTO_360 ?AUTO_361 )
      ( MAKE-ON-VERIFY ?AUTO_360 ?AUTO_361 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_364 - BLOCK
      ?AUTO_365 - BLOCK
    )
    :vars
    (
      ?AUTO_367 - BLOCK
      ?AUTO_366 - BLOCK
      ?AUTO_368 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_364 ?AUTO_365 ) ) ( ON-TABLE ?AUTO_364 ) ( CLEAR ?AUTO_367 ) ( not ( = ?AUTO_364 ?AUTO_366 ) ) ( not ( = ?AUTO_364 ?AUTO_367 ) ) ( not ( = ?AUTO_365 ?AUTO_366 ) ) ( not ( = ?AUTO_365 ?AUTO_367 ) ) ( not ( = ?AUTO_366 ?AUTO_367 ) ) ( ON ?AUTO_366 ?AUTO_364 ) ( CLEAR ?AUTO_366 ) ( HOLDING ?AUTO_365 ) ( CLEAR ?AUTO_368 ) ( not ( = ?AUTO_364 ?AUTO_368 ) ) ( not ( = ?AUTO_365 ?AUTO_368 ) ) ( not ( = ?AUTO_367 ?AUTO_368 ) ) ( not ( = ?AUTO_366 ?AUTO_368 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_365 ?AUTO_368 )
      ( MAKE-ON ?AUTO_364 ?AUTO_365 )
      ( MAKE-ON-VERIFY ?AUTO_364 ?AUTO_365 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_371 - BLOCK
      ?AUTO_372 - BLOCK
    )
    :vars
    (
      ?AUTO_373 - BLOCK
      ?AUTO_374 - BLOCK
      ?AUTO_375 - BLOCK
      ?AUTO_376 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_372 ) ( not ( = ?AUTO_371 ?AUTO_372 ) ) ( ON-TABLE ?AUTO_371 ) ( CLEAR ?AUTO_373 ) ( not ( = ?AUTO_371 ?AUTO_374 ) ) ( not ( = ?AUTO_371 ?AUTO_373 ) ) ( not ( = ?AUTO_372 ?AUTO_374 ) ) ( not ( = ?AUTO_372 ?AUTO_373 ) ) ( not ( = ?AUTO_374 ?AUTO_373 ) ) ( ON ?AUTO_374 ?AUTO_371 ) ( CLEAR ?AUTO_374 ) ( HOLDING ?AUTO_375 ) ( CLEAR ?AUTO_376 ) ( not ( = ?AUTO_371 ?AUTO_375 ) ) ( not ( = ?AUTO_371 ?AUTO_376 ) ) ( not ( = ?AUTO_372 ?AUTO_375 ) ) ( not ( = ?AUTO_372 ?AUTO_376 ) ) ( not ( = ?AUTO_373 ?AUTO_375 ) ) ( not ( = ?AUTO_373 ?AUTO_376 ) ) ( not ( = ?AUTO_374 ?AUTO_375 ) ) ( not ( = ?AUTO_374 ?AUTO_376 ) ) ( not ( = ?AUTO_375 ?AUTO_376 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_375 ?AUTO_376 )
      ( MAKE-ON ?AUTO_371 ?AUTO_372 )
      ( MAKE-ON-VERIFY ?AUTO_371 ?AUTO_372 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_391 - BLOCK
      ?AUTO_392 - BLOCK
    )
    :vars
    (
      ?AUTO_393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_391 ?AUTO_392 ) ) ( ON-TABLE ?AUTO_391 ) ( CLEAR ?AUTO_391 ) ( HOLDING ?AUTO_392 ) ( CLEAR ?AUTO_393 ) ( not ( = ?AUTO_391 ?AUTO_393 ) ) ( not ( = ?AUTO_392 ?AUTO_393 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_392 ?AUTO_393 )
      ( MAKE-ON ?AUTO_391 ?AUTO_392 )
      ( MAKE-ON-VERIFY ?AUTO_391 ?AUTO_392 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_395 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_395 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_395 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_395 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_396 - BLOCK
    )
    :vars
    (
      ?AUTO_397 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_396 ?AUTO_397 ) ( CLEAR ?AUTO_396 ) ( HAND-EMPTY ) ( not ( = ?AUTO_396 ?AUTO_397 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_396 ?AUTO_397 )
      ( MAKE-ON-TABLE ?AUTO_396 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_396 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_399 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_399 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_399 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_399 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_400 - BLOCK
    )
    :vars
    (
      ?AUTO_401 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_400 ?AUTO_401 ) ( CLEAR ?AUTO_400 ) ( HAND-EMPTY ) ( not ( = ?AUTO_400 ?AUTO_401 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_400 ?AUTO_401 )
      ( MAKE-ON-TABLE ?AUTO_400 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_400 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_402 - BLOCK
    )
    :vars
    (
      ?AUTO_403 - BLOCK
      ?AUTO_404 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_402 ?AUTO_403 ) ( CLEAR ?AUTO_402 ) ( not ( = ?AUTO_402 ?AUTO_403 ) ) ( HOLDING ?AUTO_404 ) ( not ( = ?AUTO_402 ?AUTO_404 ) ) ( not ( = ?AUTO_403 ?AUTO_404 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_404 )
      ( MAKE-ON-TABLE ?AUTO_402 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_402 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_408 - BLOCK
      ?AUTO_409 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_408 ) ( CLEAR ?AUTO_409 ) ( not ( = ?AUTO_408 ?AUTO_409 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_408 ?AUTO_409 )
      ( MAKE-ON-VERIFY ?AUTO_408 ?AUTO_409 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_410 - BLOCK
      ?AUTO_411 - BLOCK
    )
    :vars
    (
      ?AUTO_412 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_411 ) ( not ( = ?AUTO_410 ?AUTO_411 ) ) ( ON ?AUTO_410 ?AUTO_412 ) ( CLEAR ?AUTO_410 ) ( HAND-EMPTY ) ( not ( = ?AUTO_410 ?AUTO_412 ) ) ( not ( = ?AUTO_411 ?AUTO_412 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_410 ?AUTO_412 )
      ( MAKE-ON ?AUTO_410 ?AUTO_411 )
      ( MAKE-ON-VERIFY ?AUTO_410 ?AUTO_411 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_413 - BLOCK
      ?AUTO_414 - BLOCK
    )
    :vars
    (
      ?AUTO_415 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_413 ?AUTO_414 ) ) ( ON ?AUTO_413 ?AUTO_415 ) ( CLEAR ?AUTO_413 ) ( not ( = ?AUTO_413 ?AUTO_415 ) ) ( not ( = ?AUTO_414 ?AUTO_415 ) ) ( HOLDING ?AUTO_414 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_414 )
      ( MAKE-ON ?AUTO_413 ?AUTO_414 )
      ( MAKE-ON-VERIFY ?AUTO_413 ?AUTO_414 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_416 - BLOCK
      ?AUTO_417 - BLOCK
    )
    :vars
    (
      ?AUTO_418 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_416 ?AUTO_417 ) ) ( ON ?AUTO_416 ?AUTO_418 ) ( not ( = ?AUTO_416 ?AUTO_418 ) ) ( not ( = ?AUTO_417 ?AUTO_418 ) ) ( ON ?AUTO_417 ?AUTO_416 ) ( CLEAR ?AUTO_417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_417 ?AUTO_416 )
      ( MAKE-ON ?AUTO_416 ?AUTO_417 )
      ( MAKE-ON-VERIFY ?AUTO_416 ?AUTO_417 ) )
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
      ?AUTO_422 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_419 ?AUTO_420 ) ) ( ON ?AUTO_419 ?AUTO_421 ) ( not ( = ?AUTO_419 ?AUTO_421 ) ) ( not ( = ?AUTO_420 ?AUTO_421 ) ) ( ON ?AUTO_420 ?AUTO_419 ) ( CLEAR ?AUTO_420 ) ( HOLDING ?AUTO_422 ) ( not ( = ?AUTO_419 ?AUTO_422 ) ) ( not ( = ?AUTO_420 ?AUTO_422 ) ) ( not ( = ?AUTO_421 ?AUTO_422 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_422 )
      ( MAKE-ON ?AUTO_419 ?AUTO_420 )
      ( MAKE-ON-VERIFY ?AUTO_419 ?AUTO_420 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_426 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_426 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_426 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_426 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_427 - BLOCK
    )
    :vars
    (
      ?AUTO_428 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_427 ?AUTO_428 ) ( CLEAR ?AUTO_427 ) ( HAND-EMPTY ) ( not ( = ?AUTO_427 ?AUTO_428 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_427 ?AUTO_428 )
      ( MAKE-ON-TABLE ?AUTO_427 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_427 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_429 - BLOCK
    )
    :vars
    (
      ?AUTO_430 - BLOCK
      ?AUTO_431 - BLOCK
      ?AUTO_432 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_429 ?AUTO_430 ) ( CLEAR ?AUTO_429 ) ( not ( = ?AUTO_429 ?AUTO_430 ) ) ( HOLDING ?AUTO_431 ) ( CLEAR ?AUTO_432 ) ( not ( = ?AUTO_429 ?AUTO_431 ) ) ( not ( = ?AUTO_429 ?AUTO_432 ) ) ( not ( = ?AUTO_430 ?AUTO_431 ) ) ( not ( = ?AUTO_430 ?AUTO_432 ) ) ( not ( = ?AUTO_431 ?AUTO_432 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_431 ?AUTO_432 )
      ( MAKE-ON-TABLE ?AUTO_429 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_429 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_433 - BLOCK
    )
    :vars
    (
      ?AUTO_434 - BLOCK
      ?AUTO_436 - BLOCK
      ?AUTO_435 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_433 ?AUTO_434 ) ( not ( = ?AUTO_433 ?AUTO_434 ) ) ( CLEAR ?AUTO_436 ) ( not ( = ?AUTO_433 ?AUTO_435 ) ) ( not ( = ?AUTO_433 ?AUTO_436 ) ) ( not ( = ?AUTO_434 ?AUTO_435 ) ) ( not ( = ?AUTO_434 ?AUTO_436 ) ) ( not ( = ?AUTO_435 ?AUTO_436 ) ) ( ON ?AUTO_435 ?AUTO_433 ) ( CLEAR ?AUTO_435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_435 ?AUTO_433 )
      ( MAKE-ON-TABLE ?AUTO_433 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_433 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_437 - BLOCK
    )
    :vars
    (
      ?AUTO_438 - BLOCK
      ?AUTO_439 - BLOCK
      ?AUTO_440 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_437 ?AUTO_438 ) ( not ( = ?AUTO_437 ?AUTO_438 ) ) ( not ( = ?AUTO_437 ?AUTO_439 ) ) ( not ( = ?AUTO_437 ?AUTO_440 ) ) ( not ( = ?AUTO_438 ?AUTO_439 ) ) ( not ( = ?AUTO_438 ?AUTO_440 ) ) ( not ( = ?AUTO_439 ?AUTO_440 ) ) ( ON ?AUTO_439 ?AUTO_437 ) ( CLEAR ?AUTO_439 ) ( HOLDING ?AUTO_440 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_440 )
      ( MAKE-ON-TABLE ?AUTO_437 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_437 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_441 - BLOCK
    )
    :vars
    (
      ?AUTO_442 - BLOCK
      ?AUTO_443 - BLOCK
      ?AUTO_444 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_441 ?AUTO_442 ) ( not ( = ?AUTO_441 ?AUTO_442 ) ) ( not ( = ?AUTO_441 ?AUTO_443 ) ) ( not ( = ?AUTO_441 ?AUTO_444 ) ) ( not ( = ?AUTO_442 ?AUTO_443 ) ) ( not ( = ?AUTO_442 ?AUTO_444 ) ) ( not ( = ?AUTO_443 ?AUTO_444 ) ) ( ON ?AUTO_443 ?AUTO_441 ) ( ON ?AUTO_444 ?AUTO_443 ) ( CLEAR ?AUTO_444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_444 ?AUTO_443 )
      ( MAKE-ON-TABLE ?AUTO_441 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_441 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_445 - BLOCK
    )
    :vars
    (
      ?AUTO_447 - BLOCK
      ?AUTO_446 - BLOCK
      ?AUTO_448 - BLOCK
      ?AUTO_449 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_445 ?AUTO_447 ) ( not ( = ?AUTO_445 ?AUTO_447 ) ) ( not ( = ?AUTO_445 ?AUTO_446 ) ) ( not ( = ?AUTO_445 ?AUTO_448 ) ) ( not ( = ?AUTO_447 ?AUTO_446 ) ) ( not ( = ?AUTO_447 ?AUTO_448 ) ) ( not ( = ?AUTO_446 ?AUTO_448 ) ) ( ON ?AUTO_446 ?AUTO_445 ) ( ON ?AUTO_448 ?AUTO_446 ) ( CLEAR ?AUTO_448 ) ( HOLDING ?AUTO_449 ) ( not ( = ?AUTO_445 ?AUTO_449 ) ) ( not ( = ?AUTO_447 ?AUTO_449 ) ) ( not ( = ?AUTO_446 ?AUTO_449 ) ) ( not ( = ?AUTO_448 ?AUTO_449 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_449 )
      ( MAKE-ON-TABLE ?AUTO_445 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_445 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_453 - BLOCK
      ?AUTO_454 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_453 ) ( CLEAR ?AUTO_454 ) ( not ( = ?AUTO_453 ?AUTO_454 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_453 ?AUTO_454 )
      ( MAKE-ON-VERIFY ?AUTO_453 ?AUTO_454 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_455 - BLOCK
      ?AUTO_456 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_456 ) ( not ( = ?AUTO_455 ?AUTO_456 ) ) ( ON-TABLE ?AUTO_455 ) ( CLEAR ?AUTO_455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_455 )
      ( MAKE-ON ?AUTO_455 ?AUTO_456 )
      ( MAKE-ON-VERIFY ?AUTO_455 ?AUTO_456 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_457 - BLOCK
      ?AUTO_458 - BLOCK
    )
    :vars
    (
      ?AUTO_459 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_458 ) ( not ( = ?AUTO_457 ?AUTO_458 ) ) ( ON-TABLE ?AUTO_457 ) ( CLEAR ?AUTO_457 ) ( HOLDING ?AUTO_459 ) ( not ( = ?AUTO_457 ?AUTO_459 ) ) ( not ( = ?AUTO_458 ?AUTO_459 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_459 )
      ( MAKE-ON ?AUTO_457 ?AUTO_458 )
      ( MAKE-ON-VERIFY ?AUTO_457 ?AUTO_458 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_462 - BLOCK
      ?AUTO_463 - BLOCK
    )
    :vars
    (
      ?AUTO_464 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_462 ?AUTO_463 ) ) ( ON-TABLE ?AUTO_462 ) ( CLEAR ?AUTO_462 ) ( HOLDING ?AUTO_463 ) ( CLEAR ?AUTO_464 ) ( not ( = ?AUTO_462 ?AUTO_464 ) ) ( not ( = ?AUTO_463 ?AUTO_464 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_463 ?AUTO_464 )
      ( MAKE-ON ?AUTO_462 ?AUTO_463 )
      ( MAKE-ON-VERIFY ?AUTO_462 ?AUTO_463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_469 - BLOCK
      ?AUTO_470 - BLOCK
    )
    :vars
    (
      ?AUTO_471 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_469 ?AUTO_470 ) ) ( ON-TABLE ?AUTO_469 ) ( CLEAR ?AUTO_469 ) ( not ( = ?AUTO_469 ?AUTO_471 ) ) ( not ( = ?AUTO_470 ?AUTO_471 ) ) ( ON ?AUTO_471 ?AUTO_470 ) ( CLEAR ?AUTO_471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_471 ?AUTO_470 )
      ( MAKE-ON ?AUTO_469 ?AUTO_470 )
      ( MAKE-ON-VERIFY ?AUTO_469 ?AUTO_470 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_472 - BLOCK
      ?AUTO_473 - BLOCK
    )
    :vars
    (
      ?AUTO_474 - BLOCK
      ?AUTO_475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_472 ?AUTO_473 ) ) ( ON-TABLE ?AUTO_472 ) ( CLEAR ?AUTO_472 ) ( not ( = ?AUTO_472 ?AUTO_474 ) ) ( not ( = ?AUTO_473 ?AUTO_474 ) ) ( ON ?AUTO_474 ?AUTO_473 ) ( CLEAR ?AUTO_474 ) ( HOLDING ?AUTO_475 ) ( not ( = ?AUTO_472 ?AUTO_475 ) ) ( not ( = ?AUTO_473 ?AUTO_475 ) ) ( not ( = ?AUTO_474 ?AUTO_475 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_475 )
      ( MAKE-ON ?AUTO_472 ?AUTO_473 )
      ( MAKE-ON-VERIFY ?AUTO_472 ?AUTO_473 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_476 - BLOCK
      ?AUTO_477 - BLOCK
    )
    :vars
    (
      ?AUTO_478 - BLOCK
      ?AUTO_479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_476 ?AUTO_477 ) ) ( ON-TABLE ?AUTO_476 ) ( not ( = ?AUTO_476 ?AUTO_478 ) ) ( not ( = ?AUTO_477 ?AUTO_478 ) ) ( ON ?AUTO_478 ?AUTO_477 ) ( CLEAR ?AUTO_478 ) ( not ( = ?AUTO_476 ?AUTO_479 ) ) ( not ( = ?AUTO_477 ?AUTO_479 ) ) ( not ( = ?AUTO_478 ?AUTO_479 ) ) ( ON ?AUTO_479 ?AUTO_476 ) ( CLEAR ?AUTO_479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_479 ?AUTO_476 )
      ( MAKE-ON ?AUTO_476 ?AUTO_477 )
      ( MAKE-ON-VERIFY ?AUTO_476 ?AUTO_477 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_482 - BLOCK
      ?AUTO_483 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_482 ) ( CLEAR ?AUTO_483 ) ( not ( = ?AUTO_482 ?AUTO_483 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_482 ?AUTO_483 )
      ( MAKE-ON-VERIFY ?AUTO_482 ?AUTO_483 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_484 - BLOCK
      ?AUTO_485 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_485 ) ( not ( = ?AUTO_484 ?AUTO_485 ) ) ( ON-TABLE ?AUTO_484 ) ( CLEAR ?AUTO_484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_484 )
      ( MAKE-ON ?AUTO_484 ?AUTO_485 )
      ( MAKE-ON-VERIFY ?AUTO_484 ?AUTO_485 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_486 - BLOCK
      ?AUTO_487 - BLOCK
    )
    :vars
    (
      ?AUTO_488 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_486 ?AUTO_487 ) ) ( ON-TABLE ?AUTO_486 ) ( CLEAR ?AUTO_486 ) ( HOLDING ?AUTO_487 ) ( CLEAR ?AUTO_488 ) ( not ( = ?AUTO_486 ?AUTO_488 ) ) ( not ( = ?AUTO_487 ?AUTO_488 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_487 ?AUTO_488 )
      ( MAKE-ON ?AUTO_486 ?AUTO_487 )
      ( MAKE-ON-VERIFY ?AUTO_486 ?AUTO_487 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_493 - BLOCK
      ?AUTO_494 - BLOCK
    )
    :vars
    (
      ?AUTO_495 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_494 ) ( not ( = ?AUTO_493 ?AUTO_494 ) ) ( ON-TABLE ?AUTO_493 ) ( not ( = ?AUTO_493 ?AUTO_495 ) ) ( not ( = ?AUTO_494 ?AUTO_495 ) ) ( ON ?AUTO_495 ?AUTO_493 ) ( CLEAR ?AUTO_495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_495 ?AUTO_493 )
      ( MAKE-ON ?AUTO_493 ?AUTO_494 )
      ( MAKE-ON-VERIFY ?AUTO_493 ?AUTO_494 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_496 - BLOCK
      ?AUTO_497 - BLOCK
    )
    :vars
    (
      ?AUTO_498 - BLOCK
      ?AUTO_499 - BLOCK
      ?AUTO_500 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_497 ) ( not ( = ?AUTO_496 ?AUTO_497 ) ) ( ON-TABLE ?AUTO_496 ) ( not ( = ?AUTO_496 ?AUTO_498 ) ) ( not ( = ?AUTO_497 ?AUTO_498 ) ) ( ON ?AUTO_498 ?AUTO_496 ) ( CLEAR ?AUTO_498 ) ( HOLDING ?AUTO_499 ) ( CLEAR ?AUTO_500 ) ( not ( = ?AUTO_496 ?AUTO_499 ) ) ( not ( = ?AUTO_496 ?AUTO_500 ) ) ( not ( = ?AUTO_497 ?AUTO_499 ) ) ( not ( = ?AUTO_497 ?AUTO_500 ) ) ( not ( = ?AUTO_498 ?AUTO_499 ) ) ( not ( = ?AUTO_498 ?AUTO_500 ) ) ( not ( = ?AUTO_499 ?AUTO_500 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_499 ?AUTO_500 )
      ( MAKE-ON ?AUTO_496 ?AUTO_497 )
      ( MAKE-ON-VERIFY ?AUTO_496 ?AUTO_497 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_501 - BLOCK
      ?AUTO_502 - BLOCK
    )
    :vars
    (
      ?AUTO_503 - BLOCK
      ?AUTO_504 - BLOCK
      ?AUTO_505 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_502 ) ( not ( = ?AUTO_501 ?AUTO_502 ) ) ( ON-TABLE ?AUTO_501 ) ( not ( = ?AUTO_501 ?AUTO_503 ) ) ( not ( = ?AUTO_502 ?AUTO_503 ) ) ( ON ?AUTO_503 ?AUTO_501 ) ( CLEAR ?AUTO_504 ) ( not ( = ?AUTO_501 ?AUTO_505 ) ) ( not ( = ?AUTO_501 ?AUTO_504 ) ) ( not ( = ?AUTO_502 ?AUTO_505 ) ) ( not ( = ?AUTO_502 ?AUTO_504 ) ) ( not ( = ?AUTO_503 ?AUTO_505 ) ) ( not ( = ?AUTO_503 ?AUTO_504 ) ) ( not ( = ?AUTO_505 ?AUTO_504 ) ) ( ON ?AUTO_505 ?AUTO_503 ) ( CLEAR ?AUTO_505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_505 ?AUTO_503 )
      ( MAKE-ON ?AUTO_501 ?AUTO_502 )
      ( MAKE-ON-VERIFY ?AUTO_501 ?AUTO_502 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_506 - BLOCK
      ?AUTO_507 - BLOCK
    )
    :vars
    (
      ?AUTO_509 - BLOCK
      ?AUTO_508 - BLOCK
      ?AUTO_510 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_507 ) ( not ( = ?AUTO_506 ?AUTO_507 ) ) ( ON-TABLE ?AUTO_506 ) ( not ( = ?AUTO_506 ?AUTO_509 ) ) ( not ( = ?AUTO_507 ?AUTO_509 ) ) ( ON ?AUTO_509 ?AUTO_506 ) ( not ( = ?AUTO_506 ?AUTO_508 ) ) ( not ( = ?AUTO_506 ?AUTO_510 ) ) ( not ( = ?AUTO_507 ?AUTO_508 ) ) ( not ( = ?AUTO_507 ?AUTO_510 ) ) ( not ( = ?AUTO_509 ?AUTO_508 ) ) ( not ( = ?AUTO_509 ?AUTO_510 ) ) ( not ( = ?AUTO_508 ?AUTO_510 ) ) ( ON ?AUTO_508 ?AUTO_509 ) ( CLEAR ?AUTO_508 ) ( HOLDING ?AUTO_510 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_510 )
      ( MAKE-ON ?AUTO_506 ?AUTO_507 )
      ( MAKE-ON-VERIFY ?AUTO_506 ?AUTO_507 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_511 - BLOCK
      ?AUTO_512 - BLOCK
    )
    :vars
    (
      ?AUTO_513 - BLOCK
      ?AUTO_514 - BLOCK
      ?AUTO_515 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_512 ) ( not ( = ?AUTO_511 ?AUTO_512 ) ) ( ON-TABLE ?AUTO_511 ) ( not ( = ?AUTO_511 ?AUTO_513 ) ) ( not ( = ?AUTO_512 ?AUTO_513 ) ) ( ON ?AUTO_513 ?AUTO_511 ) ( not ( = ?AUTO_511 ?AUTO_514 ) ) ( not ( = ?AUTO_511 ?AUTO_515 ) ) ( not ( = ?AUTO_512 ?AUTO_514 ) ) ( not ( = ?AUTO_512 ?AUTO_515 ) ) ( not ( = ?AUTO_513 ?AUTO_514 ) ) ( not ( = ?AUTO_513 ?AUTO_515 ) ) ( not ( = ?AUTO_514 ?AUTO_515 ) ) ( ON ?AUTO_514 ?AUTO_513 ) ( ON ?AUTO_515 ?AUTO_514 ) ( CLEAR ?AUTO_515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_515 ?AUTO_514 )
      ( MAKE-ON ?AUTO_511 ?AUTO_512 )
      ( MAKE-ON-VERIFY ?AUTO_511 ?AUTO_512 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_516 - BLOCK
      ?AUTO_517 - BLOCK
    )
    :vars
    (
      ?AUTO_520 - BLOCK
      ?AUTO_518 - BLOCK
      ?AUTO_519 - BLOCK
      ?AUTO_521 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_517 ) ( not ( = ?AUTO_516 ?AUTO_517 ) ) ( ON-TABLE ?AUTO_516 ) ( not ( = ?AUTO_516 ?AUTO_520 ) ) ( not ( = ?AUTO_517 ?AUTO_520 ) ) ( ON ?AUTO_520 ?AUTO_516 ) ( not ( = ?AUTO_516 ?AUTO_518 ) ) ( not ( = ?AUTO_516 ?AUTO_519 ) ) ( not ( = ?AUTO_517 ?AUTO_518 ) ) ( not ( = ?AUTO_517 ?AUTO_519 ) ) ( not ( = ?AUTO_520 ?AUTO_518 ) ) ( not ( = ?AUTO_520 ?AUTO_519 ) ) ( not ( = ?AUTO_518 ?AUTO_519 ) ) ( ON ?AUTO_518 ?AUTO_520 ) ( ON ?AUTO_519 ?AUTO_518 ) ( CLEAR ?AUTO_519 ) ( HOLDING ?AUTO_521 ) ( not ( = ?AUTO_516 ?AUTO_521 ) ) ( not ( = ?AUTO_517 ?AUTO_521 ) ) ( not ( = ?AUTO_520 ?AUTO_521 ) ) ( not ( = ?AUTO_518 ?AUTO_521 ) ) ( not ( = ?AUTO_519 ?AUTO_521 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_521 )
      ( MAKE-ON ?AUTO_516 ?AUTO_517 )
      ( MAKE-ON-VERIFY ?AUTO_516 ?AUTO_517 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_522 - BLOCK
      ?AUTO_523 - BLOCK
    )
    :vars
    (
      ?AUTO_524 - BLOCK
      ?AUTO_525 - BLOCK
      ?AUTO_526 - BLOCK
      ?AUTO_527 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_522 ?AUTO_523 ) ) ( ON-TABLE ?AUTO_522 ) ( not ( = ?AUTO_522 ?AUTO_524 ) ) ( not ( = ?AUTO_523 ?AUTO_524 ) ) ( ON ?AUTO_524 ?AUTO_522 ) ( not ( = ?AUTO_522 ?AUTO_525 ) ) ( not ( = ?AUTO_522 ?AUTO_526 ) ) ( not ( = ?AUTO_523 ?AUTO_525 ) ) ( not ( = ?AUTO_523 ?AUTO_526 ) ) ( not ( = ?AUTO_524 ?AUTO_525 ) ) ( not ( = ?AUTO_524 ?AUTO_526 ) ) ( not ( = ?AUTO_525 ?AUTO_526 ) ) ( ON ?AUTO_525 ?AUTO_524 ) ( ON ?AUTO_526 ?AUTO_525 ) ( CLEAR ?AUTO_526 ) ( not ( = ?AUTO_522 ?AUTO_527 ) ) ( not ( = ?AUTO_523 ?AUTO_527 ) ) ( not ( = ?AUTO_524 ?AUTO_527 ) ) ( not ( = ?AUTO_525 ?AUTO_527 ) ) ( not ( = ?AUTO_526 ?AUTO_527 ) ) ( ON ?AUTO_527 ?AUTO_523 ) ( CLEAR ?AUTO_527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_527 ?AUTO_523 )
      ( MAKE-ON ?AUTO_522 ?AUTO_523 )
      ( MAKE-ON-VERIFY ?AUTO_522 ?AUTO_523 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_530 - BLOCK
      ?AUTO_531 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_530 ) ( CLEAR ?AUTO_531 ) ( not ( = ?AUTO_530 ?AUTO_531 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_530 ?AUTO_531 )
      ( MAKE-ON-VERIFY ?AUTO_530 ?AUTO_531 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_532 - BLOCK
      ?AUTO_533 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_533 ) ( not ( = ?AUTO_532 ?AUTO_533 ) ) ( ON-TABLE ?AUTO_532 ) ( CLEAR ?AUTO_532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_532 )
      ( MAKE-ON ?AUTO_532 ?AUTO_533 )
      ( MAKE-ON-VERIFY ?AUTO_532 ?AUTO_533 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_534 - BLOCK
      ?AUTO_535 - BLOCK
    )
    :vars
    (
      ?AUTO_536 - BLOCK
      ?AUTO_537 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_535 ) ( not ( = ?AUTO_534 ?AUTO_535 ) ) ( ON-TABLE ?AUTO_534 ) ( CLEAR ?AUTO_534 ) ( HOLDING ?AUTO_536 ) ( CLEAR ?AUTO_537 ) ( not ( = ?AUTO_534 ?AUTO_536 ) ) ( not ( = ?AUTO_534 ?AUTO_537 ) ) ( not ( = ?AUTO_535 ?AUTO_536 ) ) ( not ( = ?AUTO_535 ?AUTO_537 ) ) ( not ( = ?AUTO_536 ?AUTO_537 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_536 ?AUTO_537 )
      ( MAKE-ON ?AUTO_534 ?AUTO_535 )
      ( MAKE-ON-VERIFY ?AUTO_534 ?AUTO_535 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_539 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_539 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_539 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_539 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_540 - BLOCK
    )
    :vars
    (
      ?AUTO_541 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_540 ?AUTO_541 ) ( CLEAR ?AUTO_540 ) ( HAND-EMPTY ) ( not ( = ?AUTO_540 ?AUTO_541 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_540 ?AUTO_541 )
      ( MAKE-ON-TABLE ?AUTO_540 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_540 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_543 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_543 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_543 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_543 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_544 - BLOCK
    )
    :vars
    (
      ?AUTO_545 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_544 ?AUTO_545 ) ( CLEAR ?AUTO_544 ) ( HAND-EMPTY ) ( not ( = ?AUTO_544 ?AUTO_545 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_544 ?AUTO_545 )
      ( MAKE-ON-TABLE ?AUTO_544 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_544 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_546 - BLOCK
    )
    :vars
    (
      ?AUTO_547 - BLOCK
      ?AUTO_548 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_546 ?AUTO_547 ) ( CLEAR ?AUTO_546 ) ( not ( = ?AUTO_546 ?AUTO_547 ) ) ( HOLDING ?AUTO_548 ) ( not ( = ?AUTO_546 ?AUTO_548 ) ) ( not ( = ?AUTO_547 ?AUTO_548 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_548 )
      ( MAKE-ON-TABLE ?AUTO_546 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_546 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_549 - BLOCK
    )
    :vars
    (
      ?AUTO_550 - BLOCK
      ?AUTO_551 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_549 ?AUTO_550 ) ( not ( = ?AUTO_549 ?AUTO_550 ) ) ( not ( = ?AUTO_549 ?AUTO_551 ) ) ( not ( = ?AUTO_550 ?AUTO_551 ) ) ( ON ?AUTO_551 ?AUTO_549 ) ( CLEAR ?AUTO_551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_551 ?AUTO_549 )
      ( MAKE-ON-TABLE ?AUTO_549 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_549 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_553 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_553 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_553 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_553 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_554 - BLOCK
    )
    :vars
    (
      ?AUTO_555 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_554 ?AUTO_555 ) ( CLEAR ?AUTO_554 ) ( HAND-EMPTY ) ( not ( = ?AUTO_554 ?AUTO_555 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_554 ?AUTO_555 )
      ( MAKE-ON-TABLE ?AUTO_554 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_554 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_556 - BLOCK
    )
    :vars
    (
      ?AUTO_557 - BLOCK
      ?AUTO_558 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_556 ?AUTO_557 ) ( CLEAR ?AUTO_556 ) ( not ( = ?AUTO_556 ?AUTO_557 ) ) ( HOLDING ?AUTO_558 ) ( not ( = ?AUTO_556 ?AUTO_558 ) ) ( not ( = ?AUTO_557 ?AUTO_558 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_558 )
      ( MAKE-ON-TABLE ?AUTO_556 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_556 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_559 - BLOCK
    )
    :vars
    (
      ?AUTO_560 - BLOCK
      ?AUTO_561 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_559 ?AUTO_560 ) ( not ( = ?AUTO_559 ?AUTO_560 ) ) ( not ( = ?AUTO_559 ?AUTO_561 ) ) ( not ( = ?AUTO_560 ?AUTO_561 ) ) ( ON ?AUTO_561 ?AUTO_559 ) ( CLEAR ?AUTO_561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_561 ?AUTO_559 )
      ( MAKE-ON-TABLE ?AUTO_559 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_559 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_562 - BLOCK
    )
    :vars
    (
      ?AUTO_563 - BLOCK
      ?AUTO_564 - BLOCK
      ?AUTO_565 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_562 ?AUTO_563 ) ( not ( = ?AUTO_562 ?AUTO_563 ) ) ( not ( = ?AUTO_562 ?AUTO_564 ) ) ( not ( = ?AUTO_563 ?AUTO_564 ) ) ( ON ?AUTO_564 ?AUTO_562 ) ( CLEAR ?AUTO_564 ) ( HOLDING ?AUTO_565 ) ( not ( = ?AUTO_562 ?AUTO_565 ) ) ( not ( = ?AUTO_563 ?AUTO_565 ) ) ( not ( = ?AUTO_564 ?AUTO_565 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_565 )
      ( MAKE-ON-TABLE ?AUTO_562 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_562 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_566 - BLOCK
    )
    :vars
    (
      ?AUTO_567 - BLOCK
      ?AUTO_568 - BLOCK
      ?AUTO_569 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_566 ?AUTO_567 ) ( not ( = ?AUTO_566 ?AUTO_567 ) ) ( not ( = ?AUTO_566 ?AUTO_568 ) ) ( not ( = ?AUTO_567 ?AUTO_568 ) ) ( ON ?AUTO_568 ?AUTO_566 ) ( not ( = ?AUTO_566 ?AUTO_569 ) ) ( not ( = ?AUTO_567 ?AUTO_569 ) ) ( not ( = ?AUTO_568 ?AUTO_569 ) ) ( ON ?AUTO_569 ?AUTO_568 ) ( CLEAR ?AUTO_569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_569 ?AUTO_568 )
      ( MAKE-ON-TABLE ?AUTO_566 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_566 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_571 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_571 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_571 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_571 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_572 - BLOCK
    )
    :vars
    (
      ?AUTO_573 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_572 ?AUTO_573 ) ( CLEAR ?AUTO_572 ) ( HAND-EMPTY ) ( not ( = ?AUTO_572 ?AUTO_573 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_572 ?AUTO_573 )
      ( MAKE-ON-TABLE ?AUTO_572 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_572 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_574 - BLOCK
    )
    :vars
    (
      ?AUTO_575 - BLOCK
      ?AUTO_576 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_574 ?AUTO_575 ) ( CLEAR ?AUTO_574 ) ( not ( = ?AUTO_574 ?AUTO_575 ) ) ( HOLDING ?AUTO_576 ) ( not ( = ?AUTO_574 ?AUTO_576 ) ) ( not ( = ?AUTO_575 ?AUTO_576 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_576 )
      ( MAKE-ON-TABLE ?AUTO_574 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_574 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_577 - BLOCK
    )
    :vars
    (
      ?AUTO_578 - BLOCK
      ?AUTO_579 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_577 ?AUTO_578 ) ( not ( = ?AUTO_577 ?AUTO_578 ) ) ( not ( = ?AUTO_577 ?AUTO_579 ) ) ( not ( = ?AUTO_578 ?AUTO_579 ) ) ( ON ?AUTO_579 ?AUTO_577 ) ( CLEAR ?AUTO_579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_579 ?AUTO_577 )
      ( MAKE-ON-TABLE ?AUTO_577 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_577 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_580 - BLOCK
    )
    :vars
    (
      ?AUTO_582 - BLOCK
      ?AUTO_581 - BLOCK
      ?AUTO_583 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_580 ?AUTO_582 ) ( not ( = ?AUTO_580 ?AUTO_582 ) ) ( not ( = ?AUTO_580 ?AUTO_581 ) ) ( not ( = ?AUTO_582 ?AUTO_581 ) ) ( ON ?AUTO_581 ?AUTO_580 ) ( CLEAR ?AUTO_581 ) ( HOLDING ?AUTO_583 ) ( not ( = ?AUTO_580 ?AUTO_583 ) ) ( not ( = ?AUTO_582 ?AUTO_583 ) ) ( not ( = ?AUTO_581 ?AUTO_583 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_583 )
      ( MAKE-ON-TABLE ?AUTO_580 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_580 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_584 - BLOCK
    )
    :vars
    (
      ?AUTO_586 - BLOCK
      ?AUTO_585 - BLOCK
      ?AUTO_587 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_584 ?AUTO_586 ) ( not ( = ?AUTO_584 ?AUTO_586 ) ) ( not ( = ?AUTO_584 ?AUTO_585 ) ) ( not ( = ?AUTO_586 ?AUTO_585 ) ) ( ON ?AUTO_585 ?AUTO_584 ) ( not ( = ?AUTO_584 ?AUTO_587 ) ) ( not ( = ?AUTO_586 ?AUTO_587 ) ) ( not ( = ?AUTO_585 ?AUTO_587 ) ) ( ON ?AUTO_587 ?AUTO_585 ) ( CLEAR ?AUTO_587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_587 ?AUTO_585 )
      ( MAKE-ON-TABLE ?AUTO_584 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_584 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_588 - BLOCK
    )
    :vars
    (
      ?AUTO_589 - BLOCK
      ?AUTO_591 - BLOCK
      ?AUTO_590 - BLOCK
      ?AUTO_592 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_588 ?AUTO_589 ) ( not ( = ?AUTO_588 ?AUTO_589 ) ) ( not ( = ?AUTO_588 ?AUTO_591 ) ) ( not ( = ?AUTO_589 ?AUTO_591 ) ) ( ON ?AUTO_591 ?AUTO_588 ) ( not ( = ?AUTO_588 ?AUTO_590 ) ) ( not ( = ?AUTO_589 ?AUTO_590 ) ) ( not ( = ?AUTO_591 ?AUTO_590 ) ) ( ON ?AUTO_590 ?AUTO_591 ) ( CLEAR ?AUTO_590 ) ( HOLDING ?AUTO_592 ) ( not ( = ?AUTO_588 ?AUTO_592 ) ) ( not ( = ?AUTO_589 ?AUTO_592 ) ) ( not ( = ?AUTO_591 ?AUTO_592 ) ) ( not ( = ?AUTO_590 ?AUTO_592 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_592 )
      ( MAKE-ON-TABLE ?AUTO_588 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_588 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_593 - BLOCK
    )
    :vars
    (
      ?AUTO_596 - BLOCK
      ?AUTO_597 - BLOCK
      ?AUTO_594 - BLOCK
      ?AUTO_595 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_593 ?AUTO_596 ) ( not ( = ?AUTO_593 ?AUTO_596 ) ) ( not ( = ?AUTO_593 ?AUTO_597 ) ) ( not ( = ?AUTO_596 ?AUTO_597 ) ) ( ON ?AUTO_597 ?AUTO_593 ) ( not ( = ?AUTO_593 ?AUTO_594 ) ) ( not ( = ?AUTO_596 ?AUTO_594 ) ) ( not ( = ?AUTO_597 ?AUTO_594 ) ) ( ON ?AUTO_594 ?AUTO_597 ) ( not ( = ?AUTO_593 ?AUTO_595 ) ) ( not ( = ?AUTO_596 ?AUTO_595 ) ) ( not ( = ?AUTO_597 ?AUTO_595 ) ) ( not ( = ?AUTO_594 ?AUTO_595 ) ) ( ON ?AUTO_595 ?AUTO_594 ) ( CLEAR ?AUTO_595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_595 ?AUTO_594 )
      ( MAKE-ON-TABLE ?AUTO_593 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_600 - BLOCK
      ?AUTO_601 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_600 ) ( CLEAR ?AUTO_601 ) ( not ( = ?AUTO_600 ?AUTO_601 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_600 ?AUTO_601 )
      ( MAKE-ON-VERIFY ?AUTO_600 ?AUTO_601 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_602 - BLOCK
      ?AUTO_603 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_603 ) ( not ( = ?AUTO_602 ?AUTO_603 ) ) ( ON-TABLE ?AUTO_602 ) ( CLEAR ?AUTO_602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_602 )
      ( MAKE-ON ?AUTO_602 ?AUTO_603 )
      ( MAKE-ON-VERIFY ?AUTO_602 ?AUTO_603 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_604 - BLOCK
      ?AUTO_605 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_604 ?AUTO_605 ) ) ( ON-TABLE ?AUTO_604 ) ( CLEAR ?AUTO_604 ) ( HOLDING ?AUTO_605 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_605 )
      ( MAKE-ON ?AUTO_604 ?AUTO_605 )
      ( MAKE-ON-VERIFY ?AUTO_604 ?AUTO_605 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_606 - BLOCK
      ?AUTO_607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_606 ?AUTO_607 ) ) ( ON-TABLE ?AUTO_606 ) ( ON ?AUTO_607 ?AUTO_606 ) ( CLEAR ?AUTO_607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_607 ?AUTO_606 )
      ( MAKE-ON ?AUTO_606 ?AUTO_607 )
      ( MAKE-ON-VERIFY ?AUTO_606 ?AUTO_607 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_608 - BLOCK
      ?AUTO_609 - BLOCK
    )
    :vars
    (
      ?AUTO_610 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_608 ?AUTO_609 ) ) ( ON-TABLE ?AUTO_608 ) ( ON ?AUTO_609 ?AUTO_608 ) ( CLEAR ?AUTO_609 ) ( HOLDING ?AUTO_610 ) ( not ( = ?AUTO_608 ?AUTO_610 ) ) ( not ( = ?AUTO_609 ?AUTO_610 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_610 )
      ( MAKE-ON ?AUTO_608 ?AUTO_609 )
      ( MAKE-ON-VERIFY ?AUTO_608 ?AUTO_609 ) )
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
    )
    :precondition
    ( and ( not ( = ?AUTO_611 ?AUTO_612 ) ) ( ON-TABLE ?AUTO_611 ) ( ON ?AUTO_612 ?AUTO_611 ) ( not ( = ?AUTO_611 ?AUTO_613 ) ) ( not ( = ?AUTO_612 ?AUTO_613 ) ) ( ON ?AUTO_613 ?AUTO_612 ) ( CLEAR ?AUTO_613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_613 ?AUTO_612 )
      ( MAKE-ON ?AUTO_611 ?AUTO_612 )
      ( MAKE-ON-VERIFY ?AUTO_611 ?AUTO_612 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_614 - BLOCK
      ?AUTO_615 - BLOCK
    )
    :vars
    (
      ?AUTO_616 - BLOCK
      ?AUTO_617 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_614 ?AUTO_615 ) ) ( ON-TABLE ?AUTO_614 ) ( ON ?AUTO_615 ?AUTO_614 ) ( not ( = ?AUTO_614 ?AUTO_616 ) ) ( not ( = ?AUTO_615 ?AUTO_616 ) ) ( ON ?AUTO_616 ?AUTO_615 ) ( CLEAR ?AUTO_616 ) ( HOLDING ?AUTO_617 ) ( not ( = ?AUTO_614 ?AUTO_617 ) ) ( not ( = ?AUTO_615 ?AUTO_617 ) ) ( not ( = ?AUTO_616 ?AUTO_617 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_617 )
      ( MAKE-ON ?AUTO_614 ?AUTO_615 )
      ( MAKE-ON-VERIFY ?AUTO_614 ?AUTO_615 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_618 - BLOCK
      ?AUTO_619 - BLOCK
    )
    :vars
    (
      ?AUTO_620 - BLOCK
      ?AUTO_621 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_618 ?AUTO_619 ) ) ( ON-TABLE ?AUTO_618 ) ( ON ?AUTO_619 ?AUTO_618 ) ( not ( = ?AUTO_618 ?AUTO_620 ) ) ( not ( = ?AUTO_619 ?AUTO_620 ) ) ( ON ?AUTO_620 ?AUTO_619 ) ( not ( = ?AUTO_618 ?AUTO_621 ) ) ( not ( = ?AUTO_619 ?AUTO_621 ) ) ( not ( = ?AUTO_620 ?AUTO_621 ) ) ( ON ?AUTO_621 ?AUTO_620 ) ( CLEAR ?AUTO_621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_621 ?AUTO_620 )
      ( MAKE-ON ?AUTO_618 ?AUTO_619 )
      ( MAKE-ON-VERIFY ?AUTO_618 ?AUTO_619 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_622 - BLOCK
      ?AUTO_623 - BLOCK
    )
    :vars
    (
      ?AUTO_624 - BLOCK
      ?AUTO_625 - BLOCK
      ?AUTO_626 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_622 ?AUTO_623 ) ) ( ON-TABLE ?AUTO_622 ) ( ON ?AUTO_623 ?AUTO_622 ) ( not ( = ?AUTO_622 ?AUTO_624 ) ) ( not ( = ?AUTO_623 ?AUTO_624 ) ) ( ON ?AUTO_624 ?AUTO_623 ) ( not ( = ?AUTO_622 ?AUTO_625 ) ) ( not ( = ?AUTO_623 ?AUTO_625 ) ) ( not ( = ?AUTO_624 ?AUTO_625 ) ) ( ON ?AUTO_625 ?AUTO_624 ) ( CLEAR ?AUTO_625 ) ( HOLDING ?AUTO_626 ) ( not ( = ?AUTO_622 ?AUTO_626 ) ) ( not ( = ?AUTO_623 ?AUTO_626 ) ) ( not ( = ?AUTO_624 ?AUTO_626 ) ) ( not ( = ?AUTO_625 ?AUTO_626 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_626 )
      ( MAKE-ON ?AUTO_622 ?AUTO_623 )
      ( MAKE-ON-VERIFY ?AUTO_622 ?AUTO_623 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_627 - BLOCK
      ?AUTO_628 - BLOCK
    )
    :vars
    (
      ?AUTO_629 - BLOCK
      ?AUTO_630 - BLOCK
      ?AUTO_631 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_627 ?AUTO_628 ) ) ( ON-TABLE ?AUTO_627 ) ( ON ?AUTO_628 ?AUTO_627 ) ( not ( = ?AUTO_627 ?AUTO_629 ) ) ( not ( = ?AUTO_628 ?AUTO_629 ) ) ( ON ?AUTO_629 ?AUTO_628 ) ( not ( = ?AUTO_627 ?AUTO_630 ) ) ( not ( = ?AUTO_628 ?AUTO_630 ) ) ( not ( = ?AUTO_629 ?AUTO_630 ) ) ( ON ?AUTO_630 ?AUTO_629 ) ( not ( = ?AUTO_627 ?AUTO_631 ) ) ( not ( = ?AUTO_628 ?AUTO_631 ) ) ( not ( = ?AUTO_629 ?AUTO_631 ) ) ( not ( = ?AUTO_630 ?AUTO_631 ) ) ( ON ?AUTO_631 ?AUTO_630 ) ( CLEAR ?AUTO_631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_631 ?AUTO_630 )
      ( MAKE-ON ?AUTO_627 ?AUTO_628 )
      ( MAKE-ON-VERIFY ?AUTO_627 ?AUTO_628 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_633 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_633 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_633 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_633 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_634 - BLOCK
    )
    :vars
    (
      ?AUTO_635 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_634 ?AUTO_635 ) ( CLEAR ?AUTO_634 ) ( HAND-EMPTY ) ( not ( = ?AUTO_634 ?AUTO_635 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_634 ?AUTO_635 )
      ( MAKE-ON-TABLE ?AUTO_634 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_634 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_637 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_637 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_637 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_637 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_638 - BLOCK
    )
    :vars
    (
      ?AUTO_639 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_638 ?AUTO_639 ) ( CLEAR ?AUTO_638 ) ( HAND-EMPTY ) ( not ( = ?AUTO_638 ?AUTO_639 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_638 ?AUTO_639 )
      ( MAKE-ON-TABLE ?AUTO_638 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_638 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_640 - BLOCK
    )
    :vars
    (
      ?AUTO_641 - BLOCK
      ?AUTO_642 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_640 ?AUTO_641 ) ( CLEAR ?AUTO_640 ) ( not ( = ?AUTO_640 ?AUTO_641 ) ) ( HOLDING ?AUTO_642 ) ( not ( = ?AUTO_640 ?AUTO_642 ) ) ( not ( = ?AUTO_641 ?AUTO_642 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_642 )
      ( MAKE-ON-TABLE ?AUTO_640 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_640 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_643 - BLOCK
    )
    :vars
    (
      ?AUTO_644 - BLOCK
      ?AUTO_645 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_643 ?AUTO_644 ) ( not ( = ?AUTO_643 ?AUTO_644 ) ) ( not ( = ?AUTO_643 ?AUTO_645 ) ) ( not ( = ?AUTO_644 ?AUTO_645 ) ) ( ON ?AUTO_645 ?AUTO_643 ) ( CLEAR ?AUTO_645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_645 ?AUTO_643 )
      ( MAKE-ON-TABLE ?AUTO_643 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_643 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_647 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_647 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_647 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_647 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_648 - BLOCK
    )
    :vars
    (
      ?AUTO_649 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_648 ?AUTO_649 ) ( CLEAR ?AUTO_648 ) ( HAND-EMPTY ) ( not ( = ?AUTO_648 ?AUTO_649 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_648 ?AUTO_649 )
      ( MAKE-ON-TABLE ?AUTO_648 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_648 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_650 - BLOCK
    )
    :vars
    (
      ?AUTO_651 - BLOCK
      ?AUTO_652 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_650 ?AUTO_651 ) ( CLEAR ?AUTO_650 ) ( not ( = ?AUTO_650 ?AUTO_651 ) ) ( HOLDING ?AUTO_652 ) ( not ( = ?AUTO_650 ?AUTO_652 ) ) ( not ( = ?AUTO_651 ?AUTO_652 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_652 )
      ( MAKE-ON-TABLE ?AUTO_650 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_650 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_658 - BLOCK
      ?AUTO_659 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_658 ) ( CLEAR ?AUTO_659 ) ( not ( = ?AUTO_658 ?AUTO_659 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_658 ?AUTO_659 )
      ( MAKE-ON-VERIFY ?AUTO_658 ?AUTO_659 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_660 - BLOCK
      ?AUTO_661 - BLOCK
    )
    :vars
    (
      ?AUTO_662 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_661 ) ( not ( = ?AUTO_660 ?AUTO_661 ) ) ( ON ?AUTO_660 ?AUTO_662 ) ( CLEAR ?AUTO_660 ) ( HAND-EMPTY ) ( not ( = ?AUTO_660 ?AUTO_662 ) ) ( not ( = ?AUTO_661 ?AUTO_662 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_660 ?AUTO_662 )
      ( MAKE-ON ?AUTO_660 ?AUTO_661 )
      ( MAKE-ON-VERIFY ?AUTO_660 ?AUTO_661 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_663 - BLOCK
      ?AUTO_664 - BLOCK
    )
    :vars
    (
      ?AUTO_665 - BLOCK
      ?AUTO_666 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_664 ) ( not ( = ?AUTO_663 ?AUTO_664 ) ) ( ON ?AUTO_663 ?AUTO_665 ) ( CLEAR ?AUTO_663 ) ( not ( = ?AUTO_663 ?AUTO_665 ) ) ( not ( = ?AUTO_664 ?AUTO_665 ) ) ( HOLDING ?AUTO_666 ) ( not ( = ?AUTO_663 ?AUTO_666 ) ) ( not ( = ?AUTO_664 ?AUTO_666 ) ) ( not ( = ?AUTO_665 ?AUTO_666 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_666 )
      ( MAKE-ON ?AUTO_663 ?AUTO_664 )
      ( MAKE-ON-VERIFY ?AUTO_663 ?AUTO_664 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_667 - BLOCK
      ?AUTO_668 - BLOCK
    )
    :vars
    (
      ?AUTO_669 - BLOCK
      ?AUTO_670 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_668 ) ( not ( = ?AUTO_667 ?AUTO_668 ) ) ( ON ?AUTO_667 ?AUTO_669 ) ( not ( = ?AUTO_667 ?AUTO_669 ) ) ( not ( = ?AUTO_668 ?AUTO_669 ) ) ( not ( = ?AUTO_667 ?AUTO_670 ) ) ( not ( = ?AUTO_668 ?AUTO_670 ) ) ( not ( = ?AUTO_669 ?AUTO_670 ) ) ( ON ?AUTO_670 ?AUTO_667 ) ( CLEAR ?AUTO_670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_670 ?AUTO_667 )
      ( MAKE-ON ?AUTO_667 ?AUTO_668 )
      ( MAKE-ON-VERIFY ?AUTO_667 ?AUTO_668 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_671 - BLOCK
      ?AUTO_672 - BLOCK
    )
    :vars
    (
      ?AUTO_673 - BLOCK
      ?AUTO_674 - BLOCK
      ?AUTO_675 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_672 ) ( not ( = ?AUTO_671 ?AUTO_672 ) ) ( ON ?AUTO_671 ?AUTO_673 ) ( not ( = ?AUTO_671 ?AUTO_673 ) ) ( not ( = ?AUTO_672 ?AUTO_673 ) ) ( not ( = ?AUTO_671 ?AUTO_674 ) ) ( not ( = ?AUTO_672 ?AUTO_674 ) ) ( not ( = ?AUTO_673 ?AUTO_674 ) ) ( ON ?AUTO_674 ?AUTO_671 ) ( CLEAR ?AUTO_674 ) ( HOLDING ?AUTO_675 ) ( not ( = ?AUTO_671 ?AUTO_675 ) ) ( not ( = ?AUTO_672 ?AUTO_675 ) ) ( not ( = ?AUTO_673 ?AUTO_675 ) ) ( not ( = ?AUTO_674 ?AUTO_675 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_675 )
      ( MAKE-ON ?AUTO_671 ?AUTO_672 )
      ( MAKE-ON-VERIFY ?AUTO_671 ?AUTO_672 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_683 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_683 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_683 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_683 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_684 - BLOCK
    )
    :vars
    (
      ?AUTO_685 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_684 ?AUTO_685 ) ( CLEAR ?AUTO_684 ) ( HAND-EMPTY ) ( not ( = ?AUTO_684 ?AUTO_685 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_684 ?AUTO_685 )
      ( MAKE-ON-TABLE ?AUTO_684 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_684 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_686 - BLOCK
    )
    :vars
    (
      ?AUTO_687 - BLOCK
      ?AUTO_688 - BLOCK
      ?AUTO_689 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_686 ?AUTO_687 ) ( CLEAR ?AUTO_686 ) ( not ( = ?AUTO_686 ?AUTO_687 ) ) ( HOLDING ?AUTO_688 ) ( CLEAR ?AUTO_689 ) ( not ( = ?AUTO_686 ?AUTO_688 ) ) ( not ( = ?AUTO_686 ?AUTO_689 ) ) ( not ( = ?AUTO_687 ?AUTO_688 ) ) ( not ( = ?AUTO_687 ?AUTO_689 ) ) ( not ( = ?AUTO_688 ?AUTO_689 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_688 ?AUTO_689 )
      ( MAKE-ON-TABLE ?AUTO_686 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_686 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_690 - BLOCK
    )
    :vars
    (
      ?AUTO_691 - BLOCK
      ?AUTO_693 - BLOCK
      ?AUTO_692 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_690 ?AUTO_691 ) ( not ( = ?AUTO_690 ?AUTO_691 ) ) ( CLEAR ?AUTO_693 ) ( not ( = ?AUTO_690 ?AUTO_692 ) ) ( not ( = ?AUTO_690 ?AUTO_693 ) ) ( not ( = ?AUTO_691 ?AUTO_692 ) ) ( not ( = ?AUTO_691 ?AUTO_693 ) ) ( not ( = ?AUTO_692 ?AUTO_693 ) ) ( ON ?AUTO_692 ?AUTO_690 ) ( CLEAR ?AUTO_692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_692 ?AUTO_690 )
      ( MAKE-ON-TABLE ?AUTO_690 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_690 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_694 - BLOCK
    )
    :vars
    (
      ?AUTO_696 - BLOCK
      ?AUTO_697 - BLOCK
      ?AUTO_695 - BLOCK
      ?AUTO_698 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_694 ?AUTO_696 ) ( not ( = ?AUTO_694 ?AUTO_696 ) ) ( CLEAR ?AUTO_697 ) ( not ( = ?AUTO_694 ?AUTO_695 ) ) ( not ( = ?AUTO_694 ?AUTO_697 ) ) ( not ( = ?AUTO_696 ?AUTO_695 ) ) ( not ( = ?AUTO_696 ?AUTO_697 ) ) ( not ( = ?AUTO_695 ?AUTO_697 ) ) ( ON ?AUTO_695 ?AUTO_694 ) ( CLEAR ?AUTO_695 ) ( HOLDING ?AUTO_698 ) ( not ( = ?AUTO_694 ?AUTO_698 ) ) ( not ( = ?AUTO_696 ?AUTO_698 ) ) ( not ( = ?AUTO_697 ?AUTO_698 ) ) ( not ( = ?AUTO_695 ?AUTO_698 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_698 )
      ( MAKE-ON-TABLE ?AUTO_694 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_694 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_699 - BLOCK
    )
    :vars
    (
      ?AUTO_701 - BLOCK
      ?AUTO_703 - BLOCK
      ?AUTO_700 - BLOCK
      ?AUTO_702 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_699 ?AUTO_701 ) ( not ( = ?AUTO_699 ?AUTO_701 ) ) ( CLEAR ?AUTO_703 ) ( not ( = ?AUTO_699 ?AUTO_700 ) ) ( not ( = ?AUTO_699 ?AUTO_703 ) ) ( not ( = ?AUTO_701 ?AUTO_700 ) ) ( not ( = ?AUTO_701 ?AUTO_703 ) ) ( not ( = ?AUTO_700 ?AUTO_703 ) ) ( ON ?AUTO_700 ?AUTO_699 ) ( not ( = ?AUTO_699 ?AUTO_702 ) ) ( not ( = ?AUTO_701 ?AUTO_702 ) ) ( not ( = ?AUTO_703 ?AUTO_702 ) ) ( not ( = ?AUTO_700 ?AUTO_702 ) ) ( ON ?AUTO_702 ?AUTO_700 ) ( CLEAR ?AUTO_702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_702 ?AUTO_700 )
      ( MAKE-ON-TABLE ?AUTO_699 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_699 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_704 - BLOCK
    )
    :vars
    (
      ?AUTO_707 - BLOCK
      ?AUTO_706 - BLOCK
      ?AUTO_708 - BLOCK
      ?AUTO_705 - BLOCK
      ?AUTO_709 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_704 ?AUTO_707 ) ( not ( = ?AUTO_704 ?AUTO_707 ) ) ( CLEAR ?AUTO_706 ) ( not ( = ?AUTO_704 ?AUTO_708 ) ) ( not ( = ?AUTO_704 ?AUTO_706 ) ) ( not ( = ?AUTO_707 ?AUTO_708 ) ) ( not ( = ?AUTO_707 ?AUTO_706 ) ) ( not ( = ?AUTO_708 ?AUTO_706 ) ) ( ON ?AUTO_708 ?AUTO_704 ) ( not ( = ?AUTO_704 ?AUTO_705 ) ) ( not ( = ?AUTO_707 ?AUTO_705 ) ) ( not ( = ?AUTO_706 ?AUTO_705 ) ) ( not ( = ?AUTO_708 ?AUTO_705 ) ) ( ON ?AUTO_705 ?AUTO_708 ) ( CLEAR ?AUTO_705 ) ( HOLDING ?AUTO_709 ) ( not ( = ?AUTO_704 ?AUTO_709 ) ) ( not ( = ?AUTO_707 ?AUTO_709 ) ) ( not ( = ?AUTO_706 ?AUTO_709 ) ) ( not ( = ?AUTO_708 ?AUTO_709 ) ) ( not ( = ?AUTO_705 ?AUTO_709 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_709 )
      ( MAKE-ON-TABLE ?AUTO_704 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_704 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_715 - BLOCK
      ?AUTO_716 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_715 ) ( CLEAR ?AUTO_716 ) ( not ( = ?AUTO_715 ?AUTO_716 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_715 ?AUTO_716 )
      ( MAKE-ON-VERIFY ?AUTO_715 ?AUTO_716 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_717 - BLOCK
      ?AUTO_718 - BLOCK
    )
    :vars
    (
      ?AUTO_719 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_718 ) ( not ( = ?AUTO_717 ?AUTO_718 ) ) ( ON ?AUTO_717 ?AUTO_719 ) ( CLEAR ?AUTO_717 ) ( HAND-EMPTY ) ( not ( = ?AUTO_717 ?AUTO_719 ) ) ( not ( = ?AUTO_718 ?AUTO_719 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_717 ?AUTO_719 )
      ( MAKE-ON ?AUTO_717 ?AUTO_718 )
      ( MAKE-ON-VERIFY ?AUTO_717 ?AUTO_718 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_720 - BLOCK
      ?AUTO_721 - BLOCK
    )
    :vars
    (
      ?AUTO_722 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_720 ?AUTO_721 ) ) ( ON ?AUTO_720 ?AUTO_722 ) ( CLEAR ?AUTO_720 ) ( not ( = ?AUTO_720 ?AUTO_722 ) ) ( not ( = ?AUTO_721 ?AUTO_722 ) ) ( HOLDING ?AUTO_721 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_721 )
      ( MAKE-ON ?AUTO_720 ?AUTO_721 )
      ( MAKE-ON-VERIFY ?AUTO_720 ?AUTO_721 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_725 - BLOCK
      ?AUTO_726 - BLOCK
    )
    :vars
    (
      ?AUTO_727 - BLOCK
      ?AUTO_728 - BLOCK
      ?AUTO_729 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_726 ) ( not ( = ?AUTO_725 ?AUTO_726 ) ) ( ON ?AUTO_725 ?AUTO_727 ) ( CLEAR ?AUTO_725 ) ( not ( = ?AUTO_725 ?AUTO_727 ) ) ( not ( = ?AUTO_726 ?AUTO_727 ) ) ( HOLDING ?AUTO_728 ) ( CLEAR ?AUTO_729 ) ( not ( = ?AUTO_725 ?AUTO_728 ) ) ( not ( = ?AUTO_725 ?AUTO_729 ) ) ( not ( = ?AUTO_726 ?AUTO_728 ) ) ( not ( = ?AUTO_726 ?AUTO_729 ) ) ( not ( = ?AUTO_727 ?AUTO_728 ) ) ( not ( = ?AUTO_727 ?AUTO_729 ) ) ( not ( = ?AUTO_728 ?AUTO_729 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_728 ?AUTO_729 )
      ( MAKE-ON ?AUTO_725 ?AUTO_726 )
      ( MAKE-ON-VERIFY ?AUTO_725 ?AUTO_726 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_730 - BLOCK
      ?AUTO_731 - BLOCK
    )
    :vars
    (
      ?AUTO_732 - BLOCK
      ?AUTO_733 - BLOCK
      ?AUTO_734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_730 ?AUTO_731 ) ) ( ON ?AUTO_730 ?AUTO_732 ) ( CLEAR ?AUTO_730 ) ( not ( = ?AUTO_730 ?AUTO_732 ) ) ( not ( = ?AUTO_731 ?AUTO_732 ) ) ( CLEAR ?AUTO_733 ) ( not ( = ?AUTO_730 ?AUTO_734 ) ) ( not ( = ?AUTO_730 ?AUTO_733 ) ) ( not ( = ?AUTO_731 ?AUTO_734 ) ) ( not ( = ?AUTO_731 ?AUTO_733 ) ) ( not ( = ?AUTO_732 ?AUTO_734 ) ) ( not ( = ?AUTO_732 ?AUTO_733 ) ) ( not ( = ?AUTO_734 ?AUTO_733 ) ) ( ON ?AUTO_734 ?AUTO_731 ) ( CLEAR ?AUTO_734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_734 ?AUTO_731 )
      ( MAKE-ON ?AUTO_730 ?AUTO_731 )
      ( MAKE-ON-VERIFY ?AUTO_730 ?AUTO_731 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_735 - BLOCK
      ?AUTO_736 - BLOCK
    )
    :vars
    (
      ?AUTO_737 - BLOCK
      ?AUTO_738 - BLOCK
      ?AUTO_739 - BLOCK
      ?AUTO_740 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_735 ?AUTO_736 ) ) ( ON ?AUTO_735 ?AUTO_737 ) ( CLEAR ?AUTO_735 ) ( not ( = ?AUTO_735 ?AUTO_737 ) ) ( not ( = ?AUTO_736 ?AUTO_737 ) ) ( CLEAR ?AUTO_738 ) ( not ( = ?AUTO_735 ?AUTO_739 ) ) ( not ( = ?AUTO_735 ?AUTO_738 ) ) ( not ( = ?AUTO_736 ?AUTO_739 ) ) ( not ( = ?AUTO_736 ?AUTO_738 ) ) ( not ( = ?AUTO_737 ?AUTO_739 ) ) ( not ( = ?AUTO_737 ?AUTO_738 ) ) ( not ( = ?AUTO_739 ?AUTO_738 ) ) ( ON ?AUTO_739 ?AUTO_736 ) ( CLEAR ?AUTO_739 ) ( HOLDING ?AUTO_740 ) ( not ( = ?AUTO_735 ?AUTO_740 ) ) ( not ( = ?AUTO_736 ?AUTO_740 ) ) ( not ( = ?AUTO_737 ?AUTO_740 ) ) ( not ( = ?AUTO_738 ?AUTO_740 ) ) ( not ( = ?AUTO_739 ?AUTO_740 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_740 )
      ( MAKE-ON ?AUTO_735 ?AUTO_736 )
      ( MAKE-ON-VERIFY ?AUTO_735 ?AUTO_736 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_741 - BLOCK
      ?AUTO_742 - BLOCK
    )
    :vars
    (
      ?AUTO_744 - BLOCK
      ?AUTO_743 - BLOCK
      ?AUTO_745 - BLOCK
      ?AUTO_746 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_741 ?AUTO_742 ) ) ( ON ?AUTO_741 ?AUTO_744 ) ( CLEAR ?AUTO_741 ) ( not ( = ?AUTO_741 ?AUTO_744 ) ) ( not ( = ?AUTO_742 ?AUTO_744 ) ) ( CLEAR ?AUTO_743 ) ( not ( = ?AUTO_741 ?AUTO_745 ) ) ( not ( = ?AUTO_741 ?AUTO_743 ) ) ( not ( = ?AUTO_742 ?AUTO_745 ) ) ( not ( = ?AUTO_742 ?AUTO_743 ) ) ( not ( = ?AUTO_744 ?AUTO_745 ) ) ( not ( = ?AUTO_744 ?AUTO_743 ) ) ( not ( = ?AUTO_745 ?AUTO_743 ) ) ( ON ?AUTO_745 ?AUTO_742 ) ( not ( = ?AUTO_741 ?AUTO_746 ) ) ( not ( = ?AUTO_742 ?AUTO_746 ) ) ( not ( = ?AUTO_744 ?AUTO_746 ) ) ( not ( = ?AUTO_743 ?AUTO_746 ) ) ( not ( = ?AUTO_745 ?AUTO_746 ) ) ( ON ?AUTO_746 ?AUTO_745 ) ( CLEAR ?AUTO_746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_746 ?AUTO_745 )
      ( MAKE-ON ?AUTO_741 ?AUTO_742 )
      ( MAKE-ON-VERIFY ?AUTO_741 ?AUTO_742 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_747 - BLOCK
      ?AUTO_748 - BLOCK
    )
    :vars
    (
      ?AUTO_752 - BLOCK
      ?AUTO_751 - BLOCK
      ?AUTO_749 - BLOCK
      ?AUTO_750 - BLOCK
      ?AUTO_753 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_747 ?AUTO_748 ) ) ( ON ?AUTO_747 ?AUTO_752 ) ( CLEAR ?AUTO_747 ) ( not ( = ?AUTO_747 ?AUTO_752 ) ) ( not ( = ?AUTO_748 ?AUTO_752 ) ) ( CLEAR ?AUTO_751 ) ( not ( = ?AUTO_747 ?AUTO_749 ) ) ( not ( = ?AUTO_747 ?AUTO_751 ) ) ( not ( = ?AUTO_748 ?AUTO_749 ) ) ( not ( = ?AUTO_748 ?AUTO_751 ) ) ( not ( = ?AUTO_752 ?AUTO_749 ) ) ( not ( = ?AUTO_752 ?AUTO_751 ) ) ( not ( = ?AUTO_749 ?AUTO_751 ) ) ( ON ?AUTO_749 ?AUTO_748 ) ( not ( = ?AUTO_747 ?AUTO_750 ) ) ( not ( = ?AUTO_748 ?AUTO_750 ) ) ( not ( = ?AUTO_752 ?AUTO_750 ) ) ( not ( = ?AUTO_751 ?AUTO_750 ) ) ( not ( = ?AUTO_749 ?AUTO_750 ) ) ( ON ?AUTO_750 ?AUTO_749 ) ( CLEAR ?AUTO_750 ) ( HOLDING ?AUTO_753 ) ( not ( = ?AUTO_747 ?AUTO_753 ) ) ( not ( = ?AUTO_748 ?AUTO_753 ) ) ( not ( = ?AUTO_752 ?AUTO_753 ) ) ( not ( = ?AUTO_751 ?AUTO_753 ) ) ( not ( = ?AUTO_749 ?AUTO_753 ) ) ( not ( = ?AUTO_750 ?AUTO_753 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_753 )
      ( MAKE-ON ?AUTO_747 ?AUTO_748 )
      ( MAKE-ON-VERIFY ?AUTO_747 ?AUTO_748 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_754 - BLOCK
      ?AUTO_755 - BLOCK
    )
    :vars
    (
      ?AUTO_756 - BLOCK
      ?AUTO_760 - BLOCK
      ?AUTO_757 - BLOCK
      ?AUTO_758 - BLOCK
      ?AUTO_759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_754 ?AUTO_755 ) ) ( ON ?AUTO_754 ?AUTO_756 ) ( not ( = ?AUTO_754 ?AUTO_756 ) ) ( not ( = ?AUTO_755 ?AUTO_756 ) ) ( CLEAR ?AUTO_760 ) ( not ( = ?AUTO_754 ?AUTO_757 ) ) ( not ( = ?AUTO_754 ?AUTO_760 ) ) ( not ( = ?AUTO_755 ?AUTO_757 ) ) ( not ( = ?AUTO_755 ?AUTO_760 ) ) ( not ( = ?AUTO_756 ?AUTO_757 ) ) ( not ( = ?AUTO_756 ?AUTO_760 ) ) ( not ( = ?AUTO_757 ?AUTO_760 ) ) ( ON ?AUTO_757 ?AUTO_755 ) ( not ( = ?AUTO_754 ?AUTO_758 ) ) ( not ( = ?AUTO_755 ?AUTO_758 ) ) ( not ( = ?AUTO_756 ?AUTO_758 ) ) ( not ( = ?AUTO_760 ?AUTO_758 ) ) ( not ( = ?AUTO_757 ?AUTO_758 ) ) ( ON ?AUTO_758 ?AUTO_757 ) ( CLEAR ?AUTO_758 ) ( not ( = ?AUTO_754 ?AUTO_759 ) ) ( not ( = ?AUTO_755 ?AUTO_759 ) ) ( not ( = ?AUTO_756 ?AUTO_759 ) ) ( not ( = ?AUTO_760 ?AUTO_759 ) ) ( not ( = ?AUTO_757 ?AUTO_759 ) ) ( not ( = ?AUTO_758 ?AUTO_759 ) ) ( ON ?AUTO_759 ?AUTO_754 ) ( CLEAR ?AUTO_759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_759 ?AUTO_754 )
      ( MAKE-ON ?AUTO_754 ?AUTO_755 )
      ( MAKE-ON-VERIFY ?AUTO_754 ?AUTO_755 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_761 - BLOCK
      ?AUTO_762 - BLOCK
    )
    :vars
    (
      ?AUTO_765 - BLOCK
      ?AUTO_767 - BLOCK
      ?AUTO_766 - BLOCK
      ?AUTO_764 - BLOCK
      ?AUTO_763 - BLOCK
      ?AUTO_768 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_761 ?AUTO_762 ) ) ( ON ?AUTO_761 ?AUTO_765 ) ( not ( = ?AUTO_761 ?AUTO_765 ) ) ( not ( = ?AUTO_762 ?AUTO_765 ) ) ( CLEAR ?AUTO_767 ) ( not ( = ?AUTO_761 ?AUTO_766 ) ) ( not ( = ?AUTO_761 ?AUTO_767 ) ) ( not ( = ?AUTO_762 ?AUTO_766 ) ) ( not ( = ?AUTO_762 ?AUTO_767 ) ) ( not ( = ?AUTO_765 ?AUTO_766 ) ) ( not ( = ?AUTO_765 ?AUTO_767 ) ) ( not ( = ?AUTO_766 ?AUTO_767 ) ) ( ON ?AUTO_766 ?AUTO_762 ) ( not ( = ?AUTO_761 ?AUTO_764 ) ) ( not ( = ?AUTO_762 ?AUTO_764 ) ) ( not ( = ?AUTO_765 ?AUTO_764 ) ) ( not ( = ?AUTO_767 ?AUTO_764 ) ) ( not ( = ?AUTO_766 ?AUTO_764 ) ) ( ON ?AUTO_764 ?AUTO_766 ) ( CLEAR ?AUTO_764 ) ( not ( = ?AUTO_761 ?AUTO_763 ) ) ( not ( = ?AUTO_762 ?AUTO_763 ) ) ( not ( = ?AUTO_765 ?AUTO_763 ) ) ( not ( = ?AUTO_767 ?AUTO_763 ) ) ( not ( = ?AUTO_766 ?AUTO_763 ) ) ( not ( = ?AUTO_764 ?AUTO_763 ) ) ( ON ?AUTO_763 ?AUTO_761 ) ( CLEAR ?AUTO_763 ) ( HOLDING ?AUTO_768 ) ( not ( = ?AUTO_761 ?AUTO_768 ) ) ( not ( = ?AUTO_762 ?AUTO_768 ) ) ( not ( = ?AUTO_765 ?AUTO_768 ) ) ( not ( = ?AUTO_767 ?AUTO_768 ) ) ( not ( = ?AUTO_766 ?AUTO_768 ) ) ( not ( = ?AUTO_764 ?AUTO_768 ) ) ( not ( = ?AUTO_763 ?AUTO_768 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_768 )
      ( MAKE-ON ?AUTO_761 ?AUTO_762 )
      ( MAKE-ON-VERIFY ?AUTO_761 ?AUTO_762 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_769 - BLOCK
      ?AUTO_770 - BLOCK
    )
    :vars
    (
      ?AUTO_775 - BLOCK
      ?AUTO_772 - BLOCK
      ?AUTO_771 - BLOCK
      ?AUTO_774 - BLOCK
      ?AUTO_773 - BLOCK
      ?AUTO_776 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_769 ?AUTO_770 ) ) ( ON ?AUTO_769 ?AUTO_775 ) ( not ( = ?AUTO_769 ?AUTO_775 ) ) ( not ( = ?AUTO_770 ?AUTO_775 ) ) ( CLEAR ?AUTO_772 ) ( not ( = ?AUTO_769 ?AUTO_771 ) ) ( not ( = ?AUTO_769 ?AUTO_772 ) ) ( not ( = ?AUTO_770 ?AUTO_771 ) ) ( not ( = ?AUTO_770 ?AUTO_772 ) ) ( not ( = ?AUTO_775 ?AUTO_771 ) ) ( not ( = ?AUTO_775 ?AUTO_772 ) ) ( not ( = ?AUTO_771 ?AUTO_772 ) ) ( ON ?AUTO_771 ?AUTO_770 ) ( not ( = ?AUTO_769 ?AUTO_774 ) ) ( not ( = ?AUTO_770 ?AUTO_774 ) ) ( not ( = ?AUTO_775 ?AUTO_774 ) ) ( not ( = ?AUTO_772 ?AUTO_774 ) ) ( not ( = ?AUTO_771 ?AUTO_774 ) ) ( ON ?AUTO_774 ?AUTO_771 ) ( CLEAR ?AUTO_774 ) ( not ( = ?AUTO_769 ?AUTO_773 ) ) ( not ( = ?AUTO_770 ?AUTO_773 ) ) ( not ( = ?AUTO_775 ?AUTO_773 ) ) ( not ( = ?AUTO_772 ?AUTO_773 ) ) ( not ( = ?AUTO_771 ?AUTO_773 ) ) ( not ( = ?AUTO_774 ?AUTO_773 ) ) ( ON ?AUTO_773 ?AUTO_769 ) ( not ( = ?AUTO_769 ?AUTO_776 ) ) ( not ( = ?AUTO_770 ?AUTO_776 ) ) ( not ( = ?AUTO_775 ?AUTO_776 ) ) ( not ( = ?AUTO_772 ?AUTO_776 ) ) ( not ( = ?AUTO_771 ?AUTO_776 ) ) ( not ( = ?AUTO_774 ?AUTO_776 ) ) ( not ( = ?AUTO_773 ?AUTO_776 ) ) ( ON ?AUTO_776 ?AUTO_773 ) ( CLEAR ?AUTO_776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_776 ?AUTO_773 )
      ( MAKE-ON ?AUTO_769 ?AUTO_770 )
      ( MAKE-ON-VERIFY ?AUTO_769 ?AUTO_770 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_779 - BLOCK
      ?AUTO_780 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_779 ) ( CLEAR ?AUTO_780 ) ( not ( = ?AUTO_779 ?AUTO_780 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_779 ?AUTO_780 )
      ( MAKE-ON-VERIFY ?AUTO_779 ?AUTO_780 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_781 - BLOCK
      ?AUTO_782 - BLOCK
    )
    :vars
    (
      ?AUTO_783 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_782 ) ( not ( = ?AUTO_781 ?AUTO_782 ) ) ( ON ?AUTO_781 ?AUTO_783 ) ( CLEAR ?AUTO_781 ) ( HAND-EMPTY ) ( not ( = ?AUTO_781 ?AUTO_783 ) ) ( not ( = ?AUTO_782 ?AUTO_783 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_781 ?AUTO_783 )
      ( MAKE-ON ?AUTO_781 ?AUTO_782 )
      ( MAKE-ON-VERIFY ?AUTO_781 ?AUTO_782 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_784 - BLOCK
      ?AUTO_785 - BLOCK
    )
    :vars
    (
      ?AUTO_786 - BLOCK
      ?AUTO_787 - BLOCK
      ?AUTO_788 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_785 ) ( not ( = ?AUTO_784 ?AUTO_785 ) ) ( ON ?AUTO_784 ?AUTO_786 ) ( CLEAR ?AUTO_784 ) ( not ( = ?AUTO_784 ?AUTO_786 ) ) ( not ( = ?AUTO_785 ?AUTO_786 ) ) ( HOLDING ?AUTO_787 ) ( CLEAR ?AUTO_788 ) ( not ( = ?AUTO_784 ?AUTO_787 ) ) ( not ( = ?AUTO_784 ?AUTO_788 ) ) ( not ( = ?AUTO_785 ?AUTO_787 ) ) ( not ( = ?AUTO_785 ?AUTO_788 ) ) ( not ( = ?AUTO_786 ?AUTO_787 ) ) ( not ( = ?AUTO_786 ?AUTO_788 ) ) ( not ( = ?AUTO_787 ?AUTO_788 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_787 ?AUTO_788 )
      ( MAKE-ON ?AUTO_784 ?AUTO_785 )
      ( MAKE-ON-VERIFY ?AUTO_784 ?AUTO_785 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_789 - BLOCK
      ?AUTO_790 - BLOCK
    )
    :vars
    (
      ?AUTO_791 - BLOCK
      ?AUTO_792 - BLOCK
      ?AUTO_793 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_789 ?AUTO_790 ) ) ( ON ?AUTO_789 ?AUTO_791 ) ( CLEAR ?AUTO_789 ) ( not ( = ?AUTO_789 ?AUTO_791 ) ) ( not ( = ?AUTO_790 ?AUTO_791 ) ) ( CLEAR ?AUTO_792 ) ( not ( = ?AUTO_789 ?AUTO_793 ) ) ( not ( = ?AUTO_789 ?AUTO_792 ) ) ( not ( = ?AUTO_790 ?AUTO_793 ) ) ( not ( = ?AUTO_790 ?AUTO_792 ) ) ( not ( = ?AUTO_791 ?AUTO_793 ) ) ( not ( = ?AUTO_791 ?AUTO_792 ) ) ( not ( = ?AUTO_793 ?AUTO_792 ) ) ( ON ?AUTO_793 ?AUTO_790 ) ( CLEAR ?AUTO_793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_793 ?AUTO_790 )
      ( MAKE-ON ?AUTO_789 ?AUTO_790 )
      ( MAKE-ON-VERIFY ?AUTO_789 ?AUTO_790 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_794 - BLOCK
      ?AUTO_795 - BLOCK
    )
    :vars
    (
      ?AUTO_798 - BLOCK
      ?AUTO_797 - BLOCK
      ?AUTO_796 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_794 ?AUTO_795 ) ) ( ON ?AUTO_794 ?AUTO_798 ) ( CLEAR ?AUTO_794 ) ( not ( = ?AUTO_794 ?AUTO_798 ) ) ( not ( = ?AUTO_795 ?AUTO_798 ) ) ( not ( = ?AUTO_794 ?AUTO_797 ) ) ( not ( = ?AUTO_794 ?AUTO_796 ) ) ( not ( = ?AUTO_795 ?AUTO_797 ) ) ( not ( = ?AUTO_795 ?AUTO_796 ) ) ( not ( = ?AUTO_798 ?AUTO_797 ) ) ( not ( = ?AUTO_798 ?AUTO_796 ) ) ( not ( = ?AUTO_797 ?AUTO_796 ) ) ( ON ?AUTO_797 ?AUTO_795 ) ( CLEAR ?AUTO_797 ) ( HOLDING ?AUTO_796 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_796 )
      ( MAKE-ON ?AUTO_794 ?AUTO_795 )
      ( MAKE-ON-VERIFY ?AUTO_794 ?AUTO_795 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_799 - BLOCK
      ?AUTO_800 - BLOCK
    )
    :vars
    (
      ?AUTO_803 - BLOCK
      ?AUTO_801 - BLOCK
      ?AUTO_802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_799 ?AUTO_800 ) ) ( ON ?AUTO_799 ?AUTO_803 ) ( not ( = ?AUTO_799 ?AUTO_803 ) ) ( not ( = ?AUTO_800 ?AUTO_803 ) ) ( not ( = ?AUTO_799 ?AUTO_801 ) ) ( not ( = ?AUTO_799 ?AUTO_802 ) ) ( not ( = ?AUTO_800 ?AUTO_801 ) ) ( not ( = ?AUTO_800 ?AUTO_802 ) ) ( not ( = ?AUTO_803 ?AUTO_801 ) ) ( not ( = ?AUTO_803 ?AUTO_802 ) ) ( not ( = ?AUTO_801 ?AUTO_802 ) ) ( ON ?AUTO_801 ?AUTO_800 ) ( CLEAR ?AUTO_801 ) ( ON ?AUTO_802 ?AUTO_799 ) ( CLEAR ?AUTO_802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_802 ?AUTO_799 )
      ( MAKE-ON ?AUTO_799 ?AUTO_800 )
      ( MAKE-ON-VERIFY ?AUTO_799 ?AUTO_800 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_804 - BLOCK
      ?AUTO_805 - BLOCK
    )
    :vars
    (
      ?AUTO_808 - BLOCK
      ?AUTO_807 - BLOCK
      ?AUTO_806 - BLOCK
      ?AUTO_809 - BLOCK
      ?AUTO_810 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_804 ?AUTO_805 ) ) ( ON ?AUTO_804 ?AUTO_808 ) ( not ( = ?AUTO_804 ?AUTO_808 ) ) ( not ( = ?AUTO_805 ?AUTO_808 ) ) ( not ( = ?AUTO_804 ?AUTO_807 ) ) ( not ( = ?AUTO_804 ?AUTO_806 ) ) ( not ( = ?AUTO_805 ?AUTO_807 ) ) ( not ( = ?AUTO_805 ?AUTO_806 ) ) ( not ( = ?AUTO_808 ?AUTO_807 ) ) ( not ( = ?AUTO_808 ?AUTO_806 ) ) ( not ( = ?AUTO_807 ?AUTO_806 ) ) ( ON ?AUTO_807 ?AUTO_805 ) ( CLEAR ?AUTO_807 ) ( ON ?AUTO_806 ?AUTO_804 ) ( CLEAR ?AUTO_806 ) ( HOLDING ?AUTO_809 ) ( CLEAR ?AUTO_810 ) ( not ( = ?AUTO_804 ?AUTO_809 ) ) ( not ( = ?AUTO_804 ?AUTO_810 ) ) ( not ( = ?AUTO_805 ?AUTO_809 ) ) ( not ( = ?AUTO_805 ?AUTO_810 ) ) ( not ( = ?AUTO_808 ?AUTO_809 ) ) ( not ( = ?AUTO_808 ?AUTO_810 ) ) ( not ( = ?AUTO_807 ?AUTO_809 ) ) ( not ( = ?AUTO_807 ?AUTO_810 ) ) ( not ( = ?AUTO_806 ?AUTO_809 ) ) ( not ( = ?AUTO_806 ?AUTO_810 ) ) ( not ( = ?AUTO_809 ?AUTO_810 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_809 ?AUTO_810 )
      ( MAKE-ON ?AUTO_804 ?AUTO_805 )
      ( MAKE-ON-VERIFY ?AUTO_804 ?AUTO_805 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_811 - BLOCK
      ?AUTO_812 - BLOCK
    )
    :vars
    (
      ?AUTO_817 - BLOCK
      ?AUTO_814 - BLOCK
      ?AUTO_813 - BLOCK
      ?AUTO_816 - BLOCK
      ?AUTO_815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_811 ?AUTO_812 ) ) ( ON ?AUTO_811 ?AUTO_817 ) ( not ( = ?AUTO_811 ?AUTO_817 ) ) ( not ( = ?AUTO_812 ?AUTO_817 ) ) ( not ( = ?AUTO_811 ?AUTO_814 ) ) ( not ( = ?AUTO_811 ?AUTO_813 ) ) ( not ( = ?AUTO_812 ?AUTO_814 ) ) ( not ( = ?AUTO_812 ?AUTO_813 ) ) ( not ( = ?AUTO_817 ?AUTO_814 ) ) ( not ( = ?AUTO_817 ?AUTO_813 ) ) ( not ( = ?AUTO_814 ?AUTO_813 ) ) ( ON ?AUTO_814 ?AUTO_812 ) ( CLEAR ?AUTO_814 ) ( ON ?AUTO_813 ?AUTO_811 ) ( CLEAR ?AUTO_816 ) ( not ( = ?AUTO_811 ?AUTO_815 ) ) ( not ( = ?AUTO_811 ?AUTO_816 ) ) ( not ( = ?AUTO_812 ?AUTO_815 ) ) ( not ( = ?AUTO_812 ?AUTO_816 ) ) ( not ( = ?AUTO_817 ?AUTO_815 ) ) ( not ( = ?AUTO_817 ?AUTO_816 ) ) ( not ( = ?AUTO_814 ?AUTO_815 ) ) ( not ( = ?AUTO_814 ?AUTO_816 ) ) ( not ( = ?AUTO_813 ?AUTO_815 ) ) ( not ( = ?AUTO_813 ?AUTO_816 ) ) ( not ( = ?AUTO_815 ?AUTO_816 ) ) ( ON ?AUTO_815 ?AUTO_813 ) ( CLEAR ?AUTO_815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_815 ?AUTO_813 )
      ( MAKE-ON ?AUTO_811 ?AUTO_812 )
      ( MAKE-ON-VERIFY ?AUTO_811 ?AUTO_812 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_818 - BLOCK
      ?AUTO_819 - BLOCK
    )
    :vars
    (
      ?AUTO_820 - BLOCK
      ?AUTO_823 - BLOCK
      ?AUTO_822 - BLOCK
      ?AUTO_821 - BLOCK
      ?AUTO_824 - BLOCK
      ?AUTO_825 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_818 ?AUTO_819 ) ) ( ON ?AUTO_818 ?AUTO_820 ) ( not ( = ?AUTO_818 ?AUTO_820 ) ) ( not ( = ?AUTO_819 ?AUTO_820 ) ) ( not ( = ?AUTO_818 ?AUTO_823 ) ) ( not ( = ?AUTO_818 ?AUTO_822 ) ) ( not ( = ?AUTO_819 ?AUTO_823 ) ) ( not ( = ?AUTO_819 ?AUTO_822 ) ) ( not ( = ?AUTO_820 ?AUTO_823 ) ) ( not ( = ?AUTO_820 ?AUTO_822 ) ) ( not ( = ?AUTO_823 ?AUTO_822 ) ) ( ON ?AUTO_823 ?AUTO_819 ) ( CLEAR ?AUTO_823 ) ( ON ?AUTO_822 ?AUTO_818 ) ( CLEAR ?AUTO_821 ) ( not ( = ?AUTO_818 ?AUTO_824 ) ) ( not ( = ?AUTO_818 ?AUTO_821 ) ) ( not ( = ?AUTO_819 ?AUTO_824 ) ) ( not ( = ?AUTO_819 ?AUTO_821 ) ) ( not ( = ?AUTO_820 ?AUTO_824 ) ) ( not ( = ?AUTO_820 ?AUTO_821 ) ) ( not ( = ?AUTO_823 ?AUTO_824 ) ) ( not ( = ?AUTO_823 ?AUTO_821 ) ) ( not ( = ?AUTO_822 ?AUTO_824 ) ) ( not ( = ?AUTO_822 ?AUTO_821 ) ) ( not ( = ?AUTO_824 ?AUTO_821 ) ) ( ON ?AUTO_824 ?AUTO_822 ) ( CLEAR ?AUTO_824 ) ( HOLDING ?AUTO_825 ) ( not ( = ?AUTO_818 ?AUTO_825 ) ) ( not ( = ?AUTO_819 ?AUTO_825 ) ) ( not ( = ?AUTO_820 ?AUTO_825 ) ) ( not ( = ?AUTO_823 ?AUTO_825 ) ) ( not ( = ?AUTO_822 ?AUTO_825 ) ) ( not ( = ?AUTO_821 ?AUTO_825 ) ) ( not ( = ?AUTO_824 ?AUTO_825 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_825 )
      ( MAKE-ON ?AUTO_818 ?AUTO_819 )
      ( MAKE-ON-VERIFY ?AUTO_818 ?AUTO_819 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_826 - BLOCK
      ?AUTO_827 - BLOCK
    )
    :vars
    (
      ?AUTO_829 - BLOCK
      ?AUTO_831 - BLOCK
      ?AUTO_833 - BLOCK
      ?AUTO_828 - BLOCK
      ?AUTO_830 - BLOCK
      ?AUTO_832 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_826 ?AUTO_827 ) ) ( ON ?AUTO_826 ?AUTO_829 ) ( not ( = ?AUTO_826 ?AUTO_829 ) ) ( not ( = ?AUTO_827 ?AUTO_829 ) ) ( not ( = ?AUTO_826 ?AUTO_831 ) ) ( not ( = ?AUTO_826 ?AUTO_833 ) ) ( not ( = ?AUTO_827 ?AUTO_831 ) ) ( not ( = ?AUTO_827 ?AUTO_833 ) ) ( not ( = ?AUTO_829 ?AUTO_831 ) ) ( not ( = ?AUTO_829 ?AUTO_833 ) ) ( not ( = ?AUTO_831 ?AUTO_833 ) ) ( ON ?AUTO_831 ?AUTO_827 ) ( CLEAR ?AUTO_831 ) ( ON ?AUTO_833 ?AUTO_826 ) ( CLEAR ?AUTO_828 ) ( not ( = ?AUTO_826 ?AUTO_830 ) ) ( not ( = ?AUTO_826 ?AUTO_828 ) ) ( not ( = ?AUTO_827 ?AUTO_830 ) ) ( not ( = ?AUTO_827 ?AUTO_828 ) ) ( not ( = ?AUTO_829 ?AUTO_830 ) ) ( not ( = ?AUTO_829 ?AUTO_828 ) ) ( not ( = ?AUTO_831 ?AUTO_830 ) ) ( not ( = ?AUTO_831 ?AUTO_828 ) ) ( not ( = ?AUTO_833 ?AUTO_830 ) ) ( not ( = ?AUTO_833 ?AUTO_828 ) ) ( not ( = ?AUTO_830 ?AUTO_828 ) ) ( ON ?AUTO_830 ?AUTO_833 ) ( not ( = ?AUTO_826 ?AUTO_832 ) ) ( not ( = ?AUTO_827 ?AUTO_832 ) ) ( not ( = ?AUTO_829 ?AUTO_832 ) ) ( not ( = ?AUTO_831 ?AUTO_832 ) ) ( not ( = ?AUTO_833 ?AUTO_832 ) ) ( not ( = ?AUTO_828 ?AUTO_832 ) ) ( not ( = ?AUTO_830 ?AUTO_832 ) ) ( ON ?AUTO_832 ?AUTO_830 ) ( CLEAR ?AUTO_832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_832 ?AUTO_830 )
      ( MAKE-ON ?AUTO_826 ?AUTO_827 )
      ( MAKE-ON-VERIFY ?AUTO_826 ?AUTO_827 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_834 - BLOCK
      ?AUTO_835 - BLOCK
    )
    :vars
    (
      ?AUTO_837 - BLOCK
      ?AUTO_840 - BLOCK
      ?AUTO_839 - BLOCK
      ?AUTO_836 - BLOCK
      ?AUTO_841 - BLOCK
      ?AUTO_838 - BLOCK
      ?AUTO_842 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_834 ?AUTO_835 ) ) ( ON ?AUTO_834 ?AUTO_837 ) ( not ( = ?AUTO_834 ?AUTO_837 ) ) ( not ( = ?AUTO_835 ?AUTO_837 ) ) ( not ( = ?AUTO_834 ?AUTO_840 ) ) ( not ( = ?AUTO_834 ?AUTO_839 ) ) ( not ( = ?AUTO_835 ?AUTO_840 ) ) ( not ( = ?AUTO_835 ?AUTO_839 ) ) ( not ( = ?AUTO_837 ?AUTO_840 ) ) ( not ( = ?AUTO_837 ?AUTO_839 ) ) ( not ( = ?AUTO_840 ?AUTO_839 ) ) ( ON ?AUTO_840 ?AUTO_835 ) ( CLEAR ?AUTO_840 ) ( ON ?AUTO_839 ?AUTO_834 ) ( CLEAR ?AUTO_836 ) ( not ( = ?AUTO_834 ?AUTO_841 ) ) ( not ( = ?AUTO_834 ?AUTO_836 ) ) ( not ( = ?AUTO_835 ?AUTO_841 ) ) ( not ( = ?AUTO_835 ?AUTO_836 ) ) ( not ( = ?AUTO_837 ?AUTO_841 ) ) ( not ( = ?AUTO_837 ?AUTO_836 ) ) ( not ( = ?AUTO_840 ?AUTO_841 ) ) ( not ( = ?AUTO_840 ?AUTO_836 ) ) ( not ( = ?AUTO_839 ?AUTO_841 ) ) ( not ( = ?AUTO_839 ?AUTO_836 ) ) ( not ( = ?AUTO_841 ?AUTO_836 ) ) ( ON ?AUTO_841 ?AUTO_839 ) ( not ( = ?AUTO_834 ?AUTO_838 ) ) ( not ( = ?AUTO_835 ?AUTO_838 ) ) ( not ( = ?AUTO_837 ?AUTO_838 ) ) ( not ( = ?AUTO_840 ?AUTO_838 ) ) ( not ( = ?AUTO_839 ?AUTO_838 ) ) ( not ( = ?AUTO_836 ?AUTO_838 ) ) ( not ( = ?AUTO_841 ?AUTO_838 ) ) ( ON ?AUTO_838 ?AUTO_841 ) ( CLEAR ?AUTO_838 ) ( HOLDING ?AUTO_842 ) ( not ( = ?AUTO_834 ?AUTO_842 ) ) ( not ( = ?AUTO_835 ?AUTO_842 ) ) ( not ( = ?AUTO_837 ?AUTO_842 ) ) ( not ( = ?AUTO_840 ?AUTO_842 ) ) ( not ( = ?AUTO_839 ?AUTO_842 ) ) ( not ( = ?AUTO_836 ?AUTO_842 ) ) ( not ( = ?AUTO_841 ?AUTO_842 ) ) ( not ( = ?AUTO_838 ?AUTO_842 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_842 )
      ( MAKE-ON ?AUTO_834 ?AUTO_835 )
      ( MAKE-ON-VERIFY ?AUTO_834 ?AUTO_835 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_843 - BLOCK
      ?AUTO_844 - BLOCK
    )
    :vars
    (
      ?AUTO_851 - BLOCK
      ?AUTO_846 - BLOCK
      ?AUTO_845 - BLOCK
      ?AUTO_847 - BLOCK
      ?AUTO_848 - BLOCK
      ?AUTO_850 - BLOCK
      ?AUTO_849 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_843 ?AUTO_844 ) ) ( ON ?AUTO_843 ?AUTO_851 ) ( not ( = ?AUTO_843 ?AUTO_851 ) ) ( not ( = ?AUTO_844 ?AUTO_851 ) ) ( not ( = ?AUTO_843 ?AUTO_846 ) ) ( not ( = ?AUTO_843 ?AUTO_845 ) ) ( not ( = ?AUTO_844 ?AUTO_846 ) ) ( not ( = ?AUTO_844 ?AUTO_845 ) ) ( not ( = ?AUTO_851 ?AUTO_846 ) ) ( not ( = ?AUTO_851 ?AUTO_845 ) ) ( not ( = ?AUTO_846 ?AUTO_845 ) ) ( ON ?AUTO_846 ?AUTO_844 ) ( ON ?AUTO_845 ?AUTO_843 ) ( CLEAR ?AUTO_847 ) ( not ( = ?AUTO_843 ?AUTO_848 ) ) ( not ( = ?AUTO_843 ?AUTO_847 ) ) ( not ( = ?AUTO_844 ?AUTO_848 ) ) ( not ( = ?AUTO_844 ?AUTO_847 ) ) ( not ( = ?AUTO_851 ?AUTO_848 ) ) ( not ( = ?AUTO_851 ?AUTO_847 ) ) ( not ( = ?AUTO_846 ?AUTO_848 ) ) ( not ( = ?AUTO_846 ?AUTO_847 ) ) ( not ( = ?AUTO_845 ?AUTO_848 ) ) ( not ( = ?AUTO_845 ?AUTO_847 ) ) ( not ( = ?AUTO_848 ?AUTO_847 ) ) ( ON ?AUTO_848 ?AUTO_845 ) ( not ( = ?AUTO_843 ?AUTO_850 ) ) ( not ( = ?AUTO_844 ?AUTO_850 ) ) ( not ( = ?AUTO_851 ?AUTO_850 ) ) ( not ( = ?AUTO_846 ?AUTO_850 ) ) ( not ( = ?AUTO_845 ?AUTO_850 ) ) ( not ( = ?AUTO_847 ?AUTO_850 ) ) ( not ( = ?AUTO_848 ?AUTO_850 ) ) ( ON ?AUTO_850 ?AUTO_848 ) ( CLEAR ?AUTO_850 ) ( not ( = ?AUTO_843 ?AUTO_849 ) ) ( not ( = ?AUTO_844 ?AUTO_849 ) ) ( not ( = ?AUTO_851 ?AUTO_849 ) ) ( not ( = ?AUTO_846 ?AUTO_849 ) ) ( not ( = ?AUTO_845 ?AUTO_849 ) ) ( not ( = ?AUTO_847 ?AUTO_849 ) ) ( not ( = ?AUTO_848 ?AUTO_849 ) ) ( not ( = ?AUTO_850 ?AUTO_849 ) ) ( ON ?AUTO_849 ?AUTO_846 ) ( CLEAR ?AUTO_849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_849 ?AUTO_846 )
      ( MAKE-ON ?AUTO_843 ?AUTO_844 )
      ( MAKE-ON-VERIFY ?AUTO_843 ?AUTO_844 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_852 - BLOCK
      ?AUTO_853 - BLOCK
    )
    :vars
    (
      ?AUTO_860 - BLOCK
      ?AUTO_856 - BLOCK
      ?AUTO_857 - BLOCK
      ?AUTO_859 - BLOCK
      ?AUTO_858 - BLOCK
      ?AUTO_854 - BLOCK
      ?AUTO_855 - BLOCK
      ?AUTO_861 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_852 ?AUTO_853 ) ) ( ON ?AUTO_852 ?AUTO_860 ) ( not ( = ?AUTO_852 ?AUTO_860 ) ) ( not ( = ?AUTO_853 ?AUTO_860 ) ) ( not ( = ?AUTO_852 ?AUTO_856 ) ) ( not ( = ?AUTO_852 ?AUTO_857 ) ) ( not ( = ?AUTO_853 ?AUTO_856 ) ) ( not ( = ?AUTO_853 ?AUTO_857 ) ) ( not ( = ?AUTO_860 ?AUTO_856 ) ) ( not ( = ?AUTO_860 ?AUTO_857 ) ) ( not ( = ?AUTO_856 ?AUTO_857 ) ) ( ON ?AUTO_856 ?AUTO_853 ) ( ON ?AUTO_857 ?AUTO_852 ) ( CLEAR ?AUTO_859 ) ( not ( = ?AUTO_852 ?AUTO_858 ) ) ( not ( = ?AUTO_852 ?AUTO_859 ) ) ( not ( = ?AUTO_853 ?AUTO_858 ) ) ( not ( = ?AUTO_853 ?AUTO_859 ) ) ( not ( = ?AUTO_860 ?AUTO_858 ) ) ( not ( = ?AUTO_860 ?AUTO_859 ) ) ( not ( = ?AUTO_856 ?AUTO_858 ) ) ( not ( = ?AUTO_856 ?AUTO_859 ) ) ( not ( = ?AUTO_857 ?AUTO_858 ) ) ( not ( = ?AUTO_857 ?AUTO_859 ) ) ( not ( = ?AUTO_858 ?AUTO_859 ) ) ( ON ?AUTO_858 ?AUTO_857 ) ( not ( = ?AUTO_852 ?AUTO_854 ) ) ( not ( = ?AUTO_853 ?AUTO_854 ) ) ( not ( = ?AUTO_860 ?AUTO_854 ) ) ( not ( = ?AUTO_856 ?AUTO_854 ) ) ( not ( = ?AUTO_857 ?AUTO_854 ) ) ( not ( = ?AUTO_859 ?AUTO_854 ) ) ( not ( = ?AUTO_858 ?AUTO_854 ) ) ( ON ?AUTO_854 ?AUTO_858 ) ( CLEAR ?AUTO_854 ) ( not ( = ?AUTO_852 ?AUTO_855 ) ) ( not ( = ?AUTO_853 ?AUTO_855 ) ) ( not ( = ?AUTO_860 ?AUTO_855 ) ) ( not ( = ?AUTO_856 ?AUTO_855 ) ) ( not ( = ?AUTO_857 ?AUTO_855 ) ) ( not ( = ?AUTO_859 ?AUTO_855 ) ) ( not ( = ?AUTO_858 ?AUTO_855 ) ) ( not ( = ?AUTO_854 ?AUTO_855 ) ) ( ON ?AUTO_855 ?AUTO_856 ) ( CLEAR ?AUTO_855 ) ( HOLDING ?AUTO_861 ) ( not ( = ?AUTO_852 ?AUTO_861 ) ) ( not ( = ?AUTO_853 ?AUTO_861 ) ) ( not ( = ?AUTO_860 ?AUTO_861 ) ) ( not ( = ?AUTO_856 ?AUTO_861 ) ) ( not ( = ?AUTO_857 ?AUTO_861 ) ) ( not ( = ?AUTO_859 ?AUTO_861 ) ) ( not ( = ?AUTO_858 ?AUTO_861 ) ) ( not ( = ?AUTO_854 ?AUTO_861 ) ) ( not ( = ?AUTO_855 ?AUTO_861 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_861 )
      ( MAKE-ON ?AUTO_852 ?AUTO_853 )
      ( MAKE-ON-VERIFY ?AUTO_852 ?AUTO_853 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_862 - BLOCK
      ?AUTO_863 - BLOCK
    )
    :vars
    (
      ?AUTO_865 - BLOCK
      ?AUTO_864 - BLOCK
      ?AUTO_871 - BLOCK
      ?AUTO_868 - BLOCK
      ?AUTO_870 - BLOCK
      ?AUTO_867 - BLOCK
      ?AUTO_869 - BLOCK
      ?AUTO_866 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_862 ?AUTO_863 ) ) ( ON ?AUTO_862 ?AUTO_865 ) ( not ( = ?AUTO_862 ?AUTO_865 ) ) ( not ( = ?AUTO_863 ?AUTO_865 ) ) ( not ( = ?AUTO_862 ?AUTO_864 ) ) ( not ( = ?AUTO_862 ?AUTO_871 ) ) ( not ( = ?AUTO_863 ?AUTO_864 ) ) ( not ( = ?AUTO_863 ?AUTO_871 ) ) ( not ( = ?AUTO_865 ?AUTO_864 ) ) ( not ( = ?AUTO_865 ?AUTO_871 ) ) ( not ( = ?AUTO_864 ?AUTO_871 ) ) ( ON ?AUTO_864 ?AUTO_863 ) ( ON ?AUTO_871 ?AUTO_862 ) ( CLEAR ?AUTO_868 ) ( not ( = ?AUTO_862 ?AUTO_870 ) ) ( not ( = ?AUTO_862 ?AUTO_868 ) ) ( not ( = ?AUTO_863 ?AUTO_870 ) ) ( not ( = ?AUTO_863 ?AUTO_868 ) ) ( not ( = ?AUTO_865 ?AUTO_870 ) ) ( not ( = ?AUTO_865 ?AUTO_868 ) ) ( not ( = ?AUTO_864 ?AUTO_870 ) ) ( not ( = ?AUTO_864 ?AUTO_868 ) ) ( not ( = ?AUTO_871 ?AUTO_870 ) ) ( not ( = ?AUTO_871 ?AUTO_868 ) ) ( not ( = ?AUTO_870 ?AUTO_868 ) ) ( ON ?AUTO_870 ?AUTO_871 ) ( not ( = ?AUTO_862 ?AUTO_867 ) ) ( not ( = ?AUTO_863 ?AUTO_867 ) ) ( not ( = ?AUTO_865 ?AUTO_867 ) ) ( not ( = ?AUTO_864 ?AUTO_867 ) ) ( not ( = ?AUTO_871 ?AUTO_867 ) ) ( not ( = ?AUTO_868 ?AUTO_867 ) ) ( not ( = ?AUTO_870 ?AUTO_867 ) ) ( ON ?AUTO_867 ?AUTO_870 ) ( CLEAR ?AUTO_867 ) ( not ( = ?AUTO_862 ?AUTO_869 ) ) ( not ( = ?AUTO_863 ?AUTO_869 ) ) ( not ( = ?AUTO_865 ?AUTO_869 ) ) ( not ( = ?AUTO_864 ?AUTO_869 ) ) ( not ( = ?AUTO_871 ?AUTO_869 ) ) ( not ( = ?AUTO_868 ?AUTO_869 ) ) ( not ( = ?AUTO_870 ?AUTO_869 ) ) ( not ( = ?AUTO_867 ?AUTO_869 ) ) ( ON ?AUTO_869 ?AUTO_864 ) ( not ( = ?AUTO_862 ?AUTO_866 ) ) ( not ( = ?AUTO_863 ?AUTO_866 ) ) ( not ( = ?AUTO_865 ?AUTO_866 ) ) ( not ( = ?AUTO_864 ?AUTO_866 ) ) ( not ( = ?AUTO_871 ?AUTO_866 ) ) ( not ( = ?AUTO_868 ?AUTO_866 ) ) ( not ( = ?AUTO_870 ?AUTO_866 ) ) ( not ( = ?AUTO_867 ?AUTO_866 ) ) ( not ( = ?AUTO_869 ?AUTO_866 ) ) ( ON ?AUTO_866 ?AUTO_869 ) ( CLEAR ?AUTO_866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_866 ?AUTO_869 )
      ( MAKE-ON ?AUTO_862 ?AUTO_863 )
      ( MAKE-ON-VERIFY ?AUTO_862 ?AUTO_863 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_873 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_873 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_873 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_873 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_874 - BLOCK
    )
    :vars
    (
      ?AUTO_875 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_874 ?AUTO_875 ) ( CLEAR ?AUTO_874 ) ( HAND-EMPTY ) ( not ( = ?AUTO_874 ?AUTO_875 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_874 ?AUTO_875 )
      ( MAKE-ON-TABLE ?AUTO_874 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_874 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_877 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_877 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_877 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_877 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_878 - BLOCK
    )
    :vars
    (
      ?AUTO_879 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_878 ?AUTO_879 ) ( CLEAR ?AUTO_878 ) ( HAND-EMPTY ) ( not ( = ?AUTO_878 ?AUTO_879 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_878 ?AUTO_879 )
      ( MAKE-ON-TABLE ?AUTO_878 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_878 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_880 - BLOCK
    )
    :vars
    (
      ?AUTO_881 - BLOCK
      ?AUTO_882 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_880 ?AUTO_881 ) ( CLEAR ?AUTO_880 ) ( not ( = ?AUTO_880 ?AUTO_881 ) ) ( HOLDING ?AUTO_882 ) ( not ( = ?AUTO_880 ?AUTO_882 ) ) ( not ( = ?AUTO_881 ?AUTO_882 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_882 )
      ( MAKE-ON-TABLE ?AUTO_880 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_880 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_886 - BLOCK
      ?AUTO_887 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_886 ) ( CLEAR ?AUTO_887 ) ( not ( = ?AUTO_886 ?AUTO_887 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_886 ?AUTO_887 )
      ( MAKE-ON-VERIFY ?AUTO_886 ?AUTO_887 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_888 - BLOCK
      ?AUTO_889 - BLOCK
    )
    :vars
    (
      ?AUTO_890 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_889 ) ( not ( = ?AUTO_888 ?AUTO_889 ) ) ( ON ?AUTO_888 ?AUTO_890 ) ( CLEAR ?AUTO_888 ) ( HAND-EMPTY ) ( not ( = ?AUTO_888 ?AUTO_890 ) ) ( not ( = ?AUTO_889 ?AUTO_890 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_888 ?AUTO_890 )
      ( MAKE-ON ?AUTO_888 ?AUTO_889 )
      ( MAKE-ON-VERIFY ?AUTO_888 ?AUTO_889 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_891 - BLOCK
      ?AUTO_892 - BLOCK
    )
    :vars
    (
      ?AUTO_893 - BLOCK
      ?AUTO_894 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_892 ) ( not ( = ?AUTO_891 ?AUTO_892 ) ) ( ON ?AUTO_891 ?AUTO_893 ) ( CLEAR ?AUTO_891 ) ( not ( = ?AUTO_891 ?AUTO_893 ) ) ( not ( = ?AUTO_892 ?AUTO_893 ) ) ( HOLDING ?AUTO_894 ) ( not ( = ?AUTO_891 ?AUTO_894 ) ) ( not ( = ?AUTO_892 ?AUTO_894 ) ) ( not ( = ?AUTO_893 ?AUTO_894 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_894 )
      ( MAKE-ON ?AUTO_891 ?AUTO_892 )
      ( MAKE-ON-VERIFY ?AUTO_891 ?AUTO_892 ) )
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
    )
    :precondition
    ( and ( not ( = ?AUTO_897 ?AUTO_898 ) ) ( ON ?AUTO_897 ?AUTO_899 ) ( CLEAR ?AUTO_897 ) ( not ( = ?AUTO_897 ?AUTO_899 ) ) ( not ( = ?AUTO_898 ?AUTO_899 ) ) ( HOLDING ?AUTO_898 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_898 )
      ( MAKE-ON ?AUTO_897 ?AUTO_898 )
      ( MAKE-ON-VERIFY ?AUTO_897 ?AUTO_898 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_904 - BLOCK
      ?AUTO_905 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_904 ) ( CLEAR ?AUTO_905 ) ( not ( = ?AUTO_904 ?AUTO_905 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_904 ?AUTO_905 )
      ( MAKE-ON-VERIFY ?AUTO_904 ?AUTO_905 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_906 - BLOCK
      ?AUTO_907 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_907 ) ( not ( = ?AUTO_906 ?AUTO_907 ) ) ( ON-TABLE ?AUTO_906 ) ( CLEAR ?AUTO_906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_906 )
      ( MAKE-ON ?AUTO_906 ?AUTO_907 )
      ( MAKE-ON-VERIFY ?AUTO_906 ?AUTO_907 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_908 - BLOCK
      ?AUTO_909 - BLOCK
    )
    :vars
    (
      ?AUTO_910 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_908 ?AUTO_909 ) ) ( ON-TABLE ?AUTO_908 ) ( CLEAR ?AUTO_908 ) ( HOLDING ?AUTO_909 ) ( CLEAR ?AUTO_910 ) ( not ( = ?AUTO_908 ?AUTO_910 ) ) ( not ( = ?AUTO_909 ?AUTO_910 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_909 ?AUTO_910 )
      ( MAKE-ON ?AUTO_908 ?AUTO_909 )
      ( MAKE-ON-VERIFY ?AUTO_908 ?AUTO_909 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_913 - BLOCK
      ?AUTO_914 - BLOCK
    )
    :vars
    (
      ?AUTO_915 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_914 ) ( not ( = ?AUTO_913 ?AUTO_914 ) ) ( ON-TABLE ?AUTO_913 ) ( CLEAR ?AUTO_913 ) ( HOLDING ?AUTO_915 ) ( not ( = ?AUTO_913 ?AUTO_915 ) ) ( not ( = ?AUTO_914 ?AUTO_915 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_915 )
      ( MAKE-ON ?AUTO_913 ?AUTO_914 )
      ( MAKE-ON-VERIFY ?AUTO_913 ?AUTO_914 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_916 - BLOCK
      ?AUTO_917 - BLOCK
    )
    :vars
    (
      ?AUTO_918 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_917 ) ( not ( = ?AUTO_916 ?AUTO_917 ) ) ( ON-TABLE ?AUTO_916 ) ( not ( = ?AUTO_916 ?AUTO_918 ) ) ( not ( = ?AUTO_917 ?AUTO_918 ) ) ( ON ?AUTO_918 ?AUTO_916 ) ( CLEAR ?AUTO_918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_918 ?AUTO_916 )
      ( MAKE-ON ?AUTO_916 ?AUTO_917 )
      ( MAKE-ON-VERIFY ?AUTO_916 ?AUTO_917 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_919 - BLOCK
      ?AUTO_920 - BLOCK
    )
    :vars
    (
      ?AUTO_921 - BLOCK
      ?AUTO_922 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_920 ) ( not ( = ?AUTO_919 ?AUTO_920 ) ) ( ON-TABLE ?AUTO_919 ) ( not ( = ?AUTO_919 ?AUTO_921 ) ) ( not ( = ?AUTO_920 ?AUTO_921 ) ) ( ON ?AUTO_921 ?AUTO_919 ) ( CLEAR ?AUTO_921 ) ( HOLDING ?AUTO_922 ) ( not ( = ?AUTO_919 ?AUTO_922 ) ) ( not ( = ?AUTO_920 ?AUTO_922 ) ) ( not ( = ?AUTO_921 ?AUTO_922 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_922 )
      ( MAKE-ON ?AUTO_919 ?AUTO_920 )
      ( MAKE-ON-VERIFY ?AUTO_919 ?AUTO_920 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_927 - BLOCK
      ?AUTO_928 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_927 ) ( CLEAR ?AUTO_928 ) ( not ( = ?AUTO_927 ?AUTO_928 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_927 ?AUTO_928 )
      ( MAKE-ON-VERIFY ?AUTO_927 ?AUTO_928 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_929 - BLOCK
      ?AUTO_930 - BLOCK
    )
    :vars
    (
      ?AUTO_931 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_930 ) ( not ( = ?AUTO_929 ?AUTO_930 ) ) ( ON ?AUTO_929 ?AUTO_931 ) ( CLEAR ?AUTO_929 ) ( HAND-EMPTY ) ( not ( = ?AUTO_929 ?AUTO_931 ) ) ( not ( = ?AUTO_930 ?AUTO_931 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_929 ?AUTO_931 )
      ( MAKE-ON ?AUTO_929 ?AUTO_930 )
      ( MAKE-ON-VERIFY ?AUTO_929 ?AUTO_930 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_932 - BLOCK
      ?AUTO_933 - BLOCK
    )
    :vars
    (
      ?AUTO_934 - BLOCK
      ?AUTO_935 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_932 ?AUTO_933 ) ) ( ON ?AUTO_932 ?AUTO_934 ) ( CLEAR ?AUTO_932 ) ( not ( = ?AUTO_932 ?AUTO_934 ) ) ( not ( = ?AUTO_933 ?AUTO_934 ) ) ( HOLDING ?AUTO_933 ) ( CLEAR ?AUTO_935 ) ( not ( = ?AUTO_932 ?AUTO_935 ) ) ( not ( = ?AUTO_933 ?AUTO_935 ) ) ( not ( = ?AUTO_934 ?AUTO_935 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_933 ?AUTO_935 )
      ( MAKE-ON ?AUTO_932 ?AUTO_933 )
      ( MAKE-ON-VERIFY ?AUTO_932 ?AUTO_933 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_938 - BLOCK
      ?AUTO_939 - BLOCK
    )
    :vars
    (
      ?AUTO_940 - BLOCK
      ?AUTO_941 - BLOCK
      ?AUTO_942 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_939 ) ( not ( = ?AUTO_938 ?AUTO_939 ) ) ( ON ?AUTO_938 ?AUTO_940 ) ( CLEAR ?AUTO_938 ) ( not ( = ?AUTO_938 ?AUTO_940 ) ) ( not ( = ?AUTO_939 ?AUTO_940 ) ) ( HOLDING ?AUTO_941 ) ( CLEAR ?AUTO_942 ) ( not ( = ?AUTO_938 ?AUTO_941 ) ) ( not ( = ?AUTO_938 ?AUTO_942 ) ) ( not ( = ?AUTO_939 ?AUTO_941 ) ) ( not ( = ?AUTO_939 ?AUTO_942 ) ) ( not ( = ?AUTO_940 ?AUTO_941 ) ) ( not ( = ?AUTO_940 ?AUTO_942 ) ) ( not ( = ?AUTO_941 ?AUTO_942 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_941 ?AUTO_942 )
      ( MAKE-ON ?AUTO_938 ?AUTO_939 )
      ( MAKE-ON-VERIFY ?AUTO_938 ?AUTO_939 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_943 - BLOCK
      ?AUTO_944 - BLOCK
    )
    :vars
    (
      ?AUTO_945 - BLOCK
      ?AUTO_946 - BLOCK
      ?AUTO_947 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_944 ) ( not ( = ?AUTO_943 ?AUTO_944 ) ) ( ON ?AUTO_943 ?AUTO_945 ) ( not ( = ?AUTO_943 ?AUTO_945 ) ) ( not ( = ?AUTO_944 ?AUTO_945 ) ) ( CLEAR ?AUTO_946 ) ( not ( = ?AUTO_943 ?AUTO_947 ) ) ( not ( = ?AUTO_943 ?AUTO_946 ) ) ( not ( = ?AUTO_944 ?AUTO_947 ) ) ( not ( = ?AUTO_944 ?AUTO_946 ) ) ( not ( = ?AUTO_945 ?AUTO_947 ) ) ( not ( = ?AUTO_945 ?AUTO_946 ) ) ( not ( = ?AUTO_947 ?AUTO_946 ) ) ( ON ?AUTO_947 ?AUTO_943 ) ( CLEAR ?AUTO_947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_947 ?AUTO_943 )
      ( MAKE-ON ?AUTO_943 ?AUTO_944 )
      ( MAKE-ON-VERIFY ?AUTO_943 ?AUTO_944 ) )
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
      ?AUTO_953 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_949 ) ( not ( = ?AUTO_948 ?AUTO_949 ) ) ( ON ?AUTO_948 ?AUTO_950 ) ( not ( = ?AUTO_948 ?AUTO_950 ) ) ( not ( = ?AUTO_949 ?AUTO_950 ) ) ( CLEAR ?AUTO_951 ) ( not ( = ?AUTO_948 ?AUTO_952 ) ) ( not ( = ?AUTO_948 ?AUTO_951 ) ) ( not ( = ?AUTO_949 ?AUTO_952 ) ) ( not ( = ?AUTO_949 ?AUTO_951 ) ) ( not ( = ?AUTO_950 ?AUTO_952 ) ) ( not ( = ?AUTO_950 ?AUTO_951 ) ) ( not ( = ?AUTO_952 ?AUTO_951 ) ) ( ON ?AUTO_952 ?AUTO_948 ) ( CLEAR ?AUTO_952 ) ( HOLDING ?AUTO_953 ) ( not ( = ?AUTO_948 ?AUTO_953 ) ) ( not ( = ?AUTO_949 ?AUTO_953 ) ) ( not ( = ?AUTO_950 ?AUTO_953 ) ) ( not ( = ?AUTO_951 ?AUTO_953 ) ) ( not ( = ?AUTO_952 ?AUTO_953 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_953 )
      ( MAKE-ON ?AUTO_948 ?AUTO_949 )
      ( MAKE-ON-VERIFY ?AUTO_948 ?AUTO_949 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_954 - BLOCK
      ?AUTO_955 - BLOCK
    )
    :vars
    (
      ?AUTO_956 - BLOCK
      ?AUTO_957 - BLOCK
      ?AUTO_959 - BLOCK
      ?AUTO_958 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_954 ?AUTO_955 ) ) ( ON ?AUTO_954 ?AUTO_956 ) ( not ( = ?AUTO_954 ?AUTO_956 ) ) ( not ( = ?AUTO_955 ?AUTO_956 ) ) ( CLEAR ?AUTO_957 ) ( not ( = ?AUTO_954 ?AUTO_959 ) ) ( not ( = ?AUTO_954 ?AUTO_957 ) ) ( not ( = ?AUTO_955 ?AUTO_959 ) ) ( not ( = ?AUTO_955 ?AUTO_957 ) ) ( not ( = ?AUTO_956 ?AUTO_959 ) ) ( not ( = ?AUTO_956 ?AUTO_957 ) ) ( not ( = ?AUTO_959 ?AUTO_957 ) ) ( ON ?AUTO_959 ?AUTO_954 ) ( CLEAR ?AUTO_959 ) ( not ( = ?AUTO_954 ?AUTO_958 ) ) ( not ( = ?AUTO_955 ?AUTO_958 ) ) ( not ( = ?AUTO_956 ?AUTO_958 ) ) ( not ( = ?AUTO_957 ?AUTO_958 ) ) ( not ( = ?AUTO_959 ?AUTO_958 ) ) ( ON ?AUTO_958 ?AUTO_955 ) ( CLEAR ?AUTO_958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_958 ?AUTO_955 )
      ( MAKE-ON ?AUTO_954 ?AUTO_955 )
      ( MAKE-ON-VERIFY ?AUTO_954 ?AUTO_955 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_960 - BLOCK
      ?AUTO_961 - BLOCK
    )
    :vars
    (
      ?AUTO_965 - BLOCK
      ?AUTO_964 - BLOCK
      ?AUTO_962 - BLOCK
      ?AUTO_963 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_960 ?AUTO_961 ) ) ( ON ?AUTO_960 ?AUTO_965 ) ( not ( = ?AUTO_960 ?AUTO_965 ) ) ( not ( = ?AUTO_961 ?AUTO_965 ) ) ( not ( = ?AUTO_960 ?AUTO_964 ) ) ( not ( = ?AUTO_960 ?AUTO_962 ) ) ( not ( = ?AUTO_961 ?AUTO_964 ) ) ( not ( = ?AUTO_961 ?AUTO_962 ) ) ( not ( = ?AUTO_965 ?AUTO_964 ) ) ( not ( = ?AUTO_965 ?AUTO_962 ) ) ( not ( = ?AUTO_964 ?AUTO_962 ) ) ( ON ?AUTO_964 ?AUTO_960 ) ( CLEAR ?AUTO_964 ) ( not ( = ?AUTO_960 ?AUTO_963 ) ) ( not ( = ?AUTO_961 ?AUTO_963 ) ) ( not ( = ?AUTO_965 ?AUTO_963 ) ) ( not ( = ?AUTO_962 ?AUTO_963 ) ) ( not ( = ?AUTO_964 ?AUTO_963 ) ) ( ON ?AUTO_963 ?AUTO_961 ) ( CLEAR ?AUTO_963 ) ( HOLDING ?AUTO_962 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_962 )
      ( MAKE-ON ?AUTO_960 ?AUTO_961 )
      ( MAKE-ON-VERIFY ?AUTO_960 ?AUTO_961 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_970 - BLOCK
      ?AUTO_971 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_970 ) ( CLEAR ?AUTO_971 ) ( not ( = ?AUTO_970 ?AUTO_971 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_970 ?AUTO_971 )
      ( MAKE-ON-VERIFY ?AUTO_970 ?AUTO_971 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_972 - BLOCK
      ?AUTO_973 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_973 ) ( not ( = ?AUTO_972 ?AUTO_973 ) ) ( ON-TABLE ?AUTO_972 ) ( CLEAR ?AUTO_972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_972 )
      ( MAKE-ON ?AUTO_972 ?AUTO_973 )
      ( MAKE-ON-VERIFY ?AUTO_972 ?AUTO_973 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_974 - BLOCK
      ?AUTO_975 - BLOCK
    )
    :vars
    (
      ?AUTO_976 - BLOCK
      ?AUTO_977 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_975 ) ( not ( = ?AUTO_974 ?AUTO_975 ) ) ( ON-TABLE ?AUTO_974 ) ( CLEAR ?AUTO_974 ) ( HOLDING ?AUTO_976 ) ( CLEAR ?AUTO_977 ) ( not ( = ?AUTO_974 ?AUTO_976 ) ) ( not ( = ?AUTO_974 ?AUTO_977 ) ) ( not ( = ?AUTO_975 ?AUTO_976 ) ) ( not ( = ?AUTO_975 ?AUTO_977 ) ) ( not ( = ?AUTO_976 ?AUTO_977 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_976 ?AUTO_977 )
      ( MAKE-ON ?AUTO_974 ?AUTO_975 )
      ( MAKE-ON-VERIFY ?AUTO_974 ?AUTO_975 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_978 - BLOCK
      ?AUTO_979 - BLOCK
    )
    :vars
    (
      ?AUTO_980 - BLOCK
      ?AUTO_981 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_979 ) ( not ( = ?AUTO_978 ?AUTO_979 ) ) ( ON-TABLE ?AUTO_978 ) ( CLEAR ?AUTO_980 ) ( not ( = ?AUTO_978 ?AUTO_981 ) ) ( not ( = ?AUTO_978 ?AUTO_980 ) ) ( not ( = ?AUTO_979 ?AUTO_981 ) ) ( not ( = ?AUTO_979 ?AUTO_980 ) ) ( not ( = ?AUTO_981 ?AUTO_980 ) ) ( ON ?AUTO_981 ?AUTO_978 ) ( CLEAR ?AUTO_981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_981 ?AUTO_978 )
      ( MAKE-ON ?AUTO_978 ?AUTO_979 )
      ( MAKE-ON-VERIFY ?AUTO_978 ?AUTO_979 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_982 - BLOCK
      ?AUTO_983 - BLOCK
    )
    :vars
    (
      ?AUTO_984 - BLOCK
      ?AUTO_985 - BLOCK
      ?AUTO_986 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_983 ) ( not ( = ?AUTO_982 ?AUTO_983 ) ) ( ON-TABLE ?AUTO_982 ) ( not ( = ?AUTO_982 ?AUTO_984 ) ) ( not ( = ?AUTO_982 ?AUTO_985 ) ) ( not ( = ?AUTO_983 ?AUTO_984 ) ) ( not ( = ?AUTO_983 ?AUTO_985 ) ) ( not ( = ?AUTO_984 ?AUTO_985 ) ) ( ON ?AUTO_984 ?AUTO_982 ) ( CLEAR ?AUTO_984 ) ( HOLDING ?AUTO_985 ) ( CLEAR ?AUTO_986 ) ( not ( = ?AUTO_982 ?AUTO_986 ) ) ( not ( = ?AUTO_983 ?AUTO_986 ) ) ( not ( = ?AUTO_984 ?AUTO_986 ) ) ( not ( = ?AUTO_985 ?AUTO_986 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_985 ?AUTO_986 )
      ( MAKE-ON ?AUTO_982 ?AUTO_983 )
      ( MAKE-ON-VERIFY ?AUTO_982 ?AUTO_983 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_991 - BLOCK
      ?AUTO_992 - BLOCK
    )
    :vars
    (
      ?AUTO_994 - BLOCK
      ?AUTO_993 - BLOCK
      ?AUTO_995 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_992 ) ( not ( = ?AUTO_991 ?AUTO_992 ) ) ( ON-TABLE ?AUTO_991 ) ( not ( = ?AUTO_991 ?AUTO_994 ) ) ( not ( = ?AUTO_991 ?AUTO_993 ) ) ( not ( = ?AUTO_992 ?AUTO_994 ) ) ( not ( = ?AUTO_992 ?AUTO_993 ) ) ( not ( = ?AUTO_994 ?AUTO_993 ) ) ( ON ?AUTO_994 ?AUTO_991 ) ( CLEAR ?AUTO_995 ) ( not ( = ?AUTO_991 ?AUTO_995 ) ) ( not ( = ?AUTO_992 ?AUTO_995 ) ) ( not ( = ?AUTO_994 ?AUTO_995 ) ) ( not ( = ?AUTO_993 ?AUTO_995 ) ) ( ON ?AUTO_993 ?AUTO_994 ) ( CLEAR ?AUTO_993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_993 ?AUTO_994 )
      ( MAKE-ON ?AUTO_991 ?AUTO_992 )
      ( MAKE-ON-VERIFY ?AUTO_991 ?AUTO_992 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_996 - BLOCK
      ?AUTO_997 - BLOCK
    )
    :vars
    (
      ?AUTO_999 - BLOCK
      ?AUTO_998 - BLOCK
      ?AUTO_1000 - BLOCK
      ?AUTO_1001 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_997 ) ( not ( = ?AUTO_996 ?AUTO_997 ) ) ( ON-TABLE ?AUTO_996 ) ( not ( = ?AUTO_996 ?AUTO_999 ) ) ( not ( = ?AUTO_996 ?AUTO_998 ) ) ( not ( = ?AUTO_997 ?AUTO_999 ) ) ( not ( = ?AUTO_997 ?AUTO_998 ) ) ( not ( = ?AUTO_999 ?AUTO_998 ) ) ( ON ?AUTO_999 ?AUTO_996 ) ( CLEAR ?AUTO_1000 ) ( not ( = ?AUTO_996 ?AUTO_1000 ) ) ( not ( = ?AUTO_997 ?AUTO_1000 ) ) ( not ( = ?AUTO_999 ?AUTO_1000 ) ) ( not ( = ?AUTO_998 ?AUTO_1000 ) ) ( ON ?AUTO_998 ?AUTO_999 ) ( CLEAR ?AUTO_998 ) ( HOLDING ?AUTO_1001 ) ( not ( = ?AUTO_996 ?AUTO_1001 ) ) ( not ( = ?AUTO_997 ?AUTO_1001 ) ) ( not ( = ?AUTO_999 ?AUTO_1001 ) ) ( not ( = ?AUTO_998 ?AUTO_1001 ) ) ( not ( = ?AUTO_1000 ?AUTO_1001 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1001 )
      ( MAKE-ON ?AUTO_996 ?AUTO_997 )
      ( MAKE-ON-VERIFY ?AUTO_996 ?AUTO_997 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1006 - BLOCK
      ?AUTO_1007 - BLOCK
    )
    :vars
    (
      ?AUTO_1011 - BLOCK
      ?AUTO_1008 - BLOCK
      ?AUTO_1010 - BLOCK
      ?AUTO_1009 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1006 ?AUTO_1007 ) ) ( ON-TABLE ?AUTO_1006 ) ( not ( = ?AUTO_1006 ?AUTO_1011 ) ) ( not ( = ?AUTO_1006 ?AUTO_1008 ) ) ( not ( = ?AUTO_1007 ?AUTO_1011 ) ) ( not ( = ?AUTO_1007 ?AUTO_1008 ) ) ( not ( = ?AUTO_1011 ?AUTO_1008 ) ) ( ON ?AUTO_1011 ?AUTO_1006 ) ( CLEAR ?AUTO_1010 ) ( not ( = ?AUTO_1006 ?AUTO_1010 ) ) ( not ( = ?AUTO_1007 ?AUTO_1010 ) ) ( not ( = ?AUTO_1011 ?AUTO_1010 ) ) ( not ( = ?AUTO_1008 ?AUTO_1010 ) ) ( ON ?AUTO_1008 ?AUTO_1011 ) ( CLEAR ?AUTO_1008 ) ( not ( = ?AUTO_1006 ?AUTO_1009 ) ) ( not ( = ?AUTO_1007 ?AUTO_1009 ) ) ( not ( = ?AUTO_1011 ?AUTO_1009 ) ) ( not ( = ?AUTO_1008 ?AUTO_1009 ) ) ( not ( = ?AUTO_1010 ?AUTO_1009 ) ) ( ON ?AUTO_1009 ?AUTO_1007 ) ( CLEAR ?AUTO_1009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1009 ?AUTO_1007 )
      ( MAKE-ON ?AUTO_1006 ?AUTO_1007 )
      ( MAKE-ON-VERIFY ?AUTO_1006 ?AUTO_1007 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1014 - BLOCK
      ?AUTO_1015 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1014 ) ( CLEAR ?AUTO_1015 ) ( not ( = ?AUTO_1014 ?AUTO_1015 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1014 ?AUTO_1015 )
      ( MAKE-ON-VERIFY ?AUTO_1014 ?AUTO_1015 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1016 - BLOCK
      ?AUTO_1017 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1017 ) ( not ( = ?AUTO_1016 ?AUTO_1017 ) ) ( ON-TABLE ?AUTO_1016 ) ( CLEAR ?AUTO_1016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1016 )
      ( MAKE-ON ?AUTO_1016 ?AUTO_1017 )
      ( MAKE-ON-VERIFY ?AUTO_1016 ?AUTO_1017 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1018 - BLOCK
      ?AUTO_1019 - BLOCK
    )
    :vars
    (
      ?AUTO_1020 - BLOCK
      ?AUTO_1021 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1019 ) ( not ( = ?AUTO_1018 ?AUTO_1019 ) ) ( ON-TABLE ?AUTO_1018 ) ( CLEAR ?AUTO_1018 ) ( HOLDING ?AUTO_1020 ) ( CLEAR ?AUTO_1021 ) ( not ( = ?AUTO_1018 ?AUTO_1020 ) ) ( not ( = ?AUTO_1018 ?AUTO_1021 ) ) ( not ( = ?AUTO_1019 ?AUTO_1020 ) ) ( not ( = ?AUTO_1019 ?AUTO_1021 ) ) ( not ( = ?AUTO_1020 ?AUTO_1021 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1020 ?AUTO_1021 )
      ( MAKE-ON ?AUTO_1018 ?AUTO_1019 )
      ( MAKE-ON-VERIFY ?AUTO_1018 ?AUTO_1019 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1023 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1023 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1023 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1023 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1024 - BLOCK
    )
    :vars
    (
      ?AUTO_1025 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1024 ?AUTO_1025 ) ( CLEAR ?AUTO_1024 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1024 ?AUTO_1025 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1024 ?AUTO_1025 )
      ( MAKE-ON-TABLE ?AUTO_1024 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1024 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1028 - BLOCK
      ?AUTO_1029 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1028 ) ( CLEAR ?AUTO_1029 ) ( not ( = ?AUTO_1028 ?AUTO_1029 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1028 ?AUTO_1029 )
      ( MAKE-ON-VERIFY ?AUTO_1028 ?AUTO_1029 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1030 - BLOCK
      ?AUTO_1031 - BLOCK
    )
    :vars
    (
      ?AUTO_1032 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1031 ) ( not ( = ?AUTO_1030 ?AUTO_1031 ) ) ( ON ?AUTO_1030 ?AUTO_1032 ) ( CLEAR ?AUTO_1030 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1030 ?AUTO_1032 ) ) ( not ( = ?AUTO_1031 ?AUTO_1032 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1030 ?AUTO_1032 )
      ( MAKE-ON ?AUTO_1030 ?AUTO_1031 )
      ( MAKE-ON-VERIFY ?AUTO_1030 ?AUTO_1031 ) )
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
    ( and ( not ( = ?AUTO_1033 ?AUTO_1034 ) ) ( ON ?AUTO_1033 ?AUTO_1035 ) ( CLEAR ?AUTO_1033 ) ( not ( = ?AUTO_1033 ?AUTO_1035 ) ) ( not ( = ?AUTO_1034 ?AUTO_1035 ) ) ( HOLDING ?AUTO_1034 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1034 )
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
    )
    :precondition
    ( and ( not ( = ?AUTO_1036 ?AUTO_1037 ) ) ( ON ?AUTO_1036 ?AUTO_1038 ) ( not ( = ?AUTO_1036 ?AUTO_1038 ) ) ( not ( = ?AUTO_1037 ?AUTO_1038 ) ) ( ON ?AUTO_1037 ?AUTO_1036 ) ( CLEAR ?AUTO_1037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1037 ?AUTO_1036 )
      ( MAKE-ON ?AUTO_1036 ?AUTO_1037 )
      ( MAKE-ON-VERIFY ?AUTO_1036 ?AUTO_1037 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1041 - BLOCK
      ?AUTO_1042 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1041 ) ( CLEAR ?AUTO_1042 ) ( not ( = ?AUTO_1041 ?AUTO_1042 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1041 ?AUTO_1042 )
      ( MAKE-ON-VERIFY ?AUTO_1041 ?AUTO_1042 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1043 - BLOCK
      ?AUTO_1044 - BLOCK
    )
    :vars
    (
      ?AUTO_1045 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1044 ) ( not ( = ?AUTO_1043 ?AUTO_1044 ) ) ( ON ?AUTO_1043 ?AUTO_1045 ) ( CLEAR ?AUTO_1043 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1043 ?AUTO_1045 ) ) ( not ( = ?AUTO_1044 ?AUTO_1045 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1043 ?AUTO_1045 )
      ( MAKE-ON ?AUTO_1043 ?AUTO_1044 )
      ( MAKE-ON-VERIFY ?AUTO_1043 ?AUTO_1044 ) )
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
    ( and ( not ( = ?AUTO_1046 ?AUTO_1047 ) ) ( ON ?AUTO_1046 ?AUTO_1048 ) ( CLEAR ?AUTO_1046 ) ( not ( = ?AUTO_1046 ?AUTO_1048 ) ) ( not ( = ?AUTO_1047 ?AUTO_1048 ) ) ( HOLDING ?AUTO_1047 ) ( CLEAR ?AUTO_1049 ) ( not ( = ?AUTO_1046 ?AUTO_1049 ) ) ( not ( = ?AUTO_1047 ?AUTO_1049 ) ) ( not ( = ?AUTO_1048 ?AUTO_1049 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1047 ?AUTO_1049 )
      ( MAKE-ON ?AUTO_1046 ?AUTO_1047 )
      ( MAKE-ON-VERIFY ?AUTO_1046 ?AUTO_1047 ) )
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
      ?AUTO_1055 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1053 ) ( not ( = ?AUTO_1052 ?AUTO_1053 ) ) ( ON ?AUTO_1052 ?AUTO_1054 ) ( CLEAR ?AUTO_1052 ) ( not ( = ?AUTO_1052 ?AUTO_1054 ) ) ( not ( = ?AUTO_1053 ?AUTO_1054 ) ) ( HOLDING ?AUTO_1055 ) ( not ( = ?AUTO_1052 ?AUTO_1055 ) ) ( not ( = ?AUTO_1053 ?AUTO_1055 ) ) ( not ( = ?AUTO_1054 ?AUTO_1055 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1055 )
      ( MAKE-ON ?AUTO_1052 ?AUTO_1053 )
      ( MAKE-ON-VERIFY ?AUTO_1052 ?AUTO_1053 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1056 - BLOCK
      ?AUTO_1057 - BLOCK
    )
    :vars
    (
      ?AUTO_1058 - BLOCK
      ?AUTO_1059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1056 ?AUTO_1057 ) ) ( ON ?AUTO_1056 ?AUTO_1058 ) ( CLEAR ?AUTO_1056 ) ( not ( = ?AUTO_1056 ?AUTO_1058 ) ) ( not ( = ?AUTO_1057 ?AUTO_1058 ) ) ( not ( = ?AUTO_1056 ?AUTO_1059 ) ) ( not ( = ?AUTO_1057 ?AUTO_1059 ) ) ( not ( = ?AUTO_1058 ?AUTO_1059 ) ) ( ON ?AUTO_1059 ?AUTO_1057 ) ( CLEAR ?AUTO_1059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1059 ?AUTO_1057 )
      ( MAKE-ON ?AUTO_1056 ?AUTO_1057 )
      ( MAKE-ON-VERIFY ?AUTO_1056 ?AUTO_1057 ) )
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
    :precondition
    ( and ( CLEAR ?AUTO_1065 ) ( not ( = ?AUTO_1064 ?AUTO_1065 ) ) ( ON-TABLE ?AUTO_1064 ) ( CLEAR ?AUTO_1064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1064 )
      ( MAKE-ON ?AUTO_1064 ?AUTO_1065 )
      ( MAKE-ON-VERIFY ?AUTO_1064 ?AUTO_1065 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1066 - BLOCK
      ?AUTO_1067 - BLOCK
    )
    :vars
    (
      ?AUTO_1068 - BLOCK
      ?AUTO_1069 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1067 ) ( not ( = ?AUTO_1066 ?AUTO_1067 ) ) ( ON-TABLE ?AUTO_1066 ) ( CLEAR ?AUTO_1066 ) ( HOLDING ?AUTO_1068 ) ( CLEAR ?AUTO_1069 ) ( not ( = ?AUTO_1066 ?AUTO_1068 ) ) ( not ( = ?AUTO_1066 ?AUTO_1069 ) ) ( not ( = ?AUTO_1067 ?AUTO_1068 ) ) ( not ( = ?AUTO_1067 ?AUTO_1069 ) ) ( not ( = ?AUTO_1068 ?AUTO_1069 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1068 ?AUTO_1069 )
      ( MAKE-ON ?AUTO_1066 ?AUTO_1067 )
      ( MAKE-ON-VERIFY ?AUTO_1066 ?AUTO_1067 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1070 - BLOCK
      ?AUTO_1071 - BLOCK
    )
    :vars
    (
      ?AUTO_1072 - BLOCK
      ?AUTO_1073 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1071 ) ( not ( = ?AUTO_1070 ?AUTO_1071 ) ) ( ON-TABLE ?AUTO_1070 ) ( CLEAR ?AUTO_1072 ) ( not ( = ?AUTO_1070 ?AUTO_1073 ) ) ( not ( = ?AUTO_1070 ?AUTO_1072 ) ) ( not ( = ?AUTO_1071 ?AUTO_1073 ) ) ( not ( = ?AUTO_1071 ?AUTO_1072 ) ) ( not ( = ?AUTO_1073 ?AUTO_1072 ) ) ( ON ?AUTO_1073 ?AUTO_1070 ) ( CLEAR ?AUTO_1073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1073 ?AUTO_1070 )
      ( MAKE-ON ?AUTO_1070 ?AUTO_1071 )
      ( MAKE-ON-VERIFY ?AUTO_1070 ?AUTO_1071 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1074 - BLOCK
      ?AUTO_1075 - BLOCK
    )
    :vars
    (
      ?AUTO_1076 - BLOCK
      ?AUTO_1077 - BLOCK
      ?AUTO_1078 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1075 ) ( not ( = ?AUTO_1074 ?AUTO_1075 ) ) ( ON-TABLE ?AUTO_1074 ) ( not ( = ?AUTO_1074 ?AUTO_1076 ) ) ( not ( = ?AUTO_1074 ?AUTO_1077 ) ) ( not ( = ?AUTO_1075 ?AUTO_1076 ) ) ( not ( = ?AUTO_1075 ?AUTO_1077 ) ) ( not ( = ?AUTO_1076 ?AUTO_1077 ) ) ( ON ?AUTO_1076 ?AUTO_1074 ) ( CLEAR ?AUTO_1076 ) ( HOLDING ?AUTO_1077 ) ( CLEAR ?AUTO_1078 ) ( not ( = ?AUTO_1074 ?AUTO_1078 ) ) ( not ( = ?AUTO_1075 ?AUTO_1078 ) ) ( not ( = ?AUTO_1076 ?AUTO_1078 ) ) ( not ( = ?AUTO_1077 ?AUTO_1078 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1077 ?AUTO_1078 )
      ( MAKE-ON ?AUTO_1074 ?AUTO_1075 )
      ( MAKE-ON-VERIFY ?AUTO_1074 ?AUTO_1075 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1079 - BLOCK
      ?AUTO_1080 - BLOCK
    )
    :vars
    (
      ?AUTO_1082 - BLOCK
      ?AUTO_1083 - BLOCK
      ?AUTO_1081 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1079 ?AUTO_1080 ) ) ( ON-TABLE ?AUTO_1079 ) ( not ( = ?AUTO_1079 ?AUTO_1082 ) ) ( not ( = ?AUTO_1079 ?AUTO_1083 ) ) ( not ( = ?AUTO_1080 ?AUTO_1082 ) ) ( not ( = ?AUTO_1080 ?AUTO_1083 ) ) ( not ( = ?AUTO_1082 ?AUTO_1083 ) ) ( ON ?AUTO_1082 ?AUTO_1079 ) ( CLEAR ?AUTO_1082 ) ( CLEAR ?AUTO_1081 ) ( not ( = ?AUTO_1079 ?AUTO_1081 ) ) ( not ( = ?AUTO_1080 ?AUTO_1081 ) ) ( not ( = ?AUTO_1082 ?AUTO_1081 ) ) ( not ( = ?AUTO_1083 ?AUTO_1081 ) ) ( ON ?AUTO_1083 ?AUTO_1080 ) ( CLEAR ?AUTO_1083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1083 ?AUTO_1080 )
      ( MAKE-ON ?AUTO_1079 ?AUTO_1080 )
      ( MAKE-ON-VERIFY ?AUTO_1079 ?AUTO_1080 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1084 - BLOCK
      ?AUTO_1085 - BLOCK
    )
    :vars
    (
      ?AUTO_1086 - BLOCK
      ?AUTO_1088 - BLOCK
      ?AUTO_1087 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1084 ?AUTO_1085 ) ) ( ON-TABLE ?AUTO_1084 ) ( not ( = ?AUTO_1084 ?AUTO_1086 ) ) ( not ( = ?AUTO_1084 ?AUTO_1088 ) ) ( not ( = ?AUTO_1085 ?AUTO_1086 ) ) ( not ( = ?AUTO_1085 ?AUTO_1088 ) ) ( not ( = ?AUTO_1086 ?AUTO_1088 ) ) ( ON ?AUTO_1086 ?AUTO_1084 ) ( CLEAR ?AUTO_1086 ) ( not ( = ?AUTO_1084 ?AUTO_1087 ) ) ( not ( = ?AUTO_1085 ?AUTO_1087 ) ) ( not ( = ?AUTO_1086 ?AUTO_1087 ) ) ( not ( = ?AUTO_1088 ?AUTO_1087 ) ) ( ON ?AUTO_1088 ?AUTO_1085 ) ( CLEAR ?AUTO_1088 ) ( HOLDING ?AUTO_1087 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1087 )
      ( MAKE-ON ?AUTO_1084 ?AUTO_1085 )
      ( MAKE-ON-VERIFY ?AUTO_1084 ?AUTO_1085 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1089 - BLOCK
      ?AUTO_1090 - BLOCK
    )
    :vars
    (
      ?AUTO_1091 - BLOCK
      ?AUTO_1093 - BLOCK
      ?AUTO_1092 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1089 ?AUTO_1090 ) ) ( ON-TABLE ?AUTO_1089 ) ( not ( = ?AUTO_1089 ?AUTO_1091 ) ) ( not ( = ?AUTO_1089 ?AUTO_1093 ) ) ( not ( = ?AUTO_1090 ?AUTO_1091 ) ) ( not ( = ?AUTO_1090 ?AUTO_1093 ) ) ( not ( = ?AUTO_1091 ?AUTO_1093 ) ) ( ON ?AUTO_1091 ?AUTO_1089 ) ( CLEAR ?AUTO_1091 ) ( not ( = ?AUTO_1089 ?AUTO_1092 ) ) ( not ( = ?AUTO_1090 ?AUTO_1092 ) ) ( not ( = ?AUTO_1091 ?AUTO_1092 ) ) ( not ( = ?AUTO_1093 ?AUTO_1092 ) ) ( ON ?AUTO_1093 ?AUTO_1090 ) ( ON ?AUTO_1092 ?AUTO_1093 ) ( CLEAR ?AUTO_1092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1092 ?AUTO_1093 )
      ( MAKE-ON ?AUTO_1089 ?AUTO_1090 )
      ( MAKE-ON-VERIFY ?AUTO_1089 ?AUTO_1090 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1096 - BLOCK
      ?AUTO_1097 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1096 ) ( CLEAR ?AUTO_1097 ) ( not ( = ?AUTO_1096 ?AUTO_1097 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1096 ?AUTO_1097 )
      ( MAKE-ON-VERIFY ?AUTO_1096 ?AUTO_1097 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1098 - BLOCK
      ?AUTO_1099 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1099 ) ( not ( = ?AUTO_1098 ?AUTO_1099 ) ) ( ON-TABLE ?AUTO_1098 ) ( CLEAR ?AUTO_1098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1098 )
      ( MAKE-ON ?AUTO_1098 ?AUTO_1099 )
      ( MAKE-ON-VERIFY ?AUTO_1098 ?AUTO_1099 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1100 - BLOCK
      ?AUTO_1101 - BLOCK
    )
    :vars
    (
      ?AUTO_1102 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1100 ?AUTO_1101 ) ) ( ON-TABLE ?AUTO_1100 ) ( CLEAR ?AUTO_1100 ) ( HOLDING ?AUTO_1101 ) ( CLEAR ?AUTO_1102 ) ( not ( = ?AUTO_1100 ?AUTO_1102 ) ) ( not ( = ?AUTO_1101 ?AUTO_1102 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1101 ?AUTO_1102 )
      ( MAKE-ON ?AUTO_1100 ?AUTO_1101 )
      ( MAKE-ON-VERIFY ?AUTO_1100 ?AUTO_1101 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1107 - BLOCK
      ?AUTO_1108 - BLOCK
    )
    :vars
    (
      ?AUTO_1110 - BLOCK
      ?AUTO_1109 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1107 ?AUTO_1108 ) ) ( ON-TABLE ?AUTO_1107 ) ( CLEAR ?AUTO_1107 ) ( CLEAR ?AUTO_1110 ) ( not ( = ?AUTO_1107 ?AUTO_1109 ) ) ( not ( = ?AUTO_1107 ?AUTO_1110 ) ) ( not ( = ?AUTO_1108 ?AUTO_1109 ) ) ( not ( = ?AUTO_1108 ?AUTO_1110 ) ) ( not ( = ?AUTO_1109 ?AUTO_1110 ) ) ( ON ?AUTO_1109 ?AUTO_1108 ) ( CLEAR ?AUTO_1109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1109 ?AUTO_1108 )
      ( MAKE-ON ?AUTO_1107 ?AUTO_1108 )
      ( MAKE-ON-VERIFY ?AUTO_1107 ?AUTO_1108 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1111 - BLOCK
      ?AUTO_1112 - BLOCK
    )
    :vars
    (
      ?AUTO_1113 - BLOCK
      ?AUTO_1114 - BLOCK
      ?AUTO_1115 - BLOCK
      ?AUTO_1116 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1111 ?AUTO_1112 ) ) ( ON-TABLE ?AUTO_1111 ) ( CLEAR ?AUTO_1111 ) ( CLEAR ?AUTO_1113 ) ( not ( = ?AUTO_1111 ?AUTO_1114 ) ) ( not ( = ?AUTO_1111 ?AUTO_1113 ) ) ( not ( = ?AUTO_1112 ?AUTO_1114 ) ) ( not ( = ?AUTO_1112 ?AUTO_1113 ) ) ( not ( = ?AUTO_1114 ?AUTO_1113 ) ) ( ON ?AUTO_1114 ?AUTO_1112 ) ( CLEAR ?AUTO_1114 ) ( HOLDING ?AUTO_1115 ) ( CLEAR ?AUTO_1116 ) ( not ( = ?AUTO_1111 ?AUTO_1115 ) ) ( not ( = ?AUTO_1111 ?AUTO_1116 ) ) ( not ( = ?AUTO_1112 ?AUTO_1115 ) ) ( not ( = ?AUTO_1112 ?AUTO_1116 ) ) ( not ( = ?AUTO_1113 ?AUTO_1115 ) ) ( not ( = ?AUTO_1113 ?AUTO_1116 ) ) ( not ( = ?AUTO_1114 ?AUTO_1115 ) ) ( not ( = ?AUTO_1114 ?AUTO_1116 ) ) ( not ( = ?AUTO_1115 ?AUTO_1116 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1115 ?AUTO_1116 )
      ( MAKE-ON ?AUTO_1111 ?AUTO_1112 )
      ( MAKE-ON-VERIFY ?AUTO_1111 ?AUTO_1112 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1119 - BLOCK
      ?AUTO_1120 - BLOCK
    )
    :vars
    (
      ?AUTO_1122 - BLOCK
      ?AUTO_1121 - BLOCK
      ?AUTO_1123 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1119 ?AUTO_1120 ) ) ( ON-TABLE ?AUTO_1119 ) ( CLEAR ?AUTO_1119 ) ( CLEAR ?AUTO_1122 ) ( not ( = ?AUTO_1119 ?AUTO_1121 ) ) ( not ( = ?AUTO_1119 ?AUTO_1122 ) ) ( not ( = ?AUTO_1120 ?AUTO_1121 ) ) ( not ( = ?AUTO_1120 ?AUTO_1122 ) ) ( not ( = ?AUTO_1121 ?AUTO_1122 ) ) ( ON ?AUTO_1121 ?AUTO_1120 ) ( CLEAR ?AUTO_1121 ) ( HOLDING ?AUTO_1123 ) ( not ( = ?AUTO_1119 ?AUTO_1123 ) ) ( not ( = ?AUTO_1120 ?AUTO_1123 ) ) ( not ( = ?AUTO_1122 ?AUTO_1123 ) ) ( not ( = ?AUTO_1121 ?AUTO_1123 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1123 )
      ( MAKE-ON ?AUTO_1119 ?AUTO_1120 )
      ( MAKE-ON-VERIFY ?AUTO_1119 ?AUTO_1120 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1125 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1125 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1125 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1125 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1126 - BLOCK
    )
    :vars
    (
      ?AUTO_1127 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1126 ?AUTO_1127 ) ( CLEAR ?AUTO_1126 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1126 ?AUTO_1127 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1126 ?AUTO_1127 )
      ( MAKE-ON-TABLE ?AUTO_1126 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1126 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1130 - BLOCK
      ?AUTO_1131 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1130 ) ( CLEAR ?AUTO_1131 ) ( not ( = ?AUTO_1130 ?AUTO_1131 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1130 ?AUTO_1131 )
      ( MAKE-ON-VERIFY ?AUTO_1130 ?AUTO_1131 ) )
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
    ( and ( CLEAR ?AUTO_1133 ) ( not ( = ?AUTO_1132 ?AUTO_1133 ) ) ( ON ?AUTO_1132 ?AUTO_1134 ) ( CLEAR ?AUTO_1132 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1132 ?AUTO_1134 ) ) ( not ( = ?AUTO_1133 ?AUTO_1134 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1132 ?AUTO_1134 )
      ( MAKE-ON ?AUTO_1132 ?AUTO_1133 )
      ( MAKE-ON-VERIFY ?AUTO_1132 ?AUTO_1133 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1135 - BLOCK
      ?AUTO_1136 - BLOCK
    )
    :vars
    (
      ?AUTO_1137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1135 ?AUTO_1136 ) ) ( ON ?AUTO_1135 ?AUTO_1137 ) ( CLEAR ?AUTO_1135 ) ( not ( = ?AUTO_1135 ?AUTO_1137 ) ) ( not ( = ?AUTO_1136 ?AUTO_1137 ) ) ( HOLDING ?AUTO_1136 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1136 )
      ( MAKE-ON ?AUTO_1135 ?AUTO_1136 )
      ( MAKE-ON-VERIFY ?AUTO_1135 ?AUTO_1136 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1138 - BLOCK
      ?AUTO_1139 - BLOCK
    )
    :vars
    (
      ?AUTO_1140 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1138 ?AUTO_1139 ) ) ( ON ?AUTO_1138 ?AUTO_1140 ) ( not ( = ?AUTO_1138 ?AUTO_1140 ) ) ( not ( = ?AUTO_1139 ?AUTO_1140 ) ) ( ON ?AUTO_1139 ?AUTO_1138 ) ( CLEAR ?AUTO_1139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1139 ?AUTO_1138 )
      ( MAKE-ON ?AUTO_1138 ?AUTO_1139 )
      ( MAKE-ON-VERIFY ?AUTO_1138 ?AUTO_1139 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1143 - BLOCK
      ?AUTO_1144 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1143 ) ( CLEAR ?AUTO_1144 ) ( not ( = ?AUTO_1143 ?AUTO_1144 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1143 ?AUTO_1144 )
      ( MAKE-ON-VERIFY ?AUTO_1143 ?AUTO_1144 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1145 - BLOCK
      ?AUTO_1146 - BLOCK
    )
    :vars
    (
      ?AUTO_1147 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1146 ) ( not ( = ?AUTO_1145 ?AUTO_1146 ) ) ( ON ?AUTO_1145 ?AUTO_1147 ) ( CLEAR ?AUTO_1145 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1145 ?AUTO_1147 ) ) ( not ( = ?AUTO_1146 ?AUTO_1147 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1145 ?AUTO_1147 )
      ( MAKE-ON ?AUTO_1145 ?AUTO_1146 )
      ( MAKE-ON-VERIFY ?AUTO_1145 ?AUTO_1146 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1148 - BLOCK
      ?AUTO_1149 - BLOCK
    )
    :vars
    (
      ?AUTO_1150 - BLOCK
      ?AUTO_1151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1148 ?AUTO_1149 ) ) ( ON ?AUTO_1148 ?AUTO_1150 ) ( CLEAR ?AUTO_1148 ) ( not ( = ?AUTO_1148 ?AUTO_1150 ) ) ( not ( = ?AUTO_1149 ?AUTO_1150 ) ) ( HOLDING ?AUTO_1149 ) ( CLEAR ?AUTO_1151 ) ( not ( = ?AUTO_1148 ?AUTO_1151 ) ) ( not ( = ?AUTO_1149 ?AUTO_1151 ) ) ( not ( = ?AUTO_1150 ?AUTO_1151 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1149 ?AUTO_1151 )
      ( MAKE-ON ?AUTO_1148 ?AUTO_1149 )
      ( MAKE-ON-VERIFY ?AUTO_1148 ?AUTO_1149 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1154 - BLOCK
      ?AUTO_1155 - BLOCK
    )
    :vars
    (
      ?AUTO_1156 - BLOCK
      ?AUTO_1157 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1155 ) ( not ( = ?AUTO_1154 ?AUTO_1155 ) ) ( ON ?AUTO_1154 ?AUTO_1156 ) ( CLEAR ?AUTO_1154 ) ( not ( = ?AUTO_1154 ?AUTO_1156 ) ) ( not ( = ?AUTO_1155 ?AUTO_1156 ) ) ( HOLDING ?AUTO_1157 ) ( not ( = ?AUTO_1154 ?AUTO_1157 ) ) ( not ( = ?AUTO_1155 ?AUTO_1157 ) ) ( not ( = ?AUTO_1156 ?AUTO_1157 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1157 )
      ( MAKE-ON ?AUTO_1154 ?AUTO_1155 )
      ( MAKE-ON-VERIFY ?AUTO_1154 ?AUTO_1155 ) )
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
      ?AUTO_1161 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1158 ?AUTO_1159 ) ) ( ON ?AUTO_1158 ?AUTO_1160 ) ( CLEAR ?AUTO_1158 ) ( not ( = ?AUTO_1158 ?AUTO_1160 ) ) ( not ( = ?AUTO_1159 ?AUTO_1160 ) ) ( not ( = ?AUTO_1158 ?AUTO_1161 ) ) ( not ( = ?AUTO_1159 ?AUTO_1161 ) ) ( not ( = ?AUTO_1160 ?AUTO_1161 ) ) ( ON ?AUTO_1161 ?AUTO_1159 ) ( CLEAR ?AUTO_1161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1161 ?AUTO_1159 )
      ( MAKE-ON ?AUTO_1158 ?AUTO_1159 )
      ( MAKE-ON-VERIFY ?AUTO_1158 ?AUTO_1159 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1163 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1163 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1163 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1163 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1164 - BLOCK
    )
    :vars
    (
      ?AUTO_1165 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1164 ?AUTO_1165 ) ( CLEAR ?AUTO_1164 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1164 ?AUTO_1165 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1164 ?AUTO_1165 )
      ( MAKE-ON-TABLE ?AUTO_1164 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1164 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1166 - BLOCK
    )
    :vars
    (
      ?AUTO_1167 - BLOCK
      ?AUTO_1168 - BLOCK
      ?AUTO_1169 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1166 ?AUTO_1167 ) ( CLEAR ?AUTO_1166 ) ( not ( = ?AUTO_1166 ?AUTO_1167 ) ) ( HOLDING ?AUTO_1168 ) ( CLEAR ?AUTO_1169 ) ( not ( = ?AUTO_1166 ?AUTO_1168 ) ) ( not ( = ?AUTO_1166 ?AUTO_1169 ) ) ( not ( = ?AUTO_1167 ?AUTO_1168 ) ) ( not ( = ?AUTO_1167 ?AUTO_1169 ) ) ( not ( = ?AUTO_1168 ?AUTO_1169 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1168 ?AUTO_1169 )
      ( MAKE-ON-TABLE ?AUTO_1166 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1166 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1172 - BLOCK
    )
    :vars
    (
      ?AUTO_1175 - BLOCK
      ?AUTO_1173 - BLOCK
      ?AUTO_1174 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1172 ?AUTO_1175 ) ( not ( = ?AUTO_1172 ?AUTO_1175 ) ) ( CLEAR ?AUTO_1173 ) ( not ( = ?AUTO_1172 ?AUTO_1174 ) ) ( not ( = ?AUTO_1172 ?AUTO_1173 ) ) ( not ( = ?AUTO_1175 ?AUTO_1174 ) ) ( not ( = ?AUTO_1175 ?AUTO_1173 ) ) ( not ( = ?AUTO_1174 ?AUTO_1173 ) ) ( ON ?AUTO_1174 ?AUTO_1172 ) ( CLEAR ?AUTO_1174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1174 ?AUTO_1172 )
      ( MAKE-ON-TABLE ?AUTO_1172 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1172 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1176 - BLOCK
    )
    :vars
    (
      ?AUTO_1179 - BLOCK
      ?AUTO_1178 - BLOCK
      ?AUTO_1177 - BLOCK
      ?AUTO_1180 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1176 ?AUTO_1179 ) ( not ( = ?AUTO_1176 ?AUTO_1179 ) ) ( CLEAR ?AUTO_1178 ) ( not ( = ?AUTO_1176 ?AUTO_1177 ) ) ( not ( = ?AUTO_1176 ?AUTO_1178 ) ) ( not ( = ?AUTO_1179 ?AUTO_1177 ) ) ( not ( = ?AUTO_1179 ?AUTO_1178 ) ) ( not ( = ?AUTO_1177 ?AUTO_1178 ) ) ( ON ?AUTO_1177 ?AUTO_1176 ) ( CLEAR ?AUTO_1177 ) ( HOLDING ?AUTO_1180 ) ( not ( = ?AUTO_1176 ?AUTO_1180 ) ) ( not ( = ?AUTO_1179 ?AUTO_1180 ) ) ( not ( = ?AUTO_1178 ?AUTO_1180 ) ) ( not ( = ?AUTO_1177 ?AUTO_1180 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1180 )
      ( MAKE-ON-TABLE ?AUTO_1176 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1176 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1181 - BLOCK
    )
    :vars
    (
      ?AUTO_1185 - BLOCK
      ?AUTO_1182 - BLOCK
      ?AUTO_1184 - BLOCK
      ?AUTO_1183 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1181 ?AUTO_1185 ) ( not ( = ?AUTO_1181 ?AUTO_1185 ) ) ( CLEAR ?AUTO_1182 ) ( not ( = ?AUTO_1181 ?AUTO_1184 ) ) ( not ( = ?AUTO_1181 ?AUTO_1182 ) ) ( not ( = ?AUTO_1185 ?AUTO_1184 ) ) ( not ( = ?AUTO_1185 ?AUTO_1182 ) ) ( not ( = ?AUTO_1184 ?AUTO_1182 ) ) ( ON ?AUTO_1184 ?AUTO_1181 ) ( not ( = ?AUTO_1181 ?AUTO_1183 ) ) ( not ( = ?AUTO_1185 ?AUTO_1183 ) ) ( not ( = ?AUTO_1182 ?AUTO_1183 ) ) ( not ( = ?AUTO_1184 ?AUTO_1183 ) ) ( ON ?AUTO_1183 ?AUTO_1184 ) ( CLEAR ?AUTO_1183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1183 ?AUTO_1184 )
      ( MAKE-ON-TABLE ?AUTO_1181 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1181 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1188 - BLOCK
      ?AUTO_1189 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1188 ) ( CLEAR ?AUTO_1189 ) ( not ( = ?AUTO_1188 ?AUTO_1189 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1188 ?AUTO_1189 )
      ( MAKE-ON-VERIFY ?AUTO_1188 ?AUTO_1189 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1190 - BLOCK
      ?AUTO_1191 - BLOCK
    )
    :vars
    (
      ?AUTO_1192 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1191 ) ( not ( = ?AUTO_1190 ?AUTO_1191 ) ) ( ON ?AUTO_1190 ?AUTO_1192 ) ( CLEAR ?AUTO_1190 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1190 ?AUTO_1192 ) ) ( not ( = ?AUTO_1191 ?AUTO_1192 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1190 ?AUTO_1192 )
      ( MAKE-ON ?AUTO_1190 ?AUTO_1191 )
      ( MAKE-ON-VERIFY ?AUTO_1190 ?AUTO_1191 ) )
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
    ( and ( CLEAR ?AUTO_1194 ) ( not ( = ?AUTO_1193 ?AUTO_1194 ) ) ( ON ?AUTO_1193 ?AUTO_1195 ) ( CLEAR ?AUTO_1193 ) ( not ( = ?AUTO_1193 ?AUTO_1195 ) ) ( not ( = ?AUTO_1194 ?AUTO_1195 ) ) ( HOLDING ?AUTO_1196 ) ( not ( = ?AUTO_1193 ?AUTO_1196 ) ) ( not ( = ?AUTO_1194 ?AUTO_1196 ) ) ( not ( = ?AUTO_1195 ?AUTO_1196 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1196 )
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
    ( and ( CLEAR ?AUTO_1198 ) ( not ( = ?AUTO_1197 ?AUTO_1198 ) ) ( ON ?AUTO_1197 ?AUTO_1199 ) ( not ( = ?AUTO_1197 ?AUTO_1199 ) ) ( not ( = ?AUTO_1198 ?AUTO_1199 ) ) ( not ( = ?AUTO_1197 ?AUTO_1200 ) ) ( not ( = ?AUTO_1198 ?AUTO_1200 ) ) ( not ( = ?AUTO_1199 ?AUTO_1200 ) ) ( ON ?AUTO_1200 ?AUTO_1197 ) ( CLEAR ?AUTO_1200 ) ( HAND-EMPTY ) )
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
      ?AUTO_1203 - BLOCK
      ?AUTO_1204 - BLOCK
      ?AUTO_1205 - BLOCK
      ?AUTO_1206 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1202 ) ( not ( = ?AUTO_1201 ?AUTO_1202 ) ) ( ON ?AUTO_1201 ?AUTO_1203 ) ( not ( = ?AUTO_1201 ?AUTO_1203 ) ) ( not ( = ?AUTO_1202 ?AUTO_1203 ) ) ( not ( = ?AUTO_1201 ?AUTO_1204 ) ) ( not ( = ?AUTO_1202 ?AUTO_1204 ) ) ( not ( = ?AUTO_1203 ?AUTO_1204 ) ) ( ON ?AUTO_1204 ?AUTO_1201 ) ( CLEAR ?AUTO_1204 ) ( HOLDING ?AUTO_1205 ) ( CLEAR ?AUTO_1206 ) ( not ( = ?AUTO_1201 ?AUTO_1205 ) ) ( not ( = ?AUTO_1201 ?AUTO_1206 ) ) ( not ( = ?AUTO_1202 ?AUTO_1205 ) ) ( not ( = ?AUTO_1202 ?AUTO_1206 ) ) ( not ( = ?AUTO_1203 ?AUTO_1205 ) ) ( not ( = ?AUTO_1203 ?AUTO_1206 ) ) ( not ( = ?AUTO_1204 ?AUTO_1205 ) ) ( not ( = ?AUTO_1204 ?AUTO_1206 ) ) ( not ( = ?AUTO_1205 ?AUTO_1206 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1205 ?AUTO_1206 )
      ( MAKE-ON ?AUTO_1201 ?AUTO_1202 )
      ( MAKE-ON-VERIFY ?AUTO_1201 ?AUTO_1202 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1207 - BLOCK
      ?AUTO_1208 - BLOCK
    )
    :vars
    (
      ?AUTO_1209 - BLOCK
      ?AUTO_1210 - BLOCK
      ?AUTO_1212 - BLOCK
      ?AUTO_1211 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1207 ?AUTO_1208 ) ) ( ON ?AUTO_1207 ?AUTO_1209 ) ( not ( = ?AUTO_1207 ?AUTO_1209 ) ) ( not ( = ?AUTO_1208 ?AUTO_1209 ) ) ( not ( = ?AUTO_1207 ?AUTO_1210 ) ) ( not ( = ?AUTO_1208 ?AUTO_1210 ) ) ( not ( = ?AUTO_1209 ?AUTO_1210 ) ) ( ON ?AUTO_1210 ?AUTO_1207 ) ( CLEAR ?AUTO_1210 ) ( CLEAR ?AUTO_1212 ) ( not ( = ?AUTO_1207 ?AUTO_1211 ) ) ( not ( = ?AUTO_1207 ?AUTO_1212 ) ) ( not ( = ?AUTO_1208 ?AUTO_1211 ) ) ( not ( = ?AUTO_1208 ?AUTO_1212 ) ) ( not ( = ?AUTO_1209 ?AUTO_1211 ) ) ( not ( = ?AUTO_1209 ?AUTO_1212 ) ) ( not ( = ?AUTO_1210 ?AUTO_1211 ) ) ( not ( = ?AUTO_1210 ?AUTO_1212 ) ) ( not ( = ?AUTO_1211 ?AUTO_1212 ) ) ( ON ?AUTO_1211 ?AUTO_1208 ) ( CLEAR ?AUTO_1211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1211 ?AUTO_1208 )
      ( MAKE-ON ?AUTO_1207 ?AUTO_1208 )
      ( MAKE-ON-VERIFY ?AUTO_1207 ?AUTO_1208 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1213 - BLOCK
      ?AUTO_1214 - BLOCK
    )
    :vars
    (
      ?AUTO_1215 - BLOCK
      ?AUTO_1218 - BLOCK
      ?AUTO_1217 - BLOCK
      ?AUTO_1216 - BLOCK
      ?AUTO_1219 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1213 ?AUTO_1214 ) ) ( ON ?AUTO_1213 ?AUTO_1215 ) ( not ( = ?AUTO_1213 ?AUTO_1215 ) ) ( not ( = ?AUTO_1214 ?AUTO_1215 ) ) ( not ( = ?AUTO_1213 ?AUTO_1218 ) ) ( not ( = ?AUTO_1214 ?AUTO_1218 ) ) ( not ( = ?AUTO_1215 ?AUTO_1218 ) ) ( ON ?AUTO_1218 ?AUTO_1213 ) ( CLEAR ?AUTO_1218 ) ( not ( = ?AUTO_1213 ?AUTO_1217 ) ) ( not ( = ?AUTO_1213 ?AUTO_1216 ) ) ( not ( = ?AUTO_1214 ?AUTO_1217 ) ) ( not ( = ?AUTO_1214 ?AUTO_1216 ) ) ( not ( = ?AUTO_1215 ?AUTO_1217 ) ) ( not ( = ?AUTO_1215 ?AUTO_1216 ) ) ( not ( = ?AUTO_1218 ?AUTO_1217 ) ) ( not ( = ?AUTO_1218 ?AUTO_1216 ) ) ( not ( = ?AUTO_1217 ?AUTO_1216 ) ) ( ON ?AUTO_1217 ?AUTO_1214 ) ( CLEAR ?AUTO_1217 ) ( HOLDING ?AUTO_1216 ) ( CLEAR ?AUTO_1219 ) ( not ( = ?AUTO_1213 ?AUTO_1219 ) ) ( not ( = ?AUTO_1214 ?AUTO_1219 ) ) ( not ( = ?AUTO_1215 ?AUTO_1219 ) ) ( not ( = ?AUTO_1218 ?AUTO_1219 ) ) ( not ( = ?AUTO_1217 ?AUTO_1219 ) ) ( not ( = ?AUTO_1216 ?AUTO_1219 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1216 ?AUTO_1219 )
      ( MAKE-ON ?AUTO_1213 ?AUTO_1214 )
      ( MAKE-ON-VERIFY ?AUTO_1213 ?AUTO_1214 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1220 - BLOCK
      ?AUTO_1221 - BLOCK
    )
    :vars
    (
      ?AUTO_1224 - BLOCK
      ?AUTO_1223 - BLOCK
      ?AUTO_1225 - BLOCK
      ?AUTO_1222 - BLOCK
      ?AUTO_1226 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1220 ?AUTO_1221 ) ) ( ON ?AUTO_1220 ?AUTO_1224 ) ( not ( = ?AUTO_1220 ?AUTO_1224 ) ) ( not ( = ?AUTO_1221 ?AUTO_1224 ) ) ( not ( = ?AUTO_1220 ?AUTO_1223 ) ) ( not ( = ?AUTO_1221 ?AUTO_1223 ) ) ( not ( = ?AUTO_1224 ?AUTO_1223 ) ) ( ON ?AUTO_1223 ?AUTO_1220 ) ( not ( = ?AUTO_1220 ?AUTO_1225 ) ) ( not ( = ?AUTO_1220 ?AUTO_1222 ) ) ( not ( = ?AUTO_1221 ?AUTO_1225 ) ) ( not ( = ?AUTO_1221 ?AUTO_1222 ) ) ( not ( = ?AUTO_1224 ?AUTO_1225 ) ) ( not ( = ?AUTO_1224 ?AUTO_1222 ) ) ( not ( = ?AUTO_1223 ?AUTO_1225 ) ) ( not ( = ?AUTO_1223 ?AUTO_1222 ) ) ( not ( = ?AUTO_1225 ?AUTO_1222 ) ) ( ON ?AUTO_1225 ?AUTO_1221 ) ( CLEAR ?AUTO_1225 ) ( CLEAR ?AUTO_1226 ) ( not ( = ?AUTO_1220 ?AUTO_1226 ) ) ( not ( = ?AUTO_1221 ?AUTO_1226 ) ) ( not ( = ?AUTO_1224 ?AUTO_1226 ) ) ( not ( = ?AUTO_1223 ?AUTO_1226 ) ) ( not ( = ?AUTO_1225 ?AUTO_1226 ) ) ( not ( = ?AUTO_1222 ?AUTO_1226 ) ) ( ON ?AUTO_1222 ?AUTO_1223 ) ( CLEAR ?AUTO_1222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1222 ?AUTO_1223 )
      ( MAKE-ON ?AUTO_1220 ?AUTO_1221 )
      ( MAKE-ON-VERIFY ?AUTO_1220 ?AUTO_1221 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1227 - BLOCK
      ?AUTO_1228 - BLOCK
    )
    :vars
    (
      ?AUTO_1232 - BLOCK
      ?AUTO_1229 - BLOCK
      ?AUTO_1231 - BLOCK
      ?AUTO_1230 - BLOCK
      ?AUTO_1233 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1227 ?AUTO_1228 ) ) ( ON ?AUTO_1227 ?AUTO_1232 ) ( not ( = ?AUTO_1227 ?AUTO_1232 ) ) ( not ( = ?AUTO_1228 ?AUTO_1232 ) ) ( not ( = ?AUTO_1227 ?AUTO_1229 ) ) ( not ( = ?AUTO_1228 ?AUTO_1229 ) ) ( not ( = ?AUTO_1232 ?AUTO_1229 ) ) ( ON ?AUTO_1229 ?AUTO_1227 ) ( not ( = ?AUTO_1227 ?AUTO_1231 ) ) ( not ( = ?AUTO_1227 ?AUTO_1230 ) ) ( not ( = ?AUTO_1228 ?AUTO_1231 ) ) ( not ( = ?AUTO_1228 ?AUTO_1230 ) ) ( not ( = ?AUTO_1232 ?AUTO_1231 ) ) ( not ( = ?AUTO_1232 ?AUTO_1230 ) ) ( not ( = ?AUTO_1229 ?AUTO_1231 ) ) ( not ( = ?AUTO_1229 ?AUTO_1230 ) ) ( not ( = ?AUTO_1231 ?AUTO_1230 ) ) ( ON ?AUTO_1231 ?AUTO_1228 ) ( CLEAR ?AUTO_1231 ) ( not ( = ?AUTO_1227 ?AUTO_1233 ) ) ( not ( = ?AUTO_1228 ?AUTO_1233 ) ) ( not ( = ?AUTO_1232 ?AUTO_1233 ) ) ( not ( = ?AUTO_1229 ?AUTO_1233 ) ) ( not ( = ?AUTO_1231 ?AUTO_1233 ) ) ( not ( = ?AUTO_1230 ?AUTO_1233 ) ) ( ON ?AUTO_1230 ?AUTO_1229 ) ( CLEAR ?AUTO_1230 ) ( HOLDING ?AUTO_1233 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1233 )
      ( MAKE-ON ?AUTO_1227 ?AUTO_1228 )
      ( MAKE-ON-VERIFY ?AUTO_1227 ?AUTO_1228 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1234 - BLOCK
      ?AUTO_1235 - BLOCK
    )
    :vars
    (
      ?AUTO_1238 - BLOCK
      ?AUTO_1239 - BLOCK
      ?AUTO_1240 - BLOCK
      ?AUTO_1236 - BLOCK
      ?AUTO_1237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1234 ?AUTO_1235 ) ) ( ON ?AUTO_1234 ?AUTO_1238 ) ( not ( = ?AUTO_1234 ?AUTO_1238 ) ) ( not ( = ?AUTO_1235 ?AUTO_1238 ) ) ( not ( = ?AUTO_1234 ?AUTO_1239 ) ) ( not ( = ?AUTO_1235 ?AUTO_1239 ) ) ( not ( = ?AUTO_1238 ?AUTO_1239 ) ) ( ON ?AUTO_1239 ?AUTO_1234 ) ( not ( = ?AUTO_1234 ?AUTO_1240 ) ) ( not ( = ?AUTO_1234 ?AUTO_1236 ) ) ( not ( = ?AUTO_1235 ?AUTO_1240 ) ) ( not ( = ?AUTO_1235 ?AUTO_1236 ) ) ( not ( = ?AUTO_1238 ?AUTO_1240 ) ) ( not ( = ?AUTO_1238 ?AUTO_1236 ) ) ( not ( = ?AUTO_1239 ?AUTO_1240 ) ) ( not ( = ?AUTO_1239 ?AUTO_1236 ) ) ( not ( = ?AUTO_1240 ?AUTO_1236 ) ) ( ON ?AUTO_1240 ?AUTO_1235 ) ( CLEAR ?AUTO_1240 ) ( not ( = ?AUTO_1234 ?AUTO_1237 ) ) ( not ( = ?AUTO_1235 ?AUTO_1237 ) ) ( not ( = ?AUTO_1238 ?AUTO_1237 ) ) ( not ( = ?AUTO_1239 ?AUTO_1237 ) ) ( not ( = ?AUTO_1240 ?AUTO_1237 ) ) ( not ( = ?AUTO_1236 ?AUTO_1237 ) ) ( ON ?AUTO_1236 ?AUTO_1239 ) ( ON ?AUTO_1237 ?AUTO_1236 ) ( CLEAR ?AUTO_1237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1237 ?AUTO_1236 )
      ( MAKE-ON ?AUTO_1234 ?AUTO_1235 )
      ( MAKE-ON-VERIFY ?AUTO_1234 ?AUTO_1235 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1243 - BLOCK
      ?AUTO_1244 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1243 ) ( CLEAR ?AUTO_1244 ) ( not ( = ?AUTO_1243 ?AUTO_1244 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1243 ?AUTO_1244 )
      ( MAKE-ON-VERIFY ?AUTO_1243 ?AUTO_1244 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1245 - BLOCK
      ?AUTO_1246 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1246 ) ( not ( = ?AUTO_1245 ?AUTO_1246 ) ) ( ON-TABLE ?AUTO_1245 ) ( CLEAR ?AUTO_1245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1245 )
      ( MAKE-ON ?AUTO_1245 ?AUTO_1246 )
      ( MAKE-ON-VERIFY ?AUTO_1245 ?AUTO_1246 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1247 - BLOCK
      ?AUTO_1248 - BLOCK
    )
    :vars
    (
      ?AUTO_1249 - BLOCK
      ?AUTO_1250 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1248 ) ( not ( = ?AUTO_1247 ?AUTO_1248 ) ) ( ON-TABLE ?AUTO_1247 ) ( CLEAR ?AUTO_1247 ) ( HOLDING ?AUTO_1249 ) ( CLEAR ?AUTO_1250 ) ( not ( = ?AUTO_1247 ?AUTO_1249 ) ) ( not ( = ?AUTO_1247 ?AUTO_1250 ) ) ( not ( = ?AUTO_1248 ?AUTO_1249 ) ) ( not ( = ?AUTO_1248 ?AUTO_1250 ) ) ( not ( = ?AUTO_1249 ?AUTO_1250 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1249 ?AUTO_1250 )
      ( MAKE-ON ?AUTO_1247 ?AUTO_1248 )
      ( MAKE-ON-VERIFY ?AUTO_1247 ?AUTO_1248 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1251 - BLOCK
      ?AUTO_1252 - BLOCK
    )
    :vars
    (
      ?AUTO_1253 - BLOCK
      ?AUTO_1254 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1252 ) ( not ( = ?AUTO_1251 ?AUTO_1252 ) ) ( ON-TABLE ?AUTO_1251 ) ( CLEAR ?AUTO_1253 ) ( not ( = ?AUTO_1251 ?AUTO_1254 ) ) ( not ( = ?AUTO_1251 ?AUTO_1253 ) ) ( not ( = ?AUTO_1252 ?AUTO_1254 ) ) ( not ( = ?AUTO_1252 ?AUTO_1253 ) ) ( not ( = ?AUTO_1254 ?AUTO_1253 ) ) ( ON ?AUTO_1254 ?AUTO_1251 ) ( CLEAR ?AUTO_1254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1254 ?AUTO_1251 )
      ( MAKE-ON ?AUTO_1251 ?AUTO_1252 )
      ( MAKE-ON-VERIFY ?AUTO_1251 ?AUTO_1252 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1255 - BLOCK
      ?AUTO_1256 - BLOCK
    )
    :vars
    (
      ?AUTO_1258 - BLOCK
      ?AUTO_1257 - BLOCK
      ?AUTO_1259 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1256 ) ( not ( = ?AUTO_1255 ?AUTO_1256 ) ) ( ON-TABLE ?AUTO_1255 ) ( CLEAR ?AUTO_1258 ) ( not ( = ?AUTO_1255 ?AUTO_1257 ) ) ( not ( = ?AUTO_1255 ?AUTO_1258 ) ) ( not ( = ?AUTO_1256 ?AUTO_1257 ) ) ( not ( = ?AUTO_1256 ?AUTO_1258 ) ) ( not ( = ?AUTO_1257 ?AUTO_1258 ) ) ( ON ?AUTO_1257 ?AUTO_1255 ) ( CLEAR ?AUTO_1257 ) ( HOLDING ?AUTO_1259 ) ( not ( = ?AUTO_1255 ?AUTO_1259 ) ) ( not ( = ?AUTO_1256 ?AUTO_1259 ) ) ( not ( = ?AUTO_1258 ?AUTO_1259 ) ) ( not ( = ?AUTO_1257 ?AUTO_1259 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1259 )
      ( MAKE-ON ?AUTO_1255 ?AUTO_1256 )
      ( MAKE-ON-VERIFY ?AUTO_1255 ?AUTO_1256 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1260 - BLOCK
      ?AUTO_1261 - BLOCK
    )
    :vars
    (
      ?AUTO_1264 - BLOCK
      ?AUTO_1263 - BLOCK
      ?AUTO_1262 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1261 ) ( not ( = ?AUTO_1260 ?AUTO_1261 ) ) ( ON-TABLE ?AUTO_1260 ) ( CLEAR ?AUTO_1264 ) ( not ( = ?AUTO_1260 ?AUTO_1263 ) ) ( not ( = ?AUTO_1260 ?AUTO_1264 ) ) ( not ( = ?AUTO_1261 ?AUTO_1263 ) ) ( not ( = ?AUTO_1261 ?AUTO_1264 ) ) ( not ( = ?AUTO_1263 ?AUTO_1264 ) ) ( ON ?AUTO_1263 ?AUTO_1260 ) ( not ( = ?AUTO_1260 ?AUTO_1262 ) ) ( not ( = ?AUTO_1261 ?AUTO_1262 ) ) ( not ( = ?AUTO_1264 ?AUTO_1262 ) ) ( not ( = ?AUTO_1263 ?AUTO_1262 ) ) ( ON ?AUTO_1262 ?AUTO_1263 ) ( CLEAR ?AUTO_1262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1262 ?AUTO_1263 )
      ( MAKE-ON ?AUTO_1260 ?AUTO_1261 )
      ( MAKE-ON-VERIFY ?AUTO_1260 ?AUTO_1261 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1265 - BLOCK
      ?AUTO_1266 - BLOCK
    )
    :vars
    (
      ?AUTO_1269 - BLOCK
      ?AUTO_1267 - BLOCK
      ?AUTO_1268 - BLOCK
      ?AUTO_1270 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1265 ?AUTO_1266 ) ) ( ON-TABLE ?AUTO_1265 ) ( CLEAR ?AUTO_1269 ) ( not ( = ?AUTO_1265 ?AUTO_1267 ) ) ( not ( = ?AUTO_1265 ?AUTO_1269 ) ) ( not ( = ?AUTO_1266 ?AUTO_1267 ) ) ( not ( = ?AUTO_1266 ?AUTO_1269 ) ) ( not ( = ?AUTO_1267 ?AUTO_1269 ) ) ( ON ?AUTO_1267 ?AUTO_1265 ) ( not ( = ?AUTO_1265 ?AUTO_1268 ) ) ( not ( = ?AUTO_1266 ?AUTO_1268 ) ) ( not ( = ?AUTO_1269 ?AUTO_1268 ) ) ( not ( = ?AUTO_1267 ?AUTO_1268 ) ) ( ON ?AUTO_1268 ?AUTO_1267 ) ( CLEAR ?AUTO_1268 ) ( HOLDING ?AUTO_1266 ) ( CLEAR ?AUTO_1270 ) ( not ( = ?AUTO_1265 ?AUTO_1270 ) ) ( not ( = ?AUTO_1266 ?AUTO_1270 ) ) ( not ( = ?AUTO_1269 ?AUTO_1270 ) ) ( not ( = ?AUTO_1267 ?AUTO_1270 ) ) ( not ( = ?AUTO_1268 ?AUTO_1270 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1266 ?AUTO_1270 )
      ( MAKE-ON ?AUTO_1265 ?AUTO_1266 )
      ( MAKE-ON-VERIFY ?AUTO_1265 ?AUTO_1266 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1273 - BLOCK
      ?AUTO_1274 - BLOCK
    )
    :vars
    (
      ?AUTO_1276 - BLOCK
      ?AUTO_1275 - BLOCK
      ?AUTO_1277 - BLOCK
      ?AUTO_1278 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1274 ) ( not ( = ?AUTO_1273 ?AUTO_1274 ) ) ( ON-TABLE ?AUTO_1273 ) ( not ( = ?AUTO_1273 ?AUTO_1276 ) ) ( not ( = ?AUTO_1273 ?AUTO_1275 ) ) ( not ( = ?AUTO_1274 ?AUTO_1276 ) ) ( not ( = ?AUTO_1274 ?AUTO_1275 ) ) ( not ( = ?AUTO_1276 ?AUTO_1275 ) ) ( ON ?AUTO_1276 ?AUTO_1273 ) ( not ( = ?AUTO_1273 ?AUTO_1277 ) ) ( not ( = ?AUTO_1274 ?AUTO_1277 ) ) ( not ( = ?AUTO_1275 ?AUTO_1277 ) ) ( not ( = ?AUTO_1276 ?AUTO_1277 ) ) ( ON ?AUTO_1277 ?AUTO_1276 ) ( CLEAR ?AUTO_1277 ) ( HOLDING ?AUTO_1275 ) ( CLEAR ?AUTO_1278 ) ( not ( = ?AUTO_1273 ?AUTO_1278 ) ) ( not ( = ?AUTO_1274 ?AUTO_1278 ) ) ( not ( = ?AUTO_1276 ?AUTO_1278 ) ) ( not ( = ?AUTO_1275 ?AUTO_1278 ) ) ( not ( = ?AUTO_1277 ?AUTO_1278 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1275 ?AUTO_1278 )
      ( MAKE-ON ?AUTO_1273 ?AUTO_1274 )
      ( MAKE-ON-VERIFY ?AUTO_1273 ?AUTO_1274 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1279 - BLOCK
      ?AUTO_1280 - BLOCK
    )
    :vars
    (
      ?AUTO_1282 - BLOCK
      ?AUTO_1284 - BLOCK
      ?AUTO_1283 - BLOCK
      ?AUTO_1281 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1280 ) ( not ( = ?AUTO_1279 ?AUTO_1280 ) ) ( ON-TABLE ?AUTO_1279 ) ( not ( = ?AUTO_1279 ?AUTO_1282 ) ) ( not ( = ?AUTO_1279 ?AUTO_1284 ) ) ( not ( = ?AUTO_1280 ?AUTO_1282 ) ) ( not ( = ?AUTO_1280 ?AUTO_1284 ) ) ( not ( = ?AUTO_1282 ?AUTO_1284 ) ) ( ON ?AUTO_1282 ?AUTO_1279 ) ( not ( = ?AUTO_1279 ?AUTO_1283 ) ) ( not ( = ?AUTO_1280 ?AUTO_1283 ) ) ( not ( = ?AUTO_1284 ?AUTO_1283 ) ) ( not ( = ?AUTO_1282 ?AUTO_1283 ) ) ( ON ?AUTO_1283 ?AUTO_1282 ) ( CLEAR ?AUTO_1281 ) ( not ( = ?AUTO_1279 ?AUTO_1281 ) ) ( not ( = ?AUTO_1280 ?AUTO_1281 ) ) ( not ( = ?AUTO_1282 ?AUTO_1281 ) ) ( not ( = ?AUTO_1284 ?AUTO_1281 ) ) ( not ( = ?AUTO_1283 ?AUTO_1281 ) ) ( ON ?AUTO_1284 ?AUTO_1283 ) ( CLEAR ?AUTO_1284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1284 ?AUTO_1283 )
      ( MAKE-ON ?AUTO_1279 ?AUTO_1280 )
      ( MAKE-ON-VERIFY ?AUTO_1279 ?AUTO_1280 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1285 - BLOCK
      ?AUTO_1286 - BLOCK
    )
    :vars
    (
      ?AUTO_1289 - BLOCK
      ?AUTO_1287 - BLOCK
      ?AUTO_1288 - BLOCK
      ?AUTO_1290 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1286 ) ( not ( = ?AUTO_1285 ?AUTO_1286 ) ) ( ON-TABLE ?AUTO_1285 ) ( not ( = ?AUTO_1285 ?AUTO_1289 ) ) ( not ( = ?AUTO_1285 ?AUTO_1287 ) ) ( not ( = ?AUTO_1286 ?AUTO_1289 ) ) ( not ( = ?AUTO_1286 ?AUTO_1287 ) ) ( not ( = ?AUTO_1289 ?AUTO_1287 ) ) ( ON ?AUTO_1289 ?AUTO_1285 ) ( not ( = ?AUTO_1285 ?AUTO_1288 ) ) ( not ( = ?AUTO_1286 ?AUTO_1288 ) ) ( not ( = ?AUTO_1287 ?AUTO_1288 ) ) ( not ( = ?AUTO_1289 ?AUTO_1288 ) ) ( ON ?AUTO_1288 ?AUTO_1289 ) ( not ( = ?AUTO_1285 ?AUTO_1290 ) ) ( not ( = ?AUTO_1286 ?AUTO_1290 ) ) ( not ( = ?AUTO_1289 ?AUTO_1290 ) ) ( not ( = ?AUTO_1287 ?AUTO_1290 ) ) ( not ( = ?AUTO_1288 ?AUTO_1290 ) ) ( ON ?AUTO_1287 ?AUTO_1288 ) ( CLEAR ?AUTO_1287 ) ( HOLDING ?AUTO_1290 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1290 )
      ( MAKE-ON ?AUTO_1285 ?AUTO_1286 )
      ( MAKE-ON-VERIFY ?AUTO_1285 ?AUTO_1286 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1291 - BLOCK
      ?AUTO_1292 - BLOCK
    )
    :vars
    (
      ?AUTO_1296 - BLOCK
      ?AUTO_1294 - BLOCK
      ?AUTO_1295 - BLOCK
      ?AUTO_1293 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1292 ) ( not ( = ?AUTO_1291 ?AUTO_1292 ) ) ( ON-TABLE ?AUTO_1291 ) ( not ( = ?AUTO_1291 ?AUTO_1296 ) ) ( not ( = ?AUTO_1291 ?AUTO_1294 ) ) ( not ( = ?AUTO_1292 ?AUTO_1296 ) ) ( not ( = ?AUTO_1292 ?AUTO_1294 ) ) ( not ( = ?AUTO_1296 ?AUTO_1294 ) ) ( ON ?AUTO_1296 ?AUTO_1291 ) ( not ( = ?AUTO_1291 ?AUTO_1295 ) ) ( not ( = ?AUTO_1292 ?AUTO_1295 ) ) ( not ( = ?AUTO_1294 ?AUTO_1295 ) ) ( not ( = ?AUTO_1296 ?AUTO_1295 ) ) ( ON ?AUTO_1295 ?AUTO_1296 ) ( not ( = ?AUTO_1291 ?AUTO_1293 ) ) ( not ( = ?AUTO_1292 ?AUTO_1293 ) ) ( not ( = ?AUTO_1296 ?AUTO_1293 ) ) ( not ( = ?AUTO_1294 ?AUTO_1293 ) ) ( not ( = ?AUTO_1295 ?AUTO_1293 ) ) ( ON ?AUTO_1294 ?AUTO_1295 ) ( ON ?AUTO_1293 ?AUTO_1294 ) ( CLEAR ?AUTO_1293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1293 ?AUTO_1294 )
      ( MAKE-ON ?AUTO_1291 ?AUTO_1292 )
      ( MAKE-ON-VERIFY ?AUTO_1291 ?AUTO_1292 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1299 - BLOCK
      ?AUTO_1300 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1299 ) ( CLEAR ?AUTO_1300 ) ( not ( = ?AUTO_1299 ?AUTO_1300 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1299 ?AUTO_1300 )
      ( MAKE-ON-VERIFY ?AUTO_1299 ?AUTO_1300 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1301 - BLOCK
      ?AUTO_1302 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1302 ) ( not ( = ?AUTO_1301 ?AUTO_1302 ) ) ( ON-TABLE ?AUTO_1301 ) ( CLEAR ?AUTO_1301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1301 )
      ( MAKE-ON ?AUTO_1301 ?AUTO_1302 )
      ( MAKE-ON-VERIFY ?AUTO_1301 ?AUTO_1302 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1303 - BLOCK
      ?AUTO_1304 - BLOCK
    )
    :vars
    (
      ?AUTO_1305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1303 ?AUTO_1304 ) ) ( ON-TABLE ?AUTO_1303 ) ( CLEAR ?AUTO_1303 ) ( HOLDING ?AUTO_1304 ) ( CLEAR ?AUTO_1305 ) ( not ( = ?AUTO_1303 ?AUTO_1305 ) ) ( not ( = ?AUTO_1304 ?AUTO_1305 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1304 ?AUTO_1305 )
      ( MAKE-ON ?AUTO_1303 ?AUTO_1304 )
      ( MAKE-ON-VERIFY ?AUTO_1303 ?AUTO_1304 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1310 - BLOCK
      ?AUTO_1311 - BLOCK
    )
    :vars
    (
      ?AUTO_1313 - BLOCK
      ?AUTO_1312 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1310 ?AUTO_1311 ) ) ( ON-TABLE ?AUTO_1310 ) ( CLEAR ?AUTO_1310 ) ( CLEAR ?AUTO_1313 ) ( not ( = ?AUTO_1310 ?AUTO_1312 ) ) ( not ( = ?AUTO_1310 ?AUTO_1313 ) ) ( not ( = ?AUTO_1311 ?AUTO_1312 ) ) ( not ( = ?AUTO_1311 ?AUTO_1313 ) ) ( not ( = ?AUTO_1312 ?AUTO_1313 ) ) ( ON ?AUTO_1312 ?AUTO_1311 ) ( CLEAR ?AUTO_1312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1312 ?AUTO_1311 )
      ( MAKE-ON ?AUTO_1310 ?AUTO_1311 )
      ( MAKE-ON-VERIFY ?AUTO_1310 ?AUTO_1311 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1314 - BLOCK
      ?AUTO_1315 - BLOCK
    )
    :vars
    (
      ?AUTO_1317 - BLOCK
      ?AUTO_1316 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1314 ?AUTO_1315 ) ) ( CLEAR ?AUTO_1317 ) ( not ( = ?AUTO_1314 ?AUTO_1316 ) ) ( not ( = ?AUTO_1314 ?AUTO_1317 ) ) ( not ( = ?AUTO_1315 ?AUTO_1316 ) ) ( not ( = ?AUTO_1315 ?AUTO_1317 ) ) ( not ( = ?AUTO_1316 ?AUTO_1317 ) ) ( ON ?AUTO_1316 ?AUTO_1315 ) ( CLEAR ?AUTO_1316 ) ( HOLDING ?AUTO_1314 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1314 )
      ( MAKE-ON ?AUTO_1314 ?AUTO_1315 )
      ( MAKE-ON-VERIFY ?AUTO_1314 ?AUTO_1315 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1318 - BLOCK
      ?AUTO_1319 - BLOCK
    )
    :vars
    (
      ?AUTO_1321 - BLOCK
      ?AUTO_1320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1318 ?AUTO_1319 ) ) ( CLEAR ?AUTO_1321 ) ( not ( = ?AUTO_1318 ?AUTO_1320 ) ) ( not ( = ?AUTO_1318 ?AUTO_1321 ) ) ( not ( = ?AUTO_1319 ?AUTO_1320 ) ) ( not ( = ?AUTO_1319 ?AUTO_1321 ) ) ( not ( = ?AUTO_1320 ?AUTO_1321 ) ) ( ON ?AUTO_1320 ?AUTO_1319 ) ( ON ?AUTO_1318 ?AUTO_1320 ) ( CLEAR ?AUTO_1318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1318 ?AUTO_1320 )
      ( MAKE-ON ?AUTO_1318 ?AUTO_1319 )
      ( MAKE-ON-VERIFY ?AUTO_1318 ?AUTO_1319 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1322 - BLOCK
      ?AUTO_1323 - BLOCK
    )
    :vars
    (
      ?AUTO_1325 - BLOCK
      ?AUTO_1324 - BLOCK
      ?AUTO_1326 - BLOCK
      ?AUTO_1327 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1322 ?AUTO_1323 ) ) ( CLEAR ?AUTO_1325 ) ( not ( = ?AUTO_1322 ?AUTO_1324 ) ) ( not ( = ?AUTO_1322 ?AUTO_1325 ) ) ( not ( = ?AUTO_1323 ?AUTO_1324 ) ) ( not ( = ?AUTO_1323 ?AUTO_1325 ) ) ( not ( = ?AUTO_1324 ?AUTO_1325 ) ) ( ON ?AUTO_1324 ?AUTO_1323 ) ( ON ?AUTO_1322 ?AUTO_1324 ) ( CLEAR ?AUTO_1322 ) ( HOLDING ?AUTO_1326 ) ( CLEAR ?AUTO_1327 ) ( not ( = ?AUTO_1322 ?AUTO_1326 ) ) ( not ( = ?AUTO_1322 ?AUTO_1327 ) ) ( not ( = ?AUTO_1323 ?AUTO_1326 ) ) ( not ( = ?AUTO_1323 ?AUTO_1327 ) ) ( not ( = ?AUTO_1325 ?AUTO_1326 ) ) ( not ( = ?AUTO_1325 ?AUTO_1327 ) ) ( not ( = ?AUTO_1324 ?AUTO_1326 ) ) ( not ( = ?AUTO_1324 ?AUTO_1327 ) ) ( not ( = ?AUTO_1326 ?AUTO_1327 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1326 ?AUTO_1327 )
      ( MAKE-ON ?AUTO_1322 ?AUTO_1323 )
      ( MAKE-ON-VERIFY ?AUTO_1322 ?AUTO_1323 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1332 - BLOCK
      ?AUTO_1333 - BLOCK
    )
    :vars
    (
      ?AUTO_1336 - BLOCK
      ?AUTO_1337 - BLOCK
      ?AUTO_1335 - BLOCK
      ?AUTO_1334 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1332 ?AUTO_1333 ) ) ( CLEAR ?AUTO_1336 ) ( not ( = ?AUTO_1332 ?AUTO_1337 ) ) ( not ( = ?AUTO_1332 ?AUTO_1336 ) ) ( not ( = ?AUTO_1333 ?AUTO_1337 ) ) ( not ( = ?AUTO_1333 ?AUTO_1336 ) ) ( not ( = ?AUTO_1337 ?AUTO_1336 ) ) ( ON ?AUTO_1337 ?AUTO_1333 ) ( ON ?AUTO_1332 ?AUTO_1337 ) ( CLEAR ?AUTO_1335 ) ( not ( = ?AUTO_1332 ?AUTO_1334 ) ) ( not ( = ?AUTO_1332 ?AUTO_1335 ) ) ( not ( = ?AUTO_1333 ?AUTO_1334 ) ) ( not ( = ?AUTO_1333 ?AUTO_1335 ) ) ( not ( = ?AUTO_1336 ?AUTO_1334 ) ) ( not ( = ?AUTO_1336 ?AUTO_1335 ) ) ( not ( = ?AUTO_1337 ?AUTO_1334 ) ) ( not ( = ?AUTO_1337 ?AUTO_1335 ) ) ( not ( = ?AUTO_1334 ?AUTO_1335 ) ) ( ON ?AUTO_1334 ?AUTO_1332 ) ( CLEAR ?AUTO_1334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1334 ?AUTO_1332 )
      ( MAKE-ON ?AUTO_1332 ?AUTO_1333 )
      ( MAKE-ON-VERIFY ?AUTO_1332 ?AUTO_1333 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1338 - BLOCK
      ?AUTO_1339 - BLOCK
    )
    :vars
    (
      ?AUTO_1343 - BLOCK
      ?AUTO_1341 - BLOCK
      ?AUTO_1340 - BLOCK
      ?AUTO_1342 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1338 ?AUTO_1339 ) ) ( not ( = ?AUTO_1338 ?AUTO_1343 ) ) ( not ( = ?AUTO_1338 ?AUTO_1341 ) ) ( not ( = ?AUTO_1339 ?AUTO_1343 ) ) ( not ( = ?AUTO_1339 ?AUTO_1341 ) ) ( not ( = ?AUTO_1343 ?AUTO_1341 ) ) ( ON ?AUTO_1343 ?AUTO_1339 ) ( ON ?AUTO_1338 ?AUTO_1343 ) ( CLEAR ?AUTO_1340 ) ( not ( = ?AUTO_1338 ?AUTO_1342 ) ) ( not ( = ?AUTO_1338 ?AUTO_1340 ) ) ( not ( = ?AUTO_1339 ?AUTO_1342 ) ) ( not ( = ?AUTO_1339 ?AUTO_1340 ) ) ( not ( = ?AUTO_1341 ?AUTO_1342 ) ) ( not ( = ?AUTO_1341 ?AUTO_1340 ) ) ( not ( = ?AUTO_1343 ?AUTO_1342 ) ) ( not ( = ?AUTO_1343 ?AUTO_1340 ) ) ( not ( = ?AUTO_1342 ?AUTO_1340 ) ) ( ON ?AUTO_1342 ?AUTO_1338 ) ( CLEAR ?AUTO_1342 ) ( HOLDING ?AUTO_1341 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1341 )
      ( MAKE-ON ?AUTO_1338 ?AUTO_1339 )
      ( MAKE-ON-VERIFY ?AUTO_1338 ?AUTO_1339 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1344 - BLOCK
      ?AUTO_1345 - BLOCK
    )
    :vars
    (
      ?AUTO_1347 - BLOCK
      ?AUTO_1348 - BLOCK
      ?AUTO_1349 - BLOCK
      ?AUTO_1346 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1344 ?AUTO_1345 ) ) ( not ( = ?AUTO_1344 ?AUTO_1347 ) ) ( not ( = ?AUTO_1344 ?AUTO_1348 ) ) ( not ( = ?AUTO_1345 ?AUTO_1347 ) ) ( not ( = ?AUTO_1345 ?AUTO_1348 ) ) ( not ( = ?AUTO_1347 ?AUTO_1348 ) ) ( ON ?AUTO_1347 ?AUTO_1345 ) ( ON ?AUTO_1344 ?AUTO_1347 ) ( CLEAR ?AUTO_1349 ) ( not ( = ?AUTO_1344 ?AUTO_1346 ) ) ( not ( = ?AUTO_1344 ?AUTO_1349 ) ) ( not ( = ?AUTO_1345 ?AUTO_1346 ) ) ( not ( = ?AUTO_1345 ?AUTO_1349 ) ) ( not ( = ?AUTO_1348 ?AUTO_1346 ) ) ( not ( = ?AUTO_1348 ?AUTO_1349 ) ) ( not ( = ?AUTO_1347 ?AUTO_1346 ) ) ( not ( = ?AUTO_1347 ?AUTO_1349 ) ) ( not ( = ?AUTO_1346 ?AUTO_1349 ) ) ( ON ?AUTO_1346 ?AUTO_1344 ) ( ON ?AUTO_1348 ?AUTO_1346 ) ( CLEAR ?AUTO_1348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1348 ?AUTO_1346 )
      ( MAKE-ON ?AUTO_1344 ?AUTO_1345 )
      ( MAKE-ON-VERIFY ?AUTO_1344 ?AUTO_1345 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1351 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1351 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1351 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1351 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1352 - BLOCK
    )
    :vars
    (
      ?AUTO_1353 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1352 ?AUTO_1353 ) ( CLEAR ?AUTO_1352 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1352 ?AUTO_1353 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1352 ?AUTO_1353 )
      ( MAKE-ON-TABLE ?AUTO_1352 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1352 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1356 - BLOCK
      ?AUTO_1357 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1356 ) ( CLEAR ?AUTO_1357 ) ( not ( = ?AUTO_1356 ?AUTO_1357 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1356 ?AUTO_1357 )
      ( MAKE-ON-VERIFY ?AUTO_1356 ?AUTO_1357 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1358 - BLOCK
      ?AUTO_1359 - BLOCK
    )
    :vars
    (
      ?AUTO_1360 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1359 ) ( not ( = ?AUTO_1358 ?AUTO_1359 ) ) ( ON ?AUTO_1358 ?AUTO_1360 ) ( CLEAR ?AUTO_1358 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1358 ?AUTO_1360 ) ) ( not ( = ?AUTO_1359 ?AUTO_1360 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1358 ?AUTO_1360 )
      ( MAKE-ON ?AUTO_1358 ?AUTO_1359 )
      ( MAKE-ON-VERIFY ?AUTO_1358 ?AUTO_1359 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1361 - BLOCK
      ?AUTO_1362 - BLOCK
    )
    :vars
    (
      ?AUTO_1363 - BLOCK
      ?AUTO_1364 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1362 ) ( not ( = ?AUTO_1361 ?AUTO_1362 ) ) ( ON ?AUTO_1361 ?AUTO_1363 ) ( CLEAR ?AUTO_1361 ) ( not ( = ?AUTO_1361 ?AUTO_1363 ) ) ( not ( = ?AUTO_1362 ?AUTO_1363 ) ) ( HOLDING ?AUTO_1364 ) ( not ( = ?AUTO_1361 ?AUTO_1364 ) ) ( not ( = ?AUTO_1362 ?AUTO_1364 ) ) ( not ( = ?AUTO_1363 ?AUTO_1364 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1364 )
      ( MAKE-ON ?AUTO_1361 ?AUTO_1362 )
      ( MAKE-ON-VERIFY ?AUTO_1361 ?AUTO_1362 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1365 - BLOCK
      ?AUTO_1366 - BLOCK
    )
    :vars
    (
      ?AUTO_1367 - BLOCK
      ?AUTO_1368 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1366 ) ( not ( = ?AUTO_1365 ?AUTO_1366 ) ) ( ON ?AUTO_1365 ?AUTO_1367 ) ( not ( = ?AUTO_1365 ?AUTO_1367 ) ) ( not ( = ?AUTO_1366 ?AUTO_1367 ) ) ( not ( = ?AUTO_1365 ?AUTO_1368 ) ) ( not ( = ?AUTO_1366 ?AUTO_1368 ) ) ( not ( = ?AUTO_1367 ?AUTO_1368 ) ) ( ON ?AUTO_1368 ?AUTO_1365 ) ( CLEAR ?AUTO_1368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1368 ?AUTO_1365 )
      ( MAKE-ON ?AUTO_1365 ?AUTO_1366 )
      ( MAKE-ON-VERIFY ?AUTO_1365 ?AUTO_1366 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1371 - BLOCK
      ?AUTO_1372 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1371 ) ( CLEAR ?AUTO_1372 ) ( not ( = ?AUTO_1371 ?AUTO_1372 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1371 ?AUTO_1372 )
      ( MAKE-ON-VERIFY ?AUTO_1371 ?AUTO_1372 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1373 - BLOCK
      ?AUTO_1374 - BLOCK
    )
    :vars
    (
      ?AUTO_1375 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1374 ) ( not ( = ?AUTO_1373 ?AUTO_1374 ) ) ( ON ?AUTO_1373 ?AUTO_1375 ) ( CLEAR ?AUTO_1373 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1373 ?AUTO_1375 ) ) ( not ( = ?AUTO_1374 ?AUTO_1375 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1373 ?AUTO_1375 )
      ( MAKE-ON ?AUTO_1373 ?AUTO_1374 )
      ( MAKE-ON-VERIFY ?AUTO_1373 ?AUTO_1374 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1376 - BLOCK
      ?AUTO_1377 - BLOCK
    )
    :vars
    (
      ?AUTO_1378 - BLOCK
      ?AUTO_1379 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1376 ?AUTO_1377 ) ) ( ON ?AUTO_1376 ?AUTO_1378 ) ( CLEAR ?AUTO_1376 ) ( not ( = ?AUTO_1376 ?AUTO_1378 ) ) ( not ( = ?AUTO_1377 ?AUTO_1378 ) ) ( HOLDING ?AUTO_1377 ) ( CLEAR ?AUTO_1379 ) ( not ( = ?AUTO_1376 ?AUTO_1379 ) ) ( not ( = ?AUTO_1377 ?AUTO_1379 ) ) ( not ( = ?AUTO_1378 ?AUTO_1379 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1377 ?AUTO_1379 )
      ( MAKE-ON ?AUTO_1376 ?AUTO_1377 )
      ( MAKE-ON-VERIFY ?AUTO_1376 ?AUTO_1377 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1380 - BLOCK
      ?AUTO_1381 - BLOCK
    )
    :vars
    (
      ?AUTO_1382 - BLOCK
      ?AUTO_1383 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1380 ?AUTO_1381 ) ) ( ON ?AUTO_1380 ?AUTO_1382 ) ( not ( = ?AUTO_1380 ?AUTO_1382 ) ) ( not ( = ?AUTO_1381 ?AUTO_1382 ) ) ( CLEAR ?AUTO_1383 ) ( not ( = ?AUTO_1380 ?AUTO_1383 ) ) ( not ( = ?AUTO_1381 ?AUTO_1383 ) ) ( not ( = ?AUTO_1382 ?AUTO_1383 ) ) ( ON ?AUTO_1381 ?AUTO_1380 ) ( CLEAR ?AUTO_1381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1381 ?AUTO_1380 )
      ( MAKE-ON ?AUTO_1380 ?AUTO_1381 )
      ( MAKE-ON-VERIFY ?AUTO_1380 ?AUTO_1381 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1384 - BLOCK
      ?AUTO_1385 - BLOCK
    )
    :vars
    (
      ?AUTO_1386 - BLOCK
      ?AUTO_1387 - BLOCK
      ?AUTO_1388 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1384 ?AUTO_1385 ) ) ( ON ?AUTO_1384 ?AUTO_1386 ) ( not ( = ?AUTO_1384 ?AUTO_1386 ) ) ( not ( = ?AUTO_1385 ?AUTO_1386 ) ) ( CLEAR ?AUTO_1387 ) ( not ( = ?AUTO_1384 ?AUTO_1387 ) ) ( not ( = ?AUTO_1385 ?AUTO_1387 ) ) ( not ( = ?AUTO_1386 ?AUTO_1387 ) ) ( ON ?AUTO_1385 ?AUTO_1384 ) ( CLEAR ?AUTO_1385 ) ( HOLDING ?AUTO_1388 ) ( not ( = ?AUTO_1384 ?AUTO_1388 ) ) ( not ( = ?AUTO_1385 ?AUTO_1388 ) ) ( not ( = ?AUTO_1386 ?AUTO_1388 ) ) ( not ( = ?AUTO_1387 ?AUTO_1388 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1388 )
      ( MAKE-ON ?AUTO_1384 ?AUTO_1385 )
      ( MAKE-ON-VERIFY ?AUTO_1384 ?AUTO_1385 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1389 - BLOCK
      ?AUTO_1390 - BLOCK
    )
    :vars
    (
      ?AUTO_1391 - BLOCK
      ?AUTO_1392 - BLOCK
      ?AUTO_1393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1389 ?AUTO_1390 ) ) ( ON ?AUTO_1389 ?AUTO_1391 ) ( not ( = ?AUTO_1389 ?AUTO_1391 ) ) ( not ( = ?AUTO_1390 ?AUTO_1391 ) ) ( CLEAR ?AUTO_1392 ) ( not ( = ?AUTO_1389 ?AUTO_1392 ) ) ( not ( = ?AUTO_1390 ?AUTO_1392 ) ) ( not ( = ?AUTO_1391 ?AUTO_1392 ) ) ( ON ?AUTO_1390 ?AUTO_1389 ) ( not ( = ?AUTO_1389 ?AUTO_1393 ) ) ( not ( = ?AUTO_1390 ?AUTO_1393 ) ) ( not ( = ?AUTO_1391 ?AUTO_1393 ) ) ( not ( = ?AUTO_1392 ?AUTO_1393 ) ) ( ON ?AUTO_1393 ?AUTO_1390 ) ( CLEAR ?AUTO_1393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1393 ?AUTO_1390 )
      ( MAKE-ON ?AUTO_1389 ?AUTO_1390 )
      ( MAKE-ON-VERIFY ?AUTO_1389 ?AUTO_1390 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1396 - BLOCK
      ?AUTO_1397 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1396 ) ( CLEAR ?AUTO_1397 ) ( not ( = ?AUTO_1396 ?AUTO_1397 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1396 ?AUTO_1397 )
      ( MAKE-ON-VERIFY ?AUTO_1396 ?AUTO_1397 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1398 - BLOCK
      ?AUTO_1399 - BLOCK
    )
    :vars
    (
      ?AUTO_1400 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1399 ) ( not ( = ?AUTO_1398 ?AUTO_1399 ) ) ( ON ?AUTO_1398 ?AUTO_1400 ) ( CLEAR ?AUTO_1398 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1398 ?AUTO_1400 ) ) ( not ( = ?AUTO_1399 ?AUTO_1400 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1398 ?AUTO_1400 )
      ( MAKE-ON ?AUTO_1398 ?AUTO_1399 )
      ( MAKE-ON-VERIFY ?AUTO_1398 ?AUTO_1399 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1401 - BLOCK
      ?AUTO_1402 - BLOCK
    )
    :vars
    (
      ?AUTO_1403 - BLOCK
      ?AUTO_1404 - BLOCK
      ?AUTO_1405 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1402 ) ( not ( = ?AUTO_1401 ?AUTO_1402 ) ) ( ON ?AUTO_1401 ?AUTO_1403 ) ( CLEAR ?AUTO_1401 ) ( not ( = ?AUTO_1401 ?AUTO_1403 ) ) ( not ( = ?AUTO_1402 ?AUTO_1403 ) ) ( HOLDING ?AUTO_1404 ) ( CLEAR ?AUTO_1405 ) ( not ( = ?AUTO_1401 ?AUTO_1404 ) ) ( not ( = ?AUTO_1401 ?AUTO_1405 ) ) ( not ( = ?AUTO_1402 ?AUTO_1404 ) ) ( not ( = ?AUTO_1402 ?AUTO_1405 ) ) ( not ( = ?AUTO_1403 ?AUTO_1404 ) ) ( not ( = ?AUTO_1403 ?AUTO_1405 ) ) ( not ( = ?AUTO_1404 ?AUTO_1405 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1404 ?AUTO_1405 )
      ( MAKE-ON ?AUTO_1401 ?AUTO_1402 )
      ( MAKE-ON-VERIFY ?AUTO_1401 ?AUTO_1402 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1406 - BLOCK
      ?AUTO_1407 - BLOCK
    )
    :vars
    (
      ?AUTO_1408 - BLOCK
      ?AUTO_1409 - BLOCK
      ?AUTO_1410 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1407 ) ( not ( = ?AUTO_1406 ?AUTO_1407 ) ) ( ON ?AUTO_1406 ?AUTO_1408 ) ( not ( = ?AUTO_1406 ?AUTO_1408 ) ) ( not ( = ?AUTO_1407 ?AUTO_1408 ) ) ( CLEAR ?AUTO_1409 ) ( not ( = ?AUTO_1406 ?AUTO_1410 ) ) ( not ( = ?AUTO_1406 ?AUTO_1409 ) ) ( not ( = ?AUTO_1407 ?AUTO_1410 ) ) ( not ( = ?AUTO_1407 ?AUTO_1409 ) ) ( not ( = ?AUTO_1408 ?AUTO_1410 ) ) ( not ( = ?AUTO_1408 ?AUTO_1409 ) ) ( not ( = ?AUTO_1410 ?AUTO_1409 ) ) ( ON ?AUTO_1410 ?AUTO_1406 ) ( CLEAR ?AUTO_1410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1410 ?AUTO_1406 )
      ( MAKE-ON ?AUTO_1406 ?AUTO_1407 )
      ( MAKE-ON-VERIFY ?AUTO_1406 ?AUTO_1407 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1411 - BLOCK
      ?AUTO_1412 - BLOCK
    )
    :vars
    (
      ?AUTO_1413 - BLOCK
      ?AUTO_1414 - BLOCK
      ?AUTO_1415 - BLOCK
      ?AUTO_1416 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1412 ) ( not ( = ?AUTO_1411 ?AUTO_1412 ) ) ( ON ?AUTO_1411 ?AUTO_1413 ) ( not ( = ?AUTO_1411 ?AUTO_1413 ) ) ( not ( = ?AUTO_1412 ?AUTO_1413 ) ) ( not ( = ?AUTO_1411 ?AUTO_1414 ) ) ( not ( = ?AUTO_1411 ?AUTO_1415 ) ) ( not ( = ?AUTO_1412 ?AUTO_1414 ) ) ( not ( = ?AUTO_1412 ?AUTO_1415 ) ) ( not ( = ?AUTO_1413 ?AUTO_1414 ) ) ( not ( = ?AUTO_1413 ?AUTO_1415 ) ) ( not ( = ?AUTO_1414 ?AUTO_1415 ) ) ( ON ?AUTO_1414 ?AUTO_1411 ) ( CLEAR ?AUTO_1414 ) ( HOLDING ?AUTO_1415 ) ( CLEAR ?AUTO_1416 ) ( not ( = ?AUTO_1411 ?AUTO_1416 ) ) ( not ( = ?AUTO_1412 ?AUTO_1416 ) ) ( not ( = ?AUTO_1413 ?AUTO_1416 ) ) ( not ( = ?AUTO_1414 ?AUTO_1416 ) ) ( not ( = ?AUTO_1415 ?AUTO_1416 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1415 ?AUTO_1416 )
      ( MAKE-ON ?AUTO_1411 ?AUTO_1412 )
      ( MAKE-ON-VERIFY ?AUTO_1411 ?AUTO_1412 ) )
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
      ?AUTO_1420 - BLOCK
      ?AUTO_1422 - BLOCK
      ?AUTO_1421 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1418 ) ( not ( = ?AUTO_1417 ?AUTO_1418 ) ) ( ON ?AUTO_1417 ?AUTO_1419 ) ( not ( = ?AUTO_1417 ?AUTO_1419 ) ) ( not ( = ?AUTO_1418 ?AUTO_1419 ) ) ( not ( = ?AUTO_1417 ?AUTO_1420 ) ) ( not ( = ?AUTO_1417 ?AUTO_1422 ) ) ( not ( = ?AUTO_1418 ?AUTO_1420 ) ) ( not ( = ?AUTO_1418 ?AUTO_1422 ) ) ( not ( = ?AUTO_1419 ?AUTO_1420 ) ) ( not ( = ?AUTO_1419 ?AUTO_1422 ) ) ( not ( = ?AUTO_1420 ?AUTO_1422 ) ) ( ON ?AUTO_1420 ?AUTO_1417 ) ( CLEAR ?AUTO_1421 ) ( not ( = ?AUTO_1417 ?AUTO_1421 ) ) ( not ( = ?AUTO_1418 ?AUTO_1421 ) ) ( not ( = ?AUTO_1419 ?AUTO_1421 ) ) ( not ( = ?AUTO_1420 ?AUTO_1421 ) ) ( not ( = ?AUTO_1422 ?AUTO_1421 ) ) ( ON ?AUTO_1422 ?AUTO_1420 ) ( CLEAR ?AUTO_1422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1422 ?AUTO_1420 )
      ( MAKE-ON ?AUTO_1417 ?AUTO_1418 )
      ( MAKE-ON-VERIFY ?AUTO_1417 ?AUTO_1418 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1423 - BLOCK
      ?AUTO_1424 - BLOCK
    )
    :vars
    (
      ?AUTO_1427 - BLOCK
      ?AUTO_1428 - BLOCK
      ?AUTO_1426 - BLOCK
      ?AUTO_1425 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1423 ?AUTO_1424 ) ) ( ON ?AUTO_1423 ?AUTO_1427 ) ( not ( = ?AUTO_1423 ?AUTO_1427 ) ) ( not ( = ?AUTO_1424 ?AUTO_1427 ) ) ( not ( = ?AUTO_1423 ?AUTO_1428 ) ) ( not ( = ?AUTO_1423 ?AUTO_1426 ) ) ( not ( = ?AUTO_1424 ?AUTO_1428 ) ) ( not ( = ?AUTO_1424 ?AUTO_1426 ) ) ( not ( = ?AUTO_1427 ?AUTO_1428 ) ) ( not ( = ?AUTO_1427 ?AUTO_1426 ) ) ( not ( = ?AUTO_1428 ?AUTO_1426 ) ) ( ON ?AUTO_1428 ?AUTO_1423 ) ( CLEAR ?AUTO_1425 ) ( not ( = ?AUTO_1423 ?AUTO_1425 ) ) ( not ( = ?AUTO_1424 ?AUTO_1425 ) ) ( not ( = ?AUTO_1427 ?AUTO_1425 ) ) ( not ( = ?AUTO_1428 ?AUTO_1425 ) ) ( not ( = ?AUTO_1426 ?AUTO_1425 ) ) ( ON ?AUTO_1426 ?AUTO_1428 ) ( CLEAR ?AUTO_1426 ) ( HOLDING ?AUTO_1424 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1424 )
      ( MAKE-ON ?AUTO_1423 ?AUTO_1424 )
      ( MAKE-ON-VERIFY ?AUTO_1423 ?AUTO_1424 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1429 - BLOCK
      ?AUTO_1430 - BLOCK
    )
    :vars
    (
      ?AUTO_1434 - BLOCK
      ?AUTO_1431 - BLOCK
      ?AUTO_1433 - BLOCK
      ?AUTO_1432 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1429 ?AUTO_1430 ) ) ( ON ?AUTO_1429 ?AUTO_1434 ) ( not ( = ?AUTO_1429 ?AUTO_1434 ) ) ( not ( = ?AUTO_1430 ?AUTO_1434 ) ) ( not ( = ?AUTO_1429 ?AUTO_1431 ) ) ( not ( = ?AUTO_1429 ?AUTO_1433 ) ) ( not ( = ?AUTO_1430 ?AUTO_1431 ) ) ( not ( = ?AUTO_1430 ?AUTO_1433 ) ) ( not ( = ?AUTO_1434 ?AUTO_1431 ) ) ( not ( = ?AUTO_1434 ?AUTO_1433 ) ) ( not ( = ?AUTO_1431 ?AUTO_1433 ) ) ( ON ?AUTO_1431 ?AUTO_1429 ) ( CLEAR ?AUTO_1432 ) ( not ( = ?AUTO_1429 ?AUTO_1432 ) ) ( not ( = ?AUTO_1430 ?AUTO_1432 ) ) ( not ( = ?AUTO_1434 ?AUTO_1432 ) ) ( not ( = ?AUTO_1431 ?AUTO_1432 ) ) ( not ( = ?AUTO_1433 ?AUTO_1432 ) ) ( ON ?AUTO_1433 ?AUTO_1431 ) ( ON ?AUTO_1430 ?AUTO_1433 ) ( CLEAR ?AUTO_1430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1430 ?AUTO_1433 )
      ( MAKE-ON ?AUTO_1429 ?AUTO_1430 )
      ( MAKE-ON-VERIFY ?AUTO_1429 ?AUTO_1430 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1436 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1436 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1436 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1436 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1437 - BLOCK
    )
    :vars
    (
      ?AUTO_1438 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1437 ?AUTO_1438 ) ( CLEAR ?AUTO_1437 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1437 ?AUTO_1438 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1437 ?AUTO_1438 )
      ( MAKE-ON-TABLE ?AUTO_1437 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1437 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1439 - BLOCK
    )
    :vars
    (
      ?AUTO_1440 - BLOCK
      ?AUTO_1441 - BLOCK
      ?AUTO_1442 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1439 ?AUTO_1440 ) ( CLEAR ?AUTO_1439 ) ( not ( = ?AUTO_1439 ?AUTO_1440 ) ) ( HOLDING ?AUTO_1441 ) ( CLEAR ?AUTO_1442 ) ( not ( = ?AUTO_1439 ?AUTO_1441 ) ) ( not ( = ?AUTO_1439 ?AUTO_1442 ) ) ( not ( = ?AUTO_1440 ?AUTO_1441 ) ) ( not ( = ?AUTO_1440 ?AUTO_1442 ) ) ( not ( = ?AUTO_1441 ?AUTO_1442 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1441 ?AUTO_1442 )
      ( MAKE-ON-TABLE ?AUTO_1439 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1439 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1447 - BLOCK
    )
    :vars
    (
      ?AUTO_1450 - BLOCK
      ?AUTO_1448 - BLOCK
      ?AUTO_1449 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1447 ?AUTO_1450 ) ( not ( = ?AUTO_1447 ?AUTO_1450 ) ) ( CLEAR ?AUTO_1448 ) ( not ( = ?AUTO_1447 ?AUTO_1449 ) ) ( not ( = ?AUTO_1447 ?AUTO_1448 ) ) ( not ( = ?AUTO_1450 ?AUTO_1449 ) ) ( not ( = ?AUTO_1450 ?AUTO_1448 ) ) ( not ( = ?AUTO_1449 ?AUTO_1448 ) ) ( ON ?AUTO_1449 ?AUTO_1447 ) ( CLEAR ?AUTO_1449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1449 ?AUTO_1447 )
      ( MAKE-ON-TABLE ?AUTO_1447 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1447 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1451 - BLOCK
    )
    :vars
    (
      ?AUTO_1454 - BLOCK
      ?AUTO_1453 - BLOCK
      ?AUTO_1452 - BLOCK
      ?AUTO_1455 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1451 ?AUTO_1454 ) ( not ( = ?AUTO_1451 ?AUTO_1454 ) ) ( CLEAR ?AUTO_1453 ) ( not ( = ?AUTO_1451 ?AUTO_1452 ) ) ( not ( = ?AUTO_1451 ?AUTO_1453 ) ) ( not ( = ?AUTO_1454 ?AUTO_1452 ) ) ( not ( = ?AUTO_1454 ?AUTO_1453 ) ) ( not ( = ?AUTO_1452 ?AUTO_1453 ) ) ( ON ?AUTO_1452 ?AUTO_1451 ) ( CLEAR ?AUTO_1452 ) ( HOLDING ?AUTO_1455 ) ( not ( = ?AUTO_1451 ?AUTO_1455 ) ) ( not ( = ?AUTO_1454 ?AUTO_1455 ) ) ( not ( = ?AUTO_1453 ?AUTO_1455 ) ) ( not ( = ?AUTO_1452 ?AUTO_1455 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1455 )
      ( MAKE-ON-TABLE ?AUTO_1451 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1451 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1456 - BLOCK
    )
    :vars
    (
      ?AUTO_1460 - BLOCK
      ?AUTO_1457 - BLOCK
      ?AUTO_1458 - BLOCK
      ?AUTO_1459 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1456 ?AUTO_1460 ) ( not ( = ?AUTO_1456 ?AUTO_1460 ) ) ( CLEAR ?AUTO_1457 ) ( not ( = ?AUTO_1456 ?AUTO_1458 ) ) ( not ( = ?AUTO_1456 ?AUTO_1457 ) ) ( not ( = ?AUTO_1460 ?AUTO_1458 ) ) ( not ( = ?AUTO_1460 ?AUTO_1457 ) ) ( not ( = ?AUTO_1458 ?AUTO_1457 ) ) ( ON ?AUTO_1458 ?AUTO_1456 ) ( not ( = ?AUTO_1456 ?AUTO_1459 ) ) ( not ( = ?AUTO_1460 ?AUTO_1459 ) ) ( not ( = ?AUTO_1457 ?AUTO_1459 ) ) ( not ( = ?AUTO_1458 ?AUTO_1459 ) ) ( ON ?AUTO_1459 ?AUTO_1458 ) ( CLEAR ?AUTO_1459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1459 ?AUTO_1458 )
      ( MAKE-ON-TABLE ?AUTO_1456 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1456 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1463 - BLOCK
      ?AUTO_1464 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1463 ) ( CLEAR ?AUTO_1464 ) ( not ( = ?AUTO_1463 ?AUTO_1464 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1463 ?AUTO_1464 )
      ( MAKE-ON-VERIFY ?AUTO_1463 ?AUTO_1464 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1465 - BLOCK
      ?AUTO_1466 - BLOCK
    )
    :vars
    (
      ?AUTO_1467 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1466 ) ( not ( = ?AUTO_1465 ?AUTO_1466 ) ) ( ON ?AUTO_1465 ?AUTO_1467 ) ( CLEAR ?AUTO_1465 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1465 ?AUTO_1467 ) ) ( not ( = ?AUTO_1466 ?AUTO_1467 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1465 ?AUTO_1467 )
      ( MAKE-ON ?AUTO_1465 ?AUTO_1466 )
      ( MAKE-ON-VERIFY ?AUTO_1465 ?AUTO_1466 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1468 - BLOCK
      ?AUTO_1469 - BLOCK
    )
    :vars
    (
      ?AUTO_1470 - BLOCK
      ?AUTO_1471 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1469 ) ( not ( = ?AUTO_1468 ?AUTO_1469 ) ) ( ON ?AUTO_1468 ?AUTO_1470 ) ( CLEAR ?AUTO_1468 ) ( not ( = ?AUTO_1468 ?AUTO_1470 ) ) ( not ( = ?AUTO_1469 ?AUTO_1470 ) ) ( HOLDING ?AUTO_1471 ) ( not ( = ?AUTO_1468 ?AUTO_1471 ) ) ( not ( = ?AUTO_1469 ?AUTO_1471 ) ) ( not ( = ?AUTO_1470 ?AUTO_1471 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1471 )
      ( MAKE-ON ?AUTO_1468 ?AUTO_1469 )
      ( MAKE-ON-VERIFY ?AUTO_1468 ?AUTO_1469 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1472 - BLOCK
      ?AUTO_1473 - BLOCK
    )
    :vars
    (
      ?AUTO_1474 - BLOCK
      ?AUTO_1475 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1473 ) ( not ( = ?AUTO_1472 ?AUTO_1473 ) ) ( ON ?AUTO_1472 ?AUTO_1474 ) ( not ( = ?AUTO_1472 ?AUTO_1474 ) ) ( not ( = ?AUTO_1473 ?AUTO_1474 ) ) ( not ( = ?AUTO_1472 ?AUTO_1475 ) ) ( not ( = ?AUTO_1473 ?AUTO_1475 ) ) ( not ( = ?AUTO_1474 ?AUTO_1475 ) ) ( ON ?AUTO_1475 ?AUTO_1472 ) ( CLEAR ?AUTO_1475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1475 ?AUTO_1472 )
      ( MAKE-ON ?AUTO_1472 ?AUTO_1473 )
      ( MAKE-ON-VERIFY ?AUTO_1472 ?AUTO_1473 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1476 - BLOCK
      ?AUTO_1477 - BLOCK
    )
    :vars
    (
      ?AUTO_1478 - BLOCK
      ?AUTO_1479 - BLOCK
      ?AUTO_1480 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1476 ?AUTO_1477 ) ) ( ON ?AUTO_1476 ?AUTO_1478 ) ( not ( = ?AUTO_1476 ?AUTO_1478 ) ) ( not ( = ?AUTO_1477 ?AUTO_1478 ) ) ( not ( = ?AUTO_1476 ?AUTO_1479 ) ) ( not ( = ?AUTO_1477 ?AUTO_1479 ) ) ( not ( = ?AUTO_1478 ?AUTO_1479 ) ) ( ON ?AUTO_1479 ?AUTO_1476 ) ( CLEAR ?AUTO_1479 ) ( HOLDING ?AUTO_1477 ) ( CLEAR ?AUTO_1480 ) ( not ( = ?AUTO_1476 ?AUTO_1480 ) ) ( not ( = ?AUTO_1477 ?AUTO_1480 ) ) ( not ( = ?AUTO_1478 ?AUTO_1480 ) ) ( not ( = ?AUTO_1479 ?AUTO_1480 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1477 ?AUTO_1480 )
      ( MAKE-ON ?AUTO_1476 ?AUTO_1477 )
      ( MAKE-ON-VERIFY ?AUTO_1476 ?AUTO_1477 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1485 - BLOCK
      ?AUTO_1486 - BLOCK
    )
    :vars
    (
      ?AUTO_1487 - BLOCK
      ?AUTO_1488 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1485 ?AUTO_1486 ) ) ( ON ?AUTO_1485 ?AUTO_1487 ) ( CLEAR ?AUTO_1485 ) ( not ( = ?AUTO_1485 ?AUTO_1487 ) ) ( not ( = ?AUTO_1486 ?AUTO_1487 ) ) ( not ( = ?AUTO_1485 ?AUTO_1488 ) ) ( not ( = ?AUTO_1486 ?AUTO_1488 ) ) ( not ( = ?AUTO_1487 ?AUTO_1488 ) ) ( ON ?AUTO_1488 ?AUTO_1486 ) ( CLEAR ?AUTO_1488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1488 ?AUTO_1486 )
      ( MAKE-ON ?AUTO_1485 ?AUTO_1486 )
      ( MAKE-ON-VERIFY ?AUTO_1485 ?AUTO_1486 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1489 - BLOCK
      ?AUTO_1490 - BLOCK
    )
    :vars
    (
      ?AUTO_1491 - BLOCK
      ?AUTO_1492 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1489 ?AUTO_1490 ) ) ( not ( = ?AUTO_1489 ?AUTO_1491 ) ) ( not ( = ?AUTO_1490 ?AUTO_1491 ) ) ( not ( = ?AUTO_1489 ?AUTO_1492 ) ) ( not ( = ?AUTO_1490 ?AUTO_1492 ) ) ( not ( = ?AUTO_1491 ?AUTO_1492 ) ) ( ON ?AUTO_1492 ?AUTO_1490 ) ( CLEAR ?AUTO_1492 ) ( HOLDING ?AUTO_1489 ) ( CLEAR ?AUTO_1491 ) )
    :subtasks
    ( ( !STACK ?AUTO_1489 ?AUTO_1491 )
      ( MAKE-ON ?AUTO_1489 ?AUTO_1490 )
      ( MAKE-ON-VERIFY ?AUTO_1489 ?AUTO_1490 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1493 - BLOCK
      ?AUTO_1494 - BLOCK
    )
    :vars
    (
      ?AUTO_1495 - BLOCK
      ?AUTO_1496 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1493 ?AUTO_1494 ) ) ( not ( = ?AUTO_1493 ?AUTO_1495 ) ) ( not ( = ?AUTO_1494 ?AUTO_1495 ) ) ( not ( = ?AUTO_1493 ?AUTO_1496 ) ) ( not ( = ?AUTO_1494 ?AUTO_1496 ) ) ( not ( = ?AUTO_1495 ?AUTO_1496 ) ) ( ON ?AUTO_1496 ?AUTO_1494 ) ( CLEAR ?AUTO_1495 ) ( ON ?AUTO_1493 ?AUTO_1496 ) ( CLEAR ?AUTO_1493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1493 ?AUTO_1496 )
      ( MAKE-ON ?AUTO_1493 ?AUTO_1494 )
      ( MAKE-ON-VERIFY ?AUTO_1493 ?AUTO_1494 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1497 - BLOCK
      ?AUTO_1498 - BLOCK
    )
    :vars
    (
      ?AUTO_1500 - BLOCK
      ?AUTO_1499 - BLOCK
      ?AUTO_1501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1497 ?AUTO_1498 ) ) ( not ( = ?AUTO_1497 ?AUTO_1500 ) ) ( not ( = ?AUTO_1498 ?AUTO_1500 ) ) ( not ( = ?AUTO_1497 ?AUTO_1499 ) ) ( not ( = ?AUTO_1498 ?AUTO_1499 ) ) ( not ( = ?AUTO_1500 ?AUTO_1499 ) ) ( ON ?AUTO_1499 ?AUTO_1498 ) ( CLEAR ?AUTO_1500 ) ( ON ?AUTO_1497 ?AUTO_1499 ) ( CLEAR ?AUTO_1497 ) ( HOLDING ?AUTO_1501 ) ( not ( = ?AUTO_1497 ?AUTO_1501 ) ) ( not ( = ?AUTO_1498 ?AUTO_1501 ) ) ( not ( = ?AUTO_1500 ?AUTO_1501 ) ) ( not ( = ?AUTO_1499 ?AUTO_1501 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1501 )
      ( MAKE-ON ?AUTO_1497 ?AUTO_1498 )
      ( MAKE-ON-VERIFY ?AUTO_1497 ?AUTO_1498 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1502 - BLOCK
      ?AUTO_1503 - BLOCK
    )
    :vars
    (
      ?AUTO_1506 - BLOCK
      ?AUTO_1504 - BLOCK
      ?AUTO_1505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1502 ?AUTO_1503 ) ) ( not ( = ?AUTO_1502 ?AUTO_1506 ) ) ( not ( = ?AUTO_1503 ?AUTO_1506 ) ) ( not ( = ?AUTO_1502 ?AUTO_1504 ) ) ( not ( = ?AUTO_1503 ?AUTO_1504 ) ) ( not ( = ?AUTO_1506 ?AUTO_1504 ) ) ( ON ?AUTO_1504 ?AUTO_1503 ) ( CLEAR ?AUTO_1506 ) ( ON ?AUTO_1502 ?AUTO_1504 ) ( not ( = ?AUTO_1502 ?AUTO_1505 ) ) ( not ( = ?AUTO_1503 ?AUTO_1505 ) ) ( not ( = ?AUTO_1506 ?AUTO_1505 ) ) ( not ( = ?AUTO_1504 ?AUTO_1505 ) ) ( ON ?AUTO_1505 ?AUTO_1502 ) ( CLEAR ?AUTO_1505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1505 ?AUTO_1502 )
      ( MAKE-ON ?AUTO_1502 ?AUTO_1503 )
      ( MAKE-ON-VERIFY ?AUTO_1502 ?AUTO_1503 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1509 - BLOCK
      ?AUTO_1510 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1509 ) ( CLEAR ?AUTO_1510 ) ( not ( = ?AUTO_1509 ?AUTO_1510 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1509 ?AUTO_1510 )
      ( MAKE-ON-VERIFY ?AUTO_1509 ?AUTO_1510 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1511 - BLOCK
      ?AUTO_1512 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1512 ) ( not ( = ?AUTO_1511 ?AUTO_1512 ) ) ( ON-TABLE ?AUTO_1511 ) ( CLEAR ?AUTO_1511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1511 )
      ( MAKE-ON ?AUTO_1511 ?AUTO_1512 )
      ( MAKE-ON-VERIFY ?AUTO_1511 ?AUTO_1512 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1513 - BLOCK
      ?AUTO_1514 - BLOCK
    )
    :vars
    (
      ?AUTO_1515 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1513 ?AUTO_1514 ) ) ( ON-TABLE ?AUTO_1513 ) ( CLEAR ?AUTO_1513 ) ( HOLDING ?AUTO_1514 ) ( CLEAR ?AUTO_1515 ) ( not ( = ?AUTO_1513 ?AUTO_1515 ) ) ( not ( = ?AUTO_1514 ?AUTO_1515 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1514 ?AUTO_1515 )
      ( MAKE-ON ?AUTO_1513 ?AUTO_1514 )
      ( MAKE-ON-VERIFY ?AUTO_1513 ?AUTO_1514 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1545 - BLOCK
      ?AUTO_1546 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1545 ) ( CLEAR ?AUTO_1546 ) ( not ( = ?AUTO_1545 ?AUTO_1546 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1545 ?AUTO_1546 )
      ( MAKE-ON-VERIFY ?AUTO_1545 ?AUTO_1546 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1547 - BLOCK
      ?AUTO_1548 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1548 ) ( not ( = ?AUTO_1547 ?AUTO_1548 ) ) ( ON-TABLE ?AUTO_1547 ) ( CLEAR ?AUTO_1547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1547 )
      ( MAKE-ON ?AUTO_1547 ?AUTO_1548 )
      ( MAKE-ON-VERIFY ?AUTO_1547 ?AUTO_1548 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1549 - BLOCK
      ?AUTO_1550 - BLOCK
    )
    :vars
    (
      ?AUTO_1551 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1549 ?AUTO_1550 ) ) ( ON-TABLE ?AUTO_1549 ) ( CLEAR ?AUTO_1549 ) ( HOLDING ?AUTO_1550 ) ( CLEAR ?AUTO_1551 ) ( not ( = ?AUTO_1549 ?AUTO_1551 ) ) ( not ( = ?AUTO_1550 ?AUTO_1551 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1550 ?AUTO_1551 )
      ( MAKE-ON ?AUTO_1549 ?AUTO_1550 )
      ( MAKE-ON-VERIFY ?AUTO_1549 ?AUTO_1550 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1554 - BLOCK
      ?AUTO_1555 - BLOCK
    )
    :vars
    (
      ?AUTO_1556 - BLOCK
      ?AUTO_1557 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1555 ) ( not ( = ?AUTO_1554 ?AUTO_1555 ) ) ( ON-TABLE ?AUTO_1554 ) ( CLEAR ?AUTO_1554 ) ( HOLDING ?AUTO_1556 ) ( CLEAR ?AUTO_1557 ) ( not ( = ?AUTO_1554 ?AUTO_1556 ) ) ( not ( = ?AUTO_1554 ?AUTO_1557 ) ) ( not ( = ?AUTO_1555 ?AUTO_1556 ) ) ( not ( = ?AUTO_1555 ?AUTO_1557 ) ) ( not ( = ?AUTO_1556 ?AUTO_1557 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1556 ?AUTO_1557 )
      ( MAKE-ON ?AUTO_1554 ?AUTO_1555 )
      ( MAKE-ON-VERIFY ?AUTO_1554 ?AUTO_1555 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1566 - BLOCK
      ?AUTO_1567 - BLOCK
    )
    :vars
    (
      ?AUTO_1569 - BLOCK
      ?AUTO_1568 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1567 ) ( not ( = ?AUTO_1566 ?AUTO_1567 ) ) ( ON-TABLE ?AUTO_1566 ) ( CLEAR ?AUTO_1569 ) ( not ( = ?AUTO_1566 ?AUTO_1568 ) ) ( not ( = ?AUTO_1566 ?AUTO_1569 ) ) ( not ( = ?AUTO_1567 ?AUTO_1568 ) ) ( not ( = ?AUTO_1567 ?AUTO_1569 ) ) ( not ( = ?AUTO_1568 ?AUTO_1569 ) ) ( ON ?AUTO_1568 ?AUTO_1566 ) ( CLEAR ?AUTO_1568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1568 ?AUTO_1566 )
      ( MAKE-ON ?AUTO_1566 ?AUTO_1567 )
      ( MAKE-ON-VERIFY ?AUTO_1566 ?AUTO_1567 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1570 - BLOCK
      ?AUTO_1571 - BLOCK
    )
    :vars
    (
      ?AUTO_1572 - BLOCK
      ?AUTO_1573 - BLOCK
      ?AUTO_1574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1570 ?AUTO_1571 ) ) ( ON-TABLE ?AUTO_1570 ) ( CLEAR ?AUTO_1572 ) ( not ( = ?AUTO_1570 ?AUTO_1573 ) ) ( not ( = ?AUTO_1570 ?AUTO_1572 ) ) ( not ( = ?AUTO_1571 ?AUTO_1573 ) ) ( not ( = ?AUTO_1571 ?AUTO_1572 ) ) ( not ( = ?AUTO_1573 ?AUTO_1572 ) ) ( ON ?AUTO_1573 ?AUTO_1570 ) ( CLEAR ?AUTO_1573 ) ( HOLDING ?AUTO_1571 ) ( CLEAR ?AUTO_1574 ) ( not ( = ?AUTO_1570 ?AUTO_1574 ) ) ( not ( = ?AUTO_1571 ?AUTO_1574 ) ) ( not ( = ?AUTO_1572 ?AUTO_1574 ) ) ( not ( = ?AUTO_1573 ?AUTO_1574 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1571 ?AUTO_1574 )
      ( MAKE-ON ?AUTO_1570 ?AUTO_1571 )
      ( MAKE-ON-VERIFY ?AUTO_1570 ?AUTO_1571 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1575 - BLOCK
      ?AUTO_1576 - BLOCK
    )
    :vars
    (
      ?AUTO_1578 - BLOCK
      ?AUTO_1577 - BLOCK
      ?AUTO_1579 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1575 ?AUTO_1576 ) ) ( ON-TABLE ?AUTO_1575 ) ( CLEAR ?AUTO_1578 ) ( not ( = ?AUTO_1575 ?AUTO_1577 ) ) ( not ( = ?AUTO_1575 ?AUTO_1578 ) ) ( not ( = ?AUTO_1576 ?AUTO_1577 ) ) ( not ( = ?AUTO_1576 ?AUTO_1578 ) ) ( not ( = ?AUTO_1577 ?AUTO_1578 ) ) ( ON ?AUTO_1577 ?AUTO_1575 ) ( CLEAR ?AUTO_1579 ) ( not ( = ?AUTO_1575 ?AUTO_1579 ) ) ( not ( = ?AUTO_1576 ?AUTO_1579 ) ) ( not ( = ?AUTO_1578 ?AUTO_1579 ) ) ( not ( = ?AUTO_1577 ?AUTO_1579 ) ) ( ON ?AUTO_1576 ?AUTO_1577 ) ( CLEAR ?AUTO_1576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1576 ?AUTO_1577 )
      ( MAKE-ON ?AUTO_1575 ?AUTO_1576 )
      ( MAKE-ON-VERIFY ?AUTO_1575 ?AUTO_1576 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1580 - BLOCK
      ?AUTO_1581 - BLOCK
    )
    :vars
    (
      ?AUTO_1582 - BLOCK
      ?AUTO_1583 - BLOCK
      ?AUTO_1584 - BLOCK
      ?AUTO_1585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1580 ?AUTO_1581 ) ) ( ON-TABLE ?AUTO_1580 ) ( CLEAR ?AUTO_1582 ) ( not ( = ?AUTO_1580 ?AUTO_1583 ) ) ( not ( = ?AUTO_1580 ?AUTO_1582 ) ) ( not ( = ?AUTO_1581 ?AUTO_1583 ) ) ( not ( = ?AUTO_1581 ?AUTO_1582 ) ) ( not ( = ?AUTO_1583 ?AUTO_1582 ) ) ( ON ?AUTO_1583 ?AUTO_1580 ) ( not ( = ?AUTO_1580 ?AUTO_1584 ) ) ( not ( = ?AUTO_1581 ?AUTO_1584 ) ) ( not ( = ?AUTO_1582 ?AUTO_1584 ) ) ( not ( = ?AUTO_1583 ?AUTO_1584 ) ) ( ON ?AUTO_1581 ?AUTO_1583 ) ( CLEAR ?AUTO_1581 ) ( HOLDING ?AUTO_1584 ) ( CLEAR ?AUTO_1585 ) ( not ( = ?AUTO_1580 ?AUTO_1585 ) ) ( not ( = ?AUTO_1581 ?AUTO_1585 ) ) ( not ( = ?AUTO_1582 ?AUTO_1585 ) ) ( not ( = ?AUTO_1583 ?AUTO_1585 ) ) ( not ( = ?AUTO_1584 ?AUTO_1585 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1584 ?AUTO_1585 )
      ( MAKE-ON ?AUTO_1580 ?AUTO_1581 )
      ( MAKE-ON-VERIFY ?AUTO_1580 ?AUTO_1581 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1586 - BLOCK
      ?AUTO_1587 - BLOCK
    )
    :vars
    (
      ?AUTO_1590 - BLOCK
      ?AUTO_1588 - BLOCK
      ?AUTO_1591 - BLOCK
      ?AUTO_1589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1586 ?AUTO_1587 ) ) ( ON-TABLE ?AUTO_1586 ) ( CLEAR ?AUTO_1590 ) ( not ( = ?AUTO_1586 ?AUTO_1588 ) ) ( not ( = ?AUTO_1586 ?AUTO_1590 ) ) ( not ( = ?AUTO_1587 ?AUTO_1588 ) ) ( not ( = ?AUTO_1587 ?AUTO_1590 ) ) ( not ( = ?AUTO_1588 ?AUTO_1590 ) ) ( ON ?AUTO_1588 ?AUTO_1586 ) ( not ( = ?AUTO_1586 ?AUTO_1591 ) ) ( not ( = ?AUTO_1587 ?AUTO_1591 ) ) ( not ( = ?AUTO_1590 ?AUTO_1591 ) ) ( not ( = ?AUTO_1588 ?AUTO_1591 ) ) ( ON ?AUTO_1587 ?AUTO_1588 ) ( CLEAR ?AUTO_1589 ) ( not ( = ?AUTO_1586 ?AUTO_1589 ) ) ( not ( = ?AUTO_1587 ?AUTO_1589 ) ) ( not ( = ?AUTO_1590 ?AUTO_1589 ) ) ( not ( = ?AUTO_1588 ?AUTO_1589 ) ) ( not ( = ?AUTO_1591 ?AUTO_1589 ) ) ( ON ?AUTO_1591 ?AUTO_1587 ) ( CLEAR ?AUTO_1591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1591 ?AUTO_1587 )
      ( MAKE-ON ?AUTO_1586 ?AUTO_1587 )
      ( MAKE-ON-VERIFY ?AUTO_1586 ?AUTO_1587 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1592 - BLOCK
      ?AUTO_1593 - BLOCK
    )
    :vars
    (
      ?AUTO_1597 - BLOCK
      ?AUTO_1595 - BLOCK
      ?AUTO_1596 - BLOCK
      ?AUTO_1594 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1592 ?AUTO_1593 ) ) ( ON-TABLE ?AUTO_1592 ) ( not ( = ?AUTO_1592 ?AUTO_1597 ) ) ( not ( = ?AUTO_1592 ?AUTO_1595 ) ) ( not ( = ?AUTO_1593 ?AUTO_1597 ) ) ( not ( = ?AUTO_1593 ?AUTO_1595 ) ) ( not ( = ?AUTO_1597 ?AUTO_1595 ) ) ( ON ?AUTO_1597 ?AUTO_1592 ) ( not ( = ?AUTO_1592 ?AUTO_1596 ) ) ( not ( = ?AUTO_1593 ?AUTO_1596 ) ) ( not ( = ?AUTO_1595 ?AUTO_1596 ) ) ( not ( = ?AUTO_1597 ?AUTO_1596 ) ) ( ON ?AUTO_1593 ?AUTO_1597 ) ( CLEAR ?AUTO_1594 ) ( not ( = ?AUTO_1592 ?AUTO_1594 ) ) ( not ( = ?AUTO_1593 ?AUTO_1594 ) ) ( not ( = ?AUTO_1595 ?AUTO_1594 ) ) ( not ( = ?AUTO_1597 ?AUTO_1594 ) ) ( not ( = ?AUTO_1596 ?AUTO_1594 ) ) ( ON ?AUTO_1596 ?AUTO_1593 ) ( CLEAR ?AUTO_1596 ) ( HOLDING ?AUTO_1595 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1595 )
      ( MAKE-ON ?AUTO_1592 ?AUTO_1593 )
      ( MAKE-ON-VERIFY ?AUTO_1592 ?AUTO_1593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1598 - BLOCK
      ?AUTO_1599 - BLOCK
    )
    :vars
    (
      ?AUTO_1602 - BLOCK
      ?AUTO_1600 - BLOCK
      ?AUTO_1603 - BLOCK
      ?AUTO_1601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1598 ?AUTO_1599 ) ) ( ON-TABLE ?AUTO_1598 ) ( not ( = ?AUTO_1598 ?AUTO_1602 ) ) ( not ( = ?AUTO_1598 ?AUTO_1600 ) ) ( not ( = ?AUTO_1599 ?AUTO_1602 ) ) ( not ( = ?AUTO_1599 ?AUTO_1600 ) ) ( not ( = ?AUTO_1602 ?AUTO_1600 ) ) ( ON ?AUTO_1602 ?AUTO_1598 ) ( not ( = ?AUTO_1598 ?AUTO_1603 ) ) ( not ( = ?AUTO_1599 ?AUTO_1603 ) ) ( not ( = ?AUTO_1600 ?AUTO_1603 ) ) ( not ( = ?AUTO_1602 ?AUTO_1603 ) ) ( ON ?AUTO_1599 ?AUTO_1602 ) ( CLEAR ?AUTO_1601 ) ( not ( = ?AUTO_1598 ?AUTO_1601 ) ) ( not ( = ?AUTO_1599 ?AUTO_1601 ) ) ( not ( = ?AUTO_1600 ?AUTO_1601 ) ) ( not ( = ?AUTO_1602 ?AUTO_1601 ) ) ( not ( = ?AUTO_1603 ?AUTO_1601 ) ) ( ON ?AUTO_1603 ?AUTO_1599 ) ( ON ?AUTO_1600 ?AUTO_1603 ) ( CLEAR ?AUTO_1600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1600 ?AUTO_1603 )
      ( MAKE-ON ?AUTO_1598 ?AUTO_1599 )
      ( MAKE-ON-VERIFY ?AUTO_1598 ?AUTO_1599 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1605 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1605 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1605 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1605 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1606 - BLOCK
    )
    :vars
    (
      ?AUTO_1607 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1606 ?AUTO_1607 ) ( CLEAR ?AUTO_1606 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1606 ?AUTO_1607 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1606 ?AUTO_1607 )
      ( MAKE-ON-TABLE ?AUTO_1606 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1606 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1608 - BLOCK
    )
    :vars
    (
      ?AUTO_1609 - BLOCK
      ?AUTO_1610 - BLOCK
      ?AUTO_1611 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1608 ?AUTO_1609 ) ( CLEAR ?AUTO_1608 ) ( not ( = ?AUTO_1608 ?AUTO_1609 ) ) ( HOLDING ?AUTO_1610 ) ( CLEAR ?AUTO_1611 ) ( not ( = ?AUTO_1608 ?AUTO_1610 ) ) ( not ( = ?AUTO_1608 ?AUTO_1611 ) ) ( not ( = ?AUTO_1609 ?AUTO_1610 ) ) ( not ( = ?AUTO_1609 ?AUTO_1611 ) ) ( not ( = ?AUTO_1610 ?AUTO_1611 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1610 ?AUTO_1611 )
      ( MAKE-ON-TABLE ?AUTO_1608 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1608 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1616 - BLOCK
    )
    :vars
    (
      ?AUTO_1617 - BLOCK
      ?AUTO_1619 - BLOCK
      ?AUTO_1618 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1616 ?AUTO_1617 ) ( not ( = ?AUTO_1616 ?AUTO_1617 ) ) ( CLEAR ?AUTO_1619 ) ( not ( = ?AUTO_1616 ?AUTO_1618 ) ) ( not ( = ?AUTO_1616 ?AUTO_1619 ) ) ( not ( = ?AUTO_1617 ?AUTO_1618 ) ) ( not ( = ?AUTO_1617 ?AUTO_1619 ) ) ( not ( = ?AUTO_1618 ?AUTO_1619 ) ) ( ON ?AUTO_1618 ?AUTO_1616 ) ( CLEAR ?AUTO_1618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1618 ?AUTO_1616 )
      ( MAKE-ON-TABLE ?AUTO_1616 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1616 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1620 - BLOCK
    )
    :vars
    (
      ?AUTO_1622 - BLOCK
      ?AUTO_1623 - BLOCK
      ?AUTO_1621 - BLOCK
      ?AUTO_1624 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1620 ?AUTO_1622 ) ( not ( = ?AUTO_1620 ?AUTO_1622 ) ) ( CLEAR ?AUTO_1623 ) ( not ( = ?AUTO_1620 ?AUTO_1621 ) ) ( not ( = ?AUTO_1620 ?AUTO_1623 ) ) ( not ( = ?AUTO_1622 ?AUTO_1621 ) ) ( not ( = ?AUTO_1622 ?AUTO_1623 ) ) ( not ( = ?AUTO_1621 ?AUTO_1623 ) ) ( ON ?AUTO_1621 ?AUTO_1620 ) ( CLEAR ?AUTO_1621 ) ( HOLDING ?AUTO_1624 ) ( not ( = ?AUTO_1620 ?AUTO_1624 ) ) ( not ( = ?AUTO_1622 ?AUTO_1624 ) ) ( not ( = ?AUTO_1623 ?AUTO_1624 ) ) ( not ( = ?AUTO_1621 ?AUTO_1624 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1624 )
      ( MAKE-ON-TABLE ?AUTO_1620 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1620 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1625 - BLOCK
    )
    :vars
    (
      ?AUTO_1626 - BLOCK
      ?AUTO_1629 - BLOCK
      ?AUTO_1628 - BLOCK
      ?AUTO_1627 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1625 ?AUTO_1626 ) ( not ( = ?AUTO_1625 ?AUTO_1626 ) ) ( CLEAR ?AUTO_1629 ) ( not ( = ?AUTO_1625 ?AUTO_1628 ) ) ( not ( = ?AUTO_1625 ?AUTO_1629 ) ) ( not ( = ?AUTO_1626 ?AUTO_1628 ) ) ( not ( = ?AUTO_1626 ?AUTO_1629 ) ) ( not ( = ?AUTO_1628 ?AUTO_1629 ) ) ( ON ?AUTO_1628 ?AUTO_1625 ) ( not ( = ?AUTO_1625 ?AUTO_1627 ) ) ( not ( = ?AUTO_1626 ?AUTO_1627 ) ) ( not ( = ?AUTO_1629 ?AUTO_1627 ) ) ( not ( = ?AUTO_1628 ?AUTO_1627 ) ) ( ON ?AUTO_1627 ?AUTO_1628 ) ( CLEAR ?AUTO_1627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1627 ?AUTO_1628 )
      ( MAKE-ON-TABLE ?AUTO_1625 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1625 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1630 - BLOCK
    )
    :vars
    (
      ?AUTO_1634 - BLOCK
      ?AUTO_1633 - BLOCK
      ?AUTO_1631 - BLOCK
      ?AUTO_1632 - BLOCK
      ?AUTO_1635 - BLOCK
      ?AUTO_1636 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1630 ?AUTO_1634 ) ( not ( = ?AUTO_1630 ?AUTO_1634 ) ) ( CLEAR ?AUTO_1633 ) ( not ( = ?AUTO_1630 ?AUTO_1631 ) ) ( not ( = ?AUTO_1630 ?AUTO_1633 ) ) ( not ( = ?AUTO_1634 ?AUTO_1631 ) ) ( not ( = ?AUTO_1634 ?AUTO_1633 ) ) ( not ( = ?AUTO_1631 ?AUTO_1633 ) ) ( ON ?AUTO_1631 ?AUTO_1630 ) ( not ( = ?AUTO_1630 ?AUTO_1632 ) ) ( not ( = ?AUTO_1634 ?AUTO_1632 ) ) ( not ( = ?AUTO_1633 ?AUTO_1632 ) ) ( not ( = ?AUTO_1631 ?AUTO_1632 ) ) ( ON ?AUTO_1632 ?AUTO_1631 ) ( CLEAR ?AUTO_1632 ) ( HOLDING ?AUTO_1635 ) ( CLEAR ?AUTO_1636 ) ( not ( = ?AUTO_1630 ?AUTO_1635 ) ) ( not ( = ?AUTO_1630 ?AUTO_1636 ) ) ( not ( = ?AUTO_1634 ?AUTO_1635 ) ) ( not ( = ?AUTO_1634 ?AUTO_1636 ) ) ( not ( = ?AUTO_1633 ?AUTO_1635 ) ) ( not ( = ?AUTO_1633 ?AUTO_1636 ) ) ( not ( = ?AUTO_1631 ?AUTO_1635 ) ) ( not ( = ?AUTO_1631 ?AUTO_1636 ) ) ( not ( = ?AUTO_1632 ?AUTO_1635 ) ) ( not ( = ?AUTO_1632 ?AUTO_1636 ) ) ( not ( = ?AUTO_1635 ?AUTO_1636 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1635 ?AUTO_1636 )
      ( MAKE-ON-TABLE ?AUTO_1630 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1630 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1638 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1638 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1638 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1638 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1639 - BLOCK
    )
    :vars
    (
      ?AUTO_1640 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1639 ?AUTO_1640 ) ( CLEAR ?AUTO_1639 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1639 ?AUTO_1640 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1639 ?AUTO_1640 )
      ( MAKE-ON-TABLE ?AUTO_1639 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1639 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1642 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1642 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1642 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1642 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1643 - BLOCK
    )
    :vars
    (
      ?AUTO_1644 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1643 ?AUTO_1644 ) ( CLEAR ?AUTO_1643 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1643 ?AUTO_1644 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1643 ?AUTO_1644 )
      ( MAKE-ON-TABLE ?AUTO_1643 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1643 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1645 - BLOCK
    )
    :vars
    (
      ?AUTO_1646 - BLOCK
      ?AUTO_1647 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1645 ?AUTO_1646 ) ( CLEAR ?AUTO_1645 ) ( not ( = ?AUTO_1645 ?AUTO_1646 ) ) ( HOLDING ?AUTO_1647 ) ( not ( = ?AUTO_1645 ?AUTO_1647 ) ) ( not ( = ?AUTO_1646 ?AUTO_1647 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1647 )
      ( MAKE-ON-TABLE ?AUTO_1645 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1645 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1648 - BLOCK
    )
    :vars
    (
      ?AUTO_1650 - BLOCK
      ?AUTO_1649 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1648 ?AUTO_1650 ) ( not ( = ?AUTO_1648 ?AUTO_1650 ) ) ( not ( = ?AUTO_1648 ?AUTO_1649 ) ) ( not ( = ?AUTO_1650 ?AUTO_1649 ) ) ( ON ?AUTO_1649 ?AUTO_1648 ) ( CLEAR ?AUTO_1649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1649 ?AUTO_1648 )
      ( MAKE-ON-TABLE ?AUTO_1648 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1648 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1652 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1652 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1652 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1652 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1653 - BLOCK
    )
    :vars
    (
      ?AUTO_1654 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1653 ?AUTO_1654 ) ( CLEAR ?AUTO_1653 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1653 ?AUTO_1654 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1653 ?AUTO_1654 )
      ( MAKE-ON-TABLE ?AUTO_1653 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1653 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1655 - BLOCK
    )
    :vars
    (
      ?AUTO_1656 - BLOCK
      ?AUTO_1657 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1655 ?AUTO_1656 ) ( CLEAR ?AUTO_1655 ) ( not ( = ?AUTO_1655 ?AUTO_1656 ) ) ( HOLDING ?AUTO_1657 ) ( not ( = ?AUTO_1655 ?AUTO_1657 ) ) ( not ( = ?AUTO_1656 ?AUTO_1657 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1657 )
      ( MAKE-ON-TABLE ?AUTO_1655 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1655 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1658 - BLOCK
    )
    :vars
    (
      ?AUTO_1659 - BLOCK
      ?AUTO_1660 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1658 ?AUTO_1659 ) ( not ( = ?AUTO_1658 ?AUTO_1659 ) ) ( not ( = ?AUTO_1658 ?AUTO_1660 ) ) ( not ( = ?AUTO_1659 ?AUTO_1660 ) ) ( ON ?AUTO_1660 ?AUTO_1658 ) ( CLEAR ?AUTO_1660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1660 ?AUTO_1658 )
      ( MAKE-ON-TABLE ?AUTO_1658 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1658 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1661 - BLOCK
    )
    :vars
    (
      ?AUTO_1662 - BLOCK
      ?AUTO_1663 - BLOCK
      ?AUTO_1664 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1661 ?AUTO_1662 ) ( not ( = ?AUTO_1661 ?AUTO_1662 ) ) ( not ( = ?AUTO_1661 ?AUTO_1663 ) ) ( not ( = ?AUTO_1662 ?AUTO_1663 ) ) ( ON ?AUTO_1663 ?AUTO_1661 ) ( CLEAR ?AUTO_1663 ) ( HOLDING ?AUTO_1664 ) ( not ( = ?AUTO_1661 ?AUTO_1664 ) ) ( not ( = ?AUTO_1662 ?AUTO_1664 ) ) ( not ( = ?AUTO_1663 ?AUTO_1664 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1664 )
      ( MAKE-ON-TABLE ?AUTO_1661 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1661 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1665 - BLOCK
    )
    :vars
    (
      ?AUTO_1666 - BLOCK
      ?AUTO_1667 - BLOCK
      ?AUTO_1668 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1665 ?AUTO_1666 ) ( not ( = ?AUTO_1665 ?AUTO_1666 ) ) ( not ( = ?AUTO_1665 ?AUTO_1667 ) ) ( not ( = ?AUTO_1666 ?AUTO_1667 ) ) ( ON ?AUTO_1667 ?AUTO_1665 ) ( not ( = ?AUTO_1665 ?AUTO_1668 ) ) ( not ( = ?AUTO_1666 ?AUTO_1668 ) ) ( not ( = ?AUTO_1667 ?AUTO_1668 ) ) ( ON ?AUTO_1668 ?AUTO_1667 ) ( CLEAR ?AUTO_1668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1668 ?AUTO_1667 )
      ( MAKE-ON-TABLE ?AUTO_1665 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1665 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1671 - BLOCK
      ?AUTO_1672 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1671 ) ( CLEAR ?AUTO_1672 ) ( not ( = ?AUTO_1671 ?AUTO_1672 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1671 ?AUTO_1672 )
      ( MAKE-ON-VERIFY ?AUTO_1671 ?AUTO_1672 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1673 - BLOCK
      ?AUTO_1674 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1674 ) ( not ( = ?AUTO_1673 ?AUTO_1674 ) ) ( ON-TABLE ?AUTO_1673 ) ( CLEAR ?AUTO_1673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1673 )
      ( MAKE-ON ?AUTO_1673 ?AUTO_1674 )
      ( MAKE-ON-VERIFY ?AUTO_1673 ?AUTO_1674 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1675 - BLOCK
      ?AUTO_1676 - BLOCK
    )
    :vars
    (
      ?AUTO_1677 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1676 ) ( not ( = ?AUTO_1675 ?AUTO_1676 ) ) ( ON-TABLE ?AUTO_1675 ) ( CLEAR ?AUTO_1675 ) ( HOLDING ?AUTO_1677 ) ( not ( = ?AUTO_1675 ?AUTO_1677 ) ) ( not ( = ?AUTO_1676 ?AUTO_1677 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1677 )
      ( MAKE-ON ?AUTO_1675 ?AUTO_1676 )
      ( MAKE-ON-VERIFY ?AUTO_1675 ?AUTO_1676 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1678 - BLOCK
      ?AUTO_1679 - BLOCK
    )
    :vars
    (
      ?AUTO_1680 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1678 ?AUTO_1679 ) ) ( ON-TABLE ?AUTO_1678 ) ( CLEAR ?AUTO_1678 ) ( not ( = ?AUTO_1678 ?AUTO_1680 ) ) ( not ( = ?AUTO_1679 ?AUTO_1680 ) ) ( ON ?AUTO_1680 ?AUTO_1679 ) ( CLEAR ?AUTO_1680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1680 ?AUTO_1679 )
      ( MAKE-ON ?AUTO_1678 ?AUTO_1679 )
      ( MAKE-ON-VERIFY ?AUTO_1678 ?AUTO_1679 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1681 - BLOCK
      ?AUTO_1682 - BLOCK
    )
    :vars
    (
      ?AUTO_1683 - BLOCK
      ?AUTO_1684 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1681 ?AUTO_1682 ) ) ( ON-TABLE ?AUTO_1681 ) ( CLEAR ?AUTO_1681 ) ( not ( = ?AUTO_1681 ?AUTO_1683 ) ) ( not ( = ?AUTO_1682 ?AUTO_1683 ) ) ( ON ?AUTO_1683 ?AUTO_1682 ) ( CLEAR ?AUTO_1683 ) ( HOLDING ?AUTO_1684 ) ( not ( = ?AUTO_1681 ?AUTO_1684 ) ) ( not ( = ?AUTO_1682 ?AUTO_1684 ) ) ( not ( = ?AUTO_1683 ?AUTO_1684 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1684 )
      ( MAKE-ON ?AUTO_1681 ?AUTO_1682 )
      ( MAKE-ON-VERIFY ?AUTO_1681 ?AUTO_1682 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1685 - BLOCK
      ?AUTO_1686 - BLOCK
    )
    :vars
    (
      ?AUTO_1687 - BLOCK
      ?AUTO_1688 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1685 ?AUTO_1686 ) ) ( ON-TABLE ?AUTO_1685 ) ( CLEAR ?AUTO_1685 ) ( not ( = ?AUTO_1685 ?AUTO_1687 ) ) ( not ( = ?AUTO_1686 ?AUTO_1687 ) ) ( ON ?AUTO_1687 ?AUTO_1686 ) ( not ( = ?AUTO_1685 ?AUTO_1688 ) ) ( not ( = ?AUTO_1686 ?AUTO_1688 ) ) ( not ( = ?AUTO_1687 ?AUTO_1688 ) ) ( ON ?AUTO_1688 ?AUTO_1687 ) ( CLEAR ?AUTO_1688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1688 ?AUTO_1687 )
      ( MAKE-ON ?AUTO_1685 ?AUTO_1686 )
      ( MAKE-ON-VERIFY ?AUTO_1685 ?AUTO_1686 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1689 - BLOCK
      ?AUTO_1690 - BLOCK
    )
    :vars
    (
      ?AUTO_1691 - BLOCK
      ?AUTO_1692 - BLOCK
      ?AUTO_1693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1689 ?AUTO_1690 ) ) ( ON-TABLE ?AUTO_1689 ) ( CLEAR ?AUTO_1689 ) ( not ( = ?AUTO_1689 ?AUTO_1691 ) ) ( not ( = ?AUTO_1690 ?AUTO_1691 ) ) ( ON ?AUTO_1691 ?AUTO_1690 ) ( not ( = ?AUTO_1689 ?AUTO_1692 ) ) ( not ( = ?AUTO_1690 ?AUTO_1692 ) ) ( not ( = ?AUTO_1691 ?AUTO_1692 ) ) ( ON ?AUTO_1692 ?AUTO_1691 ) ( CLEAR ?AUTO_1692 ) ( HOLDING ?AUTO_1693 ) ( not ( = ?AUTO_1689 ?AUTO_1693 ) ) ( not ( = ?AUTO_1690 ?AUTO_1693 ) ) ( not ( = ?AUTO_1691 ?AUTO_1693 ) ) ( not ( = ?AUTO_1692 ?AUTO_1693 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1693 )
      ( MAKE-ON ?AUTO_1689 ?AUTO_1690 )
      ( MAKE-ON-VERIFY ?AUTO_1689 ?AUTO_1690 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1694 - BLOCK
      ?AUTO_1695 - BLOCK
    )
    :vars
    (
      ?AUTO_1697 - BLOCK
      ?AUTO_1698 - BLOCK
      ?AUTO_1696 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1694 ?AUTO_1695 ) ) ( ON-TABLE ?AUTO_1694 ) ( CLEAR ?AUTO_1694 ) ( not ( = ?AUTO_1694 ?AUTO_1697 ) ) ( not ( = ?AUTO_1695 ?AUTO_1697 ) ) ( ON ?AUTO_1697 ?AUTO_1695 ) ( not ( = ?AUTO_1694 ?AUTO_1698 ) ) ( not ( = ?AUTO_1695 ?AUTO_1698 ) ) ( not ( = ?AUTO_1697 ?AUTO_1698 ) ) ( ON ?AUTO_1698 ?AUTO_1697 ) ( not ( = ?AUTO_1694 ?AUTO_1696 ) ) ( not ( = ?AUTO_1695 ?AUTO_1696 ) ) ( not ( = ?AUTO_1697 ?AUTO_1696 ) ) ( not ( = ?AUTO_1698 ?AUTO_1696 ) ) ( ON ?AUTO_1696 ?AUTO_1698 ) ( CLEAR ?AUTO_1696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1696 ?AUTO_1698 )
      ( MAKE-ON ?AUTO_1694 ?AUTO_1695 )
      ( MAKE-ON-VERIFY ?AUTO_1694 ?AUTO_1695 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1701 - BLOCK
      ?AUTO_1702 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1701 ) ( CLEAR ?AUTO_1702 ) ( not ( = ?AUTO_1701 ?AUTO_1702 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1701 ?AUTO_1702 )
      ( MAKE-ON-VERIFY ?AUTO_1701 ?AUTO_1702 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1703 - BLOCK
      ?AUTO_1704 - BLOCK
    )
    :vars
    (
      ?AUTO_1705 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1704 ) ( not ( = ?AUTO_1703 ?AUTO_1704 ) ) ( ON ?AUTO_1703 ?AUTO_1705 ) ( CLEAR ?AUTO_1703 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1703 ?AUTO_1705 ) ) ( not ( = ?AUTO_1704 ?AUTO_1705 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1703 ?AUTO_1705 )
      ( MAKE-ON ?AUTO_1703 ?AUTO_1704 )
      ( MAKE-ON-VERIFY ?AUTO_1703 ?AUTO_1704 ) )
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
      ?AUTO_1710 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1707 ) ( not ( = ?AUTO_1706 ?AUTO_1707 ) ) ( ON ?AUTO_1706 ?AUTO_1708 ) ( CLEAR ?AUTO_1706 ) ( not ( = ?AUTO_1706 ?AUTO_1708 ) ) ( not ( = ?AUTO_1707 ?AUTO_1708 ) ) ( HOLDING ?AUTO_1709 ) ( CLEAR ?AUTO_1710 ) ( not ( = ?AUTO_1706 ?AUTO_1709 ) ) ( not ( = ?AUTO_1706 ?AUTO_1710 ) ) ( not ( = ?AUTO_1707 ?AUTO_1709 ) ) ( not ( = ?AUTO_1707 ?AUTO_1710 ) ) ( not ( = ?AUTO_1708 ?AUTO_1709 ) ) ( not ( = ?AUTO_1708 ?AUTO_1710 ) ) ( not ( = ?AUTO_1709 ?AUTO_1710 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1709 ?AUTO_1710 )
      ( MAKE-ON ?AUTO_1706 ?AUTO_1707 )
      ( MAKE-ON-VERIFY ?AUTO_1706 ?AUTO_1707 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1721 - BLOCK
      ?AUTO_1722 - BLOCK
    )
    :vars
    (
      ?AUTO_1723 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1721 ?AUTO_1722 ) ) ( ON ?AUTO_1721 ?AUTO_1723 ) ( CLEAR ?AUTO_1721 ) ( not ( = ?AUTO_1721 ?AUTO_1723 ) ) ( not ( = ?AUTO_1722 ?AUTO_1723 ) ) ( HOLDING ?AUTO_1722 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1722 )
      ( MAKE-ON ?AUTO_1721 ?AUTO_1722 )
      ( MAKE-ON-VERIFY ?AUTO_1721 ?AUTO_1722 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1728 - BLOCK
      ?AUTO_1729 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1728 ) ( CLEAR ?AUTO_1729 ) ( not ( = ?AUTO_1728 ?AUTO_1729 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1728 ?AUTO_1729 )
      ( MAKE-ON-VERIFY ?AUTO_1728 ?AUTO_1729 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1730 - BLOCK
      ?AUTO_1731 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1731 ) ( not ( = ?AUTO_1730 ?AUTO_1731 ) ) ( ON-TABLE ?AUTO_1730 ) ( CLEAR ?AUTO_1730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1730 )
      ( MAKE-ON ?AUTO_1730 ?AUTO_1731 )
      ( MAKE-ON-VERIFY ?AUTO_1730 ?AUTO_1731 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1732 - BLOCK
      ?AUTO_1733 - BLOCK
    )
    :vars
    (
      ?AUTO_1734 - BLOCK
      ?AUTO_1735 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1733 ) ( not ( = ?AUTO_1732 ?AUTO_1733 ) ) ( ON-TABLE ?AUTO_1732 ) ( CLEAR ?AUTO_1732 ) ( HOLDING ?AUTO_1734 ) ( CLEAR ?AUTO_1735 ) ( not ( = ?AUTO_1732 ?AUTO_1734 ) ) ( not ( = ?AUTO_1732 ?AUTO_1735 ) ) ( not ( = ?AUTO_1733 ?AUTO_1734 ) ) ( not ( = ?AUTO_1733 ?AUTO_1735 ) ) ( not ( = ?AUTO_1734 ?AUTO_1735 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1734 ?AUTO_1735 )
      ( MAKE-ON ?AUTO_1732 ?AUTO_1733 )
      ( MAKE-ON-VERIFY ?AUTO_1732 ?AUTO_1733 ) )
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
    )
    :precondition
    ( and ( CLEAR ?AUTO_1737 ) ( not ( = ?AUTO_1736 ?AUTO_1737 ) ) ( ON-TABLE ?AUTO_1736 ) ( CLEAR ?AUTO_1738 ) ( not ( = ?AUTO_1736 ?AUTO_1739 ) ) ( not ( = ?AUTO_1736 ?AUTO_1738 ) ) ( not ( = ?AUTO_1737 ?AUTO_1739 ) ) ( not ( = ?AUTO_1737 ?AUTO_1738 ) ) ( not ( = ?AUTO_1739 ?AUTO_1738 ) ) ( ON ?AUTO_1739 ?AUTO_1736 ) ( CLEAR ?AUTO_1739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1739 ?AUTO_1736 )
      ( MAKE-ON ?AUTO_1736 ?AUTO_1737 )
      ( MAKE-ON-VERIFY ?AUTO_1736 ?AUTO_1737 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1740 - BLOCK
      ?AUTO_1741 - BLOCK
    )
    :vars
    (
      ?AUTO_1743 - BLOCK
      ?AUTO_1742 - BLOCK
      ?AUTO_1744 - BLOCK
      ?AUTO_1745 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1741 ) ( not ( = ?AUTO_1740 ?AUTO_1741 ) ) ( ON-TABLE ?AUTO_1740 ) ( CLEAR ?AUTO_1743 ) ( not ( = ?AUTO_1740 ?AUTO_1742 ) ) ( not ( = ?AUTO_1740 ?AUTO_1743 ) ) ( not ( = ?AUTO_1741 ?AUTO_1742 ) ) ( not ( = ?AUTO_1741 ?AUTO_1743 ) ) ( not ( = ?AUTO_1742 ?AUTO_1743 ) ) ( ON ?AUTO_1742 ?AUTO_1740 ) ( CLEAR ?AUTO_1742 ) ( HOLDING ?AUTO_1744 ) ( CLEAR ?AUTO_1745 ) ( not ( = ?AUTO_1740 ?AUTO_1744 ) ) ( not ( = ?AUTO_1740 ?AUTO_1745 ) ) ( not ( = ?AUTO_1741 ?AUTO_1744 ) ) ( not ( = ?AUTO_1741 ?AUTO_1745 ) ) ( not ( = ?AUTO_1743 ?AUTO_1744 ) ) ( not ( = ?AUTO_1743 ?AUTO_1745 ) ) ( not ( = ?AUTO_1742 ?AUTO_1744 ) ) ( not ( = ?AUTO_1742 ?AUTO_1745 ) ) ( not ( = ?AUTO_1744 ?AUTO_1745 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1744 ?AUTO_1745 )
      ( MAKE-ON ?AUTO_1740 ?AUTO_1741 )
      ( MAKE-ON-VERIFY ?AUTO_1740 ?AUTO_1741 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1752 - BLOCK
      ?AUTO_1753 - BLOCK
    )
    :vars
    (
      ?AUTO_1755 - BLOCK
      ?AUTO_1754 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1752 ?AUTO_1753 ) ) ( ON-TABLE ?AUTO_1752 ) ( CLEAR ?AUTO_1755 ) ( not ( = ?AUTO_1752 ?AUTO_1754 ) ) ( not ( = ?AUTO_1752 ?AUTO_1755 ) ) ( not ( = ?AUTO_1753 ?AUTO_1754 ) ) ( not ( = ?AUTO_1753 ?AUTO_1755 ) ) ( not ( = ?AUTO_1754 ?AUTO_1755 ) ) ( ON ?AUTO_1754 ?AUTO_1752 ) ( CLEAR ?AUTO_1754 ) ( HOLDING ?AUTO_1753 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1753 )
      ( MAKE-ON ?AUTO_1752 ?AUTO_1753 )
      ( MAKE-ON-VERIFY ?AUTO_1752 ?AUTO_1753 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1760 - BLOCK
      ?AUTO_1761 - BLOCK
    )
    :vars
    (
      ?AUTO_1765 - BLOCK
      ?AUTO_1762 - BLOCK
      ?AUTO_1763 - BLOCK
      ?AUTO_1764 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1760 ?AUTO_1761 ) ) ( ON-TABLE ?AUTO_1760 ) ( CLEAR ?AUTO_1765 ) ( not ( = ?AUTO_1760 ?AUTO_1762 ) ) ( not ( = ?AUTO_1760 ?AUTO_1765 ) ) ( not ( = ?AUTO_1761 ?AUTO_1762 ) ) ( not ( = ?AUTO_1761 ?AUTO_1765 ) ) ( not ( = ?AUTO_1762 ?AUTO_1765 ) ) ( ON ?AUTO_1762 ?AUTO_1760 ) ( CLEAR ?AUTO_1762 ) ( CLEAR ?AUTO_1763 ) ( not ( = ?AUTO_1760 ?AUTO_1764 ) ) ( not ( = ?AUTO_1760 ?AUTO_1763 ) ) ( not ( = ?AUTO_1761 ?AUTO_1764 ) ) ( not ( = ?AUTO_1761 ?AUTO_1763 ) ) ( not ( = ?AUTO_1765 ?AUTO_1764 ) ) ( not ( = ?AUTO_1765 ?AUTO_1763 ) ) ( not ( = ?AUTO_1762 ?AUTO_1764 ) ) ( not ( = ?AUTO_1762 ?AUTO_1763 ) ) ( not ( = ?AUTO_1764 ?AUTO_1763 ) ) ( ON ?AUTO_1764 ?AUTO_1761 ) ( CLEAR ?AUTO_1764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1764 ?AUTO_1761 )
      ( MAKE-ON ?AUTO_1760 ?AUTO_1761 )
      ( MAKE-ON-VERIFY ?AUTO_1760 ?AUTO_1761 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1768 - BLOCK
      ?AUTO_1769 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1768 ) ( CLEAR ?AUTO_1769 ) ( not ( = ?AUTO_1768 ?AUTO_1769 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1768 ?AUTO_1769 )
      ( MAKE-ON-VERIFY ?AUTO_1768 ?AUTO_1769 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1770 - BLOCK
      ?AUTO_1771 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1771 ) ( not ( = ?AUTO_1770 ?AUTO_1771 ) ) ( ON-TABLE ?AUTO_1770 ) ( CLEAR ?AUTO_1770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1770 )
      ( MAKE-ON ?AUTO_1770 ?AUTO_1771 )
      ( MAKE-ON-VERIFY ?AUTO_1770 ?AUTO_1771 ) )
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
      ?AUTO_1775 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1773 ) ( not ( = ?AUTO_1772 ?AUTO_1773 ) ) ( ON-TABLE ?AUTO_1772 ) ( CLEAR ?AUTO_1772 ) ( HOLDING ?AUTO_1774 ) ( CLEAR ?AUTO_1775 ) ( not ( = ?AUTO_1772 ?AUTO_1774 ) ) ( not ( = ?AUTO_1772 ?AUTO_1775 ) ) ( not ( = ?AUTO_1773 ?AUTO_1774 ) ) ( not ( = ?AUTO_1773 ?AUTO_1775 ) ) ( not ( = ?AUTO_1774 ?AUTO_1775 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1774 ?AUTO_1775 )
      ( MAKE-ON ?AUTO_1772 ?AUTO_1773 )
      ( MAKE-ON-VERIFY ?AUTO_1772 ?AUTO_1773 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1782 - BLOCK
      ?AUTO_1783 - BLOCK
    )
    :vars
    (
      ?AUTO_1784 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1782 ?AUTO_1783 ) ) ( ON-TABLE ?AUTO_1782 ) ( CLEAR ?AUTO_1782 ) ( HOLDING ?AUTO_1783 ) ( CLEAR ?AUTO_1784 ) ( not ( = ?AUTO_1782 ?AUTO_1784 ) ) ( not ( = ?AUTO_1783 ?AUTO_1784 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1783 ?AUTO_1784 )
      ( MAKE-ON ?AUTO_1782 ?AUTO_1783 )
      ( MAKE-ON-VERIFY ?AUTO_1782 ?AUTO_1783 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1787 - BLOCK
      ?AUTO_1788 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1787 ) ( CLEAR ?AUTO_1788 ) ( not ( = ?AUTO_1787 ?AUTO_1788 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1787 ?AUTO_1788 )
      ( MAKE-ON-VERIFY ?AUTO_1787 ?AUTO_1788 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1789 - BLOCK
      ?AUTO_1790 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1790 ) ( not ( = ?AUTO_1789 ?AUTO_1790 ) ) ( ON-TABLE ?AUTO_1789 ) ( CLEAR ?AUTO_1789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1789 )
      ( MAKE-ON ?AUTO_1789 ?AUTO_1790 )
      ( MAKE-ON-VERIFY ?AUTO_1789 ?AUTO_1790 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1792 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1792 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1792 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1792 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1793 - BLOCK
    )
    :vars
    (
      ?AUTO_1794 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1793 ?AUTO_1794 ) ( CLEAR ?AUTO_1793 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1793 ?AUTO_1794 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1793 ?AUTO_1794 )
      ( MAKE-ON-TABLE ?AUTO_1793 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1793 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1795 - BLOCK
    )
    :vars
    (
      ?AUTO_1796 - BLOCK
      ?AUTO_1797 - BLOCK
      ?AUTO_1798 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1795 ?AUTO_1796 ) ( CLEAR ?AUTO_1795 ) ( not ( = ?AUTO_1795 ?AUTO_1796 ) ) ( HOLDING ?AUTO_1797 ) ( CLEAR ?AUTO_1798 ) ( not ( = ?AUTO_1795 ?AUTO_1797 ) ) ( not ( = ?AUTO_1795 ?AUTO_1798 ) ) ( not ( = ?AUTO_1796 ?AUTO_1797 ) ) ( not ( = ?AUTO_1796 ?AUTO_1798 ) ) ( not ( = ?AUTO_1797 ?AUTO_1798 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1797 ?AUTO_1798 )
      ( MAKE-ON-TABLE ?AUTO_1795 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1795 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1801 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1801 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1801 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1801 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1802 - BLOCK
    )
    :vars
    (
      ?AUTO_1803 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1802 ?AUTO_1803 ) ( CLEAR ?AUTO_1802 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1802 ?AUTO_1803 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1802 ?AUTO_1803 )
      ( MAKE-ON-TABLE ?AUTO_1802 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1802 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1804 - BLOCK
    )
    :vars
    (
      ?AUTO_1805 - BLOCK
      ?AUTO_1806 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1804 ?AUTO_1805 ) ( CLEAR ?AUTO_1804 ) ( not ( = ?AUTO_1804 ?AUTO_1805 ) ) ( HOLDING ?AUTO_1806 ) ( not ( = ?AUTO_1804 ?AUTO_1806 ) ) ( not ( = ?AUTO_1805 ?AUTO_1806 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1806 )
      ( MAKE-ON-TABLE ?AUTO_1804 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1804 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1807 - BLOCK
    )
    :vars
    (
      ?AUTO_1808 - BLOCK
      ?AUTO_1809 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1807 ?AUTO_1808 ) ( not ( = ?AUTO_1807 ?AUTO_1808 ) ) ( not ( = ?AUTO_1807 ?AUTO_1809 ) ) ( not ( = ?AUTO_1808 ?AUTO_1809 ) ) ( ON ?AUTO_1809 ?AUTO_1807 ) ( CLEAR ?AUTO_1809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1809 ?AUTO_1807 )
      ( MAKE-ON-TABLE ?AUTO_1807 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1807 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1810 - BLOCK
    )
    :vars
    (
      ?AUTO_1812 - BLOCK
      ?AUTO_1811 - BLOCK
      ?AUTO_1813 - BLOCK
      ?AUTO_1814 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1810 ?AUTO_1812 ) ( not ( = ?AUTO_1810 ?AUTO_1812 ) ) ( not ( = ?AUTO_1810 ?AUTO_1811 ) ) ( not ( = ?AUTO_1812 ?AUTO_1811 ) ) ( ON ?AUTO_1811 ?AUTO_1810 ) ( CLEAR ?AUTO_1811 ) ( HOLDING ?AUTO_1813 ) ( CLEAR ?AUTO_1814 ) ( not ( = ?AUTO_1810 ?AUTO_1813 ) ) ( not ( = ?AUTO_1810 ?AUTO_1814 ) ) ( not ( = ?AUTO_1812 ?AUTO_1813 ) ) ( not ( = ?AUTO_1812 ?AUTO_1814 ) ) ( not ( = ?AUTO_1811 ?AUTO_1813 ) ) ( not ( = ?AUTO_1811 ?AUTO_1814 ) ) ( not ( = ?AUTO_1813 ?AUTO_1814 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1813 ?AUTO_1814 )
      ( MAKE-ON-TABLE ?AUTO_1810 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1810 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1817 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1817 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1817 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1817 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1818 - BLOCK
    )
    :vars
    (
      ?AUTO_1819 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1818 ?AUTO_1819 ) ( CLEAR ?AUTO_1818 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1818 ?AUTO_1819 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1818 ?AUTO_1819 )
      ( MAKE-ON-TABLE ?AUTO_1818 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1818 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1820 - BLOCK
    )
    :vars
    (
      ?AUTO_1821 - BLOCK
      ?AUTO_1822 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1820 ?AUTO_1821 ) ( CLEAR ?AUTO_1820 ) ( not ( = ?AUTO_1820 ?AUTO_1821 ) ) ( HOLDING ?AUTO_1822 ) ( not ( = ?AUTO_1820 ?AUTO_1822 ) ) ( not ( = ?AUTO_1821 ?AUTO_1822 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1822 )
      ( MAKE-ON-TABLE ?AUTO_1820 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1820 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1823 - BLOCK
    )
    :vars
    (
      ?AUTO_1824 - BLOCK
      ?AUTO_1825 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1823 ?AUTO_1824 ) ( not ( = ?AUTO_1823 ?AUTO_1824 ) ) ( not ( = ?AUTO_1823 ?AUTO_1825 ) ) ( not ( = ?AUTO_1824 ?AUTO_1825 ) ) ( ON ?AUTO_1825 ?AUTO_1823 ) ( CLEAR ?AUTO_1825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1825 ?AUTO_1823 )
      ( MAKE-ON-TABLE ?AUTO_1823 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1823 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1826 - BLOCK
    )
    :vars
    (
      ?AUTO_1828 - BLOCK
      ?AUTO_1827 - BLOCK
      ?AUTO_1829 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1826 ?AUTO_1828 ) ( not ( = ?AUTO_1826 ?AUTO_1828 ) ) ( not ( = ?AUTO_1826 ?AUTO_1827 ) ) ( not ( = ?AUTO_1828 ?AUTO_1827 ) ) ( ON ?AUTO_1827 ?AUTO_1826 ) ( CLEAR ?AUTO_1827 ) ( HOLDING ?AUTO_1829 ) ( not ( = ?AUTO_1826 ?AUTO_1829 ) ) ( not ( = ?AUTO_1828 ?AUTO_1829 ) ) ( not ( = ?AUTO_1827 ?AUTO_1829 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1829 )
      ( MAKE-ON-TABLE ?AUTO_1826 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1826 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1830 - BLOCK
    )
    :vars
    (
      ?AUTO_1832 - BLOCK
      ?AUTO_1831 - BLOCK
      ?AUTO_1833 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1830 ?AUTO_1832 ) ( not ( = ?AUTO_1830 ?AUTO_1832 ) ) ( not ( = ?AUTO_1830 ?AUTO_1831 ) ) ( not ( = ?AUTO_1832 ?AUTO_1831 ) ) ( ON ?AUTO_1831 ?AUTO_1830 ) ( not ( = ?AUTO_1830 ?AUTO_1833 ) ) ( not ( = ?AUTO_1832 ?AUTO_1833 ) ) ( not ( = ?AUTO_1831 ?AUTO_1833 ) ) ( ON ?AUTO_1833 ?AUTO_1831 ) ( CLEAR ?AUTO_1833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1833 ?AUTO_1831 )
      ( MAKE-ON-TABLE ?AUTO_1830 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1830 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1834 - BLOCK
    )
    :vars
    (
      ?AUTO_1835 - BLOCK
      ?AUTO_1836 - BLOCK
      ?AUTO_1837 - BLOCK
      ?AUTO_1838 - BLOCK
      ?AUTO_1839 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1834 ?AUTO_1835 ) ( not ( = ?AUTO_1834 ?AUTO_1835 ) ) ( not ( = ?AUTO_1834 ?AUTO_1836 ) ) ( not ( = ?AUTO_1835 ?AUTO_1836 ) ) ( ON ?AUTO_1836 ?AUTO_1834 ) ( not ( = ?AUTO_1834 ?AUTO_1837 ) ) ( not ( = ?AUTO_1835 ?AUTO_1837 ) ) ( not ( = ?AUTO_1836 ?AUTO_1837 ) ) ( ON ?AUTO_1837 ?AUTO_1836 ) ( CLEAR ?AUTO_1837 ) ( HOLDING ?AUTO_1838 ) ( CLEAR ?AUTO_1839 ) ( not ( = ?AUTO_1834 ?AUTO_1838 ) ) ( not ( = ?AUTO_1834 ?AUTO_1839 ) ) ( not ( = ?AUTO_1835 ?AUTO_1838 ) ) ( not ( = ?AUTO_1835 ?AUTO_1839 ) ) ( not ( = ?AUTO_1836 ?AUTO_1838 ) ) ( not ( = ?AUTO_1836 ?AUTO_1839 ) ) ( not ( = ?AUTO_1837 ?AUTO_1838 ) ) ( not ( = ?AUTO_1837 ?AUTO_1839 ) ) ( not ( = ?AUTO_1838 ?AUTO_1839 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1838 ?AUTO_1839 )
      ( MAKE-ON-TABLE ?AUTO_1834 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1834 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1843 - BLOCK
      ?AUTO_1844 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1843 ) ( CLEAR ?AUTO_1844 ) ( not ( = ?AUTO_1843 ?AUTO_1844 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1843 ?AUTO_1844 )
      ( MAKE-ON-VERIFY ?AUTO_1843 ?AUTO_1844 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1845 - BLOCK
      ?AUTO_1846 - BLOCK
    )
    :vars
    (
      ?AUTO_1847 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1846 ) ( not ( = ?AUTO_1845 ?AUTO_1846 ) ) ( ON ?AUTO_1845 ?AUTO_1847 ) ( CLEAR ?AUTO_1845 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1845 ?AUTO_1847 ) ) ( not ( = ?AUTO_1846 ?AUTO_1847 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1845 ?AUTO_1847 )
      ( MAKE-ON ?AUTO_1845 ?AUTO_1846 )
      ( MAKE-ON-VERIFY ?AUTO_1845 ?AUTO_1846 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1848 - BLOCK
      ?AUTO_1849 - BLOCK
    )
    :vars
    (
      ?AUTO_1850 - BLOCK
      ?AUTO_1851 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1849 ) ( not ( = ?AUTO_1848 ?AUTO_1849 ) ) ( ON ?AUTO_1848 ?AUTO_1850 ) ( CLEAR ?AUTO_1848 ) ( not ( = ?AUTO_1848 ?AUTO_1850 ) ) ( not ( = ?AUTO_1849 ?AUTO_1850 ) ) ( HOLDING ?AUTO_1851 ) ( not ( = ?AUTO_1848 ?AUTO_1851 ) ) ( not ( = ?AUTO_1849 ?AUTO_1851 ) ) ( not ( = ?AUTO_1850 ?AUTO_1851 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1851 )
      ( MAKE-ON ?AUTO_1848 ?AUTO_1849 )
      ( MAKE-ON-VERIFY ?AUTO_1848 ?AUTO_1849 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1852 - BLOCK
      ?AUTO_1853 - BLOCK
    )
    :vars
    (
      ?AUTO_1855 - BLOCK
      ?AUTO_1854 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1853 ) ( not ( = ?AUTO_1852 ?AUTO_1853 ) ) ( ON ?AUTO_1852 ?AUTO_1855 ) ( not ( = ?AUTO_1852 ?AUTO_1855 ) ) ( not ( = ?AUTO_1853 ?AUTO_1855 ) ) ( not ( = ?AUTO_1852 ?AUTO_1854 ) ) ( not ( = ?AUTO_1853 ?AUTO_1854 ) ) ( not ( = ?AUTO_1855 ?AUTO_1854 ) ) ( ON ?AUTO_1854 ?AUTO_1852 ) ( CLEAR ?AUTO_1854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1854 ?AUTO_1852 )
      ( MAKE-ON ?AUTO_1852 ?AUTO_1853 )
      ( MAKE-ON-VERIFY ?AUTO_1852 ?AUTO_1853 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1856 - BLOCK
      ?AUTO_1857 - BLOCK
    )
    :vars
    (
      ?AUTO_1859 - BLOCK
      ?AUTO_1858 - BLOCK
      ?AUTO_1860 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1857 ) ( not ( = ?AUTO_1856 ?AUTO_1857 ) ) ( ON ?AUTO_1856 ?AUTO_1859 ) ( not ( = ?AUTO_1856 ?AUTO_1859 ) ) ( not ( = ?AUTO_1857 ?AUTO_1859 ) ) ( not ( = ?AUTO_1856 ?AUTO_1858 ) ) ( not ( = ?AUTO_1857 ?AUTO_1858 ) ) ( not ( = ?AUTO_1859 ?AUTO_1858 ) ) ( ON ?AUTO_1858 ?AUTO_1856 ) ( CLEAR ?AUTO_1858 ) ( HOLDING ?AUTO_1860 ) ( not ( = ?AUTO_1856 ?AUTO_1860 ) ) ( not ( = ?AUTO_1857 ?AUTO_1860 ) ) ( not ( = ?AUTO_1859 ?AUTO_1860 ) ) ( not ( = ?AUTO_1858 ?AUTO_1860 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1860 )
      ( MAKE-ON ?AUTO_1856 ?AUTO_1857 )
      ( MAKE-ON-VERIFY ?AUTO_1856 ?AUTO_1857 ) )
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
      ?AUTO_1863 - BLOCK
      ?AUTO_1865 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1862 ) ( not ( = ?AUTO_1861 ?AUTO_1862 ) ) ( ON ?AUTO_1861 ?AUTO_1864 ) ( not ( = ?AUTO_1861 ?AUTO_1864 ) ) ( not ( = ?AUTO_1862 ?AUTO_1864 ) ) ( not ( = ?AUTO_1861 ?AUTO_1863 ) ) ( not ( = ?AUTO_1862 ?AUTO_1863 ) ) ( not ( = ?AUTO_1864 ?AUTO_1863 ) ) ( ON ?AUTO_1863 ?AUTO_1861 ) ( not ( = ?AUTO_1861 ?AUTO_1865 ) ) ( not ( = ?AUTO_1862 ?AUTO_1865 ) ) ( not ( = ?AUTO_1864 ?AUTO_1865 ) ) ( not ( = ?AUTO_1863 ?AUTO_1865 ) ) ( ON ?AUTO_1865 ?AUTO_1863 ) ( CLEAR ?AUTO_1865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1865 ?AUTO_1863 )
      ( MAKE-ON ?AUTO_1861 ?AUTO_1862 )
      ( MAKE-ON-VERIFY ?AUTO_1861 ?AUTO_1862 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1866 - BLOCK
      ?AUTO_1867 - BLOCK
    )
    :vars
    (
      ?AUTO_1869 - BLOCK
      ?AUTO_1868 - BLOCK
      ?AUTO_1870 - BLOCK
      ?AUTO_1871 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1867 ) ( not ( = ?AUTO_1866 ?AUTO_1867 ) ) ( ON ?AUTO_1866 ?AUTO_1869 ) ( not ( = ?AUTO_1866 ?AUTO_1869 ) ) ( not ( = ?AUTO_1867 ?AUTO_1869 ) ) ( not ( = ?AUTO_1866 ?AUTO_1868 ) ) ( not ( = ?AUTO_1867 ?AUTO_1868 ) ) ( not ( = ?AUTO_1869 ?AUTO_1868 ) ) ( ON ?AUTO_1868 ?AUTO_1866 ) ( not ( = ?AUTO_1866 ?AUTO_1870 ) ) ( not ( = ?AUTO_1867 ?AUTO_1870 ) ) ( not ( = ?AUTO_1869 ?AUTO_1870 ) ) ( not ( = ?AUTO_1868 ?AUTO_1870 ) ) ( ON ?AUTO_1870 ?AUTO_1868 ) ( CLEAR ?AUTO_1870 ) ( HOLDING ?AUTO_1871 ) ( not ( = ?AUTO_1866 ?AUTO_1871 ) ) ( not ( = ?AUTO_1867 ?AUTO_1871 ) ) ( not ( = ?AUTO_1869 ?AUTO_1871 ) ) ( not ( = ?AUTO_1868 ?AUTO_1871 ) ) ( not ( = ?AUTO_1870 ?AUTO_1871 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1871 )
      ( MAKE-ON ?AUTO_1866 ?AUTO_1867 )
      ( MAKE-ON-VERIFY ?AUTO_1866 ?AUTO_1867 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1872 - BLOCK
      ?AUTO_1873 - BLOCK
    )
    :vars
    (
      ?AUTO_1874 - BLOCK
      ?AUTO_1875 - BLOCK
      ?AUTO_1877 - BLOCK
      ?AUTO_1876 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1873 ) ( not ( = ?AUTO_1872 ?AUTO_1873 ) ) ( ON ?AUTO_1872 ?AUTO_1874 ) ( not ( = ?AUTO_1872 ?AUTO_1874 ) ) ( not ( = ?AUTO_1873 ?AUTO_1874 ) ) ( not ( = ?AUTO_1872 ?AUTO_1875 ) ) ( not ( = ?AUTO_1873 ?AUTO_1875 ) ) ( not ( = ?AUTO_1874 ?AUTO_1875 ) ) ( ON ?AUTO_1875 ?AUTO_1872 ) ( not ( = ?AUTO_1872 ?AUTO_1877 ) ) ( not ( = ?AUTO_1873 ?AUTO_1877 ) ) ( not ( = ?AUTO_1874 ?AUTO_1877 ) ) ( not ( = ?AUTO_1875 ?AUTO_1877 ) ) ( ON ?AUTO_1877 ?AUTO_1875 ) ( not ( = ?AUTO_1872 ?AUTO_1876 ) ) ( not ( = ?AUTO_1873 ?AUTO_1876 ) ) ( not ( = ?AUTO_1874 ?AUTO_1876 ) ) ( not ( = ?AUTO_1875 ?AUTO_1876 ) ) ( not ( = ?AUTO_1877 ?AUTO_1876 ) ) ( ON ?AUTO_1876 ?AUTO_1877 ) ( CLEAR ?AUTO_1876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1876 ?AUTO_1877 )
      ( MAKE-ON ?AUTO_1872 ?AUTO_1873 )
      ( MAKE-ON-VERIFY ?AUTO_1872 ?AUTO_1873 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1878 - BLOCK
      ?AUTO_1879 - BLOCK
    )
    :vars
    (
      ?AUTO_1880 - BLOCK
      ?AUTO_1881 - BLOCK
      ?AUTO_1883 - BLOCK
      ?AUTO_1882 - BLOCK
      ?AUTO_1884 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1878 ?AUTO_1879 ) ) ( ON ?AUTO_1878 ?AUTO_1880 ) ( not ( = ?AUTO_1878 ?AUTO_1880 ) ) ( not ( = ?AUTO_1879 ?AUTO_1880 ) ) ( not ( = ?AUTO_1878 ?AUTO_1881 ) ) ( not ( = ?AUTO_1879 ?AUTO_1881 ) ) ( not ( = ?AUTO_1880 ?AUTO_1881 ) ) ( ON ?AUTO_1881 ?AUTO_1878 ) ( not ( = ?AUTO_1878 ?AUTO_1883 ) ) ( not ( = ?AUTO_1879 ?AUTO_1883 ) ) ( not ( = ?AUTO_1880 ?AUTO_1883 ) ) ( not ( = ?AUTO_1881 ?AUTO_1883 ) ) ( ON ?AUTO_1883 ?AUTO_1881 ) ( not ( = ?AUTO_1878 ?AUTO_1882 ) ) ( not ( = ?AUTO_1879 ?AUTO_1882 ) ) ( not ( = ?AUTO_1880 ?AUTO_1882 ) ) ( not ( = ?AUTO_1881 ?AUTO_1882 ) ) ( not ( = ?AUTO_1883 ?AUTO_1882 ) ) ( ON ?AUTO_1882 ?AUTO_1883 ) ( CLEAR ?AUTO_1882 ) ( HOLDING ?AUTO_1879 ) ( CLEAR ?AUTO_1884 ) ( not ( = ?AUTO_1878 ?AUTO_1884 ) ) ( not ( = ?AUTO_1879 ?AUTO_1884 ) ) ( not ( = ?AUTO_1880 ?AUTO_1884 ) ) ( not ( = ?AUTO_1881 ?AUTO_1884 ) ) ( not ( = ?AUTO_1883 ?AUTO_1884 ) ) ( not ( = ?AUTO_1882 ?AUTO_1884 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1879 ?AUTO_1884 )
      ( MAKE-ON ?AUTO_1878 ?AUTO_1879 )
      ( MAKE-ON-VERIFY ?AUTO_1878 ?AUTO_1879 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1889 - BLOCK
      ?AUTO_1890 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1889 ) ( CLEAR ?AUTO_1890 ) ( not ( = ?AUTO_1889 ?AUTO_1890 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1889 ?AUTO_1890 )
      ( MAKE-ON-VERIFY ?AUTO_1889 ?AUTO_1890 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1891 - BLOCK
      ?AUTO_1892 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1892 ) ( not ( = ?AUTO_1891 ?AUTO_1892 ) ) ( ON-TABLE ?AUTO_1891 ) ( CLEAR ?AUTO_1891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1891 )
      ( MAKE-ON ?AUTO_1891 ?AUTO_1892 )
      ( MAKE-ON-VERIFY ?AUTO_1891 ?AUTO_1892 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1893 - BLOCK
      ?AUTO_1894 - BLOCK
    )
    :vars
    (
      ?AUTO_1895 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1893 ?AUTO_1894 ) ) ( ON-TABLE ?AUTO_1893 ) ( CLEAR ?AUTO_1893 ) ( HOLDING ?AUTO_1894 ) ( CLEAR ?AUTO_1895 ) ( not ( = ?AUTO_1893 ?AUTO_1895 ) ) ( not ( = ?AUTO_1894 ?AUTO_1895 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1894 ?AUTO_1895 )
      ( MAKE-ON ?AUTO_1893 ?AUTO_1894 )
      ( MAKE-ON-VERIFY ?AUTO_1893 ?AUTO_1894 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1896 - BLOCK
      ?AUTO_1897 - BLOCK
    )
    :vars
    (
      ?AUTO_1898 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1896 ?AUTO_1897 ) ) ( ON-TABLE ?AUTO_1896 ) ( CLEAR ?AUTO_1898 ) ( not ( = ?AUTO_1896 ?AUTO_1898 ) ) ( not ( = ?AUTO_1897 ?AUTO_1898 ) ) ( ON ?AUTO_1897 ?AUTO_1896 ) ( CLEAR ?AUTO_1897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1897 ?AUTO_1896 )
      ( MAKE-ON ?AUTO_1896 ?AUTO_1897 )
      ( MAKE-ON-VERIFY ?AUTO_1896 ?AUTO_1897 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1899 - BLOCK
      ?AUTO_1900 - BLOCK
    )
    :vars
    (
      ?AUTO_1901 - BLOCK
      ?AUTO_1902 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1899 ?AUTO_1900 ) ) ( ON-TABLE ?AUTO_1899 ) ( CLEAR ?AUTO_1901 ) ( not ( = ?AUTO_1899 ?AUTO_1901 ) ) ( not ( = ?AUTO_1900 ?AUTO_1901 ) ) ( ON ?AUTO_1900 ?AUTO_1899 ) ( CLEAR ?AUTO_1900 ) ( HOLDING ?AUTO_1902 ) ( not ( = ?AUTO_1899 ?AUTO_1902 ) ) ( not ( = ?AUTO_1900 ?AUTO_1902 ) ) ( not ( = ?AUTO_1901 ?AUTO_1902 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1902 )
      ( MAKE-ON ?AUTO_1899 ?AUTO_1900 )
      ( MAKE-ON-VERIFY ?AUTO_1899 ?AUTO_1900 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1903 - BLOCK
      ?AUTO_1904 - BLOCK
    )
    :vars
    (
      ?AUTO_1905 - BLOCK
      ?AUTO_1906 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1903 ?AUTO_1904 ) ) ( ON-TABLE ?AUTO_1903 ) ( CLEAR ?AUTO_1905 ) ( not ( = ?AUTO_1903 ?AUTO_1905 ) ) ( not ( = ?AUTO_1904 ?AUTO_1905 ) ) ( ON ?AUTO_1904 ?AUTO_1903 ) ( not ( = ?AUTO_1903 ?AUTO_1906 ) ) ( not ( = ?AUTO_1904 ?AUTO_1906 ) ) ( not ( = ?AUTO_1905 ?AUTO_1906 ) ) ( ON ?AUTO_1906 ?AUTO_1904 ) ( CLEAR ?AUTO_1906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1906 ?AUTO_1904 )
      ( MAKE-ON ?AUTO_1903 ?AUTO_1904 )
      ( MAKE-ON-VERIFY ?AUTO_1903 ?AUTO_1904 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1907 - BLOCK
      ?AUTO_1908 - BLOCK
    )
    :vars
    (
      ?AUTO_1909 - BLOCK
      ?AUTO_1910 - BLOCK
      ?AUTO_1911 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1907 ?AUTO_1908 ) ) ( ON-TABLE ?AUTO_1907 ) ( CLEAR ?AUTO_1909 ) ( not ( = ?AUTO_1907 ?AUTO_1909 ) ) ( not ( = ?AUTO_1908 ?AUTO_1909 ) ) ( ON ?AUTO_1908 ?AUTO_1907 ) ( not ( = ?AUTO_1907 ?AUTO_1910 ) ) ( not ( = ?AUTO_1908 ?AUTO_1910 ) ) ( not ( = ?AUTO_1909 ?AUTO_1910 ) ) ( ON ?AUTO_1910 ?AUTO_1908 ) ( CLEAR ?AUTO_1910 ) ( HOLDING ?AUTO_1911 ) ( not ( = ?AUTO_1907 ?AUTO_1911 ) ) ( not ( = ?AUTO_1908 ?AUTO_1911 ) ) ( not ( = ?AUTO_1909 ?AUTO_1911 ) ) ( not ( = ?AUTO_1910 ?AUTO_1911 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1911 )
      ( MAKE-ON ?AUTO_1907 ?AUTO_1908 )
      ( MAKE-ON-VERIFY ?AUTO_1907 ?AUTO_1908 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1912 - BLOCK
      ?AUTO_1913 - BLOCK
    )
    :vars
    (
      ?AUTO_1914 - BLOCK
      ?AUTO_1915 - BLOCK
      ?AUTO_1916 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1912 ?AUTO_1913 ) ) ( ON-TABLE ?AUTO_1912 ) ( CLEAR ?AUTO_1914 ) ( not ( = ?AUTO_1912 ?AUTO_1914 ) ) ( not ( = ?AUTO_1913 ?AUTO_1914 ) ) ( ON ?AUTO_1913 ?AUTO_1912 ) ( not ( = ?AUTO_1912 ?AUTO_1915 ) ) ( not ( = ?AUTO_1913 ?AUTO_1915 ) ) ( not ( = ?AUTO_1914 ?AUTO_1915 ) ) ( ON ?AUTO_1915 ?AUTO_1913 ) ( not ( = ?AUTO_1912 ?AUTO_1916 ) ) ( not ( = ?AUTO_1913 ?AUTO_1916 ) ) ( not ( = ?AUTO_1914 ?AUTO_1916 ) ) ( not ( = ?AUTO_1915 ?AUTO_1916 ) ) ( ON ?AUTO_1916 ?AUTO_1915 ) ( CLEAR ?AUTO_1916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1916 ?AUTO_1915 )
      ( MAKE-ON ?AUTO_1912 ?AUTO_1913 )
      ( MAKE-ON-VERIFY ?AUTO_1912 ?AUTO_1913 ) )
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
      ?AUTO_1921 - BLOCK
      ?AUTO_1922 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1917 ?AUTO_1918 ) ) ( ON-TABLE ?AUTO_1917 ) ( CLEAR ?AUTO_1919 ) ( not ( = ?AUTO_1917 ?AUTO_1919 ) ) ( not ( = ?AUTO_1918 ?AUTO_1919 ) ) ( ON ?AUTO_1918 ?AUTO_1917 ) ( not ( = ?AUTO_1917 ?AUTO_1920 ) ) ( not ( = ?AUTO_1918 ?AUTO_1920 ) ) ( not ( = ?AUTO_1919 ?AUTO_1920 ) ) ( ON ?AUTO_1920 ?AUTO_1918 ) ( not ( = ?AUTO_1917 ?AUTO_1921 ) ) ( not ( = ?AUTO_1918 ?AUTO_1921 ) ) ( not ( = ?AUTO_1919 ?AUTO_1921 ) ) ( not ( = ?AUTO_1920 ?AUTO_1921 ) ) ( ON ?AUTO_1921 ?AUTO_1920 ) ( CLEAR ?AUTO_1921 ) ( HOLDING ?AUTO_1922 ) ( not ( = ?AUTO_1917 ?AUTO_1922 ) ) ( not ( = ?AUTO_1918 ?AUTO_1922 ) ) ( not ( = ?AUTO_1919 ?AUTO_1922 ) ) ( not ( = ?AUTO_1920 ?AUTO_1922 ) ) ( not ( = ?AUTO_1921 ?AUTO_1922 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1922 )
      ( MAKE-ON ?AUTO_1917 ?AUTO_1918 )
      ( MAKE-ON-VERIFY ?AUTO_1917 ?AUTO_1918 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1923 - BLOCK
      ?AUTO_1924 - BLOCK
    )
    :vars
    (
      ?AUTO_1926 - BLOCK
      ?AUTO_1925 - BLOCK
      ?AUTO_1928 - BLOCK
      ?AUTO_1927 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1923 ?AUTO_1924 ) ) ( ON-TABLE ?AUTO_1923 ) ( CLEAR ?AUTO_1926 ) ( not ( = ?AUTO_1923 ?AUTO_1926 ) ) ( not ( = ?AUTO_1924 ?AUTO_1926 ) ) ( ON ?AUTO_1924 ?AUTO_1923 ) ( not ( = ?AUTO_1923 ?AUTO_1925 ) ) ( not ( = ?AUTO_1924 ?AUTO_1925 ) ) ( not ( = ?AUTO_1926 ?AUTO_1925 ) ) ( ON ?AUTO_1925 ?AUTO_1924 ) ( not ( = ?AUTO_1923 ?AUTO_1928 ) ) ( not ( = ?AUTO_1924 ?AUTO_1928 ) ) ( not ( = ?AUTO_1926 ?AUTO_1928 ) ) ( not ( = ?AUTO_1925 ?AUTO_1928 ) ) ( ON ?AUTO_1928 ?AUTO_1925 ) ( not ( = ?AUTO_1923 ?AUTO_1927 ) ) ( not ( = ?AUTO_1924 ?AUTO_1927 ) ) ( not ( = ?AUTO_1926 ?AUTO_1927 ) ) ( not ( = ?AUTO_1925 ?AUTO_1927 ) ) ( not ( = ?AUTO_1928 ?AUTO_1927 ) ) ( ON ?AUTO_1927 ?AUTO_1928 ) ( CLEAR ?AUTO_1927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1927 ?AUTO_1928 )
      ( MAKE-ON ?AUTO_1923 ?AUTO_1924 )
      ( MAKE-ON-VERIFY ?AUTO_1923 ?AUTO_1924 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1929 - BLOCK
      ?AUTO_1930 - BLOCK
    )
    :vars
    (
      ?AUTO_1933 - BLOCK
      ?AUTO_1931 - BLOCK
      ?AUTO_1932 - BLOCK
      ?AUTO_1934 - BLOCK
      ?AUTO_1935 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1929 ?AUTO_1930 ) ) ( ON-TABLE ?AUTO_1929 ) ( not ( = ?AUTO_1929 ?AUTO_1933 ) ) ( not ( = ?AUTO_1930 ?AUTO_1933 ) ) ( ON ?AUTO_1930 ?AUTO_1929 ) ( not ( = ?AUTO_1929 ?AUTO_1931 ) ) ( not ( = ?AUTO_1930 ?AUTO_1931 ) ) ( not ( = ?AUTO_1933 ?AUTO_1931 ) ) ( ON ?AUTO_1931 ?AUTO_1930 ) ( not ( = ?AUTO_1929 ?AUTO_1932 ) ) ( not ( = ?AUTO_1930 ?AUTO_1932 ) ) ( not ( = ?AUTO_1933 ?AUTO_1932 ) ) ( not ( = ?AUTO_1931 ?AUTO_1932 ) ) ( ON ?AUTO_1932 ?AUTO_1931 ) ( not ( = ?AUTO_1929 ?AUTO_1934 ) ) ( not ( = ?AUTO_1930 ?AUTO_1934 ) ) ( not ( = ?AUTO_1933 ?AUTO_1934 ) ) ( not ( = ?AUTO_1931 ?AUTO_1934 ) ) ( not ( = ?AUTO_1932 ?AUTO_1934 ) ) ( ON ?AUTO_1934 ?AUTO_1932 ) ( CLEAR ?AUTO_1934 ) ( HOLDING ?AUTO_1933 ) ( CLEAR ?AUTO_1935 ) ( not ( = ?AUTO_1929 ?AUTO_1935 ) ) ( not ( = ?AUTO_1930 ?AUTO_1935 ) ) ( not ( = ?AUTO_1933 ?AUTO_1935 ) ) ( not ( = ?AUTO_1931 ?AUTO_1935 ) ) ( not ( = ?AUTO_1932 ?AUTO_1935 ) ) ( not ( = ?AUTO_1934 ?AUTO_1935 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1933 ?AUTO_1935 )
      ( MAKE-ON ?AUTO_1929 ?AUTO_1930 )
      ( MAKE-ON-VERIFY ?AUTO_1929 ?AUTO_1930 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1940 - BLOCK
      ?AUTO_1941 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1940 ) ( CLEAR ?AUTO_1941 ) ( not ( = ?AUTO_1940 ?AUTO_1941 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1940 ?AUTO_1941 )
      ( MAKE-ON-VERIFY ?AUTO_1940 ?AUTO_1941 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1942 - BLOCK
      ?AUTO_1943 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1943 ) ( not ( = ?AUTO_1942 ?AUTO_1943 ) ) ( ON-TABLE ?AUTO_1942 ) ( CLEAR ?AUTO_1942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1942 )
      ( MAKE-ON ?AUTO_1942 ?AUTO_1943 )
      ( MAKE-ON-VERIFY ?AUTO_1942 ?AUTO_1943 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1944 - BLOCK
      ?AUTO_1945 - BLOCK
    )
    :vars
    (
      ?AUTO_1946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1944 ?AUTO_1945 ) ) ( ON-TABLE ?AUTO_1944 ) ( CLEAR ?AUTO_1944 ) ( HOLDING ?AUTO_1945 ) ( CLEAR ?AUTO_1946 ) ( not ( = ?AUTO_1944 ?AUTO_1946 ) ) ( not ( = ?AUTO_1945 ?AUTO_1946 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1945 ?AUTO_1946 )
      ( MAKE-ON ?AUTO_1944 ?AUTO_1945 )
      ( MAKE-ON-VERIFY ?AUTO_1944 ?AUTO_1945 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1949 - BLOCK
      ?AUTO_1950 - BLOCK
    )
    :vars
    (
      ?AUTO_1951 - BLOCK
      ?AUTO_1952 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1950 ) ( not ( = ?AUTO_1949 ?AUTO_1950 ) ) ( ON-TABLE ?AUTO_1949 ) ( CLEAR ?AUTO_1949 ) ( HOLDING ?AUTO_1951 ) ( CLEAR ?AUTO_1952 ) ( not ( = ?AUTO_1949 ?AUTO_1951 ) ) ( not ( = ?AUTO_1949 ?AUTO_1952 ) ) ( not ( = ?AUTO_1950 ?AUTO_1951 ) ) ( not ( = ?AUTO_1950 ?AUTO_1952 ) ) ( not ( = ?AUTO_1951 ?AUTO_1952 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1951 ?AUTO_1952 )
      ( MAKE-ON ?AUTO_1949 ?AUTO_1950 )
      ( MAKE-ON-VERIFY ?AUTO_1949 ?AUTO_1950 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1953 - BLOCK
      ?AUTO_1954 - BLOCK
    )
    :vars
    (
      ?AUTO_1955 - BLOCK
      ?AUTO_1956 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1953 ?AUTO_1954 ) ) ( ON-TABLE ?AUTO_1953 ) ( CLEAR ?AUTO_1953 ) ( CLEAR ?AUTO_1955 ) ( not ( = ?AUTO_1953 ?AUTO_1956 ) ) ( not ( = ?AUTO_1953 ?AUTO_1955 ) ) ( not ( = ?AUTO_1954 ?AUTO_1956 ) ) ( not ( = ?AUTO_1954 ?AUTO_1955 ) ) ( not ( = ?AUTO_1956 ?AUTO_1955 ) ) ( ON ?AUTO_1956 ?AUTO_1954 ) ( CLEAR ?AUTO_1956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1956 ?AUTO_1954 )
      ( MAKE-ON ?AUTO_1953 ?AUTO_1954 )
      ( MAKE-ON-VERIFY ?AUTO_1953 ?AUTO_1954 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1957 - BLOCK
      ?AUTO_1958 - BLOCK
    )
    :vars
    (
      ?AUTO_1960 - BLOCK
      ?AUTO_1959 - BLOCK
      ?AUTO_1961 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1957 ?AUTO_1958 ) ) ( ON-TABLE ?AUTO_1957 ) ( CLEAR ?AUTO_1957 ) ( CLEAR ?AUTO_1960 ) ( not ( = ?AUTO_1957 ?AUTO_1959 ) ) ( not ( = ?AUTO_1957 ?AUTO_1960 ) ) ( not ( = ?AUTO_1958 ?AUTO_1959 ) ) ( not ( = ?AUTO_1958 ?AUTO_1960 ) ) ( not ( = ?AUTO_1959 ?AUTO_1960 ) ) ( ON ?AUTO_1959 ?AUTO_1958 ) ( CLEAR ?AUTO_1959 ) ( HOLDING ?AUTO_1961 ) ( not ( = ?AUTO_1957 ?AUTO_1961 ) ) ( not ( = ?AUTO_1958 ?AUTO_1961 ) ) ( not ( = ?AUTO_1960 ?AUTO_1961 ) ) ( not ( = ?AUTO_1959 ?AUTO_1961 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1961 )
      ( MAKE-ON ?AUTO_1957 ?AUTO_1958 )
      ( MAKE-ON-VERIFY ?AUTO_1957 ?AUTO_1958 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1962 - BLOCK
      ?AUTO_1963 - BLOCK
    )
    :vars
    (
      ?AUTO_1966 - BLOCK
      ?AUTO_1965 - BLOCK
      ?AUTO_1964 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1962 ?AUTO_1963 ) ) ( ON-TABLE ?AUTO_1962 ) ( CLEAR ?AUTO_1962 ) ( CLEAR ?AUTO_1966 ) ( not ( = ?AUTO_1962 ?AUTO_1965 ) ) ( not ( = ?AUTO_1962 ?AUTO_1966 ) ) ( not ( = ?AUTO_1963 ?AUTO_1965 ) ) ( not ( = ?AUTO_1963 ?AUTO_1966 ) ) ( not ( = ?AUTO_1965 ?AUTO_1966 ) ) ( ON ?AUTO_1965 ?AUTO_1963 ) ( not ( = ?AUTO_1962 ?AUTO_1964 ) ) ( not ( = ?AUTO_1963 ?AUTO_1964 ) ) ( not ( = ?AUTO_1966 ?AUTO_1964 ) ) ( not ( = ?AUTO_1965 ?AUTO_1964 ) ) ( ON ?AUTO_1964 ?AUTO_1965 ) ( CLEAR ?AUTO_1964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1964 ?AUTO_1965 )
      ( MAKE-ON ?AUTO_1962 ?AUTO_1963 )
      ( MAKE-ON-VERIFY ?AUTO_1962 ?AUTO_1963 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1967 - BLOCK
      ?AUTO_1968 - BLOCK
    )
    :vars
    (
      ?AUTO_1971 - BLOCK
      ?AUTO_1970 - BLOCK
      ?AUTO_1969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1967 ?AUTO_1968 ) ) ( CLEAR ?AUTO_1971 ) ( not ( = ?AUTO_1967 ?AUTO_1970 ) ) ( not ( = ?AUTO_1967 ?AUTO_1971 ) ) ( not ( = ?AUTO_1968 ?AUTO_1970 ) ) ( not ( = ?AUTO_1968 ?AUTO_1971 ) ) ( not ( = ?AUTO_1970 ?AUTO_1971 ) ) ( ON ?AUTO_1970 ?AUTO_1968 ) ( not ( = ?AUTO_1967 ?AUTO_1969 ) ) ( not ( = ?AUTO_1968 ?AUTO_1969 ) ) ( not ( = ?AUTO_1971 ?AUTO_1969 ) ) ( not ( = ?AUTO_1970 ?AUTO_1969 ) ) ( ON ?AUTO_1969 ?AUTO_1970 ) ( CLEAR ?AUTO_1969 ) ( HOLDING ?AUTO_1967 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1967 )
      ( MAKE-ON ?AUTO_1967 ?AUTO_1968 )
      ( MAKE-ON-VERIFY ?AUTO_1967 ?AUTO_1968 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1972 - BLOCK
      ?AUTO_1973 - BLOCK
    )
    :vars
    (
      ?AUTO_1976 - BLOCK
      ?AUTO_1975 - BLOCK
      ?AUTO_1974 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1972 ?AUTO_1973 ) ) ( CLEAR ?AUTO_1976 ) ( not ( = ?AUTO_1972 ?AUTO_1975 ) ) ( not ( = ?AUTO_1972 ?AUTO_1976 ) ) ( not ( = ?AUTO_1973 ?AUTO_1975 ) ) ( not ( = ?AUTO_1973 ?AUTO_1976 ) ) ( not ( = ?AUTO_1975 ?AUTO_1976 ) ) ( ON ?AUTO_1975 ?AUTO_1973 ) ( not ( = ?AUTO_1972 ?AUTO_1974 ) ) ( not ( = ?AUTO_1973 ?AUTO_1974 ) ) ( not ( = ?AUTO_1976 ?AUTO_1974 ) ) ( not ( = ?AUTO_1975 ?AUTO_1974 ) ) ( ON ?AUTO_1974 ?AUTO_1975 ) ( ON ?AUTO_1972 ?AUTO_1974 ) ( CLEAR ?AUTO_1972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1972 ?AUTO_1974 )
      ( MAKE-ON ?AUTO_1972 ?AUTO_1973 )
      ( MAKE-ON-VERIFY ?AUTO_1972 ?AUTO_1973 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1977 - BLOCK
      ?AUTO_1978 - BLOCK
    )
    :vars
    (
      ?AUTO_1981 - BLOCK
      ?AUTO_1980 - BLOCK
      ?AUTO_1979 - BLOCK
      ?AUTO_1982 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1977 ?AUTO_1978 ) ) ( CLEAR ?AUTO_1981 ) ( not ( = ?AUTO_1977 ?AUTO_1980 ) ) ( not ( = ?AUTO_1977 ?AUTO_1981 ) ) ( not ( = ?AUTO_1978 ?AUTO_1980 ) ) ( not ( = ?AUTO_1978 ?AUTO_1981 ) ) ( not ( = ?AUTO_1980 ?AUTO_1981 ) ) ( ON ?AUTO_1980 ?AUTO_1978 ) ( not ( = ?AUTO_1977 ?AUTO_1979 ) ) ( not ( = ?AUTO_1978 ?AUTO_1979 ) ) ( not ( = ?AUTO_1981 ?AUTO_1979 ) ) ( not ( = ?AUTO_1980 ?AUTO_1979 ) ) ( ON ?AUTO_1979 ?AUTO_1980 ) ( ON ?AUTO_1977 ?AUTO_1979 ) ( CLEAR ?AUTO_1977 ) ( HOLDING ?AUTO_1982 ) ( not ( = ?AUTO_1977 ?AUTO_1982 ) ) ( not ( = ?AUTO_1978 ?AUTO_1982 ) ) ( not ( = ?AUTO_1981 ?AUTO_1982 ) ) ( not ( = ?AUTO_1980 ?AUTO_1982 ) ) ( not ( = ?AUTO_1979 ?AUTO_1982 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1982 )
      ( MAKE-ON ?AUTO_1977 ?AUTO_1978 )
      ( MAKE-ON-VERIFY ?AUTO_1977 ?AUTO_1978 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1983 - BLOCK
      ?AUTO_1984 - BLOCK
    )
    :vars
    (
      ?AUTO_1988 - BLOCK
      ?AUTO_1986 - BLOCK
      ?AUTO_1985 - BLOCK
      ?AUTO_1987 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1983 ?AUTO_1984 ) ) ( CLEAR ?AUTO_1988 ) ( not ( = ?AUTO_1983 ?AUTO_1986 ) ) ( not ( = ?AUTO_1983 ?AUTO_1988 ) ) ( not ( = ?AUTO_1984 ?AUTO_1986 ) ) ( not ( = ?AUTO_1984 ?AUTO_1988 ) ) ( not ( = ?AUTO_1986 ?AUTO_1988 ) ) ( ON ?AUTO_1986 ?AUTO_1984 ) ( not ( = ?AUTO_1983 ?AUTO_1985 ) ) ( not ( = ?AUTO_1984 ?AUTO_1985 ) ) ( not ( = ?AUTO_1988 ?AUTO_1985 ) ) ( not ( = ?AUTO_1986 ?AUTO_1985 ) ) ( ON ?AUTO_1985 ?AUTO_1986 ) ( ON ?AUTO_1983 ?AUTO_1985 ) ( not ( = ?AUTO_1983 ?AUTO_1987 ) ) ( not ( = ?AUTO_1984 ?AUTO_1987 ) ) ( not ( = ?AUTO_1988 ?AUTO_1987 ) ) ( not ( = ?AUTO_1986 ?AUTO_1987 ) ) ( not ( = ?AUTO_1985 ?AUTO_1987 ) ) ( ON ?AUTO_1987 ?AUTO_1983 ) ( CLEAR ?AUTO_1987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1987 ?AUTO_1983 )
      ( MAKE-ON ?AUTO_1983 ?AUTO_1984 )
      ( MAKE-ON-VERIFY ?AUTO_1983 ?AUTO_1984 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1989 - BLOCK
      ?AUTO_1990 - BLOCK
    )
    :vars
    (
      ?AUTO_1991 - BLOCK
      ?AUTO_1993 - BLOCK
      ?AUTO_1994 - BLOCK
      ?AUTO_1992 - BLOCK
      ?AUTO_1995 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1989 ?AUTO_1990 ) ) ( not ( = ?AUTO_1989 ?AUTO_1991 ) ) ( not ( = ?AUTO_1989 ?AUTO_1993 ) ) ( not ( = ?AUTO_1990 ?AUTO_1991 ) ) ( not ( = ?AUTO_1990 ?AUTO_1993 ) ) ( not ( = ?AUTO_1991 ?AUTO_1993 ) ) ( ON ?AUTO_1991 ?AUTO_1990 ) ( not ( = ?AUTO_1989 ?AUTO_1994 ) ) ( not ( = ?AUTO_1990 ?AUTO_1994 ) ) ( not ( = ?AUTO_1993 ?AUTO_1994 ) ) ( not ( = ?AUTO_1991 ?AUTO_1994 ) ) ( ON ?AUTO_1994 ?AUTO_1991 ) ( ON ?AUTO_1989 ?AUTO_1994 ) ( not ( = ?AUTO_1989 ?AUTO_1992 ) ) ( not ( = ?AUTO_1990 ?AUTO_1992 ) ) ( not ( = ?AUTO_1993 ?AUTO_1992 ) ) ( not ( = ?AUTO_1991 ?AUTO_1992 ) ) ( not ( = ?AUTO_1994 ?AUTO_1992 ) ) ( ON ?AUTO_1992 ?AUTO_1989 ) ( CLEAR ?AUTO_1992 ) ( HOLDING ?AUTO_1993 ) ( CLEAR ?AUTO_1995 ) ( not ( = ?AUTO_1989 ?AUTO_1995 ) ) ( not ( = ?AUTO_1990 ?AUTO_1995 ) ) ( not ( = ?AUTO_1991 ?AUTO_1995 ) ) ( not ( = ?AUTO_1993 ?AUTO_1995 ) ) ( not ( = ?AUTO_1994 ?AUTO_1995 ) ) ( not ( = ?AUTO_1992 ?AUTO_1995 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1993 ?AUTO_1995 )
      ( MAKE-ON ?AUTO_1989 ?AUTO_1990 )
      ( MAKE-ON-VERIFY ?AUTO_1989 ?AUTO_1990 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1997 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1997 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1997 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1997 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1998 - BLOCK
    )
    :vars
    (
      ?AUTO_1999 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1998 ?AUTO_1999 ) ( CLEAR ?AUTO_1998 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1998 ?AUTO_1999 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1998 ?AUTO_1999 )
      ( MAKE-ON-TABLE ?AUTO_1998 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1998 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2001 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2001 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2001 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2001 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2002 - BLOCK
    )
    :vars
    (
      ?AUTO_2003 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2002 ?AUTO_2003 ) ( CLEAR ?AUTO_2002 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2002 ?AUTO_2003 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2002 ?AUTO_2003 )
      ( MAKE-ON-TABLE ?AUTO_2002 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2002 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2004 - BLOCK
    )
    :vars
    (
      ?AUTO_2005 - BLOCK
      ?AUTO_2006 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2004 ?AUTO_2005 ) ( CLEAR ?AUTO_2004 ) ( not ( = ?AUTO_2004 ?AUTO_2005 ) ) ( HOLDING ?AUTO_2006 ) ( not ( = ?AUTO_2004 ?AUTO_2006 ) ) ( not ( = ?AUTO_2005 ?AUTO_2006 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2006 )
      ( MAKE-ON-TABLE ?AUTO_2004 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2004 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2007 - BLOCK
    )
    :vars
    (
      ?AUTO_2008 - BLOCK
      ?AUTO_2009 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2007 ?AUTO_2008 ) ( not ( = ?AUTO_2007 ?AUTO_2008 ) ) ( not ( = ?AUTO_2007 ?AUTO_2009 ) ) ( not ( = ?AUTO_2008 ?AUTO_2009 ) ) ( ON ?AUTO_2009 ?AUTO_2007 ) ( CLEAR ?AUTO_2009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2009 ?AUTO_2007 )
      ( MAKE-ON-TABLE ?AUTO_2007 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2007 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2011 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2011 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2011 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2011 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2012 - BLOCK
    )
    :vars
    (
      ?AUTO_2013 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2012 ?AUTO_2013 ) ( CLEAR ?AUTO_2012 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2012 ?AUTO_2013 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2012 ?AUTO_2013 )
      ( MAKE-ON-TABLE ?AUTO_2012 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2012 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2014 - BLOCK
    )
    :vars
    (
      ?AUTO_2015 - BLOCK
      ?AUTO_2016 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2014 ?AUTO_2015 ) ( CLEAR ?AUTO_2014 ) ( not ( = ?AUTO_2014 ?AUTO_2015 ) ) ( HOLDING ?AUTO_2016 ) ( not ( = ?AUTO_2014 ?AUTO_2016 ) ) ( not ( = ?AUTO_2015 ?AUTO_2016 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2016 )
      ( MAKE-ON-TABLE ?AUTO_2014 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2014 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2017 - BLOCK
    )
    :vars
    (
      ?AUTO_2018 - BLOCK
      ?AUTO_2019 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2017 ?AUTO_2018 ) ( not ( = ?AUTO_2017 ?AUTO_2018 ) ) ( not ( = ?AUTO_2017 ?AUTO_2019 ) ) ( not ( = ?AUTO_2018 ?AUTO_2019 ) ) ( ON ?AUTO_2019 ?AUTO_2017 ) ( CLEAR ?AUTO_2019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2019 ?AUTO_2017 )
      ( MAKE-ON-TABLE ?AUTO_2017 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2017 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2020 - BLOCK
    )
    :vars
    (
      ?AUTO_2021 - BLOCK
      ?AUTO_2022 - BLOCK
      ?AUTO_2023 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2020 ?AUTO_2021 ) ( not ( = ?AUTO_2020 ?AUTO_2021 ) ) ( not ( = ?AUTO_2020 ?AUTO_2022 ) ) ( not ( = ?AUTO_2021 ?AUTO_2022 ) ) ( ON ?AUTO_2022 ?AUTO_2020 ) ( CLEAR ?AUTO_2022 ) ( HOLDING ?AUTO_2023 ) ( not ( = ?AUTO_2020 ?AUTO_2023 ) ) ( not ( = ?AUTO_2021 ?AUTO_2023 ) ) ( not ( = ?AUTO_2022 ?AUTO_2023 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2023 )
      ( MAKE-ON-TABLE ?AUTO_2020 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2020 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2024 - BLOCK
    )
    :vars
    (
      ?AUTO_2025 - BLOCK
      ?AUTO_2026 - BLOCK
      ?AUTO_2027 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2024 ?AUTO_2025 ) ( not ( = ?AUTO_2024 ?AUTO_2025 ) ) ( not ( = ?AUTO_2024 ?AUTO_2026 ) ) ( not ( = ?AUTO_2025 ?AUTO_2026 ) ) ( ON ?AUTO_2026 ?AUTO_2024 ) ( not ( = ?AUTO_2024 ?AUTO_2027 ) ) ( not ( = ?AUTO_2025 ?AUTO_2027 ) ) ( not ( = ?AUTO_2026 ?AUTO_2027 ) ) ( ON ?AUTO_2027 ?AUTO_2026 ) ( CLEAR ?AUTO_2027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2027 ?AUTO_2026 )
      ( MAKE-ON-TABLE ?AUTO_2024 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2024 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2030 - BLOCK
      ?AUTO_2031 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2030 ) ( CLEAR ?AUTO_2031 ) ( not ( = ?AUTO_2030 ?AUTO_2031 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2030 ?AUTO_2031 )
      ( MAKE-ON-VERIFY ?AUTO_2030 ?AUTO_2031 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2032 - BLOCK
      ?AUTO_2033 - BLOCK
    )
    :vars
    (
      ?AUTO_2034 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2033 ) ( not ( = ?AUTO_2032 ?AUTO_2033 ) ) ( ON ?AUTO_2032 ?AUTO_2034 ) ( CLEAR ?AUTO_2032 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2032 ?AUTO_2034 ) ) ( not ( = ?AUTO_2033 ?AUTO_2034 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2032 ?AUTO_2034 )
      ( MAKE-ON ?AUTO_2032 ?AUTO_2033 )
      ( MAKE-ON-VERIFY ?AUTO_2032 ?AUTO_2033 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2035 - BLOCK
      ?AUTO_2036 - BLOCK
    )
    :vars
    (
      ?AUTO_2037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2035 ?AUTO_2036 ) ) ( ON ?AUTO_2035 ?AUTO_2037 ) ( CLEAR ?AUTO_2035 ) ( not ( = ?AUTO_2035 ?AUTO_2037 ) ) ( not ( = ?AUTO_2036 ?AUTO_2037 ) ) ( HOLDING ?AUTO_2036 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2036 )
      ( MAKE-ON ?AUTO_2035 ?AUTO_2036 )
      ( MAKE-ON-VERIFY ?AUTO_2035 ?AUTO_2036 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2038 - BLOCK
      ?AUTO_2039 - BLOCK
    )
    :vars
    (
      ?AUTO_2040 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2038 ?AUTO_2039 ) ) ( ON ?AUTO_2038 ?AUTO_2040 ) ( not ( = ?AUTO_2038 ?AUTO_2040 ) ) ( not ( = ?AUTO_2039 ?AUTO_2040 ) ) ( ON ?AUTO_2039 ?AUTO_2038 ) ( CLEAR ?AUTO_2039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2039 ?AUTO_2038 )
      ( MAKE-ON ?AUTO_2038 ?AUTO_2039 )
      ( MAKE-ON-VERIFY ?AUTO_2038 ?AUTO_2039 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2041 - BLOCK
      ?AUTO_2042 - BLOCK
    )
    :vars
    (
      ?AUTO_2043 - BLOCK
      ?AUTO_2044 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2041 ?AUTO_2042 ) ) ( ON ?AUTO_2041 ?AUTO_2043 ) ( not ( = ?AUTO_2041 ?AUTO_2043 ) ) ( not ( = ?AUTO_2042 ?AUTO_2043 ) ) ( ON ?AUTO_2042 ?AUTO_2041 ) ( CLEAR ?AUTO_2042 ) ( HOLDING ?AUTO_2044 ) ( not ( = ?AUTO_2041 ?AUTO_2044 ) ) ( not ( = ?AUTO_2042 ?AUTO_2044 ) ) ( not ( = ?AUTO_2043 ?AUTO_2044 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2044 )
      ( MAKE-ON ?AUTO_2041 ?AUTO_2042 )
      ( MAKE-ON-VERIFY ?AUTO_2041 ?AUTO_2042 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2045 - BLOCK
      ?AUTO_2046 - BLOCK
    )
    :vars
    (
      ?AUTO_2047 - BLOCK
      ?AUTO_2048 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2045 ?AUTO_2046 ) ) ( ON ?AUTO_2045 ?AUTO_2047 ) ( not ( = ?AUTO_2045 ?AUTO_2047 ) ) ( not ( = ?AUTO_2046 ?AUTO_2047 ) ) ( ON ?AUTO_2046 ?AUTO_2045 ) ( not ( = ?AUTO_2045 ?AUTO_2048 ) ) ( not ( = ?AUTO_2046 ?AUTO_2048 ) ) ( not ( = ?AUTO_2047 ?AUTO_2048 ) ) ( ON ?AUTO_2048 ?AUTO_2046 ) ( CLEAR ?AUTO_2048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2048 ?AUTO_2046 )
      ( MAKE-ON ?AUTO_2045 ?AUTO_2046 )
      ( MAKE-ON-VERIFY ?AUTO_2045 ?AUTO_2046 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2049 - BLOCK
      ?AUTO_2050 - BLOCK
    )
    :vars
    (
      ?AUTO_2052 - BLOCK
      ?AUTO_2051 - BLOCK
      ?AUTO_2053 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2049 ?AUTO_2050 ) ) ( ON ?AUTO_2049 ?AUTO_2052 ) ( not ( = ?AUTO_2049 ?AUTO_2052 ) ) ( not ( = ?AUTO_2050 ?AUTO_2052 ) ) ( ON ?AUTO_2050 ?AUTO_2049 ) ( not ( = ?AUTO_2049 ?AUTO_2051 ) ) ( not ( = ?AUTO_2050 ?AUTO_2051 ) ) ( not ( = ?AUTO_2052 ?AUTO_2051 ) ) ( ON ?AUTO_2051 ?AUTO_2050 ) ( CLEAR ?AUTO_2051 ) ( HOLDING ?AUTO_2053 ) ( not ( = ?AUTO_2049 ?AUTO_2053 ) ) ( not ( = ?AUTO_2050 ?AUTO_2053 ) ) ( not ( = ?AUTO_2052 ?AUTO_2053 ) ) ( not ( = ?AUTO_2051 ?AUTO_2053 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2053 )
      ( MAKE-ON ?AUTO_2049 ?AUTO_2050 )
      ( MAKE-ON-VERIFY ?AUTO_2049 ?AUTO_2050 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2054 - BLOCK
      ?AUTO_2055 - BLOCK
    )
    :vars
    (
      ?AUTO_2057 - BLOCK
      ?AUTO_2056 - BLOCK
      ?AUTO_2058 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2054 ?AUTO_2055 ) ) ( ON ?AUTO_2054 ?AUTO_2057 ) ( not ( = ?AUTO_2054 ?AUTO_2057 ) ) ( not ( = ?AUTO_2055 ?AUTO_2057 ) ) ( ON ?AUTO_2055 ?AUTO_2054 ) ( not ( = ?AUTO_2054 ?AUTO_2056 ) ) ( not ( = ?AUTO_2055 ?AUTO_2056 ) ) ( not ( = ?AUTO_2057 ?AUTO_2056 ) ) ( ON ?AUTO_2056 ?AUTO_2055 ) ( not ( = ?AUTO_2054 ?AUTO_2058 ) ) ( not ( = ?AUTO_2055 ?AUTO_2058 ) ) ( not ( = ?AUTO_2057 ?AUTO_2058 ) ) ( not ( = ?AUTO_2056 ?AUTO_2058 ) ) ( ON ?AUTO_2058 ?AUTO_2056 ) ( CLEAR ?AUTO_2058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2058 ?AUTO_2056 )
      ( MAKE-ON ?AUTO_2054 ?AUTO_2055 )
      ( MAKE-ON-VERIFY ?AUTO_2054 ?AUTO_2055 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2061 - BLOCK
      ?AUTO_2062 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2061 ) ( CLEAR ?AUTO_2062 ) ( not ( = ?AUTO_2061 ?AUTO_2062 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2061 ?AUTO_2062 )
      ( MAKE-ON-VERIFY ?AUTO_2061 ?AUTO_2062 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2063 - BLOCK
      ?AUTO_2064 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2064 ) ( not ( = ?AUTO_2063 ?AUTO_2064 ) ) ( ON-TABLE ?AUTO_2063 ) ( CLEAR ?AUTO_2063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2063 )
      ( MAKE-ON ?AUTO_2063 ?AUTO_2064 )
      ( MAKE-ON-VERIFY ?AUTO_2063 ?AUTO_2064 ) )
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
    )
    :precondition
    ( and ( not ( = ?AUTO_2065 ?AUTO_2066 ) ) ( ON-TABLE ?AUTO_2065 ) ( CLEAR ?AUTO_2065 ) ( HOLDING ?AUTO_2066 ) ( CLEAR ?AUTO_2067 ) ( not ( = ?AUTO_2065 ?AUTO_2067 ) ) ( not ( = ?AUTO_2066 ?AUTO_2067 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2066 ?AUTO_2067 )
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
    )
    :precondition
    ( and ( CLEAR ?AUTO_2071 ) ( not ( = ?AUTO_2070 ?AUTO_2071 ) ) ( ON-TABLE ?AUTO_2070 ) ( CLEAR ?AUTO_2070 ) ( HOLDING ?AUTO_2072 ) ( not ( = ?AUTO_2070 ?AUTO_2072 ) ) ( not ( = ?AUTO_2071 ?AUTO_2072 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2072 )
      ( MAKE-ON ?AUTO_2070 ?AUTO_2071 )
      ( MAKE-ON-VERIFY ?AUTO_2070 ?AUTO_2071 ) )
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
    ( and ( not ( = ?AUTO_2073 ?AUTO_2074 ) ) ( ON-TABLE ?AUTO_2073 ) ( CLEAR ?AUTO_2073 ) ( not ( = ?AUTO_2073 ?AUTO_2075 ) ) ( not ( = ?AUTO_2074 ?AUTO_2075 ) ) ( ON ?AUTO_2075 ?AUTO_2074 ) ( CLEAR ?AUTO_2075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2075 ?AUTO_2074 )
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
    ( and ( not ( = ?AUTO_2076 ?AUTO_2077 ) ) ( ON-TABLE ?AUTO_2076 ) ( CLEAR ?AUTO_2076 ) ( not ( = ?AUTO_2076 ?AUTO_2078 ) ) ( not ( = ?AUTO_2077 ?AUTO_2078 ) ) ( ON ?AUTO_2078 ?AUTO_2077 ) ( CLEAR ?AUTO_2078 ) ( HOLDING ?AUTO_2079 ) ( not ( = ?AUTO_2076 ?AUTO_2079 ) ) ( not ( = ?AUTO_2077 ?AUTO_2079 ) ) ( not ( = ?AUTO_2078 ?AUTO_2079 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2079 )
      ( MAKE-ON ?AUTO_2076 ?AUTO_2077 )
      ( MAKE-ON-VERIFY ?AUTO_2076 ?AUTO_2077 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2080 - BLOCK
      ?AUTO_2081 - BLOCK
    )
    :vars
    (
      ?AUTO_2082 - BLOCK
      ?AUTO_2083 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2080 ?AUTO_2081 ) ) ( ON-TABLE ?AUTO_2080 ) ( CLEAR ?AUTO_2080 ) ( not ( = ?AUTO_2080 ?AUTO_2082 ) ) ( not ( = ?AUTO_2081 ?AUTO_2082 ) ) ( ON ?AUTO_2082 ?AUTO_2081 ) ( not ( = ?AUTO_2080 ?AUTO_2083 ) ) ( not ( = ?AUTO_2081 ?AUTO_2083 ) ) ( not ( = ?AUTO_2082 ?AUTO_2083 ) ) ( ON ?AUTO_2083 ?AUTO_2082 ) ( CLEAR ?AUTO_2083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2083 ?AUTO_2082 )
      ( MAKE-ON ?AUTO_2080 ?AUTO_2081 )
      ( MAKE-ON-VERIFY ?AUTO_2080 ?AUTO_2081 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2084 - BLOCK
      ?AUTO_2085 - BLOCK
    )
    :vars
    (
      ?AUTO_2087 - BLOCK
      ?AUTO_2086 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2084 ?AUTO_2085 ) ) ( not ( = ?AUTO_2084 ?AUTO_2087 ) ) ( not ( = ?AUTO_2085 ?AUTO_2087 ) ) ( ON ?AUTO_2087 ?AUTO_2085 ) ( not ( = ?AUTO_2084 ?AUTO_2086 ) ) ( not ( = ?AUTO_2085 ?AUTO_2086 ) ) ( not ( = ?AUTO_2087 ?AUTO_2086 ) ) ( ON ?AUTO_2086 ?AUTO_2087 ) ( CLEAR ?AUTO_2086 ) ( HOLDING ?AUTO_2084 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2084 )
      ( MAKE-ON ?AUTO_2084 ?AUTO_2085 )
      ( MAKE-ON-VERIFY ?AUTO_2084 ?AUTO_2085 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2088 - BLOCK
      ?AUTO_2089 - BLOCK
    )
    :vars
    (
      ?AUTO_2091 - BLOCK
      ?AUTO_2090 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2088 ?AUTO_2089 ) ) ( not ( = ?AUTO_2088 ?AUTO_2091 ) ) ( not ( = ?AUTO_2089 ?AUTO_2091 ) ) ( ON ?AUTO_2091 ?AUTO_2089 ) ( not ( = ?AUTO_2088 ?AUTO_2090 ) ) ( not ( = ?AUTO_2089 ?AUTO_2090 ) ) ( not ( = ?AUTO_2091 ?AUTO_2090 ) ) ( ON ?AUTO_2090 ?AUTO_2091 ) ( ON ?AUTO_2088 ?AUTO_2090 ) ( CLEAR ?AUTO_2088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2088 ?AUTO_2090 )
      ( MAKE-ON ?AUTO_2088 ?AUTO_2089 )
      ( MAKE-ON-VERIFY ?AUTO_2088 ?AUTO_2089 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2094 - BLOCK
      ?AUTO_2095 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2094 ) ( CLEAR ?AUTO_2095 ) ( not ( = ?AUTO_2094 ?AUTO_2095 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2094 ?AUTO_2095 )
      ( MAKE-ON-VERIFY ?AUTO_2094 ?AUTO_2095 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2096 - BLOCK
      ?AUTO_2097 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2097 ) ( not ( = ?AUTO_2096 ?AUTO_2097 ) ) ( ON-TABLE ?AUTO_2096 ) ( CLEAR ?AUTO_2096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2096 )
      ( MAKE-ON ?AUTO_2096 ?AUTO_2097 )
      ( MAKE-ON-VERIFY ?AUTO_2096 ?AUTO_2097 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2098 - BLOCK
      ?AUTO_2099 - BLOCK
    )
    :vars
    (
      ?AUTO_2100 - BLOCK
      ?AUTO_2101 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2099 ) ( not ( = ?AUTO_2098 ?AUTO_2099 ) ) ( ON-TABLE ?AUTO_2098 ) ( CLEAR ?AUTO_2098 ) ( HOLDING ?AUTO_2100 ) ( CLEAR ?AUTO_2101 ) ( not ( = ?AUTO_2098 ?AUTO_2100 ) ) ( not ( = ?AUTO_2098 ?AUTO_2101 ) ) ( not ( = ?AUTO_2099 ?AUTO_2100 ) ) ( not ( = ?AUTO_2099 ?AUTO_2101 ) ) ( not ( = ?AUTO_2100 ?AUTO_2101 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2100 ?AUTO_2101 )
      ( MAKE-ON ?AUTO_2098 ?AUTO_2099 )
      ( MAKE-ON-VERIFY ?AUTO_2098 ?AUTO_2099 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2122 - BLOCK
      ?AUTO_2123 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2122 ) ( CLEAR ?AUTO_2123 ) ( not ( = ?AUTO_2122 ?AUTO_2123 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2122 ?AUTO_2123 )
      ( MAKE-ON-VERIFY ?AUTO_2122 ?AUTO_2123 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2124 - BLOCK
      ?AUTO_2125 - BLOCK
    )
    :vars
    (
      ?AUTO_2126 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2125 ) ( not ( = ?AUTO_2124 ?AUTO_2125 ) ) ( ON ?AUTO_2124 ?AUTO_2126 ) ( CLEAR ?AUTO_2124 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2124 ?AUTO_2126 ) ) ( not ( = ?AUTO_2125 ?AUTO_2126 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2124 ?AUTO_2126 )
      ( MAKE-ON ?AUTO_2124 ?AUTO_2125 )
      ( MAKE-ON-VERIFY ?AUTO_2124 ?AUTO_2125 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2127 - BLOCK
      ?AUTO_2128 - BLOCK
    )
    :vars
    (
      ?AUTO_2129 - BLOCK
      ?AUTO_2130 - BLOCK
      ?AUTO_2131 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2128 ) ( not ( = ?AUTO_2127 ?AUTO_2128 ) ) ( ON ?AUTO_2127 ?AUTO_2129 ) ( CLEAR ?AUTO_2127 ) ( not ( = ?AUTO_2127 ?AUTO_2129 ) ) ( not ( = ?AUTO_2128 ?AUTO_2129 ) ) ( HOLDING ?AUTO_2130 ) ( CLEAR ?AUTO_2131 ) ( not ( = ?AUTO_2127 ?AUTO_2130 ) ) ( not ( = ?AUTO_2127 ?AUTO_2131 ) ) ( not ( = ?AUTO_2128 ?AUTO_2130 ) ) ( not ( = ?AUTO_2128 ?AUTO_2131 ) ) ( not ( = ?AUTO_2129 ?AUTO_2130 ) ) ( not ( = ?AUTO_2129 ?AUTO_2131 ) ) ( not ( = ?AUTO_2130 ?AUTO_2131 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2130 ?AUTO_2131 )
      ( MAKE-ON ?AUTO_2127 ?AUTO_2128 )
      ( MAKE-ON-VERIFY ?AUTO_2127 ?AUTO_2128 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2140 - BLOCK
      ?AUTO_2141 - BLOCK
    )
    :vars
    (
      ?AUTO_2142 - BLOCK
      ?AUTO_2143 - BLOCK
      ?AUTO_2144 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2140 ?AUTO_2141 ) ) ( ON ?AUTO_2140 ?AUTO_2142 ) ( CLEAR ?AUTO_2140 ) ( not ( = ?AUTO_2140 ?AUTO_2142 ) ) ( not ( = ?AUTO_2141 ?AUTO_2142 ) ) ( CLEAR ?AUTO_2143 ) ( not ( = ?AUTO_2140 ?AUTO_2144 ) ) ( not ( = ?AUTO_2140 ?AUTO_2143 ) ) ( not ( = ?AUTO_2141 ?AUTO_2144 ) ) ( not ( = ?AUTO_2141 ?AUTO_2143 ) ) ( not ( = ?AUTO_2142 ?AUTO_2144 ) ) ( not ( = ?AUTO_2142 ?AUTO_2143 ) ) ( not ( = ?AUTO_2144 ?AUTO_2143 ) ) ( ON ?AUTO_2144 ?AUTO_2141 ) ( CLEAR ?AUTO_2144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2144 ?AUTO_2141 )
      ( MAKE-ON ?AUTO_2140 ?AUTO_2141 )
      ( MAKE-ON-VERIFY ?AUTO_2140 ?AUTO_2141 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2145 - BLOCK
      ?AUTO_2146 - BLOCK
    )
    :vars
    (
      ?AUTO_2148 - BLOCK
      ?AUTO_2147 - BLOCK
      ?AUTO_2149 - BLOCK
      ?AUTO_2150 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2145 ?AUTO_2146 ) ) ( ON ?AUTO_2145 ?AUTO_2148 ) ( CLEAR ?AUTO_2145 ) ( not ( = ?AUTO_2145 ?AUTO_2148 ) ) ( not ( = ?AUTO_2146 ?AUTO_2148 ) ) ( CLEAR ?AUTO_2147 ) ( not ( = ?AUTO_2145 ?AUTO_2149 ) ) ( not ( = ?AUTO_2145 ?AUTO_2147 ) ) ( not ( = ?AUTO_2146 ?AUTO_2149 ) ) ( not ( = ?AUTO_2146 ?AUTO_2147 ) ) ( not ( = ?AUTO_2148 ?AUTO_2149 ) ) ( not ( = ?AUTO_2148 ?AUTO_2147 ) ) ( not ( = ?AUTO_2149 ?AUTO_2147 ) ) ( ON ?AUTO_2149 ?AUTO_2146 ) ( CLEAR ?AUTO_2149 ) ( HOLDING ?AUTO_2150 ) ( not ( = ?AUTO_2145 ?AUTO_2150 ) ) ( not ( = ?AUTO_2146 ?AUTO_2150 ) ) ( not ( = ?AUTO_2148 ?AUTO_2150 ) ) ( not ( = ?AUTO_2147 ?AUTO_2150 ) ) ( not ( = ?AUTO_2149 ?AUTO_2150 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2150 )
      ( MAKE-ON ?AUTO_2145 ?AUTO_2146 )
      ( MAKE-ON-VERIFY ?AUTO_2145 ?AUTO_2146 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2151 - BLOCK
      ?AUTO_2152 - BLOCK
    )
    :vars
    (
      ?AUTO_2153 - BLOCK
      ?AUTO_2154 - BLOCK
      ?AUTO_2155 - BLOCK
      ?AUTO_2156 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2151 ?AUTO_2152 ) ) ( ON ?AUTO_2151 ?AUTO_2153 ) ( CLEAR ?AUTO_2151 ) ( not ( = ?AUTO_2151 ?AUTO_2153 ) ) ( not ( = ?AUTO_2152 ?AUTO_2153 ) ) ( CLEAR ?AUTO_2154 ) ( not ( = ?AUTO_2151 ?AUTO_2155 ) ) ( not ( = ?AUTO_2151 ?AUTO_2154 ) ) ( not ( = ?AUTO_2152 ?AUTO_2155 ) ) ( not ( = ?AUTO_2152 ?AUTO_2154 ) ) ( not ( = ?AUTO_2153 ?AUTO_2155 ) ) ( not ( = ?AUTO_2153 ?AUTO_2154 ) ) ( not ( = ?AUTO_2155 ?AUTO_2154 ) ) ( ON ?AUTO_2155 ?AUTO_2152 ) ( not ( = ?AUTO_2151 ?AUTO_2156 ) ) ( not ( = ?AUTO_2152 ?AUTO_2156 ) ) ( not ( = ?AUTO_2153 ?AUTO_2156 ) ) ( not ( = ?AUTO_2154 ?AUTO_2156 ) ) ( not ( = ?AUTO_2155 ?AUTO_2156 ) ) ( ON ?AUTO_2156 ?AUTO_2155 ) ( CLEAR ?AUTO_2156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2156 ?AUTO_2155 )
      ( MAKE-ON ?AUTO_2151 ?AUTO_2152 )
      ( MAKE-ON-VERIFY ?AUTO_2151 ?AUTO_2152 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2157 - BLOCK
      ?AUTO_2158 - BLOCK
    )
    :vars
    (
      ?AUTO_2160 - BLOCK
      ?AUTO_2161 - BLOCK
      ?AUTO_2159 - BLOCK
      ?AUTO_2162 - BLOCK
      ?AUTO_2163 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2157 ?AUTO_2158 ) ) ( ON ?AUTO_2157 ?AUTO_2160 ) ( CLEAR ?AUTO_2157 ) ( not ( = ?AUTO_2157 ?AUTO_2160 ) ) ( not ( = ?AUTO_2158 ?AUTO_2160 ) ) ( CLEAR ?AUTO_2161 ) ( not ( = ?AUTO_2157 ?AUTO_2159 ) ) ( not ( = ?AUTO_2157 ?AUTO_2161 ) ) ( not ( = ?AUTO_2158 ?AUTO_2159 ) ) ( not ( = ?AUTO_2158 ?AUTO_2161 ) ) ( not ( = ?AUTO_2160 ?AUTO_2159 ) ) ( not ( = ?AUTO_2160 ?AUTO_2161 ) ) ( not ( = ?AUTO_2159 ?AUTO_2161 ) ) ( ON ?AUTO_2159 ?AUTO_2158 ) ( not ( = ?AUTO_2157 ?AUTO_2162 ) ) ( not ( = ?AUTO_2158 ?AUTO_2162 ) ) ( not ( = ?AUTO_2160 ?AUTO_2162 ) ) ( not ( = ?AUTO_2161 ?AUTO_2162 ) ) ( not ( = ?AUTO_2159 ?AUTO_2162 ) ) ( ON ?AUTO_2162 ?AUTO_2159 ) ( CLEAR ?AUTO_2162 ) ( HOLDING ?AUTO_2163 ) ( not ( = ?AUTO_2157 ?AUTO_2163 ) ) ( not ( = ?AUTO_2158 ?AUTO_2163 ) ) ( not ( = ?AUTO_2160 ?AUTO_2163 ) ) ( not ( = ?AUTO_2161 ?AUTO_2163 ) ) ( not ( = ?AUTO_2159 ?AUTO_2163 ) ) ( not ( = ?AUTO_2162 ?AUTO_2163 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2163 )
      ( MAKE-ON ?AUTO_2157 ?AUTO_2158 )
      ( MAKE-ON-VERIFY ?AUTO_2157 ?AUTO_2158 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2164 - BLOCK
      ?AUTO_2165 - BLOCK
    )
    :vars
    (
      ?AUTO_2167 - BLOCK
      ?AUTO_2170 - BLOCK
      ?AUTO_2166 - BLOCK
      ?AUTO_2169 - BLOCK
      ?AUTO_2168 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2164 ?AUTO_2165 ) ) ( ON ?AUTO_2164 ?AUTO_2167 ) ( CLEAR ?AUTO_2164 ) ( not ( = ?AUTO_2164 ?AUTO_2167 ) ) ( not ( = ?AUTO_2165 ?AUTO_2167 ) ) ( CLEAR ?AUTO_2170 ) ( not ( = ?AUTO_2164 ?AUTO_2166 ) ) ( not ( = ?AUTO_2164 ?AUTO_2170 ) ) ( not ( = ?AUTO_2165 ?AUTO_2166 ) ) ( not ( = ?AUTO_2165 ?AUTO_2170 ) ) ( not ( = ?AUTO_2167 ?AUTO_2166 ) ) ( not ( = ?AUTO_2167 ?AUTO_2170 ) ) ( not ( = ?AUTO_2166 ?AUTO_2170 ) ) ( ON ?AUTO_2166 ?AUTO_2165 ) ( not ( = ?AUTO_2164 ?AUTO_2169 ) ) ( not ( = ?AUTO_2165 ?AUTO_2169 ) ) ( not ( = ?AUTO_2167 ?AUTO_2169 ) ) ( not ( = ?AUTO_2170 ?AUTO_2169 ) ) ( not ( = ?AUTO_2166 ?AUTO_2169 ) ) ( ON ?AUTO_2169 ?AUTO_2166 ) ( not ( = ?AUTO_2164 ?AUTO_2168 ) ) ( not ( = ?AUTO_2165 ?AUTO_2168 ) ) ( not ( = ?AUTO_2167 ?AUTO_2168 ) ) ( not ( = ?AUTO_2170 ?AUTO_2168 ) ) ( not ( = ?AUTO_2166 ?AUTO_2168 ) ) ( not ( = ?AUTO_2169 ?AUTO_2168 ) ) ( ON ?AUTO_2168 ?AUTO_2169 ) ( CLEAR ?AUTO_2168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2168 ?AUTO_2169 )
      ( MAKE-ON ?AUTO_2164 ?AUTO_2165 )
      ( MAKE-ON-VERIFY ?AUTO_2164 ?AUTO_2165 ) )
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
      ?AUTO_2176 - BLOCK
      ?AUTO_2174 - BLOCK
      ?AUTO_2177 - BLOCK
      ?AUTO_2175 - BLOCK
      ?AUTO_2178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2171 ?AUTO_2172 ) ) ( ON ?AUTO_2171 ?AUTO_2173 ) ( CLEAR ?AUTO_2171 ) ( not ( = ?AUTO_2171 ?AUTO_2173 ) ) ( not ( = ?AUTO_2172 ?AUTO_2173 ) ) ( CLEAR ?AUTO_2176 ) ( not ( = ?AUTO_2171 ?AUTO_2174 ) ) ( not ( = ?AUTO_2171 ?AUTO_2176 ) ) ( not ( = ?AUTO_2172 ?AUTO_2174 ) ) ( not ( = ?AUTO_2172 ?AUTO_2176 ) ) ( not ( = ?AUTO_2173 ?AUTO_2174 ) ) ( not ( = ?AUTO_2173 ?AUTO_2176 ) ) ( not ( = ?AUTO_2174 ?AUTO_2176 ) ) ( ON ?AUTO_2174 ?AUTO_2172 ) ( not ( = ?AUTO_2171 ?AUTO_2177 ) ) ( not ( = ?AUTO_2172 ?AUTO_2177 ) ) ( not ( = ?AUTO_2173 ?AUTO_2177 ) ) ( not ( = ?AUTO_2176 ?AUTO_2177 ) ) ( not ( = ?AUTO_2174 ?AUTO_2177 ) ) ( ON ?AUTO_2177 ?AUTO_2174 ) ( not ( = ?AUTO_2171 ?AUTO_2175 ) ) ( not ( = ?AUTO_2172 ?AUTO_2175 ) ) ( not ( = ?AUTO_2173 ?AUTO_2175 ) ) ( not ( = ?AUTO_2176 ?AUTO_2175 ) ) ( not ( = ?AUTO_2174 ?AUTO_2175 ) ) ( not ( = ?AUTO_2177 ?AUTO_2175 ) ) ( ON ?AUTO_2175 ?AUTO_2177 ) ( CLEAR ?AUTO_2175 ) ( HOLDING ?AUTO_2178 ) ( not ( = ?AUTO_2171 ?AUTO_2178 ) ) ( not ( = ?AUTO_2172 ?AUTO_2178 ) ) ( not ( = ?AUTO_2173 ?AUTO_2178 ) ) ( not ( = ?AUTO_2176 ?AUTO_2178 ) ) ( not ( = ?AUTO_2174 ?AUTO_2178 ) ) ( not ( = ?AUTO_2177 ?AUTO_2178 ) ) ( not ( = ?AUTO_2175 ?AUTO_2178 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2178 )
      ( MAKE-ON ?AUTO_2171 ?AUTO_2172 )
      ( MAKE-ON-VERIFY ?AUTO_2171 ?AUTO_2172 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2179 - BLOCK
      ?AUTO_2180 - BLOCK
    )
    :vars
    (
      ?AUTO_2183 - BLOCK
      ?AUTO_2186 - BLOCK
      ?AUTO_2182 - BLOCK
      ?AUTO_2181 - BLOCK
      ?AUTO_2184 - BLOCK
      ?AUTO_2185 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2179 ?AUTO_2180 ) ) ( ON ?AUTO_2179 ?AUTO_2183 ) ( CLEAR ?AUTO_2179 ) ( not ( = ?AUTO_2179 ?AUTO_2183 ) ) ( not ( = ?AUTO_2180 ?AUTO_2183 ) ) ( CLEAR ?AUTO_2186 ) ( not ( = ?AUTO_2179 ?AUTO_2182 ) ) ( not ( = ?AUTO_2179 ?AUTO_2186 ) ) ( not ( = ?AUTO_2180 ?AUTO_2182 ) ) ( not ( = ?AUTO_2180 ?AUTO_2186 ) ) ( not ( = ?AUTO_2183 ?AUTO_2182 ) ) ( not ( = ?AUTO_2183 ?AUTO_2186 ) ) ( not ( = ?AUTO_2182 ?AUTO_2186 ) ) ( ON ?AUTO_2182 ?AUTO_2180 ) ( not ( = ?AUTO_2179 ?AUTO_2181 ) ) ( not ( = ?AUTO_2180 ?AUTO_2181 ) ) ( not ( = ?AUTO_2183 ?AUTO_2181 ) ) ( not ( = ?AUTO_2186 ?AUTO_2181 ) ) ( not ( = ?AUTO_2182 ?AUTO_2181 ) ) ( ON ?AUTO_2181 ?AUTO_2182 ) ( not ( = ?AUTO_2179 ?AUTO_2184 ) ) ( not ( = ?AUTO_2180 ?AUTO_2184 ) ) ( not ( = ?AUTO_2183 ?AUTO_2184 ) ) ( not ( = ?AUTO_2186 ?AUTO_2184 ) ) ( not ( = ?AUTO_2182 ?AUTO_2184 ) ) ( not ( = ?AUTO_2181 ?AUTO_2184 ) ) ( ON ?AUTO_2184 ?AUTO_2181 ) ( not ( = ?AUTO_2179 ?AUTO_2185 ) ) ( not ( = ?AUTO_2180 ?AUTO_2185 ) ) ( not ( = ?AUTO_2183 ?AUTO_2185 ) ) ( not ( = ?AUTO_2186 ?AUTO_2185 ) ) ( not ( = ?AUTO_2182 ?AUTO_2185 ) ) ( not ( = ?AUTO_2181 ?AUTO_2185 ) ) ( not ( = ?AUTO_2184 ?AUTO_2185 ) ) ( ON ?AUTO_2185 ?AUTO_2184 ) ( CLEAR ?AUTO_2185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2185 ?AUTO_2184 )
      ( MAKE-ON ?AUTO_2179 ?AUTO_2180 )
      ( MAKE-ON-VERIFY ?AUTO_2179 ?AUTO_2180 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2188 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2188 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2188 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2188 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2189 - BLOCK
    )
    :vars
    (
      ?AUTO_2190 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2189 ?AUTO_2190 ) ( CLEAR ?AUTO_2189 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2189 ?AUTO_2190 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2189 ?AUTO_2190 )
      ( MAKE-ON-TABLE ?AUTO_2189 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2189 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2191 - BLOCK
    )
    :vars
    (
      ?AUTO_2192 - BLOCK
      ?AUTO_2193 - BLOCK
      ?AUTO_2194 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2191 ?AUTO_2192 ) ( CLEAR ?AUTO_2191 ) ( not ( = ?AUTO_2191 ?AUTO_2192 ) ) ( HOLDING ?AUTO_2193 ) ( CLEAR ?AUTO_2194 ) ( not ( = ?AUTO_2191 ?AUTO_2193 ) ) ( not ( = ?AUTO_2191 ?AUTO_2194 ) ) ( not ( = ?AUTO_2192 ?AUTO_2193 ) ) ( not ( = ?AUTO_2192 ?AUTO_2194 ) ) ( not ( = ?AUTO_2193 ?AUTO_2194 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2193 ?AUTO_2194 )
      ( MAKE-ON-TABLE ?AUTO_2191 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2191 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2195 - BLOCK
    )
    :vars
    (
      ?AUTO_2196 - BLOCK
      ?AUTO_2198 - BLOCK
      ?AUTO_2197 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2195 ?AUTO_2196 ) ( not ( = ?AUTO_2195 ?AUTO_2196 ) ) ( CLEAR ?AUTO_2198 ) ( not ( = ?AUTO_2195 ?AUTO_2197 ) ) ( not ( = ?AUTO_2195 ?AUTO_2198 ) ) ( not ( = ?AUTO_2196 ?AUTO_2197 ) ) ( not ( = ?AUTO_2196 ?AUTO_2198 ) ) ( not ( = ?AUTO_2197 ?AUTO_2198 ) ) ( ON ?AUTO_2197 ?AUTO_2195 ) ( CLEAR ?AUTO_2197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2197 ?AUTO_2195 )
      ( MAKE-ON-TABLE ?AUTO_2195 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2195 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2199 - BLOCK
    )
    :vars
    (
      ?AUTO_2200 - BLOCK
      ?AUTO_2202 - BLOCK
      ?AUTO_2201 - BLOCK
      ?AUTO_2203 - BLOCK
      ?AUTO_2204 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2199 ?AUTO_2200 ) ( not ( = ?AUTO_2199 ?AUTO_2200 ) ) ( CLEAR ?AUTO_2202 ) ( not ( = ?AUTO_2199 ?AUTO_2201 ) ) ( not ( = ?AUTO_2199 ?AUTO_2202 ) ) ( not ( = ?AUTO_2200 ?AUTO_2201 ) ) ( not ( = ?AUTO_2200 ?AUTO_2202 ) ) ( not ( = ?AUTO_2201 ?AUTO_2202 ) ) ( ON ?AUTO_2201 ?AUTO_2199 ) ( CLEAR ?AUTO_2201 ) ( HOLDING ?AUTO_2203 ) ( CLEAR ?AUTO_2204 ) ( not ( = ?AUTO_2199 ?AUTO_2203 ) ) ( not ( = ?AUTO_2199 ?AUTO_2204 ) ) ( not ( = ?AUTO_2200 ?AUTO_2203 ) ) ( not ( = ?AUTO_2200 ?AUTO_2204 ) ) ( not ( = ?AUTO_2202 ?AUTO_2203 ) ) ( not ( = ?AUTO_2202 ?AUTO_2204 ) ) ( not ( = ?AUTO_2201 ?AUTO_2203 ) ) ( not ( = ?AUTO_2201 ?AUTO_2204 ) ) ( not ( = ?AUTO_2203 ?AUTO_2204 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2203 ?AUTO_2204 )
      ( MAKE-ON-TABLE ?AUTO_2199 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2199 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2217 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2217 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2217 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2217 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2218 - BLOCK
    )
    :vars
    (
      ?AUTO_2219 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2218 ?AUTO_2219 ) ( CLEAR ?AUTO_2218 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2218 ?AUTO_2219 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2218 ?AUTO_2219 )
      ( MAKE-ON-TABLE ?AUTO_2218 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2218 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2220 - BLOCK
    )
    :vars
    (
      ?AUTO_2221 - BLOCK
      ?AUTO_2222 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2220 ?AUTO_2221 ) ( CLEAR ?AUTO_2220 ) ( not ( = ?AUTO_2220 ?AUTO_2221 ) ) ( HOLDING ?AUTO_2222 ) ( not ( = ?AUTO_2220 ?AUTO_2222 ) ) ( not ( = ?AUTO_2221 ?AUTO_2222 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2222 )
      ( MAKE-ON-TABLE ?AUTO_2220 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2220 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2223 - BLOCK
    )
    :vars
    (
      ?AUTO_2225 - BLOCK
      ?AUTO_2224 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2223 ?AUTO_2225 ) ( not ( = ?AUTO_2223 ?AUTO_2225 ) ) ( not ( = ?AUTO_2223 ?AUTO_2224 ) ) ( not ( = ?AUTO_2225 ?AUTO_2224 ) ) ( ON ?AUTO_2224 ?AUTO_2223 ) ( CLEAR ?AUTO_2224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2224 ?AUTO_2223 )
      ( MAKE-ON-TABLE ?AUTO_2223 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2223 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2226 - BLOCK
    )
    :vars
    (
      ?AUTO_2227 - BLOCK
      ?AUTO_2228 - BLOCK
      ?AUTO_2229 - BLOCK
      ?AUTO_2230 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2226 ?AUTO_2227 ) ( not ( = ?AUTO_2226 ?AUTO_2227 ) ) ( not ( = ?AUTO_2226 ?AUTO_2228 ) ) ( not ( = ?AUTO_2227 ?AUTO_2228 ) ) ( ON ?AUTO_2228 ?AUTO_2226 ) ( CLEAR ?AUTO_2228 ) ( HOLDING ?AUTO_2229 ) ( CLEAR ?AUTO_2230 ) ( not ( = ?AUTO_2226 ?AUTO_2229 ) ) ( not ( = ?AUTO_2226 ?AUTO_2230 ) ) ( not ( = ?AUTO_2227 ?AUTO_2229 ) ) ( not ( = ?AUTO_2227 ?AUTO_2230 ) ) ( not ( = ?AUTO_2228 ?AUTO_2229 ) ) ( not ( = ?AUTO_2228 ?AUTO_2230 ) ) ( not ( = ?AUTO_2229 ?AUTO_2230 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2229 ?AUTO_2230 )
      ( MAKE-ON-TABLE ?AUTO_2226 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2226 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2231 - BLOCK
    )
    :vars
    (
      ?AUTO_2232 - BLOCK
      ?AUTO_2233 - BLOCK
      ?AUTO_2234 - BLOCK
      ?AUTO_2235 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2231 ?AUTO_2232 ) ( not ( = ?AUTO_2231 ?AUTO_2232 ) ) ( not ( = ?AUTO_2231 ?AUTO_2233 ) ) ( not ( = ?AUTO_2232 ?AUTO_2233 ) ) ( ON ?AUTO_2233 ?AUTO_2231 ) ( CLEAR ?AUTO_2234 ) ( not ( = ?AUTO_2231 ?AUTO_2235 ) ) ( not ( = ?AUTO_2231 ?AUTO_2234 ) ) ( not ( = ?AUTO_2232 ?AUTO_2235 ) ) ( not ( = ?AUTO_2232 ?AUTO_2234 ) ) ( not ( = ?AUTO_2233 ?AUTO_2235 ) ) ( not ( = ?AUTO_2233 ?AUTO_2234 ) ) ( not ( = ?AUTO_2235 ?AUTO_2234 ) ) ( ON ?AUTO_2235 ?AUTO_2233 ) ( CLEAR ?AUTO_2235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2235 ?AUTO_2233 )
      ( MAKE-ON-TABLE ?AUTO_2231 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2231 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2236 - BLOCK
    )
    :vars
    (
      ?AUTO_2238 - BLOCK
      ?AUTO_2239 - BLOCK
      ?AUTO_2237 - BLOCK
      ?AUTO_2240 - BLOCK
      ?AUTO_2241 - BLOCK
      ?AUTO_2242 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2236 ?AUTO_2238 ) ( not ( = ?AUTO_2236 ?AUTO_2238 ) ) ( not ( = ?AUTO_2236 ?AUTO_2239 ) ) ( not ( = ?AUTO_2238 ?AUTO_2239 ) ) ( ON ?AUTO_2239 ?AUTO_2236 ) ( CLEAR ?AUTO_2237 ) ( not ( = ?AUTO_2236 ?AUTO_2240 ) ) ( not ( = ?AUTO_2236 ?AUTO_2237 ) ) ( not ( = ?AUTO_2238 ?AUTO_2240 ) ) ( not ( = ?AUTO_2238 ?AUTO_2237 ) ) ( not ( = ?AUTO_2239 ?AUTO_2240 ) ) ( not ( = ?AUTO_2239 ?AUTO_2237 ) ) ( not ( = ?AUTO_2240 ?AUTO_2237 ) ) ( ON ?AUTO_2240 ?AUTO_2239 ) ( CLEAR ?AUTO_2240 ) ( HOLDING ?AUTO_2241 ) ( CLEAR ?AUTO_2242 ) ( not ( = ?AUTO_2236 ?AUTO_2241 ) ) ( not ( = ?AUTO_2236 ?AUTO_2242 ) ) ( not ( = ?AUTO_2238 ?AUTO_2241 ) ) ( not ( = ?AUTO_2238 ?AUTO_2242 ) ) ( not ( = ?AUTO_2239 ?AUTO_2241 ) ) ( not ( = ?AUTO_2239 ?AUTO_2242 ) ) ( not ( = ?AUTO_2237 ?AUTO_2241 ) ) ( not ( = ?AUTO_2237 ?AUTO_2242 ) ) ( not ( = ?AUTO_2240 ?AUTO_2241 ) ) ( not ( = ?AUTO_2240 ?AUTO_2242 ) ) ( not ( = ?AUTO_2241 ?AUTO_2242 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2241 ?AUTO_2242 )
      ( MAKE-ON-TABLE ?AUTO_2236 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2236 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2256 - BLOCK
      ?AUTO_2257 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2256 ) ( CLEAR ?AUTO_2257 ) ( not ( = ?AUTO_2256 ?AUTO_2257 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2256 ?AUTO_2257 )
      ( MAKE-ON-VERIFY ?AUTO_2256 ?AUTO_2257 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2258 - BLOCK
      ?AUTO_2259 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2259 ) ( not ( = ?AUTO_2258 ?AUTO_2259 ) ) ( ON-TABLE ?AUTO_2258 ) ( CLEAR ?AUTO_2258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2258 )
      ( MAKE-ON ?AUTO_2258 ?AUTO_2259 )
      ( MAKE-ON-VERIFY ?AUTO_2258 ?AUTO_2259 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2260 - BLOCK
      ?AUTO_2261 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2260 ?AUTO_2261 ) ) ( ON-TABLE ?AUTO_2260 ) ( CLEAR ?AUTO_2260 ) ( HOLDING ?AUTO_2261 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2261 )
      ( MAKE-ON ?AUTO_2260 ?AUTO_2261 )
      ( MAKE-ON-VERIFY ?AUTO_2260 ?AUTO_2261 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2378 - BLOCK
      ?AUTO_2379 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2378 ) ( CLEAR ?AUTO_2379 ) ( not ( = ?AUTO_2378 ?AUTO_2379 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2378 ?AUTO_2379 )
      ( MAKE-ON-VERIFY ?AUTO_2378 ?AUTO_2379 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2380 - BLOCK
      ?AUTO_2381 - BLOCK
    )
    :vars
    (
      ?AUTO_2382 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2381 ) ( not ( = ?AUTO_2380 ?AUTO_2381 ) ) ( ON ?AUTO_2380 ?AUTO_2382 ) ( CLEAR ?AUTO_2380 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2380 ?AUTO_2382 ) ) ( not ( = ?AUTO_2381 ?AUTO_2382 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2380 ?AUTO_2382 )
      ( MAKE-ON ?AUTO_2380 ?AUTO_2381 )
      ( MAKE-ON-VERIFY ?AUTO_2380 ?AUTO_2381 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2383 - BLOCK
      ?AUTO_2384 - BLOCK
    )
    :vars
    (
      ?AUTO_2385 - BLOCK
      ?AUTO_2386 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2383 ?AUTO_2384 ) ) ( ON ?AUTO_2383 ?AUTO_2385 ) ( CLEAR ?AUTO_2383 ) ( not ( = ?AUTO_2383 ?AUTO_2385 ) ) ( not ( = ?AUTO_2384 ?AUTO_2385 ) ) ( HOLDING ?AUTO_2384 ) ( CLEAR ?AUTO_2386 ) ( not ( = ?AUTO_2383 ?AUTO_2386 ) ) ( not ( = ?AUTO_2384 ?AUTO_2386 ) ) ( not ( = ?AUTO_2385 ?AUTO_2386 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2384 ?AUTO_2386 )
      ( MAKE-ON ?AUTO_2383 ?AUTO_2384 )
      ( MAKE-ON-VERIFY ?AUTO_2383 ?AUTO_2384 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2389 - BLOCK
      ?AUTO_2390 - BLOCK
    )
    :vars
    (
      ?AUTO_2391 - BLOCK
      ?AUTO_2392 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2390 ) ( not ( = ?AUTO_2389 ?AUTO_2390 ) ) ( ON ?AUTO_2389 ?AUTO_2391 ) ( CLEAR ?AUTO_2389 ) ( not ( = ?AUTO_2389 ?AUTO_2391 ) ) ( not ( = ?AUTO_2390 ?AUTO_2391 ) ) ( HOLDING ?AUTO_2392 ) ( not ( = ?AUTO_2389 ?AUTO_2392 ) ) ( not ( = ?AUTO_2390 ?AUTO_2392 ) ) ( not ( = ?AUTO_2391 ?AUTO_2392 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2392 )
      ( MAKE-ON ?AUTO_2389 ?AUTO_2390 )
      ( MAKE-ON-VERIFY ?AUTO_2389 ?AUTO_2390 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2488 - BLOCK
      ?AUTO_2489 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2488 ) ( CLEAR ?AUTO_2489 ) ( not ( = ?AUTO_2488 ?AUTO_2489 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2488 ?AUTO_2489 )
      ( MAKE-ON-VERIFY ?AUTO_2488 ?AUTO_2489 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2490 - BLOCK
      ?AUTO_2491 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2491 ) ( not ( = ?AUTO_2490 ?AUTO_2491 ) ) ( ON-TABLE ?AUTO_2490 ) ( CLEAR ?AUTO_2490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2490 )
      ( MAKE-ON ?AUTO_2490 ?AUTO_2491 )
      ( MAKE-ON-VERIFY ?AUTO_2490 ?AUTO_2491 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2492 - BLOCK
      ?AUTO_2493 - BLOCK
    )
    :vars
    (
      ?AUTO_2494 - BLOCK
      ?AUTO_2495 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2493 ) ( not ( = ?AUTO_2492 ?AUTO_2493 ) ) ( ON-TABLE ?AUTO_2492 ) ( CLEAR ?AUTO_2492 ) ( HOLDING ?AUTO_2494 ) ( CLEAR ?AUTO_2495 ) ( not ( = ?AUTO_2492 ?AUTO_2494 ) ) ( not ( = ?AUTO_2492 ?AUTO_2495 ) ) ( not ( = ?AUTO_2493 ?AUTO_2494 ) ) ( not ( = ?AUTO_2493 ?AUTO_2495 ) ) ( not ( = ?AUTO_2494 ?AUTO_2495 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2494 ?AUTO_2495 )
      ( MAKE-ON ?AUTO_2492 ?AUTO_2493 )
      ( MAKE-ON-VERIFY ?AUTO_2492 ?AUTO_2493 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2496 - BLOCK
      ?AUTO_2497 - BLOCK
    )
    :vars
    (
      ?AUTO_2498 - BLOCK
      ?AUTO_2499 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2497 ) ( not ( = ?AUTO_2496 ?AUTO_2497 ) ) ( ON-TABLE ?AUTO_2496 ) ( CLEAR ?AUTO_2498 ) ( not ( = ?AUTO_2496 ?AUTO_2499 ) ) ( not ( = ?AUTO_2496 ?AUTO_2498 ) ) ( not ( = ?AUTO_2497 ?AUTO_2499 ) ) ( not ( = ?AUTO_2497 ?AUTO_2498 ) ) ( not ( = ?AUTO_2499 ?AUTO_2498 ) ) ( ON ?AUTO_2499 ?AUTO_2496 ) ( CLEAR ?AUTO_2499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2499 ?AUTO_2496 )
      ( MAKE-ON ?AUTO_2496 ?AUTO_2497 )
      ( MAKE-ON-VERIFY ?AUTO_2496 ?AUTO_2497 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2500 - BLOCK
      ?AUTO_2501 - BLOCK
    )
    :vars
    (
      ?AUTO_2502 - BLOCK
      ?AUTO_2503 - BLOCK
      ?AUTO_2504 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2501 ) ( not ( = ?AUTO_2500 ?AUTO_2501 ) ) ( ON-TABLE ?AUTO_2500 ) ( not ( = ?AUTO_2500 ?AUTO_2502 ) ) ( not ( = ?AUTO_2500 ?AUTO_2503 ) ) ( not ( = ?AUTO_2501 ?AUTO_2502 ) ) ( not ( = ?AUTO_2501 ?AUTO_2503 ) ) ( not ( = ?AUTO_2502 ?AUTO_2503 ) ) ( ON ?AUTO_2502 ?AUTO_2500 ) ( CLEAR ?AUTO_2502 ) ( HOLDING ?AUTO_2503 ) ( CLEAR ?AUTO_2504 ) ( not ( = ?AUTO_2500 ?AUTO_2504 ) ) ( not ( = ?AUTO_2501 ?AUTO_2504 ) ) ( not ( = ?AUTO_2502 ?AUTO_2504 ) ) ( not ( = ?AUTO_2503 ?AUTO_2504 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2503 ?AUTO_2504 )
      ( MAKE-ON ?AUTO_2500 ?AUTO_2501 )
      ( MAKE-ON-VERIFY ?AUTO_2500 ?AUTO_2501 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2509 - BLOCK
      ?AUTO_2510 - BLOCK
    )
    :vars
    (
      ?AUTO_2512 - BLOCK
      ?AUTO_2513 - BLOCK
      ?AUTO_2511 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2509 ?AUTO_2510 ) ) ( ON-TABLE ?AUTO_2509 ) ( not ( = ?AUTO_2509 ?AUTO_2512 ) ) ( not ( = ?AUTO_2509 ?AUTO_2513 ) ) ( not ( = ?AUTO_2510 ?AUTO_2512 ) ) ( not ( = ?AUTO_2510 ?AUTO_2513 ) ) ( not ( = ?AUTO_2512 ?AUTO_2513 ) ) ( ON ?AUTO_2512 ?AUTO_2509 ) ( CLEAR ?AUTO_2512 ) ( CLEAR ?AUTO_2511 ) ( not ( = ?AUTO_2509 ?AUTO_2511 ) ) ( not ( = ?AUTO_2510 ?AUTO_2511 ) ) ( not ( = ?AUTO_2512 ?AUTO_2511 ) ) ( not ( = ?AUTO_2513 ?AUTO_2511 ) ) ( ON ?AUTO_2513 ?AUTO_2510 ) ( CLEAR ?AUTO_2513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2513 ?AUTO_2510 )
      ( MAKE-ON ?AUTO_2509 ?AUTO_2510 )
      ( MAKE-ON-VERIFY ?AUTO_2509 ?AUTO_2510 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2514 - BLOCK
      ?AUTO_2515 - BLOCK
    )
    :vars
    (
      ?AUTO_2516 - BLOCK
      ?AUTO_2518 - BLOCK
      ?AUTO_2517 - BLOCK
      ?AUTO_2519 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2514 ?AUTO_2515 ) ) ( ON-TABLE ?AUTO_2514 ) ( not ( = ?AUTO_2514 ?AUTO_2516 ) ) ( not ( = ?AUTO_2514 ?AUTO_2518 ) ) ( not ( = ?AUTO_2515 ?AUTO_2516 ) ) ( not ( = ?AUTO_2515 ?AUTO_2518 ) ) ( not ( = ?AUTO_2516 ?AUTO_2518 ) ) ( ON ?AUTO_2516 ?AUTO_2514 ) ( CLEAR ?AUTO_2516 ) ( CLEAR ?AUTO_2517 ) ( not ( = ?AUTO_2514 ?AUTO_2517 ) ) ( not ( = ?AUTO_2515 ?AUTO_2517 ) ) ( not ( = ?AUTO_2516 ?AUTO_2517 ) ) ( not ( = ?AUTO_2518 ?AUTO_2517 ) ) ( ON ?AUTO_2518 ?AUTO_2515 ) ( CLEAR ?AUTO_2518 ) ( HOLDING ?AUTO_2519 ) ( not ( = ?AUTO_2514 ?AUTO_2519 ) ) ( not ( = ?AUTO_2515 ?AUTO_2519 ) ) ( not ( = ?AUTO_2516 ?AUTO_2519 ) ) ( not ( = ?AUTO_2518 ?AUTO_2519 ) ) ( not ( = ?AUTO_2517 ?AUTO_2519 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2519 )
      ( MAKE-ON ?AUTO_2514 ?AUTO_2515 )
      ( MAKE-ON-VERIFY ?AUTO_2514 ?AUTO_2515 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2520 - BLOCK
      ?AUTO_2521 - BLOCK
    )
    :vars
    (
      ?AUTO_2522 - BLOCK
      ?AUTO_2525 - BLOCK
      ?AUTO_2523 - BLOCK
      ?AUTO_2524 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2520 ?AUTO_2521 ) ) ( ON-TABLE ?AUTO_2520 ) ( not ( = ?AUTO_2520 ?AUTO_2522 ) ) ( not ( = ?AUTO_2520 ?AUTO_2525 ) ) ( not ( = ?AUTO_2521 ?AUTO_2522 ) ) ( not ( = ?AUTO_2521 ?AUTO_2525 ) ) ( not ( = ?AUTO_2522 ?AUTO_2525 ) ) ( ON ?AUTO_2522 ?AUTO_2520 ) ( CLEAR ?AUTO_2522 ) ( CLEAR ?AUTO_2523 ) ( not ( = ?AUTO_2520 ?AUTO_2523 ) ) ( not ( = ?AUTO_2521 ?AUTO_2523 ) ) ( not ( = ?AUTO_2522 ?AUTO_2523 ) ) ( not ( = ?AUTO_2525 ?AUTO_2523 ) ) ( ON ?AUTO_2525 ?AUTO_2521 ) ( not ( = ?AUTO_2520 ?AUTO_2524 ) ) ( not ( = ?AUTO_2521 ?AUTO_2524 ) ) ( not ( = ?AUTO_2522 ?AUTO_2524 ) ) ( not ( = ?AUTO_2525 ?AUTO_2524 ) ) ( not ( = ?AUTO_2523 ?AUTO_2524 ) ) ( ON ?AUTO_2524 ?AUTO_2525 ) ( CLEAR ?AUTO_2524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2524 ?AUTO_2525 )
      ( MAKE-ON ?AUTO_2520 ?AUTO_2521 )
      ( MAKE-ON-VERIFY ?AUTO_2520 ?AUTO_2521 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2526 - BLOCK
      ?AUTO_2527 - BLOCK
    )
    :vars
    (
      ?AUTO_2531 - BLOCK
      ?AUTO_2530 - BLOCK
      ?AUTO_2529 - BLOCK
      ?AUTO_2528 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2526 ?AUTO_2527 ) ) ( ON-TABLE ?AUTO_2526 ) ( not ( = ?AUTO_2526 ?AUTO_2531 ) ) ( not ( = ?AUTO_2526 ?AUTO_2530 ) ) ( not ( = ?AUTO_2527 ?AUTO_2531 ) ) ( not ( = ?AUTO_2527 ?AUTO_2530 ) ) ( not ( = ?AUTO_2531 ?AUTO_2530 ) ) ( CLEAR ?AUTO_2529 ) ( not ( = ?AUTO_2526 ?AUTO_2529 ) ) ( not ( = ?AUTO_2527 ?AUTO_2529 ) ) ( not ( = ?AUTO_2531 ?AUTO_2529 ) ) ( not ( = ?AUTO_2530 ?AUTO_2529 ) ) ( ON ?AUTO_2530 ?AUTO_2527 ) ( not ( = ?AUTO_2526 ?AUTO_2528 ) ) ( not ( = ?AUTO_2527 ?AUTO_2528 ) ) ( not ( = ?AUTO_2531 ?AUTO_2528 ) ) ( not ( = ?AUTO_2530 ?AUTO_2528 ) ) ( not ( = ?AUTO_2529 ?AUTO_2528 ) ) ( ON ?AUTO_2528 ?AUTO_2530 ) ( CLEAR ?AUTO_2528 ) ( HOLDING ?AUTO_2531 ) ( CLEAR ?AUTO_2526 ) )
    :subtasks
    ( ( !STACK ?AUTO_2531 ?AUTO_2526 )
      ( MAKE-ON ?AUTO_2526 ?AUTO_2527 )
      ( MAKE-ON-VERIFY ?AUTO_2526 ?AUTO_2527 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2532 - BLOCK
      ?AUTO_2533 - BLOCK
    )
    :vars
    (
      ?AUTO_2534 - BLOCK
      ?AUTO_2537 - BLOCK
      ?AUTO_2535 - BLOCK
      ?AUTO_2536 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2532 ?AUTO_2533 ) ) ( ON-TABLE ?AUTO_2532 ) ( not ( = ?AUTO_2532 ?AUTO_2534 ) ) ( not ( = ?AUTO_2532 ?AUTO_2537 ) ) ( not ( = ?AUTO_2533 ?AUTO_2534 ) ) ( not ( = ?AUTO_2533 ?AUTO_2537 ) ) ( not ( = ?AUTO_2534 ?AUTO_2537 ) ) ( CLEAR ?AUTO_2535 ) ( not ( = ?AUTO_2532 ?AUTO_2535 ) ) ( not ( = ?AUTO_2533 ?AUTO_2535 ) ) ( not ( = ?AUTO_2534 ?AUTO_2535 ) ) ( not ( = ?AUTO_2537 ?AUTO_2535 ) ) ( ON ?AUTO_2537 ?AUTO_2533 ) ( not ( = ?AUTO_2532 ?AUTO_2536 ) ) ( not ( = ?AUTO_2533 ?AUTO_2536 ) ) ( not ( = ?AUTO_2534 ?AUTO_2536 ) ) ( not ( = ?AUTO_2537 ?AUTO_2536 ) ) ( not ( = ?AUTO_2535 ?AUTO_2536 ) ) ( ON ?AUTO_2536 ?AUTO_2537 ) ( CLEAR ?AUTO_2532 ) ( ON ?AUTO_2534 ?AUTO_2536 ) ( CLEAR ?AUTO_2534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2534 ?AUTO_2536 )
      ( MAKE-ON ?AUTO_2532 ?AUTO_2533 )
      ( MAKE-ON-VERIFY ?AUTO_2532 ?AUTO_2533 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2538 - BLOCK
      ?AUTO_2539 - BLOCK
    )
    :vars
    (
      ?AUTO_2543 - BLOCK
      ?AUTO_2542 - BLOCK
      ?AUTO_2540 - BLOCK
      ?AUTO_2541 - BLOCK
      ?AUTO_2544 - BLOCK
      ?AUTO_2545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2538 ?AUTO_2539 ) ) ( ON-TABLE ?AUTO_2538 ) ( not ( = ?AUTO_2538 ?AUTO_2543 ) ) ( not ( = ?AUTO_2538 ?AUTO_2542 ) ) ( not ( = ?AUTO_2539 ?AUTO_2543 ) ) ( not ( = ?AUTO_2539 ?AUTO_2542 ) ) ( not ( = ?AUTO_2543 ?AUTO_2542 ) ) ( CLEAR ?AUTO_2540 ) ( not ( = ?AUTO_2538 ?AUTO_2540 ) ) ( not ( = ?AUTO_2539 ?AUTO_2540 ) ) ( not ( = ?AUTO_2543 ?AUTO_2540 ) ) ( not ( = ?AUTO_2542 ?AUTO_2540 ) ) ( ON ?AUTO_2542 ?AUTO_2539 ) ( not ( = ?AUTO_2538 ?AUTO_2541 ) ) ( not ( = ?AUTO_2539 ?AUTO_2541 ) ) ( not ( = ?AUTO_2543 ?AUTO_2541 ) ) ( not ( = ?AUTO_2542 ?AUTO_2541 ) ) ( not ( = ?AUTO_2540 ?AUTO_2541 ) ) ( ON ?AUTO_2541 ?AUTO_2542 ) ( CLEAR ?AUTO_2538 ) ( ON ?AUTO_2543 ?AUTO_2541 ) ( CLEAR ?AUTO_2543 ) ( HOLDING ?AUTO_2544 ) ( CLEAR ?AUTO_2545 ) ( not ( = ?AUTO_2538 ?AUTO_2544 ) ) ( not ( = ?AUTO_2538 ?AUTO_2545 ) ) ( not ( = ?AUTO_2539 ?AUTO_2544 ) ) ( not ( = ?AUTO_2539 ?AUTO_2545 ) ) ( not ( = ?AUTO_2543 ?AUTO_2544 ) ) ( not ( = ?AUTO_2543 ?AUTO_2545 ) ) ( not ( = ?AUTO_2542 ?AUTO_2544 ) ) ( not ( = ?AUTO_2542 ?AUTO_2545 ) ) ( not ( = ?AUTO_2540 ?AUTO_2544 ) ) ( not ( = ?AUTO_2540 ?AUTO_2545 ) ) ( not ( = ?AUTO_2541 ?AUTO_2544 ) ) ( not ( = ?AUTO_2541 ?AUTO_2545 ) ) ( not ( = ?AUTO_2544 ?AUTO_2545 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2544 ?AUTO_2545 )
      ( MAKE-ON ?AUTO_2538 ?AUTO_2539 )
      ( MAKE-ON-VERIFY ?AUTO_2538 ?AUTO_2539 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2554 - BLOCK
      ?AUTO_2555 - BLOCK
    )
    :vars
    (
      ?AUTO_2561 - BLOCK
      ?AUTO_2559 - BLOCK
      ?AUTO_2557 - BLOCK
      ?AUTO_2556 - BLOCK
      ?AUTO_2560 - BLOCK
      ?AUTO_2558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2554 ?AUTO_2555 ) ) ( ON-TABLE ?AUTO_2554 ) ( not ( = ?AUTO_2554 ?AUTO_2561 ) ) ( not ( = ?AUTO_2554 ?AUTO_2559 ) ) ( not ( = ?AUTO_2555 ?AUTO_2561 ) ) ( not ( = ?AUTO_2555 ?AUTO_2559 ) ) ( not ( = ?AUTO_2561 ?AUTO_2559 ) ) ( CLEAR ?AUTO_2557 ) ( not ( = ?AUTO_2554 ?AUTO_2557 ) ) ( not ( = ?AUTO_2555 ?AUTO_2557 ) ) ( not ( = ?AUTO_2561 ?AUTO_2557 ) ) ( not ( = ?AUTO_2559 ?AUTO_2557 ) ) ( ON ?AUTO_2559 ?AUTO_2555 ) ( not ( = ?AUTO_2554 ?AUTO_2556 ) ) ( not ( = ?AUTO_2555 ?AUTO_2556 ) ) ( not ( = ?AUTO_2561 ?AUTO_2556 ) ) ( not ( = ?AUTO_2559 ?AUTO_2556 ) ) ( not ( = ?AUTO_2557 ?AUTO_2556 ) ) ( ON ?AUTO_2556 ?AUTO_2559 ) ( ON ?AUTO_2561 ?AUTO_2556 ) ( CLEAR ?AUTO_2561 ) ( CLEAR ?AUTO_2560 ) ( not ( = ?AUTO_2554 ?AUTO_2558 ) ) ( not ( = ?AUTO_2554 ?AUTO_2560 ) ) ( not ( = ?AUTO_2555 ?AUTO_2558 ) ) ( not ( = ?AUTO_2555 ?AUTO_2560 ) ) ( not ( = ?AUTO_2561 ?AUTO_2558 ) ) ( not ( = ?AUTO_2561 ?AUTO_2560 ) ) ( not ( = ?AUTO_2559 ?AUTO_2558 ) ) ( not ( = ?AUTO_2559 ?AUTO_2560 ) ) ( not ( = ?AUTO_2557 ?AUTO_2558 ) ) ( not ( = ?AUTO_2557 ?AUTO_2560 ) ) ( not ( = ?AUTO_2556 ?AUTO_2558 ) ) ( not ( = ?AUTO_2556 ?AUTO_2560 ) ) ( not ( = ?AUTO_2558 ?AUTO_2560 ) ) ( ON ?AUTO_2558 ?AUTO_2554 ) ( CLEAR ?AUTO_2558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2558 ?AUTO_2554 )
      ( MAKE-ON ?AUTO_2554 ?AUTO_2555 )
      ( MAKE-ON-VERIFY ?AUTO_2554 ?AUTO_2555 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2562 - BLOCK
      ?AUTO_2563 - BLOCK
    )
    :vars
    (
      ?AUTO_2569 - BLOCK
      ?AUTO_2565 - BLOCK
      ?AUTO_2564 - BLOCK
      ?AUTO_2567 - BLOCK
      ?AUTO_2568 - BLOCK
      ?AUTO_2566 - BLOCK
      ?AUTO_2570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2562 ?AUTO_2563 ) ) ( ON-TABLE ?AUTO_2562 ) ( not ( = ?AUTO_2562 ?AUTO_2569 ) ) ( not ( = ?AUTO_2562 ?AUTO_2565 ) ) ( not ( = ?AUTO_2563 ?AUTO_2569 ) ) ( not ( = ?AUTO_2563 ?AUTO_2565 ) ) ( not ( = ?AUTO_2569 ?AUTO_2565 ) ) ( CLEAR ?AUTO_2564 ) ( not ( = ?AUTO_2562 ?AUTO_2564 ) ) ( not ( = ?AUTO_2563 ?AUTO_2564 ) ) ( not ( = ?AUTO_2569 ?AUTO_2564 ) ) ( not ( = ?AUTO_2565 ?AUTO_2564 ) ) ( ON ?AUTO_2565 ?AUTO_2563 ) ( not ( = ?AUTO_2562 ?AUTO_2567 ) ) ( not ( = ?AUTO_2563 ?AUTO_2567 ) ) ( not ( = ?AUTO_2569 ?AUTO_2567 ) ) ( not ( = ?AUTO_2565 ?AUTO_2567 ) ) ( not ( = ?AUTO_2564 ?AUTO_2567 ) ) ( ON ?AUTO_2567 ?AUTO_2565 ) ( ON ?AUTO_2569 ?AUTO_2567 ) ( CLEAR ?AUTO_2569 ) ( CLEAR ?AUTO_2568 ) ( not ( = ?AUTO_2562 ?AUTO_2566 ) ) ( not ( = ?AUTO_2562 ?AUTO_2568 ) ) ( not ( = ?AUTO_2563 ?AUTO_2566 ) ) ( not ( = ?AUTO_2563 ?AUTO_2568 ) ) ( not ( = ?AUTO_2569 ?AUTO_2566 ) ) ( not ( = ?AUTO_2569 ?AUTO_2568 ) ) ( not ( = ?AUTO_2565 ?AUTO_2566 ) ) ( not ( = ?AUTO_2565 ?AUTO_2568 ) ) ( not ( = ?AUTO_2564 ?AUTO_2566 ) ) ( not ( = ?AUTO_2564 ?AUTO_2568 ) ) ( not ( = ?AUTO_2567 ?AUTO_2566 ) ) ( not ( = ?AUTO_2567 ?AUTO_2568 ) ) ( not ( = ?AUTO_2566 ?AUTO_2568 ) ) ( ON ?AUTO_2566 ?AUTO_2562 ) ( CLEAR ?AUTO_2566 ) ( HOLDING ?AUTO_2570 ) ( not ( = ?AUTO_2562 ?AUTO_2570 ) ) ( not ( = ?AUTO_2563 ?AUTO_2570 ) ) ( not ( = ?AUTO_2569 ?AUTO_2570 ) ) ( not ( = ?AUTO_2565 ?AUTO_2570 ) ) ( not ( = ?AUTO_2564 ?AUTO_2570 ) ) ( not ( = ?AUTO_2567 ?AUTO_2570 ) ) ( not ( = ?AUTO_2568 ?AUTO_2570 ) ) ( not ( = ?AUTO_2566 ?AUTO_2570 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2570 )
      ( MAKE-ON ?AUTO_2562 ?AUTO_2563 )
      ( MAKE-ON-VERIFY ?AUTO_2562 ?AUTO_2563 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2571 - BLOCK
      ?AUTO_2572 - BLOCK
    )
    :vars
    (
      ?AUTO_2579 - BLOCK
      ?AUTO_2574 - BLOCK
      ?AUTO_2576 - BLOCK
      ?AUTO_2577 - BLOCK
      ?AUTO_2573 - BLOCK
      ?AUTO_2578 - BLOCK
      ?AUTO_2575 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2571 ?AUTO_2572 ) ) ( ON-TABLE ?AUTO_2571 ) ( not ( = ?AUTO_2571 ?AUTO_2579 ) ) ( not ( = ?AUTO_2571 ?AUTO_2574 ) ) ( not ( = ?AUTO_2572 ?AUTO_2579 ) ) ( not ( = ?AUTO_2572 ?AUTO_2574 ) ) ( not ( = ?AUTO_2579 ?AUTO_2574 ) ) ( CLEAR ?AUTO_2576 ) ( not ( = ?AUTO_2571 ?AUTO_2576 ) ) ( not ( = ?AUTO_2572 ?AUTO_2576 ) ) ( not ( = ?AUTO_2579 ?AUTO_2576 ) ) ( not ( = ?AUTO_2574 ?AUTO_2576 ) ) ( ON ?AUTO_2574 ?AUTO_2572 ) ( not ( = ?AUTO_2571 ?AUTO_2577 ) ) ( not ( = ?AUTO_2572 ?AUTO_2577 ) ) ( not ( = ?AUTO_2579 ?AUTO_2577 ) ) ( not ( = ?AUTO_2574 ?AUTO_2577 ) ) ( not ( = ?AUTO_2576 ?AUTO_2577 ) ) ( ON ?AUTO_2577 ?AUTO_2574 ) ( ON ?AUTO_2579 ?AUTO_2577 ) ( CLEAR ?AUTO_2579 ) ( CLEAR ?AUTO_2573 ) ( not ( = ?AUTO_2571 ?AUTO_2578 ) ) ( not ( = ?AUTO_2571 ?AUTO_2573 ) ) ( not ( = ?AUTO_2572 ?AUTO_2578 ) ) ( not ( = ?AUTO_2572 ?AUTO_2573 ) ) ( not ( = ?AUTO_2579 ?AUTO_2578 ) ) ( not ( = ?AUTO_2579 ?AUTO_2573 ) ) ( not ( = ?AUTO_2574 ?AUTO_2578 ) ) ( not ( = ?AUTO_2574 ?AUTO_2573 ) ) ( not ( = ?AUTO_2576 ?AUTO_2578 ) ) ( not ( = ?AUTO_2576 ?AUTO_2573 ) ) ( not ( = ?AUTO_2577 ?AUTO_2578 ) ) ( not ( = ?AUTO_2577 ?AUTO_2573 ) ) ( not ( = ?AUTO_2578 ?AUTO_2573 ) ) ( ON ?AUTO_2578 ?AUTO_2571 ) ( not ( = ?AUTO_2571 ?AUTO_2575 ) ) ( not ( = ?AUTO_2572 ?AUTO_2575 ) ) ( not ( = ?AUTO_2579 ?AUTO_2575 ) ) ( not ( = ?AUTO_2574 ?AUTO_2575 ) ) ( not ( = ?AUTO_2576 ?AUTO_2575 ) ) ( not ( = ?AUTO_2577 ?AUTO_2575 ) ) ( not ( = ?AUTO_2573 ?AUTO_2575 ) ) ( not ( = ?AUTO_2578 ?AUTO_2575 ) ) ( ON ?AUTO_2575 ?AUTO_2578 ) ( CLEAR ?AUTO_2575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2575 ?AUTO_2578 )
      ( MAKE-ON ?AUTO_2571 ?AUTO_2572 )
      ( MAKE-ON-VERIFY ?AUTO_2571 ?AUTO_2572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2580 - BLOCK
      ?AUTO_2581 - BLOCK
    )
    :vars
    (
      ?AUTO_2585 - BLOCK
      ?AUTO_2583 - BLOCK
      ?AUTO_2588 - BLOCK
      ?AUTO_2587 - BLOCK
      ?AUTO_2582 - BLOCK
      ?AUTO_2586 - BLOCK
      ?AUTO_2584 - BLOCK
      ?AUTO_2589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2580 ?AUTO_2581 ) ) ( ON-TABLE ?AUTO_2580 ) ( not ( = ?AUTO_2580 ?AUTO_2585 ) ) ( not ( = ?AUTO_2580 ?AUTO_2583 ) ) ( not ( = ?AUTO_2581 ?AUTO_2585 ) ) ( not ( = ?AUTO_2581 ?AUTO_2583 ) ) ( not ( = ?AUTO_2585 ?AUTO_2583 ) ) ( CLEAR ?AUTO_2588 ) ( not ( = ?AUTO_2580 ?AUTO_2588 ) ) ( not ( = ?AUTO_2581 ?AUTO_2588 ) ) ( not ( = ?AUTO_2585 ?AUTO_2588 ) ) ( not ( = ?AUTO_2583 ?AUTO_2588 ) ) ( ON ?AUTO_2583 ?AUTO_2581 ) ( not ( = ?AUTO_2580 ?AUTO_2587 ) ) ( not ( = ?AUTO_2581 ?AUTO_2587 ) ) ( not ( = ?AUTO_2585 ?AUTO_2587 ) ) ( not ( = ?AUTO_2583 ?AUTO_2587 ) ) ( not ( = ?AUTO_2588 ?AUTO_2587 ) ) ( ON ?AUTO_2587 ?AUTO_2583 ) ( ON ?AUTO_2585 ?AUTO_2587 ) ( CLEAR ?AUTO_2585 ) ( CLEAR ?AUTO_2582 ) ( not ( = ?AUTO_2580 ?AUTO_2586 ) ) ( not ( = ?AUTO_2580 ?AUTO_2582 ) ) ( not ( = ?AUTO_2581 ?AUTO_2586 ) ) ( not ( = ?AUTO_2581 ?AUTO_2582 ) ) ( not ( = ?AUTO_2585 ?AUTO_2586 ) ) ( not ( = ?AUTO_2585 ?AUTO_2582 ) ) ( not ( = ?AUTO_2583 ?AUTO_2586 ) ) ( not ( = ?AUTO_2583 ?AUTO_2582 ) ) ( not ( = ?AUTO_2588 ?AUTO_2586 ) ) ( not ( = ?AUTO_2588 ?AUTO_2582 ) ) ( not ( = ?AUTO_2587 ?AUTO_2586 ) ) ( not ( = ?AUTO_2587 ?AUTO_2582 ) ) ( not ( = ?AUTO_2586 ?AUTO_2582 ) ) ( ON ?AUTO_2586 ?AUTO_2580 ) ( not ( = ?AUTO_2580 ?AUTO_2584 ) ) ( not ( = ?AUTO_2581 ?AUTO_2584 ) ) ( not ( = ?AUTO_2585 ?AUTO_2584 ) ) ( not ( = ?AUTO_2583 ?AUTO_2584 ) ) ( not ( = ?AUTO_2588 ?AUTO_2584 ) ) ( not ( = ?AUTO_2587 ?AUTO_2584 ) ) ( not ( = ?AUTO_2582 ?AUTO_2584 ) ) ( not ( = ?AUTO_2586 ?AUTO_2584 ) ) ( ON ?AUTO_2584 ?AUTO_2586 ) ( CLEAR ?AUTO_2584 ) ( HOLDING ?AUTO_2589 ) ( not ( = ?AUTO_2580 ?AUTO_2589 ) ) ( not ( = ?AUTO_2581 ?AUTO_2589 ) ) ( not ( = ?AUTO_2585 ?AUTO_2589 ) ) ( not ( = ?AUTO_2583 ?AUTO_2589 ) ) ( not ( = ?AUTO_2588 ?AUTO_2589 ) ) ( not ( = ?AUTO_2587 ?AUTO_2589 ) ) ( not ( = ?AUTO_2582 ?AUTO_2589 ) ) ( not ( = ?AUTO_2586 ?AUTO_2589 ) ) ( not ( = ?AUTO_2584 ?AUTO_2589 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2589 )
      ( MAKE-ON ?AUTO_2580 ?AUTO_2581 )
      ( MAKE-ON-VERIFY ?AUTO_2580 ?AUTO_2581 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2590 - BLOCK
      ?AUTO_2591 - BLOCK
    )
    :vars
    (
      ?AUTO_2596 - BLOCK
      ?AUTO_2593 - BLOCK
      ?AUTO_2598 - BLOCK
      ?AUTO_2595 - BLOCK
      ?AUTO_2592 - BLOCK
      ?AUTO_2594 - BLOCK
      ?AUTO_2597 - BLOCK
      ?AUTO_2599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2590 ?AUTO_2591 ) ) ( ON-TABLE ?AUTO_2590 ) ( not ( = ?AUTO_2590 ?AUTO_2596 ) ) ( not ( = ?AUTO_2590 ?AUTO_2593 ) ) ( not ( = ?AUTO_2591 ?AUTO_2596 ) ) ( not ( = ?AUTO_2591 ?AUTO_2593 ) ) ( not ( = ?AUTO_2596 ?AUTO_2593 ) ) ( CLEAR ?AUTO_2598 ) ( not ( = ?AUTO_2590 ?AUTO_2598 ) ) ( not ( = ?AUTO_2591 ?AUTO_2598 ) ) ( not ( = ?AUTO_2596 ?AUTO_2598 ) ) ( not ( = ?AUTO_2593 ?AUTO_2598 ) ) ( ON ?AUTO_2593 ?AUTO_2591 ) ( not ( = ?AUTO_2590 ?AUTO_2595 ) ) ( not ( = ?AUTO_2591 ?AUTO_2595 ) ) ( not ( = ?AUTO_2596 ?AUTO_2595 ) ) ( not ( = ?AUTO_2593 ?AUTO_2595 ) ) ( not ( = ?AUTO_2598 ?AUTO_2595 ) ) ( ON ?AUTO_2595 ?AUTO_2593 ) ( ON ?AUTO_2596 ?AUTO_2595 ) ( CLEAR ?AUTO_2596 ) ( CLEAR ?AUTO_2592 ) ( not ( = ?AUTO_2590 ?AUTO_2594 ) ) ( not ( = ?AUTO_2590 ?AUTO_2592 ) ) ( not ( = ?AUTO_2591 ?AUTO_2594 ) ) ( not ( = ?AUTO_2591 ?AUTO_2592 ) ) ( not ( = ?AUTO_2596 ?AUTO_2594 ) ) ( not ( = ?AUTO_2596 ?AUTO_2592 ) ) ( not ( = ?AUTO_2593 ?AUTO_2594 ) ) ( not ( = ?AUTO_2593 ?AUTO_2592 ) ) ( not ( = ?AUTO_2598 ?AUTO_2594 ) ) ( not ( = ?AUTO_2598 ?AUTO_2592 ) ) ( not ( = ?AUTO_2595 ?AUTO_2594 ) ) ( not ( = ?AUTO_2595 ?AUTO_2592 ) ) ( not ( = ?AUTO_2594 ?AUTO_2592 ) ) ( ON ?AUTO_2594 ?AUTO_2590 ) ( not ( = ?AUTO_2590 ?AUTO_2597 ) ) ( not ( = ?AUTO_2591 ?AUTO_2597 ) ) ( not ( = ?AUTO_2596 ?AUTO_2597 ) ) ( not ( = ?AUTO_2593 ?AUTO_2597 ) ) ( not ( = ?AUTO_2598 ?AUTO_2597 ) ) ( not ( = ?AUTO_2595 ?AUTO_2597 ) ) ( not ( = ?AUTO_2592 ?AUTO_2597 ) ) ( not ( = ?AUTO_2594 ?AUTO_2597 ) ) ( ON ?AUTO_2597 ?AUTO_2594 ) ( not ( = ?AUTO_2590 ?AUTO_2599 ) ) ( not ( = ?AUTO_2591 ?AUTO_2599 ) ) ( not ( = ?AUTO_2596 ?AUTO_2599 ) ) ( not ( = ?AUTO_2593 ?AUTO_2599 ) ) ( not ( = ?AUTO_2598 ?AUTO_2599 ) ) ( not ( = ?AUTO_2595 ?AUTO_2599 ) ) ( not ( = ?AUTO_2592 ?AUTO_2599 ) ) ( not ( = ?AUTO_2594 ?AUTO_2599 ) ) ( not ( = ?AUTO_2597 ?AUTO_2599 ) ) ( ON ?AUTO_2599 ?AUTO_2597 ) ( CLEAR ?AUTO_2599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2599 ?AUTO_2597 )
      ( MAKE-ON ?AUTO_2590 ?AUTO_2591 )
      ( MAKE-ON-VERIFY ?AUTO_2590 ?AUTO_2591 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2600 - BLOCK
      ?AUTO_2601 - BLOCK
    )
    :vars
    (
      ?AUTO_2606 - BLOCK
      ?AUTO_2602 - BLOCK
      ?AUTO_2604 - BLOCK
      ?AUTO_2607 - BLOCK
      ?AUTO_2609 - BLOCK
      ?AUTO_2608 - BLOCK
      ?AUTO_2605 - BLOCK
      ?AUTO_2603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2600 ?AUTO_2601 ) ) ( ON-TABLE ?AUTO_2600 ) ( not ( = ?AUTO_2600 ?AUTO_2606 ) ) ( not ( = ?AUTO_2600 ?AUTO_2602 ) ) ( not ( = ?AUTO_2601 ?AUTO_2606 ) ) ( not ( = ?AUTO_2601 ?AUTO_2602 ) ) ( not ( = ?AUTO_2606 ?AUTO_2602 ) ) ( not ( = ?AUTO_2600 ?AUTO_2604 ) ) ( not ( = ?AUTO_2601 ?AUTO_2604 ) ) ( not ( = ?AUTO_2606 ?AUTO_2604 ) ) ( not ( = ?AUTO_2602 ?AUTO_2604 ) ) ( ON ?AUTO_2602 ?AUTO_2601 ) ( not ( = ?AUTO_2600 ?AUTO_2607 ) ) ( not ( = ?AUTO_2601 ?AUTO_2607 ) ) ( not ( = ?AUTO_2606 ?AUTO_2607 ) ) ( not ( = ?AUTO_2602 ?AUTO_2607 ) ) ( not ( = ?AUTO_2604 ?AUTO_2607 ) ) ( ON ?AUTO_2607 ?AUTO_2602 ) ( ON ?AUTO_2606 ?AUTO_2607 ) ( CLEAR ?AUTO_2606 ) ( CLEAR ?AUTO_2609 ) ( not ( = ?AUTO_2600 ?AUTO_2608 ) ) ( not ( = ?AUTO_2600 ?AUTO_2609 ) ) ( not ( = ?AUTO_2601 ?AUTO_2608 ) ) ( not ( = ?AUTO_2601 ?AUTO_2609 ) ) ( not ( = ?AUTO_2606 ?AUTO_2608 ) ) ( not ( = ?AUTO_2606 ?AUTO_2609 ) ) ( not ( = ?AUTO_2602 ?AUTO_2608 ) ) ( not ( = ?AUTO_2602 ?AUTO_2609 ) ) ( not ( = ?AUTO_2604 ?AUTO_2608 ) ) ( not ( = ?AUTO_2604 ?AUTO_2609 ) ) ( not ( = ?AUTO_2607 ?AUTO_2608 ) ) ( not ( = ?AUTO_2607 ?AUTO_2609 ) ) ( not ( = ?AUTO_2608 ?AUTO_2609 ) ) ( ON ?AUTO_2608 ?AUTO_2600 ) ( not ( = ?AUTO_2600 ?AUTO_2605 ) ) ( not ( = ?AUTO_2601 ?AUTO_2605 ) ) ( not ( = ?AUTO_2606 ?AUTO_2605 ) ) ( not ( = ?AUTO_2602 ?AUTO_2605 ) ) ( not ( = ?AUTO_2604 ?AUTO_2605 ) ) ( not ( = ?AUTO_2607 ?AUTO_2605 ) ) ( not ( = ?AUTO_2609 ?AUTO_2605 ) ) ( not ( = ?AUTO_2608 ?AUTO_2605 ) ) ( ON ?AUTO_2605 ?AUTO_2608 ) ( not ( = ?AUTO_2600 ?AUTO_2603 ) ) ( not ( = ?AUTO_2601 ?AUTO_2603 ) ) ( not ( = ?AUTO_2606 ?AUTO_2603 ) ) ( not ( = ?AUTO_2602 ?AUTO_2603 ) ) ( not ( = ?AUTO_2604 ?AUTO_2603 ) ) ( not ( = ?AUTO_2607 ?AUTO_2603 ) ) ( not ( = ?AUTO_2609 ?AUTO_2603 ) ) ( not ( = ?AUTO_2608 ?AUTO_2603 ) ) ( not ( = ?AUTO_2605 ?AUTO_2603 ) ) ( ON ?AUTO_2603 ?AUTO_2605 ) ( CLEAR ?AUTO_2603 ) ( HOLDING ?AUTO_2604 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2604 )
      ( MAKE-ON ?AUTO_2600 ?AUTO_2601 )
      ( MAKE-ON-VERIFY ?AUTO_2600 ?AUTO_2601 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2610 - BLOCK
      ?AUTO_2611 - BLOCK
    )
    :vars
    (
      ?AUTO_2616 - BLOCK
      ?AUTO_2617 - BLOCK
      ?AUTO_2613 - BLOCK
      ?AUTO_2619 - BLOCK
      ?AUTO_2615 - BLOCK
      ?AUTO_2618 - BLOCK
      ?AUTO_2612 - BLOCK
      ?AUTO_2614 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2610 ?AUTO_2611 ) ) ( ON-TABLE ?AUTO_2610 ) ( not ( = ?AUTO_2610 ?AUTO_2616 ) ) ( not ( = ?AUTO_2610 ?AUTO_2617 ) ) ( not ( = ?AUTO_2611 ?AUTO_2616 ) ) ( not ( = ?AUTO_2611 ?AUTO_2617 ) ) ( not ( = ?AUTO_2616 ?AUTO_2617 ) ) ( not ( = ?AUTO_2610 ?AUTO_2613 ) ) ( not ( = ?AUTO_2611 ?AUTO_2613 ) ) ( not ( = ?AUTO_2616 ?AUTO_2613 ) ) ( not ( = ?AUTO_2617 ?AUTO_2613 ) ) ( ON ?AUTO_2617 ?AUTO_2611 ) ( not ( = ?AUTO_2610 ?AUTO_2619 ) ) ( not ( = ?AUTO_2611 ?AUTO_2619 ) ) ( not ( = ?AUTO_2616 ?AUTO_2619 ) ) ( not ( = ?AUTO_2617 ?AUTO_2619 ) ) ( not ( = ?AUTO_2613 ?AUTO_2619 ) ) ( ON ?AUTO_2619 ?AUTO_2617 ) ( ON ?AUTO_2616 ?AUTO_2619 ) ( CLEAR ?AUTO_2616 ) ( CLEAR ?AUTO_2615 ) ( not ( = ?AUTO_2610 ?AUTO_2618 ) ) ( not ( = ?AUTO_2610 ?AUTO_2615 ) ) ( not ( = ?AUTO_2611 ?AUTO_2618 ) ) ( not ( = ?AUTO_2611 ?AUTO_2615 ) ) ( not ( = ?AUTO_2616 ?AUTO_2618 ) ) ( not ( = ?AUTO_2616 ?AUTO_2615 ) ) ( not ( = ?AUTO_2617 ?AUTO_2618 ) ) ( not ( = ?AUTO_2617 ?AUTO_2615 ) ) ( not ( = ?AUTO_2613 ?AUTO_2618 ) ) ( not ( = ?AUTO_2613 ?AUTO_2615 ) ) ( not ( = ?AUTO_2619 ?AUTO_2618 ) ) ( not ( = ?AUTO_2619 ?AUTO_2615 ) ) ( not ( = ?AUTO_2618 ?AUTO_2615 ) ) ( ON ?AUTO_2618 ?AUTO_2610 ) ( not ( = ?AUTO_2610 ?AUTO_2612 ) ) ( not ( = ?AUTO_2611 ?AUTO_2612 ) ) ( not ( = ?AUTO_2616 ?AUTO_2612 ) ) ( not ( = ?AUTO_2617 ?AUTO_2612 ) ) ( not ( = ?AUTO_2613 ?AUTO_2612 ) ) ( not ( = ?AUTO_2619 ?AUTO_2612 ) ) ( not ( = ?AUTO_2615 ?AUTO_2612 ) ) ( not ( = ?AUTO_2618 ?AUTO_2612 ) ) ( ON ?AUTO_2612 ?AUTO_2618 ) ( not ( = ?AUTO_2610 ?AUTO_2614 ) ) ( not ( = ?AUTO_2611 ?AUTO_2614 ) ) ( not ( = ?AUTO_2616 ?AUTO_2614 ) ) ( not ( = ?AUTO_2617 ?AUTO_2614 ) ) ( not ( = ?AUTO_2613 ?AUTO_2614 ) ) ( not ( = ?AUTO_2619 ?AUTO_2614 ) ) ( not ( = ?AUTO_2615 ?AUTO_2614 ) ) ( not ( = ?AUTO_2618 ?AUTO_2614 ) ) ( not ( = ?AUTO_2612 ?AUTO_2614 ) ) ( ON ?AUTO_2614 ?AUTO_2612 ) ( ON ?AUTO_2613 ?AUTO_2614 ) ( CLEAR ?AUTO_2613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2613 ?AUTO_2614 )
      ( MAKE-ON ?AUTO_2610 ?AUTO_2611 )
      ( MAKE-ON-VERIFY ?AUTO_2610 ?AUTO_2611 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2621 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2621 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2621 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2621 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2622 - BLOCK
    )
    :vars
    (
      ?AUTO_2623 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2622 ?AUTO_2623 ) ( CLEAR ?AUTO_2622 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2622 ?AUTO_2623 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2622 ?AUTO_2623 )
      ( MAKE-ON-TABLE ?AUTO_2622 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2622 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2626 - BLOCK
      ?AUTO_2627 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2626 ) ( CLEAR ?AUTO_2627 ) ( not ( = ?AUTO_2626 ?AUTO_2627 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2626 ?AUTO_2627 )
      ( MAKE-ON-VERIFY ?AUTO_2626 ?AUTO_2627 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2628 - BLOCK
      ?AUTO_2629 - BLOCK
    )
    :vars
    (
      ?AUTO_2630 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2629 ) ( not ( = ?AUTO_2628 ?AUTO_2629 ) ) ( ON ?AUTO_2628 ?AUTO_2630 ) ( CLEAR ?AUTO_2628 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2628 ?AUTO_2630 ) ) ( not ( = ?AUTO_2629 ?AUTO_2630 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2628 ?AUTO_2630 )
      ( MAKE-ON ?AUTO_2628 ?AUTO_2629 )
      ( MAKE-ON-VERIFY ?AUTO_2628 ?AUTO_2629 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2631 - BLOCK
      ?AUTO_2632 - BLOCK
    )
    :vars
    (
      ?AUTO_2633 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2631 ?AUTO_2632 ) ) ( ON ?AUTO_2631 ?AUTO_2633 ) ( CLEAR ?AUTO_2631 ) ( not ( = ?AUTO_2631 ?AUTO_2633 ) ) ( not ( = ?AUTO_2632 ?AUTO_2633 ) ) ( HOLDING ?AUTO_2632 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2632 )
      ( MAKE-ON ?AUTO_2631 ?AUTO_2632 )
      ( MAKE-ON-VERIFY ?AUTO_2631 ?AUTO_2632 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2637 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2637 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2637 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2637 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2638 - BLOCK
    )
    :vars
    (
      ?AUTO_2639 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2638 ?AUTO_2639 ) ( CLEAR ?AUTO_2638 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2638 ?AUTO_2639 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2638 ?AUTO_2639 )
      ( MAKE-ON-TABLE ?AUTO_2638 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2638 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2640 - BLOCK
    )
    :vars
    (
      ?AUTO_2641 - BLOCK
      ?AUTO_2642 - BLOCK
      ?AUTO_2643 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2640 ?AUTO_2641 ) ( CLEAR ?AUTO_2640 ) ( not ( = ?AUTO_2640 ?AUTO_2641 ) ) ( HOLDING ?AUTO_2642 ) ( CLEAR ?AUTO_2643 ) ( not ( = ?AUTO_2640 ?AUTO_2642 ) ) ( not ( = ?AUTO_2640 ?AUTO_2643 ) ) ( not ( = ?AUTO_2641 ?AUTO_2642 ) ) ( not ( = ?AUTO_2641 ?AUTO_2643 ) ) ( not ( = ?AUTO_2642 ?AUTO_2643 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2642 ?AUTO_2643 )
      ( MAKE-ON-TABLE ?AUTO_2640 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2640 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2644 - BLOCK
    )
    :vars
    (
      ?AUTO_2645 - BLOCK
      ?AUTO_2647 - BLOCK
      ?AUTO_2646 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2644 ?AUTO_2645 ) ( not ( = ?AUTO_2644 ?AUTO_2645 ) ) ( CLEAR ?AUTO_2647 ) ( not ( = ?AUTO_2644 ?AUTO_2646 ) ) ( not ( = ?AUTO_2644 ?AUTO_2647 ) ) ( not ( = ?AUTO_2645 ?AUTO_2646 ) ) ( not ( = ?AUTO_2645 ?AUTO_2647 ) ) ( not ( = ?AUTO_2646 ?AUTO_2647 ) ) ( ON ?AUTO_2646 ?AUTO_2644 ) ( CLEAR ?AUTO_2646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2646 ?AUTO_2644 )
      ( MAKE-ON-TABLE ?AUTO_2644 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2644 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2648 - BLOCK
    )
    :vars
    (
      ?AUTO_2649 - BLOCK
      ?AUTO_2650 - BLOCK
      ?AUTO_2651 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2648 ?AUTO_2649 ) ( not ( = ?AUTO_2648 ?AUTO_2649 ) ) ( not ( = ?AUTO_2648 ?AUTO_2650 ) ) ( not ( = ?AUTO_2648 ?AUTO_2651 ) ) ( not ( = ?AUTO_2649 ?AUTO_2650 ) ) ( not ( = ?AUTO_2649 ?AUTO_2651 ) ) ( not ( = ?AUTO_2650 ?AUTO_2651 ) ) ( ON ?AUTO_2650 ?AUTO_2648 ) ( CLEAR ?AUTO_2650 ) ( HOLDING ?AUTO_2651 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2651 )
      ( MAKE-ON-TABLE ?AUTO_2648 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2648 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2655 - BLOCK
      ?AUTO_2656 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2655 ) ( CLEAR ?AUTO_2656 ) ( not ( = ?AUTO_2655 ?AUTO_2656 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2655 ?AUTO_2656 )
      ( MAKE-ON-VERIFY ?AUTO_2655 ?AUTO_2656 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2657 - BLOCK
      ?AUTO_2658 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2658 ) ( not ( = ?AUTO_2657 ?AUTO_2658 ) ) ( ON-TABLE ?AUTO_2657 ) ( CLEAR ?AUTO_2657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2657 )
      ( MAKE-ON ?AUTO_2657 ?AUTO_2658 )
      ( MAKE-ON-VERIFY ?AUTO_2657 ?AUTO_2658 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2659 - BLOCK
      ?AUTO_2660 - BLOCK
    )
    :vars
    (
      ?AUTO_2661 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2660 ) ( not ( = ?AUTO_2659 ?AUTO_2660 ) ) ( ON-TABLE ?AUTO_2659 ) ( CLEAR ?AUTO_2659 ) ( HOLDING ?AUTO_2661 ) ( not ( = ?AUTO_2659 ?AUTO_2661 ) ) ( not ( = ?AUTO_2660 ?AUTO_2661 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2661 )
      ( MAKE-ON ?AUTO_2659 ?AUTO_2660 )
      ( MAKE-ON-VERIFY ?AUTO_2659 ?AUTO_2660 ) )
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
    )
    :precondition
    ( and ( CLEAR ?AUTO_2663 ) ( not ( = ?AUTO_2662 ?AUTO_2663 ) ) ( ON-TABLE ?AUTO_2662 ) ( not ( = ?AUTO_2662 ?AUTO_2664 ) ) ( not ( = ?AUTO_2663 ?AUTO_2664 ) ) ( ON ?AUTO_2664 ?AUTO_2662 ) ( CLEAR ?AUTO_2664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2664 ?AUTO_2662 )
      ( MAKE-ON ?AUTO_2662 ?AUTO_2663 )
      ( MAKE-ON-VERIFY ?AUTO_2662 ?AUTO_2663 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2665 - BLOCK
      ?AUTO_2666 - BLOCK
    )
    :vars
    (
      ?AUTO_2667 - BLOCK
      ?AUTO_2668 - BLOCK
      ?AUTO_2669 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2666 ) ( not ( = ?AUTO_2665 ?AUTO_2666 ) ) ( ON-TABLE ?AUTO_2665 ) ( not ( = ?AUTO_2665 ?AUTO_2667 ) ) ( not ( = ?AUTO_2666 ?AUTO_2667 ) ) ( ON ?AUTO_2667 ?AUTO_2665 ) ( CLEAR ?AUTO_2667 ) ( HOLDING ?AUTO_2668 ) ( CLEAR ?AUTO_2669 ) ( not ( = ?AUTO_2665 ?AUTO_2668 ) ) ( not ( = ?AUTO_2665 ?AUTO_2669 ) ) ( not ( = ?AUTO_2666 ?AUTO_2668 ) ) ( not ( = ?AUTO_2666 ?AUTO_2669 ) ) ( not ( = ?AUTO_2667 ?AUTO_2668 ) ) ( not ( = ?AUTO_2667 ?AUTO_2669 ) ) ( not ( = ?AUTO_2668 ?AUTO_2669 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2668 ?AUTO_2669 )
      ( MAKE-ON ?AUTO_2665 ?AUTO_2666 )
      ( MAKE-ON-VERIFY ?AUTO_2665 ?AUTO_2666 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2670 - BLOCK
      ?AUTO_2671 - BLOCK
    )
    :vars
    (
      ?AUTO_2672 - BLOCK
      ?AUTO_2673 - BLOCK
      ?AUTO_2674 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2671 ) ( not ( = ?AUTO_2670 ?AUTO_2671 ) ) ( ON-TABLE ?AUTO_2670 ) ( not ( = ?AUTO_2670 ?AUTO_2672 ) ) ( not ( = ?AUTO_2671 ?AUTO_2672 ) ) ( ON ?AUTO_2672 ?AUTO_2670 ) ( CLEAR ?AUTO_2673 ) ( not ( = ?AUTO_2670 ?AUTO_2674 ) ) ( not ( = ?AUTO_2670 ?AUTO_2673 ) ) ( not ( = ?AUTO_2671 ?AUTO_2674 ) ) ( not ( = ?AUTO_2671 ?AUTO_2673 ) ) ( not ( = ?AUTO_2672 ?AUTO_2674 ) ) ( not ( = ?AUTO_2672 ?AUTO_2673 ) ) ( not ( = ?AUTO_2674 ?AUTO_2673 ) ) ( ON ?AUTO_2674 ?AUTO_2672 ) ( CLEAR ?AUTO_2674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2674 ?AUTO_2672 )
      ( MAKE-ON ?AUTO_2670 ?AUTO_2671 )
      ( MAKE-ON-VERIFY ?AUTO_2670 ?AUTO_2671 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2675 - BLOCK
      ?AUTO_2676 - BLOCK
    )
    :vars
    (
      ?AUTO_2678 - BLOCK
      ?AUTO_2679 - BLOCK
      ?AUTO_2677 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2676 ) ( not ( = ?AUTO_2675 ?AUTO_2676 ) ) ( ON-TABLE ?AUTO_2675 ) ( not ( = ?AUTO_2675 ?AUTO_2678 ) ) ( not ( = ?AUTO_2676 ?AUTO_2678 ) ) ( ON ?AUTO_2678 ?AUTO_2675 ) ( not ( = ?AUTO_2675 ?AUTO_2679 ) ) ( not ( = ?AUTO_2675 ?AUTO_2677 ) ) ( not ( = ?AUTO_2676 ?AUTO_2679 ) ) ( not ( = ?AUTO_2676 ?AUTO_2677 ) ) ( not ( = ?AUTO_2678 ?AUTO_2679 ) ) ( not ( = ?AUTO_2678 ?AUTO_2677 ) ) ( not ( = ?AUTO_2679 ?AUTO_2677 ) ) ( ON ?AUTO_2679 ?AUTO_2678 ) ( CLEAR ?AUTO_2679 ) ( HOLDING ?AUTO_2677 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2677 )
      ( MAKE-ON ?AUTO_2675 ?AUTO_2676 )
      ( MAKE-ON-VERIFY ?AUTO_2675 ?AUTO_2676 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2680 - BLOCK
      ?AUTO_2681 - BLOCK
    )
    :vars
    (
      ?AUTO_2683 - BLOCK
      ?AUTO_2684 - BLOCK
      ?AUTO_2682 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2680 ?AUTO_2681 ) ) ( ON-TABLE ?AUTO_2680 ) ( not ( = ?AUTO_2680 ?AUTO_2683 ) ) ( not ( = ?AUTO_2681 ?AUTO_2683 ) ) ( ON ?AUTO_2683 ?AUTO_2680 ) ( not ( = ?AUTO_2680 ?AUTO_2684 ) ) ( not ( = ?AUTO_2680 ?AUTO_2682 ) ) ( not ( = ?AUTO_2681 ?AUTO_2684 ) ) ( not ( = ?AUTO_2681 ?AUTO_2682 ) ) ( not ( = ?AUTO_2683 ?AUTO_2684 ) ) ( not ( = ?AUTO_2683 ?AUTO_2682 ) ) ( not ( = ?AUTO_2684 ?AUTO_2682 ) ) ( ON ?AUTO_2684 ?AUTO_2683 ) ( CLEAR ?AUTO_2684 ) ( ON ?AUTO_2682 ?AUTO_2681 ) ( CLEAR ?AUTO_2682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2682 ?AUTO_2681 )
      ( MAKE-ON ?AUTO_2680 ?AUTO_2681 )
      ( MAKE-ON-VERIFY ?AUTO_2680 ?AUTO_2681 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2686 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2686 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2686 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2686 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2687 - BLOCK
    )
    :vars
    (
      ?AUTO_2688 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2687 ?AUTO_2688 ) ( CLEAR ?AUTO_2687 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2687 ?AUTO_2688 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2687 ?AUTO_2688 )
      ( MAKE-ON-TABLE ?AUTO_2687 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2687 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2690 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2690 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2690 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2690 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2691 - BLOCK
    )
    :vars
    (
      ?AUTO_2692 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2691 ?AUTO_2692 ) ( CLEAR ?AUTO_2691 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2691 ?AUTO_2692 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2691 ?AUTO_2692 )
      ( MAKE-ON-TABLE ?AUTO_2691 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2691 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2693 - BLOCK
    )
    :vars
    (
      ?AUTO_2694 - BLOCK
      ?AUTO_2695 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2693 ?AUTO_2694 ) ( CLEAR ?AUTO_2693 ) ( not ( = ?AUTO_2693 ?AUTO_2694 ) ) ( HOLDING ?AUTO_2695 ) ( not ( = ?AUTO_2693 ?AUTO_2695 ) ) ( not ( = ?AUTO_2694 ?AUTO_2695 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2695 )
      ( MAKE-ON-TABLE ?AUTO_2693 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2693 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2698 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2698 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2698 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2698 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2699 - BLOCK
    )
    :vars
    (
      ?AUTO_2700 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2699 ?AUTO_2700 ) ( CLEAR ?AUTO_2699 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2699 ?AUTO_2700 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2699 ?AUTO_2700 )
      ( MAKE-ON-TABLE ?AUTO_2699 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2699 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2701 - BLOCK
    )
    :vars
    (
      ?AUTO_2702 - BLOCK
      ?AUTO_2703 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2701 ?AUTO_2702 ) ( CLEAR ?AUTO_2701 ) ( not ( = ?AUTO_2701 ?AUTO_2702 ) ) ( HOLDING ?AUTO_2703 ) ( not ( = ?AUTO_2701 ?AUTO_2703 ) ) ( not ( = ?AUTO_2702 ?AUTO_2703 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2703 )
      ( MAKE-ON-TABLE ?AUTO_2701 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2701 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2704 - BLOCK
    )
    :vars
    (
      ?AUTO_2706 - BLOCK
      ?AUTO_2705 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2704 ?AUTO_2706 ) ( not ( = ?AUTO_2704 ?AUTO_2706 ) ) ( not ( = ?AUTO_2704 ?AUTO_2705 ) ) ( not ( = ?AUTO_2706 ?AUTO_2705 ) ) ( ON ?AUTO_2705 ?AUTO_2704 ) ( CLEAR ?AUTO_2705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2705 ?AUTO_2704 )
      ( MAKE-ON-TABLE ?AUTO_2704 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2704 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2707 - BLOCK
    )
    :vars
    (
      ?AUTO_2709 - BLOCK
      ?AUTO_2708 - BLOCK
      ?AUTO_2710 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2707 ?AUTO_2709 ) ( not ( = ?AUTO_2707 ?AUTO_2709 ) ) ( not ( = ?AUTO_2707 ?AUTO_2708 ) ) ( not ( = ?AUTO_2709 ?AUTO_2708 ) ) ( ON ?AUTO_2708 ?AUTO_2707 ) ( CLEAR ?AUTO_2708 ) ( HOLDING ?AUTO_2710 ) ( not ( = ?AUTO_2707 ?AUTO_2710 ) ) ( not ( = ?AUTO_2709 ?AUTO_2710 ) ) ( not ( = ?AUTO_2708 ?AUTO_2710 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2710 )
      ( MAKE-ON-TABLE ?AUTO_2707 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2707 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2714 - BLOCK
      ?AUTO_2715 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2714 ) ( CLEAR ?AUTO_2715 ) ( not ( = ?AUTO_2714 ?AUTO_2715 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2714 ?AUTO_2715 )
      ( MAKE-ON-VERIFY ?AUTO_2714 ?AUTO_2715 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2716 - BLOCK
      ?AUTO_2717 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2717 ) ( not ( = ?AUTO_2716 ?AUTO_2717 ) ) ( ON-TABLE ?AUTO_2716 ) ( CLEAR ?AUTO_2716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2716 )
      ( MAKE-ON ?AUTO_2716 ?AUTO_2717 )
      ( MAKE-ON-VERIFY ?AUTO_2716 ?AUTO_2717 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2718 - BLOCK
      ?AUTO_2719 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2718 ?AUTO_2719 ) ) ( ON-TABLE ?AUTO_2718 ) ( CLEAR ?AUTO_2718 ) ( HOLDING ?AUTO_2719 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2719 )
      ( MAKE-ON ?AUTO_2718 ?AUTO_2719 )
      ( MAKE-ON-VERIFY ?AUTO_2718 ?AUTO_2719 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2734 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2734 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2734 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2734 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2735 - BLOCK
    )
    :vars
    (
      ?AUTO_2736 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2735 ?AUTO_2736 ) ( CLEAR ?AUTO_2735 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2735 ?AUTO_2736 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2735 ?AUTO_2736 )
      ( MAKE-ON-TABLE ?AUTO_2735 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2735 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2737 - BLOCK
    )
    :vars
    (
      ?AUTO_2738 - BLOCK
      ?AUTO_2739 - BLOCK
      ?AUTO_2740 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2737 ?AUTO_2738 ) ( CLEAR ?AUTO_2737 ) ( not ( = ?AUTO_2737 ?AUTO_2738 ) ) ( HOLDING ?AUTO_2739 ) ( CLEAR ?AUTO_2740 ) ( not ( = ?AUTO_2737 ?AUTO_2739 ) ) ( not ( = ?AUTO_2737 ?AUTO_2740 ) ) ( not ( = ?AUTO_2738 ?AUTO_2739 ) ) ( not ( = ?AUTO_2738 ?AUTO_2740 ) ) ( not ( = ?AUTO_2739 ?AUTO_2740 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2739 ?AUTO_2740 )
      ( MAKE-ON-TABLE ?AUTO_2737 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2737 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2743 - BLOCK
    )
    :vars
    (
      ?AUTO_2746 - BLOCK
      ?AUTO_2744 - BLOCK
      ?AUTO_2745 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2743 ?AUTO_2746 ) ( not ( = ?AUTO_2743 ?AUTO_2746 ) ) ( CLEAR ?AUTO_2744 ) ( not ( = ?AUTO_2743 ?AUTO_2745 ) ) ( not ( = ?AUTO_2743 ?AUTO_2744 ) ) ( not ( = ?AUTO_2746 ?AUTO_2745 ) ) ( not ( = ?AUTO_2746 ?AUTO_2744 ) ) ( not ( = ?AUTO_2745 ?AUTO_2744 ) ) ( ON ?AUTO_2745 ?AUTO_2743 ) ( CLEAR ?AUTO_2745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2745 ?AUTO_2743 )
      ( MAKE-ON-TABLE ?AUTO_2743 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2743 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2747 - BLOCK
    )
    :vars
    (
      ?AUTO_2750 - BLOCK
      ?AUTO_2749 - BLOCK
      ?AUTO_2748 - BLOCK
      ?AUTO_2751 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2747 ?AUTO_2750 ) ( not ( = ?AUTO_2747 ?AUTO_2750 ) ) ( CLEAR ?AUTO_2749 ) ( not ( = ?AUTO_2747 ?AUTO_2748 ) ) ( not ( = ?AUTO_2747 ?AUTO_2749 ) ) ( not ( = ?AUTO_2750 ?AUTO_2748 ) ) ( not ( = ?AUTO_2750 ?AUTO_2749 ) ) ( not ( = ?AUTO_2748 ?AUTO_2749 ) ) ( ON ?AUTO_2748 ?AUTO_2747 ) ( CLEAR ?AUTO_2748 ) ( HOLDING ?AUTO_2751 ) ( not ( = ?AUTO_2747 ?AUTO_2751 ) ) ( not ( = ?AUTO_2750 ?AUTO_2751 ) ) ( not ( = ?AUTO_2749 ?AUTO_2751 ) ) ( not ( = ?AUTO_2748 ?AUTO_2751 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2751 )
      ( MAKE-ON-TABLE ?AUTO_2747 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2747 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2752 - BLOCK
    )
    :vars
    (
      ?AUTO_2756 - BLOCK
      ?AUTO_2753 - BLOCK
      ?AUTO_2755 - BLOCK
      ?AUTO_2754 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2752 ?AUTO_2756 ) ( not ( = ?AUTO_2752 ?AUTO_2756 ) ) ( CLEAR ?AUTO_2753 ) ( not ( = ?AUTO_2752 ?AUTO_2755 ) ) ( not ( = ?AUTO_2752 ?AUTO_2753 ) ) ( not ( = ?AUTO_2756 ?AUTO_2755 ) ) ( not ( = ?AUTO_2756 ?AUTO_2753 ) ) ( not ( = ?AUTO_2755 ?AUTO_2753 ) ) ( ON ?AUTO_2755 ?AUTO_2752 ) ( not ( = ?AUTO_2752 ?AUTO_2754 ) ) ( not ( = ?AUTO_2756 ?AUTO_2754 ) ) ( not ( = ?AUTO_2753 ?AUTO_2754 ) ) ( not ( = ?AUTO_2755 ?AUTO_2754 ) ) ( ON ?AUTO_2754 ?AUTO_2755 ) ( CLEAR ?AUTO_2754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2754 ?AUTO_2755 )
      ( MAKE-ON-TABLE ?AUTO_2752 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2752 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2757 - BLOCK
    )
    :vars
    (
      ?AUTO_2758 - BLOCK
      ?AUTO_2761 - BLOCK
      ?AUTO_2759 - BLOCK
      ?AUTO_2760 - BLOCK
      ?AUTO_2762 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2757 ?AUTO_2758 ) ( not ( = ?AUTO_2757 ?AUTO_2758 ) ) ( CLEAR ?AUTO_2761 ) ( not ( = ?AUTO_2757 ?AUTO_2759 ) ) ( not ( = ?AUTO_2757 ?AUTO_2761 ) ) ( not ( = ?AUTO_2758 ?AUTO_2759 ) ) ( not ( = ?AUTO_2758 ?AUTO_2761 ) ) ( not ( = ?AUTO_2759 ?AUTO_2761 ) ) ( ON ?AUTO_2759 ?AUTO_2757 ) ( not ( = ?AUTO_2757 ?AUTO_2760 ) ) ( not ( = ?AUTO_2758 ?AUTO_2760 ) ) ( not ( = ?AUTO_2761 ?AUTO_2760 ) ) ( not ( = ?AUTO_2759 ?AUTO_2760 ) ) ( ON ?AUTO_2760 ?AUTO_2759 ) ( CLEAR ?AUTO_2760 ) ( HOLDING ?AUTO_2762 ) ( not ( = ?AUTO_2757 ?AUTO_2762 ) ) ( not ( = ?AUTO_2758 ?AUTO_2762 ) ) ( not ( = ?AUTO_2761 ?AUTO_2762 ) ) ( not ( = ?AUTO_2759 ?AUTO_2762 ) ) ( not ( = ?AUTO_2760 ?AUTO_2762 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2762 )
      ( MAKE-ON-TABLE ?AUTO_2757 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2757 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2765 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2765 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2765 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2765 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2766 - BLOCK
    )
    :vars
    (
      ?AUTO_2767 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2766 ?AUTO_2767 ) ( CLEAR ?AUTO_2766 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2766 ?AUTO_2767 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2766 ?AUTO_2767 )
      ( MAKE-ON-TABLE ?AUTO_2766 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2766 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2768 - BLOCK
    )
    :vars
    (
      ?AUTO_2769 - BLOCK
      ?AUTO_2770 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2768 ?AUTO_2769 ) ( CLEAR ?AUTO_2768 ) ( not ( = ?AUTO_2768 ?AUTO_2769 ) ) ( HOLDING ?AUTO_2770 ) ( not ( = ?AUTO_2768 ?AUTO_2770 ) ) ( not ( = ?AUTO_2769 ?AUTO_2770 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2770 )
      ( MAKE-ON-TABLE ?AUTO_2768 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2768 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2771 - BLOCK
    )
    :vars
    (
      ?AUTO_2772 - BLOCK
      ?AUTO_2773 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2771 ?AUTO_2772 ) ( not ( = ?AUTO_2771 ?AUTO_2772 ) ) ( not ( = ?AUTO_2771 ?AUTO_2773 ) ) ( not ( = ?AUTO_2772 ?AUTO_2773 ) ) ( ON ?AUTO_2773 ?AUTO_2771 ) ( CLEAR ?AUTO_2773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2773 ?AUTO_2771 )
      ( MAKE-ON-TABLE ?AUTO_2771 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2771 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2774 - BLOCK
    )
    :vars
    (
      ?AUTO_2775 - BLOCK
      ?AUTO_2776 - BLOCK
      ?AUTO_2777 - BLOCK
      ?AUTO_2778 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2774 ?AUTO_2775 ) ( not ( = ?AUTO_2774 ?AUTO_2775 ) ) ( not ( = ?AUTO_2774 ?AUTO_2776 ) ) ( not ( = ?AUTO_2775 ?AUTO_2776 ) ) ( ON ?AUTO_2776 ?AUTO_2774 ) ( CLEAR ?AUTO_2776 ) ( HOLDING ?AUTO_2777 ) ( CLEAR ?AUTO_2778 ) ( not ( = ?AUTO_2774 ?AUTO_2777 ) ) ( not ( = ?AUTO_2774 ?AUTO_2778 ) ) ( not ( = ?AUTO_2775 ?AUTO_2777 ) ) ( not ( = ?AUTO_2775 ?AUTO_2778 ) ) ( not ( = ?AUTO_2776 ?AUTO_2777 ) ) ( not ( = ?AUTO_2776 ?AUTO_2778 ) ) ( not ( = ?AUTO_2777 ?AUTO_2778 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2777 ?AUTO_2778 )
      ( MAKE-ON-TABLE ?AUTO_2774 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2774 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2781 - BLOCK
    )
    :vars
    (
      ?AUTO_2785 - BLOCK
      ?AUTO_2784 - BLOCK
      ?AUTO_2783 - BLOCK
      ?AUTO_2782 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2781 ?AUTO_2785 ) ( not ( = ?AUTO_2781 ?AUTO_2785 ) ) ( not ( = ?AUTO_2781 ?AUTO_2784 ) ) ( not ( = ?AUTO_2785 ?AUTO_2784 ) ) ( ON ?AUTO_2784 ?AUTO_2781 ) ( CLEAR ?AUTO_2783 ) ( not ( = ?AUTO_2781 ?AUTO_2782 ) ) ( not ( = ?AUTO_2781 ?AUTO_2783 ) ) ( not ( = ?AUTO_2785 ?AUTO_2782 ) ) ( not ( = ?AUTO_2785 ?AUTO_2783 ) ) ( not ( = ?AUTO_2784 ?AUTO_2782 ) ) ( not ( = ?AUTO_2784 ?AUTO_2783 ) ) ( not ( = ?AUTO_2782 ?AUTO_2783 ) ) ( ON ?AUTO_2782 ?AUTO_2784 ) ( CLEAR ?AUTO_2782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2782 ?AUTO_2784 )
      ( MAKE-ON-TABLE ?AUTO_2781 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2781 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2786 - BLOCK
    )
    :vars
    (
      ?AUTO_2787 - BLOCK
      ?AUTO_2788 - BLOCK
      ?AUTO_2790 - BLOCK
      ?AUTO_2789 - BLOCK
      ?AUTO_2791 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2786 ?AUTO_2787 ) ( not ( = ?AUTO_2786 ?AUTO_2787 ) ) ( not ( = ?AUTO_2786 ?AUTO_2788 ) ) ( not ( = ?AUTO_2787 ?AUTO_2788 ) ) ( ON ?AUTO_2788 ?AUTO_2786 ) ( CLEAR ?AUTO_2790 ) ( not ( = ?AUTO_2786 ?AUTO_2789 ) ) ( not ( = ?AUTO_2786 ?AUTO_2790 ) ) ( not ( = ?AUTO_2787 ?AUTO_2789 ) ) ( not ( = ?AUTO_2787 ?AUTO_2790 ) ) ( not ( = ?AUTO_2788 ?AUTO_2789 ) ) ( not ( = ?AUTO_2788 ?AUTO_2790 ) ) ( not ( = ?AUTO_2789 ?AUTO_2790 ) ) ( ON ?AUTO_2789 ?AUTO_2788 ) ( CLEAR ?AUTO_2789 ) ( HOLDING ?AUTO_2791 ) ( not ( = ?AUTO_2786 ?AUTO_2791 ) ) ( not ( = ?AUTO_2787 ?AUTO_2791 ) ) ( not ( = ?AUTO_2788 ?AUTO_2791 ) ) ( not ( = ?AUTO_2790 ?AUTO_2791 ) ) ( not ( = ?AUTO_2789 ?AUTO_2791 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2791 )
      ( MAKE-ON-TABLE ?AUTO_2786 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2786 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2792 - BLOCK
    )
    :vars
    (
      ?AUTO_2794 - BLOCK
      ?AUTO_2793 - BLOCK
      ?AUTO_2795 - BLOCK
      ?AUTO_2797 - BLOCK
      ?AUTO_2796 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2792 ?AUTO_2794 ) ( not ( = ?AUTO_2792 ?AUTO_2794 ) ) ( not ( = ?AUTO_2792 ?AUTO_2793 ) ) ( not ( = ?AUTO_2794 ?AUTO_2793 ) ) ( ON ?AUTO_2793 ?AUTO_2792 ) ( CLEAR ?AUTO_2795 ) ( not ( = ?AUTO_2792 ?AUTO_2797 ) ) ( not ( = ?AUTO_2792 ?AUTO_2795 ) ) ( not ( = ?AUTO_2794 ?AUTO_2797 ) ) ( not ( = ?AUTO_2794 ?AUTO_2795 ) ) ( not ( = ?AUTO_2793 ?AUTO_2797 ) ) ( not ( = ?AUTO_2793 ?AUTO_2795 ) ) ( not ( = ?AUTO_2797 ?AUTO_2795 ) ) ( ON ?AUTO_2797 ?AUTO_2793 ) ( not ( = ?AUTO_2792 ?AUTO_2796 ) ) ( not ( = ?AUTO_2794 ?AUTO_2796 ) ) ( not ( = ?AUTO_2793 ?AUTO_2796 ) ) ( not ( = ?AUTO_2795 ?AUTO_2796 ) ) ( not ( = ?AUTO_2797 ?AUTO_2796 ) ) ( ON ?AUTO_2796 ?AUTO_2797 ) ( CLEAR ?AUTO_2796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2796 ?AUTO_2797 )
      ( MAKE-ON-TABLE ?AUTO_2792 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2792 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2798 - BLOCK
    )
    :vars
    (
      ?AUTO_2803 - BLOCK
      ?AUTO_2801 - BLOCK
      ?AUTO_2800 - BLOCK
      ?AUTO_2799 - BLOCK
      ?AUTO_2802 - BLOCK
      ?AUTO_2804 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2798 ?AUTO_2803 ) ( not ( = ?AUTO_2798 ?AUTO_2803 ) ) ( not ( = ?AUTO_2798 ?AUTO_2801 ) ) ( not ( = ?AUTO_2803 ?AUTO_2801 ) ) ( ON ?AUTO_2801 ?AUTO_2798 ) ( CLEAR ?AUTO_2800 ) ( not ( = ?AUTO_2798 ?AUTO_2799 ) ) ( not ( = ?AUTO_2798 ?AUTO_2800 ) ) ( not ( = ?AUTO_2803 ?AUTO_2799 ) ) ( not ( = ?AUTO_2803 ?AUTO_2800 ) ) ( not ( = ?AUTO_2801 ?AUTO_2799 ) ) ( not ( = ?AUTO_2801 ?AUTO_2800 ) ) ( not ( = ?AUTO_2799 ?AUTO_2800 ) ) ( ON ?AUTO_2799 ?AUTO_2801 ) ( not ( = ?AUTO_2798 ?AUTO_2802 ) ) ( not ( = ?AUTO_2803 ?AUTO_2802 ) ) ( not ( = ?AUTO_2801 ?AUTO_2802 ) ) ( not ( = ?AUTO_2800 ?AUTO_2802 ) ) ( not ( = ?AUTO_2799 ?AUTO_2802 ) ) ( ON ?AUTO_2802 ?AUTO_2799 ) ( CLEAR ?AUTO_2802 ) ( HOLDING ?AUTO_2804 ) ( not ( = ?AUTO_2798 ?AUTO_2804 ) ) ( not ( = ?AUTO_2803 ?AUTO_2804 ) ) ( not ( = ?AUTO_2801 ?AUTO_2804 ) ) ( not ( = ?AUTO_2800 ?AUTO_2804 ) ) ( not ( = ?AUTO_2799 ?AUTO_2804 ) ) ( not ( = ?AUTO_2802 ?AUTO_2804 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2804 )
      ( MAKE-ON-TABLE ?AUTO_2798 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2798 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2808 - BLOCK
      ?AUTO_2809 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2808 ) ( CLEAR ?AUTO_2809 ) ( not ( = ?AUTO_2808 ?AUTO_2809 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2808 ?AUTO_2809 )
      ( MAKE-ON-VERIFY ?AUTO_2808 ?AUTO_2809 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2810 - BLOCK
      ?AUTO_2811 - BLOCK
    )
    :vars
    (
      ?AUTO_2812 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2811 ) ( not ( = ?AUTO_2810 ?AUTO_2811 ) ) ( ON ?AUTO_2810 ?AUTO_2812 ) ( CLEAR ?AUTO_2810 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2810 ?AUTO_2812 ) ) ( not ( = ?AUTO_2811 ?AUTO_2812 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2810 ?AUTO_2812 )
      ( MAKE-ON ?AUTO_2810 ?AUTO_2811 )
      ( MAKE-ON-VERIFY ?AUTO_2810 ?AUTO_2811 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2813 - BLOCK
      ?AUTO_2814 - BLOCK
    )
    :vars
    (
      ?AUTO_2815 - BLOCK
      ?AUTO_2816 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2814 ) ( not ( = ?AUTO_2813 ?AUTO_2814 ) ) ( ON ?AUTO_2813 ?AUTO_2815 ) ( CLEAR ?AUTO_2813 ) ( not ( = ?AUTO_2813 ?AUTO_2815 ) ) ( not ( = ?AUTO_2814 ?AUTO_2815 ) ) ( HOLDING ?AUTO_2816 ) ( not ( = ?AUTO_2813 ?AUTO_2816 ) ) ( not ( = ?AUTO_2814 ?AUTO_2816 ) ) ( not ( = ?AUTO_2815 ?AUTO_2816 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2816 )
      ( MAKE-ON ?AUTO_2813 ?AUTO_2814 )
      ( MAKE-ON-VERIFY ?AUTO_2813 ?AUTO_2814 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2817 - BLOCK
      ?AUTO_2818 - BLOCK
    )
    :vars
    (
      ?AUTO_2819 - BLOCK
      ?AUTO_2820 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2817 ?AUTO_2818 ) ) ( ON ?AUTO_2817 ?AUTO_2819 ) ( CLEAR ?AUTO_2817 ) ( not ( = ?AUTO_2817 ?AUTO_2819 ) ) ( not ( = ?AUTO_2818 ?AUTO_2819 ) ) ( not ( = ?AUTO_2817 ?AUTO_2820 ) ) ( not ( = ?AUTO_2818 ?AUTO_2820 ) ) ( not ( = ?AUTO_2819 ?AUTO_2820 ) ) ( ON ?AUTO_2820 ?AUTO_2818 ) ( CLEAR ?AUTO_2820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2820 ?AUTO_2818 )
      ( MAKE-ON ?AUTO_2817 ?AUTO_2818 )
      ( MAKE-ON-VERIFY ?AUTO_2817 ?AUTO_2818 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2821 - BLOCK
      ?AUTO_2822 - BLOCK
    )
    :vars
    (
      ?AUTO_2823 - BLOCK
      ?AUTO_2824 - BLOCK
      ?AUTO_2825 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2821 ?AUTO_2822 ) ) ( ON ?AUTO_2821 ?AUTO_2823 ) ( CLEAR ?AUTO_2821 ) ( not ( = ?AUTO_2821 ?AUTO_2823 ) ) ( not ( = ?AUTO_2822 ?AUTO_2823 ) ) ( not ( = ?AUTO_2821 ?AUTO_2824 ) ) ( not ( = ?AUTO_2822 ?AUTO_2824 ) ) ( not ( = ?AUTO_2823 ?AUTO_2824 ) ) ( ON ?AUTO_2824 ?AUTO_2822 ) ( CLEAR ?AUTO_2824 ) ( HOLDING ?AUTO_2825 ) ( not ( = ?AUTO_2821 ?AUTO_2825 ) ) ( not ( = ?AUTO_2822 ?AUTO_2825 ) ) ( not ( = ?AUTO_2823 ?AUTO_2825 ) ) ( not ( = ?AUTO_2824 ?AUTO_2825 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2825 )
      ( MAKE-ON ?AUTO_2821 ?AUTO_2822 )
      ( MAKE-ON-VERIFY ?AUTO_2821 ?AUTO_2822 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2826 - BLOCK
      ?AUTO_2827 - BLOCK
    )
    :vars
    (
      ?AUTO_2828 - BLOCK
      ?AUTO_2829 - BLOCK
      ?AUTO_2830 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2826 ?AUTO_2827 ) ) ( ON ?AUTO_2826 ?AUTO_2828 ) ( CLEAR ?AUTO_2826 ) ( not ( = ?AUTO_2826 ?AUTO_2828 ) ) ( not ( = ?AUTO_2827 ?AUTO_2828 ) ) ( not ( = ?AUTO_2826 ?AUTO_2829 ) ) ( not ( = ?AUTO_2827 ?AUTO_2829 ) ) ( not ( = ?AUTO_2828 ?AUTO_2829 ) ) ( ON ?AUTO_2829 ?AUTO_2827 ) ( not ( = ?AUTO_2826 ?AUTO_2830 ) ) ( not ( = ?AUTO_2827 ?AUTO_2830 ) ) ( not ( = ?AUTO_2828 ?AUTO_2830 ) ) ( not ( = ?AUTO_2829 ?AUTO_2830 ) ) ( ON ?AUTO_2830 ?AUTO_2829 ) ( CLEAR ?AUTO_2830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2830 ?AUTO_2829 )
      ( MAKE-ON ?AUTO_2826 ?AUTO_2827 )
      ( MAKE-ON-VERIFY ?AUTO_2826 ?AUTO_2827 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2831 - BLOCK
      ?AUTO_2832 - BLOCK
    )
    :vars
    (
      ?AUTO_2834 - BLOCK
      ?AUTO_2833 - BLOCK
      ?AUTO_2835 - BLOCK
      ?AUTO_2836 - BLOCK
      ?AUTO_2837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2831 ?AUTO_2832 ) ) ( ON ?AUTO_2831 ?AUTO_2834 ) ( CLEAR ?AUTO_2831 ) ( not ( = ?AUTO_2831 ?AUTO_2834 ) ) ( not ( = ?AUTO_2832 ?AUTO_2834 ) ) ( not ( = ?AUTO_2831 ?AUTO_2833 ) ) ( not ( = ?AUTO_2832 ?AUTO_2833 ) ) ( not ( = ?AUTO_2834 ?AUTO_2833 ) ) ( ON ?AUTO_2833 ?AUTO_2832 ) ( not ( = ?AUTO_2831 ?AUTO_2835 ) ) ( not ( = ?AUTO_2832 ?AUTO_2835 ) ) ( not ( = ?AUTO_2834 ?AUTO_2835 ) ) ( not ( = ?AUTO_2833 ?AUTO_2835 ) ) ( ON ?AUTO_2835 ?AUTO_2833 ) ( CLEAR ?AUTO_2835 ) ( HOLDING ?AUTO_2836 ) ( CLEAR ?AUTO_2837 ) ( not ( = ?AUTO_2831 ?AUTO_2836 ) ) ( not ( = ?AUTO_2831 ?AUTO_2837 ) ) ( not ( = ?AUTO_2832 ?AUTO_2836 ) ) ( not ( = ?AUTO_2832 ?AUTO_2837 ) ) ( not ( = ?AUTO_2834 ?AUTO_2836 ) ) ( not ( = ?AUTO_2834 ?AUTO_2837 ) ) ( not ( = ?AUTO_2833 ?AUTO_2836 ) ) ( not ( = ?AUTO_2833 ?AUTO_2837 ) ) ( not ( = ?AUTO_2835 ?AUTO_2836 ) ) ( not ( = ?AUTO_2835 ?AUTO_2837 ) ) ( not ( = ?AUTO_2836 ?AUTO_2837 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2836 ?AUTO_2837 )
      ( MAKE-ON ?AUTO_2831 ?AUTO_2832 )
      ( MAKE-ON-VERIFY ?AUTO_2831 ?AUTO_2832 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2842 - BLOCK
      ?AUTO_2843 - BLOCK
    )
    :vars
    (
      ?AUTO_2847 - BLOCK
      ?AUTO_2846 - BLOCK
      ?AUTO_2848 - BLOCK
      ?AUTO_2845 - BLOCK
      ?AUTO_2844 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2842 ?AUTO_2843 ) ) ( ON ?AUTO_2842 ?AUTO_2847 ) ( CLEAR ?AUTO_2842 ) ( not ( = ?AUTO_2842 ?AUTO_2847 ) ) ( not ( = ?AUTO_2843 ?AUTO_2847 ) ) ( not ( = ?AUTO_2842 ?AUTO_2846 ) ) ( not ( = ?AUTO_2843 ?AUTO_2846 ) ) ( not ( = ?AUTO_2847 ?AUTO_2846 ) ) ( ON ?AUTO_2846 ?AUTO_2843 ) ( not ( = ?AUTO_2842 ?AUTO_2848 ) ) ( not ( = ?AUTO_2843 ?AUTO_2848 ) ) ( not ( = ?AUTO_2847 ?AUTO_2848 ) ) ( not ( = ?AUTO_2846 ?AUTO_2848 ) ) ( ON ?AUTO_2848 ?AUTO_2846 ) ( CLEAR ?AUTO_2845 ) ( not ( = ?AUTO_2842 ?AUTO_2844 ) ) ( not ( = ?AUTO_2842 ?AUTO_2845 ) ) ( not ( = ?AUTO_2843 ?AUTO_2844 ) ) ( not ( = ?AUTO_2843 ?AUTO_2845 ) ) ( not ( = ?AUTO_2847 ?AUTO_2844 ) ) ( not ( = ?AUTO_2847 ?AUTO_2845 ) ) ( not ( = ?AUTO_2846 ?AUTO_2844 ) ) ( not ( = ?AUTO_2846 ?AUTO_2845 ) ) ( not ( = ?AUTO_2848 ?AUTO_2844 ) ) ( not ( = ?AUTO_2848 ?AUTO_2845 ) ) ( not ( = ?AUTO_2844 ?AUTO_2845 ) ) ( ON ?AUTO_2844 ?AUTO_2848 ) ( CLEAR ?AUTO_2844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2844 ?AUTO_2848 )
      ( MAKE-ON ?AUTO_2842 ?AUTO_2843 )
      ( MAKE-ON-VERIFY ?AUTO_2842 ?AUTO_2843 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2849 - BLOCK
      ?AUTO_2850 - BLOCK
    )
    :vars
    (
      ?AUTO_2852 - BLOCK
      ?AUTO_2854 - BLOCK
      ?AUTO_2855 - BLOCK
      ?AUTO_2851 - BLOCK
      ?AUTO_2853 - BLOCK
      ?AUTO_2856 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2849 ?AUTO_2850 ) ) ( ON ?AUTO_2849 ?AUTO_2852 ) ( CLEAR ?AUTO_2849 ) ( not ( = ?AUTO_2849 ?AUTO_2852 ) ) ( not ( = ?AUTO_2850 ?AUTO_2852 ) ) ( not ( = ?AUTO_2849 ?AUTO_2854 ) ) ( not ( = ?AUTO_2850 ?AUTO_2854 ) ) ( not ( = ?AUTO_2852 ?AUTO_2854 ) ) ( ON ?AUTO_2854 ?AUTO_2850 ) ( not ( = ?AUTO_2849 ?AUTO_2855 ) ) ( not ( = ?AUTO_2850 ?AUTO_2855 ) ) ( not ( = ?AUTO_2852 ?AUTO_2855 ) ) ( not ( = ?AUTO_2854 ?AUTO_2855 ) ) ( ON ?AUTO_2855 ?AUTO_2854 ) ( CLEAR ?AUTO_2851 ) ( not ( = ?AUTO_2849 ?AUTO_2853 ) ) ( not ( = ?AUTO_2849 ?AUTO_2851 ) ) ( not ( = ?AUTO_2850 ?AUTO_2853 ) ) ( not ( = ?AUTO_2850 ?AUTO_2851 ) ) ( not ( = ?AUTO_2852 ?AUTO_2853 ) ) ( not ( = ?AUTO_2852 ?AUTO_2851 ) ) ( not ( = ?AUTO_2854 ?AUTO_2853 ) ) ( not ( = ?AUTO_2854 ?AUTO_2851 ) ) ( not ( = ?AUTO_2855 ?AUTO_2853 ) ) ( not ( = ?AUTO_2855 ?AUTO_2851 ) ) ( not ( = ?AUTO_2853 ?AUTO_2851 ) ) ( ON ?AUTO_2853 ?AUTO_2855 ) ( CLEAR ?AUTO_2853 ) ( HOLDING ?AUTO_2856 ) ( not ( = ?AUTO_2849 ?AUTO_2856 ) ) ( not ( = ?AUTO_2850 ?AUTO_2856 ) ) ( not ( = ?AUTO_2852 ?AUTO_2856 ) ) ( not ( = ?AUTO_2854 ?AUTO_2856 ) ) ( not ( = ?AUTO_2855 ?AUTO_2856 ) ) ( not ( = ?AUTO_2851 ?AUTO_2856 ) ) ( not ( = ?AUTO_2853 ?AUTO_2856 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2856 )
      ( MAKE-ON ?AUTO_2849 ?AUTO_2850 )
      ( MAKE-ON-VERIFY ?AUTO_2849 ?AUTO_2850 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2857 - BLOCK
      ?AUTO_2858 - BLOCK
    )
    :vars
    (
      ?AUTO_2860 - BLOCK
      ?AUTO_2863 - BLOCK
      ?AUTO_2862 - BLOCK
      ?AUTO_2859 - BLOCK
      ?AUTO_2861 - BLOCK
      ?AUTO_2864 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2857 ?AUTO_2858 ) ) ( ON ?AUTO_2857 ?AUTO_2860 ) ( CLEAR ?AUTO_2857 ) ( not ( = ?AUTO_2857 ?AUTO_2860 ) ) ( not ( = ?AUTO_2858 ?AUTO_2860 ) ) ( not ( = ?AUTO_2857 ?AUTO_2863 ) ) ( not ( = ?AUTO_2858 ?AUTO_2863 ) ) ( not ( = ?AUTO_2860 ?AUTO_2863 ) ) ( ON ?AUTO_2863 ?AUTO_2858 ) ( not ( = ?AUTO_2857 ?AUTO_2862 ) ) ( not ( = ?AUTO_2858 ?AUTO_2862 ) ) ( not ( = ?AUTO_2860 ?AUTO_2862 ) ) ( not ( = ?AUTO_2863 ?AUTO_2862 ) ) ( ON ?AUTO_2862 ?AUTO_2863 ) ( CLEAR ?AUTO_2859 ) ( not ( = ?AUTO_2857 ?AUTO_2861 ) ) ( not ( = ?AUTO_2857 ?AUTO_2859 ) ) ( not ( = ?AUTO_2858 ?AUTO_2861 ) ) ( not ( = ?AUTO_2858 ?AUTO_2859 ) ) ( not ( = ?AUTO_2860 ?AUTO_2861 ) ) ( not ( = ?AUTO_2860 ?AUTO_2859 ) ) ( not ( = ?AUTO_2863 ?AUTO_2861 ) ) ( not ( = ?AUTO_2863 ?AUTO_2859 ) ) ( not ( = ?AUTO_2862 ?AUTO_2861 ) ) ( not ( = ?AUTO_2862 ?AUTO_2859 ) ) ( not ( = ?AUTO_2861 ?AUTO_2859 ) ) ( ON ?AUTO_2861 ?AUTO_2862 ) ( not ( = ?AUTO_2857 ?AUTO_2864 ) ) ( not ( = ?AUTO_2858 ?AUTO_2864 ) ) ( not ( = ?AUTO_2860 ?AUTO_2864 ) ) ( not ( = ?AUTO_2863 ?AUTO_2864 ) ) ( not ( = ?AUTO_2862 ?AUTO_2864 ) ) ( not ( = ?AUTO_2859 ?AUTO_2864 ) ) ( not ( = ?AUTO_2861 ?AUTO_2864 ) ) ( ON ?AUTO_2864 ?AUTO_2861 ) ( CLEAR ?AUTO_2864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2864 ?AUTO_2861 )
      ( MAKE-ON ?AUTO_2857 ?AUTO_2858 )
      ( MAKE-ON-VERIFY ?AUTO_2857 ?AUTO_2858 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2865 - BLOCK
      ?AUTO_2866 - BLOCK
    )
    :vars
    (
      ?AUTO_2872 - BLOCK
      ?AUTO_2870 - BLOCK
      ?AUTO_2869 - BLOCK
      ?AUTO_2867 - BLOCK
      ?AUTO_2868 - BLOCK
      ?AUTO_2871 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2865 ?AUTO_2866 ) ) ( ON ?AUTO_2865 ?AUTO_2872 ) ( CLEAR ?AUTO_2865 ) ( not ( = ?AUTO_2865 ?AUTO_2872 ) ) ( not ( = ?AUTO_2866 ?AUTO_2872 ) ) ( not ( = ?AUTO_2865 ?AUTO_2870 ) ) ( not ( = ?AUTO_2866 ?AUTO_2870 ) ) ( not ( = ?AUTO_2872 ?AUTO_2870 ) ) ( ON ?AUTO_2870 ?AUTO_2866 ) ( not ( = ?AUTO_2865 ?AUTO_2869 ) ) ( not ( = ?AUTO_2866 ?AUTO_2869 ) ) ( not ( = ?AUTO_2872 ?AUTO_2869 ) ) ( not ( = ?AUTO_2870 ?AUTO_2869 ) ) ( ON ?AUTO_2869 ?AUTO_2870 ) ( not ( = ?AUTO_2865 ?AUTO_2867 ) ) ( not ( = ?AUTO_2865 ?AUTO_2868 ) ) ( not ( = ?AUTO_2866 ?AUTO_2867 ) ) ( not ( = ?AUTO_2866 ?AUTO_2868 ) ) ( not ( = ?AUTO_2872 ?AUTO_2867 ) ) ( not ( = ?AUTO_2872 ?AUTO_2868 ) ) ( not ( = ?AUTO_2870 ?AUTO_2867 ) ) ( not ( = ?AUTO_2870 ?AUTO_2868 ) ) ( not ( = ?AUTO_2869 ?AUTO_2867 ) ) ( not ( = ?AUTO_2869 ?AUTO_2868 ) ) ( not ( = ?AUTO_2867 ?AUTO_2868 ) ) ( ON ?AUTO_2867 ?AUTO_2869 ) ( not ( = ?AUTO_2865 ?AUTO_2871 ) ) ( not ( = ?AUTO_2866 ?AUTO_2871 ) ) ( not ( = ?AUTO_2872 ?AUTO_2871 ) ) ( not ( = ?AUTO_2870 ?AUTO_2871 ) ) ( not ( = ?AUTO_2869 ?AUTO_2871 ) ) ( not ( = ?AUTO_2868 ?AUTO_2871 ) ) ( not ( = ?AUTO_2867 ?AUTO_2871 ) ) ( ON ?AUTO_2871 ?AUTO_2867 ) ( CLEAR ?AUTO_2871 ) ( HOLDING ?AUTO_2868 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2868 )
      ( MAKE-ON ?AUTO_2865 ?AUTO_2866 )
      ( MAKE-ON-VERIFY ?AUTO_2865 ?AUTO_2866 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2873 - BLOCK
      ?AUTO_2874 - BLOCK
    )
    :vars
    (
      ?AUTO_2880 - BLOCK
      ?AUTO_2878 - BLOCK
      ?AUTO_2877 - BLOCK
      ?AUTO_2876 - BLOCK
      ?AUTO_2875 - BLOCK
      ?AUTO_2879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2873 ?AUTO_2874 ) ) ( ON ?AUTO_2873 ?AUTO_2880 ) ( not ( = ?AUTO_2873 ?AUTO_2880 ) ) ( not ( = ?AUTO_2874 ?AUTO_2880 ) ) ( not ( = ?AUTO_2873 ?AUTO_2878 ) ) ( not ( = ?AUTO_2874 ?AUTO_2878 ) ) ( not ( = ?AUTO_2880 ?AUTO_2878 ) ) ( ON ?AUTO_2878 ?AUTO_2874 ) ( not ( = ?AUTO_2873 ?AUTO_2877 ) ) ( not ( = ?AUTO_2874 ?AUTO_2877 ) ) ( not ( = ?AUTO_2880 ?AUTO_2877 ) ) ( not ( = ?AUTO_2878 ?AUTO_2877 ) ) ( ON ?AUTO_2877 ?AUTO_2878 ) ( not ( = ?AUTO_2873 ?AUTO_2876 ) ) ( not ( = ?AUTO_2873 ?AUTO_2875 ) ) ( not ( = ?AUTO_2874 ?AUTO_2876 ) ) ( not ( = ?AUTO_2874 ?AUTO_2875 ) ) ( not ( = ?AUTO_2880 ?AUTO_2876 ) ) ( not ( = ?AUTO_2880 ?AUTO_2875 ) ) ( not ( = ?AUTO_2878 ?AUTO_2876 ) ) ( not ( = ?AUTO_2878 ?AUTO_2875 ) ) ( not ( = ?AUTO_2877 ?AUTO_2876 ) ) ( not ( = ?AUTO_2877 ?AUTO_2875 ) ) ( not ( = ?AUTO_2876 ?AUTO_2875 ) ) ( ON ?AUTO_2876 ?AUTO_2877 ) ( not ( = ?AUTO_2873 ?AUTO_2879 ) ) ( not ( = ?AUTO_2874 ?AUTO_2879 ) ) ( not ( = ?AUTO_2880 ?AUTO_2879 ) ) ( not ( = ?AUTO_2878 ?AUTO_2879 ) ) ( not ( = ?AUTO_2877 ?AUTO_2879 ) ) ( not ( = ?AUTO_2875 ?AUTO_2879 ) ) ( not ( = ?AUTO_2876 ?AUTO_2879 ) ) ( ON ?AUTO_2879 ?AUTO_2876 ) ( CLEAR ?AUTO_2879 ) ( ON ?AUTO_2875 ?AUTO_2873 ) ( CLEAR ?AUTO_2875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2875 ?AUTO_2873 )
      ( MAKE-ON ?AUTO_2873 ?AUTO_2874 )
      ( MAKE-ON-VERIFY ?AUTO_2873 ?AUTO_2874 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2883 - BLOCK
      ?AUTO_2884 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2883 ) ( CLEAR ?AUTO_2884 ) ( not ( = ?AUTO_2883 ?AUTO_2884 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2883 ?AUTO_2884 )
      ( MAKE-ON-VERIFY ?AUTO_2883 ?AUTO_2884 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2885 - BLOCK
      ?AUTO_2886 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2886 ) ( not ( = ?AUTO_2885 ?AUTO_2886 ) ) ( ON-TABLE ?AUTO_2885 ) ( CLEAR ?AUTO_2885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2885 )
      ( MAKE-ON ?AUTO_2885 ?AUTO_2886 )
      ( MAKE-ON-VERIFY ?AUTO_2885 ?AUTO_2886 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2887 - BLOCK
      ?AUTO_2888 - BLOCK
    )
    :vars
    (
      ?AUTO_2889 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2887 ?AUTO_2888 ) ) ( ON-TABLE ?AUTO_2887 ) ( CLEAR ?AUTO_2887 ) ( HOLDING ?AUTO_2888 ) ( CLEAR ?AUTO_2889 ) ( not ( = ?AUTO_2887 ?AUTO_2889 ) ) ( not ( = ?AUTO_2888 ?AUTO_2889 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2888 ?AUTO_2889 )
      ( MAKE-ON ?AUTO_2887 ?AUTO_2888 )
      ( MAKE-ON-VERIFY ?AUTO_2887 ?AUTO_2888 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2898 - BLOCK
      ?AUTO_2899 - BLOCK
    )
    :vars
    (
      ?AUTO_2901 - BLOCK
      ?AUTO_2900 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2899 ) ( not ( = ?AUTO_2898 ?AUTO_2899 ) ) ( ON ?AUTO_2898 ?AUTO_2901 ) ( not ( = ?AUTO_2898 ?AUTO_2901 ) ) ( not ( = ?AUTO_2899 ?AUTO_2901 ) ) ( not ( = ?AUTO_2898 ?AUTO_2900 ) ) ( not ( = ?AUTO_2899 ?AUTO_2900 ) ) ( not ( = ?AUTO_2901 ?AUTO_2900 ) ) ( ON ?AUTO_2900 ?AUTO_2898 ) ( CLEAR ?AUTO_2900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2900 ?AUTO_2898 )
      ( MAKE-ON ?AUTO_2898 ?AUTO_2899 )
      ( MAKE-ON-VERIFY ?AUTO_2898 ?AUTO_2899 ) )
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
      ?AUTO_2907 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2903 ) ( not ( = ?AUTO_2902 ?AUTO_2903 ) ) ( ON ?AUTO_2902 ?AUTO_2904 ) ( not ( = ?AUTO_2902 ?AUTO_2904 ) ) ( not ( = ?AUTO_2903 ?AUTO_2904 ) ) ( not ( = ?AUTO_2902 ?AUTO_2905 ) ) ( not ( = ?AUTO_2903 ?AUTO_2905 ) ) ( not ( = ?AUTO_2904 ?AUTO_2905 ) ) ( ON ?AUTO_2905 ?AUTO_2902 ) ( CLEAR ?AUTO_2905 ) ( HOLDING ?AUTO_2906 ) ( CLEAR ?AUTO_2907 ) ( not ( = ?AUTO_2902 ?AUTO_2906 ) ) ( not ( = ?AUTO_2902 ?AUTO_2907 ) ) ( not ( = ?AUTO_2903 ?AUTO_2906 ) ) ( not ( = ?AUTO_2903 ?AUTO_2907 ) ) ( not ( = ?AUTO_2904 ?AUTO_2906 ) ) ( not ( = ?AUTO_2904 ?AUTO_2907 ) ) ( not ( = ?AUTO_2905 ?AUTO_2906 ) ) ( not ( = ?AUTO_2905 ?AUTO_2907 ) ) ( not ( = ?AUTO_2906 ?AUTO_2907 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2906 ?AUTO_2907 )
      ( MAKE-ON ?AUTO_2902 ?AUTO_2903 )
      ( MAKE-ON-VERIFY ?AUTO_2902 ?AUTO_2903 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2912 - BLOCK
      ?AUTO_2913 - BLOCK
    )
    :vars
    (
      ?AUTO_2914 - BLOCK
      ?AUTO_2917 - BLOCK
      ?AUTO_2915 - BLOCK
      ?AUTO_2916 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2913 ) ( not ( = ?AUTO_2912 ?AUTO_2913 ) ) ( ON ?AUTO_2912 ?AUTO_2914 ) ( not ( = ?AUTO_2912 ?AUTO_2914 ) ) ( not ( = ?AUTO_2913 ?AUTO_2914 ) ) ( not ( = ?AUTO_2912 ?AUTO_2917 ) ) ( not ( = ?AUTO_2913 ?AUTO_2917 ) ) ( not ( = ?AUTO_2914 ?AUTO_2917 ) ) ( ON ?AUTO_2917 ?AUTO_2912 ) ( CLEAR ?AUTO_2915 ) ( not ( = ?AUTO_2912 ?AUTO_2916 ) ) ( not ( = ?AUTO_2912 ?AUTO_2915 ) ) ( not ( = ?AUTO_2913 ?AUTO_2916 ) ) ( not ( = ?AUTO_2913 ?AUTO_2915 ) ) ( not ( = ?AUTO_2914 ?AUTO_2916 ) ) ( not ( = ?AUTO_2914 ?AUTO_2915 ) ) ( not ( = ?AUTO_2917 ?AUTO_2916 ) ) ( not ( = ?AUTO_2917 ?AUTO_2915 ) ) ( not ( = ?AUTO_2916 ?AUTO_2915 ) ) ( ON ?AUTO_2916 ?AUTO_2917 ) ( CLEAR ?AUTO_2916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2916 ?AUTO_2917 )
      ( MAKE-ON ?AUTO_2912 ?AUTO_2913 )
      ( MAKE-ON-VERIFY ?AUTO_2912 ?AUTO_2913 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2918 - BLOCK
      ?AUTO_2919 - BLOCK
    )
    :vars
    (
      ?AUTO_2923 - BLOCK
      ?AUTO_2921 - BLOCK
      ?AUTO_2920 - BLOCK
      ?AUTO_2922 - BLOCK
      ?AUTO_2924 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2919 ) ( not ( = ?AUTO_2918 ?AUTO_2919 ) ) ( ON ?AUTO_2918 ?AUTO_2923 ) ( not ( = ?AUTO_2918 ?AUTO_2923 ) ) ( not ( = ?AUTO_2919 ?AUTO_2923 ) ) ( not ( = ?AUTO_2918 ?AUTO_2921 ) ) ( not ( = ?AUTO_2919 ?AUTO_2921 ) ) ( not ( = ?AUTO_2923 ?AUTO_2921 ) ) ( ON ?AUTO_2921 ?AUTO_2918 ) ( CLEAR ?AUTO_2920 ) ( not ( = ?AUTO_2918 ?AUTO_2922 ) ) ( not ( = ?AUTO_2918 ?AUTO_2920 ) ) ( not ( = ?AUTO_2919 ?AUTO_2922 ) ) ( not ( = ?AUTO_2919 ?AUTO_2920 ) ) ( not ( = ?AUTO_2923 ?AUTO_2922 ) ) ( not ( = ?AUTO_2923 ?AUTO_2920 ) ) ( not ( = ?AUTO_2921 ?AUTO_2922 ) ) ( not ( = ?AUTO_2921 ?AUTO_2920 ) ) ( not ( = ?AUTO_2922 ?AUTO_2920 ) ) ( ON ?AUTO_2922 ?AUTO_2921 ) ( CLEAR ?AUTO_2922 ) ( HOLDING ?AUTO_2924 ) ( not ( = ?AUTO_2918 ?AUTO_2924 ) ) ( not ( = ?AUTO_2919 ?AUTO_2924 ) ) ( not ( = ?AUTO_2923 ?AUTO_2924 ) ) ( not ( = ?AUTO_2921 ?AUTO_2924 ) ) ( not ( = ?AUTO_2920 ?AUTO_2924 ) ) ( not ( = ?AUTO_2922 ?AUTO_2924 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2924 )
      ( MAKE-ON ?AUTO_2918 ?AUTO_2919 )
      ( MAKE-ON-VERIFY ?AUTO_2918 ?AUTO_2919 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2925 - BLOCK
      ?AUTO_2926 - BLOCK
    )
    :vars
    (
      ?AUTO_2929 - BLOCK
      ?AUTO_2930 - BLOCK
      ?AUTO_2927 - BLOCK
      ?AUTO_2928 - BLOCK
      ?AUTO_2931 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2926 ) ( not ( = ?AUTO_2925 ?AUTO_2926 ) ) ( ON ?AUTO_2925 ?AUTO_2929 ) ( not ( = ?AUTO_2925 ?AUTO_2929 ) ) ( not ( = ?AUTO_2926 ?AUTO_2929 ) ) ( not ( = ?AUTO_2925 ?AUTO_2930 ) ) ( not ( = ?AUTO_2926 ?AUTO_2930 ) ) ( not ( = ?AUTO_2929 ?AUTO_2930 ) ) ( ON ?AUTO_2930 ?AUTO_2925 ) ( CLEAR ?AUTO_2927 ) ( not ( = ?AUTO_2925 ?AUTO_2928 ) ) ( not ( = ?AUTO_2925 ?AUTO_2927 ) ) ( not ( = ?AUTO_2926 ?AUTO_2928 ) ) ( not ( = ?AUTO_2926 ?AUTO_2927 ) ) ( not ( = ?AUTO_2929 ?AUTO_2928 ) ) ( not ( = ?AUTO_2929 ?AUTO_2927 ) ) ( not ( = ?AUTO_2930 ?AUTO_2928 ) ) ( not ( = ?AUTO_2930 ?AUTO_2927 ) ) ( not ( = ?AUTO_2928 ?AUTO_2927 ) ) ( ON ?AUTO_2928 ?AUTO_2930 ) ( not ( = ?AUTO_2925 ?AUTO_2931 ) ) ( not ( = ?AUTO_2926 ?AUTO_2931 ) ) ( not ( = ?AUTO_2929 ?AUTO_2931 ) ) ( not ( = ?AUTO_2930 ?AUTO_2931 ) ) ( not ( = ?AUTO_2927 ?AUTO_2931 ) ) ( not ( = ?AUTO_2928 ?AUTO_2931 ) ) ( ON ?AUTO_2931 ?AUTO_2928 ) ( CLEAR ?AUTO_2931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2931 ?AUTO_2928 )
      ( MAKE-ON ?AUTO_2925 ?AUTO_2926 )
      ( MAKE-ON-VERIFY ?AUTO_2925 ?AUTO_2926 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2932 - BLOCK
      ?AUTO_2933 - BLOCK
    )
    :vars
    (
      ?AUTO_2936 - BLOCK
      ?AUTO_2935 - BLOCK
      ?AUTO_2938 - BLOCK
      ?AUTO_2937 - BLOCK
      ?AUTO_2934 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2933 ) ( not ( = ?AUTO_2932 ?AUTO_2933 ) ) ( ON ?AUTO_2932 ?AUTO_2936 ) ( not ( = ?AUTO_2932 ?AUTO_2936 ) ) ( not ( = ?AUTO_2933 ?AUTO_2936 ) ) ( not ( = ?AUTO_2932 ?AUTO_2935 ) ) ( not ( = ?AUTO_2933 ?AUTO_2935 ) ) ( not ( = ?AUTO_2936 ?AUTO_2935 ) ) ( ON ?AUTO_2935 ?AUTO_2932 ) ( not ( = ?AUTO_2932 ?AUTO_2938 ) ) ( not ( = ?AUTO_2932 ?AUTO_2937 ) ) ( not ( = ?AUTO_2933 ?AUTO_2938 ) ) ( not ( = ?AUTO_2933 ?AUTO_2937 ) ) ( not ( = ?AUTO_2936 ?AUTO_2938 ) ) ( not ( = ?AUTO_2936 ?AUTO_2937 ) ) ( not ( = ?AUTO_2935 ?AUTO_2938 ) ) ( not ( = ?AUTO_2935 ?AUTO_2937 ) ) ( not ( = ?AUTO_2938 ?AUTO_2937 ) ) ( ON ?AUTO_2938 ?AUTO_2935 ) ( not ( = ?AUTO_2932 ?AUTO_2934 ) ) ( not ( = ?AUTO_2933 ?AUTO_2934 ) ) ( not ( = ?AUTO_2936 ?AUTO_2934 ) ) ( not ( = ?AUTO_2935 ?AUTO_2934 ) ) ( not ( = ?AUTO_2937 ?AUTO_2934 ) ) ( not ( = ?AUTO_2938 ?AUTO_2934 ) ) ( ON ?AUTO_2934 ?AUTO_2938 ) ( CLEAR ?AUTO_2934 ) ( HOLDING ?AUTO_2937 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2937 )
      ( MAKE-ON ?AUTO_2932 ?AUTO_2933 )
      ( MAKE-ON-VERIFY ?AUTO_2932 ?AUTO_2933 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2939 - BLOCK
      ?AUTO_2940 - BLOCK
    )
    :vars
    (
      ?AUTO_2942 - BLOCK
      ?AUTO_2944 - BLOCK
      ?AUTO_2943 - BLOCK
      ?AUTO_2945 - BLOCK
      ?AUTO_2941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2939 ?AUTO_2940 ) ) ( ON ?AUTO_2939 ?AUTO_2942 ) ( not ( = ?AUTO_2939 ?AUTO_2942 ) ) ( not ( = ?AUTO_2940 ?AUTO_2942 ) ) ( not ( = ?AUTO_2939 ?AUTO_2944 ) ) ( not ( = ?AUTO_2940 ?AUTO_2944 ) ) ( not ( = ?AUTO_2942 ?AUTO_2944 ) ) ( ON ?AUTO_2944 ?AUTO_2939 ) ( not ( = ?AUTO_2939 ?AUTO_2943 ) ) ( not ( = ?AUTO_2939 ?AUTO_2945 ) ) ( not ( = ?AUTO_2940 ?AUTO_2943 ) ) ( not ( = ?AUTO_2940 ?AUTO_2945 ) ) ( not ( = ?AUTO_2942 ?AUTO_2943 ) ) ( not ( = ?AUTO_2942 ?AUTO_2945 ) ) ( not ( = ?AUTO_2944 ?AUTO_2943 ) ) ( not ( = ?AUTO_2944 ?AUTO_2945 ) ) ( not ( = ?AUTO_2943 ?AUTO_2945 ) ) ( ON ?AUTO_2943 ?AUTO_2944 ) ( not ( = ?AUTO_2939 ?AUTO_2941 ) ) ( not ( = ?AUTO_2940 ?AUTO_2941 ) ) ( not ( = ?AUTO_2942 ?AUTO_2941 ) ) ( not ( = ?AUTO_2944 ?AUTO_2941 ) ) ( not ( = ?AUTO_2945 ?AUTO_2941 ) ) ( not ( = ?AUTO_2943 ?AUTO_2941 ) ) ( ON ?AUTO_2941 ?AUTO_2943 ) ( CLEAR ?AUTO_2941 ) ( ON ?AUTO_2945 ?AUTO_2940 ) ( CLEAR ?AUTO_2945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2945 ?AUTO_2940 )
      ( MAKE-ON ?AUTO_2939 ?AUTO_2940 )
      ( MAKE-ON-VERIFY ?AUTO_2939 ?AUTO_2940 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2948 - BLOCK
      ?AUTO_2949 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2948 ) ( CLEAR ?AUTO_2949 ) ( not ( = ?AUTO_2948 ?AUTO_2949 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2948 ?AUTO_2949 )
      ( MAKE-ON-VERIFY ?AUTO_2948 ?AUTO_2949 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2950 - BLOCK
      ?AUTO_2951 - BLOCK
    )
    :vars
    (
      ?AUTO_2952 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2951 ) ( not ( = ?AUTO_2950 ?AUTO_2951 ) ) ( ON ?AUTO_2950 ?AUTO_2952 ) ( CLEAR ?AUTO_2950 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2950 ?AUTO_2952 ) ) ( not ( = ?AUTO_2951 ?AUTO_2952 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2950 ?AUTO_2952 )
      ( MAKE-ON ?AUTO_2950 ?AUTO_2951 )
      ( MAKE-ON-VERIFY ?AUTO_2950 ?AUTO_2951 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2953 - BLOCK
      ?AUTO_2954 - BLOCK
    )
    :vars
    (
      ?AUTO_2955 - BLOCK
      ?AUTO_2956 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2953 ?AUTO_2954 ) ) ( ON ?AUTO_2953 ?AUTO_2955 ) ( CLEAR ?AUTO_2953 ) ( not ( = ?AUTO_2953 ?AUTO_2955 ) ) ( not ( = ?AUTO_2954 ?AUTO_2955 ) ) ( HOLDING ?AUTO_2954 ) ( CLEAR ?AUTO_2956 ) ( not ( = ?AUTO_2953 ?AUTO_2956 ) ) ( not ( = ?AUTO_2954 ?AUTO_2956 ) ) ( not ( = ?AUTO_2955 ?AUTO_2956 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2954 ?AUTO_2956 )
      ( MAKE-ON ?AUTO_2953 ?AUTO_2954 )
      ( MAKE-ON-VERIFY ?AUTO_2953 ?AUTO_2954 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2959 - BLOCK
      ?AUTO_2960 - BLOCK
    )
    :vars
    (
      ?AUTO_2961 - BLOCK
      ?AUTO_2962 - BLOCK
      ?AUTO_2963 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2960 ) ( not ( = ?AUTO_2959 ?AUTO_2960 ) ) ( ON ?AUTO_2959 ?AUTO_2961 ) ( CLEAR ?AUTO_2959 ) ( not ( = ?AUTO_2959 ?AUTO_2961 ) ) ( not ( = ?AUTO_2960 ?AUTO_2961 ) ) ( HOLDING ?AUTO_2962 ) ( CLEAR ?AUTO_2963 ) ( not ( = ?AUTO_2959 ?AUTO_2962 ) ) ( not ( = ?AUTO_2959 ?AUTO_2963 ) ) ( not ( = ?AUTO_2960 ?AUTO_2962 ) ) ( not ( = ?AUTO_2960 ?AUTO_2963 ) ) ( not ( = ?AUTO_2961 ?AUTO_2962 ) ) ( not ( = ?AUTO_2961 ?AUTO_2963 ) ) ( not ( = ?AUTO_2962 ?AUTO_2963 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2962 ?AUTO_2963 )
      ( MAKE-ON ?AUTO_2959 ?AUTO_2960 )
      ( MAKE-ON-VERIFY ?AUTO_2959 ?AUTO_2960 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2964 - BLOCK
      ?AUTO_2965 - BLOCK
    )
    :vars
    (
      ?AUTO_2966 - BLOCK
      ?AUTO_2967 - BLOCK
      ?AUTO_2968 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2965 ) ( not ( = ?AUTO_2964 ?AUTO_2965 ) ) ( ON ?AUTO_2964 ?AUTO_2966 ) ( not ( = ?AUTO_2964 ?AUTO_2966 ) ) ( not ( = ?AUTO_2965 ?AUTO_2966 ) ) ( CLEAR ?AUTO_2967 ) ( not ( = ?AUTO_2964 ?AUTO_2968 ) ) ( not ( = ?AUTO_2964 ?AUTO_2967 ) ) ( not ( = ?AUTO_2965 ?AUTO_2968 ) ) ( not ( = ?AUTO_2965 ?AUTO_2967 ) ) ( not ( = ?AUTO_2966 ?AUTO_2968 ) ) ( not ( = ?AUTO_2966 ?AUTO_2967 ) ) ( not ( = ?AUTO_2968 ?AUTO_2967 ) ) ( ON ?AUTO_2968 ?AUTO_2964 ) ( CLEAR ?AUTO_2968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2968 ?AUTO_2964 )
      ( MAKE-ON ?AUTO_2964 ?AUTO_2965 )
      ( MAKE-ON-VERIFY ?AUTO_2964 ?AUTO_2965 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2969 - BLOCK
      ?AUTO_2970 - BLOCK
    )
    :vars
    (
      ?AUTO_2971 - BLOCK
      ?AUTO_2972 - BLOCK
      ?AUTO_2973 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2969 ?AUTO_2970 ) ) ( ON ?AUTO_2969 ?AUTO_2971 ) ( not ( = ?AUTO_2969 ?AUTO_2971 ) ) ( not ( = ?AUTO_2970 ?AUTO_2971 ) ) ( CLEAR ?AUTO_2972 ) ( not ( = ?AUTO_2969 ?AUTO_2973 ) ) ( not ( = ?AUTO_2969 ?AUTO_2972 ) ) ( not ( = ?AUTO_2970 ?AUTO_2973 ) ) ( not ( = ?AUTO_2970 ?AUTO_2972 ) ) ( not ( = ?AUTO_2971 ?AUTO_2973 ) ) ( not ( = ?AUTO_2971 ?AUTO_2972 ) ) ( not ( = ?AUTO_2973 ?AUTO_2972 ) ) ( ON ?AUTO_2973 ?AUTO_2969 ) ( CLEAR ?AUTO_2973 ) ( HOLDING ?AUTO_2970 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2970 )
      ( MAKE-ON ?AUTO_2969 ?AUTO_2970 )
      ( MAKE-ON-VERIFY ?AUTO_2969 ?AUTO_2970 ) )
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
      ?AUTO_2980 - BLOCK
      ?AUTO_2979 - BLOCK
      ?AUTO_2981 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2977 ) ( not ( = ?AUTO_2976 ?AUTO_2977 ) ) ( ON ?AUTO_2976 ?AUTO_2978 ) ( not ( = ?AUTO_2976 ?AUTO_2978 ) ) ( not ( = ?AUTO_2977 ?AUTO_2978 ) ) ( CLEAR ?AUTO_2980 ) ( not ( = ?AUTO_2976 ?AUTO_2979 ) ) ( not ( = ?AUTO_2976 ?AUTO_2980 ) ) ( not ( = ?AUTO_2977 ?AUTO_2979 ) ) ( not ( = ?AUTO_2977 ?AUTO_2980 ) ) ( not ( = ?AUTO_2978 ?AUTO_2979 ) ) ( not ( = ?AUTO_2978 ?AUTO_2980 ) ) ( not ( = ?AUTO_2979 ?AUTO_2980 ) ) ( ON ?AUTO_2979 ?AUTO_2976 ) ( CLEAR ?AUTO_2979 ) ( HOLDING ?AUTO_2981 ) ( not ( = ?AUTO_2976 ?AUTO_2981 ) ) ( not ( = ?AUTO_2977 ?AUTO_2981 ) ) ( not ( = ?AUTO_2978 ?AUTO_2981 ) ) ( not ( = ?AUTO_2980 ?AUTO_2981 ) ) ( not ( = ?AUTO_2979 ?AUTO_2981 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2981 )
      ( MAKE-ON ?AUTO_2976 ?AUTO_2977 )
      ( MAKE-ON-VERIFY ?AUTO_2976 ?AUTO_2977 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2982 - BLOCK
      ?AUTO_2983 - BLOCK
    )
    :vars
    (
      ?AUTO_2985 - BLOCK
      ?AUTO_2986 - BLOCK
      ?AUTO_2984 - BLOCK
      ?AUTO_2987 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2982 ?AUTO_2983 ) ) ( ON ?AUTO_2982 ?AUTO_2985 ) ( not ( = ?AUTO_2982 ?AUTO_2985 ) ) ( not ( = ?AUTO_2983 ?AUTO_2985 ) ) ( CLEAR ?AUTO_2986 ) ( not ( = ?AUTO_2982 ?AUTO_2984 ) ) ( not ( = ?AUTO_2982 ?AUTO_2986 ) ) ( not ( = ?AUTO_2983 ?AUTO_2984 ) ) ( not ( = ?AUTO_2983 ?AUTO_2986 ) ) ( not ( = ?AUTO_2985 ?AUTO_2984 ) ) ( not ( = ?AUTO_2985 ?AUTO_2986 ) ) ( not ( = ?AUTO_2984 ?AUTO_2986 ) ) ( ON ?AUTO_2984 ?AUTO_2982 ) ( CLEAR ?AUTO_2984 ) ( not ( = ?AUTO_2982 ?AUTO_2987 ) ) ( not ( = ?AUTO_2983 ?AUTO_2987 ) ) ( not ( = ?AUTO_2985 ?AUTO_2987 ) ) ( not ( = ?AUTO_2986 ?AUTO_2987 ) ) ( not ( = ?AUTO_2984 ?AUTO_2987 ) ) ( ON ?AUTO_2987 ?AUTO_2983 ) ( CLEAR ?AUTO_2987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2987 ?AUTO_2983 )
      ( MAKE-ON ?AUTO_2982 ?AUTO_2983 )
      ( MAKE-ON-VERIFY ?AUTO_2982 ?AUTO_2983 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2988 - BLOCK
      ?AUTO_2989 - BLOCK
    )
    :vars
    (
      ?AUTO_2990 - BLOCK
      ?AUTO_2991 - BLOCK
      ?AUTO_2993 - BLOCK
      ?AUTO_2992 - BLOCK
      ?AUTO_2994 - BLOCK
      ?AUTO_2995 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2988 ?AUTO_2989 ) ) ( ON ?AUTO_2988 ?AUTO_2990 ) ( not ( = ?AUTO_2988 ?AUTO_2990 ) ) ( not ( = ?AUTO_2989 ?AUTO_2990 ) ) ( CLEAR ?AUTO_2991 ) ( not ( = ?AUTO_2988 ?AUTO_2993 ) ) ( not ( = ?AUTO_2988 ?AUTO_2991 ) ) ( not ( = ?AUTO_2989 ?AUTO_2993 ) ) ( not ( = ?AUTO_2989 ?AUTO_2991 ) ) ( not ( = ?AUTO_2990 ?AUTO_2993 ) ) ( not ( = ?AUTO_2990 ?AUTO_2991 ) ) ( not ( = ?AUTO_2993 ?AUTO_2991 ) ) ( ON ?AUTO_2993 ?AUTO_2988 ) ( CLEAR ?AUTO_2993 ) ( not ( = ?AUTO_2988 ?AUTO_2992 ) ) ( not ( = ?AUTO_2989 ?AUTO_2992 ) ) ( not ( = ?AUTO_2990 ?AUTO_2992 ) ) ( not ( = ?AUTO_2991 ?AUTO_2992 ) ) ( not ( = ?AUTO_2993 ?AUTO_2992 ) ) ( ON ?AUTO_2992 ?AUTO_2989 ) ( CLEAR ?AUTO_2992 ) ( HOLDING ?AUTO_2994 ) ( CLEAR ?AUTO_2995 ) ( not ( = ?AUTO_2988 ?AUTO_2994 ) ) ( not ( = ?AUTO_2988 ?AUTO_2995 ) ) ( not ( = ?AUTO_2989 ?AUTO_2994 ) ) ( not ( = ?AUTO_2989 ?AUTO_2995 ) ) ( not ( = ?AUTO_2990 ?AUTO_2994 ) ) ( not ( = ?AUTO_2990 ?AUTO_2995 ) ) ( not ( = ?AUTO_2991 ?AUTO_2994 ) ) ( not ( = ?AUTO_2991 ?AUTO_2995 ) ) ( not ( = ?AUTO_2993 ?AUTO_2994 ) ) ( not ( = ?AUTO_2993 ?AUTO_2995 ) ) ( not ( = ?AUTO_2992 ?AUTO_2994 ) ) ( not ( = ?AUTO_2992 ?AUTO_2995 ) ) ( not ( = ?AUTO_2994 ?AUTO_2995 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2994 ?AUTO_2995 )
      ( MAKE-ON ?AUTO_2988 ?AUTO_2989 )
      ( MAKE-ON-VERIFY ?AUTO_2988 ?AUTO_2989 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3000 - BLOCK
      ?AUTO_3001 - BLOCK
    )
    :vars
    (
      ?AUTO_3007 - BLOCK
      ?AUTO_3002 - BLOCK
      ?AUTO_3003 - BLOCK
      ?AUTO_3006 - BLOCK
      ?AUTO_3005 - BLOCK
      ?AUTO_3004 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3000 ?AUTO_3001 ) ) ( ON ?AUTO_3000 ?AUTO_3007 ) ( not ( = ?AUTO_3000 ?AUTO_3007 ) ) ( not ( = ?AUTO_3001 ?AUTO_3007 ) ) ( CLEAR ?AUTO_3002 ) ( not ( = ?AUTO_3000 ?AUTO_3003 ) ) ( not ( = ?AUTO_3000 ?AUTO_3002 ) ) ( not ( = ?AUTO_3001 ?AUTO_3003 ) ) ( not ( = ?AUTO_3001 ?AUTO_3002 ) ) ( not ( = ?AUTO_3007 ?AUTO_3003 ) ) ( not ( = ?AUTO_3007 ?AUTO_3002 ) ) ( not ( = ?AUTO_3003 ?AUTO_3002 ) ) ( ON ?AUTO_3003 ?AUTO_3000 ) ( CLEAR ?AUTO_3003 ) ( not ( = ?AUTO_3000 ?AUTO_3006 ) ) ( not ( = ?AUTO_3001 ?AUTO_3006 ) ) ( not ( = ?AUTO_3007 ?AUTO_3006 ) ) ( not ( = ?AUTO_3002 ?AUTO_3006 ) ) ( not ( = ?AUTO_3003 ?AUTO_3006 ) ) ( ON ?AUTO_3006 ?AUTO_3001 ) ( CLEAR ?AUTO_3005 ) ( not ( = ?AUTO_3000 ?AUTO_3004 ) ) ( not ( = ?AUTO_3000 ?AUTO_3005 ) ) ( not ( = ?AUTO_3001 ?AUTO_3004 ) ) ( not ( = ?AUTO_3001 ?AUTO_3005 ) ) ( not ( = ?AUTO_3007 ?AUTO_3004 ) ) ( not ( = ?AUTO_3007 ?AUTO_3005 ) ) ( not ( = ?AUTO_3002 ?AUTO_3004 ) ) ( not ( = ?AUTO_3002 ?AUTO_3005 ) ) ( not ( = ?AUTO_3003 ?AUTO_3004 ) ) ( not ( = ?AUTO_3003 ?AUTO_3005 ) ) ( not ( = ?AUTO_3006 ?AUTO_3004 ) ) ( not ( = ?AUTO_3006 ?AUTO_3005 ) ) ( not ( = ?AUTO_3004 ?AUTO_3005 ) ) ( ON ?AUTO_3004 ?AUTO_3006 ) ( CLEAR ?AUTO_3004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3004 ?AUTO_3006 )
      ( MAKE-ON ?AUTO_3000 ?AUTO_3001 )
      ( MAKE-ON-VERIFY ?AUTO_3000 ?AUTO_3001 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3008 - BLOCK
      ?AUTO_3009 - BLOCK
    )
    :vars
    (
      ?AUTO_3015 - BLOCK
      ?AUTO_3013 - BLOCK
      ?AUTO_3014 - BLOCK
      ?AUTO_3011 - BLOCK
      ?AUTO_3010 - BLOCK
      ?AUTO_3012 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3008 ?AUTO_3009 ) ) ( ON ?AUTO_3008 ?AUTO_3015 ) ( not ( = ?AUTO_3008 ?AUTO_3015 ) ) ( not ( = ?AUTO_3009 ?AUTO_3015 ) ) ( CLEAR ?AUTO_3013 ) ( not ( = ?AUTO_3008 ?AUTO_3014 ) ) ( not ( = ?AUTO_3008 ?AUTO_3013 ) ) ( not ( = ?AUTO_3009 ?AUTO_3014 ) ) ( not ( = ?AUTO_3009 ?AUTO_3013 ) ) ( not ( = ?AUTO_3015 ?AUTO_3014 ) ) ( not ( = ?AUTO_3015 ?AUTO_3013 ) ) ( not ( = ?AUTO_3014 ?AUTO_3013 ) ) ( ON ?AUTO_3014 ?AUTO_3008 ) ( CLEAR ?AUTO_3014 ) ( not ( = ?AUTO_3008 ?AUTO_3011 ) ) ( not ( = ?AUTO_3009 ?AUTO_3011 ) ) ( not ( = ?AUTO_3015 ?AUTO_3011 ) ) ( not ( = ?AUTO_3013 ?AUTO_3011 ) ) ( not ( = ?AUTO_3014 ?AUTO_3011 ) ) ( ON ?AUTO_3011 ?AUTO_3009 ) ( not ( = ?AUTO_3008 ?AUTO_3010 ) ) ( not ( = ?AUTO_3008 ?AUTO_3012 ) ) ( not ( = ?AUTO_3009 ?AUTO_3010 ) ) ( not ( = ?AUTO_3009 ?AUTO_3012 ) ) ( not ( = ?AUTO_3015 ?AUTO_3010 ) ) ( not ( = ?AUTO_3015 ?AUTO_3012 ) ) ( not ( = ?AUTO_3013 ?AUTO_3010 ) ) ( not ( = ?AUTO_3013 ?AUTO_3012 ) ) ( not ( = ?AUTO_3014 ?AUTO_3010 ) ) ( not ( = ?AUTO_3014 ?AUTO_3012 ) ) ( not ( = ?AUTO_3011 ?AUTO_3010 ) ) ( not ( = ?AUTO_3011 ?AUTO_3012 ) ) ( not ( = ?AUTO_3010 ?AUTO_3012 ) ) ( ON ?AUTO_3010 ?AUTO_3011 ) ( CLEAR ?AUTO_3010 ) ( HOLDING ?AUTO_3012 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3012 )
      ( MAKE-ON ?AUTO_3008 ?AUTO_3009 )
      ( MAKE-ON-VERIFY ?AUTO_3008 ?AUTO_3009 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3016 - BLOCK
      ?AUTO_3017 - BLOCK
    )
    :vars
    (
      ?AUTO_3021 - BLOCK
      ?AUTO_3022 - BLOCK
      ?AUTO_3020 - BLOCK
      ?AUTO_3023 - BLOCK
      ?AUTO_3018 - BLOCK
      ?AUTO_3019 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3016 ?AUTO_3017 ) ) ( ON ?AUTO_3016 ?AUTO_3021 ) ( not ( = ?AUTO_3016 ?AUTO_3021 ) ) ( not ( = ?AUTO_3017 ?AUTO_3021 ) ) ( CLEAR ?AUTO_3022 ) ( not ( = ?AUTO_3016 ?AUTO_3020 ) ) ( not ( = ?AUTO_3016 ?AUTO_3022 ) ) ( not ( = ?AUTO_3017 ?AUTO_3020 ) ) ( not ( = ?AUTO_3017 ?AUTO_3022 ) ) ( not ( = ?AUTO_3021 ?AUTO_3020 ) ) ( not ( = ?AUTO_3021 ?AUTO_3022 ) ) ( not ( = ?AUTO_3020 ?AUTO_3022 ) ) ( ON ?AUTO_3020 ?AUTO_3016 ) ( CLEAR ?AUTO_3020 ) ( not ( = ?AUTO_3016 ?AUTO_3023 ) ) ( not ( = ?AUTO_3017 ?AUTO_3023 ) ) ( not ( = ?AUTO_3021 ?AUTO_3023 ) ) ( not ( = ?AUTO_3022 ?AUTO_3023 ) ) ( not ( = ?AUTO_3020 ?AUTO_3023 ) ) ( ON ?AUTO_3023 ?AUTO_3017 ) ( not ( = ?AUTO_3016 ?AUTO_3018 ) ) ( not ( = ?AUTO_3016 ?AUTO_3019 ) ) ( not ( = ?AUTO_3017 ?AUTO_3018 ) ) ( not ( = ?AUTO_3017 ?AUTO_3019 ) ) ( not ( = ?AUTO_3021 ?AUTO_3018 ) ) ( not ( = ?AUTO_3021 ?AUTO_3019 ) ) ( not ( = ?AUTO_3022 ?AUTO_3018 ) ) ( not ( = ?AUTO_3022 ?AUTO_3019 ) ) ( not ( = ?AUTO_3020 ?AUTO_3018 ) ) ( not ( = ?AUTO_3020 ?AUTO_3019 ) ) ( not ( = ?AUTO_3023 ?AUTO_3018 ) ) ( not ( = ?AUTO_3023 ?AUTO_3019 ) ) ( not ( = ?AUTO_3018 ?AUTO_3019 ) ) ( ON ?AUTO_3018 ?AUTO_3023 ) ( ON ?AUTO_3019 ?AUTO_3018 ) ( CLEAR ?AUTO_3019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3019 ?AUTO_3018 )
      ( MAKE-ON ?AUTO_3016 ?AUTO_3017 )
      ( MAKE-ON-VERIFY ?AUTO_3016 ?AUTO_3017 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3024 - BLOCK
      ?AUTO_3025 - BLOCK
    )
    :vars
    (
      ?AUTO_3031 - BLOCK
      ?AUTO_3030 - BLOCK
      ?AUTO_3026 - BLOCK
      ?AUTO_3027 - BLOCK
      ?AUTO_3029 - BLOCK
      ?AUTO_3028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3024 ?AUTO_3025 ) ) ( ON ?AUTO_3024 ?AUTO_3031 ) ( not ( = ?AUTO_3024 ?AUTO_3031 ) ) ( not ( = ?AUTO_3025 ?AUTO_3031 ) ) ( not ( = ?AUTO_3024 ?AUTO_3030 ) ) ( not ( = ?AUTO_3024 ?AUTO_3026 ) ) ( not ( = ?AUTO_3025 ?AUTO_3030 ) ) ( not ( = ?AUTO_3025 ?AUTO_3026 ) ) ( not ( = ?AUTO_3031 ?AUTO_3030 ) ) ( not ( = ?AUTO_3031 ?AUTO_3026 ) ) ( not ( = ?AUTO_3030 ?AUTO_3026 ) ) ( ON ?AUTO_3030 ?AUTO_3024 ) ( CLEAR ?AUTO_3030 ) ( not ( = ?AUTO_3024 ?AUTO_3027 ) ) ( not ( = ?AUTO_3025 ?AUTO_3027 ) ) ( not ( = ?AUTO_3031 ?AUTO_3027 ) ) ( not ( = ?AUTO_3026 ?AUTO_3027 ) ) ( not ( = ?AUTO_3030 ?AUTO_3027 ) ) ( ON ?AUTO_3027 ?AUTO_3025 ) ( not ( = ?AUTO_3024 ?AUTO_3029 ) ) ( not ( = ?AUTO_3024 ?AUTO_3028 ) ) ( not ( = ?AUTO_3025 ?AUTO_3029 ) ) ( not ( = ?AUTO_3025 ?AUTO_3028 ) ) ( not ( = ?AUTO_3031 ?AUTO_3029 ) ) ( not ( = ?AUTO_3031 ?AUTO_3028 ) ) ( not ( = ?AUTO_3026 ?AUTO_3029 ) ) ( not ( = ?AUTO_3026 ?AUTO_3028 ) ) ( not ( = ?AUTO_3030 ?AUTO_3029 ) ) ( not ( = ?AUTO_3030 ?AUTO_3028 ) ) ( not ( = ?AUTO_3027 ?AUTO_3029 ) ) ( not ( = ?AUTO_3027 ?AUTO_3028 ) ) ( not ( = ?AUTO_3029 ?AUTO_3028 ) ) ( ON ?AUTO_3029 ?AUTO_3027 ) ( ON ?AUTO_3028 ?AUTO_3029 ) ( CLEAR ?AUTO_3028 ) ( HOLDING ?AUTO_3026 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3026 )
      ( MAKE-ON ?AUTO_3024 ?AUTO_3025 )
      ( MAKE-ON-VERIFY ?AUTO_3024 ?AUTO_3025 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3032 - BLOCK
      ?AUTO_3033 - BLOCK
    )
    :vars
    (
      ?AUTO_3035 - BLOCK
      ?AUTO_3039 - BLOCK
      ?AUTO_3034 - BLOCK
      ?AUTO_3036 - BLOCK
      ?AUTO_3037 - BLOCK
      ?AUTO_3038 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3032 ?AUTO_3033 ) ) ( ON ?AUTO_3032 ?AUTO_3035 ) ( not ( = ?AUTO_3032 ?AUTO_3035 ) ) ( not ( = ?AUTO_3033 ?AUTO_3035 ) ) ( not ( = ?AUTO_3032 ?AUTO_3039 ) ) ( not ( = ?AUTO_3032 ?AUTO_3034 ) ) ( not ( = ?AUTO_3033 ?AUTO_3039 ) ) ( not ( = ?AUTO_3033 ?AUTO_3034 ) ) ( not ( = ?AUTO_3035 ?AUTO_3039 ) ) ( not ( = ?AUTO_3035 ?AUTO_3034 ) ) ( not ( = ?AUTO_3039 ?AUTO_3034 ) ) ( ON ?AUTO_3039 ?AUTO_3032 ) ( not ( = ?AUTO_3032 ?AUTO_3036 ) ) ( not ( = ?AUTO_3033 ?AUTO_3036 ) ) ( not ( = ?AUTO_3035 ?AUTO_3036 ) ) ( not ( = ?AUTO_3034 ?AUTO_3036 ) ) ( not ( = ?AUTO_3039 ?AUTO_3036 ) ) ( ON ?AUTO_3036 ?AUTO_3033 ) ( not ( = ?AUTO_3032 ?AUTO_3037 ) ) ( not ( = ?AUTO_3032 ?AUTO_3038 ) ) ( not ( = ?AUTO_3033 ?AUTO_3037 ) ) ( not ( = ?AUTO_3033 ?AUTO_3038 ) ) ( not ( = ?AUTO_3035 ?AUTO_3037 ) ) ( not ( = ?AUTO_3035 ?AUTO_3038 ) ) ( not ( = ?AUTO_3034 ?AUTO_3037 ) ) ( not ( = ?AUTO_3034 ?AUTO_3038 ) ) ( not ( = ?AUTO_3039 ?AUTO_3037 ) ) ( not ( = ?AUTO_3039 ?AUTO_3038 ) ) ( not ( = ?AUTO_3036 ?AUTO_3037 ) ) ( not ( = ?AUTO_3036 ?AUTO_3038 ) ) ( not ( = ?AUTO_3037 ?AUTO_3038 ) ) ( ON ?AUTO_3037 ?AUTO_3036 ) ( ON ?AUTO_3038 ?AUTO_3037 ) ( CLEAR ?AUTO_3038 ) ( ON ?AUTO_3034 ?AUTO_3039 ) ( CLEAR ?AUTO_3034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3034 ?AUTO_3039 )
      ( MAKE-ON ?AUTO_3032 ?AUTO_3033 )
      ( MAKE-ON-VERIFY ?AUTO_3032 ?AUTO_3033 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3042 - BLOCK
      ?AUTO_3043 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3042 ) ( CLEAR ?AUTO_3043 ) ( not ( = ?AUTO_3042 ?AUTO_3043 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3042 ?AUTO_3043 )
      ( MAKE-ON-VERIFY ?AUTO_3042 ?AUTO_3043 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3044 - BLOCK
      ?AUTO_3045 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3045 ) ( not ( = ?AUTO_3044 ?AUTO_3045 ) ) ( ON-TABLE ?AUTO_3044 ) ( CLEAR ?AUTO_3044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3044 )
      ( MAKE-ON ?AUTO_3044 ?AUTO_3045 )
      ( MAKE-ON-VERIFY ?AUTO_3044 ?AUTO_3045 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3046 - BLOCK
      ?AUTO_3047 - BLOCK
    )
    :vars
    (
      ?AUTO_3048 - BLOCK
      ?AUTO_3049 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3047 ) ( not ( = ?AUTO_3046 ?AUTO_3047 ) ) ( ON-TABLE ?AUTO_3046 ) ( CLEAR ?AUTO_3046 ) ( HOLDING ?AUTO_3048 ) ( CLEAR ?AUTO_3049 ) ( not ( = ?AUTO_3046 ?AUTO_3048 ) ) ( not ( = ?AUTO_3046 ?AUTO_3049 ) ) ( not ( = ?AUTO_3047 ?AUTO_3048 ) ) ( not ( = ?AUTO_3047 ?AUTO_3049 ) ) ( not ( = ?AUTO_3048 ?AUTO_3049 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3048 ?AUTO_3049 )
      ( MAKE-ON ?AUTO_3046 ?AUTO_3047 )
      ( MAKE-ON-VERIFY ?AUTO_3046 ?AUTO_3047 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3050 - BLOCK
      ?AUTO_3051 - BLOCK
    )
    :vars
    (
      ?AUTO_3052 - BLOCK
      ?AUTO_3053 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3051 ) ( not ( = ?AUTO_3050 ?AUTO_3051 ) ) ( ON-TABLE ?AUTO_3050 ) ( CLEAR ?AUTO_3052 ) ( not ( = ?AUTO_3050 ?AUTO_3053 ) ) ( not ( = ?AUTO_3050 ?AUTO_3052 ) ) ( not ( = ?AUTO_3051 ?AUTO_3053 ) ) ( not ( = ?AUTO_3051 ?AUTO_3052 ) ) ( not ( = ?AUTO_3053 ?AUTO_3052 ) ) ( ON ?AUTO_3053 ?AUTO_3050 ) ( CLEAR ?AUTO_3053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3053 ?AUTO_3050 )
      ( MAKE-ON ?AUTO_3050 ?AUTO_3051 )
      ( MAKE-ON-VERIFY ?AUTO_3050 ?AUTO_3051 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3054 - BLOCK
      ?AUTO_3055 - BLOCK
    )
    :vars
    (
      ?AUTO_3056 - BLOCK
      ?AUTO_3057 - BLOCK
      ?AUTO_3058 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3055 ) ( not ( = ?AUTO_3054 ?AUTO_3055 ) ) ( ON-TABLE ?AUTO_3054 ) ( not ( = ?AUTO_3054 ?AUTO_3056 ) ) ( not ( = ?AUTO_3054 ?AUTO_3057 ) ) ( not ( = ?AUTO_3055 ?AUTO_3056 ) ) ( not ( = ?AUTO_3055 ?AUTO_3057 ) ) ( not ( = ?AUTO_3056 ?AUTO_3057 ) ) ( ON ?AUTO_3056 ?AUTO_3054 ) ( CLEAR ?AUTO_3056 ) ( HOLDING ?AUTO_3057 ) ( CLEAR ?AUTO_3058 ) ( not ( = ?AUTO_3054 ?AUTO_3058 ) ) ( not ( = ?AUTO_3055 ?AUTO_3058 ) ) ( not ( = ?AUTO_3056 ?AUTO_3058 ) ) ( not ( = ?AUTO_3057 ?AUTO_3058 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3057 ?AUTO_3058 )
      ( MAKE-ON ?AUTO_3054 ?AUTO_3055 )
      ( MAKE-ON-VERIFY ?AUTO_3054 ?AUTO_3055 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3063 - BLOCK
      ?AUTO_3064 - BLOCK
    )
    :vars
    (
      ?AUTO_3067 - BLOCK
      ?AUTO_3066 - BLOCK
      ?AUTO_3065 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3064 ) ( not ( = ?AUTO_3063 ?AUTO_3064 ) ) ( ON-TABLE ?AUTO_3063 ) ( not ( = ?AUTO_3063 ?AUTO_3067 ) ) ( not ( = ?AUTO_3063 ?AUTO_3066 ) ) ( not ( = ?AUTO_3064 ?AUTO_3067 ) ) ( not ( = ?AUTO_3064 ?AUTO_3066 ) ) ( not ( = ?AUTO_3067 ?AUTO_3066 ) ) ( ON ?AUTO_3067 ?AUTO_3063 ) ( CLEAR ?AUTO_3065 ) ( not ( = ?AUTO_3063 ?AUTO_3065 ) ) ( not ( = ?AUTO_3064 ?AUTO_3065 ) ) ( not ( = ?AUTO_3067 ?AUTO_3065 ) ) ( not ( = ?AUTO_3066 ?AUTO_3065 ) ) ( ON ?AUTO_3066 ?AUTO_3067 ) ( CLEAR ?AUTO_3066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3066 ?AUTO_3067 )
      ( MAKE-ON ?AUTO_3063 ?AUTO_3064 )
      ( MAKE-ON-VERIFY ?AUTO_3063 ?AUTO_3064 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3068 - BLOCK
      ?AUTO_3069 - BLOCK
    )
    :vars
    (
      ?AUTO_3072 - BLOCK
      ?AUTO_3071 - BLOCK
      ?AUTO_3070 - BLOCK
      ?AUTO_3073 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3069 ) ( not ( = ?AUTO_3068 ?AUTO_3069 ) ) ( ON-TABLE ?AUTO_3068 ) ( not ( = ?AUTO_3068 ?AUTO_3072 ) ) ( not ( = ?AUTO_3068 ?AUTO_3071 ) ) ( not ( = ?AUTO_3069 ?AUTO_3072 ) ) ( not ( = ?AUTO_3069 ?AUTO_3071 ) ) ( not ( = ?AUTO_3072 ?AUTO_3071 ) ) ( ON ?AUTO_3072 ?AUTO_3068 ) ( CLEAR ?AUTO_3070 ) ( not ( = ?AUTO_3068 ?AUTO_3070 ) ) ( not ( = ?AUTO_3069 ?AUTO_3070 ) ) ( not ( = ?AUTO_3072 ?AUTO_3070 ) ) ( not ( = ?AUTO_3071 ?AUTO_3070 ) ) ( ON ?AUTO_3071 ?AUTO_3072 ) ( CLEAR ?AUTO_3071 ) ( HOLDING ?AUTO_3073 ) ( not ( = ?AUTO_3068 ?AUTO_3073 ) ) ( not ( = ?AUTO_3069 ?AUTO_3073 ) ) ( not ( = ?AUTO_3072 ?AUTO_3073 ) ) ( not ( = ?AUTO_3071 ?AUTO_3073 ) ) ( not ( = ?AUTO_3070 ?AUTO_3073 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3073 )
      ( MAKE-ON ?AUTO_3068 ?AUTO_3069 )
      ( MAKE-ON-VERIFY ?AUTO_3068 ?AUTO_3069 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3080 - BLOCK
      ?AUTO_3081 - BLOCK
    )
    :vars
    (
      ?AUTO_3084 - BLOCK
      ?AUTO_3082 - BLOCK
      ?AUTO_3083 - BLOCK
      ?AUTO_3085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3080 ?AUTO_3081 ) ) ( ON-TABLE ?AUTO_3080 ) ( not ( = ?AUTO_3080 ?AUTO_3084 ) ) ( not ( = ?AUTO_3080 ?AUTO_3082 ) ) ( not ( = ?AUTO_3081 ?AUTO_3084 ) ) ( not ( = ?AUTO_3081 ?AUTO_3082 ) ) ( not ( = ?AUTO_3084 ?AUTO_3082 ) ) ( ON ?AUTO_3084 ?AUTO_3080 ) ( CLEAR ?AUTO_3083 ) ( not ( = ?AUTO_3080 ?AUTO_3083 ) ) ( not ( = ?AUTO_3081 ?AUTO_3083 ) ) ( not ( = ?AUTO_3084 ?AUTO_3083 ) ) ( not ( = ?AUTO_3082 ?AUTO_3083 ) ) ( ON ?AUTO_3082 ?AUTO_3084 ) ( CLEAR ?AUTO_3082 ) ( HOLDING ?AUTO_3081 ) ( CLEAR ?AUTO_3085 ) ( not ( = ?AUTO_3080 ?AUTO_3085 ) ) ( not ( = ?AUTO_3081 ?AUTO_3085 ) ) ( not ( = ?AUTO_3084 ?AUTO_3085 ) ) ( not ( = ?AUTO_3082 ?AUTO_3085 ) ) ( not ( = ?AUTO_3083 ?AUTO_3085 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3081 ?AUTO_3085 )
      ( MAKE-ON ?AUTO_3080 ?AUTO_3081 )
      ( MAKE-ON-VERIFY ?AUTO_3080 ?AUTO_3081 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3096 - BLOCK
      ?AUTO_3097 - BLOCK
    )
    :vars
    (
      ?AUTO_3100 - BLOCK
      ?AUTO_3098 - BLOCK
      ?AUTO_3099 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3097 ) ( not ( = ?AUTO_3096 ?AUTO_3097 ) ) ( ON-TABLE ?AUTO_3096 ) ( not ( = ?AUTO_3096 ?AUTO_3100 ) ) ( not ( = ?AUTO_3096 ?AUTO_3098 ) ) ( not ( = ?AUTO_3097 ?AUTO_3100 ) ) ( not ( = ?AUTO_3097 ?AUTO_3098 ) ) ( not ( = ?AUTO_3100 ?AUTO_3098 ) ) ( ON ?AUTO_3100 ?AUTO_3096 ) ( not ( = ?AUTO_3096 ?AUTO_3099 ) ) ( not ( = ?AUTO_3097 ?AUTO_3099 ) ) ( not ( = ?AUTO_3100 ?AUTO_3099 ) ) ( not ( = ?AUTO_3098 ?AUTO_3099 ) ) ( ON ?AUTO_3098 ?AUTO_3100 ) ( CLEAR ?AUTO_3098 ) ( HOLDING ?AUTO_3099 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3099 )
      ( MAKE-ON ?AUTO_3096 ?AUTO_3097 )
      ( MAKE-ON-VERIFY ?AUTO_3096 ?AUTO_3097 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3101 - BLOCK
      ?AUTO_3102 - BLOCK
    )
    :vars
    (
      ?AUTO_3105 - BLOCK
      ?AUTO_3104 - BLOCK
      ?AUTO_3103 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3102 ) ( not ( = ?AUTO_3101 ?AUTO_3102 ) ) ( ON-TABLE ?AUTO_3101 ) ( not ( = ?AUTO_3101 ?AUTO_3105 ) ) ( not ( = ?AUTO_3101 ?AUTO_3104 ) ) ( not ( = ?AUTO_3102 ?AUTO_3105 ) ) ( not ( = ?AUTO_3102 ?AUTO_3104 ) ) ( not ( = ?AUTO_3105 ?AUTO_3104 ) ) ( ON ?AUTO_3105 ?AUTO_3101 ) ( not ( = ?AUTO_3101 ?AUTO_3103 ) ) ( not ( = ?AUTO_3102 ?AUTO_3103 ) ) ( not ( = ?AUTO_3105 ?AUTO_3103 ) ) ( not ( = ?AUTO_3104 ?AUTO_3103 ) ) ( ON ?AUTO_3104 ?AUTO_3105 ) ( ON ?AUTO_3103 ?AUTO_3104 ) ( CLEAR ?AUTO_3103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3103 ?AUTO_3104 )
      ( MAKE-ON ?AUTO_3101 ?AUTO_3102 )
      ( MAKE-ON-VERIFY ?AUTO_3101 ?AUTO_3102 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3108 - BLOCK
      ?AUTO_3109 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3108 ) ( CLEAR ?AUTO_3109 ) ( not ( = ?AUTO_3108 ?AUTO_3109 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3108 ?AUTO_3109 )
      ( MAKE-ON-VERIFY ?AUTO_3108 ?AUTO_3109 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3110 - BLOCK
      ?AUTO_3111 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3111 ) ( not ( = ?AUTO_3110 ?AUTO_3111 ) ) ( ON-TABLE ?AUTO_3110 ) ( CLEAR ?AUTO_3110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3110 )
      ( MAKE-ON ?AUTO_3110 ?AUTO_3111 )
      ( MAKE-ON-VERIFY ?AUTO_3110 ?AUTO_3111 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3112 - BLOCK
      ?AUTO_3113 - BLOCK
    )
    :vars
    (
      ?AUTO_3114 - BLOCK
      ?AUTO_3115 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3113 ) ( not ( = ?AUTO_3112 ?AUTO_3113 ) ) ( ON-TABLE ?AUTO_3112 ) ( CLEAR ?AUTO_3112 ) ( HOLDING ?AUTO_3114 ) ( CLEAR ?AUTO_3115 ) ( not ( = ?AUTO_3112 ?AUTO_3114 ) ) ( not ( = ?AUTO_3112 ?AUTO_3115 ) ) ( not ( = ?AUTO_3113 ?AUTO_3114 ) ) ( not ( = ?AUTO_3113 ?AUTO_3115 ) ) ( not ( = ?AUTO_3114 ?AUTO_3115 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3114 ?AUTO_3115 )
      ( MAKE-ON ?AUTO_3112 ?AUTO_3113 )
      ( MAKE-ON-VERIFY ?AUTO_3112 ?AUTO_3113 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3118 - BLOCK
      ?AUTO_3119 - BLOCK
    )
    :vars
    (
      ?AUTO_3120 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3118 ?AUTO_3119 ) ) ( ON-TABLE ?AUTO_3118 ) ( CLEAR ?AUTO_3118 ) ( HOLDING ?AUTO_3119 ) ( CLEAR ?AUTO_3120 ) ( not ( = ?AUTO_3118 ?AUTO_3120 ) ) ( not ( = ?AUTO_3119 ?AUTO_3120 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3119 ?AUTO_3120 )
      ( MAKE-ON ?AUTO_3118 ?AUTO_3119 )
      ( MAKE-ON-VERIFY ?AUTO_3118 ?AUTO_3119 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3129 - BLOCK
      ?AUTO_3130 - BLOCK
    )
    :vars
    (
      ?AUTO_3131 - BLOCK
      ?AUTO_3132 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3129 ?AUTO_3130 ) ) ( ON-TABLE ?AUTO_3129 ) ( CLEAR ?AUTO_3129 ) ( CLEAR ?AUTO_3131 ) ( not ( = ?AUTO_3129 ?AUTO_3132 ) ) ( not ( = ?AUTO_3129 ?AUTO_3131 ) ) ( not ( = ?AUTO_3130 ?AUTO_3132 ) ) ( not ( = ?AUTO_3130 ?AUTO_3131 ) ) ( not ( = ?AUTO_3132 ?AUTO_3131 ) ) ( ON ?AUTO_3132 ?AUTO_3130 ) ( CLEAR ?AUTO_3132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3132 ?AUTO_3130 )
      ( MAKE-ON ?AUTO_3129 ?AUTO_3130 )
      ( MAKE-ON-VERIFY ?AUTO_3129 ?AUTO_3130 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3133 - BLOCK
      ?AUTO_3134 - BLOCK
    )
    :vars
    (
      ?AUTO_3135 - BLOCK
      ?AUTO_3136 - BLOCK
      ?AUTO_3137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3133 ?AUTO_3134 ) ) ( ON-TABLE ?AUTO_3133 ) ( CLEAR ?AUTO_3133 ) ( CLEAR ?AUTO_3135 ) ( not ( = ?AUTO_3133 ?AUTO_3136 ) ) ( not ( = ?AUTO_3133 ?AUTO_3135 ) ) ( not ( = ?AUTO_3134 ?AUTO_3136 ) ) ( not ( = ?AUTO_3134 ?AUTO_3135 ) ) ( not ( = ?AUTO_3136 ?AUTO_3135 ) ) ( ON ?AUTO_3136 ?AUTO_3134 ) ( CLEAR ?AUTO_3136 ) ( HOLDING ?AUTO_3137 ) ( not ( = ?AUTO_3133 ?AUTO_3137 ) ) ( not ( = ?AUTO_3134 ?AUTO_3137 ) ) ( not ( = ?AUTO_3135 ?AUTO_3137 ) ) ( not ( = ?AUTO_3136 ?AUTO_3137 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3137 )
      ( MAKE-ON ?AUTO_3133 ?AUTO_3134 )
      ( MAKE-ON-VERIFY ?AUTO_3133 ?AUTO_3134 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3140 - BLOCK
      ?AUTO_3141 - BLOCK
    )
    :vars
    (
      ?AUTO_3142 - BLOCK
      ?AUTO_3143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3140 ?AUTO_3141 ) ) ( CLEAR ?AUTO_3142 ) ( not ( = ?AUTO_3140 ?AUTO_3143 ) ) ( not ( = ?AUTO_3140 ?AUTO_3142 ) ) ( not ( = ?AUTO_3141 ?AUTO_3143 ) ) ( not ( = ?AUTO_3141 ?AUTO_3142 ) ) ( not ( = ?AUTO_3143 ?AUTO_3142 ) ) ( ON ?AUTO_3143 ?AUTO_3141 ) ( CLEAR ?AUTO_3143 ) ( HOLDING ?AUTO_3140 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3140 )
      ( MAKE-ON ?AUTO_3140 ?AUTO_3141 )
      ( MAKE-ON-VERIFY ?AUTO_3140 ?AUTO_3141 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3154 - BLOCK
      ?AUTO_3155 - BLOCK
    )
    :vars
    (
      ?AUTO_3156 - BLOCK
      ?AUTO_3158 - BLOCK
      ?AUTO_3157 - BLOCK
      ?AUTO_3159 - BLOCK
      ?AUTO_3160 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3154 ?AUTO_3155 ) ) ( ON ?AUTO_3154 ?AUTO_3156 ) ( not ( = ?AUTO_3154 ?AUTO_3156 ) ) ( not ( = ?AUTO_3155 ?AUTO_3156 ) ) ( CLEAR ?AUTO_3158 ) ( not ( = ?AUTO_3154 ?AUTO_3157 ) ) ( not ( = ?AUTO_3154 ?AUTO_3158 ) ) ( not ( = ?AUTO_3155 ?AUTO_3157 ) ) ( not ( = ?AUTO_3155 ?AUTO_3158 ) ) ( not ( = ?AUTO_3156 ?AUTO_3157 ) ) ( not ( = ?AUTO_3156 ?AUTO_3158 ) ) ( not ( = ?AUTO_3157 ?AUTO_3158 ) ) ( ON ?AUTO_3157 ?AUTO_3154 ) ( CLEAR ?AUTO_3157 ) ( not ( = ?AUTO_3154 ?AUTO_3159 ) ) ( not ( = ?AUTO_3155 ?AUTO_3159 ) ) ( not ( = ?AUTO_3156 ?AUTO_3159 ) ) ( not ( = ?AUTO_3158 ?AUTO_3159 ) ) ( not ( = ?AUTO_3157 ?AUTO_3159 ) ) ( ON ?AUTO_3159 ?AUTO_3155 ) ( CLEAR ?AUTO_3159 ) ( HOLDING ?AUTO_3160 ) ( not ( = ?AUTO_3154 ?AUTO_3160 ) ) ( not ( = ?AUTO_3155 ?AUTO_3160 ) ) ( not ( = ?AUTO_3156 ?AUTO_3160 ) ) ( not ( = ?AUTO_3158 ?AUTO_3160 ) ) ( not ( = ?AUTO_3157 ?AUTO_3160 ) ) ( not ( = ?AUTO_3159 ?AUTO_3160 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3160 )
      ( MAKE-ON ?AUTO_3154 ?AUTO_3155 )
      ( MAKE-ON-VERIFY ?AUTO_3154 ?AUTO_3155 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3161 - BLOCK
      ?AUTO_3162 - BLOCK
    )
    :vars
    (
      ?AUTO_3167 - BLOCK
      ?AUTO_3164 - BLOCK
      ?AUTO_3166 - BLOCK
      ?AUTO_3163 - BLOCK
      ?AUTO_3165 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3161 ?AUTO_3162 ) ) ( ON ?AUTO_3161 ?AUTO_3167 ) ( not ( = ?AUTO_3161 ?AUTO_3167 ) ) ( not ( = ?AUTO_3162 ?AUTO_3167 ) ) ( CLEAR ?AUTO_3164 ) ( not ( = ?AUTO_3161 ?AUTO_3166 ) ) ( not ( = ?AUTO_3161 ?AUTO_3164 ) ) ( not ( = ?AUTO_3162 ?AUTO_3166 ) ) ( not ( = ?AUTO_3162 ?AUTO_3164 ) ) ( not ( = ?AUTO_3167 ?AUTO_3166 ) ) ( not ( = ?AUTO_3167 ?AUTO_3164 ) ) ( not ( = ?AUTO_3166 ?AUTO_3164 ) ) ( ON ?AUTO_3166 ?AUTO_3161 ) ( not ( = ?AUTO_3161 ?AUTO_3163 ) ) ( not ( = ?AUTO_3162 ?AUTO_3163 ) ) ( not ( = ?AUTO_3167 ?AUTO_3163 ) ) ( not ( = ?AUTO_3164 ?AUTO_3163 ) ) ( not ( = ?AUTO_3166 ?AUTO_3163 ) ) ( ON ?AUTO_3163 ?AUTO_3162 ) ( CLEAR ?AUTO_3163 ) ( not ( = ?AUTO_3161 ?AUTO_3165 ) ) ( not ( = ?AUTO_3162 ?AUTO_3165 ) ) ( not ( = ?AUTO_3167 ?AUTO_3165 ) ) ( not ( = ?AUTO_3164 ?AUTO_3165 ) ) ( not ( = ?AUTO_3166 ?AUTO_3165 ) ) ( not ( = ?AUTO_3163 ?AUTO_3165 ) ) ( ON ?AUTO_3165 ?AUTO_3166 ) ( CLEAR ?AUTO_3165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3165 ?AUTO_3166 )
      ( MAKE-ON ?AUTO_3161 ?AUTO_3162 )
      ( MAKE-ON-VERIFY ?AUTO_3161 ?AUTO_3162 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3168 - BLOCK
      ?AUTO_3169 - BLOCK
    )
    :vars
    (
      ?AUTO_3173 - BLOCK
      ?AUTO_3170 - BLOCK
      ?AUTO_3172 - BLOCK
      ?AUTO_3174 - BLOCK
      ?AUTO_3171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3168 ?AUTO_3169 ) ) ( ON ?AUTO_3168 ?AUTO_3173 ) ( not ( = ?AUTO_3168 ?AUTO_3173 ) ) ( not ( = ?AUTO_3169 ?AUTO_3173 ) ) ( not ( = ?AUTO_3168 ?AUTO_3170 ) ) ( not ( = ?AUTO_3168 ?AUTO_3172 ) ) ( not ( = ?AUTO_3169 ?AUTO_3170 ) ) ( not ( = ?AUTO_3169 ?AUTO_3172 ) ) ( not ( = ?AUTO_3173 ?AUTO_3170 ) ) ( not ( = ?AUTO_3173 ?AUTO_3172 ) ) ( not ( = ?AUTO_3170 ?AUTO_3172 ) ) ( ON ?AUTO_3170 ?AUTO_3168 ) ( not ( = ?AUTO_3168 ?AUTO_3174 ) ) ( not ( = ?AUTO_3169 ?AUTO_3174 ) ) ( not ( = ?AUTO_3173 ?AUTO_3174 ) ) ( not ( = ?AUTO_3172 ?AUTO_3174 ) ) ( not ( = ?AUTO_3170 ?AUTO_3174 ) ) ( ON ?AUTO_3174 ?AUTO_3169 ) ( CLEAR ?AUTO_3174 ) ( not ( = ?AUTO_3168 ?AUTO_3171 ) ) ( not ( = ?AUTO_3169 ?AUTO_3171 ) ) ( not ( = ?AUTO_3173 ?AUTO_3171 ) ) ( not ( = ?AUTO_3172 ?AUTO_3171 ) ) ( not ( = ?AUTO_3170 ?AUTO_3171 ) ) ( not ( = ?AUTO_3174 ?AUTO_3171 ) ) ( ON ?AUTO_3171 ?AUTO_3170 ) ( CLEAR ?AUTO_3171 ) ( HOLDING ?AUTO_3172 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3172 )
      ( MAKE-ON ?AUTO_3168 ?AUTO_3169 )
      ( MAKE-ON-VERIFY ?AUTO_3168 ?AUTO_3169 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3175 - BLOCK
      ?AUTO_3176 - BLOCK
    )
    :vars
    (
      ?AUTO_3179 - BLOCK
      ?AUTO_3177 - BLOCK
      ?AUTO_3181 - BLOCK
      ?AUTO_3178 - BLOCK
      ?AUTO_3180 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3175 ?AUTO_3176 ) ) ( ON ?AUTO_3175 ?AUTO_3179 ) ( not ( = ?AUTO_3175 ?AUTO_3179 ) ) ( not ( = ?AUTO_3176 ?AUTO_3179 ) ) ( not ( = ?AUTO_3175 ?AUTO_3177 ) ) ( not ( = ?AUTO_3175 ?AUTO_3181 ) ) ( not ( = ?AUTO_3176 ?AUTO_3177 ) ) ( not ( = ?AUTO_3176 ?AUTO_3181 ) ) ( not ( = ?AUTO_3179 ?AUTO_3177 ) ) ( not ( = ?AUTO_3179 ?AUTO_3181 ) ) ( not ( = ?AUTO_3177 ?AUTO_3181 ) ) ( ON ?AUTO_3177 ?AUTO_3175 ) ( not ( = ?AUTO_3175 ?AUTO_3178 ) ) ( not ( = ?AUTO_3176 ?AUTO_3178 ) ) ( not ( = ?AUTO_3179 ?AUTO_3178 ) ) ( not ( = ?AUTO_3181 ?AUTO_3178 ) ) ( not ( = ?AUTO_3177 ?AUTO_3178 ) ) ( ON ?AUTO_3178 ?AUTO_3176 ) ( not ( = ?AUTO_3175 ?AUTO_3180 ) ) ( not ( = ?AUTO_3176 ?AUTO_3180 ) ) ( not ( = ?AUTO_3179 ?AUTO_3180 ) ) ( not ( = ?AUTO_3181 ?AUTO_3180 ) ) ( not ( = ?AUTO_3177 ?AUTO_3180 ) ) ( not ( = ?AUTO_3178 ?AUTO_3180 ) ) ( ON ?AUTO_3180 ?AUTO_3177 ) ( CLEAR ?AUTO_3180 ) ( ON ?AUTO_3181 ?AUTO_3178 ) ( CLEAR ?AUTO_3181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3181 ?AUTO_3178 )
      ( MAKE-ON ?AUTO_3175 ?AUTO_3176 )
      ( MAKE-ON-VERIFY ?AUTO_3175 ?AUTO_3176 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3183 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3183 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3183 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3183 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3184 - BLOCK
    )
    :vars
    (
      ?AUTO_3185 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3184 ?AUTO_3185 ) ( CLEAR ?AUTO_3184 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3184 ?AUTO_3185 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3184 ?AUTO_3185 )
      ( MAKE-ON-TABLE ?AUTO_3184 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3184 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3187 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3187 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3187 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3187 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3188 - BLOCK
    )
    :vars
    (
      ?AUTO_3189 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3188 ?AUTO_3189 ) ( CLEAR ?AUTO_3188 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3188 ?AUTO_3189 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3188 ?AUTO_3189 )
      ( MAKE-ON-TABLE ?AUTO_3188 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3188 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3190 - BLOCK
    )
    :vars
    (
      ?AUTO_3191 - BLOCK
      ?AUTO_3192 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3190 ?AUTO_3191 ) ( CLEAR ?AUTO_3190 ) ( not ( = ?AUTO_3190 ?AUTO_3191 ) ) ( HOLDING ?AUTO_3192 ) ( not ( = ?AUTO_3190 ?AUTO_3192 ) ) ( not ( = ?AUTO_3191 ?AUTO_3192 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3192 )
      ( MAKE-ON-TABLE ?AUTO_3190 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3190 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3193 - BLOCK
    )
    :vars
    (
      ?AUTO_3194 - BLOCK
      ?AUTO_3195 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3193 ?AUTO_3194 ) ( not ( = ?AUTO_3193 ?AUTO_3194 ) ) ( not ( = ?AUTO_3193 ?AUTO_3195 ) ) ( not ( = ?AUTO_3194 ?AUTO_3195 ) ) ( ON ?AUTO_3195 ?AUTO_3193 ) ( CLEAR ?AUTO_3195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3195 ?AUTO_3193 )
      ( MAKE-ON-TABLE ?AUTO_3193 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3193 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3197 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3197 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3197 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3197 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3198 - BLOCK
    )
    :vars
    (
      ?AUTO_3199 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3198 ?AUTO_3199 ) ( CLEAR ?AUTO_3198 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3198 ?AUTO_3199 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3198 ?AUTO_3199 )
      ( MAKE-ON-TABLE ?AUTO_3198 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3198 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3200 - BLOCK
    )
    :vars
    (
      ?AUTO_3201 - BLOCK
      ?AUTO_3202 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3200 ?AUTO_3201 ) ( CLEAR ?AUTO_3200 ) ( not ( = ?AUTO_3200 ?AUTO_3201 ) ) ( HOLDING ?AUTO_3202 ) ( not ( = ?AUTO_3200 ?AUTO_3202 ) ) ( not ( = ?AUTO_3201 ?AUTO_3202 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3202 )
      ( MAKE-ON-TABLE ?AUTO_3200 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3200 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3203 - BLOCK
    )
    :vars
    (
      ?AUTO_3204 - BLOCK
      ?AUTO_3205 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3203 ?AUTO_3204 ) ( not ( = ?AUTO_3203 ?AUTO_3204 ) ) ( not ( = ?AUTO_3203 ?AUTO_3205 ) ) ( not ( = ?AUTO_3204 ?AUTO_3205 ) ) ( ON ?AUTO_3205 ?AUTO_3203 ) ( CLEAR ?AUTO_3205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3205 ?AUTO_3203 )
      ( MAKE-ON-TABLE ?AUTO_3203 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3203 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3206 - BLOCK
    )
    :vars
    (
      ?AUTO_3207 - BLOCK
      ?AUTO_3208 - BLOCK
      ?AUTO_3209 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3206 ?AUTO_3207 ) ( not ( = ?AUTO_3206 ?AUTO_3207 ) ) ( not ( = ?AUTO_3206 ?AUTO_3208 ) ) ( not ( = ?AUTO_3207 ?AUTO_3208 ) ) ( ON ?AUTO_3208 ?AUTO_3206 ) ( CLEAR ?AUTO_3208 ) ( HOLDING ?AUTO_3209 ) ( not ( = ?AUTO_3206 ?AUTO_3209 ) ) ( not ( = ?AUTO_3207 ?AUTO_3209 ) ) ( not ( = ?AUTO_3208 ?AUTO_3209 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3209 )
      ( MAKE-ON-TABLE ?AUTO_3206 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3206 ) )
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
      ?AUTO_3213 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3210 ?AUTO_3211 ) ( not ( = ?AUTO_3210 ?AUTO_3211 ) ) ( not ( = ?AUTO_3210 ?AUTO_3212 ) ) ( not ( = ?AUTO_3211 ?AUTO_3212 ) ) ( ON ?AUTO_3212 ?AUTO_3210 ) ( not ( = ?AUTO_3210 ?AUTO_3213 ) ) ( not ( = ?AUTO_3211 ?AUTO_3213 ) ) ( not ( = ?AUTO_3212 ?AUTO_3213 ) ) ( ON ?AUTO_3213 ?AUTO_3212 ) ( CLEAR ?AUTO_3213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3213 ?AUTO_3212 )
      ( MAKE-ON-TABLE ?AUTO_3210 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3210 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3215 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3215 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3215 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3215 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3216 - BLOCK
    )
    :vars
    (
      ?AUTO_3217 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3216 ?AUTO_3217 ) ( CLEAR ?AUTO_3216 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3216 ?AUTO_3217 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3216 ?AUTO_3217 )
      ( MAKE-ON-TABLE ?AUTO_3216 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3216 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3218 - BLOCK
    )
    :vars
    (
      ?AUTO_3219 - BLOCK
      ?AUTO_3220 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3218 ?AUTO_3219 ) ( CLEAR ?AUTO_3218 ) ( not ( = ?AUTO_3218 ?AUTO_3219 ) ) ( HOLDING ?AUTO_3220 ) ( not ( = ?AUTO_3218 ?AUTO_3220 ) ) ( not ( = ?AUTO_3219 ?AUTO_3220 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3220 )
      ( MAKE-ON-TABLE ?AUTO_3218 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3218 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3221 - BLOCK
    )
    :vars
    (
      ?AUTO_3222 - BLOCK
      ?AUTO_3223 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3221 ?AUTO_3222 ) ( not ( = ?AUTO_3221 ?AUTO_3222 ) ) ( not ( = ?AUTO_3221 ?AUTO_3223 ) ) ( not ( = ?AUTO_3222 ?AUTO_3223 ) ) ( ON ?AUTO_3223 ?AUTO_3221 ) ( CLEAR ?AUTO_3223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3223 ?AUTO_3221 )
      ( MAKE-ON-TABLE ?AUTO_3221 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3221 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3224 - BLOCK
    )
    :vars
    (
      ?AUTO_3226 - BLOCK
      ?AUTO_3225 - BLOCK
      ?AUTO_3227 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3224 ?AUTO_3226 ) ( not ( = ?AUTO_3224 ?AUTO_3226 ) ) ( not ( = ?AUTO_3224 ?AUTO_3225 ) ) ( not ( = ?AUTO_3226 ?AUTO_3225 ) ) ( ON ?AUTO_3225 ?AUTO_3224 ) ( CLEAR ?AUTO_3225 ) ( HOLDING ?AUTO_3227 ) ( not ( = ?AUTO_3224 ?AUTO_3227 ) ) ( not ( = ?AUTO_3226 ?AUTO_3227 ) ) ( not ( = ?AUTO_3225 ?AUTO_3227 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3227 )
      ( MAKE-ON-TABLE ?AUTO_3224 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3224 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3228 - BLOCK
    )
    :vars
    (
      ?AUTO_3230 - BLOCK
      ?AUTO_3229 - BLOCK
      ?AUTO_3231 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3228 ?AUTO_3230 ) ( not ( = ?AUTO_3228 ?AUTO_3230 ) ) ( not ( = ?AUTO_3228 ?AUTO_3229 ) ) ( not ( = ?AUTO_3230 ?AUTO_3229 ) ) ( ON ?AUTO_3229 ?AUTO_3228 ) ( not ( = ?AUTO_3228 ?AUTO_3231 ) ) ( not ( = ?AUTO_3230 ?AUTO_3231 ) ) ( not ( = ?AUTO_3229 ?AUTO_3231 ) ) ( ON ?AUTO_3231 ?AUTO_3229 ) ( CLEAR ?AUTO_3231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3231 ?AUTO_3229 )
      ( MAKE-ON-TABLE ?AUTO_3228 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3228 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3232 - BLOCK
    )
    :vars
    (
      ?AUTO_3233 - BLOCK
      ?AUTO_3235 - BLOCK
      ?AUTO_3234 - BLOCK
      ?AUTO_3236 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3232 ?AUTO_3233 ) ( not ( = ?AUTO_3232 ?AUTO_3233 ) ) ( not ( = ?AUTO_3232 ?AUTO_3235 ) ) ( not ( = ?AUTO_3233 ?AUTO_3235 ) ) ( ON ?AUTO_3235 ?AUTO_3232 ) ( not ( = ?AUTO_3232 ?AUTO_3234 ) ) ( not ( = ?AUTO_3233 ?AUTO_3234 ) ) ( not ( = ?AUTO_3235 ?AUTO_3234 ) ) ( ON ?AUTO_3234 ?AUTO_3235 ) ( CLEAR ?AUTO_3234 ) ( HOLDING ?AUTO_3236 ) ( not ( = ?AUTO_3232 ?AUTO_3236 ) ) ( not ( = ?AUTO_3233 ?AUTO_3236 ) ) ( not ( = ?AUTO_3235 ?AUTO_3236 ) ) ( not ( = ?AUTO_3234 ?AUTO_3236 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3236 )
      ( MAKE-ON-TABLE ?AUTO_3232 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3232 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3237 - BLOCK
    )
    :vars
    (
      ?AUTO_3240 - BLOCK
      ?AUTO_3239 - BLOCK
      ?AUTO_3238 - BLOCK
      ?AUTO_3241 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3237 ?AUTO_3240 ) ( not ( = ?AUTO_3237 ?AUTO_3240 ) ) ( not ( = ?AUTO_3237 ?AUTO_3239 ) ) ( not ( = ?AUTO_3240 ?AUTO_3239 ) ) ( ON ?AUTO_3239 ?AUTO_3237 ) ( not ( = ?AUTO_3237 ?AUTO_3238 ) ) ( not ( = ?AUTO_3240 ?AUTO_3238 ) ) ( not ( = ?AUTO_3239 ?AUTO_3238 ) ) ( ON ?AUTO_3238 ?AUTO_3239 ) ( not ( = ?AUTO_3237 ?AUTO_3241 ) ) ( not ( = ?AUTO_3240 ?AUTO_3241 ) ) ( not ( = ?AUTO_3239 ?AUTO_3241 ) ) ( not ( = ?AUTO_3238 ?AUTO_3241 ) ) ( ON ?AUTO_3241 ?AUTO_3238 ) ( CLEAR ?AUTO_3241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3241 ?AUTO_3238 )
      ( MAKE-ON-TABLE ?AUTO_3237 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3237 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3244 - BLOCK
      ?AUTO_3245 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3244 ) ( CLEAR ?AUTO_3245 ) ( not ( = ?AUTO_3244 ?AUTO_3245 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3244 ?AUTO_3245 )
      ( MAKE-ON-VERIFY ?AUTO_3244 ?AUTO_3245 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3246 - BLOCK
      ?AUTO_3247 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3247 ) ( not ( = ?AUTO_3246 ?AUTO_3247 ) ) ( ON-TABLE ?AUTO_3246 ) ( CLEAR ?AUTO_3246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3246 )
      ( MAKE-ON ?AUTO_3246 ?AUTO_3247 )
      ( MAKE-ON-VERIFY ?AUTO_3246 ?AUTO_3247 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3248 - BLOCK
      ?AUTO_3249 - BLOCK
    )
    :vars
    (
      ?AUTO_3250 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3249 ) ( not ( = ?AUTO_3248 ?AUTO_3249 ) ) ( ON-TABLE ?AUTO_3248 ) ( CLEAR ?AUTO_3248 ) ( HOLDING ?AUTO_3250 ) ( not ( = ?AUTO_3248 ?AUTO_3250 ) ) ( not ( = ?AUTO_3249 ?AUTO_3250 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3250 )
      ( MAKE-ON ?AUTO_3248 ?AUTO_3249 )
      ( MAKE-ON-VERIFY ?AUTO_3248 ?AUTO_3249 ) )
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
    )
    :precondition
    ( and ( not ( = ?AUTO_3251 ?AUTO_3252 ) ) ( ON-TABLE ?AUTO_3251 ) ( CLEAR ?AUTO_3251 ) ( not ( = ?AUTO_3251 ?AUTO_3253 ) ) ( not ( = ?AUTO_3252 ?AUTO_3253 ) ) ( ON ?AUTO_3253 ?AUTO_3252 ) ( CLEAR ?AUTO_3253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3253 ?AUTO_3252 )
      ( MAKE-ON ?AUTO_3251 ?AUTO_3252 )
      ( MAKE-ON-VERIFY ?AUTO_3251 ?AUTO_3252 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3254 - BLOCK
      ?AUTO_3255 - BLOCK
    )
    :vars
    (
      ?AUTO_3256 - BLOCK
      ?AUTO_3257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3254 ?AUTO_3255 ) ) ( ON-TABLE ?AUTO_3254 ) ( CLEAR ?AUTO_3254 ) ( not ( = ?AUTO_3254 ?AUTO_3256 ) ) ( not ( = ?AUTO_3255 ?AUTO_3256 ) ) ( ON ?AUTO_3256 ?AUTO_3255 ) ( CLEAR ?AUTO_3256 ) ( HOLDING ?AUTO_3257 ) ( not ( = ?AUTO_3254 ?AUTO_3257 ) ) ( not ( = ?AUTO_3255 ?AUTO_3257 ) ) ( not ( = ?AUTO_3256 ?AUTO_3257 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3257 )
      ( MAKE-ON ?AUTO_3254 ?AUTO_3255 )
      ( MAKE-ON-VERIFY ?AUTO_3254 ?AUTO_3255 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3258 - BLOCK
      ?AUTO_3259 - BLOCK
    )
    :vars
    (
      ?AUTO_3260 - BLOCK
      ?AUTO_3261 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3258 ?AUTO_3259 ) ) ( ON-TABLE ?AUTO_3258 ) ( CLEAR ?AUTO_3258 ) ( not ( = ?AUTO_3258 ?AUTO_3260 ) ) ( not ( = ?AUTO_3259 ?AUTO_3260 ) ) ( ON ?AUTO_3260 ?AUTO_3259 ) ( not ( = ?AUTO_3258 ?AUTO_3261 ) ) ( not ( = ?AUTO_3259 ?AUTO_3261 ) ) ( not ( = ?AUTO_3260 ?AUTO_3261 ) ) ( ON ?AUTO_3261 ?AUTO_3260 ) ( CLEAR ?AUTO_3261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3261 ?AUTO_3260 )
      ( MAKE-ON ?AUTO_3258 ?AUTO_3259 )
      ( MAKE-ON-VERIFY ?AUTO_3258 ?AUTO_3259 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3262 - BLOCK
      ?AUTO_3263 - BLOCK
    )
    :vars
    (
      ?AUTO_3264 - BLOCK
      ?AUTO_3265 - BLOCK
      ?AUTO_3266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3262 ?AUTO_3263 ) ) ( ON-TABLE ?AUTO_3262 ) ( CLEAR ?AUTO_3262 ) ( not ( = ?AUTO_3262 ?AUTO_3264 ) ) ( not ( = ?AUTO_3263 ?AUTO_3264 ) ) ( ON ?AUTO_3264 ?AUTO_3263 ) ( not ( = ?AUTO_3262 ?AUTO_3265 ) ) ( not ( = ?AUTO_3263 ?AUTO_3265 ) ) ( not ( = ?AUTO_3264 ?AUTO_3265 ) ) ( ON ?AUTO_3265 ?AUTO_3264 ) ( CLEAR ?AUTO_3265 ) ( HOLDING ?AUTO_3266 ) ( not ( = ?AUTO_3262 ?AUTO_3266 ) ) ( not ( = ?AUTO_3263 ?AUTO_3266 ) ) ( not ( = ?AUTO_3264 ?AUTO_3266 ) ) ( not ( = ?AUTO_3265 ?AUTO_3266 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3266 )
      ( MAKE-ON ?AUTO_3262 ?AUTO_3263 )
      ( MAKE-ON-VERIFY ?AUTO_3262 ?AUTO_3263 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3267 - BLOCK
      ?AUTO_3268 - BLOCK
    )
    :vars
    (
      ?AUTO_3270 - BLOCK
      ?AUTO_3271 - BLOCK
      ?AUTO_3269 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3267 ?AUTO_3268 ) ) ( ON-TABLE ?AUTO_3267 ) ( CLEAR ?AUTO_3267 ) ( not ( = ?AUTO_3267 ?AUTO_3270 ) ) ( not ( = ?AUTO_3268 ?AUTO_3270 ) ) ( ON ?AUTO_3270 ?AUTO_3268 ) ( not ( = ?AUTO_3267 ?AUTO_3271 ) ) ( not ( = ?AUTO_3268 ?AUTO_3271 ) ) ( not ( = ?AUTO_3270 ?AUTO_3271 ) ) ( ON ?AUTO_3271 ?AUTO_3270 ) ( not ( = ?AUTO_3267 ?AUTO_3269 ) ) ( not ( = ?AUTO_3268 ?AUTO_3269 ) ) ( not ( = ?AUTO_3270 ?AUTO_3269 ) ) ( not ( = ?AUTO_3271 ?AUTO_3269 ) ) ( ON ?AUTO_3269 ?AUTO_3271 ) ( CLEAR ?AUTO_3269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3269 ?AUTO_3271 )
      ( MAKE-ON ?AUTO_3267 ?AUTO_3268 )
      ( MAKE-ON-VERIFY ?AUTO_3267 ?AUTO_3268 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3272 - BLOCK
      ?AUTO_3273 - BLOCK
    )
    :vars
    (
      ?AUTO_3275 - BLOCK
      ?AUTO_3276 - BLOCK
      ?AUTO_3274 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3272 ?AUTO_3273 ) ) ( not ( = ?AUTO_3272 ?AUTO_3275 ) ) ( not ( = ?AUTO_3273 ?AUTO_3275 ) ) ( ON ?AUTO_3275 ?AUTO_3273 ) ( not ( = ?AUTO_3272 ?AUTO_3276 ) ) ( not ( = ?AUTO_3273 ?AUTO_3276 ) ) ( not ( = ?AUTO_3275 ?AUTO_3276 ) ) ( ON ?AUTO_3276 ?AUTO_3275 ) ( not ( = ?AUTO_3272 ?AUTO_3274 ) ) ( not ( = ?AUTO_3273 ?AUTO_3274 ) ) ( not ( = ?AUTO_3275 ?AUTO_3274 ) ) ( not ( = ?AUTO_3276 ?AUTO_3274 ) ) ( ON ?AUTO_3274 ?AUTO_3276 ) ( CLEAR ?AUTO_3274 ) ( HOLDING ?AUTO_3272 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3272 )
      ( MAKE-ON ?AUTO_3272 ?AUTO_3273 )
      ( MAKE-ON-VERIFY ?AUTO_3272 ?AUTO_3273 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3277 - BLOCK
      ?AUTO_3278 - BLOCK
    )
    :vars
    (
      ?AUTO_3279 - BLOCK
      ?AUTO_3281 - BLOCK
      ?AUTO_3280 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3277 ?AUTO_3278 ) ) ( not ( = ?AUTO_3277 ?AUTO_3279 ) ) ( not ( = ?AUTO_3278 ?AUTO_3279 ) ) ( ON ?AUTO_3279 ?AUTO_3278 ) ( not ( = ?AUTO_3277 ?AUTO_3281 ) ) ( not ( = ?AUTO_3278 ?AUTO_3281 ) ) ( not ( = ?AUTO_3279 ?AUTO_3281 ) ) ( ON ?AUTO_3281 ?AUTO_3279 ) ( not ( = ?AUTO_3277 ?AUTO_3280 ) ) ( not ( = ?AUTO_3278 ?AUTO_3280 ) ) ( not ( = ?AUTO_3279 ?AUTO_3280 ) ) ( not ( = ?AUTO_3281 ?AUTO_3280 ) ) ( ON ?AUTO_3280 ?AUTO_3281 ) ( ON ?AUTO_3277 ?AUTO_3280 ) ( CLEAR ?AUTO_3277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3277 ?AUTO_3280 )
      ( MAKE-ON ?AUTO_3277 ?AUTO_3278 )
      ( MAKE-ON-VERIFY ?AUTO_3277 ?AUTO_3278 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3283 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3283 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3283 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3283 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3284 - BLOCK
    )
    :vars
    (
      ?AUTO_3285 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3284 ?AUTO_3285 ) ( CLEAR ?AUTO_3284 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3284 ?AUTO_3285 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3284 ?AUTO_3285 )
      ( MAKE-ON-TABLE ?AUTO_3284 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3284 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3287 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3287 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3287 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3287 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3288 - BLOCK
    )
    :vars
    (
      ?AUTO_3289 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3288 ?AUTO_3289 ) ( CLEAR ?AUTO_3288 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3288 ?AUTO_3289 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3288 ?AUTO_3289 )
      ( MAKE-ON-TABLE ?AUTO_3288 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3288 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3290 - BLOCK
    )
    :vars
    (
      ?AUTO_3291 - BLOCK
      ?AUTO_3292 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3290 ?AUTO_3291 ) ( CLEAR ?AUTO_3290 ) ( not ( = ?AUTO_3290 ?AUTO_3291 ) ) ( HOLDING ?AUTO_3292 ) ( not ( = ?AUTO_3290 ?AUTO_3292 ) ) ( not ( = ?AUTO_3291 ?AUTO_3292 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3292 )
      ( MAKE-ON-TABLE ?AUTO_3290 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3290 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3293 - BLOCK
    )
    :vars
    (
      ?AUTO_3294 - BLOCK
      ?AUTO_3295 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3293 ?AUTO_3294 ) ( not ( = ?AUTO_3293 ?AUTO_3294 ) ) ( not ( = ?AUTO_3293 ?AUTO_3295 ) ) ( not ( = ?AUTO_3294 ?AUTO_3295 ) ) ( ON ?AUTO_3295 ?AUTO_3293 ) ( CLEAR ?AUTO_3295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3295 ?AUTO_3293 )
      ( MAKE-ON-TABLE ?AUTO_3293 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3293 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3297 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3297 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3297 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3297 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3298 - BLOCK
    )
    :vars
    (
      ?AUTO_3299 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3298 ?AUTO_3299 ) ( CLEAR ?AUTO_3298 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3298 ?AUTO_3299 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3298 ?AUTO_3299 )
      ( MAKE-ON-TABLE ?AUTO_3298 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3298 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3300 - BLOCK
    )
    :vars
    (
      ?AUTO_3301 - BLOCK
      ?AUTO_3302 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3300 ?AUTO_3301 ) ( CLEAR ?AUTO_3300 ) ( not ( = ?AUTO_3300 ?AUTO_3301 ) ) ( HOLDING ?AUTO_3302 ) ( not ( = ?AUTO_3300 ?AUTO_3302 ) ) ( not ( = ?AUTO_3301 ?AUTO_3302 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3302 )
      ( MAKE-ON-TABLE ?AUTO_3300 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3300 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3303 - BLOCK
    )
    :vars
    (
      ?AUTO_3304 - BLOCK
      ?AUTO_3305 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3303 ?AUTO_3304 ) ( not ( = ?AUTO_3303 ?AUTO_3304 ) ) ( not ( = ?AUTO_3303 ?AUTO_3305 ) ) ( not ( = ?AUTO_3304 ?AUTO_3305 ) ) ( ON ?AUTO_3305 ?AUTO_3303 ) ( CLEAR ?AUTO_3305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3305 ?AUTO_3303 )
      ( MAKE-ON-TABLE ?AUTO_3303 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3303 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3306 - BLOCK
    )
    :vars
    (
      ?AUTO_3307 - BLOCK
      ?AUTO_3308 - BLOCK
      ?AUTO_3309 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3306 ?AUTO_3307 ) ( not ( = ?AUTO_3306 ?AUTO_3307 ) ) ( not ( = ?AUTO_3306 ?AUTO_3308 ) ) ( not ( = ?AUTO_3307 ?AUTO_3308 ) ) ( ON ?AUTO_3308 ?AUTO_3306 ) ( CLEAR ?AUTO_3308 ) ( HOLDING ?AUTO_3309 ) ( not ( = ?AUTO_3306 ?AUTO_3309 ) ) ( not ( = ?AUTO_3307 ?AUTO_3309 ) ) ( not ( = ?AUTO_3308 ?AUTO_3309 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3309 )
      ( MAKE-ON-TABLE ?AUTO_3306 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3306 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3310 - BLOCK
    )
    :vars
    (
      ?AUTO_3311 - BLOCK
      ?AUTO_3312 - BLOCK
      ?AUTO_3313 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3310 ?AUTO_3311 ) ( not ( = ?AUTO_3310 ?AUTO_3311 ) ) ( not ( = ?AUTO_3310 ?AUTO_3312 ) ) ( not ( = ?AUTO_3311 ?AUTO_3312 ) ) ( ON ?AUTO_3312 ?AUTO_3310 ) ( not ( = ?AUTO_3310 ?AUTO_3313 ) ) ( not ( = ?AUTO_3311 ?AUTO_3313 ) ) ( not ( = ?AUTO_3312 ?AUTO_3313 ) ) ( ON ?AUTO_3313 ?AUTO_3312 ) ( CLEAR ?AUTO_3313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3313 ?AUTO_3312 )
      ( MAKE-ON-TABLE ?AUTO_3310 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3310 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3316 - BLOCK
      ?AUTO_3317 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3316 ) ( CLEAR ?AUTO_3317 ) ( not ( = ?AUTO_3316 ?AUTO_3317 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3316 ?AUTO_3317 )
      ( MAKE-ON-VERIFY ?AUTO_3316 ?AUTO_3317 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3318 - BLOCK
      ?AUTO_3319 - BLOCK
    )
    :vars
    (
      ?AUTO_3320 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3319 ) ( not ( = ?AUTO_3318 ?AUTO_3319 ) ) ( ON ?AUTO_3318 ?AUTO_3320 ) ( CLEAR ?AUTO_3318 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3318 ?AUTO_3320 ) ) ( not ( = ?AUTO_3319 ?AUTO_3320 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3318 ?AUTO_3320 )
      ( MAKE-ON ?AUTO_3318 ?AUTO_3319 )
      ( MAKE-ON-VERIFY ?AUTO_3318 ?AUTO_3319 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3321 - BLOCK
      ?AUTO_3322 - BLOCK
    )
    :vars
    (
      ?AUTO_3323 - BLOCK
      ?AUTO_3324 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3322 ) ( not ( = ?AUTO_3321 ?AUTO_3322 ) ) ( ON ?AUTO_3321 ?AUTO_3323 ) ( CLEAR ?AUTO_3321 ) ( not ( = ?AUTO_3321 ?AUTO_3323 ) ) ( not ( = ?AUTO_3322 ?AUTO_3323 ) ) ( HOLDING ?AUTO_3324 ) ( not ( = ?AUTO_3321 ?AUTO_3324 ) ) ( not ( = ?AUTO_3322 ?AUTO_3324 ) ) ( not ( = ?AUTO_3323 ?AUTO_3324 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3324 )
      ( MAKE-ON ?AUTO_3321 ?AUTO_3322 )
      ( MAKE-ON-VERIFY ?AUTO_3321 ?AUTO_3322 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3325 - BLOCK
      ?AUTO_3326 - BLOCK
    )
    :vars
    (
      ?AUTO_3327 - BLOCK
      ?AUTO_3328 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3326 ) ( not ( = ?AUTO_3325 ?AUTO_3326 ) ) ( ON ?AUTO_3325 ?AUTO_3327 ) ( not ( = ?AUTO_3325 ?AUTO_3327 ) ) ( not ( = ?AUTO_3326 ?AUTO_3327 ) ) ( not ( = ?AUTO_3325 ?AUTO_3328 ) ) ( not ( = ?AUTO_3326 ?AUTO_3328 ) ) ( not ( = ?AUTO_3327 ?AUTO_3328 ) ) ( ON ?AUTO_3328 ?AUTO_3325 ) ( CLEAR ?AUTO_3328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3328 ?AUTO_3325 )
      ( MAKE-ON ?AUTO_3325 ?AUTO_3326 )
      ( MAKE-ON-VERIFY ?AUTO_3325 ?AUTO_3326 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3329 - BLOCK
      ?AUTO_3330 - BLOCK
    )
    :vars
    (
      ?AUTO_3331 - BLOCK
      ?AUTO_3332 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3329 ?AUTO_3330 ) ) ( ON ?AUTO_3329 ?AUTO_3331 ) ( not ( = ?AUTO_3329 ?AUTO_3331 ) ) ( not ( = ?AUTO_3330 ?AUTO_3331 ) ) ( not ( = ?AUTO_3329 ?AUTO_3332 ) ) ( not ( = ?AUTO_3330 ?AUTO_3332 ) ) ( not ( = ?AUTO_3331 ?AUTO_3332 ) ) ( ON ?AUTO_3332 ?AUTO_3329 ) ( CLEAR ?AUTO_3332 ) ( HOLDING ?AUTO_3330 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3330 )
      ( MAKE-ON ?AUTO_3329 ?AUTO_3330 )
      ( MAKE-ON-VERIFY ?AUTO_3329 ?AUTO_3330 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3333 - BLOCK
      ?AUTO_3334 - BLOCK
    )
    :vars
    (
      ?AUTO_3336 - BLOCK
      ?AUTO_3335 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3333 ?AUTO_3334 ) ) ( ON ?AUTO_3333 ?AUTO_3336 ) ( not ( = ?AUTO_3333 ?AUTO_3336 ) ) ( not ( = ?AUTO_3334 ?AUTO_3336 ) ) ( not ( = ?AUTO_3333 ?AUTO_3335 ) ) ( not ( = ?AUTO_3334 ?AUTO_3335 ) ) ( not ( = ?AUTO_3336 ?AUTO_3335 ) ) ( ON ?AUTO_3335 ?AUTO_3333 ) ( ON ?AUTO_3334 ?AUTO_3335 ) ( CLEAR ?AUTO_3334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3334 ?AUTO_3335 )
      ( MAKE-ON ?AUTO_3333 ?AUTO_3334 )
      ( MAKE-ON-VERIFY ?AUTO_3333 ?AUTO_3334 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3337 - BLOCK
      ?AUTO_3338 - BLOCK
    )
    :vars
    (
      ?AUTO_3339 - BLOCK
      ?AUTO_3340 - BLOCK
      ?AUTO_3341 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3337 ?AUTO_3338 ) ) ( ON ?AUTO_3337 ?AUTO_3339 ) ( not ( = ?AUTO_3337 ?AUTO_3339 ) ) ( not ( = ?AUTO_3338 ?AUTO_3339 ) ) ( not ( = ?AUTO_3337 ?AUTO_3340 ) ) ( not ( = ?AUTO_3338 ?AUTO_3340 ) ) ( not ( = ?AUTO_3339 ?AUTO_3340 ) ) ( ON ?AUTO_3340 ?AUTO_3337 ) ( ON ?AUTO_3338 ?AUTO_3340 ) ( CLEAR ?AUTO_3338 ) ( HOLDING ?AUTO_3341 ) ( not ( = ?AUTO_3337 ?AUTO_3341 ) ) ( not ( = ?AUTO_3338 ?AUTO_3341 ) ) ( not ( = ?AUTO_3339 ?AUTO_3341 ) ) ( not ( = ?AUTO_3340 ?AUTO_3341 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3341 )
      ( MAKE-ON ?AUTO_3337 ?AUTO_3338 )
      ( MAKE-ON-VERIFY ?AUTO_3337 ?AUTO_3338 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3342 - BLOCK
      ?AUTO_3343 - BLOCK
    )
    :vars
    (
      ?AUTO_3345 - BLOCK
      ?AUTO_3344 - BLOCK
      ?AUTO_3346 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3342 ?AUTO_3343 ) ) ( ON ?AUTO_3342 ?AUTO_3345 ) ( not ( = ?AUTO_3342 ?AUTO_3345 ) ) ( not ( = ?AUTO_3343 ?AUTO_3345 ) ) ( not ( = ?AUTO_3342 ?AUTO_3344 ) ) ( not ( = ?AUTO_3343 ?AUTO_3344 ) ) ( not ( = ?AUTO_3345 ?AUTO_3344 ) ) ( ON ?AUTO_3344 ?AUTO_3342 ) ( ON ?AUTO_3343 ?AUTO_3344 ) ( not ( = ?AUTO_3342 ?AUTO_3346 ) ) ( not ( = ?AUTO_3343 ?AUTO_3346 ) ) ( not ( = ?AUTO_3345 ?AUTO_3346 ) ) ( not ( = ?AUTO_3344 ?AUTO_3346 ) ) ( ON ?AUTO_3346 ?AUTO_3343 ) ( CLEAR ?AUTO_3346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3346 ?AUTO_3343 )
      ( MAKE-ON ?AUTO_3342 ?AUTO_3343 )
      ( MAKE-ON-VERIFY ?AUTO_3342 ?AUTO_3343 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3349 - BLOCK
      ?AUTO_3350 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3349 ) ( CLEAR ?AUTO_3350 ) ( not ( = ?AUTO_3349 ?AUTO_3350 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3349 ?AUTO_3350 )
      ( MAKE-ON-VERIFY ?AUTO_3349 ?AUTO_3350 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3351 - BLOCK
      ?AUTO_3352 - BLOCK
    )
    :vars
    (
      ?AUTO_3353 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3352 ) ( not ( = ?AUTO_3351 ?AUTO_3352 ) ) ( ON ?AUTO_3351 ?AUTO_3353 ) ( CLEAR ?AUTO_3351 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3351 ?AUTO_3353 ) ) ( not ( = ?AUTO_3352 ?AUTO_3353 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3351 ?AUTO_3353 )
      ( MAKE-ON ?AUTO_3351 ?AUTO_3352 )
      ( MAKE-ON-VERIFY ?AUTO_3351 ?AUTO_3352 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3354 - BLOCK
      ?AUTO_3355 - BLOCK
    )
    :vars
    (
      ?AUTO_3356 - BLOCK
      ?AUTO_3357 - BLOCK
      ?AUTO_3358 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3355 ) ( not ( = ?AUTO_3354 ?AUTO_3355 ) ) ( ON ?AUTO_3354 ?AUTO_3356 ) ( CLEAR ?AUTO_3354 ) ( not ( = ?AUTO_3354 ?AUTO_3356 ) ) ( not ( = ?AUTO_3355 ?AUTO_3356 ) ) ( HOLDING ?AUTO_3357 ) ( CLEAR ?AUTO_3358 ) ( not ( = ?AUTO_3354 ?AUTO_3357 ) ) ( not ( = ?AUTO_3354 ?AUTO_3358 ) ) ( not ( = ?AUTO_3355 ?AUTO_3357 ) ) ( not ( = ?AUTO_3355 ?AUTO_3358 ) ) ( not ( = ?AUTO_3356 ?AUTO_3357 ) ) ( not ( = ?AUTO_3356 ?AUTO_3358 ) ) ( not ( = ?AUTO_3357 ?AUTO_3358 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3357 ?AUTO_3358 )
      ( MAKE-ON ?AUTO_3354 ?AUTO_3355 )
      ( MAKE-ON-VERIFY ?AUTO_3354 ?AUTO_3355 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3359 - BLOCK
      ?AUTO_3360 - BLOCK
    )
    :vars
    (
      ?AUTO_3361 - BLOCK
      ?AUTO_3362 - BLOCK
      ?AUTO_3363 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3359 ?AUTO_3360 ) ) ( ON ?AUTO_3359 ?AUTO_3361 ) ( CLEAR ?AUTO_3359 ) ( not ( = ?AUTO_3359 ?AUTO_3361 ) ) ( not ( = ?AUTO_3360 ?AUTO_3361 ) ) ( CLEAR ?AUTO_3362 ) ( not ( = ?AUTO_3359 ?AUTO_3363 ) ) ( not ( = ?AUTO_3359 ?AUTO_3362 ) ) ( not ( = ?AUTO_3360 ?AUTO_3363 ) ) ( not ( = ?AUTO_3360 ?AUTO_3362 ) ) ( not ( = ?AUTO_3361 ?AUTO_3363 ) ) ( not ( = ?AUTO_3361 ?AUTO_3362 ) ) ( not ( = ?AUTO_3363 ?AUTO_3362 ) ) ( ON ?AUTO_3363 ?AUTO_3360 ) ( CLEAR ?AUTO_3363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3363 ?AUTO_3360 )
      ( MAKE-ON ?AUTO_3359 ?AUTO_3360 )
      ( MAKE-ON-VERIFY ?AUTO_3359 ?AUTO_3360 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3364 - BLOCK
      ?AUTO_3365 - BLOCK
    )
    :vars
    (
      ?AUTO_3368 - BLOCK
      ?AUTO_3366 - BLOCK
      ?AUTO_3367 - BLOCK
      ?AUTO_3369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3364 ?AUTO_3365 ) ) ( ON ?AUTO_3364 ?AUTO_3368 ) ( CLEAR ?AUTO_3364 ) ( not ( = ?AUTO_3364 ?AUTO_3368 ) ) ( not ( = ?AUTO_3365 ?AUTO_3368 ) ) ( CLEAR ?AUTO_3366 ) ( not ( = ?AUTO_3364 ?AUTO_3367 ) ) ( not ( = ?AUTO_3364 ?AUTO_3366 ) ) ( not ( = ?AUTO_3365 ?AUTO_3367 ) ) ( not ( = ?AUTO_3365 ?AUTO_3366 ) ) ( not ( = ?AUTO_3368 ?AUTO_3367 ) ) ( not ( = ?AUTO_3368 ?AUTO_3366 ) ) ( not ( = ?AUTO_3367 ?AUTO_3366 ) ) ( ON ?AUTO_3367 ?AUTO_3365 ) ( CLEAR ?AUTO_3367 ) ( HOLDING ?AUTO_3369 ) ( not ( = ?AUTO_3364 ?AUTO_3369 ) ) ( not ( = ?AUTO_3365 ?AUTO_3369 ) ) ( not ( = ?AUTO_3368 ?AUTO_3369 ) ) ( not ( = ?AUTO_3366 ?AUTO_3369 ) ) ( not ( = ?AUTO_3367 ?AUTO_3369 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3369 )
      ( MAKE-ON ?AUTO_3364 ?AUTO_3365 )
      ( MAKE-ON-VERIFY ?AUTO_3364 ?AUTO_3365 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3370 - BLOCK
      ?AUTO_3371 - BLOCK
    )
    :vars
    (
      ?AUTO_3375 - BLOCK
      ?AUTO_3372 - BLOCK
      ?AUTO_3374 - BLOCK
      ?AUTO_3373 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3370 ?AUTO_3371 ) ) ( ON ?AUTO_3370 ?AUTO_3375 ) ( CLEAR ?AUTO_3370 ) ( not ( = ?AUTO_3370 ?AUTO_3375 ) ) ( not ( = ?AUTO_3371 ?AUTO_3375 ) ) ( CLEAR ?AUTO_3372 ) ( not ( = ?AUTO_3370 ?AUTO_3374 ) ) ( not ( = ?AUTO_3370 ?AUTO_3372 ) ) ( not ( = ?AUTO_3371 ?AUTO_3374 ) ) ( not ( = ?AUTO_3371 ?AUTO_3372 ) ) ( not ( = ?AUTO_3375 ?AUTO_3374 ) ) ( not ( = ?AUTO_3375 ?AUTO_3372 ) ) ( not ( = ?AUTO_3374 ?AUTO_3372 ) ) ( ON ?AUTO_3374 ?AUTO_3371 ) ( not ( = ?AUTO_3370 ?AUTO_3373 ) ) ( not ( = ?AUTO_3371 ?AUTO_3373 ) ) ( not ( = ?AUTO_3375 ?AUTO_3373 ) ) ( not ( = ?AUTO_3372 ?AUTO_3373 ) ) ( not ( = ?AUTO_3374 ?AUTO_3373 ) ) ( ON ?AUTO_3373 ?AUTO_3374 ) ( CLEAR ?AUTO_3373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3373 ?AUTO_3374 )
      ( MAKE-ON ?AUTO_3370 ?AUTO_3371 )
      ( MAKE-ON-VERIFY ?AUTO_3370 ?AUTO_3371 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3376 - BLOCK
      ?AUTO_3377 - BLOCK
    )
    :vars
    (
      ?AUTO_3378 - BLOCK
      ?AUTO_3380 - BLOCK
      ?AUTO_3381 - BLOCK
      ?AUTO_3379 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3376 ?AUTO_3377 ) ) ( ON ?AUTO_3376 ?AUTO_3378 ) ( CLEAR ?AUTO_3376 ) ( not ( = ?AUTO_3376 ?AUTO_3378 ) ) ( not ( = ?AUTO_3377 ?AUTO_3378 ) ) ( not ( = ?AUTO_3376 ?AUTO_3380 ) ) ( not ( = ?AUTO_3376 ?AUTO_3381 ) ) ( not ( = ?AUTO_3377 ?AUTO_3380 ) ) ( not ( = ?AUTO_3377 ?AUTO_3381 ) ) ( not ( = ?AUTO_3378 ?AUTO_3380 ) ) ( not ( = ?AUTO_3378 ?AUTO_3381 ) ) ( not ( = ?AUTO_3380 ?AUTO_3381 ) ) ( ON ?AUTO_3380 ?AUTO_3377 ) ( not ( = ?AUTO_3376 ?AUTO_3379 ) ) ( not ( = ?AUTO_3377 ?AUTO_3379 ) ) ( not ( = ?AUTO_3378 ?AUTO_3379 ) ) ( not ( = ?AUTO_3381 ?AUTO_3379 ) ) ( not ( = ?AUTO_3380 ?AUTO_3379 ) ) ( ON ?AUTO_3379 ?AUTO_3380 ) ( CLEAR ?AUTO_3379 ) ( HOLDING ?AUTO_3381 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3381 )
      ( MAKE-ON ?AUTO_3376 ?AUTO_3377 )
      ( MAKE-ON-VERIFY ?AUTO_3376 ?AUTO_3377 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3382 - BLOCK
      ?AUTO_3383 - BLOCK
    )
    :vars
    (
      ?AUTO_3386 - BLOCK
      ?AUTO_3387 - BLOCK
      ?AUTO_3384 - BLOCK
      ?AUTO_3385 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3382 ?AUTO_3383 ) ) ( ON ?AUTO_3382 ?AUTO_3386 ) ( CLEAR ?AUTO_3382 ) ( not ( = ?AUTO_3382 ?AUTO_3386 ) ) ( not ( = ?AUTO_3383 ?AUTO_3386 ) ) ( not ( = ?AUTO_3382 ?AUTO_3387 ) ) ( not ( = ?AUTO_3382 ?AUTO_3384 ) ) ( not ( = ?AUTO_3383 ?AUTO_3387 ) ) ( not ( = ?AUTO_3383 ?AUTO_3384 ) ) ( not ( = ?AUTO_3386 ?AUTO_3387 ) ) ( not ( = ?AUTO_3386 ?AUTO_3384 ) ) ( not ( = ?AUTO_3387 ?AUTO_3384 ) ) ( ON ?AUTO_3387 ?AUTO_3383 ) ( not ( = ?AUTO_3382 ?AUTO_3385 ) ) ( not ( = ?AUTO_3383 ?AUTO_3385 ) ) ( not ( = ?AUTO_3386 ?AUTO_3385 ) ) ( not ( = ?AUTO_3384 ?AUTO_3385 ) ) ( not ( = ?AUTO_3387 ?AUTO_3385 ) ) ( ON ?AUTO_3385 ?AUTO_3387 ) ( ON ?AUTO_3384 ?AUTO_3385 ) ( CLEAR ?AUTO_3384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3384 ?AUTO_3385 )
      ( MAKE-ON ?AUTO_3382 ?AUTO_3383 )
      ( MAKE-ON-VERIFY ?AUTO_3382 ?AUTO_3383 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3388 - BLOCK
      ?AUTO_3389 - BLOCK
    )
    :vars
    (
      ?AUTO_3393 - BLOCK
      ?AUTO_3390 - BLOCK
      ?AUTO_3391 - BLOCK
      ?AUTO_3392 - BLOCK
      ?AUTO_3394 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3388 ?AUTO_3389 ) ) ( ON ?AUTO_3388 ?AUTO_3393 ) ( CLEAR ?AUTO_3388 ) ( not ( = ?AUTO_3388 ?AUTO_3393 ) ) ( not ( = ?AUTO_3389 ?AUTO_3393 ) ) ( not ( = ?AUTO_3388 ?AUTO_3390 ) ) ( not ( = ?AUTO_3388 ?AUTO_3391 ) ) ( not ( = ?AUTO_3389 ?AUTO_3390 ) ) ( not ( = ?AUTO_3389 ?AUTO_3391 ) ) ( not ( = ?AUTO_3393 ?AUTO_3390 ) ) ( not ( = ?AUTO_3393 ?AUTO_3391 ) ) ( not ( = ?AUTO_3390 ?AUTO_3391 ) ) ( ON ?AUTO_3390 ?AUTO_3389 ) ( not ( = ?AUTO_3388 ?AUTO_3392 ) ) ( not ( = ?AUTO_3389 ?AUTO_3392 ) ) ( not ( = ?AUTO_3393 ?AUTO_3392 ) ) ( not ( = ?AUTO_3391 ?AUTO_3392 ) ) ( not ( = ?AUTO_3390 ?AUTO_3392 ) ) ( ON ?AUTO_3392 ?AUTO_3390 ) ( ON ?AUTO_3391 ?AUTO_3392 ) ( CLEAR ?AUTO_3391 ) ( HOLDING ?AUTO_3394 ) ( not ( = ?AUTO_3388 ?AUTO_3394 ) ) ( not ( = ?AUTO_3389 ?AUTO_3394 ) ) ( not ( = ?AUTO_3393 ?AUTO_3394 ) ) ( not ( = ?AUTO_3390 ?AUTO_3394 ) ) ( not ( = ?AUTO_3391 ?AUTO_3394 ) ) ( not ( = ?AUTO_3392 ?AUTO_3394 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3394 )
      ( MAKE-ON ?AUTO_3388 ?AUTO_3389 )
      ( MAKE-ON-VERIFY ?AUTO_3388 ?AUTO_3389 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3395 - BLOCK
      ?AUTO_3396 - BLOCK
    )
    :vars
    (
      ?AUTO_3398 - BLOCK
      ?AUTO_3397 - BLOCK
      ?AUTO_3399 - BLOCK
      ?AUTO_3401 - BLOCK
      ?AUTO_3400 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3395 ?AUTO_3396 ) ) ( ON ?AUTO_3395 ?AUTO_3398 ) ( CLEAR ?AUTO_3395 ) ( not ( = ?AUTO_3395 ?AUTO_3398 ) ) ( not ( = ?AUTO_3396 ?AUTO_3398 ) ) ( not ( = ?AUTO_3395 ?AUTO_3397 ) ) ( not ( = ?AUTO_3395 ?AUTO_3399 ) ) ( not ( = ?AUTO_3396 ?AUTO_3397 ) ) ( not ( = ?AUTO_3396 ?AUTO_3399 ) ) ( not ( = ?AUTO_3398 ?AUTO_3397 ) ) ( not ( = ?AUTO_3398 ?AUTO_3399 ) ) ( not ( = ?AUTO_3397 ?AUTO_3399 ) ) ( ON ?AUTO_3397 ?AUTO_3396 ) ( not ( = ?AUTO_3395 ?AUTO_3401 ) ) ( not ( = ?AUTO_3396 ?AUTO_3401 ) ) ( not ( = ?AUTO_3398 ?AUTO_3401 ) ) ( not ( = ?AUTO_3399 ?AUTO_3401 ) ) ( not ( = ?AUTO_3397 ?AUTO_3401 ) ) ( ON ?AUTO_3401 ?AUTO_3397 ) ( ON ?AUTO_3399 ?AUTO_3401 ) ( not ( = ?AUTO_3395 ?AUTO_3400 ) ) ( not ( = ?AUTO_3396 ?AUTO_3400 ) ) ( not ( = ?AUTO_3398 ?AUTO_3400 ) ) ( not ( = ?AUTO_3397 ?AUTO_3400 ) ) ( not ( = ?AUTO_3399 ?AUTO_3400 ) ) ( not ( = ?AUTO_3401 ?AUTO_3400 ) ) ( ON ?AUTO_3400 ?AUTO_3399 ) ( CLEAR ?AUTO_3400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3400 ?AUTO_3399 )
      ( MAKE-ON ?AUTO_3395 ?AUTO_3396 )
      ( MAKE-ON-VERIFY ?AUTO_3395 ?AUTO_3396 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3404 - BLOCK
      ?AUTO_3405 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3404 ) ( CLEAR ?AUTO_3405 ) ( not ( = ?AUTO_3404 ?AUTO_3405 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3404 ?AUTO_3405 )
      ( MAKE-ON-VERIFY ?AUTO_3404 ?AUTO_3405 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3406 - BLOCK
      ?AUTO_3407 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3407 ) ( not ( = ?AUTO_3406 ?AUTO_3407 ) ) ( ON-TABLE ?AUTO_3406 ) ( CLEAR ?AUTO_3406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3406 )
      ( MAKE-ON ?AUTO_3406 ?AUTO_3407 )
      ( MAKE-ON-VERIFY ?AUTO_3406 ?AUTO_3407 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3408 - BLOCK
      ?AUTO_3409 - BLOCK
    )
    :vars
    (
      ?AUTO_3410 - BLOCK
      ?AUTO_3411 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3409 ) ( not ( = ?AUTO_3408 ?AUTO_3409 ) ) ( ON-TABLE ?AUTO_3408 ) ( CLEAR ?AUTO_3408 ) ( HOLDING ?AUTO_3410 ) ( CLEAR ?AUTO_3411 ) ( not ( = ?AUTO_3408 ?AUTO_3410 ) ) ( not ( = ?AUTO_3408 ?AUTO_3411 ) ) ( not ( = ?AUTO_3409 ?AUTO_3410 ) ) ( not ( = ?AUTO_3409 ?AUTO_3411 ) ) ( not ( = ?AUTO_3410 ?AUTO_3411 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3410 ?AUTO_3411 )
      ( MAKE-ON ?AUTO_3408 ?AUTO_3409 )
      ( MAKE-ON-VERIFY ?AUTO_3408 ?AUTO_3409 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3418 - BLOCK
      ?AUTO_3419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3418 ?AUTO_3419 ) ) ( ON-TABLE ?AUTO_3418 ) ( CLEAR ?AUTO_3418 ) ( HOLDING ?AUTO_3419 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3419 )
      ( MAKE-ON ?AUTO_3418 ?AUTO_3419 )
      ( MAKE-ON-VERIFY ?AUTO_3418 ?AUTO_3419 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3424 - BLOCK
      ?AUTO_3425 - BLOCK
    )
    :vars
    (
      ?AUTO_3426 - BLOCK
      ?AUTO_3427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3424 ?AUTO_3425 ) ) ( ON-TABLE ?AUTO_3424 ) ( CLEAR ?AUTO_3424 ) ( CLEAR ?AUTO_3426 ) ( not ( = ?AUTO_3424 ?AUTO_3427 ) ) ( not ( = ?AUTO_3424 ?AUTO_3426 ) ) ( not ( = ?AUTO_3425 ?AUTO_3427 ) ) ( not ( = ?AUTO_3425 ?AUTO_3426 ) ) ( not ( = ?AUTO_3427 ?AUTO_3426 ) ) ( ON ?AUTO_3427 ?AUTO_3425 ) ( CLEAR ?AUTO_3427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3427 ?AUTO_3425 )
      ( MAKE-ON ?AUTO_3424 ?AUTO_3425 )
      ( MAKE-ON-VERIFY ?AUTO_3424 ?AUTO_3425 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3428 - BLOCK
      ?AUTO_3429 - BLOCK
    )
    :vars
    (
      ?AUTO_3430 - BLOCK
      ?AUTO_3431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3428 ?AUTO_3429 ) ) ( CLEAR ?AUTO_3430 ) ( not ( = ?AUTO_3428 ?AUTO_3431 ) ) ( not ( = ?AUTO_3428 ?AUTO_3430 ) ) ( not ( = ?AUTO_3429 ?AUTO_3431 ) ) ( not ( = ?AUTO_3429 ?AUTO_3430 ) ) ( not ( = ?AUTO_3431 ?AUTO_3430 ) ) ( ON ?AUTO_3431 ?AUTO_3429 ) ( CLEAR ?AUTO_3431 ) ( HOLDING ?AUTO_3428 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3428 )
      ( MAKE-ON ?AUTO_3428 ?AUTO_3429 )
      ( MAKE-ON-VERIFY ?AUTO_3428 ?AUTO_3429 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3432 - BLOCK
      ?AUTO_3433 - BLOCK
    )
    :vars
    (
      ?AUTO_3435 - BLOCK
      ?AUTO_3434 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3432 ?AUTO_3433 ) ) ( CLEAR ?AUTO_3435 ) ( not ( = ?AUTO_3432 ?AUTO_3434 ) ) ( not ( = ?AUTO_3432 ?AUTO_3435 ) ) ( not ( = ?AUTO_3433 ?AUTO_3434 ) ) ( not ( = ?AUTO_3433 ?AUTO_3435 ) ) ( not ( = ?AUTO_3434 ?AUTO_3435 ) ) ( ON ?AUTO_3434 ?AUTO_3433 ) ( ON ?AUTO_3432 ?AUTO_3434 ) ( CLEAR ?AUTO_3432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3432 ?AUTO_3434 )
      ( MAKE-ON ?AUTO_3432 ?AUTO_3433 )
      ( MAKE-ON-VERIFY ?AUTO_3432 ?AUTO_3433 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3437 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3437 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3437 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3437 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3438 - BLOCK
    )
    :vars
    (
      ?AUTO_3439 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3438 ?AUTO_3439 ) ( CLEAR ?AUTO_3438 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3438 ?AUTO_3439 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3438 ?AUTO_3439 )
      ( MAKE-ON-TABLE ?AUTO_3438 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3438 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3442 - BLOCK
      ?AUTO_3443 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3442 ) ( CLEAR ?AUTO_3443 ) ( not ( = ?AUTO_3442 ?AUTO_3443 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3442 ?AUTO_3443 )
      ( MAKE-ON-VERIFY ?AUTO_3442 ?AUTO_3443 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3444 - BLOCK
      ?AUTO_3445 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3445 ) ( not ( = ?AUTO_3444 ?AUTO_3445 ) ) ( ON-TABLE ?AUTO_3444 ) ( CLEAR ?AUTO_3444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3444 )
      ( MAKE-ON ?AUTO_3444 ?AUTO_3445 )
      ( MAKE-ON-VERIFY ?AUTO_3444 ?AUTO_3445 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3446 - BLOCK
      ?AUTO_3447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3446 ?AUTO_3447 ) ) ( ON-TABLE ?AUTO_3446 ) ( CLEAR ?AUTO_3446 ) ( HOLDING ?AUTO_3447 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3447 )
      ( MAKE-ON ?AUTO_3446 ?AUTO_3447 )
      ( MAKE-ON-VERIFY ?AUTO_3446 ?AUTO_3447 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3452 - BLOCK
      ?AUTO_3453 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3452 ) ( CLEAR ?AUTO_3453 ) ( not ( = ?AUTO_3452 ?AUTO_3453 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3452 ?AUTO_3453 )
      ( MAKE-ON-VERIFY ?AUTO_3452 ?AUTO_3453 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3454 - BLOCK
      ?AUTO_3455 - BLOCK
    )
    :vars
    (
      ?AUTO_3456 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3455 ) ( not ( = ?AUTO_3454 ?AUTO_3455 ) ) ( ON ?AUTO_3454 ?AUTO_3456 ) ( CLEAR ?AUTO_3454 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3454 ?AUTO_3456 ) ) ( not ( = ?AUTO_3455 ?AUTO_3456 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3454 ?AUTO_3456 )
      ( MAKE-ON ?AUTO_3454 ?AUTO_3455 )
      ( MAKE-ON-VERIFY ?AUTO_3454 ?AUTO_3455 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3457 - BLOCK
      ?AUTO_3458 - BLOCK
    )
    :vars
    (
      ?AUTO_3459 - BLOCK
      ?AUTO_3460 - BLOCK
      ?AUTO_3461 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3458 ) ( not ( = ?AUTO_3457 ?AUTO_3458 ) ) ( ON ?AUTO_3457 ?AUTO_3459 ) ( CLEAR ?AUTO_3457 ) ( not ( = ?AUTO_3457 ?AUTO_3459 ) ) ( not ( = ?AUTO_3458 ?AUTO_3459 ) ) ( HOLDING ?AUTO_3460 ) ( CLEAR ?AUTO_3461 ) ( not ( = ?AUTO_3457 ?AUTO_3460 ) ) ( not ( = ?AUTO_3457 ?AUTO_3461 ) ) ( not ( = ?AUTO_3458 ?AUTO_3460 ) ) ( not ( = ?AUTO_3458 ?AUTO_3461 ) ) ( not ( = ?AUTO_3459 ?AUTO_3460 ) ) ( not ( = ?AUTO_3459 ?AUTO_3461 ) ) ( not ( = ?AUTO_3460 ?AUTO_3461 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3460 ?AUTO_3461 )
      ( MAKE-ON ?AUTO_3457 ?AUTO_3458 )
      ( MAKE-ON-VERIFY ?AUTO_3457 ?AUTO_3458 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3466 - BLOCK
      ?AUTO_3467 - BLOCK
    )
    :vars
    (
      ?AUTO_3470 - BLOCK
      ?AUTO_3469 - BLOCK
      ?AUTO_3468 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3467 ) ( not ( = ?AUTO_3466 ?AUTO_3467 ) ) ( ON ?AUTO_3466 ?AUTO_3470 ) ( not ( = ?AUTO_3466 ?AUTO_3470 ) ) ( not ( = ?AUTO_3467 ?AUTO_3470 ) ) ( CLEAR ?AUTO_3469 ) ( not ( = ?AUTO_3466 ?AUTO_3468 ) ) ( not ( = ?AUTO_3466 ?AUTO_3469 ) ) ( not ( = ?AUTO_3467 ?AUTO_3468 ) ) ( not ( = ?AUTO_3467 ?AUTO_3469 ) ) ( not ( = ?AUTO_3470 ?AUTO_3468 ) ) ( not ( = ?AUTO_3470 ?AUTO_3469 ) ) ( not ( = ?AUTO_3468 ?AUTO_3469 ) ) ( ON ?AUTO_3468 ?AUTO_3466 ) ( CLEAR ?AUTO_3468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3468 ?AUTO_3466 )
      ( MAKE-ON ?AUTO_3466 ?AUTO_3467 )
      ( MAKE-ON-VERIFY ?AUTO_3466 ?AUTO_3467 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3473 - BLOCK
      ?AUTO_3474 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3473 ) ( CLEAR ?AUTO_3474 ) ( not ( = ?AUTO_3473 ?AUTO_3474 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3473 ?AUTO_3474 )
      ( MAKE-ON-VERIFY ?AUTO_3473 ?AUTO_3474 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3475 - BLOCK
      ?AUTO_3476 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3476 ) ( not ( = ?AUTO_3475 ?AUTO_3476 ) ) ( ON-TABLE ?AUTO_3475 ) ( CLEAR ?AUTO_3475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3475 )
      ( MAKE-ON ?AUTO_3475 ?AUTO_3476 )
      ( MAKE-ON-VERIFY ?AUTO_3475 ?AUTO_3476 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3477 - BLOCK
      ?AUTO_3478 - BLOCK
    )
    :vars
    (
      ?AUTO_3479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3477 ?AUTO_3478 ) ) ( ON-TABLE ?AUTO_3477 ) ( CLEAR ?AUTO_3477 ) ( HOLDING ?AUTO_3478 ) ( CLEAR ?AUTO_3479 ) ( not ( = ?AUTO_3477 ?AUTO_3479 ) ) ( not ( = ?AUTO_3478 ?AUTO_3479 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3478 ?AUTO_3479 )
      ( MAKE-ON ?AUTO_3477 ?AUTO_3478 )
      ( MAKE-ON-VERIFY ?AUTO_3477 ?AUTO_3478 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3480 - BLOCK
      ?AUTO_3481 - BLOCK
    )
    :vars
    (
      ?AUTO_3482 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3480 ?AUTO_3481 ) ) ( ON-TABLE ?AUTO_3480 ) ( CLEAR ?AUTO_3482 ) ( not ( = ?AUTO_3480 ?AUTO_3482 ) ) ( not ( = ?AUTO_3481 ?AUTO_3482 ) ) ( ON ?AUTO_3481 ?AUTO_3480 ) ( CLEAR ?AUTO_3481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3481 ?AUTO_3480 )
      ( MAKE-ON ?AUTO_3480 ?AUTO_3481 )
      ( MAKE-ON-VERIFY ?AUTO_3480 ?AUTO_3481 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3483 - BLOCK
      ?AUTO_3484 - BLOCK
    )
    :vars
    (
      ?AUTO_3485 - BLOCK
      ?AUTO_3486 - BLOCK
      ?AUTO_3487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3483 ?AUTO_3484 ) ) ( ON-TABLE ?AUTO_3483 ) ( CLEAR ?AUTO_3485 ) ( not ( = ?AUTO_3483 ?AUTO_3485 ) ) ( not ( = ?AUTO_3484 ?AUTO_3485 ) ) ( ON ?AUTO_3484 ?AUTO_3483 ) ( CLEAR ?AUTO_3484 ) ( HOLDING ?AUTO_3486 ) ( CLEAR ?AUTO_3487 ) ( not ( = ?AUTO_3483 ?AUTO_3486 ) ) ( not ( = ?AUTO_3483 ?AUTO_3487 ) ) ( not ( = ?AUTO_3484 ?AUTO_3486 ) ) ( not ( = ?AUTO_3484 ?AUTO_3487 ) ) ( not ( = ?AUTO_3485 ?AUTO_3486 ) ) ( not ( = ?AUTO_3485 ?AUTO_3487 ) ) ( not ( = ?AUTO_3486 ?AUTO_3487 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3486 ?AUTO_3487 )
      ( MAKE-ON ?AUTO_3483 ?AUTO_3484 )
      ( MAKE-ON-VERIFY ?AUTO_3483 ?AUTO_3484 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3492 - BLOCK
      ?AUTO_3493 - BLOCK
    )
    :vars
    (
      ?AUTO_3496 - BLOCK
      ?AUTO_3494 - BLOCK
      ?AUTO_3495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3492 ?AUTO_3493 ) ) ( ON-TABLE ?AUTO_3492 ) ( CLEAR ?AUTO_3496 ) ( not ( = ?AUTO_3492 ?AUTO_3496 ) ) ( not ( = ?AUTO_3493 ?AUTO_3496 ) ) ( ON ?AUTO_3493 ?AUTO_3492 ) ( CLEAR ?AUTO_3494 ) ( not ( = ?AUTO_3492 ?AUTO_3495 ) ) ( not ( = ?AUTO_3492 ?AUTO_3494 ) ) ( not ( = ?AUTO_3493 ?AUTO_3495 ) ) ( not ( = ?AUTO_3493 ?AUTO_3494 ) ) ( not ( = ?AUTO_3496 ?AUTO_3495 ) ) ( not ( = ?AUTO_3496 ?AUTO_3494 ) ) ( not ( = ?AUTO_3495 ?AUTO_3494 ) ) ( ON ?AUTO_3495 ?AUTO_3493 ) ( CLEAR ?AUTO_3495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3495 ?AUTO_3493 )
      ( MAKE-ON ?AUTO_3492 ?AUTO_3493 )
      ( MAKE-ON-VERIFY ?AUTO_3492 ?AUTO_3493 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3499 - BLOCK
      ?AUTO_3500 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3499 ) ( CLEAR ?AUTO_3500 ) ( not ( = ?AUTO_3499 ?AUTO_3500 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3499 ?AUTO_3500 )
      ( MAKE-ON-VERIFY ?AUTO_3499 ?AUTO_3500 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3501 - BLOCK
      ?AUTO_3502 - BLOCK
    )
    :vars
    (
      ?AUTO_3503 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3502 ) ( not ( = ?AUTO_3501 ?AUTO_3502 ) ) ( ON ?AUTO_3501 ?AUTO_3503 ) ( CLEAR ?AUTO_3501 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3501 ?AUTO_3503 ) ) ( not ( = ?AUTO_3502 ?AUTO_3503 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3501 ?AUTO_3503 )
      ( MAKE-ON ?AUTO_3501 ?AUTO_3502 )
      ( MAKE-ON-VERIFY ?AUTO_3501 ?AUTO_3502 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3504 - BLOCK
      ?AUTO_3505 - BLOCK
    )
    :vars
    (
      ?AUTO_3506 - BLOCK
      ?AUTO_3507 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3504 ?AUTO_3505 ) ) ( ON ?AUTO_3504 ?AUTO_3506 ) ( CLEAR ?AUTO_3504 ) ( not ( = ?AUTO_3504 ?AUTO_3506 ) ) ( not ( = ?AUTO_3505 ?AUTO_3506 ) ) ( HOLDING ?AUTO_3505 ) ( CLEAR ?AUTO_3507 ) ( not ( = ?AUTO_3504 ?AUTO_3507 ) ) ( not ( = ?AUTO_3505 ?AUTO_3507 ) ) ( not ( = ?AUTO_3506 ?AUTO_3507 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3505 ?AUTO_3507 )
      ( MAKE-ON ?AUTO_3504 ?AUTO_3505 )
      ( MAKE-ON-VERIFY ?AUTO_3504 ?AUTO_3505 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3510 - BLOCK
      ?AUTO_3511 - BLOCK
    )
    :vars
    (
      ?AUTO_3512 - BLOCK
      ?AUTO_3513 - BLOCK
      ?AUTO_3514 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3511 ) ( not ( = ?AUTO_3510 ?AUTO_3511 ) ) ( ON ?AUTO_3510 ?AUTO_3512 ) ( CLEAR ?AUTO_3510 ) ( not ( = ?AUTO_3510 ?AUTO_3512 ) ) ( not ( = ?AUTO_3511 ?AUTO_3512 ) ) ( HOLDING ?AUTO_3513 ) ( CLEAR ?AUTO_3514 ) ( not ( = ?AUTO_3510 ?AUTO_3513 ) ) ( not ( = ?AUTO_3510 ?AUTO_3514 ) ) ( not ( = ?AUTO_3511 ?AUTO_3513 ) ) ( not ( = ?AUTO_3511 ?AUTO_3514 ) ) ( not ( = ?AUTO_3512 ?AUTO_3513 ) ) ( not ( = ?AUTO_3512 ?AUTO_3514 ) ) ( not ( = ?AUTO_3513 ?AUTO_3514 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3513 ?AUTO_3514 )
      ( MAKE-ON ?AUTO_3510 ?AUTO_3511 )
      ( MAKE-ON-VERIFY ?AUTO_3510 ?AUTO_3511 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3515 - BLOCK
      ?AUTO_3516 - BLOCK
    )
    :vars
    (
      ?AUTO_3517 - BLOCK
      ?AUTO_3518 - BLOCK
      ?AUTO_3519 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3515 ?AUTO_3516 ) ) ( ON ?AUTO_3515 ?AUTO_3517 ) ( CLEAR ?AUTO_3515 ) ( not ( = ?AUTO_3515 ?AUTO_3517 ) ) ( not ( = ?AUTO_3516 ?AUTO_3517 ) ) ( CLEAR ?AUTO_3518 ) ( not ( = ?AUTO_3515 ?AUTO_3519 ) ) ( not ( = ?AUTO_3515 ?AUTO_3518 ) ) ( not ( = ?AUTO_3516 ?AUTO_3519 ) ) ( not ( = ?AUTO_3516 ?AUTO_3518 ) ) ( not ( = ?AUTO_3517 ?AUTO_3519 ) ) ( not ( = ?AUTO_3517 ?AUTO_3518 ) ) ( not ( = ?AUTO_3519 ?AUTO_3518 ) ) ( ON ?AUTO_3519 ?AUTO_3516 ) ( CLEAR ?AUTO_3519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3519 ?AUTO_3516 )
      ( MAKE-ON ?AUTO_3515 ?AUTO_3516 )
      ( MAKE-ON-VERIFY ?AUTO_3515 ?AUTO_3516 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3520 - BLOCK
      ?AUTO_3521 - BLOCK
    )
    :vars
    (
      ?AUTO_3522 - BLOCK
      ?AUTO_3523 - BLOCK
      ?AUTO_3524 - BLOCK
      ?AUTO_3525 - BLOCK
      ?AUTO_3526 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3520 ?AUTO_3521 ) ) ( ON ?AUTO_3520 ?AUTO_3522 ) ( CLEAR ?AUTO_3520 ) ( not ( = ?AUTO_3520 ?AUTO_3522 ) ) ( not ( = ?AUTO_3521 ?AUTO_3522 ) ) ( CLEAR ?AUTO_3523 ) ( not ( = ?AUTO_3520 ?AUTO_3524 ) ) ( not ( = ?AUTO_3520 ?AUTO_3523 ) ) ( not ( = ?AUTO_3521 ?AUTO_3524 ) ) ( not ( = ?AUTO_3521 ?AUTO_3523 ) ) ( not ( = ?AUTO_3522 ?AUTO_3524 ) ) ( not ( = ?AUTO_3522 ?AUTO_3523 ) ) ( not ( = ?AUTO_3524 ?AUTO_3523 ) ) ( ON ?AUTO_3524 ?AUTO_3521 ) ( CLEAR ?AUTO_3524 ) ( HOLDING ?AUTO_3525 ) ( CLEAR ?AUTO_3526 ) ( not ( = ?AUTO_3520 ?AUTO_3525 ) ) ( not ( = ?AUTO_3520 ?AUTO_3526 ) ) ( not ( = ?AUTO_3521 ?AUTO_3525 ) ) ( not ( = ?AUTO_3521 ?AUTO_3526 ) ) ( not ( = ?AUTO_3522 ?AUTO_3525 ) ) ( not ( = ?AUTO_3522 ?AUTO_3526 ) ) ( not ( = ?AUTO_3523 ?AUTO_3525 ) ) ( not ( = ?AUTO_3523 ?AUTO_3526 ) ) ( not ( = ?AUTO_3524 ?AUTO_3525 ) ) ( not ( = ?AUTO_3524 ?AUTO_3526 ) ) ( not ( = ?AUTO_3525 ?AUTO_3526 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3525 ?AUTO_3526 )
      ( MAKE-ON ?AUTO_3520 ?AUTO_3521 )
      ( MAKE-ON-VERIFY ?AUTO_3520 ?AUTO_3521 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3531 - BLOCK
      ?AUTO_3532 - BLOCK
    )
    :vars
    (
      ?AUTO_3537 - BLOCK
      ?AUTO_3536 - BLOCK
      ?AUTO_3533 - BLOCK
      ?AUTO_3534 - BLOCK
      ?AUTO_3535 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3531 ?AUTO_3532 ) ) ( ON ?AUTO_3531 ?AUTO_3537 ) ( CLEAR ?AUTO_3531 ) ( not ( = ?AUTO_3531 ?AUTO_3537 ) ) ( not ( = ?AUTO_3532 ?AUTO_3537 ) ) ( CLEAR ?AUTO_3536 ) ( not ( = ?AUTO_3531 ?AUTO_3533 ) ) ( not ( = ?AUTO_3531 ?AUTO_3536 ) ) ( not ( = ?AUTO_3532 ?AUTO_3533 ) ) ( not ( = ?AUTO_3532 ?AUTO_3536 ) ) ( not ( = ?AUTO_3537 ?AUTO_3533 ) ) ( not ( = ?AUTO_3537 ?AUTO_3536 ) ) ( not ( = ?AUTO_3533 ?AUTO_3536 ) ) ( ON ?AUTO_3533 ?AUTO_3532 ) ( CLEAR ?AUTO_3534 ) ( not ( = ?AUTO_3531 ?AUTO_3535 ) ) ( not ( = ?AUTO_3531 ?AUTO_3534 ) ) ( not ( = ?AUTO_3532 ?AUTO_3535 ) ) ( not ( = ?AUTO_3532 ?AUTO_3534 ) ) ( not ( = ?AUTO_3537 ?AUTO_3535 ) ) ( not ( = ?AUTO_3537 ?AUTO_3534 ) ) ( not ( = ?AUTO_3536 ?AUTO_3535 ) ) ( not ( = ?AUTO_3536 ?AUTO_3534 ) ) ( not ( = ?AUTO_3533 ?AUTO_3535 ) ) ( not ( = ?AUTO_3533 ?AUTO_3534 ) ) ( not ( = ?AUTO_3535 ?AUTO_3534 ) ) ( ON ?AUTO_3535 ?AUTO_3533 ) ( CLEAR ?AUTO_3535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3535 ?AUTO_3533 )
      ( MAKE-ON ?AUTO_3531 ?AUTO_3532 )
      ( MAKE-ON-VERIFY ?AUTO_3531 ?AUTO_3532 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3539 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3539 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3539 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3539 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3540 - BLOCK
    )
    :vars
    (
      ?AUTO_3541 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3540 ?AUTO_3541 ) ( CLEAR ?AUTO_3540 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3540 ?AUTO_3541 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3540 ?AUTO_3541 )
      ( MAKE-ON-TABLE ?AUTO_3540 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3540 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3542 - BLOCK
    )
    :vars
    (
      ?AUTO_3543 - BLOCK
      ?AUTO_3544 - BLOCK
      ?AUTO_3545 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3542 ?AUTO_3543 ) ( CLEAR ?AUTO_3542 ) ( not ( = ?AUTO_3542 ?AUTO_3543 ) ) ( HOLDING ?AUTO_3544 ) ( CLEAR ?AUTO_3545 ) ( not ( = ?AUTO_3542 ?AUTO_3544 ) ) ( not ( = ?AUTO_3542 ?AUTO_3545 ) ) ( not ( = ?AUTO_3543 ?AUTO_3544 ) ) ( not ( = ?AUTO_3543 ?AUTO_3545 ) ) ( not ( = ?AUTO_3544 ?AUTO_3545 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3544 ?AUTO_3545 )
      ( MAKE-ON-TABLE ?AUTO_3542 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3542 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3546 - BLOCK
    )
    :vars
    (
      ?AUTO_3547 - BLOCK
      ?AUTO_3549 - BLOCK
      ?AUTO_3548 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3546 ?AUTO_3547 ) ( not ( = ?AUTO_3546 ?AUTO_3547 ) ) ( CLEAR ?AUTO_3549 ) ( not ( = ?AUTO_3546 ?AUTO_3548 ) ) ( not ( = ?AUTO_3546 ?AUTO_3549 ) ) ( not ( = ?AUTO_3547 ?AUTO_3548 ) ) ( not ( = ?AUTO_3547 ?AUTO_3549 ) ) ( not ( = ?AUTO_3548 ?AUTO_3549 ) ) ( ON ?AUTO_3548 ?AUTO_3546 ) ( CLEAR ?AUTO_3548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3548 ?AUTO_3546 )
      ( MAKE-ON-TABLE ?AUTO_3546 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3546 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3550 - BLOCK
    )
    :vars
    (
      ?AUTO_3551 - BLOCK
      ?AUTO_3552 - BLOCK
      ?AUTO_3553 - BLOCK
      ?AUTO_3554 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3550 ?AUTO_3551 ) ( not ( = ?AUTO_3550 ?AUTO_3551 ) ) ( not ( = ?AUTO_3550 ?AUTO_3552 ) ) ( not ( = ?AUTO_3550 ?AUTO_3553 ) ) ( not ( = ?AUTO_3551 ?AUTO_3552 ) ) ( not ( = ?AUTO_3551 ?AUTO_3553 ) ) ( not ( = ?AUTO_3552 ?AUTO_3553 ) ) ( ON ?AUTO_3552 ?AUTO_3550 ) ( CLEAR ?AUTO_3552 ) ( HOLDING ?AUTO_3553 ) ( CLEAR ?AUTO_3554 ) ( not ( = ?AUTO_3550 ?AUTO_3554 ) ) ( not ( = ?AUTO_3551 ?AUTO_3554 ) ) ( not ( = ?AUTO_3552 ?AUTO_3554 ) ) ( not ( = ?AUTO_3553 ?AUTO_3554 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3553 ?AUTO_3554 )
      ( MAKE-ON-TABLE ?AUTO_3550 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3550 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3563 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3563 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3563 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3563 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3564 - BLOCK
    )
    :vars
    (
      ?AUTO_3565 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3564 ?AUTO_3565 ) ( CLEAR ?AUTO_3564 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3564 ?AUTO_3565 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3564 ?AUTO_3565 )
      ( MAKE-ON-TABLE ?AUTO_3564 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3564 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3566 - BLOCK
    )
    :vars
    (
      ?AUTO_3567 - BLOCK
      ?AUTO_3568 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3566 ?AUTO_3567 ) ( CLEAR ?AUTO_3566 ) ( not ( = ?AUTO_3566 ?AUTO_3567 ) ) ( HOLDING ?AUTO_3568 ) ( not ( = ?AUTO_3566 ?AUTO_3568 ) ) ( not ( = ?AUTO_3567 ?AUTO_3568 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3568 )
      ( MAKE-ON-TABLE ?AUTO_3566 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3566 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3569 - BLOCK
    )
    :vars
    (
      ?AUTO_3570 - BLOCK
      ?AUTO_3571 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3569 ?AUTO_3570 ) ( not ( = ?AUTO_3569 ?AUTO_3570 ) ) ( not ( = ?AUTO_3569 ?AUTO_3571 ) ) ( not ( = ?AUTO_3570 ?AUTO_3571 ) ) ( ON ?AUTO_3571 ?AUTO_3569 ) ( CLEAR ?AUTO_3571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3571 ?AUTO_3569 )
      ( MAKE-ON-TABLE ?AUTO_3569 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3569 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3572 - BLOCK
    )
    :vars
    (
      ?AUTO_3574 - BLOCK
      ?AUTO_3573 - BLOCK
      ?AUTO_3575 - BLOCK
      ?AUTO_3576 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3572 ?AUTO_3574 ) ( not ( = ?AUTO_3572 ?AUTO_3574 ) ) ( not ( = ?AUTO_3572 ?AUTO_3573 ) ) ( not ( = ?AUTO_3574 ?AUTO_3573 ) ) ( ON ?AUTO_3573 ?AUTO_3572 ) ( CLEAR ?AUTO_3573 ) ( HOLDING ?AUTO_3575 ) ( CLEAR ?AUTO_3576 ) ( not ( = ?AUTO_3572 ?AUTO_3575 ) ) ( not ( = ?AUTO_3572 ?AUTO_3576 ) ) ( not ( = ?AUTO_3574 ?AUTO_3575 ) ) ( not ( = ?AUTO_3574 ?AUTO_3576 ) ) ( not ( = ?AUTO_3573 ?AUTO_3575 ) ) ( not ( = ?AUTO_3573 ?AUTO_3576 ) ) ( not ( = ?AUTO_3575 ?AUTO_3576 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3575 ?AUTO_3576 )
      ( MAKE-ON-TABLE ?AUTO_3572 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3572 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3577 - BLOCK
    )
    :vars
    (
      ?AUTO_3579 - BLOCK
      ?AUTO_3578 - BLOCK
      ?AUTO_3580 - BLOCK
      ?AUTO_3581 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3577 ?AUTO_3579 ) ( not ( = ?AUTO_3577 ?AUTO_3579 ) ) ( not ( = ?AUTO_3577 ?AUTO_3578 ) ) ( not ( = ?AUTO_3579 ?AUTO_3578 ) ) ( ON ?AUTO_3578 ?AUTO_3577 ) ( CLEAR ?AUTO_3580 ) ( not ( = ?AUTO_3577 ?AUTO_3581 ) ) ( not ( = ?AUTO_3577 ?AUTO_3580 ) ) ( not ( = ?AUTO_3579 ?AUTO_3581 ) ) ( not ( = ?AUTO_3579 ?AUTO_3580 ) ) ( not ( = ?AUTO_3578 ?AUTO_3581 ) ) ( not ( = ?AUTO_3578 ?AUTO_3580 ) ) ( not ( = ?AUTO_3581 ?AUTO_3580 ) ) ( ON ?AUTO_3581 ?AUTO_3578 ) ( CLEAR ?AUTO_3581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3581 ?AUTO_3578 )
      ( MAKE-ON-TABLE ?AUTO_3577 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3577 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3582 - BLOCK
    )
    :vars
    (
      ?AUTO_3583 - BLOCK
      ?AUTO_3584 - BLOCK
      ?AUTO_3586 - BLOCK
      ?AUTO_3585 - BLOCK
      ?AUTO_3587 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3582 ?AUTO_3583 ) ( not ( = ?AUTO_3582 ?AUTO_3583 ) ) ( not ( = ?AUTO_3582 ?AUTO_3584 ) ) ( not ( = ?AUTO_3583 ?AUTO_3584 ) ) ( ON ?AUTO_3584 ?AUTO_3582 ) ( not ( = ?AUTO_3582 ?AUTO_3586 ) ) ( not ( = ?AUTO_3582 ?AUTO_3585 ) ) ( not ( = ?AUTO_3583 ?AUTO_3586 ) ) ( not ( = ?AUTO_3583 ?AUTO_3585 ) ) ( not ( = ?AUTO_3584 ?AUTO_3586 ) ) ( not ( = ?AUTO_3584 ?AUTO_3585 ) ) ( not ( = ?AUTO_3586 ?AUTO_3585 ) ) ( ON ?AUTO_3586 ?AUTO_3584 ) ( CLEAR ?AUTO_3586 ) ( HOLDING ?AUTO_3585 ) ( CLEAR ?AUTO_3587 ) ( not ( = ?AUTO_3582 ?AUTO_3587 ) ) ( not ( = ?AUTO_3583 ?AUTO_3587 ) ) ( not ( = ?AUTO_3584 ?AUTO_3587 ) ) ( not ( = ?AUTO_3586 ?AUTO_3587 ) ) ( not ( = ?AUTO_3585 ?AUTO_3587 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3585 ?AUTO_3587 )
      ( MAKE-ON-TABLE ?AUTO_3582 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3582 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3597 - BLOCK
      ?AUTO_3598 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3597 ) ( CLEAR ?AUTO_3598 ) ( not ( = ?AUTO_3597 ?AUTO_3598 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3597 ?AUTO_3598 )
      ( MAKE-ON-VERIFY ?AUTO_3597 ?AUTO_3598 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3599 - BLOCK
      ?AUTO_3600 - BLOCK
    )
    :vars
    (
      ?AUTO_3601 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3600 ) ( not ( = ?AUTO_3599 ?AUTO_3600 ) ) ( ON ?AUTO_3599 ?AUTO_3601 ) ( CLEAR ?AUTO_3599 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3599 ?AUTO_3601 ) ) ( not ( = ?AUTO_3600 ?AUTO_3601 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3599 ?AUTO_3601 )
      ( MAKE-ON ?AUTO_3599 ?AUTO_3600 )
      ( MAKE-ON-VERIFY ?AUTO_3599 ?AUTO_3600 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3602 - BLOCK
      ?AUTO_3603 - BLOCK
    )
    :vars
    (
      ?AUTO_3604 - BLOCK
      ?AUTO_3605 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3603 ) ( not ( = ?AUTO_3602 ?AUTO_3603 ) ) ( ON ?AUTO_3602 ?AUTO_3604 ) ( CLEAR ?AUTO_3602 ) ( not ( = ?AUTO_3602 ?AUTO_3604 ) ) ( not ( = ?AUTO_3603 ?AUTO_3604 ) ) ( HOLDING ?AUTO_3605 ) ( not ( = ?AUTO_3602 ?AUTO_3605 ) ) ( not ( = ?AUTO_3603 ?AUTO_3605 ) ) ( not ( = ?AUTO_3604 ?AUTO_3605 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3605 )
      ( MAKE-ON ?AUTO_3602 ?AUTO_3603 )
      ( MAKE-ON-VERIFY ?AUTO_3602 ?AUTO_3603 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3606 - BLOCK
      ?AUTO_3607 - BLOCK
    )
    :vars
    (
      ?AUTO_3608 - BLOCK
      ?AUTO_3609 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3607 ) ( not ( = ?AUTO_3606 ?AUTO_3607 ) ) ( ON ?AUTO_3606 ?AUTO_3608 ) ( not ( = ?AUTO_3606 ?AUTO_3608 ) ) ( not ( = ?AUTO_3607 ?AUTO_3608 ) ) ( not ( = ?AUTO_3606 ?AUTO_3609 ) ) ( not ( = ?AUTO_3607 ?AUTO_3609 ) ) ( not ( = ?AUTO_3608 ?AUTO_3609 ) ) ( ON ?AUTO_3609 ?AUTO_3606 ) ( CLEAR ?AUTO_3609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3609 ?AUTO_3606 )
      ( MAKE-ON ?AUTO_3606 ?AUTO_3607 )
      ( MAKE-ON-VERIFY ?AUTO_3606 ?AUTO_3607 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3610 - BLOCK
      ?AUTO_3611 - BLOCK
    )
    :vars
    (
      ?AUTO_3612 - BLOCK
      ?AUTO_3613 - BLOCK
      ?AUTO_3614 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3611 ) ( not ( = ?AUTO_3610 ?AUTO_3611 ) ) ( ON ?AUTO_3610 ?AUTO_3612 ) ( not ( = ?AUTO_3610 ?AUTO_3612 ) ) ( not ( = ?AUTO_3611 ?AUTO_3612 ) ) ( not ( = ?AUTO_3610 ?AUTO_3613 ) ) ( not ( = ?AUTO_3611 ?AUTO_3613 ) ) ( not ( = ?AUTO_3612 ?AUTO_3613 ) ) ( ON ?AUTO_3613 ?AUTO_3610 ) ( CLEAR ?AUTO_3613 ) ( HOLDING ?AUTO_3614 ) ( not ( = ?AUTO_3610 ?AUTO_3614 ) ) ( not ( = ?AUTO_3611 ?AUTO_3614 ) ) ( not ( = ?AUTO_3612 ?AUTO_3614 ) ) ( not ( = ?AUTO_3613 ?AUTO_3614 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3614 )
      ( MAKE-ON ?AUTO_3610 ?AUTO_3611 )
      ( MAKE-ON-VERIFY ?AUTO_3610 ?AUTO_3611 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3615 - BLOCK
      ?AUTO_3616 - BLOCK
    )
    :vars
    (
      ?AUTO_3617 - BLOCK
      ?AUTO_3618 - BLOCK
      ?AUTO_3619 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3616 ) ( not ( = ?AUTO_3615 ?AUTO_3616 ) ) ( ON ?AUTO_3615 ?AUTO_3617 ) ( not ( = ?AUTO_3615 ?AUTO_3617 ) ) ( not ( = ?AUTO_3616 ?AUTO_3617 ) ) ( not ( = ?AUTO_3615 ?AUTO_3618 ) ) ( not ( = ?AUTO_3616 ?AUTO_3618 ) ) ( not ( = ?AUTO_3617 ?AUTO_3618 ) ) ( ON ?AUTO_3618 ?AUTO_3615 ) ( not ( = ?AUTO_3615 ?AUTO_3619 ) ) ( not ( = ?AUTO_3616 ?AUTO_3619 ) ) ( not ( = ?AUTO_3617 ?AUTO_3619 ) ) ( not ( = ?AUTO_3618 ?AUTO_3619 ) ) ( ON ?AUTO_3619 ?AUTO_3618 ) ( CLEAR ?AUTO_3619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3619 ?AUTO_3618 )
      ( MAKE-ON ?AUTO_3615 ?AUTO_3616 )
      ( MAKE-ON-VERIFY ?AUTO_3615 ?AUTO_3616 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3620 - BLOCK
      ?AUTO_3621 - BLOCK
    )
    :vars
    (
      ?AUTO_3623 - BLOCK
      ?AUTO_3622 - BLOCK
      ?AUTO_3624 - BLOCK
      ?AUTO_3625 - BLOCK
      ?AUTO_3626 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3621 ) ( not ( = ?AUTO_3620 ?AUTO_3621 ) ) ( ON ?AUTO_3620 ?AUTO_3623 ) ( not ( = ?AUTO_3620 ?AUTO_3623 ) ) ( not ( = ?AUTO_3621 ?AUTO_3623 ) ) ( not ( = ?AUTO_3620 ?AUTO_3622 ) ) ( not ( = ?AUTO_3621 ?AUTO_3622 ) ) ( not ( = ?AUTO_3623 ?AUTO_3622 ) ) ( ON ?AUTO_3622 ?AUTO_3620 ) ( not ( = ?AUTO_3620 ?AUTO_3624 ) ) ( not ( = ?AUTO_3621 ?AUTO_3624 ) ) ( not ( = ?AUTO_3623 ?AUTO_3624 ) ) ( not ( = ?AUTO_3622 ?AUTO_3624 ) ) ( ON ?AUTO_3624 ?AUTO_3622 ) ( CLEAR ?AUTO_3624 ) ( HOLDING ?AUTO_3625 ) ( CLEAR ?AUTO_3626 ) ( not ( = ?AUTO_3620 ?AUTO_3625 ) ) ( not ( = ?AUTO_3620 ?AUTO_3626 ) ) ( not ( = ?AUTO_3621 ?AUTO_3625 ) ) ( not ( = ?AUTO_3621 ?AUTO_3626 ) ) ( not ( = ?AUTO_3623 ?AUTO_3625 ) ) ( not ( = ?AUTO_3623 ?AUTO_3626 ) ) ( not ( = ?AUTO_3622 ?AUTO_3625 ) ) ( not ( = ?AUTO_3622 ?AUTO_3626 ) ) ( not ( = ?AUTO_3624 ?AUTO_3625 ) ) ( not ( = ?AUTO_3624 ?AUTO_3626 ) ) ( not ( = ?AUTO_3625 ?AUTO_3626 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3625 ?AUTO_3626 )
      ( MAKE-ON ?AUTO_3620 ?AUTO_3621 )
      ( MAKE-ON-VERIFY ?AUTO_3620 ?AUTO_3621 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3627 - BLOCK
      ?AUTO_3628 - BLOCK
    )
    :vars
    (
      ?AUTO_3629 - BLOCK
      ?AUTO_3630 - BLOCK
      ?AUTO_3632 - BLOCK
      ?AUTO_3633 - BLOCK
      ?AUTO_3631 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3628 ) ( not ( = ?AUTO_3627 ?AUTO_3628 ) ) ( ON ?AUTO_3627 ?AUTO_3629 ) ( not ( = ?AUTO_3627 ?AUTO_3629 ) ) ( not ( = ?AUTO_3628 ?AUTO_3629 ) ) ( not ( = ?AUTO_3627 ?AUTO_3630 ) ) ( not ( = ?AUTO_3628 ?AUTO_3630 ) ) ( not ( = ?AUTO_3629 ?AUTO_3630 ) ) ( ON ?AUTO_3630 ?AUTO_3627 ) ( not ( = ?AUTO_3627 ?AUTO_3632 ) ) ( not ( = ?AUTO_3628 ?AUTO_3632 ) ) ( not ( = ?AUTO_3629 ?AUTO_3632 ) ) ( not ( = ?AUTO_3630 ?AUTO_3632 ) ) ( ON ?AUTO_3632 ?AUTO_3630 ) ( CLEAR ?AUTO_3633 ) ( not ( = ?AUTO_3627 ?AUTO_3631 ) ) ( not ( = ?AUTO_3627 ?AUTO_3633 ) ) ( not ( = ?AUTO_3628 ?AUTO_3631 ) ) ( not ( = ?AUTO_3628 ?AUTO_3633 ) ) ( not ( = ?AUTO_3629 ?AUTO_3631 ) ) ( not ( = ?AUTO_3629 ?AUTO_3633 ) ) ( not ( = ?AUTO_3630 ?AUTO_3631 ) ) ( not ( = ?AUTO_3630 ?AUTO_3633 ) ) ( not ( = ?AUTO_3632 ?AUTO_3631 ) ) ( not ( = ?AUTO_3632 ?AUTO_3633 ) ) ( not ( = ?AUTO_3631 ?AUTO_3633 ) ) ( ON ?AUTO_3631 ?AUTO_3632 ) ( CLEAR ?AUTO_3631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3631 ?AUTO_3632 )
      ( MAKE-ON ?AUTO_3627 ?AUTO_3628 )
      ( MAKE-ON-VERIFY ?AUTO_3627 ?AUTO_3628 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3634 - BLOCK
      ?AUTO_3635 - BLOCK
    )
    :vars
    (
      ?AUTO_3640 - BLOCK
      ?AUTO_3639 - BLOCK
      ?AUTO_3638 - BLOCK
      ?AUTO_3637 - BLOCK
      ?AUTO_3636 - BLOCK
      ?AUTO_3641 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3635 ) ( not ( = ?AUTO_3634 ?AUTO_3635 ) ) ( ON ?AUTO_3634 ?AUTO_3640 ) ( not ( = ?AUTO_3634 ?AUTO_3640 ) ) ( not ( = ?AUTO_3635 ?AUTO_3640 ) ) ( not ( = ?AUTO_3634 ?AUTO_3639 ) ) ( not ( = ?AUTO_3635 ?AUTO_3639 ) ) ( not ( = ?AUTO_3640 ?AUTO_3639 ) ) ( ON ?AUTO_3639 ?AUTO_3634 ) ( not ( = ?AUTO_3634 ?AUTO_3638 ) ) ( not ( = ?AUTO_3635 ?AUTO_3638 ) ) ( not ( = ?AUTO_3640 ?AUTO_3638 ) ) ( not ( = ?AUTO_3639 ?AUTO_3638 ) ) ( ON ?AUTO_3638 ?AUTO_3639 ) ( not ( = ?AUTO_3634 ?AUTO_3637 ) ) ( not ( = ?AUTO_3634 ?AUTO_3636 ) ) ( not ( = ?AUTO_3635 ?AUTO_3637 ) ) ( not ( = ?AUTO_3635 ?AUTO_3636 ) ) ( not ( = ?AUTO_3640 ?AUTO_3637 ) ) ( not ( = ?AUTO_3640 ?AUTO_3636 ) ) ( not ( = ?AUTO_3639 ?AUTO_3637 ) ) ( not ( = ?AUTO_3639 ?AUTO_3636 ) ) ( not ( = ?AUTO_3638 ?AUTO_3637 ) ) ( not ( = ?AUTO_3638 ?AUTO_3636 ) ) ( not ( = ?AUTO_3637 ?AUTO_3636 ) ) ( ON ?AUTO_3637 ?AUTO_3638 ) ( CLEAR ?AUTO_3637 ) ( HOLDING ?AUTO_3636 ) ( CLEAR ?AUTO_3641 ) ( not ( = ?AUTO_3634 ?AUTO_3641 ) ) ( not ( = ?AUTO_3635 ?AUTO_3641 ) ) ( not ( = ?AUTO_3640 ?AUTO_3641 ) ) ( not ( = ?AUTO_3639 ?AUTO_3641 ) ) ( not ( = ?AUTO_3638 ?AUTO_3641 ) ) ( not ( = ?AUTO_3637 ?AUTO_3641 ) ) ( not ( = ?AUTO_3636 ?AUTO_3641 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3636 ?AUTO_3641 )
      ( MAKE-ON ?AUTO_3634 ?AUTO_3635 )
      ( MAKE-ON-VERIFY ?AUTO_3634 ?AUTO_3635 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3648 - BLOCK
      ?AUTO_3649 - BLOCK
    )
    :vars
    (
      ?AUTO_3652 - BLOCK
      ?AUTO_3651 - BLOCK
      ?AUTO_3654 - BLOCK
      ?AUTO_3650 - BLOCK
      ?AUTO_3653 - BLOCK
      ?AUTO_3655 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3648 ?AUTO_3649 ) ) ( ON ?AUTO_3648 ?AUTO_3652 ) ( not ( = ?AUTO_3648 ?AUTO_3652 ) ) ( not ( = ?AUTO_3649 ?AUTO_3652 ) ) ( not ( = ?AUTO_3648 ?AUTO_3651 ) ) ( not ( = ?AUTO_3649 ?AUTO_3651 ) ) ( not ( = ?AUTO_3652 ?AUTO_3651 ) ) ( ON ?AUTO_3651 ?AUTO_3648 ) ( not ( = ?AUTO_3648 ?AUTO_3654 ) ) ( not ( = ?AUTO_3649 ?AUTO_3654 ) ) ( not ( = ?AUTO_3652 ?AUTO_3654 ) ) ( not ( = ?AUTO_3651 ?AUTO_3654 ) ) ( ON ?AUTO_3654 ?AUTO_3651 ) ( CLEAR ?AUTO_3650 ) ( not ( = ?AUTO_3648 ?AUTO_3653 ) ) ( not ( = ?AUTO_3648 ?AUTO_3650 ) ) ( not ( = ?AUTO_3649 ?AUTO_3653 ) ) ( not ( = ?AUTO_3649 ?AUTO_3650 ) ) ( not ( = ?AUTO_3652 ?AUTO_3653 ) ) ( not ( = ?AUTO_3652 ?AUTO_3650 ) ) ( not ( = ?AUTO_3651 ?AUTO_3653 ) ) ( not ( = ?AUTO_3651 ?AUTO_3650 ) ) ( not ( = ?AUTO_3654 ?AUTO_3653 ) ) ( not ( = ?AUTO_3654 ?AUTO_3650 ) ) ( not ( = ?AUTO_3653 ?AUTO_3650 ) ) ( ON ?AUTO_3653 ?AUTO_3654 ) ( CLEAR ?AUTO_3653 ) ( HOLDING ?AUTO_3649 ) ( CLEAR ?AUTO_3655 ) ( not ( = ?AUTO_3648 ?AUTO_3655 ) ) ( not ( = ?AUTO_3649 ?AUTO_3655 ) ) ( not ( = ?AUTO_3652 ?AUTO_3655 ) ) ( not ( = ?AUTO_3651 ?AUTO_3655 ) ) ( not ( = ?AUTO_3654 ?AUTO_3655 ) ) ( not ( = ?AUTO_3650 ?AUTO_3655 ) ) ( not ( = ?AUTO_3653 ?AUTO_3655 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3649 ?AUTO_3655 )
      ( MAKE-ON ?AUTO_3648 ?AUTO_3649 )
      ( MAKE-ON-VERIFY ?AUTO_3648 ?AUTO_3649 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3664 - BLOCK
      ?AUTO_3665 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3664 ) ( CLEAR ?AUTO_3665 ) ( not ( = ?AUTO_3664 ?AUTO_3665 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3664 ?AUTO_3665 )
      ( MAKE-ON-VERIFY ?AUTO_3664 ?AUTO_3665 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3666 - BLOCK
      ?AUTO_3667 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3667 ) ( not ( = ?AUTO_3666 ?AUTO_3667 ) ) ( ON-TABLE ?AUTO_3666 ) ( CLEAR ?AUTO_3666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3666 )
      ( MAKE-ON ?AUTO_3666 ?AUTO_3667 )
      ( MAKE-ON-VERIFY ?AUTO_3666 ?AUTO_3667 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3668 - BLOCK
      ?AUTO_3669 - BLOCK
    )
    :vars
    (
      ?AUTO_3670 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3668 ?AUTO_3669 ) ) ( ON-TABLE ?AUTO_3668 ) ( CLEAR ?AUTO_3668 ) ( HOLDING ?AUTO_3669 ) ( CLEAR ?AUTO_3670 ) ( not ( = ?AUTO_3668 ?AUTO_3670 ) ) ( not ( = ?AUTO_3669 ?AUTO_3670 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3669 ?AUTO_3670 )
      ( MAKE-ON ?AUTO_3668 ?AUTO_3669 )
      ( MAKE-ON-VERIFY ?AUTO_3668 ?AUTO_3669 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3757 - BLOCK
      ?AUTO_3758 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3757 ) ( CLEAR ?AUTO_3758 ) ( not ( = ?AUTO_3757 ?AUTO_3758 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3757 ?AUTO_3758 )
      ( MAKE-ON-VERIFY ?AUTO_3757 ?AUTO_3758 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3759 - BLOCK
      ?AUTO_3760 - BLOCK
    )
    :vars
    (
      ?AUTO_3761 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3760 ) ( not ( = ?AUTO_3759 ?AUTO_3760 ) ) ( ON ?AUTO_3759 ?AUTO_3761 ) ( CLEAR ?AUTO_3759 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3759 ?AUTO_3761 ) ) ( not ( = ?AUTO_3760 ?AUTO_3761 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3759 ?AUTO_3761 )
      ( MAKE-ON ?AUTO_3759 ?AUTO_3760 )
      ( MAKE-ON-VERIFY ?AUTO_3759 ?AUTO_3760 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3762 - BLOCK
      ?AUTO_3763 - BLOCK
    )
    :vars
    (
      ?AUTO_3764 - BLOCK
      ?AUTO_3765 - BLOCK
      ?AUTO_3766 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3763 ) ( not ( = ?AUTO_3762 ?AUTO_3763 ) ) ( ON ?AUTO_3762 ?AUTO_3764 ) ( CLEAR ?AUTO_3762 ) ( not ( = ?AUTO_3762 ?AUTO_3764 ) ) ( not ( = ?AUTO_3763 ?AUTO_3764 ) ) ( HOLDING ?AUTO_3765 ) ( CLEAR ?AUTO_3766 ) ( not ( = ?AUTO_3762 ?AUTO_3765 ) ) ( not ( = ?AUTO_3762 ?AUTO_3766 ) ) ( not ( = ?AUTO_3763 ?AUTO_3765 ) ) ( not ( = ?AUTO_3763 ?AUTO_3766 ) ) ( not ( = ?AUTO_3764 ?AUTO_3765 ) ) ( not ( = ?AUTO_3764 ?AUTO_3766 ) ) ( not ( = ?AUTO_3765 ?AUTO_3766 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3765 ?AUTO_3766 )
      ( MAKE-ON ?AUTO_3762 ?AUTO_3763 )
      ( MAKE-ON-VERIFY ?AUTO_3762 ?AUTO_3763 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3771 - BLOCK
      ?AUTO_3772 - BLOCK
    )
    :vars
    (
      ?AUTO_3775 - BLOCK
      ?AUTO_3774 - BLOCK
      ?AUTO_3773 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3771 ?AUTO_3772 ) ) ( ON ?AUTO_3771 ?AUTO_3775 ) ( CLEAR ?AUTO_3771 ) ( not ( = ?AUTO_3771 ?AUTO_3775 ) ) ( not ( = ?AUTO_3772 ?AUTO_3775 ) ) ( CLEAR ?AUTO_3774 ) ( not ( = ?AUTO_3771 ?AUTO_3773 ) ) ( not ( = ?AUTO_3771 ?AUTO_3774 ) ) ( not ( = ?AUTO_3772 ?AUTO_3773 ) ) ( not ( = ?AUTO_3772 ?AUTO_3774 ) ) ( not ( = ?AUTO_3775 ?AUTO_3773 ) ) ( not ( = ?AUTO_3775 ?AUTO_3774 ) ) ( not ( = ?AUTO_3773 ?AUTO_3774 ) ) ( ON ?AUTO_3773 ?AUTO_3772 ) ( CLEAR ?AUTO_3773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3773 ?AUTO_3772 )
      ( MAKE-ON ?AUTO_3771 ?AUTO_3772 )
      ( MAKE-ON-VERIFY ?AUTO_3771 ?AUTO_3772 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3776 - BLOCK
      ?AUTO_3777 - BLOCK
    )
    :vars
    (
      ?AUTO_3780 - BLOCK
      ?AUTO_3778 - BLOCK
      ?AUTO_3779 - BLOCK
      ?AUTO_3781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3776 ?AUTO_3777 ) ) ( ON ?AUTO_3776 ?AUTO_3780 ) ( CLEAR ?AUTO_3776 ) ( not ( = ?AUTO_3776 ?AUTO_3780 ) ) ( not ( = ?AUTO_3777 ?AUTO_3780 ) ) ( CLEAR ?AUTO_3778 ) ( not ( = ?AUTO_3776 ?AUTO_3779 ) ) ( not ( = ?AUTO_3776 ?AUTO_3778 ) ) ( not ( = ?AUTO_3777 ?AUTO_3779 ) ) ( not ( = ?AUTO_3777 ?AUTO_3778 ) ) ( not ( = ?AUTO_3780 ?AUTO_3779 ) ) ( not ( = ?AUTO_3780 ?AUTO_3778 ) ) ( not ( = ?AUTO_3779 ?AUTO_3778 ) ) ( ON ?AUTO_3779 ?AUTO_3777 ) ( CLEAR ?AUTO_3779 ) ( HOLDING ?AUTO_3781 ) ( not ( = ?AUTO_3776 ?AUTO_3781 ) ) ( not ( = ?AUTO_3777 ?AUTO_3781 ) ) ( not ( = ?AUTO_3780 ?AUTO_3781 ) ) ( not ( = ?AUTO_3778 ?AUTO_3781 ) ) ( not ( = ?AUTO_3779 ?AUTO_3781 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3781 )
      ( MAKE-ON ?AUTO_3776 ?AUTO_3777 )
      ( MAKE-ON-VERIFY ?AUTO_3776 ?AUTO_3777 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3782 - BLOCK
      ?AUTO_3783 - BLOCK
    )
    :vars
    (
      ?AUTO_3786 - BLOCK
      ?AUTO_3784 - BLOCK
      ?AUTO_3785 - BLOCK
      ?AUTO_3787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3782 ?AUTO_3783 ) ) ( ON ?AUTO_3782 ?AUTO_3786 ) ( CLEAR ?AUTO_3782 ) ( not ( = ?AUTO_3782 ?AUTO_3786 ) ) ( not ( = ?AUTO_3783 ?AUTO_3786 ) ) ( CLEAR ?AUTO_3784 ) ( not ( = ?AUTO_3782 ?AUTO_3785 ) ) ( not ( = ?AUTO_3782 ?AUTO_3784 ) ) ( not ( = ?AUTO_3783 ?AUTO_3785 ) ) ( not ( = ?AUTO_3783 ?AUTO_3784 ) ) ( not ( = ?AUTO_3786 ?AUTO_3785 ) ) ( not ( = ?AUTO_3786 ?AUTO_3784 ) ) ( not ( = ?AUTO_3785 ?AUTO_3784 ) ) ( ON ?AUTO_3785 ?AUTO_3783 ) ( not ( = ?AUTO_3782 ?AUTO_3787 ) ) ( not ( = ?AUTO_3783 ?AUTO_3787 ) ) ( not ( = ?AUTO_3786 ?AUTO_3787 ) ) ( not ( = ?AUTO_3784 ?AUTO_3787 ) ) ( not ( = ?AUTO_3785 ?AUTO_3787 ) ) ( ON ?AUTO_3787 ?AUTO_3785 ) ( CLEAR ?AUTO_3787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3787 ?AUTO_3785 )
      ( MAKE-ON ?AUTO_3782 ?AUTO_3783 )
      ( MAKE-ON-VERIFY ?AUTO_3782 ?AUTO_3783 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3788 - BLOCK
      ?AUTO_3789 - BLOCK
    )
    :vars
    (
      ?AUTO_3792 - BLOCK
      ?AUTO_3791 - BLOCK
      ?AUTO_3793 - BLOCK
      ?AUTO_3790 - BLOCK
      ?AUTO_3794 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3788 ?AUTO_3789 ) ) ( ON ?AUTO_3788 ?AUTO_3792 ) ( CLEAR ?AUTO_3788 ) ( not ( = ?AUTO_3788 ?AUTO_3792 ) ) ( not ( = ?AUTO_3789 ?AUTO_3792 ) ) ( CLEAR ?AUTO_3791 ) ( not ( = ?AUTO_3788 ?AUTO_3793 ) ) ( not ( = ?AUTO_3788 ?AUTO_3791 ) ) ( not ( = ?AUTO_3789 ?AUTO_3793 ) ) ( not ( = ?AUTO_3789 ?AUTO_3791 ) ) ( not ( = ?AUTO_3792 ?AUTO_3793 ) ) ( not ( = ?AUTO_3792 ?AUTO_3791 ) ) ( not ( = ?AUTO_3793 ?AUTO_3791 ) ) ( ON ?AUTO_3793 ?AUTO_3789 ) ( not ( = ?AUTO_3788 ?AUTO_3790 ) ) ( not ( = ?AUTO_3789 ?AUTO_3790 ) ) ( not ( = ?AUTO_3792 ?AUTO_3790 ) ) ( not ( = ?AUTO_3791 ?AUTO_3790 ) ) ( not ( = ?AUTO_3793 ?AUTO_3790 ) ) ( ON ?AUTO_3790 ?AUTO_3793 ) ( CLEAR ?AUTO_3790 ) ( HOLDING ?AUTO_3794 ) ( not ( = ?AUTO_3788 ?AUTO_3794 ) ) ( not ( = ?AUTO_3789 ?AUTO_3794 ) ) ( not ( = ?AUTO_3792 ?AUTO_3794 ) ) ( not ( = ?AUTO_3791 ?AUTO_3794 ) ) ( not ( = ?AUTO_3793 ?AUTO_3794 ) ) ( not ( = ?AUTO_3790 ?AUTO_3794 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3794 )
      ( MAKE-ON ?AUTO_3788 ?AUTO_3789 )
      ( MAKE-ON-VERIFY ?AUTO_3788 ?AUTO_3789 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3795 - BLOCK
      ?AUTO_3796 - BLOCK
    )
    :vars
    (
      ?AUTO_3801 - BLOCK
      ?AUTO_3798 - BLOCK
      ?AUTO_3797 - BLOCK
      ?AUTO_3799 - BLOCK
      ?AUTO_3800 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3795 ?AUTO_3796 ) ) ( ON ?AUTO_3795 ?AUTO_3801 ) ( CLEAR ?AUTO_3795 ) ( not ( = ?AUTO_3795 ?AUTO_3801 ) ) ( not ( = ?AUTO_3796 ?AUTO_3801 ) ) ( CLEAR ?AUTO_3798 ) ( not ( = ?AUTO_3795 ?AUTO_3797 ) ) ( not ( = ?AUTO_3795 ?AUTO_3798 ) ) ( not ( = ?AUTO_3796 ?AUTO_3797 ) ) ( not ( = ?AUTO_3796 ?AUTO_3798 ) ) ( not ( = ?AUTO_3801 ?AUTO_3797 ) ) ( not ( = ?AUTO_3801 ?AUTO_3798 ) ) ( not ( = ?AUTO_3797 ?AUTO_3798 ) ) ( ON ?AUTO_3797 ?AUTO_3796 ) ( not ( = ?AUTO_3795 ?AUTO_3799 ) ) ( not ( = ?AUTO_3796 ?AUTO_3799 ) ) ( not ( = ?AUTO_3801 ?AUTO_3799 ) ) ( not ( = ?AUTO_3798 ?AUTO_3799 ) ) ( not ( = ?AUTO_3797 ?AUTO_3799 ) ) ( ON ?AUTO_3799 ?AUTO_3797 ) ( not ( = ?AUTO_3795 ?AUTO_3800 ) ) ( not ( = ?AUTO_3796 ?AUTO_3800 ) ) ( not ( = ?AUTO_3801 ?AUTO_3800 ) ) ( not ( = ?AUTO_3798 ?AUTO_3800 ) ) ( not ( = ?AUTO_3797 ?AUTO_3800 ) ) ( not ( = ?AUTO_3799 ?AUTO_3800 ) ) ( ON ?AUTO_3800 ?AUTO_3799 ) ( CLEAR ?AUTO_3800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3800 ?AUTO_3799 )
      ( MAKE-ON ?AUTO_3795 ?AUTO_3796 )
      ( MAKE-ON-VERIFY ?AUTO_3795 ?AUTO_3796 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3802 - BLOCK
      ?AUTO_3803 - BLOCK
    )
    :vars
    (
      ?AUTO_3807 - BLOCK
      ?AUTO_3805 - BLOCK
      ?AUTO_3804 - BLOCK
      ?AUTO_3806 - BLOCK
      ?AUTO_3808 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3802 ?AUTO_3803 ) ) ( not ( = ?AUTO_3802 ?AUTO_3807 ) ) ( not ( = ?AUTO_3803 ?AUTO_3807 ) ) ( CLEAR ?AUTO_3805 ) ( not ( = ?AUTO_3802 ?AUTO_3804 ) ) ( not ( = ?AUTO_3802 ?AUTO_3805 ) ) ( not ( = ?AUTO_3803 ?AUTO_3804 ) ) ( not ( = ?AUTO_3803 ?AUTO_3805 ) ) ( not ( = ?AUTO_3807 ?AUTO_3804 ) ) ( not ( = ?AUTO_3807 ?AUTO_3805 ) ) ( not ( = ?AUTO_3804 ?AUTO_3805 ) ) ( ON ?AUTO_3804 ?AUTO_3803 ) ( not ( = ?AUTO_3802 ?AUTO_3806 ) ) ( not ( = ?AUTO_3803 ?AUTO_3806 ) ) ( not ( = ?AUTO_3807 ?AUTO_3806 ) ) ( not ( = ?AUTO_3805 ?AUTO_3806 ) ) ( not ( = ?AUTO_3804 ?AUTO_3806 ) ) ( ON ?AUTO_3806 ?AUTO_3804 ) ( not ( = ?AUTO_3802 ?AUTO_3808 ) ) ( not ( = ?AUTO_3803 ?AUTO_3808 ) ) ( not ( = ?AUTO_3807 ?AUTO_3808 ) ) ( not ( = ?AUTO_3805 ?AUTO_3808 ) ) ( not ( = ?AUTO_3804 ?AUTO_3808 ) ) ( not ( = ?AUTO_3806 ?AUTO_3808 ) ) ( ON ?AUTO_3808 ?AUTO_3806 ) ( CLEAR ?AUTO_3808 ) ( HOLDING ?AUTO_3802 ) ( CLEAR ?AUTO_3807 ) )
    :subtasks
    ( ( !STACK ?AUTO_3802 ?AUTO_3807 )
      ( MAKE-ON ?AUTO_3802 ?AUTO_3803 )
      ( MAKE-ON-VERIFY ?AUTO_3802 ?AUTO_3803 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3809 - BLOCK
      ?AUTO_3810 - BLOCK
    )
    :vars
    (
      ?AUTO_3813 - BLOCK
      ?AUTO_3812 - BLOCK
      ?AUTO_3815 - BLOCK
      ?AUTO_3814 - BLOCK
      ?AUTO_3811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3809 ?AUTO_3810 ) ) ( not ( = ?AUTO_3809 ?AUTO_3813 ) ) ( not ( = ?AUTO_3810 ?AUTO_3813 ) ) ( CLEAR ?AUTO_3812 ) ( not ( = ?AUTO_3809 ?AUTO_3815 ) ) ( not ( = ?AUTO_3809 ?AUTO_3812 ) ) ( not ( = ?AUTO_3810 ?AUTO_3815 ) ) ( not ( = ?AUTO_3810 ?AUTO_3812 ) ) ( not ( = ?AUTO_3813 ?AUTO_3815 ) ) ( not ( = ?AUTO_3813 ?AUTO_3812 ) ) ( not ( = ?AUTO_3815 ?AUTO_3812 ) ) ( ON ?AUTO_3815 ?AUTO_3810 ) ( not ( = ?AUTO_3809 ?AUTO_3814 ) ) ( not ( = ?AUTO_3810 ?AUTO_3814 ) ) ( not ( = ?AUTO_3813 ?AUTO_3814 ) ) ( not ( = ?AUTO_3812 ?AUTO_3814 ) ) ( not ( = ?AUTO_3815 ?AUTO_3814 ) ) ( ON ?AUTO_3814 ?AUTO_3815 ) ( not ( = ?AUTO_3809 ?AUTO_3811 ) ) ( not ( = ?AUTO_3810 ?AUTO_3811 ) ) ( not ( = ?AUTO_3813 ?AUTO_3811 ) ) ( not ( = ?AUTO_3812 ?AUTO_3811 ) ) ( not ( = ?AUTO_3815 ?AUTO_3811 ) ) ( not ( = ?AUTO_3814 ?AUTO_3811 ) ) ( ON ?AUTO_3811 ?AUTO_3814 ) ( CLEAR ?AUTO_3813 ) ( ON ?AUTO_3809 ?AUTO_3811 ) ( CLEAR ?AUTO_3809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3809 ?AUTO_3811 )
      ( MAKE-ON ?AUTO_3809 ?AUTO_3810 )
      ( MAKE-ON-VERIFY ?AUTO_3809 ?AUTO_3810 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3816 - BLOCK
      ?AUTO_3817 - BLOCK
    )
    :vars
    (
      ?AUTO_3820 - BLOCK
      ?AUTO_3818 - BLOCK
      ?AUTO_3821 - BLOCK
      ?AUTO_3822 - BLOCK
      ?AUTO_3819 - BLOCK
      ?AUTO_3823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3816 ?AUTO_3817 ) ) ( not ( = ?AUTO_3816 ?AUTO_3820 ) ) ( not ( = ?AUTO_3817 ?AUTO_3820 ) ) ( CLEAR ?AUTO_3818 ) ( not ( = ?AUTO_3816 ?AUTO_3821 ) ) ( not ( = ?AUTO_3816 ?AUTO_3818 ) ) ( not ( = ?AUTO_3817 ?AUTO_3821 ) ) ( not ( = ?AUTO_3817 ?AUTO_3818 ) ) ( not ( = ?AUTO_3820 ?AUTO_3821 ) ) ( not ( = ?AUTO_3820 ?AUTO_3818 ) ) ( not ( = ?AUTO_3821 ?AUTO_3818 ) ) ( ON ?AUTO_3821 ?AUTO_3817 ) ( not ( = ?AUTO_3816 ?AUTO_3822 ) ) ( not ( = ?AUTO_3817 ?AUTO_3822 ) ) ( not ( = ?AUTO_3820 ?AUTO_3822 ) ) ( not ( = ?AUTO_3818 ?AUTO_3822 ) ) ( not ( = ?AUTO_3821 ?AUTO_3822 ) ) ( ON ?AUTO_3822 ?AUTO_3821 ) ( not ( = ?AUTO_3816 ?AUTO_3819 ) ) ( not ( = ?AUTO_3817 ?AUTO_3819 ) ) ( not ( = ?AUTO_3820 ?AUTO_3819 ) ) ( not ( = ?AUTO_3818 ?AUTO_3819 ) ) ( not ( = ?AUTO_3821 ?AUTO_3819 ) ) ( not ( = ?AUTO_3822 ?AUTO_3819 ) ) ( ON ?AUTO_3819 ?AUTO_3822 ) ( ON ?AUTO_3816 ?AUTO_3819 ) ( CLEAR ?AUTO_3816 ) ( HOLDING ?AUTO_3820 ) ( CLEAR ?AUTO_3823 ) ( not ( = ?AUTO_3816 ?AUTO_3823 ) ) ( not ( = ?AUTO_3817 ?AUTO_3823 ) ) ( not ( = ?AUTO_3820 ?AUTO_3823 ) ) ( not ( = ?AUTO_3818 ?AUTO_3823 ) ) ( not ( = ?AUTO_3821 ?AUTO_3823 ) ) ( not ( = ?AUTO_3822 ?AUTO_3823 ) ) ( not ( = ?AUTO_3819 ?AUTO_3823 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3820 ?AUTO_3823 )
      ( MAKE-ON ?AUTO_3816 ?AUTO_3817 )
      ( MAKE-ON-VERIFY ?AUTO_3816 ?AUTO_3817 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3840 - BLOCK
      ?AUTO_3841 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3840 ) ( CLEAR ?AUTO_3841 ) ( not ( = ?AUTO_3840 ?AUTO_3841 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3840 ?AUTO_3841 )
      ( MAKE-ON-VERIFY ?AUTO_3840 ?AUTO_3841 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3842 - BLOCK
      ?AUTO_3843 - BLOCK
    )
    :vars
    (
      ?AUTO_3844 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3843 ) ( not ( = ?AUTO_3842 ?AUTO_3843 ) ) ( ON ?AUTO_3842 ?AUTO_3844 ) ( CLEAR ?AUTO_3842 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3842 ?AUTO_3844 ) ) ( not ( = ?AUTO_3843 ?AUTO_3844 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3842 ?AUTO_3844 )
      ( MAKE-ON ?AUTO_3842 ?AUTO_3843 )
      ( MAKE-ON-VERIFY ?AUTO_3842 ?AUTO_3843 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3845 - BLOCK
      ?AUTO_3846 - BLOCK
    )
    :vars
    (
      ?AUTO_3847 - BLOCK
      ?AUTO_3848 - BLOCK
      ?AUTO_3849 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3846 ) ( not ( = ?AUTO_3845 ?AUTO_3846 ) ) ( ON ?AUTO_3845 ?AUTO_3847 ) ( CLEAR ?AUTO_3845 ) ( not ( = ?AUTO_3845 ?AUTO_3847 ) ) ( not ( = ?AUTO_3846 ?AUTO_3847 ) ) ( HOLDING ?AUTO_3848 ) ( CLEAR ?AUTO_3849 ) ( not ( = ?AUTO_3845 ?AUTO_3848 ) ) ( not ( = ?AUTO_3845 ?AUTO_3849 ) ) ( not ( = ?AUTO_3846 ?AUTO_3848 ) ) ( not ( = ?AUTO_3846 ?AUTO_3849 ) ) ( not ( = ?AUTO_3847 ?AUTO_3848 ) ) ( not ( = ?AUTO_3847 ?AUTO_3849 ) ) ( not ( = ?AUTO_3848 ?AUTO_3849 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3848 ?AUTO_3849 )
      ( MAKE-ON ?AUTO_3845 ?AUTO_3846 )
      ( MAKE-ON-VERIFY ?AUTO_3845 ?AUTO_3846 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3850 - BLOCK
      ?AUTO_3851 - BLOCK
    )
    :vars
    (
      ?AUTO_3852 - BLOCK
      ?AUTO_3853 - BLOCK
      ?AUTO_3854 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3851 ) ( not ( = ?AUTO_3850 ?AUTO_3851 ) ) ( ON ?AUTO_3850 ?AUTO_3852 ) ( not ( = ?AUTO_3850 ?AUTO_3852 ) ) ( not ( = ?AUTO_3851 ?AUTO_3852 ) ) ( CLEAR ?AUTO_3853 ) ( not ( = ?AUTO_3850 ?AUTO_3854 ) ) ( not ( = ?AUTO_3850 ?AUTO_3853 ) ) ( not ( = ?AUTO_3851 ?AUTO_3854 ) ) ( not ( = ?AUTO_3851 ?AUTO_3853 ) ) ( not ( = ?AUTO_3852 ?AUTO_3854 ) ) ( not ( = ?AUTO_3852 ?AUTO_3853 ) ) ( not ( = ?AUTO_3854 ?AUTO_3853 ) ) ( ON ?AUTO_3854 ?AUTO_3850 ) ( CLEAR ?AUTO_3854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3854 ?AUTO_3850 )
      ( MAKE-ON ?AUTO_3850 ?AUTO_3851 )
      ( MAKE-ON-VERIFY ?AUTO_3850 ?AUTO_3851 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3855 - BLOCK
      ?AUTO_3856 - BLOCK
    )
    :vars
    (
      ?AUTO_3857 - BLOCK
      ?AUTO_3859 - BLOCK
      ?AUTO_3858 - BLOCK
      ?AUTO_3860 - BLOCK
      ?AUTO_3861 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3856 ) ( not ( = ?AUTO_3855 ?AUTO_3856 ) ) ( ON ?AUTO_3855 ?AUTO_3857 ) ( not ( = ?AUTO_3855 ?AUTO_3857 ) ) ( not ( = ?AUTO_3856 ?AUTO_3857 ) ) ( CLEAR ?AUTO_3859 ) ( not ( = ?AUTO_3855 ?AUTO_3858 ) ) ( not ( = ?AUTO_3855 ?AUTO_3859 ) ) ( not ( = ?AUTO_3856 ?AUTO_3858 ) ) ( not ( = ?AUTO_3856 ?AUTO_3859 ) ) ( not ( = ?AUTO_3857 ?AUTO_3858 ) ) ( not ( = ?AUTO_3857 ?AUTO_3859 ) ) ( not ( = ?AUTO_3858 ?AUTO_3859 ) ) ( ON ?AUTO_3858 ?AUTO_3855 ) ( CLEAR ?AUTO_3858 ) ( HOLDING ?AUTO_3860 ) ( CLEAR ?AUTO_3861 ) ( not ( = ?AUTO_3855 ?AUTO_3860 ) ) ( not ( = ?AUTO_3855 ?AUTO_3861 ) ) ( not ( = ?AUTO_3856 ?AUTO_3860 ) ) ( not ( = ?AUTO_3856 ?AUTO_3861 ) ) ( not ( = ?AUTO_3857 ?AUTO_3860 ) ) ( not ( = ?AUTO_3857 ?AUTO_3861 ) ) ( not ( = ?AUTO_3859 ?AUTO_3860 ) ) ( not ( = ?AUTO_3859 ?AUTO_3861 ) ) ( not ( = ?AUTO_3858 ?AUTO_3860 ) ) ( not ( = ?AUTO_3858 ?AUTO_3861 ) ) ( not ( = ?AUTO_3860 ?AUTO_3861 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3860 ?AUTO_3861 )
      ( MAKE-ON ?AUTO_3855 ?AUTO_3856 )
      ( MAKE-ON-VERIFY ?AUTO_3855 ?AUTO_3856 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3872 - BLOCK
      ?AUTO_3873 - BLOCK
    )
    :vars
    (
      ?AUTO_3875 - BLOCK
      ?AUTO_3876 - BLOCK
      ?AUTO_3874 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3872 ?AUTO_3873 ) ) ( ON ?AUTO_3872 ?AUTO_3875 ) ( not ( = ?AUTO_3872 ?AUTO_3875 ) ) ( not ( = ?AUTO_3873 ?AUTO_3875 ) ) ( CLEAR ?AUTO_3876 ) ( not ( = ?AUTO_3872 ?AUTO_3874 ) ) ( not ( = ?AUTO_3872 ?AUTO_3876 ) ) ( not ( = ?AUTO_3873 ?AUTO_3874 ) ) ( not ( = ?AUTO_3873 ?AUTO_3876 ) ) ( not ( = ?AUTO_3875 ?AUTO_3874 ) ) ( not ( = ?AUTO_3875 ?AUTO_3876 ) ) ( not ( = ?AUTO_3874 ?AUTO_3876 ) ) ( ON ?AUTO_3874 ?AUTO_3872 ) ( CLEAR ?AUTO_3874 ) ( HOLDING ?AUTO_3873 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3873 )
      ( MAKE-ON ?AUTO_3872 ?AUTO_3873 )
      ( MAKE-ON-VERIFY ?AUTO_3872 ?AUTO_3873 ) )
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
      ?AUTO_3887 - BLOCK
      ?AUTO_3886 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3883 ?AUTO_3884 ) ) ( not ( = ?AUTO_3883 ?AUTO_3885 ) ) ( not ( = ?AUTO_3884 ?AUTO_3885 ) ) ( CLEAR ?AUTO_3887 ) ( not ( = ?AUTO_3883 ?AUTO_3886 ) ) ( not ( = ?AUTO_3883 ?AUTO_3887 ) ) ( not ( = ?AUTO_3884 ?AUTO_3886 ) ) ( not ( = ?AUTO_3884 ?AUTO_3887 ) ) ( not ( = ?AUTO_3885 ?AUTO_3886 ) ) ( not ( = ?AUTO_3885 ?AUTO_3887 ) ) ( not ( = ?AUTO_3886 ?AUTO_3887 ) ) ( ON ?AUTO_3886 ?AUTO_3884 ) ( CLEAR ?AUTO_3886 ) ( HOLDING ?AUTO_3883 ) ( CLEAR ?AUTO_3885 ) )
    :subtasks
    ( ( !STACK ?AUTO_3883 ?AUTO_3885 )
      ( MAKE-ON ?AUTO_3883 ?AUTO_3884 )
      ( MAKE-ON-VERIFY ?AUTO_3883 ?AUTO_3884 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3888 - BLOCK
      ?AUTO_3889 - BLOCK
    )
    :vars
    (
      ?AUTO_3891 - BLOCK
      ?AUTO_3892 - BLOCK
      ?AUTO_3890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3888 ?AUTO_3889 ) ) ( not ( = ?AUTO_3888 ?AUTO_3891 ) ) ( not ( = ?AUTO_3889 ?AUTO_3891 ) ) ( CLEAR ?AUTO_3892 ) ( not ( = ?AUTO_3888 ?AUTO_3890 ) ) ( not ( = ?AUTO_3888 ?AUTO_3892 ) ) ( not ( = ?AUTO_3889 ?AUTO_3890 ) ) ( not ( = ?AUTO_3889 ?AUTO_3892 ) ) ( not ( = ?AUTO_3891 ?AUTO_3890 ) ) ( not ( = ?AUTO_3891 ?AUTO_3892 ) ) ( not ( = ?AUTO_3890 ?AUTO_3892 ) ) ( ON ?AUTO_3890 ?AUTO_3889 ) ( CLEAR ?AUTO_3890 ) ( CLEAR ?AUTO_3891 ) ( ON-TABLE ?AUTO_3888 ) ( CLEAR ?AUTO_3888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3888 )
      ( MAKE-ON ?AUTO_3888 ?AUTO_3889 )
      ( MAKE-ON-VERIFY ?AUTO_3888 ?AUTO_3889 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3893 - BLOCK
      ?AUTO_3894 - BLOCK
    )
    :vars
    (
      ?AUTO_3896 - BLOCK
      ?AUTO_3897 - BLOCK
      ?AUTO_3895 - BLOCK
      ?AUTO_3898 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3893 ?AUTO_3894 ) ) ( not ( = ?AUTO_3893 ?AUTO_3896 ) ) ( not ( = ?AUTO_3894 ?AUTO_3896 ) ) ( CLEAR ?AUTO_3897 ) ( not ( = ?AUTO_3893 ?AUTO_3895 ) ) ( not ( = ?AUTO_3893 ?AUTO_3897 ) ) ( not ( = ?AUTO_3894 ?AUTO_3895 ) ) ( not ( = ?AUTO_3894 ?AUTO_3897 ) ) ( not ( = ?AUTO_3896 ?AUTO_3895 ) ) ( not ( = ?AUTO_3896 ?AUTO_3897 ) ) ( not ( = ?AUTO_3895 ?AUTO_3897 ) ) ( ON ?AUTO_3895 ?AUTO_3894 ) ( CLEAR ?AUTO_3895 ) ( ON-TABLE ?AUTO_3893 ) ( CLEAR ?AUTO_3893 ) ( HOLDING ?AUTO_3896 ) ( CLEAR ?AUTO_3898 ) ( not ( = ?AUTO_3893 ?AUTO_3898 ) ) ( not ( = ?AUTO_3894 ?AUTO_3898 ) ) ( not ( = ?AUTO_3896 ?AUTO_3898 ) ) ( not ( = ?AUTO_3897 ?AUTO_3898 ) ) ( not ( = ?AUTO_3895 ?AUTO_3898 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3896 ?AUTO_3898 )
      ( MAKE-ON ?AUTO_3893 ?AUTO_3894 )
      ( MAKE-ON-VERIFY ?AUTO_3893 ?AUTO_3894 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3899 - BLOCK
      ?AUTO_3900 - BLOCK
    )
    :vars
    (
      ?AUTO_3904 - BLOCK
      ?AUTO_3901 - BLOCK
      ?AUTO_3902 - BLOCK
      ?AUTO_3903 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3899 ?AUTO_3900 ) ) ( not ( = ?AUTO_3899 ?AUTO_3904 ) ) ( not ( = ?AUTO_3900 ?AUTO_3904 ) ) ( CLEAR ?AUTO_3901 ) ( not ( = ?AUTO_3899 ?AUTO_3902 ) ) ( not ( = ?AUTO_3899 ?AUTO_3901 ) ) ( not ( = ?AUTO_3900 ?AUTO_3902 ) ) ( not ( = ?AUTO_3900 ?AUTO_3901 ) ) ( not ( = ?AUTO_3904 ?AUTO_3902 ) ) ( not ( = ?AUTO_3904 ?AUTO_3901 ) ) ( not ( = ?AUTO_3902 ?AUTO_3901 ) ) ( ON ?AUTO_3902 ?AUTO_3900 ) ( CLEAR ?AUTO_3902 ) ( ON-TABLE ?AUTO_3899 ) ( CLEAR ?AUTO_3903 ) ( not ( = ?AUTO_3899 ?AUTO_3903 ) ) ( not ( = ?AUTO_3900 ?AUTO_3903 ) ) ( not ( = ?AUTO_3904 ?AUTO_3903 ) ) ( not ( = ?AUTO_3901 ?AUTO_3903 ) ) ( not ( = ?AUTO_3902 ?AUTO_3903 ) ) ( ON ?AUTO_3904 ?AUTO_3899 ) ( CLEAR ?AUTO_3904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3904 ?AUTO_3899 )
      ( MAKE-ON ?AUTO_3899 ?AUTO_3900 )
      ( MAKE-ON-VERIFY ?AUTO_3899 ?AUTO_3900 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3905 - BLOCK
      ?AUTO_3906 - BLOCK
    )
    :vars
    (
      ?AUTO_3907 - BLOCK
      ?AUTO_3910 - BLOCK
      ?AUTO_3909 - BLOCK
      ?AUTO_3908 - BLOCK
      ?AUTO_3911 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3905 ?AUTO_3906 ) ) ( not ( = ?AUTO_3905 ?AUTO_3907 ) ) ( not ( = ?AUTO_3906 ?AUTO_3907 ) ) ( not ( = ?AUTO_3905 ?AUTO_3910 ) ) ( not ( = ?AUTO_3905 ?AUTO_3909 ) ) ( not ( = ?AUTO_3906 ?AUTO_3910 ) ) ( not ( = ?AUTO_3906 ?AUTO_3909 ) ) ( not ( = ?AUTO_3907 ?AUTO_3910 ) ) ( not ( = ?AUTO_3907 ?AUTO_3909 ) ) ( not ( = ?AUTO_3910 ?AUTO_3909 ) ) ( ON ?AUTO_3910 ?AUTO_3906 ) ( CLEAR ?AUTO_3910 ) ( ON-TABLE ?AUTO_3905 ) ( CLEAR ?AUTO_3908 ) ( not ( = ?AUTO_3905 ?AUTO_3908 ) ) ( not ( = ?AUTO_3906 ?AUTO_3908 ) ) ( not ( = ?AUTO_3907 ?AUTO_3908 ) ) ( not ( = ?AUTO_3909 ?AUTO_3908 ) ) ( not ( = ?AUTO_3910 ?AUTO_3908 ) ) ( ON ?AUTO_3907 ?AUTO_3905 ) ( CLEAR ?AUTO_3907 ) ( HOLDING ?AUTO_3909 ) ( CLEAR ?AUTO_3911 ) ( not ( = ?AUTO_3905 ?AUTO_3911 ) ) ( not ( = ?AUTO_3906 ?AUTO_3911 ) ) ( not ( = ?AUTO_3907 ?AUTO_3911 ) ) ( not ( = ?AUTO_3910 ?AUTO_3911 ) ) ( not ( = ?AUTO_3909 ?AUTO_3911 ) ) ( not ( = ?AUTO_3908 ?AUTO_3911 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3909 ?AUTO_3911 )
      ( MAKE-ON ?AUTO_3905 ?AUTO_3906 )
      ( MAKE-ON-VERIFY ?AUTO_3905 ?AUTO_3906 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3916 - BLOCK
      ?AUTO_3917 - BLOCK
    )
    :vars
    (
      ?AUTO_3921 - BLOCK
      ?AUTO_3922 - BLOCK
      ?AUTO_3919 - BLOCK
      ?AUTO_3920 - BLOCK
      ?AUTO_3918 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3916 ?AUTO_3917 ) ) ( not ( = ?AUTO_3916 ?AUTO_3921 ) ) ( not ( = ?AUTO_3917 ?AUTO_3921 ) ) ( not ( = ?AUTO_3916 ?AUTO_3922 ) ) ( not ( = ?AUTO_3916 ?AUTO_3919 ) ) ( not ( = ?AUTO_3917 ?AUTO_3922 ) ) ( not ( = ?AUTO_3917 ?AUTO_3919 ) ) ( not ( = ?AUTO_3921 ?AUTO_3922 ) ) ( not ( = ?AUTO_3921 ?AUTO_3919 ) ) ( not ( = ?AUTO_3922 ?AUTO_3919 ) ) ( ON ?AUTO_3922 ?AUTO_3917 ) ( CLEAR ?AUTO_3922 ) ( ON-TABLE ?AUTO_3916 ) ( CLEAR ?AUTO_3920 ) ( not ( = ?AUTO_3916 ?AUTO_3920 ) ) ( not ( = ?AUTO_3917 ?AUTO_3920 ) ) ( not ( = ?AUTO_3921 ?AUTO_3920 ) ) ( not ( = ?AUTO_3919 ?AUTO_3920 ) ) ( not ( = ?AUTO_3922 ?AUTO_3920 ) ) ( ON ?AUTO_3921 ?AUTO_3916 ) ( CLEAR ?AUTO_3918 ) ( not ( = ?AUTO_3916 ?AUTO_3918 ) ) ( not ( = ?AUTO_3917 ?AUTO_3918 ) ) ( not ( = ?AUTO_3921 ?AUTO_3918 ) ) ( not ( = ?AUTO_3922 ?AUTO_3918 ) ) ( not ( = ?AUTO_3919 ?AUTO_3918 ) ) ( not ( = ?AUTO_3920 ?AUTO_3918 ) ) ( ON ?AUTO_3919 ?AUTO_3921 ) ( CLEAR ?AUTO_3919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3919 ?AUTO_3921 )
      ( MAKE-ON ?AUTO_3916 ?AUTO_3917 )
      ( MAKE-ON-VERIFY ?AUTO_3916 ?AUTO_3917 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3925 - BLOCK
      ?AUTO_3926 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3925 ) ( CLEAR ?AUTO_3926 ) ( not ( = ?AUTO_3925 ?AUTO_3926 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3925 ?AUTO_3926 )
      ( MAKE-ON-VERIFY ?AUTO_3925 ?AUTO_3926 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3927 - BLOCK
      ?AUTO_3928 - BLOCK
    )
    :vars
    (
      ?AUTO_3929 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3928 ) ( not ( = ?AUTO_3927 ?AUTO_3928 ) ) ( ON ?AUTO_3927 ?AUTO_3929 ) ( CLEAR ?AUTO_3927 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3927 ?AUTO_3929 ) ) ( not ( = ?AUTO_3928 ?AUTO_3929 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3927 ?AUTO_3929 )
      ( MAKE-ON ?AUTO_3927 ?AUTO_3928 )
      ( MAKE-ON-VERIFY ?AUTO_3927 ?AUTO_3928 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3930 - BLOCK
      ?AUTO_3931 - BLOCK
    )
    :vars
    (
      ?AUTO_3932 - BLOCK
      ?AUTO_3933 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3930 ?AUTO_3931 ) ) ( ON ?AUTO_3930 ?AUTO_3932 ) ( CLEAR ?AUTO_3930 ) ( not ( = ?AUTO_3930 ?AUTO_3932 ) ) ( not ( = ?AUTO_3931 ?AUTO_3932 ) ) ( HOLDING ?AUTO_3931 ) ( CLEAR ?AUTO_3933 ) ( not ( = ?AUTO_3930 ?AUTO_3933 ) ) ( not ( = ?AUTO_3931 ?AUTO_3933 ) ) ( not ( = ?AUTO_3932 ?AUTO_3933 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3931 ?AUTO_3933 )
      ( MAKE-ON ?AUTO_3930 ?AUTO_3931 )
      ( MAKE-ON-VERIFY ?AUTO_3930 ?AUTO_3931 ) )
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
      ?AUTO_4012 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4009 ?AUTO_4010 ) ( CLEAR ?AUTO_4009 ) ( not ( = ?AUTO_4009 ?AUTO_4010 ) ) ( HOLDING ?AUTO_4011 ) ( CLEAR ?AUTO_4012 ) ( not ( = ?AUTO_4009 ?AUTO_4011 ) ) ( not ( = ?AUTO_4009 ?AUTO_4012 ) ) ( not ( = ?AUTO_4010 ?AUTO_4011 ) ) ( not ( = ?AUTO_4010 ?AUTO_4012 ) ) ( not ( = ?AUTO_4011 ?AUTO_4012 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4011 ?AUTO_4012 )
      ( MAKE-ON-TABLE ?AUTO_4009 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4009 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4015 - BLOCK
    )
    :vars
    (
      ?AUTO_4018 - BLOCK
      ?AUTO_4016 - BLOCK
      ?AUTO_4017 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4015 ?AUTO_4018 ) ( not ( = ?AUTO_4015 ?AUTO_4018 ) ) ( CLEAR ?AUTO_4016 ) ( not ( = ?AUTO_4015 ?AUTO_4017 ) ) ( not ( = ?AUTO_4015 ?AUTO_4016 ) ) ( not ( = ?AUTO_4018 ?AUTO_4017 ) ) ( not ( = ?AUTO_4018 ?AUTO_4016 ) ) ( not ( = ?AUTO_4017 ?AUTO_4016 ) ) ( ON ?AUTO_4017 ?AUTO_4015 ) ( CLEAR ?AUTO_4017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4017 ?AUTO_4015 )
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
      ?AUTO_4022 - BLOCK
      ?AUTO_4021 - BLOCK
      ?AUTO_4020 - BLOCK
      ?AUTO_4023 - BLOCK
      ?AUTO_4024 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4019 ?AUTO_4022 ) ( not ( = ?AUTO_4019 ?AUTO_4022 ) ) ( CLEAR ?AUTO_4021 ) ( not ( = ?AUTO_4019 ?AUTO_4020 ) ) ( not ( = ?AUTO_4019 ?AUTO_4021 ) ) ( not ( = ?AUTO_4022 ?AUTO_4020 ) ) ( not ( = ?AUTO_4022 ?AUTO_4021 ) ) ( not ( = ?AUTO_4020 ?AUTO_4021 ) ) ( ON ?AUTO_4020 ?AUTO_4019 ) ( CLEAR ?AUTO_4020 ) ( HOLDING ?AUTO_4023 ) ( CLEAR ?AUTO_4024 ) ( not ( = ?AUTO_4019 ?AUTO_4023 ) ) ( not ( = ?AUTO_4019 ?AUTO_4024 ) ) ( not ( = ?AUTO_4022 ?AUTO_4023 ) ) ( not ( = ?AUTO_4022 ?AUTO_4024 ) ) ( not ( = ?AUTO_4021 ?AUTO_4023 ) ) ( not ( = ?AUTO_4021 ?AUTO_4024 ) ) ( not ( = ?AUTO_4020 ?AUTO_4023 ) ) ( not ( = ?AUTO_4020 ?AUTO_4024 ) ) ( not ( = ?AUTO_4023 ?AUTO_4024 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4023 ?AUTO_4024 )
      ( MAKE-ON-TABLE ?AUTO_4019 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4019 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4025 - BLOCK
    )
    :vars
    (
      ?AUTO_4030 - BLOCK
      ?AUTO_4026 - BLOCK
      ?AUTO_4027 - BLOCK
      ?AUTO_4029 - BLOCK
      ?AUTO_4028 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4025 ?AUTO_4030 ) ( not ( = ?AUTO_4025 ?AUTO_4030 ) ) ( CLEAR ?AUTO_4026 ) ( not ( = ?AUTO_4025 ?AUTO_4027 ) ) ( not ( = ?AUTO_4025 ?AUTO_4026 ) ) ( not ( = ?AUTO_4030 ?AUTO_4027 ) ) ( not ( = ?AUTO_4030 ?AUTO_4026 ) ) ( not ( = ?AUTO_4027 ?AUTO_4026 ) ) ( ON ?AUTO_4027 ?AUTO_4025 ) ( CLEAR ?AUTO_4029 ) ( not ( = ?AUTO_4025 ?AUTO_4028 ) ) ( not ( = ?AUTO_4025 ?AUTO_4029 ) ) ( not ( = ?AUTO_4030 ?AUTO_4028 ) ) ( not ( = ?AUTO_4030 ?AUTO_4029 ) ) ( not ( = ?AUTO_4026 ?AUTO_4028 ) ) ( not ( = ?AUTO_4026 ?AUTO_4029 ) ) ( not ( = ?AUTO_4027 ?AUTO_4028 ) ) ( not ( = ?AUTO_4027 ?AUTO_4029 ) ) ( not ( = ?AUTO_4028 ?AUTO_4029 ) ) ( ON ?AUTO_4028 ?AUTO_4027 ) ( CLEAR ?AUTO_4028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4028 ?AUTO_4027 )
      ( MAKE-ON-TABLE ?AUTO_4025 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4025 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4031 - BLOCK
    )
    :vars
    (
      ?AUTO_4036 - BLOCK
      ?AUTO_4032 - BLOCK
      ?AUTO_4033 - BLOCK
      ?AUTO_4035 - BLOCK
      ?AUTO_4034 - BLOCK
      ?AUTO_4037 - BLOCK
      ?AUTO_4038 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4031 ?AUTO_4036 ) ( not ( = ?AUTO_4031 ?AUTO_4036 ) ) ( CLEAR ?AUTO_4032 ) ( not ( = ?AUTO_4031 ?AUTO_4033 ) ) ( not ( = ?AUTO_4031 ?AUTO_4032 ) ) ( not ( = ?AUTO_4036 ?AUTO_4033 ) ) ( not ( = ?AUTO_4036 ?AUTO_4032 ) ) ( not ( = ?AUTO_4033 ?AUTO_4032 ) ) ( ON ?AUTO_4033 ?AUTO_4031 ) ( CLEAR ?AUTO_4035 ) ( not ( = ?AUTO_4031 ?AUTO_4034 ) ) ( not ( = ?AUTO_4031 ?AUTO_4035 ) ) ( not ( = ?AUTO_4036 ?AUTO_4034 ) ) ( not ( = ?AUTO_4036 ?AUTO_4035 ) ) ( not ( = ?AUTO_4032 ?AUTO_4034 ) ) ( not ( = ?AUTO_4032 ?AUTO_4035 ) ) ( not ( = ?AUTO_4033 ?AUTO_4034 ) ) ( not ( = ?AUTO_4033 ?AUTO_4035 ) ) ( not ( = ?AUTO_4034 ?AUTO_4035 ) ) ( ON ?AUTO_4034 ?AUTO_4033 ) ( CLEAR ?AUTO_4034 ) ( HOLDING ?AUTO_4037 ) ( CLEAR ?AUTO_4038 ) ( not ( = ?AUTO_4031 ?AUTO_4037 ) ) ( not ( = ?AUTO_4031 ?AUTO_4038 ) ) ( not ( = ?AUTO_4036 ?AUTO_4037 ) ) ( not ( = ?AUTO_4036 ?AUTO_4038 ) ) ( not ( = ?AUTO_4032 ?AUTO_4037 ) ) ( not ( = ?AUTO_4032 ?AUTO_4038 ) ) ( not ( = ?AUTO_4033 ?AUTO_4037 ) ) ( not ( = ?AUTO_4033 ?AUTO_4038 ) ) ( not ( = ?AUTO_4035 ?AUTO_4037 ) ) ( not ( = ?AUTO_4035 ?AUTO_4038 ) ) ( not ( = ?AUTO_4034 ?AUTO_4037 ) ) ( not ( = ?AUTO_4034 ?AUTO_4038 ) ) ( not ( = ?AUTO_4037 ?AUTO_4038 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4037 ?AUTO_4038 )
      ( MAKE-ON-TABLE ?AUTO_4031 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4031 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4044 - BLOCK
    )
    :vars
    (
      ?AUTO_4046 - BLOCK
      ?AUTO_4049 - BLOCK
      ?AUTO_4047 - BLOCK
      ?AUTO_4045 - BLOCK
      ?AUTO_4048 - BLOCK
      ?AUTO_4050 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4044 ?AUTO_4046 ) ( not ( = ?AUTO_4044 ?AUTO_4046 ) ) ( CLEAR ?AUTO_4049 ) ( not ( = ?AUTO_4044 ?AUTO_4047 ) ) ( not ( = ?AUTO_4044 ?AUTO_4049 ) ) ( not ( = ?AUTO_4046 ?AUTO_4047 ) ) ( not ( = ?AUTO_4046 ?AUTO_4049 ) ) ( not ( = ?AUTO_4047 ?AUTO_4049 ) ) ( ON ?AUTO_4047 ?AUTO_4044 ) ( CLEAR ?AUTO_4045 ) ( not ( = ?AUTO_4044 ?AUTO_4048 ) ) ( not ( = ?AUTO_4044 ?AUTO_4045 ) ) ( not ( = ?AUTO_4046 ?AUTO_4048 ) ) ( not ( = ?AUTO_4046 ?AUTO_4045 ) ) ( not ( = ?AUTO_4049 ?AUTO_4048 ) ) ( not ( = ?AUTO_4049 ?AUTO_4045 ) ) ( not ( = ?AUTO_4047 ?AUTO_4048 ) ) ( not ( = ?AUTO_4047 ?AUTO_4045 ) ) ( not ( = ?AUTO_4048 ?AUTO_4045 ) ) ( ON ?AUTO_4048 ?AUTO_4047 ) ( CLEAR ?AUTO_4048 ) ( HOLDING ?AUTO_4050 ) ( not ( = ?AUTO_4044 ?AUTO_4050 ) ) ( not ( = ?AUTO_4046 ?AUTO_4050 ) ) ( not ( = ?AUTO_4049 ?AUTO_4050 ) ) ( not ( = ?AUTO_4047 ?AUTO_4050 ) ) ( not ( = ?AUTO_4045 ?AUTO_4050 ) ) ( not ( = ?AUTO_4048 ?AUTO_4050 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4050 )
      ( MAKE-ON-TABLE ?AUTO_4044 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4044 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4064 - BLOCK
      ?AUTO_4065 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4064 ) ( CLEAR ?AUTO_4065 ) ( not ( = ?AUTO_4064 ?AUTO_4065 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4064 ?AUTO_4065 )
      ( MAKE-ON-VERIFY ?AUTO_4064 ?AUTO_4065 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4066 - BLOCK
      ?AUTO_4067 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4067 ) ( not ( = ?AUTO_4066 ?AUTO_4067 ) ) ( ON-TABLE ?AUTO_4066 ) ( CLEAR ?AUTO_4066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4066 )
      ( MAKE-ON ?AUTO_4066 ?AUTO_4067 )
      ( MAKE-ON-VERIFY ?AUTO_4066 ?AUTO_4067 ) )
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
    )
    :precondition
    ( and ( CLEAR ?AUTO_4069 ) ( not ( = ?AUTO_4068 ?AUTO_4069 ) ) ( ON-TABLE ?AUTO_4068 ) ( CLEAR ?AUTO_4068 ) ( HOLDING ?AUTO_4070 ) ( not ( = ?AUTO_4068 ?AUTO_4070 ) ) ( not ( = ?AUTO_4069 ?AUTO_4070 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4070 )
      ( MAKE-ON ?AUTO_4068 ?AUTO_4069 )
      ( MAKE-ON-VERIFY ?AUTO_4068 ?AUTO_4069 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4071 - BLOCK
      ?AUTO_4072 - BLOCK
    )
    :vars
    (
      ?AUTO_4073 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4072 ) ( not ( = ?AUTO_4071 ?AUTO_4072 ) ) ( ON-TABLE ?AUTO_4071 ) ( not ( = ?AUTO_4071 ?AUTO_4073 ) ) ( not ( = ?AUTO_4072 ?AUTO_4073 ) ) ( ON ?AUTO_4073 ?AUTO_4071 ) ( CLEAR ?AUTO_4073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4073 ?AUTO_4071 )
      ( MAKE-ON ?AUTO_4071 ?AUTO_4072 )
      ( MAKE-ON-VERIFY ?AUTO_4071 ?AUTO_4072 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4074 - BLOCK
      ?AUTO_4075 - BLOCK
    )
    :vars
    (
      ?AUTO_4076 - BLOCK
      ?AUTO_4077 - BLOCK
      ?AUTO_4078 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4075 ) ( not ( = ?AUTO_4074 ?AUTO_4075 ) ) ( ON-TABLE ?AUTO_4074 ) ( not ( = ?AUTO_4074 ?AUTO_4076 ) ) ( not ( = ?AUTO_4075 ?AUTO_4076 ) ) ( ON ?AUTO_4076 ?AUTO_4074 ) ( CLEAR ?AUTO_4076 ) ( HOLDING ?AUTO_4077 ) ( CLEAR ?AUTO_4078 ) ( not ( = ?AUTO_4074 ?AUTO_4077 ) ) ( not ( = ?AUTO_4074 ?AUTO_4078 ) ) ( not ( = ?AUTO_4075 ?AUTO_4077 ) ) ( not ( = ?AUTO_4075 ?AUTO_4078 ) ) ( not ( = ?AUTO_4076 ?AUTO_4077 ) ) ( not ( = ?AUTO_4076 ?AUTO_4078 ) ) ( not ( = ?AUTO_4077 ?AUTO_4078 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4077 ?AUTO_4078 )
      ( MAKE-ON ?AUTO_4074 ?AUTO_4075 )
      ( MAKE-ON-VERIFY ?AUTO_4074 ?AUTO_4075 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4079 - BLOCK
      ?AUTO_4080 - BLOCK
    )
    :vars
    (
      ?AUTO_4081 - BLOCK
      ?AUTO_4083 - BLOCK
      ?AUTO_4082 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4079 ?AUTO_4080 ) ) ( ON-TABLE ?AUTO_4079 ) ( not ( = ?AUTO_4079 ?AUTO_4081 ) ) ( not ( = ?AUTO_4080 ?AUTO_4081 ) ) ( ON ?AUTO_4081 ?AUTO_4079 ) ( CLEAR ?AUTO_4081 ) ( CLEAR ?AUTO_4083 ) ( not ( = ?AUTO_4079 ?AUTO_4082 ) ) ( not ( = ?AUTO_4079 ?AUTO_4083 ) ) ( not ( = ?AUTO_4080 ?AUTO_4082 ) ) ( not ( = ?AUTO_4080 ?AUTO_4083 ) ) ( not ( = ?AUTO_4081 ?AUTO_4082 ) ) ( not ( = ?AUTO_4081 ?AUTO_4083 ) ) ( not ( = ?AUTO_4082 ?AUTO_4083 ) ) ( ON ?AUTO_4082 ?AUTO_4080 ) ( CLEAR ?AUTO_4082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4082 ?AUTO_4080 )
      ( MAKE-ON ?AUTO_4079 ?AUTO_4080 )
      ( MAKE-ON-VERIFY ?AUTO_4079 ?AUTO_4080 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4084 - BLOCK
      ?AUTO_4085 - BLOCK
    )
    :vars
    (
      ?AUTO_4087 - BLOCK
      ?AUTO_4088 - BLOCK
      ?AUTO_4086 - BLOCK
      ?AUTO_4089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4084 ?AUTO_4085 ) ) ( ON-TABLE ?AUTO_4084 ) ( not ( = ?AUTO_4084 ?AUTO_4087 ) ) ( not ( = ?AUTO_4085 ?AUTO_4087 ) ) ( ON ?AUTO_4087 ?AUTO_4084 ) ( CLEAR ?AUTO_4087 ) ( not ( = ?AUTO_4084 ?AUTO_4088 ) ) ( not ( = ?AUTO_4084 ?AUTO_4086 ) ) ( not ( = ?AUTO_4085 ?AUTO_4088 ) ) ( not ( = ?AUTO_4085 ?AUTO_4086 ) ) ( not ( = ?AUTO_4087 ?AUTO_4088 ) ) ( not ( = ?AUTO_4087 ?AUTO_4086 ) ) ( not ( = ?AUTO_4088 ?AUTO_4086 ) ) ( ON ?AUTO_4088 ?AUTO_4085 ) ( CLEAR ?AUTO_4088 ) ( HOLDING ?AUTO_4086 ) ( CLEAR ?AUTO_4089 ) ( not ( = ?AUTO_4084 ?AUTO_4089 ) ) ( not ( = ?AUTO_4085 ?AUTO_4089 ) ) ( not ( = ?AUTO_4087 ?AUTO_4089 ) ) ( not ( = ?AUTO_4088 ?AUTO_4089 ) ) ( not ( = ?AUTO_4086 ?AUTO_4089 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4086 ?AUTO_4089 )
      ( MAKE-ON ?AUTO_4084 ?AUTO_4085 )
      ( MAKE-ON-VERIFY ?AUTO_4084 ?AUTO_4085 ) )
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
      ?AUTO_4095 - BLOCK
      ?AUTO_4093 - BLOCK
      ?AUTO_4094 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4090 ?AUTO_4091 ) ) ( ON-TABLE ?AUTO_4090 ) ( not ( = ?AUTO_4090 ?AUTO_4092 ) ) ( not ( = ?AUTO_4091 ?AUTO_4092 ) ) ( ON ?AUTO_4092 ?AUTO_4090 ) ( not ( = ?AUTO_4090 ?AUTO_4095 ) ) ( not ( = ?AUTO_4090 ?AUTO_4093 ) ) ( not ( = ?AUTO_4091 ?AUTO_4095 ) ) ( not ( = ?AUTO_4091 ?AUTO_4093 ) ) ( not ( = ?AUTO_4092 ?AUTO_4095 ) ) ( not ( = ?AUTO_4092 ?AUTO_4093 ) ) ( not ( = ?AUTO_4095 ?AUTO_4093 ) ) ( ON ?AUTO_4095 ?AUTO_4091 ) ( CLEAR ?AUTO_4095 ) ( CLEAR ?AUTO_4094 ) ( not ( = ?AUTO_4090 ?AUTO_4094 ) ) ( not ( = ?AUTO_4091 ?AUTO_4094 ) ) ( not ( = ?AUTO_4092 ?AUTO_4094 ) ) ( not ( = ?AUTO_4095 ?AUTO_4094 ) ) ( not ( = ?AUTO_4093 ?AUTO_4094 ) ) ( ON ?AUTO_4093 ?AUTO_4092 ) ( CLEAR ?AUTO_4093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4093 ?AUTO_4092 )
      ( MAKE-ON ?AUTO_4090 ?AUTO_4091 )
      ( MAKE-ON-VERIFY ?AUTO_4090 ?AUTO_4091 ) )
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
      ?AUTO_4100 - BLOCK
      ?AUTO_4101 - BLOCK
      ?AUTO_4099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4096 ?AUTO_4097 ) ) ( ON-TABLE ?AUTO_4096 ) ( not ( = ?AUTO_4096 ?AUTO_4098 ) ) ( not ( = ?AUTO_4097 ?AUTO_4098 ) ) ( ON ?AUTO_4098 ?AUTO_4096 ) ( not ( = ?AUTO_4096 ?AUTO_4100 ) ) ( not ( = ?AUTO_4096 ?AUTO_4101 ) ) ( not ( = ?AUTO_4097 ?AUTO_4100 ) ) ( not ( = ?AUTO_4097 ?AUTO_4101 ) ) ( not ( = ?AUTO_4098 ?AUTO_4100 ) ) ( not ( = ?AUTO_4098 ?AUTO_4101 ) ) ( not ( = ?AUTO_4100 ?AUTO_4101 ) ) ( CLEAR ?AUTO_4099 ) ( not ( = ?AUTO_4096 ?AUTO_4099 ) ) ( not ( = ?AUTO_4097 ?AUTO_4099 ) ) ( not ( = ?AUTO_4098 ?AUTO_4099 ) ) ( not ( = ?AUTO_4100 ?AUTO_4099 ) ) ( not ( = ?AUTO_4101 ?AUTO_4099 ) ) ( ON ?AUTO_4101 ?AUTO_4098 ) ( CLEAR ?AUTO_4101 ) ( HOLDING ?AUTO_4100 ) ( CLEAR ?AUTO_4097 ) )
    :subtasks
    ( ( !STACK ?AUTO_4100 ?AUTO_4097 )
      ( MAKE-ON ?AUTO_4096 ?AUTO_4097 )
      ( MAKE-ON-VERIFY ?AUTO_4096 ?AUTO_4097 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4102 - BLOCK
      ?AUTO_4103 - BLOCK
    )
    :vars
    (
      ?AUTO_4105 - BLOCK
      ?AUTO_4107 - BLOCK
      ?AUTO_4106 - BLOCK
      ?AUTO_4104 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4102 ?AUTO_4103 ) ) ( ON-TABLE ?AUTO_4102 ) ( not ( = ?AUTO_4102 ?AUTO_4105 ) ) ( not ( = ?AUTO_4103 ?AUTO_4105 ) ) ( ON ?AUTO_4105 ?AUTO_4102 ) ( not ( = ?AUTO_4102 ?AUTO_4107 ) ) ( not ( = ?AUTO_4102 ?AUTO_4106 ) ) ( not ( = ?AUTO_4103 ?AUTO_4107 ) ) ( not ( = ?AUTO_4103 ?AUTO_4106 ) ) ( not ( = ?AUTO_4105 ?AUTO_4107 ) ) ( not ( = ?AUTO_4105 ?AUTO_4106 ) ) ( not ( = ?AUTO_4107 ?AUTO_4106 ) ) ( CLEAR ?AUTO_4104 ) ( not ( = ?AUTO_4102 ?AUTO_4104 ) ) ( not ( = ?AUTO_4103 ?AUTO_4104 ) ) ( not ( = ?AUTO_4105 ?AUTO_4104 ) ) ( not ( = ?AUTO_4107 ?AUTO_4104 ) ) ( not ( = ?AUTO_4106 ?AUTO_4104 ) ) ( ON ?AUTO_4106 ?AUTO_4105 ) ( CLEAR ?AUTO_4103 ) ( ON ?AUTO_4107 ?AUTO_4106 ) ( CLEAR ?AUTO_4107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4107 ?AUTO_4106 )
      ( MAKE-ON ?AUTO_4102 ?AUTO_4103 )
      ( MAKE-ON-VERIFY ?AUTO_4102 ?AUTO_4103 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4108 - BLOCK
      ?AUTO_4109 - BLOCK
    )
    :vars
    (
      ?AUTO_4112 - BLOCK
      ?AUTO_4113 - BLOCK
      ?AUTO_4111 - BLOCK
      ?AUTO_4110 - BLOCK
      ?AUTO_4114 - BLOCK
      ?AUTO_4115 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4108 ?AUTO_4109 ) ) ( ON-TABLE ?AUTO_4108 ) ( not ( = ?AUTO_4108 ?AUTO_4112 ) ) ( not ( = ?AUTO_4109 ?AUTO_4112 ) ) ( ON ?AUTO_4112 ?AUTO_4108 ) ( not ( = ?AUTO_4108 ?AUTO_4113 ) ) ( not ( = ?AUTO_4108 ?AUTO_4111 ) ) ( not ( = ?AUTO_4109 ?AUTO_4113 ) ) ( not ( = ?AUTO_4109 ?AUTO_4111 ) ) ( not ( = ?AUTO_4112 ?AUTO_4113 ) ) ( not ( = ?AUTO_4112 ?AUTO_4111 ) ) ( not ( = ?AUTO_4113 ?AUTO_4111 ) ) ( CLEAR ?AUTO_4110 ) ( not ( = ?AUTO_4108 ?AUTO_4110 ) ) ( not ( = ?AUTO_4109 ?AUTO_4110 ) ) ( not ( = ?AUTO_4112 ?AUTO_4110 ) ) ( not ( = ?AUTO_4113 ?AUTO_4110 ) ) ( not ( = ?AUTO_4111 ?AUTO_4110 ) ) ( ON ?AUTO_4111 ?AUTO_4112 ) ( CLEAR ?AUTO_4109 ) ( ON ?AUTO_4113 ?AUTO_4111 ) ( CLEAR ?AUTO_4113 ) ( HOLDING ?AUTO_4114 ) ( CLEAR ?AUTO_4115 ) ( not ( = ?AUTO_4108 ?AUTO_4114 ) ) ( not ( = ?AUTO_4108 ?AUTO_4115 ) ) ( not ( = ?AUTO_4109 ?AUTO_4114 ) ) ( not ( = ?AUTO_4109 ?AUTO_4115 ) ) ( not ( = ?AUTO_4112 ?AUTO_4114 ) ) ( not ( = ?AUTO_4112 ?AUTO_4115 ) ) ( not ( = ?AUTO_4113 ?AUTO_4114 ) ) ( not ( = ?AUTO_4113 ?AUTO_4115 ) ) ( not ( = ?AUTO_4111 ?AUTO_4114 ) ) ( not ( = ?AUTO_4111 ?AUTO_4115 ) ) ( not ( = ?AUTO_4110 ?AUTO_4114 ) ) ( not ( = ?AUTO_4110 ?AUTO_4115 ) ) ( not ( = ?AUTO_4114 ?AUTO_4115 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4114 ?AUTO_4115 )
      ( MAKE-ON ?AUTO_4108 ?AUTO_4109 )
      ( MAKE-ON-VERIFY ?AUTO_4108 ?AUTO_4109 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4120 - BLOCK
      ?AUTO_4121 - BLOCK
    )
    :vars
    (
      ?AUTO_4123 - BLOCK
      ?AUTO_4122 - BLOCK
      ?AUTO_4124 - BLOCK
      ?AUTO_4125 - BLOCK
      ?AUTO_4126 - BLOCK
      ?AUTO_4127 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4120 ?AUTO_4121 ) ) ( ON-TABLE ?AUTO_4120 ) ( not ( = ?AUTO_4120 ?AUTO_4123 ) ) ( not ( = ?AUTO_4121 ?AUTO_4123 ) ) ( ON ?AUTO_4123 ?AUTO_4120 ) ( not ( = ?AUTO_4120 ?AUTO_4122 ) ) ( not ( = ?AUTO_4120 ?AUTO_4124 ) ) ( not ( = ?AUTO_4121 ?AUTO_4122 ) ) ( not ( = ?AUTO_4121 ?AUTO_4124 ) ) ( not ( = ?AUTO_4123 ?AUTO_4122 ) ) ( not ( = ?AUTO_4123 ?AUTO_4124 ) ) ( not ( = ?AUTO_4122 ?AUTO_4124 ) ) ( CLEAR ?AUTO_4125 ) ( not ( = ?AUTO_4120 ?AUTO_4125 ) ) ( not ( = ?AUTO_4121 ?AUTO_4125 ) ) ( not ( = ?AUTO_4123 ?AUTO_4125 ) ) ( not ( = ?AUTO_4122 ?AUTO_4125 ) ) ( not ( = ?AUTO_4124 ?AUTO_4125 ) ) ( ON ?AUTO_4124 ?AUTO_4123 ) ( ON ?AUTO_4122 ?AUTO_4124 ) ( CLEAR ?AUTO_4122 ) ( CLEAR ?AUTO_4126 ) ( not ( = ?AUTO_4120 ?AUTO_4127 ) ) ( not ( = ?AUTO_4120 ?AUTO_4126 ) ) ( not ( = ?AUTO_4121 ?AUTO_4127 ) ) ( not ( = ?AUTO_4121 ?AUTO_4126 ) ) ( not ( = ?AUTO_4123 ?AUTO_4127 ) ) ( not ( = ?AUTO_4123 ?AUTO_4126 ) ) ( not ( = ?AUTO_4122 ?AUTO_4127 ) ) ( not ( = ?AUTO_4122 ?AUTO_4126 ) ) ( not ( = ?AUTO_4124 ?AUTO_4127 ) ) ( not ( = ?AUTO_4124 ?AUTO_4126 ) ) ( not ( = ?AUTO_4125 ?AUTO_4127 ) ) ( not ( = ?AUTO_4125 ?AUTO_4126 ) ) ( not ( = ?AUTO_4127 ?AUTO_4126 ) ) ( ON ?AUTO_4127 ?AUTO_4121 ) ( CLEAR ?AUTO_4127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4127 ?AUTO_4121 )
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
      ?AUTO_4135 - BLOCK
      ?AUTO_4130 - BLOCK
      ?AUTO_4132 - BLOCK
      ?AUTO_4134 - BLOCK
      ?AUTO_4133 - BLOCK
      ?AUTO_4131 - BLOCK
      ?AUTO_4136 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4128 ?AUTO_4129 ) ) ( ON-TABLE ?AUTO_4128 ) ( not ( = ?AUTO_4128 ?AUTO_4135 ) ) ( not ( = ?AUTO_4129 ?AUTO_4135 ) ) ( ON ?AUTO_4135 ?AUTO_4128 ) ( not ( = ?AUTO_4128 ?AUTO_4130 ) ) ( not ( = ?AUTO_4128 ?AUTO_4132 ) ) ( not ( = ?AUTO_4129 ?AUTO_4130 ) ) ( not ( = ?AUTO_4129 ?AUTO_4132 ) ) ( not ( = ?AUTO_4135 ?AUTO_4130 ) ) ( not ( = ?AUTO_4135 ?AUTO_4132 ) ) ( not ( = ?AUTO_4130 ?AUTO_4132 ) ) ( CLEAR ?AUTO_4134 ) ( not ( = ?AUTO_4128 ?AUTO_4134 ) ) ( not ( = ?AUTO_4129 ?AUTO_4134 ) ) ( not ( = ?AUTO_4135 ?AUTO_4134 ) ) ( not ( = ?AUTO_4130 ?AUTO_4134 ) ) ( not ( = ?AUTO_4132 ?AUTO_4134 ) ) ( ON ?AUTO_4132 ?AUTO_4135 ) ( ON ?AUTO_4130 ?AUTO_4132 ) ( CLEAR ?AUTO_4130 ) ( CLEAR ?AUTO_4133 ) ( not ( = ?AUTO_4128 ?AUTO_4131 ) ) ( not ( = ?AUTO_4128 ?AUTO_4133 ) ) ( not ( = ?AUTO_4129 ?AUTO_4131 ) ) ( not ( = ?AUTO_4129 ?AUTO_4133 ) ) ( not ( = ?AUTO_4135 ?AUTO_4131 ) ) ( not ( = ?AUTO_4135 ?AUTO_4133 ) ) ( not ( = ?AUTO_4130 ?AUTO_4131 ) ) ( not ( = ?AUTO_4130 ?AUTO_4133 ) ) ( not ( = ?AUTO_4132 ?AUTO_4131 ) ) ( not ( = ?AUTO_4132 ?AUTO_4133 ) ) ( not ( = ?AUTO_4134 ?AUTO_4131 ) ) ( not ( = ?AUTO_4134 ?AUTO_4133 ) ) ( not ( = ?AUTO_4131 ?AUTO_4133 ) ) ( ON ?AUTO_4131 ?AUTO_4129 ) ( CLEAR ?AUTO_4131 ) ( HOLDING ?AUTO_4136 ) ( not ( = ?AUTO_4128 ?AUTO_4136 ) ) ( not ( = ?AUTO_4129 ?AUTO_4136 ) ) ( not ( = ?AUTO_4135 ?AUTO_4136 ) ) ( not ( = ?AUTO_4130 ?AUTO_4136 ) ) ( not ( = ?AUTO_4132 ?AUTO_4136 ) ) ( not ( = ?AUTO_4134 ?AUTO_4136 ) ) ( not ( = ?AUTO_4133 ?AUTO_4136 ) ) ( not ( = ?AUTO_4131 ?AUTO_4136 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4136 )
      ( MAKE-ON ?AUTO_4128 ?AUTO_4129 )
      ( MAKE-ON-VERIFY ?AUTO_4128 ?AUTO_4129 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4137 - BLOCK
      ?AUTO_4138 - BLOCK
    )
    :vars
    (
      ?AUTO_4140 - BLOCK
      ?AUTO_4141 - BLOCK
      ?AUTO_4145 - BLOCK
      ?AUTO_4139 - BLOCK
      ?AUTO_4144 - BLOCK
      ?AUTO_4142 - BLOCK
      ?AUTO_4143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4137 ?AUTO_4138 ) ) ( ON-TABLE ?AUTO_4137 ) ( not ( = ?AUTO_4137 ?AUTO_4140 ) ) ( not ( = ?AUTO_4138 ?AUTO_4140 ) ) ( ON ?AUTO_4140 ?AUTO_4137 ) ( not ( = ?AUTO_4137 ?AUTO_4141 ) ) ( not ( = ?AUTO_4137 ?AUTO_4145 ) ) ( not ( = ?AUTO_4138 ?AUTO_4141 ) ) ( not ( = ?AUTO_4138 ?AUTO_4145 ) ) ( not ( = ?AUTO_4140 ?AUTO_4141 ) ) ( not ( = ?AUTO_4140 ?AUTO_4145 ) ) ( not ( = ?AUTO_4141 ?AUTO_4145 ) ) ( CLEAR ?AUTO_4139 ) ( not ( = ?AUTO_4137 ?AUTO_4139 ) ) ( not ( = ?AUTO_4138 ?AUTO_4139 ) ) ( not ( = ?AUTO_4140 ?AUTO_4139 ) ) ( not ( = ?AUTO_4141 ?AUTO_4139 ) ) ( not ( = ?AUTO_4145 ?AUTO_4139 ) ) ( ON ?AUTO_4145 ?AUTO_4140 ) ( ON ?AUTO_4141 ?AUTO_4145 ) ( CLEAR ?AUTO_4141 ) ( CLEAR ?AUTO_4144 ) ( not ( = ?AUTO_4137 ?AUTO_4142 ) ) ( not ( = ?AUTO_4137 ?AUTO_4144 ) ) ( not ( = ?AUTO_4138 ?AUTO_4142 ) ) ( not ( = ?AUTO_4138 ?AUTO_4144 ) ) ( not ( = ?AUTO_4140 ?AUTO_4142 ) ) ( not ( = ?AUTO_4140 ?AUTO_4144 ) ) ( not ( = ?AUTO_4141 ?AUTO_4142 ) ) ( not ( = ?AUTO_4141 ?AUTO_4144 ) ) ( not ( = ?AUTO_4145 ?AUTO_4142 ) ) ( not ( = ?AUTO_4145 ?AUTO_4144 ) ) ( not ( = ?AUTO_4139 ?AUTO_4142 ) ) ( not ( = ?AUTO_4139 ?AUTO_4144 ) ) ( not ( = ?AUTO_4142 ?AUTO_4144 ) ) ( ON ?AUTO_4142 ?AUTO_4138 ) ( not ( = ?AUTO_4137 ?AUTO_4143 ) ) ( not ( = ?AUTO_4138 ?AUTO_4143 ) ) ( not ( = ?AUTO_4140 ?AUTO_4143 ) ) ( not ( = ?AUTO_4141 ?AUTO_4143 ) ) ( not ( = ?AUTO_4145 ?AUTO_4143 ) ) ( not ( = ?AUTO_4139 ?AUTO_4143 ) ) ( not ( = ?AUTO_4144 ?AUTO_4143 ) ) ( not ( = ?AUTO_4142 ?AUTO_4143 ) ) ( ON ?AUTO_4143 ?AUTO_4142 ) ( CLEAR ?AUTO_4143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4143 ?AUTO_4142 )
      ( MAKE-ON ?AUTO_4137 ?AUTO_4138 )
      ( MAKE-ON-VERIFY ?AUTO_4137 ?AUTO_4138 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4146 - BLOCK
      ?AUTO_4147 - BLOCK
    )
    :vars
    (
      ?AUTO_4151 - BLOCK
      ?AUTO_4150 - BLOCK
      ?AUTO_4153 - BLOCK
      ?AUTO_4152 - BLOCK
      ?AUTO_4154 - BLOCK
      ?AUTO_4149 - BLOCK
      ?AUTO_4148 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4146 ?AUTO_4147 ) ) ( ON-TABLE ?AUTO_4146 ) ( not ( = ?AUTO_4146 ?AUTO_4151 ) ) ( not ( = ?AUTO_4147 ?AUTO_4151 ) ) ( ON ?AUTO_4151 ?AUTO_4146 ) ( not ( = ?AUTO_4146 ?AUTO_4150 ) ) ( not ( = ?AUTO_4146 ?AUTO_4153 ) ) ( not ( = ?AUTO_4147 ?AUTO_4150 ) ) ( not ( = ?AUTO_4147 ?AUTO_4153 ) ) ( not ( = ?AUTO_4151 ?AUTO_4150 ) ) ( not ( = ?AUTO_4151 ?AUTO_4153 ) ) ( not ( = ?AUTO_4150 ?AUTO_4153 ) ) ( not ( = ?AUTO_4146 ?AUTO_4152 ) ) ( not ( = ?AUTO_4147 ?AUTO_4152 ) ) ( not ( = ?AUTO_4151 ?AUTO_4152 ) ) ( not ( = ?AUTO_4150 ?AUTO_4152 ) ) ( not ( = ?AUTO_4153 ?AUTO_4152 ) ) ( ON ?AUTO_4153 ?AUTO_4151 ) ( ON ?AUTO_4150 ?AUTO_4153 ) ( CLEAR ?AUTO_4150 ) ( CLEAR ?AUTO_4154 ) ( not ( = ?AUTO_4146 ?AUTO_4149 ) ) ( not ( = ?AUTO_4146 ?AUTO_4154 ) ) ( not ( = ?AUTO_4147 ?AUTO_4149 ) ) ( not ( = ?AUTO_4147 ?AUTO_4154 ) ) ( not ( = ?AUTO_4151 ?AUTO_4149 ) ) ( not ( = ?AUTO_4151 ?AUTO_4154 ) ) ( not ( = ?AUTO_4150 ?AUTO_4149 ) ) ( not ( = ?AUTO_4150 ?AUTO_4154 ) ) ( not ( = ?AUTO_4153 ?AUTO_4149 ) ) ( not ( = ?AUTO_4153 ?AUTO_4154 ) ) ( not ( = ?AUTO_4152 ?AUTO_4149 ) ) ( not ( = ?AUTO_4152 ?AUTO_4154 ) ) ( not ( = ?AUTO_4149 ?AUTO_4154 ) ) ( ON ?AUTO_4149 ?AUTO_4147 ) ( not ( = ?AUTO_4146 ?AUTO_4148 ) ) ( not ( = ?AUTO_4147 ?AUTO_4148 ) ) ( not ( = ?AUTO_4151 ?AUTO_4148 ) ) ( not ( = ?AUTO_4150 ?AUTO_4148 ) ) ( not ( = ?AUTO_4153 ?AUTO_4148 ) ) ( not ( = ?AUTO_4152 ?AUTO_4148 ) ) ( not ( = ?AUTO_4154 ?AUTO_4148 ) ) ( not ( = ?AUTO_4149 ?AUTO_4148 ) ) ( ON ?AUTO_4148 ?AUTO_4149 ) ( CLEAR ?AUTO_4148 ) ( HOLDING ?AUTO_4152 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4152 )
      ( MAKE-ON ?AUTO_4146 ?AUTO_4147 )
      ( MAKE-ON-VERIFY ?AUTO_4146 ?AUTO_4147 ) )
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
      ?AUTO_4159 - BLOCK
      ?AUTO_4161 - BLOCK
      ?AUTO_4163 - BLOCK
      ?AUTO_4158 - BLOCK
      ?AUTO_4160 - BLOCK
      ?AUTO_4162 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4155 ?AUTO_4156 ) ) ( ON-TABLE ?AUTO_4155 ) ( not ( = ?AUTO_4155 ?AUTO_4157 ) ) ( not ( = ?AUTO_4156 ?AUTO_4157 ) ) ( ON ?AUTO_4157 ?AUTO_4155 ) ( not ( = ?AUTO_4155 ?AUTO_4159 ) ) ( not ( = ?AUTO_4155 ?AUTO_4161 ) ) ( not ( = ?AUTO_4156 ?AUTO_4159 ) ) ( not ( = ?AUTO_4156 ?AUTO_4161 ) ) ( not ( = ?AUTO_4157 ?AUTO_4159 ) ) ( not ( = ?AUTO_4157 ?AUTO_4161 ) ) ( not ( = ?AUTO_4159 ?AUTO_4161 ) ) ( not ( = ?AUTO_4155 ?AUTO_4163 ) ) ( not ( = ?AUTO_4156 ?AUTO_4163 ) ) ( not ( = ?AUTO_4157 ?AUTO_4163 ) ) ( not ( = ?AUTO_4159 ?AUTO_4163 ) ) ( not ( = ?AUTO_4161 ?AUTO_4163 ) ) ( ON ?AUTO_4161 ?AUTO_4157 ) ( ON ?AUTO_4159 ?AUTO_4161 ) ( CLEAR ?AUTO_4159 ) ( CLEAR ?AUTO_4158 ) ( not ( = ?AUTO_4155 ?AUTO_4160 ) ) ( not ( = ?AUTO_4155 ?AUTO_4158 ) ) ( not ( = ?AUTO_4156 ?AUTO_4160 ) ) ( not ( = ?AUTO_4156 ?AUTO_4158 ) ) ( not ( = ?AUTO_4157 ?AUTO_4160 ) ) ( not ( = ?AUTO_4157 ?AUTO_4158 ) ) ( not ( = ?AUTO_4159 ?AUTO_4160 ) ) ( not ( = ?AUTO_4159 ?AUTO_4158 ) ) ( not ( = ?AUTO_4161 ?AUTO_4160 ) ) ( not ( = ?AUTO_4161 ?AUTO_4158 ) ) ( not ( = ?AUTO_4163 ?AUTO_4160 ) ) ( not ( = ?AUTO_4163 ?AUTO_4158 ) ) ( not ( = ?AUTO_4160 ?AUTO_4158 ) ) ( ON ?AUTO_4160 ?AUTO_4156 ) ( not ( = ?AUTO_4155 ?AUTO_4162 ) ) ( not ( = ?AUTO_4156 ?AUTO_4162 ) ) ( not ( = ?AUTO_4157 ?AUTO_4162 ) ) ( not ( = ?AUTO_4159 ?AUTO_4162 ) ) ( not ( = ?AUTO_4161 ?AUTO_4162 ) ) ( not ( = ?AUTO_4163 ?AUTO_4162 ) ) ( not ( = ?AUTO_4158 ?AUTO_4162 ) ) ( not ( = ?AUTO_4160 ?AUTO_4162 ) ) ( ON ?AUTO_4162 ?AUTO_4160 ) ( ON ?AUTO_4163 ?AUTO_4162 ) ( CLEAR ?AUTO_4163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4163 ?AUTO_4162 )
      ( MAKE-ON ?AUTO_4155 ?AUTO_4156 )
      ( MAKE-ON-VERIFY ?AUTO_4155 ?AUTO_4156 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4164 - BLOCK
      ?AUTO_4165 - BLOCK
    )
    :vars
    (
      ?AUTO_4167 - BLOCK
      ?AUTO_4171 - BLOCK
      ?AUTO_4169 - BLOCK
      ?AUTO_4172 - BLOCK
      ?AUTO_4166 - BLOCK
      ?AUTO_4170 - BLOCK
      ?AUTO_4168 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4164 ?AUTO_4165 ) ) ( ON-TABLE ?AUTO_4164 ) ( not ( = ?AUTO_4164 ?AUTO_4167 ) ) ( not ( = ?AUTO_4165 ?AUTO_4167 ) ) ( ON ?AUTO_4167 ?AUTO_4164 ) ( not ( = ?AUTO_4164 ?AUTO_4171 ) ) ( not ( = ?AUTO_4164 ?AUTO_4169 ) ) ( not ( = ?AUTO_4165 ?AUTO_4171 ) ) ( not ( = ?AUTO_4165 ?AUTO_4169 ) ) ( not ( = ?AUTO_4167 ?AUTO_4171 ) ) ( not ( = ?AUTO_4167 ?AUTO_4169 ) ) ( not ( = ?AUTO_4171 ?AUTO_4169 ) ) ( not ( = ?AUTO_4164 ?AUTO_4172 ) ) ( not ( = ?AUTO_4165 ?AUTO_4172 ) ) ( not ( = ?AUTO_4167 ?AUTO_4172 ) ) ( not ( = ?AUTO_4171 ?AUTO_4172 ) ) ( not ( = ?AUTO_4169 ?AUTO_4172 ) ) ( ON ?AUTO_4169 ?AUTO_4167 ) ( CLEAR ?AUTO_4166 ) ( not ( = ?AUTO_4164 ?AUTO_4170 ) ) ( not ( = ?AUTO_4164 ?AUTO_4166 ) ) ( not ( = ?AUTO_4165 ?AUTO_4170 ) ) ( not ( = ?AUTO_4165 ?AUTO_4166 ) ) ( not ( = ?AUTO_4167 ?AUTO_4170 ) ) ( not ( = ?AUTO_4167 ?AUTO_4166 ) ) ( not ( = ?AUTO_4171 ?AUTO_4170 ) ) ( not ( = ?AUTO_4171 ?AUTO_4166 ) ) ( not ( = ?AUTO_4169 ?AUTO_4170 ) ) ( not ( = ?AUTO_4169 ?AUTO_4166 ) ) ( not ( = ?AUTO_4172 ?AUTO_4170 ) ) ( not ( = ?AUTO_4172 ?AUTO_4166 ) ) ( not ( = ?AUTO_4170 ?AUTO_4166 ) ) ( ON ?AUTO_4170 ?AUTO_4165 ) ( not ( = ?AUTO_4164 ?AUTO_4168 ) ) ( not ( = ?AUTO_4165 ?AUTO_4168 ) ) ( not ( = ?AUTO_4167 ?AUTO_4168 ) ) ( not ( = ?AUTO_4171 ?AUTO_4168 ) ) ( not ( = ?AUTO_4169 ?AUTO_4168 ) ) ( not ( = ?AUTO_4172 ?AUTO_4168 ) ) ( not ( = ?AUTO_4166 ?AUTO_4168 ) ) ( not ( = ?AUTO_4170 ?AUTO_4168 ) ) ( ON ?AUTO_4168 ?AUTO_4170 ) ( ON ?AUTO_4172 ?AUTO_4168 ) ( CLEAR ?AUTO_4172 ) ( HOLDING ?AUTO_4171 ) ( CLEAR ?AUTO_4169 ) )
    :subtasks
    ( ( !STACK ?AUTO_4171 ?AUTO_4169 )
      ( MAKE-ON ?AUTO_4164 ?AUTO_4165 )
      ( MAKE-ON-VERIFY ?AUTO_4164 ?AUTO_4165 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4173 - BLOCK
      ?AUTO_4174 - BLOCK
    )
    :vars
    (
      ?AUTO_4179 - BLOCK
      ?AUTO_4178 - BLOCK
      ?AUTO_4181 - BLOCK
      ?AUTO_4176 - BLOCK
      ?AUTO_4175 - BLOCK
      ?AUTO_4177 - BLOCK
      ?AUTO_4180 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4173 ?AUTO_4174 ) ) ( ON-TABLE ?AUTO_4173 ) ( not ( = ?AUTO_4173 ?AUTO_4179 ) ) ( not ( = ?AUTO_4174 ?AUTO_4179 ) ) ( ON ?AUTO_4179 ?AUTO_4173 ) ( not ( = ?AUTO_4173 ?AUTO_4178 ) ) ( not ( = ?AUTO_4173 ?AUTO_4181 ) ) ( not ( = ?AUTO_4174 ?AUTO_4178 ) ) ( not ( = ?AUTO_4174 ?AUTO_4181 ) ) ( not ( = ?AUTO_4179 ?AUTO_4178 ) ) ( not ( = ?AUTO_4179 ?AUTO_4181 ) ) ( not ( = ?AUTO_4178 ?AUTO_4181 ) ) ( not ( = ?AUTO_4173 ?AUTO_4176 ) ) ( not ( = ?AUTO_4174 ?AUTO_4176 ) ) ( not ( = ?AUTO_4179 ?AUTO_4176 ) ) ( not ( = ?AUTO_4178 ?AUTO_4176 ) ) ( not ( = ?AUTO_4181 ?AUTO_4176 ) ) ( ON ?AUTO_4181 ?AUTO_4179 ) ( CLEAR ?AUTO_4175 ) ( not ( = ?AUTO_4173 ?AUTO_4177 ) ) ( not ( = ?AUTO_4173 ?AUTO_4175 ) ) ( not ( = ?AUTO_4174 ?AUTO_4177 ) ) ( not ( = ?AUTO_4174 ?AUTO_4175 ) ) ( not ( = ?AUTO_4179 ?AUTO_4177 ) ) ( not ( = ?AUTO_4179 ?AUTO_4175 ) ) ( not ( = ?AUTO_4178 ?AUTO_4177 ) ) ( not ( = ?AUTO_4178 ?AUTO_4175 ) ) ( not ( = ?AUTO_4181 ?AUTO_4177 ) ) ( not ( = ?AUTO_4181 ?AUTO_4175 ) ) ( not ( = ?AUTO_4176 ?AUTO_4177 ) ) ( not ( = ?AUTO_4176 ?AUTO_4175 ) ) ( not ( = ?AUTO_4177 ?AUTO_4175 ) ) ( ON ?AUTO_4177 ?AUTO_4174 ) ( not ( = ?AUTO_4173 ?AUTO_4180 ) ) ( not ( = ?AUTO_4174 ?AUTO_4180 ) ) ( not ( = ?AUTO_4179 ?AUTO_4180 ) ) ( not ( = ?AUTO_4178 ?AUTO_4180 ) ) ( not ( = ?AUTO_4181 ?AUTO_4180 ) ) ( not ( = ?AUTO_4176 ?AUTO_4180 ) ) ( not ( = ?AUTO_4175 ?AUTO_4180 ) ) ( not ( = ?AUTO_4177 ?AUTO_4180 ) ) ( ON ?AUTO_4180 ?AUTO_4177 ) ( ON ?AUTO_4176 ?AUTO_4180 ) ( CLEAR ?AUTO_4181 ) ( ON ?AUTO_4178 ?AUTO_4176 ) ( CLEAR ?AUTO_4178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4178 ?AUTO_4176 )
      ( MAKE-ON ?AUTO_4173 ?AUTO_4174 )
      ( MAKE-ON-VERIFY ?AUTO_4173 ?AUTO_4174 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4182 - BLOCK
      ?AUTO_4183 - BLOCK
    )
    :vars
    (
      ?AUTO_4184 - BLOCK
      ?AUTO_4186 - BLOCK
      ?AUTO_4188 - BLOCK
      ?AUTO_4189 - BLOCK
      ?AUTO_4185 - BLOCK
      ?AUTO_4187 - BLOCK
      ?AUTO_4190 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4182 ?AUTO_4183 ) ) ( ON-TABLE ?AUTO_4182 ) ( not ( = ?AUTO_4182 ?AUTO_4184 ) ) ( not ( = ?AUTO_4183 ?AUTO_4184 ) ) ( ON ?AUTO_4184 ?AUTO_4182 ) ( not ( = ?AUTO_4182 ?AUTO_4186 ) ) ( not ( = ?AUTO_4182 ?AUTO_4188 ) ) ( not ( = ?AUTO_4183 ?AUTO_4186 ) ) ( not ( = ?AUTO_4183 ?AUTO_4188 ) ) ( not ( = ?AUTO_4184 ?AUTO_4186 ) ) ( not ( = ?AUTO_4184 ?AUTO_4188 ) ) ( not ( = ?AUTO_4186 ?AUTO_4188 ) ) ( not ( = ?AUTO_4182 ?AUTO_4189 ) ) ( not ( = ?AUTO_4183 ?AUTO_4189 ) ) ( not ( = ?AUTO_4184 ?AUTO_4189 ) ) ( not ( = ?AUTO_4186 ?AUTO_4189 ) ) ( not ( = ?AUTO_4188 ?AUTO_4189 ) ) ( CLEAR ?AUTO_4185 ) ( not ( = ?AUTO_4182 ?AUTO_4187 ) ) ( not ( = ?AUTO_4182 ?AUTO_4185 ) ) ( not ( = ?AUTO_4183 ?AUTO_4187 ) ) ( not ( = ?AUTO_4183 ?AUTO_4185 ) ) ( not ( = ?AUTO_4184 ?AUTO_4187 ) ) ( not ( = ?AUTO_4184 ?AUTO_4185 ) ) ( not ( = ?AUTO_4186 ?AUTO_4187 ) ) ( not ( = ?AUTO_4186 ?AUTO_4185 ) ) ( not ( = ?AUTO_4188 ?AUTO_4187 ) ) ( not ( = ?AUTO_4188 ?AUTO_4185 ) ) ( not ( = ?AUTO_4189 ?AUTO_4187 ) ) ( not ( = ?AUTO_4189 ?AUTO_4185 ) ) ( not ( = ?AUTO_4187 ?AUTO_4185 ) ) ( ON ?AUTO_4187 ?AUTO_4183 ) ( not ( = ?AUTO_4182 ?AUTO_4190 ) ) ( not ( = ?AUTO_4183 ?AUTO_4190 ) ) ( not ( = ?AUTO_4184 ?AUTO_4190 ) ) ( not ( = ?AUTO_4186 ?AUTO_4190 ) ) ( not ( = ?AUTO_4188 ?AUTO_4190 ) ) ( not ( = ?AUTO_4189 ?AUTO_4190 ) ) ( not ( = ?AUTO_4185 ?AUTO_4190 ) ) ( not ( = ?AUTO_4187 ?AUTO_4190 ) ) ( ON ?AUTO_4190 ?AUTO_4187 ) ( ON ?AUTO_4189 ?AUTO_4190 ) ( ON ?AUTO_4186 ?AUTO_4189 ) ( CLEAR ?AUTO_4186 ) ( HOLDING ?AUTO_4188 ) ( CLEAR ?AUTO_4184 ) )
    :subtasks
    ( ( !STACK ?AUTO_4188 ?AUTO_4184 )
      ( MAKE-ON ?AUTO_4182 ?AUTO_4183 )
      ( MAKE-ON-VERIFY ?AUTO_4182 ?AUTO_4183 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4191 - BLOCK
      ?AUTO_4192 - BLOCK
    )
    :vars
    (
      ?AUTO_4198 - BLOCK
      ?AUTO_4196 - BLOCK
      ?AUTO_4195 - BLOCK
      ?AUTO_4194 - BLOCK
      ?AUTO_4193 - BLOCK
      ?AUTO_4197 - BLOCK
      ?AUTO_4199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4191 ?AUTO_4192 ) ) ( ON-TABLE ?AUTO_4191 ) ( not ( = ?AUTO_4191 ?AUTO_4198 ) ) ( not ( = ?AUTO_4192 ?AUTO_4198 ) ) ( ON ?AUTO_4198 ?AUTO_4191 ) ( not ( = ?AUTO_4191 ?AUTO_4196 ) ) ( not ( = ?AUTO_4191 ?AUTO_4195 ) ) ( not ( = ?AUTO_4192 ?AUTO_4196 ) ) ( not ( = ?AUTO_4192 ?AUTO_4195 ) ) ( not ( = ?AUTO_4198 ?AUTO_4196 ) ) ( not ( = ?AUTO_4198 ?AUTO_4195 ) ) ( not ( = ?AUTO_4196 ?AUTO_4195 ) ) ( not ( = ?AUTO_4191 ?AUTO_4194 ) ) ( not ( = ?AUTO_4192 ?AUTO_4194 ) ) ( not ( = ?AUTO_4198 ?AUTO_4194 ) ) ( not ( = ?AUTO_4196 ?AUTO_4194 ) ) ( not ( = ?AUTO_4195 ?AUTO_4194 ) ) ( CLEAR ?AUTO_4193 ) ( not ( = ?AUTO_4191 ?AUTO_4197 ) ) ( not ( = ?AUTO_4191 ?AUTO_4193 ) ) ( not ( = ?AUTO_4192 ?AUTO_4197 ) ) ( not ( = ?AUTO_4192 ?AUTO_4193 ) ) ( not ( = ?AUTO_4198 ?AUTO_4197 ) ) ( not ( = ?AUTO_4198 ?AUTO_4193 ) ) ( not ( = ?AUTO_4196 ?AUTO_4197 ) ) ( not ( = ?AUTO_4196 ?AUTO_4193 ) ) ( not ( = ?AUTO_4195 ?AUTO_4197 ) ) ( not ( = ?AUTO_4195 ?AUTO_4193 ) ) ( not ( = ?AUTO_4194 ?AUTO_4197 ) ) ( not ( = ?AUTO_4194 ?AUTO_4193 ) ) ( not ( = ?AUTO_4197 ?AUTO_4193 ) ) ( ON ?AUTO_4197 ?AUTO_4192 ) ( not ( = ?AUTO_4191 ?AUTO_4199 ) ) ( not ( = ?AUTO_4192 ?AUTO_4199 ) ) ( not ( = ?AUTO_4198 ?AUTO_4199 ) ) ( not ( = ?AUTO_4196 ?AUTO_4199 ) ) ( not ( = ?AUTO_4195 ?AUTO_4199 ) ) ( not ( = ?AUTO_4194 ?AUTO_4199 ) ) ( not ( = ?AUTO_4193 ?AUTO_4199 ) ) ( not ( = ?AUTO_4197 ?AUTO_4199 ) ) ( ON ?AUTO_4199 ?AUTO_4197 ) ( ON ?AUTO_4194 ?AUTO_4199 ) ( ON ?AUTO_4196 ?AUTO_4194 ) ( CLEAR ?AUTO_4196 ) ( CLEAR ?AUTO_4198 ) ( ON-TABLE ?AUTO_4195 ) ( CLEAR ?AUTO_4195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4195 )
      ( MAKE-ON ?AUTO_4191 ?AUTO_4192 )
      ( MAKE-ON-VERIFY ?AUTO_4191 ?AUTO_4192 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4200 - BLOCK
      ?AUTO_4201 - BLOCK
    )
    :vars
    (
      ?AUTO_4207 - BLOCK
      ?AUTO_4202 - BLOCK
      ?AUTO_4203 - BLOCK
      ?AUTO_4204 - BLOCK
      ?AUTO_4208 - BLOCK
      ?AUTO_4206 - BLOCK
      ?AUTO_4205 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4200 ?AUTO_4201 ) ) ( ON-TABLE ?AUTO_4200 ) ( not ( = ?AUTO_4200 ?AUTO_4207 ) ) ( not ( = ?AUTO_4201 ?AUTO_4207 ) ) ( not ( = ?AUTO_4200 ?AUTO_4202 ) ) ( not ( = ?AUTO_4200 ?AUTO_4203 ) ) ( not ( = ?AUTO_4201 ?AUTO_4202 ) ) ( not ( = ?AUTO_4201 ?AUTO_4203 ) ) ( not ( = ?AUTO_4207 ?AUTO_4202 ) ) ( not ( = ?AUTO_4207 ?AUTO_4203 ) ) ( not ( = ?AUTO_4202 ?AUTO_4203 ) ) ( not ( = ?AUTO_4200 ?AUTO_4204 ) ) ( not ( = ?AUTO_4201 ?AUTO_4204 ) ) ( not ( = ?AUTO_4207 ?AUTO_4204 ) ) ( not ( = ?AUTO_4202 ?AUTO_4204 ) ) ( not ( = ?AUTO_4203 ?AUTO_4204 ) ) ( CLEAR ?AUTO_4208 ) ( not ( = ?AUTO_4200 ?AUTO_4206 ) ) ( not ( = ?AUTO_4200 ?AUTO_4208 ) ) ( not ( = ?AUTO_4201 ?AUTO_4206 ) ) ( not ( = ?AUTO_4201 ?AUTO_4208 ) ) ( not ( = ?AUTO_4207 ?AUTO_4206 ) ) ( not ( = ?AUTO_4207 ?AUTO_4208 ) ) ( not ( = ?AUTO_4202 ?AUTO_4206 ) ) ( not ( = ?AUTO_4202 ?AUTO_4208 ) ) ( not ( = ?AUTO_4203 ?AUTO_4206 ) ) ( not ( = ?AUTO_4203 ?AUTO_4208 ) ) ( not ( = ?AUTO_4204 ?AUTO_4206 ) ) ( not ( = ?AUTO_4204 ?AUTO_4208 ) ) ( not ( = ?AUTO_4206 ?AUTO_4208 ) ) ( ON ?AUTO_4206 ?AUTO_4201 ) ( not ( = ?AUTO_4200 ?AUTO_4205 ) ) ( not ( = ?AUTO_4201 ?AUTO_4205 ) ) ( not ( = ?AUTO_4207 ?AUTO_4205 ) ) ( not ( = ?AUTO_4202 ?AUTO_4205 ) ) ( not ( = ?AUTO_4203 ?AUTO_4205 ) ) ( not ( = ?AUTO_4204 ?AUTO_4205 ) ) ( not ( = ?AUTO_4208 ?AUTO_4205 ) ) ( not ( = ?AUTO_4206 ?AUTO_4205 ) ) ( ON ?AUTO_4205 ?AUTO_4206 ) ( ON ?AUTO_4204 ?AUTO_4205 ) ( ON ?AUTO_4202 ?AUTO_4204 ) ( CLEAR ?AUTO_4202 ) ( ON-TABLE ?AUTO_4203 ) ( CLEAR ?AUTO_4203 ) ( HOLDING ?AUTO_4207 ) ( CLEAR ?AUTO_4200 ) )
    :subtasks
    ( ( !STACK ?AUTO_4207 ?AUTO_4200 )
      ( MAKE-ON ?AUTO_4200 ?AUTO_4201 )
      ( MAKE-ON-VERIFY ?AUTO_4200 ?AUTO_4201 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4209 - BLOCK
      ?AUTO_4210 - BLOCK
    )
    :vars
    (
      ?AUTO_4214 - BLOCK
      ?AUTO_4216 - BLOCK
      ?AUTO_4215 - BLOCK
      ?AUTO_4211 - BLOCK
      ?AUTO_4212 - BLOCK
      ?AUTO_4213 - BLOCK
      ?AUTO_4217 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4209 ?AUTO_4210 ) ) ( ON-TABLE ?AUTO_4209 ) ( not ( = ?AUTO_4209 ?AUTO_4214 ) ) ( not ( = ?AUTO_4210 ?AUTO_4214 ) ) ( not ( = ?AUTO_4209 ?AUTO_4216 ) ) ( not ( = ?AUTO_4209 ?AUTO_4215 ) ) ( not ( = ?AUTO_4210 ?AUTO_4216 ) ) ( not ( = ?AUTO_4210 ?AUTO_4215 ) ) ( not ( = ?AUTO_4214 ?AUTO_4216 ) ) ( not ( = ?AUTO_4214 ?AUTO_4215 ) ) ( not ( = ?AUTO_4216 ?AUTO_4215 ) ) ( not ( = ?AUTO_4209 ?AUTO_4211 ) ) ( not ( = ?AUTO_4210 ?AUTO_4211 ) ) ( not ( = ?AUTO_4214 ?AUTO_4211 ) ) ( not ( = ?AUTO_4216 ?AUTO_4211 ) ) ( not ( = ?AUTO_4215 ?AUTO_4211 ) ) ( CLEAR ?AUTO_4212 ) ( not ( = ?AUTO_4209 ?AUTO_4213 ) ) ( not ( = ?AUTO_4209 ?AUTO_4212 ) ) ( not ( = ?AUTO_4210 ?AUTO_4213 ) ) ( not ( = ?AUTO_4210 ?AUTO_4212 ) ) ( not ( = ?AUTO_4214 ?AUTO_4213 ) ) ( not ( = ?AUTO_4214 ?AUTO_4212 ) ) ( not ( = ?AUTO_4216 ?AUTO_4213 ) ) ( not ( = ?AUTO_4216 ?AUTO_4212 ) ) ( not ( = ?AUTO_4215 ?AUTO_4213 ) ) ( not ( = ?AUTO_4215 ?AUTO_4212 ) ) ( not ( = ?AUTO_4211 ?AUTO_4213 ) ) ( not ( = ?AUTO_4211 ?AUTO_4212 ) ) ( not ( = ?AUTO_4213 ?AUTO_4212 ) ) ( ON ?AUTO_4213 ?AUTO_4210 ) ( not ( = ?AUTO_4209 ?AUTO_4217 ) ) ( not ( = ?AUTO_4210 ?AUTO_4217 ) ) ( not ( = ?AUTO_4214 ?AUTO_4217 ) ) ( not ( = ?AUTO_4216 ?AUTO_4217 ) ) ( not ( = ?AUTO_4215 ?AUTO_4217 ) ) ( not ( = ?AUTO_4211 ?AUTO_4217 ) ) ( not ( = ?AUTO_4212 ?AUTO_4217 ) ) ( not ( = ?AUTO_4213 ?AUTO_4217 ) ) ( ON ?AUTO_4217 ?AUTO_4213 ) ( ON ?AUTO_4211 ?AUTO_4217 ) ( ON ?AUTO_4216 ?AUTO_4211 ) ( CLEAR ?AUTO_4216 ) ( ON-TABLE ?AUTO_4215 ) ( CLEAR ?AUTO_4209 ) ( ON ?AUTO_4214 ?AUTO_4215 ) ( CLEAR ?AUTO_4214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4214 ?AUTO_4215 )
      ( MAKE-ON ?AUTO_4209 ?AUTO_4210 )
      ( MAKE-ON-VERIFY ?AUTO_4209 ?AUTO_4210 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4224 - BLOCK
      ?AUTO_4225 - BLOCK
    )
    :vars
    (
      ?AUTO_4228 - BLOCK
      ?AUTO_4230 - BLOCK
      ?AUTO_4227 - BLOCK
      ?AUTO_4231 - BLOCK
      ?AUTO_4232 - BLOCK
      ?AUTO_4229 - BLOCK
      ?AUTO_4226 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4224 ?AUTO_4225 ) ) ( ON-TABLE ?AUTO_4224 ) ( not ( = ?AUTO_4224 ?AUTO_4228 ) ) ( not ( = ?AUTO_4225 ?AUTO_4228 ) ) ( not ( = ?AUTO_4224 ?AUTO_4230 ) ) ( not ( = ?AUTO_4224 ?AUTO_4227 ) ) ( not ( = ?AUTO_4225 ?AUTO_4230 ) ) ( not ( = ?AUTO_4225 ?AUTO_4227 ) ) ( not ( = ?AUTO_4228 ?AUTO_4230 ) ) ( not ( = ?AUTO_4228 ?AUTO_4227 ) ) ( not ( = ?AUTO_4230 ?AUTO_4227 ) ) ( not ( = ?AUTO_4224 ?AUTO_4231 ) ) ( not ( = ?AUTO_4225 ?AUTO_4231 ) ) ( not ( = ?AUTO_4228 ?AUTO_4231 ) ) ( not ( = ?AUTO_4230 ?AUTO_4231 ) ) ( not ( = ?AUTO_4227 ?AUTO_4231 ) ) ( not ( = ?AUTO_4224 ?AUTO_4232 ) ) ( not ( = ?AUTO_4224 ?AUTO_4229 ) ) ( not ( = ?AUTO_4225 ?AUTO_4232 ) ) ( not ( = ?AUTO_4225 ?AUTO_4229 ) ) ( not ( = ?AUTO_4228 ?AUTO_4232 ) ) ( not ( = ?AUTO_4228 ?AUTO_4229 ) ) ( not ( = ?AUTO_4230 ?AUTO_4232 ) ) ( not ( = ?AUTO_4230 ?AUTO_4229 ) ) ( not ( = ?AUTO_4227 ?AUTO_4232 ) ) ( not ( = ?AUTO_4227 ?AUTO_4229 ) ) ( not ( = ?AUTO_4231 ?AUTO_4232 ) ) ( not ( = ?AUTO_4231 ?AUTO_4229 ) ) ( not ( = ?AUTO_4232 ?AUTO_4229 ) ) ( ON ?AUTO_4232 ?AUTO_4225 ) ( not ( = ?AUTO_4224 ?AUTO_4226 ) ) ( not ( = ?AUTO_4225 ?AUTO_4226 ) ) ( not ( = ?AUTO_4228 ?AUTO_4226 ) ) ( not ( = ?AUTO_4230 ?AUTO_4226 ) ) ( not ( = ?AUTO_4227 ?AUTO_4226 ) ) ( not ( = ?AUTO_4231 ?AUTO_4226 ) ) ( not ( = ?AUTO_4229 ?AUTO_4226 ) ) ( not ( = ?AUTO_4232 ?AUTO_4226 ) ) ( ON ?AUTO_4226 ?AUTO_4232 ) ( ON ?AUTO_4231 ?AUTO_4226 ) ( ON ?AUTO_4230 ?AUTO_4231 ) ( CLEAR ?AUTO_4230 ) ( ON-TABLE ?AUTO_4227 ) ( CLEAR ?AUTO_4227 ) ( CLEAR ?AUTO_4224 ) ( ON ?AUTO_4228 ?AUTO_4229 ) ( CLEAR ?AUTO_4228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4228 ?AUTO_4229 )
      ( MAKE-ON ?AUTO_4224 ?AUTO_4225 )
      ( MAKE-ON-VERIFY ?AUTO_4224 ?AUTO_4225 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4235 - BLOCK
      ?AUTO_4236 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4235 ) ( CLEAR ?AUTO_4236 ) ( not ( = ?AUTO_4235 ?AUTO_4236 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4235 ?AUTO_4236 )
      ( MAKE-ON-VERIFY ?AUTO_4235 ?AUTO_4236 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4237 - BLOCK
      ?AUTO_4238 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4238 ) ( not ( = ?AUTO_4237 ?AUTO_4238 ) ) ( ON-TABLE ?AUTO_4237 ) ( CLEAR ?AUTO_4237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4237 )
      ( MAKE-ON ?AUTO_4237 ?AUTO_4238 )
      ( MAKE-ON-VERIFY ?AUTO_4237 ?AUTO_4238 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4239 - BLOCK
      ?AUTO_4240 - BLOCK
    )
    :vars
    (
      ?AUTO_4241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4239 ?AUTO_4240 ) ) ( ON-TABLE ?AUTO_4239 ) ( CLEAR ?AUTO_4239 ) ( HOLDING ?AUTO_4240 ) ( CLEAR ?AUTO_4241 ) ( not ( = ?AUTO_4239 ?AUTO_4241 ) ) ( not ( = ?AUTO_4240 ?AUTO_4241 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4240 ?AUTO_4241 )
      ( MAKE-ON ?AUTO_4239 ?AUTO_4240 )
      ( MAKE-ON-VERIFY ?AUTO_4239 ?AUTO_4240 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4399 - BLOCK
      ?AUTO_4400 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4399 ) ( CLEAR ?AUTO_4400 ) ( not ( = ?AUTO_4399 ?AUTO_4400 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4399 ?AUTO_4400 )
      ( MAKE-ON-VERIFY ?AUTO_4399 ?AUTO_4400 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4401 - BLOCK
      ?AUTO_4402 - BLOCK
    )
    :vars
    (
      ?AUTO_4403 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4402 ) ( not ( = ?AUTO_4401 ?AUTO_4402 ) ) ( ON ?AUTO_4401 ?AUTO_4403 ) ( CLEAR ?AUTO_4401 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4401 ?AUTO_4403 ) ) ( not ( = ?AUTO_4402 ?AUTO_4403 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4401 ?AUTO_4403 )
      ( MAKE-ON ?AUTO_4401 ?AUTO_4402 )
      ( MAKE-ON-VERIFY ?AUTO_4401 ?AUTO_4402 ) )
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
      ?AUTO_4408 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4405 ) ( not ( = ?AUTO_4404 ?AUTO_4405 ) ) ( ON ?AUTO_4404 ?AUTO_4406 ) ( CLEAR ?AUTO_4404 ) ( not ( = ?AUTO_4404 ?AUTO_4406 ) ) ( not ( = ?AUTO_4405 ?AUTO_4406 ) ) ( HOLDING ?AUTO_4407 ) ( CLEAR ?AUTO_4408 ) ( not ( = ?AUTO_4404 ?AUTO_4407 ) ) ( not ( = ?AUTO_4404 ?AUTO_4408 ) ) ( not ( = ?AUTO_4405 ?AUTO_4407 ) ) ( not ( = ?AUTO_4405 ?AUTO_4408 ) ) ( not ( = ?AUTO_4406 ?AUTO_4407 ) ) ( not ( = ?AUTO_4406 ?AUTO_4408 ) ) ( not ( = ?AUTO_4407 ?AUTO_4408 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4407 ?AUTO_4408 )
      ( MAKE-ON ?AUTO_4404 ?AUTO_4405 )
      ( MAKE-ON-VERIFY ?AUTO_4404 ?AUTO_4405 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4447 - BLOCK
      ?AUTO_4448 - BLOCK
    )
    :vars
    (
      ?AUTO_4449 - BLOCK
      ?AUTO_4451 - BLOCK
      ?AUTO_4450 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4447 ?AUTO_4448 ) ) ( not ( = ?AUTO_4447 ?AUTO_4449 ) ) ( not ( = ?AUTO_4448 ?AUTO_4449 ) ) ( CLEAR ?AUTO_4451 ) ( not ( = ?AUTO_4447 ?AUTO_4450 ) ) ( not ( = ?AUTO_4447 ?AUTO_4451 ) ) ( not ( = ?AUTO_4448 ?AUTO_4450 ) ) ( not ( = ?AUTO_4448 ?AUTO_4451 ) ) ( not ( = ?AUTO_4449 ?AUTO_4450 ) ) ( not ( = ?AUTO_4449 ?AUTO_4451 ) ) ( not ( = ?AUTO_4450 ?AUTO_4451 ) ) ( ON ?AUTO_4450 ?AUTO_4448 ) ( CLEAR ?AUTO_4450 ) ( HOLDING ?AUTO_4447 ) ( CLEAR ?AUTO_4449 ) )
    :subtasks
    ( ( !STACK ?AUTO_4447 ?AUTO_4449 )
      ( MAKE-ON ?AUTO_4447 ?AUTO_4448 )
      ( MAKE-ON-VERIFY ?AUTO_4447 ?AUTO_4448 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4452 - BLOCK
      ?AUTO_4453 - BLOCK
    )
    :vars
    (
      ?AUTO_4456 - BLOCK
      ?AUTO_4454 - BLOCK
      ?AUTO_4455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4452 ?AUTO_4453 ) ) ( not ( = ?AUTO_4452 ?AUTO_4456 ) ) ( not ( = ?AUTO_4453 ?AUTO_4456 ) ) ( CLEAR ?AUTO_4454 ) ( not ( = ?AUTO_4452 ?AUTO_4455 ) ) ( not ( = ?AUTO_4452 ?AUTO_4454 ) ) ( not ( = ?AUTO_4453 ?AUTO_4455 ) ) ( not ( = ?AUTO_4453 ?AUTO_4454 ) ) ( not ( = ?AUTO_4456 ?AUTO_4455 ) ) ( not ( = ?AUTO_4456 ?AUTO_4454 ) ) ( not ( = ?AUTO_4455 ?AUTO_4454 ) ) ( ON ?AUTO_4455 ?AUTO_4453 ) ( CLEAR ?AUTO_4456 ) ( ON ?AUTO_4452 ?AUTO_4455 ) ( CLEAR ?AUTO_4452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4452 ?AUTO_4455 )
      ( MAKE-ON ?AUTO_4452 ?AUTO_4453 )
      ( MAKE-ON-VERIFY ?AUTO_4452 ?AUTO_4453 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4457 - BLOCK
      ?AUTO_4458 - BLOCK
    )
    :vars
    (
      ?AUTO_4461 - BLOCK
      ?AUTO_4460 - BLOCK
      ?AUTO_4459 - BLOCK
      ?AUTO_4462 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4457 ?AUTO_4458 ) ) ( not ( = ?AUTO_4457 ?AUTO_4461 ) ) ( not ( = ?AUTO_4458 ?AUTO_4461 ) ) ( CLEAR ?AUTO_4460 ) ( not ( = ?AUTO_4457 ?AUTO_4459 ) ) ( not ( = ?AUTO_4457 ?AUTO_4460 ) ) ( not ( = ?AUTO_4458 ?AUTO_4459 ) ) ( not ( = ?AUTO_4458 ?AUTO_4460 ) ) ( not ( = ?AUTO_4461 ?AUTO_4459 ) ) ( not ( = ?AUTO_4461 ?AUTO_4460 ) ) ( not ( = ?AUTO_4459 ?AUTO_4460 ) ) ( ON ?AUTO_4459 ?AUTO_4458 ) ( ON ?AUTO_4457 ?AUTO_4459 ) ( CLEAR ?AUTO_4457 ) ( HOLDING ?AUTO_4461 ) ( CLEAR ?AUTO_4462 ) ( not ( = ?AUTO_4457 ?AUTO_4462 ) ) ( not ( = ?AUTO_4458 ?AUTO_4462 ) ) ( not ( = ?AUTO_4461 ?AUTO_4462 ) ) ( not ( = ?AUTO_4460 ?AUTO_4462 ) ) ( not ( = ?AUTO_4459 ?AUTO_4462 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4461 ?AUTO_4462 )
      ( MAKE-ON ?AUTO_4457 ?AUTO_4458 )
      ( MAKE-ON-VERIFY ?AUTO_4457 ?AUTO_4458 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4479 - BLOCK
      ?AUTO_4480 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4479 ) ( CLEAR ?AUTO_4480 ) ( not ( = ?AUTO_4479 ?AUTO_4480 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4479 ?AUTO_4480 )
      ( MAKE-ON-VERIFY ?AUTO_4479 ?AUTO_4480 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4481 - BLOCK
      ?AUTO_4482 - BLOCK
    )
    :vars
    (
      ?AUTO_4483 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4482 ) ( not ( = ?AUTO_4481 ?AUTO_4482 ) ) ( ON ?AUTO_4481 ?AUTO_4483 ) ( CLEAR ?AUTO_4481 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4481 ?AUTO_4483 ) ) ( not ( = ?AUTO_4482 ?AUTO_4483 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4481 ?AUTO_4483 )
      ( MAKE-ON ?AUTO_4481 ?AUTO_4482 )
      ( MAKE-ON-VERIFY ?AUTO_4481 ?AUTO_4482 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4484 - BLOCK
      ?AUTO_4485 - BLOCK
    )
    :vars
    (
      ?AUTO_4486 - BLOCK
      ?AUTO_4487 - BLOCK
      ?AUTO_4488 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4485 ) ( not ( = ?AUTO_4484 ?AUTO_4485 ) ) ( ON ?AUTO_4484 ?AUTO_4486 ) ( CLEAR ?AUTO_4484 ) ( not ( = ?AUTO_4484 ?AUTO_4486 ) ) ( not ( = ?AUTO_4485 ?AUTO_4486 ) ) ( HOLDING ?AUTO_4487 ) ( CLEAR ?AUTO_4488 ) ( not ( = ?AUTO_4484 ?AUTO_4487 ) ) ( not ( = ?AUTO_4484 ?AUTO_4488 ) ) ( not ( = ?AUTO_4485 ?AUTO_4487 ) ) ( not ( = ?AUTO_4485 ?AUTO_4488 ) ) ( not ( = ?AUTO_4486 ?AUTO_4487 ) ) ( not ( = ?AUTO_4486 ?AUTO_4488 ) ) ( not ( = ?AUTO_4487 ?AUTO_4488 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4487 ?AUTO_4488 )
      ( MAKE-ON ?AUTO_4484 ?AUTO_4485 )
      ( MAKE-ON-VERIFY ?AUTO_4484 ?AUTO_4485 ) )
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
      ?AUTO_4492 - BLOCK
      ?AUTO_4493 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4490 ) ( not ( = ?AUTO_4489 ?AUTO_4490 ) ) ( ON ?AUTO_4489 ?AUTO_4491 ) ( not ( = ?AUTO_4489 ?AUTO_4491 ) ) ( not ( = ?AUTO_4490 ?AUTO_4491 ) ) ( CLEAR ?AUTO_4492 ) ( not ( = ?AUTO_4489 ?AUTO_4493 ) ) ( not ( = ?AUTO_4489 ?AUTO_4492 ) ) ( not ( = ?AUTO_4490 ?AUTO_4493 ) ) ( not ( = ?AUTO_4490 ?AUTO_4492 ) ) ( not ( = ?AUTO_4491 ?AUTO_4493 ) ) ( not ( = ?AUTO_4491 ?AUTO_4492 ) ) ( not ( = ?AUTO_4493 ?AUTO_4492 ) ) ( ON ?AUTO_4493 ?AUTO_4489 ) ( CLEAR ?AUTO_4493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4493 ?AUTO_4489 )
      ( MAKE-ON ?AUTO_4489 ?AUTO_4490 )
      ( MAKE-ON-VERIFY ?AUTO_4489 ?AUTO_4490 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4494 - BLOCK
      ?AUTO_4495 - BLOCK
    )
    :vars
    (
      ?AUTO_4496 - BLOCK
      ?AUTO_4498 - BLOCK
      ?AUTO_4497 - BLOCK
      ?AUTO_4499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4494 ?AUTO_4495 ) ) ( ON ?AUTO_4494 ?AUTO_4496 ) ( not ( = ?AUTO_4494 ?AUTO_4496 ) ) ( not ( = ?AUTO_4495 ?AUTO_4496 ) ) ( CLEAR ?AUTO_4498 ) ( not ( = ?AUTO_4494 ?AUTO_4497 ) ) ( not ( = ?AUTO_4494 ?AUTO_4498 ) ) ( not ( = ?AUTO_4495 ?AUTO_4497 ) ) ( not ( = ?AUTO_4495 ?AUTO_4498 ) ) ( not ( = ?AUTO_4496 ?AUTO_4497 ) ) ( not ( = ?AUTO_4496 ?AUTO_4498 ) ) ( not ( = ?AUTO_4497 ?AUTO_4498 ) ) ( ON ?AUTO_4497 ?AUTO_4494 ) ( CLEAR ?AUTO_4497 ) ( HOLDING ?AUTO_4495 ) ( CLEAR ?AUTO_4499 ) ( not ( = ?AUTO_4494 ?AUTO_4499 ) ) ( not ( = ?AUTO_4495 ?AUTO_4499 ) ) ( not ( = ?AUTO_4496 ?AUTO_4499 ) ) ( not ( = ?AUTO_4498 ?AUTO_4499 ) ) ( not ( = ?AUTO_4497 ?AUTO_4499 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4495 ?AUTO_4499 )
      ( MAKE-ON ?AUTO_4494 ?AUTO_4495 )
      ( MAKE-ON-VERIFY ?AUTO_4494 ?AUTO_4495 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4502 - BLOCK
      ?AUTO_4503 - BLOCK
    )
    :vars
    (
      ?AUTO_4506 - BLOCK
      ?AUTO_4505 - BLOCK
      ?AUTO_4504 - BLOCK
      ?AUTO_4507 - BLOCK
      ?AUTO_4508 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4503 ) ( not ( = ?AUTO_4502 ?AUTO_4503 ) ) ( ON ?AUTO_4502 ?AUTO_4506 ) ( not ( = ?AUTO_4502 ?AUTO_4506 ) ) ( not ( = ?AUTO_4503 ?AUTO_4506 ) ) ( CLEAR ?AUTO_4505 ) ( not ( = ?AUTO_4502 ?AUTO_4504 ) ) ( not ( = ?AUTO_4502 ?AUTO_4505 ) ) ( not ( = ?AUTO_4503 ?AUTO_4504 ) ) ( not ( = ?AUTO_4503 ?AUTO_4505 ) ) ( not ( = ?AUTO_4506 ?AUTO_4504 ) ) ( not ( = ?AUTO_4506 ?AUTO_4505 ) ) ( not ( = ?AUTO_4504 ?AUTO_4505 ) ) ( ON ?AUTO_4504 ?AUTO_4502 ) ( CLEAR ?AUTO_4504 ) ( HOLDING ?AUTO_4507 ) ( CLEAR ?AUTO_4508 ) ( not ( = ?AUTO_4502 ?AUTO_4507 ) ) ( not ( = ?AUTO_4502 ?AUTO_4508 ) ) ( not ( = ?AUTO_4503 ?AUTO_4507 ) ) ( not ( = ?AUTO_4503 ?AUTO_4508 ) ) ( not ( = ?AUTO_4506 ?AUTO_4507 ) ) ( not ( = ?AUTO_4506 ?AUTO_4508 ) ) ( not ( = ?AUTO_4505 ?AUTO_4507 ) ) ( not ( = ?AUTO_4505 ?AUTO_4508 ) ) ( not ( = ?AUTO_4504 ?AUTO_4507 ) ) ( not ( = ?AUTO_4504 ?AUTO_4508 ) ) ( not ( = ?AUTO_4507 ?AUTO_4508 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4507 ?AUTO_4508 )
      ( MAKE-ON ?AUTO_4502 ?AUTO_4503 )
      ( MAKE-ON-VERIFY ?AUTO_4502 ?AUTO_4503 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4621 - BLOCK
      ?AUTO_4622 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4621 ) ( CLEAR ?AUTO_4622 ) ( not ( = ?AUTO_4621 ?AUTO_4622 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4621 ?AUTO_4622 )
      ( MAKE-ON-VERIFY ?AUTO_4621 ?AUTO_4622 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4623 - BLOCK
      ?AUTO_4624 - BLOCK
    )
    :vars
    (
      ?AUTO_4625 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4624 ) ( not ( = ?AUTO_4623 ?AUTO_4624 ) ) ( ON ?AUTO_4623 ?AUTO_4625 ) ( CLEAR ?AUTO_4623 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4623 ?AUTO_4625 ) ) ( not ( = ?AUTO_4624 ?AUTO_4625 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4623 ?AUTO_4625 )
      ( MAKE-ON ?AUTO_4623 ?AUTO_4624 )
      ( MAKE-ON-VERIFY ?AUTO_4623 ?AUTO_4624 ) )
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
    )
    :precondition
    ( and ( not ( = ?AUTO_4626 ?AUTO_4627 ) ) ( ON ?AUTO_4626 ?AUTO_4628 ) ( CLEAR ?AUTO_4626 ) ( not ( = ?AUTO_4626 ?AUTO_4628 ) ) ( not ( = ?AUTO_4627 ?AUTO_4628 ) ) ( HOLDING ?AUTO_4627 ) ( CLEAR ?AUTO_4629 ) ( not ( = ?AUTO_4626 ?AUTO_4629 ) ) ( not ( = ?AUTO_4627 ?AUTO_4629 ) ) ( not ( = ?AUTO_4628 ?AUTO_4629 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4627 ?AUTO_4629 )
      ( MAKE-ON ?AUTO_4626 ?AUTO_4627 )
      ( MAKE-ON-VERIFY ?AUTO_4626 ?AUTO_4627 ) )
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

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4636 - BLOCK
      ?AUTO_4637 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4636 ) ( CLEAR ?AUTO_4637 ) ( not ( = ?AUTO_4636 ?AUTO_4637 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4636 ?AUTO_4637 )
      ( MAKE-ON-VERIFY ?AUTO_4636 ?AUTO_4637 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4638 - BLOCK
      ?AUTO_4639 - BLOCK
    )
    :vars
    (
      ?AUTO_4640 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4639 ) ( not ( = ?AUTO_4638 ?AUTO_4639 ) ) ( ON ?AUTO_4638 ?AUTO_4640 ) ( CLEAR ?AUTO_4638 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4638 ?AUTO_4640 ) ) ( not ( = ?AUTO_4639 ?AUTO_4640 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4638 ?AUTO_4640 )
      ( MAKE-ON ?AUTO_4638 ?AUTO_4639 )
      ( MAKE-ON-VERIFY ?AUTO_4638 ?AUTO_4639 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4641 - BLOCK
      ?AUTO_4642 - BLOCK
    )
    :vars
    (
      ?AUTO_4643 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4641 ?AUTO_4642 ) ) ( ON ?AUTO_4641 ?AUTO_4643 ) ( CLEAR ?AUTO_4641 ) ( not ( = ?AUTO_4641 ?AUTO_4643 ) ) ( not ( = ?AUTO_4642 ?AUTO_4643 ) ) ( HOLDING ?AUTO_4642 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4642 )
      ( MAKE-ON ?AUTO_4641 ?AUTO_4642 )
      ( MAKE-ON-VERIFY ?AUTO_4641 ?AUTO_4642 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4647 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4647 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4647 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4647 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4648 - BLOCK
    )
    :vars
    (
      ?AUTO_4649 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4648 ?AUTO_4649 ) ( CLEAR ?AUTO_4648 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4648 ?AUTO_4649 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4648 ?AUTO_4649 )
      ( MAKE-ON-TABLE ?AUTO_4648 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4648 ) )
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
    ( and ( ON ?AUTO_4650 ?AUTO_4651 ) ( CLEAR ?AUTO_4650 ) ( not ( = ?AUTO_4650 ?AUTO_4651 ) ) ( HOLDING ?AUTO_4652 ) ( CLEAR ?AUTO_4653 ) ( not ( = ?AUTO_4650 ?AUTO_4652 ) ) ( not ( = ?AUTO_4650 ?AUTO_4653 ) ) ( not ( = ?AUTO_4651 ?AUTO_4652 ) ) ( not ( = ?AUTO_4651 ?AUTO_4653 ) ) ( not ( = ?AUTO_4652 ?AUTO_4653 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4652 ?AUTO_4653 )
      ( MAKE-ON-TABLE ?AUTO_4650 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4650 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4656 - BLOCK
    )
    :vars
    (
      ?AUTO_4659 - BLOCK
      ?AUTO_4657 - BLOCK
      ?AUTO_4658 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4656 ?AUTO_4659 ) ( not ( = ?AUTO_4656 ?AUTO_4659 ) ) ( CLEAR ?AUTO_4657 ) ( not ( = ?AUTO_4656 ?AUTO_4658 ) ) ( not ( = ?AUTO_4656 ?AUTO_4657 ) ) ( not ( = ?AUTO_4659 ?AUTO_4658 ) ) ( not ( = ?AUTO_4659 ?AUTO_4657 ) ) ( not ( = ?AUTO_4658 ?AUTO_4657 ) ) ( ON ?AUTO_4658 ?AUTO_4656 ) ( CLEAR ?AUTO_4658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4658 ?AUTO_4656 )
      ( MAKE-ON-TABLE ?AUTO_4656 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4656 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4662 - BLOCK
      ?AUTO_4663 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4662 ) ( CLEAR ?AUTO_4663 ) ( not ( = ?AUTO_4662 ?AUTO_4663 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4662 ?AUTO_4663 )
      ( MAKE-ON-VERIFY ?AUTO_4662 ?AUTO_4663 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4664 - BLOCK
      ?AUTO_4665 - BLOCK
    )
    :vars
    (
      ?AUTO_4666 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4665 ) ( not ( = ?AUTO_4664 ?AUTO_4665 ) ) ( ON ?AUTO_4664 ?AUTO_4666 ) ( CLEAR ?AUTO_4664 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4664 ?AUTO_4666 ) ) ( not ( = ?AUTO_4665 ?AUTO_4666 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4664 ?AUTO_4666 )
      ( MAKE-ON ?AUTO_4664 ?AUTO_4665 )
      ( MAKE-ON-VERIFY ?AUTO_4664 ?AUTO_4665 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4667 - BLOCK
      ?AUTO_4668 - BLOCK
    )
    :vars
    (
      ?AUTO_4669 - BLOCK
      ?AUTO_4670 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4668 ) ( not ( = ?AUTO_4667 ?AUTO_4668 ) ) ( ON ?AUTO_4667 ?AUTO_4669 ) ( CLEAR ?AUTO_4667 ) ( not ( = ?AUTO_4667 ?AUTO_4669 ) ) ( not ( = ?AUTO_4668 ?AUTO_4669 ) ) ( HOLDING ?AUTO_4670 ) ( not ( = ?AUTO_4667 ?AUTO_4670 ) ) ( not ( = ?AUTO_4668 ?AUTO_4670 ) ) ( not ( = ?AUTO_4669 ?AUTO_4670 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4670 )
      ( MAKE-ON ?AUTO_4667 ?AUTO_4668 )
      ( MAKE-ON-VERIFY ?AUTO_4667 ?AUTO_4668 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4671 - BLOCK
      ?AUTO_4672 - BLOCK
    )
    :vars
    (
      ?AUTO_4673 - BLOCK
      ?AUTO_4674 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4672 ) ( not ( = ?AUTO_4671 ?AUTO_4672 ) ) ( ON ?AUTO_4671 ?AUTO_4673 ) ( not ( = ?AUTO_4671 ?AUTO_4673 ) ) ( not ( = ?AUTO_4672 ?AUTO_4673 ) ) ( not ( = ?AUTO_4671 ?AUTO_4674 ) ) ( not ( = ?AUTO_4672 ?AUTO_4674 ) ) ( not ( = ?AUTO_4673 ?AUTO_4674 ) ) ( ON ?AUTO_4674 ?AUTO_4671 ) ( CLEAR ?AUTO_4674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4674 ?AUTO_4671 )
      ( MAKE-ON ?AUTO_4671 ?AUTO_4672 )
      ( MAKE-ON-VERIFY ?AUTO_4671 ?AUTO_4672 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4675 - BLOCK
      ?AUTO_4676 - BLOCK
    )
    :vars
    (
      ?AUTO_4677 - BLOCK
      ?AUTO_4678 - BLOCK
      ?AUTO_4679 - BLOCK
      ?AUTO_4680 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4676 ) ( not ( = ?AUTO_4675 ?AUTO_4676 ) ) ( ON ?AUTO_4675 ?AUTO_4677 ) ( not ( = ?AUTO_4675 ?AUTO_4677 ) ) ( not ( = ?AUTO_4676 ?AUTO_4677 ) ) ( not ( = ?AUTO_4675 ?AUTO_4678 ) ) ( not ( = ?AUTO_4676 ?AUTO_4678 ) ) ( not ( = ?AUTO_4677 ?AUTO_4678 ) ) ( ON ?AUTO_4678 ?AUTO_4675 ) ( CLEAR ?AUTO_4678 ) ( HOLDING ?AUTO_4679 ) ( CLEAR ?AUTO_4680 ) ( not ( = ?AUTO_4675 ?AUTO_4679 ) ) ( not ( = ?AUTO_4675 ?AUTO_4680 ) ) ( not ( = ?AUTO_4676 ?AUTO_4679 ) ) ( not ( = ?AUTO_4676 ?AUTO_4680 ) ) ( not ( = ?AUTO_4677 ?AUTO_4679 ) ) ( not ( = ?AUTO_4677 ?AUTO_4680 ) ) ( not ( = ?AUTO_4678 ?AUTO_4679 ) ) ( not ( = ?AUTO_4678 ?AUTO_4680 ) ) ( not ( = ?AUTO_4679 ?AUTO_4680 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4679 ?AUTO_4680 )
      ( MAKE-ON ?AUTO_4675 ?AUTO_4676 )
      ( MAKE-ON-VERIFY ?AUTO_4675 ?AUTO_4676 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4681 - BLOCK
      ?AUTO_4682 - BLOCK
    )
    :vars
    (
      ?AUTO_4683 - BLOCK
      ?AUTO_4684 - BLOCK
      ?AUTO_4686 - BLOCK
      ?AUTO_4685 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4681 ?AUTO_4682 ) ) ( ON ?AUTO_4681 ?AUTO_4683 ) ( not ( = ?AUTO_4681 ?AUTO_4683 ) ) ( not ( = ?AUTO_4682 ?AUTO_4683 ) ) ( not ( = ?AUTO_4681 ?AUTO_4684 ) ) ( not ( = ?AUTO_4682 ?AUTO_4684 ) ) ( not ( = ?AUTO_4683 ?AUTO_4684 ) ) ( ON ?AUTO_4684 ?AUTO_4681 ) ( CLEAR ?AUTO_4684 ) ( CLEAR ?AUTO_4686 ) ( not ( = ?AUTO_4681 ?AUTO_4685 ) ) ( not ( = ?AUTO_4681 ?AUTO_4686 ) ) ( not ( = ?AUTO_4682 ?AUTO_4685 ) ) ( not ( = ?AUTO_4682 ?AUTO_4686 ) ) ( not ( = ?AUTO_4683 ?AUTO_4685 ) ) ( not ( = ?AUTO_4683 ?AUTO_4686 ) ) ( not ( = ?AUTO_4684 ?AUTO_4685 ) ) ( not ( = ?AUTO_4684 ?AUTO_4686 ) ) ( not ( = ?AUTO_4685 ?AUTO_4686 ) ) ( ON ?AUTO_4685 ?AUTO_4682 ) ( CLEAR ?AUTO_4685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4685 ?AUTO_4682 )
      ( MAKE-ON ?AUTO_4681 ?AUTO_4682 )
      ( MAKE-ON-VERIFY ?AUTO_4681 ?AUTO_4682 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4687 - BLOCK
      ?AUTO_4688 - BLOCK
    )
    :vars
    (
      ?AUTO_4689 - BLOCK
      ?AUTO_4692 - BLOCK
      ?AUTO_4691 - BLOCK
      ?AUTO_4690 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4687 ?AUTO_4688 ) ) ( ON ?AUTO_4687 ?AUTO_4689 ) ( not ( = ?AUTO_4687 ?AUTO_4689 ) ) ( not ( = ?AUTO_4688 ?AUTO_4689 ) ) ( not ( = ?AUTO_4687 ?AUTO_4692 ) ) ( not ( = ?AUTO_4688 ?AUTO_4692 ) ) ( not ( = ?AUTO_4689 ?AUTO_4692 ) ) ( ON ?AUTO_4692 ?AUTO_4687 ) ( CLEAR ?AUTO_4692 ) ( not ( = ?AUTO_4687 ?AUTO_4691 ) ) ( not ( = ?AUTO_4687 ?AUTO_4690 ) ) ( not ( = ?AUTO_4688 ?AUTO_4691 ) ) ( not ( = ?AUTO_4688 ?AUTO_4690 ) ) ( not ( = ?AUTO_4689 ?AUTO_4691 ) ) ( not ( = ?AUTO_4689 ?AUTO_4690 ) ) ( not ( = ?AUTO_4692 ?AUTO_4691 ) ) ( not ( = ?AUTO_4692 ?AUTO_4690 ) ) ( not ( = ?AUTO_4691 ?AUTO_4690 ) ) ( ON ?AUTO_4691 ?AUTO_4688 ) ( CLEAR ?AUTO_4691 ) ( HOLDING ?AUTO_4690 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4690 )
      ( MAKE-ON ?AUTO_4687 ?AUTO_4688 )
      ( MAKE-ON-VERIFY ?AUTO_4687 ?AUTO_4688 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4693 - BLOCK
      ?AUTO_4694 - BLOCK
    )
    :vars
    (
      ?AUTO_4697 - BLOCK
      ?AUTO_4696 - BLOCK
      ?AUTO_4698 - BLOCK
      ?AUTO_4695 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4693 ?AUTO_4694 ) ) ( ON ?AUTO_4693 ?AUTO_4697 ) ( not ( = ?AUTO_4693 ?AUTO_4697 ) ) ( not ( = ?AUTO_4694 ?AUTO_4697 ) ) ( not ( = ?AUTO_4693 ?AUTO_4696 ) ) ( not ( = ?AUTO_4694 ?AUTO_4696 ) ) ( not ( = ?AUTO_4697 ?AUTO_4696 ) ) ( ON ?AUTO_4696 ?AUTO_4693 ) ( not ( = ?AUTO_4693 ?AUTO_4698 ) ) ( not ( = ?AUTO_4693 ?AUTO_4695 ) ) ( not ( = ?AUTO_4694 ?AUTO_4698 ) ) ( not ( = ?AUTO_4694 ?AUTO_4695 ) ) ( not ( = ?AUTO_4697 ?AUTO_4698 ) ) ( not ( = ?AUTO_4697 ?AUTO_4695 ) ) ( not ( = ?AUTO_4696 ?AUTO_4698 ) ) ( not ( = ?AUTO_4696 ?AUTO_4695 ) ) ( not ( = ?AUTO_4698 ?AUTO_4695 ) ) ( ON ?AUTO_4698 ?AUTO_4694 ) ( CLEAR ?AUTO_4698 ) ( ON ?AUTO_4695 ?AUTO_4696 ) ( CLEAR ?AUTO_4695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4695 ?AUTO_4696 )
      ( MAKE-ON ?AUTO_4693 ?AUTO_4694 )
      ( MAKE-ON-VERIFY ?AUTO_4693 ?AUTO_4694 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4701 - BLOCK
      ?AUTO_4702 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4701 ) ( CLEAR ?AUTO_4702 ) ( not ( = ?AUTO_4701 ?AUTO_4702 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4701 ?AUTO_4702 )
      ( MAKE-ON-VERIFY ?AUTO_4701 ?AUTO_4702 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4703 - BLOCK
      ?AUTO_4704 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4704 ) ( not ( = ?AUTO_4703 ?AUTO_4704 ) ) ( ON-TABLE ?AUTO_4703 ) ( CLEAR ?AUTO_4703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4703 )
      ( MAKE-ON ?AUTO_4703 ?AUTO_4704 )
      ( MAKE-ON-VERIFY ?AUTO_4703 ?AUTO_4704 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4705 - BLOCK
      ?AUTO_4706 - BLOCK
    )
    :vars
    (
      ?AUTO_4707 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4705 ?AUTO_4706 ) ) ( ON-TABLE ?AUTO_4705 ) ( CLEAR ?AUTO_4705 ) ( HOLDING ?AUTO_4706 ) ( CLEAR ?AUTO_4707 ) ( not ( = ?AUTO_4705 ?AUTO_4707 ) ) ( not ( = ?AUTO_4706 ?AUTO_4707 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4706 ?AUTO_4707 )
      ( MAKE-ON ?AUTO_4705 ?AUTO_4706 )
      ( MAKE-ON-VERIFY ?AUTO_4705 ?AUTO_4706 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4708 - BLOCK
      ?AUTO_4709 - BLOCK
    )
    :vars
    (
      ?AUTO_4710 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4708 ?AUTO_4709 ) ) ( ON-TABLE ?AUTO_4708 ) ( CLEAR ?AUTO_4710 ) ( not ( = ?AUTO_4708 ?AUTO_4710 ) ) ( not ( = ?AUTO_4709 ?AUTO_4710 ) ) ( ON ?AUTO_4709 ?AUTO_4708 ) ( CLEAR ?AUTO_4709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4709 ?AUTO_4708 )
      ( MAKE-ON ?AUTO_4708 ?AUTO_4709 )
      ( MAKE-ON-VERIFY ?AUTO_4708 ?AUTO_4709 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4711 - BLOCK
      ?AUTO_4712 - BLOCK
    )
    :vars
    (
      ?AUTO_4713 - BLOCK
      ?AUTO_4714 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4711 ?AUTO_4712 ) ) ( ON-TABLE ?AUTO_4711 ) ( CLEAR ?AUTO_4713 ) ( not ( = ?AUTO_4711 ?AUTO_4713 ) ) ( not ( = ?AUTO_4712 ?AUTO_4713 ) ) ( ON ?AUTO_4712 ?AUTO_4711 ) ( CLEAR ?AUTO_4712 ) ( HOLDING ?AUTO_4714 ) ( not ( = ?AUTO_4711 ?AUTO_4714 ) ) ( not ( = ?AUTO_4712 ?AUTO_4714 ) ) ( not ( = ?AUTO_4713 ?AUTO_4714 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4714 )
      ( MAKE-ON ?AUTO_4711 ?AUTO_4712 )
      ( MAKE-ON-VERIFY ?AUTO_4711 ?AUTO_4712 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4715 - BLOCK
      ?AUTO_4716 - BLOCK
    )
    :vars
    (
      ?AUTO_4717 - BLOCK
      ?AUTO_4718 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4715 ?AUTO_4716 ) ) ( ON-TABLE ?AUTO_4715 ) ( CLEAR ?AUTO_4717 ) ( not ( = ?AUTO_4715 ?AUTO_4717 ) ) ( not ( = ?AUTO_4716 ?AUTO_4717 ) ) ( ON ?AUTO_4716 ?AUTO_4715 ) ( not ( = ?AUTO_4715 ?AUTO_4718 ) ) ( not ( = ?AUTO_4716 ?AUTO_4718 ) ) ( not ( = ?AUTO_4717 ?AUTO_4718 ) ) ( ON ?AUTO_4718 ?AUTO_4716 ) ( CLEAR ?AUTO_4718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4718 ?AUTO_4716 )
      ( MAKE-ON ?AUTO_4715 ?AUTO_4716 )
      ( MAKE-ON-VERIFY ?AUTO_4715 ?AUTO_4716 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4719 - BLOCK
      ?AUTO_4720 - BLOCK
    )
    :vars
    (
      ?AUTO_4721 - BLOCK
      ?AUTO_4722 - BLOCK
      ?AUTO_4723 - BLOCK
      ?AUTO_4724 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4719 ?AUTO_4720 ) ) ( ON-TABLE ?AUTO_4719 ) ( CLEAR ?AUTO_4721 ) ( not ( = ?AUTO_4719 ?AUTO_4721 ) ) ( not ( = ?AUTO_4720 ?AUTO_4721 ) ) ( ON ?AUTO_4720 ?AUTO_4719 ) ( not ( = ?AUTO_4719 ?AUTO_4722 ) ) ( not ( = ?AUTO_4720 ?AUTO_4722 ) ) ( not ( = ?AUTO_4721 ?AUTO_4722 ) ) ( ON ?AUTO_4722 ?AUTO_4720 ) ( CLEAR ?AUTO_4722 ) ( HOLDING ?AUTO_4723 ) ( CLEAR ?AUTO_4724 ) ( not ( = ?AUTO_4719 ?AUTO_4723 ) ) ( not ( = ?AUTO_4719 ?AUTO_4724 ) ) ( not ( = ?AUTO_4720 ?AUTO_4723 ) ) ( not ( = ?AUTO_4720 ?AUTO_4724 ) ) ( not ( = ?AUTO_4721 ?AUTO_4723 ) ) ( not ( = ?AUTO_4721 ?AUTO_4724 ) ) ( not ( = ?AUTO_4722 ?AUTO_4723 ) ) ( not ( = ?AUTO_4722 ?AUTO_4724 ) ) ( not ( = ?AUTO_4723 ?AUTO_4724 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4723 ?AUTO_4724 )
      ( MAKE-ON ?AUTO_4719 ?AUTO_4720 )
      ( MAKE-ON-VERIFY ?AUTO_4719 ?AUTO_4720 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4727 - BLOCK
      ?AUTO_4728 - BLOCK
    )
    :vars
    (
      ?AUTO_4729 - BLOCK
      ?AUTO_4730 - BLOCK
      ?AUTO_4731 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4727 ?AUTO_4728 ) ) ( ON-TABLE ?AUTO_4727 ) ( CLEAR ?AUTO_4729 ) ( not ( = ?AUTO_4727 ?AUTO_4729 ) ) ( not ( = ?AUTO_4728 ?AUTO_4729 ) ) ( ON ?AUTO_4728 ?AUTO_4727 ) ( not ( = ?AUTO_4727 ?AUTO_4730 ) ) ( not ( = ?AUTO_4728 ?AUTO_4730 ) ) ( not ( = ?AUTO_4729 ?AUTO_4730 ) ) ( ON ?AUTO_4730 ?AUTO_4728 ) ( CLEAR ?AUTO_4730 ) ( HOLDING ?AUTO_4731 ) ( not ( = ?AUTO_4727 ?AUTO_4731 ) ) ( not ( = ?AUTO_4728 ?AUTO_4731 ) ) ( not ( = ?AUTO_4729 ?AUTO_4731 ) ) ( not ( = ?AUTO_4730 ?AUTO_4731 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4731 )
      ( MAKE-ON ?AUTO_4727 ?AUTO_4728 )
      ( MAKE-ON-VERIFY ?AUTO_4727 ?AUTO_4728 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4732 - BLOCK
      ?AUTO_4733 - BLOCK
    )
    :vars
    (
      ?AUTO_4735 - BLOCK
      ?AUTO_4734 - BLOCK
      ?AUTO_4736 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4732 ?AUTO_4733 ) ) ( ON-TABLE ?AUTO_4732 ) ( CLEAR ?AUTO_4735 ) ( not ( = ?AUTO_4732 ?AUTO_4735 ) ) ( not ( = ?AUTO_4733 ?AUTO_4735 ) ) ( ON ?AUTO_4733 ?AUTO_4732 ) ( not ( = ?AUTO_4732 ?AUTO_4734 ) ) ( not ( = ?AUTO_4733 ?AUTO_4734 ) ) ( not ( = ?AUTO_4735 ?AUTO_4734 ) ) ( ON ?AUTO_4734 ?AUTO_4733 ) ( not ( = ?AUTO_4732 ?AUTO_4736 ) ) ( not ( = ?AUTO_4733 ?AUTO_4736 ) ) ( not ( = ?AUTO_4735 ?AUTO_4736 ) ) ( not ( = ?AUTO_4734 ?AUTO_4736 ) ) ( ON ?AUTO_4736 ?AUTO_4734 ) ( CLEAR ?AUTO_4736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4736 ?AUTO_4734 )
      ( MAKE-ON ?AUTO_4732 ?AUTO_4733 )
      ( MAKE-ON-VERIFY ?AUTO_4732 ?AUTO_4733 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4739 - BLOCK
      ?AUTO_4740 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4739 ) ( CLEAR ?AUTO_4740 ) ( not ( = ?AUTO_4739 ?AUTO_4740 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4739 ?AUTO_4740 )
      ( MAKE-ON-VERIFY ?AUTO_4739 ?AUTO_4740 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4741 - BLOCK
      ?AUTO_4742 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4742 ) ( not ( = ?AUTO_4741 ?AUTO_4742 ) ) ( ON-TABLE ?AUTO_4741 ) ( CLEAR ?AUTO_4741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4741 )
      ( MAKE-ON ?AUTO_4741 ?AUTO_4742 )
      ( MAKE-ON-VERIFY ?AUTO_4741 ?AUTO_4742 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4743 - BLOCK
      ?AUTO_4744 - BLOCK
    )
    :vars
    (
      ?AUTO_4745 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4743 ?AUTO_4744 ) ) ( ON-TABLE ?AUTO_4743 ) ( CLEAR ?AUTO_4743 ) ( HOLDING ?AUTO_4744 ) ( CLEAR ?AUTO_4745 ) ( not ( = ?AUTO_4743 ?AUTO_4745 ) ) ( not ( = ?AUTO_4744 ?AUTO_4745 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4744 ?AUTO_4745 )
      ( MAKE-ON ?AUTO_4743 ?AUTO_4744 )
      ( MAKE-ON-VERIFY ?AUTO_4743 ?AUTO_4744 ) )
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
      ?AUTO_4751 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4749 ) ( not ( = ?AUTO_4748 ?AUTO_4749 ) ) ( ON-TABLE ?AUTO_4748 ) ( CLEAR ?AUTO_4748 ) ( HOLDING ?AUTO_4750 ) ( CLEAR ?AUTO_4751 ) ( not ( = ?AUTO_4748 ?AUTO_4750 ) ) ( not ( = ?AUTO_4748 ?AUTO_4751 ) ) ( not ( = ?AUTO_4749 ?AUTO_4750 ) ) ( not ( = ?AUTO_4749 ?AUTO_4751 ) ) ( not ( = ?AUTO_4750 ?AUTO_4751 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4750 ?AUTO_4751 )
      ( MAKE-ON ?AUTO_4748 ?AUTO_4749 )
      ( MAKE-ON-VERIFY ?AUTO_4748 ?AUTO_4749 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4752 - BLOCK
      ?AUTO_4753 - BLOCK
    )
    :vars
    (
      ?AUTO_4754 - BLOCK
      ?AUTO_4755 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4752 ?AUTO_4753 ) ) ( ON-TABLE ?AUTO_4752 ) ( CLEAR ?AUTO_4752 ) ( CLEAR ?AUTO_4754 ) ( not ( = ?AUTO_4752 ?AUTO_4755 ) ) ( not ( = ?AUTO_4752 ?AUTO_4754 ) ) ( not ( = ?AUTO_4753 ?AUTO_4755 ) ) ( not ( = ?AUTO_4753 ?AUTO_4754 ) ) ( not ( = ?AUTO_4755 ?AUTO_4754 ) ) ( ON ?AUTO_4755 ?AUTO_4753 ) ( CLEAR ?AUTO_4755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4755 ?AUTO_4753 )
      ( MAKE-ON ?AUTO_4752 ?AUTO_4753 )
      ( MAKE-ON-VERIFY ?AUTO_4752 ?AUTO_4753 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4756 - BLOCK
      ?AUTO_4757 - BLOCK
    )
    :vars
    (
      ?AUTO_4759 - BLOCK
      ?AUTO_4758 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4756 ?AUTO_4757 ) ) ( CLEAR ?AUTO_4759 ) ( not ( = ?AUTO_4756 ?AUTO_4758 ) ) ( not ( = ?AUTO_4756 ?AUTO_4759 ) ) ( not ( = ?AUTO_4757 ?AUTO_4758 ) ) ( not ( = ?AUTO_4757 ?AUTO_4759 ) ) ( not ( = ?AUTO_4758 ?AUTO_4759 ) ) ( ON ?AUTO_4758 ?AUTO_4757 ) ( CLEAR ?AUTO_4758 ) ( HOLDING ?AUTO_4756 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4756 )
      ( MAKE-ON ?AUTO_4756 ?AUTO_4757 )
      ( MAKE-ON-VERIFY ?AUTO_4756 ?AUTO_4757 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4760 - BLOCK
      ?AUTO_4761 - BLOCK
    )
    :vars
    (
      ?AUTO_4762 - BLOCK
      ?AUTO_4763 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4760 ?AUTO_4761 ) ) ( CLEAR ?AUTO_4762 ) ( not ( = ?AUTO_4760 ?AUTO_4763 ) ) ( not ( = ?AUTO_4760 ?AUTO_4762 ) ) ( not ( = ?AUTO_4761 ?AUTO_4763 ) ) ( not ( = ?AUTO_4761 ?AUTO_4762 ) ) ( not ( = ?AUTO_4763 ?AUTO_4762 ) ) ( ON ?AUTO_4763 ?AUTO_4761 ) ( ON ?AUTO_4760 ?AUTO_4763 ) ( CLEAR ?AUTO_4760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4760 ?AUTO_4763 )
      ( MAKE-ON ?AUTO_4760 ?AUTO_4761 )
      ( MAKE-ON-VERIFY ?AUTO_4760 ?AUTO_4761 ) )
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
      ?AUTO_4768 - BLOCK
      ?AUTO_4769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4764 ?AUTO_4765 ) ) ( CLEAR ?AUTO_4766 ) ( not ( = ?AUTO_4764 ?AUTO_4767 ) ) ( not ( = ?AUTO_4764 ?AUTO_4766 ) ) ( not ( = ?AUTO_4765 ?AUTO_4767 ) ) ( not ( = ?AUTO_4765 ?AUTO_4766 ) ) ( not ( = ?AUTO_4767 ?AUTO_4766 ) ) ( ON ?AUTO_4767 ?AUTO_4765 ) ( ON ?AUTO_4764 ?AUTO_4767 ) ( CLEAR ?AUTO_4764 ) ( HOLDING ?AUTO_4768 ) ( CLEAR ?AUTO_4769 ) ( not ( = ?AUTO_4764 ?AUTO_4768 ) ) ( not ( = ?AUTO_4764 ?AUTO_4769 ) ) ( not ( = ?AUTO_4765 ?AUTO_4768 ) ) ( not ( = ?AUTO_4765 ?AUTO_4769 ) ) ( not ( = ?AUTO_4766 ?AUTO_4768 ) ) ( not ( = ?AUTO_4766 ?AUTO_4769 ) ) ( not ( = ?AUTO_4767 ?AUTO_4768 ) ) ( not ( = ?AUTO_4767 ?AUTO_4769 ) ) ( not ( = ?AUTO_4768 ?AUTO_4769 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4768 ?AUTO_4769 )
      ( MAKE-ON ?AUTO_4764 ?AUTO_4765 )
      ( MAKE-ON-VERIFY ?AUTO_4764 ?AUTO_4765 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4772 - BLOCK
      ?AUTO_4773 - BLOCK
    )
    :vars
    (
      ?AUTO_4774 - BLOCK
      ?AUTO_4775 - BLOCK
      ?AUTO_4776 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4772 ?AUTO_4773 ) ) ( CLEAR ?AUTO_4774 ) ( not ( = ?AUTO_4772 ?AUTO_4775 ) ) ( not ( = ?AUTO_4772 ?AUTO_4774 ) ) ( not ( = ?AUTO_4773 ?AUTO_4775 ) ) ( not ( = ?AUTO_4773 ?AUTO_4774 ) ) ( not ( = ?AUTO_4775 ?AUTO_4774 ) ) ( ON ?AUTO_4775 ?AUTO_4773 ) ( ON ?AUTO_4772 ?AUTO_4775 ) ( CLEAR ?AUTO_4772 ) ( HOLDING ?AUTO_4776 ) ( not ( = ?AUTO_4772 ?AUTO_4776 ) ) ( not ( = ?AUTO_4773 ?AUTO_4776 ) ) ( not ( = ?AUTO_4774 ?AUTO_4776 ) ) ( not ( = ?AUTO_4775 ?AUTO_4776 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4776 )
      ( MAKE-ON ?AUTO_4772 ?AUTO_4773 )
      ( MAKE-ON-VERIFY ?AUTO_4772 ?AUTO_4773 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4777 - BLOCK
      ?AUTO_4778 - BLOCK
    )
    :vars
    (
      ?AUTO_4779 - BLOCK
      ?AUTO_4781 - BLOCK
      ?AUTO_4780 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4777 ?AUTO_4778 ) ) ( CLEAR ?AUTO_4779 ) ( not ( = ?AUTO_4777 ?AUTO_4781 ) ) ( not ( = ?AUTO_4777 ?AUTO_4779 ) ) ( not ( = ?AUTO_4778 ?AUTO_4781 ) ) ( not ( = ?AUTO_4778 ?AUTO_4779 ) ) ( not ( = ?AUTO_4781 ?AUTO_4779 ) ) ( ON ?AUTO_4781 ?AUTO_4778 ) ( ON ?AUTO_4777 ?AUTO_4781 ) ( not ( = ?AUTO_4777 ?AUTO_4780 ) ) ( not ( = ?AUTO_4778 ?AUTO_4780 ) ) ( not ( = ?AUTO_4779 ?AUTO_4780 ) ) ( not ( = ?AUTO_4781 ?AUTO_4780 ) ) ( ON ?AUTO_4780 ?AUTO_4777 ) ( CLEAR ?AUTO_4780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4780 ?AUTO_4777 )
      ( MAKE-ON ?AUTO_4777 ?AUTO_4778 )
      ( MAKE-ON-VERIFY ?AUTO_4777 ?AUTO_4778 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4784 - BLOCK
      ?AUTO_4785 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4784 ) ( CLEAR ?AUTO_4785 ) ( not ( = ?AUTO_4784 ?AUTO_4785 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4784 ?AUTO_4785 )
      ( MAKE-ON-VERIFY ?AUTO_4784 ?AUTO_4785 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4786 - BLOCK
      ?AUTO_4787 - BLOCK
    )
    :vars
    (
      ?AUTO_4788 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4787 ) ( not ( = ?AUTO_4786 ?AUTO_4787 ) ) ( ON ?AUTO_4786 ?AUTO_4788 ) ( CLEAR ?AUTO_4786 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4786 ?AUTO_4788 ) ) ( not ( = ?AUTO_4787 ?AUTO_4788 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4786 ?AUTO_4788 )
      ( MAKE-ON ?AUTO_4786 ?AUTO_4787 )
      ( MAKE-ON-VERIFY ?AUTO_4786 ?AUTO_4787 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4790 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4790 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4790 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4790 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4791 - BLOCK
    )
    :vars
    (
      ?AUTO_4792 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4791 ?AUTO_4792 ) ( CLEAR ?AUTO_4791 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4791 ?AUTO_4792 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4791 ?AUTO_4792 )
      ( MAKE-ON-TABLE ?AUTO_4791 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4791 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4793 - BLOCK
    )
    :vars
    (
      ?AUTO_4794 - BLOCK
      ?AUTO_4795 - BLOCK
      ?AUTO_4796 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4793 ?AUTO_4794 ) ( CLEAR ?AUTO_4793 ) ( not ( = ?AUTO_4793 ?AUTO_4794 ) ) ( HOLDING ?AUTO_4795 ) ( CLEAR ?AUTO_4796 ) ( not ( = ?AUTO_4793 ?AUTO_4795 ) ) ( not ( = ?AUTO_4793 ?AUTO_4796 ) ) ( not ( = ?AUTO_4794 ?AUTO_4795 ) ) ( not ( = ?AUTO_4794 ?AUTO_4796 ) ) ( not ( = ?AUTO_4795 ?AUTO_4796 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4795 ?AUTO_4796 )
      ( MAKE-ON-TABLE ?AUTO_4793 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4793 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4797 - BLOCK
    )
    :vars
    (
      ?AUTO_4798 - BLOCK
      ?AUTO_4800 - BLOCK
      ?AUTO_4799 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4797 ?AUTO_4798 ) ( not ( = ?AUTO_4797 ?AUTO_4798 ) ) ( CLEAR ?AUTO_4800 ) ( not ( = ?AUTO_4797 ?AUTO_4799 ) ) ( not ( = ?AUTO_4797 ?AUTO_4800 ) ) ( not ( = ?AUTO_4798 ?AUTO_4799 ) ) ( not ( = ?AUTO_4798 ?AUTO_4800 ) ) ( not ( = ?AUTO_4799 ?AUTO_4800 ) ) ( ON ?AUTO_4799 ?AUTO_4797 ) ( CLEAR ?AUTO_4799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4799 ?AUTO_4797 )
      ( MAKE-ON-TABLE ?AUTO_4797 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4797 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4803 - BLOCK
      ?AUTO_4804 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4803 ) ( CLEAR ?AUTO_4804 ) ( not ( = ?AUTO_4803 ?AUTO_4804 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4803 ?AUTO_4804 )
      ( MAKE-ON-VERIFY ?AUTO_4803 ?AUTO_4804 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4805 - BLOCK
      ?AUTO_4806 - BLOCK
    )
    :vars
    (
      ?AUTO_4807 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4806 ) ( not ( = ?AUTO_4805 ?AUTO_4806 ) ) ( ON ?AUTO_4805 ?AUTO_4807 ) ( CLEAR ?AUTO_4805 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4805 ?AUTO_4807 ) ) ( not ( = ?AUTO_4806 ?AUTO_4807 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4805 ?AUTO_4807 )
      ( MAKE-ON ?AUTO_4805 ?AUTO_4806 )
      ( MAKE-ON-VERIFY ?AUTO_4805 ?AUTO_4806 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4808 - BLOCK
      ?AUTO_4809 - BLOCK
    )
    :vars
    (
      ?AUTO_4810 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4808 ?AUTO_4809 ) ) ( ON ?AUTO_4808 ?AUTO_4810 ) ( CLEAR ?AUTO_4808 ) ( not ( = ?AUTO_4808 ?AUTO_4810 ) ) ( not ( = ?AUTO_4809 ?AUTO_4810 ) ) ( HOLDING ?AUTO_4809 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4809 )
      ( MAKE-ON ?AUTO_4808 ?AUTO_4809 )
      ( MAKE-ON-VERIFY ?AUTO_4808 ?AUTO_4809 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4818 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4818 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4818 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4818 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4819 - BLOCK
    )
    :vars
    (
      ?AUTO_4820 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4819 ?AUTO_4820 ) ( CLEAR ?AUTO_4819 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4819 ?AUTO_4820 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4819 ?AUTO_4820 )
      ( MAKE-ON-TABLE ?AUTO_4819 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4819 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4821 - BLOCK
    )
    :vars
    (
      ?AUTO_4822 - BLOCK
      ?AUTO_4823 - BLOCK
      ?AUTO_4824 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4821 ?AUTO_4822 ) ( CLEAR ?AUTO_4821 ) ( not ( = ?AUTO_4821 ?AUTO_4822 ) ) ( HOLDING ?AUTO_4823 ) ( CLEAR ?AUTO_4824 ) ( not ( = ?AUTO_4821 ?AUTO_4823 ) ) ( not ( = ?AUTO_4821 ?AUTO_4824 ) ) ( not ( = ?AUTO_4822 ?AUTO_4823 ) ) ( not ( = ?AUTO_4822 ?AUTO_4824 ) ) ( not ( = ?AUTO_4823 ?AUTO_4824 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4823 ?AUTO_4824 )
      ( MAKE-ON-TABLE ?AUTO_4821 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4821 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4827 - BLOCK
    )
    :vars
    (
      ?AUTO_4830 - BLOCK
      ?AUTO_4828 - BLOCK
      ?AUTO_4829 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4827 ?AUTO_4830 ) ( not ( = ?AUTO_4827 ?AUTO_4830 ) ) ( CLEAR ?AUTO_4828 ) ( not ( = ?AUTO_4827 ?AUTO_4829 ) ) ( not ( = ?AUTO_4827 ?AUTO_4828 ) ) ( not ( = ?AUTO_4830 ?AUTO_4829 ) ) ( not ( = ?AUTO_4830 ?AUTO_4828 ) ) ( not ( = ?AUTO_4829 ?AUTO_4828 ) ) ( ON ?AUTO_4829 ?AUTO_4827 ) ( CLEAR ?AUTO_4829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4829 ?AUTO_4827 )
      ( MAKE-ON-TABLE ?AUTO_4827 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4827 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4831 - BLOCK
    )
    :vars
    (
      ?AUTO_4834 - BLOCK
      ?AUTO_4832 - BLOCK
      ?AUTO_4833 - BLOCK
      ?AUTO_4835 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4831 ?AUTO_4834 ) ( not ( = ?AUTO_4831 ?AUTO_4834 ) ) ( not ( = ?AUTO_4831 ?AUTO_4832 ) ) ( not ( = ?AUTO_4831 ?AUTO_4833 ) ) ( not ( = ?AUTO_4834 ?AUTO_4832 ) ) ( not ( = ?AUTO_4834 ?AUTO_4833 ) ) ( not ( = ?AUTO_4832 ?AUTO_4833 ) ) ( ON ?AUTO_4832 ?AUTO_4831 ) ( CLEAR ?AUTO_4832 ) ( HOLDING ?AUTO_4833 ) ( CLEAR ?AUTO_4835 ) ( not ( = ?AUTO_4831 ?AUTO_4835 ) ) ( not ( = ?AUTO_4834 ?AUTO_4835 ) ) ( not ( = ?AUTO_4832 ?AUTO_4835 ) ) ( not ( = ?AUTO_4833 ?AUTO_4835 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4833 ?AUTO_4835 )
      ( MAKE-ON-TABLE ?AUTO_4831 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4831 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4836 - BLOCK
    )
    :vars
    (
      ?AUTO_4840 - BLOCK
      ?AUTO_4839 - BLOCK
      ?AUTO_4838 - BLOCK
      ?AUTO_4837 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4836 ?AUTO_4840 ) ( not ( = ?AUTO_4836 ?AUTO_4840 ) ) ( not ( = ?AUTO_4836 ?AUTO_4839 ) ) ( not ( = ?AUTO_4836 ?AUTO_4838 ) ) ( not ( = ?AUTO_4840 ?AUTO_4839 ) ) ( not ( = ?AUTO_4840 ?AUTO_4838 ) ) ( not ( = ?AUTO_4839 ?AUTO_4838 ) ) ( ON ?AUTO_4839 ?AUTO_4836 ) ( CLEAR ?AUTO_4837 ) ( not ( = ?AUTO_4836 ?AUTO_4837 ) ) ( not ( = ?AUTO_4840 ?AUTO_4837 ) ) ( not ( = ?AUTO_4839 ?AUTO_4837 ) ) ( not ( = ?AUTO_4838 ?AUTO_4837 ) ) ( ON ?AUTO_4838 ?AUTO_4839 ) ( CLEAR ?AUTO_4838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4838 ?AUTO_4839 )
      ( MAKE-ON-TABLE ?AUTO_4836 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4836 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4843 - BLOCK
      ?AUTO_4844 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4843 ) ( CLEAR ?AUTO_4844 ) ( not ( = ?AUTO_4843 ?AUTO_4844 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4843 ?AUTO_4844 )
      ( MAKE-ON-VERIFY ?AUTO_4843 ?AUTO_4844 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4845 - BLOCK
      ?AUTO_4846 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4846 ) ( not ( = ?AUTO_4845 ?AUTO_4846 ) ) ( ON-TABLE ?AUTO_4845 ) ( CLEAR ?AUTO_4845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4845 )
      ( MAKE-ON ?AUTO_4845 ?AUTO_4846 )
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
    ( and ( CLEAR ?AUTO_4848 ) ( not ( = ?AUTO_4847 ?AUTO_4848 ) ) ( ON-TABLE ?AUTO_4847 ) ( CLEAR ?AUTO_4847 ) ( HOLDING ?AUTO_4849 ) ( not ( = ?AUTO_4847 ?AUTO_4849 ) ) ( not ( = ?AUTO_4848 ?AUTO_4849 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4849 )
      ( MAKE-ON ?AUTO_4847 ?AUTO_4848 )
      ( MAKE-ON-VERIFY ?AUTO_4847 ?AUTO_4848 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4852 - BLOCK
      ?AUTO_4853 - BLOCK
    )
    :vars
    (
      ?AUTO_4854 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4852 ?AUTO_4853 ) ) ( ON-TABLE ?AUTO_4852 ) ( CLEAR ?AUTO_4852 ) ( HOLDING ?AUTO_4853 ) ( CLEAR ?AUTO_4854 ) ( not ( = ?AUTO_4852 ?AUTO_4854 ) ) ( not ( = ?AUTO_4853 ?AUTO_4854 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4853 ?AUTO_4854 )
      ( MAKE-ON ?AUTO_4852 ?AUTO_4853 )
      ( MAKE-ON-VERIFY ?AUTO_4852 ?AUTO_4853 ) )
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
    ( and ( not ( = ?AUTO_4855 ?AUTO_4856 ) ) ( ON-TABLE ?AUTO_4855 ) ( CLEAR ?AUTO_4857 ) ( not ( = ?AUTO_4855 ?AUTO_4857 ) ) ( not ( = ?AUTO_4856 ?AUTO_4857 ) ) ( ON ?AUTO_4856 ?AUTO_4855 ) ( CLEAR ?AUTO_4856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4856 ?AUTO_4855 )
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
    )
    :precondition
    ( and ( not ( = ?AUTO_4858 ?AUTO_4859 ) ) ( ON-TABLE ?AUTO_4858 ) ( not ( = ?AUTO_4858 ?AUTO_4860 ) ) ( not ( = ?AUTO_4859 ?AUTO_4860 ) ) ( ON ?AUTO_4859 ?AUTO_4858 ) ( CLEAR ?AUTO_4859 ) ( HOLDING ?AUTO_4860 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4860 )
      ( MAKE-ON ?AUTO_4858 ?AUTO_4859 )
      ( MAKE-ON-VERIFY ?AUTO_4858 ?AUTO_4859 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4869 - BLOCK
      ?AUTO_4870 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4869 ) ( CLEAR ?AUTO_4870 ) ( not ( = ?AUTO_4869 ?AUTO_4870 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4869 ?AUTO_4870 )
      ( MAKE-ON-VERIFY ?AUTO_4869 ?AUTO_4870 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4871 - BLOCK
      ?AUTO_4872 - BLOCK
    )
    :vars
    (
      ?AUTO_4873 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4872 ) ( not ( = ?AUTO_4871 ?AUTO_4872 ) ) ( ON ?AUTO_4871 ?AUTO_4873 ) ( CLEAR ?AUTO_4871 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4871 ?AUTO_4873 ) ) ( not ( = ?AUTO_4872 ?AUTO_4873 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4871 ?AUTO_4873 )
      ( MAKE-ON ?AUTO_4871 ?AUTO_4872 )
      ( MAKE-ON-VERIFY ?AUTO_4871 ?AUTO_4872 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4874 - BLOCK
      ?AUTO_4875 - BLOCK
    )
    :vars
    (
      ?AUTO_4876 - BLOCK
      ?AUTO_4877 - BLOCK
      ?AUTO_4878 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4875 ) ( not ( = ?AUTO_4874 ?AUTO_4875 ) ) ( ON ?AUTO_4874 ?AUTO_4876 ) ( CLEAR ?AUTO_4874 ) ( not ( = ?AUTO_4874 ?AUTO_4876 ) ) ( not ( = ?AUTO_4875 ?AUTO_4876 ) ) ( HOLDING ?AUTO_4877 ) ( CLEAR ?AUTO_4878 ) ( not ( = ?AUTO_4874 ?AUTO_4877 ) ) ( not ( = ?AUTO_4874 ?AUTO_4878 ) ) ( not ( = ?AUTO_4875 ?AUTO_4877 ) ) ( not ( = ?AUTO_4875 ?AUTO_4878 ) ) ( not ( = ?AUTO_4876 ?AUTO_4877 ) ) ( not ( = ?AUTO_4876 ?AUTO_4878 ) ) ( not ( = ?AUTO_4877 ?AUTO_4878 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4877 ?AUTO_4878 )
      ( MAKE-ON ?AUTO_4874 ?AUTO_4875 )
      ( MAKE-ON-VERIFY ?AUTO_4874 ?AUTO_4875 ) )
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
    )
    :precondition
    ( and ( not ( = ?AUTO_4881 ?AUTO_4882 ) ) ( ON ?AUTO_4881 ?AUTO_4883 ) ( CLEAR ?AUTO_4881 ) ( not ( = ?AUTO_4881 ?AUTO_4883 ) ) ( not ( = ?AUTO_4882 ?AUTO_4883 ) ) ( HOLDING ?AUTO_4882 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4882 )
      ( MAKE-ON ?AUTO_4881 ?AUTO_4882 )
      ( MAKE-ON-VERIFY ?AUTO_4881 ?AUTO_4882 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4884 - BLOCK
      ?AUTO_4885 - BLOCK
    )
    :vars
    (
      ?AUTO_4886 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4884 ?AUTO_4885 ) ) ( ON ?AUTO_4884 ?AUTO_4886 ) ( not ( = ?AUTO_4884 ?AUTO_4886 ) ) ( not ( = ?AUTO_4885 ?AUTO_4886 ) ) ( ON ?AUTO_4885 ?AUTO_4884 ) ( CLEAR ?AUTO_4885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4885 ?AUTO_4884 )
      ( MAKE-ON ?AUTO_4884 ?AUTO_4885 )
      ( MAKE-ON-VERIFY ?AUTO_4884 ?AUTO_4885 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4887 - BLOCK
      ?AUTO_4888 - BLOCK
    )
    :vars
    (
      ?AUTO_4889 - BLOCK
      ?AUTO_4890 - BLOCK
      ?AUTO_4891 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4887 ?AUTO_4888 ) ) ( ON ?AUTO_4887 ?AUTO_4889 ) ( not ( = ?AUTO_4887 ?AUTO_4889 ) ) ( not ( = ?AUTO_4888 ?AUTO_4889 ) ) ( ON ?AUTO_4888 ?AUTO_4887 ) ( CLEAR ?AUTO_4888 ) ( HOLDING ?AUTO_4890 ) ( CLEAR ?AUTO_4891 ) ( not ( = ?AUTO_4887 ?AUTO_4890 ) ) ( not ( = ?AUTO_4887 ?AUTO_4891 ) ) ( not ( = ?AUTO_4888 ?AUTO_4890 ) ) ( not ( = ?AUTO_4888 ?AUTO_4891 ) ) ( not ( = ?AUTO_4889 ?AUTO_4890 ) ) ( not ( = ?AUTO_4889 ?AUTO_4891 ) ) ( not ( = ?AUTO_4890 ?AUTO_4891 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4890 ?AUTO_4891 )
      ( MAKE-ON ?AUTO_4887 ?AUTO_4888 )
      ( MAKE-ON-VERIFY ?AUTO_4887 ?AUTO_4888 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4896 - BLOCK
      ?AUTO_4897 - BLOCK
    )
    :vars
    (
      ?AUTO_4900 - BLOCK
      ?AUTO_4898 - BLOCK
      ?AUTO_4899 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4896 ?AUTO_4897 ) ) ( ON ?AUTO_4896 ?AUTO_4900 ) ( not ( = ?AUTO_4896 ?AUTO_4900 ) ) ( not ( = ?AUTO_4897 ?AUTO_4900 ) ) ( ON ?AUTO_4897 ?AUTO_4896 ) ( CLEAR ?AUTO_4898 ) ( not ( = ?AUTO_4896 ?AUTO_4899 ) ) ( not ( = ?AUTO_4896 ?AUTO_4898 ) ) ( not ( = ?AUTO_4897 ?AUTO_4899 ) ) ( not ( = ?AUTO_4897 ?AUTO_4898 ) ) ( not ( = ?AUTO_4900 ?AUTO_4899 ) ) ( not ( = ?AUTO_4900 ?AUTO_4898 ) ) ( not ( = ?AUTO_4899 ?AUTO_4898 ) ) ( ON ?AUTO_4899 ?AUTO_4897 ) ( CLEAR ?AUTO_4899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4899 ?AUTO_4897 )
      ( MAKE-ON ?AUTO_4896 ?AUTO_4897 )
      ( MAKE-ON-VERIFY ?AUTO_4896 ?AUTO_4897 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4901 - BLOCK
      ?AUTO_4902 - BLOCK
    )
    :vars
    (
      ?AUTO_4905 - BLOCK
      ?AUTO_4903 - BLOCK
      ?AUTO_4904 - BLOCK
      ?AUTO_4906 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4901 ?AUTO_4902 ) ) ( ON ?AUTO_4901 ?AUTO_4905 ) ( not ( = ?AUTO_4901 ?AUTO_4905 ) ) ( not ( = ?AUTO_4902 ?AUTO_4905 ) ) ( ON ?AUTO_4902 ?AUTO_4901 ) ( not ( = ?AUTO_4901 ?AUTO_4903 ) ) ( not ( = ?AUTO_4901 ?AUTO_4904 ) ) ( not ( = ?AUTO_4902 ?AUTO_4903 ) ) ( not ( = ?AUTO_4902 ?AUTO_4904 ) ) ( not ( = ?AUTO_4905 ?AUTO_4903 ) ) ( not ( = ?AUTO_4905 ?AUTO_4904 ) ) ( not ( = ?AUTO_4903 ?AUTO_4904 ) ) ( ON ?AUTO_4903 ?AUTO_4902 ) ( CLEAR ?AUTO_4903 ) ( HOLDING ?AUTO_4904 ) ( CLEAR ?AUTO_4906 ) ( not ( = ?AUTO_4901 ?AUTO_4906 ) ) ( not ( = ?AUTO_4902 ?AUTO_4906 ) ) ( not ( = ?AUTO_4905 ?AUTO_4906 ) ) ( not ( = ?AUTO_4903 ?AUTO_4906 ) ) ( not ( = ?AUTO_4904 ?AUTO_4906 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4904 ?AUTO_4906 )
      ( MAKE-ON ?AUTO_4901 ?AUTO_4902 )
      ( MAKE-ON-VERIFY ?AUTO_4901 ?AUTO_4902 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4907 - BLOCK
      ?AUTO_4908 - BLOCK
    )
    :vars
    (
      ?AUTO_4912 - BLOCK
      ?AUTO_4910 - BLOCK
      ?AUTO_4909 - BLOCK
      ?AUTO_4911 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4907 ?AUTO_4908 ) ) ( ON ?AUTO_4907 ?AUTO_4912 ) ( not ( = ?AUTO_4907 ?AUTO_4912 ) ) ( not ( = ?AUTO_4908 ?AUTO_4912 ) ) ( ON ?AUTO_4908 ?AUTO_4907 ) ( not ( = ?AUTO_4907 ?AUTO_4910 ) ) ( not ( = ?AUTO_4907 ?AUTO_4909 ) ) ( not ( = ?AUTO_4908 ?AUTO_4910 ) ) ( not ( = ?AUTO_4908 ?AUTO_4909 ) ) ( not ( = ?AUTO_4912 ?AUTO_4910 ) ) ( not ( = ?AUTO_4912 ?AUTO_4909 ) ) ( not ( = ?AUTO_4910 ?AUTO_4909 ) ) ( ON ?AUTO_4910 ?AUTO_4908 ) ( CLEAR ?AUTO_4911 ) ( not ( = ?AUTO_4907 ?AUTO_4911 ) ) ( not ( = ?AUTO_4908 ?AUTO_4911 ) ) ( not ( = ?AUTO_4912 ?AUTO_4911 ) ) ( not ( = ?AUTO_4910 ?AUTO_4911 ) ) ( not ( = ?AUTO_4909 ?AUTO_4911 ) ) ( ON ?AUTO_4909 ?AUTO_4910 ) ( CLEAR ?AUTO_4909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4909 ?AUTO_4910 )
      ( MAKE-ON ?AUTO_4907 ?AUTO_4908 )
      ( MAKE-ON-VERIFY ?AUTO_4907 ?AUTO_4908 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4915 - BLOCK
      ?AUTO_4916 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4915 ) ( CLEAR ?AUTO_4916 ) ( not ( = ?AUTO_4915 ?AUTO_4916 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4915 ?AUTO_4916 )
      ( MAKE-ON-VERIFY ?AUTO_4915 ?AUTO_4916 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4917 - BLOCK
      ?AUTO_4918 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4918 ) ( not ( = ?AUTO_4917 ?AUTO_4918 ) ) ( ON-TABLE ?AUTO_4917 ) ( CLEAR ?AUTO_4917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4917 )
      ( MAKE-ON ?AUTO_4917 ?AUTO_4918 )
      ( MAKE-ON-VERIFY ?AUTO_4917 ?AUTO_4918 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4919 - BLOCK
      ?AUTO_4920 - BLOCK
    )
    :vars
    (
      ?AUTO_4921 - BLOCK
      ?AUTO_4922 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4920 ) ( not ( = ?AUTO_4919 ?AUTO_4920 ) ) ( ON-TABLE ?AUTO_4919 ) ( CLEAR ?AUTO_4919 ) ( HOLDING ?AUTO_4921 ) ( CLEAR ?AUTO_4922 ) ( not ( = ?AUTO_4919 ?AUTO_4921 ) ) ( not ( = ?AUTO_4919 ?AUTO_4922 ) ) ( not ( = ?AUTO_4920 ?AUTO_4921 ) ) ( not ( = ?AUTO_4920 ?AUTO_4922 ) ) ( not ( = ?AUTO_4921 ?AUTO_4922 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4921 ?AUTO_4922 )
      ( MAKE-ON ?AUTO_4919 ?AUTO_4920 )
      ( MAKE-ON-VERIFY ?AUTO_4919 ?AUTO_4920 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4923 - BLOCK
      ?AUTO_4924 - BLOCK
    )
    :vars
    (
      ?AUTO_4925 - BLOCK
      ?AUTO_4926 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4924 ) ( not ( = ?AUTO_4923 ?AUTO_4924 ) ) ( ON-TABLE ?AUTO_4923 ) ( CLEAR ?AUTO_4925 ) ( not ( = ?AUTO_4923 ?AUTO_4926 ) ) ( not ( = ?AUTO_4923 ?AUTO_4925 ) ) ( not ( = ?AUTO_4924 ?AUTO_4926 ) ) ( not ( = ?AUTO_4924 ?AUTO_4925 ) ) ( not ( = ?AUTO_4926 ?AUTO_4925 ) ) ( ON ?AUTO_4926 ?AUTO_4923 ) ( CLEAR ?AUTO_4926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4926 ?AUTO_4923 )
      ( MAKE-ON ?AUTO_4923 ?AUTO_4924 )
      ( MAKE-ON-VERIFY ?AUTO_4923 ?AUTO_4924 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4927 - BLOCK
      ?AUTO_4928 - BLOCK
    )
    :vars
    (
      ?AUTO_4930 - BLOCK
      ?AUTO_4929 - BLOCK
      ?AUTO_4931 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4927 ?AUTO_4928 ) ) ( ON-TABLE ?AUTO_4927 ) ( CLEAR ?AUTO_4930 ) ( not ( = ?AUTO_4927 ?AUTO_4929 ) ) ( not ( = ?AUTO_4927 ?AUTO_4930 ) ) ( not ( = ?AUTO_4928 ?AUTO_4929 ) ) ( not ( = ?AUTO_4928 ?AUTO_4930 ) ) ( not ( = ?AUTO_4929 ?AUTO_4930 ) ) ( ON ?AUTO_4929 ?AUTO_4927 ) ( CLEAR ?AUTO_4929 ) ( HOLDING ?AUTO_4928 ) ( CLEAR ?AUTO_4931 ) ( not ( = ?AUTO_4927 ?AUTO_4931 ) ) ( not ( = ?AUTO_4928 ?AUTO_4931 ) ) ( not ( = ?AUTO_4930 ?AUTO_4931 ) ) ( not ( = ?AUTO_4929 ?AUTO_4931 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4928 ?AUTO_4931 )
      ( MAKE-ON ?AUTO_4927 ?AUTO_4928 )
      ( MAKE-ON-VERIFY ?AUTO_4927 ?AUTO_4928 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4934 - BLOCK
      ?AUTO_4935 - BLOCK
    )
    :vars
    (
      ?AUTO_4937 - BLOCK
      ?AUTO_4936 - BLOCK
      ?AUTO_4938 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4935 ) ( not ( = ?AUTO_4934 ?AUTO_4935 ) ) ( ON-TABLE ?AUTO_4934 ) ( CLEAR ?AUTO_4937 ) ( not ( = ?AUTO_4934 ?AUTO_4936 ) ) ( not ( = ?AUTO_4934 ?AUTO_4937 ) ) ( not ( = ?AUTO_4935 ?AUTO_4936 ) ) ( not ( = ?AUTO_4935 ?AUTO_4937 ) ) ( not ( = ?AUTO_4936 ?AUTO_4937 ) ) ( ON ?AUTO_4936 ?AUTO_4934 ) ( CLEAR ?AUTO_4936 ) ( HOLDING ?AUTO_4938 ) ( not ( = ?AUTO_4934 ?AUTO_4938 ) ) ( not ( = ?AUTO_4935 ?AUTO_4938 ) ) ( not ( = ?AUTO_4937 ?AUTO_4938 ) ) ( not ( = ?AUTO_4936 ?AUTO_4938 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4938 )
      ( MAKE-ON ?AUTO_4934 ?AUTO_4935 )
      ( MAKE-ON-VERIFY ?AUTO_4934 ?AUTO_4935 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4939 - BLOCK
      ?AUTO_4940 - BLOCK
    )
    :vars
    (
      ?AUTO_4942 - BLOCK
      ?AUTO_4941 - BLOCK
      ?AUTO_4943 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4940 ) ( not ( = ?AUTO_4939 ?AUTO_4940 ) ) ( ON-TABLE ?AUTO_4939 ) ( CLEAR ?AUTO_4942 ) ( not ( = ?AUTO_4939 ?AUTO_4941 ) ) ( not ( = ?AUTO_4939 ?AUTO_4942 ) ) ( not ( = ?AUTO_4940 ?AUTO_4941 ) ) ( not ( = ?AUTO_4940 ?AUTO_4942 ) ) ( not ( = ?AUTO_4941 ?AUTO_4942 ) ) ( ON ?AUTO_4941 ?AUTO_4939 ) ( not ( = ?AUTO_4939 ?AUTO_4943 ) ) ( not ( = ?AUTO_4940 ?AUTO_4943 ) ) ( not ( = ?AUTO_4942 ?AUTO_4943 ) ) ( not ( = ?AUTO_4941 ?AUTO_4943 ) ) ( ON ?AUTO_4943 ?AUTO_4941 ) ( CLEAR ?AUTO_4943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4943 ?AUTO_4941 )
      ( MAKE-ON ?AUTO_4939 ?AUTO_4940 )
      ( MAKE-ON-VERIFY ?AUTO_4939 ?AUTO_4940 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4944 - BLOCK
      ?AUTO_4945 - BLOCK
    )
    :vars
    (
      ?AUTO_4946 - BLOCK
      ?AUTO_4947 - BLOCK
      ?AUTO_4948 - BLOCK
      ?AUTO_4949 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4945 ) ( not ( = ?AUTO_4944 ?AUTO_4945 ) ) ( ON-TABLE ?AUTO_4944 ) ( not ( = ?AUTO_4944 ?AUTO_4946 ) ) ( not ( = ?AUTO_4944 ?AUTO_4947 ) ) ( not ( = ?AUTO_4945 ?AUTO_4946 ) ) ( not ( = ?AUTO_4945 ?AUTO_4947 ) ) ( not ( = ?AUTO_4946 ?AUTO_4947 ) ) ( ON ?AUTO_4946 ?AUTO_4944 ) ( not ( = ?AUTO_4944 ?AUTO_4948 ) ) ( not ( = ?AUTO_4945 ?AUTO_4948 ) ) ( not ( = ?AUTO_4947 ?AUTO_4948 ) ) ( not ( = ?AUTO_4946 ?AUTO_4948 ) ) ( ON ?AUTO_4948 ?AUTO_4946 ) ( CLEAR ?AUTO_4948 ) ( HOLDING ?AUTO_4947 ) ( CLEAR ?AUTO_4949 ) ( not ( = ?AUTO_4944 ?AUTO_4949 ) ) ( not ( = ?AUTO_4945 ?AUTO_4949 ) ) ( not ( = ?AUTO_4946 ?AUTO_4949 ) ) ( not ( = ?AUTO_4947 ?AUTO_4949 ) ) ( not ( = ?AUTO_4948 ?AUTO_4949 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4947 ?AUTO_4949 )
      ( MAKE-ON ?AUTO_4944 ?AUTO_4945 )
      ( MAKE-ON-VERIFY ?AUTO_4944 ?AUTO_4945 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4950 - BLOCK
      ?AUTO_4951 - BLOCK
    )
    :vars
    (
      ?AUTO_4953 - BLOCK
      ?AUTO_4952 - BLOCK
      ?AUTO_4955 - BLOCK
      ?AUTO_4954 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4950 ?AUTO_4951 ) ) ( ON-TABLE ?AUTO_4950 ) ( not ( = ?AUTO_4950 ?AUTO_4953 ) ) ( not ( = ?AUTO_4950 ?AUTO_4952 ) ) ( not ( = ?AUTO_4951 ?AUTO_4953 ) ) ( not ( = ?AUTO_4951 ?AUTO_4952 ) ) ( not ( = ?AUTO_4953 ?AUTO_4952 ) ) ( ON ?AUTO_4953 ?AUTO_4950 ) ( not ( = ?AUTO_4950 ?AUTO_4955 ) ) ( not ( = ?AUTO_4951 ?AUTO_4955 ) ) ( not ( = ?AUTO_4952 ?AUTO_4955 ) ) ( not ( = ?AUTO_4953 ?AUTO_4955 ) ) ( ON ?AUTO_4955 ?AUTO_4953 ) ( CLEAR ?AUTO_4955 ) ( CLEAR ?AUTO_4954 ) ( not ( = ?AUTO_4950 ?AUTO_4954 ) ) ( not ( = ?AUTO_4951 ?AUTO_4954 ) ) ( not ( = ?AUTO_4953 ?AUTO_4954 ) ) ( not ( = ?AUTO_4952 ?AUTO_4954 ) ) ( not ( = ?AUTO_4955 ?AUTO_4954 ) ) ( ON ?AUTO_4952 ?AUTO_4951 ) ( CLEAR ?AUTO_4952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4952 ?AUTO_4951 )
      ( MAKE-ON ?AUTO_4950 ?AUTO_4951 )
      ( MAKE-ON-VERIFY ?AUTO_4950 ?AUTO_4951 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4956 - BLOCK
      ?AUTO_4957 - BLOCK
    )
    :vars
    (
      ?AUTO_4961 - BLOCK
      ?AUTO_4958 - BLOCK
      ?AUTO_4960 - BLOCK
      ?AUTO_4959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4956 ?AUTO_4957 ) ) ( ON-TABLE ?AUTO_4956 ) ( not ( = ?AUTO_4956 ?AUTO_4961 ) ) ( not ( = ?AUTO_4956 ?AUTO_4958 ) ) ( not ( = ?AUTO_4957 ?AUTO_4961 ) ) ( not ( = ?AUTO_4957 ?AUTO_4958 ) ) ( not ( = ?AUTO_4961 ?AUTO_4958 ) ) ( ON ?AUTO_4961 ?AUTO_4956 ) ( not ( = ?AUTO_4956 ?AUTO_4960 ) ) ( not ( = ?AUTO_4957 ?AUTO_4960 ) ) ( not ( = ?AUTO_4958 ?AUTO_4960 ) ) ( not ( = ?AUTO_4961 ?AUTO_4960 ) ) ( ON ?AUTO_4960 ?AUTO_4961 ) ( CLEAR ?AUTO_4960 ) ( not ( = ?AUTO_4956 ?AUTO_4959 ) ) ( not ( = ?AUTO_4957 ?AUTO_4959 ) ) ( not ( = ?AUTO_4961 ?AUTO_4959 ) ) ( not ( = ?AUTO_4958 ?AUTO_4959 ) ) ( not ( = ?AUTO_4960 ?AUTO_4959 ) ) ( ON ?AUTO_4958 ?AUTO_4957 ) ( CLEAR ?AUTO_4958 ) ( HOLDING ?AUTO_4959 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4959 )
      ( MAKE-ON ?AUTO_4956 ?AUTO_4957 )
      ( MAKE-ON-VERIFY ?AUTO_4956 ?AUTO_4957 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4962 - BLOCK
      ?AUTO_4963 - BLOCK
    )
    :vars
    (
      ?AUTO_4965 - BLOCK
      ?AUTO_4964 - BLOCK
      ?AUTO_4967 - BLOCK
      ?AUTO_4966 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4962 ?AUTO_4963 ) ) ( ON-TABLE ?AUTO_4962 ) ( not ( = ?AUTO_4962 ?AUTO_4965 ) ) ( not ( = ?AUTO_4962 ?AUTO_4964 ) ) ( not ( = ?AUTO_4963 ?AUTO_4965 ) ) ( not ( = ?AUTO_4963 ?AUTO_4964 ) ) ( not ( = ?AUTO_4965 ?AUTO_4964 ) ) ( ON ?AUTO_4965 ?AUTO_4962 ) ( not ( = ?AUTO_4962 ?AUTO_4967 ) ) ( not ( = ?AUTO_4963 ?AUTO_4967 ) ) ( not ( = ?AUTO_4964 ?AUTO_4967 ) ) ( not ( = ?AUTO_4965 ?AUTO_4967 ) ) ( ON ?AUTO_4967 ?AUTO_4965 ) ( not ( = ?AUTO_4962 ?AUTO_4966 ) ) ( not ( = ?AUTO_4963 ?AUTO_4966 ) ) ( not ( = ?AUTO_4965 ?AUTO_4966 ) ) ( not ( = ?AUTO_4964 ?AUTO_4966 ) ) ( not ( = ?AUTO_4967 ?AUTO_4966 ) ) ( ON ?AUTO_4964 ?AUTO_4963 ) ( CLEAR ?AUTO_4964 ) ( ON ?AUTO_4966 ?AUTO_4967 ) ( CLEAR ?AUTO_4966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4966 ?AUTO_4967 )
      ( MAKE-ON ?AUTO_4962 ?AUTO_4963 )
      ( MAKE-ON-VERIFY ?AUTO_4962 ?AUTO_4963 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4968 - BLOCK
      ?AUTO_4969 - BLOCK
    )
    :vars
    (
      ?AUTO_4970 - BLOCK
      ?AUTO_4971 - BLOCK
      ?AUTO_4972 - BLOCK
      ?AUTO_4973 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4968 ?AUTO_4969 ) ) ( ON-TABLE ?AUTO_4968 ) ( not ( = ?AUTO_4968 ?AUTO_4970 ) ) ( not ( = ?AUTO_4968 ?AUTO_4971 ) ) ( not ( = ?AUTO_4969 ?AUTO_4970 ) ) ( not ( = ?AUTO_4969 ?AUTO_4971 ) ) ( not ( = ?AUTO_4970 ?AUTO_4971 ) ) ( ON ?AUTO_4970 ?AUTO_4968 ) ( not ( = ?AUTO_4968 ?AUTO_4972 ) ) ( not ( = ?AUTO_4969 ?AUTO_4972 ) ) ( not ( = ?AUTO_4971 ?AUTO_4972 ) ) ( not ( = ?AUTO_4970 ?AUTO_4972 ) ) ( ON ?AUTO_4972 ?AUTO_4970 ) ( not ( = ?AUTO_4968 ?AUTO_4973 ) ) ( not ( = ?AUTO_4969 ?AUTO_4973 ) ) ( not ( = ?AUTO_4970 ?AUTO_4973 ) ) ( not ( = ?AUTO_4971 ?AUTO_4973 ) ) ( not ( = ?AUTO_4972 ?AUTO_4973 ) ) ( ON ?AUTO_4973 ?AUTO_4972 ) ( CLEAR ?AUTO_4973 ) ( HOLDING ?AUTO_4971 ) ( CLEAR ?AUTO_4969 ) )
    :subtasks
    ( ( !STACK ?AUTO_4971 ?AUTO_4969 )
      ( MAKE-ON ?AUTO_4968 ?AUTO_4969 )
      ( MAKE-ON-VERIFY ?AUTO_4968 ?AUTO_4969 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4974 - BLOCK
      ?AUTO_4975 - BLOCK
    )
    :vars
    (
      ?AUTO_4976 - BLOCK
      ?AUTO_4979 - BLOCK
      ?AUTO_4978 - BLOCK
      ?AUTO_4977 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4974 ?AUTO_4975 ) ) ( ON-TABLE ?AUTO_4974 ) ( not ( = ?AUTO_4974 ?AUTO_4976 ) ) ( not ( = ?AUTO_4974 ?AUTO_4979 ) ) ( not ( = ?AUTO_4975 ?AUTO_4976 ) ) ( not ( = ?AUTO_4975 ?AUTO_4979 ) ) ( not ( = ?AUTO_4976 ?AUTO_4979 ) ) ( ON ?AUTO_4976 ?AUTO_4974 ) ( not ( = ?AUTO_4974 ?AUTO_4978 ) ) ( not ( = ?AUTO_4975 ?AUTO_4978 ) ) ( not ( = ?AUTO_4979 ?AUTO_4978 ) ) ( not ( = ?AUTO_4976 ?AUTO_4978 ) ) ( ON ?AUTO_4978 ?AUTO_4976 ) ( not ( = ?AUTO_4974 ?AUTO_4977 ) ) ( not ( = ?AUTO_4975 ?AUTO_4977 ) ) ( not ( = ?AUTO_4976 ?AUTO_4977 ) ) ( not ( = ?AUTO_4979 ?AUTO_4977 ) ) ( not ( = ?AUTO_4978 ?AUTO_4977 ) ) ( ON ?AUTO_4977 ?AUTO_4978 ) ( CLEAR ?AUTO_4975 ) ( ON ?AUTO_4979 ?AUTO_4977 ) ( CLEAR ?AUTO_4979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4979 ?AUTO_4977 )
      ( MAKE-ON ?AUTO_4974 ?AUTO_4975 )
      ( MAKE-ON-VERIFY ?AUTO_4974 ?AUTO_4975 ) )
  )

)

