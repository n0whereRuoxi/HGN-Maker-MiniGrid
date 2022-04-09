( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2 - SURFACE
      ?auto_3 - SURFACE
    )
    :vars
    (
      ?auto_4 - HOIST
      ?auto_5 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4 ?auto_5 ) ( SURFACE-AT ?auto_2 ?auto_5 ) ( CLEAR ?auto_2 ) ( LIFTING ?auto_4 ?auto_3 ) ( IS-CRATE ?auto_3 ) ( not ( = ?auto_2 ?auto_3 ) ) )
    :subtasks
    ( ( !DROP ?auto_4 ?auto_3 ?auto_2 ?auto_5 )
      ( MAKE-1CRATE-VERIFY ?auto_2 ?auto_3 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6 - SURFACE
      ?auto_7 - SURFACE
    )
    :vars
    (
      ?auto_9 - HOIST
      ?auto_8 - PLACE
      ?auto_10 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9 ?auto_8 ) ( SURFACE-AT ?auto_6 ?auto_8 ) ( CLEAR ?auto_6 ) ( IS-CRATE ?auto_7 ) ( not ( = ?auto_6 ?auto_7 ) ) ( TRUCK-AT ?auto_10 ?auto_8 ) ( AVAILABLE ?auto_9 ) ( IN ?auto_7 ?auto_10 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9 ?auto_7 ?auto_10 ?auto_8 )
      ( MAKE-1CRATE ?auto_6 ?auto_7 )
      ( MAKE-1CRATE-VERIFY ?auto_6 ?auto_7 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11 - SURFACE
      ?auto_12 - SURFACE
    )
    :vars
    (
      ?auto_15 - HOIST
      ?auto_14 - PLACE
      ?auto_13 - TRUCK
      ?auto_16 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15 ?auto_14 ) ( SURFACE-AT ?auto_11 ?auto_14 ) ( CLEAR ?auto_11 ) ( IS-CRATE ?auto_12 ) ( not ( = ?auto_11 ?auto_12 ) ) ( AVAILABLE ?auto_15 ) ( IN ?auto_12 ?auto_13 ) ( TRUCK-AT ?auto_13 ?auto_16 ) ( not ( = ?auto_16 ?auto_14 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13 ?auto_16 ?auto_14 )
      ( MAKE-1CRATE ?auto_11 ?auto_12 )
      ( MAKE-1CRATE-VERIFY ?auto_11 ?auto_12 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17 - SURFACE
      ?auto_18 - SURFACE
    )
    :vars
    (
      ?auto_19 - HOIST
      ?auto_22 - PLACE
      ?auto_20 - TRUCK
      ?auto_21 - PLACE
      ?auto_23 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19 ?auto_22 ) ( SURFACE-AT ?auto_17 ?auto_22 ) ( CLEAR ?auto_17 ) ( IS-CRATE ?auto_18 ) ( not ( = ?auto_17 ?auto_18 ) ) ( AVAILABLE ?auto_19 ) ( TRUCK-AT ?auto_20 ?auto_21 ) ( not ( = ?auto_21 ?auto_22 ) ) ( HOIST-AT ?auto_23 ?auto_21 ) ( LIFTING ?auto_23 ?auto_18 ) ( not ( = ?auto_19 ?auto_23 ) ) )
    :subtasks
    ( ( !LOAD ?auto_23 ?auto_18 ?auto_20 ?auto_21 )
      ( MAKE-1CRATE ?auto_17 ?auto_18 )
      ( MAKE-1CRATE-VERIFY ?auto_17 ?auto_18 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24 - SURFACE
      ?auto_25 - SURFACE
    )
    :vars
    (
      ?auto_28 - HOIST
      ?auto_30 - PLACE
      ?auto_29 - TRUCK
      ?auto_26 - PLACE
      ?auto_27 - HOIST
      ?auto_31 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28 ?auto_30 ) ( SURFACE-AT ?auto_24 ?auto_30 ) ( CLEAR ?auto_24 ) ( IS-CRATE ?auto_25 ) ( not ( = ?auto_24 ?auto_25 ) ) ( AVAILABLE ?auto_28 ) ( TRUCK-AT ?auto_29 ?auto_26 ) ( not ( = ?auto_26 ?auto_30 ) ) ( HOIST-AT ?auto_27 ?auto_26 ) ( not ( = ?auto_28 ?auto_27 ) ) ( AVAILABLE ?auto_27 ) ( SURFACE-AT ?auto_25 ?auto_26 ) ( ON ?auto_25 ?auto_31 ) ( CLEAR ?auto_25 ) ( not ( = ?auto_24 ?auto_31 ) ) ( not ( = ?auto_25 ?auto_31 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27 ?auto_25 ?auto_31 ?auto_26 )
      ( MAKE-1CRATE ?auto_24 ?auto_25 )
      ( MAKE-1CRATE-VERIFY ?auto_24 ?auto_25 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32 - SURFACE
      ?auto_33 - SURFACE
    )
    :vars
    (
      ?auto_35 - HOIST
      ?auto_38 - PLACE
      ?auto_37 - PLACE
      ?auto_36 - HOIST
      ?auto_34 - SURFACE
      ?auto_39 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35 ?auto_38 ) ( SURFACE-AT ?auto_32 ?auto_38 ) ( CLEAR ?auto_32 ) ( IS-CRATE ?auto_33 ) ( not ( = ?auto_32 ?auto_33 ) ) ( AVAILABLE ?auto_35 ) ( not ( = ?auto_37 ?auto_38 ) ) ( HOIST-AT ?auto_36 ?auto_37 ) ( not ( = ?auto_35 ?auto_36 ) ) ( AVAILABLE ?auto_36 ) ( SURFACE-AT ?auto_33 ?auto_37 ) ( ON ?auto_33 ?auto_34 ) ( CLEAR ?auto_33 ) ( not ( = ?auto_32 ?auto_34 ) ) ( not ( = ?auto_33 ?auto_34 ) ) ( TRUCK-AT ?auto_39 ?auto_38 ) )
    :subtasks
    ( ( !DRIVE ?auto_39 ?auto_38 ?auto_37 )
      ( MAKE-1CRATE ?auto_32 ?auto_33 )
      ( MAKE-1CRATE-VERIFY ?auto_32 ?auto_33 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49 - SURFACE
      ?auto_50 - SURFACE
      ?auto_51 - SURFACE
    )
    :vars
    (
      ?auto_52 - HOIST
      ?auto_53 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52 ?auto_53 ) ( SURFACE-AT ?auto_50 ?auto_53 ) ( CLEAR ?auto_50 ) ( LIFTING ?auto_52 ?auto_51 ) ( IS-CRATE ?auto_51 ) ( not ( = ?auto_50 ?auto_51 ) ) ( ON ?auto_50 ?auto_49 ) ( not ( = ?auto_49 ?auto_50 ) ) ( not ( = ?auto_49 ?auto_51 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_50 ?auto_51 )
      ( MAKE-2CRATE-VERIFY ?auto_49 ?auto_50 ?auto_51 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_59 - SURFACE
      ?auto_60 - SURFACE
      ?auto_61 - SURFACE
    )
    :vars
    (
      ?auto_62 - HOIST
      ?auto_64 - PLACE
      ?auto_63 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_62 ?auto_64 ) ( SURFACE-AT ?auto_60 ?auto_64 ) ( CLEAR ?auto_60 ) ( IS-CRATE ?auto_61 ) ( not ( = ?auto_60 ?auto_61 ) ) ( TRUCK-AT ?auto_63 ?auto_64 ) ( AVAILABLE ?auto_62 ) ( IN ?auto_61 ?auto_63 ) ( ON ?auto_60 ?auto_59 ) ( not ( = ?auto_59 ?auto_60 ) ) ( not ( = ?auto_59 ?auto_61 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_60 ?auto_61 )
      ( MAKE-2CRATE-VERIFY ?auto_59 ?auto_60 ?auto_61 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_65 - SURFACE
      ?auto_66 - SURFACE
    )
    :vars
    (
      ?auto_69 - HOIST
      ?auto_68 - PLACE
      ?auto_70 - TRUCK
      ?auto_67 - SURFACE
      ?auto_71 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_69 ?auto_68 ) ( SURFACE-AT ?auto_65 ?auto_68 ) ( CLEAR ?auto_65 ) ( IS-CRATE ?auto_66 ) ( not ( = ?auto_65 ?auto_66 ) ) ( AVAILABLE ?auto_69 ) ( IN ?auto_66 ?auto_70 ) ( ON ?auto_65 ?auto_67 ) ( not ( = ?auto_67 ?auto_65 ) ) ( not ( = ?auto_67 ?auto_66 ) ) ( TRUCK-AT ?auto_70 ?auto_71 ) ( not ( = ?auto_71 ?auto_68 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_70 ?auto_71 ?auto_68 )
      ( MAKE-2CRATE ?auto_67 ?auto_65 ?auto_66 )
      ( MAKE-1CRATE-VERIFY ?auto_65 ?auto_66 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72 - SURFACE
      ?auto_73 - SURFACE
      ?auto_74 - SURFACE
    )
    :vars
    (
      ?auto_75 - HOIST
      ?auto_78 - PLACE
      ?auto_76 - TRUCK
      ?auto_77 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_75 ?auto_78 ) ( SURFACE-AT ?auto_73 ?auto_78 ) ( CLEAR ?auto_73 ) ( IS-CRATE ?auto_74 ) ( not ( = ?auto_73 ?auto_74 ) ) ( AVAILABLE ?auto_75 ) ( IN ?auto_74 ?auto_76 ) ( ON ?auto_73 ?auto_72 ) ( not ( = ?auto_72 ?auto_73 ) ) ( not ( = ?auto_72 ?auto_74 ) ) ( TRUCK-AT ?auto_76 ?auto_77 ) ( not ( = ?auto_77 ?auto_78 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_73 ?auto_74 )
      ( MAKE-2CRATE-VERIFY ?auto_72 ?auto_73 ?auto_74 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_79 - SURFACE
      ?auto_80 - SURFACE
    )
    :vars
    (
      ?auto_81 - HOIST
      ?auto_83 - PLACE
      ?auto_85 - SURFACE
      ?auto_82 - TRUCK
      ?auto_84 - PLACE
      ?auto_86 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_81 ?auto_83 ) ( SURFACE-AT ?auto_79 ?auto_83 ) ( CLEAR ?auto_79 ) ( IS-CRATE ?auto_80 ) ( not ( = ?auto_79 ?auto_80 ) ) ( AVAILABLE ?auto_81 ) ( ON ?auto_79 ?auto_85 ) ( not ( = ?auto_85 ?auto_79 ) ) ( not ( = ?auto_85 ?auto_80 ) ) ( TRUCK-AT ?auto_82 ?auto_84 ) ( not ( = ?auto_84 ?auto_83 ) ) ( HOIST-AT ?auto_86 ?auto_84 ) ( LIFTING ?auto_86 ?auto_80 ) ( not ( = ?auto_81 ?auto_86 ) ) )
    :subtasks
    ( ( !LOAD ?auto_86 ?auto_80 ?auto_82 ?auto_84 )
      ( MAKE-2CRATE ?auto_85 ?auto_79 ?auto_80 )
      ( MAKE-1CRATE-VERIFY ?auto_79 ?auto_80 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_87 - SURFACE
      ?auto_88 - SURFACE
      ?auto_89 - SURFACE
    )
    :vars
    (
      ?auto_90 - HOIST
      ?auto_91 - PLACE
      ?auto_93 - TRUCK
      ?auto_94 - PLACE
      ?auto_92 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_90 ?auto_91 ) ( SURFACE-AT ?auto_88 ?auto_91 ) ( CLEAR ?auto_88 ) ( IS-CRATE ?auto_89 ) ( not ( = ?auto_88 ?auto_89 ) ) ( AVAILABLE ?auto_90 ) ( ON ?auto_88 ?auto_87 ) ( not ( = ?auto_87 ?auto_88 ) ) ( not ( = ?auto_87 ?auto_89 ) ) ( TRUCK-AT ?auto_93 ?auto_94 ) ( not ( = ?auto_94 ?auto_91 ) ) ( HOIST-AT ?auto_92 ?auto_94 ) ( LIFTING ?auto_92 ?auto_89 ) ( not ( = ?auto_90 ?auto_92 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_88 ?auto_89 )
      ( MAKE-2CRATE-VERIFY ?auto_87 ?auto_88 ?auto_89 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_95 - SURFACE
      ?auto_96 - SURFACE
    )
    :vars
    (
      ?auto_97 - HOIST
      ?auto_101 - PLACE
      ?auto_102 - SURFACE
      ?auto_99 - TRUCK
      ?auto_100 - PLACE
      ?auto_98 - HOIST
      ?auto_103 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_97 ?auto_101 ) ( SURFACE-AT ?auto_95 ?auto_101 ) ( CLEAR ?auto_95 ) ( IS-CRATE ?auto_96 ) ( not ( = ?auto_95 ?auto_96 ) ) ( AVAILABLE ?auto_97 ) ( ON ?auto_95 ?auto_102 ) ( not ( = ?auto_102 ?auto_95 ) ) ( not ( = ?auto_102 ?auto_96 ) ) ( TRUCK-AT ?auto_99 ?auto_100 ) ( not ( = ?auto_100 ?auto_101 ) ) ( HOIST-AT ?auto_98 ?auto_100 ) ( not ( = ?auto_97 ?auto_98 ) ) ( AVAILABLE ?auto_98 ) ( SURFACE-AT ?auto_96 ?auto_100 ) ( ON ?auto_96 ?auto_103 ) ( CLEAR ?auto_96 ) ( not ( = ?auto_95 ?auto_103 ) ) ( not ( = ?auto_96 ?auto_103 ) ) ( not ( = ?auto_102 ?auto_103 ) ) )
    :subtasks
    ( ( !LIFT ?auto_98 ?auto_96 ?auto_103 ?auto_100 )
      ( MAKE-2CRATE ?auto_102 ?auto_95 ?auto_96 )
      ( MAKE-1CRATE-VERIFY ?auto_95 ?auto_96 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_104 - SURFACE
      ?auto_105 - SURFACE
      ?auto_106 - SURFACE
    )
    :vars
    (
      ?auto_112 - HOIST
      ?auto_107 - PLACE
      ?auto_110 - TRUCK
      ?auto_109 - PLACE
      ?auto_111 - HOIST
      ?auto_108 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112 ?auto_107 ) ( SURFACE-AT ?auto_105 ?auto_107 ) ( CLEAR ?auto_105 ) ( IS-CRATE ?auto_106 ) ( not ( = ?auto_105 ?auto_106 ) ) ( AVAILABLE ?auto_112 ) ( ON ?auto_105 ?auto_104 ) ( not ( = ?auto_104 ?auto_105 ) ) ( not ( = ?auto_104 ?auto_106 ) ) ( TRUCK-AT ?auto_110 ?auto_109 ) ( not ( = ?auto_109 ?auto_107 ) ) ( HOIST-AT ?auto_111 ?auto_109 ) ( not ( = ?auto_112 ?auto_111 ) ) ( AVAILABLE ?auto_111 ) ( SURFACE-AT ?auto_106 ?auto_109 ) ( ON ?auto_106 ?auto_108 ) ( CLEAR ?auto_106 ) ( not ( = ?auto_105 ?auto_108 ) ) ( not ( = ?auto_106 ?auto_108 ) ) ( not ( = ?auto_104 ?auto_108 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_105 ?auto_106 )
      ( MAKE-2CRATE-VERIFY ?auto_104 ?auto_105 ?auto_106 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_113 - SURFACE
      ?auto_114 - SURFACE
    )
    :vars
    (
      ?auto_116 - HOIST
      ?auto_115 - PLACE
      ?auto_121 - SURFACE
      ?auto_117 - PLACE
      ?auto_120 - HOIST
      ?auto_119 - SURFACE
      ?auto_118 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_116 ?auto_115 ) ( SURFACE-AT ?auto_113 ?auto_115 ) ( CLEAR ?auto_113 ) ( IS-CRATE ?auto_114 ) ( not ( = ?auto_113 ?auto_114 ) ) ( AVAILABLE ?auto_116 ) ( ON ?auto_113 ?auto_121 ) ( not ( = ?auto_121 ?auto_113 ) ) ( not ( = ?auto_121 ?auto_114 ) ) ( not ( = ?auto_117 ?auto_115 ) ) ( HOIST-AT ?auto_120 ?auto_117 ) ( not ( = ?auto_116 ?auto_120 ) ) ( AVAILABLE ?auto_120 ) ( SURFACE-AT ?auto_114 ?auto_117 ) ( ON ?auto_114 ?auto_119 ) ( CLEAR ?auto_114 ) ( not ( = ?auto_113 ?auto_119 ) ) ( not ( = ?auto_114 ?auto_119 ) ) ( not ( = ?auto_121 ?auto_119 ) ) ( TRUCK-AT ?auto_118 ?auto_115 ) )
    :subtasks
    ( ( !DRIVE ?auto_118 ?auto_115 ?auto_117 )
      ( MAKE-2CRATE ?auto_121 ?auto_113 ?auto_114 )
      ( MAKE-1CRATE-VERIFY ?auto_113 ?auto_114 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_122 - SURFACE
      ?auto_123 - SURFACE
      ?auto_124 - SURFACE
    )
    :vars
    (
      ?auto_127 - HOIST
      ?auto_130 - PLACE
      ?auto_128 - PLACE
      ?auto_126 - HOIST
      ?auto_125 - SURFACE
      ?auto_129 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_127 ?auto_130 ) ( SURFACE-AT ?auto_123 ?auto_130 ) ( CLEAR ?auto_123 ) ( IS-CRATE ?auto_124 ) ( not ( = ?auto_123 ?auto_124 ) ) ( AVAILABLE ?auto_127 ) ( ON ?auto_123 ?auto_122 ) ( not ( = ?auto_122 ?auto_123 ) ) ( not ( = ?auto_122 ?auto_124 ) ) ( not ( = ?auto_128 ?auto_130 ) ) ( HOIST-AT ?auto_126 ?auto_128 ) ( not ( = ?auto_127 ?auto_126 ) ) ( AVAILABLE ?auto_126 ) ( SURFACE-AT ?auto_124 ?auto_128 ) ( ON ?auto_124 ?auto_125 ) ( CLEAR ?auto_124 ) ( not ( = ?auto_123 ?auto_125 ) ) ( not ( = ?auto_124 ?auto_125 ) ) ( not ( = ?auto_122 ?auto_125 ) ) ( TRUCK-AT ?auto_129 ?auto_130 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_123 ?auto_124 )
      ( MAKE-2CRATE-VERIFY ?auto_122 ?auto_123 ?auto_124 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_131 - SURFACE
      ?auto_132 - SURFACE
    )
    :vars
    (
      ?auto_136 - HOIST
      ?auto_134 - PLACE
      ?auto_139 - SURFACE
      ?auto_135 - PLACE
      ?auto_138 - HOIST
      ?auto_137 - SURFACE
      ?auto_133 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_136 ?auto_134 ) ( IS-CRATE ?auto_132 ) ( not ( = ?auto_131 ?auto_132 ) ) ( not ( = ?auto_139 ?auto_131 ) ) ( not ( = ?auto_139 ?auto_132 ) ) ( not ( = ?auto_135 ?auto_134 ) ) ( HOIST-AT ?auto_138 ?auto_135 ) ( not ( = ?auto_136 ?auto_138 ) ) ( AVAILABLE ?auto_138 ) ( SURFACE-AT ?auto_132 ?auto_135 ) ( ON ?auto_132 ?auto_137 ) ( CLEAR ?auto_132 ) ( not ( = ?auto_131 ?auto_137 ) ) ( not ( = ?auto_132 ?auto_137 ) ) ( not ( = ?auto_139 ?auto_137 ) ) ( TRUCK-AT ?auto_133 ?auto_134 ) ( SURFACE-AT ?auto_139 ?auto_134 ) ( CLEAR ?auto_139 ) ( LIFTING ?auto_136 ?auto_131 ) ( IS-CRATE ?auto_131 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139 ?auto_131 )
      ( MAKE-2CRATE ?auto_139 ?auto_131 ?auto_132 )
      ( MAKE-1CRATE-VERIFY ?auto_131 ?auto_132 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_140 - SURFACE
      ?auto_141 - SURFACE
      ?auto_142 - SURFACE
    )
    :vars
    (
      ?auto_145 - HOIST
      ?auto_148 - PLACE
      ?auto_143 - PLACE
      ?auto_147 - HOIST
      ?auto_146 - SURFACE
      ?auto_144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_145 ?auto_148 ) ( IS-CRATE ?auto_142 ) ( not ( = ?auto_141 ?auto_142 ) ) ( not ( = ?auto_140 ?auto_141 ) ) ( not ( = ?auto_140 ?auto_142 ) ) ( not ( = ?auto_143 ?auto_148 ) ) ( HOIST-AT ?auto_147 ?auto_143 ) ( not ( = ?auto_145 ?auto_147 ) ) ( AVAILABLE ?auto_147 ) ( SURFACE-AT ?auto_142 ?auto_143 ) ( ON ?auto_142 ?auto_146 ) ( CLEAR ?auto_142 ) ( not ( = ?auto_141 ?auto_146 ) ) ( not ( = ?auto_142 ?auto_146 ) ) ( not ( = ?auto_140 ?auto_146 ) ) ( TRUCK-AT ?auto_144 ?auto_148 ) ( SURFACE-AT ?auto_140 ?auto_148 ) ( CLEAR ?auto_140 ) ( LIFTING ?auto_145 ?auto_141 ) ( IS-CRATE ?auto_141 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_141 ?auto_142 )
      ( MAKE-2CRATE-VERIFY ?auto_140 ?auto_141 ?auto_142 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_149 - SURFACE
      ?auto_150 - SURFACE
    )
    :vars
    (
      ?auto_152 - HOIST
      ?auto_155 - PLACE
      ?auto_157 - SURFACE
      ?auto_156 - PLACE
      ?auto_153 - HOIST
      ?auto_154 - SURFACE
      ?auto_151 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_152 ?auto_155 ) ( IS-CRATE ?auto_150 ) ( not ( = ?auto_149 ?auto_150 ) ) ( not ( = ?auto_157 ?auto_149 ) ) ( not ( = ?auto_157 ?auto_150 ) ) ( not ( = ?auto_156 ?auto_155 ) ) ( HOIST-AT ?auto_153 ?auto_156 ) ( not ( = ?auto_152 ?auto_153 ) ) ( AVAILABLE ?auto_153 ) ( SURFACE-AT ?auto_150 ?auto_156 ) ( ON ?auto_150 ?auto_154 ) ( CLEAR ?auto_150 ) ( not ( = ?auto_149 ?auto_154 ) ) ( not ( = ?auto_150 ?auto_154 ) ) ( not ( = ?auto_157 ?auto_154 ) ) ( TRUCK-AT ?auto_151 ?auto_155 ) ( SURFACE-AT ?auto_157 ?auto_155 ) ( CLEAR ?auto_157 ) ( IS-CRATE ?auto_149 ) ( AVAILABLE ?auto_152 ) ( IN ?auto_149 ?auto_151 ) )
    :subtasks
    ( ( !UNLOAD ?auto_152 ?auto_149 ?auto_151 ?auto_155 )
      ( MAKE-2CRATE ?auto_157 ?auto_149 ?auto_150 )
      ( MAKE-1CRATE-VERIFY ?auto_149 ?auto_150 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_158 - SURFACE
      ?auto_159 - SURFACE
      ?auto_160 - SURFACE
    )
    :vars
    (
      ?auto_162 - HOIST
      ?auto_164 - PLACE
      ?auto_161 - PLACE
      ?auto_163 - HOIST
      ?auto_165 - SURFACE
      ?auto_166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162 ?auto_164 ) ( IS-CRATE ?auto_160 ) ( not ( = ?auto_159 ?auto_160 ) ) ( not ( = ?auto_158 ?auto_159 ) ) ( not ( = ?auto_158 ?auto_160 ) ) ( not ( = ?auto_161 ?auto_164 ) ) ( HOIST-AT ?auto_163 ?auto_161 ) ( not ( = ?auto_162 ?auto_163 ) ) ( AVAILABLE ?auto_163 ) ( SURFACE-AT ?auto_160 ?auto_161 ) ( ON ?auto_160 ?auto_165 ) ( CLEAR ?auto_160 ) ( not ( = ?auto_159 ?auto_165 ) ) ( not ( = ?auto_160 ?auto_165 ) ) ( not ( = ?auto_158 ?auto_165 ) ) ( TRUCK-AT ?auto_166 ?auto_164 ) ( SURFACE-AT ?auto_158 ?auto_164 ) ( CLEAR ?auto_158 ) ( IS-CRATE ?auto_159 ) ( AVAILABLE ?auto_162 ) ( IN ?auto_159 ?auto_166 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_159 ?auto_160 )
      ( MAKE-2CRATE-VERIFY ?auto_158 ?auto_159 ?auto_160 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_167 - SURFACE
      ?auto_168 - SURFACE
    )
    :vars
    (
      ?auto_172 - HOIST
      ?auto_169 - PLACE
      ?auto_175 - SURFACE
      ?auto_171 - PLACE
      ?auto_174 - HOIST
      ?auto_170 - SURFACE
      ?auto_173 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_172 ?auto_169 ) ( IS-CRATE ?auto_168 ) ( not ( = ?auto_167 ?auto_168 ) ) ( not ( = ?auto_175 ?auto_167 ) ) ( not ( = ?auto_175 ?auto_168 ) ) ( not ( = ?auto_171 ?auto_169 ) ) ( HOIST-AT ?auto_174 ?auto_171 ) ( not ( = ?auto_172 ?auto_174 ) ) ( AVAILABLE ?auto_174 ) ( SURFACE-AT ?auto_168 ?auto_171 ) ( ON ?auto_168 ?auto_170 ) ( CLEAR ?auto_168 ) ( not ( = ?auto_167 ?auto_170 ) ) ( not ( = ?auto_168 ?auto_170 ) ) ( not ( = ?auto_175 ?auto_170 ) ) ( SURFACE-AT ?auto_175 ?auto_169 ) ( CLEAR ?auto_175 ) ( IS-CRATE ?auto_167 ) ( AVAILABLE ?auto_172 ) ( IN ?auto_167 ?auto_173 ) ( TRUCK-AT ?auto_173 ?auto_171 ) )
    :subtasks
    ( ( !DRIVE ?auto_173 ?auto_171 ?auto_169 )
      ( MAKE-2CRATE ?auto_175 ?auto_167 ?auto_168 )
      ( MAKE-1CRATE-VERIFY ?auto_167 ?auto_168 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_176 - SURFACE
      ?auto_177 - SURFACE
      ?auto_178 - SURFACE
    )
    :vars
    (
      ?auto_181 - HOIST
      ?auto_182 - PLACE
      ?auto_183 - PLACE
      ?auto_179 - HOIST
      ?auto_180 - SURFACE
      ?auto_184 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_181 ?auto_182 ) ( IS-CRATE ?auto_178 ) ( not ( = ?auto_177 ?auto_178 ) ) ( not ( = ?auto_176 ?auto_177 ) ) ( not ( = ?auto_176 ?auto_178 ) ) ( not ( = ?auto_183 ?auto_182 ) ) ( HOIST-AT ?auto_179 ?auto_183 ) ( not ( = ?auto_181 ?auto_179 ) ) ( AVAILABLE ?auto_179 ) ( SURFACE-AT ?auto_178 ?auto_183 ) ( ON ?auto_178 ?auto_180 ) ( CLEAR ?auto_178 ) ( not ( = ?auto_177 ?auto_180 ) ) ( not ( = ?auto_178 ?auto_180 ) ) ( not ( = ?auto_176 ?auto_180 ) ) ( SURFACE-AT ?auto_176 ?auto_182 ) ( CLEAR ?auto_176 ) ( IS-CRATE ?auto_177 ) ( AVAILABLE ?auto_181 ) ( IN ?auto_177 ?auto_184 ) ( TRUCK-AT ?auto_184 ?auto_183 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_177 ?auto_178 )
      ( MAKE-2CRATE-VERIFY ?auto_176 ?auto_177 ?auto_178 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_185 - SURFACE
      ?auto_186 - SURFACE
    )
    :vars
    (
      ?auto_188 - HOIST
      ?auto_192 - PLACE
      ?auto_189 - SURFACE
      ?auto_193 - PLACE
      ?auto_191 - HOIST
      ?auto_187 - SURFACE
      ?auto_190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_188 ?auto_192 ) ( IS-CRATE ?auto_186 ) ( not ( = ?auto_185 ?auto_186 ) ) ( not ( = ?auto_189 ?auto_185 ) ) ( not ( = ?auto_189 ?auto_186 ) ) ( not ( = ?auto_193 ?auto_192 ) ) ( HOIST-AT ?auto_191 ?auto_193 ) ( not ( = ?auto_188 ?auto_191 ) ) ( SURFACE-AT ?auto_186 ?auto_193 ) ( ON ?auto_186 ?auto_187 ) ( CLEAR ?auto_186 ) ( not ( = ?auto_185 ?auto_187 ) ) ( not ( = ?auto_186 ?auto_187 ) ) ( not ( = ?auto_189 ?auto_187 ) ) ( SURFACE-AT ?auto_189 ?auto_192 ) ( CLEAR ?auto_189 ) ( IS-CRATE ?auto_185 ) ( AVAILABLE ?auto_188 ) ( TRUCK-AT ?auto_190 ?auto_193 ) ( LIFTING ?auto_191 ?auto_185 ) )
    :subtasks
    ( ( !LOAD ?auto_191 ?auto_185 ?auto_190 ?auto_193 )
      ( MAKE-2CRATE ?auto_189 ?auto_185 ?auto_186 )
      ( MAKE-1CRATE-VERIFY ?auto_185 ?auto_186 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_194 - SURFACE
      ?auto_195 - SURFACE
      ?auto_196 - SURFACE
    )
    :vars
    (
      ?auto_197 - HOIST
      ?auto_200 - PLACE
      ?auto_201 - PLACE
      ?auto_202 - HOIST
      ?auto_198 - SURFACE
      ?auto_199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_197 ?auto_200 ) ( IS-CRATE ?auto_196 ) ( not ( = ?auto_195 ?auto_196 ) ) ( not ( = ?auto_194 ?auto_195 ) ) ( not ( = ?auto_194 ?auto_196 ) ) ( not ( = ?auto_201 ?auto_200 ) ) ( HOIST-AT ?auto_202 ?auto_201 ) ( not ( = ?auto_197 ?auto_202 ) ) ( SURFACE-AT ?auto_196 ?auto_201 ) ( ON ?auto_196 ?auto_198 ) ( CLEAR ?auto_196 ) ( not ( = ?auto_195 ?auto_198 ) ) ( not ( = ?auto_196 ?auto_198 ) ) ( not ( = ?auto_194 ?auto_198 ) ) ( SURFACE-AT ?auto_194 ?auto_200 ) ( CLEAR ?auto_194 ) ( IS-CRATE ?auto_195 ) ( AVAILABLE ?auto_197 ) ( TRUCK-AT ?auto_199 ?auto_201 ) ( LIFTING ?auto_202 ?auto_195 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_195 ?auto_196 )
      ( MAKE-2CRATE-VERIFY ?auto_194 ?auto_195 ?auto_196 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_203 - SURFACE
      ?auto_204 - SURFACE
    )
    :vars
    (
      ?auto_208 - HOIST
      ?auto_209 - PLACE
      ?auto_207 - SURFACE
      ?auto_211 - PLACE
      ?auto_205 - HOIST
      ?auto_210 - SURFACE
      ?auto_206 - TRUCK
      ?auto_212 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_208 ?auto_209 ) ( IS-CRATE ?auto_204 ) ( not ( = ?auto_203 ?auto_204 ) ) ( not ( = ?auto_207 ?auto_203 ) ) ( not ( = ?auto_207 ?auto_204 ) ) ( not ( = ?auto_211 ?auto_209 ) ) ( HOIST-AT ?auto_205 ?auto_211 ) ( not ( = ?auto_208 ?auto_205 ) ) ( SURFACE-AT ?auto_204 ?auto_211 ) ( ON ?auto_204 ?auto_210 ) ( CLEAR ?auto_204 ) ( not ( = ?auto_203 ?auto_210 ) ) ( not ( = ?auto_204 ?auto_210 ) ) ( not ( = ?auto_207 ?auto_210 ) ) ( SURFACE-AT ?auto_207 ?auto_209 ) ( CLEAR ?auto_207 ) ( IS-CRATE ?auto_203 ) ( AVAILABLE ?auto_208 ) ( TRUCK-AT ?auto_206 ?auto_211 ) ( AVAILABLE ?auto_205 ) ( SURFACE-AT ?auto_203 ?auto_211 ) ( ON ?auto_203 ?auto_212 ) ( CLEAR ?auto_203 ) ( not ( = ?auto_203 ?auto_212 ) ) ( not ( = ?auto_204 ?auto_212 ) ) ( not ( = ?auto_207 ?auto_212 ) ) ( not ( = ?auto_210 ?auto_212 ) ) )
    :subtasks
    ( ( !LIFT ?auto_205 ?auto_203 ?auto_212 ?auto_211 )
      ( MAKE-2CRATE ?auto_207 ?auto_203 ?auto_204 )
      ( MAKE-1CRATE-VERIFY ?auto_203 ?auto_204 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_213 - SURFACE
      ?auto_214 - SURFACE
      ?auto_215 - SURFACE
    )
    :vars
    (
      ?auto_222 - HOIST
      ?auto_216 - PLACE
      ?auto_219 - PLACE
      ?auto_218 - HOIST
      ?auto_221 - SURFACE
      ?auto_220 - TRUCK
      ?auto_217 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_222 ?auto_216 ) ( IS-CRATE ?auto_215 ) ( not ( = ?auto_214 ?auto_215 ) ) ( not ( = ?auto_213 ?auto_214 ) ) ( not ( = ?auto_213 ?auto_215 ) ) ( not ( = ?auto_219 ?auto_216 ) ) ( HOIST-AT ?auto_218 ?auto_219 ) ( not ( = ?auto_222 ?auto_218 ) ) ( SURFACE-AT ?auto_215 ?auto_219 ) ( ON ?auto_215 ?auto_221 ) ( CLEAR ?auto_215 ) ( not ( = ?auto_214 ?auto_221 ) ) ( not ( = ?auto_215 ?auto_221 ) ) ( not ( = ?auto_213 ?auto_221 ) ) ( SURFACE-AT ?auto_213 ?auto_216 ) ( CLEAR ?auto_213 ) ( IS-CRATE ?auto_214 ) ( AVAILABLE ?auto_222 ) ( TRUCK-AT ?auto_220 ?auto_219 ) ( AVAILABLE ?auto_218 ) ( SURFACE-AT ?auto_214 ?auto_219 ) ( ON ?auto_214 ?auto_217 ) ( CLEAR ?auto_214 ) ( not ( = ?auto_214 ?auto_217 ) ) ( not ( = ?auto_215 ?auto_217 ) ) ( not ( = ?auto_213 ?auto_217 ) ) ( not ( = ?auto_221 ?auto_217 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_214 ?auto_215 )
      ( MAKE-2CRATE-VERIFY ?auto_213 ?auto_214 ?auto_215 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_223 - SURFACE
      ?auto_224 - SURFACE
    )
    :vars
    (
      ?auto_226 - HOIST
      ?auto_227 - PLACE
      ?auto_232 - SURFACE
      ?auto_229 - PLACE
      ?auto_230 - HOIST
      ?auto_225 - SURFACE
      ?auto_228 - SURFACE
      ?auto_231 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226 ?auto_227 ) ( IS-CRATE ?auto_224 ) ( not ( = ?auto_223 ?auto_224 ) ) ( not ( = ?auto_232 ?auto_223 ) ) ( not ( = ?auto_232 ?auto_224 ) ) ( not ( = ?auto_229 ?auto_227 ) ) ( HOIST-AT ?auto_230 ?auto_229 ) ( not ( = ?auto_226 ?auto_230 ) ) ( SURFACE-AT ?auto_224 ?auto_229 ) ( ON ?auto_224 ?auto_225 ) ( CLEAR ?auto_224 ) ( not ( = ?auto_223 ?auto_225 ) ) ( not ( = ?auto_224 ?auto_225 ) ) ( not ( = ?auto_232 ?auto_225 ) ) ( SURFACE-AT ?auto_232 ?auto_227 ) ( CLEAR ?auto_232 ) ( IS-CRATE ?auto_223 ) ( AVAILABLE ?auto_226 ) ( AVAILABLE ?auto_230 ) ( SURFACE-AT ?auto_223 ?auto_229 ) ( ON ?auto_223 ?auto_228 ) ( CLEAR ?auto_223 ) ( not ( = ?auto_223 ?auto_228 ) ) ( not ( = ?auto_224 ?auto_228 ) ) ( not ( = ?auto_232 ?auto_228 ) ) ( not ( = ?auto_225 ?auto_228 ) ) ( TRUCK-AT ?auto_231 ?auto_227 ) )
    :subtasks
    ( ( !DRIVE ?auto_231 ?auto_227 ?auto_229 )
      ( MAKE-2CRATE ?auto_232 ?auto_223 ?auto_224 )
      ( MAKE-1CRATE-VERIFY ?auto_223 ?auto_224 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_233 - SURFACE
      ?auto_234 - SURFACE
      ?auto_235 - SURFACE
    )
    :vars
    (
      ?auto_242 - HOIST
      ?auto_237 - PLACE
      ?auto_236 - PLACE
      ?auto_240 - HOIST
      ?auto_241 - SURFACE
      ?auto_238 - SURFACE
      ?auto_239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_242 ?auto_237 ) ( IS-CRATE ?auto_235 ) ( not ( = ?auto_234 ?auto_235 ) ) ( not ( = ?auto_233 ?auto_234 ) ) ( not ( = ?auto_233 ?auto_235 ) ) ( not ( = ?auto_236 ?auto_237 ) ) ( HOIST-AT ?auto_240 ?auto_236 ) ( not ( = ?auto_242 ?auto_240 ) ) ( SURFACE-AT ?auto_235 ?auto_236 ) ( ON ?auto_235 ?auto_241 ) ( CLEAR ?auto_235 ) ( not ( = ?auto_234 ?auto_241 ) ) ( not ( = ?auto_235 ?auto_241 ) ) ( not ( = ?auto_233 ?auto_241 ) ) ( SURFACE-AT ?auto_233 ?auto_237 ) ( CLEAR ?auto_233 ) ( IS-CRATE ?auto_234 ) ( AVAILABLE ?auto_242 ) ( AVAILABLE ?auto_240 ) ( SURFACE-AT ?auto_234 ?auto_236 ) ( ON ?auto_234 ?auto_238 ) ( CLEAR ?auto_234 ) ( not ( = ?auto_234 ?auto_238 ) ) ( not ( = ?auto_235 ?auto_238 ) ) ( not ( = ?auto_233 ?auto_238 ) ) ( not ( = ?auto_241 ?auto_238 ) ) ( TRUCK-AT ?auto_239 ?auto_237 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_234 ?auto_235 )
      ( MAKE-2CRATE-VERIFY ?auto_233 ?auto_234 ?auto_235 ) )
  )

)

