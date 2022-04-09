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
      ?auto_136 - SURFACE
      ?auto_137 - SURFACE
    )
    :vars
    (
      ?auto_138 - HOIST
      ?auto_139 - PLACE
      ?auto_141 - PLACE
      ?auto_142 - HOIST
      ?auto_143 - SURFACE
      ?auto_140 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_138 ?auto_139 ) ( SURFACE-AT ?auto_136 ?auto_139 ) ( CLEAR ?auto_136 ) ( IS-CRATE ?auto_137 ) ( AVAILABLE ?auto_138 ) ( not ( = ?auto_141 ?auto_139 ) ) ( HOIST-AT ?auto_142 ?auto_141 ) ( AVAILABLE ?auto_142 ) ( SURFACE-AT ?auto_137 ?auto_141 ) ( ON ?auto_137 ?auto_143 ) ( CLEAR ?auto_137 ) ( TRUCK-AT ?auto_140 ?auto_139 ) ( not ( = ?auto_136 ?auto_137 ) ) ( not ( = ?auto_136 ?auto_143 ) ) ( not ( = ?auto_137 ?auto_143 ) ) ( not ( = ?auto_138 ?auto_142 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_140 ?auto_139 ?auto_141 )
      ( !LIFT ?auto_142 ?auto_137 ?auto_143 ?auto_141 )
      ( !LOAD ?auto_142 ?auto_137 ?auto_140 ?auto_141 )
      ( !DRIVE ?auto_140 ?auto_141 ?auto_139 )
      ( !UNLOAD ?auto_138 ?auto_137 ?auto_140 ?auto_139 )
      ( !DROP ?auto_138 ?auto_137 ?auto_136 ?auto_139 )
      ( MAKE-1CRATE-VERIFY ?auto_136 ?auto_137 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_157 - SURFACE
      ?auto_158 - SURFACE
      ?auto_159 - SURFACE
    )
    :vars
    (
      ?auto_162 - HOIST
      ?auto_161 - PLACE
      ?auto_163 - PLACE
      ?auto_160 - HOIST
      ?auto_165 - SURFACE
      ?auto_166 - SURFACE
      ?auto_164 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162 ?auto_161 ) ( IS-CRATE ?auto_159 ) ( not ( = ?auto_163 ?auto_161 ) ) ( HOIST-AT ?auto_160 ?auto_163 ) ( SURFACE-AT ?auto_159 ?auto_163 ) ( ON ?auto_159 ?auto_165 ) ( CLEAR ?auto_159 ) ( not ( = ?auto_158 ?auto_159 ) ) ( not ( = ?auto_158 ?auto_165 ) ) ( not ( = ?auto_159 ?auto_165 ) ) ( not ( = ?auto_162 ?auto_160 ) ) ( SURFACE-AT ?auto_157 ?auto_161 ) ( CLEAR ?auto_157 ) ( IS-CRATE ?auto_158 ) ( AVAILABLE ?auto_162 ) ( AVAILABLE ?auto_160 ) ( SURFACE-AT ?auto_158 ?auto_163 ) ( ON ?auto_158 ?auto_166 ) ( CLEAR ?auto_158 ) ( TRUCK-AT ?auto_164 ?auto_161 ) ( not ( = ?auto_157 ?auto_158 ) ) ( not ( = ?auto_157 ?auto_166 ) ) ( not ( = ?auto_158 ?auto_166 ) ) ( not ( = ?auto_157 ?auto_159 ) ) ( not ( = ?auto_157 ?auto_165 ) ) ( not ( = ?auto_159 ?auto_166 ) ) ( not ( = ?auto_165 ?auto_166 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_157 ?auto_158 )
      ( MAKE-1CRATE ?auto_158 ?auto_159 )
      ( MAKE-2CRATE-VERIFY ?auto_157 ?auto_158 ?auto_159 ) )
  )

)

