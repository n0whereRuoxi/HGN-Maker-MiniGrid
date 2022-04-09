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
      ?auto_103 - SURFACE
      ?auto_104 - SURFACE
    )
    :vars
    (
      ?auto_105 - HOIST
      ?auto_106 - PLACE
      ?auto_108 - PLACE
      ?auto_109 - HOIST
      ?auto_110 - SURFACE
      ?auto_107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_105 ?auto_106 ) ( SURFACE-AT ?auto_103 ?auto_106 ) ( CLEAR ?auto_103 ) ( IS-CRATE ?auto_104 ) ( AVAILABLE ?auto_105 ) ( not ( = ?auto_108 ?auto_106 ) ) ( HOIST-AT ?auto_109 ?auto_108 ) ( AVAILABLE ?auto_109 ) ( SURFACE-AT ?auto_104 ?auto_108 ) ( ON ?auto_104 ?auto_110 ) ( CLEAR ?auto_104 ) ( TRUCK-AT ?auto_107 ?auto_106 ) ( not ( = ?auto_103 ?auto_104 ) ) ( not ( = ?auto_103 ?auto_110 ) ) ( not ( = ?auto_104 ?auto_110 ) ) ( not ( = ?auto_105 ?auto_109 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_107 ?auto_106 ?auto_108 )
      ( !LIFT ?auto_109 ?auto_104 ?auto_110 ?auto_108 )
      ( !LOAD ?auto_109 ?auto_104 ?auto_107 ?auto_108 )
      ( !DRIVE ?auto_107 ?auto_108 ?auto_106 )
      ( !UNLOAD ?auto_105 ?auto_104 ?auto_107 ?auto_106 )
      ( !DROP ?auto_105 ?auto_104 ?auto_103 ?auto_106 )
      ( MAKE-1CRATE-VERIFY ?auto_103 ?auto_104 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_113 - SURFACE
      ?auto_114 - SURFACE
    )
    :vars
    (
      ?auto_115 - HOIST
      ?auto_116 - PLACE
      ?auto_118 - PLACE
      ?auto_119 - HOIST
      ?auto_120 - SURFACE
      ?auto_117 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_115 ?auto_116 ) ( SURFACE-AT ?auto_113 ?auto_116 ) ( CLEAR ?auto_113 ) ( IS-CRATE ?auto_114 ) ( AVAILABLE ?auto_115 ) ( not ( = ?auto_118 ?auto_116 ) ) ( HOIST-AT ?auto_119 ?auto_118 ) ( AVAILABLE ?auto_119 ) ( SURFACE-AT ?auto_114 ?auto_118 ) ( ON ?auto_114 ?auto_120 ) ( CLEAR ?auto_114 ) ( TRUCK-AT ?auto_117 ?auto_116 ) ( not ( = ?auto_113 ?auto_114 ) ) ( not ( = ?auto_113 ?auto_120 ) ) ( not ( = ?auto_114 ?auto_120 ) ) ( not ( = ?auto_115 ?auto_119 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_117 ?auto_116 ?auto_118 )
      ( !LIFT ?auto_119 ?auto_114 ?auto_120 ?auto_118 )
      ( !LOAD ?auto_119 ?auto_114 ?auto_117 ?auto_118 )
      ( !DRIVE ?auto_117 ?auto_118 ?auto_116 )
      ( !UNLOAD ?auto_115 ?auto_114 ?auto_117 ?auto_116 )
      ( !DROP ?auto_115 ?auto_114 ?auto_113 ?auto_116 )
      ( MAKE-1CRATE-VERIFY ?auto_113 ?auto_114 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_124 - SURFACE
      ?auto_125 - SURFACE
      ?auto_126 - SURFACE
    )
    :vars
    (
      ?auto_132 - HOIST
      ?auto_127 - PLACE
      ?auto_129 - PLACE
      ?auto_130 - HOIST
      ?auto_128 - SURFACE
      ?auto_133 - SURFACE
      ?auto_131 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_132 ?auto_127 ) ( IS-CRATE ?auto_126 ) ( not ( = ?auto_129 ?auto_127 ) ) ( HOIST-AT ?auto_130 ?auto_129 ) ( SURFACE-AT ?auto_126 ?auto_129 ) ( ON ?auto_126 ?auto_128 ) ( CLEAR ?auto_126 ) ( not ( = ?auto_125 ?auto_126 ) ) ( not ( = ?auto_125 ?auto_128 ) ) ( not ( = ?auto_126 ?auto_128 ) ) ( not ( = ?auto_132 ?auto_130 ) ) ( SURFACE-AT ?auto_124 ?auto_127 ) ( CLEAR ?auto_124 ) ( IS-CRATE ?auto_125 ) ( AVAILABLE ?auto_132 ) ( AVAILABLE ?auto_130 ) ( SURFACE-AT ?auto_125 ?auto_129 ) ( ON ?auto_125 ?auto_133 ) ( CLEAR ?auto_125 ) ( TRUCK-AT ?auto_131 ?auto_127 ) ( not ( = ?auto_124 ?auto_125 ) ) ( not ( = ?auto_124 ?auto_133 ) ) ( not ( = ?auto_125 ?auto_133 ) ) ( not ( = ?auto_124 ?auto_126 ) ) ( not ( = ?auto_124 ?auto_128 ) ) ( not ( = ?auto_126 ?auto_133 ) ) ( not ( = ?auto_128 ?auto_133 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_124 ?auto_125 )
      ( MAKE-1CRATE ?auto_125 ?auto_126 )
      ( MAKE-2CRATE-VERIFY ?auto_124 ?auto_125 ?auto_126 ) )
  )

)

