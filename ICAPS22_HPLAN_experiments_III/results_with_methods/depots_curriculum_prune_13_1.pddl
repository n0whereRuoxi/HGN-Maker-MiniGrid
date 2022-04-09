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

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-8CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-9CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-10CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-11CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-12CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-13CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14076 - SURFACE
      ?auto_14077 - SURFACE
    )
    :vars
    (
      ?auto_14078 - HOIST
      ?auto_14079 - PLACE
      ?auto_14081 - PLACE
      ?auto_14082 - HOIST
      ?auto_14083 - SURFACE
      ?auto_14080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14078 ?auto_14079 ) ( SURFACE-AT ?auto_14076 ?auto_14079 ) ( CLEAR ?auto_14076 ) ( IS-CRATE ?auto_14077 ) ( AVAILABLE ?auto_14078 ) ( not ( = ?auto_14081 ?auto_14079 ) ) ( HOIST-AT ?auto_14082 ?auto_14081 ) ( AVAILABLE ?auto_14082 ) ( SURFACE-AT ?auto_14077 ?auto_14081 ) ( ON ?auto_14077 ?auto_14083 ) ( CLEAR ?auto_14077 ) ( TRUCK-AT ?auto_14080 ?auto_14079 ) ( not ( = ?auto_14076 ?auto_14077 ) ) ( not ( = ?auto_14076 ?auto_14083 ) ) ( not ( = ?auto_14077 ?auto_14083 ) ) ( not ( = ?auto_14078 ?auto_14082 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14080 ?auto_14079 ?auto_14081 )
      ( !LIFT ?auto_14082 ?auto_14077 ?auto_14083 ?auto_14081 )
      ( !LOAD ?auto_14082 ?auto_14077 ?auto_14080 ?auto_14081 )
      ( !DRIVE ?auto_14080 ?auto_14081 ?auto_14079 )
      ( !UNLOAD ?auto_14078 ?auto_14077 ?auto_14080 ?auto_14079 )
      ( !DROP ?auto_14078 ?auto_14077 ?auto_14076 ?auto_14079 )
      ( MAKE-1CRATE-VERIFY ?auto_14076 ?auto_14077 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14097 - SURFACE
      ?auto_14098 - SURFACE
      ?auto_14099 - SURFACE
    )
    :vars
    (
      ?auto_14103 - HOIST
      ?auto_14105 - PLACE
      ?auto_14102 - PLACE
      ?auto_14104 - HOIST
      ?auto_14100 - SURFACE
      ?auto_14107 - PLACE
      ?auto_14106 - HOIST
      ?auto_14108 - SURFACE
      ?auto_14101 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14103 ?auto_14105 ) ( IS-CRATE ?auto_14099 ) ( not ( = ?auto_14102 ?auto_14105 ) ) ( HOIST-AT ?auto_14104 ?auto_14102 ) ( AVAILABLE ?auto_14104 ) ( SURFACE-AT ?auto_14099 ?auto_14102 ) ( ON ?auto_14099 ?auto_14100 ) ( CLEAR ?auto_14099 ) ( not ( = ?auto_14098 ?auto_14099 ) ) ( not ( = ?auto_14098 ?auto_14100 ) ) ( not ( = ?auto_14099 ?auto_14100 ) ) ( not ( = ?auto_14103 ?auto_14104 ) ) ( SURFACE-AT ?auto_14097 ?auto_14105 ) ( CLEAR ?auto_14097 ) ( IS-CRATE ?auto_14098 ) ( AVAILABLE ?auto_14103 ) ( not ( = ?auto_14107 ?auto_14105 ) ) ( HOIST-AT ?auto_14106 ?auto_14107 ) ( AVAILABLE ?auto_14106 ) ( SURFACE-AT ?auto_14098 ?auto_14107 ) ( ON ?auto_14098 ?auto_14108 ) ( CLEAR ?auto_14098 ) ( TRUCK-AT ?auto_14101 ?auto_14105 ) ( not ( = ?auto_14097 ?auto_14098 ) ) ( not ( = ?auto_14097 ?auto_14108 ) ) ( not ( = ?auto_14098 ?auto_14108 ) ) ( not ( = ?auto_14103 ?auto_14106 ) ) ( not ( = ?auto_14097 ?auto_14099 ) ) ( not ( = ?auto_14097 ?auto_14100 ) ) ( not ( = ?auto_14099 ?auto_14108 ) ) ( not ( = ?auto_14102 ?auto_14107 ) ) ( not ( = ?auto_14104 ?auto_14106 ) ) ( not ( = ?auto_14100 ?auto_14108 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14097 ?auto_14098 )
      ( MAKE-1CRATE ?auto_14098 ?auto_14099 )
      ( MAKE-2CRATE-VERIFY ?auto_14097 ?auto_14098 ?auto_14099 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14123 - SURFACE
      ?auto_14124 - SURFACE
      ?auto_14125 - SURFACE
      ?auto_14126 - SURFACE
    )
    :vars
    (
      ?auto_14132 - HOIST
      ?auto_14131 - PLACE
      ?auto_14130 - PLACE
      ?auto_14129 - HOIST
      ?auto_14127 - SURFACE
      ?auto_14138 - PLACE
      ?auto_14137 - HOIST
      ?auto_14133 - SURFACE
      ?auto_14136 - PLACE
      ?auto_14134 - HOIST
      ?auto_14135 - SURFACE
      ?auto_14128 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14132 ?auto_14131 ) ( IS-CRATE ?auto_14126 ) ( not ( = ?auto_14130 ?auto_14131 ) ) ( HOIST-AT ?auto_14129 ?auto_14130 ) ( AVAILABLE ?auto_14129 ) ( SURFACE-AT ?auto_14126 ?auto_14130 ) ( ON ?auto_14126 ?auto_14127 ) ( CLEAR ?auto_14126 ) ( not ( = ?auto_14125 ?auto_14126 ) ) ( not ( = ?auto_14125 ?auto_14127 ) ) ( not ( = ?auto_14126 ?auto_14127 ) ) ( not ( = ?auto_14132 ?auto_14129 ) ) ( IS-CRATE ?auto_14125 ) ( not ( = ?auto_14138 ?auto_14131 ) ) ( HOIST-AT ?auto_14137 ?auto_14138 ) ( AVAILABLE ?auto_14137 ) ( SURFACE-AT ?auto_14125 ?auto_14138 ) ( ON ?auto_14125 ?auto_14133 ) ( CLEAR ?auto_14125 ) ( not ( = ?auto_14124 ?auto_14125 ) ) ( not ( = ?auto_14124 ?auto_14133 ) ) ( not ( = ?auto_14125 ?auto_14133 ) ) ( not ( = ?auto_14132 ?auto_14137 ) ) ( SURFACE-AT ?auto_14123 ?auto_14131 ) ( CLEAR ?auto_14123 ) ( IS-CRATE ?auto_14124 ) ( AVAILABLE ?auto_14132 ) ( not ( = ?auto_14136 ?auto_14131 ) ) ( HOIST-AT ?auto_14134 ?auto_14136 ) ( AVAILABLE ?auto_14134 ) ( SURFACE-AT ?auto_14124 ?auto_14136 ) ( ON ?auto_14124 ?auto_14135 ) ( CLEAR ?auto_14124 ) ( TRUCK-AT ?auto_14128 ?auto_14131 ) ( not ( = ?auto_14123 ?auto_14124 ) ) ( not ( = ?auto_14123 ?auto_14135 ) ) ( not ( = ?auto_14124 ?auto_14135 ) ) ( not ( = ?auto_14132 ?auto_14134 ) ) ( not ( = ?auto_14123 ?auto_14125 ) ) ( not ( = ?auto_14123 ?auto_14133 ) ) ( not ( = ?auto_14125 ?auto_14135 ) ) ( not ( = ?auto_14138 ?auto_14136 ) ) ( not ( = ?auto_14137 ?auto_14134 ) ) ( not ( = ?auto_14133 ?auto_14135 ) ) ( not ( = ?auto_14123 ?auto_14126 ) ) ( not ( = ?auto_14123 ?auto_14127 ) ) ( not ( = ?auto_14124 ?auto_14126 ) ) ( not ( = ?auto_14124 ?auto_14127 ) ) ( not ( = ?auto_14126 ?auto_14133 ) ) ( not ( = ?auto_14126 ?auto_14135 ) ) ( not ( = ?auto_14130 ?auto_14138 ) ) ( not ( = ?auto_14130 ?auto_14136 ) ) ( not ( = ?auto_14129 ?auto_14137 ) ) ( not ( = ?auto_14129 ?auto_14134 ) ) ( not ( = ?auto_14127 ?auto_14133 ) ) ( not ( = ?auto_14127 ?auto_14135 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14123 ?auto_14124 ?auto_14125 )
      ( MAKE-1CRATE ?auto_14125 ?auto_14126 )
      ( MAKE-3CRATE-VERIFY ?auto_14123 ?auto_14124 ?auto_14125 ?auto_14126 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14154 - SURFACE
      ?auto_14155 - SURFACE
      ?auto_14156 - SURFACE
      ?auto_14157 - SURFACE
      ?auto_14158 - SURFACE
    )
    :vars
    (
      ?auto_14164 - HOIST
      ?auto_14163 - PLACE
      ?auto_14162 - PLACE
      ?auto_14160 - HOIST
      ?auto_14159 - SURFACE
      ?auto_14171 - PLACE
      ?auto_14166 - HOIST
      ?auto_14168 - SURFACE
      ?auto_14167 - PLACE
      ?auto_14172 - HOIST
      ?auto_14165 - SURFACE
      ?auto_14169 - PLACE
      ?auto_14170 - HOIST
      ?auto_14173 - SURFACE
      ?auto_14161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14164 ?auto_14163 ) ( IS-CRATE ?auto_14158 ) ( not ( = ?auto_14162 ?auto_14163 ) ) ( HOIST-AT ?auto_14160 ?auto_14162 ) ( AVAILABLE ?auto_14160 ) ( SURFACE-AT ?auto_14158 ?auto_14162 ) ( ON ?auto_14158 ?auto_14159 ) ( CLEAR ?auto_14158 ) ( not ( = ?auto_14157 ?auto_14158 ) ) ( not ( = ?auto_14157 ?auto_14159 ) ) ( not ( = ?auto_14158 ?auto_14159 ) ) ( not ( = ?auto_14164 ?auto_14160 ) ) ( IS-CRATE ?auto_14157 ) ( not ( = ?auto_14171 ?auto_14163 ) ) ( HOIST-AT ?auto_14166 ?auto_14171 ) ( AVAILABLE ?auto_14166 ) ( SURFACE-AT ?auto_14157 ?auto_14171 ) ( ON ?auto_14157 ?auto_14168 ) ( CLEAR ?auto_14157 ) ( not ( = ?auto_14156 ?auto_14157 ) ) ( not ( = ?auto_14156 ?auto_14168 ) ) ( not ( = ?auto_14157 ?auto_14168 ) ) ( not ( = ?auto_14164 ?auto_14166 ) ) ( IS-CRATE ?auto_14156 ) ( not ( = ?auto_14167 ?auto_14163 ) ) ( HOIST-AT ?auto_14172 ?auto_14167 ) ( AVAILABLE ?auto_14172 ) ( SURFACE-AT ?auto_14156 ?auto_14167 ) ( ON ?auto_14156 ?auto_14165 ) ( CLEAR ?auto_14156 ) ( not ( = ?auto_14155 ?auto_14156 ) ) ( not ( = ?auto_14155 ?auto_14165 ) ) ( not ( = ?auto_14156 ?auto_14165 ) ) ( not ( = ?auto_14164 ?auto_14172 ) ) ( SURFACE-AT ?auto_14154 ?auto_14163 ) ( CLEAR ?auto_14154 ) ( IS-CRATE ?auto_14155 ) ( AVAILABLE ?auto_14164 ) ( not ( = ?auto_14169 ?auto_14163 ) ) ( HOIST-AT ?auto_14170 ?auto_14169 ) ( AVAILABLE ?auto_14170 ) ( SURFACE-AT ?auto_14155 ?auto_14169 ) ( ON ?auto_14155 ?auto_14173 ) ( CLEAR ?auto_14155 ) ( TRUCK-AT ?auto_14161 ?auto_14163 ) ( not ( = ?auto_14154 ?auto_14155 ) ) ( not ( = ?auto_14154 ?auto_14173 ) ) ( not ( = ?auto_14155 ?auto_14173 ) ) ( not ( = ?auto_14164 ?auto_14170 ) ) ( not ( = ?auto_14154 ?auto_14156 ) ) ( not ( = ?auto_14154 ?auto_14165 ) ) ( not ( = ?auto_14156 ?auto_14173 ) ) ( not ( = ?auto_14167 ?auto_14169 ) ) ( not ( = ?auto_14172 ?auto_14170 ) ) ( not ( = ?auto_14165 ?auto_14173 ) ) ( not ( = ?auto_14154 ?auto_14157 ) ) ( not ( = ?auto_14154 ?auto_14168 ) ) ( not ( = ?auto_14155 ?auto_14157 ) ) ( not ( = ?auto_14155 ?auto_14168 ) ) ( not ( = ?auto_14157 ?auto_14165 ) ) ( not ( = ?auto_14157 ?auto_14173 ) ) ( not ( = ?auto_14171 ?auto_14167 ) ) ( not ( = ?auto_14171 ?auto_14169 ) ) ( not ( = ?auto_14166 ?auto_14172 ) ) ( not ( = ?auto_14166 ?auto_14170 ) ) ( not ( = ?auto_14168 ?auto_14165 ) ) ( not ( = ?auto_14168 ?auto_14173 ) ) ( not ( = ?auto_14154 ?auto_14158 ) ) ( not ( = ?auto_14154 ?auto_14159 ) ) ( not ( = ?auto_14155 ?auto_14158 ) ) ( not ( = ?auto_14155 ?auto_14159 ) ) ( not ( = ?auto_14156 ?auto_14158 ) ) ( not ( = ?auto_14156 ?auto_14159 ) ) ( not ( = ?auto_14158 ?auto_14168 ) ) ( not ( = ?auto_14158 ?auto_14165 ) ) ( not ( = ?auto_14158 ?auto_14173 ) ) ( not ( = ?auto_14162 ?auto_14171 ) ) ( not ( = ?auto_14162 ?auto_14167 ) ) ( not ( = ?auto_14162 ?auto_14169 ) ) ( not ( = ?auto_14160 ?auto_14166 ) ) ( not ( = ?auto_14160 ?auto_14172 ) ) ( not ( = ?auto_14160 ?auto_14170 ) ) ( not ( = ?auto_14159 ?auto_14168 ) ) ( not ( = ?auto_14159 ?auto_14165 ) ) ( not ( = ?auto_14159 ?auto_14173 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_14154 ?auto_14155 ?auto_14156 ?auto_14157 )
      ( MAKE-1CRATE ?auto_14157 ?auto_14158 )
      ( MAKE-4CRATE-VERIFY ?auto_14154 ?auto_14155 ?auto_14156 ?auto_14157 ?auto_14158 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14190 - SURFACE
      ?auto_14191 - SURFACE
      ?auto_14192 - SURFACE
      ?auto_14193 - SURFACE
      ?auto_14194 - SURFACE
      ?auto_14195 - SURFACE
    )
    :vars
    (
      ?auto_14198 - HOIST
      ?auto_14199 - PLACE
      ?auto_14200 - PLACE
      ?auto_14201 - HOIST
      ?auto_14196 - SURFACE
      ?auto_14204 - PLACE
      ?auto_14203 - HOIST
      ?auto_14208 - SURFACE
      ?auto_14206 - PLACE
      ?auto_14212 - HOIST
      ?auto_14211 - SURFACE
      ?auto_14213 - PLACE
      ?auto_14207 - HOIST
      ?auto_14210 - SURFACE
      ?auto_14202 - PLACE
      ?auto_14205 - HOIST
      ?auto_14209 - SURFACE
      ?auto_14197 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14198 ?auto_14199 ) ( IS-CRATE ?auto_14195 ) ( not ( = ?auto_14200 ?auto_14199 ) ) ( HOIST-AT ?auto_14201 ?auto_14200 ) ( AVAILABLE ?auto_14201 ) ( SURFACE-AT ?auto_14195 ?auto_14200 ) ( ON ?auto_14195 ?auto_14196 ) ( CLEAR ?auto_14195 ) ( not ( = ?auto_14194 ?auto_14195 ) ) ( not ( = ?auto_14194 ?auto_14196 ) ) ( not ( = ?auto_14195 ?auto_14196 ) ) ( not ( = ?auto_14198 ?auto_14201 ) ) ( IS-CRATE ?auto_14194 ) ( not ( = ?auto_14204 ?auto_14199 ) ) ( HOIST-AT ?auto_14203 ?auto_14204 ) ( AVAILABLE ?auto_14203 ) ( SURFACE-AT ?auto_14194 ?auto_14204 ) ( ON ?auto_14194 ?auto_14208 ) ( CLEAR ?auto_14194 ) ( not ( = ?auto_14193 ?auto_14194 ) ) ( not ( = ?auto_14193 ?auto_14208 ) ) ( not ( = ?auto_14194 ?auto_14208 ) ) ( not ( = ?auto_14198 ?auto_14203 ) ) ( IS-CRATE ?auto_14193 ) ( not ( = ?auto_14206 ?auto_14199 ) ) ( HOIST-AT ?auto_14212 ?auto_14206 ) ( AVAILABLE ?auto_14212 ) ( SURFACE-AT ?auto_14193 ?auto_14206 ) ( ON ?auto_14193 ?auto_14211 ) ( CLEAR ?auto_14193 ) ( not ( = ?auto_14192 ?auto_14193 ) ) ( not ( = ?auto_14192 ?auto_14211 ) ) ( not ( = ?auto_14193 ?auto_14211 ) ) ( not ( = ?auto_14198 ?auto_14212 ) ) ( IS-CRATE ?auto_14192 ) ( not ( = ?auto_14213 ?auto_14199 ) ) ( HOIST-AT ?auto_14207 ?auto_14213 ) ( AVAILABLE ?auto_14207 ) ( SURFACE-AT ?auto_14192 ?auto_14213 ) ( ON ?auto_14192 ?auto_14210 ) ( CLEAR ?auto_14192 ) ( not ( = ?auto_14191 ?auto_14192 ) ) ( not ( = ?auto_14191 ?auto_14210 ) ) ( not ( = ?auto_14192 ?auto_14210 ) ) ( not ( = ?auto_14198 ?auto_14207 ) ) ( SURFACE-AT ?auto_14190 ?auto_14199 ) ( CLEAR ?auto_14190 ) ( IS-CRATE ?auto_14191 ) ( AVAILABLE ?auto_14198 ) ( not ( = ?auto_14202 ?auto_14199 ) ) ( HOIST-AT ?auto_14205 ?auto_14202 ) ( AVAILABLE ?auto_14205 ) ( SURFACE-AT ?auto_14191 ?auto_14202 ) ( ON ?auto_14191 ?auto_14209 ) ( CLEAR ?auto_14191 ) ( TRUCK-AT ?auto_14197 ?auto_14199 ) ( not ( = ?auto_14190 ?auto_14191 ) ) ( not ( = ?auto_14190 ?auto_14209 ) ) ( not ( = ?auto_14191 ?auto_14209 ) ) ( not ( = ?auto_14198 ?auto_14205 ) ) ( not ( = ?auto_14190 ?auto_14192 ) ) ( not ( = ?auto_14190 ?auto_14210 ) ) ( not ( = ?auto_14192 ?auto_14209 ) ) ( not ( = ?auto_14213 ?auto_14202 ) ) ( not ( = ?auto_14207 ?auto_14205 ) ) ( not ( = ?auto_14210 ?auto_14209 ) ) ( not ( = ?auto_14190 ?auto_14193 ) ) ( not ( = ?auto_14190 ?auto_14211 ) ) ( not ( = ?auto_14191 ?auto_14193 ) ) ( not ( = ?auto_14191 ?auto_14211 ) ) ( not ( = ?auto_14193 ?auto_14210 ) ) ( not ( = ?auto_14193 ?auto_14209 ) ) ( not ( = ?auto_14206 ?auto_14213 ) ) ( not ( = ?auto_14206 ?auto_14202 ) ) ( not ( = ?auto_14212 ?auto_14207 ) ) ( not ( = ?auto_14212 ?auto_14205 ) ) ( not ( = ?auto_14211 ?auto_14210 ) ) ( not ( = ?auto_14211 ?auto_14209 ) ) ( not ( = ?auto_14190 ?auto_14194 ) ) ( not ( = ?auto_14190 ?auto_14208 ) ) ( not ( = ?auto_14191 ?auto_14194 ) ) ( not ( = ?auto_14191 ?auto_14208 ) ) ( not ( = ?auto_14192 ?auto_14194 ) ) ( not ( = ?auto_14192 ?auto_14208 ) ) ( not ( = ?auto_14194 ?auto_14211 ) ) ( not ( = ?auto_14194 ?auto_14210 ) ) ( not ( = ?auto_14194 ?auto_14209 ) ) ( not ( = ?auto_14204 ?auto_14206 ) ) ( not ( = ?auto_14204 ?auto_14213 ) ) ( not ( = ?auto_14204 ?auto_14202 ) ) ( not ( = ?auto_14203 ?auto_14212 ) ) ( not ( = ?auto_14203 ?auto_14207 ) ) ( not ( = ?auto_14203 ?auto_14205 ) ) ( not ( = ?auto_14208 ?auto_14211 ) ) ( not ( = ?auto_14208 ?auto_14210 ) ) ( not ( = ?auto_14208 ?auto_14209 ) ) ( not ( = ?auto_14190 ?auto_14195 ) ) ( not ( = ?auto_14190 ?auto_14196 ) ) ( not ( = ?auto_14191 ?auto_14195 ) ) ( not ( = ?auto_14191 ?auto_14196 ) ) ( not ( = ?auto_14192 ?auto_14195 ) ) ( not ( = ?auto_14192 ?auto_14196 ) ) ( not ( = ?auto_14193 ?auto_14195 ) ) ( not ( = ?auto_14193 ?auto_14196 ) ) ( not ( = ?auto_14195 ?auto_14208 ) ) ( not ( = ?auto_14195 ?auto_14211 ) ) ( not ( = ?auto_14195 ?auto_14210 ) ) ( not ( = ?auto_14195 ?auto_14209 ) ) ( not ( = ?auto_14200 ?auto_14204 ) ) ( not ( = ?auto_14200 ?auto_14206 ) ) ( not ( = ?auto_14200 ?auto_14213 ) ) ( not ( = ?auto_14200 ?auto_14202 ) ) ( not ( = ?auto_14201 ?auto_14203 ) ) ( not ( = ?auto_14201 ?auto_14212 ) ) ( not ( = ?auto_14201 ?auto_14207 ) ) ( not ( = ?auto_14201 ?auto_14205 ) ) ( not ( = ?auto_14196 ?auto_14208 ) ) ( not ( = ?auto_14196 ?auto_14211 ) ) ( not ( = ?auto_14196 ?auto_14210 ) ) ( not ( = ?auto_14196 ?auto_14209 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_14190 ?auto_14191 ?auto_14192 ?auto_14193 ?auto_14194 )
      ( MAKE-1CRATE ?auto_14194 ?auto_14195 )
      ( MAKE-5CRATE-VERIFY ?auto_14190 ?auto_14191 ?auto_14192 ?auto_14193 ?auto_14194 ?auto_14195 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_14231 - SURFACE
      ?auto_14232 - SURFACE
      ?auto_14233 - SURFACE
      ?auto_14234 - SURFACE
      ?auto_14235 - SURFACE
      ?auto_14236 - SURFACE
      ?auto_14237 - SURFACE
    )
    :vars
    (
      ?auto_14241 - HOIST
      ?auto_14243 - PLACE
      ?auto_14239 - PLACE
      ?auto_14242 - HOIST
      ?auto_14238 - SURFACE
      ?auto_14244 - PLACE
      ?auto_14248 - HOIST
      ?auto_14258 - SURFACE
      ?auto_14245 - PLACE
      ?auto_14249 - HOIST
      ?auto_14255 - SURFACE
      ?auto_14257 - PLACE
      ?auto_14246 - HOIST
      ?auto_14252 - SURFACE
      ?auto_14253 - PLACE
      ?auto_14256 - HOIST
      ?auto_14251 - SURFACE
      ?auto_14250 - PLACE
      ?auto_14247 - HOIST
      ?auto_14254 - SURFACE
      ?auto_14240 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14241 ?auto_14243 ) ( IS-CRATE ?auto_14237 ) ( not ( = ?auto_14239 ?auto_14243 ) ) ( HOIST-AT ?auto_14242 ?auto_14239 ) ( AVAILABLE ?auto_14242 ) ( SURFACE-AT ?auto_14237 ?auto_14239 ) ( ON ?auto_14237 ?auto_14238 ) ( CLEAR ?auto_14237 ) ( not ( = ?auto_14236 ?auto_14237 ) ) ( not ( = ?auto_14236 ?auto_14238 ) ) ( not ( = ?auto_14237 ?auto_14238 ) ) ( not ( = ?auto_14241 ?auto_14242 ) ) ( IS-CRATE ?auto_14236 ) ( not ( = ?auto_14244 ?auto_14243 ) ) ( HOIST-AT ?auto_14248 ?auto_14244 ) ( AVAILABLE ?auto_14248 ) ( SURFACE-AT ?auto_14236 ?auto_14244 ) ( ON ?auto_14236 ?auto_14258 ) ( CLEAR ?auto_14236 ) ( not ( = ?auto_14235 ?auto_14236 ) ) ( not ( = ?auto_14235 ?auto_14258 ) ) ( not ( = ?auto_14236 ?auto_14258 ) ) ( not ( = ?auto_14241 ?auto_14248 ) ) ( IS-CRATE ?auto_14235 ) ( not ( = ?auto_14245 ?auto_14243 ) ) ( HOIST-AT ?auto_14249 ?auto_14245 ) ( AVAILABLE ?auto_14249 ) ( SURFACE-AT ?auto_14235 ?auto_14245 ) ( ON ?auto_14235 ?auto_14255 ) ( CLEAR ?auto_14235 ) ( not ( = ?auto_14234 ?auto_14235 ) ) ( not ( = ?auto_14234 ?auto_14255 ) ) ( not ( = ?auto_14235 ?auto_14255 ) ) ( not ( = ?auto_14241 ?auto_14249 ) ) ( IS-CRATE ?auto_14234 ) ( not ( = ?auto_14257 ?auto_14243 ) ) ( HOIST-AT ?auto_14246 ?auto_14257 ) ( AVAILABLE ?auto_14246 ) ( SURFACE-AT ?auto_14234 ?auto_14257 ) ( ON ?auto_14234 ?auto_14252 ) ( CLEAR ?auto_14234 ) ( not ( = ?auto_14233 ?auto_14234 ) ) ( not ( = ?auto_14233 ?auto_14252 ) ) ( not ( = ?auto_14234 ?auto_14252 ) ) ( not ( = ?auto_14241 ?auto_14246 ) ) ( IS-CRATE ?auto_14233 ) ( not ( = ?auto_14253 ?auto_14243 ) ) ( HOIST-AT ?auto_14256 ?auto_14253 ) ( AVAILABLE ?auto_14256 ) ( SURFACE-AT ?auto_14233 ?auto_14253 ) ( ON ?auto_14233 ?auto_14251 ) ( CLEAR ?auto_14233 ) ( not ( = ?auto_14232 ?auto_14233 ) ) ( not ( = ?auto_14232 ?auto_14251 ) ) ( not ( = ?auto_14233 ?auto_14251 ) ) ( not ( = ?auto_14241 ?auto_14256 ) ) ( SURFACE-AT ?auto_14231 ?auto_14243 ) ( CLEAR ?auto_14231 ) ( IS-CRATE ?auto_14232 ) ( AVAILABLE ?auto_14241 ) ( not ( = ?auto_14250 ?auto_14243 ) ) ( HOIST-AT ?auto_14247 ?auto_14250 ) ( AVAILABLE ?auto_14247 ) ( SURFACE-AT ?auto_14232 ?auto_14250 ) ( ON ?auto_14232 ?auto_14254 ) ( CLEAR ?auto_14232 ) ( TRUCK-AT ?auto_14240 ?auto_14243 ) ( not ( = ?auto_14231 ?auto_14232 ) ) ( not ( = ?auto_14231 ?auto_14254 ) ) ( not ( = ?auto_14232 ?auto_14254 ) ) ( not ( = ?auto_14241 ?auto_14247 ) ) ( not ( = ?auto_14231 ?auto_14233 ) ) ( not ( = ?auto_14231 ?auto_14251 ) ) ( not ( = ?auto_14233 ?auto_14254 ) ) ( not ( = ?auto_14253 ?auto_14250 ) ) ( not ( = ?auto_14256 ?auto_14247 ) ) ( not ( = ?auto_14251 ?auto_14254 ) ) ( not ( = ?auto_14231 ?auto_14234 ) ) ( not ( = ?auto_14231 ?auto_14252 ) ) ( not ( = ?auto_14232 ?auto_14234 ) ) ( not ( = ?auto_14232 ?auto_14252 ) ) ( not ( = ?auto_14234 ?auto_14251 ) ) ( not ( = ?auto_14234 ?auto_14254 ) ) ( not ( = ?auto_14257 ?auto_14253 ) ) ( not ( = ?auto_14257 ?auto_14250 ) ) ( not ( = ?auto_14246 ?auto_14256 ) ) ( not ( = ?auto_14246 ?auto_14247 ) ) ( not ( = ?auto_14252 ?auto_14251 ) ) ( not ( = ?auto_14252 ?auto_14254 ) ) ( not ( = ?auto_14231 ?auto_14235 ) ) ( not ( = ?auto_14231 ?auto_14255 ) ) ( not ( = ?auto_14232 ?auto_14235 ) ) ( not ( = ?auto_14232 ?auto_14255 ) ) ( not ( = ?auto_14233 ?auto_14235 ) ) ( not ( = ?auto_14233 ?auto_14255 ) ) ( not ( = ?auto_14235 ?auto_14252 ) ) ( not ( = ?auto_14235 ?auto_14251 ) ) ( not ( = ?auto_14235 ?auto_14254 ) ) ( not ( = ?auto_14245 ?auto_14257 ) ) ( not ( = ?auto_14245 ?auto_14253 ) ) ( not ( = ?auto_14245 ?auto_14250 ) ) ( not ( = ?auto_14249 ?auto_14246 ) ) ( not ( = ?auto_14249 ?auto_14256 ) ) ( not ( = ?auto_14249 ?auto_14247 ) ) ( not ( = ?auto_14255 ?auto_14252 ) ) ( not ( = ?auto_14255 ?auto_14251 ) ) ( not ( = ?auto_14255 ?auto_14254 ) ) ( not ( = ?auto_14231 ?auto_14236 ) ) ( not ( = ?auto_14231 ?auto_14258 ) ) ( not ( = ?auto_14232 ?auto_14236 ) ) ( not ( = ?auto_14232 ?auto_14258 ) ) ( not ( = ?auto_14233 ?auto_14236 ) ) ( not ( = ?auto_14233 ?auto_14258 ) ) ( not ( = ?auto_14234 ?auto_14236 ) ) ( not ( = ?auto_14234 ?auto_14258 ) ) ( not ( = ?auto_14236 ?auto_14255 ) ) ( not ( = ?auto_14236 ?auto_14252 ) ) ( not ( = ?auto_14236 ?auto_14251 ) ) ( not ( = ?auto_14236 ?auto_14254 ) ) ( not ( = ?auto_14244 ?auto_14245 ) ) ( not ( = ?auto_14244 ?auto_14257 ) ) ( not ( = ?auto_14244 ?auto_14253 ) ) ( not ( = ?auto_14244 ?auto_14250 ) ) ( not ( = ?auto_14248 ?auto_14249 ) ) ( not ( = ?auto_14248 ?auto_14246 ) ) ( not ( = ?auto_14248 ?auto_14256 ) ) ( not ( = ?auto_14248 ?auto_14247 ) ) ( not ( = ?auto_14258 ?auto_14255 ) ) ( not ( = ?auto_14258 ?auto_14252 ) ) ( not ( = ?auto_14258 ?auto_14251 ) ) ( not ( = ?auto_14258 ?auto_14254 ) ) ( not ( = ?auto_14231 ?auto_14237 ) ) ( not ( = ?auto_14231 ?auto_14238 ) ) ( not ( = ?auto_14232 ?auto_14237 ) ) ( not ( = ?auto_14232 ?auto_14238 ) ) ( not ( = ?auto_14233 ?auto_14237 ) ) ( not ( = ?auto_14233 ?auto_14238 ) ) ( not ( = ?auto_14234 ?auto_14237 ) ) ( not ( = ?auto_14234 ?auto_14238 ) ) ( not ( = ?auto_14235 ?auto_14237 ) ) ( not ( = ?auto_14235 ?auto_14238 ) ) ( not ( = ?auto_14237 ?auto_14258 ) ) ( not ( = ?auto_14237 ?auto_14255 ) ) ( not ( = ?auto_14237 ?auto_14252 ) ) ( not ( = ?auto_14237 ?auto_14251 ) ) ( not ( = ?auto_14237 ?auto_14254 ) ) ( not ( = ?auto_14239 ?auto_14244 ) ) ( not ( = ?auto_14239 ?auto_14245 ) ) ( not ( = ?auto_14239 ?auto_14257 ) ) ( not ( = ?auto_14239 ?auto_14253 ) ) ( not ( = ?auto_14239 ?auto_14250 ) ) ( not ( = ?auto_14242 ?auto_14248 ) ) ( not ( = ?auto_14242 ?auto_14249 ) ) ( not ( = ?auto_14242 ?auto_14246 ) ) ( not ( = ?auto_14242 ?auto_14256 ) ) ( not ( = ?auto_14242 ?auto_14247 ) ) ( not ( = ?auto_14238 ?auto_14258 ) ) ( not ( = ?auto_14238 ?auto_14255 ) ) ( not ( = ?auto_14238 ?auto_14252 ) ) ( not ( = ?auto_14238 ?auto_14251 ) ) ( not ( = ?auto_14238 ?auto_14254 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_14231 ?auto_14232 ?auto_14233 ?auto_14234 ?auto_14235 ?auto_14236 )
      ( MAKE-1CRATE ?auto_14236 ?auto_14237 )
      ( MAKE-6CRATE-VERIFY ?auto_14231 ?auto_14232 ?auto_14233 ?auto_14234 ?auto_14235 ?auto_14236 ?auto_14237 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_14277 - SURFACE
      ?auto_14278 - SURFACE
      ?auto_14279 - SURFACE
      ?auto_14280 - SURFACE
      ?auto_14281 - SURFACE
      ?auto_14282 - SURFACE
      ?auto_14283 - SURFACE
      ?auto_14284 - SURFACE
    )
    :vars
    (
      ?auto_14289 - HOIST
      ?auto_14287 - PLACE
      ?auto_14286 - PLACE
      ?auto_14285 - HOIST
      ?auto_14290 - SURFACE
      ?auto_14305 - PLACE
      ?auto_14292 - HOIST
      ?auto_14293 - SURFACE
      ?auto_14295 - PLACE
      ?auto_14304 - HOIST
      ?auto_14294 - SURFACE
      ?auto_14299 - SURFACE
      ?auto_14301 - PLACE
      ?auto_14291 - HOIST
      ?auto_14296 - SURFACE
      ?auto_14298 - PLACE
      ?auto_14300 - HOIST
      ?auto_14302 - SURFACE
      ?auto_14303 - PLACE
      ?auto_14306 - HOIST
      ?auto_14297 - SURFACE
      ?auto_14288 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14289 ?auto_14287 ) ( IS-CRATE ?auto_14284 ) ( not ( = ?auto_14286 ?auto_14287 ) ) ( HOIST-AT ?auto_14285 ?auto_14286 ) ( SURFACE-AT ?auto_14284 ?auto_14286 ) ( ON ?auto_14284 ?auto_14290 ) ( CLEAR ?auto_14284 ) ( not ( = ?auto_14283 ?auto_14284 ) ) ( not ( = ?auto_14283 ?auto_14290 ) ) ( not ( = ?auto_14284 ?auto_14290 ) ) ( not ( = ?auto_14289 ?auto_14285 ) ) ( IS-CRATE ?auto_14283 ) ( not ( = ?auto_14305 ?auto_14287 ) ) ( HOIST-AT ?auto_14292 ?auto_14305 ) ( AVAILABLE ?auto_14292 ) ( SURFACE-AT ?auto_14283 ?auto_14305 ) ( ON ?auto_14283 ?auto_14293 ) ( CLEAR ?auto_14283 ) ( not ( = ?auto_14282 ?auto_14283 ) ) ( not ( = ?auto_14282 ?auto_14293 ) ) ( not ( = ?auto_14283 ?auto_14293 ) ) ( not ( = ?auto_14289 ?auto_14292 ) ) ( IS-CRATE ?auto_14282 ) ( not ( = ?auto_14295 ?auto_14287 ) ) ( HOIST-AT ?auto_14304 ?auto_14295 ) ( AVAILABLE ?auto_14304 ) ( SURFACE-AT ?auto_14282 ?auto_14295 ) ( ON ?auto_14282 ?auto_14294 ) ( CLEAR ?auto_14282 ) ( not ( = ?auto_14281 ?auto_14282 ) ) ( not ( = ?auto_14281 ?auto_14294 ) ) ( not ( = ?auto_14282 ?auto_14294 ) ) ( not ( = ?auto_14289 ?auto_14304 ) ) ( IS-CRATE ?auto_14281 ) ( AVAILABLE ?auto_14285 ) ( SURFACE-AT ?auto_14281 ?auto_14286 ) ( ON ?auto_14281 ?auto_14299 ) ( CLEAR ?auto_14281 ) ( not ( = ?auto_14280 ?auto_14281 ) ) ( not ( = ?auto_14280 ?auto_14299 ) ) ( not ( = ?auto_14281 ?auto_14299 ) ) ( IS-CRATE ?auto_14280 ) ( not ( = ?auto_14301 ?auto_14287 ) ) ( HOIST-AT ?auto_14291 ?auto_14301 ) ( AVAILABLE ?auto_14291 ) ( SURFACE-AT ?auto_14280 ?auto_14301 ) ( ON ?auto_14280 ?auto_14296 ) ( CLEAR ?auto_14280 ) ( not ( = ?auto_14279 ?auto_14280 ) ) ( not ( = ?auto_14279 ?auto_14296 ) ) ( not ( = ?auto_14280 ?auto_14296 ) ) ( not ( = ?auto_14289 ?auto_14291 ) ) ( IS-CRATE ?auto_14279 ) ( not ( = ?auto_14298 ?auto_14287 ) ) ( HOIST-AT ?auto_14300 ?auto_14298 ) ( AVAILABLE ?auto_14300 ) ( SURFACE-AT ?auto_14279 ?auto_14298 ) ( ON ?auto_14279 ?auto_14302 ) ( CLEAR ?auto_14279 ) ( not ( = ?auto_14278 ?auto_14279 ) ) ( not ( = ?auto_14278 ?auto_14302 ) ) ( not ( = ?auto_14279 ?auto_14302 ) ) ( not ( = ?auto_14289 ?auto_14300 ) ) ( SURFACE-AT ?auto_14277 ?auto_14287 ) ( CLEAR ?auto_14277 ) ( IS-CRATE ?auto_14278 ) ( AVAILABLE ?auto_14289 ) ( not ( = ?auto_14303 ?auto_14287 ) ) ( HOIST-AT ?auto_14306 ?auto_14303 ) ( AVAILABLE ?auto_14306 ) ( SURFACE-AT ?auto_14278 ?auto_14303 ) ( ON ?auto_14278 ?auto_14297 ) ( CLEAR ?auto_14278 ) ( TRUCK-AT ?auto_14288 ?auto_14287 ) ( not ( = ?auto_14277 ?auto_14278 ) ) ( not ( = ?auto_14277 ?auto_14297 ) ) ( not ( = ?auto_14278 ?auto_14297 ) ) ( not ( = ?auto_14289 ?auto_14306 ) ) ( not ( = ?auto_14277 ?auto_14279 ) ) ( not ( = ?auto_14277 ?auto_14302 ) ) ( not ( = ?auto_14279 ?auto_14297 ) ) ( not ( = ?auto_14298 ?auto_14303 ) ) ( not ( = ?auto_14300 ?auto_14306 ) ) ( not ( = ?auto_14302 ?auto_14297 ) ) ( not ( = ?auto_14277 ?auto_14280 ) ) ( not ( = ?auto_14277 ?auto_14296 ) ) ( not ( = ?auto_14278 ?auto_14280 ) ) ( not ( = ?auto_14278 ?auto_14296 ) ) ( not ( = ?auto_14280 ?auto_14302 ) ) ( not ( = ?auto_14280 ?auto_14297 ) ) ( not ( = ?auto_14301 ?auto_14298 ) ) ( not ( = ?auto_14301 ?auto_14303 ) ) ( not ( = ?auto_14291 ?auto_14300 ) ) ( not ( = ?auto_14291 ?auto_14306 ) ) ( not ( = ?auto_14296 ?auto_14302 ) ) ( not ( = ?auto_14296 ?auto_14297 ) ) ( not ( = ?auto_14277 ?auto_14281 ) ) ( not ( = ?auto_14277 ?auto_14299 ) ) ( not ( = ?auto_14278 ?auto_14281 ) ) ( not ( = ?auto_14278 ?auto_14299 ) ) ( not ( = ?auto_14279 ?auto_14281 ) ) ( not ( = ?auto_14279 ?auto_14299 ) ) ( not ( = ?auto_14281 ?auto_14296 ) ) ( not ( = ?auto_14281 ?auto_14302 ) ) ( not ( = ?auto_14281 ?auto_14297 ) ) ( not ( = ?auto_14286 ?auto_14301 ) ) ( not ( = ?auto_14286 ?auto_14298 ) ) ( not ( = ?auto_14286 ?auto_14303 ) ) ( not ( = ?auto_14285 ?auto_14291 ) ) ( not ( = ?auto_14285 ?auto_14300 ) ) ( not ( = ?auto_14285 ?auto_14306 ) ) ( not ( = ?auto_14299 ?auto_14296 ) ) ( not ( = ?auto_14299 ?auto_14302 ) ) ( not ( = ?auto_14299 ?auto_14297 ) ) ( not ( = ?auto_14277 ?auto_14282 ) ) ( not ( = ?auto_14277 ?auto_14294 ) ) ( not ( = ?auto_14278 ?auto_14282 ) ) ( not ( = ?auto_14278 ?auto_14294 ) ) ( not ( = ?auto_14279 ?auto_14282 ) ) ( not ( = ?auto_14279 ?auto_14294 ) ) ( not ( = ?auto_14280 ?auto_14282 ) ) ( not ( = ?auto_14280 ?auto_14294 ) ) ( not ( = ?auto_14282 ?auto_14299 ) ) ( not ( = ?auto_14282 ?auto_14296 ) ) ( not ( = ?auto_14282 ?auto_14302 ) ) ( not ( = ?auto_14282 ?auto_14297 ) ) ( not ( = ?auto_14295 ?auto_14286 ) ) ( not ( = ?auto_14295 ?auto_14301 ) ) ( not ( = ?auto_14295 ?auto_14298 ) ) ( not ( = ?auto_14295 ?auto_14303 ) ) ( not ( = ?auto_14304 ?auto_14285 ) ) ( not ( = ?auto_14304 ?auto_14291 ) ) ( not ( = ?auto_14304 ?auto_14300 ) ) ( not ( = ?auto_14304 ?auto_14306 ) ) ( not ( = ?auto_14294 ?auto_14299 ) ) ( not ( = ?auto_14294 ?auto_14296 ) ) ( not ( = ?auto_14294 ?auto_14302 ) ) ( not ( = ?auto_14294 ?auto_14297 ) ) ( not ( = ?auto_14277 ?auto_14283 ) ) ( not ( = ?auto_14277 ?auto_14293 ) ) ( not ( = ?auto_14278 ?auto_14283 ) ) ( not ( = ?auto_14278 ?auto_14293 ) ) ( not ( = ?auto_14279 ?auto_14283 ) ) ( not ( = ?auto_14279 ?auto_14293 ) ) ( not ( = ?auto_14280 ?auto_14283 ) ) ( not ( = ?auto_14280 ?auto_14293 ) ) ( not ( = ?auto_14281 ?auto_14283 ) ) ( not ( = ?auto_14281 ?auto_14293 ) ) ( not ( = ?auto_14283 ?auto_14294 ) ) ( not ( = ?auto_14283 ?auto_14299 ) ) ( not ( = ?auto_14283 ?auto_14296 ) ) ( not ( = ?auto_14283 ?auto_14302 ) ) ( not ( = ?auto_14283 ?auto_14297 ) ) ( not ( = ?auto_14305 ?auto_14295 ) ) ( not ( = ?auto_14305 ?auto_14286 ) ) ( not ( = ?auto_14305 ?auto_14301 ) ) ( not ( = ?auto_14305 ?auto_14298 ) ) ( not ( = ?auto_14305 ?auto_14303 ) ) ( not ( = ?auto_14292 ?auto_14304 ) ) ( not ( = ?auto_14292 ?auto_14285 ) ) ( not ( = ?auto_14292 ?auto_14291 ) ) ( not ( = ?auto_14292 ?auto_14300 ) ) ( not ( = ?auto_14292 ?auto_14306 ) ) ( not ( = ?auto_14293 ?auto_14294 ) ) ( not ( = ?auto_14293 ?auto_14299 ) ) ( not ( = ?auto_14293 ?auto_14296 ) ) ( not ( = ?auto_14293 ?auto_14302 ) ) ( not ( = ?auto_14293 ?auto_14297 ) ) ( not ( = ?auto_14277 ?auto_14284 ) ) ( not ( = ?auto_14277 ?auto_14290 ) ) ( not ( = ?auto_14278 ?auto_14284 ) ) ( not ( = ?auto_14278 ?auto_14290 ) ) ( not ( = ?auto_14279 ?auto_14284 ) ) ( not ( = ?auto_14279 ?auto_14290 ) ) ( not ( = ?auto_14280 ?auto_14284 ) ) ( not ( = ?auto_14280 ?auto_14290 ) ) ( not ( = ?auto_14281 ?auto_14284 ) ) ( not ( = ?auto_14281 ?auto_14290 ) ) ( not ( = ?auto_14282 ?auto_14284 ) ) ( not ( = ?auto_14282 ?auto_14290 ) ) ( not ( = ?auto_14284 ?auto_14293 ) ) ( not ( = ?auto_14284 ?auto_14294 ) ) ( not ( = ?auto_14284 ?auto_14299 ) ) ( not ( = ?auto_14284 ?auto_14296 ) ) ( not ( = ?auto_14284 ?auto_14302 ) ) ( not ( = ?auto_14284 ?auto_14297 ) ) ( not ( = ?auto_14290 ?auto_14293 ) ) ( not ( = ?auto_14290 ?auto_14294 ) ) ( not ( = ?auto_14290 ?auto_14299 ) ) ( not ( = ?auto_14290 ?auto_14296 ) ) ( not ( = ?auto_14290 ?auto_14302 ) ) ( not ( = ?auto_14290 ?auto_14297 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_14277 ?auto_14278 ?auto_14279 ?auto_14280 ?auto_14281 ?auto_14282 ?auto_14283 )
      ( MAKE-1CRATE ?auto_14283 ?auto_14284 )
      ( MAKE-7CRATE-VERIFY ?auto_14277 ?auto_14278 ?auto_14279 ?auto_14280 ?auto_14281 ?auto_14282 ?auto_14283 ?auto_14284 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_14326 - SURFACE
      ?auto_14327 - SURFACE
      ?auto_14328 - SURFACE
      ?auto_14329 - SURFACE
      ?auto_14330 - SURFACE
      ?auto_14331 - SURFACE
      ?auto_14332 - SURFACE
      ?auto_14333 - SURFACE
      ?auto_14334 - SURFACE
    )
    :vars
    (
      ?auto_14340 - HOIST
      ?auto_14338 - PLACE
      ?auto_14335 - PLACE
      ?auto_14337 - HOIST
      ?auto_14339 - SURFACE
      ?auto_14347 - PLACE
      ?auto_14356 - HOIST
      ?auto_14343 - SURFACE
      ?auto_14359 - PLACE
      ?auto_14342 - HOIST
      ?auto_14358 - SURFACE
      ?auto_14346 - PLACE
      ?auto_14354 - HOIST
      ?auto_14341 - SURFACE
      ?auto_14349 - SURFACE
      ?auto_14350 - PLACE
      ?auto_14357 - HOIST
      ?auto_14345 - SURFACE
      ?auto_14355 - PLACE
      ?auto_14351 - HOIST
      ?auto_14352 - SURFACE
      ?auto_14353 - PLACE
      ?auto_14348 - HOIST
      ?auto_14344 - SURFACE
      ?auto_14336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14340 ?auto_14338 ) ( IS-CRATE ?auto_14334 ) ( not ( = ?auto_14335 ?auto_14338 ) ) ( HOIST-AT ?auto_14337 ?auto_14335 ) ( AVAILABLE ?auto_14337 ) ( SURFACE-AT ?auto_14334 ?auto_14335 ) ( ON ?auto_14334 ?auto_14339 ) ( CLEAR ?auto_14334 ) ( not ( = ?auto_14333 ?auto_14334 ) ) ( not ( = ?auto_14333 ?auto_14339 ) ) ( not ( = ?auto_14334 ?auto_14339 ) ) ( not ( = ?auto_14340 ?auto_14337 ) ) ( IS-CRATE ?auto_14333 ) ( not ( = ?auto_14347 ?auto_14338 ) ) ( HOIST-AT ?auto_14356 ?auto_14347 ) ( SURFACE-AT ?auto_14333 ?auto_14347 ) ( ON ?auto_14333 ?auto_14343 ) ( CLEAR ?auto_14333 ) ( not ( = ?auto_14332 ?auto_14333 ) ) ( not ( = ?auto_14332 ?auto_14343 ) ) ( not ( = ?auto_14333 ?auto_14343 ) ) ( not ( = ?auto_14340 ?auto_14356 ) ) ( IS-CRATE ?auto_14332 ) ( not ( = ?auto_14359 ?auto_14338 ) ) ( HOIST-AT ?auto_14342 ?auto_14359 ) ( AVAILABLE ?auto_14342 ) ( SURFACE-AT ?auto_14332 ?auto_14359 ) ( ON ?auto_14332 ?auto_14358 ) ( CLEAR ?auto_14332 ) ( not ( = ?auto_14331 ?auto_14332 ) ) ( not ( = ?auto_14331 ?auto_14358 ) ) ( not ( = ?auto_14332 ?auto_14358 ) ) ( not ( = ?auto_14340 ?auto_14342 ) ) ( IS-CRATE ?auto_14331 ) ( not ( = ?auto_14346 ?auto_14338 ) ) ( HOIST-AT ?auto_14354 ?auto_14346 ) ( AVAILABLE ?auto_14354 ) ( SURFACE-AT ?auto_14331 ?auto_14346 ) ( ON ?auto_14331 ?auto_14341 ) ( CLEAR ?auto_14331 ) ( not ( = ?auto_14330 ?auto_14331 ) ) ( not ( = ?auto_14330 ?auto_14341 ) ) ( not ( = ?auto_14331 ?auto_14341 ) ) ( not ( = ?auto_14340 ?auto_14354 ) ) ( IS-CRATE ?auto_14330 ) ( AVAILABLE ?auto_14356 ) ( SURFACE-AT ?auto_14330 ?auto_14347 ) ( ON ?auto_14330 ?auto_14349 ) ( CLEAR ?auto_14330 ) ( not ( = ?auto_14329 ?auto_14330 ) ) ( not ( = ?auto_14329 ?auto_14349 ) ) ( not ( = ?auto_14330 ?auto_14349 ) ) ( IS-CRATE ?auto_14329 ) ( not ( = ?auto_14350 ?auto_14338 ) ) ( HOIST-AT ?auto_14357 ?auto_14350 ) ( AVAILABLE ?auto_14357 ) ( SURFACE-AT ?auto_14329 ?auto_14350 ) ( ON ?auto_14329 ?auto_14345 ) ( CLEAR ?auto_14329 ) ( not ( = ?auto_14328 ?auto_14329 ) ) ( not ( = ?auto_14328 ?auto_14345 ) ) ( not ( = ?auto_14329 ?auto_14345 ) ) ( not ( = ?auto_14340 ?auto_14357 ) ) ( IS-CRATE ?auto_14328 ) ( not ( = ?auto_14355 ?auto_14338 ) ) ( HOIST-AT ?auto_14351 ?auto_14355 ) ( AVAILABLE ?auto_14351 ) ( SURFACE-AT ?auto_14328 ?auto_14355 ) ( ON ?auto_14328 ?auto_14352 ) ( CLEAR ?auto_14328 ) ( not ( = ?auto_14327 ?auto_14328 ) ) ( not ( = ?auto_14327 ?auto_14352 ) ) ( not ( = ?auto_14328 ?auto_14352 ) ) ( not ( = ?auto_14340 ?auto_14351 ) ) ( SURFACE-AT ?auto_14326 ?auto_14338 ) ( CLEAR ?auto_14326 ) ( IS-CRATE ?auto_14327 ) ( AVAILABLE ?auto_14340 ) ( not ( = ?auto_14353 ?auto_14338 ) ) ( HOIST-AT ?auto_14348 ?auto_14353 ) ( AVAILABLE ?auto_14348 ) ( SURFACE-AT ?auto_14327 ?auto_14353 ) ( ON ?auto_14327 ?auto_14344 ) ( CLEAR ?auto_14327 ) ( TRUCK-AT ?auto_14336 ?auto_14338 ) ( not ( = ?auto_14326 ?auto_14327 ) ) ( not ( = ?auto_14326 ?auto_14344 ) ) ( not ( = ?auto_14327 ?auto_14344 ) ) ( not ( = ?auto_14340 ?auto_14348 ) ) ( not ( = ?auto_14326 ?auto_14328 ) ) ( not ( = ?auto_14326 ?auto_14352 ) ) ( not ( = ?auto_14328 ?auto_14344 ) ) ( not ( = ?auto_14355 ?auto_14353 ) ) ( not ( = ?auto_14351 ?auto_14348 ) ) ( not ( = ?auto_14352 ?auto_14344 ) ) ( not ( = ?auto_14326 ?auto_14329 ) ) ( not ( = ?auto_14326 ?auto_14345 ) ) ( not ( = ?auto_14327 ?auto_14329 ) ) ( not ( = ?auto_14327 ?auto_14345 ) ) ( not ( = ?auto_14329 ?auto_14352 ) ) ( not ( = ?auto_14329 ?auto_14344 ) ) ( not ( = ?auto_14350 ?auto_14355 ) ) ( not ( = ?auto_14350 ?auto_14353 ) ) ( not ( = ?auto_14357 ?auto_14351 ) ) ( not ( = ?auto_14357 ?auto_14348 ) ) ( not ( = ?auto_14345 ?auto_14352 ) ) ( not ( = ?auto_14345 ?auto_14344 ) ) ( not ( = ?auto_14326 ?auto_14330 ) ) ( not ( = ?auto_14326 ?auto_14349 ) ) ( not ( = ?auto_14327 ?auto_14330 ) ) ( not ( = ?auto_14327 ?auto_14349 ) ) ( not ( = ?auto_14328 ?auto_14330 ) ) ( not ( = ?auto_14328 ?auto_14349 ) ) ( not ( = ?auto_14330 ?auto_14345 ) ) ( not ( = ?auto_14330 ?auto_14352 ) ) ( not ( = ?auto_14330 ?auto_14344 ) ) ( not ( = ?auto_14347 ?auto_14350 ) ) ( not ( = ?auto_14347 ?auto_14355 ) ) ( not ( = ?auto_14347 ?auto_14353 ) ) ( not ( = ?auto_14356 ?auto_14357 ) ) ( not ( = ?auto_14356 ?auto_14351 ) ) ( not ( = ?auto_14356 ?auto_14348 ) ) ( not ( = ?auto_14349 ?auto_14345 ) ) ( not ( = ?auto_14349 ?auto_14352 ) ) ( not ( = ?auto_14349 ?auto_14344 ) ) ( not ( = ?auto_14326 ?auto_14331 ) ) ( not ( = ?auto_14326 ?auto_14341 ) ) ( not ( = ?auto_14327 ?auto_14331 ) ) ( not ( = ?auto_14327 ?auto_14341 ) ) ( not ( = ?auto_14328 ?auto_14331 ) ) ( not ( = ?auto_14328 ?auto_14341 ) ) ( not ( = ?auto_14329 ?auto_14331 ) ) ( not ( = ?auto_14329 ?auto_14341 ) ) ( not ( = ?auto_14331 ?auto_14349 ) ) ( not ( = ?auto_14331 ?auto_14345 ) ) ( not ( = ?auto_14331 ?auto_14352 ) ) ( not ( = ?auto_14331 ?auto_14344 ) ) ( not ( = ?auto_14346 ?auto_14347 ) ) ( not ( = ?auto_14346 ?auto_14350 ) ) ( not ( = ?auto_14346 ?auto_14355 ) ) ( not ( = ?auto_14346 ?auto_14353 ) ) ( not ( = ?auto_14354 ?auto_14356 ) ) ( not ( = ?auto_14354 ?auto_14357 ) ) ( not ( = ?auto_14354 ?auto_14351 ) ) ( not ( = ?auto_14354 ?auto_14348 ) ) ( not ( = ?auto_14341 ?auto_14349 ) ) ( not ( = ?auto_14341 ?auto_14345 ) ) ( not ( = ?auto_14341 ?auto_14352 ) ) ( not ( = ?auto_14341 ?auto_14344 ) ) ( not ( = ?auto_14326 ?auto_14332 ) ) ( not ( = ?auto_14326 ?auto_14358 ) ) ( not ( = ?auto_14327 ?auto_14332 ) ) ( not ( = ?auto_14327 ?auto_14358 ) ) ( not ( = ?auto_14328 ?auto_14332 ) ) ( not ( = ?auto_14328 ?auto_14358 ) ) ( not ( = ?auto_14329 ?auto_14332 ) ) ( not ( = ?auto_14329 ?auto_14358 ) ) ( not ( = ?auto_14330 ?auto_14332 ) ) ( not ( = ?auto_14330 ?auto_14358 ) ) ( not ( = ?auto_14332 ?auto_14341 ) ) ( not ( = ?auto_14332 ?auto_14349 ) ) ( not ( = ?auto_14332 ?auto_14345 ) ) ( not ( = ?auto_14332 ?auto_14352 ) ) ( not ( = ?auto_14332 ?auto_14344 ) ) ( not ( = ?auto_14359 ?auto_14346 ) ) ( not ( = ?auto_14359 ?auto_14347 ) ) ( not ( = ?auto_14359 ?auto_14350 ) ) ( not ( = ?auto_14359 ?auto_14355 ) ) ( not ( = ?auto_14359 ?auto_14353 ) ) ( not ( = ?auto_14342 ?auto_14354 ) ) ( not ( = ?auto_14342 ?auto_14356 ) ) ( not ( = ?auto_14342 ?auto_14357 ) ) ( not ( = ?auto_14342 ?auto_14351 ) ) ( not ( = ?auto_14342 ?auto_14348 ) ) ( not ( = ?auto_14358 ?auto_14341 ) ) ( not ( = ?auto_14358 ?auto_14349 ) ) ( not ( = ?auto_14358 ?auto_14345 ) ) ( not ( = ?auto_14358 ?auto_14352 ) ) ( not ( = ?auto_14358 ?auto_14344 ) ) ( not ( = ?auto_14326 ?auto_14333 ) ) ( not ( = ?auto_14326 ?auto_14343 ) ) ( not ( = ?auto_14327 ?auto_14333 ) ) ( not ( = ?auto_14327 ?auto_14343 ) ) ( not ( = ?auto_14328 ?auto_14333 ) ) ( not ( = ?auto_14328 ?auto_14343 ) ) ( not ( = ?auto_14329 ?auto_14333 ) ) ( not ( = ?auto_14329 ?auto_14343 ) ) ( not ( = ?auto_14330 ?auto_14333 ) ) ( not ( = ?auto_14330 ?auto_14343 ) ) ( not ( = ?auto_14331 ?auto_14333 ) ) ( not ( = ?auto_14331 ?auto_14343 ) ) ( not ( = ?auto_14333 ?auto_14358 ) ) ( not ( = ?auto_14333 ?auto_14341 ) ) ( not ( = ?auto_14333 ?auto_14349 ) ) ( not ( = ?auto_14333 ?auto_14345 ) ) ( not ( = ?auto_14333 ?auto_14352 ) ) ( not ( = ?auto_14333 ?auto_14344 ) ) ( not ( = ?auto_14343 ?auto_14358 ) ) ( not ( = ?auto_14343 ?auto_14341 ) ) ( not ( = ?auto_14343 ?auto_14349 ) ) ( not ( = ?auto_14343 ?auto_14345 ) ) ( not ( = ?auto_14343 ?auto_14352 ) ) ( not ( = ?auto_14343 ?auto_14344 ) ) ( not ( = ?auto_14326 ?auto_14334 ) ) ( not ( = ?auto_14326 ?auto_14339 ) ) ( not ( = ?auto_14327 ?auto_14334 ) ) ( not ( = ?auto_14327 ?auto_14339 ) ) ( not ( = ?auto_14328 ?auto_14334 ) ) ( not ( = ?auto_14328 ?auto_14339 ) ) ( not ( = ?auto_14329 ?auto_14334 ) ) ( not ( = ?auto_14329 ?auto_14339 ) ) ( not ( = ?auto_14330 ?auto_14334 ) ) ( not ( = ?auto_14330 ?auto_14339 ) ) ( not ( = ?auto_14331 ?auto_14334 ) ) ( not ( = ?auto_14331 ?auto_14339 ) ) ( not ( = ?auto_14332 ?auto_14334 ) ) ( not ( = ?auto_14332 ?auto_14339 ) ) ( not ( = ?auto_14334 ?auto_14343 ) ) ( not ( = ?auto_14334 ?auto_14358 ) ) ( not ( = ?auto_14334 ?auto_14341 ) ) ( not ( = ?auto_14334 ?auto_14349 ) ) ( not ( = ?auto_14334 ?auto_14345 ) ) ( not ( = ?auto_14334 ?auto_14352 ) ) ( not ( = ?auto_14334 ?auto_14344 ) ) ( not ( = ?auto_14335 ?auto_14347 ) ) ( not ( = ?auto_14335 ?auto_14359 ) ) ( not ( = ?auto_14335 ?auto_14346 ) ) ( not ( = ?auto_14335 ?auto_14350 ) ) ( not ( = ?auto_14335 ?auto_14355 ) ) ( not ( = ?auto_14335 ?auto_14353 ) ) ( not ( = ?auto_14337 ?auto_14356 ) ) ( not ( = ?auto_14337 ?auto_14342 ) ) ( not ( = ?auto_14337 ?auto_14354 ) ) ( not ( = ?auto_14337 ?auto_14357 ) ) ( not ( = ?auto_14337 ?auto_14351 ) ) ( not ( = ?auto_14337 ?auto_14348 ) ) ( not ( = ?auto_14339 ?auto_14343 ) ) ( not ( = ?auto_14339 ?auto_14358 ) ) ( not ( = ?auto_14339 ?auto_14341 ) ) ( not ( = ?auto_14339 ?auto_14349 ) ) ( not ( = ?auto_14339 ?auto_14345 ) ) ( not ( = ?auto_14339 ?auto_14352 ) ) ( not ( = ?auto_14339 ?auto_14344 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_14326 ?auto_14327 ?auto_14328 ?auto_14329 ?auto_14330 ?auto_14331 ?auto_14332 ?auto_14333 )
      ( MAKE-1CRATE ?auto_14333 ?auto_14334 )
      ( MAKE-8CRATE-VERIFY ?auto_14326 ?auto_14327 ?auto_14328 ?auto_14329 ?auto_14330 ?auto_14331 ?auto_14332 ?auto_14333 ?auto_14334 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_14380 - SURFACE
      ?auto_14381 - SURFACE
      ?auto_14382 - SURFACE
      ?auto_14383 - SURFACE
      ?auto_14384 - SURFACE
      ?auto_14385 - SURFACE
      ?auto_14386 - SURFACE
      ?auto_14387 - SURFACE
      ?auto_14388 - SURFACE
      ?auto_14389 - SURFACE
    )
    :vars
    (
      ?auto_14393 - HOIST
      ?auto_14394 - PLACE
      ?auto_14390 - PLACE
      ?auto_14392 - HOIST
      ?auto_14391 - SURFACE
      ?auto_14417 - PLACE
      ?auto_14408 - HOIST
      ?auto_14402 - SURFACE
      ?auto_14397 - PLACE
      ?auto_14413 - HOIST
      ?auto_14407 - SURFACE
      ?auto_14415 - PLACE
      ?auto_14411 - HOIST
      ?auto_14399 - SURFACE
      ?auto_14401 - PLACE
      ?auto_14404 - HOIST
      ?auto_14406 - SURFACE
      ?auto_14416 - SURFACE
      ?auto_14414 - PLACE
      ?auto_14412 - HOIST
      ?auto_14396 - SURFACE
      ?auto_14398 - PLACE
      ?auto_14410 - HOIST
      ?auto_14409 - SURFACE
      ?auto_14403 - PLACE
      ?auto_14405 - HOIST
      ?auto_14400 - SURFACE
      ?auto_14395 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14393 ?auto_14394 ) ( IS-CRATE ?auto_14389 ) ( not ( = ?auto_14390 ?auto_14394 ) ) ( HOIST-AT ?auto_14392 ?auto_14390 ) ( AVAILABLE ?auto_14392 ) ( SURFACE-AT ?auto_14389 ?auto_14390 ) ( ON ?auto_14389 ?auto_14391 ) ( CLEAR ?auto_14389 ) ( not ( = ?auto_14388 ?auto_14389 ) ) ( not ( = ?auto_14388 ?auto_14391 ) ) ( not ( = ?auto_14389 ?auto_14391 ) ) ( not ( = ?auto_14393 ?auto_14392 ) ) ( IS-CRATE ?auto_14388 ) ( not ( = ?auto_14417 ?auto_14394 ) ) ( HOIST-AT ?auto_14408 ?auto_14417 ) ( AVAILABLE ?auto_14408 ) ( SURFACE-AT ?auto_14388 ?auto_14417 ) ( ON ?auto_14388 ?auto_14402 ) ( CLEAR ?auto_14388 ) ( not ( = ?auto_14387 ?auto_14388 ) ) ( not ( = ?auto_14387 ?auto_14402 ) ) ( not ( = ?auto_14388 ?auto_14402 ) ) ( not ( = ?auto_14393 ?auto_14408 ) ) ( IS-CRATE ?auto_14387 ) ( not ( = ?auto_14397 ?auto_14394 ) ) ( HOIST-AT ?auto_14413 ?auto_14397 ) ( SURFACE-AT ?auto_14387 ?auto_14397 ) ( ON ?auto_14387 ?auto_14407 ) ( CLEAR ?auto_14387 ) ( not ( = ?auto_14386 ?auto_14387 ) ) ( not ( = ?auto_14386 ?auto_14407 ) ) ( not ( = ?auto_14387 ?auto_14407 ) ) ( not ( = ?auto_14393 ?auto_14413 ) ) ( IS-CRATE ?auto_14386 ) ( not ( = ?auto_14415 ?auto_14394 ) ) ( HOIST-AT ?auto_14411 ?auto_14415 ) ( AVAILABLE ?auto_14411 ) ( SURFACE-AT ?auto_14386 ?auto_14415 ) ( ON ?auto_14386 ?auto_14399 ) ( CLEAR ?auto_14386 ) ( not ( = ?auto_14385 ?auto_14386 ) ) ( not ( = ?auto_14385 ?auto_14399 ) ) ( not ( = ?auto_14386 ?auto_14399 ) ) ( not ( = ?auto_14393 ?auto_14411 ) ) ( IS-CRATE ?auto_14385 ) ( not ( = ?auto_14401 ?auto_14394 ) ) ( HOIST-AT ?auto_14404 ?auto_14401 ) ( AVAILABLE ?auto_14404 ) ( SURFACE-AT ?auto_14385 ?auto_14401 ) ( ON ?auto_14385 ?auto_14406 ) ( CLEAR ?auto_14385 ) ( not ( = ?auto_14384 ?auto_14385 ) ) ( not ( = ?auto_14384 ?auto_14406 ) ) ( not ( = ?auto_14385 ?auto_14406 ) ) ( not ( = ?auto_14393 ?auto_14404 ) ) ( IS-CRATE ?auto_14384 ) ( AVAILABLE ?auto_14413 ) ( SURFACE-AT ?auto_14384 ?auto_14397 ) ( ON ?auto_14384 ?auto_14416 ) ( CLEAR ?auto_14384 ) ( not ( = ?auto_14383 ?auto_14384 ) ) ( not ( = ?auto_14383 ?auto_14416 ) ) ( not ( = ?auto_14384 ?auto_14416 ) ) ( IS-CRATE ?auto_14383 ) ( not ( = ?auto_14414 ?auto_14394 ) ) ( HOIST-AT ?auto_14412 ?auto_14414 ) ( AVAILABLE ?auto_14412 ) ( SURFACE-AT ?auto_14383 ?auto_14414 ) ( ON ?auto_14383 ?auto_14396 ) ( CLEAR ?auto_14383 ) ( not ( = ?auto_14382 ?auto_14383 ) ) ( not ( = ?auto_14382 ?auto_14396 ) ) ( not ( = ?auto_14383 ?auto_14396 ) ) ( not ( = ?auto_14393 ?auto_14412 ) ) ( IS-CRATE ?auto_14382 ) ( not ( = ?auto_14398 ?auto_14394 ) ) ( HOIST-AT ?auto_14410 ?auto_14398 ) ( AVAILABLE ?auto_14410 ) ( SURFACE-AT ?auto_14382 ?auto_14398 ) ( ON ?auto_14382 ?auto_14409 ) ( CLEAR ?auto_14382 ) ( not ( = ?auto_14381 ?auto_14382 ) ) ( not ( = ?auto_14381 ?auto_14409 ) ) ( not ( = ?auto_14382 ?auto_14409 ) ) ( not ( = ?auto_14393 ?auto_14410 ) ) ( SURFACE-AT ?auto_14380 ?auto_14394 ) ( CLEAR ?auto_14380 ) ( IS-CRATE ?auto_14381 ) ( AVAILABLE ?auto_14393 ) ( not ( = ?auto_14403 ?auto_14394 ) ) ( HOIST-AT ?auto_14405 ?auto_14403 ) ( AVAILABLE ?auto_14405 ) ( SURFACE-AT ?auto_14381 ?auto_14403 ) ( ON ?auto_14381 ?auto_14400 ) ( CLEAR ?auto_14381 ) ( TRUCK-AT ?auto_14395 ?auto_14394 ) ( not ( = ?auto_14380 ?auto_14381 ) ) ( not ( = ?auto_14380 ?auto_14400 ) ) ( not ( = ?auto_14381 ?auto_14400 ) ) ( not ( = ?auto_14393 ?auto_14405 ) ) ( not ( = ?auto_14380 ?auto_14382 ) ) ( not ( = ?auto_14380 ?auto_14409 ) ) ( not ( = ?auto_14382 ?auto_14400 ) ) ( not ( = ?auto_14398 ?auto_14403 ) ) ( not ( = ?auto_14410 ?auto_14405 ) ) ( not ( = ?auto_14409 ?auto_14400 ) ) ( not ( = ?auto_14380 ?auto_14383 ) ) ( not ( = ?auto_14380 ?auto_14396 ) ) ( not ( = ?auto_14381 ?auto_14383 ) ) ( not ( = ?auto_14381 ?auto_14396 ) ) ( not ( = ?auto_14383 ?auto_14409 ) ) ( not ( = ?auto_14383 ?auto_14400 ) ) ( not ( = ?auto_14414 ?auto_14398 ) ) ( not ( = ?auto_14414 ?auto_14403 ) ) ( not ( = ?auto_14412 ?auto_14410 ) ) ( not ( = ?auto_14412 ?auto_14405 ) ) ( not ( = ?auto_14396 ?auto_14409 ) ) ( not ( = ?auto_14396 ?auto_14400 ) ) ( not ( = ?auto_14380 ?auto_14384 ) ) ( not ( = ?auto_14380 ?auto_14416 ) ) ( not ( = ?auto_14381 ?auto_14384 ) ) ( not ( = ?auto_14381 ?auto_14416 ) ) ( not ( = ?auto_14382 ?auto_14384 ) ) ( not ( = ?auto_14382 ?auto_14416 ) ) ( not ( = ?auto_14384 ?auto_14396 ) ) ( not ( = ?auto_14384 ?auto_14409 ) ) ( not ( = ?auto_14384 ?auto_14400 ) ) ( not ( = ?auto_14397 ?auto_14414 ) ) ( not ( = ?auto_14397 ?auto_14398 ) ) ( not ( = ?auto_14397 ?auto_14403 ) ) ( not ( = ?auto_14413 ?auto_14412 ) ) ( not ( = ?auto_14413 ?auto_14410 ) ) ( not ( = ?auto_14413 ?auto_14405 ) ) ( not ( = ?auto_14416 ?auto_14396 ) ) ( not ( = ?auto_14416 ?auto_14409 ) ) ( not ( = ?auto_14416 ?auto_14400 ) ) ( not ( = ?auto_14380 ?auto_14385 ) ) ( not ( = ?auto_14380 ?auto_14406 ) ) ( not ( = ?auto_14381 ?auto_14385 ) ) ( not ( = ?auto_14381 ?auto_14406 ) ) ( not ( = ?auto_14382 ?auto_14385 ) ) ( not ( = ?auto_14382 ?auto_14406 ) ) ( not ( = ?auto_14383 ?auto_14385 ) ) ( not ( = ?auto_14383 ?auto_14406 ) ) ( not ( = ?auto_14385 ?auto_14416 ) ) ( not ( = ?auto_14385 ?auto_14396 ) ) ( not ( = ?auto_14385 ?auto_14409 ) ) ( not ( = ?auto_14385 ?auto_14400 ) ) ( not ( = ?auto_14401 ?auto_14397 ) ) ( not ( = ?auto_14401 ?auto_14414 ) ) ( not ( = ?auto_14401 ?auto_14398 ) ) ( not ( = ?auto_14401 ?auto_14403 ) ) ( not ( = ?auto_14404 ?auto_14413 ) ) ( not ( = ?auto_14404 ?auto_14412 ) ) ( not ( = ?auto_14404 ?auto_14410 ) ) ( not ( = ?auto_14404 ?auto_14405 ) ) ( not ( = ?auto_14406 ?auto_14416 ) ) ( not ( = ?auto_14406 ?auto_14396 ) ) ( not ( = ?auto_14406 ?auto_14409 ) ) ( not ( = ?auto_14406 ?auto_14400 ) ) ( not ( = ?auto_14380 ?auto_14386 ) ) ( not ( = ?auto_14380 ?auto_14399 ) ) ( not ( = ?auto_14381 ?auto_14386 ) ) ( not ( = ?auto_14381 ?auto_14399 ) ) ( not ( = ?auto_14382 ?auto_14386 ) ) ( not ( = ?auto_14382 ?auto_14399 ) ) ( not ( = ?auto_14383 ?auto_14386 ) ) ( not ( = ?auto_14383 ?auto_14399 ) ) ( not ( = ?auto_14384 ?auto_14386 ) ) ( not ( = ?auto_14384 ?auto_14399 ) ) ( not ( = ?auto_14386 ?auto_14406 ) ) ( not ( = ?auto_14386 ?auto_14416 ) ) ( not ( = ?auto_14386 ?auto_14396 ) ) ( not ( = ?auto_14386 ?auto_14409 ) ) ( not ( = ?auto_14386 ?auto_14400 ) ) ( not ( = ?auto_14415 ?auto_14401 ) ) ( not ( = ?auto_14415 ?auto_14397 ) ) ( not ( = ?auto_14415 ?auto_14414 ) ) ( not ( = ?auto_14415 ?auto_14398 ) ) ( not ( = ?auto_14415 ?auto_14403 ) ) ( not ( = ?auto_14411 ?auto_14404 ) ) ( not ( = ?auto_14411 ?auto_14413 ) ) ( not ( = ?auto_14411 ?auto_14412 ) ) ( not ( = ?auto_14411 ?auto_14410 ) ) ( not ( = ?auto_14411 ?auto_14405 ) ) ( not ( = ?auto_14399 ?auto_14406 ) ) ( not ( = ?auto_14399 ?auto_14416 ) ) ( not ( = ?auto_14399 ?auto_14396 ) ) ( not ( = ?auto_14399 ?auto_14409 ) ) ( not ( = ?auto_14399 ?auto_14400 ) ) ( not ( = ?auto_14380 ?auto_14387 ) ) ( not ( = ?auto_14380 ?auto_14407 ) ) ( not ( = ?auto_14381 ?auto_14387 ) ) ( not ( = ?auto_14381 ?auto_14407 ) ) ( not ( = ?auto_14382 ?auto_14387 ) ) ( not ( = ?auto_14382 ?auto_14407 ) ) ( not ( = ?auto_14383 ?auto_14387 ) ) ( not ( = ?auto_14383 ?auto_14407 ) ) ( not ( = ?auto_14384 ?auto_14387 ) ) ( not ( = ?auto_14384 ?auto_14407 ) ) ( not ( = ?auto_14385 ?auto_14387 ) ) ( not ( = ?auto_14385 ?auto_14407 ) ) ( not ( = ?auto_14387 ?auto_14399 ) ) ( not ( = ?auto_14387 ?auto_14406 ) ) ( not ( = ?auto_14387 ?auto_14416 ) ) ( not ( = ?auto_14387 ?auto_14396 ) ) ( not ( = ?auto_14387 ?auto_14409 ) ) ( not ( = ?auto_14387 ?auto_14400 ) ) ( not ( = ?auto_14407 ?auto_14399 ) ) ( not ( = ?auto_14407 ?auto_14406 ) ) ( not ( = ?auto_14407 ?auto_14416 ) ) ( not ( = ?auto_14407 ?auto_14396 ) ) ( not ( = ?auto_14407 ?auto_14409 ) ) ( not ( = ?auto_14407 ?auto_14400 ) ) ( not ( = ?auto_14380 ?auto_14388 ) ) ( not ( = ?auto_14380 ?auto_14402 ) ) ( not ( = ?auto_14381 ?auto_14388 ) ) ( not ( = ?auto_14381 ?auto_14402 ) ) ( not ( = ?auto_14382 ?auto_14388 ) ) ( not ( = ?auto_14382 ?auto_14402 ) ) ( not ( = ?auto_14383 ?auto_14388 ) ) ( not ( = ?auto_14383 ?auto_14402 ) ) ( not ( = ?auto_14384 ?auto_14388 ) ) ( not ( = ?auto_14384 ?auto_14402 ) ) ( not ( = ?auto_14385 ?auto_14388 ) ) ( not ( = ?auto_14385 ?auto_14402 ) ) ( not ( = ?auto_14386 ?auto_14388 ) ) ( not ( = ?auto_14386 ?auto_14402 ) ) ( not ( = ?auto_14388 ?auto_14407 ) ) ( not ( = ?auto_14388 ?auto_14399 ) ) ( not ( = ?auto_14388 ?auto_14406 ) ) ( not ( = ?auto_14388 ?auto_14416 ) ) ( not ( = ?auto_14388 ?auto_14396 ) ) ( not ( = ?auto_14388 ?auto_14409 ) ) ( not ( = ?auto_14388 ?auto_14400 ) ) ( not ( = ?auto_14417 ?auto_14397 ) ) ( not ( = ?auto_14417 ?auto_14415 ) ) ( not ( = ?auto_14417 ?auto_14401 ) ) ( not ( = ?auto_14417 ?auto_14414 ) ) ( not ( = ?auto_14417 ?auto_14398 ) ) ( not ( = ?auto_14417 ?auto_14403 ) ) ( not ( = ?auto_14408 ?auto_14413 ) ) ( not ( = ?auto_14408 ?auto_14411 ) ) ( not ( = ?auto_14408 ?auto_14404 ) ) ( not ( = ?auto_14408 ?auto_14412 ) ) ( not ( = ?auto_14408 ?auto_14410 ) ) ( not ( = ?auto_14408 ?auto_14405 ) ) ( not ( = ?auto_14402 ?auto_14407 ) ) ( not ( = ?auto_14402 ?auto_14399 ) ) ( not ( = ?auto_14402 ?auto_14406 ) ) ( not ( = ?auto_14402 ?auto_14416 ) ) ( not ( = ?auto_14402 ?auto_14396 ) ) ( not ( = ?auto_14402 ?auto_14409 ) ) ( not ( = ?auto_14402 ?auto_14400 ) ) ( not ( = ?auto_14380 ?auto_14389 ) ) ( not ( = ?auto_14380 ?auto_14391 ) ) ( not ( = ?auto_14381 ?auto_14389 ) ) ( not ( = ?auto_14381 ?auto_14391 ) ) ( not ( = ?auto_14382 ?auto_14389 ) ) ( not ( = ?auto_14382 ?auto_14391 ) ) ( not ( = ?auto_14383 ?auto_14389 ) ) ( not ( = ?auto_14383 ?auto_14391 ) ) ( not ( = ?auto_14384 ?auto_14389 ) ) ( not ( = ?auto_14384 ?auto_14391 ) ) ( not ( = ?auto_14385 ?auto_14389 ) ) ( not ( = ?auto_14385 ?auto_14391 ) ) ( not ( = ?auto_14386 ?auto_14389 ) ) ( not ( = ?auto_14386 ?auto_14391 ) ) ( not ( = ?auto_14387 ?auto_14389 ) ) ( not ( = ?auto_14387 ?auto_14391 ) ) ( not ( = ?auto_14389 ?auto_14402 ) ) ( not ( = ?auto_14389 ?auto_14407 ) ) ( not ( = ?auto_14389 ?auto_14399 ) ) ( not ( = ?auto_14389 ?auto_14406 ) ) ( not ( = ?auto_14389 ?auto_14416 ) ) ( not ( = ?auto_14389 ?auto_14396 ) ) ( not ( = ?auto_14389 ?auto_14409 ) ) ( not ( = ?auto_14389 ?auto_14400 ) ) ( not ( = ?auto_14390 ?auto_14417 ) ) ( not ( = ?auto_14390 ?auto_14397 ) ) ( not ( = ?auto_14390 ?auto_14415 ) ) ( not ( = ?auto_14390 ?auto_14401 ) ) ( not ( = ?auto_14390 ?auto_14414 ) ) ( not ( = ?auto_14390 ?auto_14398 ) ) ( not ( = ?auto_14390 ?auto_14403 ) ) ( not ( = ?auto_14392 ?auto_14408 ) ) ( not ( = ?auto_14392 ?auto_14413 ) ) ( not ( = ?auto_14392 ?auto_14411 ) ) ( not ( = ?auto_14392 ?auto_14404 ) ) ( not ( = ?auto_14392 ?auto_14412 ) ) ( not ( = ?auto_14392 ?auto_14410 ) ) ( not ( = ?auto_14392 ?auto_14405 ) ) ( not ( = ?auto_14391 ?auto_14402 ) ) ( not ( = ?auto_14391 ?auto_14407 ) ) ( not ( = ?auto_14391 ?auto_14399 ) ) ( not ( = ?auto_14391 ?auto_14406 ) ) ( not ( = ?auto_14391 ?auto_14416 ) ) ( not ( = ?auto_14391 ?auto_14396 ) ) ( not ( = ?auto_14391 ?auto_14409 ) ) ( not ( = ?auto_14391 ?auto_14400 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_14380 ?auto_14381 ?auto_14382 ?auto_14383 ?auto_14384 ?auto_14385 ?auto_14386 ?auto_14387 ?auto_14388 )
      ( MAKE-1CRATE ?auto_14388 ?auto_14389 )
      ( MAKE-9CRATE-VERIFY ?auto_14380 ?auto_14381 ?auto_14382 ?auto_14383 ?auto_14384 ?auto_14385 ?auto_14386 ?auto_14387 ?auto_14388 ?auto_14389 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_14439 - SURFACE
      ?auto_14440 - SURFACE
      ?auto_14441 - SURFACE
      ?auto_14442 - SURFACE
      ?auto_14443 - SURFACE
      ?auto_14444 - SURFACE
      ?auto_14445 - SURFACE
      ?auto_14446 - SURFACE
      ?auto_14447 - SURFACE
      ?auto_14448 - SURFACE
      ?auto_14449 - SURFACE
    )
    :vars
    (
      ?auto_14453 - HOIST
      ?auto_14451 - PLACE
      ?auto_14450 - PLACE
      ?auto_14454 - HOIST
      ?auto_14452 - SURFACE
      ?auto_14468 - PLACE
      ?auto_14470 - HOIST
      ?auto_14477 - SURFACE
      ?auto_14467 - PLACE
      ?auto_14462 - HOIST
      ?auto_14458 - SURFACE
      ?auto_14475 - PLACE
      ?auto_14461 - HOIST
      ?auto_14472 - SURFACE
      ?auto_14480 - PLACE
      ?auto_14478 - HOIST
      ?auto_14469 - SURFACE
      ?auto_14459 - PLACE
      ?auto_14471 - HOIST
      ?auto_14463 - SURFACE
      ?auto_14479 - SURFACE
      ?auto_14465 - PLACE
      ?auto_14474 - HOIST
      ?auto_14476 - SURFACE
      ?auto_14464 - PLACE
      ?auto_14466 - HOIST
      ?auto_14456 - SURFACE
      ?auto_14457 - PLACE
      ?auto_14473 - HOIST
      ?auto_14460 - SURFACE
      ?auto_14455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14453 ?auto_14451 ) ( IS-CRATE ?auto_14449 ) ( not ( = ?auto_14450 ?auto_14451 ) ) ( HOIST-AT ?auto_14454 ?auto_14450 ) ( AVAILABLE ?auto_14454 ) ( SURFACE-AT ?auto_14449 ?auto_14450 ) ( ON ?auto_14449 ?auto_14452 ) ( CLEAR ?auto_14449 ) ( not ( = ?auto_14448 ?auto_14449 ) ) ( not ( = ?auto_14448 ?auto_14452 ) ) ( not ( = ?auto_14449 ?auto_14452 ) ) ( not ( = ?auto_14453 ?auto_14454 ) ) ( IS-CRATE ?auto_14448 ) ( not ( = ?auto_14468 ?auto_14451 ) ) ( HOIST-AT ?auto_14470 ?auto_14468 ) ( AVAILABLE ?auto_14470 ) ( SURFACE-AT ?auto_14448 ?auto_14468 ) ( ON ?auto_14448 ?auto_14477 ) ( CLEAR ?auto_14448 ) ( not ( = ?auto_14447 ?auto_14448 ) ) ( not ( = ?auto_14447 ?auto_14477 ) ) ( not ( = ?auto_14448 ?auto_14477 ) ) ( not ( = ?auto_14453 ?auto_14470 ) ) ( IS-CRATE ?auto_14447 ) ( not ( = ?auto_14467 ?auto_14451 ) ) ( HOIST-AT ?auto_14462 ?auto_14467 ) ( AVAILABLE ?auto_14462 ) ( SURFACE-AT ?auto_14447 ?auto_14467 ) ( ON ?auto_14447 ?auto_14458 ) ( CLEAR ?auto_14447 ) ( not ( = ?auto_14446 ?auto_14447 ) ) ( not ( = ?auto_14446 ?auto_14458 ) ) ( not ( = ?auto_14447 ?auto_14458 ) ) ( not ( = ?auto_14453 ?auto_14462 ) ) ( IS-CRATE ?auto_14446 ) ( not ( = ?auto_14475 ?auto_14451 ) ) ( HOIST-AT ?auto_14461 ?auto_14475 ) ( SURFACE-AT ?auto_14446 ?auto_14475 ) ( ON ?auto_14446 ?auto_14472 ) ( CLEAR ?auto_14446 ) ( not ( = ?auto_14445 ?auto_14446 ) ) ( not ( = ?auto_14445 ?auto_14472 ) ) ( not ( = ?auto_14446 ?auto_14472 ) ) ( not ( = ?auto_14453 ?auto_14461 ) ) ( IS-CRATE ?auto_14445 ) ( not ( = ?auto_14480 ?auto_14451 ) ) ( HOIST-AT ?auto_14478 ?auto_14480 ) ( AVAILABLE ?auto_14478 ) ( SURFACE-AT ?auto_14445 ?auto_14480 ) ( ON ?auto_14445 ?auto_14469 ) ( CLEAR ?auto_14445 ) ( not ( = ?auto_14444 ?auto_14445 ) ) ( not ( = ?auto_14444 ?auto_14469 ) ) ( not ( = ?auto_14445 ?auto_14469 ) ) ( not ( = ?auto_14453 ?auto_14478 ) ) ( IS-CRATE ?auto_14444 ) ( not ( = ?auto_14459 ?auto_14451 ) ) ( HOIST-AT ?auto_14471 ?auto_14459 ) ( AVAILABLE ?auto_14471 ) ( SURFACE-AT ?auto_14444 ?auto_14459 ) ( ON ?auto_14444 ?auto_14463 ) ( CLEAR ?auto_14444 ) ( not ( = ?auto_14443 ?auto_14444 ) ) ( not ( = ?auto_14443 ?auto_14463 ) ) ( not ( = ?auto_14444 ?auto_14463 ) ) ( not ( = ?auto_14453 ?auto_14471 ) ) ( IS-CRATE ?auto_14443 ) ( AVAILABLE ?auto_14461 ) ( SURFACE-AT ?auto_14443 ?auto_14475 ) ( ON ?auto_14443 ?auto_14479 ) ( CLEAR ?auto_14443 ) ( not ( = ?auto_14442 ?auto_14443 ) ) ( not ( = ?auto_14442 ?auto_14479 ) ) ( not ( = ?auto_14443 ?auto_14479 ) ) ( IS-CRATE ?auto_14442 ) ( not ( = ?auto_14465 ?auto_14451 ) ) ( HOIST-AT ?auto_14474 ?auto_14465 ) ( AVAILABLE ?auto_14474 ) ( SURFACE-AT ?auto_14442 ?auto_14465 ) ( ON ?auto_14442 ?auto_14476 ) ( CLEAR ?auto_14442 ) ( not ( = ?auto_14441 ?auto_14442 ) ) ( not ( = ?auto_14441 ?auto_14476 ) ) ( not ( = ?auto_14442 ?auto_14476 ) ) ( not ( = ?auto_14453 ?auto_14474 ) ) ( IS-CRATE ?auto_14441 ) ( not ( = ?auto_14464 ?auto_14451 ) ) ( HOIST-AT ?auto_14466 ?auto_14464 ) ( AVAILABLE ?auto_14466 ) ( SURFACE-AT ?auto_14441 ?auto_14464 ) ( ON ?auto_14441 ?auto_14456 ) ( CLEAR ?auto_14441 ) ( not ( = ?auto_14440 ?auto_14441 ) ) ( not ( = ?auto_14440 ?auto_14456 ) ) ( not ( = ?auto_14441 ?auto_14456 ) ) ( not ( = ?auto_14453 ?auto_14466 ) ) ( SURFACE-AT ?auto_14439 ?auto_14451 ) ( CLEAR ?auto_14439 ) ( IS-CRATE ?auto_14440 ) ( AVAILABLE ?auto_14453 ) ( not ( = ?auto_14457 ?auto_14451 ) ) ( HOIST-AT ?auto_14473 ?auto_14457 ) ( AVAILABLE ?auto_14473 ) ( SURFACE-AT ?auto_14440 ?auto_14457 ) ( ON ?auto_14440 ?auto_14460 ) ( CLEAR ?auto_14440 ) ( TRUCK-AT ?auto_14455 ?auto_14451 ) ( not ( = ?auto_14439 ?auto_14440 ) ) ( not ( = ?auto_14439 ?auto_14460 ) ) ( not ( = ?auto_14440 ?auto_14460 ) ) ( not ( = ?auto_14453 ?auto_14473 ) ) ( not ( = ?auto_14439 ?auto_14441 ) ) ( not ( = ?auto_14439 ?auto_14456 ) ) ( not ( = ?auto_14441 ?auto_14460 ) ) ( not ( = ?auto_14464 ?auto_14457 ) ) ( not ( = ?auto_14466 ?auto_14473 ) ) ( not ( = ?auto_14456 ?auto_14460 ) ) ( not ( = ?auto_14439 ?auto_14442 ) ) ( not ( = ?auto_14439 ?auto_14476 ) ) ( not ( = ?auto_14440 ?auto_14442 ) ) ( not ( = ?auto_14440 ?auto_14476 ) ) ( not ( = ?auto_14442 ?auto_14456 ) ) ( not ( = ?auto_14442 ?auto_14460 ) ) ( not ( = ?auto_14465 ?auto_14464 ) ) ( not ( = ?auto_14465 ?auto_14457 ) ) ( not ( = ?auto_14474 ?auto_14466 ) ) ( not ( = ?auto_14474 ?auto_14473 ) ) ( not ( = ?auto_14476 ?auto_14456 ) ) ( not ( = ?auto_14476 ?auto_14460 ) ) ( not ( = ?auto_14439 ?auto_14443 ) ) ( not ( = ?auto_14439 ?auto_14479 ) ) ( not ( = ?auto_14440 ?auto_14443 ) ) ( not ( = ?auto_14440 ?auto_14479 ) ) ( not ( = ?auto_14441 ?auto_14443 ) ) ( not ( = ?auto_14441 ?auto_14479 ) ) ( not ( = ?auto_14443 ?auto_14476 ) ) ( not ( = ?auto_14443 ?auto_14456 ) ) ( not ( = ?auto_14443 ?auto_14460 ) ) ( not ( = ?auto_14475 ?auto_14465 ) ) ( not ( = ?auto_14475 ?auto_14464 ) ) ( not ( = ?auto_14475 ?auto_14457 ) ) ( not ( = ?auto_14461 ?auto_14474 ) ) ( not ( = ?auto_14461 ?auto_14466 ) ) ( not ( = ?auto_14461 ?auto_14473 ) ) ( not ( = ?auto_14479 ?auto_14476 ) ) ( not ( = ?auto_14479 ?auto_14456 ) ) ( not ( = ?auto_14479 ?auto_14460 ) ) ( not ( = ?auto_14439 ?auto_14444 ) ) ( not ( = ?auto_14439 ?auto_14463 ) ) ( not ( = ?auto_14440 ?auto_14444 ) ) ( not ( = ?auto_14440 ?auto_14463 ) ) ( not ( = ?auto_14441 ?auto_14444 ) ) ( not ( = ?auto_14441 ?auto_14463 ) ) ( not ( = ?auto_14442 ?auto_14444 ) ) ( not ( = ?auto_14442 ?auto_14463 ) ) ( not ( = ?auto_14444 ?auto_14479 ) ) ( not ( = ?auto_14444 ?auto_14476 ) ) ( not ( = ?auto_14444 ?auto_14456 ) ) ( not ( = ?auto_14444 ?auto_14460 ) ) ( not ( = ?auto_14459 ?auto_14475 ) ) ( not ( = ?auto_14459 ?auto_14465 ) ) ( not ( = ?auto_14459 ?auto_14464 ) ) ( not ( = ?auto_14459 ?auto_14457 ) ) ( not ( = ?auto_14471 ?auto_14461 ) ) ( not ( = ?auto_14471 ?auto_14474 ) ) ( not ( = ?auto_14471 ?auto_14466 ) ) ( not ( = ?auto_14471 ?auto_14473 ) ) ( not ( = ?auto_14463 ?auto_14479 ) ) ( not ( = ?auto_14463 ?auto_14476 ) ) ( not ( = ?auto_14463 ?auto_14456 ) ) ( not ( = ?auto_14463 ?auto_14460 ) ) ( not ( = ?auto_14439 ?auto_14445 ) ) ( not ( = ?auto_14439 ?auto_14469 ) ) ( not ( = ?auto_14440 ?auto_14445 ) ) ( not ( = ?auto_14440 ?auto_14469 ) ) ( not ( = ?auto_14441 ?auto_14445 ) ) ( not ( = ?auto_14441 ?auto_14469 ) ) ( not ( = ?auto_14442 ?auto_14445 ) ) ( not ( = ?auto_14442 ?auto_14469 ) ) ( not ( = ?auto_14443 ?auto_14445 ) ) ( not ( = ?auto_14443 ?auto_14469 ) ) ( not ( = ?auto_14445 ?auto_14463 ) ) ( not ( = ?auto_14445 ?auto_14479 ) ) ( not ( = ?auto_14445 ?auto_14476 ) ) ( not ( = ?auto_14445 ?auto_14456 ) ) ( not ( = ?auto_14445 ?auto_14460 ) ) ( not ( = ?auto_14480 ?auto_14459 ) ) ( not ( = ?auto_14480 ?auto_14475 ) ) ( not ( = ?auto_14480 ?auto_14465 ) ) ( not ( = ?auto_14480 ?auto_14464 ) ) ( not ( = ?auto_14480 ?auto_14457 ) ) ( not ( = ?auto_14478 ?auto_14471 ) ) ( not ( = ?auto_14478 ?auto_14461 ) ) ( not ( = ?auto_14478 ?auto_14474 ) ) ( not ( = ?auto_14478 ?auto_14466 ) ) ( not ( = ?auto_14478 ?auto_14473 ) ) ( not ( = ?auto_14469 ?auto_14463 ) ) ( not ( = ?auto_14469 ?auto_14479 ) ) ( not ( = ?auto_14469 ?auto_14476 ) ) ( not ( = ?auto_14469 ?auto_14456 ) ) ( not ( = ?auto_14469 ?auto_14460 ) ) ( not ( = ?auto_14439 ?auto_14446 ) ) ( not ( = ?auto_14439 ?auto_14472 ) ) ( not ( = ?auto_14440 ?auto_14446 ) ) ( not ( = ?auto_14440 ?auto_14472 ) ) ( not ( = ?auto_14441 ?auto_14446 ) ) ( not ( = ?auto_14441 ?auto_14472 ) ) ( not ( = ?auto_14442 ?auto_14446 ) ) ( not ( = ?auto_14442 ?auto_14472 ) ) ( not ( = ?auto_14443 ?auto_14446 ) ) ( not ( = ?auto_14443 ?auto_14472 ) ) ( not ( = ?auto_14444 ?auto_14446 ) ) ( not ( = ?auto_14444 ?auto_14472 ) ) ( not ( = ?auto_14446 ?auto_14469 ) ) ( not ( = ?auto_14446 ?auto_14463 ) ) ( not ( = ?auto_14446 ?auto_14479 ) ) ( not ( = ?auto_14446 ?auto_14476 ) ) ( not ( = ?auto_14446 ?auto_14456 ) ) ( not ( = ?auto_14446 ?auto_14460 ) ) ( not ( = ?auto_14472 ?auto_14469 ) ) ( not ( = ?auto_14472 ?auto_14463 ) ) ( not ( = ?auto_14472 ?auto_14479 ) ) ( not ( = ?auto_14472 ?auto_14476 ) ) ( not ( = ?auto_14472 ?auto_14456 ) ) ( not ( = ?auto_14472 ?auto_14460 ) ) ( not ( = ?auto_14439 ?auto_14447 ) ) ( not ( = ?auto_14439 ?auto_14458 ) ) ( not ( = ?auto_14440 ?auto_14447 ) ) ( not ( = ?auto_14440 ?auto_14458 ) ) ( not ( = ?auto_14441 ?auto_14447 ) ) ( not ( = ?auto_14441 ?auto_14458 ) ) ( not ( = ?auto_14442 ?auto_14447 ) ) ( not ( = ?auto_14442 ?auto_14458 ) ) ( not ( = ?auto_14443 ?auto_14447 ) ) ( not ( = ?auto_14443 ?auto_14458 ) ) ( not ( = ?auto_14444 ?auto_14447 ) ) ( not ( = ?auto_14444 ?auto_14458 ) ) ( not ( = ?auto_14445 ?auto_14447 ) ) ( not ( = ?auto_14445 ?auto_14458 ) ) ( not ( = ?auto_14447 ?auto_14472 ) ) ( not ( = ?auto_14447 ?auto_14469 ) ) ( not ( = ?auto_14447 ?auto_14463 ) ) ( not ( = ?auto_14447 ?auto_14479 ) ) ( not ( = ?auto_14447 ?auto_14476 ) ) ( not ( = ?auto_14447 ?auto_14456 ) ) ( not ( = ?auto_14447 ?auto_14460 ) ) ( not ( = ?auto_14467 ?auto_14475 ) ) ( not ( = ?auto_14467 ?auto_14480 ) ) ( not ( = ?auto_14467 ?auto_14459 ) ) ( not ( = ?auto_14467 ?auto_14465 ) ) ( not ( = ?auto_14467 ?auto_14464 ) ) ( not ( = ?auto_14467 ?auto_14457 ) ) ( not ( = ?auto_14462 ?auto_14461 ) ) ( not ( = ?auto_14462 ?auto_14478 ) ) ( not ( = ?auto_14462 ?auto_14471 ) ) ( not ( = ?auto_14462 ?auto_14474 ) ) ( not ( = ?auto_14462 ?auto_14466 ) ) ( not ( = ?auto_14462 ?auto_14473 ) ) ( not ( = ?auto_14458 ?auto_14472 ) ) ( not ( = ?auto_14458 ?auto_14469 ) ) ( not ( = ?auto_14458 ?auto_14463 ) ) ( not ( = ?auto_14458 ?auto_14479 ) ) ( not ( = ?auto_14458 ?auto_14476 ) ) ( not ( = ?auto_14458 ?auto_14456 ) ) ( not ( = ?auto_14458 ?auto_14460 ) ) ( not ( = ?auto_14439 ?auto_14448 ) ) ( not ( = ?auto_14439 ?auto_14477 ) ) ( not ( = ?auto_14440 ?auto_14448 ) ) ( not ( = ?auto_14440 ?auto_14477 ) ) ( not ( = ?auto_14441 ?auto_14448 ) ) ( not ( = ?auto_14441 ?auto_14477 ) ) ( not ( = ?auto_14442 ?auto_14448 ) ) ( not ( = ?auto_14442 ?auto_14477 ) ) ( not ( = ?auto_14443 ?auto_14448 ) ) ( not ( = ?auto_14443 ?auto_14477 ) ) ( not ( = ?auto_14444 ?auto_14448 ) ) ( not ( = ?auto_14444 ?auto_14477 ) ) ( not ( = ?auto_14445 ?auto_14448 ) ) ( not ( = ?auto_14445 ?auto_14477 ) ) ( not ( = ?auto_14446 ?auto_14448 ) ) ( not ( = ?auto_14446 ?auto_14477 ) ) ( not ( = ?auto_14448 ?auto_14458 ) ) ( not ( = ?auto_14448 ?auto_14472 ) ) ( not ( = ?auto_14448 ?auto_14469 ) ) ( not ( = ?auto_14448 ?auto_14463 ) ) ( not ( = ?auto_14448 ?auto_14479 ) ) ( not ( = ?auto_14448 ?auto_14476 ) ) ( not ( = ?auto_14448 ?auto_14456 ) ) ( not ( = ?auto_14448 ?auto_14460 ) ) ( not ( = ?auto_14468 ?auto_14467 ) ) ( not ( = ?auto_14468 ?auto_14475 ) ) ( not ( = ?auto_14468 ?auto_14480 ) ) ( not ( = ?auto_14468 ?auto_14459 ) ) ( not ( = ?auto_14468 ?auto_14465 ) ) ( not ( = ?auto_14468 ?auto_14464 ) ) ( not ( = ?auto_14468 ?auto_14457 ) ) ( not ( = ?auto_14470 ?auto_14462 ) ) ( not ( = ?auto_14470 ?auto_14461 ) ) ( not ( = ?auto_14470 ?auto_14478 ) ) ( not ( = ?auto_14470 ?auto_14471 ) ) ( not ( = ?auto_14470 ?auto_14474 ) ) ( not ( = ?auto_14470 ?auto_14466 ) ) ( not ( = ?auto_14470 ?auto_14473 ) ) ( not ( = ?auto_14477 ?auto_14458 ) ) ( not ( = ?auto_14477 ?auto_14472 ) ) ( not ( = ?auto_14477 ?auto_14469 ) ) ( not ( = ?auto_14477 ?auto_14463 ) ) ( not ( = ?auto_14477 ?auto_14479 ) ) ( not ( = ?auto_14477 ?auto_14476 ) ) ( not ( = ?auto_14477 ?auto_14456 ) ) ( not ( = ?auto_14477 ?auto_14460 ) ) ( not ( = ?auto_14439 ?auto_14449 ) ) ( not ( = ?auto_14439 ?auto_14452 ) ) ( not ( = ?auto_14440 ?auto_14449 ) ) ( not ( = ?auto_14440 ?auto_14452 ) ) ( not ( = ?auto_14441 ?auto_14449 ) ) ( not ( = ?auto_14441 ?auto_14452 ) ) ( not ( = ?auto_14442 ?auto_14449 ) ) ( not ( = ?auto_14442 ?auto_14452 ) ) ( not ( = ?auto_14443 ?auto_14449 ) ) ( not ( = ?auto_14443 ?auto_14452 ) ) ( not ( = ?auto_14444 ?auto_14449 ) ) ( not ( = ?auto_14444 ?auto_14452 ) ) ( not ( = ?auto_14445 ?auto_14449 ) ) ( not ( = ?auto_14445 ?auto_14452 ) ) ( not ( = ?auto_14446 ?auto_14449 ) ) ( not ( = ?auto_14446 ?auto_14452 ) ) ( not ( = ?auto_14447 ?auto_14449 ) ) ( not ( = ?auto_14447 ?auto_14452 ) ) ( not ( = ?auto_14449 ?auto_14477 ) ) ( not ( = ?auto_14449 ?auto_14458 ) ) ( not ( = ?auto_14449 ?auto_14472 ) ) ( not ( = ?auto_14449 ?auto_14469 ) ) ( not ( = ?auto_14449 ?auto_14463 ) ) ( not ( = ?auto_14449 ?auto_14479 ) ) ( not ( = ?auto_14449 ?auto_14476 ) ) ( not ( = ?auto_14449 ?auto_14456 ) ) ( not ( = ?auto_14449 ?auto_14460 ) ) ( not ( = ?auto_14450 ?auto_14468 ) ) ( not ( = ?auto_14450 ?auto_14467 ) ) ( not ( = ?auto_14450 ?auto_14475 ) ) ( not ( = ?auto_14450 ?auto_14480 ) ) ( not ( = ?auto_14450 ?auto_14459 ) ) ( not ( = ?auto_14450 ?auto_14465 ) ) ( not ( = ?auto_14450 ?auto_14464 ) ) ( not ( = ?auto_14450 ?auto_14457 ) ) ( not ( = ?auto_14454 ?auto_14470 ) ) ( not ( = ?auto_14454 ?auto_14462 ) ) ( not ( = ?auto_14454 ?auto_14461 ) ) ( not ( = ?auto_14454 ?auto_14478 ) ) ( not ( = ?auto_14454 ?auto_14471 ) ) ( not ( = ?auto_14454 ?auto_14474 ) ) ( not ( = ?auto_14454 ?auto_14466 ) ) ( not ( = ?auto_14454 ?auto_14473 ) ) ( not ( = ?auto_14452 ?auto_14477 ) ) ( not ( = ?auto_14452 ?auto_14458 ) ) ( not ( = ?auto_14452 ?auto_14472 ) ) ( not ( = ?auto_14452 ?auto_14469 ) ) ( not ( = ?auto_14452 ?auto_14463 ) ) ( not ( = ?auto_14452 ?auto_14479 ) ) ( not ( = ?auto_14452 ?auto_14476 ) ) ( not ( = ?auto_14452 ?auto_14456 ) ) ( not ( = ?auto_14452 ?auto_14460 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_14439 ?auto_14440 ?auto_14441 ?auto_14442 ?auto_14443 ?auto_14444 ?auto_14445 ?auto_14446 ?auto_14447 ?auto_14448 )
      ( MAKE-1CRATE ?auto_14448 ?auto_14449 )
      ( MAKE-10CRATE-VERIFY ?auto_14439 ?auto_14440 ?auto_14441 ?auto_14442 ?auto_14443 ?auto_14444 ?auto_14445 ?auto_14446 ?auto_14447 ?auto_14448 ?auto_14449 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_14503 - SURFACE
      ?auto_14504 - SURFACE
      ?auto_14505 - SURFACE
      ?auto_14506 - SURFACE
      ?auto_14507 - SURFACE
      ?auto_14508 - SURFACE
      ?auto_14509 - SURFACE
      ?auto_14510 - SURFACE
      ?auto_14511 - SURFACE
      ?auto_14512 - SURFACE
      ?auto_14513 - SURFACE
      ?auto_14514 - SURFACE
    )
    :vars
    (
      ?auto_14515 - HOIST
      ?auto_14516 - PLACE
      ?auto_14519 - PLACE
      ?auto_14518 - HOIST
      ?auto_14517 - SURFACE
      ?auto_14521 - PLACE
      ?auto_14539 - HOIST
      ?auto_14522 - SURFACE
      ?auto_14528 - PLACE
      ?auto_14540 - HOIST
      ?auto_14536 - SURFACE
      ?auto_14545 - SURFACE
      ?auto_14535 - PLACE
      ?auto_14541 - HOIST
      ?auto_14543 - SURFACE
      ?auto_14526 - PLACE
      ?auto_14532 - HOIST
      ?auto_14529 - SURFACE
      ?auto_14542 - PLACE
      ?auto_14530 - HOIST
      ?auto_14533 - SURFACE
      ?auto_14531 - SURFACE
      ?auto_14546 - PLACE
      ?auto_14544 - HOIST
      ?auto_14534 - SURFACE
      ?auto_14537 - PLACE
      ?auto_14527 - HOIST
      ?auto_14525 - SURFACE
      ?auto_14538 - PLACE
      ?auto_14524 - HOIST
      ?auto_14523 - SURFACE
      ?auto_14520 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14515 ?auto_14516 ) ( IS-CRATE ?auto_14514 ) ( not ( = ?auto_14519 ?auto_14516 ) ) ( HOIST-AT ?auto_14518 ?auto_14519 ) ( SURFACE-AT ?auto_14514 ?auto_14519 ) ( ON ?auto_14514 ?auto_14517 ) ( CLEAR ?auto_14514 ) ( not ( = ?auto_14513 ?auto_14514 ) ) ( not ( = ?auto_14513 ?auto_14517 ) ) ( not ( = ?auto_14514 ?auto_14517 ) ) ( not ( = ?auto_14515 ?auto_14518 ) ) ( IS-CRATE ?auto_14513 ) ( not ( = ?auto_14521 ?auto_14516 ) ) ( HOIST-AT ?auto_14539 ?auto_14521 ) ( AVAILABLE ?auto_14539 ) ( SURFACE-AT ?auto_14513 ?auto_14521 ) ( ON ?auto_14513 ?auto_14522 ) ( CLEAR ?auto_14513 ) ( not ( = ?auto_14512 ?auto_14513 ) ) ( not ( = ?auto_14512 ?auto_14522 ) ) ( not ( = ?auto_14513 ?auto_14522 ) ) ( not ( = ?auto_14515 ?auto_14539 ) ) ( IS-CRATE ?auto_14512 ) ( not ( = ?auto_14528 ?auto_14516 ) ) ( HOIST-AT ?auto_14540 ?auto_14528 ) ( AVAILABLE ?auto_14540 ) ( SURFACE-AT ?auto_14512 ?auto_14528 ) ( ON ?auto_14512 ?auto_14536 ) ( CLEAR ?auto_14512 ) ( not ( = ?auto_14511 ?auto_14512 ) ) ( not ( = ?auto_14511 ?auto_14536 ) ) ( not ( = ?auto_14512 ?auto_14536 ) ) ( not ( = ?auto_14515 ?auto_14540 ) ) ( IS-CRATE ?auto_14511 ) ( AVAILABLE ?auto_14518 ) ( SURFACE-AT ?auto_14511 ?auto_14519 ) ( ON ?auto_14511 ?auto_14545 ) ( CLEAR ?auto_14511 ) ( not ( = ?auto_14510 ?auto_14511 ) ) ( not ( = ?auto_14510 ?auto_14545 ) ) ( not ( = ?auto_14511 ?auto_14545 ) ) ( IS-CRATE ?auto_14510 ) ( not ( = ?auto_14535 ?auto_14516 ) ) ( HOIST-AT ?auto_14541 ?auto_14535 ) ( SURFACE-AT ?auto_14510 ?auto_14535 ) ( ON ?auto_14510 ?auto_14543 ) ( CLEAR ?auto_14510 ) ( not ( = ?auto_14509 ?auto_14510 ) ) ( not ( = ?auto_14509 ?auto_14543 ) ) ( not ( = ?auto_14510 ?auto_14543 ) ) ( not ( = ?auto_14515 ?auto_14541 ) ) ( IS-CRATE ?auto_14509 ) ( not ( = ?auto_14526 ?auto_14516 ) ) ( HOIST-AT ?auto_14532 ?auto_14526 ) ( AVAILABLE ?auto_14532 ) ( SURFACE-AT ?auto_14509 ?auto_14526 ) ( ON ?auto_14509 ?auto_14529 ) ( CLEAR ?auto_14509 ) ( not ( = ?auto_14508 ?auto_14509 ) ) ( not ( = ?auto_14508 ?auto_14529 ) ) ( not ( = ?auto_14509 ?auto_14529 ) ) ( not ( = ?auto_14515 ?auto_14532 ) ) ( IS-CRATE ?auto_14508 ) ( not ( = ?auto_14542 ?auto_14516 ) ) ( HOIST-AT ?auto_14530 ?auto_14542 ) ( AVAILABLE ?auto_14530 ) ( SURFACE-AT ?auto_14508 ?auto_14542 ) ( ON ?auto_14508 ?auto_14533 ) ( CLEAR ?auto_14508 ) ( not ( = ?auto_14507 ?auto_14508 ) ) ( not ( = ?auto_14507 ?auto_14533 ) ) ( not ( = ?auto_14508 ?auto_14533 ) ) ( not ( = ?auto_14515 ?auto_14530 ) ) ( IS-CRATE ?auto_14507 ) ( AVAILABLE ?auto_14541 ) ( SURFACE-AT ?auto_14507 ?auto_14535 ) ( ON ?auto_14507 ?auto_14531 ) ( CLEAR ?auto_14507 ) ( not ( = ?auto_14506 ?auto_14507 ) ) ( not ( = ?auto_14506 ?auto_14531 ) ) ( not ( = ?auto_14507 ?auto_14531 ) ) ( IS-CRATE ?auto_14506 ) ( not ( = ?auto_14546 ?auto_14516 ) ) ( HOIST-AT ?auto_14544 ?auto_14546 ) ( AVAILABLE ?auto_14544 ) ( SURFACE-AT ?auto_14506 ?auto_14546 ) ( ON ?auto_14506 ?auto_14534 ) ( CLEAR ?auto_14506 ) ( not ( = ?auto_14505 ?auto_14506 ) ) ( not ( = ?auto_14505 ?auto_14534 ) ) ( not ( = ?auto_14506 ?auto_14534 ) ) ( not ( = ?auto_14515 ?auto_14544 ) ) ( IS-CRATE ?auto_14505 ) ( not ( = ?auto_14537 ?auto_14516 ) ) ( HOIST-AT ?auto_14527 ?auto_14537 ) ( AVAILABLE ?auto_14527 ) ( SURFACE-AT ?auto_14505 ?auto_14537 ) ( ON ?auto_14505 ?auto_14525 ) ( CLEAR ?auto_14505 ) ( not ( = ?auto_14504 ?auto_14505 ) ) ( not ( = ?auto_14504 ?auto_14525 ) ) ( not ( = ?auto_14505 ?auto_14525 ) ) ( not ( = ?auto_14515 ?auto_14527 ) ) ( SURFACE-AT ?auto_14503 ?auto_14516 ) ( CLEAR ?auto_14503 ) ( IS-CRATE ?auto_14504 ) ( AVAILABLE ?auto_14515 ) ( not ( = ?auto_14538 ?auto_14516 ) ) ( HOIST-AT ?auto_14524 ?auto_14538 ) ( AVAILABLE ?auto_14524 ) ( SURFACE-AT ?auto_14504 ?auto_14538 ) ( ON ?auto_14504 ?auto_14523 ) ( CLEAR ?auto_14504 ) ( TRUCK-AT ?auto_14520 ?auto_14516 ) ( not ( = ?auto_14503 ?auto_14504 ) ) ( not ( = ?auto_14503 ?auto_14523 ) ) ( not ( = ?auto_14504 ?auto_14523 ) ) ( not ( = ?auto_14515 ?auto_14524 ) ) ( not ( = ?auto_14503 ?auto_14505 ) ) ( not ( = ?auto_14503 ?auto_14525 ) ) ( not ( = ?auto_14505 ?auto_14523 ) ) ( not ( = ?auto_14537 ?auto_14538 ) ) ( not ( = ?auto_14527 ?auto_14524 ) ) ( not ( = ?auto_14525 ?auto_14523 ) ) ( not ( = ?auto_14503 ?auto_14506 ) ) ( not ( = ?auto_14503 ?auto_14534 ) ) ( not ( = ?auto_14504 ?auto_14506 ) ) ( not ( = ?auto_14504 ?auto_14534 ) ) ( not ( = ?auto_14506 ?auto_14525 ) ) ( not ( = ?auto_14506 ?auto_14523 ) ) ( not ( = ?auto_14546 ?auto_14537 ) ) ( not ( = ?auto_14546 ?auto_14538 ) ) ( not ( = ?auto_14544 ?auto_14527 ) ) ( not ( = ?auto_14544 ?auto_14524 ) ) ( not ( = ?auto_14534 ?auto_14525 ) ) ( not ( = ?auto_14534 ?auto_14523 ) ) ( not ( = ?auto_14503 ?auto_14507 ) ) ( not ( = ?auto_14503 ?auto_14531 ) ) ( not ( = ?auto_14504 ?auto_14507 ) ) ( not ( = ?auto_14504 ?auto_14531 ) ) ( not ( = ?auto_14505 ?auto_14507 ) ) ( not ( = ?auto_14505 ?auto_14531 ) ) ( not ( = ?auto_14507 ?auto_14534 ) ) ( not ( = ?auto_14507 ?auto_14525 ) ) ( not ( = ?auto_14507 ?auto_14523 ) ) ( not ( = ?auto_14535 ?auto_14546 ) ) ( not ( = ?auto_14535 ?auto_14537 ) ) ( not ( = ?auto_14535 ?auto_14538 ) ) ( not ( = ?auto_14541 ?auto_14544 ) ) ( not ( = ?auto_14541 ?auto_14527 ) ) ( not ( = ?auto_14541 ?auto_14524 ) ) ( not ( = ?auto_14531 ?auto_14534 ) ) ( not ( = ?auto_14531 ?auto_14525 ) ) ( not ( = ?auto_14531 ?auto_14523 ) ) ( not ( = ?auto_14503 ?auto_14508 ) ) ( not ( = ?auto_14503 ?auto_14533 ) ) ( not ( = ?auto_14504 ?auto_14508 ) ) ( not ( = ?auto_14504 ?auto_14533 ) ) ( not ( = ?auto_14505 ?auto_14508 ) ) ( not ( = ?auto_14505 ?auto_14533 ) ) ( not ( = ?auto_14506 ?auto_14508 ) ) ( not ( = ?auto_14506 ?auto_14533 ) ) ( not ( = ?auto_14508 ?auto_14531 ) ) ( not ( = ?auto_14508 ?auto_14534 ) ) ( not ( = ?auto_14508 ?auto_14525 ) ) ( not ( = ?auto_14508 ?auto_14523 ) ) ( not ( = ?auto_14542 ?auto_14535 ) ) ( not ( = ?auto_14542 ?auto_14546 ) ) ( not ( = ?auto_14542 ?auto_14537 ) ) ( not ( = ?auto_14542 ?auto_14538 ) ) ( not ( = ?auto_14530 ?auto_14541 ) ) ( not ( = ?auto_14530 ?auto_14544 ) ) ( not ( = ?auto_14530 ?auto_14527 ) ) ( not ( = ?auto_14530 ?auto_14524 ) ) ( not ( = ?auto_14533 ?auto_14531 ) ) ( not ( = ?auto_14533 ?auto_14534 ) ) ( not ( = ?auto_14533 ?auto_14525 ) ) ( not ( = ?auto_14533 ?auto_14523 ) ) ( not ( = ?auto_14503 ?auto_14509 ) ) ( not ( = ?auto_14503 ?auto_14529 ) ) ( not ( = ?auto_14504 ?auto_14509 ) ) ( not ( = ?auto_14504 ?auto_14529 ) ) ( not ( = ?auto_14505 ?auto_14509 ) ) ( not ( = ?auto_14505 ?auto_14529 ) ) ( not ( = ?auto_14506 ?auto_14509 ) ) ( not ( = ?auto_14506 ?auto_14529 ) ) ( not ( = ?auto_14507 ?auto_14509 ) ) ( not ( = ?auto_14507 ?auto_14529 ) ) ( not ( = ?auto_14509 ?auto_14533 ) ) ( not ( = ?auto_14509 ?auto_14531 ) ) ( not ( = ?auto_14509 ?auto_14534 ) ) ( not ( = ?auto_14509 ?auto_14525 ) ) ( not ( = ?auto_14509 ?auto_14523 ) ) ( not ( = ?auto_14526 ?auto_14542 ) ) ( not ( = ?auto_14526 ?auto_14535 ) ) ( not ( = ?auto_14526 ?auto_14546 ) ) ( not ( = ?auto_14526 ?auto_14537 ) ) ( not ( = ?auto_14526 ?auto_14538 ) ) ( not ( = ?auto_14532 ?auto_14530 ) ) ( not ( = ?auto_14532 ?auto_14541 ) ) ( not ( = ?auto_14532 ?auto_14544 ) ) ( not ( = ?auto_14532 ?auto_14527 ) ) ( not ( = ?auto_14532 ?auto_14524 ) ) ( not ( = ?auto_14529 ?auto_14533 ) ) ( not ( = ?auto_14529 ?auto_14531 ) ) ( not ( = ?auto_14529 ?auto_14534 ) ) ( not ( = ?auto_14529 ?auto_14525 ) ) ( not ( = ?auto_14529 ?auto_14523 ) ) ( not ( = ?auto_14503 ?auto_14510 ) ) ( not ( = ?auto_14503 ?auto_14543 ) ) ( not ( = ?auto_14504 ?auto_14510 ) ) ( not ( = ?auto_14504 ?auto_14543 ) ) ( not ( = ?auto_14505 ?auto_14510 ) ) ( not ( = ?auto_14505 ?auto_14543 ) ) ( not ( = ?auto_14506 ?auto_14510 ) ) ( not ( = ?auto_14506 ?auto_14543 ) ) ( not ( = ?auto_14507 ?auto_14510 ) ) ( not ( = ?auto_14507 ?auto_14543 ) ) ( not ( = ?auto_14508 ?auto_14510 ) ) ( not ( = ?auto_14508 ?auto_14543 ) ) ( not ( = ?auto_14510 ?auto_14529 ) ) ( not ( = ?auto_14510 ?auto_14533 ) ) ( not ( = ?auto_14510 ?auto_14531 ) ) ( not ( = ?auto_14510 ?auto_14534 ) ) ( not ( = ?auto_14510 ?auto_14525 ) ) ( not ( = ?auto_14510 ?auto_14523 ) ) ( not ( = ?auto_14543 ?auto_14529 ) ) ( not ( = ?auto_14543 ?auto_14533 ) ) ( not ( = ?auto_14543 ?auto_14531 ) ) ( not ( = ?auto_14543 ?auto_14534 ) ) ( not ( = ?auto_14543 ?auto_14525 ) ) ( not ( = ?auto_14543 ?auto_14523 ) ) ( not ( = ?auto_14503 ?auto_14511 ) ) ( not ( = ?auto_14503 ?auto_14545 ) ) ( not ( = ?auto_14504 ?auto_14511 ) ) ( not ( = ?auto_14504 ?auto_14545 ) ) ( not ( = ?auto_14505 ?auto_14511 ) ) ( not ( = ?auto_14505 ?auto_14545 ) ) ( not ( = ?auto_14506 ?auto_14511 ) ) ( not ( = ?auto_14506 ?auto_14545 ) ) ( not ( = ?auto_14507 ?auto_14511 ) ) ( not ( = ?auto_14507 ?auto_14545 ) ) ( not ( = ?auto_14508 ?auto_14511 ) ) ( not ( = ?auto_14508 ?auto_14545 ) ) ( not ( = ?auto_14509 ?auto_14511 ) ) ( not ( = ?auto_14509 ?auto_14545 ) ) ( not ( = ?auto_14511 ?auto_14543 ) ) ( not ( = ?auto_14511 ?auto_14529 ) ) ( not ( = ?auto_14511 ?auto_14533 ) ) ( not ( = ?auto_14511 ?auto_14531 ) ) ( not ( = ?auto_14511 ?auto_14534 ) ) ( not ( = ?auto_14511 ?auto_14525 ) ) ( not ( = ?auto_14511 ?auto_14523 ) ) ( not ( = ?auto_14519 ?auto_14535 ) ) ( not ( = ?auto_14519 ?auto_14526 ) ) ( not ( = ?auto_14519 ?auto_14542 ) ) ( not ( = ?auto_14519 ?auto_14546 ) ) ( not ( = ?auto_14519 ?auto_14537 ) ) ( not ( = ?auto_14519 ?auto_14538 ) ) ( not ( = ?auto_14518 ?auto_14541 ) ) ( not ( = ?auto_14518 ?auto_14532 ) ) ( not ( = ?auto_14518 ?auto_14530 ) ) ( not ( = ?auto_14518 ?auto_14544 ) ) ( not ( = ?auto_14518 ?auto_14527 ) ) ( not ( = ?auto_14518 ?auto_14524 ) ) ( not ( = ?auto_14545 ?auto_14543 ) ) ( not ( = ?auto_14545 ?auto_14529 ) ) ( not ( = ?auto_14545 ?auto_14533 ) ) ( not ( = ?auto_14545 ?auto_14531 ) ) ( not ( = ?auto_14545 ?auto_14534 ) ) ( not ( = ?auto_14545 ?auto_14525 ) ) ( not ( = ?auto_14545 ?auto_14523 ) ) ( not ( = ?auto_14503 ?auto_14512 ) ) ( not ( = ?auto_14503 ?auto_14536 ) ) ( not ( = ?auto_14504 ?auto_14512 ) ) ( not ( = ?auto_14504 ?auto_14536 ) ) ( not ( = ?auto_14505 ?auto_14512 ) ) ( not ( = ?auto_14505 ?auto_14536 ) ) ( not ( = ?auto_14506 ?auto_14512 ) ) ( not ( = ?auto_14506 ?auto_14536 ) ) ( not ( = ?auto_14507 ?auto_14512 ) ) ( not ( = ?auto_14507 ?auto_14536 ) ) ( not ( = ?auto_14508 ?auto_14512 ) ) ( not ( = ?auto_14508 ?auto_14536 ) ) ( not ( = ?auto_14509 ?auto_14512 ) ) ( not ( = ?auto_14509 ?auto_14536 ) ) ( not ( = ?auto_14510 ?auto_14512 ) ) ( not ( = ?auto_14510 ?auto_14536 ) ) ( not ( = ?auto_14512 ?auto_14545 ) ) ( not ( = ?auto_14512 ?auto_14543 ) ) ( not ( = ?auto_14512 ?auto_14529 ) ) ( not ( = ?auto_14512 ?auto_14533 ) ) ( not ( = ?auto_14512 ?auto_14531 ) ) ( not ( = ?auto_14512 ?auto_14534 ) ) ( not ( = ?auto_14512 ?auto_14525 ) ) ( not ( = ?auto_14512 ?auto_14523 ) ) ( not ( = ?auto_14528 ?auto_14519 ) ) ( not ( = ?auto_14528 ?auto_14535 ) ) ( not ( = ?auto_14528 ?auto_14526 ) ) ( not ( = ?auto_14528 ?auto_14542 ) ) ( not ( = ?auto_14528 ?auto_14546 ) ) ( not ( = ?auto_14528 ?auto_14537 ) ) ( not ( = ?auto_14528 ?auto_14538 ) ) ( not ( = ?auto_14540 ?auto_14518 ) ) ( not ( = ?auto_14540 ?auto_14541 ) ) ( not ( = ?auto_14540 ?auto_14532 ) ) ( not ( = ?auto_14540 ?auto_14530 ) ) ( not ( = ?auto_14540 ?auto_14544 ) ) ( not ( = ?auto_14540 ?auto_14527 ) ) ( not ( = ?auto_14540 ?auto_14524 ) ) ( not ( = ?auto_14536 ?auto_14545 ) ) ( not ( = ?auto_14536 ?auto_14543 ) ) ( not ( = ?auto_14536 ?auto_14529 ) ) ( not ( = ?auto_14536 ?auto_14533 ) ) ( not ( = ?auto_14536 ?auto_14531 ) ) ( not ( = ?auto_14536 ?auto_14534 ) ) ( not ( = ?auto_14536 ?auto_14525 ) ) ( not ( = ?auto_14536 ?auto_14523 ) ) ( not ( = ?auto_14503 ?auto_14513 ) ) ( not ( = ?auto_14503 ?auto_14522 ) ) ( not ( = ?auto_14504 ?auto_14513 ) ) ( not ( = ?auto_14504 ?auto_14522 ) ) ( not ( = ?auto_14505 ?auto_14513 ) ) ( not ( = ?auto_14505 ?auto_14522 ) ) ( not ( = ?auto_14506 ?auto_14513 ) ) ( not ( = ?auto_14506 ?auto_14522 ) ) ( not ( = ?auto_14507 ?auto_14513 ) ) ( not ( = ?auto_14507 ?auto_14522 ) ) ( not ( = ?auto_14508 ?auto_14513 ) ) ( not ( = ?auto_14508 ?auto_14522 ) ) ( not ( = ?auto_14509 ?auto_14513 ) ) ( not ( = ?auto_14509 ?auto_14522 ) ) ( not ( = ?auto_14510 ?auto_14513 ) ) ( not ( = ?auto_14510 ?auto_14522 ) ) ( not ( = ?auto_14511 ?auto_14513 ) ) ( not ( = ?auto_14511 ?auto_14522 ) ) ( not ( = ?auto_14513 ?auto_14536 ) ) ( not ( = ?auto_14513 ?auto_14545 ) ) ( not ( = ?auto_14513 ?auto_14543 ) ) ( not ( = ?auto_14513 ?auto_14529 ) ) ( not ( = ?auto_14513 ?auto_14533 ) ) ( not ( = ?auto_14513 ?auto_14531 ) ) ( not ( = ?auto_14513 ?auto_14534 ) ) ( not ( = ?auto_14513 ?auto_14525 ) ) ( not ( = ?auto_14513 ?auto_14523 ) ) ( not ( = ?auto_14521 ?auto_14528 ) ) ( not ( = ?auto_14521 ?auto_14519 ) ) ( not ( = ?auto_14521 ?auto_14535 ) ) ( not ( = ?auto_14521 ?auto_14526 ) ) ( not ( = ?auto_14521 ?auto_14542 ) ) ( not ( = ?auto_14521 ?auto_14546 ) ) ( not ( = ?auto_14521 ?auto_14537 ) ) ( not ( = ?auto_14521 ?auto_14538 ) ) ( not ( = ?auto_14539 ?auto_14540 ) ) ( not ( = ?auto_14539 ?auto_14518 ) ) ( not ( = ?auto_14539 ?auto_14541 ) ) ( not ( = ?auto_14539 ?auto_14532 ) ) ( not ( = ?auto_14539 ?auto_14530 ) ) ( not ( = ?auto_14539 ?auto_14544 ) ) ( not ( = ?auto_14539 ?auto_14527 ) ) ( not ( = ?auto_14539 ?auto_14524 ) ) ( not ( = ?auto_14522 ?auto_14536 ) ) ( not ( = ?auto_14522 ?auto_14545 ) ) ( not ( = ?auto_14522 ?auto_14543 ) ) ( not ( = ?auto_14522 ?auto_14529 ) ) ( not ( = ?auto_14522 ?auto_14533 ) ) ( not ( = ?auto_14522 ?auto_14531 ) ) ( not ( = ?auto_14522 ?auto_14534 ) ) ( not ( = ?auto_14522 ?auto_14525 ) ) ( not ( = ?auto_14522 ?auto_14523 ) ) ( not ( = ?auto_14503 ?auto_14514 ) ) ( not ( = ?auto_14503 ?auto_14517 ) ) ( not ( = ?auto_14504 ?auto_14514 ) ) ( not ( = ?auto_14504 ?auto_14517 ) ) ( not ( = ?auto_14505 ?auto_14514 ) ) ( not ( = ?auto_14505 ?auto_14517 ) ) ( not ( = ?auto_14506 ?auto_14514 ) ) ( not ( = ?auto_14506 ?auto_14517 ) ) ( not ( = ?auto_14507 ?auto_14514 ) ) ( not ( = ?auto_14507 ?auto_14517 ) ) ( not ( = ?auto_14508 ?auto_14514 ) ) ( not ( = ?auto_14508 ?auto_14517 ) ) ( not ( = ?auto_14509 ?auto_14514 ) ) ( not ( = ?auto_14509 ?auto_14517 ) ) ( not ( = ?auto_14510 ?auto_14514 ) ) ( not ( = ?auto_14510 ?auto_14517 ) ) ( not ( = ?auto_14511 ?auto_14514 ) ) ( not ( = ?auto_14511 ?auto_14517 ) ) ( not ( = ?auto_14512 ?auto_14514 ) ) ( not ( = ?auto_14512 ?auto_14517 ) ) ( not ( = ?auto_14514 ?auto_14522 ) ) ( not ( = ?auto_14514 ?auto_14536 ) ) ( not ( = ?auto_14514 ?auto_14545 ) ) ( not ( = ?auto_14514 ?auto_14543 ) ) ( not ( = ?auto_14514 ?auto_14529 ) ) ( not ( = ?auto_14514 ?auto_14533 ) ) ( not ( = ?auto_14514 ?auto_14531 ) ) ( not ( = ?auto_14514 ?auto_14534 ) ) ( not ( = ?auto_14514 ?auto_14525 ) ) ( not ( = ?auto_14514 ?auto_14523 ) ) ( not ( = ?auto_14517 ?auto_14522 ) ) ( not ( = ?auto_14517 ?auto_14536 ) ) ( not ( = ?auto_14517 ?auto_14545 ) ) ( not ( = ?auto_14517 ?auto_14543 ) ) ( not ( = ?auto_14517 ?auto_14529 ) ) ( not ( = ?auto_14517 ?auto_14533 ) ) ( not ( = ?auto_14517 ?auto_14531 ) ) ( not ( = ?auto_14517 ?auto_14534 ) ) ( not ( = ?auto_14517 ?auto_14525 ) ) ( not ( = ?auto_14517 ?auto_14523 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_14503 ?auto_14504 ?auto_14505 ?auto_14506 ?auto_14507 ?auto_14508 ?auto_14509 ?auto_14510 ?auto_14511 ?auto_14512 ?auto_14513 )
      ( MAKE-1CRATE ?auto_14513 ?auto_14514 )
      ( MAKE-11CRATE-VERIFY ?auto_14503 ?auto_14504 ?auto_14505 ?auto_14506 ?auto_14507 ?auto_14508 ?auto_14509 ?auto_14510 ?auto_14511 ?auto_14512 ?auto_14513 ?auto_14514 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_14570 - SURFACE
      ?auto_14571 - SURFACE
      ?auto_14572 - SURFACE
      ?auto_14573 - SURFACE
      ?auto_14574 - SURFACE
      ?auto_14575 - SURFACE
      ?auto_14576 - SURFACE
      ?auto_14577 - SURFACE
      ?auto_14578 - SURFACE
      ?auto_14579 - SURFACE
      ?auto_14580 - SURFACE
      ?auto_14581 - SURFACE
      ?auto_14582 - SURFACE
    )
    :vars
    (
      ?auto_14583 - HOIST
      ?auto_14586 - PLACE
      ?auto_14588 - PLACE
      ?auto_14585 - HOIST
      ?auto_14587 - SURFACE
      ?auto_14607 - PLACE
      ?auto_14609 - HOIST
      ?auto_14606 - SURFACE
      ?auto_14604 - PLACE
      ?auto_14605 - HOIST
      ?auto_14608 - SURFACE
      ?auto_14615 - PLACE
      ?auto_14594 - HOIST
      ?auto_14592 - SURFACE
      ?auto_14595 - SURFACE
      ?auto_14613 - PLACE
      ?auto_14601 - HOIST
      ?auto_14589 - SURFACE
      ?auto_14602 - PLACE
      ?auto_14593 - HOIST
      ?auto_14600 - SURFACE
      ?auto_14610 - PLACE
      ?auto_14612 - HOIST
      ?auto_14614 - SURFACE
      ?auto_14611 - SURFACE
      ?auto_14590 - SURFACE
      ?auto_14597 - PLACE
      ?auto_14599 - HOIST
      ?auto_14591 - SURFACE
      ?auto_14598 - PLACE
      ?auto_14603 - HOIST
      ?auto_14596 - SURFACE
      ?auto_14584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14583 ?auto_14586 ) ( IS-CRATE ?auto_14582 ) ( not ( = ?auto_14588 ?auto_14586 ) ) ( HOIST-AT ?auto_14585 ?auto_14588 ) ( SURFACE-AT ?auto_14582 ?auto_14588 ) ( ON ?auto_14582 ?auto_14587 ) ( CLEAR ?auto_14582 ) ( not ( = ?auto_14581 ?auto_14582 ) ) ( not ( = ?auto_14581 ?auto_14587 ) ) ( not ( = ?auto_14582 ?auto_14587 ) ) ( not ( = ?auto_14583 ?auto_14585 ) ) ( IS-CRATE ?auto_14581 ) ( not ( = ?auto_14607 ?auto_14586 ) ) ( HOIST-AT ?auto_14609 ?auto_14607 ) ( SURFACE-AT ?auto_14581 ?auto_14607 ) ( ON ?auto_14581 ?auto_14606 ) ( CLEAR ?auto_14581 ) ( not ( = ?auto_14580 ?auto_14581 ) ) ( not ( = ?auto_14580 ?auto_14606 ) ) ( not ( = ?auto_14581 ?auto_14606 ) ) ( not ( = ?auto_14583 ?auto_14609 ) ) ( IS-CRATE ?auto_14580 ) ( not ( = ?auto_14604 ?auto_14586 ) ) ( HOIST-AT ?auto_14605 ?auto_14604 ) ( AVAILABLE ?auto_14605 ) ( SURFACE-AT ?auto_14580 ?auto_14604 ) ( ON ?auto_14580 ?auto_14608 ) ( CLEAR ?auto_14580 ) ( not ( = ?auto_14579 ?auto_14580 ) ) ( not ( = ?auto_14579 ?auto_14608 ) ) ( not ( = ?auto_14580 ?auto_14608 ) ) ( not ( = ?auto_14583 ?auto_14605 ) ) ( IS-CRATE ?auto_14579 ) ( not ( = ?auto_14615 ?auto_14586 ) ) ( HOIST-AT ?auto_14594 ?auto_14615 ) ( AVAILABLE ?auto_14594 ) ( SURFACE-AT ?auto_14579 ?auto_14615 ) ( ON ?auto_14579 ?auto_14592 ) ( CLEAR ?auto_14579 ) ( not ( = ?auto_14578 ?auto_14579 ) ) ( not ( = ?auto_14578 ?auto_14592 ) ) ( not ( = ?auto_14579 ?auto_14592 ) ) ( not ( = ?auto_14583 ?auto_14594 ) ) ( IS-CRATE ?auto_14578 ) ( AVAILABLE ?auto_14609 ) ( SURFACE-AT ?auto_14578 ?auto_14607 ) ( ON ?auto_14578 ?auto_14595 ) ( CLEAR ?auto_14578 ) ( not ( = ?auto_14577 ?auto_14578 ) ) ( not ( = ?auto_14577 ?auto_14595 ) ) ( not ( = ?auto_14578 ?auto_14595 ) ) ( IS-CRATE ?auto_14577 ) ( not ( = ?auto_14613 ?auto_14586 ) ) ( HOIST-AT ?auto_14601 ?auto_14613 ) ( SURFACE-AT ?auto_14577 ?auto_14613 ) ( ON ?auto_14577 ?auto_14589 ) ( CLEAR ?auto_14577 ) ( not ( = ?auto_14576 ?auto_14577 ) ) ( not ( = ?auto_14576 ?auto_14589 ) ) ( not ( = ?auto_14577 ?auto_14589 ) ) ( not ( = ?auto_14583 ?auto_14601 ) ) ( IS-CRATE ?auto_14576 ) ( not ( = ?auto_14602 ?auto_14586 ) ) ( HOIST-AT ?auto_14593 ?auto_14602 ) ( AVAILABLE ?auto_14593 ) ( SURFACE-AT ?auto_14576 ?auto_14602 ) ( ON ?auto_14576 ?auto_14600 ) ( CLEAR ?auto_14576 ) ( not ( = ?auto_14575 ?auto_14576 ) ) ( not ( = ?auto_14575 ?auto_14600 ) ) ( not ( = ?auto_14576 ?auto_14600 ) ) ( not ( = ?auto_14583 ?auto_14593 ) ) ( IS-CRATE ?auto_14575 ) ( not ( = ?auto_14610 ?auto_14586 ) ) ( HOIST-AT ?auto_14612 ?auto_14610 ) ( AVAILABLE ?auto_14612 ) ( SURFACE-AT ?auto_14575 ?auto_14610 ) ( ON ?auto_14575 ?auto_14614 ) ( CLEAR ?auto_14575 ) ( not ( = ?auto_14574 ?auto_14575 ) ) ( not ( = ?auto_14574 ?auto_14614 ) ) ( not ( = ?auto_14575 ?auto_14614 ) ) ( not ( = ?auto_14583 ?auto_14612 ) ) ( IS-CRATE ?auto_14574 ) ( AVAILABLE ?auto_14601 ) ( SURFACE-AT ?auto_14574 ?auto_14613 ) ( ON ?auto_14574 ?auto_14611 ) ( CLEAR ?auto_14574 ) ( not ( = ?auto_14573 ?auto_14574 ) ) ( not ( = ?auto_14573 ?auto_14611 ) ) ( not ( = ?auto_14574 ?auto_14611 ) ) ( IS-CRATE ?auto_14573 ) ( AVAILABLE ?auto_14585 ) ( SURFACE-AT ?auto_14573 ?auto_14588 ) ( ON ?auto_14573 ?auto_14590 ) ( CLEAR ?auto_14573 ) ( not ( = ?auto_14572 ?auto_14573 ) ) ( not ( = ?auto_14572 ?auto_14590 ) ) ( not ( = ?auto_14573 ?auto_14590 ) ) ( IS-CRATE ?auto_14572 ) ( not ( = ?auto_14597 ?auto_14586 ) ) ( HOIST-AT ?auto_14599 ?auto_14597 ) ( AVAILABLE ?auto_14599 ) ( SURFACE-AT ?auto_14572 ?auto_14597 ) ( ON ?auto_14572 ?auto_14591 ) ( CLEAR ?auto_14572 ) ( not ( = ?auto_14571 ?auto_14572 ) ) ( not ( = ?auto_14571 ?auto_14591 ) ) ( not ( = ?auto_14572 ?auto_14591 ) ) ( not ( = ?auto_14583 ?auto_14599 ) ) ( SURFACE-AT ?auto_14570 ?auto_14586 ) ( CLEAR ?auto_14570 ) ( IS-CRATE ?auto_14571 ) ( AVAILABLE ?auto_14583 ) ( not ( = ?auto_14598 ?auto_14586 ) ) ( HOIST-AT ?auto_14603 ?auto_14598 ) ( AVAILABLE ?auto_14603 ) ( SURFACE-AT ?auto_14571 ?auto_14598 ) ( ON ?auto_14571 ?auto_14596 ) ( CLEAR ?auto_14571 ) ( TRUCK-AT ?auto_14584 ?auto_14586 ) ( not ( = ?auto_14570 ?auto_14571 ) ) ( not ( = ?auto_14570 ?auto_14596 ) ) ( not ( = ?auto_14571 ?auto_14596 ) ) ( not ( = ?auto_14583 ?auto_14603 ) ) ( not ( = ?auto_14570 ?auto_14572 ) ) ( not ( = ?auto_14570 ?auto_14591 ) ) ( not ( = ?auto_14572 ?auto_14596 ) ) ( not ( = ?auto_14597 ?auto_14598 ) ) ( not ( = ?auto_14599 ?auto_14603 ) ) ( not ( = ?auto_14591 ?auto_14596 ) ) ( not ( = ?auto_14570 ?auto_14573 ) ) ( not ( = ?auto_14570 ?auto_14590 ) ) ( not ( = ?auto_14571 ?auto_14573 ) ) ( not ( = ?auto_14571 ?auto_14590 ) ) ( not ( = ?auto_14573 ?auto_14591 ) ) ( not ( = ?auto_14573 ?auto_14596 ) ) ( not ( = ?auto_14588 ?auto_14597 ) ) ( not ( = ?auto_14588 ?auto_14598 ) ) ( not ( = ?auto_14585 ?auto_14599 ) ) ( not ( = ?auto_14585 ?auto_14603 ) ) ( not ( = ?auto_14590 ?auto_14591 ) ) ( not ( = ?auto_14590 ?auto_14596 ) ) ( not ( = ?auto_14570 ?auto_14574 ) ) ( not ( = ?auto_14570 ?auto_14611 ) ) ( not ( = ?auto_14571 ?auto_14574 ) ) ( not ( = ?auto_14571 ?auto_14611 ) ) ( not ( = ?auto_14572 ?auto_14574 ) ) ( not ( = ?auto_14572 ?auto_14611 ) ) ( not ( = ?auto_14574 ?auto_14590 ) ) ( not ( = ?auto_14574 ?auto_14591 ) ) ( not ( = ?auto_14574 ?auto_14596 ) ) ( not ( = ?auto_14613 ?auto_14588 ) ) ( not ( = ?auto_14613 ?auto_14597 ) ) ( not ( = ?auto_14613 ?auto_14598 ) ) ( not ( = ?auto_14601 ?auto_14585 ) ) ( not ( = ?auto_14601 ?auto_14599 ) ) ( not ( = ?auto_14601 ?auto_14603 ) ) ( not ( = ?auto_14611 ?auto_14590 ) ) ( not ( = ?auto_14611 ?auto_14591 ) ) ( not ( = ?auto_14611 ?auto_14596 ) ) ( not ( = ?auto_14570 ?auto_14575 ) ) ( not ( = ?auto_14570 ?auto_14614 ) ) ( not ( = ?auto_14571 ?auto_14575 ) ) ( not ( = ?auto_14571 ?auto_14614 ) ) ( not ( = ?auto_14572 ?auto_14575 ) ) ( not ( = ?auto_14572 ?auto_14614 ) ) ( not ( = ?auto_14573 ?auto_14575 ) ) ( not ( = ?auto_14573 ?auto_14614 ) ) ( not ( = ?auto_14575 ?auto_14611 ) ) ( not ( = ?auto_14575 ?auto_14590 ) ) ( not ( = ?auto_14575 ?auto_14591 ) ) ( not ( = ?auto_14575 ?auto_14596 ) ) ( not ( = ?auto_14610 ?auto_14613 ) ) ( not ( = ?auto_14610 ?auto_14588 ) ) ( not ( = ?auto_14610 ?auto_14597 ) ) ( not ( = ?auto_14610 ?auto_14598 ) ) ( not ( = ?auto_14612 ?auto_14601 ) ) ( not ( = ?auto_14612 ?auto_14585 ) ) ( not ( = ?auto_14612 ?auto_14599 ) ) ( not ( = ?auto_14612 ?auto_14603 ) ) ( not ( = ?auto_14614 ?auto_14611 ) ) ( not ( = ?auto_14614 ?auto_14590 ) ) ( not ( = ?auto_14614 ?auto_14591 ) ) ( not ( = ?auto_14614 ?auto_14596 ) ) ( not ( = ?auto_14570 ?auto_14576 ) ) ( not ( = ?auto_14570 ?auto_14600 ) ) ( not ( = ?auto_14571 ?auto_14576 ) ) ( not ( = ?auto_14571 ?auto_14600 ) ) ( not ( = ?auto_14572 ?auto_14576 ) ) ( not ( = ?auto_14572 ?auto_14600 ) ) ( not ( = ?auto_14573 ?auto_14576 ) ) ( not ( = ?auto_14573 ?auto_14600 ) ) ( not ( = ?auto_14574 ?auto_14576 ) ) ( not ( = ?auto_14574 ?auto_14600 ) ) ( not ( = ?auto_14576 ?auto_14614 ) ) ( not ( = ?auto_14576 ?auto_14611 ) ) ( not ( = ?auto_14576 ?auto_14590 ) ) ( not ( = ?auto_14576 ?auto_14591 ) ) ( not ( = ?auto_14576 ?auto_14596 ) ) ( not ( = ?auto_14602 ?auto_14610 ) ) ( not ( = ?auto_14602 ?auto_14613 ) ) ( not ( = ?auto_14602 ?auto_14588 ) ) ( not ( = ?auto_14602 ?auto_14597 ) ) ( not ( = ?auto_14602 ?auto_14598 ) ) ( not ( = ?auto_14593 ?auto_14612 ) ) ( not ( = ?auto_14593 ?auto_14601 ) ) ( not ( = ?auto_14593 ?auto_14585 ) ) ( not ( = ?auto_14593 ?auto_14599 ) ) ( not ( = ?auto_14593 ?auto_14603 ) ) ( not ( = ?auto_14600 ?auto_14614 ) ) ( not ( = ?auto_14600 ?auto_14611 ) ) ( not ( = ?auto_14600 ?auto_14590 ) ) ( not ( = ?auto_14600 ?auto_14591 ) ) ( not ( = ?auto_14600 ?auto_14596 ) ) ( not ( = ?auto_14570 ?auto_14577 ) ) ( not ( = ?auto_14570 ?auto_14589 ) ) ( not ( = ?auto_14571 ?auto_14577 ) ) ( not ( = ?auto_14571 ?auto_14589 ) ) ( not ( = ?auto_14572 ?auto_14577 ) ) ( not ( = ?auto_14572 ?auto_14589 ) ) ( not ( = ?auto_14573 ?auto_14577 ) ) ( not ( = ?auto_14573 ?auto_14589 ) ) ( not ( = ?auto_14574 ?auto_14577 ) ) ( not ( = ?auto_14574 ?auto_14589 ) ) ( not ( = ?auto_14575 ?auto_14577 ) ) ( not ( = ?auto_14575 ?auto_14589 ) ) ( not ( = ?auto_14577 ?auto_14600 ) ) ( not ( = ?auto_14577 ?auto_14614 ) ) ( not ( = ?auto_14577 ?auto_14611 ) ) ( not ( = ?auto_14577 ?auto_14590 ) ) ( not ( = ?auto_14577 ?auto_14591 ) ) ( not ( = ?auto_14577 ?auto_14596 ) ) ( not ( = ?auto_14589 ?auto_14600 ) ) ( not ( = ?auto_14589 ?auto_14614 ) ) ( not ( = ?auto_14589 ?auto_14611 ) ) ( not ( = ?auto_14589 ?auto_14590 ) ) ( not ( = ?auto_14589 ?auto_14591 ) ) ( not ( = ?auto_14589 ?auto_14596 ) ) ( not ( = ?auto_14570 ?auto_14578 ) ) ( not ( = ?auto_14570 ?auto_14595 ) ) ( not ( = ?auto_14571 ?auto_14578 ) ) ( not ( = ?auto_14571 ?auto_14595 ) ) ( not ( = ?auto_14572 ?auto_14578 ) ) ( not ( = ?auto_14572 ?auto_14595 ) ) ( not ( = ?auto_14573 ?auto_14578 ) ) ( not ( = ?auto_14573 ?auto_14595 ) ) ( not ( = ?auto_14574 ?auto_14578 ) ) ( not ( = ?auto_14574 ?auto_14595 ) ) ( not ( = ?auto_14575 ?auto_14578 ) ) ( not ( = ?auto_14575 ?auto_14595 ) ) ( not ( = ?auto_14576 ?auto_14578 ) ) ( not ( = ?auto_14576 ?auto_14595 ) ) ( not ( = ?auto_14578 ?auto_14589 ) ) ( not ( = ?auto_14578 ?auto_14600 ) ) ( not ( = ?auto_14578 ?auto_14614 ) ) ( not ( = ?auto_14578 ?auto_14611 ) ) ( not ( = ?auto_14578 ?auto_14590 ) ) ( not ( = ?auto_14578 ?auto_14591 ) ) ( not ( = ?auto_14578 ?auto_14596 ) ) ( not ( = ?auto_14607 ?auto_14613 ) ) ( not ( = ?auto_14607 ?auto_14602 ) ) ( not ( = ?auto_14607 ?auto_14610 ) ) ( not ( = ?auto_14607 ?auto_14588 ) ) ( not ( = ?auto_14607 ?auto_14597 ) ) ( not ( = ?auto_14607 ?auto_14598 ) ) ( not ( = ?auto_14609 ?auto_14601 ) ) ( not ( = ?auto_14609 ?auto_14593 ) ) ( not ( = ?auto_14609 ?auto_14612 ) ) ( not ( = ?auto_14609 ?auto_14585 ) ) ( not ( = ?auto_14609 ?auto_14599 ) ) ( not ( = ?auto_14609 ?auto_14603 ) ) ( not ( = ?auto_14595 ?auto_14589 ) ) ( not ( = ?auto_14595 ?auto_14600 ) ) ( not ( = ?auto_14595 ?auto_14614 ) ) ( not ( = ?auto_14595 ?auto_14611 ) ) ( not ( = ?auto_14595 ?auto_14590 ) ) ( not ( = ?auto_14595 ?auto_14591 ) ) ( not ( = ?auto_14595 ?auto_14596 ) ) ( not ( = ?auto_14570 ?auto_14579 ) ) ( not ( = ?auto_14570 ?auto_14592 ) ) ( not ( = ?auto_14571 ?auto_14579 ) ) ( not ( = ?auto_14571 ?auto_14592 ) ) ( not ( = ?auto_14572 ?auto_14579 ) ) ( not ( = ?auto_14572 ?auto_14592 ) ) ( not ( = ?auto_14573 ?auto_14579 ) ) ( not ( = ?auto_14573 ?auto_14592 ) ) ( not ( = ?auto_14574 ?auto_14579 ) ) ( not ( = ?auto_14574 ?auto_14592 ) ) ( not ( = ?auto_14575 ?auto_14579 ) ) ( not ( = ?auto_14575 ?auto_14592 ) ) ( not ( = ?auto_14576 ?auto_14579 ) ) ( not ( = ?auto_14576 ?auto_14592 ) ) ( not ( = ?auto_14577 ?auto_14579 ) ) ( not ( = ?auto_14577 ?auto_14592 ) ) ( not ( = ?auto_14579 ?auto_14595 ) ) ( not ( = ?auto_14579 ?auto_14589 ) ) ( not ( = ?auto_14579 ?auto_14600 ) ) ( not ( = ?auto_14579 ?auto_14614 ) ) ( not ( = ?auto_14579 ?auto_14611 ) ) ( not ( = ?auto_14579 ?auto_14590 ) ) ( not ( = ?auto_14579 ?auto_14591 ) ) ( not ( = ?auto_14579 ?auto_14596 ) ) ( not ( = ?auto_14615 ?auto_14607 ) ) ( not ( = ?auto_14615 ?auto_14613 ) ) ( not ( = ?auto_14615 ?auto_14602 ) ) ( not ( = ?auto_14615 ?auto_14610 ) ) ( not ( = ?auto_14615 ?auto_14588 ) ) ( not ( = ?auto_14615 ?auto_14597 ) ) ( not ( = ?auto_14615 ?auto_14598 ) ) ( not ( = ?auto_14594 ?auto_14609 ) ) ( not ( = ?auto_14594 ?auto_14601 ) ) ( not ( = ?auto_14594 ?auto_14593 ) ) ( not ( = ?auto_14594 ?auto_14612 ) ) ( not ( = ?auto_14594 ?auto_14585 ) ) ( not ( = ?auto_14594 ?auto_14599 ) ) ( not ( = ?auto_14594 ?auto_14603 ) ) ( not ( = ?auto_14592 ?auto_14595 ) ) ( not ( = ?auto_14592 ?auto_14589 ) ) ( not ( = ?auto_14592 ?auto_14600 ) ) ( not ( = ?auto_14592 ?auto_14614 ) ) ( not ( = ?auto_14592 ?auto_14611 ) ) ( not ( = ?auto_14592 ?auto_14590 ) ) ( not ( = ?auto_14592 ?auto_14591 ) ) ( not ( = ?auto_14592 ?auto_14596 ) ) ( not ( = ?auto_14570 ?auto_14580 ) ) ( not ( = ?auto_14570 ?auto_14608 ) ) ( not ( = ?auto_14571 ?auto_14580 ) ) ( not ( = ?auto_14571 ?auto_14608 ) ) ( not ( = ?auto_14572 ?auto_14580 ) ) ( not ( = ?auto_14572 ?auto_14608 ) ) ( not ( = ?auto_14573 ?auto_14580 ) ) ( not ( = ?auto_14573 ?auto_14608 ) ) ( not ( = ?auto_14574 ?auto_14580 ) ) ( not ( = ?auto_14574 ?auto_14608 ) ) ( not ( = ?auto_14575 ?auto_14580 ) ) ( not ( = ?auto_14575 ?auto_14608 ) ) ( not ( = ?auto_14576 ?auto_14580 ) ) ( not ( = ?auto_14576 ?auto_14608 ) ) ( not ( = ?auto_14577 ?auto_14580 ) ) ( not ( = ?auto_14577 ?auto_14608 ) ) ( not ( = ?auto_14578 ?auto_14580 ) ) ( not ( = ?auto_14578 ?auto_14608 ) ) ( not ( = ?auto_14580 ?auto_14592 ) ) ( not ( = ?auto_14580 ?auto_14595 ) ) ( not ( = ?auto_14580 ?auto_14589 ) ) ( not ( = ?auto_14580 ?auto_14600 ) ) ( not ( = ?auto_14580 ?auto_14614 ) ) ( not ( = ?auto_14580 ?auto_14611 ) ) ( not ( = ?auto_14580 ?auto_14590 ) ) ( not ( = ?auto_14580 ?auto_14591 ) ) ( not ( = ?auto_14580 ?auto_14596 ) ) ( not ( = ?auto_14604 ?auto_14615 ) ) ( not ( = ?auto_14604 ?auto_14607 ) ) ( not ( = ?auto_14604 ?auto_14613 ) ) ( not ( = ?auto_14604 ?auto_14602 ) ) ( not ( = ?auto_14604 ?auto_14610 ) ) ( not ( = ?auto_14604 ?auto_14588 ) ) ( not ( = ?auto_14604 ?auto_14597 ) ) ( not ( = ?auto_14604 ?auto_14598 ) ) ( not ( = ?auto_14605 ?auto_14594 ) ) ( not ( = ?auto_14605 ?auto_14609 ) ) ( not ( = ?auto_14605 ?auto_14601 ) ) ( not ( = ?auto_14605 ?auto_14593 ) ) ( not ( = ?auto_14605 ?auto_14612 ) ) ( not ( = ?auto_14605 ?auto_14585 ) ) ( not ( = ?auto_14605 ?auto_14599 ) ) ( not ( = ?auto_14605 ?auto_14603 ) ) ( not ( = ?auto_14608 ?auto_14592 ) ) ( not ( = ?auto_14608 ?auto_14595 ) ) ( not ( = ?auto_14608 ?auto_14589 ) ) ( not ( = ?auto_14608 ?auto_14600 ) ) ( not ( = ?auto_14608 ?auto_14614 ) ) ( not ( = ?auto_14608 ?auto_14611 ) ) ( not ( = ?auto_14608 ?auto_14590 ) ) ( not ( = ?auto_14608 ?auto_14591 ) ) ( not ( = ?auto_14608 ?auto_14596 ) ) ( not ( = ?auto_14570 ?auto_14581 ) ) ( not ( = ?auto_14570 ?auto_14606 ) ) ( not ( = ?auto_14571 ?auto_14581 ) ) ( not ( = ?auto_14571 ?auto_14606 ) ) ( not ( = ?auto_14572 ?auto_14581 ) ) ( not ( = ?auto_14572 ?auto_14606 ) ) ( not ( = ?auto_14573 ?auto_14581 ) ) ( not ( = ?auto_14573 ?auto_14606 ) ) ( not ( = ?auto_14574 ?auto_14581 ) ) ( not ( = ?auto_14574 ?auto_14606 ) ) ( not ( = ?auto_14575 ?auto_14581 ) ) ( not ( = ?auto_14575 ?auto_14606 ) ) ( not ( = ?auto_14576 ?auto_14581 ) ) ( not ( = ?auto_14576 ?auto_14606 ) ) ( not ( = ?auto_14577 ?auto_14581 ) ) ( not ( = ?auto_14577 ?auto_14606 ) ) ( not ( = ?auto_14578 ?auto_14581 ) ) ( not ( = ?auto_14578 ?auto_14606 ) ) ( not ( = ?auto_14579 ?auto_14581 ) ) ( not ( = ?auto_14579 ?auto_14606 ) ) ( not ( = ?auto_14581 ?auto_14608 ) ) ( not ( = ?auto_14581 ?auto_14592 ) ) ( not ( = ?auto_14581 ?auto_14595 ) ) ( not ( = ?auto_14581 ?auto_14589 ) ) ( not ( = ?auto_14581 ?auto_14600 ) ) ( not ( = ?auto_14581 ?auto_14614 ) ) ( not ( = ?auto_14581 ?auto_14611 ) ) ( not ( = ?auto_14581 ?auto_14590 ) ) ( not ( = ?auto_14581 ?auto_14591 ) ) ( not ( = ?auto_14581 ?auto_14596 ) ) ( not ( = ?auto_14606 ?auto_14608 ) ) ( not ( = ?auto_14606 ?auto_14592 ) ) ( not ( = ?auto_14606 ?auto_14595 ) ) ( not ( = ?auto_14606 ?auto_14589 ) ) ( not ( = ?auto_14606 ?auto_14600 ) ) ( not ( = ?auto_14606 ?auto_14614 ) ) ( not ( = ?auto_14606 ?auto_14611 ) ) ( not ( = ?auto_14606 ?auto_14590 ) ) ( not ( = ?auto_14606 ?auto_14591 ) ) ( not ( = ?auto_14606 ?auto_14596 ) ) ( not ( = ?auto_14570 ?auto_14582 ) ) ( not ( = ?auto_14570 ?auto_14587 ) ) ( not ( = ?auto_14571 ?auto_14582 ) ) ( not ( = ?auto_14571 ?auto_14587 ) ) ( not ( = ?auto_14572 ?auto_14582 ) ) ( not ( = ?auto_14572 ?auto_14587 ) ) ( not ( = ?auto_14573 ?auto_14582 ) ) ( not ( = ?auto_14573 ?auto_14587 ) ) ( not ( = ?auto_14574 ?auto_14582 ) ) ( not ( = ?auto_14574 ?auto_14587 ) ) ( not ( = ?auto_14575 ?auto_14582 ) ) ( not ( = ?auto_14575 ?auto_14587 ) ) ( not ( = ?auto_14576 ?auto_14582 ) ) ( not ( = ?auto_14576 ?auto_14587 ) ) ( not ( = ?auto_14577 ?auto_14582 ) ) ( not ( = ?auto_14577 ?auto_14587 ) ) ( not ( = ?auto_14578 ?auto_14582 ) ) ( not ( = ?auto_14578 ?auto_14587 ) ) ( not ( = ?auto_14579 ?auto_14582 ) ) ( not ( = ?auto_14579 ?auto_14587 ) ) ( not ( = ?auto_14580 ?auto_14582 ) ) ( not ( = ?auto_14580 ?auto_14587 ) ) ( not ( = ?auto_14582 ?auto_14606 ) ) ( not ( = ?auto_14582 ?auto_14608 ) ) ( not ( = ?auto_14582 ?auto_14592 ) ) ( not ( = ?auto_14582 ?auto_14595 ) ) ( not ( = ?auto_14582 ?auto_14589 ) ) ( not ( = ?auto_14582 ?auto_14600 ) ) ( not ( = ?auto_14582 ?auto_14614 ) ) ( not ( = ?auto_14582 ?auto_14611 ) ) ( not ( = ?auto_14582 ?auto_14590 ) ) ( not ( = ?auto_14582 ?auto_14591 ) ) ( not ( = ?auto_14582 ?auto_14596 ) ) ( not ( = ?auto_14587 ?auto_14606 ) ) ( not ( = ?auto_14587 ?auto_14608 ) ) ( not ( = ?auto_14587 ?auto_14592 ) ) ( not ( = ?auto_14587 ?auto_14595 ) ) ( not ( = ?auto_14587 ?auto_14589 ) ) ( not ( = ?auto_14587 ?auto_14600 ) ) ( not ( = ?auto_14587 ?auto_14614 ) ) ( not ( = ?auto_14587 ?auto_14611 ) ) ( not ( = ?auto_14587 ?auto_14590 ) ) ( not ( = ?auto_14587 ?auto_14591 ) ) ( not ( = ?auto_14587 ?auto_14596 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_14570 ?auto_14571 ?auto_14572 ?auto_14573 ?auto_14574 ?auto_14575 ?auto_14576 ?auto_14577 ?auto_14578 ?auto_14579 ?auto_14580 ?auto_14581 )
      ( MAKE-1CRATE ?auto_14581 ?auto_14582 )
      ( MAKE-12CRATE-VERIFY ?auto_14570 ?auto_14571 ?auto_14572 ?auto_14573 ?auto_14574 ?auto_14575 ?auto_14576 ?auto_14577 ?auto_14578 ?auto_14579 ?auto_14580 ?auto_14581 ?auto_14582 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_14640 - SURFACE
      ?auto_14641 - SURFACE
      ?auto_14642 - SURFACE
      ?auto_14643 - SURFACE
      ?auto_14644 - SURFACE
      ?auto_14645 - SURFACE
      ?auto_14646 - SURFACE
      ?auto_14647 - SURFACE
      ?auto_14648 - SURFACE
      ?auto_14649 - SURFACE
      ?auto_14650 - SURFACE
      ?auto_14651 - SURFACE
      ?auto_14652 - SURFACE
      ?auto_14653 - SURFACE
    )
    :vars
    (
      ?auto_14658 - HOIST
      ?auto_14656 - PLACE
      ?auto_14655 - PLACE
      ?auto_14659 - HOIST
      ?auto_14657 - SURFACE
      ?auto_14667 - PLACE
      ?auto_14666 - HOIST
      ?auto_14678 - SURFACE
      ?auto_14686 - PLACE
      ?auto_14679 - HOIST
      ?auto_14673 - SURFACE
      ?auto_14661 - PLACE
      ?auto_14665 - HOIST
      ?auto_14675 - SURFACE
      ?auto_14676 - PLACE
      ?auto_14688 - HOIST
      ?auto_14674 - SURFACE
      ?auto_14682 - SURFACE
      ?auto_14683 - PLACE
      ?auto_14664 - HOIST
      ?auto_14671 - SURFACE
      ?auto_14663 - PLACE
      ?auto_14669 - HOIST
      ?auto_14660 - SURFACE
      ?auto_14668 - PLACE
      ?auto_14677 - HOIST
      ?auto_14672 - SURFACE
      ?auto_14685 - SURFACE
      ?auto_14681 - SURFACE
      ?auto_14680 - PLACE
      ?auto_14670 - HOIST
      ?auto_14687 - SURFACE
      ?auto_14689 - PLACE
      ?auto_14684 - HOIST
      ?auto_14662 - SURFACE
      ?auto_14654 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14658 ?auto_14656 ) ( IS-CRATE ?auto_14653 ) ( not ( = ?auto_14655 ?auto_14656 ) ) ( HOIST-AT ?auto_14659 ?auto_14655 ) ( AVAILABLE ?auto_14659 ) ( SURFACE-AT ?auto_14653 ?auto_14655 ) ( ON ?auto_14653 ?auto_14657 ) ( CLEAR ?auto_14653 ) ( not ( = ?auto_14652 ?auto_14653 ) ) ( not ( = ?auto_14652 ?auto_14657 ) ) ( not ( = ?auto_14653 ?auto_14657 ) ) ( not ( = ?auto_14658 ?auto_14659 ) ) ( IS-CRATE ?auto_14652 ) ( not ( = ?auto_14667 ?auto_14656 ) ) ( HOIST-AT ?auto_14666 ?auto_14667 ) ( SURFACE-AT ?auto_14652 ?auto_14667 ) ( ON ?auto_14652 ?auto_14678 ) ( CLEAR ?auto_14652 ) ( not ( = ?auto_14651 ?auto_14652 ) ) ( not ( = ?auto_14651 ?auto_14678 ) ) ( not ( = ?auto_14652 ?auto_14678 ) ) ( not ( = ?auto_14658 ?auto_14666 ) ) ( IS-CRATE ?auto_14651 ) ( not ( = ?auto_14686 ?auto_14656 ) ) ( HOIST-AT ?auto_14679 ?auto_14686 ) ( SURFACE-AT ?auto_14651 ?auto_14686 ) ( ON ?auto_14651 ?auto_14673 ) ( CLEAR ?auto_14651 ) ( not ( = ?auto_14650 ?auto_14651 ) ) ( not ( = ?auto_14650 ?auto_14673 ) ) ( not ( = ?auto_14651 ?auto_14673 ) ) ( not ( = ?auto_14658 ?auto_14679 ) ) ( IS-CRATE ?auto_14650 ) ( not ( = ?auto_14661 ?auto_14656 ) ) ( HOIST-AT ?auto_14665 ?auto_14661 ) ( AVAILABLE ?auto_14665 ) ( SURFACE-AT ?auto_14650 ?auto_14661 ) ( ON ?auto_14650 ?auto_14675 ) ( CLEAR ?auto_14650 ) ( not ( = ?auto_14649 ?auto_14650 ) ) ( not ( = ?auto_14649 ?auto_14675 ) ) ( not ( = ?auto_14650 ?auto_14675 ) ) ( not ( = ?auto_14658 ?auto_14665 ) ) ( IS-CRATE ?auto_14649 ) ( not ( = ?auto_14676 ?auto_14656 ) ) ( HOIST-AT ?auto_14688 ?auto_14676 ) ( AVAILABLE ?auto_14688 ) ( SURFACE-AT ?auto_14649 ?auto_14676 ) ( ON ?auto_14649 ?auto_14674 ) ( CLEAR ?auto_14649 ) ( not ( = ?auto_14648 ?auto_14649 ) ) ( not ( = ?auto_14648 ?auto_14674 ) ) ( not ( = ?auto_14649 ?auto_14674 ) ) ( not ( = ?auto_14658 ?auto_14688 ) ) ( IS-CRATE ?auto_14648 ) ( AVAILABLE ?auto_14679 ) ( SURFACE-AT ?auto_14648 ?auto_14686 ) ( ON ?auto_14648 ?auto_14682 ) ( CLEAR ?auto_14648 ) ( not ( = ?auto_14647 ?auto_14648 ) ) ( not ( = ?auto_14647 ?auto_14682 ) ) ( not ( = ?auto_14648 ?auto_14682 ) ) ( IS-CRATE ?auto_14647 ) ( not ( = ?auto_14683 ?auto_14656 ) ) ( HOIST-AT ?auto_14664 ?auto_14683 ) ( SURFACE-AT ?auto_14647 ?auto_14683 ) ( ON ?auto_14647 ?auto_14671 ) ( CLEAR ?auto_14647 ) ( not ( = ?auto_14646 ?auto_14647 ) ) ( not ( = ?auto_14646 ?auto_14671 ) ) ( not ( = ?auto_14647 ?auto_14671 ) ) ( not ( = ?auto_14658 ?auto_14664 ) ) ( IS-CRATE ?auto_14646 ) ( not ( = ?auto_14663 ?auto_14656 ) ) ( HOIST-AT ?auto_14669 ?auto_14663 ) ( AVAILABLE ?auto_14669 ) ( SURFACE-AT ?auto_14646 ?auto_14663 ) ( ON ?auto_14646 ?auto_14660 ) ( CLEAR ?auto_14646 ) ( not ( = ?auto_14645 ?auto_14646 ) ) ( not ( = ?auto_14645 ?auto_14660 ) ) ( not ( = ?auto_14646 ?auto_14660 ) ) ( not ( = ?auto_14658 ?auto_14669 ) ) ( IS-CRATE ?auto_14645 ) ( not ( = ?auto_14668 ?auto_14656 ) ) ( HOIST-AT ?auto_14677 ?auto_14668 ) ( AVAILABLE ?auto_14677 ) ( SURFACE-AT ?auto_14645 ?auto_14668 ) ( ON ?auto_14645 ?auto_14672 ) ( CLEAR ?auto_14645 ) ( not ( = ?auto_14644 ?auto_14645 ) ) ( not ( = ?auto_14644 ?auto_14672 ) ) ( not ( = ?auto_14645 ?auto_14672 ) ) ( not ( = ?auto_14658 ?auto_14677 ) ) ( IS-CRATE ?auto_14644 ) ( AVAILABLE ?auto_14664 ) ( SURFACE-AT ?auto_14644 ?auto_14683 ) ( ON ?auto_14644 ?auto_14685 ) ( CLEAR ?auto_14644 ) ( not ( = ?auto_14643 ?auto_14644 ) ) ( not ( = ?auto_14643 ?auto_14685 ) ) ( not ( = ?auto_14644 ?auto_14685 ) ) ( IS-CRATE ?auto_14643 ) ( AVAILABLE ?auto_14666 ) ( SURFACE-AT ?auto_14643 ?auto_14667 ) ( ON ?auto_14643 ?auto_14681 ) ( CLEAR ?auto_14643 ) ( not ( = ?auto_14642 ?auto_14643 ) ) ( not ( = ?auto_14642 ?auto_14681 ) ) ( not ( = ?auto_14643 ?auto_14681 ) ) ( IS-CRATE ?auto_14642 ) ( not ( = ?auto_14680 ?auto_14656 ) ) ( HOIST-AT ?auto_14670 ?auto_14680 ) ( AVAILABLE ?auto_14670 ) ( SURFACE-AT ?auto_14642 ?auto_14680 ) ( ON ?auto_14642 ?auto_14687 ) ( CLEAR ?auto_14642 ) ( not ( = ?auto_14641 ?auto_14642 ) ) ( not ( = ?auto_14641 ?auto_14687 ) ) ( not ( = ?auto_14642 ?auto_14687 ) ) ( not ( = ?auto_14658 ?auto_14670 ) ) ( SURFACE-AT ?auto_14640 ?auto_14656 ) ( CLEAR ?auto_14640 ) ( IS-CRATE ?auto_14641 ) ( AVAILABLE ?auto_14658 ) ( not ( = ?auto_14689 ?auto_14656 ) ) ( HOIST-AT ?auto_14684 ?auto_14689 ) ( AVAILABLE ?auto_14684 ) ( SURFACE-AT ?auto_14641 ?auto_14689 ) ( ON ?auto_14641 ?auto_14662 ) ( CLEAR ?auto_14641 ) ( TRUCK-AT ?auto_14654 ?auto_14656 ) ( not ( = ?auto_14640 ?auto_14641 ) ) ( not ( = ?auto_14640 ?auto_14662 ) ) ( not ( = ?auto_14641 ?auto_14662 ) ) ( not ( = ?auto_14658 ?auto_14684 ) ) ( not ( = ?auto_14640 ?auto_14642 ) ) ( not ( = ?auto_14640 ?auto_14687 ) ) ( not ( = ?auto_14642 ?auto_14662 ) ) ( not ( = ?auto_14680 ?auto_14689 ) ) ( not ( = ?auto_14670 ?auto_14684 ) ) ( not ( = ?auto_14687 ?auto_14662 ) ) ( not ( = ?auto_14640 ?auto_14643 ) ) ( not ( = ?auto_14640 ?auto_14681 ) ) ( not ( = ?auto_14641 ?auto_14643 ) ) ( not ( = ?auto_14641 ?auto_14681 ) ) ( not ( = ?auto_14643 ?auto_14687 ) ) ( not ( = ?auto_14643 ?auto_14662 ) ) ( not ( = ?auto_14667 ?auto_14680 ) ) ( not ( = ?auto_14667 ?auto_14689 ) ) ( not ( = ?auto_14666 ?auto_14670 ) ) ( not ( = ?auto_14666 ?auto_14684 ) ) ( not ( = ?auto_14681 ?auto_14687 ) ) ( not ( = ?auto_14681 ?auto_14662 ) ) ( not ( = ?auto_14640 ?auto_14644 ) ) ( not ( = ?auto_14640 ?auto_14685 ) ) ( not ( = ?auto_14641 ?auto_14644 ) ) ( not ( = ?auto_14641 ?auto_14685 ) ) ( not ( = ?auto_14642 ?auto_14644 ) ) ( not ( = ?auto_14642 ?auto_14685 ) ) ( not ( = ?auto_14644 ?auto_14681 ) ) ( not ( = ?auto_14644 ?auto_14687 ) ) ( not ( = ?auto_14644 ?auto_14662 ) ) ( not ( = ?auto_14683 ?auto_14667 ) ) ( not ( = ?auto_14683 ?auto_14680 ) ) ( not ( = ?auto_14683 ?auto_14689 ) ) ( not ( = ?auto_14664 ?auto_14666 ) ) ( not ( = ?auto_14664 ?auto_14670 ) ) ( not ( = ?auto_14664 ?auto_14684 ) ) ( not ( = ?auto_14685 ?auto_14681 ) ) ( not ( = ?auto_14685 ?auto_14687 ) ) ( not ( = ?auto_14685 ?auto_14662 ) ) ( not ( = ?auto_14640 ?auto_14645 ) ) ( not ( = ?auto_14640 ?auto_14672 ) ) ( not ( = ?auto_14641 ?auto_14645 ) ) ( not ( = ?auto_14641 ?auto_14672 ) ) ( not ( = ?auto_14642 ?auto_14645 ) ) ( not ( = ?auto_14642 ?auto_14672 ) ) ( not ( = ?auto_14643 ?auto_14645 ) ) ( not ( = ?auto_14643 ?auto_14672 ) ) ( not ( = ?auto_14645 ?auto_14685 ) ) ( not ( = ?auto_14645 ?auto_14681 ) ) ( not ( = ?auto_14645 ?auto_14687 ) ) ( not ( = ?auto_14645 ?auto_14662 ) ) ( not ( = ?auto_14668 ?auto_14683 ) ) ( not ( = ?auto_14668 ?auto_14667 ) ) ( not ( = ?auto_14668 ?auto_14680 ) ) ( not ( = ?auto_14668 ?auto_14689 ) ) ( not ( = ?auto_14677 ?auto_14664 ) ) ( not ( = ?auto_14677 ?auto_14666 ) ) ( not ( = ?auto_14677 ?auto_14670 ) ) ( not ( = ?auto_14677 ?auto_14684 ) ) ( not ( = ?auto_14672 ?auto_14685 ) ) ( not ( = ?auto_14672 ?auto_14681 ) ) ( not ( = ?auto_14672 ?auto_14687 ) ) ( not ( = ?auto_14672 ?auto_14662 ) ) ( not ( = ?auto_14640 ?auto_14646 ) ) ( not ( = ?auto_14640 ?auto_14660 ) ) ( not ( = ?auto_14641 ?auto_14646 ) ) ( not ( = ?auto_14641 ?auto_14660 ) ) ( not ( = ?auto_14642 ?auto_14646 ) ) ( not ( = ?auto_14642 ?auto_14660 ) ) ( not ( = ?auto_14643 ?auto_14646 ) ) ( not ( = ?auto_14643 ?auto_14660 ) ) ( not ( = ?auto_14644 ?auto_14646 ) ) ( not ( = ?auto_14644 ?auto_14660 ) ) ( not ( = ?auto_14646 ?auto_14672 ) ) ( not ( = ?auto_14646 ?auto_14685 ) ) ( not ( = ?auto_14646 ?auto_14681 ) ) ( not ( = ?auto_14646 ?auto_14687 ) ) ( not ( = ?auto_14646 ?auto_14662 ) ) ( not ( = ?auto_14663 ?auto_14668 ) ) ( not ( = ?auto_14663 ?auto_14683 ) ) ( not ( = ?auto_14663 ?auto_14667 ) ) ( not ( = ?auto_14663 ?auto_14680 ) ) ( not ( = ?auto_14663 ?auto_14689 ) ) ( not ( = ?auto_14669 ?auto_14677 ) ) ( not ( = ?auto_14669 ?auto_14664 ) ) ( not ( = ?auto_14669 ?auto_14666 ) ) ( not ( = ?auto_14669 ?auto_14670 ) ) ( not ( = ?auto_14669 ?auto_14684 ) ) ( not ( = ?auto_14660 ?auto_14672 ) ) ( not ( = ?auto_14660 ?auto_14685 ) ) ( not ( = ?auto_14660 ?auto_14681 ) ) ( not ( = ?auto_14660 ?auto_14687 ) ) ( not ( = ?auto_14660 ?auto_14662 ) ) ( not ( = ?auto_14640 ?auto_14647 ) ) ( not ( = ?auto_14640 ?auto_14671 ) ) ( not ( = ?auto_14641 ?auto_14647 ) ) ( not ( = ?auto_14641 ?auto_14671 ) ) ( not ( = ?auto_14642 ?auto_14647 ) ) ( not ( = ?auto_14642 ?auto_14671 ) ) ( not ( = ?auto_14643 ?auto_14647 ) ) ( not ( = ?auto_14643 ?auto_14671 ) ) ( not ( = ?auto_14644 ?auto_14647 ) ) ( not ( = ?auto_14644 ?auto_14671 ) ) ( not ( = ?auto_14645 ?auto_14647 ) ) ( not ( = ?auto_14645 ?auto_14671 ) ) ( not ( = ?auto_14647 ?auto_14660 ) ) ( not ( = ?auto_14647 ?auto_14672 ) ) ( not ( = ?auto_14647 ?auto_14685 ) ) ( not ( = ?auto_14647 ?auto_14681 ) ) ( not ( = ?auto_14647 ?auto_14687 ) ) ( not ( = ?auto_14647 ?auto_14662 ) ) ( not ( = ?auto_14671 ?auto_14660 ) ) ( not ( = ?auto_14671 ?auto_14672 ) ) ( not ( = ?auto_14671 ?auto_14685 ) ) ( not ( = ?auto_14671 ?auto_14681 ) ) ( not ( = ?auto_14671 ?auto_14687 ) ) ( not ( = ?auto_14671 ?auto_14662 ) ) ( not ( = ?auto_14640 ?auto_14648 ) ) ( not ( = ?auto_14640 ?auto_14682 ) ) ( not ( = ?auto_14641 ?auto_14648 ) ) ( not ( = ?auto_14641 ?auto_14682 ) ) ( not ( = ?auto_14642 ?auto_14648 ) ) ( not ( = ?auto_14642 ?auto_14682 ) ) ( not ( = ?auto_14643 ?auto_14648 ) ) ( not ( = ?auto_14643 ?auto_14682 ) ) ( not ( = ?auto_14644 ?auto_14648 ) ) ( not ( = ?auto_14644 ?auto_14682 ) ) ( not ( = ?auto_14645 ?auto_14648 ) ) ( not ( = ?auto_14645 ?auto_14682 ) ) ( not ( = ?auto_14646 ?auto_14648 ) ) ( not ( = ?auto_14646 ?auto_14682 ) ) ( not ( = ?auto_14648 ?auto_14671 ) ) ( not ( = ?auto_14648 ?auto_14660 ) ) ( not ( = ?auto_14648 ?auto_14672 ) ) ( not ( = ?auto_14648 ?auto_14685 ) ) ( not ( = ?auto_14648 ?auto_14681 ) ) ( not ( = ?auto_14648 ?auto_14687 ) ) ( not ( = ?auto_14648 ?auto_14662 ) ) ( not ( = ?auto_14686 ?auto_14683 ) ) ( not ( = ?auto_14686 ?auto_14663 ) ) ( not ( = ?auto_14686 ?auto_14668 ) ) ( not ( = ?auto_14686 ?auto_14667 ) ) ( not ( = ?auto_14686 ?auto_14680 ) ) ( not ( = ?auto_14686 ?auto_14689 ) ) ( not ( = ?auto_14679 ?auto_14664 ) ) ( not ( = ?auto_14679 ?auto_14669 ) ) ( not ( = ?auto_14679 ?auto_14677 ) ) ( not ( = ?auto_14679 ?auto_14666 ) ) ( not ( = ?auto_14679 ?auto_14670 ) ) ( not ( = ?auto_14679 ?auto_14684 ) ) ( not ( = ?auto_14682 ?auto_14671 ) ) ( not ( = ?auto_14682 ?auto_14660 ) ) ( not ( = ?auto_14682 ?auto_14672 ) ) ( not ( = ?auto_14682 ?auto_14685 ) ) ( not ( = ?auto_14682 ?auto_14681 ) ) ( not ( = ?auto_14682 ?auto_14687 ) ) ( not ( = ?auto_14682 ?auto_14662 ) ) ( not ( = ?auto_14640 ?auto_14649 ) ) ( not ( = ?auto_14640 ?auto_14674 ) ) ( not ( = ?auto_14641 ?auto_14649 ) ) ( not ( = ?auto_14641 ?auto_14674 ) ) ( not ( = ?auto_14642 ?auto_14649 ) ) ( not ( = ?auto_14642 ?auto_14674 ) ) ( not ( = ?auto_14643 ?auto_14649 ) ) ( not ( = ?auto_14643 ?auto_14674 ) ) ( not ( = ?auto_14644 ?auto_14649 ) ) ( not ( = ?auto_14644 ?auto_14674 ) ) ( not ( = ?auto_14645 ?auto_14649 ) ) ( not ( = ?auto_14645 ?auto_14674 ) ) ( not ( = ?auto_14646 ?auto_14649 ) ) ( not ( = ?auto_14646 ?auto_14674 ) ) ( not ( = ?auto_14647 ?auto_14649 ) ) ( not ( = ?auto_14647 ?auto_14674 ) ) ( not ( = ?auto_14649 ?auto_14682 ) ) ( not ( = ?auto_14649 ?auto_14671 ) ) ( not ( = ?auto_14649 ?auto_14660 ) ) ( not ( = ?auto_14649 ?auto_14672 ) ) ( not ( = ?auto_14649 ?auto_14685 ) ) ( not ( = ?auto_14649 ?auto_14681 ) ) ( not ( = ?auto_14649 ?auto_14687 ) ) ( not ( = ?auto_14649 ?auto_14662 ) ) ( not ( = ?auto_14676 ?auto_14686 ) ) ( not ( = ?auto_14676 ?auto_14683 ) ) ( not ( = ?auto_14676 ?auto_14663 ) ) ( not ( = ?auto_14676 ?auto_14668 ) ) ( not ( = ?auto_14676 ?auto_14667 ) ) ( not ( = ?auto_14676 ?auto_14680 ) ) ( not ( = ?auto_14676 ?auto_14689 ) ) ( not ( = ?auto_14688 ?auto_14679 ) ) ( not ( = ?auto_14688 ?auto_14664 ) ) ( not ( = ?auto_14688 ?auto_14669 ) ) ( not ( = ?auto_14688 ?auto_14677 ) ) ( not ( = ?auto_14688 ?auto_14666 ) ) ( not ( = ?auto_14688 ?auto_14670 ) ) ( not ( = ?auto_14688 ?auto_14684 ) ) ( not ( = ?auto_14674 ?auto_14682 ) ) ( not ( = ?auto_14674 ?auto_14671 ) ) ( not ( = ?auto_14674 ?auto_14660 ) ) ( not ( = ?auto_14674 ?auto_14672 ) ) ( not ( = ?auto_14674 ?auto_14685 ) ) ( not ( = ?auto_14674 ?auto_14681 ) ) ( not ( = ?auto_14674 ?auto_14687 ) ) ( not ( = ?auto_14674 ?auto_14662 ) ) ( not ( = ?auto_14640 ?auto_14650 ) ) ( not ( = ?auto_14640 ?auto_14675 ) ) ( not ( = ?auto_14641 ?auto_14650 ) ) ( not ( = ?auto_14641 ?auto_14675 ) ) ( not ( = ?auto_14642 ?auto_14650 ) ) ( not ( = ?auto_14642 ?auto_14675 ) ) ( not ( = ?auto_14643 ?auto_14650 ) ) ( not ( = ?auto_14643 ?auto_14675 ) ) ( not ( = ?auto_14644 ?auto_14650 ) ) ( not ( = ?auto_14644 ?auto_14675 ) ) ( not ( = ?auto_14645 ?auto_14650 ) ) ( not ( = ?auto_14645 ?auto_14675 ) ) ( not ( = ?auto_14646 ?auto_14650 ) ) ( not ( = ?auto_14646 ?auto_14675 ) ) ( not ( = ?auto_14647 ?auto_14650 ) ) ( not ( = ?auto_14647 ?auto_14675 ) ) ( not ( = ?auto_14648 ?auto_14650 ) ) ( not ( = ?auto_14648 ?auto_14675 ) ) ( not ( = ?auto_14650 ?auto_14674 ) ) ( not ( = ?auto_14650 ?auto_14682 ) ) ( not ( = ?auto_14650 ?auto_14671 ) ) ( not ( = ?auto_14650 ?auto_14660 ) ) ( not ( = ?auto_14650 ?auto_14672 ) ) ( not ( = ?auto_14650 ?auto_14685 ) ) ( not ( = ?auto_14650 ?auto_14681 ) ) ( not ( = ?auto_14650 ?auto_14687 ) ) ( not ( = ?auto_14650 ?auto_14662 ) ) ( not ( = ?auto_14661 ?auto_14676 ) ) ( not ( = ?auto_14661 ?auto_14686 ) ) ( not ( = ?auto_14661 ?auto_14683 ) ) ( not ( = ?auto_14661 ?auto_14663 ) ) ( not ( = ?auto_14661 ?auto_14668 ) ) ( not ( = ?auto_14661 ?auto_14667 ) ) ( not ( = ?auto_14661 ?auto_14680 ) ) ( not ( = ?auto_14661 ?auto_14689 ) ) ( not ( = ?auto_14665 ?auto_14688 ) ) ( not ( = ?auto_14665 ?auto_14679 ) ) ( not ( = ?auto_14665 ?auto_14664 ) ) ( not ( = ?auto_14665 ?auto_14669 ) ) ( not ( = ?auto_14665 ?auto_14677 ) ) ( not ( = ?auto_14665 ?auto_14666 ) ) ( not ( = ?auto_14665 ?auto_14670 ) ) ( not ( = ?auto_14665 ?auto_14684 ) ) ( not ( = ?auto_14675 ?auto_14674 ) ) ( not ( = ?auto_14675 ?auto_14682 ) ) ( not ( = ?auto_14675 ?auto_14671 ) ) ( not ( = ?auto_14675 ?auto_14660 ) ) ( not ( = ?auto_14675 ?auto_14672 ) ) ( not ( = ?auto_14675 ?auto_14685 ) ) ( not ( = ?auto_14675 ?auto_14681 ) ) ( not ( = ?auto_14675 ?auto_14687 ) ) ( not ( = ?auto_14675 ?auto_14662 ) ) ( not ( = ?auto_14640 ?auto_14651 ) ) ( not ( = ?auto_14640 ?auto_14673 ) ) ( not ( = ?auto_14641 ?auto_14651 ) ) ( not ( = ?auto_14641 ?auto_14673 ) ) ( not ( = ?auto_14642 ?auto_14651 ) ) ( not ( = ?auto_14642 ?auto_14673 ) ) ( not ( = ?auto_14643 ?auto_14651 ) ) ( not ( = ?auto_14643 ?auto_14673 ) ) ( not ( = ?auto_14644 ?auto_14651 ) ) ( not ( = ?auto_14644 ?auto_14673 ) ) ( not ( = ?auto_14645 ?auto_14651 ) ) ( not ( = ?auto_14645 ?auto_14673 ) ) ( not ( = ?auto_14646 ?auto_14651 ) ) ( not ( = ?auto_14646 ?auto_14673 ) ) ( not ( = ?auto_14647 ?auto_14651 ) ) ( not ( = ?auto_14647 ?auto_14673 ) ) ( not ( = ?auto_14648 ?auto_14651 ) ) ( not ( = ?auto_14648 ?auto_14673 ) ) ( not ( = ?auto_14649 ?auto_14651 ) ) ( not ( = ?auto_14649 ?auto_14673 ) ) ( not ( = ?auto_14651 ?auto_14675 ) ) ( not ( = ?auto_14651 ?auto_14674 ) ) ( not ( = ?auto_14651 ?auto_14682 ) ) ( not ( = ?auto_14651 ?auto_14671 ) ) ( not ( = ?auto_14651 ?auto_14660 ) ) ( not ( = ?auto_14651 ?auto_14672 ) ) ( not ( = ?auto_14651 ?auto_14685 ) ) ( not ( = ?auto_14651 ?auto_14681 ) ) ( not ( = ?auto_14651 ?auto_14687 ) ) ( not ( = ?auto_14651 ?auto_14662 ) ) ( not ( = ?auto_14673 ?auto_14675 ) ) ( not ( = ?auto_14673 ?auto_14674 ) ) ( not ( = ?auto_14673 ?auto_14682 ) ) ( not ( = ?auto_14673 ?auto_14671 ) ) ( not ( = ?auto_14673 ?auto_14660 ) ) ( not ( = ?auto_14673 ?auto_14672 ) ) ( not ( = ?auto_14673 ?auto_14685 ) ) ( not ( = ?auto_14673 ?auto_14681 ) ) ( not ( = ?auto_14673 ?auto_14687 ) ) ( not ( = ?auto_14673 ?auto_14662 ) ) ( not ( = ?auto_14640 ?auto_14652 ) ) ( not ( = ?auto_14640 ?auto_14678 ) ) ( not ( = ?auto_14641 ?auto_14652 ) ) ( not ( = ?auto_14641 ?auto_14678 ) ) ( not ( = ?auto_14642 ?auto_14652 ) ) ( not ( = ?auto_14642 ?auto_14678 ) ) ( not ( = ?auto_14643 ?auto_14652 ) ) ( not ( = ?auto_14643 ?auto_14678 ) ) ( not ( = ?auto_14644 ?auto_14652 ) ) ( not ( = ?auto_14644 ?auto_14678 ) ) ( not ( = ?auto_14645 ?auto_14652 ) ) ( not ( = ?auto_14645 ?auto_14678 ) ) ( not ( = ?auto_14646 ?auto_14652 ) ) ( not ( = ?auto_14646 ?auto_14678 ) ) ( not ( = ?auto_14647 ?auto_14652 ) ) ( not ( = ?auto_14647 ?auto_14678 ) ) ( not ( = ?auto_14648 ?auto_14652 ) ) ( not ( = ?auto_14648 ?auto_14678 ) ) ( not ( = ?auto_14649 ?auto_14652 ) ) ( not ( = ?auto_14649 ?auto_14678 ) ) ( not ( = ?auto_14650 ?auto_14652 ) ) ( not ( = ?auto_14650 ?auto_14678 ) ) ( not ( = ?auto_14652 ?auto_14673 ) ) ( not ( = ?auto_14652 ?auto_14675 ) ) ( not ( = ?auto_14652 ?auto_14674 ) ) ( not ( = ?auto_14652 ?auto_14682 ) ) ( not ( = ?auto_14652 ?auto_14671 ) ) ( not ( = ?auto_14652 ?auto_14660 ) ) ( not ( = ?auto_14652 ?auto_14672 ) ) ( not ( = ?auto_14652 ?auto_14685 ) ) ( not ( = ?auto_14652 ?auto_14681 ) ) ( not ( = ?auto_14652 ?auto_14687 ) ) ( not ( = ?auto_14652 ?auto_14662 ) ) ( not ( = ?auto_14678 ?auto_14673 ) ) ( not ( = ?auto_14678 ?auto_14675 ) ) ( not ( = ?auto_14678 ?auto_14674 ) ) ( not ( = ?auto_14678 ?auto_14682 ) ) ( not ( = ?auto_14678 ?auto_14671 ) ) ( not ( = ?auto_14678 ?auto_14660 ) ) ( not ( = ?auto_14678 ?auto_14672 ) ) ( not ( = ?auto_14678 ?auto_14685 ) ) ( not ( = ?auto_14678 ?auto_14681 ) ) ( not ( = ?auto_14678 ?auto_14687 ) ) ( not ( = ?auto_14678 ?auto_14662 ) ) ( not ( = ?auto_14640 ?auto_14653 ) ) ( not ( = ?auto_14640 ?auto_14657 ) ) ( not ( = ?auto_14641 ?auto_14653 ) ) ( not ( = ?auto_14641 ?auto_14657 ) ) ( not ( = ?auto_14642 ?auto_14653 ) ) ( not ( = ?auto_14642 ?auto_14657 ) ) ( not ( = ?auto_14643 ?auto_14653 ) ) ( not ( = ?auto_14643 ?auto_14657 ) ) ( not ( = ?auto_14644 ?auto_14653 ) ) ( not ( = ?auto_14644 ?auto_14657 ) ) ( not ( = ?auto_14645 ?auto_14653 ) ) ( not ( = ?auto_14645 ?auto_14657 ) ) ( not ( = ?auto_14646 ?auto_14653 ) ) ( not ( = ?auto_14646 ?auto_14657 ) ) ( not ( = ?auto_14647 ?auto_14653 ) ) ( not ( = ?auto_14647 ?auto_14657 ) ) ( not ( = ?auto_14648 ?auto_14653 ) ) ( not ( = ?auto_14648 ?auto_14657 ) ) ( not ( = ?auto_14649 ?auto_14653 ) ) ( not ( = ?auto_14649 ?auto_14657 ) ) ( not ( = ?auto_14650 ?auto_14653 ) ) ( not ( = ?auto_14650 ?auto_14657 ) ) ( not ( = ?auto_14651 ?auto_14653 ) ) ( not ( = ?auto_14651 ?auto_14657 ) ) ( not ( = ?auto_14653 ?auto_14678 ) ) ( not ( = ?auto_14653 ?auto_14673 ) ) ( not ( = ?auto_14653 ?auto_14675 ) ) ( not ( = ?auto_14653 ?auto_14674 ) ) ( not ( = ?auto_14653 ?auto_14682 ) ) ( not ( = ?auto_14653 ?auto_14671 ) ) ( not ( = ?auto_14653 ?auto_14660 ) ) ( not ( = ?auto_14653 ?auto_14672 ) ) ( not ( = ?auto_14653 ?auto_14685 ) ) ( not ( = ?auto_14653 ?auto_14681 ) ) ( not ( = ?auto_14653 ?auto_14687 ) ) ( not ( = ?auto_14653 ?auto_14662 ) ) ( not ( = ?auto_14655 ?auto_14667 ) ) ( not ( = ?auto_14655 ?auto_14686 ) ) ( not ( = ?auto_14655 ?auto_14661 ) ) ( not ( = ?auto_14655 ?auto_14676 ) ) ( not ( = ?auto_14655 ?auto_14683 ) ) ( not ( = ?auto_14655 ?auto_14663 ) ) ( not ( = ?auto_14655 ?auto_14668 ) ) ( not ( = ?auto_14655 ?auto_14680 ) ) ( not ( = ?auto_14655 ?auto_14689 ) ) ( not ( = ?auto_14659 ?auto_14666 ) ) ( not ( = ?auto_14659 ?auto_14679 ) ) ( not ( = ?auto_14659 ?auto_14665 ) ) ( not ( = ?auto_14659 ?auto_14688 ) ) ( not ( = ?auto_14659 ?auto_14664 ) ) ( not ( = ?auto_14659 ?auto_14669 ) ) ( not ( = ?auto_14659 ?auto_14677 ) ) ( not ( = ?auto_14659 ?auto_14670 ) ) ( not ( = ?auto_14659 ?auto_14684 ) ) ( not ( = ?auto_14657 ?auto_14678 ) ) ( not ( = ?auto_14657 ?auto_14673 ) ) ( not ( = ?auto_14657 ?auto_14675 ) ) ( not ( = ?auto_14657 ?auto_14674 ) ) ( not ( = ?auto_14657 ?auto_14682 ) ) ( not ( = ?auto_14657 ?auto_14671 ) ) ( not ( = ?auto_14657 ?auto_14660 ) ) ( not ( = ?auto_14657 ?auto_14672 ) ) ( not ( = ?auto_14657 ?auto_14685 ) ) ( not ( = ?auto_14657 ?auto_14681 ) ) ( not ( = ?auto_14657 ?auto_14687 ) ) ( not ( = ?auto_14657 ?auto_14662 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_14640 ?auto_14641 ?auto_14642 ?auto_14643 ?auto_14644 ?auto_14645 ?auto_14646 ?auto_14647 ?auto_14648 ?auto_14649 ?auto_14650 ?auto_14651 ?auto_14652 )
      ( MAKE-1CRATE ?auto_14652 ?auto_14653 )
      ( MAKE-13CRATE-VERIFY ?auto_14640 ?auto_14641 ?auto_14642 ?auto_14643 ?auto_14644 ?auto_14645 ?auto_14646 ?auto_14647 ?auto_14648 ?auto_14649 ?auto_14650 ?auto_14651 ?auto_14652 ?auto_14653 ) )
  )

)

