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

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?above - SURFACE
      ?below - SURFACE
    )
    :precondition
    ( and ( ON ?above ?below ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3 - SURFACE
      ?auto_2 - SURFACE
    )
    :vars
    (
      ?auto_4 - HOIST
      ?auto_5 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4 ?auto_5 ) ( SURFACE-AT ?auto_2 ?auto_5 ) ( CLEAR ?auto_2 ) ( LIFTING ?auto_4 ?auto_3 ) ( IS-CRATE ?auto_3 ) ( not ( = ?auto_3 ?auto_2 ) ) )
    :subtasks
    ( ( !DROP ?auto_4 ?auto_3 ?auto_2 ?auto_5 )
      ( MAKE-ON-VERIFY ?auto_3 ?auto_2 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7 - SURFACE
      ?auto_6 - SURFACE
    )
    :vars
    (
      ?auto_9 - HOIST
      ?auto_8 - PLACE
      ?auto_10 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9 ?auto_8 ) ( SURFACE-AT ?auto_6 ?auto_8 ) ( CLEAR ?auto_6 ) ( IS-CRATE ?auto_7 ) ( not ( = ?auto_7 ?auto_6 ) ) ( TRUCK-AT ?auto_10 ?auto_8 ) ( AVAILABLE ?auto_9 ) ( IN ?auto_7 ?auto_10 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9 ?auto_7 ?auto_10 ?auto_8 )
      ( MAKE-ON ?auto_7 ?auto_6 )
      ( MAKE-ON-VERIFY ?auto_7 ?auto_6 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12 - SURFACE
      ?auto_11 - SURFACE
    )
    :vars
    (
      ?auto_15 - HOIST
      ?auto_13 - PLACE
      ?auto_14 - TRUCK
      ?auto_16 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15 ?auto_13 ) ( SURFACE-AT ?auto_11 ?auto_13 ) ( CLEAR ?auto_11 ) ( IS-CRATE ?auto_12 ) ( not ( = ?auto_12 ?auto_11 ) ) ( AVAILABLE ?auto_15 ) ( IN ?auto_12 ?auto_14 ) ( TRUCK-AT ?auto_14 ?auto_16 ) ( not ( = ?auto_16 ?auto_13 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14 ?auto_16 ?auto_13 )
      ( MAKE-ON ?auto_12 ?auto_11 )
      ( MAKE-ON-VERIFY ?auto_12 ?auto_11 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18 - SURFACE
      ?auto_17 - SURFACE
    )
    :vars
    (
      ?auto_21 - HOIST
      ?auto_20 - PLACE
      ?auto_19 - TRUCK
      ?auto_22 - PLACE
      ?auto_23 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21 ?auto_20 ) ( SURFACE-AT ?auto_17 ?auto_20 ) ( CLEAR ?auto_17 ) ( IS-CRATE ?auto_18 ) ( not ( = ?auto_18 ?auto_17 ) ) ( AVAILABLE ?auto_21 ) ( TRUCK-AT ?auto_19 ?auto_22 ) ( not ( = ?auto_22 ?auto_20 ) ) ( HOIST-AT ?auto_23 ?auto_22 ) ( LIFTING ?auto_23 ?auto_18 ) ( not ( = ?auto_21 ?auto_23 ) ) )
    :subtasks
    ( ( !LOAD ?auto_23 ?auto_18 ?auto_19 ?auto_22 )
      ( MAKE-ON ?auto_18 ?auto_17 )
      ( MAKE-ON-VERIFY ?auto_18 ?auto_17 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25 - SURFACE
      ?auto_24 - SURFACE
    )
    :vars
    (
      ?auto_26 - HOIST
      ?auto_29 - PLACE
      ?auto_27 - TRUCK
      ?auto_28 - PLACE
      ?auto_30 - HOIST
      ?auto_31 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26 ?auto_29 ) ( SURFACE-AT ?auto_24 ?auto_29 ) ( CLEAR ?auto_24 ) ( IS-CRATE ?auto_25 ) ( not ( = ?auto_25 ?auto_24 ) ) ( AVAILABLE ?auto_26 ) ( TRUCK-AT ?auto_27 ?auto_28 ) ( not ( = ?auto_28 ?auto_29 ) ) ( HOIST-AT ?auto_30 ?auto_28 ) ( not ( = ?auto_26 ?auto_30 ) ) ( AVAILABLE ?auto_30 ) ( SURFACE-AT ?auto_25 ?auto_28 ) ( ON ?auto_25 ?auto_31 ) ( CLEAR ?auto_25 ) ( not ( = ?auto_25 ?auto_31 ) ) ( not ( = ?auto_24 ?auto_31 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30 ?auto_25 ?auto_31 ?auto_28 )
      ( MAKE-ON ?auto_25 ?auto_24 )
      ( MAKE-ON-VERIFY ?auto_25 ?auto_24 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33 - SURFACE
      ?auto_32 - SURFACE
    )
    :vars
    (
      ?auto_39 - HOIST
      ?auto_38 - PLACE
      ?auto_35 - PLACE
      ?auto_37 - HOIST
      ?auto_34 - SURFACE
      ?auto_36 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39 ?auto_38 ) ( SURFACE-AT ?auto_32 ?auto_38 ) ( CLEAR ?auto_32 ) ( IS-CRATE ?auto_33 ) ( not ( = ?auto_33 ?auto_32 ) ) ( AVAILABLE ?auto_39 ) ( not ( = ?auto_35 ?auto_38 ) ) ( HOIST-AT ?auto_37 ?auto_35 ) ( not ( = ?auto_39 ?auto_37 ) ) ( AVAILABLE ?auto_37 ) ( SURFACE-AT ?auto_33 ?auto_35 ) ( ON ?auto_33 ?auto_34 ) ( CLEAR ?auto_33 ) ( not ( = ?auto_33 ?auto_34 ) ) ( not ( = ?auto_32 ?auto_34 ) ) ( TRUCK-AT ?auto_36 ?auto_38 ) )
    :subtasks
    ( ( !DRIVE ?auto_36 ?auto_38 ?auto_35 )
      ( MAKE-ON ?auto_33 ?auto_32 )
      ( MAKE-ON-VERIFY ?auto_33 ?auto_32 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43 - SURFACE
      ?auto_42 - SURFACE
    )
    :vars
    (
      ?auto_44 - HOIST
      ?auto_45 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44 ?auto_45 ) ( SURFACE-AT ?auto_42 ?auto_45 ) ( CLEAR ?auto_42 ) ( LIFTING ?auto_44 ?auto_43 ) ( IS-CRATE ?auto_43 ) ( not ( = ?auto_43 ?auto_42 ) ) )
    :subtasks
    ( ( !DROP ?auto_44 ?auto_43 ?auto_42 ?auto_45 )
      ( MAKE-ON-VERIFY ?auto_43 ?auto_42 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47 - SURFACE
      ?auto_46 - SURFACE
    )
    :vars
    (
      ?auto_49 - HOIST
      ?auto_48 - PLACE
      ?auto_50 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49 ?auto_48 ) ( SURFACE-AT ?auto_46 ?auto_48 ) ( CLEAR ?auto_46 ) ( IS-CRATE ?auto_47 ) ( not ( = ?auto_47 ?auto_46 ) ) ( TRUCK-AT ?auto_50 ?auto_48 ) ( AVAILABLE ?auto_49 ) ( IN ?auto_47 ?auto_50 ) )
    :subtasks
    ( ( !UNLOAD ?auto_49 ?auto_47 ?auto_50 ?auto_48 )
      ( MAKE-ON ?auto_47 ?auto_46 )
      ( MAKE-ON-VERIFY ?auto_47 ?auto_46 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52 - SURFACE
      ?auto_51 - SURFACE
    )
    :vars
    (
      ?auto_55 - HOIST
      ?auto_53 - PLACE
      ?auto_54 - TRUCK
      ?auto_56 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55 ?auto_53 ) ( SURFACE-AT ?auto_51 ?auto_53 ) ( CLEAR ?auto_51 ) ( IS-CRATE ?auto_52 ) ( not ( = ?auto_52 ?auto_51 ) ) ( AVAILABLE ?auto_55 ) ( IN ?auto_52 ?auto_54 ) ( TRUCK-AT ?auto_54 ?auto_56 ) ( not ( = ?auto_56 ?auto_53 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_54 ?auto_56 ?auto_53 )
      ( MAKE-ON ?auto_52 ?auto_51 )
      ( MAKE-ON-VERIFY ?auto_52 ?auto_51 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_58 - SURFACE
      ?auto_57 - SURFACE
    )
    :vars
    (
      ?auto_61 - HOIST
      ?auto_60 - PLACE
      ?auto_59 - TRUCK
      ?auto_62 - PLACE
      ?auto_63 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_61 ?auto_60 ) ( SURFACE-AT ?auto_57 ?auto_60 ) ( CLEAR ?auto_57 ) ( IS-CRATE ?auto_58 ) ( not ( = ?auto_58 ?auto_57 ) ) ( AVAILABLE ?auto_61 ) ( TRUCK-AT ?auto_59 ?auto_62 ) ( not ( = ?auto_62 ?auto_60 ) ) ( HOIST-AT ?auto_63 ?auto_62 ) ( LIFTING ?auto_63 ?auto_58 ) ( not ( = ?auto_61 ?auto_63 ) ) )
    :subtasks
    ( ( !LOAD ?auto_63 ?auto_58 ?auto_59 ?auto_62 )
      ( MAKE-ON ?auto_58 ?auto_57 )
      ( MAKE-ON-VERIFY ?auto_58 ?auto_57 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65 - SURFACE
      ?auto_64 - SURFACE
    )
    :vars
    (
      ?auto_66 - HOIST
      ?auto_69 - PLACE
      ?auto_67 - TRUCK
      ?auto_68 - PLACE
      ?auto_70 - HOIST
      ?auto_71 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66 ?auto_69 ) ( SURFACE-AT ?auto_64 ?auto_69 ) ( CLEAR ?auto_64 ) ( IS-CRATE ?auto_65 ) ( not ( = ?auto_65 ?auto_64 ) ) ( AVAILABLE ?auto_66 ) ( TRUCK-AT ?auto_67 ?auto_68 ) ( not ( = ?auto_68 ?auto_69 ) ) ( HOIST-AT ?auto_70 ?auto_68 ) ( not ( = ?auto_66 ?auto_70 ) ) ( AVAILABLE ?auto_70 ) ( SURFACE-AT ?auto_65 ?auto_68 ) ( ON ?auto_65 ?auto_71 ) ( CLEAR ?auto_65 ) ( not ( = ?auto_65 ?auto_71 ) ) ( not ( = ?auto_64 ?auto_71 ) ) )
    :subtasks
    ( ( !LIFT ?auto_70 ?auto_65 ?auto_71 ?auto_68 )
      ( MAKE-ON ?auto_65 ?auto_64 )
      ( MAKE-ON-VERIFY ?auto_65 ?auto_64 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_73 - SURFACE
      ?auto_72 - SURFACE
    )
    :vars
    (
      ?auto_79 - HOIST
      ?auto_78 - PLACE
      ?auto_75 - PLACE
      ?auto_77 - HOIST
      ?auto_74 - SURFACE
      ?auto_76 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_79 ?auto_78 ) ( SURFACE-AT ?auto_72 ?auto_78 ) ( CLEAR ?auto_72 ) ( IS-CRATE ?auto_73 ) ( not ( = ?auto_73 ?auto_72 ) ) ( AVAILABLE ?auto_79 ) ( not ( = ?auto_75 ?auto_78 ) ) ( HOIST-AT ?auto_77 ?auto_75 ) ( not ( = ?auto_79 ?auto_77 ) ) ( AVAILABLE ?auto_77 ) ( SURFACE-AT ?auto_73 ?auto_75 ) ( ON ?auto_73 ?auto_74 ) ( CLEAR ?auto_73 ) ( not ( = ?auto_73 ?auto_74 ) ) ( not ( = ?auto_72 ?auto_74 ) ) ( TRUCK-AT ?auto_76 ?auto_78 ) )
    :subtasks
    ( ( !DRIVE ?auto_76 ?auto_78 ?auto_75 )
      ( MAKE-ON ?auto_73 ?auto_72 )
      ( MAKE-ON-VERIFY ?auto_73 ?auto_72 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_81 - SURFACE
      ?auto_80 - SURFACE
    )
    :vars
    (
      ?auto_85 - HOIST
      ?auto_84 - PLACE
      ?auto_86 - PLACE
      ?auto_82 - HOIST
      ?auto_87 - SURFACE
      ?auto_83 - TRUCK
      ?auto_88 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_85 ?auto_84 ) ( IS-CRATE ?auto_81 ) ( not ( = ?auto_81 ?auto_80 ) ) ( not ( = ?auto_86 ?auto_84 ) ) ( HOIST-AT ?auto_82 ?auto_86 ) ( not ( = ?auto_85 ?auto_82 ) ) ( AVAILABLE ?auto_82 ) ( SURFACE-AT ?auto_81 ?auto_86 ) ( ON ?auto_81 ?auto_87 ) ( CLEAR ?auto_81 ) ( not ( = ?auto_81 ?auto_87 ) ) ( not ( = ?auto_80 ?auto_87 ) ) ( TRUCK-AT ?auto_83 ?auto_84 ) ( SURFACE-AT ?auto_88 ?auto_84 ) ( CLEAR ?auto_88 ) ( LIFTING ?auto_85 ?auto_80 ) ( IS-CRATE ?auto_80 ) ( not ( = ?auto_81 ?auto_88 ) ) ( not ( = ?auto_80 ?auto_88 ) ) ( not ( = ?auto_87 ?auto_88 ) ) )
    :subtasks
    ( ( !DROP ?auto_85 ?auto_80 ?auto_88 ?auto_84 )
      ( MAKE-ON ?auto_81 ?auto_80 )
      ( MAKE-ON-VERIFY ?auto_81 ?auto_80 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_90 - SURFACE
      ?auto_89 - SURFACE
    )
    :vars
    (
      ?auto_96 - HOIST
      ?auto_93 - PLACE
      ?auto_94 - PLACE
      ?auto_95 - HOIST
      ?auto_91 - SURFACE
      ?auto_92 - TRUCK
      ?auto_97 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_96 ?auto_93 ) ( IS-CRATE ?auto_90 ) ( not ( = ?auto_90 ?auto_89 ) ) ( not ( = ?auto_94 ?auto_93 ) ) ( HOIST-AT ?auto_95 ?auto_94 ) ( not ( = ?auto_96 ?auto_95 ) ) ( AVAILABLE ?auto_95 ) ( SURFACE-AT ?auto_90 ?auto_94 ) ( ON ?auto_90 ?auto_91 ) ( CLEAR ?auto_90 ) ( not ( = ?auto_90 ?auto_91 ) ) ( not ( = ?auto_89 ?auto_91 ) ) ( TRUCK-AT ?auto_92 ?auto_93 ) ( SURFACE-AT ?auto_97 ?auto_93 ) ( CLEAR ?auto_97 ) ( IS-CRATE ?auto_89 ) ( not ( = ?auto_90 ?auto_97 ) ) ( not ( = ?auto_89 ?auto_97 ) ) ( not ( = ?auto_91 ?auto_97 ) ) ( AVAILABLE ?auto_96 ) ( IN ?auto_89 ?auto_92 ) )
    :subtasks
    ( ( !UNLOAD ?auto_96 ?auto_89 ?auto_92 ?auto_93 )
      ( MAKE-ON ?auto_90 ?auto_89 )
      ( MAKE-ON-VERIFY ?auto_90 ?auto_89 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_99 - SURFACE
      ?auto_98 - SURFACE
    )
    :vars
    (
      ?auto_102 - HOIST
      ?auto_101 - PLACE
      ?auto_104 - PLACE
      ?auto_106 - HOIST
      ?auto_105 - SURFACE
      ?auto_100 - SURFACE
      ?auto_103 - TRUCK
      ?auto_107 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_102 ?auto_101 ) ( IS-CRATE ?auto_99 ) ( not ( = ?auto_99 ?auto_98 ) ) ( not ( = ?auto_104 ?auto_101 ) ) ( HOIST-AT ?auto_106 ?auto_104 ) ( not ( = ?auto_102 ?auto_106 ) ) ( AVAILABLE ?auto_106 ) ( SURFACE-AT ?auto_99 ?auto_104 ) ( ON ?auto_99 ?auto_105 ) ( CLEAR ?auto_99 ) ( not ( = ?auto_99 ?auto_105 ) ) ( not ( = ?auto_98 ?auto_105 ) ) ( SURFACE-AT ?auto_100 ?auto_101 ) ( CLEAR ?auto_100 ) ( IS-CRATE ?auto_98 ) ( not ( = ?auto_99 ?auto_100 ) ) ( not ( = ?auto_98 ?auto_100 ) ) ( not ( = ?auto_105 ?auto_100 ) ) ( AVAILABLE ?auto_102 ) ( IN ?auto_98 ?auto_103 ) ( TRUCK-AT ?auto_103 ?auto_107 ) ( not ( = ?auto_107 ?auto_101 ) ) ( not ( = ?auto_104 ?auto_107 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_103 ?auto_107 ?auto_101 )
      ( MAKE-ON ?auto_99 ?auto_98 )
      ( MAKE-ON-VERIFY ?auto_99 ?auto_98 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_109 - SURFACE
      ?auto_108 - SURFACE
    )
    :vars
    (
      ?auto_114 - HOIST
      ?auto_113 - PLACE
      ?auto_112 - PLACE
      ?auto_111 - HOIST
      ?auto_115 - SURFACE
      ?auto_117 - SURFACE
      ?auto_110 - TRUCK
      ?auto_116 - PLACE
      ?auto_118 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_114 ?auto_113 ) ( IS-CRATE ?auto_109 ) ( not ( = ?auto_109 ?auto_108 ) ) ( not ( = ?auto_112 ?auto_113 ) ) ( HOIST-AT ?auto_111 ?auto_112 ) ( not ( = ?auto_114 ?auto_111 ) ) ( AVAILABLE ?auto_111 ) ( SURFACE-AT ?auto_109 ?auto_112 ) ( ON ?auto_109 ?auto_115 ) ( CLEAR ?auto_109 ) ( not ( = ?auto_109 ?auto_115 ) ) ( not ( = ?auto_108 ?auto_115 ) ) ( SURFACE-AT ?auto_117 ?auto_113 ) ( CLEAR ?auto_117 ) ( IS-CRATE ?auto_108 ) ( not ( = ?auto_109 ?auto_117 ) ) ( not ( = ?auto_108 ?auto_117 ) ) ( not ( = ?auto_115 ?auto_117 ) ) ( AVAILABLE ?auto_114 ) ( TRUCK-AT ?auto_110 ?auto_116 ) ( not ( = ?auto_116 ?auto_113 ) ) ( not ( = ?auto_112 ?auto_116 ) ) ( HOIST-AT ?auto_118 ?auto_116 ) ( LIFTING ?auto_118 ?auto_108 ) ( not ( = ?auto_114 ?auto_118 ) ) ( not ( = ?auto_111 ?auto_118 ) ) )
    :subtasks
    ( ( !LOAD ?auto_118 ?auto_108 ?auto_110 ?auto_116 )
      ( MAKE-ON ?auto_109 ?auto_108 )
      ( MAKE-ON-VERIFY ?auto_109 ?auto_108 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_120 - SURFACE
      ?auto_119 - SURFACE
    )
    :vars
    (
      ?auto_126 - HOIST
      ?auto_124 - PLACE
      ?auto_123 - PLACE
      ?auto_127 - HOIST
      ?auto_125 - SURFACE
      ?auto_121 - SURFACE
      ?auto_129 - TRUCK
      ?auto_122 - PLACE
      ?auto_128 - HOIST
      ?auto_130 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126 ?auto_124 ) ( IS-CRATE ?auto_120 ) ( not ( = ?auto_120 ?auto_119 ) ) ( not ( = ?auto_123 ?auto_124 ) ) ( HOIST-AT ?auto_127 ?auto_123 ) ( not ( = ?auto_126 ?auto_127 ) ) ( AVAILABLE ?auto_127 ) ( SURFACE-AT ?auto_120 ?auto_123 ) ( ON ?auto_120 ?auto_125 ) ( CLEAR ?auto_120 ) ( not ( = ?auto_120 ?auto_125 ) ) ( not ( = ?auto_119 ?auto_125 ) ) ( SURFACE-AT ?auto_121 ?auto_124 ) ( CLEAR ?auto_121 ) ( IS-CRATE ?auto_119 ) ( not ( = ?auto_120 ?auto_121 ) ) ( not ( = ?auto_119 ?auto_121 ) ) ( not ( = ?auto_125 ?auto_121 ) ) ( AVAILABLE ?auto_126 ) ( TRUCK-AT ?auto_129 ?auto_122 ) ( not ( = ?auto_122 ?auto_124 ) ) ( not ( = ?auto_123 ?auto_122 ) ) ( HOIST-AT ?auto_128 ?auto_122 ) ( not ( = ?auto_126 ?auto_128 ) ) ( not ( = ?auto_127 ?auto_128 ) ) ( AVAILABLE ?auto_128 ) ( SURFACE-AT ?auto_119 ?auto_122 ) ( ON ?auto_119 ?auto_130 ) ( CLEAR ?auto_119 ) ( not ( = ?auto_120 ?auto_130 ) ) ( not ( = ?auto_119 ?auto_130 ) ) ( not ( = ?auto_125 ?auto_130 ) ) ( not ( = ?auto_121 ?auto_130 ) ) )
    :subtasks
    ( ( !LIFT ?auto_128 ?auto_119 ?auto_130 ?auto_122 )
      ( MAKE-ON ?auto_120 ?auto_119 )
      ( MAKE-ON-VERIFY ?auto_120 ?auto_119 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_132 - SURFACE
      ?auto_131 - SURFACE
    )
    :vars
    (
      ?auto_134 - HOIST
      ?auto_136 - PLACE
      ?auto_139 - PLACE
      ?auto_141 - HOIST
      ?auto_133 - SURFACE
      ?auto_135 - SURFACE
      ?auto_140 - PLACE
      ?auto_138 - HOIST
      ?auto_142 - SURFACE
      ?auto_137 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_134 ?auto_136 ) ( IS-CRATE ?auto_132 ) ( not ( = ?auto_132 ?auto_131 ) ) ( not ( = ?auto_139 ?auto_136 ) ) ( HOIST-AT ?auto_141 ?auto_139 ) ( not ( = ?auto_134 ?auto_141 ) ) ( AVAILABLE ?auto_141 ) ( SURFACE-AT ?auto_132 ?auto_139 ) ( ON ?auto_132 ?auto_133 ) ( CLEAR ?auto_132 ) ( not ( = ?auto_132 ?auto_133 ) ) ( not ( = ?auto_131 ?auto_133 ) ) ( SURFACE-AT ?auto_135 ?auto_136 ) ( CLEAR ?auto_135 ) ( IS-CRATE ?auto_131 ) ( not ( = ?auto_132 ?auto_135 ) ) ( not ( = ?auto_131 ?auto_135 ) ) ( not ( = ?auto_133 ?auto_135 ) ) ( AVAILABLE ?auto_134 ) ( not ( = ?auto_140 ?auto_136 ) ) ( not ( = ?auto_139 ?auto_140 ) ) ( HOIST-AT ?auto_138 ?auto_140 ) ( not ( = ?auto_134 ?auto_138 ) ) ( not ( = ?auto_141 ?auto_138 ) ) ( AVAILABLE ?auto_138 ) ( SURFACE-AT ?auto_131 ?auto_140 ) ( ON ?auto_131 ?auto_142 ) ( CLEAR ?auto_131 ) ( not ( = ?auto_132 ?auto_142 ) ) ( not ( = ?auto_131 ?auto_142 ) ) ( not ( = ?auto_133 ?auto_142 ) ) ( not ( = ?auto_135 ?auto_142 ) ) ( TRUCK-AT ?auto_137 ?auto_136 ) )
    :subtasks
    ( ( !DRIVE ?auto_137 ?auto_136 ?auto_140 )
      ( MAKE-ON ?auto_132 ?auto_131 )
      ( MAKE-ON-VERIFY ?auto_132 ?auto_131 ) )
  )

)

