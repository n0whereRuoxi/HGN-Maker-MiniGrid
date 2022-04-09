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
      ?auto_1108107 - SURFACE
      ?auto_1108108 - SURFACE
    )
    :vars
    (
      ?auto_1108109 - HOIST
      ?auto_1108110 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108109 ?auto_1108110 ) ( SURFACE-AT ?auto_1108107 ?auto_1108110 ) ( CLEAR ?auto_1108107 ) ( LIFTING ?auto_1108109 ?auto_1108108 ) ( IS-CRATE ?auto_1108108 ) ( not ( = ?auto_1108107 ?auto_1108108 ) ) )
    :subtasks
    ( ( !DROP ?auto_1108109 ?auto_1108108 ?auto_1108107 ?auto_1108110 )
      ( MAKE-1CRATE-VERIFY ?auto_1108107 ?auto_1108108 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108111 - SURFACE
      ?auto_1108112 - SURFACE
    )
    :vars
    (
      ?auto_1108114 - HOIST
      ?auto_1108113 - PLACE
      ?auto_1108115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108114 ?auto_1108113 ) ( SURFACE-AT ?auto_1108111 ?auto_1108113 ) ( CLEAR ?auto_1108111 ) ( IS-CRATE ?auto_1108112 ) ( not ( = ?auto_1108111 ?auto_1108112 ) ) ( TRUCK-AT ?auto_1108115 ?auto_1108113 ) ( AVAILABLE ?auto_1108114 ) ( IN ?auto_1108112 ?auto_1108115 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1108114 ?auto_1108112 ?auto_1108115 ?auto_1108113 )
      ( MAKE-1CRATE ?auto_1108111 ?auto_1108112 )
      ( MAKE-1CRATE-VERIFY ?auto_1108111 ?auto_1108112 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108116 - SURFACE
      ?auto_1108117 - SURFACE
    )
    :vars
    (
      ?auto_1108120 - HOIST
      ?auto_1108118 - PLACE
      ?auto_1108119 - TRUCK
      ?auto_1108121 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108120 ?auto_1108118 ) ( SURFACE-AT ?auto_1108116 ?auto_1108118 ) ( CLEAR ?auto_1108116 ) ( IS-CRATE ?auto_1108117 ) ( not ( = ?auto_1108116 ?auto_1108117 ) ) ( AVAILABLE ?auto_1108120 ) ( IN ?auto_1108117 ?auto_1108119 ) ( TRUCK-AT ?auto_1108119 ?auto_1108121 ) ( not ( = ?auto_1108121 ?auto_1108118 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1108119 ?auto_1108121 ?auto_1108118 )
      ( MAKE-1CRATE ?auto_1108116 ?auto_1108117 )
      ( MAKE-1CRATE-VERIFY ?auto_1108116 ?auto_1108117 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108122 - SURFACE
      ?auto_1108123 - SURFACE
    )
    :vars
    (
      ?auto_1108124 - HOIST
      ?auto_1108126 - PLACE
      ?auto_1108127 - TRUCK
      ?auto_1108125 - PLACE
      ?auto_1108128 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108124 ?auto_1108126 ) ( SURFACE-AT ?auto_1108122 ?auto_1108126 ) ( CLEAR ?auto_1108122 ) ( IS-CRATE ?auto_1108123 ) ( not ( = ?auto_1108122 ?auto_1108123 ) ) ( AVAILABLE ?auto_1108124 ) ( TRUCK-AT ?auto_1108127 ?auto_1108125 ) ( not ( = ?auto_1108125 ?auto_1108126 ) ) ( HOIST-AT ?auto_1108128 ?auto_1108125 ) ( LIFTING ?auto_1108128 ?auto_1108123 ) ( not ( = ?auto_1108124 ?auto_1108128 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1108128 ?auto_1108123 ?auto_1108127 ?auto_1108125 )
      ( MAKE-1CRATE ?auto_1108122 ?auto_1108123 )
      ( MAKE-1CRATE-VERIFY ?auto_1108122 ?auto_1108123 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108129 - SURFACE
      ?auto_1108130 - SURFACE
    )
    :vars
    (
      ?auto_1108131 - HOIST
      ?auto_1108133 - PLACE
      ?auto_1108132 - TRUCK
      ?auto_1108135 - PLACE
      ?auto_1108134 - HOIST
      ?auto_1108136 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108131 ?auto_1108133 ) ( SURFACE-AT ?auto_1108129 ?auto_1108133 ) ( CLEAR ?auto_1108129 ) ( IS-CRATE ?auto_1108130 ) ( not ( = ?auto_1108129 ?auto_1108130 ) ) ( AVAILABLE ?auto_1108131 ) ( TRUCK-AT ?auto_1108132 ?auto_1108135 ) ( not ( = ?auto_1108135 ?auto_1108133 ) ) ( HOIST-AT ?auto_1108134 ?auto_1108135 ) ( not ( = ?auto_1108131 ?auto_1108134 ) ) ( AVAILABLE ?auto_1108134 ) ( SURFACE-AT ?auto_1108130 ?auto_1108135 ) ( ON ?auto_1108130 ?auto_1108136 ) ( CLEAR ?auto_1108130 ) ( not ( = ?auto_1108129 ?auto_1108136 ) ) ( not ( = ?auto_1108130 ?auto_1108136 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1108134 ?auto_1108130 ?auto_1108136 ?auto_1108135 )
      ( MAKE-1CRATE ?auto_1108129 ?auto_1108130 )
      ( MAKE-1CRATE-VERIFY ?auto_1108129 ?auto_1108130 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108137 - SURFACE
      ?auto_1108138 - SURFACE
    )
    :vars
    (
      ?auto_1108139 - HOIST
      ?auto_1108140 - PLACE
      ?auto_1108141 - PLACE
      ?auto_1108142 - HOIST
      ?auto_1108143 - SURFACE
      ?auto_1108144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108139 ?auto_1108140 ) ( SURFACE-AT ?auto_1108137 ?auto_1108140 ) ( CLEAR ?auto_1108137 ) ( IS-CRATE ?auto_1108138 ) ( not ( = ?auto_1108137 ?auto_1108138 ) ) ( AVAILABLE ?auto_1108139 ) ( not ( = ?auto_1108141 ?auto_1108140 ) ) ( HOIST-AT ?auto_1108142 ?auto_1108141 ) ( not ( = ?auto_1108139 ?auto_1108142 ) ) ( AVAILABLE ?auto_1108142 ) ( SURFACE-AT ?auto_1108138 ?auto_1108141 ) ( ON ?auto_1108138 ?auto_1108143 ) ( CLEAR ?auto_1108138 ) ( not ( = ?auto_1108137 ?auto_1108143 ) ) ( not ( = ?auto_1108138 ?auto_1108143 ) ) ( TRUCK-AT ?auto_1108144 ?auto_1108140 ) )
    :subtasks
    ( ( !DRIVE ?auto_1108144 ?auto_1108140 ?auto_1108141 )
      ( MAKE-1CRATE ?auto_1108137 ?auto_1108138 )
      ( MAKE-1CRATE-VERIFY ?auto_1108137 ?auto_1108138 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1108154 - SURFACE
      ?auto_1108155 - SURFACE
      ?auto_1108156 - SURFACE
    )
    :vars
    (
      ?auto_1108158 - HOIST
      ?auto_1108157 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108158 ?auto_1108157 ) ( SURFACE-AT ?auto_1108155 ?auto_1108157 ) ( CLEAR ?auto_1108155 ) ( LIFTING ?auto_1108158 ?auto_1108156 ) ( IS-CRATE ?auto_1108156 ) ( not ( = ?auto_1108155 ?auto_1108156 ) ) ( ON ?auto_1108155 ?auto_1108154 ) ( not ( = ?auto_1108154 ?auto_1108155 ) ) ( not ( = ?auto_1108154 ?auto_1108156 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1108155 ?auto_1108156 )
      ( MAKE-2CRATE-VERIFY ?auto_1108154 ?auto_1108155 ?auto_1108156 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1108164 - SURFACE
      ?auto_1108165 - SURFACE
      ?auto_1108166 - SURFACE
    )
    :vars
    (
      ?auto_1108168 - HOIST
      ?auto_1108167 - PLACE
      ?auto_1108169 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108168 ?auto_1108167 ) ( SURFACE-AT ?auto_1108165 ?auto_1108167 ) ( CLEAR ?auto_1108165 ) ( IS-CRATE ?auto_1108166 ) ( not ( = ?auto_1108165 ?auto_1108166 ) ) ( TRUCK-AT ?auto_1108169 ?auto_1108167 ) ( AVAILABLE ?auto_1108168 ) ( IN ?auto_1108166 ?auto_1108169 ) ( ON ?auto_1108165 ?auto_1108164 ) ( not ( = ?auto_1108164 ?auto_1108165 ) ) ( not ( = ?auto_1108164 ?auto_1108166 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1108165 ?auto_1108166 )
      ( MAKE-2CRATE-VERIFY ?auto_1108164 ?auto_1108165 ?auto_1108166 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108170 - SURFACE
      ?auto_1108171 - SURFACE
    )
    :vars
    (
      ?auto_1108175 - HOIST
      ?auto_1108172 - PLACE
      ?auto_1108174 - TRUCK
      ?auto_1108173 - SURFACE
      ?auto_1108176 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108175 ?auto_1108172 ) ( SURFACE-AT ?auto_1108170 ?auto_1108172 ) ( CLEAR ?auto_1108170 ) ( IS-CRATE ?auto_1108171 ) ( not ( = ?auto_1108170 ?auto_1108171 ) ) ( AVAILABLE ?auto_1108175 ) ( IN ?auto_1108171 ?auto_1108174 ) ( ON ?auto_1108170 ?auto_1108173 ) ( not ( = ?auto_1108173 ?auto_1108170 ) ) ( not ( = ?auto_1108173 ?auto_1108171 ) ) ( TRUCK-AT ?auto_1108174 ?auto_1108176 ) ( not ( = ?auto_1108176 ?auto_1108172 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1108174 ?auto_1108176 ?auto_1108172 )
      ( MAKE-2CRATE ?auto_1108173 ?auto_1108170 ?auto_1108171 )
      ( MAKE-1CRATE-VERIFY ?auto_1108170 ?auto_1108171 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1108177 - SURFACE
      ?auto_1108178 - SURFACE
      ?auto_1108179 - SURFACE
    )
    :vars
    (
      ?auto_1108183 - HOIST
      ?auto_1108180 - PLACE
      ?auto_1108182 - TRUCK
      ?auto_1108181 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108183 ?auto_1108180 ) ( SURFACE-AT ?auto_1108178 ?auto_1108180 ) ( CLEAR ?auto_1108178 ) ( IS-CRATE ?auto_1108179 ) ( not ( = ?auto_1108178 ?auto_1108179 ) ) ( AVAILABLE ?auto_1108183 ) ( IN ?auto_1108179 ?auto_1108182 ) ( ON ?auto_1108178 ?auto_1108177 ) ( not ( = ?auto_1108177 ?auto_1108178 ) ) ( not ( = ?auto_1108177 ?auto_1108179 ) ) ( TRUCK-AT ?auto_1108182 ?auto_1108181 ) ( not ( = ?auto_1108181 ?auto_1108180 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1108178 ?auto_1108179 )
      ( MAKE-2CRATE-VERIFY ?auto_1108177 ?auto_1108178 ?auto_1108179 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108184 - SURFACE
      ?auto_1108185 - SURFACE
    )
    :vars
    (
      ?auto_1108187 - HOIST
      ?auto_1108186 - PLACE
      ?auto_1108190 - SURFACE
      ?auto_1108189 - TRUCK
      ?auto_1108188 - PLACE
      ?auto_1108191 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108187 ?auto_1108186 ) ( SURFACE-AT ?auto_1108184 ?auto_1108186 ) ( CLEAR ?auto_1108184 ) ( IS-CRATE ?auto_1108185 ) ( not ( = ?auto_1108184 ?auto_1108185 ) ) ( AVAILABLE ?auto_1108187 ) ( ON ?auto_1108184 ?auto_1108190 ) ( not ( = ?auto_1108190 ?auto_1108184 ) ) ( not ( = ?auto_1108190 ?auto_1108185 ) ) ( TRUCK-AT ?auto_1108189 ?auto_1108188 ) ( not ( = ?auto_1108188 ?auto_1108186 ) ) ( HOIST-AT ?auto_1108191 ?auto_1108188 ) ( LIFTING ?auto_1108191 ?auto_1108185 ) ( not ( = ?auto_1108187 ?auto_1108191 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1108191 ?auto_1108185 ?auto_1108189 ?auto_1108188 )
      ( MAKE-2CRATE ?auto_1108190 ?auto_1108184 ?auto_1108185 )
      ( MAKE-1CRATE-VERIFY ?auto_1108184 ?auto_1108185 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1108192 - SURFACE
      ?auto_1108193 - SURFACE
      ?auto_1108194 - SURFACE
    )
    :vars
    (
      ?auto_1108197 - HOIST
      ?auto_1108196 - PLACE
      ?auto_1108199 - TRUCK
      ?auto_1108195 - PLACE
      ?auto_1108198 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108197 ?auto_1108196 ) ( SURFACE-AT ?auto_1108193 ?auto_1108196 ) ( CLEAR ?auto_1108193 ) ( IS-CRATE ?auto_1108194 ) ( not ( = ?auto_1108193 ?auto_1108194 ) ) ( AVAILABLE ?auto_1108197 ) ( ON ?auto_1108193 ?auto_1108192 ) ( not ( = ?auto_1108192 ?auto_1108193 ) ) ( not ( = ?auto_1108192 ?auto_1108194 ) ) ( TRUCK-AT ?auto_1108199 ?auto_1108195 ) ( not ( = ?auto_1108195 ?auto_1108196 ) ) ( HOIST-AT ?auto_1108198 ?auto_1108195 ) ( LIFTING ?auto_1108198 ?auto_1108194 ) ( not ( = ?auto_1108197 ?auto_1108198 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1108193 ?auto_1108194 )
      ( MAKE-2CRATE-VERIFY ?auto_1108192 ?auto_1108193 ?auto_1108194 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108200 - SURFACE
      ?auto_1108201 - SURFACE
    )
    :vars
    (
      ?auto_1108207 - HOIST
      ?auto_1108204 - PLACE
      ?auto_1108202 - SURFACE
      ?auto_1108203 - TRUCK
      ?auto_1108206 - PLACE
      ?auto_1108205 - HOIST
      ?auto_1108208 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108207 ?auto_1108204 ) ( SURFACE-AT ?auto_1108200 ?auto_1108204 ) ( CLEAR ?auto_1108200 ) ( IS-CRATE ?auto_1108201 ) ( not ( = ?auto_1108200 ?auto_1108201 ) ) ( AVAILABLE ?auto_1108207 ) ( ON ?auto_1108200 ?auto_1108202 ) ( not ( = ?auto_1108202 ?auto_1108200 ) ) ( not ( = ?auto_1108202 ?auto_1108201 ) ) ( TRUCK-AT ?auto_1108203 ?auto_1108206 ) ( not ( = ?auto_1108206 ?auto_1108204 ) ) ( HOIST-AT ?auto_1108205 ?auto_1108206 ) ( not ( = ?auto_1108207 ?auto_1108205 ) ) ( AVAILABLE ?auto_1108205 ) ( SURFACE-AT ?auto_1108201 ?auto_1108206 ) ( ON ?auto_1108201 ?auto_1108208 ) ( CLEAR ?auto_1108201 ) ( not ( = ?auto_1108200 ?auto_1108208 ) ) ( not ( = ?auto_1108201 ?auto_1108208 ) ) ( not ( = ?auto_1108202 ?auto_1108208 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1108205 ?auto_1108201 ?auto_1108208 ?auto_1108206 )
      ( MAKE-2CRATE ?auto_1108202 ?auto_1108200 ?auto_1108201 )
      ( MAKE-1CRATE-VERIFY ?auto_1108200 ?auto_1108201 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1108209 - SURFACE
      ?auto_1108210 - SURFACE
      ?auto_1108211 - SURFACE
    )
    :vars
    (
      ?auto_1108212 - HOIST
      ?auto_1108216 - PLACE
      ?auto_1108214 - TRUCK
      ?auto_1108217 - PLACE
      ?auto_1108215 - HOIST
      ?auto_1108213 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108212 ?auto_1108216 ) ( SURFACE-AT ?auto_1108210 ?auto_1108216 ) ( CLEAR ?auto_1108210 ) ( IS-CRATE ?auto_1108211 ) ( not ( = ?auto_1108210 ?auto_1108211 ) ) ( AVAILABLE ?auto_1108212 ) ( ON ?auto_1108210 ?auto_1108209 ) ( not ( = ?auto_1108209 ?auto_1108210 ) ) ( not ( = ?auto_1108209 ?auto_1108211 ) ) ( TRUCK-AT ?auto_1108214 ?auto_1108217 ) ( not ( = ?auto_1108217 ?auto_1108216 ) ) ( HOIST-AT ?auto_1108215 ?auto_1108217 ) ( not ( = ?auto_1108212 ?auto_1108215 ) ) ( AVAILABLE ?auto_1108215 ) ( SURFACE-AT ?auto_1108211 ?auto_1108217 ) ( ON ?auto_1108211 ?auto_1108213 ) ( CLEAR ?auto_1108211 ) ( not ( = ?auto_1108210 ?auto_1108213 ) ) ( not ( = ?auto_1108211 ?auto_1108213 ) ) ( not ( = ?auto_1108209 ?auto_1108213 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1108210 ?auto_1108211 )
      ( MAKE-2CRATE-VERIFY ?auto_1108209 ?auto_1108210 ?auto_1108211 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108218 - SURFACE
      ?auto_1108219 - SURFACE
    )
    :vars
    (
      ?auto_1108223 - HOIST
      ?auto_1108222 - PLACE
      ?auto_1108226 - SURFACE
      ?auto_1108221 - PLACE
      ?auto_1108224 - HOIST
      ?auto_1108220 - SURFACE
      ?auto_1108225 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108223 ?auto_1108222 ) ( SURFACE-AT ?auto_1108218 ?auto_1108222 ) ( CLEAR ?auto_1108218 ) ( IS-CRATE ?auto_1108219 ) ( not ( = ?auto_1108218 ?auto_1108219 ) ) ( AVAILABLE ?auto_1108223 ) ( ON ?auto_1108218 ?auto_1108226 ) ( not ( = ?auto_1108226 ?auto_1108218 ) ) ( not ( = ?auto_1108226 ?auto_1108219 ) ) ( not ( = ?auto_1108221 ?auto_1108222 ) ) ( HOIST-AT ?auto_1108224 ?auto_1108221 ) ( not ( = ?auto_1108223 ?auto_1108224 ) ) ( AVAILABLE ?auto_1108224 ) ( SURFACE-AT ?auto_1108219 ?auto_1108221 ) ( ON ?auto_1108219 ?auto_1108220 ) ( CLEAR ?auto_1108219 ) ( not ( = ?auto_1108218 ?auto_1108220 ) ) ( not ( = ?auto_1108219 ?auto_1108220 ) ) ( not ( = ?auto_1108226 ?auto_1108220 ) ) ( TRUCK-AT ?auto_1108225 ?auto_1108222 ) )
    :subtasks
    ( ( !DRIVE ?auto_1108225 ?auto_1108222 ?auto_1108221 )
      ( MAKE-2CRATE ?auto_1108226 ?auto_1108218 ?auto_1108219 )
      ( MAKE-1CRATE-VERIFY ?auto_1108218 ?auto_1108219 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1108227 - SURFACE
      ?auto_1108228 - SURFACE
      ?auto_1108229 - SURFACE
    )
    :vars
    (
      ?auto_1108233 - HOIST
      ?auto_1108232 - PLACE
      ?auto_1108231 - PLACE
      ?auto_1108230 - HOIST
      ?auto_1108234 - SURFACE
      ?auto_1108235 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108233 ?auto_1108232 ) ( SURFACE-AT ?auto_1108228 ?auto_1108232 ) ( CLEAR ?auto_1108228 ) ( IS-CRATE ?auto_1108229 ) ( not ( = ?auto_1108228 ?auto_1108229 ) ) ( AVAILABLE ?auto_1108233 ) ( ON ?auto_1108228 ?auto_1108227 ) ( not ( = ?auto_1108227 ?auto_1108228 ) ) ( not ( = ?auto_1108227 ?auto_1108229 ) ) ( not ( = ?auto_1108231 ?auto_1108232 ) ) ( HOIST-AT ?auto_1108230 ?auto_1108231 ) ( not ( = ?auto_1108233 ?auto_1108230 ) ) ( AVAILABLE ?auto_1108230 ) ( SURFACE-AT ?auto_1108229 ?auto_1108231 ) ( ON ?auto_1108229 ?auto_1108234 ) ( CLEAR ?auto_1108229 ) ( not ( = ?auto_1108228 ?auto_1108234 ) ) ( not ( = ?auto_1108229 ?auto_1108234 ) ) ( not ( = ?auto_1108227 ?auto_1108234 ) ) ( TRUCK-AT ?auto_1108235 ?auto_1108232 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1108228 ?auto_1108229 )
      ( MAKE-2CRATE-VERIFY ?auto_1108227 ?auto_1108228 ?auto_1108229 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108236 - SURFACE
      ?auto_1108237 - SURFACE
    )
    :vars
    (
      ?auto_1108244 - HOIST
      ?auto_1108241 - PLACE
      ?auto_1108238 - SURFACE
      ?auto_1108240 - PLACE
      ?auto_1108242 - HOIST
      ?auto_1108239 - SURFACE
      ?auto_1108243 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108244 ?auto_1108241 ) ( IS-CRATE ?auto_1108237 ) ( not ( = ?auto_1108236 ?auto_1108237 ) ) ( not ( = ?auto_1108238 ?auto_1108236 ) ) ( not ( = ?auto_1108238 ?auto_1108237 ) ) ( not ( = ?auto_1108240 ?auto_1108241 ) ) ( HOIST-AT ?auto_1108242 ?auto_1108240 ) ( not ( = ?auto_1108244 ?auto_1108242 ) ) ( AVAILABLE ?auto_1108242 ) ( SURFACE-AT ?auto_1108237 ?auto_1108240 ) ( ON ?auto_1108237 ?auto_1108239 ) ( CLEAR ?auto_1108237 ) ( not ( = ?auto_1108236 ?auto_1108239 ) ) ( not ( = ?auto_1108237 ?auto_1108239 ) ) ( not ( = ?auto_1108238 ?auto_1108239 ) ) ( TRUCK-AT ?auto_1108243 ?auto_1108241 ) ( SURFACE-AT ?auto_1108238 ?auto_1108241 ) ( CLEAR ?auto_1108238 ) ( LIFTING ?auto_1108244 ?auto_1108236 ) ( IS-CRATE ?auto_1108236 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1108238 ?auto_1108236 )
      ( MAKE-2CRATE ?auto_1108238 ?auto_1108236 ?auto_1108237 )
      ( MAKE-1CRATE-VERIFY ?auto_1108236 ?auto_1108237 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1108245 - SURFACE
      ?auto_1108246 - SURFACE
      ?auto_1108247 - SURFACE
    )
    :vars
    (
      ?auto_1108250 - HOIST
      ?auto_1108249 - PLACE
      ?auto_1108248 - PLACE
      ?auto_1108252 - HOIST
      ?auto_1108251 - SURFACE
      ?auto_1108253 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108250 ?auto_1108249 ) ( IS-CRATE ?auto_1108247 ) ( not ( = ?auto_1108246 ?auto_1108247 ) ) ( not ( = ?auto_1108245 ?auto_1108246 ) ) ( not ( = ?auto_1108245 ?auto_1108247 ) ) ( not ( = ?auto_1108248 ?auto_1108249 ) ) ( HOIST-AT ?auto_1108252 ?auto_1108248 ) ( not ( = ?auto_1108250 ?auto_1108252 ) ) ( AVAILABLE ?auto_1108252 ) ( SURFACE-AT ?auto_1108247 ?auto_1108248 ) ( ON ?auto_1108247 ?auto_1108251 ) ( CLEAR ?auto_1108247 ) ( not ( = ?auto_1108246 ?auto_1108251 ) ) ( not ( = ?auto_1108247 ?auto_1108251 ) ) ( not ( = ?auto_1108245 ?auto_1108251 ) ) ( TRUCK-AT ?auto_1108253 ?auto_1108249 ) ( SURFACE-AT ?auto_1108245 ?auto_1108249 ) ( CLEAR ?auto_1108245 ) ( LIFTING ?auto_1108250 ?auto_1108246 ) ( IS-CRATE ?auto_1108246 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1108246 ?auto_1108247 )
      ( MAKE-2CRATE-VERIFY ?auto_1108245 ?auto_1108246 ?auto_1108247 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108254 - SURFACE
      ?auto_1108255 - SURFACE
    )
    :vars
    (
      ?auto_1108260 - HOIST
      ?auto_1108259 - PLACE
      ?auto_1108258 - SURFACE
      ?auto_1108262 - PLACE
      ?auto_1108256 - HOIST
      ?auto_1108261 - SURFACE
      ?auto_1108257 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108260 ?auto_1108259 ) ( IS-CRATE ?auto_1108255 ) ( not ( = ?auto_1108254 ?auto_1108255 ) ) ( not ( = ?auto_1108258 ?auto_1108254 ) ) ( not ( = ?auto_1108258 ?auto_1108255 ) ) ( not ( = ?auto_1108262 ?auto_1108259 ) ) ( HOIST-AT ?auto_1108256 ?auto_1108262 ) ( not ( = ?auto_1108260 ?auto_1108256 ) ) ( AVAILABLE ?auto_1108256 ) ( SURFACE-AT ?auto_1108255 ?auto_1108262 ) ( ON ?auto_1108255 ?auto_1108261 ) ( CLEAR ?auto_1108255 ) ( not ( = ?auto_1108254 ?auto_1108261 ) ) ( not ( = ?auto_1108255 ?auto_1108261 ) ) ( not ( = ?auto_1108258 ?auto_1108261 ) ) ( TRUCK-AT ?auto_1108257 ?auto_1108259 ) ( SURFACE-AT ?auto_1108258 ?auto_1108259 ) ( CLEAR ?auto_1108258 ) ( IS-CRATE ?auto_1108254 ) ( AVAILABLE ?auto_1108260 ) ( IN ?auto_1108254 ?auto_1108257 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1108260 ?auto_1108254 ?auto_1108257 ?auto_1108259 )
      ( MAKE-2CRATE ?auto_1108258 ?auto_1108254 ?auto_1108255 )
      ( MAKE-1CRATE-VERIFY ?auto_1108254 ?auto_1108255 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1108263 - SURFACE
      ?auto_1108264 - SURFACE
      ?auto_1108265 - SURFACE
    )
    :vars
    (
      ?auto_1108266 - HOIST
      ?auto_1108267 - PLACE
      ?auto_1108268 - PLACE
      ?auto_1108269 - HOIST
      ?auto_1108270 - SURFACE
      ?auto_1108271 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108266 ?auto_1108267 ) ( IS-CRATE ?auto_1108265 ) ( not ( = ?auto_1108264 ?auto_1108265 ) ) ( not ( = ?auto_1108263 ?auto_1108264 ) ) ( not ( = ?auto_1108263 ?auto_1108265 ) ) ( not ( = ?auto_1108268 ?auto_1108267 ) ) ( HOIST-AT ?auto_1108269 ?auto_1108268 ) ( not ( = ?auto_1108266 ?auto_1108269 ) ) ( AVAILABLE ?auto_1108269 ) ( SURFACE-AT ?auto_1108265 ?auto_1108268 ) ( ON ?auto_1108265 ?auto_1108270 ) ( CLEAR ?auto_1108265 ) ( not ( = ?auto_1108264 ?auto_1108270 ) ) ( not ( = ?auto_1108265 ?auto_1108270 ) ) ( not ( = ?auto_1108263 ?auto_1108270 ) ) ( TRUCK-AT ?auto_1108271 ?auto_1108267 ) ( SURFACE-AT ?auto_1108263 ?auto_1108267 ) ( CLEAR ?auto_1108263 ) ( IS-CRATE ?auto_1108264 ) ( AVAILABLE ?auto_1108266 ) ( IN ?auto_1108264 ?auto_1108271 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1108264 ?auto_1108265 )
      ( MAKE-2CRATE-VERIFY ?auto_1108263 ?auto_1108264 ?auto_1108265 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108308 - SURFACE
      ?auto_1108309 - SURFACE
    )
    :vars
    (
      ?auto_1108312 - HOIST
      ?auto_1108314 - PLACE
      ?auto_1108313 - SURFACE
      ?auto_1108315 - PLACE
      ?auto_1108316 - HOIST
      ?auto_1108310 - SURFACE
      ?auto_1108311 - TRUCK
      ?auto_1108317 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108312 ?auto_1108314 ) ( SURFACE-AT ?auto_1108308 ?auto_1108314 ) ( CLEAR ?auto_1108308 ) ( IS-CRATE ?auto_1108309 ) ( not ( = ?auto_1108308 ?auto_1108309 ) ) ( AVAILABLE ?auto_1108312 ) ( ON ?auto_1108308 ?auto_1108313 ) ( not ( = ?auto_1108313 ?auto_1108308 ) ) ( not ( = ?auto_1108313 ?auto_1108309 ) ) ( not ( = ?auto_1108315 ?auto_1108314 ) ) ( HOIST-AT ?auto_1108316 ?auto_1108315 ) ( not ( = ?auto_1108312 ?auto_1108316 ) ) ( AVAILABLE ?auto_1108316 ) ( SURFACE-AT ?auto_1108309 ?auto_1108315 ) ( ON ?auto_1108309 ?auto_1108310 ) ( CLEAR ?auto_1108309 ) ( not ( = ?auto_1108308 ?auto_1108310 ) ) ( not ( = ?auto_1108309 ?auto_1108310 ) ) ( not ( = ?auto_1108313 ?auto_1108310 ) ) ( TRUCK-AT ?auto_1108311 ?auto_1108317 ) ( not ( = ?auto_1108317 ?auto_1108314 ) ) ( not ( = ?auto_1108315 ?auto_1108317 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1108311 ?auto_1108317 ?auto_1108314 )
      ( MAKE-1CRATE ?auto_1108308 ?auto_1108309 )
      ( MAKE-1CRATE-VERIFY ?auto_1108308 ?auto_1108309 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1108347 - SURFACE
      ?auto_1108348 - SURFACE
      ?auto_1108349 - SURFACE
      ?auto_1108350 - SURFACE
    )
    :vars
    (
      ?auto_1108352 - HOIST
      ?auto_1108351 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108352 ?auto_1108351 ) ( SURFACE-AT ?auto_1108349 ?auto_1108351 ) ( CLEAR ?auto_1108349 ) ( LIFTING ?auto_1108352 ?auto_1108350 ) ( IS-CRATE ?auto_1108350 ) ( not ( = ?auto_1108349 ?auto_1108350 ) ) ( ON ?auto_1108348 ?auto_1108347 ) ( ON ?auto_1108349 ?auto_1108348 ) ( not ( = ?auto_1108347 ?auto_1108348 ) ) ( not ( = ?auto_1108347 ?auto_1108349 ) ) ( not ( = ?auto_1108347 ?auto_1108350 ) ) ( not ( = ?auto_1108348 ?auto_1108349 ) ) ( not ( = ?auto_1108348 ?auto_1108350 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1108349 ?auto_1108350 )
      ( MAKE-3CRATE-VERIFY ?auto_1108347 ?auto_1108348 ?auto_1108349 ?auto_1108350 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1108364 - SURFACE
      ?auto_1108365 - SURFACE
      ?auto_1108366 - SURFACE
      ?auto_1108367 - SURFACE
    )
    :vars
    (
      ?auto_1108370 - HOIST
      ?auto_1108369 - PLACE
      ?auto_1108368 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108370 ?auto_1108369 ) ( SURFACE-AT ?auto_1108366 ?auto_1108369 ) ( CLEAR ?auto_1108366 ) ( IS-CRATE ?auto_1108367 ) ( not ( = ?auto_1108366 ?auto_1108367 ) ) ( TRUCK-AT ?auto_1108368 ?auto_1108369 ) ( AVAILABLE ?auto_1108370 ) ( IN ?auto_1108367 ?auto_1108368 ) ( ON ?auto_1108366 ?auto_1108365 ) ( not ( = ?auto_1108365 ?auto_1108366 ) ) ( not ( = ?auto_1108365 ?auto_1108367 ) ) ( ON ?auto_1108365 ?auto_1108364 ) ( not ( = ?auto_1108364 ?auto_1108365 ) ) ( not ( = ?auto_1108364 ?auto_1108366 ) ) ( not ( = ?auto_1108364 ?auto_1108367 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1108365 ?auto_1108366 ?auto_1108367 )
      ( MAKE-3CRATE-VERIFY ?auto_1108364 ?auto_1108365 ?auto_1108366 ?auto_1108367 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1108385 - SURFACE
      ?auto_1108386 - SURFACE
      ?auto_1108387 - SURFACE
      ?auto_1108388 - SURFACE
    )
    :vars
    (
      ?auto_1108392 - HOIST
      ?auto_1108389 - PLACE
      ?auto_1108390 - TRUCK
      ?auto_1108391 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108392 ?auto_1108389 ) ( SURFACE-AT ?auto_1108387 ?auto_1108389 ) ( CLEAR ?auto_1108387 ) ( IS-CRATE ?auto_1108388 ) ( not ( = ?auto_1108387 ?auto_1108388 ) ) ( AVAILABLE ?auto_1108392 ) ( IN ?auto_1108388 ?auto_1108390 ) ( ON ?auto_1108387 ?auto_1108386 ) ( not ( = ?auto_1108386 ?auto_1108387 ) ) ( not ( = ?auto_1108386 ?auto_1108388 ) ) ( TRUCK-AT ?auto_1108390 ?auto_1108391 ) ( not ( = ?auto_1108391 ?auto_1108389 ) ) ( ON ?auto_1108386 ?auto_1108385 ) ( not ( = ?auto_1108385 ?auto_1108386 ) ) ( not ( = ?auto_1108385 ?auto_1108387 ) ) ( not ( = ?auto_1108385 ?auto_1108388 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1108386 ?auto_1108387 ?auto_1108388 )
      ( MAKE-3CRATE-VERIFY ?auto_1108385 ?auto_1108386 ?auto_1108387 ?auto_1108388 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1108409 - SURFACE
      ?auto_1108410 - SURFACE
      ?auto_1108411 - SURFACE
      ?auto_1108412 - SURFACE
    )
    :vars
    (
      ?auto_1108415 - HOIST
      ?auto_1108416 - PLACE
      ?auto_1108414 - TRUCK
      ?auto_1108417 - PLACE
      ?auto_1108413 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108415 ?auto_1108416 ) ( SURFACE-AT ?auto_1108411 ?auto_1108416 ) ( CLEAR ?auto_1108411 ) ( IS-CRATE ?auto_1108412 ) ( not ( = ?auto_1108411 ?auto_1108412 ) ) ( AVAILABLE ?auto_1108415 ) ( ON ?auto_1108411 ?auto_1108410 ) ( not ( = ?auto_1108410 ?auto_1108411 ) ) ( not ( = ?auto_1108410 ?auto_1108412 ) ) ( TRUCK-AT ?auto_1108414 ?auto_1108417 ) ( not ( = ?auto_1108417 ?auto_1108416 ) ) ( HOIST-AT ?auto_1108413 ?auto_1108417 ) ( LIFTING ?auto_1108413 ?auto_1108412 ) ( not ( = ?auto_1108415 ?auto_1108413 ) ) ( ON ?auto_1108410 ?auto_1108409 ) ( not ( = ?auto_1108409 ?auto_1108410 ) ) ( not ( = ?auto_1108409 ?auto_1108411 ) ) ( not ( = ?auto_1108409 ?auto_1108412 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1108410 ?auto_1108411 ?auto_1108412 )
      ( MAKE-3CRATE-VERIFY ?auto_1108409 ?auto_1108410 ?auto_1108411 ?auto_1108412 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1108436 - SURFACE
      ?auto_1108437 - SURFACE
      ?auto_1108438 - SURFACE
      ?auto_1108439 - SURFACE
    )
    :vars
    (
      ?auto_1108440 - HOIST
      ?auto_1108443 - PLACE
      ?auto_1108442 - TRUCK
      ?auto_1108444 - PLACE
      ?auto_1108441 - HOIST
      ?auto_1108445 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108440 ?auto_1108443 ) ( SURFACE-AT ?auto_1108438 ?auto_1108443 ) ( CLEAR ?auto_1108438 ) ( IS-CRATE ?auto_1108439 ) ( not ( = ?auto_1108438 ?auto_1108439 ) ) ( AVAILABLE ?auto_1108440 ) ( ON ?auto_1108438 ?auto_1108437 ) ( not ( = ?auto_1108437 ?auto_1108438 ) ) ( not ( = ?auto_1108437 ?auto_1108439 ) ) ( TRUCK-AT ?auto_1108442 ?auto_1108444 ) ( not ( = ?auto_1108444 ?auto_1108443 ) ) ( HOIST-AT ?auto_1108441 ?auto_1108444 ) ( not ( = ?auto_1108440 ?auto_1108441 ) ) ( AVAILABLE ?auto_1108441 ) ( SURFACE-AT ?auto_1108439 ?auto_1108444 ) ( ON ?auto_1108439 ?auto_1108445 ) ( CLEAR ?auto_1108439 ) ( not ( = ?auto_1108438 ?auto_1108445 ) ) ( not ( = ?auto_1108439 ?auto_1108445 ) ) ( not ( = ?auto_1108437 ?auto_1108445 ) ) ( ON ?auto_1108437 ?auto_1108436 ) ( not ( = ?auto_1108436 ?auto_1108437 ) ) ( not ( = ?auto_1108436 ?auto_1108438 ) ) ( not ( = ?auto_1108436 ?auto_1108439 ) ) ( not ( = ?auto_1108436 ?auto_1108445 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1108437 ?auto_1108438 ?auto_1108439 )
      ( MAKE-3CRATE-VERIFY ?auto_1108436 ?auto_1108437 ?auto_1108438 ?auto_1108439 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1108464 - SURFACE
      ?auto_1108465 - SURFACE
      ?auto_1108466 - SURFACE
      ?auto_1108467 - SURFACE
    )
    :vars
    (
      ?auto_1108470 - HOIST
      ?auto_1108469 - PLACE
      ?auto_1108473 - PLACE
      ?auto_1108468 - HOIST
      ?auto_1108472 - SURFACE
      ?auto_1108471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108470 ?auto_1108469 ) ( SURFACE-AT ?auto_1108466 ?auto_1108469 ) ( CLEAR ?auto_1108466 ) ( IS-CRATE ?auto_1108467 ) ( not ( = ?auto_1108466 ?auto_1108467 ) ) ( AVAILABLE ?auto_1108470 ) ( ON ?auto_1108466 ?auto_1108465 ) ( not ( = ?auto_1108465 ?auto_1108466 ) ) ( not ( = ?auto_1108465 ?auto_1108467 ) ) ( not ( = ?auto_1108473 ?auto_1108469 ) ) ( HOIST-AT ?auto_1108468 ?auto_1108473 ) ( not ( = ?auto_1108470 ?auto_1108468 ) ) ( AVAILABLE ?auto_1108468 ) ( SURFACE-AT ?auto_1108467 ?auto_1108473 ) ( ON ?auto_1108467 ?auto_1108472 ) ( CLEAR ?auto_1108467 ) ( not ( = ?auto_1108466 ?auto_1108472 ) ) ( not ( = ?auto_1108467 ?auto_1108472 ) ) ( not ( = ?auto_1108465 ?auto_1108472 ) ) ( TRUCK-AT ?auto_1108471 ?auto_1108469 ) ( ON ?auto_1108465 ?auto_1108464 ) ( not ( = ?auto_1108464 ?auto_1108465 ) ) ( not ( = ?auto_1108464 ?auto_1108466 ) ) ( not ( = ?auto_1108464 ?auto_1108467 ) ) ( not ( = ?auto_1108464 ?auto_1108472 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1108465 ?auto_1108466 ?auto_1108467 )
      ( MAKE-3CRATE-VERIFY ?auto_1108464 ?auto_1108465 ?auto_1108466 ?auto_1108467 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1108492 - SURFACE
      ?auto_1108493 - SURFACE
      ?auto_1108494 - SURFACE
      ?auto_1108495 - SURFACE
    )
    :vars
    (
      ?auto_1108501 - HOIST
      ?auto_1108500 - PLACE
      ?auto_1108496 - PLACE
      ?auto_1108499 - HOIST
      ?auto_1108497 - SURFACE
      ?auto_1108498 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108501 ?auto_1108500 ) ( IS-CRATE ?auto_1108495 ) ( not ( = ?auto_1108494 ?auto_1108495 ) ) ( not ( = ?auto_1108493 ?auto_1108494 ) ) ( not ( = ?auto_1108493 ?auto_1108495 ) ) ( not ( = ?auto_1108496 ?auto_1108500 ) ) ( HOIST-AT ?auto_1108499 ?auto_1108496 ) ( not ( = ?auto_1108501 ?auto_1108499 ) ) ( AVAILABLE ?auto_1108499 ) ( SURFACE-AT ?auto_1108495 ?auto_1108496 ) ( ON ?auto_1108495 ?auto_1108497 ) ( CLEAR ?auto_1108495 ) ( not ( = ?auto_1108494 ?auto_1108497 ) ) ( not ( = ?auto_1108495 ?auto_1108497 ) ) ( not ( = ?auto_1108493 ?auto_1108497 ) ) ( TRUCK-AT ?auto_1108498 ?auto_1108500 ) ( SURFACE-AT ?auto_1108493 ?auto_1108500 ) ( CLEAR ?auto_1108493 ) ( LIFTING ?auto_1108501 ?auto_1108494 ) ( IS-CRATE ?auto_1108494 ) ( ON ?auto_1108493 ?auto_1108492 ) ( not ( = ?auto_1108492 ?auto_1108493 ) ) ( not ( = ?auto_1108492 ?auto_1108494 ) ) ( not ( = ?auto_1108492 ?auto_1108495 ) ) ( not ( = ?auto_1108492 ?auto_1108497 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1108493 ?auto_1108494 ?auto_1108495 )
      ( MAKE-3CRATE-VERIFY ?auto_1108492 ?auto_1108493 ?auto_1108494 ?auto_1108495 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1108520 - SURFACE
      ?auto_1108521 - SURFACE
      ?auto_1108522 - SURFACE
      ?auto_1108523 - SURFACE
    )
    :vars
    (
      ?auto_1108526 - HOIST
      ?auto_1108528 - PLACE
      ?auto_1108525 - PLACE
      ?auto_1108527 - HOIST
      ?auto_1108529 - SURFACE
      ?auto_1108524 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108526 ?auto_1108528 ) ( IS-CRATE ?auto_1108523 ) ( not ( = ?auto_1108522 ?auto_1108523 ) ) ( not ( = ?auto_1108521 ?auto_1108522 ) ) ( not ( = ?auto_1108521 ?auto_1108523 ) ) ( not ( = ?auto_1108525 ?auto_1108528 ) ) ( HOIST-AT ?auto_1108527 ?auto_1108525 ) ( not ( = ?auto_1108526 ?auto_1108527 ) ) ( AVAILABLE ?auto_1108527 ) ( SURFACE-AT ?auto_1108523 ?auto_1108525 ) ( ON ?auto_1108523 ?auto_1108529 ) ( CLEAR ?auto_1108523 ) ( not ( = ?auto_1108522 ?auto_1108529 ) ) ( not ( = ?auto_1108523 ?auto_1108529 ) ) ( not ( = ?auto_1108521 ?auto_1108529 ) ) ( TRUCK-AT ?auto_1108524 ?auto_1108528 ) ( SURFACE-AT ?auto_1108521 ?auto_1108528 ) ( CLEAR ?auto_1108521 ) ( IS-CRATE ?auto_1108522 ) ( AVAILABLE ?auto_1108526 ) ( IN ?auto_1108522 ?auto_1108524 ) ( ON ?auto_1108521 ?auto_1108520 ) ( not ( = ?auto_1108520 ?auto_1108521 ) ) ( not ( = ?auto_1108520 ?auto_1108522 ) ) ( not ( = ?auto_1108520 ?auto_1108523 ) ) ( not ( = ?auto_1108520 ?auto_1108529 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1108521 ?auto_1108522 ?auto_1108523 )
      ( MAKE-3CRATE-VERIFY ?auto_1108520 ?auto_1108521 ?auto_1108522 ?auto_1108523 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1108811 - SURFACE
      ?auto_1108812 - SURFACE
      ?auto_1108813 - SURFACE
      ?auto_1108815 - SURFACE
      ?auto_1108814 - SURFACE
    )
    :vars
    (
      ?auto_1108817 - HOIST
      ?auto_1108816 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108817 ?auto_1108816 ) ( SURFACE-AT ?auto_1108815 ?auto_1108816 ) ( CLEAR ?auto_1108815 ) ( LIFTING ?auto_1108817 ?auto_1108814 ) ( IS-CRATE ?auto_1108814 ) ( not ( = ?auto_1108815 ?auto_1108814 ) ) ( ON ?auto_1108812 ?auto_1108811 ) ( ON ?auto_1108813 ?auto_1108812 ) ( ON ?auto_1108815 ?auto_1108813 ) ( not ( = ?auto_1108811 ?auto_1108812 ) ) ( not ( = ?auto_1108811 ?auto_1108813 ) ) ( not ( = ?auto_1108811 ?auto_1108815 ) ) ( not ( = ?auto_1108811 ?auto_1108814 ) ) ( not ( = ?auto_1108812 ?auto_1108813 ) ) ( not ( = ?auto_1108812 ?auto_1108815 ) ) ( not ( = ?auto_1108812 ?auto_1108814 ) ) ( not ( = ?auto_1108813 ?auto_1108815 ) ) ( not ( = ?auto_1108813 ?auto_1108814 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1108815 ?auto_1108814 )
      ( MAKE-4CRATE-VERIFY ?auto_1108811 ?auto_1108812 ?auto_1108813 ?auto_1108815 ?auto_1108814 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1108836 - SURFACE
      ?auto_1108837 - SURFACE
      ?auto_1108838 - SURFACE
      ?auto_1108840 - SURFACE
      ?auto_1108839 - SURFACE
    )
    :vars
    (
      ?auto_1108841 - HOIST
      ?auto_1108842 - PLACE
      ?auto_1108843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108841 ?auto_1108842 ) ( SURFACE-AT ?auto_1108840 ?auto_1108842 ) ( CLEAR ?auto_1108840 ) ( IS-CRATE ?auto_1108839 ) ( not ( = ?auto_1108840 ?auto_1108839 ) ) ( TRUCK-AT ?auto_1108843 ?auto_1108842 ) ( AVAILABLE ?auto_1108841 ) ( IN ?auto_1108839 ?auto_1108843 ) ( ON ?auto_1108840 ?auto_1108838 ) ( not ( = ?auto_1108838 ?auto_1108840 ) ) ( not ( = ?auto_1108838 ?auto_1108839 ) ) ( ON ?auto_1108837 ?auto_1108836 ) ( ON ?auto_1108838 ?auto_1108837 ) ( not ( = ?auto_1108836 ?auto_1108837 ) ) ( not ( = ?auto_1108836 ?auto_1108838 ) ) ( not ( = ?auto_1108836 ?auto_1108840 ) ) ( not ( = ?auto_1108836 ?auto_1108839 ) ) ( not ( = ?auto_1108837 ?auto_1108838 ) ) ( not ( = ?auto_1108837 ?auto_1108840 ) ) ( not ( = ?auto_1108837 ?auto_1108839 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1108838 ?auto_1108840 ?auto_1108839 )
      ( MAKE-4CRATE-VERIFY ?auto_1108836 ?auto_1108837 ?auto_1108838 ?auto_1108840 ?auto_1108839 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1108866 - SURFACE
      ?auto_1108867 - SURFACE
      ?auto_1108868 - SURFACE
      ?auto_1108870 - SURFACE
      ?auto_1108869 - SURFACE
    )
    :vars
    (
      ?auto_1108872 - HOIST
      ?auto_1108873 - PLACE
      ?auto_1108871 - TRUCK
      ?auto_1108874 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108872 ?auto_1108873 ) ( SURFACE-AT ?auto_1108870 ?auto_1108873 ) ( CLEAR ?auto_1108870 ) ( IS-CRATE ?auto_1108869 ) ( not ( = ?auto_1108870 ?auto_1108869 ) ) ( AVAILABLE ?auto_1108872 ) ( IN ?auto_1108869 ?auto_1108871 ) ( ON ?auto_1108870 ?auto_1108868 ) ( not ( = ?auto_1108868 ?auto_1108870 ) ) ( not ( = ?auto_1108868 ?auto_1108869 ) ) ( TRUCK-AT ?auto_1108871 ?auto_1108874 ) ( not ( = ?auto_1108874 ?auto_1108873 ) ) ( ON ?auto_1108867 ?auto_1108866 ) ( ON ?auto_1108868 ?auto_1108867 ) ( not ( = ?auto_1108866 ?auto_1108867 ) ) ( not ( = ?auto_1108866 ?auto_1108868 ) ) ( not ( = ?auto_1108866 ?auto_1108870 ) ) ( not ( = ?auto_1108866 ?auto_1108869 ) ) ( not ( = ?auto_1108867 ?auto_1108868 ) ) ( not ( = ?auto_1108867 ?auto_1108870 ) ) ( not ( = ?auto_1108867 ?auto_1108869 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1108868 ?auto_1108870 ?auto_1108869 )
      ( MAKE-4CRATE-VERIFY ?auto_1108866 ?auto_1108867 ?auto_1108868 ?auto_1108870 ?auto_1108869 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1108900 - SURFACE
      ?auto_1108901 - SURFACE
      ?auto_1108902 - SURFACE
      ?auto_1108904 - SURFACE
      ?auto_1108903 - SURFACE
    )
    :vars
    (
      ?auto_1108906 - HOIST
      ?auto_1108909 - PLACE
      ?auto_1108908 - TRUCK
      ?auto_1108907 - PLACE
      ?auto_1108905 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108906 ?auto_1108909 ) ( SURFACE-AT ?auto_1108904 ?auto_1108909 ) ( CLEAR ?auto_1108904 ) ( IS-CRATE ?auto_1108903 ) ( not ( = ?auto_1108904 ?auto_1108903 ) ) ( AVAILABLE ?auto_1108906 ) ( ON ?auto_1108904 ?auto_1108902 ) ( not ( = ?auto_1108902 ?auto_1108904 ) ) ( not ( = ?auto_1108902 ?auto_1108903 ) ) ( TRUCK-AT ?auto_1108908 ?auto_1108907 ) ( not ( = ?auto_1108907 ?auto_1108909 ) ) ( HOIST-AT ?auto_1108905 ?auto_1108907 ) ( LIFTING ?auto_1108905 ?auto_1108903 ) ( not ( = ?auto_1108906 ?auto_1108905 ) ) ( ON ?auto_1108901 ?auto_1108900 ) ( ON ?auto_1108902 ?auto_1108901 ) ( not ( = ?auto_1108900 ?auto_1108901 ) ) ( not ( = ?auto_1108900 ?auto_1108902 ) ) ( not ( = ?auto_1108900 ?auto_1108904 ) ) ( not ( = ?auto_1108900 ?auto_1108903 ) ) ( not ( = ?auto_1108901 ?auto_1108902 ) ) ( not ( = ?auto_1108901 ?auto_1108904 ) ) ( not ( = ?auto_1108901 ?auto_1108903 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1108902 ?auto_1108904 ?auto_1108903 )
      ( MAKE-4CRATE-VERIFY ?auto_1108900 ?auto_1108901 ?auto_1108902 ?auto_1108904 ?auto_1108903 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1108938 - SURFACE
      ?auto_1108939 - SURFACE
      ?auto_1108940 - SURFACE
      ?auto_1108942 - SURFACE
      ?auto_1108941 - SURFACE
    )
    :vars
    (
      ?auto_1108948 - HOIST
      ?auto_1108943 - PLACE
      ?auto_1108947 - TRUCK
      ?auto_1108945 - PLACE
      ?auto_1108946 - HOIST
      ?auto_1108944 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108948 ?auto_1108943 ) ( SURFACE-AT ?auto_1108942 ?auto_1108943 ) ( CLEAR ?auto_1108942 ) ( IS-CRATE ?auto_1108941 ) ( not ( = ?auto_1108942 ?auto_1108941 ) ) ( AVAILABLE ?auto_1108948 ) ( ON ?auto_1108942 ?auto_1108940 ) ( not ( = ?auto_1108940 ?auto_1108942 ) ) ( not ( = ?auto_1108940 ?auto_1108941 ) ) ( TRUCK-AT ?auto_1108947 ?auto_1108945 ) ( not ( = ?auto_1108945 ?auto_1108943 ) ) ( HOIST-AT ?auto_1108946 ?auto_1108945 ) ( not ( = ?auto_1108948 ?auto_1108946 ) ) ( AVAILABLE ?auto_1108946 ) ( SURFACE-AT ?auto_1108941 ?auto_1108945 ) ( ON ?auto_1108941 ?auto_1108944 ) ( CLEAR ?auto_1108941 ) ( not ( = ?auto_1108942 ?auto_1108944 ) ) ( not ( = ?auto_1108941 ?auto_1108944 ) ) ( not ( = ?auto_1108940 ?auto_1108944 ) ) ( ON ?auto_1108939 ?auto_1108938 ) ( ON ?auto_1108940 ?auto_1108939 ) ( not ( = ?auto_1108938 ?auto_1108939 ) ) ( not ( = ?auto_1108938 ?auto_1108940 ) ) ( not ( = ?auto_1108938 ?auto_1108942 ) ) ( not ( = ?auto_1108938 ?auto_1108941 ) ) ( not ( = ?auto_1108938 ?auto_1108944 ) ) ( not ( = ?auto_1108939 ?auto_1108940 ) ) ( not ( = ?auto_1108939 ?auto_1108942 ) ) ( not ( = ?auto_1108939 ?auto_1108941 ) ) ( not ( = ?auto_1108939 ?auto_1108944 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1108940 ?auto_1108942 ?auto_1108941 )
      ( MAKE-4CRATE-VERIFY ?auto_1108938 ?auto_1108939 ?auto_1108940 ?auto_1108942 ?auto_1108941 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1108977 - SURFACE
      ?auto_1108978 - SURFACE
      ?auto_1108979 - SURFACE
      ?auto_1108981 - SURFACE
      ?auto_1108980 - SURFACE
    )
    :vars
    (
      ?auto_1108985 - HOIST
      ?auto_1108982 - PLACE
      ?auto_1108983 - PLACE
      ?auto_1108987 - HOIST
      ?auto_1108984 - SURFACE
      ?auto_1108986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108985 ?auto_1108982 ) ( SURFACE-AT ?auto_1108981 ?auto_1108982 ) ( CLEAR ?auto_1108981 ) ( IS-CRATE ?auto_1108980 ) ( not ( = ?auto_1108981 ?auto_1108980 ) ) ( AVAILABLE ?auto_1108985 ) ( ON ?auto_1108981 ?auto_1108979 ) ( not ( = ?auto_1108979 ?auto_1108981 ) ) ( not ( = ?auto_1108979 ?auto_1108980 ) ) ( not ( = ?auto_1108983 ?auto_1108982 ) ) ( HOIST-AT ?auto_1108987 ?auto_1108983 ) ( not ( = ?auto_1108985 ?auto_1108987 ) ) ( AVAILABLE ?auto_1108987 ) ( SURFACE-AT ?auto_1108980 ?auto_1108983 ) ( ON ?auto_1108980 ?auto_1108984 ) ( CLEAR ?auto_1108980 ) ( not ( = ?auto_1108981 ?auto_1108984 ) ) ( not ( = ?auto_1108980 ?auto_1108984 ) ) ( not ( = ?auto_1108979 ?auto_1108984 ) ) ( TRUCK-AT ?auto_1108986 ?auto_1108982 ) ( ON ?auto_1108978 ?auto_1108977 ) ( ON ?auto_1108979 ?auto_1108978 ) ( not ( = ?auto_1108977 ?auto_1108978 ) ) ( not ( = ?auto_1108977 ?auto_1108979 ) ) ( not ( = ?auto_1108977 ?auto_1108981 ) ) ( not ( = ?auto_1108977 ?auto_1108980 ) ) ( not ( = ?auto_1108977 ?auto_1108984 ) ) ( not ( = ?auto_1108978 ?auto_1108979 ) ) ( not ( = ?auto_1108978 ?auto_1108981 ) ) ( not ( = ?auto_1108978 ?auto_1108980 ) ) ( not ( = ?auto_1108978 ?auto_1108984 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1108979 ?auto_1108981 ?auto_1108980 )
      ( MAKE-4CRATE-VERIFY ?auto_1108977 ?auto_1108978 ?auto_1108979 ?auto_1108981 ?auto_1108980 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1109016 - SURFACE
      ?auto_1109017 - SURFACE
      ?auto_1109018 - SURFACE
      ?auto_1109020 - SURFACE
      ?auto_1109019 - SURFACE
    )
    :vars
    (
      ?auto_1109025 - HOIST
      ?auto_1109022 - PLACE
      ?auto_1109021 - PLACE
      ?auto_1109023 - HOIST
      ?auto_1109024 - SURFACE
      ?auto_1109026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109025 ?auto_1109022 ) ( IS-CRATE ?auto_1109019 ) ( not ( = ?auto_1109020 ?auto_1109019 ) ) ( not ( = ?auto_1109018 ?auto_1109020 ) ) ( not ( = ?auto_1109018 ?auto_1109019 ) ) ( not ( = ?auto_1109021 ?auto_1109022 ) ) ( HOIST-AT ?auto_1109023 ?auto_1109021 ) ( not ( = ?auto_1109025 ?auto_1109023 ) ) ( AVAILABLE ?auto_1109023 ) ( SURFACE-AT ?auto_1109019 ?auto_1109021 ) ( ON ?auto_1109019 ?auto_1109024 ) ( CLEAR ?auto_1109019 ) ( not ( = ?auto_1109020 ?auto_1109024 ) ) ( not ( = ?auto_1109019 ?auto_1109024 ) ) ( not ( = ?auto_1109018 ?auto_1109024 ) ) ( TRUCK-AT ?auto_1109026 ?auto_1109022 ) ( SURFACE-AT ?auto_1109018 ?auto_1109022 ) ( CLEAR ?auto_1109018 ) ( LIFTING ?auto_1109025 ?auto_1109020 ) ( IS-CRATE ?auto_1109020 ) ( ON ?auto_1109017 ?auto_1109016 ) ( ON ?auto_1109018 ?auto_1109017 ) ( not ( = ?auto_1109016 ?auto_1109017 ) ) ( not ( = ?auto_1109016 ?auto_1109018 ) ) ( not ( = ?auto_1109016 ?auto_1109020 ) ) ( not ( = ?auto_1109016 ?auto_1109019 ) ) ( not ( = ?auto_1109016 ?auto_1109024 ) ) ( not ( = ?auto_1109017 ?auto_1109018 ) ) ( not ( = ?auto_1109017 ?auto_1109020 ) ) ( not ( = ?auto_1109017 ?auto_1109019 ) ) ( not ( = ?auto_1109017 ?auto_1109024 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109018 ?auto_1109020 ?auto_1109019 )
      ( MAKE-4CRATE-VERIFY ?auto_1109016 ?auto_1109017 ?auto_1109018 ?auto_1109020 ?auto_1109019 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1109055 - SURFACE
      ?auto_1109056 - SURFACE
      ?auto_1109057 - SURFACE
      ?auto_1109059 - SURFACE
      ?auto_1109058 - SURFACE
    )
    :vars
    (
      ?auto_1109061 - HOIST
      ?auto_1109062 - PLACE
      ?auto_1109064 - PLACE
      ?auto_1109065 - HOIST
      ?auto_1109063 - SURFACE
      ?auto_1109060 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109061 ?auto_1109062 ) ( IS-CRATE ?auto_1109058 ) ( not ( = ?auto_1109059 ?auto_1109058 ) ) ( not ( = ?auto_1109057 ?auto_1109059 ) ) ( not ( = ?auto_1109057 ?auto_1109058 ) ) ( not ( = ?auto_1109064 ?auto_1109062 ) ) ( HOIST-AT ?auto_1109065 ?auto_1109064 ) ( not ( = ?auto_1109061 ?auto_1109065 ) ) ( AVAILABLE ?auto_1109065 ) ( SURFACE-AT ?auto_1109058 ?auto_1109064 ) ( ON ?auto_1109058 ?auto_1109063 ) ( CLEAR ?auto_1109058 ) ( not ( = ?auto_1109059 ?auto_1109063 ) ) ( not ( = ?auto_1109058 ?auto_1109063 ) ) ( not ( = ?auto_1109057 ?auto_1109063 ) ) ( TRUCK-AT ?auto_1109060 ?auto_1109062 ) ( SURFACE-AT ?auto_1109057 ?auto_1109062 ) ( CLEAR ?auto_1109057 ) ( IS-CRATE ?auto_1109059 ) ( AVAILABLE ?auto_1109061 ) ( IN ?auto_1109059 ?auto_1109060 ) ( ON ?auto_1109056 ?auto_1109055 ) ( ON ?auto_1109057 ?auto_1109056 ) ( not ( = ?auto_1109055 ?auto_1109056 ) ) ( not ( = ?auto_1109055 ?auto_1109057 ) ) ( not ( = ?auto_1109055 ?auto_1109059 ) ) ( not ( = ?auto_1109055 ?auto_1109058 ) ) ( not ( = ?auto_1109055 ?auto_1109063 ) ) ( not ( = ?auto_1109056 ?auto_1109057 ) ) ( not ( = ?auto_1109056 ?auto_1109059 ) ) ( not ( = ?auto_1109056 ?auto_1109058 ) ) ( not ( = ?auto_1109056 ?auto_1109063 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109057 ?auto_1109059 ?auto_1109058 )
      ( MAKE-4CRATE-VERIFY ?auto_1109055 ?auto_1109056 ?auto_1109057 ?auto_1109059 ?auto_1109058 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1109556 - SURFACE
      ?auto_1109557 - SURFACE
    )
    :vars
    (
      ?auto_1109564 - HOIST
      ?auto_1109560 - PLACE
      ?auto_1109563 - SURFACE
      ?auto_1109558 - TRUCK
      ?auto_1109561 - PLACE
      ?auto_1109559 - HOIST
      ?auto_1109562 - SURFACE
      ?auto_1109565 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109564 ?auto_1109560 ) ( SURFACE-AT ?auto_1109556 ?auto_1109560 ) ( CLEAR ?auto_1109556 ) ( IS-CRATE ?auto_1109557 ) ( not ( = ?auto_1109556 ?auto_1109557 ) ) ( AVAILABLE ?auto_1109564 ) ( ON ?auto_1109556 ?auto_1109563 ) ( not ( = ?auto_1109563 ?auto_1109556 ) ) ( not ( = ?auto_1109563 ?auto_1109557 ) ) ( TRUCK-AT ?auto_1109558 ?auto_1109561 ) ( not ( = ?auto_1109561 ?auto_1109560 ) ) ( HOIST-AT ?auto_1109559 ?auto_1109561 ) ( not ( = ?auto_1109564 ?auto_1109559 ) ) ( SURFACE-AT ?auto_1109557 ?auto_1109561 ) ( ON ?auto_1109557 ?auto_1109562 ) ( CLEAR ?auto_1109557 ) ( not ( = ?auto_1109556 ?auto_1109562 ) ) ( not ( = ?auto_1109557 ?auto_1109562 ) ) ( not ( = ?auto_1109563 ?auto_1109562 ) ) ( LIFTING ?auto_1109559 ?auto_1109565 ) ( IS-CRATE ?auto_1109565 ) ( not ( = ?auto_1109556 ?auto_1109565 ) ) ( not ( = ?auto_1109557 ?auto_1109565 ) ) ( not ( = ?auto_1109563 ?auto_1109565 ) ) ( not ( = ?auto_1109562 ?auto_1109565 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1109559 ?auto_1109565 ?auto_1109558 ?auto_1109561 )
      ( MAKE-1CRATE ?auto_1109556 ?auto_1109557 )
      ( MAKE-1CRATE-VERIFY ?auto_1109556 ?auto_1109557 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1109715 - SURFACE
      ?auto_1109716 - SURFACE
      ?auto_1109717 - SURFACE
      ?auto_1109719 - SURFACE
      ?auto_1109718 - SURFACE
      ?auto_1109720 - SURFACE
    )
    :vars
    (
      ?auto_1109721 - HOIST
      ?auto_1109722 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109721 ?auto_1109722 ) ( SURFACE-AT ?auto_1109718 ?auto_1109722 ) ( CLEAR ?auto_1109718 ) ( LIFTING ?auto_1109721 ?auto_1109720 ) ( IS-CRATE ?auto_1109720 ) ( not ( = ?auto_1109718 ?auto_1109720 ) ) ( ON ?auto_1109716 ?auto_1109715 ) ( ON ?auto_1109717 ?auto_1109716 ) ( ON ?auto_1109719 ?auto_1109717 ) ( ON ?auto_1109718 ?auto_1109719 ) ( not ( = ?auto_1109715 ?auto_1109716 ) ) ( not ( = ?auto_1109715 ?auto_1109717 ) ) ( not ( = ?auto_1109715 ?auto_1109719 ) ) ( not ( = ?auto_1109715 ?auto_1109718 ) ) ( not ( = ?auto_1109715 ?auto_1109720 ) ) ( not ( = ?auto_1109716 ?auto_1109717 ) ) ( not ( = ?auto_1109716 ?auto_1109719 ) ) ( not ( = ?auto_1109716 ?auto_1109718 ) ) ( not ( = ?auto_1109716 ?auto_1109720 ) ) ( not ( = ?auto_1109717 ?auto_1109719 ) ) ( not ( = ?auto_1109717 ?auto_1109718 ) ) ( not ( = ?auto_1109717 ?auto_1109720 ) ) ( not ( = ?auto_1109719 ?auto_1109718 ) ) ( not ( = ?auto_1109719 ?auto_1109720 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1109718 ?auto_1109720 )
      ( MAKE-5CRATE-VERIFY ?auto_1109715 ?auto_1109716 ?auto_1109717 ?auto_1109719 ?auto_1109718 ?auto_1109720 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1109749 - SURFACE
      ?auto_1109750 - SURFACE
      ?auto_1109751 - SURFACE
      ?auto_1109753 - SURFACE
      ?auto_1109752 - SURFACE
      ?auto_1109754 - SURFACE
    )
    :vars
    (
      ?auto_1109755 - HOIST
      ?auto_1109756 - PLACE
      ?auto_1109757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109755 ?auto_1109756 ) ( SURFACE-AT ?auto_1109752 ?auto_1109756 ) ( CLEAR ?auto_1109752 ) ( IS-CRATE ?auto_1109754 ) ( not ( = ?auto_1109752 ?auto_1109754 ) ) ( TRUCK-AT ?auto_1109757 ?auto_1109756 ) ( AVAILABLE ?auto_1109755 ) ( IN ?auto_1109754 ?auto_1109757 ) ( ON ?auto_1109752 ?auto_1109753 ) ( not ( = ?auto_1109753 ?auto_1109752 ) ) ( not ( = ?auto_1109753 ?auto_1109754 ) ) ( ON ?auto_1109750 ?auto_1109749 ) ( ON ?auto_1109751 ?auto_1109750 ) ( ON ?auto_1109753 ?auto_1109751 ) ( not ( = ?auto_1109749 ?auto_1109750 ) ) ( not ( = ?auto_1109749 ?auto_1109751 ) ) ( not ( = ?auto_1109749 ?auto_1109753 ) ) ( not ( = ?auto_1109749 ?auto_1109752 ) ) ( not ( = ?auto_1109749 ?auto_1109754 ) ) ( not ( = ?auto_1109750 ?auto_1109751 ) ) ( not ( = ?auto_1109750 ?auto_1109753 ) ) ( not ( = ?auto_1109750 ?auto_1109752 ) ) ( not ( = ?auto_1109750 ?auto_1109754 ) ) ( not ( = ?auto_1109751 ?auto_1109753 ) ) ( not ( = ?auto_1109751 ?auto_1109752 ) ) ( not ( = ?auto_1109751 ?auto_1109754 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109753 ?auto_1109752 ?auto_1109754 )
      ( MAKE-5CRATE-VERIFY ?auto_1109749 ?auto_1109750 ?auto_1109751 ?auto_1109753 ?auto_1109752 ?auto_1109754 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1109789 - SURFACE
      ?auto_1109790 - SURFACE
      ?auto_1109791 - SURFACE
      ?auto_1109793 - SURFACE
      ?auto_1109792 - SURFACE
      ?auto_1109794 - SURFACE
    )
    :vars
    (
      ?auto_1109796 - HOIST
      ?auto_1109795 - PLACE
      ?auto_1109798 - TRUCK
      ?auto_1109797 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109796 ?auto_1109795 ) ( SURFACE-AT ?auto_1109792 ?auto_1109795 ) ( CLEAR ?auto_1109792 ) ( IS-CRATE ?auto_1109794 ) ( not ( = ?auto_1109792 ?auto_1109794 ) ) ( AVAILABLE ?auto_1109796 ) ( IN ?auto_1109794 ?auto_1109798 ) ( ON ?auto_1109792 ?auto_1109793 ) ( not ( = ?auto_1109793 ?auto_1109792 ) ) ( not ( = ?auto_1109793 ?auto_1109794 ) ) ( TRUCK-AT ?auto_1109798 ?auto_1109797 ) ( not ( = ?auto_1109797 ?auto_1109795 ) ) ( ON ?auto_1109790 ?auto_1109789 ) ( ON ?auto_1109791 ?auto_1109790 ) ( ON ?auto_1109793 ?auto_1109791 ) ( not ( = ?auto_1109789 ?auto_1109790 ) ) ( not ( = ?auto_1109789 ?auto_1109791 ) ) ( not ( = ?auto_1109789 ?auto_1109793 ) ) ( not ( = ?auto_1109789 ?auto_1109792 ) ) ( not ( = ?auto_1109789 ?auto_1109794 ) ) ( not ( = ?auto_1109790 ?auto_1109791 ) ) ( not ( = ?auto_1109790 ?auto_1109793 ) ) ( not ( = ?auto_1109790 ?auto_1109792 ) ) ( not ( = ?auto_1109790 ?auto_1109794 ) ) ( not ( = ?auto_1109791 ?auto_1109793 ) ) ( not ( = ?auto_1109791 ?auto_1109792 ) ) ( not ( = ?auto_1109791 ?auto_1109794 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109793 ?auto_1109792 ?auto_1109794 )
      ( MAKE-5CRATE-VERIFY ?auto_1109789 ?auto_1109790 ?auto_1109791 ?auto_1109793 ?auto_1109792 ?auto_1109794 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1109834 - SURFACE
      ?auto_1109835 - SURFACE
      ?auto_1109836 - SURFACE
      ?auto_1109838 - SURFACE
      ?auto_1109837 - SURFACE
      ?auto_1109839 - SURFACE
    )
    :vars
    (
      ?auto_1109840 - HOIST
      ?auto_1109842 - PLACE
      ?auto_1109843 - TRUCK
      ?auto_1109841 - PLACE
      ?auto_1109844 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109840 ?auto_1109842 ) ( SURFACE-AT ?auto_1109837 ?auto_1109842 ) ( CLEAR ?auto_1109837 ) ( IS-CRATE ?auto_1109839 ) ( not ( = ?auto_1109837 ?auto_1109839 ) ) ( AVAILABLE ?auto_1109840 ) ( ON ?auto_1109837 ?auto_1109838 ) ( not ( = ?auto_1109838 ?auto_1109837 ) ) ( not ( = ?auto_1109838 ?auto_1109839 ) ) ( TRUCK-AT ?auto_1109843 ?auto_1109841 ) ( not ( = ?auto_1109841 ?auto_1109842 ) ) ( HOIST-AT ?auto_1109844 ?auto_1109841 ) ( LIFTING ?auto_1109844 ?auto_1109839 ) ( not ( = ?auto_1109840 ?auto_1109844 ) ) ( ON ?auto_1109835 ?auto_1109834 ) ( ON ?auto_1109836 ?auto_1109835 ) ( ON ?auto_1109838 ?auto_1109836 ) ( not ( = ?auto_1109834 ?auto_1109835 ) ) ( not ( = ?auto_1109834 ?auto_1109836 ) ) ( not ( = ?auto_1109834 ?auto_1109838 ) ) ( not ( = ?auto_1109834 ?auto_1109837 ) ) ( not ( = ?auto_1109834 ?auto_1109839 ) ) ( not ( = ?auto_1109835 ?auto_1109836 ) ) ( not ( = ?auto_1109835 ?auto_1109838 ) ) ( not ( = ?auto_1109835 ?auto_1109837 ) ) ( not ( = ?auto_1109835 ?auto_1109839 ) ) ( not ( = ?auto_1109836 ?auto_1109838 ) ) ( not ( = ?auto_1109836 ?auto_1109837 ) ) ( not ( = ?auto_1109836 ?auto_1109839 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109838 ?auto_1109837 ?auto_1109839 )
      ( MAKE-5CRATE-VERIFY ?auto_1109834 ?auto_1109835 ?auto_1109836 ?auto_1109838 ?auto_1109837 ?auto_1109839 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1109884 - SURFACE
      ?auto_1109885 - SURFACE
      ?auto_1109886 - SURFACE
      ?auto_1109888 - SURFACE
      ?auto_1109887 - SURFACE
      ?auto_1109889 - SURFACE
    )
    :vars
    (
      ?auto_1109894 - HOIST
      ?auto_1109890 - PLACE
      ?auto_1109893 - TRUCK
      ?auto_1109891 - PLACE
      ?auto_1109895 - HOIST
      ?auto_1109892 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109894 ?auto_1109890 ) ( SURFACE-AT ?auto_1109887 ?auto_1109890 ) ( CLEAR ?auto_1109887 ) ( IS-CRATE ?auto_1109889 ) ( not ( = ?auto_1109887 ?auto_1109889 ) ) ( AVAILABLE ?auto_1109894 ) ( ON ?auto_1109887 ?auto_1109888 ) ( not ( = ?auto_1109888 ?auto_1109887 ) ) ( not ( = ?auto_1109888 ?auto_1109889 ) ) ( TRUCK-AT ?auto_1109893 ?auto_1109891 ) ( not ( = ?auto_1109891 ?auto_1109890 ) ) ( HOIST-AT ?auto_1109895 ?auto_1109891 ) ( not ( = ?auto_1109894 ?auto_1109895 ) ) ( AVAILABLE ?auto_1109895 ) ( SURFACE-AT ?auto_1109889 ?auto_1109891 ) ( ON ?auto_1109889 ?auto_1109892 ) ( CLEAR ?auto_1109889 ) ( not ( = ?auto_1109887 ?auto_1109892 ) ) ( not ( = ?auto_1109889 ?auto_1109892 ) ) ( not ( = ?auto_1109888 ?auto_1109892 ) ) ( ON ?auto_1109885 ?auto_1109884 ) ( ON ?auto_1109886 ?auto_1109885 ) ( ON ?auto_1109888 ?auto_1109886 ) ( not ( = ?auto_1109884 ?auto_1109885 ) ) ( not ( = ?auto_1109884 ?auto_1109886 ) ) ( not ( = ?auto_1109884 ?auto_1109888 ) ) ( not ( = ?auto_1109884 ?auto_1109887 ) ) ( not ( = ?auto_1109884 ?auto_1109889 ) ) ( not ( = ?auto_1109884 ?auto_1109892 ) ) ( not ( = ?auto_1109885 ?auto_1109886 ) ) ( not ( = ?auto_1109885 ?auto_1109888 ) ) ( not ( = ?auto_1109885 ?auto_1109887 ) ) ( not ( = ?auto_1109885 ?auto_1109889 ) ) ( not ( = ?auto_1109885 ?auto_1109892 ) ) ( not ( = ?auto_1109886 ?auto_1109888 ) ) ( not ( = ?auto_1109886 ?auto_1109887 ) ) ( not ( = ?auto_1109886 ?auto_1109889 ) ) ( not ( = ?auto_1109886 ?auto_1109892 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109888 ?auto_1109887 ?auto_1109889 )
      ( MAKE-5CRATE-VERIFY ?auto_1109884 ?auto_1109885 ?auto_1109886 ?auto_1109888 ?auto_1109887 ?auto_1109889 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1109935 - SURFACE
      ?auto_1109936 - SURFACE
      ?auto_1109937 - SURFACE
      ?auto_1109939 - SURFACE
      ?auto_1109938 - SURFACE
      ?auto_1109940 - SURFACE
    )
    :vars
    (
      ?auto_1109941 - HOIST
      ?auto_1109943 - PLACE
      ?auto_1109942 - PLACE
      ?auto_1109946 - HOIST
      ?auto_1109945 - SURFACE
      ?auto_1109944 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109941 ?auto_1109943 ) ( SURFACE-AT ?auto_1109938 ?auto_1109943 ) ( CLEAR ?auto_1109938 ) ( IS-CRATE ?auto_1109940 ) ( not ( = ?auto_1109938 ?auto_1109940 ) ) ( AVAILABLE ?auto_1109941 ) ( ON ?auto_1109938 ?auto_1109939 ) ( not ( = ?auto_1109939 ?auto_1109938 ) ) ( not ( = ?auto_1109939 ?auto_1109940 ) ) ( not ( = ?auto_1109942 ?auto_1109943 ) ) ( HOIST-AT ?auto_1109946 ?auto_1109942 ) ( not ( = ?auto_1109941 ?auto_1109946 ) ) ( AVAILABLE ?auto_1109946 ) ( SURFACE-AT ?auto_1109940 ?auto_1109942 ) ( ON ?auto_1109940 ?auto_1109945 ) ( CLEAR ?auto_1109940 ) ( not ( = ?auto_1109938 ?auto_1109945 ) ) ( not ( = ?auto_1109940 ?auto_1109945 ) ) ( not ( = ?auto_1109939 ?auto_1109945 ) ) ( TRUCK-AT ?auto_1109944 ?auto_1109943 ) ( ON ?auto_1109936 ?auto_1109935 ) ( ON ?auto_1109937 ?auto_1109936 ) ( ON ?auto_1109939 ?auto_1109937 ) ( not ( = ?auto_1109935 ?auto_1109936 ) ) ( not ( = ?auto_1109935 ?auto_1109937 ) ) ( not ( = ?auto_1109935 ?auto_1109939 ) ) ( not ( = ?auto_1109935 ?auto_1109938 ) ) ( not ( = ?auto_1109935 ?auto_1109940 ) ) ( not ( = ?auto_1109935 ?auto_1109945 ) ) ( not ( = ?auto_1109936 ?auto_1109937 ) ) ( not ( = ?auto_1109936 ?auto_1109939 ) ) ( not ( = ?auto_1109936 ?auto_1109938 ) ) ( not ( = ?auto_1109936 ?auto_1109940 ) ) ( not ( = ?auto_1109936 ?auto_1109945 ) ) ( not ( = ?auto_1109937 ?auto_1109939 ) ) ( not ( = ?auto_1109937 ?auto_1109938 ) ) ( not ( = ?auto_1109937 ?auto_1109940 ) ) ( not ( = ?auto_1109937 ?auto_1109945 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109939 ?auto_1109938 ?auto_1109940 )
      ( MAKE-5CRATE-VERIFY ?auto_1109935 ?auto_1109936 ?auto_1109937 ?auto_1109939 ?auto_1109938 ?auto_1109940 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1109986 - SURFACE
      ?auto_1109987 - SURFACE
      ?auto_1109988 - SURFACE
      ?auto_1109990 - SURFACE
      ?auto_1109989 - SURFACE
      ?auto_1109991 - SURFACE
    )
    :vars
    (
      ?auto_1109997 - HOIST
      ?auto_1109992 - PLACE
      ?auto_1109996 - PLACE
      ?auto_1109993 - HOIST
      ?auto_1109995 - SURFACE
      ?auto_1109994 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109997 ?auto_1109992 ) ( IS-CRATE ?auto_1109991 ) ( not ( = ?auto_1109989 ?auto_1109991 ) ) ( not ( = ?auto_1109990 ?auto_1109989 ) ) ( not ( = ?auto_1109990 ?auto_1109991 ) ) ( not ( = ?auto_1109996 ?auto_1109992 ) ) ( HOIST-AT ?auto_1109993 ?auto_1109996 ) ( not ( = ?auto_1109997 ?auto_1109993 ) ) ( AVAILABLE ?auto_1109993 ) ( SURFACE-AT ?auto_1109991 ?auto_1109996 ) ( ON ?auto_1109991 ?auto_1109995 ) ( CLEAR ?auto_1109991 ) ( not ( = ?auto_1109989 ?auto_1109995 ) ) ( not ( = ?auto_1109991 ?auto_1109995 ) ) ( not ( = ?auto_1109990 ?auto_1109995 ) ) ( TRUCK-AT ?auto_1109994 ?auto_1109992 ) ( SURFACE-AT ?auto_1109990 ?auto_1109992 ) ( CLEAR ?auto_1109990 ) ( LIFTING ?auto_1109997 ?auto_1109989 ) ( IS-CRATE ?auto_1109989 ) ( ON ?auto_1109987 ?auto_1109986 ) ( ON ?auto_1109988 ?auto_1109987 ) ( ON ?auto_1109990 ?auto_1109988 ) ( not ( = ?auto_1109986 ?auto_1109987 ) ) ( not ( = ?auto_1109986 ?auto_1109988 ) ) ( not ( = ?auto_1109986 ?auto_1109990 ) ) ( not ( = ?auto_1109986 ?auto_1109989 ) ) ( not ( = ?auto_1109986 ?auto_1109991 ) ) ( not ( = ?auto_1109986 ?auto_1109995 ) ) ( not ( = ?auto_1109987 ?auto_1109988 ) ) ( not ( = ?auto_1109987 ?auto_1109990 ) ) ( not ( = ?auto_1109987 ?auto_1109989 ) ) ( not ( = ?auto_1109987 ?auto_1109991 ) ) ( not ( = ?auto_1109987 ?auto_1109995 ) ) ( not ( = ?auto_1109988 ?auto_1109990 ) ) ( not ( = ?auto_1109988 ?auto_1109989 ) ) ( not ( = ?auto_1109988 ?auto_1109991 ) ) ( not ( = ?auto_1109988 ?auto_1109995 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109990 ?auto_1109989 ?auto_1109991 )
      ( MAKE-5CRATE-VERIFY ?auto_1109986 ?auto_1109987 ?auto_1109988 ?auto_1109990 ?auto_1109989 ?auto_1109991 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1110037 - SURFACE
      ?auto_1110038 - SURFACE
      ?auto_1110039 - SURFACE
      ?auto_1110041 - SURFACE
      ?auto_1110040 - SURFACE
      ?auto_1110042 - SURFACE
    )
    :vars
    (
      ?auto_1110043 - HOIST
      ?auto_1110044 - PLACE
      ?auto_1110046 - PLACE
      ?auto_1110048 - HOIST
      ?auto_1110045 - SURFACE
      ?auto_1110047 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1110043 ?auto_1110044 ) ( IS-CRATE ?auto_1110042 ) ( not ( = ?auto_1110040 ?auto_1110042 ) ) ( not ( = ?auto_1110041 ?auto_1110040 ) ) ( not ( = ?auto_1110041 ?auto_1110042 ) ) ( not ( = ?auto_1110046 ?auto_1110044 ) ) ( HOIST-AT ?auto_1110048 ?auto_1110046 ) ( not ( = ?auto_1110043 ?auto_1110048 ) ) ( AVAILABLE ?auto_1110048 ) ( SURFACE-AT ?auto_1110042 ?auto_1110046 ) ( ON ?auto_1110042 ?auto_1110045 ) ( CLEAR ?auto_1110042 ) ( not ( = ?auto_1110040 ?auto_1110045 ) ) ( not ( = ?auto_1110042 ?auto_1110045 ) ) ( not ( = ?auto_1110041 ?auto_1110045 ) ) ( TRUCK-AT ?auto_1110047 ?auto_1110044 ) ( SURFACE-AT ?auto_1110041 ?auto_1110044 ) ( CLEAR ?auto_1110041 ) ( IS-CRATE ?auto_1110040 ) ( AVAILABLE ?auto_1110043 ) ( IN ?auto_1110040 ?auto_1110047 ) ( ON ?auto_1110038 ?auto_1110037 ) ( ON ?auto_1110039 ?auto_1110038 ) ( ON ?auto_1110041 ?auto_1110039 ) ( not ( = ?auto_1110037 ?auto_1110038 ) ) ( not ( = ?auto_1110037 ?auto_1110039 ) ) ( not ( = ?auto_1110037 ?auto_1110041 ) ) ( not ( = ?auto_1110037 ?auto_1110040 ) ) ( not ( = ?auto_1110037 ?auto_1110042 ) ) ( not ( = ?auto_1110037 ?auto_1110045 ) ) ( not ( = ?auto_1110038 ?auto_1110039 ) ) ( not ( = ?auto_1110038 ?auto_1110041 ) ) ( not ( = ?auto_1110038 ?auto_1110040 ) ) ( not ( = ?auto_1110038 ?auto_1110042 ) ) ( not ( = ?auto_1110038 ?auto_1110045 ) ) ( not ( = ?auto_1110039 ?auto_1110041 ) ) ( not ( = ?auto_1110039 ?auto_1110040 ) ) ( not ( = ?auto_1110039 ?auto_1110042 ) ) ( not ( = ?auto_1110039 ?auto_1110045 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1110041 ?auto_1110040 ?auto_1110042 )
      ( MAKE-5CRATE-VERIFY ?auto_1110037 ?auto_1110038 ?auto_1110039 ?auto_1110041 ?auto_1110040 ?auto_1110042 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1111025 - SURFACE
      ?auto_1111026 - SURFACE
    )
    :vars
    (
      ?auto_1111033 - HOIST
      ?auto_1111032 - PLACE
      ?auto_1111028 - SURFACE
      ?auto_1111027 - PLACE
      ?auto_1111031 - HOIST
      ?auto_1111029 - SURFACE
      ?auto_1111030 - TRUCK
      ?auto_1111034 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1111033 ?auto_1111032 ) ( SURFACE-AT ?auto_1111025 ?auto_1111032 ) ( CLEAR ?auto_1111025 ) ( IS-CRATE ?auto_1111026 ) ( not ( = ?auto_1111025 ?auto_1111026 ) ) ( ON ?auto_1111025 ?auto_1111028 ) ( not ( = ?auto_1111028 ?auto_1111025 ) ) ( not ( = ?auto_1111028 ?auto_1111026 ) ) ( not ( = ?auto_1111027 ?auto_1111032 ) ) ( HOIST-AT ?auto_1111031 ?auto_1111027 ) ( not ( = ?auto_1111033 ?auto_1111031 ) ) ( AVAILABLE ?auto_1111031 ) ( SURFACE-AT ?auto_1111026 ?auto_1111027 ) ( ON ?auto_1111026 ?auto_1111029 ) ( CLEAR ?auto_1111026 ) ( not ( = ?auto_1111025 ?auto_1111029 ) ) ( not ( = ?auto_1111026 ?auto_1111029 ) ) ( not ( = ?auto_1111028 ?auto_1111029 ) ) ( TRUCK-AT ?auto_1111030 ?auto_1111032 ) ( LIFTING ?auto_1111033 ?auto_1111034 ) ( IS-CRATE ?auto_1111034 ) ( not ( = ?auto_1111025 ?auto_1111034 ) ) ( not ( = ?auto_1111026 ?auto_1111034 ) ) ( not ( = ?auto_1111028 ?auto_1111034 ) ) ( not ( = ?auto_1111029 ?auto_1111034 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1111033 ?auto_1111034 ?auto_1111030 ?auto_1111032 )
      ( MAKE-1CRATE ?auto_1111025 ?auto_1111026 )
      ( MAKE-1CRATE-VERIFY ?auto_1111025 ?auto_1111026 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1111240 - SURFACE
      ?auto_1111241 - SURFACE
      ?auto_1111242 - SURFACE
      ?auto_1111244 - SURFACE
      ?auto_1111243 - SURFACE
      ?auto_1111245 - SURFACE
      ?auto_1111246 - SURFACE
    )
    :vars
    (
      ?auto_1111247 - HOIST
      ?auto_1111248 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1111247 ?auto_1111248 ) ( SURFACE-AT ?auto_1111245 ?auto_1111248 ) ( CLEAR ?auto_1111245 ) ( LIFTING ?auto_1111247 ?auto_1111246 ) ( IS-CRATE ?auto_1111246 ) ( not ( = ?auto_1111245 ?auto_1111246 ) ) ( ON ?auto_1111241 ?auto_1111240 ) ( ON ?auto_1111242 ?auto_1111241 ) ( ON ?auto_1111244 ?auto_1111242 ) ( ON ?auto_1111243 ?auto_1111244 ) ( ON ?auto_1111245 ?auto_1111243 ) ( not ( = ?auto_1111240 ?auto_1111241 ) ) ( not ( = ?auto_1111240 ?auto_1111242 ) ) ( not ( = ?auto_1111240 ?auto_1111244 ) ) ( not ( = ?auto_1111240 ?auto_1111243 ) ) ( not ( = ?auto_1111240 ?auto_1111245 ) ) ( not ( = ?auto_1111240 ?auto_1111246 ) ) ( not ( = ?auto_1111241 ?auto_1111242 ) ) ( not ( = ?auto_1111241 ?auto_1111244 ) ) ( not ( = ?auto_1111241 ?auto_1111243 ) ) ( not ( = ?auto_1111241 ?auto_1111245 ) ) ( not ( = ?auto_1111241 ?auto_1111246 ) ) ( not ( = ?auto_1111242 ?auto_1111244 ) ) ( not ( = ?auto_1111242 ?auto_1111243 ) ) ( not ( = ?auto_1111242 ?auto_1111245 ) ) ( not ( = ?auto_1111242 ?auto_1111246 ) ) ( not ( = ?auto_1111244 ?auto_1111243 ) ) ( not ( = ?auto_1111244 ?auto_1111245 ) ) ( not ( = ?auto_1111244 ?auto_1111246 ) ) ( not ( = ?auto_1111243 ?auto_1111245 ) ) ( not ( = ?auto_1111243 ?auto_1111246 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1111245 ?auto_1111246 )
      ( MAKE-6CRATE-VERIFY ?auto_1111240 ?auto_1111241 ?auto_1111242 ?auto_1111244 ?auto_1111243 ?auto_1111245 ?auto_1111246 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1111284 - SURFACE
      ?auto_1111285 - SURFACE
      ?auto_1111286 - SURFACE
      ?auto_1111288 - SURFACE
      ?auto_1111287 - SURFACE
      ?auto_1111289 - SURFACE
      ?auto_1111290 - SURFACE
    )
    :vars
    (
      ?auto_1111291 - HOIST
      ?auto_1111292 - PLACE
      ?auto_1111293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1111291 ?auto_1111292 ) ( SURFACE-AT ?auto_1111289 ?auto_1111292 ) ( CLEAR ?auto_1111289 ) ( IS-CRATE ?auto_1111290 ) ( not ( = ?auto_1111289 ?auto_1111290 ) ) ( TRUCK-AT ?auto_1111293 ?auto_1111292 ) ( AVAILABLE ?auto_1111291 ) ( IN ?auto_1111290 ?auto_1111293 ) ( ON ?auto_1111289 ?auto_1111287 ) ( not ( = ?auto_1111287 ?auto_1111289 ) ) ( not ( = ?auto_1111287 ?auto_1111290 ) ) ( ON ?auto_1111285 ?auto_1111284 ) ( ON ?auto_1111286 ?auto_1111285 ) ( ON ?auto_1111288 ?auto_1111286 ) ( ON ?auto_1111287 ?auto_1111288 ) ( not ( = ?auto_1111284 ?auto_1111285 ) ) ( not ( = ?auto_1111284 ?auto_1111286 ) ) ( not ( = ?auto_1111284 ?auto_1111288 ) ) ( not ( = ?auto_1111284 ?auto_1111287 ) ) ( not ( = ?auto_1111284 ?auto_1111289 ) ) ( not ( = ?auto_1111284 ?auto_1111290 ) ) ( not ( = ?auto_1111285 ?auto_1111286 ) ) ( not ( = ?auto_1111285 ?auto_1111288 ) ) ( not ( = ?auto_1111285 ?auto_1111287 ) ) ( not ( = ?auto_1111285 ?auto_1111289 ) ) ( not ( = ?auto_1111285 ?auto_1111290 ) ) ( not ( = ?auto_1111286 ?auto_1111288 ) ) ( not ( = ?auto_1111286 ?auto_1111287 ) ) ( not ( = ?auto_1111286 ?auto_1111289 ) ) ( not ( = ?auto_1111286 ?auto_1111290 ) ) ( not ( = ?auto_1111288 ?auto_1111287 ) ) ( not ( = ?auto_1111288 ?auto_1111289 ) ) ( not ( = ?auto_1111288 ?auto_1111290 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1111287 ?auto_1111289 ?auto_1111290 )
      ( MAKE-6CRATE-VERIFY ?auto_1111284 ?auto_1111285 ?auto_1111286 ?auto_1111288 ?auto_1111287 ?auto_1111289 ?auto_1111290 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1111335 - SURFACE
      ?auto_1111336 - SURFACE
      ?auto_1111337 - SURFACE
      ?auto_1111339 - SURFACE
      ?auto_1111338 - SURFACE
      ?auto_1111340 - SURFACE
      ?auto_1111341 - SURFACE
    )
    :vars
    (
      ?auto_1111345 - HOIST
      ?auto_1111342 - PLACE
      ?auto_1111343 - TRUCK
      ?auto_1111344 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1111345 ?auto_1111342 ) ( SURFACE-AT ?auto_1111340 ?auto_1111342 ) ( CLEAR ?auto_1111340 ) ( IS-CRATE ?auto_1111341 ) ( not ( = ?auto_1111340 ?auto_1111341 ) ) ( AVAILABLE ?auto_1111345 ) ( IN ?auto_1111341 ?auto_1111343 ) ( ON ?auto_1111340 ?auto_1111338 ) ( not ( = ?auto_1111338 ?auto_1111340 ) ) ( not ( = ?auto_1111338 ?auto_1111341 ) ) ( TRUCK-AT ?auto_1111343 ?auto_1111344 ) ( not ( = ?auto_1111344 ?auto_1111342 ) ) ( ON ?auto_1111336 ?auto_1111335 ) ( ON ?auto_1111337 ?auto_1111336 ) ( ON ?auto_1111339 ?auto_1111337 ) ( ON ?auto_1111338 ?auto_1111339 ) ( not ( = ?auto_1111335 ?auto_1111336 ) ) ( not ( = ?auto_1111335 ?auto_1111337 ) ) ( not ( = ?auto_1111335 ?auto_1111339 ) ) ( not ( = ?auto_1111335 ?auto_1111338 ) ) ( not ( = ?auto_1111335 ?auto_1111340 ) ) ( not ( = ?auto_1111335 ?auto_1111341 ) ) ( not ( = ?auto_1111336 ?auto_1111337 ) ) ( not ( = ?auto_1111336 ?auto_1111339 ) ) ( not ( = ?auto_1111336 ?auto_1111338 ) ) ( not ( = ?auto_1111336 ?auto_1111340 ) ) ( not ( = ?auto_1111336 ?auto_1111341 ) ) ( not ( = ?auto_1111337 ?auto_1111339 ) ) ( not ( = ?auto_1111337 ?auto_1111338 ) ) ( not ( = ?auto_1111337 ?auto_1111340 ) ) ( not ( = ?auto_1111337 ?auto_1111341 ) ) ( not ( = ?auto_1111339 ?auto_1111338 ) ) ( not ( = ?auto_1111339 ?auto_1111340 ) ) ( not ( = ?auto_1111339 ?auto_1111341 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1111338 ?auto_1111340 ?auto_1111341 )
      ( MAKE-6CRATE-VERIFY ?auto_1111335 ?auto_1111336 ?auto_1111337 ?auto_1111339 ?auto_1111338 ?auto_1111340 ?auto_1111341 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1111392 - SURFACE
      ?auto_1111393 - SURFACE
      ?auto_1111394 - SURFACE
      ?auto_1111396 - SURFACE
      ?auto_1111395 - SURFACE
      ?auto_1111397 - SURFACE
      ?auto_1111398 - SURFACE
    )
    :vars
    (
      ?auto_1111399 - HOIST
      ?auto_1111402 - PLACE
      ?auto_1111401 - TRUCK
      ?auto_1111400 - PLACE
      ?auto_1111403 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1111399 ?auto_1111402 ) ( SURFACE-AT ?auto_1111397 ?auto_1111402 ) ( CLEAR ?auto_1111397 ) ( IS-CRATE ?auto_1111398 ) ( not ( = ?auto_1111397 ?auto_1111398 ) ) ( AVAILABLE ?auto_1111399 ) ( ON ?auto_1111397 ?auto_1111395 ) ( not ( = ?auto_1111395 ?auto_1111397 ) ) ( not ( = ?auto_1111395 ?auto_1111398 ) ) ( TRUCK-AT ?auto_1111401 ?auto_1111400 ) ( not ( = ?auto_1111400 ?auto_1111402 ) ) ( HOIST-AT ?auto_1111403 ?auto_1111400 ) ( LIFTING ?auto_1111403 ?auto_1111398 ) ( not ( = ?auto_1111399 ?auto_1111403 ) ) ( ON ?auto_1111393 ?auto_1111392 ) ( ON ?auto_1111394 ?auto_1111393 ) ( ON ?auto_1111396 ?auto_1111394 ) ( ON ?auto_1111395 ?auto_1111396 ) ( not ( = ?auto_1111392 ?auto_1111393 ) ) ( not ( = ?auto_1111392 ?auto_1111394 ) ) ( not ( = ?auto_1111392 ?auto_1111396 ) ) ( not ( = ?auto_1111392 ?auto_1111395 ) ) ( not ( = ?auto_1111392 ?auto_1111397 ) ) ( not ( = ?auto_1111392 ?auto_1111398 ) ) ( not ( = ?auto_1111393 ?auto_1111394 ) ) ( not ( = ?auto_1111393 ?auto_1111396 ) ) ( not ( = ?auto_1111393 ?auto_1111395 ) ) ( not ( = ?auto_1111393 ?auto_1111397 ) ) ( not ( = ?auto_1111393 ?auto_1111398 ) ) ( not ( = ?auto_1111394 ?auto_1111396 ) ) ( not ( = ?auto_1111394 ?auto_1111395 ) ) ( not ( = ?auto_1111394 ?auto_1111397 ) ) ( not ( = ?auto_1111394 ?auto_1111398 ) ) ( not ( = ?auto_1111396 ?auto_1111395 ) ) ( not ( = ?auto_1111396 ?auto_1111397 ) ) ( not ( = ?auto_1111396 ?auto_1111398 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1111395 ?auto_1111397 ?auto_1111398 )
      ( MAKE-6CRATE-VERIFY ?auto_1111392 ?auto_1111393 ?auto_1111394 ?auto_1111396 ?auto_1111395 ?auto_1111397 ?auto_1111398 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1111455 - SURFACE
      ?auto_1111456 - SURFACE
      ?auto_1111457 - SURFACE
      ?auto_1111459 - SURFACE
      ?auto_1111458 - SURFACE
      ?auto_1111460 - SURFACE
      ?auto_1111461 - SURFACE
    )
    :vars
    (
      ?auto_1111464 - HOIST
      ?auto_1111463 - PLACE
      ?auto_1111466 - TRUCK
      ?auto_1111467 - PLACE
      ?auto_1111465 - HOIST
      ?auto_1111462 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1111464 ?auto_1111463 ) ( SURFACE-AT ?auto_1111460 ?auto_1111463 ) ( CLEAR ?auto_1111460 ) ( IS-CRATE ?auto_1111461 ) ( not ( = ?auto_1111460 ?auto_1111461 ) ) ( AVAILABLE ?auto_1111464 ) ( ON ?auto_1111460 ?auto_1111458 ) ( not ( = ?auto_1111458 ?auto_1111460 ) ) ( not ( = ?auto_1111458 ?auto_1111461 ) ) ( TRUCK-AT ?auto_1111466 ?auto_1111467 ) ( not ( = ?auto_1111467 ?auto_1111463 ) ) ( HOIST-AT ?auto_1111465 ?auto_1111467 ) ( not ( = ?auto_1111464 ?auto_1111465 ) ) ( AVAILABLE ?auto_1111465 ) ( SURFACE-AT ?auto_1111461 ?auto_1111467 ) ( ON ?auto_1111461 ?auto_1111462 ) ( CLEAR ?auto_1111461 ) ( not ( = ?auto_1111460 ?auto_1111462 ) ) ( not ( = ?auto_1111461 ?auto_1111462 ) ) ( not ( = ?auto_1111458 ?auto_1111462 ) ) ( ON ?auto_1111456 ?auto_1111455 ) ( ON ?auto_1111457 ?auto_1111456 ) ( ON ?auto_1111459 ?auto_1111457 ) ( ON ?auto_1111458 ?auto_1111459 ) ( not ( = ?auto_1111455 ?auto_1111456 ) ) ( not ( = ?auto_1111455 ?auto_1111457 ) ) ( not ( = ?auto_1111455 ?auto_1111459 ) ) ( not ( = ?auto_1111455 ?auto_1111458 ) ) ( not ( = ?auto_1111455 ?auto_1111460 ) ) ( not ( = ?auto_1111455 ?auto_1111461 ) ) ( not ( = ?auto_1111455 ?auto_1111462 ) ) ( not ( = ?auto_1111456 ?auto_1111457 ) ) ( not ( = ?auto_1111456 ?auto_1111459 ) ) ( not ( = ?auto_1111456 ?auto_1111458 ) ) ( not ( = ?auto_1111456 ?auto_1111460 ) ) ( not ( = ?auto_1111456 ?auto_1111461 ) ) ( not ( = ?auto_1111456 ?auto_1111462 ) ) ( not ( = ?auto_1111457 ?auto_1111459 ) ) ( not ( = ?auto_1111457 ?auto_1111458 ) ) ( not ( = ?auto_1111457 ?auto_1111460 ) ) ( not ( = ?auto_1111457 ?auto_1111461 ) ) ( not ( = ?auto_1111457 ?auto_1111462 ) ) ( not ( = ?auto_1111459 ?auto_1111458 ) ) ( not ( = ?auto_1111459 ?auto_1111460 ) ) ( not ( = ?auto_1111459 ?auto_1111461 ) ) ( not ( = ?auto_1111459 ?auto_1111462 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1111458 ?auto_1111460 ?auto_1111461 )
      ( MAKE-6CRATE-VERIFY ?auto_1111455 ?auto_1111456 ?auto_1111457 ?auto_1111459 ?auto_1111458 ?auto_1111460 ?auto_1111461 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1111519 - SURFACE
      ?auto_1111520 - SURFACE
      ?auto_1111521 - SURFACE
      ?auto_1111523 - SURFACE
      ?auto_1111522 - SURFACE
      ?auto_1111524 - SURFACE
      ?auto_1111525 - SURFACE
    )
    :vars
    (
      ?auto_1111531 - HOIST
      ?auto_1111526 - PLACE
      ?auto_1111530 - PLACE
      ?auto_1111528 - HOIST
      ?auto_1111527 - SURFACE
      ?auto_1111529 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1111531 ?auto_1111526 ) ( SURFACE-AT ?auto_1111524 ?auto_1111526 ) ( CLEAR ?auto_1111524 ) ( IS-CRATE ?auto_1111525 ) ( not ( = ?auto_1111524 ?auto_1111525 ) ) ( AVAILABLE ?auto_1111531 ) ( ON ?auto_1111524 ?auto_1111522 ) ( not ( = ?auto_1111522 ?auto_1111524 ) ) ( not ( = ?auto_1111522 ?auto_1111525 ) ) ( not ( = ?auto_1111530 ?auto_1111526 ) ) ( HOIST-AT ?auto_1111528 ?auto_1111530 ) ( not ( = ?auto_1111531 ?auto_1111528 ) ) ( AVAILABLE ?auto_1111528 ) ( SURFACE-AT ?auto_1111525 ?auto_1111530 ) ( ON ?auto_1111525 ?auto_1111527 ) ( CLEAR ?auto_1111525 ) ( not ( = ?auto_1111524 ?auto_1111527 ) ) ( not ( = ?auto_1111525 ?auto_1111527 ) ) ( not ( = ?auto_1111522 ?auto_1111527 ) ) ( TRUCK-AT ?auto_1111529 ?auto_1111526 ) ( ON ?auto_1111520 ?auto_1111519 ) ( ON ?auto_1111521 ?auto_1111520 ) ( ON ?auto_1111523 ?auto_1111521 ) ( ON ?auto_1111522 ?auto_1111523 ) ( not ( = ?auto_1111519 ?auto_1111520 ) ) ( not ( = ?auto_1111519 ?auto_1111521 ) ) ( not ( = ?auto_1111519 ?auto_1111523 ) ) ( not ( = ?auto_1111519 ?auto_1111522 ) ) ( not ( = ?auto_1111519 ?auto_1111524 ) ) ( not ( = ?auto_1111519 ?auto_1111525 ) ) ( not ( = ?auto_1111519 ?auto_1111527 ) ) ( not ( = ?auto_1111520 ?auto_1111521 ) ) ( not ( = ?auto_1111520 ?auto_1111523 ) ) ( not ( = ?auto_1111520 ?auto_1111522 ) ) ( not ( = ?auto_1111520 ?auto_1111524 ) ) ( not ( = ?auto_1111520 ?auto_1111525 ) ) ( not ( = ?auto_1111520 ?auto_1111527 ) ) ( not ( = ?auto_1111521 ?auto_1111523 ) ) ( not ( = ?auto_1111521 ?auto_1111522 ) ) ( not ( = ?auto_1111521 ?auto_1111524 ) ) ( not ( = ?auto_1111521 ?auto_1111525 ) ) ( not ( = ?auto_1111521 ?auto_1111527 ) ) ( not ( = ?auto_1111523 ?auto_1111522 ) ) ( not ( = ?auto_1111523 ?auto_1111524 ) ) ( not ( = ?auto_1111523 ?auto_1111525 ) ) ( not ( = ?auto_1111523 ?auto_1111527 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1111522 ?auto_1111524 ?auto_1111525 )
      ( MAKE-6CRATE-VERIFY ?auto_1111519 ?auto_1111520 ?auto_1111521 ?auto_1111523 ?auto_1111522 ?auto_1111524 ?auto_1111525 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1111583 - SURFACE
      ?auto_1111584 - SURFACE
      ?auto_1111585 - SURFACE
      ?auto_1111587 - SURFACE
      ?auto_1111586 - SURFACE
      ?auto_1111588 - SURFACE
      ?auto_1111589 - SURFACE
    )
    :vars
    (
      ?auto_1111591 - HOIST
      ?auto_1111594 - PLACE
      ?auto_1111593 - PLACE
      ?auto_1111590 - HOIST
      ?auto_1111592 - SURFACE
      ?auto_1111595 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1111591 ?auto_1111594 ) ( IS-CRATE ?auto_1111589 ) ( not ( = ?auto_1111588 ?auto_1111589 ) ) ( not ( = ?auto_1111586 ?auto_1111588 ) ) ( not ( = ?auto_1111586 ?auto_1111589 ) ) ( not ( = ?auto_1111593 ?auto_1111594 ) ) ( HOIST-AT ?auto_1111590 ?auto_1111593 ) ( not ( = ?auto_1111591 ?auto_1111590 ) ) ( AVAILABLE ?auto_1111590 ) ( SURFACE-AT ?auto_1111589 ?auto_1111593 ) ( ON ?auto_1111589 ?auto_1111592 ) ( CLEAR ?auto_1111589 ) ( not ( = ?auto_1111588 ?auto_1111592 ) ) ( not ( = ?auto_1111589 ?auto_1111592 ) ) ( not ( = ?auto_1111586 ?auto_1111592 ) ) ( TRUCK-AT ?auto_1111595 ?auto_1111594 ) ( SURFACE-AT ?auto_1111586 ?auto_1111594 ) ( CLEAR ?auto_1111586 ) ( LIFTING ?auto_1111591 ?auto_1111588 ) ( IS-CRATE ?auto_1111588 ) ( ON ?auto_1111584 ?auto_1111583 ) ( ON ?auto_1111585 ?auto_1111584 ) ( ON ?auto_1111587 ?auto_1111585 ) ( ON ?auto_1111586 ?auto_1111587 ) ( not ( = ?auto_1111583 ?auto_1111584 ) ) ( not ( = ?auto_1111583 ?auto_1111585 ) ) ( not ( = ?auto_1111583 ?auto_1111587 ) ) ( not ( = ?auto_1111583 ?auto_1111586 ) ) ( not ( = ?auto_1111583 ?auto_1111588 ) ) ( not ( = ?auto_1111583 ?auto_1111589 ) ) ( not ( = ?auto_1111583 ?auto_1111592 ) ) ( not ( = ?auto_1111584 ?auto_1111585 ) ) ( not ( = ?auto_1111584 ?auto_1111587 ) ) ( not ( = ?auto_1111584 ?auto_1111586 ) ) ( not ( = ?auto_1111584 ?auto_1111588 ) ) ( not ( = ?auto_1111584 ?auto_1111589 ) ) ( not ( = ?auto_1111584 ?auto_1111592 ) ) ( not ( = ?auto_1111585 ?auto_1111587 ) ) ( not ( = ?auto_1111585 ?auto_1111586 ) ) ( not ( = ?auto_1111585 ?auto_1111588 ) ) ( not ( = ?auto_1111585 ?auto_1111589 ) ) ( not ( = ?auto_1111585 ?auto_1111592 ) ) ( not ( = ?auto_1111587 ?auto_1111586 ) ) ( not ( = ?auto_1111587 ?auto_1111588 ) ) ( not ( = ?auto_1111587 ?auto_1111589 ) ) ( not ( = ?auto_1111587 ?auto_1111592 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1111586 ?auto_1111588 ?auto_1111589 )
      ( MAKE-6CRATE-VERIFY ?auto_1111583 ?auto_1111584 ?auto_1111585 ?auto_1111587 ?auto_1111586 ?auto_1111588 ?auto_1111589 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1111647 - SURFACE
      ?auto_1111648 - SURFACE
      ?auto_1111649 - SURFACE
      ?auto_1111651 - SURFACE
      ?auto_1111650 - SURFACE
      ?auto_1111652 - SURFACE
      ?auto_1111653 - SURFACE
    )
    :vars
    (
      ?auto_1111657 - HOIST
      ?auto_1111656 - PLACE
      ?auto_1111658 - PLACE
      ?auto_1111655 - HOIST
      ?auto_1111659 - SURFACE
      ?auto_1111654 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1111657 ?auto_1111656 ) ( IS-CRATE ?auto_1111653 ) ( not ( = ?auto_1111652 ?auto_1111653 ) ) ( not ( = ?auto_1111650 ?auto_1111652 ) ) ( not ( = ?auto_1111650 ?auto_1111653 ) ) ( not ( = ?auto_1111658 ?auto_1111656 ) ) ( HOIST-AT ?auto_1111655 ?auto_1111658 ) ( not ( = ?auto_1111657 ?auto_1111655 ) ) ( AVAILABLE ?auto_1111655 ) ( SURFACE-AT ?auto_1111653 ?auto_1111658 ) ( ON ?auto_1111653 ?auto_1111659 ) ( CLEAR ?auto_1111653 ) ( not ( = ?auto_1111652 ?auto_1111659 ) ) ( not ( = ?auto_1111653 ?auto_1111659 ) ) ( not ( = ?auto_1111650 ?auto_1111659 ) ) ( TRUCK-AT ?auto_1111654 ?auto_1111656 ) ( SURFACE-AT ?auto_1111650 ?auto_1111656 ) ( CLEAR ?auto_1111650 ) ( IS-CRATE ?auto_1111652 ) ( AVAILABLE ?auto_1111657 ) ( IN ?auto_1111652 ?auto_1111654 ) ( ON ?auto_1111648 ?auto_1111647 ) ( ON ?auto_1111649 ?auto_1111648 ) ( ON ?auto_1111651 ?auto_1111649 ) ( ON ?auto_1111650 ?auto_1111651 ) ( not ( = ?auto_1111647 ?auto_1111648 ) ) ( not ( = ?auto_1111647 ?auto_1111649 ) ) ( not ( = ?auto_1111647 ?auto_1111651 ) ) ( not ( = ?auto_1111647 ?auto_1111650 ) ) ( not ( = ?auto_1111647 ?auto_1111652 ) ) ( not ( = ?auto_1111647 ?auto_1111653 ) ) ( not ( = ?auto_1111647 ?auto_1111659 ) ) ( not ( = ?auto_1111648 ?auto_1111649 ) ) ( not ( = ?auto_1111648 ?auto_1111651 ) ) ( not ( = ?auto_1111648 ?auto_1111650 ) ) ( not ( = ?auto_1111648 ?auto_1111652 ) ) ( not ( = ?auto_1111648 ?auto_1111653 ) ) ( not ( = ?auto_1111648 ?auto_1111659 ) ) ( not ( = ?auto_1111649 ?auto_1111651 ) ) ( not ( = ?auto_1111649 ?auto_1111650 ) ) ( not ( = ?auto_1111649 ?auto_1111652 ) ) ( not ( = ?auto_1111649 ?auto_1111653 ) ) ( not ( = ?auto_1111649 ?auto_1111659 ) ) ( not ( = ?auto_1111651 ?auto_1111650 ) ) ( not ( = ?auto_1111651 ?auto_1111652 ) ) ( not ( = ?auto_1111651 ?auto_1111653 ) ) ( not ( = ?auto_1111651 ?auto_1111659 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1111650 ?auto_1111652 ?auto_1111653 )
      ( MAKE-6CRATE-VERIFY ?auto_1111647 ?auto_1111648 ?auto_1111649 ?auto_1111651 ?auto_1111650 ?auto_1111652 ?auto_1111653 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1113597 - SURFACE
      ?auto_1113598 - SURFACE
      ?auto_1113599 - SURFACE
      ?auto_1113601 - SURFACE
      ?auto_1113600 - SURFACE
      ?auto_1113602 - SURFACE
      ?auto_1113603 - SURFACE
      ?auto_1113604 - SURFACE
    )
    :vars
    (
      ?auto_1113605 - HOIST
      ?auto_1113606 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1113605 ?auto_1113606 ) ( SURFACE-AT ?auto_1113603 ?auto_1113606 ) ( CLEAR ?auto_1113603 ) ( LIFTING ?auto_1113605 ?auto_1113604 ) ( IS-CRATE ?auto_1113604 ) ( not ( = ?auto_1113603 ?auto_1113604 ) ) ( ON ?auto_1113598 ?auto_1113597 ) ( ON ?auto_1113599 ?auto_1113598 ) ( ON ?auto_1113601 ?auto_1113599 ) ( ON ?auto_1113600 ?auto_1113601 ) ( ON ?auto_1113602 ?auto_1113600 ) ( ON ?auto_1113603 ?auto_1113602 ) ( not ( = ?auto_1113597 ?auto_1113598 ) ) ( not ( = ?auto_1113597 ?auto_1113599 ) ) ( not ( = ?auto_1113597 ?auto_1113601 ) ) ( not ( = ?auto_1113597 ?auto_1113600 ) ) ( not ( = ?auto_1113597 ?auto_1113602 ) ) ( not ( = ?auto_1113597 ?auto_1113603 ) ) ( not ( = ?auto_1113597 ?auto_1113604 ) ) ( not ( = ?auto_1113598 ?auto_1113599 ) ) ( not ( = ?auto_1113598 ?auto_1113601 ) ) ( not ( = ?auto_1113598 ?auto_1113600 ) ) ( not ( = ?auto_1113598 ?auto_1113602 ) ) ( not ( = ?auto_1113598 ?auto_1113603 ) ) ( not ( = ?auto_1113598 ?auto_1113604 ) ) ( not ( = ?auto_1113599 ?auto_1113601 ) ) ( not ( = ?auto_1113599 ?auto_1113600 ) ) ( not ( = ?auto_1113599 ?auto_1113602 ) ) ( not ( = ?auto_1113599 ?auto_1113603 ) ) ( not ( = ?auto_1113599 ?auto_1113604 ) ) ( not ( = ?auto_1113601 ?auto_1113600 ) ) ( not ( = ?auto_1113601 ?auto_1113602 ) ) ( not ( = ?auto_1113601 ?auto_1113603 ) ) ( not ( = ?auto_1113601 ?auto_1113604 ) ) ( not ( = ?auto_1113600 ?auto_1113602 ) ) ( not ( = ?auto_1113600 ?auto_1113603 ) ) ( not ( = ?auto_1113600 ?auto_1113604 ) ) ( not ( = ?auto_1113602 ?auto_1113603 ) ) ( not ( = ?auto_1113602 ?auto_1113604 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1113603 ?auto_1113604 )
      ( MAKE-7CRATE-VERIFY ?auto_1113597 ?auto_1113598 ?auto_1113599 ?auto_1113601 ?auto_1113600 ?auto_1113602 ?auto_1113603 ?auto_1113604 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1113652 - SURFACE
      ?auto_1113653 - SURFACE
      ?auto_1113654 - SURFACE
      ?auto_1113656 - SURFACE
      ?auto_1113655 - SURFACE
      ?auto_1113657 - SURFACE
      ?auto_1113658 - SURFACE
      ?auto_1113659 - SURFACE
    )
    :vars
    (
      ?auto_1113662 - HOIST
      ?auto_1113661 - PLACE
      ?auto_1113660 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1113662 ?auto_1113661 ) ( SURFACE-AT ?auto_1113658 ?auto_1113661 ) ( CLEAR ?auto_1113658 ) ( IS-CRATE ?auto_1113659 ) ( not ( = ?auto_1113658 ?auto_1113659 ) ) ( TRUCK-AT ?auto_1113660 ?auto_1113661 ) ( AVAILABLE ?auto_1113662 ) ( IN ?auto_1113659 ?auto_1113660 ) ( ON ?auto_1113658 ?auto_1113657 ) ( not ( = ?auto_1113657 ?auto_1113658 ) ) ( not ( = ?auto_1113657 ?auto_1113659 ) ) ( ON ?auto_1113653 ?auto_1113652 ) ( ON ?auto_1113654 ?auto_1113653 ) ( ON ?auto_1113656 ?auto_1113654 ) ( ON ?auto_1113655 ?auto_1113656 ) ( ON ?auto_1113657 ?auto_1113655 ) ( not ( = ?auto_1113652 ?auto_1113653 ) ) ( not ( = ?auto_1113652 ?auto_1113654 ) ) ( not ( = ?auto_1113652 ?auto_1113656 ) ) ( not ( = ?auto_1113652 ?auto_1113655 ) ) ( not ( = ?auto_1113652 ?auto_1113657 ) ) ( not ( = ?auto_1113652 ?auto_1113658 ) ) ( not ( = ?auto_1113652 ?auto_1113659 ) ) ( not ( = ?auto_1113653 ?auto_1113654 ) ) ( not ( = ?auto_1113653 ?auto_1113656 ) ) ( not ( = ?auto_1113653 ?auto_1113655 ) ) ( not ( = ?auto_1113653 ?auto_1113657 ) ) ( not ( = ?auto_1113653 ?auto_1113658 ) ) ( not ( = ?auto_1113653 ?auto_1113659 ) ) ( not ( = ?auto_1113654 ?auto_1113656 ) ) ( not ( = ?auto_1113654 ?auto_1113655 ) ) ( not ( = ?auto_1113654 ?auto_1113657 ) ) ( not ( = ?auto_1113654 ?auto_1113658 ) ) ( not ( = ?auto_1113654 ?auto_1113659 ) ) ( not ( = ?auto_1113656 ?auto_1113655 ) ) ( not ( = ?auto_1113656 ?auto_1113657 ) ) ( not ( = ?auto_1113656 ?auto_1113658 ) ) ( not ( = ?auto_1113656 ?auto_1113659 ) ) ( not ( = ?auto_1113655 ?auto_1113657 ) ) ( not ( = ?auto_1113655 ?auto_1113658 ) ) ( not ( = ?auto_1113655 ?auto_1113659 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1113657 ?auto_1113658 ?auto_1113659 )
      ( MAKE-7CRATE-VERIFY ?auto_1113652 ?auto_1113653 ?auto_1113654 ?auto_1113656 ?auto_1113655 ?auto_1113657 ?auto_1113658 ?auto_1113659 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1113715 - SURFACE
      ?auto_1113716 - SURFACE
      ?auto_1113717 - SURFACE
      ?auto_1113719 - SURFACE
      ?auto_1113718 - SURFACE
      ?auto_1113720 - SURFACE
      ?auto_1113721 - SURFACE
      ?auto_1113722 - SURFACE
    )
    :vars
    (
      ?auto_1113726 - HOIST
      ?auto_1113723 - PLACE
      ?auto_1113724 - TRUCK
      ?auto_1113725 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1113726 ?auto_1113723 ) ( SURFACE-AT ?auto_1113721 ?auto_1113723 ) ( CLEAR ?auto_1113721 ) ( IS-CRATE ?auto_1113722 ) ( not ( = ?auto_1113721 ?auto_1113722 ) ) ( AVAILABLE ?auto_1113726 ) ( IN ?auto_1113722 ?auto_1113724 ) ( ON ?auto_1113721 ?auto_1113720 ) ( not ( = ?auto_1113720 ?auto_1113721 ) ) ( not ( = ?auto_1113720 ?auto_1113722 ) ) ( TRUCK-AT ?auto_1113724 ?auto_1113725 ) ( not ( = ?auto_1113725 ?auto_1113723 ) ) ( ON ?auto_1113716 ?auto_1113715 ) ( ON ?auto_1113717 ?auto_1113716 ) ( ON ?auto_1113719 ?auto_1113717 ) ( ON ?auto_1113718 ?auto_1113719 ) ( ON ?auto_1113720 ?auto_1113718 ) ( not ( = ?auto_1113715 ?auto_1113716 ) ) ( not ( = ?auto_1113715 ?auto_1113717 ) ) ( not ( = ?auto_1113715 ?auto_1113719 ) ) ( not ( = ?auto_1113715 ?auto_1113718 ) ) ( not ( = ?auto_1113715 ?auto_1113720 ) ) ( not ( = ?auto_1113715 ?auto_1113721 ) ) ( not ( = ?auto_1113715 ?auto_1113722 ) ) ( not ( = ?auto_1113716 ?auto_1113717 ) ) ( not ( = ?auto_1113716 ?auto_1113719 ) ) ( not ( = ?auto_1113716 ?auto_1113718 ) ) ( not ( = ?auto_1113716 ?auto_1113720 ) ) ( not ( = ?auto_1113716 ?auto_1113721 ) ) ( not ( = ?auto_1113716 ?auto_1113722 ) ) ( not ( = ?auto_1113717 ?auto_1113719 ) ) ( not ( = ?auto_1113717 ?auto_1113718 ) ) ( not ( = ?auto_1113717 ?auto_1113720 ) ) ( not ( = ?auto_1113717 ?auto_1113721 ) ) ( not ( = ?auto_1113717 ?auto_1113722 ) ) ( not ( = ?auto_1113719 ?auto_1113718 ) ) ( not ( = ?auto_1113719 ?auto_1113720 ) ) ( not ( = ?auto_1113719 ?auto_1113721 ) ) ( not ( = ?auto_1113719 ?auto_1113722 ) ) ( not ( = ?auto_1113718 ?auto_1113720 ) ) ( not ( = ?auto_1113718 ?auto_1113721 ) ) ( not ( = ?auto_1113718 ?auto_1113722 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1113720 ?auto_1113721 ?auto_1113722 )
      ( MAKE-7CRATE-VERIFY ?auto_1113715 ?auto_1113716 ?auto_1113717 ?auto_1113719 ?auto_1113718 ?auto_1113720 ?auto_1113721 ?auto_1113722 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1113785 - SURFACE
      ?auto_1113786 - SURFACE
      ?auto_1113787 - SURFACE
      ?auto_1113789 - SURFACE
      ?auto_1113788 - SURFACE
      ?auto_1113790 - SURFACE
      ?auto_1113791 - SURFACE
      ?auto_1113792 - SURFACE
    )
    :vars
    (
      ?auto_1113797 - HOIST
      ?auto_1113795 - PLACE
      ?auto_1113793 - TRUCK
      ?auto_1113794 - PLACE
      ?auto_1113796 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1113797 ?auto_1113795 ) ( SURFACE-AT ?auto_1113791 ?auto_1113795 ) ( CLEAR ?auto_1113791 ) ( IS-CRATE ?auto_1113792 ) ( not ( = ?auto_1113791 ?auto_1113792 ) ) ( AVAILABLE ?auto_1113797 ) ( ON ?auto_1113791 ?auto_1113790 ) ( not ( = ?auto_1113790 ?auto_1113791 ) ) ( not ( = ?auto_1113790 ?auto_1113792 ) ) ( TRUCK-AT ?auto_1113793 ?auto_1113794 ) ( not ( = ?auto_1113794 ?auto_1113795 ) ) ( HOIST-AT ?auto_1113796 ?auto_1113794 ) ( LIFTING ?auto_1113796 ?auto_1113792 ) ( not ( = ?auto_1113797 ?auto_1113796 ) ) ( ON ?auto_1113786 ?auto_1113785 ) ( ON ?auto_1113787 ?auto_1113786 ) ( ON ?auto_1113789 ?auto_1113787 ) ( ON ?auto_1113788 ?auto_1113789 ) ( ON ?auto_1113790 ?auto_1113788 ) ( not ( = ?auto_1113785 ?auto_1113786 ) ) ( not ( = ?auto_1113785 ?auto_1113787 ) ) ( not ( = ?auto_1113785 ?auto_1113789 ) ) ( not ( = ?auto_1113785 ?auto_1113788 ) ) ( not ( = ?auto_1113785 ?auto_1113790 ) ) ( not ( = ?auto_1113785 ?auto_1113791 ) ) ( not ( = ?auto_1113785 ?auto_1113792 ) ) ( not ( = ?auto_1113786 ?auto_1113787 ) ) ( not ( = ?auto_1113786 ?auto_1113789 ) ) ( not ( = ?auto_1113786 ?auto_1113788 ) ) ( not ( = ?auto_1113786 ?auto_1113790 ) ) ( not ( = ?auto_1113786 ?auto_1113791 ) ) ( not ( = ?auto_1113786 ?auto_1113792 ) ) ( not ( = ?auto_1113787 ?auto_1113789 ) ) ( not ( = ?auto_1113787 ?auto_1113788 ) ) ( not ( = ?auto_1113787 ?auto_1113790 ) ) ( not ( = ?auto_1113787 ?auto_1113791 ) ) ( not ( = ?auto_1113787 ?auto_1113792 ) ) ( not ( = ?auto_1113789 ?auto_1113788 ) ) ( not ( = ?auto_1113789 ?auto_1113790 ) ) ( not ( = ?auto_1113789 ?auto_1113791 ) ) ( not ( = ?auto_1113789 ?auto_1113792 ) ) ( not ( = ?auto_1113788 ?auto_1113790 ) ) ( not ( = ?auto_1113788 ?auto_1113791 ) ) ( not ( = ?auto_1113788 ?auto_1113792 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1113790 ?auto_1113791 ?auto_1113792 )
      ( MAKE-7CRATE-VERIFY ?auto_1113785 ?auto_1113786 ?auto_1113787 ?auto_1113789 ?auto_1113788 ?auto_1113790 ?auto_1113791 ?auto_1113792 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1113862 - SURFACE
      ?auto_1113863 - SURFACE
      ?auto_1113864 - SURFACE
      ?auto_1113866 - SURFACE
      ?auto_1113865 - SURFACE
      ?auto_1113867 - SURFACE
      ?auto_1113868 - SURFACE
      ?auto_1113869 - SURFACE
    )
    :vars
    (
      ?auto_1113871 - HOIST
      ?auto_1113870 - PLACE
      ?auto_1113872 - TRUCK
      ?auto_1113874 - PLACE
      ?auto_1113875 - HOIST
      ?auto_1113873 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1113871 ?auto_1113870 ) ( SURFACE-AT ?auto_1113868 ?auto_1113870 ) ( CLEAR ?auto_1113868 ) ( IS-CRATE ?auto_1113869 ) ( not ( = ?auto_1113868 ?auto_1113869 ) ) ( AVAILABLE ?auto_1113871 ) ( ON ?auto_1113868 ?auto_1113867 ) ( not ( = ?auto_1113867 ?auto_1113868 ) ) ( not ( = ?auto_1113867 ?auto_1113869 ) ) ( TRUCK-AT ?auto_1113872 ?auto_1113874 ) ( not ( = ?auto_1113874 ?auto_1113870 ) ) ( HOIST-AT ?auto_1113875 ?auto_1113874 ) ( not ( = ?auto_1113871 ?auto_1113875 ) ) ( AVAILABLE ?auto_1113875 ) ( SURFACE-AT ?auto_1113869 ?auto_1113874 ) ( ON ?auto_1113869 ?auto_1113873 ) ( CLEAR ?auto_1113869 ) ( not ( = ?auto_1113868 ?auto_1113873 ) ) ( not ( = ?auto_1113869 ?auto_1113873 ) ) ( not ( = ?auto_1113867 ?auto_1113873 ) ) ( ON ?auto_1113863 ?auto_1113862 ) ( ON ?auto_1113864 ?auto_1113863 ) ( ON ?auto_1113866 ?auto_1113864 ) ( ON ?auto_1113865 ?auto_1113866 ) ( ON ?auto_1113867 ?auto_1113865 ) ( not ( = ?auto_1113862 ?auto_1113863 ) ) ( not ( = ?auto_1113862 ?auto_1113864 ) ) ( not ( = ?auto_1113862 ?auto_1113866 ) ) ( not ( = ?auto_1113862 ?auto_1113865 ) ) ( not ( = ?auto_1113862 ?auto_1113867 ) ) ( not ( = ?auto_1113862 ?auto_1113868 ) ) ( not ( = ?auto_1113862 ?auto_1113869 ) ) ( not ( = ?auto_1113862 ?auto_1113873 ) ) ( not ( = ?auto_1113863 ?auto_1113864 ) ) ( not ( = ?auto_1113863 ?auto_1113866 ) ) ( not ( = ?auto_1113863 ?auto_1113865 ) ) ( not ( = ?auto_1113863 ?auto_1113867 ) ) ( not ( = ?auto_1113863 ?auto_1113868 ) ) ( not ( = ?auto_1113863 ?auto_1113869 ) ) ( not ( = ?auto_1113863 ?auto_1113873 ) ) ( not ( = ?auto_1113864 ?auto_1113866 ) ) ( not ( = ?auto_1113864 ?auto_1113865 ) ) ( not ( = ?auto_1113864 ?auto_1113867 ) ) ( not ( = ?auto_1113864 ?auto_1113868 ) ) ( not ( = ?auto_1113864 ?auto_1113869 ) ) ( not ( = ?auto_1113864 ?auto_1113873 ) ) ( not ( = ?auto_1113866 ?auto_1113865 ) ) ( not ( = ?auto_1113866 ?auto_1113867 ) ) ( not ( = ?auto_1113866 ?auto_1113868 ) ) ( not ( = ?auto_1113866 ?auto_1113869 ) ) ( not ( = ?auto_1113866 ?auto_1113873 ) ) ( not ( = ?auto_1113865 ?auto_1113867 ) ) ( not ( = ?auto_1113865 ?auto_1113868 ) ) ( not ( = ?auto_1113865 ?auto_1113869 ) ) ( not ( = ?auto_1113865 ?auto_1113873 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1113867 ?auto_1113868 ?auto_1113869 )
      ( MAKE-7CRATE-VERIFY ?auto_1113862 ?auto_1113863 ?auto_1113864 ?auto_1113866 ?auto_1113865 ?auto_1113867 ?auto_1113868 ?auto_1113869 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1113940 - SURFACE
      ?auto_1113941 - SURFACE
      ?auto_1113942 - SURFACE
      ?auto_1113944 - SURFACE
      ?auto_1113943 - SURFACE
      ?auto_1113945 - SURFACE
      ?auto_1113946 - SURFACE
      ?auto_1113947 - SURFACE
    )
    :vars
    (
      ?auto_1113948 - HOIST
      ?auto_1113953 - PLACE
      ?auto_1113952 - PLACE
      ?auto_1113950 - HOIST
      ?auto_1113951 - SURFACE
      ?auto_1113949 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1113948 ?auto_1113953 ) ( SURFACE-AT ?auto_1113946 ?auto_1113953 ) ( CLEAR ?auto_1113946 ) ( IS-CRATE ?auto_1113947 ) ( not ( = ?auto_1113946 ?auto_1113947 ) ) ( AVAILABLE ?auto_1113948 ) ( ON ?auto_1113946 ?auto_1113945 ) ( not ( = ?auto_1113945 ?auto_1113946 ) ) ( not ( = ?auto_1113945 ?auto_1113947 ) ) ( not ( = ?auto_1113952 ?auto_1113953 ) ) ( HOIST-AT ?auto_1113950 ?auto_1113952 ) ( not ( = ?auto_1113948 ?auto_1113950 ) ) ( AVAILABLE ?auto_1113950 ) ( SURFACE-AT ?auto_1113947 ?auto_1113952 ) ( ON ?auto_1113947 ?auto_1113951 ) ( CLEAR ?auto_1113947 ) ( not ( = ?auto_1113946 ?auto_1113951 ) ) ( not ( = ?auto_1113947 ?auto_1113951 ) ) ( not ( = ?auto_1113945 ?auto_1113951 ) ) ( TRUCK-AT ?auto_1113949 ?auto_1113953 ) ( ON ?auto_1113941 ?auto_1113940 ) ( ON ?auto_1113942 ?auto_1113941 ) ( ON ?auto_1113944 ?auto_1113942 ) ( ON ?auto_1113943 ?auto_1113944 ) ( ON ?auto_1113945 ?auto_1113943 ) ( not ( = ?auto_1113940 ?auto_1113941 ) ) ( not ( = ?auto_1113940 ?auto_1113942 ) ) ( not ( = ?auto_1113940 ?auto_1113944 ) ) ( not ( = ?auto_1113940 ?auto_1113943 ) ) ( not ( = ?auto_1113940 ?auto_1113945 ) ) ( not ( = ?auto_1113940 ?auto_1113946 ) ) ( not ( = ?auto_1113940 ?auto_1113947 ) ) ( not ( = ?auto_1113940 ?auto_1113951 ) ) ( not ( = ?auto_1113941 ?auto_1113942 ) ) ( not ( = ?auto_1113941 ?auto_1113944 ) ) ( not ( = ?auto_1113941 ?auto_1113943 ) ) ( not ( = ?auto_1113941 ?auto_1113945 ) ) ( not ( = ?auto_1113941 ?auto_1113946 ) ) ( not ( = ?auto_1113941 ?auto_1113947 ) ) ( not ( = ?auto_1113941 ?auto_1113951 ) ) ( not ( = ?auto_1113942 ?auto_1113944 ) ) ( not ( = ?auto_1113942 ?auto_1113943 ) ) ( not ( = ?auto_1113942 ?auto_1113945 ) ) ( not ( = ?auto_1113942 ?auto_1113946 ) ) ( not ( = ?auto_1113942 ?auto_1113947 ) ) ( not ( = ?auto_1113942 ?auto_1113951 ) ) ( not ( = ?auto_1113944 ?auto_1113943 ) ) ( not ( = ?auto_1113944 ?auto_1113945 ) ) ( not ( = ?auto_1113944 ?auto_1113946 ) ) ( not ( = ?auto_1113944 ?auto_1113947 ) ) ( not ( = ?auto_1113944 ?auto_1113951 ) ) ( not ( = ?auto_1113943 ?auto_1113945 ) ) ( not ( = ?auto_1113943 ?auto_1113946 ) ) ( not ( = ?auto_1113943 ?auto_1113947 ) ) ( not ( = ?auto_1113943 ?auto_1113951 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1113945 ?auto_1113946 ?auto_1113947 )
      ( MAKE-7CRATE-VERIFY ?auto_1113940 ?auto_1113941 ?auto_1113942 ?auto_1113944 ?auto_1113943 ?auto_1113945 ?auto_1113946 ?auto_1113947 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1114018 - SURFACE
      ?auto_1114019 - SURFACE
      ?auto_1114020 - SURFACE
      ?auto_1114022 - SURFACE
      ?auto_1114021 - SURFACE
      ?auto_1114023 - SURFACE
      ?auto_1114024 - SURFACE
      ?auto_1114025 - SURFACE
    )
    :vars
    (
      ?auto_1114028 - HOIST
      ?auto_1114031 - PLACE
      ?auto_1114026 - PLACE
      ?auto_1114027 - HOIST
      ?auto_1114030 - SURFACE
      ?auto_1114029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1114028 ?auto_1114031 ) ( IS-CRATE ?auto_1114025 ) ( not ( = ?auto_1114024 ?auto_1114025 ) ) ( not ( = ?auto_1114023 ?auto_1114024 ) ) ( not ( = ?auto_1114023 ?auto_1114025 ) ) ( not ( = ?auto_1114026 ?auto_1114031 ) ) ( HOIST-AT ?auto_1114027 ?auto_1114026 ) ( not ( = ?auto_1114028 ?auto_1114027 ) ) ( AVAILABLE ?auto_1114027 ) ( SURFACE-AT ?auto_1114025 ?auto_1114026 ) ( ON ?auto_1114025 ?auto_1114030 ) ( CLEAR ?auto_1114025 ) ( not ( = ?auto_1114024 ?auto_1114030 ) ) ( not ( = ?auto_1114025 ?auto_1114030 ) ) ( not ( = ?auto_1114023 ?auto_1114030 ) ) ( TRUCK-AT ?auto_1114029 ?auto_1114031 ) ( SURFACE-AT ?auto_1114023 ?auto_1114031 ) ( CLEAR ?auto_1114023 ) ( LIFTING ?auto_1114028 ?auto_1114024 ) ( IS-CRATE ?auto_1114024 ) ( ON ?auto_1114019 ?auto_1114018 ) ( ON ?auto_1114020 ?auto_1114019 ) ( ON ?auto_1114022 ?auto_1114020 ) ( ON ?auto_1114021 ?auto_1114022 ) ( ON ?auto_1114023 ?auto_1114021 ) ( not ( = ?auto_1114018 ?auto_1114019 ) ) ( not ( = ?auto_1114018 ?auto_1114020 ) ) ( not ( = ?auto_1114018 ?auto_1114022 ) ) ( not ( = ?auto_1114018 ?auto_1114021 ) ) ( not ( = ?auto_1114018 ?auto_1114023 ) ) ( not ( = ?auto_1114018 ?auto_1114024 ) ) ( not ( = ?auto_1114018 ?auto_1114025 ) ) ( not ( = ?auto_1114018 ?auto_1114030 ) ) ( not ( = ?auto_1114019 ?auto_1114020 ) ) ( not ( = ?auto_1114019 ?auto_1114022 ) ) ( not ( = ?auto_1114019 ?auto_1114021 ) ) ( not ( = ?auto_1114019 ?auto_1114023 ) ) ( not ( = ?auto_1114019 ?auto_1114024 ) ) ( not ( = ?auto_1114019 ?auto_1114025 ) ) ( not ( = ?auto_1114019 ?auto_1114030 ) ) ( not ( = ?auto_1114020 ?auto_1114022 ) ) ( not ( = ?auto_1114020 ?auto_1114021 ) ) ( not ( = ?auto_1114020 ?auto_1114023 ) ) ( not ( = ?auto_1114020 ?auto_1114024 ) ) ( not ( = ?auto_1114020 ?auto_1114025 ) ) ( not ( = ?auto_1114020 ?auto_1114030 ) ) ( not ( = ?auto_1114022 ?auto_1114021 ) ) ( not ( = ?auto_1114022 ?auto_1114023 ) ) ( not ( = ?auto_1114022 ?auto_1114024 ) ) ( not ( = ?auto_1114022 ?auto_1114025 ) ) ( not ( = ?auto_1114022 ?auto_1114030 ) ) ( not ( = ?auto_1114021 ?auto_1114023 ) ) ( not ( = ?auto_1114021 ?auto_1114024 ) ) ( not ( = ?auto_1114021 ?auto_1114025 ) ) ( not ( = ?auto_1114021 ?auto_1114030 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1114023 ?auto_1114024 ?auto_1114025 )
      ( MAKE-7CRATE-VERIFY ?auto_1114018 ?auto_1114019 ?auto_1114020 ?auto_1114022 ?auto_1114021 ?auto_1114023 ?auto_1114024 ?auto_1114025 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1114096 - SURFACE
      ?auto_1114097 - SURFACE
      ?auto_1114098 - SURFACE
      ?auto_1114100 - SURFACE
      ?auto_1114099 - SURFACE
      ?auto_1114101 - SURFACE
      ?auto_1114102 - SURFACE
      ?auto_1114103 - SURFACE
    )
    :vars
    (
      ?auto_1114106 - HOIST
      ?auto_1114104 - PLACE
      ?auto_1114105 - PLACE
      ?auto_1114107 - HOIST
      ?auto_1114108 - SURFACE
      ?auto_1114109 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1114106 ?auto_1114104 ) ( IS-CRATE ?auto_1114103 ) ( not ( = ?auto_1114102 ?auto_1114103 ) ) ( not ( = ?auto_1114101 ?auto_1114102 ) ) ( not ( = ?auto_1114101 ?auto_1114103 ) ) ( not ( = ?auto_1114105 ?auto_1114104 ) ) ( HOIST-AT ?auto_1114107 ?auto_1114105 ) ( not ( = ?auto_1114106 ?auto_1114107 ) ) ( AVAILABLE ?auto_1114107 ) ( SURFACE-AT ?auto_1114103 ?auto_1114105 ) ( ON ?auto_1114103 ?auto_1114108 ) ( CLEAR ?auto_1114103 ) ( not ( = ?auto_1114102 ?auto_1114108 ) ) ( not ( = ?auto_1114103 ?auto_1114108 ) ) ( not ( = ?auto_1114101 ?auto_1114108 ) ) ( TRUCK-AT ?auto_1114109 ?auto_1114104 ) ( SURFACE-AT ?auto_1114101 ?auto_1114104 ) ( CLEAR ?auto_1114101 ) ( IS-CRATE ?auto_1114102 ) ( AVAILABLE ?auto_1114106 ) ( IN ?auto_1114102 ?auto_1114109 ) ( ON ?auto_1114097 ?auto_1114096 ) ( ON ?auto_1114098 ?auto_1114097 ) ( ON ?auto_1114100 ?auto_1114098 ) ( ON ?auto_1114099 ?auto_1114100 ) ( ON ?auto_1114101 ?auto_1114099 ) ( not ( = ?auto_1114096 ?auto_1114097 ) ) ( not ( = ?auto_1114096 ?auto_1114098 ) ) ( not ( = ?auto_1114096 ?auto_1114100 ) ) ( not ( = ?auto_1114096 ?auto_1114099 ) ) ( not ( = ?auto_1114096 ?auto_1114101 ) ) ( not ( = ?auto_1114096 ?auto_1114102 ) ) ( not ( = ?auto_1114096 ?auto_1114103 ) ) ( not ( = ?auto_1114096 ?auto_1114108 ) ) ( not ( = ?auto_1114097 ?auto_1114098 ) ) ( not ( = ?auto_1114097 ?auto_1114100 ) ) ( not ( = ?auto_1114097 ?auto_1114099 ) ) ( not ( = ?auto_1114097 ?auto_1114101 ) ) ( not ( = ?auto_1114097 ?auto_1114102 ) ) ( not ( = ?auto_1114097 ?auto_1114103 ) ) ( not ( = ?auto_1114097 ?auto_1114108 ) ) ( not ( = ?auto_1114098 ?auto_1114100 ) ) ( not ( = ?auto_1114098 ?auto_1114099 ) ) ( not ( = ?auto_1114098 ?auto_1114101 ) ) ( not ( = ?auto_1114098 ?auto_1114102 ) ) ( not ( = ?auto_1114098 ?auto_1114103 ) ) ( not ( = ?auto_1114098 ?auto_1114108 ) ) ( not ( = ?auto_1114100 ?auto_1114099 ) ) ( not ( = ?auto_1114100 ?auto_1114101 ) ) ( not ( = ?auto_1114100 ?auto_1114102 ) ) ( not ( = ?auto_1114100 ?auto_1114103 ) ) ( not ( = ?auto_1114100 ?auto_1114108 ) ) ( not ( = ?auto_1114099 ?auto_1114101 ) ) ( not ( = ?auto_1114099 ?auto_1114102 ) ) ( not ( = ?auto_1114099 ?auto_1114103 ) ) ( not ( = ?auto_1114099 ?auto_1114108 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1114101 ?auto_1114102 ?auto_1114103 )
      ( MAKE-7CRATE-VERIFY ?auto_1114096 ?auto_1114097 ?auto_1114098 ?auto_1114100 ?auto_1114099 ?auto_1114101 ?auto_1114102 ?auto_1114103 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1117015 - SURFACE
      ?auto_1117016 - SURFACE
      ?auto_1117017 - SURFACE
      ?auto_1117019 - SURFACE
      ?auto_1117018 - SURFACE
      ?auto_1117020 - SURFACE
      ?auto_1117021 - SURFACE
      ?auto_1117022 - SURFACE
      ?auto_1117023 - SURFACE
    )
    :vars
    (
      ?auto_1117025 - HOIST
      ?auto_1117024 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1117025 ?auto_1117024 ) ( SURFACE-AT ?auto_1117022 ?auto_1117024 ) ( CLEAR ?auto_1117022 ) ( LIFTING ?auto_1117025 ?auto_1117023 ) ( IS-CRATE ?auto_1117023 ) ( not ( = ?auto_1117022 ?auto_1117023 ) ) ( ON ?auto_1117016 ?auto_1117015 ) ( ON ?auto_1117017 ?auto_1117016 ) ( ON ?auto_1117019 ?auto_1117017 ) ( ON ?auto_1117018 ?auto_1117019 ) ( ON ?auto_1117020 ?auto_1117018 ) ( ON ?auto_1117021 ?auto_1117020 ) ( ON ?auto_1117022 ?auto_1117021 ) ( not ( = ?auto_1117015 ?auto_1117016 ) ) ( not ( = ?auto_1117015 ?auto_1117017 ) ) ( not ( = ?auto_1117015 ?auto_1117019 ) ) ( not ( = ?auto_1117015 ?auto_1117018 ) ) ( not ( = ?auto_1117015 ?auto_1117020 ) ) ( not ( = ?auto_1117015 ?auto_1117021 ) ) ( not ( = ?auto_1117015 ?auto_1117022 ) ) ( not ( = ?auto_1117015 ?auto_1117023 ) ) ( not ( = ?auto_1117016 ?auto_1117017 ) ) ( not ( = ?auto_1117016 ?auto_1117019 ) ) ( not ( = ?auto_1117016 ?auto_1117018 ) ) ( not ( = ?auto_1117016 ?auto_1117020 ) ) ( not ( = ?auto_1117016 ?auto_1117021 ) ) ( not ( = ?auto_1117016 ?auto_1117022 ) ) ( not ( = ?auto_1117016 ?auto_1117023 ) ) ( not ( = ?auto_1117017 ?auto_1117019 ) ) ( not ( = ?auto_1117017 ?auto_1117018 ) ) ( not ( = ?auto_1117017 ?auto_1117020 ) ) ( not ( = ?auto_1117017 ?auto_1117021 ) ) ( not ( = ?auto_1117017 ?auto_1117022 ) ) ( not ( = ?auto_1117017 ?auto_1117023 ) ) ( not ( = ?auto_1117019 ?auto_1117018 ) ) ( not ( = ?auto_1117019 ?auto_1117020 ) ) ( not ( = ?auto_1117019 ?auto_1117021 ) ) ( not ( = ?auto_1117019 ?auto_1117022 ) ) ( not ( = ?auto_1117019 ?auto_1117023 ) ) ( not ( = ?auto_1117018 ?auto_1117020 ) ) ( not ( = ?auto_1117018 ?auto_1117021 ) ) ( not ( = ?auto_1117018 ?auto_1117022 ) ) ( not ( = ?auto_1117018 ?auto_1117023 ) ) ( not ( = ?auto_1117020 ?auto_1117021 ) ) ( not ( = ?auto_1117020 ?auto_1117022 ) ) ( not ( = ?auto_1117020 ?auto_1117023 ) ) ( not ( = ?auto_1117021 ?auto_1117022 ) ) ( not ( = ?auto_1117021 ?auto_1117023 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1117022 ?auto_1117023 )
      ( MAKE-8CRATE-VERIFY ?auto_1117015 ?auto_1117016 ?auto_1117017 ?auto_1117019 ?auto_1117018 ?auto_1117020 ?auto_1117021 ?auto_1117022 ?auto_1117023 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1117082 - SURFACE
      ?auto_1117083 - SURFACE
      ?auto_1117084 - SURFACE
      ?auto_1117086 - SURFACE
      ?auto_1117085 - SURFACE
      ?auto_1117087 - SURFACE
      ?auto_1117088 - SURFACE
      ?auto_1117089 - SURFACE
      ?auto_1117090 - SURFACE
    )
    :vars
    (
      ?auto_1117091 - HOIST
      ?auto_1117093 - PLACE
      ?auto_1117092 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1117091 ?auto_1117093 ) ( SURFACE-AT ?auto_1117089 ?auto_1117093 ) ( CLEAR ?auto_1117089 ) ( IS-CRATE ?auto_1117090 ) ( not ( = ?auto_1117089 ?auto_1117090 ) ) ( TRUCK-AT ?auto_1117092 ?auto_1117093 ) ( AVAILABLE ?auto_1117091 ) ( IN ?auto_1117090 ?auto_1117092 ) ( ON ?auto_1117089 ?auto_1117088 ) ( not ( = ?auto_1117088 ?auto_1117089 ) ) ( not ( = ?auto_1117088 ?auto_1117090 ) ) ( ON ?auto_1117083 ?auto_1117082 ) ( ON ?auto_1117084 ?auto_1117083 ) ( ON ?auto_1117086 ?auto_1117084 ) ( ON ?auto_1117085 ?auto_1117086 ) ( ON ?auto_1117087 ?auto_1117085 ) ( ON ?auto_1117088 ?auto_1117087 ) ( not ( = ?auto_1117082 ?auto_1117083 ) ) ( not ( = ?auto_1117082 ?auto_1117084 ) ) ( not ( = ?auto_1117082 ?auto_1117086 ) ) ( not ( = ?auto_1117082 ?auto_1117085 ) ) ( not ( = ?auto_1117082 ?auto_1117087 ) ) ( not ( = ?auto_1117082 ?auto_1117088 ) ) ( not ( = ?auto_1117082 ?auto_1117089 ) ) ( not ( = ?auto_1117082 ?auto_1117090 ) ) ( not ( = ?auto_1117083 ?auto_1117084 ) ) ( not ( = ?auto_1117083 ?auto_1117086 ) ) ( not ( = ?auto_1117083 ?auto_1117085 ) ) ( not ( = ?auto_1117083 ?auto_1117087 ) ) ( not ( = ?auto_1117083 ?auto_1117088 ) ) ( not ( = ?auto_1117083 ?auto_1117089 ) ) ( not ( = ?auto_1117083 ?auto_1117090 ) ) ( not ( = ?auto_1117084 ?auto_1117086 ) ) ( not ( = ?auto_1117084 ?auto_1117085 ) ) ( not ( = ?auto_1117084 ?auto_1117087 ) ) ( not ( = ?auto_1117084 ?auto_1117088 ) ) ( not ( = ?auto_1117084 ?auto_1117089 ) ) ( not ( = ?auto_1117084 ?auto_1117090 ) ) ( not ( = ?auto_1117086 ?auto_1117085 ) ) ( not ( = ?auto_1117086 ?auto_1117087 ) ) ( not ( = ?auto_1117086 ?auto_1117088 ) ) ( not ( = ?auto_1117086 ?auto_1117089 ) ) ( not ( = ?auto_1117086 ?auto_1117090 ) ) ( not ( = ?auto_1117085 ?auto_1117087 ) ) ( not ( = ?auto_1117085 ?auto_1117088 ) ) ( not ( = ?auto_1117085 ?auto_1117089 ) ) ( not ( = ?auto_1117085 ?auto_1117090 ) ) ( not ( = ?auto_1117087 ?auto_1117088 ) ) ( not ( = ?auto_1117087 ?auto_1117089 ) ) ( not ( = ?auto_1117087 ?auto_1117090 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1117088 ?auto_1117089 ?auto_1117090 )
      ( MAKE-8CRATE-VERIFY ?auto_1117082 ?auto_1117083 ?auto_1117084 ?auto_1117086 ?auto_1117085 ?auto_1117087 ?auto_1117088 ?auto_1117089 ?auto_1117090 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1117158 - SURFACE
      ?auto_1117159 - SURFACE
      ?auto_1117160 - SURFACE
      ?auto_1117162 - SURFACE
      ?auto_1117161 - SURFACE
      ?auto_1117163 - SURFACE
      ?auto_1117164 - SURFACE
      ?auto_1117165 - SURFACE
      ?auto_1117166 - SURFACE
    )
    :vars
    (
      ?auto_1117170 - HOIST
      ?auto_1117167 - PLACE
      ?auto_1117169 - TRUCK
      ?auto_1117168 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1117170 ?auto_1117167 ) ( SURFACE-AT ?auto_1117165 ?auto_1117167 ) ( CLEAR ?auto_1117165 ) ( IS-CRATE ?auto_1117166 ) ( not ( = ?auto_1117165 ?auto_1117166 ) ) ( AVAILABLE ?auto_1117170 ) ( IN ?auto_1117166 ?auto_1117169 ) ( ON ?auto_1117165 ?auto_1117164 ) ( not ( = ?auto_1117164 ?auto_1117165 ) ) ( not ( = ?auto_1117164 ?auto_1117166 ) ) ( TRUCK-AT ?auto_1117169 ?auto_1117168 ) ( not ( = ?auto_1117168 ?auto_1117167 ) ) ( ON ?auto_1117159 ?auto_1117158 ) ( ON ?auto_1117160 ?auto_1117159 ) ( ON ?auto_1117162 ?auto_1117160 ) ( ON ?auto_1117161 ?auto_1117162 ) ( ON ?auto_1117163 ?auto_1117161 ) ( ON ?auto_1117164 ?auto_1117163 ) ( not ( = ?auto_1117158 ?auto_1117159 ) ) ( not ( = ?auto_1117158 ?auto_1117160 ) ) ( not ( = ?auto_1117158 ?auto_1117162 ) ) ( not ( = ?auto_1117158 ?auto_1117161 ) ) ( not ( = ?auto_1117158 ?auto_1117163 ) ) ( not ( = ?auto_1117158 ?auto_1117164 ) ) ( not ( = ?auto_1117158 ?auto_1117165 ) ) ( not ( = ?auto_1117158 ?auto_1117166 ) ) ( not ( = ?auto_1117159 ?auto_1117160 ) ) ( not ( = ?auto_1117159 ?auto_1117162 ) ) ( not ( = ?auto_1117159 ?auto_1117161 ) ) ( not ( = ?auto_1117159 ?auto_1117163 ) ) ( not ( = ?auto_1117159 ?auto_1117164 ) ) ( not ( = ?auto_1117159 ?auto_1117165 ) ) ( not ( = ?auto_1117159 ?auto_1117166 ) ) ( not ( = ?auto_1117160 ?auto_1117162 ) ) ( not ( = ?auto_1117160 ?auto_1117161 ) ) ( not ( = ?auto_1117160 ?auto_1117163 ) ) ( not ( = ?auto_1117160 ?auto_1117164 ) ) ( not ( = ?auto_1117160 ?auto_1117165 ) ) ( not ( = ?auto_1117160 ?auto_1117166 ) ) ( not ( = ?auto_1117162 ?auto_1117161 ) ) ( not ( = ?auto_1117162 ?auto_1117163 ) ) ( not ( = ?auto_1117162 ?auto_1117164 ) ) ( not ( = ?auto_1117162 ?auto_1117165 ) ) ( not ( = ?auto_1117162 ?auto_1117166 ) ) ( not ( = ?auto_1117161 ?auto_1117163 ) ) ( not ( = ?auto_1117161 ?auto_1117164 ) ) ( not ( = ?auto_1117161 ?auto_1117165 ) ) ( not ( = ?auto_1117161 ?auto_1117166 ) ) ( not ( = ?auto_1117163 ?auto_1117164 ) ) ( not ( = ?auto_1117163 ?auto_1117165 ) ) ( not ( = ?auto_1117163 ?auto_1117166 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1117164 ?auto_1117165 ?auto_1117166 )
      ( MAKE-8CRATE-VERIFY ?auto_1117158 ?auto_1117159 ?auto_1117160 ?auto_1117162 ?auto_1117161 ?auto_1117163 ?auto_1117164 ?auto_1117165 ?auto_1117166 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1117242 - SURFACE
      ?auto_1117243 - SURFACE
      ?auto_1117244 - SURFACE
      ?auto_1117246 - SURFACE
      ?auto_1117245 - SURFACE
      ?auto_1117247 - SURFACE
      ?auto_1117248 - SURFACE
      ?auto_1117249 - SURFACE
      ?auto_1117250 - SURFACE
    )
    :vars
    (
      ?auto_1117255 - HOIST
      ?auto_1117254 - PLACE
      ?auto_1117251 - TRUCK
      ?auto_1117252 - PLACE
      ?auto_1117253 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1117255 ?auto_1117254 ) ( SURFACE-AT ?auto_1117249 ?auto_1117254 ) ( CLEAR ?auto_1117249 ) ( IS-CRATE ?auto_1117250 ) ( not ( = ?auto_1117249 ?auto_1117250 ) ) ( AVAILABLE ?auto_1117255 ) ( ON ?auto_1117249 ?auto_1117248 ) ( not ( = ?auto_1117248 ?auto_1117249 ) ) ( not ( = ?auto_1117248 ?auto_1117250 ) ) ( TRUCK-AT ?auto_1117251 ?auto_1117252 ) ( not ( = ?auto_1117252 ?auto_1117254 ) ) ( HOIST-AT ?auto_1117253 ?auto_1117252 ) ( LIFTING ?auto_1117253 ?auto_1117250 ) ( not ( = ?auto_1117255 ?auto_1117253 ) ) ( ON ?auto_1117243 ?auto_1117242 ) ( ON ?auto_1117244 ?auto_1117243 ) ( ON ?auto_1117246 ?auto_1117244 ) ( ON ?auto_1117245 ?auto_1117246 ) ( ON ?auto_1117247 ?auto_1117245 ) ( ON ?auto_1117248 ?auto_1117247 ) ( not ( = ?auto_1117242 ?auto_1117243 ) ) ( not ( = ?auto_1117242 ?auto_1117244 ) ) ( not ( = ?auto_1117242 ?auto_1117246 ) ) ( not ( = ?auto_1117242 ?auto_1117245 ) ) ( not ( = ?auto_1117242 ?auto_1117247 ) ) ( not ( = ?auto_1117242 ?auto_1117248 ) ) ( not ( = ?auto_1117242 ?auto_1117249 ) ) ( not ( = ?auto_1117242 ?auto_1117250 ) ) ( not ( = ?auto_1117243 ?auto_1117244 ) ) ( not ( = ?auto_1117243 ?auto_1117246 ) ) ( not ( = ?auto_1117243 ?auto_1117245 ) ) ( not ( = ?auto_1117243 ?auto_1117247 ) ) ( not ( = ?auto_1117243 ?auto_1117248 ) ) ( not ( = ?auto_1117243 ?auto_1117249 ) ) ( not ( = ?auto_1117243 ?auto_1117250 ) ) ( not ( = ?auto_1117244 ?auto_1117246 ) ) ( not ( = ?auto_1117244 ?auto_1117245 ) ) ( not ( = ?auto_1117244 ?auto_1117247 ) ) ( not ( = ?auto_1117244 ?auto_1117248 ) ) ( not ( = ?auto_1117244 ?auto_1117249 ) ) ( not ( = ?auto_1117244 ?auto_1117250 ) ) ( not ( = ?auto_1117246 ?auto_1117245 ) ) ( not ( = ?auto_1117246 ?auto_1117247 ) ) ( not ( = ?auto_1117246 ?auto_1117248 ) ) ( not ( = ?auto_1117246 ?auto_1117249 ) ) ( not ( = ?auto_1117246 ?auto_1117250 ) ) ( not ( = ?auto_1117245 ?auto_1117247 ) ) ( not ( = ?auto_1117245 ?auto_1117248 ) ) ( not ( = ?auto_1117245 ?auto_1117249 ) ) ( not ( = ?auto_1117245 ?auto_1117250 ) ) ( not ( = ?auto_1117247 ?auto_1117248 ) ) ( not ( = ?auto_1117247 ?auto_1117249 ) ) ( not ( = ?auto_1117247 ?auto_1117250 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1117248 ?auto_1117249 ?auto_1117250 )
      ( MAKE-8CRATE-VERIFY ?auto_1117242 ?auto_1117243 ?auto_1117244 ?auto_1117246 ?auto_1117245 ?auto_1117247 ?auto_1117248 ?auto_1117249 ?auto_1117250 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1117334 - SURFACE
      ?auto_1117335 - SURFACE
      ?auto_1117336 - SURFACE
      ?auto_1117338 - SURFACE
      ?auto_1117337 - SURFACE
      ?auto_1117339 - SURFACE
      ?auto_1117340 - SURFACE
      ?auto_1117341 - SURFACE
      ?auto_1117342 - SURFACE
    )
    :vars
    (
      ?auto_1117347 - HOIST
      ?auto_1117348 - PLACE
      ?auto_1117343 - TRUCK
      ?auto_1117346 - PLACE
      ?auto_1117344 - HOIST
      ?auto_1117345 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1117347 ?auto_1117348 ) ( SURFACE-AT ?auto_1117341 ?auto_1117348 ) ( CLEAR ?auto_1117341 ) ( IS-CRATE ?auto_1117342 ) ( not ( = ?auto_1117341 ?auto_1117342 ) ) ( AVAILABLE ?auto_1117347 ) ( ON ?auto_1117341 ?auto_1117340 ) ( not ( = ?auto_1117340 ?auto_1117341 ) ) ( not ( = ?auto_1117340 ?auto_1117342 ) ) ( TRUCK-AT ?auto_1117343 ?auto_1117346 ) ( not ( = ?auto_1117346 ?auto_1117348 ) ) ( HOIST-AT ?auto_1117344 ?auto_1117346 ) ( not ( = ?auto_1117347 ?auto_1117344 ) ) ( AVAILABLE ?auto_1117344 ) ( SURFACE-AT ?auto_1117342 ?auto_1117346 ) ( ON ?auto_1117342 ?auto_1117345 ) ( CLEAR ?auto_1117342 ) ( not ( = ?auto_1117341 ?auto_1117345 ) ) ( not ( = ?auto_1117342 ?auto_1117345 ) ) ( not ( = ?auto_1117340 ?auto_1117345 ) ) ( ON ?auto_1117335 ?auto_1117334 ) ( ON ?auto_1117336 ?auto_1117335 ) ( ON ?auto_1117338 ?auto_1117336 ) ( ON ?auto_1117337 ?auto_1117338 ) ( ON ?auto_1117339 ?auto_1117337 ) ( ON ?auto_1117340 ?auto_1117339 ) ( not ( = ?auto_1117334 ?auto_1117335 ) ) ( not ( = ?auto_1117334 ?auto_1117336 ) ) ( not ( = ?auto_1117334 ?auto_1117338 ) ) ( not ( = ?auto_1117334 ?auto_1117337 ) ) ( not ( = ?auto_1117334 ?auto_1117339 ) ) ( not ( = ?auto_1117334 ?auto_1117340 ) ) ( not ( = ?auto_1117334 ?auto_1117341 ) ) ( not ( = ?auto_1117334 ?auto_1117342 ) ) ( not ( = ?auto_1117334 ?auto_1117345 ) ) ( not ( = ?auto_1117335 ?auto_1117336 ) ) ( not ( = ?auto_1117335 ?auto_1117338 ) ) ( not ( = ?auto_1117335 ?auto_1117337 ) ) ( not ( = ?auto_1117335 ?auto_1117339 ) ) ( not ( = ?auto_1117335 ?auto_1117340 ) ) ( not ( = ?auto_1117335 ?auto_1117341 ) ) ( not ( = ?auto_1117335 ?auto_1117342 ) ) ( not ( = ?auto_1117335 ?auto_1117345 ) ) ( not ( = ?auto_1117336 ?auto_1117338 ) ) ( not ( = ?auto_1117336 ?auto_1117337 ) ) ( not ( = ?auto_1117336 ?auto_1117339 ) ) ( not ( = ?auto_1117336 ?auto_1117340 ) ) ( not ( = ?auto_1117336 ?auto_1117341 ) ) ( not ( = ?auto_1117336 ?auto_1117342 ) ) ( not ( = ?auto_1117336 ?auto_1117345 ) ) ( not ( = ?auto_1117338 ?auto_1117337 ) ) ( not ( = ?auto_1117338 ?auto_1117339 ) ) ( not ( = ?auto_1117338 ?auto_1117340 ) ) ( not ( = ?auto_1117338 ?auto_1117341 ) ) ( not ( = ?auto_1117338 ?auto_1117342 ) ) ( not ( = ?auto_1117338 ?auto_1117345 ) ) ( not ( = ?auto_1117337 ?auto_1117339 ) ) ( not ( = ?auto_1117337 ?auto_1117340 ) ) ( not ( = ?auto_1117337 ?auto_1117341 ) ) ( not ( = ?auto_1117337 ?auto_1117342 ) ) ( not ( = ?auto_1117337 ?auto_1117345 ) ) ( not ( = ?auto_1117339 ?auto_1117340 ) ) ( not ( = ?auto_1117339 ?auto_1117341 ) ) ( not ( = ?auto_1117339 ?auto_1117342 ) ) ( not ( = ?auto_1117339 ?auto_1117345 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1117340 ?auto_1117341 ?auto_1117342 )
      ( MAKE-8CRATE-VERIFY ?auto_1117334 ?auto_1117335 ?auto_1117336 ?auto_1117338 ?auto_1117337 ?auto_1117339 ?auto_1117340 ?auto_1117341 ?auto_1117342 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1117427 - SURFACE
      ?auto_1117428 - SURFACE
      ?auto_1117429 - SURFACE
      ?auto_1117431 - SURFACE
      ?auto_1117430 - SURFACE
      ?auto_1117432 - SURFACE
      ?auto_1117433 - SURFACE
      ?auto_1117434 - SURFACE
      ?auto_1117435 - SURFACE
    )
    :vars
    (
      ?auto_1117436 - HOIST
      ?auto_1117437 - PLACE
      ?auto_1117438 - PLACE
      ?auto_1117440 - HOIST
      ?auto_1117441 - SURFACE
      ?auto_1117439 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1117436 ?auto_1117437 ) ( SURFACE-AT ?auto_1117434 ?auto_1117437 ) ( CLEAR ?auto_1117434 ) ( IS-CRATE ?auto_1117435 ) ( not ( = ?auto_1117434 ?auto_1117435 ) ) ( AVAILABLE ?auto_1117436 ) ( ON ?auto_1117434 ?auto_1117433 ) ( not ( = ?auto_1117433 ?auto_1117434 ) ) ( not ( = ?auto_1117433 ?auto_1117435 ) ) ( not ( = ?auto_1117438 ?auto_1117437 ) ) ( HOIST-AT ?auto_1117440 ?auto_1117438 ) ( not ( = ?auto_1117436 ?auto_1117440 ) ) ( AVAILABLE ?auto_1117440 ) ( SURFACE-AT ?auto_1117435 ?auto_1117438 ) ( ON ?auto_1117435 ?auto_1117441 ) ( CLEAR ?auto_1117435 ) ( not ( = ?auto_1117434 ?auto_1117441 ) ) ( not ( = ?auto_1117435 ?auto_1117441 ) ) ( not ( = ?auto_1117433 ?auto_1117441 ) ) ( TRUCK-AT ?auto_1117439 ?auto_1117437 ) ( ON ?auto_1117428 ?auto_1117427 ) ( ON ?auto_1117429 ?auto_1117428 ) ( ON ?auto_1117431 ?auto_1117429 ) ( ON ?auto_1117430 ?auto_1117431 ) ( ON ?auto_1117432 ?auto_1117430 ) ( ON ?auto_1117433 ?auto_1117432 ) ( not ( = ?auto_1117427 ?auto_1117428 ) ) ( not ( = ?auto_1117427 ?auto_1117429 ) ) ( not ( = ?auto_1117427 ?auto_1117431 ) ) ( not ( = ?auto_1117427 ?auto_1117430 ) ) ( not ( = ?auto_1117427 ?auto_1117432 ) ) ( not ( = ?auto_1117427 ?auto_1117433 ) ) ( not ( = ?auto_1117427 ?auto_1117434 ) ) ( not ( = ?auto_1117427 ?auto_1117435 ) ) ( not ( = ?auto_1117427 ?auto_1117441 ) ) ( not ( = ?auto_1117428 ?auto_1117429 ) ) ( not ( = ?auto_1117428 ?auto_1117431 ) ) ( not ( = ?auto_1117428 ?auto_1117430 ) ) ( not ( = ?auto_1117428 ?auto_1117432 ) ) ( not ( = ?auto_1117428 ?auto_1117433 ) ) ( not ( = ?auto_1117428 ?auto_1117434 ) ) ( not ( = ?auto_1117428 ?auto_1117435 ) ) ( not ( = ?auto_1117428 ?auto_1117441 ) ) ( not ( = ?auto_1117429 ?auto_1117431 ) ) ( not ( = ?auto_1117429 ?auto_1117430 ) ) ( not ( = ?auto_1117429 ?auto_1117432 ) ) ( not ( = ?auto_1117429 ?auto_1117433 ) ) ( not ( = ?auto_1117429 ?auto_1117434 ) ) ( not ( = ?auto_1117429 ?auto_1117435 ) ) ( not ( = ?auto_1117429 ?auto_1117441 ) ) ( not ( = ?auto_1117431 ?auto_1117430 ) ) ( not ( = ?auto_1117431 ?auto_1117432 ) ) ( not ( = ?auto_1117431 ?auto_1117433 ) ) ( not ( = ?auto_1117431 ?auto_1117434 ) ) ( not ( = ?auto_1117431 ?auto_1117435 ) ) ( not ( = ?auto_1117431 ?auto_1117441 ) ) ( not ( = ?auto_1117430 ?auto_1117432 ) ) ( not ( = ?auto_1117430 ?auto_1117433 ) ) ( not ( = ?auto_1117430 ?auto_1117434 ) ) ( not ( = ?auto_1117430 ?auto_1117435 ) ) ( not ( = ?auto_1117430 ?auto_1117441 ) ) ( not ( = ?auto_1117432 ?auto_1117433 ) ) ( not ( = ?auto_1117432 ?auto_1117434 ) ) ( not ( = ?auto_1117432 ?auto_1117435 ) ) ( not ( = ?auto_1117432 ?auto_1117441 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1117433 ?auto_1117434 ?auto_1117435 )
      ( MAKE-8CRATE-VERIFY ?auto_1117427 ?auto_1117428 ?auto_1117429 ?auto_1117431 ?auto_1117430 ?auto_1117432 ?auto_1117433 ?auto_1117434 ?auto_1117435 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1117520 - SURFACE
      ?auto_1117521 - SURFACE
      ?auto_1117522 - SURFACE
      ?auto_1117524 - SURFACE
      ?auto_1117523 - SURFACE
      ?auto_1117525 - SURFACE
      ?auto_1117526 - SURFACE
      ?auto_1117527 - SURFACE
      ?auto_1117528 - SURFACE
    )
    :vars
    (
      ?auto_1117529 - HOIST
      ?auto_1117533 - PLACE
      ?auto_1117534 - PLACE
      ?auto_1117531 - HOIST
      ?auto_1117530 - SURFACE
      ?auto_1117532 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1117529 ?auto_1117533 ) ( IS-CRATE ?auto_1117528 ) ( not ( = ?auto_1117527 ?auto_1117528 ) ) ( not ( = ?auto_1117526 ?auto_1117527 ) ) ( not ( = ?auto_1117526 ?auto_1117528 ) ) ( not ( = ?auto_1117534 ?auto_1117533 ) ) ( HOIST-AT ?auto_1117531 ?auto_1117534 ) ( not ( = ?auto_1117529 ?auto_1117531 ) ) ( AVAILABLE ?auto_1117531 ) ( SURFACE-AT ?auto_1117528 ?auto_1117534 ) ( ON ?auto_1117528 ?auto_1117530 ) ( CLEAR ?auto_1117528 ) ( not ( = ?auto_1117527 ?auto_1117530 ) ) ( not ( = ?auto_1117528 ?auto_1117530 ) ) ( not ( = ?auto_1117526 ?auto_1117530 ) ) ( TRUCK-AT ?auto_1117532 ?auto_1117533 ) ( SURFACE-AT ?auto_1117526 ?auto_1117533 ) ( CLEAR ?auto_1117526 ) ( LIFTING ?auto_1117529 ?auto_1117527 ) ( IS-CRATE ?auto_1117527 ) ( ON ?auto_1117521 ?auto_1117520 ) ( ON ?auto_1117522 ?auto_1117521 ) ( ON ?auto_1117524 ?auto_1117522 ) ( ON ?auto_1117523 ?auto_1117524 ) ( ON ?auto_1117525 ?auto_1117523 ) ( ON ?auto_1117526 ?auto_1117525 ) ( not ( = ?auto_1117520 ?auto_1117521 ) ) ( not ( = ?auto_1117520 ?auto_1117522 ) ) ( not ( = ?auto_1117520 ?auto_1117524 ) ) ( not ( = ?auto_1117520 ?auto_1117523 ) ) ( not ( = ?auto_1117520 ?auto_1117525 ) ) ( not ( = ?auto_1117520 ?auto_1117526 ) ) ( not ( = ?auto_1117520 ?auto_1117527 ) ) ( not ( = ?auto_1117520 ?auto_1117528 ) ) ( not ( = ?auto_1117520 ?auto_1117530 ) ) ( not ( = ?auto_1117521 ?auto_1117522 ) ) ( not ( = ?auto_1117521 ?auto_1117524 ) ) ( not ( = ?auto_1117521 ?auto_1117523 ) ) ( not ( = ?auto_1117521 ?auto_1117525 ) ) ( not ( = ?auto_1117521 ?auto_1117526 ) ) ( not ( = ?auto_1117521 ?auto_1117527 ) ) ( not ( = ?auto_1117521 ?auto_1117528 ) ) ( not ( = ?auto_1117521 ?auto_1117530 ) ) ( not ( = ?auto_1117522 ?auto_1117524 ) ) ( not ( = ?auto_1117522 ?auto_1117523 ) ) ( not ( = ?auto_1117522 ?auto_1117525 ) ) ( not ( = ?auto_1117522 ?auto_1117526 ) ) ( not ( = ?auto_1117522 ?auto_1117527 ) ) ( not ( = ?auto_1117522 ?auto_1117528 ) ) ( not ( = ?auto_1117522 ?auto_1117530 ) ) ( not ( = ?auto_1117524 ?auto_1117523 ) ) ( not ( = ?auto_1117524 ?auto_1117525 ) ) ( not ( = ?auto_1117524 ?auto_1117526 ) ) ( not ( = ?auto_1117524 ?auto_1117527 ) ) ( not ( = ?auto_1117524 ?auto_1117528 ) ) ( not ( = ?auto_1117524 ?auto_1117530 ) ) ( not ( = ?auto_1117523 ?auto_1117525 ) ) ( not ( = ?auto_1117523 ?auto_1117526 ) ) ( not ( = ?auto_1117523 ?auto_1117527 ) ) ( not ( = ?auto_1117523 ?auto_1117528 ) ) ( not ( = ?auto_1117523 ?auto_1117530 ) ) ( not ( = ?auto_1117525 ?auto_1117526 ) ) ( not ( = ?auto_1117525 ?auto_1117527 ) ) ( not ( = ?auto_1117525 ?auto_1117528 ) ) ( not ( = ?auto_1117525 ?auto_1117530 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1117526 ?auto_1117527 ?auto_1117528 )
      ( MAKE-8CRATE-VERIFY ?auto_1117520 ?auto_1117521 ?auto_1117522 ?auto_1117524 ?auto_1117523 ?auto_1117525 ?auto_1117526 ?auto_1117527 ?auto_1117528 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1117613 - SURFACE
      ?auto_1117614 - SURFACE
      ?auto_1117615 - SURFACE
      ?auto_1117617 - SURFACE
      ?auto_1117616 - SURFACE
      ?auto_1117618 - SURFACE
      ?auto_1117619 - SURFACE
      ?auto_1117620 - SURFACE
      ?auto_1117621 - SURFACE
    )
    :vars
    (
      ?auto_1117627 - HOIST
      ?auto_1117624 - PLACE
      ?auto_1117626 - PLACE
      ?auto_1117625 - HOIST
      ?auto_1117623 - SURFACE
      ?auto_1117622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1117627 ?auto_1117624 ) ( IS-CRATE ?auto_1117621 ) ( not ( = ?auto_1117620 ?auto_1117621 ) ) ( not ( = ?auto_1117619 ?auto_1117620 ) ) ( not ( = ?auto_1117619 ?auto_1117621 ) ) ( not ( = ?auto_1117626 ?auto_1117624 ) ) ( HOIST-AT ?auto_1117625 ?auto_1117626 ) ( not ( = ?auto_1117627 ?auto_1117625 ) ) ( AVAILABLE ?auto_1117625 ) ( SURFACE-AT ?auto_1117621 ?auto_1117626 ) ( ON ?auto_1117621 ?auto_1117623 ) ( CLEAR ?auto_1117621 ) ( not ( = ?auto_1117620 ?auto_1117623 ) ) ( not ( = ?auto_1117621 ?auto_1117623 ) ) ( not ( = ?auto_1117619 ?auto_1117623 ) ) ( TRUCK-AT ?auto_1117622 ?auto_1117624 ) ( SURFACE-AT ?auto_1117619 ?auto_1117624 ) ( CLEAR ?auto_1117619 ) ( IS-CRATE ?auto_1117620 ) ( AVAILABLE ?auto_1117627 ) ( IN ?auto_1117620 ?auto_1117622 ) ( ON ?auto_1117614 ?auto_1117613 ) ( ON ?auto_1117615 ?auto_1117614 ) ( ON ?auto_1117617 ?auto_1117615 ) ( ON ?auto_1117616 ?auto_1117617 ) ( ON ?auto_1117618 ?auto_1117616 ) ( ON ?auto_1117619 ?auto_1117618 ) ( not ( = ?auto_1117613 ?auto_1117614 ) ) ( not ( = ?auto_1117613 ?auto_1117615 ) ) ( not ( = ?auto_1117613 ?auto_1117617 ) ) ( not ( = ?auto_1117613 ?auto_1117616 ) ) ( not ( = ?auto_1117613 ?auto_1117618 ) ) ( not ( = ?auto_1117613 ?auto_1117619 ) ) ( not ( = ?auto_1117613 ?auto_1117620 ) ) ( not ( = ?auto_1117613 ?auto_1117621 ) ) ( not ( = ?auto_1117613 ?auto_1117623 ) ) ( not ( = ?auto_1117614 ?auto_1117615 ) ) ( not ( = ?auto_1117614 ?auto_1117617 ) ) ( not ( = ?auto_1117614 ?auto_1117616 ) ) ( not ( = ?auto_1117614 ?auto_1117618 ) ) ( not ( = ?auto_1117614 ?auto_1117619 ) ) ( not ( = ?auto_1117614 ?auto_1117620 ) ) ( not ( = ?auto_1117614 ?auto_1117621 ) ) ( not ( = ?auto_1117614 ?auto_1117623 ) ) ( not ( = ?auto_1117615 ?auto_1117617 ) ) ( not ( = ?auto_1117615 ?auto_1117616 ) ) ( not ( = ?auto_1117615 ?auto_1117618 ) ) ( not ( = ?auto_1117615 ?auto_1117619 ) ) ( not ( = ?auto_1117615 ?auto_1117620 ) ) ( not ( = ?auto_1117615 ?auto_1117621 ) ) ( not ( = ?auto_1117615 ?auto_1117623 ) ) ( not ( = ?auto_1117617 ?auto_1117616 ) ) ( not ( = ?auto_1117617 ?auto_1117618 ) ) ( not ( = ?auto_1117617 ?auto_1117619 ) ) ( not ( = ?auto_1117617 ?auto_1117620 ) ) ( not ( = ?auto_1117617 ?auto_1117621 ) ) ( not ( = ?auto_1117617 ?auto_1117623 ) ) ( not ( = ?auto_1117616 ?auto_1117618 ) ) ( not ( = ?auto_1117616 ?auto_1117619 ) ) ( not ( = ?auto_1117616 ?auto_1117620 ) ) ( not ( = ?auto_1117616 ?auto_1117621 ) ) ( not ( = ?auto_1117616 ?auto_1117623 ) ) ( not ( = ?auto_1117618 ?auto_1117619 ) ) ( not ( = ?auto_1117618 ?auto_1117620 ) ) ( not ( = ?auto_1117618 ?auto_1117621 ) ) ( not ( = ?auto_1117618 ?auto_1117623 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1117619 ?auto_1117620 ?auto_1117621 )
      ( MAKE-8CRATE-VERIFY ?auto_1117613 ?auto_1117614 ?auto_1117615 ?auto_1117617 ?auto_1117616 ?auto_1117618 ?auto_1117619 ?auto_1117620 ?auto_1117621 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1121699 - SURFACE
      ?auto_1121700 - SURFACE
      ?auto_1121701 - SURFACE
      ?auto_1121703 - SURFACE
      ?auto_1121702 - SURFACE
      ?auto_1121704 - SURFACE
      ?auto_1121705 - SURFACE
      ?auto_1121706 - SURFACE
      ?auto_1121707 - SURFACE
      ?auto_1121708 - SURFACE
    )
    :vars
    (
      ?auto_1121710 - HOIST
      ?auto_1121709 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1121710 ?auto_1121709 ) ( SURFACE-AT ?auto_1121707 ?auto_1121709 ) ( CLEAR ?auto_1121707 ) ( LIFTING ?auto_1121710 ?auto_1121708 ) ( IS-CRATE ?auto_1121708 ) ( not ( = ?auto_1121707 ?auto_1121708 ) ) ( ON ?auto_1121700 ?auto_1121699 ) ( ON ?auto_1121701 ?auto_1121700 ) ( ON ?auto_1121703 ?auto_1121701 ) ( ON ?auto_1121702 ?auto_1121703 ) ( ON ?auto_1121704 ?auto_1121702 ) ( ON ?auto_1121705 ?auto_1121704 ) ( ON ?auto_1121706 ?auto_1121705 ) ( ON ?auto_1121707 ?auto_1121706 ) ( not ( = ?auto_1121699 ?auto_1121700 ) ) ( not ( = ?auto_1121699 ?auto_1121701 ) ) ( not ( = ?auto_1121699 ?auto_1121703 ) ) ( not ( = ?auto_1121699 ?auto_1121702 ) ) ( not ( = ?auto_1121699 ?auto_1121704 ) ) ( not ( = ?auto_1121699 ?auto_1121705 ) ) ( not ( = ?auto_1121699 ?auto_1121706 ) ) ( not ( = ?auto_1121699 ?auto_1121707 ) ) ( not ( = ?auto_1121699 ?auto_1121708 ) ) ( not ( = ?auto_1121700 ?auto_1121701 ) ) ( not ( = ?auto_1121700 ?auto_1121703 ) ) ( not ( = ?auto_1121700 ?auto_1121702 ) ) ( not ( = ?auto_1121700 ?auto_1121704 ) ) ( not ( = ?auto_1121700 ?auto_1121705 ) ) ( not ( = ?auto_1121700 ?auto_1121706 ) ) ( not ( = ?auto_1121700 ?auto_1121707 ) ) ( not ( = ?auto_1121700 ?auto_1121708 ) ) ( not ( = ?auto_1121701 ?auto_1121703 ) ) ( not ( = ?auto_1121701 ?auto_1121702 ) ) ( not ( = ?auto_1121701 ?auto_1121704 ) ) ( not ( = ?auto_1121701 ?auto_1121705 ) ) ( not ( = ?auto_1121701 ?auto_1121706 ) ) ( not ( = ?auto_1121701 ?auto_1121707 ) ) ( not ( = ?auto_1121701 ?auto_1121708 ) ) ( not ( = ?auto_1121703 ?auto_1121702 ) ) ( not ( = ?auto_1121703 ?auto_1121704 ) ) ( not ( = ?auto_1121703 ?auto_1121705 ) ) ( not ( = ?auto_1121703 ?auto_1121706 ) ) ( not ( = ?auto_1121703 ?auto_1121707 ) ) ( not ( = ?auto_1121703 ?auto_1121708 ) ) ( not ( = ?auto_1121702 ?auto_1121704 ) ) ( not ( = ?auto_1121702 ?auto_1121705 ) ) ( not ( = ?auto_1121702 ?auto_1121706 ) ) ( not ( = ?auto_1121702 ?auto_1121707 ) ) ( not ( = ?auto_1121702 ?auto_1121708 ) ) ( not ( = ?auto_1121704 ?auto_1121705 ) ) ( not ( = ?auto_1121704 ?auto_1121706 ) ) ( not ( = ?auto_1121704 ?auto_1121707 ) ) ( not ( = ?auto_1121704 ?auto_1121708 ) ) ( not ( = ?auto_1121705 ?auto_1121706 ) ) ( not ( = ?auto_1121705 ?auto_1121707 ) ) ( not ( = ?auto_1121705 ?auto_1121708 ) ) ( not ( = ?auto_1121706 ?auto_1121707 ) ) ( not ( = ?auto_1121706 ?auto_1121708 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1121707 ?auto_1121708 )
      ( MAKE-9CRATE-VERIFY ?auto_1121699 ?auto_1121700 ?auto_1121701 ?auto_1121703 ?auto_1121702 ?auto_1121704 ?auto_1121705 ?auto_1121706 ?auto_1121707 ?auto_1121708 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1121779 - SURFACE
      ?auto_1121780 - SURFACE
      ?auto_1121781 - SURFACE
      ?auto_1121783 - SURFACE
      ?auto_1121782 - SURFACE
      ?auto_1121784 - SURFACE
      ?auto_1121785 - SURFACE
      ?auto_1121786 - SURFACE
      ?auto_1121787 - SURFACE
      ?auto_1121788 - SURFACE
    )
    :vars
    (
      ?auto_1121791 - HOIST
      ?auto_1121790 - PLACE
      ?auto_1121789 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1121791 ?auto_1121790 ) ( SURFACE-AT ?auto_1121787 ?auto_1121790 ) ( CLEAR ?auto_1121787 ) ( IS-CRATE ?auto_1121788 ) ( not ( = ?auto_1121787 ?auto_1121788 ) ) ( TRUCK-AT ?auto_1121789 ?auto_1121790 ) ( AVAILABLE ?auto_1121791 ) ( IN ?auto_1121788 ?auto_1121789 ) ( ON ?auto_1121787 ?auto_1121786 ) ( not ( = ?auto_1121786 ?auto_1121787 ) ) ( not ( = ?auto_1121786 ?auto_1121788 ) ) ( ON ?auto_1121780 ?auto_1121779 ) ( ON ?auto_1121781 ?auto_1121780 ) ( ON ?auto_1121783 ?auto_1121781 ) ( ON ?auto_1121782 ?auto_1121783 ) ( ON ?auto_1121784 ?auto_1121782 ) ( ON ?auto_1121785 ?auto_1121784 ) ( ON ?auto_1121786 ?auto_1121785 ) ( not ( = ?auto_1121779 ?auto_1121780 ) ) ( not ( = ?auto_1121779 ?auto_1121781 ) ) ( not ( = ?auto_1121779 ?auto_1121783 ) ) ( not ( = ?auto_1121779 ?auto_1121782 ) ) ( not ( = ?auto_1121779 ?auto_1121784 ) ) ( not ( = ?auto_1121779 ?auto_1121785 ) ) ( not ( = ?auto_1121779 ?auto_1121786 ) ) ( not ( = ?auto_1121779 ?auto_1121787 ) ) ( not ( = ?auto_1121779 ?auto_1121788 ) ) ( not ( = ?auto_1121780 ?auto_1121781 ) ) ( not ( = ?auto_1121780 ?auto_1121783 ) ) ( not ( = ?auto_1121780 ?auto_1121782 ) ) ( not ( = ?auto_1121780 ?auto_1121784 ) ) ( not ( = ?auto_1121780 ?auto_1121785 ) ) ( not ( = ?auto_1121780 ?auto_1121786 ) ) ( not ( = ?auto_1121780 ?auto_1121787 ) ) ( not ( = ?auto_1121780 ?auto_1121788 ) ) ( not ( = ?auto_1121781 ?auto_1121783 ) ) ( not ( = ?auto_1121781 ?auto_1121782 ) ) ( not ( = ?auto_1121781 ?auto_1121784 ) ) ( not ( = ?auto_1121781 ?auto_1121785 ) ) ( not ( = ?auto_1121781 ?auto_1121786 ) ) ( not ( = ?auto_1121781 ?auto_1121787 ) ) ( not ( = ?auto_1121781 ?auto_1121788 ) ) ( not ( = ?auto_1121783 ?auto_1121782 ) ) ( not ( = ?auto_1121783 ?auto_1121784 ) ) ( not ( = ?auto_1121783 ?auto_1121785 ) ) ( not ( = ?auto_1121783 ?auto_1121786 ) ) ( not ( = ?auto_1121783 ?auto_1121787 ) ) ( not ( = ?auto_1121783 ?auto_1121788 ) ) ( not ( = ?auto_1121782 ?auto_1121784 ) ) ( not ( = ?auto_1121782 ?auto_1121785 ) ) ( not ( = ?auto_1121782 ?auto_1121786 ) ) ( not ( = ?auto_1121782 ?auto_1121787 ) ) ( not ( = ?auto_1121782 ?auto_1121788 ) ) ( not ( = ?auto_1121784 ?auto_1121785 ) ) ( not ( = ?auto_1121784 ?auto_1121786 ) ) ( not ( = ?auto_1121784 ?auto_1121787 ) ) ( not ( = ?auto_1121784 ?auto_1121788 ) ) ( not ( = ?auto_1121785 ?auto_1121786 ) ) ( not ( = ?auto_1121785 ?auto_1121787 ) ) ( not ( = ?auto_1121785 ?auto_1121788 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1121786 ?auto_1121787 ?auto_1121788 )
      ( MAKE-9CRATE-VERIFY ?auto_1121779 ?auto_1121780 ?auto_1121781 ?auto_1121783 ?auto_1121782 ?auto_1121784 ?auto_1121785 ?auto_1121786 ?auto_1121787 ?auto_1121788 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1121869 - SURFACE
      ?auto_1121870 - SURFACE
      ?auto_1121871 - SURFACE
      ?auto_1121873 - SURFACE
      ?auto_1121872 - SURFACE
      ?auto_1121874 - SURFACE
      ?auto_1121875 - SURFACE
      ?auto_1121876 - SURFACE
      ?auto_1121877 - SURFACE
      ?auto_1121878 - SURFACE
    )
    :vars
    (
      ?auto_1121880 - HOIST
      ?auto_1121879 - PLACE
      ?auto_1121882 - TRUCK
      ?auto_1121881 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1121880 ?auto_1121879 ) ( SURFACE-AT ?auto_1121877 ?auto_1121879 ) ( CLEAR ?auto_1121877 ) ( IS-CRATE ?auto_1121878 ) ( not ( = ?auto_1121877 ?auto_1121878 ) ) ( AVAILABLE ?auto_1121880 ) ( IN ?auto_1121878 ?auto_1121882 ) ( ON ?auto_1121877 ?auto_1121876 ) ( not ( = ?auto_1121876 ?auto_1121877 ) ) ( not ( = ?auto_1121876 ?auto_1121878 ) ) ( TRUCK-AT ?auto_1121882 ?auto_1121881 ) ( not ( = ?auto_1121881 ?auto_1121879 ) ) ( ON ?auto_1121870 ?auto_1121869 ) ( ON ?auto_1121871 ?auto_1121870 ) ( ON ?auto_1121873 ?auto_1121871 ) ( ON ?auto_1121872 ?auto_1121873 ) ( ON ?auto_1121874 ?auto_1121872 ) ( ON ?auto_1121875 ?auto_1121874 ) ( ON ?auto_1121876 ?auto_1121875 ) ( not ( = ?auto_1121869 ?auto_1121870 ) ) ( not ( = ?auto_1121869 ?auto_1121871 ) ) ( not ( = ?auto_1121869 ?auto_1121873 ) ) ( not ( = ?auto_1121869 ?auto_1121872 ) ) ( not ( = ?auto_1121869 ?auto_1121874 ) ) ( not ( = ?auto_1121869 ?auto_1121875 ) ) ( not ( = ?auto_1121869 ?auto_1121876 ) ) ( not ( = ?auto_1121869 ?auto_1121877 ) ) ( not ( = ?auto_1121869 ?auto_1121878 ) ) ( not ( = ?auto_1121870 ?auto_1121871 ) ) ( not ( = ?auto_1121870 ?auto_1121873 ) ) ( not ( = ?auto_1121870 ?auto_1121872 ) ) ( not ( = ?auto_1121870 ?auto_1121874 ) ) ( not ( = ?auto_1121870 ?auto_1121875 ) ) ( not ( = ?auto_1121870 ?auto_1121876 ) ) ( not ( = ?auto_1121870 ?auto_1121877 ) ) ( not ( = ?auto_1121870 ?auto_1121878 ) ) ( not ( = ?auto_1121871 ?auto_1121873 ) ) ( not ( = ?auto_1121871 ?auto_1121872 ) ) ( not ( = ?auto_1121871 ?auto_1121874 ) ) ( not ( = ?auto_1121871 ?auto_1121875 ) ) ( not ( = ?auto_1121871 ?auto_1121876 ) ) ( not ( = ?auto_1121871 ?auto_1121877 ) ) ( not ( = ?auto_1121871 ?auto_1121878 ) ) ( not ( = ?auto_1121873 ?auto_1121872 ) ) ( not ( = ?auto_1121873 ?auto_1121874 ) ) ( not ( = ?auto_1121873 ?auto_1121875 ) ) ( not ( = ?auto_1121873 ?auto_1121876 ) ) ( not ( = ?auto_1121873 ?auto_1121877 ) ) ( not ( = ?auto_1121873 ?auto_1121878 ) ) ( not ( = ?auto_1121872 ?auto_1121874 ) ) ( not ( = ?auto_1121872 ?auto_1121875 ) ) ( not ( = ?auto_1121872 ?auto_1121876 ) ) ( not ( = ?auto_1121872 ?auto_1121877 ) ) ( not ( = ?auto_1121872 ?auto_1121878 ) ) ( not ( = ?auto_1121874 ?auto_1121875 ) ) ( not ( = ?auto_1121874 ?auto_1121876 ) ) ( not ( = ?auto_1121874 ?auto_1121877 ) ) ( not ( = ?auto_1121874 ?auto_1121878 ) ) ( not ( = ?auto_1121875 ?auto_1121876 ) ) ( not ( = ?auto_1121875 ?auto_1121877 ) ) ( not ( = ?auto_1121875 ?auto_1121878 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1121876 ?auto_1121877 ?auto_1121878 )
      ( MAKE-9CRATE-VERIFY ?auto_1121869 ?auto_1121870 ?auto_1121871 ?auto_1121873 ?auto_1121872 ?auto_1121874 ?auto_1121875 ?auto_1121876 ?auto_1121877 ?auto_1121878 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1121968 - SURFACE
      ?auto_1121969 - SURFACE
      ?auto_1121970 - SURFACE
      ?auto_1121972 - SURFACE
      ?auto_1121971 - SURFACE
      ?auto_1121973 - SURFACE
      ?auto_1121974 - SURFACE
      ?auto_1121975 - SURFACE
      ?auto_1121976 - SURFACE
      ?auto_1121977 - SURFACE
    )
    :vars
    (
      ?auto_1121979 - HOIST
      ?auto_1121981 - PLACE
      ?auto_1121982 - TRUCK
      ?auto_1121980 - PLACE
      ?auto_1121978 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1121979 ?auto_1121981 ) ( SURFACE-AT ?auto_1121976 ?auto_1121981 ) ( CLEAR ?auto_1121976 ) ( IS-CRATE ?auto_1121977 ) ( not ( = ?auto_1121976 ?auto_1121977 ) ) ( AVAILABLE ?auto_1121979 ) ( ON ?auto_1121976 ?auto_1121975 ) ( not ( = ?auto_1121975 ?auto_1121976 ) ) ( not ( = ?auto_1121975 ?auto_1121977 ) ) ( TRUCK-AT ?auto_1121982 ?auto_1121980 ) ( not ( = ?auto_1121980 ?auto_1121981 ) ) ( HOIST-AT ?auto_1121978 ?auto_1121980 ) ( LIFTING ?auto_1121978 ?auto_1121977 ) ( not ( = ?auto_1121979 ?auto_1121978 ) ) ( ON ?auto_1121969 ?auto_1121968 ) ( ON ?auto_1121970 ?auto_1121969 ) ( ON ?auto_1121972 ?auto_1121970 ) ( ON ?auto_1121971 ?auto_1121972 ) ( ON ?auto_1121973 ?auto_1121971 ) ( ON ?auto_1121974 ?auto_1121973 ) ( ON ?auto_1121975 ?auto_1121974 ) ( not ( = ?auto_1121968 ?auto_1121969 ) ) ( not ( = ?auto_1121968 ?auto_1121970 ) ) ( not ( = ?auto_1121968 ?auto_1121972 ) ) ( not ( = ?auto_1121968 ?auto_1121971 ) ) ( not ( = ?auto_1121968 ?auto_1121973 ) ) ( not ( = ?auto_1121968 ?auto_1121974 ) ) ( not ( = ?auto_1121968 ?auto_1121975 ) ) ( not ( = ?auto_1121968 ?auto_1121976 ) ) ( not ( = ?auto_1121968 ?auto_1121977 ) ) ( not ( = ?auto_1121969 ?auto_1121970 ) ) ( not ( = ?auto_1121969 ?auto_1121972 ) ) ( not ( = ?auto_1121969 ?auto_1121971 ) ) ( not ( = ?auto_1121969 ?auto_1121973 ) ) ( not ( = ?auto_1121969 ?auto_1121974 ) ) ( not ( = ?auto_1121969 ?auto_1121975 ) ) ( not ( = ?auto_1121969 ?auto_1121976 ) ) ( not ( = ?auto_1121969 ?auto_1121977 ) ) ( not ( = ?auto_1121970 ?auto_1121972 ) ) ( not ( = ?auto_1121970 ?auto_1121971 ) ) ( not ( = ?auto_1121970 ?auto_1121973 ) ) ( not ( = ?auto_1121970 ?auto_1121974 ) ) ( not ( = ?auto_1121970 ?auto_1121975 ) ) ( not ( = ?auto_1121970 ?auto_1121976 ) ) ( not ( = ?auto_1121970 ?auto_1121977 ) ) ( not ( = ?auto_1121972 ?auto_1121971 ) ) ( not ( = ?auto_1121972 ?auto_1121973 ) ) ( not ( = ?auto_1121972 ?auto_1121974 ) ) ( not ( = ?auto_1121972 ?auto_1121975 ) ) ( not ( = ?auto_1121972 ?auto_1121976 ) ) ( not ( = ?auto_1121972 ?auto_1121977 ) ) ( not ( = ?auto_1121971 ?auto_1121973 ) ) ( not ( = ?auto_1121971 ?auto_1121974 ) ) ( not ( = ?auto_1121971 ?auto_1121975 ) ) ( not ( = ?auto_1121971 ?auto_1121976 ) ) ( not ( = ?auto_1121971 ?auto_1121977 ) ) ( not ( = ?auto_1121973 ?auto_1121974 ) ) ( not ( = ?auto_1121973 ?auto_1121975 ) ) ( not ( = ?auto_1121973 ?auto_1121976 ) ) ( not ( = ?auto_1121973 ?auto_1121977 ) ) ( not ( = ?auto_1121974 ?auto_1121975 ) ) ( not ( = ?auto_1121974 ?auto_1121976 ) ) ( not ( = ?auto_1121974 ?auto_1121977 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1121975 ?auto_1121976 ?auto_1121977 )
      ( MAKE-9CRATE-VERIFY ?auto_1121968 ?auto_1121969 ?auto_1121970 ?auto_1121972 ?auto_1121971 ?auto_1121973 ?auto_1121974 ?auto_1121975 ?auto_1121976 ?auto_1121977 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1122076 - SURFACE
      ?auto_1122077 - SURFACE
      ?auto_1122078 - SURFACE
      ?auto_1122080 - SURFACE
      ?auto_1122079 - SURFACE
      ?auto_1122081 - SURFACE
      ?auto_1122082 - SURFACE
      ?auto_1122083 - SURFACE
      ?auto_1122084 - SURFACE
      ?auto_1122085 - SURFACE
    )
    :vars
    (
      ?auto_1122086 - HOIST
      ?auto_1122091 - PLACE
      ?auto_1122089 - TRUCK
      ?auto_1122087 - PLACE
      ?auto_1122088 - HOIST
      ?auto_1122090 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1122086 ?auto_1122091 ) ( SURFACE-AT ?auto_1122084 ?auto_1122091 ) ( CLEAR ?auto_1122084 ) ( IS-CRATE ?auto_1122085 ) ( not ( = ?auto_1122084 ?auto_1122085 ) ) ( AVAILABLE ?auto_1122086 ) ( ON ?auto_1122084 ?auto_1122083 ) ( not ( = ?auto_1122083 ?auto_1122084 ) ) ( not ( = ?auto_1122083 ?auto_1122085 ) ) ( TRUCK-AT ?auto_1122089 ?auto_1122087 ) ( not ( = ?auto_1122087 ?auto_1122091 ) ) ( HOIST-AT ?auto_1122088 ?auto_1122087 ) ( not ( = ?auto_1122086 ?auto_1122088 ) ) ( AVAILABLE ?auto_1122088 ) ( SURFACE-AT ?auto_1122085 ?auto_1122087 ) ( ON ?auto_1122085 ?auto_1122090 ) ( CLEAR ?auto_1122085 ) ( not ( = ?auto_1122084 ?auto_1122090 ) ) ( not ( = ?auto_1122085 ?auto_1122090 ) ) ( not ( = ?auto_1122083 ?auto_1122090 ) ) ( ON ?auto_1122077 ?auto_1122076 ) ( ON ?auto_1122078 ?auto_1122077 ) ( ON ?auto_1122080 ?auto_1122078 ) ( ON ?auto_1122079 ?auto_1122080 ) ( ON ?auto_1122081 ?auto_1122079 ) ( ON ?auto_1122082 ?auto_1122081 ) ( ON ?auto_1122083 ?auto_1122082 ) ( not ( = ?auto_1122076 ?auto_1122077 ) ) ( not ( = ?auto_1122076 ?auto_1122078 ) ) ( not ( = ?auto_1122076 ?auto_1122080 ) ) ( not ( = ?auto_1122076 ?auto_1122079 ) ) ( not ( = ?auto_1122076 ?auto_1122081 ) ) ( not ( = ?auto_1122076 ?auto_1122082 ) ) ( not ( = ?auto_1122076 ?auto_1122083 ) ) ( not ( = ?auto_1122076 ?auto_1122084 ) ) ( not ( = ?auto_1122076 ?auto_1122085 ) ) ( not ( = ?auto_1122076 ?auto_1122090 ) ) ( not ( = ?auto_1122077 ?auto_1122078 ) ) ( not ( = ?auto_1122077 ?auto_1122080 ) ) ( not ( = ?auto_1122077 ?auto_1122079 ) ) ( not ( = ?auto_1122077 ?auto_1122081 ) ) ( not ( = ?auto_1122077 ?auto_1122082 ) ) ( not ( = ?auto_1122077 ?auto_1122083 ) ) ( not ( = ?auto_1122077 ?auto_1122084 ) ) ( not ( = ?auto_1122077 ?auto_1122085 ) ) ( not ( = ?auto_1122077 ?auto_1122090 ) ) ( not ( = ?auto_1122078 ?auto_1122080 ) ) ( not ( = ?auto_1122078 ?auto_1122079 ) ) ( not ( = ?auto_1122078 ?auto_1122081 ) ) ( not ( = ?auto_1122078 ?auto_1122082 ) ) ( not ( = ?auto_1122078 ?auto_1122083 ) ) ( not ( = ?auto_1122078 ?auto_1122084 ) ) ( not ( = ?auto_1122078 ?auto_1122085 ) ) ( not ( = ?auto_1122078 ?auto_1122090 ) ) ( not ( = ?auto_1122080 ?auto_1122079 ) ) ( not ( = ?auto_1122080 ?auto_1122081 ) ) ( not ( = ?auto_1122080 ?auto_1122082 ) ) ( not ( = ?auto_1122080 ?auto_1122083 ) ) ( not ( = ?auto_1122080 ?auto_1122084 ) ) ( not ( = ?auto_1122080 ?auto_1122085 ) ) ( not ( = ?auto_1122080 ?auto_1122090 ) ) ( not ( = ?auto_1122079 ?auto_1122081 ) ) ( not ( = ?auto_1122079 ?auto_1122082 ) ) ( not ( = ?auto_1122079 ?auto_1122083 ) ) ( not ( = ?auto_1122079 ?auto_1122084 ) ) ( not ( = ?auto_1122079 ?auto_1122085 ) ) ( not ( = ?auto_1122079 ?auto_1122090 ) ) ( not ( = ?auto_1122081 ?auto_1122082 ) ) ( not ( = ?auto_1122081 ?auto_1122083 ) ) ( not ( = ?auto_1122081 ?auto_1122084 ) ) ( not ( = ?auto_1122081 ?auto_1122085 ) ) ( not ( = ?auto_1122081 ?auto_1122090 ) ) ( not ( = ?auto_1122082 ?auto_1122083 ) ) ( not ( = ?auto_1122082 ?auto_1122084 ) ) ( not ( = ?auto_1122082 ?auto_1122085 ) ) ( not ( = ?auto_1122082 ?auto_1122090 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1122083 ?auto_1122084 ?auto_1122085 )
      ( MAKE-9CRATE-VERIFY ?auto_1122076 ?auto_1122077 ?auto_1122078 ?auto_1122080 ?auto_1122079 ?auto_1122081 ?auto_1122082 ?auto_1122083 ?auto_1122084 ?auto_1122085 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1122185 - SURFACE
      ?auto_1122186 - SURFACE
      ?auto_1122187 - SURFACE
      ?auto_1122189 - SURFACE
      ?auto_1122188 - SURFACE
      ?auto_1122190 - SURFACE
      ?auto_1122191 - SURFACE
      ?auto_1122192 - SURFACE
      ?auto_1122193 - SURFACE
      ?auto_1122194 - SURFACE
    )
    :vars
    (
      ?auto_1122198 - HOIST
      ?auto_1122195 - PLACE
      ?auto_1122200 - PLACE
      ?auto_1122197 - HOIST
      ?auto_1122196 - SURFACE
      ?auto_1122199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1122198 ?auto_1122195 ) ( SURFACE-AT ?auto_1122193 ?auto_1122195 ) ( CLEAR ?auto_1122193 ) ( IS-CRATE ?auto_1122194 ) ( not ( = ?auto_1122193 ?auto_1122194 ) ) ( AVAILABLE ?auto_1122198 ) ( ON ?auto_1122193 ?auto_1122192 ) ( not ( = ?auto_1122192 ?auto_1122193 ) ) ( not ( = ?auto_1122192 ?auto_1122194 ) ) ( not ( = ?auto_1122200 ?auto_1122195 ) ) ( HOIST-AT ?auto_1122197 ?auto_1122200 ) ( not ( = ?auto_1122198 ?auto_1122197 ) ) ( AVAILABLE ?auto_1122197 ) ( SURFACE-AT ?auto_1122194 ?auto_1122200 ) ( ON ?auto_1122194 ?auto_1122196 ) ( CLEAR ?auto_1122194 ) ( not ( = ?auto_1122193 ?auto_1122196 ) ) ( not ( = ?auto_1122194 ?auto_1122196 ) ) ( not ( = ?auto_1122192 ?auto_1122196 ) ) ( TRUCK-AT ?auto_1122199 ?auto_1122195 ) ( ON ?auto_1122186 ?auto_1122185 ) ( ON ?auto_1122187 ?auto_1122186 ) ( ON ?auto_1122189 ?auto_1122187 ) ( ON ?auto_1122188 ?auto_1122189 ) ( ON ?auto_1122190 ?auto_1122188 ) ( ON ?auto_1122191 ?auto_1122190 ) ( ON ?auto_1122192 ?auto_1122191 ) ( not ( = ?auto_1122185 ?auto_1122186 ) ) ( not ( = ?auto_1122185 ?auto_1122187 ) ) ( not ( = ?auto_1122185 ?auto_1122189 ) ) ( not ( = ?auto_1122185 ?auto_1122188 ) ) ( not ( = ?auto_1122185 ?auto_1122190 ) ) ( not ( = ?auto_1122185 ?auto_1122191 ) ) ( not ( = ?auto_1122185 ?auto_1122192 ) ) ( not ( = ?auto_1122185 ?auto_1122193 ) ) ( not ( = ?auto_1122185 ?auto_1122194 ) ) ( not ( = ?auto_1122185 ?auto_1122196 ) ) ( not ( = ?auto_1122186 ?auto_1122187 ) ) ( not ( = ?auto_1122186 ?auto_1122189 ) ) ( not ( = ?auto_1122186 ?auto_1122188 ) ) ( not ( = ?auto_1122186 ?auto_1122190 ) ) ( not ( = ?auto_1122186 ?auto_1122191 ) ) ( not ( = ?auto_1122186 ?auto_1122192 ) ) ( not ( = ?auto_1122186 ?auto_1122193 ) ) ( not ( = ?auto_1122186 ?auto_1122194 ) ) ( not ( = ?auto_1122186 ?auto_1122196 ) ) ( not ( = ?auto_1122187 ?auto_1122189 ) ) ( not ( = ?auto_1122187 ?auto_1122188 ) ) ( not ( = ?auto_1122187 ?auto_1122190 ) ) ( not ( = ?auto_1122187 ?auto_1122191 ) ) ( not ( = ?auto_1122187 ?auto_1122192 ) ) ( not ( = ?auto_1122187 ?auto_1122193 ) ) ( not ( = ?auto_1122187 ?auto_1122194 ) ) ( not ( = ?auto_1122187 ?auto_1122196 ) ) ( not ( = ?auto_1122189 ?auto_1122188 ) ) ( not ( = ?auto_1122189 ?auto_1122190 ) ) ( not ( = ?auto_1122189 ?auto_1122191 ) ) ( not ( = ?auto_1122189 ?auto_1122192 ) ) ( not ( = ?auto_1122189 ?auto_1122193 ) ) ( not ( = ?auto_1122189 ?auto_1122194 ) ) ( not ( = ?auto_1122189 ?auto_1122196 ) ) ( not ( = ?auto_1122188 ?auto_1122190 ) ) ( not ( = ?auto_1122188 ?auto_1122191 ) ) ( not ( = ?auto_1122188 ?auto_1122192 ) ) ( not ( = ?auto_1122188 ?auto_1122193 ) ) ( not ( = ?auto_1122188 ?auto_1122194 ) ) ( not ( = ?auto_1122188 ?auto_1122196 ) ) ( not ( = ?auto_1122190 ?auto_1122191 ) ) ( not ( = ?auto_1122190 ?auto_1122192 ) ) ( not ( = ?auto_1122190 ?auto_1122193 ) ) ( not ( = ?auto_1122190 ?auto_1122194 ) ) ( not ( = ?auto_1122190 ?auto_1122196 ) ) ( not ( = ?auto_1122191 ?auto_1122192 ) ) ( not ( = ?auto_1122191 ?auto_1122193 ) ) ( not ( = ?auto_1122191 ?auto_1122194 ) ) ( not ( = ?auto_1122191 ?auto_1122196 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1122192 ?auto_1122193 ?auto_1122194 )
      ( MAKE-9CRATE-VERIFY ?auto_1122185 ?auto_1122186 ?auto_1122187 ?auto_1122189 ?auto_1122188 ?auto_1122190 ?auto_1122191 ?auto_1122192 ?auto_1122193 ?auto_1122194 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1122294 - SURFACE
      ?auto_1122295 - SURFACE
      ?auto_1122296 - SURFACE
      ?auto_1122298 - SURFACE
      ?auto_1122297 - SURFACE
      ?auto_1122299 - SURFACE
      ?auto_1122300 - SURFACE
      ?auto_1122301 - SURFACE
      ?auto_1122302 - SURFACE
      ?auto_1122303 - SURFACE
    )
    :vars
    (
      ?auto_1122308 - HOIST
      ?auto_1122307 - PLACE
      ?auto_1122306 - PLACE
      ?auto_1122305 - HOIST
      ?auto_1122304 - SURFACE
      ?auto_1122309 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1122308 ?auto_1122307 ) ( IS-CRATE ?auto_1122303 ) ( not ( = ?auto_1122302 ?auto_1122303 ) ) ( not ( = ?auto_1122301 ?auto_1122302 ) ) ( not ( = ?auto_1122301 ?auto_1122303 ) ) ( not ( = ?auto_1122306 ?auto_1122307 ) ) ( HOIST-AT ?auto_1122305 ?auto_1122306 ) ( not ( = ?auto_1122308 ?auto_1122305 ) ) ( AVAILABLE ?auto_1122305 ) ( SURFACE-AT ?auto_1122303 ?auto_1122306 ) ( ON ?auto_1122303 ?auto_1122304 ) ( CLEAR ?auto_1122303 ) ( not ( = ?auto_1122302 ?auto_1122304 ) ) ( not ( = ?auto_1122303 ?auto_1122304 ) ) ( not ( = ?auto_1122301 ?auto_1122304 ) ) ( TRUCK-AT ?auto_1122309 ?auto_1122307 ) ( SURFACE-AT ?auto_1122301 ?auto_1122307 ) ( CLEAR ?auto_1122301 ) ( LIFTING ?auto_1122308 ?auto_1122302 ) ( IS-CRATE ?auto_1122302 ) ( ON ?auto_1122295 ?auto_1122294 ) ( ON ?auto_1122296 ?auto_1122295 ) ( ON ?auto_1122298 ?auto_1122296 ) ( ON ?auto_1122297 ?auto_1122298 ) ( ON ?auto_1122299 ?auto_1122297 ) ( ON ?auto_1122300 ?auto_1122299 ) ( ON ?auto_1122301 ?auto_1122300 ) ( not ( = ?auto_1122294 ?auto_1122295 ) ) ( not ( = ?auto_1122294 ?auto_1122296 ) ) ( not ( = ?auto_1122294 ?auto_1122298 ) ) ( not ( = ?auto_1122294 ?auto_1122297 ) ) ( not ( = ?auto_1122294 ?auto_1122299 ) ) ( not ( = ?auto_1122294 ?auto_1122300 ) ) ( not ( = ?auto_1122294 ?auto_1122301 ) ) ( not ( = ?auto_1122294 ?auto_1122302 ) ) ( not ( = ?auto_1122294 ?auto_1122303 ) ) ( not ( = ?auto_1122294 ?auto_1122304 ) ) ( not ( = ?auto_1122295 ?auto_1122296 ) ) ( not ( = ?auto_1122295 ?auto_1122298 ) ) ( not ( = ?auto_1122295 ?auto_1122297 ) ) ( not ( = ?auto_1122295 ?auto_1122299 ) ) ( not ( = ?auto_1122295 ?auto_1122300 ) ) ( not ( = ?auto_1122295 ?auto_1122301 ) ) ( not ( = ?auto_1122295 ?auto_1122302 ) ) ( not ( = ?auto_1122295 ?auto_1122303 ) ) ( not ( = ?auto_1122295 ?auto_1122304 ) ) ( not ( = ?auto_1122296 ?auto_1122298 ) ) ( not ( = ?auto_1122296 ?auto_1122297 ) ) ( not ( = ?auto_1122296 ?auto_1122299 ) ) ( not ( = ?auto_1122296 ?auto_1122300 ) ) ( not ( = ?auto_1122296 ?auto_1122301 ) ) ( not ( = ?auto_1122296 ?auto_1122302 ) ) ( not ( = ?auto_1122296 ?auto_1122303 ) ) ( not ( = ?auto_1122296 ?auto_1122304 ) ) ( not ( = ?auto_1122298 ?auto_1122297 ) ) ( not ( = ?auto_1122298 ?auto_1122299 ) ) ( not ( = ?auto_1122298 ?auto_1122300 ) ) ( not ( = ?auto_1122298 ?auto_1122301 ) ) ( not ( = ?auto_1122298 ?auto_1122302 ) ) ( not ( = ?auto_1122298 ?auto_1122303 ) ) ( not ( = ?auto_1122298 ?auto_1122304 ) ) ( not ( = ?auto_1122297 ?auto_1122299 ) ) ( not ( = ?auto_1122297 ?auto_1122300 ) ) ( not ( = ?auto_1122297 ?auto_1122301 ) ) ( not ( = ?auto_1122297 ?auto_1122302 ) ) ( not ( = ?auto_1122297 ?auto_1122303 ) ) ( not ( = ?auto_1122297 ?auto_1122304 ) ) ( not ( = ?auto_1122299 ?auto_1122300 ) ) ( not ( = ?auto_1122299 ?auto_1122301 ) ) ( not ( = ?auto_1122299 ?auto_1122302 ) ) ( not ( = ?auto_1122299 ?auto_1122303 ) ) ( not ( = ?auto_1122299 ?auto_1122304 ) ) ( not ( = ?auto_1122300 ?auto_1122301 ) ) ( not ( = ?auto_1122300 ?auto_1122302 ) ) ( not ( = ?auto_1122300 ?auto_1122303 ) ) ( not ( = ?auto_1122300 ?auto_1122304 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1122301 ?auto_1122302 ?auto_1122303 )
      ( MAKE-9CRATE-VERIFY ?auto_1122294 ?auto_1122295 ?auto_1122296 ?auto_1122298 ?auto_1122297 ?auto_1122299 ?auto_1122300 ?auto_1122301 ?auto_1122302 ?auto_1122303 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1122403 - SURFACE
      ?auto_1122404 - SURFACE
      ?auto_1122405 - SURFACE
      ?auto_1122407 - SURFACE
      ?auto_1122406 - SURFACE
      ?auto_1122408 - SURFACE
      ?auto_1122409 - SURFACE
      ?auto_1122410 - SURFACE
      ?auto_1122411 - SURFACE
      ?auto_1122412 - SURFACE
    )
    :vars
    (
      ?auto_1122418 - HOIST
      ?auto_1122417 - PLACE
      ?auto_1122414 - PLACE
      ?auto_1122413 - HOIST
      ?auto_1122415 - SURFACE
      ?auto_1122416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1122418 ?auto_1122417 ) ( IS-CRATE ?auto_1122412 ) ( not ( = ?auto_1122411 ?auto_1122412 ) ) ( not ( = ?auto_1122410 ?auto_1122411 ) ) ( not ( = ?auto_1122410 ?auto_1122412 ) ) ( not ( = ?auto_1122414 ?auto_1122417 ) ) ( HOIST-AT ?auto_1122413 ?auto_1122414 ) ( not ( = ?auto_1122418 ?auto_1122413 ) ) ( AVAILABLE ?auto_1122413 ) ( SURFACE-AT ?auto_1122412 ?auto_1122414 ) ( ON ?auto_1122412 ?auto_1122415 ) ( CLEAR ?auto_1122412 ) ( not ( = ?auto_1122411 ?auto_1122415 ) ) ( not ( = ?auto_1122412 ?auto_1122415 ) ) ( not ( = ?auto_1122410 ?auto_1122415 ) ) ( TRUCK-AT ?auto_1122416 ?auto_1122417 ) ( SURFACE-AT ?auto_1122410 ?auto_1122417 ) ( CLEAR ?auto_1122410 ) ( IS-CRATE ?auto_1122411 ) ( AVAILABLE ?auto_1122418 ) ( IN ?auto_1122411 ?auto_1122416 ) ( ON ?auto_1122404 ?auto_1122403 ) ( ON ?auto_1122405 ?auto_1122404 ) ( ON ?auto_1122407 ?auto_1122405 ) ( ON ?auto_1122406 ?auto_1122407 ) ( ON ?auto_1122408 ?auto_1122406 ) ( ON ?auto_1122409 ?auto_1122408 ) ( ON ?auto_1122410 ?auto_1122409 ) ( not ( = ?auto_1122403 ?auto_1122404 ) ) ( not ( = ?auto_1122403 ?auto_1122405 ) ) ( not ( = ?auto_1122403 ?auto_1122407 ) ) ( not ( = ?auto_1122403 ?auto_1122406 ) ) ( not ( = ?auto_1122403 ?auto_1122408 ) ) ( not ( = ?auto_1122403 ?auto_1122409 ) ) ( not ( = ?auto_1122403 ?auto_1122410 ) ) ( not ( = ?auto_1122403 ?auto_1122411 ) ) ( not ( = ?auto_1122403 ?auto_1122412 ) ) ( not ( = ?auto_1122403 ?auto_1122415 ) ) ( not ( = ?auto_1122404 ?auto_1122405 ) ) ( not ( = ?auto_1122404 ?auto_1122407 ) ) ( not ( = ?auto_1122404 ?auto_1122406 ) ) ( not ( = ?auto_1122404 ?auto_1122408 ) ) ( not ( = ?auto_1122404 ?auto_1122409 ) ) ( not ( = ?auto_1122404 ?auto_1122410 ) ) ( not ( = ?auto_1122404 ?auto_1122411 ) ) ( not ( = ?auto_1122404 ?auto_1122412 ) ) ( not ( = ?auto_1122404 ?auto_1122415 ) ) ( not ( = ?auto_1122405 ?auto_1122407 ) ) ( not ( = ?auto_1122405 ?auto_1122406 ) ) ( not ( = ?auto_1122405 ?auto_1122408 ) ) ( not ( = ?auto_1122405 ?auto_1122409 ) ) ( not ( = ?auto_1122405 ?auto_1122410 ) ) ( not ( = ?auto_1122405 ?auto_1122411 ) ) ( not ( = ?auto_1122405 ?auto_1122412 ) ) ( not ( = ?auto_1122405 ?auto_1122415 ) ) ( not ( = ?auto_1122407 ?auto_1122406 ) ) ( not ( = ?auto_1122407 ?auto_1122408 ) ) ( not ( = ?auto_1122407 ?auto_1122409 ) ) ( not ( = ?auto_1122407 ?auto_1122410 ) ) ( not ( = ?auto_1122407 ?auto_1122411 ) ) ( not ( = ?auto_1122407 ?auto_1122412 ) ) ( not ( = ?auto_1122407 ?auto_1122415 ) ) ( not ( = ?auto_1122406 ?auto_1122408 ) ) ( not ( = ?auto_1122406 ?auto_1122409 ) ) ( not ( = ?auto_1122406 ?auto_1122410 ) ) ( not ( = ?auto_1122406 ?auto_1122411 ) ) ( not ( = ?auto_1122406 ?auto_1122412 ) ) ( not ( = ?auto_1122406 ?auto_1122415 ) ) ( not ( = ?auto_1122408 ?auto_1122409 ) ) ( not ( = ?auto_1122408 ?auto_1122410 ) ) ( not ( = ?auto_1122408 ?auto_1122411 ) ) ( not ( = ?auto_1122408 ?auto_1122412 ) ) ( not ( = ?auto_1122408 ?auto_1122415 ) ) ( not ( = ?auto_1122409 ?auto_1122410 ) ) ( not ( = ?auto_1122409 ?auto_1122411 ) ) ( not ( = ?auto_1122409 ?auto_1122412 ) ) ( not ( = ?auto_1122409 ?auto_1122415 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1122410 ?auto_1122411 ?auto_1122412 )
      ( MAKE-9CRATE-VERIFY ?auto_1122403 ?auto_1122404 ?auto_1122405 ?auto_1122407 ?auto_1122406 ?auto_1122408 ?auto_1122409 ?auto_1122410 ?auto_1122411 ?auto_1122412 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1127895 - SURFACE
      ?auto_1127896 - SURFACE
      ?auto_1127897 - SURFACE
      ?auto_1127899 - SURFACE
      ?auto_1127898 - SURFACE
      ?auto_1127900 - SURFACE
      ?auto_1127901 - SURFACE
      ?auto_1127902 - SURFACE
      ?auto_1127903 - SURFACE
      ?auto_1127904 - SURFACE
      ?auto_1127905 - SURFACE
    )
    :vars
    (
      ?auto_1127906 - HOIST
      ?auto_1127907 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1127906 ?auto_1127907 ) ( SURFACE-AT ?auto_1127904 ?auto_1127907 ) ( CLEAR ?auto_1127904 ) ( LIFTING ?auto_1127906 ?auto_1127905 ) ( IS-CRATE ?auto_1127905 ) ( not ( = ?auto_1127904 ?auto_1127905 ) ) ( ON ?auto_1127896 ?auto_1127895 ) ( ON ?auto_1127897 ?auto_1127896 ) ( ON ?auto_1127899 ?auto_1127897 ) ( ON ?auto_1127898 ?auto_1127899 ) ( ON ?auto_1127900 ?auto_1127898 ) ( ON ?auto_1127901 ?auto_1127900 ) ( ON ?auto_1127902 ?auto_1127901 ) ( ON ?auto_1127903 ?auto_1127902 ) ( ON ?auto_1127904 ?auto_1127903 ) ( not ( = ?auto_1127895 ?auto_1127896 ) ) ( not ( = ?auto_1127895 ?auto_1127897 ) ) ( not ( = ?auto_1127895 ?auto_1127899 ) ) ( not ( = ?auto_1127895 ?auto_1127898 ) ) ( not ( = ?auto_1127895 ?auto_1127900 ) ) ( not ( = ?auto_1127895 ?auto_1127901 ) ) ( not ( = ?auto_1127895 ?auto_1127902 ) ) ( not ( = ?auto_1127895 ?auto_1127903 ) ) ( not ( = ?auto_1127895 ?auto_1127904 ) ) ( not ( = ?auto_1127895 ?auto_1127905 ) ) ( not ( = ?auto_1127896 ?auto_1127897 ) ) ( not ( = ?auto_1127896 ?auto_1127899 ) ) ( not ( = ?auto_1127896 ?auto_1127898 ) ) ( not ( = ?auto_1127896 ?auto_1127900 ) ) ( not ( = ?auto_1127896 ?auto_1127901 ) ) ( not ( = ?auto_1127896 ?auto_1127902 ) ) ( not ( = ?auto_1127896 ?auto_1127903 ) ) ( not ( = ?auto_1127896 ?auto_1127904 ) ) ( not ( = ?auto_1127896 ?auto_1127905 ) ) ( not ( = ?auto_1127897 ?auto_1127899 ) ) ( not ( = ?auto_1127897 ?auto_1127898 ) ) ( not ( = ?auto_1127897 ?auto_1127900 ) ) ( not ( = ?auto_1127897 ?auto_1127901 ) ) ( not ( = ?auto_1127897 ?auto_1127902 ) ) ( not ( = ?auto_1127897 ?auto_1127903 ) ) ( not ( = ?auto_1127897 ?auto_1127904 ) ) ( not ( = ?auto_1127897 ?auto_1127905 ) ) ( not ( = ?auto_1127899 ?auto_1127898 ) ) ( not ( = ?auto_1127899 ?auto_1127900 ) ) ( not ( = ?auto_1127899 ?auto_1127901 ) ) ( not ( = ?auto_1127899 ?auto_1127902 ) ) ( not ( = ?auto_1127899 ?auto_1127903 ) ) ( not ( = ?auto_1127899 ?auto_1127904 ) ) ( not ( = ?auto_1127899 ?auto_1127905 ) ) ( not ( = ?auto_1127898 ?auto_1127900 ) ) ( not ( = ?auto_1127898 ?auto_1127901 ) ) ( not ( = ?auto_1127898 ?auto_1127902 ) ) ( not ( = ?auto_1127898 ?auto_1127903 ) ) ( not ( = ?auto_1127898 ?auto_1127904 ) ) ( not ( = ?auto_1127898 ?auto_1127905 ) ) ( not ( = ?auto_1127900 ?auto_1127901 ) ) ( not ( = ?auto_1127900 ?auto_1127902 ) ) ( not ( = ?auto_1127900 ?auto_1127903 ) ) ( not ( = ?auto_1127900 ?auto_1127904 ) ) ( not ( = ?auto_1127900 ?auto_1127905 ) ) ( not ( = ?auto_1127901 ?auto_1127902 ) ) ( not ( = ?auto_1127901 ?auto_1127903 ) ) ( not ( = ?auto_1127901 ?auto_1127904 ) ) ( not ( = ?auto_1127901 ?auto_1127905 ) ) ( not ( = ?auto_1127902 ?auto_1127903 ) ) ( not ( = ?auto_1127902 ?auto_1127904 ) ) ( not ( = ?auto_1127902 ?auto_1127905 ) ) ( not ( = ?auto_1127903 ?auto_1127904 ) ) ( not ( = ?auto_1127903 ?auto_1127905 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1127904 ?auto_1127905 )
      ( MAKE-10CRATE-VERIFY ?auto_1127895 ?auto_1127896 ?auto_1127897 ?auto_1127899 ?auto_1127898 ?auto_1127900 ?auto_1127901 ?auto_1127902 ?auto_1127903 ?auto_1127904 ?auto_1127905 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1127989 - SURFACE
      ?auto_1127990 - SURFACE
      ?auto_1127991 - SURFACE
      ?auto_1127993 - SURFACE
      ?auto_1127992 - SURFACE
      ?auto_1127994 - SURFACE
      ?auto_1127995 - SURFACE
      ?auto_1127996 - SURFACE
      ?auto_1127997 - SURFACE
      ?auto_1127998 - SURFACE
      ?auto_1127999 - SURFACE
    )
    :vars
    (
      ?auto_1128002 - HOIST
      ?auto_1128001 - PLACE
      ?auto_1128000 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1128002 ?auto_1128001 ) ( SURFACE-AT ?auto_1127998 ?auto_1128001 ) ( CLEAR ?auto_1127998 ) ( IS-CRATE ?auto_1127999 ) ( not ( = ?auto_1127998 ?auto_1127999 ) ) ( TRUCK-AT ?auto_1128000 ?auto_1128001 ) ( AVAILABLE ?auto_1128002 ) ( IN ?auto_1127999 ?auto_1128000 ) ( ON ?auto_1127998 ?auto_1127997 ) ( not ( = ?auto_1127997 ?auto_1127998 ) ) ( not ( = ?auto_1127997 ?auto_1127999 ) ) ( ON ?auto_1127990 ?auto_1127989 ) ( ON ?auto_1127991 ?auto_1127990 ) ( ON ?auto_1127993 ?auto_1127991 ) ( ON ?auto_1127992 ?auto_1127993 ) ( ON ?auto_1127994 ?auto_1127992 ) ( ON ?auto_1127995 ?auto_1127994 ) ( ON ?auto_1127996 ?auto_1127995 ) ( ON ?auto_1127997 ?auto_1127996 ) ( not ( = ?auto_1127989 ?auto_1127990 ) ) ( not ( = ?auto_1127989 ?auto_1127991 ) ) ( not ( = ?auto_1127989 ?auto_1127993 ) ) ( not ( = ?auto_1127989 ?auto_1127992 ) ) ( not ( = ?auto_1127989 ?auto_1127994 ) ) ( not ( = ?auto_1127989 ?auto_1127995 ) ) ( not ( = ?auto_1127989 ?auto_1127996 ) ) ( not ( = ?auto_1127989 ?auto_1127997 ) ) ( not ( = ?auto_1127989 ?auto_1127998 ) ) ( not ( = ?auto_1127989 ?auto_1127999 ) ) ( not ( = ?auto_1127990 ?auto_1127991 ) ) ( not ( = ?auto_1127990 ?auto_1127993 ) ) ( not ( = ?auto_1127990 ?auto_1127992 ) ) ( not ( = ?auto_1127990 ?auto_1127994 ) ) ( not ( = ?auto_1127990 ?auto_1127995 ) ) ( not ( = ?auto_1127990 ?auto_1127996 ) ) ( not ( = ?auto_1127990 ?auto_1127997 ) ) ( not ( = ?auto_1127990 ?auto_1127998 ) ) ( not ( = ?auto_1127990 ?auto_1127999 ) ) ( not ( = ?auto_1127991 ?auto_1127993 ) ) ( not ( = ?auto_1127991 ?auto_1127992 ) ) ( not ( = ?auto_1127991 ?auto_1127994 ) ) ( not ( = ?auto_1127991 ?auto_1127995 ) ) ( not ( = ?auto_1127991 ?auto_1127996 ) ) ( not ( = ?auto_1127991 ?auto_1127997 ) ) ( not ( = ?auto_1127991 ?auto_1127998 ) ) ( not ( = ?auto_1127991 ?auto_1127999 ) ) ( not ( = ?auto_1127993 ?auto_1127992 ) ) ( not ( = ?auto_1127993 ?auto_1127994 ) ) ( not ( = ?auto_1127993 ?auto_1127995 ) ) ( not ( = ?auto_1127993 ?auto_1127996 ) ) ( not ( = ?auto_1127993 ?auto_1127997 ) ) ( not ( = ?auto_1127993 ?auto_1127998 ) ) ( not ( = ?auto_1127993 ?auto_1127999 ) ) ( not ( = ?auto_1127992 ?auto_1127994 ) ) ( not ( = ?auto_1127992 ?auto_1127995 ) ) ( not ( = ?auto_1127992 ?auto_1127996 ) ) ( not ( = ?auto_1127992 ?auto_1127997 ) ) ( not ( = ?auto_1127992 ?auto_1127998 ) ) ( not ( = ?auto_1127992 ?auto_1127999 ) ) ( not ( = ?auto_1127994 ?auto_1127995 ) ) ( not ( = ?auto_1127994 ?auto_1127996 ) ) ( not ( = ?auto_1127994 ?auto_1127997 ) ) ( not ( = ?auto_1127994 ?auto_1127998 ) ) ( not ( = ?auto_1127994 ?auto_1127999 ) ) ( not ( = ?auto_1127995 ?auto_1127996 ) ) ( not ( = ?auto_1127995 ?auto_1127997 ) ) ( not ( = ?auto_1127995 ?auto_1127998 ) ) ( not ( = ?auto_1127995 ?auto_1127999 ) ) ( not ( = ?auto_1127996 ?auto_1127997 ) ) ( not ( = ?auto_1127996 ?auto_1127998 ) ) ( not ( = ?auto_1127996 ?auto_1127999 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1127997 ?auto_1127998 ?auto_1127999 )
      ( MAKE-10CRATE-VERIFY ?auto_1127989 ?auto_1127990 ?auto_1127991 ?auto_1127993 ?auto_1127992 ?auto_1127994 ?auto_1127995 ?auto_1127996 ?auto_1127997 ?auto_1127998 ?auto_1127999 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1128094 - SURFACE
      ?auto_1128095 - SURFACE
      ?auto_1128096 - SURFACE
      ?auto_1128098 - SURFACE
      ?auto_1128097 - SURFACE
      ?auto_1128099 - SURFACE
      ?auto_1128100 - SURFACE
      ?auto_1128101 - SURFACE
      ?auto_1128102 - SURFACE
      ?auto_1128103 - SURFACE
      ?auto_1128104 - SURFACE
    )
    :vars
    (
      ?auto_1128105 - HOIST
      ?auto_1128107 - PLACE
      ?auto_1128108 - TRUCK
      ?auto_1128106 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1128105 ?auto_1128107 ) ( SURFACE-AT ?auto_1128103 ?auto_1128107 ) ( CLEAR ?auto_1128103 ) ( IS-CRATE ?auto_1128104 ) ( not ( = ?auto_1128103 ?auto_1128104 ) ) ( AVAILABLE ?auto_1128105 ) ( IN ?auto_1128104 ?auto_1128108 ) ( ON ?auto_1128103 ?auto_1128102 ) ( not ( = ?auto_1128102 ?auto_1128103 ) ) ( not ( = ?auto_1128102 ?auto_1128104 ) ) ( TRUCK-AT ?auto_1128108 ?auto_1128106 ) ( not ( = ?auto_1128106 ?auto_1128107 ) ) ( ON ?auto_1128095 ?auto_1128094 ) ( ON ?auto_1128096 ?auto_1128095 ) ( ON ?auto_1128098 ?auto_1128096 ) ( ON ?auto_1128097 ?auto_1128098 ) ( ON ?auto_1128099 ?auto_1128097 ) ( ON ?auto_1128100 ?auto_1128099 ) ( ON ?auto_1128101 ?auto_1128100 ) ( ON ?auto_1128102 ?auto_1128101 ) ( not ( = ?auto_1128094 ?auto_1128095 ) ) ( not ( = ?auto_1128094 ?auto_1128096 ) ) ( not ( = ?auto_1128094 ?auto_1128098 ) ) ( not ( = ?auto_1128094 ?auto_1128097 ) ) ( not ( = ?auto_1128094 ?auto_1128099 ) ) ( not ( = ?auto_1128094 ?auto_1128100 ) ) ( not ( = ?auto_1128094 ?auto_1128101 ) ) ( not ( = ?auto_1128094 ?auto_1128102 ) ) ( not ( = ?auto_1128094 ?auto_1128103 ) ) ( not ( = ?auto_1128094 ?auto_1128104 ) ) ( not ( = ?auto_1128095 ?auto_1128096 ) ) ( not ( = ?auto_1128095 ?auto_1128098 ) ) ( not ( = ?auto_1128095 ?auto_1128097 ) ) ( not ( = ?auto_1128095 ?auto_1128099 ) ) ( not ( = ?auto_1128095 ?auto_1128100 ) ) ( not ( = ?auto_1128095 ?auto_1128101 ) ) ( not ( = ?auto_1128095 ?auto_1128102 ) ) ( not ( = ?auto_1128095 ?auto_1128103 ) ) ( not ( = ?auto_1128095 ?auto_1128104 ) ) ( not ( = ?auto_1128096 ?auto_1128098 ) ) ( not ( = ?auto_1128096 ?auto_1128097 ) ) ( not ( = ?auto_1128096 ?auto_1128099 ) ) ( not ( = ?auto_1128096 ?auto_1128100 ) ) ( not ( = ?auto_1128096 ?auto_1128101 ) ) ( not ( = ?auto_1128096 ?auto_1128102 ) ) ( not ( = ?auto_1128096 ?auto_1128103 ) ) ( not ( = ?auto_1128096 ?auto_1128104 ) ) ( not ( = ?auto_1128098 ?auto_1128097 ) ) ( not ( = ?auto_1128098 ?auto_1128099 ) ) ( not ( = ?auto_1128098 ?auto_1128100 ) ) ( not ( = ?auto_1128098 ?auto_1128101 ) ) ( not ( = ?auto_1128098 ?auto_1128102 ) ) ( not ( = ?auto_1128098 ?auto_1128103 ) ) ( not ( = ?auto_1128098 ?auto_1128104 ) ) ( not ( = ?auto_1128097 ?auto_1128099 ) ) ( not ( = ?auto_1128097 ?auto_1128100 ) ) ( not ( = ?auto_1128097 ?auto_1128101 ) ) ( not ( = ?auto_1128097 ?auto_1128102 ) ) ( not ( = ?auto_1128097 ?auto_1128103 ) ) ( not ( = ?auto_1128097 ?auto_1128104 ) ) ( not ( = ?auto_1128099 ?auto_1128100 ) ) ( not ( = ?auto_1128099 ?auto_1128101 ) ) ( not ( = ?auto_1128099 ?auto_1128102 ) ) ( not ( = ?auto_1128099 ?auto_1128103 ) ) ( not ( = ?auto_1128099 ?auto_1128104 ) ) ( not ( = ?auto_1128100 ?auto_1128101 ) ) ( not ( = ?auto_1128100 ?auto_1128102 ) ) ( not ( = ?auto_1128100 ?auto_1128103 ) ) ( not ( = ?auto_1128100 ?auto_1128104 ) ) ( not ( = ?auto_1128101 ?auto_1128102 ) ) ( not ( = ?auto_1128101 ?auto_1128103 ) ) ( not ( = ?auto_1128101 ?auto_1128104 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1128102 ?auto_1128103 ?auto_1128104 )
      ( MAKE-10CRATE-VERIFY ?auto_1128094 ?auto_1128095 ?auto_1128096 ?auto_1128098 ?auto_1128097 ?auto_1128099 ?auto_1128100 ?auto_1128101 ?auto_1128102 ?auto_1128103 ?auto_1128104 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1128209 - SURFACE
      ?auto_1128210 - SURFACE
      ?auto_1128211 - SURFACE
      ?auto_1128213 - SURFACE
      ?auto_1128212 - SURFACE
      ?auto_1128214 - SURFACE
      ?auto_1128215 - SURFACE
      ?auto_1128216 - SURFACE
      ?auto_1128217 - SURFACE
      ?auto_1128218 - SURFACE
      ?auto_1128219 - SURFACE
    )
    :vars
    (
      ?auto_1128221 - HOIST
      ?auto_1128222 - PLACE
      ?auto_1128220 - TRUCK
      ?auto_1128223 - PLACE
      ?auto_1128224 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1128221 ?auto_1128222 ) ( SURFACE-AT ?auto_1128218 ?auto_1128222 ) ( CLEAR ?auto_1128218 ) ( IS-CRATE ?auto_1128219 ) ( not ( = ?auto_1128218 ?auto_1128219 ) ) ( AVAILABLE ?auto_1128221 ) ( ON ?auto_1128218 ?auto_1128217 ) ( not ( = ?auto_1128217 ?auto_1128218 ) ) ( not ( = ?auto_1128217 ?auto_1128219 ) ) ( TRUCK-AT ?auto_1128220 ?auto_1128223 ) ( not ( = ?auto_1128223 ?auto_1128222 ) ) ( HOIST-AT ?auto_1128224 ?auto_1128223 ) ( LIFTING ?auto_1128224 ?auto_1128219 ) ( not ( = ?auto_1128221 ?auto_1128224 ) ) ( ON ?auto_1128210 ?auto_1128209 ) ( ON ?auto_1128211 ?auto_1128210 ) ( ON ?auto_1128213 ?auto_1128211 ) ( ON ?auto_1128212 ?auto_1128213 ) ( ON ?auto_1128214 ?auto_1128212 ) ( ON ?auto_1128215 ?auto_1128214 ) ( ON ?auto_1128216 ?auto_1128215 ) ( ON ?auto_1128217 ?auto_1128216 ) ( not ( = ?auto_1128209 ?auto_1128210 ) ) ( not ( = ?auto_1128209 ?auto_1128211 ) ) ( not ( = ?auto_1128209 ?auto_1128213 ) ) ( not ( = ?auto_1128209 ?auto_1128212 ) ) ( not ( = ?auto_1128209 ?auto_1128214 ) ) ( not ( = ?auto_1128209 ?auto_1128215 ) ) ( not ( = ?auto_1128209 ?auto_1128216 ) ) ( not ( = ?auto_1128209 ?auto_1128217 ) ) ( not ( = ?auto_1128209 ?auto_1128218 ) ) ( not ( = ?auto_1128209 ?auto_1128219 ) ) ( not ( = ?auto_1128210 ?auto_1128211 ) ) ( not ( = ?auto_1128210 ?auto_1128213 ) ) ( not ( = ?auto_1128210 ?auto_1128212 ) ) ( not ( = ?auto_1128210 ?auto_1128214 ) ) ( not ( = ?auto_1128210 ?auto_1128215 ) ) ( not ( = ?auto_1128210 ?auto_1128216 ) ) ( not ( = ?auto_1128210 ?auto_1128217 ) ) ( not ( = ?auto_1128210 ?auto_1128218 ) ) ( not ( = ?auto_1128210 ?auto_1128219 ) ) ( not ( = ?auto_1128211 ?auto_1128213 ) ) ( not ( = ?auto_1128211 ?auto_1128212 ) ) ( not ( = ?auto_1128211 ?auto_1128214 ) ) ( not ( = ?auto_1128211 ?auto_1128215 ) ) ( not ( = ?auto_1128211 ?auto_1128216 ) ) ( not ( = ?auto_1128211 ?auto_1128217 ) ) ( not ( = ?auto_1128211 ?auto_1128218 ) ) ( not ( = ?auto_1128211 ?auto_1128219 ) ) ( not ( = ?auto_1128213 ?auto_1128212 ) ) ( not ( = ?auto_1128213 ?auto_1128214 ) ) ( not ( = ?auto_1128213 ?auto_1128215 ) ) ( not ( = ?auto_1128213 ?auto_1128216 ) ) ( not ( = ?auto_1128213 ?auto_1128217 ) ) ( not ( = ?auto_1128213 ?auto_1128218 ) ) ( not ( = ?auto_1128213 ?auto_1128219 ) ) ( not ( = ?auto_1128212 ?auto_1128214 ) ) ( not ( = ?auto_1128212 ?auto_1128215 ) ) ( not ( = ?auto_1128212 ?auto_1128216 ) ) ( not ( = ?auto_1128212 ?auto_1128217 ) ) ( not ( = ?auto_1128212 ?auto_1128218 ) ) ( not ( = ?auto_1128212 ?auto_1128219 ) ) ( not ( = ?auto_1128214 ?auto_1128215 ) ) ( not ( = ?auto_1128214 ?auto_1128216 ) ) ( not ( = ?auto_1128214 ?auto_1128217 ) ) ( not ( = ?auto_1128214 ?auto_1128218 ) ) ( not ( = ?auto_1128214 ?auto_1128219 ) ) ( not ( = ?auto_1128215 ?auto_1128216 ) ) ( not ( = ?auto_1128215 ?auto_1128217 ) ) ( not ( = ?auto_1128215 ?auto_1128218 ) ) ( not ( = ?auto_1128215 ?auto_1128219 ) ) ( not ( = ?auto_1128216 ?auto_1128217 ) ) ( not ( = ?auto_1128216 ?auto_1128218 ) ) ( not ( = ?auto_1128216 ?auto_1128219 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1128217 ?auto_1128218 ?auto_1128219 )
      ( MAKE-10CRATE-VERIFY ?auto_1128209 ?auto_1128210 ?auto_1128211 ?auto_1128213 ?auto_1128212 ?auto_1128214 ?auto_1128215 ?auto_1128216 ?auto_1128217 ?auto_1128218 ?auto_1128219 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1128334 - SURFACE
      ?auto_1128335 - SURFACE
      ?auto_1128336 - SURFACE
      ?auto_1128338 - SURFACE
      ?auto_1128337 - SURFACE
      ?auto_1128339 - SURFACE
      ?auto_1128340 - SURFACE
      ?auto_1128341 - SURFACE
      ?auto_1128342 - SURFACE
      ?auto_1128343 - SURFACE
      ?auto_1128344 - SURFACE
    )
    :vars
    (
      ?auto_1128345 - HOIST
      ?auto_1128350 - PLACE
      ?auto_1128347 - TRUCK
      ?auto_1128346 - PLACE
      ?auto_1128349 - HOIST
      ?auto_1128348 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1128345 ?auto_1128350 ) ( SURFACE-AT ?auto_1128343 ?auto_1128350 ) ( CLEAR ?auto_1128343 ) ( IS-CRATE ?auto_1128344 ) ( not ( = ?auto_1128343 ?auto_1128344 ) ) ( AVAILABLE ?auto_1128345 ) ( ON ?auto_1128343 ?auto_1128342 ) ( not ( = ?auto_1128342 ?auto_1128343 ) ) ( not ( = ?auto_1128342 ?auto_1128344 ) ) ( TRUCK-AT ?auto_1128347 ?auto_1128346 ) ( not ( = ?auto_1128346 ?auto_1128350 ) ) ( HOIST-AT ?auto_1128349 ?auto_1128346 ) ( not ( = ?auto_1128345 ?auto_1128349 ) ) ( AVAILABLE ?auto_1128349 ) ( SURFACE-AT ?auto_1128344 ?auto_1128346 ) ( ON ?auto_1128344 ?auto_1128348 ) ( CLEAR ?auto_1128344 ) ( not ( = ?auto_1128343 ?auto_1128348 ) ) ( not ( = ?auto_1128344 ?auto_1128348 ) ) ( not ( = ?auto_1128342 ?auto_1128348 ) ) ( ON ?auto_1128335 ?auto_1128334 ) ( ON ?auto_1128336 ?auto_1128335 ) ( ON ?auto_1128338 ?auto_1128336 ) ( ON ?auto_1128337 ?auto_1128338 ) ( ON ?auto_1128339 ?auto_1128337 ) ( ON ?auto_1128340 ?auto_1128339 ) ( ON ?auto_1128341 ?auto_1128340 ) ( ON ?auto_1128342 ?auto_1128341 ) ( not ( = ?auto_1128334 ?auto_1128335 ) ) ( not ( = ?auto_1128334 ?auto_1128336 ) ) ( not ( = ?auto_1128334 ?auto_1128338 ) ) ( not ( = ?auto_1128334 ?auto_1128337 ) ) ( not ( = ?auto_1128334 ?auto_1128339 ) ) ( not ( = ?auto_1128334 ?auto_1128340 ) ) ( not ( = ?auto_1128334 ?auto_1128341 ) ) ( not ( = ?auto_1128334 ?auto_1128342 ) ) ( not ( = ?auto_1128334 ?auto_1128343 ) ) ( not ( = ?auto_1128334 ?auto_1128344 ) ) ( not ( = ?auto_1128334 ?auto_1128348 ) ) ( not ( = ?auto_1128335 ?auto_1128336 ) ) ( not ( = ?auto_1128335 ?auto_1128338 ) ) ( not ( = ?auto_1128335 ?auto_1128337 ) ) ( not ( = ?auto_1128335 ?auto_1128339 ) ) ( not ( = ?auto_1128335 ?auto_1128340 ) ) ( not ( = ?auto_1128335 ?auto_1128341 ) ) ( not ( = ?auto_1128335 ?auto_1128342 ) ) ( not ( = ?auto_1128335 ?auto_1128343 ) ) ( not ( = ?auto_1128335 ?auto_1128344 ) ) ( not ( = ?auto_1128335 ?auto_1128348 ) ) ( not ( = ?auto_1128336 ?auto_1128338 ) ) ( not ( = ?auto_1128336 ?auto_1128337 ) ) ( not ( = ?auto_1128336 ?auto_1128339 ) ) ( not ( = ?auto_1128336 ?auto_1128340 ) ) ( not ( = ?auto_1128336 ?auto_1128341 ) ) ( not ( = ?auto_1128336 ?auto_1128342 ) ) ( not ( = ?auto_1128336 ?auto_1128343 ) ) ( not ( = ?auto_1128336 ?auto_1128344 ) ) ( not ( = ?auto_1128336 ?auto_1128348 ) ) ( not ( = ?auto_1128338 ?auto_1128337 ) ) ( not ( = ?auto_1128338 ?auto_1128339 ) ) ( not ( = ?auto_1128338 ?auto_1128340 ) ) ( not ( = ?auto_1128338 ?auto_1128341 ) ) ( not ( = ?auto_1128338 ?auto_1128342 ) ) ( not ( = ?auto_1128338 ?auto_1128343 ) ) ( not ( = ?auto_1128338 ?auto_1128344 ) ) ( not ( = ?auto_1128338 ?auto_1128348 ) ) ( not ( = ?auto_1128337 ?auto_1128339 ) ) ( not ( = ?auto_1128337 ?auto_1128340 ) ) ( not ( = ?auto_1128337 ?auto_1128341 ) ) ( not ( = ?auto_1128337 ?auto_1128342 ) ) ( not ( = ?auto_1128337 ?auto_1128343 ) ) ( not ( = ?auto_1128337 ?auto_1128344 ) ) ( not ( = ?auto_1128337 ?auto_1128348 ) ) ( not ( = ?auto_1128339 ?auto_1128340 ) ) ( not ( = ?auto_1128339 ?auto_1128341 ) ) ( not ( = ?auto_1128339 ?auto_1128342 ) ) ( not ( = ?auto_1128339 ?auto_1128343 ) ) ( not ( = ?auto_1128339 ?auto_1128344 ) ) ( not ( = ?auto_1128339 ?auto_1128348 ) ) ( not ( = ?auto_1128340 ?auto_1128341 ) ) ( not ( = ?auto_1128340 ?auto_1128342 ) ) ( not ( = ?auto_1128340 ?auto_1128343 ) ) ( not ( = ?auto_1128340 ?auto_1128344 ) ) ( not ( = ?auto_1128340 ?auto_1128348 ) ) ( not ( = ?auto_1128341 ?auto_1128342 ) ) ( not ( = ?auto_1128341 ?auto_1128343 ) ) ( not ( = ?auto_1128341 ?auto_1128344 ) ) ( not ( = ?auto_1128341 ?auto_1128348 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1128342 ?auto_1128343 ?auto_1128344 )
      ( MAKE-10CRATE-VERIFY ?auto_1128334 ?auto_1128335 ?auto_1128336 ?auto_1128338 ?auto_1128337 ?auto_1128339 ?auto_1128340 ?auto_1128341 ?auto_1128342 ?auto_1128343 ?auto_1128344 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1128460 - SURFACE
      ?auto_1128461 - SURFACE
      ?auto_1128462 - SURFACE
      ?auto_1128464 - SURFACE
      ?auto_1128463 - SURFACE
      ?auto_1128465 - SURFACE
      ?auto_1128466 - SURFACE
      ?auto_1128467 - SURFACE
      ?auto_1128468 - SURFACE
      ?auto_1128469 - SURFACE
      ?auto_1128470 - SURFACE
    )
    :vars
    (
      ?auto_1128473 - HOIST
      ?auto_1128471 - PLACE
      ?auto_1128472 - PLACE
      ?auto_1128475 - HOIST
      ?auto_1128476 - SURFACE
      ?auto_1128474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1128473 ?auto_1128471 ) ( SURFACE-AT ?auto_1128469 ?auto_1128471 ) ( CLEAR ?auto_1128469 ) ( IS-CRATE ?auto_1128470 ) ( not ( = ?auto_1128469 ?auto_1128470 ) ) ( AVAILABLE ?auto_1128473 ) ( ON ?auto_1128469 ?auto_1128468 ) ( not ( = ?auto_1128468 ?auto_1128469 ) ) ( not ( = ?auto_1128468 ?auto_1128470 ) ) ( not ( = ?auto_1128472 ?auto_1128471 ) ) ( HOIST-AT ?auto_1128475 ?auto_1128472 ) ( not ( = ?auto_1128473 ?auto_1128475 ) ) ( AVAILABLE ?auto_1128475 ) ( SURFACE-AT ?auto_1128470 ?auto_1128472 ) ( ON ?auto_1128470 ?auto_1128476 ) ( CLEAR ?auto_1128470 ) ( not ( = ?auto_1128469 ?auto_1128476 ) ) ( not ( = ?auto_1128470 ?auto_1128476 ) ) ( not ( = ?auto_1128468 ?auto_1128476 ) ) ( TRUCK-AT ?auto_1128474 ?auto_1128471 ) ( ON ?auto_1128461 ?auto_1128460 ) ( ON ?auto_1128462 ?auto_1128461 ) ( ON ?auto_1128464 ?auto_1128462 ) ( ON ?auto_1128463 ?auto_1128464 ) ( ON ?auto_1128465 ?auto_1128463 ) ( ON ?auto_1128466 ?auto_1128465 ) ( ON ?auto_1128467 ?auto_1128466 ) ( ON ?auto_1128468 ?auto_1128467 ) ( not ( = ?auto_1128460 ?auto_1128461 ) ) ( not ( = ?auto_1128460 ?auto_1128462 ) ) ( not ( = ?auto_1128460 ?auto_1128464 ) ) ( not ( = ?auto_1128460 ?auto_1128463 ) ) ( not ( = ?auto_1128460 ?auto_1128465 ) ) ( not ( = ?auto_1128460 ?auto_1128466 ) ) ( not ( = ?auto_1128460 ?auto_1128467 ) ) ( not ( = ?auto_1128460 ?auto_1128468 ) ) ( not ( = ?auto_1128460 ?auto_1128469 ) ) ( not ( = ?auto_1128460 ?auto_1128470 ) ) ( not ( = ?auto_1128460 ?auto_1128476 ) ) ( not ( = ?auto_1128461 ?auto_1128462 ) ) ( not ( = ?auto_1128461 ?auto_1128464 ) ) ( not ( = ?auto_1128461 ?auto_1128463 ) ) ( not ( = ?auto_1128461 ?auto_1128465 ) ) ( not ( = ?auto_1128461 ?auto_1128466 ) ) ( not ( = ?auto_1128461 ?auto_1128467 ) ) ( not ( = ?auto_1128461 ?auto_1128468 ) ) ( not ( = ?auto_1128461 ?auto_1128469 ) ) ( not ( = ?auto_1128461 ?auto_1128470 ) ) ( not ( = ?auto_1128461 ?auto_1128476 ) ) ( not ( = ?auto_1128462 ?auto_1128464 ) ) ( not ( = ?auto_1128462 ?auto_1128463 ) ) ( not ( = ?auto_1128462 ?auto_1128465 ) ) ( not ( = ?auto_1128462 ?auto_1128466 ) ) ( not ( = ?auto_1128462 ?auto_1128467 ) ) ( not ( = ?auto_1128462 ?auto_1128468 ) ) ( not ( = ?auto_1128462 ?auto_1128469 ) ) ( not ( = ?auto_1128462 ?auto_1128470 ) ) ( not ( = ?auto_1128462 ?auto_1128476 ) ) ( not ( = ?auto_1128464 ?auto_1128463 ) ) ( not ( = ?auto_1128464 ?auto_1128465 ) ) ( not ( = ?auto_1128464 ?auto_1128466 ) ) ( not ( = ?auto_1128464 ?auto_1128467 ) ) ( not ( = ?auto_1128464 ?auto_1128468 ) ) ( not ( = ?auto_1128464 ?auto_1128469 ) ) ( not ( = ?auto_1128464 ?auto_1128470 ) ) ( not ( = ?auto_1128464 ?auto_1128476 ) ) ( not ( = ?auto_1128463 ?auto_1128465 ) ) ( not ( = ?auto_1128463 ?auto_1128466 ) ) ( not ( = ?auto_1128463 ?auto_1128467 ) ) ( not ( = ?auto_1128463 ?auto_1128468 ) ) ( not ( = ?auto_1128463 ?auto_1128469 ) ) ( not ( = ?auto_1128463 ?auto_1128470 ) ) ( not ( = ?auto_1128463 ?auto_1128476 ) ) ( not ( = ?auto_1128465 ?auto_1128466 ) ) ( not ( = ?auto_1128465 ?auto_1128467 ) ) ( not ( = ?auto_1128465 ?auto_1128468 ) ) ( not ( = ?auto_1128465 ?auto_1128469 ) ) ( not ( = ?auto_1128465 ?auto_1128470 ) ) ( not ( = ?auto_1128465 ?auto_1128476 ) ) ( not ( = ?auto_1128466 ?auto_1128467 ) ) ( not ( = ?auto_1128466 ?auto_1128468 ) ) ( not ( = ?auto_1128466 ?auto_1128469 ) ) ( not ( = ?auto_1128466 ?auto_1128470 ) ) ( not ( = ?auto_1128466 ?auto_1128476 ) ) ( not ( = ?auto_1128467 ?auto_1128468 ) ) ( not ( = ?auto_1128467 ?auto_1128469 ) ) ( not ( = ?auto_1128467 ?auto_1128470 ) ) ( not ( = ?auto_1128467 ?auto_1128476 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1128468 ?auto_1128469 ?auto_1128470 )
      ( MAKE-10CRATE-VERIFY ?auto_1128460 ?auto_1128461 ?auto_1128462 ?auto_1128464 ?auto_1128463 ?auto_1128465 ?auto_1128466 ?auto_1128467 ?auto_1128468 ?auto_1128469 ?auto_1128470 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1128586 - SURFACE
      ?auto_1128587 - SURFACE
      ?auto_1128588 - SURFACE
      ?auto_1128590 - SURFACE
      ?auto_1128589 - SURFACE
      ?auto_1128591 - SURFACE
      ?auto_1128592 - SURFACE
      ?auto_1128593 - SURFACE
      ?auto_1128594 - SURFACE
      ?auto_1128595 - SURFACE
      ?auto_1128596 - SURFACE
    )
    :vars
    (
      ?auto_1128602 - HOIST
      ?auto_1128599 - PLACE
      ?auto_1128598 - PLACE
      ?auto_1128601 - HOIST
      ?auto_1128597 - SURFACE
      ?auto_1128600 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1128602 ?auto_1128599 ) ( IS-CRATE ?auto_1128596 ) ( not ( = ?auto_1128595 ?auto_1128596 ) ) ( not ( = ?auto_1128594 ?auto_1128595 ) ) ( not ( = ?auto_1128594 ?auto_1128596 ) ) ( not ( = ?auto_1128598 ?auto_1128599 ) ) ( HOIST-AT ?auto_1128601 ?auto_1128598 ) ( not ( = ?auto_1128602 ?auto_1128601 ) ) ( AVAILABLE ?auto_1128601 ) ( SURFACE-AT ?auto_1128596 ?auto_1128598 ) ( ON ?auto_1128596 ?auto_1128597 ) ( CLEAR ?auto_1128596 ) ( not ( = ?auto_1128595 ?auto_1128597 ) ) ( not ( = ?auto_1128596 ?auto_1128597 ) ) ( not ( = ?auto_1128594 ?auto_1128597 ) ) ( TRUCK-AT ?auto_1128600 ?auto_1128599 ) ( SURFACE-AT ?auto_1128594 ?auto_1128599 ) ( CLEAR ?auto_1128594 ) ( LIFTING ?auto_1128602 ?auto_1128595 ) ( IS-CRATE ?auto_1128595 ) ( ON ?auto_1128587 ?auto_1128586 ) ( ON ?auto_1128588 ?auto_1128587 ) ( ON ?auto_1128590 ?auto_1128588 ) ( ON ?auto_1128589 ?auto_1128590 ) ( ON ?auto_1128591 ?auto_1128589 ) ( ON ?auto_1128592 ?auto_1128591 ) ( ON ?auto_1128593 ?auto_1128592 ) ( ON ?auto_1128594 ?auto_1128593 ) ( not ( = ?auto_1128586 ?auto_1128587 ) ) ( not ( = ?auto_1128586 ?auto_1128588 ) ) ( not ( = ?auto_1128586 ?auto_1128590 ) ) ( not ( = ?auto_1128586 ?auto_1128589 ) ) ( not ( = ?auto_1128586 ?auto_1128591 ) ) ( not ( = ?auto_1128586 ?auto_1128592 ) ) ( not ( = ?auto_1128586 ?auto_1128593 ) ) ( not ( = ?auto_1128586 ?auto_1128594 ) ) ( not ( = ?auto_1128586 ?auto_1128595 ) ) ( not ( = ?auto_1128586 ?auto_1128596 ) ) ( not ( = ?auto_1128586 ?auto_1128597 ) ) ( not ( = ?auto_1128587 ?auto_1128588 ) ) ( not ( = ?auto_1128587 ?auto_1128590 ) ) ( not ( = ?auto_1128587 ?auto_1128589 ) ) ( not ( = ?auto_1128587 ?auto_1128591 ) ) ( not ( = ?auto_1128587 ?auto_1128592 ) ) ( not ( = ?auto_1128587 ?auto_1128593 ) ) ( not ( = ?auto_1128587 ?auto_1128594 ) ) ( not ( = ?auto_1128587 ?auto_1128595 ) ) ( not ( = ?auto_1128587 ?auto_1128596 ) ) ( not ( = ?auto_1128587 ?auto_1128597 ) ) ( not ( = ?auto_1128588 ?auto_1128590 ) ) ( not ( = ?auto_1128588 ?auto_1128589 ) ) ( not ( = ?auto_1128588 ?auto_1128591 ) ) ( not ( = ?auto_1128588 ?auto_1128592 ) ) ( not ( = ?auto_1128588 ?auto_1128593 ) ) ( not ( = ?auto_1128588 ?auto_1128594 ) ) ( not ( = ?auto_1128588 ?auto_1128595 ) ) ( not ( = ?auto_1128588 ?auto_1128596 ) ) ( not ( = ?auto_1128588 ?auto_1128597 ) ) ( not ( = ?auto_1128590 ?auto_1128589 ) ) ( not ( = ?auto_1128590 ?auto_1128591 ) ) ( not ( = ?auto_1128590 ?auto_1128592 ) ) ( not ( = ?auto_1128590 ?auto_1128593 ) ) ( not ( = ?auto_1128590 ?auto_1128594 ) ) ( not ( = ?auto_1128590 ?auto_1128595 ) ) ( not ( = ?auto_1128590 ?auto_1128596 ) ) ( not ( = ?auto_1128590 ?auto_1128597 ) ) ( not ( = ?auto_1128589 ?auto_1128591 ) ) ( not ( = ?auto_1128589 ?auto_1128592 ) ) ( not ( = ?auto_1128589 ?auto_1128593 ) ) ( not ( = ?auto_1128589 ?auto_1128594 ) ) ( not ( = ?auto_1128589 ?auto_1128595 ) ) ( not ( = ?auto_1128589 ?auto_1128596 ) ) ( not ( = ?auto_1128589 ?auto_1128597 ) ) ( not ( = ?auto_1128591 ?auto_1128592 ) ) ( not ( = ?auto_1128591 ?auto_1128593 ) ) ( not ( = ?auto_1128591 ?auto_1128594 ) ) ( not ( = ?auto_1128591 ?auto_1128595 ) ) ( not ( = ?auto_1128591 ?auto_1128596 ) ) ( not ( = ?auto_1128591 ?auto_1128597 ) ) ( not ( = ?auto_1128592 ?auto_1128593 ) ) ( not ( = ?auto_1128592 ?auto_1128594 ) ) ( not ( = ?auto_1128592 ?auto_1128595 ) ) ( not ( = ?auto_1128592 ?auto_1128596 ) ) ( not ( = ?auto_1128592 ?auto_1128597 ) ) ( not ( = ?auto_1128593 ?auto_1128594 ) ) ( not ( = ?auto_1128593 ?auto_1128595 ) ) ( not ( = ?auto_1128593 ?auto_1128596 ) ) ( not ( = ?auto_1128593 ?auto_1128597 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1128594 ?auto_1128595 ?auto_1128596 )
      ( MAKE-10CRATE-VERIFY ?auto_1128586 ?auto_1128587 ?auto_1128588 ?auto_1128590 ?auto_1128589 ?auto_1128591 ?auto_1128592 ?auto_1128593 ?auto_1128594 ?auto_1128595 ?auto_1128596 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1128712 - SURFACE
      ?auto_1128713 - SURFACE
      ?auto_1128714 - SURFACE
      ?auto_1128716 - SURFACE
      ?auto_1128715 - SURFACE
      ?auto_1128717 - SURFACE
      ?auto_1128718 - SURFACE
      ?auto_1128719 - SURFACE
      ?auto_1128720 - SURFACE
      ?auto_1128721 - SURFACE
      ?auto_1128722 - SURFACE
    )
    :vars
    (
      ?auto_1128724 - HOIST
      ?auto_1128723 - PLACE
      ?auto_1128725 - PLACE
      ?auto_1128726 - HOIST
      ?auto_1128727 - SURFACE
      ?auto_1128728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1128724 ?auto_1128723 ) ( IS-CRATE ?auto_1128722 ) ( not ( = ?auto_1128721 ?auto_1128722 ) ) ( not ( = ?auto_1128720 ?auto_1128721 ) ) ( not ( = ?auto_1128720 ?auto_1128722 ) ) ( not ( = ?auto_1128725 ?auto_1128723 ) ) ( HOIST-AT ?auto_1128726 ?auto_1128725 ) ( not ( = ?auto_1128724 ?auto_1128726 ) ) ( AVAILABLE ?auto_1128726 ) ( SURFACE-AT ?auto_1128722 ?auto_1128725 ) ( ON ?auto_1128722 ?auto_1128727 ) ( CLEAR ?auto_1128722 ) ( not ( = ?auto_1128721 ?auto_1128727 ) ) ( not ( = ?auto_1128722 ?auto_1128727 ) ) ( not ( = ?auto_1128720 ?auto_1128727 ) ) ( TRUCK-AT ?auto_1128728 ?auto_1128723 ) ( SURFACE-AT ?auto_1128720 ?auto_1128723 ) ( CLEAR ?auto_1128720 ) ( IS-CRATE ?auto_1128721 ) ( AVAILABLE ?auto_1128724 ) ( IN ?auto_1128721 ?auto_1128728 ) ( ON ?auto_1128713 ?auto_1128712 ) ( ON ?auto_1128714 ?auto_1128713 ) ( ON ?auto_1128716 ?auto_1128714 ) ( ON ?auto_1128715 ?auto_1128716 ) ( ON ?auto_1128717 ?auto_1128715 ) ( ON ?auto_1128718 ?auto_1128717 ) ( ON ?auto_1128719 ?auto_1128718 ) ( ON ?auto_1128720 ?auto_1128719 ) ( not ( = ?auto_1128712 ?auto_1128713 ) ) ( not ( = ?auto_1128712 ?auto_1128714 ) ) ( not ( = ?auto_1128712 ?auto_1128716 ) ) ( not ( = ?auto_1128712 ?auto_1128715 ) ) ( not ( = ?auto_1128712 ?auto_1128717 ) ) ( not ( = ?auto_1128712 ?auto_1128718 ) ) ( not ( = ?auto_1128712 ?auto_1128719 ) ) ( not ( = ?auto_1128712 ?auto_1128720 ) ) ( not ( = ?auto_1128712 ?auto_1128721 ) ) ( not ( = ?auto_1128712 ?auto_1128722 ) ) ( not ( = ?auto_1128712 ?auto_1128727 ) ) ( not ( = ?auto_1128713 ?auto_1128714 ) ) ( not ( = ?auto_1128713 ?auto_1128716 ) ) ( not ( = ?auto_1128713 ?auto_1128715 ) ) ( not ( = ?auto_1128713 ?auto_1128717 ) ) ( not ( = ?auto_1128713 ?auto_1128718 ) ) ( not ( = ?auto_1128713 ?auto_1128719 ) ) ( not ( = ?auto_1128713 ?auto_1128720 ) ) ( not ( = ?auto_1128713 ?auto_1128721 ) ) ( not ( = ?auto_1128713 ?auto_1128722 ) ) ( not ( = ?auto_1128713 ?auto_1128727 ) ) ( not ( = ?auto_1128714 ?auto_1128716 ) ) ( not ( = ?auto_1128714 ?auto_1128715 ) ) ( not ( = ?auto_1128714 ?auto_1128717 ) ) ( not ( = ?auto_1128714 ?auto_1128718 ) ) ( not ( = ?auto_1128714 ?auto_1128719 ) ) ( not ( = ?auto_1128714 ?auto_1128720 ) ) ( not ( = ?auto_1128714 ?auto_1128721 ) ) ( not ( = ?auto_1128714 ?auto_1128722 ) ) ( not ( = ?auto_1128714 ?auto_1128727 ) ) ( not ( = ?auto_1128716 ?auto_1128715 ) ) ( not ( = ?auto_1128716 ?auto_1128717 ) ) ( not ( = ?auto_1128716 ?auto_1128718 ) ) ( not ( = ?auto_1128716 ?auto_1128719 ) ) ( not ( = ?auto_1128716 ?auto_1128720 ) ) ( not ( = ?auto_1128716 ?auto_1128721 ) ) ( not ( = ?auto_1128716 ?auto_1128722 ) ) ( not ( = ?auto_1128716 ?auto_1128727 ) ) ( not ( = ?auto_1128715 ?auto_1128717 ) ) ( not ( = ?auto_1128715 ?auto_1128718 ) ) ( not ( = ?auto_1128715 ?auto_1128719 ) ) ( not ( = ?auto_1128715 ?auto_1128720 ) ) ( not ( = ?auto_1128715 ?auto_1128721 ) ) ( not ( = ?auto_1128715 ?auto_1128722 ) ) ( not ( = ?auto_1128715 ?auto_1128727 ) ) ( not ( = ?auto_1128717 ?auto_1128718 ) ) ( not ( = ?auto_1128717 ?auto_1128719 ) ) ( not ( = ?auto_1128717 ?auto_1128720 ) ) ( not ( = ?auto_1128717 ?auto_1128721 ) ) ( not ( = ?auto_1128717 ?auto_1128722 ) ) ( not ( = ?auto_1128717 ?auto_1128727 ) ) ( not ( = ?auto_1128718 ?auto_1128719 ) ) ( not ( = ?auto_1128718 ?auto_1128720 ) ) ( not ( = ?auto_1128718 ?auto_1128721 ) ) ( not ( = ?auto_1128718 ?auto_1128722 ) ) ( not ( = ?auto_1128718 ?auto_1128727 ) ) ( not ( = ?auto_1128719 ?auto_1128720 ) ) ( not ( = ?auto_1128719 ?auto_1128721 ) ) ( not ( = ?auto_1128719 ?auto_1128722 ) ) ( not ( = ?auto_1128719 ?auto_1128727 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1128720 ?auto_1128721 ?auto_1128722 )
      ( MAKE-10CRATE-VERIFY ?auto_1128712 ?auto_1128713 ?auto_1128714 ?auto_1128716 ?auto_1128715 ?auto_1128717 ?auto_1128718 ?auto_1128719 ?auto_1128720 ?auto_1128721 ?auto_1128722 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1135936 - SURFACE
      ?auto_1135937 - SURFACE
      ?auto_1135938 - SURFACE
      ?auto_1135940 - SURFACE
      ?auto_1135939 - SURFACE
      ?auto_1135941 - SURFACE
      ?auto_1135942 - SURFACE
      ?auto_1135943 - SURFACE
      ?auto_1135944 - SURFACE
      ?auto_1135945 - SURFACE
      ?auto_1135946 - SURFACE
      ?auto_1135947 - SURFACE
    )
    :vars
    (
      ?auto_1135949 - HOIST
      ?auto_1135948 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1135949 ?auto_1135948 ) ( SURFACE-AT ?auto_1135946 ?auto_1135948 ) ( CLEAR ?auto_1135946 ) ( LIFTING ?auto_1135949 ?auto_1135947 ) ( IS-CRATE ?auto_1135947 ) ( not ( = ?auto_1135946 ?auto_1135947 ) ) ( ON ?auto_1135937 ?auto_1135936 ) ( ON ?auto_1135938 ?auto_1135937 ) ( ON ?auto_1135940 ?auto_1135938 ) ( ON ?auto_1135939 ?auto_1135940 ) ( ON ?auto_1135941 ?auto_1135939 ) ( ON ?auto_1135942 ?auto_1135941 ) ( ON ?auto_1135943 ?auto_1135942 ) ( ON ?auto_1135944 ?auto_1135943 ) ( ON ?auto_1135945 ?auto_1135944 ) ( ON ?auto_1135946 ?auto_1135945 ) ( not ( = ?auto_1135936 ?auto_1135937 ) ) ( not ( = ?auto_1135936 ?auto_1135938 ) ) ( not ( = ?auto_1135936 ?auto_1135940 ) ) ( not ( = ?auto_1135936 ?auto_1135939 ) ) ( not ( = ?auto_1135936 ?auto_1135941 ) ) ( not ( = ?auto_1135936 ?auto_1135942 ) ) ( not ( = ?auto_1135936 ?auto_1135943 ) ) ( not ( = ?auto_1135936 ?auto_1135944 ) ) ( not ( = ?auto_1135936 ?auto_1135945 ) ) ( not ( = ?auto_1135936 ?auto_1135946 ) ) ( not ( = ?auto_1135936 ?auto_1135947 ) ) ( not ( = ?auto_1135937 ?auto_1135938 ) ) ( not ( = ?auto_1135937 ?auto_1135940 ) ) ( not ( = ?auto_1135937 ?auto_1135939 ) ) ( not ( = ?auto_1135937 ?auto_1135941 ) ) ( not ( = ?auto_1135937 ?auto_1135942 ) ) ( not ( = ?auto_1135937 ?auto_1135943 ) ) ( not ( = ?auto_1135937 ?auto_1135944 ) ) ( not ( = ?auto_1135937 ?auto_1135945 ) ) ( not ( = ?auto_1135937 ?auto_1135946 ) ) ( not ( = ?auto_1135937 ?auto_1135947 ) ) ( not ( = ?auto_1135938 ?auto_1135940 ) ) ( not ( = ?auto_1135938 ?auto_1135939 ) ) ( not ( = ?auto_1135938 ?auto_1135941 ) ) ( not ( = ?auto_1135938 ?auto_1135942 ) ) ( not ( = ?auto_1135938 ?auto_1135943 ) ) ( not ( = ?auto_1135938 ?auto_1135944 ) ) ( not ( = ?auto_1135938 ?auto_1135945 ) ) ( not ( = ?auto_1135938 ?auto_1135946 ) ) ( not ( = ?auto_1135938 ?auto_1135947 ) ) ( not ( = ?auto_1135940 ?auto_1135939 ) ) ( not ( = ?auto_1135940 ?auto_1135941 ) ) ( not ( = ?auto_1135940 ?auto_1135942 ) ) ( not ( = ?auto_1135940 ?auto_1135943 ) ) ( not ( = ?auto_1135940 ?auto_1135944 ) ) ( not ( = ?auto_1135940 ?auto_1135945 ) ) ( not ( = ?auto_1135940 ?auto_1135946 ) ) ( not ( = ?auto_1135940 ?auto_1135947 ) ) ( not ( = ?auto_1135939 ?auto_1135941 ) ) ( not ( = ?auto_1135939 ?auto_1135942 ) ) ( not ( = ?auto_1135939 ?auto_1135943 ) ) ( not ( = ?auto_1135939 ?auto_1135944 ) ) ( not ( = ?auto_1135939 ?auto_1135945 ) ) ( not ( = ?auto_1135939 ?auto_1135946 ) ) ( not ( = ?auto_1135939 ?auto_1135947 ) ) ( not ( = ?auto_1135941 ?auto_1135942 ) ) ( not ( = ?auto_1135941 ?auto_1135943 ) ) ( not ( = ?auto_1135941 ?auto_1135944 ) ) ( not ( = ?auto_1135941 ?auto_1135945 ) ) ( not ( = ?auto_1135941 ?auto_1135946 ) ) ( not ( = ?auto_1135941 ?auto_1135947 ) ) ( not ( = ?auto_1135942 ?auto_1135943 ) ) ( not ( = ?auto_1135942 ?auto_1135944 ) ) ( not ( = ?auto_1135942 ?auto_1135945 ) ) ( not ( = ?auto_1135942 ?auto_1135946 ) ) ( not ( = ?auto_1135942 ?auto_1135947 ) ) ( not ( = ?auto_1135943 ?auto_1135944 ) ) ( not ( = ?auto_1135943 ?auto_1135945 ) ) ( not ( = ?auto_1135943 ?auto_1135946 ) ) ( not ( = ?auto_1135943 ?auto_1135947 ) ) ( not ( = ?auto_1135944 ?auto_1135945 ) ) ( not ( = ?auto_1135944 ?auto_1135946 ) ) ( not ( = ?auto_1135944 ?auto_1135947 ) ) ( not ( = ?auto_1135945 ?auto_1135946 ) ) ( not ( = ?auto_1135945 ?auto_1135947 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1135946 ?auto_1135947 )
      ( MAKE-11CRATE-VERIFY ?auto_1135936 ?auto_1135937 ?auto_1135938 ?auto_1135940 ?auto_1135939 ?auto_1135941 ?auto_1135942 ?auto_1135943 ?auto_1135944 ?auto_1135945 ?auto_1135946 ?auto_1135947 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1136045 - SURFACE
      ?auto_1136046 - SURFACE
      ?auto_1136047 - SURFACE
      ?auto_1136049 - SURFACE
      ?auto_1136048 - SURFACE
      ?auto_1136050 - SURFACE
      ?auto_1136051 - SURFACE
      ?auto_1136052 - SURFACE
      ?auto_1136053 - SURFACE
      ?auto_1136054 - SURFACE
      ?auto_1136055 - SURFACE
      ?auto_1136056 - SURFACE
    )
    :vars
    (
      ?auto_1136057 - HOIST
      ?auto_1136058 - PLACE
      ?auto_1136059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1136057 ?auto_1136058 ) ( SURFACE-AT ?auto_1136055 ?auto_1136058 ) ( CLEAR ?auto_1136055 ) ( IS-CRATE ?auto_1136056 ) ( not ( = ?auto_1136055 ?auto_1136056 ) ) ( TRUCK-AT ?auto_1136059 ?auto_1136058 ) ( AVAILABLE ?auto_1136057 ) ( IN ?auto_1136056 ?auto_1136059 ) ( ON ?auto_1136055 ?auto_1136054 ) ( not ( = ?auto_1136054 ?auto_1136055 ) ) ( not ( = ?auto_1136054 ?auto_1136056 ) ) ( ON ?auto_1136046 ?auto_1136045 ) ( ON ?auto_1136047 ?auto_1136046 ) ( ON ?auto_1136049 ?auto_1136047 ) ( ON ?auto_1136048 ?auto_1136049 ) ( ON ?auto_1136050 ?auto_1136048 ) ( ON ?auto_1136051 ?auto_1136050 ) ( ON ?auto_1136052 ?auto_1136051 ) ( ON ?auto_1136053 ?auto_1136052 ) ( ON ?auto_1136054 ?auto_1136053 ) ( not ( = ?auto_1136045 ?auto_1136046 ) ) ( not ( = ?auto_1136045 ?auto_1136047 ) ) ( not ( = ?auto_1136045 ?auto_1136049 ) ) ( not ( = ?auto_1136045 ?auto_1136048 ) ) ( not ( = ?auto_1136045 ?auto_1136050 ) ) ( not ( = ?auto_1136045 ?auto_1136051 ) ) ( not ( = ?auto_1136045 ?auto_1136052 ) ) ( not ( = ?auto_1136045 ?auto_1136053 ) ) ( not ( = ?auto_1136045 ?auto_1136054 ) ) ( not ( = ?auto_1136045 ?auto_1136055 ) ) ( not ( = ?auto_1136045 ?auto_1136056 ) ) ( not ( = ?auto_1136046 ?auto_1136047 ) ) ( not ( = ?auto_1136046 ?auto_1136049 ) ) ( not ( = ?auto_1136046 ?auto_1136048 ) ) ( not ( = ?auto_1136046 ?auto_1136050 ) ) ( not ( = ?auto_1136046 ?auto_1136051 ) ) ( not ( = ?auto_1136046 ?auto_1136052 ) ) ( not ( = ?auto_1136046 ?auto_1136053 ) ) ( not ( = ?auto_1136046 ?auto_1136054 ) ) ( not ( = ?auto_1136046 ?auto_1136055 ) ) ( not ( = ?auto_1136046 ?auto_1136056 ) ) ( not ( = ?auto_1136047 ?auto_1136049 ) ) ( not ( = ?auto_1136047 ?auto_1136048 ) ) ( not ( = ?auto_1136047 ?auto_1136050 ) ) ( not ( = ?auto_1136047 ?auto_1136051 ) ) ( not ( = ?auto_1136047 ?auto_1136052 ) ) ( not ( = ?auto_1136047 ?auto_1136053 ) ) ( not ( = ?auto_1136047 ?auto_1136054 ) ) ( not ( = ?auto_1136047 ?auto_1136055 ) ) ( not ( = ?auto_1136047 ?auto_1136056 ) ) ( not ( = ?auto_1136049 ?auto_1136048 ) ) ( not ( = ?auto_1136049 ?auto_1136050 ) ) ( not ( = ?auto_1136049 ?auto_1136051 ) ) ( not ( = ?auto_1136049 ?auto_1136052 ) ) ( not ( = ?auto_1136049 ?auto_1136053 ) ) ( not ( = ?auto_1136049 ?auto_1136054 ) ) ( not ( = ?auto_1136049 ?auto_1136055 ) ) ( not ( = ?auto_1136049 ?auto_1136056 ) ) ( not ( = ?auto_1136048 ?auto_1136050 ) ) ( not ( = ?auto_1136048 ?auto_1136051 ) ) ( not ( = ?auto_1136048 ?auto_1136052 ) ) ( not ( = ?auto_1136048 ?auto_1136053 ) ) ( not ( = ?auto_1136048 ?auto_1136054 ) ) ( not ( = ?auto_1136048 ?auto_1136055 ) ) ( not ( = ?auto_1136048 ?auto_1136056 ) ) ( not ( = ?auto_1136050 ?auto_1136051 ) ) ( not ( = ?auto_1136050 ?auto_1136052 ) ) ( not ( = ?auto_1136050 ?auto_1136053 ) ) ( not ( = ?auto_1136050 ?auto_1136054 ) ) ( not ( = ?auto_1136050 ?auto_1136055 ) ) ( not ( = ?auto_1136050 ?auto_1136056 ) ) ( not ( = ?auto_1136051 ?auto_1136052 ) ) ( not ( = ?auto_1136051 ?auto_1136053 ) ) ( not ( = ?auto_1136051 ?auto_1136054 ) ) ( not ( = ?auto_1136051 ?auto_1136055 ) ) ( not ( = ?auto_1136051 ?auto_1136056 ) ) ( not ( = ?auto_1136052 ?auto_1136053 ) ) ( not ( = ?auto_1136052 ?auto_1136054 ) ) ( not ( = ?auto_1136052 ?auto_1136055 ) ) ( not ( = ?auto_1136052 ?auto_1136056 ) ) ( not ( = ?auto_1136053 ?auto_1136054 ) ) ( not ( = ?auto_1136053 ?auto_1136055 ) ) ( not ( = ?auto_1136053 ?auto_1136056 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1136054 ?auto_1136055 ?auto_1136056 )
      ( MAKE-11CRATE-VERIFY ?auto_1136045 ?auto_1136046 ?auto_1136047 ?auto_1136049 ?auto_1136048 ?auto_1136050 ?auto_1136051 ?auto_1136052 ?auto_1136053 ?auto_1136054 ?auto_1136055 ?auto_1136056 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1136166 - SURFACE
      ?auto_1136167 - SURFACE
      ?auto_1136168 - SURFACE
      ?auto_1136170 - SURFACE
      ?auto_1136169 - SURFACE
      ?auto_1136171 - SURFACE
      ?auto_1136172 - SURFACE
      ?auto_1136173 - SURFACE
      ?auto_1136174 - SURFACE
      ?auto_1136175 - SURFACE
      ?auto_1136176 - SURFACE
      ?auto_1136177 - SURFACE
    )
    :vars
    (
      ?auto_1136181 - HOIST
      ?auto_1136180 - PLACE
      ?auto_1136179 - TRUCK
      ?auto_1136178 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1136181 ?auto_1136180 ) ( SURFACE-AT ?auto_1136176 ?auto_1136180 ) ( CLEAR ?auto_1136176 ) ( IS-CRATE ?auto_1136177 ) ( not ( = ?auto_1136176 ?auto_1136177 ) ) ( AVAILABLE ?auto_1136181 ) ( IN ?auto_1136177 ?auto_1136179 ) ( ON ?auto_1136176 ?auto_1136175 ) ( not ( = ?auto_1136175 ?auto_1136176 ) ) ( not ( = ?auto_1136175 ?auto_1136177 ) ) ( TRUCK-AT ?auto_1136179 ?auto_1136178 ) ( not ( = ?auto_1136178 ?auto_1136180 ) ) ( ON ?auto_1136167 ?auto_1136166 ) ( ON ?auto_1136168 ?auto_1136167 ) ( ON ?auto_1136170 ?auto_1136168 ) ( ON ?auto_1136169 ?auto_1136170 ) ( ON ?auto_1136171 ?auto_1136169 ) ( ON ?auto_1136172 ?auto_1136171 ) ( ON ?auto_1136173 ?auto_1136172 ) ( ON ?auto_1136174 ?auto_1136173 ) ( ON ?auto_1136175 ?auto_1136174 ) ( not ( = ?auto_1136166 ?auto_1136167 ) ) ( not ( = ?auto_1136166 ?auto_1136168 ) ) ( not ( = ?auto_1136166 ?auto_1136170 ) ) ( not ( = ?auto_1136166 ?auto_1136169 ) ) ( not ( = ?auto_1136166 ?auto_1136171 ) ) ( not ( = ?auto_1136166 ?auto_1136172 ) ) ( not ( = ?auto_1136166 ?auto_1136173 ) ) ( not ( = ?auto_1136166 ?auto_1136174 ) ) ( not ( = ?auto_1136166 ?auto_1136175 ) ) ( not ( = ?auto_1136166 ?auto_1136176 ) ) ( not ( = ?auto_1136166 ?auto_1136177 ) ) ( not ( = ?auto_1136167 ?auto_1136168 ) ) ( not ( = ?auto_1136167 ?auto_1136170 ) ) ( not ( = ?auto_1136167 ?auto_1136169 ) ) ( not ( = ?auto_1136167 ?auto_1136171 ) ) ( not ( = ?auto_1136167 ?auto_1136172 ) ) ( not ( = ?auto_1136167 ?auto_1136173 ) ) ( not ( = ?auto_1136167 ?auto_1136174 ) ) ( not ( = ?auto_1136167 ?auto_1136175 ) ) ( not ( = ?auto_1136167 ?auto_1136176 ) ) ( not ( = ?auto_1136167 ?auto_1136177 ) ) ( not ( = ?auto_1136168 ?auto_1136170 ) ) ( not ( = ?auto_1136168 ?auto_1136169 ) ) ( not ( = ?auto_1136168 ?auto_1136171 ) ) ( not ( = ?auto_1136168 ?auto_1136172 ) ) ( not ( = ?auto_1136168 ?auto_1136173 ) ) ( not ( = ?auto_1136168 ?auto_1136174 ) ) ( not ( = ?auto_1136168 ?auto_1136175 ) ) ( not ( = ?auto_1136168 ?auto_1136176 ) ) ( not ( = ?auto_1136168 ?auto_1136177 ) ) ( not ( = ?auto_1136170 ?auto_1136169 ) ) ( not ( = ?auto_1136170 ?auto_1136171 ) ) ( not ( = ?auto_1136170 ?auto_1136172 ) ) ( not ( = ?auto_1136170 ?auto_1136173 ) ) ( not ( = ?auto_1136170 ?auto_1136174 ) ) ( not ( = ?auto_1136170 ?auto_1136175 ) ) ( not ( = ?auto_1136170 ?auto_1136176 ) ) ( not ( = ?auto_1136170 ?auto_1136177 ) ) ( not ( = ?auto_1136169 ?auto_1136171 ) ) ( not ( = ?auto_1136169 ?auto_1136172 ) ) ( not ( = ?auto_1136169 ?auto_1136173 ) ) ( not ( = ?auto_1136169 ?auto_1136174 ) ) ( not ( = ?auto_1136169 ?auto_1136175 ) ) ( not ( = ?auto_1136169 ?auto_1136176 ) ) ( not ( = ?auto_1136169 ?auto_1136177 ) ) ( not ( = ?auto_1136171 ?auto_1136172 ) ) ( not ( = ?auto_1136171 ?auto_1136173 ) ) ( not ( = ?auto_1136171 ?auto_1136174 ) ) ( not ( = ?auto_1136171 ?auto_1136175 ) ) ( not ( = ?auto_1136171 ?auto_1136176 ) ) ( not ( = ?auto_1136171 ?auto_1136177 ) ) ( not ( = ?auto_1136172 ?auto_1136173 ) ) ( not ( = ?auto_1136172 ?auto_1136174 ) ) ( not ( = ?auto_1136172 ?auto_1136175 ) ) ( not ( = ?auto_1136172 ?auto_1136176 ) ) ( not ( = ?auto_1136172 ?auto_1136177 ) ) ( not ( = ?auto_1136173 ?auto_1136174 ) ) ( not ( = ?auto_1136173 ?auto_1136175 ) ) ( not ( = ?auto_1136173 ?auto_1136176 ) ) ( not ( = ?auto_1136173 ?auto_1136177 ) ) ( not ( = ?auto_1136174 ?auto_1136175 ) ) ( not ( = ?auto_1136174 ?auto_1136176 ) ) ( not ( = ?auto_1136174 ?auto_1136177 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1136175 ?auto_1136176 ?auto_1136177 )
      ( MAKE-11CRATE-VERIFY ?auto_1136166 ?auto_1136167 ?auto_1136168 ?auto_1136170 ?auto_1136169 ?auto_1136171 ?auto_1136172 ?auto_1136173 ?auto_1136174 ?auto_1136175 ?auto_1136176 ?auto_1136177 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1136298 - SURFACE
      ?auto_1136299 - SURFACE
      ?auto_1136300 - SURFACE
      ?auto_1136302 - SURFACE
      ?auto_1136301 - SURFACE
      ?auto_1136303 - SURFACE
      ?auto_1136304 - SURFACE
      ?auto_1136305 - SURFACE
      ?auto_1136306 - SURFACE
      ?auto_1136307 - SURFACE
      ?auto_1136308 - SURFACE
      ?auto_1136309 - SURFACE
    )
    :vars
    (
      ?auto_1136311 - HOIST
      ?auto_1136312 - PLACE
      ?auto_1136310 - TRUCK
      ?auto_1136314 - PLACE
      ?auto_1136313 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1136311 ?auto_1136312 ) ( SURFACE-AT ?auto_1136308 ?auto_1136312 ) ( CLEAR ?auto_1136308 ) ( IS-CRATE ?auto_1136309 ) ( not ( = ?auto_1136308 ?auto_1136309 ) ) ( AVAILABLE ?auto_1136311 ) ( ON ?auto_1136308 ?auto_1136307 ) ( not ( = ?auto_1136307 ?auto_1136308 ) ) ( not ( = ?auto_1136307 ?auto_1136309 ) ) ( TRUCK-AT ?auto_1136310 ?auto_1136314 ) ( not ( = ?auto_1136314 ?auto_1136312 ) ) ( HOIST-AT ?auto_1136313 ?auto_1136314 ) ( LIFTING ?auto_1136313 ?auto_1136309 ) ( not ( = ?auto_1136311 ?auto_1136313 ) ) ( ON ?auto_1136299 ?auto_1136298 ) ( ON ?auto_1136300 ?auto_1136299 ) ( ON ?auto_1136302 ?auto_1136300 ) ( ON ?auto_1136301 ?auto_1136302 ) ( ON ?auto_1136303 ?auto_1136301 ) ( ON ?auto_1136304 ?auto_1136303 ) ( ON ?auto_1136305 ?auto_1136304 ) ( ON ?auto_1136306 ?auto_1136305 ) ( ON ?auto_1136307 ?auto_1136306 ) ( not ( = ?auto_1136298 ?auto_1136299 ) ) ( not ( = ?auto_1136298 ?auto_1136300 ) ) ( not ( = ?auto_1136298 ?auto_1136302 ) ) ( not ( = ?auto_1136298 ?auto_1136301 ) ) ( not ( = ?auto_1136298 ?auto_1136303 ) ) ( not ( = ?auto_1136298 ?auto_1136304 ) ) ( not ( = ?auto_1136298 ?auto_1136305 ) ) ( not ( = ?auto_1136298 ?auto_1136306 ) ) ( not ( = ?auto_1136298 ?auto_1136307 ) ) ( not ( = ?auto_1136298 ?auto_1136308 ) ) ( not ( = ?auto_1136298 ?auto_1136309 ) ) ( not ( = ?auto_1136299 ?auto_1136300 ) ) ( not ( = ?auto_1136299 ?auto_1136302 ) ) ( not ( = ?auto_1136299 ?auto_1136301 ) ) ( not ( = ?auto_1136299 ?auto_1136303 ) ) ( not ( = ?auto_1136299 ?auto_1136304 ) ) ( not ( = ?auto_1136299 ?auto_1136305 ) ) ( not ( = ?auto_1136299 ?auto_1136306 ) ) ( not ( = ?auto_1136299 ?auto_1136307 ) ) ( not ( = ?auto_1136299 ?auto_1136308 ) ) ( not ( = ?auto_1136299 ?auto_1136309 ) ) ( not ( = ?auto_1136300 ?auto_1136302 ) ) ( not ( = ?auto_1136300 ?auto_1136301 ) ) ( not ( = ?auto_1136300 ?auto_1136303 ) ) ( not ( = ?auto_1136300 ?auto_1136304 ) ) ( not ( = ?auto_1136300 ?auto_1136305 ) ) ( not ( = ?auto_1136300 ?auto_1136306 ) ) ( not ( = ?auto_1136300 ?auto_1136307 ) ) ( not ( = ?auto_1136300 ?auto_1136308 ) ) ( not ( = ?auto_1136300 ?auto_1136309 ) ) ( not ( = ?auto_1136302 ?auto_1136301 ) ) ( not ( = ?auto_1136302 ?auto_1136303 ) ) ( not ( = ?auto_1136302 ?auto_1136304 ) ) ( not ( = ?auto_1136302 ?auto_1136305 ) ) ( not ( = ?auto_1136302 ?auto_1136306 ) ) ( not ( = ?auto_1136302 ?auto_1136307 ) ) ( not ( = ?auto_1136302 ?auto_1136308 ) ) ( not ( = ?auto_1136302 ?auto_1136309 ) ) ( not ( = ?auto_1136301 ?auto_1136303 ) ) ( not ( = ?auto_1136301 ?auto_1136304 ) ) ( not ( = ?auto_1136301 ?auto_1136305 ) ) ( not ( = ?auto_1136301 ?auto_1136306 ) ) ( not ( = ?auto_1136301 ?auto_1136307 ) ) ( not ( = ?auto_1136301 ?auto_1136308 ) ) ( not ( = ?auto_1136301 ?auto_1136309 ) ) ( not ( = ?auto_1136303 ?auto_1136304 ) ) ( not ( = ?auto_1136303 ?auto_1136305 ) ) ( not ( = ?auto_1136303 ?auto_1136306 ) ) ( not ( = ?auto_1136303 ?auto_1136307 ) ) ( not ( = ?auto_1136303 ?auto_1136308 ) ) ( not ( = ?auto_1136303 ?auto_1136309 ) ) ( not ( = ?auto_1136304 ?auto_1136305 ) ) ( not ( = ?auto_1136304 ?auto_1136306 ) ) ( not ( = ?auto_1136304 ?auto_1136307 ) ) ( not ( = ?auto_1136304 ?auto_1136308 ) ) ( not ( = ?auto_1136304 ?auto_1136309 ) ) ( not ( = ?auto_1136305 ?auto_1136306 ) ) ( not ( = ?auto_1136305 ?auto_1136307 ) ) ( not ( = ?auto_1136305 ?auto_1136308 ) ) ( not ( = ?auto_1136305 ?auto_1136309 ) ) ( not ( = ?auto_1136306 ?auto_1136307 ) ) ( not ( = ?auto_1136306 ?auto_1136308 ) ) ( not ( = ?auto_1136306 ?auto_1136309 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1136307 ?auto_1136308 ?auto_1136309 )
      ( MAKE-11CRATE-VERIFY ?auto_1136298 ?auto_1136299 ?auto_1136300 ?auto_1136302 ?auto_1136301 ?auto_1136303 ?auto_1136304 ?auto_1136305 ?auto_1136306 ?auto_1136307 ?auto_1136308 ?auto_1136309 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1136441 - SURFACE
      ?auto_1136442 - SURFACE
      ?auto_1136443 - SURFACE
      ?auto_1136445 - SURFACE
      ?auto_1136444 - SURFACE
      ?auto_1136446 - SURFACE
      ?auto_1136447 - SURFACE
      ?auto_1136448 - SURFACE
      ?auto_1136449 - SURFACE
      ?auto_1136450 - SURFACE
      ?auto_1136451 - SURFACE
      ?auto_1136452 - SURFACE
    )
    :vars
    (
      ?auto_1136455 - HOIST
      ?auto_1136457 - PLACE
      ?auto_1136456 - TRUCK
      ?auto_1136458 - PLACE
      ?auto_1136454 - HOIST
      ?auto_1136453 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1136455 ?auto_1136457 ) ( SURFACE-AT ?auto_1136451 ?auto_1136457 ) ( CLEAR ?auto_1136451 ) ( IS-CRATE ?auto_1136452 ) ( not ( = ?auto_1136451 ?auto_1136452 ) ) ( AVAILABLE ?auto_1136455 ) ( ON ?auto_1136451 ?auto_1136450 ) ( not ( = ?auto_1136450 ?auto_1136451 ) ) ( not ( = ?auto_1136450 ?auto_1136452 ) ) ( TRUCK-AT ?auto_1136456 ?auto_1136458 ) ( not ( = ?auto_1136458 ?auto_1136457 ) ) ( HOIST-AT ?auto_1136454 ?auto_1136458 ) ( not ( = ?auto_1136455 ?auto_1136454 ) ) ( AVAILABLE ?auto_1136454 ) ( SURFACE-AT ?auto_1136452 ?auto_1136458 ) ( ON ?auto_1136452 ?auto_1136453 ) ( CLEAR ?auto_1136452 ) ( not ( = ?auto_1136451 ?auto_1136453 ) ) ( not ( = ?auto_1136452 ?auto_1136453 ) ) ( not ( = ?auto_1136450 ?auto_1136453 ) ) ( ON ?auto_1136442 ?auto_1136441 ) ( ON ?auto_1136443 ?auto_1136442 ) ( ON ?auto_1136445 ?auto_1136443 ) ( ON ?auto_1136444 ?auto_1136445 ) ( ON ?auto_1136446 ?auto_1136444 ) ( ON ?auto_1136447 ?auto_1136446 ) ( ON ?auto_1136448 ?auto_1136447 ) ( ON ?auto_1136449 ?auto_1136448 ) ( ON ?auto_1136450 ?auto_1136449 ) ( not ( = ?auto_1136441 ?auto_1136442 ) ) ( not ( = ?auto_1136441 ?auto_1136443 ) ) ( not ( = ?auto_1136441 ?auto_1136445 ) ) ( not ( = ?auto_1136441 ?auto_1136444 ) ) ( not ( = ?auto_1136441 ?auto_1136446 ) ) ( not ( = ?auto_1136441 ?auto_1136447 ) ) ( not ( = ?auto_1136441 ?auto_1136448 ) ) ( not ( = ?auto_1136441 ?auto_1136449 ) ) ( not ( = ?auto_1136441 ?auto_1136450 ) ) ( not ( = ?auto_1136441 ?auto_1136451 ) ) ( not ( = ?auto_1136441 ?auto_1136452 ) ) ( not ( = ?auto_1136441 ?auto_1136453 ) ) ( not ( = ?auto_1136442 ?auto_1136443 ) ) ( not ( = ?auto_1136442 ?auto_1136445 ) ) ( not ( = ?auto_1136442 ?auto_1136444 ) ) ( not ( = ?auto_1136442 ?auto_1136446 ) ) ( not ( = ?auto_1136442 ?auto_1136447 ) ) ( not ( = ?auto_1136442 ?auto_1136448 ) ) ( not ( = ?auto_1136442 ?auto_1136449 ) ) ( not ( = ?auto_1136442 ?auto_1136450 ) ) ( not ( = ?auto_1136442 ?auto_1136451 ) ) ( not ( = ?auto_1136442 ?auto_1136452 ) ) ( not ( = ?auto_1136442 ?auto_1136453 ) ) ( not ( = ?auto_1136443 ?auto_1136445 ) ) ( not ( = ?auto_1136443 ?auto_1136444 ) ) ( not ( = ?auto_1136443 ?auto_1136446 ) ) ( not ( = ?auto_1136443 ?auto_1136447 ) ) ( not ( = ?auto_1136443 ?auto_1136448 ) ) ( not ( = ?auto_1136443 ?auto_1136449 ) ) ( not ( = ?auto_1136443 ?auto_1136450 ) ) ( not ( = ?auto_1136443 ?auto_1136451 ) ) ( not ( = ?auto_1136443 ?auto_1136452 ) ) ( not ( = ?auto_1136443 ?auto_1136453 ) ) ( not ( = ?auto_1136445 ?auto_1136444 ) ) ( not ( = ?auto_1136445 ?auto_1136446 ) ) ( not ( = ?auto_1136445 ?auto_1136447 ) ) ( not ( = ?auto_1136445 ?auto_1136448 ) ) ( not ( = ?auto_1136445 ?auto_1136449 ) ) ( not ( = ?auto_1136445 ?auto_1136450 ) ) ( not ( = ?auto_1136445 ?auto_1136451 ) ) ( not ( = ?auto_1136445 ?auto_1136452 ) ) ( not ( = ?auto_1136445 ?auto_1136453 ) ) ( not ( = ?auto_1136444 ?auto_1136446 ) ) ( not ( = ?auto_1136444 ?auto_1136447 ) ) ( not ( = ?auto_1136444 ?auto_1136448 ) ) ( not ( = ?auto_1136444 ?auto_1136449 ) ) ( not ( = ?auto_1136444 ?auto_1136450 ) ) ( not ( = ?auto_1136444 ?auto_1136451 ) ) ( not ( = ?auto_1136444 ?auto_1136452 ) ) ( not ( = ?auto_1136444 ?auto_1136453 ) ) ( not ( = ?auto_1136446 ?auto_1136447 ) ) ( not ( = ?auto_1136446 ?auto_1136448 ) ) ( not ( = ?auto_1136446 ?auto_1136449 ) ) ( not ( = ?auto_1136446 ?auto_1136450 ) ) ( not ( = ?auto_1136446 ?auto_1136451 ) ) ( not ( = ?auto_1136446 ?auto_1136452 ) ) ( not ( = ?auto_1136446 ?auto_1136453 ) ) ( not ( = ?auto_1136447 ?auto_1136448 ) ) ( not ( = ?auto_1136447 ?auto_1136449 ) ) ( not ( = ?auto_1136447 ?auto_1136450 ) ) ( not ( = ?auto_1136447 ?auto_1136451 ) ) ( not ( = ?auto_1136447 ?auto_1136452 ) ) ( not ( = ?auto_1136447 ?auto_1136453 ) ) ( not ( = ?auto_1136448 ?auto_1136449 ) ) ( not ( = ?auto_1136448 ?auto_1136450 ) ) ( not ( = ?auto_1136448 ?auto_1136451 ) ) ( not ( = ?auto_1136448 ?auto_1136452 ) ) ( not ( = ?auto_1136448 ?auto_1136453 ) ) ( not ( = ?auto_1136449 ?auto_1136450 ) ) ( not ( = ?auto_1136449 ?auto_1136451 ) ) ( not ( = ?auto_1136449 ?auto_1136452 ) ) ( not ( = ?auto_1136449 ?auto_1136453 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1136450 ?auto_1136451 ?auto_1136452 )
      ( MAKE-11CRATE-VERIFY ?auto_1136441 ?auto_1136442 ?auto_1136443 ?auto_1136445 ?auto_1136444 ?auto_1136446 ?auto_1136447 ?auto_1136448 ?auto_1136449 ?auto_1136450 ?auto_1136451 ?auto_1136452 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1136585 - SURFACE
      ?auto_1136586 - SURFACE
      ?auto_1136587 - SURFACE
      ?auto_1136589 - SURFACE
      ?auto_1136588 - SURFACE
      ?auto_1136590 - SURFACE
      ?auto_1136591 - SURFACE
      ?auto_1136592 - SURFACE
      ?auto_1136593 - SURFACE
      ?auto_1136594 - SURFACE
      ?auto_1136595 - SURFACE
      ?auto_1136596 - SURFACE
    )
    :vars
    (
      ?auto_1136602 - HOIST
      ?auto_1136598 - PLACE
      ?auto_1136601 - PLACE
      ?auto_1136597 - HOIST
      ?auto_1136599 - SURFACE
      ?auto_1136600 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1136602 ?auto_1136598 ) ( SURFACE-AT ?auto_1136595 ?auto_1136598 ) ( CLEAR ?auto_1136595 ) ( IS-CRATE ?auto_1136596 ) ( not ( = ?auto_1136595 ?auto_1136596 ) ) ( AVAILABLE ?auto_1136602 ) ( ON ?auto_1136595 ?auto_1136594 ) ( not ( = ?auto_1136594 ?auto_1136595 ) ) ( not ( = ?auto_1136594 ?auto_1136596 ) ) ( not ( = ?auto_1136601 ?auto_1136598 ) ) ( HOIST-AT ?auto_1136597 ?auto_1136601 ) ( not ( = ?auto_1136602 ?auto_1136597 ) ) ( AVAILABLE ?auto_1136597 ) ( SURFACE-AT ?auto_1136596 ?auto_1136601 ) ( ON ?auto_1136596 ?auto_1136599 ) ( CLEAR ?auto_1136596 ) ( not ( = ?auto_1136595 ?auto_1136599 ) ) ( not ( = ?auto_1136596 ?auto_1136599 ) ) ( not ( = ?auto_1136594 ?auto_1136599 ) ) ( TRUCK-AT ?auto_1136600 ?auto_1136598 ) ( ON ?auto_1136586 ?auto_1136585 ) ( ON ?auto_1136587 ?auto_1136586 ) ( ON ?auto_1136589 ?auto_1136587 ) ( ON ?auto_1136588 ?auto_1136589 ) ( ON ?auto_1136590 ?auto_1136588 ) ( ON ?auto_1136591 ?auto_1136590 ) ( ON ?auto_1136592 ?auto_1136591 ) ( ON ?auto_1136593 ?auto_1136592 ) ( ON ?auto_1136594 ?auto_1136593 ) ( not ( = ?auto_1136585 ?auto_1136586 ) ) ( not ( = ?auto_1136585 ?auto_1136587 ) ) ( not ( = ?auto_1136585 ?auto_1136589 ) ) ( not ( = ?auto_1136585 ?auto_1136588 ) ) ( not ( = ?auto_1136585 ?auto_1136590 ) ) ( not ( = ?auto_1136585 ?auto_1136591 ) ) ( not ( = ?auto_1136585 ?auto_1136592 ) ) ( not ( = ?auto_1136585 ?auto_1136593 ) ) ( not ( = ?auto_1136585 ?auto_1136594 ) ) ( not ( = ?auto_1136585 ?auto_1136595 ) ) ( not ( = ?auto_1136585 ?auto_1136596 ) ) ( not ( = ?auto_1136585 ?auto_1136599 ) ) ( not ( = ?auto_1136586 ?auto_1136587 ) ) ( not ( = ?auto_1136586 ?auto_1136589 ) ) ( not ( = ?auto_1136586 ?auto_1136588 ) ) ( not ( = ?auto_1136586 ?auto_1136590 ) ) ( not ( = ?auto_1136586 ?auto_1136591 ) ) ( not ( = ?auto_1136586 ?auto_1136592 ) ) ( not ( = ?auto_1136586 ?auto_1136593 ) ) ( not ( = ?auto_1136586 ?auto_1136594 ) ) ( not ( = ?auto_1136586 ?auto_1136595 ) ) ( not ( = ?auto_1136586 ?auto_1136596 ) ) ( not ( = ?auto_1136586 ?auto_1136599 ) ) ( not ( = ?auto_1136587 ?auto_1136589 ) ) ( not ( = ?auto_1136587 ?auto_1136588 ) ) ( not ( = ?auto_1136587 ?auto_1136590 ) ) ( not ( = ?auto_1136587 ?auto_1136591 ) ) ( not ( = ?auto_1136587 ?auto_1136592 ) ) ( not ( = ?auto_1136587 ?auto_1136593 ) ) ( not ( = ?auto_1136587 ?auto_1136594 ) ) ( not ( = ?auto_1136587 ?auto_1136595 ) ) ( not ( = ?auto_1136587 ?auto_1136596 ) ) ( not ( = ?auto_1136587 ?auto_1136599 ) ) ( not ( = ?auto_1136589 ?auto_1136588 ) ) ( not ( = ?auto_1136589 ?auto_1136590 ) ) ( not ( = ?auto_1136589 ?auto_1136591 ) ) ( not ( = ?auto_1136589 ?auto_1136592 ) ) ( not ( = ?auto_1136589 ?auto_1136593 ) ) ( not ( = ?auto_1136589 ?auto_1136594 ) ) ( not ( = ?auto_1136589 ?auto_1136595 ) ) ( not ( = ?auto_1136589 ?auto_1136596 ) ) ( not ( = ?auto_1136589 ?auto_1136599 ) ) ( not ( = ?auto_1136588 ?auto_1136590 ) ) ( not ( = ?auto_1136588 ?auto_1136591 ) ) ( not ( = ?auto_1136588 ?auto_1136592 ) ) ( not ( = ?auto_1136588 ?auto_1136593 ) ) ( not ( = ?auto_1136588 ?auto_1136594 ) ) ( not ( = ?auto_1136588 ?auto_1136595 ) ) ( not ( = ?auto_1136588 ?auto_1136596 ) ) ( not ( = ?auto_1136588 ?auto_1136599 ) ) ( not ( = ?auto_1136590 ?auto_1136591 ) ) ( not ( = ?auto_1136590 ?auto_1136592 ) ) ( not ( = ?auto_1136590 ?auto_1136593 ) ) ( not ( = ?auto_1136590 ?auto_1136594 ) ) ( not ( = ?auto_1136590 ?auto_1136595 ) ) ( not ( = ?auto_1136590 ?auto_1136596 ) ) ( not ( = ?auto_1136590 ?auto_1136599 ) ) ( not ( = ?auto_1136591 ?auto_1136592 ) ) ( not ( = ?auto_1136591 ?auto_1136593 ) ) ( not ( = ?auto_1136591 ?auto_1136594 ) ) ( not ( = ?auto_1136591 ?auto_1136595 ) ) ( not ( = ?auto_1136591 ?auto_1136596 ) ) ( not ( = ?auto_1136591 ?auto_1136599 ) ) ( not ( = ?auto_1136592 ?auto_1136593 ) ) ( not ( = ?auto_1136592 ?auto_1136594 ) ) ( not ( = ?auto_1136592 ?auto_1136595 ) ) ( not ( = ?auto_1136592 ?auto_1136596 ) ) ( not ( = ?auto_1136592 ?auto_1136599 ) ) ( not ( = ?auto_1136593 ?auto_1136594 ) ) ( not ( = ?auto_1136593 ?auto_1136595 ) ) ( not ( = ?auto_1136593 ?auto_1136596 ) ) ( not ( = ?auto_1136593 ?auto_1136599 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1136594 ?auto_1136595 ?auto_1136596 )
      ( MAKE-11CRATE-VERIFY ?auto_1136585 ?auto_1136586 ?auto_1136587 ?auto_1136589 ?auto_1136588 ?auto_1136590 ?auto_1136591 ?auto_1136592 ?auto_1136593 ?auto_1136594 ?auto_1136595 ?auto_1136596 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1136729 - SURFACE
      ?auto_1136730 - SURFACE
      ?auto_1136731 - SURFACE
      ?auto_1136733 - SURFACE
      ?auto_1136732 - SURFACE
      ?auto_1136734 - SURFACE
      ?auto_1136735 - SURFACE
      ?auto_1136736 - SURFACE
      ?auto_1136737 - SURFACE
      ?auto_1136738 - SURFACE
      ?auto_1136739 - SURFACE
      ?auto_1136740 - SURFACE
    )
    :vars
    (
      ?auto_1136744 - HOIST
      ?auto_1136743 - PLACE
      ?auto_1136745 - PLACE
      ?auto_1136741 - HOIST
      ?auto_1136746 - SURFACE
      ?auto_1136742 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1136744 ?auto_1136743 ) ( IS-CRATE ?auto_1136740 ) ( not ( = ?auto_1136739 ?auto_1136740 ) ) ( not ( = ?auto_1136738 ?auto_1136739 ) ) ( not ( = ?auto_1136738 ?auto_1136740 ) ) ( not ( = ?auto_1136745 ?auto_1136743 ) ) ( HOIST-AT ?auto_1136741 ?auto_1136745 ) ( not ( = ?auto_1136744 ?auto_1136741 ) ) ( AVAILABLE ?auto_1136741 ) ( SURFACE-AT ?auto_1136740 ?auto_1136745 ) ( ON ?auto_1136740 ?auto_1136746 ) ( CLEAR ?auto_1136740 ) ( not ( = ?auto_1136739 ?auto_1136746 ) ) ( not ( = ?auto_1136740 ?auto_1136746 ) ) ( not ( = ?auto_1136738 ?auto_1136746 ) ) ( TRUCK-AT ?auto_1136742 ?auto_1136743 ) ( SURFACE-AT ?auto_1136738 ?auto_1136743 ) ( CLEAR ?auto_1136738 ) ( LIFTING ?auto_1136744 ?auto_1136739 ) ( IS-CRATE ?auto_1136739 ) ( ON ?auto_1136730 ?auto_1136729 ) ( ON ?auto_1136731 ?auto_1136730 ) ( ON ?auto_1136733 ?auto_1136731 ) ( ON ?auto_1136732 ?auto_1136733 ) ( ON ?auto_1136734 ?auto_1136732 ) ( ON ?auto_1136735 ?auto_1136734 ) ( ON ?auto_1136736 ?auto_1136735 ) ( ON ?auto_1136737 ?auto_1136736 ) ( ON ?auto_1136738 ?auto_1136737 ) ( not ( = ?auto_1136729 ?auto_1136730 ) ) ( not ( = ?auto_1136729 ?auto_1136731 ) ) ( not ( = ?auto_1136729 ?auto_1136733 ) ) ( not ( = ?auto_1136729 ?auto_1136732 ) ) ( not ( = ?auto_1136729 ?auto_1136734 ) ) ( not ( = ?auto_1136729 ?auto_1136735 ) ) ( not ( = ?auto_1136729 ?auto_1136736 ) ) ( not ( = ?auto_1136729 ?auto_1136737 ) ) ( not ( = ?auto_1136729 ?auto_1136738 ) ) ( not ( = ?auto_1136729 ?auto_1136739 ) ) ( not ( = ?auto_1136729 ?auto_1136740 ) ) ( not ( = ?auto_1136729 ?auto_1136746 ) ) ( not ( = ?auto_1136730 ?auto_1136731 ) ) ( not ( = ?auto_1136730 ?auto_1136733 ) ) ( not ( = ?auto_1136730 ?auto_1136732 ) ) ( not ( = ?auto_1136730 ?auto_1136734 ) ) ( not ( = ?auto_1136730 ?auto_1136735 ) ) ( not ( = ?auto_1136730 ?auto_1136736 ) ) ( not ( = ?auto_1136730 ?auto_1136737 ) ) ( not ( = ?auto_1136730 ?auto_1136738 ) ) ( not ( = ?auto_1136730 ?auto_1136739 ) ) ( not ( = ?auto_1136730 ?auto_1136740 ) ) ( not ( = ?auto_1136730 ?auto_1136746 ) ) ( not ( = ?auto_1136731 ?auto_1136733 ) ) ( not ( = ?auto_1136731 ?auto_1136732 ) ) ( not ( = ?auto_1136731 ?auto_1136734 ) ) ( not ( = ?auto_1136731 ?auto_1136735 ) ) ( not ( = ?auto_1136731 ?auto_1136736 ) ) ( not ( = ?auto_1136731 ?auto_1136737 ) ) ( not ( = ?auto_1136731 ?auto_1136738 ) ) ( not ( = ?auto_1136731 ?auto_1136739 ) ) ( not ( = ?auto_1136731 ?auto_1136740 ) ) ( not ( = ?auto_1136731 ?auto_1136746 ) ) ( not ( = ?auto_1136733 ?auto_1136732 ) ) ( not ( = ?auto_1136733 ?auto_1136734 ) ) ( not ( = ?auto_1136733 ?auto_1136735 ) ) ( not ( = ?auto_1136733 ?auto_1136736 ) ) ( not ( = ?auto_1136733 ?auto_1136737 ) ) ( not ( = ?auto_1136733 ?auto_1136738 ) ) ( not ( = ?auto_1136733 ?auto_1136739 ) ) ( not ( = ?auto_1136733 ?auto_1136740 ) ) ( not ( = ?auto_1136733 ?auto_1136746 ) ) ( not ( = ?auto_1136732 ?auto_1136734 ) ) ( not ( = ?auto_1136732 ?auto_1136735 ) ) ( not ( = ?auto_1136732 ?auto_1136736 ) ) ( not ( = ?auto_1136732 ?auto_1136737 ) ) ( not ( = ?auto_1136732 ?auto_1136738 ) ) ( not ( = ?auto_1136732 ?auto_1136739 ) ) ( not ( = ?auto_1136732 ?auto_1136740 ) ) ( not ( = ?auto_1136732 ?auto_1136746 ) ) ( not ( = ?auto_1136734 ?auto_1136735 ) ) ( not ( = ?auto_1136734 ?auto_1136736 ) ) ( not ( = ?auto_1136734 ?auto_1136737 ) ) ( not ( = ?auto_1136734 ?auto_1136738 ) ) ( not ( = ?auto_1136734 ?auto_1136739 ) ) ( not ( = ?auto_1136734 ?auto_1136740 ) ) ( not ( = ?auto_1136734 ?auto_1136746 ) ) ( not ( = ?auto_1136735 ?auto_1136736 ) ) ( not ( = ?auto_1136735 ?auto_1136737 ) ) ( not ( = ?auto_1136735 ?auto_1136738 ) ) ( not ( = ?auto_1136735 ?auto_1136739 ) ) ( not ( = ?auto_1136735 ?auto_1136740 ) ) ( not ( = ?auto_1136735 ?auto_1136746 ) ) ( not ( = ?auto_1136736 ?auto_1136737 ) ) ( not ( = ?auto_1136736 ?auto_1136738 ) ) ( not ( = ?auto_1136736 ?auto_1136739 ) ) ( not ( = ?auto_1136736 ?auto_1136740 ) ) ( not ( = ?auto_1136736 ?auto_1136746 ) ) ( not ( = ?auto_1136737 ?auto_1136738 ) ) ( not ( = ?auto_1136737 ?auto_1136739 ) ) ( not ( = ?auto_1136737 ?auto_1136740 ) ) ( not ( = ?auto_1136737 ?auto_1136746 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1136738 ?auto_1136739 ?auto_1136740 )
      ( MAKE-11CRATE-VERIFY ?auto_1136729 ?auto_1136730 ?auto_1136731 ?auto_1136733 ?auto_1136732 ?auto_1136734 ?auto_1136735 ?auto_1136736 ?auto_1136737 ?auto_1136738 ?auto_1136739 ?auto_1136740 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1136873 - SURFACE
      ?auto_1136874 - SURFACE
      ?auto_1136875 - SURFACE
      ?auto_1136877 - SURFACE
      ?auto_1136876 - SURFACE
      ?auto_1136878 - SURFACE
      ?auto_1136879 - SURFACE
      ?auto_1136880 - SURFACE
      ?auto_1136881 - SURFACE
      ?auto_1136882 - SURFACE
      ?auto_1136883 - SURFACE
      ?auto_1136884 - SURFACE
    )
    :vars
    (
      ?auto_1136889 - HOIST
      ?auto_1136886 - PLACE
      ?auto_1136890 - PLACE
      ?auto_1136888 - HOIST
      ?auto_1136885 - SURFACE
      ?auto_1136887 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1136889 ?auto_1136886 ) ( IS-CRATE ?auto_1136884 ) ( not ( = ?auto_1136883 ?auto_1136884 ) ) ( not ( = ?auto_1136882 ?auto_1136883 ) ) ( not ( = ?auto_1136882 ?auto_1136884 ) ) ( not ( = ?auto_1136890 ?auto_1136886 ) ) ( HOIST-AT ?auto_1136888 ?auto_1136890 ) ( not ( = ?auto_1136889 ?auto_1136888 ) ) ( AVAILABLE ?auto_1136888 ) ( SURFACE-AT ?auto_1136884 ?auto_1136890 ) ( ON ?auto_1136884 ?auto_1136885 ) ( CLEAR ?auto_1136884 ) ( not ( = ?auto_1136883 ?auto_1136885 ) ) ( not ( = ?auto_1136884 ?auto_1136885 ) ) ( not ( = ?auto_1136882 ?auto_1136885 ) ) ( TRUCK-AT ?auto_1136887 ?auto_1136886 ) ( SURFACE-AT ?auto_1136882 ?auto_1136886 ) ( CLEAR ?auto_1136882 ) ( IS-CRATE ?auto_1136883 ) ( AVAILABLE ?auto_1136889 ) ( IN ?auto_1136883 ?auto_1136887 ) ( ON ?auto_1136874 ?auto_1136873 ) ( ON ?auto_1136875 ?auto_1136874 ) ( ON ?auto_1136877 ?auto_1136875 ) ( ON ?auto_1136876 ?auto_1136877 ) ( ON ?auto_1136878 ?auto_1136876 ) ( ON ?auto_1136879 ?auto_1136878 ) ( ON ?auto_1136880 ?auto_1136879 ) ( ON ?auto_1136881 ?auto_1136880 ) ( ON ?auto_1136882 ?auto_1136881 ) ( not ( = ?auto_1136873 ?auto_1136874 ) ) ( not ( = ?auto_1136873 ?auto_1136875 ) ) ( not ( = ?auto_1136873 ?auto_1136877 ) ) ( not ( = ?auto_1136873 ?auto_1136876 ) ) ( not ( = ?auto_1136873 ?auto_1136878 ) ) ( not ( = ?auto_1136873 ?auto_1136879 ) ) ( not ( = ?auto_1136873 ?auto_1136880 ) ) ( not ( = ?auto_1136873 ?auto_1136881 ) ) ( not ( = ?auto_1136873 ?auto_1136882 ) ) ( not ( = ?auto_1136873 ?auto_1136883 ) ) ( not ( = ?auto_1136873 ?auto_1136884 ) ) ( not ( = ?auto_1136873 ?auto_1136885 ) ) ( not ( = ?auto_1136874 ?auto_1136875 ) ) ( not ( = ?auto_1136874 ?auto_1136877 ) ) ( not ( = ?auto_1136874 ?auto_1136876 ) ) ( not ( = ?auto_1136874 ?auto_1136878 ) ) ( not ( = ?auto_1136874 ?auto_1136879 ) ) ( not ( = ?auto_1136874 ?auto_1136880 ) ) ( not ( = ?auto_1136874 ?auto_1136881 ) ) ( not ( = ?auto_1136874 ?auto_1136882 ) ) ( not ( = ?auto_1136874 ?auto_1136883 ) ) ( not ( = ?auto_1136874 ?auto_1136884 ) ) ( not ( = ?auto_1136874 ?auto_1136885 ) ) ( not ( = ?auto_1136875 ?auto_1136877 ) ) ( not ( = ?auto_1136875 ?auto_1136876 ) ) ( not ( = ?auto_1136875 ?auto_1136878 ) ) ( not ( = ?auto_1136875 ?auto_1136879 ) ) ( not ( = ?auto_1136875 ?auto_1136880 ) ) ( not ( = ?auto_1136875 ?auto_1136881 ) ) ( not ( = ?auto_1136875 ?auto_1136882 ) ) ( not ( = ?auto_1136875 ?auto_1136883 ) ) ( not ( = ?auto_1136875 ?auto_1136884 ) ) ( not ( = ?auto_1136875 ?auto_1136885 ) ) ( not ( = ?auto_1136877 ?auto_1136876 ) ) ( not ( = ?auto_1136877 ?auto_1136878 ) ) ( not ( = ?auto_1136877 ?auto_1136879 ) ) ( not ( = ?auto_1136877 ?auto_1136880 ) ) ( not ( = ?auto_1136877 ?auto_1136881 ) ) ( not ( = ?auto_1136877 ?auto_1136882 ) ) ( not ( = ?auto_1136877 ?auto_1136883 ) ) ( not ( = ?auto_1136877 ?auto_1136884 ) ) ( not ( = ?auto_1136877 ?auto_1136885 ) ) ( not ( = ?auto_1136876 ?auto_1136878 ) ) ( not ( = ?auto_1136876 ?auto_1136879 ) ) ( not ( = ?auto_1136876 ?auto_1136880 ) ) ( not ( = ?auto_1136876 ?auto_1136881 ) ) ( not ( = ?auto_1136876 ?auto_1136882 ) ) ( not ( = ?auto_1136876 ?auto_1136883 ) ) ( not ( = ?auto_1136876 ?auto_1136884 ) ) ( not ( = ?auto_1136876 ?auto_1136885 ) ) ( not ( = ?auto_1136878 ?auto_1136879 ) ) ( not ( = ?auto_1136878 ?auto_1136880 ) ) ( not ( = ?auto_1136878 ?auto_1136881 ) ) ( not ( = ?auto_1136878 ?auto_1136882 ) ) ( not ( = ?auto_1136878 ?auto_1136883 ) ) ( not ( = ?auto_1136878 ?auto_1136884 ) ) ( not ( = ?auto_1136878 ?auto_1136885 ) ) ( not ( = ?auto_1136879 ?auto_1136880 ) ) ( not ( = ?auto_1136879 ?auto_1136881 ) ) ( not ( = ?auto_1136879 ?auto_1136882 ) ) ( not ( = ?auto_1136879 ?auto_1136883 ) ) ( not ( = ?auto_1136879 ?auto_1136884 ) ) ( not ( = ?auto_1136879 ?auto_1136885 ) ) ( not ( = ?auto_1136880 ?auto_1136881 ) ) ( not ( = ?auto_1136880 ?auto_1136882 ) ) ( not ( = ?auto_1136880 ?auto_1136883 ) ) ( not ( = ?auto_1136880 ?auto_1136884 ) ) ( not ( = ?auto_1136880 ?auto_1136885 ) ) ( not ( = ?auto_1136881 ?auto_1136882 ) ) ( not ( = ?auto_1136881 ?auto_1136883 ) ) ( not ( = ?auto_1136881 ?auto_1136884 ) ) ( not ( = ?auto_1136881 ?auto_1136885 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1136882 ?auto_1136883 ?auto_1136884 )
      ( MAKE-11CRATE-VERIFY ?auto_1136873 ?auto_1136874 ?auto_1136875 ?auto_1136877 ?auto_1136876 ?auto_1136878 ?auto_1136879 ?auto_1136880 ?auto_1136881 ?auto_1136882 ?auto_1136883 ?auto_1136884 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1146145 - SURFACE
      ?auto_1146146 - SURFACE
      ?auto_1146147 - SURFACE
      ?auto_1146149 - SURFACE
      ?auto_1146148 - SURFACE
      ?auto_1146150 - SURFACE
      ?auto_1146151 - SURFACE
      ?auto_1146152 - SURFACE
      ?auto_1146153 - SURFACE
      ?auto_1146154 - SURFACE
      ?auto_1146155 - SURFACE
      ?auto_1146156 - SURFACE
      ?auto_1146157 - SURFACE
    )
    :vars
    (
      ?auto_1146159 - HOIST
      ?auto_1146158 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1146159 ?auto_1146158 ) ( SURFACE-AT ?auto_1146156 ?auto_1146158 ) ( CLEAR ?auto_1146156 ) ( LIFTING ?auto_1146159 ?auto_1146157 ) ( IS-CRATE ?auto_1146157 ) ( not ( = ?auto_1146156 ?auto_1146157 ) ) ( ON ?auto_1146146 ?auto_1146145 ) ( ON ?auto_1146147 ?auto_1146146 ) ( ON ?auto_1146149 ?auto_1146147 ) ( ON ?auto_1146148 ?auto_1146149 ) ( ON ?auto_1146150 ?auto_1146148 ) ( ON ?auto_1146151 ?auto_1146150 ) ( ON ?auto_1146152 ?auto_1146151 ) ( ON ?auto_1146153 ?auto_1146152 ) ( ON ?auto_1146154 ?auto_1146153 ) ( ON ?auto_1146155 ?auto_1146154 ) ( ON ?auto_1146156 ?auto_1146155 ) ( not ( = ?auto_1146145 ?auto_1146146 ) ) ( not ( = ?auto_1146145 ?auto_1146147 ) ) ( not ( = ?auto_1146145 ?auto_1146149 ) ) ( not ( = ?auto_1146145 ?auto_1146148 ) ) ( not ( = ?auto_1146145 ?auto_1146150 ) ) ( not ( = ?auto_1146145 ?auto_1146151 ) ) ( not ( = ?auto_1146145 ?auto_1146152 ) ) ( not ( = ?auto_1146145 ?auto_1146153 ) ) ( not ( = ?auto_1146145 ?auto_1146154 ) ) ( not ( = ?auto_1146145 ?auto_1146155 ) ) ( not ( = ?auto_1146145 ?auto_1146156 ) ) ( not ( = ?auto_1146145 ?auto_1146157 ) ) ( not ( = ?auto_1146146 ?auto_1146147 ) ) ( not ( = ?auto_1146146 ?auto_1146149 ) ) ( not ( = ?auto_1146146 ?auto_1146148 ) ) ( not ( = ?auto_1146146 ?auto_1146150 ) ) ( not ( = ?auto_1146146 ?auto_1146151 ) ) ( not ( = ?auto_1146146 ?auto_1146152 ) ) ( not ( = ?auto_1146146 ?auto_1146153 ) ) ( not ( = ?auto_1146146 ?auto_1146154 ) ) ( not ( = ?auto_1146146 ?auto_1146155 ) ) ( not ( = ?auto_1146146 ?auto_1146156 ) ) ( not ( = ?auto_1146146 ?auto_1146157 ) ) ( not ( = ?auto_1146147 ?auto_1146149 ) ) ( not ( = ?auto_1146147 ?auto_1146148 ) ) ( not ( = ?auto_1146147 ?auto_1146150 ) ) ( not ( = ?auto_1146147 ?auto_1146151 ) ) ( not ( = ?auto_1146147 ?auto_1146152 ) ) ( not ( = ?auto_1146147 ?auto_1146153 ) ) ( not ( = ?auto_1146147 ?auto_1146154 ) ) ( not ( = ?auto_1146147 ?auto_1146155 ) ) ( not ( = ?auto_1146147 ?auto_1146156 ) ) ( not ( = ?auto_1146147 ?auto_1146157 ) ) ( not ( = ?auto_1146149 ?auto_1146148 ) ) ( not ( = ?auto_1146149 ?auto_1146150 ) ) ( not ( = ?auto_1146149 ?auto_1146151 ) ) ( not ( = ?auto_1146149 ?auto_1146152 ) ) ( not ( = ?auto_1146149 ?auto_1146153 ) ) ( not ( = ?auto_1146149 ?auto_1146154 ) ) ( not ( = ?auto_1146149 ?auto_1146155 ) ) ( not ( = ?auto_1146149 ?auto_1146156 ) ) ( not ( = ?auto_1146149 ?auto_1146157 ) ) ( not ( = ?auto_1146148 ?auto_1146150 ) ) ( not ( = ?auto_1146148 ?auto_1146151 ) ) ( not ( = ?auto_1146148 ?auto_1146152 ) ) ( not ( = ?auto_1146148 ?auto_1146153 ) ) ( not ( = ?auto_1146148 ?auto_1146154 ) ) ( not ( = ?auto_1146148 ?auto_1146155 ) ) ( not ( = ?auto_1146148 ?auto_1146156 ) ) ( not ( = ?auto_1146148 ?auto_1146157 ) ) ( not ( = ?auto_1146150 ?auto_1146151 ) ) ( not ( = ?auto_1146150 ?auto_1146152 ) ) ( not ( = ?auto_1146150 ?auto_1146153 ) ) ( not ( = ?auto_1146150 ?auto_1146154 ) ) ( not ( = ?auto_1146150 ?auto_1146155 ) ) ( not ( = ?auto_1146150 ?auto_1146156 ) ) ( not ( = ?auto_1146150 ?auto_1146157 ) ) ( not ( = ?auto_1146151 ?auto_1146152 ) ) ( not ( = ?auto_1146151 ?auto_1146153 ) ) ( not ( = ?auto_1146151 ?auto_1146154 ) ) ( not ( = ?auto_1146151 ?auto_1146155 ) ) ( not ( = ?auto_1146151 ?auto_1146156 ) ) ( not ( = ?auto_1146151 ?auto_1146157 ) ) ( not ( = ?auto_1146152 ?auto_1146153 ) ) ( not ( = ?auto_1146152 ?auto_1146154 ) ) ( not ( = ?auto_1146152 ?auto_1146155 ) ) ( not ( = ?auto_1146152 ?auto_1146156 ) ) ( not ( = ?auto_1146152 ?auto_1146157 ) ) ( not ( = ?auto_1146153 ?auto_1146154 ) ) ( not ( = ?auto_1146153 ?auto_1146155 ) ) ( not ( = ?auto_1146153 ?auto_1146156 ) ) ( not ( = ?auto_1146153 ?auto_1146157 ) ) ( not ( = ?auto_1146154 ?auto_1146155 ) ) ( not ( = ?auto_1146154 ?auto_1146156 ) ) ( not ( = ?auto_1146154 ?auto_1146157 ) ) ( not ( = ?auto_1146155 ?auto_1146156 ) ) ( not ( = ?auto_1146155 ?auto_1146157 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1146156 ?auto_1146157 )
      ( MAKE-12CRATE-VERIFY ?auto_1146145 ?auto_1146146 ?auto_1146147 ?auto_1146149 ?auto_1146148 ?auto_1146150 ?auto_1146151 ?auto_1146152 ?auto_1146153 ?auto_1146154 ?auto_1146155 ?auto_1146156 ?auto_1146157 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1146270 - SURFACE
      ?auto_1146271 - SURFACE
      ?auto_1146272 - SURFACE
      ?auto_1146274 - SURFACE
      ?auto_1146273 - SURFACE
      ?auto_1146275 - SURFACE
      ?auto_1146276 - SURFACE
      ?auto_1146277 - SURFACE
      ?auto_1146278 - SURFACE
      ?auto_1146279 - SURFACE
      ?auto_1146280 - SURFACE
      ?auto_1146281 - SURFACE
      ?auto_1146282 - SURFACE
    )
    :vars
    (
      ?auto_1146285 - HOIST
      ?auto_1146283 - PLACE
      ?auto_1146284 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1146285 ?auto_1146283 ) ( SURFACE-AT ?auto_1146281 ?auto_1146283 ) ( CLEAR ?auto_1146281 ) ( IS-CRATE ?auto_1146282 ) ( not ( = ?auto_1146281 ?auto_1146282 ) ) ( TRUCK-AT ?auto_1146284 ?auto_1146283 ) ( AVAILABLE ?auto_1146285 ) ( IN ?auto_1146282 ?auto_1146284 ) ( ON ?auto_1146281 ?auto_1146280 ) ( not ( = ?auto_1146280 ?auto_1146281 ) ) ( not ( = ?auto_1146280 ?auto_1146282 ) ) ( ON ?auto_1146271 ?auto_1146270 ) ( ON ?auto_1146272 ?auto_1146271 ) ( ON ?auto_1146274 ?auto_1146272 ) ( ON ?auto_1146273 ?auto_1146274 ) ( ON ?auto_1146275 ?auto_1146273 ) ( ON ?auto_1146276 ?auto_1146275 ) ( ON ?auto_1146277 ?auto_1146276 ) ( ON ?auto_1146278 ?auto_1146277 ) ( ON ?auto_1146279 ?auto_1146278 ) ( ON ?auto_1146280 ?auto_1146279 ) ( not ( = ?auto_1146270 ?auto_1146271 ) ) ( not ( = ?auto_1146270 ?auto_1146272 ) ) ( not ( = ?auto_1146270 ?auto_1146274 ) ) ( not ( = ?auto_1146270 ?auto_1146273 ) ) ( not ( = ?auto_1146270 ?auto_1146275 ) ) ( not ( = ?auto_1146270 ?auto_1146276 ) ) ( not ( = ?auto_1146270 ?auto_1146277 ) ) ( not ( = ?auto_1146270 ?auto_1146278 ) ) ( not ( = ?auto_1146270 ?auto_1146279 ) ) ( not ( = ?auto_1146270 ?auto_1146280 ) ) ( not ( = ?auto_1146270 ?auto_1146281 ) ) ( not ( = ?auto_1146270 ?auto_1146282 ) ) ( not ( = ?auto_1146271 ?auto_1146272 ) ) ( not ( = ?auto_1146271 ?auto_1146274 ) ) ( not ( = ?auto_1146271 ?auto_1146273 ) ) ( not ( = ?auto_1146271 ?auto_1146275 ) ) ( not ( = ?auto_1146271 ?auto_1146276 ) ) ( not ( = ?auto_1146271 ?auto_1146277 ) ) ( not ( = ?auto_1146271 ?auto_1146278 ) ) ( not ( = ?auto_1146271 ?auto_1146279 ) ) ( not ( = ?auto_1146271 ?auto_1146280 ) ) ( not ( = ?auto_1146271 ?auto_1146281 ) ) ( not ( = ?auto_1146271 ?auto_1146282 ) ) ( not ( = ?auto_1146272 ?auto_1146274 ) ) ( not ( = ?auto_1146272 ?auto_1146273 ) ) ( not ( = ?auto_1146272 ?auto_1146275 ) ) ( not ( = ?auto_1146272 ?auto_1146276 ) ) ( not ( = ?auto_1146272 ?auto_1146277 ) ) ( not ( = ?auto_1146272 ?auto_1146278 ) ) ( not ( = ?auto_1146272 ?auto_1146279 ) ) ( not ( = ?auto_1146272 ?auto_1146280 ) ) ( not ( = ?auto_1146272 ?auto_1146281 ) ) ( not ( = ?auto_1146272 ?auto_1146282 ) ) ( not ( = ?auto_1146274 ?auto_1146273 ) ) ( not ( = ?auto_1146274 ?auto_1146275 ) ) ( not ( = ?auto_1146274 ?auto_1146276 ) ) ( not ( = ?auto_1146274 ?auto_1146277 ) ) ( not ( = ?auto_1146274 ?auto_1146278 ) ) ( not ( = ?auto_1146274 ?auto_1146279 ) ) ( not ( = ?auto_1146274 ?auto_1146280 ) ) ( not ( = ?auto_1146274 ?auto_1146281 ) ) ( not ( = ?auto_1146274 ?auto_1146282 ) ) ( not ( = ?auto_1146273 ?auto_1146275 ) ) ( not ( = ?auto_1146273 ?auto_1146276 ) ) ( not ( = ?auto_1146273 ?auto_1146277 ) ) ( not ( = ?auto_1146273 ?auto_1146278 ) ) ( not ( = ?auto_1146273 ?auto_1146279 ) ) ( not ( = ?auto_1146273 ?auto_1146280 ) ) ( not ( = ?auto_1146273 ?auto_1146281 ) ) ( not ( = ?auto_1146273 ?auto_1146282 ) ) ( not ( = ?auto_1146275 ?auto_1146276 ) ) ( not ( = ?auto_1146275 ?auto_1146277 ) ) ( not ( = ?auto_1146275 ?auto_1146278 ) ) ( not ( = ?auto_1146275 ?auto_1146279 ) ) ( not ( = ?auto_1146275 ?auto_1146280 ) ) ( not ( = ?auto_1146275 ?auto_1146281 ) ) ( not ( = ?auto_1146275 ?auto_1146282 ) ) ( not ( = ?auto_1146276 ?auto_1146277 ) ) ( not ( = ?auto_1146276 ?auto_1146278 ) ) ( not ( = ?auto_1146276 ?auto_1146279 ) ) ( not ( = ?auto_1146276 ?auto_1146280 ) ) ( not ( = ?auto_1146276 ?auto_1146281 ) ) ( not ( = ?auto_1146276 ?auto_1146282 ) ) ( not ( = ?auto_1146277 ?auto_1146278 ) ) ( not ( = ?auto_1146277 ?auto_1146279 ) ) ( not ( = ?auto_1146277 ?auto_1146280 ) ) ( not ( = ?auto_1146277 ?auto_1146281 ) ) ( not ( = ?auto_1146277 ?auto_1146282 ) ) ( not ( = ?auto_1146278 ?auto_1146279 ) ) ( not ( = ?auto_1146278 ?auto_1146280 ) ) ( not ( = ?auto_1146278 ?auto_1146281 ) ) ( not ( = ?auto_1146278 ?auto_1146282 ) ) ( not ( = ?auto_1146279 ?auto_1146280 ) ) ( not ( = ?auto_1146279 ?auto_1146281 ) ) ( not ( = ?auto_1146279 ?auto_1146282 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1146280 ?auto_1146281 ?auto_1146282 )
      ( MAKE-12CRATE-VERIFY ?auto_1146270 ?auto_1146271 ?auto_1146272 ?auto_1146274 ?auto_1146273 ?auto_1146275 ?auto_1146276 ?auto_1146277 ?auto_1146278 ?auto_1146279 ?auto_1146280 ?auto_1146281 ?auto_1146282 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1146408 - SURFACE
      ?auto_1146409 - SURFACE
      ?auto_1146410 - SURFACE
      ?auto_1146412 - SURFACE
      ?auto_1146411 - SURFACE
      ?auto_1146413 - SURFACE
      ?auto_1146414 - SURFACE
      ?auto_1146415 - SURFACE
      ?auto_1146416 - SURFACE
      ?auto_1146417 - SURFACE
      ?auto_1146418 - SURFACE
      ?auto_1146419 - SURFACE
      ?auto_1146420 - SURFACE
    )
    :vars
    (
      ?auto_1146422 - HOIST
      ?auto_1146421 - PLACE
      ?auto_1146423 - TRUCK
      ?auto_1146424 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1146422 ?auto_1146421 ) ( SURFACE-AT ?auto_1146419 ?auto_1146421 ) ( CLEAR ?auto_1146419 ) ( IS-CRATE ?auto_1146420 ) ( not ( = ?auto_1146419 ?auto_1146420 ) ) ( AVAILABLE ?auto_1146422 ) ( IN ?auto_1146420 ?auto_1146423 ) ( ON ?auto_1146419 ?auto_1146418 ) ( not ( = ?auto_1146418 ?auto_1146419 ) ) ( not ( = ?auto_1146418 ?auto_1146420 ) ) ( TRUCK-AT ?auto_1146423 ?auto_1146424 ) ( not ( = ?auto_1146424 ?auto_1146421 ) ) ( ON ?auto_1146409 ?auto_1146408 ) ( ON ?auto_1146410 ?auto_1146409 ) ( ON ?auto_1146412 ?auto_1146410 ) ( ON ?auto_1146411 ?auto_1146412 ) ( ON ?auto_1146413 ?auto_1146411 ) ( ON ?auto_1146414 ?auto_1146413 ) ( ON ?auto_1146415 ?auto_1146414 ) ( ON ?auto_1146416 ?auto_1146415 ) ( ON ?auto_1146417 ?auto_1146416 ) ( ON ?auto_1146418 ?auto_1146417 ) ( not ( = ?auto_1146408 ?auto_1146409 ) ) ( not ( = ?auto_1146408 ?auto_1146410 ) ) ( not ( = ?auto_1146408 ?auto_1146412 ) ) ( not ( = ?auto_1146408 ?auto_1146411 ) ) ( not ( = ?auto_1146408 ?auto_1146413 ) ) ( not ( = ?auto_1146408 ?auto_1146414 ) ) ( not ( = ?auto_1146408 ?auto_1146415 ) ) ( not ( = ?auto_1146408 ?auto_1146416 ) ) ( not ( = ?auto_1146408 ?auto_1146417 ) ) ( not ( = ?auto_1146408 ?auto_1146418 ) ) ( not ( = ?auto_1146408 ?auto_1146419 ) ) ( not ( = ?auto_1146408 ?auto_1146420 ) ) ( not ( = ?auto_1146409 ?auto_1146410 ) ) ( not ( = ?auto_1146409 ?auto_1146412 ) ) ( not ( = ?auto_1146409 ?auto_1146411 ) ) ( not ( = ?auto_1146409 ?auto_1146413 ) ) ( not ( = ?auto_1146409 ?auto_1146414 ) ) ( not ( = ?auto_1146409 ?auto_1146415 ) ) ( not ( = ?auto_1146409 ?auto_1146416 ) ) ( not ( = ?auto_1146409 ?auto_1146417 ) ) ( not ( = ?auto_1146409 ?auto_1146418 ) ) ( not ( = ?auto_1146409 ?auto_1146419 ) ) ( not ( = ?auto_1146409 ?auto_1146420 ) ) ( not ( = ?auto_1146410 ?auto_1146412 ) ) ( not ( = ?auto_1146410 ?auto_1146411 ) ) ( not ( = ?auto_1146410 ?auto_1146413 ) ) ( not ( = ?auto_1146410 ?auto_1146414 ) ) ( not ( = ?auto_1146410 ?auto_1146415 ) ) ( not ( = ?auto_1146410 ?auto_1146416 ) ) ( not ( = ?auto_1146410 ?auto_1146417 ) ) ( not ( = ?auto_1146410 ?auto_1146418 ) ) ( not ( = ?auto_1146410 ?auto_1146419 ) ) ( not ( = ?auto_1146410 ?auto_1146420 ) ) ( not ( = ?auto_1146412 ?auto_1146411 ) ) ( not ( = ?auto_1146412 ?auto_1146413 ) ) ( not ( = ?auto_1146412 ?auto_1146414 ) ) ( not ( = ?auto_1146412 ?auto_1146415 ) ) ( not ( = ?auto_1146412 ?auto_1146416 ) ) ( not ( = ?auto_1146412 ?auto_1146417 ) ) ( not ( = ?auto_1146412 ?auto_1146418 ) ) ( not ( = ?auto_1146412 ?auto_1146419 ) ) ( not ( = ?auto_1146412 ?auto_1146420 ) ) ( not ( = ?auto_1146411 ?auto_1146413 ) ) ( not ( = ?auto_1146411 ?auto_1146414 ) ) ( not ( = ?auto_1146411 ?auto_1146415 ) ) ( not ( = ?auto_1146411 ?auto_1146416 ) ) ( not ( = ?auto_1146411 ?auto_1146417 ) ) ( not ( = ?auto_1146411 ?auto_1146418 ) ) ( not ( = ?auto_1146411 ?auto_1146419 ) ) ( not ( = ?auto_1146411 ?auto_1146420 ) ) ( not ( = ?auto_1146413 ?auto_1146414 ) ) ( not ( = ?auto_1146413 ?auto_1146415 ) ) ( not ( = ?auto_1146413 ?auto_1146416 ) ) ( not ( = ?auto_1146413 ?auto_1146417 ) ) ( not ( = ?auto_1146413 ?auto_1146418 ) ) ( not ( = ?auto_1146413 ?auto_1146419 ) ) ( not ( = ?auto_1146413 ?auto_1146420 ) ) ( not ( = ?auto_1146414 ?auto_1146415 ) ) ( not ( = ?auto_1146414 ?auto_1146416 ) ) ( not ( = ?auto_1146414 ?auto_1146417 ) ) ( not ( = ?auto_1146414 ?auto_1146418 ) ) ( not ( = ?auto_1146414 ?auto_1146419 ) ) ( not ( = ?auto_1146414 ?auto_1146420 ) ) ( not ( = ?auto_1146415 ?auto_1146416 ) ) ( not ( = ?auto_1146415 ?auto_1146417 ) ) ( not ( = ?auto_1146415 ?auto_1146418 ) ) ( not ( = ?auto_1146415 ?auto_1146419 ) ) ( not ( = ?auto_1146415 ?auto_1146420 ) ) ( not ( = ?auto_1146416 ?auto_1146417 ) ) ( not ( = ?auto_1146416 ?auto_1146418 ) ) ( not ( = ?auto_1146416 ?auto_1146419 ) ) ( not ( = ?auto_1146416 ?auto_1146420 ) ) ( not ( = ?auto_1146417 ?auto_1146418 ) ) ( not ( = ?auto_1146417 ?auto_1146419 ) ) ( not ( = ?auto_1146417 ?auto_1146420 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1146418 ?auto_1146419 ?auto_1146420 )
      ( MAKE-12CRATE-VERIFY ?auto_1146408 ?auto_1146409 ?auto_1146410 ?auto_1146412 ?auto_1146411 ?auto_1146413 ?auto_1146414 ?auto_1146415 ?auto_1146416 ?auto_1146417 ?auto_1146418 ?auto_1146419 ?auto_1146420 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1146558 - SURFACE
      ?auto_1146559 - SURFACE
      ?auto_1146560 - SURFACE
      ?auto_1146562 - SURFACE
      ?auto_1146561 - SURFACE
      ?auto_1146563 - SURFACE
      ?auto_1146564 - SURFACE
      ?auto_1146565 - SURFACE
      ?auto_1146566 - SURFACE
      ?auto_1146567 - SURFACE
      ?auto_1146568 - SURFACE
      ?auto_1146569 - SURFACE
      ?auto_1146570 - SURFACE
    )
    :vars
    (
      ?auto_1146574 - HOIST
      ?auto_1146575 - PLACE
      ?auto_1146571 - TRUCK
      ?auto_1146572 - PLACE
      ?auto_1146573 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1146574 ?auto_1146575 ) ( SURFACE-AT ?auto_1146569 ?auto_1146575 ) ( CLEAR ?auto_1146569 ) ( IS-CRATE ?auto_1146570 ) ( not ( = ?auto_1146569 ?auto_1146570 ) ) ( AVAILABLE ?auto_1146574 ) ( ON ?auto_1146569 ?auto_1146568 ) ( not ( = ?auto_1146568 ?auto_1146569 ) ) ( not ( = ?auto_1146568 ?auto_1146570 ) ) ( TRUCK-AT ?auto_1146571 ?auto_1146572 ) ( not ( = ?auto_1146572 ?auto_1146575 ) ) ( HOIST-AT ?auto_1146573 ?auto_1146572 ) ( LIFTING ?auto_1146573 ?auto_1146570 ) ( not ( = ?auto_1146574 ?auto_1146573 ) ) ( ON ?auto_1146559 ?auto_1146558 ) ( ON ?auto_1146560 ?auto_1146559 ) ( ON ?auto_1146562 ?auto_1146560 ) ( ON ?auto_1146561 ?auto_1146562 ) ( ON ?auto_1146563 ?auto_1146561 ) ( ON ?auto_1146564 ?auto_1146563 ) ( ON ?auto_1146565 ?auto_1146564 ) ( ON ?auto_1146566 ?auto_1146565 ) ( ON ?auto_1146567 ?auto_1146566 ) ( ON ?auto_1146568 ?auto_1146567 ) ( not ( = ?auto_1146558 ?auto_1146559 ) ) ( not ( = ?auto_1146558 ?auto_1146560 ) ) ( not ( = ?auto_1146558 ?auto_1146562 ) ) ( not ( = ?auto_1146558 ?auto_1146561 ) ) ( not ( = ?auto_1146558 ?auto_1146563 ) ) ( not ( = ?auto_1146558 ?auto_1146564 ) ) ( not ( = ?auto_1146558 ?auto_1146565 ) ) ( not ( = ?auto_1146558 ?auto_1146566 ) ) ( not ( = ?auto_1146558 ?auto_1146567 ) ) ( not ( = ?auto_1146558 ?auto_1146568 ) ) ( not ( = ?auto_1146558 ?auto_1146569 ) ) ( not ( = ?auto_1146558 ?auto_1146570 ) ) ( not ( = ?auto_1146559 ?auto_1146560 ) ) ( not ( = ?auto_1146559 ?auto_1146562 ) ) ( not ( = ?auto_1146559 ?auto_1146561 ) ) ( not ( = ?auto_1146559 ?auto_1146563 ) ) ( not ( = ?auto_1146559 ?auto_1146564 ) ) ( not ( = ?auto_1146559 ?auto_1146565 ) ) ( not ( = ?auto_1146559 ?auto_1146566 ) ) ( not ( = ?auto_1146559 ?auto_1146567 ) ) ( not ( = ?auto_1146559 ?auto_1146568 ) ) ( not ( = ?auto_1146559 ?auto_1146569 ) ) ( not ( = ?auto_1146559 ?auto_1146570 ) ) ( not ( = ?auto_1146560 ?auto_1146562 ) ) ( not ( = ?auto_1146560 ?auto_1146561 ) ) ( not ( = ?auto_1146560 ?auto_1146563 ) ) ( not ( = ?auto_1146560 ?auto_1146564 ) ) ( not ( = ?auto_1146560 ?auto_1146565 ) ) ( not ( = ?auto_1146560 ?auto_1146566 ) ) ( not ( = ?auto_1146560 ?auto_1146567 ) ) ( not ( = ?auto_1146560 ?auto_1146568 ) ) ( not ( = ?auto_1146560 ?auto_1146569 ) ) ( not ( = ?auto_1146560 ?auto_1146570 ) ) ( not ( = ?auto_1146562 ?auto_1146561 ) ) ( not ( = ?auto_1146562 ?auto_1146563 ) ) ( not ( = ?auto_1146562 ?auto_1146564 ) ) ( not ( = ?auto_1146562 ?auto_1146565 ) ) ( not ( = ?auto_1146562 ?auto_1146566 ) ) ( not ( = ?auto_1146562 ?auto_1146567 ) ) ( not ( = ?auto_1146562 ?auto_1146568 ) ) ( not ( = ?auto_1146562 ?auto_1146569 ) ) ( not ( = ?auto_1146562 ?auto_1146570 ) ) ( not ( = ?auto_1146561 ?auto_1146563 ) ) ( not ( = ?auto_1146561 ?auto_1146564 ) ) ( not ( = ?auto_1146561 ?auto_1146565 ) ) ( not ( = ?auto_1146561 ?auto_1146566 ) ) ( not ( = ?auto_1146561 ?auto_1146567 ) ) ( not ( = ?auto_1146561 ?auto_1146568 ) ) ( not ( = ?auto_1146561 ?auto_1146569 ) ) ( not ( = ?auto_1146561 ?auto_1146570 ) ) ( not ( = ?auto_1146563 ?auto_1146564 ) ) ( not ( = ?auto_1146563 ?auto_1146565 ) ) ( not ( = ?auto_1146563 ?auto_1146566 ) ) ( not ( = ?auto_1146563 ?auto_1146567 ) ) ( not ( = ?auto_1146563 ?auto_1146568 ) ) ( not ( = ?auto_1146563 ?auto_1146569 ) ) ( not ( = ?auto_1146563 ?auto_1146570 ) ) ( not ( = ?auto_1146564 ?auto_1146565 ) ) ( not ( = ?auto_1146564 ?auto_1146566 ) ) ( not ( = ?auto_1146564 ?auto_1146567 ) ) ( not ( = ?auto_1146564 ?auto_1146568 ) ) ( not ( = ?auto_1146564 ?auto_1146569 ) ) ( not ( = ?auto_1146564 ?auto_1146570 ) ) ( not ( = ?auto_1146565 ?auto_1146566 ) ) ( not ( = ?auto_1146565 ?auto_1146567 ) ) ( not ( = ?auto_1146565 ?auto_1146568 ) ) ( not ( = ?auto_1146565 ?auto_1146569 ) ) ( not ( = ?auto_1146565 ?auto_1146570 ) ) ( not ( = ?auto_1146566 ?auto_1146567 ) ) ( not ( = ?auto_1146566 ?auto_1146568 ) ) ( not ( = ?auto_1146566 ?auto_1146569 ) ) ( not ( = ?auto_1146566 ?auto_1146570 ) ) ( not ( = ?auto_1146567 ?auto_1146568 ) ) ( not ( = ?auto_1146567 ?auto_1146569 ) ) ( not ( = ?auto_1146567 ?auto_1146570 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1146568 ?auto_1146569 ?auto_1146570 )
      ( MAKE-12CRATE-VERIFY ?auto_1146558 ?auto_1146559 ?auto_1146560 ?auto_1146562 ?auto_1146561 ?auto_1146563 ?auto_1146564 ?auto_1146565 ?auto_1146566 ?auto_1146567 ?auto_1146568 ?auto_1146569 ?auto_1146570 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1146720 - SURFACE
      ?auto_1146721 - SURFACE
      ?auto_1146722 - SURFACE
      ?auto_1146724 - SURFACE
      ?auto_1146723 - SURFACE
      ?auto_1146725 - SURFACE
      ?auto_1146726 - SURFACE
      ?auto_1146727 - SURFACE
      ?auto_1146728 - SURFACE
      ?auto_1146729 - SURFACE
      ?auto_1146730 - SURFACE
      ?auto_1146731 - SURFACE
      ?auto_1146732 - SURFACE
    )
    :vars
    (
      ?auto_1146733 - HOIST
      ?auto_1146736 - PLACE
      ?auto_1146738 - TRUCK
      ?auto_1146737 - PLACE
      ?auto_1146735 - HOIST
      ?auto_1146734 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1146733 ?auto_1146736 ) ( SURFACE-AT ?auto_1146731 ?auto_1146736 ) ( CLEAR ?auto_1146731 ) ( IS-CRATE ?auto_1146732 ) ( not ( = ?auto_1146731 ?auto_1146732 ) ) ( AVAILABLE ?auto_1146733 ) ( ON ?auto_1146731 ?auto_1146730 ) ( not ( = ?auto_1146730 ?auto_1146731 ) ) ( not ( = ?auto_1146730 ?auto_1146732 ) ) ( TRUCK-AT ?auto_1146738 ?auto_1146737 ) ( not ( = ?auto_1146737 ?auto_1146736 ) ) ( HOIST-AT ?auto_1146735 ?auto_1146737 ) ( not ( = ?auto_1146733 ?auto_1146735 ) ) ( AVAILABLE ?auto_1146735 ) ( SURFACE-AT ?auto_1146732 ?auto_1146737 ) ( ON ?auto_1146732 ?auto_1146734 ) ( CLEAR ?auto_1146732 ) ( not ( = ?auto_1146731 ?auto_1146734 ) ) ( not ( = ?auto_1146732 ?auto_1146734 ) ) ( not ( = ?auto_1146730 ?auto_1146734 ) ) ( ON ?auto_1146721 ?auto_1146720 ) ( ON ?auto_1146722 ?auto_1146721 ) ( ON ?auto_1146724 ?auto_1146722 ) ( ON ?auto_1146723 ?auto_1146724 ) ( ON ?auto_1146725 ?auto_1146723 ) ( ON ?auto_1146726 ?auto_1146725 ) ( ON ?auto_1146727 ?auto_1146726 ) ( ON ?auto_1146728 ?auto_1146727 ) ( ON ?auto_1146729 ?auto_1146728 ) ( ON ?auto_1146730 ?auto_1146729 ) ( not ( = ?auto_1146720 ?auto_1146721 ) ) ( not ( = ?auto_1146720 ?auto_1146722 ) ) ( not ( = ?auto_1146720 ?auto_1146724 ) ) ( not ( = ?auto_1146720 ?auto_1146723 ) ) ( not ( = ?auto_1146720 ?auto_1146725 ) ) ( not ( = ?auto_1146720 ?auto_1146726 ) ) ( not ( = ?auto_1146720 ?auto_1146727 ) ) ( not ( = ?auto_1146720 ?auto_1146728 ) ) ( not ( = ?auto_1146720 ?auto_1146729 ) ) ( not ( = ?auto_1146720 ?auto_1146730 ) ) ( not ( = ?auto_1146720 ?auto_1146731 ) ) ( not ( = ?auto_1146720 ?auto_1146732 ) ) ( not ( = ?auto_1146720 ?auto_1146734 ) ) ( not ( = ?auto_1146721 ?auto_1146722 ) ) ( not ( = ?auto_1146721 ?auto_1146724 ) ) ( not ( = ?auto_1146721 ?auto_1146723 ) ) ( not ( = ?auto_1146721 ?auto_1146725 ) ) ( not ( = ?auto_1146721 ?auto_1146726 ) ) ( not ( = ?auto_1146721 ?auto_1146727 ) ) ( not ( = ?auto_1146721 ?auto_1146728 ) ) ( not ( = ?auto_1146721 ?auto_1146729 ) ) ( not ( = ?auto_1146721 ?auto_1146730 ) ) ( not ( = ?auto_1146721 ?auto_1146731 ) ) ( not ( = ?auto_1146721 ?auto_1146732 ) ) ( not ( = ?auto_1146721 ?auto_1146734 ) ) ( not ( = ?auto_1146722 ?auto_1146724 ) ) ( not ( = ?auto_1146722 ?auto_1146723 ) ) ( not ( = ?auto_1146722 ?auto_1146725 ) ) ( not ( = ?auto_1146722 ?auto_1146726 ) ) ( not ( = ?auto_1146722 ?auto_1146727 ) ) ( not ( = ?auto_1146722 ?auto_1146728 ) ) ( not ( = ?auto_1146722 ?auto_1146729 ) ) ( not ( = ?auto_1146722 ?auto_1146730 ) ) ( not ( = ?auto_1146722 ?auto_1146731 ) ) ( not ( = ?auto_1146722 ?auto_1146732 ) ) ( not ( = ?auto_1146722 ?auto_1146734 ) ) ( not ( = ?auto_1146724 ?auto_1146723 ) ) ( not ( = ?auto_1146724 ?auto_1146725 ) ) ( not ( = ?auto_1146724 ?auto_1146726 ) ) ( not ( = ?auto_1146724 ?auto_1146727 ) ) ( not ( = ?auto_1146724 ?auto_1146728 ) ) ( not ( = ?auto_1146724 ?auto_1146729 ) ) ( not ( = ?auto_1146724 ?auto_1146730 ) ) ( not ( = ?auto_1146724 ?auto_1146731 ) ) ( not ( = ?auto_1146724 ?auto_1146732 ) ) ( not ( = ?auto_1146724 ?auto_1146734 ) ) ( not ( = ?auto_1146723 ?auto_1146725 ) ) ( not ( = ?auto_1146723 ?auto_1146726 ) ) ( not ( = ?auto_1146723 ?auto_1146727 ) ) ( not ( = ?auto_1146723 ?auto_1146728 ) ) ( not ( = ?auto_1146723 ?auto_1146729 ) ) ( not ( = ?auto_1146723 ?auto_1146730 ) ) ( not ( = ?auto_1146723 ?auto_1146731 ) ) ( not ( = ?auto_1146723 ?auto_1146732 ) ) ( not ( = ?auto_1146723 ?auto_1146734 ) ) ( not ( = ?auto_1146725 ?auto_1146726 ) ) ( not ( = ?auto_1146725 ?auto_1146727 ) ) ( not ( = ?auto_1146725 ?auto_1146728 ) ) ( not ( = ?auto_1146725 ?auto_1146729 ) ) ( not ( = ?auto_1146725 ?auto_1146730 ) ) ( not ( = ?auto_1146725 ?auto_1146731 ) ) ( not ( = ?auto_1146725 ?auto_1146732 ) ) ( not ( = ?auto_1146725 ?auto_1146734 ) ) ( not ( = ?auto_1146726 ?auto_1146727 ) ) ( not ( = ?auto_1146726 ?auto_1146728 ) ) ( not ( = ?auto_1146726 ?auto_1146729 ) ) ( not ( = ?auto_1146726 ?auto_1146730 ) ) ( not ( = ?auto_1146726 ?auto_1146731 ) ) ( not ( = ?auto_1146726 ?auto_1146732 ) ) ( not ( = ?auto_1146726 ?auto_1146734 ) ) ( not ( = ?auto_1146727 ?auto_1146728 ) ) ( not ( = ?auto_1146727 ?auto_1146729 ) ) ( not ( = ?auto_1146727 ?auto_1146730 ) ) ( not ( = ?auto_1146727 ?auto_1146731 ) ) ( not ( = ?auto_1146727 ?auto_1146732 ) ) ( not ( = ?auto_1146727 ?auto_1146734 ) ) ( not ( = ?auto_1146728 ?auto_1146729 ) ) ( not ( = ?auto_1146728 ?auto_1146730 ) ) ( not ( = ?auto_1146728 ?auto_1146731 ) ) ( not ( = ?auto_1146728 ?auto_1146732 ) ) ( not ( = ?auto_1146728 ?auto_1146734 ) ) ( not ( = ?auto_1146729 ?auto_1146730 ) ) ( not ( = ?auto_1146729 ?auto_1146731 ) ) ( not ( = ?auto_1146729 ?auto_1146732 ) ) ( not ( = ?auto_1146729 ?auto_1146734 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1146730 ?auto_1146731 ?auto_1146732 )
      ( MAKE-12CRATE-VERIFY ?auto_1146720 ?auto_1146721 ?auto_1146722 ?auto_1146724 ?auto_1146723 ?auto_1146725 ?auto_1146726 ?auto_1146727 ?auto_1146728 ?auto_1146729 ?auto_1146730 ?auto_1146731 ?auto_1146732 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1146883 - SURFACE
      ?auto_1146884 - SURFACE
      ?auto_1146885 - SURFACE
      ?auto_1146887 - SURFACE
      ?auto_1146886 - SURFACE
      ?auto_1146888 - SURFACE
      ?auto_1146889 - SURFACE
      ?auto_1146890 - SURFACE
      ?auto_1146891 - SURFACE
      ?auto_1146892 - SURFACE
      ?auto_1146893 - SURFACE
      ?auto_1146894 - SURFACE
      ?auto_1146895 - SURFACE
    )
    :vars
    (
      ?auto_1146896 - HOIST
      ?auto_1146901 - PLACE
      ?auto_1146900 - PLACE
      ?auto_1146897 - HOIST
      ?auto_1146899 - SURFACE
      ?auto_1146898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1146896 ?auto_1146901 ) ( SURFACE-AT ?auto_1146894 ?auto_1146901 ) ( CLEAR ?auto_1146894 ) ( IS-CRATE ?auto_1146895 ) ( not ( = ?auto_1146894 ?auto_1146895 ) ) ( AVAILABLE ?auto_1146896 ) ( ON ?auto_1146894 ?auto_1146893 ) ( not ( = ?auto_1146893 ?auto_1146894 ) ) ( not ( = ?auto_1146893 ?auto_1146895 ) ) ( not ( = ?auto_1146900 ?auto_1146901 ) ) ( HOIST-AT ?auto_1146897 ?auto_1146900 ) ( not ( = ?auto_1146896 ?auto_1146897 ) ) ( AVAILABLE ?auto_1146897 ) ( SURFACE-AT ?auto_1146895 ?auto_1146900 ) ( ON ?auto_1146895 ?auto_1146899 ) ( CLEAR ?auto_1146895 ) ( not ( = ?auto_1146894 ?auto_1146899 ) ) ( not ( = ?auto_1146895 ?auto_1146899 ) ) ( not ( = ?auto_1146893 ?auto_1146899 ) ) ( TRUCK-AT ?auto_1146898 ?auto_1146901 ) ( ON ?auto_1146884 ?auto_1146883 ) ( ON ?auto_1146885 ?auto_1146884 ) ( ON ?auto_1146887 ?auto_1146885 ) ( ON ?auto_1146886 ?auto_1146887 ) ( ON ?auto_1146888 ?auto_1146886 ) ( ON ?auto_1146889 ?auto_1146888 ) ( ON ?auto_1146890 ?auto_1146889 ) ( ON ?auto_1146891 ?auto_1146890 ) ( ON ?auto_1146892 ?auto_1146891 ) ( ON ?auto_1146893 ?auto_1146892 ) ( not ( = ?auto_1146883 ?auto_1146884 ) ) ( not ( = ?auto_1146883 ?auto_1146885 ) ) ( not ( = ?auto_1146883 ?auto_1146887 ) ) ( not ( = ?auto_1146883 ?auto_1146886 ) ) ( not ( = ?auto_1146883 ?auto_1146888 ) ) ( not ( = ?auto_1146883 ?auto_1146889 ) ) ( not ( = ?auto_1146883 ?auto_1146890 ) ) ( not ( = ?auto_1146883 ?auto_1146891 ) ) ( not ( = ?auto_1146883 ?auto_1146892 ) ) ( not ( = ?auto_1146883 ?auto_1146893 ) ) ( not ( = ?auto_1146883 ?auto_1146894 ) ) ( not ( = ?auto_1146883 ?auto_1146895 ) ) ( not ( = ?auto_1146883 ?auto_1146899 ) ) ( not ( = ?auto_1146884 ?auto_1146885 ) ) ( not ( = ?auto_1146884 ?auto_1146887 ) ) ( not ( = ?auto_1146884 ?auto_1146886 ) ) ( not ( = ?auto_1146884 ?auto_1146888 ) ) ( not ( = ?auto_1146884 ?auto_1146889 ) ) ( not ( = ?auto_1146884 ?auto_1146890 ) ) ( not ( = ?auto_1146884 ?auto_1146891 ) ) ( not ( = ?auto_1146884 ?auto_1146892 ) ) ( not ( = ?auto_1146884 ?auto_1146893 ) ) ( not ( = ?auto_1146884 ?auto_1146894 ) ) ( not ( = ?auto_1146884 ?auto_1146895 ) ) ( not ( = ?auto_1146884 ?auto_1146899 ) ) ( not ( = ?auto_1146885 ?auto_1146887 ) ) ( not ( = ?auto_1146885 ?auto_1146886 ) ) ( not ( = ?auto_1146885 ?auto_1146888 ) ) ( not ( = ?auto_1146885 ?auto_1146889 ) ) ( not ( = ?auto_1146885 ?auto_1146890 ) ) ( not ( = ?auto_1146885 ?auto_1146891 ) ) ( not ( = ?auto_1146885 ?auto_1146892 ) ) ( not ( = ?auto_1146885 ?auto_1146893 ) ) ( not ( = ?auto_1146885 ?auto_1146894 ) ) ( not ( = ?auto_1146885 ?auto_1146895 ) ) ( not ( = ?auto_1146885 ?auto_1146899 ) ) ( not ( = ?auto_1146887 ?auto_1146886 ) ) ( not ( = ?auto_1146887 ?auto_1146888 ) ) ( not ( = ?auto_1146887 ?auto_1146889 ) ) ( not ( = ?auto_1146887 ?auto_1146890 ) ) ( not ( = ?auto_1146887 ?auto_1146891 ) ) ( not ( = ?auto_1146887 ?auto_1146892 ) ) ( not ( = ?auto_1146887 ?auto_1146893 ) ) ( not ( = ?auto_1146887 ?auto_1146894 ) ) ( not ( = ?auto_1146887 ?auto_1146895 ) ) ( not ( = ?auto_1146887 ?auto_1146899 ) ) ( not ( = ?auto_1146886 ?auto_1146888 ) ) ( not ( = ?auto_1146886 ?auto_1146889 ) ) ( not ( = ?auto_1146886 ?auto_1146890 ) ) ( not ( = ?auto_1146886 ?auto_1146891 ) ) ( not ( = ?auto_1146886 ?auto_1146892 ) ) ( not ( = ?auto_1146886 ?auto_1146893 ) ) ( not ( = ?auto_1146886 ?auto_1146894 ) ) ( not ( = ?auto_1146886 ?auto_1146895 ) ) ( not ( = ?auto_1146886 ?auto_1146899 ) ) ( not ( = ?auto_1146888 ?auto_1146889 ) ) ( not ( = ?auto_1146888 ?auto_1146890 ) ) ( not ( = ?auto_1146888 ?auto_1146891 ) ) ( not ( = ?auto_1146888 ?auto_1146892 ) ) ( not ( = ?auto_1146888 ?auto_1146893 ) ) ( not ( = ?auto_1146888 ?auto_1146894 ) ) ( not ( = ?auto_1146888 ?auto_1146895 ) ) ( not ( = ?auto_1146888 ?auto_1146899 ) ) ( not ( = ?auto_1146889 ?auto_1146890 ) ) ( not ( = ?auto_1146889 ?auto_1146891 ) ) ( not ( = ?auto_1146889 ?auto_1146892 ) ) ( not ( = ?auto_1146889 ?auto_1146893 ) ) ( not ( = ?auto_1146889 ?auto_1146894 ) ) ( not ( = ?auto_1146889 ?auto_1146895 ) ) ( not ( = ?auto_1146889 ?auto_1146899 ) ) ( not ( = ?auto_1146890 ?auto_1146891 ) ) ( not ( = ?auto_1146890 ?auto_1146892 ) ) ( not ( = ?auto_1146890 ?auto_1146893 ) ) ( not ( = ?auto_1146890 ?auto_1146894 ) ) ( not ( = ?auto_1146890 ?auto_1146895 ) ) ( not ( = ?auto_1146890 ?auto_1146899 ) ) ( not ( = ?auto_1146891 ?auto_1146892 ) ) ( not ( = ?auto_1146891 ?auto_1146893 ) ) ( not ( = ?auto_1146891 ?auto_1146894 ) ) ( not ( = ?auto_1146891 ?auto_1146895 ) ) ( not ( = ?auto_1146891 ?auto_1146899 ) ) ( not ( = ?auto_1146892 ?auto_1146893 ) ) ( not ( = ?auto_1146892 ?auto_1146894 ) ) ( not ( = ?auto_1146892 ?auto_1146895 ) ) ( not ( = ?auto_1146892 ?auto_1146899 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1146893 ?auto_1146894 ?auto_1146895 )
      ( MAKE-12CRATE-VERIFY ?auto_1146883 ?auto_1146884 ?auto_1146885 ?auto_1146887 ?auto_1146886 ?auto_1146888 ?auto_1146889 ?auto_1146890 ?auto_1146891 ?auto_1146892 ?auto_1146893 ?auto_1146894 ?auto_1146895 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1147046 - SURFACE
      ?auto_1147047 - SURFACE
      ?auto_1147048 - SURFACE
      ?auto_1147050 - SURFACE
      ?auto_1147049 - SURFACE
      ?auto_1147051 - SURFACE
      ?auto_1147052 - SURFACE
      ?auto_1147053 - SURFACE
      ?auto_1147054 - SURFACE
      ?auto_1147055 - SURFACE
      ?auto_1147056 - SURFACE
      ?auto_1147057 - SURFACE
      ?auto_1147058 - SURFACE
    )
    :vars
    (
      ?auto_1147064 - HOIST
      ?auto_1147062 - PLACE
      ?auto_1147061 - PLACE
      ?auto_1147060 - HOIST
      ?auto_1147063 - SURFACE
      ?auto_1147059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1147064 ?auto_1147062 ) ( IS-CRATE ?auto_1147058 ) ( not ( = ?auto_1147057 ?auto_1147058 ) ) ( not ( = ?auto_1147056 ?auto_1147057 ) ) ( not ( = ?auto_1147056 ?auto_1147058 ) ) ( not ( = ?auto_1147061 ?auto_1147062 ) ) ( HOIST-AT ?auto_1147060 ?auto_1147061 ) ( not ( = ?auto_1147064 ?auto_1147060 ) ) ( AVAILABLE ?auto_1147060 ) ( SURFACE-AT ?auto_1147058 ?auto_1147061 ) ( ON ?auto_1147058 ?auto_1147063 ) ( CLEAR ?auto_1147058 ) ( not ( = ?auto_1147057 ?auto_1147063 ) ) ( not ( = ?auto_1147058 ?auto_1147063 ) ) ( not ( = ?auto_1147056 ?auto_1147063 ) ) ( TRUCK-AT ?auto_1147059 ?auto_1147062 ) ( SURFACE-AT ?auto_1147056 ?auto_1147062 ) ( CLEAR ?auto_1147056 ) ( LIFTING ?auto_1147064 ?auto_1147057 ) ( IS-CRATE ?auto_1147057 ) ( ON ?auto_1147047 ?auto_1147046 ) ( ON ?auto_1147048 ?auto_1147047 ) ( ON ?auto_1147050 ?auto_1147048 ) ( ON ?auto_1147049 ?auto_1147050 ) ( ON ?auto_1147051 ?auto_1147049 ) ( ON ?auto_1147052 ?auto_1147051 ) ( ON ?auto_1147053 ?auto_1147052 ) ( ON ?auto_1147054 ?auto_1147053 ) ( ON ?auto_1147055 ?auto_1147054 ) ( ON ?auto_1147056 ?auto_1147055 ) ( not ( = ?auto_1147046 ?auto_1147047 ) ) ( not ( = ?auto_1147046 ?auto_1147048 ) ) ( not ( = ?auto_1147046 ?auto_1147050 ) ) ( not ( = ?auto_1147046 ?auto_1147049 ) ) ( not ( = ?auto_1147046 ?auto_1147051 ) ) ( not ( = ?auto_1147046 ?auto_1147052 ) ) ( not ( = ?auto_1147046 ?auto_1147053 ) ) ( not ( = ?auto_1147046 ?auto_1147054 ) ) ( not ( = ?auto_1147046 ?auto_1147055 ) ) ( not ( = ?auto_1147046 ?auto_1147056 ) ) ( not ( = ?auto_1147046 ?auto_1147057 ) ) ( not ( = ?auto_1147046 ?auto_1147058 ) ) ( not ( = ?auto_1147046 ?auto_1147063 ) ) ( not ( = ?auto_1147047 ?auto_1147048 ) ) ( not ( = ?auto_1147047 ?auto_1147050 ) ) ( not ( = ?auto_1147047 ?auto_1147049 ) ) ( not ( = ?auto_1147047 ?auto_1147051 ) ) ( not ( = ?auto_1147047 ?auto_1147052 ) ) ( not ( = ?auto_1147047 ?auto_1147053 ) ) ( not ( = ?auto_1147047 ?auto_1147054 ) ) ( not ( = ?auto_1147047 ?auto_1147055 ) ) ( not ( = ?auto_1147047 ?auto_1147056 ) ) ( not ( = ?auto_1147047 ?auto_1147057 ) ) ( not ( = ?auto_1147047 ?auto_1147058 ) ) ( not ( = ?auto_1147047 ?auto_1147063 ) ) ( not ( = ?auto_1147048 ?auto_1147050 ) ) ( not ( = ?auto_1147048 ?auto_1147049 ) ) ( not ( = ?auto_1147048 ?auto_1147051 ) ) ( not ( = ?auto_1147048 ?auto_1147052 ) ) ( not ( = ?auto_1147048 ?auto_1147053 ) ) ( not ( = ?auto_1147048 ?auto_1147054 ) ) ( not ( = ?auto_1147048 ?auto_1147055 ) ) ( not ( = ?auto_1147048 ?auto_1147056 ) ) ( not ( = ?auto_1147048 ?auto_1147057 ) ) ( not ( = ?auto_1147048 ?auto_1147058 ) ) ( not ( = ?auto_1147048 ?auto_1147063 ) ) ( not ( = ?auto_1147050 ?auto_1147049 ) ) ( not ( = ?auto_1147050 ?auto_1147051 ) ) ( not ( = ?auto_1147050 ?auto_1147052 ) ) ( not ( = ?auto_1147050 ?auto_1147053 ) ) ( not ( = ?auto_1147050 ?auto_1147054 ) ) ( not ( = ?auto_1147050 ?auto_1147055 ) ) ( not ( = ?auto_1147050 ?auto_1147056 ) ) ( not ( = ?auto_1147050 ?auto_1147057 ) ) ( not ( = ?auto_1147050 ?auto_1147058 ) ) ( not ( = ?auto_1147050 ?auto_1147063 ) ) ( not ( = ?auto_1147049 ?auto_1147051 ) ) ( not ( = ?auto_1147049 ?auto_1147052 ) ) ( not ( = ?auto_1147049 ?auto_1147053 ) ) ( not ( = ?auto_1147049 ?auto_1147054 ) ) ( not ( = ?auto_1147049 ?auto_1147055 ) ) ( not ( = ?auto_1147049 ?auto_1147056 ) ) ( not ( = ?auto_1147049 ?auto_1147057 ) ) ( not ( = ?auto_1147049 ?auto_1147058 ) ) ( not ( = ?auto_1147049 ?auto_1147063 ) ) ( not ( = ?auto_1147051 ?auto_1147052 ) ) ( not ( = ?auto_1147051 ?auto_1147053 ) ) ( not ( = ?auto_1147051 ?auto_1147054 ) ) ( not ( = ?auto_1147051 ?auto_1147055 ) ) ( not ( = ?auto_1147051 ?auto_1147056 ) ) ( not ( = ?auto_1147051 ?auto_1147057 ) ) ( not ( = ?auto_1147051 ?auto_1147058 ) ) ( not ( = ?auto_1147051 ?auto_1147063 ) ) ( not ( = ?auto_1147052 ?auto_1147053 ) ) ( not ( = ?auto_1147052 ?auto_1147054 ) ) ( not ( = ?auto_1147052 ?auto_1147055 ) ) ( not ( = ?auto_1147052 ?auto_1147056 ) ) ( not ( = ?auto_1147052 ?auto_1147057 ) ) ( not ( = ?auto_1147052 ?auto_1147058 ) ) ( not ( = ?auto_1147052 ?auto_1147063 ) ) ( not ( = ?auto_1147053 ?auto_1147054 ) ) ( not ( = ?auto_1147053 ?auto_1147055 ) ) ( not ( = ?auto_1147053 ?auto_1147056 ) ) ( not ( = ?auto_1147053 ?auto_1147057 ) ) ( not ( = ?auto_1147053 ?auto_1147058 ) ) ( not ( = ?auto_1147053 ?auto_1147063 ) ) ( not ( = ?auto_1147054 ?auto_1147055 ) ) ( not ( = ?auto_1147054 ?auto_1147056 ) ) ( not ( = ?auto_1147054 ?auto_1147057 ) ) ( not ( = ?auto_1147054 ?auto_1147058 ) ) ( not ( = ?auto_1147054 ?auto_1147063 ) ) ( not ( = ?auto_1147055 ?auto_1147056 ) ) ( not ( = ?auto_1147055 ?auto_1147057 ) ) ( not ( = ?auto_1147055 ?auto_1147058 ) ) ( not ( = ?auto_1147055 ?auto_1147063 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1147056 ?auto_1147057 ?auto_1147058 )
      ( MAKE-12CRATE-VERIFY ?auto_1147046 ?auto_1147047 ?auto_1147048 ?auto_1147050 ?auto_1147049 ?auto_1147051 ?auto_1147052 ?auto_1147053 ?auto_1147054 ?auto_1147055 ?auto_1147056 ?auto_1147057 ?auto_1147058 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1147209 - SURFACE
      ?auto_1147210 - SURFACE
      ?auto_1147211 - SURFACE
      ?auto_1147213 - SURFACE
      ?auto_1147212 - SURFACE
      ?auto_1147214 - SURFACE
      ?auto_1147215 - SURFACE
      ?auto_1147216 - SURFACE
      ?auto_1147217 - SURFACE
      ?auto_1147218 - SURFACE
      ?auto_1147219 - SURFACE
      ?auto_1147220 - SURFACE
      ?auto_1147221 - SURFACE
    )
    :vars
    (
      ?auto_1147225 - HOIST
      ?auto_1147222 - PLACE
      ?auto_1147227 - PLACE
      ?auto_1147226 - HOIST
      ?auto_1147223 - SURFACE
      ?auto_1147224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1147225 ?auto_1147222 ) ( IS-CRATE ?auto_1147221 ) ( not ( = ?auto_1147220 ?auto_1147221 ) ) ( not ( = ?auto_1147219 ?auto_1147220 ) ) ( not ( = ?auto_1147219 ?auto_1147221 ) ) ( not ( = ?auto_1147227 ?auto_1147222 ) ) ( HOIST-AT ?auto_1147226 ?auto_1147227 ) ( not ( = ?auto_1147225 ?auto_1147226 ) ) ( AVAILABLE ?auto_1147226 ) ( SURFACE-AT ?auto_1147221 ?auto_1147227 ) ( ON ?auto_1147221 ?auto_1147223 ) ( CLEAR ?auto_1147221 ) ( not ( = ?auto_1147220 ?auto_1147223 ) ) ( not ( = ?auto_1147221 ?auto_1147223 ) ) ( not ( = ?auto_1147219 ?auto_1147223 ) ) ( TRUCK-AT ?auto_1147224 ?auto_1147222 ) ( SURFACE-AT ?auto_1147219 ?auto_1147222 ) ( CLEAR ?auto_1147219 ) ( IS-CRATE ?auto_1147220 ) ( AVAILABLE ?auto_1147225 ) ( IN ?auto_1147220 ?auto_1147224 ) ( ON ?auto_1147210 ?auto_1147209 ) ( ON ?auto_1147211 ?auto_1147210 ) ( ON ?auto_1147213 ?auto_1147211 ) ( ON ?auto_1147212 ?auto_1147213 ) ( ON ?auto_1147214 ?auto_1147212 ) ( ON ?auto_1147215 ?auto_1147214 ) ( ON ?auto_1147216 ?auto_1147215 ) ( ON ?auto_1147217 ?auto_1147216 ) ( ON ?auto_1147218 ?auto_1147217 ) ( ON ?auto_1147219 ?auto_1147218 ) ( not ( = ?auto_1147209 ?auto_1147210 ) ) ( not ( = ?auto_1147209 ?auto_1147211 ) ) ( not ( = ?auto_1147209 ?auto_1147213 ) ) ( not ( = ?auto_1147209 ?auto_1147212 ) ) ( not ( = ?auto_1147209 ?auto_1147214 ) ) ( not ( = ?auto_1147209 ?auto_1147215 ) ) ( not ( = ?auto_1147209 ?auto_1147216 ) ) ( not ( = ?auto_1147209 ?auto_1147217 ) ) ( not ( = ?auto_1147209 ?auto_1147218 ) ) ( not ( = ?auto_1147209 ?auto_1147219 ) ) ( not ( = ?auto_1147209 ?auto_1147220 ) ) ( not ( = ?auto_1147209 ?auto_1147221 ) ) ( not ( = ?auto_1147209 ?auto_1147223 ) ) ( not ( = ?auto_1147210 ?auto_1147211 ) ) ( not ( = ?auto_1147210 ?auto_1147213 ) ) ( not ( = ?auto_1147210 ?auto_1147212 ) ) ( not ( = ?auto_1147210 ?auto_1147214 ) ) ( not ( = ?auto_1147210 ?auto_1147215 ) ) ( not ( = ?auto_1147210 ?auto_1147216 ) ) ( not ( = ?auto_1147210 ?auto_1147217 ) ) ( not ( = ?auto_1147210 ?auto_1147218 ) ) ( not ( = ?auto_1147210 ?auto_1147219 ) ) ( not ( = ?auto_1147210 ?auto_1147220 ) ) ( not ( = ?auto_1147210 ?auto_1147221 ) ) ( not ( = ?auto_1147210 ?auto_1147223 ) ) ( not ( = ?auto_1147211 ?auto_1147213 ) ) ( not ( = ?auto_1147211 ?auto_1147212 ) ) ( not ( = ?auto_1147211 ?auto_1147214 ) ) ( not ( = ?auto_1147211 ?auto_1147215 ) ) ( not ( = ?auto_1147211 ?auto_1147216 ) ) ( not ( = ?auto_1147211 ?auto_1147217 ) ) ( not ( = ?auto_1147211 ?auto_1147218 ) ) ( not ( = ?auto_1147211 ?auto_1147219 ) ) ( not ( = ?auto_1147211 ?auto_1147220 ) ) ( not ( = ?auto_1147211 ?auto_1147221 ) ) ( not ( = ?auto_1147211 ?auto_1147223 ) ) ( not ( = ?auto_1147213 ?auto_1147212 ) ) ( not ( = ?auto_1147213 ?auto_1147214 ) ) ( not ( = ?auto_1147213 ?auto_1147215 ) ) ( not ( = ?auto_1147213 ?auto_1147216 ) ) ( not ( = ?auto_1147213 ?auto_1147217 ) ) ( not ( = ?auto_1147213 ?auto_1147218 ) ) ( not ( = ?auto_1147213 ?auto_1147219 ) ) ( not ( = ?auto_1147213 ?auto_1147220 ) ) ( not ( = ?auto_1147213 ?auto_1147221 ) ) ( not ( = ?auto_1147213 ?auto_1147223 ) ) ( not ( = ?auto_1147212 ?auto_1147214 ) ) ( not ( = ?auto_1147212 ?auto_1147215 ) ) ( not ( = ?auto_1147212 ?auto_1147216 ) ) ( not ( = ?auto_1147212 ?auto_1147217 ) ) ( not ( = ?auto_1147212 ?auto_1147218 ) ) ( not ( = ?auto_1147212 ?auto_1147219 ) ) ( not ( = ?auto_1147212 ?auto_1147220 ) ) ( not ( = ?auto_1147212 ?auto_1147221 ) ) ( not ( = ?auto_1147212 ?auto_1147223 ) ) ( not ( = ?auto_1147214 ?auto_1147215 ) ) ( not ( = ?auto_1147214 ?auto_1147216 ) ) ( not ( = ?auto_1147214 ?auto_1147217 ) ) ( not ( = ?auto_1147214 ?auto_1147218 ) ) ( not ( = ?auto_1147214 ?auto_1147219 ) ) ( not ( = ?auto_1147214 ?auto_1147220 ) ) ( not ( = ?auto_1147214 ?auto_1147221 ) ) ( not ( = ?auto_1147214 ?auto_1147223 ) ) ( not ( = ?auto_1147215 ?auto_1147216 ) ) ( not ( = ?auto_1147215 ?auto_1147217 ) ) ( not ( = ?auto_1147215 ?auto_1147218 ) ) ( not ( = ?auto_1147215 ?auto_1147219 ) ) ( not ( = ?auto_1147215 ?auto_1147220 ) ) ( not ( = ?auto_1147215 ?auto_1147221 ) ) ( not ( = ?auto_1147215 ?auto_1147223 ) ) ( not ( = ?auto_1147216 ?auto_1147217 ) ) ( not ( = ?auto_1147216 ?auto_1147218 ) ) ( not ( = ?auto_1147216 ?auto_1147219 ) ) ( not ( = ?auto_1147216 ?auto_1147220 ) ) ( not ( = ?auto_1147216 ?auto_1147221 ) ) ( not ( = ?auto_1147216 ?auto_1147223 ) ) ( not ( = ?auto_1147217 ?auto_1147218 ) ) ( not ( = ?auto_1147217 ?auto_1147219 ) ) ( not ( = ?auto_1147217 ?auto_1147220 ) ) ( not ( = ?auto_1147217 ?auto_1147221 ) ) ( not ( = ?auto_1147217 ?auto_1147223 ) ) ( not ( = ?auto_1147218 ?auto_1147219 ) ) ( not ( = ?auto_1147218 ?auto_1147220 ) ) ( not ( = ?auto_1147218 ?auto_1147221 ) ) ( not ( = ?auto_1147218 ?auto_1147223 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1147219 ?auto_1147220 ?auto_1147221 )
      ( MAKE-12CRATE-VERIFY ?auto_1147209 ?auto_1147210 ?auto_1147211 ?auto_1147213 ?auto_1147212 ?auto_1147214 ?auto_1147215 ?auto_1147216 ?auto_1147217 ?auto_1147218 ?auto_1147219 ?auto_1147220 ?auto_1147221 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1158738 - SURFACE
      ?auto_1158739 - SURFACE
      ?auto_1158740 - SURFACE
      ?auto_1158742 - SURFACE
      ?auto_1158741 - SURFACE
      ?auto_1158743 - SURFACE
      ?auto_1158744 - SURFACE
      ?auto_1158745 - SURFACE
      ?auto_1158746 - SURFACE
      ?auto_1158747 - SURFACE
      ?auto_1158748 - SURFACE
      ?auto_1158749 - SURFACE
      ?auto_1158750 - SURFACE
      ?auto_1158751 - SURFACE
    )
    :vars
    (
      ?auto_1158752 - HOIST
      ?auto_1158753 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1158752 ?auto_1158753 ) ( SURFACE-AT ?auto_1158750 ?auto_1158753 ) ( CLEAR ?auto_1158750 ) ( LIFTING ?auto_1158752 ?auto_1158751 ) ( IS-CRATE ?auto_1158751 ) ( not ( = ?auto_1158750 ?auto_1158751 ) ) ( ON ?auto_1158739 ?auto_1158738 ) ( ON ?auto_1158740 ?auto_1158739 ) ( ON ?auto_1158742 ?auto_1158740 ) ( ON ?auto_1158741 ?auto_1158742 ) ( ON ?auto_1158743 ?auto_1158741 ) ( ON ?auto_1158744 ?auto_1158743 ) ( ON ?auto_1158745 ?auto_1158744 ) ( ON ?auto_1158746 ?auto_1158745 ) ( ON ?auto_1158747 ?auto_1158746 ) ( ON ?auto_1158748 ?auto_1158747 ) ( ON ?auto_1158749 ?auto_1158748 ) ( ON ?auto_1158750 ?auto_1158749 ) ( not ( = ?auto_1158738 ?auto_1158739 ) ) ( not ( = ?auto_1158738 ?auto_1158740 ) ) ( not ( = ?auto_1158738 ?auto_1158742 ) ) ( not ( = ?auto_1158738 ?auto_1158741 ) ) ( not ( = ?auto_1158738 ?auto_1158743 ) ) ( not ( = ?auto_1158738 ?auto_1158744 ) ) ( not ( = ?auto_1158738 ?auto_1158745 ) ) ( not ( = ?auto_1158738 ?auto_1158746 ) ) ( not ( = ?auto_1158738 ?auto_1158747 ) ) ( not ( = ?auto_1158738 ?auto_1158748 ) ) ( not ( = ?auto_1158738 ?auto_1158749 ) ) ( not ( = ?auto_1158738 ?auto_1158750 ) ) ( not ( = ?auto_1158738 ?auto_1158751 ) ) ( not ( = ?auto_1158739 ?auto_1158740 ) ) ( not ( = ?auto_1158739 ?auto_1158742 ) ) ( not ( = ?auto_1158739 ?auto_1158741 ) ) ( not ( = ?auto_1158739 ?auto_1158743 ) ) ( not ( = ?auto_1158739 ?auto_1158744 ) ) ( not ( = ?auto_1158739 ?auto_1158745 ) ) ( not ( = ?auto_1158739 ?auto_1158746 ) ) ( not ( = ?auto_1158739 ?auto_1158747 ) ) ( not ( = ?auto_1158739 ?auto_1158748 ) ) ( not ( = ?auto_1158739 ?auto_1158749 ) ) ( not ( = ?auto_1158739 ?auto_1158750 ) ) ( not ( = ?auto_1158739 ?auto_1158751 ) ) ( not ( = ?auto_1158740 ?auto_1158742 ) ) ( not ( = ?auto_1158740 ?auto_1158741 ) ) ( not ( = ?auto_1158740 ?auto_1158743 ) ) ( not ( = ?auto_1158740 ?auto_1158744 ) ) ( not ( = ?auto_1158740 ?auto_1158745 ) ) ( not ( = ?auto_1158740 ?auto_1158746 ) ) ( not ( = ?auto_1158740 ?auto_1158747 ) ) ( not ( = ?auto_1158740 ?auto_1158748 ) ) ( not ( = ?auto_1158740 ?auto_1158749 ) ) ( not ( = ?auto_1158740 ?auto_1158750 ) ) ( not ( = ?auto_1158740 ?auto_1158751 ) ) ( not ( = ?auto_1158742 ?auto_1158741 ) ) ( not ( = ?auto_1158742 ?auto_1158743 ) ) ( not ( = ?auto_1158742 ?auto_1158744 ) ) ( not ( = ?auto_1158742 ?auto_1158745 ) ) ( not ( = ?auto_1158742 ?auto_1158746 ) ) ( not ( = ?auto_1158742 ?auto_1158747 ) ) ( not ( = ?auto_1158742 ?auto_1158748 ) ) ( not ( = ?auto_1158742 ?auto_1158749 ) ) ( not ( = ?auto_1158742 ?auto_1158750 ) ) ( not ( = ?auto_1158742 ?auto_1158751 ) ) ( not ( = ?auto_1158741 ?auto_1158743 ) ) ( not ( = ?auto_1158741 ?auto_1158744 ) ) ( not ( = ?auto_1158741 ?auto_1158745 ) ) ( not ( = ?auto_1158741 ?auto_1158746 ) ) ( not ( = ?auto_1158741 ?auto_1158747 ) ) ( not ( = ?auto_1158741 ?auto_1158748 ) ) ( not ( = ?auto_1158741 ?auto_1158749 ) ) ( not ( = ?auto_1158741 ?auto_1158750 ) ) ( not ( = ?auto_1158741 ?auto_1158751 ) ) ( not ( = ?auto_1158743 ?auto_1158744 ) ) ( not ( = ?auto_1158743 ?auto_1158745 ) ) ( not ( = ?auto_1158743 ?auto_1158746 ) ) ( not ( = ?auto_1158743 ?auto_1158747 ) ) ( not ( = ?auto_1158743 ?auto_1158748 ) ) ( not ( = ?auto_1158743 ?auto_1158749 ) ) ( not ( = ?auto_1158743 ?auto_1158750 ) ) ( not ( = ?auto_1158743 ?auto_1158751 ) ) ( not ( = ?auto_1158744 ?auto_1158745 ) ) ( not ( = ?auto_1158744 ?auto_1158746 ) ) ( not ( = ?auto_1158744 ?auto_1158747 ) ) ( not ( = ?auto_1158744 ?auto_1158748 ) ) ( not ( = ?auto_1158744 ?auto_1158749 ) ) ( not ( = ?auto_1158744 ?auto_1158750 ) ) ( not ( = ?auto_1158744 ?auto_1158751 ) ) ( not ( = ?auto_1158745 ?auto_1158746 ) ) ( not ( = ?auto_1158745 ?auto_1158747 ) ) ( not ( = ?auto_1158745 ?auto_1158748 ) ) ( not ( = ?auto_1158745 ?auto_1158749 ) ) ( not ( = ?auto_1158745 ?auto_1158750 ) ) ( not ( = ?auto_1158745 ?auto_1158751 ) ) ( not ( = ?auto_1158746 ?auto_1158747 ) ) ( not ( = ?auto_1158746 ?auto_1158748 ) ) ( not ( = ?auto_1158746 ?auto_1158749 ) ) ( not ( = ?auto_1158746 ?auto_1158750 ) ) ( not ( = ?auto_1158746 ?auto_1158751 ) ) ( not ( = ?auto_1158747 ?auto_1158748 ) ) ( not ( = ?auto_1158747 ?auto_1158749 ) ) ( not ( = ?auto_1158747 ?auto_1158750 ) ) ( not ( = ?auto_1158747 ?auto_1158751 ) ) ( not ( = ?auto_1158748 ?auto_1158749 ) ) ( not ( = ?auto_1158748 ?auto_1158750 ) ) ( not ( = ?auto_1158748 ?auto_1158751 ) ) ( not ( = ?auto_1158749 ?auto_1158750 ) ) ( not ( = ?auto_1158749 ?auto_1158751 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1158750 ?auto_1158751 )
      ( MAKE-13CRATE-VERIFY ?auto_1158738 ?auto_1158739 ?auto_1158740 ?auto_1158742 ?auto_1158741 ?auto_1158743 ?auto_1158744 ?auto_1158745 ?auto_1158746 ?auto_1158747 ?auto_1158748 ?auto_1158749 ?auto_1158750 ?auto_1158751 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1158880 - SURFACE
      ?auto_1158881 - SURFACE
      ?auto_1158882 - SURFACE
      ?auto_1158884 - SURFACE
      ?auto_1158883 - SURFACE
      ?auto_1158885 - SURFACE
      ?auto_1158886 - SURFACE
      ?auto_1158887 - SURFACE
      ?auto_1158888 - SURFACE
      ?auto_1158889 - SURFACE
      ?auto_1158890 - SURFACE
      ?auto_1158891 - SURFACE
      ?auto_1158892 - SURFACE
      ?auto_1158893 - SURFACE
    )
    :vars
    (
      ?auto_1158894 - HOIST
      ?auto_1158895 - PLACE
      ?auto_1158896 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1158894 ?auto_1158895 ) ( SURFACE-AT ?auto_1158892 ?auto_1158895 ) ( CLEAR ?auto_1158892 ) ( IS-CRATE ?auto_1158893 ) ( not ( = ?auto_1158892 ?auto_1158893 ) ) ( TRUCK-AT ?auto_1158896 ?auto_1158895 ) ( AVAILABLE ?auto_1158894 ) ( IN ?auto_1158893 ?auto_1158896 ) ( ON ?auto_1158892 ?auto_1158891 ) ( not ( = ?auto_1158891 ?auto_1158892 ) ) ( not ( = ?auto_1158891 ?auto_1158893 ) ) ( ON ?auto_1158881 ?auto_1158880 ) ( ON ?auto_1158882 ?auto_1158881 ) ( ON ?auto_1158884 ?auto_1158882 ) ( ON ?auto_1158883 ?auto_1158884 ) ( ON ?auto_1158885 ?auto_1158883 ) ( ON ?auto_1158886 ?auto_1158885 ) ( ON ?auto_1158887 ?auto_1158886 ) ( ON ?auto_1158888 ?auto_1158887 ) ( ON ?auto_1158889 ?auto_1158888 ) ( ON ?auto_1158890 ?auto_1158889 ) ( ON ?auto_1158891 ?auto_1158890 ) ( not ( = ?auto_1158880 ?auto_1158881 ) ) ( not ( = ?auto_1158880 ?auto_1158882 ) ) ( not ( = ?auto_1158880 ?auto_1158884 ) ) ( not ( = ?auto_1158880 ?auto_1158883 ) ) ( not ( = ?auto_1158880 ?auto_1158885 ) ) ( not ( = ?auto_1158880 ?auto_1158886 ) ) ( not ( = ?auto_1158880 ?auto_1158887 ) ) ( not ( = ?auto_1158880 ?auto_1158888 ) ) ( not ( = ?auto_1158880 ?auto_1158889 ) ) ( not ( = ?auto_1158880 ?auto_1158890 ) ) ( not ( = ?auto_1158880 ?auto_1158891 ) ) ( not ( = ?auto_1158880 ?auto_1158892 ) ) ( not ( = ?auto_1158880 ?auto_1158893 ) ) ( not ( = ?auto_1158881 ?auto_1158882 ) ) ( not ( = ?auto_1158881 ?auto_1158884 ) ) ( not ( = ?auto_1158881 ?auto_1158883 ) ) ( not ( = ?auto_1158881 ?auto_1158885 ) ) ( not ( = ?auto_1158881 ?auto_1158886 ) ) ( not ( = ?auto_1158881 ?auto_1158887 ) ) ( not ( = ?auto_1158881 ?auto_1158888 ) ) ( not ( = ?auto_1158881 ?auto_1158889 ) ) ( not ( = ?auto_1158881 ?auto_1158890 ) ) ( not ( = ?auto_1158881 ?auto_1158891 ) ) ( not ( = ?auto_1158881 ?auto_1158892 ) ) ( not ( = ?auto_1158881 ?auto_1158893 ) ) ( not ( = ?auto_1158882 ?auto_1158884 ) ) ( not ( = ?auto_1158882 ?auto_1158883 ) ) ( not ( = ?auto_1158882 ?auto_1158885 ) ) ( not ( = ?auto_1158882 ?auto_1158886 ) ) ( not ( = ?auto_1158882 ?auto_1158887 ) ) ( not ( = ?auto_1158882 ?auto_1158888 ) ) ( not ( = ?auto_1158882 ?auto_1158889 ) ) ( not ( = ?auto_1158882 ?auto_1158890 ) ) ( not ( = ?auto_1158882 ?auto_1158891 ) ) ( not ( = ?auto_1158882 ?auto_1158892 ) ) ( not ( = ?auto_1158882 ?auto_1158893 ) ) ( not ( = ?auto_1158884 ?auto_1158883 ) ) ( not ( = ?auto_1158884 ?auto_1158885 ) ) ( not ( = ?auto_1158884 ?auto_1158886 ) ) ( not ( = ?auto_1158884 ?auto_1158887 ) ) ( not ( = ?auto_1158884 ?auto_1158888 ) ) ( not ( = ?auto_1158884 ?auto_1158889 ) ) ( not ( = ?auto_1158884 ?auto_1158890 ) ) ( not ( = ?auto_1158884 ?auto_1158891 ) ) ( not ( = ?auto_1158884 ?auto_1158892 ) ) ( not ( = ?auto_1158884 ?auto_1158893 ) ) ( not ( = ?auto_1158883 ?auto_1158885 ) ) ( not ( = ?auto_1158883 ?auto_1158886 ) ) ( not ( = ?auto_1158883 ?auto_1158887 ) ) ( not ( = ?auto_1158883 ?auto_1158888 ) ) ( not ( = ?auto_1158883 ?auto_1158889 ) ) ( not ( = ?auto_1158883 ?auto_1158890 ) ) ( not ( = ?auto_1158883 ?auto_1158891 ) ) ( not ( = ?auto_1158883 ?auto_1158892 ) ) ( not ( = ?auto_1158883 ?auto_1158893 ) ) ( not ( = ?auto_1158885 ?auto_1158886 ) ) ( not ( = ?auto_1158885 ?auto_1158887 ) ) ( not ( = ?auto_1158885 ?auto_1158888 ) ) ( not ( = ?auto_1158885 ?auto_1158889 ) ) ( not ( = ?auto_1158885 ?auto_1158890 ) ) ( not ( = ?auto_1158885 ?auto_1158891 ) ) ( not ( = ?auto_1158885 ?auto_1158892 ) ) ( not ( = ?auto_1158885 ?auto_1158893 ) ) ( not ( = ?auto_1158886 ?auto_1158887 ) ) ( not ( = ?auto_1158886 ?auto_1158888 ) ) ( not ( = ?auto_1158886 ?auto_1158889 ) ) ( not ( = ?auto_1158886 ?auto_1158890 ) ) ( not ( = ?auto_1158886 ?auto_1158891 ) ) ( not ( = ?auto_1158886 ?auto_1158892 ) ) ( not ( = ?auto_1158886 ?auto_1158893 ) ) ( not ( = ?auto_1158887 ?auto_1158888 ) ) ( not ( = ?auto_1158887 ?auto_1158889 ) ) ( not ( = ?auto_1158887 ?auto_1158890 ) ) ( not ( = ?auto_1158887 ?auto_1158891 ) ) ( not ( = ?auto_1158887 ?auto_1158892 ) ) ( not ( = ?auto_1158887 ?auto_1158893 ) ) ( not ( = ?auto_1158888 ?auto_1158889 ) ) ( not ( = ?auto_1158888 ?auto_1158890 ) ) ( not ( = ?auto_1158888 ?auto_1158891 ) ) ( not ( = ?auto_1158888 ?auto_1158892 ) ) ( not ( = ?auto_1158888 ?auto_1158893 ) ) ( not ( = ?auto_1158889 ?auto_1158890 ) ) ( not ( = ?auto_1158889 ?auto_1158891 ) ) ( not ( = ?auto_1158889 ?auto_1158892 ) ) ( not ( = ?auto_1158889 ?auto_1158893 ) ) ( not ( = ?auto_1158890 ?auto_1158891 ) ) ( not ( = ?auto_1158890 ?auto_1158892 ) ) ( not ( = ?auto_1158890 ?auto_1158893 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1158891 ?auto_1158892 ?auto_1158893 )
      ( MAKE-13CRATE-VERIFY ?auto_1158880 ?auto_1158881 ?auto_1158882 ?auto_1158884 ?auto_1158883 ?auto_1158885 ?auto_1158886 ?auto_1158887 ?auto_1158888 ?auto_1158889 ?auto_1158890 ?auto_1158891 ?auto_1158892 ?auto_1158893 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1159036 - SURFACE
      ?auto_1159037 - SURFACE
      ?auto_1159038 - SURFACE
      ?auto_1159040 - SURFACE
      ?auto_1159039 - SURFACE
      ?auto_1159041 - SURFACE
      ?auto_1159042 - SURFACE
      ?auto_1159043 - SURFACE
      ?auto_1159044 - SURFACE
      ?auto_1159045 - SURFACE
      ?auto_1159046 - SURFACE
      ?auto_1159047 - SURFACE
      ?auto_1159048 - SURFACE
      ?auto_1159049 - SURFACE
    )
    :vars
    (
      ?auto_1159050 - HOIST
      ?auto_1159052 - PLACE
      ?auto_1159051 - TRUCK
      ?auto_1159053 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1159050 ?auto_1159052 ) ( SURFACE-AT ?auto_1159048 ?auto_1159052 ) ( CLEAR ?auto_1159048 ) ( IS-CRATE ?auto_1159049 ) ( not ( = ?auto_1159048 ?auto_1159049 ) ) ( AVAILABLE ?auto_1159050 ) ( IN ?auto_1159049 ?auto_1159051 ) ( ON ?auto_1159048 ?auto_1159047 ) ( not ( = ?auto_1159047 ?auto_1159048 ) ) ( not ( = ?auto_1159047 ?auto_1159049 ) ) ( TRUCK-AT ?auto_1159051 ?auto_1159053 ) ( not ( = ?auto_1159053 ?auto_1159052 ) ) ( ON ?auto_1159037 ?auto_1159036 ) ( ON ?auto_1159038 ?auto_1159037 ) ( ON ?auto_1159040 ?auto_1159038 ) ( ON ?auto_1159039 ?auto_1159040 ) ( ON ?auto_1159041 ?auto_1159039 ) ( ON ?auto_1159042 ?auto_1159041 ) ( ON ?auto_1159043 ?auto_1159042 ) ( ON ?auto_1159044 ?auto_1159043 ) ( ON ?auto_1159045 ?auto_1159044 ) ( ON ?auto_1159046 ?auto_1159045 ) ( ON ?auto_1159047 ?auto_1159046 ) ( not ( = ?auto_1159036 ?auto_1159037 ) ) ( not ( = ?auto_1159036 ?auto_1159038 ) ) ( not ( = ?auto_1159036 ?auto_1159040 ) ) ( not ( = ?auto_1159036 ?auto_1159039 ) ) ( not ( = ?auto_1159036 ?auto_1159041 ) ) ( not ( = ?auto_1159036 ?auto_1159042 ) ) ( not ( = ?auto_1159036 ?auto_1159043 ) ) ( not ( = ?auto_1159036 ?auto_1159044 ) ) ( not ( = ?auto_1159036 ?auto_1159045 ) ) ( not ( = ?auto_1159036 ?auto_1159046 ) ) ( not ( = ?auto_1159036 ?auto_1159047 ) ) ( not ( = ?auto_1159036 ?auto_1159048 ) ) ( not ( = ?auto_1159036 ?auto_1159049 ) ) ( not ( = ?auto_1159037 ?auto_1159038 ) ) ( not ( = ?auto_1159037 ?auto_1159040 ) ) ( not ( = ?auto_1159037 ?auto_1159039 ) ) ( not ( = ?auto_1159037 ?auto_1159041 ) ) ( not ( = ?auto_1159037 ?auto_1159042 ) ) ( not ( = ?auto_1159037 ?auto_1159043 ) ) ( not ( = ?auto_1159037 ?auto_1159044 ) ) ( not ( = ?auto_1159037 ?auto_1159045 ) ) ( not ( = ?auto_1159037 ?auto_1159046 ) ) ( not ( = ?auto_1159037 ?auto_1159047 ) ) ( not ( = ?auto_1159037 ?auto_1159048 ) ) ( not ( = ?auto_1159037 ?auto_1159049 ) ) ( not ( = ?auto_1159038 ?auto_1159040 ) ) ( not ( = ?auto_1159038 ?auto_1159039 ) ) ( not ( = ?auto_1159038 ?auto_1159041 ) ) ( not ( = ?auto_1159038 ?auto_1159042 ) ) ( not ( = ?auto_1159038 ?auto_1159043 ) ) ( not ( = ?auto_1159038 ?auto_1159044 ) ) ( not ( = ?auto_1159038 ?auto_1159045 ) ) ( not ( = ?auto_1159038 ?auto_1159046 ) ) ( not ( = ?auto_1159038 ?auto_1159047 ) ) ( not ( = ?auto_1159038 ?auto_1159048 ) ) ( not ( = ?auto_1159038 ?auto_1159049 ) ) ( not ( = ?auto_1159040 ?auto_1159039 ) ) ( not ( = ?auto_1159040 ?auto_1159041 ) ) ( not ( = ?auto_1159040 ?auto_1159042 ) ) ( not ( = ?auto_1159040 ?auto_1159043 ) ) ( not ( = ?auto_1159040 ?auto_1159044 ) ) ( not ( = ?auto_1159040 ?auto_1159045 ) ) ( not ( = ?auto_1159040 ?auto_1159046 ) ) ( not ( = ?auto_1159040 ?auto_1159047 ) ) ( not ( = ?auto_1159040 ?auto_1159048 ) ) ( not ( = ?auto_1159040 ?auto_1159049 ) ) ( not ( = ?auto_1159039 ?auto_1159041 ) ) ( not ( = ?auto_1159039 ?auto_1159042 ) ) ( not ( = ?auto_1159039 ?auto_1159043 ) ) ( not ( = ?auto_1159039 ?auto_1159044 ) ) ( not ( = ?auto_1159039 ?auto_1159045 ) ) ( not ( = ?auto_1159039 ?auto_1159046 ) ) ( not ( = ?auto_1159039 ?auto_1159047 ) ) ( not ( = ?auto_1159039 ?auto_1159048 ) ) ( not ( = ?auto_1159039 ?auto_1159049 ) ) ( not ( = ?auto_1159041 ?auto_1159042 ) ) ( not ( = ?auto_1159041 ?auto_1159043 ) ) ( not ( = ?auto_1159041 ?auto_1159044 ) ) ( not ( = ?auto_1159041 ?auto_1159045 ) ) ( not ( = ?auto_1159041 ?auto_1159046 ) ) ( not ( = ?auto_1159041 ?auto_1159047 ) ) ( not ( = ?auto_1159041 ?auto_1159048 ) ) ( not ( = ?auto_1159041 ?auto_1159049 ) ) ( not ( = ?auto_1159042 ?auto_1159043 ) ) ( not ( = ?auto_1159042 ?auto_1159044 ) ) ( not ( = ?auto_1159042 ?auto_1159045 ) ) ( not ( = ?auto_1159042 ?auto_1159046 ) ) ( not ( = ?auto_1159042 ?auto_1159047 ) ) ( not ( = ?auto_1159042 ?auto_1159048 ) ) ( not ( = ?auto_1159042 ?auto_1159049 ) ) ( not ( = ?auto_1159043 ?auto_1159044 ) ) ( not ( = ?auto_1159043 ?auto_1159045 ) ) ( not ( = ?auto_1159043 ?auto_1159046 ) ) ( not ( = ?auto_1159043 ?auto_1159047 ) ) ( not ( = ?auto_1159043 ?auto_1159048 ) ) ( not ( = ?auto_1159043 ?auto_1159049 ) ) ( not ( = ?auto_1159044 ?auto_1159045 ) ) ( not ( = ?auto_1159044 ?auto_1159046 ) ) ( not ( = ?auto_1159044 ?auto_1159047 ) ) ( not ( = ?auto_1159044 ?auto_1159048 ) ) ( not ( = ?auto_1159044 ?auto_1159049 ) ) ( not ( = ?auto_1159045 ?auto_1159046 ) ) ( not ( = ?auto_1159045 ?auto_1159047 ) ) ( not ( = ?auto_1159045 ?auto_1159048 ) ) ( not ( = ?auto_1159045 ?auto_1159049 ) ) ( not ( = ?auto_1159046 ?auto_1159047 ) ) ( not ( = ?auto_1159046 ?auto_1159048 ) ) ( not ( = ?auto_1159046 ?auto_1159049 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1159047 ?auto_1159048 ?auto_1159049 )
      ( MAKE-13CRATE-VERIFY ?auto_1159036 ?auto_1159037 ?auto_1159038 ?auto_1159040 ?auto_1159039 ?auto_1159041 ?auto_1159042 ?auto_1159043 ?auto_1159044 ?auto_1159045 ?auto_1159046 ?auto_1159047 ?auto_1159048 ?auto_1159049 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1159205 - SURFACE
      ?auto_1159206 - SURFACE
      ?auto_1159207 - SURFACE
      ?auto_1159209 - SURFACE
      ?auto_1159208 - SURFACE
      ?auto_1159210 - SURFACE
      ?auto_1159211 - SURFACE
      ?auto_1159212 - SURFACE
      ?auto_1159213 - SURFACE
      ?auto_1159214 - SURFACE
      ?auto_1159215 - SURFACE
      ?auto_1159216 - SURFACE
      ?auto_1159217 - SURFACE
      ?auto_1159218 - SURFACE
    )
    :vars
    (
      ?auto_1159220 - HOIST
      ?auto_1159222 - PLACE
      ?auto_1159219 - TRUCK
      ?auto_1159223 - PLACE
      ?auto_1159221 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1159220 ?auto_1159222 ) ( SURFACE-AT ?auto_1159217 ?auto_1159222 ) ( CLEAR ?auto_1159217 ) ( IS-CRATE ?auto_1159218 ) ( not ( = ?auto_1159217 ?auto_1159218 ) ) ( AVAILABLE ?auto_1159220 ) ( ON ?auto_1159217 ?auto_1159216 ) ( not ( = ?auto_1159216 ?auto_1159217 ) ) ( not ( = ?auto_1159216 ?auto_1159218 ) ) ( TRUCK-AT ?auto_1159219 ?auto_1159223 ) ( not ( = ?auto_1159223 ?auto_1159222 ) ) ( HOIST-AT ?auto_1159221 ?auto_1159223 ) ( LIFTING ?auto_1159221 ?auto_1159218 ) ( not ( = ?auto_1159220 ?auto_1159221 ) ) ( ON ?auto_1159206 ?auto_1159205 ) ( ON ?auto_1159207 ?auto_1159206 ) ( ON ?auto_1159209 ?auto_1159207 ) ( ON ?auto_1159208 ?auto_1159209 ) ( ON ?auto_1159210 ?auto_1159208 ) ( ON ?auto_1159211 ?auto_1159210 ) ( ON ?auto_1159212 ?auto_1159211 ) ( ON ?auto_1159213 ?auto_1159212 ) ( ON ?auto_1159214 ?auto_1159213 ) ( ON ?auto_1159215 ?auto_1159214 ) ( ON ?auto_1159216 ?auto_1159215 ) ( not ( = ?auto_1159205 ?auto_1159206 ) ) ( not ( = ?auto_1159205 ?auto_1159207 ) ) ( not ( = ?auto_1159205 ?auto_1159209 ) ) ( not ( = ?auto_1159205 ?auto_1159208 ) ) ( not ( = ?auto_1159205 ?auto_1159210 ) ) ( not ( = ?auto_1159205 ?auto_1159211 ) ) ( not ( = ?auto_1159205 ?auto_1159212 ) ) ( not ( = ?auto_1159205 ?auto_1159213 ) ) ( not ( = ?auto_1159205 ?auto_1159214 ) ) ( not ( = ?auto_1159205 ?auto_1159215 ) ) ( not ( = ?auto_1159205 ?auto_1159216 ) ) ( not ( = ?auto_1159205 ?auto_1159217 ) ) ( not ( = ?auto_1159205 ?auto_1159218 ) ) ( not ( = ?auto_1159206 ?auto_1159207 ) ) ( not ( = ?auto_1159206 ?auto_1159209 ) ) ( not ( = ?auto_1159206 ?auto_1159208 ) ) ( not ( = ?auto_1159206 ?auto_1159210 ) ) ( not ( = ?auto_1159206 ?auto_1159211 ) ) ( not ( = ?auto_1159206 ?auto_1159212 ) ) ( not ( = ?auto_1159206 ?auto_1159213 ) ) ( not ( = ?auto_1159206 ?auto_1159214 ) ) ( not ( = ?auto_1159206 ?auto_1159215 ) ) ( not ( = ?auto_1159206 ?auto_1159216 ) ) ( not ( = ?auto_1159206 ?auto_1159217 ) ) ( not ( = ?auto_1159206 ?auto_1159218 ) ) ( not ( = ?auto_1159207 ?auto_1159209 ) ) ( not ( = ?auto_1159207 ?auto_1159208 ) ) ( not ( = ?auto_1159207 ?auto_1159210 ) ) ( not ( = ?auto_1159207 ?auto_1159211 ) ) ( not ( = ?auto_1159207 ?auto_1159212 ) ) ( not ( = ?auto_1159207 ?auto_1159213 ) ) ( not ( = ?auto_1159207 ?auto_1159214 ) ) ( not ( = ?auto_1159207 ?auto_1159215 ) ) ( not ( = ?auto_1159207 ?auto_1159216 ) ) ( not ( = ?auto_1159207 ?auto_1159217 ) ) ( not ( = ?auto_1159207 ?auto_1159218 ) ) ( not ( = ?auto_1159209 ?auto_1159208 ) ) ( not ( = ?auto_1159209 ?auto_1159210 ) ) ( not ( = ?auto_1159209 ?auto_1159211 ) ) ( not ( = ?auto_1159209 ?auto_1159212 ) ) ( not ( = ?auto_1159209 ?auto_1159213 ) ) ( not ( = ?auto_1159209 ?auto_1159214 ) ) ( not ( = ?auto_1159209 ?auto_1159215 ) ) ( not ( = ?auto_1159209 ?auto_1159216 ) ) ( not ( = ?auto_1159209 ?auto_1159217 ) ) ( not ( = ?auto_1159209 ?auto_1159218 ) ) ( not ( = ?auto_1159208 ?auto_1159210 ) ) ( not ( = ?auto_1159208 ?auto_1159211 ) ) ( not ( = ?auto_1159208 ?auto_1159212 ) ) ( not ( = ?auto_1159208 ?auto_1159213 ) ) ( not ( = ?auto_1159208 ?auto_1159214 ) ) ( not ( = ?auto_1159208 ?auto_1159215 ) ) ( not ( = ?auto_1159208 ?auto_1159216 ) ) ( not ( = ?auto_1159208 ?auto_1159217 ) ) ( not ( = ?auto_1159208 ?auto_1159218 ) ) ( not ( = ?auto_1159210 ?auto_1159211 ) ) ( not ( = ?auto_1159210 ?auto_1159212 ) ) ( not ( = ?auto_1159210 ?auto_1159213 ) ) ( not ( = ?auto_1159210 ?auto_1159214 ) ) ( not ( = ?auto_1159210 ?auto_1159215 ) ) ( not ( = ?auto_1159210 ?auto_1159216 ) ) ( not ( = ?auto_1159210 ?auto_1159217 ) ) ( not ( = ?auto_1159210 ?auto_1159218 ) ) ( not ( = ?auto_1159211 ?auto_1159212 ) ) ( not ( = ?auto_1159211 ?auto_1159213 ) ) ( not ( = ?auto_1159211 ?auto_1159214 ) ) ( not ( = ?auto_1159211 ?auto_1159215 ) ) ( not ( = ?auto_1159211 ?auto_1159216 ) ) ( not ( = ?auto_1159211 ?auto_1159217 ) ) ( not ( = ?auto_1159211 ?auto_1159218 ) ) ( not ( = ?auto_1159212 ?auto_1159213 ) ) ( not ( = ?auto_1159212 ?auto_1159214 ) ) ( not ( = ?auto_1159212 ?auto_1159215 ) ) ( not ( = ?auto_1159212 ?auto_1159216 ) ) ( not ( = ?auto_1159212 ?auto_1159217 ) ) ( not ( = ?auto_1159212 ?auto_1159218 ) ) ( not ( = ?auto_1159213 ?auto_1159214 ) ) ( not ( = ?auto_1159213 ?auto_1159215 ) ) ( not ( = ?auto_1159213 ?auto_1159216 ) ) ( not ( = ?auto_1159213 ?auto_1159217 ) ) ( not ( = ?auto_1159213 ?auto_1159218 ) ) ( not ( = ?auto_1159214 ?auto_1159215 ) ) ( not ( = ?auto_1159214 ?auto_1159216 ) ) ( not ( = ?auto_1159214 ?auto_1159217 ) ) ( not ( = ?auto_1159214 ?auto_1159218 ) ) ( not ( = ?auto_1159215 ?auto_1159216 ) ) ( not ( = ?auto_1159215 ?auto_1159217 ) ) ( not ( = ?auto_1159215 ?auto_1159218 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1159216 ?auto_1159217 ?auto_1159218 )
      ( MAKE-13CRATE-VERIFY ?auto_1159205 ?auto_1159206 ?auto_1159207 ?auto_1159209 ?auto_1159208 ?auto_1159210 ?auto_1159211 ?auto_1159212 ?auto_1159213 ?auto_1159214 ?auto_1159215 ?auto_1159216 ?auto_1159217 ?auto_1159218 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1159387 - SURFACE
      ?auto_1159388 - SURFACE
      ?auto_1159389 - SURFACE
      ?auto_1159391 - SURFACE
      ?auto_1159390 - SURFACE
      ?auto_1159392 - SURFACE
      ?auto_1159393 - SURFACE
      ?auto_1159394 - SURFACE
      ?auto_1159395 - SURFACE
      ?auto_1159396 - SURFACE
      ?auto_1159397 - SURFACE
      ?auto_1159398 - SURFACE
      ?auto_1159399 - SURFACE
      ?auto_1159400 - SURFACE
    )
    :vars
    (
      ?auto_1159402 - HOIST
      ?auto_1159406 - PLACE
      ?auto_1159401 - TRUCK
      ?auto_1159404 - PLACE
      ?auto_1159405 - HOIST
      ?auto_1159403 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1159402 ?auto_1159406 ) ( SURFACE-AT ?auto_1159399 ?auto_1159406 ) ( CLEAR ?auto_1159399 ) ( IS-CRATE ?auto_1159400 ) ( not ( = ?auto_1159399 ?auto_1159400 ) ) ( AVAILABLE ?auto_1159402 ) ( ON ?auto_1159399 ?auto_1159398 ) ( not ( = ?auto_1159398 ?auto_1159399 ) ) ( not ( = ?auto_1159398 ?auto_1159400 ) ) ( TRUCK-AT ?auto_1159401 ?auto_1159404 ) ( not ( = ?auto_1159404 ?auto_1159406 ) ) ( HOIST-AT ?auto_1159405 ?auto_1159404 ) ( not ( = ?auto_1159402 ?auto_1159405 ) ) ( AVAILABLE ?auto_1159405 ) ( SURFACE-AT ?auto_1159400 ?auto_1159404 ) ( ON ?auto_1159400 ?auto_1159403 ) ( CLEAR ?auto_1159400 ) ( not ( = ?auto_1159399 ?auto_1159403 ) ) ( not ( = ?auto_1159400 ?auto_1159403 ) ) ( not ( = ?auto_1159398 ?auto_1159403 ) ) ( ON ?auto_1159388 ?auto_1159387 ) ( ON ?auto_1159389 ?auto_1159388 ) ( ON ?auto_1159391 ?auto_1159389 ) ( ON ?auto_1159390 ?auto_1159391 ) ( ON ?auto_1159392 ?auto_1159390 ) ( ON ?auto_1159393 ?auto_1159392 ) ( ON ?auto_1159394 ?auto_1159393 ) ( ON ?auto_1159395 ?auto_1159394 ) ( ON ?auto_1159396 ?auto_1159395 ) ( ON ?auto_1159397 ?auto_1159396 ) ( ON ?auto_1159398 ?auto_1159397 ) ( not ( = ?auto_1159387 ?auto_1159388 ) ) ( not ( = ?auto_1159387 ?auto_1159389 ) ) ( not ( = ?auto_1159387 ?auto_1159391 ) ) ( not ( = ?auto_1159387 ?auto_1159390 ) ) ( not ( = ?auto_1159387 ?auto_1159392 ) ) ( not ( = ?auto_1159387 ?auto_1159393 ) ) ( not ( = ?auto_1159387 ?auto_1159394 ) ) ( not ( = ?auto_1159387 ?auto_1159395 ) ) ( not ( = ?auto_1159387 ?auto_1159396 ) ) ( not ( = ?auto_1159387 ?auto_1159397 ) ) ( not ( = ?auto_1159387 ?auto_1159398 ) ) ( not ( = ?auto_1159387 ?auto_1159399 ) ) ( not ( = ?auto_1159387 ?auto_1159400 ) ) ( not ( = ?auto_1159387 ?auto_1159403 ) ) ( not ( = ?auto_1159388 ?auto_1159389 ) ) ( not ( = ?auto_1159388 ?auto_1159391 ) ) ( not ( = ?auto_1159388 ?auto_1159390 ) ) ( not ( = ?auto_1159388 ?auto_1159392 ) ) ( not ( = ?auto_1159388 ?auto_1159393 ) ) ( not ( = ?auto_1159388 ?auto_1159394 ) ) ( not ( = ?auto_1159388 ?auto_1159395 ) ) ( not ( = ?auto_1159388 ?auto_1159396 ) ) ( not ( = ?auto_1159388 ?auto_1159397 ) ) ( not ( = ?auto_1159388 ?auto_1159398 ) ) ( not ( = ?auto_1159388 ?auto_1159399 ) ) ( not ( = ?auto_1159388 ?auto_1159400 ) ) ( not ( = ?auto_1159388 ?auto_1159403 ) ) ( not ( = ?auto_1159389 ?auto_1159391 ) ) ( not ( = ?auto_1159389 ?auto_1159390 ) ) ( not ( = ?auto_1159389 ?auto_1159392 ) ) ( not ( = ?auto_1159389 ?auto_1159393 ) ) ( not ( = ?auto_1159389 ?auto_1159394 ) ) ( not ( = ?auto_1159389 ?auto_1159395 ) ) ( not ( = ?auto_1159389 ?auto_1159396 ) ) ( not ( = ?auto_1159389 ?auto_1159397 ) ) ( not ( = ?auto_1159389 ?auto_1159398 ) ) ( not ( = ?auto_1159389 ?auto_1159399 ) ) ( not ( = ?auto_1159389 ?auto_1159400 ) ) ( not ( = ?auto_1159389 ?auto_1159403 ) ) ( not ( = ?auto_1159391 ?auto_1159390 ) ) ( not ( = ?auto_1159391 ?auto_1159392 ) ) ( not ( = ?auto_1159391 ?auto_1159393 ) ) ( not ( = ?auto_1159391 ?auto_1159394 ) ) ( not ( = ?auto_1159391 ?auto_1159395 ) ) ( not ( = ?auto_1159391 ?auto_1159396 ) ) ( not ( = ?auto_1159391 ?auto_1159397 ) ) ( not ( = ?auto_1159391 ?auto_1159398 ) ) ( not ( = ?auto_1159391 ?auto_1159399 ) ) ( not ( = ?auto_1159391 ?auto_1159400 ) ) ( not ( = ?auto_1159391 ?auto_1159403 ) ) ( not ( = ?auto_1159390 ?auto_1159392 ) ) ( not ( = ?auto_1159390 ?auto_1159393 ) ) ( not ( = ?auto_1159390 ?auto_1159394 ) ) ( not ( = ?auto_1159390 ?auto_1159395 ) ) ( not ( = ?auto_1159390 ?auto_1159396 ) ) ( not ( = ?auto_1159390 ?auto_1159397 ) ) ( not ( = ?auto_1159390 ?auto_1159398 ) ) ( not ( = ?auto_1159390 ?auto_1159399 ) ) ( not ( = ?auto_1159390 ?auto_1159400 ) ) ( not ( = ?auto_1159390 ?auto_1159403 ) ) ( not ( = ?auto_1159392 ?auto_1159393 ) ) ( not ( = ?auto_1159392 ?auto_1159394 ) ) ( not ( = ?auto_1159392 ?auto_1159395 ) ) ( not ( = ?auto_1159392 ?auto_1159396 ) ) ( not ( = ?auto_1159392 ?auto_1159397 ) ) ( not ( = ?auto_1159392 ?auto_1159398 ) ) ( not ( = ?auto_1159392 ?auto_1159399 ) ) ( not ( = ?auto_1159392 ?auto_1159400 ) ) ( not ( = ?auto_1159392 ?auto_1159403 ) ) ( not ( = ?auto_1159393 ?auto_1159394 ) ) ( not ( = ?auto_1159393 ?auto_1159395 ) ) ( not ( = ?auto_1159393 ?auto_1159396 ) ) ( not ( = ?auto_1159393 ?auto_1159397 ) ) ( not ( = ?auto_1159393 ?auto_1159398 ) ) ( not ( = ?auto_1159393 ?auto_1159399 ) ) ( not ( = ?auto_1159393 ?auto_1159400 ) ) ( not ( = ?auto_1159393 ?auto_1159403 ) ) ( not ( = ?auto_1159394 ?auto_1159395 ) ) ( not ( = ?auto_1159394 ?auto_1159396 ) ) ( not ( = ?auto_1159394 ?auto_1159397 ) ) ( not ( = ?auto_1159394 ?auto_1159398 ) ) ( not ( = ?auto_1159394 ?auto_1159399 ) ) ( not ( = ?auto_1159394 ?auto_1159400 ) ) ( not ( = ?auto_1159394 ?auto_1159403 ) ) ( not ( = ?auto_1159395 ?auto_1159396 ) ) ( not ( = ?auto_1159395 ?auto_1159397 ) ) ( not ( = ?auto_1159395 ?auto_1159398 ) ) ( not ( = ?auto_1159395 ?auto_1159399 ) ) ( not ( = ?auto_1159395 ?auto_1159400 ) ) ( not ( = ?auto_1159395 ?auto_1159403 ) ) ( not ( = ?auto_1159396 ?auto_1159397 ) ) ( not ( = ?auto_1159396 ?auto_1159398 ) ) ( not ( = ?auto_1159396 ?auto_1159399 ) ) ( not ( = ?auto_1159396 ?auto_1159400 ) ) ( not ( = ?auto_1159396 ?auto_1159403 ) ) ( not ( = ?auto_1159397 ?auto_1159398 ) ) ( not ( = ?auto_1159397 ?auto_1159399 ) ) ( not ( = ?auto_1159397 ?auto_1159400 ) ) ( not ( = ?auto_1159397 ?auto_1159403 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1159398 ?auto_1159399 ?auto_1159400 )
      ( MAKE-13CRATE-VERIFY ?auto_1159387 ?auto_1159388 ?auto_1159389 ?auto_1159391 ?auto_1159390 ?auto_1159392 ?auto_1159393 ?auto_1159394 ?auto_1159395 ?auto_1159396 ?auto_1159397 ?auto_1159398 ?auto_1159399 ?auto_1159400 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1159570 - SURFACE
      ?auto_1159571 - SURFACE
      ?auto_1159572 - SURFACE
      ?auto_1159574 - SURFACE
      ?auto_1159573 - SURFACE
      ?auto_1159575 - SURFACE
      ?auto_1159576 - SURFACE
      ?auto_1159577 - SURFACE
      ?auto_1159578 - SURFACE
      ?auto_1159579 - SURFACE
      ?auto_1159580 - SURFACE
      ?auto_1159581 - SURFACE
      ?auto_1159582 - SURFACE
      ?auto_1159583 - SURFACE
    )
    :vars
    (
      ?auto_1159585 - HOIST
      ?auto_1159588 - PLACE
      ?auto_1159587 - PLACE
      ?auto_1159586 - HOIST
      ?auto_1159589 - SURFACE
      ?auto_1159584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1159585 ?auto_1159588 ) ( SURFACE-AT ?auto_1159582 ?auto_1159588 ) ( CLEAR ?auto_1159582 ) ( IS-CRATE ?auto_1159583 ) ( not ( = ?auto_1159582 ?auto_1159583 ) ) ( AVAILABLE ?auto_1159585 ) ( ON ?auto_1159582 ?auto_1159581 ) ( not ( = ?auto_1159581 ?auto_1159582 ) ) ( not ( = ?auto_1159581 ?auto_1159583 ) ) ( not ( = ?auto_1159587 ?auto_1159588 ) ) ( HOIST-AT ?auto_1159586 ?auto_1159587 ) ( not ( = ?auto_1159585 ?auto_1159586 ) ) ( AVAILABLE ?auto_1159586 ) ( SURFACE-AT ?auto_1159583 ?auto_1159587 ) ( ON ?auto_1159583 ?auto_1159589 ) ( CLEAR ?auto_1159583 ) ( not ( = ?auto_1159582 ?auto_1159589 ) ) ( not ( = ?auto_1159583 ?auto_1159589 ) ) ( not ( = ?auto_1159581 ?auto_1159589 ) ) ( TRUCK-AT ?auto_1159584 ?auto_1159588 ) ( ON ?auto_1159571 ?auto_1159570 ) ( ON ?auto_1159572 ?auto_1159571 ) ( ON ?auto_1159574 ?auto_1159572 ) ( ON ?auto_1159573 ?auto_1159574 ) ( ON ?auto_1159575 ?auto_1159573 ) ( ON ?auto_1159576 ?auto_1159575 ) ( ON ?auto_1159577 ?auto_1159576 ) ( ON ?auto_1159578 ?auto_1159577 ) ( ON ?auto_1159579 ?auto_1159578 ) ( ON ?auto_1159580 ?auto_1159579 ) ( ON ?auto_1159581 ?auto_1159580 ) ( not ( = ?auto_1159570 ?auto_1159571 ) ) ( not ( = ?auto_1159570 ?auto_1159572 ) ) ( not ( = ?auto_1159570 ?auto_1159574 ) ) ( not ( = ?auto_1159570 ?auto_1159573 ) ) ( not ( = ?auto_1159570 ?auto_1159575 ) ) ( not ( = ?auto_1159570 ?auto_1159576 ) ) ( not ( = ?auto_1159570 ?auto_1159577 ) ) ( not ( = ?auto_1159570 ?auto_1159578 ) ) ( not ( = ?auto_1159570 ?auto_1159579 ) ) ( not ( = ?auto_1159570 ?auto_1159580 ) ) ( not ( = ?auto_1159570 ?auto_1159581 ) ) ( not ( = ?auto_1159570 ?auto_1159582 ) ) ( not ( = ?auto_1159570 ?auto_1159583 ) ) ( not ( = ?auto_1159570 ?auto_1159589 ) ) ( not ( = ?auto_1159571 ?auto_1159572 ) ) ( not ( = ?auto_1159571 ?auto_1159574 ) ) ( not ( = ?auto_1159571 ?auto_1159573 ) ) ( not ( = ?auto_1159571 ?auto_1159575 ) ) ( not ( = ?auto_1159571 ?auto_1159576 ) ) ( not ( = ?auto_1159571 ?auto_1159577 ) ) ( not ( = ?auto_1159571 ?auto_1159578 ) ) ( not ( = ?auto_1159571 ?auto_1159579 ) ) ( not ( = ?auto_1159571 ?auto_1159580 ) ) ( not ( = ?auto_1159571 ?auto_1159581 ) ) ( not ( = ?auto_1159571 ?auto_1159582 ) ) ( not ( = ?auto_1159571 ?auto_1159583 ) ) ( not ( = ?auto_1159571 ?auto_1159589 ) ) ( not ( = ?auto_1159572 ?auto_1159574 ) ) ( not ( = ?auto_1159572 ?auto_1159573 ) ) ( not ( = ?auto_1159572 ?auto_1159575 ) ) ( not ( = ?auto_1159572 ?auto_1159576 ) ) ( not ( = ?auto_1159572 ?auto_1159577 ) ) ( not ( = ?auto_1159572 ?auto_1159578 ) ) ( not ( = ?auto_1159572 ?auto_1159579 ) ) ( not ( = ?auto_1159572 ?auto_1159580 ) ) ( not ( = ?auto_1159572 ?auto_1159581 ) ) ( not ( = ?auto_1159572 ?auto_1159582 ) ) ( not ( = ?auto_1159572 ?auto_1159583 ) ) ( not ( = ?auto_1159572 ?auto_1159589 ) ) ( not ( = ?auto_1159574 ?auto_1159573 ) ) ( not ( = ?auto_1159574 ?auto_1159575 ) ) ( not ( = ?auto_1159574 ?auto_1159576 ) ) ( not ( = ?auto_1159574 ?auto_1159577 ) ) ( not ( = ?auto_1159574 ?auto_1159578 ) ) ( not ( = ?auto_1159574 ?auto_1159579 ) ) ( not ( = ?auto_1159574 ?auto_1159580 ) ) ( not ( = ?auto_1159574 ?auto_1159581 ) ) ( not ( = ?auto_1159574 ?auto_1159582 ) ) ( not ( = ?auto_1159574 ?auto_1159583 ) ) ( not ( = ?auto_1159574 ?auto_1159589 ) ) ( not ( = ?auto_1159573 ?auto_1159575 ) ) ( not ( = ?auto_1159573 ?auto_1159576 ) ) ( not ( = ?auto_1159573 ?auto_1159577 ) ) ( not ( = ?auto_1159573 ?auto_1159578 ) ) ( not ( = ?auto_1159573 ?auto_1159579 ) ) ( not ( = ?auto_1159573 ?auto_1159580 ) ) ( not ( = ?auto_1159573 ?auto_1159581 ) ) ( not ( = ?auto_1159573 ?auto_1159582 ) ) ( not ( = ?auto_1159573 ?auto_1159583 ) ) ( not ( = ?auto_1159573 ?auto_1159589 ) ) ( not ( = ?auto_1159575 ?auto_1159576 ) ) ( not ( = ?auto_1159575 ?auto_1159577 ) ) ( not ( = ?auto_1159575 ?auto_1159578 ) ) ( not ( = ?auto_1159575 ?auto_1159579 ) ) ( not ( = ?auto_1159575 ?auto_1159580 ) ) ( not ( = ?auto_1159575 ?auto_1159581 ) ) ( not ( = ?auto_1159575 ?auto_1159582 ) ) ( not ( = ?auto_1159575 ?auto_1159583 ) ) ( not ( = ?auto_1159575 ?auto_1159589 ) ) ( not ( = ?auto_1159576 ?auto_1159577 ) ) ( not ( = ?auto_1159576 ?auto_1159578 ) ) ( not ( = ?auto_1159576 ?auto_1159579 ) ) ( not ( = ?auto_1159576 ?auto_1159580 ) ) ( not ( = ?auto_1159576 ?auto_1159581 ) ) ( not ( = ?auto_1159576 ?auto_1159582 ) ) ( not ( = ?auto_1159576 ?auto_1159583 ) ) ( not ( = ?auto_1159576 ?auto_1159589 ) ) ( not ( = ?auto_1159577 ?auto_1159578 ) ) ( not ( = ?auto_1159577 ?auto_1159579 ) ) ( not ( = ?auto_1159577 ?auto_1159580 ) ) ( not ( = ?auto_1159577 ?auto_1159581 ) ) ( not ( = ?auto_1159577 ?auto_1159582 ) ) ( not ( = ?auto_1159577 ?auto_1159583 ) ) ( not ( = ?auto_1159577 ?auto_1159589 ) ) ( not ( = ?auto_1159578 ?auto_1159579 ) ) ( not ( = ?auto_1159578 ?auto_1159580 ) ) ( not ( = ?auto_1159578 ?auto_1159581 ) ) ( not ( = ?auto_1159578 ?auto_1159582 ) ) ( not ( = ?auto_1159578 ?auto_1159583 ) ) ( not ( = ?auto_1159578 ?auto_1159589 ) ) ( not ( = ?auto_1159579 ?auto_1159580 ) ) ( not ( = ?auto_1159579 ?auto_1159581 ) ) ( not ( = ?auto_1159579 ?auto_1159582 ) ) ( not ( = ?auto_1159579 ?auto_1159583 ) ) ( not ( = ?auto_1159579 ?auto_1159589 ) ) ( not ( = ?auto_1159580 ?auto_1159581 ) ) ( not ( = ?auto_1159580 ?auto_1159582 ) ) ( not ( = ?auto_1159580 ?auto_1159583 ) ) ( not ( = ?auto_1159580 ?auto_1159589 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1159581 ?auto_1159582 ?auto_1159583 )
      ( MAKE-13CRATE-VERIFY ?auto_1159570 ?auto_1159571 ?auto_1159572 ?auto_1159574 ?auto_1159573 ?auto_1159575 ?auto_1159576 ?auto_1159577 ?auto_1159578 ?auto_1159579 ?auto_1159580 ?auto_1159581 ?auto_1159582 ?auto_1159583 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1159753 - SURFACE
      ?auto_1159754 - SURFACE
      ?auto_1159755 - SURFACE
      ?auto_1159757 - SURFACE
      ?auto_1159756 - SURFACE
      ?auto_1159758 - SURFACE
      ?auto_1159759 - SURFACE
      ?auto_1159760 - SURFACE
      ?auto_1159761 - SURFACE
      ?auto_1159762 - SURFACE
      ?auto_1159763 - SURFACE
      ?auto_1159764 - SURFACE
      ?auto_1159765 - SURFACE
      ?auto_1159766 - SURFACE
    )
    :vars
    (
      ?auto_1159771 - HOIST
      ?auto_1159772 - PLACE
      ?auto_1159767 - PLACE
      ?auto_1159770 - HOIST
      ?auto_1159769 - SURFACE
      ?auto_1159768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1159771 ?auto_1159772 ) ( IS-CRATE ?auto_1159766 ) ( not ( = ?auto_1159765 ?auto_1159766 ) ) ( not ( = ?auto_1159764 ?auto_1159765 ) ) ( not ( = ?auto_1159764 ?auto_1159766 ) ) ( not ( = ?auto_1159767 ?auto_1159772 ) ) ( HOIST-AT ?auto_1159770 ?auto_1159767 ) ( not ( = ?auto_1159771 ?auto_1159770 ) ) ( AVAILABLE ?auto_1159770 ) ( SURFACE-AT ?auto_1159766 ?auto_1159767 ) ( ON ?auto_1159766 ?auto_1159769 ) ( CLEAR ?auto_1159766 ) ( not ( = ?auto_1159765 ?auto_1159769 ) ) ( not ( = ?auto_1159766 ?auto_1159769 ) ) ( not ( = ?auto_1159764 ?auto_1159769 ) ) ( TRUCK-AT ?auto_1159768 ?auto_1159772 ) ( SURFACE-AT ?auto_1159764 ?auto_1159772 ) ( CLEAR ?auto_1159764 ) ( LIFTING ?auto_1159771 ?auto_1159765 ) ( IS-CRATE ?auto_1159765 ) ( ON ?auto_1159754 ?auto_1159753 ) ( ON ?auto_1159755 ?auto_1159754 ) ( ON ?auto_1159757 ?auto_1159755 ) ( ON ?auto_1159756 ?auto_1159757 ) ( ON ?auto_1159758 ?auto_1159756 ) ( ON ?auto_1159759 ?auto_1159758 ) ( ON ?auto_1159760 ?auto_1159759 ) ( ON ?auto_1159761 ?auto_1159760 ) ( ON ?auto_1159762 ?auto_1159761 ) ( ON ?auto_1159763 ?auto_1159762 ) ( ON ?auto_1159764 ?auto_1159763 ) ( not ( = ?auto_1159753 ?auto_1159754 ) ) ( not ( = ?auto_1159753 ?auto_1159755 ) ) ( not ( = ?auto_1159753 ?auto_1159757 ) ) ( not ( = ?auto_1159753 ?auto_1159756 ) ) ( not ( = ?auto_1159753 ?auto_1159758 ) ) ( not ( = ?auto_1159753 ?auto_1159759 ) ) ( not ( = ?auto_1159753 ?auto_1159760 ) ) ( not ( = ?auto_1159753 ?auto_1159761 ) ) ( not ( = ?auto_1159753 ?auto_1159762 ) ) ( not ( = ?auto_1159753 ?auto_1159763 ) ) ( not ( = ?auto_1159753 ?auto_1159764 ) ) ( not ( = ?auto_1159753 ?auto_1159765 ) ) ( not ( = ?auto_1159753 ?auto_1159766 ) ) ( not ( = ?auto_1159753 ?auto_1159769 ) ) ( not ( = ?auto_1159754 ?auto_1159755 ) ) ( not ( = ?auto_1159754 ?auto_1159757 ) ) ( not ( = ?auto_1159754 ?auto_1159756 ) ) ( not ( = ?auto_1159754 ?auto_1159758 ) ) ( not ( = ?auto_1159754 ?auto_1159759 ) ) ( not ( = ?auto_1159754 ?auto_1159760 ) ) ( not ( = ?auto_1159754 ?auto_1159761 ) ) ( not ( = ?auto_1159754 ?auto_1159762 ) ) ( not ( = ?auto_1159754 ?auto_1159763 ) ) ( not ( = ?auto_1159754 ?auto_1159764 ) ) ( not ( = ?auto_1159754 ?auto_1159765 ) ) ( not ( = ?auto_1159754 ?auto_1159766 ) ) ( not ( = ?auto_1159754 ?auto_1159769 ) ) ( not ( = ?auto_1159755 ?auto_1159757 ) ) ( not ( = ?auto_1159755 ?auto_1159756 ) ) ( not ( = ?auto_1159755 ?auto_1159758 ) ) ( not ( = ?auto_1159755 ?auto_1159759 ) ) ( not ( = ?auto_1159755 ?auto_1159760 ) ) ( not ( = ?auto_1159755 ?auto_1159761 ) ) ( not ( = ?auto_1159755 ?auto_1159762 ) ) ( not ( = ?auto_1159755 ?auto_1159763 ) ) ( not ( = ?auto_1159755 ?auto_1159764 ) ) ( not ( = ?auto_1159755 ?auto_1159765 ) ) ( not ( = ?auto_1159755 ?auto_1159766 ) ) ( not ( = ?auto_1159755 ?auto_1159769 ) ) ( not ( = ?auto_1159757 ?auto_1159756 ) ) ( not ( = ?auto_1159757 ?auto_1159758 ) ) ( not ( = ?auto_1159757 ?auto_1159759 ) ) ( not ( = ?auto_1159757 ?auto_1159760 ) ) ( not ( = ?auto_1159757 ?auto_1159761 ) ) ( not ( = ?auto_1159757 ?auto_1159762 ) ) ( not ( = ?auto_1159757 ?auto_1159763 ) ) ( not ( = ?auto_1159757 ?auto_1159764 ) ) ( not ( = ?auto_1159757 ?auto_1159765 ) ) ( not ( = ?auto_1159757 ?auto_1159766 ) ) ( not ( = ?auto_1159757 ?auto_1159769 ) ) ( not ( = ?auto_1159756 ?auto_1159758 ) ) ( not ( = ?auto_1159756 ?auto_1159759 ) ) ( not ( = ?auto_1159756 ?auto_1159760 ) ) ( not ( = ?auto_1159756 ?auto_1159761 ) ) ( not ( = ?auto_1159756 ?auto_1159762 ) ) ( not ( = ?auto_1159756 ?auto_1159763 ) ) ( not ( = ?auto_1159756 ?auto_1159764 ) ) ( not ( = ?auto_1159756 ?auto_1159765 ) ) ( not ( = ?auto_1159756 ?auto_1159766 ) ) ( not ( = ?auto_1159756 ?auto_1159769 ) ) ( not ( = ?auto_1159758 ?auto_1159759 ) ) ( not ( = ?auto_1159758 ?auto_1159760 ) ) ( not ( = ?auto_1159758 ?auto_1159761 ) ) ( not ( = ?auto_1159758 ?auto_1159762 ) ) ( not ( = ?auto_1159758 ?auto_1159763 ) ) ( not ( = ?auto_1159758 ?auto_1159764 ) ) ( not ( = ?auto_1159758 ?auto_1159765 ) ) ( not ( = ?auto_1159758 ?auto_1159766 ) ) ( not ( = ?auto_1159758 ?auto_1159769 ) ) ( not ( = ?auto_1159759 ?auto_1159760 ) ) ( not ( = ?auto_1159759 ?auto_1159761 ) ) ( not ( = ?auto_1159759 ?auto_1159762 ) ) ( not ( = ?auto_1159759 ?auto_1159763 ) ) ( not ( = ?auto_1159759 ?auto_1159764 ) ) ( not ( = ?auto_1159759 ?auto_1159765 ) ) ( not ( = ?auto_1159759 ?auto_1159766 ) ) ( not ( = ?auto_1159759 ?auto_1159769 ) ) ( not ( = ?auto_1159760 ?auto_1159761 ) ) ( not ( = ?auto_1159760 ?auto_1159762 ) ) ( not ( = ?auto_1159760 ?auto_1159763 ) ) ( not ( = ?auto_1159760 ?auto_1159764 ) ) ( not ( = ?auto_1159760 ?auto_1159765 ) ) ( not ( = ?auto_1159760 ?auto_1159766 ) ) ( not ( = ?auto_1159760 ?auto_1159769 ) ) ( not ( = ?auto_1159761 ?auto_1159762 ) ) ( not ( = ?auto_1159761 ?auto_1159763 ) ) ( not ( = ?auto_1159761 ?auto_1159764 ) ) ( not ( = ?auto_1159761 ?auto_1159765 ) ) ( not ( = ?auto_1159761 ?auto_1159766 ) ) ( not ( = ?auto_1159761 ?auto_1159769 ) ) ( not ( = ?auto_1159762 ?auto_1159763 ) ) ( not ( = ?auto_1159762 ?auto_1159764 ) ) ( not ( = ?auto_1159762 ?auto_1159765 ) ) ( not ( = ?auto_1159762 ?auto_1159766 ) ) ( not ( = ?auto_1159762 ?auto_1159769 ) ) ( not ( = ?auto_1159763 ?auto_1159764 ) ) ( not ( = ?auto_1159763 ?auto_1159765 ) ) ( not ( = ?auto_1159763 ?auto_1159766 ) ) ( not ( = ?auto_1159763 ?auto_1159769 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1159764 ?auto_1159765 ?auto_1159766 )
      ( MAKE-13CRATE-VERIFY ?auto_1159753 ?auto_1159754 ?auto_1159755 ?auto_1159757 ?auto_1159756 ?auto_1159758 ?auto_1159759 ?auto_1159760 ?auto_1159761 ?auto_1159762 ?auto_1159763 ?auto_1159764 ?auto_1159765 ?auto_1159766 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1159936 - SURFACE
      ?auto_1159937 - SURFACE
      ?auto_1159938 - SURFACE
      ?auto_1159940 - SURFACE
      ?auto_1159939 - SURFACE
      ?auto_1159941 - SURFACE
      ?auto_1159942 - SURFACE
      ?auto_1159943 - SURFACE
      ?auto_1159944 - SURFACE
      ?auto_1159945 - SURFACE
      ?auto_1159946 - SURFACE
      ?auto_1159947 - SURFACE
      ?auto_1159948 - SURFACE
      ?auto_1159949 - SURFACE
    )
    :vars
    (
      ?auto_1159951 - HOIST
      ?auto_1159954 - PLACE
      ?auto_1159955 - PLACE
      ?auto_1159952 - HOIST
      ?auto_1159950 - SURFACE
      ?auto_1159953 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1159951 ?auto_1159954 ) ( IS-CRATE ?auto_1159949 ) ( not ( = ?auto_1159948 ?auto_1159949 ) ) ( not ( = ?auto_1159947 ?auto_1159948 ) ) ( not ( = ?auto_1159947 ?auto_1159949 ) ) ( not ( = ?auto_1159955 ?auto_1159954 ) ) ( HOIST-AT ?auto_1159952 ?auto_1159955 ) ( not ( = ?auto_1159951 ?auto_1159952 ) ) ( AVAILABLE ?auto_1159952 ) ( SURFACE-AT ?auto_1159949 ?auto_1159955 ) ( ON ?auto_1159949 ?auto_1159950 ) ( CLEAR ?auto_1159949 ) ( not ( = ?auto_1159948 ?auto_1159950 ) ) ( not ( = ?auto_1159949 ?auto_1159950 ) ) ( not ( = ?auto_1159947 ?auto_1159950 ) ) ( TRUCK-AT ?auto_1159953 ?auto_1159954 ) ( SURFACE-AT ?auto_1159947 ?auto_1159954 ) ( CLEAR ?auto_1159947 ) ( IS-CRATE ?auto_1159948 ) ( AVAILABLE ?auto_1159951 ) ( IN ?auto_1159948 ?auto_1159953 ) ( ON ?auto_1159937 ?auto_1159936 ) ( ON ?auto_1159938 ?auto_1159937 ) ( ON ?auto_1159940 ?auto_1159938 ) ( ON ?auto_1159939 ?auto_1159940 ) ( ON ?auto_1159941 ?auto_1159939 ) ( ON ?auto_1159942 ?auto_1159941 ) ( ON ?auto_1159943 ?auto_1159942 ) ( ON ?auto_1159944 ?auto_1159943 ) ( ON ?auto_1159945 ?auto_1159944 ) ( ON ?auto_1159946 ?auto_1159945 ) ( ON ?auto_1159947 ?auto_1159946 ) ( not ( = ?auto_1159936 ?auto_1159937 ) ) ( not ( = ?auto_1159936 ?auto_1159938 ) ) ( not ( = ?auto_1159936 ?auto_1159940 ) ) ( not ( = ?auto_1159936 ?auto_1159939 ) ) ( not ( = ?auto_1159936 ?auto_1159941 ) ) ( not ( = ?auto_1159936 ?auto_1159942 ) ) ( not ( = ?auto_1159936 ?auto_1159943 ) ) ( not ( = ?auto_1159936 ?auto_1159944 ) ) ( not ( = ?auto_1159936 ?auto_1159945 ) ) ( not ( = ?auto_1159936 ?auto_1159946 ) ) ( not ( = ?auto_1159936 ?auto_1159947 ) ) ( not ( = ?auto_1159936 ?auto_1159948 ) ) ( not ( = ?auto_1159936 ?auto_1159949 ) ) ( not ( = ?auto_1159936 ?auto_1159950 ) ) ( not ( = ?auto_1159937 ?auto_1159938 ) ) ( not ( = ?auto_1159937 ?auto_1159940 ) ) ( not ( = ?auto_1159937 ?auto_1159939 ) ) ( not ( = ?auto_1159937 ?auto_1159941 ) ) ( not ( = ?auto_1159937 ?auto_1159942 ) ) ( not ( = ?auto_1159937 ?auto_1159943 ) ) ( not ( = ?auto_1159937 ?auto_1159944 ) ) ( not ( = ?auto_1159937 ?auto_1159945 ) ) ( not ( = ?auto_1159937 ?auto_1159946 ) ) ( not ( = ?auto_1159937 ?auto_1159947 ) ) ( not ( = ?auto_1159937 ?auto_1159948 ) ) ( not ( = ?auto_1159937 ?auto_1159949 ) ) ( not ( = ?auto_1159937 ?auto_1159950 ) ) ( not ( = ?auto_1159938 ?auto_1159940 ) ) ( not ( = ?auto_1159938 ?auto_1159939 ) ) ( not ( = ?auto_1159938 ?auto_1159941 ) ) ( not ( = ?auto_1159938 ?auto_1159942 ) ) ( not ( = ?auto_1159938 ?auto_1159943 ) ) ( not ( = ?auto_1159938 ?auto_1159944 ) ) ( not ( = ?auto_1159938 ?auto_1159945 ) ) ( not ( = ?auto_1159938 ?auto_1159946 ) ) ( not ( = ?auto_1159938 ?auto_1159947 ) ) ( not ( = ?auto_1159938 ?auto_1159948 ) ) ( not ( = ?auto_1159938 ?auto_1159949 ) ) ( not ( = ?auto_1159938 ?auto_1159950 ) ) ( not ( = ?auto_1159940 ?auto_1159939 ) ) ( not ( = ?auto_1159940 ?auto_1159941 ) ) ( not ( = ?auto_1159940 ?auto_1159942 ) ) ( not ( = ?auto_1159940 ?auto_1159943 ) ) ( not ( = ?auto_1159940 ?auto_1159944 ) ) ( not ( = ?auto_1159940 ?auto_1159945 ) ) ( not ( = ?auto_1159940 ?auto_1159946 ) ) ( not ( = ?auto_1159940 ?auto_1159947 ) ) ( not ( = ?auto_1159940 ?auto_1159948 ) ) ( not ( = ?auto_1159940 ?auto_1159949 ) ) ( not ( = ?auto_1159940 ?auto_1159950 ) ) ( not ( = ?auto_1159939 ?auto_1159941 ) ) ( not ( = ?auto_1159939 ?auto_1159942 ) ) ( not ( = ?auto_1159939 ?auto_1159943 ) ) ( not ( = ?auto_1159939 ?auto_1159944 ) ) ( not ( = ?auto_1159939 ?auto_1159945 ) ) ( not ( = ?auto_1159939 ?auto_1159946 ) ) ( not ( = ?auto_1159939 ?auto_1159947 ) ) ( not ( = ?auto_1159939 ?auto_1159948 ) ) ( not ( = ?auto_1159939 ?auto_1159949 ) ) ( not ( = ?auto_1159939 ?auto_1159950 ) ) ( not ( = ?auto_1159941 ?auto_1159942 ) ) ( not ( = ?auto_1159941 ?auto_1159943 ) ) ( not ( = ?auto_1159941 ?auto_1159944 ) ) ( not ( = ?auto_1159941 ?auto_1159945 ) ) ( not ( = ?auto_1159941 ?auto_1159946 ) ) ( not ( = ?auto_1159941 ?auto_1159947 ) ) ( not ( = ?auto_1159941 ?auto_1159948 ) ) ( not ( = ?auto_1159941 ?auto_1159949 ) ) ( not ( = ?auto_1159941 ?auto_1159950 ) ) ( not ( = ?auto_1159942 ?auto_1159943 ) ) ( not ( = ?auto_1159942 ?auto_1159944 ) ) ( not ( = ?auto_1159942 ?auto_1159945 ) ) ( not ( = ?auto_1159942 ?auto_1159946 ) ) ( not ( = ?auto_1159942 ?auto_1159947 ) ) ( not ( = ?auto_1159942 ?auto_1159948 ) ) ( not ( = ?auto_1159942 ?auto_1159949 ) ) ( not ( = ?auto_1159942 ?auto_1159950 ) ) ( not ( = ?auto_1159943 ?auto_1159944 ) ) ( not ( = ?auto_1159943 ?auto_1159945 ) ) ( not ( = ?auto_1159943 ?auto_1159946 ) ) ( not ( = ?auto_1159943 ?auto_1159947 ) ) ( not ( = ?auto_1159943 ?auto_1159948 ) ) ( not ( = ?auto_1159943 ?auto_1159949 ) ) ( not ( = ?auto_1159943 ?auto_1159950 ) ) ( not ( = ?auto_1159944 ?auto_1159945 ) ) ( not ( = ?auto_1159944 ?auto_1159946 ) ) ( not ( = ?auto_1159944 ?auto_1159947 ) ) ( not ( = ?auto_1159944 ?auto_1159948 ) ) ( not ( = ?auto_1159944 ?auto_1159949 ) ) ( not ( = ?auto_1159944 ?auto_1159950 ) ) ( not ( = ?auto_1159945 ?auto_1159946 ) ) ( not ( = ?auto_1159945 ?auto_1159947 ) ) ( not ( = ?auto_1159945 ?auto_1159948 ) ) ( not ( = ?auto_1159945 ?auto_1159949 ) ) ( not ( = ?auto_1159945 ?auto_1159950 ) ) ( not ( = ?auto_1159946 ?auto_1159947 ) ) ( not ( = ?auto_1159946 ?auto_1159948 ) ) ( not ( = ?auto_1159946 ?auto_1159949 ) ) ( not ( = ?auto_1159946 ?auto_1159950 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1159947 ?auto_1159948 ?auto_1159949 )
      ( MAKE-13CRATE-VERIFY ?auto_1159936 ?auto_1159937 ?auto_1159938 ?auto_1159940 ?auto_1159939 ?auto_1159941 ?auto_1159942 ?auto_1159943 ?auto_1159944 ?auto_1159945 ?auto_1159946 ?auto_1159947 ?auto_1159948 ?auto_1159949 ) )
  )

)

