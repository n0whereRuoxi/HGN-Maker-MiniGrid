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
      ?auto_26182 - SURFACE
      ?auto_26183 - SURFACE
    )
    :vars
    (
      ?auto_26184 - HOIST
      ?auto_26185 - PLACE
      ?auto_26187 - PLACE
      ?auto_26188 - HOIST
      ?auto_26189 - SURFACE
      ?auto_26186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26184 ?auto_26185 ) ( SURFACE-AT ?auto_26182 ?auto_26185 ) ( CLEAR ?auto_26182 ) ( IS-CRATE ?auto_26183 ) ( AVAILABLE ?auto_26184 ) ( not ( = ?auto_26187 ?auto_26185 ) ) ( HOIST-AT ?auto_26188 ?auto_26187 ) ( AVAILABLE ?auto_26188 ) ( SURFACE-AT ?auto_26183 ?auto_26187 ) ( ON ?auto_26183 ?auto_26189 ) ( CLEAR ?auto_26183 ) ( TRUCK-AT ?auto_26186 ?auto_26185 ) ( not ( = ?auto_26182 ?auto_26183 ) ) ( not ( = ?auto_26182 ?auto_26189 ) ) ( not ( = ?auto_26183 ?auto_26189 ) ) ( not ( = ?auto_26184 ?auto_26188 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26186 ?auto_26185 ?auto_26187 )
      ( !LIFT ?auto_26188 ?auto_26183 ?auto_26189 ?auto_26187 )
      ( !LOAD ?auto_26188 ?auto_26183 ?auto_26186 ?auto_26187 )
      ( !DRIVE ?auto_26186 ?auto_26187 ?auto_26185 )
      ( !UNLOAD ?auto_26184 ?auto_26183 ?auto_26186 ?auto_26185 )
      ( !DROP ?auto_26184 ?auto_26183 ?auto_26182 ?auto_26185 )
      ( MAKE-1CRATE-VERIFY ?auto_26182 ?auto_26183 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26192 - SURFACE
      ?auto_26193 - SURFACE
    )
    :vars
    (
      ?auto_26194 - HOIST
      ?auto_26195 - PLACE
      ?auto_26197 - PLACE
      ?auto_26198 - HOIST
      ?auto_26199 - SURFACE
      ?auto_26196 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26194 ?auto_26195 ) ( SURFACE-AT ?auto_26192 ?auto_26195 ) ( CLEAR ?auto_26192 ) ( IS-CRATE ?auto_26193 ) ( AVAILABLE ?auto_26194 ) ( not ( = ?auto_26197 ?auto_26195 ) ) ( HOIST-AT ?auto_26198 ?auto_26197 ) ( AVAILABLE ?auto_26198 ) ( SURFACE-AT ?auto_26193 ?auto_26197 ) ( ON ?auto_26193 ?auto_26199 ) ( CLEAR ?auto_26193 ) ( TRUCK-AT ?auto_26196 ?auto_26195 ) ( not ( = ?auto_26192 ?auto_26193 ) ) ( not ( = ?auto_26192 ?auto_26199 ) ) ( not ( = ?auto_26193 ?auto_26199 ) ) ( not ( = ?auto_26194 ?auto_26198 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26196 ?auto_26195 ?auto_26197 )
      ( !LIFT ?auto_26198 ?auto_26193 ?auto_26199 ?auto_26197 )
      ( !LOAD ?auto_26198 ?auto_26193 ?auto_26196 ?auto_26197 )
      ( !DRIVE ?auto_26196 ?auto_26197 ?auto_26195 )
      ( !UNLOAD ?auto_26194 ?auto_26193 ?auto_26196 ?auto_26195 )
      ( !DROP ?auto_26194 ?auto_26193 ?auto_26192 ?auto_26195 )
      ( MAKE-1CRATE-VERIFY ?auto_26192 ?auto_26193 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26203 - SURFACE
      ?auto_26204 - SURFACE
      ?auto_26205 - SURFACE
    )
    :vars
    (
      ?auto_26207 - HOIST
      ?auto_26209 - PLACE
      ?auto_26211 - PLACE
      ?auto_26208 - HOIST
      ?auto_26210 - SURFACE
      ?auto_26214 - PLACE
      ?auto_26212 - HOIST
      ?auto_26213 - SURFACE
      ?auto_26206 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26207 ?auto_26209 ) ( IS-CRATE ?auto_26205 ) ( not ( = ?auto_26211 ?auto_26209 ) ) ( HOIST-AT ?auto_26208 ?auto_26211 ) ( AVAILABLE ?auto_26208 ) ( SURFACE-AT ?auto_26205 ?auto_26211 ) ( ON ?auto_26205 ?auto_26210 ) ( CLEAR ?auto_26205 ) ( not ( = ?auto_26204 ?auto_26205 ) ) ( not ( = ?auto_26204 ?auto_26210 ) ) ( not ( = ?auto_26205 ?auto_26210 ) ) ( not ( = ?auto_26207 ?auto_26208 ) ) ( SURFACE-AT ?auto_26203 ?auto_26209 ) ( CLEAR ?auto_26203 ) ( IS-CRATE ?auto_26204 ) ( AVAILABLE ?auto_26207 ) ( not ( = ?auto_26214 ?auto_26209 ) ) ( HOIST-AT ?auto_26212 ?auto_26214 ) ( AVAILABLE ?auto_26212 ) ( SURFACE-AT ?auto_26204 ?auto_26214 ) ( ON ?auto_26204 ?auto_26213 ) ( CLEAR ?auto_26204 ) ( TRUCK-AT ?auto_26206 ?auto_26209 ) ( not ( = ?auto_26203 ?auto_26204 ) ) ( not ( = ?auto_26203 ?auto_26213 ) ) ( not ( = ?auto_26204 ?auto_26213 ) ) ( not ( = ?auto_26207 ?auto_26212 ) ) ( not ( = ?auto_26203 ?auto_26205 ) ) ( not ( = ?auto_26203 ?auto_26210 ) ) ( not ( = ?auto_26205 ?auto_26213 ) ) ( not ( = ?auto_26211 ?auto_26214 ) ) ( not ( = ?auto_26208 ?auto_26212 ) ) ( not ( = ?auto_26210 ?auto_26213 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26203 ?auto_26204 )
      ( MAKE-1CRATE ?auto_26204 ?auto_26205 )
      ( MAKE-2CRATE-VERIFY ?auto_26203 ?auto_26204 ?auto_26205 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26217 - SURFACE
      ?auto_26218 - SURFACE
    )
    :vars
    (
      ?auto_26219 - HOIST
      ?auto_26220 - PLACE
      ?auto_26222 - PLACE
      ?auto_26223 - HOIST
      ?auto_26224 - SURFACE
      ?auto_26221 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26219 ?auto_26220 ) ( SURFACE-AT ?auto_26217 ?auto_26220 ) ( CLEAR ?auto_26217 ) ( IS-CRATE ?auto_26218 ) ( AVAILABLE ?auto_26219 ) ( not ( = ?auto_26222 ?auto_26220 ) ) ( HOIST-AT ?auto_26223 ?auto_26222 ) ( AVAILABLE ?auto_26223 ) ( SURFACE-AT ?auto_26218 ?auto_26222 ) ( ON ?auto_26218 ?auto_26224 ) ( CLEAR ?auto_26218 ) ( TRUCK-AT ?auto_26221 ?auto_26220 ) ( not ( = ?auto_26217 ?auto_26218 ) ) ( not ( = ?auto_26217 ?auto_26224 ) ) ( not ( = ?auto_26218 ?auto_26224 ) ) ( not ( = ?auto_26219 ?auto_26223 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26221 ?auto_26220 ?auto_26222 )
      ( !LIFT ?auto_26223 ?auto_26218 ?auto_26224 ?auto_26222 )
      ( !LOAD ?auto_26223 ?auto_26218 ?auto_26221 ?auto_26222 )
      ( !DRIVE ?auto_26221 ?auto_26222 ?auto_26220 )
      ( !UNLOAD ?auto_26219 ?auto_26218 ?auto_26221 ?auto_26220 )
      ( !DROP ?auto_26219 ?auto_26218 ?auto_26217 ?auto_26220 )
      ( MAKE-1CRATE-VERIFY ?auto_26217 ?auto_26218 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26229 - SURFACE
      ?auto_26230 - SURFACE
      ?auto_26231 - SURFACE
      ?auto_26232 - SURFACE
    )
    :vars
    (
      ?auto_26238 - HOIST
      ?auto_26236 - PLACE
      ?auto_26237 - PLACE
      ?auto_26234 - HOIST
      ?auto_26233 - SURFACE
      ?auto_26240 - PLACE
      ?auto_26242 - HOIST
      ?auto_26239 - SURFACE
      ?auto_26244 - PLACE
      ?auto_26241 - HOIST
      ?auto_26243 - SURFACE
      ?auto_26235 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26238 ?auto_26236 ) ( IS-CRATE ?auto_26232 ) ( not ( = ?auto_26237 ?auto_26236 ) ) ( HOIST-AT ?auto_26234 ?auto_26237 ) ( AVAILABLE ?auto_26234 ) ( SURFACE-AT ?auto_26232 ?auto_26237 ) ( ON ?auto_26232 ?auto_26233 ) ( CLEAR ?auto_26232 ) ( not ( = ?auto_26231 ?auto_26232 ) ) ( not ( = ?auto_26231 ?auto_26233 ) ) ( not ( = ?auto_26232 ?auto_26233 ) ) ( not ( = ?auto_26238 ?auto_26234 ) ) ( IS-CRATE ?auto_26231 ) ( not ( = ?auto_26240 ?auto_26236 ) ) ( HOIST-AT ?auto_26242 ?auto_26240 ) ( AVAILABLE ?auto_26242 ) ( SURFACE-AT ?auto_26231 ?auto_26240 ) ( ON ?auto_26231 ?auto_26239 ) ( CLEAR ?auto_26231 ) ( not ( = ?auto_26230 ?auto_26231 ) ) ( not ( = ?auto_26230 ?auto_26239 ) ) ( not ( = ?auto_26231 ?auto_26239 ) ) ( not ( = ?auto_26238 ?auto_26242 ) ) ( SURFACE-AT ?auto_26229 ?auto_26236 ) ( CLEAR ?auto_26229 ) ( IS-CRATE ?auto_26230 ) ( AVAILABLE ?auto_26238 ) ( not ( = ?auto_26244 ?auto_26236 ) ) ( HOIST-AT ?auto_26241 ?auto_26244 ) ( AVAILABLE ?auto_26241 ) ( SURFACE-AT ?auto_26230 ?auto_26244 ) ( ON ?auto_26230 ?auto_26243 ) ( CLEAR ?auto_26230 ) ( TRUCK-AT ?auto_26235 ?auto_26236 ) ( not ( = ?auto_26229 ?auto_26230 ) ) ( not ( = ?auto_26229 ?auto_26243 ) ) ( not ( = ?auto_26230 ?auto_26243 ) ) ( not ( = ?auto_26238 ?auto_26241 ) ) ( not ( = ?auto_26229 ?auto_26231 ) ) ( not ( = ?auto_26229 ?auto_26239 ) ) ( not ( = ?auto_26231 ?auto_26243 ) ) ( not ( = ?auto_26240 ?auto_26244 ) ) ( not ( = ?auto_26242 ?auto_26241 ) ) ( not ( = ?auto_26239 ?auto_26243 ) ) ( not ( = ?auto_26229 ?auto_26232 ) ) ( not ( = ?auto_26229 ?auto_26233 ) ) ( not ( = ?auto_26230 ?auto_26232 ) ) ( not ( = ?auto_26230 ?auto_26233 ) ) ( not ( = ?auto_26232 ?auto_26239 ) ) ( not ( = ?auto_26232 ?auto_26243 ) ) ( not ( = ?auto_26237 ?auto_26240 ) ) ( not ( = ?auto_26237 ?auto_26244 ) ) ( not ( = ?auto_26234 ?auto_26242 ) ) ( not ( = ?auto_26234 ?auto_26241 ) ) ( not ( = ?auto_26233 ?auto_26239 ) ) ( not ( = ?auto_26233 ?auto_26243 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26229 ?auto_26230 ?auto_26231 )
      ( MAKE-1CRATE ?auto_26231 ?auto_26232 )
      ( MAKE-3CRATE-VERIFY ?auto_26229 ?auto_26230 ?auto_26231 ?auto_26232 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26247 - SURFACE
      ?auto_26248 - SURFACE
    )
    :vars
    (
      ?auto_26249 - HOIST
      ?auto_26250 - PLACE
      ?auto_26252 - PLACE
      ?auto_26253 - HOIST
      ?auto_26254 - SURFACE
      ?auto_26251 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26249 ?auto_26250 ) ( SURFACE-AT ?auto_26247 ?auto_26250 ) ( CLEAR ?auto_26247 ) ( IS-CRATE ?auto_26248 ) ( AVAILABLE ?auto_26249 ) ( not ( = ?auto_26252 ?auto_26250 ) ) ( HOIST-AT ?auto_26253 ?auto_26252 ) ( AVAILABLE ?auto_26253 ) ( SURFACE-AT ?auto_26248 ?auto_26252 ) ( ON ?auto_26248 ?auto_26254 ) ( CLEAR ?auto_26248 ) ( TRUCK-AT ?auto_26251 ?auto_26250 ) ( not ( = ?auto_26247 ?auto_26248 ) ) ( not ( = ?auto_26247 ?auto_26254 ) ) ( not ( = ?auto_26248 ?auto_26254 ) ) ( not ( = ?auto_26249 ?auto_26253 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26251 ?auto_26250 ?auto_26252 )
      ( !LIFT ?auto_26253 ?auto_26248 ?auto_26254 ?auto_26252 )
      ( !LOAD ?auto_26253 ?auto_26248 ?auto_26251 ?auto_26252 )
      ( !DRIVE ?auto_26251 ?auto_26252 ?auto_26250 )
      ( !UNLOAD ?auto_26249 ?auto_26248 ?auto_26251 ?auto_26250 )
      ( !DROP ?auto_26249 ?auto_26248 ?auto_26247 ?auto_26250 )
      ( MAKE-1CRATE-VERIFY ?auto_26247 ?auto_26248 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26260 - SURFACE
      ?auto_26261 - SURFACE
      ?auto_26262 - SURFACE
      ?auto_26263 - SURFACE
      ?auto_26264 - SURFACE
    )
    :vars
    (
      ?auto_26270 - HOIST
      ?auto_26265 - PLACE
      ?auto_26269 - PLACE
      ?auto_26268 - HOIST
      ?auto_26267 - SURFACE
      ?auto_26274 - PLACE
      ?auto_26278 - HOIST
      ?auto_26279 - SURFACE
      ?auto_26276 - PLACE
      ?auto_26272 - HOIST
      ?auto_26271 - SURFACE
      ?auto_26273 - PLACE
      ?auto_26277 - HOIST
      ?auto_26275 - SURFACE
      ?auto_26266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26270 ?auto_26265 ) ( IS-CRATE ?auto_26264 ) ( not ( = ?auto_26269 ?auto_26265 ) ) ( HOIST-AT ?auto_26268 ?auto_26269 ) ( AVAILABLE ?auto_26268 ) ( SURFACE-AT ?auto_26264 ?auto_26269 ) ( ON ?auto_26264 ?auto_26267 ) ( CLEAR ?auto_26264 ) ( not ( = ?auto_26263 ?auto_26264 ) ) ( not ( = ?auto_26263 ?auto_26267 ) ) ( not ( = ?auto_26264 ?auto_26267 ) ) ( not ( = ?auto_26270 ?auto_26268 ) ) ( IS-CRATE ?auto_26263 ) ( not ( = ?auto_26274 ?auto_26265 ) ) ( HOIST-AT ?auto_26278 ?auto_26274 ) ( AVAILABLE ?auto_26278 ) ( SURFACE-AT ?auto_26263 ?auto_26274 ) ( ON ?auto_26263 ?auto_26279 ) ( CLEAR ?auto_26263 ) ( not ( = ?auto_26262 ?auto_26263 ) ) ( not ( = ?auto_26262 ?auto_26279 ) ) ( not ( = ?auto_26263 ?auto_26279 ) ) ( not ( = ?auto_26270 ?auto_26278 ) ) ( IS-CRATE ?auto_26262 ) ( not ( = ?auto_26276 ?auto_26265 ) ) ( HOIST-AT ?auto_26272 ?auto_26276 ) ( AVAILABLE ?auto_26272 ) ( SURFACE-AT ?auto_26262 ?auto_26276 ) ( ON ?auto_26262 ?auto_26271 ) ( CLEAR ?auto_26262 ) ( not ( = ?auto_26261 ?auto_26262 ) ) ( not ( = ?auto_26261 ?auto_26271 ) ) ( not ( = ?auto_26262 ?auto_26271 ) ) ( not ( = ?auto_26270 ?auto_26272 ) ) ( SURFACE-AT ?auto_26260 ?auto_26265 ) ( CLEAR ?auto_26260 ) ( IS-CRATE ?auto_26261 ) ( AVAILABLE ?auto_26270 ) ( not ( = ?auto_26273 ?auto_26265 ) ) ( HOIST-AT ?auto_26277 ?auto_26273 ) ( AVAILABLE ?auto_26277 ) ( SURFACE-AT ?auto_26261 ?auto_26273 ) ( ON ?auto_26261 ?auto_26275 ) ( CLEAR ?auto_26261 ) ( TRUCK-AT ?auto_26266 ?auto_26265 ) ( not ( = ?auto_26260 ?auto_26261 ) ) ( not ( = ?auto_26260 ?auto_26275 ) ) ( not ( = ?auto_26261 ?auto_26275 ) ) ( not ( = ?auto_26270 ?auto_26277 ) ) ( not ( = ?auto_26260 ?auto_26262 ) ) ( not ( = ?auto_26260 ?auto_26271 ) ) ( not ( = ?auto_26262 ?auto_26275 ) ) ( not ( = ?auto_26276 ?auto_26273 ) ) ( not ( = ?auto_26272 ?auto_26277 ) ) ( not ( = ?auto_26271 ?auto_26275 ) ) ( not ( = ?auto_26260 ?auto_26263 ) ) ( not ( = ?auto_26260 ?auto_26279 ) ) ( not ( = ?auto_26261 ?auto_26263 ) ) ( not ( = ?auto_26261 ?auto_26279 ) ) ( not ( = ?auto_26263 ?auto_26271 ) ) ( not ( = ?auto_26263 ?auto_26275 ) ) ( not ( = ?auto_26274 ?auto_26276 ) ) ( not ( = ?auto_26274 ?auto_26273 ) ) ( not ( = ?auto_26278 ?auto_26272 ) ) ( not ( = ?auto_26278 ?auto_26277 ) ) ( not ( = ?auto_26279 ?auto_26271 ) ) ( not ( = ?auto_26279 ?auto_26275 ) ) ( not ( = ?auto_26260 ?auto_26264 ) ) ( not ( = ?auto_26260 ?auto_26267 ) ) ( not ( = ?auto_26261 ?auto_26264 ) ) ( not ( = ?auto_26261 ?auto_26267 ) ) ( not ( = ?auto_26262 ?auto_26264 ) ) ( not ( = ?auto_26262 ?auto_26267 ) ) ( not ( = ?auto_26264 ?auto_26279 ) ) ( not ( = ?auto_26264 ?auto_26271 ) ) ( not ( = ?auto_26264 ?auto_26275 ) ) ( not ( = ?auto_26269 ?auto_26274 ) ) ( not ( = ?auto_26269 ?auto_26276 ) ) ( not ( = ?auto_26269 ?auto_26273 ) ) ( not ( = ?auto_26268 ?auto_26278 ) ) ( not ( = ?auto_26268 ?auto_26272 ) ) ( not ( = ?auto_26268 ?auto_26277 ) ) ( not ( = ?auto_26267 ?auto_26279 ) ) ( not ( = ?auto_26267 ?auto_26271 ) ) ( not ( = ?auto_26267 ?auto_26275 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_26260 ?auto_26261 ?auto_26262 ?auto_26263 )
      ( MAKE-1CRATE ?auto_26263 ?auto_26264 )
      ( MAKE-4CRATE-VERIFY ?auto_26260 ?auto_26261 ?auto_26262 ?auto_26263 ?auto_26264 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26282 - SURFACE
      ?auto_26283 - SURFACE
    )
    :vars
    (
      ?auto_26284 - HOIST
      ?auto_26285 - PLACE
      ?auto_26287 - PLACE
      ?auto_26288 - HOIST
      ?auto_26289 - SURFACE
      ?auto_26286 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26284 ?auto_26285 ) ( SURFACE-AT ?auto_26282 ?auto_26285 ) ( CLEAR ?auto_26282 ) ( IS-CRATE ?auto_26283 ) ( AVAILABLE ?auto_26284 ) ( not ( = ?auto_26287 ?auto_26285 ) ) ( HOIST-AT ?auto_26288 ?auto_26287 ) ( AVAILABLE ?auto_26288 ) ( SURFACE-AT ?auto_26283 ?auto_26287 ) ( ON ?auto_26283 ?auto_26289 ) ( CLEAR ?auto_26283 ) ( TRUCK-AT ?auto_26286 ?auto_26285 ) ( not ( = ?auto_26282 ?auto_26283 ) ) ( not ( = ?auto_26282 ?auto_26289 ) ) ( not ( = ?auto_26283 ?auto_26289 ) ) ( not ( = ?auto_26284 ?auto_26288 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26286 ?auto_26285 ?auto_26287 )
      ( !LIFT ?auto_26288 ?auto_26283 ?auto_26289 ?auto_26287 )
      ( !LOAD ?auto_26288 ?auto_26283 ?auto_26286 ?auto_26287 )
      ( !DRIVE ?auto_26286 ?auto_26287 ?auto_26285 )
      ( !UNLOAD ?auto_26284 ?auto_26283 ?auto_26286 ?auto_26285 )
      ( !DROP ?auto_26284 ?auto_26283 ?auto_26282 ?auto_26285 )
      ( MAKE-1CRATE-VERIFY ?auto_26282 ?auto_26283 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26296 - SURFACE
      ?auto_26297 - SURFACE
      ?auto_26298 - SURFACE
      ?auto_26299 - SURFACE
      ?auto_26300 - SURFACE
      ?auto_26301 - SURFACE
    )
    :vars
    (
      ?auto_26302 - HOIST
      ?auto_26307 - PLACE
      ?auto_26303 - PLACE
      ?auto_26304 - HOIST
      ?auto_26306 - SURFACE
      ?auto_26308 - PLACE
      ?auto_26317 - HOIST
      ?auto_26315 - SURFACE
      ?auto_26312 - PLACE
      ?auto_26310 - HOIST
      ?auto_26318 - SURFACE
      ?auto_26316 - PLACE
      ?auto_26319 - HOIST
      ?auto_26309 - SURFACE
      ?auto_26311 - PLACE
      ?auto_26313 - HOIST
      ?auto_26314 - SURFACE
      ?auto_26305 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26302 ?auto_26307 ) ( IS-CRATE ?auto_26301 ) ( not ( = ?auto_26303 ?auto_26307 ) ) ( HOIST-AT ?auto_26304 ?auto_26303 ) ( AVAILABLE ?auto_26304 ) ( SURFACE-AT ?auto_26301 ?auto_26303 ) ( ON ?auto_26301 ?auto_26306 ) ( CLEAR ?auto_26301 ) ( not ( = ?auto_26300 ?auto_26301 ) ) ( not ( = ?auto_26300 ?auto_26306 ) ) ( not ( = ?auto_26301 ?auto_26306 ) ) ( not ( = ?auto_26302 ?auto_26304 ) ) ( IS-CRATE ?auto_26300 ) ( not ( = ?auto_26308 ?auto_26307 ) ) ( HOIST-AT ?auto_26317 ?auto_26308 ) ( AVAILABLE ?auto_26317 ) ( SURFACE-AT ?auto_26300 ?auto_26308 ) ( ON ?auto_26300 ?auto_26315 ) ( CLEAR ?auto_26300 ) ( not ( = ?auto_26299 ?auto_26300 ) ) ( not ( = ?auto_26299 ?auto_26315 ) ) ( not ( = ?auto_26300 ?auto_26315 ) ) ( not ( = ?auto_26302 ?auto_26317 ) ) ( IS-CRATE ?auto_26299 ) ( not ( = ?auto_26312 ?auto_26307 ) ) ( HOIST-AT ?auto_26310 ?auto_26312 ) ( AVAILABLE ?auto_26310 ) ( SURFACE-AT ?auto_26299 ?auto_26312 ) ( ON ?auto_26299 ?auto_26318 ) ( CLEAR ?auto_26299 ) ( not ( = ?auto_26298 ?auto_26299 ) ) ( not ( = ?auto_26298 ?auto_26318 ) ) ( not ( = ?auto_26299 ?auto_26318 ) ) ( not ( = ?auto_26302 ?auto_26310 ) ) ( IS-CRATE ?auto_26298 ) ( not ( = ?auto_26316 ?auto_26307 ) ) ( HOIST-AT ?auto_26319 ?auto_26316 ) ( AVAILABLE ?auto_26319 ) ( SURFACE-AT ?auto_26298 ?auto_26316 ) ( ON ?auto_26298 ?auto_26309 ) ( CLEAR ?auto_26298 ) ( not ( = ?auto_26297 ?auto_26298 ) ) ( not ( = ?auto_26297 ?auto_26309 ) ) ( not ( = ?auto_26298 ?auto_26309 ) ) ( not ( = ?auto_26302 ?auto_26319 ) ) ( SURFACE-AT ?auto_26296 ?auto_26307 ) ( CLEAR ?auto_26296 ) ( IS-CRATE ?auto_26297 ) ( AVAILABLE ?auto_26302 ) ( not ( = ?auto_26311 ?auto_26307 ) ) ( HOIST-AT ?auto_26313 ?auto_26311 ) ( AVAILABLE ?auto_26313 ) ( SURFACE-AT ?auto_26297 ?auto_26311 ) ( ON ?auto_26297 ?auto_26314 ) ( CLEAR ?auto_26297 ) ( TRUCK-AT ?auto_26305 ?auto_26307 ) ( not ( = ?auto_26296 ?auto_26297 ) ) ( not ( = ?auto_26296 ?auto_26314 ) ) ( not ( = ?auto_26297 ?auto_26314 ) ) ( not ( = ?auto_26302 ?auto_26313 ) ) ( not ( = ?auto_26296 ?auto_26298 ) ) ( not ( = ?auto_26296 ?auto_26309 ) ) ( not ( = ?auto_26298 ?auto_26314 ) ) ( not ( = ?auto_26316 ?auto_26311 ) ) ( not ( = ?auto_26319 ?auto_26313 ) ) ( not ( = ?auto_26309 ?auto_26314 ) ) ( not ( = ?auto_26296 ?auto_26299 ) ) ( not ( = ?auto_26296 ?auto_26318 ) ) ( not ( = ?auto_26297 ?auto_26299 ) ) ( not ( = ?auto_26297 ?auto_26318 ) ) ( not ( = ?auto_26299 ?auto_26309 ) ) ( not ( = ?auto_26299 ?auto_26314 ) ) ( not ( = ?auto_26312 ?auto_26316 ) ) ( not ( = ?auto_26312 ?auto_26311 ) ) ( not ( = ?auto_26310 ?auto_26319 ) ) ( not ( = ?auto_26310 ?auto_26313 ) ) ( not ( = ?auto_26318 ?auto_26309 ) ) ( not ( = ?auto_26318 ?auto_26314 ) ) ( not ( = ?auto_26296 ?auto_26300 ) ) ( not ( = ?auto_26296 ?auto_26315 ) ) ( not ( = ?auto_26297 ?auto_26300 ) ) ( not ( = ?auto_26297 ?auto_26315 ) ) ( not ( = ?auto_26298 ?auto_26300 ) ) ( not ( = ?auto_26298 ?auto_26315 ) ) ( not ( = ?auto_26300 ?auto_26318 ) ) ( not ( = ?auto_26300 ?auto_26309 ) ) ( not ( = ?auto_26300 ?auto_26314 ) ) ( not ( = ?auto_26308 ?auto_26312 ) ) ( not ( = ?auto_26308 ?auto_26316 ) ) ( not ( = ?auto_26308 ?auto_26311 ) ) ( not ( = ?auto_26317 ?auto_26310 ) ) ( not ( = ?auto_26317 ?auto_26319 ) ) ( not ( = ?auto_26317 ?auto_26313 ) ) ( not ( = ?auto_26315 ?auto_26318 ) ) ( not ( = ?auto_26315 ?auto_26309 ) ) ( not ( = ?auto_26315 ?auto_26314 ) ) ( not ( = ?auto_26296 ?auto_26301 ) ) ( not ( = ?auto_26296 ?auto_26306 ) ) ( not ( = ?auto_26297 ?auto_26301 ) ) ( not ( = ?auto_26297 ?auto_26306 ) ) ( not ( = ?auto_26298 ?auto_26301 ) ) ( not ( = ?auto_26298 ?auto_26306 ) ) ( not ( = ?auto_26299 ?auto_26301 ) ) ( not ( = ?auto_26299 ?auto_26306 ) ) ( not ( = ?auto_26301 ?auto_26315 ) ) ( not ( = ?auto_26301 ?auto_26318 ) ) ( not ( = ?auto_26301 ?auto_26309 ) ) ( not ( = ?auto_26301 ?auto_26314 ) ) ( not ( = ?auto_26303 ?auto_26308 ) ) ( not ( = ?auto_26303 ?auto_26312 ) ) ( not ( = ?auto_26303 ?auto_26316 ) ) ( not ( = ?auto_26303 ?auto_26311 ) ) ( not ( = ?auto_26304 ?auto_26317 ) ) ( not ( = ?auto_26304 ?auto_26310 ) ) ( not ( = ?auto_26304 ?auto_26319 ) ) ( not ( = ?auto_26304 ?auto_26313 ) ) ( not ( = ?auto_26306 ?auto_26315 ) ) ( not ( = ?auto_26306 ?auto_26318 ) ) ( not ( = ?auto_26306 ?auto_26309 ) ) ( not ( = ?auto_26306 ?auto_26314 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_26296 ?auto_26297 ?auto_26298 ?auto_26299 ?auto_26300 )
      ( MAKE-1CRATE ?auto_26300 ?auto_26301 )
      ( MAKE-5CRATE-VERIFY ?auto_26296 ?auto_26297 ?auto_26298 ?auto_26299 ?auto_26300 ?auto_26301 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26322 - SURFACE
      ?auto_26323 - SURFACE
    )
    :vars
    (
      ?auto_26324 - HOIST
      ?auto_26325 - PLACE
      ?auto_26327 - PLACE
      ?auto_26328 - HOIST
      ?auto_26329 - SURFACE
      ?auto_26326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26324 ?auto_26325 ) ( SURFACE-AT ?auto_26322 ?auto_26325 ) ( CLEAR ?auto_26322 ) ( IS-CRATE ?auto_26323 ) ( AVAILABLE ?auto_26324 ) ( not ( = ?auto_26327 ?auto_26325 ) ) ( HOIST-AT ?auto_26328 ?auto_26327 ) ( AVAILABLE ?auto_26328 ) ( SURFACE-AT ?auto_26323 ?auto_26327 ) ( ON ?auto_26323 ?auto_26329 ) ( CLEAR ?auto_26323 ) ( TRUCK-AT ?auto_26326 ?auto_26325 ) ( not ( = ?auto_26322 ?auto_26323 ) ) ( not ( = ?auto_26322 ?auto_26329 ) ) ( not ( = ?auto_26323 ?auto_26329 ) ) ( not ( = ?auto_26324 ?auto_26328 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26326 ?auto_26325 ?auto_26327 )
      ( !LIFT ?auto_26328 ?auto_26323 ?auto_26329 ?auto_26327 )
      ( !LOAD ?auto_26328 ?auto_26323 ?auto_26326 ?auto_26327 )
      ( !DRIVE ?auto_26326 ?auto_26327 ?auto_26325 )
      ( !UNLOAD ?auto_26324 ?auto_26323 ?auto_26326 ?auto_26325 )
      ( !DROP ?auto_26324 ?auto_26323 ?auto_26322 ?auto_26325 )
      ( MAKE-1CRATE-VERIFY ?auto_26322 ?auto_26323 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_26337 - SURFACE
      ?auto_26338 - SURFACE
      ?auto_26339 - SURFACE
      ?auto_26340 - SURFACE
      ?auto_26341 - SURFACE
      ?auto_26342 - SURFACE
      ?auto_26343 - SURFACE
    )
    :vars
    (
      ?auto_26344 - HOIST
      ?auto_26346 - PLACE
      ?auto_26345 - PLACE
      ?auto_26347 - HOIST
      ?auto_26348 - SURFACE
      ?auto_26352 - PLACE
      ?auto_26364 - HOIST
      ?auto_26353 - SURFACE
      ?auto_26362 - PLACE
      ?auto_26359 - HOIST
      ?auto_26361 - SURFACE
      ?auto_26354 - PLACE
      ?auto_26356 - HOIST
      ?auto_26357 - SURFACE
      ?auto_26363 - PLACE
      ?auto_26360 - HOIST
      ?auto_26355 - SURFACE
      ?auto_26358 - PLACE
      ?auto_26351 - HOIST
      ?auto_26350 - SURFACE
      ?auto_26349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26344 ?auto_26346 ) ( IS-CRATE ?auto_26343 ) ( not ( = ?auto_26345 ?auto_26346 ) ) ( HOIST-AT ?auto_26347 ?auto_26345 ) ( AVAILABLE ?auto_26347 ) ( SURFACE-AT ?auto_26343 ?auto_26345 ) ( ON ?auto_26343 ?auto_26348 ) ( CLEAR ?auto_26343 ) ( not ( = ?auto_26342 ?auto_26343 ) ) ( not ( = ?auto_26342 ?auto_26348 ) ) ( not ( = ?auto_26343 ?auto_26348 ) ) ( not ( = ?auto_26344 ?auto_26347 ) ) ( IS-CRATE ?auto_26342 ) ( not ( = ?auto_26352 ?auto_26346 ) ) ( HOIST-AT ?auto_26364 ?auto_26352 ) ( AVAILABLE ?auto_26364 ) ( SURFACE-AT ?auto_26342 ?auto_26352 ) ( ON ?auto_26342 ?auto_26353 ) ( CLEAR ?auto_26342 ) ( not ( = ?auto_26341 ?auto_26342 ) ) ( not ( = ?auto_26341 ?auto_26353 ) ) ( not ( = ?auto_26342 ?auto_26353 ) ) ( not ( = ?auto_26344 ?auto_26364 ) ) ( IS-CRATE ?auto_26341 ) ( not ( = ?auto_26362 ?auto_26346 ) ) ( HOIST-AT ?auto_26359 ?auto_26362 ) ( AVAILABLE ?auto_26359 ) ( SURFACE-AT ?auto_26341 ?auto_26362 ) ( ON ?auto_26341 ?auto_26361 ) ( CLEAR ?auto_26341 ) ( not ( = ?auto_26340 ?auto_26341 ) ) ( not ( = ?auto_26340 ?auto_26361 ) ) ( not ( = ?auto_26341 ?auto_26361 ) ) ( not ( = ?auto_26344 ?auto_26359 ) ) ( IS-CRATE ?auto_26340 ) ( not ( = ?auto_26354 ?auto_26346 ) ) ( HOIST-AT ?auto_26356 ?auto_26354 ) ( AVAILABLE ?auto_26356 ) ( SURFACE-AT ?auto_26340 ?auto_26354 ) ( ON ?auto_26340 ?auto_26357 ) ( CLEAR ?auto_26340 ) ( not ( = ?auto_26339 ?auto_26340 ) ) ( not ( = ?auto_26339 ?auto_26357 ) ) ( not ( = ?auto_26340 ?auto_26357 ) ) ( not ( = ?auto_26344 ?auto_26356 ) ) ( IS-CRATE ?auto_26339 ) ( not ( = ?auto_26363 ?auto_26346 ) ) ( HOIST-AT ?auto_26360 ?auto_26363 ) ( AVAILABLE ?auto_26360 ) ( SURFACE-AT ?auto_26339 ?auto_26363 ) ( ON ?auto_26339 ?auto_26355 ) ( CLEAR ?auto_26339 ) ( not ( = ?auto_26338 ?auto_26339 ) ) ( not ( = ?auto_26338 ?auto_26355 ) ) ( not ( = ?auto_26339 ?auto_26355 ) ) ( not ( = ?auto_26344 ?auto_26360 ) ) ( SURFACE-AT ?auto_26337 ?auto_26346 ) ( CLEAR ?auto_26337 ) ( IS-CRATE ?auto_26338 ) ( AVAILABLE ?auto_26344 ) ( not ( = ?auto_26358 ?auto_26346 ) ) ( HOIST-AT ?auto_26351 ?auto_26358 ) ( AVAILABLE ?auto_26351 ) ( SURFACE-AT ?auto_26338 ?auto_26358 ) ( ON ?auto_26338 ?auto_26350 ) ( CLEAR ?auto_26338 ) ( TRUCK-AT ?auto_26349 ?auto_26346 ) ( not ( = ?auto_26337 ?auto_26338 ) ) ( not ( = ?auto_26337 ?auto_26350 ) ) ( not ( = ?auto_26338 ?auto_26350 ) ) ( not ( = ?auto_26344 ?auto_26351 ) ) ( not ( = ?auto_26337 ?auto_26339 ) ) ( not ( = ?auto_26337 ?auto_26355 ) ) ( not ( = ?auto_26339 ?auto_26350 ) ) ( not ( = ?auto_26363 ?auto_26358 ) ) ( not ( = ?auto_26360 ?auto_26351 ) ) ( not ( = ?auto_26355 ?auto_26350 ) ) ( not ( = ?auto_26337 ?auto_26340 ) ) ( not ( = ?auto_26337 ?auto_26357 ) ) ( not ( = ?auto_26338 ?auto_26340 ) ) ( not ( = ?auto_26338 ?auto_26357 ) ) ( not ( = ?auto_26340 ?auto_26355 ) ) ( not ( = ?auto_26340 ?auto_26350 ) ) ( not ( = ?auto_26354 ?auto_26363 ) ) ( not ( = ?auto_26354 ?auto_26358 ) ) ( not ( = ?auto_26356 ?auto_26360 ) ) ( not ( = ?auto_26356 ?auto_26351 ) ) ( not ( = ?auto_26357 ?auto_26355 ) ) ( not ( = ?auto_26357 ?auto_26350 ) ) ( not ( = ?auto_26337 ?auto_26341 ) ) ( not ( = ?auto_26337 ?auto_26361 ) ) ( not ( = ?auto_26338 ?auto_26341 ) ) ( not ( = ?auto_26338 ?auto_26361 ) ) ( not ( = ?auto_26339 ?auto_26341 ) ) ( not ( = ?auto_26339 ?auto_26361 ) ) ( not ( = ?auto_26341 ?auto_26357 ) ) ( not ( = ?auto_26341 ?auto_26355 ) ) ( not ( = ?auto_26341 ?auto_26350 ) ) ( not ( = ?auto_26362 ?auto_26354 ) ) ( not ( = ?auto_26362 ?auto_26363 ) ) ( not ( = ?auto_26362 ?auto_26358 ) ) ( not ( = ?auto_26359 ?auto_26356 ) ) ( not ( = ?auto_26359 ?auto_26360 ) ) ( not ( = ?auto_26359 ?auto_26351 ) ) ( not ( = ?auto_26361 ?auto_26357 ) ) ( not ( = ?auto_26361 ?auto_26355 ) ) ( not ( = ?auto_26361 ?auto_26350 ) ) ( not ( = ?auto_26337 ?auto_26342 ) ) ( not ( = ?auto_26337 ?auto_26353 ) ) ( not ( = ?auto_26338 ?auto_26342 ) ) ( not ( = ?auto_26338 ?auto_26353 ) ) ( not ( = ?auto_26339 ?auto_26342 ) ) ( not ( = ?auto_26339 ?auto_26353 ) ) ( not ( = ?auto_26340 ?auto_26342 ) ) ( not ( = ?auto_26340 ?auto_26353 ) ) ( not ( = ?auto_26342 ?auto_26361 ) ) ( not ( = ?auto_26342 ?auto_26357 ) ) ( not ( = ?auto_26342 ?auto_26355 ) ) ( not ( = ?auto_26342 ?auto_26350 ) ) ( not ( = ?auto_26352 ?auto_26362 ) ) ( not ( = ?auto_26352 ?auto_26354 ) ) ( not ( = ?auto_26352 ?auto_26363 ) ) ( not ( = ?auto_26352 ?auto_26358 ) ) ( not ( = ?auto_26364 ?auto_26359 ) ) ( not ( = ?auto_26364 ?auto_26356 ) ) ( not ( = ?auto_26364 ?auto_26360 ) ) ( not ( = ?auto_26364 ?auto_26351 ) ) ( not ( = ?auto_26353 ?auto_26361 ) ) ( not ( = ?auto_26353 ?auto_26357 ) ) ( not ( = ?auto_26353 ?auto_26355 ) ) ( not ( = ?auto_26353 ?auto_26350 ) ) ( not ( = ?auto_26337 ?auto_26343 ) ) ( not ( = ?auto_26337 ?auto_26348 ) ) ( not ( = ?auto_26338 ?auto_26343 ) ) ( not ( = ?auto_26338 ?auto_26348 ) ) ( not ( = ?auto_26339 ?auto_26343 ) ) ( not ( = ?auto_26339 ?auto_26348 ) ) ( not ( = ?auto_26340 ?auto_26343 ) ) ( not ( = ?auto_26340 ?auto_26348 ) ) ( not ( = ?auto_26341 ?auto_26343 ) ) ( not ( = ?auto_26341 ?auto_26348 ) ) ( not ( = ?auto_26343 ?auto_26353 ) ) ( not ( = ?auto_26343 ?auto_26361 ) ) ( not ( = ?auto_26343 ?auto_26357 ) ) ( not ( = ?auto_26343 ?auto_26355 ) ) ( not ( = ?auto_26343 ?auto_26350 ) ) ( not ( = ?auto_26345 ?auto_26352 ) ) ( not ( = ?auto_26345 ?auto_26362 ) ) ( not ( = ?auto_26345 ?auto_26354 ) ) ( not ( = ?auto_26345 ?auto_26363 ) ) ( not ( = ?auto_26345 ?auto_26358 ) ) ( not ( = ?auto_26347 ?auto_26364 ) ) ( not ( = ?auto_26347 ?auto_26359 ) ) ( not ( = ?auto_26347 ?auto_26356 ) ) ( not ( = ?auto_26347 ?auto_26360 ) ) ( not ( = ?auto_26347 ?auto_26351 ) ) ( not ( = ?auto_26348 ?auto_26353 ) ) ( not ( = ?auto_26348 ?auto_26361 ) ) ( not ( = ?auto_26348 ?auto_26357 ) ) ( not ( = ?auto_26348 ?auto_26355 ) ) ( not ( = ?auto_26348 ?auto_26350 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_26337 ?auto_26338 ?auto_26339 ?auto_26340 ?auto_26341 ?auto_26342 )
      ( MAKE-1CRATE ?auto_26342 ?auto_26343 )
      ( MAKE-6CRATE-VERIFY ?auto_26337 ?auto_26338 ?auto_26339 ?auto_26340 ?auto_26341 ?auto_26342 ?auto_26343 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26367 - SURFACE
      ?auto_26368 - SURFACE
    )
    :vars
    (
      ?auto_26369 - HOIST
      ?auto_26370 - PLACE
      ?auto_26372 - PLACE
      ?auto_26373 - HOIST
      ?auto_26374 - SURFACE
      ?auto_26371 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26369 ?auto_26370 ) ( SURFACE-AT ?auto_26367 ?auto_26370 ) ( CLEAR ?auto_26367 ) ( IS-CRATE ?auto_26368 ) ( AVAILABLE ?auto_26369 ) ( not ( = ?auto_26372 ?auto_26370 ) ) ( HOIST-AT ?auto_26373 ?auto_26372 ) ( AVAILABLE ?auto_26373 ) ( SURFACE-AT ?auto_26368 ?auto_26372 ) ( ON ?auto_26368 ?auto_26374 ) ( CLEAR ?auto_26368 ) ( TRUCK-AT ?auto_26371 ?auto_26370 ) ( not ( = ?auto_26367 ?auto_26368 ) ) ( not ( = ?auto_26367 ?auto_26374 ) ) ( not ( = ?auto_26368 ?auto_26374 ) ) ( not ( = ?auto_26369 ?auto_26373 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26371 ?auto_26370 ?auto_26372 )
      ( !LIFT ?auto_26373 ?auto_26368 ?auto_26374 ?auto_26372 )
      ( !LOAD ?auto_26373 ?auto_26368 ?auto_26371 ?auto_26372 )
      ( !DRIVE ?auto_26371 ?auto_26372 ?auto_26370 )
      ( !UNLOAD ?auto_26369 ?auto_26368 ?auto_26371 ?auto_26370 )
      ( !DROP ?auto_26369 ?auto_26368 ?auto_26367 ?auto_26370 )
      ( MAKE-1CRATE-VERIFY ?auto_26367 ?auto_26368 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_26383 - SURFACE
      ?auto_26384 - SURFACE
      ?auto_26385 - SURFACE
      ?auto_26386 - SURFACE
      ?auto_26387 - SURFACE
      ?auto_26388 - SURFACE
      ?auto_26390 - SURFACE
      ?auto_26389 - SURFACE
    )
    :vars
    (
      ?auto_26394 - HOIST
      ?auto_26395 - PLACE
      ?auto_26393 - PLACE
      ?auto_26391 - HOIST
      ?auto_26392 - SURFACE
      ?auto_26408 - PLACE
      ?auto_26409 - HOIST
      ?auto_26414 - SURFACE
      ?auto_26404 - PLACE
      ?auto_26405 - HOIST
      ?auto_26402 - SURFACE
      ?auto_26407 - PLACE
      ?auto_26413 - HOIST
      ?auto_26406 - SURFACE
      ?auto_26401 - PLACE
      ?auto_26399 - HOIST
      ?auto_26398 - SURFACE
      ?auto_26397 - PLACE
      ?auto_26412 - HOIST
      ?auto_26400 - SURFACE
      ?auto_26411 - PLACE
      ?auto_26403 - HOIST
      ?auto_26410 - SURFACE
      ?auto_26396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26394 ?auto_26395 ) ( IS-CRATE ?auto_26389 ) ( not ( = ?auto_26393 ?auto_26395 ) ) ( HOIST-AT ?auto_26391 ?auto_26393 ) ( AVAILABLE ?auto_26391 ) ( SURFACE-AT ?auto_26389 ?auto_26393 ) ( ON ?auto_26389 ?auto_26392 ) ( CLEAR ?auto_26389 ) ( not ( = ?auto_26390 ?auto_26389 ) ) ( not ( = ?auto_26390 ?auto_26392 ) ) ( not ( = ?auto_26389 ?auto_26392 ) ) ( not ( = ?auto_26394 ?auto_26391 ) ) ( IS-CRATE ?auto_26390 ) ( not ( = ?auto_26408 ?auto_26395 ) ) ( HOIST-AT ?auto_26409 ?auto_26408 ) ( AVAILABLE ?auto_26409 ) ( SURFACE-AT ?auto_26390 ?auto_26408 ) ( ON ?auto_26390 ?auto_26414 ) ( CLEAR ?auto_26390 ) ( not ( = ?auto_26388 ?auto_26390 ) ) ( not ( = ?auto_26388 ?auto_26414 ) ) ( not ( = ?auto_26390 ?auto_26414 ) ) ( not ( = ?auto_26394 ?auto_26409 ) ) ( IS-CRATE ?auto_26388 ) ( not ( = ?auto_26404 ?auto_26395 ) ) ( HOIST-AT ?auto_26405 ?auto_26404 ) ( AVAILABLE ?auto_26405 ) ( SURFACE-AT ?auto_26388 ?auto_26404 ) ( ON ?auto_26388 ?auto_26402 ) ( CLEAR ?auto_26388 ) ( not ( = ?auto_26387 ?auto_26388 ) ) ( not ( = ?auto_26387 ?auto_26402 ) ) ( not ( = ?auto_26388 ?auto_26402 ) ) ( not ( = ?auto_26394 ?auto_26405 ) ) ( IS-CRATE ?auto_26387 ) ( not ( = ?auto_26407 ?auto_26395 ) ) ( HOIST-AT ?auto_26413 ?auto_26407 ) ( AVAILABLE ?auto_26413 ) ( SURFACE-AT ?auto_26387 ?auto_26407 ) ( ON ?auto_26387 ?auto_26406 ) ( CLEAR ?auto_26387 ) ( not ( = ?auto_26386 ?auto_26387 ) ) ( not ( = ?auto_26386 ?auto_26406 ) ) ( not ( = ?auto_26387 ?auto_26406 ) ) ( not ( = ?auto_26394 ?auto_26413 ) ) ( IS-CRATE ?auto_26386 ) ( not ( = ?auto_26401 ?auto_26395 ) ) ( HOIST-AT ?auto_26399 ?auto_26401 ) ( AVAILABLE ?auto_26399 ) ( SURFACE-AT ?auto_26386 ?auto_26401 ) ( ON ?auto_26386 ?auto_26398 ) ( CLEAR ?auto_26386 ) ( not ( = ?auto_26385 ?auto_26386 ) ) ( not ( = ?auto_26385 ?auto_26398 ) ) ( not ( = ?auto_26386 ?auto_26398 ) ) ( not ( = ?auto_26394 ?auto_26399 ) ) ( IS-CRATE ?auto_26385 ) ( not ( = ?auto_26397 ?auto_26395 ) ) ( HOIST-AT ?auto_26412 ?auto_26397 ) ( AVAILABLE ?auto_26412 ) ( SURFACE-AT ?auto_26385 ?auto_26397 ) ( ON ?auto_26385 ?auto_26400 ) ( CLEAR ?auto_26385 ) ( not ( = ?auto_26384 ?auto_26385 ) ) ( not ( = ?auto_26384 ?auto_26400 ) ) ( not ( = ?auto_26385 ?auto_26400 ) ) ( not ( = ?auto_26394 ?auto_26412 ) ) ( SURFACE-AT ?auto_26383 ?auto_26395 ) ( CLEAR ?auto_26383 ) ( IS-CRATE ?auto_26384 ) ( AVAILABLE ?auto_26394 ) ( not ( = ?auto_26411 ?auto_26395 ) ) ( HOIST-AT ?auto_26403 ?auto_26411 ) ( AVAILABLE ?auto_26403 ) ( SURFACE-AT ?auto_26384 ?auto_26411 ) ( ON ?auto_26384 ?auto_26410 ) ( CLEAR ?auto_26384 ) ( TRUCK-AT ?auto_26396 ?auto_26395 ) ( not ( = ?auto_26383 ?auto_26384 ) ) ( not ( = ?auto_26383 ?auto_26410 ) ) ( not ( = ?auto_26384 ?auto_26410 ) ) ( not ( = ?auto_26394 ?auto_26403 ) ) ( not ( = ?auto_26383 ?auto_26385 ) ) ( not ( = ?auto_26383 ?auto_26400 ) ) ( not ( = ?auto_26385 ?auto_26410 ) ) ( not ( = ?auto_26397 ?auto_26411 ) ) ( not ( = ?auto_26412 ?auto_26403 ) ) ( not ( = ?auto_26400 ?auto_26410 ) ) ( not ( = ?auto_26383 ?auto_26386 ) ) ( not ( = ?auto_26383 ?auto_26398 ) ) ( not ( = ?auto_26384 ?auto_26386 ) ) ( not ( = ?auto_26384 ?auto_26398 ) ) ( not ( = ?auto_26386 ?auto_26400 ) ) ( not ( = ?auto_26386 ?auto_26410 ) ) ( not ( = ?auto_26401 ?auto_26397 ) ) ( not ( = ?auto_26401 ?auto_26411 ) ) ( not ( = ?auto_26399 ?auto_26412 ) ) ( not ( = ?auto_26399 ?auto_26403 ) ) ( not ( = ?auto_26398 ?auto_26400 ) ) ( not ( = ?auto_26398 ?auto_26410 ) ) ( not ( = ?auto_26383 ?auto_26387 ) ) ( not ( = ?auto_26383 ?auto_26406 ) ) ( not ( = ?auto_26384 ?auto_26387 ) ) ( not ( = ?auto_26384 ?auto_26406 ) ) ( not ( = ?auto_26385 ?auto_26387 ) ) ( not ( = ?auto_26385 ?auto_26406 ) ) ( not ( = ?auto_26387 ?auto_26398 ) ) ( not ( = ?auto_26387 ?auto_26400 ) ) ( not ( = ?auto_26387 ?auto_26410 ) ) ( not ( = ?auto_26407 ?auto_26401 ) ) ( not ( = ?auto_26407 ?auto_26397 ) ) ( not ( = ?auto_26407 ?auto_26411 ) ) ( not ( = ?auto_26413 ?auto_26399 ) ) ( not ( = ?auto_26413 ?auto_26412 ) ) ( not ( = ?auto_26413 ?auto_26403 ) ) ( not ( = ?auto_26406 ?auto_26398 ) ) ( not ( = ?auto_26406 ?auto_26400 ) ) ( not ( = ?auto_26406 ?auto_26410 ) ) ( not ( = ?auto_26383 ?auto_26388 ) ) ( not ( = ?auto_26383 ?auto_26402 ) ) ( not ( = ?auto_26384 ?auto_26388 ) ) ( not ( = ?auto_26384 ?auto_26402 ) ) ( not ( = ?auto_26385 ?auto_26388 ) ) ( not ( = ?auto_26385 ?auto_26402 ) ) ( not ( = ?auto_26386 ?auto_26388 ) ) ( not ( = ?auto_26386 ?auto_26402 ) ) ( not ( = ?auto_26388 ?auto_26406 ) ) ( not ( = ?auto_26388 ?auto_26398 ) ) ( not ( = ?auto_26388 ?auto_26400 ) ) ( not ( = ?auto_26388 ?auto_26410 ) ) ( not ( = ?auto_26404 ?auto_26407 ) ) ( not ( = ?auto_26404 ?auto_26401 ) ) ( not ( = ?auto_26404 ?auto_26397 ) ) ( not ( = ?auto_26404 ?auto_26411 ) ) ( not ( = ?auto_26405 ?auto_26413 ) ) ( not ( = ?auto_26405 ?auto_26399 ) ) ( not ( = ?auto_26405 ?auto_26412 ) ) ( not ( = ?auto_26405 ?auto_26403 ) ) ( not ( = ?auto_26402 ?auto_26406 ) ) ( not ( = ?auto_26402 ?auto_26398 ) ) ( not ( = ?auto_26402 ?auto_26400 ) ) ( not ( = ?auto_26402 ?auto_26410 ) ) ( not ( = ?auto_26383 ?auto_26390 ) ) ( not ( = ?auto_26383 ?auto_26414 ) ) ( not ( = ?auto_26384 ?auto_26390 ) ) ( not ( = ?auto_26384 ?auto_26414 ) ) ( not ( = ?auto_26385 ?auto_26390 ) ) ( not ( = ?auto_26385 ?auto_26414 ) ) ( not ( = ?auto_26386 ?auto_26390 ) ) ( not ( = ?auto_26386 ?auto_26414 ) ) ( not ( = ?auto_26387 ?auto_26390 ) ) ( not ( = ?auto_26387 ?auto_26414 ) ) ( not ( = ?auto_26390 ?auto_26402 ) ) ( not ( = ?auto_26390 ?auto_26406 ) ) ( not ( = ?auto_26390 ?auto_26398 ) ) ( not ( = ?auto_26390 ?auto_26400 ) ) ( not ( = ?auto_26390 ?auto_26410 ) ) ( not ( = ?auto_26408 ?auto_26404 ) ) ( not ( = ?auto_26408 ?auto_26407 ) ) ( not ( = ?auto_26408 ?auto_26401 ) ) ( not ( = ?auto_26408 ?auto_26397 ) ) ( not ( = ?auto_26408 ?auto_26411 ) ) ( not ( = ?auto_26409 ?auto_26405 ) ) ( not ( = ?auto_26409 ?auto_26413 ) ) ( not ( = ?auto_26409 ?auto_26399 ) ) ( not ( = ?auto_26409 ?auto_26412 ) ) ( not ( = ?auto_26409 ?auto_26403 ) ) ( not ( = ?auto_26414 ?auto_26402 ) ) ( not ( = ?auto_26414 ?auto_26406 ) ) ( not ( = ?auto_26414 ?auto_26398 ) ) ( not ( = ?auto_26414 ?auto_26400 ) ) ( not ( = ?auto_26414 ?auto_26410 ) ) ( not ( = ?auto_26383 ?auto_26389 ) ) ( not ( = ?auto_26383 ?auto_26392 ) ) ( not ( = ?auto_26384 ?auto_26389 ) ) ( not ( = ?auto_26384 ?auto_26392 ) ) ( not ( = ?auto_26385 ?auto_26389 ) ) ( not ( = ?auto_26385 ?auto_26392 ) ) ( not ( = ?auto_26386 ?auto_26389 ) ) ( not ( = ?auto_26386 ?auto_26392 ) ) ( not ( = ?auto_26387 ?auto_26389 ) ) ( not ( = ?auto_26387 ?auto_26392 ) ) ( not ( = ?auto_26388 ?auto_26389 ) ) ( not ( = ?auto_26388 ?auto_26392 ) ) ( not ( = ?auto_26389 ?auto_26414 ) ) ( not ( = ?auto_26389 ?auto_26402 ) ) ( not ( = ?auto_26389 ?auto_26406 ) ) ( not ( = ?auto_26389 ?auto_26398 ) ) ( not ( = ?auto_26389 ?auto_26400 ) ) ( not ( = ?auto_26389 ?auto_26410 ) ) ( not ( = ?auto_26393 ?auto_26408 ) ) ( not ( = ?auto_26393 ?auto_26404 ) ) ( not ( = ?auto_26393 ?auto_26407 ) ) ( not ( = ?auto_26393 ?auto_26401 ) ) ( not ( = ?auto_26393 ?auto_26397 ) ) ( not ( = ?auto_26393 ?auto_26411 ) ) ( not ( = ?auto_26391 ?auto_26409 ) ) ( not ( = ?auto_26391 ?auto_26405 ) ) ( not ( = ?auto_26391 ?auto_26413 ) ) ( not ( = ?auto_26391 ?auto_26399 ) ) ( not ( = ?auto_26391 ?auto_26412 ) ) ( not ( = ?auto_26391 ?auto_26403 ) ) ( not ( = ?auto_26392 ?auto_26414 ) ) ( not ( = ?auto_26392 ?auto_26402 ) ) ( not ( = ?auto_26392 ?auto_26406 ) ) ( not ( = ?auto_26392 ?auto_26398 ) ) ( not ( = ?auto_26392 ?auto_26400 ) ) ( not ( = ?auto_26392 ?auto_26410 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_26383 ?auto_26384 ?auto_26385 ?auto_26386 ?auto_26387 ?auto_26388 ?auto_26390 )
      ( MAKE-1CRATE ?auto_26390 ?auto_26389 )
      ( MAKE-7CRATE-VERIFY ?auto_26383 ?auto_26384 ?auto_26385 ?auto_26386 ?auto_26387 ?auto_26388 ?auto_26390 ?auto_26389 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26417 - SURFACE
      ?auto_26418 - SURFACE
    )
    :vars
    (
      ?auto_26419 - HOIST
      ?auto_26420 - PLACE
      ?auto_26422 - PLACE
      ?auto_26423 - HOIST
      ?auto_26424 - SURFACE
      ?auto_26421 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26419 ?auto_26420 ) ( SURFACE-AT ?auto_26417 ?auto_26420 ) ( CLEAR ?auto_26417 ) ( IS-CRATE ?auto_26418 ) ( AVAILABLE ?auto_26419 ) ( not ( = ?auto_26422 ?auto_26420 ) ) ( HOIST-AT ?auto_26423 ?auto_26422 ) ( AVAILABLE ?auto_26423 ) ( SURFACE-AT ?auto_26418 ?auto_26422 ) ( ON ?auto_26418 ?auto_26424 ) ( CLEAR ?auto_26418 ) ( TRUCK-AT ?auto_26421 ?auto_26420 ) ( not ( = ?auto_26417 ?auto_26418 ) ) ( not ( = ?auto_26417 ?auto_26424 ) ) ( not ( = ?auto_26418 ?auto_26424 ) ) ( not ( = ?auto_26419 ?auto_26423 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26421 ?auto_26420 ?auto_26422 )
      ( !LIFT ?auto_26423 ?auto_26418 ?auto_26424 ?auto_26422 )
      ( !LOAD ?auto_26423 ?auto_26418 ?auto_26421 ?auto_26422 )
      ( !DRIVE ?auto_26421 ?auto_26422 ?auto_26420 )
      ( !UNLOAD ?auto_26419 ?auto_26418 ?auto_26421 ?auto_26420 )
      ( !DROP ?auto_26419 ?auto_26418 ?auto_26417 ?auto_26420 )
      ( MAKE-1CRATE-VERIFY ?auto_26417 ?auto_26418 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_26434 - SURFACE
      ?auto_26435 - SURFACE
      ?auto_26436 - SURFACE
      ?auto_26437 - SURFACE
      ?auto_26438 - SURFACE
      ?auto_26439 - SURFACE
      ?auto_26442 - SURFACE
      ?auto_26441 - SURFACE
      ?auto_26440 - SURFACE
    )
    :vars
    (
      ?auto_26448 - HOIST
      ?auto_26447 - PLACE
      ?auto_26446 - PLACE
      ?auto_26443 - HOIST
      ?auto_26445 - SURFACE
      ?auto_26453 - PLACE
      ?auto_26451 - HOIST
      ?auto_26467 - SURFACE
      ?auto_26458 - PLACE
      ?auto_26459 - HOIST
      ?auto_26465 - SURFACE
      ?auto_26461 - PLACE
      ?auto_26450 - HOIST
      ?auto_26454 - SURFACE
      ?auto_26452 - PLACE
      ?auto_26466 - HOIST
      ?auto_26449 - SURFACE
      ?auto_26455 - PLACE
      ?auto_26463 - HOIST
      ?auto_26457 - SURFACE
      ?auto_26456 - SURFACE
      ?auto_26464 - PLACE
      ?auto_26462 - HOIST
      ?auto_26460 - SURFACE
      ?auto_26444 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26448 ?auto_26447 ) ( IS-CRATE ?auto_26440 ) ( not ( = ?auto_26446 ?auto_26447 ) ) ( HOIST-AT ?auto_26443 ?auto_26446 ) ( SURFACE-AT ?auto_26440 ?auto_26446 ) ( ON ?auto_26440 ?auto_26445 ) ( CLEAR ?auto_26440 ) ( not ( = ?auto_26441 ?auto_26440 ) ) ( not ( = ?auto_26441 ?auto_26445 ) ) ( not ( = ?auto_26440 ?auto_26445 ) ) ( not ( = ?auto_26448 ?auto_26443 ) ) ( IS-CRATE ?auto_26441 ) ( not ( = ?auto_26453 ?auto_26447 ) ) ( HOIST-AT ?auto_26451 ?auto_26453 ) ( AVAILABLE ?auto_26451 ) ( SURFACE-AT ?auto_26441 ?auto_26453 ) ( ON ?auto_26441 ?auto_26467 ) ( CLEAR ?auto_26441 ) ( not ( = ?auto_26442 ?auto_26441 ) ) ( not ( = ?auto_26442 ?auto_26467 ) ) ( not ( = ?auto_26441 ?auto_26467 ) ) ( not ( = ?auto_26448 ?auto_26451 ) ) ( IS-CRATE ?auto_26442 ) ( not ( = ?auto_26458 ?auto_26447 ) ) ( HOIST-AT ?auto_26459 ?auto_26458 ) ( AVAILABLE ?auto_26459 ) ( SURFACE-AT ?auto_26442 ?auto_26458 ) ( ON ?auto_26442 ?auto_26465 ) ( CLEAR ?auto_26442 ) ( not ( = ?auto_26439 ?auto_26442 ) ) ( not ( = ?auto_26439 ?auto_26465 ) ) ( not ( = ?auto_26442 ?auto_26465 ) ) ( not ( = ?auto_26448 ?auto_26459 ) ) ( IS-CRATE ?auto_26439 ) ( not ( = ?auto_26461 ?auto_26447 ) ) ( HOIST-AT ?auto_26450 ?auto_26461 ) ( AVAILABLE ?auto_26450 ) ( SURFACE-AT ?auto_26439 ?auto_26461 ) ( ON ?auto_26439 ?auto_26454 ) ( CLEAR ?auto_26439 ) ( not ( = ?auto_26438 ?auto_26439 ) ) ( not ( = ?auto_26438 ?auto_26454 ) ) ( not ( = ?auto_26439 ?auto_26454 ) ) ( not ( = ?auto_26448 ?auto_26450 ) ) ( IS-CRATE ?auto_26438 ) ( not ( = ?auto_26452 ?auto_26447 ) ) ( HOIST-AT ?auto_26466 ?auto_26452 ) ( AVAILABLE ?auto_26466 ) ( SURFACE-AT ?auto_26438 ?auto_26452 ) ( ON ?auto_26438 ?auto_26449 ) ( CLEAR ?auto_26438 ) ( not ( = ?auto_26437 ?auto_26438 ) ) ( not ( = ?auto_26437 ?auto_26449 ) ) ( not ( = ?auto_26438 ?auto_26449 ) ) ( not ( = ?auto_26448 ?auto_26466 ) ) ( IS-CRATE ?auto_26437 ) ( not ( = ?auto_26455 ?auto_26447 ) ) ( HOIST-AT ?auto_26463 ?auto_26455 ) ( AVAILABLE ?auto_26463 ) ( SURFACE-AT ?auto_26437 ?auto_26455 ) ( ON ?auto_26437 ?auto_26457 ) ( CLEAR ?auto_26437 ) ( not ( = ?auto_26436 ?auto_26437 ) ) ( not ( = ?auto_26436 ?auto_26457 ) ) ( not ( = ?auto_26437 ?auto_26457 ) ) ( not ( = ?auto_26448 ?auto_26463 ) ) ( IS-CRATE ?auto_26436 ) ( AVAILABLE ?auto_26443 ) ( SURFACE-AT ?auto_26436 ?auto_26446 ) ( ON ?auto_26436 ?auto_26456 ) ( CLEAR ?auto_26436 ) ( not ( = ?auto_26435 ?auto_26436 ) ) ( not ( = ?auto_26435 ?auto_26456 ) ) ( not ( = ?auto_26436 ?auto_26456 ) ) ( SURFACE-AT ?auto_26434 ?auto_26447 ) ( CLEAR ?auto_26434 ) ( IS-CRATE ?auto_26435 ) ( AVAILABLE ?auto_26448 ) ( not ( = ?auto_26464 ?auto_26447 ) ) ( HOIST-AT ?auto_26462 ?auto_26464 ) ( AVAILABLE ?auto_26462 ) ( SURFACE-AT ?auto_26435 ?auto_26464 ) ( ON ?auto_26435 ?auto_26460 ) ( CLEAR ?auto_26435 ) ( TRUCK-AT ?auto_26444 ?auto_26447 ) ( not ( = ?auto_26434 ?auto_26435 ) ) ( not ( = ?auto_26434 ?auto_26460 ) ) ( not ( = ?auto_26435 ?auto_26460 ) ) ( not ( = ?auto_26448 ?auto_26462 ) ) ( not ( = ?auto_26434 ?auto_26436 ) ) ( not ( = ?auto_26434 ?auto_26456 ) ) ( not ( = ?auto_26436 ?auto_26460 ) ) ( not ( = ?auto_26446 ?auto_26464 ) ) ( not ( = ?auto_26443 ?auto_26462 ) ) ( not ( = ?auto_26456 ?auto_26460 ) ) ( not ( = ?auto_26434 ?auto_26437 ) ) ( not ( = ?auto_26434 ?auto_26457 ) ) ( not ( = ?auto_26435 ?auto_26437 ) ) ( not ( = ?auto_26435 ?auto_26457 ) ) ( not ( = ?auto_26437 ?auto_26456 ) ) ( not ( = ?auto_26437 ?auto_26460 ) ) ( not ( = ?auto_26455 ?auto_26446 ) ) ( not ( = ?auto_26455 ?auto_26464 ) ) ( not ( = ?auto_26463 ?auto_26443 ) ) ( not ( = ?auto_26463 ?auto_26462 ) ) ( not ( = ?auto_26457 ?auto_26456 ) ) ( not ( = ?auto_26457 ?auto_26460 ) ) ( not ( = ?auto_26434 ?auto_26438 ) ) ( not ( = ?auto_26434 ?auto_26449 ) ) ( not ( = ?auto_26435 ?auto_26438 ) ) ( not ( = ?auto_26435 ?auto_26449 ) ) ( not ( = ?auto_26436 ?auto_26438 ) ) ( not ( = ?auto_26436 ?auto_26449 ) ) ( not ( = ?auto_26438 ?auto_26457 ) ) ( not ( = ?auto_26438 ?auto_26456 ) ) ( not ( = ?auto_26438 ?auto_26460 ) ) ( not ( = ?auto_26452 ?auto_26455 ) ) ( not ( = ?auto_26452 ?auto_26446 ) ) ( not ( = ?auto_26452 ?auto_26464 ) ) ( not ( = ?auto_26466 ?auto_26463 ) ) ( not ( = ?auto_26466 ?auto_26443 ) ) ( not ( = ?auto_26466 ?auto_26462 ) ) ( not ( = ?auto_26449 ?auto_26457 ) ) ( not ( = ?auto_26449 ?auto_26456 ) ) ( not ( = ?auto_26449 ?auto_26460 ) ) ( not ( = ?auto_26434 ?auto_26439 ) ) ( not ( = ?auto_26434 ?auto_26454 ) ) ( not ( = ?auto_26435 ?auto_26439 ) ) ( not ( = ?auto_26435 ?auto_26454 ) ) ( not ( = ?auto_26436 ?auto_26439 ) ) ( not ( = ?auto_26436 ?auto_26454 ) ) ( not ( = ?auto_26437 ?auto_26439 ) ) ( not ( = ?auto_26437 ?auto_26454 ) ) ( not ( = ?auto_26439 ?auto_26449 ) ) ( not ( = ?auto_26439 ?auto_26457 ) ) ( not ( = ?auto_26439 ?auto_26456 ) ) ( not ( = ?auto_26439 ?auto_26460 ) ) ( not ( = ?auto_26461 ?auto_26452 ) ) ( not ( = ?auto_26461 ?auto_26455 ) ) ( not ( = ?auto_26461 ?auto_26446 ) ) ( not ( = ?auto_26461 ?auto_26464 ) ) ( not ( = ?auto_26450 ?auto_26466 ) ) ( not ( = ?auto_26450 ?auto_26463 ) ) ( not ( = ?auto_26450 ?auto_26443 ) ) ( not ( = ?auto_26450 ?auto_26462 ) ) ( not ( = ?auto_26454 ?auto_26449 ) ) ( not ( = ?auto_26454 ?auto_26457 ) ) ( not ( = ?auto_26454 ?auto_26456 ) ) ( not ( = ?auto_26454 ?auto_26460 ) ) ( not ( = ?auto_26434 ?auto_26442 ) ) ( not ( = ?auto_26434 ?auto_26465 ) ) ( not ( = ?auto_26435 ?auto_26442 ) ) ( not ( = ?auto_26435 ?auto_26465 ) ) ( not ( = ?auto_26436 ?auto_26442 ) ) ( not ( = ?auto_26436 ?auto_26465 ) ) ( not ( = ?auto_26437 ?auto_26442 ) ) ( not ( = ?auto_26437 ?auto_26465 ) ) ( not ( = ?auto_26438 ?auto_26442 ) ) ( not ( = ?auto_26438 ?auto_26465 ) ) ( not ( = ?auto_26442 ?auto_26454 ) ) ( not ( = ?auto_26442 ?auto_26449 ) ) ( not ( = ?auto_26442 ?auto_26457 ) ) ( not ( = ?auto_26442 ?auto_26456 ) ) ( not ( = ?auto_26442 ?auto_26460 ) ) ( not ( = ?auto_26458 ?auto_26461 ) ) ( not ( = ?auto_26458 ?auto_26452 ) ) ( not ( = ?auto_26458 ?auto_26455 ) ) ( not ( = ?auto_26458 ?auto_26446 ) ) ( not ( = ?auto_26458 ?auto_26464 ) ) ( not ( = ?auto_26459 ?auto_26450 ) ) ( not ( = ?auto_26459 ?auto_26466 ) ) ( not ( = ?auto_26459 ?auto_26463 ) ) ( not ( = ?auto_26459 ?auto_26443 ) ) ( not ( = ?auto_26459 ?auto_26462 ) ) ( not ( = ?auto_26465 ?auto_26454 ) ) ( not ( = ?auto_26465 ?auto_26449 ) ) ( not ( = ?auto_26465 ?auto_26457 ) ) ( not ( = ?auto_26465 ?auto_26456 ) ) ( not ( = ?auto_26465 ?auto_26460 ) ) ( not ( = ?auto_26434 ?auto_26441 ) ) ( not ( = ?auto_26434 ?auto_26467 ) ) ( not ( = ?auto_26435 ?auto_26441 ) ) ( not ( = ?auto_26435 ?auto_26467 ) ) ( not ( = ?auto_26436 ?auto_26441 ) ) ( not ( = ?auto_26436 ?auto_26467 ) ) ( not ( = ?auto_26437 ?auto_26441 ) ) ( not ( = ?auto_26437 ?auto_26467 ) ) ( not ( = ?auto_26438 ?auto_26441 ) ) ( not ( = ?auto_26438 ?auto_26467 ) ) ( not ( = ?auto_26439 ?auto_26441 ) ) ( not ( = ?auto_26439 ?auto_26467 ) ) ( not ( = ?auto_26441 ?auto_26465 ) ) ( not ( = ?auto_26441 ?auto_26454 ) ) ( not ( = ?auto_26441 ?auto_26449 ) ) ( not ( = ?auto_26441 ?auto_26457 ) ) ( not ( = ?auto_26441 ?auto_26456 ) ) ( not ( = ?auto_26441 ?auto_26460 ) ) ( not ( = ?auto_26453 ?auto_26458 ) ) ( not ( = ?auto_26453 ?auto_26461 ) ) ( not ( = ?auto_26453 ?auto_26452 ) ) ( not ( = ?auto_26453 ?auto_26455 ) ) ( not ( = ?auto_26453 ?auto_26446 ) ) ( not ( = ?auto_26453 ?auto_26464 ) ) ( not ( = ?auto_26451 ?auto_26459 ) ) ( not ( = ?auto_26451 ?auto_26450 ) ) ( not ( = ?auto_26451 ?auto_26466 ) ) ( not ( = ?auto_26451 ?auto_26463 ) ) ( not ( = ?auto_26451 ?auto_26443 ) ) ( not ( = ?auto_26451 ?auto_26462 ) ) ( not ( = ?auto_26467 ?auto_26465 ) ) ( not ( = ?auto_26467 ?auto_26454 ) ) ( not ( = ?auto_26467 ?auto_26449 ) ) ( not ( = ?auto_26467 ?auto_26457 ) ) ( not ( = ?auto_26467 ?auto_26456 ) ) ( not ( = ?auto_26467 ?auto_26460 ) ) ( not ( = ?auto_26434 ?auto_26440 ) ) ( not ( = ?auto_26434 ?auto_26445 ) ) ( not ( = ?auto_26435 ?auto_26440 ) ) ( not ( = ?auto_26435 ?auto_26445 ) ) ( not ( = ?auto_26436 ?auto_26440 ) ) ( not ( = ?auto_26436 ?auto_26445 ) ) ( not ( = ?auto_26437 ?auto_26440 ) ) ( not ( = ?auto_26437 ?auto_26445 ) ) ( not ( = ?auto_26438 ?auto_26440 ) ) ( not ( = ?auto_26438 ?auto_26445 ) ) ( not ( = ?auto_26439 ?auto_26440 ) ) ( not ( = ?auto_26439 ?auto_26445 ) ) ( not ( = ?auto_26442 ?auto_26440 ) ) ( not ( = ?auto_26442 ?auto_26445 ) ) ( not ( = ?auto_26440 ?auto_26467 ) ) ( not ( = ?auto_26440 ?auto_26465 ) ) ( not ( = ?auto_26440 ?auto_26454 ) ) ( not ( = ?auto_26440 ?auto_26449 ) ) ( not ( = ?auto_26440 ?auto_26457 ) ) ( not ( = ?auto_26440 ?auto_26456 ) ) ( not ( = ?auto_26440 ?auto_26460 ) ) ( not ( = ?auto_26445 ?auto_26467 ) ) ( not ( = ?auto_26445 ?auto_26465 ) ) ( not ( = ?auto_26445 ?auto_26454 ) ) ( not ( = ?auto_26445 ?auto_26449 ) ) ( not ( = ?auto_26445 ?auto_26457 ) ) ( not ( = ?auto_26445 ?auto_26456 ) ) ( not ( = ?auto_26445 ?auto_26460 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_26434 ?auto_26435 ?auto_26436 ?auto_26437 ?auto_26438 ?auto_26439 ?auto_26442 ?auto_26441 )
      ( MAKE-1CRATE ?auto_26441 ?auto_26440 )
      ( MAKE-8CRATE-VERIFY ?auto_26434 ?auto_26435 ?auto_26436 ?auto_26437 ?auto_26438 ?auto_26439 ?auto_26442 ?auto_26441 ?auto_26440 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26470 - SURFACE
      ?auto_26471 - SURFACE
    )
    :vars
    (
      ?auto_26472 - HOIST
      ?auto_26473 - PLACE
      ?auto_26475 - PLACE
      ?auto_26476 - HOIST
      ?auto_26477 - SURFACE
      ?auto_26474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26472 ?auto_26473 ) ( SURFACE-AT ?auto_26470 ?auto_26473 ) ( CLEAR ?auto_26470 ) ( IS-CRATE ?auto_26471 ) ( AVAILABLE ?auto_26472 ) ( not ( = ?auto_26475 ?auto_26473 ) ) ( HOIST-AT ?auto_26476 ?auto_26475 ) ( AVAILABLE ?auto_26476 ) ( SURFACE-AT ?auto_26471 ?auto_26475 ) ( ON ?auto_26471 ?auto_26477 ) ( CLEAR ?auto_26471 ) ( TRUCK-AT ?auto_26474 ?auto_26473 ) ( not ( = ?auto_26470 ?auto_26471 ) ) ( not ( = ?auto_26470 ?auto_26477 ) ) ( not ( = ?auto_26471 ?auto_26477 ) ) ( not ( = ?auto_26472 ?auto_26476 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26474 ?auto_26473 ?auto_26475 )
      ( !LIFT ?auto_26476 ?auto_26471 ?auto_26477 ?auto_26475 )
      ( !LOAD ?auto_26476 ?auto_26471 ?auto_26474 ?auto_26475 )
      ( !DRIVE ?auto_26474 ?auto_26475 ?auto_26473 )
      ( !UNLOAD ?auto_26472 ?auto_26471 ?auto_26474 ?auto_26473 )
      ( !DROP ?auto_26472 ?auto_26471 ?auto_26470 ?auto_26473 )
      ( MAKE-1CRATE-VERIFY ?auto_26470 ?auto_26471 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_26488 - SURFACE
      ?auto_26489 - SURFACE
      ?auto_26490 - SURFACE
      ?auto_26491 - SURFACE
      ?auto_26492 - SURFACE
      ?auto_26493 - SURFACE
      ?auto_26496 - SURFACE
      ?auto_26495 - SURFACE
      ?auto_26494 - SURFACE
      ?auto_26497 - SURFACE
    )
    :vars
    (
      ?auto_26499 - HOIST
      ?auto_26498 - PLACE
      ?auto_26500 - PLACE
      ?auto_26502 - HOIST
      ?auto_26501 - SURFACE
      ?auto_26514 - PLACE
      ?auto_26516 - HOIST
      ?auto_26515 - SURFACE
      ?auto_26510 - PLACE
      ?auto_26512 - HOIST
      ?auto_26520 - SURFACE
      ?auto_26504 - PLACE
      ?auto_26517 - HOIST
      ?auto_26521 - SURFACE
      ?auto_26506 - PLACE
      ?auto_26511 - HOIST
      ?auto_26509 - SURFACE
      ?auto_26513 - PLACE
      ?auto_26523 - HOIST
      ?auto_26522 - SURFACE
      ?auto_26519 - SURFACE
      ?auto_26508 - SURFACE
      ?auto_26518 - PLACE
      ?auto_26507 - HOIST
      ?auto_26505 - SURFACE
      ?auto_26503 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26499 ?auto_26498 ) ( IS-CRATE ?auto_26497 ) ( not ( = ?auto_26500 ?auto_26498 ) ) ( HOIST-AT ?auto_26502 ?auto_26500 ) ( SURFACE-AT ?auto_26497 ?auto_26500 ) ( ON ?auto_26497 ?auto_26501 ) ( CLEAR ?auto_26497 ) ( not ( = ?auto_26494 ?auto_26497 ) ) ( not ( = ?auto_26494 ?auto_26501 ) ) ( not ( = ?auto_26497 ?auto_26501 ) ) ( not ( = ?auto_26499 ?auto_26502 ) ) ( IS-CRATE ?auto_26494 ) ( not ( = ?auto_26514 ?auto_26498 ) ) ( HOIST-AT ?auto_26516 ?auto_26514 ) ( SURFACE-AT ?auto_26494 ?auto_26514 ) ( ON ?auto_26494 ?auto_26515 ) ( CLEAR ?auto_26494 ) ( not ( = ?auto_26495 ?auto_26494 ) ) ( not ( = ?auto_26495 ?auto_26515 ) ) ( not ( = ?auto_26494 ?auto_26515 ) ) ( not ( = ?auto_26499 ?auto_26516 ) ) ( IS-CRATE ?auto_26495 ) ( not ( = ?auto_26510 ?auto_26498 ) ) ( HOIST-AT ?auto_26512 ?auto_26510 ) ( AVAILABLE ?auto_26512 ) ( SURFACE-AT ?auto_26495 ?auto_26510 ) ( ON ?auto_26495 ?auto_26520 ) ( CLEAR ?auto_26495 ) ( not ( = ?auto_26496 ?auto_26495 ) ) ( not ( = ?auto_26496 ?auto_26520 ) ) ( not ( = ?auto_26495 ?auto_26520 ) ) ( not ( = ?auto_26499 ?auto_26512 ) ) ( IS-CRATE ?auto_26496 ) ( not ( = ?auto_26504 ?auto_26498 ) ) ( HOIST-AT ?auto_26517 ?auto_26504 ) ( AVAILABLE ?auto_26517 ) ( SURFACE-AT ?auto_26496 ?auto_26504 ) ( ON ?auto_26496 ?auto_26521 ) ( CLEAR ?auto_26496 ) ( not ( = ?auto_26493 ?auto_26496 ) ) ( not ( = ?auto_26493 ?auto_26521 ) ) ( not ( = ?auto_26496 ?auto_26521 ) ) ( not ( = ?auto_26499 ?auto_26517 ) ) ( IS-CRATE ?auto_26493 ) ( not ( = ?auto_26506 ?auto_26498 ) ) ( HOIST-AT ?auto_26511 ?auto_26506 ) ( AVAILABLE ?auto_26511 ) ( SURFACE-AT ?auto_26493 ?auto_26506 ) ( ON ?auto_26493 ?auto_26509 ) ( CLEAR ?auto_26493 ) ( not ( = ?auto_26492 ?auto_26493 ) ) ( not ( = ?auto_26492 ?auto_26509 ) ) ( not ( = ?auto_26493 ?auto_26509 ) ) ( not ( = ?auto_26499 ?auto_26511 ) ) ( IS-CRATE ?auto_26492 ) ( not ( = ?auto_26513 ?auto_26498 ) ) ( HOIST-AT ?auto_26523 ?auto_26513 ) ( AVAILABLE ?auto_26523 ) ( SURFACE-AT ?auto_26492 ?auto_26513 ) ( ON ?auto_26492 ?auto_26522 ) ( CLEAR ?auto_26492 ) ( not ( = ?auto_26491 ?auto_26492 ) ) ( not ( = ?auto_26491 ?auto_26522 ) ) ( not ( = ?auto_26492 ?auto_26522 ) ) ( not ( = ?auto_26499 ?auto_26523 ) ) ( IS-CRATE ?auto_26491 ) ( AVAILABLE ?auto_26502 ) ( SURFACE-AT ?auto_26491 ?auto_26500 ) ( ON ?auto_26491 ?auto_26519 ) ( CLEAR ?auto_26491 ) ( not ( = ?auto_26490 ?auto_26491 ) ) ( not ( = ?auto_26490 ?auto_26519 ) ) ( not ( = ?auto_26491 ?auto_26519 ) ) ( IS-CRATE ?auto_26490 ) ( AVAILABLE ?auto_26516 ) ( SURFACE-AT ?auto_26490 ?auto_26514 ) ( ON ?auto_26490 ?auto_26508 ) ( CLEAR ?auto_26490 ) ( not ( = ?auto_26489 ?auto_26490 ) ) ( not ( = ?auto_26489 ?auto_26508 ) ) ( not ( = ?auto_26490 ?auto_26508 ) ) ( SURFACE-AT ?auto_26488 ?auto_26498 ) ( CLEAR ?auto_26488 ) ( IS-CRATE ?auto_26489 ) ( AVAILABLE ?auto_26499 ) ( not ( = ?auto_26518 ?auto_26498 ) ) ( HOIST-AT ?auto_26507 ?auto_26518 ) ( AVAILABLE ?auto_26507 ) ( SURFACE-AT ?auto_26489 ?auto_26518 ) ( ON ?auto_26489 ?auto_26505 ) ( CLEAR ?auto_26489 ) ( TRUCK-AT ?auto_26503 ?auto_26498 ) ( not ( = ?auto_26488 ?auto_26489 ) ) ( not ( = ?auto_26488 ?auto_26505 ) ) ( not ( = ?auto_26489 ?auto_26505 ) ) ( not ( = ?auto_26499 ?auto_26507 ) ) ( not ( = ?auto_26488 ?auto_26490 ) ) ( not ( = ?auto_26488 ?auto_26508 ) ) ( not ( = ?auto_26490 ?auto_26505 ) ) ( not ( = ?auto_26514 ?auto_26518 ) ) ( not ( = ?auto_26516 ?auto_26507 ) ) ( not ( = ?auto_26508 ?auto_26505 ) ) ( not ( = ?auto_26488 ?auto_26491 ) ) ( not ( = ?auto_26488 ?auto_26519 ) ) ( not ( = ?auto_26489 ?auto_26491 ) ) ( not ( = ?auto_26489 ?auto_26519 ) ) ( not ( = ?auto_26491 ?auto_26508 ) ) ( not ( = ?auto_26491 ?auto_26505 ) ) ( not ( = ?auto_26500 ?auto_26514 ) ) ( not ( = ?auto_26500 ?auto_26518 ) ) ( not ( = ?auto_26502 ?auto_26516 ) ) ( not ( = ?auto_26502 ?auto_26507 ) ) ( not ( = ?auto_26519 ?auto_26508 ) ) ( not ( = ?auto_26519 ?auto_26505 ) ) ( not ( = ?auto_26488 ?auto_26492 ) ) ( not ( = ?auto_26488 ?auto_26522 ) ) ( not ( = ?auto_26489 ?auto_26492 ) ) ( not ( = ?auto_26489 ?auto_26522 ) ) ( not ( = ?auto_26490 ?auto_26492 ) ) ( not ( = ?auto_26490 ?auto_26522 ) ) ( not ( = ?auto_26492 ?auto_26519 ) ) ( not ( = ?auto_26492 ?auto_26508 ) ) ( not ( = ?auto_26492 ?auto_26505 ) ) ( not ( = ?auto_26513 ?auto_26500 ) ) ( not ( = ?auto_26513 ?auto_26514 ) ) ( not ( = ?auto_26513 ?auto_26518 ) ) ( not ( = ?auto_26523 ?auto_26502 ) ) ( not ( = ?auto_26523 ?auto_26516 ) ) ( not ( = ?auto_26523 ?auto_26507 ) ) ( not ( = ?auto_26522 ?auto_26519 ) ) ( not ( = ?auto_26522 ?auto_26508 ) ) ( not ( = ?auto_26522 ?auto_26505 ) ) ( not ( = ?auto_26488 ?auto_26493 ) ) ( not ( = ?auto_26488 ?auto_26509 ) ) ( not ( = ?auto_26489 ?auto_26493 ) ) ( not ( = ?auto_26489 ?auto_26509 ) ) ( not ( = ?auto_26490 ?auto_26493 ) ) ( not ( = ?auto_26490 ?auto_26509 ) ) ( not ( = ?auto_26491 ?auto_26493 ) ) ( not ( = ?auto_26491 ?auto_26509 ) ) ( not ( = ?auto_26493 ?auto_26522 ) ) ( not ( = ?auto_26493 ?auto_26519 ) ) ( not ( = ?auto_26493 ?auto_26508 ) ) ( not ( = ?auto_26493 ?auto_26505 ) ) ( not ( = ?auto_26506 ?auto_26513 ) ) ( not ( = ?auto_26506 ?auto_26500 ) ) ( not ( = ?auto_26506 ?auto_26514 ) ) ( not ( = ?auto_26506 ?auto_26518 ) ) ( not ( = ?auto_26511 ?auto_26523 ) ) ( not ( = ?auto_26511 ?auto_26502 ) ) ( not ( = ?auto_26511 ?auto_26516 ) ) ( not ( = ?auto_26511 ?auto_26507 ) ) ( not ( = ?auto_26509 ?auto_26522 ) ) ( not ( = ?auto_26509 ?auto_26519 ) ) ( not ( = ?auto_26509 ?auto_26508 ) ) ( not ( = ?auto_26509 ?auto_26505 ) ) ( not ( = ?auto_26488 ?auto_26496 ) ) ( not ( = ?auto_26488 ?auto_26521 ) ) ( not ( = ?auto_26489 ?auto_26496 ) ) ( not ( = ?auto_26489 ?auto_26521 ) ) ( not ( = ?auto_26490 ?auto_26496 ) ) ( not ( = ?auto_26490 ?auto_26521 ) ) ( not ( = ?auto_26491 ?auto_26496 ) ) ( not ( = ?auto_26491 ?auto_26521 ) ) ( not ( = ?auto_26492 ?auto_26496 ) ) ( not ( = ?auto_26492 ?auto_26521 ) ) ( not ( = ?auto_26496 ?auto_26509 ) ) ( not ( = ?auto_26496 ?auto_26522 ) ) ( not ( = ?auto_26496 ?auto_26519 ) ) ( not ( = ?auto_26496 ?auto_26508 ) ) ( not ( = ?auto_26496 ?auto_26505 ) ) ( not ( = ?auto_26504 ?auto_26506 ) ) ( not ( = ?auto_26504 ?auto_26513 ) ) ( not ( = ?auto_26504 ?auto_26500 ) ) ( not ( = ?auto_26504 ?auto_26514 ) ) ( not ( = ?auto_26504 ?auto_26518 ) ) ( not ( = ?auto_26517 ?auto_26511 ) ) ( not ( = ?auto_26517 ?auto_26523 ) ) ( not ( = ?auto_26517 ?auto_26502 ) ) ( not ( = ?auto_26517 ?auto_26516 ) ) ( not ( = ?auto_26517 ?auto_26507 ) ) ( not ( = ?auto_26521 ?auto_26509 ) ) ( not ( = ?auto_26521 ?auto_26522 ) ) ( not ( = ?auto_26521 ?auto_26519 ) ) ( not ( = ?auto_26521 ?auto_26508 ) ) ( not ( = ?auto_26521 ?auto_26505 ) ) ( not ( = ?auto_26488 ?auto_26495 ) ) ( not ( = ?auto_26488 ?auto_26520 ) ) ( not ( = ?auto_26489 ?auto_26495 ) ) ( not ( = ?auto_26489 ?auto_26520 ) ) ( not ( = ?auto_26490 ?auto_26495 ) ) ( not ( = ?auto_26490 ?auto_26520 ) ) ( not ( = ?auto_26491 ?auto_26495 ) ) ( not ( = ?auto_26491 ?auto_26520 ) ) ( not ( = ?auto_26492 ?auto_26495 ) ) ( not ( = ?auto_26492 ?auto_26520 ) ) ( not ( = ?auto_26493 ?auto_26495 ) ) ( not ( = ?auto_26493 ?auto_26520 ) ) ( not ( = ?auto_26495 ?auto_26521 ) ) ( not ( = ?auto_26495 ?auto_26509 ) ) ( not ( = ?auto_26495 ?auto_26522 ) ) ( not ( = ?auto_26495 ?auto_26519 ) ) ( not ( = ?auto_26495 ?auto_26508 ) ) ( not ( = ?auto_26495 ?auto_26505 ) ) ( not ( = ?auto_26510 ?auto_26504 ) ) ( not ( = ?auto_26510 ?auto_26506 ) ) ( not ( = ?auto_26510 ?auto_26513 ) ) ( not ( = ?auto_26510 ?auto_26500 ) ) ( not ( = ?auto_26510 ?auto_26514 ) ) ( not ( = ?auto_26510 ?auto_26518 ) ) ( not ( = ?auto_26512 ?auto_26517 ) ) ( not ( = ?auto_26512 ?auto_26511 ) ) ( not ( = ?auto_26512 ?auto_26523 ) ) ( not ( = ?auto_26512 ?auto_26502 ) ) ( not ( = ?auto_26512 ?auto_26516 ) ) ( not ( = ?auto_26512 ?auto_26507 ) ) ( not ( = ?auto_26520 ?auto_26521 ) ) ( not ( = ?auto_26520 ?auto_26509 ) ) ( not ( = ?auto_26520 ?auto_26522 ) ) ( not ( = ?auto_26520 ?auto_26519 ) ) ( not ( = ?auto_26520 ?auto_26508 ) ) ( not ( = ?auto_26520 ?auto_26505 ) ) ( not ( = ?auto_26488 ?auto_26494 ) ) ( not ( = ?auto_26488 ?auto_26515 ) ) ( not ( = ?auto_26489 ?auto_26494 ) ) ( not ( = ?auto_26489 ?auto_26515 ) ) ( not ( = ?auto_26490 ?auto_26494 ) ) ( not ( = ?auto_26490 ?auto_26515 ) ) ( not ( = ?auto_26491 ?auto_26494 ) ) ( not ( = ?auto_26491 ?auto_26515 ) ) ( not ( = ?auto_26492 ?auto_26494 ) ) ( not ( = ?auto_26492 ?auto_26515 ) ) ( not ( = ?auto_26493 ?auto_26494 ) ) ( not ( = ?auto_26493 ?auto_26515 ) ) ( not ( = ?auto_26496 ?auto_26494 ) ) ( not ( = ?auto_26496 ?auto_26515 ) ) ( not ( = ?auto_26494 ?auto_26520 ) ) ( not ( = ?auto_26494 ?auto_26521 ) ) ( not ( = ?auto_26494 ?auto_26509 ) ) ( not ( = ?auto_26494 ?auto_26522 ) ) ( not ( = ?auto_26494 ?auto_26519 ) ) ( not ( = ?auto_26494 ?auto_26508 ) ) ( not ( = ?auto_26494 ?auto_26505 ) ) ( not ( = ?auto_26515 ?auto_26520 ) ) ( not ( = ?auto_26515 ?auto_26521 ) ) ( not ( = ?auto_26515 ?auto_26509 ) ) ( not ( = ?auto_26515 ?auto_26522 ) ) ( not ( = ?auto_26515 ?auto_26519 ) ) ( not ( = ?auto_26515 ?auto_26508 ) ) ( not ( = ?auto_26515 ?auto_26505 ) ) ( not ( = ?auto_26488 ?auto_26497 ) ) ( not ( = ?auto_26488 ?auto_26501 ) ) ( not ( = ?auto_26489 ?auto_26497 ) ) ( not ( = ?auto_26489 ?auto_26501 ) ) ( not ( = ?auto_26490 ?auto_26497 ) ) ( not ( = ?auto_26490 ?auto_26501 ) ) ( not ( = ?auto_26491 ?auto_26497 ) ) ( not ( = ?auto_26491 ?auto_26501 ) ) ( not ( = ?auto_26492 ?auto_26497 ) ) ( not ( = ?auto_26492 ?auto_26501 ) ) ( not ( = ?auto_26493 ?auto_26497 ) ) ( not ( = ?auto_26493 ?auto_26501 ) ) ( not ( = ?auto_26496 ?auto_26497 ) ) ( not ( = ?auto_26496 ?auto_26501 ) ) ( not ( = ?auto_26495 ?auto_26497 ) ) ( not ( = ?auto_26495 ?auto_26501 ) ) ( not ( = ?auto_26497 ?auto_26515 ) ) ( not ( = ?auto_26497 ?auto_26520 ) ) ( not ( = ?auto_26497 ?auto_26521 ) ) ( not ( = ?auto_26497 ?auto_26509 ) ) ( not ( = ?auto_26497 ?auto_26522 ) ) ( not ( = ?auto_26497 ?auto_26519 ) ) ( not ( = ?auto_26497 ?auto_26508 ) ) ( not ( = ?auto_26497 ?auto_26505 ) ) ( not ( = ?auto_26501 ?auto_26515 ) ) ( not ( = ?auto_26501 ?auto_26520 ) ) ( not ( = ?auto_26501 ?auto_26521 ) ) ( not ( = ?auto_26501 ?auto_26509 ) ) ( not ( = ?auto_26501 ?auto_26522 ) ) ( not ( = ?auto_26501 ?auto_26519 ) ) ( not ( = ?auto_26501 ?auto_26508 ) ) ( not ( = ?auto_26501 ?auto_26505 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_26488 ?auto_26489 ?auto_26490 ?auto_26491 ?auto_26492 ?auto_26493 ?auto_26496 ?auto_26495 ?auto_26494 )
      ( MAKE-1CRATE ?auto_26494 ?auto_26497 )
      ( MAKE-9CRATE-VERIFY ?auto_26488 ?auto_26489 ?auto_26490 ?auto_26491 ?auto_26492 ?auto_26493 ?auto_26496 ?auto_26495 ?auto_26494 ?auto_26497 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26526 - SURFACE
      ?auto_26527 - SURFACE
    )
    :vars
    (
      ?auto_26528 - HOIST
      ?auto_26529 - PLACE
      ?auto_26531 - PLACE
      ?auto_26532 - HOIST
      ?auto_26533 - SURFACE
      ?auto_26530 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26528 ?auto_26529 ) ( SURFACE-AT ?auto_26526 ?auto_26529 ) ( CLEAR ?auto_26526 ) ( IS-CRATE ?auto_26527 ) ( AVAILABLE ?auto_26528 ) ( not ( = ?auto_26531 ?auto_26529 ) ) ( HOIST-AT ?auto_26532 ?auto_26531 ) ( AVAILABLE ?auto_26532 ) ( SURFACE-AT ?auto_26527 ?auto_26531 ) ( ON ?auto_26527 ?auto_26533 ) ( CLEAR ?auto_26527 ) ( TRUCK-AT ?auto_26530 ?auto_26529 ) ( not ( = ?auto_26526 ?auto_26527 ) ) ( not ( = ?auto_26526 ?auto_26533 ) ) ( not ( = ?auto_26527 ?auto_26533 ) ) ( not ( = ?auto_26528 ?auto_26532 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26530 ?auto_26529 ?auto_26531 )
      ( !LIFT ?auto_26532 ?auto_26527 ?auto_26533 ?auto_26531 )
      ( !LOAD ?auto_26532 ?auto_26527 ?auto_26530 ?auto_26531 )
      ( !DRIVE ?auto_26530 ?auto_26531 ?auto_26529 )
      ( !UNLOAD ?auto_26528 ?auto_26527 ?auto_26530 ?auto_26529 )
      ( !DROP ?auto_26528 ?auto_26527 ?auto_26526 ?auto_26529 )
      ( MAKE-1CRATE-VERIFY ?auto_26526 ?auto_26527 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_26545 - SURFACE
      ?auto_26546 - SURFACE
      ?auto_26547 - SURFACE
      ?auto_26548 - SURFACE
      ?auto_26549 - SURFACE
      ?auto_26550 - SURFACE
      ?auto_26553 - SURFACE
      ?auto_26552 - SURFACE
      ?auto_26551 - SURFACE
      ?auto_26554 - SURFACE
      ?auto_26555 - SURFACE
    )
    :vars
    (
      ?auto_26557 - HOIST
      ?auto_26560 - PLACE
      ?auto_26559 - PLACE
      ?auto_26558 - HOIST
      ?auto_26561 - SURFACE
      ?auto_26572 - PLACE
      ?auto_26570 - HOIST
      ?auto_26571 - SURFACE
      ?auto_26566 - PLACE
      ?auto_26576 - HOIST
      ?auto_26562 - SURFACE
      ?auto_26581 - PLACE
      ?auto_26579 - HOIST
      ?auto_26564 - SURFACE
      ?auto_26575 - PLACE
      ?auto_26578 - HOIST
      ?auto_26573 - SURFACE
      ?auto_26565 - PLACE
      ?auto_26577 - HOIST
      ?auto_26582 - SURFACE
      ?auto_26563 - PLACE
      ?auto_26567 - HOIST
      ?auto_26584 - SURFACE
      ?auto_26568 - SURFACE
      ?auto_26583 - SURFACE
      ?auto_26574 - PLACE
      ?auto_26569 - HOIST
      ?auto_26580 - SURFACE
      ?auto_26556 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26557 ?auto_26560 ) ( IS-CRATE ?auto_26555 ) ( not ( = ?auto_26559 ?auto_26560 ) ) ( HOIST-AT ?auto_26558 ?auto_26559 ) ( AVAILABLE ?auto_26558 ) ( SURFACE-AT ?auto_26555 ?auto_26559 ) ( ON ?auto_26555 ?auto_26561 ) ( CLEAR ?auto_26555 ) ( not ( = ?auto_26554 ?auto_26555 ) ) ( not ( = ?auto_26554 ?auto_26561 ) ) ( not ( = ?auto_26555 ?auto_26561 ) ) ( not ( = ?auto_26557 ?auto_26558 ) ) ( IS-CRATE ?auto_26554 ) ( not ( = ?auto_26572 ?auto_26560 ) ) ( HOIST-AT ?auto_26570 ?auto_26572 ) ( SURFACE-AT ?auto_26554 ?auto_26572 ) ( ON ?auto_26554 ?auto_26571 ) ( CLEAR ?auto_26554 ) ( not ( = ?auto_26551 ?auto_26554 ) ) ( not ( = ?auto_26551 ?auto_26571 ) ) ( not ( = ?auto_26554 ?auto_26571 ) ) ( not ( = ?auto_26557 ?auto_26570 ) ) ( IS-CRATE ?auto_26551 ) ( not ( = ?auto_26566 ?auto_26560 ) ) ( HOIST-AT ?auto_26576 ?auto_26566 ) ( SURFACE-AT ?auto_26551 ?auto_26566 ) ( ON ?auto_26551 ?auto_26562 ) ( CLEAR ?auto_26551 ) ( not ( = ?auto_26552 ?auto_26551 ) ) ( not ( = ?auto_26552 ?auto_26562 ) ) ( not ( = ?auto_26551 ?auto_26562 ) ) ( not ( = ?auto_26557 ?auto_26576 ) ) ( IS-CRATE ?auto_26552 ) ( not ( = ?auto_26581 ?auto_26560 ) ) ( HOIST-AT ?auto_26579 ?auto_26581 ) ( AVAILABLE ?auto_26579 ) ( SURFACE-AT ?auto_26552 ?auto_26581 ) ( ON ?auto_26552 ?auto_26564 ) ( CLEAR ?auto_26552 ) ( not ( = ?auto_26553 ?auto_26552 ) ) ( not ( = ?auto_26553 ?auto_26564 ) ) ( not ( = ?auto_26552 ?auto_26564 ) ) ( not ( = ?auto_26557 ?auto_26579 ) ) ( IS-CRATE ?auto_26553 ) ( not ( = ?auto_26575 ?auto_26560 ) ) ( HOIST-AT ?auto_26578 ?auto_26575 ) ( AVAILABLE ?auto_26578 ) ( SURFACE-AT ?auto_26553 ?auto_26575 ) ( ON ?auto_26553 ?auto_26573 ) ( CLEAR ?auto_26553 ) ( not ( = ?auto_26550 ?auto_26553 ) ) ( not ( = ?auto_26550 ?auto_26573 ) ) ( not ( = ?auto_26553 ?auto_26573 ) ) ( not ( = ?auto_26557 ?auto_26578 ) ) ( IS-CRATE ?auto_26550 ) ( not ( = ?auto_26565 ?auto_26560 ) ) ( HOIST-AT ?auto_26577 ?auto_26565 ) ( AVAILABLE ?auto_26577 ) ( SURFACE-AT ?auto_26550 ?auto_26565 ) ( ON ?auto_26550 ?auto_26582 ) ( CLEAR ?auto_26550 ) ( not ( = ?auto_26549 ?auto_26550 ) ) ( not ( = ?auto_26549 ?auto_26582 ) ) ( not ( = ?auto_26550 ?auto_26582 ) ) ( not ( = ?auto_26557 ?auto_26577 ) ) ( IS-CRATE ?auto_26549 ) ( not ( = ?auto_26563 ?auto_26560 ) ) ( HOIST-AT ?auto_26567 ?auto_26563 ) ( AVAILABLE ?auto_26567 ) ( SURFACE-AT ?auto_26549 ?auto_26563 ) ( ON ?auto_26549 ?auto_26584 ) ( CLEAR ?auto_26549 ) ( not ( = ?auto_26548 ?auto_26549 ) ) ( not ( = ?auto_26548 ?auto_26584 ) ) ( not ( = ?auto_26549 ?auto_26584 ) ) ( not ( = ?auto_26557 ?auto_26567 ) ) ( IS-CRATE ?auto_26548 ) ( AVAILABLE ?auto_26570 ) ( SURFACE-AT ?auto_26548 ?auto_26572 ) ( ON ?auto_26548 ?auto_26568 ) ( CLEAR ?auto_26548 ) ( not ( = ?auto_26547 ?auto_26548 ) ) ( not ( = ?auto_26547 ?auto_26568 ) ) ( not ( = ?auto_26548 ?auto_26568 ) ) ( IS-CRATE ?auto_26547 ) ( AVAILABLE ?auto_26576 ) ( SURFACE-AT ?auto_26547 ?auto_26566 ) ( ON ?auto_26547 ?auto_26583 ) ( CLEAR ?auto_26547 ) ( not ( = ?auto_26546 ?auto_26547 ) ) ( not ( = ?auto_26546 ?auto_26583 ) ) ( not ( = ?auto_26547 ?auto_26583 ) ) ( SURFACE-AT ?auto_26545 ?auto_26560 ) ( CLEAR ?auto_26545 ) ( IS-CRATE ?auto_26546 ) ( AVAILABLE ?auto_26557 ) ( not ( = ?auto_26574 ?auto_26560 ) ) ( HOIST-AT ?auto_26569 ?auto_26574 ) ( AVAILABLE ?auto_26569 ) ( SURFACE-AT ?auto_26546 ?auto_26574 ) ( ON ?auto_26546 ?auto_26580 ) ( CLEAR ?auto_26546 ) ( TRUCK-AT ?auto_26556 ?auto_26560 ) ( not ( = ?auto_26545 ?auto_26546 ) ) ( not ( = ?auto_26545 ?auto_26580 ) ) ( not ( = ?auto_26546 ?auto_26580 ) ) ( not ( = ?auto_26557 ?auto_26569 ) ) ( not ( = ?auto_26545 ?auto_26547 ) ) ( not ( = ?auto_26545 ?auto_26583 ) ) ( not ( = ?auto_26547 ?auto_26580 ) ) ( not ( = ?auto_26566 ?auto_26574 ) ) ( not ( = ?auto_26576 ?auto_26569 ) ) ( not ( = ?auto_26583 ?auto_26580 ) ) ( not ( = ?auto_26545 ?auto_26548 ) ) ( not ( = ?auto_26545 ?auto_26568 ) ) ( not ( = ?auto_26546 ?auto_26548 ) ) ( not ( = ?auto_26546 ?auto_26568 ) ) ( not ( = ?auto_26548 ?auto_26583 ) ) ( not ( = ?auto_26548 ?auto_26580 ) ) ( not ( = ?auto_26572 ?auto_26566 ) ) ( not ( = ?auto_26572 ?auto_26574 ) ) ( not ( = ?auto_26570 ?auto_26576 ) ) ( not ( = ?auto_26570 ?auto_26569 ) ) ( not ( = ?auto_26568 ?auto_26583 ) ) ( not ( = ?auto_26568 ?auto_26580 ) ) ( not ( = ?auto_26545 ?auto_26549 ) ) ( not ( = ?auto_26545 ?auto_26584 ) ) ( not ( = ?auto_26546 ?auto_26549 ) ) ( not ( = ?auto_26546 ?auto_26584 ) ) ( not ( = ?auto_26547 ?auto_26549 ) ) ( not ( = ?auto_26547 ?auto_26584 ) ) ( not ( = ?auto_26549 ?auto_26568 ) ) ( not ( = ?auto_26549 ?auto_26583 ) ) ( not ( = ?auto_26549 ?auto_26580 ) ) ( not ( = ?auto_26563 ?auto_26572 ) ) ( not ( = ?auto_26563 ?auto_26566 ) ) ( not ( = ?auto_26563 ?auto_26574 ) ) ( not ( = ?auto_26567 ?auto_26570 ) ) ( not ( = ?auto_26567 ?auto_26576 ) ) ( not ( = ?auto_26567 ?auto_26569 ) ) ( not ( = ?auto_26584 ?auto_26568 ) ) ( not ( = ?auto_26584 ?auto_26583 ) ) ( not ( = ?auto_26584 ?auto_26580 ) ) ( not ( = ?auto_26545 ?auto_26550 ) ) ( not ( = ?auto_26545 ?auto_26582 ) ) ( not ( = ?auto_26546 ?auto_26550 ) ) ( not ( = ?auto_26546 ?auto_26582 ) ) ( not ( = ?auto_26547 ?auto_26550 ) ) ( not ( = ?auto_26547 ?auto_26582 ) ) ( not ( = ?auto_26548 ?auto_26550 ) ) ( not ( = ?auto_26548 ?auto_26582 ) ) ( not ( = ?auto_26550 ?auto_26584 ) ) ( not ( = ?auto_26550 ?auto_26568 ) ) ( not ( = ?auto_26550 ?auto_26583 ) ) ( not ( = ?auto_26550 ?auto_26580 ) ) ( not ( = ?auto_26565 ?auto_26563 ) ) ( not ( = ?auto_26565 ?auto_26572 ) ) ( not ( = ?auto_26565 ?auto_26566 ) ) ( not ( = ?auto_26565 ?auto_26574 ) ) ( not ( = ?auto_26577 ?auto_26567 ) ) ( not ( = ?auto_26577 ?auto_26570 ) ) ( not ( = ?auto_26577 ?auto_26576 ) ) ( not ( = ?auto_26577 ?auto_26569 ) ) ( not ( = ?auto_26582 ?auto_26584 ) ) ( not ( = ?auto_26582 ?auto_26568 ) ) ( not ( = ?auto_26582 ?auto_26583 ) ) ( not ( = ?auto_26582 ?auto_26580 ) ) ( not ( = ?auto_26545 ?auto_26553 ) ) ( not ( = ?auto_26545 ?auto_26573 ) ) ( not ( = ?auto_26546 ?auto_26553 ) ) ( not ( = ?auto_26546 ?auto_26573 ) ) ( not ( = ?auto_26547 ?auto_26553 ) ) ( not ( = ?auto_26547 ?auto_26573 ) ) ( not ( = ?auto_26548 ?auto_26553 ) ) ( not ( = ?auto_26548 ?auto_26573 ) ) ( not ( = ?auto_26549 ?auto_26553 ) ) ( not ( = ?auto_26549 ?auto_26573 ) ) ( not ( = ?auto_26553 ?auto_26582 ) ) ( not ( = ?auto_26553 ?auto_26584 ) ) ( not ( = ?auto_26553 ?auto_26568 ) ) ( not ( = ?auto_26553 ?auto_26583 ) ) ( not ( = ?auto_26553 ?auto_26580 ) ) ( not ( = ?auto_26575 ?auto_26565 ) ) ( not ( = ?auto_26575 ?auto_26563 ) ) ( not ( = ?auto_26575 ?auto_26572 ) ) ( not ( = ?auto_26575 ?auto_26566 ) ) ( not ( = ?auto_26575 ?auto_26574 ) ) ( not ( = ?auto_26578 ?auto_26577 ) ) ( not ( = ?auto_26578 ?auto_26567 ) ) ( not ( = ?auto_26578 ?auto_26570 ) ) ( not ( = ?auto_26578 ?auto_26576 ) ) ( not ( = ?auto_26578 ?auto_26569 ) ) ( not ( = ?auto_26573 ?auto_26582 ) ) ( not ( = ?auto_26573 ?auto_26584 ) ) ( not ( = ?auto_26573 ?auto_26568 ) ) ( not ( = ?auto_26573 ?auto_26583 ) ) ( not ( = ?auto_26573 ?auto_26580 ) ) ( not ( = ?auto_26545 ?auto_26552 ) ) ( not ( = ?auto_26545 ?auto_26564 ) ) ( not ( = ?auto_26546 ?auto_26552 ) ) ( not ( = ?auto_26546 ?auto_26564 ) ) ( not ( = ?auto_26547 ?auto_26552 ) ) ( not ( = ?auto_26547 ?auto_26564 ) ) ( not ( = ?auto_26548 ?auto_26552 ) ) ( not ( = ?auto_26548 ?auto_26564 ) ) ( not ( = ?auto_26549 ?auto_26552 ) ) ( not ( = ?auto_26549 ?auto_26564 ) ) ( not ( = ?auto_26550 ?auto_26552 ) ) ( not ( = ?auto_26550 ?auto_26564 ) ) ( not ( = ?auto_26552 ?auto_26573 ) ) ( not ( = ?auto_26552 ?auto_26582 ) ) ( not ( = ?auto_26552 ?auto_26584 ) ) ( not ( = ?auto_26552 ?auto_26568 ) ) ( not ( = ?auto_26552 ?auto_26583 ) ) ( not ( = ?auto_26552 ?auto_26580 ) ) ( not ( = ?auto_26581 ?auto_26575 ) ) ( not ( = ?auto_26581 ?auto_26565 ) ) ( not ( = ?auto_26581 ?auto_26563 ) ) ( not ( = ?auto_26581 ?auto_26572 ) ) ( not ( = ?auto_26581 ?auto_26566 ) ) ( not ( = ?auto_26581 ?auto_26574 ) ) ( not ( = ?auto_26579 ?auto_26578 ) ) ( not ( = ?auto_26579 ?auto_26577 ) ) ( not ( = ?auto_26579 ?auto_26567 ) ) ( not ( = ?auto_26579 ?auto_26570 ) ) ( not ( = ?auto_26579 ?auto_26576 ) ) ( not ( = ?auto_26579 ?auto_26569 ) ) ( not ( = ?auto_26564 ?auto_26573 ) ) ( not ( = ?auto_26564 ?auto_26582 ) ) ( not ( = ?auto_26564 ?auto_26584 ) ) ( not ( = ?auto_26564 ?auto_26568 ) ) ( not ( = ?auto_26564 ?auto_26583 ) ) ( not ( = ?auto_26564 ?auto_26580 ) ) ( not ( = ?auto_26545 ?auto_26551 ) ) ( not ( = ?auto_26545 ?auto_26562 ) ) ( not ( = ?auto_26546 ?auto_26551 ) ) ( not ( = ?auto_26546 ?auto_26562 ) ) ( not ( = ?auto_26547 ?auto_26551 ) ) ( not ( = ?auto_26547 ?auto_26562 ) ) ( not ( = ?auto_26548 ?auto_26551 ) ) ( not ( = ?auto_26548 ?auto_26562 ) ) ( not ( = ?auto_26549 ?auto_26551 ) ) ( not ( = ?auto_26549 ?auto_26562 ) ) ( not ( = ?auto_26550 ?auto_26551 ) ) ( not ( = ?auto_26550 ?auto_26562 ) ) ( not ( = ?auto_26553 ?auto_26551 ) ) ( not ( = ?auto_26553 ?auto_26562 ) ) ( not ( = ?auto_26551 ?auto_26564 ) ) ( not ( = ?auto_26551 ?auto_26573 ) ) ( not ( = ?auto_26551 ?auto_26582 ) ) ( not ( = ?auto_26551 ?auto_26584 ) ) ( not ( = ?auto_26551 ?auto_26568 ) ) ( not ( = ?auto_26551 ?auto_26583 ) ) ( not ( = ?auto_26551 ?auto_26580 ) ) ( not ( = ?auto_26562 ?auto_26564 ) ) ( not ( = ?auto_26562 ?auto_26573 ) ) ( not ( = ?auto_26562 ?auto_26582 ) ) ( not ( = ?auto_26562 ?auto_26584 ) ) ( not ( = ?auto_26562 ?auto_26568 ) ) ( not ( = ?auto_26562 ?auto_26583 ) ) ( not ( = ?auto_26562 ?auto_26580 ) ) ( not ( = ?auto_26545 ?auto_26554 ) ) ( not ( = ?auto_26545 ?auto_26571 ) ) ( not ( = ?auto_26546 ?auto_26554 ) ) ( not ( = ?auto_26546 ?auto_26571 ) ) ( not ( = ?auto_26547 ?auto_26554 ) ) ( not ( = ?auto_26547 ?auto_26571 ) ) ( not ( = ?auto_26548 ?auto_26554 ) ) ( not ( = ?auto_26548 ?auto_26571 ) ) ( not ( = ?auto_26549 ?auto_26554 ) ) ( not ( = ?auto_26549 ?auto_26571 ) ) ( not ( = ?auto_26550 ?auto_26554 ) ) ( not ( = ?auto_26550 ?auto_26571 ) ) ( not ( = ?auto_26553 ?auto_26554 ) ) ( not ( = ?auto_26553 ?auto_26571 ) ) ( not ( = ?auto_26552 ?auto_26554 ) ) ( not ( = ?auto_26552 ?auto_26571 ) ) ( not ( = ?auto_26554 ?auto_26562 ) ) ( not ( = ?auto_26554 ?auto_26564 ) ) ( not ( = ?auto_26554 ?auto_26573 ) ) ( not ( = ?auto_26554 ?auto_26582 ) ) ( not ( = ?auto_26554 ?auto_26584 ) ) ( not ( = ?auto_26554 ?auto_26568 ) ) ( not ( = ?auto_26554 ?auto_26583 ) ) ( not ( = ?auto_26554 ?auto_26580 ) ) ( not ( = ?auto_26571 ?auto_26562 ) ) ( not ( = ?auto_26571 ?auto_26564 ) ) ( not ( = ?auto_26571 ?auto_26573 ) ) ( not ( = ?auto_26571 ?auto_26582 ) ) ( not ( = ?auto_26571 ?auto_26584 ) ) ( not ( = ?auto_26571 ?auto_26568 ) ) ( not ( = ?auto_26571 ?auto_26583 ) ) ( not ( = ?auto_26571 ?auto_26580 ) ) ( not ( = ?auto_26545 ?auto_26555 ) ) ( not ( = ?auto_26545 ?auto_26561 ) ) ( not ( = ?auto_26546 ?auto_26555 ) ) ( not ( = ?auto_26546 ?auto_26561 ) ) ( not ( = ?auto_26547 ?auto_26555 ) ) ( not ( = ?auto_26547 ?auto_26561 ) ) ( not ( = ?auto_26548 ?auto_26555 ) ) ( not ( = ?auto_26548 ?auto_26561 ) ) ( not ( = ?auto_26549 ?auto_26555 ) ) ( not ( = ?auto_26549 ?auto_26561 ) ) ( not ( = ?auto_26550 ?auto_26555 ) ) ( not ( = ?auto_26550 ?auto_26561 ) ) ( not ( = ?auto_26553 ?auto_26555 ) ) ( not ( = ?auto_26553 ?auto_26561 ) ) ( not ( = ?auto_26552 ?auto_26555 ) ) ( not ( = ?auto_26552 ?auto_26561 ) ) ( not ( = ?auto_26551 ?auto_26555 ) ) ( not ( = ?auto_26551 ?auto_26561 ) ) ( not ( = ?auto_26555 ?auto_26571 ) ) ( not ( = ?auto_26555 ?auto_26562 ) ) ( not ( = ?auto_26555 ?auto_26564 ) ) ( not ( = ?auto_26555 ?auto_26573 ) ) ( not ( = ?auto_26555 ?auto_26582 ) ) ( not ( = ?auto_26555 ?auto_26584 ) ) ( not ( = ?auto_26555 ?auto_26568 ) ) ( not ( = ?auto_26555 ?auto_26583 ) ) ( not ( = ?auto_26555 ?auto_26580 ) ) ( not ( = ?auto_26559 ?auto_26572 ) ) ( not ( = ?auto_26559 ?auto_26566 ) ) ( not ( = ?auto_26559 ?auto_26581 ) ) ( not ( = ?auto_26559 ?auto_26575 ) ) ( not ( = ?auto_26559 ?auto_26565 ) ) ( not ( = ?auto_26559 ?auto_26563 ) ) ( not ( = ?auto_26559 ?auto_26574 ) ) ( not ( = ?auto_26558 ?auto_26570 ) ) ( not ( = ?auto_26558 ?auto_26576 ) ) ( not ( = ?auto_26558 ?auto_26579 ) ) ( not ( = ?auto_26558 ?auto_26578 ) ) ( not ( = ?auto_26558 ?auto_26577 ) ) ( not ( = ?auto_26558 ?auto_26567 ) ) ( not ( = ?auto_26558 ?auto_26569 ) ) ( not ( = ?auto_26561 ?auto_26571 ) ) ( not ( = ?auto_26561 ?auto_26562 ) ) ( not ( = ?auto_26561 ?auto_26564 ) ) ( not ( = ?auto_26561 ?auto_26573 ) ) ( not ( = ?auto_26561 ?auto_26582 ) ) ( not ( = ?auto_26561 ?auto_26584 ) ) ( not ( = ?auto_26561 ?auto_26568 ) ) ( not ( = ?auto_26561 ?auto_26583 ) ) ( not ( = ?auto_26561 ?auto_26580 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_26545 ?auto_26546 ?auto_26547 ?auto_26548 ?auto_26549 ?auto_26550 ?auto_26553 ?auto_26552 ?auto_26551 ?auto_26554 )
      ( MAKE-1CRATE ?auto_26554 ?auto_26555 )
      ( MAKE-10CRATE-VERIFY ?auto_26545 ?auto_26546 ?auto_26547 ?auto_26548 ?auto_26549 ?auto_26550 ?auto_26553 ?auto_26552 ?auto_26551 ?auto_26554 ?auto_26555 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26587 - SURFACE
      ?auto_26588 - SURFACE
    )
    :vars
    (
      ?auto_26589 - HOIST
      ?auto_26590 - PLACE
      ?auto_26592 - PLACE
      ?auto_26593 - HOIST
      ?auto_26594 - SURFACE
      ?auto_26591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26589 ?auto_26590 ) ( SURFACE-AT ?auto_26587 ?auto_26590 ) ( CLEAR ?auto_26587 ) ( IS-CRATE ?auto_26588 ) ( AVAILABLE ?auto_26589 ) ( not ( = ?auto_26592 ?auto_26590 ) ) ( HOIST-AT ?auto_26593 ?auto_26592 ) ( AVAILABLE ?auto_26593 ) ( SURFACE-AT ?auto_26588 ?auto_26592 ) ( ON ?auto_26588 ?auto_26594 ) ( CLEAR ?auto_26588 ) ( TRUCK-AT ?auto_26591 ?auto_26590 ) ( not ( = ?auto_26587 ?auto_26588 ) ) ( not ( = ?auto_26587 ?auto_26594 ) ) ( not ( = ?auto_26588 ?auto_26594 ) ) ( not ( = ?auto_26589 ?auto_26593 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26591 ?auto_26590 ?auto_26592 )
      ( !LIFT ?auto_26593 ?auto_26588 ?auto_26594 ?auto_26592 )
      ( !LOAD ?auto_26593 ?auto_26588 ?auto_26591 ?auto_26592 )
      ( !DRIVE ?auto_26591 ?auto_26592 ?auto_26590 )
      ( !UNLOAD ?auto_26589 ?auto_26588 ?auto_26591 ?auto_26590 )
      ( !DROP ?auto_26589 ?auto_26588 ?auto_26587 ?auto_26590 )
      ( MAKE-1CRATE-VERIFY ?auto_26587 ?auto_26588 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_26607 - SURFACE
      ?auto_26608 - SURFACE
      ?auto_26609 - SURFACE
      ?auto_26610 - SURFACE
      ?auto_26611 - SURFACE
      ?auto_26612 - SURFACE
      ?auto_26615 - SURFACE
      ?auto_26614 - SURFACE
      ?auto_26613 - SURFACE
      ?auto_26616 - SURFACE
      ?auto_26618 - SURFACE
      ?auto_26617 - SURFACE
    )
    :vars
    (
      ?auto_26623 - HOIST
      ?auto_26621 - PLACE
      ?auto_26624 - PLACE
      ?auto_26622 - HOIST
      ?auto_26619 - SURFACE
      ?auto_26631 - PLACE
      ?auto_26629 - HOIST
      ?auto_26628 - SURFACE
      ?auto_26649 - PLACE
      ?auto_26637 - HOIST
      ?auto_26648 - SURFACE
      ?auto_26636 - PLACE
      ?auto_26647 - HOIST
      ?auto_26639 - SURFACE
      ?auto_26645 - PLACE
      ?auto_26635 - HOIST
      ?auto_26633 - SURFACE
      ?auto_26630 - PLACE
      ?auto_26632 - HOIST
      ?auto_26634 - SURFACE
      ?auto_26641 - PLACE
      ?auto_26627 - HOIST
      ?auto_26644 - SURFACE
      ?auto_26625 - PLACE
      ?auto_26638 - HOIST
      ?auto_26643 - SURFACE
      ?auto_26626 - SURFACE
      ?auto_26646 - SURFACE
      ?auto_26650 - PLACE
      ?auto_26642 - HOIST
      ?auto_26640 - SURFACE
      ?auto_26620 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26623 ?auto_26621 ) ( IS-CRATE ?auto_26617 ) ( not ( = ?auto_26624 ?auto_26621 ) ) ( HOIST-AT ?auto_26622 ?auto_26624 ) ( AVAILABLE ?auto_26622 ) ( SURFACE-AT ?auto_26617 ?auto_26624 ) ( ON ?auto_26617 ?auto_26619 ) ( CLEAR ?auto_26617 ) ( not ( = ?auto_26618 ?auto_26617 ) ) ( not ( = ?auto_26618 ?auto_26619 ) ) ( not ( = ?auto_26617 ?auto_26619 ) ) ( not ( = ?auto_26623 ?auto_26622 ) ) ( IS-CRATE ?auto_26618 ) ( not ( = ?auto_26631 ?auto_26621 ) ) ( HOIST-AT ?auto_26629 ?auto_26631 ) ( AVAILABLE ?auto_26629 ) ( SURFACE-AT ?auto_26618 ?auto_26631 ) ( ON ?auto_26618 ?auto_26628 ) ( CLEAR ?auto_26618 ) ( not ( = ?auto_26616 ?auto_26618 ) ) ( not ( = ?auto_26616 ?auto_26628 ) ) ( not ( = ?auto_26618 ?auto_26628 ) ) ( not ( = ?auto_26623 ?auto_26629 ) ) ( IS-CRATE ?auto_26616 ) ( not ( = ?auto_26649 ?auto_26621 ) ) ( HOIST-AT ?auto_26637 ?auto_26649 ) ( SURFACE-AT ?auto_26616 ?auto_26649 ) ( ON ?auto_26616 ?auto_26648 ) ( CLEAR ?auto_26616 ) ( not ( = ?auto_26613 ?auto_26616 ) ) ( not ( = ?auto_26613 ?auto_26648 ) ) ( not ( = ?auto_26616 ?auto_26648 ) ) ( not ( = ?auto_26623 ?auto_26637 ) ) ( IS-CRATE ?auto_26613 ) ( not ( = ?auto_26636 ?auto_26621 ) ) ( HOIST-AT ?auto_26647 ?auto_26636 ) ( SURFACE-AT ?auto_26613 ?auto_26636 ) ( ON ?auto_26613 ?auto_26639 ) ( CLEAR ?auto_26613 ) ( not ( = ?auto_26614 ?auto_26613 ) ) ( not ( = ?auto_26614 ?auto_26639 ) ) ( not ( = ?auto_26613 ?auto_26639 ) ) ( not ( = ?auto_26623 ?auto_26647 ) ) ( IS-CRATE ?auto_26614 ) ( not ( = ?auto_26645 ?auto_26621 ) ) ( HOIST-AT ?auto_26635 ?auto_26645 ) ( AVAILABLE ?auto_26635 ) ( SURFACE-AT ?auto_26614 ?auto_26645 ) ( ON ?auto_26614 ?auto_26633 ) ( CLEAR ?auto_26614 ) ( not ( = ?auto_26615 ?auto_26614 ) ) ( not ( = ?auto_26615 ?auto_26633 ) ) ( not ( = ?auto_26614 ?auto_26633 ) ) ( not ( = ?auto_26623 ?auto_26635 ) ) ( IS-CRATE ?auto_26615 ) ( not ( = ?auto_26630 ?auto_26621 ) ) ( HOIST-AT ?auto_26632 ?auto_26630 ) ( AVAILABLE ?auto_26632 ) ( SURFACE-AT ?auto_26615 ?auto_26630 ) ( ON ?auto_26615 ?auto_26634 ) ( CLEAR ?auto_26615 ) ( not ( = ?auto_26612 ?auto_26615 ) ) ( not ( = ?auto_26612 ?auto_26634 ) ) ( not ( = ?auto_26615 ?auto_26634 ) ) ( not ( = ?auto_26623 ?auto_26632 ) ) ( IS-CRATE ?auto_26612 ) ( not ( = ?auto_26641 ?auto_26621 ) ) ( HOIST-AT ?auto_26627 ?auto_26641 ) ( AVAILABLE ?auto_26627 ) ( SURFACE-AT ?auto_26612 ?auto_26641 ) ( ON ?auto_26612 ?auto_26644 ) ( CLEAR ?auto_26612 ) ( not ( = ?auto_26611 ?auto_26612 ) ) ( not ( = ?auto_26611 ?auto_26644 ) ) ( not ( = ?auto_26612 ?auto_26644 ) ) ( not ( = ?auto_26623 ?auto_26627 ) ) ( IS-CRATE ?auto_26611 ) ( not ( = ?auto_26625 ?auto_26621 ) ) ( HOIST-AT ?auto_26638 ?auto_26625 ) ( AVAILABLE ?auto_26638 ) ( SURFACE-AT ?auto_26611 ?auto_26625 ) ( ON ?auto_26611 ?auto_26643 ) ( CLEAR ?auto_26611 ) ( not ( = ?auto_26610 ?auto_26611 ) ) ( not ( = ?auto_26610 ?auto_26643 ) ) ( not ( = ?auto_26611 ?auto_26643 ) ) ( not ( = ?auto_26623 ?auto_26638 ) ) ( IS-CRATE ?auto_26610 ) ( AVAILABLE ?auto_26637 ) ( SURFACE-AT ?auto_26610 ?auto_26649 ) ( ON ?auto_26610 ?auto_26626 ) ( CLEAR ?auto_26610 ) ( not ( = ?auto_26609 ?auto_26610 ) ) ( not ( = ?auto_26609 ?auto_26626 ) ) ( not ( = ?auto_26610 ?auto_26626 ) ) ( IS-CRATE ?auto_26609 ) ( AVAILABLE ?auto_26647 ) ( SURFACE-AT ?auto_26609 ?auto_26636 ) ( ON ?auto_26609 ?auto_26646 ) ( CLEAR ?auto_26609 ) ( not ( = ?auto_26608 ?auto_26609 ) ) ( not ( = ?auto_26608 ?auto_26646 ) ) ( not ( = ?auto_26609 ?auto_26646 ) ) ( SURFACE-AT ?auto_26607 ?auto_26621 ) ( CLEAR ?auto_26607 ) ( IS-CRATE ?auto_26608 ) ( AVAILABLE ?auto_26623 ) ( not ( = ?auto_26650 ?auto_26621 ) ) ( HOIST-AT ?auto_26642 ?auto_26650 ) ( AVAILABLE ?auto_26642 ) ( SURFACE-AT ?auto_26608 ?auto_26650 ) ( ON ?auto_26608 ?auto_26640 ) ( CLEAR ?auto_26608 ) ( TRUCK-AT ?auto_26620 ?auto_26621 ) ( not ( = ?auto_26607 ?auto_26608 ) ) ( not ( = ?auto_26607 ?auto_26640 ) ) ( not ( = ?auto_26608 ?auto_26640 ) ) ( not ( = ?auto_26623 ?auto_26642 ) ) ( not ( = ?auto_26607 ?auto_26609 ) ) ( not ( = ?auto_26607 ?auto_26646 ) ) ( not ( = ?auto_26609 ?auto_26640 ) ) ( not ( = ?auto_26636 ?auto_26650 ) ) ( not ( = ?auto_26647 ?auto_26642 ) ) ( not ( = ?auto_26646 ?auto_26640 ) ) ( not ( = ?auto_26607 ?auto_26610 ) ) ( not ( = ?auto_26607 ?auto_26626 ) ) ( not ( = ?auto_26608 ?auto_26610 ) ) ( not ( = ?auto_26608 ?auto_26626 ) ) ( not ( = ?auto_26610 ?auto_26646 ) ) ( not ( = ?auto_26610 ?auto_26640 ) ) ( not ( = ?auto_26649 ?auto_26636 ) ) ( not ( = ?auto_26649 ?auto_26650 ) ) ( not ( = ?auto_26637 ?auto_26647 ) ) ( not ( = ?auto_26637 ?auto_26642 ) ) ( not ( = ?auto_26626 ?auto_26646 ) ) ( not ( = ?auto_26626 ?auto_26640 ) ) ( not ( = ?auto_26607 ?auto_26611 ) ) ( not ( = ?auto_26607 ?auto_26643 ) ) ( not ( = ?auto_26608 ?auto_26611 ) ) ( not ( = ?auto_26608 ?auto_26643 ) ) ( not ( = ?auto_26609 ?auto_26611 ) ) ( not ( = ?auto_26609 ?auto_26643 ) ) ( not ( = ?auto_26611 ?auto_26626 ) ) ( not ( = ?auto_26611 ?auto_26646 ) ) ( not ( = ?auto_26611 ?auto_26640 ) ) ( not ( = ?auto_26625 ?auto_26649 ) ) ( not ( = ?auto_26625 ?auto_26636 ) ) ( not ( = ?auto_26625 ?auto_26650 ) ) ( not ( = ?auto_26638 ?auto_26637 ) ) ( not ( = ?auto_26638 ?auto_26647 ) ) ( not ( = ?auto_26638 ?auto_26642 ) ) ( not ( = ?auto_26643 ?auto_26626 ) ) ( not ( = ?auto_26643 ?auto_26646 ) ) ( not ( = ?auto_26643 ?auto_26640 ) ) ( not ( = ?auto_26607 ?auto_26612 ) ) ( not ( = ?auto_26607 ?auto_26644 ) ) ( not ( = ?auto_26608 ?auto_26612 ) ) ( not ( = ?auto_26608 ?auto_26644 ) ) ( not ( = ?auto_26609 ?auto_26612 ) ) ( not ( = ?auto_26609 ?auto_26644 ) ) ( not ( = ?auto_26610 ?auto_26612 ) ) ( not ( = ?auto_26610 ?auto_26644 ) ) ( not ( = ?auto_26612 ?auto_26643 ) ) ( not ( = ?auto_26612 ?auto_26626 ) ) ( not ( = ?auto_26612 ?auto_26646 ) ) ( not ( = ?auto_26612 ?auto_26640 ) ) ( not ( = ?auto_26641 ?auto_26625 ) ) ( not ( = ?auto_26641 ?auto_26649 ) ) ( not ( = ?auto_26641 ?auto_26636 ) ) ( not ( = ?auto_26641 ?auto_26650 ) ) ( not ( = ?auto_26627 ?auto_26638 ) ) ( not ( = ?auto_26627 ?auto_26637 ) ) ( not ( = ?auto_26627 ?auto_26647 ) ) ( not ( = ?auto_26627 ?auto_26642 ) ) ( not ( = ?auto_26644 ?auto_26643 ) ) ( not ( = ?auto_26644 ?auto_26626 ) ) ( not ( = ?auto_26644 ?auto_26646 ) ) ( not ( = ?auto_26644 ?auto_26640 ) ) ( not ( = ?auto_26607 ?auto_26615 ) ) ( not ( = ?auto_26607 ?auto_26634 ) ) ( not ( = ?auto_26608 ?auto_26615 ) ) ( not ( = ?auto_26608 ?auto_26634 ) ) ( not ( = ?auto_26609 ?auto_26615 ) ) ( not ( = ?auto_26609 ?auto_26634 ) ) ( not ( = ?auto_26610 ?auto_26615 ) ) ( not ( = ?auto_26610 ?auto_26634 ) ) ( not ( = ?auto_26611 ?auto_26615 ) ) ( not ( = ?auto_26611 ?auto_26634 ) ) ( not ( = ?auto_26615 ?auto_26644 ) ) ( not ( = ?auto_26615 ?auto_26643 ) ) ( not ( = ?auto_26615 ?auto_26626 ) ) ( not ( = ?auto_26615 ?auto_26646 ) ) ( not ( = ?auto_26615 ?auto_26640 ) ) ( not ( = ?auto_26630 ?auto_26641 ) ) ( not ( = ?auto_26630 ?auto_26625 ) ) ( not ( = ?auto_26630 ?auto_26649 ) ) ( not ( = ?auto_26630 ?auto_26636 ) ) ( not ( = ?auto_26630 ?auto_26650 ) ) ( not ( = ?auto_26632 ?auto_26627 ) ) ( not ( = ?auto_26632 ?auto_26638 ) ) ( not ( = ?auto_26632 ?auto_26637 ) ) ( not ( = ?auto_26632 ?auto_26647 ) ) ( not ( = ?auto_26632 ?auto_26642 ) ) ( not ( = ?auto_26634 ?auto_26644 ) ) ( not ( = ?auto_26634 ?auto_26643 ) ) ( not ( = ?auto_26634 ?auto_26626 ) ) ( not ( = ?auto_26634 ?auto_26646 ) ) ( not ( = ?auto_26634 ?auto_26640 ) ) ( not ( = ?auto_26607 ?auto_26614 ) ) ( not ( = ?auto_26607 ?auto_26633 ) ) ( not ( = ?auto_26608 ?auto_26614 ) ) ( not ( = ?auto_26608 ?auto_26633 ) ) ( not ( = ?auto_26609 ?auto_26614 ) ) ( not ( = ?auto_26609 ?auto_26633 ) ) ( not ( = ?auto_26610 ?auto_26614 ) ) ( not ( = ?auto_26610 ?auto_26633 ) ) ( not ( = ?auto_26611 ?auto_26614 ) ) ( not ( = ?auto_26611 ?auto_26633 ) ) ( not ( = ?auto_26612 ?auto_26614 ) ) ( not ( = ?auto_26612 ?auto_26633 ) ) ( not ( = ?auto_26614 ?auto_26634 ) ) ( not ( = ?auto_26614 ?auto_26644 ) ) ( not ( = ?auto_26614 ?auto_26643 ) ) ( not ( = ?auto_26614 ?auto_26626 ) ) ( not ( = ?auto_26614 ?auto_26646 ) ) ( not ( = ?auto_26614 ?auto_26640 ) ) ( not ( = ?auto_26645 ?auto_26630 ) ) ( not ( = ?auto_26645 ?auto_26641 ) ) ( not ( = ?auto_26645 ?auto_26625 ) ) ( not ( = ?auto_26645 ?auto_26649 ) ) ( not ( = ?auto_26645 ?auto_26636 ) ) ( not ( = ?auto_26645 ?auto_26650 ) ) ( not ( = ?auto_26635 ?auto_26632 ) ) ( not ( = ?auto_26635 ?auto_26627 ) ) ( not ( = ?auto_26635 ?auto_26638 ) ) ( not ( = ?auto_26635 ?auto_26637 ) ) ( not ( = ?auto_26635 ?auto_26647 ) ) ( not ( = ?auto_26635 ?auto_26642 ) ) ( not ( = ?auto_26633 ?auto_26634 ) ) ( not ( = ?auto_26633 ?auto_26644 ) ) ( not ( = ?auto_26633 ?auto_26643 ) ) ( not ( = ?auto_26633 ?auto_26626 ) ) ( not ( = ?auto_26633 ?auto_26646 ) ) ( not ( = ?auto_26633 ?auto_26640 ) ) ( not ( = ?auto_26607 ?auto_26613 ) ) ( not ( = ?auto_26607 ?auto_26639 ) ) ( not ( = ?auto_26608 ?auto_26613 ) ) ( not ( = ?auto_26608 ?auto_26639 ) ) ( not ( = ?auto_26609 ?auto_26613 ) ) ( not ( = ?auto_26609 ?auto_26639 ) ) ( not ( = ?auto_26610 ?auto_26613 ) ) ( not ( = ?auto_26610 ?auto_26639 ) ) ( not ( = ?auto_26611 ?auto_26613 ) ) ( not ( = ?auto_26611 ?auto_26639 ) ) ( not ( = ?auto_26612 ?auto_26613 ) ) ( not ( = ?auto_26612 ?auto_26639 ) ) ( not ( = ?auto_26615 ?auto_26613 ) ) ( not ( = ?auto_26615 ?auto_26639 ) ) ( not ( = ?auto_26613 ?auto_26633 ) ) ( not ( = ?auto_26613 ?auto_26634 ) ) ( not ( = ?auto_26613 ?auto_26644 ) ) ( not ( = ?auto_26613 ?auto_26643 ) ) ( not ( = ?auto_26613 ?auto_26626 ) ) ( not ( = ?auto_26613 ?auto_26646 ) ) ( not ( = ?auto_26613 ?auto_26640 ) ) ( not ( = ?auto_26639 ?auto_26633 ) ) ( not ( = ?auto_26639 ?auto_26634 ) ) ( not ( = ?auto_26639 ?auto_26644 ) ) ( not ( = ?auto_26639 ?auto_26643 ) ) ( not ( = ?auto_26639 ?auto_26626 ) ) ( not ( = ?auto_26639 ?auto_26646 ) ) ( not ( = ?auto_26639 ?auto_26640 ) ) ( not ( = ?auto_26607 ?auto_26616 ) ) ( not ( = ?auto_26607 ?auto_26648 ) ) ( not ( = ?auto_26608 ?auto_26616 ) ) ( not ( = ?auto_26608 ?auto_26648 ) ) ( not ( = ?auto_26609 ?auto_26616 ) ) ( not ( = ?auto_26609 ?auto_26648 ) ) ( not ( = ?auto_26610 ?auto_26616 ) ) ( not ( = ?auto_26610 ?auto_26648 ) ) ( not ( = ?auto_26611 ?auto_26616 ) ) ( not ( = ?auto_26611 ?auto_26648 ) ) ( not ( = ?auto_26612 ?auto_26616 ) ) ( not ( = ?auto_26612 ?auto_26648 ) ) ( not ( = ?auto_26615 ?auto_26616 ) ) ( not ( = ?auto_26615 ?auto_26648 ) ) ( not ( = ?auto_26614 ?auto_26616 ) ) ( not ( = ?auto_26614 ?auto_26648 ) ) ( not ( = ?auto_26616 ?auto_26639 ) ) ( not ( = ?auto_26616 ?auto_26633 ) ) ( not ( = ?auto_26616 ?auto_26634 ) ) ( not ( = ?auto_26616 ?auto_26644 ) ) ( not ( = ?auto_26616 ?auto_26643 ) ) ( not ( = ?auto_26616 ?auto_26626 ) ) ( not ( = ?auto_26616 ?auto_26646 ) ) ( not ( = ?auto_26616 ?auto_26640 ) ) ( not ( = ?auto_26648 ?auto_26639 ) ) ( not ( = ?auto_26648 ?auto_26633 ) ) ( not ( = ?auto_26648 ?auto_26634 ) ) ( not ( = ?auto_26648 ?auto_26644 ) ) ( not ( = ?auto_26648 ?auto_26643 ) ) ( not ( = ?auto_26648 ?auto_26626 ) ) ( not ( = ?auto_26648 ?auto_26646 ) ) ( not ( = ?auto_26648 ?auto_26640 ) ) ( not ( = ?auto_26607 ?auto_26618 ) ) ( not ( = ?auto_26607 ?auto_26628 ) ) ( not ( = ?auto_26608 ?auto_26618 ) ) ( not ( = ?auto_26608 ?auto_26628 ) ) ( not ( = ?auto_26609 ?auto_26618 ) ) ( not ( = ?auto_26609 ?auto_26628 ) ) ( not ( = ?auto_26610 ?auto_26618 ) ) ( not ( = ?auto_26610 ?auto_26628 ) ) ( not ( = ?auto_26611 ?auto_26618 ) ) ( not ( = ?auto_26611 ?auto_26628 ) ) ( not ( = ?auto_26612 ?auto_26618 ) ) ( not ( = ?auto_26612 ?auto_26628 ) ) ( not ( = ?auto_26615 ?auto_26618 ) ) ( not ( = ?auto_26615 ?auto_26628 ) ) ( not ( = ?auto_26614 ?auto_26618 ) ) ( not ( = ?auto_26614 ?auto_26628 ) ) ( not ( = ?auto_26613 ?auto_26618 ) ) ( not ( = ?auto_26613 ?auto_26628 ) ) ( not ( = ?auto_26618 ?auto_26648 ) ) ( not ( = ?auto_26618 ?auto_26639 ) ) ( not ( = ?auto_26618 ?auto_26633 ) ) ( not ( = ?auto_26618 ?auto_26634 ) ) ( not ( = ?auto_26618 ?auto_26644 ) ) ( not ( = ?auto_26618 ?auto_26643 ) ) ( not ( = ?auto_26618 ?auto_26626 ) ) ( not ( = ?auto_26618 ?auto_26646 ) ) ( not ( = ?auto_26618 ?auto_26640 ) ) ( not ( = ?auto_26631 ?auto_26649 ) ) ( not ( = ?auto_26631 ?auto_26636 ) ) ( not ( = ?auto_26631 ?auto_26645 ) ) ( not ( = ?auto_26631 ?auto_26630 ) ) ( not ( = ?auto_26631 ?auto_26641 ) ) ( not ( = ?auto_26631 ?auto_26625 ) ) ( not ( = ?auto_26631 ?auto_26650 ) ) ( not ( = ?auto_26629 ?auto_26637 ) ) ( not ( = ?auto_26629 ?auto_26647 ) ) ( not ( = ?auto_26629 ?auto_26635 ) ) ( not ( = ?auto_26629 ?auto_26632 ) ) ( not ( = ?auto_26629 ?auto_26627 ) ) ( not ( = ?auto_26629 ?auto_26638 ) ) ( not ( = ?auto_26629 ?auto_26642 ) ) ( not ( = ?auto_26628 ?auto_26648 ) ) ( not ( = ?auto_26628 ?auto_26639 ) ) ( not ( = ?auto_26628 ?auto_26633 ) ) ( not ( = ?auto_26628 ?auto_26634 ) ) ( not ( = ?auto_26628 ?auto_26644 ) ) ( not ( = ?auto_26628 ?auto_26643 ) ) ( not ( = ?auto_26628 ?auto_26626 ) ) ( not ( = ?auto_26628 ?auto_26646 ) ) ( not ( = ?auto_26628 ?auto_26640 ) ) ( not ( = ?auto_26607 ?auto_26617 ) ) ( not ( = ?auto_26607 ?auto_26619 ) ) ( not ( = ?auto_26608 ?auto_26617 ) ) ( not ( = ?auto_26608 ?auto_26619 ) ) ( not ( = ?auto_26609 ?auto_26617 ) ) ( not ( = ?auto_26609 ?auto_26619 ) ) ( not ( = ?auto_26610 ?auto_26617 ) ) ( not ( = ?auto_26610 ?auto_26619 ) ) ( not ( = ?auto_26611 ?auto_26617 ) ) ( not ( = ?auto_26611 ?auto_26619 ) ) ( not ( = ?auto_26612 ?auto_26617 ) ) ( not ( = ?auto_26612 ?auto_26619 ) ) ( not ( = ?auto_26615 ?auto_26617 ) ) ( not ( = ?auto_26615 ?auto_26619 ) ) ( not ( = ?auto_26614 ?auto_26617 ) ) ( not ( = ?auto_26614 ?auto_26619 ) ) ( not ( = ?auto_26613 ?auto_26617 ) ) ( not ( = ?auto_26613 ?auto_26619 ) ) ( not ( = ?auto_26616 ?auto_26617 ) ) ( not ( = ?auto_26616 ?auto_26619 ) ) ( not ( = ?auto_26617 ?auto_26628 ) ) ( not ( = ?auto_26617 ?auto_26648 ) ) ( not ( = ?auto_26617 ?auto_26639 ) ) ( not ( = ?auto_26617 ?auto_26633 ) ) ( not ( = ?auto_26617 ?auto_26634 ) ) ( not ( = ?auto_26617 ?auto_26644 ) ) ( not ( = ?auto_26617 ?auto_26643 ) ) ( not ( = ?auto_26617 ?auto_26626 ) ) ( not ( = ?auto_26617 ?auto_26646 ) ) ( not ( = ?auto_26617 ?auto_26640 ) ) ( not ( = ?auto_26624 ?auto_26631 ) ) ( not ( = ?auto_26624 ?auto_26649 ) ) ( not ( = ?auto_26624 ?auto_26636 ) ) ( not ( = ?auto_26624 ?auto_26645 ) ) ( not ( = ?auto_26624 ?auto_26630 ) ) ( not ( = ?auto_26624 ?auto_26641 ) ) ( not ( = ?auto_26624 ?auto_26625 ) ) ( not ( = ?auto_26624 ?auto_26650 ) ) ( not ( = ?auto_26622 ?auto_26629 ) ) ( not ( = ?auto_26622 ?auto_26637 ) ) ( not ( = ?auto_26622 ?auto_26647 ) ) ( not ( = ?auto_26622 ?auto_26635 ) ) ( not ( = ?auto_26622 ?auto_26632 ) ) ( not ( = ?auto_26622 ?auto_26627 ) ) ( not ( = ?auto_26622 ?auto_26638 ) ) ( not ( = ?auto_26622 ?auto_26642 ) ) ( not ( = ?auto_26619 ?auto_26628 ) ) ( not ( = ?auto_26619 ?auto_26648 ) ) ( not ( = ?auto_26619 ?auto_26639 ) ) ( not ( = ?auto_26619 ?auto_26633 ) ) ( not ( = ?auto_26619 ?auto_26634 ) ) ( not ( = ?auto_26619 ?auto_26644 ) ) ( not ( = ?auto_26619 ?auto_26643 ) ) ( not ( = ?auto_26619 ?auto_26626 ) ) ( not ( = ?auto_26619 ?auto_26646 ) ) ( not ( = ?auto_26619 ?auto_26640 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_26607 ?auto_26608 ?auto_26609 ?auto_26610 ?auto_26611 ?auto_26612 ?auto_26615 ?auto_26614 ?auto_26613 ?auto_26616 ?auto_26618 )
      ( MAKE-1CRATE ?auto_26618 ?auto_26617 )
      ( MAKE-11CRATE-VERIFY ?auto_26607 ?auto_26608 ?auto_26609 ?auto_26610 ?auto_26611 ?auto_26612 ?auto_26615 ?auto_26614 ?auto_26613 ?auto_26616 ?auto_26618 ?auto_26617 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26653 - SURFACE
      ?auto_26654 - SURFACE
    )
    :vars
    (
      ?auto_26655 - HOIST
      ?auto_26656 - PLACE
      ?auto_26658 - PLACE
      ?auto_26659 - HOIST
      ?auto_26660 - SURFACE
      ?auto_26657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26655 ?auto_26656 ) ( SURFACE-AT ?auto_26653 ?auto_26656 ) ( CLEAR ?auto_26653 ) ( IS-CRATE ?auto_26654 ) ( AVAILABLE ?auto_26655 ) ( not ( = ?auto_26658 ?auto_26656 ) ) ( HOIST-AT ?auto_26659 ?auto_26658 ) ( AVAILABLE ?auto_26659 ) ( SURFACE-AT ?auto_26654 ?auto_26658 ) ( ON ?auto_26654 ?auto_26660 ) ( CLEAR ?auto_26654 ) ( TRUCK-AT ?auto_26657 ?auto_26656 ) ( not ( = ?auto_26653 ?auto_26654 ) ) ( not ( = ?auto_26653 ?auto_26660 ) ) ( not ( = ?auto_26654 ?auto_26660 ) ) ( not ( = ?auto_26655 ?auto_26659 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26657 ?auto_26656 ?auto_26658 )
      ( !LIFT ?auto_26659 ?auto_26654 ?auto_26660 ?auto_26658 )
      ( !LOAD ?auto_26659 ?auto_26654 ?auto_26657 ?auto_26658 )
      ( !DRIVE ?auto_26657 ?auto_26658 ?auto_26656 )
      ( !UNLOAD ?auto_26655 ?auto_26654 ?auto_26657 ?auto_26656 )
      ( !DROP ?auto_26655 ?auto_26654 ?auto_26653 ?auto_26656 )
      ( MAKE-1CRATE-VERIFY ?auto_26653 ?auto_26654 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_26674 - SURFACE
      ?auto_26675 - SURFACE
      ?auto_26676 - SURFACE
      ?auto_26677 - SURFACE
      ?auto_26678 - SURFACE
      ?auto_26679 - SURFACE
      ?auto_26682 - SURFACE
      ?auto_26681 - SURFACE
      ?auto_26680 - SURFACE
      ?auto_26683 - SURFACE
      ?auto_26685 - SURFACE
      ?auto_26684 - SURFACE
      ?auto_26686 - SURFACE
    )
    :vars
    (
      ?auto_26688 - HOIST
      ?auto_26691 - PLACE
      ?auto_26692 - PLACE
      ?auto_26690 - HOIST
      ?auto_26687 - SURFACE
      ?auto_26701 - PLACE
      ?auto_26693 - HOIST
      ?auto_26697 - SURFACE
      ?auto_26720 - PLACE
      ?auto_26709 - HOIST
      ?auto_26711 - SURFACE
      ?auto_26705 - PLACE
      ?auto_26716 - HOIST
      ?auto_26704 - SURFACE
      ?auto_26712 - PLACE
      ?auto_26714 - HOIST
      ?auto_26703 - SURFACE
      ?auto_26696 - PLACE
      ?auto_26695 - HOIST
      ?auto_26708 - SURFACE
      ?auto_26715 - PLACE
      ?auto_26718 - HOIST
      ?auto_26698 - SURFACE
      ?auto_26707 - PLACE
      ?auto_26706 - HOIST
      ?auto_26699 - SURFACE
      ?auto_26713 - PLACE
      ?auto_26721 - HOIST
      ?auto_26710 - SURFACE
      ?auto_26702 - SURFACE
      ?auto_26694 - SURFACE
      ?auto_26717 - PLACE
      ?auto_26719 - HOIST
      ?auto_26700 - SURFACE
      ?auto_26689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26688 ?auto_26691 ) ( IS-CRATE ?auto_26686 ) ( not ( = ?auto_26692 ?auto_26691 ) ) ( HOIST-AT ?auto_26690 ?auto_26692 ) ( AVAILABLE ?auto_26690 ) ( SURFACE-AT ?auto_26686 ?auto_26692 ) ( ON ?auto_26686 ?auto_26687 ) ( CLEAR ?auto_26686 ) ( not ( = ?auto_26684 ?auto_26686 ) ) ( not ( = ?auto_26684 ?auto_26687 ) ) ( not ( = ?auto_26686 ?auto_26687 ) ) ( not ( = ?auto_26688 ?auto_26690 ) ) ( IS-CRATE ?auto_26684 ) ( not ( = ?auto_26701 ?auto_26691 ) ) ( HOIST-AT ?auto_26693 ?auto_26701 ) ( AVAILABLE ?auto_26693 ) ( SURFACE-AT ?auto_26684 ?auto_26701 ) ( ON ?auto_26684 ?auto_26697 ) ( CLEAR ?auto_26684 ) ( not ( = ?auto_26685 ?auto_26684 ) ) ( not ( = ?auto_26685 ?auto_26697 ) ) ( not ( = ?auto_26684 ?auto_26697 ) ) ( not ( = ?auto_26688 ?auto_26693 ) ) ( IS-CRATE ?auto_26685 ) ( not ( = ?auto_26720 ?auto_26691 ) ) ( HOIST-AT ?auto_26709 ?auto_26720 ) ( AVAILABLE ?auto_26709 ) ( SURFACE-AT ?auto_26685 ?auto_26720 ) ( ON ?auto_26685 ?auto_26711 ) ( CLEAR ?auto_26685 ) ( not ( = ?auto_26683 ?auto_26685 ) ) ( not ( = ?auto_26683 ?auto_26711 ) ) ( not ( = ?auto_26685 ?auto_26711 ) ) ( not ( = ?auto_26688 ?auto_26709 ) ) ( IS-CRATE ?auto_26683 ) ( not ( = ?auto_26705 ?auto_26691 ) ) ( HOIST-AT ?auto_26716 ?auto_26705 ) ( SURFACE-AT ?auto_26683 ?auto_26705 ) ( ON ?auto_26683 ?auto_26704 ) ( CLEAR ?auto_26683 ) ( not ( = ?auto_26680 ?auto_26683 ) ) ( not ( = ?auto_26680 ?auto_26704 ) ) ( not ( = ?auto_26683 ?auto_26704 ) ) ( not ( = ?auto_26688 ?auto_26716 ) ) ( IS-CRATE ?auto_26680 ) ( not ( = ?auto_26712 ?auto_26691 ) ) ( HOIST-AT ?auto_26714 ?auto_26712 ) ( SURFACE-AT ?auto_26680 ?auto_26712 ) ( ON ?auto_26680 ?auto_26703 ) ( CLEAR ?auto_26680 ) ( not ( = ?auto_26681 ?auto_26680 ) ) ( not ( = ?auto_26681 ?auto_26703 ) ) ( not ( = ?auto_26680 ?auto_26703 ) ) ( not ( = ?auto_26688 ?auto_26714 ) ) ( IS-CRATE ?auto_26681 ) ( not ( = ?auto_26696 ?auto_26691 ) ) ( HOIST-AT ?auto_26695 ?auto_26696 ) ( AVAILABLE ?auto_26695 ) ( SURFACE-AT ?auto_26681 ?auto_26696 ) ( ON ?auto_26681 ?auto_26708 ) ( CLEAR ?auto_26681 ) ( not ( = ?auto_26682 ?auto_26681 ) ) ( not ( = ?auto_26682 ?auto_26708 ) ) ( not ( = ?auto_26681 ?auto_26708 ) ) ( not ( = ?auto_26688 ?auto_26695 ) ) ( IS-CRATE ?auto_26682 ) ( not ( = ?auto_26715 ?auto_26691 ) ) ( HOIST-AT ?auto_26718 ?auto_26715 ) ( AVAILABLE ?auto_26718 ) ( SURFACE-AT ?auto_26682 ?auto_26715 ) ( ON ?auto_26682 ?auto_26698 ) ( CLEAR ?auto_26682 ) ( not ( = ?auto_26679 ?auto_26682 ) ) ( not ( = ?auto_26679 ?auto_26698 ) ) ( not ( = ?auto_26682 ?auto_26698 ) ) ( not ( = ?auto_26688 ?auto_26718 ) ) ( IS-CRATE ?auto_26679 ) ( not ( = ?auto_26707 ?auto_26691 ) ) ( HOIST-AT ?auto_26706 ?auto_26707 ) ( AVAILABLE ?auto_26706 ) ( SURFACE-AT ?auto_26679 ?auto_26707 ) ( ON ?auto_26679 ?auto_26699 ) ( CLEAR ?auto_26679 ) ( not ( = ?auto_26678 ?auto_26679 ) ) ( not ( = ?auto_26678 ?auto_26699 ) ) ( not ( = ?auto_26679 ?auto_26699 ) ) ( not ( = ?auto_26688 ?auto_26706 ) ) ( IS-CRATE ?auto_26678 ) ( not ( = ?auto_26713 ?auto_26691 ) ) ( HOIST-AT ?auto_26721 ?auto_26713 ) ( AVAILABLE ?auto_26721 ) ( SURFACE-AT ?auto_26678 ?auto_26713 ) ( ON ?auto_26678 ?auto_26710 ) ( CLEAR ?auto_26678 ) ( not ( = ?auto_26677 ?auto_26678 ) ) ( not ( = ?auto_26677 ?auto_26710 ) ) ( not ( = ?auto_26678 ?auto_26710 ) ) ( not ( = ?auto_26688 ?auto_26721 ) ) ( IS-CRATE ?auto_26677 ) ( AVAILABLE ?auto_26716 ) ( SURFACE-AT ?auto_26677 ?auto_26705 ) ( ON ?auto_26677 ?auto_26702 ) ( CLEAR ?auto_26677 ) ( not ( = ?auto_26676 ?auto_26677 ) ) ( not ( = ?auto_26676 ?auto_26702 ) ) ( not ( = ?auto_26677 ?auto_26702 ) ) ( IS-CRATE ?auto_26676 ) ( AVAILABLE ?auto_26714 ) ( SURFACE-AT ?auto_26676 ?auto_26712 ) ( ON ?auto_26676 ?auto_26694 ) ( CLEAR ?auto_26676 ) ( not ( = ?auto_26675 ?auto_26676 ) ) ( not ( = ?auto_26675 ?auto_26694 ) ) ( not ( = ?auto_26676 ?auto_26694 ) ) ( SURFACE-AT ?auto_26674 ?auto_26691 ) ( CLEAR ?auto_26674 ) ( IS-CRATE ?auto_26675 ) ( AVAILABLE ?auto_26688 ) ( not ( = ?auto_26717 ?auto_26691 ) ) ( HOIST-AT ?auto_26719 ?auto_26717 ) ( AVAILABLE ?auto_26719 ) ( SURFACE-AT ?auto_26675 ?auto_26717 ) ( ON ?auto_26675 ?auto_26700 ) ( CLEAR ?auto_26675 ) ( TRUCK-AT ?auto_26689 ?auto_26691 ) ( not ( = ?auto_26674 ?auto_26675 ) ) ( not ( = ?auto_26674 ?auto_26700 ) ) ( not ( = ?auto_26675 ?auto_26700 ) ) ( not ( = ?auto_26688 ?auto_26719 ) ) ( not ( = ?auto_26674 ?auto_26676 ) ) ( not ( = ?auto_26674 ?auto_26694 ) ) ( not ( = ?auto_26676 ?auto_26700 ) ) ( not ( = ?auto_26712 ?auto_26717 ) ) ( not ( = ?auto_26714 ?auto_26719 ) ) ( not ( = ?auto_26694 ?auto_26700 ) ) ( not ( = ?auto_26674 ?auto_26677 ) ) ( not ( = ?auto_26674 ?auto_26702 ) ) ( not ( = ?auto_26675 ?auto_26677 ) ) ( not ( = ?auto_26675 ?auto_26702 ) ) ( not ( = ?auto_26677 ?auto_26694 ) ) ( not ( = ?auto_26677 ?auto_26700 ) ) ( not ( = ?auto_26705 ?auto_26712 ) ) ( not ( = ?auto_26705 ?auto_26717 ) ) ( not ( = ?auto_26716 ?auto_26714 ) ) ( not ( = ?auto_26716 ?auto_26719 ) ) ( not ( = ?auto_26702 ?auto_26694 ) ) ( not ( = ?auto_26702 ?auto_26700 ) ) ( not ( = ?auto_26674 ?auto_26678 ) ) ( not ( = ?auto_26674 ?auto_26710 ) ) ( not ( = ?auto_26675 ?auto_26678 ) ) ( not ( = ?auto_26675 ?auto_26710 ) ) ( not ( = ?auto_26676 ?auto_26678 ) ) ( not ( = ?auto_26676 ?auto_26710 ) ) ( not ( = ?auto_26678 ?auto_26702 ) ) ( not ( = ?auto_26678 ?auto_26694 ) ) ( not ( = ?auto_26678 ?auto_26700 ) ) ( not ( = ?auto_26713 ?auto_26705 ) ) ( not ( = ?auto_26713 ?auto_26712 ) ) ( not ( = ?auto_26713 ?auto_26717 ) ) ( not ( = ?auto_26721 ?auto_26716 ) ) ( not ( = ?auto_26721 ?auto_26714 ) ) ( not ( = ?auto_26721 ?auto_26719 ) ) ( not ( = ?auto_26710 ?auto_26702 ) ) ( not ( = ?auto_26710 ?auto_26694 ) ) ( not ( = ?auto_26710 ?auto_26700 ) ) ( not ( = ?auto_26674 ?auto_26679 ) ) ( not ( = ?auto_26674 ?auto_26699 ) ) ( not ( = ?auto_26675 ?auto_26679 ) ) ( not ( = ?auto_26675 ?auto_26699 ) ) ( not ( = ?auto_26676 ?auto_26679 ) ) ( not ( = ?auto_26676 ?auto_26699 ) ) ( not ( = ?auto_26677 ?auto_26679 ) ) ( not ( = ?auto_26677 ?auto_26699 ) ) ( not ( = ?auto_26679 ?auto_26710 ) ) ( not ( = ?auto_26679 ?auto_26702 ) ) ( not ( = ?auto_26679 ?auto_26694 ) ) ( not ( = ?auto_26679 ?auto_26700 ) ) ( not ( = ?auto_26707 ?auto_26713 ) ) ( not ( = ?auto_26707 ?auto_26705 ) ) ( not ( = ?auto_26707 ?auto_26712 ) ) ( not ( = ?auto_26707 ?auto_26717 ) ) ( not ( = ?auto_26706 ?auto_26721 ) ) ( not ( = ?auto_26706 ?auto_26716 ) ) ( not ( = ?auto_26706 ?auto_26714 ) ) ( not ( = ?auto_26706 ?auto_26719 ) ) ( not ( = ?auto_26699 ?auto_26710 ) ) ( not ( = ?auto_26699 ?auto_26702 ) ) ( not ( = ?auto_26699 ?auto_26694 ) ) ( not ( = ?auto_26699 ?auto_26700 ) ) ( not ( = ?auto_26674 ?auto_26682 ) ) ( not ( = ?auto_26674 ?auto_26698 ) ) ( not ( = ?auto_26675 ?auto_26682 ) ) ( not ( = ?auto_26675 ?auto_26698 ) ) ( not ( = ?auto_26676 ?auto_26682 ) ) ( not ( = ?auto_26676 ?auto_26698 ) ) ( not ( = ?auto_26677 ?auto_26682 ) ) ( not ( = ?auto_26677 ?auto_26698 ) ) ( not ( = ?auto_26678 ?auto_26682 ) ) ( not ( = ?auto_26678 ?auto_26698 ) ) ( not ( = ?auto_26682 ?auto_26699 ) ) ( not ( = ?auto_26682 ?auto_26710 ) ) ( not ( = ?auto_26682 ?auto_26702 ) ) ( not ( = ?auto_26682 ?auto_26694 ) ) ( not ( = ?auto_26682 ?auto_26700 ) ) ( not ( = ?auto_26715 ?auto_26707 ) ) ( not ( = ?auto_26715 ?auto_26713 ) ) ( not ( = ?auto_26715 ?auto_26705 ) ) ( not ( = ?auto_26715 ?auto_26712 ) ) ( not ( = ?auto_26715 ?auto_26717 ) ) ( not ( = ?auto_26718 ?auto_26706 ) ) ( not ( = ?auto_26718 ?auto_26721 ) ) ( not ( = ?auto_26718 ?auto_26716 ) ) ( not ( = ?auto_26718 ?auto_26714 ) ) ( not ( = ?auto_26718 ?auto_26719 ) ) ( not ( = ?auto_26698 ?auto_26699 ) ) ( not ( = ?auto_26698 ?auto_26710 ) ) ( not ( = ?auto_26698 ?auto_26702 ) ) ( not ( = ?auto_26698 ?auto_26694 ) ) ( not ( = ?auto_26698 ?auto_26700 ) ) ( not ( = ?auto_26674 ?auto_26681 ) ) ( not ( = ?auto_26674 ?auto_26708 ) ) ( not ( = ?auto_26675 ?auto_26681 ) ) ( not ( = ?auto_26675 ?auto_26708 ) ) ( not ( = ?auto_26676 ?auto_26681 ) ) ( not ( = ?auto_26676 ?auto_26708 ) ) ( not ( = ?auto_26677 ?auto_26681 ) ) ( not ( = ?auto_26677 ?auto_26708 ) ) ( not ( = ?auto_26678 ?auto_26681 ) ) ( not ( = ?auto_26678 ?auto_26708 ) ) ( not ( = ?auto_26679 ?auto_26681 ) ) ( not ( = ?auto_26679 ?auto_26708 ) ) ( not ( = ?auto_26681 ?auto_26698 ) ) ( not ( = ?auto_26681 ?auto_26699 ) ) ( not ( = ?auto_26681 ?auto_26710 ) ) ( not ( = ?auto_26681 ?auto_26702 ) ) ( not ( = ?auto_26681 ?auto_26694 ) ) ( not ( = ?auto_26681 ?auto_26700 ) ) ( not ( = ?auto_26696 ?auto_26715 ) ) ( not ( = ?auto_26696 ?auto_26707 ) ) ( not ( = ?auto_26696 ?auto_26713 ) ) ( not ( = ?auto_26696 ?auto_26705 ) ) ( not ( = ?auto_26696 ?auto_26712 ) ) ( not ( = ?auto_26696 ?auto_26717 ) ) ( not ( = ?auto_26695 ?auto_26718 ) ) ( not ( = ?auto_26695 ?auto_26706 ) ) ( not ( = ?auto_26695 ?auto_26721 ) ) ( not ( = ?auto_26695 ?auto_26716 ) ) ( not ( = ?auto_26695 ?auto_26714 ) ) ( not ( = ?auto_26695 ?auto_26719 ) ) ( not ( = ?auto_26708 ?auto_26698 ) ) ( not ( = ?auto_26708 ?auto_26699 ) ) ( not ( = ?auto_26708 ?auto_26710 ) ) ( not ( = ?auto_26708 ?auto_26702 ) ) ( not ( = ?auto_26708 ?auto_26694 ) ) ( not ( = ?auto_26708 ?auto_26700 ) ) ( not ( = ?auto_26674 ?auto_26680 ) ) ( not ( = ?auto_26674 ?auto_26703 ) ) ( not ( = ?auto_26675 ?auto_26680 ) ) ( not ( = ?auto_26675 ?auto_26703 ) ) ( not ( = ?auto_26676 ?auto_26680 ) ) ( not ( = ?auto_26676 ?auto_26703 ) ) ( not ( = ?auto_26677 ?auto_26680 ) ) ( not ( = ?auto_26677 ?auto_26703 ) ) ( not ( = ?auto_26678 ?auto_26680 ) ) ( not ( = ?auto_26678 ?auto_26703 ) ) ( not ( = ?auto_26679 ?auto_26680 ) ) ( not ( = ?auto_26679 ?auto_26703 ) ) ( not ( = ?auto_26682 ?auto_26680 ) ) ( not ( = ?auto_26682 ?auto_26703 ) ) ( not ( = ?auto_26680 ?auto_26708 ) ) ( not ( = ?auto_26680 ?auto_26698 ) ) ( not ( = ?auto_26680 ?auto_26699 ) ) ( not ( = ?auto_26680 ?auto_26710 ) ) ( not ( = ?auto_26680 ?auto_26702 ) ) ( not ( = ?auto_26680 ?auto_26694 ) ) ( not ( = ?auto_26680 ?auto_26700 ) ) ( not ( = ?auto_26703 ?auto_26708 ) ) ( not ( = ?auto_26703 ?auto_26698 ) ) ( not ( = ?auto_26703 ?auto_26699 ) ) ( not ( = ?auto_26703 ?auto_26710 ) ) ( not ( = ?auto_26703 ?auto_26702 ) ) ( not ( = ?auto_26703 ?auto_26694 ) ) ( not ( = ?auto_26703 ?auto_26700 ) ) ( not ( = ?auto_26674 ?auto_26683 ) ) ( not ( = ?auto_26674 ?auto_26704 ) ) ( not ( = ?auto_26675 ?auto_26683 ) ) ( not ( = ?auto_26675 ?auto_26704 ) ) ( not ( = ?auto_26676 ?auto_26683 ) ) ( not ( = ?auto_26676 ?auto_26704 ) ) ( not ( = ?auto_26677 ?auto_26683 ) ) ( not ( = ?auto_26677 ?auto_26704 ) ) ( not ( = ?auto_26678 ?auto_26683 ) ) ( not ( = ?auto_26678 ?auto_26704 ) ) ( not ( = ?auto_26679 ?auto_26683 ) ) ( not ( = ?auto_26679 ?auto_26704 ) ) ( not ( = ?auto_26682 ?auto_26683 ) ) ( not ( = ?auto_26682 ?auto_26704 ) ) ( not ( = ?auto_26681 ?auto_26683 ) ) ( not ( = ?auto_26681 ?auto_26704 ) ) ( not ( = ?auto_26683 ?auto_26703 ) ) ( not ( = ?auto_26683 ?auto_26708 ) ) ( not ( = ?auto_26683 ?auto_26698 ) ) ( not ( = ?auto_26683 ?auto_26699 ) ) ( not ( = ?auto_26683 ?auto_26710 ) ) ( not ( = ?auto_26683 ?auto_26702 ) ) ( not ( = ?auto_26683 ?auto_26694 ) ) ( not ( = ?auto_26683 ?auto_26700 ) ) ( not ( = ?auto_26704 ?auto_26703 ) ) ( not ( = ?auto_26704 ?auto_26708 ) ) ( not ( = ?auto_26704 ?auto_26698 ) ) ( not ( = ?auto_26704 ?auto_26699 ) ) ( not ( = ?auto_26704 ?auto_26710 ) ) ( not ( = ?auto_26704 ?auto_26702 ) ) ( not ( = ?auto_26704 ?auto_26694 ) ) ( not ( = ?auto_26704 ?auto_26700 ) ) ( not ( = ?auto_26674 ?auto_26685 ) ) ( not ( = ?auto_26674 ?auto_26711 ) ) ( not ( = ?auto_26675 ?auto_26685 ) ) ( not ( = ?auto_26675 ?auto_26711 ) ) ( not ( = ?auto_26676 ?auto_26685 ) ) ( not ( = ?auto_26676 ?auto_26711 ) ) ( not ( = ?auto_26677 ?auto_26685 ) ) ( not ( = ?auto_26677 ?auto_26711 ) ) ( not ( = ?auto_26678 ?auto_26685 ) ) ( not ( = ?auto_26678 ?auto_26711 ) ) ( not ( = ?auto_26679 ?auto_26685 ) ) ( not ( = ?auto_26679 ?auto_26711 ) ) ( not ( = ?auto_26682 ?auto_26685 ) ) ( not ( = ?auto_26682 ?auto_26711 ) ) ( not ( = ?auto_26681 ?auto_26685 ) ) ( not ( = ?auto_26681 ?auto_26711 ) ) ( not ( = ?auto_26680 ?auto_26685 ) ) ( not ( = ?auto_26680 ?auto_26711 ) ) ( not ( = ?auto_26685 ?auto_26704 ) ) ( not ( = ?auto_26685 ?auto_26703 ) ) ( not ( = ?auto_26685 ?auto_26708 ) ) ( not ( = ?auto_26685 ?auto_26698 ) ) ( not ( = ?auto_26685 ?auto_26699 ) ) ( not ( = ?auto_26685 ?auto_26710 ) ) ( not ( = ?auto_26685 ?auto_26702 ) ) ( not ( = ?auto_26685 ?auto_26694 ) ) ( not ( = ?auto_26685 ?auto_26700 ) ) ( not ( = ?auto_26720 ?auto_26705 ) ) ( not ( = ?auto_26720 ?auto_26712 ) ) ( not ( = ?auto_26720 ?auto_26696 ) ) ( not ( = ?auto_26720 ?auto_26715 ) ) ( not ( = ?auto_26720 ?auto_26707 ) ) ( not ( = ?auto_26720 ?auto_26713 ) ) ( not ( = ?auto_26720 ?auto_26717 ) ) ( not ( = ?auto_26709 ?auto_26716 ) ) ( not ( = ?auto_26709 ?auto_26714 ) ) ( not ( = ?auto_26709 ?auto_26695 ) ) ( not ( = ?auto_26709 ?auto_26718 ) ) ( not ( = ?auto_26709 ?auto_26706 ) ) ( not ( = ?auto_26709 ?auto_26721 ) ) ( not ( = ?auto_26709 ?auto_26719 ) ) ( not ( = ?auto_26711 ?auto_26704 ) ) ( not ( = ?auto_26711 ?auto_26703 ) ) ( not ( = ?auto_26711 ?auto_26708 ) ) ( not ( = ?auto_26711 ?auto_26698 ) ) ( not ( = ?auto_26711 ?auto_26699 ) ) ( not ( = ?auto_26711 ?auto_26710 ) ) ( not ( = ?auto_26711 ?auto_26702 ) ) ( not ( = ?auto_26711 ?auto_26694 ) ) ( not ( = ?auto_26711 ?auto_26700 ) ) ( not ( = ?auto_26674 ?auto_26684 ) ) ( not ( = ?auto_26674 ?auto_26697 ) ) ( not ( = ?auto_26675 ?auto_26684 ) ) ( not ( = ?auto_26675 ?auto_26697 ) ) ( not ( = ?auto_26676 ?auto_26684 ) ) ( not ( = ?auto_26676 ?auto_26697 ) ) ( not ( = ?auto_26677 ?auto_26684 ) ) ( not ( = ?auto_26677 ?auto_26697 ) ) ( not ( = ?auto_26678 ?auto_26684 ) ) ( not ( = ?auto_26678 ?auto_26697 ) ) ( not ( = ?auto_26679 ?auto_26684 ) ) ( not ( = ?auto_26679 ?auto_26697 ) ) ( not ( = ?auto_26682 ?auto_26684 ) ) ( not ( = ?auto_26682 ?auto_26697 ) ) ( not ( = ?auto_26681 ?auto_26684 ) ) ( not ( = ?auto_26681 ?auto_26697 ) ) ( not ( = ?auto_26680 ?auto_26684 ) ) ( not ( = ?auto_26680 ?auto_26697 ) ) ( not ( = ?auto_26683 ?auto_26684 ) ) ( not ( = ?auto_26683 ?auto_26697 ) ) ( not ( = ?auto_26684 ?auto_26711 ) ) ( not ( = ?auto_26684 ?auto_26704 ) ) ( not ( = ?auto_26684 ?auto_26703 ) ) ( not ( = ?auto_26684 ?auto_26708 ) ) ( not ( = ?auto_26684 ?auto_26698 ) ) ( not ( = ?auto_26684 ?auto_26699 ) ) ( not ( = ?auto_26684 ?auto_26710 ) ) ( not ( = ?auto_26684 ?auto_26702 ) ) ( not ( = ?auto_26684 ?auto_26694 ) ) ( not ( = ?auto_26684 ?auto_26700 ) ) ( not ( = ?auto_26701 ?auto_26720 ) ) ( not ( = ?auto_26701 ?auto_26705 ) ) ( not ( = ?auto_26701 ?auto_26712 ) ) ( not ( = ?auto_26701 ?auto_26696 ) ) ( not ( = ?auto_26701 ?auto_26715 ) ) ( not ( = ?auto_26701 ?auto_26707 ) ) ( not ( = ?auto_26701 ?auto_26713 ) ) ( not ( = ?auto_26701 ?auto_26717 ) ) ( not ( = ?auto_26693 ?auto_26709 ) ) ( not ( = ?auto_26693 ?auto_26716 ) ) ( not ( = ?auto_26693 ?auto_26714 ) ) ( not ( = ?auto_26693 ?auto_26695 ) ) ( not ( = ?auto_26693 ?auto_26718 ) ) ( not ( = ?auto_26693 ?auto_26706 ) ) ( not ( = ?auto_26693 ?auto_26721 ) ) ( not ( = ?auto_26693 ?auto_26719 ) ) ( not ( = ?auto_26697 ?auto_26711 ) ) ( not ( = ?auto_26697 ?auto_26704 ) ) ( not ( = ?auto_26697 ?auto_26703 ) ) ( not ( = ?auto_26697 ?auto_26708 ) ) ( not ( = ?auto_26697 ?auto_26698 ) ) ( not ( = ?auto_26697 ?auto_26699 ) ) ( not ( = ?auto_26697 ?auto_26710 ) ) ( not ( = ?auto_26697 ?auto_26702 ) ) ( not ( = ?auto_26697 ?auto_26694 ) ) ( not ( = ?auto_26697 ?auto_26700 ) ) ( not ( = ?auto_26674 ?auto_26686 ) ) ( not ( = ?auto_26674 ?auto_26687 ) ) ( not ( = ?auto_26675 ?auto_26686 ) ) ( not ( = ?auto_26675 ?auto_26687 ) ) ( not ( = ?auto_26676 ?auto_26686 ) ) ( not ( = ?auto_26676 ?auto_26687 ) ) ( not ( = ?auto_26677 ?auto_26686 ) ) ( not ( = ?auto_26677 ?auto_26687 ) ) ( not ( = ?auto_26678 ?auto_26686 ) ) ( not ( = ?auto_26678 ?auto_26687 ) ) ( not ( = ?auto_26679 ?auto_26686 ) ) ( not ( = ?auto_26679 ?auto_26687 ) ) ( not ( = ?auto_26682 ?auto_26686 ) ) ( not ( = ?auto_26682 ?auto_26687 ) ) ( not ( = ?auto_26681 ?auto_26686 ) ) ( not ( = ?auto_26681 ?auto_26687 ) ) ( not ( = ?auto_26680 ?auto_26686 ) ) ( not ( = ?auto_26680 ?auto_26687 ) ) ( not ( = ?auto_26683 ?auto_26686 ) ) ( not ( = ?auto_26683 ?auto_26687 ) ) ( not ( = ?auto_26685 ?auto_26686 ) ) ( not ( = ?auto_26685 ?auto_26687 ) ) ( not ( = ?auto_26686 ?auto_26697 ) ) ( not ( = ?auto_26686 ?auto_26711 ) ) ( not ( = ?auto_26686 ?auto_26704 ) ) ( not ( = ?auto_26686 ?auto_26703 ) ) ( not ( = ?auto_26686 ?auto_26708 ) ) ( not ( = ?auto_26686 ?auto_26698 ) ) ( not ( = ?auto_26686 ?auto_26699 ) ) ( not ( = ?auto_26686 ?auto_26710 ) ) ( not ( = ?auto_26686 ?auto_26702 ) ) ( not ( = ?auto_26686 ?auto_26694 ) ) ( not ( = ?auto_26686 ?auto_26700 ) ) ( not ( = ?auto_26692 ?auto_26701 ) ) ( not ( = ?auto_26692 ?auto_26720 ) ) ( not ( = ?auto_26692 ?auto_26705 ) ) ( not ( = ?auto_26692 ?auto_26712 ) ) ( not ( = ?auto_26692 ?auto_26696 ) ) ( not ( = ?auto_26692 ?auto_26715 ) ) ( not ( = ?auto_26692 ?auto_26707 ) ) ( not ( = ?auto_26692 ?auto_26713 ) ) ( not ( = ?auto_26692 ?auto_26717 ) ) ( not ( = ?auto_26690 ?auto_26693 ) ) ( not ( = ?auto_26690 ?auto_26709 ) ) ( not ( = ?auto_26690 ?auto_26716 ) ) ( not ( = ?auto_26690 ?auto_26714 ) ) ( not ( = ?auto_26690 ?auto_26695 ) ) ( not ( = ?auto_26690 ?auto_26718 ) ) ( not ( = ?auto_26690 ?auto_26706 ) ) ( not ( = ?auto_26690 ?auto_26721 ) ) ( not ( = ?auto_26690 ?auto_26719 ) ) ( not ( = ?auto_26687 ?auto_26697 ) ) ( not ( = ?auto_26687 ?auto_26711 ) ) ( not ( = ?auto_26687 ?auto_26704 ) ) ( not ( = ?auto_26687 ?auto_26703 ) ) ( not ( = ?auto_26687 ?auto_26708 ) ) ( not ( = ?auto_26687 ?auto_26698 ) ) ( not ( = ?auto_26687 ?auto_26699 ) ) ( not ( = ?auto_26687 ?auto_26710 ) ) ( not ( = ?auto_26687 ?auto_26702 ) ) ( not ( = ?auto_26687 ?auto_26694 ) ) ( not ( = ?auto_26687 ?auto_26700 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_26674 ?auto_26675 ?auto_26676 ?auto_26677 ?auto_26678 ?auto_26679 ?auto_26682 ?auto_26681 ?auto_26680 ?auto_26683 ?auto_26685 ?auto_26684 )
      ( MAKE-1CRATE ?auto_26684 ?auto_26686 )
      ( MAKE-12CRATE-VERIFY ?auto_26674 ?auto_26675 ?auto_26676 ?auto_26677 ?auto_26678 ?auto_26679 ?auto_26682 ?auto_26681 ?auto_26680 ?auto_26683 ?auto_26685 ?auto_26684 ?auto_26686 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26724 - SURFACE
      ?auto_26725 - SURFACE
    )
    :vars
    (
      ?auto_26726 - HOIST
      ?auto_26727 - PLACE
      ?auto_26729 - PLACE
      ?auto_26730 - HOIST
      ?auto_26731 - SURFACE
      ?auto_26728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26726 ?auto_26727 ) ( SURFACE-AT ?auto_26724 ?auto_26727 ) ( CLEAR ?auto_26724 ) ( IS-CRATE ?auto_26725 ) ( AVAILABLE ?auto_26726 ) ( not ( = ?auto_26729 ?auto_26727 ) ) ( HOIST-AT ?auto_26730 ?auto_26729 ) ( AVAILABLE ?auto_26730 ) ( SURFACE-AT ?auto_26725 ?auto_26729 ) ( ON ?auto_26725 ?auto_26731 ) ( CLEAR ?auto_26725 ) ( TRUCK-AT ?auto_26728 ?auto_26727 ) ( not ( = ?auto_26724 ?auto_26725 ) ) ( not ( = ?auto_26724 ?auto_26731 ) ) ( not ( = ?auto_26725 ?auto_26731 ) ) ( not ( = ?auto_26726 ?auto_26730 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26728 ?auto_26727 ?auto_26729 )
      ( !LIFT ?auto_26730 ?auto_26725 ?auto_26731 ?auto_26729 )
      ( !LOAD ?auto_26730 ?auto_26725 ?auto_26728 ?auto_26729 )
      ( !DRIVE ?auto_26728 ?auto_26729 ?auto_26727 )
      ( !UNLOAD ?auto_26726 ?auto_26725 ?auto_26728 ?auto_26727 )
      ( !DROP ?auto_26726 ?auto_26725 ?auto_26724 ?auto_26727 )
      ( MAKE-1CRATE-VERIFY ?auto_26724 ?auto_26725 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_26746 - SURFACE
      ?auto_26747 - SURFACE
      ?auto_26748 - SURFACE
      ?auto_26749 - SURFACE
      ?auto_26750 - SURFACE
      ?auto_26751 - SURFACE
      ?auto_26754 - SURFACE
      ?auto_26753 - SURFACE
      ?auto_26752 - SURFACE
      ?auto_26755 - SURFACE
      ?auto_26757 - SURFACE
      ?auto_26756 - SURFACE
      ?auto_26758 - SURFACE
      ?auto_26759 - SURFACE
    )
    :vars
    (
      ?auto_26765 - HOIST
      ?auto_26760 - PLACE
      ?auto_26764 - PLACE
      ?auto_26762 - HOIST
      ?auto_26763 - SURFACE
      ?auto_26772 - PLACE
      ?auto_26769 - HOIST
      ?auto_26787 - SURFACE
      ?auto_26778 - PLACE
      ?auto_26775 - HOIST
      ?auto_26788 - SURFACE
      ?auto_26794 - PLACE
      ?auto_26770 - HOIST
      ?auto_26793 - SURFACE
      ?auto_26795 - PLACE
      ?auto_26774 - HOIST
      ?auto_26779 - SURFACE
      ?auto_26783 - PLACE
      ?auto_26786 - HOIST
      ?auto_26771 - SURFACE
      ?auto_26766 - PLACE
      ?auto_26767 - HOIST
      ?auto_26781 - SURFACE
      ?auto_26792 - PLACE
      ?auto_26776 - HOIST
      ?auto_26768 - SURFACE
      ?auto_26790 - PLACE
      ?auto_26789 - HOIST
      ?auto_26796 - SURFACE
      ?auto_26780 - PLACE
      ?auto_26777 - HOIST
      ?auto_26791 - SURFACE
      ?auto_26785 - SURFACE
      ?auto_26782 - SURFACE
      ?auto_26773 - PLACE
      ?auto_26784 - HOIST
      ?auto_26797 - SURFACE
      ?auto_26761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26765 ?auto_26760 ) ( IS-CRATE ?auto_26759 ) ( not ( = ?auto_26764 ?auto_26760 ) ) ( HOIST-AT ?auto_26762 ?auto_26764 ) ( AVAILABLE ?auto_26762 ) ( SURFACE-AT ?auto_26759 ?auto_26764 ) ( ON ?auto_26759 ?auto_26763 ) ( CLEAR ?auto_26759 ) ( not ( = ?auto_26758 ?auto_26759 ) ) ( not ( = ?auto_26758 ?auto_26763 ) ) ( not ( = ?auto_26759 ?auto_26763 ) ) ( not ( = ?auto_26765 ?auto_26762 ) ) ( IS-CRATE ?auto_26758 ) ( not ( = ?auto_26772 ?auto_26760 ) ) ( HOIST-AT ?auto_26769 ?auto_26772 ) ( AVAILABLE ?auto_26769 ) ( SURFACE-AT ?auto_26758 ?auto_26772 ) ( ON ?auto_26758 ?auto_26787 ) ( CLEAR ?auto_26758 ) ( not ( = ?auto_26756 ?auto_26758 ) ) ( not ( = ?auto_26756 ?auto_26787 ) ) ( not ( = ?auto_26758 ?auto_26787 ) ) ( not ( = ?auto_26765 ?auto_26769 ) ) ( IS-CRATE ?auto_26756 ) ( not ( = ?auto_26778 ?auto_26760 ) ) ( HOIST-AT ?auto_26775 ?auto_26778 ) ( AVAILABLE ?auto_26775 ) ( SURFACE-AT ?auto_26756 ?auto_26778 ) ( ON ?auto_26756 ?auto_26788 ) ( CLEAR ?auto_26756 ) ( not ( = ?auto_26757 ?auto_26756 ) ) ( not ( = ?auto_26757 ?auto_26788 ) ) ( not ( = ?auto_26756 ?auto_26788 ) ) ( not ( = ?auto_26765 ?auto_26775 ) ) ( IS-CRATE ?auto_26757 ) ( not ( = ?auto_26794 ?auto_26760 ) ) ( HOIST-AT ?auto_26770 ?auto_26794 ) ( AVAILABLE ?auto_26770 ) ( SURFACE-AT ?auto_26757 ?auto_26794 ) ( ON ?auto_26757 ?auto_26793 ) ( CLEAR ?auto_26757 ) ( not ( = ?auto_26755 ?auto_26757 ) ) ( not ( = ?auto_26755 ?auto_26793 ) ) ( not ( = ?auto_26757 ?auto_26793 ) ) ( not ( = ?auto_26765 ?auto_26770 ) ) ( IS-CRATE ?auto_26755 ) ( not ( = ?auto_26795 ?auto_26760 ) ) ( HOIST-AT ?auto_26774 ?auto_26795 ) ( SURFACE-AT ?auto_26755 ?auto_26795 ) ( ON ?auto_26755 ?auto_26779 ) ( CLEAR ?auto_26755 ) ( not ( = ?auto_26752 ?auto_26755 ) ) ( not ( = ?auto_26752 ?auto_26779 ) ) ( not ( = ?auto_26755 ?auto_26779 ) ) ( not ( = ?auto_26765 ?auto_26774 ) ) ( IS-CRATE ?auto_26752 ) ( not ( = ?auto_26783 ?auto_26760 ) ) ( HOIST-AT ?auto_26786 ?auto_26783 ) ( SURFACE-AT ?auto_26752 ?auto_26783 ) ( ON ?auto_26752 ?auto_26771 ) ( CLEAR ?auto_26752 ) ( not ( = ?auto_26753 ?auto_26752 ) ) ( not ( = ?auto_26753 ?auto_26771 ) ) ( not ( = ?auto_26752 ?auto_26771 ) ) ( not ( = ?auto_26765 ?auto_26786 ) ) ( IS-CRATE ?auto_26753 ) ( not ( = ?auto_26766 ?auto_26760 ) ) ( HOIST-AT ?auto_26767 ?auto_26766 ) ( AVAILABLE ?auto_26767 ) ( SURFACE-AT ?auto_26753 ?auto_26766 ) ( ON ?auto_26753 ?auto_26781 ) ( CLEAR ?auto_26753 ) ( not ( = ?auto_26754 ?auto_26753 ) ) ( not ( = ?auto_26754 ?auto_26781 ) ) ( not ( = ?auto_26753 ?auto_26781 ) ) ( not ( = ?auto_26765 ?auto_26767 ) ) ( IS-CRATE ?auto_26754 ) ( not ( = ?auto_26792 ?auto_26760 ) ) ( HOIST-AT ?auto_26776 ?auto_26792 ) ( AVAILABLE ?auto_26776 ) ( SURFACE-AT ?auto_26754 ?auto_26792 ) ( ON ?auto_26754 ?auto_26768 ) ( CLEAR ?auto_26754 ) ( not ( = ?auto_26751 ?auto_26754 ) ) ( not ( = ?auto_26751 ?auto_26768 ) ) ( not ( = ?auto_26754 ?auto_26768 ) ) ( not ( = ?auto_26765 ?auto_26776 ) ) ( IS-CRATE ?auto_26751 ) ( not ( = ?auto_26790 ?auto_26760 ) ) ( HOIST-AT ?auto_26789 ?auto_26790 ) ( AVAILABLE ?auto_26789 ) ( SURFACE-AT ?auto_26751 ?auto_26790 ) ( ON ?auto_26751 ?auto_26796 ) ( CLEAR ?auto_26751 ) ( not ( = ?auto_26750 ?auto_26751 ) ) ( not ( = ?auto_26750 ?auto_26796 ) ) ( not ( = ?auto_26751 ?auto_26796 ) ) ( not ( = ?auto_26765 ?auto_26789 ) ) ( IS-CRATE ?auto_26750 ) ( not ( = ?auto_26780 ?auto_26760 ) ) ( HOIST-AT ?auto_26777 ?auto_26780 ) ( AVAILABLE ?auto_26777 ) ( SURFACE-AT ?auto_26750 ?auto_26780 ) ( ON ?auto_26750 ?auto_26791 ) ( CLEAR ?auto_26750 ) ( not ( = ?auto_26749 ?auto_26750 ) ) ( not ( = ?auto_26749 ?auto_26791 ) ) ( not ( = ?auto_26750 ?auto_26791 ) ) ( not ( = ?auto_26765 ?auto_26777 ) ) ( IS-CRATE ?auto_26749 ) ( AVAILABLE ?auto_26774 ) ( SURFACE-AT ?auto_26749 ?auto_26795 ) ( ON ?auto_26749 ?auto_26785 ) ( CLEAR ?auto_26749 ) ( not ( = ?auto_26748 ?auto_26749 ) ) ( not ( = ?auto_26748 ?auto_26785 ) ) ( not ( = ?auto_26749 ?auto_26785 ) ) ( IS-CRATE ?auto_26748 ) ( AVAILABLE ?auto_26786 ) ( SURFACE-AT ?auto_26748 ?auto_26783 ) ( ON ?auto_26748 ?auto_26782 ) ( CLEAR ?auto_26748 ) ( not ( = ?auto_26747 ?auto_26748 ) ) ( not ( = ?auto_26747 ?auto_26782 ) ) ( not ( = ?auto_26748 ?auto_26782 ) ) ( SURFACE-AT ?auto_26746 ?auto_26760 ) ( CLEAR ?auto_26746 ) ( IS-CRATE ?auto_26747 ) ( AVAILABLE ?auto_26765 ) ( not ( = ?auto_26773 ?auto_26760 ) ) ( HOIST-AT ?auto_26784 ?auto_26773 ) ( AVAILABLE ?auto_26784 ) ( SURFACE-AT ?auto_26747 ?auto_26773 ) ( ON ?auto_26747 ?auto_26797 ) ( CLEAR ?auto_26747 ) ( TRUCK-AT ?auto_26761 ?auto_26760 ) ( not ( = ?auto_26746 ?auto_26747 ) ) ( not ( = ?auto_26746 ?auto_26797 ) ) ( not ( = ?auto_26747 ?auto_26797 ) ) ( not ( = ?auto_26765 ?auto_26784 ) ) ( not ( = ?auto_26746 ?auto_26748 ) ) ( not ( = ?auto_26746 ?auto_26782 ) ) ( not ( = ?auto_26748 ?auto_26797 ) ) ( not ( = ?auto_26783 ?auto_26773 ) ) ( not ( = ?auto_26786 ?auto_26784 ) ) ( not ( = ?auto_26782 ?auto_26797 ) ) ( not ( = ?auto_26746 ?auto_26749 ) ) ( not ( = ?auto_26746 ?auto_26785 ) ) ( not ( = ?auto_26747 ?auto_26749 ) ) ( not ( = ?auto_26747 ?auto_26785 ) ) ( not ( = ?auto_26749 ?auto_26782 ) ) ( not ( = ?auto_26749 ?auto_26797 ) ) ( not ( = ?auto_26795 ?auto_26783 ) ) ( not ( = ?auto_26795 ?auto_26773 ) ) ( not ( = ?auto_26774 ?auto_26786 ) ) ( not ( = ?auto_26774 ?auto_26784 ) ) ( not ( = ?auto_26785 ?auto_26782 ) ) ( not ( = ?auto_26785 ?auto_26797 ) ) ( not ( = ?auto_26746 ?auto_26750 ) ) ( not ( = ?auto_26746 ?auto_26791 ) ) ( not ( = ?auto_26747 ?auto_26750 ) ) ( not ( = ?auto_26747 ?auto_26791 ) ) ( not ( = ?auto_26748 ?auto_26750 ) ) ( not ( = ?auto_26748 ?auto_26791 ) ) ( not ( = ?auto_26750 ?auto_26785 ) ) ( not ( = ?auto_26750 ?auto_26782 ) ) ( not ( = ?auto_26750 ?auto_26797 ) ) ( not ( = ?auto_26780 ?auto_26795 ) ) ( not ( = ?auto_26780 ?auto_26783 ) ) ( not ( = ?auto_26780 ?auto_26773 ) ) ( not ( = ?auto_26777 ?auto_26774 ) ) ( not ( = ?auto_26777 ?auto_26786 ) ) ( not ( = ?auto_26777 ?auto_26784 ) ) ( not ( = ?auto_26791 ?auto_26785 ) ) ( not ( = ?auto_26791 ?auto_26782 ) ) ( not ( = ?auto_26791 ?auto_26797 ) ) ( not ( = ?auto_26746 ?auto_26751 ) ) ( not ( = ?auto_26746 ?auto_26796 ) ) ( not ( = ?auto_26747 ?auto_26751 ) ) ( not ( = ?auto_26747 ?auto_26796 ) ) ( not ( = ?auto_26748 ?auto_26751 ) ) ( not ( = ?auto_26748 ?auto_26796 ) ) ( not ( = ?auto_26749 ?auto_26751 ) ) ( not ( = ?auto_26749 ?auto_26796 ) ) ( not ( = ?auto_26751 ?auto_26791 ) ) ( not ( = ?auto_26751 ?auto_26785 ) ) ( not ( = ?auto_26751 ?auto_26782 ) ) ( not ( = ?auto_26751 ?auto_26797 ) ) ( not ( = ?auto_26790 ?auto_26780 ) ) ( not ( = ?auto_26790 ?auto_26795 ) ) ( not ( = ?auto_26790 ?auto_26783 ) ) ( not ( = ?auto_26790 ?auto_26773 ) ) ( not ( = ?auto_26789 ?auto_26777 ) ) ( not ( = ?auto_26789 ?auto_26774 ) ) ( not ( = ?auto_26789 ?auto_26786 ) ) ( not ( = ?auto_26789 ?auto_26784 ) ) ( not ( = ?auto_26796 ?auto_26791 ) ) ( not ( = ?auto_26796 ?auto_26785 ) ) ( not ( = ?auto_26796 ?auto_26782 ) ) ( not ( = ?auto_26796 ?auto_26797 ) ) ( not ( = ?auto_26746 ?auto_26754 ) ) ( not ( = ?auto_26746 ?auto_26768 ) ) ( not ( = ?auto_26747 ?auto_26754 ) ) ( not ( = ?auto_26747 ?auto_26768 ) ) ( not ( = ?auto_26748 ?auto_26754 ) ) ( not ( = ?auto_26748 ?auto_26768 ) ) ( not ( = ?auto_26749 ?auto_26754 ) ) ( not ( = ?auto_26749 ?auto_26768 ) ) ( not ( = ?auto_26750 ?auto_26754 ) ) ( not ( = ?auto_26750 ?auto_26768 ) ) ( not ( = ?auto_26754 ?auto_26796 ) ) ( not ( = ?auto_26754 ?auto_26791 ) ) ( not ( = ?auto_26754 ?auto_26785 ) ) ( not ( = ?auto_26754 ?auto_26782 ) ) ( not ( = ?auto_26754 ?auto_26797 ) ) ( not ( = ?auto_26792 ?auto_26790 ) ) ( not ( = ?auto_26792 ?auto_26780 ) ) ( not ( = ?auto_26792 ?auto_26795 ) ) ( not ( = ?auto_26792 ?auto_26783 ) ) ( not ( = ?auto_26792 ?auto_26773 ) ) ( not ( = ?auto_26776 ?auto_26789 ) ) ( not ( = ?auto_26776 ?auto_26777 ) ) ( not ( = ?auto_26776 ?auto_26774 ) ) ( not ( = ?auto_26776 ?auto_26786 ) ) ( not ( = ?auto_26776 ?auto_26784 ) ) ( not ( = ?auto_26768 ?auto_26796 ) ) ( not ( = ?auto_26768 ?auto_26791 ) ) ( not ( = ?auto_26768 ?auto_26785 ) ) ( not ( = ?auto_26768 ?auto_26782 ) ) ( not ( = ?auto_26768 ?auto_26797 ) ) ( not ( = ?auto_26746 ?auto_26753 ) ) ( not ( = ?auto_26746 ?auto_26781 ) ) ( not ( = ?auto_26747 ?auto_26753 ) ) ( not ( = ?auto_26747 ?auto_26781 ) ) ( not ( = ?auto_26748 ?auto_26753 ) ) ( not ( = ?auto_26748 ?auto_26781 ) ) ( not ( = ?auto_26749 ?auto_26753 ) ) ( not ( = ?auto_26749 ?auto_26781 ) ) ( not ( = ?auto_26750 ?auto_26753 ) ) ( not ( = ?auto_26750 ?auto_26781 ) ) ( not ( = ?auto_26751 ?auto_26753 ) ) ( not ( = ?auto_26751 ?auto_26781 ) ) ( not ( = ?auto_26753 ?auto_26768 ) ) ( not ( = ?auto_26753 ?auto_26796 ) ) ( not ( = ?auto_26753 ?auto_26791 ) ) ( not ( = ?auto_26753 ?auto_26785 ) ) ( not ( = ?auto_26753 ?auto_26782 ) ) ( not ( = ?auto_26753 ?auto_26797 ) ) ( not ( = ?auto_26766 ?auto_26792 ) ) ( not ( = ?auto_26766 ?auto_26790 ) ) ( not ( = ?auto_26766 ?auto_26780 ) ) ( not ( = ?auto_26766 ?auto_26795 ) ) ( not ( = ?auto_26766 ?auto_26783 ) ) ( not ( = ?auto_26766 ?auto_26773 ) ) ( not ( = ?auto_26767 ?auto_26776 ) ) ( not ( = ?auto_26767 ?auto_26789 ) ) ( not ( = ?auto_26767 ?auto_26777 ) ) ( not ( = ?auto_26767 ?auto_26774 ) ) ( not ( = ?auto_26767 ?auto_26786 ) ) ( not ( = ?auto_26767 ?auto_26784 ) ) ( not ( = ?auto_26781 ?auto_26768 ) ) ( not ( = ?auto_26781 ?auto_26796 ) ) ( not ( = ?auto_26781 ?auto_26791 ) ) ( not ( = ?auto_26781 ?auto_26785 ) ) ( not ( = ?auto_26781 ?auto_26782 ) ) ( not ( = ?auto_26781 ?auto_26797 ) ) ( not ( = ?auto_26746 ?auto_26752 ) ) ( not ( = ?auto_26746 ?auto_26771 ) ) ( not ( = ?auto_26747 ?auto_26752 ) ) ( not ( = ?auto_26747 ?auto_26771 ) ) ( not ( = ?auto_26748 ?auto_26752 ) ) ( not ( = ?auto_26748 ?auto_26771 ) ) ( not ( = ?auto_26749 ?auto_26752 ) ) ( not ( = ?auto_26749 ?auto_26771 ) ) ( not ( = ?auto_26750 ?auto_26752 ) ) ( not ( = ?auto_26750 ?auto_26771 ) ) ( not ( = ?auto_26751 ?auto_26752 ) ) ( not ( = ?auto_26751 ?auto_26771 ) ) ( not ( = ?auto_26754 ?auto_26752 ) ) ( not ( = ?auto_26754 ?auto_26771 ) ) ( not ( = ?auto_26752 ?auto_26781 ) ) ( not ( = ?auto_26752 ?auto_26768 ) ) ( not ( = ?auto_26752 ?auto_26796 ) ) ( not ( = ?auto_26752 ?auto_26791 ) ) ( not ( = ?auto_26752 ?auto_26785 ) ) ( not ( = ?auto_26752 ?auto_26782 ) ) ( not ( = ?auto_26752 ?auto_26797 ) ) ( not ( = ?auto_26771 ?auto_26781 ) ) ( not ( = ?auto_26771 ?auto_26768 ) ) ( not ( = ?auto_26771 ?auto_26796 ) ) ( not ( = ?auto_26771 ?auto_26791 ) ) ( not ( = ?auto_26771 ?auto_26785 ) ) ( not ( = ?auto_26771 ?auto_26782 ) ) ( not ( = ?auto_26771 ?auto_26797 ) ) ( not ( = ?auto_26746 ?auto_26755 ) ) ( not ( = ?auto_26746 ?auto_26779 ) ) ( not ( = ?auto_26747 ?auto_26755 ) ) ( not ( = ?auto_26747 ?auto_26779 ) ) ( not ( = ?auto_26748 ?auto_26755 ) ) ( not ( = ?auto_26748 ?auto_26779 ) ) ( not ( = ?auto_26749 ?auto_26755 ) ) ( not ( = ?auto_26749 ?auto_26779 ) ) ( not ( = ?auto_26750 ?auto_26755 ) ) ( not ( = ?auto_26750 ?auto_26779 ) ) ( not ( = ?auto_26751 ?auto_26755 ) ) ( not ( = ?auto_26751 ?auto_26779 ) ) ( not ( = ?auto_26754 ?auto_26755 ) ) ( not ( = ?auto_26754 ?auto_26779 ) ) ( not ( = ?auto_26753 ?auto_26755 ) ) ( not ( = ?auto_26753 ?auto_26779 ) ) ( not ( = ?auto_26755 ?auto_26771 ) ) ( not ( = ?auto_26755 ?auto_26781 ) ) ( not ( = ?auto_26755 ?auto_26768 ) ) ( not ( = ?auto_26755 ?auto_26796 ) ) ( not ( = ?auto_26755 ?auto_26791 ) ) ( not ( = ?auto_26755 ?auto_26785 ) ) ( not ( = ?auto_26755 ?auto_26782 ) ) ( not ( = ?auto_26755 ?auto_26797 ) ) ( not ( = ?auto_26779 ?auto_26771 ) ) ( not ( = ?auto_26779 ?auto_26781 ) ) ( not ( = ?auto_26779 ?auto_26768 ) ) ( not ( = ?auto_26779 ?auto_26796 ) ) ( not ( = ?auto_26779 ?auto_26791 ) ) ( not ( = ?auto_26779 ?auto_26785 ) ) ( not ( = ?auto_26779 ?auto_26782 ) ) ( not ( = ?auto_26779 ?auto_26797 ) ) ( not ( = ?auto_26746 ?auto_26757 ) ) ( not ( = ?auto_26746 ?auto_26793 ) ) ( not ( = ?auto_26747 ?auto_26757 ) ) ( not ( = ?auto_26747 ?auto_26793 ) ) ( not ( = ?auto_26748 ?auto_26757 ) ) ( not ( = ?auto_26748 ?auto_26793 ) ) ( not ( = ?auto_26749 ?auto_26757 ) ) ( not ( = ?auto_26749 ?auto_26793 ) ) ( not ( = ?auto_26750 ?auto_26757 ) ) ( not ( = ?auto_26750 ?auto_26793 ) ) ( not ( = ?auto_26751 ?auto_26757 ) ) ( not ( = ?auto_26751 ?auto_26793 ) ) ( not ( = ?auto_26754 ?auto_26757 ) ) ( not ( = ?auto_26754 ?auto_26793 ) ) ( not ( = ?auto_26753 ?auto_26757 ) ) ( not ( = ?auto_26753 ?auto_26793 ) ) ( not ( = ?auto_26752 ?auto_26757 ) ) ( not ( = ?auto_26752 ?auto_26793 ) ) ( not ( = ?auto_26757 ?auto_26779 ) ) ( not ( = ?auto_26757 ?auto_26771 ) ) ( not ( = ?auto_26757 ?auto_26781 ) ) ( not ( = ?auto_26757 ?auto_26768 ) ) ( not ( = ?auto_26757 ?auto_26796 ) ) ( not ( = ?auto_26757 ?auto_26791 ) ) ( not ( = ?auto_26757 ?auto_26785 ) ) ( not ( = ?auto_26757 ?auto_26782 ) ) ( not ( = ?auto_26757 ?auto_26797 ) ) ( not ( = ?auto_26794 ?auto_26795 ) ) ( not ( = ?auto_26794 ?auto_26783 ) ) ( not ( = ?auto_26794 ?auto_26766 ) ) ( not ( = ?auto_26794 ?auto_26792 ) ) ( not ( = ?auto_26794 ?auto_26790 ) ) ( not ( = ?auto_26794 ?auto_26780 ) ) ( not ( = ?auto_26794 ?auto_26773 ) ) ( not ( = ?auto_26770 ?auto_26774 ) ) ( not ( = ?auto_26770 ?auto_26786 ) ) ( not ( = ?auto_26770 ?auto_26767 ) ) ( not ( = ?auto_26770 ?auto_26776 ) ) ( not ( = ?auto_26770 ?auto_26789 ) ) ( not ( = ?auto_26770 ?auto_26777 ) ) ( not ( = ?auto_26770 ?auto_26784 ) ) ( not ( = ?auto_26793 ?auto_26779 ) ) ( not ( = ?auto_26793 ?auto_26771 ) ) ( not ( = ?auto_26793 ?auto_26781 ) ) ( not ( = ?auto_26793 ?auto_26768 ) ) ( not ( = ?auto_26793 ?auto_26796 ) ) ( not ( = ?auto_26793 ?auto_26791 ) ) ( not ( = ?auto_26793 ?auto_26785 ) ) ( not ( = ?auto_26793 ?auto_26782 ) ) ( not ( = ?auto_26793 ?auto_26797 ) ) ( not ( = ?auto_26746 ?auto_26756 ) ) ( not ( = ?auto_26746 ?auto_26788 ) ) ( not ( = ?auto_26747 ?auto_26756 ) ) ( not ( = ?auto_26747 ?auto_26788 ) ) ( not ( = ?auto_26748 ?auto_26756 ) ) ( not ( = ?auto_26748 ?auto_26788 ) ) ( not ( = ?auto_26749 ?auto_26756 ) ) ( not ( = ?auto_26749 ?auto_26788 ) ) ( not ( = ?auto_26750 ?auto_26756 ) ) ( not ( = ?auto_26750 ?auto_26788 ) ) ( not ( = ?auto_26751 ?auto_26756 ) ) ( not ( = ?auto_26751 ?auto_26788 ) ) ( not ( = ?auto_26754 ?auto_26756 ) ) ( not ( = ?auto_26754 ?auto_26788 ) ) ( not ( = ?auto_26753 ?auto_26756 ) ) ( not ( = ?auto_26753 ?auto_26788 ) ) ( not ( = ?auto_26752 ?auto_26756 ) ) ( not ( = ?auto_26752 ?auto_26788 ) ) ( not ( = ?auto_26755 ?auto_26756 ) ) ( not ( = ?auto_26755 ?auto_26788 ) ) ( not ( = ?auto_26756 ?auto_26793 ) ) ( not ( = ?auto_26756 ?auto_26779 ) ) ( not ( = ?auto_26756 ?auto_26771 ) ) ( not ( = ?auto_26756 ?auto_26781 ) ) ( not ( = ?auto_26756 ?auto_26768 ) ) ( not ( = ?auto_26756 ?auto_26796 ) ) ( not ( = ?auto_26756 ?auto_26791 ) ) ( not ( = ?auto_26756 ?auto_26785 ) ) ( not ( = ?auto_26756 ?auto_26782 ) ) ( not ( = ?auto_26756 ?auto_26797 ) ) ( not ( = ?auto_26778 ?auto_26794 ) ) ( not ( = ?auto_26778 ?auto_26795 ) ) ( not ( = ?auto_26778 ?auto_26783 ) ) ( not ( = ?auto_26778 ?auto_26766 ) ) ( not ( = ?auto_26778 ?auto_26792 ) ) ( not ( = ?auto_26778 ?auto_26790 ) ) ( not ( = ?auto_26778 ?auto_26780 ) ) ( not ( = ?auto_26778 ?auto_26773 ) ) ( not ( = ?auto_26775 ?auto_26770 ) ) ( not ( = ?auto_26775 ?auto_26774 ) ) ( not ( = ?auto_26775 ?auto_26786 ) ) ( not ( = ?auto_26775 ?auto_26767 ) ) ( not ( = ?auto_26775 ?auto_26776 ) ) ( not ( = ?auto_26775 ?auto_26789 ) ) ( not ( = ?auto_26775 ?auto_26777 ) ) ( not ( = ?auto_26775 ?auto_26784 ) ) ( not ( = ?auto_26788 ?auto_26793 ) ) ( not ( = ?auto_26788 ?auto_26779 ) ) ( not ( = ?auto_26788 ?auto_26771 ) ) ( not ( = ?auto_26788 ?auto_26781 ) ) ( not ( = ?auto_26788 ?auto_26768 ) ) ( not ( = ?auto_26788 ?auto_26796 ) ) ( not ( = ?auto_26788 ?auto_26791 ) ) ( not ( = ?auto_26788 ?auto_26785 ) ) ( not ( = ?auto_26788 ?auto_26782 ) ) ( not ( = ?auto_26788 ?auto_26797 ) ) ( not ( = ?auto_26746 ?auto_26758 ) ) ( not ( = ?auto_26746 ?auto_26787 ) ) ( not ( = ?auto_26747 ?auto_26758 ) ) ( not ( = ?auto_26747 ?auto_26787 ) ) ( not ( = ?auto_26748 ?auto_26758 ) ) ( not ( = ?auto_26748 ?auto_26787 ) ) ( not ( = ?auto_26749 ?auto_26758 ) ) ( not ( = ?auto_26749 ?auto_26787 ) ) ( not ( = ?auto_26750 ?auto_26758 ) ) ( not ( = ?auto_26750 ?auto_26787 ) ) ( not ( = ?auto_26751 ?auto_26758 ) ) ( not ( = ?auto_26751 ?auto_26787 ) ) ( not ( = ?auto_26754 ?auto_26758 ) ) ( not ( = ?auto_26754 ?auto_26787 ) ) ( not ( = ?auto_26753 ?auto_26758 ) ) ( not ( = ?auto_26753 ?auto_26787 ) ) ( not ( = ?auto_26752 ?auto_26758 ) ) ( not ( = ?auto_26752 ?auto_26787 ) ) ( not ( = ?auto_26755 ?auto_26758 ) ) ( not ( = ?auto_26755 ?auto_26787 ) ) ( not ( = ?auto_26757 ?auto_26758 ) ) ( not ( = ?auto_26757 ?auto_26787 ) ) ( not ( = ?auto_26758 ?auto_26788 ) ) ( not ( = ?auto_26758 ?auto_26793 ) ) ( not ( = ?auto_26758 ?auto_26779 ) ) ( not ( = ?auto_26758 ?auto_26771 ) ) ( not ( = ?auto_26758 ?auto_26781 ) ) ( not ( = ?auto_26758 ?auto_26768 ) ) ( not ( = ?auto_26758 ?auto_26796 ) ) ( not ( = ?auto_26758 ?auto_26791 ) ) ( not ( = ?auto_26758 ?auto_26785 ) ) ( not ( = ?auto_26758 ?auto_26782 ) ) ( not ( = ?auto_26758 ?auto_26797 ) ) ( not ( = ?auto_26772 ?auto_26778 ) ) ( not ( = ?auto_26772 ?auto_26794 ) ) ( not ( = ?auto_26772 ?auto_26795 ) ) ( not ( = ?auto_26772 ?auto_26783 ) ) ( not ( = ?auto_26772 ?auto_26766 ) ) ( not ( = ?auto_26772 ?auto_26792 ) ) ( not ( = ?auto_26772 ?auto_26790 ) ) ( not ( = ?auto_26772 ?auto_26780 ) ) ( not ( = ?auto_26772 ?auto_26773 ) ) ( not ( = ?auto_26769 ?auto_26775 ) ) ( not ( = ?auto_26769 ?auto_26770 ) ) ( not ( = ?auto_26769 ?auto_26774 ) ) ( not ( = ?auto_26769 ?auto_26786 ) ) ( not ( = ?auto_26769 ?auto_26767 ) ) ( not ( = ?auto_26769 ?auto_26776 ) ) ( not ( = ?auto_26769 ?auto_26789 ) ) ( not ( = ?auto_26769 ?auto_26777 ) ) ( not ( = ?auto_26769 ?auto_26784 ) ) ( not ( = ?auto_26787 ?auto_26788 ) ) ( not ( = ?auto_26787 ?auto_26793 ) ) ( not ( = ?auto_26787 ?auto_26779 ) ) ( not ( = ?auto_26787 ?auto_26771 ) ) ( not ( = ?auto_26787 ?auto_26781 ) ) ( not ( = ?auto_26787 ?auto_26768 ) ) ( not ( = ?auto_26787 ?auto_26796 ) ) ( not ( = ?auto_26787 ?auto_26791 ) ) ( not ( = ?auto_26787 ?auto_26785 ) ) ( not ( = ?auto_26787 ?auto_26782 ) ) ( not ( = ?auto_26787 ?auto_26797 ) ) ( not ( = ?auto_26746 ?auto_26759 ) ) ( not ( = ?auto_26746 ?auto_26763 ) ) ( not ( = ?auto_26747 ?auto_26759 ) ) ( not ( = ?auto_26747 ?auto_26763 ) ) ( not ( = ?auto_26748 ?auto_26759 ) ) ( not ( = ?auto_26748 ?auto_26763 ) ) ( not ( = ?auto_26749 ?auto_26759 ) ) ( not ( = ?auto_26749 ?auto_26763 ) ) ( not ( = ?auto_26750 ?auto_26759 ) ) ( not ( = ?auto_26750 ?auto_26763 ) ) ( not ( = ?auto_26751 ?auto_26759 ) ) ( not ( = ?auto_26751 ?auto_26763 ) ) ( not ( = ?auto_26754 ?auto_26759 ) ) ( not ( = ?auto_26754 ?auto_26763 ) ) ( not ( = ?auto_26753 ?auto_26759 ) ) ( not ( = ?auto_26753 ?auto_26763 ) ) ( not ( = ?auto_26752 ?auto_26759 ) ) ( not ( = ?auto_26752 ?auto_26763 ) ) ( not ( = ?auto_26755 ?auto_26759 ) ) ( not ( = ?auto_26755 ?auto_26763 ) ) ( not ( = ?auto_26757 ?auto_26759 ) ) ( not ( = ?auto_26757 ?auto_26763 ) ) ( not ( = ?auto_26756 ?auto_26759 ) ) ( not ( = ?auto_26756 ?auto_26763 ) ) ( not ( = ?auto_26759 ?auto_26787 ) ) ( not ( = ?auto_26759 ?auto_26788 ) ) ( not ( = ?auto_26759 ?auto_26793 ) ) ( not ( = ?auto_26759 ?auto_26779 ) ) ( not ( = ?auto_26759 ?auto_26771 ) ) ( not ( = ?auto_26759 ?auto_26781 ) ) ( not ( = ?auto_26759 ?auto_26768 ) ) ( not ( = ?auto_26759 ?auto_26796 ) ) ( not ( = ?auto_26759 ?auto_26791 ) ) ( not ( = ?auto_26759 ?auto_26785 ) ) ( not ( = ?auto_26759 ?auto_26782 ) ) ( not ( = ?auto_26759 ?auto_26797 ) ) ( not ( = ?auto_26764 ?auto_26772 ) ) ( not ( = ?auto_26764 ?auto_26778 ) ) ( not ( = ?auto_26764 ?auto_26794 ) ) ( not ( = ?auto_26764 ?auto_26795 ) ) ( not ( = ?auto_26764 ?auto_26783 ) ) ( not ( = ?auto_26764 ?auto_26766 ) ) ( not ( = ?auto_26764 ?auto_26792 ) ) ( not ( = ?auto_26764 ?auto_26790 ) ) ( not ( = ?auto_26764 ?auto_26780 ) ) ( not ( = ?auto_26764 ?auto_26773 ) ) ( not ( = ?auto_26762 ?auto_26769 ) ) ( not ( = ?auto_26762 ?auto_26775 ) ) ( not ( = ?auto_26762 ?auto_26770 ) ) ( not ( = ?auto_26762 ?auto_26774 ) ) ( not ( = ?auto_26762 ?auto_26786 ) ) ( not ( = ?auto_26762 ?auto_26767 ) ) ( not ( = ?auto_26762 ?auto_26776 ) ) ( not ( = ?auto_26762 ?auto_26789 ) ) ( not ( = ?auto_26762 ?auto_26777 ) ) ( not ( = ?auto_26762 ?auto_26784 ) ) ( not ( = ?auto_26763 ?auto_26787 ) ) ( not ( = ?auto_26763 ?auto_26788 ) ) ( not ( = ?auto_26763 ?auto_26793 ) ) ( not ( = ?auto_26763 ?auto_26779 ) ) ( not ( = ?auto_26763 ?auto_26771 ) ) ( not ( = ?auto_26763 ?auto_26781 ) ) ( not ( = ?auto_26763 ?auto_26768 ) ) ( not ( = ?auto_26763 ?auto_26796 ) ) ( not ( = ?auto_26763 ?auto_26791 ) ) ( not ( = ?auto_26763 ?auto_26785 ) ) ( not ( = ?auto_26763 ?auto_26782 ) ) ( not ( = ?auto_26763 ?auto_26797 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_26746 ?auto_26747 ?auto_26748 ?auto_26749 ?auto_26750 ?auto_26751 ?auto_26754 ?auto_26753 ?auto_26752 ?auto_26755 ?auto_26757 ?auto_26756 ?auto_26758 )
      ( MAKE-1CRATE ?auto_26758 ?auto_26759 )
      ( MAKE-13CRATE-VERIFY ?auto_26746 ?auto_26747 ?auto_26748 ?auto_26749 ?auto_26750 ?auto_26751 ?auto_26754 ?auto_26753 ?auto_26752 ?auto_26755 ?auto_26757 ?auto_26756 ?auto_26758 ?auto_26759 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26800 - SURFACE
      ?auto_26801 - SURFACE
    )
    :vars
    (
      ?auto_26802 - HOIST
      ?auto_26803 - PLACE
      ?auto_26805 - PLACE
      ?auto_26806 - HOIST
      ?auto_26807 - SURFACE
      ?auto_26804 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26802 ?auto_26803 ) ( SURFACE-AT ?auto_26800 ?auto_26803 ) ( CLEAR ?auto_26800 ) ( IS-CRATE ?auto_26801 ) ( AVAILABLE ?auto_26802 ) ( not ( = ?auto_26805 ?auto_26803 ) ) ( HOIST-AT ?auto_26806 ?auto_26805 ) ( AVAILABLE ?auto_26806 ) ( SURFACE-AT ?auto_26801 ?auto_26805 ) ( ON ?auto_26801 ?auto_26807 ) ( CLEAR ?auto_26801 ) ( TRUCK-AT ?auto_26804 ?auto_26803 ) ( not ( = ?auto_26800 ?auto_26801 ) ) ( not ( = ?auto_26800 ?auto_26807 ) ) ( not ( = ?auto_26801 ?auto_26807 ) ) ( not ( = ?auto_26802 ?auto_26806 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26804 ?auto_26803 ?auto_26805 )
      ( !LIFT ?auto_26806 ?auto_26801 ?auto_26807 ?auto_26805 )
      ( !LOAD ?auto_26806 ?auto_26801 ?auto_26804 ?auto_26805 )
      ( !DRIVE ?auto_26804 ?auto_26805 ?auto_26803 )
      ( !UNLOAD ?auto_26802 ?auto_26801 ?auto_26804 ?auto_26803 )
      ( !DROP ?auto_26802 ?auto_26801 ?auto_26800 ?auto_26803 )
      ( MAKE-1CRATE-VERIFY ?auto_26800 ?auto_26801 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_26823 - SURFACE
      ?auto_26824 - SURFACE
      ?auto_26825 - SURFACE
      ?auto_26826 - SURFACE
      ?auto_26827 - SURFACE
      ?auto_26828 - SURFACE
      ?auto_26831 - SURFACE
      ?auto_26830 - SURFACE
      ?auto_26829 - SURFACE
      ?auto_26832 - SURFACE
      ?auto_26834 - SURFACE
      ?auto_26833 - SURFACE
      ?auto_26835 - SURFACE
      ?auto_26837 - SURFACE
      ?auto_26836 - SURFACE
    )
    :vars
    (
      ?auto_26841 - HOIST
      ?auto_26840 - PLACE
      ?auto_26842 - PLACE
      ?auto_26839 - HOIST
      ?auto_26838 - SURFACE
      ?auto_26867 - PLACE
      ?auto_26868 - HOIST
      ?auto_26863 - SURFACE
      ?auto_26858 - PLACE
      ?auto_26847 - HOIST
      ?auto_26859 - SURFACE
      ?auto_26855 - PLACE
      ?auto_26873 - HOIST
      ?auto_26866 - SURFACE
      ?auto_26846 - PLACE
      ?auto_26852 - HOIST
      ?auto_26871 - SURFACE
      ?auto_26844 - PLACE
      ?auto_26850 - HOIST
      ?auto_26872 - SURFACE
      ?auto_26851 - SURFACE
      ?auto_26876 - PLACE
      ?auto_26848 - HOIST
      ?auto_26861 - SURFACE
      ?auto_26864 - PLACE
      ?auto_26856 - HOIST
      ?auto_26869 - SURFACE
      ?auto_26845 - PLACE
      ?auto_26874 - HOIST
      ?auto_26865 - SURFACE
      ?auto_26857 - PLACE
      ?auto_26870 - HOIST
      ?auto_26875 - SURFACE
      ?auto_26853 - SURFACE
      ?auto_26860 - SURFACE
      ?auto_26862 - PLACE
      ?auto_26854 - HOIST
      ?auto_26849 - SURFACE
      ?auto_26843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26841 ?auto_26840 ) ( IS-CRATE ?auto_26836 ) ( not ( = ?auto_26842 ?auto_26840 ) ) ( HOIST-AT ?auto_26839 ?auto_26842 ) ( SURFACE-AT ?auto_26836 ?auto_26842 ) ( ON ?auto_26836 ?auto_26838 ) ( CLEAR ?auto_26836 ) ( not ( = ?auto_26837 ?auto_26836 ) ) ( not ( = ?auto_26837 ?auto_26838 ) ) ( not ( = ?auto_26836 ?auto_26838 ) ) ( not ( = ?auto_26841 ?auto_26839 ) ) ( IS-CRATE ?auto_26837 ) ( not ( = ?auto_26867 ?auto_26840 ) ) ( HOIST-AT ?auto_26868 ?auto_26867 ) ( AVAILABLE ?auto_26868 ) ( SURFACE-AT ?auto_26837 ?auto_26867 ) ( ON ?auto_26837 ?auto_26863 ) ( CLEAR ?auto_26837 ) ( not ( = ?auto_26835 ?auto_26837 ) ) ( not ( = ?auto_26835 ?auto_26863 ) ) ( not ( = ?auto_26837 ?auto_26863 ) ) ( not ( = ?auto_26841 ?auto_26868 ) ) ( IS-CRATE ?auto_26835 ) ( not ( = ?auto_26858 ?auto_26840 ) ) ( HOIST-AT ?auto_26847 ?auto_26858 ) ( AVAILABLE ?auto_26847 ) ( SURFACE-AT ?auto_26835 ?auto_26858 ) ( ON ?auto_26835 ?auto_26859 ) ( CLEAR ?auto_26835 ) ( not ( = ?auto_26833 ?auto_26835 ) ) ( not ( = ?auto_26833 ?auto_26859 ) ) ( not ( = ?auto_26835 ?auto_26859 ) ) ( not ( = ?auto_26841 ?auto_26847 ) ) ( IS-CRATE ?auto_26833 ) ( not ( = ?auto_26855 ?auto_26840 ) ) ( HOIST-AT ?auto_26873 ?auto_26855 ) ( AVAILABLE ?auto_26873 ) ( SURFACE-AT ?auto_26833 ?auto_26855 ) ( ON ?auto_26833 ?auto_26866 ) ( CLEAR ?auto_26833 ) ( not ( = ?auto_26834 ?auto_26833 ) ) ( not ( = ?auto_26834 ?auto_26866 ) ) ( not ( = ?auto_26833 ?auto_26866 ) ) ( not ( = ?auto_26841 ?auto_26873 ) ) ( IS-CRATE ?auto_26834 ) ( not ( = ?auto_26846 ?auto_26840 ) ) ( HOIST-AT ?auto_26852 ?auto_26846 ) ( AVAILABLE ?auto_26852 ) ( SURFACE-AT ?auto_26834 ?auto_26846 ) ( ON ?auto_26834 ?auto_26871 ) ( CLEAR ?auto_26834 ) ( not ( = ?auto_26832 ?auto_26834 ) ) ( not ( = ?auto_26832 ?auto_26871 ) ) ( not ( = ?auto_26834 ?auto_26871 ) ) ( not ( = ?auto_26841 ?auto_26852 ) ) ( IS-CRATE ?auto_26832 ) ( not ( = ?auto_26844 ?auto_26840 ) ) ( HOIST-AT ?auto_26850 ?auto_26844 ) ( SURFACE-AT ?auto_26832 ?auto_26844 ) ( ON ?auto_26832 ?auto_26872 ) ( CLEAR ?auto_26832 ) ( not ( = ?auto_26829 ?auto_26832 ) ) ( not ( = ?auto_26829 ?auto_26872 ) ) ( not ( = ?auto_26832 ?auto_26872 ) ) ( not ( = ?auto_26841 ?auto_26850 ) ) ( IS-CRATE ?auto_26829 ) ( SURFACE-AT ?auto_26829 ?auto_26842 ) ( ON ?auto_26829 ?auto_26851 ) ( CLEAR ?auto_26829 ) ( not ( = ?auto_26830 ?auto_26829 ) ) ( not ( = ?auto_26830 ?auto_26851 ) ) ( not ( = ?auto_26829 ?auto_26851 ) ) ( IS-CRATE ?auto_26830 ) ( not ( = ?auto_26876 ?auto_26840 ) ) ( HOIST-AT ?auto_26848 ?auto_26876 ) ( AVAILABLE ?auto_26848 ) ( SURFACE-AT ?auto_26830 ?auto_26876 ) ( ON ?auto_26830 ?auto_26861 ) ( CLEAR ?auto_26830 ) ( not ( = ?auto_26831 ?auto_26830 ) ) ( not ( = ?auto_26831 ?auto_26861 ) ) ( not ( = ?auto_26830 ?auto_26861 ) ) ( not ( = ?auto_26841 ?auto_26848 ) ) ( IS-CRATE ?auto_26831 ) ( not ( = ?auto_26864 ?auto_26840 ) ) ( HOIST-AT ?auto_26856 ?auto_26864 ) ( AVAILABLE ?auto_26856 ) ( SURFACE-AT ?auto_26831 ?auto_26864 ) ( ON ?auto_26831 ?auto_26869 ) ( CLEAR ?auto_26831 ) ( not ( = ?auto_26828 ?auto_26831 ) ) ( not ( = ?auto_26828 ?auto_26869 ) ) ( not ( = ?auto_26831 ?auto_26869 ) ) ( not ( = ?auto_26841 ?auto_26856 ) ) ( IS-CRATE ?auto_26828 ) ( not ( = ?auto_26845 ?auto_26840 ) ) ( HOIST-AT ?auto_26874 ?auto_26845 ) ( AVAILABLE ?auto_26874 ) ( SURFACE-AT ?auto_26828 ?auto_26845 ) ( ON ?auto_26828 ?auto_26865 ) ( CLEAR ?auto_26828 ) ( not ( = ?auto_26827 ?auto_26828 ) ) ( not ( = ?auto_26827 ?auto_26865 ) ) ( not ( = ?auto_26828 ?auto_26865 ) ) ( not ( = ?auto_26841 ?auto_26874 ) ) ( IS-CRATE ?auto_26827 ) ( not ( = ?auto_26857 ?auto_26840 ) ) ( HOIST-AT ?auto_26870 ?auto_26857 ) ( AVAILABLE ?auto_26870 ) ( SURFACE-AT ?auto_26827 ?auto_26857 ) ( ON ?auto_26827 ?auto_26875 ) ( CLEAR ?auto_26827 ) ( not ( = ?auto_26826 ?auto_26827 ) ) ( not ( = ?auto_26826 ?auto_26875 ) ) ( not ( = ?auto_26827 ?auto_26875 ) ) ( not ( = ?auto_26841 ?auto_26870 ) ) ( IS-CRATE ?auto_26826 ) ( AVAILABLE ?auto_26850 ) ( SURFACE-AT ?auto_26826 ?auto_26844 ) ( ON ?auto_26826 ?auto_26853 ) ( CLEAR ?auto_26826 ) ( not ( = ?auto_26825 ?auto_26826 ) ) ( not ( = ?auto_26825 ?auto_26853 ) ) ( not ( = ?auto_26826 ?auto_26853 ) ) ( IS-CRATE ?auto_26825 ) ( AVAILABLE ?auto_26839 ) ( SURFACE-AT ?auto_26825 ?auto_26842 ) ( ON ?auto_26825 ?auto_26860 ) ( CLEAR ?auto_26825 ) ( not ( = ?auto_26824 ?auto_26825 ) ) ( not ( = ?auto_26824 ?auto_26860 ) ) ( not ( = ?auto_26825 ?auto_26860 ) ) ( SURFACE-AT ?auto_26823 ?auto_26840 ) ( CLEAR ?auto_26823 ) ( IS-CRATE ?auto_26824 ) ( AVAILABLE ?auto_26841 ) ( not ( = ?auto_26862 ?auto_26840 ) ) ( HOIST-AT ?auto_26854 ?auto_26862 ) ( AVAILABLE ?auto_26854 ) ( SURFACE-AT ?auto_26824 ?auto_26862 ) ( ON ?auto_26824 ?auto_26849 ) ( CLEAR ?auto_26824 ) ( TRUCK-AT ?auto_26843 ?auto_26840 ) ( not ( = ?auto_26823 ?auto_26824 ) ) ( not ( = ?auto_26823 ?auto_26849 ) ) ( not ( = ?auto_26824 ?auto_26849 ) ) ( not ( = ?auto_26841 ?auto_26854 ) ) ( not ( = ?auto_26823 ?auto_26825 ) ) ( not ( = ?auto_26823 ?auto_26860 ) ) ( not ( = ?auto_26825 ?auto_26849 ) ) ( not ( = ?auto_26842 ?auto_26862 ) ) ( not ( = ?auto_26839 ?auto_26854 ) ) ( not ( = ?auto_26860 ?auto_26849 ) ) ( not ( = ?auto_26823 ?auto_26826 ) ) ( not ( = ?auto_26823 ?auto_26853 ) ) ( not ( = ?auto_26824 ?auto_26826 ) ) ( not ( = ?auto_26824 ?auto_26853 ) ) ( not ( = ?auto_26826 ?auto_26860 ) ) ( not ( = ?auto_26826 ?auto_26849 ) ) ( not ( = ?auto_26844 ?auto_26842 ) ) ( not ( = ?auto_26844 ?auto_26862 ) ) ( not ( = ?auto_26850 ?auto_26839 ) ) ( not ( = ?auto_26850 ?auto_26854 ) ) ( not ( = ?auto_26853 ?auto_26860 ) ) ( not ( = ?auto_26853 ?auto_26849 ) ) ( not ( = ?auto_26823 ?auto_26827 ) ) ( not ( = ?auto_26823 ?auto_26875 ) ) ( not ( = ?auto_26824 ?auto_26827 ) ) ( not ( = ?auto_26824 ?auto_26875 ) ) ( not ( = ?auto_26825 ?auto_26827 ) ) ( not ( = ?auto_26825 ?auto_26875 ) ) ( not ( = ?auto_26827 ?auto_26853 ) ) ( not ( = ?auto_26827 ?auto_26860 ) ) ( not ( = ?auto_26827 ?auto_26849 ) ) ( not ( = ?auto_26857 ?auto_26844 ) ) ( not ( = ?auto_26857 ?auto_26842 ) ) ( not ( = ?auto_26857 ?auto_26862 ) ) ( not ( = ?auto_26870 ?auto_26850 ) ) ( not ( = ?auto_26870 ?auto_26839 ) ) ( not ( = ?auto_26870 ?auto_26854 ) ) ( not ( = ?auto_26875 ?auto_26853 ) ) ( not ( = ?auto_26875 ?auto_26860 ) ) ( not ( = ?auto_26875 ?auto_26849 ) ) ( not ( = ?auto_26823 ?auto_26828 ) ) ( not ( = ?auto_26823 ?auto_26865 ) ) ( not ( = ?auto_26824 ?auto_26828 ) ) ( not ( = ?auto_26824 ?auto_26865 ) ) ( not ( = ?auto_26825 ?auto_26828 ) ) ( not ( = ?auto_26825 ?auto_26865 ) ) ( not ( = ?auto_26826 ?auto_26828 ) ) ( not ( = ?auto_26826 ?auto_26865 ) ) ( not ( = ?auto_26828 ?auto_26875 ) ) ( not ( = ?auto_26828 ?auto_26853 ) ) ( not ( = ?auto_26828 ?auto_26860 ) ) ( not ( = ?auto_26828 ?auto_26849 ) ) ( not ( = ?auto_26845 ?auto_26857 ) ) ( not ( = ?auto_26845 ?auto_26844 ) ) ( not ( = ?auto_26845 ?auto_26842 ) ) ( not ( = ?auto_26845 ?auto_26862 ) ) ( not ( = ?auto_26874 ?auto_26870 ) ) ( not ( = ?auto_26874 ?auto_26850 ) ) ( not ( = ?auto_26874 ?auto_26839 ) ) ( not ( = ?auto_26874 ?auto_26854 ) ) ( not ( = ?auto_26865 ?auto_26875 ) ) ( not ( = ?auto_26865 ?auto_26853 ) ) ( not ( = ?auto_26865 ?auto_26860 ) ) ( not ( = ?auto_26865 ?auto_26849 ) ) ( not ( = ?auto_26823 ?auto_26831 ) ) ( not ( = ?auto_26823 ?auto_26869 ) ) ( not ( = ?auto_26824 ?auto_26831 ) ) ( not ( = ?auto_26824 ?auto_26869 ) ) ( not ( = ?auto_26825 ?auto_26831 ) ) ( not ( = ?auto_26825 ?auto_26869 ) ) ( not ( = ?auto_26826 ?auto_26831 ) ) ( not ( = ?auto_26826 ?auto_26869 ) ) ( not ( = ?auto_26827 ?auto_26831 ) ) ( not ( = ?auto_26827 ?auto_26869 ) ) ( not ( = ?auto_26831 ?auto_26865 ) ) ( not ( = ?auto_26831 ?auto_26875 ) ) ( not ( = ?auto_26831 ?auto_26853 ) ) ( not ( = ?auto_26831 ?auto_26860 ) ) ( not ( = ?auto_26831 ?auto_26849 ) ) ( not ( = ?auto_26864 ?auto_26845 ) ) ( not ( = ?auto_26864 ?auto_26857 ) ) ( not ( = ?auto_26864 ?auto_26844 ) ) ( not ( = ?auto_26864 ?auto_26842 ) ) ( not ( = ?auto_26864 ?auto_26862 ) ) ( not ( = ?auto_26856 ?auto_26874 ) ) ( not ( = ?auto_26856 ?auto_26870 ) ) ( not ( = ?auto_26856 ?auto_26850 ) ) ( not ( = ?auto_26856 ?auto_26839 ) ) ( not ( = ?auto_26856 ?auto_26854 ) ) ( not ( = ?auto_26869 ?auto_26865 ) ) ( not ( = ?auto_26869 ?auto_26875 ) ) ( not ( = ?auto_26869 ?auto_26853 ) ) ( not ( = ?auto_26869 ?auto_26860 ) ) ( not ( = ?auto_26869 ?auto_26849 ) ) ( not ( = ?auto_26823 ?auto_26830 ) ) ( not ( = ?auto_26823 ?auto_26861 ) ) ( not ( = ?auto_26824 ?auto_26830 ) ) ( not ( = ?auto_26824 ?auto_26861 ) ) ( not ( = ?auto_26825 ?auto_26830 ) ) ( not ( = ?auto_26825 ?auto_26861 ) ) ( not ( = ?auto_26826 ?auto_26830 ) ) ( not ( = ?auto_26826 ?auto_26861 ) ) ( not ( = ?auto_26827 ?auto_26830 ) ) ( not ( = ?auto_26827 ?auto_26861 ) ) ( not ( = ?auto_26828 ?auto_26830 ) ) ( not ( = ?auto_26828 ?auto_26861 ) ) ( not ( = ?auto_26830 ?auto_26869 ) ) ( not ( = ?auto_26830 ?auto_26865 ) ) ( not ( = ?auto_26830 ?auto_26875 ) ) ( not ( = ?auto_26830 ?auto_26853 ) ) ( not ( = ?auto_26830 ?auto_26860 ) ) ( not ( = ?auto_26830 ?auto_26849 ) ) ( not ( = ?auto_26876 ?auto_26864 ) ) ( not ( = ?auto_26876 ?auto_26845 ) ) ( not ( = ?auto_26876 ?auto_26857 ) ) ( not ( = ?auto_26876 ?auto_26844 ) ) ( not ( = ?auto_26876 ?auto_26842 ) ) ( not ( = ?auto_26876 ?auto_26862 ) ) ( not ( = ?auto_26848 ?auto_26856 ) ) ( not ( = ?auto_26848 ?auto_26874 ) ) ( not ( = ?auto_26848 ?auto_26870 ) ) ( not ( = ?auto_26848 ?auto_26850 ) ) ( not ( = ?auto_26848 ?auto_26839 ) ) ( not ( = ?auto_26848 ?auto_26854 ) ) ( not ( = ?auto_26861 ?auto_26869 ) ) ( not ( = ?auto_26861 ?auto_26865 ) ) ( not ( = ?auto_26861 ?auto_26875 ) ) ( not ( = ?auto_26861 ?auto_26853 ) ) ( not ( = ?auto_26861 ?auto_26860 ) ) ( not ( = ?auto_26861 ?auto_26849 ) ) ( not ( = ?auto_26823 ?auto_26829 ) ) ( not ( = ?auto_26823 ?auto_26851 ) ) ( not ( = ?auto_26824 ?auto_26829 ) ) ( not ( = ?auto_26824 ?auto_26851 ) ) ( not ( = ?auto_26825 ?auto_26829 ) ) ( not ( = ?auto_26825 ?auto_26851 ) ) ( not ( = ?auto_26826 ?auto_26829 ) ) ( not ( = ?auto_26826 ?auto_26851 ) ) ( not ( = ?auto_26827 ?auto_26829 ) ) ( not ( = ?auto_26827 ?auto_26851 ) ) ( not ( = ?auto_26828 ?auto_26829 ) ) ( not ( = ?auto_26828 ?auto_26851 ) ) ( not ( = ?auto_26831 ?auto_26829 ) ) ( not ( = ?auto_26831 ?auto_26851 ) ) ( not ( = ?auto_26829 ?auto_26861 ) ) ( not ( = ?auto_26829 ?auto_26869 ) ) ( not ( = ?auto_26829 ?auto_26865 ) ) ( not ( = ?auto_26829 ?auto_26875 ) ) ( not ( = ?auto_26829 ?auto_26853 ) ) ( not ( = ?auto_26829 ?auto_26860 ) ) ( not ( = ?auto_26829 ?auto_26849 ) ) ( not ( = ?auto_26851 ?auto_26861 ) ) ( not ( = ?auto_26851 ?auto_26869 ) ) ( not ( = ?auto_26851 ?auto_26865 ) ) ( not ( = ?auto_26851 ?auto_26875 ) ) ( not ( = ?auto_26851 ?auto_26853 ) ) ( not ( = ?auto_26851 ?auto_26860 ) ) ( not ( = ?auto_26851 ?auto_26849 ) ) ( not ( = ?auto_26823 ?auto_26832 ) ) ( not ( = ?auto_26823 ?auto_26872 ) ) ( not ( = ?auto_26824 ?auto_26832 ) ) ( not ( = ?auto_26824 ?auto_26872 ) ) ( not ( = ?auto_26825 ?auto_26832 ) ) ( not ( = ?auto_26825 ?auto_26872 ) ) ( not ( = ?auto_26826 ?auto_26832 ) ) ( not ( = ?auto_26826 ?auto_26872 ) ) ( not ( = ?auto_26827 ?auto_26832 ) ) ( not ( = ?auto_26827 ?auto_26872 ) ) ( not ( = ?auto_26828 ?auto_26832 ) ) ( not ( = ?auto_26828 ?auto_26872 ) ) ( not ( = ?auto_26831 ?auto_26832 ) ) ( not ( = ?auto_26831 ?auto_26872 ) ) ( not ( = ?auto_26830 ?auto_26832 ) ) ( not ( = ?auto_26830 ?auto_26872 ) ) ( not ( = ?auto_26832 ?auto_26851 ) ) ( not ( = ?auto_26832 ?auto_26861 ) ) ( not ( = ?auto_26832 ?auto_26869 ) ) ( not ( = ?auto_26832 ?auto_26865 ) ) ( not ( = ?auto_26832 ?auto_26875 ) ) ( not ( = ?auto_26832 ?auto_26853 ) ) ( not ( = ?auto_26832 ?auto_26860 ) ) ( not ( = ?auto_26832 ?auto_26849 ) ) ( not ( = ?auto_26872 ?auto_26851 ) ) ( not ( = ?auto_26872 ?auto_26861 ) ) ( not ( = ?auto_26872 ?auto_26869 ) ) ( not ( = ?auto_26872 ?auto_26865 ) ) ( not ( = ?auto_26872 ?auto_26875 ) ) ( not ( = ?auto_26872 ?auto_26853 ) ) ( not ( = ?auto_26872 ?auto_26860 ) ) ( not ( = ?auto_26872 ?auto_26849 ) ) ( not ( = ?auto_26823 ?auto_26834 ) ) ( not ( = ?auto_26823 ?auto_26871 ) ) ( not ( = ?auto_26824 ?auto_26834 ) ) ( not ( = ?auto_26824 ?auto_26871 ) ) ( not ( = ?auto_26825 ?auto_26834 ) ) ( not ( = ?auto_26825 ?auto_26871 ) ) ( not ( = ?auto_26826 ?auto_26834 ) ) ( not ( = ?auto_26826 ?auto_26871 ) ) ( not ( = ?auto_26827 ?auto_26834 ) ) ( not ( = ?auto_26827 ?auto_26871 ) ) ( not ( = ?auto_26828 ?auto_26834 ) ) ( not ( = ?auto_26828 ?auto_26871 ) ) ( not ( = ?auto_26831 ?auto_26834 ) ) ( not ( = ?auto_26831 ?auto_26871 ) ) ( not ( = ?auto_26830 ?auto_26834 ) ) ( not ( = ?auto_26830 ?auto_26871 ) ) ( not ( = ?auto_26829 ?auto_26834 ) ) ( not ( = ?auto_26829 ?auto_26871 ) ) ( not ( = ?auto_26834 ?auto_26872 ) ) ( not ( = ?auto_26834 ?auto_26851 ) ) ( not ( = ?auto_26834 ?auto_26861 ) ) ( not ( = ?auto_26834 ?auto_26869 ) ) ( not ( = ?auto_26834 ?auto_26865 ) ) ( not ( = ?auto_26834 ?auto_26875 ) ) ( not ( = ?auto_26834 ?auto_26853 ) ) ( not ( = ?auto_26834 ?auto_26860 ) ) ( not ( = ?auto_26834 ?auto_26849 ) ) ( not ( = ?auto_26846 ?auto_26844 ) ) ( not ( = ?auto_26846 ?auto_26842 ) ) ( not ( = ?auto_26846 ?auto_26876 ) ) ( not ( = ?auto_26846 ?auto_26864 ) ) ( not ( = ?auto_26846 ?auto_26845 ) ) ( not ( = ?auto_26846 ?auto_26857 ) ) ( not ( = ?auto_26846 ?auto_26862 ) ) ( not ( = ?auto_26852 ?auto_26850 ) ) ( not ( = ?auto_26852 ?auto_26839 ) ) ( not ( = ?auto_26852 ?auto_26848 ) ) ( not ( = ?auto_26852 ?auto_26856 ) ) ( not ( = ?auto_26852 ?auto_26874 ) ) ( not ( = ?auto_26852 ?auto_26870 ) ) ( not ( = ?auto_26852 ?auto_26854 ) ) ( not ( = ?auto_26871 ?auto_26872 ) ) ( not ( = ?auto_26871 ?auto_26851 ) ) ( not ( = ?auto_26871 ?auto_26861 ) ) ( not ( = ?auto_26871 ?auto_26869 ) ) ( not ( = ?auto_26871 ?auto_26865 ) ) ( not ( = ?auto_26871 ?auto_26875 ) ) ( not ( = ?auto_26871 ?auto_26853 ) ) ( not ( = ?auto_26871 ?auto_26860 ) ) ( not ( = ?auto_26871 ?auto_26849 ) ) ( not ( = ?auto_26823 ?auto_26833 ) ) ( not ( = ?auto_26823 ?auto_26866 ) ) ( not ( = ?auto_26824 ?auto_26833 ) ) ( not ( = ?auto_26824 ?auto_26866 ) ) ( not ( = ?auto_26825 ?auto_26833 ) ) ( not ( = ?auto_26825 ?auto_26866 ) ) ( not ( = ?auto_26826 ?auto_26833 ) ) ( not ( = ?auto_26826 ?auto_26866 ) ) ( not ( = ?auto_26827 ?auto_26833 ) ) ( not ( = ?auto_26827 ?auto_26866 ) ) ( not ( = ?auto_26828 ?auto_26833 ) ) ( not ( = ?auto_26828 ?auto_26866 ) ) ( not ( = ?auto_26831 ?auto_26833 ) ) ( not ( = ?auto_26831 ?auto_26866 ) ) ( not ( = ?auto_26830 ?auto_26833 ) ) ( not ( = ?auto_26830 ?auto_26866 ) ) ( not ( = ?auto_26829 ?auto_26833 ) ) ( not ( = ?auto_26829 ?auto_26866 ) ) ( not ( = ?auto_26832 ?auto_26833 ) ) ( not ( = ?auto_26832 ?auto_26866 ) ) ( not ( = ?auto_26833 ?auto_26871 ) ) ( not ( = ?auto_26833 ?auto_26872 ) ) ( not ( = ?auto_26833 ?auto_26851 ) ) ( not ( = ?auto_26833 ?auto_26861 ) ) ( not ( = ?auto_26833 ?auto_26869 ) ) ( not ( = ?auto_26833 ?auto_26865 ) ) ( not ( = ?auto_26833 ?auto_26875 ) ) ( not ( = ?auto_26833 ?auto_26853 ) ) ( not ( = ?auto_26833 ?auto_26860 ) ) ( not ( = ?auto_26833 ?auto_26849 ) ) ( not ( = ?auto_26855 ?auto_26846 ) ) ( not ( = ?auto_26855 ?auto_26844 ) ) ( not ( = ?auto_26855 ?auto_26842 ) ) ( not ( = ?auto_26855 ?auto_26876 ) ) ( not ( = ?auto_26855 ?auto_26864 ) ) ( not ( = ?auto_26855 ?auto_26845 ) ) ( not ( = ?auto_26855 ?auto_26857 ) ) ( not ( = ?auto_26855 ?auto_26862 ) ) ( not ( = ?auto_26873 ?auto_26852 ) ) ( not ( = ?auto_26873 ?auto_26850 ) ) ( not ( = ?auto_26873 ?auto_26839 ) ) ( not ( = ?auto_26873 ?auto_26848 ) ) ( not ( = ?auto_26873 ?auto_26856 ) ) ( not ( = ?auto_26873 ?auto_26874 ) ) ( not ( = ?auto_26873 ?auto_26870 ) ) ( not ( = ?auto_26873 ?auto_26854 ) ) ( not ( = ?auto_26866 ?auto_26871 ) ) ( not ( = ?auto_26866 ?auto_26872 ) ) ( not ( = ?auto_26866 ?auto_26851 ) ) ( not ( = ?auto_26866 ?auto_26861 ) ) ( not ( = ?auto_26866 ?auto_26869 ) ) ( not ( = ?auto_26866 ?auto_26865 ) ) ( not ( = ?auto_26866 ?auto_26875 ) ) ( not ( = ?auto_26866 ?auto_26853 ) ) ( not ( = ?auto_26866 ?auto_26860 ) ) ( not ( = ?auto_26866 ?auto_26849 ) ) ( not ( = ?auto_26823 ?auto_26835 ) ) ( not ( = ?auto_26823 ?auto_26859 ) ) ( not ( = ?auto_26824 ?auto_26835 ) ) ( not ( = ?auto_26824 ?auto_26859 ) ) ( not ( = ?auto_26825 ?auto_26835 ) ) ( not ( = ?auto_26825 ?auto_26859 ) ) ( not ( = ?auto_26826 ?auto_26835 ) ) ( not ( = ?auto_26826 ?auto_26859 ) ) ( not ( = ?auto_26827 ?auto_26835 ) ) ( not ( = ?auto_26827 ?auto_26859 ) ) ( not ( = ?auto_26828 ?auto_26835 ) ) ( not ( = ?auto_26828 ?auto_26859 ) ) ( not ( = ?auto_26831 ?auto_26835 ) ) ( not ( = ?auto_26831 ?auto_26859 ) ) ( not ( = ?auto_26830 ?auto_26835 ) ) ( not ( = ?auto_26830 ?auto_26859 ) ) ( not ( = ?auto_26829 ?auto_26835 ) ) ( not ( = ?auto_26829 ?auto_26859 ) ) ( not ( = ?auto_26832 ?auto_26835 ) ) ( not ( = ?auto_26832 ?auto_26859 ) ) ( not ( = ?auto_26834 ?auto_26835 ) ) ( not ( = ?auto_26834 ?auto_26859 ) ) ( not ( = ?auto_26835 ?auto_26866 ) ) ( not ( = ?auto_26835 ?auto_26871 ) ) ( not ( = ?auto_26835 ?auto_26872 ) ) ( not ( = ?auto_26835 ?auto_26851 ) ) ( not ( = ?auto_26835 ?auto_26861 ) ) ( not ( = ?auto_26835 ?auto_26869 ) ) ( not ( = ?auto_26835 ?auto_26865 ) ) ( not ( = ?auto_26835 ?auto_26875 ) ) ( not ( = ?auto_26835 ?auto_26853 ) ) ( not ( = ?auto_26835 ?auto_26860 ) ) ( not ( = ?auto_26835 ?auto_26849 ) ) ( not ( = ?auto_26858 ?auto_26855 ) ) ( not ( = ?auto_26858 ?auto_26846 ) ) ( not ( = ?auto_26858 ?auto_26844 ) ) ( not ( = ?auto_26858 ?auto_26842 ) ) ( not ( = ?auto_26858 ?auto_26876 ) ) ( not ( = ?auto_26858 ?auto_26864 ) ) ( not ( = ?auto_26858 ?auto_26845 ) ) ( not ( = ?auto_26858 ?auto_26857 ) ) ( not ( = ?auto_26858 ?auto_26862 ) ) ( not ( = ?auto_26847 ?auto_26873 ) ) ( not ( = ?auto_26847 ?auto_26852 ) ) ( not ( = ?auto_26847 ?auto_26850 ) ) ( not ( = ?auto_26847 ?auto_26839 ) ) ( not ( = ?auto_26847 ?auto_26848 ) ) ( not ( = ?auto_26847 ?auto_26856 ) ) ( not ( = ?auto_26847 ?auto_26874 ) ) ( not ( = ?auto_26847 ?auto_26870 ) ) ( not ( = ?auto_26847 ?auto_26854 ) ) ( not ( = ?auto_26859 ?auto_26866 ) ) ( not ( = ?auto_26859 ?auto_26871 ) ) ( not ( = ?auto_26859 ?auto_26872 ) ) ( not ( = ?auto_26859 ?auto_26851 ) ) ( not ( = ?auto_26859 ?auto_26861 ) ) ( not ( = ?auto_26859 ?auto_26869 ) ) ( not ( = ?auto_26859 ?auto_26865 ) ) ( not ( = ?auto_26859 ?auto_26875 ) ) ( not ( = ?auto_26859 ?auto_26853 ) ) ( not ( = ?auto_26859 ?auto_26860 ) ) ( not ( = ?auto_26859 ?auto_26849 ) ) ( not ( = ?auto_26823 ?auto_26837 ) ) ( not ( = ?auto_26823 ?auto_26863 ) ) ( not ( = ?auto_26824 ?auto_26837 ) ) ( not ( = ?auto_26824 ?auto_26863 ) ) ( not ( = ?auto_26825 ?auto_26837 ) ) ( not ( = ?auto_26825 ?auto_26863 ) ) ( not ( = ?auto_26826 ?auto_26837 ) ) ( not ( = ?auto_26826 ?auto_26863 ) ) ( not ( = ?auto_26827 ?auto_26837 ) ) ( not ( = ?auto_26827 ?auto_26863 ) ) ( not ( = ?auto_26828 ?auto_26837 ) ) ( not ( = ?auto_26828 ?auto_26863 ) ) ( not ( = ?auto_26831 ?auto_26837 ) ) ( not ( = ?auto_26831 ?auto_26863 ) ) ( not ( = ?auto_26830 ?auto_26837 ) ) ( not ( = ?auto_26830 ?auto_26863 ) ) ( not ( = ?auto_26829 ?auto_26837 ) ) ( not ( = ?auto_26829 ?auto_26863 ) ) ( not ( = ?auto_26832 ?auto_26837 ) ) ( not ( = ?auto_26832 ?auto_26863 ) ) ( not ( = ?auto_26834 ?auto_26837 ) ) ( not ( = ?auto_26834 ?auto_26863 ) ) ( not ( = ?auto_26833 ?auto_26837 ) ) ( not ( = ?auto_26833 ?auto_26863 ) ) ( not ( = ?auto_26837 ?auto_26859 ) ) ( not ( = ?auto_26837 ?auto_26866 ) ) ( not ( = ?auto_26837 ?auto_26871 ) ) ( not ( = ?auto_26837 ?auto_26872 ) ) ( not ( = ?auto_26837 ?auto_26851 ) ) ( not ( = ?auto_26837 ?auto_26861 ) ) ( not ( = ?auto_26837 ?auto_26869 ) ) ( not ( = ?auto_26837 ?auto_26865 ) ) ( not ( = ?auto_26837 ?auto_26875 ) ) ( not ( = ?auto_26837 ?auto_26853 ) ) ( not ( = ?auto_26837 ?auto_26860 ) ) ( not ( = ?auto_26837 ?auto_26849 ) ) ( not ( = ?auto_26867 ?auto_26858 ) ) ( not ( = ?auto_26867 ?auto_26855 ) ) ( not ( = ?auto_26867 ?auto_26846 ) ) ( not ( = ?auto_26867 ?auto_26844 ) ) ( not ( = ?auto_26867 ?auto_26842 ) ) ( not ( = ?auto_26867 ?auto_26876 ) ) ( not ( = ?auto_26867 ?auto_26864 ) ) ( not ( = ?auto_26867 ?auto_26845 ) ) ( not ( = ?auto_26867 ?auto_26857 ) ) ( not ( = ?auto_26867 ?auto_26862 ) ) ( not ( = ?auto_26868 ?auto_26847 ) ) ( not ( = ?auto_26868 ?auto_26873 ) ) ( not ( = ?auto_26868 ?auto_26852 ) ) ( not ( = ?auto_26868 ?auto_26850 ) ) ( not ( = ?auto_26868 ?auto_26839 ) ) ( not ( = ?auto_26868 ?auto_26848 ) ) ( not ( = ?auto_26868 ?auto_26856 ) ) ( not ( = ?auto_26868 ?auto_26874 ) ) ( not ( = ?auto_26868 ?auto_26870 ) ) ( not ( = ?auto_26868 ?auto_26854 ) ) ( not ( = ?auto_26863 ?auto_26859 ) ) ( not ( = ?auto_26863 ?auto_26866 ) ) ( not ( = ?auto_26863 ?auto_26871 ) ) ( not ( = ?auto_26863 ?auto_26872 ) ) ( not ( = ?auto_26863 ?auto_26851 ) ) ( not ( = ?auto_26863 ?auto_26861 ) ) ( not ( = ?auto_26863 ?auto_26869 ) ) ( not ( = ?auto_26863 ?auto_26865 ) ) ( not ( = ?auto_26863 ?auto_26875 ) ) ( not ( = ?auto_26863 ?auto_26853 ) ) ( not ( = ?auto_26863 ?auto_26860 ) ) ( not ( = ?auto_26863 ?auto_26849 ) ) ( not ( = ?auto_26823 ?auto_26836 ) ) ( not ( = ?auto_26823 ?auto_26838 ) ) ( not ( = ?auto_26824 ?auto_26836 ) ) ( not ( = ?auto_26824 ?auto_26838 ) ) ( not ( = ?auto_26825 ?auto_26836 ) ) ( not ( = ?auto_26825 ?auto_26838 ) ) ( not ( = ?auto_26826 ?auto_26836 ) ) ( not ( = ?auto_26826 ?auto_26838 ) ) ( not ( = ?auto_26827 ?auto_26836 ) ) ( not ( = ?auto_26827 ?auto_26838 ) ) ( not ( = ?auto_26828 ?auto_26836 ) ) ( not ( = ?auto_26828 ?auto_26838 ) ) ( not ( = ?auto_26831 ?auto_26836 ) ) ( not ( = ?auto_26831 ?auto_26838 ) ) ( not ( = ?auto_26830 ?auto_26836 ) ) ( not ( = ?auto_26830 ?auto_26838 ) ) ( not ( = ?auto_26829 ?auto_26836 ) ) ( not ( = ?auto_26829 ?auto_26838 ) ) ( not ( = ?auto_26832 ?auto_26836 ) ) ( not ( = ?auto_26832 ?auto_26838 ) ) ( not ( = ?auto_26834 ?auto_26836 ) ) ( not ( = ?auto_26834 ?auto_26838 ) ) ( not ( = ?auto_26833 ?auto_26836 ) ) ( not ( = ?auto_26833 ?auto_26838 ) ) ( not ( = ?auto_26835 ?auto_26836 ) ) ( not ( = ?auto_26835 ?auto_26838 ) ) ( not ( = ?auto_26836 ?auto_26863 ) ) ( not ( = ?auto_26836 ?auto_26859 ) ) ( not ( = ?auto_26836 ?auto_26866 ) ) ( not ( = ?auto_26836 ?auto_26871 ) ) ( not ( = ?auto_26836 ?auto_26872 ) ) ( not ( = ?auto_26836 ?auto_26851 ) ) ( not ( = ?auto_26836 ?auto_26861 ) ) ( not ( = ?auto_26836 ?auto_26869 ) ) ( not ( = ?auto_26836 ?auto_26865 ) ) ( not ( = ?auto_26836 ?auto_26875 ) ) ( not ( = ?auto_26836 ?auto_26853 ) ) ( not ( = ?auto_26836 ?auto_26860 ) ) ( not ( = ?auto_26836 ?auto_26849 ) ) ( not ( = ?auto_26838 ?auto_26863 ) ) ( not ( = ?auto_26838 ?auto_26859 ) ) ( not ( = ?auto_26838 ?auto_26866 ) ) ( not ( = ?auto_26838 ?auto_26871 ) ) ( not ( = ?auto_26838 ?auto_26872 ) ) ( not ( = ?auto_26838 ?auto_26851 ) ) ( not ( = ?auto_26838 ?auto_26861 ) ) ( not ( = ?auto_26838 ?auto_26869 ) ) ( not ( = ?auto_26838 ?auto_26865 ) ) ( not ( = ?auto_26838 ?auto_26875 ) ) ( not ( = ?auto_26838 ?auto_26853 ) ) ( not ( = ?auto_26838 ?auto_26860 ) ) ( not ( = ?auto_26838 ?auto_26849 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_26823 ?auto_26824 ?auto_26825 ?auto_26826 ?auto_26827 ?auto_26828 ?auto_26831 ?auto_26830 ?auto_26829 ?auto_26832 ?auto_26834 ?auto_26833 ?auto_26835 ?auto_26837 )
      ( MAKE-1CRATE ?auto_26837 ?auto_26836 )
      ( MAKE-14CRATE-VERIFY ?auto_26823 ?auto_26824 ?auto_26825 ?auto_26826 ?auto_26827 ?auto_26828 ?auto_26831 ?auto_26830 ?auto_26829 ?auto_26832 ?auto_26834 ?auto_26833 ?auto_26835 ?auto_26837 ?auto_26836 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26879 - SURFACE
      ?auto_26880 - SURFACE
    )
    :vars
    (
      ?auto_26881 - HOIST
      ?auto_26882 - PLACE
      ?auto_26884 - PLACE
      ?auto_26885 - HOIST
      ?auto_26886 - SURFACE
      ?auto_26883 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26881 ?auto_26882 ) ( SURFACE-AT ?auto_26879 ?auto_26882 ) ( CLEAR ?auto_26879 ) ( IS-CRATE ?auto_26880 ) ( AVAILABLE ?auto_26881 ) ( not ( = ?auto_26884 ?auto_26882 ) ) ( HOIST-AT ?auto_26885 ?auto_26884 ) ( AVAILABLE ?auto_26885 ) ( SURFACE-AT ?auto_26880 ?auto_26884 ) ( ON ?auto_26880 ?auto_26886 ) ( CLEAR ?auto_26880 ) ( TRUCK-AT ?auto_26883 ?auto_26882 ) ( not ( = ?auto_26879 ?auto_26880 ) ) ( not ( = ?auto_26879 ?auto_26886 ) ) ( not ( = ?auto_26880 ?auto_26886 ) ) ( not ( = ?auto_26881 ?auto_26885 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26883 ?auto_26882 ?auto_26884 )
      ( !LIFT ?auto_26885 ?auto_26880 ?auto_26886 ?auto_26884 )
      ( !LOAD ?auto_26885 ?auto_26880 ?auto_26883 ?auto_26884 )
      ( !DRIVE ?auto_26883 ?auto_26884 ?auto_26882 )
      ( !UNLOAD ?auto_26881 ?auto_26880 ?auto_26883 ?auto_26882 )
      ( !DROP ?auto_26881 ?auto_26880 ?auto_26879 ?auto_26882 )
      ( MAKE-1CRATE-VERIFY ?auto_26879 ?auto_26880 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_26903 - SURFACE
      ?auto_26904 - SURFACE
      ?auto_26905 - SURFACE
      ?auto_26906 - SURFACE
      ?auto_26907 - SURFACE
      ?auto_26908 - SURFACE
      ?auto_26911 - SURFACE
      ?auto_26910 - SURFACE
      ?auto_26909 - SURFACE
      ?auto_26912 - SURFACE
      ?auto_26914 - SURFACE
      ?auto_26913 - SURFACE
      ?auto_26915 - SURFACE
      ?auto_26917 - SURFACE
      ?auto_26916 - SURFACE
      ?auto_26918 - SURFACE
    )
    :vars
    (
      ?auto_26919 - HOIST
      ?auto_26921 - PLACE
      ?auto_26922 - PLACE
      ?auto_26924 - HOIST
      ?auto_26920 - SURFACE
      ?auto_26931 - PLACE
      ?auto_26933 - HOIST
      ?auto_26959 - SURFACE
      ?auto_26946 - PLACE
      ?auto_26925 - HOIST
      ?auto_26955 - SURFACE
      ?auto_26939 - PLACE
      ?auto_26938 - HOIST
      ?auto_26948 - SURFACE
      ?auto_26947 - PLACE
      ?auto_26957 - HOIST
      ?auto_26958 - SURFACE
      ?auto_26929 - PLACE
      ?auto_26953 - HOIST
      ?auto_26934 - SURFACE
      ?auto_26950 - PLACE
      ?auto_26952 - HOIST
      ?auto_26960 - SURFACE
      ?auto_26954 - SURFACE
      ?auto_26943 - PLACE
      ?auto_26932 - HOIST
      ?auto_26935 - SURFACE
      ?auto_26940 - PLACE
      ?auto_26930 - HOIST
      ?auto_26937 - SURFACE
      ?auto_26926 - PLACE
      ?auto_26956 - HOIST
      ?auto_26941 - SURFACE
      ?auto_26936 - PLACE
      ?auto_26949 - HOIST
      ?auto_26928 - SURFACE
      ?auto_26951 - SURFACE
      ?auto_26942 - SURFACE
      ?auto_26927 - PLACE
      ?auto_26945 - HOIST
      ?auto_26944 - SURFACE
      ?auto_26923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26919 ?auto_26921 ) ( IS-CRATE ?auto_26918 ) ( not ( = ?auto_26922 ?auto_26921 ) ) ( HOIST-AT ?auto_26924 ?auto_26922 ) ( AVAILABLE ?auto_26924 ) ( SURFACE-AT ?auto_26918 ?auto_26922 ) ( ON ?auto_26918 ?auto_26920 ) ( CLEAR ?auto_26918 ) ( not ( = ?auto_26916 ?auto_26918 ) ) ( not ( = ?auto_26916 ?auto_26920 ) ) ( not ( = ?auto_26918 ?auto_26920 ) ) ( not ( = ?auto_26919 ?auto_26924 ) ) ( IS-CRATE ?auto_26916 ) ( not ( = ?auto_26931 ?auto_26921 ) ) ( HOIST-AT ?auto_26933 ?auto_26931 ) ( SURFACE-AT ?auto_26916 ?auto_26931 ) ( ON ?auto_26916 ?auto_26959 ) ( CLEAR ?auto_26916 ) ( not ( = ?auto_26917 ?auto_26916 ) ) ( not ( = ?auto_26917 ?auto_26959 ) ) ( not ( = ?auto_26916 ?auto_26959 ) ) ( not ( = ?auto_26919 ?auto_26933 ) ) ( IS-CRATE ?auto_26917 ) ( not ( = ?auto_26946 ?auto_26921 ) ) ( HOIST-AT ?auto_26925 ?auto_26946 ) ( AVAILABLE ?auto_26925 ) ( SURFACE-AT ?auto_26917 ?auto_26946 ) ( ON ?auto_26917 ?auto_26955 ) ( CLEAR ?auto_26917 ) ( not ( = ?auto_26915 ?auto_26917 ) ) ( not ( = ?auto_26915 ?auto_26955 ) ) ( not ( = ?auto_26917 ?auto_26955 ) ) ( not ( = ?auto_26919 ?auto_26925 ) ) ( IS-CRATE ?auto_26915 ) ( not ( = ?auto_26939 ?auto_26921 ) ) ( HOIST-AT ?auto_26938 ?auto_26939 ) ( AVAILABLE ?auto_26938 ) ( SURFACE-AT ?auto_26915 ?auto_26939 ) ( ON ?auto_26915 ?auto_26948 ) ( CLEAR ?auto_26915 ) ( not ( = ?auto_26913 ?auto_26915 ) ) ( not ( = ?auto_26913 ?auto_26948 ) ) ( not ( = ?auto_26915 ?auto_26948 ) ) ( not ( = ?auto_26919 ?auto_26938 ) ) ( IS-CRATE ?auto_26913 ) ( not ( = ?auto_26947 ?auto_26921 ) ) ( HOIST-AT ?auto_26957 ?auto_26947 ) ( AVAILABLE ?auto_26957 ) ( SURFACE-AT ?auto_26913 ?auto_26947 ) ( ON ?auto_26913 ?auto_26958 ) ( CLEAR ?auto_26913 ) ( not ( = ?auto_26914 ?auto_26913 ) ) ( not ( = ?auto_26914 ?auto_26958 ) ) ( not ( = ?auto_26913 ?auto_26958 ) ) ( not ( = ?auto_26919 ?auto_26957 ) ) ( IS-CRATE ?auto_26914 ) ( not ( = ?auto_26929 ?auto_26921 ) ) ( HOIST-AT ?auto_26953 ?auto_26929 ) ( AVAILABLE ?auto_26953 ) ( SURFACE-AT ?auto_26914 ?auto_26929 ) ( ON ?auto_26914 ?auto_26934 ) ( CLEAR ?auto_26914 ) ( not ( = ?auto_26912 ?auto_26914 ) ) ( not ( = ?auto_26912 ?auto_26934 ) ) ( not ( = ?auto_26914 ?auto_26934 ) ) ( not ( = ?auto_26919 ?auto_26953 ) ) ( IS-CRATE ?auto_26912 ) ( not ( = ?auto_26950 ?auto_26921 ) ) ( HOIST-AT ?auto_26952 ?auto_26950 ) ( SURFACE-AT ?auto_26912 ?auto_26950 ) ( ON ?auto_26912 ?auto_26960 ) ( CLEAR ?auto_26912 ) ( not ( = ?auto_26909 ?auto_26912 ) ) ( not ( = ?auto_26909 ?auto_26960 ) ) ( not ( = ?auto_26912 ?auto_26960 ) ) ( not ( = ?auto_26919 ?auto_26952 ) ) ( IS-CRATE ?auto_26909 ) ( SURFACE-AT ?auto_26909 ?auto_26931 ) ( ON ?auto_26909 ?auto_26954 ) ( CLEAR ?auto_26909 ) ( not ( = ?auto_26910 ?auto_26909 ) ) ( not ( = ?auto_26910 ?auto_26954 ) ) ( not ( = ?auto_26909 ?auto_26954 ) ) ( IS-CRATE ?auto_26910 ) ( not ( = ?auto_26943 ?auto_26921 ) ) ( HOIST-AT ?auto_26932 ?auto_26943 ) ( AVAILABLE ?auto_26932 ) ( SURFACE-AT ?auto_26910 ?auto_26943 ) ( ON ?auto_26910 ?auto_26935 ) ( CLEAR ?auto_26910 ) ( not ( = ?auto_26911 ?auto_26910 ) ) ( not ( = ?auto_26911 ?auto_26935 ) ) ( not ( = ?auto_26910 ?auto_26935 ) ) ( not ( = ?auto_26919 ?auto_26932 ) ) ( IS-CRATE ?auto_26911 ) ( not ( = ?auto_26940 ?auto_26921 ) ) ( HOIST-AT ?auto_26930 ?auto_26940 ) ( AVAILABLE ?auto_26930 ) ( SURFACE-AT ?auto_26911 ?auto_26940 ) ( ON ?auto_26911 ?auto_26937 ) ( CLEAR ?auto_26911 ) ( not ( = ?auto_26908 ?auto_26911 ) ) ( not ( = ?auto_26908 ?auto_26937 ) ) ( not ( = ?auto_26911 ?auto_26937 ) ) ( not ( = ?auto_26919 ?auto_26930 ) ) ( IS-CRATE ?auto_26908 ) ( not ( = ?auto_26926 ?auto_26921 ) ) ( HOIST-AT ?auto_26956 ?auto_26926 ) ( AVAILABLE ?auto_26956 ) ( SURFACE-AT ?auto_26908 ?auto_26926 ) ( ON ?auto_26908 ?auto_26941 ) ( CLEAR ?auto_26908 ) ( not ( = ?auto_26907 ?auto_26908 ) ) ( not ( = ?auto_26907 ?auto_26941 ) ) ( not ( = ?auto_26908 ?auto_26941 ) ) ( not ( = ?auto_26919 ?auto_26956 ) ) ( IS-CRATE ?auto_26907 ) ( not ( = ?auto_26936 ?auto_26921 ) ) ( HOIST-AT ?auto_26949 ?auto_26936 ) ( AVAILABLE ?auto_26949 ) ( SURFACE-AT ?auto_26907 ?auto_26936 ) ( ON ?auto_26907 ?auto_26928 ) ( CLEAR ?auto_26907 ) ( not ( = ?auto_26906 ?auto_26907 ) ) ( not ( = ?auto_26906 ?auto_26928 ) ) ( not ( = ?auto_26907 ?auto_26928 ) ) ( not ( = ?auto_26919 ?auto_26949 ) ) ( IS-CRATE ?auto_26906 ) ( AVAILABLE ?auto_26952 ) ( SURFACE-AT ?auto_26906 ?auto_26950 ) ( ON ?auto_26906 ?auto_26951 ) ( CLEAR ?auto_26906 ) ( not ( = ?auto_26905 ?auto_26906 ) ) ( not ( = ?auto_26905 ?auto_26951 ) ) ( not ( = ?auto_26906 ?auto_26951 ) ) ( IS-CRATE ?auto_26905 ) ( AVAILABLE ?auto_26933 ) ( SURFACE-AT ?auto_26905 ?auto_26931 ) ( ON ?auto_26905 ?auto_26942 ) ( CLEAR ?auto_26905 ) ( not ( = ?auto_26904 ?auto_26905 ) ) ( not ( = ?auto_26904 ?auto_26942 ) ) ( not ( = ?auto_26905 ?auto_26942 ) ) ( SURFACE-AT ?auto_26903 ?auto_26921 ) ( CLEAR ?auto_26903 ) ( IS-CRATE ?auto_26904 ) ( AVAILABLE ?auto_26919 ) ( not ( = ?auto_26927 ?auto_26921 ) ) ( HOIST-AT ?auto_26945 ?auto_26927 ) ( AVAILABLE ?auto_26945 ) ( SURFACE-AT ?auto_26904 ?auto_26927 ) ( ON ?auto_26904 ?auto_26944 ) ( CLEAR ?auto_26904 ) ( TRUCK-AT ?auto_26923 ?auto_26921 ) ( not ( = ?auto_26903 ?auto_26904 ) ) ( not ( = ?auto_26903 ?auto_26944 ) ) ( not ( = ?auto_26904 ?auto_26944 ) ) ( not ( = ?auto_26919 ?auto_26945 ) ) ( not ( = ?auto_26903 ?auto_26905 ) ) ( not ( = ?auto_26903 ?auto_26942 ) ) ( not ( = ?auto_26905 ?auto_26944 ) ) ( not ( = ?auto_26931 ?auto_26927 ) ) ( not ( = ?auto_26933 ?auto_26945 ) ) ( not ( = ?auto_26942 ?auto_26944 ) ) ( not ( = ?auto_26903 ?auto_26906 ) ) ( not ( = ?auto_26903 ?auto_26951 ) ) ( not ( = ?auto_26904 ?auto_26906 ) ) ( not ( = ?auto_26904 ?auto_26951 ) ) ( not ( = ?auto_26906 ?auto_26942 ) ) ( not ( = ?auto_26906 ?auto_26944 ) ) ( not ( = ?auto_26950 ?auto_26931 ) ) ( not ( = ?auto_26950 ?auto_26927 ) ) ( not ( = ?auto_26952 ?auto_26933 ) ) ( not ( = ?auto_26952 ?auto_26945 ) ) ( not ( = ?auto_26951 ?auto_26942 ) ) ( not ( = ?auto_26951 ?auto_26944 ) ) ( not ( = ?auto_26903 ?auto_26907 ) ) ( not ( = ?auto_26903 ?auto_26928 ) ) ( not ( = ?auto_26904 ?auto_26907 ) ) ( not ( = ?auto_26904 ?auto_26928 ) ) ( not ( = ?auto_26905 ?auto_26907 ) ) ( not ( = ?auto_26905 ?auto_26928 ) ) ( not ( = ?auto_26907 ?auto_26951 ) ) ( not ( = ?auto_26907 ?auto_26942 ) ) ( not ( = ?auto_26907 ?auto_26944 ) ) ( not ( = ?auto_26936 ?auto_26950 ) ) ( not ( = ?auto_26936 ?auto_26931 ) ) ( not ( = ?auto_26936 ?auto_26927 ) ) ( not ( = ?auto_26949 ?auto_26952 ) ) ( not ( = ?auto_26949 ?auto_26933 ) ) ( not ( = ?auto_26949 ?auto_26945 ) ) ( not ( = ?auto_26928 ?auto_26951 ) ) ( not ( = ?auto_26928 ?auto_26942 ) ) ( not ( = ?auto_26928 ?auto_26944 ) ) ( not ( = ?auto_26903 ?auto_26908 ) ) ( not ( = ?auto_26903 ?auto_26941 ) ) ( not ( = ?auto_26904 ?auto_26908 ) ) ( not ( = ?auto_26904 ?auto_26941 ) ) ( not ( = ?auto_26905 ?auto_26908 ) ) ( not ( = ?auto_26905 ?auto_26941 ) ) ( not ( = ?auto_26906 ?auto_26908 ) ) ( not ( = ?auto_26906 ?auto_26941 ) ) ( not ( = ?auto_26908 ?auto_26928 ) ) ( not ( = ?auto_26908 ?auto_26951 ) ) ( not ( = ?auto_26908 ?auto_26942 ) ) ( not ( = ?auto_26908 ?auto_26944 ) ) ( not ( = ?auto_26926 ?auto_26936 ) ) ( not ( = ?auto_26926 ?auto_26950 ) ) ( not ( = ?auto_26926 ?auto_26931 ) ) ( not ( = ?auto_26926 ?auto_26927 ) ) ( not ( = ?auto_26956 ?auto_26949 ) ) ( not ( = ?auto_26956 ?auto_26952 ) ) ( not ( = ?auto_26956 ?auto_26933 ) ) ( not ( = ?auto_26956 ?auto_26945 ) ) ( not ( = ?auto_26941 ?auto_26928 ) ) ( not ( = ?auto_26941 ?auto_26951 ) ) ( not ( = ?auto_26941 ?auto_26942 ) ) ( not ( = ?auto_26941 ?auto_26944 ) ) ( not ( = ?auto_26903 ?auto_26911 ) ) ( not ( = ?auto_26903 ?auto_26937 ) ) ( not ( = ?auto_26904 ?auto_26911 ) ) ( not ( = ?auto_26904 ?auto_26937 ) ) ( not ( = ?auto_26905 ?auto_26911 ) ) ( not ( = ?auto_26905 ?auto_26937 ) ) ( not ( = ?auto_26906 ?auto_26911 ) ) ( not ( = ?auto_26906 ?auto_26937 ) ) ( not ( = ?auto_26907 ?auto_26911 ) ) ( not ( = ?auto_26907 ?auto_26937 ) ) ( not ( = ?auto_26911 ?auto_26941 ) ) ( not ( = ?auto_26911 ?auto_26928 ) ) ( not ( = ?auto_26911 ?auto_26951 ) ) ( not ( = ?auto_26911 ?auto_26942 ) ) ( not ( = ?auto_26911 ?auto_26944 ) ) ( not ( = ?auto_26940 ?auto_26926 ) ) ( not ( = ?auto_26940 ?auto_26936 ) ) ( not ( = ?auto_26940 ?auto_26950 ) ) ( not ( = ?auto_26940 ?auto_26931 ) ) ( not ( = ?auto_26940 ?auto_26927 ) ) ( not ( = ?auto_26930 ?auto_26956 ) ) ( not ( = ?auto_26930 ?auto_26949 ) ) ( not ( = ?auto_26930 ?auto_26952 ) ) ( not ( = ?auto_26930 ?auto_26933 ) ) ( not ( = ?auto_26930 ?auto_26945 ) ) ( not ( = ?auto_26937 ?auto_26941 ) ) ( not ( = ?auto_26937 ?auto_26928 ) ) ( not ( = ?auto_26937 ?auto_26951 ) ) ( not ( = ?auto_26937 ?auto_26942 ) ) ( not ( = ?auto_26937 ?auto_26944 ) ) ( not ( = ?auto_26903 ?auto_26910 ) ) ( not ( = ?auto_26903 ?auto_26935 ) ) ( not ( = ?auto_26904 ?auto_26910 ) ) ( not ( = ?auto_26904 ?auto_26935 ) ) ( not ( = ?auto_26905 ?auto_26910 ) ) ( not ( = ?auto_26905 ?auto_26935 ) ) ( not ( = ?auto_26906 ?auto_26910 ) ) ( not ( = ?auto_26906 ?auto_26935 ) ) ( not ( = ?auto_26907 ?auto_26910 ) ) ( not ( = ?auto_26907 ?auto_26935 ) ) ( not ( = ?auto_26908 ?auto_26910 ) ) ( not ( = ?auto_26908 ?auto_26935 ) ) ( not ( = ?auto_26910 ?auto_26937 ) ) ( not ( = ?auto_26910 ?auto_26941 ) ) ( not ( = ?auto_26910 ?auto_26928 ) ) ( not ( = ?auto_26910 ?auto_26951 ) ) ( not ( = ?auto_26910 ?auto_26942 ) ) ( not ( = ?auto_26910 ?auto_26944 ) ) ( not ( = ?auto_26943 ?auto_26940 ) ) ( not ( = ?auto_26943 ?auto_26926 ) ) ( not ( = ?auto_26943 ?auto_26936 ) ) ( not ( = ?auto_26943 ?auto_26950 ) ) ( not ( = ?auto_26943 ?auto_26931 ) ) ( not ( = ?auto_26943 ?auto_26927 ) ) ( not ( = ?auto_26932 ?auto_26930 ) ) ( not ( = ?auto_26932 ?auto_26956 ) ) ( not ( = ?auto_26932 ?auto_26949 ) ) ( not ( = ?auto_26932 ?auto_26952 ) ) ( not ( = ?auto_26932 ?auto_26933 ) ) ( not ( = ?auto_26932 ?auto_26945 ) ) ( not ( = ?auto_26935 ?auto_26937 ) ) ( not ( = ?auto_26935 ?auto_26941 ) ) ( not ( = ?auto_26935 ?auto_26928 ) ) ( not ( = ?auto_26935 ?auto_26951 ) ) ( not ( = ?auto_26935 ?auto_26942 ) ) ( not ( = ?auto_26935 ?auto_26944 ) ) ( not ( = ?auto_26903 ?auto_26909 ) ) ( not ( = ?auto_26903 ?auto_26954 ) ) ( not ( = ?auto_26904 ?auto_26909 ) ) ( not ( = ?auto_26904 ?auto_26954 ) ) ( not ( = ?auto_26905 ?auto_26909 ) ) ( not ( = ?auto_26905 ?auto_26954 ) ) ( not ( = ?auto_26906 ?auto_26909 ) ) ( not ( = ?auto_26906 ?auto_26954 ) ) ( not ( = ?auto_26907 ?auto_26909 ) ) ( not ( = ?auto_26907 ?auto_26954 ) ) ( not ( = ?auto_26908 ?auto_26909 ) ) ( not ( = ?auto_26908 ?auto_26954 ) ) ( not ( = ?auto_26911 ?auto_26909 ) ) ( not ( = ?auto_26911 ?auto_26954 ) ) ( not ( = ?auto_26909 ?auto_26935 ) ) ( not ( = ?auto_26909 ?auto_26937 ) ) ( not ( = ?auto_26909 ?auto_26941 ) ) ( not ( = ?auto_26909 ?auto_26928 ) ) ( not ( = ?auto_26909 ?auto_26951 ) ) ( not ( = ?auto_26909 ?auto_26942 ) ) ( not ( = ?auto_26909 ?auto_26944 ) ) ( not ( = ?auto_26954 ?auto_26935 ) ) ( not ( = ?auto_26954 ?auto_26937 ) ) ( not ( = ?auto_26954 ?auto_26941 ) ) ( not ( = ?auto_26954 ?auto_26928 ) ) ( not ( = ?auto_26954 ?auto_26951 ) ) ( not ( = ?auto_26954 ?auto_26942 ) ) ( not ( = ?auto_26954 ?auto_26944 ) ) ( not ( = ?auto_26903 ?auto_26912 ) ) ( not ( = ?auto_26903 ?auto_26960 ) ) ( not ( = ?auto_26904 ?auto_26912 ) ) ( not ( = ?auto_26904 ?auto_26960 ) ) ( not ( = ?auto_26905 ?auto_26912 ) ) ( not ( = ?auto_26905 ?auto_26960 ) ) ( not ( = ?auto_26906 ?auto_26912 ) ) ( not ( = ?auto_26906 ?auto_26960 ) ) ( not ( = ?auto_26907 ?auto_26912 ) ) ( not ( = ?auto_26907 ?auto_26960 ) ) ( not ( = ?auto_26908 ?auto_26912 ) ) ( not ( = ?auto_26908 ?auto_26960 ) ) ( not ( = ?auto_26911 ?auto_26912 ) ) ( not ( = ?auto_26911 ?auto_26960 ) ) ( not ( = ?auto_26910 ?auto_26912 ) ) ( not ( = ?auto_26910 ?auto_26960 ) ) ( not ( = ?auto_26912 ?auto_26954 ) ) ( not ( = ?auto_26912 ?auto_26935 ) ) ( not ( = ?auto_26912 ?auto_26937 ) ) ( not ( = ?auto_26912 ?auto_26941 ) ) ( not ( = ?auto_26912 ?auto_26928 ) ) ( not ( = ?auto_26912 ?auto_26951 ) ) ( not ( = ?auto_26912 ?auto_26942 ) ) ( not ( = ?auto_26912 ?auto_26944 ) ) ( not ( = ?auto_26960 ?auto_26954 ) ) ( not ( = ?auto_26960 ?auto_26935 ) ) ( not ( = ?auto_26960 ?auto_26937 ) ) ( not ( = ?auto_26960 ?auto_26941 ) ) ( not ( = ?auto_26960 ?auto_26928 ) ) ( not ( = ?auto_26960 ?auto_26951 ) ) ( not ( = ?auto_26960 ?auto_26942 ) ) ( not ( = ?auto_26960 ?auto_26944 ) ) ( not ( = ?auto_26903 ?auto_26914 ) ) ( not ( = ?auto_26903 ?auto_26934 ) ) ( not ( = ?auto_26904 ?auto_26914 ) ) ( not ( = ?auto_26904 ?auto_26934 ) ) ( not ( = ?auto_26905 ?auto_26914 ) ) ( not ( = ?auto_26905 ?auto_26934 ) ) ( not ( = ?auto_26906 ?auto_26914 ) ) ( not ( = ?auto_26906 ?auto_26934 ) ) ( not ( = ?auto_26907 ?auto_26914 ) ) ( not ( = ?auto_26907 ?auto_26934 ) ) ( not ( = ?auto_26908 ?auto_26914 ) ) ( not ( = ?auto_26908 ?auto_26934 ) ) ( not ( = ?auto_26911 ?auto_26914 ) ) ( not ( = ?auto_26911 ?auto_26934 ) ) ( not ( = ?auto_26910 ?auto_26914 ) ) ( not ( = ?auto_26910 ?auto_26934 ) ) ( not ( = ?auto_26909 ?auto_26914 ) ) ( not ( = ?auto_26909 ?auto_26934 ) ) ( not ( = ?auto_26914 ?auto_26960 ) ) ( not ( = ?auto_26914 ?auto_26954 ) ) ( not ( = ?auto_26914 ?auto_26935 ) ) ( not ( = ?auto_26914 ?auto_26937 ) ) ( not ( = ?auto_26914 ?auto_26941 ) ) ( not ( = ?auto_26914 ?auto_26928 ) ) ( not ( = ?auto_26914 ?auto_26951 ) ) ( not ( = ?auto_26914 ?auto_26942 ) ) ( not ( = ?auto_26914 ?auto_26944 ) ) ( not ( = ?auto_26929 ?auto_26950 ) ) ( not ( = ?auto_26929 ?auto_26931 ) ) ( not ( = ?auto_26929 ?auto_26943 ) ) ( not ( = ?auto_26929 ?auto_26940 ) ) ( not ( = ?auto_26929 ?auto_26926 ) ) ( not ( = ?auto_26929 ?auto_26936 ) ) ( not ( = ?auto_26929 ?auto_26927 ) ) ( not ( = ?auto_26953 ?auto_26952 ) ) ( not ( = ?auto_26953 ?auto_26933 ) ) ( not ( = ?auto_26953 ?auto_26932 ) ) ( not ( = ?auto_26953 ?auto_26930 ) ) ( not ( = ?auto_26953 ?auto_26956 ) ) ( not ( = ?auto_26953 ?auto_26949 ) ) ( not ( = ?auto_26953 ?auto_26945 ) ) ( not ( = ?auto_26934 ?auto_26960 ) ) ( not ( = ?auto_26934 ?auto_26954 ) ) ( not ( = ?auto_26934 ?auto_26935 ) ) ( not ( = ?auto_26934 ?auto_26937 ) ) ( not ( = ?auto_26934 ?auto_26941 ) ) ( not ( = ?auto_26934 ?auto_26928 ) ) ( not ( = ?auto_26934 ?auto_26951 ) ) ( not ( = ?auto_26934 ?auto_26942 ) ) ( not ( = ?auto_26934 ?auto_26944 ) ) ( not ( = ?auto_26903 ?auto_26913 ) ) ( not ( = ?auto_26903 ?auto_26958 ) ) ( not ( = ?auto_26904 ?auto_26913 ) ) ( not ( = ?auto_26904 ?auto_26958 ) ) ( not ( = ?auto_26905 ?auto_26913 ) ) ( not ( = ?auto_26905 ?auto_26958 ) ) ( not ( = ?auto_26906 ?auto_26913 ) ) ( not ( = ?auto_26906 ?auto_26958 ) ) ( not ( = ?auto_26907 ?auto_26913 ) ) ( not ( = ?auto_26907 ?auto_26958 ) ) ( not ( = ?auto_26908 ?auto_26913 ) ) ( not ( = ?auto_26908 ?auto_26958 ) ) ( not ( = ?auto_26911 ?auto_26913 ) ) ( not ( = ?auto_26911 ?auto_26958 ) ) ( not ( = ?auto_26910 ?auto_26913 ) ) ( not ( = ?auto_26910 ?auto_26958 ) ) ( not ( = ?auto_26909 ?auto_26913 ) ) ( not ( = ?auto_26909 ?auto_26958 ) ) ( not ( = ?auto_26912 ?auto_26913 ) ) ( not ( = ?auto_26912 ?auto_26958 ) ) ( not ( = ?auto_26913 ?auto_26934 ) ) ( not ( = ?auto_26913 ?auto_26960 ) ) ( not ( = ?auto_26913 ?auto_26954 ) ) ( not ( = ?auto_26913 ?auto_26935 ) ) ( not ( = ?auto_26913 ?auto_26937 ) ) ( not ( = ?auto_26913 ?auto_26941 ) ) ( not ( = ?auto_26913 ?auto_26928 ) ) ( not ( = ?auto_26913 ?auto_26951 ) ) ( not ( = ?auto_26913 ?auto_26942 ) ) ( not ( = ?auto_26913 ?auto_26944 ) ) ( not ( = ?auto_26947 ?auto_26929 ) ) ( not ( = ?auto_26947 ?auto_26950 ) ) ( not ( = ?auto_26947 ?auto_26931 ) ) ( not ( = ?auto_26947 ?auto_26943 ) ) ( not ( = ?auto_26947 ?auto_26940 ) ) ( not ( = ?auto_26947 ?auto_26926 ) ) ( not ( = ?auto_26947 ?auto_26936 ) ) ( not ( = ?auto_26947 ?auto_26927 ) ) ( not ( = ?auto_26957 ?auto_26953 ) ) ( not ( = ?auto_26957 ?auto_26952 ) ) ( not ( = ?auto_26957 ?auto_26933 ) ) ( not ( = ?auto_26957 ?auto_26932 ) ) ( not ( = ?auto_26957 ?auto_26930 ) ) ( not ( = ?auto_26957 ?auto_26956 ) ) ( not ( = ?auto_26957 ?auto_26949 ) ) ( not ( = ?auto_26957 ?auto_26945 ) ) ( not ( = ?auto_26958 ?auto_26934 ) ) ( not ( = ?auto_26958 ?auto_26960 ) ) ( not ( = ?auto_26958 ?auto_26954 ) ) ( not ( = ?auto_26958 ?auto_26935 ) ) ( not ( = ?auto_26958 ?auto_26937 ) ) ( not ( = ?auto_26958 ?auto_26941 ) ) ( not ( = ?auto_26958 ?auto_26928 ) ) ( not ( = ?auto_26958 ?auto_26951 ) ) ( not ( = ?auto_26958 ?auto_26942 ) ) ( not ( = ?auto_26958 ?auto_26944 ) ) ( not ( = ?auto_26903 ?auto_26915 ) ) ( not ( = ?auto_26903 ?auto_26948 ) ) ( not ( = ?auto_26904 ?auto_26915 ) ) ( not ( = ?auto_26904 ?auto_26948 ) ) ( not ( = ?auto_26905 ?auto_26915 ) ) ( not ( = ?auto_26905 ?auto_26948 ) ) ( not ( = ?auto_26906 ?auto_26915 ) ) ( not ( = ?auto_26906 ?auto_26948 ) ) ( not ( = ?auto_26907 ?auto_26915 ) ) ( not ( = ?auto_26907 ?auto_26948 ) ) ( not ( = ?auto_26908 ?auto_26915 ) ) ( not ( = ?auto_26908 ?auto_26948 ) ) ( not ( = ?auto_26911 ?auto_26915 ) ) ( not ( = ?auto_26911 ?auto_26948 ) ) ( not ( = ?auto_26910 ?auto_26915 ) ) ( not ( = ?auto_26910 ?auto_26948 ) ) ( not ( = ?auto_26909 ?auto_26915 ) ) ( not ( = ?auto_26909 ?auto_26948 ) ) ( not ( = ?auto_26912 ?auto_26915 ) ) ( not ( = ?auto_26912 ?auto_26948 ) ) ( not ( = ?auto_26914 ?auto_26915 ) ) ( not ( = ?auto_26914 ?auto_26948 ) ) ( not ( = ?auto_26915 ?auto_26958 ) ) ( not ( = ?auto_26915 ?auto_26934 ) ) ( not ( = ?auto_26915 ?auto_26960 ) ) ( not ( = ?auto_26915 ?auto_26954 ) ) ( not ( = ?auto_26915 ?auto_26935 ) ) ( not ( = ?auto_26915 ?auto_26937 ) ) ( not ( = ?auto_26915 ?auto_26941 ) ) ( not ( = ?auto_26915 ?auto_26928 ) ) ( not ( = ?auto_26915 ?auto_26951 ) ) ( not ( = ?auto_26915 ?auto_26942 ) ) ( not ( = ?auto_26915 ?auto_26944 ) ) ( not ( = ?auto_26939 ?auto_26947 ) ) ( not ( = ?auto_26939 ?auto_26929 ) ) ( not ( = ?auto_26939 ?auto_26950 ) ) ( not ( = ?auto_26939 ?auto_26931 ) ) ( not ( = ?auto_26939 ?auto_26943 ) ) ( not ( = ?auto_26939 ?auto_26940 ) ) ( not ( = ?auto_26939 ?auto_26926 ) ) ( not ( = ?auto_26939 ?auto_26936 ) ) ( not ( = ?auto_26939 ?auto_26927 ) ) ( not ( = ?auto_26938 ?auto_26957 ) ) ( not ( = ?auto_26938 ?auto_26953 ) ) ( not ( = ?auto_26938 ?auto_26952 ) ) ( not ( = ?auto_26938 ?auto_26933 ) ) ( not ( = ?auto_26938 ?auto_26932 ) ) ( not ( = ?auto_26938 ?auto_26930 ) ) ( not ( = ?auto_26938 ?auto_26956 ) ) ( not ( = ?auto_26938 ?auto_26949 ) ) ( not ( = ?auto_26938 ?auto_26945 ) ) ( not ( = ?auto_26948 ?auto_26958 ) ) ( not ( = ?auto_26948 ?auto_26934 ) ) ( not ( = ?auto_26948 ?auto_26960 ) ) ( not ( = ?auto_26948 ?auto_26954 ) ) ( not ( = ?auto_26948 ?auto_26935 ) ) ( not ( = ?auto_26948 ?auto_26937 ) ) ( not ( = ?auto_26948 ?auto_26941 ) ) ( not ( = ?auto_26948 ?auto_26928 ) ) ( not ( = ?auto_26948 ?auto_26951 ) ) ( not ( = ?auto_26948 ?auto_26942 ) ) ( not ( = ?auto_26948 ?auto_26944 ) ) ( not ( = ?auto_26903 ?auto_26917 ) ) ( not ( = ?auto_26903 ?auto_26955 ) ) ( not ( = ?auto_26904 ?auto_26917 ) ) ( not ( = ?auto_26904 ?auto_26955 ) ) ( not ( = ?auto_26905 ?auto_26917 ) ) ( not ( = ?auto_26905 ?auto_26955 ) ) ( not ( = ?auto_26906 ?auto_26917 ) ) ( not ( = ?auto_26906 ?auto_26955 ) ) ( not ( = ?auto_26907 ?auto_26917 ) ) ( not ( = ?auto_26907 ?auto_26955 ) ) ( not ( = ?auto_26908 ?auto_26917 ) ) ( not ( = ?auto_26908 ?auto_26955 ) ) ( not ( = ?auto_26911 ?auto_26917 ) ) ( not ( = ?auto_26911 ?auto_26955 ) ) ( not ( = ?auto_26910 ?auto_26917 ) ) ( not ( = ?auto_26910 ?auto_26955 ) ) ( not ( = ?auto_26909 ?auto_26917 ) ) ( not ( = ?auto_26909 ?auto_26955 ) ) ( not ( = ?auto_26912 ?auto_26917 ) ) ( not ( = ?auto_26912 ?auto_26955 ) ) ( not ( = ?auto_26914 ?auto_26917 ) ) ( not ( = ?auto_26914 ?auto_26955 ) ) ( not ( = ?auto_26913 ?auto_26917 ) ) ( not ( = ?auto_26913 ?auto_26955 ) ) ( not ( = ?auto_26917 ?auto_26948 ) ) ( not ( = ?auto_26917 ?auto_26958 ) ) ( not ( = ?auto_26917 ?auto_26934 ) ) ( not ( = ?auto_26917 ?auto_26960 ) ) ( not ( = ?auto_26917 ?auto_26954 ) ) ( not ( = ?auto_26917 ?auto_26935 ) ) ( not ( = ?auto_26917 ?auto_26937 ) ) ( not ( = ?auto_26917 ?auto_26941 ) ) ( not ( = ?auto_26917 ?auto_26928 ) ) ( not ( = ?auto_26917 ?auto_26951 ) ) ( not ( = ?auto_26917 ?auto_26942 ) ) ( not ( = ?auto_26917 ?auto_26944 ) ) ( not ( = ?auto_26946 ?auto_26939 ) ) ( not ( = ?auto_26946 ?auto_26947 ) ) ( not ( = ?auto_26946 ?auto_26929 ) ) ( not ( = ?auto_26946 ?auto_26950 ) ) ( not ( = ?auto_26946 ?auto_26931 ) ) ( not ( = ?auto_26946 ?auto_26943 ) ) ( not ( = ?auto_26946 ?auto_26940 ) ) ( not ( = ?auto_26946 ?auto_26926 ) ) ( not ( = ?auto_26946 ?auto_26936 ) ) ( not ( = ?auto_26946 ?auto_26927 ) ) ( not ( = ?auto_26925 ?auto_26938 ) ) ( not ( = ?auto_26925 ?auto_26957 ) ) ( not ( = ?auto_26925 ?auto_26953 ) ) ( not ( = ?auto_26925 ?auto_26952 ) ) ( not ( = ?auto_26925 ?auto_26933 ) ) ( not ( = ?auto_26925 ?auto_26932 ) ) ( not ( = ?auto_26925 ?auto_26930 ) ) ( not ( = ?auto_26925 ?auto_26956 ) ) ( not ( = ?auto_26925 ?auto_26949 ) ) ( not ( = ?auto_26925 ?auto_26945 ) ) ( not ( = ?auto_26955 ?auto_26948 ) ) ( not ( = ?auto_26955 ?auto_26958 ) ) ( not ( = ?auto_26955 ?auto_26934 ) ) ( not ( = ?auto_26955 ?auto_26960 ) ) ( not ( = ?auto_26955 ?auto_26954 ) ) ( not ( = ?auto_26955 ?auto_26935 ) ) ( not ( = ?auto_26955 ?auto_26937 ) ) ( not ( = ?auto_26955 ?auto_26941 ) ) ( not ( = ?auto_26955 ?auto_26928 ) ) ( not ( = ?auto_26955 ?auto_26951 ) ) ( not ( = ?auto_26955 ?auto_26942 ) ) ( not ( = ?auto_26955 ?auto_26944 ) ) ( not ( = ?auto_26903 ?auto_26916 ) ) ( not ( = ?auto_26903 ?auto_26959 ) ) ( not ( = ?auto_26904 ?auto_26916 ) ) ( not ( = ?auto_26904 ?auto_26959 ) ) ( not ( = ?auto_26905 ?auto_26916 ) ) ( not ( = ?auto_26905 ?auto_26959 ) ) ( not ( = ?auto_26906 ?auto_26916 ) ) ( not ( = ?auto_26906 ?auto_26959 ) ) ( not ( = ?auto_26907 ?auto_26916 ) ) ( not ( = ?auto_26907 ?auto_26959 ) ) ( not ( = ?auto_26908 ?auto_26916 ) ) ( not ( = ?auto_26908 ?auto_26959 ) ) ( not ( = ?auto_26911 ?auto_26916 ) ) ( not ( = ?auto_26911 ?auto_26959 ) ) ( not ( = ?auto_26910 ?auto_26916 ) ) ( not ( = ?auto_26910 ?auto_26959 ) ) ( not ( = ?auto_26909 ?auto_26916 ) ) ( not ( = ?auto_26909 ?auto_26959 ) ) ( not ( = ?auto_26912 ?auto_26916 ) ) ( not ( = ?auto_26912 ?auto_26959 ) ) ( not ( = ?auto_26914 ?auto_26916 ) ) ( not ( = ?auto_26914 ?auto_26959 ) ) ( not ( = ?auto_26913 ?auto_26916 ) ) ( not ( = ?auto_26913 ?auto_26959 ) ) ( not ( = ?auto_26915 ?auto_26916 ) ) ( not ( = ?auto_26915 ?auto_26959 ) ) ( not ( = ?auto_26916 ?auto_26955 ) ) ( not ( = ?auto_26916 ?auto_26948 ) ) ( not ( = ?auto_26916 ?auto_26958 ) ) ( not ( = ?auto_26916 ?auto_26934 ) ) ( not ( = ?auto_26916 ?auto_26960 ) ) ( not ( = ?auto_26916 ?auto_26954 ) ) ( not ( = ?auto_26916 ?auto_26935 ) ) ( not ( = ?auto_26916 ?auto_26937 ) ) ( not ( = ?auto_26916 ?auto_26941 ) ) ( not ( = ?auto_26916 ?auto_26928 ) ) ( not ( = ?auto_26916 ?auto_26951 ) ) ( not ( = ?auto_26916 ?auto_26942 ) ) ( not ( = ?auto_26916 ?auto_26944 ) ) ( not ( = ?auto_26959 ?auto_26955 ) ) ( not ( = ?auto_26959 ?auto_26948 ) ) ( not ( = ?auto_26959 ?auto_26958 ) ) ( not ( = ?auto_26959 ?auto_26934 ) ) ( not ( = ?auto_26959 ?auto_26960 ) ) ( not ( = ?auto_26959 ?auto_26954 ) ) ( not ( = ?auto_26959 ?auto_26935 ) ) ( not ( = ?auto_26959 ?auto_26937 ) ) ( not ( = ?auto_26959 ?auto_26941 ) ) ( not ( = ?auto_26959 ?auto_26928 ) ) ( not ( = ?auto_26959 ?auto_26951 ) ) ( not ( = ?auto_26959 ?auto_26942 ) ) ( not ( = ?auto_26959 ?auto_26944 ) ) ( not ( = ?auto_26903 ?auto_26918 ) ) ( not ( = ?auto_26903 ?auto_26920 ) ) ( not ( = ?auto_26904 ?auto_26918 ) ) ( not ( = ?auto_26904 ?auto_26920 ) ) ( not ( = ?auto_26905 ?auto_26918 ) ) ( not ( = ?auto_26905 ?auto_26920 ) ) ( not ( = ?auto_26906 ?auto_26918 ) ) ( not ( = ?auto_26906 ?auto_26920 ) ) ( not ( = ?auto_26907 ?auto_26918 ) ) ( not ( = ?auto_26907 ?auto_26920 ) ) ( not ( = ?auto_26908 ?auto_26918 ) ) ( not ( = ?auto_26908 ?auto_26920 ) ) ( not ( = ?auto_26911 ?auto_26918 ) ) ( not ( = ?auto_26911 ?auto_26920 ) ) ( not ( = ?auto_26910 ?auto_26918 ) ) ( not ( = ?auto_26910 ?auto_26920 ) ) ( not ( = ?auto_26909 ?auto_26918 ) ) ( not ( = ?auto_26909 ?auto_26920 ) ) ( not ( = ?auto_26912 ?auto_26918 ) ) ( not ( = ?auto_26912 ?auto_26920 ) ) ( not ( = ?auto_26914 ?auto_26918 ) ) ( not ( = ?auto_26914 ?auto_26920 ) ) ( not ( = ?auto_26913 ?auto_26918 ) ) ( not ( = ?auto_26913 ?auto_26920 ) ) ( not ( = ?auto_26915 ?auto_26918 ) ) ( not ( = ?auto_26915 ?auto_26920 ) ) ( not ( = ?auto_26917 ?auto_26918 ) ) ( not ( = ?auto_26917 ?auto_26920 ) ) ( not ( = ?auto_26918 ?auto_26959 ) ) ( not ( = ?auto_26918 ?auto_26955 ) ) ( not ( = ?auto_26918 ?auto_26948 ) ) ( not ( = ?auto_26918 ?auto_26958 ) ) ( not ( = ?auto_26918 ?auto_26934 ) ) ( not ( = ?auto_26918 ?auto_26960 ) ) ( not ( = ?auto_26918 ?auto_26954 ) ) ( not ( = ?auto_26918 ?auto_26935 ) ) ( not ( = ?auto_26918 ?auto_26937 ) ) ( not ( = ?auto_26918 ?auto_26941 ) ) ( not ( = ?auto_26918 ?auto_26928 ) ) ( not ( = ?auto_26918 ?auto_26951 ) ) ( not ( = ?auto_26918 ?auto_26942 ) ) ( not ( = ?auto_26918 ?auto_26944 ) ) ( not ( = ?auto_26922 ?auto_26931 ) ) ( not ( = ?auto_26922 ?auto_26946 ) ) ( not ( = ?auto_26922 ?auto_26939 ) ) ( not ( = ?auto_26922 ?auto_26947 ) ) ( not ( = ?auto_26922 ?auto_26929 ) ) ( not ( = ?auto_26922 ?auto_26950 ) ) ( not ( = ?auto_26922 ?auto_26943 ) ) ( not ( = ?auto_26922 ?auto_26940 ) ) ( not ( = ?auto_26922 ?auto_26926 ) ) ( not ( = ?auto_26922 ?auto_26936 ) ) ( not ( = ?auto_26922 ?auto_26927 ) ) ( not ( = ?auto_26924 ?auto_26933 ) ) ( not ( = ?auto_26924 ?auto_26925 ) ) ( not ( = ?auto_26924 ?auto_26938 ) ) ( not ( = ?auto_26924 ?auto_26957 ) ) ( not ( = ?auto_26924 ?auto_26953 ) ) ( not ( = ?auto_26924 ?auto_26952 ) ) ( not ( = ?auto_26924 ?auto_26932 ) ) ( not ( = ?auto_26924 ?auto_26930 ) ) ( not ( = ?auto_26924 ?auto_26956 ) ) ( not ( = ?auto_26924 ?auto_26949 ) ) ( not ( = ?auto_26924 ?auto_26945 ) ) ( not ( = ?auto_26920 ?auto_26959 ) ) ( not ( = ?auto_26920 ?auto_26955 ) ) ( not ( = ?auto_26920 ?auto_26948 ) ) ( not ( = ?auto_26920 ?auto_26958 ) ) ( not ( = ?auto_26920 ?auto_26934 ) ) ( not ( = ?auto_26920 ?auto_26960 ) ) ( not ( = ?auto_26920 ?auto_26954 ) ) ( not ( = ?auto_26920 ?auto_26935 ) ) ( not ( = ?auto_26920 ?auto_26937 ) ) ( not ( = ?auto_26920 ?auto_26941 ) ) ( not ( = ?auto_26920 ?auto_26928 ) ) ( not ( = ?auto_26920 ?auto_26951 ) ) ( not ( = ?auto_26920 ?auto_26942 ) ) ( not ( = ?auto_26920 ?auto_26944 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_26903 ?auto_26904 ?auto_26905 ?auto_26906 ?auto_26907 ?auto_26908 ?auto_26911 ?auto_26910 ?auto_26909 ?auto_26912 ?auto_26914 ?auto_26913 ?auto_26915 ?auto_26917 ?auto_26916 )
      ( MAKE-1CRATE ?auto_26916 ?auto_26918 )
      ( MAKE-15CRATE-VERIFY ?auto_26903 ?auto_26904 ?auto_26905 ?auto_26906 ?auto_26907 ?auto_26908 ?auto_26911 ?auto_26910 ?auto_26909 ?auto_26912 ?auto_26914 ?auto_26913 ?auto_26915 ?auto_26917 ?auto_26916 ?auto_26918 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26963 - SURFACE
      ?auto_26964 - SURFACE
    )
    :vars
    (
      ?auto_26965 - HOIST
      ?auto_26966 - PLACE
      ?auto_26968 - PLACE
      ?auto_26969 - HOIST
      ?auto_26970 - SURFACE
      ?auto_26967 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26965 ?auto_26966 ) ( SURFACE-AT ?auto_26963 ?auto_26966 ) ( CLEAR ?auto_26963 ) ( IS-CRATE ?auto_26964 ) ( AVAILABLE ?auto_26965 ) ( not ( = ?auto_26968 ?auto_26966 ) ) ( HOIST-AT ?auto_26969 ?auto_26968 ) ( AVAILABLE ?auto_26969 ) ( SURFACE-AT ?auto_26964 ?auto_26968 ) ( ON ?auto_26964 ?auto_26970 ) ( CLEAR ?auto_26964 ) ( TRUCK-AT ?auto_26967 ?auto_26966 ) ( not ( = ?auto_26963 ?auto_26964 ) ) ( not ( = ?auto_26963 ?auto_26970 ) ) ( not ( = ?auto_26964 ?auto_26970 ) ) ( not ( = ?auto_26965 ?auto_26969 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26967 ?auto_26966 ?auto_26968 )
      ( !LIFT ?auto_26969 ?auto_26964 ?auto_26970 ?auto_26968 )
      ( !LOAD ?auto_26969 ?auto_26964 ?auto_26967 ?auto_26968 )
      ( !DRIVE ?auto_26967 ?auto_26968 ?auto_26966 )
      ( !UNLOAD ?auto_26965 ?auto_26964 ?auto_26967 ?auto_26966 )
      ( !DROP ?auto_26965 ?auto_26964 ?auto_26963 ?auto_26966 )
      ( MAKE-1CRATE-VERIFY ?auto_26963 ?auto_26964 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_26988 - SURFACE
      ?auto_26989 - SURFACE
      ?auto_26990 - SURFACE
      ?auto_26991 - SURFACE
      ?auto_26992 - SURFACE
      ?auto_26993 - SURFACE
      ?auto_26996 - SURFACE
      ?auto_26995 - SURFACE
      ?auto_26994 - SURFACE
      ?auto_26997 - SURFACE
      ?auto_26999 - SURFACE
      ?auto_26998 - SURFACE
      ?auto_27000 - SURFACE
      ?auto_27002 - SURFACE
      ?auto_27001 - SURFACE
      ?auto_27003 - SURFACE
      ?auto_27004 - SURFACE
    )
    :vars
    (
      ?auto_27009 - HOIST
      ?auto_27005 - PLACE
      ?auto_27007 - PLACE
      ?auto_27006 - HOIST
      ?auto_27010 - SURFACE
      ?auto_27019 - PLACE
      ?auto_27033 - HOIST
      ?auto_27022 - SURFACE
      ?auto_27013 - PLACE
      ?auto_27047 - HOIST
      ?auto_27020 - SURFACE
      ?auto_27032 - PLACE
      ?auto_27026 - HOIST
      ?auto_27035 - SURFACE
      ?auto_27031 - SURFACE
      ?auto_27021 - PLACE
      ?auto_27029 - HOIST
      ?auto_27044 - SURFACE
      ?auto_27015 - PLACE
      ?auto_27018 - HOIST
      ?auto_27041 - SURFACE
      ?auto_27014 - PLACE
      ?auto_27017 - HOIST
      ?auto_27016 - SURFACE
      ?auto_27043 - SURFACE
      ?auto_27040 - PLACE
      ?auto_27046 - HOIST
      ?auto_27037 - SURFACE
      ?auto_27028 - PLACE
      ?auto_27036 - HOIST
      ?auto_27012 - SURFACE
      ?auto_27045 - PLACE
      ?auto_27027 - HOIST
      ?auto_27024 - SURFACE
      ?auto_27023 - PLACE
      ?auto_27025 - HOIST
      ?auto_27030 - SURFACE
      ?auto_27039 - SURFACE
      ?auto_27034 - SURFACE
      ?auto_27038 - PLACE
      ?auto_27042 - HOIST
      ?auto_27011 - SURFACE
      ?auto_27008 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27009 ?auto_27005 ) ( IS-CRATE ?auto_27004 ) ( not ( = ?auto_27007 ?auto_27005 ) ) ( HOIST-AT ?auto_27006 ?auto_27007 ) ( SURFACE-AT ?auto_27004 ?auto_27007 ) ( ON ?auto_27004 ?auto_27010 ) ( CLEAR ?auto_27004 ) ( not ( = ?auto_27003 ?auto_27004 ) ) ( not ( = ?auto_27003 ?auto_27010 ) ) ( not ( = ?auto_27004 ?auto_27010 ) ) ( not ( = ?auto_27009 ?auto_27006 ) ) ( IS-CRATE ?auto_27003 ) ( not ( = ?auto_27019 ?auto_27005 ) ) ( HOIST-AT ?auto_27033 ?auto_27019 ) ( AVAILABLE ?auto_27033 ) ( SURFACE-AT ?auto_27003 ?auto_27019 ) ( ON ?auto_27003 ?auto_27022 ) ( CLEAR ?auto_27003 ) ( not ( = ?auto_27001 ?auto_27003 ) ) ( not ( = ?auto_27001 ?auto_27022 ) ) ( not ( = ?auto_27003 ?auto_27022 ) ) ( not ( = ?auto_27009 ?auto_27033 ) ) ( IS-CRATE ?auto_27001 ) ( not ( = ?auto_27013 ?auto_27005 ) ) ( HOIST-AT ?auto_27047 ?auto_27013 ) ( SURFACE-AT ?auto_27001 ?auto_27013 ) ( ON ?auto_27001 ?auto_27020 ) ( CLEAR ?auto_27001 ) ( not ( = ?auto_27002 ?auto_27001 ) ) ( not ( = ?auto_27002 ?auto_27020 ) ) ( not ( = ?auto_27001 ?auto_27020 ) ) ( not ( = ?auto_27009 ?auto_27047 ) ) ( IS-CRATE ?auto_27002 ) ( not ( = ?auto_27032 ?auto_27005 ) ) ( HOIST-AT ?auto_27026 ?auto_27032 ) ( AVAILABLE ?auto_27026 ) ( SURFACE-AT ?auto_27002 ?auto_27032 ) ( ON ?auto_27002 ?auto_27035 ) ( CLEAR ?auto_27002 ) ( not ( = ?auto_27000 ?auto_27002 ) ) ( not ( = ?auto_27000 ?auto_27035 ) ) ( not ( = ?auto_27002 ?auto_27035 ) ) ( not ( = ?auto_27009 ?auto_27026 ) ) ( IS-CRATE ?auto_27000 ) ( AVAILABLE ?auto_27006 ) ( SURFACE-AT ?auto_27000 ?auto_27007 ) ( ON ?auto_27000 ?auto_27031 ) ( CLEAR ?auto_27000 ) ( not ( = ?auto_26998 ?auto_27000 ) ) ( not ( = ?auto_26998 ?auto_27031 ) ) ( not ( = ?auto_27000 ?auto_27031 ) ) ( IS-CRATE ?auto_26998 ) ( not ( = ?auto_27021 ?auto_27005 ) ) ( HOIST-AT ?auto_27029 ?auto_27021 ) ( AVAILABLE ?auto_27029 ) ( SURFACE-AT ?auto_26998 ?auto_27021 ) ( ON ?auto_26998 ?auto_27044 ) ( CLEAR ?auto_26998 ) ( not ( = ?auto_26999 ?auto_26998 ) ) ( not ( = ?auto_26999 ?auto_27044 ) ) ( not ( = ?auto_26998 ?auto_27044 ) ) ( not ( = ?auto_27009 ?auto_27029 ) ) ( IS-CRATE ?auto_26999 ) ( not ( = ?auto_27015 ?auto_27005 ) ) ( HOIST-AT ?auto_27018 ?auto_27015 ) ( AVAILABLE ?auto_27018 ) ( SURFACE-AT ?auto_26999 ?auto_27015 ) ( ON ?auto_26999 ?auto_27041 ) ( CLEAR ?auto_26999 ) ( not ( = ?auto_26997 ?auto_26999 ) ) ( not ( = ?auto_26997 ?auto_27041 ) ) ( not ( = ?auto_26999 ?auto_27041 ) ) ( not ( = ?auto_27009 ?auto_27018 ) ) ( IS-CRATE ?auto_26997 ) ( not ( = ?auto_27014 ?auto_27005 ) ) ( HOIST-AT ?auto_27017 ?auto_27014 ) ( SURFACE-AT ?auto_26997 ?auto_27014 ) ( ON ?auto_26997 ?auto_27016 ) ( CLEAR ?auto_26997 ) ( not ( = ?auto_26994 ?auto_26997 ) ) ( not ( = ?auto_26994 ?auto_27016 ) ) ( not ( = ?auto_26997 ?auto_27016 ) ) ( not ( = ?auto_27009 ?auto_27017 ) ) ( IS-CRATE ?auto_26994 ) ( SURFACE-AT ?auto_26994 ?auto_27013 ) ( ON ?auto_26994 ?auto_27043 ) ( CLEAR ?auto_26994 ) ( not ( = ?auto_26995 ?auto_26994 ) ) ( not ( = ?auto_26995 ?auto_27043 ) ) ( not ( = ?auto_26994 ?auto_27043 ) ) ( IS-CRATE ?auto_26995 ) ( not ( = ?auto_27040 ?auto_27005 ) ) ( HOIST-AT ?auto_27046 ?auto_27040 ) ( AVAILABLE ?auto_27046 ) ( SURFACE-AT ?auto_26995 ?auto_27040 ) ( ON ?auto_26995 ?auto_27037 ) ( CLEAR ?auto_26995 ) ( not ( = ?auto_26996 ?auto_26995 ) ) ( not ( = ?auto_26996 ?auto_27037 ) ) ( not ( = ?auto_26995 ?auto_27037 ) ) ( not ( = ?auto_27009 ?auto_27046 ) ) ( IS-CRATE ?auto_26996 ) ( not ( = ?auto_27028 ?auto_27005 ) ) ( HOIST-AT ?auto_27036 ?auto_27028 ) ( AVAILABLE ?auto_27036 ) ( SURFACE-AT ?auto_26996 ?auto_27028 ) ( ON ?auto_26996 ?auto_27012 ) ( CLEAR ?auto_26996 ) ( not ( = ?auto_26993 ?auto_26996 ) ) ( not ( = ?auto_26993 ?auto_27012 ) ) ( not ( = ?auto_26996 ?auto_27012 ) ) ( not ( = ?auto_27009 ?auto_27036 ) ) ( IS-CRATE ?auto_26993 ) ( not ( = ?auto_27045 ?auto_27005 ) ) ( HOIST-AT ?auto_27027 ?auto_27045 ) ( AVAILABLE ?auto_27027 ) ( SURFACE-AT ?auto_26993 ?auto_27045 ) ( ON ?auto_26993 ?auto_27024 ) ( CLEAR ?auto_26993 ) ( not ( = ?auto_26992 ?auto_26993 ) ) ( not ( = ?auto_26992 ?auto_27024 ) ) ( not ( = ?auto_26993 ?auto_27024 ) ) ( not ( = ?auto_27009 ?auto_27027 ) ) ( IS-CRATE ?auto_26992 ) ( not ( = ?auto_27023 ?auto_27005 ) ) ( HOIST-AT ?auto_27025 ?auto_27023 ) ( AVAILABLE ?auto_27025 ) ( SURFACE-AT ?auto_26992 ?auto_27023 ) ( ON ?auto_26992 ?auto_27030 ) ( CLEAR ?auto_26992 ) ( not ( = ?auto_26991 ?auto_26992 ) ) ( not ( = ?auto_26991 ?auto_27030 ) ) ( not ( = ?auto_26992 ?auto_27030 ) ) ( not ( = ?auto_27009 ?auto_27025 ) ) ( IS-CRATE ?auto_26991 ) ( AVAILABLE ?auto_27017 ) ( SURFACE-AT ?auto_26991 ?auto_27014 ) ( ON ?auto_26991 ?auto_27039 ) ( CLEAR ?auto_26991 ) ( not ( = ?auto_26990 ?auto_26991 ) ) ( not ( = ?auto_26990 ?auto_27039 ) ) ( not ( = ?auto_26991 ?auto_27039 ) ) ( IS-CRATE ?auto_26990 ) ( AVAILABLE ?auto_27047 ) ( SURFACE-AT ?auto_26990 ?auto_27013 ) ( ON ?auto_26990 ?auto_27034 ) ( CLEAR ?auto_26990 ) ( not ( = ?auto_26989 ?auto_26990 ) ) ( not ( = ?auto_26989 ?auto_27034 ) ) ( not ( = ?auto_26990 ?auto_27034 ) ) ( SURFACE-AT ?auto_26988 ?auto_27005 ) ( CLEAR ?auto_26988 ) ( IS-CRATE ?auto_26989 ) ( AVAILABLE ?auto_27009 ) ( not ( = ?auto_27038 ?auto_27005 ) ) ( HOIST-AT ?auto_27042 ?auto_27038 ) ( AVAILABLE ?auto_27042 ) ( SURFACE-AT ?auto_26989 ?auto_27038 ) ( ON ?auto_26989 ?auto_27011 ) ( CLEAR ?auto_26989 ) ( TRUCK-AT ?auto_27008 ?auto_27005 ) ( not ( = ?auto_26988 ?auto_26989 ) ) ( not ( = ?auto_26988 ?auto_27011 ) ) ( not ( = ?auto_26989 ?auto_27011 ) ) ( not ( = ?auto_27009 ?auto_27042 ) ) ( not ( = ?auto_26988 ?auto_26990 ) ) ( not ( = ?auto_26988 ?auto_27034 ) ) ( not ( = ?auto_26990 ?auto_27011 ) ) ( not ( = ?auto_27013 ?auto_27038 ) ) ( not ( = ?auto_27047 ?auto_27042 ) ) ( not ( = ?auto_27034 ?auto_27011 ) ) ( not ( = ?auto_26988 ?auto_26991 ) ) ( not ( = ?auto_26988 ?auto_27039 ) ) ( not ( = ?auto_26989 ?auto_26991 ) ) ( not ( = ?auto_26989 ?auto_27039 ) ) ( not ( = ?auto_26991 ?auto_27034 ) ) ( not ( = ?auto_26991 ?auto_27011 ) ) ( not ( = ?auto_27014 ?auto_27013 ) ) ( not ( = ?auto_27014 ?auto_27038 ) ) ( not ( = ?auto_27017 ?auto_27047 ) ) ( not ( = ?auto_27017 ?auto_27042 ) ) ( not ( = ?auto_27039 ?auto_27034 ) ) ( not ( = ?auto_27039 ?auto_27011 ) ) ( not ( = ?auto_26988 ?auto_26992 ) ) ( not ( = ?auto_26988 ?auto_27030 ) ) ( not ( = ?auto_26989 ?auto_26992 ) ) ( not ( = ?auto_26989 ?auto_27030 ) ) ( not ( = ?auto_26990 ?auto_26992 ) ) ( not ( = ?auto_26990 ?auto_27030 ) ) ( not ( = ?auto_26992 ?auto_27039 ) ) ( not ( = ?auto_26992 ?auto_27034 ) ) ( not ( = ?auto_26992 ?auto_27011 ) ) ( not ( = ?auto_27023 ?auto_27014 ) ) ( not ( = ?auto_27023 ?auto_27013 ) ) ( not ( = ?auto_27023 ?auto_27038 ) ) ( not ( = ?auto_27025 ?auto_27017 ) ) ( not ( = ?auto_27025 ?auto_27047 ) ) ( not ( = ?auto_27025 ?auto_27042 ) ) ( not ( = ?auto_27030 ?auto_27039 ) ) ( not ( = ?auto_27030 ?auto_27034 ) ) ( not ( = ?auto_27030 ?auto_27011 ) ) ( not ( = ?auto_26988 ?auto_26993 ) ) ( not ( = ?auto_26988 ?auto_27024 ) ) ( not ( = ?auto_26989 ?auto_26993 ) ) ( not ( = ?auto_26989 ?auto_27024 ) ) ( not ( = ?auto_26990 ?auto_26993 ) ) ( not ( = ?auto_26990 ?auto_27024 ) ) ( not ( = ?auto_26991 ?auto_26993 ) ) ( not ( = ?auto_26991 ?auto_27024 ) ) ( not ( = ?auto_26993 ?auto_27030 ) ) ( not ( = ?auto_26993 ?auto_27039 ) ) ( not ( = ?auto_26993 ?auto_27034 ) ) ( not ( = ?auto_26993 ?auto_27011 ) ) ( not ( = ?auto_27045 ?auto_27023 ) ) ( not ( = ?auto_27045 ?auto_27014 ) ) ( not ( = ?auto_27045 ?auto_27013 ) ) ( not ( = ?auto_27045 ?auto_27038 ) ) ( not ( = ?auto_27027 ?auto_27025 ) ) ( not ( = ?auto_27027 ?auto_27017 ) ) ( not ( = ?auto_27027 ?auto_27047 ) ) ( not ( = ?auto_27027 ?auto_27042 ) ) ( not ( = ?auto_27024 ?auto_27030 ) ) ( not ( = ?auto_27024 ?auto_27039 ) ) ( not ( = ?auto_27024 ?auto_27034 ) ) ( not ( = ?auto_27024 ?auto_27011 ) ) ( not ( = ?auto_26988 ?auto_26996 ) ) ( not ( = ?auto_26988 ?auto_27012 ) ) ( not ( = ?auto_26989 ?auto_26996 ) ) ( not ( = ?auto_26989 ?auto_27012 ) ) ( not ( = ?auto_26990 ?auto_26996 ) ) ( not ( = ?auto_26990 ?auto_27012 ) ) ( not ( = ?auto_26991 ?auto_26996 ) ) ( not ( = ?auto_26991 ?auto_27012 ) ) ( not ( = ?auto_26992 ?auto_26996 ) ) ( not ( = ?auto_26992 ?auto_27012 ) ) ( not ( = ?auto_26996 ?auto_27024 ) ) ( not ( = ?auto_26996 ?auto_27030 ) ) ( not ( = ?auto_26996 ?auto_27039 ) ) ( not ( = ?auto_26996 ?auto_27034 ) ) ( not ( = ?auto_26996 ?auto_27011 ) ) ( not ( = ?auto_27028 ?auto_27045 ) ) ( not ( = ?auto_27028 ?auto_27023 ) ) ( not ( = ?auto_27028 ?auto_27014 ) ) ( not ( = ?auto_27028 ?auto_27013 ) ) ( not ( = ?auto_27028 ?auto_27038 ) ) ( not ( = ?auto_27036 ?auto_27027 ) ) ( not ( = ?auto_27036 ?auto_27025 ) ) ( not ( = ?auto_27036 ?auto_27017 ) ) ( not ( = ?auto_27036 ?auto_27047 ) ) ( not ( = ?auto_27036 ?auto_27042 ) ) ( not ( = ?auto_27012 ?auto_27024 ) ) ( not ( = ?auto_27012 ?auto_27030 ) ) ( not ( = ?auto_27012 ?auto_27039 ) ) ( not ( = ?auto_27012 ?auto_27034 ) ) ( not ( = ?auto_27012 ?auto_27011 ) ) ( not ( = ?auto_26988 ?auto_26995 ) ) ( not ( = ?auto_26988 ?auto_27037 ) ) ( not ( = ?auto_26989 ?auto_26995 ) ) ( not ( = ?auto_26989 ?auto_27037 ) ) ( not ( = ?auto_26990 ?auto_26995 ) ) ( not ( = ?auto_26990 ?auto_27037 ) ) ( not ( = ?auto_26991 ?auto_26995 ) ) ( not ( = ?auto_26991 ?auto_27037 ) ) ( not ( = ?auto_26992 ?auto_26995 ) ) ( not ( = ?auto_26992 ?auto_27037 ) ) ( not ( = ?auto_26993 ?auto_26995 ) ) ( not ( = ?auto_26993 ?auto_27037 ) ) ( not ( = ?auto_26995 ?auto_27012 ) ) ( not ( = ?auto_26995 ?auto_27024 ) ) ( not ( = ?auto_26995 ?auto_27030 ) ) ( not ( = ?auto_26995 ?auto_27039 ) ) ( not ( = ?auto_26995 ?auto_27034 ) ) ( not ( = ?auto_26995 ?auto_27011 ) ) ( not ( = ?auto_27040 ?auto_27028 ) ) ( not ( = ?auto_27040 ?auto_27045 ) ) ( not ( = ?auto_27040 ?auto_27023 ) ) ( not ( = ?auto_27040 ?auto_27014 ) ) ( not ( = ?auto_27040 ?auto_27013 ) ) ( not ( = ?auto_27040 ?auto_27038 ) ) ( not ( = ?auto_27046 ?auto_27036 ) ) ( not ( = ?auto_27046 ?auto_27027 ) ) ( not ( = ?auto_27046 ?auto_27025 ) ) ( not ( = ?auto_27046 ?auto_27017 ) ) ( not ( = ?auto_27046 ?auto_27047 ) ) ( not ( = ?auto_27046 ?auto_27042 ) ) ( not ( = ?auto_27037 ?auto_27012 ) ) ( not ( = ?auto_27037 ?auto_27024 ) ) ( not ( = ?auto_27037 ?auto_27030 ) ) ( not ( = ?auto_27037 ?auto_27039 ) ) ( not ( = ?auto_27037 ?auto_27034 ) ) ( not ( = ?auto_27037 ?auto_27011 ) ) ( not ( = ?auto_26988 ?auto_26994 ) ) ( not ( = ?auto_26988 ?auto_27043 ) ) ( not ( = ?auto_26989 ?auto_26994 ) ) ( not ( = ?auto_26989 ?auto_27043 ) ) ( not ( = ?auto_26990 ?auto_26994 ) ) ( not ( = ?auto_26990 ?auto_27043 ) ) ( not ( = ?auto_26991 ?auto_26994 ) ) ( not ( = ?auto_26991 ?auto_27043 ) ) ( not ( = ?auto_26992 ?auto_26994 ) ) ( not ( = ?auto_26992 ?auto_27043 ) ) ( not ( = ?auto_26993 ?auto_26994 ) ) ( not ( = ?auto_26993 ?auto_27043 ) ) ( not ( = ?auto_26996 ?auto_26994 ) ) ( not ( = ?auto_26996 ?auto_27043 ) ) ( not ( = ?auto_26994 ?auto_27037 ) ) ( not ( = ?auto_26994 ?auto_27012 ) ) ( not ( = ?auto_26994 ?auto_27024 ) ) ( not ( = ?auto_26994 ?auto_27030 ) ) ( not ( = ?auto_26994 ?auto_27039 ) ) ( not ( = ?auto_26994 ?auto_27034 ) ) ( not ( = ?auto_26994 ?auto_27011 ) ) ( not ( = ?auto_27043 ?auto_27037 ) ) ( not ( = ?auto_27043 ?auto_27012 ) ) ( not ( = ?auto_27043 ?auto_27024 ) ) ( not ( = ?auto_27043 ?auto_27030 ) ) ( not ( = ?auto_27043 ?auto_27039 ) ) ( not ( = ?auto_27043 ?auto_27034 ) ) ( not ( = ?auto_27043 ?auto_27011 ) ) ( not ( = ?auto_26988 ?auto_26997 ) ) ( not ( = ?auto_26988 ?auto_27016 ) ) ( not ( = ?auto_26989 ?auto_26997 ) ) ( not ( = ?auto_26989 ?auto_27016 ) ) ( not ( = ?auto_26990 ?auto_26997 ) ) ( not ( = ?auto_26990 ?auto_27016 ) ) ( not ( = ?auto_26991 ?auto_26997 ) ) ( not ( = ?auto_26991 ?auto_27016 ) ) ( not ( = ?auto_26992 ?auto_26997 ) ) ( not ( = ?auto_26992 ?auto_27016 ) ) ( not ( = ?auto_26993 ?auto_26997 ) ) ( not ( = ?auto_26993 ?auto_27016 ) ) ( not ( = ?auto_26996 ?auto_26997 ) ) ( not ( = ?auto_26996 ?auto_27016 ) ) ( not ( = ?auto_26995 ?auto_26997 ) ) ( not ( = ?auto_26995 ?auto_27016 ) ) ( not ( = ?auto_26997 ?auto_27043 ) ) ( not ( = ?auto_26997 ?auto_27037 ) ) ( not ( = ?auto_26997 ?auto_27012 ) ) ( not ( = ?auto_26997 ?auto_27024 ) ) ( not ( = ?auto_26997 ?auto_27030 ) ) ( not ( = ?auto_26997 ?auto_27039 ) ) ( not ( = ?auto_26997 ?auto_27034 ) ) ( not ( = ?auto_26997 ?auto_27011 ) ) ( not ( = ?auto_27016 ?auto_27043 ) ) ( not ( = ?auto_27016 ?auto_27037 ) ) ( not ( = ?auto_27016 ?auto_27012 ) ) ( not ( = ?auto_27016 ?auto_27024 ) ) ( not ( = ?auto_27016 ?auto_27030 ) ) ( not ( = ?auto_27016 ?auto_27039 ) ) ( not ( = ?auto_27016 ?auto_27034 ) ) ( not ( = ?auto_27016 ?auto_27011 ) ) ( not ( = ?auto_26988 ?auto_26999 ) ) ( not ( = ?auto_26988 ?auto_27041 ) ) ( not ( = ?auto_26989 ?auto_26999 ) ) ( not ( = ?auto_26989 ?auto_27041 ) ) ( not ( = ?auto_26990 ?auto_26999 ) ) ( not ( = ?auto_26990 ?auto_27041 ) ) ( not ( = ?auto_26991 ?auto_26999 ) ) ( not ( = ?auto_26991 ?auto_27041 ) ) ( not ( = ?auto_26992 ?auto_26999 ) ) ( not ( = ?auto_26992 ?auto_27041 ) ) ( not ( = ?auto_26993 ?auto_26999 ) ) ( not ( = ?auto_26993 ?auto_27041 ) ) ( not ( = ?auto_26996 ?auto_26999 ) ) ( not ( = ?auto_26996 ?auto_27041 ) ) ( not ( = ?auto_26995 ?auto_26999 ) ) ( not ( = ?auto_26995 ?auto_27041 ) ) ( not ( = ?auto_26994 ?auto_26999 ) ) ( not ( = ?auto_26994 ?auto_27041 ) ) ( not ( = ?auto_26999 ?auto_27016 ) ) ( not ( = ?auto_26999 ?auto_27043 ) ) ( not ( = ?auto_26999 ?auto_27037 ) ) ( not ( = ?auto_26999 ?auto_27012 ) ) ( not ( = ?auto_26999 ?auto_27024 ) ) ( not ( = ?auto_26999 ?auto_27030 ) ) ( not ( = ?auto_26999 ?auto_27039 ) ) ( not ( = ?auto_26999 ?auto_27034 ) ) ( not ( = ?auto_26999 ?auto_27011 ) ) ( not ( = ?auto_27015 ?auto_27014 ) ) ( not ( = ?auto_27015 ?auto_27013 ) ) ( not ( = ?auto_27015 ?auto_27040 ) ) ( not ( = ?auto_27015 ?auto_27028 ) ) ( not ( = ?auto_27015 ?auto_27045 ) ) ( not ( = ?auto_27015 ?auto_27023 ) ) ( not ( = ?auto_27015 ?auto_27038 ) ) ( not ( = ?auto_27018 ?auto_27017 ) ) ( not ( = ?auto_27018 ?auto_27047 ) ) ( not ( = ?auto_27018 ?auto_27046 ) ) ( not ( = ?auto_27018 ?auto_27036 ) ) ( not ( = ?auto_27018 ?auto_27027 ) ) ( not ( = ?auto_27018 ?auto_27025 ) ) ( not ( = ?auto_27018 ?auto_27042 ) ) ( not ( = ?auto_27041 ?auto_27016 ) ) ( not ( = ?auto_27041 ?auto_27043 ) ) ( not ( = ?auto_27041 ?auto_27037 ) ) ( not ( = ?auto_27041 ?auto_27012 ) ) ( not ( = ?auto_27041 ?auto_27024 ) ) ( not ( = ?auto_27041 ?auto_27030 ) ) ( not ( = ?auto_27041 ?auto_27039 ) ) ( not ( = ?auto_27041 ?auto_27034 ) ) ( not ( = ?auto_27041 ?auto_27011 ) ) ( not ( = ?auto_26988 ?auto_26998 ) ) ( not ( = ?auto_26988 ?auto_27044 ) ) ( not ( = ?auto_26989 ?auto_26998 ) ) ( not ( = ?auto_26989 ?auto_27044 ) ) ( not ( = ?auto_26990 ?auto_26998 ) ) ( not ( = ?auto_26990 ?auto_27044 ) ) ( not ( = ?auto_26991 ?auto_26998 ) ) ( not ( = ?auto_26991 ?auto_27044 ) ) ( not ( = ?auto_26992 ?auto_26998 ) ) ( not ( = ?auto_26992 ?auto_27044 ) ) ( not ( = ?auto_26993 ?auto_26998 ) ) ( not ( = ?auto_26993 ?auto_27044 ) ) ( not ( = ?auto_26996 ?auto_26998 ) ) ( not ( = ?auto_26996 ?auto_27044 ) ) ( not ( = ?auto_26995 ?auto_26998 ) ) ( not ( = ?auto_26995 ?auto_27044 ) ) ( not ( = ?auto_26994 ?auto_26998 ) ) ( not ( = ?auto_26994 ?auto_27044 ) ) ( not ( = ?auto_26997 ?auto_26998 ) ) ( not ( = ?auto_26997 ?auto_27044 ) ) ( not ( = ?auto_26998 ?auto_27041 ) ) ( not ( = ?auto_26998 ?auto_27016 ) ) ( not ( = ?auto_26998 ?auto_27043 ) ) ( not ( = ?auto_26998 ?auto_27037 ) ) ( not ( = ?auto_26998 ?auto_27012 ) ) ( not ( = ?auto_26998 ?auto_27024 ) ) ( not ( = ?auto_26998 ?auto_27030 ) ) ( not ( = ?auto_26998 ?auto_27039 ) ) ( not ( = ?auto_26998 ?auto_27034 ) ) ( not ( = ?auto_26998 ?auto_27011 ) ) ( not ( = ?auto_27021 ?auto_27015 ) ) ( not ( = ?auto_27021 ?auto_27014 ) ) ( not ( = ?auto_27021 ?auto_27013 ) ) ( not ( = ?auto_27021 ?auto_27040 ) ) ( not ( = ?auto_27021 ?auto_27028 ) ) ( not ( = ?auto_27021 ?auto_27045 ) ) ( not ( = ?auto_27021 ?auto_27023 ) ) ( not ( = ?auto_27021 ?auto_27038 ) ) ( not ( = ?auto_27029 ?auto_27018 ) ) ( not ( = ?auto_27029 ?auto_27017 ) ) ( not ( = ?auto_27029 ?auto_27047 ) ) ( not ( = ?auto_27029 ?auto_27046 ) ) ( not ( = ?auto_27029 ?auto_27036 ) ) ( not ( = ?auto_27029 ?auto_27027 ) ) ( not ( = ?auto_27029 ?auto_27025 ) ) ( not ( = ?auto_27029 ?auto_27042 ) ) ( not ( = ?auto_27044 ?auto_27041 ) ) ( not ( = ?auto_27044 ?auto_27016 ) ) ( not ( = ?auto_27044 ?auto_27043 ) ) ( not ( = ?auto_27044 ?auto_27037 ) ) ( not ( = ?auto_27044 ?auto_27012 ) ) ( not ( = ?auto_27044 ?auto_27024 ) ) ( not ( = ?auto_27044 ?auto_27030 ) ) ( not ( = ?auto_27044 ?auto_27039 ) ) ( not ( = ?auto_27044 ?auto_27034 ) ) ( not ( = ?auto_27044 ?auto_27011 ) ) ( not ( = ?auto_26988 ?auto_27000 ) ) ( not ( = ?auto_26988 ?auto_27031 ) ) ( not ( = ?auto_26989 ?auto_27000 ) ) ( not ( = ?auto_26989 ?auto_27031 ) ) ( not ( = ?auto_26990 ?auto_27000 ) ) ( not ( = ?auto_26990 ?auto_27031 ) ) ( not ( = ?auto_26991 ?auto_27000 ) ) ( not ( = ?auto_26991 ?auto_27031 ) ) ( not ( = ?auto_26992 ?auto_27000 ) ) ( not ( = ?auto_26992 ?auto_27031 ) ) ( not ( = ?auto_26993 ?auto_27000 ) ) ( not ( = ?auto_26993 ?auto_27031 ) ) ( not ( = ?auto_26996 ?auto_27000 ) ) ( not ( = ?auto_26996 ?auto_27031 ) ) ( not ( = ?auto_26995 ?auto_27000 ) ) ( not ( = ?auto_26995 ?auto_27031 ) ) ( not ( = ?auto_26994 ?auto_27000 ) ) ( not ( = ?auto_26994 ?auto_27031 ) ) ( not ( = ?auto_26997 ?auto_27000 ) ) ( not ( = ?auto_26997 ?auto_27031 ) ) ( not ( = ?auto_26999 ?auto_27000 ) ) ( not ( = ?auto_26999 ?auto_27031 ) ) ( not ( = ?auto_27000 ?auto_27044 ) ) ( not ( = ?auto_27000 ?auto_27041 ) ) ( not ( = ?auto_27000 ?auto_27016 ) ) ( not ( = ?auto_27000 ?auto_27043 ) ) ( not ( = ?auto_27000 ?auto_27037 ) ) ( not ( = ?auto_27000 ?auto_27012 ) ) ( not ( = ?auto_27000 ?auto_27024 ) ) ( not ( = ?auto_27000 ?auto_27030 ) ) ( not ( = ?auto_27000 ?auto_27039 ) ) ( not ( = ?auto_27000 ?auto_27034 ) ) ( not ( = ?auto_27000 ?auto_27011 ) ) ( not ( = ?auto_27007 ?auto_27021 ) ) ( not ( = ?auto_27007 ?auto_27015 ) ) ( not ( = ?auto_27007 ?auto_27014 ) ) ( not ( = ?auto_27007 ?auto_27013 ) ) ( not ( = ?auto_27007 ?auto_27040 ) ) ( not ( = ?auto_27007 ?auto_27028 ) ) ( not ( = ?auto_27007 ?auto_27045 ) ) ( not ( = ?auto_27007 ?auto_27023 ) ) ( not ( = ?auto_27007 ?auto_27038 ) ) ( not ( = ?auto_27006 ?auto_27029 ) ) ( not ( = ?auto_27006 ?auto_27018 ) ) ( not ( = ?auto_27006 ?auto_27017 ) ) ( not ( = ?auto_27006 ?auto_27047 ) ) ( not ( = ?auto_27006 ?auto_27046 ) ) ( not ( = ?auto_27006 ?auto_27036 ) ) ( not ( = ?auto_27006 ?auto_27027 ) ) ( not ( = ?auto_27006 ?auto_27025 ) ) ( not ( = ?auto_27006 ?auto_27042 ) ) ( not ( = ?auto_27031 ?auto_27044 ) ) ( not ( = ?auto_27031 ?auto_27041 ) ) ( not ( = ?auto_27031 ?auto_27016 ) ) ( not ( = ?auto_27031 ?auto_27043 ) ) ( not ( = ?auto_27031 ?auto_27037 ) ) ( not ( = ?auto_27031 ?auto_27012 ) ) ( not ( = ?auto_27031 ?auto_27024 ) ) ( not ( = ?auto_27031 ?auto_27030 ) ) ( not ( = ?auto_27031 ?auto_27039 ) ) ( not ( = ?auto_27031 ?auto_27034 ) ) ( not ( = ?auto_27031 ?auto_27011 ) ) ( not ( = ?auto_26988 ?auto_27002 ) ) ( not ( = ?auto_26988 ?auto_27035 ) ) ( not ( = ?auto_26989 ?auto_27002 ) ) ( not ( = ?auto_26989 ?auto_27035 ) ) ( not ( = ?auto_26990 ?auto_27002 ) ) ( not ( = ?auto_26990 ?auto_27035 ) ) ( not ( = ?auto_26991 ?auto_27002 ) ) ( not ( = ?auto_26991 ?auto_27035 ) ) ( not ( = ?auto_26992 ?auto_27002 ) ) ( not ( = ?auto_26992 ?auto_27035 ) ) ( not ( = ?auto_26993 ?auto_27002 ) ) ( not ( = ?auto_26993 ?auto_27035 ) ) ( not ( = ?auto_26996 ?auto_27002 ) ) ( not ( = ?auto_26996 ?auto_27035 ) ) ( not ( = ?auto_26995 ?auto_27002 ) ) ( not ( = ?auto_26995 ?auto_27035 ) ) ( not ( = ?auto_26994 ?auto_27002 ) ) ( not ( = ?auto_26994 ?auto_27035 ) ) ( not ( = ?auto_26997 ?auto_27002 ) ) ( not ( = ?auto_26997 ?auto_27035 ) ) ( not ( = ?auto_26999 ?auto_27002 ) ) ( not ( = ?auto_26999 ?auto_27035 ) ) ( not ( = ?auto_26998 ?auto_27002 ) ) ( not ( = ?auto_26998 ?auto_27035 ) ) ( not ( = ?auto_27002 ?auto_27031 ) ) ( not ( = ?auto_27002 ?auto_27044 ) ) ( not ( = ?auto_27002 ?auto_27041 ) ) ( not ( = ?auto_27002 ?auto_27016 ) ) ( not ( = ?auto_27002 ?auto_27043 ) ) ( not ( = ?auto_27002 ?auto_27037 ) ) ( not ( = ?auto_27002 ?auto_27012 ) ) ( not ( = ?auto_27002 ?auto_27024 ) ) ( not ( = ?auto_27002 ?auto_27030 ) ) ( not ( = ?auto_27002 ?auto_27039 ) ) ( not ( = ?auto_27002 ?auto_27034 ) ) ( not ( = ?auto_27002 ?auto_27011 ) ) ( not ( = ?auto_27032 ?auto_27007 ) ) ( not ( = ?auto_27032 ?auto_27021 ) ) ( not ( = ?auto_27032 ?auto_27015 ) ) ( not ( = ?auto_27032 ?auto_27014 ) ) ( not ( = ?auto_27032 ?auto_27013 ) ) ( not ( = ?auto_27032 ?auto_27040 ) ) ( not ( = ?auto_27032 ?auto_27028 ) ) ( not ( = ?auto_27032 ?auto_27045 ) ) ( not ( = ?auto_27032 ?auto_27023 ) ) ( not ( = ?auto_27032 ?auto_27038 ) ) ( not ( = ?auto_27026 ?auto_27006 ) ) ( not ( = ?auto_27026 ?auto_27029 ) ) ( not ( = ?auto_27026 ?auto_27018 ) ) ( not ( = ?auto_27026 ?auto_27017 ) ) ( not ( = ?auto_27026 ?auto_27047 ) ) ( not ( = ?auto_27026 ?auto_27046 ) ) ( not ( = ?auto_27026 ?auto_27036 ) ) ( not ( = ?auto_27026 ?auto_27027 ) ) ( not ( = ?auto_27026 ?auto_27025 ) ) ( not ( = ?auto_27026 ?auto_27042 ) ) ( not ( = ?auto_27035 ?auto_27031 ) ) ( not ( = ?auto_27035 ?auto_27044 ) ) ( not ( = ?auto_27035 ?auto_27041 ) ) ( not ( = ?auto_27035 ?auto_27016 ) ) ( not ( = ?auto_27035 ?auto_27043 ) ) ( not ( = ?auto_27035 ?auto_27037 ) ) ( not ( = ?auto_27035 ?auto_27012 ) ) ( not ( = ?auto_27035 ?auto_27024 ) ) ( not ( = ?auto_27035 ?auto_27030 ) ) ( not ( = ?auto_27035 ?auto_27039 ) ) ( not ( = ?auto_27035 ?auto_27034 ) ) ( not ( = ?auto_27035 ?auto_27011 ) ) ( not ( = ?auto_26988 ?auto_27001 ) ) ( not ( = ?auto_26988 ?auto_27020 ) ) ( not ( = ?auto_26989 ?auto_27001 ) ) ( not ( = ?auto_26989 ?auto_27020 ) ) ( not ( = ?auto_26990 ?auto_27001 ) ) ( not ( = ?auto_26990 ?auto_27020 ) ) ( not ( = ?auto_26991 ?auto_27001 ) ) ( not ( = ?auto_26991 ?auto_27020 ) ) ( not ( = ?auto_26992 ?auto_27001 ) ) ( not ( = ?auto_26992 ?auto_27020 ) ) ( not ( = ?auto_26993 ?auto_27001 ) ) ( not ( = ?auto_26993 ?auto_27020 ) ) ( not ( = ?auto_26996 ?auto_27001 ) ) ( not ( = ?auto_26996 ?auto_27020 ) ) ( not ( = ?auto_26995 ?auto_27001 ) ) ( not ( = ?auto_26995 ?auto_27020 ) ) ( not ( = ?auto_26994 ?auto_27001 ) ) ( not ( = ?auto_26994 ?auto_27020 ) ) ( not ( = ?auto_26997 ?auto_27001 ) ) ( not ( = ?auto_26997 ?auto_27020 ) ) ( not ( = ?auto_26999 ?auto_27001 ) ) ( not ( = ?auto_26999 ?auto_27020 ) ) ( not ( = ?auto_26998 ?auto_27001 ) ) ( not ( = ?auto_26998 ?auto_27020 ) ) ( not ( = ?auto_27000 ?auto_27001 ) ) ( not ( = ?auto_27000 ?auto_27020 ) ) ( not ( = ?auto_27001 ?auto_27035 ) ) ( not ( = ?auto_27001 ?auto_27031 ) ) ( not ( = ?auto_27001 ?auto_27044 ) ) ( not ( = ?auto_27001 ?auto_27041 ) ) ( not ( = ?auto_27001 ?auto_27016 ) ) ( not ( = ?auto_27001 ?auto_27043 ) ) ( not ( = ?auto_27001 ?auto_27037 ) ) ( not ( = ?auto_27001 ?auto_27012 ) ) ( not ( = ?auto_27001 ?auto_27024 ) ) ( not ( = ?auto_27001 ?auto_27030 ) ) ( not ( = ?auto_27001 ?auto_27039 ) ) ( not ( = ?auto_27001 ?auto_27034 ) ) ( not ( = ?auto_27001 ?auto_27011 ) ) ( not ( = ?auto_27020 ?auto_27035 ) ) ( not ( = ?auto_27020 ?auto_27031 ) ) ( not ( = ?auto_27020 ?auto_27044 ) ) ( not ( = ?auto_27020 ?auto_27041 ) ) ( not ( = ?auto_27020 ?auto_27016 ) ) ( not ( = ?auto_27020 ?auto_27043 ) ) ( not ( = ?auto_27020 ?auto_27037 ) ) ( not ( = ?auto_27020 ?auto_27012 ) ) ( not ( = ?auto_27020 ?auto_27024 ) ) ( not ( = ?auto_27020 ?auto_27030 ) ) ( not ( = ?auto_27020 ?auto_27039 ) ) ( not ( = ?auto_27020 ?auto_27034 ) ) ( not ( = ?auto_27020 ?auto_27011 ) ) ( not ( = ?auto_26988 ?auto_27003 ) ) ( not ( = ?auto_26988 ?auto_27022 ) ) ( not ( = ?auto_26989 ?auto_27003 ) ) ( not ( = ?auto_26989 ?auto_27022 ) ) ( not ( = ?auto_26990 ?auto_27003 ) ) ( not ( = ?auto_26990 ?auto_27022 ) ) ( not ( = ?auto_26991 ?auto_27003 ) ) ( not ( = ?auto_26991 ?auto_27022 ) ) ( not ( = ?auto_26992 ?auto_27003 ) ) ( not ( = ?auto_26992 ?auto_27022 ) ) ( not ( = ?auto_26993 ?auto_27003 ) ) ( not ( = ?auto_26993 ?auto_27022 ) ) ( not ( = ?auto_26996 ?auto_27003 ) ) ( not ( = ?auto_26996 ?auto_27022 ) ) ( not ( = ?auto_26995 ?auto_27003 ) ) ( not ( = ?auto_26995 ?auto_27022 ) ) ( not ( = ?auto_26994 ?auto_27003 ) ) ( not ( = ?auto_26994 ?auto_27022 ) ) ( not ( = ?auto_26997 ?auto_27003 ) ) ( not ( = ?auto_26997 ?auto_27022 ) ) ( not ( = ?auto_26999 ?auto_27003 ) ) ( not ( = ?auto_26999 ?auto_27022 ) ) ( not ( = ?auto_26998 ?auto_27003 ) ) ( not ( = ?auto_26998 ?auto_27022 ) ) ( not ( = ?auto_27000 ?auto_27003 ) ) ( not ( = ?auto_27000 ?auto_27022 ) ) ( not ( = ?auto_27002 ?auto_27003 ) ) ( not ( = ?auto_27002 ?auto_27022 ) ) ( not ( = ?auto_27003 ?auto_27020 ) ) ( not ( = ?auto_27003 ?auto_27035 ) ) ( not ( = ?auto_27003 ?auto_27031 ) ) ( not ( = ?auto_27003 ?auto_27044 ) ) ( not ( = ?auto_27003 ?auto_27041 ) ) ( not ( = ?auto_27003 ?auto_27016 ) ) ( not ( = ?auto_27003 ?auto_27043 ) ) ( not ( = ?auto_27003 ?auto_27037 ) ) ( not ( = ?auto_27003 ?auto_27012 ) ) ( not ( = ?auto_27003 ?auto_27024 ) ) ( not ( = ?auto_27003 ?auto_27030 ) ) ( not ( = ?auto_27003 ?auto_27039 ) ) ( not ( = ?auto_27003 ?auto_27034 ) ) ( not ( = ?auto_27003 ?auto_27011 ) ) ( not ( = ?auto_27019 ?auto_27013 ) ) ( not ( = ?auto_27019 ?auto_27032 ) ) ( not ( = ?auto_27019 ?auto_27007 ) ) ( not ( = ?auto_27019 ?auto_27021 ) ) ( not ( = ?auto_27019 ?auto_27015 ) ) ( not ( = ?auto_27019 ?auto_27014 ) ) ( not ( = ?auto_27019 ?auto_27040 ) ) ( not ( = ?auto_27019 ?auto_27028 ) ) ( not ( = ?auto_27019 ?auto_27045 ) ) ( not ( = ?auto_27019 ?auto_27023 ) ) ( not ( = ?auto_27019 ?auto_27038 ) ) ( not ( = ?auto_27033 ?auto_27047 ) ) ( not ( = ?auto_27033 ?auto_27026 ) ) ( not ( = ?auto_27033 ?auto_27006 ) ) ( not ( = ?auto_27033 ?auto_27029 ) ) ( not ( = ?auto_27033 ?auto_27018 ) ) ( not ( = ?auto_27033 ?auto_27017 ) ) ( not ( = ?auto_27033 ?auto_27046 ) ) ( not ( = ?auto_27033 ?auto_27036 ) ) ( not ( = ?auto_27033 ?auto_27027 ) ) ( not ( = ?auto_27033 ?auto_27025 ) ) ( not ( = ?auto_27033 ?auto_27042 ) ) ( not ( = ?auto_27022 ?auto_27020 ) ) ( not ( = ?auto_27022 ?auto_27035 ) ) ( not ( = ?auto_27022 ?auto_27031 ) ) ( not ( = ?auto_27022 ?auto_27044 ) ) ( not ( = ?auto_27022 ?auto_27041 ) ) ( not ( = ?auto_27022 ?auto_27016 ) ) ( not ( = ?auto_27022 ?auto_27043 ) ) ( not ( = ?auto_27022 ?auto_27037 ) ) ( not ( = ?auto_27022 ?auto_27012 ) ) ( not ( = ?auto_27022 ?auto_27024 ) ) ( not ( = ?auto_27022 ?auto_27030 ) ) ( not ( = ?auto_27022 ?auto_27039 ) ) ( not ( = ?auto_27022 ?auto_27034 ) ) ( not ( = ?auto_27022 ?auto_27011 ) ) ( not ( = ?auto_26988 ?auto_27004 ) ) ( not ( = ?auto_26988 ?auto_27010 ) ) ( not ( = ?auto_26989 ?auto_27004 ) ) ( not ( = ?auto_26989 ?auto_27010 ) ) ( not ( = ?auto_26990 ?auto_27004 ) ) ( not ( = ?auto_26990 ?auto_27010 ) ) ( not ( = ?auto_26991 ?auto_27004 ) ) ( not ( = ?auto_26991 ?auto_27010 ) ) ( not ( = ?auto_26992 ?auto_27004 ) ) ( not ( = ?auto_26992 ?auto_27010 ) ) ( not ( = ?auto_26993 ?auto_27004 ) ) ( not ( = ?auto_26993 ?auto_27010 ) ) ( not ( = ?auto_26996 ?auto_27004 ) ) ( not ( = ?auto_26996 ?auto_27010 ) ) ( not ( = ?auto_26995 ?auto_27004 ) ) ( not ( = ?auto_26995 ?auto_27010 ) ) ( not ( = ?auto_26994 ?auto_27004 ) ) ( not ( = ?auto_26994 ?auto_27010 ) ) ( not ( = ?auto_26997 ?auto_27004 ) ) ( not ( = ?auto_26997 ?auto_27010 ) ) ( not ( = ?auto_26999 ?auto_27004 ) ) ( not ( = ?auto_26999 ?auto_27010 ) ) ( not ( = ?auto_26998 ?auto_27004 ) ) ( not ( = ?auto_26998 ?auto_27010 ) ) ( not ( = ?auto_27000 ?auto_27004 ) ) ( not ( = ?auto_27000 ?auto_27010 ) ) ( not ( = ?auto_27002 ?auto_27004 ) ) ( not ( = ?auto_27002 ?auto_27010 ) ) ( not ( = ?auto_27001 ?auto_27004 ) ) ( not ( = ?auto_27001 ?auto_27010 ) ) ( not ( = ?auto_27004 ?auto_27022 ) ) ( not ( = ?auto_27004 ?auto_27020 ) ) ( not ( = ?auto_27004 ?auto_27035 ) ) ( not ( = ?auto_27004 ?auto_27031 ) ) ( not ( = ?auto_27004 ?auto_27044 ) ) ( not ( = ?auto_27004 ?auto_27041 ) ) ( not ( = ?auto_27004 ?auto_27016 ) ) ( not ( = ?auto_27004 ?auto_27043 ) ) ( not ( = ?auto_27004 ?auto_27037 ) ) ( not ( = ?auto_27004 ?auto_27012 ) ) ( not ( = ?auto_27004 ?auto_27024 ) ) ( not ( = ?auto_27004 ?auto_27030 ) ) ( not ( = ?auto_27004 ?auto_27039 ) ) ( not ( = ?auto_27004 ?auto_27034 ) ) ( not ( = ?auto_27004 ?auto_27011 ) ) ( not ( = ?auto_27010 ?auto_27022 ) ) ( not ( = ?auto_27010 ?auto_27020 ) ) ( not ( = ?auto_27010 ?auto_27035 ) ) ( not ( = ?auto_27010 ?auto_27031 ) ) ( not ( = ?auto_27010 ?auto_27044 ) ) ( not ( = ?auto_27010 ?auto_27041 ) ) ( not ( = ?auto_27010 ?auto_27016 ) ) ( not ( = ?auto_27010 ?auto_27043 ) ) ( not ( = ?auto_27010 ?auto_27037 ) ) ( not ( = ?auto_27010 ?auto_27012 ) ) ( not ( = ?auto_27010 ?auto_27024 ) ) ( not ( = ?auto_27010 ?auto_27030 ) ) ( not ( = ?auto_27010 ?auto_27039 ) ) ( not ( = ?auto_27010 ?auto_27034 ) ) ( not ( = ?auto_27010 ?auto_27011 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_26988 ?auto_26989 ?auto_26990 ?auto_26991 ?auto_26992 ?auto_26993 ?auto_26996 ?auto_26995 ?auto_26994 ?auto_26997 ?auto_26999 ?auto_26998 ?auto_27000 ?auto_27002 ?auto_27001 ?auto_27003 )
      ( MAKE-1CRATE ?auto_27003 ?auto_27004 )
      ( MAKE-16CRATE-VERIFY ?auto_26988 ?auto_26989 ?auto_26990 ?auto_26991 ?auto_26992 ?auto_26993 ?auto_26996 ?auto_26995 ?auto_26994 ?auto_26997 ?auto_26999 ?auto_26998 ?auto_27000 ?auto_27002 ?auto_27001 ?auto_27003 ?auto_27004 ) )
  )

)

