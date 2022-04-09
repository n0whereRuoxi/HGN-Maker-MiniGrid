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
      ?auto_22 - HOIST
      ?auto_19 - PLACE
      ?auto_20 - TRUCK
      ?auto_21 - PLACE
      ?auto_23 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22 ?auto_19 ) ( SURFACE-AT ?auto_17 ?auto_19 ) ( CLEAR ?auto_17 ) ( IS-CRATE ?auto_18 ) ( not ( = ?auto_17 ?auto_18 ) ) ( AVAILABLE ?auto_22 ) ( TRUCK-AT ?auto_20 ?auto_21 ) ( not ( = ?auto_21 ?auto_19 ) ) ( HOIST-AT ?auto_23 ?auto_21 ) ( LIFTING ?auto_23 ?auto_18 ) ( not ( = ?auto_22 ?auto_23 ) ) )
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
      ?auto_29 - HOIST
      ?auto_30 - PLACE
      ?auto_26 - TRUCK
      ?auto_28 - PLACE
      ?auto_27 - HOIST
      ?auto_31 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29 ?auto_30 ) ( SURFACE-AT ?auto_24 ?auto_30 ) ( CLEAR ?auto_24 ) ( IS-CRATE ?auto_25 ) ( not ( = ?auto_24 ?auto_25 ) ) ( AVAILABLE ?auto_29 ) ( TRUCK-AT ?auto_26 ?auto_28 ) ( not ( = ?auto_28 ?auto_30 ) ) ( HOIST-AT ?auto_27 ?auto_28 ) ( not ( = ?auto_29 ?auto_27 ) ) ( AVAILABLE ?auto_27 ) ( SURFACE-AT ?auto_25 ?auto_28 ) ( ON ?auto_25 ?auto_31 ) ( CLEAR ?auto_25 ) ( not ( = ?auto_24 ?auto_31 ) ) ( not ( = ?auto_25 ?auto_31 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27 ?auto_25 ?auto_31 ?auto_28 )
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
      ?auto_36 - HOIST
      ?auto_35 - PLACE
      ?auto_37 - PLACE
      ?auto_39 - HOIST
      ?auto_34 - SURFACE
      ?auto_38 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36 ?auto_35 ) ( SURFACE-AT ?auto_32 ?auto_35 ) ( CLEAR ?auto_32 ) ( IS-CRATE ?auto_33 ) ( not ( = ?auto_32 ?auto_33 ) ) ( AVAILABLE ?auto_36 ) ( not ( = ?auto_37 ?auto_35 ) ) ( HOIST-AT ?auto_39 ?auto_37 ) ( not ( = ?auto_36 ?auto_39 ) ) ( AVAILABLE ?auto_39 ) ( SURFACE-AT ?auto_33 ?auto_37 ) ( ON ?auto_33 ?auto_34 ) ( CLEAR ?auto_33 ) ( not ( = ?auto_32 ?auto_34 ) ) ( not ( = ?auto_33 ?auto_34 ) ) ( TRUCK-AT ?auto_38 ?auto_35 ) )
    :subtasks
    ( ( !DRIVE ?auto_38 ?auto_35 ?auto_37 )
      ( MAKE-1CRATE ?auto_32 ?auto_33 )
      ( MAKE-1CRATE-VERIFY ?auto_32 ?auto_33 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_45 - SURFACE
      ?auto_46 - SURFACE
    )
    :vars
    (
      ?auto_47 - HOIST
      ?auto_48 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47 ?auto_48 ) ( SURFACE-AT ?auto_45 ?auto_48 ) ( CLEAR ?auto_45 ) ( LIFTING ?auto_47 ?auto_46 ) ( IS-CRATE ?auto_46 ) ( not ( = ?auto_45 ?auto_46 ) ) )
    :subtasks
    ( ( !DROP ?auto_47 ?auto_46 ?auto_45 ?auto_48 )
      ( MAKE-1CRATE-VERIFY ?auto_45 ?auto_46 ) )
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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54 - SURFACE
      ?auto_55 - SURFACE
    )
    :vars
    (
      ?auto_56 - HOIST
      ?auto_57 - PLACE
      ?auto_58 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56 ?auto_57 ) ( SURFACE-AT ?auto_54 ?auto_57 ) ( CLEAR ?auto_54 ) ( IS-CRATE ?auto_55 ) ( not ( = ?auto_54 ?auto_55 ) ) ( TRUCK-AT ?auto_58 ?auto_57 ) ( AVAILABLE ?auto_56 ) ( IN ?auto_55 ?auto_58 ) )
    :subtasks
    ( ( !UNLOAD ?auto_56 ?auto_55 ?auto_58 ?auto_57 )
      ( MAKE-1CRATE ?auto_54 ?auto_55 )
      ( MAKE-1CRATE-VERIFY ?auto_54 ?auto_55 ) )
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
      ?auto_64 - HOIST
      ?auto_63 - PLACE
      ?auto_62 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64 ?auto_63 ) ( SURFACE-AT ?auto_60 ?auto_63 ) ( CLEAR ?auto_60 ) ( IS-CRATE ?auto_61 ) ( not ( = ?auto_60 ?auto_61 ) ) ( TRUCK-AT ?auto_62 ?auto_63 ) ( AVAILABLE ?auto_64 ) ( IN ?auto_61 ?auto_62 ) ( ON ?auto_60 ?auto_59 ) ( not ( = ?auto_59 ?auto_60 ) ) ( not ( = ?auto_59 ?auto_61 ) ) )
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
      ?auto_67 - PLACE
      ?auto_68 - TRUCK
      ?auto_70 - SURFACE
      ?auto_71 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_69 ?auto_67 ) ( SURFACE-AT ?auto_65 ?auto_67 ) ( CLEAR ?auto_65 ) ( IS-CRATE ?auto_66 ) ( not ( = ?auto_65 ?auto_66 ) ) ( AVAILABLE ?auto_69 ) ( IN ?auto_66 ?auto_68 ) ( ON ?auto_65 ?auto_70 ) ( not ( = ?auto_70 ?auto_65 ) ) ( not ( = ?auto_70 ?auto_66 ) ) ( TRUCK-AT ?auto_68 ?auto_71 ) ( not ( = ?auto_71 ?auto_67 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_68 ?auto_71 ?auto_67 )
      ( MAKE-2CRATE ?auto_70 ?auto_65 ?auto_66 )
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
      ?auto_77 - HOIST
      ?auto_76 - PLACE
      ?auto_75 - TRUCK
      ?auto_78 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_77 ?auto_76 ) ( SURFACE-AT ?auto_73 ?auto_76 ) ( CLEAR ?auto_73 ) ( IS-CRATE ?auto_74 ) ( not ( = ?auto_73 ?auto_74 ) ) ( AVAILABLE ?auto_77 ) ( IN ?auto_74 ?auto_75 ) ( ON ?auto_73 ?auto_72 ) ( not ( = ?auto_72 ?auto_73 ) ) ( not ( = ?auto_72 ?auto_74 ) ) ( TRUCK-AT ?auto_75 ?auto_78 ) ( not ( = ?auto_78 ?auto_76 ) ) )
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
      ?auto_92 - HOIST
      ?auto_91 - PLACE
      ?auto_90 - TRUCK
      ?auto_93 - PLACE
      ?auto_94 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_92 ?auto_91 ) ( SURFACE-AT ?auto_88 ?auto_91 ) ( CLEAR ?auto_88 ) ( IS-CRATE ?auto_89 ) ( not ( = ?auto_88 ?auto_89 ) ) ( AVAILABLE ?auto_92 ) ( ON ?auto_88 ?auto_87 ) ( not ( = ?auto_87 ?auto_88 ) ) ( not ( = ?auto_87 ?auto_89 ) ) ( TRUCK-AT ?auto_90 ?auto_93 ) ( not ( = ?auto_93 ?auto_91 ) ) ( HOIST-AT ?auto_94 ?auto_93 ) ( LIFTING ?auto_94 ?auto_89 ) ( not ( = ?auto_92 ?auto_94 ) ) )
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
      ?auto_100 - HOIST
      ?auto_99 - PLACE
      ?auto_102 - SURFACE
      ?auto_101 - TRUCK
      ?auto_97 - PLACE
      ?auto_98 - HOIST
      ?auto_103 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_100 ?auto_99 ) ( SURFACE-AT ?auto_95 ?auto_99 ) ( CLEAR ?auto_95 ) ( IS-CRATE ?auto_96 ) ( not ( = ?auto_95 ?auto_96 ) ) ( AVAILABLE ?auto_100 ) ( ON ?auto_95 ?auto_102 ) ( not ( = ?auto_102 ?auto_95 ) ) ( not ( = ?auto_102 ?auto_96 ) ) ( TRUCK-AT ?auto_101 ?auto_97 ) ( not ( = ?auto_97 ?auto_99 ) ) ( HOIST-AT ?auto_98 ?auto_97 ) ( not ( = ?auto_100 ?auto_98 ) ) ( AVAILABLE ?auto_98 ) ( SURFACE-AT ?auto_96 ?auto_97 ) ( ON ?auto_96 ?auto_103 ) ( CLEAR ?auto_96 ) ( not ( = ?auto_95 ?auto_103 ) ) ( not ( = ?auto_96 ?auto_103 ) ) ( not ( = ?auto_102 ?auto_103 ) ) )
    :subtasks
    ( ( !LIFT ?auto_98 ?auto_96 ?auto_103 ?auto_97 )
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
      ?auto_111 - PLACE
      ?auto_109 - TRUCK
      ?auto_108 - PLACE
      ?auto_110 - HOIST
      ?auto_107 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112 ?auto_111 ) ( SURFACE-AT ?auto_105 ?auto_111 ) ( CLEAR ?auto_105 ) ( IS-CRATE ?auto_106 ) ( not ( = ?auto_105 ?auto_106 ) ) ( AVAILABLE ?auto_112 ) ( ON ?auto_105 ?auto_104 ) ( not ( = ?auto_104 ?auto_105 ) ) ( not ( = ?auto_104 ?auto_106 ) ) ( TRUCK-AT ?auto_109 ?auto_108 ) ( not ( = ?auto_108 ?auto_111 ) ) ( HOIST-AT ?auto_110 ?auto_108 ) ( not ( = ?auto_112 ?auto_110 ) ) ( AVAILABLE ?auto_110 ) ( SURFACE-AT ?auto_106 ?auto_108 ) ( ON ?auto_106 ?auto_107 ) ( CLEAR ?auto_106 ) ( not ( = ?auto_105 ?auto_107 ) ) ( not ( = ?auto_106 ?auto_107 ) ) ( not ( = ?auto_104 ?auto_107 ) ) )
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
      ?auto_120 - HOIST
      ?auto_119 - PLACE
      ?auto_121 - SURFACE
      ?auto_116 - PLACE
      ?auto_118 - HOIST
      ?auto_117 - SURFACE
      ?auto_115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_120 ?auto_119 ) ( SURFACE-AT ?auto_113 ?auto_119 ) ( CLEAR ?auto_113 ) ( IS-CRATE ?auto_114 ) ( not ( = ?auto_113 ?auto_114 ) ) ( AVAILABLE ?auto_120 ) ( ON ?auto_113 ?auto_121 ) ( not ( = ?auto_121 ?auto_113 ) ) ( not ( = ?auto_121 ?auto_114 ) ) ( not ( = ?auto_116 ?auto_119 ) ) ( HOIST-AT ?auto_118 ?auto_116 ) ( not ( = ?auto_120 ?auto_118 ) ) ( AVAILABLE ?auto_118 ) ( SURFACE-AT ?auto_114 ?auto_116 ) ( ON ?auto_114 ?auto_117 ) ( CLEAR ?auto_114 ) ( not ( = ?auto_113 ?auto_117 ) ) ( not ( = ?auto_114 ?auto_117 ) ) ( not ( = ?auto_121 ?auto_117 ) ) ( TRUCK-AT ?auto_115 ?auto_119 ) )
    :subtasks
    ( ( !DRIVE ?auto_115 ?auto_119 ?auto_116 )
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
      ?auto_129 - HOIST
      ?auto_126 - PLACE
      ?auto_130 - PLACE
      ?auto_125 - HOIST
      ?auto_127 - SURFACE
      ?auto_128 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_129 ?auto_126 ) ( SURFACE-AT ?auto_123 ?auto_126 ) ( CLEAR ?auto_123 ) ( IS-CRATE ?auto_124 ) ( not ( = ?auto_123 ?auto_124 ) ) ( AVAILABLE ?auto_129 ) ( ON ?auto_123 ?auto_122 ) ( not ( = ?auto_122 ?auto_123 ) ) ( not ( = ?auto_122 ?auto_124 ) ) ( not ( = ?auto_130 ?auto_126 ) ) ( HOIST-AT ?auto_125 ?auto_130 ) ( not ( = ?auto_129 ?auto_125 ) ) ( AVAILABLE ?auto_125 ) ( SURFACE-AT ?auto_124 ?auto_130 ) ( ON ?auto_124 ?auto_127 ) ( CLEAR ?auto_124 ) ( not ( = ?auto_123 ?auto_127 ) ) ( not ( = ?auto_124 ?auto_127 ) ) ( not ( = ?auto_122 ?auto_127 ) ) ( TRUCK-AT ?auto_128 ?auto_126 ) )
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
      ?auto_138 - HOIST
      ?auto_136 - PLACE
      ?auto_139 - SURFACE
      ?auto_134 - PLACE
      ?auto_135 - HOIST
      ?auto_133 - SURFACE
      ?auto_137 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_138 ?auto_136 ) ( IS-CRATE ?auto_132 ) ( not ( = ?auto_131 ?auto_132 ) ) ( not ( = ?auto_139 ?auto_131 ) ) ( not ( = ?auto_139 ?auto_132 ) ) ( not ( = ?auto_134 ?auto_136 ) ) ( HOIST-AT ?auto_135 ?auto_134 ) ( not ( = ?auto_138 ?auto_135 ) ) ( AVAILABLE ?auto_135 ) ( SURFACE-AT ?auto_132 ?auto_134 ) ( ON ?auto_132 ?auto_133 ) ( CLEAR ?auto_132 ) ( not ( = ?auto_131 ?auto_133 ) ) ( not ( = ?auto_132 ?auto_133 ) ) ( not ( = ?auto_139 ?auto_133 ) ) ( TRUCK-AT ?auto_137 ?auto_136 ) ( SURFACE-AT ?auto_139 ?auto_136 ) ( CLEAR ?auto_139 ) ( LIFTING ?auto_138 ?auto_131 ) ( IS-CRATE ?auto_131 ) )
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
      ?auto_144 - HOIST
      ?auto_145 - PLACE
      ?auto_148 - PLACE
      ?auto_147 - HOIST
      ?auto_143 - SURFACE
      ?auto_146 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_144 ?auto_145 ) ( IS-CRATE ?auto_142 ) ( not ( = ?auto_141 ?auto_142 ) ) ( not ( = ?auto_140 ?auto_141 ) ) ( not ( = ?auto_140 ?auto_142 ) ) ( not ( = ?auto_148 ?auto_145 ) ) ( HOIST-AT ?auto_147 ?auto_148 ) ( not ( = ?auto_144 ?auto_147 ) ) ( AVAILABLE ?auto_147 ) ( SURFACE-AT ?auto_142 ?auto_148 ) ( ON ?auto_142 ?auto_143 ) ( CLEAR ?auto_142 ) ( not ( = ?auto_141 ?auto_143 ) ) ( not ( = ?auto_142 ?auto_143 ) ) ( not ( = ?auto_140 ?auto_143 ) ) ( TRUCK-AT ?auto_146 ?auto_145 ) ( SURFACE-AT ?auto_140 ?auto_145 ) ( CLEAR ?auto_140 ) ( LIFTING ?auto_144 ?auto_141 ) ( IS-CRATE ?auto_141 ) )
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
      ?auto_151 - HOIST
      ?auto_156 - PLACE
      ?auto_157 - SURFACE
      ?auto_155 - PLACE
      ?auto_153 - HOIST
      ?auto_154 - SURFACE
      ?auto_152 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_151 ?auto_156 ) ( IS-CRATE ?auto_150 ) ( not ( = ?auto_149 ?auto_150 ) ) ( not ( = ?auto_157 ?auto_149 ) ) ( not ( = ?auto_157 ?auto_150 ) ) ( not ( = ?auto_155 ?auto_156 ) ) ( HOIST-AT ?auto_153 ?auto_155 ) ( not ( = ?auto_151 ?auto_153 ) ) ( AVAILABLE ?auto_153 ) ( SURFACE-AT ?auto_150 ?auto_155 ) ( ON ?auto_150 ?auto_154 ) ( CLEAR ?auto_150 ) ( not ( = ?auto_149 ?auto_154 ) ) ( not ( = ?auto_150 ?auto_154 ) ) ( not ( = ?auto_157 ?auto_154 ) ) ( TRUCK-AT ?auto_152 ?auto_156 ) ( SURFACE-AT ?auto_157 ?auto_156 ) ( CLEAR ?auto_157 ) ( IS-CRATE ?auto_149 ) ( AVAILABLE ?auto_151 ) ( IN ?auto_149 ?auto_152 ) )
    :subtasks
    ( ( !UNLOAD ?auto_151 ?auto_149 ?auto_152 ?auto_156 )
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
      ?auto_166 - HOIST
      ?auto_164 - PLACE
      ?auto_161 - PLACE
      ?auto_165 - HOIST
      ?auto_163 - SURFACE
      ?auto_162 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166 ?auto_164 ) ( IS-CRATE ?auto_160 ) ( not ( = ?auto_159 ?auto_160 ) ) ( not ( = ?auto_158 ?auto_159 ) ) ( not ( = ?auto_158 ?auto_160 ) ) ( not ( = ?auto_161 ?auto_164 ) ) ( HOIST-AT ?auto_165 ?auto_161 ) ( not ( = ?auto_166 ?auto_165 ) ) ( AVAILABLE ?auto_165 ) ( SURFACE-AT ?auto_160 ?auto_161 ) ( ON ?auto_160 ?auto_163 ) ( CLEAR ?auto_160 ) ( not ( = ?auto_159 ?auto_163 ) ) ( not ( = ?auto_160 ?auto_163 ) ) ( not ( = ?auto_158 ?auto_163 ) ) ( TRUCK-AT ?auto_162 ?auto_164 ) ( SURFACE-AT ?auto_158 ?auto_164 ) ( CLEAR ?auto_158 ) ( IS-CRATE ?auto_159 ) ( AVAILABLE ?auto_166 ) ( IN ?auto_159 ?auto_162 ) )
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
      ?auto_170 - HOIST
      ?auto_174 - PLACE
      ?auto_175 - SURFACE
      ?auto_173 - PLACE
      ?auto_169 - HOIST
      ?auto_171 - SURFACE
      ?auto_172 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_170 ?auto_174 ) ( IS-CRATE ?auto_168 ) ( not ( = ?auto_167 ?auto_168 ) ) ( not ( = ?auto_175 ?auto_167 ) ) ( not ( = ?auto_175 ?auto_168 ) ) ( not ( = ?auto_173 ?auto_174 ) ) ( HOIST-AT ?auto_169 ?auto_173 ) ( not ( = ?auto_170 ?auto_169 ) ) ( AVAILABLE ?auto_169 ) ( SURFACE-AT ?auto_168 ?auto_173 ) ( ON ?auto_168 ?auto_171 ) ( CLEAR ?auto_168 ) ( not ( = ?auto_167 ?auto_171 ) ) ( not ( = ?auto_168 ?auto_171 ) ) ( not ( = ?auto_175 ?auto_171 ) ) ( SURFACE-AT ?auto_175 ?auto_174 ) ( CLEAR ?auto_175 ) ( IS-CRATE ?auto_167 ) ( AVAILABLE ?auto_170 ) ( IN ?auto_167 ?auto_172 ) ( TRUCK-AT ?auto_172 ?auto_173 ) )
    :subtasks
    ( ( !DRIVE ?auto_172 ?auto_173 ?auto_174 )
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
      ?auto_184 - HOIST
      ?auto_183 - PLACE
      ?auto_179 - PLACE
      ?auto_181 - HOIST
      ?auto_182 - SURFACE
      ?auto_180 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_184 ?auto_183 ) ( IS-CRATE ?auto_178 ) ( not ( = ?auto_177 ?auto_178 ) ) ( not ( = ?auto_176 ?auto_177 ) ) ( not ( = ?auto_176 ?auto_178 ) ) ( not ( = ?auto_179 ?auto_183 ) ) ( HOIST-AT ?auto_181 ?auto_179 ) ( not ( = ?auto_184 ?auto_181 ) ) ( AVAILABLE ?auto_181 ) ( SURFACE-AT ?auto_178 ?auto_179 ) ( ON ?auto_178 ?auto_182 ) ( CLEAR ?auto_178 ) ( not ( = ?auto_177 ?auto_182 ) ) ( not ( = ?auto_178 ?auto_182 ) ) ( not ( = ?auto_176 ?auto_182 ) ) ( SURFACE-AT ?auto_176 ?auto_183 ) ( CLEAR ?auto_176 ) ( IS-CRATE ?auto_177 ) ( AVAILABLE ?auto_184 ) ( IN ?auto_177 ?auto_180 ) ( TRUCK-AT ?auto_180 ?auto_179 ) )
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
      ?auto_189 - HOIST
      ?auto_188 - PLACE
      ?auto_193 - SURFACE
      ?auto_187 - PLACE
      ?auto_191 - HOIST
      ?auto_192 - SURFACE
      ?auto_190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189 ?auto_188 ) ( IS-CRATE ?auto_186 ) ( not ( = ?auto_185 ?auto_186 ) ) ( not ( = ?auto_193 ?auto_185 ) ) ( not ( = ?auto_193 ?auto_186 ) ) ( not ( = ?auto_187 ?auto_188 ) ) ( HOIST-AT ?auto_191 ?auto_187 ) ( not ( = ?auto_189 ?auto_191 ) ) ( SURFACE-AT ?auto_186 ?auto_187 ) ( ON ?auto_186 ?auto_192 ) ( CLEAR ?auto_186 ) ( not ( = ?auto_185 ?auto_192 ) ) ( not ( = ?auto_186 ?auto_192 ) ) ( not ( = ?auto_193 ?auto_192 ) ) ( SURFACE-AT ?auto_193 ?auto_188 ) ( CLEAR ?auto_193 ) ( IS-CRATE ?auto_185 ) ( AVAILABLE ?auto_189 ) ( TRUCK-AT ?auto_190 ?auto_187 ) ( LIFTING ?auto_191 ?auto_185 ) )
    :subtasks
    ( ( !LOAD ?auto_191 ?auto_185 ?auto_190 ?auto_187 )
      ( MAKE-2CRATE ?auto_193 ?auto_185 ?auto_186 )
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
      ?auto_201 - HOIST
      ?auto_197 - PLACE
      ?auto_198 - PLACE
      ?auto_200 - HOIST
      ?auto_199 - SURFACE
      ?auto_202 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_201 ?auto_197 ) ( IS-CRATE ?auto_196 ) ( not ( = ?auto_195 ?auto_196 ) ) ( not ( = ?auto_194 ?auto_195 ) ) ( not ( = ?auto_194 ?auto_196 ) ) ( not ( = ?auto_198 ?auto_197 ) ) ( HOIST-AT ?auto_200 ?auto_198 ) ( not ( = ?auto_201 ?auto_200 ) ) ( SURFACE-AT ?auto_196 ?auto_198 ) ( ON ?auto_196 ?auto_199 ) ( CLEAR ?auto_196 ) ( not ( = ?auto_195 ?auto_199 ) ) ( not ( = ?auto_196 ?auto_199 ) ) ( not ( = ?auto_194 ?auto_199 ) ) ( SURFACE-AT ?auto_194 ?auto_197 ) ( CLEAR ?auto_194 ) ( IS-CRATE ?auto_195 ) ( AVAILABLE ?auto_201 ) ( TRUCK-AT ?auto_202 ?auto_198 ) ( LIFTING ?auto_200 ?auto_195 ) )
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
      ?auto_207 - HOIST
      ?auto_206 - PLACE
      ?auto_211 - SURFACE
      ?auto_208 - PLACE
      ?auto_209 - HOIST
      ?auto_205 - SURFACE
      ?auto_210 - TRUCK
      ?auto_212 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_207 ?auto_206 ) ( IS-CRATE ?auto_204 ) ( not ( = ?auto_203 ?auto_204 ) ) ( not ( = ?auto_211 ?auto_203 ) ) ( not ( = ?auto_211 ?auto_204 ) ) ( not ( = ?auto_208 ?auto_206 ) ) ( HOIST-AT ?auto_209 ?auto_208 ) ( not ( = ?auto_207 ?auto_209 ) ) ( SURFACE-AT ?auto_204 ?auto_208 ) ( ON ?auto_204 ?auto_205 ) ( CLEAR ?auto_204 ) ( not ( = ?auto_203 ?auto_205 ) ) ( not ( = ?auto_204 ?auto_205 ) ) ( not ( = ?auto_211 ?auto_205 ) ) ( SURFACE-AT ?auto_211 ?auto_206 ) ( CLEAR ?auto_211 ) ( IS-CRATE ?auto_203 ) ( AVAILABLE ?auto_207 ) ( TRUCK-AT ?auto_210 ?auto_208 ) ( AVAILABLE ?auto_209 ) ( SURFACE-AT ?auto_203 ?auto_208 ) ( ON ?auto_203 ?auto_212 ) ( CLEAR ?auto_203 ) ( not ( = ?auto_203 ?auto_212 ) ) ( not ( = ?auto_204 ?auto_212 ) ) ( not ( = ?auto_211 ?auto_212 ) ) ( not ( = ?auto_205 ?auto_212 ) ) )
    :subtasks
    ( ( !LIFT ?auto_209 ?auto_203 ?auto_212 ?auto_208 )
      ( MAKE-2CRATE ?auto_211 ?auto_203 ?auto_204 )
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
      ?auto_217 - HOIST
      ?auto_220 - PLACE
      ?auto_221 - PLACE
      ?auto_216 - HOIST
      ?auto_219 - SURFACE
      ?auto_218 - TRUCK
      ?auto_222 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_217 ?auto_220 ) ( IS-CRATE ?auto_215 ) ( not ( = ?auto_214 ?auto_215 ) ) ( not ( = ?auto_213 ?auto_214 ) ) ( not ( = ?auto_213 ?auto_215 ) ) ( not ( = ?auto_221 ?auto_220 ) ) ( HOIST-AT ?auto_216 ?auto_221 ) ( not ( = ?auto_217 ?auto_216 ) ) ( SURFACE-AT ?auto_215 ?auto_221 ) ( ON ?auto_215 ?auto_219 ) ( CLEAR ?auto_215 ) ( not ( = ?auto_214 ?auto_219 ) ) ( not ( = ?auto_215 ?auto_219 ) ) ( not ( = ?auto_213 ?auto_219 ) ) ( SURFACE-AT ?auto_213 ?auto_220 ) ( CLEAR ?auto_213 ) ( IS-CRATE ?auto_214 ) ( AVAILABLE ?auto_217 ) ( TRUCK-AT ?auto_218 ?auto_221 ) ( AVAILABLE ?auto_216 ) ( SURFACE-AT ?auto_214 ?auto_221 ) ( ON ?auto_214 ?auto_222 ) ( CLEAR ?auto_214 ) ( not ( = ?auto_214 ?auto_222 ) ) ( not ( = ?auto_215 ?auto_222 ) ) ( not ( = ?auto_213 ?auto_222 ) ) ( not ( = ?auto_219 ?auto_222 ) ) )
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
      ?auto_228 - HOIST
      ?auto_231 - PLACE
      ?auto_232 - SURFACE
      ?auto_230 - PLACE
      ?auto_226 - HOIST
      ?auto_225 - SURFACE
      ?auto_229 - SURFACE
      ?auto_227 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_228 ?auto_231 ) ( IS-CRATE ?auto_224 ) ( not ( = ?auto_223 ?auto_224 ) ) ( not ( = ?auto_232 ?auto_223 ) ) ( not ( = ?auto_232 ?auto_224 ) ) ( not ( = ?auto_230 ?auto_231 ) ) ( HOIST-AT ?auto_226 ?auto_230 ) ( not ( = ?auto_228 ?auto_226 ) ) ( SURFACE-AT ?auto_224 ?auto_230 ) ( ON ?auto_224 ?auto_225 ) ( CLEAR ?auto_224 ) ( not ( = ?auto_223 ?auto_225 ) ) ( not ( = ?auto_224 ?auto_225 ) ) ( not ( = ?auto_232 ?auto_225 ) ) ( SURFACE-AT ?auto_232 ?auto_231 ) ( CLEAR ?auto_232 ) ( IS-CRATE ?auto_223 ) ( AVAILABLE ?auto_228 ) ( AVAILABLE ?auto_226 ) ( SURFACE-AT ?auto_223 ?auto_230 ) ( ON ?auto_223 ?auto_229 ) ( CLEAR ?auto_223 ) ( not ( = ?auto_223 ?auto_229 ) ) ( not ( = ?auto_224 ?auto_229 ) ) ( not ( = ?auto_232 ?auto_229 ) ) ( not ( = ?auto_225 ?auto_229 ) ) ( TRUCK-AT ?auto_227 ?auto_231 ) )
    :subtasks
    ( ( !DRIVE ?auto_227 ?auto_231 ?auto_230 )
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
      ?auto_237 - HOIST
      ?auto_239 - PLACE
      ?auto_242 - PLACE
      ?auto_241 - HOIST
      ?auto_236 - SURFACE
      ?auto_238 - SURFACE
      ?auto_240 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_237 ?auto_239 ) ( IS-CRATE ?auto_235 ) ( not ( = ?auto_234 ?auto_235 ) ) ( not ( = ?auto_233 ?auto_234 ) ) ( not ( = ?auto_233 ?auto_235 ) ) ( not ( = ?auto_242 ?auto_239 ) ) ( HOIST-AT ?auto_241 ?auto_242 ) ( not ( = ?auto_237 ?auto_241 ) ) ( SURFACE-AT ?auto_235 ?auto_242 ) ( ON ?auto_235 ?auto_236 ) ( CLEAR ?auto_235 ) ( not ( = ?auto_234 ?auto_236 ) ) ( not ( = ?auto_235 ?auto_236 ) ) ( not ( = ?auto_233 ?auto_236 ) ) ( SURFACE-AT ?auto_233 ?auto_239 ) ( CLEAR ?auto_233 ) ( IS-CRATE ?auto_234 ) ( AVAILABLE ?auto_237 ) ( AVAILABLE ?auto_241 ) ( SURFACE-AT ?auto_234 ?auto_242 ) ( ON ?auto_234 ?auto_238 ) ( CLEAR ?auto_234 ) ( not ( = ?auto_234 ?auto_238 ) ) ( not ( = ?auto_235 ?auto_238 ) ) ( not ( = ?auto_233 ?auto_238 ) ) ( not ( = ?auto_236 ?auto_238 ) ) ( TRUCK-AT ?auto_240 ?auto_239 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_234 ?auto_235 )
      ( MAKE-2CRATE-VERIFY ?auto_233 ?auto_234 ?auto_235 ) )
  )

)

