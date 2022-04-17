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
      ?auto_14 - HOIST
      ?auto_15 - PLACE
      ?auto_13 - TRUCK
      ?auto_16 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14 ?auto_15 ) ( SURFACE-AT ?auto_11 ?auto_15 ) ( CLEAR ?auto_11 ) ( IS-CRATE ?auto_12 ) ( not ( = ?auto_12 ?auto_11 ) ) ( AVAILABLE ?auto_14 ) ( IN ?auto_12 ?auto_13 ) ( TRUCK-AT ?auto_13 ?auto_16 ) ( not ( = ?auto_16 ?auto_15 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13 ?auto_16 ?auto_15 )
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
      ?auto_28 - HOIST
      ?auto_26 - PLACE
      ?auto_27 - TRUCK
      ?auto_29 - PLACE
      ?auto_30 - HOIST
      ?auto_31 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28 ?auto_26 ) ( SURFACE-AT ?auto_24 ?auto_26 ) ( CLEAR ?auto_24 ) ( IS-CRATE ?auto_25 ) ( not ( = ?auto_25 ?auto_24 ) ) ( AVAILABLE ?auto_28 ) ( TRUCK-AT ?auto_27 ?auto_29 ) ( not ( = ?auto_29 ?auto_26 ) ) ( HOIST-AT ?auto_30 ?auto_29 ) ( not ( = ?auto_28 ?auto_30 ) ) ( AVAILABLE ?auto_30 ) ( SURFACE-AT ?auto_25 ?auto_29 ) ( ON ?auto_25 ?auto_31 ) ( CLEAR ?auto_25 ) ( not ( = ?auto_25 ?auto_31 ) ) ( not ( = ?auto_24 ?auto_31 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30 ?auto_25 ?auto_31 ?auto_29 )
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
      ?auto_35 - HOIST
      ?auto_38 - PLACE
      ?auto_36 - PLACE
      ?auto_39 - HOIST
      ?auto_34 - SURFACE
      ?auto_37 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35 ?auto_38 ) ( SURFACE-AT ?auto_32 ?auto_38 ) ( CLEAR ?auto_32 ) ( IS-CRATE ?auto_33 ) ( not ( = ?auto_33 ?auto_32 ) ) ( AVAILABLE ?auto_35 ) ( not ( = ?auto_36 ?auto_38 ) ) ( HOIST-AT ?auto_39 ?auto_36 ) ( not ( = ?auto_35 ?auto_39 ) ) ( AVAILABLE ?auto_39 ) ( SURFACE-AT ?auto_33 ?auto_36 ) ( ON ?auto_33 ?auto_34 ) ( CLEAR ?auto_33 ) ( not ( = ?auto_33 ?auto_34 ) ) ( not ( = ?auto_32 ?auto_34 ) ) ( TRUCK-AT ?auto_37 ?auto_38 ) )
    :subtasks
    ( ( !DRIVE ?auto_37 ?auto_38 ?auto_36 )
      ( MAKE-ON ?auto_33 ?auto_32 )
      ( MAKE-ON-VERIFY ?auto_33 ?auto_32 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_81 - SURFACE
      ?auto_80 - SURFACE
    )
    :vars
    (
      ?auto_83 - HOIST
      ?auto_87 - PLACE
      ?auto_86 - PLACE
      ?auto_84 - HOIST
      ?auto_85 - SURFACE
      ?auto_82 - TRUCK
      ?auto_88 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_83 ?auto_87 ) ( IS-CRATE ?auto_81 ) ( not ( = ?auto_81 ?auto_80 ) ) ( not ( = ?auto_86 ?auto_87 ) ) ( HOIST-AT ?auto_84 ?auto_86 ) ( not ( = ?auto_83 ?auto_84 ) ) ( AVAILABLE ?auto_84 ) ( SURFACE-AT ?auto_81 ?auto_86 ) ( ON ?auto_81 ?auto_85 ) ( CLEAR ?auto_81 ) ( not ( = ?auto_81 ?auto_85 ) ) ( not ( = ?auto_80 ?auto_85 ) ) ( TRUCK-AT ?auto_82 ?auto_87 ) ( SURFACE-AT ?auto_88 ?auto_87 ) ( CLEAR ?auto_88 ) ( LIFTING ?auto_83 ?auto_80 ) ( IS-CRATE ?auto_80 ) ( not ( = ?auto_81 ?auto_88 ) ) ( not ( = ?auto_80 ?auto_88 ) ) ( not ( = ?auto_85 ?auto_88 ) ) )
    :subtasks
    ( ( !DROP ?auto_83 ?auto_80 ?auto_88 ?auto_87 )
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
      ?auto_93 - HOIST
      ?auto_95 - PLACE
      ?auto_94 - PLACE
      ?auto_92 - HOIST
      ?auto_97 - SURFACE
      ?auto_96 - TRUCK
      ?auto_91 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_93 ?auto_95 ) ( IS-CRATE ?auto_90 ) ( not ( = ?auto_90 ?auto_89 ) ) ( not ( = ?auto_94 ?auto_95 ) ) ( HOIST-AT ?auto_92 ?auto_94 ) ( not ( = ?auto_93 ?auto_92 ) ) ( AVAILABLE ?auto_92 ) ( SURFACE-AT ?auto_90 ?auto_94 ) ( ON ?auto_90 ?auto_97 ) ( CLEAR ?auto_90 ) ( not ( = ?auto_90 ?auto_97 ) ) ( not ( = ?auto_89 ?auto_97 ) ) ( TRUCK-AT ?auto_96 ?auto_95 ) ( SURFACE-AT ?auto_91 ?auto_95 ) ( CLEAR ?auto_91 ) ( IS-CRATE ?auto_89 ) ( not ( = ?auto_90 ?auto_91 ) ) ( not ( = ?auto_89 ?auto_91 ) ) ( not ( = ?auto_97 ?auto_91 ) ) ( AVAILABLE ?auto_93 ) ( IN ?auto_89 ?auto_96 ) )
    :subtasks
    ( ( !UNLOAD ?auto_93 ?auto_89 ?auto_96 ?auto_95 )
      ( MAKE-ON ?auto_90 ?auto_89 )
      ( MAKE-ON-VERIFY ?auto_90 ?auto_89 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_105 - SURFACE
      ?auto_104 - SURFACE
    )
    :vars
    (
      ?auto_107 - HOIST
      ?auto_106 - PLACE
      ?auto_109 - PLACE
      ?auto_110 - HOIST
      ?auto_111 - SURFACE
      ?auto_108 - TRUCK
      ?auto_112 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_107 ?auto_106 ) ( SURFACE-AT ?auto_104 ?auto_106 ) ( CLEAR ?auto_104 ) ( IS-CRATE ?auto_105 ) ( not ( = ?auto_105 ?auto_104 ) ) ( AVAILABLE ?auto_107 ) ( not ( = ?auto_109 ?auto_106 ) ) ( HOIST-AT ?auto_110 ?auto_109 ) ( not ( = ?auto_107 ?auto_110 ) ) ( AVAILABLE ?auto_110 ) ( SURFACE-AT ?auto_105 ?auto_109 ) ( ON ?auto_105 ?auto_111 ) ( CLEAR ?auto_105 ) ( not ( = ?auto_105 ?auto_111 ) ) ( not ( = ?auto_104 ?auto_111 ) ) ( TRUCK-AT ?auto_108 ?auto_112 ) ( not ( = ?auto_112 ?auto_106 ) ) ( not ( = ?auto_109 ?auto_112 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_108 ?auto_112 ?auto_106 )
      ( MAKE-ON ?auto_105 ?auto_104 )
      ( MAKE-ON-VERIFY ?auto_105 ?auto_104 ) )
  )

)

