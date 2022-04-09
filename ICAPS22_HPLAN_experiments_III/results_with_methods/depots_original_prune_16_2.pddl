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

  ( :method MAKE-14CRATE-VERIFY
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
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-15CRATE-VERIFY
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
      ?c14 - SURFACE
      ?c15 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( CLEAR ?c15 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-16CRATE-VERIFY
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
      ?c14 - SURFACE
      ?c15 - SURFACE
      ?c16 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( ON ?c16 ?c15 ) ( CLEAR ?c16 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392115 - SURFACE
      ?auto_2392116 - SURFACE
    )
    :vars
    (
      ?auto_2392117 - HOIST
      ?auto_2392118 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392117 ?auto_2392118 ) ( SURFACE-AT ?auto_2392115 ?auto_2392118 ) ( CLEAR ?auto_2392115 ) ( LIFTING ?auto_2392117 ?auto_2392116 ) ( IS-CRATE ?auto_2392116 ) ( not ( = ?auto_2392115 ?auto_2392116 ) ) )
    :subtasks
    ( ( !DROP ?auto_2392117 ?auto_2392116 ?auto_2392115 ?auto_2392118 )
      ( MAKE-1CRATE-VERIFY ?auto_2392115 ?auto_2392116 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392119 - SURFACE
      ?auto_2392120 - SURFACE
    )
    :vars
    (
      ?auto_2392122 - HOIST
      ?auto_2392121 - PLACE
      ?auto_2392123 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392122 ?auto_2392121 ) ( SURFACE-AT ?auto_2392119 ?auto_2392121 ) ( CLEAR ?auto_2392119 ) ( IS-CRATE ?auto_2392120 ) ( not ( = ?auto_2392119 ?auto_2392120 ) ) ( TRUCK-AT ?auto_2392123 ?auto_2392121 ) ( AVAILABLE ?auto_2392122 ) ( IN ?auto_2392120 ?auto_2392123 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2392122 ?auto_2392120 ?auto_2392123 ?auto_2392121 )
      ( MAKE-1CRATE ?auto_2392119 ?auto_2392120 )
      ( MAKE-1CRATE-VERIFY ?auto_2392119 ?auto_2392120 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392124 - SURFACE
      ?auto_2392125 - SURFACE
    )
    :vars
    (
      ?auto_2392128 - HOIST
      ?auto_2392127 - PLACE
      ?auto_2392126 - TRUCK
      ?auto_2392129 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392128 ?auto_2392127 ) ( SURFACE-AT ?auto_2392124 ?auto_2392127 ) ( CLEAR ?auto_2392124 ) ( IS-CRATE ?auto_2392125 ) ( not ( = ?auto_2392124 ?auto_2392125 ) ) ( AVAILABLE ?auto_2392128 ) ( IN ?auto_2392125 ?auto_2392126 ) ( TRUCK-AT ?auto_2392126 ?auto_2392129 ) ( not ( = ?auto_2392129 ?auto_2392127 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2392126 ?auto_2392129 ?auto_2392127 )
      ( MAKE-1CRATE ?auto_2392124 ?auto_2392125 )
      ( MAKE-1CRATE-VERIFY ?auto_2392124 ?auto_2392125 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392130 - SURFACE
      ?auto_2392131 - SURFACE
    )
    :vars
    (
      ?auto_2392135 - HOIST
      ?auto_2392132 - PLACE
      ?auto_2392134 - TRUCK
      ?auto_2392133 - PLACE
      ?auto_2392136 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392135 ?auto_2392132 ) ( SURFACE-AT ?auto_2392130 ?auto_2392132 ) ( CLEAR ?auto_2392130 ) ( IS-CRATE ?auto_2392131 ) ( not ( = ?auto_2392130 ?auto_2392131 ) ) ( AVAILABLE ?auto_2392135 ) ( TRUCK-AT ?auto_2392134 ?auto_2392133 ) ( not ( = ?auto_2392133 ?auto_2392132 ) ) ( HOIST-AT ?auto_2392136 ?auto_2392133 ) ( LIFTING ?auto_2392136 ?auto_2392131 ) ( not ( = ?auto_2392135 ?auto_2392136 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2392136 ?auto_2392131 ?auto_2392134 ?auto_2392133 )
      ( MAKE-1CRATE ?auto_2392130 ?auto_2392131 )
      ( MAKE-1CRATE-VERIFY ?auto_2392130 ?auto_2392131 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392137 - SURFACE
      ?auto_2392138 - SURFACE
    )
    :vars
    (
      ?auto_2392141 - HOIST
      ?auto_2392140 - PLACE
      ?auto_2392139 - TRUCK
      ?auto_2392142 - PLACE
      ?auto_2392143 - HOIST
      ?auto_2392144 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392141 ?auto_2392140 ) ( SURFACE-AT ?auto_2392137 ?auto_2392140 ) ( CLEAR ?auto_2392137 ) ( IS-CRATE ?auto_2392138 ) ( not ( = ?auto_2392137 ?auto_2392138 ) ) ( AVAILABLE ?auto_2392141 ) ( TRUCK-AT ?auto_2392139 ?auto_2392142 ) ( not ( = ?auto_2392142 ?auto_2392140 ) ) ( HOIST-AT ?auto_2392143 ?auto_2392142 ) ( not ( = ?auto_2392141 ?auto_2392143 ) ) ( AVAILABLE ?auto_2392143 ) ( SURFACE-AT ?auto_2392138 ?auto_2392142 ) ( ON ?auto_2392138 ?auto_2392144 ) ( CLEAR ?auto_2392138 ) ( not ( = ?auto_2392137 ?auto_2392144 ) ) ( not ( = ?auto_2392138 ?auto_2392144 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2392143 ?auto_2392138 ?auto_2392144 ?auto_2392142 )
      ( MAKE-1CRATE ?auto_2392137 ?auto_2392138 )
      ( MAKE-1CRATE-VERIFY ?auto_2392137 ?auto_2392138 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392145 - SURFACE
      ?auto_2392146 - SURFACE
    )
    :vars
    (
      ?auto_2392150 - HOIST
      ?auto_2392147 - PLACE
      ?auto_2392148 - PLACE
      ?auto_2392151 - HOIST
      ?auto_2392149 - SURFACE
      ?auto_2392152 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392150 ?auto_2392147 ) ( SURFACE-AT ?auto_2392145 ?auto_2392147 ) ( CLEAR ?auto_2392145 ) ( IS-CRATE ?auto_2392146 ) ( not ( = ?auto_2392145 ?auto_2392146 ) ) ( AVAILABLE ?auto_2392150 ) ( not ( = ?auto_2392148 ?auto_2392147 ) ) ( HOIST-AT ?auto_2392151 ?auto_2392148 ) ( not ( = ?auto_2392150 ?auto_2392151 ) ) ( AVAILABLE ?auto_2392151 ) ( SURFACE-AT ?auto_2392146 ?auto_2392148 ) ( ON ?auto_2392146 ?auto_2392149 ) ( CLEAR ?auto_2392146 ) ( not ( = ?auto_2392145 ?auto_2392149 ) ) ( not ( = ?auto_2392146 ?auto_2392149 ) ) ( TRUCK-AT ?auto_2392152 ?auto_2392147 ) )
    :subtasks
    ( ( !DRIVE ?auto_2392152 ?auto_2392147 ?auto_2392148 )
      ( MAKE-1CRATE ?auto_2392145 ?auto_2392146 )
      ( MAKE-1CRATE-VERIFY ?auto_2392145 ?auto_2392146 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2392162 - SURFACE
      ?auto_2392163 - SURFACE
      ?auto_2392164 - SURFACE
    )
    :vars
    (
      ?auto_2392166 - HOIST
      ?auto_2392165 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392166 ?auto_2392165 ) ( SURFACE-AT ?auto_2392163 ?auto_2392165 ) ( CLEAR ?auto_2392163 ) ( LIFTING ?auto_2392166 ?auto_2392164 ) ( IS-CRATE ?auto_2392164 ) ( not ( = ?auto_2392163 ?auto_2392164 ) ) ( ON ?auto_2392163 ?auto_2392162 ) ( not ( = ?auto_2392162 ?auto_2392163 ) ) ( not ( = ?auto_2392162 ?auto_2392164 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2392163 ?auto_2392164 )
      ( MAKE-2CRATE-VERIFY ?auto_2392162 ?auto_2392163 ?auto_2392164 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2392172 - SURFACE
      ?auto_2392173 - SURFACE
      ?auto_2392174 - SURFACE
    )
    :vars
    (
      ?auto_2392175 - HOIST
      ?auto_2392176 - PLACE
      ?auto_2392177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392175 ?auto_2392176 ) ( SURFACE-AT ?auto_2392173 ?auto_2392176 ) ( CLEAR ?auto_2392173 ) ( IS-CRATE ?auto_2392174 ) ( not ( = ?auto_2392173 ?auto_2392174 ) ) ( TRUCK-AT ?auto_2392177 ?auto_2392176 ) ( AVAILABLE ?auto_2392175 ) ( IN ?auto_2392174 ?auto_2392177 ) ( ON ?auto_2392173 ?auto_2392172 ) ( not ( = ?auto_2392172 ?auto_2392173 ) ) ( not ( = ?auto_2392172 ?auto_2392174 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2392173 ?auto_2392174 )
      ( MAKE-2CRATE-VERIFY ?auto_2392172 ?auto_2392173 ?auto_2392174 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392178 - SURFACE
      ?auto_2392179 - SURFACE
    )
    :vars
    (
      ?auto_2392180 - HOIST
      ?auto_2392183 - PLACE
      ?auto_2392182 - TRUCK
      ?auto_2392181 - SURFACE
      ?auto_2392184 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392180 ?auto_2392183 ) ( SURFACE-AT ?auto_2392178 ?auto_2392183 ) ( CLEAR ?auto_2392178 ) ( IS-CRATE ?auto_2392179 ) ( not ( = ?auto_2392178 ?auto_2392179 ) ) ( AVAILABLE ?auto_2392180 ) ( IN ?auto_2392179 ?auto_2392182 ) ( ON ?auto_2392178 ?auto_2392181 ) ( not ( = ?auto_2392181 ?auto_2392178 ) ) ( not ( = ?auto_2392181 ?auto_2392179 ) ) ( TRUCK-AT ?auto_2392182 ?auto_2392184 ) ( not ( = ?auto_2392184 ?auto_2392183 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2392182 ?auto_2392184 ?auto_2392183 )
      ( MAKE-2CRATE ?auto_2392181 ?auto_2392178 ?auto_2392179 )
      ( MAKE-1CRATE-VERIFY ?auto_2392178 ?auto_2392179 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2392185 - SURFACE
      ?auto_2392186 - SURFACE
      ?auto_2392187 - SURFACE
    )
    :vars
    (
      ?auto_2392189 - HOIST
      ?auto_2392191 - PLACE
      ?auto_2392190 - TRUCK
      ?auto_2392188 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392189 ?auto_2392191 ) ( SURFACE-AT ?auto_2392186 ?auto_2392191 ) ( CLEAR ?auto_2392186 ) ( IS-CRATE ?auto_2392187 ) ( not ( = ?auto_2392186 ?auto_2392187 ) ) ( AVAILABLE ?auto_2392189 ) ( IN ?auto_2392187 ?auto_2392190 ) ( ON ?auto_2392186 ?auto_2392185 ) ( not ( = ?auto_2392185 ?auto_2392186 ) ) ( not ( = ?auto_2392185 ?auto_2392187 ) ) ( TRUCK-AT ?auto_2392190 ?auto_2392188 ) ( not ( = ?auto_2392188 ?auto_2392191 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2392186 ?auto_2392187 )
      ( MAKE-2CRATE-VERIFY ?auto_2392185 ?auto_2392186 ?auto_2392187 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392192 - SURFACE
      ?auto_2392193 - SURFACE
    )
    :vars
    (
      ?auto_2392197 - HOIST
      ?auto_2392196 - PLACE
      ?auto_2392195 - SURFACE
      ?auto_2392194 - TRUCK
      ?auto_2392198 - PLACE
      ?auto_2392199 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392197 ?auto_2392196 ) ( SURFACE-AT ?auto_2392192 ?auto_2392196 ) ( CLEAR ?auto_2392192 ) ( IS-CRATE ?auto_2392193 ) ( not ( = ?auto_2392192 ?auto_2392193 ) ) ( AVAILABLE ?auto_2392197 ) ( ON ?auto_2392192 ?auto_2392195 ) ( not ( = ?auto_2392195 ?auto_2392192 ) ) ( not ( = ?auto_2392195 ?auto_2392193 ) ) ( TRUCK-AT ?auto_2392194 ?auto_2392198 ) ( not ( = ?auto_2392198 ?auto_2392196 ) ) ( HOIST-AT ?auto_2392199 ?auto_2392198 ) ( LIFTING ?auto_2392199 ?auto_2392193 ) ( not ( = ?auto_2392197 ?auto_2392199 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2392199 ?auto_2392193 ?auto_2392194 ?auto_2392198 )
      ( MAKE-2CRATE ?auto_2392195 ?auto_2392192 ?auto_2392193 )
      ( MAKE-1CRATE-VERIFY ?auto_2392192 ?auto_2392193 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2392200 - SURFACE
      ?auto_2392201 - SURFACE
      ?auto_2392202 - SURFACE
    )
    :vars
    (
      ?auto_2392205 - HOIST
      ?auto_2392203 - PLACE
      ?auto_2392204 - TRUCK
      ?auto_2392206 - PLACE
      ?auto_2392207 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392205 ?auto_2392203 ) ( SURFACE-AT ?auto_2392201 ?auto_2392203 ) ( CLEAR ?auto_2392201 ) ( IS-CRATE ?auto_2392202 ) ( not ( = ?auto_2392201 ?auto_2392202 ) ) ( AVAILABLE ?auto_2392205 ) ( ON ?auto_2392201 ?auto_2392200 ) ( not ( = ?auto_2392200 ?auto_2392201 ) ) ( not ( = ?auto_2392200 ?auto_2392202 ) ) ( TRUCK-AT ?auto_2392204 ?auto_2392206 ) ( not ( = ?auto_2392206 ?auto_2392203 ) ) ( HOIST-AT ?auto_2392207 ?auto_2392206 ) ( LIFTING ?auto_2392207 ?auto_2392202 ) ( not ( = ?auto_2392205 ?auto_2392207 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2392201 ?auto_2392202 )
      ( MAKE-2CRATE-VERIFY ?auto_2392200 ?auto_2392201 ?auto_2392202 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392208 - SURFACE
      ?auto_2392209 - SURFACE
    )
    :vars
    (
      ?auto_2392215 - HOIST
      ?auto_2392212 - PLACE
      ?auto_2392214 - SURFACE
      ?auto_2392213 - TRUCK
      ?auto_2392211 - PLACE
      ?auto_2392210 - HOIST
      ?auto_2392216 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392215 ?auto_2392212 ) ( SURFACE-AT ?auto_2392208 ?auto_2392212 ) ( CLEAR ?auto_2392208 ) ( IS-CRATE ?auto_2392209 ) ( not ( = ?auto_2392208 ?auto_2392209 ) ) ( AVAILABLE ?auto_2392215 ) ( ON ?auto_2392208 ?auto_2392214 ) ( not ( = ?auto_2392214 ?auto_2392208 ) ) ( not ( = ?auto_2392214 ?auto_2392209 ) ) ( TRUCK-AT ?auto_2392213 ?auto_2392211 ) ( not ( = ?auto_2392211 ?auto_2392212 ) ) ( HOIST-AT ?auto_2392210 ?auto_2392211 ) ( not ( = ?auto_2392215 ?auto_2392210 ) ) ( AVAILABLE ?auto_2392210 ) ( SURFACE-AT ?auto_2392209 ?auto_2392211 ) ( ON ?auto_2392209 ?auto_2392216 ) ( CLEAR ?auto_2392209 ) ( not ( = ?auto_2392208 ?auto_2392216 ) ) ( not ( = ?auto_2392209 ?auto_2392216 ) ) ( not ( = ?auto_2392214 ?auto_2392216 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2392210 ?auto_2392209 ?auto_2392216 ?auto_2392211 )
      ( MAKE-2CRATE ?auto_2392214 ?auto_2392208 ?auto_2392209 )
      ( MAKE-1CRATE-VERIFY ?auto_2392208 ?auto_2392209 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2392217 - SURFACE
      ?auto_2392218 - SURFACE
      ?auto_2392219 - SURFACE
    )
    :vars
    (
      ?auto_2392221 - HOIST
      ?auto_2392223 - PLACE
      ?auto_2392224 - TRUCK
      ?auto_2392220 - PLACE
      ?auto_2392222 - HOIST
      ?auto_2392225 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392221 ?auto_2392223 ) ( SURFACE-AT ?auto_2392218 ?auto_2392223 ) ( CLEAR ?auto_2392218 ) ( IS-CRATE ?auto_2392219 ) ( not ( = ?auto_2392218 ?auto_2392219 ) ) ( AVAILABLE ?auto_2392221 ) ( ON ?auto_2392218 ?auto_2392217 ) ( not ( = ?auto_2392217 ?auto_2392218 ) ) ( not ( = ?auto_2392217 ?auto_2392219 ) ) ( TRUCK-AT ?auto_2392224 ?auto_2392220 ) ( not ( = ?auto_2392220 ?auto_2392223 ) ) ( HOIST-AT ?auto_2392222 ?auto_2392220 ) ( not ( = ?auto_2392221 ?auto_2392222 ) ) ( AVAILABLE ?auto_2392222 ) ( SURFACE-AT ?auto_2392219 ?auto_2392220 ) ( ON ?auto_2392219 ?auto_2392225 ) ( CLEAR ?auto_2392219 ) ( not ( = ?auto_2392218 ?auto_2392225 ) ) ( not ( = ?auto_2392219 ?auto_2392225 ) ) ( not ( = ?auto_2392217 ?auto_2392225 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2392218 ?auto_2392219 )
      ( MAKE-2CRATE-VERIFY ?auto_2392217 ?auto_2392218 ?auto_2392219 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392226 - SURFACE
      ?auto_2392227 - SURFACE
    )
    :vars
    (
      ?auto_2392232 - HOIST
      ?auto_2392229 - PLACE
      ?auto_2392233 - SURFACE
      ?auto_2392231 - PLACE
      ?auto_2392228 - HOIST
      ?auto_2392234 - SURFACE
      ?auto_2392230 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392232 ?auto_2392229 ) ( SURFACE-AT ?auto_2392226 ?auto_2392229 ) ( CLEAR ?auto_2392226 ) ( IS-CRATE ?auto_2392227 ) ( not ( = ?auto_2392226 ?auto_2392227 ) ) ( AVAILABLE ?auto_2392232 ) ( ON ?auto_2392226 ?auto_2392233 ) ( not ( = ?auto_2392233 ?auto_2392226 ) ) ( not ( = ?auto_2392233 ?auto_2392227 ) ) ( not ( = ?auto_2392231 ?auto_2392229 ) ) ( HOIST-AT ?auto_2392228 ?auto_2392231 ) ( not ( = ?auto_2392232 ?auto_2392228 ) ) ( AVAILABLE ?auto_2392228 ) ( SURFACE-AT ?auto_2392227 ?auto_2392231 ) ( ON ?auto_2392227 ?auto_2392234 ) ( CLEAR ?auto_2392227 ) ( not ( = ?auto_2392226 ?auto_2392234 ) ) ( not ( = ?auto_2392227 ?auto_2392234 ) ) ( not ( = ?auto_2392233 ?auto_2392234 ) ) ( TRUCK-AT ?auto_2392230 ?auto_2392229 ) )
    :subtasks
    ( ( !DRIVE ?auto_2392230 ?auto_2392229 ?auto_2392231 )
      ( MAKE-2CRATE ?auto_2392233 ?auto_2392226 ?auto_2392227 )
      ( MAKE-1CRATE-VERIFY ?auto_2392226 ?auto_2392227 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2392235 - SURFACE
      ?auto_2392236 - SURFACE
      ?auto_2392237 - SURFACE
    )
    :vars
    (
      ?auto_2392242 - HOIST
      ?auto_2392239 - PLACE
      ?auto_2392240 - PLACE
      ?auto_2392238 - HOIST
      ?auto_2392243 - SURFACE
      ?auto_2392241 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392242 ?auto_2392239 ) ( SURFACE-AT ?auto_2392236 ?auto_2392239 ) ( CLEAR ?auto_2392236 ) ( IS-CRATE ?auto_2392237 ) ( not ( = ?auto_2392236 ?auto_2392237 ) ) ( AVAILABLE ?auto_2392242 ) ( ON ?auto_2392236 ?auto_2392235 ) ( not ( = ?auto_2392235 ?auto_2392236 ) ) ( not ( = ?auto_2392235 ?auto_2392237 ) ) ( not ( = ?auto_2392240 ?auto_2392239 ) ) ( HOIST-AT ?auto_2392238 ?auto_2392240 ) ( not ( = ?auto_2392242 ?auto_2392238 ) ) ( AVAILABLE ?auto_2392238 ) ( SURFACE-AT ?auto_2392237 ?auto_2392240 ) ( ON ?auto_2392237 ?auto_2392243 ) ( CLEAR ?auto_2392237 ) ( not ( = ?auto_2392236 ?auto_2392243 ) ) ( not ( = ?auto_2392237 ?auto_2392243 ) ) ( not ( = ?auto_2392235 ?auto_2392243 ) ) ( TRUCK-AT ?auto_2392241 ?auto_2392239 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2392236 ?auto_2392237 )
      ( MAKE-2CRATE-VERIFY ?auto_2392235 ?auto_2392236 ?auto_2392237 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392244 - SURFACE
      ?auto_2392245 - SURFACE
    )
    :vars
    (
      ?auto_2392248 - HOIST
      ?auto_2392249 - PLACE
      ?auto_2392251 - SURFACE
      ?auto_2392247 - PLACE
      ?auto_2392246 - HOIST
      ?auto_2392250 - SURFACE
      ?auto_2392252 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392248 ?auto_2392249 ) ( IS-CRATE ?auto_2392245 ) ( not ( = ?auto_2392244 ?auto_2392245 ) ) ( not ( = ?auto_2392251 ?auto_2392244 ) ) ( not ( = ?auto_2392251 ?auto_2392245 ) ) ( not ( = ?auto_2392247 ?auto_2392249 ) ) ( HOIST-AT ?auto_2392246 ?auto_2392247 ) ( not ( = ?auto_2392248 ?auto_2392246 ) ) ( AVAILABLE ?auto_2392246 ) ( SURFACE-AT ?auto_2392245 ?auto_2392247 ) ( ON ?auto_2392245 ?auto_2392250 ) ( CLEAR ?auto_2392245 ) ( not ( = ?auto_2392244 ?auto_2392250 ) ) ( not ( = ?auto_2392245 ?auto_2392250 ) ) ( not ( = ?auto_2392251 ?auto_2392250 ) ) ( TRUCK-AT ?auto_2392252 ?auto_2392249 ) ( SURFACE-AT ?auto_2392251 ?auto_2392249 ) ( CLEAR ?auto_2392251 ) ( LIFTING ?auto_2392248 ?auto_2392244 ) ( IS-CRATE ?auto_2392244 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2392251 ?auto_2392244 )
      ( MAKE-2CRATE ?auto_2392251 ?auto_2392244 ?auto_2392245 )
      ( MAKE-1CRATE-VERIFY ?auto_2392244 ?auto_2392245 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2392253 - SURFACE
      ?auto_2392254 - SURFACE
      ?auto_2392255 - SURFACE
    )
    :vars
    (
      ?auto_2392258 - HOIST
      ?auto_2392260 - PLACE
      ?auto_2392259 - PLACE
      ?auto_2392261 - HOIST
      ?auto_2392257 - SURFACE
      ?auto_2392256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392258 ?auto_2392260 ) ( IS-CRATE ?auto_2392255 ) ( not ( = ?auto_2392254 ?auto_2392255 ) ) ( not ( = ?auto_2392253 ?auto_2392254 ) ) ( not ( = ?auto_2392253 ?auto_2392255 ) ) ( not ( = ?auto_2392259 ?auto_2392260 ) ) ( HOIST-AT ?auto_2392261 ?auto_2392259 ) ( not ( = ?auto_2392258 ?auto_2392261 ) ) ( AVAILABLE ?auto_2392261 ) ( SURFACE-AT ?auto_2392255 ?auto_2392259 ) ( ON ?auto_2392255 ?auto_2392257 ) ( CLEAR ?auto_2392255 ) ( not ( = ?auto_2392254 ?auto_2392257 ) ) ( not ( = ?auto_2392255 ?auto_2392257 ) ) ( not ( = ?auto_2392253 ?auto_2392257 ) ) ( TRUCK-AT ?auto_2392256 ?auto_2392260 ) ( SURFACE-AT ?auto_2392253 ?auto_2392260 ) ( CLEAR ?auto_2392253 ) ( LIFTING ?auto_2392258 ?auto_2392254 ) ( IS-CRATE ?auto_2392254 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2392254 ?auto_2392255 )
      ( MAKE-2CRATE-VERIFY ?auto_2392253 ?auto_2392254 ?auto_2392255 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392262 - SURFACE
      ?auto_2392263 - SURFACE
    )
    :vars
    (
      ?auto_2392265 - HOIST
      ?auto_2392267 - PLACE
      ?auto_2392266 - SURFACE
      ?auto_2392269 - PLACE
      ?auto_2392264 - HOIST
      ?auto_2392270 - SURFACE
      ?auto_2392268 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392265 ?auto_2392267 ) ( IS-CRATE ?auto_2392263 ) ( not ( = ?auto_2392262 ?auto_2392263 ) ) ( not ( = ?auto_2392266 ?auto_2392262 ) ) ( not ( = ?auto_2392266 ?auto_2392263 ) ) ( not ( = ?auto_2392269 ?auto_2392267 ) ) ( HOIST-AT ?auto_2392264 ?auto_2392269 ) ( not ( = ?auto_2392265 ?auto_2392264 ) ) ( AVAILABLE ?auto_2392264 ) ( SURFACE-AT ?auto_2392263 ?auto_2392269 ) ( ON ?auto_2392263 ?auto_2392270 ) ( CLEAR ?auto_2392263 ) ( not ( = ?auto_2392262 ?auto_2392270 ) ) ( not ( = ?auto_2392263 ?auto_2392270 ) ) ( not ( = ?auto_2392266 ?auto_2392270 ) ) ( TRUCK-AT ?auto_2392268 ?auto_2392267 ) ( SURFACE-AT ?auto_2392266 ?auto_2392267 ) ( CLEAR ?auto_2392266 ) ( IS-CRATE ?auto_2392262 ) ( AVAILABLE ?auto_2392265 ) ( IN ?auto_2392262 ?auto_2392268 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2392265 ?auto_2392262 ?auto_2392268 ?auto_2392267 )
      ( MAKE-2CRATE ?auto_2392266 ?auto_2392262 ?auto_2392263 )
      ( MAKE-1CRATE-VERIFY ?auto_2392262 ?auto_2392263 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2392271 - SURFACE
      ?auto_2392272 - SURFACE
      ?auto_2392273 - SURFACE
    )
    :vars
    (
      ?auto_2392276 - HOIST
      ?auto_2392278 - PLACE
      ?auto_2392279 - PLACE
      ?auto_2392275 - HOIST
      ?auto_2392277 - SURFACE
      ?auto_2392274 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392276 ?auto_2392278 ) ( IS-CRATE ?auto_2392273 ) ( not ( = ?auto_2392272 ?auto_2392273 ) ) ( not ( = ?auto_2392271 ?auto_2392272 ) ) ( not ( = ?auto_2392271 ?auto_2392273 ) ) ( not ( = ?auto_2392279 ?auto_2392278 ) ) ( HOIST-AT ?auto_2392275 ?auto_2392279 ) ( not ( = ?auto_2392276 ?auto_2392275 ) ) ( AVAILABLE ?auto_2392275 ) ( SURFACE-AT ?auto_2392273 ?auto_2392279 ) ( ON ?auto_2392273 ?auto_2392277 ) ( CLEAR ?auto_2392273 ) ( not ( = ?auto_2392272 ?auto_2392277 ) ) ( not ( = ?auto_2392273 ?auto_2392277 ) ) ( not ( = ?auto_2392271 ?auto_2392277 ) ) ( TRUCK-AT ?auto_2392274 ?auto_2392278 ) ( SURFACE-AT ?auto_2392271 ?auto_2392278 ) ( CLEAR ?auto_2392271 ) ( IS-CRATE ?auto_2392272 ) ( AVAILABLE ?auto_2392276 ) ( IN ?auto_2392272 ?auto_2392274 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2392272 ?auto_2392273 )
      ( MAKE-2CRATE-VERIFY ?auto_2392271 ?auto_2392272 ?auto_2392273 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392316 - SURFACE
      ?auto_2392317 - SURFACE
    )
    :vars
    (
      ?auto_2392318 - HOIST
      ?auto_2392321 - PLACE
      ?auto_2392323 - SURFACE
      ?auto_2392322 - PLACE
      ?auto_2392324 - HOIST
      ?auto_2392319 - SURFACE
      ?auto_2392320 - TRUCK
      ?auto_2392325 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392318 ?auto_2392321 ) ( SURFACE-AT ?auto_2392316 ?auto_2392321 ) ( CLEAR ?auto_2392316 ) ( IS-CRATE ?auto_2392317 ) ( not ( = ?auto_2392316 ?auto_2392317 ) ) ( AVAILABLE ?auto_2392318 ) ( ON ?auto_2392316 ?auto_2392323 ) ( not ( = ?auto_2392323 ?auto_2392316 ) ) ( not ( = ?auto_2392323 ?auto_2392317 ) ) ( not ( = ?auto_2392322 ?auto_2392321 ) ) ( HOIST-AT ?auto_2392324 ?auto_2392322 ) ( not ( = ?auto_2392318 ?auto_2392324 ) ) ( AVAILABLE ?auto_2392324 ) ( SURFACE-AT ?auto_2392317 ?auto_2392322 ) ( ON ?auto_2392317 ?auto_2392319 ) ( CLEAR ?auto_2392317 ) ( not ( = ?auto_2392316 ?auto_2392319 ) ) ( not ( = ?auto_2392317 ?auto_2392319 ) ) ( not ( = ?auto_2392323 ?auto_2392319 ) ) ( TRUCK-AT ?auto_2392320 ?auto_2392325 ) ( not ( = ?auto_2392325 ?auto_2392321 ) ) ( not ( = ?auto_2392322 ?auto_2392325 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2392320 ?auto_2392325 ?auto_2392321 )
      ( MAKE-1CRATE ?auto_2392316 ?auto_2392317 )
      ( MAKE-1CRATE-VERIFY ?auto_2392316 ?auto_2392317 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2392355 - SURFACE
      ?auto_2392356 - SURFACE
      ?auto_2392357 - SURFACE
      ?auto_2392358 - SURFACE
    )
    :vars
    (
      ?auto_2392360 - HOIST
      ?auto_2392359 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392360 ?auto_2392359 ) ( SURFACE-AT ?auto_2392357 ?auto_2392359 ) ( CLEAR ?auto_2392357 ) ( LIFTING ?auto_2392360 ?auto_2392358 ) ( IS-CRATE ?auto_2392358 ) ( not ( = ?auto_2392357 ?auto_2392358 ) ) ( ON ?auto_2392356 ?auto_2392355 ) ( ON ?auto_2392357 ?auto_2392356 ) ( not ( = ?auto_2392355 ?auto_2392356 ) ) ( not ( = ?auto_2392355 ?auto_2392357 ) ) ( not ( = ?auto_2392355 ?auto_2392358 ) ) ( not ( = ?auto_2392356 ?auto_2392357 ) ) ( not ( = ?auto_2392356 ?auto_2392358 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2392357 ?auto_2392358 )
      ( MAKE-3CRATE-VERIFY ?auto_2392355 ?auto_2392356 ?auto_2392357 ?auto_2392358 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2392372 - SURFACE
      ?auto_2392373 - SURFACE
      ?auto_2392374 - SURFACE
      ?auto_2392375 - SURFACE
    )
    :vars
    (
      ?auto_2392376 - HOIST
      ?auto_2392378 - PLACE
      ?auto_2392377 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392376 ?auto_2392378 ) ( SURFACE-AT ?auto_2392374 ?auto_2392378 ) ( CLEAR ?auto_2392374 ) ( IS-CRATE ?auto_2392375 ) ( not ( = ?auto_2392374 ?auto_2392375 ) ) ( TRUCK-AT ?auto_2392377 ?auto_2392378 ) ( AVAILABLE ?auto_2392376 ) ( IN ?auto_2392375 ?auto_2392377 ) ( ON ?auto_2392374 ?auto_2392373 ) ( not ( = ?auto_2392373 ?auto_2392374 ) ) ( not ( = ?auto_2392373 ?auto_2392375 ) ) ( ON ?auto_2392373 ?auto_2392372 ) ( not ( = ?auto_2392372 ?auto_2392373 ) ) ( not ( = ?auto_2392372 ?auto_2392374 ) ) ( not ( = ?auto_2392372 ?auto_2392375 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2392373 ?auto_2392374 ?auto_2392375 )
      ( MAKE-3CRATE-VERIFY ?auto_2392372 ?auto_2392373 ?auto_2392374 ?auto_2392375 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2392393 - SURFACE
      ?auto_2392394 - SURFACE
      ?auto_2392395 - SURFACE
      ?auto_2392396 - SURFACE
    )
    :vars
    (
      ?auto_2392399 - HOIST
      ?auto_2392397 - PLACE
      ?auto_2392400 - TRUCK
      ?auto_2392398 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392399 ?auto_2392397 ) ( SURFACE-AT ?auto_2392395 ?auto_2392397 ) ( CLEAR ?auto_2392395 ) ( IS-CRATE ?auto_2392396 ) ( not ( = ?auto_2392395 ?auto_2392396 ) ) ( AVAILABLE ?auto_2392399 ) ( IN ?auto_2392396 ?auto_2392400 ) ( ON ?auto_2392395 ?auto_2392394 ) ( not ( = ?auto_2392394 ?auto_2392395 ) ) ( not ( = ?auto_2392394 ?auto_2392396 ) ) ( TRUCK-AT ?auto_2392400 ?auto_2392398 ) ( not ( = ?auto_2392398 ?auto_2392397 ) ) ( ON ?auto_2392394 ?auto_2392393 ) ( not ( = ?auto_2392393 ?auto_2392394 ) ) ( not ( = ?auto_2392393 ?auto_2392395 ) ) ( not ( = ?auto_2392393 ?auto_2392396 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2392394 ?auto_2392395 ?auto_2392396 )
      ( MAKE-3CRATE-VERIFY ?auto_2392393 ?auto_2392394 ?auto_2392395 ?auto_2392396 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2392417 - SURFACE
      ?auto_2392418 - SURFACE
      ?auto_2392419 - SURFACE
      ?auto_2392420 - SURFACE
    )
    :vars
    (
      ?auto_2392421 - HOIST
      ?auto_2392422 - PLACE
      ?auto_2392424 - TRUCK
      ?auto_2392423 - PLACE
      ?auto_2392425 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392421 ?auto_2392422 ) ( SURFACE-AT ?auto_2392419 ?auto_2392422 ) ( CLEAR ?auto_2392419 ) ( IS-CRATE ?auto_2392420 ) ( not ( = ?auto_2392419 ?auto_2392420 ) ) ( AVAILABLE ?auto_2392421 ) ( ON ?auto_2392419 ?auto_2392418 ) ( not ( = ?auto_2392418 ?auto_2392419 ) ) ( not ( = ?auto_2392418 ?auto_2392420 ) ) ( TRUCK-AT ?auto_2392424 ?auto_2392423 ) ( not ( = ?auto_2392423 ?auto_2392422 ) ) ( HOIST-AT ?auto_2392425 ?auto_2392423 ) ( LIFTING ?auto_2392425 ?auto_2392420 ) ( not ( = ?auto_2392421 ?auto_2392425 ) ) ( ON ?auto_2392418 ?auto_2392417 ) ( not ( = ?auto_2392417 ?auto_2392418 ) ) ( not ( = ?auto_2392417 ?auto_2392419 ) ) ( not ( = ?auto_2392417 ?auto_2392420 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2392418 ?auto_2392419 ?auto_2392420 )
      ( MAKE-3CRATE-VERIFY ?auto_2392417 ?auto_2392418 ?auto_2392419 ?auto_2392420 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2392444 - SURFACE
      ?auto_2392445 - SURFACE
      ?auto_2392446 - SURFACE
      ?auto_2392447 - SURFACE
    )
    :vars
    (
      ?auto_2392452 - HOIST
      ?auto_2392448 - PLACE
      ?auto_2392450 - TRUCK
      ?auto_2392451 - PLACE
      ?auto_2392449 - HOIST
      ?auto_2392453 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392452 ?auto_2392448 ) ( SURFACE-AT ?auto_2392446 ?auto_2392448 ) ( CLEAR ?auto_2392446 ) ( IS-CRATE ?auto_2392447 ) ( not ( = ?auto_2392446 ?auto_2392447 ) ) ( AVAILABLE ?auto_2392452 ) ( ON ?auto_2392446 ?auto_2392445 ) ( not ( = ?auto_2392445 ?auto_2392446 ) ) ( not ( = ?auto_2392445 ?auto_2392447 ) ) ( TRUCK-AT ?auto_2392450 ?auto_2392451 ) ( not ( = ?auto_2392451 ?auto_2392448 ) ) ( HOIST-AT ?auto_2392449 ?auto_2392451 ) ( not ( = ?auto_2392452 ?auto_2392449 ) ) ( AVAILABLE ?auto_2392449 ) ( SURFACE-AT ?auto_2392447 ?auto_2392451 ) ( ON ?auto_2392447 ?auto_2392453 ) ( CLEAR ?auto_2392447 ) ( not ( = ?auto_2392446 ?auto_2392453 ) ) ( not ( = ?auto_2392447 ?auto_2392453 ) ) ( not ( = ?auto_2392445 ?auto_2392453 ) ) ( ON ?auto_2392445 ?auto_2392444 ) ( not ( = ?auto_2392444 ?auto_2392445 ) ) ( not ( = ?auto_2392444 ?auto_2392446 ) ) ( not ( = ?auto_2392444 ?auto_2392447 ) ) ( not ( = ?auto_2392444 ?auto_2392453 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2392445 ?auto_2392446 ?auto_2392447 )
      ( MAKE-3CRATE-VERIFY ?auto_2392444 ?auto_2392445 ?auto_2392446 ?auto_2392447 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2392472 - SURFACE
      ?auto_2392473 - SURFACE
      ?auto_2392474 - SURFACE
      ?auto_2392475 - SURFACE
    )
    :vars
    (
      ?auto_2392481 - HOIST
      ?auto_2392478 - PLACE
      ?auto_2392476 - PLACE
      ?auto_2392477 - HOIST
      ?auto_2392479 - SURFACE
      ?auto_2392480 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392481 ?auto_2392478 ) ( SURFACE-AT ?auto_2392474 ?auto_2392478 ) ( CLEAR ?auto_2392474 ) ( IS-CRATE ?auto_2392475 ) ( not ( = ?auto_2392474 ?auto_2392475 ) ) ( AVAILABLE ?auto_2392481 ) ( ON ?auto_2392474 ?auto_2392473 ) ( not ( = ?auto_2392473 ?auto_2392474 ) ) ( not ( = ?auto_2392473 ?auto_2392475 ) ) ( not ( = ?auto_2392476 ?auto_2392478 ) ) ( HOIST-AT ?auto_2392477 ?auto_2392476 ) ( not ( = ?auto_2392481 ?auto_2392477 ) ) ( AVAILABLE ?auto_2392477 ) ( SURFACE-AT ?auto_2392475 ?auto_2392476 ) ( ON ?auto_2392475 ?auto_2392479 ) ( CLEAR ?auto_2392475 ) ( not ( = ?auto_2392474 ?auto_2392479 ) ) ( not ( = ?auto_2392475 ?auto_2392479 ) ) ( not ( = ?auto_2392473 ?auto_2392479 ) ) ( TRUCK-AT ?auto_2392480 ?auto_2392478 ) ( ON ?auto_2392473 ?auto_2392472 ) ( not ( = ?auto_2392472 ?auto_2392473 ) ) ( not ( = ?auto_2392472 ?auto_2392474 ) ) ( not ( = ?auto_2392472 ?auto_2392475 ) ) ( not ( = ?auto_2392472 ?auto_2392479 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2392473 ?auto_2392474 ?auto_2392475 )
      ( MAKE-3CRATE-VERIFY ?auto_2392472 ?auto_2392473 ?auto_2392474 ?auto_2392475 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2392500 - SURFACE
      ?auto_2392501 - SURFACE
      ?auto_2392502 - SURFACE
      ?auto_2392503 - SURFACE
    )
    :vars
    (
      ?auto_2392504 - HOIST
      ?auto_2392507 - PLACE
      ?auto_2392506 - PLACE
      ?auto_2392508 - HOIST
      ?auto_2392509 - SURFACE
      ?auto_2392505 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392504 ?auto_2392507 ) ( IS-CRATE ?auto_2392503 ) ( not ( = ?auto_2392502 ?auto_2392503 ) ) ( not ( = ?auto_2392501 ?auto_2392502 ) ) ( not ( = ?auto_2392501 ?auto_2392503 ) ) ( not ( = ?auto_2392506 ?auto_2392507 ) ) ( HOIST-AT ?auto_2392508 ?auto_2392506 ) ( not ( = ?auto_2392504 ?auto_2392508 ) ) ( AVAILABLE ?auto_2392508 ) ( SURFACE-AT ?auto_2392503 ?auto_2392506 ) ( ON ?auto_2392503 ?auto_2392509 ) ( CLEAR ?auto_2392503 ) ( not ( = ?auto_2392502 ?auto_2392509 ) ) ( not ( = ?auto_2392503 ?auto_2392509 ) ) ( not ( = ?auto_2392501 ?auto_2392509 ) ) ( TRUCK-AT ?auto_2392505 ?auto_2392507 ) ( SURFACE-AT ?auto_2392501 ?auto_2392507 ) ( CLEAR ?auto_2392501 ) ( LIFTING ?auto_2392504 ?auto_2392502 ) ( IS-CRATE ?auto_2392502 ) ( ON ?auto_2392501 ?auto_2392500 ) ( not ( = ?auto_2392500 ?auto_2392501 ) ) ( not ( = ?auto_2392500 ?auto_2392502 ) ) ( not ( = ?auto_2392500 ?auto_2392503 ) ) ( not ( = ?auto_2392500 ?auto_2392509 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2392501 ?auto_2392502 ?auto_2392503 )
      ( MAKE-3CRATE-VERIFY ?auto_2392500 ?auto_2392501 ?auto_2392502 ?auto_2392503 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2392528 - SURFACE
      ?auto_2392529 - SURFACE
      ?auto_2392530 - SURFACE
      ?auto_2392531 - SURFACE
    )
    :vars
    (
      ?auto_2392533 - HOIST
      ?auto_2392537 - PLACE
      ?auto_2392532 - PLACE
      ?auto_2392534 - HOIST
      ?auto_2392536 - SURFACE
      ?auto_2392535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392533 ?auto_2392537 ) ( IS-CRATE ?auto_2392531 ) ( not ( = ?auto_2392530 ?auto_2392531 ) ) ( not ( = ?auto_2392529 ?auto_2392530 ) ) ( not ( = ?auto_2392529 ?auto_2392531 ) ) ( not ( = ?auto_2392532 ?auto_2392537 ) ) ( HOIST-AT ?auto_2392534 ?auto_2392532 ) ( not ( = ?auto_2392533 ?auto_2392534 ) ) ( AVAILABLE ?auto_2392534 ) ( SURFACE-AT ?auto_2392531 ?auto_2392532 ) ( ON ?auto_2392531 ?auto_2392536 ) ( CLEAR ?auto_2392531 ) ( not ( = ?auto_2392530 ?auto_2392536 ) ) ( not ( = ?auto_2392531 ?auto_2392536 ) ) ( not ( = ?auto_2392529 ?auto_2392536 ) ) ( TRUCK-AT ?auto_2392535 ?auto_2392537 ) ( SURFACE-AT ?auto_2392529 ?auto_2392537 ) ( CLEAR ?auto_2392529 ) ( IS-CRATE ?auto_2392530 ) ( AVAILABLE ?auto_2392533 ) ( IN ?auto_2392530 ?auto_2392535 ) ( ON ?auto_2392529 ?auto_2392528 ) ( not ( = ?auto_2392528 ?auto_2392529 ) ) ( not ( = ?auto_2392528 ?auto_2392530 ) ) ( not ( = ?auto_2392528 ?auto_2392531 ) ) ( not ( = ?auto_2392528 ?auto_2392536 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2392529 ?auto_2392530 ?auto_2392531 )
      ( MAKE-3CRATE-VERIFY ?auto_2392528 ?auto_2392529 ?auto_2392530 ?auto_2392531 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2392819 - SURFACE
      ?auto_2392820 - SURFACE
      ?auto_2392821 - SURFACE
      ?auto_2392822 - SURFACE
      ?auto_2392823 - SURFACE
    )
    :vars
    (
      ?auto_2392824 - HOIST
      ?auto_2392825 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392824 ?auto_2392825 ) ( SURFACE-AT ?auto_2392822 ?auto_2392825 ) ( CLEAR ?auto_2392822 ) ( LIFTING ?auto_2392824 ?auto_2392823 ) ( IS-CRATE ?auto_2392823 ) ( not ( = ?auto_2392822 ?auto_2392823 ) ) ( ON ?auto_2392820 ?auto_2392819 ) ( ON ?auto_2392821 ?auto_2392820 ) ( ON ?auto_2392822 ?auto_2392821 ) ( not ( = ?auto_2392819 ?auto_2392820 ) ) ( not ( = ?auto_2392819 ?auto_2392821 ) ) ( not ( = ?auto_2392819 ?auto_2392822 ) ) ( not ( = ?auto_2392819 ?auto_2392823 ) ) ( not ( = ?auto_2392820 ?auto_2392821 ) ) ( not ( = ?auto_2392820 ?auto_2392822 ) ) ( not ( = ?auto_2392820 ?auto_2392823 ) ) ( not ( = ?auto_2392821 ?auto_2392822 ) ) ( not ( = ?auto_2392821 ?auto_2392823 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2392822 ?auto_2392823 )
      ( MAKE-4CRATE-VERIFY ?auto_2392819 ?auto_2392820 ?auto_2392821 ?auto_2392822 ?auto_2392823 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2392844 - SURFACE
      ?auto_2392845 - SURFACE
      ?auto_2392846 - SURFACE
      ?auto_2392847 - SURFACE
      ?auto_2392848 - SURFACE
    )
    :vars
    (
      ?auto_2392849 - HOIST
      ?auto_2392850 - PLACE
      ?auto_2392851 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392849 ?auto_2392850 ) ( SURFACE-AT ?auto_2392847 ?auto_2392850 ) ( CLEAR ?auto_2392847 ) ( IS-CRATE ?auto_2392848 ) ( not ( = ?auto_2392847 ?auto_2392848 ) ) ( TRUCK-AT ?auto_2392851 ?auto_2392850 ) ( AVAILABLE ?auto_2392849 ) ( IN ?auto_2392848 ?auto_2392851 ) ( ON ?auto_2392847 ?auto_2392846 ) ( not ( = ?auto_2392846 ?auto_2392847 ) ) ( not ( = ?auto_2392846 ?auto_2392848 ) ) ( ON ?auto_2392845 ?auto_2392844 ) ( ON ?auto_2392846 ?auto_2392845 ) ( not ( = ?auto_2392844 ?auto_2392845 ) ) ( not ( = ?auto_2392844 ?auto_2392846 ) ) ( not ( = ?auto_2392844 ?auto_2392847 ) ) ( not ( = ?auto_2392844 ?auto_2392848 ) ) ( not ( = ?auto_2392845 ?auto_2392846 ) ) ( not ( = ?auto_2392845 ?auto_2392847 ) ) ( not ( = ?auto_2392845 ?auto_2392848 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2392846 ?auto_2392847 ?auto_2392848 )
      ( MAKE-4CRATE-VERIFY ?auto_2392844 ?auto_2392845 ?auto_2392846 ?auto_2392847 ?auto_2392848 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2392874 - SURFACE
      ?auto_2392875 - SURFACE
      ?auto_2392876 - SURFACE
      ?auto_2392877 - SURFACE
      ?auto_2392878 - SURFACE
    )
    :vars
    (
      ?auto_2392882 - HOIST
      ?auto_2392880 - PLACE
      ?auto_2392881 - TRUCK
      ?auto_2392879 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392882 ?auto_2392880 ) ( SURFACE-AT ?auto_2392877 ?auto_2392880 ) ( CLEAR ?auto_2392877 ) ( IS-CRATE ?auto_2392878 ) ( not ( = ?auto_2392877 ?auto_2392878 ) ) ( AVAILABLE ?auto_2392882 ) ( IN ?auto_2392878 ?auto_2392881 ) ( ON ?auto_2392877 ?auto_2392876 ) ( not ( = ?auto_2392876 ?auto_2392877 ) ) ( not ( = ?auto_2392876 ?auto_2392878 ) ) ( TRUCK-AT ?auto_2392881 ?auto_2392879 ) ( not ( = ?auto_2392879 ?auto_2392880 ) ) ( ON ?auto_2392875 ?auto_2392874 ) ( ON ?auto_2392876 ?auto_2392875 ) ( not ( = ?auto_2392874 ?auto_2392875 ) ) ( not ( = ?auto_2392874 ?auto_2392876 ) ) ( not ( = ?auto_2392874 ?auto_2392877 ) ) ( not ( = ?auto_2392874 ?auto_2392878 ) ) ( not ( = ?auto_2392875 ?auto_2392876 ) ) ( not ( = ?auto_2392875 ?auto_2392877 ) ) ( not ( = ?auto_2392875 ?auto_2392878 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2392876 ?auto_2392877 ?auto_2392878 )
      ( MAKE-4CRATE-VERIFY ?auto_2392874 ?auto_2392875 ?auto_2392876 ?auto_2392877 ?auto_2392878 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2392908 - SURFACE
      ?auto_2392909 - SURFACE
      ?auto_2392910 - SURFACE
      ?auto_2392911 - SURFACE
      ?auto_2392912 - SURFACE
    )
    :vars
    (
      ?auto_2392916 - HOIST
      ?auto_2392915 - PLACE
      ?auto_2392917 - TRUCK
      ?auto_2392913 - PLACE
      ?auto_2392914 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392916 ?auto_2392915 ) ( SURFACE-AT ?auto_2392911 ?auto_2392915 ) ( CLEAR ?auto_2392911 ) ( IS-CRATE ?auto_2392912 ) ( not ( = ?auto_2392911 ?auto_2392912 ) ) ( AVAILABLE ?auto_2392916 ) ( ON ?auto_2392911 ?auto_2392910 ) ( not ( = ?auto_2392910 ?auto_2392911 ) ) ( not ( = ?auto_2392910 ?auto_2392912 ) ) ( TRUCK-AT ?auto_2392917 ?auto_2392913 ) ( not ( = ?auto_2392913 ?auto_2392915 ) ) ( HOIST-AT ?auto_2392914 ?auto_2392913 ) ( LIFTING ?auto_2392914 ?auto_2392912 ) ( not ( = ?auto_2392916 ?auto_2392914 ) ) ( ON ?auto_2392909 ?auto_2392908 ) ( ON ?auto_2392910 ?auto_2392909 ) ( not ( = ?auto_2392908 ?auto_2392909 ) ) ( not ( = ?auto_2392908 ?auto_2392910 ) ) ( not ( = ?auto_2392908 ?auto_2392911 ) ) ( not ( = ?auto_2392908 ?auto_2392912 ) ) ( not ( = ?auto_2392909 ?auto_2392910 ) ) ( not ( = ?auto_2392909 ?auto_2392911 ) ) ( not ( = ?auto_2392909 ?auto_2392912 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2392910 ?auto_2392911 ?auto_2392912 )
      ( MAKE-4CRATE-VERIFY ?auto_2392908 ?auto_2392909 ?auto_2392910 ?auto_2392911 ?auto_2392912 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2392946 - SURFACE
      ?auto_2392947 - SURFACE
      ?auto_2392948 - SURFACE
      ?auto_2392949 - SURFACE
      ?auto_2392950 - SURFACE
    )
    :vars
    (
      ?auto_2392955 - HOIST
      ?auto_2392956 - PLACE
      ?auto_2392951 - TRUCK
      ?auto_2392954 - PLACE
      ?auto_2392952 - HOIST
      ?auto_2392953 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392955 ?auto_2392956 ) ( SURFACE-AT ?auto_2392949 ?auto_2392956 ) ( CLEAR ?auto_2392949 ) ( IS-CRATE ?auto_2392950 ) ( not ( = ?auto_2392949 ?auto_2392950 ) ) ( AVAILABLE ?auto_2392955 ) ( ON ?auto_2392949 ?auto_2392948 ) ( not ( = ?auto_2392948 ?auto_2392949 ) ) ( not ( = ?auto_2392948 ?auto_2392950 ) ) ( TRUCK-AT ?auto_2392951 ?auto_2392954 ) ( not ( = ?auto_2392954 ?auto_2392956 ) ) ( HOIST-AT ?auto_2392952 ?auto_2392954 ) ( not ( = ?auto_2392955 ?auto_2392952 ) ) ( AVAILABLE ?auto_2392952 ) ( SURFACE-AT ?auto_2392950 ?auto_2392954 ) ( ON ?auto_2392950 ?auto_2392953 ) ( CLEAR ?auto_2392950 ) ( not ( = ?auto_2392949 ?auto_2392953 ) ) ( not ( = ?auto_2392950 ?auto_2392953 ) ) ( not ( = ?auto_2392948 ?auto_2392953 ) ) ( ON ?auto_2392947 ?auto_2392946 ) ( ON ?auto_2392948 ?auto_2392947 ) ( not ( = ?auto_2392946 ?auto_2392947 ) ) ( not ( = ?auto_2392946 ?auto_2392948 ) ) ( not ( = ?auto_2392946 ?auto_2392949 ) ) ( not ( = ?auto_2392946 ?auto_2392950 ) ) ( not ( = ?auto_2392946 ?auto_2392953 ) ) ( not ( = ?auto_2392947 ?auto_2392948 ) ) ( not ( = ?auto_2392947 ?auto_2392949 ) ) ( not ( = ?auto_2392947 ?auto_2392950 ) ) ( not ( = ?auto_2392947 ?auto_2392953 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2392948 ?auto_2392949 ?auto_2392950 )
      ( MAKE-4CRATE-VERIFY ?auto_2392946 ?auto_2392947 ?auto_2392948 ?auto_2392949 ?auto_2392950 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2392985 - SURFACE
      ?auto_2392986 - SURFACE
      ?auto_2392987 - SURFACE
      ?auto_2392988 - SURFACE
      ?auto_2392989 - SURFACE
    )
    :vars
    (
      ?auto_2392993 - HOIST
      ?auto_2392990 - PLACE
      ?auto_2392991 - PLACE
      ?auto_2392992 - HOIST
      ?auto_2392994 - SURFACE
      ?auto_2392995 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392993 ?auto_2392990 ) ( SURFACE-AT ?auto_2392988 ?auto_2392990 ) ( CLEAR ?auto_2392988 ) ( IS-CRATE ?auto_2392989 ) ( not ( = ?auto_2392988 ?auto_2392989 ) ) ( AVAILABLE ?auto_2392993 ) ( ON ?auto_2392988 ?auto_2392987 ) ( not ( = ?auto_2392987 ?auto_2392988 ) ) ( not ( = ?auto_2392987 ?auto_2392989 ) ) ( not ( = ?auto_2392991 ?auto_2392990 ) ) ( HOIST-AT ?auto_2392992 ?auto_2392991 ) ( not ( = ?auto_2392993 ?auto_2392992 ) ) ( AVAILABLE ?auto_2392992 ) ( SURFACE-AT ?auto_2392989 ?auto_2392991 ) ( ON ?auto_2392989 ?auto_2392994 ) ( CLEAR ?auto_2392989 ) ( not ( = ?auto_2392988 ?auto_2392994 ) ) ( not ( = ?auto_2392989 ?auto_2392994 ) ) ( not ( = ?auto_2392987 ?auto_2392994 ) ) ( TRUCK-AT ?auto_2392995 ?auto_2392990 ) ( ON ?auto_2392986 ?auto_2392985 ) ( ON ?auto_2392987 ?auto_2392986 ) ( not ( = ?auto_2392985 ?auto_2392986 ) ) ( not ( = ?auto_2392985 ?auto_2392987 ) ) ( not ( = ?auto_2392985 ?auto_2392988 ) ) ( not ( = ?auto_2392985 ?auto_2392989 ) ) ( not ( = ?auto_2392985 ?auto_2392994 ) ) ( not ( = ?auto_2392986 ?auto_2392987 ) ) ( not ( = ?auto_2392986 ?auto_2392988 ) ) ( not ( = ?auto_2392986 ?auto_2392989 ) ) ( not ( = ?auto_2392986 ?auto_2392994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2392987 ?auto_2392988 ?auto_2392989 )
      ( MAKE-4CRATE-VERIFY ?auto_2392985 ?auto_2392986 ?auto_2392987 ?auto_2392988 ?auto_2392989 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2393024 - SURFACE
      ?auto_2393025 - SURFACE
      ?auto_2393026 - SURFACE
      ?auto_2393027 - SURFACE
      ?auto_2393028 - SURFACE
    )
    :vars
    (
      ?auto_2393032 - HOIST
      ?auto_2393029 - PLACE
      ?auto_2393034 - PLACE
      ?auto_2393033 - HOIST
      ?auto_2393030 - SURFACE
      ?auto_2393031 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393032 ?auto_2393029 ) ( IS-CRATE ?auto_2393028 ) ( not ( = ?auto_2393027 ?auto_2393028 ) ) ( not ( = ?auto_2393026 ?auto_2393027 ) ) ( not ( = ?auto_2393026 ?auto_2393028 ) ) ( not ( = ?auto_2393034 ?auto_2393029 ) ) ( HOIST-AT ?auto_2393033 ?auto_2393034 ) ( not ( = ?auto_2393032 ?auto_2393033 ) ) ( AVAILABLE ?auto_2393033 ) ( SURFACE-AT ?auto_2393028 ?auto_2393034 ) ( ON ?auto_2393028 ?auto_2393030 ) ( CLEAR ?auto_2393028 ) ( not ( = ?auto_2393027 ?auto_2393030 ) ) ( not ( = ?auto_2393028 ?auto_2393030 ) ) ( not ( = ?auto_2393026 ?auto_2393030 ) ) ( TRUCK-AT ?auto_2393031 ?auto_2393029 ) ( SURFACE-AT ?auto_2393026 ?auto_2393029 ) ( CLEAR ?auto_2393026 ) ( LIFTING ?auto_2393032 ?auto_2393027 ) ( IS-CRATE ?auto_2393027 ) ( ON ?auto_2393025 ?auto_2393024 ) ( ON ?auto_2393026 ?auto_2393025 ) ( not ( = ?auto_2393024 ?auto_2393025 ) ) ( not ( = ?auto_2393024 ?auto_2393026 ) ) ( not ( = ?auto_2393024 ?auto_2393027 ) ) ( not ( = ?auto_2393024 ?auto_2393028 ) ) ( not ( = ?auto_2393024 ?auto_2393030 ) ) ( not ( = ?auto_2393025 ?auto_2393026 ) ) ( not ( = ?auto_2393025 ?auto_2393027 ) ) ( not ( = ?auto_2393025 ?auto_2393028 ) ) ( not ( = ?auto_2393025 ?auto_2393030 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393026 ?auto_2393027 ?auto_2393028 )
      ( MAKE-4CRATE-VERIFY ?auto_2393024 ?auto_2393025 ?auto_2393026 ?auto_2393027 ?auto_2393028 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2393063 - SURFACE
      ?auto_2393064 - SURFACE
      ?auto_2393065 - SURFACE
      ?auto_2393066 - SURFACE
      ?auto_2393067 - SURFACE
    )
    :vars
    (
      ?auto_2393068 - HOIST
      ?auto_2393072 - PLACE
      ?auto_2393073 - PLACE
      ?auto_2393071 - HOIST
      ?auto_2393069 - SURFACE
      ?auto_2393070 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393068 ?auto_2393072 ) ( IS-CRATE ?auto_2393067 ) ( not ( = ?auto_2393066 ?auto_2393067 ) ) ( not ( = ?auto_2393065 ?auto_2393066 ) ) ( not ( = ?auto_2393065 ?auto_2393067 ) ) ( not ( = ?auto_2393073 ?auto_2393072 ) ) ( HOIST-AT ?auto_2393071 ?auto_2393073 ) ( not ( = ?auto_2393068 ?auto_2393071 ) ) ( AVAILABLE ?auto_2393071 ) ( SURFACE-AT ?auto_2393067 ?auto_2393073 ) ( ON ?auto_2393067 ?auto_2393069 ) ( CLEAR ?auto_2393067 ) ( not ( = ?auto_2393066 ?auto_2393069 ) ) ( not ( = ?auto_2393067 ?auto_2393069 ) ) ( not ( = ?auto_2393065 ?auto_2393069 ) ) ( TRUCK-AT ?auto_2393070 ?auto_2393072 ) ( SURFACE-AT ?auto_2393065 ?auto_2393072 ) ( CLEAR ?auto_2393065 ) ( IS-CRATE ?auto_2393066 ) ( AVAILABLE ?auto_2393068 ) ( IN ?auto_2393066 ?auto_2393070 ) ( ON ?auto_2393064 ?auto_2393063 ) ( ON ?auto_2393065 ?auto_2393064 ) ( not ( = ?auto_2393063 ?auto_2393064 ) ) ( not ( = ?auto_2393063 ?auto_2393065 ) ) ( not ( = ?auto_2393063 ?auto_2393066 ) ) ( not ( = ?auto_2393063 ?auto_2393067 ) ) ( not ( = ?auto_2393063 ?auto_2393069 ) ) ( not ( = ?auto_2393064 ?auto_2393065 ) ) ( not ( = ?auto_2393064 ?auto_2393066 ) ) ( not ( = ?auto_2393064 ?auto_2393067 ) ) ( not ( = ?auto_2393064 ?auto_2393069 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393065 ?auto_2393066 ?auto_2393067 )
      ( MAKE-4CRATE-VERIFY ?auto_2393063 ?auto_2393064 ?auto_2393065 ?auto_2393066 ?auto_2393067 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2393723 - SURFACE
      ?auto_2393724 - SURFACE
      ?auto_2393725 - SURFACE
      ?auto_2393726 - SURFACE
      ?auto_2393727 - SURFACE
      ?auto_2393728 - SURFACE
    )
    :vars
    (
      ?auto_2393730 - HOIST
      ?auto_2393729 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393730 ?auto_2393729 ) ( SURFACE-AT ?auto_2393727 ?auto_2393729 ) ( CLEAR ?auto_2393727 ) ( LIFTING ?auto_2393730 ?auto_2393728 ) ( IS-CRATE ?auto_2393728 ) ( not ( = ?auto_2393727 ?auto_2393728 ) ) ( ON ?auto_2393724 ?auto_2393723 ) ( ON ?auto_2393725 ?auto_2393724 ) ( ON ?auto_2393726 ?auto_2393725 ) ( ON ?auto_2393727 ?auto_2393726 ) ( not ( = ?auto_2393723 ?auto_2393724 ) ) ( not ( = ?auto_2393723 ?auto_2393725 ) ) ( not ( = ?auto_2393723 ?auto_2393726 ) ) ( not ( = ?auto_2393723 ?auto_2393727 ) ) ( not ( = ?auto_2393723 ?auto_2393728 ) ) ( not ( = ?auto_2393724 ?auto_2393725 ) ) ( not ( = ?auto_2393724 ?auto_2393726 ) ) ( not ( = ?auto_2393724 ?auto_2393727 ) ) ( not ( = ?auto_2393724 ?auto_2393728 ) ) ( not ( = ?auto_2393725 ?auto_2393726 ) ) ( not ( = ?auto_2393725 ?auto_2393727 ) ) ( not ( = ?auto_2393725 ?auto_2393728 ) ) ( not ( = ?auto_2393726 ?auto_2393727 ) ) ( not ( = ?auto_2393726 ?auto_2393728 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2393727 ?auto_2393728 )
      ( MAKE-5CRATE-VERIFY ?auto_2393723 ?auto_2393724 ?auto_2393725 ?auto_2393726 ?auto_2393727 ?auto_2393728 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2393757 - SURFACE
      ?auto_2393758 - SURFACE
      ?auto_2393759 - SURFACE
      ?auto_2393760 - SURFACE
      ?auto_2393761 - SURFACE
      ?auto_2393762 - SURFACE
    )
    :vars
    (
      ?auto_2393763 - HOIST
      ?auto_2393765 - PLACE
      ?auto_2393764 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393763 ?auto_2393765 ) ( SURFACE-AT ?auto_2393761 ?auto_2393765 ) ( CLEAR ?auto_2393761 ) ( IS-CRATE ?auto_2393762 ) ( not ( = ?auto_2393761 ?auto_2393762 ) ) ( TRUCK-AT ?auto_2393764 ?auto_2393765 ) ( AVAILABLE ?auto_2393763 ) ( IN ?auto_2393762 ?auto_2393764 ) ( ON ?auto_2393761 ?auto_2393760 ) ( not ( = ?auto_2393760 ?auto_2393761 ) ) ( not ( = ?auto_2393760 ?auto_2393762 ) ) ( ON ?auto_2393758 ?auto_2393757 ) ( ON ?auto_2393759 ?auto_2393758 ) ( ON ?auto_2393760 ?auto_2393759 ) ( not ( = ?auto_2393757 ?auto_2393758 ) ) ( not ( = ?auto_2393757 ?auto_2393759 ) ) ( not ( = ?auto_2393757 ?auto_2393760 ) ) ( not ( = ?auto_2393757 ?auto_2393761 ) ) ( not ( = ?auto_2393757 ?auto_2393762 ) ) ( not ( = ?auto_2393758 ?auto_2393759 ) ) ( not ( = ?auto_2393758 ?auto_2393760 ) ) ( not ( = ?auto_2393758 ?auto_2393761 ) ) ( not ( = ?auto_2393758 ?auto_2393762 ) ) ( not ( = ?auto_2393759 ?auto_2393760 ) ) ( not ( = ?auto_2393759 ?auto_2393761 ) ) ( not ( = ?auto_2393759 ?auto_2393762 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393760 ?auto_2393761 ?auto_2393762 )
      ( MAKE-5CRATE-VERIFY ?auto_2393757 ?auto_2393758 ?auto_2393759 ?auto_2393760 ?auto_2393761 ?auto_2393762 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2393797 - SURFACE
      ?auto_2393798 - SURFACE
      ?auto_2393799 - SURFACE
      ?auto_2393800 - SURFACE
      ?auto_2393801 - SURFACE
      ?auto_2393802 - SURFACE
    )
    :vars
    (
      ?auto_2393804 - HOIST
      ?auto_2393806 - PLACE
      ?auto_2393803 - TRUCK
      ?auto_2393805 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393804 ?auto_2393806 ) ( SURFACE-AT ?auto_2393801 ?auto_2393806 ) ( CLEAR ?auto_2393801 ) ( IS-CRATE ?auto_2393802 ) ( not ( = ?auto_2393801 ?auto_2393802 ) ) ( AVAILABLE ?auto_2393804 ) ( IN ?auto_2393802 ?auto_2393803 ) ( ON ?auto_2393801 ?auto_2393800 ) ( not ( = ?auto_2393800 ?auto_2393801 ) ) ( not ( = ?auto_2393800 ?auto_2393802 ) ) ( TRUCK-AT ?auto_2393803 ?auto_2393805 ) ( not ( = ?auto_2393805 ?auto_2393806 ) ) ( ON ?auto_2393798 ?auto_2393797 ) ( ON ?auto_2393799 ?auto_2393798 ) ( ON ?auto_2393800 ?auto_2393799 ) ( not ( = ?auto_2393797 ?auto_2393798 ) ) ( not ( = ?auto_2393797 ?auto_2393799 ) ) ( not ( = ?auto_2393797 ?auto_2393800 ) ) ( not ( = ?auto_2393797 ?auto_2393801 ) ) ( not ( = ?auto_2393797 ?auto_2393802 ) ) ( not ( = ?auto_2393798 ?auto_2393799 ) ) ( not ( = ?auto_2393798 ?auto_2393800 ) ) ( not ( = ?auto_2393798 ?auto_2393801 ) ) ( not ( = ?auto_2393798 ?auto_2393802 ) ) ( not ( = ?auto_2393799 ?auto_2393800 ) ) ( not ( = ?auto_2393799 ?auto_2393801 ) ) ( not ( = ?auto_2393799 ?auto_2393802 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393800 ?auto_2393801 ?auto_2393802 )
      ( MAKE-5CRATE-VERIFY ?auto_2393797 ?auto_2393798 ?auto_2393799 ?auto_2393800 ?auto_2393801 ?auto_2393802 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2393842 - SURFACE
      ?auto_2393843 - SURFACE
      ?auto_2393844 - SURFACE
      ?auto_2393845 - SURFACE
      ?auto_2393846 - SURFACE
      ?auto_2393847 - SURFACE
    )
    :vars
    (
      ?auto_2393848 - HOIST
      ?auto_2393852 - PLACE
      ?auto_2393849 - TRUCK
      ?auto_2393851 - PLACE
      ?auto_2393850 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393848 ?auto_2393852 ) ( SURFACE-AT ?auto_2393846 ?auto_2393852 ) ( CLEAR ?auto_2393846 ) ( IS-CRATE ?auto_2393847 ) ( not ( = ?auto_2393846 ?auto_2393847 ) ) ( AVAILABLE ?auto_2393848 ) ( ON ?auto_2393846 ?auto_2393845 ) ( not ( = ?auto_2393845 ?auto_2393846 ) ) ( not ( = ?auto_2393845 ?auto_2393847 ) ) ( TRUCK-AT ?auto_2393849 ?auto_2393851 ) ( not ( = ?auto_2393851 ?auto_2393852 ) ) ( HOIST-AT ?auto_2393850 ?auto_2393851 ) ( LIFTING ?auto_2393850 ?auto_2393847 ) ( not ( = ?auto_2393848 ?auto_2393850 ) ) ( ON ?auto_2393843 ?auto_2393842 ) ( ON ?auto_2393844 ?auto_2393843 ) ( ON ?auto_2393845 ?auto_2393844 ) ( not ( = ?auto_2393842 ?auto_2393843 ) ) ( not ( = ?auto_2393842 ?auto_2393844 ) ) ( not ( = ?auto_2393842 ?auto_2393845 ) ) ( not ( = ?auto_2393842 ?auto_2393846 ) ) ( not ( = ?auto_2393842 ?auto_2393847 ) ) ( not ( = ?auto_2393843 ?auto_2393844 ) ) ( not ( = ?auto_2393843 ?auto_2393845 ) ) ( not ( = ?auto_2393843 ?auto_2393846 ) ) ( not ( = ?auto_2393843 ?auto_2393847 ) ) ( not ( = ?auto_2393844 ?auto_2393845 ) ) ( not ( = ?auto_2393844 ?auto_2393846 ) ) ( not ( = ?auto_2393844 ?auto_2393847 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393845 ?auto_2393846 ?auto_2393847 )
      ( MAKE-5CRATE-VERIFY ?auto_2393842 ?auto_2393843 ?auto_2393844 ?auto_2393845 ?auto_2393846 ?auto_2393847 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2393892 - SURFACE
      ?auto_2393893 - SURFACE
      ?auto_2393894 - SURFACE
      ?auto_2393895 - SURFACE
      ?auto_2393896 - SURFACE
      ?auto_2393897 - SURFACE
    )
    :vars
    (
      ?auto_2393902 - HOIST
      ?auto_2393898 - PLACE
      ?auto_2393900 - TRUCK
      ?auto_2393901 - PLACE
      ?auto_2393903 - HOIST
      ?auto_2393899 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393902 ?auto_2393898 ) ( SURFACE-AT ?auto_2393896 ?auto_2393898 ) ( CLEAR ?auto_2393896 ) ( IS-CRATE ?auto_2393897 ) ( not ( = ?auto_2393896 ?auto_2393897 ) ) ( AVAILABLE ?auto_2393902 ) ( ON ?auto_2393896 ?auto_2393895 ) ( not ( = ?auto_2393895 ?auto_2393896 ) ) ( not ( = ?auto_2393895 ?auto_2393897 ) ) ( TRUCK-AT ?auto_2393900 ?auto_2393901 ) ( not ( = ?auto_2393901 ?auto_2393898 ) ) ( HOIST-AT ?auto_2393903 ?auto_2393901 ) ( not ( = ?auto_2393902 ?auto_2393903 ) ) ( AVAILABLE ?auto_2393903 ) ( SURFACE-AT ?auto_2393897 ?auto_2393901 ) ( ON ?auto_2393897 ?auto_2393899 ) ( CLEAR ?auto_2393897 ) ( not ( = ?auto_2393896 ?auto_2393899 ) ) ( not ( = ?auto_2393897 ?auto_2393899 ) ) ( not ( = ?auto_2393895 ?auto_2393899 ) ) ( ON ?auto_2393893 ?auto_2393892 ) ( ON ?auto_2393894 ?auto_2393893 ) ( ON ?auto_2393895 ?auto_2393894 ) ( not ( = ?auto_2393892 ?auto_2393893 ) ) ( not ( = ?auto_2393892 ?auto_2393894 ) ) ( not ( = ?auto_2393892 ?auto_2393895 ) ) ( not ( = ?auto_2393892 ?auto_2393896 ) ) ( not ( = ?auto_2393892 ?auto_2393897 ) ) ( not ( = ?auto_2393892 ?auto_2393899 ) ) ( not ( = ?auto_2393893 ?auto_2393894 ) ) ( not ( = ?auto_2393893 ?auto_2393895 ) ) ( not ( = ?auto_2393893 ?auto_2393896 ) ) ( not ( = ?auto_2393893 ?auto_2393897 ) ) ( not ( = ?auto_2393893 ?auto_2393899 ) ) ( not ( = ?auto_2393894 ?auto_2393895 ) ) ( not ( = ?auto_2393894 ?auto_2393896 ) ) ( not ( = ?auto_2393894 ?auto_2393897 ) ) ( not ( = ?auto_2393894 ?auto_2393899 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393895 ?auto_2393896 ?auto_2393897 )
      ( MAKE-5CRATE-VERIFY ?auto_2393892 ?auto_2393893 ?auto_2393894 ?auto_2393895 ?auto_2393896 ?auto_2393897 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2393943 - SURFACE
      ?auto_2393944 - SURFACE
      ?auto_2393945 - SURFACE
      ?auto_2393946 - SURFACE
      ?auto_2393947 - SURFACE
      ?auto_2393948 - SURFACE
    )
    :vars
    (
      ?auto_2393950 - HOIST
      ?auto_2393951 - PLACE
      ?auto_2393949 - PLACE
      ?auto_2393952 - HOIST
      ?auto_2393954 - SURFACE
      ?auto_2393953 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393950 ?auto_2393951 ) ( SURFACE-AT ?auto_2393947 ?auto_2393951 ) ( CLEAR ?auto_2393947 ) ( IS-CRATE ?auto_2393948 ) ( not ( = ?auto_2393947 ?auto_2393948 ) ) ( AVAILABLE ?auto_2393950 ) ( ON ?auto_2393947 ?auto_2393946 ) ( not ( = ?auto_2393946 ?auto_2393947 ) ) ( not ( = ?auto_2393946 ?auto_2393948 ) ) ( not ( = ?auto_2393949 ?auto_2393951 ) ) ( HOIST-AT ?auto_2393952 ?auto_2393949 ) ( not ( = ?auto_2393950 ?auto_2393952 ) ) ( AVAILABLE ?auto_2393952 ) ( SURFACE-AT ?auto_2393948 ?auto_2393949 ) ( ON ?auto_2393948 ?auto_2393954 ) ( CLEAR ?auto_2393948 ) ( not ( = ?auto_2393947 ?auto_2393954 ) ) ( not ( = ?auto_2393948 ?auto_2393954 ) ) ( not ( = ?auto_2393946 ?auto_2393954 ) ) ( TRUCK-AT ?auto_2393953 ?auto_2393951 ) ( ON ?auto_2393944 ?auto_2393943 ) ( ON ?auto_2393945 ?auto_2393944 ) ( ON ?auto_2393946 ?auto_2393945 ) ( not ( = ?auto_2393943 ?auto_2393944 ) ) ( not ( = ?auto_2393943 ?auto_2393945 ) ) ( not ( = ?auto_2393943 ?auto_2393946 ) ) ( not ( = ?auto_2393943 ?auto_2393947 ) ) ( not ( = ?auto_2393943 ?auto_2393948 ) ) ( not ( = ?auto_2393943 ?auto_2393954 ) ) ( not ( = ?auto_2393944 ?auto_2393945 ) ) ( not ( = ?auto_2393944 ?auto_2393946 ) ) ( not ( = ?auto_2393944 ?auto_2393947 ) ) ( not ( = ?auto_2393944 ?auto_2393948 ) ) ( not ( = ?auto_2393944 ?auto_2393954 ) ) ( not ( = ?auto_2393945 ?auto_2393946 ) ) ( not ( = ?auto_2393945 ?auto_2393947 ) ) ( not ( = ?auto_2393945 ?auto_2393948 ) ) ( not ( = ?auto_2393945 ?auto_2393954 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393946 ?auto_2393947 ?auto_2393948 )
      ( MAKE-5CRATE-VERIFY ?auto_2393943 ?auto_2393944 ?auto_2393945 ?auto_2393946 ?auto_2393947 ?auto_2393948 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2393994 - SURFACE
      ?auto_2393995 - SURFACE
      ?auto_2393996 - SURFACE
      ?auto_2393997 - SURFACE
      ?auto_2393998 - SURFACE
      ?auto_2393999 - SURFACE
    )
    :vars
    (
      ?auto_2394002 - HOIST
      ?auto_2394001 - PLACE
      ?auto_2394000 - PLACE
      ?auto_2394004 - HOIST
      ?auto_2394003 - SURFACE
      ?auto_2394005 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2394002 ?auto_2394001 ) ( IS-CRATE ?auto_2393999 ) ( not ( = ?auto_2393998 ?auto_2393999 ) ) ( not ( = ?auto_2393997 ?auto_2393998 ) ) ( not ( = ?auto_2393997 ?auto_2393999 ) ) ( not ( = ?auto_2394000 ?auto_2394001 ) ) ( HOIST-AT ?auto_2394004 ?auto_2394000 ) ( not ( = ?auto_2394002 ?auto_2394004 ) ) ( AVAILABLE ?auto_2394004 ) ( SURFACE-AT ?auto_2393999 ?auto_2394000 ) ( ON ?auto_2393999 ?auto_2394003 ) ( CLEAR ?auto_2393999 ) ( not ( = ?auto_2393998 ?auto_2394003 ) ) ( not ( = ?auto_2393999 ?auto_2394003 ) ) ( not ( = ?auto_2393997 ?auto_2394003 ) ) ( TRUCK-AT ?auto_2394005 ?auto_2394001 ) ( SURFACE-AT ?auto_2393997 ?auto_2394001 ) ( CLEAR ?auto_2393997 ) ( LIFTING ?auto_2394002 ?auto_2393998 ) ( IS-CRATE ?auto_2393998 ) ( ON ?auto_2393995 ?auto_2393994 ) ( ON ?auto_2393996 ?auto_2393995 ) ( ON ?auto_2393997 ?auto_2393996 ) ( not ( = ?auto_2393994 ?auto_2393995 ) ) ( not ( = ?auto_2393994 ?auto_2393996 ) ) ( not ( = ?auto_2393994 ?auto_2393997 ) ) ( not ( = ?auto_2393994 ?auto_2393998 ) ) ( not ( = ?auto_2393994 ?auto_2393999 ) ) ( not ( = ?auto_2393994 ?auto_2394003 ) ) ( not ( = ?auto_2393995 ?auto_2393996 ) ) ( not ( = ?auto_2393995 ?auto_2393997 ) ) ( not ( = ?auto_2393995 ?auto_2393998 ) ) ( not ( = ?auto_2393995 ?auto_2393999 ) ) ( not ( = ?auto_2393995 ?auto_2394003 ) ) ( not ( = ?auto_2393996 ?auto_2393997 ) ) ( not ( = ?auto_2393996 ?auto_2393998 ) ) ( not ( = ?auto_2393996 ?auto_2393999 ) ) ( not ( = ?auto_2393996 ?auto_2394003 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393997 ?auto_2393998 ?auto_2393999 )
      ( MAKE-5CRATE-VERIFY ?auto_2393994 ?auto_2393995 ?auto_2393996 ?auto_2393997 ?auto_2393998 ?auto_2393999 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2394045 - SURFACE
      ?auto_2394046 - SURFACE
      ?auto_2394047 - SURFACE
      ?auto_2394048 - SURFACE
      ?auto_2394049 - SURFACE
      ?auto_2394050 - SURFACE
    )
    :vars
    (
      ?auto_2394052 - HOIST
      ?auto_2394054 - PLACE
      ?auto_2394053 - PLACE
      ?auto_2394056 - HOIST
      ?auto_2394051 - SURFACE
      ?auto_2394055 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2394052 ?auto_2394054 ) ( IS-CRATE ?auto_2394050 ) ( not ( = ?auto_2394049 ?auto_2394050 ) ) ( not ( = ?auto_2394048 ?auto_2394049 ) ) ( not ( = ?auto_2394048 ?auto_2394050 ) ) ( not ( = ?auto_2394053 ?auto_2394054 ) ) ( HOIST-AT ?auto_2394056 ?auto_2394053 ) ( not ( = ?auto_2394052 ?auto_2394056 ) ) ( AVAILABLE ?auto_2394056 ) ( SURFACE-AT ?auto_2394050 ?auto_2394053 ) ( ON ?auto_2394050 ?auto_2394051 ) ( CLEAR ?auto_2394050 ) ( not ( = ?auto_2394049 ?auto_2394051 ) ) ( not ( = ?auto_2394050 ?auto_2394051 ) ) ( not ( = ?auto_2394048 ?auto_2394051 ) ) ( TRUCK-AT ?auto_2394055 ?auto_2394054 ) ( SURFACE-AT ?auto_2394048 ?auto_2394054 ) ( CLEAR ?auto_2394048 ) ( IS-CRATE ?auto_2394049 ) ( AVAILABLE ?auto_2394052 ) ( IN ?auto_2394049 ?auto_2394055 ) ( ON ?auto_2394046 ?auto_2394045 ) ( ON ?auto_2394047 ?auto_2394046 ) ( ON ?auto_2394048 ?auto_2394047 ) ( not ( = ?auto_2394045 ?auto_2394046 ) ) ( not ( = ?auto_2394045 ?auto_2394047 ) ) ( not ( = ?auto_2394045 ?auto_2394048 ) ) ( not ( = ?auto_2394045 ?auto_2394049 ) ) ( not ( = ?auto_2394045 ?auto_2394050 ) ) ( not ( = ?auto_2394045 ?auto_2394051 ) ) ( not ( = ?auto_2394046 ?auto_2394047 ) ) ( not ( = ?auto_2394046 ?auto_2394048 ) ) ( not ( = ?auto_2394046 ?auto_2394049 ) ) ( not ( = ?auto_2394046 ?auto_2394050 ) ) ( not ( = ?auto_2394046 ?auto_2394051 ) ) ( not ( = ?auto_2394047 ?auto_2394048 ) ) ( not ( = ?auto_2394047 ?auto_2394049 ) ) ( not ( = ?auto_2394047 ?auto_2394050 ) ) ( not ( = ?auto_2394047 ?auto_2394051 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2394048 ?auto_2394049 ?auto_2394050 )
      ( MAKE-5CRATE-VERIFY ?auto_2394045 ?auto_2394046 ?auto_2394047 ?auto_2394048 ?auto_2394049 ?auto_2394050 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2395254 - SURFACE
      ?auto_2395255 - SURFACE
      ?auto_2395256 - SURFACE
      ?auto_2395257 - SURFACE
      ?auto_2395258 - SURFACE
      ?auto_2395259 - SURFACE
      ?auto_2395260 - SURFACE
    )
    :vars
    (
      ?auto_2395262 - HOIST
      ?auto_2395261 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2395262 ?auto_2395261 ) ( SURFACE-AT ?auto_2395259 ?auto_2395261 ) ( CLEAR ?auto_2395259 ) ( LIFTING ?auto_2395262 ?auto_2395260 ) ( IS-CRATE ?auto_2395260 ) ( not ( = ?auto_2395259 ?auto_2395260 ) ) ( ON ?auto_2395255 ?auto_2395254 ) ( ON ?auto_2395256 ?auto_2395255 ) ( ON ?auto_2395257 ?auto_2395256 ) ( ON ?auto_2395258 ?auto_2395257 ) ( ON ?auto_2395259 ?auto_2395258 ) ( not ( = ?auto_2395254 ?auto_2395255 ) ) ( not ( = ?auto_2395254 ?auto_2395256 ) ) ( not ( = ?auto_2395254 ?auto_2395257 ) ) ( not ( = ?auto_2395254 ?auto_2395258 ) ) ( not ( = ?auto_2395254 ?auto_2395259 ) ) ( not ( = ?auto_2395254 ?auto_2395260 ) ) ( not ( = ?auto_2395255 ?auto_2395256 ) ) ( not ( = ?auto_2395255 ?auto_2395257 ) ) ( not ( = ?auto_2395255 ?auto_2395258 ) ) ( not ( = ?auto_2395255 ?auto_2395259 ) ) ( not ( = ?auto_2395255 ?auto_2395260 ) ) ( not ( = ?auto_2395256 ?auto_2395257 ) ) ( not ( = ?auto_2395256 ?auto_2395258 ) ) ( not ( = ?auto_2395256 ?auto_2395259 ) ) ( not ( = ?auto_2395256 ?auto_2395260 ) ) ( not ( = ?auto_2395257 ?auto_2395258 ) ) ( not ( = ?auto_2395257 ?auto_2395259 ) ) ( not ( = ?auto_2395257 ?auto_2395260 ) ) ( not ( = ?auto_2395258 ?auto_2395259 ) ) ( not ( = ?auto_2395258 ?auto_2395260 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2395259 ?auto_2395260 )
      ( MAKE-6CRATE-VERIFY ?auto_2395254 ?auto_2395255 ?auto_2395256 ?auto_2395257 ?auto_2395258 ?auto_2395259 ?auto_2395260 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2395298 - SURFACE
      ?auto_2395299 - SURFACE
      ?auto_2395300 - SURFACE
      ?auto_2395301 - SURFACE
      ?auto_2395302 - SURFACE
      ?auto_2395303 - SURFACE
      ?auto_2395304 - SURFACE
    )
    :vars
    (
      ?auto_2395306 - HOIST
      ?auto_2395305 - PLACE
      ?auto_2395307 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2395306 ?auto_2395305 ) ( SURFACE-AT ?auto_2395303 ?auto_2395305 ) ( CLEAR ?auto_2395303 ) ( IS-CRATE ?auto_2395304 ) ( not ( = ?auto_2395303 ?auto_2395304 ) ) ( TRUCK-AT ?auto_2395307 ?auto_2395305 ) ( AVAILABLE ?auto_2395306 ) ( IN ?auto_2395304 ?auto_2395307 ) ( ON ?auto_2395303 ?auto_2395302 ) ( not ( = ?auto_2395302 ?auto_2395303 ) ) ( not ( = ?auto_2395302 ?auto_2395304 ) ) ( ON ?auto_2395299 ?auto_2395298 ) ( ON ?auto_2395300 ?auto_2395299 ) ( ON ?auto_2395301 ?auto_2395300 ) ( ON ?auto_2395302 ?auto_2395301 ) ( not ( = ?auto_2395298 ?auto_2395299 ) ) ( not ( = ?auto_2395298 ?auto_2395300 ) ) ( not ( = ?auto_2395298 ?auto_2395301 ) ) ( not ( = ?auto_2395298 ?auto_2395302 ) ) ( not ( = ?auto_2395298 ?auto_2395303 ) ) ( not ( = ?auto_2395298 ?auto_2395304 ) ) ( not ( = ?auto_2395299 ?auto_2395300 ) ) ( not ( = ?auto_2395299 ?auto_2395301 ) ) ( not ( = ?auto_2395299 ?auto_2395302 ) ) ( not ( = ?auto_2395299 ?auto_2395303 ) ) ( not ( = ?auto_2395299 ?auto_2395304 ) ) ( not ( = ?auto_2395300 ?auto_2395301 ) ) ( not ( = ?auto_2395300 ?auto_2395302 ) ) ( not ( = ?auto_2395300 ?auto_2395303 ) ) ( not ( = ?auto_2395300 ?auto_2395304 ) ) ( not ( = ?auto_2395301 ?auto_2395302 ) ) ( not ( = ?auto_2395301 ?auto_2395303 ) ) ( not ( = ?auto_2395301 ?auto_2395304 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2395302 ?auto_2395303 ?auto_2395304 )
      ( MAKE-6CRATE-VERIFY ?auto_2395298 ?auto_2395299 ?auto_2395300 ?auto_2395301 ?auto_2395302 ?auto_2395303 ?auto_2395304 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2395349 - SURFACE
      ?auto_2395350 - SURFACE
      ?auto_2395351 - SURFACE
      ?auto_2395352 - SURFACE
      ?auto_2395353 - SURFACE
      ?auto_2395354 - SURFACE
      ?auto_2395355 - SURFACE
    )
    :vars
    (
      ?auto_2395356 - HOIST
      ?auto_2395358 - PLACE
      ?auto_2395359 - TRUCK
      ?auto_2395357 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2395356 ?auto_2395358 ) ( SURFACE-AT ?auto_2395354 ?auto_2395358 ) ( CLEAR ?auto_2395354 ) ( IS-CRATE ?auto_2395355 ) ( not ( = ?auto_2395354 ?auto_2395355 ) ) ( AVAILABLE ?auto_2395356 ) ( IN ?auto_2395355 ?auto_2395359 ) ( ON ?auto_2395354 ?auto_2395353 ) ( not ( = ?auto_2395353 ?auto_2395354 ) ) ( not ( = ?auto_2395353 ?auto_2395355 ) ) ( TRUCK-AT ?auto_2395359 ?auto_2395357 ) ( not ( = ?auto_2395357 ?auto_2395358 ) ) ( ON ?auto_2395350 ?auto_2395349 ) ( ON ?auto_2395351 ?auto_2395350 ) ( ON ?auto_2395352 ?auto_2395351 ) ( ON ?auto_2395353 ?auto_2395352 ) ( not ( = ?auto_2395349 ?auto_2395350 ) ) ( not ( = ?auto_2395349 ?auto_2395351 ) ) ( not ( = ?auto_2395349 ?auto_2395352 ) ) ( not ( = ?auto_2395349 ?auto_2395353 ) ) ( not ( = ?auto_2395349 ?auto_2395354 ) ) ( not ( = ?auto_2395349 ?auto_2395355 ) ) ( not ( = ?auto_2395350 ?auto_2395351 ) ) ( not ( = ?auto_2395350 ?auto_2395352 ) ) ( not ( = ?auto_2395350 ?auto_2395353 ) ) ( not ( = ?auto_2395350 ?auto_2395354 ) ) ( not ( = ?auto_2395350 ?auto_2395355 ) ) ( not ( = ?auto_2395351 ?auto_2395352 ) ) ( not ( = ?auto_2395351 ?auto_2395353 ) ) ( not ( = ?auto_2395351 ?auto_2395354 ) ) ( not ( = ?auto_2395351 ?auto_2395355 ) ) ( not ( = ?auto_2395352 ?auto_2395353 ) ) ( not ( = ?auto_2395352 ?auto_2395354 ) ) ( not ( = ?auto_2395352 ?auto_2395355 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2395353 ?auto_2395354 ?auto_2395355 )
      ( MAKE-6CRATE-VERIFY ?auto_2395349 ?auto_2395350 ?auto_2395351 ?auto_2395352 ?auto_2395353 ?auto_2395354 ?auto_2395355 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2395406 - SURFACE
      ?auto_2395407 - SURFACE
      ?auto_2395408 - SURFACE
      ?auto_2395409 - SURFACE
      ?auto_2395410 - SURFACE
      ?auto_2395411 - SURFACE
      ?auto_2395412 - SURFACE
    )
    :vars
    (
      ?auto_2395413 - HOIST
      ?auto_2395417 - PLACE
      ?auto_2395415 - TRUCK
      ?auto_2395414 - PLACE
      ?auto_2395416 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2395413 ?auto_2395417 ) ( SURFACE-AT ?auto_2395411 ?auto_2395417 ) ( CLEAR ?auto_2395411 ) ( IS-CRATE ?auto_2395412 ) ( not ( = ?auto_2395411 ?auto_2395412 ) ) ( AVAILABLE ?auto_2395413 ) ( ON ?auto_2395411 ?auto_2395410 ) ( not ( = ?auto_2395410 ?auto_2395411 ) ) ( not ( = ?auto_2395410 ?auto_2395412 ) ) ( TRUCK-AT ?auto_2395415 ?auto_2395414 ) ( not ( = ?auto_2395414 ?auto_2395417 ) ) ( HOIST-AT ?auto_2395416 ?auto_2395414 ) ( LIFTING ?auto_2395416 ?auto_2395412 ) ( not ( = ?auto_2395413 ?auto_2395416 ) ) ( ON ?auto_2395407 ?auto_2395406 ) ( ON ?auto_2395408 ?auto_2395407 ) ( ON ?auto_2395409 ?auto_2395408 ) ( ON ?auto_2395410 ?auto_2395409 ) ( not ( = ?auto_2395406 ?auto_2395407 ) ) ( not ( = ?auto_2395406 ?auto_2395408 ) ) ( not ( = ?auto_2395406 ?auto_2395409 ) ) ( not ( = ?auto_2395406 ?auto_2395410 ) ) ( not ( = ?auto_2395406 ?auto_2395411 ) ) ( not ( = ?auto_2395406 ?auto_2395412 ) ) ( not ( = ?auto_2395407 ?auto_2395408 ) ) ( not ( = ?auto_2395407 ?auto_2395409 ) ) ( not ( = ?auto_2395407 ?auto_2395410 ) ) ( not ( = ?auto_2395407 ?auto_2395411 ) ) ( not ( = ?auto_2395407 ?auto_2395412 ) ) ( not ( = ?auto_2395408 ?auto_2395409 ) ) ( not ( = ?auto_2395408 ?auto_2395410 ) ) ( not ( = ?auto_2395408 ?auto_2395411 ) ) ( not ( = ?auto_2395408 ?auto_2395412 ) ) ( not ( = ?auto_2395409 ?auto_2395410 ) ) ( not ( = ?auto_2395409 ?auto_2395411 ) ) ( not ( = ?auto_2395409 ?auto_2395412 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2395410 ?auto_2395411 ?auto_2395412 )
      ( MAKE-6CRATE-VERIFY ?auto_2395406 ?auto_2395407 ?auto_2395408 ?auto_2395409 ?auto_2395410 ?auto_2395411 ?auto_2395412 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2395469 - SURFACE
      ?auto_2395470 - SURFACE
      ?auto_2395471 - SURFACE
      ?auto_2395472 - SURFACE
      ?auto_2395473 - SURFACE
      ?auto_2395474 - SURFACE
      ?auto_2395475 - SURFACE
    )
    :vars
    (
      ?auto_2395476 - HOIST
      ?auto_2395478 - PLACE
      ?auto_2395479 - TRUCK
      ?auto_2395477 - PLACE
      ?auto_2395480 - HOIST
      ?auto_2395481 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2395476 ?auto_2395478 ) ( SURFACE-AT ?auto_2395474 ?auto_2395478 ) ( CLEAR ?auto_2395474 ) ( IS-CRATE ?auto_2395475 ) ( not ( = ?auto_2395474 ?auto_2395475 ) ) ( AVAILABLE ?auto_2395476 ) ( ON ?auto_2395474 ?auto_2395473 ) ( not ( = ?auto_2395473 ?auto_2395474 ) ) ( not ( = ?auto_2395473 ?auto_2395475 ) ) ( TRUCK-AT ?auto_2395479 ?auto_2395477 ) ( not ( = ?auto_2395477 ?auto_2395478 ) ) ( HOIST-AT ?auto_2395480 ?auto_2395477 ) ( not ( = ?auto_2395476 ?auto_2395480 ) ) ( AVAILABLE ?auto_2395480 ) ( SURFACE-AT ?auto_2395475 ?auto_2395477 ) ( ON ?auto_2395475 ?auto_2395481 ) ( CLEAR ?auto_2395475 ) ( not ( = ?auto_2395474 ?auto_2395481 ) ) ( not ( = ?auto_2395475 ?auto_2395481 ) ) ( not ( = ?auto_2395473 ?auto_2395481 ) ) ( ON ?auto_2395470 ?auto_2395469 ) ( ON ?auto_2395471 ?auto_2395470 ) ( ON ?auto_2395472 ?auto_2395471 ) ( ON ?auto_2395473 ?auto_2395472 ) ( not ( = ?auto_2395469 ?auto_2395470 ) ) ( not ( = ?auto_2395469 ?auto_2395471 ) ) ( not ( = ?auto_2395469 ?auto_2395472 ) ) ( not ( = ?auto_2395469 ?auto_2395473 ) ) ( not ( = ?auto_2395469 ?auto_2395474 ) ) ( not ( = ?auto_2395469 ?auto_2395475 ) ) ( not ( = ?auto_2395469 ?auto_2395481 ) ) ( not ( = ?auto_2395470 ?auto_2395471 ) ) ( not ( = ?auto_2395470 ?auto_2395472 ) ) ( not ( = ?auto_2395470 ?auto_2395473 ) ) ( not ( = ?auto_2395470 ?auto_2395474 ) ) ( not ( = ?auto_2395470 ?auto_2395475 ) ) ( not ( = ?auto_2395470 ?auto_2395481 ) ) ( not ( = ?auto_2395471 ?auto_2395472 ) ) ( not ( = ?auto_2395471 ?auto_2395473 ) ) ( not ( = ?auto_2395471 ?auto_2395474 ) ) ( not ( = ?auto_2395471 ?auto_2395475 ) ) ( not ( = ?auto_2395471 ?auto_2395481 ) ) ( not ( = ?auto_2395472 ?auto_2395473 ) ) ( not ( = ?auto_2395472 ?auto_2395474 ) ) ( not ( = ?auto_2395472 ?auto_2395475 ) ) ( not ( = ?auto_2395472 ?auto_2395481 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2395473 ?auto_2395474 ?auto_2395475 )
      ( MAKE-6CRATE-VERIFY ?auto_2395469 ?auto_2395470 ?auto_2395471 ?auto_2395472 ?auto_2395473 ?auto_2395474 ?auto_2395475 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2395533 - SURFACE
      ?auto_2395534 - SURFACE
      ?auto_2395535 - SURFACE
      ?auto_2395536 - SURFACE
      ?auto_2395537 - SURFACE
      ?auto_2395538 - SURFACE
      ?auto_2395539 - SURFACE
    )
    :vars
    (
      ?auto_2395542 - HOIST
      ?auto_2395540 - PLACE
      ?auto_2395544 - PLACE
      ?auto_2395545 - HOIST
      ?auto_2395543 - SURFACE
      ?auto_2395541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2395542 ?auto_2395540 ) ( SURFACE-AT ?auto_2395538 ?auto_2395540 ) ( CLEAR ?auto_2395538 ) ( IS-CRATE ?auto_2395539 ) ( not ( = ?auto_2395538 ?auto_2395539 ) ) ( AVAILABLE ?auto_2395542 ) ( ON ?auto_2395538 ?auto_2395537 ) ( not ( = ?auto_2395537 ?auto_2395538 ) ) ( not ( = ?auto_2395537 ?auto_2395539 ) ) ( not ( = ?auto_2395544 ?auto_2395540 ) ) ( HOIST-AT ?auto_2395545 ?auto_2395544 ) ( not ( = ?auto_2395542 ?auto_2395545 ) ) ( AVAILABLE ?auto_2395545 ) ( SURFACE-AT ?auto_2395539 ?auto_2395544 ) ( ON ?auto_2395539 ?auto_2395543 ) ( CLEAR ?auto_2395539 ) ( not ( = ?auto_2395538 ?auto_2395543 ) ) ( not ( = ?auto_2395539 ?auto_2395543 ) ) ( not ( = ?auto_2395537 ?auto_2395543 ) ) ( TRUCK-AT ?auto_2395541 ?auto_2395540 ) ( ON ?auto_2395534 ?auto_2395533 ) ( ON ?auto_2395535 ?auto_2395534 ) ( ON ?auto_2395536 ?auto_2395535 ) ( ON ?auto_2395537 ?auto_2395536 ) ( not ( = ?auto_2395533 ?auto_2395534 ) ) ( not ( = ?auto_2395533 ?auto_2395535 ) ) ( not ( = ?auto_2395533 ?auto_2395536 ) ) ( not ( = ?auto_2395533 ?auto_2395537 ) ) ( not ( = ?auto_2395533 ?auto_2395538 ) ) ( not ( = ?auto_2395533 ?auto_2395539 ) ) ( not ( = ?auto_2395533 ?auto_2395543 ) ) ( not ( = ?auto_2395534 ?auto_2395535 ) ) ( not ( = ?auto_2395534 ?auto_2395536 ) ) ( not ( = ?auto_2395534 ?auto_2395537 ) ) ( not ( = ?auto_2395534 ?auto_2395538 ) ) ( not ( = ?auto_2395534 ?auto_2395539 ) ) ( not ( = ?auto_2395534 ?auto_2395543 ) ) ( not ( = ?auto_2395535 ?auto_2395536 ) ) ( not ( = ?auto_2395535 ?auto_2395537 ) ) ( not ( = ?auto_2395535 ?auto_2395538 ) ) ( not ( = ?auto_2395535 ?auto_2395539 ) ) ( not ( = ?auto_2395535 ?auto_2395543 ) ) ( not ( = ?auto_2395536 ?auto_2395537 ) ) ( not ( = ?auto_2395536 ?auto_2395538 ) ) ( not ( = ?auto_2395536 ?auto_2395539 ) ) ( not ( = ?auto_2395536 ?auto_2395543 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2395537 ?auto_2395538 ?auto_2395539 )
      ( MAKE-6CRATE-VERIFY ?auto_2395533 ?auto_2395534 ?auto_2395535 ?auto_2395536 ?auto_2395537 ?auto_2395538 ?auto_2395539 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2395597 - SURFACE
      ?auto_2395598 - SURFACE
      ?auto_2395599 - SURFACE
      ?auto_2395600 - SURFACE
      ?auto_2395601 - SURFACE
      ?auto_2395602 - SURFACE
      ?auto_2395603 - SURFACE
    )
    :vars
    (
      ?auto_2395607 - HOIST
      ?auto_2395606 - PLACE
      ?auto_2395608 - PLACE
      ?auto_2395609 - HOIST
      ?auto_2395604 - SURFACE
      ?auto_2395605 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2395607 ?auto_2395606 ) ( IS-CRATE ?auto_2395603 ) ( not ( = ?auto_2395602 ?auto_2395603 ) ) ( not ( = ?auto_2395601 ?auto_2395602 ) ) ( not ( = ?auto_2395601 ?auto_2395603 ) ) ( not ( = ?auto_2395608 ?auto_2395606 ) ) ( HOIST-AT ?auto_2395609 ?auto_2395608 ) ( not ( = ?auto_2395607 ?auto_2395609 ) ) ( AVAILABLE ?auto_2395609 ) ( SURFACE-AT ?auto_2395603 ?auto_2395608 ) ( ON ?auto_2395603 ?auto_2395604 ) ( CLEAR ?auto_2395603 ) ( not ( = ?auto_2395602 ?auto_2395604 ) ) ( not ( = ?auto_2395603 ?auto_2395604 ) ) ( not ( = ?auto_2395601 ?auto_2395604 ) ) ( TRUCK-AT ?auto_2395605 ?auto_2395606 ) ( SURFACE-AT ?auto_2395601 ?auto_2395606 ) ( CLEAR ?auto_2395601 ) ( LIFTING ?auto_2395607 ?auto_2395602 ) ( IS-CRATE ?auto_2395602 ) ( ON ?auto_2395598 ?auto_2395597 ) ( ON ?auto_2395599 ?auto_2395598 ) ( ON ?auto_2395600 ?auto_2395599 ) ( ON ?auto_2395601 ?auto_2395600 ) ( not ( = ?auto_2395597 ?auto_2395598 ) ) ( not ( = ?auto_2395597 ?auto_2395599 ) ) ( not ( = ?auto_2395597 ?auto_2395600 ) ) ( not ( = ?auto_2395597 ?auto_2395601 ) ) ( not ( = ?auto_2395597 ?auto_2395602 ) ) ( not ( = ?auto_2395597 ?auto_2395603 ) ) ( not ( = ?auto_2395597 ?auto_2395604 ) ) ( not ( = ?auto_2395598 ?auto_2395599 ) ) ( not ( = ?auto_2395598 ?auto_2395600 ) ) ( not ( = ?auto_2395598 ?auto_2395601 ) ) ( not ( = ?auto_2395598 ?auto_2395602 ) ) ( not ( = ?auto_2395598 ?auto_2395603 ) ) ( not ( = ?auto_2395598 ?auto_2395604 ) ) ( not ( = ?auto_2395599 ?auto_2395600 ) ) ( not ( = ?auto_2395599 ?auto_2395601 ) ) ( not ( = ?auto_2395599 ?auto_2395602 ) ) ( not ( = ?auto_2395599 ?auto_2395603 ) ) ( not ( = ?auto_2395599 ?auto_2395604 ) ) ( not ( = ?auto_2395600 ?auto_2395601 ) ) ( not ( = ?auto_2395600 ?auto_2395602 ) ) ( not ( = ?auto_2395600 ?auto_2395603 ) ) ( not ( = ?auto_2395600 ?auto_2395604 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2395601 ?auto_2395602 ?auto_2395603 )
      ( MAKE-6CRATE-VERIFY ?auto_2395597 ?auto_2395598 ?auto_2395599 ?auto_2395600 ?auto_2395601 ?auto_2395602 ?auto_2395603 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2395661 - SURFACE
      ?auto_2395662 - SURFACE
      ?auto_2395663 - SURFACE
      ?auto_2395664 - SURFACE
      ?auto_2395665 - SURFACE
      ?auto_2395666 - SURFACE
      ?auto_2395667 - SURFACE
    )
    :vars
    (
      ?auto_2395668 - HOIST
      ?auto_2395671 - PLACE
      ?auto_2395672 - PLACE
      ?auto_2395670 - HOIST
      ?auto_2395673 - SURFACE
      ?auto_2395669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2395668 ?auto_2395671 ) ( IS-CRATE ?auto_2395667 ) ( not ( = ?auto_2395666 ?auto_2395667 ) ) ( not ( = ?auto_2395665 ?auto_2395666 ) ) ( not ( = ?auto_2395665 ?auto_2395667 ) ) ( not ( = ?auto_2395672 ?auto_2395671 ) ) ( HOIST-AT ?auto_2395670 ?auto_2395672 ) ( not ( = ?auto_2395668 ?auto_2395670 ) ) ( AVAILABLE ?auto_2395670 ) ( SURFACE-AT ?auto_2395667 ?auto_2395672 ) ( ON ?auto_2395667 ?auto_2395673 ) ( CLEAR ?auto_2395667 ) ( not ( = ?auto_2395666 ?auto_2395673 ) ) ( not ( = ?auto_2395667 ?auto_2395673 ) ) ( not ( = ?auto_2395665 ?auto_2395673 ) ) ( TRUCK-AT ?auto_2395669 ?auto_2395671 ) ( SURFACE-AT ?auto_2395665 ?auto_2395671 ) ( CLEAR ?auto_2395665 ) ( IS-CRATE ?auto_2395666 ) ( AVAILABLE ?auto_2395668 ) ( IN ?auto_2395666 ?auto_2395669 ) ( ON ?auto_2395662 ?auto_2395661 ) ( ON ?auto_2395663 ?auto_2395662 ) ( ON ?auto_2395664 ?auto_2395663 ) ( ON ?auto_2395665 ?auto_2395664 ) ( not ( = ?auto_2395661 ?auto_2395662 ) ) ( not ( = ?auto_2395661 ?auto_2395663 ) ) ( not ( = ?auto_2395661 ?auto_2395664 ) ) ( not ( = ?auto_2395661 ?auto_2395665 ) ) ( not ( = ?auto_2395661 ?auto_2395666 ) ) ( not ( = ?auto_2395661 ?auto_2395667 ) ) ( not ( = ?auto_2395661 ?auto_2395673 ) ) ( not ( = ?auto_2395662 ?auto_2395663 ) ) ( not ( = ?auto_2395662 ?auto_2395664 ) ) ( not ( = ?auto_2395662 ?auto_2395665 ) ) ( not ( = ?auto_2395662 ?auto_2395666 ) ) ( not ( = ?auto_2395662 ?auto_2395667 ) ) ( not ( = ?auto_2395662 ?auto_2395673 ) ) ( not ( = ?auto_2395663 ?auto_2395664 ) ) ( not ( = ?auto_2395663 ?auto_2395665 ) ) ( not ( = ?auto_2395663 ?auto_2395666 ) ) ( not ( = ?auto_2395663 ?auto_2395667 ) ) ( not ( = ?auto_2395663 ?auto_2395673 ) ) ( not ( = ?auto_2395664 ?auto_2395665 ) ) ( not ( = ?auto_2395664 ?auto_2395666 ) ) ( not ( = ?auto_2395664 ?auto_2395667 ) ) ( not ( = ?auto_2395664 ?auto_2395673 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2395665 ?auto_2395666 ?auto_2395667 )
      ( MAKE-6CRATE-VERIFY ?auto_2395661 ?auto_2395662 ?auto_2395663 ?auto_2395664 ?auto_2395665 ?auto_2395666 ?auto_2395667 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2397617 - SURFACE
      ?auto_2397618 - SURFACE
      ?auto_2397619 - SURFACE
      ?auto_2397620 - SURFACE
      ?auto_2397621 - SURFACE
      ?auto_2397622 - SURFACE
      ?auto_2397623 - SURFACE
      ?auto_2397624 - SURFACE
    )
    :vars
    (
      ?auto_2397625 - HOIST
      ?auto_2397626 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2397625 ?auto_2397626 ) ( SURFACE-AT ?auto_2397623 ?auto_2397626 ) ( CLEAR ?auto_2397623 ) ( LIFTING ?auto_2397625 ?auto_2397624 ) ( IS-CRATE ?auto_2397624 ) ( not ( = ?auto_2397623 ?auto_2397624 ) ) ( ON ?auto_2397618 ?auto_2397617 ) ( ON ?auto_2397619 ?auto_2397618 ) ( ON ?auto_2397620 ?auto_2397619 ) ( ON ?auto_2397621 ?auto_2397620 ) ( ON ?auto_2397622 ?auto_2397621 ) ( ON ?auto_2397623 ?auto_2397622 ) ( not ( = ?auto_2397617 ?auto_2397618 ) ) ( not ( = ?auto_2397617 ?auto_2397619 ) ) ( not ( = ?auto_2397617 ?auto_2397620 ) ) ( not ( = ?auto_2397617 ?auto_2397621 ) ) ( not ( = ?auto_2397617 ?auto_2397622 ) ) ( not ( = ?auto_2397617 ?auto_2397623 ) ) ( not ( = ?auto_2397617 ?auto_2397624 ) ) ( not ( = ?auto_2397618 ?auto_2397619 ) ) ( not ( = ?auto_2397618 ?auto_2397620 ) ) ( not ( = ?auto_2397618 ?auto_2397621 ) ) ( not ( = ?auto_2397618 ?auto_2397622 ) ) ( not ( = ?auto_2397618 ?auto_2397623 ) ) ( not ( = ?auto_2397618 ?auto_2397624 ) ) ( not ( = ?auto_2397619 ?auto_2397620 ) ) ( not ( = ?auto_2397619 ?auto_2397621 ) ) ( not ( = ?auto_2397619 ?auto_2397622 ) ) ( not ( = ?auto_2397619 ?auto_2397623 ) ) ( not ( = ?auto_2397619 ?auto_2397624 ) ) ( not ( = ?auto_2397620 ?auto_2397621 ) ) ( not ( = ?auto_2397620 ?auto_2397622 ) ) ( not ( = ?auto_2397620 ?auto_2397623 ) ) ( not ( = ?auto_2397620 ?auto_2397624 ) ) ( not ( = ?auto_2397621 ?auto_2397622 ) ) ( not ( = ?auto_2397621 ?auto_2397623 ) ) ( not ( = ?auto_2397621 ?auto_2397624 ) ) ( not ( = ?auto_2397622 ?auto_2397623 ) ) ( not ( = ?auto_2397622 ?auto_2397624 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2397623 ?auto_2397624 )
      ( MAKE-7CRATE-VERIFY ?auto_2397617 ?auto_2397618 ?auto_2397619 ?auto_2397620 ?auto_2397621 ?auto_2397622 ?auto_2397623 ?auto_2397624 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2397672 - SURFACE
      ?auto_2397673 - SURFACE
      ?auto_2397674 - SURFACE
      ?auto_2397675 - SURFACE
      ?auto_2397676 - SURFACE
      ?auto_2397677 - SURFACE
      ?auto_2397678 - SURFACE
      ?auto_2397679 - SURFACE
    )
    :vars
    (
      ?auto_2397681 - HOIST
      ?auto_2397682 - PLACE
      ?auto_2397680 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2397681 ?auto_2397682 ) ( SURFACE-AT ?auto_2397678 ?auto_2397682 ) ( CLEAR ?auto_2397678 ) ( IS-CRATE ?auto_2397679 ) ( not ( = ?auto_2397678 ?auto_2397679 ) ) ( TRUCK-AT ?auto_2397680 ?auto_2397682 ) ( AVAILABLE ?auto_2397681 ) ( IN ?auto_2397679 ?auto_2397680 ) ( ON ?auto_2397678 ?auto_2397677 ) ( not ( = ?auto_2397677 ?auto_2397678 ) ) ( not ( = ?auto_2397677 ?auto_2397679 ) ) ( ON ?auto_2397673 ?auto_2397672 ) ( ON ?auto_2397674 ?auto_2397673 ) ( ON ?auto_2397675 ?auto_2397674 ) ( ON ?auto_2397676 ?auto_2397675 ) ( ON ?auto_2397677 ?auto_2397676 ) ( not ( = ?auto_2397672 ?auto_2397673 ) ) ( not ( = ?auto_2397672 ?auto_2397674 ) ) ( not ( = ?auto_2397672 ?auto_2397675 ) ) ( not ( = ?auto_2397672 ?auto_2397676 ) ) ( not ( = ?auto_2397672 ?auto_2397677 ) ) ( not ( = ?auto_2397672 ?auto_2397678 ) ) ( not ( = ?auto_2397672 ?auto_2397679 ) ) ( not ( = ?auto_2397673 ?auto_2397674 ) ) ( not ( = ?auto_2397673 ?auto_2397675 ) ) ( not ( = ?auto_2397673 ?auto_2397676 ) ) ( not ( = ?auto_2397673 ?auto_2397677 ) ) ( not ( = ?auto_2397673 ?auto_2397678 ) ) ( not ( = ?auto_2397673 ?auto_2397679 ) ) ( not ( = ?auto_2397674 ?auto_2397675 ) ) ( not ( = ?auto_2397674 ?auto_2397676 ) ) ( not ( = ?auto_2397674 ?auto_2397677 ) ) ( not ( = ?auto_2397674 ?auto_2397678 ) ) ( not ( = ?auto_2397674 ?auto_2397679 ) ) ( not ( = ?auto_2397675 ?auto_2397676 ) ) ( not ( = ?auto_2397675 ?auto_2397677 ) ) ( not ( = ?auto_2397675 ?auto_2397678 ) ) ( not ( = ?auto_2397675 ?auto_2397679 ) ) ( not ( = ?auto_2397676 ?auto_2397677 ) ) ( not ( = ?auto_2397676 ?auto_2397678 ) ) ( not ( = ?auto_2397676 ?auto_2397679 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2397677 ?auto_2397678 ?auto_2397679 )
      ( MAKE-7CRATE-VERIFY ?auto_2397672 ?auto_2397673 ?auto_2397674 ?auto_2397675 ?auto_2397676 ?auto_2397677 ?auto_2397678 ?auto_2397679 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2397735 - SURFACE
      ?auto_2397736 - SURFACE
      ?auto_2397737 - SURFACE
      ?auto_2397738 - SURFACE
      ?auto_2397739 - SURFACE
      ?auto_2397740 - SURFACE
      ?auto_2397741 - SURFACE
      ?auto_2397742 - SURFACE
    )
    :vars
    (
      ?auto_2397743 - HOIST
      ?auto_2397746 - PLACE
      ?auto_2397744 - TRUCK
      ?auto_2397745 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2397743 ?auto_2397746 ) ( SURFACE-AT ?auto_2397741 ?auto_2397746 ) ( CLEAR ?auto_2397741 ) ( IS-CRATE ?auto_2397742 ) ( not ( = ?auto_2397741 ?auto_2397742 ) ) ( AVAILABLE ?auto_2397743 ) ( IN ?auto_2397742 ?auto_2397744 ) ( ON ?auto_2397741 ?auto_2397740 ) ( not ( = ?auto_2397740 ?auto_2397741 ) ) ( not ( = ?auto_2397740 ?auto_2397742 ) ) ( TRUCK-AT ?auto_2397744 ?auto_2397745 ) ( not ( = ?auto_2397745 ?auto_2397746 ) ) ( ON ?auto_2397736 ?auto_2397735 ) ( ON ?auto_2397737 ?auto_2397736 ) ( ON ?auto_2397738 ?auto_2397737 ) ( ON ?auto_2397739 ?auto_2397738 ) ( ON ?auto_2397740 ?auto_2397739 ) ( not ( = ?auto_2397735 ?auto_2397736 ) ) ( not ( = ?auto_2397735 ?auto_2397737 ) ) ( not ( = ?auto_2397735 ?auto_2397738 ) ) ( not ( = ?auto_2397735 ?auto_2397739 ) ) ( not ( = ?auto_2397735 ?auto_2397740 ) ) ( not ( = ?auto_2397735 ?auto_2397741 ) ) ( not ( = ?auto_2397735 ?auto_2397742 ) ) ( not ( = ?auto_2397736 ?auto_2397737 ) ) ( not ( = ?auto_2397736 ?auto_2397738 ) ) ( not ( = ?auto_2397736 ?auto_2397739 ) ) ( not ( = ?auto_2397736 ?auto_2397740 ) ) ( not ( = ?auto_2397736 ?auto_2397741 ) ) ( not ( = ?auto_2397736 ?auto_2397742 ) ) ( not ( = ?auto_2397737 ?auto_2397738 ) ) ( not ( = ?auto_2397737 ?auto_2397739 ) ) ( not ( = ?auto_2397737 ?auto_2397740 ) ) ( not ( = ?auto_2397737 ?auto_2397741 ) ) ( not ( = ?auto_2397737 ?auto_2397742 ) ) ( not ( = ?auto_2397738 ?auto_2397739 ) ) ( not ( = ?auto_2397738 ?auto_2397740 ) ) ( not ( = ?auto_2397738 ?auto_2397741 ) ) ( not ( = ?auto_2397738 ?auto_2397742 ) ) ( not ( = ?auto_2397739 ?auto_2397740 ) ) ( not ( = ?auto_2397739 ?auto_2397741 ) ) ( not ( = ?auto_2397739 ?auto_2397742 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2397740 ?auto_2397741 ?auto_2397742 )
      ( MAKE-7CRATE-VERIFY ?auto_2397735 ?auto_2397736 ?auto_2397737 ?auto_2397738 ?auto_2397739 ?auto_2397740 ?auto_2397741 ?auto_2397742 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2397805 - SURFACE
      ?auto_2397806 - SURFACE
      ?auto_2397807 - SURFACE
      ?auto_2397808 - SURFACE
      ?auto_2397809 - SURFACE
      ?auto_2397810 - SURFACE
      ?auto_2397811 - SURFACE
      ?auto_2397812 - SURFACE
    )
    :vars
    (
      ?auto_2397813 - HOIST
      ?auto_2397815 - PLACE
      ?auto_2397817 - TRUCK
      ?auto_2397814 - PLACE
      ?auto_2397816 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2397813 ?auto_2397815 ) ( SURFACE-AT ?auto_2397811 ?auto_2397815 ) ( CLEAR ?auto_2397811 ) ( IS-CRATE ?auto_2397812 ) ( not ( = ?auto_2397811 ?auto_2397812 ) ) ( AVAILABLE ?auto_2397813 ) ( ON ?auto_2397811 ?auto_2397810 ) ( not ( = ?auto_2397810 ?auto_2397811 ) ) ( not ( = ?auto_2397810 ?auto_2397812 ) ) ( TRUCK-AT ?auto_2397817 ?auto_2397814 ) ( not ( = ?auto_2397814 ?auto_2397815 ) ) ( HOIST-AT ?auto_2397816 ?auto_2397814 ) ( LIFTING ?auto_2397816 ?auto_2397812 ) ( not ( = ?auto_2397813 ?auto_2397816 ) ) ( ON ?auto_2397806 ?auto_2397805 ) ( ON ?auto_2397807 ?auto_2397806 ) ( ON ?auto_2397808 ?auto_2397807 ) ( ON ?auto_2397809 ?auto_2397808 ) ( ON ?auto_2397810 ?auto_2397809 ) ( not ( = ?auto_2397805 ?auto_2397806 ) ) ( not ( = ?auto_2397805 ?auto_2397807 ) ) ( not ( = ?auto_2397805 ?auto_2397808 ) ) ( not ( = ?auto_2397805 ?auto_2397809 ) ) ( not ( = ?auto_2397805 ?auto_2397810 ) ) ( not ( = ?auto_2397805 ?auto_2397811 ) ) ( not ( = ?auto_2397805 ?auto_2397812 ) ) ( not ( = ?auto_2397806 ?auto_2397807 ) ) ( not ( = ?auto_2397806 ?auto_2397808 ) ) ( not ( = ?auto_2397806 ?auto_2397809 ) ) ( not ( = ?auto_2397806 ?auto_2397810 ) ) ( not ( = ?auto_2397806 ?auto_2397811 ) ) ( not ( = ?auto_2397806 ?auto_2397812 ) ) ( not ( = ?auto_2397807 ?auto_2397808 ) ) ( not ( = ?auto_2397807 ?auto_2397809 ) ) ( not ( = ?auto_2397807 ?auto_2397810 ) ) ( not ( = ?auto_2397807 ?auto_2397811 ) ) ( not ( = ?auto_2397807 ?auto_2397812 ) ) ( not ( = ?auto_2397808 ?auto_2397809 ) ) ( not ( = ?auto_2397808 ?auto_2397810 ) ) ( not ( = ?auto_2397808 ?auto_2397811 ) ) ( not ( = ?auto_2397808 ?auto_2397812 ) ) ( not ( = ?auto_2397809 ?auto_2397810 ) ) ( not ( = ?auto_2397809 ?auto_2397811 ) ) ( not ( = ?auto_2397809 ?auto_2397812 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2397810 ?auto_2397811 ?auto_2397812 )
      ( MAKE-7CRATE-VERIFY ?auto_2397805 ?auto_2397806 ?auto_2397807 ?auto_2397808 ?auto_2397809 ?auto_2397810 ?auto_2397811 ?auto_2397812 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2397882 - SURFACE
      ?auto_2397883 - SURFACE
      ?auto_2397884 - SURFACE
      ?auto_2397885 - SURFACE
      ?auto_2397886 - SURFACE
      ?auto_2397887 - SURFACE
      ?auto_2397888 - SURFACE
      ?auto_2397889 - SURFACE
    )
    :vars
    (
      ?auto_2397895 - HOIST
      ?auto_2397894 - PLACE
      ?auto_2397893 - TRUCK
      ?auto_2397892 - PLACE
      ?auto_2397890 - HOIST
      ?auto_2397891 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2397895 ?auto_2397894 ) ( SURFACE-AT ?auto_2397888 ?auto_2397894 ) ( CLEAR ?auto_2397888 ) ( IS-CRATE ?auto_2397889 ) ( not ( = ?auto_2397888 ?auto_2397889 ) ) ( AVAILABLE ?auto_2397895 ) ( ON ?auto_2397888 ?auto_2397887 ) ( not ( = ?auto_2397887 ?auto_2397888 ) ) ( not ( = ?auto_2397887 ?auto_2397889 ) ) ( TRUCK-AT ?auto_2397893 ?auto_2397892 ) ( not ( = ?auto_2397892 ?auto_2397894 ) ) ( HOIST-AT ?auto_2397890 ?auto_2397892 ) ( not ( = ?auto_2397895 ?auto_2397890 ) ) ( AVAILABLE ?auto_2397890 ) ( SURFACE-AT ?auto_2397889 ?auto_2397892 ) ( ON ?auto_2397889 ?auto_2397891 ) ( CLEAR ?auto_2397889 ) ( not ( = ?auto_2397888 ?auto_2397891 ) ) ( not ( = ?auto_2397889 ?auto_2397891 ) ) ( not ( = ?auto_2397887 ?auto_2397891 ) ) ( ON ?auto_2397883 ?auto_2397882 ) ( ON ?auto_2397884 ?auto_2397883 ) ( ON ?auto_2397885 ?auto_2397884 ) ( ON ?auto_2397886 ?auto_2397885 ) ( ON ?auto_2397887 ?auto_2397886 ) ( not ( = ?auto_2397882 ?auto_2397883 ) ) ( not ( = ?auto_2397882 ?auto_2397884 ) ) ( not ( = ?auto_2397882 ?auto_2397885 ) ) ( not ( = ?auto_2397882 ?auto_2397886 ) ) ( not ( = ?auto_2397882 ?auto_2397887 ) ) ( not ( = ?auto_2397882 ?auto_2397888 ) ) ( not ( = ?auto_2397882 ?auto_2397889 ) ) ( not ( = ?auto_2397882 ?auto_2397891 ) ) ( not ( = ?auto_2397883 ?auto_2397884 ) ) ( not ( = ?auto_2397883 ?auto_2397885 ) ) ( not ( = ?auto_2397883 ?auto_2397886 ) ) ( not ( = ?auto_2397883 ?auto_2397887 ) ) ( not ( = ?auto_2397883 ?auto_2397888 ) ) ( not ( = ?auto_2397883 ?auto_2397889 ) ) ( not ( = ?auto_2397883 ?auto_2397891 ) ) ( not ( = ?auto_2397884 ?auto_2397885 ) ) ( not ( = ?auto_2397884 ?auto_2397886 ) ) ( not ( = ?auto_2397884 ?auto_2397887 ) ) ( not ( = ?auto_2397884 ?auto_2397888 ) ) ( not ( = ?auto_2397884 ?auto_2397889 ) ) ( not ( = ?auto_2397884 ?auto_2397891 ) ) ( not ( = ?auto_2397885 ?auto_2397886 ) ) ( not ( = ?auto_2397885 ?auto_2397887 ) ) ( not ( = ?auto_2397885 ?auto_2397888 ) ) ( not ( = ?auto_2397885 ?auto_2397889 ) ) ( not ( = ?auto_2397885 ?auto_2397891 ) ) ( not ( = ?auto_2397886 ?auto_2397887 ) ) ( not ( = ?auto_2397886 ?auto_2397888 ) ) ( not ( = ?auto_2397886 ?auto_2397889 ) ) ( not ( = ?auto_2397886 ?auto_2397891 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2397887 ?auto_2397888 ?auto_2397889 )
      ( MAKE-7CRATE-VERIFY ?auto_2397882 ?auto_2397883 ?auto_2397884 ?auto_2397885 ?auto_2397886 ?auto_2397887 ?auto_2397888 ?auto_2397889 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2397960 - SURFACE
      ?auto_2397961 - SURFACE
      ?auto_2397962 - SURFACE
      ?auto_2397963 - SURFACE
      ?auto_2397964 - SURFACE
      ?auto_2397965 - SURFACE
      ?auto_2397966 - SURFACE
      ?auto_2397967 - SURFACE
    )
    :vars
    (
      ?auto_2397971 - HOIST
      ?auto_2397970 - PLACE
      ?auto_2397972 - PLACE
      ?auto_2397968 - HOIST
      ?auto_2397969 - SURFACE
      ?auto_2397973 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2397971 ?auto_2397970 ) ( SURFACE-AT ?auto_2397966 ?auto_2397970 ) ( CLEAR ?auto_2397966 ) ( IS-CRATE ?auto_2397967 ) ( not ( = ?auto_2397966 ?auto_2397967 ) ) ( AVAILABLE ?auto_2397971 ) ( ON ?auto_2397966 ?auto_2397965 ) ( not ( = ?auto_2397965 ?auto_2397966 ) ) ( not ( = ?auto_2397965 ?auto_2397967 ) ) ( not ( = ?auto_2397972 ?auto_2397970 ) ) ( HOIST-AT ?auto_2397968 ?auto_2397972 ) ( not ( = ?auto_2397971 ?auto_2397968 ) ) ( AVAILABLE ?auto_2397968 ) ( SURFACE-AT ?auto_2397967 ?auto_2397972 ) ( ON ?auto_2397967 ?auto_2397969 ) ( CLEAR ?auto_2397967 ) ( not ( = ?auto_2397966 ?auto_2397969 ) ) ( not ( = ?auto_2397967 ?auto_2397969 ) ) ( not ( = ?auto_2397965 ?auto_2397969 ) ) ( TRUCK-AT ?auto_2397973 ?auto_2397970 ) ( ON ?auto_2397961 ?auto_2397960 ) ( ON ?auto_2397962 ?auto_2397961 ) ( ON ?auto_2397963 ?auto_2397962 ) ( ON ?auto_2397964 ?auto_2397963 ) ( ON ?auto_2397965 ?auto_2397964 ) ( not ( = ?auto_2397960 ?auto_2397961 ) ) ( not ( = ?auto_2397960 ?auto_2397962 ) ) ( not ( = ?auto_2397960 ?auto_2397963 ) ) ( not ( = ?auto_2397960 ?auto_2397964 ) ) ( not ( = ?auto_2397960 ?auto_2397965 ) ) ( not ( = ?auto_2397960 ?auto_2397966 ) ) ( not ( = ?auto_2397960 ?auto_2397967 ) ) ( not ( = ?auto_2397960 ?auto_2397969 ) ) ( not ( = ?auto_2397961 ?auto_2397962 ) ) ( not ( = ?auto_2397961 ?auto_2397963 ) ) ( not ( = ?auto_2397961 ?auto_2397964 ) ) ( not ( = ?auto_2397961 ?auto_2397965 ) ) ( not ( = ?auto_2397961 ?auto_2397966 ) ) ( not ( = ?auto_2397961 ?auto_2397967 ) ) ( not ( = ?auto_2397961 ?auto_2397969 ) ) ( not ( = ?auto_2397962 ?auto_2397963 ) ) ( not ( = ?auto_2397962 ?auto_2397964 ) ) ( not ( = ?auto_2397962 ?auto_2397965 ) ) ( not ( = ?auto_2397962 ?auto_2397966 ) ) ( not ( = ?auto_2397962 ?auto_2397967 ) ) ( not ( = ?auto_2397962 ?auto_2397969 ) ) ( not ( = ?auto_2397963 ?auto_2397964 ) ) ( not ( = ?auto_2397963 ?auto_2397965 ) ) ( not ( = ?auto_2397963 ?auto_2397966 ) ) ( not ( = ?auto_2397963 ?auto_2397967 ) ) ( not ( = ?auto_2397963 ?auto_2397969 ) ) ( not ( = ?auto_2397964 ?auto_2397965 ) ) ( not ( = ?auto_2397964 ?auto_2397966 ) ) ( not ( = ?auto_2397964 ?auto_2397967 ) ) ( not ( = ?auto_2397964 ?auto_2397969 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2397965 ?auto_2397966 ?auto_2397967 )
      ( MAKE-7CRATE-VERIFY ?auto_2397960 ?auto_2397961 ?auto_2397962 ?auto_2397963 ?auto_2397964 ?auto_2397965 ?auto_2397966 ?auto_2397967 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2398038 - SURFACE
      ?auto_2398039 - SURFACE
      ?auto_2398040 - SURFACE
      ?auto_2398041 - SURFACE
      ?auto_2398042 - SURFACE
      ?auto_2398043 - SURFACE
      ?auto_2398044 - SURFACE
      ?auto_2398045 - SURFACE
    )
    :vars
    (
      ?auto_2398049 - HOIST
      ?auto_2398048 - PLACE
      ?auto_2398046 - PLACE
      ?auto_2398047 - HOIST
      ?auto_2398051 - SURFACE
      ?auto_2398050 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2398049 ?auto_2398048 ) ( IS-CRATE ?auto_2398045 ) ( not ( = ?auto_2398044 ?auto_2398045 ) ) ( not ( = ?auto_2398043 ?auto_2398044 ) ) ( not ( = ?auto_2398043 ?auto_2398045 ) ) ( not ( = ?auto_2398046 ?auto_2398048 ) ) ( HOIST-AT ?auto_2398047 ?auto_2398046 ) ( not ( = ?auto_2398049 ?auto_2398047 ) ) ( AVAILABLE ?auto_2398047 ) ( SURFACE-AT ?auto_2398045 ?auto_2398046 ) ( ON ?auto_2398045 ?auto_2398051 ) ( CLEAR ?auto_2398045 ) ( not ( = ?auto_2398044 ?auto_2398051 ) ) ( not ( = ?auto_2398045 ?auto_2398051 ) ) ( not ( = ?auto_2398043 ?auto_2398051 ) ) ( TRUCK-AT ?auto_2398050 ?auto_2398048 ) ( SURFACE-AT ?auto_2398043 ?auto_2398048 ) ( CLEAR ?auto_2398043 ) ( LIFTING ?auto_2398049 ?auto_2398044 ) ( IS-CRATE ?auto_2398044 ) ( ON ?auto_2398039 ?auto_2398038 ) ( ON ?auto_2398040 ?auto_2398039 ) ( ON ?auto_2398041 ?auto_2398040 ) ( ON ?auto_2398042 ?auto_2398041 ) ( ON ?auto_2398043 ?auto_2398042 ) ( not ( = ?auto_2398038 ?auto_2398039 ) ) ( not ( = ?auto_2398038 ?auto_2398040 ) ) ( not ( = ?auto_2398038 ?auto_2398041 ) ) ( not ( = ?auto_2398038 ?auto_2398042 ) ) ( not ( = ?auto_2398038 ?auto_2398043 ) ) ( not ( = ?auto_2398038 ?auto_2398044 ) ) ( not ( = ?auto_2398038 ?auto_2398045 ) ) ( not ( = ?auto_2398038 ?auto_2398051 ) ) ( not ( = ?auto_2398039 ?auto_2398040 ) ) ( not ( = ?auto_2398039 ?auto_2398041 ) ) ( not ( = ?auto_2398039 ?auto_2398042 ) ) ( not ( = ?auto_2398039 ?auto_2398043 ) ) ( not ( = ?auto_2398039 ?auto_2398044 ) ) ( not ( = ?auto_2398039 ?auto_2398045 ) ) ( not ( = ?auto_2398039 ?auto_2398051 ) ) ( not ( = ?auto_2398040 ?auto_2398041 ) ) ( not ( = ?auto_2398040 ?auto_2398042 ) ) ( not ( = ?auto_2398040 ?auto_2398043 ) ) ( not ( = ?auto_2398040 ?auto_2398044 ) ) ( not ( = ?auto_2398040 ?auto_2398045 ) ) ( not ( = ?auto_2398040 ?auto_2398051 ) ) ( not ( = ?auto_2398041 ?auto_2398042 ) ) ( not ( = ?auto_2398041 ?auto_2398043 ) ) ( not ( = ?auto_2398041 ?auto_2398044 ) ) ( not ( = ?auto_2398041 ?auto_2398045 ) ) ( not ( = ?auto_2398041 ?auto_2398051 ) ) ( not ( = ?auto_2398042 ?auto_2398043 ) ) ( not ( = ?auto_2398042 ?auto_2398044 ) ) ( not ( = ?auto_2398042 ?auto_2398045 ) ) ( not ( = ?auto_2398042 ?auto_2398051 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2398043 ?auto_2398044 ?auto_2398045 )
      ( MAKE-7CRATE-VERIFY ?auto_2398038 ?auto_2398039 ?auto_2398040 ?auto_2398041 ?auto_2398042 ?auto_2398043 ?auto_2398044 ?auto_2398045 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2398116 - SURFACE
      ?auto_2398117 - SURFACE
      ?auto_2398118 - SURFACE
      ?auto_2398119 - SURFACE
      ?auto_2398120 - SURFACE
      ?auto_2398121 - SURFACE
      ?auto_2398122 - SURFACE
      ?auto_2398123 - SURFACE
    )
    :vars
    (
      ?auto_2398127 - HOIST
      ?auto_2398128 - PLACE
      ?auto_2398124 - PLACE
      ?auto_2398129 - HOIST
      ?auto_2398125 - SURFACE
      ?auto_2398126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2398127 ?auto_2398128 ) ( IS-CRATE ?auto_2398123 ) ( not ( = ?auto_2398122 ?auto_2398123 ) ) ( not ( = ?auto_2398121 ?auto_2398122 ) ) ( not ( = ?auto_2398121 ?auto_2398123 ) ) ( not ( = ?auto_2398124 ?auto_2398128 ) ) ( HOIST-AT ?auto_2398129 ?auto_2398124 ) ( not ( = ?auto_2398127 ?auto_2398129 ) ) ( AVAILABLE ?auto_2398129 ) ( SURFACE-AT ?auto_2398123 ?auto_2398124 ) ( ON ?auto_2398123 ?auto_2398125 ) ( CLEAR ?auto_2398123 ) ( not ( = ?auto_2398122 ?auto_2398125 ) ) ( not ( = ?auto_2398123 ?auto_2398125 ) ) ( not ( = ?auto_2398121 ?auto_2398125 ) ) ( TRUCK-AT ?auto_2398126 ?auto_2398128 ) ( SURFACE-AT ?auto_2398121 ?auto_2398128 ) ( CLEAR ?auto_2398121 ) ( IS-CRATE ?auto_2398122 ) ( AVAILABLE ?auto_2398127 ) ( IN ?auto_2398122 ?auto_2398126 ) ( ON ?auto_2398117 ?auto_2398116 ) ( ON ?auto_2398118 ?auto_2398117 ) ( ON ?auto_2398119 ?auto_2398118 ) ( ON ?auto_2398120 ?auto_2398119 ) ( ON ?auto_2398121 ?auto_2398120 ) ( not ( = ?auto_2398116 ?auto_2398117 ) ) ( not ( = ?auto_2398116 ?auto_2398118 ) ) ( not ( = ?auto_2398116 ?auto_2398119 ) ) ( not ( = ?auto_2398116 ?auto_2398120 ) ) ( not ( = ?auto_2398116 ?auto_2398121 ) ) ( not ( = ?auto_2398116 ?auto_2398122 ) ) ( not ( = ?auto_2398116 ?auto_2398123 ) ) ( not ( = ?auto_2398116 ?auto_2398125 ) ) ( not ( = ?auto_2398117 ?auto_2398118 ) ) ( not ( = ?auto_2398117 ?auto_2398119 ) ) ( not ( = ?auto_2398117 ?auto_2398120 ) ) ( not ( = ?auto_2398117 ?auto_2398121 ) ) ( not ( = ?auto_2398117 ?auto_2398122 ) ) ( not ( = ?auto_2398117 ?auto_2398123 ) ) ( not ( = ?auto_2398117 ?auto_2398125 ) ) ( not ( = ?auto_2398118 ?auto_2398119 ) ) ( not ( = ?auto_2398118 ?auto_2398120 ) ) ( not ( = ?auto_2398118 ?auto_2398121 ) ) ( not ( = ?auto_2398118 ?auto_2398122 ) ) ( not ( = ?auto_2398118 ?auto_2398123 ) ) ( not ( = ?auto_2398118 ?auto_2398125 ) ) ( not ( = ?auto_2398119 ?auto_2398120 ) ) ( not ( = ?auto_2398119 ?auto_2398121 ) ) ( not ( = ?auto_2398119 ?auto_2398122 ) ) ( not ( = ?auto_2398119 ?auto_2398123 ) ) ( not ( = ?auto_2398119 ?auto_2398125 ) ) ( not ( = ?auto_2398120 ?auto_2398121 ) ) ( not ( = ?auto_2398120 ?auto_2398122 ) ) ( not ( = ?auto_2398120 ?auto_2398123 ) ) ( not ( = ?auto_2398120 ?auto_2398125 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2398121 ?auto_2398122 ?auto_2398123 )
      ( MAKE-7CRATE-VERIFY ?auto_2398116 ?auto_2398117 ?auto_2398118 ?auto_2398119 ?auto_2398120 ?auto_2398121 ?auto_2398122 ?auto_2398123 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2401035 - SURFACE
      ?auto_2401036 - SURFACE
      ?auto_2401037 - SURFACE
      ?auto_2401038 - SURFACE
      ?auto_2401039 - SURFACE
      ?auto_2401040 - SURFACE
      ?auto_2401041 - SURFACE
      ?auto_2401042 - SURFACE
      ?auto_2401043 - SURFACE
    )
    :vars
    (
      ?auto_2401045 - HOIST
      ?auto_2401044 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2401045 ?auto_2401044 ) ( SURFACE-AT ?auto_2401042 ?auto_2401044 ) ( CLEAR ?auto_2401042 ) ( LIFTING ?auto_2401045 ?auto_2401043 ) ( IS-CRATE ?auto_2401043 ) ( not ( = ?auto_2401042 ?auto_2401043 ) ) ( ON ?auto_2401036 ?auto_2401035 ) ( ON ?auto_2401037 ?auto_2401036 ) ( ON ?auto_2401038 ?auto_2401037 ) ( ON ?auto_2401039 ?auto_2401038 ) ( ON ?auto_2401040 ?auto_2401039 ) ( ON ?auto_2401041 ?auto_2401040 ) ( ON ?auto_2401042 ?auto_2401041 ) ( not ( = ?auto_2401035 ?auto_2401036 ) ) ( not ( = ?auto_2401035 ?auto_2401037 ) ) ( not ( = ?auto_2401035 ?auto_2401038 ) ) ( not ( = ?auto_2401035 ?auto_2401039 ) ) ( not ( = ?auto_2401035 ?auto_2401040 ) ) ( not ( = ?auto_2401035 ?auto_2401041 ) ) ( not ( = ?auto_2401035 ?auto_2401042 ) ) ( not ( = ?auto_2401035 ?auto_2401043 ) ) ( not ( = ?auto_2401036 ?auto_2401037 ) ) ( not ( = ?auto_2401036 ?auto_2401038 ) ) ( not ( = ?auto_2401036 ?auto_2401039 ) ) ( not ( = ?auto_2401036 ?auto_2401040 ) ) ( not ( = ?auto_2401036 ?auto_2401041 ) ) ( not ( = ?auto_2401036 ?auto_2401042 ) ) ( not ( = ?auto_2401036 ?auto_2401043 ) ) ( not ( = ?auto_2401037 ?auto_2401038 ) ) ( not ( = ?auto_2401037 ?auto_2401039 ) ) ( not ( = ?auto_2401037 ?auto_2401040 ) ) ( not ( = ?auto_2401037 ?auto_2401041 ) ) ( not ( = ?auto_2401037 ?auto_2401042 ) ) ( not ( = ?auto_2401037 ?auto_2401043 ) ) ( not ( = ?auto_2401038 ?auto_2401039 ) ) ( not ( = ?auto_2401038 ?auto_2401040 ) ) ( not ( = ?auto_2401038 ?auto_2401041 ) ) ( not ( = ?auto_2401038 ?auto_2401042 ) ) ( not ( = ?auto_2401038 ?auto_2401043 ) ) ( not ( = ?auto_2401039 ?auto_2401040 ) ) ( not ( = ?auto_2401039 ?auto_2401041 ) ) ( not ( = ?auto_2401039 ?auto_2401042 ) ) ( not ( = ?auto_2401039 ?auto_2401043 ) ) ( not ( = ?auto_2401040 ?auto_2401041 ) ) ( not ( = ?auto_2401040 ?auto_2401042 ) ) ( not ( = ?auto_2401040 ?auto_2401043 ) ) ( not ( = ?auto_2401041 ?auto_2401042 ) ) ( not ( = ?auto_2401041 ?auto_2401043 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2401042 ?auto_2401043 )
      ( MAKE-8CRATE-VERIFY ?auto_2401035 ?auto_2401036 ?auto_2401037 ?auto_2401038 ?auto_2401039 ?auto_2401040 ?auto_2401041 ?auto_2401042 ?auto_2401043 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2401102 - SURFACE
      ?auto_2401103 - SURFACE
      ?auto_2401104 - SURFACE
      ?auto_2401105 - SURFACE
      ?auto_2401106 - SURFACE
      ?auto_2401107 - SURFACE
      ?auto_2401108 - SURFACE
      ?auto_2401109 - SURFACE
      ?auto_2401110 - SURFACE
    )
    :vars
    (
      ?auto_2401112 - HOIST
      ?auto_2401113 - PLACE
      ?auto_2401111 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2401112 ?auto_2401113 ) ( SURFACE-AT ?auto_2401109 ?auto_2401113 ) ( CLEAR ?auto_2401109 ) ( IS-CRATE ?auto_2401110 ) ( not ( = ?auto_2401109 ?auto_2401110 ) ) ( TRUCK-AT ?auto_2401111 ?auto_2401113 ) ( AVAILABLE ?auto_2401112 ) ( IN ?auto_2401110 ?auto_2401111 ) ( ON ?auto_2401109 ?auto_2401108 ) ( not ( = ?auto_2401108 ?auto_2401109 ) ) ( not ( = ?auto_2401108 ?auto_2401110 ) ) ( ON ?auto_2401103 ?auto_2401102 ) ( ON ?auto_2401104 ?auto_2401103 ) ( ON ?auto_2401105 ?auto_2401104 ) ( ON ?auto_2401106 ?auto_2401105 ) ( ON ?auto_2401107 ?auto_2401106 ) ( ON ?auto_2401108 ?auto_2401107 ) ( not ( = ?auto_2401102 ?auto_2401103 ) ) ( not ( = ?auto_2401102 ?auto_2401104 ) ) ( not ( = ?auto_2401102 ?auto_2401105 ) ) ( not ( = ?auto_2401102 ?auto_2401106 ) ) ( not ( = ?auto_2401102 ?auto_2401107 ) ) ( not ( = ?auto_2401102 ?auto_2401108 ) ) ( not ( = ?auto_2401102 ?auto_2401109 ) ) ( not ( = ?auto_2401102 ?auto_2401110 ) ) ( not ( = ?auto_2401103 ?auto_2401104 ) ) ( not ( = ?auto_2401103 ?auto_2401105 ) ) ( not ( = ?auto_2401103 ?auto_2401106 ) ) ( not ( = ?auto_2401103 ?auto_2401107 ) ) ( not ( = ?auto_2401103 ?auto_2401108 ) ) ( not ( = ?auto_2401103 ?auto_2401109 ) ) ( not ( = ?auto_2401103 ?auto_2401110 ) ) ( not ( = ?auto_2401104 ?auto_2401105 ) ) ( not ( = ?auto_2401104 ?auto_2401106 ) ) ( not ( = ?auto_2401104 ?auto_2401107 ) ) ( not ( = ?auto_2401104 ?auto_2401108 ) ) ( not ( = ?auto_2401104 ?auto_2401109 ) ) ( not ( = ?auto_2401104 ?auto_2401110 ) ) ( not ( = ?auto_2401105 ?auto_2401106 ) ) ( not ( = ?auto_2401105 ?auto_2401107 ) ) ( not ( = ?auto_2401105 ?auto_2401108 ) ) ( not ( = ?auto_2401105 ?auto_2401109 ) ) ( not ( = ?auto_2401105 ?auto_2401110 ) ) ( not ( = ?auto_2401106 ?auto_2401107 ) ) ( not ( = ?auto_2401106 ?auto_2401108 ) ) ( not ( = ?auto_2401106 ?auto_2401109 ) ) ( not ( = ?auto_2401106 ?auto_2401110 ) ) ( not ( = ?auto_2401107 ?auto_2401108 ) ) ( not ( = ?auto_2401107 ?auto_2401109 ) ) ( not ( = ?auto_2401107 ?auto_2401110 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2401108 ?auto_2401109 ?auto_2401110 )
      ( MAKE-8CRATE-VERIFY ?auto_2401102 ?auto_2401103 ?auto_2401104 ?auto_2401105 ?auto_2401106 ?auto_2401107 ?auto_2401108 ?auto_2401109 ?auto_2401110 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2401178 - SURFACE
      ?auto_2401179 - SURFACE
      ?auto_2401180 - SURFACE
      ?auto_2401181 - SURFACE
      ?auto_2401182 - SURFACE
      ?auto_2401183 - SURFACE
      ?auto_2401184 - SURFACE
      ?auto_2401185 - SURFACE
      ?auto_2401186 - SURFACE
    )
    :vars
    (
      ?auto_2401190 - HOIST
      ?auto_2401187 - PLACE
      ?auto_2401188 - TRUCK
      ?auto_2401189 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2401190 ?auto_2401187 ) ( SURFACE-AT ?auto_2401185 ?auto_2401187 ) ( CLEAR ?auto_2401185 ) ( IS-CRATE ?auto_2401186 ) ( not ( = ?auto_2401185 ?auto_2401186 ) ) ( AVAILABLE ?auto_2401190 ) ( IN ?auto_2401186 ?auto_2401188 ) ( ON ?auto_2401185 ?auto_2401184 ) ( not ( = ?auto_2401184 ?auto_2401185 ) ) ( not ( = ?auto_2401184 ?auto_2401186 ) ) ( TRUCK-AT ?auto_2401188 ?auto_2401189 ) ( not ( = ?auto_2401189 ?auto_2401187 ) ) ( ON ?auto_2401179 ?auto_2401178 ) ( ON ?auto_2401180 ?auto_2401179 ) ( ON ?auto_2401181 ?auto_2401180 ) ( ON ?auto_2401182 ?auto_2401181 ) ( ON ?auto_2401183 ?auto_2401182 ) ( ON ?auto_2401184 ?auto_2401183 ) ( not ( = ?auto_2401178 ?auto_2401179 ) ) ( not ( = ?auto_2401178 ?auto_2401180 ) ) ( not ( = ?auto_2401178 ?auto_2401181 ) ) ( not ( = ?auto_2401178 ?auto_2401182 ) ) ( not ( = ?auto_2401178 ?auto_2401183 ) ) ( not ( = ?auto_2401178 ?auto_2401184 ) ) ( not ( = ?auto_2401178 ?auto_2401185 ) ) ( not ( = ?auto_2401178 ?auto_2401186 ) ) ( not ( = ?auto_2401179 ?auto_2401180 ) ) ( not ( = ?auto_2401179 ?auto_2401181 ) ) ( not ( = ?auto_2401179 ?auto_2401182 ) ) ( not ( = ?auto_2401179 ?auto_2401183 ) ) ( not ( = ?auto_2401179 ?auto_2401184 ) ) ( not ( = ?auto_2401179 ?auto_2401185 ) ) ( not ( = ?auto_2401179 ?auto_2401186 ) ) ( not ( = ?auto_2401180 ?auto_2401181 ) ) ( not ( = ?auto_2401180 ?auto_2401182 ) ) ( not ( = ?auto_2401180 ?auto_2401183 ) ) ( not ( = ?auto_2401180 ?auto_2401184 ) ) ( not ( = ?auto_2401180 ?auto_2401185 ) ) ( not ( = ?auto_2401180 ?auto_2401186 ) ) ( not ( = ?auto_2401181 ?auto_2401182 ) ) ( not ( = ?auto_2401181 ?auto_2401183 ) ) ( not ( = ?auto_2401181 ?auto_2401184 ) ) ( not ( = ?auto_2401181 ?auto_2401185 ) ) ( not ( = ?auto_2401181 ?auto_2401186 ) ) ( not ( = ?auto_2401182 ?auto_2401183 ) ) ( not ( = ?auto_2401182 ?auto_2401184 ) ) ( not ( = ?auto_2401182 ?auto_2401185 ) ) ( not ( = ?auto_2401182 ?auto_2401186 ) ) ( not ( = ?auto_2401183 ?auto_2401184 ) ) ( not ( = ?auto_2401183 ?auto_2401185 ) ) ( not ( = ?auto_2401183 ?auto_2401186 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2401184 ?auto_2401185 ?auto_2401186 )
      ( MAKE-8CRATE-VERIFY ?auto_2401178 ?auto_2401179 ?auto_2401180 ?auto_2401181 ?auto_2401182 ?auto_2401183 ?auto_2401184 ?auto_2401185 ?auto_2401186 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2401262 - SURFACE
      ?auto_2401263 - SURFACE
      ?auto_2401264 - SURFACE
      ?auto_2401265 - SURFACE
      ?auto_2401266 - SURFACE
      ?auto_2401267 - SURFACE
      ?auto_2401268 - SURFACE
      ?auto_2401269 - SURFACE
      ?auto_2401270 - SURFACE
    )
    :vars
    (
      ?auto_2401273 - HOIST
      ?auto_2401275 - PLACE
      ?auto_2401271 - TRUCK
      ?auto_2401272 - PLACE
      ?auto_2401274 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2401273 ?auto_2401275 ) ( SURFACE-AT ?auto_2401269 ?auto_2401275 ) ( CLEAR ?auto_2401269 ) ( IS-CRATE ?auto_2401270 ) ( not ( = ?auto_2401269 ?auto_2401270 ) ) ( AVAILABLE ?auto_2401273 ) ( ON ?auto_2401269 ?auto_2401268 ) ( not ( = ?auto_2401268 ?auto_2401269 ) ) ( not ( = ?auto_2401268 ?auto_2401270 ) ) ( TRUCK-AT ?auto_2401271 ?auto_2401272 ) ( not ( = ?auto_2401272 ?auto_2401275 ) ) ( HOIST-AT ?auto_2401274 ?auto_2401272 ) ( LIFTING ?auto_2401274 ?auto_2401270 ) ( not ( = ?auto_2401273 ?auto_2401274 ) ) ( ON ?auto_2401263 ?auto_2401262 ) ( ON ?auto_2401264 ?auto_2401263 ) ( ON ?auto_2401265 ?auto_2401264 ) ( ON ?auto_2401266 ?auto_2401265 ) ( ON ?auto_2401267 ?auto_2401266 ) ( ON ?auto_2401268 ?auto_2401267 ) ( not ( = ?auto_2401262 ?auto_2401263 ) ) ( not ( = ?auto_2401262 ?auto_2401264 ) ) ( not ( = ?auto_2401262 ?auto_2401265 ) ) ( not ( = ?auto_2401262 ?auto_2401266 ) ) ( not ( = ?auto_2401262 ?auto_2401267 ) ) ( not ( = ?auto_2401262 ?auto_2401268 ) ) ( not ( = ?auto_2401262 ?auto_2401269 ) ) ( not ( = ?auto_2401262 ?auto_2401270 ) ) ( not ( = ?auto_2401263 ?auto_2401264 ) ) ( not ( = ?auto_2401263 ?auto_2401265 ) ) ( not ( = ?auto_2401263 ?auto_2401266 ) ) ( not ( = ?auto_2401263 ?auto_2401267 ) ) ( not ( = ?auto_2401263 ?auto_2401268 ) ) ( not ( = ?auto_2401263 ?auto_2401269 ) ) ( not ( = ?auto_2401263 ?auto_2401270 ) ) ( not ( = ?auto_2401264 ?auto_2401265 ) ) ( not ( = ?auto_2401264 ?auto_2401266 ) ) ( not ( = ?auto_2401264 ?auto_2401267 ) ) ( not ( = ?auto_2401264 ?auto_2401268 ) ) ( not ( = ?auto_2401264 ?auto_2401269 ) ) ( not ( = ?auto_2401264 ?auto_2401270 ) ) ( not ( = ?auto_2401265 ?auto_2401266 ) ) ( not ( = ?auto_2401265 ?auto_2401267 ) ) ( not ( = ?auto_2401265 ?auto_2401268 ) ) ( not ( = ?auto_2401265 ?auto_2401269 ) ) ( not ( = ?auto_2401265 ?auto_2401270 ) ) ( not ( = ?auto_2401266 ?auto_2401267 ) ) ( not ( = ?auto_2401266 ?auto_2401268 ) ) ( not ( = ?auto_2401266 ?auto_2401269 ) ) ( not ( = ?auto_2401266 ?auto_2401270 ) ) ( not ( = ?auto_2401267 ?auto_2401268 ) ) ( not ( = ?auto_2401267 ?auto_2401269 ) ) ( not ( = ?auto_2401267 ?auto_2401270 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2401268 ?auto_2401269 ?auto_2401270 )
      ( MAKE-8CRATE-VERIFY ?auto_2401262 ?auto_2401263 ?auto_2401264 ?auto_2401265 ?auto_2401266 ?auto_2401267 ?auto_2401268 ?auto_2401269 ?auto_2401270 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2401354 - SURFACE
      ?auto_2401355 - SURFACE
      ?auto_2401356 - SURFACE
      ?auto_2401357 - SURFACE
      ?auto_2401358 - SURFACE
      ?auto_2401359 - SURFACE
      ?auto_2401360 - SURFACE
      ?auto_2401361 - SURFACE
      ?auto_2401362 - SURFACE
    )
    :vars
    (
      ?auto_2401367 - HOIST
      ?auto_2401365 - PLACE
      ?auto_2401364 - TRUCK
      ?auto_2401368 - PLACE
      ?auto_2401363 - HOIST
      ?auto_2401366 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2401367 ?auto_2401365 ) ( SURFACE-AT ?auto_2401361 ?auto_2401365 ) ( CLEAR ?auto_2401361 ) ( IS-CRATE ?auto_2401362 ) ( not ( = ?auto_2401361 ?auto_2401362 ) ) ( AVAILABLE ?auto_2401367 ) ( ON ?auto_2401361 ?auto_2401360 ) ( not ( = ?auto_2401360 ?auto_2401361 ) ) ( not ( = ?auto_2401360 ?auto_2401362 ) ) ( TRUCK-AT ?auto_2401364 ?auto_2401368 ) ( not ( = ?auto_2401368 ?auto_2401365 ) ) ( HOIST-AT ?auto_2401363 ?auto_2401368 ) ( not ( = ?auto_2401367 ?auto_2401363 ) ) ( AVAILABLE ?auto_2401363 ) ( SURFACE-AT ?auto_2401362 ?auto_2401368 ) ( ON ?auto_2401362 ?auto_2401366 ) ( CLEAR ?auto_2401362 ) ( not ( = ?auto_2401361 ?auto_2401366 ) ) ( not ( = ?auto_2401362 ?auto_2401366 ) ) ( not ( = ?auto_2401360 ?auto_2401366 ) ) ( ON ?auto_2401355 ?auto_2401354 ) ( ON ?auto_2401356 ?auto_2401355 ) ( ON ?auto_2401357 ?auto_2401356 ) ( ON ?auto_2401358 ?auto_2401357 ) ( ON ?auto_2401359 ?auto_2401358 ) ( ON ?auto_2401360 ?auto_2401359 ) ( not ( = ?auto_2401354 ?auto_2401355 ) ) ( not ( = ?auto_2401354 ?auto_2401356 ) ) ( not ( = ?auto_2401354 ?auto_2401357 ) ) ( not ( = ?auto_2401354 ?auto_2401358 ) ) ( not ( = ?auto_2401354 ?auto_2401359 ) ) ( not ( = ?auto_2401354 ?auto_2401360 ) ) ( not ( = ?auto_2401354 ?auto_2401361 ) ) ( not ( = ?auto_2401354 ?auto_2401362 ) ) ( not ( = ?auto_2401354 ?auto_2401366 ) ) ( not ( = ?auto_2401355 ?auto_2401356 ) ) ( not ( = ?auto_2401355 ?auto_2401357 ) ) ( not ( = ?auto_2401355 ?auto_2401358 ) ) ( not ( = ?auto_2401355 ?auto_2401359 ) ) ( not ( = ?auto_2401355 ?auto_2401360 ) ) ( not ( = ?auto_2401355 ?auto_2401361 ) ) ( not ( = ?auto_2401355 ?auto_2401362 ) ) ( not ( = ?auto_2401355 ?auto_2401366 ) ) ( not ( = ?auto_2401356 ?auto_2401357 ) ) ( not ( = ?auto_2401356 ?auto_2401358 ) ) ( not ( = ?auto_2401356 ?auto_2401359 ) ) ( not ( = ?auto_2401356 ?auto_2401360 ) ) ( not ( = ?auto_2401356 ?auto_2401361 ) ) ( not ( = ?auto_2401356 ?auto_2401362 ) ) ( not ( = ?auto_2401356 ?auto_2401366 ) ) ( not ( = ?auto_2401357 ?auto_2401358 ) ) ( not ( = ?auto_2401357 ?auto_2401359 ) ) ( not ( = ?auto_2401357 ?auto_2401360 ) ) ( not ( = ?auto_2401357 ?auto_2401361 ) ) ( not ( = ?auto_2401357 ?auto_2401362 ) ) ( not ( = ?auto_2401357 ?auto_2401366 ) ) ( not ( = ?auto_2401358 ?auto_2401359 ) ) ( not ( = ?auto_2401358 ?auto_2401360 ) ) ( not ( = ?auto_2401358 ?auto_2401361 ) ) ( not ( = ?auto_2401358 ?auto_2401362 ) ) ( not ( = ?auto_2401358 ?auto_2401366 ) ) ( not ( = ?auto_2401359 ?auto_2401360 ) ) ( not ( = ?auto_2401359 ?auto_2401361 ) ) ( not ( = ?auto_2401359 ?auto_2401362 ) ) ( not ( = ?auto_2401359 ?auto_2401366 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2401360 ?auto_2401361 ?auto_2401362 )
      ( MAKE-8CRATE-VERIFY ?auto_2401354 ?auto_2401355 ?auto_2401356 ?auto_2401357 ?auto_2401358 ?auto_2401359 ?auto_2401360 ?auto_2401361 ?auto_2401362 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2401447 - SURFACE
      ?auto_2401448 - SURFACE
      ?auto_2401449 - SURFACE
      ?auto_2401450 - SURFACE
      ?auto_2401451 - SURFACE
      ?auto_2401452 - SURFACE
      ?auto_2401453 - SURFACE
      ?auto_2401454 - SURFACE
      ?auto_2401455 - SURFACE
    )
    :vars
    (
      ?auto_2401460 - HOIST
      ?auto_2401457 - PLACE
      ?auto_2401461 - PLACE
      ?auto_2401459 - HOIST
      ?auto_2401458 - SURFACE
      ?auto_2401456 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2401460 ?auto_2401457 ) ( SURFACE-AT ?auto_2401454 ?auto_2401457 ) ( CLEAR ?auto_2401454 ) ( IS-CRATE ?auto_2401455 ) ( not ( = ?auto_2401454 ?auto_2401455 ) ) ( AVAILABLE ?auto_2401460 ) ( ON ?auto_2401454 ?auto_2401453 ) ( not ( = ?auto_2401453 ?auto_2401454 ) ) ( not ( = ?auto_2401453 ?auto_2401455 ) ) ( not ( = ?auto_2401461 ?auto_2401457 ) ) ( HOIST-AT ?auto_2401459 ?auto_2401461 ) ( not ( = ?auto_2401460 ?auto_2401459 ) ) ( AVAILABLE ?auto_2401459 ) ( SURFACE-AT ?auto_2401455 ?auto_2401461 ) ( ON ?auto_2401455 ?auto_2401458 ) ( CLEAR ?auto_2401455 ) ( not ( = ?auto_2401454 ?auto_2401458 ) ) ( not ( = ?auto_2401455 ?auto_2401458 ) ) ( not ( = ?auto_2401453 ?auto_2401458 ) ) ( TRUCK-AT ?auto_2401456 ?auto_2401457 ) ( ON ?auto_2401448 ?auto_2401447 ) ( ON ?auto_2401449 ?auto_2401448 ) ( ON ?auto_2401450 ?auto_2401449 ) ( ON ?auto_2401451 ?auto_2401450 ) ( ON ?auto_2401452 ?auto_2401451 ) ( ON ?auto_2401453 ?auto_2401452 ) ( not ( = ?auto_2401447 ?auto_2401448 ) ) ( not ( = ?auto_2401447 ?auto_2401449 ) ) ( not ( = ?auto_2401447 ?auto_2401450 ) ) ( not ( = ?auto_2401447 ?auto_2401451 ) ) ( not ( = ?auto_2401447 ?auto_2401452 ) ) ( not ( = ?auto_2401447 ?auto_2401453 ) ) ( not ( = ?auto_2401447 ?auto_2401454 ) ) ( not ( = ?auto_2401447 ?auto_2401455 ) ) ( not ( = ?auto_2401447 ?auto_2401458 ) ) ( not ( = ?auto_2401448 ?auto_2401449 ) ) ( not ( = ?auto_2401448 ?auto_2401450 ) ) ( not ( = ?auto_2401448 ?auto_2401451 ) ) ( not ( = ?auto_2401448 ?auto_2401452 ) ) ( not ( = ?auto_2401448 ?auto_2401453 ) ) ( not ( = ?auto_2401448 ?auto_2401454 ) ) ( not ( = ?auto_2401448 ?auto_2401455 ) ) ( not ( = ?auto_2401448 ?auto_2401458 ) ) ( not ( = ?auto_2401449 ?auto_2401450 ) ) ( not ( = ?auto_2401449 ?auto_2401451 ) ) ( not ( = ?auto_2401449 ?auto_2401452 ) ) ( not ( = ?auto_2401449 ?auto_2401453 ) ) ( not ( = ?auto_2401449 ?auto_2401454 ) ) ( not ( = ?auto_2401449 ?auto_2401455 ) ) ( not ( = ?auto_2401449 ?auto_2401458 ) ) ( not ( = ?auto_2401450 ?auto_2401451 ) ) ( not ( = ?auto_2401450 ?auto_2401452 ) ) ( not ( = ?auto_2401450 ?auto_2401453 ) ) ( not ( = ?auto_2401450 ?auto_2401454 ) ) ( not ( = ?auto_2401450 ?auto_2401455 ) ) ( not ( = ?auto_2401450 ?auto_2401458 ) ) ( not ( = ?auto_2401451 ?auto_2401452 ) ) ( not ( = ?auto_2401451 ?auto_2401453 ) ) ( not ( = ?auto_2401451 ?auto_2401454 ) ) ( not ( = ?auto_2401451 ?auto_2401455 ) ) ( not ( = ?auto_2401451 ?auto_2401458 ) ) ( not ( = ?auto_2401452 ?auto_2401453 ) ) ( not ( = ?auto_2401452 ?auto_2401454 ) ) ( not ( = ?auto_2401452 ?auto_2401455 ) ) ( not ( = ?auto_2401452 ?auto_2401458 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2401453 ?auto_2401454 ?auto_2401455 )
      ( MAKE-8CRATE-VERIFY ?auto_2401447 ?auto_2401448 ?auto_2401449 ?auto_2401450 ?auto_2401451 ?auto_2401452 ?auto_2401453 ?auto_2401454 ?auto_2401455 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2401540 - SURFACE
      ?auto_2401541 - SURFACE
      ?auto_2401542 - SURFACE
      ?auto_2401543 - SURFACE
      ?auto_2401544 - SURFACE
      ?auto_2401545 - SURFACE
      ?auto_2401546 - SURFACE
      ?auto_2401547 - SURFACE
      ?auto_2401548 - SURFACE
    )
    :vars
    (
      ?auto_2401551 - HOIST
      ?auto_2401553 - PLACE
      ?auto_2401550 - PLACE
      ?auto_2401552 - HOIST
      ?auto_2401554 - SURFACE
      ?auto_2401549 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2401551 ?auto_2401553 ) ( IS-CRATE ?auto_2401548 ) ( not ( = ?auto_2401547 ?auto_2401548 ) ) ( not ( = ?auto_2401546 ?auto_2401547 ) ) ( not ( = ?auto_2401546 ?auto_2401548 ) ) ( not ( = ?auto_2401550 ?auto_2401553 ) ) ( HOIST-AT ?auto_2401552 ?auto_2401550 ) ( not ( = ?auto_2401551 ?auto_2401552 ) ) ( AVAILABLE ?auto_2401552 ) ( SURFACE-AT ?auto_2401548 ?auto_2401550 ) ( ON ?auto_2401548 ?auto_2401554 ) ( CLEAR ?auto_2401548 ) ( not ( = ?auto_2401547 ?auto_2401554 ) ) ( not ( = ?auto_2401548 ?auto_2401554 ) ) ( not ( = ?auto_2401546 ?auto_2401554 ) ) ( TRUCK-AT ?auto_2401549 ?auto_2401553 ) ( SURFACE-AT ?auto_2401546 ?auto_2401553 ) ( CLEAR ?auto_2401546 ) ( LIFTING ?auto_2401551 ?auto_2401547 ) ( IS-CRATE ?auto_2401547 ) ( ON ?auto_2401541 ?auto_2401540 ) ( ON ?auto_2401542 ?auto_2401541 ) ( ON ?auto_2401543 ?auto_2401542 ) ( ON ?auto_2401544 ?auto_2401543 ) ( ON ?auto_2401545 ?auto_2401544 ) ( ON ?auto_2401546 ?auto_2401545 ) ( not ( = ?auto_2401540 ?auto_2401541 ) ) ( not ( = ?auto_2401540 ?auto_2401542 ) ) ( not ( = ?auto_2401540 ?auto_2401543 ) ) ( not ( = ?auto_2401540 ?auto_2401544 ) ) ( not ( = ?auto_2401540 ?auto_2401545 ) ) ( not ( = ?auto_2401540 ?auto_2401546 ) ) ( not ( = ?auto_2401540 ?auto_2401547 ) ) ( not ( = ?auto_2401540 ?auto_2401548 ) ) ( not ( = ?auto_2401540 ?auto_2401554 ) ) ( not ( = ?auto_2401541 ?auto_2401542 ) ) ( not ( = ?auto_2401541 ?auto_2401543 ) ) ( not ( = ?auto_2401541 ?auto_2401544 ) ) ( not ( = ?auto_2401541 ?auto_2401545 ) ) ( not ( = ?auto_2401541 ?auto_2401546 ) ) ( not ( = ?auto_2401541 ?auto_2401547 ) ) ( not ( = ?auto_2401541 ?auto_2401548 ) ) ( not ( = ?auto_2401541 ?auto_2401554 ) ) ( not ( = ?auto_2401542 ?auto_2401543 ) ) ( not ( = ?auto_2401542 ?auto_2401544 ) ) ( not ( = ?auto_2401542 ?auto_2401545 ) ) ( not ( = ?auto_2401542 ?auto_2401546 ) ) ( not ( = ?auto_2401542 ?auto_2401547 ) ) ( not ( = ?auto_2401542 ?auto_2401548 ) ) ( not ( = ?auto_2401542 ?auto_2401554 ) ) ( not ( = ?auto_2401543 ?auto_2401544 ) ) ( not ( = ?auto_2401543 ?auto_2401545 ) ) ( not ( = ?auto_2401543 ?auto_2401546 ) ) ( not ( = ?auto_2401543 ?auto_2401547 ) ) ( not ( = ?auto_2401543 ?auto_2401548 ) ) ( not ( = ?auto_2401543 ?auto_2401554 ) ) ( not ( = ?auto_2401544 ?auto_2401545 ) ) ( not ( = ?auto_2401544 ?auto_2401546 ) ) ( not ( = ?auto_2401544 ?auto_2401547 ) ) ( not ( = ?auto_2401544 ?auto_2401548 ) ) ( not ( = ?auto_2401544 ?auto_2401554 ) ) ( not ( = ?auto_2401545 ?auto_2401546 ) ) ( not ( = ?auto_2401545 ?auto_2401547 ) ) ( not ( = ?auto_2401545 ?auto_2401548 ) ) ( not ( = ?auto_2401545 ?auto_2401554 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2401546 ?auto_2401547 ?auto_2401548 )
      ( MAKE-8CRATE-VERIFY ?auto_2401540 ?auto_2401541 ?auto_2401542 ?auto_2401543 ?auto_2401544 ?auto_2401545 ?auto_2401546 ?auto_2401547 ?auto_2401548 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2401633 - SURFACE
      ?auto_2401634 - SURFACE
      ?auto_2401635 - SURFACE
      ?auto_2401636 - SURFACE
      ?auto_2401637 - SURFACE
      ?auto_2401638 - SURFACE
      ?auto_2401639 - SURFACE
      ?auto_2401640 - SURFACE
      ?auto_2401641 - SURFACE
    )
    :vars
    (
      ?auto_2401642 - HOIST
      ?auto_2401645 - PLACE
      ?auto_2401643 - PLACE
      ?auto_2401644 - HOIST
      ?auto_2401647 - SURFACE
      ?auto_2401646 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2401642 ?auto_2401645 ) ( IS-CRATE ?auto_2401641 ) ( not ( = ?auto_2401640 ?auto_2401641 ) ) ( not ( = ?auto_2401639 ?auto_2401640 ) ) ( not ( = ?auto_2401639 ?auto_2401641 ) ) ( not ( = ?auto_2401643 ?auto_2401645 ) ) ( HOIST-AT ?auto_2401644 ?auto_2401643 ) ( not ( = ?auto_2401642 ?auto_2401644 ) ) ( AVAILABLE ?auto_2401644 ) ( SURFACE-AT ?auto_2401641 ?auto_2401643 ) ( ON ?auto_2401641 ?auto_2401647 ) ( CLEAR ?auto_2401641 ) ( not ( = ?auto_2401640 ?auto_2401647 ) ) ( not ( = ?auto_2401641 ?auto_2401647 ) ) ( not ( = ?auto_2401639 ?auto_2401647 ) ) ( TRUCK-AT ?auto_2401646 ?auto_2401645 ) ( SURFACE-AT ?auto_2401639 ?auto_2401645 ) ( CLEAR ?auto_2401639 ) ( IS-CRATE ?auto_2401640 ) ( AVAILABLE ?auto_2401642 ) ( IN ?auto_2401640 ?auto_2401646 ) ( ON ?auto_2401634 ?auto_2401633 ) ( ON ?auto_2401635 ?auto_2401634 ) ( ON ?auto_2401636 ?auto_2401635 ) ( ON ?auto_2401637 ?auto_2401636 ) ( ON ?auto_2401638 ?auto_2401637 ) ( ON ?auto_2401639 ?auto_2401638 ) ( not ( = ?auto_2401633 ?auto_2401634 ) ) ( not ( = ?auto_2401633 ?auto_2401635 ) ) ( not ( = ?auto_2401633 ?auto_2401636 ) ) ( not ( = ?auto_2401633 ?auto_2401637 ) ) ( not ( = ?auto_2401633 ?auto_2401638 ) ) ( not ( = ?auto_2401633 ?auto_2401639 ) ) ( not ( = ?auto_2401633 ?auto_2401640 ) ) ( not ( = ?auto_2401633 ?auto_2401641 ) ) ( not ( = ?auto_2401633 ?auto_2401647 ) ) ( not ( = ?auto_2401634 ?auto_2401635 ) ) ( not ( = ?auto_2401634 ?auto_2401636 ) ) ( not ( = ?auto_2401634 ?auto_2401637 ) ) ( not ( = ?auto_2401634 ?auto_2401638 ) ) ( not ( = ?auto_2401634 ?auto_2401639 ) ) ( not ( = ?auto_2401634 ?auto_2401640 ) ) ( not ( = ?auto_2401634 ?auto_2401641 ) ) ( not ( = ?auto_2401634 ?auto_2401647 ) ) ( not ( = ?auto_2401635 ?auto_2401636 ) ) ( not ( = ?auto_2401635 ?auto_2401637 ) ) ( not ( = ?auto_2401635 ?auto_2401638 ) ) ( not ( = ?auto_2401635 ?auto_2401639 ) ) ( not ( = ?auto_2401635 ?auto_2401640 ) ) ( not ( = ?auto_2401635 ?auto_2401641 ) ) ( not ( = ?auto_2401635 ?auto_2401647 ) ) ( not ( = ?auto_2401636 ?auto_2401637 ) ) ( not ( = ?auto_2401636 ?auto_2401638 ) ) ( not ( = ?auto_2401636 ?auto_2401639 ) ) ( not ( = ?auto_2401636 ?auto_2401640 ) ) ( not ( = ?auto_2401636 ?auto_2401641 ) ) ( not ( = ?auto_2401636 ?auto_2401647 ) ) ( not ( = ?auto_2401637 ?auto_2401638 ) ) ( not ( = ?auto_2401637 ?auto_2401639 ) ) ( not ( = ?auto_2401637 ?auto_2401640 ) ) ( not ( = ?auto_2401637 ?auto_2401641 ) ) ( not ( = ?auto_2401637 ?auto_2401647 ) ) ( not ( = ?auto_2401638 ?auto_2401639 ) ) ( not ( = ?auto_2401638 ?auto_2401640 ) ) ( not ( = ?auto_2401638 ?auto_2401641 ) ) ( not ( = ?auto_2401638 ?auto_2401647 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2401639 ?auto_2401640 ?auto_2401641 )
      ( MAKE-8CRATE-VERIFY ?auto_2401633 ?auto_2401634 ?auto_2401635 ?auto_2401636 ?auto_2401637 ?auto_2401638 ?auto_2401639 ?auto_2401640 ?auto_2401641 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2405749 - SURFACE
      ?auto_2405750 - SURFACE
      ?auto_2405751 - SURFACE
      ?auto_2405752 - SURFACE
      ?auto_2405753 - SURFACE
      ?auto_2405754 - SURFACE
      ?auto_2405755 - SURFACE
      ?auto_2405756 - SURFACE
      ?auto_2405757 - SURFACE
      ?auto_2405758 - SURFACE
    )
    :vars
    (
      ?auto_2405759 - HOIST
      ?auto_2405760 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2405759 ?auto_2405760 ) ( SURFACE-AT ?auto_2405757 ?auto_2405760 ) ( CLEAR ?auto_2405757 ) ( LIFTING ?auto_2405759 ?auto_2405758 ) ( IS-CRATE ?auto_2405758 ) ( not ( = ?auto_2405757 ?auto_2405758 ) ) ( ON ?auto_2405750 ?auto_2405749 ) ( ON ?auto_2405751 ?auto_2405750 ) ( ON ?auto_2405752 ?auto_2405751 ) ( ON ?auto_2405753 ?auto_2405752 ) ( ON ?auto_2405754 ?auto_2405753 ) ( ON ?auto_2405755 ?auto_2405754 ) ( ON ?auto_2405756 ?auto_2405755 ) ( ON ?auto_2405757 ?auto_2405756 ) ( not ( = ?auto_2405749 ?auto_2405750 ) ) ( not ( = ?auto_2405749 ?auto_2405751 ) ) ( not ( = ?auto_2405749 ?auto_2405752 ) ) ( not ( = ?auto_2405749 ?auto_2405753 ) ) ( not ( = ?auto_2405749 ?auto_2405754 ) ) ( not ( = ?auto_2405749 ?auto_2405755 ) ) ( not ( = ?auto_2405749 ?auto_2405756 ) ) ( not ( = ?auto_2405749 ?auto_2405757 ) ) ( not ( = ?auto_2405749 ?auto_2405758 ) ) ( not ( = ?auto_2405750 ?auto_2405751 ) ) ( not ( = ?auto_2405750 ?auto_2405752 ) ) ( not ( = ?auto_2405750 ?auto_2405753 ) ) ( not ( = ?auto_2405750 ?auto_2405754 ) ) ( not ( = ?auto_2405750 ?auto_2405755 ) ) ( not ( = ?auto_2405750 ?auto_2405756 ) ) ( not ( = ?auto_2405750 ?auto_2405757 ) ) ( not ( = ?auto_2405750 ?auto_2405758 ) ) ( not ( = ?auto_2405751 ?auto_2405752 ) ) ( not ( = ?auto_2405751 ?auto_2405753 ) ) ( not ( = ?auto_2405751 ?auto_2405754 ) ) ( not ( = ?auto_2405751 ?auto_2405755 ) ) ( not ( = ?auto_2405751 ?auto_2405756 ) ) ( not ( = ?auto_2405751 ?auto_2405757 ) ) ( not ( = ?auto_2405751 ?auto_2405758 ) ) ( not ( = ?auto_2405752 ?auto_2405753 ) ) ( not ( = ?auto_2405752 ?auto_2405754 ) ) ( not ( = ?auto_2405752 ?auto_2405755 ) ) ( not ( = ?auto_2405752 ?auto_2405756 ) ) ( not ( = ?auto_2405752 ?auto_2405757 ) ) ( not ( = ?auto_2405752 ?auto_2405758 ) ) ( not ( = ?auto_2405753 ?auto_2405754 ) ) ( not ( = ?auto_2405753 ?auto_2405755 ) ) ( not ( = ?auto_2405753 ?auto_2405756 ) ) ( not ( = ?auto_2405753 ?auto_2405757 ) ) ( not ( = ?auto_2405753 ?auto_2405758 ) ) ( not ( = ?auto_2405754 ?auto_2405755 ) ) ( not ( = ?auto_2405754 ?auto_2405756 ) ) ( not ( = ?auto_2405754 ?auto_2405757 ) ) ( not ( = ?auto_2405754 ?auto_2405758 ) ) ( not ( = ?auto_2405755 ?auto_2405756 ) ) ( not ( = ?auto_2405755 ?auto_2405757 ) ) ( not ( = ?auto_2405755 ?auto_2405758 ) ) ( not ( = ?auto_2405756 ?auto_2405757 ) ) ( not ( = ?auto_2405756 ?auto_2405758 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2405757 ?auto_2405758 )
      ( MAKE-9CRATE-VERIFY ?auto_2405749 ?auto_2405750 ?auto_2405751 ?auto_2405752 ?auto_2405753 ?auto_2405754 ?auto_2405755 ?auto_2405756 ?auto_2405757 ?auto_2405758 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2405829 - SURFACE
      ?auto_2405830 - SURFACE
      ?auto_2405831 - SURFACE
      ?auto_2405832 - SURFACE
      ?auto_2405833 - SURFACE
      ?auto_2405834 - SURFACE
      ?auto_2405835 - SURFACE
      ?auto_2405836 - SURFACE
      ?auto_2405837 - SURFACE
      ?auto_2405838 - SURFACE
    )
    :vars
    (
      ?auto_2405839 - HOIST
      ?auto_2405841 - PLACE
      ?auto_2405840 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2405839 ?auto_2405841 ) ( SURFACE-AT ?auto_2405837 ?auto_2405841 ) ( CLEAR ?auto_2405837 ) ( IS-CRATE ?auto_2405838 ) ( not ( = ?auto_2405837 ?auto_2405838 ) ) ( TRUCK-AT ?auto_2405840 ?auto_2405841 ) ( AVAILABLE ?auto_2405839 ) ( IN ?auto_2405838 ?auto_2405840 ) ( ON ?auto_2405837 ?auto_2405836 ) ( not ( = ?auto_2405836 ?auto_2405837 ) ) ( not ( = ?auto_2405836 ?auto_2405838 ) ) ( ON ?auto_2405830 ?auto_2405829 ) ( ON ?auto_2405831 ?auto_2405830 ) ( ON ?auto_2405832 ?auto_2405831 ) ( ON ?auto_2405833 ?auto_2405832 ) ( ON ?auto_2405834 ?auto_2405833 ) ( ON ?auto_2405835 ?auto_2405834 ) ( ON ?auto_2405836 ?auto_2405835 ) ( not ( = ?auto_2405829 ?auto_2405830 ) ) ( not ( = ?auto_2405829 ?auto_2405831 ) ) ( not ( = ?auto_2405829 ?auto_2405832 ) ) ( not ( = ?auto_2405829 ?auto_2405833 ) ) ( not ( = ?auto_2405829 ?auto_2405834 ) ) ( not ( = ?auto_2405829 ?auto_2405835 ) ) ( not ( = ?auto_2405829 ?auto_2405836 ) ) ( not ( = ?auto_2405829 ?auto_2405837 ) ) ( not ( = ?auto_2405829 ?auto_2405838 ) ) ( not ( = ?auto_2405830 ?auto_2405831 ) ) ( not ( = ?auto_2405830 ?auto_2405832 ) ) ( not ( = ?auto_2405830 ?auto_2405833 ) ) ( not ( = ?auto_2405830 ?auto_2405834 ) ) ( not ( = ?auto_2405830 ?auto_2405835 ) ) ( not ( = ?auto_2405830 ?auto_2405836 ) ) ( not ( = ?auto_2405830 ?auto_2405837 ) ) ( not ( = ?auto_2405830 ?auto_2405838 ) ) ( not ( = ?auto_2405831 ?auto_2405832 ) ) ( not ( = ?auto_2405831 ?auto_2405833 ) ) ( not ( = ?auto_2405831 ?auto_2405834 ) ) ( not ( = ?auto_2405831 ?auto_2405835 ) ) ( not ( = ?auto_2405831 ?auto_2405836 ) ) ( not ( = ?auto_2405831 ?auto_2405837 ) ) ( not ( = ?auto_2405831 ?auto_2405838 ) ) ( not ( = ?auto_2405832 ?auto_2405833 ) ) ( not ( = ?auto_2405832 ?auto_2405834 ) ) ( not ( = ?auto_2405832 ?auto_2405835 ) ) ( not ( = ?auto_2405832 ?auto_2405836 ) ) ( not ( = ?auto_2405832 ?auto_2405837 ) ) ( not ( = ?auto_2405832 ?auto_2405838 ) ) ( not ( = ?auto_2405833 ?auto_2405834 ) ) ( not ( = ?auto_2405833 ?auto_2405835 ) ) ( not ( = ?auto_2405833 ?auto_2405836 ) ) ( not ( = ?auto_2405833 ?auto_2405837 ) ) ( not ( = ?auto_2405833 ?auto_2405838 ) ) ( not ( = ?auto_2405834 ?auto_2405835 ) ) ( not ( = ?auto_2405834 ?auto_2405836 ) ) ( not ( = ?auto_2405834 ?auto_2405837 ) ) ( not ( = ?auto_2405834 ?auto_2405838 ) ) ( not ( = ?auto_2405835 ?auto_2405836 ) ) ( not ( = ?auto_2405835 ?auto_2405837 ) ) ( not ( = ?auto_2405835 ?auto_2405838 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2405836 ?auto_2405837 ?auto_2405838 )
      ( MAKE-9CRATE-VERIFY ?auto_2405829 ?auto_2405830 ?auto_2405831 ?auto_2405832 ?auto_2405833 ?auto_2405834 ?auto_2405835 ?auto_2405836 ?auto_2405837 ?auto_2405838 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2405919 - SURFACE
      ?auto_2405920 - SURFACE
      ?auto_2405921 - SURFACE
      ?auto_2405922 - SURFACE
      ?auto_2405923 - SURFACE
      ?auto_2405924 - SURFACE
      ?auto_2405925 - SURFACE
      ?auto_2405926 - SURFACE
      ?auto_2405927 - SURFACE
      ?auto_2405928 - SURFACE
    )
    :vars
    (
      ?auto_2405929 - HOIST
      ?auto_2405931 - PLACE
      ?auto_2405932 - TRUCK
      ?auto_2405930 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2405929 ?auto_2405931 ) ( SURFACE-AT ?auto_2405927 ?auto_2405931 ) ( CLEAR ?auto_2405927 ) ( IS-CRATE ?auto_2405928 ) ( not ( = ?auto_2405927 ?auto_2405928 ) ) ( AVAILABLE ?auto_2405929 ) ( IN ?auto_2405928 ?auto_2405932 ) ( ON ?auto_2405927 ?auto_2405926 ) ( not ( = ?auto_2405926 ?auto_2405927 ) ) ( not ( = ?auto_2405926 ?auto_2405928 ) ) ( TRUCK-AT ?auto_2405932 ?auto_2405930 ) ( not ( = ?auto_2405930 ?auto_2405931 ) ) ( ON ?auto_2405920 ?auto_2405919 ) ( ON ?auto_2405921 ?auto_2405920 ) ( ON ?auto_2405922 ?auto_2405921 ) ( ON ?auto_2405923 ?auto_2405922 ) ( ON ?auto_2405924 ?auto_2405923 ) ( ON ?auto_2405925 ?auto_2405924 ) ( ON ?auto_2405926 ?auto_2405925 ) ( not ( = ?auto_2405919 ?auto_2405920 ) ) ( not ( = ?auto_2405919 ?auto_2405921 ) ) ( not ( = ?auto_2405919 ?auto_2405922 ) ) ( not ( = ?auto_2405919 ?auto_2405923 ) ) ( not ( = ?auto_2405919 ?auto_2405924 ) ) ( not ( = ?auto_2405919 ?auto_2405925 ) ) ( not ( = ?auto_2405919 ?auto_2405926 ) ) ( not ( = ?auto_2405919 ?auto_2405927 ) ) ( not ( = ?auto_2405919 ?auto_2405928 ) ) ( not ( = ?auto_2405920 ?auto_2405921 ) ) ( not ( = ?auto_2405920 ?auto_2405922 ) ) ( not ( = ?auto_2405920 ?auto_2405923 ) ) ( not ( = ?auto_2405920 ?auto_2405924 ) ) ( not ( = ?auto_2405920 ?auto_2405925 ) ) ( not ( = ?auto_2405920 ?auto_2405926 ) ) ( not ( = ?auto_2405920 ?auto_2405927 ) ) ( not ( = ?auto_2405920 ?auto_2405928 ) ) ( not ( = ?auto_2405921 ?auto_2405922 ) ) ( not ( = ?auto_2405921 ?auto_2405923 ) ) ( not ( = ?auto_2405921 ?auto_2405924 ) ) ( not ( = ?auto_2405921 ?auto_2405925 ) ) ( not ( = ?auto_2405921 ?auto_2405926 ) ) ( not ( = ?auto_2405921 ?auto_2405927 ) ) ( not ( = ?auto_2405921 ?auto_2405928 ) ) ( not ( = ?auto_2405922 ?auto_2405923 ) ) ( not ( = ?auto_2405922 ?auto_2405924 ) ) ( not ( = ?auto_2405922 ?auto_2405925 ) ) ( not ( = ?auto_2405922 ?auto_2405926 ) ) ( not ( = ?auto_2405922 ?auto_2405927 ) ) ( not ( = ?auto_2405922 ?auto_2405928 ) ) ( not ( = ?auto_2405923 ?auto_2405924 ) ) ( not ( = ?auto_2405923 ?auto_2405925 ) ) ( not ( = ?auto_2405923 ?auto_2405926 ) ) ( not ( = ?auto_2405923 ?auto_2405927 ) ) ( not ( = ?auto_2405923 ?auto_2405928 ) ) ( not ( = ?auto_2405924 ?auto_2405925 ) ) ( not ( = ?auto_2405924 ?auto_2405926 ) ) ( not ( = ?auto_2405924 ?auto_2405927 ) ) ( not ( = ?auto_2405924 ?auto_2405928 ) ) ( not ( = ?auto_2405925 ?auto_2405926 ) ) ( not ( = ?auto_2405925 ?auto_2405927 ) ) ( not ( = ?auto_2405925 ?auto_2405928 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2405926 ?auto_2405927 ?auto_2405928 )
      ( MAKE-9CRATE-VERIFY ?auto_2405919 ?auto_2405920 ?auto_2405921 ?auto_2405922 ?auto_2405923 ?auto_2405924 ?auto_2405925 ?auto_2405926 ?auto_2405927 ?auto_2405928 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2406018 - SURFACE
      ?auto_2406019 - SURFACE
      ?auto_2406020 - SURFACE
      ?auto_2406021 - SURFACE
      ?auto_2406022 - SURFACE
      ?auto_2406023 - SURFACE
      ?auto_2406024 - SURFACE
      ?auto_2406025 - SURFACE
      ?auto_2406026 - SURFACE
      ?auto_2406027 - SURFACE
    )
    :vars
    (
      ?auto_2406032 - HOIST
      ?auto_2406029 - PLACE
      ?auto_2406030 - TRUCK
      ?auto_2406031 - PLACE
      ?auto_2406028 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2406032 ?auto_2406029 ) ( SURFACE-AT ?auto_2406026 ?auto_2406029 ) ( CLEAR ?auto_2406026 ) ( IS-CRATE ?auto_2406027 ) ( not ( = ?auto_2406026 ?auto_2406027 ) ) ( AVAILABLE ?auto_2406032 ) ( ON ?auto_2406026 ?auto_2406025 ) ( not ( = ?auto_2406025 ?auto_2406026 ) ) ( not ( = ?auto_2406025 ?auto_2406027 ) ) ( TRUCK-AT ?auto_2406030 ?auto_2406031 ) ( not ( = ?auto_2406031 ?auto_2406029 ) ) ( HOIST-AT ?auto_2406028 ?auto_2406031 ) ( LIFTING ?auto_2406028 ?auto_2406027 ) ( not ( = ?auto_2406032 ?auto_2406028 ) ) ( ON ?auto_2406019 ?auto_2406018 ) ( ON ?auto_2406020 ?auto_2406019 ) ( ON ?auto_2406021 ?auto_2406020 ) ( ON ?auto_2406022 ?auto_2406021 ) ( ON ?auto_2406023 ?auto_2406022 ) ( ON ?auto_2406024 ?auto_2406023 ) ( ON ?auto_2406025 ?auto_2406024 ) ( not ( = ?auto_2406018 ?auto_2406019 ) ) ( not ( = ?auto_2406018 ?auto_2406020 ) ) ( not ( = ?auto_2406018 ?auto_2406021 ) ) ( not ( = ?auto_2406018 ?auto_2406022 ) ) ( not ( = ?auto_2406018 ?auto_2406023 ) ) ( not ( = ?auto_2406018 ?auto_2406024 ) ) ( not ( = ?auto_2406018 ?auto_2406025 ) ) ( not ( = ?auto_2406018 ?auto_2406026 ) ) ( not ( = ?auto_2406018 ?auto_2406027 ) ) ( not ( = ?auto_2406019 ?auto_2406020 ) ) ( not ( = ?auto_2406019 ?auto_2406021 ) ) ( not ( = ?auto_2406019 ?auto_2406022 ) ) ( not ( = ?auto_2406019 ?auto_2406023 ) ) ( not ( = ?auto_2406019 ?auto_2406024 ) ) ( not ( = ?auto_2406019 ?auto_2406025 ) ) ( not ( = ?auto_2406019 ?auto_2406026 ) ) ( not ( = ?auto_2406019 ?auto_2406027 ) ) ( not ( = ?auto_2406020 ?auto_2406021 ) ) ( not ( = ?auto_2406020 ?auto_2406022 ) ) ( not ( = ?auto_2406020 ?auto_2406023 ) ) ( not ( = ?auto_2406020 ?auto_2406024 ) ) ( not ( = ?auto_2406020 ?auto_2406025 ) ) ( not ( = ?auto_2406020 ?auto_2406026 ) ) ( not ( = ?auto_2406020 ?auto_2406027 ) ) ( not ( = ?auto_2406021 ?auto_2406022 ) ) ( not ( = ?auto_2406021 ?auto_2406023 ) ) ( not ( = ?auto_2406021 ?auto_2406024 ) ) ( not ( = ?auto_2406021 ?auto_2406025 ) ) ( not ( = ?auto_2406021 ?auto_2406026 ) ) ( not ( = ?auto_2406021 ?auto_2406027 ) ) ( not ( = ?auto_2406022 ?auto_2406023 ) ) ( not ( = ?auto_2406022 ?auto_2406024 ) ) ( not ( = ?auto_2406022 ?auto_2406025 ) ) ( not ( = ?auto_2406022 ?auto_2406026 ) ) ( not ( = ?auto_2406022 ?auto_2406027 ) ) ( not ( = ?auto_2406023 ?auto_2406024 ) ) ( not ( = ?auto_2406023 ?auto_2406025 ) ) ( not ( = ?auto_2406023 ?auto_2406026 ) ) ( not ( = ?auto_2406023 ?auto_2406027 ) ) ( not ( = ?auto_2406024 ?auto_2406025 ) ) ( not ( = ?auto_2406024 ?auto_2406026 ) ) ( not ( = ?auto_2406024 ?auto_2406027 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2406025 ?auto_2406026 ?auto_2406027 )
      ( MAKE-9CRATE-VERIFY ?auto_2406018 ?auto_2406019 ?auto_2406020 ?auto_2406021 ?auto_2406022 ?auto_2406023 ?auto_2406024 ?auto_2406025 ?auto_2406026 ?auto_2406027 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2406126 - SURFACE
      ?auto_2406127 - SURFACE
      ?auto_2406128 - SURFACE
      ?auto_2406129 - SURFACE
      ?auto_2406130 - SURFACE
      ?auto_2406131 - SURFACE
      ?auto_2406132 - SURFACE
      ?auto_2406133 - SURFACE
      ?auto_2406134 - SURFACE
      ?auto_2406135 - SURFACE
    )
    :vars
    (
      ?auto_2406140 - HOIST
      ?auto_2406136 - PLACE
      ?auto_2406137 - TRUCK
      ?auto_2406138 - PLACE
      ?auto_2406141 - HOIST
      ?auto_2406139 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2406140 ?auto_2406136 ) ( SURFACE-AT ?auto_2406134 ?auto_2406136 ) ( CLEAR ?auto_2406134 ) ( IS-CRATE ?auto_2406135 ) ( not ( = ?auto_2406134 ?auto_2406135 ) ) ( AVAILABLE ?auto_2406140 ) ( ON ?auto_2406134 ?auto_2406133 ) ( not ( = ?auto_2406133 ?auto_2406134 ) ) ( not ( = ?auto_2406133 ?auto_2406135 ) ) ( TRUCK-AT ?auto_2406137 ?auto_2406138 ) ( not ( = ?auto_2406138 ?auto_2406136 ) ) ( HOIST-AT ?auto_2406141 ?auto_2406138 ) ( not ( = ?auto_2406140 ?auto_2406141 ) ) ( AVAILABLE ?auto_2406141 ) ( SURFACE-AT ?auto_2406135 ?auto_2406138 ) ( ON ?auto_2406135 ?auto_2406139 ) ( CLEAR ?auto_2406135 ) ( not ( = ?auto_2406134 ?auto_2406139 ) ) ( not ( = ?auto_2406135 ?auto_2406139 ) ) ( not ( = ?auto_2406133 ?auto_2406139 ) ) ( ON ?auto_2406127 ?auto_2406126 ) ( ON ?auto_2406128 ?auto_2406127 ) ( ON ?auto_2406129 ?auto_2406128 ) ( ON ?auto_2406130 ?auto_2406129 ) ( ON ?auto_2406131 ?auto_2406130 ) ( ON ?auto_2406132 ?auto_2406131 ) ( ON ?auto_2406133 ?auto_2406132 ) ( not ( = ?auto_2406126 ?auto_2406127 ) ) ( not ( = ?auto_2406126 ?auto_2406128 ) ) ( not ( = ?auto_2406126 ?auto_2406129 ) ) ( not ( = ?auto_2406126 ?auto_2406130 ) ) ( not ( = ?auto_2406126 ?auto_2406131 ) ) ( not ( = ?auto_2406126 ?auto_2406132 ) ) ( not ( = ?auto_2406126 ?auto_2406133 ) ) ( not ( = ?auto_2406126 ?auto_2406134 ) ) ( not ( = ?auto_2406126 ?auto_2406135 ) ) ( not ( = ?auto_2406126 ?auto_2406139 ) ) ( not ( = ?auto_2406127 ?auto_2406128 ) ) ( not ( = ?auto_2406127 ?auto_2406129 ) ) ( not ( = ?auto_2406127 ?auto_2406130 ) ) ( not ( = ?auto_2406127 ?auto_2406131 ) ) ( not ( = ?auto_2406127 ?auto_2406132 ) ) ( not ( = ?auto_2406127 ?auto_2406133 ) ) ( not ( = ?auto_2406127 ?auto_2406134 ) ) ( not ( = ?auto_2406127 ?auto_2406135 ) ) ( not ( = ?auto_2406127 ?auto_2406139 ) ) ( not ( = ?auto_2406128 ?auto_2406129 ) ) ( not ( = ?auto_2406128 ?auto_2406130 ) ) ( not ( = ?auto_2406128 ?auto_2406131 ) ) ( not ( = ?auto_2406128 ?auto_2406132 ) ) ( not ( = ?auto_2406128 ?auto_2406133 ) ) ( not ( = ?auto_2406128 ?auto_2406134 ) ) ( not ( = ?auto_2406128 ?auto_2406135 ) ) ( not ( = ?auto_2406128 ?auto_2406139 ) ) ( not ( = ?auto_2406129 ?auto_2406130 ) ) ( not ( = ?auto_2406129 ?auto_2406131 ) ) ( not ( = ?auto_2406129 ?auto_2406132 ) ) ( not ( = ?auto_2406129 ?auto_2406133 ) ) ( not ( = ?auto_2406129 ?auto_2406134 ) ) ( not ( = ?auto_2406129 ?auto_2406135 ) ) ( not ( = ?auto_2406129 ?auto_2406139 ) ) ( not ( = ?auto_2406130 ?auto_2406131 ) ) ( not ( = ?auto_2406130 ?auto_2406132 ) ) ( not ( = ?auto_2406130 ?auto_2406133 ) ) ( not ( = ?auto_2406130 ?auto_2406134 ) ) ( not ( = ?auto_2406130 ?auto_2406135 ) ) ( not ( = ?auto_2406130 ?auto_2406139 ) ) ( not ( = ?auto_2406131 ?auto_2406132 ) ) ( not ( = ?auto_2406131 ?auto_2406133 ) ) ( not ( = ?auto_2406131 ?auto_2406134 ) ) ( not ( = ?auto_2406131 ?auto_2406135 ) ) ( not ( = ?auto_2406131 ?auto_2406139 ) ) ( not ( = ?auto_2406132 ?auto_2406133 ) ) ( not ( = ?auto_2406132 ?auto_2406134 ) ) ( not ( = ?auto_2406132 ?auto_2406135 ) ) ( not ( = ?auto_2406132 ?auto_2406139 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2406133 ?auto_2406134 ?auto_2406135 )
      ( MAKE-9CRATE-VERIFY ?auto_2406126 ?auto_2406127 ?auto_2406128 ?auto_2406129 ?auto_2406130 ?auto_2406131 ?auto_2406132 ?auto_2406133 ?auto_2406134 ?auto_2406135 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2406235 - SURFACE
      ?auto_2406236 - SURFACE
      ?auto_2406237 - SURFACE
      ?auto_2406238 - SURFACE
      ?auto_2406239 - SURFACE
      ?auto_2406240 - SURFACE
      ?auto_2406241 - SURFACE
      ?auto_2406242 - SURFACE
      ?auto_2406243 - SURFACE
      ?auto_2406244 - SURFACE
    )
    :vars
    (
      ?auto_2406247 - HOIST
      ?auto_2406250 - PLACE
      ?auto_2406246 - PLACE
      ?auto_2406248 - HOIST
      ?auto_2406245 - SURFACE
      ?auto_2406249 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2406247 ?auto_2406250 ) ( SURFACE-AT ?auto_2406243 ?auto_2406250 ) ( CLEAR ?auto_2406243 ) ( IS-CRATE ?auto_2406244 ) ( not ( = ?auto_2406243 ?auto_2406244 ) ) ( AVAILABLE ?auto_2406247 ) ( ON ?auto_2406243 ?auto_2406242 ) ( not ( = ?auto_2406242 ?auto_2406243 ) ) ( not ( = ?auto_2406242 ?auto_2406244 ) ) ( not ( = ?auto_2406246 ?auto_2406250 ) ) ( HOIST-AT ?auto_2406248 ?auto_2406246 ) ( not ( = ?auto_2406247 ?auto_2406248 ) ) ( AVAILABLE ?auto_2406248 ) ( SURFACE-AT ?auto_2406244 ?auto_2406246 ) ( ON ?auto_2406244 ?auto_2406245 ) ( CLEAR ?auto_2406244 ) ( not ( = ?auto_2406243 ?auto_2406245 ) ) ( not ( = ?auto_2406244 ?auto_2406245 ) ) ( not ( = ?auto_2406242 ?auto_2406245 ) ) ( TRUCK-AT ?auto_2406249 ?auto_2406250 ) ( ON ?auto_2406236 ?auto_2406235 ) ( ON ?auto_2406237 ?auto_2406236 ) ( ON ?auto_2406238 ?auto_2406237 ) ( ON ?auto_2406239 ?auto_2406238 ) ( ON ?auto_2406240 ?auto_2406239 ) ( ON ?auto_2406241 ?auto_2406240 ) ( ON ?auto_2406242 ?auto_2406241 ) ( not ( = ?auto_2406235 ?auto_2406236 ) ) ( not ( = ?auto_2406235 ?auto_2406237 ) ) ( not ( = ?auto_2406235 ?auto_2406238 ) ) ( not ( = ?auto_2406235 ?auto_2406239 ) ) ( not ( = ?auto_2406235 ?auto_2406240 ) ) ( not ( = ?auto_2406235 ?auto_2406241 ) ) ( not ( = ?auto_2406235 ?auto_2406242 ) ) ( not ( = ?auto_2406235 ?auto_2406243 ) ) ( not ( = ?auto_2406235 ?auto_2406244 ) ) ( not ( = ?auto_2406235 ?auto_2406245 ) ) ( not ( = ?auto_2406236 ?auto_2406237 ) ) ( not ( = ?auto_2406236 ?auto_2406238 ) ) ( not ( = ?auto_2406236 ?auto_2406239 ) ) ( not ( = ?auto_2406236 ?auto_2406240 ) ) ( not ( = ?auto_2406236 ?auto_2406241 ) ) ( not ( = ?auto_2406236 ?auto_2406242 ) ) ( not ( = ?auto_2406236 ?auto_2406243 ) ) ( not ( = ?auto_2406236 ?auto_2406244 ) ) ( not ( = ?auto_2406236 ?auto_2406245 ) ) ( not ( = ?auto_2406237 ?auto_2406238 ) ) ( not ( = ?auto_2406237 ?auto_2406239 ) ) ( not ( = ?auto_2406237 ?auto_2406240 ) ) ( not ( = ?auto_2406237 ?auto_2406241 ) ) ( not ( = ?auto_2406237 ?auto_2406242 ) ) ( not ( = ?auto_2406237 ?auto_2406243 ) ) ( not ( = ?auto_2406237 ?auto_2406244 ) ) ( not ( = ?auto_2406237 ?auto_2406245 ) ) ( not ( = ?auto_2406238 ?auto_2406239 ) ) ( not ( = ?auto_2406238 ?auto_2406240 ) ) ( not ( = ?auto_2406238 ?auto_2406241 ) ) ( not ( = ?auto_2406238 ?auto_2406242 ) ) ( not ( = ?auto_2406238 ?auto_2406243 ) ) ( not ( = ?auto_2406238 ?auto_2406244 ) ) ( not ( = ?auto_2406238 ?auto_2406245 ) ) ( not ( = ?auto_2406239 ?auto_2406240 ) ) ( not ( = ?auto_2406239 ?auto_2406241 ) ) ( not ( = ?auto_2406239 ?auto_2406242 ) ) ( not ( = ?auto_2406239 ?auto_2406243 ) ) ( not ( = ?auto_2406239 ?auto_2406244 ) ) ( not ( = ?auto_2406239 ?auto_2406245 ) ) ( not ( = ?auto_2406240 ?auto_2406241 ) ) ( not ( = ?auto_2406240 ?auto_2406242 ) ) ( not ( = ?auto_2406240 ?auto_2406243 ) ) ( not ( = ?auto_2406240 ?auto_2406244 ) ) ( not ( = ?auto_2406240 ?auto_2406245 ) ) ( not ( = ?auto_2406241 ?auto_2406242 ) ) ( not ( = ?auto_2406241 ?auto_2406243 ) ) ( not ( = ?auto_2406241 ?auto_2406244 ) ) ( not ( = ?auto_2406241 ?auto_2406245 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2406242 ?auto_2406243 ?auto_2406244 )
      ( MAKE-9CRATE-VERIFY ?auto_2406235 ?auto_2406236 ?auto_2406237 ?auto_2406238 ?auto_2406239 ?auto_2406240 ?auto_2406241 ?auto_2406242 ?auto_2406243 ?auto_2406244 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2406344 - SURFACE
      ?auto_2406345 - SURFACE
      ?auto_2406346 - SURFACE
      ?auto_2406347 - SURFACE
      ?auto_2406348 - SURFACE
      ?auto_2406349 - SURFACE
      ?auto_2406350 - SURFACE
      ?auto_2406351 - SURFACE
      ?auto_2406352 - SURFACE
      ?auto_2406353 - SURFACE
    )
    :vars
    (
      ?auto_2406359 - HOIST
      ?auto_2406357 - PLACE
      ?auto_2406355 - PLACE
      ?auto_2406354 - HOIST
      ?auto_2406356 - SURFACE
      ?auto_2406358 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2406359 ?auto_2406357 ) ( IS-CRATE ?auto_2406353 ) ( not ( = ?auto_2406352 ?auto_2406353 ) ) ( not ( = ?auto_2406351 ?auto_2406352 ) ) ( not ( = ?auto_2406351 ?auto_2406353 ) ) ( not ( = ?auto_2406355 ?auto_2406357 ) ) ( HOIST-AT ?auto_2406354 ?auto_2406355 ) ( not ( = ?auto_2406359 ?auto_2406354 ) ) ( AVAILABLE ?auto_2406354 ) ( SURFACE-AT ?auto_2406353 ?auto_2406355 ) ( ON ?auto_2406353 ?auto_2406356 ) ( CLEAR ?auto_2406353 ) ( not ( = ?auto_2406352 ?auto_2406356 ) ) ( not ( = ?auto_2406353 ?auto_2406356 ) ) ( not ( = ?auto_2406351 ?auto_2406356 ) ) ( TRUCK-AT ?auto_2406358 ?auto_2406357 ) ( SURFACE-AT ?auto_2406351 ?auto_2406357 ) ( CLEAR ?auto_2406351 ) ( LIFTING ?auto_2406359 ?auto_2406352 ) ( IS-CRATE ?auto_2406352 ) ( ON ?auto_2406345 ?auto_2406344 ) ( ON ?auto_2406346 ?auto_2406345 ) ( ON ?auto_2406347 ?auto_2406346 ) ( ON ?auto_2406348 ?auto_2406347 ) ( ON ?auto_2406349 ?auto_2406348 ) ( ON ?auto_2406350 ?auto_2406349 ) ( ON ?auto_2406351 ?auto_2406350 ) ( not ( = ?auto_2406344 ?auto_2406345 ) ) ( not ( = ?auto_2406344 ?auto_2406346 ) ) ( not ( = ?auto_2406344 ?auto_2406347 ) ) ( not ( = ?auto_2406344 ?auto_2406348 ) ) ( not ( = ?auto_2406344 ?auto_2406349 ) ) ( not ( = ?auto_2406344 ?auto_2406350 ) ) ( not ( = ?auto_2406344 ?auto_2406351 ) ) ( not ( = ?auto_2406344 ?auto_2406352 ) ) ( not ( = ?auto_2406344 ?auto_2406353 ) ) ( not ( = ?auto_2406344 ?auto_2406356 ) ) ( not ( = ?auto_2406345 ?auto_2406346 ) ) ( not ( = ?auto_2406345 ?auto_2406347 ) ) ( not ( = ?auto_2406345 ?auto_2406348 ) ) ( not ( = ?auto_2406345 ?auto_2406349 ) ) ( not ( = ?auto_2406345 ?auto_2406350 ) ) ( not ( = ?auto_2406345 ?auto_2406351 ) ) ( not ( = ?auto_2406345 ?auto_2406352 ) ) ( not ( = ?auto_2406345 ?auto_2406353 ) ) ( not ( = ?auto_2406345 ?auto_2406356 ) ) ( not ( = ?auto_2406346 ?auto_2406347 ) ) ( not ( = ?auto_2406346 ?auto_2406348 ) ) ( not ( = ?auto_2406346 ?auto_2406349 ) ) ( not ( = ?auto_2406346 ?auto_2406350 ) ) ( not ( = ?auto_2406346 ?auto_2406351 ) ) ( not ( = ?auto_2406346 ?auto_2406352 ) ) ( not ( = ?auto_2406346 ?auto_2406353 ) ) ( not ( = ?auto_2406346 ?auto_2406356 ) ) ( not ( = ?auto_2406347 ?auto_2406348 ) ) ( not ( = ?auto_2406347 ?auto_2406349 ) ) ( not ( = ?auto_2406347 ?auto_2406350 ) ) ( not ( = ?auto_2406347 ?auto_2406351 ) ) ( not ( = ?auto_2406347 ?auto_2406352 ) ) ( not ( = ?auto_2406347 ?auto_2406353 ) ) ( not ( = ?auto_2406347 ?auto_2406356 ) ) ( not ( = ?auto_2406348 ?auto_2406349 ) ) ( not ( = ?auto_2406348 ?auto_2406350 ) ) ( not ( = ?auto_2406348 ?auto_2406351 ) ) ( not ( = ?auto_2406348 ?auto_2406352 ) ) ( not ( = ?auto_2406348 ?auto_2406353 ) ) ( not ( = ?auto_2406348 ?auto_2406356 ) ) ( not ( = ?auto_2406349 ?auto_2406350 ) ) ( not ( = ?auto_2406349 ?auto_2406351 ) ) ( not ( = ?auto_2406349 ?auto_2406352 ) ) ( not ( = ?auto_2406349 ?auto_2406353 ) ) ( not ( = ?auto_2406349 ?auto_2406356 ) ) ( not ( = ?auto_2406350 ?auto_2406351 ) ) ( not ( = ?auto_2406350 ?auto_2406352 ) ) ( not ( = ?auto_2406350 ?auto_2406353 ) ) ( not ( = ?auto_2406350 ?auto_2406356 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2406351 ?auto_2406352 ?auto_2406353 )
      ( MAKE-9CRATE-VERIFY ?auto_2406344 ?auto_2406345 ?auto_2406346 ?auto_2406347 ?auto_2406348 ?auto_2406349 ?auto_2406350 ?auto_2406351 ?auto_2406352 ?auto_2406353 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2406453 - SURFACE
      ?auto_2406454 - SURFACE
      ?auto_2406455 - SURFACE
      ?auto_2406456 - SURFACE
      ?auto_2406457 - SURFACE
      ?auto_2406458 - SURFACE
      ?auto_2406459 - SURFACE
      ?auto_2406460 - SURFACE
      ?auto_2406461 - SURFACE
      ?auto_2406462 - SURFACE
    )
    :vars
    (
      ?auto_2406466 - HOIST
      ?auto_2406468 - PLACE
      ?auto_2406463 - PLACE
      ?auto_2406465 - HOIST
      ?auto_2406464 - SURFACE
      ?auto_2406467 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2406466 ?auto_2406468 ) ( IS-CRATE ?auto_2406462 ) ( not ( = ?auto_2406461 ?auto_2406462 ) ) ( not ( = ?auto_2406460 ?auto_2406461 ) ) ( not ( = ?auto_2406460 ?auto_2406462 ) ) ( not ( = ?auto_2406463 ?auto_2406468 ) ) ( HOIST-AT ?auto_2406465 ?auto_2406463 ) ( not ( = ?auto_2406466 ?auto_2406465 ) ) ( AVAILABLE ?auto_2406465 ) ( SURFACE-AT ?auto_2406462 ?auto_2406463 ) ( ON ?auto_2406462 ?auto_2406464 ) ( CLEAR ?auto_2406462 ) ( not ( = ?auto_2406461 ?auto_2406464 ) ) ( not ( = ?auto_2406462 ?auto_2406464 ) ) ( not ( = ?auto_2406460 ?auto_2406464 ) ) ( TRUCK-AT ?auto_2406467 ?auto_2406468 ) ( SURFACE-AT ?auto_2406460 ?auto_2406468 ) ( CLEAR ?auto_2406460 ) ( IS-CRATE ?auto_2406461 ) ( AVAILABLE ?auto_2406466 ) ( IN ?auto_2406461 ?auto_2406467 ) ( ON ?auto_2406454 ?auto_2406453 ) ( ON ?auto_2406455 ?auto_2406454 ) ( ON ?auto_2406456 ?auto_2406455 ) ( ON ?auto_2406457 ?auto_2406456 ) ( ON ?auto_2406458 ?auto_2406457 ) ( ON ?auto_2406459 ?auto_2406458 ) ( ON ?auto_2406460 ?auto_2406459 ) ( not ( = ?auto_2406453 ?auto_2406454 ) ) ( not ( = ?auto_2406453 ?auto_2406455 ) ) ( not ( = ?auto_2406453 ?auto_2406456 ) ) ( not ( = ?auto_2406453 ?auto_2406457 ) ) ( not ( = ?auto_2406453 ?auto_2406458 ) ) ( not ( = ?auto_2406453 ?auto_2406459 ) ) ( not ( = ?auto_2406453 ?auto_2406460 ) ) ( not ( = ?auto_2406453 ?auto_2406461 ) ) ( not ( = ?auto_2406453 ?auto_2406462 ) ) ( not ( = ?auto_2406453 ?auto_2406464 ) ) ( not ( = ?auto_2406454 ?auto_2406455 ) ) ( not ( = ?auto_2406454 ?auto_2406456 ) ) ( not ( = ?auto_2406454 ?auto_2406457 ) ) ( not ( = ?auto_2406454 ?auto_2406458 ) ) ( not ( = ?auto_2406454 ?auto_2406459 ) ) ( not ( = ?auto_2406454 ?auto_2406460 ) ) ( not ( = ?auto_2406454 ?auto_2406461 ) ) ( not ( = ?auto_2406454 ?auto_2406462 ) ) ( not ( = ?auto_2406454 ?auto_2406464 ) ) ( not ( = ?auto_2406455 ?auto_2406456 ) ) ( not ( = ?auto_2406455 ?auto_2406457 ) ) ( not ( = ?auto_2406455 ?auto_2406458 ) ) ( not ( = ?auto_2406455 ?auto_2406459 ) ) ( not ( = ?auto_2406455 ?auto_2406460 ) ) ( not ( = ?auto_2406455 ?auto_2406461 ) ) ( not ( = ?auto_2406455 ?auto_2406462 ) ) ( not ( = ?auto_2406455 ?auto_2406464 ) ) ( not ( = ?auto_2406456 ?auto_2406457 ) ) ( not ( = ?auto_2406456 ?auto_2406458 ) ) ( not ( = ?auto_2406456 ?auto_2406459 ) ) ( not ( = ?auto_2406456 ?auto_2406460 ) ) ( not ( = ?auto_2406456 ?auto_2406461 ) ) ( not ( = ?auto_2406456 ?auto_2406462 ) ) ( not ( = ?auto_2406456 ?auto_2406464 ) ) ( not ( = ?auto_2406457 ?auto_2406458 ) ) ( not ( = ?auto_2406457 ?auto_2406459 ) ) ( not ( = ?auto_2406457 ?auto_2406460 ) ) ( not ( = ?auto_2406457 ?auto_2406461 ) ) ( not ( = ?auto_2406457 ?auto_2406462 ) ) ( not ( = ?auto_2406457 ?auto_2406464 ) ) ( not ( = ?auto_2406458 ?auto_2406459 ) ) ( not ( = ?auto_2406458 ?auto_2406460 ) ) ( not ( = ?auto_2406458 ?auto_2406461 ) ) ( not ( = ?auto_2406458 ?auto_2406462 ) ) ( not ( = ?auto_2406458 ?auto_2406464 ) ) ( not ( = ?auto_2406459 ?auto_2406460 ) ) ( not ( = ?auto_2406459 ?auto_2406461 ) ) ( not ( = ?auto_2406459 ?auto_2406462 ) ) ( not ( = ?auto_2406459 ?auto_2406464 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2406460 ?auto_2406461 ?auto_2406462 )
      ( MAKE-9CRATE-VERIFY ?auto_2406453 ?auto_2406454 ?auto_2406455 ?auto_2406456 ?auto_2406457 ?auto_2406458 ?auto_2406459 ?auto_2406460 ?auto_2406461 ?auto_2406462 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2412018 - SURFACE
      ?auto_2412019 - SURFACE
      ?auto_2412020 - SURFACE
      ?auto_2412021 - SURFACE
      ?auto_2412022 - SURFACE
      ?auto_2412023 - SURFACE
      ?auto_2412024 - SURFACE
      ?auto_2412025 - SURFACE
      ?auto_2412026 - SURFACE
      ?auto_2412027 - SURFACE
      ?auto_2412028 - SURFACE
    )
    :vars
    (
      ?auto_2412030 - HOIST
      ?auto_2412029 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2412030 ?auto_2412029 ) ( SURFACE-AT ?auto_2412027 ?auto_2412029 ) ( CLEAR ?auto_2412027 ) ( LIFTING ?auto_2412030 ?auto_2412028 ) ( IS-CRATE ?auto_2412028 ) ( not ( = ?auto_2412027 ?auto_2412028 ) ) ( ON ?auto_2412019 ?auto_2412018 ) ( ON ?auto_2412020 ?auto_2412019 ) ( ON ?auto_2412021 ?auto_2412020 ) ( ON ?auto_2412022 ?auto_2412021 ) ( ON ?auto_2412023 ?auto_2412022 ) ( ON ?auto_2412024 ?auto_2412023 ) ( ON ?auto_2412025 ?auto_2412024 ) ( ON ?auto_2412026 ?auto_2412025 ) ( ON ?auto_2412027 ?auto_2412026 ) ( not ( = ?auto_2412018 ?auto_2412019 ) ) ( not ( = ?auto_2412018 ?auto_2412020 ) ) ( not ( = ?auto_2412018 ?auto_2412021 ) ) ( not ( = ?auto_2412018 ?auto_2412022 ) ) ( not ( = ?auto_2412018 ?auto_2412023 ) ) ( not ( = ?auto_2412018 ?auto_2412024 ) ) ( not ( = ?auto_2412018 ?auto_2412025 ) ) ( not ( = ?auto_2412018 ?auto_2412026 ) ) ( not ( = ?auto_2412018 ?auto_2412027 ) ) ( not ( = ?auto_2412018 ?auto_2412028 ) ) ( not ( = ?auto_2412019 ?auto_2412020 ) ) ( not ( = ?auto_2412019 ?auto_2412021 ) ) ( not ( = ?auto_2412019 ?auto_2412022 ) ) ( not ( = ?auto_2412019 ?auto_2412023 ) ) ( not ( = ?auto_2412019 ?auto_2412024 ) ) ( not ( = ?auto_2412019 ?auto_2412025 ) ) ( not ( = ?auto_2412019 ?auto_2412026 ) ) ( not ( = ?auto_2412019 ?auto_2412027 ) ) ( not ( = ?auto_2412019 ?auto_2412028 ) ) ( not ( = ?auto_2412020 ?auto_2412021 ) ) ( not ( = ?auto_2412020 ?auto_2412022 ) ) ( not ( = ?auto_2412020 ?auto_2412023 ) ) ( not ( = ?auto_2412020 ?auto_2412024 ) ) ( not ( = ?auto_2412020 ?auto_2412025 ) ) ( not ( = ?auto_2412020 ?auto_2412026 ) ) ( not ( = ?auto_2412020 ?auto_2412027 ) ) ( not ( = ?auto_2412020 ?auto_2412028 ) ) ( not ( = ?auto_2412021 ?auto_2412022 ) ) ( not ( = ?auto_2412021 ?auto_2412023 ) ) ( not ( = ?auto_2412021 ?auto_2412024 ) ) ( not ( = ?auto_2412021 ?auto_2412025 ) ) ( not ( = ?auto_2412021 ?auto_2412026 ) ) ( not ( = ?auto_2412021 ?auto_2412027 ) ) ( not ( = ?auto_2412021 ?auto_2412028 ) ) ( not ( = ?auto_2412022 ?auto_2412023 ) ) ( not ( = ?auto_2412022 ?auto_2412024 ) ) ( not ( = ?auto_2412022 ?auto_2412025 ) ) ( not ( = ?auto_2412022 ?auto_2412026 ) ) ( not ( = ?auto_2412022 ?auto_2412027 ) ) ( not ( = ?auto_2412022 ?auto_2412028 ) ) ( not ( = ?auto_2412023 ?auto_2412024 ) ) ( not ( = ?auto_2412023 ?auto_2412025 ) ) ( not ( = ?auto_2412023 ?auto_2412026 ) ) ( not ( = ?auto_2412023 ?auto_2412027 ) ) ( not ( = ?auto_2412023 ?auto_2412028 ) ) ( not ( = ?auto_2412024 ?auto_2412025 ) ) ( not ( = ?auto_2412024 ?auto_2412026 ) ) ( not ( = ?auto_2412024 ?auto_2412027 ) ) ( not ( = ?auto_2412024 ?auto_2412028 ) ) ( not ( = ?auto_2412025 ?auto_2412026 ) ) ( not ( = ?auto_2412025 ?auto_2412027 ) ) ( not ( = ?auto_2412025 ?auto_2412028 ) ) ( not ( = ?auto_2412026 ?auto_2412027 ) ) ( not ( = ?auto_2412026 ?auto_2412028 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2412027 ?auto_2412028 )
      ( MAKE-10CRATE-VERIFY ?auto_2412018 ?auto_2412019 ?auto_2412020 ?auto_2412021 ?auto_2412022 ?auto_2412023 ?auto_2412024 ?auto_2412025 ?auto_2412026 ?auto_2412027 ?auto_2412028 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2412112 - SURFACE
      ?auto_2412113 - SURFACE
      ?auto_2412114 - SURFACE
      ?auto_2412115 - SURFACE
      ?auto_2412116 - SURFACE
      ?auto_2412117 - SURFACE
      ?auto_2412118 - SURFACE
      ?auto_2412119 - SURFACE
      ?auto_2412120 - SURFACE
      ?auto_2412121 - SURFACE
      ?auto_2412122 - SURFACE
    )
    :vars
    (
      ?auto_2412125 - HOIST
      ?auto_2412123 - PLACE
      ?auto_2412124 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2412125 ?auto_2412123 ) ( SURFACE-AT ?auto_2412121 ?auto_2412123 ) ( CLEAR ?auto_2412121 ) ( IS-CRATE ?auto_2412122 ) ( not ( = ?auto_2412121 ?auto_2412122 ) ) ( TRUCK-AT ?auto_2412124 ?auto_2412123 ) ( AVAILABLE ?auto_2412125 ) ( IN ?auto_2412122 ?auto_2412124 ) ( ON ?auto_2412121 ?auto_2412120 ) ( not ( = ?auto_2412120 ?auto_2412121 ) ) ( not ( = ?auto_2412120 ?auto_2412122 ) ) ( ON ?auto_2412113 ?auto_2412112 ) ( ON ?auto_2412114 ?auto_2412113 ) ( ON ?auto_2412115 ?auto_2412114 ) ( ON ?auto_2412116 ?auto_2412115 ) ( ON ?auto_2412117 ?auto_2412116 ) ( ON ?auto_2412118 ?auto_2412117 ) ( ON ?auto_2412119 ?auto_2412118 ) ( ON ?auto_2412120 ?auto_2412119 ) ( not ( = ?auto_2412112 ?auto_2412113 ) ) ( not ( = ?auto_2412112 ?auto_2412114 ) ) ( not ( = ?auto_2412112 ?auto_2412115 ) ) ( not ( = ?auto_2412112 ?auto_2412116 ) ) ( not ( = ?auto_2412112 ?auto_2412117 ) ) ( not ( = ?auto_2412112 ?auto_2412118 ) ) ( not ( = ?auto_2412112 ?auto_2412119 ) ) ( not ( = ?auto_2412112 ?auto_2412120 ) ) ( not ( = ?auto_2412112 ?auto_2412121 ) ) ( not ( = ?auto_2412112 ?auto_2412122 ) ) ( not ( = ?auto_2412113 ?auto_2412114 ) ) ( not ( = ?auto_2412113 ?auto_2412115 ) ) ( not ( = ?auto_2412113 ?auto_2412116 ) ) ( not ( = ?auto_2412113 ?auto_2412117 ) ) ( not ( = ?auto_2412113 ?auto_2412118 ) ) ( not ( = ?auto_2412113 ?auto_2412119 ) ) ( not ( = ?auto_2412113 ?auto_2412120 ) ) ( not ( = ?auto_2412113 ?auto_2412121 ) ) ( not ( = ?auto_2412113 ?auto_2412122 ) ) ( not ( = ?auto_2412114 ?auto_2412115 ) ) ( not ( = ?auto_2412114 ?auto_2412116 ) ) ( not ( = ?auto_2412114 ?auto_2412117 ) ) ( not ( = ?auto_2412114 ?auto_2412118 ) ) ( not ( = ?auto_2412114 ?auto_2412119 ) ) ( not ( = ?auto_2412114 ?auto_2412120 ) ) ( not ( = ?auto_2412114 ?auto_2412121 ) ) ( not ( = ?auto_2412114 ?auto_2412122 ) ) ( not ( = ?auto_2412115 ?auto_2412116 ) ) ( not ( = ?auto_2412115 ?auto_2412117 ) ) ( not ( = ?auto_2412115 ?auto_2412118 ) ) ( not ( = ?auto_2412115 ?auto_2412119 ) ) ( not ( = ?auto_2412115 ?auto_2412120 ) ) ( not ( = ?auto_2412115 ?auto_2412121 ) ) ( not ( = ?auto_2412115 ?auto_2412122 ) ) ( not ( = ?auto_2412116 ?auto_2412117 ) ) ( not ( = ?auto_2412116 ?auto_2412118 ) ) ( not ( = ?auto_2412116 ?auto_2412119 ) ) ( not ( = ?auto_2412116 ?auto_2412120 ) ) ( not ( = ?auto_2412116 ?auto_2412121 ) ) ( not ( = ?auto_2412116 ?auto_2412122 ) ) ( not ( = ?auto_2412117 ?auto_2412118 ) ) ( not ( = ?auto_2412117 ?auto_2412119 ) ) ( not ( = ?auto_2412117 ?auto_2412120 ) ) ( not ( = ?auto_2412117 ?auto_2412121 ) ) ( not ( = ?auto_2412117 ?auto_2412122 ) ) ( not ( = ?auto_2412118 ?auto_2412119 ) ) ( not ( = ?auto_2412118 ?auto_2412120 ) ) ( not ( = ?auto_2412118 ?auto_2412121 ) ) ( not ( = ?auto_2412118 ?auto_2412122 ) ) ( not ( = ?auto_2412119 ?auto_2412120 ) ) ( not ( = ?auto_2412119 ?auto_2412121 ) ) ( not ( = ?auto_2412119 ?auto_2412122 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2412120 ?auto_2412121 ?auto_2412122 )
      ( MAKE-10CRATE-VERIFY ?auto_2412112 ?auto_2412113 ?auto_2412114 ?auto_2412115 ?auto_2412116 ?auto_2412117 ?auto_2412118 ?auto_2412119 ?auto_2412120 ?auto_2412121 ?auto_2412122 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2412217 - SURFACE
      ?auto_2412218 - SURFACE
      ?auto_2412219 - SURFACE
      ?auto_2412220 - SURFACE
      ?auto_2412221 - SURFACE
      ?auto_2412222 - SURFACE
      ?auto_2412223 - SURFACE
      ?auto_2412224 - SURFACE
      ?auto_2412225 - SURFACE
      ?auto_2412226 - SURFACE
      ?auto_2412227 - SURFACE
    )
    :vars
    (
      ?auto_2412228 - HOIST
      ?auto_2412229 - PLACE
      ?auto_2412231 - TRUCK
      ?auto_2412230 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2412228 ?auto_2412229 ) ( SURFACE-AT ?auto_2412226 ?auto_2412229 ) ( CLEAR ?auto_2412226 ) ( IS-CRATE ?auto_2412227 ) ( not ( = ?auto_2412226 ?auto_2412227 ) ) ( AVAILABLE ?auto_2412228 ) ( IN ?auto_2412227 ?auto_2412231 ) ( ON ?auto_2412226 ?auto_2412225 ) ( not ( = ?auto_2412225 ?auto_2412226 ) ) ( not ( = ?auto_2412225 ?auto_2412227 ) ) ( TRUCK-AT ?auto_2412231 ?auto_2412230 ) ( not ( = ?auto_2412230 ?auto_2412229 ) ) ( ON ?auto_2412218 ?auto_2412217 ) ( ON ?auto_2412219 ?auto_2412218 ) ( ON ?auto_2412220 ?auto_2412219 ) ( ON ?auto_2412221 ?auto_2412220 ) ( ON ?auto_2412222 ?auto_2412221 ) ( ON ?auto_2412223 ?auto_2412222 ) ( ON ?auto_2412224 ?auto_2412223 ) ( ON ?auto_2412225 ?auto_2412224 ) ( not ( = ?auto_2412217 ?auto_2412218 ) ) ( not ( = ?auto_2412217 ?auto_2412219 ) ) ( not ( = ?auto_2412217 ?auto_2412220 ) ) ( not ( = ?auto_2412217 ?auto_2412221 ) ) ( not ( = ?auto_2412217 ?auto_2412222 ) ) ( not ( = ?auto_2412217 ?auto_2412223 ) ) ( not ( = ?auto_2412217 ?auto_2412224 ) ) ( not ( = ?auto_2412217 ?auto_2412225 ) ) ( not ( = ?auto_2412217 ?auto_2412226 ) ) ( not ( = ?auto_2412217 ?auto_2412227 ) ) ( not ( = ?auto_2412218 ?auto_2412219 ) ) ( not ( = ?auto_2412218 ?auto_2412220 ) ) ( not ( = ?auto_2412218 ?auto_2412221 ) ) ( not ( = ?auto_2412218 ?auto_2412222 ) ) ( not ( = ?auto_2412218 ?auto_2412223 ) ) ( not ( = ?auto_2412218 ?auto_2412224 ) ) ( not ( = ?auto_2412218 ?auto_2412225 ) ) ( not ( = ?auto_2412218 ?auto_2412226 ) ) ( not ( = ?auto_2412218 ?auto_2412227 ) ) ( not ( = ?auto_2412219 ?auto_2412220 ) ) ( not ( = ?auto_2412219 ?auto_2412221 ) ) ( not ( = ?auto_2412219 ?auto_2412222 ) ) ( not ( = ?auto_2412219 ?auto_2412223 ) ) ( not ( = ?auto_2412219 ?auto_2412224 ) ) ( not ( = ?auto_2412219 ?auto_2412225 ) ) ( not ( = ?auto_2412219 ?auto_2412226 ) ) ( not ( = ?auto_2412219 ?auto_2412227 ) ) ( not ( = ?auto_2412220 ?auto_2412221 ) ) ( not ( = ?auto_2412220 ?auto_2412222 ) ) ( not ( = ?auto_2412220 ?auto_2412223 ) ) ( not ( = ?auto_2412220 ?auto_2412224 ) ) ( not ( = ?auto_2412220 ?auto_2412225 ) ) ( not ( = ?auto_2412220 ?auto_2412226 ) ) ( not ( = ?auto_2412220 ?auto_2412227 ) ) ( not ( = ?auto_2412221 ?auto_2412222 ) ) ( not ( = ?auto_2412221 ?auto_2412223 ) ) ( not ( = ?auto_2412221 ?auto_2412224 ) ) ( not ( = ?auto_2412221 ?auto_2412225 ) ) ( not ( = ?auto_2412221 ?auto_2412226 ) ) ( not ( = ?auto_2412221 ?auto_2412227 ) ) ( not ( = ?auto_2412222 ?auto_2412223 ) ) ( not ( = ?auto_2412222 ?auto_2412224 ) ) ( not ( = ?auto_2412222 ?auto_2412225 ) ) ( not ( = ?auto_2412222 ?auto_2412226 ) ) ( not ( = ?auto_2412222 ?auto_2412227 ) ) ( not ( = ?auto_2412223 ?auto_2412224 ) ) ( not ( = ?auto_2412223 ?auto_2412225 ) ) ( not ( = ?auto_2412223 ?auto_2412226 ) ) ( not ( = ?auto_2412223 ?auto_2412227 ) ) ( not ( = ?auto_2412224 ?auto_2412225 ) ) ( not ( = ?auto_2412224 ?auto_2412226 ) ) ( not ( = ?auto_2412224 ?auto_2412227 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2412225 ?auto_2412226 ?auto_2412227 )
      ( MAKE-10CRATE-VERIFY ?auto_2412217 ?auto_2412218 ?auto_2412219 ?auto_2412220 ?auto_2412221 ?auto_2412222 ?auto_2412223 ?auto_2412224 ?auto_2412225 ?auto_2412226 ?auto_2412227 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2412332 - SURFACE
      ?auto_2412333 - SURFACE
      ?auto_2412334 - SURFACE
      ?auto_2412335 - SURFACE
      ?auto_2412336 - SURFACE
      ?auto_2412337 - SURFACE
      ?auto_2412338 - SURFACE
      ?auto_2412339 - SURFACE
      ?auto_2412340 - SURFACE
      ?auto_2412341 - SURFACE
      ?auto_2412342 - SURFACE
    )
    :vars
    (
      ?auto_2412347 - HOIST
      ?auto_2412343 - PLACE
      ?auto_2412345 - TRUCK
      ?auto_2412344 - PLACE
      ?auto_2412346 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2412347 ?auto_2412343 ) ( SURFACE-AT ?auto_2412341 ?auto_2412343 ) ( CLEAR ?auto_2412341 ) ( IS-CRATE ?auto_2412342 ) ( not ( = ?auto_2412341 ?auto_2412342 ) ) ( AVAILABLE ?auto_2412347 ) ( ON ?auto_2412341 ?auto_2412340 ) ( not ( = ?auto_2412340 ?auto_2412341 ) ) ( not ( = ?auto_2412340 ?auto_2412342 ) ) ( TRUCK-AT ?auto_2412345 ?auto_2412344 ) ( not ( = ?auto_2412344 ?auto_2412343 ) ) ( HOIST-AT ?auto_2412346 ?auto_2412344 ) ( LIFTING ?auto_2412346 ?auto_2412342 ) ( not ( = ?auto_2412347 ?auto_2412346 ) ) ( ON ?auto_2412333 ?auto_2412332 ) ( ON ?auto_2412334 ?auto_2412333 ) ( ON ?auto_2412335 ?auto_2412334 ) ( ON ?auto_2412336 ?auto_2412335 ) ( ON ?auto_2412337 ?auto_2412336 ) ( ON ?auto_2412338 ?auto_2412337 ) ( ON ?auto_2412339 ?auto_2412338 ) ( ON ?auto_2412340 ?auto_2412339 ) ( not ( = ?auto_2412332 ?auto_2412333 ) ) ( not ( = ?auto_2412332 ?auto_2412334 ) ) ( not ( = ?auto_2412332 ?auto_2412335 ) ) ( not ( = ?auto_2412332 ?auto_2412336 ) ) ( not ( = ?auto_2412332 ?auto_2412337 ) ) ( not ( = ?auto_2412332 ?auto_2412338 ) ) ( not ( = ?auto_2412332 ?auto_2412339 ) ) ( not ( = ?auto_2412332 ?auto_2412340 ) ) ( not ( = ?auto_2412332 ?auto_2412341 ) ) ( not ( = ?auto_2412332 ?auto_2412342 ) ) ( not ( = ?auto_2412333 ?auto_2412334 ) ) ( not ( = ?auto_2412333 ?auto_2412335 ) ) ( not ( = ?auto_2412333 ?auto_2412336 ) ) ( not ( = ?auto_2412333 ?auto_2412337 ) ) ( not ( = ?auto_2412333 ?auto_2412338 ) ) ( not ( = ?auto_2412333 ?auto_2412339 ) ) ( not ( = ?auto_2412333 ?auto_2412340 ) ) ( not ( = ?auto_2412333 ?auto_2412341 ) ) ( not ( = ?auto_2412333 ?auto_2412342 ) ) ( not ( = ?auto_2412334 ?auto_2412335 ) ) ( not ( = ?auto_2412334 ?auto_2412336 ) ) ( not ( = ?auto_2412334 ?auto_2412337 ) ) ( not ( = ?auto_2412334 ?auto_2412338 ) ) ( not ( = ?auto_2412334 ?auto_2412339 ) ) ( not ( = ?auto_2412334 ?auto_2412340 ) ) ( not ( = ?auto_2412334 ?auto_2412341 ) ) ( not ( = ?auto_2412334 ?auto_2412342 ) ) ( not ( = ?auto_2412335 ?auto_2412336 ) ) ( not ( = ?auto_2412335 ?auto_2412337 ) ) ( not ( = ?auto_2412335 ?auto_2412338 ) ) ( not ( = ?auto_2412335 ?auto_2412339 ) ) ( not ( = ?auto_2412335 ?auto_2412340 ) ) ( not ( = ?auto_2412335 ?auto_2412341 ) ) ( not ( = ?auto_2412335 ?auto_2412342 ) ) ( not ( = ?auto_2412336 ?auto_2412337 ) ) ( not ( = ?auto_2412336 ?auto_2412338 ) ) ( not ( = ?auto_2412336 ?auto_2412339 ) ) ( not ( = ?auto_2412336 ?auto_2412340 ) ) ( not ( = ?auto_2412336 ?auto_2412341 ) ) ( not ( = ?auto_2412336 ?auto_2412342 ) ) ( not ( = ?auto_2412337 ?auto_2412338 ) ) ( not ( = ?auto_2412337 ?auto_2412339 ) ) ( not ( = ?auto_2412337 ?auto_2412340 ) ) ( not ( = ?auto_2412337 ?auto_2412341 ) ) ( not ( = ?auto_2412337 ?auto_2412342 ) ) ( not ( = ?auto_2412338 ?auto_2412339 ) ) ( not ( = ?auto_2412338 ?auto_2412340 ) ) ( not ( = ?auto_2412338 ?auto_2412341 ) ) ( not ( = ?auto_2412338 ?auto_2412342 ) ) ( not ( = ?auto_2412339 ?auto_2412340 ) ) ( not ( = ?auto_2412339 ?auto_2412341 ) ) ( not ( = ?auto_2412339 ?auto_2412342 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2412340 ?auto_2412341 ?auto_2412342 )
      ( MAKE-10CRATE-VERIFY ?auto_2412332 ?auto_2412333 ?auto_2412334 ?auto_2412335 ?auto_2412336 ?auto_2412337 ?auto_2412338 ?auto_2412339 ?auto_2412340 ?auto_2412341 ?auto_2412342 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2412457 - SURFACE
      ?auto_2412458 - SURFACE
      ?auto_2412459 - SURFACE
      ?auto_2412460 - SURFACE
      ?auto_2412461 - SURFACE
      ?auto_2412462 - SURFACE
      ?auto_2412463 - SURFACE
      ?auto_2412464 - SURFACE
      ?auto_2412465 - SURFACE
      ?auto_2412466 - SURFACE
      ?auto_2412467 - SURFACE
    )
    :vars
    (
      ?auto_2412473 - HOIST
      ?auto_2412468 - PLACE
      ?auto_2412472 - TRUCK
      ?auto_2412471 - PLACE
      ?auto_2412469 - HOIST
      ?auto_2412470 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2412473 ?auto_2412468 ) ( SURFACE-AT ?auto_2412466 ?auto_2412468 ) ( CLEAR ?auto_2412466 ) ( IS-CRATE ?auto_2412467 ) ( not ( = ?auto_2412466 ?auto_2412467 ) ) ( AVAILABLE ?auto_2412473 ) ( ON ?auto_2412466 ?auto_2412465 ) ( not ( = ?auto_2412465 ?auto_2412466 ) ) ( not ( = ?auto_2412465 ?auto_2412467 ) ) ( TRUCK-AT ?auto_2412472 ?auto_2412471 ) ( not ( = ?auto_2412471 ?auto_2412468 ) ) ( HOIST-AT ?auto_2412469 ?auto_2412471 ) ( not ( = ?auto_2412473 ?auto_2412469 ) ) ( AVAILABLE ?auto_2412469 ) ( SURFACE-AT ?auto_2412467 ?auto_2412471 ) ( ON ?auto_2412467 ?auto_2412470 ) ( CLEAR ?auto_2412467 ) ( not ( = ?auto_2412466 ?auto_2412470 ) ) ( not ( = ?auto_2412467 ?auto_2412470 ) ) ( not ( = ?auto_2412465 ?auto_2412470 ) ) ( ON ?auto_2412458 ?auto_2412457 ) ( ON ?auto_2412459 ?auto_2412458 ) ( ON ?auto_2412460 ?auto_2412459 ) ( ON ?auto_2412461 ?auto_2412460 ) ( ON ?auto_2412462 ?auto_2412461 ) ( ON ?auto_2412463 ?auto_2412462 ) ( ON ?auto_2412464 ?auto_2412463 ) ( ON ?auto_2412465 ?auto_2412464 ) ( not ( = ?auto_2412457 ?auto_2412458 ) ) ( not ( = ?auto_2412457 ?auto_2412459 ) ) ( not ( = ?auto_2412457 ?auto_2412460 ) ) ( not ( = ?auto_2412457 ?auto_2412461 ) ) ( not ( = ?auto_2412457 ?auto_2412462 ) ) ( not ( = ?auto_2412457 ?auto_2412463 ) ) ( not ( = ?auto_2412457 ?auto_2412464 ) ) ( not ( = ?auto_2412457 ?auto_2412465 ) ) ( not ( = ?auto_2412457 ?auto_2412466 ) ) ( not ( = ?auto_2412457 ?auto_2412467 ) ) ( not ( = ?auto_2412457 ?auto_2412470 ) ) ( not ( = ?auto_2412458 ?auto_2412459 ) ) ( not ( = ?auto_2412458 ?auto_2412460 ) ) ( not ( = ?auto_2412458 ?auto_2412461 ) ) ( not ( = ?auto_2412458 ?auto_2412462 ) ) ( not ( = ?auto_2412458 ?auto_2412463 ) ) ( not ( = ?auto_2412458 ?auto_2412464 ) ) ( not ( = ?auto_2412458 ?auto_2412465 ) ) ( not ( = ?auto_2412458 ?auto_2412466 ) ) ( not ( = ?auto_2412458 ?auto_2412467 ) ) ( not ( = ?auto_2412458 ?auto_2412470 ) ) ( not ( = ?auto_2412459 ?auto_2412460 ) ) ( not ( = ?auto_2412459 ?auto_2412461 ) ) ( not ( = ?auto_2412459 ?auto_2412462 ) ) ( not ( = ?auto_2412459 ?auto_2412463 ) ) ( not ( = ?auto_2412459 ?auto_2412464 ) ) ( not ( = ?auto_2412459 ?auto_2412465 ) ) ( not ( = ?auto_2412459 ?auto_2412466 ) ) ( not ( = ?auto_2412459 ?auto_2412467 ) ) ( not ( = ?auto_2412459 ?auto_2412470 ) ) ( not ( = ?auto_2412460 ?auto_2412461 ) ) ( not ( = ?auto_2412460 ?auto_2412462 ) ) ( not ( = ?auto_2412460 ?auto_2412463 ) ) ( not ( = ?auto_2412460 ?auto_2412464 ) ) ( not ( = ?auto_2412460 ?auto_2412465 ) ) ( not ( = ?auto_2412460 ?auto_2412466 ) ) ( not ( = ?auto_2412460 ?auto_2412467 ) ) ( not ( = ?auto_2412460 ?auto_2412470 ) ) ( not ( = ?auto_2412461 ?auto_2412462 ) ) ( not ( = ?auto_2412461 ?auto_2412463 ) ) ( not ( = ?auto_2412461 ?auto_2412464 ) ) ( not ( = ?auto_2412461 ?auto_2412465 ) ) ( not ( = ?auto_2412461 ?auto_2412466 ) ) ( not ( = ?auto_2412461 ?auto_2412467 ) ) ( not ( = ?auto_2412461 ?auto_2412470 ) ) ( not ( = ?auto_2412462 ?auto_2412463 ) ) ( not ( = ?auto_2412462 ?auto_2412464 ) ) ( not ( = ?auto_2412462 ?auto_2412465 ) ) ( not ( = ?auto_2412462 ?auto_2412466 ) ) ( not ( = ?auto_2412462 ?auto_2412467 ) ) ( not ( = ?auto_2412462 ?auto_2412470 ) ) ( not ( = ?auto_2412463 ?auto_2412464 ) ) ( not ( = ?auto_2412463 ?auto_2412465 ) ) ( not ( = ?auto_2412463 ?auto_2412466 ) ) ( not ( = ?auto_2412463 ?auto_2412467 ) ) ( not ( = ?auto_2412463 ?auto_2412470 ) ) ( not ( = ?auto_2412464 ?auto_2412465 ) ) ( not ( = ?auto_2412464 ?auto_2412466 ) ) ( not ( = ?auto_2412464 ?auto_2412467 ) ) ( not ( = ?auto_2412464 ?auto_2412470 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2412465 ?auto_2412466 ?auto_2412467 )
      ( MAKE-10CRATE-VERIFY ?auto_2412457 ?auto_2412458 ?auto_2412459 ?auto_2412460 ?auto_2412461 ?auto_2412462 ?auto_2412463 ?auto_2412464 ?auto_2412465 ?auto_2412466 ?auto_2412467 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2412583 - SURFACE
      ?auto_2412584 - SURFACE
      ?auto_2412585 - SURFACE
      ?auto_2412586 - SURFACE
      ?auto_2412587 - SURFACE
      ?auto_2412588 - SURFACE
      ?auto_2412589 - SURFACE
      ?auto_2412590 - SURFACE
      ?auto_2412591 - SURFACE
      ?auto_2412592 - SURFACE
      ?auto_2412593 - SURFACE
    )
    :vars
    (
      ?auto_2412596 - HOIST
      ?auto_2412594 - PLACE
      ?auto_2412598 - PLACE
      ?auto_2412597 - HOIST
      ?auto_2412599 - SURFACE
      ?auto_2412595 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2412596 ?auto_2412594 ) ( SURFACE-AT ?auto_2412592 ?auto_2412594 ) ( CLEAR ?auto_2412592 ) ( IS-CRATE ?auto_2412593 ) ( not ( = ?auto_2412592 ?auto_2412593 ) ) ( AVAILABLE ?auto_2412596 ) ( ON ?auto_2412592 ?auto_2412591 ) ( not ( = ?auto_2412591 ?auto_2412592 ) ) ( not ( = ?auto_2412591 ?auto_2412593 ) ) ( not ( = ?auto_2412598 ?auto_2412594 ) ) ( HOIST-AT ?auto_2412597 ?auto_2412598 ) ( not ( = ?auto_2412596 ?auto_2412597 ) ) ( AVAILABLE ?auto_2412597 ) ( SURFACE-AT ?auto_2412593 ?auto_2412598 ) ( ON ?auto_2412593 ?auto_2412599 ) ( CLEAR ?auto_2412593 ) ( not ( = ?auto_2412592 ?auto_2412599 ) ) ( not ( = ?auto_2412593 ?auto_2412599 ) ) ( not ( = ?auto_2412591 ?auto_2412599 ) ) ( TRUCK-AT ?auto_2412595 ?auto_2412594 ) ( ON ?auto_2412584 ?auto_2412583 ) ( ON ?auto_2412585 ?auto_2412584 ) ( ON ?auto_2412586 ?auto_2412585 ) ( ON ?auto_2412587 ?auto_2412586 ) ( ON ?auto_2412588 ?auto_2412587 ) ( ON ?auto_2412589 ?auto_2412588 ) ( ON ?auto_2412590 ?auto_2412589 ) ( ON ?auto_2412591 ?auto_2412590 ) ( not ( = ?auto_2412583 ?auto_2412584 ) ) ( not ( = ?auto_2412583 ?auto_2412585 ) ) ( not ( = ?auto_2412583 ?auto_2412586 ) ) ( not ( = ?auto_2412583 ?auto_2412587 ) ) ( not ( = ?auto_2412583 ?auto_2412588 ) ) ( not ( = ?auto_2412583 ?auto_2412589 ) ) ( not ( = ?auto_2412583 ?auto_2412590 ) ) ( not ( = ?auto_2412583 ?auto_2412591 ) ) ( not ( = ?auto_2412583 ?auto_2412592 ) ) ( not ( = ?auto_2412583 ?auto_2412593 ) ) ( not ( = ?auto_2412583 ?auto_2412599 ) ) ( not ( = ?auto_2412584 ?auto_2412585 ) ) ( not ( = ?auto_2412584 ?auto_2412586 ) ) ( not ( = ?auto_2412584 ?auto_2412587 ) ) ( not ( = ?auto_2412584 ?auto_2412588 ) ) ( not ( = ?auto_2412584 ?auto_2412589 ) ) ( not ( = ?auto_2412584 ?auto_2412590 ) ) ( not ( = ?auto_2412584 ?auto_2412591 ) ) ( not ( = ?auto_2412584 ?auto_2412592 ) ) ( not ( = ?auto_2412584 ?auto_2412593 ) ) ( not ( = ?auto_2412584 ?auto_2412599 ) ) ( not ( = ?auto_2412585 ?auto_2412586 ) ) ( not ( = ?auto_2412585 ?auto_2412587 ) ) ( not ( = ?auto_2412585 ?auto_2412588 ) ) ( not ( = ?auto_2412585 ?auto_2412589 ) ) ( not ( = ?auto_2412585 ?auto_2412590 ) ) ( not ( = ?auto_2412585 ?auto_2412591 ) ) ( not ( = ?auto_2412585 ?auto_2412592 ) ) ( not ( = ?auto_2412585 ?auto_2412593 ) ) ( not ( = ?auto_2412585 ?auto_2412599 ) ) ( not ( = ?auto_2412586 ?auto_2412587 ) ) ( not ( = ?auto_2412586 ?auto_2412588 ) ) ( not ( = ?auto_2412586 ?auto_2412589 ) ) ( not ( = ?auto_2412586 ?auto_2412590 ) ) ( not ( = ?auto_2412586 ?auto_2412591 ) ) ( not ( = ?auto_2412586 ?auto_2412592 ) ) ( not ( = ?auto_2412586 ?auto_2412593 ) ) ( not ( = ?auto_2412586 ?auto_2412599 ) ) ( not ( = ?auto_2412587 ?auto_2412588 ) ) ( not ( = ?auto_2412587 ?auto_2412589 ) ) ( not ( = ?auto_2412587 ?auto_2412590 ) ) ( not ( = ?auto_2412587 ?auto_2412591 ) ) ( not ( = ?auto_2412587 ?auto_2412592 ) ) ( not ( = ?auto_2412587 ?auto_2412593 ) ) ( not ( = ?auto_2412587 ?auto_2412599 ) ) ( not ( = ?auto_2412588 ?auto_2412589 ) ) ( not ( = ?auto_2412588 ?auto_2412590 ) ) ( not ( = ?auto_2412588 ?auto_2412591 ) ) ( not ( = ?auto_2412588 ?auto_2412592 ) ) ( not ( = ?auto_2412588 ?auto_2412593 ) ) ( not ( = ?auto_2412588 ?auto_2412599 ) ) ( not ( = ?auto_2412589 ?auto_2412590 ) ) ( not ( = ?auto_2412589 ?auto_2412591 ) ) ( not ( = ?auto_2412589 ?auto_2412592 ) ) ( not ( = ?auto_2412589 ?auto_2412593 ) ) ( not ( = ?auto_2412589 ?auto_2412599 ) ) ( not ( = ?auto_2412590 ?auto_2412591 ) ) ( not ( = ?auto_2412590 ?auto_2412592 ) ) ( not ( = ?auto_2412590 ?auto_2412593 ) ) ( not ( = ?auto_2412590 ?auto_2412599 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2412591 ?auto_2412592 ?auto_2412593 )
      ( MAKE-10CRATE-VERIFY ?auto_2412583 ?auto_2412584 ?auto_2412585 ?auto_2412586 ?auto_2412587 ?auto_2412588 ?auto_2412589 ?auto_2412590 ?auto_2412591 ?auto_2412592 ?auto_2412593 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2412709 - SURFACE
      ?auto_2412710 - SURFACE
      ?auto_2412711 - SURFACE
      ?auto_2412712 - SURFACE
      ?auto_2412713 - SURFACE
      ?auto_2412714 - SURFACE
      ?auto_2412715 - SURFACE
      ?auto_2412716 - SURFACE
      ?auto_2412717 - SURFACE
      ?auto_2412718 - SURFACE
      ?auto_2412719 - SURFACE
    )
    :vars
    (
      ?auto_2412724 - HOIST
      ?auto_2412721 - PLACE
      ?auto_2412720 - PLACE
      ?auto_2412722 - HOIST
      ?auto_2412723 - SURFACE
      ?auto_2412725 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2412724 ?auto_2412721 ) ( IS-CRATE ?auto_2412719 ) ( not ( = ?auto_2412718 ?auto_2412719 ) ) ( not ( = ?auto_2412717 ?auto_2412718 ) ) ( not ( = ?auto_2412717 ?auto_2412719 ) ) ( not ( = ?auto_2412720 ?auto_2412721 ) ) ( HOIST-AT ?auto_2412722 ?auto_2412720 ) ( not ( = ?auto_2412724 ?auto_2412722 ) ) ( AVAILABLE ?auto_2412722 ) ( SURFACE-AT ?auto_2412719 ?auto_2412720 ) ( ON ?auto_2412719 ?auto_2412723 ) ( CLEAR ?auto_2412719 ) ( not ( = ?auto_2412718 ?auto_2412723 ) ) ( not ( = ?auto_2412719 ?auto_2412723 ) ) ( not ( = ?auto_2412717 ?auto_2412723 ) ) ( TRUCK-AT ?auto_2412725 ?auto_2412721 ) ( SURFACE-AT ?auto_2412717 ?auto_2412721 ) ( CLEAR ?auto_2412717 ) ( LIFTING ?auto_2412724 ?auto_2412718 ) ( IS-CRATE ?auto_2412718 ) ( ON ?auto_2412710 ?auto_2412709 ) ( ON ?auto_2412711 ?auto_2412710 ) ( ON ?auto_2412712 ?auto_2412711 ) ( ON ?auto_2412713 ?auto_2412712 ) ( ON ?auto_2412714 ?auto_2412713 ) ( ON ?auto_2412715 ?auto_2412714 ) ( ON ?auto_2412716 ?auto_2412715 ) ( ON ?auto_2412717 ?auto_2412716 ) ( not ( = ?auto_2412709 ?auto_2412710 ) ) ( not ( = ?auto_2412709 ?auto_2412711 ) ) ( not ( = ?auto_2412709 ?auto_2412712 ) ) ( not ( = ?auto_2412709 ?auto_2412713 ) ) ( not ( = ?auto_2412709 ?auto_2412714 ) ) ( not ( = ?auto_2412709 ?auto_2412715 ) ) ( not ( = ?auto_2412709 ?auto_2412716 ) ) ( not ( = ?auto_2412709 ?auto_2412717 ) ) ( not ( = ?auto_2412709 ?auto_2412718 ) ) ( not ( = ?auto_2412709 ?auto_2412719 ) ) ( not ( = ?auto_2412709 ?auto_2412723 ) ) ( not ( = ?auto_2412710 ?auto_2412711 ) ) ( not ( = ?auto_2412710 ?auto_2412712 ) ) ( not ( = ?auto_2412710 ?auto_2412713 ) ) ( not ( = ?auto_2412710 ?auto_2412714 ) ) ( not ( = ?auto_2412710 ?auto_2412715 ) ) ( not ( = ?auto_2412710 ?auto_2412716 ) ) ( not ( = ?auto_2412710 ?auto_2412717 ) ) ( not ( = ?auto_2412710 ?auto_2412718 ) ) ( not ( = ?auto_2412710 ?auto_2412719 ) ) ( not ( = ?auto_2412710 ?auto_2412723 ) ) ( not ( = ?auto_2412711 ?auto_2412712 ) ) ( not ( = ?auto_2412711 ?auto_2412713 ) ) ( not ( = ?auto_2412711 ?auto_2412714 ) ) ( not ( = ?auto_2412711 ?auto_2412715 ) ) ( not ( = ?auto_2412711 ?auto_2412716 ) ) ( not ( = ?auto_2412711 ?auto_2412717 ) ) ( not ( = ?auto_2412711 ?auto_2412718 ) ) ( not ( = ?auto_2412711 ?auto_2412719 ) ) ( not ( = ?auto_2412711 ?auto_2412723 ) ) ( not ( = ?auto_2412712 ?auto_2412713 ) ) ( not ( = ?auto_2412712 ?auto_2412714 ) ) ( not ( = ?auto_2412712 ?auto_2412715 ) ) ( not ( = ?auto_2412712 ?auto_2412716 ) ) ( not ( = ?auto_2412712 ?auto_2412717 ) ) ( not ( = ?auto_2412712 ?auto_2412718 ) ) ( not ( = ?auto_2412712 ?auto_2412719 ) ) ( not ( = ?auto_2412712 ?auto_2412723 ) ) ( not ( = ?auto_2412713 ?auto_2412714 ) ) ( not ( = ?auto_2412713 ?auto_2412715 ) ) ( not ( = ?auto_2412713 ?auto_2412716 ) ) ( not ( = ?auto_2412713 ?auto_2412717 ) ) ( not ( = ?auto_2412713 ?auto_2412718 ) ) ( not ( = ?auto_2412713 ?auto_2412719 ) ) ( not ( = ?auto_2412713 ?auto_2412723 ) ) ( not ( = ?auto_2412714 ?auto_2412715 ) ) ( not ( = ?auto_2412714 ?auto_2412716 ) ) ( not ( = ?auto_2412714 ?auto_2412717 ) ) ( not ( = ?auto_2412714 ?auto_2412718 ) ) ( not ( = ?auto_2412714 ?auto_2412719 ) ) ( not ( = ?auto_2412714 ?auto_2412723 ) ) ( not ( = ?auto_2412715 ?auto_2412716 ) ) ( not ( = ?auto_2412715 ?auto_2412717 ) ) ( not ( = ?auto_2412715 ?auto_2412718 ) ) ( not ( = ?auto_2412715 ?auto_2412719 ) ) ( not ( = ?auto_2412715 ?auto_2412723 ) ) ( not ( = ?auto_2412716 ?auto_2412717 ) ) ( not ( = ?auto_2412716 ?auto_2412718 ) ) ( not ( = ?auto_2412716 ?auto_2412719 ) ) ( not ( = ?auto_2412716 ?auto_2412723 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2412717 ?auto_2412718 ?auto_2412719 )
      ( MAKE-10CRATE-VERIFY ?auto_2412709 ?auto_2412710 ?auto_2412711 ?auto_2412712 ?auto_2412713 ?auto_2412714 ?auto_2412715 ?auto_2412716 ?auto_2412717 ?auto_2412718 ?auto_2412719 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2412835 - SURFACE
      ?auto_2412836 - SURFACE
      ?auto_2412837 - SURFACE
      ?auto_2412838 - SURFACE
      ?auto_2412839 - SURFACE
      ?auto_2412840 - SURFACE
      ?auto_2412841 - SURFACE
      ?auto_2412842 - SURFACE
      ?auto_2412843 - SURFACE
      ?auto_2412844 - SURFACE
      ?auto_2412845 - SURFACE
    )
    :vars
    (
      ?auto_2412848 - HOIST
      ?auto_2412846 - PLACE
      ?auto_2412851 - PLACE
      ?auto_2412850 - HOIST
      ?auto_2412849 - SURFACE
      ?auto_2412847 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2412848 ?auto_2412846 ) ( IS-CRATE ?auto_2412845 ) ( not ( = ?auto_2412844 ?auto_2412845 ) ) ( not ( = ?auto_2412843 ?auto_2412844 ) ) ( not ( = ?auto_2412843 ?auto_2412845 ) ) ( not ( = ?auto_2412851 ?auto_2412846 ) ) ( HOIST-AT ?auto_2412850 ?auto_2412851 ) ( not ( = ?auto_2412848 ?auto_2412850 ) ) ( AVAILABLE ?auto_2412850 ) ( SURFACE-AT ?auto_2412845 ?auto_2412851 ) ( ON ?auto_2412845 ?auto_2412849 ) ( CLEAR ?auto_2412845 ) ( not ( = ?auto_2412844 ?auto_2412849 ) ) ( not ( = ?auto_2412845 ?auto_2412849 ) ) ( not ( = ?auto_2412843 ?auto_2412849 ) ) ( TRUCK-AT ?auto_2412847 ?auto_2412846 ) ( SURFACE-AT ?auto_2412843 ?auto_2412846 ) ( CLEAR ?auto_2412843 ) ( IS-CRATE ?auto_2412844 ) ( AVAILABLE ?auto_2412848 ) ( IN ?auto_2412844 ?auto_2412847 ) ( ON ?auto_2412836 ?auto_2412835 ) ( ON ?auto_2412837 ?auto_2412836 ) ( ON ?auto_2412838 ?auto_2412837 ) ( ON ?auto_2412839 ?auto_2412838 ) ( ON ?auto_2412840 ?auto_2412839 ) ( ON ?auto_2412841 ?auto_2412840 ) ( ON ?auto_2412842 ?auto_2412841 ) ( ON ?auto_2412843 ?auto_2412842 ) ( not ( = ?auto_2412835 ?auto_2412836 ) ) ( not ( = ?auto_2412835 ?auto_2412837 ) ) ( not ( = ?auto_2412835 ?auto_2412838 ) ) ( not ( = ?auto_2412835 ?auto_2412839 ) ) ( not ( = ?auto_2412835 ?auto_2412840 ) ) ( not ( = ?auto_2412835 ?auto_2412841 ) ) ( not ( = ?auto_2412835 ?auto_2412842 ) ) ( not ( = ?auto_2412835 ?auto_2412843 ) ) ( not ( = ?auto_2412835 ?auto_2412844 ) ) ( not ( = ?auto_2412835 ?auto_2412845 ) ) ( not ( = ?auto_2412835 ?auto_2412849 ) ) ( not ( = ?auto_2412836 ?auto_2412837 ) ) ( not ( = ?auto_2412836 ?auto_2412838 ) ) ( not ( = ?auto_2412836 ?auto_2412839 ) ) ( not ( = ?auto_2412836 ?auto_2412840 ) ) ( not ( = ?auto_2412836 ?auto_2412841 ) ) ( not ( = ?auto_2412836 ?auto_2412842 ) ) ( not ( = ?auto_2412836 ?auto_2412843 ) ) ( not ( = ?auto_2412836 ?auto_2412844 ) ) ( not ( = ?auto_2412836 ?auto_2412845 ) ) ( not ( = ?auto_2412836 ?auto_2412849 ) ) ( not ( = ?auto_2412837 ?auto_2412838 ) ) ( not ( = ?auto_2412837 ?auto_2412839 ) ) ( not ( = ?auto_2412837 ?auto_2412840 ) ) ( not ( = ?auto_2412837 ?auto_2412841 ) ) ( not ( = ?auto_2412837 ?auto_2412842 ) ) ( not ( = ?auto_2412837 ?auto_2412843 ) ) ( not ( = ?auto_2412837 ?auto_2412844 ) ) ( not ( = ?auto_2412837 ?auto_2412845 ) ) ( not ( = ?auto_2412837 ?auto_2412849 ) ) ( not ( = ?auto_2412838 ?auto_2412839 ) ) ( not ( = ?auto_2412838 ?auto_2412840 ) ) ( not ( = ?auto_2412838 ?auto_2412841 ) ) ( not ( = ?auto_2412838 ?auto_2412842 ) ) ( not ( = ?auto_2412838 ?auto_2412843 ) ) ( not ( = ?auto_2412838 ?auto_2412844 ) ) ( not ( = ?auto_2412838 ?auto_2412845 ) ) ( not ( = ?auto_2412838 ?auto_2412849 ) ) ( not ( = ?auto_2412839 ?auto_2412840 ) ) ( not ( = ?auto_2412839 ?auto_2412841 ) ) ( not ( = ?auto_2412839 ?auto_2412842 ) ) ( not ( = ?auto_2412839 ?auto_2412843 ) ) ( not ( = ?auto_2412839 ?auto_2412844 ) ) ( not ( = ?auto_2412839 ?auto_2412845 ) ) ( not ( = ?auto_2412839 ?auto_2412849 ) ) ( not ( = ?auto_2412840 ?auto_2412841 ) ) ( not ( = ?auto_2412840 ?auto_2412842 ) ) ( not ( = ?auto_2412840 ?auto_2412843 ) ) ( not ( = ?auto_2412840 ?auto_2412844 ) ) ( not ( = ?auto_2412840 ?auto_2412845 ) ) ( not ( = ?auto_2412840 ?auto_2412849 ) ) ( not ( = ?auto_2412841 ?auto_2412842 ) ) ( not ( = ?auto_2412841 ?auto_2412843 ) ) ( not ( = ?auto_2412841 ?auto_2412844 ) ) ( not ( = ?auto_2412841 ?auto_2412845 ) ) ( not ( = ?auto_2412841 ?auto_2412849 ) ) ( not ( = ?auto_2412842 ?auto_2412843 ) ) ( not ( = ?auto_2412842 ?auto_2412844 ) ) ( not ( = ?auto_2412842 ?auto_2412845 ) ) ( not ( = ?auto_2412842 ?auto_2412849 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2412843 ?auto_2412844 ?auto_2412845 )
      ( MAKE-10CRATE-VERIFY ?auto_2412835 ?auto_2412836 ?auto_2412837 ?auto_2412838 ?auto_2412839 ?auto_2412840 ?auto_2412841 ?auto_2412842 ?auto_2412843 ?auto_2412844 ?auto_2412845 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2420119 - SURFACE
      ?auto_2420120 - SURFACE
      ?auto_2420121 - SURFACE
      ?auto_2420122 - SURFACE
      ?auto_2420123 - SURFACE
      ?auto_2420124 - SURFACE
      ?auto_2420125 - SURFACE
      ?auto_2420126 - SURFACE
      ?auto_2420127 - SURFACE
      ?auto_2420128 - SURFACE
      ?auto_2420129 - SURFACE
      ?auto_2420130 - SURFACE
    )
    :vars
    (
      ?auto_2420131 - HOIST
      ?auto_2420132 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2420131 ?auto_2420132 ) ( SURFACE-AT ?auto_2420129 ?auto_2420132 ) ( CLEAR ?auto_2420129 ) ( LIFTING ?auto_2420131 ?auto_2420130 ) ( IS-CRATE ?auto_2420130 ) ( not ( = ?auto_2420129 ?auto_2420130 ) ) ( ON ?auto_2420120 ?auto_2420119 ) ( ON ?auto_2420121 ?auto_2420120 ) ( ON ?auto_2420122 ?auto_2420121 ) ( ON ?auto_2420123 ?auto_2420122 ) ( ON ?auto_2420124 ?auto_2420123 ) ( ON ?auto_2420125 ?auto_2420124 ) ( ON ?auto_2420126 ?auto_2420125 ) ( ON ?auto_2420127 ?auto_2420126 ) ( ON ?auto_2420128 ?auto_2420127 ) ( ON ?auto_2420129 ?auto_2420128 ) ( not ( = ?auto_2420119 ?auto_2420120 ) ) ( not ( = ?auto_2420119 ?auto_2420121 ) ) ( not ( = ?auto_2420119 ?auto_2420122 ) ) ( not ( = ?auto_2420119 ?auto_2420123 ) ) ( not ( = ?auto_2420119 ?auto_2420124 ) ) ( not ( = ?auto_2420119 ?auto_2420125 ) ) ( not ( = ?auto_2420119 ?auto_2420126 ) ) ( not ( = ?auto_2420119 ?auto_2420127 ) ) ( not ( = ?auto_2420119 ?auto_2420128 ) ) ( not ( = ?auto_2420119 ?auto_2420129 ) ) ( not ( = ?auto_2420119 ?auto_2420130 ) ) ( not ( = ?auto_2420120 ?auto_2420121 ) ) ( not ( = ?auto_2420120 ?auto_2420122 ) ) ( not ( = ?auto_2420120 ?auto_2420123 ) ) ( not ( = ?auto_2420120 ?auto_2420124 ) ) ( not ( = ?auto_2420120 ?auto_2420125 ) ) ( not ( = ?auto_2420120 ?auto_2420126 ) ) ( not ( = ?auto_2420120 ?auto_2420127 ) ) ( not ( = ?auto_2420120 ?auto_2420128 ) ) ( not ( = ?auto_2420120 ?auto_2420129 ) ) ( not ( = ?auto_2420120 ?auto_2420130 ) ) ( not ( = ?auto_2420121 ?auto_2420122 ) ) ( not ( = ?auto_2420121 ?auto_2420123 ) ) ( not ( = ?auto_2420121 ?auto_2420124 ) ) ( not ( = ?auto_2420121 ?auto_2420125 ) ) ( not ( = ?auto_2420121 ?auto_2420126 ) ) ( not ( = ?auto_2420121 ?auto_2420127 ) ) ( not ( = ?auto_2420121 ?auto_2420128 ) ) ( not ( = ?auto_2420121 ?auto_2420129 ) ) ( not ( = ?auto_2420121 ?auto_2420130 ) ) ( not ( = ?auto_2420122 ?auto_2420123 ) ) ( not ( = ?auto_2420122 ?auto_2420124 ) ) ( not ( = ?auto_2420122 ?auto_2420125 ) ) ( not ( = ?auto_2420122 ?auto_2420126 ) ) ( not ( = ?auto_2420122 ?auto_2420127 ) ) ( not ( = ?auto_2420122 ?auto_2420128 ) ) ( not ( = ?auto_2420122 ?auto_2420129 ) ) ( not ( = ?auto_2420122 ?auto_2420130 ) ) ( not ( = ?auto_2420123 ?auto_2420124 ) ) ( not ( = ?auto_2420123 ?auto_2420125 ) ) ( not ( = ?auto_2420123 ?auto_2420126 ) ) ( not ( = ?auto_2420123 ?auto_2420127 ) ) ( not ( = ?auto_2420123 ?auto_2420128 ) ) ( not ( = ?auto_2420123 ?auto_2420129 ) ) ( not ( = ?auto_2420123 ?auto_2420130 ) ) ( not ( = ?auto_2420124 ?auto_2420125 ) ) ( not ( = ?auto_2420124 ?auto_2420126 ) ) ( not ( = ?auto_2420124 ?auto_2420127 ) ) ( not ( = ?auto_2420124 ?auto_2420128 ) ) ( not ( = ?auto_2420124 ?auto_2420129 ) ) ( not ( = ?auto_2420124 ?auto_2420130 ) ) ( not ( = ?auto_2420125 ?auto_2420126 ) ) ( not ( = ?auto_2420125 ?auto_2420127 ) ) ( not ( = ?auto_2420125 ?auto_2420128 ) ) ( not ( = ?auto_2420125 ?auto_2420129 ) ) ( not ( = ?auto_2420125 ?auto_2420130 ) ) ( not ( = ?auto_2420126 ?auto_2420127 ) ) ( not ( = ?auto_2420126 ?auto_2420128 ) ) ( not ( = ?auto_2420126 ?auto_2420129 ) ) ( not ( = ?auto_2420126 ?auto_2420130 ) ) ( not ( = ?auto_2420127 ?auto_2420128 ) ) ( not ( = ?auto_2420127 ?auto_2420129 ) ) ( not ( = ?auto_2420127 ?auto_2420130 ) ) ( not ( = ?auto_2420128 ?auto_2420129 ) ) ( not ( = ?auto_2420128 ?auto_2420130 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2420129 ?auto_2420130 )
      ( MAKE-11CRATE-VERIFY ?auto_2420119 ?auto_2420120 ?auto_2420121 ?auto_2420122 ?auto_2420123 ?auto_2420124 ?auto_2420125 ?auto_2420126 ?auto_2420127 ?auto_2420128 ?auto_2420129 ?auto_2420130 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2420228 - SURFACE
      ?auto_2420229 - SURFACE
      ?auto_2420230 - SURFACE
      ?auto_2420231 - SURFACE
      ?auto_2420232 - SURFACE
      ?auto_2420233 - SURFACE
      ?auto_2420234 - SURFACE
      ?auto_2420235 - SURFACE
      ?auto_2420236 - SURFACE
      ?auto_2420237 - SURFACE
      ?auto_2420238 - SURFACE
      ?auto_2420239 - SURFACE
    )
    :vars
    (
      ?auto_2420240 - HOIST
      ?auto_2420241 - PLACE
      ?auto_2420242 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2420240 ?auto_2420241 ) ( SURFACE-AT ?auto_2420238 ?auto_2420241 ) ( CLEAR ?auto_2420238 ) ( IS-CRATE ?auto_2420239 ) ( not ( = ?auto_2420238 ?auto_2420239 ) ) ( TRUCK-AT ?auto_2420242 ?auto_2420241 ) ( AVAILABLE ?auto_2420240 ) ( IN ?auto_2420239 ?auto_2420242 ) ( ON ?auto_2420238 ?auto_2420237 ) ( not ( = ?auto_2420237 ?auto_2420238 ) ) ( not ( = ?auto_2420237 ?auto_2420239 ) ) ( ON ?auto_2420229 ?auto_2420228 ) ( ON ?auto_2420230 ?auto_2420229 ) ( ON ?auto_2420231 ?auto_2420230 ) ( ON ?auto_2420232 ?auto_2420231 ) ( ON ?auto_2420233 ?auto_2420232 ) ( ON ?auto_2420234 ?auto_2420233 ) ( ON ?auto_2420235 ?auto_2420234 ) ( ON ?auto_2420236 ?auto_2420235 ) ( ON ?auto_2420237 ?auto_2420236 ) ( not ( = ?auto_2420228 ?auto_2420229 ) ) ( not ( = ?auto_2420228 ?auto_2420230 ) ) ( not ( = ?auto_2420228 ?auto_2420231 ) ) ( not ( = ?auto_2420228 ?auto_2420232 ) ) ( not ( = ?auto_2420228 ?auto_2420233 ) ) ( not ( = ?auto_2420228 ?auto_2420234 ) ) ( not ( = ?auto_2420228 ?auto_2420235 ) ) ( not ( = ?auto_2420228 ?auto_2420236 ) ) ( not ( = ?auto_2420228 ?auto_2420237 ) ) ( not ( = ?auto_2420228 ?auto_2420238 ) ) ( not ( = ?auto_2420228 ?auto_2420239 ) ) ( not ( = ?auto_2420229 ?auto_2420230 ) ) ( not ( = ?auto_2420229 ?auto_2420231 ) ) ( not ( = ?auto_2420229 ?auto_2420232 ) ) ( not ( = ?auto_2420229 ?auto_2420233 ) ) ( not ( = ?auto_2420229 ?auto_2420234 ) ) ( not ( = ?auto_2420229 ?auto_2420235 ) ) ( not ( = ?auto_2420229 ?auto_2420236 ) ) ( not ( = ?auto_2420229 ?auto_2420237 ) ) ( not ( = ?auto_2420229 ?auto_2420238 ) ) ( not ( = ?auto_2420229 ?auto_2420239 ) ) ( not ( = ?auto_2420230 ?auto_2420231 ) ) ( not ( = ?auto_2420230 ?auto_2420232 ) ) ( not ( = ?auto_2420230 ?auto_2420233 ) ) ( not ( = ?auto_2420230 ?auto_2420234 ) ) ( not ( = ?auto_2420230 ?auto_2420235 ) ) ( not ( = ?auto_2420230 ?auto_2420236 ) ) ( not ( = ?auto_2420230 ?auto_2420237 ) ) ( not ( = ?auto_2420230 ?auto_2420238 ) ) ( not ( = ?auto_2420230 ?auto_2420239 ) ) ( not ( = ?auto_2420231 ?auto_2420232 ) ) ( not ( = ?auto_2420231 ?auto_2420233 ) ) ( not ( = ?auto_2420231 ?auto_2420234 ) ) ( not ( = ?auto_2420231 ?auto_2420235 ) ) ( not ( = ?auto_2420231 ?auto_2420236 ) ) ( not ( = ?auto_2420231 ?auto_2420237 ) ) ( not ( = ?auto_2420231 ?auto_2420238 ) ) ( not ( = ?auto_2420231 ?auto_2420239 ) ) ( not ( = ?auto_2420232 ?auto_2420233 ) ) ( not ( = ?auto_2420232 ?auto_2420234 ) ) ( not ( = ?auto_2420232 ?auto_2420235 ) ) ( not ( = ?auto_2420232 ?auto_2420236 ) ) ( not ( = ?auto_2420232 ?auto_2420237 ) ) ( not ( = ?auto_2420232 ?auto_2420238 ) ) ( not ( = ?auto_2420232 ?auto_2420239 ) ) ( not ( = ?auto_2420233 ?auto_2420234 ) ) ( not ( = ?auto_2420233 ?auto_2420235 ) ) ( not ( = ?auto_2420233 ?auto_2420236 ) ) ( not ( = ?auto_2420233 ?auto_2420237 ) ) ( not ( = ?auto_2420233 ?auto_2420238 ) ) ( not ( = ?auto_2420233 ?auto_2420239 ) ) ( not ( = ?auto_2420234 ?auto_2420235 ) ) ( not ( = ?auto_2420234 ?auto_2420236 ) ) ( not ( = ?auto_2420234 ?auto_2420237 ) ) ( not ( = ?auto_2420234 ?auto_2420238 ) ) ( not ( = ?auto_2420234 ?auto_2420239 ) ) ( not ( = ?auto_2420235 ?auto_2420236 ) ) ( not ( = ?auto_2420235 ?auto_2420237 ) ) ( not ( = ?auto_2420235 ?auto_2420238 ) ) ( not ( = ?auto_2420235 ?auto_2420239 ) ) ( not ( = ?auto_2420236 ?auto_2420237 ) ) ( not ( = ?auto_2420236 ?auto_2420238 ) ) ( not ( = ?auto_2420236 ?auto_2420239 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2420237 ?auto_2420238 ?auto_2420239 )
      ( MAKE-11CRATE-VERIFY ?auto_2420228 ?auto_2420229 ?auto_2420230 ?auto_2420231 ?auto_2420232 ?auto_2420233 ?auto_2420234 ?auto_2420235 ?auto_2420236 ?auto_2420237 ?auto_2420238 ?auto_2420239 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2420349 - SURFACE
      ?auto_2420350 - SURFACE
      ?auto_2420351 - SURFACE
      ?auto_2420352 - SURFACE
      ?auto_2420353 - SURFACE
      ?auto_2420354 - SURFACE
      ?auto_2420355 - SURFACE
      ?auto_2420356 - SURFACE
      ?auto_2420357 - SURFACE
      ?auto_2420358 - SURFACE
      ?auto_2420359 - SURFACE
      ?auto_2420360 - SURFACE
    )
    :vars
    (
      ?auto_2420362 - HOIST
      ?auto_2420361 - PLACE
      ?auto_2420363 - TRUCK
      ?auto_2420364 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2420362 ?auto_2420361 ) ( SURFACE-AT ?auto_2420359 ?auto_2420361 ) ( CLEAR ?auto_2420359 ) ( IS-CRATE ?auto_2420360 ) ( not ( = ?auto_2420359 ?auto_2420360 ) ) ( AVAILABLE ?auto_2420362 ) ( IN ?auto_2420360 ?auto_2420363 ) ( ON ?auto_2420359 ?auto_2420358 ) ( not ( = ?auto_2420358 ?auto_2420359 ) ) ( not ( = ?auto_2420358 ?auto_2420360 ) ) ( TRUCK-AT ?auto_2420363 ?auto_2420364 ) ( not ( = ?auto_2420364 ?auto_2420361 ) ) ( ON ?auto_2420350 ?auto_2420349 ) ( ON ?auto_2420351 ?auto_2420350 ) ( ON ?auto_2420352 ?auto_2420351 ) ( ON ?auto_2420353 ?auto_2420352 ) ( ON ?auto_2420354 ?auto_2420353 ) ( ON ?auto_2420355 ?auto_2420354 ) ( ON ?auto_2420356 ?auto_2420355 ) ( ON ?auto_2420357 ?auto_2420356 ) ( ON ?auto_2420358 ?auto_2420357 ) ( not ( = ?auto_2420349 ?auto_2420350 ) ) ( not ( = ?auto_2420349 ?auto_2420351 ) ) ( not ( = ?auto_2420349 ?auto_2420352 ) ) ( not ( = ?auto_2420349 ?auto_2420353 ) ) ( not ( = ?auto_2420349 ?auto_2420354 ) ) ( not ( = ?auto_2420349 ?auto_2420355 ) ) ( not ( = ?auto_2420349 ?auto_2420356 ) ) ( not ( = ?auto_2420349 ?auto_2420357 ) ) ( not ( = ?auto_2420349 ?auto_2420358 ) ) ( not ( = ?auto_2420349 ?auto_2420359 ) ) ( not ( = ?auto_2420349 ?auto_2420360 ) ) ( not ( = ?auto_2420350 ?auto_2420351 ) ) ( not ( = ?auto_2420350 ?auto_2420352 ) ) ( not ( = ?auto_2420350 ?auto_2420353 ) ) ( not ( = ?auto_2420350 ?auto_2420354 ) ) ( not ( = ?auto_2420350 ?auto_2420355 ) ) ( not ( = ?auto_2420350 ?auto_2420356 ) ) ( not ( = ?auto_2420350 ?auto_2420357 ) ) ( not ( = ?auto_2420350 ?auto_2420358 ) ) ( not ( = ?auto_2420350 ?auto_2420359 ) ) ( not ( = ?auto_2420350 ?auto_2420360 ) ) ( not ( = ?auto_2420351 ?auto_2420352 ) ) ( not ( = ?auto_2420351 ?auto_2420353 ) ) ( not ( = ?auto_2420351 ?auto_2420354 ) ) ( not ( = ?auto_2420351 ?auto_2420355 ) ) ( not ( = ?auto_2420351 ?auto_2420356 ) ) ( not ( = ?auto_2420351 ?auto_2420357 ) ) ( not ( = ?auto_2420351 ?auto_2420358 ) ) ( not ( = ?auto_2420351 ?auto_2420359 ) ) ( not ( = ?auto_2420351 ?auto_2420360 ) ) ( not ( = ?auto_2420352 ?auto_2420353 ) ) ( not ( = ?auto_2420352 ?auto_2420354 ) ) ( not ( = ?auto_2420352 ?auto_2420355 ) ) ( not ( = ?auto_2420352 ?auto_2420356 ) ) ( not ( = ?auto_2420352 ?auto_2420357 ) ) ( not ( = ?auto_2420352 ?auto_2420358 ) ) ( not ( = ?auto_2420352 ?auto_2420359 ) ) ( not ( = ?auto_2420352 ?auto_2420360 ) ) ( not ( = ?auto_2420353 ?auto_2420354 ) ) ( not ( = ?auto_2420353 ?auto_2420355 ) ) ( not ( = ?auto_2420353 ?auto_2420356 ) ) ( not ( = ?auto_2420353 ?auto_2420357 ) ) ( not ( = ?auto_2420353 ?auto_2420358 ) ) ( not ( = ?auto_2420353 ?auto_2420359 ) ) ( not ( = ?auto_2420353 ?auto_2420360 ) ) ( not ( = ?auto_2420354 ?auto_2420355 ) ) ( not ( = ?auto_2420354 ?auto_2420356 ) ) ( not ( = ?auto_2420354 ?auto_2420357 ) ) ( not ( = ?auto_2420354 ?auto_2420358 ) ) ( not ( = ?auto_2420354 ?auto_2420359 ) ) ( not ( = ?auto_2420354 ?auto_2420360 ) ) ( not ( = ?auto_2420355 ?auto_2420356 ) ) ( not ( = ?auto_2420355 ?auto_2420357 ) ) ( not ( = ?auto_2420355 ?auto_2420358 ) ) ( not ( = ?auto_2420355 ?auto_2420359 ) ) ( not ( = ?auto_2420355 ?auto_2420360 ) ) ( not ( = ?auto_2420356 ?auto_2420357 ) ) ( not ( = ?auto_2420356 ?auto_2420358 ) ) ( not ( = ?auto_2420356 ?auto_2420359 ) ) ( not ( = ?auto_2420356 ?auto_2420360 ) ) ( not ( = ?auto_2420357 ?auto_2420358 ) ) ( not ( = ?auto_2420357 ?auto_2420359 ) ) ( not ( = ?auto_2420357 ?auto_2420360 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2420358 ?auto_2420359 ?auto_2420360 )
      ( MAKE-11CRATE-VERIFY ?auto_2420349 ?auto_2420350 ?auto_2420351 ?auto_2420352 ?auto_2420353 ?auto_2420354 ?auto_2420355 ?auto_2420356 ?auto_2420357 ?auto_2420358 ?auto_2420359 ?auto_2420360 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2420481 - SURFACE
      ?auto_2420482 - SURFACE
      ?auto_2420483 - SURFACE
      ?auto_2420484 - SURFACE
      ?auto_2420485 - SURFACE
      ?auto_2420486 - SURFACE
      ?auto_2420487 - SURFACE
      ?auto_2420488 - SURFACE
      ?auto_2420489 - SURFACE
      ?auto_2420490 - SURFACE
      ?auto_2420491 - SURFACE
      ?auto_2420492 - SURFACE
    )
    :vars
    (
      ?auto_2420496 - HOIST
      ?auto_2420497 - PLACE
      ?auto_2420493 - TRUCK
      ?auto_2420494 - PLACE
      ?auto_2420495 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2420496 ?auto_2420497 ) ( SURFACE-AT ?auto_2420491 ?auto_2420497 ) ( CLEAR ?auto_2420491 ) ( IS-CRATE ?auto_2420492 ) ( not ( = ?auto_2420491 ?auto_2420492 ) ) ( AVAILABLE ?auto_2420496 ) ( ON ?auto_2420491 ?auto_2420490 ) ( not ( = ?auto_2420490 ?auto_2420491 ) ) ( not ( = ?auto_2420490 ?auto_2420492 ) ) ( TRUCK-AT ?auto_2420493 ?auto_2420494 ) ( not ( = ?auto_2420494 ?auto_2420497 ) ) ( HOIST-AT ?auto_2420495 ?auto_2420494 ) ( LIFTING ?auto_2420495 ?auto_2420492 ) ( not ( = ?auto_2420496 ?auto_2420495 ) ) ( ON ?auto_2420482 ?auto_2420481 ) ( ON ?auto_2420483 ?auto_2420482 ) ( ON ?auto_2420484 ?auto_2420483 ) ( ON ?auto_2420485 ?auto_2420484 ) ( ON ?auto_2420486 ?auto_2420485 ) ( ON ?auto_2420487 ?auto_2420486 ) ( ON ?auto_2420488 ?auto_2420487 ) ( ON ?auto_2420489 ?auto_2420488 ) ( ON ?auto_2420490 ?auto_2420489 ) ( not ( = ?auto_2420481 ?auto_2420482 ) ) ( not ( = ?auto_2420481 ?auto_2420483 ) ) ( not ( = ?auto_2420481 ?auto_2420484 ) ) ( not ( = ?auto_2420481 ?auto_2420485 ) ) ( not ( = ?auto_2420481 ?auto_2420486 ) ) ( not ( = ?auto_2420481 ?auto_2420487 ) ) ( not ( = ?auto_2420481 ?auto_2420488 ) ) ( not ( = ?auto_2420481 ?auto_2420489 ) ) ( not ( = ?auto_2420481 ?auto_2420490 ) ) ( not ( = ?auto_2420481 ?auto_2420491 ) ) ( not ( = ?auto_2420481 ?auto_2420492 ) ) ( not ( = ?auto_2420482 ?auto_2420483 ) ) ( not ( = ?auto_2420482 ?auto_2420484 ) ) ( not ( = ?auto_2420482 ?auto_2420485 ) ) ( not ( = ?auto_2420482 ?auto_2420486 ) ) ( not ( = ?auto_2420482 ?auto_2420487 ) ) ( not ( = ?auto_2420482 ?auto_2420488 ) ) ( not ( = ?auto_2420482 ?auto_2420489 ) ) ( not ( = ?auto_2420482 ?auto_2420490 ) ) ( not ( = ?auto_2420482 ?auto_2420491 ) ) ( not ( = ?auto_2420482 ?auto_2420492 ) ) ( not ( = ?auto_2420483 ?auto_2420484 ) ) ( not ( = ?auto_2420483 ?auto_2420485 ) ) ( not ( = ?auto_2420483 ?auto_2420486 ) ) ( not ( = ?auto_2420483 ?auto_2420487 ) ) ( not ( = ?auto_2420483 ?auto_2420488 ) ) ( not ( = ?auto_2420483 ?auto_2420489 ) ) ( not ( = ?auto_2420483 ?auto_2420490 ) ) ( not ( = ?auto_2420483 ?auto_2420491 ) ) ( not ( = ?auto_2420483 ?auto_2420492 ) ) ( not ( = ?auto_2420484 ?auto_2420485 ) ) ( not ( = ?auto_2420484 ?auto_2420486 ) ) ( not ( = ?auto_2420484 ?auto_2420487 ) ) ( not ( = ?auto_2420484 ?auto_2420488 ) ) ( not ( = ?auto_2420484 ?auto_2420489 ) ) ( not ( = ?auto_2420484 ?auto_2420490 ) ) ( not ( = ?auto_2420484 ?auto_2420491 ) ) ( not ( = ?auto_2420484 ?auto_2420492 ) ) ( not ( = ?auto_2420485 ?auto_2420486 ) ) ( not ( = ?auto_2420485 ?auto_2420487 ) ) ( not ( = ?auto_2420485 ?auto_2420488 ) ) ( not ( = ?auto_2420485 ?auto_2420489 ) ) ( not ( = ?auto_2420485 ?auto_2420490 ) ) ( not ( = ?auto_2420485 ?auto_2420491 ) ) ( not ( = ?auto_2420485 ?auto_2420492 ) ) ( not ( = ?auto_2420486 ?auto_2420487 ) ) ( not ( = ?auto_2420486 ?auto_2420488 ) ) ( not ( = ?auto_2420486 ?auto_2420489 ) ) ( not ( = ?auto_2420486 ?auto_2420490 ) ) ( not ( = ?auto_2420486 ?auto_2420491 ) ) ( not ( = ?auto_2420486 ?auto_2420492 ) ) ( not ( = ?auto_2420487 ?auto_2420488 ) ) ( not ( = ?auto_2420487 ?auto_2420489 ) ) ( not ( = ?auto_2420487 ?auto_2420490 ) ) ( not ( = ?auto_2420487 ?auto_2420491 ) ) ( not ( = ?auto_2420487 ?auto_2420492 ) ) ( not ( = ?auto_2420488 ?auto_2420489 ) ) ( not ( = ?auto_2420488 ?auto_2420490 ) ) ( not ( = ?auto_2420488 ?auto_2420491 ) ) ( not ( = ?auto_2420488 ?auto_2420492 ) ) ( not ( = ?auto_2420489 ?auto_2420490 ) ) ( not ( = ?auto_2420489 ?auto_2420491 ) ) ( not ( = ?auto_2420489 ?auto_2420492 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2420490 ?auto_2420491 ?auto_2420492 )
      ( MAKE-11CRATE-VERIFY ?auto_2420481 ?auto_2420482 ?auto_2420483 ?auto_2420484 ?auto_2420485 ?auto_2420486 ?auto_2420487 ?auto_2420488 ?auto_2420489 ?auto_2420490 ?auto_2420491 ?auto_2420492 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2420624 - SURFACE
      ?auto_2420625 - SURFACE
      ?auto_2420626 - SURFACE
      ?auto_2420627 - SURFACE
      ?auto_2420628 - SURFACE
      ?auto_2420629 - SURFACE
      ?auto_2420630 - SURFACE
      ?auto_2420631 - SURFACE
      ?auto_2420632 - SURFACE
      ?auto_2420633 - SURFACE
      ?auto_2420634 - SURFACE
      ?auto_2420635 - SURFACE
    )
    :vars
    (
      ?auto_2420637 - HOIST
      ?auto_2420636 - PLACE
      ?auto_2420641 - TRUCK
      ?auto_2420639 - PLACE
      ?auto_2420638 - HOIST
      ?auto_2420640 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2420637 ?auto_2420636 ) ( SURFACE-AT ?auto_2420634 ?auto_2420636 ) ( CLEAR ?auto_2420634 ) ( IS-CRATE ?auto_2420635 ) ( not ( = ?auto_2420634 ?auto_2420635 ) ) ( AVAILABLE ?auto_2420637 ) ( ON ?auto_2420634 ?auto_2420633 ) ( not ( = ?auto_2420633 ?auto_2420634 ) ) ( not ( = ?auto_2420633 ?auto_2420635 ) ) ( TRUCK-AT ?auto_2420641 ?auto_2420639 ) ( not ( = ?auto_2420639 ?auto_2420636 ) ) ( HOIST-AT ?auto_2420638 ?auto_2420639 ) ( not ( = ?auto_2420637 ?auto_2420638 ) ) ( AVAILABLE ?auto_2420638 ) ( SURFACE-AT ?auto_2420635 ?auto_2420639 ) ( ON ?auto_2420635 ?auto_2420640 ) ( CLEAR ?auto_2420635 ) ( not ( = ?auto_2420634 ?auto_2420640 ) ) ( not ( = ?auto_2420635 ?auto_2420640 ) ) ( not ( = ?auto_2420633 ?auto_2420640 ) ) ( ON ?auto_2420625 ?auto_2420624 ) ( ON ?auto_2420626 ?auto_2420625 ) ( ON ?auto_2420627 ?auto_2420626 ) ( ON ?auto_2420628 ?auto_2420627 ) ( ON ?auto_2420629 ?auto_2420628 ) ( ON ?auto_2420630 ?auto_2420629 ) ( ON ?auto_2420631 ?auto_2420630 ) ( ON ?auto_2420632 ?auto_2420631 ) ( ON ?auto_2420633 ?auto_2420632 ) ( not ( = ?auto_2420624 ?auto_2420625 ) ) ( not ( = ?auto_2420624 ?auto_2420626 ) ) ( not ( = ?auto_2420624 ?auto_2420627 ) ) ( not ( = ?auto_2420624 ?auto_2420628 ) ) ( not ( = ?auto_2420624 ?auto_2420629 ) ) ( not ( = ?auto_2420624 ?auto_2420630 ) ) ( not ( = ?auto_2420624 ?auto_2420631 ) ) ( not ( = ?auto_2420624 ?auto_2420632 ) ) ( not ( = ?auto_2420624 ?auto_2420633 ) ) ( not ( = ?auto_2420624 ?auto_2420634 ) ) ( not ( = ?auto_2420624 ?auto_2420635 ) ) ( not ( = ?auto_2420624 ?auto_2420640 ) ) ( not ( = ?auto_2420625 ?auto_2420626 ) ) ( not ( = ?auto_2420625 ?auto_2420627 ) ) ( not ( = ?auto_2420625 ?auto_2420628 ) ) ( not ( = ?auto_2420625 ?auto_2420629 ) ) ( not ( = ?auto_2420625 ?auto_2420630 ) ) ( not ( = ?auto_2420625 ?auto_2420631 ) ) ( not ( = ?auto_2420625 ?auto_2420632 ) ) ( not ( = ?auto_2420625 ?auto_2420633 ) ) ( not ( = ?auto_2420625 ?auto_2420634 ) ) ( not ( = ?auto_2420625 ?auto_2420635 ) ) ( not ( = ?auto_2420625 ?auto_2420640 ) ) ( not ( = ?auto_2420626 ?auto_2420627 ) ) ( not ( = ?auto_2420626 ?auto_2420628 ) ) ( not ( = ?auto_2420626 ?auto_2420629 ) ) ( not ( = ?auto_2420626 ?auto_2420630 ) ) ( not ( = ?auto_2420626 ?auto_2420631 ) ) ( not ( = ?auto_2420626 ?auto_2420632 ) ) ( not ( = ?auto_2420626 ?auto_2420633 ) ) ( not ( = ?auto_2420626 ?auto_2420634 ) ) ( not ( = ?auto_2420626 ?auto_2420635 ) ) ( not ( = ?auto_2420626 ?auto_2420640 ) ) ( not ( = ?auto_2420627 ?auto_2420628 ) ) ( not ( = ?auto_2420627 ?auto_2420629 ) ) ( not ( = ?auto_2420627 ?auto_2420630 ) ) ( not ( = ?auto_2420627 ?auto_2420631 ) ) ( not ( = ?auto_2420627 ?auto_2420632 ) ) ( not ( = ?auto_2420627 ?auto_2420633 ) ) ( not ( = ?auto_2420627 ?auto_2420634 ) ) ( not ( = ?auto_2420627 ?auto_2420635 ) ) ( not ( = ?auto_2420627 ?auto_2420640 ) ) ( not ( = ?auto_2420628 ?auto_2420629 ) ) ( not ( = ?auto_2420628 ?auto_2420630 ) ) ( not ( = ?auto_2420628 ?auto_2420631 ) ) ( not ( = ?auto_2420628 ?auto_2420632 ) ) ( not ( = ?auto_2420628 ?auto_2420633 ) ) ( not ( = ?auto_2420628 ?auto_2420634 ) ) ( not ( = ?auto_2420628 ?auto_2420635 ) ) ( not ( = ?auto_2420628 ?auto_2420640 ) ) ( not ( = ?auto_2420629 ?auto_2420630 ) ) ( not ( = ?auto_2420629 ?auto_2420631 ) ) ( not ( = ?auto_2420629 ?auto_2420632 ) ) ( not ( = ?auto_2420629 ?auto_2420633 ) ) ( not ( = ?auto_2420629 ?auto_2420634 ) ) ( not ( = ?auto_2420629 ?auto_2420635 ) ) ( not ( = ?auto_2420629 ?auto_2420640 ) ) ( not ( = ?auto_2420630 ?auto_2420631 ) ) ( not ( = ?auto_2420630 ?auto_2420632 ) ) ( not ( = ?auto_2420630 ?auto_2420633 ) ) ( not ( = ?auto_2420630 ?auto_2420634 ) ) ( not ( = ?auto_2420630 ?auto_2420635 ) ) ( not ( = ?auto_2420630 ?auto_2420640 ) ) ( not ( = ?auto_2420631 ?auto_2420632 ) ) ( not ( = ?auto_2420631 ?auto_2420633 ) ) ( not ( = ?auto_2420631 ?auto_2420634 ) ) ( not ( = ?auto_2420631 ?auto_2420635 ) ) ( not ( = ?auto_2420631 ?auto_2420640 ) ) ( not ( = ?auto_2420632 ?auto_2420633 ) ) ( not ( = ?auto_2420632 ?auto_2420634 ) ) ( not ( = ?auto_2420632 ?auto_2420635 ) ) ( not ( = ?auto_2420632 ?auto_2420640 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2420633 ?auto_2420634 ?auto_2420635 )
      ( MAKE-11CRATE-VERIFY ?auto_2420624 ?auto_2420625 ?auto_2420626 ?auto_2420627 ?auto_2420628 ?auto_2420629 ?auto_2420630 ?auto_2420631 ?auto_2420632 ?auto_2420633 ?auto_2420634 ?auto_2420635 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2420768 - SURFACE
      ?auto_2420769 - SURFACE
      ?auto_2420770 - SURFACE
      ?auto_2420771 - SURFACE
      ?auto_2420772 - SURFACE
      ?auto_2420773 - SURFACE
      ?auto_2420774 - SURFACE
      ?auto_2420775 - SURFACE
      ?auto_2420776 - SURFACE
      ?auto_2420777 - SURFACE
      ?auto_2420778 - SURFACE
      ?auto_2420779 - SURFACE
    )
    :vars
    (
      ?auto_2420782 - HOIST
      ?auto_2420784 - PLACE
      ?auto_2420781 - PLACE
      ?auto_2420785 - HOIST
      ?auto_2420783 - SURFACE
      ?auto_2420780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2420782 ?auto_2420784 ) ( SURFACE-AT ?auto_2420778 ?auto_2420784 ) ( CLEAR ?auto_2420778 ) ( IS-CRATE ?auto_2420779 ) ( not ( = ?auto_2420778 ?auto_2420779 ) ) ( AVAILABLE ?auto_2420782 ) ( ON ?auto_2420778 ?auto_2420777 ) ( not ( = ?auto_2420777 ?auto_2420778 ) ) ( not ( = ?auto_2420777 ?auto_2420779 ) ) ( not ( = ?auto_2420781 ?auto_2420784 ) ) ( HOIST-AT ?auto_2420785 ?auto_2420781 ) ( not ( = ?auto_2420782 ?auto_2420785 ) ) ( AVAILABLE ?auto_2420785 ) ( SURFACE-AT ?auto_2420779 ?auto_2420781 ) ( ON ?auto_2420779 ?auto_2420783 ) ( CLEAR ?auto_2420779 ) ( not ( = ?auto_2420778 ?auto_2420783 ) ) ( not ( = ?auto_2420779 ?auto_2420783 ) ) ( not ( = ?auto_2420777 ?auto_2420783 ) ) ( TRUCK-AT ?auto_2420780 ?auto_2420784 ) ( ON ?auto_2420769 ?auto_2420768 ) ( ON ?auto_2420770 ?auto_2420769 ) ( ON ?auto_2420771 ?auto_2420770 ) ( ON ?auto_2420772 ?auto_2420771 ) ( ON ?auto_2420773 ?auto_2420772 ) ( ON ?auto_2420774 ?auto_2420773 ) ( ON ?auto_2420775 ?auto_2420774 ) ( ON ?auto_2420776 ?auto_2420775 ) ( ON ?auto_2420777 ?auto_2420776 ) ( not ( = ?auto_2420768 ?auto_2420769 ) ) ( not ( = ?auto_2420768 ?auto_2420770 ) ) ( not ( = ?auto_2420768 ?auto_2420771 ) ) ( not ( = ?auto_2420768 ?auto_2420772 ) ) ( not ( = ?auto_2420768 ?auto_2420773 ) ) ( not ( = ?auto_2420768 ?auto_2420774 ) ) ( not ( = ?auto_2420768 ?auto_2420775 ) ) ( not ( = ?auto_2420768 ?auto_2420776 ) ) ( not ( = ?auto_2420768 ?auto_2420777 ) ) ( not ( = ?auto_2420768 ?auto_2420778 ) ) ( not ( = ?auto_2420768 ?auto_2420779 ) ) ( not ( = ?auto_2420768 ?auto_2420783 ) ) ( not ( = ?auto_2420769 ?auto_2420770 ) ) ( not ( = ?auto_2420769 ?auto_2420771 ) ) ( not ( = ?auto_2420769 ?auto_2420772 ) ) ( not ( = ?auto_2420769 ?auto_2420773 ) ) ( not ( = ?auto_2420769 ?auto_2420774 ) ) ( not ( = ?auto_2420769 ?auto_2420775 ) ) ( not ( = ?auto_2420769 ?auto_2420776 ) ) ( not ( = ?auto_2420769 ?auto_2420777 ) ) ( not ( = ?auto_2420769 ?auto_2420778 ) ) ( not ( = ?auto_2420769 ?auto_2420779 ) ) ( not ( = ?auto_2420769 ?auto_2420783 ) ) ( not ( = ?auto_2420770 ?auto_2420771 ) ) ( not ( = ?auto_2420770 ?auto_2420772 ) ) ( not ( = ?auto_2420770 ?auto_2420773 ) ) ( not ( = ?auto_2420770 ?auto_2420774 ) ) ( not ( = ?auto_2420770 ?auto_2420775 ) ) ( not ( = ?auto_2420770 ?auto_2420776 ) ) ( not ( = ?auto_2420770 ?auto_2420777 ) ) ( not ( = ?auto_2420770 ?auto_2420778 ) ) ( not ( = ?auto_2420770 ?auto_2420779 ) ) ( not ( = ?auto_2420770 ?auto_2420783 ) ) ( not ( = ?auto_2420771 ?auto_2420772 ) ) ( not ( = ?auto_2420771 ?auto_2420773 ) ) ( not ( = ?auto_2420771 ?auto_2420774 ) ) ( not ( = ?auto_2420771 ?auto_2420775 ) ) ( not ( = ?auto_2420771 ?auto_2420776 ) ) ( not ( = ?auto_2420771 ?auto_2420777 ) ) ( not ( = ?auto_2420771 ?auto_2420778 ) ) ( not ( = ?auto_2420771 ?auto_2420779 ) ) ( not ( = ?auto_2420771 ?auto_2420783 ) ) ( not ( = ?auto_2420772 ?auto_2420773 ) ) ( not ( = ?auto_2420772 ?auto_2420774 ) ) ( not ( = ?auto_2420772 ?auto_2420775 ) ) ( not ( = ?auto_2420772 ?auto_2420776 ) ) ( not ( = ?auto_2420772 ?auto_2420777 ) ) ( not ( = ?auto_2420772 ?auto_2420778 ) ) ( not ( = ?auto_2420772 ?auto_2420779 ) ) ( not ( = ?auto_2420772 ?auto_2420783 ) ) ( not ( = ?auto_2420773 ?auto_2420774 ) ) ( not ( = ?auto_2420773 ?auto_2420775 ) ) ( not ( = ?auto_2420773 ?auto_2420776 ) ) ( not ( = ?auto_2420773 ?auto_2420777 ) ) ( not ( = ?auto_2420773 ?auto_2420778 ) ) ( not ( = ?auto_2420773 ?auto_2420779 ) ) ( not ( = ?auto_2420773 ?auto_2420783 ) ) ( not ( = ?auto_2420774 ?auto_2420775 ) ) ( not ( = ?auto_2420774 ?auto_2420776 ) ) ( not ( = ?auto_2420774 ?auto_2420777 ) ) ( not ( = ?auto_2420774 ?auto_2420778 ) ) ( not ( = ?auto_2420774 ?auto_2420779 ) ) ( not ( = ?auto_2420774 ?auto_2420783 ) ) ( not ( = ?auto_2420775 ?auto_2420776 ) ) ( not ( = ?auto_2420775 ?auto_2420777 ) ) ( not ( = ?auto_2420775 ?auto_2420778 ) ) ( not ( = ?auto_2420775 ?auto_2420779 ) ) ( not ( = ?auto_2420775 ?auto_2420783 ) ) ( not ( = ?auto_2420776 ?auto_2420777 ) ) ( not ( = ?auto_2420776 ?auto_2420778 ) ) ( not ( = ?auto_2420776 ?auto_2420779 ) ) ( not ( = ?auto_2420776 ?auto_2420783 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2420777 ?auto_2420778 ?auto_2420779 )
      ( MAKE-11CRATE-VERIFY ?auto_2420768 ?auto_2420769 ?auto_2420770 ?auto_2420771 ?auto_2420772 ?auto_2420773 ?auto_2420774 ?auto_2420775 ?auto_2420776 ?auto_2420777 ?auto_2420778 ?auto_2420779 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2420912 - SURFACE
      ?auto_2420913 - SURFACE
      ?auto_2420914 - SURFACE
      ?auto_2420915 - SURFACE
      ?auto_2420916 - SURFACE
      ?auto_2420917 - SURFACE
      ?auto_2420918 - SURFACE
      ?auto_2420919 - SURFACE
      ?auto_2420920 - SURFACE
      ?auto_2420921 - SURFACE
      ?auto_2420922 - SURFACE
      ?auto_2420923 - SURFACE
    )
    :vars
    (
      ?auto_2420929 - HOIST
      ?auto_2420928 - PLACE
      ?auto_2420927 - PLACE
      ?auto_2420925 - HOIST
      ?auto_2420926 - SURFACE
      ?auto_2420924 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2420929 ?auto_2420928 ) ( IS-CRATE ?auto_2420923 ) ( not ( = ?auto_2420922 ?auto_2420923 ) ) ( not ( = ?auto_2420921 ?auto_2420922 ) ) ( not ( = ?auto_2420921 ?auto_2420923 ) ) ( not ( = ?auto_2420927 ?auto_2420928 ) ) ( HOIST-AT ?auto_2420925 ?auto_2420927 ) ( not ( = ?auto_2420929 ?auto_2420925 ) ) ( AVAILABLE ?auto_2420925 ) ( SURFACE-AT ?auto_2420923 ?auto_2420927 ) ( ON ?auto_2420923 ?auto_2420926 ) ( CLEAR ?auto_2420923 ) ( not ( = ?auto_2420922 ?auto_2420926 ) ) ( not ( = ?auto_2420923 ?auto_2420926 ) ) ( not ( = ?auto_2420921 ?auto_2420926 ) ) ( TRUCK-AT ?auto_2420924 ?auto_2420928 ) ( SURFACE-AT ?auto_2420921 ?auto_2420928 ) ( CLEAR ?auto_2420921 ) ( LIFTING ?auto_2420929 ?auto_2420922 ) ( IS-CRATE ?auto_2420922 ) ( ON ?auto_2420913 ?auto_2420912 ) ( ON ?auto_2420914 ?auto_2420913 ) ( ON ?auto_2420915 ?auto_2420914 ) ( ON ?auto_2420916 ?auto_2420915 ) ( ON ?auto_2420917 ?auto_2420916 ) ( ON ?auto_2420918 ?auto_2420917 ) ( ON ?auto_2420919 ?auto_2420918 ) ( ON ?auto_2420920 ?auto_2420919 ) ( ON ?auto_2420921 ?auto_2420920 ) ( not ( = ?auto_2420912 ?auto_2420913 ) ) ( not ( = ?auto_2420912 ?auto_2420914 ) ) ( not ( = ?auto_2420912 ?auto_2420915 ) ) ( not ( = ?auto_2420912 ?auto_2420916 ) ) ( not ( = ?auto_2420912 ?auto_2420917 ) ) ( not ( = ?auto_2420912 ?auto_2420918 ) ) ( not ( = ?auto_2420912 ?auto_2420919 ) ) ( not ( = ?auto_2420912 ?auto_2420920 ) ) ( not ( = ?auto_2420912 ?auto_2420921 ) ) ( not ( = ?auto_2420912 ?auto_2420922 ) ) ( not ( = ?auto_2420912 ?auto_2420923 ) ) ( not ( = ?auto_2420912 ?auto_2420926 ) ) ( not ( = ?auto_2420913 ?auto_2420914 ) ) ( not ( = ?auto_2420913 ?auto_2420915 ) ) ( not ( = ?auto_2420913 ?auto_2420916 ) ) ( not ( = ?auto_2420913 ?auto_2420917 ) ) ( not ( = ?auto_2420913 ?auto_2420918 ) ) ( not ( = ?auto_2420913 ?auto_2420919 ) ) ( not ( = ?auto_2420913 ?auto_2420920 ) ) ( not ( = ?auto_2420913 ?auto_2420921 ) ) ( not ( = ?auto_2420913 ?auto_2420922 ) ) ( not ( = ?auto_2420913 ?auto_2420923 ) ) ( not ( = ?auto_2420913 ?auto_2420926 ) ) ( not ( = ?auto_2420914 ?auto_2420915 ) ) ( not ( = ?auto_2420914 ?auto_2420916 ) ) ( not ( = ?auto_2420914 ?auto_2420917 ) ) ( not ( = ?auto_2420914 ?auto_2420918 ) ) ( not ( = ?auto_2420914 ?auto_2420919 ) ) ( not ( = ?auto_2420914 ?auto_2420920 ) ) ( not ( = ?auto_2420914 ?auto_2420921 ) ) ( not ( = ?auto_2420914 ?auto_2420922 ) ) ( not ( = ?auto_2420914 ?auto_2420923 ) ) ( not ( = ?auto_2420914 ?auto_2420926 ) ) ( not ( = ?auto_2420915 ?auto_2420916 ) ) ( not ( = ?auto_2420915 ?auto_2420917 ) ) ( not ( = ?auto_2420915 ?auto_2420918 ) ) ( not ( = ?auto_2420915 ?auto_2420919 ) ) ( not ( = ?auto_2420915 ?auto_2420920 ) ) ( not ( = ?auto_2420915 ?auto_2420921 ) ) ( not ( = ?auto_2420915 ?auto_2420922 ) ) ( not ( = ?auto_2420915 ?auto_2420923 ) ) ( not ( = ?auto_2420915 ?auto_2420926 ) ) ( not ( = ?auto_2420916 ?auto_2420917 ) ) ( not ( = ?auto_2420916 ?auto_2420918 ) ) ( not ( = ?auto_2420916 ?auto_2420919 ) ) ( not ( = ?auto_2420916 ?auto_2420920 ) ) ( not ( = ?auto_2420916 ?auto_2420921 ) ) ( not ( = ?auto_2420916 ?auto_2420922 ) ) ( not ( = ?auto_2420916 ?auto_2420923 ) ) ( not ( = ?auto_2420916 ?auto_2420926 ) ) ( not ( = ?auto_2420917 ?auto_2420918 ) ) ( not ( = ?auto_2420917 ?auto_2420919 ) ) ( not ( = ?auto_2420917 ?auto_2420920 ) ) ( not ( = ?auto_2420917 ?auto_2420921 ) ) ( not ( = ?auto_2420917 ?auto_2420922 ) ) ( not ( = ?auto_2420917 ?auto_2420923 ) ) ( not ( = ?auto_2420917 ?auto_2420926 ) ) ( not ( = ?auto_2420918 ?auto_2420919 ) ) ( not ( = ?auto_2420918 ?auto_2420920 ) ) ( not ( = ?auto_2420918 ?auto_2420921 ) ) ( not ( = ?auto_2420918 ?auto_2420922 ) ) ( not ( = ?auto_2420918 ?auto_2420923 ) ) ( not ( = ?auto_2420918 ?auto_2420926 ) ) ( not ( = ?auto_2420919 ?auto_2420920 ) ) ( not ( = ?auto_2420919 ?auto_2420921 ) ) ( not ( = ?auto_2420919 ?auto_2420922 ) ) ( not ( = ?auto_2420919 ?auto_2420923 ) ) ( not ( = ?auto_2420919 ?auto_2420926 ) ) ( not ( = ?auto_2420920 ?auto_2420921 ) ) ( not ( = ?auto_2420920 ?auto_2420922 ) ) ( not ( = ?auto_2420920 ?auto_2420923 ) ) ( not ( = ?auto_2420920 ?auto_2420926 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2420921 ?auto_2420922 ?auto_2420923 )
      ( MAKE-11CRATE-VERIFY ?auto_2420912 ?auto_2420913 ?auto_2420914 ?auto_2420915 ?auto_2420916 ?auto_2420917 ?auto_2420918 ?auto_2420919 ?auto_2420920 ?auto_2420921 ?auto_2420922 ?auto_2420923 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2421056 - SURFACE
      ?auto_2421057 - SURFACE
      ?auto_2421058 - SURFACE
      ?auto_2421059 - SURFACE
      ?auto_2421060 - SURFACE
      ?auto_2421061 - SURFACE
      ?auto_2421062 - SURFACE
      ?auto_2421063 - SURFACE
      ?auto_2421064 - SURFACE
      ?auto_2421065 - SURFACE
      ?auto_2421066 - SURFACE
      ?auto_2421067 - SURFACE
    )
    :vars
    (
      ?auto_2421070 - HOIST
      ?auto_2421071 - PLACE
      ?auto_2421069 - PLACE
      ?auto_2421073 - HOIST
      ?auto_2421068 - SURFACE
      ?auto_2421072 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421070 ?auto_2421071 ) ( IS-CRATE ?auto_2421067 ) ( not ( = ?auto_2421066 ?auto_2421067 ) ) ( not ( = ?auto_2421065 ?auto_2421066 ) ) ( not ( = ?auto_2421065 ?auto_2421067 ) ) ( not ( = ?auto_2421069 ?auto_2421071 ) ) ( HOIST-AT ?auto_2421073 ?auto_2421069 ) ( not ( = ?auto_2421070 ?auto_2421073 ) ) ( AVAILABLE ?auto_2421073 ) ( SURFACE-AT ?auto_2421067 ?auto_2421069 ) ( ON ?auto_2421067 ?auto_2421068 ) ( CLEAR ?auto_2421067 ) ( not ( = ?auto_2421066 ?auto_2421068 ) ) ( not ( = ?auto_2421067 ?auto_2421068 ) ) ( not ( = ?auto_2421065 ?auto_2421068 ) ) ( TRUCK-AT ?auto_2421072 ?auto_2421071 ) ( SURFACE-AT ?auto_2421065 ?auto_2421071 ) ( CLEAR ?auto_2421065 ) ( IS-CRATE ?auto_2421066 ) ( AVAILABLE ?auto_2421070 ) ( IN ?auto_2421066 ?auto_2421072 ) ( ON ?auto_2421057 ?auto_2421056 ) ( ON ?auto_2421058 ?auto_2421057 ) ( ON ?auto_2421059 ?auto_2421058 ) ( ON ?auto_2421060 ?auto_2421059 ) ( ON ?auto_2421061 ?auto_2421060 ) ( ON ?auto_2421062 ?auto_2421061 ) ( ON ?auto_2421063 ?auto_2421062 ) ( ON ?auto_2421064 ?auto_2421063 ) ( ON ?auto_2421065 ?auto_2421064 ) ( not ( = ?auto_2421056 ?auto_2421057 ) ) ( not ( = ?auto_2421056 ?auto_2421058 ) ) ( not ( = ?auto_2421056 ?auto_2421059 ) ) ( not ( = ?auto_2421056 ?auto_2421060 ) ) ( not ( = ?auto_2421056 ?auto_2421061 ) ) ( not ( = ?auto_2421056 ?auto_2421062 ) ) ( not ( = ?auto_2421056 ?auto_2421063 ) ) ( not ( = ?auto_2421056 ?auto_2421064 ) ) ( not ( = ?auto_2421056 ?auto_2421065 ) ) ( not ( = ?auto_2421056 ?auto_2421066 ) ) ( not ( = ?auto_2421056 ?auto_2421067 ) ) ( not ( = ?auto_2421056 ?auto_2421068 ) ) ( not ( = ?auto_2421057 ?auto_2421058 ) ) ( not ( = ?auto_2421057 ?auto_2421059 ) ) ( not ( = ?auto_2421057 ?auto_2421060 ) ) ( not ( = ?auto_2421057 ?auto_2421061 ) ) ( not ( = ?auto_2421057 ?auto_2421062 ) ) ( not ( = ?auto_2421057 ?auto_2421063 ) ) ( not ( = ?auto_2421057 ?auto_2421064 ) ) ( not ( = ?auto_2421057 ?auto_2421065 ) ) ( not ( = ?auto_2421057 ?auto_2421066 ) ) ( not ( = ?auto_2421057 ?auto_2421067 ) ) ( not ( = ?auto_2421057 ?auto_2421068 ) ) ( not ( = ?auto_2421058 ?auto_2421059 ) ) ( not ( = ?auto_2421058 ?auto_2421060 ) ) ( not ( = ?auto_2421058 ?auto_2421061 ) ) ( not ( = ?auto_2421058 ?auto_2421062 ) ) ( not ( = ?auto_2421058 ?auto_2421063 ) ) ( not ( = ?auto_2421058 ?auto_2421064 ) ) ( not ( = ?auto_2421058 ?auto_2421065 ) ) ( not ( = ?auto_2421058 ?auto_2421066 ) ) ( not ( = ?auto_2421058 ?auto_2421067 ) ) ( not ( = ?auto_2421058 ?auto_2421068 ) ) ( not ( = ?auto_2421059 ?auto_2421060 ) ) ( not ( = ?auto_2421059 ?auto_2421061 ) ) ( not ( = ?auto_2421059 ?auto_2421062 ) ) ( not ( = ?auto_2421059 ?auto_2421063 ) ) ( not ( = ?auto_2421059 ?auto_2421064 ) ) ( not ( = ?auto_2421059 ?auto_2421065 ) ) ( not ( = ?auto_2421059 ?auto_2421066 ) ) ( not ( = ?auto_2421059 ?auto_2421067 ) ) ( not ( = ?auto_2421059 ?auto_2421068 ) ) ( not ( = ?auto_2421060 ?auto_2421061 ) ) ( not ( = ?auto_2421060 ?auto_2421062 ) ) ( not ( = ?auto_2421060 ?auto_2421063 ) ) ( not ( = ?auto_2421060 ?auto_2421064 ) ) ( not ( = ?auto_2421060 ?auto_2421065 ) ) ( not ( = ?auto_2421060 ?auto_2421066 ) ) ( not ( = ?auto_2421060 ?auto_2421067 ) ) ( not ( = ?auto_2421060 ?auto_2421068 ) ) ( not ( = ?auto_2421061 ?auto_2421062 ) ) ( not ( = ?auto_2421061 ?auto_2421063 ) ) ( not ( = ?auto_2421061 ?auto_2421064 ) ) ( not ( = ?auto_2421061 ?auto_2421065 ) ) ( not ( = ?auto_2421061 ?auto_2421066 ) ) ( not ( = ?auto_2421061 ?auto_2421067 ) ) ( not ( = ?auto_2421061 ?auto_2421068 ) ) ( not ( = ?auto_2421062 ?auto_2421063 ) ) ( not ( = ?auto_2421062 ?auto_2421064 ) ) ( not ( = ?auto_2421062 ?auto_2421065 ) ) ( not ( = ?auto_2421062 ?auto_2421066 ) ) ( not ( = ?auto_2421062 ?auto_2421067 ) ) ( not ( = ?auto_2421062 ?auto_2421068 ) ) ( not ( = ?auto_2421063 ?auto_2421064 ) ) ( not ( = ?auto_2421063 ?auto_2421065 ) ) ( not ( = ?auto_2421063 ?auto_2421066 ) ) ( not ( = ?auto_2421063 ?auto_2421067 ) ) ( not ( = ?auto_2421063 ?auto_2421068 ) ) ( not ( = ?auto_2421064 ?auto_2421065 ) ) ( not ( = ?auto_2421064 ?auto_2421066 ) ) ( not ( = ?auto_2421064 ?auto_2421067 ) ) ( not ( = ?auto_2421064 ?auto_2421068 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421065 ?auto_2421066 ?auto_2421067 )
      ( MAKE-11CRATE-VERIFY ?auto_2421056 ?auto_2421057 ?auto_2421058 ?auto_2421059 ?auto_2421060 ?auto_2421061 ?auto_2421062 ?auto_2421063 ?auto_2421064 ?auto_2421065 ?auto_2421066 ?auto_2421067 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2421074 - SURFACE
      ?auto_2421075 - SURFACE
    )
    :vars
    (
      ?auto_2421079 - HOIST
      ?auto_2421080 - PLACE
      ?auto_2421076 - SURFACE
      ?auto_2421078 - PLACE
      ?auto_2421082 - HOIST
      ?auto_2421077 - SURFACE
      ?auto_2421081 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421079 ?auto_2421080 ) ( IS-CRATE ?auto_2421075 ) ( not ( = ?auto_2421074 ?auto_2421075 ) ) ( not ( = ?auto_2421076 ?auto_2421074 ) ) ( not ( = ?auto_2421076 ?auto_2421075 ) ) ( not ( = ?auto_2421078 ?auto_2421080 ) ) ( HOIST-AT ?auto_2421082 ?auto_2421078 ) ( not ( = ?auto_2421079 ?auto_2421082 ) ) ( AVAILABLE ?auto_2421082 ) ( SURFACE-AT ?auto_2421075 ?auto_2421078 ) ( ON ?auto_2421075 ?auto_2421077 ) ( CLEAR ?auto_2421075 ) ( not ( = ?auto_2421074 ?auto_2421077 ) ) ( not ( = ?auto_2421075 ?auto_2421077 ) ) ( not ( = ?auto_2421076 ?auto_2421077 ) ) ( SURFACE-AT ?auto_2421076 ?auto_2421080 ) ( CLEAR ?auto_2421076 ) ( IS-CRATE ?auto_2421074 ) ( AVAILABLE ?auto_2421079 ) ( IN ?auto_2421074 ?auto_2421081 ) ( TRUCK-AT ?auto_2421081 ?auto_2421078 ) )
    :subtasks
    ( ( !DRIVE ?auto_2421081 ?auto_2421078 ?auto_2421080 )
      ( MAKE-2CRATE ?auto_2421076 ?auto_2421074 ?auto_2421075 )
      ( MAKE-1CRATE-VERIFY ?auto_2421074 ?auto_2421075 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2421083 - SURFACE
      ?auto_2421084 - SURFACE
      ?auto_2421085 - SURFACE
    )
    :vars
    (
      ?auto_2421090 - HOIST
      ?auto_2421086 - PLACE
      ?auto_2421089 - PLACE
      ?auto_2421088 - HOIST
      ?auto_2421091 - SURFACE
      ?auto_2421087 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421090 ?auto_2421086 ) ( IS-CRATE ?auto_2421085 ) ( not ( = ?auto_2421084 ?auto_2421085 ) ) ( not ( = ?auto_2421083 ?auto_2421084 ) ) ( not ( = ?auto_2421083 ?auto_2421085 ) ) ( not ( = ?auto_2421089 ?auto_2421086 ) ) ( HOIST-AT ?auto_2421088 ?auto_2421089 ) ( not ( = ?auto_2421090 ?auto_2421088 ) ) ( AVAILABLE ?auto_2421088 ) ( SURFACE-AT ?auto_2421085 ?auto_2421089 ) ( ON ?auto_2421085 ?auto_2421091 ) ( CLEAR ?auto_2421085 ) ( not ( = ?auto_2421084 ?auto_2421091 ) ) ( not ( = ?auto_2421085 ?auto_2421091 ) ) ( not ( = ?auto_2421083 ?auto_2421091 ) ) ( SURFACE-AT ?auto_2421083 ?auto_2421086 ) ( CLEAR ?auto_2421083 ) ( IS-CRATE ?auto_2421084 ) ( AVAILABLE ?auto_2421090 ) ( IN ?auto_2421084 ?auto_2421087 ) ( TRUCK-AT ?auto_2421087 ?auto_2421089 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2421084 ?auto_2421085 )
      ( MAKE-2CRATE-VERIFY ?auto_2421083 ?auto_2421084 ?auto_2421085 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2421092 - SURFACE
      ?auto_2421093 - SURFACE
      ?auto_2421094 - SURFACE
      ?auto_2421095 - SURFACE
    )
    :vars
    (
      ?auto_2421100 - HOIST
      ?auto_2421101 - PLACE
      ?auto_2421099 - PLACE
      ?auto_2421097 - HOIST
      ?auto_2421096 - SURFACE
      ?auto_2421098 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421100 ?auto_2421101 ) ( IS-CRATE ?auto_2421095 ) ( not ( = ?auto_2421094 ?auto_2421095 ) ) ( not ( = ?auto_2421093 ?auto_2421094 ) ) ( not ( = ?auto_2421093 ?auto_2421095 ) ) ( not ( = ?auto_2421099 ?auto_2421101 ) ) ( HOIST-AT ?auto_2421097 ?auto_2421099 ) ( not ( = ?auto_2421100 ?auto_2421097 ) ) ( AVAILABLE ?auto_2421097 ) ( SURFACE-AT ?auto_2421095 ?auto_2421099 ) ( ON ?auto_2421095 ?auto_2421096 ) ( CLEAR ?auto_2421095 ) ( not ( = ?auto_2421094 ?auto_2421096 ) ) ( not ( = ?auto_2421095 ?auto_2421096 ) ) ( not ( = ?auto_2421093 ?auto_2421096 ) ) ( SURFACE-AT ?auto_2421093 ?auto_2421101 ) ( CLEAR ?auto_2421093 ) ( IS-CRATE ?auto_2421094 ) ( AVAILABLE ?auto_2421100 ) ( IN ?auto_2421094 ?auto_2421098 ) ( TRUCK-AT ?auto_2421098 ?auto_2421099 ) ( ON ?auto_2421093 ?auto_2421092 ) ( not ( = ?auto_2421092 ?auto_2421093 ) ) ( not ( = ?auto_2421092 ?auto_2421094 ) ) ( not ( = ?auto_2421092 ?auto_2421095 ) ) ( not ( = ?auto_2421092 ?auto_2421096 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421093 ?auto_2421094 ?auto_2421095 )
      ( MAKE-3CRATE-VERIFY ?auto_2421092 ?auto_2421093 ?auto_2421094 ?auto_2421095 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2421102 - SURFACE
      ?auto_2421103 - SURFACE
      ?auto_2421104 - SURFACE
      ?auto_2421105 - SURFACE
      ?auto_2421106 - SURFACE
    )
    :vars
    (
      ?auto_2421111 - HOIST
      ?auto_2421112 - PLACE
      ?auto_2421110 - PLACE
      ?auto_2421108 - HOIST
      ?auto_2421107 - SURFACE
      ?auto_2421109 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421111 ?auto_2421112 ) ( IS-CRATE ?auto_2421106 ) ( not ( = ?auto_2421105 ?auto_2421106 ) ) ( not ( = ?auto_2421104 ?auto_2421105 ) ) ( not ( = ?auto_2421104 ?auto_2421106 ) ) ( not ( = ?auto_2421110 ?auto_2421112 ) ) ( HOIST-AT ?auto_2421108 ?auto_2421110 ) ( not ( = ?auto_2421111 ?auto_2421108 ) ) ( AVAILABLE ?auto_2421108 ) ( SURFACE-AT ?auto_2421106 ?auto_2421110 ) ( ON ?auto_2421106 ?auto_2421107 ) ( CLEAR ?auto_2421106 ) ( not ( = ?auto_2421105 ?auto_2421107 ) ) ( not ( = ?auto_2421106 ?auto_2421107 ) ) ( not ( = ?auto_2421104 ?auto_2421107 ) ) ( SURFACE-AT ?auto_2421104 ?auto_2421112 ) ( CLEAR ?auto_2421104 ) ( IS-CRATE ?auto_2421105 ) ( AVAILABLE ?auto_2421111 ) ( IN ?auto_2421105 ?auto_2421109 ) ( TRUCK-AT ?auto_2421109 ?auto_2421110 ) ( ON ?auto_2421103 ?auto_2421102 ) ( ON ?auto_2421104 ?auto_2421103 ) ( not ( = ?auto_2421102 ?auto_2421103 ) ) ( not ( = ?auto_2421102 ?auto_2421104 ) ) ( not ( = ?auto_2421102 ?auto_2421105 ) ) ( not ( = ?auto_2421102 ?auto_2421106 ) ) ( not ( = ?auto_2421102 ?auto_2421107 ) ) ( not ( = ?auto_2421103 ?auto_2421104 ) ) ( not ( = ?auto_2421103 ?auto_2421105 ) ) ( not ( = ?auto_2421103 ?auto_2421106 ) ) ( not ( = ?auto_2421103 ?auto_2421107 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421104 ?auto_2421105 ?auto_2421106 )
      ( MAKE-4CRATE-VERIFY ?auto_2421102 ?auto_2421103 ?auto_2421104 ?auto_2421105 ?auto_2421106 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2421113 - SURFACE
      ?auto_2421114 - SURFACE
      ?auto_2421115 - SURFACE
      ?auto_2421116 - SURFACE
      ?auto_2421117 - SURFACE
      ?auto_2421118 - SURFACE
    )
    :vars
    (
      ?auto_2421123 - HOIST
      ?auto_2421124 - PLACE
      ?auto_2421122 - PLACE
      ?auto_2421120 - HOIST
      ?auto_2421119 - SURFACE
      ?auto_2421121 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421123 ?auto_2421124 ) ( IS-CRATE ?auto_2421118 ) ( not ( = ?auto_2421117 ?auto_2421118 ) ) ( not ( = ?auto_2421116 ?auto_2421117 ) ) ( not ( = ?auto_2421116 ?auto_2421118 ) ) ( not ( = ?auto_2421122 ?auto_2421124 ) ) ( HOIST-AT ?auto_2421120 ?auto_2421122 ) ( not ( = ?auto_2421123 ?auto_2421120 ) ) ( AVAILABLE ?auto_2421120 ) ( SURFACE-AT ?auto_2421118 ?auto_2421122 ) ( ON ?auto_2421118 ?auto_2421119 ) ( CLEAR ?auto_2421118 ) ( not ( = ?auto_2421117 ?auto_2421119 ) ) ( not ( = ?auto_2421118 ?auto_2421119 ) ) ( not ( = ?auto_2421116 ?auto_2421119 ) ) ( SURFACE-AT ?auto_2421116 ?auto_2421124 ) ( CLEAR ?auto_2421116 ) ( IS-CRATE ?auto_2421117 ) ( AVAILABLE ?auto_2421123 ) ( IN ?auto_2421117 ?auto_2421121 ) ( TRUCK-AT ?auto_2421121 ?auto_2421122 ) ( ON ?auto_2421114 ?auto_2421113 ) ( ON ?auto_2421115 ?auto_2421114 ) ( ON ?auto_2421116 ?auto_2421115 ) ( not ( = ?auto_2421113 ?auto_2421114 ) ) ( not ( = ?auto_2421113 ?auto_2421115 ) ) ( not ( = ?auto_2421113 ?auto_2421116 ) ) ( not ( = ?auto_2421113 ?auto_2421117 ) ) ( not ( = ?auto_2421113 ?auto_2421118 ) ) ( not ( = ?auto_2421113 ?auto_2421119 ) ) ( not ( = ?auto_2421114 ?auto_2421115 ) ) ( not ( = ?auto_2421114 ?auto_2421116 ) ) ( not ( = ?auto_2421114 ?auto_2421117 ) ) ( not ( = ?auto_2421114 ?auto_2421118 ) ) ( not ( = ?auto_2421114 ?auto_2421119 ) ) ( not ( = ?auto_2421115 ?auto_2421116 ) ) ( not ( = ?auto_2421115 ?auto_2421117 ) ) ( not ( = ?auto_2421115 ?auto_2421118 ) ) ( not ( = ?auto_2421115 ?auto_2421119 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421116 ?auto_2421117 ?auto_2421118 )
      ( MAKE-5CRATE-VERIFY ?auto_2421113 ?auto_2421114 ?auto_2421115 ?auto_2421116 ?auto_2421117 ?auto_2421118 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2421125 - SURFACE
      ?auto_2421126 - SURFACE
      ?auto_2421127 - SURFACE
      ?auto_2421128 - SURFACE
      ?auto_2421129 - SURFACE
      ?auto_2421130 - SURFACE
      ?auto_2421131 - SURFACE
    )
    :vars
    (
      ?auto_2421136 - HOIST
      ?auto_2421137 - PLACE
      ?auto_2421135 - PLACE
      ?auto_2421133 - HOIST
      ?auto_2421132 - SURFACE
      ?auto_2421134 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421136 ?auto_2421137 ) ( IS-CRATE ?auto_2421131 ) ( not ( = ?auto_2421130 ?auto_2421131 ) ) ( not ( = ?auto_2421129 ?auto_2421130 ) ) ( not ( = ?auto_2421129 ?auto_2421131 ) ) ( not ( = ?auto_2421135 ?auto_2421137 ) ) ( HOIST-AT ?auto_2421133 ?auto_2421135 ) ( not ( = ?auto_2421136 ?auto_2421133 ) ) ( AVAILABLE ?auto_2421133 ) ( SURFACE-AT ?auto_2421131 ?auto_2421135 ) ( ON ?auto_2421131 ?auto_2421132 ) ( CLEAR ?auto_2421131 ) ( not ( = ?auto_2421130 ?auto_2421132 ) ) ( not ( = ?auto_2421131 ?auto_2421132 ) ) ( not ( = ?auto_2421129 ?auto_2421132 ) ) ( SURFACE-AT ?auto_2421129 ?auto_2421137 ) ( CLEAR ?auto_2421129 ) ( IS-CRATE ?auto_2421130 ) ( AVAILABLE ?auto_2421136 ) ( IN ?auto_2421130 ?auto_2421134 ) ( TRUCK-AT ?auto_2421134 ?auto_2421135 ) ( ON ?auto_2421126 ?auto_2421125 ) ( ON ?auto_2421127 ?auto_2421126 ) ( ON ?auto_2421128 ?auto_2421127 ) ( ON ?auto_2421129 ?auto_2421128 ) ( not ( = ?auto_2421125 ?auto_2421126 ) ) ( not ( = ?auto_2421125 ?auto_2421127 ) ) ( not ( = ?auto_2421125 ?auto_2421128 ) ) ( not ( = ?auto_2421125 ?auto_2421129 ) ) ( not ( = ?auto_2421125 ?auto_2421130 ) ) ( not ( = ?auto_2421125 ?auto_2421131 ) ) ( not ( = ?auto_2421125 ?auto_2421132 ) ) ( not ( = ?auto_2421126 ?auto_2421127 ) ) ( not ( = ?auto_2421126 ?auto_2421128 ) ) ( not ( = ?auto_2421126 ?auto_2421129 ) ) ( not ( = ?auto_2421126 ?auto_2421130 ) ) ( not ( = ?auto_2421126 ?auto_2421131 ) ) ( not ( = ?auto_2421126 ?auto_2421132 ) ) ( not ( = ?auto_2421127 ?auto_2421128 ) ) ( not ( = ?auto_2421127 ?auto_2421129 ) ) ( not ( = ?auto_2421127 ?auto_2421130 ) ) ( not ( = ?auto_2421127 ?auto_2421131 ) ) ( not ( = ?auto_2421127 ?auto_2421132 ) ) ( not ( = ?auto_2421128 ?auto_2421129 ) ) ( not ( = ?auto_2421128 ?auto_2421130 ) ) ( not ( = ?auto_2421128 ?auto_2421131 ) ) ( not ( = ?auto_2421128 ?auto_2421132 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421129 ?auto_2421130 ?auto_2421131 )
      ( MAKE-6CRATE-VERIFY ?auto_2421125 ?auto_2421126 ?auto_2421127 ?auto_2421128 ?auto_2421129 ?auto_2421130 ?auto_2421131 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2421138 - SURFACE
      ?auto_2421139 - SURFACE
      ?auto_2421140 - SURFACE
      ?auto_2421141 - SURFACE
      ?auto_2421142 - SURFACE
      ?auto_2421143 - SURFACE
      ?auto_2421144 - SURFACE
      ?auto_2421145 - SURFACE
    )
    :vars
    (
      ?auto_2421150 - HOIST
      ?auto_2421151 - PLACE
      ?auto_2421149 - PLACE
      ?auto_2421147 - HOIST
      ?auto_2421146 - SURFACE
      ?auto_2421148 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421150 ?auto_2421151 ) ( IS-CRATE ?auto_2421145 ) ( not ( = ?auto_2421144 ?auto_2421145 ) ) ( not ( = ?auto_2421143 ?auto_2421144 ) ) ( not ( = ?auto_2421143 ?auto_2421145 ) ) ( not ( = ?auto_2421149 ?auto_2421151 ) ) ( HOIST-AT ?auto_2421147 ?auto_2421149 ) ( not ( = ?auto_2421150 ?auto_2421147 ) ) ( AVAILABLE ?auto_2421147 ) ( SURFACE-AT ?auto_2421145 ?auto_2421149 ) ( ON ?auto_2421145 ?auto_2421146 ) ( CLEAR ?auto_2421145 ) ( not ( = ?auto_2421144 ?auto_2421146 ) ) ( not ( = ?auto_2421145 ?auto_2421146 ) ) ( not ( = ?auto_2421143 ?auto_2421146 ) ) ( SURFACE-AT ?auto_2421143 ?auto_2421151 ) ( CLEAR ?auto_2421143 ) ( IS-CRATE ?auto_2421144 ) ( AVAILABLE ?auto_2421150 ) ( IN ?auto_2421144 ?auto_2421148 ) ( TRUCK-AT ?auto_2421148 ?auto_2421149 ) ( ON ?auto_2421139 ?auto_2421138 ) ( ON ?auto_2421140 ?auto_2421139 ) ( ON ?auto_2421141 ?auto_2421140 ) ( ON ?auto_2421142 ?auto_2421141 ) ( ON ?auto_2421143 ?auto_2421142 ) ( not ( = ?auto_2421138 ?auto_2421139 ) ) ( not ( = ?auto_2421138 ?auto_2421140 ) ) ( not ( = ?auto_2421138 ?auto_2421141 ) ) ( not ( = ?auto_2421138 ?auto_2421142 ) ) ( not ( = ?auto_2421138 ?auto_2421143 ) ) ( not ( = ?auto_2421138 ?auto_2421144 ) ) ( not ( = ?auto_2421138 ?auto_2421145 ) ) ( not ( = ?auto_2421138 ?auto_2421146 ) ) ( not ( = ?auto_2421139 ?auto_2421140 ) ) ( not ( = ?auto_2421139 ?auto_2421141 ) ) ( not ( = ?auto_2421139 ?auto_2421142 ) ) ( not ( = ?auto_2421139 ?auto_2421143 ) ) ( not ( = ?auto_2421139 ?auto_2421144 ) ) ( not ( = ?auto_2421139 ?auto_2421145 ) ) ( not ( = ?auto_2421139 ?auto_2421146 ) ) ( not ( = ?auto_2421140 ?auto_2421141 ) ) ( not ( = ?auto_2421140 ?auto_2421142 ) ) ( not ( = ?auto_2421140 ?auto_2421143 ) ) ( not ( = ?auto_2421140 ?auto_2421144 ) ) ( not ( = ?auto_2421140 ?auto_2421145 ) ) ( not ( = ?auto_2421140 ?auto_2421146 ) ) ( not ( = ?auto_2421141 ?auto_2421142 ) ) ( not ( = ?auto_2421141 ?auto_2421143 ) ) ( not ( = ?auto_2421141 ?auto_2421144 ) ) ( not ( = ?auto_2421141 ?auto_2421145 ) ) ( not ( = ?auto_2421141 ?auto_2421146 ) ) ( not ( = ?auto_2421142 ?auto_2421143 ) ) ( not ( = ?auto_2421142 ?auto_2421144 ) ) ( not ( = ?auto_2421142 ?auto_2421145 ) ) ( not ( = ?auto_2421142 ?auto_2421146 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421143 ?auto_2421144 ?auto_2421145 )
      ( MAKE-7CRATE-VERIFY ?auto_2421138 ?auto_2421139 ?auto_2421140 ?auto_2421141 ?auto_2421142 ?auto_2421143 ?auto_2421144 ?auto_2421145 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2421152 - SURFACE
      ?auto_2421153 - SURFACE
      ?auto_2421154 - SURFACE
      ?auto_2421155 - SURFACE
      ?auto_2421156 - SURFACE
      ?auto_2421157 - SURFACE
      ?auto_2421158 - SURFACE
      ?auto_2421159 - SURFACE
      ?auto_2421160 - SURFACE
    )
    :vars
    (
      ?auto_2421165 - HOIST
      ?auto_2421166 - PLACE
      ?auto_2421164 - PLACE
      ?auto_2421162 - HOIST
      ?auto_2421161 - SURFACE
      ?auto_2421163 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421165 ?auto_2421166 ) ( IS-CRATE ?auto_2421160 ) ( not ( = ?auto_2421159 ?auto_2421160 ) ) ( not ( = ?auto_2421158 ?auto_2421159 ) ) ( not ( = ?auto_2421158 ?auto_2421160 ) ) ( not ( = ?auto_2421164 ?auto_2421166 ) ) ( HOIST-AT ?auto_2421162 ?auto_2421164 ) ( not ( = ?auto_2421165 ?auto_2421162 ) ) ( AVAILABLE ?auto_2421162 ) ( SURFACE-AT ?auto_2421160 ?auto_2421164 ) ( ON ?auto_2421160 ?auto_2421161 ) ( CLEAR ?auto_2421160 ) ( not ( = ?auto_2421159 ?auto_2421161 ) ) ( not ( = ?auto_2421160 ?auto_2421161 ) ) ( not ( = ?auto_2421158 ?auto_2421161 ) ) ( SURFACE-AT ?auto_2421158 ?auto_2421166 ) ( CLEAR ?auto_2421158 ) ( IS-CRATE ?auto_2421159 ) ( AVAILABLE ?auto_2421165 ) ( IN ?auto_2421159 ?auto_2421163 ) ( TRUCK-AT ?auto_2421163 ?auto_2421164 ) ( ON ?auto_2421153 ?auto_2421152 ) ( ON ?auto_2421154 ?auto_2421153 ) ( ON ?auto_2421155 ?auto_2421154 ) ( ON ?auto_2421156 ?auto_2421155 ) ( ON ?auto_2421157 ?auto_2421156 ) ( ON ?auto_2421158 ?auto_2421157 ) ( not ( = ?auto_2421152 ?auto_2421153 ) ) ( not ( = ?auto_2421152 ?auto_2421154 ) ) ( not ( = ?auto_2421152 ?auto_2421155 ) ) ( not ( = ?auto_2421152 ?auto_2421156 ) ) ( not ( = ?auto_2421152 ?auto_2421157 ) ) ( not ( = ?auto_2421152 ?auto_2421158 ) ) ( not ( = ?auto_2421152 ?auto_2421159 ) ) ( not ( = ?auto_2421152 ?auto_2421160 ) ) ( not ( = ?auto_2421152 ?auto_2421161 ) ) ( not ( = ?auto_2421153 ?auto_2421154 ) ) ( not ( = ?auto_2421153 ?auto_2421155 ) ) ( not ( = ?auto_2421153 ?auto_2421156 ) ) ( not ( = ?auto_2421153 ?auto_2421157 ) ) ( not ( = ?auto_2421153 ?auto_2421158 ) ) ( not ( = ?auto_2421153 ?auto_2421159 ) ) ( not ( = ?auto_2421153 ?auto_2421160 ) ) ( not ( = ?auto_2421153 ?auto_2421161 ) ) ( not ( = ?auto_2421154 ?auto_2421155 ) ) ( not ( = ?auto_2421154 ?auto_2421156 ) ) ( not ( = ?auto_2421154 ?auto_2421157 ) ) ( not ( = ?auto_2421154 ?auto_2421158 ) ) ( not ( = ?auto_2421154 ?auto_2421159 ) ) ( not ( = ?auto_2421154 ?auto_2421160 ) ) ( not ( = ?auto_2421154 ?auto_2421161 ) ) ( not ( = ?auto_2421155 ?auto_2421156 ) ) ( not ( = ?auto_2421155 ?auto_2421157 ) ) ( not ( = ?auto_2421155 ?auto_2421158 ) ) ( not ( = ?auto_2421155 ?auto_2421159 ) ) ( not ( = ?auto_2421155 ?auto_2421160 ) ) ( not ( = ?auto_2421155 ?auto_2421161 ) ) ( not ( = ?auto_2421156 ?auto_2421157 ) ) ( not ( = ?auto_2421156 ?auto_2421158 ) ) ( not ( = ?auto_2421156 ?auto_2421159 ) ) ( not ( = ?auto_2421156 ?auto_2421160 ) ) ( not ( = ?auto_2421156 ?auto_2421161 ) ) ( not ( = ?auto_2421157 ?auto_2421158 ) ) ( not ( = ?auto_2421157 ?auto_2421159 ) ) ( not ( = ?auto_2421157 ?auto_2421160 ) ) ( not ( = ?auto_2421157 ?auto_2421161 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421158 ?auto_2421159 ?auto_2421160 )
      ( MAKE-8CRATE-VERIFY ?auto_2421152 ?auto_2421153 ?auto_2421154 ?auto_2421155 ?auto_2421156 ?auto_2421157 ?auto_2421158 ?auto_2421159 ?auto_2421160 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2421167 - SURFACE
      ?auto_2421168 - SURFACE
      ?auto_2421169 - SURFACE
      ?auto_2421170 - SURFACE
      ?auto_2421171 - SURFACE
      ?auto_2421172 - SURFACE
      ?auto_2421173 - SURFACE
      ?auto_2421174 - SURFACE
      ?auto_2421175 - SURFACE
      ?auto_2421176 - SURFACE
    )
    :vars
    (
      ?auto_2421181 - HOIST
      ?auto_2421182 - PLACE
      ?auto_2421180 - PLACE
      ?auto_2421178 - HOIST
      ?auto_2421177 - SURFACE
      ?auto_2421179 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421181 ?auto_2421182 ) ( IS-CRATE ?auto_2421176 ) ( not ( = ?auto_2421175 ?auto_2421176 ) ) ( not ( = ?auto_2421174 ?auto_2421175 ) ) ( not ( = ?auto_2421174 ?auto_2421176 ) ) ( not ( = ?auto_2421180 ?auto_2421182 ) ) ( HOIST-AT ?auto_2421178 ?auto_2421180 ) ( not ( = ?auto_2421181 ?auto_2421178 ) ) ( AVAILABLE ?auto_2421178 ) ( SURFACE-AT ?auto_2421176 ?auto_2421180 ) ( ON ?auto_2421176 ?auto_2421177 ) ( CLEAR ?auto_2421176 ) ( not ( = ?auto_2421175 ?auto_2421177 ) ) ( not ( = ?auto_2421176 ?auto_2421177 ) ) ( not ( = ?auto_2421174 ?auto_2421177 ) ) ( SURFACE-AT ?auto_2421174 ?auto_2421182 ) ( CLEAR ?auto_2421174 ) ( IS-CRATE ?auto_2421175 ) ( AVAILABLE ?auto_2421181 ) ( IN ?auto_2421175 ?auto_2421179 ) ( TRUCK-AT ?auto_2421179 ?auto_2421180 ) ( ON ?auto_2421168 ?auto_2421167 ) ( ON ?auto_2421169 ?auto_2421168 ) ( ON ?auto_2421170 ?auto_2421169 ) ( ON ?auto_2421171 ?auto_2421170 ) ( ON ?auto_2421172 ?auto_2421171 ) ( ON ?auto_2421173 ?auto_2421172 ) ( ON ?auto_2421174 ?auto_2421173 ) ( not ( = ?auto_2421167 ?auto_2421168 ) ) ( not ( = ?auto_2421167 ?auto_2421169 ) ) ( not ( = ?auto_2421167 ?auto_2421170 ) ) ( not ( = ?auto_2421167 ?auto_2421171 ) ) ( not ( = ?auto_2421167 ?auto_2421172 ) ) ( not ( = ?auto_2421167 ?auto_2421173 ) ) ( not ( = ?auto_2421167 ?auto_2421174 ) ) ( not ( = ?auto_2421167 ?auto_2421175 ) ) ( not ( = ?auto_2421167 ?auto_2421176 ) ) ( not ( = ?auto_2421167 ?auto_2421177 ) ) ( not ( = ?auto_2421168 ?auto_2421169 ) ) ( not ( = ?auto_2421168 ?auto_2421170 ) ) ( not ( = ?auto_2421168 ?auto_2421171 ) ) ( not ( = ?auto_2421168 ?auto_2421172 ) ) ( not ( = ?auto_2421168 ?auto_2421173 ) ) ( not ( = ?auto_2421168 ?auto_2421174 ) ) ( not ( = ?auto_2421168 ?auto_2421175 ) ) ( not ( = ?auto_2421168 ?auto_2421176 ) ) ( not ( = ?auto_2421168 ?auto_2421177 ) ) ( not ( = ?auto_2421169 ?auto_2421170 ) ) ( not ( = ?auto_2421169 ?auto_2421171 ) ) ( not ( = ?auto_2421169 ?auto_2421172 ) ) ( not ( = ?auto_2421169 ?auto_2421173 ) ) ( not ( = ?auto_2421169 ?auto_2421174 ) ) ( not ( = ?auto_2421169 ?auto_2421175 ) ) ( not ( = ?auto_2421169 ?auto_2421176 ) ) ( not ( = ?auto_2421169 ?auto_2421177 ) ) ( not ( = ?auto_2421170 ?auto_2421171 ) ) ( not ( = ?auto_2421170 ?auto_2421172 ) ) ( not ( = ?auto_2421170 ?auto_2421173 ) ) ( not ( = ?auto_2421170 ?auto_2421174 ) ) ( not ( = ?auto_2421170 ?auto_2421175 ) ) ( not ( = ?auto_2421170 ?auto_2421176 ) ) ( not ( = ?auto_2421170 ?auto_2421177 ) ) ( not ( = ?auto_2421171 ?auto_2421172 ) ) ( not ( = ?auto_2421171 ?auto_2421173 ) ) ( not ( = ?auto_2421171 ?auto_2421174 ) ) ( not ( = ?auto_2421171 ?auto_2421175 ) ) ( not ( = ?auto_2421171 ?auto_2421176 ) ) ( not ( = ?auto_2421171 ?auto_2421177 ) ) ( not ( = ?auto_2421172 ?auto_2421173 ) ) ( not ( = ?auto_2421172 ?auto_2421174 ) ) ( not ( = ?auto_2421172 ?auto_2421175 ) ) ( not ( = ?auto_2421172 ?auto_2421176 ) ) ( not ( = ?auto_2421172 ?auto_2421177 ) ) ( not ( = ?auto_2421173 ?auto_2421174 ) ) ( not ( = ?auto_2421173 ?auto_2421175 ) ) ( not ( = ?auto_2421173 ?auto_2421176 ) ) ( not ( = ?auto_2421173 ?auto_2421177 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421174 ?auto_2421175 ?auto_2421176 )
      ( MAKE-9CRATE-VERIFY ?auto_2421167 ?auto_2421168 ?auto_2421169 ?auto_2421170 ?auto_2421171 ?auto_2421172 ?auto_2421173 ?auto_2421174 ?auto_2421175 ?auto_2421176 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2421183 - SURFACE
      ?auto_2421184 - SURFACE
      ?auto_2421185 - SURFACE
      ?auto_2421186 - SURFACE
      ?auto_2421187 - SURFACE
      ?auto_2421188 - SURFACE
      ?auto_2421189 - SURFACE
      ?auto_2421190 - SURFACE
      ?auto_2421191 - SURFACE
      ?auto_2421192 - SURFACE
      ?auto_2421193 - SURFACE
    )
    :vars
    (
      ?auto_2421198 - HOIST
      ?auto_2421199 - PLACE
      ?auto_2421197 - PLACE
      ?auto_2421195 - HOIST
      ?auto_2421194 - SURFACE
      ?auto_2421196 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421198 ?auto_2421199 ) ( IS-CRATE ?auto_2421193 ) ( not ( = ?auto_2421192 ?auto_2421193 ) ) ( not ( = ?auto_2421191 ?auto_2421192 ) ) ( not ( = ?auto_2421191 ?auto_2421193 ) ) ( not ( = ?auto_2421197 ?auto_2421199 ) ) ( HOIST-AT ?auto_2421195 ?auto_2421197 ) ( not ( = ?auto_2421198 ?auto_2421195 ) ) ( AVAILABLE ?auto_2421195 ) ( SURFACE-AT ?auto_2421193 ?auto_2421197 ) ( ON ?auto_2421193 ?auto_2421194 ) ( CLEAR ?auto_2421193 ) ( not ( = ?auto_2421192 ?auto_2421194 ) ) ( not ( = ?auto_2421193 ?auto_2421194 ) ) ( not ( = ?auto_2421191 ?auto_2421194 ) ) ( SURFACE-AT ?auto_2421191 ?auto_2421199 ) ( CLEAR ?auto_2421191 ) ( IS-CRATE ?auto_2421192 ) ( AVAILABLE ?auto_2421198 ) ( IN ?auto_2421192 ?auto_2421196 ) ( TRUCK-AT ?auto_2421196 ?auto_2421197 ) ( ON ?auto_2421184 ?auto_2421183 ) ( ON ?auto_2421185 ?auto_2421184 ) ( ON ?auto_2421186 ?auto_2421185 ) ( ON ?auto_2421187 ?auto_2421186 ) ( ON ?auto_2421188 ?auto_2421187 ) ( ON ?auto_2421189 ?auto_2421188 ) ( ON ?auto_2421190 ?auto_2421189 ) ( ON ?auto_2421191 ?auto_2421190 ) ( not ( = ?auto_2421183 ?auto_2421184 ) ) ( not ( = ?auto_2421183 ?auto_2421185 ) ) ( not ( = ?auto_2421183 ?auto_2421186 ) ) ( not ( = ?auto_2421183 ?auto_2421187 ) ) ( not ( = ?auto_2421183 ?auto_2421188 ) ) ( not ( = ?auto_2421183 ?auto_2421189 ) ) ( not ( = ?auto_2421183 ?auto_2421190 ) ) ( not ( = ?auto_2421183 ?auto_2421191 ) ) ( not ( = ?auto_2421183 ?auto_2421192 ) ) ( not ( = ?auto_2421183 ?auto_2421193 ) ) ( not ( = ?auto_2421183 ?auto_2421194 ) ) ( not ( = ?auto_2421184 ?auto_2421185 ) ) ( not ( = ?auto_2421184 ?auto_2421186 ) ) ( not ( = ?auto_2421184 ?auto_2421187 ) ) ( not ( = ?auto_2421184 ?auto_2421188 ) ) ( not ( = ?auto_2421184 ?auto_2421189 ) ) ( not ( = ?auto_2421184 ?auto_2421190 ) ) ( not ( = ?auto_2421184 ?auto_2421191 ) ) ( not ( = ?auto_2421184 ?auto_2421192 ) ) ( not ( = ?auto_2421184 ?auto_2421193 ) ) ( not ( = ?auto_2421184 ?auto_2421194 ) ) ( not ( = ?auto_2421185 ?auto_2421186 ) ) ( not ( = ?auto_2421185 ?auto_2421187 ) ) ( not ( = ?auto_2421185 ?auto_2421188 ) ) ( not ( = ?auto_2421185 ?auto_2421189 ) ) ( not ( = ?auto_2421185 ?auto_2421190 ) ) ( not ( = ?auto_2421185 ?auto_2421191 ) ) ( not ( = ?auto_2421185 ?auto_2421192 ) ) ( not ( = ?auto_2421185 ?auto_2421193 ) ) ( not ( = ?auto_2421185 ?auto_2421194 ) ) ( not ( = ?auto_2421186 ?auto_2421187 ) ) ( not ( = ?auto_2421186 ?auto_2421188 ) ) ( not ( = ?auto_2421186 ?auto_2421189 ) ) ( not ( = ?auto_2421186 ?auto_2421190 ) ) ( not ( = ?auto_2421186 ?auto_2421191 ) ) ( not ( = ?auto_2421186 ?auto_2421192 ) ) ( not ( = ?auto_2421186 ?auto_2421193 ) ) ( not ( = ?auto_2421186 ?auto_2421194 ) ) ( not ( = ?auto_2421187 ?auto_2421188 ) ) ( not ( = ?auto_2421187 ?auto_2421189 ) ) ( not ( = ?auto_2421187 ?auto_2421190 ) ) ( not ( = ?auto_2421187 ?auto_2421191 ) ) ( not ( = ?auto_2421187 ?auto_2421192 ) ) ( not ( = ?auto_2421187 ?auto_2421193 ) ) ( not ( = ?auto_2421187 ?auto_2421194 ) ) ( not ( = ?auto_2421188 ?auto_2421189 ) ) ( not ( = ?auto_2421188 ?auto_2421190 ) ) ( not ( = ?auto_2421188 ?auto_2421191 ) ) ( not ( = ?auto_2421188 ?auto_2421192 ) ) ( not ( = ?auto_2421188 ?auto_2421193 ) ) ( not ( = ?auto_2421188 ?auto_2421194 ) ) ( not ( = ?auto_2421189 ?auto_2421190 ) ) ( not ( = ?auto_2421189 ?auto_2421191 ) ) ( not ( = ?auto_2421189 ?auto_2421192 ) ) ( not ( = ?auto_2421189 ?auto_2421193 ) ) ( not ( = ?auto_2421189 ?auto_2421194 ) ) ( not ( = ?auto_2421190 ?auto_2421191 ) ) ( not ( = ?auto_2421190 ?auto_2421192 ) ) ( not ( = ?auto_2421190 ?auto_2421193 ) ) ( not ( = ?auto_2421190 ?auto_2421194 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421191 ?auto_2421192 ?auto_2421193 )
      ( MAKE-10CRATE-VERIFY ?auto_2421183 ?auto_2421184 ?auto_2421185 ?auto_2421186 ?auto_2421187 ?auto_2421188 ?auto_2421189 ?auto_2421190 ?auto_2421191 ?auto_2421192 ?auto_2421193 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2421200 - SURFACE
      ?auto_2421201 - SURFACE
      ?auto_2421202 - SURFACE
      ?auto_2421203 - SURFACE
      ?auto_2421204 - SURFACE
      ?auto_2421205 - SURFACE
      ?auto_2421206 - SURFACE
      ?auto_2421207 - SURFACE
      ?auto_2421208 - SURFACE
      ?auto_2421209 - SURFACE
      ?auto_2421210 - SURFACE
      ?auto_2421211 - SURFACE
    )
    :vars
    (
      ?auto_2421216 - HOIST
      ?auto_2421217 - PLACE
      ?auto_2421215 - PLACE
      ?auto_2421213 - HOIST
      ?auto_2421212 - SURFACE
      ?auto_2421214 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421216 ?auto_2421217 ) ( IS-CRATE ?auto_2421211 ) ( not ( = ?auto_2421210 ?auto_2421211 ) ) ( not ( = ?auto_2421209 ?auto_2421210 ) ) ( not ( = ?auto_2421209 ?auto_2421211 ) ) ( not ( = ?auto_2421215 ?auto_2421217 ) ) ( HOIST-AT ?auto_2421213 ?auto_2421215 ) ( not ( = ?auto_2421216 ?auto_2421213 ) ) ( AVAILABLE ?auto_2421213 ) ( SURFACE-AT ?auto_2421211 ?auto_2421215 ) ( ON ?auto_2421211 ?auto_2421212 ) ( CLEAR ?auto_2421211 ) ( not ( = ?auto_2421210 ?auto_2421212 ) ) ( not ( = ?auto_2421211 ?auto_2421212 ) ) ( not ( = ?auto_2421209 ?auto_2421212 ) ) ( SURFACE-AT ?auto_2421209 ?auto_2421217 ) ( CLEAR ?auto_2421209 ) ( IS-CRATE ?auto_2421210 ) ( AVAILABLE ?auto_2421216 ) ( IN ?auto_2421210 ?auto_2421214 ) ( TRUCK-AT ?auto_2421214 ?auto_2421215 ) ( ON ?auto_2421201 ?auto_2421200 ) ( ON ?auto_2421202 ?auto_2421201 ) ( ON ?auto_2421203 ?auto_2421202 ) ( ON ?auto_2421204 ?auto_2421203 ) ( ON ?auto_2421205 ?auto_2421204 ) ( ON ?auto_2421206 ?auto_2421205 ) ( ON ?auto_2421207 ?auto_2421206 ) ( ON ?auto_2421208 ?auto_2421207 ) ( ON ?auto_2421209 ?auto_2421208 ) ( not ( = ?auto_2421200 ?auto_2421201 ) ) ( not ( = ?auto_2421200 ?auto_2421202 ) ) ( not ( = ?auto_2421200 ?auto_2421203 ) ) ( not ( = ?auto_2421200 ?auto_2421204 ) ) ( not ( = ?auto_2421200 ?auto_2421205 ) ) ( not ( = ?auto_2421200 ?auto_2421206 ) ) ( not ( = ?auto_2421200 ?auto_2421207 ) ) ( not ( = ?auto_2421200 ?auto_2421208 ) ) ( not ( = ?auto_2421200 ?auto_2421209 ) ) ( not ( = ?auto_2421200 ?auto_2421210 ) ) ( not ( = ?auto_2421200 ?auto_2421211 ) ) ( not ( = ?auto_2421200 ?auto_2421212 ) ) ( not ( = ?auto_2421201 ?auto_2421202 ) ) ( not ( = ?auto_2421201 ?auto_2421203 ) ) ( not ( = ?auto_2421201 ?auto_2421204 ) ) ( not ( = ?auto_2421201 ?auto_2421205 ) ) ( not ( = ?auto_2421201 ?auto_2421206 ) ) ( not ( = ?auto_2421201 ?auto_2421207 ) ) ( not ( = ?auto_2421201 ?auto_2421208 ) ) ( not ( = ?auto_2421201 ?auto_2421209 ) ) ( not ( = ?auto_2421201 ?auto_2421210 ) ) ( not ( = ?auto_2421201 ?auto_2421211 ) ) ( not ( = ?auto_2421201 ?auto_2421212 ) ) ( not ( = ?auto_2421202 ?auto_2421203 ) ) ( not ( = ?auto_2421202 ?auto_2421204 ) ) ( not ( = ?auto_2421202 ?auto_2421205 ) ) ( not ( = ?auto_2421202 ?auto_2421206 ) ) ( not ( = ?auto_2421202 ?auto_2421207 ) ) ( not ( = ?auto_2421202 ?auto_2421208 ) ) ( not ( = ?auto_2421202 ?auto_2421209 ) ) ( not ( = ?auto_2421202 ?auto_2421210 ) ) ( not ( = ?auto_2421202 ?auto_2421211 ) ) ( not ( = ?auto_2421202 ?auto_2421212 ) ) ( not ( = ?auto_2421203 ?auto_2421204 ) ) ( not ( = ?auto_2421203 ?auto_2421205 ) ) ( not ( = ?auto_2421203 ?auto_2421206 ) ) ( not ( = ?auto_2421203 ?auto_2421207 ) ) ( not ( = ?auto_2421203 ?auto_2421208 ) ) ( not ( = ?auto_2421203 ?auto_2421209 ) ) ( not ( = ?auto_2421203 ?auto_2421210 ) ) ( not ( = ?auto_2421203 ?auto_2421211 ) ) ( not ( = ?auto_2421203 ?auto_2421212 ) ) ( not ( = ?auto_2421204 ?auto_2421205 ) ) ( not ( = ?auto_2421204 ?auto_2421206 ) ) ( not ( = ?auto_2421204 ?auto_2421207 ) ) ( not ( = ?auto_2421204 ?auto_2421208 ) ) ( not ( = ?auto_2421204 ?auto_2421209 ) ) ( not ( = ?auto_2421204 ?auto_2421210 ) ) ( not ( = ?auto_2421204 ?auto_2421211 ) ) ( not ( = ?auto_2421204 ?auto_2421212 ) ) ( not ( = ?auto_2421205 ?auto_2421206 ) ) ( not ( = ?auto_2421205 ?auto_2421207 ) ) ( not ( = ?auto_2421205 ?auto_2421208 ) ) ( not ( = ?auto_2421205 ?auto_2421209 ) ) ( not ( = ?auto_2421205 ?auto_2421210 ) ) ( not ( = ?auto_2421205 ?auto_2421211 ) ) ( not ( = ?auto_2421205 ?auto_2421212 ) ) ( not ( = ?auto_2421206 ?auto_2421207 ) ) ( not ( = ?auto_2421206 ?auto_2421208 ) ) ( not ( = ?auto_2421206 ?auto_2421209 ) ) ( not ( = ?auto_2421206 ?auto_2421210 ) ) ( not ( = ?auto_2421206 ?auto_2421211 ) ) ( not ( = ?auto_2421206 ?auto_2421212 ) ) ( not ( = ?auto_2421207 ?auto_2421208 ) ) ( not ( = ?auto_2421207 ?auto_2421209 ) ) ( not ( = ?auto_2421207 ?auto_2421210 ) ) ( not ( = ?auto_2421207 ?auto_2421211 ) ) ( not ( = ?auto_2421207 ?auto_2421212 ) ) ( not ( = ?auto_2421208 ?auto_2421209 ) ) ( not ( = ?auto_2421208 ?auto_2421210 ) ) ( not ( = ?auto_2421208 ?auto_2421211 ) ) ( not ( = ?auto_2421208 ?auto_2421212 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421209 ?auto_2421210 ?auto_2421211 )
      ( MAKE-11CRATE-VERIFY ?auto_2421200 ?auto_2421201 ?auto_2421202 ?auto_2421203 ?auto_2421204 ?auto_2421205 ?auto_2421206 ?auto_2421207 ?auto_2421208 ?auto_2421209 ?auto_2421210 ?auto_2421211 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2421218 - SURFACE
      ?auto_2421219 - SURFACE
    )
    :vars
    (
      ?auto_2421224 - HOIST
      ?auto_2421225 - PLACE
      ?auto_2421226 - SURFACE
      ?auto_2421223 - PLACE
      ?auto_2421221 - HOIST
      ?auto_2421220 - SURFACE
      ?auto_2421222 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421224 ?auto_2421225 ) ( IS-CRATE ?auto_2421219 ) ( not ( = ?auto_2421218 ?auto_2421219 ) ) ( not ( = ?auto_2421226 ?auto_2421218 ) ) ( not ( = ?auto_2421226 ?auto_2421219 ) ) ( not ( = ?auto_2421223 ?auto_2421225 ) ) ( HOIST-AT ?auto_2421221 ?auto_2421223 ) ( not ( = ?auto_2421224 ?auto_2421221 ) ) ( SURFACE-AT ?auto_2421219 ?auto_2421223 ) ( ON ?auto_2421219 ?auto_2421220 ) ( CLEAR ?auto_2421219 ) ( not ( = ?auto_2421218 ?auto_2421220 ) ) ( not ( = ?auto_2421219 ?auto_2421220 ) ) ( not ( = ?auto_2421226 ?auto_2421220 ) ) ( SURFACE-AT ?auto_2421226 ?auto_2421225 ) ( CLEAR ?auto_2421226 ) ( IS-CRATE ?auto_2421218 ) ( AVAILABLE ?auto_2421224 ) ( TRUCK-AT ?auto_2421222 ?auto_2421223 ) ( LIFTING ?auto_2421221 ?auto_2421218 ) )
    :subtasks
    ( ( !LOAD ?auto_2421221 ?auto_2421218 ?auto_2421222 ?auto_2421223 )
      ( MAKE-2CRATE ?auto_2421226 ?auto_2421218 ?auto_2421219 )
      ( MAKE-1CRATE-VERIFY ?auto_2421218 ?auto_2421219 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2421227 - SURFACE
      ?auto_2421228 - SURFACE
      ?auto_2421229 - SURFACE
    )
    :vars
    (
      ?auto_2421232 - HOIST
      ?auto_2421234 - PLACE
      ?auto_2421230 - PLACE
      ?auto_2421235 - HOIST
      ?auto_2421231 - SURFACE
      ?auto_2421233 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421232 ?auto_2421234 ) ( IS-CRATE ?auto_2421229 ) ( not ( = ?auto_2421228 ?auto_2421229 ) ) ( not ( = ?auto_2421227 ?auto_2421228 ) ) ( not ( = ?auto_2421227 ?auto_2421229 ) ) ( not ( = ?auto_2421230 ?auto_2421234 ) ) ( HOIST-AT ?auto_2421235 ?auto_2421230 ) ( not ( = ?auto_2421232 ?auto_2421235 ) ) ( SURFACE-AT ?auto_2421229 ?auto_2421230 ) ( ON ?auto_2421229 ?auto_2421231 ) ( CLEAR ?auto_2421229 ) ( not ( = ?auto_2421228 ?auto_2421231 ) ) ( not ( = ?auto_2421229 ?auto_2421231 ) ) ( not ( = ?auto_2421227 ?auto_2421231 ) ) ( SURFACE-AT ?auto_2421227 ?auto_2421234 ) ( CLEAR ?auto_2421227 ) ( IS-CRATE ?auto_2421228 ) ( AVAILABLE ?auto_2421232 ) ( TRUCK-AT ?auto_2421233 ?auto_2421230 ) ( LIFTING ?auto_2421235 ?auto_2421228 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2421228 ?auto_2421229 )
      ( MAKE-2CRATE-VERIFY ?auto_2421227 ?auto_2421228 ?auto_2421229 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2421236 - SURFACE
      ?auto_2421237 - SURFACE
      ?auto_2421238 - SURFACE
      ?auto_2421239 - SURFACE
    )
    :vars
    (
      ?auto_2421244 - HOIST
      ?auto_2421245 - PLACE
      ?auto_2421240 - PLACE
      ?auto_2421242 - HOIST
      ?auto_2421241 - SURFACE
      ?auto_2421243 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421244 ?auto_2421245 ) ( IS-CRATE ?auto_2421239 ) ( not ( = ?auto_2421238 ?auto_2421239 ) ) ( not ( = ?auto_2421237 ?auto_2421238 ) ) ( not ( = ?auto_2421237 ?auto_2421239 ) ) ( not ( = ?auto_2421240 ?auto_2421245 ) ) ( HOIST-AT ?auto_2421242 ?auto_2421240 ) ( not ( = ?auto_2421244 ?auto_2421242 ) ) ( SURFACE-AT ?auto_2421239 ?auto_2421240 ) ( ON ?auto_2421239 ?auto_2421241 ) ( CLEAR ?auto_2421239 ) ( not ( = ?auto_2421238 ?auto_2421241 ) ) ( not ( = ?auto_2421239 ?auto_2421241 ) ) ( not ( = ?auto_2421237 ?auto_2421241 ) ) ( SURFACE-AT ?auto_2421237 ?auto_2421245 ) ( CLEAR ?auto_2421237 ) ( IS-CRATE ?auto_2421238 ) ( AVAILABLE ?auto_2421244 ) ( TRUCK-AT ?auto_2421243 ?auto_2421240 ) ( LIFTING ?auto_2421242 ?auto_2421238 ) ( ON ?auto_2421237 ?auto_2421236 ) ( not ( = ?auto_2421236 ?auto_2421237 ) ) ( not ( = ?auto_2421236 ?auto_2421238 ) ) ( not ( = ?auto_2421236 ?auto_2421239 ) ) ( not ( = ?auto_2421236 ?auto_2421241 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421237 ?auto_2421238 ?auto_2421239 )
      ( MAKE-3CRATE-VERIFY ?auto_2421236 ?auto_2421237 ?auto_2421238 ?auto_2421239 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2421246 - SURFACE
      ?auto_2421247 - SURFACE
      ?auto_2421248 - SURFACE
      ?auto_2421249 - SURFACE
      ?auto_2421250 - SURFACE
    )
    :vars
    (
      ?auto_2421255 - HOIST
      ?auto_2421256 - PLACE
      ?auto_2421251 - PLACE
      ?auto_2421253 - HOIST
      ?auto_2421252 - SURFACE
      ?auto_2421254 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421255 ?auto_2421256 ) ( IS-CRATE ?auto_2421250 ) ( not ( = ?auto_2421249 ?auto_2421250 ) ) ( not ( = ?auto_2421248 ?auto_2421249 ) ) ( not ( = ?auto_2421248 ?auto_2421250 ) ) ( not ( = ?auto_2421251 ?auto_2421256 ) ) ( HOIST-AT ?auto_2421253 ?auto_2421251 ) ( not ( = ?auto_2421255 ?auto_2421253 ) ) ( SURFACE-AT ?auto_2421250 ?auto_2421251 ) ( ON ?auto_2421250 ?auto_2421252 ) ( CLEAR ?auto_2421250 ) ( not ( = ?auto_2421249 ?auto_2421252 ) ) ( not ( = ?auto_2421250 ?auto_2421252 ) ) ( not ( = ?auto_2421248 ?auto_2421252 ) ) ( SURFACE-AT ?auto_2421248 ?auto_2421256 ) ( CLEAR ?auto_2421248 ) ( IS-CRATE ?auto_2421249 ) ( AVAILABLE ?auto_2421255 ) ( TRUCK-AT ?auto_2421254 ?auto_2421251 ) ( LIFTING ?auto_2421253 ?auto_2421249 ) ( ON ?auto_2421247 ?auto_2421246 ) ( ON ?auto_2421248 ?auto_2421247 ) ( not ( = ?auto_2421246 ?auto_2421247 ) ) ( not ( = ?auto_2421246 ?auto_2421248 ) ) ( not ( = ?auto_2421246 ?auto_2421249 ) ) ( not ( = ?auto_2421246 ?auto_2421250 ) ) ( not ( = ?auto_2421246 ?auto_2421252 ) ) ( not ( = ?auto_2421247 ?auto_2421248 ) ) ( not ( = ?auto_2421247 ?auto_2421249 ) ) ( not ( = ?auto_2421247 ?auto_2421250 ) ) ( not ( = ?auto_2421247 ?auto_2421252 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421248 ?auto_2421249 ?auto_2421250 )
      ( MAKE-4CRATE-VERIFY ?auto_2421246 ?auto_2421247 ?auto_2421248 ?auto_2421249 ?auto_2421250 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2421257 - SURFACE
      ?auto_2421258 - SURFACE
      ?auto_2421259 - SURFACE
      ?auto_2421260 - SURFACE
      ?auto_2421261 - SURFACE
      ?auto_2421262 - SURFACE
    )
    :vars
    (
      ?auto_2421267 - HOIST
      ?auto_2421268 - PLACE
      ?auto_2421263 - PLACE
      ?auto_2421265 - HOIST
      ?auto_2421264 - SURFACE
      ?auto_2421266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421267 ?auto_2421268 ) ( IS-CRATE ?auto_2421262 ) ( not ( = ?auto_2421261 ?auto_2421262 ) ) ( not ( = ?auto_2421260 ?auto_2421261 ) ) ( not ( = ?auto_2421260 ?auto_2421262 ) ) ( not ( = ?auto_2421263 ?auto_2421268 ) ) ( HOIST-AT ?auto_2421265 ?auto_2421263 ) ( not ( = ?auto_2421267 ?auto_2421265 ) ) ( SURFACE-AT ?auto_2421262 ?auto_2421263 ) ( ON ?auto_2421262 ?auto_2421264 ) ( CLEAR ?auto_2421262 ) ( not ( = ?auto_2421261 ?auto_2421264 ) ) ( not ( = ?auto_2421262 ?auto_2421264 ) ) ( not ( = ?auto_2421260 ?auto_2421264 ) ) ( SURFACE-AT ?auto_2421260 ?auto_2421268 ) ( CLEAR ?auto_2421260 ) ( IS-CRATE ?auto_2421261 ) ( AVAILABLE ?auto_2421267 ) ( TRUCK-AT ?auto_2421266 ?auto_2421263 ) ( LIFTING ?auto_2421265 ?auto_2421261 ) ( ON ?auto_2421258 ?auto_2421257 ) ( ON ?auto_2421259 ?auto_2421258 ) ( ON ?auto_2421260 ?auto_2421259 ) ( not ( = ?auto_2421257 ?auto_2421258 ) ) ( not ( = ?auto_2421257 ?auto_2421259 ) ) ( not ( = ?auto_2421257 ?auto_2421260 ) ) ( not ( = ?auto_2421257 ?auto_2421261 ) ) ( not ( = ?auto_2421257 ?auto_2421262 ) ) ( not ( = ?auto_2421257 ?auto_2421264 ) ) ( not ( = ?auto_2421258 ?auto_2421259 ) ) ( not ( = ?auto_2421258 ?auto_2421260 ) ) ( not ( = ?auto_2421258 ?auto_2421261 ) ) ( not ( = ?auto_2421258 ?auto_2421262 ) ) ( not ( = ?auto_2421258 ?auto_2421264 ) ) ( not ( = ?auto_2421259 ?auto_2421260 ) ) ( not ( = ?auto_2421259 ?auto_2421261 ) ) ( not ( = ?auto_2421259 ?auto_2421262 ) ) ( not ( = ?auto_2421259 ?auto_2421264 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421260 ?auto_2421261 ?auto_2421262 )
      ( MAKE-5CRATE-VERIFY ?auto_2421257 ?auto_2421258 ?auto_2421259 ?auto_2421260 ?auto_2421261 ?auto_2421262 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2421269 - SURFACE
      ?auto_2421270 - SURFACE
      ?auto_2421271 - SURFACE
      ?auto_2421272 - SURFACE
      ?auto_2421273 - SURFACE
      ?auto_2421274 - SURFACE
      ?auto_2421275 - SURFACE
    )
    :vars
    (
      ?auto_2421280 - HOIST
      ?auto_2421281 - PLACE
      ?auto_2421276 - PLACE
      ?auto_2421278 - HOIST
      ?auto_2421277 - SURFACE
      ?auto_2421279 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421280 ?auto_2421281 ) ( IS-CRATE ?auto_2421275 ) ( not ( = ?auto_2421274 ?auto_2421275 ) ) ( not ( = ?auto_2421273 ?auto_2421274 ) ) ( not ( = ?auto_2421273 ?auto_2421275 ) ) ( not ( = ?auto_2421276 ?auto_2421281 ) ) ( HOIST-AT ?auto_2421278 ?auto_2421276 ) ( not ( = ?auto_2421280 ?auto_2421278 ) ) ( SURFACE-AT ?auto_2421275 ?auto_2421276 ) ( ON ?auto_2421275 ?auto_2421277 ) ( CLEAR ?auto_2421275 ) ( not ( = ?auto_2421274 ?auto_2421277 ) ) ( not ( = ?auto_2421275 ?auto_2421277 ) ) ( not ( = ?auto_2421273 ?auto_2421277 ) ) ( SURFACE-AT ?auto_2421273 ?auto_2421281 ) ( CLEAR ?auto_2421273 ) ( IS-CRATE ?auto_2421274 ) ( AVAILABLE ?auto_2421280 ) ( TRUCK-AT ?auto_2421279 ?auto_2421276 ) ( LIFTING ?auto_2421278 ?auto_2421274 ) ( ON ?auto_2421270 ?auto_2421269 ) ( ON ?auto_2421271 ?auto_2421270 ) ( ON ?auto_2421272 ?auto_2421271 ) ( ON ?auto_2421273 ?auto_2421272 ) ( not ( = ?auto_2421269 ?auto_2421270 ) ) ( not ( = ?auto_2421269 ?auto_2421271 ) ) ( not ( = ?auto_2421269 ?auto_2421272 ) ) ( not ( = ?auto_2421269 ?auto_2421273 ) ) ( not ( = ?auto_2421269 ?auto_2421274 ) ) ( not ( = ?auto_2421269 ?auto_2421275 ) ) ( not ( = ?auto_2421269 ?auto_2421277 ) ) ( not ( = ?auto_2421270 ?auto_2421271 ) ) ( not ( = ?auto_2421270 ?auto_2421272 ) ) ( not ( = ?auto_2421270 ?auto_2421273 ) ) ( not ( = ?auto_2421270 ?auto_2421274 ) ) ( not ( = ?auto_2421270 ?auto_2421275 ) ) ( not ( = ?auto_2421270 ?auto_2421277 ) ) ( not ( = ?auto_2421271 ?auto_2421272 ) ) ( not ( = ?auto_2421271 ?auto_2421273 ) ) ( not ( = ?auto_2421271 ?auto_2421274 ) ) ( not ( = ?auto_2421271 ?auto_2421275 ) ) ( not ( = ?auto_2421271 ?auto_2421277 ) ) ( not ( = ?auto_2421272 ?auto_2421273 ) ) ( not ( = ?auto_2421272 ?auto_2421274 ) ) ( not ( = ?auto_2421272 ?auto_2421275 ) ) ( not ( = ?auto_2421272 ?auto_2421277 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421273 ?auto_2421274 ?auto_2421275 )
      ( MAKE-6CRATE-VERIFY ?auto_2421269 ?auto_2421270 ?auto_2421271 ?auto_2421272 ?auto_2421273 ?auto_2421274 ?auto_2421275 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2421282 - SURFACE
      ?auto_2421283 - SURFACE
      ?auto_2421284 - SURFACE
      ?auto_2421285 - SURFACE
      ?auto_2421286 - SURFACE
      ?auto_2421287 - SURFACE
      ?auto_2421288 - SURFACE
      ?auto_2421289 - SURFACE
    )
    :vars
    (
      ?auto_2421294 - HOIST
      ?auto_2421295 - PLACE
      ?auto_2421290 - PLACE
      ?auto_2421292 - HOIST
      ?auto_2421291 - SURFACE
      ?auto_2421293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421294 ?auto_2421295 ) ( IS-CRATE ?auto_2421289 ) ( not ( = ?auto_2421288 ?auto_2421289 ) ) ( not ( = ?auto_2421287 ?auto_2421288 ) ) ( not ( = ?auto_2421287 ?auto_2421289 ) ) ( not ( = ?auto_2421290 ?auto_2421295 ) ) ( HOIST-AT ?auto_2421292 ?auto_2421290 ) ( not ( = ?auto_2421294 ?auto_2421292 ) ) ( SURFACE-AT ?auto_2421289 ?auto_2421290 ) ( ON ?auto_2421289 ?auto_2421291 ) ( CLEAR ?auto_2421289 ) ( not ( = ?auto_2421288 ?auto_2421291 ) ) ( not ( = ?auto_2421289 ?auto_2421291 ) ) ( not ( = ?auto_2421287 ?auto_2421291 ) ) ( SURFACE-AT ?auto_2421287 ?auto_2421295 ) ( CLEAR ?auto_2421287 ) ( IS-CRATE ?auto_2421288 ) ( AVAILABLE ?auto_2421294 ) ( TRUCK-AT ?auto_2421293 ?auto_2421290 ) ( LIFTING ?auto_2421292 ?auto_2421288 ) ( ON ?auto_2421283 ?auto_2421282 ) ( ON ?auto_2421284 ?auto_2421283 ) ( ON ?auto_2421285 ?auto_2421284 ) ( ON ?auto_2421286 ?auto_2421285 ) ( ON ?auto_2421287 ?auto_2421286 ) ( not ( = ?auto_2421282 ?auto_2421283 ) ) ( not ( = ?auto_2421282 ?auto_2421284 ) ) ( not ( = ?auto_2421282 ?auto_2421285 ) ) ( not ( = ?auto_2421282 ?auto_2421286 ) ) ( not ( = ?auto_2421282 ?auto_2421287 ) ) ( not ( = ?auto_2421282 ?auto_2421288 ) ) ( not ( = ?auto_2421282 ?auto_2421289 ) ) ( not ( = ?auto_2421282 ?auto_2421291 ) ) ( not ( = ?auto_2421283 ?auto_2421284 ) ) ( not ( = ?auto_2421283 ?auto_2421285 ) ) ( not ( = ?auto_2421283 ?auto_2421286 ) ) ( not ( = ?auto_2421283 ?auto_2421287 ) ) ( not ( = ?auto_2421283 ?auto_2421288 ) ) ( not ( = ?auto_2421283 ?auto_2421289 ) ) ( not ( = ?auto_2421283 ?auto_2421291 ) ) ( not ( = ?auto_2421284 ?auto_2421285 ) ) ( not ( = ?auto_2421284 ?auto_2421286 ) ) ( not ( = ?auto_2421284 ?auto_2421287 ) ) ( not ( = ?auto_2421284 ?auto_2421288 ) ) ( not ( = ?auto_2421284 ?auto_2421289 ) ) ( not ( = ?auto_2421284 ?auto_2421291 ) ) ( not ( = ?auto_2421285 ?auto_2421286 ) ) ( not ( = ?auto_2421285 ?auto_2421287 ) ) ( not ( = ?auto_2421285 ?auto_2421288 ) ) ( not ( = ?auto_2421285 ?auto_2421289 ) ) ( not ( = ?auto_2421285 ?auto_2421291 ) ) ( not ( = ?auto_2421286 ?auto_2421287 ) ) ( not ( = ?auto_2421286 ?auto_2421288 ) ) ( not ( = ?auto_2421286 ?auto_2421289 ) ) ( not ( = ?auto_2421286 ?auto_2421291 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421287 ?auto_2421288 ?auto_2421289 )
      ( MAKE-7CRATE-VERIFY ?auto_2421282 ?auto_2421283 ?auto_2421284 ?auto_2421285 ?auto_2421286 ?auto_2421287 ?auto_2421288 ?auto_2421289 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2421296 - SURFACE
      ?auto_2421297 - SURFACE
      ?auto_2421298 - SURFACE
      ?auto_2421299 - SURFACE
      ?auto_2421300 - SURFACE
      ?auto_2421301 - SURFACE
      ?auto_2421302 - SURFACE
      ?auto_2421303 - SURFACE
      ?auto_2421304 - SURFACE
    )
    :vars
    (
      ?auto_2421309 - HOIST
      ?auto_2421310 - PLACE
      ?auto_2421305 - PLACE
      ?auto_2421307 - HOIST
      ?auto_2421306 - SURFACE
      ?auto_2421308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421309 ?auto_2421310 ) ( IS-CRATE ?auto_2421304 ) ( not ( = ?auto_2421303 ?auto_2421304 ) ) ( not ( = ?auto_2421302 ?auto_2421303 ) ) ( not ( = ?auto_2421302 ?auto_2421304 ) ) ( not ( = ?auto_2421305 ?auto_2421310 ) ) ( HOIST-AT ?auto_2421307 ?auto_2421305 ) ( not ( = ?auto_2421309 ?auto_2421307 ) ) ( SURFACE-AT ?auto_2421304 ?auto_2421305 ) ( ON ?auto_2421304 ?auto_2421306 ) ( CLEAR ?auto_2421304 ) ( not ( = ?auto_2421303 ?auto_2421306 ) ) ( not ( = ?auto_2421304 ?auto_2421306 ) ) ( not ( = ?auto_2421302 ?auto_2421306 ) ) ( SURFACE-AT ?auto_2421302 ?auto_2421310 ) ( CLEAR ?auto_2421302 ) ( IS-CRATE ?auto_2421303 ) ( AVAILABLE ?auto_2421309 ) ( TRUCK-AT ?auto_2421308 ?auto_2421305 ) ( LIFTING ?auto_2421307 ?auto_2421303 ) ( ON ?auto_2421297 ?auto_2421296 ) ( ON ?auto_2421298 ?auto_2421297 ) ( ON ?auto_2421299 ?auto_2421298 ) ( ON ?auto_2421300 ?auto_2421299 ) ( ON ?auto_2421301 ?auto_2421300 ) ( ON ?auto_2421302 ?auto_2421301 ) ( not ( = ?auto_2421296 ?auto_2421297 ) ) ( not ( = ?auto_2421296 ?auto_2421298 ) ) ( not ( = ?auto_2421296 ?auto_2421299 ) ) ( not ( = ?auto_2421296 ?auto_2421300 ) ) ( not ( = ?auto_2421296 ?auto_2421301 ) ) ( not ( = ?auto_2421296 ?auto_2421302 ) ) ( not ( = ?auto_2421296 ?auto_2421303 ) ) ( not ( = ?auto_2421296 ?auto_2421304 ) ) ( not ( = ?auto_2421296 ?auto_2421306 ) ) ( not ( = ?auto_2421297 ?auto_2421298 ) ) ( not ( = ?auto_2421297 ?auto_2421299 ) ) ( not ( = ?auto_2421297 ?auto_2421300 ) ) ( not ( = ?auto_2421297 ?auto_2421301 ) ) ( not ( = ?auto_2421297 ?auto_2421302 ) ) ( not ( = ?auto_2421297 ?auto_2421303 ) ) ( not ( = ?auto_2421297 ?auto_2421304 ) ) ( not ( = ?auto_2421297 ?auto_2421306 ) ) ( not ( = ?auto_2421298 ?auto_2421299 ) ) ( not ( = ?auto_2421298 ?auto_2421300 ) ) ( not ( = ?auto_2421298 ?auto_2421301 ) ) ( not ( = ?auto_2421298 ?auto_2421302 ) ) ( not ( = ?auto_2421298 ?auto_2421303 ) ) ( not ( = ?auto_2421298 ?auto_2421304 ) ) ( not ( = ?auto_2421298 ?auto_2421306 ) ) ( not ( = ?auto_2421299 ?auto_2421300 ) ) ( not ( = ?auto_2421299 ?auto_2421301 ) ) ( not ( = ?auto_2421299 ?auto_2421302 ) ) ( not ( = ?auto_2421299 ?auto_2421303 ) ) ( not ( = ?auto_2421299 ?auto_2421304 ) ) ( not ( = ?auto_2421299 ?auto_2421306 ) ) ( not ( = ?auto_2421300 ?auto_2421301 ) ) ( not ( = ?auto_2421300 ?auto_2421302 ) ) ( not ( = ?auto_2421300 ?auto_2421303 ) ) ( not ( = ?auto_2421300 ?auto_2421304 ) ) ( not ( = ?auto_2421300 ?auto_2421306 ) ) ( not ( = ?auto_2421301 ?auto_2421302 ) ) ( not ( = ?auto_2421301 ?auto_2421303 ) ) ( not ( = ?auto_2421301 ?auto_2421304 ) ) ( not ( = ?auto_2421301 ?auto_2421306 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421302 ?auto_2421303 ?auto_2421304 )
      ( MAKE-8CRATE-VERIFY ?auto_2421296 ?auto_2421297 ?auto_2421298 ?auto_2421299 ?auto_2421300 ?auto_2421301 ?auto_2421302 ?auto_2421303 ?auto_2421304 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2421311 - SURFACE
      ?auto_2421312 - SURFACE
      ?auto_2421313 - SURFACE
      ?auto_2421314 - SURFACE
      ?auto_2421315 - SURFACE
      ?auto_2421316 - SURFACE
      ?auto_2421317 - SURFACE
      ?auto_2421318 - SURFACE
      ?auto_2421319 - SURFACE
      ?auto_2421320 - SURFACE
    )
    :vars
    (
      ?auto_2421325 - HOIST
      ?auto_2421326 - PLACE
      ?auto_2421321 - PLACE
      ?auto_2421323 - HOIST
      ?auto_2421322 - SURFACE
      ?auto_2421324 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421325 ?auto_2421326 ) ( IS-CRATE ?auto_2421320 ) ( not ( = ?auto_2421319 ?auto_2421320 ) ) ( not ( = ?auto_2421318 ?auto_2421319 ) ) ( not ( = ?auto_2421318 ?auto_2421320 ) ) ( not ( = ?auto_2421321 ?auto_2421326 ) ) ( HOIST-AT ?auto_2421323 ?auto_2421321 ) ( not ( = ?auto_2421325 ?auto_2421323 ) ) ( SURFACE-AT ?auto_2421320 ?auto_2421321 ) ( ON ?auto_2421320 ?auto_2421322 ) ( CLEAR ?auto_2421320 ) ( not ( = ?auto_2421319 ?auto_2421322 ) ) ( not ( = ?auto_2421320 ?auto_2421322 ) ) ( not ( = ?auto_2421318 ?auto_2421322 ) ) ( SURFACE-AT ?auto_2421318 ?auto_2421326 ) ( CLEAR ?auto_2421318 ) ( IS-CRATE ?auto_2421319 ) ( AVAILABLE ?auto_2421325 ) ( TRUCK-AT ?auto_2421324 ?auto_2421321 ) ( LIFTING ?auto_2421323 ?auto_2421319 ) ( ON ?auto_2421312 ?auto_2421311 ) ( ON ?auto_2421313 ?auto_2421312 ) ( ON ?auto_2421314 ?auto_2421313 ) ( ON ?auto_2421315 ?auto_2421314 ) ( ON ?auto_2421316 ?auto_2421315 ) ( ON ?auto_2421317 ?auto_2421316 ) ( ON ?auto_2421318 ?auto_2421317 ) ( not ( = ?auto_2421311 ?auto_2421312 ) ) ( not ( = ?auto_2421311 ?auto_2421313 ) ) ( not ( = ?auto_2421311 ?auto_2421314 ) ) ( not ( = ?auto_2421311 ?auto_2421315 ) ) ( not ( = ?auto_2421311 ?auto_2421316 ) ) ( not ( = ?auto_2421311 ?auto_2421317 ) ) ( not ( = ?auto_2421311 ?auto_2421318 ) ) ( not ( = ?auto_2421311 ?auto_2421319 ) ) ( not ( = ?auto_2421311 ?auto_2421320 ) ) ( not ( = ?auto_2421311 ?auto_2421322 ) ) ( not ( = ?auto_2421312 ?auto_2421313 ) ) ( not ( = ?auto_2421312 ?auto_2421314 ) ) ( not ( = ?auto_2421312 ?auto_2421315 ) ) ( not ( = ?auto_2421312 ?auto_2421316 ) ) ( not ( = ?auto_2421312 ?auto_2421317 ) ) ( not ( = ?auto_2421312 ?auto_2421318 ) ) ( not ( = ?auto_2421312 ?auto_2421319 ) ) ( not ( = ?auto_2421312 ?auto_2421320 ) ) ( not ( = ?auto_2421312 ?auto_2421322 ) ) ( not ( = ?auto_2421313 ?auto_2421314 ) ) ( not ( = ?auto_2421313 ?auto_2421315 ) ) ( not ( = ?auto_2421313 ?auto_2421316 ) ) ( not ( = ?auto_2421313 ?auto_2421317 ) ) ( not ( = ?auto_2421313 ?auto_2421318 ) ) ( not ( = ?auto_2421313 ?auto_2421319 ) ) ( not ( = ?auto_2421313 ?auto_2421320 ) ) ( not ( = ?auto_2421313 ?auto_2421322 ) ) ( not ( = ?auto_2421314 ?auto_2421315 ) ) ( not ( = ?auto_2421314 ?auto_2421316 ) ) ( not ( = ?auto_2421314 ?auto_2421317 ) ) ( not ( = ?auto_2421314 ?auto_2421318 ) ) ( not ( = ?auto_2421314 ?auto_2421319 ) ) ( not ( = ?auto_2421314 ?auto_2421320 ) ) ( not ( = ?auto_2421314 ?auto_2421322 ) ) ( not ( = ?auto_2421315 ?auto_2421316 ) ) ( not ( = ?auto_2421315 ?auto_2421317 ) ) ( not ( = ?auto_2421315 ?auto_2421318 ) ) ( not ( = ?auto_2421315 ?auto_2421319 ) ) ( not ( = ?auto_2421315 ?auto_2421320 ) ) ( not ( = ?auto_2421315 ?auto_2421322 ) ) ( not ( = ?auto_2421316 ?auto_2421317 ) ) ( not ( = ?auto_2421316 ?auto_2421318 ) ) ( not ( = ?auto_2421316 ?auto_2421319 ) ) ( not ( = ?auto_2421316 ?auto_2421320 ) ) ( not ( = ?auto_2421316 ?auto_2421322 ) ) ( not ( = ?auto_2421317 ?auto_2421318 ) ) ( not ( = ?auto_2421317 ?auto_2421319 ) ) ( not ( = ?auto_2421317 ?auto_2421320 ) ) ( not ( = ?auto_2421317 ?auto_2421322 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421318 ?auto_2421319 ?auto_2421320 )
      ( MAKE-9CRATE-VERIFY ?auto_2421311 ?auto_2421312 ?auto_2421313 ?auto_2421314 ?auto_2421315 ?auto_2421316 ?auto_2421317 ?auto_2421318 ?auto_2421319 ?auto_2421320 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2421327 - SURFACE
      ?auto_2421328 - SURFACE
      ?auto_2421329 - SURFACE
      ?auto_2421330 - SURFACE
      ?auto_2421331 - SURFACE
      ?auto_2421332 - SURFACE
      ?auto_2421333 - SURFACE
      ?auto_2421334 - SURFACE
      ?auto_2421335 - SURFACE
      ?auto_2421336 - SURFACE
      ?auto_2421337 - SURFACE
    )
    :vars
    (
      ?auto_2421342 - HOIST
      ?auto_2421343 - PLACE
      ?auto_2421338 - PLACE
      ?auto_2421340 - HOIST
      ?auto_2421339 - SURFACE
      ?auto_2421341 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421342 ?auto_2421343 ) ( IS-CRATE ?auto_2421337 ) ( not ( = ?auto_2421336 ?auto_2421337 ) ) ( not ( = ?auto_2421335 ?auto_2421336 ) ) ( not ( = ?auto_2421335 ?auto_2421337 ) ) ( not ( = ?auto_2421338 ?auto_2421343 ) ) ( HOIST-AT ?auto_2421340 ?auto_2421338 ) ( not ( = ?auto_2421342 ?auto_2421340 ) ) ( SURFACE-AT ?auto_2421337 ?auto_2421338 ) ( ON ?auto_2421337 ?auto_2421339 ) ( CLEAR ?auto_2421337 ) ( not ( = ?auto_2421336 ?auto_2421339 ) ) ( not ( = ?auto_2421337 ?auto_2421339 ) ) ( not ( = ?auto_2421335 ?auto_2421339 ) ) ( SURFACE-AT ?auto_2421335 ?auto_2421343 ) ( CLEAR ?auto_2421335 ) ( IS-CRATE ?auto_2421336 ) ( AVAILABLE ?auto_2421342 ) ( TRUCK-AT ?auto_2421341 ?auto_2421338 ) ( LIFTING ?auto_2421340 ?auto_2421336 ) ( ON ?auto_2421328 ?auto_2421327 ) ( ON ?auto_2421329 ?auto_2421328 ) ( ON ?auto_2421330 ?auto_2421329 ) ( ON ?auto_2421331 ?auto_2421330 ) ( ON ?auto_2421332 ?auto_2421331 ) ( ON ?auto_2421333 ?auto_2421332 ) ( ON ?auto_2421334 ?auto_2421333 ) ( ON ?auto_2421335 ?auto_2421334 ) ( not ( = ?auto_2421327 ?auto_2421328 ) ) ( not ( = ?auto_2421327 ?auto_2421329 ) ) ( not ( = ?auto_2421327 ?auto_2421330 ) ) ( not ( = ?auto_2421327 ?auto_2421331 ) ) ( not ( = ?auto_2421327 ?auto_2421332 ) ) ( not ( = ?auto_2421327 ?auto_2421333 ) ) ( not ( = ?auto_2421327 ?auto_2421334 ) ) ( not ( = ?auto_2421327 ?auto_2421335 ) ) ( not ( = ?auto_2421327 ?auto_2421336 ) ) ( not ( = ?auto_2421327 ?auto_2421337 ) ) ( not ( = ?auto_2421327 ?auto_2421339 ) ) ( not ( = ?auto_2421328 ?auto_2421329 ) ) ( not ( = ?auto_2421328 ?auto_2421330 ) ) ( not ( = ?auto_2421328 ?auto_2421331 ) ) ( not ( = ?auto_2421328 ?auto_2421332 ) ) ( not ( = ?auto_2421328 ?auto_2421333 ) ) ( not ( = ?auto_2421328 ?auto_2421334 ) ) ( not ( = ?auto_2421328 ?auto_2421335 ) ) ( not ( = ?auto_2421328 ?auto_2421336 ) ) ( not ( = ?auto_2421328 ?auto_2421337 ) ) ( not ( = ?auto_2421328 ?auto_2421339 ) ) ( not ( = ?auto_2421329 ?auto_2421330 ) ) ( not ( = ?auto_2421329 ?auto_2421331 ) ) ( not ( = ?auto_2421329 ?auto_2421332 ) ) ( not ( = ?auto_2421329 ?auto_2421333 ) ) ( not ( = ?auto_2421329 ?auto_2421334 ) ) ( not ( = ?auto_2421329 ?auto_2421335 ) ) ( not ( = ?auto_2421329 ?auto_2421336 ) ) ( not ( = ?auto_2421329 ?auto_2421337 ) ) ( not ( = ?auto_2421329 ?auto_2421339 ) ) ( not ( = ?auto_2421330 ?auto_2421331 ) ) ( not ( = ?auto_2421330 ?auto_2421332 ) ) ( not ( = ?auto_2421330 ?auto_2421333 ) ) ( not ( = ?auto_2421330 ?auto_2421334 ) ) ( not ( = ?auto_2421330 ?auto_2421335 ) ) ( not ( = ?auto_2421330 ?auto_2421336 ) ) ( not ( = ?auto_2421330 ?auto_2421337 ) ) ( not ( = ?auto_2421330 ?auto_2421339 ) ) ( not ( = ?auto_2421331 ?auto_2421332 ) ) ( not ( = ?auto_2421331 ?auto_2421333 ) ) ( not ( = ?auto_2421331 ?auto_2421334 ) ) ( not ( = ?auto_2421331 ?auto_2421335 ) ) ( not ( = ?auto_2421331 ?auto_2421336 ) ) ( not ( = ?auto_2421331 ?auto_2421337 ) ) ( not ( = ?auto_2421331 ?auto_2421339 ) ) ( not ( = ?auto_2421332 ?auto_2421333 ) ) ( not ( = ?auto_2421332 ?auto_2421334 ) ) ( not ( = ?auto_2421332 ?auto_2421335 ) ) ( not ( = ?auto_2421332 ?auto_2421336 ) ) ( not ( = ?auto_2421332 ?auto_2421337 ) ) ( not ( = ?auto_2421332 ?auto_2421339 ) ) ( not ( = ?auto_2421333 ?auto_2421334 ) ) ( not ( = ?auto_2421333 ?auto_2421335 ) ) ( not ( = ?auto_2421333 ?auto_2421336 ) ) ( not ( = ?auto_2421333 ?auto_2421337 ) ) ( not ( = ?auto_2421333 ?auto_2421339 ) ) ( not ( = ?auto_2421334 ?auto_2421335 ) ) ( not ( = ?auto_2421334 ?auto_2421336 ) ) ( not ( = ?auto_2421334 ?auto_2421337 ) ) ( not ( = ?auto_2421334 ?auto_2421339 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421335 ?auto_2421336 ?auto_2421337 )
      ( MAKE-10CRATE-VERIFY ?auto_2421327 ?auto_2421328 ?auto_2421329 ?auto_2421330 ?auto_2421331 ?auto_2421332 ?auto_2421333 ?auto_2421334 ?auto_2421335 ?auto_2421336 ?auto_2421337 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2421344 - SURFACE
      ?auto_2421345 - SURFACE
      ?auto_2421346 - SURFACE
      ?auto_2421347 - SURFACE
      ?auto_2421348 - SURFACE
      ?auto_2421349 - SURFACE
      ?auto_2421350 - SURFACE
      ?auto_2421351 - SURFACE
      ?auto_2421352 - SURFACE
      ?auto_2421353 - SURFACE
      ?auto_2421354 - SURFACE
      ?auto_2421355 - SURFACE
    )
    :vars
    (
      ?auto_2421360 - HOIST
      ?auto_2421361 - PLACE
      ?auto_2421356 - PLACE
      ?auto_2421358 - HOIST
      ?auto_2421357 - SURFACE
      ?auto_2421359 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421360 ?auto_2421361 ) ( IS-CRATE ?auto_2421355 ) ( not ( = ?auto_2421354 ?auto_2421355 ) ) ( not ( = ?auto_2421353 ?auto_2421354 ) ) ( not ( = ?auto_2421353 ?auto_2421355 ) ) ( not ( = ?auto_2421356 ?auto_2421361 ) ) ( HOIST-AT ?auto_2421358 ?auto_2421356 ) ( not ( = ?auto_2421360 ?auto_2421358 ) ) ( SURFACE-AT ?auto_2421355 ?auto_2421356 ) ( ON ?auto_2421355 ?auto_2421357 ) ( CLEAR ?auto_2421355 ) ( not ( = ?auto_2421354 ?auto_2421357 ) ) ( not ( = ?auto_2421355 ?auto_2421357 ) ) ( not ( = ?auto_2421353 ?auto_2421357 ) ) ( SURFACE-AT ?auto_2421353 ?auto_2421361 ) ( CLEAR ?auto_2421353 ) ( IS-CRATE ?auto_2421354 ) ( AVAILABLE ?auto_2421360 ) ( TRUCK-AT ?auto_2421359 ?auto_2421356 ) ( LIFTING ?auto_2421358 ?auto_2421354 ) ( ON ?auto_2421345 ?auto_2421344 ) ( ON ?auto_2421346 ?auto_2421345 ) ( ON ?auto_2421347 ?auto_2421346 ) ( ON ?auto_2421348 ?auto_2421347 ) ( ON ?auto_2421349 ?auto_2421348 ) ( ON ?auto_2421350 ?auto_2421349 ) ( ON ?auto_2421351 ?auto_2421350 ) ( ON ?auto_2421352 ?auto_2421351 ) ( ON ?auto_2421353 ?auto_2421352 ) ( not ( = ?auto_2421344 ?auto_2421345 ) ) ( not ( = ?auto_2421344 ?auto_2421346 ) ) ( not ( = ?auto_2421344 ?auto_2421347 ) ) ( not ( = ?auto_2421344 ?auto_2421348 ) ) ( not ( = ?auto_2421344 ?auto_2421349 ) ) ( not ( = ?auto_2421344 ?auto_2421350 ) ) ( not ( = ?auto_2421344 ?auto_2421351 ) ) ( not ( = ?auto_2421344 ?auto_2421352 ) ) ( not ( = ?auto_2421344 ?auto_2421353 ) ) ( not ( = ?auto_2421344 ?auto_2421354 ) ) ( not ( = ?auto_2421344 ?auto_2421355 ) ) ( not ( = ?auto_2421344 ?auto_2421357 ) ) ( not ( = ?auto_2421345 ?auto_2421346 ) ) ( not ( = ?auto_2421345 ?auto_2421347 ) ) ( not ( = ?auto_2421345 ?auto_2421348 ) ) ( not ( = ?auto_2421345 ?auto_2421349 ) ) ( not ( = ?auto_2421345 ?auto_2421350 ) ) ( not ( = ?auto_2421345 ?auto_2421351 ) ) ( not ( = ?auto_2421345 ?auto_2421352 ) ) ( not ( = ?auto_2421345 ?auto_2421353 ) ) ( not ( = ?auto_2421345 ?auto_2421354 ) ) ( not ( = ?auto_2421345 ?auto_2421355 ) ) ( not ( = ?auto_2421345 ?auto_2421357 ) ) ( not ( = ?auto_2421346 ?auto_2421347 ) ) ( not ( = ?auto_2421346 ?auto_2421348 ) ) ( not ( = ?auto_2421346 ?auto_2421349 ) ) ( not ( = ?auto_2421346 ?auto_2421350 ) ) ( not ( = ?auto_2421346 ?auto_2421351 ) ) ( not ( = ?auto_2421346 ?auto_2421352 ) ) ( not ( = ?auto_2421346 ?auto_2421353 ) ) ( not ( = ?auto_2421346 ?auto_2421354 ) ) ( not ( = ?auto_2421346 ?auto_2421355 ) ) ( not ( = ?auto_2421346 ?auto_2421357 ) ) ( not ( = ?auto_2421347 ?auto_2421348 ) ) ( not ( = ?auto_2421347 ?auto_2421349 ) ) ( not ( = ?auto_2421347 ?auto_2421350 ) ) ( not ( = ?auto_2421347 ?auto_2421351 ) ) ( not ( = ?auto_2421347 ?auto_2421352 ) ) ( not ( = ?auto_2421347 ?auto_2421353 ) ) ( not ( = ?auto_2421347 ?auto_2421354 ) ) ( not ( = ?auto_2421347 ?auto_2421355 ) ) ( not ( = ?auto_2421347 ?auto_2421357 ) ) ( not ( = ?auto_2421348 ?auto_2421349 ) ) ( not ( = ?auto_2421348 ?auto_2421350 ) ) ( not ( = ?auto_2421348 ?auto_2421351 ) ) ( not ( = ?auto_2421348 ?auto_2421352 ) ) ( not ( = ?auto_2421348 ?auto_2421353 ) ) ( not ( = ?auto_2421348 ?auto_2421354 ) ) ( not ( = ?auto_2421348 ?auto_2421355 ) ) ( not ( = ?auto_2421348 ?auto_2421357 ) ) ( not ( = ?auto_2421349 ?auto_2421350 ) ) ( not ( = ?auto_2421349 ?auto_2421351 ) ) ( not ( = ?auto_2421349 ?auto_2421352 ) ) ( not ( = ?auto_2421349 ?auto_2421353 ) ) ( not ( = ?auto_2421349 ?auto_2421354 ) ) ( not ( = ?auto_2421349 ?auto_2421355 ) ) ( not ( = ?auto_2421349 ?auto_2421357 ) ) ( not ( = ?auto_2421350 ?auto_2421351 ) ) ( not ( = ?auto_2421350 ?auto_2421352 ) ) ( not ( = ?auto_2421350 ?auto_2421353 ) ) ( not ( = ?auto_2421350 ?auto_2421354 ) ) ( not ( = ?auto_2421350 ?auto_2421355 ) ) ( not ( = ?auto_2421350 ?auto_2421357 ) ) ( not ( = ?auto_2421351 ?auto_2421352 ) ) ( not ( = ?auto_2421351 ?auto_2421353 ) ) ( not ( = ?auto_2421351 ?auto_2421354 ) ) ( not ( = ?auto_2421351 ?auto_2421355 ) ) ( not ( = ?auto_2421351 ?auto_2421357 ) ) ( not ( = ?auto_2421352 ?auto_2421353 ) ) ( not ( = ?auto_2421352 ?auto_2421354 ) ) ( not ( = ?auto_2421352 ?auto_2421355 ) ) ( not ( = ?auto_2421352 ?auto_2421357 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421353 ?auto_2421354 ?auto_2421355 )
      ( MAKE-11CRATE-VERIFY ?auto_2421344 ?auto_2421345 ?auto_2421346 ?auto_2421347 ?auto_2421348 ?auto_2421349 ?auto_2421350 ?auto_2421351 ?auto_2421352 ?auto_2421353 ?auto_2421354 ?auto_2421355 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2421362 - SURFACE
      ?auto_2421363 - SURFACE
    )
    :vars
    (
      ?auto_2421368 - HOIST
      ?auto_2421370 - PLACE
      ?auto_2421369 - SURFACE
      ?auto_2421364 - PLACE
      ?auto_2421366 - HOIST
      ?auto_2421365 - SURFACE
      ?auto_2421367 - TRUCK
      ?auto_2421371 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421368 ?auto_2421370 ) ( IS-CRATE ?auto_2421363 ) ( not ( = ?auto_2421362 ?auto_2421363 ) ) ( not ( = ?auto_2421369 ?auto_2421362 ) ) ( not ( = ?auto_2421369 ?auto_2421363 ) ) ( not ( = ?auto_2421364 ?auto_2421370 ) ) ( HOIST-AT ?auto_2421366 ?auto_2421364 ) ( not ( = ?auto_2421368 ?auto_2421366 ) ) ( SURFACE-AT ?auto_2421363 ?auto_2421364 ) ( ON ?auto_2421363 ?auto_2421365 ) ( CLEAR ?auto_2421363 ) ( not ( = ?auto_2421362 ?auto_2421365 ) ) ( not ( = ?auto_2421363 ?auto_2421365 ) ) ( not ( = ?auto_2421369 ?auto_2421365 ) ) ( SURFACE-AT ?auto_2421369 ?auto_2421370 ) ( CLEAR ?auto_2421369 ) ( IS-CRATE ?auto_2421362 ) ( AVAILABLE ?auto_2421368 ) ( TRUCK-AT ?auto_2421367 ?auto_2421364 ) ( AVAILABLE ?auto_2421366 ) ( SURFACE-AT ?auto_2421362 ?auto_2421364 ) ( ON ?auto_2421362 ?auto_2421371 ) ( CLEAR ?auto_2421362 ) ( not ( = ?auto_2421362 ?auto_2421371 ) ) ( not ( = ?auto_2421363 ?auto_2421371 ) ) ( not ( = ?auto_2421369 ?auto_2421371 ) ) ( not ( = ?auto_2421365 ?auto_2421371 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2421366 ?auto_2421362 ?auto_2421371 ?auto_2421364 )
      ( MAKE-2CRATE ?auto_2421369 ?auto_2421362 ?auto_2421363 )
      ( MAKE-1CRATE-VERIFY ?auto_2421362 ?auto_2421363 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2421372 - SURFACE
      ?auto_2421373 - SURFACE
      ?auto_2421374 - SURFACE
    )
    :vars
    (
      ?auto_2421379 - HOIST
      ?auto_2421376 - PLACE
      ?auto_2421375 - PLACE
      ?auto_2421377 - HOIST
      ?auto_2421378 - SURFACE
      ?auto_2421381 - TRUCK
      ?auto_2421380 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421379 ?auto_2421376 ) ( IS-CRATE ?auto_2421374 ) ( not ( = ?auto_2421373 ?auto_2421374 ) ) ( not ( = ?auto_2421372 ?auto_2421373 ) ) ( not ( = ?auto_2421372 ?auto_2421374 ) ) ( not ( = ?auto_2421375 ?auto_2421376 ) ) ( HOIST-AT ?auto_2421377 ?auto_2421375 ) ( not ( = ?auto_2421379 ?auto_2421377 ) ) ( SURFACE-AT ?auto_2421374 ?auto_2421375 ) ( ON ?auto_2421374 ?auto_2421378 ) ( CLEAR ?auto_2421374 ) ( not ( = ?auto_2421373 ?auto_2421378 ) ) ( not ( = ?auto_2421374 ?auto_2421378 ) ) ( not ( = ?auto_2421372 ?auto_2421378 ) ) ( SURFACE-AT ?auto_2421372 ?auto_2421376 ) ( CLEAR ?auto_2421372 ) ( IS-CRATE ?auto_2421373 ) ( AVAILABLE ?auto_2421379 ) ( TRUCK-AT ?auto_2421381 ?auto_2421375 ) ( AVAILABLE ?auto_2421377 ) ( SURFACE-AT ?auto_2421373 ?auto_2421375 ) ( ON ?auto_2421373 ?auto_2421380 ) ( CLEAR ?auto_2421373 ) ( not ( = ?auto_2421373 ?auto_2421380 ) ) ( not ( = ?auto_2421374 ?auto_2421380 ) ) ( not ( = ?auto_2421372 ?auto_2421380 ) ) ( not ( = ?auto_2421378 ?auto_2421380 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2421373 ?auto_2421374 )
      ( MAKE-2CRATE-VERIFY ?auto_2421372 ?auto_2421373 ?auto_2421374 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2421382 - SURFACE
      ?auto_2421383 - SURFACE
      ?auto_2421384 - SURFACE
      ?auto_2421385 - SURFACE
    )
    :vars
    (
      ?auto_2421390 - HOIST
      ?auto_2421392 - PLACE
      ?auto_2421391 - PLACE
      ?auto_2421389 - HOIST
      ?auto_2421388 - SURFACE
      ?auto_2421386 - TRUCK
      ?auto_2421387 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421390 ?auto_2421392 ) ( IS-CRATE ?auto_2421385 ) ( not ( = ?auto_2421384 ?auto_2421385 ) ) ( not ( = ?auto_2421383 ?auto_2421384 ) ) ( not ( = ?auto_2421383 ?auto_2421385 ) ) ( not ( = ?auto_2421391 ?auto_2421392 ) ) ( HOIST-AT ?auto_2421389 ?auto_2421391 ) ( not ( = ?auto_2421390 ?auto_2421389 ) ) ( SURFACE-AT ?auto_2421385 ?auto_2421391 ) ( ON ?auto_2421385 ?auto_2421388 ) ( CLEAR ?auto_2421385 ) ( not ( = ?auto_2421384 ?auto_2421388 ) ) ( not ( = ?auto_2421385 ?auto_2421388 ) ) ( not ( = ?auto_2421383 ?auto_2421388 ) ) ( SURFACE-AT ?auto_2421383 ?auto_2421392 ) ( CLEAR ?auto_2421383 ) ( IS-CRATE ?auto_2421384 ) ( AVAILABLE ?auto_2421390 ) ( TRUCK-AT ?auto_2421386 ?auto_2421391 ) ( AVAILABLE ?auto_2421389 ) ( SURFACE-AT ?auto_2421384 ?auto_2421391 ) ( ON ?auto_2421384 ?auto_2421387 ) ( CLEAR ?auto_2421384 ) ( not ( = ?auto_2421384 ?auto_2421387 ) ) ( not ( = ?auto_2421385 ?auto_2421387 ) ) ( not ( = ?auto_2421383 ?auto_2421387 ) ) ( not ( = ?auto_2421388 ?auto_2421387 ) ) ( ON ?auto_2421383 ?auto_2421382 ) ( not ( = ?auto_2421382 ?auto_2421383 ) ) ( not ( = ?auto_2421382 ?auto_2421384 ) ) ( not ( = ?auto_2421382 ?auto_2421385 ) ) ( not ( = ?auto_2421382 ?auto_2421388 ) ) ( not ( = ?auto_2421382 ?auto_2421387 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421383 ?auto_2421384 ?auto_2421385 )
      ( MAKE-3CRATE-VERIFY ?auto_2421382 ?auto_2421383 ?auto_2421384 ?auto_2421385 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2421393 - SURFACE
      ?auto_2421394 - SURFACE
      ?auto_2421395 - SURFACE
      ?auto_2421396 - SURFACE
      ?auto_2421397 - SURFACE
    )
    :vars
    (
      ?auto_2421402 - HOIST
      ?auto_2421404 - PLACE
      ?auto_2421403 - PLACE
      ?auto_2421401 - HOIST
      ?auto_2421400 - SURFACE
      ?auto_2421398 - TRUCK
      ?auto_2421399 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421402 ?auto_2421404 ) ( IS-CRATE ?auto_2421397 ) ( not ( = ?auto_2421396 ?auto_2421397 ) ) ( not ( = ?auto_2421395 ?auto_2421396 ) ) ( not ( = ?auto_2421395 ?auto_2421397 ) ) ( not ( = ?auto_2421403 ?auto_2421404 ) ) ( HOIST-AT ?auto_2421401 ?auto_2421403 ) ( not ( = ?auto_2421402 ?auto_2421401 ) ) ( SURFACE-AT ?auto_2421397 ?auto_2421403 ) ( ON ?auto_2421397 ?auto_2421400 ) ( CLEAR ?auto_2421397 ) ( not ( = ?auto_2421396 ?auto_2421400 ) ) ( not ( = ?auto_2421397 ?auto_2421400 ) ) ( not ( = ?auto_2421395 ?auto_2421400 ) ) ( SURFACE-AT ?auto_2421395 ?auto_2421404 ) ( CLEAR ?auto_2421395 ) ( IS-CRATE ?auto_2421396 ) ( AVAILABLE ?auto_2421402 ) ( TRUCK-AT ?auto_2421398 ?auto_2421403 ) ( AVAILABLE ?auto_2421401 ) ( SURFACE-AT ?auto_2421396 ?auto_2421403 ) ( ON ?auto_2421396 ?auto_2421399 ) ( CLEAR ?auto_2421396 ) ( not ( = ?auto_2421396 ?auto_2421399 ) ) ( not ( = ?auto_2421397 ?auto_2421399 ) ) ( not ( = ?auto_2421395 ?auto_2421399 ) ) ( not ( = ?auto_2421400 ?auto_2421399 ) ) ( ON ?auto_2421394 ?auto_2421393 ) ( ON ?auto_2421395 ?auto_2421394 ) ( not ( = ?auto_2421393 ?auto_2421394 ) ) ( not ( = ?auto_2421393 ?auto_2421395 ) ) ( not ( = ?auto_2421393 ?auto_2421396 ) ) ( not ( = ?auto_2421393 ?auto_2421397 ) ) ( not ( = ?auto_2421393 ?auto_2421400 ) ) ( not ( = ?auto_2421393 ?auto_2421399 ) ) ( not ( = ?auto_2421394 ?auto_2421395 ) ) ( not ( = ?auto_2421394 ?auto_2421396 ) ) ( not ( = ?auto_2421394 ?auto_2421397 ) ) ( not ( = ?auto_2421394 ?auto_2421400 ) ) ( not ( = ?auto_2421394 ?auto_2421399 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421395 ?auto_2421396 ?auto_2421397 )
      ( MAKE-4CRATE-VERIFY ?auto_2421393 ?auto_2421394 ?auto_2421395 ?auto_2421396 ?auto_2421397 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2421405 - SURFACE
      ?auto_2421406 - SURFACE
      ?auto_2421407 - SURFACE
      ?auto_2421408 - SURFACE
      ?auto_2421409 - SURFACE
      ?auto_2421410 - SURFACE
    )
    :vars
    (
      ?auto_2421415 - HOIST
      ?auto_2421417 - PLACE
      ?auto_2421416 - PLACE
      ?auto_2421414 - HOIST
      ?auto_2421413 - SURFACE
      ?auto_2421411 - TRUCK
      ?auto_2421412 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421415 ?auto_2421417 ) ( IS-CRATE ?auto_2421410 ) ( not ( = ?auto_2421409 ?auto_2421410 ) ) ( not ( = ?auto_2421408 ?auto_2421409 ) ) ( not ( = ?auto_2421408 ?auto_2421410 ) ) ( not ( = ?auto_2421416 ?auto_2421417 ) ) ( HOIST-AT ?auto_2421414 ?auto_2421416 ) ( not ( = ?auto_2421415 ?auto_2421414 ) ) ( SURFACE-AT ?auto_2421410 ?auto_2421416 ) ( ON ?auto_2421410 ?auto_2421413 ) ( CLEAR ?auto_2421410 ) ( not ( = ?auto_2421409 ?auto_2421413 ) ) ( not ( = ?auto_2421410 ?auto_2421413 ) ) ( not ( = ?auto_2421408 ?auto_2421413 ) ) ( SURFACE-AT ?auto_2421408 ?auto_2421417 ) ( CLEAR ?auto_2421408 ) ( IS-CRATE ?auto_2421409 ) ( AVAILABLE ?auto_2421415 ) ( TRUCK-AT ?auto_2421411 ?auto_2421416 ) ( AVAILABLE ?auto_2421414 ) ( SURFACE-AT ?auto_2421409 ?auto_2421416 ) ( ON ?auto_2421409 ?auto_2421412 ) ( CLEAR ?auto_2421409 ) ( not ( = ?auto_2421409 ?auto_2421412 ) ) ( not ( = ?auto_2421410 ?auto_2421412 ) ) ( not ( = ?auto_2421408 ?auto_2421412 ) ) ( not ( = ?auto_2421413 ?auto_2421412 ) ) ( ON ?auto_2421406 ?auto_2421405 ) ( ON ?auto_2421407 ?auto_2421406 ) ( ON ?auto_2421408 ?auto_2421407 ) ( not ( = ?auto_2421405 ?auto_2421406 ) ) ( not ( = ?auto_2421405 ?auto_2421407 ) ) ( not ( = ?auto_2421405 ?auto_2421408 ) ) ( not ( = ?auto_2421405 ?auto_2421409 ) ) ( not ( = ?auto_2421405 ?auto_2421410 ) ) ( not ( = ?auto_2421405 ?auto_2421413 ) ) ( not ( = ?auto_2421405 ?auto_2421412 ) ) ( not ( = ?auto_2421406 ?auto_2421407 ) ) ( not ( = ?auto_2421406 ?auto_2421408 ) ) ( not ( = ?auto_2421406 ?auto_2421409 ) ) ( not ( = ?auto_2421406 ?auto_2421410 ) ) ( not ( = ?auto_2421406 ?auto_2421413 ) ) ( not ( = ?auto_2421406 ?auto_2421412 ) ) ( not ( = ?auto_2421407 ?auto_2421408 ) ) ( not ( = ?auto_2421407 ?auto_2421409 ) ) ( not ( = ?auto_2421407 ?auto_2421410 ) ) ( not ( = ?auto_2421407 ?auto_2421413 ) ) ( not ( = ?auto_2421407 ?auto_2421412 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421408 ?auto_2421409 ?auto_2421410 )
      ( MAKE-5CRATE-VERIFY ?auto_2421405 ?auto_2421406 ?auto_2421407 ?auto_2421408 ?auto_2421409 ?auto_2421410 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2421418 - SURFACE
      ?auto_2421419 - SURFACE
      ?auto_2421420 - SURFACE
      ?auto_2421421 - SURFACE
      ?auto_2421422 - SURFACE
      ?auto_2421423 - SURFACE
      ?auto_2421424 - SURFACE
    )
    :vars
    (
      ?auto_2421429 - HOIST
      ?auto_2421431 - PLACE
      ?auto_2421430 - PLACE
      ?auto_2421428 - HOIST
      ?auto_2421427 - SURFACE
      ?auto_2421425 - TRUCK
      ?auto_2421426 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421429 ?auto_2421431 ) ( IS-CRATE ?auto_2421424 ) ( not ( = ?auto_2421423 ?auto_2421424 ) ) ( not ( = ?auto_2421422 ?auto_2421423 ) ) ( not ( = ?auto_2421422 ?auto_2421424 ) ) ( not ( = ?auto_2421430 ?auto_2421431 ) ) ( HOIST-AT ?auto_2421428 ?auto_2421430 ) ( not ( = ?auto_2421429 ?auto_2421428 ) ) ( SURFACE-AT ?auto_2421424 ?auto_2421430 ) ( ON ?auto_2421424 ?auto_2421427 ) ( CLEAR ?auto_2421424 ) ( not ( = ?auto_2421423 ?auto_2421427 ) ) ( not ( = ?auto_2421424 ?auto_2421427 ) ) ( not ( = ?auto_2421422 ?auto_2421427 ) ) ( SURFACE-AT ?auto_2421422 ?auto_2421431 ) ( CLEAR ?auto_2421422 ) ( IS-CRATE ?auto_2421423 ) ( AVAILABLE ?auto_2421429 ) ( TRUCK-AT ?auto_2421425 ?auto_2421430 ) ( AVAILABLE ?auto_2421428 ) ( SURFACE-AT ?auto_2421423 ?auto_2421430 ) ( ON ?auto_2421423 ?auto_2421426 ) ( CLEAR ?auto_2421423 ) ( not ( = ?auto_2421423 ?auto_2421426 ) ) ( not ( = ?auto_2421424 ?auto_2421426 ) ) ( not ( = ?auto_2421422 ?auto_2421426 ) ) ( not ( = ?auto_2421427 ?auto_2421426 ) ) ( ON ?auto_2421419 ?auto_2421418 ) ( ON ?auto_2421420 ?auto_2421419 ) ( ON ?auto_2421421 ?auto_2421420 ) ( ON ?auto_2421422 ?auto_2421421 ) ( not ( = ?auto_2421418 ?auto_2421419 ) ) ( not ( = ?auto_2421418 ?auto_2421420 ) ) ( not ( = ?auto_2421418 ?auto_2421421 ) ) ( not ( = ?auto_2421418 ?auto_2421422 ) ) ( not ( = ?auto_2421418 ?auto_2421423 ) ) ( not ( = ?auto_2421418 ?auto_2421424 ) ) ( not ( = ?auto_2421418 ?auto_2421427 ) ) ( not ( = ?auto_2421418 ?auto_2421426 ) ) ( not ( = ?auto_2421419 ?auto_2421420 ) ) ( not ( = ?auto_2421419 ?auto_2421421 ) ) ( not ( = ?auto_2421419 ?auto_2421422 ) ) ( not ( = ?auto_2421419 ?auto_2421423 ) ) ( not ( = ?auto_2421419 ?auto_2421424 ) ) ( not ( = ?auto_2421419 ?auto_2421427 ) ) ( not ( = ?auto_2421419 ?auto_2421426 ) ) ( not ( = ?auto_2421420 ?auto_2421421 ) ) ( not ( = ?auto_2421420 ?auto_2421422 ) ) ( not ( = ?auto_2421420 ?auto_2421423 ) ) ( not ( = ?auto_2421420 ?auto_2421424 ) ) ( not ( = ?auto_2421420 ?auto_2421427 ) ) ( not ( = ?auto_2421420 ?auto_2421426 ) ) ( not ( = ?auto_2421421 ?auto_2421422 ) ) ( not ( = ?auto_2421421 ?auto_2421423 ) ) ( not ( = ?auto_2421421 ?auto_2421424 ) ) ( not ( = ?auto_2421421 ?auto_2421427 ) ) ( not ( = ?auto_2421421 ?auto_2421426 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421422 ?auto_2421423 ?auto_2421424 )
      ( MAKE-6CRATE-VERIFY ?auto_2421418 ?auto_2421419 ?auto_2421420 ?auto_2421421 ?auto_2421422 ?auto_2421423 ?auto_2421424 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2421432 - SURFACE
      ?auto_2421433 - SURFACE
      ?auto_2421434 - SURFACE
      ?auto_2421435 - SURFACE
      ?auto_2421436 - SURFACE
      ?auto_2421437 - SURFACE
      ?auto_2421438 - SURFACE
      ?auto_2421439 - SURFACE
    )
    :vars
    (
      ?auto_2421444 - HOIST
      ?auto_2421446 - PLACE
      ?auto_2421445 - PLACE
      ?auto_2421443 - HOIST
      ?auto_2421442 - SURFACE
      ?auto_2421440 - TRUCK
      ?auto_2421441 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421444 ?auto_2421446 ) ( IS-CRATE ?auto_2421439 ) ( not ( = ?auto_2421438 ?auto_2421439 ) ) ( not ( = ?auto_2421437 ?auto_2421438 ) ) ( not ( = ?auto_2421437 ?auto_2421439 ) ) ( not ( = ?auto_2421445 ?auto_2421446 ) ) ( HOIST-AT ?auto_2421443 ?auto_2421445 ) ( not ( = ?auto_2421444 ?auto_2421443 ) ) ( SURFACE-AT ?auto_2421439 ?auto_2421445 ) ( ON ?auto_2421439 ?auto_2421442 ) ( CLEAR ?auto_2421439 ) ( not ( = ?auto_2421438 ?auto_2421442 ) ) ( not ( = ?auto_2421439 ?auto_2421442 ) ) ( not ( = ?auto_2421437 ?auto_2421442 ) ) ( SURFACE-AT ?auto_2421437 ?auto_2421446 ) ( CLEAR ?auto_2421437 ) ( IS-CRATE ?auto_2421438 ) ( AVAILABLE ?auto_2421444 ) ( TRUCK-AT ?auto_2421440 ?auto_2421445 ) ( AVAILABLE ?auto_2421443 ) ( SURFACE-AT ?auto_2421438 ?auto_2421445 ) ( ON ?auto_2421438 ?auto_2421441 ) ( CLEAR ?auto_2421438 ) ( not ( = ?auto_2421438 ?auto_2421441 ) ) ( not ( = ?auto_2421439 ?auto_2421441 ) ) ( not ( = ?auto_2421437 ?auto_2421441 ) ) ( not ( = ?auto_2421442 ?auto_2421441 ) ) ( ON ?auto_2421433 ?auto_2421432 ) ( ON ?auto_2421434 ?auto_2421433 ) ( ON ?auto_2421435 ?auto_2421434 ) ( ON ?auto_2421436 ?auto_2421435 ) ( ON ?auto_2421437 ?auto_2421436 ) ( not ( = ?auto_2421432 ?auto_2421433 ) ) ( not ( = ?auto_2421432 ?auto_2421434 ) ) ( not ( = ?auto_2421432 ?auto_2421435 ) ) ( not ( = ?auto_2421432 ?auto_2421436 ) ) ( not ( = ?auto_2421432 ?auto_2421437 ) ) ( not ( = ?auto_2421432 ?auto_2421438 ) ) ( not ( = ?auto_2421432 ?auto_2421439 ) ) ( not ( = ?auto_2421432 ?auto_2421442 ) ) ( not ( = ?auto_2421432 ?auto_2421441 ) ) ( not ( = ?auto_2421433 ?auto_2421434 ) ) ( not ( = ?auto_2421433 ?auto_2421435 ) ) ( not ( = ?auto_2421433 ?auto_2421436 ) ) ( not ( = ?auto_2421433 ?auto_2421437 ) ) ( not ( = ?auto_2421433 ?auto_2421438 ) ) ( not ( = ?auto_2421433 ?auto_2421439 ) ) ( not ( = ?auto_2421433 ?auto_2421442 ) ) ( not ( = ?auto_2421433 ?auto_2421441 ) ) ( not ( = ?auto_2421434 ?auto_2421435 ) ) ( not ( = ?auto_2421434 ?auto_2421436 ) ) ( not ( = ?auto_2421434 ?auto_2421437 ) ) ( not ( = ?auto_2421434 ?auto_2421438 ) ) ( not ( = ?auto_2421434 ?auto_2421439 ) ) ( not ( = ?auto_2421434 ?auto_2421442 ) ) ( not ( = ?auto_2421434 ?auto_2421441 ) ) ( not ( = ?auto_2421435 ?auto_2421436 ) ) ( not ( = ?auto_2421435 ?auto_2421437 ) ) ( not ( = ?auto_2421435 ?auto_2421438 ) ) ( not ( = ?auto_2421435 ?auto_2421439 ) ) ( not ( = ?auto_2421435 ?auto_2421442 ) ) ( not ( = ?auto_2421435 ?auto_2421441 ) ) ( not ( = ?auto_2421436 ?auto_2421437 ) ) ( not ( = ?auto_2421436 ?auto_2421438 ) ) ( not ( = ?auto_2421436 ?auto_2421439 ) ) ( not ( = ?auto_2421436 ?auto_2421442 ) ) ( not ( = ?auto_2421436 ?auto_2421441 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421437 ?auto_2421438 ?auto_2421439 )
      ( MAKE-7CRATE-VERIFY ?auto_2421432 ?auto_2421433 ?auto_2421434 ?auto_2421435 ?auto_2421436 ?auto_2421437 ?auto_2421438 ?auto_2421439 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2421447 - SURFACE
      ?auto_2421448 - SURFACE
      ?auto_2421449 - SURFACE
      ?auto_2421450 - SURFACE
      ?auto_2421451 - SURFACE
      ?auto_2421452 - SURFACE
      ?auto_2421453 - SURFACE
      ?auto_2421454 - SURFACE
      ?auto_2421455 - SURFACE
    )
    :vars
    (
      ?auto_2421460 - HOIST
      ?auto_2421462 - PLACE
      ?auto_2421461 - PLACE
      ?auto_2421459 - HOIST
      ?auto_2421458 - SURFACE
      ?auto_2421456 - TRUCK
      ?auto_2421457 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421460 ?auto_2421462 ) ( IS-CRATE ?auto_2421455 ) ( not ( = ?auto_2421454 ?auto_2421455 ) ) ( not ( = ?auto_2421453 ?auto_2421454 ) ) ( not ( = ?auto_2421453 ?auto_2421455 ) ) ( not ( = ?auto_2421461 ?auto_2421462 ) ) ( HOIST-AT ?auto_2421459 ?auto_2421461 ) ( not ( = ?auto_2421460 ?auto_2421459 ) ) ( SURFACE-AT ?auto_2421455 ?auto_2421461 ) ( ON ?auto_2421455 ?auto_2421458 ) ( CLEAR ?auto_2421455 ) ( not ( = ?auto_2421454 ?auto_2421458 ) ) ( not ( = ?auto_2421455 ?auto_2421458 ) ) ( not ( = ?auto_2421453 ?auto_2421458 ) ) ( SURFACE-AT ?auto_2421453 ?auto_2421462 ) ( CLEAR ?auto_2421453 ) ( IS-CRATE ?auto_2421454 ) ( AVAILABLE ?auto_2421460 ) ( TRUCK-AT ?auto_2421456 ?auto_2421461 ) ( AVAILABLE ?auto_2421459 ) ( SURFACE-AT ?auto_2421454 ?auto_2421461 ) ( ON ?auto_2421454 ?auto_2421457 ) ( CLEAR ?auto_2421454 ) ( not ( = ?auto_2421454 ?auto_2421457 ) ) ( not ( = ?auto_2421455 ?auto_2421457 ) ) ( not ( = ?auto_2421453 ?auto_2421457 ) ) ( not ( = ?auto_2421458 ?auto_2421457 ) ) ( ON ?auto_2421448 ?auto_2421447 ) ( ON ?auto_2421449 ?auto_2421448 ) ( ON ?auto_2421450 ?auto_2421449 ) ( ON ?auto_2421451 ?auto_2421450 ) ( ON ?auto_2421452 ?auto_2421451 ) ( ON ?auto_2421453 ?auto_2421452 ) ( not ( = ?auto_2421447 ?auto_2421448 ) ) ( not ( = ?auto_2421447 ?auto_2421449 ) ) ( not ( = ?auto_2421447 ?auto_2421450 ) ) ( not ( = ?auto_2421447 ?auto_2421451 ) ) ( not ( = ?auto_2421447 ?auto_2421452 ) ) ( not ( = ?auto_2421447 ?auto_2421453 ) ) ( not ( = ?auto_2421447 ?auto_2421454 ) ) ( not ( = ?auto_2421447 ?auto_2421455 ) ) ( not ( = ?auto_2421447 ?auto_2421458 ) ) ( not ( = ?auto_2421447 ?auto_2421457 ) ) ( not ( = ?auto_2421448 ?auto_2421449 ) ) ( not ( = ?auto_2421448 ?auto_2421450 ) ) ( not ( = ?auto_2421448 ?auto_2421451 ) ) ( not ( = ?auto_2421448 ?auto_2421452 ) ) ( not ( = ?auto_2421448 ?auto_2421453 ) ) ( not ( = ?auto_2421448 ?auto_2421454 ) ) ( not ( = ?auto_2421448 ?auto_2421455 ) ) ( not ( = ?auto_2421448 ?auto_2421458 ) ) ( not ( = ?auto_2421448 ?auto_2421457 ) ) ( not ( = ?auto_2421449 ?auto_2421450 ) ) ( not ( = ?auto_2421449 ?auto_2421451 ) ) ( not ( = ?auto_2421449 ?auto_2421452 ) ) ( not ( = ?auto_2421449 ?auto_2421453 ) ) ( not ( = ?auto_2421449 ?auto_2421454 ) ) ( not ( = ?auto_2421449 ?auto_2421455 ) ) ( not ( = ?auto_2421449 ?auto_2421458 ) ) ( not ( = ?auto_2421449 ?auto_2421457 ) ) ( not ( = ?auto_2421450 ?auto_2421451 ) ) ( not ( = ?auto_2421450 ?auto_2421452 ) ) ( not ( = ?auto_2421450 ?auto_2421453 ) ) ( not ( = ?auto_2421450 ?auto_2421454 ) ) ( not ( = ?auto_2421450 ?auto_2421455 ) ) ( not ( = ?auto_2421450 ?auto_2421458 ) ) ( not ( = ?auto_2421450 ?auto_2421457 ) ) ( not ( = ?auto_2421451 ?auto_2421452 ) ) ( not ( = ?auto_2421451 ?auto_2421453 ) ) ( not ( = ?auto_2421451 ?auto_2421454 ) ) ( not ( = ?auto_2421451 ?auto_2421455 ) ) ( not ( = ?auto_2421451 ?auto_2421458 ) ) ( not ( = ?auto_2421451 ?auto_2421457 ) ) ( not ( = ?auto_2421452 ?auto_2421453 ) ) ( not ( = ?auto_2421452 ?auto_2421454 ) ) ( not ( = ?auto_2421452 ?auto_2421455 ) ) ( not ( = ?auto_2421452 ?auto_2421458 ) ) ( not ( = ?auto_2421452 ?auto_2421457 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421453 ?auto_2421454 ?auto_2421455 )
      ( MAKE-8CRATE-VERIFY ?auto_2421447 ?auto_2421448 ?auto_2421449 ?auto_2421450 ?auto_2421451 ?auto_2421452 ?auto_2421453 ?auto_2421454 ?auto_2421455 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2421463 - SURFACE
      ?auto_2421464 - SURFACE
      ?auto_2421465 - SURFACE
      ?auto_2421466 - SURFACE
      ?auto_2421467 - SURFACE
      ?auto_2421468 - SURFACE
      ?auto_2421469 - SURFACE
      ?auto_2421470 - SURFACE
      ?auto_2421471 - SURFACE
      ?auto_2421472 - SURFACE
    )
    :vars
    (
      ?auto_2421477 - HOIST
      ?auto_2421479 - PLACE
      ?auto_2421478 - PLACE
      ?auto_2421476 - HOIST
      ?auto_2421475 - SURFACE
      ?auto_2421473 - TRUCK
      ?auto_2421474 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421477 ?auto_2421479 ) ( IS-CRATE ?auto_2421472 ) ( not ( = ?auto_2421471 ?auto_2421472 ) ) ( not ( = ?auto_2421470 ?auto_2421471 ) ) ( not ( = ?auto_2421470 ?auto_2421472 ) ) ( not ( = ?auto_2421478 ?auto_2421479 ) ) ( HOIST-AT ?auto_2421476 ?auto_2421478 ) ( not ( = ?auto_2421477 ?auto_2421476 ) ) ( SURFACE-AT ?auto_2421472 ?auto_2421478 ) ( ON ?auto_2421472 ?auto_2421475 ) ( CLEAR ?auto_2421472 ) ( not ( = ?auto_2421471 ?auto_2421475 ) ) ( not ( = ?auto_2421472 ?auto_2421475 ) ) ( not ( = ?auto_2421470 ?auto_2421475 ) ) ( SURFACE-AT ?auto_2421470 ?auto_2421479 ) ( CLEAR ?auto_2421470 ) ( IS-CRATE ?auto_2421471 ) ( AVAILABLE ?auto_2421477 ) ( TRUCK-AT ?auto_2421473 ?auto_2421478 ) ( AVAILABLE ?auto_2421476 ) ( SURFACE-AT ?auto_2421471 ?auto_2421478 ) ( ON ?auto_2421471 ?auto_2421474 ) ( CLEAR ?auto_2421471 ) ( not ( = ?auto_2421471 ?auto_2421474 ) ) ( not ( = ?auto_2421472 ?auto_2421474 ) ) ( not ( = ?auto_2421470 ?auto_2421474 ) ) ( not ( = ?auto_2421475 ?auto_2421474 ) ) ( ON ?auto_2421464 ?auto_2421463 ) ( ON ?auto_2421465 ?auto_2421464 ) ( ON ?auto_2421466 ?auto_2421465 ) ( ON ?auto_2421467 ?auto_2421466 ) ( ON ?auto_2421468 ?auto_2421467 ) ( ON ?auto_2421469 ?auto_2421468 ) ( ON ?auto_2421470 ?auto_2421469 ) ( not ( = ?auto_2421463 ?auto_2421464 ) ) ( not ( = ?auto_2421463 ?auto_2421465 ) ) ( not ( = ?auto_2421463 ?auto_2421466 ) ) ( not ( = ?auto_2421463 ?auto_2421467 ) ) ( not ( = ?auto_2421463 ?auto_2421468 ) ) ( not ( = ?auto_2421463 ?auto_2421469 ) ) ( not ( = ?auto_2421463 ?auto_2421470 ) ) ( not ( = ?auto_2421463 ?auto_2421471 ) ) ( not ( = ?auto_2421463 ?auto_2421472 ) ) ( not ( = ?auto_2421463 ?auto_2421475 ) ) ( not ( = ?auto_2421463 ?auto_2421474 ) ) ( not ( = ?auto_2421464 ?auto_2421465 ) ) ( not ( = ?auto_2421464 ?auto_2421466 ) ) ( not ( = ?auto_2421464 ?auto_2421467 ) ) ( not ( = ?auto_2421464 ?auto_2421468 ) ) ( not ( = ?auto_2421464 ?auto_2421469 ) ) ( not ( = ?auto_2421464 ?auto_2421470 ) ) ( not ( = ?auto_2421464 ?auto_2421471 ) ) ( not ( = ?auto_2421464 ?auto_2421472 ) ) ( not ( = ?auto_2421464 ?auto_2421475 ) ) ( not ( = ?auto_2421464 ?auto_2421474 ) ) ( not ( = ?auto_2421465 ?auto_2421466 ) ) ( not ( = ?auto_2421465 ?auto_2421467 ) ) ( not ( = ?auto_2421465 ?auto_2421468 ) ) ( not ( = ?auto_2421465 ?auto_2421469 ) ) ( not ( = ?auto_2421465 ?auto_2421470 ) ) ( not ( = ?auto_2421465 ?auto_2421471 ) ) ( not ( = ?auto_2421465 ?auto_2421472 ) ) ( not ( = ?auto_2421465 ?auto_2421475 ) ) ( not ( = ?auto_2421465 ?auto_2421474 ) ) ( not ( = ?auto_2421466 ?auto_2421467 ) ) ( not ( = ?auto_2421466 ?auto_2421468 ) ) ( not ( = ?auto_2421466 ?auto_2421469 ) ) ( not ( = ?auto_2421466 ?auto_2421470 ) ) ( not ( = ?auto_2421466 ?auto_2421471 ) ) ( not ( = ?auto_2421466 ?auto_2421472 ) ) ( not ( = ?auto_2421466 ?auto_2421475 ) ) ( not ( = ?auto_2421466 ?auto_2421474 ) ) ( not ( = ?auto_2421467 ?auto_2421468 ) ) ( not ( = ?auto_2421467 ?auto_2421469 ) ) ( not ( = ?auto_2421467 ?auto_2421470 ) ) ( not ( = ?auto_2421467 ?auto_2421471 ) ) ( not ( = ?auto_2421467 ?auto_2421472 ) ) ( not ( = ?auto_2421467 ?auto_2421475 ) ) ( not ( = ?auto_2421467 ?auto_2421474 ) ) ( not ( = ?auto_2421468 ?auto_2421469 ) ) ( not ( = ?auto_2421468 ?auto_2421470 ) ) ( not ( = ?auto_2421468 ?auto_2421471 ) ) ( not ( = ?auto_2421468 ?auto_2421472 ) ) ( not ( = ?auto_2421468 ?auto_2421475 ) ) ( not ( = ?auto_2421468 ?auto_2421474 ) ) ( not ( = ?auto_2421469 ?auto_2421470 ) ) ( not ( = ?auto_2421469 ?auto_2421471 ) ) ( not ( = ?auto_2421469 ?auto_2421472 ) ) ( not ( = ?auto_2421469 ?auto_2421475 ) ) ( not ( = ?auto_2421469 ?auto_2421474 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421470 ?auto_2421471 ?auto_2421472 )
      ( MAKE-9CRATE-VERIFY ?auto_2421463 ?auto_2421464 ?auto_2421465 ?auto_2421466 ?auto_2421467 ?auto_2421468 ?auto_2421469 ?auto_2421470 ?auto_2421471 ?auto_2421472 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2421480 - SURFACE
      ?auto_2421481 - SURFACE
      ?auto_2421482 - SURFACE
      ?auto_2421483 - SURFACE
      ?auto_2421484 - SURFACE
      ?auto_2421485 - SURFACE
      ?auto_2421486 - SURFACE
      ?auto_2421487 - SURFACE
      ?auto_2421488 - SURFACE
      ?auto_2421489 - SURFACE
      ?auto_2421490 - SURFACE
    )
    :vars
    (
      ?auto_2421495 - HOIST
      ?auto_2421497 - PLACE
      ?auto_2421496 - PLACE
      ?auto_2421494 - HOIST
      ?auto_2421493 - SURFACE
      ?auto_2421491 - TRUCK
      ?auto_2421492 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421495 ?auto_2421497 ) ( IS-CRATE ?auto_2421490 ) ( not ( = ?auto_2421489 ?auto_2421490 ) ) ( not ( = ?auto_2421488 ?auto_2421489 ) ) ( not ( = ?auto_2421488 ?auto_2421490 ) ) ( not ( = ?auto_2421496 ?auto_2421497 ) ) ( HOIST-AT ?auto_2421494 ?auto_2421496 ) ( not ( = ?auto_2421495 ?auto_2421494 ) ) ( SURFACE-AT ?auto_2421490 ?auto_2421496 ) ( ON ?auto_2421490 ?auto_2421493 ) ( CLEAR ?auto_2421490 ) ( not ( = ?auto_2421489 ?auto_2421493 ) ) ( not ( = ?auto_2421490 ?auto_2421493 ) ) ( not ( = ?auto_2421488 ?auto_2421493 ) ) ( SURFACE-AT ?auto_2421488 ?auto_2421497 ) ( CLEAR ?auto_2421488 ) ( IS-CRATE ?auto_2421489 ) ( AVAILABLE ?auto_2421495 ) ( TRUCK-AT ?auto_2421491 ?auto_2421496 ) ( AVAILABLE ?auto_2421494 ) ( SURFACE-AT ?auto_2421489 ?auto_2421496 ) ( ON ?auto_2421489 ?auto_2421492 ) ( CLEAR ?auto_2421489 ) ( not ( = ?auto_2421489 ?auto_2421492 ) ) ( not ( = ?auto_2421490 ?auto_2421492 ) ) ( not ( = ?auto_2421488 ?auto_2421492 ) ) ( not ( = ?auto_2421493 ?auto_2421492 ) ) ( ON ?auto_2421481 ?auto_2421480 ) ( ON ?auto_2421482 ?auto_2421481 ) ( ON ?auto_2421483 ?auto_2421482 ) ( ON ?auto_2421484 ?auto_2421483 ) ( ON ?auto_2421485 ?auto_2421484 ) ( ON ?auto_2421486 ?auto_2421485 ) ( ON ?auto_2421487 ?auto_2421486 ) ( ON ?auto_2421488 ?auto_2421487 ) ( not ( = ?auto_2421480 ?auto_2421481 ) ) ( not ( = ?auto_2421480 ?auto_2421482 ) ) ( not ( = ?auto_2421480 ?auto_2421483 ) ) ( not ( = ?auto_2421480 ?auto_2421484 ) ) ( not ( = ?auto_2421480 ?auto_2421485 ) ) ( not ( = ?auto_2421480 ?auto_2421486 ) ) ( not ( = ?auto_2421480 ?auto_2421487 ) ) ( not ( = ?auto_2421480 ?auto_2421488 ) ) ( not ( = ?auto_2421480 ?auto_2421489 ) ) ( not ( = ?auto_2421480 ?auto_2421490 ) ) ( not ( = ?auto_2421480 ?auto_2421493 ) ) ( not ( = ?auto_2421480 ?auto_2421492 ) ) ( not ( = ?auto_2421481 ?auto_2421482 ) ) ( not ( = ?auto_2421481 ?auto_2421483 ) ) ( not ( = ?auto_2421481 ?auto_2421484 ) ) ( not ( = ?auto_2421481 ?auto_2421485 ) ) ( not ( = ?auto_2421481 ?auto_2421486 ) ) ( not ( = ?auto_2421481 ?auto_2421487 ) ) ( not ( = ?auto_2421481 ?auto_2421488 ) ) ( not ( = ?auto_2421481 ?auto_2421489 ) ) ( not ( = ?auto_2421481 ?auto_2421490 ) ) ( not ( = ?auto_2421481 ?auto_2421493 ) ) ( not ( = ?auto_2421481 ?auto_2421492 ) ) ( not ( = ?auto_2421482 ?auto_2421483 ) ) ( not ( = ?auto_2421482 ?auto_2421484 ) ) ( not ( = ?auto_2421482 ?auto_2421485 ) ) ( not ( = ?auto_2421482 ?auto_2421486 ) ) ( not ( = ?auto_2421482 ?auto_2421487 ) ) ( not ( = ?auto_2421482 ?auto_2421488 ) ) ( not ( = ?auto_2421482 ?auto_2421489 ) ) ( not ( = ?auto_2421482 ?auto_2421490 ) ) ( not ( = ?auto_2421482 ?auto_2421493 ) ) ( not ( = ?auto_2421482 ?auto_2421492 ) ) ( not ( = ?auto_2421483 ?auto_2421484 ) ) ( not ( = ?auto_2421483 ?auto_2421485 ) ) ( not ( = ?auto_2421483 ?auto_2421486 ) ) ( not ( = ?auto_2421483 ?auto_2421487 ) ) ( not ( = ?auto_2421483 ?auto_2421488 ) ) ( not ( = ?auto_2421483 ?auto_2421489 ) ) ( not ( = ?auto_2421483 ?auto_2421490 ) ) ( not ( = ?auto_2421483 ?auto_2421493 ) ) ( not ( = ?auto_2421483 ?auto_2421492 ) ) ( not ( = ?auto_2421484 ?auto_2421485 ) ) ( not ( = ?auto_2421484 ?auto_2421486 ) ) ( not ( = ?auto_2421484 ?auto_2421487 ) ) ( not ( = ?auto_2421484 ?auto_2421488 ) ) ( not ( = ?auto_2421484 ?auto_2421489 ) ) ( not ( = ?auto_2421484 ?auto_2421490 ) ) ( not ( = ?auto_2421484 ?auto_2421493 ) ) ( not ( = ?auto_2421484 ?auto_2421492 ) ) ( not ( = ?auto_2421485 ?auto_2421486 ) ) ( not ( = ?auto_2421485 ?auto_2421487 ) ) ( not ( = ?auto_2421485 ?auto_2421488 ) ) ( not ( = ?auto_2421485 ?auto_2421489 ) ) ( not ( = ?auto_2421485 ?auto_2421490 ) ) ( not ( = ?auto_2421485 ?auto_2421493 ) ) ( not ( = ?auto_2421485 ?auto_2421492 ) ) ( not ( = ?auto_2421486 ?auto_2421487 ) ) ( not ( = ?auto_2421486 ?auto_2421488 ) ) ( not ( = ?auto_2421486 ?auto_2421489 ) ) ( not ( = ?auto_2421486 ?auto_2421490 ) ) ( not ( = ?auto_2421486 ?auto_2421493 ) ) ( not ( = ?auto_2421486 ?auto_2421492 ) ) ( not ( = ?auto_2421487 ?auto_2421488 ) ) ( not ( = ?auto_2421487 ?auto_2421489 ) ) ( not ( = ?auto_2421487 ?auto_2421490 ) ) ( not ( = ?auto_2421487 ?auto_2421493 ) ) ( not ( = ?auto_2421487 ?auto_2421492 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421488 ?auto_2421489 ?auto_2421490 )
      ( MAKE-10CRATE-VERIFY ?auto_2421480 ?auto_2421481 ?auto_2421482 ?auto_2421483 ?auto_2421484 ?auto_2421485 ?auto_2421486 ?auto_2421487 ?auto_2421488 ?auto_2421489 ?auto_2421490 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2421498 - SURFACE
      ?auto_2421499 - SURFACE
      ?auto_2421500 - SURFACE
      ?auto_2421501 - SURFACE
      ?auto_2421502 - SURFACE
      ?auto_2421503 - SURFACE
      ?auto_2421504 - SURFACE
      ?auto_2421505 - SURFACE
      ?auto_2421506 - SURFACE
      ?auto_2421507 - SURFACE
      ?auto_2421508 - SURFACE
      ?auto_2421509 - SURFACE
    )
    :vars
    (
      ?auto_2421514 - HOIST
      ?auto_2421516 - PLACE
      ?auto_2421515 - PLACE
      ?auto_2421513 - HOIST
      ?auto_2421512 - SURFACE
      ?auto_2421510 - TRUCK
      ?auto_2421511 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421514 ?auto_2421516 ) ( IS-CRATE ?auto_2421509 ) ( not ( = ?auto_2421508 ?auto_2421509 ) ) ( not ( = ?auto_2421507 ?auto_2421508 ) ) ( not ( = ?auto_2421507 ?auto_2421509 ) ) ( not ( = ?auto_2421515 ?auto_2421516 ) ) ( HOIST-AT ?auto_2421513 ?auto_2421515 ) ( not ( = ?auto_2421514 ?auto_2421513 ) ) ( SURFACE-AT ?auto_2421509 ?auto_2421515 ) ( ON ?auto_2421509 ?auto_2421512 ) ( CLEAR ?auto_2421509 ) ( not ( = ?auto_2421508 ?auto_2421512 ) ) ( not ( = ?auto_2421509 ?auto_2421512 ) ) ( not ( = ?auto_2421507 ?auto_2421512 ) ) ( SURFACE-AT ?auto_2421507 ?auto_2421516 ) ( CLEAR ?auto_2421507 ) ( IS-CRATE ?auto_2421508 ) ( AVAILABLE ?auto_2421514 ) ( TRUCK-AT ?auto_2421510 ?auto_2421515 ) ( AVAILABLE ?auto_2421513 ) ( SURFACE-AT ?auto_2421508 ?auto_2421515 ) ( ON ?auto_2421508 ?auto_2421511 ) ( CLEAR ?auto_2421508 ) ( not ( = ?auto_2421508 ?auto_2421511 ) ) ( not ( = ?auto_2421509 ?auto_2421511 ) ) ( not ( = ?auto_2421507 ?auto_2421511 ) ) ( not ( = ?auto_2421512 ?auto_2421511 ) ) ( ON ?auto_2421499 ?auto_2421498 ) ( ON ?auto_2421500 ?auto_2421499 ) ( ON ?auto_2421501 ?auto_2421500 ) ( ON ?auto_2421502 ?auto_2421501 ) ( ON ?auto_2421503 ?auto_2421502 ) ( ON ?auto_2421504 ?auto_2421503 ) ( ON ?auto_2421505 ?auto_2421504 ) ( ON ?auto_2421506 ?auto_2421505 ) ( ON ?auto_2421507 ?auto_2421506 ) ( not ( = ?auto_2421498 ?auto_2421499 ) ) ( not ( = ?auto_2421498 ?auto_2421500 ) ) ( not ( = ?auto_2421498 ?auto_2421501 ) ) ( not ( = ?auto_2421498 ?auto_2421502 ) ) ( not ( = ?auto_2421498 ?auto_2421503 ) ) ( not ( = ?auto_2421498 ?auto_2421504 ) ) ( not ( = ?auto_2421498 ?auto_2421505 ) ) ( not ( = ?auto_2421498 ?auto_2421506 ) ) ( not ( = ?auto_2421498 ?auto_2421507 ) ) ( not ( = ?auto_2421498 ?auto_2421508 ) ) ( not ( = ?auto_2421498 ?auto_2421509 ) ) ( not ( = ?auto_2421498 ?auto_2421512 ) ) ( not ( = ?auto_2421498 ?auto_2421511 ) ) ( not ( = ?auto_2421499 ?auto_2421500 ) ) ( not ( = ?auto_2421499 ?auto_2421501 ) ) ( not ( = ?auto_2421499 ?auto_2421502 ) ) ( not ( = ?auto_2421499 ?auto_2421503 ) ) ( not ( = ?auto_2421499 ?auto_2421504 ) ) ( not ( = ?auto_2421499 ?auto_2421505 ) ) ( not ( = ?auto_2421499 ?auto_2421506 ) ) ( not ( = ?auto_2421499 ?auto_2421507 ) ) ( not ( = ?auto_2421499 ?auto_2421508 ) ) ( not ( = ?auto_2421499 ?auto_2421509 ) ) ( not ( = ?auto_2421499 ?auto_2421512 ) ) ( not ( = ?auto_2421499 ?auto_2421511 ) ) ( not ( = ?auto_2421500 ?auto_2421501 ) ) ( not ( = ?auto_2421500 ?auto_2421502 ) ) ( not ( = ?auto_2421500 ?auto_2421503 ) ) ( not ( = ?auto_2421500 ?auto_2421504 ) ) ( not ( = ?auto_2421500 ?auto_2421505 ) ) ( not ( = ?auto_2421500 ?auto_2421506 ) ) ( not ( = ?auto_2421500 ?auto_2421507 ) ) ( not ( = ?auto_2421500 ?auto_2421508 ) ) ( not ( = ?auto_2421500 ?auto_2421509 ) ) ( not ( = ?auto_2421500 ?auto_2421512 ) ) ( not ( = ?auto_2421500 ?auto_2421511 ) ) ( not ( = ?auto_2421501 ?auto_2421502 ) ) ( not ( = ?auto_2421501 ?auto_2421503 ) ) ( not ( = ?auto_2421501 ?auto_2421504 ) ) ( not ( = ?auto_2421501 ?auto_2421505 ) ) ( not ( = ?auto_2421501 ?auto_2421506 ) ) ( not ( = ?auto_2421501 ?auto_2421507 ) ) ( not ( = ?auto_2421501 ?auto_2421508 ) ) ( not ( = ?auto_2421501 ?auto_2421509 ) ) ( not ( = ?auto_2421501 ?auto_2421512 ) ) ( not ( = ?auto_2421501 ?auto_2421511 ) ) ( not ( = ?auto_2421502 ?auto_2421503 ) ) ( not ( = ?auto_2421502 ?auto_2421504 ) ) ( not ( = ?auto_2421502 ?auto_2421505 ) ) ( not ( = ?auto_2421502 ?auto_2421506 ) ) ( not ( = ?auto_2421502 ?auto_2421507 ) ) ( not ( = ?auto_2421502 ?auto_2421508 ) ) ( not ( = ?auto_2421502 ?auto_2421509 ) ) ( not ( = ?auto_2421502 ?auto_2421512 ) ) ( not ( = ?auto_2421502 ?auto_2421511 ) ) ( not ( = ?auto_2421503 ?auto_2421504 ) ) ( not ( = ?auto_2421503 ?auto_2421505 ) ) ( not ( = ?auto_2421503 ?auto_2421506 ) ) ( not ( = ?auto_2421503 ?auto_2421507 ) ) ( not ( = ?auto_2421503 ?auto_2421508 ) ) ( not ( = ?auto_2421503 ?auto_2421509 ) ) ( not ( = ?auto_2421503 ?auto_2421512 ) ) ( not ( = ?auto_2421503 ?auto_2421511 ) ) ( not ( = ?auto_2421504 ?auto_2421505 ) ) ( not ( = ?auto_2421504 ?auto_2421506 ) ) ( not ( = ?auto_2421504 ?auto_2421507 ) ) ( not ( = ?auto_2421504 ?auto_2421508 ) ) ( not ( = ?auto_2421504 ?auto_2421509 ) ) ( not ( = ?auto_2421504 ?auto_2421512 ) ) ( not ( = ?auto_2421504 ?auto_2421511 ) ) ( not ( = ?auto_2421505 ?auto_2421506 ) ) ( not ( = ?auto_2421505 ?auto_2421507 ) ) ( not ( = ?auto_2421505 ?auto_2421508 ) ) ( not ( = ?auto_2421505 ?auto_2421509 ) ) ( not ( = ?auto_2421505 ?auto_2421512 ) ) ( not ( = ?auto_2421505 ?auto_2421511 ) ) ( not ( = ?auto_2421506 ?auto_2421507 ) ) ( not ( = ?auto_2421506 ?auto_2421508 ) ) ( not ( = ?auto_2421506 ?auto_2421509 ) ) ( not ( = ?auto_2421506 ?auto_2421512 ) ) ( not ( = ?auto_2421506 ?auto_2421511 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421507 ?auto_2421508 ?auto_2421509 )
      ( MAKE-11CRATE-VERIFY ?auto_2421498 ?auto_2421499 ?auto_2421500 ?auto_2421501 ?auto_2421502 ?auto_2421503 ?auto_2421504 ?auto_2421505 ?auto_2421506 ?auto_2421507 ?auto_2421508 ?auto_2421509 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2421517 - SURFACE
      ?auto_2421518 - SURFACE
    )
    :vars
    (
      ?auto_2421523 - HOIST
      ?auto_2421525 - PLACE
      ?auto_2421526 - SURFACE
      ?auto_2421524 - PLACE
      ?auto_2421522 - HOIST
      ?auto_2421521 - SURFACE
      ?auto_2421520 - SURFACE
      ?auto_2421519 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421523 ?auto_2421525 ) ( IS-CRATE ?auto_2421518 ) ( not ( = ?auto_2421517 ?auto_2421518 ) ) ( not ( = ?auto_2421526 ?auto_2421517 ) ) ( not ( = ?auto_2421526 ?auto_2421518 ) ) ( not ( = ?auto_2421524 ?auto_2421525 ) ) ( HOIST-AT ?auto_2421522 ?auto_2421524 ) ( not ( = ?auto_2421523 ?auto_2421522 ) ) ( SURFACE-AT ?auto_2421518 ?auto_2421524 ) ( ON ?auto_2421518 ?auto_2421521 ) ( CLEAR ?auto_2421518 ) ( not ( = ?auto_2421517 ?auto_2421521 ) ) ( not ( = ?auto_2421518 ?auto_2421521 ) ) ( not ( = ?auto_2421526 ?auto_2421521 ) ) ( SURFACE-AT ?auto_2421526 ?auto_2421525 ) ( CLEAR ?auto_2421526 ) ( IS-CRATE ?auto_2421517 ) ( AVAILABLE ?auto_2421523 ) ( AVAILABLE ?auto_2421522 ) ( SURFACE-AT ?auto_2421517 ?auto_2421524 ) ( ON ?auto_2421517 ?auto_2421520 ) ( CLEAR ?auto_2421517 ) ( not ( = ?auto_2421517 ?auto_2421520 ) ) ( not ( = ?auto_2421518 ?auto_2421520 ) ) ( not ( = ?auto_2421526 ?auto_2421520 ) ) ( not ( = ?auto_2421521 ?auto_2421520 ) ) ( TRUCK-AT ?auto_2421519 ?auto_2421525 ) )
    :subtasks
    ( ( !DRIVE ?auto_2421519 ?auto_2421525 ?auto_2421524 )
      ( MAKE-2CRATE ?auto_2421526 ?auto_2421517 ?auto_2421518 )
      ( MAKE-1CRATE-VERIFY ?auto_2421517 ?auto_2421518 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2421527 - SURFACE
      ?auto_2421528 - SURFACE
      ?auto_2421529 - SURFACE
    )
    :vars
    (
      ?auto_2421534 - HOIST
      ?auto_2421536 - PLACE
      ?auto_2421533 - PLACE
      ?auto_2421530 - HOIST
      ?auto_2421532 - SURFACE
      ?auto_2421531 - SURFACE
      ?auto_2421535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421534 ?auto_2421536 ) ( IS-CRATE ?auto_2421529 ) ( not ( = ?auto_2421528 ?auto_2421529 ) ) ( not ( = ?auto_2421527 ?auto_2421528 ) ) ( not ( = ?auto_2421527 ?auto_2421529 ) ) ( not ( = ?auto_2421533 ?auto_2421536 ) ) ( HOIST-AT ?auto_2421530 ?auto_2421533 ) ( not ( = ?auto_2421534 ?auto_2421530 ) ) ( SURFACE-AT ?auto_2421529 ?auto_2421533 ) ( ON ?auto_2421529 ?auto_2421532 ) ( CLEAR ?auto_2421529 ) ( not ( = ?auto_2421528 ?auto_2421532 ) ) ( not ( = ?auto_2421529 ?auto_2421532 ) ) ( not ( = ?auto_2421527 ?auto_2421532 ) ) ( SURFACE-AT ?auto_2421527 ?auto_2421536 ) ( CLEAR ?auto_2421527 ) ( IS-CRATE ?auto_2421528 ) ( AVAILABLE ?auto_2421534 ) ( AVAILABLE ?auto_2421530 ) ( SURFACE-AT ?auto_2421528 ?auto_2421533 ) ( ON ?auto_2421528 ?auto_2421531 ) ( CLEAR ?auto_2421528 ) ( not ( = ?auto_2421528 ?auto_2421531 ) ) ( not ( = ?auto_2421529 ?auto_2421531 ) ) ( not ( = ?auto_2421527 ?auto_2421531 ) ) ( not ( = ?auto_2421532 ?auto_2421531 ) ) ( TRUCK-AT ?auto_2421535 ?auto_2421536 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2421528 ?auto_2421529 )
      ( MAKE-2CRATE-VERIFY ?auto_2421527 ?auto_2421528 ?auto_2421529 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2421537 - SURFACE
      ?auto_2421538 - SURFACE
      ?auto_2421539 - SURFACE
      ?auto_2421540 - SURFACE
    )
    :vars
    (
      ?auto_2421547 - HOIST
      ?auto_2421543 - PLACE
      ?auto_2421544 - PLACE
      ?auto_2421542 - HOIST
      ?auto_2421541 - SURFACE
      ?auto_2421546 - SURFACE
      ?auto_2421545 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421547 ?auto_2421543 ) ( IS-CRATE ?auto_2421540 ) ( not ( = ?auto_2421539 ?auto_2421540 ) ) ( not ( = ?auto_2421538 ?auto_2421539 ) ) ( not ( = ?auto_2421538 ?auto_2421540 ) ) ( not ( = ?auto_2421544 ?auto_2421543 ) ) ( HOIST-AT ?auto_2421542 ?auto_2421544 ) ( not ( = ?auto_2421547 ?auto_2421542 ) ) ( SURFACE-AT ?auto_2421540 ?auto_2421544 ) ( ON ?auto_2421540 ?auto_2421541 ) ( CLEAR ?auto_2421540 ) ( not ( = ?auto_2421539 ?auto_2421541 ) ) ( not ( = ?auto_2421540 ?auto_2421541 ) ) ( not ( = ?auto_2421538 ?auto_2421541 ) ) ( SURFACE-AT ?auto_2421538 ?auto_2421543 ) ( CLEAR ?auto_2421538 ) ( IS-CRATE ?auto_2421539 ) ( AVAILABLE ?auto_2421547 ) ( AVAILABLE ?auto_2421542 ) ( SURFACE-AT ?auto_2421539 ?auto_2421544 ) ( ON ?auto_2421539 ?auto_2421546 ) ( CLEAR ?auto_2421539 ) ( not ( = ?auto_2421539 ?auto_2421546 ) ) ( not ( = ?auto_2421540 ?auto_2421546 ) ) ( not ( = ?auto_2421538 ?auto_2421546 ) ) ( not ( = ?auto_2421541 ?auto_2421546 ) ) ( TRUCK-AT ?auto_2421545 ?auto_2421543 ) ( ON ?auto_2421538 ?auto_2421537 ) ( not ( = ?auto_2421537 ?auto_2421538 ) ) ( not ( = ?auto_2421537 ?auto_2421539 ) ) ( not ( = ?auto_2421537 ?auto_2421540 ) ) ( not ( = ?auto_2421537 ?auto_2421541 ) ) ( not ( = ?auto_2421537 ?auto_2421546 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421538 ?auto_2421539 ?auto_2421540 )
      ( MAKE-3CRATE-VERIFY ?auto_2421537 ?auto_2421538 ?auto_2421539 ?auto_2421540 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2421548 - SURFACE
      ?auto_2421549 - SURFACE
      ?auto_2421550 - SURFACE
      ?auto_2421551 - SURFACE
      ?auto_2421552 - SURFACE
    )
    :vars
    (
      ?auto_2421559 - HOIST
      ?auto_2421555 - PLACE
      ?auto_2421556 - PLACE
      ?auto_2421554 - HOIST
      ?auto_2421553 - SURFACE
      ?auto_2421558 - SURFACE
      ?auto_2421557 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421559 ?auto_2421555 ) ( IS-CRATE ?auto_2421552 ) ( not ( = ?auto_2421551 ?auto_2421552 ) ) ( not ( = ?auto_2421550 ?auto_2421551 ) ) ( not ( = ?auto_2421550 ?auto_2421552 ) ) ( not ( = ?auto_2421556 ?auto_2421555 ) ) ( HOIST-AT ?auto_2421554 ?auto_2421556 ) ( not ( = ?auto_2421559 ?auto_2421554 ) ) ( SURFACE-AT ?auto_2421552 ?auto_2421556 ) ( ON ?auto_2421552 ?auto_2421553 ) ( CLEAR ?auto_2421552 ) ( not ( = ?auto_2421551 ?auto_2421553 ) ) ( not ( = ?auto_2421552 ?auto_2421553 ) ) ( not ( = ?auto_2421550 ?auto_2421553 ) ) ( SURFACE-AT ?auto_2421550 ?auto_2421555 ) ( CLEAR ?auto_2421550 ) ( IS-CRATE ?auto_2421551 ) ( AVAILABLE ?auto_2421559 ) ( AVAILABLE ?auto_2421554 ) ( SURFACE-AT ?auto_2421551 ?auto_2421556 ) ( ON ?auto_2421551 ?auto_2421558 ) ( CLEAR ?auto_2421551 ) ( not ( = ?auto_2421551 ?auto_2421558 ) ) ( not ( = ?auto_2421552 ?auto_2421558 ) ) ( not ( = ?auto_2421550 ?auto_2421558 ) ) ( not ( = ?auto_2421553 ?auto_2421558 ) ) ( TRUCK-AT ?auto_2421557 ?auto_2421555 ) ( ON ?auto_2421549 ?auto_2421548 ) ( ON ?auto_2421550 ?auto_2421549 ) ( not ( = ?auto_2421548 ?auto_2421549 ) ) ( not ( = ?auto_2421548 ?auto_2421550 ) ) ( not ( = ?auto_2421548 ?auto_2421551 ) ) ( not ( = ?auto_2421548 ?auto_2421552 ) ) ( not ( = ?auto_2421548 ?auto_2421553 ) ) ( not ( = ?auto_2421548 ?auto_2421558 ) ) ( not ( = ?auto_2421549 ?auto_2421550 ) ) ( not ( = ?auto_2421549 ?auto_2421551 ) ) ( not ( = ?auto_2421549 ?auto_2421552 ) ) ( not ( = ?auto_2421549 ?auto_2421553 ) ) ( not ( = ?auto_2421549 ?auto_2421558 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421550 ?auto_2421551 ?auto_2421552 )
      ( MAKE-4CRATE-VERIFY ?auto_2421548 ?auto_2421549 ?auto_2421550 ?auto_2421551 ?auto_2421552 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2421560 - SURFACE
      ?auto_2421561 - SURFACE
      ?auto_2421562 - SURFACE
      ?auto_2421563 - SURFACE
      ?auto_2421564 - SURFACE
      ?auto_2421565 - SURFACE
    )
    :vars
    (
      ?auto_2421572 - HOIST
      ?auto_2421568 - PLACE
      ?auto_2421569 - PLACE
      ?auto_2421567 - HOIST
      ?auto_2421566 - SURFACE
      ?auto_2421571 - SURFACE
      ?auto_2421570 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421572 ?auto_2421568 ) ( IS-CRATE ?auto_2421565 ) ( not ( = ?auto_2421564 ?auto_2421565 ) ) ( not ( = ?auto_2421563 ?auto_2421564 ) ) ( not ( = ?auto_2421563 ?auto_2421565 ) ) ( not ( = ?auto_2421569 ?auto_2421568 ) ) ( HOIST-AT ?auto_2421567 ?auto_2421569 ) ( not ( = ?auto_2421572 ?auto_2421567 ) ) ( SURFACE-AT ?auto_2421565 ?auto_2421569 ) ( ON ?auto_2421565 ?auto_2421566 ) ( CLEAR ?auto_2421565 ) ( not ( = ?auto_2421564 ?auto_2421566 ) ) ( not ( = ?auto_2421565 ?auto_2421566 ) ) ( not ( = ?auto_2421563 ?auto_2421566 ) ) ( SURFACE-AT ?auto_2421563 ?auto_2421568 ) ( CLEAR ?auto_2421563 ) ( IS-CRATE ?auto_2421564 ) ( AVAILABLE ?auto_2421572 ) ( AVAILABLE ?auto_2421567 ) ( SURFACE-AT ?auto_2421564 ?auto_2421569 ) ( ON ?auto_2421564 ?auto_2421571 ) ( CLEAR ?auto_2421564 ) ( not ( = ?auto_2421564 ?auto_2421571 ) ) ( not ( = ?auto_2421565 ?auto_2421571 ) ) ( not ( = ?auto_2421563 ?auto_2421571 ) ) ( not ( = ?auto_2421566 ?auto_2421571 ) ) ( TRUCK-AT ?auto_2421570 ?auto_2421568 ) ( ON ?auto_2421561 ?auto_2421560 ) ( ON ?auto_2421562 ?auto_2421561 ) ( ON ?auto_2421563 ?auto_2421562 ) ( not ( = ?auto_2421560 ?auto_2421561 ) ) ( not ( = ?auto_2421560 ?auto_2421562 ) ) ( not ( = ?auto_2421560 ?auto_2421563 ) ) ( not ( = ?auto_2421560 ?auto_2421564 ) ) ( not ( = ?auto_2421560 ?auto_2421565 ) ) ( not ( = ?auto_2421560 ?auto_2421566 ) ) ( not ( = ?auto_2421560 ?auto_2421571 ) ) ( not ( = ?auto_2421561 ?auto_2421562 ) ) ( not ( = ?auto_2421561 ?auto_2421563 ) ) ( not ( = ?auto_2421561 ?auto_2421564 ) ) ( not ( = ?auto_2421561 ?auto_2421565 ) ) ( not ( = ?auto_2421561 ?auto_2421566 ) ) ( not ( = ?auto_2421561 ?auto_2421571 ) ) ( not ( = ?auto_2421562 ?auto_2421563 ) ) ( not ( = ?auto_2421562 ?auto_2421564 ) ) ( not ( = ?auto_2421562 ?auto_2421565 ) ) ( not ( = ?auto_2421562 ?auto_2421566 ) ) ( not ( = ?auto_2421562 ?auto_2421571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421563 ?auto_2421564 ?auto_2421565 )
      ( MAKE-5CRATE-VERIFY ?auto_2421560 ?auto_2421561 ?auto_2421562 ?auto_2421563 ?auto_2421564 ?auto_2421565 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2421573 - SURFACE
      ?auto_2421574 - SURFACE
      ?auto_2421575 - SURFACE
      ?auto_2421576 - SURFACE
      ?auto_2421577 - SURFACE
      ?auto_2421578 - SURFACE
      ?auto_2421579 - SURFACE
    )
    :vars
    (
      ?auto_2421586 - HOIST
      ?auto_2421582 - PLACE
      ?auto_2421583 - PLACE
      ?auto_2421581 - HOIST
      ?auto_2421580 - SURFACE
      ?auto_2421585 - SURFACE
      ?auto_2421584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421586 ?auto_2421582 ) ( IS-CRATE ?auto_2421579 ) ( not ( = ?auto_2421578 ?auto_2421579 ) ) ( not ( = ?auto_2421577 ?auto_2421578 ) ) ( not ( = ?auto_2421577 ?auto_2421579 ) ) ( not ( = ?auto_2421583 ?auto_2421582 ) ) ( HOIST-AT ?auto_2421581 ?auto_2421583 ) ( not ( = ?auto_2421586 ?auto_2421581 ) ) ( SURFACE-AT ?auto_2421579 ?auto_2421583 ) ( ON ?auto_2421579 ?auto_2421580 ) ( CLEAR ?auto_2421579 ) ( not ( = ?auto_2421578 ?auto_2421580 ) ) ( not ( = ?auto_2421579 ?auto_2421580 ) ) ( not ( = ?auto_2421577 ?auto_2421580 ) ) ( SURFACE-AT ?auto_2421577 ?auto_2421582 ) ( CLEAR ?auto_2421577 ) ( IS-CRATE ?auto_2421578 ) ( AVAILABLE ?auto_2421586 ) ( AVAILABLE ?auto_2421581 ) ( SURFACE-AT ?auto_2421578 ?auto_2421583 ) ( ON ?auto_2421578 ?auto_2421585 ) ( CLEAR ?auto_2421578 ) ( not ( = ?auto_2421578 ?auto_2421585 ) ) ( not ( = ?auto_2421579 ?auto_2421585 ) ) ( not ( = ?auto_2421577 ?auto_2421585 ) ) ( not ( = ?auto_2421580 ?auto_2421585 ) ) ( TRUCK-AT ?auto_2421584 ?auto_2421582 ) ( ON ?auto_2421574 ?auto_2421573 ) ( ON ?auto_2421575 ?auto_2421574 ) ( ON ?auto_2421576 ?auto_2421575 ) ( ON ?auto_2421577 ?auto_2421576 ) ( not ( = ?auto_2421573 ?auto_2421574 ) ) ( not ( = ?auto_2421573 ?auto_2421575 ) ) ( not ( = ?auto_2421573 ?auto_2421576 ) ) ( not ( = ?auto_2421573 ?auto_2421577 ) ) ( not ( = ?auto_2421573 ?auto_2421578 ) ) ( not ( = ?auto_2421573 ?auto_2421579 ) ) ( not ( = ?auto_2421573 ?auto_2421580 ) ) ( not ( = ?auto_2421573 ?auto_2421585 ) ) ( not ( = ?auto_2421574 ?auto_2421575 ) ) ( not ( = ?auto_2421574 ?auto_2421576 ) ) ( not ( = ?auto_2421574 ?auto_2421577 ) ) ( not ( = ?auto_2421574 ?auto_2421578 ) ) ( not ( = ?auto_2421574 ?auto_2421579 ) ) ( not ( = ?auto_2421574 ?auto_2421580 ) ) ( not ( = ?auto_2421574 ?auto_2421585 ) ) ( not ( = ?auto_2421575 ?auto_2421576 ) ) ( not ( = ?auto_2421575 ?auto_2421577 ) ) ( not ( = ?auto_2421575 ?auto_2421578 ) ) ( not ( = ?auto_2421575 ?auto_2421579 ) ) ( not ( = ?auto_2421575 ?auto_2421580 ) ) ( not ( = ?auto_2421575 ?auto_2421585 ) ) ( not ( = ?auto_2421576 ?auto_2421577 ) ) ( not ( = ?auto_2421576 ?auto_2421578 ) ) ( not ( = ?auto_2421576 ?auto_2421579 ) ) ( not ( = ?auto_2421576 ?auto_2421580 ) ) ( not ( = ?auto_2421576 ?auto_2421585 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421577 ?auto_2421578 ?auto_2421579 )
      ( MAKE-6CRATE-VERIFY ?auto_2421573 ?auto_2421574 ?auto_2421575 ?auto_2421576 ?auto_2421577 ?auto_2421578 ?auto_2421579 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2421587 - SURFACE
      ?auto_2421588 - SURFACE
      ?auto_2421589 - SURFACE
      ?auto_2421590 - SURFACE
      ?auto_2421591 - SURFACE
      ?auto_2421592 - SURFACE
      ?auto_2421593 - SURFACE
      ?auto_2421594 - SURFACE
    )
    :vars
    (
      ?auto_2421601 - HOIST
      ?auto_2421597 - PLACE
      ?auto_2421598 - PLACE
      ?auto_2421596 - HOIST
      ?auto_2421595 - SURFACE
      ?auto_2421600 - SURFACE
      ?auto_2421599 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421601 ?auto_2421597 ) ( IS-CRATE ?auto_2421594 ) ( not ( = ?auto_2421593 ?auto_2421594 ) ) ( not ( = ?auto_2421592 ?auto_2421593 ) ) ( not ( = ?auto_2421592 ?auto_2421594 ) ) ( not ( = ?auto_2421598 ?auto_2421597 ) ) ( HOIST-AT ?auto_2421596 ?auto_2421598 ) ( not ( = ?auto_2421601 ?auto_2421596 ) ) ( SURFACE-AT ?auto_2421594 ?auto_2421598 ) ( ON ?auto_2421594 ?auto_2421595 ) ( CLEAR ?auto_2421594 ) ( not ( = ?auto_2421593 ?auto_2421595 ) ) ( not ( = ?auto_2421594 ?auto_2421595 ) ) ( not ( = ?auto_2421592 ?auto_2421595 ) ) ( SURFACE-AT ?auto_2421592 ?auto_2421597 ) ( CLEAR ?auto_2421592 ) ( IS-CRATE ?auto_2421593 ) ( AVAILABLE ?auto_2421601 ) ( AVAILABLE ?auto_2421596 ) ( SURFACE-AT ?auto_2421593 ?auto_2421598 ) ( ON ?auto_2421593 ?auto_2421600 ) ( CLEAR ?auto_2421593 ) ( not ( = ?auto_2421593 ?auto_2421600 ) ) ( not ( = ?auto_2421594 ?auto_2421600 ) ) ( not ( = ?auto_2421592 ?auto_2421600 ) ) ( not ( = ?auto_2421595 ?auto_2421600 ) ) ( TRUCK-AT ?auto_2421599 ?auto_2421597 ) ( ON ?auto_2421588 ?auto_2421587 ) ( ON ?auto_2421589 ?auto_2421588 ) ( ON ?auto_2421590 ?auto_2421589 ) ( ON ?auto_2421591 ?auto_2421590 ) ( ON ?auto_2421592 ?auto_2421591 ) ( not ( = ?auto_2421587 ?auto_2421588 ) ) ( not ( = ?auto_2421587 ?auto_2421589 ) ) ( not ( = ?auto_2421587 ?auto_2421590 ) ) ( not ( = ?auto_2421587 ?auto_2421591 ) ) ( not ( = ?auto_2421587 ?auto_2421592 ) ) ( not ( = ?auto_2421587 ?auto_2421593 ) ) ( not ( = ?auto_2421587 ?auto_2421594 ) ) ( not ( = ?auto_2421587 ?auto_2421595 ) ) ( not ( = ?auto_2421587 ?auto_2421600 ) ) ( not ( = ?auto_2421588 ?auto_2421589 ) ) ( not ( = ?auto_2421588 ?auto_2421590 ) ) ( not ( = ?auto_2421588 ?auto_2421591 ) ) ( not ( = ?auto_2421588 ?auto_2421592 ) ) ( not ( = ?auto_2421588 ?auto_2421593 ) ) ( not ( = ?auto_2421588 ?auto_2421594 ) ) ( not ( = ?auto_2421588 ?auto_2421595 ) ) ( not ( = ?auto_2421588 ?auto_2421600 ) ) ( not ( = ?auto_2421589 ?auto_2421590 ) ) ( not ( = ?auto_2421589 ?auto_2421591 ) ) ( not ( = ?auto_2421589 ?auto_2421592 ) ) ( not ( = ?auto_2421589 ?auto_2421593 ) ) ( not ( = ?auto_2421589 ?auto_2421594 ) ) ( not ( = ?auto_2421589 ?auto_2421595 ) ) ( not ( = ?auto_2421589 ?auto_2421600 ) ) ( not ( = ?auto_2421590 ?auto_2421591 ) ) ( not ( = ?auto_2421590 ?auto_2421592 ) ) ( not ( = ?auto_2421590 ?auto_2421593 ) ) ( not ( = ?auto_2421590 ?auto_2421594 ) ) ( not ( = ?auto_2421590 ?auto_2421595 ) ) ( not ( = ?auto_2421590 ?auto_2421600 ) ) ( not ( = ?auto_2421591 ?auto_2421592 ) ) ( not ( = ?auto_2421591 ?auto_2421593 ) ) ( not ( = ?auto_2421591 ?auto_2421594 ) ) ( not ( = ?auto_2421591 ?auto_2421595 ) ) ( not ( = ?auto_2421591 ?auto_2421600 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421592 ?auto_2421593 ?auto_2421594 )
      ( MAKE-7CRATE-VERIFY ?auto_2421587 ?auto_2421588 ?auto_2421589 ?auto_2421590 ?auto_2421591 ?auto_2421592 ?auto_2421593 ?auto_2421594 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2421602 - SURFACE
      ?auto_2421603 - SURFACE
      ?auto_2421604 - SURFACE
      ?auto_2421605 - SURFACE
      ?auto_2421606 - SURFACE
      ?auto_2421607 - SURFACE
      ?auto_2421608 - SURFACE
      ?auto_2421609 - SURFACE
      ?auto_2421610 - SURFACE
    )
    :vars
    (
      ?auto_2421617 - HOIST
      ?auto_2421613 - PLACE
      ?auto_2421614 - PLACE
      ?auto_2421612 - HOIST
      ?auto_2421611 - SURFACE
      ?auto_2421616 - SURFACE
      ?auto_2421615 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421617 ?auto_2421613 ) ( IS-CRATE ?auto_2421610 ) ( not ( = ?auto_2421609 ?auto_2421610 ) ) ( not ( = ?auto_2421608 ?auto_2421609 ) ) ( not ( = ?auto_2421608 ?auto_2421610 ) ) ( not ( = ?auto_2421614 ?auto_2421613 ) ) ( HOIST-AT ?auto_2421612 ?auto_2421614 ) ( not ( = ?auto_2421617 ?auto_2421612 ) ) ( SURFACE-AT ?auto_2421610 ?auto_2421614 ) ( ON ?auto_2421610 ?auto_2421611 ) ( CLEAR ?auto_2421610 ) ( not ( = ?auto_2421609 ?auto_2421611 ) ) ( not ( = ?auto_2421610 ?auto_2421611 ) ) ( not ( = ?auto_2421608 ?auto_2421611 ) ) ( SURFACE-AT ?auto_2421608 ?auto_2421613 ) ( CLEAR ?auto_2421608 ) ( IS-CRATE ?auto_2421609 ) ( AVAILABLE ?auto_2421617 ) ( AVAILABLE ?auto_2421612 ) ( SURFACE-AT ?auto_2421609 ?auto_2421614 ) ( ON ?auto_2421609 ?auto_2421616 ) ( CLEAR ?auto_2421609 ) ( not ( = ?auto_2421609 ?auto_2421616 ) ) ( not ( = ?auto_2421610 ?auto_2421616 ) ) ( not ( = ?auto_2421608 ?auto_2421616 ) ) ( not ( = ?auto_2421611 ?auto_2421616 ) ) ( TRUCK-AT ?auto_2421615 ?auto_2421613 ) ( ON ?auto_2421603 ?auto_2421602 ) ( ON ?auto_2421604 ?auto_2421603 ) ( ON ?auto_2421605 ?auto_2421604 ) ( ON ?auto_2421606 ?auto_2421605 ) ( ON ?auto_2421607 ?auto_2421606 ) ( ON ?auto_2421608 ?auto_2421607 ) ( not ( = ?auto_2421602 ?auto_2421603 ) ) ( not ( = ?auto_2421602 ?auto_2421604 ) ) ( not ( = ?auto_2421602 ?auto_2421605 ) ) ( not ( = ?auto_2421602 ?auto_2421606 ) ) ( not ( = ?auto_2421602 ?auto_2421607 ) ) ( not ( = ?auto_2421602 ?auto_2421608 ) ) ( not ( = ?auto_2421602 ?auto_2421609 ) ) ( not ( = ?auto_2421602 ?auto_2421610 ) ) ( not ( = ?auto_2421602 ?auto_2421611 ) ) ( not ( = ?auto_2421602 ?auto_2421616 ) ) ( not ( = ?auto_2421603 ?auto_2421604 ) ) ( not ( = ?auto_2421603 ?auto_2421605 ) ) ( not ( = ?auto_2421603 ?auto_2421606 ) ) ( not ( = ?auto_2421603 ?auto_2421607 ) ) ( not ( = ?auto_2421603 ?auto_2421608 ) ) ( not ( = ?auto_2421603 ?auto_2421609 ) ) ( not ( = ?auto_2421603 ?auto_2421610 ) ) ( not ( = ?auto_2421603 ?auto_2421611 ) ) ( not ( = ?auto_2421603 ?auto_2421616 ) ) ( not ( = ?auto_2421604 ?auto_2421605 ) ) ( not ( = ?auto_2421604 ?auto_2421606 ) ) ( not ( = ?auto_2421604 ?auto_2421607 ) ) ( not ( = ?auto_2421604 ?auto_2421608 ) ) ( not ( = ?auto_2421604 ?auto_2421609 ) ) ( not ( = ?auto_2421604 ?auto_2421610 ) ) ( not ( = ?auto_2421604 ?auto_2421611 ) ) ( not ( = ?auto_2421604 ?auto_2421616 ) ) ( not ( = ?auto_2421605 ?auto_2421606 ) ) ( not ( = ?auto_2421605 ?auto_2421607 ) ) ( not ( = ?auto_2421605 ?auto_2421608 ) ) ( not ( = ?auto_2421605 ?auto_2421609 ) ) ( not ( = ?auto_2421605 ?auto_2421610 ) ) ( not ( = ?auto_2421605 ?auto_2421611 ) ) ( not ( = ?auto_2421605 ?auto_2421616 ) ) ( not ( = ?auto_2421606 ?auto_2421607 ) ) ( not ( = ?auto_2421606 ?auto_2421608 ) ) ( not ( = ?auto_2421606 ?auto_2421609 ) ) ( not ( = ?auto_2421606 ?auto_2421610 ) ) ( not ( = ?auto_2421606 ?auto_2421611 ) ) ( not ( = ?auto_2421606 ?auto_2421616 ) ) ( not ( = ?auto_2421607 ?auto_2421608 ) ) ( not ( = ?auto_2421607 ?auto_2421609 ) ) ( not ( = ?auto_2421607 ?auto_2421610 ) ) ( not ( = ?auto_2421607 ?auto_2421611 ) ) ( not ( = ?auto_2421607 ?auto_2421616 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421608 ?auto_2421609 ?auto_2421610 )
      ( MAKE-8CRATE-VERIFY ?auto_2421602 ?auto_2421603 ?auto_2421604 ?auto_2421605 ?auto_2421606 ?auto_2421607 ?auto_2421608 ?auto_2421609 ?auto_2421610 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2421618 - SURFACE
      ?auto_2421619 - SURFACE
      ?auto_2421620 - SURFACE
      ?auto_2421621 - SURFACE
      ?auto_2421622 - SURFACE
      ?auto_2421623 - SURFACE
      ?auto_2421624 - SURFACE
      ?auto_2421625 - SURFACE
      ?auto_2421626 - SURFACE
      ?auto_2421627 - SURFACE
    )
    :vars
    (
      ?auto_2421634 - HOIST
      ?auto_2421630 - PLACE
      ?auto_2421631 - PLACE
      ?auto_2421629 - HOIST
      ?auto_2421628 - SURFACE
      ?auto_2421633 - SURFACE
      ?auto_2421632 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421634 ?auto_2421630 ) ( IS-CRATE ?auto_2421627 ) ( not ( = ?auto_2421626 ?auto_2421627 ) ) ( not ( = ?auto_2421625 ?auto_2421626 ) ) ( not ( = ?auto_2421625 ?auto_2421627 ) ) ( not ( = ?auto_2421631 ?auto_2421630 ) ) ( HOIST-AT ?auto_2421629 ?auto_2421631 ) ( not ( = ?auto_2421634 ?auto_2421629 ) ) ( SURFACE-AT ?auto_2421627 ?auto_2421631 ) ( ON ?auto_2421627 ?auto_2421628 ) ( CLEAR ?auto_2421627 ) ( not ( = ?auto_2421626 ?auto_2421628 ) ) ( not ( = ?auto_2421627 ?auto_2421628 ) ) ( not ( = ?auto_2421625 ?auto_2421628 ) ) ( SURFACE-AT ?auto_2421625 ?auto_2421630 ) ( CLEAR ?auto_2421625 ) ( IS-CRATE ?auto_2421626 ) ( AVAILABLE ?auto_2421634 ) ( AVAILABLE ?auto_2421629 ) ( SURFACE-AT ?auto_2421626 ?auto_2421631 ) ( ON ?auto_2421626 ?auto_2421633 ) ( CLEAR ?auto_2421626 ) ( not ( = ?auto_2421626 ?auto_2421633 ) ) ( not ( = ?auto_2421627 ?auto_2421633 ) ) ( not ( = ?auto_2421625 ?auto_2421633 ) ) ( not ( = ?auto_2421628 ?auto_2421633 ) ) ( TRUCK-AT ?auto_2421632 ?auto_2421630 ) ( ON ?auto_2421619 ?auto_2421618 ) ( ON ?auto_2421620 ?auto_2421619 ) ( ON ?auto_2421621 ?auto_2421620 ) ( ON ?auto_2421622 ?auto_2421621 ) ( ON ?auto_2421623 ?auto_2421622 ) ( ON ?auto_2421624 ?auto_2421623 ) ( ON ?auto_2421625 ?auto_2421624 ) ( not ( = ?auto_2421618 ?auto_2421619 ) ) ( not ( = ?auto_2421618 ?auto_2421620 ) ) ( not ( = ?auto_2421618 ?auto_2421621 ) ) ( not ( = ?auto_2421618 ?auto_2421622 ) ) ( not ( = ?auto_2421618 ?auto_2421623 ) ) ( not ( = ?auto_2421618 ?auto_2421624 ) ) ( not ( = ?auto_2421618 ?auto_2421625 ) ) ( not ( = ?auto_2421618 ?auto_2421626 ) ) ( not ( = ?auto_2421618 ?auto_2421627 ) ) ( not ( = ?auto_2421618 ?auto_2421628 ) ) ( not ( = ?auto_2421618 ?auto_2421633 ) ) ( not ( = ?auto_2421619 ?auto_2421620 ) ) ( not ( = ?auto_2421619 ?auto_2421621 ) ) ( not ( = ?auto_2421619 ?auto_2421622 ) ) ( not ( = ?auto_2421619 ?auto_2421623 ) ) ( not ( = ?auto_2421619 ?auto_2421624 ) ) ( not ( = ?auto_2421619 ?auto_2421625 ) ) ( not ( = ?auto_2421619 ?auto_2421626 ) ) ( not ( = ?auto_2421619 ?auto_2421627 ) ) ( not ( = ?auto_2421619 ?auto_2421628 ) ) ( not ( = ?auto_2421619 ?auto_2421633 ) ) ( not ( = ?auto_2421620 ?auto_2421621 ) ) ( not ( = ?auto_2421620 ?auto_2421622 ) ) ( not ( = ?auto_2421620 ?auto_2421623 ) ) ( not ( = ?auto_2421620 ?auto_2421624 ) ) ( not ( = ?auto_2421620 ?auto_2421625 ) ) ( not ( = ?auto_2421620 ?auto_2421626 ) ) ( not ( = ?auto_2421620 ?auto_2421627 ) ) ( not ( = ?auto_2421620 ?auto_2421628 ) ) ( not ( = ?auto_2421620 ?auto_2421633 ) ) ( not ( = ?auto_2421621 ?auto_2421622 ) ) ( not ( = ?auto_2421621 ?auto_2421623 ) ) ( not ( = ?auto_2421621 ?auto_2421624 ) ) ( not ( = ?auto_2421621 ?auto_2421625 ) ) ( not ( = ?auto_2421621 ?auto_2421626 ) ) ( not ( = ?auto_2421621 ?auto_2421627 ) ) ( not ( = ?auto_2421621 ?auto_2421628 ) ) ( not ( = ?auto_2421621 ?auto_2421633 ) ) ( not ( = ?auto_2421622 ?auto_2421623 ) ) ( not ( = ?auto_2421622 ?auto_2421624 ) ) ( not ( = ?auto_2421622 ?auto_2421625 ) ) ( not ( = ?auto_2421622 ?auto_2421626 ) ) ( not ( = ?auto_2421622 ?auto_2421627 ) ) ( not ( = ?auto_2421622 ?auto_2421628 ) ) ( not ( = ?auto_2421622 ?auto_2421633 ) ) ( not ( = ?auto_2421623 ?auto_2421624 ) ) ( not ( = ?auto_2421623 ?auto_2421625 ) ) ( not ( = ?auto_2421623 ?auto_2421626 ) ) ( not ( = ?auto_2421623 ?auto_2421627 ) ) ( not ( = ?auto_2421623 ?auto_2421628 ) ) ( not ( = ?auto_2421623 ?auto_2421633 ) ) ( not ( = ?auto_2421624 ?auto_2421625 ) ) ( not ( = ?auto_2421624 ?auto_2421626 ) ) ( not ( = ?auto_2421624 ?auto_2421627 ) ) ( not ( = ?auto_2421624 ?auto_2421628 ) ) ( not ( = ?auto_2421624 ?auto_2421633 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421625 ?auto_2421626 ?auto_2421627 )
      ( MAKE-9CRATE-VERIFY ?auto_2421618 ?auto_2421619 ?auto_2421620 ?auto_2421621 ?auto_2421622 ?auto_2421623 ?auto_2421624 ?auto_2421625 ?auto_2421626 ?auto_2421627 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2421635 - SURFACE
      ?auto_2421636 - SURFACE
      ?auto_2421637 - SURFACE
      ?auto_2421638 - SURFACE
      ?auto_2421639 - SURFACE
      ?auto_2421640 - SURFACE
      ?auto_2421641 - SURFACE
      ?auto_2421642 - SURFACE
      ?auto_2421643 - SURFACE
      ?auto_2421644 - SURFACE
      ?auto_2421645 - SURFACE
    )
    :vars
    (
      ?auto_2421652 - HOIST
      ?auto_2421648 - PLACE
      ?auto_2421649 - PLACE
      ?auto_2421647 - HOIST
      ?auto_2421646 - SURFACE
      ?auto_2421651 - SURFACE
      ?auto_2421650 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421652 ?auto_2421648 ) ( IS-CRATE ?auto_2421645 ) ( not ( = ?auto_2421644 ?auto_2421645 ) ) ( not ( = ?auto_2421643 ?auto_2421644 ) ) ( not ( = ?auto_2421643 ?auto_2421645 ) ) ( not ( = ?auto_2421649 ?auto_2421648 ) ) ( HOIST-AT ?auto_2421647 ?auto_2421649 ) ( not ( = ?auto_2421652 ?auto_2421647 ) ) ( SURFACE-AT ?auto_2421645 ?auto_2421649 ) ( ON ?auto_2421645 ?auto_2421646 ) ( CLEAR ?auto_2421645 ) ( not ( = ?auto_2421644 ?auto_2421646 ) ) ( not ( = ?auto_2421645 ?auto_2421646 ) ) ( not ( = ?auto_2421643 ?auto_2421646 ) ) ( SURFACE-AT ?auto_2421643 ?auto_2421648 ) ( CLEAR ?auto_2421643 ) ( IS-CRATE ?auto_2421644 ) ( AVAILABLE ?auto_2421652 ) ( AVAILABLE ?auto_2421647 ) ( SURFACE-AT ?auto_2421644 ?auto_2421649 ) ( ON ?auto_2421644 ?auto_2421651 ) ( CLEAR ?auto_2421644 ) ( not ( = ?auto_2421644 ?auto_2421651 ) ) ( not ( = ?auto_2421645 ?auto_2421651 ) ) ( not ( = ?auto_2421643 ?auto_2421651 ) ) ( not ( = ?auto_2421646 ?auto_2421651 ) ) ( TRUCK-AT ?auto_2421650 ?auto_2421648 ) ( ON ?auto_2421636 ?auto_2421635 ) ( ON ?auto_2421637 ?auto_2421636 ) ( ON ?auto_2421638 ?auto_2421637 ) ( ON ?auto_2421639 ?auto_2421638 ) ( ON ?auto_2421640 ?auto_2421639 ) ( ON ?auto_2421641 ?auto_2421640 ) ( ON ?auto_2421642 ?auto_2421641 ) ( ON ?auto_2421643 ?auto_2421642 ) ( not ( = ?auto_2421635 ?auto_2421636 ) ) ( not ( = ?auto_2421635 ?auto_2421637 ) ) ( not ( = ?auto_2421635 ?auto_2421638 ) ) ( not ( = ?auto_2421635 ?auto_2421639 ) ) ( not ( = ?auto_2421635 ?auto_2421640 ) ) ( not ( = ?auto_2421635 ?auto_2421641 ) ) ( not ( = ?auto_2421635 ?auto_2421642 ) ) ( not ( = ?auto_2421635 ?auto_2421643 ) ) ( not ( = ?auto_2421635 ?auto_2421644 ) ) ( not ( = ?auto_2421635 ?auto_2421645 ) ) ( not ( = ?auto_2421635 ?auto_2421646 ) ) ( not ( = ?auto_2421635 ?auto_2421651 ) ) ( not ( = ?auto_2421636 ?auto_2421637 ) ) ( not ( = ?auto_2421636 ?auto_2421638 ) ) ( not ( = ?auto_2421636 ?auto_2421639 ) ) ( not ( = ?auto_2421636 ?auto_2421640 ) ) ( not ( = ?auto_2421636 ?auto_2421641 ) ) ( not ( = ?auto_2421636 ?auto_2421642 ) ) ( not ( = ?auto_2421636 ?auto_2421643 ) ) ( not ( = ?auto_2421636 ?auto_2421644 ) ) ( not ( = ?auto_2421636 ?auto_2421645 ) ) ( not ( = ?auto_2421636 ?auto_2421646 ) ) ( not ( = ?auto_2421636 ?auto_2421651 ) ) ( not ( = ?auto_2421637 ?auto_2421638 ) ) ( not ( = ?auto_2421637 ?auto_2421639 ) ) ( not ( = ?auto_2421637 ?auto_2421640 ) ) ( not ( = ?auto_2421637 ?auto_2421641 ) ) ( not ( = ?auto_2421637 ?auto_2421642 ) ) ( not ( = ?auto_2421637 ?auto_2421643 ) ) ( not ( = ?auto_2421637 ?auto_2421644 ) ) ( not ( = ?auto_2421637 ?auto_2421645 ) ) ( not ( = ?auto_2421637 ?auto_2421646 ) ) ( not ( = ?auto_2421637 ?auto_2421651 ) ) ( not ( = ?auto_2421638 ?auto_2421639 ) ) ( not ( = ?auto_2421638 ?auto_2421640 ) ) ( not ( = ?auto_2421638 ?auto_2421641 ) ) ( not ( = ?auto_2421638 ?auto_2421642 ) ) ( not ( = ?auto_2421638 ?auto_2421643 ) ) ( not ( = ?auto_2421638 ?auto_2421644 ) ) ( not ( = ?auto_2421638 ?auto_2421645 ) ) ( not ( = ?auto_2421638 ?auto_2421646 ) ) ( not ( = ?auto_2421638 ?auto_2421651 ) ) ( not ( = ?auto_2421639 ?auto_2421640 ) ) ( not ( = ?auto_2421639 ?auto_2421641 ) ) ( not ( = ?auto_2421639 ?auto_2421642 ) ) ( not ( = ?auto_2421639 ?auto_2421643 ) ) ( not ( = ?auto_2421639 ?auto_2421644 ) ) ( not ( = ?auto_2421639 ?auto_2421645 ) ) ( not ( = ?auto_2421639 ?auto_2421646 ) ) ( not ( = ?auto_2421639 ?auto_2421651 ) ) ( not ( = ?auto_2421640 ?auto_2421641 ) ) ( not ( = ?auto_2421640 ?auto_2421642 ) ) ( not ( = ?auto_2421640 ?auto_2421643 ) ) ( not ( = ?auto_2421640 ?auto_2421644 ) ) ( not ( = ?auto_2421640 ?auto_2421645 ) ) ( not ( = ?auto_2421640 ?auto_2421646 ) ) ( not ( = ?auto_2421640 ?auto_2421651 ) ) ( not ( = ?auto_2421641 ?auto_2421642 ) ) ( not ( = ?auto_2421641 ?auto_2421643 ) ) ( not ( = ?auto_2421641 ?auto_2421644 ) ) ( not ( = ?auto_2421641 ?auto_2421645 ) ) ( not ( = ?auto_2421641 ?auto_2421646 ) ) ( not ( = ?auto_2421641 ?auto_2421651 ) ) ( not ( = ?auto_2421642 ?auto_2421643 ) ) ( not ( = ?auto_2421642 ?auto_2421644 ) ) ( not ( = ?auto_2421642 ?auto_2421645 ) ) ( not ( = ?auto_2421642 ?auto_2421646 ) ) ( not ( = ?auto_2421642 ?auto_2421651 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421643 ?auto_2421644 ?auto_2421645 )
      ( MAKE-10CRATE-VERIFY ?auto_2421635 ?auto_2421636 ?auto_2421637 ?auto_2421638 ?auto_2421639 ?auto_2421640 ?auto_2421641 ?auto_2421642 ?auto_2421643 ?auto_2421644 ?auto_2421645 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2421653 - SURFACE
      ?auto_2421654 - SURFACE
      ?auto_2421655 - SURFACE
      ?auto_2421656 - SURFACE
      ?auto_2421657 - SURFACE
      ?auto_2421658 - SURFACE
      ?auto_2421659 - SURFACE
      ?auto_2421660 - SURFACE
      ?auto_2421661 - SURFACE
      ?auto_2421662 - SURFACE
      ?auto_2421663 - SURFACE
      ?auto_2421664 - SURFACE
    )
    :vars
    (
      ?auto_2421671 - HOIST
      ?auto_2421667 - PLACE
      ?auto_2421668 - PLACE
      ?auto_2421666 - HOIST
      ?auto_2421665 - SURFACE
      ?auto_2421670 - SURFACE
      ?auto_2421669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421671 ?auto_2421667 ) ( IS-CRATE ?auto_2421664 ) ( not ( = ?auto_2421663 ?auto_2421664 ) ) ( not ( = ?auto_2421662 ?auto_2421663 ) ) ( not ( = ?auto_2421662 ?auto_2421664 ) ) ( not ( = ?auto_2421668 ?auto_2421667 ) ) ( HOIST-AT ?auto_2421666 ?auto_2421668 ) ( not ( = ?auto_2421671 ?auto_2421666 ) ) ( SURFACE-AT ?auto_2421664 ?auto_2421668 ) ( ON ?auto_2421664 ?auto_2421665 ) ( CLEAR ?auto_2421664 ) ( not ( = ?auto_2421663 ?auto_2421665 ) ) ( not ( = ?auto_2421664 ?auto_2421665 ) ) ( not ( = ?auto_2421662 ?auto_2421665 ) ) ( SURFACE-AT ?auto_2421662 ?auto_2421667 ) ( CLEAR ?auto_2421662 ) ( IS-CRATE ?auto_2421663 ) ( AVAILABLE ?auto_2421671 ) ( AVAILABLE ?auto_2421666 ) ( SURFACE-AT ?auto_2421663 ?auto_2421668 ) ( ON ?auto_2421663 ?auto_2421670 ) ( CLEAR ?auto_2421663 ) ( not ( = ?auto_2421663 ?auto_2421670 ) ) ( not ( = ?auto_2421664 ?auto_2421670 ) ) ( not ( = ?auto_2421662 ?auto_2421670 ) ) ( not ( = ?auto_2421665 ?auto_2421670 ) ) ( TRUCK-AT ?auto_2421669 ?auto_2421667 ) ( ON ?auto_2421654 ?auto_2421653 ) ( ON ?auto_2421655 ?auto_2421654 ) ( ON ?auto_2421656 ?auto_2421655 ) ( ON ?auto_2421657 ?auto_2421656 ) ( ON ?auto_2421658 ?auto_2421657 ) ( ON ?auto_2421659 ?auto_2421658 ) ( ON ?auto_2421660 ?auto_2421659 ) ( ON ?auto_2421661 ?auto_2421660 ) ( ON ?auto_2421662 ?auto_2421661 ) ( not ( = ?auto_2421653 ?auto_2421654 ) ) ( not ( = ?auto_2421653 ?auto_2421655 ) ) ( not ( = ?auto_2421653 ?auto_2421656 ) ) ( not ( = ?auto_2421653 ?auto_2421657 ) ) ( not ( = ?auto_2421653 ?auto_2421658 ) ) ( not ( = ?auto_2421653 ?auto_2421659 ) ) ( not ( = ?auto_2421653 ?auto_2421660 ) ) ( not ( = ?auto_2421653 ?auto_2421661 ) ) ( not ( = ?auto_2421653 ?auto_2421662 ) ) ( not ( = ?auto_2421653 ?auto_2421663 ) ) ( not ( = ?auto_2421653 ?auto_2421664 ) ) ( not ( = ?auto_2421653 ?auto_2421665 ) ) ( not ( = ?auto_2421653 ?auto_2421670 ) ) ( not ( = ?auto_2421654 ?auto_2421655 ) ) ( not ( = ?auto_2421654 ?auto_2421656 ) ) ( not ( = ?auto_2421654 ?auto_2421657 ) ) ( not ( = ?auto_2421654 ?auto_2421658 ) ) ( not ( = ?auto_2421654 ?auto_2421659 ) ) ( not ( = ?auto_2421654 ?auto_2421660 ) ) ( not ( = ?auto_2421654 ?auto_2421661 ) ) ( not ( = ?auto_2421654 ?auto_2421662 ) ) ( not ( = ?auto_2421654 ?auto_2421663 ) ) ( not ( = ?auto_2421654 ?auto_2421664 ) ) ( not ( = ?auto_2421654 ?auto_2421665 ) ) ( not ( = ?auto_2421654 ?auto_2421670 ) ) ( not ( = ?auto_2421655 ?auto_2421656 ) ) ( not ( = ?auto_2421655 ?auto_2421657 ) ) ( not ( = ?auto_2421655 ?auto_2421658 ) ) ( not ( = ?auto_2421655 ?auto_2421659 ) ) ( not ( = ?auto_2421655 ?auto_2421660 ) ) ( not ( = ?auto_2421655 ?auto_2421661 ) ) ( not ( = ?auto_2421655 ?auto_2421662 ) ) ( not ( = ?auto_2421655 ?auto_2421663 ) ) ( not ( = ?auto_2421655 ?auto_2421664 ) ) ( not ( = ?auto_2421655 ?auto_2421665 ) ) ( not ( = ?auto_2421655 ?auto_2421670 ) ) ( not ( = ?auto_2421656 ?auto_2421657 ) ) ( not ( = ?auto_2421656 ?auto_2421658 ) ) ( not ( = ?auto_2421656 ?auto_2421659 ) ) ( not ( = ?auto_2421656 ?auto_2421660 ) ) ( not ( = ?auto_2421656 ?auto_2421661 ) ) ( not ( = ?auto_2421656 ?auto_2421662 ) ) ( not ( = ?auto_2421656 ?auto_2421663 ) ) ( not ( = ?auto_2421656 ?auto_2421664 ) ) ( not ( = ?auto_2421656 ?auto_2421665 ) ) ( not ( = ?auto_2421656 ?auto_2421670 ) ) ( not ( = ?auto_2421657 ?auto_2421658 ) ) ( not ( = ?auto_2421657 ?auto_2421659 ) ) ( not ( = ?auto_2421657 ?auto_2421660 ) ) ( not ( = ?auto_2421657 ?auto_2421661 ) ) ( not ( = ?auto_2421657 ?auto_2421662 ) ) ( not ( = ?auto_2421657 ?auto_2421663 ) ) ( not ( = ?auto_2421657 ?auto_2421664 ) ) ( not ( = ?auto_2421657 ?auto_2421665 ) ) ( not ( = ?auto_2421657 ?auto_2421670 ) ) ( not ( = ?auto_2421658 ?auto_2421659 ) ) ( not ( = ?auto_2421658 ?auto_2421660 ) ) ( not ( = ?auto_2421658 ?auto_2421661 ) ) ( not ( = ?auto_2421658 ?auto_2421662 ) ) ( not ( = ?auto_2421658 ?auto_2421663 ) ) ( not ( = ?auto_2421658 ?auto_2421664 ) ) ( not ( = ?auto_2421658 ?auto_2421665 ) ) ( not ( = ?auto_2421658 ?auto_2421670 ) ) ( not ( = ?auto_2421659 ?auto_2421660 ) ) ( not ( = ?auto_2421659 ?auto_2421661 ) ) ( not ( = ?auto_2421659 ?auto_2421662 ) ) ( not ( = ?auto_2421659 ?auto_2421663 ) ) ( not ( = ?auto_2421659 ?auto_2421664 ) ) ( not ( = ?auto_2421659 ?auto_2421665 ) ) ( not ( = ?auto_2421659 ?auto_2421670 ) ) ( not ( = ?auto_2421660 ?auto_2421661 ) ) ( not ( = ?auto_2421660 ?auto_2421662 ) ) ( not ( = ?auto_2421660 ?auto_2421663 ) ) ( not ( = ?auto_2421660 ?auto_2421664 ) ) ( not ( = ?auto_2421660 ?auto_2421665 ) ) ( not ( = ?auto_2421660 ?auto_2421670 ) ) ( not ( = ?auto_2421661 ?auto_2421662 ) ) ( not ( = ?auto_2421661 ?auto_2421663 ) ) ( not ( = ?auto_2421661 ?auto_2421664 ) ) ( not ( = ?auto_2421661 ?auto_2421665 ) ) ( not ( = ?auto_2421661 ?auto_2421670 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421662 ?auto_2421663 ?auto_2421664 )
      ( MAKE-11CRATE-VERIFY ?auto_2421653 ?auto_2421654 ?auto_2421655 ?auto_2421656 ?auto_2421657 ?auto_2421658 ?auto_2421659 ?auto_2421660 ?auto_2421661 ?auto_2421662 ?auto_2421663 ?auto_2421664 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2421672 - SURFACE
      ?auto_2421673 - SURFACE
    )
    :vars
    (
      ?auto_2421681 - HOIST
      ?auto_2421677 - PLACE
      ?auto_2421674 - SURFACE
      ?auto_2421678 - PLACE
      ?auto_2421676 - HOIST
      ?auto_2421675 - SURFACE
      ?auto_2421680 - SURFACE
      ?auto_2421679 - TRUCK
      ?auto_2421682 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421681 ?auto_2421677 ) ( IS-CRATE ?auto_2421673 ) ( not ( = ?auto_2421672 ?auto_2421673 ) ) ( not ( = ?auto_2421674 ?auto_2421672 ) ) ( not ( = ?auto_2421674 ?auto_2421673 ) ) ( not ( = ?auto_2421678 ?auto_2421677 ) ) ( HOIST-AT ?auto_2421676 ?auto_2421678 ) ( not ( = ?auto_2421681 ?auto_2421676 ) ) ( SURFACE-AT ?auto_2421673 ?auto_2421678 ) ( ON ?auto_2421673 ?auto_2421675 ) ( CLEAR ?auto_2421673 ) ( not ( = ?auto_2421672 ?auto_2421675 ) ) ( not ( = ?auto_2421673 ?auto_2421675 ) ) ( not ( = ?auto_2421674 ?auto_2421675 ) ) ( IS-CRATE ?auto_2421672 ) ( AVAILABLE ?auto_2421676 ) ( SURFACE-AT ?auto_2421672 ?auto_2421678 ) ( ON ?auto_2421672 ?auto_2421680 ) ( CLEAR ?auto_2421672 ) ( not ( = ?auto_2421672 ?auto_2421680 ) ) ( not ( = ?auto_2421673 ?auto_2421680 ) ) ( not ( = ?auto_2421674 ?auto_2421680 ) ) ( not ( = ?auto_2421675 ?auto_2421680 ) ) ( TRUCK-AT ?auto_2421679 ?auto_2421677 ) ( SURFACE-AT ?auto_2421682 ?auto_2421677 ) ( CLEAR ?auto_2421682 ) ( LIFTING ?auto_2421681 ?auto_2421674 ) ( IS-CRATE ?auto_2421674 ) ( not ( = ?auto_2421682 ?auto_2421674 ) ) ( not ( = ?auto_2421672 ?auto_2421682 ) ) ( not ( = ?auto_2421673 ?auto_2421682 ) ) ( not ( = ?auto_2421675 ?auto_2421682 ) ) ( not ( = ?auto_2421680 ?auto_2421682 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2421682 ?auto_2421674 )
      ( MAKE-2CRATE ?auto_2421674 ?auto_2421672 ?auto_2421673 )
      ( MAKE-1CRATE-VERIFY ?auto_2421672 ?auto_2421673 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2421683 - SURFACE
      ?auto_2421684 - SURFACE
      ?auto_2421685 - SURFACE
    )
    :vars
    (
      ?auto_2421690 - HOIST
      ?auto_2421687 - PLACE
      ?auto_2421692 - PLACE
      ?auto_2421686 - HOIST
      ?auto_2421689 - SURFACE
      ?auto_2421688 - SURFACE
      ?auto_2421691 - TRUCK
      ?auto_2421693 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421690 ?auto_2421687 ) ( IS-CRATE ?auto_2421685 ) ( not ( = ?auto_2421684 ?auto_2421685 ) ) ( not ( = ?auto_2421683 ?auto_2421684 ) ) ( not ( = ?auto_2421683 ?auto_2421685 ) ) ( not ( = ?auto_2421692 ?auto_2421687 ) ) ( HOIST-AT ?auto_2421686 ?auto_2421692 ) ( not ( = ?auto_2421690 ?auto_2421686 ) ) ( SURFACE-AT ?auto_2421685 ?auto_2421692 ) ( ON ?auto_2421685 ?auto_2421689 ) ( CLEAR ?auto_2421685 ) ( not ( = ?auto_2421684 ?auto_2421689 ) ) ( not ( = ?auto_2421685 ?auto_2421689 ) ) ( not ( = ?auto_2421683 ?auto_2421689 ) ) ( IS-CRATE ?auto_2421684 ) ( AVAILABLE ?auto_2421686 ) ( SURFACE-AT ?auto_2421684 ?auto_2421692 ) ( ON ?auto_2421684 ?auto_2421688 ) ( CLEAR ?auto_2421684 ) ( not ( = ?auto_2421684 ?auto_2421688 ) ) ( not ( = ?auto_2421685 ?auto_2421688 ) ) ( not ( = ?auto_2421683 ?auto_2421688 ) ) ( not ( = ?auto_2421689 ?auto_2421688 ) ) ( TRUCK-AT ?auto_2421691 ?auto_2421687 ) ( SURFACE-AT ?auto_2421693 ?auto_2421687 ) ( CLEAR ?auto_2421693 ) ( LIFTING ?auto_2421690 ?auto_2421683 ) ( IS-CRATE ?auto_2421683 ) ( not ( = ?auto_2421693 ?auto_2421683 ) ) ( not ( = ?auto_2421684 ?auto_2421693 ) ) ( not ( = ?auto_2421685 ?auto_2421693 ) ) ( not ( = ?auto_2421689 ?auto_2421693 ) ) ( not ( = ?auto_2421688 ?auto_2421693 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2421684 ?auto_2421685 )
      ( MAKE-2CRATE-VERIFY ?auto_2421683 ?auto_2421684 ?auto_2421685 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2421694 - SURFACE
      ?auto_2421695 - SURFACE
      ?auto_2421696 - SURFACE
      ?auto_2421697 - SURFACE
    )
    :vars
    (
      ?auto_2421703 - HOIST
      ?auto_2421700 - PLACE
      ?auto_2421698 - PLACE
      ?auto_2421704 - HOIST
      ?auto_2421699 - SURFACE
      ?auto_2421701 - SURFACE
      ?auto_2421702 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421703 ?auto_2421700 ) ( IS-CRATE ?auto_2421697 ) ( not ( = ?auto_2421696 ?auto_2421697 ) ) ( not ( = ?auto_2421695 ?auto_2421696 ) ) ( not ( = ?auto_2421695 ?auto_2421697 ) ) ( not ( = ?auto_2421698 ?auto_2421700 ) ) ( HOIST-AT ?auto_2421704 ?auto_2421698 ) ( not ( = ?auto_2421703 ?auto_2421704 ) ) ( SURFACE-AT ?auto_2421697 ?auto_2421698 ) ( ON ?auto_2421697 ?auto_2421699 ) ( CLEAR ?auto_2421697 ) ( not ( = ?auto_2421696 ?auto_2421699 ) ) ( not ( = ?auto_2421697 ?auto_2421699 ) ) ( not ( = ?auto_2421695 ?auto_2421699 ) ) ( IS-CRATE ?auto_2421696 ) ( AVAILABLE ?auto_2421704 ) ( SURFACE-AT ?auto_2421696 ?auto_2421698 ) ( ON ?auto_2421696 ?auto_2421701 ) ( CLEAR ?auto_2421696 ) ( not ( = ?auto_2421696 ?auto_2421701 ) ) ( not ( = ?auto_2421697 ?auto_2421701 ) ) ( not ( = ?auto_2421695 ?auto_2421701 ) ) ( not ( = ?auto_2421699 ?auto_2421701 ) ) ( TRUCK-AT ?auto_2421702 ?auto_2421700 ) ( SURFACE-AT ?auto_2421694 ?auto_2421700 ) ( CLEAR ?auto_2421694 ) ( LIFTING ?auto_2421703 ?auto_2421695 ) ( IS-CRATE ?auto_2421695 ) ( not ( = ?auto_2421694 ?auto_2421695 ) ) ( not ( = ?auto_2421696 ?auto_2421694 ) ) ( not ( = ?auto_2421697 ?auto_2421694 ) ) ( not ( = ?auto_2421699 ?auto_2421694 ) ) ( not ( = ?auto_2421701 ?auto_2421694 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421695 ?auto_2421696 ?auto_2421697 )
      ( MAKE-3CRATE-VERIFY ?auto_2421694 ?auto_2421695 ?auto_2421696 ?auto_2421697 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2421705 - SURFACE
      ?auto_2421706 - SURFACE
      ?auto_2421707 - SURFACE
      ?auto_2421708 - SURFACE
      ?auto_2421709 - SURFACE
    )
    :vars
    (
      ?auto_2421715 - HOIST
      ?auto_2421712 - PLACE
      ?auto_2421710 - PLACE
      ?auto_2421716 - HOIST
      ?auto_2421711 - SURFACE
      ?auto_2421713 - SURFACE
      ?auto_2421714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421715 ?auto_2421712 ) ( IS-CRATE ?auto_2421709 ) ( not ( = ?auto_2421708 ?auto_2421709 ) ) ( not ( = ?auto_2421707 ?auto_2421708 ) ) ( not ( = ?auto_2421707 ?auto_2421709 ) ) ( not ( = ?auto_2421710 ?auto_2421712 ) ) ( HOIST-AT ?auto_2421716 ?auto_2421710 ) ( not ( = ?auto_2421715 ?auto_2421716 ) ) ( SURFACE-AT ?auto_2421709 ?auto_2421710 ) ( ON ?auto_2421709 ?auto_2421711 ) ( CLEAR ?auto_2421709 ) ( not ( = ?auto_2421708 ?auto_2421711 ) ) ( not ( = ?auto_2421709 ?auto_2421711 ) ) ( not ( = ?auto_2421707 ?auto_2421711 ) ) ( IS-CRATE ?auto_2421708 ) ( AVAILABLE ?auto_2421716 ) ( SURFACE-AT ?auto_2421708 ?auto_2421710 ) ( ON ?auto_2421708 ?auto_2421713 ) ( CLEAR ?auto_2421708 ) ( not ( = ?auto_2421708 ?auto_2421713 ) ) ( not ( = ?auto_2421709 ?auto_2421713 ) ) ( not ( = ?auto_2421707 ?auto_2421713 ) ) ( not ( = ?auto_2421711 ?auto_2421713 ) ) ( TRUCK-AT ?auto_2421714 ?auto_2421712 ) ( SURFACE-AT ?auto_2421706 ?auto_2421712 ) ( CLEAR ?auto_2421706 ) ( LIFTING ?auto_2421715 ?auto_2421707 ) ( IS-CRATE ?auto_2421707 ) ( not ( = ?auto_2421706 ?auto_2421707 ) ) ( not ( = ?auto_2421708 ?auto_2421706 ) ) ( not ( = ?auto_2421709 ?auto_2421706 ) ) ( not ( = ?auto_2421711 ?auto_2421706 ) ) ( not ( = ?auto_2421713 ?auto_2421706 ) ) ( ON ?auto_2421706 ?auto_2421705 ) ( not ( = ?auto_2421705 ?auto_2421706 ) ) ( not ( = ?auto_2421705 ?auto_2421707 ) ) ( not ( = ?auto_2421705 ?auto_2421708 ) ) ( not ( = ?auto_2421705 ?auto_2421709 ) ) ( not ( = ?auto_2421705 ?auto_2421711 ) ) ( not ( = ?auto_2421705 ?auto_2421713 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421707 ?auto_2421708 ?auto_2421709 )
      ( MAKE-4CRATE-VERIFY ?auto_2421705 ?auto_2421706 ?auto_2421707 ?auto_2421708 ?auto_2421709 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2421717 - SURFACE
      ?auto_2421718 - SURFACE
      ?auto_2421719 - SURFACE
      ?auto_2421720 - SURFACE
      ?auto_2421721 - SURFACE
      ?auto_2421722 - SURFACE
    )
    :vars
    (
      ?auto_2421728 - HOIST
      ?auto_2421725 - PLACE
      ?auto_2421723 - PLACE
      ?auto_2421729 - HOIST
      ?auto_2421724 - SURFACE
      ?auto_2421726 - SURFACE
      ?auto_2421727 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421728 ?auto_2421725 ) ( IS-CRATE ?auto_2421722 ) ( not ( = ?auto_2421721 ?auto_2421722 ) ) ( not ( = ?auto_2421720 ?auto_2421721 ) ) ( not ( = ?auto_2421720 ?auto_2421722 ) ) ( not ( = ?auto_2421723 ?auto_2421725 ) ) ( HOIST-AT ?auto_2421729 ?auto_2421723 ) ( not ( = ?auto_2421728 ?auto_2421729 ) ) ( SURFACE-AT ?auto_2421722 ?auto_2421723 ) ( ON ?auto_2421722 ?auto_2421724 ) ( CLEAR ?auto_2421722 ) ( not ( = ?auto_2421721 ?auto_2421724 ) ) ( not ( = ?auto_2421722 ?auto_2421724 ) ) ( not ( = ?auto_2421720 ?auto_2421724 ) ) ( IS-CRATE ?auto_2421721 ) ( AVAILABLE ?auto_2421729 ) ( SURFACE-AT ?auto_2421721 ?auto_2421723 ) ( ON ?auto_2421721 ?auto_2421726 ) ( CLEAR ?auto_2421721 ) ( not ( = ?auto_2421721 ?auto_2421726 ) ) ( not ( = ?auto_2421722 ?auto_2421726 ) ) ( not ( = ?auto_2421720 ?auto_2421726 ) ) ( not ( = ?auto_2421724 ?auto_2421726 ) ) ( TRUCK-AT ?auto_2421727 ?auto_2421725 ) ( SURFACE-AT ?auto_2421719 ?auto_2421725 ) ( CLEAR ?auto_2421719 ) ( LIFTING ?auto_2421728 ?auto_2421720 ) ( IS-CRATE ?auto_2421720 ) ( not ( = ?auto_2421719 ?auto_2421720 ) ) ( not ( = ?auto_2421721 ?auto_2421719 ) ) ( not ( = ?auto_2421722 ?auto_2421719 ) ) ( not ( = ?auto_2421724 ?auto_2421719 ) ) ( not ( = ?auto_2421726 ?auto_2421719 ) ) ( ON ?auto_2421718 ?auto_2421717 ) ( ON ?auto_2421719 ?auto_2421718 ) ( not ( = ?auto_2421717 ?auto_2421718 ) ) ( not ( = ?auto_2421717 ?auto_2421719 ) ) ( not ( = ?auto_2421717 ?auto_2421720 ) ) ( not ( = ?auto_2421717 ?auto_2421721 ) ) ( not ( = ?auto_2421717 ?auto_2421722 ) ) ( not ( = ?auto_2421717 ?auto_2421724 ) ) ( not ( = ?auto_2421717 ?auto_2421726 ) ) ( not ( = ?auto_2421718 ?auto_2421719 ) ) ( not ( = ?auto_2421718 ?auto_2421720 ) ) ( not ( = ?auto_2421718 ?auto_2421721 ) ) ( not ( = ?auto_2421718 ?auto_2421722 ) ) ( not ( = ?auto_2421718 ?auto_2421724 ) ) ( not ( = ?auto_2421718 ?auto_2421726 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421720 ?auto_2421721 ?auto_2421722 )
      ( MAKE-5CRATE-VERIFY ?auto_2421717 ?auto_2421718 ?auto_2421719 ?auto_2421720 ?auto_2421721 ?auto_2421722 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2421730 - SURFACE
      ?auto_2421731 - SURFACE
      ?auto_2421732 - SURFACE
      ?auto_2421733 - SURFACE
      ?auto_2421734 - SURFACE
      ?auto_2421735 - SURFACE
      ?auto_2421736 - SURFACE
    )
    :vars
    (
      ?auto_2421742 - HOIST
      ?auto_2421739 - PLACE
      ?auto_2421737 - PLACE
      ?auto_2421743 - HOIST
      ?auto_2421738 - SURFACE
      ?auto_2421740 - SURFACE
      ?auto_2421741 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421742 ?auto_2421739 ) ( IS-CRATE ?auto_2421736 ) ( not ( = ?auto_2421735 ?auto_2421736 ) ) ( not ( = ?auto_2421734 ?auto_2421735 ) ) ( not ( = ?auto_2421734 ?auto_2421736 ) ) ( not ( = ?auto_2421737 ?auto_2421739 ) ) ( HOIST-AT ?auto_2421743 ?auto_2421737 ) ( not ( = ?auto_2421742 ?auto_2421743 ) ) ( SURFACE-AT ?auto_2421736 ?auto_2421737 ) ( ON ?auto_2421736 ?auto_2421738 ) ( CLEAR ?auto_2421736 ) ( not ( = ?auto_2421735 ?auto_2421738 ) ) ( not ( = ?auto_2421736 ?auto_2421738 ) ) ( not ( = ?auto_2421734 ?auto_2421738 ) ) ( IS-CRATE ?auto_2421735 ) ( AVAILABLE ?auto_2421743 ) ( SURFACE-AT ?auto_2421735 ?auto_2421737 ) ( ON ?auto_2421735 ?auto_2421740 ) ( CLEAR ?auto_2421735 ) ( not ( = ?auto_2421735 ?auto_2421740 ) ) ( not ( = ?auto_2421736 ?auto_2421740 ) ) ( not ( = ?auto_2421734 ?auto_2421740 ) ) ( not ( = ?auto_2421738 ?auto_2421740 ) ) ( TRUCK-AT ?auto_2421741 ?auto_2421739 ) ( SURFACE-AT ?auto_2421733 ?auto_2421739 ) ( CLEAR ?auto_2421733 ) ( LIFTING ?auto_2421742 ?auto_2421734 ) ( IS-CRATE ?auto_2421734 ) ( not ( = ?auto_2421733 ?auto_2421734 ) ) ( not ( = ?auto_2421735 ?auto_2421733 ) ) ( not ( = ?auto_2421736 ?auto_2421733 ) ) ( not ( = ?auto_2421738 ?auto_2421733 ) ) ( not ( = ?auto_2421740 ?auto_2421733 ) ) ( ON ?auto_2421731 ?auto_2421730 ) ( ON ?auto_2421732 ?auto_2421731 ) ( ON ?auto_2421733 ?auto_2421732 ) ( not ( = ?auto_2421730 ?auto_2421731 ) ) ( not ( = ?auto_2421730 ?auto_2421732 ) ) ( not ( = ?auto_2421730 ?auto_2421733 ) ) ( not ( = ?auto_2421730 ?auto_2421734 ) ) ( not ( = ?auto_2421730 ?auto_2421735 ) ) ( not ( = ?auto_2421730 ?auto_2421736 ) ) ( not ( = ?auto_2421730 ?auto_2421738 ) ) ( not ( = ?auto_2421730 ?auto_2421740 ) ) ( not ( = ?auto_2421731 ?auto_2421732 ) ) ( not ( = ?auto_2421731 ?auto_2421733 ) ) ( not ( = ?auto_2421731 ?auto_2421734 ) ) ( not ( = ?auto_2421731 ?auto_2421735 ) ) ( not ( = ?auto_2421731 ?auto_2421736 ) ) ( not ( = ?auto_2421731 ?auto_2421738 ) ) ( not ( = ?auto_2421731 ?auto_2421740 ) ) ( not ( = ?auto_2421732 ?auto_2421733 ) ) ( not ( = ?auto_2421732 ?auto_2421734 ) ) ( not ( = ?auto_2421732 ?auto_2421735 ) ) ( not ( = ?auto_2421732 ?auto_2421736 ) ) ( not ( = ?auto_2421732 ?auto_2421738 ) ) ( not ( = ?auto_2421732 ?auto_2421740 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421734 ?auto_2421735 ?auto_2421736 )
      ( MAKE-6CRATE-VERIFY ?auto_2421730 ?auto_2421731 ?auto_2421732 ?auto_2421733 ?auto_2421734 ?auto_2421735 ?auto_2421736 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2421744 - SURFACE
      ?auto_2421745 - SURFACE
      ?auto_2421746 - SURFACE
      ?auto_2421747 - SURFACE
      ?auto_2421748 - SURFACE
      ?auto_2421749 - SURFACE
      ?auto_2421750 - SURFACE
      ?auto_2421751 - SURFACE
    )
    :vars
    (
      ?auto_2421757 - HOIST
      ?auto_2421754 - PLACE
      ?auto_2421752 - PLACE
      ?auto_2421758 - HOIST
      ?auto_2421753 - SURFACE
      ?auto_2421755 - SURFACE
      ?auto_2421756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421757 ?auto_2421754 ) ( IS-CRATE ?auto_2421751 ) ( not ( = ?auto_2421750 ?auto_2421751 ) ) ( not ( = ?auto_2421749 ?auto_2421750 ) ) ( not ( = ?auto_2421749 ?auto_2421751 ) ) ( not ( = ?auto_2421752 ?auto_2421754 ) ) ( HOIST-AT ?auto_2421758 ?auto_2421752 ) ( not ( = ?auto_2421757 ?auto_2421758 ) ) ( SURFACE-AT ?auto_2421751 ?auto_2421752 ) ( ON ?auto_2421751 ?auto_2421753 ) ( CLEAR ?auto_2421751 ) ( not ( = ?auto_2421750 ?auto_2421753 ) ) ( not ( = ?auto_2421751 ?auto_2421753 ) ) ( not ( = ?auto_2421749 ?auto_2421753 ) ) ( IS-CRATE ?auto_2421750 ) ( AVAILABLE ?auto_2421758 ) ( SURFACE-AT ?auto_2421750 ?auto_2421752 ) ( ON ?auto_2421750 ?auto_2421755 ) ( CLEAR ?auto_2421750 ) ( not ( = ?auto_2421750 ?auto_2421755 ) ) ( not ( = ?auto_2421751 ?auto_2421755 ) ) ( not ( = ?auto_2421749 ?auto_2421755 ) ) ( not ( = ?auto_2421753 ?auto_2421755 ) ) ( TRUCK-AT ?auto_2421756 ?auto_2421754 ) ( SURFACE-AT ?auto_2421748 ?auto_2421754 ) ( CLEAR ?auto_2421748 ) ( LIFTING ?auto_2421757 ?auto_2421749 ) ( IS-CRATE ?auto_2421749 ) ( not ( = ?auto_2421748 ?auto_2421749 ) ) ( not ( = ?auto_2421750 ?auto_2421748 ) ) ( not ( = ?auto_2421751 ?auto_2421748 ) ) ( not ( = ?auto_2421753 ?auto_2421748 ) ) ( not ( = ?auto_2421755 ?auto_2421748 ) ) ( ON ?auto_2421745 ?auto_2421744 ) ( ON ?auto_2421746 ?auto_2421745 ) ( ON ?auto_2421747 ?auto_2421746 ) ( ON ?auto_2421748 ?auto_2421747 ) ( not ( = ?auto_2421744 ?auto_2421745 ) ) ( not ( = ?auto_2421744 ?auto_2421746 ) ) ( not ( = ?auto_2421744 ?auto_2421747 ) ) ( not ( = ?auto_2421744 ?auto_2421748 ) ) ( not ( = ?auto_2421744 ?auto_2421749 ) ) ( not ( = ?auto_2421744 ?auto_2421750 ) ) ( not ( = ?auto_2421744 ?auto_2421751 ) ) ( not ( = ?auto_2421744 ?auto_2421753 ) ) ( not ( = ?auto_2421744 ?auto_2421755 ) ) ( not ( = ?auto_2421745 ?auto_2421746 ) ) ( not ( = ?auto_2421745 ?auto_2421747 ) ) ( not ( = ?auto_2421745 ?auto_2421748 ) ) ( not ( = ?auto_2421745 ?auto_2421749 ) ) ( not ( = ?auto_2421745 ?auto_2421750 ) ) ( not ( = ?auto_2421745 ?auto_2421751 ) ) ( not ( = ?auto_2421745 ?auto_2421753 ) ) ( not ( = ?auto_2421745 ?auto_2421755 ) ) ( not ( = ?auto_2421746 ?auto_2421747 ) ) ( not ( = ?auto_2421746 ?auto_2421748 ) ) ( not ( = ?auto_2421746 ?auto_2421749 ) ) ( not ( = ?auto_2421746 ?auto_2421750 ) ) ( not ( = ?auto_2421746 ?auto_2421751 ) ) ( not ( = ?auto_2421746 ?auto_2421753 ) ) ( not ( = ?auto_2421746 ?auto_2421755 ) ) ( not ( = ?auto_2421747 ?auto_2421748 ) ) ( not ( = ?auto_2421747 ?auto_2421749 ) ) ( not ( = ?auto_2421747 ?auto_2421750 ) ) ( not ( = ?auto_2421747 ?auto_2421751 ) ) ( not ( = ?auto_2421747 ?auto_2421753 ) ) ( not ( = ?auto_2421747 ?auto_2421755 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421749 ?auto_2421750 ?auto_2421751 )
      ( MAKE-7CRATE-VERIFY ?auto_2421744 ?auto_2421745 ?auto_2421746 ?auto_2421747 ?auto_2421748 ?auto_2421749 ?auto_2421750 ?auto_2421751 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2421759 - SURFACE
      ?auto_2421760 - SURFACE
      ?auto_2421761 - SURFACE
      ?auto_2421762 - SURFACE
      ?auto_2421763 - SURFACE
      ?auto_2421764 - SURFACE
      ?auto_2421765 - SURFACE
      ?auto_2421766 - SURFACE
      ?auto_2421767 - SURFACE
    )
    :vars
    (
      ?auto_2421773 - HOIST
      ?auto_2421770 - PLACE
      ?auto_2421768 - PLACE
      ?auto_2421774 - HOIST
      ?auto_2421769 - SURFACE
      ?auto_2421771 - SURFACE
      ?auto_2421772 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421773 ?auto_2421770 ) ( IS-CRATE ?auto_2421767 ) ( not ( = ?auto_2421766 ?auto_2421767 ) ) ( not ( = ?auto_2421765 ?auto_2421766 ) ) ( not ( = ?auto_2421765 ?auto_2421767 ) ) ( not ( = ?auto_2421768 ?auto_2421770 ) ) ( HOIST-AT ?auto_2421774 ?auto_2421768 ) ( not ( = ?auto_2421773 ?auto_2421774 ) ) ( SURFACE-AT ?auto_2421767 ?auto_2421768 ) ( ON ?auto_2421767 ?auto_2421769 ) ( CLEAR ?auto_2421767 ) ( not ( = ?auto_2421766 ?auto_2421769 ) ) ( not ( = ?auto_2421767 ?auto_2421769 ) ) ( not ( = ?auto_2421765 ?auto_2421769 ) ) ( IS-CRATE ?auto_2421766 ) ( AVAILABLE ?auto_2421774 ) ( SURFACE-AT ?auto_2421766 ?auto_2421768 ) ( ON ?auto_2421766 ?auto_2421771 ) ( CLEAR ?auto_2421766 ) ( not ( = ?auto_2421766 ?auto_2421771 ) ) ( not ( = ?auto_2421767 ?auto_2421771 ) ) ( not ( = ?auto_2421765 ?auto_2421771 ) ) ( not ( = ?auto_2421769 ?auto_2421771 ) ) ( TRUCK-AT ?auto_2421772 ?auto_2421770 ) ( SURFACE-AT ?auto_2421764 ?auto_2421770 ) ( CLEAR ?auto_2421764 ) ( LIFTING ?auto_2421773 ?auto_2421765 ) ( IS-CRATE ?auto_2421765 ) ( not ( = ?auto_2421764 ?auto_2421765 ) ) ( not ( = ?auto_2421766 ?auto_2421764 ) ) ( not ( = ?auto_2421767 ?auto_2421764 ) ) ( not ( = ?auto_2421769 ?auto_2421764 ) ) ( not ( = ?auto_2421771 ?auto_2421764 ) ) ( ON ?auto_2421760 ?auto_2421759 ) ( ON ?auto_2421761 ?auto_2421760 ) ( ON ?auto_2421762 ?auto_2421761 ) ( ON ?auto_2421763 ?auto_2421762 ) ( ON ?auto_2421764 ?auto_2421763 ) ( not ( = ?auto_2421759 ?auto_2421760 ) ) ( not ( = ?auto_2421759 ?auto_2421761 ) ) ( not ( = ?auto_2421759 ?auto_2421762 ) ) ( not ( = ?auto_2421759 ?auto_2421763 ) ) ( not ( = ?auto_2421759 ?auto_2421764 ) ) ( not ( = ?auto_2421759 ?auto_2421765 ) ) ( not ( = ?auto_2421759 ?auto_2421766 ) ) ( not ( = ?auto_2421759 ?auto_2421767 ) ) ( not ( = ?auto_2421759 ?auto_2421769 ) ) ( not ( = ?auto_2421759 ?auto_2421771 ) ) ( not ( = ?auto_2421760 ?auto_2421761 ) ) ( not ( = ?auto_2421760 ?auto_2421762 ) ) ( not ( = ?auto_2421760 ?auto_2421763 ) ) ( not ( = ?auto_2421760 ?auto_2421764 ) ) ( not ( = ?auto_2421760 ?auto_2421765 ) ) ( not ( = ?auto_2421760 ?auto_2421766 ) ) ( not ( = ?auto_2421760 ?auto_2421767 ) ) ( not ( = ?auto_2421760 ?auto_2421769 ) ) ( not ( = ?auto_2421760 ?auto_2421771 ) ) ( not ( = ?auto_2421761 ?auto_2421762 ) ) ( not ( = ?auto_2421761 ?auto_2421763 ) ) ( not ( = ?auto_2421761 ?auto_2421764 ) ) ( not ( = ?auto_2421761 ?auto_2421765 ) ) ( not ( = ?auto_2421761 ?auto_2421766 ) ) ( not ( = ?auto_2421761 ?auto_2421767 ) ) ( not ( = ?auto_2421761 ?auto_2421769 ) ) ( not ( = ?auto_2421761 ?auto_2421771 ) ) ( not ( = ?auto_2421762 ?auto_2421763 ) ) ( not ( = ?auto_2421762 ?auto_2421764 ) ) ( not ( = ?auto_2421762 ?auto_2421765 ) ) ( not ( = ?auto_2421762 ?auto_2421766 ) ) ( not ( = ?auto_2421762 ?auto_2421767 ) ) ( not ( = ?auto_2421762 ?auto_2421769 ) ) ( not ( = ?auto_2421762 ?auto_2421771 ) ) ( not ( = ?auto_2421763 ?auto_2421764 ) ) ( not ( = ?auto_2421763 ?auto_2421765 ) ) ( not ( = ?auto_2421763 ?auto_2421766 ) ) ( not ( = ?auto_2421763 ?auto_2421767 ) ) ( not ( = ?auto_2421763 ?auto_2421769 ) ) ( not ( = ?auto_2421763 ?auto_2421771 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421765 ?auto_2421766 ?auto_2421767 )
      ( MAKE-8CRATE-VERIFY ?auto_2421759 ?auto_2421760 ?auto_2421761 ?auto_2421762 ?auto_2421763 ?auto_2421764 ?auto_2421765 ?auto_2421766 ?auto_2421767 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2421775 - SURFACE
      ?auto_2421776 - SURFACE
      ?auto_2421777 - SURFACE
      ?auto_2421778 - SURFACE
      ?auto_2421779 - SURFACE
      ?auto_2421780 - SURFACE
      ?auto_2421781 - SURFACE
      ?auto_2421782 - SURFACE
      ?auto_2421783 - SURFACE
      ?auto_2421784 - SURFACE
    )
    :vars
    (
      ?auto_2421790 - HOIST
      ?auto_2421787 - PLACE
      ?auto_2421785 - PLACE
      ?auto_2421791 - HOIST
      ?auto_2421786 - SURFACE
      ?auto_2421788 - SURFACE
      ?auto_2421789 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421790 ?auto_2421787 ) ( IS-CRATE ?auto_2421784 ) ( not ( = ?auto_2421783 ?auto_2421784 ) ) ( not ( = ?auto_2421782 ?auto_2421783 ) ) ( not ( = ?auto_2421782 ?auto_2421784 ) ) ( not ( = ?auto_2421785 ?auto_2421787 ) ) ( HOIST-AT ?auto_2421791 ?auto_2421785 ) ( not ( = ?auto_2421790 ?auto_2421791 ) ) ( SURFACE-AT ?auto_2421784 ?auto_2421785 ) ( ON ?auto_2421784 ?auto_2421786 ) ( CLEAR ?auto_2421784 ) ( not ( = ?auto_2421783 ?auto_2421786 ) ) ( not ( = ?auto_2421784 ?auto_2421786 ) ) ( not ( = ?auto_2421782 ?auto_2421786 ) ) ( IS-CRATE ?auto_2421783 ) ( AVAILABLE ?auto_2421791 ) ( SURFACE-AT ?auto_2421783 ?auto_2421785 ) ( ON ?auto_2421783 ?auto_2421788 ) ( CLEAR ?auto_2421783 ) ( not ( = ?auto_2421783 ?auto_2421788 ) ) ( not ( = ?auto_2421784 ?auto_2421788 ) ) ( not ( = ?auto_2421782 ?auto_2421788 ) ) ( not ( = ?auto_2421786 ?auto_2421788 ) ) ( TRUCK-AT ?auto_2421789 ?auto_2421787 ) ( SURFACE-AT ?auto_2421781 ?auto_2421787 ) ( CLEAR ?auto_2421781 ) ( LIFTING ?auto_2421790 ?auto_2421782 ) ( IS-CRATE ?auto_2421782 ) ( not ( = ?auto_2421781 ?auto_2421782 ) ) ( not ( = ?auto_2421783 ?auto_2421781 ) ) ( not ( = ?auto_2421784 ?auto_2421781 ) ) ( not ( = ?auto_2421786 ?auto_2421781 ) ) ( not ( = ?auto_2421788 ?auto_2421781 ) ) ( ON ?auto_2421776 ?auto_2421775 ) ( ON ?auto_2421777 ?auto_2421776 ) ( ON ?auto_2421778 ?auto_2421777 ) ( ON ?auto_2421779 ?auto_2421778 ) ( ON ?auto_2421780 ?auto_2421779 ) ( ON ?auto_2421781 ?auto_2421780 ) ( not ( = ?auto_2421775 ?auto_2421776 ) ) ( not ( = ?auto_2421775 ?auto_2421777 ) ) ( not ( = ?auto_2421775 ?auto_2421778 ) ) ( not ( = ?auto_2421775 ?auto_2421779 ) ) ( not ( = ?auto_2421775 ?auto_2421780 ) ) ( not ( = ?auto_2421775 ?auto_2421781 ) ) ( not ( = ?auto_2421775 ?auto_2421782 ) ) ( not ( = ?auto_2421775 ?auto_2421783 ) ) ( not ( = ?auto_2421775 ?auto_2421784 ) ) ( not ( = ?auto_2421775 ?auto_2421786 ) ) ( not ( = ?auto_2421775 ?auto_2421788 ) ) ( not ( = ?auto_2421776 ?auto_2421777 ) ) ( not ( = ?auto_2421776 ?auto_2421778 ) ) ( not ( = ?auto_2421776 ?auto_2421779 ) ) ( not ( = ?auto_2421776 ?auto_2421780 ) ) ( not ( = ?auto_2421776 ?auto_2421781 ) ) ( not ( = ?auto_2421776 ?auto_2421782 ) ) ( not ( = ?auto_2421776 ?auto_2421783 ) ) ( not ( = ?auto_2421776 ?auto_2421784 ) ) ( not ( = ?auto_2421776 ?auto_2421786 ) ) ( not ( = ?auto_2421776 ?auto_2421788 ) ) ( not ( = ?auto_2421777 ?auto_2421778 ) ) ( not ( = ?auto_2421777 ?auto_2421779 ) ) ( not ( = ?auto_2421777 ?auto_2421780 ) ) ( not ( = ?auto_2421777 ?auto_2421781 ) ) ( not ( = ?auto_2421777 ?auto_2421782 ) ) ( not ( = ?auto_2421777 ?auto_2421783 ) ) ( not ( = ?auto_2421777 ?auto_2421784 ) ) ( not ( = ?auto_2421777 ?auto_2421786 ) ) ( not ( = ?auto_2421777 ?auto_2421788 ) ) ( not ( = ?auto_2421778 ?auto_2421779 ) ) ( not ( = ?auto_2421778 ?auto_2421780 ) ) ( not ( = ?auto_2421778 ?auto_2421781 ) ) ( not ( = ?auto_2421778 ?auto_2421782 ) ) ( not ( = ?auto_2421778 ?auto_2421783 ) ) ( not ( = ?auto_2421778 ?auto_2421784 ) ) ( not ( = ?auto_2421778 ?auto_2421786 ) ) ( not ( = ?auto_2421778 ?auto_2421788 ) ) ( not ( = ?auto_2421779 ?auto_2421780 ) ) ( not ( = ?auto_2421779 ?auto_2421781 ) ) ( not ( = ?auto_2421779 ?auto_2421782 ) ) ( not ( = ?auto_2421779 ?auto_2421783 ) ) ( not ( = ?auto_2421779 ?auto_2421784 ) ) ( not ( = ?auto_2421779 ?auto_2421786 ) ) ( not ( = ?auto_2421779 ?auto_2421788 ) ) ( not ( = ?auto_2421780 ?auto_2421781 ) ) ( not ( = ?auto_2421780 ?auto_2421782 ) ) ( not ( = ?auto_2421780 ?auto_2421783 ) ) ( not ( = ?auto_2421780 ?auto_2421784 ) ) ( not ( = ?auto_2421780 ?auto_2421786 ) ) ( not ( = ?auto_2421780 ?auto_2421788 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421782 ?auto_2421783 ?auto_2421784 )
      ( MAKE-9CRATE-VERIFY ?auto_2421775 ?auto_2421776 ?auto_2421777 ?auto_2421778 ?auto_2421779 ?auto_2421780 ?auto_2421781 ?auto_2421782 ?auto_2421783 ?auto_2421784 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2421792 - SURFACE
      ?auto_2421793 - SURFACE
      ?auto_2421794 - SURFACE
      ?auto_2421795 - SURFACE
      ?auto_2421796 - SURFACE
      ?auto_2421797 - SURFACE
      ?auto_2421798 - SURFACE
      ?auto_2421799 - SURFACE
      ?auto_2421800 - SURFACE
      ?auto_2421801 - SURFACE
      ?auto_2421802 - SURFACE
    )
    :vars
    (
      ?auto_2421808 - HOIST
      ?auto_2421805 - PLACE
      ?auto_2421803 - PLACE
      ?auto_2421809 - HOIST
      ?auto_2421804 - SURFACE
      ?auto_2421806 - SURFACE
      ?auto_2421807 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421808 ?auto_2421805 ) ( IS-CRATE ?auto_2421802 ) ( not ( = ?auto_2421801 ?auto_2421802 ) ) ( not ( = ?auto_2421800 ?auto_2421801 ) ) ( not ( = ?auto_2421800 ?auto_2421802 ) ) ( not ( = ?auto_2421803 ?auto_2421805 ) ) ( HOIST-AT ?auto_2421809 ?auto_2421803 ) ( not ( = ?auto_2421808 ?auto_2421809 ) ) ( SURFACE-AT ?auto_2421802 ?auto_2421803 ) ( ON ?auto_2421802 ?auto_2421804 ) ( CLEAR ?auto_2421802 ) ( not ( = ?auto_2421801 ?auto_2421804 ) ) ( not ( = ?auto_2421802 ?auto_2421804 ) ) ( not ( = ?auto_2421800 ?auto_2421804 ) ) ( IS-CRATE ?auto_2421801 ) ( AVAILABLE ?auto_2421809 ) ( SURFACE-AT ?auto_2421801 ?auto_2421803 ) ( ON ?auto_2421801 ?auto_2421806 ) ( CLEAR ?auto_2421801 ) ( not ( = ?auto_2421801 ?auto_2421806 ) ) ( not ( = ?auto_2421802 ?auto_2421806 ) ) ( not ( = ?auto_2421800 ?auto_2421806 ) ) ( not ( = ?auto_2421804 ?auto_2421806 ) ) ( TRUCK-AT ?auto_2421807 ?auto_2421805 ) ( SURFACE-AT ?auto_2421799 ?auto_2421805 ) ( CLEAR ?auto_2421799 ) ( LIFTING ?auto_2421808 ?auto_2421800 ) ( IS-CRATE ?auto_2421800 ) ( not ( = ?auto_2421799 ?auto_2421800 ) ) ( not ( = ?auto_2421801 ?auto_2421799 ) ) ( not ( = ?auto_2421802 ?auto_2421799 ) ) ( not ( = ?auto_2421804 ?auto_2421799 ) ) ( not ( = ?auto_2421806 ?auto_2421799 ) ) ( ON ?auto_2421793 ?auto_2421792 ) ( ON ?auto_2421794 ?auto_2421793 ) ( ON ?auto_2421795 ?auto_2421794 ) ( ON ?auto_2421796 ?auto_2421795 ) ( ON ?auto_2421797 ?auto_2421796 ) ( ON ?auto_2421798 ?auto_2421797 ) ( ON ?auto_2421799 ?auto_2421798 ) ( not ( = ?auto_2421792 ?auto_2421793 ) ) ( not ( = ?auto_2421792 ?auto_2421794 ) ) ( not ( = ?auto_2421792 ?auto_2421795 ) ) ( not ( = ?auto_2421792 ?auto_2421796 ) ) ( not ( = ?auto_2421792 ?auto_2421797 ) ) ( not ( = ?auto_2421792 ?auto_2421798 ) ) ( not ( = ?auto_2421792 ?auto_2421799 ) ) ( not ( = ?auto_2421792 ?auto_2421800 ) ) ( not ( = ?auto_2421792 ?auto_2421801 ) ) ( not ( = ?auto_2421792 ?auto_2421802 ) ) ( not ( = ?auto_2421792 ?auto_2421804 ) ) ( not ( = ?auto_2421792 ?auto_2421806 ) ) ( not ( = ?auto_2421793 ?auto_2421794 ) ) ( not ( = ?auto_2421793 ?auto_2421795 ) ) ( not ( = ?auto_2421793 ?auto_2421796 ) ) ( not ( = ?auto_2421793 ?auto_2421797 ) ) ( not ( = ?auto_2421793 ?auto_2421798 ) ) ( not ( = ?auto_2421793 ?auto_2421799 ) ) ( not ( = ?auto_2421793 ?auto_2421800 ) ) ( not ( = ?auto_2421793 ?auto_2421801 ) ) ( not ( = ?auto_2421793 ?auto_2421802 ) ) ( not ( = ?auto_2421793 ?auto_2421804 ) ) ( not ( = ?auto_2421793 ?auto_2421806 ) ) ( not ( = ?auto_2421794 ?auto_2421795 ) ) ( not ( = ?auto_2421794 ?auto_2421796 ) ) ( not ( = ?auto_2421794 ?auto_2421797 ) ) ( not ( = ?auto_2421794 ?auto_2421798 ) ) ( not ( = ?auto_2421794 ?auto_2421799 ) ) ( not ( = ?auto_2421794 ?auto_2421800 ) ) ( not ( = ?auto_2421794 ?auto_2421801 ) ) ( not ( = ?auto_2421794 ?auto_2421802 ) ) ( not ( = ?auto_2421794 ?auto_2421804 ) ) ( not ( = ?auto_2421794 ?auto_2421806 ) ) ( not ( = ?auto_2421795 ?auto_2421796 ) ) ( not ( = ?auto_2421795 ?auto_2421797 ) ) ( not ( = ?auto_2421795 ?auto_2421798 ) ) ( not ( = ?auto_2421795 ?auto_2421799 ) ) ( not ( = ?auto_2421795 ?auto_2421800 ) ) ( not ( = ?auto_2421795 ?auto_2421801 ) ) ( not ( = ?auto_2421795 ?auto_2421802 ) ) ( not ( = ?auto_2421795 ?auto_2421804 ) ) ( not ( = ?auto_2421795 ?auto_2421806 ) ) ( not ( = ?auto_2421796 ?auto_2421797 ) ) ( not ( = ?auto_2421796 ?auto_2421798 ) ) ( not ( = ?auto_2421796 ?auto_2421799 ) ) ( not ( = ?auto_2421796 ?auto_2421800 ) ) ( not ( = ?auto_2421796 ?auto_2421801 ) ) ( not ( = ?auto_2421796 ?auto_2421802 ) ) ( not ( = ?auto_2421796 ?auto_2421804 ) ) ( not ( = ?auto_2421796 ?auto_2421806 ) ) ( not ( = ?auto_2421797 ?auto_2421798 ) ) ( not ( = ?auto_2421797 ?auto_2421799 ) ) ( not ( = ?auto_2421797 ?auto_2421800 ) ) ( not ( = ?auto_2421797 ?auto_2421801 ) ) ( not ( = ?auto_2421797 ?auto_2421802 ) ) ( not ( = ?auto_2421797 ?auto_2421804 ) ) ( not ( = ?auto_2421797 ?auto_2421806 ) ) ( not ( = ?auto_2421798 ?auto_2421799 ) ) ( not ( = ?auto_2421798 ?auto_2421800 ) ) ( not ( = ?auto_2421798 ?auto_2421801 ) ) ( not ( = ?auto_2421798 ?auto_2421802 ) ) ( not ( = ?auto_2421798 ?auto_2421804 ) ) ( not ( = ?auto_2421798 ?auto_2421806 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421800 ?auto_2421801 ?auto_2421802 )
      ( MAKE-10CRATE-VERIFY ?auto_2421792 ?auto_2421793 ?auto_2421794 ?auto_2421795 ?auto_2421796 ?auto_2421797 ?auto_2421798 ?auto_2421799 ?auto_2421800 ?auto_2421801 ?auto_2421802 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2421810 - SURFACE
      ?auto_2421811 - SURFACE
      ?auto_2421812 - SURFACE
      ?auto_2421813 - SURFACE
      ?auto_2421814 - SURFACE
      ?auto_2421815 - SURFACE
      ?auto_2421816 - SURFACE
      ?auto_2421817 - SURFACE
      ?auto_2421818 - SURFACE
      ?auto_2421819 - SURFACE
      ?auto_2421820 - SURFACE
      ?auto_2421821 - SURFACE
    )
    :vars
    (
      ?auto_2421827 - HOIST
      ?auto_2421824 - PLACE
      ?auto_2421822 - PLACE
      ?auto_2421828 - HOIST
      ?auto_2421823 - SURFACE
      ?auto_2421825 - SURFACE
      ?auto_2421826 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421827 ?auto_2421824 ) ( IS-CRATE ?auto_2421821 ) ( not ( = ?auto_2421820 ?auto_2421821 ) ) ( not ( = ?auto_2421819 ?auto_2421820 ) ) ( not ( = ?auto_2421819 ?auto_2421821 ) ) ( not ( = ?auto_2421822 ?auto_2421824 ) ) ( HOIST-AT ?auto_2421828 ?auto_2421822 ) ( not ( = ?auto_2421827 ?auto_2421828 ) ) ( SURFACE-AT ?auto_2421821 ?auto_2421822 ) ( ON ?auto_2421821 ?auto_2421823 ) ( CLEAR ?auto_2421821 ) ( not ( = ?auto_2421820 ?auto_2421823 ) ) ( not ( = ?auto_2421821 ?auto_2421823 ) ) ( not ( = ?auto_2421819 ?auto_2421823 ) ) ( IS-CRATE ?auto_2421820 ) ( AVAILABLE ?auto_2421828 ) ( SURFACE-AT ?auto_2421820 ?auto_2421822 ) ( ON ?auto_2421820 ?auto_2421825 ) ( CLEAR ?auto_2421820 ) ( not ( = ?auto_2421820 ?auto_2421825 ) ) ( not ( = ?auto_2421821 ?auto_2421825 ) ) ( not ( = ?auto_2421819 ?auto_2421825 ) ) ( not ( = ?auto_2421823 ?auto_2421825 ) ) ( TRUCK-AT ?auto_2421826 ?auto_2421824 ) ( SURFACE-AT ?auto_2421818 ?auto_2421824 ) ( CLEAR ?auto_2421818 ) ( LIFTING ?auto_2421827 ?auto_2421819 ) ( IS-CRATE ?auto_2421819 ) ( not ( = ?auto_2421818 ?auto_2421819 ) ) ( not ( = ?auto_2421820 ?auto_2421818 ) ) ( not ( = ?auto_2421821 ?auto_2421818 ) ) ( not ( = ?auto_2421823 ?auto_2421818 ) ) ( not ( = ?auto_2421825 ?auto_2421818 ) ) ( ON ?auto_2421811 ?auto_2421810 ) ( ON ?auto_2421812 ?auto_2421811 ) ( ON ?auto_2421813 ?auto_2421812 ) ( ON ?auto_2421814 ?auto_2421813 ) ( ON ?auto_2421815 ?auto_2421814 ) ( ON ?auto_2421816 ?auto_2421815 ) ( ON ?auto_2421817 ?auto_2421816 ) ( ON ?auto_2421818 ?auto_2421817 ) ( not ( = ?auto_2421810 ?auto_2421811 ) ) ( not ( = ?auto_2421810 ?auto_2421812 ) ) ( not ( = ?auto_2421810 ?auto_2421813 ) ) ( not ( = ?auto_2421810 ?auto_2421814 ) ) ( not ( = ?auto_2421810 ?auto_2421815 ) ) ( not ( = ?auto_2421810 ?auto_2421816 ) ) ( not ( = ?auto_2421810 ?auto_2421817 ) ) ( not ( = ?auto_2421810 ?auto_2421818 ) ) ( not ( = ?auto_2421810 ?auto_2421819 ) ) ( not ( = ?auto_2421810 ?auto_2421820 ) ) ( not ( = ?auto_2421810 ?auto_2421821 ) ) ( not ( = ?auto_2421810 ?auto_2421823 ) ) ( not ( = ?auto_2421810 ?auto_2421825 ) ) ( not ( = ?auto_2421811 ?auto_2421812 ) ) ( not ( = ?auto_2421811 ?auto_2421813 ) ) ( not ( = ?auto_2421811 ?auto_2421814 ) ) ( not ( = ?auto_2421811 ?auto_2421815 ) ) ( not ( = ?auto_2421811 ?auto_2421816 ) ) ( not ( = ?auto_2421811 ?auto_2421817 ) ) ( not ( = ?auto_2421811 ?auto_2421818 ) ) ( not ( = ?auto_2421811 ?auto_2421819 ) ) ( not ( = ?auto_2421811 ?auto_2421820 ) ) ( not ( = ?auto_2421811 ?auto_2421821 ) ) ( not ( = ?auto_2421811 ?auto_2421823 ) ) ( not ( = ?auto_2421811 ?auto_2421825 ) ) ( not ( = ?auto_2421812 ?auto_2421813 ) ) ( not ( = ?auto_2421812 ?auto_2421814 ) ) ( not ( = ?auto_2421812 ?auto_2421815 ) ) ( not ( = ?auto_2421812 ?auto_2421816 ) ) ( not ( = ?auto_2421812 ?auto_2421817 ) ) ( not ( = ?auto_2421812 ?auto_2421818 ) ) ( not ( = ?auto_2421812 ?auto_2421819 ) ) ( not ( = ?auto_2421812 ?auto_2421820 ) ) ( not ( = ?auto_2421812 ?auto_2421821 ) ) ( not ( = ?auto_2421812 ?auto_2421823 ) ) ( not ( = ?auto_2421812 ?auto_2421825 ) ) ( not ( = ?auto_2421813 ?auto_2421814 ) ) ( not ( = ?auto_2421813 ?auto_2421815 ) ) ( not ( = ?auto_2421813 ?auto_2421816 ) ) ( not ( = ?auto_2421813 ?auto_2421817 ) ) ( not ( = ?auto_2421813 ?auto_2421818 ) ) ( not ( = ?auto_2421813 ?auto_2421819 ) ) ( not ( = ?auto_2421813 ?auto_2421820 ) ) ( not ( = ?auto_2421813 ?auto_2421821 ) ) ( not ( = ?auto_2421813 ?auto_2421823 ) ) ( not ( = ?auto_2421813 ?auto_2421825 ) ) ( not ( = ?auto_2421814 ?auto_2421815 ) ) ( not ( = ?auto_2421814 ?auto_2421816 ) ) ( not ( = ?auto_2421814 ?auto_2421817 ) ) ( not ( = ?auto_2421814 ?auto_2421818 ) ) ( not ( = ?auto_2421814 ?auto_2421819 ) ) ( not ( = ?auto_2421814 ?auto_2421820 ) ) ( not ( = ?auto_2421814 ?auto_2421821 ) ) ( not ( = ?auto_2421814 ?auto_2421823 ) ) ( not ( = ?auto_2421814 ?auto_2421825 ) ) ( not ( = ?auto_2421815 ?auto_2421816 ) ) ( not ( = ?auto_2421815 ?auto_2421817 ) ) ( not ( = ?auto_2421815 ?auto_2421818 ) ) ( not ( = ?auto_2421815 ?auto_2421819 ) ) ( not ( = ?auto_2421815 ?auto_2421820 ) ) ( not ( = ?auto_2421815 ?auto_2421821 ) ) ( not ( = ?auto_2421815 ?auto_2421823 ) ) ( not ( = ?auto_2421815 ?auto_2421825 ) ) ( not ( = ?auto_2421816 ?auto_2421817 ) ) ( not ( = ?auto_2421816 ?auto_2421818 ) ) ( not ( = ?auto_2421816 ?auto_2421819 ) ) ( not ( = ?auto_2421816 ?auto_2421820 ) ) ( not ( = ?auto_2421816 ?auto_2421821 ) ) ( not ( = ?auto_2421816 ?auto_2421823 ) ) ( not ( = ?auto_2421816 ?auto_2421825 ) ) ( not ( = ?auto_2421817 ?auto_2421818 ) ) ( not ( = ?auto_2421817 ?auto_2421819 ) ) ( not ( = ?auto_2421817 ?auto_2421820 ) ) ( not ( = ?auto_2421817 ?auto_2421821 ) ) ( not ( = ?auto_2421817 ?auto_2421823 ) ) ( not ( = ?auto_2421817 ?auto_2421825 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421819 ?auto_2421820 ?auto_2421821 )
      ( MAKE-11CRATE-VERIFY ?auto_2421810 ?auto_2421811 ?auto_2421812 ?auto_2421813 ?auto_2421814 ?auto_2421815 ?auto_2421816 ?auto_2421817 ?auto_2421818 ?auto_2421819 ?auto_2421820 ?auto_2421821 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2430216 - SURFACE
      ?auto_2430217 - SURFACE
      ?auto_2430218 - SURFACE
      ?auto_2430219 - SURFACE
      ?auto_2430220 - SURFACE
      ?auto_2430221 - SURFACE
      ?auto_2430222 - SURFACE
      ?auto_2430223 - SURFACE
      ?auto_2430224 - SURFACE
      ?auto_2430225 - SURFACE
      ?auto_2430226 - SURFACE
      ?auto_2430227 - SURFACE
      ?auto_2430228 - SURFACE
    )
    :vars
    (
      ?auto_2430230 - HOIST
      ?auto_2430229 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2430230 ?auto_2430229 ) ( SURFACE-AT ?auto_2430227 ?auto_2430229 ) ( CLEAR ?auto_2430227 ) ( LIFTING ?auto_2430230 ?auto_2430228 ) ( IS-CRATE ?auto_2430228 ) ( not ( = ?auto_2430227 ?auto_2430228 ) ) ( ON ?auto_2430217 ?auto_2430216 ) ( ON ?auto_2430218 ?auto_2430217 ) ( ON ?auto_2430219 ?auto_2430218 ) ( ON ?auto_2430220 ?auto_2430219 ) ( ON ?auto_2430221 ?auto_2430220 ) ( ON ?auto_2430222 ?auto_2430221 ) ( ON ?auto_2430223 ?auto_2430222 ) ( ON ?auto_2430224 ?auto_2430223 ) ( ON ?auto_2430225 ?auto_2430224 ) ( ON ?auto_2430226 ?auto_2430225 ) ( ON ?auto_2430227 ?auto_2430226 ) ( not ( = ?auto_2430216 ?auto_2430217 ) ) ( not ( = ?auto_2430216 ?auto_2430218 ) ) ( not ( = ?auto_2430216 ?auto_2430219 ) ) ( not ( = ?auto_2430216 ?auto_2430220 ) ) ( not ( = ?auto_2430216 ?auto_2430221 ) ) ( not ( = ?auto_2430216 ?auto_2430222 ) ) ( not ( = ?auto_2430216 ?auto_2430223 ) ) ( not ( = ?auto_2430216 ?auto_2430224 ) ) ( not ( = ?auto_2430216 ?auto_2430225 ) ) ( not ( = ?auto_2430216 ?auto_2430226 ) ) ( not ( = ?auto_2430216 ?auto_2430227 ) ) ( not ( = ?auto_2430216 ?auto_2430228 ) ) ( not ( = ?auto_2430217 ?auto_2430218 ) ) ( not ( = ?auto_2430217 ?auto_2430219 ) ) ( not ( = ?auto_2430217 ?auto_2430220 ) ) ( not ( = ?auto_2430217 ?auto_2430221 ) ) ( not ( = ?auto_2430217 ?auto_2430222 ) ) ( not ( = ?auto_2430217 ?auto_2430223 ) ) ( not ( = ?auto_2430217 ?auto_2430224 ) ) ( not ( = ?auto_2430217 ?auto_2430225 ) ) ( not ( = ?auto_2430217 ?auto_2430226 ) ) ( not ( = ?auto_2430217 ?auto_2430227 ) ) ( not ( = ?auto_2430217 ?auto_2430228 ) ) ( not ( = ?auto_2430218 ?auto_2430219 ) ) ( not ( = ?auto_2430218 ?auto_2430220 ) ) ( not ( = ?auto_2430218 ?auto_2430221 ) ) ( not ( = ?auto_2430218 ?auto_2430222 ) ) ( not ( = ?auto_2430218 ?auto_2430223 ) ) ( not ( = ?auto_2430218 ?auto_2430224 ) ) ( not ( = ?auto_2430218 ?auto_2430225 ) ) ( not ( = ?auto_2430218 ?auto_2430226 ) ) ( not ( = ?auto_2430218 ?auto_2430227 ) ) ( not ( = ?auto_2430218 ?auto_2430228 ) ) ( not ( = ?auto_2430219 ?auto_2430220 ) ) ( not ( = ?auto_2430219 ?auto_2430221 ) ) ( not ( = ?auto_2430219 ?auto_2430222 ) ) ( not ( = ?auto_2430219 ?auto_2430223 ) ) ( not ( = ?auto_2430219 ?auto_2430224 ) ) ( not ( = ?auto_2430219 ?auto_2430225 ) ) ( not ( = ?auto_2430219 ?auto_2430226 ) ) ( not ( = ?auto_2430219 ?auto_2430227 ) ) ( not ( = ?auto_2430219 ?auto_2430228 ) ) ( not ( = ?auto_2430220 ?auto_2430221 ) ) ( not ( = ?auto_2430220 ?auto_2430222 ) ) ( not ( = ?auto_2430220 ?auto_2430223 ) ) ( not ( = ?auto_2430220 ?auto_2430224 ) ) ( not ( = ?auto_2430220 ?auto_2430225 ) ) ( not ( = ?auto_2430220 ?auto_2430226 ) ) ( not ( = ?auto_2430220 ?auto_2430227 ) ) ( not ( = ?auto_2430220 ?auto_2430228 ) ) ( not ( = ?auto_2430221 ?auto_2430222 ) ) ( not ( = ?auto_2430221 ?auto_2430223 ) ) ( not ( = ?auto_2430221 ?auto_2430224 ) ) ( not ( = ?auto_2430221 ?auto_2430225 ) ) ( not ( = ?auto_2430221 ?auto_2430226 ) ) ( not ( = ?auto_2430221 ?auto_2430227 ) ) ( not ( = ?auto_2430221 ?auto_2430228 ) ) ( not ( = ?auto_2430222 ?auto_2430223 ) ) ( not ( = ?auto_2430222 ?auto_2430224 ) ) ( not ( = ?auto_2430222 ?auto_2430225 ) ) ( not ( = ?auto_2430222 ?auto_2430226 ) ) ( not ( = ?auto_2430222 ?auto_2430227 ) ) ( not ( = ?auto_2430222 ?auto_2430228 ) ) ( not ( = ?auto_2430223 ?auto_2430224 ) ) ( not ( = ?auto_2430223 ?auto_2430225 ) ) ( not ( = ?auto_2430223 ?auto_2430226 ) ) ( not ( = ?auto_2430223 ?auto_2430227 ) ) ( not ( = ?auto_2430223 ?auto_2430228 ) ) ( not ( = ?auto_2430224 ?auto_2430225 ) ) ( not ( = ?auto_2430224 ?auto_2430226 ) ) ( not ( = ?auto_2430224 ?auto_2430227 ) ) ( not ( = ?auto_2430224 ?auto_2430228 ) ) ( not ( = ?auto_2430225 ?auto_2430226 ) ) ( not ( = ?auto_2430225 ?auto_2430227 ) ) ( not ( = ?auto_2430225 ?auto_2430228 ) ) ( not ( = ?auto_2430226 ?auto_2430227 ) ) ( not ( = ?auto_2430226 ?auto_2430228 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2430227 ?auto_2430228 )
      ( MAKE-12CRATE-VERIFY ?auto_2430216 ?auto_2430217 ?auto_2430218 ?auto_2430219 ?auto_2430220 ?auto_2430221 ?auto_2430222 ?auto_2430223 ?auto_2430224 ?auto_2430225 ?auto_2430226 ?auto_2430227 ?auto_2430228 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2430341 - SURFACE
      ?auto_2430342 - SURFACE
      ?auto_2430343 - SURFACE
      ?auto_2430344 - SURFACE
      ?auto_2430345 - SURFACE
      ?auto_2430346 - SURFACE
      ?auto_2430347 - SURFACE
      ?auto_2430348 - SURFACE
      ?auto_2430349 - SURFACE
      ?auto_2430350 - SURFACE
      ?auto_2430351 - SURFACE
      ?auto_2430352 - SURFACE
      ?auto_2430353 - SURFACE
    )
    :vars
    (
      ?auto_2430355 - HOIST
      ?auto_2430356 - PLACE
      ?auto_2430354 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2430355 ?auto_2430356 ) ( SURFACE-AT ?auto_2430352 ?auto_2430356 ) ( CLEAR ?auto_2430352 ) ( IS-CRATE ?auto_2430353 ) ( not ( = ?auto_2430352 ?auto_2430353 ) ) ( TRUCK-AT ?auto_2430354 ?auto_2430356 ) ( AVAILABLE ?auto_2430355 ) ( IN ?auto_2430353 ?auto_2430354 ) ( ON ?auto_2430352 ?auto_2430351 ) ( not ( = ?auto_2430351 ?auto_2430352 ) ) ( not ( = ?auto_2430351 ?auto_2430353 ) ) ( ON ?auto_2430342 ?auto_2430341 ) ( ON ?auto_2430343 ?auto_2430342 ) ( ON ?auto_2430344 ?auto_2430343 ) ( ON ?auto_2430345 ?auto_2430344 ) ( ON ?auto_2430346 ?auto_2430345 ) ( ON ?auto_2430347 ?auto_2430346 ) ( ON ?auto_2430348 ?auto_2430347 ) ( ON ?auto_2430349 ?auto_2430348 ) ( ON ?auto_2430350 ?auto_2430349 ) ( ON ?auto_2430351 ?auto_2430350 ) ( not ( = ?auto_2430341 ?auto_2430342 ) ) ( not ( = ?auto_2430341 ?auto_2430343 ) ) ( not ( = ?auto_2430341 ?auto_2430344 ) ) ( not ( = ?auto_2430341 ?auto_2430345 ) ) ( not ( = ?auto_2430341 ?auto_2430346 ) ) ( not ( = ?auto_2430341 ?auto_2430347 ) ) ( not ( = ?auto_2430341 ?auto_2430348 ) ) ( not ( = ?auto_2430341 ?auto_2430349 ) ) ( not ( = ?auto_2430341 ?auto_2430350 ) ) ( not ( = ?auto_2430341 ?auto_2430351 ) ) ( not ( = ?auto_2430341 ?auto_2430352 ) ) ( not ( = ?auto_2430341 ?auto_2430353 ) ) ( not ( = ?auto_2430342 ?auto_2430343 ) ) ( not ( = ?auto_2430342 ?auto_2430344 ) ) ( not ( = ?auto_2430342 ?auto_2430345 ) ) ( not ( = ?auto_2430342 ?auto_2430346 ) ) ( not ( = ?auto_2430342 ?auto_2430347 ) ) ( not ( = ?auto_2430342 ?auto_2430348 ) ) ( not ( = ?auto_2430342 ?auto_2430349 ) ) ( not ( = ?auto_2430342 ?auto_2430350 ) ) ( not ( = ?auto_2430342 ?auto_2430351 ) ) ( not ( = ?auto_2430342 ?auto_2430352 ) ) ( not ( = ?auto_2430342 ?auto_2430353 ) ) ( not ( = ?auto_2430343 ?auto_2430344 ) ) ( not ( = ?auto_2430343 ?auto_2430345 ) ) ( not ( = ?auto_2430343 ?auto_2430346 ) ) ( not ( = ?auto_2430343 ?auto_2430347 ) ) ( not ( = ?auto_2430343 ?auto_2430348 ) ) ( not ( = ?auto_2430343 ?auto_2430349 ) ) ( not ( = ?auto_2430343 ?auto_2430350 ) ) ( not ( = ?auto_2430343 ?auto_2430351 ) ) ( not ( = ?auto_2430343 ?auto_2430352 ) ) ( not ( = ?auto_2430343 ?auto_2430353 ) ) ( not ( = ?auto_2430344 ?auto_2430345 ) ) ( not ( = ?auto_2430344 ?auto_2430346 ) ) ( not ( = ?auto_2430344 ?auto_2430347 ) ) ( not ( = ?auto_2430344 ?auto_2430348 ) ) ( not ( = ?auto_2430344 ?auto_2430349 ) ) ( not ( = ?auto_2430344 ?auto_2430350 ) ) ( not ( = ?auto_2430344 ?auto_2430351 ) ) ( not ( = ?auto_2430344 ?auto_2430352 ) ) ( not ( = ?auto_2430344 ?auto_2430353 ) ) ( not ( = ?auto_2430345 ?auto_2430346 ) ) ( not ( = ?auto_2430345 ?auto_2430347 ) ) ( not ( = ?auto_2430345 ?auto_2430348 ) ) ( not ( = ?auto_2430345 ?auto_2430349 ) ) ( not ( = ?auto_2430345 ?auto_2430350 ) ) ( not ( = ?auto_2430345 ?auto_2430351 ) ) ( not ( = ?auto_2430345 ?auto_2430352 ) ) ( not ( = ?auto_2430345 ?auto_2430353 ) ) ( not ( = ?auto_2430346 ?auto_2430347 ) ) ( not ( = ?auto_2430346 ?auto_2430348 ) ) ( not ( = ?auto_2430346 ?auto_2430349 ) ) ( not ( = ?auto_2430346 ?auto_2430350 ) ) ( not ( = ?auto_2430346 ?auto_2430351 ) ) ( not ( = ?auto_2430346 ?auto_2430352 ) ) ( not ( = ?auto_2430346 ?auto_2430353 ) ) ( not ( = ?auto_2430347 ?auto_2430348 ) ) ( not ( = ?auto_2430347 ?auto_2430349 ) ) ( not ( = ?auto_2430347 ?auto_2430350 ) ) ( not ( = ?auto_2430347 ?auto_2430351 ) ) ( not ( = ?auto_2430347 ?auto_2430352 ) ) ( not ( = ?auto_2430347 ?auto_2430353 ) ) ( not ( = ?auto_2430348 ?auto_2430349 ) ) ( not ( = ?auto_2430348 ?auto_2430350 ) ) ( not ( = ?auto_2430348 ?auto_2430351 ) ) ( not ( = ?auto_2430348 ?auto_2430352 ) ) ( not ( = ?auto_2430348 ?auto_2430353 ) ) ( not ( = ?auto_2430349 ?auto_2430350 ) ) ( not ( = ?auto_2430349 ?auto_2430351 ) ) ( not ( = ?auto_2430349 ?auto_2430352 ) ) ( not ( = ?auto_2430349 ?auto_2430353 ) ) ( not ( = ?auto_2430350 ?auto_2430351 ) ) ( not ( = ?auto_2430350 ?auto_2430352 ) ) ( not ( = ?auto_2430350 ?auto_2430353 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2430351 ?auto_2430352 ?auto_2430353 )
      ( MAKE-12CRATE-VERIFY ?auto_2430341 ?auto_2430342 ?auto_2430343 ?auto_2430344 ?auto_2430345 ?auto_2430346 ?auto_2430347 ?auto_2430348 ?auto_2430349 ?auto_2430350 ?auto_2430351 ?auto_2430352 ?auto_2430353 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2430479 - SURFACE
      ?auto_2430480 - SURFACE
      ?auto_2430481 - SURFACE
      ?auto_2430482 - SURFACE
      ?auto_2430483 - SURFACE
      ?auto_2430484 - SURFACE
      ?auto_2430485 - SURFACE
      ?auto_2430486 - SURFACE
      ?auto_2430487 - SURFACE
      ?auto_2430488 - SURFACE
      ?auto_2430489 - SURFACE
      ?auto_2430490 - SURFACE
      ?auto_2430491 - SURFACE
    )
    :vars
    (
      ?auto_2430492 - HOIST
      ?auto_2430493 - PLACE
      ?auto_2430494 - TRUCK
      ?auto_2430495 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2430492 ?auto_2430493 ) ( SURFACE-AT ?auto_2430490 ?auto_2430493 ) ( CLEAR ?auto_2430490 ) ( IS-CRATE ?auto_2430491 ) ( not ( = ?auto_2430490 ?auto_2430491 ) ) ( AVAILABLE ?auto_2430492 ) ( IN ?auto_2430491 ?auto_2430494 ) ( ON ?auto_2430490 ?auto_2430489 ) ( not ( = ?auto_2430489 ?auto_2430490 ) ) ( not ( = ?auto_2430489 ?auto_2430491 ) ) ( TRUCK-AT ?auto_2430494 ?auto_2430495 ) ( not ( = ?auto_2430495 ?auto_2430493 ) ) ( ON ?auto_2430480 ?auto_2430479 ) ( ON ?auto_2430481 ?auto_2430480 ) ( ON ?auto_2430482 ?auto_2430481 ) ( ON ?auto_2430483 ?auto_2430482 ) ( ON ?auto_2430484 ?auto_2430483 ) ( ON ?auto_2430485 ?auto_2430484 ) ( ON ?auto_2430486 ?auto_2430485 ) ( ON ?auto_2430487 ?auto_2430486 ) ( ON ?auto_2430488 ?auto_2430487 ) ( ON ?auto_2430489 ?auto_2430488 ) ( not ( = ?auto_2430479 ?auto_2430480 ) ) ( not ( = ?auto_2430479 ?auto_2430481 ) ) ( not ( = ?auto_2430479 ?auto_2430482 ) ) ( not ( = ?auto_2430479 ?auto_2430483 ) ) ( not ( = ?auto_2430479 ?auto_2430484 ) ) ( not ( = ?auto_2430479 ?auto_2430485 ) ) ( not ( = ?auto_2430479 ?auto_2430486 ) ) ( not ( = ?auto_2430479 ?auto_2430487 ) ) ( not ( = ?auto_2430479 ?auto_2430488 ) ) ( not ( = ?auto_2430479 ?auto_2430489 ) ) ( not ( = ?auto_2430479 ?auto_2430490 ) ) ( not ( = ?auto_2430479 ?auto_2430491 ) ) ( not ( = ?auto_2430480 ?auto_2430481 ) ) ( not ( = ?auto_2430480 ?auto_2430482 ) ) ( not ( = ?auto_2430480 ?auto_2430483 ) ) ( not ( = ?auto_2430480 ?auto_2430484 ) ) ( not ( = ?auto_2430480 ?auto_2430485 ) ) ( not ( = ?auto_2430480 ?auto_2430486 ) ) ( not ( = ?auto_2430480 ?auto_2430487 ) ) ( not ( = ?auto_2430480 ?auto_2430488 ) ) ( not ( = ?auto_2430480 ?auto_2430489 ) ) ( not ( = ?auto_2430480 ?auto_2430490 ) ) ( not ( = ?auto_2430480 ?auto_2430491 ) ) ( not ( = ?auto_2430481 ?auto_2430482 ) ) ( not ( = ?auto_2430481 ?auto_2430483 ) ) ( not ( = ?auto_2430481 ?auto_2430484 ) ) ( not ( = ?auto_2430481 ?auto_2430485 ) ) ( not ( = ?auto_2430481 ?auto_2430486 ) ) ( not ( = ?auto_2430481 ?auto_2430487 ) ) ( not ( = ?auto_2430481 ?auto_2430488 ) ) ( not ( = ?auto_2430481 ?auto_2430489 ) ) ( not ( = ?auto_2430481 ?auto_2430490 ) ) ( not ( = ?auto_2430481 ?auto_2430491 ) ) ( not ( = ?auto_2430482 ?auto_2430483 ) ) ( not ( = ?auto_2430482 ?auto_2430484 ) ) ( not ( = ?auto_2430482 ?auto_2430485 ) ) ( not ( = ?auto_2430482 ?auto_2430486 ) ) ( not ( = ?auto_2430482 ?auto_2430487 ) ) ( not ( = ?auto_2430482 ?auto_2430488 ) ) ( not ( = ?auto_2430482 ?auto_2430489 ) ) ( not ( = ?auto_2430482 ?auto_2430490 ) ) ( not ( = ?auto_2430482 ?auto_2430491 ) ) ( not ( = ?auto_2430483 ?auto_2430484 ) ) ( not ( = ?auto_2430483 ?auto_2430485 ) ) ( not ( = ?auto_2430483 ?auto_2430486 ) ) ( not ( = ?auto_2430483 ?auto_2430487 ) ) ( not ( = ?auto_2430483 ?auto_2430488 ) ) ( not ( = ?auto_2430483 ?auto_2430489 ) ) ( not ( = ?auto_2430483 ?auto_2430490 ) ) ( not ( = ?auto_2430483 ?auto_2430491 ) ) ( not ( = ?auto_2430484 ?auto_2430485 ) ) ( not ( = ?auto_2430484 ?auto_2430486 ) ) ( not ( = ?auto_2430484 ?auto_2430487 ) ) ( not ( = ?auto_2430484 ?auto_2430488 ) ) ( not ( = ?auto_2430484 ?auto_2430489 ) ) ( not ( = ?auto_2430484 ?auto_2430490 ) ) ( not ( = ?auto_2430484 ?auto_2430491 ) ) ( not ( = ?auto_2430485 ?auto_2430486 ) ) ( not ( = ?auto_2430485 ?auto_2430487 ) ) ( not ( = ?auto_2430485 ?auto_2430488 ) ) ( not ( = ?auto_2430485 ?auto_2430489 ) ) ( not ( = ?auto_2430485 ?auto_2430490 ) ) ( not ( = ?auto_2430485 ?auto_2430491 ) ) ( not ( = ?auto_2430486 ?auto_2430487 ) ) ( not ( = ?auto_2430486 ?auto_2430488 ) ) ( not ( = ?auto_2430486 ?auto_2430489 ) ) ( not ( = ?auto_2430486 ?auto_2430490 ) ) ( not ( = ?auto_2430486 ?auto_2430491 ) ) ( not ( = ?auto_2430487 ?auto_2430488 ) ) ( not ( = ?auto_2430487 ?auto_2430489 ) ) ( not ( = ?auto_2430487 ?auto_2430490 ) ) ( not ( = ?auto_2430487 ?auto_2430491 ) ) ( not ( = ?auto_2430488 ?auto_2430489 ) ) ( not ( = ?auto_2430488 ?auto_2430490 ) ) ( not ( = ?auto_2430488 ?auto_2430491 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2430489 ?auto_2430490 ?auto_2430491 )
      ( MAKE-12CRATE-VERIFY ?auto_2430479 ?auto_2430480 ?auto_2430481 ?auto_2430482 ?auto_2430483 ?auto_2430484 ?auto_2430485 ?auto_2430486 ?auto_2430487 ?auto_2430488 ?auto_2430489 ?auto_2430490 ?auto_2430491 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2430629 - SURFACE
      ?auto_2430630 - SURFACE
      ?auto_2430631 - SURFACE
      ?auto_2430632 - SURFACE
      ?auto_2430633 - SURFACE
      ?auto_2430634 - SURFACE
      ?auto_2430635 - SURFACE
      ?auto_2430636 - SURFACE
      ?auto_2430637 - SURFACE
      ?auto_2430638 - SURFACE
      ?auto_2430639 - SURFACE
      ?auto_2430640 - SURFACE
      ?auto_2430641 - SURFACE
    )
    :vars
    (
      ?auto_2430642 - HOIST
      ?auto_2430643 - PLACE
      ?auto_2430645 - TRUCK
      ?auto_2430644 - PLACE
      ?auto_2430646 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2430642 ?auto_2430643 ) ( SURFACE-AT ?auto_2430640 ?auto_2430643 ) ( CLEAR ?auto_2430640 ) ( IS-CRATE ?auto_2430641 ) ( not ( = ?auto_2430640 ?auto_2430641 ) ) ( AVAILABLE ?auto_2430642 ) ( ON ?auto_2430640 ?auto_2430639 ) ( not ( = ?auto_2430639 ?auto_2430640 ) ) ( not ( = ?auto_2430639 ?auto_2430641 ) ) ( TRUCK-AT ?auto_2430645 ?auto_2430644 ) ( not ( = ?auto_2430644 ?auto_2430643 ) ) ( HOIST-AT ?auto_2430646 ?auto_2430644 ) ( LIFTING ?auto_2430646 ?auto_2430641 ) ( not ( = ?auto_2430642 ?auto_2430646 ) ) ( ON ?auto_2430630 ?auto_2430629 ) ( ON ?auto_2430631 ?auto_2430630 ) ( ON ?auto_2430632 ?auto_2430631 ) ( ON ?auto_2430633 ?auto_2430632 ) ( ON ?auto_2430634 ?auto_2430633 ) ( ON ?auto_2430635 ?auto_2430634 ) ( ON ?auto_2430636 ?auto_2430635 ) ( ON ?auto_2430637 ?auto_2430636 ) ( ON ?auto_2430638 ?auto_2430637 ) ( ON ?auto_2430639 ?auto_2430638 ) ( not ( = ?auto_2430629 ?auto_2430630 ) ) ( not ( = ?auto_2430629 ?auto_2430631 ) ) ( not ( = ?auto_2430629 ?auto_2430632 ) ) ( not ( = ?auto_2430629 ?auto_2430633 ) ) ( not ( = ?auto_2430629 ?auto_2430634 ) ) ( not ( = ?auto_2430629 ?auto_2430635 ) ) ( not ( = ?auto_2430629 ?auto_2430636 ) ) ( not ( = ?auto_2430629 ?auto_2430637 ) ) ( not ( = ?auto_2430629 ?auto_2430638 ) ) ( not ( = ?auto_2430629 ?auto_2430639 ) ) ( not ( = ?auto_2430629 ?auto_2430640 ) ) ( not ( = ?auto_2430629 ?auto_2430641 ) ) ( not ( = ?auto_2430630 ?auto_2430631 ) ) ( not ( = ?auto_2430630 ?auto_2430632 ) ) ( not ( = ?auto_2430630 ?auto_2430633 ) ) ( not ( = ?auto_2430630 ?auto_2430634 ) ) ( not ( = ?auto_2430630 ?auto_2430635 ) ) ( not ( = ?auto_2430630 ?auto_2430636 ) ) ( not ( = ?auto_2430630 ?auto_2430637 ) ) ( not ( = ?auto_2430630 ?auto_2430638 ) ) ( not ( = ?auto_2430630 ?auto_2430639 ) ) ( not ( = ?auto_2430630 ?auto_2430640 ) ) ( not ( = ?auto_2430630 ?auto_2430641 ) ) ( not ( = ?auto_2430631 ?auto_2430632 ) ) ( not ( = ?auto_2430631 ?auto_2430633 ) ) ( not ( = ?auto_2430631 ?auto_2430634 ) ) ( not ( = ?auto_2430631 ?auto_2430635 ) ) ( not ( = ?auto_2430631 ?auto_2430636 ) ) ( not ( = ?auto_2430631 ?auto_2430637 ) ) ( not ( = ?auto_2430631 ?auto_2430638 ) ) ( not ( = ?auto_2430631 ?auto_2430639 ) ) ( not ( = ?auto_2430631 ?auto_2430640 ) ) ( not ( = ?auto_2430631 ?auto_2430641 ) ) ( not ( = ?auto_2430632 ?auto_2430633 ) ) ( not ( = ?auto_2430632 ?auto_2430634 ) ) ( not ( = ?auto_2430632 ?auto_2430635 ) ) ( not ( = ?auto_2430632 ?auto_2430636 ) ) ( not ( = ?auto_2430632 ?auto_2430637 ) ) ( not ( = ?auto_2430632 ?auto_2430638 ) ) ( not ( = ?auto_2430632 ?auto_2430639 ) ) ( not ( = ?auto_2430632 ?auto_2430640 ) ) ( not ( = ?auto_2430632 ?auto_2430641 ) ) ( not ( = ?auto_2430633 ?auto_2430634 ) ) ( not ( = ?auto_2430633 ?auto_2430635 ) ) ( not ( = ?auto_2430633 ?auto_2430636 ) ) ( not ( = ?auto_2430633 ?auto_2430637 ) ) ( not ( = ?auto_2430633 ?auto_2430638 ) ) ( not ( = ?auto_2430633 ?auto_2430639 ) ) ( not ( = ?auto_2430633 ?auto_2430640 ) ) ( not ( = ?auto_2430633 ?auto_2430641 ) ) ( not ( = ?auto_2430634 ?auto_2430635 ) ) ( not ( = ?auto_2430634 ?auto_2430636 ) ) ( not ( = ?auto_2430634 ?auto_2430637 ) ) ( not ( = ?auto_2430634 ?auto_2430638 ) ) ( not ( = ?auto_2430634 ?auto_2430639 ) ) ( not ( = ?auto_2430634 ?auto_2430640 ) ) ( not ( = ?auto_2430634 ?auto_2430641 ) ) ( not ( = ?auto_2430635 ?auto_2430636 ) ) ( not ( = ?auto_2430635 ?auto_2430637 ) ) ( not ( = ?auto_2430635 ?auto_2430638 ) ) ( not ( = ?auto_2430635 ?auto_2430639 ) ) ( not ( = ?auto_2430635 ?auto_2430640 ) ) ( not ( = ?auto_2430635 ?auto_2430641 ) ) ( not ( = ?auto_2430636 ?auto_2430637 ) ) ( not ( = ?auto_2430636 ?auto_2430638 ) ) ( not ( = ?auto_2430636 ?auto_2430639 ) ) ( not ( = ?auto_2430636 ?auto_2430640 ) ) ( not ( = ?auto_2430636 ?auto_2430641 ) ) ( not ( = ?auto_2430637 ?auto_2430638 ) ) ( not ( = ?auto_2430637 ?auto_2430639 ) ) ( not ( = ?auto_2430637 ?auto_2430640 ) ) ( not ( = ?auto_2430637 ?auto_2430641 ) ) ( not ( = ?auto_2430638 ?auto_2430639 ) ) ( not ( = ?auto_2430638 ?auto_2430640 ) ) ( not ( = ?auto_2430638 ?auto_2430641 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2430639 ?auto_2430640 ?auto_2430641 )
      ( MAKE-12CRATE-VERIFY ?auto_2430629 ?auto_2430630 ?auto_2430631 ?auto_2430632 ?auto_2430633 ?auto_2430634 ?auto_2430635 ?auto_2430636 ?auto_2430637 ?auto_2430638 ?auto_2430639 ?auto_2430640 ?auto_2430641 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2430791 - SURFACE
      ?auto_2430792 - SURFACE
      ?auto_2430793 - SURFACE
      ?auto_2430794 - SURFACE
      ?auto_2430795 - SURFACE
      ?auto_2430796 - SURFACE
      ?auto_2430797 - SURFACE
      ?auto_2430798 - SURFACE
      ?auto_2430799 - SURFACE
      ?auto_2430800 - SURFACE
      ?auto_2430801 - SURFACE
      ?auto_2430802 - SURFACE
      ?auto_2430803 - SURFACE
    )
    :vars
    (
      ?auto_2430807 - HOIST
      ?auto_2430804 - PLACE
      ?auto_2430809 - TRUCK
      ?auto_2430808 - PLACE
      ?auto_2430805 - HOIST
      ?auto_2430806 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2430807 ?auto_2430804 ) ( SURFACE-AT ?auto_2430802 ?auto_2430804 ) ( CLEAR ?auto_2430802 ) ( IS-CRATE ?auto_2430803 ) ( not ( = ?auto_2430802 ?auto_2430803 ) ) ( AVAILABLE ?auto_2430807 ) ( ON ?auto_2430802 ?auto_2430801 ) ( not ( = ?auto_2430801 ?auto_2430802 ) ) ( not ( = ?auto_2430801 ?auto_2430803 ) ) ( TRUCK-AT ?auto_2430809 ?auto_2430808 ) ( not ( = ?auto_2430808 ?auto_2430804 ) ) ( HOIST-AT ?auto_2430805 ?auto_2430808 ) ( not ( = ?auto_2430807 ?auto_2430805 ) ) ( AVAILABLE ?auto_2430805 ) ( SURFACE-AT ?auto_2430803 ?auto_2430808 ) ( ON ?auto_2430803 ?auto_2430806 ) ( CLEAR ?auto_2430803 ) ( not ( = ?auto_2430802 ?auto_2430806 ) ) ( not ( = ?auto_2430803 ?auto_2430806 ) ) ( not ( = ?auto_2430801 ?auto_2430806 ) ) ( ON ?auto_2430792 ?auto_2430791 ) ( ON ?auto_2430793 ?auto_2430792 ) ( ON ?auto_2430794 ?auto_2430793 ) ( ON ?auto_2430795 ?auto_2430794 ) ( ON ?auto_2430796 ?auto_2430795 ) ( ON ?auto_2430797 ?auto_2430796 ) ( ON ?auto_2430798 ?auto_2430797 ) ( ON ?auto_2430799 ?auto_2430798 ) ( ON ?auto_2430800 ?auto_2430799 ) ( ON ?auto_2430801 ?auto_2430800 ) ( not ( = ?auto_2430791 ?auto_2430792 ) ) ( not ( = ?auto_2430791 ?auto_2430793 ) ) ( not ( = ?auto_2430791 ?auto_2430794 ) ) ( not ( = ?auto_2430791 ?auto_2430795 ) ) ( not ( = ?auto_2430791 ?auto_2430796 ) ) ( not ( = ?auto_2430791 ?auto_2430797 ) ) ( not ( = ?auto_2430791 ?auto_2430798 ) ) ( not ( = ?auto_2430791 ?auto_2430799 ) ) ( not ( = ?auto_2430791 ?auto_2430800 ) ) ( not ( = ?auto_2430791 ?auto_2430801 ) ) ( not ( = ?auto_2430791 ?auto_2430802 ) ) ( not ( = ?auto_2430791 ?auto_2430803 ) ) ( not ( = ?auto_2430791 ?auto_2430806 ) ) ( not ( = ?auto_2430792 ?auto_2430793 ) ) ( not ( = ?auto_2430792 ?auto_2430794 ) ) ( not ( = ?auto_2430792 ?auto_2430795 ) ) ( not ( = ?auto_2430792 ?auto_2430796 ) ) ( not ( = ?auto_2430792 ?auto_2430797 ) ) ( not ( = ?auto_2430792 ?auto_2430798 ) ) ( not ( = ?auto_2430792 ?auto_2430799 ) ) ( not ( = ?auto_2430792 ?auto_2430800 ) ) ( not ( = ?auto_2430792 ?auto_2430801 ) ) ( not ( = ?auto_2430792 ?auto_2430802 ) ) ( not ( = ?auto_2430792 ?auto_2430803 ) ) ( not ( = ?auto_2430792 ?auto_2430806 ) ) ( not ( = ?auto_2430793 ?auto_2430794 ) ) ( not ( = ?auto_2430793 ?auto_2430795 ) ) ( not ( = ?auto_2430793 ?auto_2430796 ) ) ( not ( = ?auto_2430793 ?auto_2430797 ) ) ( not ( = ?auto_2430793 ?auto_2430798 ) ) ( not ( = ?auto_2430793 ?auto_2430799 ) ) ( not ( = ?auto_2430793 ?auto_2430800 ) ) ( not ( = ?auto_2430793 ?auto_2430801 ) ) ( not ( = ?auto_2430793 ?auto_2430802 ) ) ( not ( = ?auto_2430793 ?auto_2430803 ) ) ( not ( = ?auto_2430793 ?auto_2430806 ) ) ( not ( = ?auto_2430794 ?auto_2430795 ) ) ( not ( = ?auto_2430794 ?auto_2430796 ) ) ( not ( = ?auto_2430794 ?auto_2430797 ) ) ( not ( = ?auto_2430794 ?auto_2430798 ) ) ( not ( = ?auto_2430794 ?auto_2430799 ) ) ( not ( = ?auto_2430794 ?auto_2430800 ) ) ( not ( = ?auto_2430794 ?auto_2430801 ) ) ( not ( = ?auto_2430794 ?auto_2430802 ) ) ( not ( = ?auto_2430794 ?auto_2430803 ) ) ( not ( = ?auto_2430794 ?auto_2430806 ) ) ( not ( = ?auto_2430795 ?auto_2430796 ) ) ( not ( = ?auto_2430795 ?auto_2430797 ) ) ( not ( = ?auto_2430795 ?auto_2430798 ) ) ( not ( = ?auto_2430795 ?auto_2430799 ) ) ( not ( = ?auto_2430795 ?auto_2430800 ) ) ( not ( = ?auto_2430795 ?auto_2430801 ) ) ( not ( = ?auto_2430795 ?auto_2430802 ) ) ( not ( = ?auto_2430795 ?auto_2430803 ) ) ( not ( = ?auto_2430795 ?auto_2430806 ) ) ( not ( = ?auto_2430796 ?auto_2430797 ) ) ( not ( = ?auto_2430796 ?auto_2430798 ) ) ( not ( = ?auto_2430796 ?auto_2430799 ) ) ( not ( = ?auto_2430796 ?auto_2430800 ) ) ( not ( = ?auto_2430796 ?auto_2430801 ) ) ( not ( = ?auto_2430796 ?auto_2430802 ) ) ( not ( = ?auto_2430796 ?auto_2430803 ) ) ( not ( = ?auto_2430796 ?auto_2430806 ) ) ( not ( = ?auto_2430797 ?auto_2430798 ) ) ( not ( = ?auto_2430797 ?auto_2430799 ) ) ( not ( = ?auto_2430797 ?auto_2430800 ) ) ( not ( = ?auto_2430797 ?auto_2430801 ) ) ( not ( = ?auto_2430797 ?auto_2430802 ) ) ( not ( = ?auto_2430797 ?auto_2430803 ) ) ( not ( = ?auto_2430797 ?auto_2430806 ) ) ( not ( = ?auto_2430798 ?auto_2430799 ) ) ( not ( = ?auto_2430798 ?auto_2430800 ) ) ( not ( = ?auto_2430798 ?auto_2430801 ) ) ( not ( = ?auto_2430798 ?auto_2430802 ) ) ( not ( = ?auto_2430798 ?auto_2430803 ) ) ( not ( = ?auto_2430798 ?auto_2430806 ) ) ( not ( = ?auto_2430799 ?auto_2430800 ) ) ( not ( = ?auto_2430799 ?auto_2430801 ) ) ( not ( = ?auto_2430799 ?auto_2430802 ) ) ( not ( = ?auto_2430799 ?auto_2430803 ) ) ( not ( = ?auto_2430799 ?auto_2430806 ) ) ( not ( = ?auto_2430800 ?auto_2430801 ) ) ( not ( = ?auto_2430800 ?auto_2430802 ) ) ( not ( = ?auto_2430800 ?auto_2430803 ) ) ( not ( = ?auto_2430800 ?auto_2430806 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2430801 ?auto_2430802 ?auto_2430803 )
      ( MAKE-12CRATE-VERIFY ?auto_2430791 ?auto_2430792 ?auto_2430793 ?auto_2430794 ?auto_2430795 ?auto_2430796 ?auto_2430797 ?auto_2430798 ?auto_2430799 ?auto_2430800 ?auto_2430801 ?auto_2430802 ?auto_2430803 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2430954 - SURFACE
      ?auto_2430955 - SURFACE
      ?auto_2430956 - SURFACE
      ?auto_2430957 - SURFACE
      ?auto_2430958 - SURFACE
      ?auto_2430959 - SURFACE
      ?auto_2430960 - SURFACE
      ?auto_2430961 - SURFACE
      ?auto_2430962 - SURFACE
      ?auto_2430963 - SURFACE
      ?auto_2430964 - SURFACE
      ?auto_2430965 - SURFACE
      ?auto_2430966 - SURFACE
    )
    :vars
    (
      ?auto_2430968 - HOIST
      ?auto_2430967 - PLACE
      ?auto_2430971 - PLACE
      ?auto_2430969 - HOIST
      ?auto_2430970 - SURFACE
      ?auto_2430972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2430968 ?auto_2430967 ) ( SURFACE-AT ?auto_2430965 ?auto_2430967 ) ( CLEAR ?auto_2430965 ) ( IS-CRATE ?auto_2430966 ) ( not ( = ?auto_2430965 ?auto_2430966 ) ) ( AVAILABLE ?auto_2430968 ) ( ON ?auto_2430965 ?auto_2430964 ) ( not ( = ?auto_2430964 ?auto_2430965 ) ) ( not ( = ?auto_2430964 ?auto_2430966 ) ) ( not ( = ?auto_2430971 ?auto_2430967 ) ) ( HOIST-AT ?auto_2430969 ?auto_2430971 ) ( not ( = ?auto_2430968 ?auto_2430969 ) ) ( AVAILABLE ?auto_2430969 ) ( SURFACE-AT ?auto_2430966 ?auto_2430971 ) ( ON ?auto_2430966 ?auto_2430970 ) ( CLEAR ?auto_2430966 ) ( not ( = ?auto_2430965 ?auto_2430970 ) ) ( not ( = ?auto_2430966 ?auto_2430970 ) ) ( not ( = ?auto_2430964 ?auto_2430970 ) ) ( TRUCK-AT ?auto_2430972 ?auto_2430967 ) ( ON ?auto_2430955 ?auto_2430954 ) ( ON ?auto_2430956 ?auto_2430955 ) ( ON ?auto_2430957 ?auto_2430956 ) ( ON ?auto_2430958 ?auto_2430957 ) ( ON ?auto_2430959 ?auto_2430958 ) ( ON ?auto_2430960 ?auto_2430959 ) ( ON ?auto_2430961 ?auto_2430960 ) ( ON ?auto_2430962 ?auto_2430961 ) ( ON ?auto_2430963 ?auto_2430962 ) ( ON ?auto_2430964 ?auto_2430963 ) ( not ( = ?auto_2430954 ?auto_2430955 ) ) ( not ( = ?auto_2430954 ?auto_2430956 ) ) ( not ( = ?auto_2430954 ?auto_2430957 ) ) ( not ( = ?auto_2430954 ?auto_2430958 ) ) ( not ( = ?auto_2430954 ?auto_2430959 ) ) ( not ( = ?auto_2430954 ?auto_2430960 ) ) ( not ( = ?auto_2430954 ?auto_2430961 ) ) ( not ( = ?auto_2430954 ?auto_2430962 ) ) ( not ( = ?auto_2430954 ?auto_2430963 ) ) ( not ( = ?auto_2430954 ?auto_2430964 ) ) ( not ( = ?auto_2430954 ?auto_2430965 ) ) ( not ( = ?auto_2430954 ?auto_2430966 ) ) ( not ( = ?auto_2430954 ?auto_2430970 ) ) ( not ( = ?auto_2430955 ?auto_2430956 ) ) ( not ( = ?auto_2430955 ?auto_2430957 ) ) ( not ( = ?auto_2430955 ?auto_2430958 ) ) ( not ( = ?auto_2430955 ?auto_2430959 ) ) ( not ( = ?auto_2430955 ?auto_2430960 ) ) ( not ( = ?auto_2430955 ?auto_2430961 ) ) ( not ( = ?auto_2430955 ?auto_2430962 ) ) ( not ( = ?auto_2430955 ?auto_2430963 ) ) ( not ( = ?auto_2430955 ?auto_2430964 ) ) ( not ( = ?auto_2430955 ?auto_2430965 ) ) ( not ( = ?auto_2430955 ?auto_2430966 ) ) ( not ( = ?auto_2430955 ?auto_2430970 ) ) ( not ( = ?auto_2430956 ?auto_2430957 ) ) ( not ( = ?auto_2430956 ?auto_2430958 ) ) ( not ( = ?auto_2430956 ?auto_2430959 ) ) ( not ( = ?auto_2430956 ?auto_2430960 ) ) ( not ( = ?auto_2430956 ?auto_2430961 ) ) ( not ( = ?auto_2430956 ?auto_2430962 ) ) ( not ( = ?auto_2430956 ?auto_2430963 ) ) ( not ( = ?auto_2430956 ?auto_2430964 ) ) ( not ( = ?auto_2430956 ?auto_2430965 ) ) ( not ( = ?auto_2430956 ?auto_2430966 ) ) ( not ( = ?auto_2430956 ?auto_2430970 ) ) ( not ( = ?auto_2430957 ?auto_2430958 ) ) ( not ( = ?auto_2430957 ?auto_2430959 ) ) ( not ( = ?auto_2430957 ?auto_2430960 ) ) ( not ( = ?auto_2430957 ?auto_2430961 ) ) ( not ( = ?auto_2430957 ?auto_2430962 ) ) ( not ( = ?auto_2430957 ?auto_2430963 ) ) ( not ( = ?auto_2430957 ?auto_2430964 ) ) ( not ( = ?auto_2430957 ?auto_2430965 ) ) ( not ( = ?auto_2430957 ?auto_2430966 ) ) ( not ( = ?auto_2430957 ?auto_2430970 ) ) ( not ( = ?auto_2430958 ?auto_2430959 ) ) ( not ( = ?auto_2430958 ?auto_2430960 ) ) ( not ( = ?auto_2430958 ?auto_2430961 ) ) ( not ( = ?auto_2430958 ?auto_2430962 ) ) ( not ( = ?auto_2430958 ?auto_2430963 ) ) ( not ( = ?auto_2430958 ?auto_2430964 ) ) ( not ( = ?auto_2430958 ?auto_2430965 ) ) ( not ( = ?auto_2430958 ?auto_2430966 ) ) ( not ( = ?auto_2430958 ?auto_2430970 ) ) ( not ( = ?auto_2430959 ?auto_2430960 ) ) ( not ( = ?auto_2430959 ?auto_2430961 ) ) ( not ( = ?auto_2430959 ?auto_2430962 ) ) ( not ( = ?auto_2430959 ?auto_2430963 ) ) ( not ( = ?auto_2430959 ?auto_2430964 ) ) ( not ( = ?auto_2430959 ?auto_2430965 ) ) ( not ( = ?auto_2430959 ?auto_2430966 ) ) ( not ( = ?auto_2430959 ?auto_2430970 ) ) ( not ( = ?auto_2430960 ?auto_2430961 ) ) ( not ( = ?auto_2430960 ?auto_2430962 ) ) ( not ( = ?auto_2430960 ?auto_2430963 ) ) ( not ( = ?auto_2430960 ?auto_2430964 ) ) ( not ( = ?auto_2430960 ?auto_2430965 ) ) ( not ( = ?auto_2430960 ?auto_2430966 ) ) ( not ( = ?auto_2430960 ?auto_2430970 ) ) ( not ( = ?auto_2430961 ?auto_2430962 ) ) ( not ( = ?auto_2430961 ?auto_2430963 ) ) ( not ( = ?auto_2430961 ?auto_2430964 ) ) ( not ( = ?auto_2430961 ?auto_2430965 ) ) ( not ( = ?auto_2430961 ?auto_2430966 ) ) ( not ( = ?auto_2430961 ?auto_2430970 ) ) ( not ( = ?auto_2430962 ?auto_2430963 ) ) ( not ( = ?auto_2430962 ?auto_2430964 ) ) ( not ( = ?auto_2430962 ?auto_2430965 ) ) ( not ( = ?auto_2430962 ?auto_2430966 ) ) ( not ( = ?auto_2430962 ?auto_2430970 ) ) ( not ( = ?auto_2430963 ?auto_2430964 ) ) ( not ( = ?auto_2430963 ?auto_2430965 ) ) ( not ( = ?auto_2430963 ?auto_2430966 ) ) ( not ( = ?auto_2430963 ?auto_2430970 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2430964 ?auto_2430965 ?auto_2430966 )
      ( MAKE-12CRATE-VERIFY ?auto_2430954 ?auto_2430955 ?auto_2430956 ?auto_2430957 ?auto_2430958 ?auto_2430959 ?auto_2430960 ?auto_2430961 ?auto_2430962 ?auto_2430963 ?auto_2430964 ?auto_2430965 ?auto_2430966 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2431117 - SURFACE
      ?auto_2431118 - SURFACE
      ?auto_2431119 - SURFACE
      ?auto_2431120 - SURFACE
      ?auto_2431121 - SURFACE
      ?auto_2431122 - SURFACE
      ?auto_2431123 - SURFACE
      ?auto_2431124 - SURFACE
      ?auto_2431125 - SURFACE
      ?auto_2431126 - SURFACE
      ?auto_2431127 - SURFACE
      ?auto_2431128 - SURFACE
      ?auto_2431129 - SURFACE
    )
    :vars
    (
      ?auto_2431135 - HOIST
      ?auto_2431132 - PLACE
      ?auto_2431134 - PLACE
      ?auto_2431131 - HOIST
      ?auto_2431133 - SURFACE
      ?auto_2431130 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2431135 ?auto_2431132 ) ( IS-CRATE ?auto_2431129 ) ( not ( = ?auto_2431128 ?auto_2431129 ) ) ( not ( = ?auto_2431127 ?auto_2431128 ) ) ( not ( = ?auto_2431127 ?auto_2431129 ) ) ( not ( = ?auto_2431134 ?auto_2431132 ) ) ( HOIST-AT ?auto_2431131 ?auto_2431134 ) ( not ( = ?auto_2431135 ?auto_2431131 ) ) ( AVAILABLE ?auto_2431131 ) ( SURFACE-AT ?auto_2431129 ?auto_2431134 ) ( ON ?auto_2431129 ?auto_2431133 ) ( CLEAR ?auto_2431129 ) ( not ( = ?auto_2431128 ?auto_2431133 ) ) ( not ( = ?auto_2431129 ?auto_2431133 ) ) ( not ( = ?auto_2431127 ?auto_2431133 ) ) ( TRUCK-AT ?auto_2431130 ?auto_2431132 ) ( SURFACE-AT ?auto_2431127 ?auto_2431132 ) ( CLEAR ?auto_2431127 ) ( LIFTING ?auto_2431135 ?auto_2431128 ) ( IS-CRATE ?auto_2431128 ) ( ON ?auto_2431118 ?auto_2431117 ) ( ON ?auto_2431119 ?auto_2431118 ) ( ON ?auto_2431120 ?auto_2431119 ) ( ON ?auto_2431121 ?auto_2431120 ) ( ON ?auto_2431122 ?auto_2431121 ) ( ON ?auto_2431123 ?auto_2431122 ) ( ON ?auto_2431124 ?auto_2431123 ) ( ON ?auto_2431125 ?auto_2431124 ) ( ON ?auto_2431126 ?auto_2431125 ) ( ON ?auto_2431127 ?auto_2431126 ) ( not ( = ?auto_2431117 ?auto_2431118 ) ) ( not ( = ?auto_2431117 ?auto_2431119 ) ) ( not ( = ?auto_2431117 ?auto_2431120 ) ) ( not ( = ?auto_2431117 ?auto_2431121 ) ) ( not ( = ?auto_2431117 ?auto_2431122 ) ) ( not ( = ?auto_2431117 ?auto_2431123 ) ) ( not ( = ?auto_2431117 ?auto_2431124 ) ) ( not ( = ?auto_2431117 ?auto_2431125 ) ) ( not ( = ?auto_2431117 ?auto_2431126 ) ) ( not ( = ?auto_2431117 ?auto_2431127 ) ) ( not ( = ?auto_2431117 ?auto_2431128 ) ) ( not ( = ?auto_2431117 ?auto_2431129 ) ) ( not ( = ?auto_2431117 ?auto_2431133 ) ) ( not ( = ?auto_2431118 ?auto_2431119 ) ) ( not ( = ?auto_2431118 ?auto_2431120 ) ) ( not ( = ?auto_2431118 ?auto_2431121 ) ) ( not ( = ?auto_2431118 ?auto_2431122 ) ) ( not ( = ?auto_2431118 ?auto_2431123 ) ) ( not ( = ?auto_2431118 ?auto_2431124 ) ) ( not ( = ?auto_2431118 ?auto_2431125 ) ) ( not ( = ?auto_2431118 ?auto_2431126 ) ) ( not ( = ?auto_2431118 ?auto_2431127 ) ) ( not ( = ?auto_2431118 ?auto_2431128 ) ) ( not ( = ?auto_2431118 ?auto_2431129 ) ) ( not ( = ?auto_2431118 ?auto_2431133 ) ) ( not ( = ?auto_2431119 ?auto_2431120 ) ) ( not ( = ?auto_2431119 ?auto_2431121 ) ) ( not ( = ?auto_2431119 ?auto_2431122 ) ) ( not ( = ?auto_2431119 ?auto_2431123 ) ) ( not ( = ?auto_2431119 ?auto_2431124 ) ) ( not ( = ?auto_2431119 ?auto_2431125 ) ) ( not ( = ?auto_2431119 ?auto_2431126 ) ) ( not ( = ?auto_2431119 ?auto_2431127 ) ) ( not ( = ?auto_2431119 ?auto_2431128 ) ) ( not ( = ?auto_2431119 ?auto_2431129 ) ) ( not ( = ?auto_2431119 ?auto_2431133 ) ) ( not ( = ?auto_2431120 ?auto_2431121 ) ) ( not ( = ?auto_2431120 ?auto_2431122 ) ) ( not ( = ?auto_2431120 ?auto_2431123 ) ) ( not ( = ?auto_2431120 ?auto_2431124 ) ) ( not ( = ?auto_2431120 ?auto_2431125 ) ) ( not ( = ?auto_2431120 ?auto_2431126 ) ) ( not ( = ?auto_2431120 ?auto_2431127 ) ) ( not ( = ?auto_2431120 ?auto_2431128 ) ) ( not ( = ?auto_2431120 ?auto_2431129 ) ) ( not ( = ?auto_2431120 ?auto_2431133 ) ) ( not ( = ?auto_2431121 ?auto_2431122 ) ) ( not ( = ?auto_2431121 ?auto_2431123 ) ) ( not ( = ?auto_2431121 ?auto_2431124 ) ) ( not ( = ?auto_2431121 ?auto_2431125 ) ) ( not ( = ?auto_2431121 ?auto_2431126 ) ) ( not ( = ?auto_2431121 ?auto_2431127 ) ) ( not ( = ?auto_2431121 ?auto_2431128 ) ) ( not ( = ?auto_2431121 ?auto_2431129 ) ) ( not ( = ?auto_2431121 ?auto_2431133 ) ) ( not ( = ?auto_2431122 ?auto_2431123 ) ) ( not ( = ?auto_2431122 ?auto_2431124 ) ) ( not ( = ?auto_2431122 ?auto_2431125 ) ) ( not ( = ?auto_2431122 ?auto_2431126 ) ) ( not ( = ?auto_2431122 ?auto_2431127 ) ) ( not ( = ?auto_2431122 ?auto_2431128 ) ) ( not ( = ?auto_2431122 ?auto_2431129 ) ) ( not ( = ?auto_2431122 ?auto_2431133 ) ) ( not ( = ?auto_2431123 ?auto_2431124 ) ) ( not ( = ?auto_2431123 ?auto_2431125 ) ) ( not ( = ?auto_2431123 ?auto_2431126 ) ) ( not ( = ?auto_2431123 ?auto_2431127 ) ) ( not ( = ?auto_2431123 ?auto_2431128 ) ) ( not ( = ?auto_2431123 ?auto_2431129 ) ) ( not ( = ?auto_2431123 ?auto_2431133 ) ) ( not ( = ?auto_2431124 ?auto_2431125 ) ) ( not ( = ?auto_2431124 ?auto_2431126 ) ) ( not ( = ?auto_2431124 ?auto_2431127 ) ) ( not ( = ?auto_2431124 ?auto_2431128 ) ) ( not ( = ?auto_2431124 ?auto_2431129 ) ) ( not ( = ?auto_2431124 ?auto_2431133 ) ) ( not ( = ?auto_2431125 ?auto_2431126 ) ) ( not ( = ?auto_2431125 ?auto_2431127 ) ) ( not ( = ?auto_2431125 ?auto_2431128 ) ) ( not ( = ?auto_2431125 ?auto_2431129 ) ) ( not ( = ?auto_2431125 ?auto_2431133 ) ) ( not ( = ?auto_2431126 ?auto_2431127 ) ) ( not ( = ?auto_2431126 ?auto_2431128 ) ) ( not ( = ?auto_2431126 ?auto_2431129 ) ) ( not ( = ?auto_2431126 ?auto_2431133 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2431127 ?auto_2431128 ?auto_2431129 )
      ( MAKE-12CRATE-VERIFY ?auto_2431117 ?auto_2431118 ?auto_2431119 ?auto_2431120 ?auto_2431121 ?auto_2431122 ?auto_2431123 ?auto_2431124 ?auto_2431125 ?auto_2431126 ?auto_2431127 ?auto_2431128 ?auto_2431129 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2431280 - SURFACE
      ?auto_2431281 - SURFACE
      ?auto_2431282 - SURFACE
      ?auto_2431283 - SURFACE
      ?auto_2431284 - SURFACE
      ?auto_2431285 - SURFACE
      ?auto_2431286 - SURFACE
      ?auto_2431287 - SURFACE
      ?auto_2431288 - SURFACE
      ?auto_2431289 - SURFACE
      ?auto_2431290 - SURFACE
      ?auto_2431291 - SURFACE
      ?auto_2431292 - SURFACE
    )
    :vars
    (
      ?auto_2431298 - HOIST
      ?auto_2431294 - PLACE
      ?auto_2431297 - PLACE
      ?auto_2431296 - HOIST
      ?auto_2431295 - SURFACE
      ?auto_2431293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2431298 ?auto_2431294 ) ( IS-CRATE ?auto_2431292 ) ( not ( = ?auto_2431291 ?auto_2431292 ) ) ( not ( = ?auto_2431290 ?auto_2431291 ) ) ( not ( = ?auto_2431290 ?auto_2431292 ) ) ( not ( = ?auto_2431297 ?auto_2431294 ) ) ( HOIST-AT ?auto_2431296 ?auto_2431297 ) ( not ( = ?auto_2431298 ?auto_2431296 ) ) ( AVAILABLE ?auto_2431296 ) ( SURFACE-AT ?auto_2431292 ?auto_2431297 ) ( ON ?auto_2431292 ?auto_2431295 ) ( CLEAR ?auto_2431292 ) ( not ( = ?auto_2431291 ?auto_2431295 ) ) ( not ( = ?auto_2431292 ?auto_2431295 ) ) ( not ( = ?auto_2431290 ?auto_2431295 ) ) ( TRUCK-AT ?auto_2431293 ?auto_2431294 ) ( SURFACE-AT ?auto_2431290 ?auto_2431294 ) ( CLEAR ?auto_2431290 ) ( IS-CRATE ?auto_2431291 ) ( AVAILABLE ?auto_2431298 ) ( IN ?auto_2431291 ?auto_2431293 ) ( ON ?auto_2431281 ?auto_2431280 ) ( ON ?auto_2431282 ?auto_2431281 ) ( ON ?auto_2431283 ?auto_2431282 ) ( ON ?auto_2431284 ?auto_2431283 ) ( ON ?auto_2431285 ?auto_2431284 ) ( ON ?auto_2431286 ?auto_2431285 ) ( ON ?auto_2431287 ?auto_2431286 ) ( ON ?auto_2431288 ?auto_2431287 ) ( ON ?auto_2431289 ?auto_2431288 ) ( ON ?auto_2431290 ?auto_2431289 ) ( not ( = ?auto_2431280 ?auto_2431281 ) ) ( not ( = ?auto_2431280 ?auto_2431282 ) ) ( not ( = ?auto_2431280 ?auto_2431283 ) ) ( not ( = ?auto_2431280 ?auto_2431284 ) ) ( not ( = ?auto_2431280 ?auto_2431285 ) ) ( not ( = ?auto_2431280 ?auto_2431286 ) ) ( not ( = ?auto_2431280 ?auto_2431287 ) ) ( not ( = ?auto_2431280 ?auto_2431288 ) ) ( not ( = ?auto_2431280 ?auto_2431289 ) ) ( not ( = ?auto_2431280 ?auto_2431290 ) ) ( not ( = ?auto_2431280 ?auto_2431291 ) ) ( not ( = ?auto_2431280 ?auto_2431292 ) ) ( not ( = ?auto_2431280 ?auto_2431295 ) ) ( not ( = ?auto_2431281 ?auto_2431282 ) ) ( not ( = ?auto_2431281 ?auto_2431283 ) ) ( not ( = ?auto_2431281 ?auto_2431284 ) ) ( not ( = ?auto_2431281 ?auto_2431285 ) ) ( not ( = ?auto_2431281 ?auto_2431286 ) ) ( not ( = ?auto_2431281 ?auto_2431287 ) ) ( not ( = ?auto_2431281 ?auto_2431288 ) ) ( not ( = ?auto_2431281 ?auto_2431289 ) ) ( not ( = ?auto_2431281 ?auto_2431290 ) ) ( not ( = ?auto_2431281 ?auto_2431291 ) ) ( not ( = ?auto_2431281 ?auto_2431292 ) ) ( not ( = ?auto_2431281 ?auto_2431295 ) ) ( not ( = ?auto_2431282 ?auto_2431283 ) ) ( not ( = ?auto_2431282 ?auto_2431284 ) ) ( not ( = ?auto_2431282 ?auto_2431285 ) ) ( not ( = ?auto_2431282 ?auto_2431286 ) ) ( not ( = ?auto_2431282 ?auto_2431287 ) ) ( not ( = ?auto_2431282 ?auto_2431288 ) ) ( not ( = ?auto_2431282 ?auto_2431289 ) ) ( not ( = ?auto_2431282 ?auto_2431290 ) ) ( not ( = ?auto_2431282 ?auto_2431291 ) ) ( not ( = ?auto_2431282 ?auto_2431292 ) ) ( not ( = ?auto_2431282 ?auto_2431295 ) ) ( not ( = ?auto_2431283 ?auto_2431284 ) ) ( not ( = ?auto_2431283 ?auto_2431285 ) ) ( not ( = ?auto_2431283 ?auto_2431286 ) ) ( not ( = ?auto_2431283 ?auto_2431287 ) ) ( not ( = ?auto_2431283 ?auto_2431288 ) ) ( not ( = ?auto_2431283 ?auto_2431289 ) ) ( not ( = ?auto_2431283 ?auto_2431290 ) ) ( not ( = ?auto_2431283 ?auto_2431291 ) ) ( not ( = ?auto_2431283 ?auto_2431292 ) ) ( not ( = ?auto_2431283 ?auto_2431295 ) ) ( not ( = ?auto_2431284 ?auto_2431285 ) ) ( not ( = ?auto_2431284 ?auto_2431286 ) ) ( not ( = ?auto_2431284 ?auto_2431287 ) ) ( not ( = ?auto_2431284 ?auto_2431288 ) ) ( not ( = ?auto_2431284 ?auto_2431289 ) ) ( not ( = ?auto_2431284 ?auto_2431290 ) ) ( not ( = ?auto_2431284 ?auto_2431291 ) ) ( not ( = ?auto_2431284 ?auto_2431292 ) ) ( not ( = ?auto_2431284 ?auto_2431295 ) ) ( not ( = ?auto_2431285 ?auto_2431286 ) ) ( not ( = ?auto_2431285 ?auto_2431287 ) ) ( not ( = ?auto_2431285 ?auto_2431288 ) ) ( not ( = ?auto_2431285 ?auto_2431289 ) ) ( not ( = ?auto_2431285 ?auto_2431290 ) ) ( not ( = ?auto_2431285 ?auto_2431291 ) ) ( not ( = ?auto_2431285 ?auto_2431292 ) ) ( not ( = ?auto_2431285 ?auto_2431295 ) ) ( not ( = ?auto_2431286 ?auto_2431287 ) ) ( not ( = ?auto_2431286 ?auto_2431288 ) ) ( not ( = ?auto_2431286 ?auto_2431289 ) ) ( not ( = ?auto_2431286 ?auto_2431290 ) ) ( not ( = ?auto_2431286 ?auto_2431291 ) ) ( not ( = ?auto_2431286 ?auto_2431292 ) ) ( not ( = ?auto_2431286 ?auto_2431295 ) ) ( not ( = ?auto_2431287 ?auto_2431288 ) ) ( not ( = ?auto_2431287 ?auto_2431289 ) ) ( not ( = ?auto_2431287 ?auto_2431290 ) ) ( not ( = ?auto_2431287 ?auto_2431291 ) ) ( not ( = ?auto_2431287 ?auto_2431292 ) ) ( not ( = ?auto_2431287 ?auto_2431295 ) ) ( not ( = ?auto_2431288 ?auto_2431289 ) ) ( not ( = ?auto_2431288 ?auto_2431290 ) ) ( not ( = ?auto_2431288 ?auto_2431291 ) ) ( not ( = ?auto_2431288 ?auto_2431292 ) ) ( not ( = ?auto_2431288 ?auto_2431295 ) ) ( not ( = ?auto_2431289 ?auto_2431290 ) ) ( not ( = ?auto_2431289 ?auto_2431291 ) ) ( not ( = ?auto_2431289 ?auto_2431292 ) ) ( not ( = ?auto_2431289 ?auto_2431295 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2431290 ?auto_2431291 ?auto_2431292 )
      ( MAKE-12CRATE-VERIFY ?auto_2431280 ?auto_2431281 ?auto_2431282 ?auto_2431283 ?auto_2431284 ?auto_2431285 ?auto_2431286 ?auto_2431287 ?auto_2431288 ?auto_2431289 ?auto_2431290 ?auto_2431291 ?auto_2431292 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2432509 - SURFACE
      ?auto_2432510 - SURFACE
    )
    :vars
    (
      ?auto_2432512 - HOIST
      ?auto_2432511 - PLACE
      ?auto_2432514 - SURFACE
      ?auto_2432513 - PLACE
      ?auto_2432517 - HOIST
      ?auto_2432516 - SURFACE
      ?auto_2432515 - TRUCK
      ?auto_2432518 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2432512 ?auto_2432511 ) ( SURFACE-AT ?auto_2432509 ?auto_2432511 ) ( CLEAR ?auto_2432509 ) ( IS-CRATE ?auto_2432510 ) ( not ( = ?auto_2432509 ?auto_2432510 ) ) ( ON ?auto_2432509 ?auto_2432514 ) ( not ( = ?auto_2432514 ?auto_2432509 ) ) ( not ( = ?auto_2432514 ?auto_2432510 ) ) ( not ( = ?auto_2432513 ?auto_2432511 ) ) ( HOIST-AT ?auto_2432517 ?auto_2432513 ) ( not ( = ?auto_2432512 ?auto_2432517 ) ) ( AVAILABLE ?auto_2432517 ) ( SURFACE-AT ?auto_2432510 ?auto_2432513 ) ( ON ?auto_2432510 ?auto_2432516 ) ( CLEAR ?auto_2432510 ) ( not ( = ?auto_2432509 ?auto_2432516 ) ) ( not ( = ?auto_2432510 ?auto_2432516 ) ) ( not ( = ?auto_2432514 ?auto_2432516 ) ) ( TRUCK-AT ?auto_2432515 ?auto_2432511 ) ( LIFTING ?auto_2432512 ?auto_2432518 ) ( IS-CRATE ?auto_2432518 ) ( not ( = ?auto_2432509 ?auto_2432518 ) ) ( not ( = ?auto_2432510 ?auto_2432518 ) ) ( not ( = ?auto_2432514 ?auto_2432518 ) ) ( not ( = ?auto_2432516 ?auto_2432518 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2432512 ?auto_2432518 ?auto_2432515 ?auto_2432511 )
      ( MAKE-1CRATE ?auto_2432509 ?auto_2432510 )
      ( MAKE-1CRATE-VERIFY ?auto_2432509 ?auto_2432510 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2442859 - SURFACE
      ?auto_2442860 - SURFACE
      ?auto_2442861 - SURFACE
      ?auto_2442862 - SURFACE
      ?auto_2442863 - SURFACE
      ?auto_2442864 - SURFACE
      ?auto_2442865 - SURFACE
      ?auto_2442866 - SURFACE
      ?auto_2442867 - SURFACE
      ?auto_2442868 - SURFACE
      ?auto_2442869 - SURFACE
      ?auto_2442870 - SURFACE
      ?auto_2442871 - SURFACE
      ?auto_2442872 - SURFACE
    )
    :vars
    (
      ?auto_2442873 - HOIST
      ?auto_2442874 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2442873 ?auto_2442874 ) ( SURFACE-AT ?auto_2442871 ?auto_2442874 ) ( CLEAR ?auto_2442871 ) ( LIFTING ?auto_2442873 ?auto_2442872 ) ( IS-CRATE ?auto_2442872 ) ( not ( = ?auto_2442871 ?auto_2442872 ) ) ( ON ?auto_2442860 ?auto_2442859 ) ( ON ?auto_2442861 ?auto_2442860 ) ( ON ?auto_2442862 ?auto_2442861 ) ( ON ?auto_2442863 ?auto_2442862 ) ( ON ?auto_2442864 ?auto_2442863 ) ( ON ?auto_2442865 ?auto_2442864 ) ( ON ?auto_2442866 ?auto_2442865 ) ( ON ?auto_2442867 ?auto_2442866 ) ( ON ?auto_2442868 ?auto_2442867 ) ( ON ?auto_2442869 ?auto_2442868 ) ( ON ?auto_2442870 ?auto_2442869 ) ( ON ?auto_2442871 ?auto_2442870 ) ( not ( = ?auto_2442859 ?auto_2442860 ) ) ( not ( = ?auto_2442859 ?auto_2442861 ) ) ( not ( = ?auto_2442859 ?auto_2442862 ) ) ( not ( = ?auto_2442859 ?auto_2442863 ) ) ( not ( = ?auto_2442859 ?auto_2442864 ) ) ( not ( = ?auto_2442859 ?auto_2442865 ) ) ( not ( = ?auto_2442859 ?auto_2442866 ) ) ( not ( = ?auto_2442859 ?auto_2442867 ) ) ( not ( = ?auto_2442859 ?auto_2442868 ) ) ( not ( = ?auto_2442859 ?auto_2442869 ) ) ( not ( = ?auto_2442859 ?auto_2442870 ) ) ( not ( = ?auto_2442859 ?auto_2442871 ) ) ( not ( = ?auto_2442859 ?auto_2442872 ) ) ( not ( = ?auto_2442860 ?auto_2442861 ) ) ( not ( = ?auto_2442860 ?auto_2442862 ) ) ( not ( = ?auto_2442860 ?auto_2442863 ) ) ( not ( = ?auto_2442860 ?auto_2442864 ) ) ( not ( = ?auto_2442860 ?auto_2442865 ) ) ( not ( = ?auto_2442860 ?auto_2442866 ) ) ( not ( = ?auto_2442860 ?auto_2442867 ) ) ( not ( = ?auto_2442860 ?auto_2442868 ) ) ( not ( = ?auto_2442860 ?auto_2442869 ) ) ( not ( = ?auto_2442860 ?auto_2442870 ) ) ( not ( = ?auto_2442860 ?auto_2442871 ) ) ( not ( = ?auto_2442860 ?auto_2442872 ) ) ( not ( = ?auto_2442861 ?auto_2442862 ) ) ( not ( = ?auto_2442861 ?auto_2442863 ) ) ( not ( = ?auto_2442861 ?auto_2442864 ) ) ( not ( = ?auto_2442861 ?auto_2442865 ) ) ( not ( = ?auto_2442861 ?auto_2442866 ) ) ( not ( = ?auto_2442861 ?auto_2442867 ) ) ( not ( = ?auto_2442861 ?auto_2442868 ) ) ( not ( = ?auto_2442861 ?auto_2442869 ) ) ( not ( = ?auto_2442861 ?auto_2442870 ) ) ( not ( = ?auto_2442861 ?auto_2442871 ) ) ( not ( = ?auto_2442861 ?auto_2442872 ) ) ( not ( = ?auto_2442862 ?auto_2442863 ) ) ( not ( = ?auto_2442862 ?auto_2442864 ) ) ( not ( = ?auto_2442862 ?auto_2442865 ) ) ( not ( = ?auto_2442862 ?auto_2442866 ) ) ( not ( = ?auto_2442862 ?auto_2442867 ) ) ( not ( = ?auto_2442862 ?auto_2442868 ) ) ( not ( = ?auto_2442862 ?auto_2442869 ) ) ( not ( = ?auto_2442862 ?auto_2442870 ) ) ( not ( = ?auto_2442862 ?auto_2442871 ) ) ( not ( = ?auto_2442862 ?auto_2442872 ) ) ( not ( = ?auto_2442863 ?auto_2442864 ) ) ( not ( = ?auto_2442863 ?auto_2442865 ) ) ( not ( = ?auto_2442863 ?auto_2442866 ) ) ( not ( = ?auto_2442863 ?auto_2442867 ) ) ( not ( = ?auto_2442863 ?auto_2442868 ) ) ( not ( = ?auto_2442863 ?auto_2442869 ) ) ( not ( = ?auto_2442863 ?auto_2442870 ) ) ( not ( = ?auto_2442863 ?auto_2442871 ) ) ( not ( = ?auto_2442863 ?auto_2442872 ) ) ( not ( = ?auto_2442864 ?auto_2442865 ) ) ( not ( = ?auto_2442864 ?auto_2442866 ) ) ( not ( = ?auto_2442864 ?auto_2442867 ) ) ( not ( = ?auto_2442864 ?auto_2442868 ) ) ( not ( = ?auto_2442864 ?auto_2442869 ) ) ( not ( = ?auto_2442864 ?auto_2442870 ) ) ( not ( = ?auto_2442864 ?auto_2442871 ) ) ( not ( = ?auto_2442864 ?auto_2442872 ) ) ( not ( = ?auto_2442865 ?auto_2442866 ) ) ( not ( = ?auto_2442865 ?auto_2442867 ) ) ( not ( = ?auto_2442865 ?auto_2442868 ) ) ( not ( = ?auto_2442865 ?auto_2442869 ) ) ( not ( = ?auto_2442865 ?auto_2442870 ) ) ( not ( = ?auto_2442865 ?auto_2442871 ) ) ( not ( = ?auto_2442865 ?auto_2442872 ) ) ( not ( = ?auto_2442866 ?auto_2442867 ) ) ( not ( = ?auto_2442866 ?auto_2442868 ) ) ( not ( = ?auto_2442866 ?auto_2442869 ) ) ( not ( = ?auto_2442866 ?auto_2442870 ) ) ( not ( = ?auto_2442866 ?auto_2442871 ) ) ( not ( = ?auto_2442866 ?auto_2442872 ) ) ( not ( = ?auto_2442867 ?auto_2442868 ) ) ( not ( = ?auto_2442867 ?auto_2442869 ) ) ( not ( = ?auto_2442867 ?auto_2442870 ) ) ( not ( = ?auto_2442867 ?auto_2442871 ) ) ( not ( = ?auto_2442867 ?auto_2442872 ) ) ( not ( = ?auto_2442868 ?auto_2442869 ) ) ( not ( = ?auto_2442868 ?auto_2442870 ) ) ( not ( = ?auto_2442868 ?auto_2442871 ) ) ( not ( = ?auto_2442868 ?auto_2442872 ) ) ( not ( = ?auto_2442869 ?auto_2442870 ) ) ( not ( = ?auto_2442869 ?auto_2442871 ) ) ( not ( = ?auto_2442869 ?auto_2442872 ) ) ( not ( = ?auto_2442870 ?auto_2442871 ) ) ( not ( = ?auto_2442870 ?auto_2442872 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2442871 ?auto_2442872 )
      ( MAKE-13CRATE-VERIFY ?auto_2442859 ?auto_2442860 ?auto_2442861 ?auto_2442862 ?auto_2442863 ?auto_2442864 ?auto_2442865 ?auto_2442866 ?auto_2442867 ?auto_2442868 ?auto_2442869 ?auto_2442870 ?auto_2442871 ?auto_2442872 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2443001 - SURFACE
      ?auto_2443002 - SURFACE
      ?auto_2443003 - SURFACE
      ?auto_2443004 - SURFACE
      ?auto_2443005 - SURFACE
      ?auto_2443006 - SURFACE
      ?auto_2443007 - SURFACE
      ?auto_2443008 - SURFACE
      ?auto_2443009 - SURFACE
      ?auto_2443010 - SURFACE
      ?auto_2443011 - SURFACE
      ?auto_2443012 - SURFACE
      ?auto_2443013 - SURFACE
      ?auto_2443014 - SURFACE
    )
    :vars
    (
      ?auto_2443015 - HOIST
      ?auto_2443017 - PLACE
      ?auto_2443016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2443015 ?auto_2443017 ) ( SURFACE-AT ?auto_2443013 ?auto_2443017 ) ( CLEAR ?auto_2443013 ) ( IS-CRATE ?auto_2443014 ) ( not ( = ?auto_2443013 ?auto_2443014 ) ) ( TRUCK-AT ?auto_2443016 ?auto_2443017 ) ( AVAILABLE ?auto_2443015 ) ( IN ?auto_2443014 ?auto_2443016 ) ( ON ?auto_2443013 ?auto_2443012 ) ( not ( = ?auto_2443012 ?auto_2443013 ) ) ( not ( = ?auto_2443012 ?auto_2443014 ) ) ( ON ?auto_2443002 ?auto_2443001 ) ( ON ?auto_2443003 ?auto_2443002 ) ( ON ?auto_2443004 ?auto_2443003 ) ( ON ?auto_2443005 ?auto_2443004 ) ( ON ?auto_2443006 ?auto_2443005 ) ( ON ?auto_2443007 ?auto_2443006 ) ( ON ?auto_2443008 ?auto_2443007 ) ( ON ?auto_2443009 ?auto_2443008 ) ( ON ?auto_2443010 ?auto_2443009 ) ( ON ?auto_2443011 ?auto_2443010 ) ( ON ?auto_2443012 ?auto_2443011 ) ( not ( = ?auto_2443001 ?auto_2443002 ) ) ( not ( = ?auto_2443001 ?auto_2443003 ) ) ( not ( = ?auto_2443001 ?auto_2443004 ) ) ( not ( = ?auto_2443001 ?auto_2443005 ) ) ( not ( = ?auto_2443001 ?auto_2443006 ) ) ( not ( = ?auto_2443001 ?auto_2443007 ) ) ( not ( = ?auto_2443001 ?auto_2443008 ) ) ( not ( = ?auto_2443001 ?auto_2443009 ) ) ( not ( = ?auto_2443001 ?auto_2443010 ) ) ( not ( = ?auto_2443001 ?auto_2443011 ) ) ( not ( = ?auto_2443001 ?auto_2443012 ) ) ( not ( = ?auto_2443001 ?auto_2443013 ) ) ( not ( = ?auto_2443001 ?auto_2443014 ) ) ( not ( = ?auto_2443002 ?auto_2443003 ) ) ( not ( = ?auto_2443002 ?auto_2443004 ) ) ( not ( = ?auto_2443002 ?auto_2443005 ) ) ( not ( = ?auto_2443002 ?auto_2443006 ) ) ( not ( = ?auto_2443002 ?auto_2443007 ) ) ( not ( = ?auto_2443002 ?auto_2443008 ) ) ( not ( = ?auto_2443002 ?auto_2443009 ) ) ( not ( = ?auto_2443002 ?auto_2443010 ) ) ( not ( = ?auto_2443002 ?auto_2443011 ) ) ( not ( = ?auto_2443002 ?auto_2443012 ) ) ( not ( = ?auto_2443002 ?auto_2443013 ) ) ( not ( = ?auto_2443002 ?auto_2443014 ) ) ( not ( = ?auto_2443003 ?auto_2443004 ) ) ( not ( = ?auto_2443003 ?auto_2443005 ) ) ( not ( = ?auto_2443003 ?auto_2443006 ) ) ( not ( = ?auto_2443003 ?auto_2443007 ) ) ( not ( = ?auto_2443003 ?auto_2443008 ) ) ( not ( = ?auto_2443003 ?auto_2443009 ) ) ( not ( = ?auto_2443003 ?auto_2443010 ) ) ( not ( = ?auto_2443003 ?auto_2443011 ) ) ( not ( = ?auto_2443003 ?auto_2443012 ) ) ( not ( = ?auto_2443003 ?auto_2443013 ) ) ( not ( = ?auto_2443003 ?auto_2443014 ) ) ( not ( = ?auto_2443004 ?auto_2443005 ) ) ( not ( = ?auto_2443004 ?auto_2443006 ) ) ( not ( = ?auto_2443004 ?auto_2443007 ) ) ( not ( = ?auto_2443004 ?auto_2443008 ) ) ( not ( = ?auto_2443004 ?auto_2443009 ) ) ( not ( = ?auto_2443004 ?auto_2443010 ) ) ( not ( = ?auto_2443004 ?auto_2443011 ) ) ( not ( = ?auto_2443004 ?auto_2443012 ) ) ( not ( = ?auto_2443004 ?auto_2443013 ) ) ( not ( = ?auto_2443004 ?auto_2443014 ) ) ( not ( = ?auto_2443005 ?auto_2443006 ) ) ( not ( = ?auto_2443005 ?auto_2443007 ) ) ( not ( = ?auto_2443005 ?auto_2443008 ) ) ( not ( = ?auto_2443005 ?auto_2443009 ) ) ( not ( = ?auto_2443005 ?auto_2443010 ) ) ( not ( = ?auto_2443005 ?auto_2443011 ) ) ( not ( = ?auto_2443005 ?auto_2443012 ) ) ( not ( = ?auto_2443005 ?auto_2443013 ) ) ( not ( = ?auto_2443005 ?auto_2443014 ) ) ( not ( = ?auto_2443006 ?auto_2443007 ) ) ( not ( = ?auto_2443006 ?auto_2443008 ) ) ( not ( = ?auto_2443006 ?auto_2443009 ) ) ( not ( = ?auto_2443006 ?auto_2443010 ) ) ( not ( = ?auto_2443006 ?auto_2443011 ) ) ( not ( = ?auto_2443006 ?auto_2443012 ) ) ( not ( = ?auto_2443006 ?auto_2443013 ) ) ( not ( = ?auto_2443006 ?auto_2443014 ) ) ( not ( = ?auto_2443007 ?auto_2443008 ) ) ( not ( = ?auto_2443007 ?auto_2443009 ) ) ( not ( = ?auto_2443007 ?auto_2443010 ) ) ( not ( = ?auto_2443007 ?auto_2443011 ) ) ( not ( = ?auto_2443007 ?auto_2443012 ) ) ( not ( = ?auto_2443007 ?auto_2443013 ) ) ( not ( = ?auto_2443007 ?auto_2443014 ) ) ( not ( = ?auto_2443008 ?auto_2443009 ) ) ( not ( = ?auto_2443008 ?auto_2443010 ) ) ( not ( = ?auto_2443008 ?auto_2443011 ) ) ( not ( = ?auto_2443008 ?auto_2443012 ) ) ( not ( = ?auto_2443008 ?auto_2443013 ) ) ( not ( = ?auto_2443008 ?auto_2443014 ) ) ( not ( = ?auto_2443009 ?auto_2443010 ) ) ( not ( = ?auto_2443009 ?auto_2443011 ) ) ( not ( = ?auto_2443009 ?auto_2443012 ) ) ( not ( = ?auto_2443009 ?auto_2443013 ) ) ( not ( = ?auto_2443009 ?auto_2443014 ) ) ( not ( = ?auto_2443010 ?auto_2443011 ) ) ( not ( = ?auto_2443010 ?auto_2443012 ) ) ( not ( = ?auto_2443010 ?auto_2443013 ) ) ( not ( = ?auto_2443010 ?auto_2443014 ) ) ( not ( = ?auto_2443011 ?auto_2443012 ) ) ( not ( = ?auto_2443011 ?auto_2443013 ) ) ( not ( = ?auto_2443011 ?auto_2443014 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2443012 ?auto_2443013 ?auto_2443014 )
      ( MAKE-13CRATE-VERIFY ?auto_2443001 ?auto_2443002 ?auto_2443003 ?auto_2443004 ?auto_2443005 ?auto_2443006 ?auto_2443007 ?auto_2443008 ?auto_2443009 ?auto_2443010 ?auto_2443011 ?auto_2443012 ?auto_2443013 ?auto_2443014 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2443157 - SURFACE
      ?auto_2443158 - SURFACE
      ?auto_2443159 - SURFACE
      ?auto_2443160 - SURFACE
      ?auto_2443161 - SURFACE
      ?auto_2443162 - SURFACE
      ?auto_2443163 - SURFACE
      ?auto_2443164 - SURFACE
      ?auto_2443165 - SURFACE
      ?auto_2443166 - SURFACE
      ?auto_2443167 - SURFACE
      ?auto_2443168 - SURFACE
      ?auto_2443169 - SURFACE
      ?auto_2443170 - SURFACE
    )
    :vars
    (
      ?auto_2443171 - HOIST
      ?auto_2443174 - PLACE
      ?auto_2443172 - TRUCK
      ?auto_2443173 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2443171 ?auto_2443174 ) ( SURFACE-AT ?auto_2443169 ?auto_2443174 ) ( CLEAR ?auto_2443169 ) ( IS-CRATE ?auto_2443170 ) ( not ( = ?auto_2443169 ?auto_2443170 ) ) ( AVAILABLE ?auto_2443171 ) ( IN ?auto_2443170 ?auto_2443172 ) ( ON ?auto_2443169 ?auto_2443168 ) ( not ( = ?auto_2443168 ?auto_2443169 ) ) ( not ( = ?auto_2443168 ?auto_2443170 ) ) ( TRUCK-AT ?auto_2443172 ?auto_2443173 ) ( not ( = ?auto_2443173 ?auto_2443174 ) ) ( ON ?auto_2443158 ?auto_2443157 ) ( ON ?auto_2443159 ?auto_2443158 ) ( ON ?auto_2443160 ?auto_2443159 ) ( ON ?auto_2443161 ?auto_2443160 ) ( ON ?auto_2443162 ?auto_2443161 ) ( ON ?auto_2443163 ?auto_2443162 ) ( ON ?auto_2443164 ?auto_2443163 ) ( ON ?auto_2443165 ?auto_2443164 ) ( ON ?auto_2443166 ?auto_2443165 ) ( ON ?auto_2443167 ?auto_2443166 ) ( ON ?auto_2443168 ?auto_2443167 ) ( not ( = ?auto_2443157 ?auto_2443158 ) ) ( not ( = ?auto_2443157 ?auto_2443159 ) ) ( not ( = ?auto_2443157 ?auto_2443160 ) ) ( not ( = ?auto_2443157 ?auto_2443161 ) ) ( not ( = ?auto_2443157 ?auto_2443162 ) ) ( not ( = ?auto_2443157 ?auto_2443163 ) ) ( not ( = ?auto_2443157 ?auto_2443164 ) ) ( not ( = ?auto_2443157 ?auto_2443165 ) ) ( not ( = ?auto_2443157 ?auto_2443166 ) ) ( not ( = ?auto_2443157 ?auto_2443167 ) ) ( not ( = ?auto_2443157 ?auto_2443168 ) ) ( not ( = ?auto_2443157 ?auto_2443169 ) ) ( not ( = ?auto_2443157 ?auto_2443170 ) ) ( not ( = ?auto_2443158 ?auto_2443159 ) ) ( not ( = ?auto_2443158 ?auto_2443160 ) ) ( not ( = ?auto_2443158 ?auto_2443161 ) ) ( not ( = ?auto_2443158 ?auto_2443162 ) ) ( not ( = ?auto_2443158 ?auto_2443163 ) ) ( not ( = ?auto_2443158 ?auto_2443164 ) ) ( not ( = ?auto_2443158 ?auto_2443165 ) ) ( not ( = ?auto_2443158 ?auto_2443166 ) ) ( not ( = ?auto_2443158 ?auto_2443167 ) ) ( not ( = ?auto_2443158 ?auto_2443168 ) ) ( not ( = ?auto_2443158 ?auto_2443169 ) ) ( not ( = ?auto_2443158 ?auto_2443170 ) ) ( not ( = ?auto_2443159 ?auto_2443160 ) ) ( not ( = ?auto_2443159 ?auto_2443161 ) ) ( not ( = ?auto_2443159 ?auto_2443162 ) ) ( not ( = ?auto_2443159 ?auto_2443163 ) ) ( not ( = ?auto_2443159 ?auto_2443164 ) ) ( not ( = ?auto_2443159 ?auto_2443165 ) ) ( not ( = ?auto_2443159 ?auto_2443166 ) ) ( not ( = ?auto_2443159 ?auto_2443167 ) ) ( not ( = ?auto_2443159 ?auto_2443168 ) ) ( not ( = ?auto_2443159 ?auto_2443169 ) ) ( not ( = ?auto_2443159 ?auto_2443170 ) ) ( not ( = ?auto_2443160 ?auto_2443161 ) ) ( not ( = ?auto_2443160 ?auto_2443162 ) ) ( not ( = ?auto_2443160 ?auto_2443163 ) ) ( not ( = ?auto_2443160 ?auto_2443164 ) ) ( not ( = ?auto_2443160 ?auto_2443165 ) ) ( not ( = ?auto_2443160 ?auto_2443166 ) ) ( not ( = ?auto_2443160 ?auto_2443167 ) ) ( not ( = ?auto_2443160 ?auto_2443168 ) ) ( not ( = ?auto_2443160 ?auto_2443169 ) ) ( not ( = ?auto_2443160 ?auto_2443170 ) ) ( not ( = ?auto_2443161 ?auto_2443162 ) ) ( not ( = ?auto_2443161 ?auto_2443163 ) ) ( not ( = ?auto_2443161 ?auto_2443164 ) ) ( not ( = ?auto_2443161 ?auto_2443165 ) ) ( not ( = ?auto_2443161 ?auto_2443166 ) ) ( not ( = ?auto_2443161 ?auto_2443167 ) ) ( not ( = ?auto_2443161 ?auto_2443168 ) ) ( not ( = ?auto_2443161 ?auto_2443169 ) ) ( not ( = ?auto_2443161 ?auto_2443170 ) ) ( not ( = ?auto_2443162 ?auto_2443163 ) ) ( not ( = ?auto_2443162 ?auto_2443164 ) ) ( not ( = ?auto_2443162 ?auto_2443165 ) ) ( not ( = ?auto_2443162 ?auto_2443166 ) ) ( not ( = ?auto_2443162 ?auto_2443167 ) ) ( not ( = ?auto_2443162 ?auto_2443168 ) ) ( not ( = ?auto_2443162 ?auto_2443169 ) ) ( not ( = ?auto_2443162 ?auto_2443170 ) ) ( not ( = ?auto_2443163 ?auto_2443164 ) ) ( not ( = ?auto_2443163 ?auto_2443165 ) ) ( not ( = ?auto_2443163 ?auto_2443166 ) ) ( not ( = ?auto_2443163 ?auto_2443167 ) ) ( not ( = ?auto_2443163 ?auto_2443168 ) ) ( not ( = ?auto_2443163 ?auto_2443169 ) ) ( not ( = ?auto_2443163 ?auto_2443170 ) ) ( not ( = ?auto_2443164 ?auto_2443165 ) ) ( not ( = ?auto_2443164 ?auto_2443166 ) ) ( not ( = ?auto_2443164 ?auto_2443167 ) ) ( not ( = ?auto_2443164 ?auto_2443168 ) ) ( not ( = ?auto_2443164 ?auto_2443169 ) ) ( not ( = ?auto_2443164 ?auto_2443170 ) ) ( not ( = ?auto_2443165 ?auto_2443166 ) ) ( not ( = ?auto_2443165 ?auto_2443167 ) ) ( not ( = ?auto_2443165 ?auto_2443168 ) ) ( not ( = ?auto_2443165 ?auto_2443169 ) ) ( not ( = ?auto_2443165 ?auto_2443170 ) ) ( not ( = ?auto_2443166 ?auto_2443167 ) ) ( not ( = ?auto_2443166 ?auto_2443168 ) ) ( not ( = ?auto_2443166 ?auto_2443169 ) ) ( not ( = ?auto_2443166 ?auto_2443170 ) ) ( not ( = ?auto_2443167 ?auto_2443168 ) ) ( not ( = ?auto_2443167 ?auto_2443169 ) ) ( not ( = ?auto_2443167 ?auto_2443170 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2443168 ?auto_2443169 ?auto_2443170 )
      ( MAKE-13CRATE-VERIFY ?auto_2443157 ?auto_2443158 ?auto_2443159 ?auto_2443160 ?auto_2443161 ?auto_2443162 ?auto_2443163 ?auto_2443164 ?auto_2443165 ?auto_2443166 ?auto_2443167 ?auto_2443168 ?auto_2443169 ?auto_2443170 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2443326 - SURFACE
      ?auto_2443327 - SURFACE
      ?auto_2443328 - SURFACE
      ?auto_2443329 - SURFACE
      ?auto_2443330 - SURFACE
      ?auto_2443331 - SURFACE
      ?auto_2443332 - SURFACE
      ?auto_2443333 - SURFACE
      ?auto_2443334 - SURFACE
      ?auto_2443335 - SURFACE
      ?auto_2443336 - SURFACE
      ?auto_2443337 - SURFACE
      ?auto_2443338 - SURFACE
      ?auto_2443339 - SURFACE
    )
    :vars
    (
      ?auto_2443341 - HOIST
      ?auto_2443340 - PLACE
      ?auto_2443342 - TRUCK
      ?auto_2443343 - PLACE
      ?auto_2443344 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2443341 ?auto_2443340 ) ( SURFACE-AT ?auto_2443338 ?auto_2443340 ) ( CLEAR ?auto_2443338 ) ( IS-CRATE ?auto_2443339 ) ( not ( = ?auto_2443338 ?auto_2443339 ) ) ( AVAILABLE ?auto_2443341 ) ( ON ?auto_2443338 ?auto_2443337 ) ( not ( = ?auto_2443337 ?auto_2443338 ) ) ( not ( = ?auto_2443337 ?auto_2443339 ) ) ( TRUCK-AT ?auto_2443342 ?auto_2443343 ) ( not ( = ?auto_2443343 ?auto_2443340 ) ) ( HOIST-AT ?auto_2443344 ?auto_2443343 ) ( LIFTING ?auto_2443344 ?auto_2443339 ) ( not ( = ?auto_2443341 ?auto_2443344 ) ) ( ON ?auto_2443327 ?auto_2443326 ) ( ON ?auto_2443328 ?auto_2443327 ) ( ON ?auto_2443329 ?auto_2443328 ) ( ON ?auto_2443330 ?auto_2443329 ) ( ON ?auto_2443331 ?auto_2443330 ) ( ON ?auto_2443332 ?auto_2443331 ) ( ON ?auto_2443333 ?auto_2443332 ) ( ON ?auto_2443334 ?auto_2443333 ) ( ON ?auto_2443335 ?auto_2443334 ) ( ON ?auto_2443336 ?auto_2443335 ) ( ON ?auto_2443337 ?auto_2443336 ) ( not ( = ?auto_2443326 ?auto_2443327 ) ) ( not ( = ?auto_2443326 ?auto_2443328 ) ) ( not ( = ?auto_2443326 ?auto_2443329 ) ) ( not ( = ?auto_2443326 ?auto_2443330 ) ) ( not ( = ?auto_2443326 ?auto_2443331 ) ) ( not ( = ?auto_2443326 ?auto_2443332 ) ) ( not ( = ?auto_2443326 ?auto_2443333 ) ) ( not ( = ?auto_2443326 ?auto_2443334 ) ) ( not ( = ?auto_2443326 ?auto_2443335 ) ) ( not ( = ?auto_2443326 ?auto_2443336 ) ) ( not ( = ?auto_2443326 ?auto_2443337 ) ) ( not ( = ?auto_2443326 ?auto_2443338 ) ) ( not ( = ?auto_2443326 ?auto_2443339 ) ) ( not ( = ?auto_2443327 ?auto_2443328 ) ) ( not ( = ?auto_2443327 ?auto_2443329 ) ) ( not ( = ?auto_2443327 ?auto_2443330 ) ) ( not ( = ?auto_2443327 ?auto_2443331 ) ) ( not ( = ?auto_2443327 ?auto_2443332 ) ) ( not ( = ?auto_2443327 ?auto_2443333 ) ) ( not ( = ?auto_2443327 ?auto_2443334 ) ) ( not ( = ?auto_2443327 ?auto_2443335 ) ) ( not ( = ?auto_2443327 ?auto_2443336 ) ) ( not ( = ?auto_2443327 ?auto_2443337 ) ) ( not ( = ?auto_2443327 ?auto_2443338 ) ) ( not ( = ?auto_2443327 ?auto_2443339 ) ) ( not ( = ?auto_2443328 ?auto_2443329 ) ) ( not ( = ?auto_2443328 ?auto_2443330 ) ) ( not ( = ?auto_2443328 ?auto_2443331 ) ) ( not ( = ?auto_2443328 ?auto_2443332 ) ) ( not ( = ?auto_2443328 ?auto_2443333 ) ) ( not ( = ?auto_2443328 ?auto_2443334 ) ) ( not ( = ?auto_2443328 ?auto_2443335 ) ) ( not ( = ?auto_2443328 ?auto_2443336 ) ) ( not ( = ?auto_2443328 ?auto_2443337 ) ) ( not ( = ?auto_2443328 ?auto_2443338 ) ) ( not ( = ?auto_2443328 ?auto_2443339 ) ) ( not ( = ?auto_2443329 ?auto_2443330 ) ) ( not ( = ?auto_2443329 ?auto_2443331 ) ) ( not ( = ?auto_2443329 ?auto_2443332 ) ) ( not ( = ?auto_2443329 ?auto_2443333 ) ) ( not ( = ?auto_2443329 ?auto_2443334 ) ) ( not ( = ?auto_2443329 ?auto_2443335 ) ) ( not ( = ?auto_2443329 ?auto_2443336 ) ) ( not ( = ?auto_2443329 ?auto_2443337 ) ) ( not ( = ?auto_2443329 ?auto_2443338 ) ) ( not ( = ?auto_2443329 ?auto_2443339 ) ) ( not ( = ?auto_2443330 ?auto_2443331 ) ) ( not ( = ?auto_2443330 ?auto_2443332 ) ) ( not ( = ?auto_2443330 ?auto_2443333 ) ) ( not ( = ?auto_2443330 ?auto_2443334 ) ) ( not ( = ?auto_2443330 ?auto_2443335 ) ) ( not ( = ?auto_2443330 ?auto_2443336 ) ) ( not ( = ?auto_2443330 ?auto_2443337 ) ) ( not ( = ?auto_2443330 ?auto_2443338 ) ) ( not ( = ?auto_2443330 ?auto_2443339 ) ) ( not ( = ?auto_2443331 ?auto_2443332 ) ) ( not ( = ?auto_2443331 ?auto_2443333 ) ) ( not ( = ?auto_2443331 ?auto_2443334 ) ) ( not ( = ?auto_2443331 ?auto_2443335 ) ) ( not ( = ?auto_2443331 ?auto_2443336 ) ) ( not ( = ?auto_2443331 ?auto_2443337 ) ) ( not ( = ?auto_2443331 ?auto_2443338 ) ) ( not ( = ?auto_2443331 ?auto_2443339 ) ) ( not ( = ?auto_2443332 ?auto_2443333 ) ) ( not ( = ?auto_2443332 ?auto_2443334 ) ) ( not ( = ?auto_2443332 ?auto_2443335 ) ) ( not ( = ?auto_2443332 ?auto_2443336 ) ) ( not ( = ?auto_2443332 ?auto_2443337 ) ) ( not ( = ?auto_2443332 ?auto_2443338 ) ) ( not ( = ?auto_2443332 ?auto_2443339 ) ) ( not ( = ?auto_2443333 ?auto_2443334 ) ) ( not ( = ?auto_2443333 ?auto_2443335 ) ) ( not ( = ?auto_2443333 ?auto_2443336 ) ) ( not ( = ?auto_2443333 ?auto_2443337 ) ) ( not ( = ?auto_2443333 ?auto_2443338 ) ) ( not ( = ?auto_2443333 ?auto_2443339 ) ) ( not ( = ?auto_2443334 ?auto_2443335 ) ) ( not ( = ?auto_2443334 ?auto_2443336 ) ) ( not ( = ?auto_2443334 ?auto_2443337 ) ) ( not ( = ?auto_2443334 ?auto_2443338 ) ) ( not ( = ?auto_2443334 ?auto_2443339 ) ) ( not ( = ?auto_2443335 ?auto_2443336 ) ) ( not ( = ?auto_2443335 ?auto_2443337 ) ) ( not ( = ?auto_2443335 ?auto_2443338 ) ) ( not ( = ?auto_2443335 ?auto_2443339 ) ) ( not ( = ?auto_2443336 ?auto_2443337 ) ) ( not ( = ?auto_2443336 ?auto_2443338 ) ) ( not ( = ?auto_2443336 ?auto_2443339 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2443337 ?auto_2443338 ?auto_2443339 )
      ( MAKE-13CRATE-VERIFY ?auto_2443326 ?auto_2443327 ?auto_2443328 ?auto_2443329 ?auto_2443330 ?auto_2443331 ?auto_2443332 ?auto_2443333 ?auto_2443334 ?auto_2443335 ?auto_2443336 ?auto_2443337 ?auto_2443338 ?auto_2443339 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2443508 - SURFACE
      ?auto_2443509 - SURFACE
      ?auto_2443510 - SURFACE
      ?auto_2443511 - SURFACE
      ?auto_2443512 - SURFACE
      ?auto_2443513 - SURFACE
      ?auto_2443514 - SURFACE
      ?auto_2443515 - SURFACE
      ?auto_2443516 - SURFACE
      ?auto_2443517 - SURFACE
      ?auto_2443518 - SURFACE
      ?auto_2443519 - SURFACE
      ?auto_2443520 - SURFACE
      ?auto_2443521 - SURFACE
    )
    :vars
    (
      ?auto_2443522 - HOIST
      ?auto_2443523 - PLACE
      ?auto_2443525 - TRUCK
      ?auto_2443527 - PLACE
      ?auto_2443526 - HOIST
      ?auto_2443524 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2443522 ?auto_2443523 ) ( SURFACE-AT ?auto_2443520 ?auto_2443523 ) ( CLEAR ?auto_2443520 ) ( IS-CRATE ?auto_2443521 ) ( not ( = ?auto_2443520 ?auto_2443521 ) ) ( AVAILABLE ?auto_2443522 ) ( ON ?auto_2443520 ?auto_2443519 ) ( not ( = ?auto_2443519 ?auto_2443520 ) ) ( not ( = ?auto_2443519 ?auto_2443521 ) ) ( TRUCK-AT ?auto_2443525 ?auto_2443527 ) ( not ( = ?auto_2443527 ?auto_2443523 ) ) ( HOIST-AT ?auto_2443526 ?auto_2443527 ) ( not ( = ?auto_2443522 ?auto_2443526 ) ) ( AVAILABLE ?auto_2443526 ) ( SURFACE-AT ?auto_2443521 ?auto_2443527 ) ( ON ?auto_2443521 ?auto_2443524 ) ( CLEAR ?auto_2443521 ) ( not ( = ?auto_2443520 ?auto_2443524 ) ) ( not ( = ?auto_2443521 ?auto_2443524 ) ) ( not ( = ?auto_2443519 ?auto_2443524 ) ) ( ON ?auto_2443509 ?auto_2443508 ) ( ON ?auto_2443510 ?auto_2443509 ) ( ON ?auto_2443511 ?auto_2443510 ) ( ON ?auto_2443512 ?auto_2443511 ) ( ON ?auto_2443513 ?auto_2443512 ) ( ON ?auto_2443514 ?auto_2443513 ) ( ON ?auto_2443515 ?auto_2443514 ) ( ON ?auto_2443516 ?auto_2443515 ) ( ON ?auto_2443517 ?auto_2443516 ) ( ON ?auto_2443518 ?auto_2443517 ) ( ON ?auto_2443519 ?auto_2443518 ) ( not ( = ?auto_2443508 ?auto_2443509 ) ) ( not ( = ?auto_2443508 ?auto_2443510 ) ) ( not ( = ?auto_2443508 ?auto_2443511 ) ) ( not ( = ?auto_2443508 ?auto_2443512 ) ) ( not ( = ?auto_2443508 ?auto_2443513 ) ) ( not ( = ?auto_2443508 ?auto_2443514 ) ) ( not ( = ?auto_2443508 ?auto_2443515 ) ) ( not ( = ?auto_2443508 ?auto_2443516 ) ) ( not ( = ?auto_2443508 ?auto_2443517 ) ) ( not ( = ?auto_2443508 ?auto_2443518 ) ) ( not ( = ?auto_2443508 ?auto_2443519 ) ) ( not ( = ?auto_2443508 ?auto_2443520 ) ) ( not ( = ?auto_2443508 ?auto_2443521 ) ) ( not ( = ?auto_2443508 ?auto_2443524 ) ) ( not ( = ?auto_2443509 ?auto_2443510 ) ) ( not ( = ?auto_2443509 ?auto_2443511 ) ) ( not ( = ?auto_2443509 ?auto_2443512 ) ) ( not ( = ?auto_2443509 ?auto_2443513 ) ) ( not ( = ?auto_2443509 ?auto_2443514 ) ) ( not ( = ?auto_2443509 ?auto_2443515 ) ) ( not ( = ?auto_2443509 ?auto_2443516 ) ) ( not ( = ?auto_2443509 ?auto_2443517 ) ) ( not ( = ?auto_2443509 ?auto_2443518 ) ) ( not ( = ?auto_2443509 ?auto_2443519 ) ) ( not ( = ?auto_2443509 ?auto_2443520 ) ) ( not ( = ?auto_2443509 ?auto_2443521 ) ) ( not ( = ?auto_2443509 ?auto_2443524 ) ) ( not ( = ?auto_2443510 ?auto_2443511 ) ) ( not ( = ?auto_2443510 ?auto_2443512 ) ) ( not ( = ?auto_2443510 ?auto_2443513 ) ) ( not ( = ?auto_2443510 ?auto_2443514 ) ) ( not ( = ?auto_2443510 ?auto_2443515 ) ) ( not ( = ?auto_2443510 ?auto_2443516 ) ) ( not ( = ?auto_2443510 ?auto_2443517 ) ) ( not ( = ?auto_2443510 ?auto_2443518 ) ) ( not ( = ?auto_2443510 ?auto_2443519 ) ) ( not ( = ?auto_2443510 ?auto_2443520 ) ) ( not ( = ?auto_2443510 ?auto_2443521 ) ) ( not ( = ?auto_2443510 ?auto_2443524 ) ) ( not ( = ?auto_2443511 ?auto_2443512 ) ) ( not ( = ?auto_2443511 ?auto_2443513 ) ) ( not ( = ?auto_2443511 ?auto_2443514 ) ) ( not ( = ?auto_2443511 ?auto_2443515 ) ) ( not ( = ?auto_2443511 ?auto_2443516 ) ) ( not ( = ?auto_2443511 ?auto_2443517 ) ) ( not ( = ?auto_2443511 ?auto_2443518 ) ) ( not ( = ?auto_2443511 ?auto_2443519 ) ) ( not ( = ?auto_2443511 ?auto_2443520 ) ) ( not ( = ?auto_2443511 ?auto_2443521 ) ) ( not ( = ?auto_2443511 ?auto_2443524 ) ) ( not ( = ?auto_2443512 ?auto_2443513 ) ) ( not ( = ?auto_2443512 ?auto_2443514 ) ) ( not ( = ?auto_2443512 ?auto_2443515 ) ) ( not ( = ?auto_2443512 ?auto_2443516 ) ) ( not ( = ?auto_2443512 ?auto_2443517 ) ) ( not ( = ?auto_2443512 ?auto_2443518 ) ) ( not ( = ?auto_2443512 ?auto_2443519 ) ) ( not ( = ?auto_2443512 ?auto_2443520 ) ) ( not ( = ?auto_2443512 ?auto_2443521 ) ) ( not ( = ?auto_2443512 ?auto_2443524 ) ) ( not ( = ?auto_2443513 ?auto_2443514 ) ) ( not ( = ?auto_2443513 ?auto_2443515 ) ) ( not ( = ?auto_2443513 ?auto_2443516 ) ) ( not ( = ?auto_2443513 ?auto_2443517 ) ) ( not ( = ?auto_2443513 ?auto_2443518 ) ) ( not ( = ?auto_2443513 ?auto_2443519 ) ) ( not ( = ?auto_2443513 ?auto_2443520 ) ) ( not ( = ?auto_2443513 ?auto_2443521 ) ) ( not ( = ?auto_2443513 ?auto_2443524 ) ) ( not ( = ?auto_2443514 ?auto_2443515 ) ) ( not ( = ?auto_2443514 ?auto_2443516 ) ) ( not ( = ?auto_2443514 ?auto_2443517 ) ) ( not ( = ?auto_2443514 ?auto_2443518 ) ) ( not ( = ?auto_2443514 ?auto_2443519 ) ) ( not ( = ?auto_2443514 ?auto_2443520 ) ) ( not ( = ?auto_2443514 ?auto_2443521 ) ) ( not ( = ?auto_2443514 ?auto_2443524 ) ) ( not ( = ?auto_2443515 ?auto_2443516 ) ) ( not ( = ?auto_2443515 ?auto_2443517 ) ) ( not ( = ?auto_2443515 ?auto_2443518 ) ) ( not ( = ?auto_2443515 ?auto_2443519 ) ) ( not ( = ?auto_2443515 ?auto_2443520 ) ) ( not ( = ?auto_2443515 ?auto_2443521 ) ) ( not ( = ?auto_2443515 ?auto_2443524 ) ) ( not ( = ?auto_2443516 ?auto_2443517 ) ) ( not ( = ?auto_2443516 ?auto_2443518 ) ) ( not ( = ?auto_2443516 ?auto_2443519 ) ) ( not ( = ?auto_2443516 ?auto_2443520 ) ) ( not ( = ?auto_2443516 ?auto_2443521 ) ) ( not ( = ?auto_2443516 ?auto_2443524 ) ) ( not ( = ?auto_2443517 ?auto_2443518 ) ) ( not ( = ?auto_2443517 ?auto_2443519 ) ) ( not ( = ?auto_2443517 ?auto_2443520 ) ) ( not ( = ?auto_2443517 ?auto_2443521 ) ) ( not ( = ?auto_2443517 ?auto_2443524 ) ) ( not ( = ?auto_2443518 ?auto_2443519 ) ) ( not ( = ?auto_2443518 ?auto_2443520 ) ) ( not ( = ?auto_2443518 ?auto_2443521 ) ) ( not ( = ?auto_2443518 ?auto_2443524 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2443519 ?auto_2443520 ?auto_2443521 )
      ( MAKE-13CRATE-VERIFY ?auto_2443508 ?auto_2443509 ?auto_2443510 ?auto_2443511 ?auto_2443512 ?auto_2443513 ?auto_2443514 ?auto_2443515 ?auto_2443516 ?auto_2443517 ?auto_2443518 ?auto_2443519 ?auto_2443520 ?auto_2443521 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2443691 - SURFACE
      ?auto_2443692 - SURFACE
      ?auto_2443693 - SURFACE
      ?auto_2443694 - SURFACE
      ?auto_2443695 - SURFACE
      ?auto_2443696 - SURFACE
      ?auto_2443697 - SURFACE
      ?auto_2443698 - SURFACE
      ?auto_2443699 - SURFACE
      ?auto_2443700 - SURFACE
      ?auto_2443701 - SURFACE
      ?auto_2443702 - SURFACE
      ?auto_2443703 - SURFACE
      ?auto_2443704 - SURFACE
    )
    :vars
    (
      ?auto_2443707 - HOIST
      ?auto_2443706 - PLACE
      ?auto_2443710 - PLACE
      ?auto_2443705 - HOIST
      ?auto_2443708 - SURFACE
      ?auto_2443709 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2443707 ?auto_2443706 ) ( SURFACE-AT ?auto_2443703 ?auto_2443706 ) ( CLEAR ?auto_2443703 ) ( IS-CRATE ?auto_2443704 ) ( not ( = ?auto_2443703 ?auto_2443704 ) ) ( AVAILABLE ?auto_2443707 ) ( ON ?auto_2443703 ?auto_2443702 ) ( not ( = ?auto_2443702 ?auto_2443703 ) ) ( not ( = ?auto_2443702 ?auto_2443704 ) ) ( not ( = ?auto_2443710 ?auto_2443706 ) ) ( HOIST-AT ?auto_2443705 ?auto_2443710 ) ( not ( = ?auto_2443707 ?auto_2443705 ) ) ( AVAILABLE ?auto_2443705 ) ( SURFACE-AT ?auto_2443704 ?auto_2443710 ) ( ON ?auto_2443704 ?auto_2443708 ) ( CLEAR ?auto_2443704 ) ( not ( = ?auto_2443703 ?auto_2443708 ) ) ( not ( = ?auto_2443704 ?auto_2443708 ) ) ( not ( = ?auto_2443702 ?auto_2443708 ) ) ( TRUCK-AT ?auto_2443709 ?auto_2443706 ) ( ON ?auto_2443692 ?auto_2443691 ) ( ON ?auto_2443693 ?auto_2443692 ) ( ON ?auto_2443694 ?auto_2443693 ) ( ON ?auto_2443695 ?auto_2443694 ) ( ON ?auto_2443696 ?auto_2443695 ) ( ON ?auto_2443697 ?auto_2443696 ) ( ON ?auto_2443698 ?auto_2443697 ) ( ON ?auto_2443699 ?auto_2443698 ) ( ON ?auto_2443700 ?auto_2443699 ) ( ON ?auto_2443701 ?auto_2443700 ) ( ON ?auto_2443702 ?auto_2443701 ) ( not ( = ?auto_2443691 ?auto_2443692 ) ) ( not ( = ?auto_2443691 ?auto_2443693 ) ) ( not ( = ?auto_2443691 ?auto_2443694 ) ) ( not ( = ?auto_2443691 ?auto_2443695 ) ) ( not ( = ?auto_2443691 ?auto_2443696 ) ) ( not ( = ?auto_2443691 ?auto_2443697 ) ) ( not ( = ?auto_2443691 ?auto_2443698 ) ) ( not ( = ?auto_2443691 ?auto_2443699 ) ) ( not ( = ?auto_2443691 ?auto_2443700 ) ) ( not ( = ?auto_2443691 ?auto_2443701 ) ) ( not ( = ?auto_2443691 ?auto_2443702 ) ) ( not ( = ?auto_2443691 ?auto_2443703 ) ) ( not ( = ?auto_2443691 ?auto_2443704 ) ) ( not ( = ?auto_2443691 ?auto_2443708 ) ) ( not ( = ?auto_2443692 ?auto_2443693 ) ) ( not ( = ?auto_2443692 ?auto_2443694 ) ) ( not ( = ?auto_2443692 ?auto_2443695 ) ) ( not ( = ?auto_2443692 ?auto_2443696 ) ) ( not ( = ?auto_2443692 ?auto_2443697 ) ) ( not ( = ?auto_2443692 ?auto_2443698 ) ) ( not ( = ?auto_2443692 ?auto_2443699 ) ) ( not ( = ?auto_2443692 ?auto_2443700 ) ) ( not ( = ?auto_2443692 ?auto_2443701 ) ) ( not ( = ?auto_2443692 ?auto_2443702 ) ) ( not ( = ?auto_2443692 ?auto_2443703 ) ) ( not ( = ?auto_2443692 ?auto_2443704 ) ) ( not ( = ?auto_2443692 ?auto_2443708 ) ) ( not ( = ?auto_2443693 ?auto_2443694 ) ) ( not ( = ?auto_2443693 ?auto_2443695 ) ) ( not ( = ?auto_2443693 ?auto_2443696 ) ) ( not ( = ?auto_2443693 ?auto_2443697 ) ) ( not ( = ?auto_2443693 ?auto_2443698 ) ) ( not ( = ?auto_2443693 ?auto_2443699 ) ) ( not ( = ?auto_2443693 ?auto_2443700 ) ) ( not ( = ?auto_2443693 ?auto_2443701 ) ) ( not ( = ?auto_2443693 ?auto_2443702 ) ) ( not ( = ?auto_2443693 ?auto_2443703 ) ) ( not ( = ?auto_2443693 ?auto_2443704 ) ) ( not ( = ?auto_2443693 ?auto_2443708 ) ) ( not ( = ?auto_2443694 ?auto_2443695 ) ) ( not ( = ?auto_2443694 ?auto_2443696 ) ) ( not ( = ?auto_2443694 ?auto_2443697 ) ) ( not ( = ?auto_2443694 ?auto_2443698 ) ) ( not ( = ?auto_2443694 ?auto_2443699 ) ) ( not ( = ?auto_2443694 ?auto_2443700 ) ) ( not ( = ?auto_2443694 ?auto_2443701 ) ) ( not ( = ?auto_2443694 ?auto_2443702 ) ) ( not ( = ?auto_2443694 ?auto_2443703 ) ) ( not ( = ?auto_2443694 ?auto_2443704 ) ) ( not ( = ?auto_2443694 ?auto_2443708 ) ) ( not ( = ?auto_2443695 ?auto_2443696 ) ) ( not ( = ?auto_2443695 ?auto_2443697 ) ) ( not ( = ?auto_2443695 ?auto_2443698 ) ) ( not ( = ?auto_2443695 ?auto_2443699 ) ) ( not ( = ?auto_2443695 ?auto_2443700 ) ) ( not ( = ?auto_2443695 ?auto_2443701 ) ) ( not ( = ?auto_2443695 ?auto_2443702 ) ) ( not ( = ?auto_2443695 ?auto_2443703 ) ) ( not ( = ?auto_2443695 ?auto_2443704 ) ) ( not ( = ?auto_2443695 ?auto_2443708 ) ) ( not ( = ?auto_2443696 ?auto_2443697 ) ) ( not ( = ?auto_2443696 ?auto_2443698 ) ) ( not ( = ?auto_2443696 ?auto_2443699 ) ) ( not ( = ?auto_2443696 ?auto_2443700 ) ) ( not ( = ?auto_2443696 ?auto_2443701 ) ) ( not ( = ?auto_2443696 ?auto_2443702 ) ) ( not ( = ?auto_2443696 ?auto_2443703 ) ) ( not ( = ?auto_2443696 ?auto_2443704 ) ) ( not ( = ?auto_2443696 ?auto_2443708 ) ) ( not ( = ?auto_2443697 ?auto_2443698 ) ) ( not ( = ?auto_2443697 ?auto_2443699 ) ) ( not ( = ?auto_2443697 ?auto_2443700 ) ) ( not ( = ?auto_2443697 ?auto_2443701 ) ) ( not ( = ?auto_2443697 ?auto_2443702 ) ) ( not ( = ?auto_2443697 ?auto_2443703 ) ) ( not ( = ?auto_2443697 ?auto_2443704 ) ) ( not ( = ?auto_2443697 ?auto_2443708 ) ) ( not ( = ?auto_2443698 ?auto_2443699 ) ) ( not ( = ?auto_2443698 ?auto_2443700 ) ) ( not ( = ?auto_2443698 ?auto_2443701 ) ) ( not ( = ?auto_2443698 ?auto_2443702 ) ) ( not ( = ?auto_2443698 ?auto_2443703 ) ) ( not ( = ?auto_2443698 ?auto_2443704 ) ) ( not ( = ?auto_2443698 ?auto_2443708 ) ) ( not ( = ?auto_2443699 ?auto_2443700 ) ) ( not ( = ?auto_2443699 ?auto_2443701 ) ) ( not ( = ?auto_2443699 ?auto_2443702 ) ) ( not ( = ?auto_2443699 ?auto_2443703 ) ) ( not ( = ?auto_2443699 ?auto_2443704 ) ) ( not ( = ?auto_2443699 ?auto_2443708 ) ) ( not ( = ?auto_2443700 ?auto_2443701 ) ) ( not ( = ?auto_2443700 ?auto_2443702 ) ) ( not ( = ?auto_2443700 ?auto_2443703 ) ) ( not ( = ?auto_2443700 ?auto_2443704 ) ) ( not ( = ?auto_2443700 ?auto_2443708 ) ) ( not ( = ?auto_2443701 ?auto_2443702 ) ) ( not ( = ?auto_2443701 ?auto_2443703 ) ) ( not ( = ?auto_2443701 ?auto_2443704 ) ) ( not ( = ?auto_2443701 ?auto_2443708 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2443702 ?auto_2443703 ?auto_2443704 )
      ( MAKE-13CRATE-VERIFY ?auto_2443691 ?auto_2443692 ?auto_2443693 ?auto_2443694 ?auto_2443695 ?auto_2443696 ?auto_2443697 ?auto_2443698 ?auto_2443699 ?auto_2443700 ?auto_2443701 ?auto_2443702 ?auto_2443703 ?auto_2443704 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2443874 - SURFACE
      ?auto_2443875 - SURFACE
      ?auto_2443876 - SURFACE
      ?auto_2443877 - SURFACE
      ?auto_2443878 - SURFACE
      ?auto_2443879 - SURFACE
      ?auto_2443880 - SURFACE
      ?auto_2443881 - SURFACE
      ?auto_2443882 - SURFACE
      ?auto_2443883 - SURFACE
      ?auto_2443884 - SURFACE
      ?auto_2443885 - SURFACE
      ?auto_2443886 - SURFACE
      ?auto_2443887 - SURFACE
    )
    :vars
    (
      ?auto_2443888 - HOIST
      ?auto_2443890 - PLACE
      ?auto_2443893 - PLACE
      ?auto_2443891 - HOIST
      ?auto_2443889 - SURFACE
      ?auto_2443892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2443888 ?auto_2443890 ) ( IS-CRATE ?auto_2443887 ) ( not ( = ?auto_2443886 ?auto_2443887 ) ) ( not ( = ?auto_2443885 ?auto_2443886 ) ) ( not ( = ?auto_2443885 ?auto_2443887 ) ) ( not ( = ?auto_2443893 ?auto_2443890 ) ) ( HOIST-AT ?auto_2443891 ?auto_2443893 ) ( not ( = ?auto_2443888 ?auto_2443891 ) ) ( AVAILABLE ?auto_2443891 ) ( SURFACE-AT ?auto_2443887 ?auto_2443893 ) ( ON ?auto_2443887 ?auto_2443889 ) ( CLEAR ?auto_2443887 ) ( not ( = ?auto_2443886 ?auto_2443889 ) ) ( not ( = ?auto_2443887 ?auto_2443889 ) ) ( not ( = ?auto_2443885 ?auto_2443889 ) ) ( TRUCK-AT ?auto_2443892 ?auto_2443890 ) ( SURFACE-AT ?auto_2443885 ?auto_2443890 ) ( CLEAR ?auto_2443885 ) ( LIFTING ?auto_2443888 ?auto_2443886 ) ( IS-CRATE ?auto_2443886 ) ( ON ?auto_2443875 ?auto_2443874 ) ( ON ?auto_2443876 ?auto_2443875 ) ( ON ?auto_2443877 ?auto_2443876 ) ( ON ?auto_2443878 ?auto_2443877 ) ( ON ?auto_2443879 ?auto_2443878 ) ( ON ?auto_2443880 ?auto_2443879 ) ( ON ?auto_2443881 ?auto_2443880 ) ( ON ?auto_2443882 ?auto_2443881 ) ( ON ?auto_2443883 ?auto_2443882 ) ( ON ?auto_2443884 ?auto_2443883 ) ( ON ?auto_2443885 ?auto_2443884 ) ( not ( = ?auto_2443874 ?auto_2443875 ) ) ( not ( = ?auto_2443874 ?auto_2443876 ) ) ( not ( = ?auto_2443874 ?auto_2443877 ) ) ( not ( = ?auto_2443874 ?auto_2443878 ) ) ( not ( = ?auto_2443874 ?auto_2443879 ) ) ( not ( = ?auto_2443874 ?auto_2443880 ) ) ( not ( = ?auto_2443874 ?auto_2443881 ) ) ( not ( = ?auto_2443874 ?auto_2443882 ) ) ( not ( = ?auto_2443874 ?auto_2443883 ) ) ( not ( = ?auto_2443874 ?auto_2443884 ) ) ( not ( = ?auto_2443874 ?auto_2443885 ) ) ( not ( = ?auto_2443874 ?auto_2443886 ) ) ( not ( = ?auto_2443874 ?auto_2443887 ) ) ( not ( = ?auto_2443874 ?auto_2443889 ) ) ( not ( = ?auto_2443875 ?auto_2443876 ) ) ( not ( = ?auto_2443875 ?auto_2443877 ) ) ( not ( = ?auto_2443875 ?auto_2443878 ) ) ( not ( = ?auto_2443875 ?auto_2443879 ) ) ( not ( = ?auto_2443875 ?auto_2443880 ) ) ( not ( = ?auto_2443875 ?auto_2443881 ) ) ( not ( = ?auto_2443875 ?auto_2443882 ) ) ( not ( = ?auto_2443875 ?auto_2443883 ) ) ( not ( = ?auto_2443875 ?auto_2443884 ) ) ( not ( = ?auto_2443875 ?auto_2443885 ) ) ( not ( = ?auto_2443875 ?auto_2443886 ) ) ( not ( = ?auto_2443875 ?auto_2443887 ) ) ( not ( = ?auto_2443875 ?auto_2443889 ) ) ( not ( = ?auto_2443876 ?auto_2443877 ) ) ( not ( = ?auto_2443876 ?auto_2443878 ) ) ( not ( = ?auto_2443876 ?auto_2443879 ) ) ( not ( = ?auto_2443876 ?auto_2443880 ) ) ( not ( = ?auto_2443876 ?auto_2443881 ) ) ( not ( = ?auto_2443876 ?auto_2443882 ) ) ( not ( = ?auto_2443876 ?auto_2443883 ) ) ( not ( = ?auto_2443876 ?auto_2443884 ) ) ( not ( = ?auto_2443876 ?auto_2443885 ) ) ( not ( = ?auto_2443876 ?auto_2443886 ) ) ( not ( = ?auto_2443876 ?auto_2443887 ) ) ( not ( = ?auto_2443876 ?auto_2443889 ) ) ( not ( = ?auto_2443877 ?auto_2443878 ) ) ( not ( = ?auto_2443877 ?auto_2443879 ) ) ( not ( = ?auto_2443877 ?auto_2443880 ) ) ( not ( = ?auto_2443877 ?auto_2443881 ) ) ( not ( = ?auto_2443877 ?auto_2443882 ) ) ( not ( = ?auto_2443877 ?auto_2443883 ) ) ( not ( = ?auto_2443877 ?auto_2443884 ) ) ( not ( = ?auto_2443877 ?auto_2443885 ) ) ( not ( = ?auto_2443877 ?auto_2443886 ) ) ( not ( = ?auto_2443877 ?auto_2443887 ) ) ( not ( = ?auto_2443877 ?auto_2443889 ) ) ( not ( = ?auto_2443878 ?auto_2443879 ) ) ( not ( = ?auto_2443878 ?auto_2443880 ) ) ( not ( = ?auto_2443878 ?auto_2443881 ) ) ( not ( = ?auto_2443878 ?auto_2443882 ) ) ( not ( = ?auto_2443878 ?auto_2443883 ) ) ( not ( = ?auto_2443878 ?auto_2443884 ) ) ( not ( = ?auto_2443878 ?auto_2443885 ) ) ( not ( = ?auto_2443878 ?auto_2443886 ) ) ( not ( = ?auto_2443878 ?auto_2443887 ) ) ( not ( = ?auto_2443878 ?auto_2443889 ) ) ( not ( = ?auto_2443879 ?auto_2443880 ) ) ( not ( = ?auto_2443879 ?auto_2443881 ) ) ( not ( = ?auto_2443879 ?auto_2443882 ) ) ( not ( = ?auto_2443879 ?auto_2443883 ) ) ( not ( = ?auto_2443879 ?auto_2443884 ) ) ( not ( = ?auto_2443879 ?auto_2443885 ) ) ( not ( = ?auto_2443879 ?auto_2443886 ) ) ( not ( = ?auto_2443879 ?auto_2443887 ) ) ( not ( = ?auto_2443879 ?auto_2443889 ) ) ( not ( = ?auto_2443880 ?auto_2443881 ) ) ( not ( = ?auto_2443880 ?auto_2443882 ) ) ( not ( = ?auto_2443880 ?auto_2443883 ) ) ( not ( = ?auto_2443880 ?auto_2443884 ) ) ( not ( = ?auto_2443880 ?auto_2443885 ) ) ( not ( = ?auto_2443880 ?auto_2443886 ) ) ( not ( = ?auto_2443880 ?auto_2443887 ) ) ( not ( = ?auto_2443880 ?auto_2443889 ) ) ( not ( = ?auto_2443881 ?auto_2443882 ) ) ( not ( = ?auto_2443881 ?auto_2443883 ) ) ( not ( = ?auto_2443881 ?auto_2443884 ) ) ( not ( = ?auto_2443881 ?auto_2443885 ) ) ( not ( = ?auto_2443881 ?auto_2443886 ) ) ( not ( = ?auto_2443881 ?auto_2443887 ) ) ( not ( = ?auto_2443881 ?auto_2443889 ) ) ( not ( = ?auto_2443882 ?auto_2443883 ) ) ( not ( = ?auto_2443882 ?auto_2443884 ) ) ( not ( = ?auto_2443882 ?auto_2443885 ) ) ( not ( = ?auto_2443882 ?auto_2443886 ) ) ( not ( = ?auto_2443882 ?auto_2443887 ) ) ( not ( = ?auto_2443882 ?auto_2443889 ) ) ( not ( = ?auto_2443883 ?auto_2443884 ) ) ( not ( = ?auto_2443883 ?auto_2443885 ) ) ( not ( = ?auto_2443883 ?auto_2443886 ) ) ( not ( = ?auto_2443883 ?auto_2443887 ) ) ( not ( = ?auto_2443883 ?auto_2443889 ) ) ( not ( = ?auto_2443884 ?auto_2443885 ) ) ( not ( = ?auto_2443884 ?auto_2443886 ) ) ( not ( = ?auto_2443884 ?auto_2443887 ) ) ( not ( = ?auto_2443884 ?auto_2443889 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2443885 ?auto_2443886 ?auto_2443887 )
      ( MAKE-13CRATE-VERIFY ?auto_2443874 ?auto_2443875 ?auto_2443876 ?auto_2443877 ?auto_2443878 ?auto_2443879 ?auto_2443880 ?auto_2443881 ?auto_2443882 ?auto_2443883 ?auto_2443884 ?auto_2443885 ?auto_2443886 ?auto_2443887 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2444057 - SURFACE
      ?auto_2444058 - SURFACE
      ?auto_2444059 - SURFACE
      ?auto_2444060 - SURFACE
      ?auto_2444061 - SURFACE
      ?auto_2444062 - SURFACE
      ?auto_2444063 - SURFACE
      ?auto_2444064 - SURFACE
      ?auto_2444065 - SURFACE
      ?auto_2444066 - SURFACE
      ?auto_2444067 - SURFACE
      ?auto_2444068 - SURFACE
      ?auto_2444069 - SURFACE
      ?auto_2444070 - SURFACE
    )
    :vars
    (
      ?auto_2444076 - HOIST
      ?auto_2444074 - PLACE
      ?auto_2444072 - PLACE
      ?auto_2444071 - HOIST
      ?auto_2444073 - SURFACE
      ?auto_2444075 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2444076 ?auto_2444074 ) ( IS-CRATE ?auto_2444070 ) ( not ( = ?auto_2444069 ?auto_2444070 ) ) ( not ( = ?auto_2444068 ?auto_2444069 ) ) ( not ( = ?auto_2444068 ?auto_2444070 ) ) ( not ( = ?auto_2444072 ?auto_2444074 ) ) ( HOIST-AT ?auto_2444071 ?auto_2444072 ) ( not ( = ?auto_2444076 ?auto_2444071 ) ) ( AVAILABLE ?auto_2444071 ) ( SURFACE-AT ?auto_2444070 ?auto_2444072 ) ( ON ?auto_2444070 ?auto_2444073 ) ( CLEAR ?auto_2444070 ) ( not ( = ?auto_2444069 ?auto_2444073 ) ) ( not ( = ?auto_2444070 ?auto_2444073 ) ) ( not ( = ?auto_2444068 ?auto_2444073 ) ) ( TRUCK-AT ?auto_2444075 ?auto_2444074 ) ( SURFACE-AT ?auto_2444068 ?auto_2444074 ) ( CLEAR ?auto_2444068 ) ( IS-CRATE ?auto_2444069 ) ( AVAILABLE ?auto_2444076 ) ( IN ?auto_2444069 ?auto_2444075 ) ( ON ?auto_2444058 ?auto_2444057 ) ( ON ?auto_2444059 ?auto_2444058 ) ( ON ?auto_2444060 ?auto_2444059 ) ( ON ?auto_2444061 ?auto_2444060 ) ( ON ?auto_2444062 ?auto_2444061 ) ( ON ?auto_2444063 ?auto_2444062 ) ( ON ?auto_2444064 ?auto_2444063 ) ( ON ?auto_2444065 ?auto_2444064 ) ( ON ?auto_2444066 ?auto_2444065 ) ( ON ?auto_2444067 ?auto_2444066 ) ( ON ?auto_2444068 ?auto_2444067 ) ( not ( = ?auto_2444057 ?auto_2444058 ) ) ( not ( = ?auto_2444057 ?auto_2444059 ) ) ( not ( = ?auto_2444057 ?auto_2444060 ) ) ( not ( = ?auto_2444057 ?auto_2444061 ) ) ( not ( = ?auto_2444057 ?auto_2444062 ) ) ( not ( = ?auto_2444057 ?auto_2444063 ) ) ( not ( = ?auto_2444057 ?auto_2444064 ) ) ( not ( = ?auto_2444057 ?auto_2444065 ) ) ( not ( = ?auto_2444057 ?auto_2444066 ) ) ( not ( = ?auto_2444057 ?auto_2444067 ) ) ( not ( = ?auto_2444057 ?auto_2444068 ) ) ( not ( = ?auto_2444057 ?auto_2444069 ) ) ( not ( = ?auto_2444057 ?auto_2444070 ) ) ( not ( = ?auto_2444057 ?auto_2444073 ) ) ( not ( = ?auto_2444058 ?auto_2444059 ) ) ( not ( = ?auto_2444058 ?auto_2444060 ) ) ( not ( = ?auto_2444058 ?auto_2444061 ) ) ( not ( = ?auto_2444058 ?auto_2444062 ) ) ( not ( = ?auto_2444058 ?auto_2444063 ) ) ( not ( = ?auto_2444058 ?auto_2444064 ) ) ( not ( = ?auto_2444058 ?auto_2444065 ) ) ( not ( = ?auto_2444058 ?auto_2444066 ) ) ( not ( = ?auto_2444058 ?auto_2444067 ) ) ( not ( = ?auto_2444058 ?auto_2444068 ) ) ( not ( = ?auto_2444058 ?auto_2444069 ) ) ( not ( = ?auto_2444058 ?auto_2444070 ) ) ( not ( = ?auto_2444058 ?auto_2444073 ) ) ( not ( = ?auto_2444059 ?auto_2444060 ) ) ( not ( = ?auto_2444059 ?auto_2444061 ) ) ( not ( = ?auto_2444059 ?auto_2444062 ) ) ( not ( = ?auto_2444059 ?auto_2444063 ) ) ( not ( = ?auto_2444059 ?auto_2444064 ) ) ( not ( = ?auto_2444059 ?auto_2444065 ) ) ( not ( = ?auto_2444059 ?auto_2444066 ) ) ( not ( = ?auto_2444059 ?auto_2444067 ) ) ( not ( = ?auto_2444059 ?auto_2444068 ) ) ( not ( = ?auto_2444059 ?auto_2444069 ) ) ( not ( = ?auto_2444059 ?auto_2444070 ) ) ( not ( = ?auto_2444059 ?auto_2444073 ) ) ( not ( = ?auto_2444060 ?auto_2444061 ) ) ( not ( = ?auto_2444060 ?auto_2444062 ) ) ( not ( = ?auto_2444060 ?auto_2444063 ) ) ( not ( = ?auto_2444060 ?auto_2444064 ) ) ( not ( = ?auto_2444060 ?auto_2444065 ) ) ( not ( = ?auto_2444060 ?auto_2444066 ) ) ( not ( = ?auto_2444060 ?auto_2444067 ) ) ( not ( = ?auto_2444060 ?auto_2444068 ) ) ( not ( = ?auto_2444060 ?auto_2444069 ) ) ( not ( = ?auto_2444060 ?auto_2444070 ) ) ( not ( = ?auto_2444060 ?auto_2444073 ) ) ( not ( = ?auto_2444061 ?auto_2444062 ) ) ( not ( = ?auto_2444061 ?auto_2444063 ) ) ( not ( = ?auto_2444061 ?auto_2444064 ) ) ( not ( = ?auto_2444061 ?auto_2444065 ) ) ( not ( = ?auto_2444061 ?auto_2444066 ) ) ( not ( = ?auto_2444061 ?auto_2444067 ) ) ( not ( = ?auto_2444061 ?auto_2444068 ) ) ( not ( = ?auto_2444061 ?auto_2444069 ) ) ( not ( = ?auto_2444061 ?auto_2444070 ) ) ( not ( = ?auto_2444061 ?auto_2444073 ) ) ( not ( = ?auto_2444062 ?auto_2444063 ) ) ( not ( = ?auto_2444062 ?auto_2444064 ) ) ( not ( = ?auto_2444062 ?auto_2444065 ) ) ( not ( = ?auto_2444062 ?auto_2444066 ) ) ( not ( = ?auto_2444062 ?auto_2444067 ) ) ( not ( = ?auto_2444062 ?auto_2444068 ) ) ( not ( = ?auto_2444062 ?auto_2444069 ) ) ( not ( = ?auto_2444062 ?auto_2444070 ) ) ( not ( = ?auto_2444062 ?auto_2444073 ) ) ( not ( = ?auto_2444063 ?auto_2444064 ) ) ( not ( = ?auto_2444063 ?auto_2444065 ) ) ( not ( = ?auto_2444063 ?auto_2444066 ) ) ( not ( = ?auto_2444063 ?auto_2444067 ) ) ( not ( = ?auto_2444063 ?auto_2444068 ) ) ( not ( = ?auto_2444063 ?auto_2444069 ) ) ( not ( = ?auto_2444063 ?auto_2444070 ) ) ( not ( = ?auto_2444063 ?auto_2444073 ) ) ( not ( = ?auto_2444064 ?auto_2444065 ) ) ( not ( = ?auto_2444064 ?auto_2444066 ) ) ( not ( = ?auto_2444064 ?auto_2444067 ) ) ( not ( = ?auto_2444064 ?auto_2444068 ) ) ( not ( = ?auto_2444064 ?auto_2444069 ) ) ( not ( = ?auto_2444064 ?auto_2444070 ) ) ( not ( = ?auto_2444064 ?auto_2444073 ) ) ( not ( = ?auto_2444065 ?auto_2444066 ) ) ( not ( = ?auto_2444065 ?auto_2444067 ) ) ( not ( = ?auto_2444065 ?auto_2444068 ) ) ( not ( = ?auto_2444065 ?auto_2444069 ) ) ( not ( = ?auto_2444065 ?auto_2444070 ) ) ( not ( = ?auto_2444065 ?auto_2444073 ) ) ( not ( = ?auto_2444066 ?auto_2444067 ) ) ( not ( = ?auto_2444066 ?auto_2444068 ) ) ( not ( = ?auto_2444066 ?auto_2444069 ) ) ( not ( = ?auto_2444066 ?auto_2444070 ) ) ( not ( = ?auto_2444066 ?auto_2444073 ) ) ( not ( = ?auto_2444067 ?auto_2444068 ) ) ( not ( = ?auto_2444067 ?auto_2444069 ) ) ( not ( = ?auto_2444067 ?auto_2444070 ) ) ( not ( = ?auto_2444067 ?auto_2444073 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2444068 ?auto_2444069 ?auto_2444070 )
      ( MAKE-13CRATE-VERIFY ?auto_2444057 ?auto_2444058 ?auto_2444059 ?auto_2444060 ?auto_2444061 ?auto_2444062 ?auto_2444063 ?auto_2444064 ?auto_2444065 ?auto_2444066 ?auto_2444067 ?auto_2444068 ?auto_2444069 ?auto_2444070 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2458298 - SURFACE
      ?auto_2458299 - SURFACE
      ?auto_2458300 - SURFACE
      ?auto_2458301 - SURFACE
      ?auto_2458302 - SURFACE
      ?auto_2458303 - SURFACE
      ?auto_2458304 - SURFACE
      ?auto_2458305 - SURFACE
      ?auto_2458306 - SURFACE
      ?auto_2458307 - SURFACE
      ?auto_2458308 - SURFACE
      ?auto_2458309 - SURFACE
      ?auto_2458310 - SURFACE
      ?auto_2458311 - SURFACE
      ?auto_2458312 - SURFACE
    )
    :vars
    (
      ?auto_2458314 - HOIST
      ?auto_2458313 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2458314 ?auto_2458313 ) ( SURFACE-AT ?auto_2458311 ?auto_2458313 ) ( CLEAR ?auto_2458311 ) ( LIFTING ?auto_2458314 ?auto_2458312 ) ( IS-CRATE ?auto_2458312 ) ( not ( = ?auto_2458311 ?auto_2458312 ) ) ( ON ?auto_2458299 ?auto_2458298 ) ( ON ?auto_2458300 ?auto_2458299 ) ( ON ?auto_2458301 ?auto_2458300 ) ( ON ?auto_2458302 ?auto_2458301 ) ( ON ?auto_2458303 ?auto_2458302 ) ( ON ?auto_2458304 ?auto_2458303 ) ( ON ?auto_2458305 ?auto_2458304 ) ( ON ?auto_2458306 ?auto_2458305 ) ( ON ?auto_2458307 ?auto_2458306 ) ( ON ?auto_2458308 ?auto_2458307 ) ( ON ?auto_2458309 ?auto_2458308 ) ( ON ?auto_2458310 ?auto_2458309 ) ( ON ?auto_2458311 ?auto_2458310 ) ( not ( = ?auto_2458298 ?auto_2458299 ) ) ( not ( = ?auto_2458298 ?auto_2458300 ) ) ( not ( = ?auto_2458298 ?auto_2458301 ) ) ( not ( = ?auto_2458298 ?auto_2458302 ) ) ( not ( = ?auto_2458298 ?auto_2458303 ) ) ( not ( = ?auto_2458298 ?auto_2458304 ) ) ( not ( = ?auto_2458298 ?auto_2458305 ) ) ( not ( = ?auto_2458298 ?auto_2458306 ) ) ( not ( = ?auto_2458298 ?auto_2458307 ) ) ( not ( = ?auto_2458298 ?auto_2458308 ) ) ( not ( = ?auto_2458298 ?auto_2458309 ) ) ( not ( = ?auto_2458298 ?auto_2458310 ) ) ( not ( = ?auto_2458298 ?auto_2458311 ) ) ( not ( = ?auto_2458298 ?auto_2458312 ) ) ( not ( = ?auto_2458299 ?auto_2458300 ) ) ( not ( = ?auto_2458299 ?auto_2458301 ) ) ( not ( = ?auto_2458299 ?auto_2458302 ) ) ( not ( = ?auto_2458299 ?auto_2458303 ) ) ( not ( = ?auto_2458299 ?auto_2458304 ) ) ( not ( = ?auto_2458299 ?auto_2458305 ) ) ( not ( = ?auto_2458299 ?auto_2458306 ) ) ( not ( = ?auto_2458299 ?auto_2458307 ) ) ( not ( = ?auto_2458299 ?auto_2458308 ) ) ( not ( = ?auto_2458299 ?auto_2458309 ) ) ( not ( = ?auto_2458299 ?auto_2458310 ) ) ( not ( = ?auto_2458299 ?auto_2458311 ) ) ( not ( = ?auto_2458299 ?auto_2458312 ) ) ( not ( = ?auto_2458300 ?auto_2458301 ) ) ( not ( = ?auto_2458300 ?auto_2458302 ) ) ( not ( = ?auto_2458300 ?auto_2458303 ) ) ( not ( = ?auto_2458300 ?auto_2458304 ) ) ( not ( = ?auto_2458300 ?auto_2458305 ) ) ( not ( = ?auto_2458300 ?auto_2458306 ) ) ( not ( = ?auto_2458300 ?auto_2458307 ) ) ( not ( = ?auto_2458300 ?auto_2458308 ) ) ( not ( = ?auto_2458300 ?auto_2458309 ) ) ( not ( = ?auto_2458300 ?auto_2458310 ) ) ( not ( = ?auto_2458300 ?auto_2458311 ) ) ( not ( = ?auto_2458300 ?auto_2458312 ) ) ( not ( = ?auto_2458301 ?auto_2458302 ) ) ( not ( = ?auto_2458301 ?auto_2458303 ) ) ( not ( = ?auto_2458301 ?auto_2458304 ) ) ( not ( = ?auto_2458301 ?auto_2458305 ) ) ( not ( = ?auto_2458301 ?auto_2458306 ) ) ( not ( = ?auto_2458301 ?auto_2458307 ) ) ( not ( = ?auto_2458301 ?auto_2458308 ) ) ( not ( = ?auto_2458301 ?auto_2458309 ) ) ( not ( = ?auto_2458301 ?auto_2458310 ) ) ( not ( = ?auto_2458301 ?auto_2458311 ) ) ( not ( = ?auto_2458301 ?auto_2458312 ) ) ( not ( = ?auto_2458302 ?auto_2458303 ) ) ( not ( = ?auto_2458302 ?auto_2458304 ) ) ( not ( = ?auto_2458302 ?auto_2458305 ) ) ( not ( = ?auto_2458302 ?auto_2458306 ) ) ( not ( = ?auto_2458302 ?auto_2458307 ) ) ( not ( = ?auto_2458302 ?auto_2458308 ) ) ( not ( = ?auto_2458302 ?auto_2458309 ) ) ( not ( = ?auto_2458302 ?auto_2458310 ) ) ( not ( = ?auto_2458302 ?auto_2458311 ) ) ( not ( = ?auto_2458302 ?auto_2458312 ) ) ( not ( = ?auto_2458303 ?auto_2458304 ) ) ( not ( = ?auto_2458303 ?auto_2458305 ) ) ( not ( = ?auto_2458303 ?auto_2458306 ) ) ( not ( = ?auto_2458303 ?auto_2458307 ) ) ( not ( = ?auto_2458303 ?auto_2458308 ) ) ( not ( = ?auto_2458303 ?auto_2458309 ) ) ( not ( = ?auto_2458303 ?auto_2458310 ) ) ( not ( = ?auto_2458303 ?auto_2458311 ) ) ( not ( = ?auto_2458303 ?auto_2458312 ) ) ( not ( = ?auto_2458304 ?auto_2458305 ) ) ( not ( = ?auto_2458304 ?auto_2458306 ) ) ( not ( = ?auto_2458304 ?auto_2458307 ) ) ( not ( = ?auto_2458304 ?auto_2458308 ) ) ( not ( = ?auto_2458304 ?auto_2458309 ) ) ( not ( = ?auto_2458304 ?auto_2458310 ) ) ( not ( = ?auto_2458304 ?auto_2458311 ) ) ( not ( = ?auto_2458304 ?auto_2458312 ) ) ( not ( = ?auto_2458305 ?auto_2458306 ) ) ( not ( = ?auto_2458305 ?auto_2458307 ) ) ( not ( = ?auto_2458305 ?auto_2458308 ) ) ( not ( = ?auto_2458305 ?auto_2458309 ) ) ( not ( = ?auto_2458305 ?auto_2458310 ) ) ( not ( = ?auto_2458305 ?auto_2458311 ) ) ( not ( = ?auto_2458305 ?auto_2458312 ) ) ( not ( = ?auto_2458306 ?auto_2458307 ) ) ( not ( = ?auto_2458306 ?auto_2458308 ) ) ( not ( = ?auto_2458306 ?auto_2458309 ) ) ( not ( = ?auto_2458306 ?auto_2458310 ) ) ( not ( = ?auto_2458306 ?auto_2458311 ) ) ( not ( = ?auto_2458306 ?auto_2458312 ) ) ( not ( = ?auto_2458307 ?auto_2458308 ) ) ( not ( = ?auto_2458307 ?auto_2458309 ) ) ( not ( = ?auto_2458307 ?auto_2458310 ) ) ( not ( = ?auto_2458307 ?auto_2458311 ) ) ( not ( = ?auto_2458307 ?auto_2458312 ) ) ( not ( = ?auto_2458308 ?auto_2458309 ) ) ( not ( = ?auto_2458308 ?auto_2458310 ) ) ( not ( = ?auto_2458308 ?auto_2458311 ) ) ( not ( = ?auto_2458308 ?auto_2458312 ) ) ( not ( = ?auto_2458309 ?auto_2458310 ) ) ( not ( = ?auto_2458309 ?auto_2458311 ) ) ( not ( = ?auto_2458309 ?auto_2458312 ) ) ( not ( = ?auto_2458310 ?auto_2458311 ) ) ( not ( = ?auto_2458310 ?auto_2458312 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2458311 ?auto_2458312 )
      ( MAKE-14CRATE-VERIFY ?auto_2458298 ?auto_2458299 ?auto_2458300 ?auto_2458301 ?auto_2458302 ?auto_2458303 ?auto_2458304 ?auto_2458305 ?auto_2458306 ?auto_2458307 ?auto_2458308 ?auto_2458309 ?auto_2458310 ?auto_2458311 ?auto_2458312 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2458458 - SURFACE
      ?auto_2458459 - SURFACE
      ?auto_2458460 - SURFACE
      ?auto_2458461 - SURFACE
      ?auto_2458462 - SURFACE
      ?auto_2458463 - SURFACE
      ?auto_2458464 - SURFACE
      ?auto_2458465 - SURFACE
      ?auto_2458466 - SURFACE
      ?auto_2458467 - SURFACE
      ?auto_2458468 - SURFACE
      ?auto_2458469 - SURFACE
      ?auto_2458470 - SURFACE
      ?auto_2458471 - SURFACE
      ?auto_2458472 - SURFACE
    )
    :vars
    (
      ?auto_2458473 - HOIST
      ?auto_2458474 - PLACE
      ?auto_2458475 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2458473 ?auto_2458474 ) ( SURFACE-AT ?auto_2458471 ?auto_2458474 ) ( CLEAR ?auto_2458471 ) ( IS-CRATE ?auto_2458472 ) ( not ( = ?auto_2458471 ?auto_2458472 ) ) ( TRUCK-AT ?auto_2458475 ?auto_2458474 ) ( AVAILABLE ?auto_2458473 ) ( IN ?auto_2458472 ?auto_2458475 ) ( ON ?auto_2458471 ?auto_2458470 ) ( not ( = ?auto_2458470 ?auto_2458471 ) ) ( not ( = ?auto_2458470 ?auto_2458472 ) ) ( ON ?auto_2458459 ?auto_2458458 ) ( ON ?auto_2458460 ?auto_2458459 ) ( ON ?auto_2458461 ?auto_2458460 ) ( ON ?auto_2458462 ?auto_2458461 ) ( ON ?auto_2458463 ?auto_2458462 ) ( ON ?auto_2458464 ?auto_2458463 ) ( ON ?auto_2458465 ?auto_2458464 ) ( ON ?auto_2458466 ?auto_2458465 ) ( ON ?auto_2458467 ?auto_2458466 ) ( ON ?auto_2458468 ?auto_2458467 ) ( ON ?auto_2458469 ?auto_2458468 ) ( ON ?auto_2458470 ?auto_2458469 ) ( not ( = ?auto_2458458 ?auto_2458459 ) ) ( not ( = ?auto_2458458 ?auto_2458460 ) ) ( not ( = ?auto_2458458 ?auto_2458461 ) ) ( not ( = ?auto_2458458 ?auto_2458462 ) ) ( not ( = ?auto_2458458 ?auto_2458463 ) ) ( not ( = ?auto_2458458 ?auto_2458464 ) ) ( not ( = ?auto_2458458 ?auto_2458465 ) ) ( not ( = ?auto_2458458 ?auto_2458466 ) ) ( not ( = ?auto_2458458 ?auto_2458467 ) ) ( not ( = ?auto_2458458 ?auto_2458468 ) ) ( not ( = ?auto_2458458 ?auto_2458469 ) ) ( not ( = ?auto_2458458 ?auto_2458470 ) ) ( not ( = ?auto_2458458 ?auto_2458471 ) ) ( not ( = ?auto_2458458 ?auto_2458472 ) ) ( not ( = ?auto_2458459 ?auto_2458460 ) ) ( not ( = ?auto_2458459 ?auto_2458461 ) ) ( not ( = ?auto_2458459 ?auto_2458462 ) ) ( not ( = ?auto_2458459 ?auto_2458463 ) ) ( not ( = ?auto_2458459 ?auto_2458464 ) ) ( not ( = ?auto_2458459 ?auto_2458465 ) ) ( not ( = ?auto_2458459 ?auto_2458466 ) ) ( not ( = ?auto_2458459 ?auto_2458467 ) ) ( not ( = ?auto_2458459 ?auto_2458468 ) ) ( not ( = ?auto_2458459 ?auto_2458469 ) ) ( not ( = ?auto_2458459 ?auto_2458470 ) ) ( not ( = ?auto_2458459 ?auto_2458471 ) ) ( not ( = ?auto_2458459 ?auto_2458472 ) ) ( not ( = ?auto_2458460 ?auto_2458461 ) ) ( not ( = ?auto_2458460 ?auto_2458462 ) ) ( not ( = ?auto_2458460 ?auto_2458463 ) ) ( not ( = ?auto_2458460 ?auto_2458464 ) ) ( not ( = ?auto_2458460 ?auto_2458465 ) ) ( not ( = ?auto_2458460 ?auto_2458466 ) ) ( not ( = ?auto_2458460 ?auto_2458467 ) ) ( not ( = ?auto_2458460 ?auto_2458468 ) ) ( not ( = ?auto_2458460 ?auto_2458469 ) ) ( not ( = ?auto_2458460 ?auto_2458470 ) ) ( not ( = ?auto_2458460 ?auto_2458471 ) ) ( not ( = ?auto_2458460 ?auto_2458472 ) ) ( not ( = ?auto_2458461 ?auto_2458462 ) ) ( not ( = ?auto_2458461 ?auto_2458463 ) ) ( not ( = ?auto_2458461 ?auto_2458464 ) ) ( not ( = ?auto_2458461 ?auto_2458465 ) ) ( not ( = ?auto_2458461 ?auto_2458466 ) ) ( not ( = ?auto_2458461 ?auto_2458467 ) ) ( not ( = ?auto_2458461 ?auto_2458468 ) ) ( not ( = ?auto_2458461 ?auto_2458469 ) ) ( not ( = ?auto_2458461 ?auto_2458470 ) ) ( not ( = ?auto_2458461 ?auto_2458471 ) ) ( not ( = ?auto_2458461 ?auto_2458472 ) ) ( not ( = ?auto_2458462 ?auto_2458463 ) ) ( not ( = ?auto_2458462 ?auto_2458464 ) ) ( not ( = ?auto_2458462 ?auto_2458465 ) ) ( not ( = ?auto_2458462 ?auto_2458466 ) ) ( not ( = ?auto_2458462 ?auto_2458467 ) ) ( not ( = ?auto_2458462 ?auto_2458468 ) ) ( not ( = ?auto_2458462 ?auto_2458469 ) ) ( not ( = ?auto_2458462 ?auto_2458470 ) ) ( not ( = ?auto_2458462 ?auto_2458471 ) ) ( not ( = ?auto_2458462 ?auto_2458472 ) ) ( not ( = ?auto_2458463 ?auto_2458464 ) ) ( not ( = ?auto_2458463 ?auto_2458465 ) ) ( not ( = ?auto_2458463 ?auto_2458466 ) ) ( not ( = ?auto_2458463 ?auto_2458467 ) ) ( not ( = ?auto_2458463 ?auto_2458468 ) ) ( not ( = ?auto_2458463 ?auto_2458469 ) ) ( not ( = ?auto_2458463 ?auto_2458470 ) ) ( not ( = ?auto_2458463 ?auto_2458471 ) ) ( not ( = ?auto_2458463 ?auto_2458472 ) ) ( not ( = ?auto_2458464 ?auto_2458465 ) ) ( not ( = ?auto_2458464 ?auto_2458466 ) ) ( not ( = ?auto_2458464 ?auto_2458467 ) ) ( not ( = ?auto_2458464 ?auto_2458468 ) ) ( not ( = ?auto_2458464 ?auto_2458469 ) ) ( not ( = ?auto_2458464 ?auto_2458470 ) ) ( not ( = ?auto_2458464 ?auto_2458471 ) ) ( not ( = ?auto_2458464 ?auto_2458472 ) ) ( not ( = ?auto_2458465 ?auto_2458466 ) ) ( not ( = ?auto_2458465 ?auto_2458467 ) ) ( not ( = ?auto_2458465 ?auto_2458468 ) ) ( not ( = ?auto_2458465 ?auto_2458469 ) ) ( not ( = ?auto_2458465 ?auto_2458470 ) ) ( not ( = ?auto_2458465 ?auto_2458471 ) ) ( not ( = ?auto_2458465 ?auto_2458472 ) ) ( not ( = ?auto_2458466 ?auto_2458467 ) ) ( not ( = ?auto_2458466 ?auto_2458468 ) ) ( not ( = ?auto_2458466 ?auto_2458469 ) ) ( not ( = ?auto_2458466 ?auto_2458470 ) ) ( not ( = ?auto_2458466 ?auto_2458471 ) ) ( not ( = ?auto_2458466 ?auto_2458472 ) ) ( not ( = ?auto_2458467 ?auto_2458468 ) ) ( not ( = ?auto_2458467 ?auto_2458469 ) ) ( not ( = ?auto_2458467 ?auto_2458470 ) ) ( not ( = ?auto_2458467 ?auto_2458471 ) ) ( not ( = ?auto_2458467 ?auto_2458472 ) ) ( not ( = ?auto_2458468 ?auto_2458469 ) ) ( not ( = ?auto_2458468 ?auto_2458470 ) ) ( not ( = ?auto_2458468 ?auto_2458471 ) ) ( not ( = ?auto_2458468 ?auto_2458472 ) ) ( not ( = ?auto_2458469 ?auto_2458470 ) ) ( not ( = ?auto_2458469 ?auto_2458471 ) ) ( not ( = ?auto_2458469 ?auto_2458472 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2458470 ?auto_2458471 ?auto_2458472 )
      ( MAKE-14CRATE-VERIFY ?auto_2458458 ?auto_2458459 ?auto_2458460 ?auto_2458461 ?auto_2458462 ?auto_2458463 ?auto_2458464 ?auto_2458465 ?auto_2458466 ?auto_2458467 ?auto_2458468 ?auto_2458469 ?auto_2458470 ?auto_2458471 ?auto_2458472 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2458633 - SURFACE
      ?auto_2458634 - SURFACE
      ?auto_2458635 - SURFACE
      ?auto_2458636 - SURFACE
      ?auto_2458637 - SURFACE
      ?auto_2458638 - SURFACE
      ?auto_2458639 - SURFACE
      ?auto_2458640 - SURFACE
      ?auto_2458641 - SURFACE
      ?auto_2458642 - SURFACE
      ?auto_2458643 - SURFACE
      ?auto_2458644 - SURFACE
      ?auto_2458645 - SURFACE
      ?auto_2458646 - SURFACE
      ?auto_2458647 - SURFACE
    )
    :vars
    (
      ?auto_2458650 - HOIST
      ?auto_2458651 - PLACE
      ?auto_2458649 - TRUCK
      ?auto_2458648 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2458650 ?auto_2458651 ) ( SURFACE-AT ?auto_2458646 ?auto_2458651 ) ( CLEAR ?auto_2458646 ) ( IS-CRATE ?auto_2458647 ) ( not ( = ?auto_2458646 ?auto_2458647 ) ) ( AVAILABLE ?auto_2458650 ) ( IN ?auto_2458647 ?auto_2458649 ) ( ON ?auto_2458646 ?auto_2458645 ) ( not ( = ?auto_2458645 ?auto_2458646 ) ) ( not ( = ?auto_2458645 ?auto_2458647 ) ) ( TRUCK-AT ?auto_2458649 ?auto_2458648 ) ( not ( = ?auto_2458648 ?auto_2458651 ) ) ( ON ?auto_2458634 ?auto_2458633 ) ( ON ?auto_2458635 ?auto_2458634 ) ( ON ?auto_2458636 ?auto_2458635 ) ( ON ?auto_2458637 ?auto_2458636 ) ( ON ?auto_2458638 ?auto_2458637 ) ( ON ?auto_2458639 ?auto_2458638 ) ( ON ?auto_2458640 ?auto_2458639 ) ( ON ?auto_2458641 ?auto_2458640 ) ( ON ?auto_2458642 ?auto_2458641 ) ( ON ?auto_2458643 ?auto_2458642 ) ( ON ?auto_2458644 ?auto_2458643 ) ( ON ?auto_2458645 ?auto_2458644 ) ( not ( = ?auto_2458633 ?auto_2458634 ) ) ( not ( = ?auto_2458633 ?auto_2458635 ) ) ( not ( = ?auto_2458633 ?auto_2458636 ) ) ( not ( = ?auto_2458633 ?auto_2458637 ) ) ( not ( = ?auto_2458633 ?auto_2458638 ) ) ( not ( = ?auto_2458633 ?auto_2458639 ) ) ( not ( = ?auto_2458633 ?auto_2458640 ) ) ( not ( = ?auto_2458633 ?auto_2458641 ) ) ( not ( = ?auto_2458633 ?auto_2458642 ) ) ( not ( = ?auto_2458633 ?auto_2458643 ) ) ( not ( = ?auto_2458633 ?auto_2458644 ) ) ( not ( = ?auto_2458633 ?auto_2458645 ) ) ( not ( = ?auto_2458633 ?auto_2458646 ) ) ( not ( = ?auto_2458633 ?auto_2458647 ) ) ( not ( = ?auto_2458634 ?auto_2458635 ) ) ( not ( = ?auto_2458634 ?auto_2458636 ) ) ( not ( = ?auto_2458634 ?auto_2458637 ) ) ( not ( = ?auto_2458634 ?auto_2458638 ) ) ( not ( = ?auto_2458634 ?auto_2458639 ) ) ( not ( = ?auto_2458634 ?auto_2458640 ) ) ( not ( = ?auto_2458634 ?auto_2458641 ) ) ( not ( = ?auto_2458634 ?auto_2458642 ) ) ( not ( = ?auto_2458634 ?auto_2458643 ) ) ( not ( = ?auto_2458634 ?auto_2458644 ) ) ( not ( = ?auto_2458634 ?auto_2458645 ) ) ( not ( = ?auto_2458634 ?auto_2458646 ) ) ( not ( = ?auto_2458634 ?auto_2458647 ) ) ( not ( = ?auto_2458635 ?auto_2458636 ) ) ( not ( = ?auto_2458635 ?auto_2458637 ) ) ( not ( = ?auto_2458635 ?auto_2458638 ) ) ( not ( = ?auto_2458635 ?auto_2458639 ) ) ( not ( = ?auto_2458635 ?auto_2458640 ) ) ( not ( = ?auto_2458635 ?auto_2458641 ) ) ( not ( = ?auto_2458635 ?auto_2458642 ) ) ( not ( = ?auto_2458635 ?auto_2458643 ) ) ( not ( = ?auto_2458635 ?auto_2458644 ) ) ( not ( = ?auto_2458635 ?auto_2458645 ) ) ( not ( = ?auto_2458635 ?auto_2458646 ) ) ( not ( = ?auto_2458635 ?auto_2458647 ) ) ( not ( = ?auto_2458636 ?auto_2458637 ) ) ( not ( = ?auto_2458636 ?auto_2458638 ) ) ( not ( = ?auto_2458636 ?auto_2458639 ) ) ( not ( = ?auto_2458636 ?auto_2458640 ) ) ( not ( = ?auto_2458636 ?auto_2458641 ) ) ( not ( = ?auto_2458636 ?auto_2458642 ) ) ( not ( = ?auto_2458636 ?auto_2458643 ) ) ( not ( = ?auto_2458636 ?auto_2458644 ) ) ( not ( = ?auto_2458636 ?auto_2458645 ) ) ( not ( = ?auto_2458636 ?auto_2458646 ) ) ( not ( = ?auto_2458636 ?auto_2458647 ) ) ( not ( = ?auto_2458637 ?auto_2458638 ) ) ( not ( = ?auto_2458637 ?auto_2458639 ) ) ( not ( = ?auto_2458637 ?auto_2458640 ) ) ( not ( = ?auto_2458637 ?auto_2458641 ) ) ( not ( = ?auto_2458637 ?auto_2458642 ) ) ( not ( = ?auto_2458637 ?auto_2458643 ) ) ( not ( = ?auto_2458637 ?auto_2458644 ) ) ( not ( = ?auto_2458637 ?auto_2458645 ) ) ( not ( = ?auto_2458637 ?auto_2458646 ) ) ( not ( = ?auto_2458637 ?auto_2458647 ) ) ( not ( = ?auto_2458638 ?auto_2458639 ) ) ( not ( = ?auto_2458638 ?auto_2458640 ) ) ( not ( = ?auto_2458638 ?auto_2458641 ) ) ( not ( = ?auto_2458638 ?auto_2458642 ) ) ( not ( = ?auto_2458638 ?auto_2458643 ) ) ( not ( = ?auto_2458638 ?auto_2458644 ) ) ( not ( = ?auto_2458638 ?auto_2458645 ) ) ( not ( = ?auto_2458638 ?auto_2458646 ) ) ( not ( = ?auto_2458638 ?auto_2458647 ) ) ( not ( = ?auto_2458639 ?auto_2458640 ) ) ( not ( = ?auto_2458639 ?auto_2458641 ) ) ( not ( = ?auto_2458639 ?auto_2458642 ) ) ( not ( = ?auto_2458639 ?auto_2458643 ) ) ( not ( = ?auto_2458639 ?auto_2458644 ) ) ( not ( = ?auto_2458639 ?auto_2458645 ) ) ( not ( = ?auto_2458639 ?auto_2458646 ) ) ( not ( = ?auto_2458639 ?auto_2458647 ) ) ( not ( = ?auto_2458640 ?auto_2458641 ) ) ( not ( = ?auto_2458640 ?auto_2458642 ) ) ( not ( = ?auto_2458640 ?auto_2458643 ) ) ( not ( = ?auto_2458640 ?auto_2458644 ) ) ( not ( = ?auto_2458640 ?auto_2458645 ) ) ( not ( = ?auto_2458640 ?auto_2458646 ) ) ( not ( = ?auto_2458640 ?auto_2458647 ) ) ( not ( = ?auto_2458641 ?auto_2458642 ) ) ( not ( = ?auto_2458641 ?auto_2458643 ) ) ( not ( = ?auto_2458641 ?auto_2458644 ) ) ( not ( = ?auto_2458641 ?auto_2458645 ) ) ( not ( = ?auto_2458641 ?auto_2458646 ) ) ( not ( = ?auto_2458641 ?auto_2458647 ) ) ( not ( = ?auto_2458642 ?auto_2458643 ) ) ( not ( = ?auto_2458642 ?auto_2458644 ) ) ( not ( = ?auto_2458642 ?auto_2458645 ) ) ( not ( = ?auto_2458642 ?auto_2458646 ) ) ( not ( = ?auto_2458642 ?auto_2458647 ) ) ( not ( = ?auto_2458643 ?auto_2458644 ) ) ( not ( = ?auto_2458643 ?auto_2458645 ) ) ( not ( = ?auto_2458643 ?auto_2458646 ) ) ( not ( = ?auto_2458643 ?auto_2458647 ) ) ( not ( = ?auto_2458644 ?auto_2458645 ) ) ( not ( = ?auto_2458644 ?auto_2458646 ) ) ( not ( = ?auto_2458644 ?auto_2458647 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2458645 ?auto_2458646 ?auto_2458647 )
      ( MAKE-14CRATE-VERIFY ?auto_2458633 ?auto_2458634 ?auto_2458635 ?auto_2458636 ?auto_2458637 ?auto_2458638 ?auto_2458639 ?auto_2458640 ?auto_2458641 ?auto_2458642 ?auto_2458643 ?auto_2458644 ?auto_2458645 ?auto_2458646 ?auto_2458647 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2458822 - SURFACE
      ?auto_2458823 - SURFACE
      ?auto_2458824 - SURFACE
      ?auto_2458825 - SURFACE
      ?auto_2458826 - SURFACE
      ?auto_2458827 - SURFACE
      ?auto_2458828 - SURFACE
      ?auto_2458829 - SURFACE
      ?auto_2458830 - SURFACE
      ?auto_2458831 - SURFACE
      ?auto_2458832 - SURFACE
      ?auto_2458833 - SURFACE
      ?auto_2458834 - SURFACE
      ?auto_2458835 - SURFACE
      ?auto_2458836 - SURFACE
    )
    :vars
    (
      ?auto_2458840 - HOIST
      ?auto_2458837 - PLACE
      ?auto_2458838 - TRUCK
      ?auto_2458839 - PLACE
      ?auto_2458841 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2458840 ?auto_2458837 ) ( SURFACE-AT ?auto_2458835 ?auto_2458837 ) ( CLEAR ?auto_2458835 ) ( IS-CRATE ?auto_2458836 ) ( not ( = ?auto_2458835 ?auto_2458836 ) ) ( AVAILABLE ?auto_2458840 ) ( ON ?auto_2458835 ?auto_2458834 ) ( not ( = ?auto_2458834 ?auto_2458835 ) ) ( not ( = ?auto_2458834 ?auto_2458836 ) ) ( TRUCK-AT ?auto_2458838 ?auto_2458839 ) ( not ( = ?auto_2458839 ?auto_2458837 ) ) ( HOIST-AT ?auto_2458841 ?auto_2458839 ) ( LIFTING ?auto_2458841 ?auto_2458836 ) ( not ( = ?auto_2458840 ?auto_2458841 ) ) ( ON ?auto_2458823 ?auto_2458822 ) ( ON ?auto_2458824 ?auto_2458823 ) ( ON ?auto_2458825 ?auto_2458824 ) ( ON ?auto_2458826 ?auto_2458825 ) ( ON ?auto_2458827 ?auto_2458826 ) ( ON ?auto_2458828 ?auto_2458827 ) ( ON ?auto_2458829 ?auto_2458828 ) ( ON ?auto_2458830 ?auto_2458829 ) ( ON ?auto_2458831 ?auto_2458830 ) ( ON ?auto_2458832 ?auto_2458831 ) ( ON ?auto_2458833 ?auto_2458832 ) ( ON ?auto_2458834 ?auto_2458833 ) ( not ( = ?auto_2458822 ?auto_2458823 ) ) ( not ( = ?auto_2458822 ?auto_2458824 ) ) ( not ( = ?auto_2458822 ?auto_2458825 ) ) ( not ( = ?auto_2458822 ?auto_2458826 ) ) ( not ( = ?auto_2458822 ?auto_2458827 ) ) ( not ( = ?auto_2458822 ?auto_2458828 ) ) ( not ( = ?auto_2458822 ?auto_2458829 ) ) ( not ( = ?auto_2458822 ?auto_2458830 ) ) ( not ( = ?auto_2458822 ?auto_2458831 ) ) ( not ( = ?auto_2458822 ?auto_2458832 ) ) ( not ( = ?auto_2458822 ?auto_2458833 ) ) ( not ( = ?auto_2458822 ?auto_2458834 ) ) ( not ( = ?auto_2458822 ?auto_2458835 ) ) ( not ( = ?auto_2458822 ?auto_2458836 ) ) ( not ( = ?auto_2458823 ?auto_2458824 ) ) ( not ( = ?auto_2458823 ?auto_2458825 ) ) ( not ( = ?auto_2458823 ?auto_2458826 ) ) ( not ( = ?auto_2458823 ?auto_2458827 ) ) ( not ( = ?auto_2458823 ?auto_2458828 ) ) ( not ( = ?auto_2458823 ?auto_2458829 ) ) ( not ( = ?auto_2458823 ?auto_2458830 ) ) ( not ( = ?auto_2458823 ?auto_2458831 ) ) ( not ( = ?auto_2458823 ?auto_2458832 ) ) ( not ( = ?auto_2458823 ?auto_2458833 ) ) ( not ( = ?auto_2458823 ?auto_2458834 ) ) ( not ( = ?auto_2458823 ?auto_2458835 ) ) ( not ( = ?auto_2458823 ?auto_2458836 ) ) ( not ( = ?auto_2458824 ?auto_2458825 ) ) ( not ( = ?auto_2458824 ?auto_2458826 ) ) ( not ( = ?auto_2458824 ?auto_2458827 ) ) ( not ( = ?auto_2458824 ?auto_2458828 ) ) ( not ( = ?auto_2458824 ?auto_2458829 ) ) ( not ( = ?auto_2458824 ?auto_2458830 ) ) ( not ( = ?auto_2458824 ?auto_2458831 ) ) ( not ( = ?auto_2458824 ?auto_2458832 ) ) ( not ( = ?auto_2458824 ?auto_2458833 ) ) ( not ( = ?auto_2458824 ?auto_2458834 ) ) ( not ( = ?auto_2458824 ?auto_2458835 ) ) ( not ( = ?auto_2458824 ?auto_2458836 ) ) ( not ( = ?auto_2458825 ?auto_2458826 ) ) ( not ( = ?auto_2458825 ?auto_2458827 ) ) ( not ( = ?auto_2458825 ?auto_2458828 ) ) ( not ( = ?auto_2458825 ?auto_2458829 ) ) ( not ( = ?auto_2458825 ?auto_2458830 ) ) ( not ( = ?auto_2458825 ?auto_2458831 ) ) ( not ( = ?auto_2458825 ?auto_2458832 ) ) ( not ( = ?auto_2458825 ?auto_2458833 ) ) ( not ( = ?auto_2458825 ?auto_2458834 ) ) ( not ( = ?auto_2458825 ?auto_2458835 ) ) ( not ( = ?auto_2458825 ?auto_2458836 ) ) ( not ( = ?auto_2458826 ?auto_2458827 ) ) ( not ( = ?auto_2458826 ?auto_2458828 ) ) ( not ( = ?auto_2458826 ?auto_2458829 ) ) ( not ( = ?auto_2458826 ?auto_2458830 ) ) ( not ( = ?auto_2458826 ?auto_2458831 ) ) ( not ( = ?auto_2458826 ?auto_2458832 ) ) ( not ( = ?auto_2458826 ?auto_2458833 ) ) ( not ( = ?auto_2458826 ?auto_2458834 ) ) ( not ( = ?auto_2458826 ?auto_2458835 ) ) ( not ( = ?auto_2458826 ?auto_2458836 ) ) ( not ( = ?auto_2458827 ?auto_2458828 ) ) ( not ( = ?auto_2458827 ?auto_2458829 ) ) ( not ( = ?auto_2458827 ?auto_2458830 ) ) ( not ( = ?auto_2458827 ?auto_2458831 ) ) ( not ( = ?auto_2458827 ?auto_2458832 ) ) ( not ( = ?auto_2458827 ?auto_2458833 ) ) ( not ( = ?auto_2458827 ?auto_2458834 ) ) ( not ( = ?auto_2458827 ?auto_2458835 ) ) ( not ( = ?auto_2458827 ?auto_2458836 ) ) ( not ( = ?auto_2458828 ?auto_2458829 ) ) ( not ( = ?auto_2458828 ?auto_2458830 ) ) ( not ( = ?auto_2458828 ?auto_2458831 ) ) ( not ( = ?auto_2458828 ?auto_2458832 ) ) ( not ( = ?auto_2458828 ?auto_2458833 ) ) ( not ( = ?auto_2458828 ?auto_2458834 ) ) ( not ( = ?auto_2458828 ?auto_2458835 ) ) ( not ( = ?auto_2458828 ?auto_2458836 ) ) ( not ( = ?auto_2458829 ?auto_2458830 ) ) ( not ( = ?auto_2458829 ?auto_2458831 ) ) ( not ( = ?auto_2458829 ?auto_2458832 ) ) ( not ( = ?auto_2458829 ?auto_2458833 ) ) ( not ( = ?auto_2458829 ?auto_2458834 ) ) ( not ( = ?auto_2458829 ?auto_2458835 ) ) ( not ( = ?auto_2458829 ?auto_2458836 ) ) ( not ( = ?auto_2458830 ?auto_2458831 ) ) ( not ( = ?auto_2458830 ?auto_2458832 ) ) ( not ( = ?auto_2458830 ?auto_2458833 ) ) ( not ( = ?auto_2458830 ?auto_2458834 ) ) ( not ( = ?auto_2458830 ?auto_2458835 ) ) ( not ( = ?auto_2458830 ?auto_2458836 ) ) ( not ( = ?auto_2458831 ?auto_2458832 ) ) ( not ( = ?auto_2458831 ?auto_2458833 ) ) ( not ( = ?auto_2458831 ?auto_2458834 ) ) ( not ( = ?auto_2458831 ?auto_2458835 ) ) ( not ( = ?auto_2458831 ?auto_2458836 ) ) ( not ( = ?auto_2458832 ?auto_2458833 ) ) ( not ( = ?auto_2458832 ?auto_2458834 ) ) ( not ( = ?auto_2458832 ?auto_2458835 ) ) ( not ( = ?auto_2458832 ?auto_2458836 ) ) ( not ( = ?auto_2458833 ?auto_2458834 ) ) ( not ( = ?auto_2458833 ?auto_2458835 ) ) ( not ( = ?auto_2458833 ?auto_2458836 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2458834 ?auto_2458835 ?auto_2458836 )
      ( MAKE-14CRATE-VERIFY ?auto_2458822 ?auto_2458823 ?auto_2458824 ?auto_2458825 ?auto_2458826 ?auto_2458827 ?auto_2458828 ?auto_2458829 ?auto_2458830 ?auto_2458831 ?auto_2458832 ?auto_2458833 ?auto_2458834 ?auto_2458835 ?auto_2458836 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2459025 - SURFACE
      ?auto_2459026 - SURFACE
      ?auto_2459027 - SURFACE
      ?auto_2459028 - SURFACE
      ?auto_2459029 - SURFACE
      ?auto_2459030 - SURFACE
      ?auto_2459031 - SURFACE
      ?auto_2459032 - SURFACE
      ?auto_2459033 - SURFACE
      ?auto_2459034 - SURFACE
      ?auto_2459035 - SURFACE
      ?auto_2459036 - SURFACE
      ?auto_2459037 - SURFACE
      ?auto_2459038 - SURFACE
      ?auto_2459039 - SURFACE
    )
    :vars
    (
      ?auto_2459045 - HOIST
      ?auto_2459044 - PLACE
      ?auto_2459041 - TRUCK
      ?auto_2459040 - PLACE
      ?auto_2459043 - HOIST
      ?auto_2459042 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2459045 ?auto_2459044 ) ( SURFACE-AT ?auto_2459038 ?auto_2459044 ) ( CLEAR ?auto_2459038 ) ( IS-CRATE ?auto_2459039 ) ( not ( = ?auto_2459038 ?auto_2459039 ) ) ( AVAILABLE ?auto_2459045 ) ( ON ?auto_2459038 ?auto_2459037 ) ( not ( = ?auto_2459037 ?auto_2459038 ) ) ( not ( = ?auto_2459037 ?auto_2459039 ) ) ( TRUCK-AT ?auto_2459041 ?auto_2459040 ) ( not ( = ?auto_2459040 ?auto_2459044 ) ) ( HOIST-AT ?auto_2459043 ?auto_2459040 ) ( not ( = ?auto_2459045 ?auto_2459043 ) ) ( AVAILABLE ?auto_2459043 ) ( SURFACE-AT ?auto_2459039 ?auto_2459040 ) ( ON ?auto_2459039 ?auto_2459042 ) ( CLEAR ?auto_2459039 ) ( not ( = ?auto_2459038 ?auto_2459042 ) ) ( not ( = ?auto_2459039 ?auto_2459042 ) ) ( not ( = ?auto_2459037 ?auto_2459042 ) ) ( ON ?auto_2459026 ?auto_2459025 ) ( ON ?auto_2459027 ?auto_2459026 ) ( ON ?auto_2459028 ?auto_2459027 ) ( ON ?auto_2459029 ?auto_2459028 ) ( ON ?auto_2459030 ?auto_2459029 ) ( ON ?auto_2459031 ?auto_2459030 ) ( ON ?auto_2459032 ?auto_2459031 ) ( ON ?auto_2459033 ?auto_2459032 ) ( ON ?auto_2459034 ?auto_2459033 ) ( ON ?auto_2459035 ?auto_2459034 ) ( ON ?auto_2459036 ?auto_2459035 ) ( ON ?auto_2459037 ?auto_2459036 ) ( not ( = ?auto_2459025 ?auto_2459026 ) ) ( not ( = ?auto_2459025 ?auto_2459027 ) ) ( not ( = ?auto_2459025 ?auto_2459028 ) ) ( not ( = ?auto_2459025 ?auto_2459029 ) ) ( not ( = ?auto_2459025 ?auto_2459030 ) ) ( not ( = ?auto_2459025 ?auto_2459031 ) ) ( not ( = ?auto_2459025 ?auto_2459032 ) ) ( not ( = ?auto_2459025 ?auto_2459033 ) ) ( not ( = ?auto_2459025 ?auto_2459034 ) ) ( not ( = ?auto_2459025 ?auto_2459035 ) ) ( not ( = ?auto_2459025 ?auto_2459036 ) ) ( not ( = ?auto_2459025 ?auto_2459037 ) ) ( not ( = ?auto_2459025 ?auto_2459038 ) ) ( not ( = ?auto_2459025 ?auto_2459039 ) ) ( not ( = ?auto_2459025 ?auto_2459042 ) ) ( not ( = ?auto_2459026 ?auto_2459027 ) ) ( not ( = ?auto_2459026 ?auto_2459028 ) ) ( not ( = ?auto_2459026 ?auto_2459029 ) ) ( not ( = ?auto_2459026 ?auto_2459030 ) ) ( not ( = ?auto_2459026 ?auto_2459031 ) ) ( not ( = ?auto_2459026 ?auto_2459032 ) ) ( not ( = ?auto_2459026 ?auto_2459033 ) ) ( not ( = ?auto_2459026 ?auto_2459034 ) ) ( not ( = ?auto_2459026 ?auto_2459035 ) ) ( not ( = ?auto_2459026 ?auto_2459036 ) ) ( not ( = ?auto_2459026 ?auto_2459037 ) ) ( not ( = ?auto_2459026 ?auto_2459038 ) ) ( not ( = ?auto_2459026 ?auto_2459039 ) ) ( not ( = ?auto_2459026 ?auto_2459042 ) ) ( not ( = ?auto_2459027 ?auto_2459028 ) ) ( not ( = ?auto_2459027 ?auto_2459029 ) ) ( not ( = ?auto_2459027 ?auto_2459030 ) ) ( not ( = ?auto_2459027 ?auto_2459031 ) ) ( not ( = ?auto_2459027 ?auto_2459032 ) ) ( not ( = ?auto_2459027 ?auto_2459033 ) ) ( not ( = ?auto_2459027 ?auto_2459034 ) ) ( not ( = ?auto_2459027 ?auto_2459035 ) ) ( not ( = ?auto_2459027 ?auto_2459036 ) ) ( not ( = ?auto_2459027 ?auto_2459037 ) ) ( not ( = ?auto_2459027 ?auto_2459038 ) ) ( not ( = ?auto_2459027 ?auto_2459039 ) ) ( not ( = ?auto_2459027 ?auto_2459042 ) ) ( not ( = ?auto_2459028 ?auto_2459029 ) ) ( not ( = ?auto_2459028 ?auto_2459030 ) ) ( not ( = ?auto_2459028 ?auto_2459031 ) ) ( not ( = ?auto_2459028 ?auto_2459032 ) ) ( not ( = ?auto_2459028 ?auto_2459033 ) ) ( not ( = ?auto_2459028 ?auto_2459034 ) ) ( not ( = ?auto_2459028 ?auto_2459035 ) ) ( not ( = ?auto_2459028 ?auto_2459036 ) ) ( not ( = ?auto_2459028 ?auto_2459037 ) ) ( not ( = ?auto_2459028 ?auto_2459038 ) ) ( not ( = ?auto_2459028 ?auto_2459039 ) ) ( not ( = ?auto_2459028 ?auto_2459042 ) ) ( not ( = ?auto_2459029 ?auto_2459030 ) ) ( not ( = ?auto_2459029 ?auto_2459031 ) ) ( not ( = ?auto_2459029 ?auto_2459032 ) ) ( not ( = ?auto_2459029 ?auto_2459033 ) ) ( not ( = ?auto_2459029 ?auto_2459034 ) ) ( not ( = ?auto_2459029 ?auto_2459035 ) ) ( not ( = ?auto_2459029 ?auto_2459036 ) ) ( not ( = ?auto_2459029 ?auto_2459037 ) ) ( not ( = ?auto_2459029 ?auto_2459038 ) ) ( not ( = ?auto_2459029 ?auto_2459039 ) ) ( not ( = ?auto_2459029 ?auto_2459042 ) ) ( not ( = ?auto_2459030 ?auto_2459031 ) ) ( not ( = ?auto_2459030 ?auto_2459032 ) ) ( not ( = ?auto_2459030 ?auto_2459033 ) ) ( not ( = ?auto_2459030 ?auto_2459034 ) ) ( not ( = ?auto_2459030 ?auto_2459035 ) ) ( not ( = ?auto_2459030 ?auto_2459036 ) ) ( not ( = ?auto_2459030 ?auto_2459037 ) ) ( not ( = ?auto_2459030 ?auto_2459038 ) ) ( not ( = ?auto_2459030 ?auto_2459039 ) ) ( not ( = ?auto_2459030 ?auto_2459042 ) ) ( not ( = ?auto_2459031 ?auto_2459032 ) ) ( not ( = ?auto_2459031 ?auto_2459033 ) ) ( not ( = ?auto_2459031 ?auto_2459034 ) ) ( not ( = ?auto_2459031 ?auto_2459035 ) ) ( not ( = ?auto_2459031 ?auto_2459036 ) ) ( not ( = ?auto_2459031 ?auto_2459037 ) ) ( not ( = ?auto_2459031 ?auto_2459038 ) ) ( not ( = ?auto_2459031 ?auto_2459039 ) ) ( not ( = ?auto_2459031 ?auto_2459042 ) ) ( not ( = ?auto_2459032 ?auto_2459033 ) ) ( not ( = ?auto_2459032 ?auto_2459034 ) ) ( not ( = ?auto_2459032 ?auto_2459035 ) ) ( not ( = ?auto_2459032 ?auto_2459036 ) ) ( not ( = ?auto_2459032 ?auto_2459037 ) ) ( not ( = ?auto_2459032 ?auto_2459038 ) ) ( not ( = ?auto_2459032 ?auto_2459039 ) ) ( not ( = ?auto_2459032 ?auto_2459042 ) ) ( not ( = ?auto_2459033 ?auto_2459034 ) ) ( not ( = ?auto_2459033 ?auto_2459035 ) ) ( not ( = ?auto_2459033 ?auto_2459036 ) ) ( not ( = ?auto_2459033 ?auto_2459037 ) ) ( not ( = ?auto_2459033 ?auto_2459038 ) ) ( not ( = ?auto_2459033 ?auto_2459039 ) ) ( not ( = ?auto_2459033 ?auto_2459042 ) ) ( not ( = ?auto_2459034 ?auto_2459035 ) ) ( not ( = ?auto_2459034 ?auto_2459036 ) ) ( not ( = ?auto_2459034 ?auto_2459037 ) ) ( not ( = ?auto_2459034 ?auto_2459038 ) ) ( not ( = ?auto_2459034 ?auto_2459039 ) ) ( not ( = ?auto_2459034 ?auto_2459042 ) ) ( not ( = ?auto_2459035 ?auto_2459036 ) ) ( not ( = ?auto_2459035 ?auto_2459037 ) ) ( not ( = ?auto_2459035 ?auto_2459038 ) ) ( not ( = ?auto_2459035 ?auto_2459039 ) ) ( not ( = ?auto_2459035 ?auto_2459042 ) ) ( not ( = ?auto_2459036 ?auto_2459037 ) ) ( not ( = ?auto_2459036 ?auto_2459038 ) ) ( not ( = ?auto_2459036 ?auto_2459039 ) ) ( not ( = ?auto_2459036 ?auto_2459042 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2459037 ?auto_2459038 ?auto_2459039 )
      ( MAKE-14CRATE-VERIFY ?auto_2459025 ?auto_2459026 ?auto_2459027 ?auto_2459028 ?auto_2459029 ?auto_2459030 ?auto_2459031 ?auto_2459032 ?auto_2459033 ?auto_2459034 ?auto_2459035 ?auto_2459036 ?auto_2459037 ?auto_2459038 ?auto_2459039 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2459229 - SURFACE
      ?auto_2459230 - SURFACE
      ?auto_2459231 - SURFACE
      ?auto_2459232 - SURFACE
      ?auto_2459233 - SURFACE
      ?auto_2459234 - SURFACE
      ?auto_2459235 - SURFACE
      ?auto_2459236 - SURFACE
      ?auto_2459237 - SURFACE
      ?auto_2459238 - SURFACE
      ?auto_2459239 - SURFACE
      ?auto_2459240 - SURFACE
      ?auto_2459241 - SURFACE
      ?auto_2459242 - SURFACE
      ?auto_2459243 - SURFACE
    )
    :vars
    (
      ?auto_2459244 - HOIST
      ?auto_2459245 - PLACE
      ?auto_2459246 - PLACE
      ?auto_2459249 - HOIST
      ?auto_2459247 - SURFACE
      ?auto_2459248 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2459244 ?auto_2459245 ) ( SURFACE-AT ?auto_2459242 ?auto_2459245 ) ( CLEAR ?auto_2459242 ) ( IS-CRATE ?auto_2459243 ) ( not ( = ?auto_2459242 ?auto_2459243 ) ) ( AVAILABLE ?auto_2459244 ) ( ON ?auto_2459242 ?auto_2459241 ) ( not ( = ?auto_2459241 ?auto_2459242 ) ) ( not ( = ?auto_2459241 ?auto_2459243 ) ) ( not ( = ?auto_2459246 ?auto_2459245 ) ) ( HOIST-AT ?auto_2459249 ?auto_2459246 ) ( not ( = ?auto_2459244 ?auto_2459249 ) ) ( AVAILABLE ?auto_2459249 ) ( SURFACE-AT ?auto_2459243 ?auto_2459246 ) ( ON ?auto_2459243 ?auto_2459247 ) ( CLEAR ?auto_2459243 ) ( not ( = ?auto_2459242 ?auto_2459247 ) ) ( not ( = ?auto_2459243 ?auto_2459247 ) ) ( not ( = ?auto_2459241 ?auto_2459247 ) ) ( TRUCK-AT ?auto_2459248 ?auto_2459245 ) ( ON ?auto_2459230 ?auto_2459229 ) ( ON ?auto_2459231 ?auto_2459230 ) ( ON ?auto_2459232 ?auto_2459231 ) ( ON ?auto_2459233 ?auto_2459232 ) ( ON ?auto_2459234 ?auto_2459233 ) ( ON ?auto_2459235 ?auto_2459234 ) ( ON ?auto_2459236 ?auto_2459235 ) ( ON ?auto_2459237 ?auto_2459236 ) ( ON ?auto_2459238 ?auto_2459237 ) ( ON ?auto_2459239 ?auto_2459238 ) ( ON ?auto_2459240 ?auto_2459239 ) ( ON ?auto_2459241 ?auto_2459240 ) ( not ( = ?auto_2459229 ?auto_2459230 ) ) ( not ( = ?auto_2459229 ?auto_2459231 ) ) ( not ( = ?auto_2459229 ?auto_2459232 ) ) ( not ( = ?auto_2459229 ?auto_2459233 ) ) ( not ( = ?auto_2459229 ?auto_2459234 ) ) ( not ( = ?auto_2459229 ?auto_2459235 ) ) ( not ( = ?auto_2459229 ?auto_2459236 ) ) ( not ( = ?auto_2459229 ?auto_2459237 ) ) ( not ( = ?auto_2459229 ?auto_2459238 ) ) ( not ( = ?auto_2459229 ?auto_2459239 ) ) ( not ( = ?auto_2459229 ?auto_2459240 ) ) ( not ( = ?auto_2459229 ?auto_2459241 ) ) ( not ( = ?auto_2459229 ?auto_2459242 ) ) ( not ( = ?auto_2459229 ?auto_2459243 ) ) ( not ( = ?auto_2459229 ?auto_2459247 ) ) ( not ( = ?auto_2459230 ?auto_2459231 ) ) ( not ( = ?auto_2459230 ?auto_2459232 ) ) ( not ( = ?auto_2459230 ?auto_2459233 ) ) ( not ( = ?auto_2459230 ?auto_2459234 ) ) ( not ( = ?auto_2459230 ?auto_2459235 ) ) ( not ( = ?auto_2459230 ?auto_2459236 ) ) ( not ( = ?auto_2459230 ?auto_2459237 ) ) ( not ( = ?auto_2459230 ?auto_2459238 ) ) ( not ( = ?auto_2459230 ?auto_2459239 ) ) ( not ( = ?auto_2459230 ?auto_2459240 ) ) ( not ( = ?auto_2459230 ?auto_2459241 ) ) ( not ( = ?auto_2459230 ?auto_2459242 ) ) ( not ( = ?auto_2459230 ?auto_2459243 ) ) ( not ( = ?auto_2459230 ?auto_2459247 ) ) ( not ( = ?auto_2459231 ?auto_2459232 ) ) ( not ( = ?auto_2459231 ?auto_2459233 ) ) ( not ( = ?auto_2459231 ?auto_2459234 ) ) ( not ( = ?auto_2459231 ?auto_2459235 ) ) ( not ( = ?auto_2459231 ?auto_2459236 ) ) ( not ( = ?auto_2459231 ?auto_2459237 ) ) ( not ( = ?auto_2459231 ?auto_2459238 ) ) ( not ( = ?auto_2459231 ?auto_2459239 ) ) ( not ( = ?auto_2459231 ?auto_2459240 ) ) ( not ( = ?auto_2459231 ?auto_2459241 ) ) ( not ( = ?auto_2459231 ?auto_2459242 ) ) ( not ( = ?auto_2459231 ?auto_2459243 ) ) ( not ( = ?auto_2459231 ?auto_2459247 ) ) ( not ( = ?auto_2459232 ?auto_2459233 ) ) ( not ( = ?auto_2459232 ?auto_2459234 ) ) ( not ( = ?auto_2459232 ?auto_2459235 ) ) ( not ( = ?auto_2459232 ?auto_2459236 ) ) ( not ( = ?auto_2459232 ?auto_2459237 ) ) ( not ( = ?auto_2459232 ?auto_2459238 ) ) ( not ( = ?auto_2459232 ?auto_2459239 ) ) ( not ( = ?auto_2459232 ?auto_2459240 ) ) ( not ( = ?auto_2459232 ?auto_2459241 ) ) ( not ( = ?auto_2459232 ?auto_2459242 ) ) ( not ( = ?auto_2459232 ?auto_2459243 ) ) ( not ( = ?auto_2459232 ?auto_2459247 ) ) ( not ( = ?auto_2459233 ?auto_2459234 ) ) ( not ( = ?auto_2459233 ?auto_2459235 ) ) ( not ( = ?auto_2459233 ?auto_2459236 ) ) ( not ( = ?auto_2459233 ?auto_2459237 ) ) ( not ( = ?auto_2459233 ?auto_2459238 ) ) ( not ( = ?auto_2459233 ?auto_2459239 ) ) ( not ( = ?auto_2459233 ?auto_2459240 ) ) ( not ( = ?auto_2459233 ?auto_2459241 ) ) ( not ( = ?auto_2459233 ?auto_2459242 ) ) ( not ( = ?auto_2459233 ?auto_2459243 ) ) ( not ( = ?auto_2459233 ?auto_2459247 ) ) ( not ( = ?auto_2459234 ?auto_2459235 ) ) ( not ( = ?auto_2459234 ?auto_2459236 ) ) ( not ( = ?auto_2459234 ?auto_2459237 ) ) ( not ( = ?auto_2459234 ?auto_2459238 ) ) ( not ( = ?auto_2459234 ?auto_2459239 ) ) ( not ( = ?auto_2459234 ?auto_2459240 ) ) ( not ( = ?auto_2459234 ?auto_2459241 ) ) ( not ( = ?auto_2459234 ?auto_2459242 ) ) ( not ( = ?auto_2459234 ?auto_2459243 ) ) ( not ( = ?auto_2459234 ?auto_2459247 ) ) ( not ( = ?auto_2459235 ?auto_2459236 ) ) ( not ( = ?auto_2459235 ?auto_2459237 ) ) ( not ( = ?auto_2459235 ?auto_2459238 ) ) ( not ( = ?auto_2459235 ?auto_2459239 ) ) ( not ( = ?auto_2459235 ?auto_2459240 ) ) ( not ( = ?auto_2459235 ?auto_2459241 ) ) ( not ( = ?auto_2459235 ?auto_2459242 ) ) ( not ( = ?auto_2459235 ?auto_2459243 ) ) ( not ( = ?auto_2459235 ?auto_2459247 ) ) ( not ( = ?auto_2459236 ?auto_2459237 ) ) ( not ( = ?auto_2459236 ?auto_2459238 ) ) ( not ( = ?auto_2459236 ?auto_2459239 ) ) ( not ( = ?auto_2459236 ?auto_2459240 ) ) ( not ( = ?auto_2459236 ?auto_2459241 ) ) ( not ( = ?auto_2459236 ?auto_2459242 ) ) ( not ( = ?auto_2459236 ?auto_2459243 ) ) ( not ( = ?auto_2459236 ?auto_2459247 ) ) ( not ( = ?auto_2459237 ?auto_2459238 ) ) ( not ( = ?auto_2459237 ?auto_2459239 ) ) ( not ( = ?auto_2459237 ?auto_2459240 ) ) ( not ( = ?auto_2459237 ?auto_2459241 ) ) ( not ( = ?auto_2459237 ?auto_2459242 ) ) ( not ( = ?auto_2459237 ?auto_2459243 ) ) ( not ( = ?auto_2459237 ?auto_2459247 ) ) ( not ( = ?auto_2459238 ?auto_2459239 ) ) ( not ( = ?auto_2459238 ?auto_2459240 ) ) ( not ( = ?auto_2459238 ?auto_2459241 ) ) ( not ( = ?auto_2459238 ?auto_2459242 ) ) ( not ( = ?auto_2459238 ?auto_2459243 ) ) ( not ( = ?auto_2459238 ?auto_2459247 ) ) ( not ( = ?auto_2459239 ?auto_2459240 ) ) ( not ( = ?auto_2459239 ?auto_2459241 ) ) ( not ( = ?auto_2459239 ?auto_2459242 ) ) ( not ( = ?auto_2459239 ?auto_2459243 ) ) ( not ( = ?auto_2459239 ?auto_2459247 ) ) ( not ( = ?auto_2459240 ?auto_2459241 ) ) ( not ( = ?auto_2459240 ?auto_2459242 ) ) ( not ( = ?auto_2459240 ?auto_2459243 ) ) ( not ( = ?auto_2459240 ?auto_2459247 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2459241 ?auto_2459242 ?auto_2459243 )
      ( MAKE-14CRATE-VERIFY ?auto_2459229 ?auto_2459230 ?auto_2459231 ?auto_2459232 ?auto_2459233 ?auto_2459234 ?auto_2459235 ?auto_2459236 ?auto_2459237 ?auto_2459238 ?auto_2459239 ?auto_2459240 ?auto_2459241 ?auto_2459242 ?auto_2459243 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2459433 - SURFACE
      ?auto_2459434 - SURFACE
      ?auto_2459435 - SURFACE
      ?auto_2459436 - SURFACE
      ?auto_2459437 - SURFACE
      ?auto_2459438 - SURFACE
      ?auto_2459439 - SURFACE
      ?auto_2459440 - SURFACE
      ?auto_2459441 - SURFACE
      ?auto_2459442 - SURFACE
      ?auto_2459443 - SURFACE
      ?auto_2459444 - SURFACE
      ?auto_2459445 - SURFACE
      ?auto_2459446 - SURFACE
      ?auto_2459447 - SURFACE
    )
    :vars
    (
      ?auto_2459452 - HOIST
      ?auto_2459453 - PLACE
      ?auto_2459451 - PLACE
      ?auto_2459449 - HOIST
      ?auto_2459448 - SURFACE
      ?auto_2459450 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2459452 ?auto_2459453 ) ( IS-CRATE ?auto_2459447 ) ( not ( = ?auto_2459446 ?auto_2459447 ) ) ( not ( = ?auto_2459445 ?auto_2459446 ) ) ( not ( = ?auto_2459445 ?auto_2459447 ) ) ( not ( = ?auto_2459451 ?auto_2459453 ) ) ( HOIST-AT ?auto_2459449 ?auto_2459451 ) ( not ( = ?auto_2459452 ?auto_2459449 ) ) ( AVAILABLE ?auto_2459449 ) ( SURFACE-AT ?auto_2459447 ?auto_2459451 ) ( ON ?auto_2459447 ?auto_2459448 ) ( CLEAR ?auto_2459447 ) ( not ( = ?auto_2459446 ?auto_2459448 ) ) ( not ( = ?auto_2459447 ?auto_2459448 ) ) ( not ( = ?auto_2459445 ?auto_2459448 ) ) ( TRUCK-AT ?auto_2459450 ?auto_2459453 ) ( SURFACE-AT ?auto_2459445 ?auto_2459453 ) ( CLEAR ?auto_2459445 ) ( LIFTING ?auto_2459452 ?auto_2459446 ) ( IS-CRATE ?auto_2459446 ) ( ON ?auto_2459434 ?auto_2459433 ) ( ON ?auto_2459435 ?auto_2459434 ) ( ON ?auto_2459436 ?auto_2459435 ) ( ON ?auto_2459437 ?auto_2459436 ) ( ON ?auto_2459438 ?auto_2459437 ) ( ON ?auto_2459439 ?auto_2459438 ) ( ON ?auto_2459440 ?auto_2459439 ) ( ON ?auto_2459441 ?auto_2459440 ) ( ON ?auto_2459442 ?auto_2459441 ) ( ON ?auto_2459443 ?auto_2459442 ) ( ON ?auto_2459444 ?auto_2459443 ) ( ON ?auto_2459445 ?auto_2459444 ) ( not ( = ?auto_2459433 ?auto_2459434 ) ) ( not ( = ?auto_2459433 ?auto_2459435 ) ) ( not ( = ?auto_2459433 ?auto_2459436 ) ) ( not ( = ?auto_2459433 ?auto_2459437 ) ) ( not ( = ?auto_2459433 ?auto_2459438 ) ) ( not ( = ?auto_2459433 ?auto_2459439 ) ) ( not ( = ?auto_2459433 ?auto_2459440 ) ) ( not ( = ?auto_2459433 ?auto_2459441 ) ) ( not ( = ?auto_2459433 ?auto_2459442 ) ) ( not ( = ?auto_2459433 ?auto_2459443 ) ) ( not ( = ?auto_2459433 ?auto_2459444 ) ) ( not ( = ?auto_2459433 ?auto_2459445 ) ) ( not ( = ?auto_2459433 ?auto_2459446 ) ) ( not ( = ?auto_2459433 ?auto_2459447 ) ) ( not ( = ?auto_2459433 ?auto_2459448 ) ) ( not ( = ?auto_2459434 ?auto_2459435 ) ) ( not ( = ?auto_2459434 ?auto_2459436 ) ) ( not ( = ?auto_2459434 ?auto_2459437 ) ) ( not ( = ?auto_2459434 ?auto_2459438 ) ) ( not ( = ?auto_2459434 ?auto_2459439 ) ) ( not ( = ?auto_2459434 ?auto_2459440 ) ) ( not ( = ?auto_2459434 ?auto_2459441 ) ) ( not ( = ?auto_2459434 ?auto_2459442 ) ) ( not ( = ?auto_2459434 ?auto_2459443 ) ) ( not ( = ?auto_2459434 ?auto_2459444 ) ) ( not ( = ?auto_2459434 ?auto_2459445 ) ) ( not ( = ?auto_2459434 ?auto_2459446 ) ) ( not ( = ?auto_2459434 ?auto_2459447 ) ) ( not ( = ?auto_2459434 ?auto_2459448 ) ) ( not ( = ?auto_2459435 ?auto_2459436 ) ) ( not ( = ?auto_2459435 ?auto_2459437 ) ) ( not ( = ?auto_2459435 ?auto_2459438 ) ) ( not ( = ?auto_2459435 ?auto_2459439 ) ) ( not ( = ?auto_2459435 ?auto_2459440 ) ) ( not ( = ?auto_2459435 ?auto_2459441 ) ) ( not ( = ?auto_2459435 ?auto_2459442 ) ) ( not ( = ?auto_2459435 ?auto_2459443 ) ) ( not ( = ?auto_2459435 ?auto_2459444 ) ) ( not ( = ?auto_2459435 ?auto_2459445 ) ) ( not ( = ?auto_2459435 ?auto_2459446 ) ) ( not ( = ?auto_2459435 ?auto_2459447 ) ) ( not ( = ?auto_2459435 ?auto_2459448 ) ) ( not ( = ?auto_2459436 ?auto_2459437 ) ) ( not ( = ?auto_2459436 ?auto_2459438 ) ) ( not ( = ?auto_2459436 ?auto_2459439 ) ) ( not ( = ?auto_2459436 ?auto_2459440 ) ) ( not ( = ?auto_2459436 ?auto_2459441 ) ) ( not ( = ?auto_2459436 ?auto_2459442 ) ) ( not ( = ?auto_2459436 ?auto_2459443 ) ) ( not ( = ?auto_2459436 ?auto_2459444 ) ) ( not ( = ?auto_2459436 ?auto_2459445 ) ) ( not ( = ?auto_2459436 ?auto_2459446 ) ) ( not ( = ?auto_2459436 ?auto_2459447 ) ) ( not ( = ?auto_2459436 ?auto_2459448 ) ) ( not ( = ?auto_2459437 ?auto_2459438 ) ) ( not ( = ?auto_2459437 ?auto_2459439 ) ) ( not ( = ?auto_2459437 ?auto_2459440 ) ) ( not ( = ?auto_2459437 ?auto_2459441 ) ) ( not ( = ?auto_2459437 ?auto_2459442 ) ) ( not ( = ?auto_2459437 ?auto_2459443 ) ) ( not ( = ?auto_2459437 ?auto_2459444 ) ) ( not ( = ?auto_2459437 ?auto_2459445 ) ) ( not ( = ?auto_2459437 ?auto_2459446 ) ) ( not ( = ?auto_2459437 ?auto_2459447 ) ) ( not ( = ?auto_2459437 ?auto_2459448 ) ) ( not ( = ?auto_2459438 ?auto_2459439 ) ) ( not ( = ?auto_2459438 ?auto_2459440 ) ) ( not ( = ?auto_2459438 ?auto_2459441 ) ) ( not ( = ?auto_2459438 ?auto_2459442 ) ) ( not ( = ?auto_2459438 ?auto_2459443 ) ) ( not ( = ?auto_2459438 ?auto_2459444 ) ) ( not ( = ?auto_2459438 ?auto_2459445 ) ) ( not ( = ?auto_2459438 ?auto_2459446 ) ) ( not ( = ?auto_2459438 ?auto_2459447 ) ) ( not ( = ?auto_2459438 ?auto_2459448 ) ) ( not ( = ?auto_2459439 ?auto_2459440 ) ) ( not ( = ?auto_2459439 ?auto_2459441 ) ) ( not ( = ?auto_2459439 ?auto_2459442 ) ) ( not ( = ?auto_2459439 ?auto_2459443 ) ) ( not ( = ?auto_2459439 ?auto_2459444 ) ) ( not ( = ?auto_2459439 ?auto_2459445 ) ) ( not ( = ?auto_2459439 ?auto_2459446 ) ) ( not ( = ?auto_2459439 ?auto_2459447 ) ) ( not ( = ?auto_2459439 ?auto_2459448 ) ) ( not ( = ?auto_2459440 ?auto_2459441 ) ) ( not ( = ?auto_2459440 ?auto_2459442 ) ) ( not ( = ?auto_2459440 ?auto_2459443 ) ) ( not ( = ?auto_2459440 ?auto_2459444 ) ) ( not ( = ?auto_2459440 ?auto_2459445 ) ) ( not ( = ?auto_2459440 ?auto_2459446 ) ) ( not ( = ?auto_2459440 ?auto_2459447 ) ) ( not ( = ?auto_2459440 ?auto_2459448 ) ) ( not ( = ?auto_2459441 ?auto_2459442 ) ) ( not ( = ?auto_2459441 ?auto_2459443 ) ) ( not ( = ?auto_2459441 ?auto_2459444 ) ) ( not ( = ?auto_2459441 ?auto_2459445 ) ) ( not ( = ?auto_2459441 ?auto_2459446 ) ) ( not ( = ?auto_2459441 ?auto_2459447 ) ) ( not ( = ?auto_2459441 ?auto_2459448 ) ) ( not ( = ?auto_2459442 ?auto_2459443 ) ) ( not ( = ?auto_2459442 ?auto_2459444 ) ) ( not ( = ?auto_2459442 ?auto_2459445 ) ) ( not ( = ?auto_2459442 ?auto_2459446 ) ) ( not ( = ?auto_2459442 ?auto_2459447 ) ) ( not ( = ?auto_2459442 ?auto_2459448 ) ) ( not ( = ?auto_2459443 ?auto_2459444 ) ) ( not ( = ?auto_2459443 ?auto_2459445 ) ) ( not ( = ?auto_2459443 ?auto_2459446 ) ) ( not ( = ?auto_2459443 ?auto_2459447 ) ) ( not ( = ?auto_2459443 ?auto_2459448 ) ) ( not ( = ?auto_2459444 ?auto_2459445 ) ) ( not ( = ?auto_2459444 ?auto_2459446 ) ) ( not ( = ?auto_2459444 ?auto_2459447 ) ) ( not ( = ?auto_2459444 ?auto_2459448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2459445 ?auto_2459446 ?auto_2459447 )
      ( MAKE-14CRATE-VERIFY ?auto_2459433 ?auto_2459434 ?auto_2459435 ?auto_2459436 ?auto_2459437 ?auto_2459438 ?auto_2459439 ?auto_2459440 ?auto_2459441 ?auto_2459442 ?auto_2459443 ?auto_2459444 ?auto_2459445 ?auto_2459446 ?auto_2459447 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2459637 - SURFACE
      ?auto_2459638 - SURFACE
      ?auto_2459639 - SURFACE
      ?auto_2459640 - SURFACE
      ?auto_2459641 - SURFACE
      ?auto_2459642 - SURFACE
      ?auto_2459643 - SURFACE
      ?auto_2459644 - SURFACE
      ?auto_2459645 - SURFACE
      ?auto_2459646 - SURFACE
      ?auto_2459647 - SURFACE
      ?auto_2459648 - SURFACE
      ?auto_2459649 - SURFACE
      ?auto_2459650 - SURFACE
      ?auto_2459651 - SURFACE
    )
    :vars
    (
      ?auto_2459655 - HOIST
      ?auto_2459656 - PLACE
      ?auto_2459652 - PLACE
      ?auto_2459653 - HOIST
      ?auto_2459654 - SURFACE
      ?auto_2459657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2459655 ?auto_2459656 ) ( IS-CRATE ?auto_2459651 ) ( not ( = ?auto_2459650 ?auto_2459651 ) ) ( not ( = ?auto_2459649 ?auto_2459650 ) ) ( not ( = ?auto_2459649 ?auto_2459651 ) ) ( not ( = ?auto_2459652 ?auto_2459656 ) ) ( HOIST-AT ?auto_2459653 ?auto_2459652 ) ( not ( = ?auto_2459655 ?auto_2459653 ) ) ( AVAILABLE ?auto_2459653 ) ( SURFACE-AT ?auto_2459651 ?auto_2459652 ) ( ON ?auto_2459651 ?auto_2459654 ) ( CLEAR ?auto_2459651 ) ( not ( = ?auto_2459650 ?auto_2459654 ) ) ( not ( = ?auto_2459651 ?auto_2459654 ) ) ( not ( = ?auto_2459649 ?auto_2459654 ) ) ( TRUCK-AT ?auto_2459657 ?auto_2459656 ) ( SURFACE-AT ?auto_2459649 ?auto_2459656 ) ( CLEAR ?auto_2459649 ) ( IS-CRATE ?auto_2459650 ) ( AVAILABLE ?auto_2459655 ) ( IN ?auto_2459650 ?auto_2459657 ) ( ON ?auto_2459638 ?auto_2459637 ) ( ON ?auto_2459639 ?auto_2459638 ) ( ON ?auto_2459640 ?auto_2459639 ) ( ON ?auto_2459641 ?auto_2459640 ) ( ON ?auto_2459642 ?auto_2459641 ) ( ON ?auto_2459643 ?auto_2459642 ) ( ON ?auto_2459644 ?auto_2459643 ) ( ON ?auto_2459645 ?auto_2459644 ) ( ON ?auto_2459646 ?auto_2459645 ) ( ON ?auto_2459647 ?auto_2459646 ) ( ON ?auto_2459648 ?auto_2459647 ) ( ON ?auto_2459649 ?auto_2459648 ) ( not ( = ?auto_2459637 ?auto_2459638 ) ) ( not ( = ?auto_2459637 ?auto_2459639 ) ) ( not ( = ?auto_2459637 ?auto_2459640 ) ) ( not ( = ?auto_2459637 ?auto_2459641 ) ) ( not ( = ?auto_2459637 ?auto_2459642 ) ) ( not ( = ?auto_2459637 ?auto_2459643 ) ) ( not ( = ?auto_2459637 ?auto_2459644 ) ) ( not ( = ?auto_2459637 ?auto_2459645 ) ) ( not ( = ?auto_2459637 ?auto_2459646 ) ) ( not ( = ?auto_2459637 ?auto_2459647 ) ) ( not ( = ?auto_2459637 ?auto_2459648 ) ) ( not ( = ?auto_2459637 ?auto_2459649 ) ) ( not ( = ?auto_2459637 ?auto_2459650 ) ) ( not ( = ?auto_2459637 ?auto_2459651 ) ) ( not ( = ?auto_2459637 ?auto_2459654 ) ) ( not ( = ?auto_2459638 ?auto_2459639 ) ) ( not ( = ?auto_2459638 ?auto_2459640 ) ) ( not ( = ?auto_2459638 ?auto_2459641 ) ) ( not ( = ?auto_2459638 ?auto_2459642 ) ) ( not ( = ?auto_2459638 ?auto_2459643 ) ) ( not ( = ?auto_2459638 ?auto_2459644 ) ) ( not ( = ?auto_2459638 ?auto_2459645 ) ) ( not ( = ?auto_2459638 ?auto_2459646 ) ) ( not ( = ?auto_2459638 ?auto_2459647 ) ) ( not ( = ?auto_2459638 ?auto_2459648 ) ) ( not ( = ?auto_2459638 ?auto_2459649 ) ) ( not ( = ?auto_2459638 ?auto_2459650 ) ) ( not ( = ?auto_2459638 ?auto_2459651 ) ) ( not ( = ?auto_2459638 ?auto_2459654 ) ) ( not ( = ?auto_2459639 ?auto_2459640 ) ) ( not ( = ?auto_2459639 ?auto_2459641 ) ) ( not ( = ?auto_2459639 ?auto_2459642 ) ) ( not ( = ?auto_2459639 ?auto_2459643 ) ) ( not ( = ?auto_2459639 ?auto_2459644 ) ) ( not ( = ?auto_2459639 ?auto_2459645 ) ) ( not ( = ?auto_2459639 ?auto_2459646 ) ) ( not ( = ?auto_2459639 ?auto_2459647 ) ) ( not ( = ?auto_2459639 ?auto_2459648 ) ) ( not ( = ?auto_2459639 ?auto_2459649 ) ) ( not ( = ?auto_2459639 ?auto_2459650 ) ) ( not ( = ?auto_2459639 ?auto_2459651 ) ) ( not ( = ?auto_2459639 ?auto_2459654 ) ) ( not ( = ?auto_2459640 ?auto_2459641 ) ) ( not ( = ?auto_2459640 ?auto_2459642 ) ) ( not ( = ?auto_2459640 ?auto_2459643 ) ) ( not ( = ?auto_2459640 ?auto_2459644 ) ) ( not ( = ?auto_2459640 ?auto_2459645 ) ) ( not ( = ?auto_2459640 ?auto_2459646 ) ) ( not ( = ?auto_2459640 ?auto_2459647 ) ) ( not ( = ?auto_2459640 ?auto_2459648 ) ) ( not ( = ?auto_2459640 ?auto_2459649 ) ) ( not ( = ?auto_2459640 ?auto_2459650 ) ) ( not ( = ?auto_2459640 ?auto_2459651 ) ) ( not ( = ?auto_2459640 ?auto_2459654 ) ) ( not ( = ?auto_2459641 ?auto_2459642 ) ) ( not ( = ?auto_2459641 ?auto_2459643 ) ) ( not ( = ?auto_2459641 ?auto_2459644 ) ) ( not ( = ?auto_2459641 ?auto_2459645 ) ) ( not ( = ?auto_2459641 ?auto_2459646 ) ) ( not ( = ?auto_2459641 ?auto_2459647 ) ) ( not ( = ?auto_2459641 ?auto_2459648 ) ) ( not ( = ?auto_2459641 ?auto_2459649 ) ) ( not ( = ?auto_2459641 ?auto_2459650 ) ) ( not ( = ?auto_2459641 ?auto_2459651 ) ) ( not ( = ?auto_2459641 ?auto_2459654 ) ) ( not ( = ?auto_2459642 ?auto_2459643 ) ) ( not ( = ?auto_2459642 ?auto_2459644 ) ) ( not ( = ?auto_2459642 ?auto_2459645 ) ) ( not ( = ?auto_2459642 ?auto_2459646 ) ) ( not ( = ?auto_2459642 ?auto_2459647 ) ) ( not ( = ?auto_2459642 ?auto_2459648 ) ) ( not ( = ?auto_2459642 ?auto_2459649 ) ) ( not ( = ?auto_2459642 ?auto_2459650 ) ) ( not ( = ?auto_2459642 ?auto_2459651 ) ) ( not ( = ?auto_2459642 ?auto_2459654 ) ) ( not ( = ?auto_2459643 ?auto_2459644 ) ) ( not ( = ?auto_2459643 ?auto_2459645 ) ) ( not ( = ?auto_2459643 ?auto_2459646 ) ) ( not ( = ?auto_2459643 ?auto_2459647 ) ) ( not ( = ?auto_2459643 ?auto_2459648 ) ) ( not ( = ?auto_2459643 ?auto_2459649 ) ) ( not ( = ?auto_2459643 ?auto_2459650 ) ) ( not ( = ?auto_2459643 ?auto_2459651 ) ) ( not ( = ?auto_2459643 ?auto_2459654 ) ) ( not ( = ?auto_2459644 ?auto_2459645 ) ) ( not ( = ?auto_2459644 ?auto_2459646 ) ) ( not ( = ?auto_2459644 ?auto_2459647 ) ) ( not ( = ?auto_2459644 ?auto_2459648 ) ) ( not ( = ?auto_2459644 ?auto_2459649 ) ) ( not ( = ?auto_2459644 ?auto_2459650 ) ) ( not ( = ?auto_2459644 ?auto_2459651 ) ) ( not ( = ?auto_2459644 ?auto_2459654 ) ) ( not ( = ?auto_2459645 ?auto_2459646 ) ) ( not ( = ?auto_2459645 ?auto_2459647 ) ) ( not ( = ?auto_2459645 ?auto_2459648 ) ) ( not ( = ?auto_2459645 ?auto_2459649 ) ) ( not ( = ?auto_2459645 ?auto_2459650 ) ) ( not ( = ?auto_2459645 ?auto_2459651 ) ) ( not ( = ?auto_2459645 ?auto_2459654 ) ) ( not ( = ?auto_2459646 ?auto_2459647 ) ) ( not ( = ?auto_2459646 ?auto_2459648 ) ) ( not ( = ?auto_2459646 ?auto_2459649 ) ) ( not ( = ?auto_2459646 ?auto_2459650 ) ) ( not ( = ?auto_2459646 ?auto_2459651 ) ) ( not ( = ?auto_2459646 ?auto_2459654 ) ) ( not ( = ?auto_2459647 ?auto_2459648 ) ) ( not ( = ?auto_2459647 ?auto_2459649 ) ) ( not ( = ?auto_2459647 ?auto_2459650 ) ) ( not ( = ?auto_2459647 ?auto_2459651 ) ) ( not ( = ?auto_2459647 ?auto_2459654 ) ) ( not ( = ?auto_2459648 ?auto_2459649 ) ) ( not ( = ?auto_2459648 ?auto_2459650 ) ) ( not ( = ?auto_2459648 ?auto_2459651 ) ) ( not ( = ?auto_2459648 ?auto_2459654 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2459649 ?auto_2459650 ?auto_2459651 )
      ( MAKE-14CRATE-VERIFY ?auto_2459637 ?auto_2459638 ?auto_2459639 ?auto_2459640 ?auto_2459641 ?auto_2459642 ?auto_2459643 ?auto_2459644 ?auto_2459645 ?auto_2459646 ?auto_2459647 ?auto_2459648 ?auto_2459649 ?auto_2459650 ?auto_2459651 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2476857 - SURFACE
      ?auto_2476858 - SURFACE
      ?auto_2476859 - SURFACE
      ?auto_2476860 - SURFACE
      ?auto_2476861 - SURFACE
      ?auto_2476862 - SURFACE
      ?auto_2476863 - SURFACE
      ?auto_2476864 - SURFACE
      ?auto_2476865 - SURFACE
      ?auto_2476866 - SURFACE
      ?auto_2476867 - SURFACE
      ?auto_2476868 - SURFACE
      ?auto_2476869 - SURFACE
      ?auto_2476870 - SURFACE
      ?auto_2476871 - SURFACE
      ?auto_2476872 - SURFACE
    )
    :vars
    (
      ?auto_2476874 - HOIST
      ?auto_2476873 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2476874 ?auto_2476873 ) ( SURFACE-AT ?auto_2476871 ?auto_2476873 ) ( CLEAR ?auto_2476871 ) ( LIFTING ?auto_2476874 ?auto_2476872 ) ( IS-CRATE ?auto_2476872 ) ( not ( = ?auto_2476871 ?auto_2476872 ) ) ( ON ?auto_2476858 ?auto_2476857 ) ( ON ?auto_2476859 ?auto_2476858 ) ( ON ?auto_2476860 ?auto_2476859 ) ( ON ?auto_2476861 ?auto_2476860 ) ( ON ?auto_2476862 ?auto_2476861 ) ( ON ?auto_2476863 ?auto_2476862 ) ( ON ?auto_2476864 ?auto_2476863 ) ( ON ?auto_2476865 ?auto_2476864 ) ( ON ?auto_2476866 ?auto_2476865 ) ( ON ?auto_2476867 ?auto_2476866 ) ( ON ?auto_2476868 ?auto_2476867 ) ( ON ?auto_2476869 ?auto_2476868 ) ( ON ?auto_2476870 ?auto_2476869 ) ( ON ?auto_2476871 ?auto_2476870 ) ( not ( = ?auto_2476857 ?auto_2476858 ) ) ( not ( = ?auto_2476857 ?auto_2476859 ) ) ( not ( = ?auto_2476857 ?auto_2476860 ) ) ( not ( = ?auto_2476857 ?auto_2476861 ) ) ( not ( = ?auto_2476857 ?auto_2476862 ) ) ( not ( = ?auto_2476857 ?auto_2476863 ) ) ( not ( = ?auto_2476857 ?auto_2476864 ) ) ( not ( = ?auto_2476857 ?auto_2476865 ) ) ( not ( = ?auto_2476857 ?auto_2476866 ) ) ( not ( = ?auto_2476857 ?auto_2476867 ) ) ( not ( = ?auto_2476857 ?auto_2476868 ) ) ( not ( = ?auto_2476857 ?auto_2476869 ) ) ( not ( = ?auto_2476857 ?auto_2476870 ) ) ( not ( = ?auto_2476857 ?auto_2476871 ) ) ( not ( = ?auto_2476857 ?auto_2476872 ) ) ( not ( = ?auto_2476858 ?auto_2476859 ) ) ( not ( = ?auto_2476858 ?auto_2476860 ) ) ( not ( = ?auto_2476858 ?auto_2476861 ) ) ( not ( = ?auto_2476858 ?auto_2476862 ) ) ( not ( = ?auto_2476858 ?auto_2476863 ) ) ( not ( = ?auto_2476858 ?auto_2476864 ) ) ( not ( = ?auto_2476858 ?auto_2476865 ) ) ( not ( = ?auto_2476858 ?auto_2476866 ) ) ( not ( = ?auto_2476858 ?auto_2476867 ) ) ( not ( = ?auto_2476858 ?auto_2476868 ) ) ( not ( = ?auto_2476858 ?auto_2476869 ) ) ( not ( = ?auto_2476858 ?auto_2476870 ) ) ( not ( = ?auto_2476858 ?auto_2476871 ) ) ( not ( = ?auto_2476858 ?auto_2476872 ) ) ( not ( = ?auto_2476859 ?auto_2476860 ) ) ( not ( = ?auto_2476859 ?auto_2476861 ) ) ( not ( = ?auto_2476859 ?auto_2476862 ) ) ( not ( = ?auto_2476859 ?auto_2476863 ) ) ( not ( = ?auto_2476859 ?auto_2476864 ) ) ( not ( = ?auto_2476859 ?auto_2476865 ) ) ( not ( = ?auto_2476859 ?auto_2476866 ) ) ( not ( = ?auto_2476859 ?auto_2476867 ) ) ( not ( = ?auto_2476859 ?auto_2476868 ) ) ( not ( = ?auto_2476859 ?auto_2476869 ) ) ( not ( = ?auto_2476859 ?auto_2476870 ) ) ( not ( = ?auto_2476859 ?auto_2476871 ) ) ( not ( = ?auto_2476859 ?auto_2476872 ) ) ( not ( = ?auto_2476860 ?auto_2476861 ) ) ( not ( = ?auto_2476860 ?auto_2476862 ) ) ( not ( = ?auto_2476860 ?auto_2476863 ) ) ( not ( = ?auto_2476860 ?auto_2476864 ) ) ( not ( = ?auto_2476860 ?auto_2476865 ) ) ( not ( = ?auto_2476860 ?auto_2476866 ) ) ( not ( = ?auto_2476860 ?auto_2476867 ) ) ( not ( = ?auto_2476860 ?auto_2476868 ) ) ( not ( = ?auto_2476860 ?auto_2476869 ) ) ( not ( = ?auto_2476860 ?auto_2476870 ) ) ( not ( = ?auto_2476860 ?auto_2476871 ) ) ( not ( = ?auto_2476860 ?auto_2476872 ) ) ( not ( = ?auto_2476861 ?auto_2476862 ) ) ( not ( = ?auto_2476861 ?auto_2476863 ) ) ( not ( = ?auto_2476861 ?auto_2476864 ) ) ( not ( = ?auto_2476861 ?auto_2476865 ) ) ( not ( = ?auto_2476861 ?auto_2476866 ) ) ( not ( = ?auto_2476861 ?auto_2476867 ) ) ( not ( = ?auto_2476861 ?auto_2476868 ) ) ( not ( = ?auto_2476861 ?auto_2476869 ) ) ( not ( = ?auto_2476861 ?auto_2476870 ) ) ( not ( = ?auto_2476861 ?auto_2476871 ) ) ( not ( = ?auto_2476861 ?auto_2476872 ) ) ( not ( = ?auto_2476862 ?auto_2476863 ) ) ( not ( = ?auto_2476862 ?auto_2476864 ) ) ( not ( = ?auto_2476862 ?auto_2476865 ) ) ( not ( = ?auto_2476862 ?auto_2476866 ) ) ( not ( = ?auto_2476862 ?auto_2476867 ) ) ( not ( = ?auto_2476862 ?auto_2476868 ) ) ( not ( = ?auto_2476862 ?auto_2476869 ) ) ( not ( = ?auto_2476862 ?auto_2476870 ) ) ( not ( = ?auto_2476862 ?auto_2476871 ) ) ( not ( = ?auto_2476862 ?auto_2476872 ) ) ( not ( = ?auto_2476863 ?auto_2476864 ) ) ( not ( = ?auto_2476863 ?auto_2476865 ) ) ( not ( = ?auto_2476863 ?auto_2476866 ) ) ( not ( = ?auto_2476863 ?auto_2476867 ) ) ( not ( = ?auto_2476863 ?auto_2476868 ) ) ( not ( = ?auto_2476863 ?auto_2476869 ) ) ( not ( = ?auto_2476863 ?auto_2476870 ) ) ( not ( = ?auto_2476863 ?auto_2476871 ) ) ( not ( = ?auto_2476863 ?auto_2476872 ) ) ( not ( = ?auto_2476864 ?auto_2476865 ) ) ( not ( = ?auto_2476864 ?auto_2476866 ) ) ( not ( = ?auto_2476864 ?auto_2476867 ) ) ( not ( = ?auto_2476864 ?auto_2476868 ) ) ( not ( = ?auto_2476864 ?auto_2476869 ) ) ( not ( = ?auto_2476864 ?auto_2476870 ) ) ( not ( = ?auto_2476864 ?auto_2476871 ) ) ( not ( = ?auto_2476864 ?auto_2476872 ) ) ( not ( = ?auto_2476865 ?auto_2476866 ) ) ( not ( = ?auto_2476865 ?auto_2476867 ) ) ( not ( = ?auto_2476865 ?auto_2476868 ) ) ( not ( = ?auto_2476865 ?auto_2476869 ) ) ( not ( = ?auto_2476865 ?auto_2476870 ) ) ( not ( = ?auto_2476865 ?auto_2476871 ) ) ( not ( = ?auto_2476865 ?auto_2476872 ) ) ( not ( = ?auto_2476866 ?auto_2476867 ) ) ( not ( = ?auto_2476866 ?auto_2476868 ) ) ( not ( = ?auto_2476866 ?auto_2476869 ) ) ( not ( = ?auto_2476866 ?auto_2476870 ) ) ( not ( = ?auto_2476866 ?auto_2476871 ) ) ( not ( = ?auto_2476866 ?auto_2476872 ) ) ( not ( = ?auto_2476867 ?auto_2476868 ) ) ( not ( = ?auto_2476867 ?auto_2476869 ) ) ( not ( = ?auto_2476867 ?auto_2476870 ) ) ( not ( = ?auto_2476867 ?auto_2476871 ) ) ( not ( = ?auto_2476867 ?auto_2476872 ) ) ( not ( = ?auto_2476868 ?auto_2476869 ) ) ( not ( = ?auto_2476868 ?auto_2476870 ) ) ( not ( = ?auto_2476868 ?auto_2476871 ) ) ( not ( = ?auto_2476868 ?auto_2476872 ) ) ( not ( = ?auto_2476869 ?auto_2476870 ) ) ( not ( = ?auto_2476869 ?auto_2476871 ) ) ( not ( = ?auto_2476869 ?auto_2476872 ) ) ( not ( = ?auto_2476870 ?auto_2476871 ) ) ( not ( = ?auto_2476870 ?auto_2476872 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2476871 ?auto_2476872 )
      ( MAKE-15CRATE-VERIFY ?auto_2476857 ?auto_2476858 ?auto_2476859 ?auto_2476860 ?auto_2476861 ?auto_2476862 ?auto_2476863 ?auto_2476864 ?auto_2476865 ?auto_2476866 ?auto_2476867 ?auto_2476868 ?auto_2476869 ?auto_2476870 ?auto_2476871 ?auto_2476872 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2477036 - SURFACE
      ?auto_2477037 - SURFACE
      ?auto_2477038 - SURFACE
      ?auto_2477039 - SURFACE
      ?auto_2477040 - SURFACE
      ?auto_2477041 - SURFACE
      ?auto_2477042 - SURFACE
      ?auto_2477043 - SURFACE
      ?auto_2477044 - SURFACE
      ?auto_2477045 - SURFACE
      ?auto_2477046 - SURFACE
      ?auto_2477047 - SURFACE
      ?auto_2477048 - SURFACE
      ?auto_2477049 - SURFACE
      ?auto_2477050 - SURFACE
      ?auto_2477051 - SURFACE
    )
    :vars
    (
      ?auto_2477054 - HOIST
      ?auto_2477053 - PLACE
      ?auto_2477052 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2477054 ?auto_2477053 ) ( SURFACE-AT ?auto_2477050 ?auto_2477053 ) ( CLEAR ?auto_2477050 ) ( IS-CRATE ?auto_2477051 ) ( not ( = ?auto_2477050 ?auto_2477051 ) ) ( TRUCK-AT ?auto_2477052 ?auto_2477053 ) ( AVAILABLE ?auto_2477054 ) ( IN ?auto_2477051 ?auto_2477052 ) ( ON ?auto_2477050 ?auto_2477049 ) ( not ( = ?auto_2477049 ?auto_2477050 ) ) ( not ( = ?auto_2477049 ?auto_2477051 ) ) ( ON ?auto_2477037 ?auto_2477036 ) ( ON ?auto_2477038 ?auto_2477037 ) ( ON ?auto_2477039 ?auto_2477038 ) ( ON ?auto_2477040 ?auto_2477039 ) ( ON ?auto_2477041 ?auto_2477040 ) ( ON ?auto_2477042 ?auto_2477041 ) ( ON ?auto_2477043 ?auto_2477042 ) ( ON ?auto_2477044 ?auto_2477043 ) ( ON ?auto_2477045 ?auto_2477044 ) ( ON ?auto_2477046 ?auto_2477045 ) ( ON ?auto_2477047 ?auto_2477046 ) ( ON ?auto_2477048 ?auto_2477047 ) ( ON ?auto_2477049 ?auto_2477048 ) ( not ( = ?auto_2477036 ?auto_2477037 ) ) ( not ( = ?auto_2477036 ?auto_2477038 ) ) ( not ( = ?auto_2477036 ?auto_2477039 ) ) ( not ( = ?auto_2477036 ?auto_2477040 ) ) ( not ( = ?auto_2477036 ?auto_2477041 ) ) ( not ( = ?auto_2477036 ?auto_2477042 ) ) ( not ( = ?auto_2477036 ?auto_2477043 ) ) ( not ( = ?auto_2477036 ?auto_2477044 ) ) ( not ( = ?auto_2477036 ?auto_2477045 ) ) ( not ( = ?auto_2477036 ?auto_2477046 ) ) ( not ( = ?auto_2477036 ?auto_2477047 ) ) ( not ( = ?auto_2477036 ?auto_2477048 ) ) ( not ( = ?auto_2477036 ?auto_2477049 ) ) ( not ( = ?auto_2477036 ?auto_2477050 ) ) ( not ( = ?auto_2477036 ?auto_2477051 ) ) ( not ( = ?auto_2477037 ?auto_2477038 ) ) ( not ( = ?auto_2477037 ?auto_2477039 ) ) ( not ( = ?auto_2477037 ?auto_2477040 ) ) ( not ( = ?auto_2477037 ?auto_2477041 ) ) ( not ( = ?auto_2477037 ?auto_2477042 ) ) ( not ( = ?auto_2477037 ?auto_2477043 ) ) ( not ( = ?auto_2477037 ?auto_2477044 ) ) ( not ( = ?auto_2477037 ?auto_2477045 ) ) ( not ( = ?auto_2477037 ?auto_2477046 ) ) ( not ( = ?auto_2477037 ?auto_2477047 ) ) ( not ( = ?auto_2477037 ?auto_2477048 ) ) ( not ( = ?auto_2477037 ?auto_2477049 ) ) ( not ( = ?auto_2477037 ?auto_2477050 ) ) ( not ( = ?auto_2477037 ?auto_2477051 ) ) ( not ( = ?auto_2477038 ?auto_2477039 ) ) ( not ( = ?auto_2477038 ?auto_2477040 ) ) ( not ( = ?auto_2477038 ?auto_2477041 ) ) ( not ( = ?auto_2477038 ?auto_2477042 ) ) ( not ( = ?auto_2477038 ?auto_2477043 ) ) ( not ( = ?auto_2477038 ?auto_2477044 ) ) ( not ( = ?auto_2477038 ?auto_2477045 ) ) ( not ( = ?auto_2477038 ?auto_2477046 ) ) ( not ( = ?auto_2477038 ?auto_2477047 ) ) ( not ( = ?auto_2477038 ?auto_2477048 ) ) ( not ( = ?auto_2477038 ?auto_2477049 ) ) ( not ( = ?auto_2477038 ?auto_2477050 ) ) ( not ( = ?auto_2477038 ?auto_2477051 ) ) ( not ( = ?auto_2477039 ?auto_2477040 ) ) ( not ( = ?auto_2477039 ?auto_2477041 ) ) ( not ( = ?auto_2477039 ?auto_2477042 ) ) ( not ( = ?auto_2477039 ?auto_2477043 ) ) ( not ( = ?auto_2477039 ?auto_2477044 ) ) ( not ( = ?auto_2477039 ?auto_2477045 ) ) ( not ( = ?auto_2477039 ?auto_2477046 ) ) ( not ( = ?auto_2477039 ?auto_2477047 ) ) ( not ( = ?auto_2477039 ?auto_2477048 ) ) ( not ( = ?auto_2477039 ?auto_2477049 ) ) ( not ( = ?auto_2477039 ?auto_2477050 ) ) ( not ( = ?auto_2477039 ?auto_2477051 ) ) ( not ( = ?auto_2477040 ?auto_2477041 ) ) ( not ( = ?auto_2477040 ?auto_2477042 ) ) ( not ( = ?auto_2477040 ?auto_2477043 ) ) ( not ( = ?auto_2477040 ?auto_2477044 ) ) ( not ( = ?auto_2477040 ?auto_2477045 ) ) ( not ( = ?auto_2477040 ?auto_2477046 ) ) ( not ( = ?auto_2477040 ?auto_2477047 ) ) ( not ( = ?auto_2477040 ?auto_2477048 ) ) ( not ( = ?auto_2477040 ?auto_2477049 ) ) ( not ( = ?auto_2477040 ?auto_2477050 ) ) ( not ( = ?auto_2477040 ?auto_2477051 ) ) ( not ( = ?auto_2477041 ?auto_2477042 ) ) ( not ( = ?auto_2477041 ?auto_2477043 ) ) ( not ( = ?auto_2477041 ?auto_2477044 ) ) ( not ( = ?auto_2477041 ?auto_2477045 ) ) ( not ( = ?auto_2477041 ?auto_2477046 ) ) ( not ( = ?auto_2477041 ?auto_2477047 ) ) ( not ( = ?auto_2477041 ?auto_2477048 ) ) ( not ( = ?auto_2477041 ?auto_2477049 ) ) ( not ( = ?auto_2477041 ?auto_2477050 ) ) ( not ( = ?auto_2477041 ?auto_2477051 ) ) ( not ( = ?auto_2477042 ?auto_2477043 ) ) ( not ( = ?auto_2477042 ?auto_2477044 ) ) ( not ( = ?auto_2477042 ?auto_2477045 ) ) ( not ( = ?auto_2477042 ?auto_2477046 ) ) ( not ( = ?auto_2477042 ?auto_2477047 ) ) ( not ( = ?auto_2477042 ?auto_2477048 ) ) ( not ( = ?auto_2477042 ?auto_2477049 ) ) ( not ( = ?auto_2477042 ?auto_2477050 ) ) ( not ( = ?auto_2477042 ?auto_2477051 ) ) ( not ( = ?auto_2477043 ?auto_2477044 ) ) ( not ( = ?auto_2477043 ?auto_2477045 ) ) ( not ( = ?auto_2477043 ?auto_2477046 ) ) ( not ( = ?auto_2477043 ?auto_2477047 ) ) ( not ( = ?auto_2477043 ?auto_2477048 ) ) ( not ( = ?auto_2477043 ?auto_2477049 ) ) ( not ( = ?auto_2477043 ?auto_2477050 ) ) ( not ( = ?auto_2477043 ?auto_2477051 ) ) ( not ( = ?auto_2477044 ?auto_2477045 ) ) ( not ( = ?auto_2477044 ?auto_2477046 ) ) ( not ( = ?auto_2477044 ?auto_2477047 ) ) ( not ( = ?auto_2477044 ?auto_2477048 ) ) ( not ( = ?auto_2477044 ?auto_2477049 ) ) ( not ( = ?auto_2477044 ?auto_2477050 ) ) ( not ( = ?auto_2477044 ?auto_2477051 ) ) ( not ( = ?auto_2477045 ?auto_2477046 ) ) ( not ( = ?auto_2477045 ?auto_2477047 ) ) ( not ( = ?auto_2477045 ?auto_2477048 ) ) ( not ( = ?auto_2477045 ?auto_2477049 ) ) ( not ( = ?auto_2477045 ?auto_2477050 ) ) ( not ( = ?auto_2477045 ?auto_2477051 ) ) ( not ( = ?auto_2477046 ?auto_2477047 ) ) ( not ( = ?auto_2477046 ?auto_2477048 ) ) ( not ( = ?auto_2477046 ?auto_2477049 ) ) ( not ( = ?auto_2477046 ?auto_2477050 ) ) ( not ( = ?auto_2477046 ?auto_2477051 ) ) ( not ( = ?auto_2477047 ?auto_2477048 ) ) ( not ( = ?auto_2477047 ?auto_2477049 ) ) ( not ( = ?auto_2477047 ?auto_2477050 ) ) ( not ( = ?auto_2477047 ?auto_2477051 ) ) ( not ( = ?auto_2477048 ?auto_2477049 ) ) ( not ( = ?auto_2477048 ?auto_2477050 ) ) ( not ( = ?auto_2477048 ?auto_2477051 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2477049 ?auto_2477050 ?auto_2477051 )
      ( MAKE-15CRATE-VERIFY ?auto_2477036 ?auto_2477037 ?auto_2477038 ?auto_2477039 ?auto_2477040 ?auto_2477041 ?auto_2477042 ?auto_2477043 ?auto_2477044 ?auto_2477045 ?auto_2477046 ?auto_2477047 ?auto_2477048 ?auto_2477049 ?auto_2477050 ?auto_2477051 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2477231 - SURFACE
      ?auto_2477232 - SURFACE
      ?auto_2477233 - SURFACE
      ?auto_2477234 - SURFACE
      ?auto_2477235 - SURFACE
      ?auto_2477236 - SURFACE
      ?auto_2477237 - SURFACE
      ?auto_2477238 - SURFACE
      ?auto_2477239 - SURFACE
      ?auto_2477240 - SURFACE
      ?auto_2477241 - SURFACE
      ?auto_2477242 - SURFACE
      ?auto_2477243 - SURFACE
      ?auto_2477244 - SURFACE
      ?auto_2477245 - SURFACE
      ?auto_2477246 - SURFACE
    )
    :vars
    (
      ?auto_2477250 - HOIST
      ?auto_2477249 - PLACE
      ?auto_2477248 - TRUCK
      ?auto_2477247 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2477250 ?auto_2477249 ) ( SURFACE-AT ?auto_2477245 ?auto_2477249 ) ( CLEAR ?auto_2477245 ) ( IS-CRATE ?auto_2477246 ) ( not ( = ?auto_2477245 ?auto_2477246 ) ) ( AVAILABLE ?auto_2477250 ) ( IN ?auto_2477246 ?auto_2477248 ) ( ON ?auto_2477245 ?auto_2477244 ) ( not ( = ?auto_2477244 ?auto_2477245 ) ) ( not ( = ?auto_2477244 ?auto_2477246 ) ) ( TRUCK-AT ?auto_2477248 ?auto_2477247 ) ( not ( = ?auto_2477247 ?auto_2477249 ) ) ( ON ?auto_2477232 ?auto_2477231 ) ( ON ?auto_2477233 ?auto_2477232 ) ( ON ?auto_2477234 ?auto_2477233 ) ( ON ?auto_2477235 ?auto_2477234 ) ( ON ?auto_2477236 ?auto_2477235 ) ( ON ?auto_2477237 ?auto_2477236 ) ( ON ?auto_2477238 ?auto_2477237 ) ( ON ?auto_2477239 ?auto_2477238 ) ( ON ?auto_2477240 ?auto_2477239 ) ( ON ?auto_2477241 ?auto_2477240 ) ( ON ?auto_2477242 ?auto_2477241 ) ( ON ?auto_2477243 ?auto_2477242 ) ( ON ?auto_2477244 ?auto_2477243 ) ( not ( = ?auto_2477231 ?auto_2477232 ) ) ( not ( = ?auto_2477231 ?auto_2477233 ) ) ( not ( = ?auto_2477231 ?auto_2477234 ) ) ( not ( = ?auto_2477231 ?auto_2477235 ) ) ( not ( = ?auto_2477231 ?auto_2477236 ) ) ( not ( = ?auto_2477231 ?auto_2477237 ) ) ( not ( = ?auto_2477231 ?auto_2477238 ) ) ( not ( = ?auto_2477231 ?auto_2477239 ) ) ( not ( = ?auto_2477231 ?auto_2477240 ) ) ( not ( = ?auto_2477231 ?auto_2477241 ) ) ( not ( = ?auto_2477231 ?auto_2477242 ) ) ( not ( = ?auto_2477231 ?auto_2477243 ) ) ( not ( = ?auto_2477231 ?auto_2477244 ) ) ( not ( = ?auto_2477231 ?auto_2477245 ) ) ( not ( = ?auto_2477231 ?auto_2477246 ) ) ( not ( = ?auto_2477232 ?auto_2477233 ) ) ( not ( = ?auto_2477232 ?auto_2477234 ) ) ( not ( = ?auto_2477232 ?auto_2477235 ) ) ( not ( = ?auto_2477232 ?auto_2477236 ) ) ( not ( = ?auto_2477232 ?auto_2477237 ) ) ( not ( = ?auto_2477232 ?auto_2477238 ) ) ( not ( = ?auto_2477232 ?auto_2477239 ) ) ( not ( = ?auto_2477232 ?auto_2477240 ) ) ( not ( = ?auto_2477232 ?auto_2477241 ) ) ( not ( = ?auto_2477232 ?auto_2477242 ) ) ( not ( = ?auto_2477232 ?auto_2477243 ) ) ( not ( = ?auto_2477232 ?auto_2477244 ) ) ( not ( = ?auto_2477232 ?auto_2477245 ) ) ( not ( = ?auto_2477232 ?auto_2477246 ) ) ( not ( = ?auto_2477233 ?auto_2477234 ) ) ( not ( = ?auto_2477233 ?auto_2477235 ) ) ( not ( = ?auto_2477233 ?auto_2477236 ) ) ( not ( = ?auto_2477233 ?auto_2477237 ) ) ( not ( = ?auto_2477233 ?auto_2477238 ) ) ( not ( = ?auto_2477233 ?auto_2477239 ) ) ( not ( = ?auto_2477233 ?auto_2477240 ) ) ( not ( = ?auto_2477233 ?auto_2477241 ) ) ( not ( = ?auto_2477233 ?auto_2477242 ) ) ( not ( = ?auto_2477233 ?auto_2477243 ) ) ( not ( = ?auto_2477233 ?auto_2477244 ) ) ( not ( = ?auto_2477233 ?auto_2477245 ) ) ( not ( = ?auto_2477233 ?auto_2477246 ) ) ( not ( = ?auto_2477234 ?auto_2477235 ) ) ( not ( = ?auto_2477234 ?auto_2477236 ) ) ( not ( = ?auto_2477234 ?auto_2477237 ) ) ( not ( = ?auto_2477234 ?auto_2477238 ) ) ( not ( = ?auto_2477234 ?auto_2477239 ) ) ( not ( = ?auto_2477234 ?auto_2477240 ) ) ( not ( = ?auto_2477234 ?auto_2477241 ) ) ( not ( = ?auto_2477234 ?auto_2477242 ) ) ( not ( = ?auto_2477234 ?auto_2477243 ) ) ( not ( = ?auto_2477234 ?auto_2477244 ) ) ( not ( = ?auto_2477234 ?auto_2477245 ) ) ( not ( = ?auto_2477234 ?auto_2477246 ) ) ( not ( = ?auto_2477235 ?auto_2477236 ) ) ( not ( = ?auto_2477235 ?auto_2477237 ) ) ( not ( = ?auto_2477235 ?auto_2477238 ) ) ( not ( = ?auto_2477235 ?auto_2477239 ) ) ( not ( = ?auto_2477235 ?auto_2477240 ) ) ( not ( = ?auto_2477235 ?auto_2477241 ) ) ( not ( = ?auto_2477235 ?auto_2477242 ) ) ( not ( = ?auto_2477235 ?auto_2477243 ) ) ( not ( = ?auto_2477235 ?auto_2477244 ) ) ( not ( = ?auto_2477235 ?auto_2477245 ) ) ( not ( = ?auto_2477235 ?auto_2477246 ) ) ( not ( = ?auto_2477236 ?auto_2477237 ) ) ( not ( = ?auto_2477236 ?auto_2477238 ) ) ( not ( = ?auto_2477236 ?auto_2477239 ) ) ( not ( = ?auto_2477236 ?auto_2477240 ) ) ( not ( = ?auto_2477236 ?auto_2477241 ) ) ( not ( = ?auto_2477236 ?auto_2477242 ) ) ( not ( = ?auto_2477236 ?auto_2477243 ) ) ( not ( = ?auto_2477236 ?auto_2477244 ) ) ( not ( = ?auto_2477236 ?auto_2477245 ) ) ( not ( = ?auto_2477236 ?auto_2477246 ) ) ( not ( = ?auto_2477237 ?auto_2477238 ) ) ( not ( = ?auto_2477237 ?auto_2477239 ) ) ( not ( = ?auto_2477237 ?auto_2477240 ) ) ( not ( = ?auto_2477237 ?auto_2477241 ) ) ( not ( = ?auto_2477237 ?auto_2477242 ) ) ( not ( = ?auto_2477237 ?auto_2477243 ) ) ( not ( = ?auto_2477237 ?auto_2477244 ) ) ( not ( = ?auto_2477237 ?auto_2477245 ) ) ( not ( = ?auto_2477237 ?auto_2477246 ) ) ( not ( = ?auto_2477238 ?auto_2477239 ) ) ( not ( = ?auto_2477238 ?auto_2477240 ) ) ( not ( = ?auto_2477238 ?auto_2477241 ) ) ( not ( = ?auto_2477238 ?auto_2477242 ) ) ( not ( = ?auto_2477238 ?auto_2477243 ) ) ( not ( = ?auto_2477238 ?auto_2477244 ) ) ( not ( = ?auto_2477238 ?auto_2477245 ) ) ( not ( = ?auto_2477238 ?auto_2477246 ) ) ( not ( = ?auto_2477239 ?auto_2477240 ) ) ( not ( = ?auto_2477239 ?auto_2477241 ) ) ( not ( = ?auto_2477239 ?auto_2477242 ) ) ( not ( = ?auto_2477239 ?auto_2477243 ) ) ( not ( = ?auto_2477239 ?auto_2477244 ) ) ( not ( = ?auto_2477239 ?auto_2477245 ) ) ( not ( = ?auto_2477239 ?auto_2477246 ) ) ( not ( = ?auto_2477240 ?auto_2477241 ) ) ( not ( = ?auto_2477240 ?auto_2477242 ) ) ( not ( = ?auto_2477240 ?auto_2477243 ) ) ( not ( = ?auto_2477240 ?auto_2477244 ) ) ( not ( = ?auto_2477240 ?auto_2477245 ) ) ( not ( = ?auto_2477240 ?auto_2477246 ) ) ( not ( = ?auto_2477241 ?auto_2477242 ) ) ( not ( = ?auto_2477241 ?auto_2477243 ) ) ( not ( = ?auto_2477241 ?auto_2477244 ) ) ( not ( = ?auto_2477241 ?auto_2477245 ) ) ( not ( = ?auto_2477241 ?auto_2477246 ) ) ( not ( = ?auto_2477242 ?auto_2477243 ) ) ( not ( = ?auto_2477242 ?auto_2477244 ) ) ( not ( = ?auto_2477242 ?auto_2477245 ) ) ( not ( = ?auto_2477242 ?auto_2477246 ) ) ( not ( = ?auto_2477243 ?auto_2477244 ) ) ( not ( = ?auto_2477243 ?auto_2477245 ) ) ( not ( = ?auto_2477243 ?auto_2477246 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2477244 ?auto_2477245 ?auto_2477246 )
      ( MAKE-15CRATE-VERIFY ?auto_2477231 ?auto_2477232 ?auto_2477233 ?auto_2477234 ?auto_2477235 ?auto_2477236 ?auto_2477237 ?auto_2477238 ?auto_2477239 ?auto_2477240 ?auto_2477241 ?auto_2477242 ?auto_2477243 ?auto_2477244 ?auto_2477245 ?auto_2477246 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2477441 - SURFACE
      ?auto_2477442 - SURFACE
      ?auto_2477443 - SURFACE
      ?auto_2477444 - SURFACE
      ?auto_2477445 - SURFACE
      ?auto_2477446 - SURFACE
      ?auto_2477447 - SURFACE
      ?auto_2477448 - SURFACE
      ?auto_2477449 - SURFACE
      ?auto_2477450 - SURFACE
      ?auto_2477451 - SURFACE
      ?auto_2477452 - SURFACE
      ?auto_2477453 - SURFACE
      ?auto_2477454 - SURFACE
      ?auto_2477455 - SURFACE
      ?auto_2477456 - SURFACE
    )
    :vars
    (
      ?auto_2477458 - HOIST
      ?auto_2477461 - PLACE
      ?auto_2477457 - TRUCK
      ?auto_2477460 - PLACE
      ?auto_2477459 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2477458 ?auto_2477461 ) ( SURFACE-AT ?auto_2477455 ?auto_2477461 ) ( CLEAR ?auto_2477455 ) ( IS-CRATE ?auto_2477456 ) ( not ( = ?auto_2477455 ?auto_2477456 ) ) ( AVAILABLE ?auto_2477458 ) ( ON ?auto_2477455 ?auto_2477454 ) ( not ( = ?auto_2477454 ?auto_2477455 ) ) ( not ( = ?auto_2477454 ?auto_2477456 ) ) ( TRUCK-AT ?auto_2477457 ?auto_2477460 ) ( not ( = ?auto_2477460 ?auto_2477461 ) ) ( HOIST-AT ?auto_2477459 ?auto_2477460 ) ( LIFTING ?auto_2477459 ?auto_2477456 ) ( not ( = ?auto_2477458 ?auto_2477459 ) ) ( ON ?auto_2477442 ?auto_2477441 ) ( ON ?auto_2477443 ?auto_2477442 ) ( ON ?auto_2477444 ?auto_2477443 ) ( ON ?auto_2477445 ?auto_2477444 ) ( ON ?auto_2477446 ?auto_2477445 ) ( ON ?auto_2477447 ?auto_2477446 ) ( ON ?auto_2477448 ?auto_2477447 ) ( ON ?auto_2477449 ?auto_2477448 ) ( ON ?auto_2477450 ?auto_2477449 ) ( ON ?auto_2477451 ?auto_2477450 ) ( ON ?auto_2477452 ?auto_2477451 ) ( ON ?auto_2477453 ?auto_2477452 ) ( ON ?auto_2477454 ?auto_2477453 ) ( not ( = ?auto_2477441 ?auto_2477442 ) ) ( not ( = ?auto_2477441 ?auto_2477443 ) ) ( not ( = ?auto_2477441 ?auto_2477444 ) ) ( not ( = ?auto_2477441 ?auto_2477445 ) ) ( not ( = ?auto_2477441 ?auto_2477446 ) ) ( not ( = ?auto_2477441 ?auto_2477447 ) ) ( not ( = ?auto_2477441 ?auto_2477448 ) ) ( not ( = ?auto_2477441 ?auto_2477449 ) ) ( not ( = ?auto_2477441 ?auto_2477450 ) ) ( not ( = ?auto_2477441 ?auto_2477451 ) ) ( not ( = ?auto_2477441 ?auto_2477452 ) ) ( not ( = ?auto_2477441 ?auto_2477453 ) ) ( not ( = ?auto_2477441 ?auto_2477454 ) ) ( not ( = ?auto_2477441 ?auto_2477455 ) ) ( not ( = ?auto_2477441 ?auto_2477456 ) ) ( not ( = ?auto_2477442 ?auto_2477443 ) ) ( not ( = ?auto_2477442 ?auto_2477444 ) ) ( not ( = ?auto_2477442 ?auto_2477445 ) ) ( not ( = ?auto_2477442 ?auto_2477446 ) ) ( not ( = ?auto_2477442 ?auto_2477447 ) ) ( not ( = ?auto_2477442 ?auto_2477448 ) ) ( not ( = ?auto_2477442 ?auto_2477449 ) ) ( not ( = ?auto_2477442 ?auto_2477450 ) ) ( not ( = ?auto_2477442 ?auto_2477451 ) ) ( not ( = ?auto_2477442 ?auto_2477452 ) ) ( not ( = ?auto_2477442 ?auto_2477453 ) ) ( not ( = ?auto_2477442 ?auto_2477454 ) ) ( not ( = ?auto_2477442 ?auto_2477455 ) ) ( not ( = ?auto_2477442 ?auto_2477456 ) ) ( not ( = ?auto_2477443 ?auto_2477444 ) ) ( not ( = ?auto_2477443 ?auto_2477445 ) ) ( not ( = ?auto_2477443 ?auto_2477446 ) ) ( not ( = ?auto_2477443 ?auto_2477447 ) ) ( not ( = ?auto_2477443 ?auto_2477448 ) ) ( not ( = ?auto_2477443 ?auto_2477449 ) ) ( not ( = ?auto_2477443 ?auto_2477450 ) ) ( not ( = ?auto_2477443 ?auto_2477451 ) ) ( not ( = ?auto_2477443 ?auto_2477452 ) ) ( not ( = ?auto_2477443 ?auto_2477453 ) ) ( not ( = ?auto_2477443 ?auto_2477454 ) ) ( not ( = ?auto_2477443 ?auto_2477455 ) ) ( not ( = ?auto_2477443 ?auto_2477456 ) ) ( not ( = ?auto_2477444 ?auto_2477445 ) ) ( not ( = ?auto_2477444 ?auto_2477446 ) ) ( not ( = ?auto_2477444 ?auto_2477447 ) ) ( not ( = ?auto_2477444 ?auto_2477448 ) ) ( not ( = ?auto_2477444 ?auto_2477449 ) ) ( not ( = ?auto_2477444 ?auto_2477450 ) ) ( not ( = ?auto_2477444 ?auto_2477451 ) ) ( not ( = ?auto_2477444 ?auto_2477452 ) ) ( not ( = ?auto_2477444 ?auto_2477453 ) ) ( not ( = ?auto_2477444 ?auto_2477454 ) ) ( not ( = ?auto_2477444 ?auto_2477455 ) ) ( not ( = ?auto_2477444 ?auto_2477456 ) ) ( not ( = ?auto_2477445 ?auto_2477446 ) ) ( not ( = ?auto_2477445 ?auto_2477447 ) ) ( not ( = ?auto_2477445 ?auto_2477448 ) ) ( not ( = ?auto_2477445 ?auto_2477449 ) ) ( not ( = ?auto_2477445 ?auto_2477450 ) ) ( not ( = ?auto_2477445 ?auto_2477451 ) ) ( not ( = ?auto_2477445 ?auto_2477452 ) ) ( not ( = ?auto_2477445 ?auto_2477453 ) ) ( not ( = ?auto_2477445 ?auto_2477454 ) ) ( not ( = ?auto_2477445 ?auto_2477455 ) ) ( not ( = ?auto_2477445 ?auto_2477456 ) ) ( not ( = ?auto_2477446 ?auto_2477447 ) ) ( not ( = ?auto_2477446 ?auto_2477448 ) ) ( not ( = ?auto_2477446 ?auto_2477449 ) ) ( not ( = ?auto_2477446 ?auto_2477450 ) ) ( not ( = ?auto_2477446 ?auto_2477451 ) ) ( not ( = ?auto_2477446 ?auto_2477452 ) ) ( not ( = ?auto_2477446 ?auto_2477453 ) ) ( not ( = ?auto_2477446 ?auto_2477454 ) ) ( not ( = ?auto_2477446 ?auto_2477455 ) ) ( not ( = ?auto_2477446 ?auto_2477456 ) ) ( not ( = ?auto_2477447 ?auto_2477448 ) ) ( not ( = ?auto_2477447 ?auto_2477449 ) ) ( not ( = ?auto_2477447 ?auto_2477450 ) ) ( not ( = ?auto_2477447 ?auto_2477451 ) ) ( not ( = ?auto_2477447 ?auto_2477452 ) ) ( not ( = ?auto_2477447 ?auto_2477453 ) ) ( not ( = ?auto_2477447 ?auto_2477454 ) ) ( not ( = ?auto_2477447 ?auto_2477455 ) ) ( not ( = ?auto_2477447 ?auto_2477456 ) ) ( not ( = ?auto_2477448 ?auto_2477449 ) ) ( not ( = ?auto_2477448 ?auto_2477450 ) ) ( not ( = ?auto_2477448 ?auto_2477451 ) ) ( not ( = ?auto_2477448 ?auto_2477452 ) ) ( not ( = ?auto_2477448 ?auto_2477453 ) ) ( not ( = ?auto_2477448 ?auto_2477454 ) ) ( not ( = ?auto_2477448 ?auto_2477455 ) ) ( not ( = ?auto_2477448 ?auto_2477456 ) ) ( not ( = ?auto_2477449 ?auto_2477450 ) ) ( not ( = ?auto_2477449 ?auto_2477451 ) ) ( not ( = ?auto_2477449 ?auto_2477452 ) ) ( not ( = ?auto_2477449 ?auto_2477453 ) ) ( not ( = ?auto_2477449 ?auto_2477454 ) ) ( not ( = ?auto_2477449 ?auto_2477455 ) ) ( not ( = ?auto_2477449 ?auto_2477456 ) ) ( not ( = ?auto_2477450 ?auto_2477451 ) ) ( not ( = ?auto_2477450 ?auto_2477452 ) ) ( not ( = ?auto_2477450 ?auto_2477453 ) ) ( not ( = ?auto_2477450 ?auto_2477454 ) ) ( not ( = ?auto_2477450 ?auto_2477455 ) ) ( not ( = ?auto_2477450 ?auto_2477456 ) ) ( not ( = ?auto_2477451 ?auto_2477452 ) ) ( not ( = ?auto_2477451 ?auto_2477453 ) ) ( not ( = ?auto_2477451 ?auto_2477454 ) ) ( not ( = ?auto_2477451 ?auto_2477455 ) ) ( not ( = ?auto_2477451 ?auto_2477456 ) ) ( not ( = ?auto_2477452 ?auto_2477453 ) ) ( not ( = ?auto_2477452 ?auto_2477454 ) ) ( not ( = ?auto_2477452 ?auto_2477455 ) ) ( not ( = ?auto_2477452 ?auto_2477456 ) ) ( not ( = ?auto_2477453 ?auto_2477454 ) ) ( not ( = ?auto_2477453 ?auto_2477455 ) ) ( not ( = ?auto_2477453 ?auto_2477456 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2477454 ?auto_2477455 ?auto_2477456 )
      ( MAKE-15CRATE-VERIFY ?auto_2477441 ?auto_2477442 ?auto_2477443 ?auto_2477444 ?auto_2477445 ?auto_2477446 ?auto_2477447 ?auto_2477448 ?auto_2477449 ?auto_2477450 ?auto_2477451 ?auto_2477452 ?auto_2477453 ?auto_2477454 ?auto_2477455 ?auto_2477456 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2477666 - SURFACE
      ?auto_2477667 - SURFACE
      ?auto_2477668 - SURFACE
      ?auto_2477669 - SURFACE
      ?auto_2477670 - SURFACE
      ?auto_2477671 - SURFACE
      ?auto_2477672 - SURFACE
      ?auto_2477673 - SURFACE
      ?auto_2477674 - SURFACE
      ?auto_2477675 - SURFACE
      ?auto_2477676 - SURFACE
      ?auto_2477677 - SURFACE
      ?auto_2477678 - SURFACE
      ?auto_2477679 - SURFACE
      ?auto_2477680 - SURFACE
      ?auto_2477681 - SURFACE
    )
    :vars
    (
      ?auto_2477686 - HOIST
      ?auto_2477683 - PLACE
      ?auto_2477685 - TRUCK
      ?auto_2477682 - PLACE
      ?auto_2477684 - HOIST
      ?auto_2477687 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2477686 ?auto_2477683 ) ( SURFACE-AT ?auto_2477680 ?auto_2477683 ) ( CLEAR ?auto_2477680 ) ( IS-CRATE ?auto_2477681 ) ( not ( = ?auto_2477680 ?auto_2477681 ) ) ( AVAILABLE ?auto_2477686 ) ( ON ?auto_2477680 ?auto_2477679 ) ( not ( = ?auto_2477679 ?auto_2477680 ) ) ( not ( = ?auto_2477679 ?auto_2477681 ) ) ( TRUCK-AT ?auto_2477685 ?auto_2477682 ) ( not ( = ?auto_2477682 ?auto_2477683 ) ) ( HOIST-AT ?auto_2477684 ?auto_2477682 ) ( not ( = ?auto_2477686 ?auto_2477684 ) ) ( AVAILABLE ?auto_2477684 ) ( SURFACE-AT ?auto_2477681 ?auto_2477682 ) ( ON ?auto_2477681 ?auto_2477687 ) ( CLEAR ?auto_2477681 ) ( not ( = ?auto_2477680 ?auto_2477687 ) ) ( not ( = ?auto_2477681 ?auto_2477687 ) ) ( not ( = ?auto_2477679 ?auto_2477687 ) ) ( ON ?auto_2477667 ?auto_2477666 ) ( ON ?auto_2477668 ?auto_2477667 ) ( ON ?auto_2477669 ?auto_2477668 ) ( ON ?auto_2477670 ?auto_2477669 ) ( ON ?auto_2477671 ?auto_2477670 ) ( ON ?auto_2477672 ?auto_2477671 ) ( ON ?auto_2477673 ?auto_2477672 ) ( ON ?auto_2477674 ?auto_2477673 ) ( ON ?auto_2477675 ?auto_2477674 ) ( ON ?auto_2477676 ?auto_2477675 ) ( ON ?auto_2477677 ?auto_2477676 ) ( ON ?auto_2477678 ?auto_2477677 ) ( ON ?auto_2477679 ?auto_2477678 ) ( not ( = ?auto_2477666 ?auto_2477667 ) ) ( not ( = ?auto_2477666 ?auto_2477668 ) ) ( not ( = ?auto_2477666 ?auto_2477669 ) ) ( not ( = ?auto_2477666 ?auto_2477670 ) ) ( not ( = ?auto_2477666 ?auto_2477671 ) ) ( not ( = ?auto_2477666 ?auto_2477672 ) ) ( not ( = ?auto_2477666 ?auto_2477673 ) ) ( not ( = ?auto_2477666 ?auto_2477674 ) ) ( not ( = ?auto_2477666 ?auto_2477675 ) ) ( not ( = ?auto_2477666 ?auto_2477676 ) ) ( not ( = ?auto_2477666 ?auto_2477677 ) ) ( not ( = ?auto_2477666 ?auto_2477678 ) ) ( not ( = ?auto_2477666 ?auto_2477679 ) ) ( not ( = ?auto_2477666 ?auto_2477680 ) ) ( not ( = ?auto_2477666 ?auto_2477681 ) ) ( not ( = ?auto_2477666 ?auto_2477687 ) ) ( not ( = ?auto_2477667 ?auto_2477668 ) ) ( not ( = ?auto_2477667 ?auto_2477669 ) ) ( not ( = ?auto_2477667 ?auto_2477670 ) ) ( not ( = ?auto_2477667 ?auto_2477671 ) ) ( not ( = ?auto_2477667 ?auto_2477672 ) ) ( not ( = ?auto_2477667 ?auto_2477673 ) ) ( not ( = ?auto_2477667 ?auto_2477674 ) ) ( not ( = ?auto_2477667 ?auto_2477675 ) ) ( not ( = ?auto_2477667 ?auto_2477676 ) ) ( not ( = ?auto_2477667 ?auto_2477677 ) ) ( not ( = ?auto_2477667 ?auto_2477678 ) ) ( not ( = ?auto_2477667 ?auto_2477679 ) ) ( not ( = ?auto_2477667 ?auto_2477680 ) ) ( not ( = ?auto_2477667 ?auto_2477681 ) ) ( not ( = ?auto_2477667 ?auto_2477687 ) ) ( not ( = ?auto_2477668 ?auto_2477669 ) ) ( not ( = ?auto_2477668 ?auto_2477670 ) ) ( not ( = ?auto_2477668 ?auto_2477671 ) ) ( not ( = ?auto_2477668 ?auto_2477672 ) ) ( not ( = ?auto_2477668 ?auto_2477673 ) ) ( not ( = ?auto_2477668 ?auto_2477674 ) ) ( not ( = ?auto_2477668 ?auto_2477675 ) ) ( not ( = ?auto_2477668 ?auto_2477676 ) ) ( not ( = ?auto_2477668 ?auto_2477677 ) ) ( not ( = ?auto_2477668 ?auto_2477678 ) ) ( not ( = ?auto_2477668 ?auto_2477679 ) ) ( not ( = ?auto_2477668 ?auto_2477680 ) ) ( not ( = ?auto_2477668 ?auto_2477681 ) ) ( not ( = ?auto_2477668 ?auto_2477687 ) ) ( not ( = ?auto_2477669 ?auto_2477670 ) ) ( not ( = ?auto_2477669 ?auto_2477671 ) ) ( not ( = ?auto_2477669 ?auto_2477672 ) ) ( not ( = ?auto_2477669 ?auto_2477673 ) ) ( not ( = ?auto_2477669 ?auto_2477674 ) ) ( not ( = ?auto_2477669 ?auto_2477675 ) ) ( not ( = ?auto_2477669 ?auto_2477676 ) ) ( not ( = ?auto_2477669 ?auto_2477677 ) ) ( not ( = ?auto_2477669 ?auto_2477678 ) ) ( not ( = ?auto_2477669 ?auto_2477679 ) ) ( not ( = ?auto_2477669 ?auto_2477680 ) ) ( not ( = ?auto_2477669 ?auto_2477681 ) ) ( not ( = ?auto_2477669 ?auto_2477687 ) ) ( not ( = ?auto_2477670 ?auto_2477671 ) ) ( not ( = ?auto_2477670 ?auto_2477672 ) ) ( not ( = ?auto_2477670 ?auto_2477673 ) ) ( not ( = ?auto_2477670 ?auto_2477674 ) ) ( not ( = ?auto_2477670 ?auto_2477675 ) ) ( not ( = ?auto_2477670 ?auto_2477676 ) ) ( not ( = ?auto_2477670 ?auto_2477677 ) ) ( not ( = ?auto_2477670 ?auto_2477678 ) ) ( not ( = ?auto_2477670 ?auto_2477679 ) ) ( not ( = ?auto_2477670 ?auto_2477680 ) ) ( not ( = ?auto_2477670 ?auto_2477681 ) ) ( not ( = ?auto_2477670 ?auto_2477687 ) ) ( not ( = ?auto_2477671 ?auto_2477672 ) ) ( not ( = ?auto_2477671 ?auto_2477673 ) ) ( not ( = ?auto_2477671 ?auto_2477674 ) ) ( not ( = ?auto_2477671 ?auto_2477675 ) ) ( not ( = ?auto_2477671 ?auto_2477676 ) ) ( not ( = ?auto_2477671 ?auto_2477677 ) ) ( not ( = ?auto_2477671 ?auto_2477678 ) ) ( not ( = ?auto_2477671 ?auto_2477679 ) ) ( not ( = ?auto_2477671 ?auto_2477680 ) ) ( not ( = ?auto_2477671 ?auto_2477681 ) ) ( not ( = ?auto_2477671 ?auto_2477687 ) ) ( not ( = ?auto_2477672 ?auto_2477673 ) ) ( not ( = ?auto_2477672 ?auto_2477674 ) ) ( not ( = ?auto_2477672 ?auto_2477675 ) ) ( not ( = ?auto_2477672 ?auto_2477676 ) ) ( not ( = ?auto_2477672 ?auto_2477677 ) ) ( not ( = ?auto_2477672 ?auto_2477678 ) ) ( not ( = ?auto_2477672 ?auto_2477679 ) ) ( not ( = ?auto_2477672 ?auto_2477680 ) ) ( not ( = ?auto_2477672 ?auto_2477681 ) ) ( not ( = ?auto_2477672 ?auto_2477687 ) ) ( not ( = ?auto_2477673 ?auto_2477674 ) ) ( not ( = ?auto_2477673 ?auto_2477675 ) ) ( not ( = ?auto_2477673 ?auto_2477676 ) ) ( not ( = ?auto_2477673 ?auto_2477677 ) ) ( not ( = ?auto_2477673 ?auto_2477678 ) ) ( not ( = ?auto_2477673 ?auto_2477679 ) ) ( not ( = ?auto_2477673 ?auto_2477680 ) ) ( not ( = ?auto_2477673 ?auto_2477681 ) ) ( not ( = ?auto_2477673 ?auto_2477687 ) ) ( not ( = ?auto_2477674 ?auto_2477675 ) ) ( not ( = ?auto_2477674 ?auto_2477676 ) ) ( not ( = ?auto_2477674 ?auto_2477677 ) ) ( not ( = ?auto_2477674 ?auto_2477678 ) ) ( not ( = ?auto_2477674 ?auto_2477679 ) ) ( not ( = ?auto_2477674 ?auto_2477680 ) ) ( not ( = ?auto_2477674 ?auto_2477681 ) ) ( not ( = ?auto_2477674 ?auto_2477687 ) ) ( not ( = ?auto_2477675 ?auto_2477676 ) ) ( not ( = ?auto_2477675 ?auto_2477677 ) ) ( not ( = ?auto_2477675 ?auto_2477678 ) ) ( not ( = ?auto_2477675 ?auto_2477679 ) ) ( not ( = ?auto_2477675 ?auto_2477680 ) ) ( not ( = ?auto_2477675 ?auto_2477681 ) ) ( not ( = ?auto_2477675 ?auto_2477687 ) ) ( not ( = ?auto_2477676 ?auto_2477677 ) ) ( not ( = ?auto_2477676 ?auto_2477678 ) ) ( not ( = ?auto_2477676 ?auto_2477679 ) ) ( not ( = ?auto_2477676 ?auto_2477680 ) ) ( not ( = ?auto_2477676 ?auto_2477681 ) ) ( not ( = ?auto_2477676 ?auto_2477687 ) ) ( not ( = ?auto_2477677 ?auto_2477678 ) ) ( not ( = ?auto_2477677 ?auto_2477679 ) ) ( not ( = ?auto_2477677 ?auto_2477680 ) ) ( not ( = ?auto_2477677 ?auto_2477681 ) ) ( not ( = ?auto_2477677 ?auto_2477687 ) ) ( not ( = ?auto_2477678 ?auto_2477679 ) ) ( not ( = ?auto_2477678 ?auto_2477680 ) ) ( not ( = ?auto_2477678 ?auto_2477681 ) ) ( not ( = ?auto_2477678 ?auto_2477687 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2477679 ?auto_2477680 ?auto_2477681 )
      ( MAKE-15CRATE-VERIFY ?auto_2477666 ?auto_2477667 ?auto_2477668 ?auto_2477669 ?auto_2477670 ?auto_2477671 ?auto_2477672 ?auto_2477673 ?auto_2477674 ?auto_2477675 ?auto_2477676 ?auto_2477677 ?auto_2477678 ?auto_2477679 ?auto_2477680 ?auto_2477681 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2477892 - SURFACE
      ?auto_2477893 - SURFACE
      ?auto_2477894 - SURFACE
      ?auto_2477895 - SURFACE
      ?auto_2477896 - SURFACE
      ?auto_2477897 - SURFACE
      ?auto_2477898 - SURFACE
      ?auto_2477899 - SURFACE
      ?auto_2477900 - SURFACE
      ?auto_2477901 - SURFACE
      ?auto_2477902 - SURFACE
      ?auto_2477903 - SURFACE
      ?auto_2477904 - SURFACE
      ?auto_2477905 - SURFACE
      ?auto_2477906 - SURFACE
      ?auto_2477907 - SURFACE
    )
    :vars
    (
      ?auto_2477913 - HOIST
      ?auto_2477911 - PLACE
      ?auto_2477910 - PLACE
      ?auto_2477909 - HOIST
      ?auto_2477908 - SURFACE
      ?auto_2477912 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2477913 ?auto_2477911 ) ( SURFACE-AT ?auto_2477906 ?auto_2477911 ) ( CLEAR ?auto_2477906 ) ( IS-CRATE ?auto_2477907 ) ( not ( = ?auto_2477906 ?auto_2477907 ) ) ( AVAILABLE ?auto_2477913 ) ( ON ?auto_2477906 ?auto_2477905 ) ( not ( = ?auto_2477905 ?auto_2477906 ) ) ( not ( = ?auto_2477905 ?auto_2477907 ) ) ( not ( = ?auto_2477910 ?auto_2477911 ) ) ( HOIST-AT ?auto_2477909 ?auto_2477910 ) ( not ( = ?auto_2477913 ?auto_2477909 ) ) ( AVAILABLE ?auto_2477909 ) ( SURFACE-AT ?auto_2477907 ?auto_2477910 ) ( ON ?auto_2477907 ?auto_2477908 ) ( CLEAR ?auto_2477907 ) ( not ( = ?auto_2477906 ?auto_2477908 ) ) ( not ( = ?auto_2477907 ?auto_2477908 ) ) ( not ( = ?auto_2477905 ?auto_2477908 ) ) ( TRUCK-AT ?auto_2477912 ?auto_2477911 ) ( ON ?auto_2477893 ?auto_2477892 ) ( ON ?auto_2477894 ?auto_2477893 ) ( ON ?auto_2477895 ?auto_2477894 ) ( ON ?auto_2477896 ?auto_2477895 ) ( ON ?auto_2477897 ?auto_2477896 ) ( ON ?auto_2477898 ?auto_2477897 ) ( ON ?auto_2477899 ?auto_2477898 ) ( ON ?auto_2477900 ?auto_2477899 ) ( ON ?auto_2477901 ?auto_2477900 ) ( ON ?auto_2477902 ?auto_2477901 ) ( ON ?auto_2477903 ?auto_2477902 ) ( ON ?auto_2477904 ?auto_2477903 ) ( ON ?auto_2477905 ?auto_2477904 ) ( not ( = ?auto_2477892 ?auto_2477893 ) ) ( not ( = ?auto_2477892 ?auto_2477894 ) ) ( not ( = ?auto_2477892 ?auto_2477895 ) ) ( not ( = ?auto_2477892 ?auto_2477896 ) ) ( not ( = ?auto_2477892 ?auto_2477897 ) ) ( not ( = ?auto_2477892 ?auto_2477898 ) ) ( not ( = ?auto_2477892 ?auto_2477899 ) ) ( not ( = ?auto_2477892 ?auto_2477900 ) ) ( not ( = ?auto_2477892 ?auto_2477901 ) ) ( not ( = ?auto_2477892 ?auto_2477902 ) ) ( not ( = ?auto_2477892 ?auto_2477903 ) ) ( not ( = ?auto_2477892 ?auto_2477904 ) ) ( not ( = ?auto_2477892 ?auto_2477905 ) ) ( not ( = ?auto_2477892 ?auto_2477906 ) ) ( not ( = ?auto_2477892 ?auto_2477907 ) ) ( not ( = ?auto_2477892 ?auto_2477908 ) ) ( not ( = ?auto_2477893 ?auto_2477894 ) ) ( not ( = ?auto_2477893 ?auto_2477895 ) ) ( not ( = ?auto_2477893 ?auto_2477896 ) ) ( not ( = ?auto_2477893 ?auto_2477897 ) ) ( not ( = ?auto_2477893 ?auto_2477898 ) ) ( not ( = ?auto_2477893 ?auto_2477899 ) ) ( not ( = ?auto_2477893 ?auto_2477900 ) ) ( not ( = ?auto_2477893 ?auto_2477901 ) ) ( not ( = ?auto_2477893 ?auto_2477902 ) ) ( not ( = ?auto_2477893 ?auto_2477903 ) ) ( not ( = ?auto_2477893 ?auto_2477904 ) ) ( not ( = ?auto_2477893 ?auto_2477905 ) ) ( not ( = ?auto_2477893 ?auto_2477906 ) ) ( not ( = ?auto_2477893 ?auto_2477907 ) ) ( not ( = ?auto_2477893 ?auto_2477908 ) ) ( not ( = ?auto_2477894 ?auto_2477895 ) ) ( not ( = ?auto_2477894 ?auto_2477896 ) ) ( not ( = ?auto_2477894 ?auto_2477897 ) ) ( not ( = ?auto_2477894 ?auto_2477898 ) ) ( not ( = ?auto_2477894 ?auto_2477899 ) ) ( not ( = ?auto_2477894 ?auto_2477900 ) ) ( not ( = ?auto_2477894 ?auto_2477901 ) ) ( not ( = ?auto_2477894 ?auto_2477902 ) ) ( not ( = ?auto_2477894 ?auto_2477903 ) ) ( not ( = ?auto_2477894 ?auto_2477904 ) ) ( not ( = ?auto_2477894 ?auto_2477905 ) ) ( not ( = ?auto_2477894 ?auto_2477906 ) ) ( not ( = ?auto_2477894 ?auto_2477907 ) ) ( not ( = ?auto_2477894 ?auto_2477908 ) ) ( not ( = ?auto_2477895 ?auto_2477896 ) ) ( not ( = ?auto_2477895 ?auto_2477897 ) ) ( not ( = ?auto_2477895 ?auto_2477898 ) ) ( not ( = ?auto_2477895 ?auto_2477899 ) ) ( not ( = ?auto_2477895 ?auto_2477900 ) ) ( not ( = ?auto_2477895 ?auto_2477901 ) ) ( not ( = ?auto_2477895 ?auto_2477902 ) ) ( not ( = ?auto_2477895 ?auto_2477903 ) ) ( not ( = ?auto_2477895 ?auto_2477904 ) ) ( not ( = ?auto_2477895 ?auto_2477905 ) ) ( not ( = ?auto_2477895 ?auto_2477906 ) ) ( not ( = ?auto_2477895 ?auto_2477907 ) ) ( not ( = ?auto_2477895 ?auto_2477908 ) ) ( not ( = ?auto_2477896 ?auto_2477897 ) ) ( not ( = ?auto_2477896 ?auto_2477898 ) ) ( not ( = ?auto_2477896 ?auto_2477899 ) ) ( not ( = ?auto_2477896 ?auto_2477900 ) ) ( not ( = ?auto_2477896 ?auto_2477901 ) ) ( not ( = ?auto_2477896 ?auto_2477902 ) ) ( not ( = ?auto_2477896 ?auto_2477903 ) ) ( not ( = ?auto_2477896 ?auto_2477904 ) ) ( not ( = ?auto_2477896 ?auto_2477905 ) ) ( not ( = ?auto_2477896 ?auto_2477906 ) ) ( not ( = ?auto_2477896 ?auto_2477907 ) ) ( not ( = ?auto_2477896 ?auto_2477908 ) ) ( not ( = ?auto_2477897 ?auto_2477898 ) ) ( not ( = ?auto_2477897 ?auto_2477899 ) ) ( not ( = ?auto_2477897 ?auto_2477900 ) ) ( not ( = ?auto_2477897 ?auto_2477901 ) ) ( not ( = ?auto_2477897 ?auto_2477902 ) ) ( not ( = ?auto_2477897 ?auto_2477903 ) ) ( not ( = ?auto_2477897 ?auto_2477904 ) ) ( not ( = ?auto_2477897 ?auto_2477905 ) ) ( not ( = ?auto_2477897 ?auto_2477906 ) ) ( not ( = ?auto_2477897 ?auto_2477907 ) ) ( not ( = ?auto_2477897 ?auto_2477908 ) ) ( not ( = ?auto_2477898 ?auto_2477899 ) ) ( not ( = ?auto_2477898 ?auto_2477900 ) ) ( not ( = ?auto_2477898 ?auto_2477901 ) ) ( not ( = ?auto_2477898 ?auto_2477902 ) ) ( not ( = ?auto_2477898 ?auto_2477903 ) ) ( not ( = ?auto_2477898 ?auto_2477904 ) ) ( not ( = ?auto_2477898 ?auto_2477905 ) ) ( not ( = ?auto_2477898 ?auto_2477906 ) ) ( not ( = ?auto_2477898 ?auto_2477907 ) ) ( not ( = ?auto_2477898 ?auto_2477908 ) ) ( not ( = ?auto_2477899 ?auto_2477900 ) ) ( not ( = ?auto_2477899 ?auto_2477901 ) ) ( not ( = ?auto_2477899 ?auto_2477902 ) ) ( not ( = ?auto_2477899 ?auto_2477903 ) ) ( not ( = ?auto_2477899 ?auto_2477904 ) ) ( not ( = ?auto_2477899 ?auto_2477905 ) ) ( not ( = ?auto_2477899 ?auto_2477906 ) ) ( not ( = ?auto_2477899 ?auto_2477907 ) ) ( not ( = ?auto_2477899 ?auto_2477908 ) ) ( not ( = ?auto_2477900 ?auto_2477901 ) ) ( not ( = ?auto_2477900 ?auto_2477902 ) ) ( not ( = ?auto_2477900 ?auto_2477903 ) ) ( not ( = ?auto_2477900 ?auto_2477904 ) ) ( not ( = ?auto_2477900 ?auto_2477905 ) ) ( not ( = ?auto_2477900 ?auto_2477906 ) ) ( not ( = ?auto_2477900 ?auto_2477907 ) ) ( not ( = ?auto_2477900 ?auto_2477908 ) ) ( not ( = ?auto_2477901 ?auto_2477902 ) ) ( not ( = ?auto_2477901 ?auto_2477903 ) ) ( not ( = ?auto_2477901 ?auto_2477904 ) ) ( not ( = ?auto_2477901 ?auto_2477905 ) ) ( not ( = ?auto_2477901 ?auto_2477906 ) ) ( not ( = ?auto_2477901 ?auto_2477907 ) ) ( not ( = ?auto_2477901 ?auto_2477908 ) ) ( not ( = ?auto_2477902 ?auto_2477903 ) ) ( not ( = ?auto_2477902 ?auto_2477904 ) ) ( not ( = ?auto_2477902 ?auto_2477905 ) ) ( not ( = ?auto_2477902 ?auto_2477906 ) ) ( not ( = ?auto_2477902 ?auto_2477907 ) ) ( not ( = ?auto_2477902 ?auto_2477908 ) ) ( not ( = ?auto_2477903 ?auto_2477904 ) ) ( not ( = ?auto_2477903 ?auto_2477905 ) ) ( not ( = ?auto_2477903 ?auto_2477906 ) ) ( not ( = ?auto_2477903 ?auto_2477907 ) ) ( not ( = ?auto_2477903 ?auto_2477908 ) ) ( not ( = ?auto_2477904 ?auto_2477905 ) ) ( not ( = ?auto_2477904 ?auto_2477906 ) ) ( not ( = ?auto_2477904 ?auto_2477907 ) ) ( not ( = ?auto_2477904 ?auto_2477908 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2477905 ?auto_2477906 ?auto_2477907 )
      ( MAKE-15CRATE-VERIFY ?auto_2477892 ?auto_2477893 ?auto_2477894 ?auto_2477895 ?auto_2477896 ?auto_2477897 ?auto_2477898 ?auto_2477899 ?auto_2477900 ?auto_2477901 ?auto_2477902 ?auto_2477903 ?auto_2477904 ?auto_2477905 ?auto_2477906 ?auto_2477907 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2478118 - SURFACE
      ?auto_2478119 - SURFACE
      ?auto_2478120 - SURFACE
      ?auto_2478121 - SURFACE
      ?auto_2478122 - SURFACE
      ?auto_2478123 - SURFACE
      ?auto_2478124 - SURFACE
      ?auto_2478125 - SURFACE
      ?auto_2478126 - SURFACE
      ?auto_2478127 - SURFACE
      ?auto_2478128 - SURFACE
      ?auto_2478129 - SURFACE
      ?auto_2478130 - SURFACE
      ?auto_2478131 - SURFACE
      ?auto_2478132 - SURFACE
      ?auto_2478133 - SURFACE
    )
    :vars
    (
      ?auto_2478139 - HOIST
      ?auto_2478138 - PLACE
      ?auto_2478137 - PLACE
      ?auto_2478134 - HOIST
      ?auto_2478135 - SURFACE
      ?auto_2478136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2478139 ?auto_2478138 ) ( IS-CRATE ?auto_2478133 ) ( not ( = ?auto_2478132 ?auto_2478133 ) ) ( not ( = ?auto_2478131 ?auto_2478132 ) ) ( not ( = ?auto_2478131 ?auto_2478133 ) ) ( not ( = ?auto_2478137 ?auto_2478138 ) ) ( HOIST-AT ?auto_2478134 ?auto_2478137 ) ( not ( = ?auto_2478139 ?auto_2478134 ) ) ( AVAILABLE ?auto_2478134 ) ( SURFACE-AT ?auto_2478133 ?auto_2478137 ) ( ON ?auto_2478133 ?auto_2478135 ) ( CLEAR ?auto_2478133 ) ( not ( = ?auto_2478132 ?auto_2478135 ) ) ( not ( = ?auto_2478133 ?auto_2478135 ) ) ( not ( = ?auto_2478131 ?auto_2478135 ) ) ( TRUCK-AT ?auto_2478136 ?auto_2478138 ) ( SURFACE-AT ?auto_2478131 ?auto_2478138 ) ( CLEAR ?auto_2478131 ) ( LIFTING ?auto_2478139 ?auto_2478132 ) ( IS-CRATE ?auto_2478132 ) ( ON ?auto_2478119 ?auto_2478118 ) ( ON ?auto_2478120 ?auto_2478119 ) ( ON ?auto_2478121 ?auto_2478120 ) ( ON ?auto_2478122 ?auto_2478121 ) ( ON ?auto_2478123 ?auto_2478122 ) ( ON ?auto_2478124 ?auto_2478123 ) ( ON ?auto_2478125 ?auto_2478124 ) ( ON ?auto_2478126 ?auto_2478125 ) ( ON ?auto_2478127 ?auto_2478126 ) ( ON ?auto_2478128 ?auto_2478127 ) ( ON ?auto_2478129 ?auto_2478128 ) ( ON ?auto_2478130 ?auto_2478129 ) ( ON ?auto_2478131 ?auto_2478130 ) ( not ( = ?auto_2478118 ?auto_2478119 ) ) ( not ( = ?auto_2478118 ?auto_2478120 ) ) ( not ( = ?auto_2478118 ?auto_2478121 ) ) ( not ( = ?auto_2478118 ?auto_2478122 ) ) ( not ( = ?auto_2478118 ?auto_2478123 ) ) ( not ( = ?auto_2478118 ?auto_2478124 ) ) ( not ( = ?auto_2478118 ?auto_2478125 ) ) ( not ( = ?auto_2478118 ?auto_2478126 ) ) ( not ( = ?auto_2478118 ?auto_2478127 ) ) ( not ( = ?auto_2478118 ?auto_2478128 ) ) ( not ( = ?auto_2478118 ?auto_2478129 ) ) ( not ( = ?auto_2478118 ?auto_2478130 ) ) ( not ( = ?auto_2478118 ?auto_2478131 ) ) ( not ( = ?auto_2478118 ?auto_2478132 ) ) ( not ( = ?auto_2478118 ?auto_2478133 ) ) ( not ( = ?auto_2478118 ?auto_2478135 ) ) ( not ( = ?auto_2478119 ?auto_2478120 ) ) ( not ( = ?auto_2478119 ?auto_2478121 ) ) ( not ( = ?auto_2478119 ?auto_2478122 ) ) ( not ( = ?auto_2478119 ?auto_2478123 ) ) ( not ( = ?auto_2478119 ?auto_2478124 ) ) ( not ( = ?auto_2478119 ?auto_2478125 ) ) ( not ( = ?auto_2478119 ?auto_2478126 ) ) ( not ( = ?auto_2478119 ?auto_2478127 ) ) ( not ( = ?auto_2478119 ?auto_2478128 ) ) ( not ( = ?auto_2478119 ?auto_2478129 ) ) ( not ( = ?auto_2478119 ?auto_2478130 ) ) ( not ( = ?auto_2478119 ?auto_2478131 ) ) ( not ( = ?auto_2478119 ?auto_2478132 ) ) ( not ( = ?auto_2478119 ?auto_2478133 ) ) ( not ( = ?auto_2478119 ?auto_2478135 ) ) ( not ( = ?auto_2478120 ?auto_2478121 ) ) ( not ( = ?auto_2478120 ?auto_2478122 ) ) ( not ( = ?auto_2478120 ?auto_2478123 ) ) ( not ( = ?auto_2478120 ?auto_2478124 ) ) ( not ( = ?auto_2478120 ?auto_2478125 ) ) ( not ( = ?auto_2478120 ?auto_2478126 ) ) ( not ( = ?auto_2478120 ?auto_2478127 ) ) ( not ( = ?auto_2478120 ?auto_2478128 ) ) ( not ( = ?auto_2478120 ?auto_2478129 ) ) ( not ( = ?auto_2478120 ?auto_2478130 ) ) ( not ( = ?auto_2478120 ?auto_2478131 ) ) ( not ( = ?auto_2478120 ?auto_2478132 ) ) ( not ( = ?auto_2478120 ?auto_2478133 ) ) ( not ( = ?auto_2478120 ?auto_2478135 ) ) ( not ( = ?auto_2478121 ?auto_2478122 ) ) ( not ( = ?auto_2478121 ?auto_2478123 ) ) ( not ( = ?auto_2478121 ?auto_2478124 ) ) ( not ( = ?auto_2478121 ?auto_2478125 ) ) ( not ( = ?auto_2478121 ?auto_2478126 ) ) ( not ( = ?auto_2478121 ?auto_2478127 ) ) ( not ( = ?auto_2478121 ?auto_2478128 ) ) ( not ( = ?auto_2478121 ?auto_2478129 ) ) ( not ( = ?auto_2478121 ?auto_2478130 ) ) ( not ( = ?auto_2478121 ?auto_2478131 ) ) ( not ( = ?auto_2478121 ?auto_2478132 ) ) ( not ( = ?auto_2478121 ?auto_2478133 ) ) ( not ( = ?auto_2478121 ?auto_2478135 ) ) ( not ( = ?auto_2478122 ?auto_2478123 ) ) ( not ( = ?auto_2478122 ?auto_2478124 ) ) ( not ( = ?auto_2478122 ?auto_2478125 ) ) ( not ( = ?auto_2478122 ?auto_2478126 ) ) ( not ( = ?auto_2478122 ?auto_2478127 ) ) ( not ( = ?auto_2478122 ?auto_2478128 ) ) ( not ( = ?auto_2478122 ?auto_2478129 ) ) ( not ( = ?auto_2478122 ?auto_2478130 ) ) ( not ( = ?auto_2478122 ?auto_2478131 ) ) ( not ( = ?auto_2478122 ?auto_2478132 ) ) ( not ( = ?auto_2478122 ?auto_2478133 ) ) ( not ( = ?auto_2478122 ?auto_2478135 ) ) ( not ( = ?auto_2478123 ?auto_2478124 ) ) ( not ( = ?auto_2478123 ?auto_2478125 ) ) ( not ( = ?auto_2478123 ?auto_2478126 ) ) ( not ( = ?auto_2478123 ?auto_2478127 ) ) ( not ( = ?auto_2478123 ?auto_2478128 ) ) ( not ( = ?auto_2478123 ?auto_2478129 ) ) ( not ( = ?auto_2478123 ?auto_2478130 ) ) ( not ( = ?auto_2478123 ?auto_2478131 ) ) ( not ( = ?auto_2478123 ?auto_2478132 ) ) ( not ( = ?auto_2478123 ?auto_2478133 ) ) ( not ( = ?auto_2478123 ?auto_2478135 ) ) ( not ( = ?auto_2478124 ?auto_2478125 ) ) ( not ( = ?auto_2478124 ?auto_2478126 ) ) ( not ( = ?auto_2478124 ?auto_2478127 ) ) ( not ( = ?auto_2478124 ?auto_2478128 ) ) ( not ( = ?auto_2478124 ?auto_2478129 ) ) ( not ( = ?auto_2478124 ?auto_2478130 ) ) ( not ( = ?auto_2478124 ?auto_2478131 ) ) ( not ( = ?auto_2478124 ?auto_2478132 ) ) ( not ( = ?auto_2478124 ?auto_2478133 ) ) ( not ( = ?auto_2478124 ?auto_2478135 ) ) ( not ( = ?auto_2478125 ?auto_2478126 ) ) ( not ( = ?auto_2478125 ?auto_2478127 ) ) ( not ( = ?auto_2478125 ?auto_2478128 ) ) ( not ( = ?auto_2478125 ?auto_2478129 ) ) ( not ( = ?auto_2478125 ?auto_2478130 ) ) ( not ( = ?auto_2478125 ?auto_2478131 ) ) ( not ( = ?auto_2478125 ?auto_2478132 ) ) ( not ( = ?auto_2478125 ?auto_2478133 ) ) ( not ( = ?auto_2478125 ?auto_2478135 ) ) ( not ( = ?auto_2478126 ?auto_2478127 ) ) ( not ( = ?auto_2478126 ?auto_2478128 ) ) ( not ( = ?auto_2478126 ?auto_2478129 ) ) ( not ( = ?auto_2478126 ?auto_2478130 ) ) ( not ( = ?auto_2478126 ?auto_2478131 ) ) ( not ( = ?auto_2478126 ?auto_2478132 ) ) ( not ( = ?auto_2478126 ?auto_2478133 ) ) ( not ( = ?auto_2478126 ?auto_2478135 ) ) ( not ( = ?auto_2478127 ?auto_2478128 ) ) ( not ( = ?auto_2478127 ?auto_2478129 ) ) ( not ( = ?auto_2478127 ?auto_2478130 ) ) ( not ( = ?auto_2478127 ?auto_2478131 ) ) ( not ( = ?auto_2478127 ?auto_2478132 ) ) ( not ( = ?auto_2478127 ?auto_2478133 ) ) ( not ( = ?auto_2478127 ?auto_2478135 ) ) ( not ( = ?auto_2478128 ?auto_2478129 ) ) ( not ( = ?auto_2478128 ?auto_2478130 ) ) ( not ( = ?auto_2478128 ?auto_2478131 ) ) ( not ( = ?auto_2478128 ?auto_2478132 ) ) ( not ( = ?auto_2478128 ?auto_2478133 ) ) ( not ( = ?auto_2478128 ?auto_2478135 ) ) ( not ( = ?auto_2478129 ?auto_2478130 ) ) ( not ( = ?auto_2478129 ?auto_2478131 ) ) ( not ( = ?auto_2478129 ?auto_2478132 ) ) ( not ( = ?auto_2478129 ?auto_2478133 ) ) ( not ( = ?auto_2478129 ?auto_2478135 ) ) ( not ( = ?auto_2478130 ?auto_2478131 ) ) ( not ( = ?auto_2478130 ?auto_2478132 ) ) ( not ( = ?auto_2478130 ?auto_2478133 ) ) ( not ( = ?auto_2478130 ?auto_2478135 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2478131 ?auto_2478132 ?auto_2478133 )
      ( MAKE-15CRATE-VERIFY ?auto_2478118 ?auto_2478119 ?auto_2478120 ?auto_2478121 ?auto_2478122 ?auto_2478123 ?auto_2478124 ?auto_2478125 ?auto_2478126 ?auto_2478127 ?auto_2478128 ?auto_2478129 ?auto_2478130 ?auto_2478131 ?auto_2478132 ?auto_2478133 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2478344 - SURFACE
      ?auto_2478345 - SURFACE
      ?auto_2478346 - SURFACE
      ?auto_2478347 - SURFACE
      ?auto_2478348 - SURFACE
      ?auto_2478349 - SURFACE
      ?auto_2478350 - SURFACE
      ?auto_2478351 - SURFACE
      ?auto_2478352 - SURFACE
      ?auto_2478353 - SURFACE
      ?auto_2478354 - SURFACE
      ?auto_2478355 - SURFACE
      ?auto_2478356 - SURFACE
      ?auto_2478357 - SURFACE
      ?auto_2478358 - SURFACE
      ?auto_2478359 - SURFACE
    )
    :vars
    (
      ?auto_2478364 - HOIST
      ?auto_2478363 - PLACE
      ?auto_2478362 - PLACE
      ?auto_2478361 - HOIST
      ?auto_2478365 - SURFACE
      ?auto_2478360 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2478364 ?auto_2478363 ) ( IS-CRATE ?auto_2478359 ) ( not ( = ?auto_2478358 ?auto_2478359 ) ) ( not ( = ?auto_2478357 ?auto_2478358 ) ) ( not ( = ?auto_2478357 ?auto_2478359 ) ) ( not ( = ?auto_2478362 ?auto_2478363 ) ) ( HOIST-AT ?auto_2478361 ?auto_2478362 ) ( not ( = ?auto_2478364 ?auto_2478361 ) ) ( AVAILABLE ?auto_2478361 ) ( SURFACE-AT ?auto_2478359 ?auto_2478362 ) ( ON ?auto_2478359 ?auto_2478365 ) ( CLEAR ?auto_2478359 ) ( not ( = ?auto_2478358 ?auto_2478365 ) ) ( not ( = ?auto_2478359 ?auto_2478365 ) ) ( not ( = ?auto_2478357 ?auto_2478365 ) ) ( TRUCK-AT ?auto_2478360 ?auto_2478363 ) ( SURFACE-AT ?auto_2478357 ?auto_2478363 ) ( CLEAR ?auto_2478357 ) ( IS-CRATE ?auto_2478358 ) ( AVAILABLE ?auto_2478364 ) ( IN ?auto_2478358 ?auto_2478360 ) ( ON ?auto_2478345 ?auto_2478344 ) ( ON ?auto_2478346 ?auto_2478345 ) ( ON ?auto_2478347 ?auto_2478346 ) ( ON ?auto_2478348 ?auto_2478347 ) ( ON ?auto_2478349 ?auto_2478348 ) ( ON ?auto_2478350 ?auto_2478349 ) ( ON ?auto_2478351 ?auto_2478350 ) ( ON ?auto_2478352 ?auto_2478351 ) ( ON ?auto_2478353 ?auto_2478352 ) ( ON ?auto_2478354 ?auto_2478353 ) ( ON ?auto_2478355 ?auto_2478354 ) ( ON ?auto_2478356 ?auto_2478355 ) ( ON ?auto_2478357 ?auto_2478356 ) ( not ( = ?auto_2478344 ?auto_2478345 ) ) ( not ( = ?auto_2478344 ?auto_2478346 ) ) ( not ( = ?auto_2478344 ?auto_2478347 ) ) ( not ( = ?auto_2478344 ?auto_2478348 ) ) ( not ( = ?auto_2478344 ?auto_2478349 ) ) ( not ( = ?auto_2478344 ?auto_2478350 ) ) ( not ( = ?auto_2478344 ?auto_2478351 ) ) ( not ( = ?auto_2478344 ?auto_2478352 ) ) ( not ( = ?auto_2478344 ?auto_2478353 ) ) ( not ( = ?auto_2478344 ?auto_2478354 ) ) ( not ( = ?auto_2478344 ?auto_2478355 ) ) ( not ( = ?auto_2478344 ?auto_2478356 ) ) ( not ( = ?auto_2478344 ?auto_2478357 ) ) ( not ( = ?auto_2478344 ?auto_2478358 ) ) ( not ( = ?auto_2478344 ?auto_2478359 ) ) ( not ( = ?auto_2478344 ?auto_2478365 ) ) ( not ( = ?auto_2478345 ?auto_2478346 ) ) ( not ( = ?auto_2478345 ?auto_2478347 ) ) ( not ( = ?auto_2478345 ?auto_2478348 ) ) ( not ( = ?auto_2478345 ?auto_2478349 ) ) ( not ( = ?auto_2478345 ?auto_2478350 ) ) ( not ( = ?auto_2478345 ?auto_2478351 ) ) ( not ( = ?auto_2478345 ?auto_2478352 ) ) ( not ( = ?auto_2478345 ?auto_2478353 ) ) ( not ( = ?auto_2478345 ?auto_2478354 ) ) ( not ( = ?auto_2478345 ?auto_2478355 ) ) ( not ( = ?auto_2478345 ?auto_2478356 ) ) ( not ( = ?auto_2478345 ?auto_2478357 ) ) ( not ( = ?auto_2478345 ?auto_2478358 ) ) ( not ( = ?auto_2478345 ?auto_2478359 ) ) ( not ( = ?auto_2478345 ?auto_2478365 ) ) ( not ( = ?auto_2478346 ?auto_2478347 ) ) ( not ( = ?auto_2478346 ?auto_2478348 ) ) ( not ( = ?auto_2478346 ?auto_2478349 ) ) ( not ( = ?auto_2478346 ?auto_2478350 ) ) ( not ( = ?auto_2478346 ?auto_2478351 ) ) ( not ( = ?auto_2478346 ?auto_2478352 ) ) ( not ( = ?auto_2478346 ?auto_2478353 ) ) ( not ( = ?auto_2478346 ?auto_2478354 ) ) ( not ( = ?auto_2478346 ?auto_2478355 ) ) ( not ( = ?auto_2478346 ?auto_2478356 ) ) ( not ( = ?auto_2478346 ?auto_2478357 ) ) ( not ( = ?auto_2478346 ?auto_2478358 ) ) ( not ( = ?auto_2478346 ?auto_2478359 ) ) ( not ( = ?auto_2478346 ?auto_2478365 ) ) ( not ( = ?auto_2478347 ?auto_2478348 ) ) ( not ( = ?auto_2478347 ?auto_2478349 ) ) ( not ( = ?auto_2478347 ?auto_2478350 ) ) ( not ( = ?auto_2478347 ?auto_2478351 ) ) ( not ( = ?auto_2478347 ?auto_2478352 ) ) ( not ( = ?auto_2478347 ?auto_2478353 ) ) ( not ( = ?auto_2478347 ?auto_2478354 ) ) ( not ( = ?auto_2478347 ?auto_2478355 ) ) ( not ( = ?auto_2478347 ?auto_2478356 ) ) ( not ( = ?auto_2478347 ?auto_2478357 ) ) ( not ( = ?auto_2478347 ?auto_2478358 ) ) ( not ( = ?auto_2478347 ?auto_2478359 ) ) ( not ( = ?auto_2478347 ?auto_2478365 ) ) ( not ( = ?auto_2478348 ?auto_2478349 ) ) ( not ( = ?auto_2478348 ?auto_2478350 ) ) ( not ( = ?auto_2478348 ?auto_2478351 ) ) ( not ( = ?auto_2478348 ?auto_2478352 ) ) ( not ( = ?auto_2478348 ?auto_2478353 ) ) ( not ( = ?auto_2478348 ?auto_2478354 ) ) ( not ( = ?auto_2478348 ?auto_2478355 ) ) ( not ( = ?auto_2478348 ?auto_2478356 ) ) ( not ( = ?auto_2478348 ?auto_2478357 ) ) ( not ( = ?auto_2478348 ?auto_2478358 ) ) ( not ( = ?auto_2478348 ?auto_2478359 ) ) ( not ( = ?auto_2478348 ?auto_2478365 ) ) ( not ( = ?auto_2478349 ?auto_2478350 ) ) ( not ( = ?auto_2478349 ?auto_2478351 ) ) ( not ( = ?auto_2478349 ?auto_2478352 ) ) ( not ( = ?auto_2478349 ?auto_2478353 ) ) ( not ( = ?auto_2478349 ?auto_2478354 ) ) ( not ( = ?auto_2478349 ?auto_2478355 ) ) ( not ( = ?auto_2478349 ?auto_2478356 ) ) ( not ( = ?auto_2478349 ?auto_2478357 ) ) ( not ( = ?auto_2478349 ?auto_2478358 ) ) ( not ( = ?auto_2478349 ?auto_2478359 ) ) ( not ( = ?auto_2478349 ?auto_2478365 ) ) ( not ( = ?auto_2478350 ?auto_2478351 ) ) ( not ( = ?auto_2478350 ?auto_2478352 ) ) ( not ( = ?auto_2478350 ?auto_2478353 ) ) ( not ( = ?auto_2478350 ?auto_2478354 ) ) ( not ( = ?auto_2478350 ?auto_2478355 ) ) ( not ( = ?auto_2478350 ?auto_2478356 ) ) ( not ( = ?auto_2478350 ?auto_2478357 ) ) ( not ( = ?auto_2478350 ?auto_2478358 ) ) ( not ( = ?auto_2478350 ?auto_2478359 ) ) ( not ( = ?auto_2478350 ?auto_2478365 ) ) ( not ( = ?auto_2478351 ?auto_2478352 ) ) ( not ( = ?auto_2478351 ?auto_2478353 ) ) ( not ( = ?auto_2478351 ?auto_2478354 ) ) ( not ( = ?auto_2478351 ?auto_2478355 ) ) ( not ( = ?auto_2478351 ?auto_2478356 ) ) ( not ( = ?auto_2478351 ?auto_2478357 ) ) ( not ( = ?auto_2478351 ?auto_2478358 ) ) ( not ( = ?auto_2478351 ?auto_2478359 ) ) ( not ( = ?auto_2478351 ?auto_2478365 ) ) ( not ( = ?auto_2478352 ?auto_2478353 ) ) ( not ( = ?auto_2478352 ?auto_2478354 ) ) ( not ( = ?auto_2478352 ?auto_2478355 ) ) ( not ( = ?auto_2478352 ?auto_2478356 ) ) ( not ( = ?auto_2478352 ?auto_2478357 ) ) ( not ( = ?auto_2478352 ?auto_2478358 ) ) ( not ( = ?auto_2478352 ?auto_2478359 ) ) ( not ( = ?auto_2478352 ?auto_2478365 ) ) ( not ( = ?auto_2478353 ?auto_2478354 ) ) ( not ( = ?auto_2478353 ?auto_2478355 ) ) ( not ( = ?auto_2478353 ?auto_2478356 ) ) ( not ( = ?auto_2478353 ?auto_2478357 ) ) ( not ( = ?auto_2478353 ?auto_2478358 ) ) ( not ( = ?auto_2478353 ?auto_2478359 ) ) ( not ( = ?auto_2478353 ?auto_2478365 ) ) ( not ( = ?auto_2478354 ?auto_2478355 ) ) ( not ( = ?auto_2478354 ?auto_2478356 ) ) ( not ( = ?auto_2478354 ?auto_2478357 ) ) ( not ( = ?auto_2478354 ?auto_2478358 ) ) ( not ( = ?auto_2478354 ?auto_2478359 ) ) ( not ( = ?auto_2478354 ?auto_2478365 ) ) ( not ( = ?auto_2478355 ?auto_2478356 ) ) ( not ( = ?auto_2478355 ?auto_2478357 ) ) ( not ( = ?auto_2478355 ?auto_2478358 ) ) ( not ( = ?auto_2478355 ?auto_2478359 ) ) ( not ( = ?auto_2478355 ?auto_2478365 ) ) ( not ( = ?auto_2478356 ?auto_2478357 ) ) ( not ( = ?auto_2478356 ?auto_2478358 ) ) ( not ( = ?auto_2478356 ?auto_2478359 ) ) ( not ( = ?auto_2478356 ?auto_2478365 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2478357 ?auto_2478358 ?auto_2478359 )
      ( MAKE-15CRATE-VERIFY ?auto_2478344 ?auto_2478345 ?auto_2478346 ?auto_2478347 ?auto_2478348 ?auto_2478349 ?auto_2478350 ?auto_2478351 ?auto_2478352 ?auto_2478353 ?auto_2478354 ?auto_2478355 ?auto_2478356 ?auto_2478357 ?auto_2478358 ?auto_2478359 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2493385 - SURFACE
      ?auto_2493386 - SURFACE
    )
    :vars
    (
      ?auto_2493390 - HOIST
      ?auto_2493393 - PLACE
      ?auto_2493388 - SURFACE
      ?auto_2493389 - TRUCK
      ?auto_2493387 - PLACE
      ?auto_2493391 - HOIST
      ?auto_2493392 - SURFACE
      ?auto_2493394 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2493390 ?auto_2493393 ) ( SURFACE-AT ?auto_2493385 ?auto_2493393 ) ( CLEAR ?auto_2493385 ) ( IS-CRATE ?auto_2493386 ) ( not ( = ?auto_2493385 ?auto_2493386 ) ) ( AVAILABLE ?auto_2493390 ) ( ON ?auto_2493385 ?auto_2493388 ) ( not ( = ?auto_2493388 ?auto_2493385 ) ) ( not ( = ?auto_2493388 ?auto_2493386 ) ) ( TRUCK-AT ?auto_2493389 ?auto_2493387 ) ( not ( = ?auto_2493387 ?auto_2493393 ) ) ( HOIST-AT ?auto_2493391 ?auto_2493387 ) ( not ( = ?auto_2493390 ?auto_2493391 ) ) ( SURFACE-AT ?auto_2493386 ?auto_2493387 ) ( ON ?auto_2493386 ?auto_2493392 ) ( CLEAR ?auto_2493386 ) ( not ( = ?auto_2493385 ?auto_2493392 ) ) ( not ( = ?auto_2493386 ?auto_2493392 ) ) ( not ( = ?auto_2493388 ?auto_2493392 ) ) ( LIFTING ?auto_2493391 ?auto_2493394 ) ( IS-CRATE ?auto_2493394 ) ( not ( = ?auto_2493385 ?auto_2493394 ) ) ( not ( = ?auto_2493386 ?auto_2493394 ) ) ( not ( = ?auto_2493388 ?auto_2493394 ) ) ( not ( = ?auto_2493392 ?auto_2493394 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2493391 ?auto_2493394 ?auto_2493389 ?auto_2493387 )
      ( MAKE-1CRATE ?auto_2493385 ?auto_2493386 )
      ( MAKE-1CRATE-VERIFY ?auto_2493385 ?auto_2493386 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2498878 - SURFACE
      ?auto_2498879 - SURFACE
      ?auto_2498880 - SURFACE
      ?auto_2498881 - SURFACE
      ?auto_2498882 - SURFACE
      ?auto_2498883 - SURFACE
      ?auto_2498884 - SURFACE
      ?auto_2498885 - SURFACE
      ?auto_2498886 - SURFACE
      ?auto_2498887 - SURFACE
      ?auto_2498888 - SURFACE
      ?auto_2498889 - SURFACE
      ?auto_2498890 - SURFACE
      ?auto_2498891 - SURFACE
      ?auto_2498892 - SURFACE
      ?auto_2498893 - SURFACE
      ?auto_2498894 - SURFACE
    )
    :vars
    (
      ?auto_2498896 - HOIST
      ?auto_2498895 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2498896 ?auto_2498895 ) ( SURFACE-AT ?auto_2498893 ?auto_2498895 ) ( CLEAR ?auto_2498893 ) ( LIFTING ?auto_2498896 ?auto_2498894 ) ( IS-CRATE ?auto_2498894 ) ( not ( = ?auto_2498893 ?auto_2498894 ) ) ( ON ?auto_2498879 ?auto_2498878 ) ( ON ?auto_2498880 ?auto_2498879 ) ( ON ?auto_2498881 ?auto_2498880 ) ( ON ?auto_2498882 ?auto_2498881 ) ( ON ?auto_2498883 ?auto_2498882 ) ( ON ?auto_2498884 ?auto_2498883 ) ( ON ?auto_2498885 ?auto_2498884 ) ( ON ?auto_2498886 ?auto_2498885 ) ( ON ?auto_2498887 ?auto_2498886 ) ( ON ?auto_2498888 ?auto_2498887 ) ( ON ?auto_2498889 ?auto_2498888 ) ( ON ?auto_2498890 ?auto_2498889 ) ( ON ?auto_2498891 ?auto_2498890 ) ( ON ?auto_2498892 ?auto_2498891 ) ( ON ?auto_2498893 ?auto_2498892 ) ( not ( = ?auto_2498878 ?auto_2498879 ) ) ( not ( = ?auto_2498878 ?auto_2498880 ) ) ( not ( = ?auto_2498878 ?auto_2498881 ) ) ( not ( = ?auto_2498878 ?auto_2498882 ) ) ( not ( = ?auto_2498878 ?auto_2498883 ) ) ( not ( = ?auto_2498878 ?auto_2498884 ) ) ( not ( = ?auto_2498878 ?auto_2498885 ) ) ( not ( = ?auto_2498878 ?auto_2498886 ) ) ( not ( = ?auto_2498878 ?auto_2498887 ) ) ( not ( = ?auto_2498878 ?auto_2498888 ) ) ( not ( = ?auto_2498878 ?auto_2498889 ) ) ( not ( = ?auto_2498878 ?auto_2498890 ) ) ( not ( = ?auto_2498878 ?auto_2498891 ) ) ( not ( = ?auto_2498878 ?auto_2498892 ) ) ( not ( = ?auto_2498878 ?auto_2498893 ) ) ( not ( = ?auto_2498878 ?auto_2498894 ) ) ( not ( = ?auto_2498879 ?auto_2498880 ) ) ( not ( = ?auto_2498879 ?auto_2498881 ) ) ( not ( = ?auto_2498879 ?auto_2498882 ) ) ( not ( = ?auto_2498879 ?auto_2498883 ) ) ( not ( = ?auto_2498879 ?auto_2498884 ) ) ( not ( = ?auto_2498879 ?auto_2498885 ) ) ( not ( = ?auto_2498879 ?auto_2498886 ) ) ( not ( = ?auto_2498879 ?auto_2498887 ) ) ( not ( = ?auto_2498879 ?auto_2498888 ) ) ( not ( = ?auto_2498879 ?auto_2498889 ) ) ( not ( = ?auto_2498879 ?auto_2498890 ) ) ( not ( = ?auto_2498879 ?auto_2498891 ) ) ( not ( = ?auto_2498879 ?auto_2498892 ) ) ( not ( = ?auto_2498879 ?auto_2498893 ) ) ( not ( = ?auto_2498879 ?auto_2498894 ) ) ( not ( = ?auto_2498880 ?auto_2498881 ) ) ( not ( = ?auto_2498880 ?auto_2498882 ) ) ( not ( = ?auto_2498880 ?auto_2498883 ) ) ( not ( = ?auto_2498880 ?auto_2498884 ) ) ( not ( = ?auto_2498880 ?auto_2498885 ) ) ( not ( = ?auto_2498880 ?auto_2498886 ) ) ( not ( = ?auto_2498880 ?auto_2498887 ) ) ( not ( = ?auto_2498880 ?auto_2498888 ) ) ( not ( = ?auto_2498880 ?auto_2498889 ) ) ( not ( = ?auto_2498880 ?auto_2498890 ) ) ( not ( = ?auto_2498880 ?auto_2498891 ) ) ( not ( = ?auto_2498880 ?auto_2498892 ) ) ( not ( = ?auto_2498880 ?auto_2498893 ) ) ( not ( = ?auto_2498880 ?auto_2498894 ) ) ( not ( = ?auto_2498881 ?auto_2498882 ) ) ( not ( = ?auto_2498881 ?auto_2498883 ) ) ( not ( = ?auto_2498881 ?auto_2498884 ) ) ( not ( = ?auto_2498881 ?auto_2498885 ) ) ( not ( = ?auto_2498881 ?auto_2498886 ) ) ( not ( = ?auto_2498881 ?auto_2498887 ) ) ( not ( = ?auto_2498881 ?auto_2498888 ) ) ( not ( = ?auto_2498881 ?auto_2498889 ) ) ( not ( = ?auto_2498881 ?auto_2498890 ) ) ( not ( = ?auto_2498881 ?auto_2498891 ) ) ( not ( = ?auto_2498881 ?auto_2498892 ) ) ( not ( = ?auto_2498881 ?auto_2498893 ) ) ( not ( = ?auto_2498881 ?auto_2498894 ) ) ( not ( = ?auto_2498882 ?auto_2498883 ) ) ( not ( = ?auto_2498882 ?auto_2498884 ) ) ( not ( = ?auto_2498882 ?auto_2498885 ) ) ( not ( = ?auto_2498882 ?auto_2498886 ) ) ( not ( = ?auto_2498882 ?auto_2498887 ) ) ( not ( = ?auto_2498882 ?auto_2498888 ) ) ( not ( = ?auto_2498882 ?auto_2498889 ) ) ( not ( = ?auto_2498882 ?auto_2498890 ) ) ( not ( = ?auto_2498882 ?auto_2498891 ) ) ( not ( = ?auto_2498882 ?auto_2498892 ) ) ( not ( = ?auto_2498882 ?auto_2498893 ) ) ( not ( = ?auto_2498882 ?auto_2498894 ) ) ( not ( = ?auto_2498883 ?auto_2498884 ) ) ( not ( = ?auto_2498883 ?auto_2498885 ) ) ( not ( = ?auto_2498883 ?auto_2498886 ) ) ( not ( = ?auto_2498883 ?auto_2498887 ) ) ( not ( = ?auto_2498883 ?auto_2498888 ) ) ( not ( = ?auto_2498883 ?auto_2498889 ) ) ( not ( = ?auto_2498883 ?auto_2498890 ) ) ( not ( = ?auto_2498883 ?auto_2498891 ) ) ( not ( = ?auto_2498883 ?auto_2498892 ) ) ( not ( = ?auto_2498883 ?auto_2498893 ) ) ( not ( = ?auto_2498883 ?auto_2498894 ) ) ( not ( = ?auto_2498884 ?auto_2498885 ) ) ( not ( = ?auto_2498884 ?auto_2498886 ) ) ( not ( = ?auto_2498884 ?auto_2498887 ) ) ( not ( = ?auto_2498884 ?auto_2498888 ) ) ( not ( = ?auto_2498884 ?auto_2498889 ) ) ( not ( = ?auto_2498884 ?auto_2498890 ) ) ( not ( = ?auto_2498884 ?auto_2498891 ) ) ( not ( = ?auto_2498884 ?auto_2498892 ) ) ( not ( = ?auto_2498884 ?auto_2498893 ) ) ( not ( = ?auto_2498884 ?auto_2498894 ) ) ( not ( = ?auto_2498885 ?auto_2498886 ) ) ( not ( = ?auto_2498885 ?auto_2498887 ) ) ( not ( = ?auto_2498885 ?auto_2498888 ) ) ( not ( = ?auto_2498885 ?auto_2498889 ) ) ( not ( = ?auto_2498885 ?auto_2498890 ) ) ( not ( = ?auto_2498885 ?auto_2498891 ) ) ( not ( = ?auto_2498885 ?auto_2498892 ) ) ( not ( = ?auto_2498885 ?auto_2498893 ) ) ( not ( = ?auto_2498885 ?auto_2498894 ) ) ( not ( = ?auto_2498886 ?auto_2498887 ) ) ( not ( = ?auto_2498886 ?auto_2498888 ) ) ( not ( = ?auto_2498886 ?auto_2498889 ) ) ( not ( = ?auto_2498886 ?auto_2498890 ) ) ( not ( = ?auto_2498886 ?auto_2498891 ) ) ( not ( = ?auto_2498886 ?auto_2498892 ) ) ( not ( = ?auto_2498886 ?auto_2498893 ) ) ( not ( = ?auto_2498886 ?auto_2498894 ) ) ( not ( = ?auto_2498887 ?auto_2498888 ) ) ( not ( = ?auto_2498887 ?auto_2498889 ) ) ( not ( = ?auto_2498887 ?auto_2498890 ) ) ( not ( = ?auto_2498887 ?auto_2498891 ) ) ( not ( = ?auto_2498887 ?auto_2498892 ) ) ( not ( = ?auto_2498887 ?auto_2498893 ) ) ( not ( = ?auto_2498887 ?auto_2498894 ) ) ( not ( = ?auto_2498888 ?auto_2498889 ) ) ( not ( = ?auto_2498888 ?auto_2498890 ) ) ( not ( = ?auto_2498888 ?auto_2498891 ) ) ( not ( = ?auto_2498888 ?auto_2498892 ) ) ( not ( = ?auto_2498888 ?auto_2498893 ) ) ( not ( = ?auto_2498888 ?auto_2498894 ) ) ( not ( = ?auto_2498889 ?auto_2498890 ) ) ( not ( = ?auto_2498889 ?auto_2498891 ) ) ( not ( = ?auto_2498889 ?auto_2498892 ) ) ( not ( = ?auto_2498889 ?auto_2498893 ) ) ( not ( = ?auto_2498889 ?auto_2498894 ) ) ( not ( = ?auto_2498890 ?auto_2498891 ) ) ( not ( = ?auto_2498890 ?auto_2498892 ) ) ( not ( = ?auto_2498890 ?auto_2498893 ) ) ( not ( = ?auto_2498890 ?auto_2498894 ) ) ( not ( = ?auto_2498891 ?auto_2498892 ) ) ( not ( = ?auto_2498891 ?auto_2498893 ) ) ( not ( = ?auto_2498891 ?auto_2498894 ) ) ( not ( = ?auto_2498892 ?auto_2498893 ) ) ( not ( = ?auto_2498892 ?auto_2498894 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2498893 ?auto_2498894 )
      ( MAKE-16CRATE-VERIFY ?auto_2498878 ?auto_2498879 ?auto_2498880 ?auto_2498881 ?auto_2498882 ?auto_2498883 ?auto_2498884 ?auto_2498885 ?auto_2498886 ?auto_2498887 ?auto_2498888 ?auto_2498889 ?auto_2498890 ?auto_2498891 ?auto_2498892 ?auto_2498893 ?auto_2498894 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2499077 - SURFACE
      ?auto_2499078 - SURFACE
      ?auto_2499079 - SURFACE
      ?auto_2499080 - SURFACE
      ?auto_2499081 - SURFACE
      ?auto_2499082 - SURFACE
      ?auto_2499083 - SURFACE
      ?auto_2499084 - SURFACE
      ?auto_2499085 - SURFACE
      ?auto_2499086 - SURFACE
      ?auto_2499087 - SURFACE
      ?auto_2499088 - SURFACE
      ?auto_2499089 - SURFACE
      ?auto_2499090 - SURFACE
      ?auto_2499091 - SURFACE
      ?auto_2499092 - SURFACE
      ?auto_2499093 - SURFACE
    )
    :vars
    (
      ?auto_2499094 - HOIST
      ?auto_2499096 - PLACE
      ?auto_2499095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2499094 ?auto_2499096 ) ( SURFACE-AT ?auto_2499092 ?auto_2499096 ) ( CLEAR ?auto_2499092 ) ( IS-CRATE ?auto_2499093 ) ( not ( = ?auto_2499092 ?auto_2499093 ) ) ( TRUCK-AT ?auto_2499095 ?auto_2499096 ) ( AVAILABLE ?auto_2499094 ) ( IN ?auto_2499093 ?auto_2499095 ) ( ON ?auto_2499092 ?auto_2499091 ) ( not ( = ?auto_2499091 ?auto_2499092 ) ) ( not ( = ?auto_2499091 ?auto_2499093 ) ) ( ON ?auto_2499078 ?auto_2499077 ) ( ON ?auto_2499079 ?auto_2499078 ) ( ON ?auto_2499080 ?auto_2499079 ) ( ON ?auto_2499081 ?auto_2499080 ) ( ON ?auto_2499082 ?auto_2499081 ) ( ON ?auto_2499083 ?auto_2499082 ) ( ON ?auto_2499084 ?auto_2499083 ) ( ON ?auto_2499085 ?auto_2499084 ) ( ON ?auto_2499086 ?auto_2499085 ) ( ON ?auto_2499087 ?auto_2499086 ) ( ON ?auto_2499088 ?auto_2499087 ) ( ON ?auto_2499089 ?auto_2499088 ) ( ON ?auto_2499090 ?auto_2499089 ) ( ON ?auto_2499091 ?auto_2499090 ) ( not ( = ?auto_2499077 ?auto_2499078 ) ) ( not ( = ?auto_2499077 ?auto_2499079 ) ) ( not ( = ?auto_2499077 ?auto_2499080 ) ) ( not ( = ?auto_2499077 ?auto_2499081 ) ) ( not ( = ?auto_2499077 ?auto_2499082 ) ) ( not ( = ?auto_2499077 ?auto_2499083 ) ) ( not ( = ?auto_2499077 ?auto_2499084 ) ) ( not ( = ?auto_2499077 ?auto_2499085 ) ) ( not ( = ?auto_2499077 ?auto_2499086 ) ) ( not ( = ?auto_2499077 ?auto_2499087 ) ) ( not ( = ?auto_2499077 ?auto_2499088 ) ) ( not ( = ?auto_2499077 ?auto_2499089 ) ) ( not ( = ?auto_2499077 ?auto_2499090 ) ) ( not ( = ?auto_2499077 ?auto_2499091 ) ) ( not ( = ?auto_2499077 ?auto_2499092 ) ) ( not ( = ?auto_2499077 ?auto_2499093 ) ) ( not ( = ?auto_2499078 ?auto_2499079 ) ) ( not ( = ?auto_2499078 ?auto_2499080 ) ) ( not ( = ?auto_2499078 ?auto_2499081 ) ) ( not ( = ?auto_2499078 ?auto_2499082 ) ) ( not ( = ?auto_2499078 ?auto_2499083 ) ) ( not ( = ?auto_2499078 ?auto_2499084 ) ) ( not ( = ?auto_2499078 ?auto_2499085 ) ) ( not ( = ?auto_2499078 ?auto_2499086 ) ) ( not ( = ?auto_2499078 ?auto_2499087 ) ) ( not ( = ?auto_2499078 ?auto_2499088 ) ) ( not ( = ?auto_2499078 ?auto_2499089 ) ) ( not ( = ?auto_2499078 ?auto_2499090 ) ) ( not ( = ?auto_2499078 ?auto_2499091 ) ) ( not ( = ?auto_2499078 ?auto_2499092 ) ) ( not ( = ?auto_2499078 ?auto_2499093 ) ) ( not ( = ?auto_2499079 ?auto_2499080 ) ) ( not ( = ?auto_2499079 ?auto_2499081 ) ) ( not ( = ?auto_2499079 ?auto_2499082 ) ) ( not ( = ?auto_2499079 ?auto_2499083 ) ) ( not ( = ?auto_2499079 ?auto_2499084 ) ) ( not ( = ?auto_2499079 ?auto_2499085 ) ) ( not ( = ?auto_2499079 ?auto_2499086 ) ) ( not ( = ?auto_2499079 ?auto_2499087 ) ) ( not ( = ?auto_2499079 ?auto_2499088 ) ) ( not ( = ?auto_2499079 ?auto_2499089 ) ) ( not ( = ?auto_2499079 ?auto_2499090 ) ) ( not ( = ?auto_2499079 ?auto_2499091 ) ) ( not ( = ?auto_2499079 ?auto_2499092 ) ) ( not ( = ?auto_2499079 ?auto_2499093 ) ) ( not ( = ?auto_2499080 ?auto_2499081 ) ) ( not ( = ?auto_2499080 ?auto_2499082 ) ) ( not ( = ?auto_2499080 ?auto_2499083 ) ) ( not ( = ?auto_2499080 ?auto_2499084 ) ) ( not ( = ?auto_2499080 ?auto_2499085 ) ) ( not ( = ?auto_2499080 ?auto_2499086 ) ) ( not ( = ?auto_2499080 ?auto_2499087 ) ) ( not ( = ?auto_2499080 ?auto_2499088 ) ) ( not ( = ?auto_2499080 ?auto_2499089 ) ) ( not ( = ?auto_2499080 ?auto_2499090 ) ) ( not ( = ?auto_2499080 ?auto_2499091 ) ) ( not ( = ?auto_2499080 ?auto_2499092 ) ) ( not ( = ?auto_2499080 ?auto_2499093 ) ) ( not ( = ?auto_2499081 ?auto_2499082 ) ) ( not ( = ?auto_2499081 ?auto_2499083 ) ) ( not ( = ?auto_2499081 ?auto_2499084 ) ) ( not ( = ?auto_2499081 ?auto_2499085 ) ) ( not ( = ?auto_2499081 ?auto_2499086 ) ) ( not ( = ?auto_2499081 ?auto_2499087 ) ) ( not ( = ?auto_2499081 ?auto_2499088 ) ) ( not ( = ?auto_2499081 ?auto_2499089 ) ) ( not ( = ?auto_2499081 ?auto_2499090 ) ) ( not ( = ?auto_2499081 ?auto_2499091 ) ) ( not ( = ?auto_2499081 ?auto_2499092 ) ) ( not ( = ?auto_2499081 ?auto_2499093 ) ) ( not ( = ?auto_2499082 ?auto_2499083 ) ) ( not ( = ?auto_2499082 ?auto_2499084 ) ) ( not ( = ?auto_2499082 ?auto_2499085 ) ) ( not ( = ?auto_2499082 ?auto_2499086 ) ) ( not ( = ?auto_2499082 ?auto_2499087 ) ) ( not ( = ?auto_2499082 ?auto_2499088 ) ) ( not ( = ?auto_2499082 ?auto_2499089 ) ) ( not ( = ?auto_2499082 ?auto_2499090 ) ) ( not ( = ?auto_2499082 ?auto_2499091 ) ) ( not ( = ?auto_2499082 ?auto_2499092 ) ) ( not ( = ?auto_2499082 ?auto_2499093 ) ) ( not ( = ?auto_2499083 ?auto_2499084 ) ) ( not ( = ?auto_2499083 ?auto_2499085 ) ) ( not ( = ?auto_2499083 ?auto_2499086 ) ) ( not ( = ?auto_2499083 ?auto_2499087 ) ) ( not ( = ?auto_2499083 ?auto_2499088 ) ) ( not ( = ?auto_2499083 ?auto_2499089 ) ) ( not ( = ?auto_2499083 ?auto_2499090 ) ) ( not ( = ?auto_2499083 ?auto_2499091 ) ) ( not ( = ?auto_2499083 ?auto_2499092 ) ) ( not ( = ?auto_2499083 ?auto_2499093 ) ) ( not ( = ?auto_2499084 ?auto_2499085 ) ) ( not ( = ?auto_2499084 ?auto_2499086 ) ) ( not ( = ?auto_2499084 ?auto_2499087 ) ) ( not ( = ?auto_2499084 ?auto_2499088 ) ) ( not ( = ?auto_2499084 ?auto_2499089 ) ) ( not ( = ?auto_2499084 ?auto_2499090 ) ) ( not ( = ?auto_2499084 ?auto_2499091 ) ) ( not ( = ?auto_2499084 ?auto_2499092 ) ) ( not ( = ?auto_2499084 ?auto_2499093 ) ) ( not ( = ?auto_2499085 ?auto_2499086 ) ) ( not ( = ?auto_2499085 ?auto_2499087 ) ) ( not ( = ?auto_2499085 ?auto_2499088 ) ) ( not ( = ?auto_2499085 ?auto_2499089 ) ) ( not ( = ?auto_2499085 ?auto_2499090 ) ) ( not ( = ?auto_2499085 ?auto_2499091 ) ) ( not ( = ?auto_2499085 ?auto_2499092 ) ) ( not ( = ?auto_2499085 ?auto_2499093 ) ) ( not ( = ?auto_2499086 ?auto_2499087 ) ) ( not ( = ?auto_2499086 ?auto_2499088 ) ) ( not ( = ?auto_2499086 ?auto_2499089 ) ) ( not ( = ?auto_2499086 ?auto_2499090 ) ) ( not ( = ?auto_2499086 ?auto_2499091 ) ) ( not ( = ?auto_2499086 ?auto_2499092 ) ) ( not ( = ?auto_2499086 ?auto_2499093 ) ) ( not ( = ?auto_2499087 ?auto_2499088 ) ) ( not ( = ?auto_2499087 ?auto_2499089 ) ) ( not ( = ?auto_2499087 ?auto_2499090 ) ) ( not ( = ?auto_2499087 ?auto_2499091 ) ) ( not ( = ?auto_2499087 ?auto_2499092 ) ) ( not ( = ?auto_2499087 ?auto_2499093 ) ) ( not ( = ?auto_2499088 ?auto_2499089 ) ) ( not ( = ?auto_2499088 ?auto_2499090 ) ) ( not ( = ?auto_2499088 ?auto_2499091 ) ) ( not ( = ?auto_2499088 ?auto_2499092 ) ) ( not ( = ?auto_2499088 ?auto_2499093 ) ) ( not ( = ?auto_2499089 ?auto_2499090 ) ) ( not ( = ?auto_2499089 ?auto_2499091 ) ) ( not ( = ?auto_2499089 ?auto_2499092 ) ) ( not ( = ?auto_2499089 ?auto_2499093 ) ) ( not ( = ?auto_2499090 ?auto_2499091 ) ) ( not ( = ?auto_2499090 ?auto_2499092 ) ) ( not ( = ?auto_2499090 ?auto_2499093 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2499091 ?auto_2499092 ?auto_2499093 )
      ( MAKE-16CRATE-VERIFY ?auto_2499077 ?auto_2499078 ?auto_2499079 ?auto_2499080 ?auto_2499081 ?auto_2499082 ?auto_2499083 ?auto_2499084 ?auto_2499085 ?auto_2499086 ?auto_2499087 ?auto_2499088 ?auto_2499089 ?auto_2499090 ?auto_2499091 ?auto_2499092 ?auto_2499093 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2499293 - SURFACE
      ?auto_2499294 - SURFACE
      ?auto_2499295 - SURFACE
      ?auto_2499296 - SURFACE
      ?auto_2499297 - SURFACE
      ?auto_2499298 - SURFACE
      ?auto_2499299 - SURFACE
      ?auto_2499300 - SURFACE
      ?auto_2499301 - SURFACE
      ?auto_2499302 - SURFACE
      ?auto_2499303 - SURFACE
      ?auto_2499304 - SURFACE
      ?auto_2499305 - SURFACE
      ?auto_2499306 - SURFACE
      ?auto_2499307 - SURFACE
      ?auto_2499308 - SURFACE
      ?auto_2499309 - SURFACE
    )
    :vars
    (
      ?auto_2499311 - HOIST
      ?auto_2499313 - PLACE
      ?auto_2499312 - TRUCK
      ?auto_2499310 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2499311 ?auto_2499313 ) ( SURFACE-AT ?auto_2499308 ?auto_2499313 ) ( CLEAR ?auto_2499308 ) ( IS-CRATE ?auto_2499309 ) ( not ( = ?auto_2499308 ?auto_2499309 ) ) ( AVAILABLE ?auto_2499311 ) ( IN ?auto_2499309 ?auto_2499312 ) ( ON ?auto_2499308 ?auto_2499307 ) ( not ( = ?auto_2499307 ?auto_2499308 ) ) ( not ( = ?auto_2499307 ?auto_2499309 ) ) ( TRUCK-AT ?auto_2499312 ?auto_2499310 ) ( not ( = ?auto_2499310 ?auto_2499313 ) ) ( ON ?auto_2499294 ?auto_2499293 ) ( ON ?auto_2499295 ?auto_2499294 ) ( ON ?auto_2499296 ?auto_2499295 ) ( ON ?auto_2499297 ?auto_2499296 ) ( ON ?auto_2499298 ?auto_2499297 ) ( ON ?auto_2499299 ?auto_2499298 ) ( ON ?auto_2499300 ?auto_2499299 ) ( ON ?auto_2499301 ?auto_2499300 ) ( ON ?auto_2499302 ?auto_2499301 ) ( ON ?auto_2499303 ?auto_2499302 ) ( ON ?auto_2499304 ?auto_2499303 ) ( ON ?auto_2499305 ?auto_2499304 ) ( ON ?auto_2499306 ?auto_2499305 ) ( ON ?auto_2499307 ?auto_2499306 ) ( not ( = ?auto_2499293 ?auto_2499294 ) ) ( not ( = ?auto_2499293 ?auto_2499295 ) ) ( not ( = ?auto_2499293 ?auto_2499296 ) ) ( not ( = ?auto_2499293 ?auto_2499297 ) ) ( not ( = ?auto_2499293 ?auto_2499298 ) ) ( not ( = ?auto_2499293 ?auto_2499299 ) ) ( not ( = ?auto_2499293 ?auto_2499300 ) ) ( not ( = ?auto_2499293 ?auto_2499301 ) ) ( not ( = ?auto_2499293 ?auto_2499302 ) ) ( not ( = ?auto_2499293 ?auto_2499303 ) ) ( not ( = ?auto_2499293 ?auto_2499304 ) ) ( not ( = ?auto_2499293 ?auto_2499305 ) ) ( not ( = ?auto_2499293 ?auto_2499306 ) ) ( not ( = ?auto_2499293 ?auto_2499307 ) ) ( not ( = ?auto_2499293 ?auto_2499308 ) ) ( not ( = ?auto_2499293 ?auto_2499309 ) ) ( not ( = ?auto_2499294 ?auto_2499295 ) ) ( not ( = ?auto_2499294 ?auto_2499296 ) ) ( not ( = ?auto_2499294 ?auto_2499297 ) ) ( not ( = ?auto_2499294 ?auto_2499298 ) ) ( not ( = ?auto_2499294 ?auto_2499299 ) ) ( not ( = ?auto_2499294 ?auto_2499300 ) ) ( not ( = ?auto_2499294 ?auto_2499301 ) ) ( not ( = ?auto_2499294 ?auto_2499302 ) ) ( not ( = ?auto_2499294 ?auto_2499303 ) ) ( not ( = ?auto_2499294 ?auto_2499304 ) ) ( not ( = ?auto_2499294 ?auto_2499305 ) ) ( not ( = ?auto_2499294 ?auto_2499306 ) ) ( not ( = ?auto_2499294 ?auto_2499307 ) ) ( not ( = ?auto_2499294 ?auto_2499308 ) ) ( not ( = ?auto_2499294 ?auto_2499309 ) ) ( not ( = ?auto_2499295 ?auto_2499296 ) ) ( not ( = ?auto_2499295 ?auto_2499297 ) ) ( not ( = ?auto_2499295 ?auto_2499298 ) ) ( not ( = ?auto_2499295 ?auto_2499299 ) ) ( not ( = ?auto_2499295 ?auto_2499300 ) ) ( not ( = ?auto_2499295 ?auto_2499301 ) ) ( not ( = ?auto_2499295 ?auto_2499302 ) ) ( not ( = ?auto_2499295 ?auto_2499303 ) ) ( not ( = ?auto_2499295 ?auto_2499304 ) ) ( not ( = ?auto_2499295 ?auto_2499305 ) ) ( not ( = ?auto_2499295 ?auto_2499306 ) ) ( not ( = ?auto_2499295 ?auto_2499307 ) ) ( not ( = ?auto_2499295 ?auto_2499308 ) ) ( not ( = ?auto_2499295 ?auto_2499309 ) ) ( not ( = ?auto_2499296 ?auto_2499297 ) ) ( not ( = ?auto_2499296 ?auto_2499298 ) ) ( not ( = ?auto_2499296 ?auto_2499299 ) ) ( not ( = ?auto_2499296 ?auto_2499300 ) ) ( not ( = ?auto_2499296 ?auto_2499301 ) ) ( not ( = ?auto_2499296 ?auto_2499302 ) ) ( not ( = ?auto_2499296 ?auto_2499303 ) ) ( not ( = ?auto_2499296 ?auto_2499304 ) ) ( not ( = ?auto_2499296 ?auto_2499305 ) ) ( not ( = ?auto_2499296 ?auto_2499306 ) ) ( not ( = ?auto_2499296 ?auto_2499307 ) ) ( not ( = ?auto_2499296 ?auto_2499308 ) ) ( not ( = ?auto_2499296 ?auto_2499309 ) ) ( not ( = ?auto_2499297 ?auto_2499298 ) ) ( not ( = ?auto_2499297 ?auto_2499299 ) ) ( not ( = ?auto_2499297 ?auto_2499300 ) ) ( not ( = ?auto_2499297 ?auto_2499301 ) ) ( not ( = ?auto_2499297 ?auto_2499302 ) ) ( not ( = ?auto_2499297 ?auto_2499303 ) ) ( not ( = ?auto_2499297 ?auto_2499304 ) ) ( not ( = ?auto_2499297 ?auto_2499305 ) ) ( not ( = ?auto_2499297 ?auto_2499306 ) ) ( not ( = ?auto_2499297 ?auto_2499307 ) ) ( not ( = ?auto_2499297 ?auto_2499308 ) ) ( not ( = ?auto_2499297 ?auto_2499309 ) ) ( not ( = ?auto_2499298 ?auto_2499299 ) ) ( not ( = ?auto_2499298 ?auto_2499300 ) ) ( not ( = ?auto_2499298 ?auto_2499301 ) ) ( not ( = ?auto_2499298 ?auto_2499302 ) ) ( not ( = ?auto_2499298 ?auto_2499303 ) ) ( not ( = ?auto_2499298 ?auto_2499304 ) ) ( not ( = ?auto_2499298 ?auto_2499305 ) ) ( not ( = ?auto_2499298 ?auto_2499306 ) ) ( not ( = ?auto_2499298 ?auto_2499307 ) ) ( not ( = ?auto_2499298 ?auto_2499308 ) ) ( not ( = ?auto_2499298 ?auto_2499309 ) ) ( not ( = ?auto_2499299 ?auto_2499300 ) ) ( not ( = ?auto_2499299 ?auto_2499301 ) ) ( not ( = ?auto_2499299 ?auto_2499302 ) ) ( not ( = ?auto_2499299 ?auto_2499303 ) ) ( not ( = ?auto_2499299 ?auto_2499304 ) ) ( not ( = ?auto_2499299 ?auto_2499305 ) ) ( not ( = ?auto_2499299 ?auto_2499306 ) ) ( not ( = ?auto_2499299 ?auto_2499307 ) ) ( not ( = ?auto_2499299 ?auto_2499308 ) ) ( not ( = ?auto_2499299 ?auto_2499309 ) ) ( not ( = ?auto_2499300 ?auto_2499301 ) ) ( not ( = ?auto_2499300 ?auto_2499302 ) ) ( not ( = ?auto_2499300 ?auto_2499303 ) ) ( not ( = ?auto_2499300 ?auto_2499304 ) ) ( not ( = ?auto_2499300 ?auto_2499305 ) ) ( not ( = ?auto_2499300 ?auto_2499306 ) ) ( not ( = ?auto_2499300 ?auto_2499307 ) ) ( not ( = ?auto_2499300 ?auto_2499308 ) ) ( not ( = ?auto_2499300 ?auto_2499309 ) ) ( not ( = ?auto_2499301 ?auto_2499302 ) ) ( not ( = ?auto_2499301 ?auto_2499303 ) ) ( not ( = ?auto_2499301 ?auto_2499304 ) ) ( not ( = ?auto_2499301 ?auto_2499305 ) ) ( not ( = ?auto_2499301 ?auto_2499306 ) ) ( not ( = ?auto_2499301 ?auto_2499307 ) ) ( not ( = ?auto_2499301 ?auto_2499308 ) ) ( not ( = ?auto_2499301 ?auto_2499309 ) ) ( not ( = ?auto_2499302 ?auto_2499303 ) ) ( not ( = ?auto_2499302 ?auto_2499304 ) ) ( not ( = ?auto_2499302 ?auto_2499305 ) ) ( not ( = ?auto_2499302 ?auto_2499306 ) ) ( not ( = ?auto_2499302 ?auto_2499307 ) ) ( not ( = ?auto_2499302 ?auto_2499308 ) ) ( not ( = ?auto_2499302 ?auto_2499309 ) ) ( not ( = ?auto_2499303 ?auto_2499304 ) ) ( not ( = ?auto_2499303 ?auto_2499305 ) ) ( not ( = ?auto_2499303 ?auto_2499306 ) ) ( not ( = ?auto_2499303 ?auto_2499307 ) ) ( not ( = ?auto_2499303 ?auto_2499308 ) ) ( not ( = ?auto_2499303 ?auto_2499309 ) ) ( not ( = ?auto_2499304 ?auto_2499305 ) ) ( not ( = ?auto_2499304 ?auto_2499306 ) ) ( not ( = ?auto_2499304 ?auto_2499307 ) ) ( not ( = ?auto_2499304 ?auto_2499308 ) ) ( not ( = ?auto_2499304 ?auto_2499309 ) ) ( not ( = ?auto_2499305 ?auto_2499306 ) ) ( not ( = ?auto_2499305 ?auto_2499307 ) ) ( not ( = ?auto_2499305 ?auto_2499308 ) ) ( not ( = ?auto_2499305 ?auto_2499309 ) ) ( not ( = ?auto_2499306 ?auto_2499307 ) ) ( not ( = ?auto_2499306 ?auto_2499308 ) ) ( not ( = ?auto_2499306 ?auto_2499309 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2499307 ?auto_2499308 ?auto_2499309 )
      ( MAKE-16CRATE-VERIFY ?auto_2499293 ?auto_2499294 ?auto_2499295 ?auto_2499296 ?auto_2499297 ?auto_2499298 ?auto_2499299 ?auto_2499300 ?auto_2499301 ?auto_2499302 ?auto_2499303 ?auto_2499304 ?auto_2499305 ?auto_2499306 ?auto_2499307 ?auto_2499308 ?auto_2499309 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2499525 - SURFACE
      ?auto_2499526 - SURFACE
      ?auto_2499527 - SURFACE
      ?auto_2499528 - SURFACE
      ?auto_2499529 - SURFACE
      ?auto_2499530 - SURFACE
      ?auto_2499531 - SURFACE
      ?auto_2499532 - SURFACE
      ?auto_2499533 - SURFACE
      ?auto_2499534 - SURFACE
      ?auto_2499535 - SURFACE
      ?auto_2499536 - SURFACE
      ?auto_2499537 - SURFACE
      ?auto_2499538 - SURFACE
      ?auto_2499539 - SURFACE
      ?auto_2499540 - SURFACE
      ?auto_2499541 - SURFACE
    )
    :vars
    (
      ?auto_2499546 - HOIST
      ?auto_2499545 - PLACE
      ?auto_2499544 - TRUCK
      ?auto_2499543 - PLACE
      ?auto_2499542 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2499546 ?auto_2499545 ) ( SURFACE-AT ?auto_2499540 ?auto_2499545 ) ( CLEAR ?auto_2499540 ) ( IS-CRATE ?auto_2499541 ) ( not ( = ?auto_2499540 ?auto_2499541 ) ) ( AVAILABLE ?auto_2499546 ) ( ON ?auto_2499540 ?auto_2499539 ) ( not ( = ?auto_2499539 ?auto_2499540 ) ) ( not ( = ?auto_2499539 ?auto_2499541 ) ) ( TRUCK-AT ?auto_2499544 ?auto_2499543 ) ( not ( = ?auto_2499543 ?auto_2499545 ) ) ( HOIST-AT ?auto_2499542 ?auto_2499543 ) ( LIFTING ?auto_2499542 ?auto_2499541 ) ( not ( = ?auto_2499546 ?auto_2499542 ) ) ( ON ?auto_2499526 ?auto_2499525 ) ( ON ?auto_2499527 ?auto_2499526 ) ( ON ?auto_2499528 ?auto_2499527 ) ( ON ?auto_2499529 ?auto_2499528 ) ( ON ?auto_2499530 ?auto_2499529 ) ( ON ?auto_2499531 ?auto_2499530 ) ( ON ?auto_2499532 ?auto_2499531 ) ( ON ?auto_2499533 ?auto_2499532 ) ( ON ?auto_2499534 ?auto_2499533 ) ( ON ?auto_2499535 ?auto_2499534 ) ( ON ?auto_2499536 ?auto_2499535 ) ( ON ?auto_2499537 ?auto_2499536 ) ( ON ?auto_2499538 ?auto_2499537 ) ( ON ?auto_2499539 ?auto_2499538 ) ( not ( = ?auto_2499525 ?auto_2499526 ) ) ( not ( = ?auto_2499525 ?auto_2499527 ) ) ( not ( = ?auto_2499525 ?auto_2499528 ) ) ( not ( = ?auto_2499525 ?auto_2499529 ) ) ( not ( = ?auto_2499525 ?auto_2499530 ) ) ( not ( = ?auto_2499525 ?auto_2499531 ) ) ( not ( = ?auto_2499525 ?auto_2499532 ) ) ( not ( = ?auto_2499525 ?auto_2499533 ) ) ( not ( = ?auto_2499525 ?auto_2499534 ) ) ( not ( = ?auto_2499525 ?auto_2499535 ) ) ( not ( = ?auto_2499525 ?auto_2499536 ) ) ( not ( = ?auto_2499525 ?auto_2499537 ) ) ( not ( = ?auto_2499525 ?auto_2499538 ) ) ( not ( = ?auto_2499525 ?auto_2499539 ) ) ( not ( = ?auto_2499525 ?auto_2499540 ) ) ( not ( = ?auto_2499525 ?auto_2499541 ) ) ( not ( = ?auto_2499526 ?auto_2499527 ) ) ( not ( = ?auto_2499526 ?auto_2499528 ) ) ( not ( = ?auto_2499526 ?auto_2499529 ) ) ( not ( = ?auto_2499526 ?auto_2499530 ) ) ( not ( = ?auto_2499526 ?auto_2499531 ) ) ( not ( = ?auto_2499526 ?auto_2499532 ) ) ( not ( = ?auto_2499526 ?auto_2499533 ) ) ( not ( = ?auto_2499526 ?auto_2499534 ) ) ( not ( = ?auto_2499526 ?auto_2499535 ) ) ( not ( = ?auto_2499526 ?auto_2499536 ) ) ( not ( = ?auto_2499526 ?auto_2499537 ) ) ( not ( = ?auto_2499526 ?auto_2499538 ) ) ( not ( = ?auto_2499526 ?auto_2499539 ) ) ( not ( = ?auto_2499526 ?auto_2499540 ) ) ( not ( = ?auto_2499526 ?auto_2499541 ) ) ( not ( = ?auto_2499527 ?auto_2499528 ) ) ( not ( = ?auto_2499527 ?auto_2499529 ) ) ( not ( = ?auto_2499527 ?auto_2499530 ) ) ( not ( = ?auto_2499527 ?auto_2499531 ) ) ( not ( = ?auto_2499527 ?auto_2499532 ) ) ( not ( = ?auto_2499527 ?auto_2499533 ) ) ( not ( = ?auto_2499527 ?auto_2499534 ) ) ( not ( = ?auto_2499527 ?auto_2499535 ) ) ( not ( = ?auto_2499527 ?auto_2499536 ) ) ( not ( = ?auto_2499527 ?auto_2499537 ) ) ( not ( = ?auto_2499527 ?auto_2499538 ) ) ( not ( = ?auto_2499527 ?auto_2499539 ) ) ( not ( = ?auto_2499527 ?auto_2499540 ) ) ( not ( = ?auto_2499527 ?auto_2499541 ) ) ( not ( = ?auto_2499528 ?auto_2499529 ) ) ( not ( = ?auto_2499528 ?auto_2499530 ) ) ( not ( = ?auto_2499528 ?auto_2499531 ) ) ( not ( = ?auto_2499528 ?auto_2499532 ) ) ( not ( = ?auto_2499528 ?auto_2499533 ) ) ( not ( = ?auto_2499528 ?auto_2499534 ) ) ( not ( = ?auto_2499528 ?auto_2499535 ) ) ( not ( = ?auto_2499528 ?auto_2499536 ) ) ( not ( = ?auto_2499528 ?auto_2499537 ) ) ( not ( = ?auto_2499528 ?auto_2499538 ) ) ( not ( = ?auto_2499528 ?auto_2499539 ) ) ( not ( = ?auto_2499528 ?auto_2499540 ) ) ( not ( = ?auto_2499528 ?auto_2499541 ) ) ( not ( = ?auto_2499529 ?auto_2499530 ) ) ( not ( = ?auto_2499529 ?auto_2499531 ) ) ( not ( = ?auto_2499529 ?auto_2499532 ) ) ( not ( = ?auto_2499529 ?auto_2499533 ) ) ( not ( = ?auto_2499529 ?auto_2499534 ) ) ( not ( = ?auto_2499529 ?auto_2499535 ) ) ( not ( = ?auto_2499529 ?auto_2499536 ) ) ( not ( = ?auto_2499529 ?auto_2499537 ) ) ( not ( = ?auto_2499529 ?auto_2499538 ) ) ( not ( = ?auto_2499529 ?auto_2499539 ) ) ( not ( = ?auto_2499529 ?auto_2499540 ) ) ( not ( = ?auto_2499529 ?auto_2499541 ) ) ( not ( = ?auto_2499530 ?auto_2499531 ) ) ( not ( = ?auto_2499530 ?auto_2499532 ) ) ( not ( = ?auto_2499530 ?auto_2499533 ) ) ( not ( = ?auto_2499530 ?auto_2499534 ) ) ( not ( = ?auto_2499530 ?auto_2499535 ) ) ( not ( = ?auto_2499530 ?auto_2499536 ) ) ( not ( = ?auto_2499530 ?auto_2499537 ) ) ( not ( = ?auto_2499530 ?auto_2499538 ) ) ( not ( = ?auto_2499530 ?auto_2499539 ) ) ( not ( = ?auto_2499530 ?auto_2499540 ) ) ( not ( = ?auto_2499530 ?auto_2499541 ) ) ( not ( = ?auto_2499531 ?auto_2499532 ) ) ( not ( = ?auto_2499531 ?auto_2499533 ) ) ( not ( = ?auto_2499531 ?auto_2499534 ) ) ( not ( = ?auto_2499531 ?auto_2499535 ) ) ( not ( = ?auto_2499531 ?auto_2499536 ) ) ( not ( = ?auto_2499531 ?auto_2499537 ) ) ( not ( = ?auto_2499531 ?auto_2499538 ) ) ( not ( = ?auto_2499531 ?auto_2499539 ) ) ( not ( = ?auto_2499531 ?auto_2499540 ) ) ( not ( = ?auto_2499531 ?auto_2499541 ) ) ( not ( = ?auto_2499532 ?auto_2499533 ) ) ( not ( = ?auto_2499532 ?auto_2499534 ) ) ( not ( = ?auto_2499532 ?auto_2499535 ) ) ( not ( = ?auto_2499532 ?auto_2499536 ) ) ( not ( = ?auto_2499532 ?auto_2499537 ) ) ( not ( = ?auto_2499532 ?auto_2499538 ) ) ( not ( = ?auto_2499532 ?auto_2499539 ) ) ( not ( = ?auto_2499532 ?auto_2499540 ) ) ( not ( = ?auto_2499532 ?auto_2499541 ) ) ( not ( = ?auto_2499533 ?auto_2499534 ) ) ( not ( = ?auto_2499533 ?auto_2499535 ) ) ( not ( = ?auto_2499533 ?auto_2499536 ) ) ( not ( = ?auto_2499533 ?auto_2499537 ) ) ( not ( = ?auto_2499533 ?auto_2499538 ) ) ( not ( = ?auto_2499533 ?auto_2499539 ) ) ( not ( = ?auto_2499533 ?auto_2499540 ) ) ( not ( = ?auto_2499533 ?auto_2499541 ) ) ( not ( = ?auto_2499534 ?auto_2499535 ) ) ( not ( = ?auto_2499534 ?auto_2499536 ) ) ( not ( = ?auto_2499534 ?auto_2499537 ) ) ( not ( = ?auto_2499534 ?auto_2499538 ) ) ( not ( = ?auto_2499534 ?auto_2499539 ) ) ( not ( = ?auto_2499534 ?auto_2499540 ) ) ( not ( = ?auto_2499534 ?auto_2499541 ) ) ( not ( = ?auto_2499535 ?auto_2499536 ) ) ( not ( = ?auto_2499535 ?auto_2499537 ) ) ( not ( = ?auto_2499535 ?auto_2499538 ) ) ( not ( = ?auto_2499535 ?auto_2499539 ) ) ( not ( = ?auto_2499535 ?auto_2499540 ) ) ( not ( = ?auto_2499535 ?auto_2499541 ) ) ( not ( = ?auto_2499536 ?auto_2499537 ) ) ( not ( = ?auto_2499536 ?auto_2499538 ) ) ( not ( = ?auto_2499536 ?auto_2499539 ) ) ( not ( = ?auto_2499536 ?auto_2499540 ) ) ( not ( = ?auto_2499536 ?auto_2499541 ) ) ( not ( = ?auto_2499537 ?auto_2499538 ) ) ( not ( = ?auto_2499537 ?auto_2499539 ) ) ( not ( = ?auto_2499537 ?auto_2499540 ) ) ( not ( = ?auto_2499537 ?auto_2499541 ) ) ( not ( = ?auto_2499538 ?auto_2499539 ) ) ( not ( = ?auto_2499538 ?auto_2499540 ) ) ( not ( = ?auto_2499538 ?auto_2499541 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2499539 ?auto_2499540 ?auto_2499541 )
      ( MAKE-16CRATE-VERIFY ?auto_2499525 ?auto_2499526 ?auto_2499527 ?auto_2499528 ?auto_2499529 ?auto_2499530 ?auto_2499531 ?auto_2499532 ?auto_2499533 ?auto_2499534 ?auto_2499535 ?auto_2499536 ?auto_2499537 ?auto_2499538 ?auto_2499539 ?auto_2499540 ?auto_2499541 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2499773 - SURFACE
      ?auto_2499774 - SURFACE
      ?auto_2499775 - SURFACE
      ?auto_2499776 - SURFACE
      ?auto_2499777 - SURFACE
      ?auto_2499778 - SURFACE
      ?auto_2499779 - SURFACE
      ?auto_2499780 - SURFACE
      ?auto_2499781 - SURFACE
      ?auto_2499782 - SURFACE
      ?auto_2499783 - SURFACE
      ?auto_2499784 - SURFACE
      ?auto_2499785 - SURFACE
      ?auto_2499786 - SURFACE
      ?auto_2499787 - SURFACE
      ?auto_2499788 - SURFACE
      ?auto_2499789 - SURFACE
    )
    :vars
    (
      ?auto_2499795 - HOIST
      ?auto_2499792 - PLACE
      ?auto_2499791 - TRUCK
      ?auto_2499794 - PLACE
      ?auto_2499790 - HOIST
      ?auto_2499793 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2499795 ?auto_2499792 ) ( SURFACE-AT ?auto_2499788 ?auto_2499792 ) ( CLEAR ?auto_2499788 ) ( IS-CRATE ?auto_2499789 ) ( not ( = ?auto_2499788 ?auto_2499789 ) ) ( AVAILABLE ?auto_2499795 ) ( ON ?auto_2499788 ?auto_2499787 ) ( not ( = ?auto_2499787 ?auto_2499788 ) ) ( not ( = ?auto_2499787 ?auto_2499789 ) ) ( TRUCK-AT ?auto_2499791 ?auto_2499794 ) ( not ( = ?auto_2499794 ?auto_2499792 ) ) ( HOIST-AT ?auto_2499790 ?auto_2499794 ) ( not ( = ?auto_2499795 ?auto_2499790 ) ) ( AVAILABLE ?auto_2499790 ) ( SURFACE-AT ?auto_2499789 ?auto_2499794 ) ( ON ?auto_2499789 ?auto_2499793 ) ( CLEAR ?auto_2499789 ) ( not ( = ?auto_2499788 ?auto_2499793 ) ) ( not ( = ?auto_2499789 ?auto_2499793 ) ) ( not ( = ?auto_2499787 ?auto_2499793 ) ) ( ON ?auto_2499774 ?auto_2499773 ) ( ON ?auto_2499775 ?auto_2499774 ) ( ON ?auto_2499776 ?auto_2499775 ) ( ON ?auto_2499777 ?auto_2499776 ) ( ON ?auto_2499778 ?auto_2499777 ) ( ON ?auto_2499779 ?auto_2499778 ) ( ON ?auto_2499780 ?auto_2499779 ) ( ON ?auto_2499781 ?auto_2499780 ) ( ON ?auto_2499782 ?auto_2499781 ) ( ON ?auto_2499783 ?auto_2499782 ) ( ON ?auto_2499784 ?auto_2499783 ) ( ON ?auto_2499785 ?auto_2499784 ) ( ON ?auto_2499786 ?auto_2499785 ) ( ON ?auto_2499787 ?auto_2499786 ) ( not ( = ?auto_2499773 ?auto_2499774 ) ) ( not ( = ?auto_2499773 ?auto_2499775 ) ) ( not ( = ?auto_2499773 ?auto_2499776 ) ) ( not ( = ?auto_2499773 ?auto_2499777 ) ) ( not ( = ?auto_2499773 ?auto_2499778 ) ) ( not ( = ?auto_2499773 ?auto_2499779 ) ) ( not ( = ?auto_2499773 ?auto_2499780 ) ) ( not ( = ?auto_2499773 ?auto_2499781 ) ) ( not ( = ?auto_2499773 ?auto_2499782 ) ) ( not ( = ?auto_2499773 ?auto_2499783 ) ) ( not ( = ?auto_2499773 ?auto_2499784 ) ) ( not ( = ?auto_2499773 ?auto_2499785 ) ) ( not ( = ?auto_2499773 ?auto_2499786 ) ) ( not ( = ?auto_2499773 ?auto_2499787 ) ) ( not ( = ?auto_2499773 ?auto_2499788 ) ) ( not ( = ?auto_2499773 ?auto_2499789 ) ) ( not ( = ?auto_2499773 ?auto_2499793 ) ) ( not ( = ?auto_2499774 ?auto_2499775 ) ) ( not ( = ?auto_2499774 ?auto_2499776 ) ) ( not ( = ?auto_2499774 ?auto_2499777 ) ) ( not ( = ?auto_2499774 ?auto_2499778 ) ) ( not ( = ?auto_2499774 ?auto_2499779 ) ) ( not ( = ?auto_2499774 ?auto_2499780 ) ) ( not ( = ?auto_2499774 ?auto_2499781 ) ) ( not ( = ?auto_2499774 ?auto_2499782 ) ) ( not ( = ?auto_2499774 ?auto_2499783 ) ) ( not ( = ?auto_2499774 ?auto_2499784 ) ) ( not ( = ?auto_2499774 ?auto_2499785 ) ) ( not ( = ?auto_2499774 ?auto_2499786 ) ) ( not ( = ?auto_2499774 ?auto_2499787 ) ) ( not ( = ?auto_2499774 ?auto_2499788 ) ) ( not ( = ?auto_2499774 ?auto_2499789 ) ) ( not ( = ?auto_2499774 ?auto_2499793 ) ) ( not ( = ?auto_2499775 ?auto_2499776 ) ) ( not ( = ?auto_2499775 ?auto_2499777 ) ) ( not ( = ?auto_2499775 ?auto_2499778 ) ) ( not ( = ?auto_2499775 ?auto_2499779 ) ) ( not ( = ?auto_2499775 ?auto_2499780 ) ) ( not ( = ?auto_2499775 ?auto_2499781 ) ) ( not ( = ?auto_2499775 ?auto_2499782 ) ) ( not ( = ?auto_2499775 ?auto_2499783 ) ) ( not ( = ?auto_2499775 ?auto_2499784 ) ) ( not ( = ?auto_2499775 ?auto_2499785 ) ) ( not ( = ?auto_2499775 ?auto_2499786 ) ) ( not ( = ?auto_2499775 ?auto_2499787 ) ) ( not ( = ?auto_2499775 ?auto_2499788 ) ) ( not ( = ?auto_2499775 ?auto_2499789 ) ) ( not ( = ?auto_2499775 ?auto_2499793 ) ) ( not ( = ?auto_2499776 ?auto_2499777 ) ) ( not ( = ?auto_2499776 ?auto_2499778 ) ) ( not ( = ?auto_2499776 ?auto_2499779 ) ) ( not ( = ?auto_2499776 ?auto_2499780 ) ) ( not ( = ?auto_2499776 ?auto_2499781 ) ) ( not ( = ?auto_2499776 ?auto_2499782 ) ) ( not ( = ?auto_2499776 ?auto_2499783 ) ) ( not ( = ?auto_2499776 ?auto_2499784 ) ) ( not ( = ?auto_2499776 ?auto_2499785 ) ) ( not ( = ?auto_2499776 ?auto_2499786 ) ) ( not ( = ?auto_2499776 ?auto_2499787 ) ) ( not ( = ?auto_2499776 ?auto_2499788 ) ) ( not ( = ?auto_2499776 ?auto_2499789 ) ) ( not ( = ?auto_2499776 ?auto_2499793 ) ) ( not ( = ?auto_2499777 ?auto_2499778 ) ) ( not ( = ?auto_2499777 ?auto_2499779 ) ) ( not ( = ?auto_2499777 ?auto_2499780 ) ) ( not ( = ?auto_2499777 ?auto_2499781 ) ) ( not ( = ?auto_2499777 ?auto_2499782 ) ) ( not ( = ?auto_2499777 ?auto_2499783 ) ) ( not ( = ?auto_2499777 ?auto_2499784 ) ) ( not ( = ?auto_2499777 ?auto_2499785 ) ) ( not ( = ?auto_2499777 ?auto_2499786 ) ) ( not ( = ?auto_2499777 ?auto_2499787 ) ) ( not ( = ?auto_2499777 ?auto_2499788 ) ) ( not ( = ?auto_2499777 ?auto_2499789 ) ) ( not ( = ?auto_2499777 ?auto_2499793 ) ) ( not ( = ?auto_2499778 ?auto_2499779 ) ) ( not ( = ?auto_2499778 ?auto_2499780 ) ) ( not ( = ?auto_2499778 ?auto_2499781 ) ) ( not ( = ?auto_2499778 ?auto_2499782 ) ) ( not ( = ?auto_2499778 ?auto_2499783 ) ) ( not ( = ?auto_2499778 ?auto_2499784 ) ) ( not ( = ?auto_2499778 ?auto_2499785 ) ) ( not ( = ?auto_2499778 ?auto_2499786 ) ) ( not ( = ?auto_2499778 ?auto_2499787 ) ) ( not ( = ?auto_2499778 ?auto_2499788 ) ) ( not ( = ?auto_2499778 ?auto_2499789 ) ) ( not ( = ?auto_2499778 ?auto_2499793 ) ) ( not ( = ?auto_2499779 ?auto_2499780 ) ) ( not ( = ?auto_2499779 ?auto_2499781 ) ) ( not ( = ?auto_2499779 ?auto_2499782 ) ) ( not ( = ?auto_2499779 ?auto_2499783 ) ) ( not ( = ?auto_2499779 ?auto_2499784 ) ) ( not ( = ?auto_2499779 ?auto_2499785 ) ) ( not ( = ?auto_2499779 ?auto_2499786 ) ) ( not ( = ?auto_2499779 ?auto_2499787 ) ) ( not ( = ?auto_2499779 ?auto_2499788 ) ) ( not ( = ?auto_2499779 ?auto_2499789 ) ) ( not ( = ?auto_2499779 ?auto_2499793 ) ) ( not ( = ?auto_2499780 ?auto_2499781 ) ) ( not ( = ?auto_2499780 ?auto_2499782 ) ) ( not ( = ?auto_2499780 ?auto_2499783 ) ) ( not ( = ?auto_2499780 ?auto_2499784 ) ) ( not ( = ?auto_2499780 ?auto_2499785 ) ) ( not ( = ?auto_2499780 ?auto_2499786 ) ) ( not ( = ?auto_2499780 ?auto_2499787 ) ) ( not ( = ?auto_2499780 ?auto_2499788 ) ) ( not ( = ?auto_2499780 ?auto_2499789 ) ) ( not ( = ?auto_2499780 ?auto_2499793 ) ) ( not ( = ?auto_2499781 ?auto_2499782 ) ) ( not ( = ?auto_2499781 ?auto_2499783 ) ) ( not ( = ?auto_2499781 ?auto_2499784 ) ) ( not ( = ?auto_2499781 ?auto_2499785 ) ) ( not ( = ?auto_2499781 ?auto_2499786 ) ) ( not ( = ?auto_2499781 ?auto_2499787 ) ) ( not ( = ?auto_2499781 ?auto_2499788 ) ) ( not ( = ?auto_2499781 ?auto_2499789 ) ) ( not ( = ?auto_2499781 ?auto_2499793 ) ) ( not ( = ?auto_2499782 ?auto_2499783 ) ) ( not ( = ?auto_2499782 ?auto_2499784 ) ) ( not ( = ?auto_2499782 ?auto_2499785 ) ) ( not ( = ?auto_2499782 ?auto_2499786 ) ) ( not ( = ?auto_2499782 ?auto_2499787 ) ) ( not ( = ?auto_2499782 ?auto_2499788 ) ) ( not ( = ?auto_2499782 ?auto_2499789 ) ) ( not ( = ?auto_2499782 ?auto_2499793 ) ) ( not ( = ?auto_2499783 ?auto_2499784 ) ) ( not ( = ?auto_2499783 ?auto_2499785 ) ) ( not ( = ?auto_2499783 ?auto_2499786 ) ) ( not ( = ?auto_2499783 ?auto_2499787 ) ) ( not ( = ?auto_2499783 ?auto_2499788 ) ) ( not ( = ?auto_2499783 ?auto_2499789 ) ) ( not ( = ?auto_2499783 ?auto_2499793 ) ) ( not ( = ?auto_2499784 ?auto_2499785 ) ) ( not ( = ?auto_2499784 ?auto_2499786 ) ) ( not ( = ?auto_2499784 ?auto_2499787 ) ) ( not ( = ?auto_2499784 ?auto_2499788 ) ) ( not ( = ?auto_2499784 ?auto_2499789 ) ) ( not ( = ?auto_2499784 ?auto_2499793 ) ) ( not ( = ?auto_2499785 ?auto_2499786 ) ) ( not ( = ?auto_2499785 ?auto_2499787 ) ) ( not ( = ?auto_2499785 ?auto_2499788 ) ) ( not ( = ?auto_2499785 ?auto_2499789 ) ) ( not ( = ?auto_2499785 ?auto_2499793 ) ) ( not ( = ?auto_2499786 ?auto_2499787 ) ) ( not ( = ?auto_2499786 ?auto_2499788 ) ) ( not ( = ?auto_2499786 ?auto_2499789 ) ) ( not ( = ?auto_2499786 ?auto_2499793 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2499787 ?auto_2499788 ?auto_2499789 )
      ( MAKE-16CRATE-VERIFY ?auto_2499773 ?auto_2499774 ?auto_2499775 ?auto_2499776 ?auto_2499777 ?auto_2499778 ?auto_2499779 ?auto_2499780 ?auto_2499781 ?auto_2499782 ?auto_2499783 ?auto_2499784 ?auto_2499785 ?auto_2499786 ?auto_2499787 ?auto_2499788 ?auto_2499789 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2500022 - SURFACE
      ?auto_2500023 - SURFACE
      ?auto_2500024 - SURFACE
      ?auto_2500025 - SURFACE
      ?auto_2500026 - SURFACE
      ?auto_2500027 - SURFACE
      ?auto_2500028 - SURFACE
      ?auto_2500029 - SURFACE
      ?auto_2500030 - SURFACE
      ?auto_2500031 - SURFACE
      ?auto_2500032 - SURFACE
      ?auto_2500033 - SURFACE
      ?auto_2500034 - SURFACE
      ?auto_2500035 - SURFACE
      ?auto_2500036 - SURFACE
      ?auto_2500037 - SURFACE
      ?auto_2500038 - SURFACE
    )
    :vars
    (
      ?auto_2500039 - HOIST
      ?auto_2500043 - PLACE
      ?auto_2500042 - PLACE
      ?auto_2500040 - HOIST
      ?auto_2500044 - SURFACE
      ?auto_2500041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2500039 ?auto_2500043 ) ( SURFACE-AT ?auto_2500037 ?auto_2500043 ) ( CLEAR ?auto_2500037 ) ( IS-CRATE ?auto_2500038 ) ( not ( = ?auto_2500037 ?auto_2500038 ) ) ( AVAILABLE ?auto_2500039 ) ( ON ?auto_2500037 ?auto_2500036 ) ( not ( = ?auto_2500036 ?auto_2500037 ) ) ( not ( = ?auto_2500036 ?auto_2500038 ) ) ( not ( = ?auto_2500042 ?auto_2500043 ) ) ( HOIST-AT ?auto_2500040 ?auto_2500042 ) ( not ( = ?auto_2500039 ?auto_2500040 ) ) ( AVAILABLE ?auto_2500040 ) ( SURFACE-AT ?auto_2500038 ?auto_2500042 ) ( ON ?auto_2500038 ?auto_2500044 ) ( CLEAR ?auto_2500038 ) ( not ( = ?auto_2500037 ?auto_2500044 ) ) ( not ( = ?auto_2500038 ?auto_2500044 ) ) ( not ( = ?auto_2500036 ?auto_2500044 ) ) ( TRUCK-AT ?auto_2500041 ?auto_2500043 ) ( ON ?auto_2500023 ?auto_2500022 ) ( ON ?auto_2500024 ?auto_2500023 ) ( ON ?auto_2500025 ?auto_2500024 ) ( ON ?auto_2500026 ?auto_2500025 ) ( ON ?auto_2500027 ?auto_2500026 ) ( ON ?auto_2500028 ?auto_2500027 ) ( ON ?auto_2500029 ?auto_2500028 ) ( ON ?auto_2500030 ?auto_2500029 ) ( ON ?auto_2500031 ?auto_2500030 ) ( ON ?auto_2500032 ?auto_2500031 ) ( ON ?auto_2500033 ?auto_2500032 ) ( ON ?auto_2500034 ?auto_2500033 ) ( ON ?auto_2500035 ?auto_2500034 ) ( ON ?auto_2500036 ?auto_2500035 ) ( not ( = ?auto_2500022 ?auto_2500023 ) ) ( not ( = ?auto_2500022 ?auto_2500024 ) ) ( not ( = ?auto_2500022 ?auto_2500025 ) ) ( not ( = ?auto_2500022 ?auto_2500026 ) ) ( not ( = ?auto_2500022 ?auto_2500027 ) ) ( not ( = ?auto_2500022 ?auto_2500028 ) ) ( not ( = ?auto_2500022 ?auto_2500029 ) ) ( not ( = ?auto_2500022 ?auto_2500030 ) ) ( not ( = ?auto_2500022 ?auto_2500031 ) ) ( not ( = ?auto_2500022 ?auto_2500032 ) ) ( not ( = ?auto_2500022 ?auto_2500033 ) ) ( not ( = ?auto_2500022 ?auto_2500034 ) ) ( not ( = ?auto_2500022 ?auto_2500035 ) ) ( not ( = ?auto_2500022 ?auto_2500036 ) ) ( not ( = ?auto_2500022 ?auto_2500037 ) ) ( not ( = ?auto_2500022 ?auto_2500038 ) ) ( not ( = ?auto_2500022 ?auto_2500044 ) ) ( not ( = ?auto_2500023 ?auto_2500024 ) ) ( not ( = ?auto_2500023 ?auto_2500025 ) ) ( not ( = ?auto_2500023 ?auto_2500026 ) ) ( not ( = ?auto_2500023 ?auto_2500027 ) ) ( not ( = ?auto_2500023 ?auto_2500028 ) ) ( not ( = ?auto_2500023 ?auto_2500029 ) ) ( not ( = ?auto_2500023 ?auto_2500030 ) ) ( not ( = ?auto_2500023 ?auto_2500031 ) ) ( not ( = ?auto_2500023 ?auto_2500032 ) ) ( not ( = ?auto_2500023 ?auto_2500033 ) ) ( not ( = ?auto_2500023 ?auto_2500034 ) ) ( not ( = ?auto_2500023 ?auto_2500035 ) ) ( not ( = ?auto_2500023 ?auto_2500036 ) ) ( not ( = ?auto_2500023 ?auto_2500037 ) ) ( not ( = ?auto_2500023 ?auto_2500038 ) ) ( not ( = ?auto_2500023 ?auto_2500044 ) ) ( not ( = ?auto_2500024 ?auto_2500025 ) ) ( not ( = ?auto_2500024 ?auto_2500026 ) ) ( not ( = ?auto_2500024 ?auto_2500027 ) ) ( not ( = ?auto_2500024 ?auto_2500028 ) ) ( not ( = ?auto_2500024 ?auto_2500029 ) ) ( not ( = ?auto_2500024 ?auto_2500030 ) ) ( not ( = ?auto_2500024 ?auto_2500031 ) ) ( not ( = ?auto_2500024 ?auto_2500032 ) ) ( not ( = ?auto_2500024 ?auto_2500033 ) ) ( not ( = ?auto_2500024 ?auto_2500034 ) ) ( not ( = ?auto_2500024 ?auto_2500035 ) ) ( not ( = ?auto_2500024 ?auto_2500036 ) ) ( not ( = ?auto_2500024 ?auto_2500037 ) ) ( not ( = ?auto_2500024 ?auto_2500038 ) ) ( not ( = ?auto_2500024 ?auto_2500044 ) ) ( not ( = ?auto_2500025 ?auto_2500026 ) ) ( not ( = ?auto_2500025 ?auto_2500027 ) ) ( not ( = ?auto_2500025 ?auto_2500028 ) ) ( not ( = ?auto_2500025 ?auto_2500029 ) ) ( not ( = ?auto_2500025 ?auto_2500030 ) ) ( not ( = ?auto_2500025 ?auto_2500031 ) ) ( not ( = ?auto_2500025 ?auto_2500032 ) ) ( not ( = ?auto_2500025 ?auto_2500033 ) ) ( not ( = ?auto_2500025 ?auto_2500034 ) ) ( not ( = ?auto_2500025 ?auto_2500035 ) ) ( not ( = ?auto_2500025 ?auto_2500036 ) ) ( not ( = ?auto_2500025 ?auto_2500037 ) ) ( not ( = ?auto_2500025 ?auto_2500038 ) ) ( not ( = ?auto_2500025 ?auto_2500044 ) ) ( not ( = ?auto_2500026 ?auto_2500027 ) ) ( not ( = ?auto_2500026 ?auto_2500028 ) ) ( not ( = ?auto_2500026 ?auto_2500029 ) ) ( not ( = ?auto_2500026 ?auto_2500030 ) ) ( not ( = ?auto_2500026 ?auto_2500031 ) ) ( not ( = ?auto_2500026 ?auto_2500032 ) ) ( not ( = ?auto_2500026 ?auto_2500033 ) ) ( not ( = ?auto_2500026 ?auto_2500034 ) ) ( not ( = ?auto_2500026 ?auto_2500035 ) ) ( not ( = ?auto_2500026 ?auto_2500036 ) ) ( not ( = ?auto_2500026 ?auto_2500037 ) ) ( not ( = ?auto_2500026 ?auto_2500038 ) ) ( not ( = ?auto_2500026 ?auto_2500044 ) ) ( not ( = ?auto_2500027 ?auto_2500028 ) ) ( not ( = ?auto_2500027 ?auto_2500029 ) ) ( not ( = ?auto_2500027 ?auto_2500030 ) ) ( not ( = ?auto_2500027 ?auto_2500031 ) ) ( not ( = ?auto_2500027 ?auto_2500032 ) ) ( not ( = ?auto_2500027 ?auto_2500033 ) ) ( not ( = ?auto_2500027 ?auto_2500034 ) ) ( not ( = ?auto_2500027 ?auto_2500035 ) ) ( not ( = ?auto_2500027 ?auto_2500036 ) ) ( not ( = ?auto_2500027 ?auto_2500037 ) ) ( not ( = ?auto_2500027 ?auto_2500038 ) ) ( not ( = ?auto_2500027 ?auto_2500044 ) ) ( not ( = ?auto_2500028 ?auto_2500029 ) ) ( not ( = ?auto_2500028 ?auto_2500030 ) ) ( not ( = ?auto_2500028 ?auto_2500031 ) ) ( not ( = ?auto_2500028 ?auto_2500032 ) ) ( not ( = ?auto_2500028 ?auto_2500033 ) ) ( not ( = ?auto_2500028 ?auto_2500034 ) ) ( not ( = ?auto_2500028 ?auto_2500035 ) ) ( not ( = ?auto_2500028 ?auto_2500036 ) ) ( not ( = ?auto_2500028 ?auto_2500037 ) ) ( not ( = ?auto_2500028 ?auto_2500038 ) ) ( not ( = ?auto_2500028 ?auto_2500044 ) ) ( not ( = ?auto_2500029 ?auto_2500030 ) ) ( not ( = ?auto_2500029 ?auto_2500031 ) ) ( not ( = ?auto_2500029 ?auto_2500032 ) ) ( not ( = ?auto_2500029 ?auto_2500033 ) ) ( not ( = ?auto_2500029 ?auto_2500034 ) ) ( not ( = ?auto_2500029 ?auto_2500035 ) ) ( not ( = ?auto_2500029 ?auto_2500036 ) ) ( not ( = ?auto_2500029 ?auto_2500037 ) ) ( not ( = ?auto_2500029 ?auto_2500038 ) ) ( not ( = ?auto_2500029 ?auto_2500044 ) ) ( not ( = ?auto_2500030 ?auto_2500031 ) ) ( not ( = ?auto_2500030 ?auto_2500032 ) ) ( not ( = ?auto_2500030 ?auto_2500033 ) ) ( not ( = ?auto_2500030 ?auto_2500034 ) ) ( not ( = ?auto_2500030 ?auto_2500035 ) ) ( not ( = ?auto_2500030 ?auto_2500036 ) ) ( not ( = ?auto_2500030 ?auto_2500037 ) ) ( not ( = ?auto_2500030 ?auto_2500038 ) ) ( not ( = ?auto_2500030 ?auto_2500044 ) ) ( not ( = ?auto_2500031 ?auto_2500032 ) ) ( not ( = ?auto_2500031 ?auto_2500033 ) ) ( not ( = ?auto_2500031 ?auto_2500034 ) ) ( not ( = ?auto_2500031 ?auto_2500035 ) ) ( not ( = ?auto_2500031 ?auto_2500036 ) ) ( not ( = ?auto_2500031 ?auto_2500037 ) ) ( not ( = ?auto_2500031 ?auto_2500038 ) ) ( not ( = ?auto_2500031 ?auto_2500044 ) ) ( not ( = ?auto_2500032 ?auto_2500033 ) ) ( not ( = ?auto_2500032 ?auto_2500034 ) ) ( not ( = ?auto_2500032 ?auto_2500035 ) ) ( not ( = ?auto_2500032 ?auto_2500036 ) ) ( not ( = ?auto_2500032 ?auto_2500037 ) ) ( not ( = ?auto_2500032 ?auto_2500038 ) ) ( not ( = ?auto_2500032 ?auto_2500044 ) ) ( not ( = ?auto_2500033 ?auto_2500034 ) ) ( not ( = ?auto_2500033 ?auto_2500035 ) ) ( not ( = ?auto_2500033 ?auto_2500036 ) ) ( not ( = ?auto_2500033 ?auto_2500037 ) ) ( not ( = ?auto_2500033 ?auto_2500038 ) ) ( not ( = ?auto_2500033 ?auto_2500044 ) ) ( not ( = ?auto_2500034 ?auto_2500035 ) ) ( not ( = ?auto_2500034 ?auto_2500036 ) ) ( not ( = ?auto_2500034 ?auto_2500037 ) ) ( not ( = ?auto_2500034 ?auto_2500038 ) ) ( not ( = ?auto_2500034 ?auto_2500044 ) ) ( not ( = ?auto_2500035 ?auto_2500036 ) ) ( not ( = ?auto_2500035 ?auto_2500037 ) ) ( not ( = ?auto_2500035 ?auto_2500038 ) ) ( not ( = ?auto_2500035 ?auto_2500044 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2500036 ?auto_2500037 ?auto_2500038 )
      ( MAKE-16CRATE-VERIFY ?auto_2500022 ?auto_2500023 ?auto_2500024 ?auto_2500025 ?auto_2500026 ?auto_2500027 ?auto_2500028 ?auto_2500029 ?auto_2500030 ?auto_2500031 ?auto_2500032 ?auto_2500033 ?auto_2500034 ?auto_2500035 ?auto_2500036 ?auto_2500037 ?auto_2500038 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2500271 - SURFACE
      ?auto_2500272 - SURFACE
      ?auto_2500273 - SURFACE
      ?auto_2500274 - SURFACE
      ?auto_2500275 - SURFACE
      ?auto_2500276 - SURFACE
      ?auto_2500277 - SURFACE
      ?auto_2500278 - SURFACE
      ?auto_2500279 - SURFACE
      ?auto_2500280 - SURFACE
      ?auto_2500281 - SURFACE
      ?auto_2500282 - SURFACE
      ?auto_2500283 - SURFACE
      ?auto_2500284 - SURFACE
      ?auto_2500285 - SURFACE
      ?auto_2500286 - SURFACE
      ?auto_2500287 - SURFACE
    )
    :vars
    (
      ?auto_2500289 - HOIST
      ?auto_2500288 - PLACE
      ?auto_2500292 - PLACE
      ?auto_2500293 - HOIST
      ?auto_2500290 - SURFACE
      ?auto_2500291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2500289 ?auto_2500288 ) ( IS-CRATE ?auto_2500287 ) ( not ( = ?auto_2500286 ?auto_2500287 ) ) ( not ( = ?auto_2500285 ?auto_2500286 ) ) ( not ( = ?auto_2500285 ?auto_2500287 ) ) ( not ( = ?auto_2500292 ?auto_2500288 ) ) ( HOIST-AT ?auto_2500293 ?auto_2500292 ) ( not ( = ?auto_2500289 ?auto_2500293 ) ) ( AVAILABLE ?auto_2500293 ) ( SURFACE-AT ?auto_2500287 ?auto_2500292 ) ( ON ?auto_2500287 ?auto_2500290 ) ( CLEAR ?auto_2500287 ) ( not ( = ?auto_2500286 ?auto_2500290 ) ) ( not ( = ?auto_2500287 ?auto_2500290 ) ) ( not ( = ?auto_2500285 ?auto_2500290 ) ) ( TRUCK-AT ?auto_2500291 ?auto_2500288 ) ( SURFACE-AT ?auto_2500285 ?auto_2500288 ) ( CLEAR ?auto_2500285 ) ( LIFTING ?auto_2500289 ?auto_2500286 ) ( IS-CRATE ?auto_2500286 ) ( ON ?auto_2500272 ?auto_2500271 ) ( ON ?auto_2500273 ?auto_2500272 ) ( ON ?auto_2500274 ?auto_2500273 ) ( ON ?auto_2500275 ?auto_2500274 ) ( ON ?auto_2500276 ?auto_2500275 ) ( ON ?auto_2500277 ?auto_2500276 ) ( ON ?auto_2500278 ?auto_2500277 ) ( ON ?auto_2500279 ?auto_2500278 ) ( ON ?auto_2500280 ?auto_2500279 ) ( ON ?auto_2500281 ?auto_2500280 ) ( ON ?auto_2500282 ?auto_2500281 ) ( ON ?auto_2500283 ?auto_2500282 ) ( ON ?auto_2500284 ?auto_2500283 ) ( ON ?auto_2500285 ?auto_2500284 ) ( not ( = ?auto_2500271 ?auto_2500272 ) ) ( not ( = ?auto_2500271 ?auto_2500273 ) ) ( not ( = ?auto_2500271 ?auto_2500274 ) ) ( not ( = ?auto_2500271 ?auto_2500275 ) ) ( not ( = ?auto_2500271 ?auto_2500276 ) ) ( not ( = ?auto_2500271 ?auto_2500277 ) ) ( not ( = ?auto_2500271 ?auto_2500278 ) ) ( not ( = ?auto_2500271 ?auto_2500279 ) ) ( not ( = ?auto_2500271 ?auto_2500280 ) ) ( not ( = ?auto_2500271 ?auto_2500281 ) ) ( not ( = ?auto_2500271 ?auto_2500282 ) ) ( not ( = ?auto_2500271 ?auto_2500283 ) ) ( not ( = ?auto_2500271 ?auto_2500284 ) ) ( not ( = ?auto_2500271 ?auto_2500285 ) ) ( not ( = ?auto_2500271 ?auto_2500286 ) ) ( not ( = ?auto_2500271 ?auto_2500287 ) ) ( not ( = ?auto_2500271 ?auto_2500290 ) ) ( not ( = ?auto_2500272 ?auto_2500273 ) ) ( not ( = ?auto_2500272 ?auto_2500274 ) ) ( not ( = ?auto_2500272 ?auto_2500275 ) ) ( not ( = ?auto_2500272 ?auto_2500276 ) ) ( not ( = ?auto_2500272 ?auto_2500277 ) ) ( not ( = ?auto_2500272 ?auto_2500278 ) ) ( not ( = ?auto_2500272 ?auto_2500279 ) ) ( not ( = ?auto_2500272 ?auto_2500280 ) ) ( not ( = ?auto_2500272 ?auto_2500281 ) ) ( not ( = ?auto_2500272 ?auto_2500282 ) ) ( not ( = ?auto_2500272 ?auto_2500283 ) ) ( not ( = ?auto_2500272 ?auto_2500284 ) ) ( not ( = ?auto_2500272 ?auto_2500285 ) ) ( not ( = ?auto_2500272 ?auto_2500286 ) ) ( not ( = ?auto_2500272 ?auto_2500287 ) ) ( not ( = ?auto_2500272 ?auto_2500290 ) ) ( not ( = ?auto_2500273 ?auto_2500274 ) ) ( not ( = ?auto_2500273 ?auto_2500275 ) ) ( not ( = ?auto_2500273 ?auto_2500276 ) ) ( not ( = ?auto_2500273 ?auto_2500277 ) ) ( not ( = ?auto_2500273 ?auto_2500278 ) ) ( not ( = ?auto_2500273 ?auto_2500279 ) ) ( not ( = ?auto_2500273 ?auto_2500280 ) ) ( not ( = ?auto_2500273 ?auto_2500281 ) ) ( not ( = ?auto_2500273 ?auto_2500282 ) ) ( not ( = ?auto_2500273 ?auto_2500283 ) ) ( not ( = ?auto_2500273 ?auto_2500284 ) ) ( not ( = ?auto_2500273 ?auto_2500285 ) ) ( not ( = ?auto_2500273 ?auto_2500286 ) ) ( not ( = ?auto_2500273 ?auto_2500287 ) ) ( not ( = ?auto_2500273 ?auto_2500290 ) ) ( not ( = ?auto_2500274 ?auto_2500275 ) ) ( not ( = ?auto_2500274 ?auto_2500276 ) ) ( not ( = ?auto_2500274 ?auto_2500277 ) ) ( not ( = ?auto_2500274 ?auto_2500278 ) ) ( not ( = ?auto_2500274 ?auto_2500279 ) ) ( not ( = ?auto_2500274 ?auto_2500280 ) ) ( not ( = ?auto_2500274 ?auto_2500281 ) ) ( not ( = ?auto_2500274 ?auto_2500282 ) ) ( not ( = ?auto_2500274 ?auto_2500283 ) ) ( not ( = ?auto_2500274 ?auto_2500284 ) ) ( not ( = ?auto_2500274 ?auto_2500285 ) ) ( not ( = ?auto_2500274 ?auto_2500286 ) ) ( not ( = ?auto_2500274 ?auto_2500287 ) ) ( not ( = ?auto_2500274 ?auto_2500290 ) ) ( not ( = ?auto_2500275 ?auto_2500276 ) ) ( not ( = ?auto_2500275 ?auto_2500277 ) ) ( not ( = ?auto_2500275 ?auto_2500278 ) ) ( not ( = ?auto_2500275 ?auto_2500279 ) ) ( not ( = ?auto_2500275 ?auto_2500280 ) ) ( not ( = ?auto_2500275 ?auto_2500281 ) ) ( not ( = ?auto_2500275 ?auto_2500282 ) ) ( not ( = ?auto_2500275 ?auto_2500283 ) ) ( not ( = ?auto_2500275 ?auto_2500284 ) ) ( not ( = ?auto_2500275 ?auto_2500285 ) ) ( not ( = ?auto_2500275 ?auto_2500286 ) ) ( not ( = ?auto_2500275 ?auto_2500287 ) ) ( not ( = ?auto_2500275 ?auto_2500290 ) ) ( not ( = ?auto_2500276 ?auto_2500277 ) ) ( not ( = ?auto_2500276 ?auto_2500278 ) ) ( not ( = ?auto_2500276 ?auto_2500279 ) ) ( not ( = ?auto_2500276 ?auto_2500280 ) ) ( not ( = ?auto_2500276 ?auto_2500281 ) ) ( not ( = ?auto_2500276 ?auto_2500282 ) ) ( not ( = ?auto_2500276 ?auto_2500283 ) ) ( not ( = ?auto_2500276 ?auto_2500284 ) ) ( not ( = ?auto_2500276 ?auto_2500285 ) ) ( not ( = ?auto_2500276 ?auto_2500286 ) ) ( not ( = ?auto_2500276 ?auto_2500287 ) ) ( not ( = ?auto_2500276 ?auto_2500290 ) ) ( not ( = ?auto_2500277 ?auto_2500278 ) ) ( not ( = ?auto_2500277 ?auto_2500279 ) ) ( not ( = ?auto_2500277 ?auto_2500280 ) ) ( not ( = ?auto_2500277 ?auto_2500281 ) ) ( not ( = ?auto_2500277 ?auto_2500282 ) ) ( not ( = ?auto_2500277 ?auto_2500283 ) ) ( not ( = ?auto_2500277 ?auto_2500284 ) ) ( not ( = ?auto_2500277 ?auto_2500285 ) ) ( not ( = ?auto_2500277 ?auto_2500286 ) ) ( not ( = ?auto_2500277 ?auto_2500287 ) ) ( not ( = ?auto_2500277 ?auto_2500290 ) ) ( not ( = ?auto_2500278 ?auto_2500279 ) ) ( not ( = ?auto_2500278 ?auto_2500280 ) ) ( not ( = ?auto_2500278 ?auto_2500281 ) ) ( not ( = ?auto_2500278 ?auto_2500282 ) ) ( not ( = ?auto_2500278 ?auto_2500283 ) ) ( not ( = ?auto_2500278 ?auto_2500284 ) ) ( not ( = ?auto_2500278 ?auto_2500285 ) ) ( not ( = ?auto_2500278 ?auto_2500286 ) ) ( not ( = ?auto_2500278 ?auto_2500287 ) ) ( not ( = ?auto_2500278 ?auto_2500290 ) ) ( not ( = ?auto_2500279 ?auto_2500280 ) ) ( not ( = ?auto_2500279 ?auto_2500281 ) ) ( not ( = ?auto_2500279 ?auto_2500282 ) ) ( not ( = ?auto_2500279 ?auto_2500283 ) ) ( not ( = ?auto_2500279 ?auto_2500284 ) ) ( not ( = ?auto_2500279 ?auto_2500285 ) ) ( not ( = ?auto_2500279 ?auto_2500286 ) ) ( not ( = ?auto_2500279 ?auto_2500287 ) ) ( not ( = ?auto_2500279 ?auto_2500290 ) ) ( not ( = ?auto_2500280 ?auto_2500281 ) ) ( not ( = ?auto_2500280 ?auto_2500282 ) ) ( not ( = ?auto_2500280 ?auto_2500283 ) ) ( not ( = ?auto_2500280 ?auto_2500284 ) ) ( not ( = ?auto_2500280 ?auto_2500285 ) ) ( not ( = ?auto_2500280 ?auto_2500286 ) ) ( not ( = ?auto_2500280 ?auto_2500287 ) ) ( not ( = ?auto_2500280 ?auto_2500290 ) ) ( not ( = ?auto_2500281 ?auto_2500282 ) ) ( not ( = ?auto_2500281 ?auto_2500283 ) ) ( not ( = ?auto_2500281 ?auto_2500284 ) ) ( not ( = ?auto_2500281 ?auto_2500285 ) ) ( not ( = ?auto_2500281 ?auto_2500286 ) ) ( not ( = ?auto_2500281 ?auto_2500287 ) ) ( not ( = ?auto_2500281 ?auto_2500290 ) ) ( not ( = ?auto_2500282 ?auto_2500283 ) ) ( not ( = ?auto_2500282 ?auto_2500284 ) ) ( not ( = ?auto_2500282 ?auto_2500285 ) ) ( not ( = ?auto_2500282 ?auto_2500286 ) ) ( not ( = ?auto_2500282 ?auto_2500287 ) ) ( not ( = ?auto_2500282 ?auto_2500290 ) ) ( not ( = ?auto_2500283 ?auto_2500284 ) ) ( not ( = ?auto_2500283 ?auto_2500285 ) ) ( not ( = ?auto_2500283 ?auto_2500286 ) ) ( not ( = ?auto_2500283 ?auto_2500287 ) ) ( not ( = ?auto_2500283 ?auto_2500290 ) ) ( not ( = ?auto_2500284 ?auto_2500285 ) ) ( not ( = ?auto_2500284 ?auto_2500286 ) ) ( not ( = ?auto_2500284 ?auto_2500287 ) ) ( not ( = ?auto_2500284 ?auto_2500290 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2500285 ?auto_2500286 ?auto_2500287 )
      ( MAKE-16CRATE-VERIFY ?auto_2500271 ?auto_2500272 ?auto_2500273 ?auto_2500274 ?auto_2500275 ?auto_2500276 ?auto_2500277 ?auto_2500278 ?auto_2500279 ?auto_2500280 ?auto_2500281 ?auto_2500282 ?auto_2500283 ?auto_2500284 ?auto_2500285 ?auto_2500286 ?auto_2500287 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2500520 - SURFACE
      ?auto_2500521 - SURFACE
      ?auto_2500522 - SURFACE
      ?auto_2500523 - SURFACE
      ?auto_2500524 - SURFACE
      ?auto_2500525 - SURFACE
      ?auto_2500526 - SURFACE
      ?auto_2500527 - SURFACE
      ?auto_2500528 - SURFACE
      ?auto_2500529 - SURFACE
      ?auto_2500530 - SURFACE
      ?auto_2500531 - SURFACE
      ?auto_2500532 - SURFACE
      ?auto_2500533 - SURFACE
      ?auto_2500534 - SURFACE
      ?auto_2500535 - SURFACE
      ?auto_2500536 - SURFACE
    )
    :vars
    (
      ?auto_2500541 - HOIST
      ?auto_2500537 - PLACE
      ?auto_2500538 - PLACE
      ?auto_2500540 - HOIST
      ?auto_2500542 - SURFACE
      ?auto_2500539 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2500541 ?auto_2500537 ) ( IS-CRATE ?auto_2500536 ) ( not ( = ?auto_2500535 ?auto_2500536 ) ) ( not ( = ?auto_2500534 ?auto_2500535 ) ) ( not ( = ?auto_2500534 ?auto_2500536 ) ) ( not ( = ?auto_2500538 ?auto_2500537 ) ) ( HOIST-AT ?auto_2500540 ?auto_2500538 ) ( not ( = ?auto_2500541 ?auto_2500540 ) ) ( AVAILABLE ?auto_2500540 ) ( SURFACE-AT ?auto_2500536 ?auto_2500538 ) ( ON ?auto_2500536 ?auto_2500542 ) ( CLEAR ?auto_2500536 ) ( not ( = ?auto_2500535 ?auto_2500542 ) ) ( not ( = ?auto_2500536 ?auto_2500542 ) ) ( not ( = ?auto_2500534 ?auto_2500542 ) ) ( TRUCK-AT ?auto_2500539 ?auto_2500537 ) ( SURFACE-AT ?auto_2500534 ?auto_2500537 ) ( CLEAR ?auto_2500534 ) ( IS-CRATE ?auto_2500535 ) ( AVAILABLE ?auto_2500541 ) ( IN ?auto_2500535 ?auto_2500539 ) ( ON ?auto_2500521 ?auto_2500520 ) ( ON ?auto_2500522 ?auto_2500521 ) ( ON ?auto_2500523 ?auto_2500522 ) ( ON ?auto_2500524 ?auto_2500523 ) ( ON ?auto_2500525 ?auto_2500524 ) ( ON ?auto_2500526 ?auto_2500525 ) ( ON ?auto_2500527 ?auto_2500526 ) ( ON ?auto_2500528 ?auto_2500527 ) ( ON ?auto_2500529 ?auto_2500528 ) ( ON ?auto_2500530 ?auto_2500529 ) ( ON ?auto_2500531 ?auto_2500530 ) ( ON ?auto_2500532 ?auto_2500531 ) ( ON ?auto_2500533 ?auto_2500532 ) ( ON ?auto_2500534 ?auto_2500533 ) ( not ( = ?auto_2500520 ?auto_2500521 ) ) ( not ( = ?auto_2500520 ?auto_2500522 ) ) ( not ( = ?auto_2500520 ?auto_2500523 ) ) ( not ( = ?auto_2500520 ?auto_2500524 ) ) ( not ( = ?auto_2500520 ?auto_2500525 ) ) ( not ( = ?auto_2500520 ?auto_2500526 ) ) ( not ( = ?auto_2500520 ?auto_2500527 ) ) ( not ( = ?auto_2500520 ?auto_2500528 ) ) ( not ( = ?auto_2500520 ?auto_2500529 ) ) ( not ( = ?auto_2500520 ?auto_2500530 ) ) ( not ( = ?auto_2500520 ?auto_2500531 ) ) ( not ( = ?auto_2500520 ?auto_2500532 ) ) ( not ( = ?auto_2500520 ?auto_2500533 ) ) ( not ( = ?auto_2500520 ?auto_2500534 ) ) ( not ( = ?auto_2500520 ?auto_2500535 ) ) ( not ( = ?auto_2500520 ?auto_2500536 ) ) ( not ( = ?auto_2500520 ?auto_2500542 ) ) ( not ( = ?auto_2500521 ?auto_2500522 ) ) ( not ( = ?auto_2500521 ?auto_2500523 ) ) ( not ( = ?auto_2500521 ?auto_2500524 ) ) ( not ( = ?auto_2500521 ?auto_2500525 ) ) ( not ( = ?auto_2500521 ?auto_2500526 ) ) ( not ( = ?auto_2500521 ?auto_2500527 ) ) ( not ( = ?auto_2500521 ?auto_2500528 ) ) ( not ( = ?auto_2500521 ?auto_2500529 ) ) ( not ( = ?auto_2500521 ?auto_2500530 ) ) ( not ( = ?auto_2500521 ?auto_2500531 ) ) ( not ( = ?auto_2500521 ?auto_2500532 ) ) ( not ( = ?auto_2500521 ?auto_2500533 ) ) ( not ( = ?auto_2500521 ?auto_2500534 ) ) ( not ( = ?auto_2500521 ?auto_2500535 ) ) ( not ( = ?auto_2500521 ?auto_2500536 ) ) ( not ( = ?auto_2500521 ?auto_2500542 ) ) ( not ( = ?auto_2500522 ?auto_2500523 ) ) ( not ( = ?auto_2500522 ?auto_2500524 ) ) ( not ( = ?auto_2500522 ?auto_2500525 ) ) ( not ( = ?auto_2500522 ?auto_2500526 ) ) ( not ( = ?auto_2500522 ?auto_2500527 ) ) ( not ( = ?auto_2500522 ?auto_2500528 ) ) ( not ( = ?auto_2500522 ?auto_2500529 ) ) ( not ( = ?auto_2500522 ?auto_2500530 ) ) ( not ( = ?auto_2500522 ?auto_2500531 ) ) ( not ( = ?auto_2500522 ?auto_2500532 ) ) ( not ( = ?auto_2500522 ?auto_2500533 ) ) ( not ( = ?auto_2500522 ?auto_2500534 ) ) ( not ( = ?auto_2500522 ?auto_2500535 ) ) ( not ( = ?auto_2500522 ?auto_2500536 ) ) ( not ( = ?auto_2500522 ?auto_2500542 ) ) ( not ( = ?auto_2500523 ?auto_2500524 ) ) ( not ( = ?auto_2500523 ?auto_2500525 ) ) ( not ( = ?auto_2500523 ?auto_2500526 ) ) ( not ( = ?auto_2500523 ?auto_2500527 ) ) ( not ( = ?auto_2500523 ?auto_2500528 ) ) ( not ( = ?auto_2500523 ?auto_2500529 ) ) ( not ( = ?auto_2500523 ?auto_2500530 ) ) ( not ( = ?auto_2500523 ?auto_2500531 ) ) ( not ( = ?auto_2500523 ?auto_2500532 ) ) ( not ( = ?auto_2500523 ?auto_2500533 ) ) ( not ( = ?auto_2500523 ?auto_2500534 ) ) ( not ( = ?auto_2500523 ?auto_2500535 ) ) ( not ( = ?auto_2500523 ?auto_2500536 ) ) ( not ( = ?auto_2500523 ?auto_2500542 ) ) ( not ( = ?auto_2500524 ?auto_2500525 ) ) ( not ( = ?auto_2500524 ?auto_2500526 ) ) ( not ( = ?auto_2500524 ?auto_2500527 ) ) ( not ( = ?auto_2500524 ?auto_2500528 ) ) ( not ( = ?auto_2500524 ?auto_2500529 ) ) ( not ( = ?auto_2500524 ?auto_2500530 ) ) ( not ( = ?auto_2500524 ?auto_2500531 ) ) ( not ( = ?auto_2500524 ?auto_2500532 ) ) ( not ( = ?auto_2500524 ?auto_2500533 ) ) ( not ( = ?auto_2500524 ?auto_2500534 ) ) ( not ( = ?auto_2500524 ?auto_2500535 ) ) ( not ( = ?auto_2500524 ?auto_2500536 ) ) ( not ( = ?auto_2500524 ?auto_2500542 ) ) ( not ( = ?auto_2500525 ?auto_2500526 ) ) ( not ( = ?auto_2500525 ?auto_2500527 ) ) ( not ( = ?auto_2500525 ?auto_2500528 ) ) ( not ( = ?auto_2500525 ?auto_2500529 ) ) ( not ( = ?auto_2500525 ?auto_2500530 ) ) ( not ( = ?auto_2500525 ?auto_2500531 ) ) ( not ( = ?auto_2500525 ?auto_2500532 ) ) ( not ( = ?auto_2500525 ?auto_2500533 ) ) ( not ( = ?auto_2500525 ?auto_2500534 ) ) ( not ( = ?auto_2500525 ?auto_2500535 ) ) ( not ( = ?auto_2500525 ?auto_2500536 ) ) ( not ( = ?auto_2500525 ?auto_2500542 ) ) ( not ( = ?auto_2500526 ?auto_2500527 ) ) ( not ( = ?auto_2500526 ?auto_2500528 ) ) ( not ( = ?auto_2500526 ?auto_2500529 ) ) ( not ( = ?auto_2500526 ?auto_2500530 ) ) ( not ( = ?auto_2500526 ?auto_2500531 ) ) ( not ( = ?auto_2500526 ?auto_2500532 ) ) ( not ( = ?auto_2500526 ?auto_2500533 ) ) ( not ( = ?auto_2500526 ?auto_2500534 ) ) ( not ( = ?auto_2500526 ?auto_2500535 ) ) ( not ( = ?auto_2500526 ?auto_2500536 ) ) ( not ( = ?auto_2500526 ?auto_2500542 ) ) ( not ( = ?auto_2500527 ?auto_2500528 ) ) ( not ( = ?auto_2500527 ?auto_2500529 ) ) ( not ( = ?auto_2500527 ?auto_2500530 ) ) ( not ( = ?auto_2500527 ?auto_2500531 ) ) ( not ( = ?auto_2500527 ?auto_2500532 ) ) ( not ( = ?auto_2500527 ?auto_2500533 ) ) ( not ( = ?auto_2500527 ?auto_2500534 ) ) ( not ( = ?auto_2500527 ?auto_2500535 ) ) ( not ( = ?auto_2500527 ?auto_2500536 ) ) ( not ( = ?auto_2500527 ?auto_2500542 ) ) ( not ( = ?auto_2500528 ?auto_2500529 ) ) ( not ( = ?auto_2500528 ?auto_2500530 ) ) ( not ( = ?auto_2500528 ?auto_2500531 ) ) ( not ( = ?auto_2500528 ?auto_2500532 ) ) ( not ( = ?auto_2500528 ?auto_2500533 ) ) ( not ( = ?auto_2500528 ?auto_2500534 ) ) ( not ( = ?auto_2500528 ?auto_2500535 ) ) ( not ( = ?auto_2500528 ?auto_2500536 ) ) ( not ( = ?auto_2500528 ?auto_2500542 ) ) ( not ( = ?auto_2500529 ?auto_2500530 ) ) ( not ( = ?auto_2500529 ?auto_2500531 ) ) ( not ( = ?auto_2500529 ?auto_2500532 ) ) ( not ( = ?auto_2500529 ?auto_2500533 ) ) ( not ( = ?auto_2500529 ?auto_2500534 ) ) ( not ( = ?auto_2500529 ?auto_2500535 ) ) ( not ( = ?auto_2500529 ?auto_2500536 ) ) ( not ( = ?auto_2500529 ?auto_2500542 ) ) ( not ( = ?auto_2500530 ?auto_2500531 ) ) ( not ( = ?auto_2500530 ?auto_2500532 ) ) ( not ( = ?auto_2500530 ?auto_2500533 ) ) ( not ( = ?auto_2500530 ?auto_2500534 ) ) ( not ( = ?auto_2500530 ?auto_2500535 ) ) ( not ( = ?auto_2500530 ?auto_2500536 ) ) ( not ( = ?auto_2500530 ?auto_2500542 ) ) ( not ( = ?auto_2500531 ?auto_2500532 ) ) ( not ( = ?auto_2500531 ?auto_2500533 ) ) ( not ( = ?auto_2500531 ?auto_2500534 ) ) ( not ( = ?auto_2500531 ?auto_2500535 ) ) ( not ( = ?auto_2500531 ?auto_2500536 ) ) ( not ( = ?auto_2500531 ?auto_2500542 ) ) ( not ( = ?auto_2500532 ?auto_2500533 ) ) ( not ( = ?auto_2500532 ?auto_2500534 ) ) ( not ( = ?auto_2500532 ?auto_2500535 ) ) ( not ( = ?auto_2500532 ?auto_2500536 ) ) ( not ( = ?auto_2500532 ?auto_2500542 ) ) ( not ( = ?auto_2500533 ?auto_2500534 ) ) ( not ( = ?auto_2500533 ?auto_2500535 ) ) ( not ( = ?auto_2500533 ?auto_2500536 ) ) ( not ( = ?auto_2500533 ?auto_2500542 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2500534 ?auto_2500535 ?auto_2500536 )
      ( MAKE-16CRATE-VERIFY ?auto_2500520 ?auto_2500521 ?auto_2500522 ?auto_2500523 ?auto_2500524 ?auto_2500525 ?auto_2500526 ?auto_2500527 ?auto_2500528 ?auto_2500529 ?auto_2500530 ?auto_2500531 ?auto_2500532 ?auto_2500533 ?auto_2500534 ?auto_2500535 ?auto_2500536 ) )
  )

)

