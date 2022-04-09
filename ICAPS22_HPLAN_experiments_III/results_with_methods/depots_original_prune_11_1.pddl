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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_441183 - SURFACE
      ?auto_441184 - SURFACE
    )
    :vars
    (
      ?auto_441185 - HOIST
      ?auto_441186 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441185 ?auto_441186 ) ( SURFACE-AT ?auto_441183 ?auto_441186 ) ( CLEAR ?auto_441183 ) ( LIFTING ?auto_441185 ?auto_441184 ) ( IS-CRATE ?auto_441184 ) ( not ( = ?auto_441183 ?auto_441184 ) ) )
    :subtasks
    ( ( !DROP ?auto_441185 ?auto_441184 ?auto_441183 ?auto_441186 )
      ( MAKE-1CRATE-VERIFY ?auto_441183 ?auto_441184 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_441187 - SURFACE
      ?auto_441188 - SURFACE
    )
    :vars
    (
      ?auto_441189 - HOIST
      ?auto_441190 - PLACE
      ?auto_441191 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441189 ?auto_441190 ) ( SURFACE-AT ?auto_441187 ?auto_441190 ) ( CLEAR ?auto_441187 ) ( IS-CRATE ?auto_441188 ) ( not ( = ?auto_441187 ?auto_441188 ) ) ( TRUCK-AT ?auto_441191 ?auto_441190 ) ( AVAILABLE ?auto_441189 ) ( IN ?auto_441188 ?auto_441191 ) )
    :subtasks
    ( ( !UNLOAD ?auto_441189 ?auto_441188 ?auto_441191 ?auto_441190 )
      ( MAKE-1CRATE ?auto_441187 ?auto_441188 )
      ( MAKE-1CRATE-VERIFY ?auto_441187 ?auto_441188 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_441192 - SURFACE
      ?auto_441193 - SURFACE
    )
    :vars
    (
      ?auto_441195 - HOIST
      ?auto_441196 - PLACE
      ?auto_441194 - TRUCK
      ?auto_441197 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441195 ?auto_441196 ) ( SURFACE-AT ?auto_441192 ?auto_441196 ) ( CLEAR ?auto_441192 ) ( IS-CRATE ?auto_441193 ) ( not ( = ?auto_441192 ?auto_441193 ) ) ( AVAILABLE ?auto_441195 ) ( IN ?auto_441193 ?auto_441194 ) ( TRUCK-AT ?auto_441194 ?auto_441197 ) ( not ( = ?auto_441197 ?auto_441196 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_441194 ?auto_441197 ?auto_441196 )
      ( MAKE-1CRATE ?auto_441192 ?auto_441193 )
      ( MAKE-1CRATE-VERIFY ?auto_441192 ?auto_441193 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_441198 - SURFACE
      ?auto_441199 - SURFACE
    )
    :vars
    (
      ?auto_441201 - HOIST
      ?auto_441203 - PLACE
      ?auto_441200 - TRUCK
      ?auto_441202 - PLACE
      ?auto_441204 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_441201 ?auto_441203 ) ( SURFACE-AT ?auto_441198 ?auto_441203 ) ( CLEAR ?auto_441198 ) ( IS-CRATE ?auto_441199 ) ( not ( = ?auto_441198 ?auto_441199 ) ) ( AVAILABLE ?auto_441201 ) ( TRUCK-AT ?auto_441200 ?auto_441202 ) ( not ( = ?auto_441202 ?auto_441203 ) ) ( HOIST-AT ?auto_441204 ?auto_441202 ) ( LIFTING ?auto_441204 ?auto_441199 ) ( not ( = ?auto_441201 ?auto_441204 ) ) )
    :subtasks
    ( ( !LOAD ?auto_441204 ?auto_441199 ?auto_441200 ?auto_441202 )
      ( MAKE-1CRATE ?auto_441198 ?auto_441199 )
      ( MAKE-1CRATE-VERIFY ?auto_441198 ?auto_441199 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_441205 - SURFACE
      ?auto_441206 - SURFACE
    )
    :vars
    (
      ?auto_441209 - HOIST
      ?auto_441211 - PLACE
      ?auto_441210 - TRUCK
      ?auto_441207 - PLACE
      ?auto_441208 - HOIST
      ?auto_441212 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441209 ?auto_441211 ) ( SURFACE-AT ?auto_441205 ?auto_441211 ) ( CLEAR ?auto_441205 ) ( IS-CRATE ?auto_441206 ) ( not ( = ?auto_441205 ?auto_441206 ) ) ( AVAILABLE ?auto_441209 ) ( TRUCK-AT ?auto_441210 ?auto_441207 ) ( not ( = ?auto_441207 ?auto_441211 ) ) ( HOIST-AT ?auto_441208 ?auto_441207 ) ( not ( = ?auto_441209 ?auto_441208 ) ) ( AVAILABLE ?auto_441208 ) ( SURFACE-AT ?auto_441206 ?auto_441207 ) ( ON ?auto_441206 ?auto_441212 ) ( CLEAR ?auto_441206 ) ( not ( = ?auto_441205 ?auto_441212 ) ) ( not ( = ?auto_441206 ?auto_441212 ) ) )
    :subtasks
    ( ( !LIFT ?auto_441208 ?auto_441206 ?auto_441212 ?auto_441207 )
      ( MAKE-1CRATE ?auto_441205 ?auto_441206 )
      ( MAKE-1CRATE-VERIFY ?auto_441205 ?auto_441206 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_441213 - SURFACE
      ?auto_441214 - SURFACE
    )
    :vars
    (
      ?auto_441216 - HOIST
      ?auto_441217 - PLACE
      ?auto_441218 - PLACE
      ?auto_441220 - HOIST
      ?auto_441219 - SURFACE
      ?auto_441215 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441216 ?auto_441217 ) ( SURFACE-AT ?auto_441213 ?auto_441217 ) ( CLEAR ?auto_441213 ) ( IS-CRATE ?auto_441214 ) ( not ( = ?auto_441213 ?auto_441214 ) ) ( AVAILABLE ?auto_441216 ) ( not ( = ?auto_441218 ?auto_441217 ) ) ( HOIST-AT ?auto_441220 ?auto_441218 ) ( not ( = ?auto_441216 ?auto_441220 ) ) ( AVAILABLE ?auto_441220 ) ( SURFACE-AT ?auto_441214 ?auto_441218 ) ( ON ?auto_441214 ?auto_441219 ) ( CLEAR ?auto_441214 ) ( not ( = ?auto_441213 ?auto_441219 ) ) ( not ( = ?auto_441214 ?auto_441219 ) ) ( TRUCK-AT ?auto_441215 ?auto_441217 ) )
    :subtasks
    ( ( !DRIVE ?auto_441215 ?auto_441217 ?auto_441218 )
      ( MAKE-1CRATE ?auto_441213 ?auto_441214 )
      ( MAKE-1CRATE-VERIFY ?auto_441213 ?auto_441214 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_441230 - SURFACE
      ?auto_441231 - SURFACE
      ?auto_441232 - SURFACE
    )
    :vars
    (
      ?auto_441233 - HOIST
      ?auto_441234 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441233 ?auto_441234 ) ( SURFACE-AT ?auto_441231 ?auto_441234 ) ( CLEAR ?auto_441231 ) ( LIFTING ?auto_441233 ?auto_441232 ) ( IS-CRATE ?auto_441232 ) ( not ( = ?auto_441231 ?auto_441232 ) ) ( ON ?auto_441231 ?auto_441230 ) ( not ( = ?auto_441230 ?auto_441231 ) ) ( not ( = ?auto_441230 ?auto_441232 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_441231 ?auto_441232 )
      ( MAKE-2CRATE-VERIFY ?auto_441230 ?auto_441231 ?auto_441232 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_441240 - SURFACE
      ?auto_441241 - SURFACE
      ?auto_441242 - SURFACE
    )
    :vars
    (
      ?auto_441245 - HOIST
      ?auto_441243 - PLACE
      ?auto_441244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441245 ?auto_441243 ) ( SURFACE-AT ?auto_441241 ?auto_441243 ) ( CLEAR ?auto_441241 ) ( IS-CRATE ?auto_441242 ) ( not ( = ?auto_441241 ?auto_441242 ) ) ( TRUCK-AT ?auto_441244 ?auto_441243 ) ( AVAILABLE ?auto_441245 ) ( IN ?auto_441242 ?auto_441244 ) ( ON ?auto_441241 ?auto_441240 ) ( not ( = ?auto_441240 ?auto_441241 ) ) ( not ( = ?auto_441240 ?auto_441242 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_441241 ?auto_441242 )
      ( MAKE-2CRATE-VERIFY ?auto_441240 ?auto_441241 ?auto_441242 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_441246 - SURFACE
      ?auto_441247 - SURFACE
    )
    :vars
    (
      ?auto_441249 - HOIST
      ?auto_441251 - PLACE
      ?auto_441248 - TRUCK
      ?auto_441250 - SURFACE
      ?auto_441252 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441249 ?auto_441251 ) ( SURFACE-AT ?auto_441246 ?auto_441251 ) ( CLEAR ?auto_441246 ) ( IS-CRATE ?auto_441247 ) ( not ( = ?auto_441246 ?auto_441247 ) ) ( AVAILABLE ?auto_441249 ) ( IN ?auto_441247 ?auto_441248 ) ( ON ?auto_441246 ?auto_441250 ) ( not ( = ?auto_441250 ?auto_441246 ) ) ( not ( = ?auto_441250 ?auto_441247 ) ) ( TRUCK-AT ?auto_441248 ?auto_441252 ) ( not ( = ?auto_441252 ?auto_441251 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_441248 ?auto_441252 ?auto_441251 )
      ( MAKE-2CRATE ?auto_441250 ?auto_441246 ?auto_441247 )
      ( MAKE-1CRATE-VERIFY ?auto_441246 ?auto_441247 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_441253 - SURFACE
      ?auto_441254 - SURFACE
      ?auto_441255 - SURFACE
    )
    :vars
    (
      ?auto_441256 - HOIST
      ?auto_441258 - PLACE
      ?auto_441259 - TRUCK
      ?auto_441257 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441256 ?auto_441258 ) ( SURFACE-AT ?auto_441254 ?auto_441258 ) ( CLEAR ?auto_441254 ) ( IS-CRATE ?auto_441255 ) ( not ( = ?auto_441254 ?auto_441255 ) ) ( AVAILABLE ?auto_441256 ) ( IN ?auto_441255 ?auto_441259 ) ( ON ?auto_441254 ?auto_441253 ) ( not ( = ?auto_441253 ?auto_441254 ) ) ( not ( = ?auto_441253 ?auto_441255 ) ) ( TRUCK-AT ?auto_441259 ?auto_441257 ) ( not ( = ?auto_441257 ?auto_441258 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_441254 ?auto_441255 )
      ( MAKE-2CRATE-VERIFY ?auto_441253 ?auto_441254 ?auto_441255 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_441260 - SURFACE
      ?auto_441261 - SURFACE
    )
    :vars
    (
      ?auto_441262 - HOIST
      ?auto_441264 - PLACE
      ?auto_441266 - SURFACE
      ?auto_441265 - TRUCK
      ?auto_441263 - PLACE
      ?auto_441267 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_441262 ?auto_441264 ) ( SURFACE-AT ?auto_441260 ?auto_441264 ) ( CLEAR ?auto_441260 ) ( IS-CRATE ?auto_441261 ) ( not ( = ?auto_441260 ?auto_441261 ) ) ( AVAILABLE ?auto_441262 ) ( ON ?auto_441260 ?auto_441266 ) ( not ( = ?auto_441266 ?auto_441260 ) ) ( not ( = ?auto_441266 ?auto_441261 ) ) ( TRUCK-AT ?auto_441265 ?auto_441263 ) ( not ( = ?auto_441263 ?auto_441264 ) ) ( HOIST-AT ?auto_441267 ?auto_441263 ) ( LIFTING ?auto_441267 ?auto_441261 ) ( not ( = ?auto_441262 ?auto_441267 ) ) )
    :subtasks
    ( ( !LOAD ?auto_441267 ?auto_441261 ?auto_441265 ?auto_441263 )
      ( MAKE-2CRATE ?auto_441266 ?auto_441260 ?auto_441261 )
      ( MAKE-1CRATE-VERIFY ?auto_441260 ?auto_441261 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_441268 - SURFACE
      ?auto_441269 - SURFACE
      ?auto_441270 - SURFACE
    )
    :vars
    (
      ?auto_441275 - HOIST
      ?auto_441273 - PLACE
      ?auto_441272 - TRUCK
      ?auto_441271 - PLACE
      ?auto_441274 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_441275 ?auto_441273 ) ( SURFACE-AT ?auto_441269 ?auto_441273 ) ( CLEAR ?auto_441269 ) ( IS-CRATE ?auto_441270 ) ( not ( = ?auto_441269 ?auto_441270 ) ) ( AVAILABLE ?auto_441275 ) ( ON ?auto_441269 ?auto_441268 ) ( not ( = ?auto_441268 ?auto_441269 ) ) ( not ( = ?auto_441268 ?auto_441270 ) ) ( TRUCK-AT ?auto_441272 ?auto_441271 ) ( not ( = ?auto_441271 ?auto_441273 ) ) ( HOIST-AT ?auto_441274 ?auto_441271 ) ( LIFTING ?auto_441274 ?auto_441270 ) ( not ( = ?auto_441275 ?auto_441274 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_441269 ?auto_441270 )
      ( MAKE-2CRATE-VERIFY ?auto_441268 ?auto_441269 ?auto_441270 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_441276 - SURFACE
      ?auto_441277 - SURFACE
    )
    :vars
    (
      ?auto_441281 - HOIST
      ?auto_441278 - PLACE
      ?auto_441280 - SURFACE
      ?auto_441283 - TRUCK
      ?auto_441282 - PLACE
      ?auto_441279 - HOIST
      ?auto_441284 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441281 ?auto_441278 ) ( SURFACE-AT ?auto_441276 ?auto_441278 ) ( CLEAR ?auto_441276 ) ( IS-CRATE ?auto_441277 ) ( not ( = ?auto_441276 ?auto_441277 ) ) ( AVAILABLE ?auto_441281 ) ( ON ?auto_441276 ?auto_441280 ) ( not ( = ?auto_441280 ?auto_441276 ) ) ( not ( = ?auto_441280 ?auto_441277 ) ) ( TRUCK-AT ?auto_441283 ?auto_441282 ) ( not ( = ?auto_441282 ?auto_441278 ) ) ( HOIST-AT ?auto_441279 ?auto_441282 ) ( not ( = ?auto_441281 ?auto_441279 ) ) ( AVAILABLE ?auto_441279 ) ( SURFACE-AT ?auto_441277 ?auto_441282 ) ( ON ?auto_441277 ?auto_441284 ) ( CLEAR ?auto_441277 ) ( not ( = ?auto_441276 ?auto_441284 ) ) ( not ( = ?auto_441277 ?auto_441284 ) ) ( not ( = ?auto_441280 ?auto_441284 ) ) )
    :subtasks
    ( ( !LIFT ?auto_441279 ?auto_441277 ?auto_441284 ?auto_441282 )
      ( MAKE-2CRATE ?auto_441280 ?auto_441276 ?auto_441277 )
      ( MAKE-1CRATE-VERIFY ?auto_441276 ?auto_441277 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_441285 - SURFACE
      ?auto_441286 - SURFACE
      ?auto_441287 - SURFACE
    )
    :vars
    (
      ?auto_441288 - HOIST
      ?auto_441289 - PLACE
      ?auto_441290 - TRUCK
      ?auto_441293 - PLACE
      ?auto_441291 - HOIST
      ?auto_441292 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441288 ?auto_441289 ) ( SURFACE-AT ?auto_441286 ?auto_441289 ) ( CLEAR ?auto_441286 ) ( IS-CRATE ?auto_441287 ) ( not ( = ?auto_441286 ?auto_441287 ) ) ( AVAILABLE ?auto_441288 ) ( ON ?auto_441286 ?auto_441285 ) ( not ( = ?auto_441285 ?auto_441286 ) ) ( not ( = ?auto_441285 ?auto_441287 ) ) ( TRUCK-AT ?auto_441290 ?auto_441293 ) ( not ( = ?auto_441293 ?auto_441289 ) ) ( HOIST-AT ?auto_441291 ?auto_441293 ) ( not ( = ?auto_441288 ?auto_441291 ) ) ( AVAILABLE ?auto_441291 ) ( SURFACE-AT ?auto_441287 ?auto_441293 ) ( ON ?auto_441287 ?auto_441292 ) ( CLEAR ?auto_441287 ) ( not ( = ?auto_441286 ?auto_441292 ) ) ( not ( = ?auto_441287 ?auto_441292 ) ) ( not ( = ?auto_441285 ?auto_441292 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_441286 ?auto_441287 )
      ( MAKE-2CRATE-VERIFY ?auto_441285 ?auto_441286 ?auto_441287 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_441294 - SURFACE
      ?auto_441295 - SURFACE
    )
    :vars
    (
      ?auto_441298 - HOIST
      ?auto_441302 - PLACE
      ?auto_441299 - SURFACE
      ?auto_441297 - PLACE
      ?auto_441296 - HOIST
      ?auto_441300 - SURFACE
      ?auto_441301 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441298 ?auto_441302 ) ( SURFACE-AT ?auto_441294 ?auto_441302 ) ( CLEAR ?auto_441294 ) ( IS-CRATE ?auto_441295 ) ( not ( = ?auto_441294 ?auto_441295 ) ) ( AVAILABLE ?auto_441298 ) ( ON ?auto_441294 ?auto_441299 ) ( not ( = ?auto_441299 ?auto_441294 ) ) ( not ( = ?auto_441299 ?auto_441295 ) ) ( not ( = ?auto_441297 ?auto_441302 ) ) ( HOIST-AT ?auto_441296 ?auto_441297 ) ( not ( = ?auto_441298 ?auto_441296 ) ) ( AVAILABLE ?auto_441296 ) ( SURFACE-AT ?auto_441295 ?auto_441297 ) ( ON ?auto_441295 ?auto_441300 ) ( CLEAR ?auto_441295 ) ( not ( = ?auto_441294 ?auto_441300 ) ) ( not ( = ?auto_441295 ?auto_441300 ) ) ( not ( = ?auto_441299 ?auto_441300 ) ) ( TRUCK-AT ?auto_441301 ?auto_441302 ) )
    :subtasks
    ( ( !DRIVE ?auto_441301 ?auto_441302 ?auto_441297 )
      ( MAKE-2CRATE ?auto_441299 ?auto_441294 ?auto_441295 )
      ( MAKE-1CRATE-VERIFY ?auto_441294 ?auto_441295 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_441303 - SURFACE
      ?auto_441304 - SURFACE
      ?auto_441305 - SURFACE
    )
    :vars
    (
      ?auto_441306 - HOIST
      ?auto_441307 - PLACE
      ?auto_441311 - PLACE
      ?auto_441308 - HOIST
      ?auto_441310 - SURFACE
      ?auto_441309 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441306 ?auto_441307 ) ( SURFACE-AT ?auto_441304 ?auto_441307 ) ( CLEAR ?auto_441304 ) ( IS-CRATE ?auto_441305 ) ( not ( = ?auto_441304 ?auto_441305 ) ) ( AVAILABLE ?auto_441306 ) ( ON ?auto_441304 ?auto_441303 ) ( not ( = ?auto_441303 ?auto_441304 ) ) ( not ( = ?auto_441303 ?auto_441305 ) ) ( not ( = ?auto_441311 ?auto_441307 ) ) ( HOIST-AT ?auto_441308 ?auto_441311 ) ( not ( = ?auto_441306 ?auto_441308 ) ) ( AVAILABLE ?auto_441308 ) ( SURFACE-AT ?auto_441305 ?auto_441311 ) ( ON ?auto_441305 ?auto_441310 ) ( CLEAR ?auto_441305 ) ( not ( = ?auto_441304 ?auto_441310 ) ) ( not ( = ?auto_441305 ?auto_441310 ) ) ( not ( = ?auto_441303 ?auto_441310 ) ) ( TRUCK-AT ?auto_441309 ?auto_441307 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_441304 ?auto_441305 )
      ( MAKE-2CRATE-VERIFY ?auto_441303 ?auto_441304 ?auto_441305 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_441312 - SURFACE
      ?auto_441313 - SURFACE
    )
    :vars
    (
      ?auto_441314 - HOIST
      ?auto_441319 - PLACE
      ?auto_441320 - SURFACE
      ?auto_441315 - PLACE
      ?auto_441318 - HOIST
      ?auto_441316 - SURFACE
      ?auto_441317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441314 ?auto_441319 ) ( IS-CRATE ?auto_441313 ) ( not ( = ?auto_441312 ?auto_441313 ) ) ( not ( = ?auto_441320 ?auto_441312 ) ) ( not ( = ?auto_441320 ?auto_441313 ) ) ( not ( = ?auto_441315 ?auto_441319 ) ) ( HOIST-AT ?auto_441318 ?auto_441315 ) ( not ( = ?auto_441314 ?auto_441318 ) ) ( AVAILABLE ?auto_441318 ) ( SURFACE-AT ?auto_441313 ?auto_441315 ) ( ON ?auto_441313 ?auto_441316 ) ( CLEAR ?auto_441313 ) ( not ( = ?auto_441312 ?auto_441316 ) ) ( not ( = ?auto_441313 ?auto_441316 ) ) ( not ( = ?auto_441320 ?auto_441316 ) ) ( TRUCK-AT ?auto_441317 ?auto_441319 ) ( SURFACE-AT ?auto_441320 ?auto_441319 ) ( CLEAR ?auto_441320 ) ( LIFTING ?auto_441314 ?auto_441312 ) ( IS-CRATE ?auto_441312 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_441320 ?auto_441312 )
      ( MAKE-2CRATE ?auto_441320 ?auto_441312 ?auto_441313 )
      ( MAKE-1CRATE-VERIFY ?auto_441312 ?auto_441313 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_441321 - SURFACE
      ?auto_441322 - SURFACE
      ?auto_441323 - SURFACE
    )
    :vars
    (
      ?auto_441328 - HOIST
      ?auto_441326 - PLACE
      ?auto_441327 - PLACE
      ?auto_441329 - HOIST
      ?auto_441325 - SURFACE
      ?auto_441324 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441328 ?auto_441326 ) ( IS-CRATE ?auto_441323 ) ( not ( = ?auto_441322 ?auto_441323 ) ) ( not ( = ?auto_441321 ?auto_441322 ) ) ( not ( = ?auto_441321 ?auto_441323 ) ) ( not ( = ?auto_441327 ?auto_441326 ) ) ( HOIST-AT ?auto_441329 ?auto_441327 ) ( not ( = ?auto_441328 ?auto_441329 ) ) ( AVAILABLE ?auto_441329 ) ( SURFACE-AT ?auto_441323 ?auto_441327 ) ( ON ?auto_441323 ?auto_441325 ) ( CLEAR ?auto_441323 ) ( not ( = ?auto_441322 ?auto_441325 ) ) ( not ( = ?auto_441323 ?auto_441325 ) ) ( not ( = ?auto_441321 ?auto_441325 ) ) ( TRUCK-AT ?auto_441324 ?auto_441326 ) ( SURFACE-AT ?auto_441321 ?auto_441326 ) ( CLEAR ?auto_441321 ) ( LIFTING ?auto_441328 ?auto_441322 ) ( IS-CRATE ?auto_441322 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_441322 ?auto_441323 )
      ( MAKE-2CRATE-VERIFY ?auto_441321 ?auto_441322 ?auto_441323 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_441330 - SURFACE
      ?auto_441331 - SURFACE
    )
    :vars
    (
      ?auto_441333 - HOIST
      ?auto_441338 - PLACE
      ?auto_441332 - SURFACE
      ?auto_441336 - PLACE
      ?auto_441337 - HOIST
      ?auto_441334 - SURFACE
      ?auto_441335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441333 ?auto_441338 ) ( IS-CRATE ?auto_441331 ) ( not ( = ?auto_441330 ?auto_441331 ) ) ( not ( = ?auto_441332 ?auto_441330 ) ) ( not ( = ?auto_441332 ?auto_441331 ) ) ( not ( = ?auto_441336 ?auto_441338 ) ) ( HOIST-AT ?auto_441337 ?auto_441336 ) ( not ( = ?auto_441333 ?auto_441337 ) ) ( AVAILABLE ?auto_441337 ) ( SURFACE-AT ?auto_441331 ?auto_441336 ) ( ON ?auto_441331 ?auto_441334 ) ( CLEAR ?auto_441331 ) ( not ( = ?auto_441330 ?auto_441334 ) ) ( not ( = ?auto_441331 ?auto_441334 ) ) ( not ( = ?auto_441332 ?auto_441334 ) ) ( TRUCK-AT ?auto_441335 ?auto_441338 ) ( SURFACE-AT ?auto_441332 ?auto_441338 ) ( CLEAR ?auto_441332 ) ( IS-CRATE ?auto_441330 ) ( AVAILABLE ?auto_441333 ) ( IN ?auto_441330 ?auto_441335 ) )
    :subtasks
    ( ( !UNLOAD ?auto_441333 ?auto_441330 ?auto_441335 ?auto_441338 )
      ( MAKE-2CRATE ?auto_441332 ?auto_441330 ?auto_441331 )
      ( MAKE-1CRATE-VERIFY ?auto_441330 ?auto_441331 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_441339 - SURFACE
      ?auto_441340 - SURFACE
      ?auto_441341 - SURFACE
    )
    :vars
    (
      ?auto_441343 - HOIST
      ?auto_441342 - PLACE
      ?auto_441347 - PLACE
      ?auto_441346 - HOIST
      ?auto_441345 - SURFACE
      ?auto_441344 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441343 ?auto_441342 ) ( IS-CRATE ?auto_441341 ) ( not ( = ?auto_441340 ?auto_441341 ) ) ( not ( = ?auto_441339 ?auto_441340 ) ) ( not ( = ?auto_441339 ?auto_441341 ) ) ( not ( = ?auto_441347 ?auto_441342 ) ) ( HOIST-AT ?auto_441346 ?auto_441347 ) ( not ( = ?auto_441343 ?auto_441346 ) ) ( AVAILABLE ?auto_441346 ) ( SURFACE-AT ?auto_441341 ?auto_441347 ) ( ON ?auto_441341 ?auto_441345 ) ( CLEAR ?auto_441341 ) ( not ( = ?auto_441340 ?auto_441345 ) ) ( not ( = ?auto_441341 ?auto_441345 ) ) ( not ( = ?auto_441339 ?auto_441345 ) ) ( TRUCK-AT ?auto_441344 ?auto_441342 ) ( SURFACE-AT ?auto_441339 ?auto_441342 ) ( CLEAR ?auto_441339 ) ( IS-CRATE ?auto_441340 ) ( AVAILABLE ?auto_441343 ) ( IN ?auto_441340 ?auto_441344 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_441340 ?auto_441341 )
      ( MAKE-2CRATE-VERIFY ?auto_441339 ?auto_441340 ?auto_441341 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_441384 - SURFACE
      ?auto_441385 - SURFACE
    )
    :vars
    (
      ?auto_441388 - HOIST
      ?auto_441386 - PLACE
      ?auto_441391 - SURFACE
      ?auto_441392 - PLACE
      ?auto_441387 - HOIST
      ?auto_441389 - SURFACE
      ?auto_441390 - TRUCK
      ?auto_441393 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441388 ?auto_441386 ) ( SURFACE-AT ?auto_441384 ?auto_441386 ) ( CLEAR ?auto_441384 ) ( IS-CRATE ?auto_441385 ) ( not ( = ?auto_441384 ?auto_441385 ) ) ( AVAILABLE ?auto_441388 ) ( ON ?auto_441384 ?auto_441391 ) ( not ( = ?auto_441391 ?auto_441384 ) ) ( not ( = ?auto_441391 ?auto_441385 ) ) ( not ( = ?auto_441392 ?auto_441386 ) ) ( HOIST-AT ?auto_441387 ?auto_441392 ) ( not ( = ?auto_441388 ?auto_441387 ) ) ( AVAILABLE ?auto_441387 ) ( SURFACE-AT ?auto_441385 ?auto_441392 ) ( ON ?auto_441385 ?auto_441389 ) ( CLEAR ?auto_441385 ) ( not ( = ?auto_441384 ?auto_441389 ) ) ( not ( = ?auto_441385 ?auto_441389 ) ) ( not ( = ?auto_441391 ?auto_441389 ) ) ( TRUCK-AT ?auto_441390 ?auto_441393 ) ( not ( = ?auto_441393 ?auto_441386 ) ) ( not ( = ?auto_441392 ?auto_441393 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_441390 ?auto_441393 ?auto_441386 )
      ( MAKE-1CRATE ?auto_441384 ?auto_441385 )
      ( MAKE-1CRATE-VERIFY ?auto_441384 ?auto_441385 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_441423 - SURFACE
      ?auto_441424 - SURFACE
      ?auto_441425 - SURFACE
      ?auto_441426 - SURFACE
    )
    :vars
    (
      ?auto_441427 - HOIST
      ?auto_441428 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441427 ?auto_441428 ) ( SURFACE-AT ?auto_441425 ?auto_441428 ) ( CLEAR ?auto_441425 ) ( LIFTING ?auto_441427 ?auto_441426 ) ( IS-CRATE ?auto_441426 ) ( not ( = ?auto_441425 ?auto_441426 ) ) ( ON ?auto_441424 ?auto_441423 ) ( ON ?auto_441425 ?auto_441424 ) ( not ( = ?auto_441423 ?auto_441424 ) ) ( not ( = ?auto_441423 ?auto_441425 ) ) ( not ( = ?auto_441423 ?auto_441426 ) ) ( not ( = ?auto_441424 ?auto_441425 ) ) ( not ( = ?auto_441424 ?auto_441426 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_441425 ?auto_441426 )
      ( MAKE-3CRATE-VERIFY ?auto_441423 ?auto_441424 ?auto_441425 ?auto_441426 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_441440 - SURFACE
      ?auto_441441 - SURFACE
      ?auto_441442 - SURFACE
      ?auto_441443 - SURFACE
    )
    :vars
    (
      ?auto_441445 - HOIST
      ?auto_441444 - PLACE
      ?auto_441446 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441445 ?auto_441444 ) ( SURFACE-AT ?auto_441442 ?auto_441444 ) ( CLEAR ?auto_441442 ) ( IS-CRATE ?auto_441443 ) ( not ( = ?auto_441442 ?auto_441443 ) ) ( TRUCK-AT ?auto_441446 ?auto_441444 ) ( AVAILABLE ?auto_441445 ) ( IN ?auto_441443 ?auto_441446 ) ( ON ?auto_441442 ?auto_441441 ) ( not ( = ?auto_441441 ?auto_441442 ) ) ( not ( = ?auto_441441 ?auto_441443 ) ) ( ON ?auto_441441 ?auto_441440 ) ( not ( = ?auto_441440 ?auto_441441 ) ) ( not ( = ?auto_441440 ?auto_441442 ) ) ( not ( = ?auto_441440 ?auto_441443 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_441441 ?auto_441442 ?auto_441443 )
      ( MAKE-3CRATE-VERIFY ?auto_441440 ?auto_441441 ?auto_441442 ?auto_441443 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_441461 - SURFACE
      ?auto_441462 - SURFACE
      ?auto_441463 - SURFACE
      ?auto_441464 - SURFACE
    )
    :vars
    (
      ?auto_441467 - HOIST
      ?auto_441466 - PLACE
      ?auto_441465 - TRUCK
      ?auto_441468 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441467 ?auto_441466 ) ( SURFACE-AT ?auto_441463 ?auto_441466 ) ( CLEAR ?auto_441463 ) ( IS-CRATE ?auto_441464 ) ( not ( = ?auto_441463 ?auto_441464 ) ) ( AVAILABLE ?auto_441467 ) ( IN ?auto_441464 ?auto_441465 ) ( ON ?auto_441463 ?auto_441462 ) ( not ( = ?auto_441462 ?auto_441463 ) ) ( not ( = ?auto_441462 ?auto_441464 ) ) ( TRUCK-AT ?auto_441465 ?auto_441468 ) ( not ( = ?auto_441468 ?auto_441466 ) ) ( ON ?auto_441462 ?auto_441461 ) ( not ( = ?auto_441461 ?auto_441462 ) ) ( not ( = ?auto_441461 ?auto_441463 ) ) ( not ( = ?auto_441461 ?auto_441464 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_441462 ?auto_441463 ?auto_441464 )
      ( MAKE-3CRATE-VERIFY ?auto_441461 ?auto_441462 ?auto_441463 ?auto_441464 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_441485 - SURFACE
      ?auto_441486 - SURFACE
      ?auto_441487 - SURFACE
      ?auto_441488 - SURFACE
    )
    :vars
    (
      ?auto_441489 - HOIST
      ?auto_441491 - PLACE
      ?auto_441490 - TRUCK
      ?auto_441493 - PLACE
      ?auto_441492 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_441489 ?auto_441491 ) ( SURFACE-AT ?auto_441487 ?auto_441491 ) ( CLEAR ?auto_441487 ) ( IS-CRATE ?auto_441488 ) ( not ( = ?auto_441487 ?auto_441488 ) ) ( AVAILABLE ?auto_441489 ) ( ON ?auto_441487 ?auto_441486 ) ( not ( = ?auto_441486 ?auto_441487 ) ) ( not ( = ?auto_441486 ?auto_441488 ) ) ( TRUCK-AT ?auto_441490 ?auto_441493 ) ( not ( = ?auto_441493 ?auto_441491 ) ) ( HOIST-AT ?auto_441492 ?auto_441493 ) ( LIFTING ?auto_441492 ?auto_441488 ) ( not ( = ?auto_441489 ?auto_441492 ) ) ( ON ?auto_441486 ?auto_441485 ) ( not ( = ?auto_441485 ?auto_441486 ) ) ( not ( = ?auto_441485 ?auto_441487 ) ) ( not ( = ?auto_441485 ?auto_441488 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_441486 ?auto_441487 ?auto_441488 )
      ( MAKE-3CRATE-VERIFY ?auto_441485 ?auto_441486 ?auto_441487 ?auto_441488 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_441512 - SURFACE
      ?auto_441513 - SURFACE
      ?auto_441514 - SURFACE
      ?auto_441515 - SURFACE
    )
    :vars
    (
      ?auto_441521 - HOIST
      ?auto_441517 - PLACE
      ?auto_441520 - TRUCK
      ?auto_441518 - PLACE
      ?auto_441516 - HOIST
      ?auto_441519 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441521 ?auto_441517 ) ( SURFACE-AT ?auto_441514 ?auto_441517 ) ( CLEAR ?auto_441514 ) ( IS-CRATE ?auto_441515 ) ( not ( = ?auto_441514 ?auto_441515 ) ) ( AVAILABLE ?auto_441521 ) ( ON ?auto_441514 ?auto_441513 ) ( not ( = ?auto_441513 ?auto_441514 ) ) ( not ( = ?auto_441513 ?auto_441515 ) ) ( TRUCK-AT ?auto_441520 ?auto_441518 ) ( not ( = ?auto_441518 ?auto_441517 ) ) ( HOIST-AT ?auto_441516 ?auto_441518 ) ( not ( = ?auto_441521 ?auto_441516 ) ) ( AVAILABLE ?auto_441516 ) ( SURFACE-AT ?auto_441515 ?auto_441518 ) ( ON ?auto_441515 ?auto_441519 ) ( CLEAR ?auto_441515 ) ( not ( = ?auto_441514 ?auto_441519 ) ) ( not ( = ?auto_441515 ?auto_441519 ) ) ( not ( = ?auto_441513 ?auto_441519 ) ) ( ON ?auto_441513 ?auto_441512 ) ( not ( = ?auto_441512 ?auto_441513 ) ) ( not ( = ?auto_441512 ?auto_441514 ) ) ( not ( = ?auto_441512 ?auto_441515 ) ) ( not ( = ?auto_441512 ?auto_441519 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_441513 ?auto_441514 ?auto_441515 )
      ( MAKE-3CRATE-VERIFY ?auto_441512 ?auto_441513 ?auto_441514 ?auto_441515 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_441540 - SURFACE
      ?auto_441541 - SURFACE
      ?auto_441542 - SURFACE
      ?auto_441543 - SURFACE
    )
    :vars
    (
      ?auto_441544 - HOIST
      ?auto_441549 - PLACE
      ?auto_441545 - PLACE
      ?auto_441546 - HOIST
      ?auto_441547 - SURFACE
      ?auto_441548 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441544 ?auto_441549 ) ( SURFACE-AT ?auto_441542 ?auto_441549 ) ( CLEAR ?auto_441542 ) ( IS-CRATE ?auto_441543 ) ( not ( = ?auto_441542 ?auto_441543 ) ) ( AVAILABLE ?auto_441544 ) ( ON ?auto_441542 ?auto_441541 ) ( not ( = ?auto_441541 ?auto_441542 ) ) ( not ( = ?auto_441541 ?auto_441543 ) ) ( not ( = ?auto_441545 ?auto_441549 ) ) ( HOIST-AT ?auto_441546 ?auto_441545 ) ( not ( = ?auto_441544 ?auto_441546 ) ) ( AVAILABLE ?auto_441546 ) ( SURFACE-AT ?auto_441543 ?auto_441545 ) ( ON ?auto_441543 ?auto_441547 ) ( CLEAR ?auto_441543 ) ( not ( = ?auto_441542 ?auto_441547 ) ) ( not ( = ?auto_441543 ?auto_441547 ) ) ( not ( = ?auto_441541 ?auto_441547 ) ) ( TRUCK-AT ?auto_441548 ?auto_441549 ) ( ON ?auto_441541 ?auto_441540 ) ( not ( = ?auto_441540 ?auto_441541 ) ) ( not ( = ?auto_441540 ?auto_441542 ) ) ( not ( = ?auto_441540 ?auto_441543 ) ) ( not ( = ?auto_441540 ?auto_441547 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_441541 ?auto_441542 ?auto_441543 )
      ( MAKE-3CRATE-VERIFY ?auto_441540 ?auto_441541 ?auto_441542 ?auto_441543 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_441568 - SURFACE
      ?auto_441569 - SURFACE
      ?auto_441570 - SURFACE
      ?auto_441571 - SURFACE
    )
    :vars
    (
      ?auto_441576 - HOIST
      ?auto_441574 - PLACE
      ?auto_441573 - PLACE
      ?auto_441577 - HOIST
      ?auto_441572 - SURFACE
      ?auto_441575 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441576 ?auto_441574 ) ( IS-CRATE ?auto_441571 ) ( not ( = ?auto_441570 ?auto_441571 ) ) ( not ( = ?auto_441569 ?auto_441570 ) ) ( not ( = ?auto_441569 ?auto_441571 ) ) ( not ( = ?auto_441573 ?auto_441574 ) ) ( HOIST-AT ?auto_441577 ?auto_441573 ) ( not ( = ?auto_441576 ?auto_441577 ) ) ( AVAILABLE ?auto_441577 ) ( SURFACE-AT ?auto_441571 ?auto_441573 ) ( ON ?auto_441571 ?auto_441572 ) ( CLEAR ?auto_441571 ) ( not ( = ?auto_441570 ?auto_441572 ) ) ( not ( = ?auto_441571 ?auto_441572 ) ) ( not ( = ?auto_441569 ?auto_441572 ) ) ( TRUCK-AT ?auto_441575 ?auto_441574 ) ( SURFACE-AT ?auto_441569 ?auto_441574 ) ( CLEAR ?auto_441569 ) ( LIFTING ?auto_441576 ?auto_441570 ) ( IS-CRATE ?auto_441570 ) ( ON ?auto_441569 ?auto_441568 ) ( not ( = ?auto_441568 ?auto_441569 ) ) ( not ( = ?auto_441568 ?auto_441570 ) ) ( not ( = ?auto_441568 ?auto_441571 ) ) ( not ( = ?auto_441568 ?auto_441572 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_441569 ?auto_441570 ?auto_441571 )
      ( MAKE-3CRATE-VERIFY ?auto_441568 ?auto_441569 ?auto_441570 ?auto_441571 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_441596 - SURFACE
      ?auto_441597 - SURFACE
      ?auto_441598 - SURFACE
      ?auto_441599 - SURFACE
    )
    :vars
    (
      ?auto_441604 - HOIST
      ?auto_441600 - PLACE
      ?auto_441602 - PLACE
      ?auto_441605 - HOIST
      ?auto_441601 - SURFACE
      ?auto_441603 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441604 ?auto_441600 ) ( IS-CRATE ?auto_441599 ) ( not ( = ?auto_441598 ?auto_441599 ) ) ( not ( = ?auto_441597 ?auto_441598 ) ) ( not ( = ?auto_441597 ?auto_441599 ) ) ( not ( = ?auto_441602 ?auto_441600 ) ) ( HOIST-AT ?auto_441605 ?auto_441602 ) ( not ( = ?auto_441604 ?auto_441605 ) ) ( AVAILABLE ?auto_441605 ) ( SURFACE-AT ?auto_441599 ?auto_441602 ) ( ON ?auto_441599 ?auto_441601 ) ( CLEAR ?auto_441599 ) ( not ( = ?auto_441598 ?auto_441601 ) ) ( not ( = ?auto_441599 ?auto_441601 ) ) ( not ( = ?auto_441597 ?auto_441601 ) ) ( TRUCK-AT ?auto_441603 ?auto_441600 ) ( SURFACE-AT ?auto_441597 ?auto_441600 ) ( CLEAR ?auto_441597 ) ( IS-CRATE ?auto_441598 ) ( AVAILABLE ?auto_441604 ) ( IN ?auto_441598 ?auto_441603 ) ( ON ?auto_441597 ?auto_441596 ) ( not ( = ?auto_441596 ?auto_441597 ) ) ( not ( = ?auto_441596 ?auto_441598 ) ) ( not ( = ?auto_441596 ?auto_441599 ) ) ( not ( = ?auto_441596 ?auto_441601 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_441597 ?auto_441598 ?auto_441599 )
      ( MAKE-3CRATE-VERIFY ?auto_441596 ?auto_441597 ?auto_441598 ?auto_441599 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_441887 - SURFACE
      ?auto_441888 - SURFACE
      ?auto_441889 - SURFACE
      ?auto_441890 - SURFACE
      ?auto_441891 - SURFACE
    )
    :vars
    (
      ?auto_441893 - HOIST
      ?auto_441892 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441893 ?auto_441892 ) ( SURFACE-AT ?auto_441890 ?auto_441892 ) ( CLEAR ?auto_441890 ) ( LIFTING ?auto_441893 ?auto_441891 ) ( IS-CRATE ?auto_441891 ) ( not ( = ?auto_441890 ?auto_441891 ) ) ( ON ?auto_441888 ?auto_441887 ) ( ON ?auto_441889 ?auto_441888 ) ( ON ?auto_441890 ?auto_441889 ) ( not ( = ?auto_441887 ?auto_441888 ) ) ( not ( = ?auto_441887 ?auto_441889 ) ) ( not ( = ?auto_441887 ?auto_441890 ) ) ( not ( = ?auto_441887 ?auto_441891 ) ) ( not ( = ?auto_441888 ?auto_441889 ) ) ( not ( = ?auto_441888 ?auto_441890 ) ) ( not ( = ?auto_441888 ?auto_441891 ) ) ( not ( = ?auto_441889 ?auto_441890 ) ) ( not ( = ?auto_441889 ?auto_441891 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_441890 ?auto_441891 )
      ( MAKE-4CRATE-VERIFY ?auto_441887 ?auto_441888 ?auto_441889 ?auto_441890 ?auto_441891 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_441912 - SURFACE
      ?auto_441913 - SURFACE
      ?auto_441914 - SURFACE
      ?auto_441915 - SURFACE
      ?auto_441916 - SURFACE
    )
    :vars
    (
      ?auto_441918 - HOIST
      ?auto_441917 - PLACE
      ?auto_441919 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441918 ?auto_441917 ) ( SURFACE-AT ?auto_441915 ?auto_441917 ) ( CLEAR ?auto_441915 ) ( IS-CRATE ?auto_441916 ) ( not ( = ?auto_441915 ?auto_441916 ) ) ( TRUCK-AT ?auto_441919 ?auto_441917 ) ( AVAILABLE ?auto_441918 ) ( IN ?auto_441916 ?auto_441919 ) ( ON ?auto_441915 ?auto_441914 ) ( not ( = ?auto_441914 ?auto_441915 ) ) ( not ( = ?auto_441914 ?auto_441916 ) ) ( ON ?auto_441913 ?auto_441912 ) ( ON ?auto_441914 ?auto_441913 ) ( not ( = ?auto_441912 ?auto_441913 ) ) ( not ( = ?auto_441912 ?auto_441914 ) ) ( not ( = ?auto_441912 ?auto_441915 ) ) ( not ( = ?auto_441912 ?auto_441916 ) ) ( not ( = ?auto_441913 ?auto_441914 ) ) ( not ( = ?auto_441913 ?auto_441915 ) ) ( not ( = ?auto_441913 ?auto_441916 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_441914 ?auto_441915 ?auto_441916 )
      ( MAKE-4CRATE-VERIFY ?auto_441912 ?auto_441913 ?auto_441914 ?auto_441915 ?auto_441916 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_441942 - SURFACE
      ?auto_441943 - SURFACE
      ?auto_441944 - SURFACE
      ?auto_441945 - SURFACE
      ?auto_441946 - SURFACE
    )
    :vars
    (
      ?auto_441950 - HOIST
      ?auto_441947 - PLACE
      ?auto_441949 - TRUCK
      ?auto_441948 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441950 ?auto_441947 ) ( SURFACE-AT ?auto_441945 ?auto_441947 ) ( CLEAR ?auto_441945 ) ( IS-CRATE ?auto_441946 ) ( not ( = ?auto_441945 ?auto_441946 ) ) ( AVAILABLE ?auto_441950 ) ( IN ?auto_441946 ?auto_441949 ) ( ON ?auto_441945 ?auto_441944 ) ( not ( = ?auto_441944 ?auto_441945 ) ) ( not ( = ?auto_441944 ?auto_441946 ) ) ( TRUCK-AT ?auto_441949 ?auto_441948 ) ( not ( = ?auto_441948 ?auto_441947 ) ) ( ON ?auto_441943 ?auto_441942 ) ( ON ?auto_441944 ?auto_441943 ) ( not ( = ?auto_441942 ?auto_441943 ) ) ( not ( = ?auto_441942 ?auto_441944 ) ) ( not ( = ?auto_441942 ?auto_441945 ) ) ( not ( = ?auto_441942 ?auto_441946 ) ) ( not ( = ?auto_441943 ?auto_441944 ) ) ( not ( = ?auto_441943 ?auto_441945 ) ) ( not ( = ?auto_441943 ?auto_441946 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_441944 ?auto_441945 ?auto_441946 )
      ( MAKE-4CRATE-VERIFY ?auto_441942 ?auto_441943 ?auto_441944 ?auto_441945 ?auto_441946 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_441976 - SURFACE
      ?auto_441977 - SURFACE
      ?auto_441978 - SURFACE
      ?auto_441979 - SURFACE
      ?auto_441980 - SURFACE
    )
    :vars
    (
      ?auto_441984 - HOIST
      ?auto_441985 - PLACE
      ?auto_441983 - TRUCK
      ?auto_441981 - PLACE
      ?auto_441982 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_441984 ?auto_441985 ) ( SURFACE-AT ?auto_441979 ?auto_441985 ) ( CLEAR ?auto_441979 ) ( IS-CRATE ?auto_441980 ) ( not ( = ?auto_441979 ?auto_441980 ) ) ( AVAILABLE ?auto_441984 ) ( ON ?auto_441979 ?auto_441978 ) ( not ( = ?auto_441978 ?auto_441979 ) ) ( not ( = ?auto_441978 ?auto_441980 ) ) ( TRUCK-AT ?auto_441983 ?auto_441981 ) ( not ( = ?auto_441981 ?auto_441985 ) ) ( HOIST-AT ?auto_441982 ?auto_441981 ) ( LIFTING ?auto_441982 ?auto_441980 ) ( not ( = ?auto_441984 ?auto_441982 ) ) ( ON ?auto_441977 ?auto_441976 ) ( ON ?auto_441978 ?auto_441977 ) ( not ( = ?auto_441976 ?auto_441977 ) ) ( not ( = ?auto_441976 ?auto_441978 ) ) ( not ( = ?auto_441976 ?auto_441979 ) ) ( not ( = ?auto_441976 ?auto_441980 ) ) ( not ( = ?auto_441977 ?auto_441978 ) ) ( not ( = ?auto_441977 ?auto_441979 ) ) ( not ( = ?auto_441977 ?auto_441980 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_441978 ?auto_441979 ?auto_441980 )
      ( MAKE-4CRATE-VERIFY ?auto_441976 ?auto_441977 ?auto_441978 ?auto_441979 ?auto_441980 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_442014 - SURFACE
      ?auto_442015 - SURFACE
      ?auto_442016 - SURFACE
      ?auto_442017 - SURFACE
      ?auto_442018 - SURFACE
    )
    :vars
    (
      ?auto_442019 - HOIST
      ?auto_442023 - PLACE
      ?auto_442024 - TRUCK
      ?auto_442022 - PLACE
      ?auto_442020 - HOIST
      ?auto_442021 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_442019 ?auto_442023 ) ( SURFACE-AT ?auto_442017 ?auto_442023 ) ( CLEAR ?auto_442017 ) ( IS-CRATE ?auto_442018 ) ( not ( = ?auto_442017 ?auto_442018 ) ) ( AVAILABLE ?auto_442019 ) ( ON ?auto_442017 ?auto_442016 ) ( not ( = ?auto_442016 ?auto_442017 ) ) ( not ( = ?auto_442016 ?auto_442018 ) ) ( TRUCK-AT ?auto_442024 ?auto_442022 ) ( not ( = ?auto_442022 ?auto_442023 ) ) ( HOIST-AT ?auto_442020 ?auto_442022 ) ( not ( = ?auto_442019 ?auto_442020 ) ) ( AVAILABLE ?auto_442020 ) ( SURFACE-AT ?auto_442018 ?auto_442022 ) ( ON ?auto_442018 ?auto_442021 ) ( CLEAR ?auto_442018 ) ( not ( = ?auto_442017 ?auto_442021 ) ) ( not ( = ?auto_442018 ?auto_442021 ) ) ( not ( = ?auto_442016 ?auto_442021 ) ) ( ON ?auto_442015 ?auto_442014 ) ( ON ?auto_442016 ?auto_442015 ) ( not ( = ?auto_442014 ?auto_442015 ) ) ( not ( = ?auto_442014 ?auto_442016 ) ) ( not ( = ?auto_442014 ?auto_442017 ) ) ( not ( = ?auto_442014 ?auto_442018 ) ) ( not ( = ?auto_442014 ?auto_442021 ) ) ( not ( = ?auto_442015 ?auto_442016 ) ) ( not ( = ?auto_442015 ?auto_442017 ) ) ( not ( = ?auto_442015 ?auto_442018 ) ) ( not ( = ?auto_442015 ?auto_442021 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442016 ?auto_442017 ?auto_442018 )
      ( MAKE-4CRATE-VERIFY ?auto_442014 ?auto_442015 ?auto_442016 ?auto_442017 ?auto_442018 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_442053 - SURFACE
      ?auto_442054 - SURFACE
      ?auto_442055 - SURFACE
      ?auto_442056 - SURFACE
      ?auto_442057 - SURFACE
    )
    :vars
    (
      ?auto_442058 - HOIST
      ?auto_442060 - PLACE
      ?auto_442063 - PLACE
      ?auto_442062 - HOIST
      ?auto_442061 - SURFACE
      ?auto_442059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442058 ?auto_442060 ) ( SURFACE-AT ?auto_442056 ?auto_442060 ) ( CLEAR ?auto_442056 ) ( IS-CRATE ?auto_442057 ) ( not ( = ?auto_442056 ?auto_442057 ) ) ( AVAILABLE ?auto_442058 ) ( ON ?auto_442056 ?auto_442055 ) ( not ( = ?auto_442055 ?auto_442056 ) ) ( not ( = ?auto_442055 ?auto_442057 ) ) ( not ( = ?auto_442063 ?auto_442060 ) ) ( HOIST-AT ?auto_442062 ?auto_442063 ) ( not ( = ?auto_442058 ?auto_442062 ) ) ( AVAILABLE ?auto_442062 ) ( SURFACE-AT ?auto_442057 ?auto_442063 ) ( ON ?auto_442057 ?auto_442061 ) ( CLEAR ?auto_442057 ) ( not ( = ?auto_442056 ?auto_442061 ) ) ( not ( = ?auto_442057 ?auto_442061 ) ) ( not ( = ?auto_442055 ?auto_442061 ) ) ( TRUCK-AT ?auto_442059 ?auto_442060 ) ( ON ?auto_442054 ?auto_442053 ) ( ON ?auto_442055 ?auto_442054 ) ( not ( = ?auto_442053 ?auto_442054 ) ) ( not ( = ?auto_442053 ?auto_442055 ) ) ( not ( = ?auto_442053 ?auto_442056 ) ) ( not ( = ?auto_442053 ?auto_442057 ) ) ( not ( = ?auto_442053 ?auto_442061 ) ) ( not ( = ?auto_442054 ?auto_442055 ) ) ( not ( = ?auto_442054 ?auto_442056 ) ) ( not ( = ?auto_442054 ?auto_442057 ) ) ( not ( = ?auto_442054 ?auto_442061 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442055 ?auto_442056 ?auto_442057 )
      ( MAKE-4CRATE-VERIFY ?auto_442053 ?auto_442054 ?auto_442055 ?auto_442056 ?auto_442057 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_442092 - SURFACE
      ?auto_442093 - SURFACE
      ?auto_442094 - SURFACE
      ?auto_442095 - SURFACE
      ?auto_442096 - SURFACE
    )
    :vars
    (
      ?auto_442102 - HOIST
      ?auto_442099 - PLACE
      ?auto_442101 - PLACE
      ?auto_442097 - HOIST
      ?auto_442100 - SURFACE
      ?auto_442098 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442102 ?auto_442099 ) ( IS-CRATE ?auto_442096 ) ( not ( = ?auto_442095 ?auto_442096 ) ) ( not ( = ?auto_442094 ?auto_442095 ) ) ( not ( = ?auto_442094 ?auto_442096 ) ) ( not ( = ?auto_442101 ?auto_442099 ) ) ( HOIST-AT ?auto_442097 ?auto_442101 ) ( not ( = ?auto_442102 ?auto_442097 ) ) ( AVAILABLE ?auto_442097 ) ( SURFACE-AT ?auto_442096 ?auto_442101 ) ( ON ?auto_442096 ?auto_442100 ) ( CLEAR ?auto_442096 ) ( not ( = ?auto_442095 ?auto_442100 ) ) ( not ( = ?auto_442096 ?auto_442100 ) ) ( not ( = ?auto_442094 ?auto_442100 ) ) ( TRUCK-AT ?auto_442098 ?auto_442099 ) ( SURFACE-AT ?auto_442094 ?auto_442099 ) ( CLEAR ?auto_442094 ) ( LIFTING ?auto_442102 ?auto_442095 ) ( IS-CRATE ?auto_442095 ) ( ON ?auto_442093 ?auto_442092 ) ( ON ?auto_442094 ?auto_442093 ) ( not ( = ?auto_442092 ?auto_442093 ) ) ( not ( = ?auto_442092 ?auto_442094 ) ) ( not ( = ?auto_442092 ?auto_442095 ) ) ( not ( = ?auto_442092 ?auto_442096 ) ) ( not ( = ?auto_442092 ?auto_442100 ) ) ( not ( = ?auto_442093 ?auto_442094 ) ) ( not ( = ?auto_442093 ?auto_442095 ) ) ( not ( = ?auto_442093 ?auto_442096 ) ) ( not ( = ?auto_442093 ?auto_442100 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442094 ?auto_442095 ?auto_442096 )
      ( MAKE-4CRATE-VERIFY ?auto_442092 ?auto_442093 ?auto_442094 ?auto_442095 ?auto_442096 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_442131 - SURFACE
      ?auto_442132 - SURFACE
      ?auto_442133 - SURFACE
      ?auto_442134 - SURFACE
      ?auto_442135 - SURFACE
    )
    :vars
    (
      ?auto_442137 - HOIST
      ?auto_442138 - PLACE
      ?auto_442139 - PLACE
      ?auto_442141 - HOIST
      ?auto_442136 - SURFACE
      ?auto_442140 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442137 ?auto_442138 ) ( IS-CRATE ?auto_442135 ) ( not ( = ?auto_442134 ?auto_442135 ) ) ( not ( = ?auto_442133 ?auto_442134 ) ) ( not ( = ?auto_442133 ?auto_442135 ) ) ( not ( = ?auto_442139 ?auto_442138 ) ) ( HOIST-AT ?auto_442141 ?auto_442139 ) ( not ( = ?auto_442137 ?auto_442141 ) ) ( AVAILABLE ?auto_442141 ) ( SURFACE-AT ?auto_442135 ?auto_442139 ) ( ON ?auto_442135 ?auto_442136 ) ( CLEAR ?auto_442135 ) ( not ( = ?auto_442134 ?auto_442136 ) ) ( not ( = ?auto_442135 ?auto_442136 ) ) ( not ( = ?auto_442133 ?auto_442136 ) ) ( TRUCK-AT ?auto_442140 ?auto_442138 ) ( SURFACE-AT ?auto_442133 ?auto_442138 ) ( CLEAR ?auto_442133 ) ( IS-CRATE ?auto_442134 ) ( AVAILABLE ?auto_442137 ) ( IN ?auto_442134 ?auto_442140 ) ( ON ?auto_442132 ?auto_442131 ) ( ON ?auto_442133 ?auto_442132 ) ( not ( = ?auto_442131 ?auto_442132 ) ) ( not ( = ?auto_442131 ?auto_442133 ) ) ( not ( = ?auto_442131 ?auto_442134 ) ) ( not ( = ?auto_442131 ?auto_442135 ) ) ( not ( = ?auto_442131 ?auto_442136 ) ) ( not ( = ?auto_442132 ?auto_442133 ) ) ( not ( = ?auto_442132 ?auto_442134 ) ) ( not ( = ?auto_442132 ?auto_442135 ) ) ( not ( = ?auto_442132 ?auto_442136 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442133 ?auto_442134 ?auto_442135 )
      ( MAKE-4CRATE-VERIFY ?auto_442131 ?auto_442132 ?auto_442133 ?auto_442134 ?auto_442135 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_442791 - SURFACE
      ?auto_442792 - SURFACE
      ?auto_442793 - SURFACE
      ?auto_442794 - SURFACE
      ?auto_442795 - SURFACE
      ?auto_442796 - SURFACE
    )
    :vars
    (
      ?auto_442797 - HOIST
      ?auto_442798 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_442797 ?auto_442798 ) ( SURFACE-AT ?auto_442795 ?auto_442798 ) ( CLEAR ?auto_442795 ) ( LIFTING ?auto_442797 ?auto_442796 ) ( IS-CRATE ?auto_442796 ) ( not ( = ?auto_442795 ?auto_442796 ) ) ( ON ?auto_442792 ?auto_442791 ) ( ON ?auto_442793 ?auto_442792 ) ( ON ?auto_442794 ?auto_442793 ) ( ON ?auto_442795 ?auto_442794 ) ( not ( = ?auto_442791 ?auto_442792 ) ) ( not ( = ?auto_442791 ?auto_442793 ) ) ( not ( = ?auto_442791 ?auto_442794 ) ) ( not ( = ?auto_442791 ?auto_442795 ) ) ( not ( = ?auto_442791 ?auto_442796 ) ) ( not ( = ?auto_442792 ?auto_442793 ) ) ( not ( = ?auto_442792 ?auto_442794 ) ) ( not ( = ?auto_442792 ?auto_442795 ) ) ( not ( = ?auto_442792 ?auto_442796 ) ) ( not ( = ?auto_442793 ?auto_442794 ) ) ( not ( = ?auto_442793 ?auto_442795 ) ) ( not ( = ?auto_442793 ?auto_442796 ) ) ( not ( = ?auto_442794 ?auto_442795 ) ) ( not ( = ?auto_442794 ?auto_442796 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_442795 ?auto_442796 )
      ( MAKE-5CRATE-VERIFY ?auto_442791 ?auto_442792 ?auto_442793 ?auto_442794 ?auto_442795 ?auto_442796 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_442825 - SURFACE
      ?auto_442826 - SURFACE
      ?auto_442827 - SURFACE
      ?auto_442828 - SURFACE
      ?auto_442829 - SURFACE
      ?auto_442830 - SURFACE
    )
    :vars
    (
      ?auto_442831 - HOIST
      ?auto_442833 - PLACE
      ?auto_442832 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442831 ?auto_442833 ) ( SURFACE-AT ?auto_442829 ?auto_442833 ) ( CLEAR ?auto_442829 ) ( IS-CRATE ?auto_442830 ) ( not ( = ?auto_442829 ?auto_442830 ) ) ( TRUCK-AT ?auto_442832 ?auto_442833 ) ( AVAILABLE ?auto_442831 ) ( IN ?auto_442830 ?auto_442832 ) ( ON ?auto_442829 ?auto_442828 ) ( not ( = ?auto_442828 ?auto_442829 ) ) ( not ( = ?auto_442828 ?auto_442830 ) ) ( ON ?auto_442826 ?auto_442825 ) ( ON ?auto_442827 ?auto_442826 ) ( ON ?auto_442828 ?auto_442827 ) ( not ( = ?auto_442825 ?auto_442826 ) ) ( not ( = ?auto_442825 ?auto_442827 ) ) ( not ( = ?auto_442825 ?auto_442828 ) ) ( not ( = ?auto_442825 ?auto_442829 ) ) ( not ( = ?auto_442825 ?auto_442830 ) ) ( not ( = ?auto_442826 ?auto_442827 ) ) ( not ( = ?auto_442826 ?auto_442828 ) ) ( not ( = ?auto_442826 ?auto_442829 ) ) ( not ( = ?auto_442826 ?auto_442830 ) ) ( not ( = ?auto_442827 ?auto_442828 ) ) ( not ( = ?auto_442827 ?auto_442829 ) ) ( not ( = ?auto_442827 ?auto_442830 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442828 ?auto_442829 ?auto_442830 )
      ( MAKE-5CRATE-VERIFY ?auto_442825 ?auto_442826 ?auto_442827 ?auto_442828 ?auto_442829 ?auto_442830 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_442865 - SURFACE
      ?auto_442866 - SURFACE
      ?auto_442867 - SURFACE
      ?auto_442868 - SURFACE
      ?auto_442869 - SURFACE
      ?auto_442870 - SURFACE
    )
    :vars
    (
      ?auto_442872 - HOIST
      ?auto_442873 - PLACE
      ?auto_442871 - TRUCK
      ?auto_442874 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_442872 ?auto_442873 ) ( SURFACE-AT ?auto_442869 ?auto_442873 ) ( CLEAR ?auto_442869 ) ( IS-CRATE ?auto_442870 ) ( not ( = ?auto_442869 ?auto_442870 ) ) ( AVAILABLE ?auto_442872 ) ( IN ?auto_442870 ?auto_442871 ) ( ON ?auto_442869 ?auto_442868 ) ( not ( = ?auto_442868 ?auto_442869 ) ) ( not ( = ?auto_442868 ?auto_442870 ) ) ( TRUCK-AT ?auto_442871 ?auto_442874 ) ( not ( = ?auto_442874 ?auto_442873 ) ) ( ON ?auto_442866 ?auto_442865 ) ( ON ?auto_442867 ?auto_442866 ) ( ON ?auto_442868 ?auto_442867 ) ( not ( = ?auto_442865 ?auto_442866 ) ) ( not ( = ?auto_442865 ?auto_442867 ) ) ( not ( = ?auto_442865 ?auto_442868 ) ) ( not ( = ?auto_442865 ?auto_442869 ) ) ( not ( = ?auto_442865 ?auto_442870 ) ) ( not ( = ?auto_442866 ?auto_442867 ) ) ( not ( = ?auto_442866 ?auto_442868 ) ) ( not ( = ?auto_442866 ?auto_442869 ) ) ( not ( = ?auto_442866 ?auto_442870 ) ) ( not ( = ?auto_442867 ?auto_442868 ) ) ( not ( = ?auto_442867 ?auto_442869 ) ) ( not ( = ?auto_442867 ?auto_442870 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442868 ?auto_442869 ?auto_442870 )
      ( MAKE-5CRATE-VERIFY ?auto_442865 ?auto_442866 ?auto_442867 ?auto_442868 ?auto_442869 ?auto_442870 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_442910 - SURFACE
      ?auto_442911 - SURFACE
      ?auto_442912 - SURFACE
      ?auto_442913 - SURFACE
      ?auto_442914 - SURFACE
      ?auto_442915 - SURFACE
    )
    :vars
    (
      ?auto_442920 - HOIST
      ?auto_442919 - PLACE
      ?auto_442917 - TRUCK
      ?auto_442918 - PLACE
      ?auto_442916 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_442920 ?auto_442919 ) ( SURFACE-AT ?auto_442914 ?auto_442919 ) ( CLEAR ?auto_442914 ) ( IS-CRATE ?auto_442915 ) ( not ( = ?auto_442914 ?auto_442915 ) ) ( AVAILABLE ?auto_442920 ) ( ON ?auto_442914 ?auto_442913 ) ( not ( = ?auto_442913 ?auto_442914 ) ) ( not ( = ?auto_442913 ?auto_442915 ) ) ( TRUCK-AT ?auto_442917 ?auto_442918 ) ( not ( = ?auto_442918 ?auto_442919 ) ) ( HOIST-AT ?auto_442916 ?auto_442918 ) ( LIFTING ?auto_442916 ?auto_442915 ) ( not ( = ?auto_442920 ?auto_442916 ) ) ( ON ?auto_442911 ?auto_442910 ) ( ON ?auto_442912 ?auto_442911 ) ( ON ?auto_442913 ?auto_442912 ) ( not ( = ?auto_442910 ?auto_442911 ) ) ( not ( = ?auto_442910 ?auto_442912 ) ) ( not ( = ?auto_442910 ?auto_442913 ) ) ( not ( = ?auto_442910 ?auto_442914 ) ) ( not ( = ?auto_442910 ?auto_442915 ) ) ( not ( = ?auto_442911 ?auto_442912 ) ) ( not ( = ?auto_442911 ?auto_442913 ) ) ( not ( = ?auto_442911 ?auto_442914 ) ) ( not ( = ?auto_442911 ?auto_442915 ) ) ( not ( = ?auto_442912 ?auto_442913 ) ) ( not ( = ?auto_442912 ?auto_442914 ) ) ( not ( = ?auto_442912 ?auto_442915 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442913 ?auto_442914 ?auto_442915 )
      ( MAKE-5CRATE-VERIFY ?auto_442910 ?auto_442911 ?auto_442912 ?auto_442913 ?auto_442914 ?auto_442915 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_442960 - SURFACE
      ?auto_442961 - SURFACE
      ?auto_442962 - SURFACE
      ?auto_442963 - SURFACE
      ?auto_442964 - SURFACE
      ?auto_442965 - SURFACE
    )
    :vars
    (
      ?auto_442966 - HOIST
      ?auto_442971 - PLACE
      ?auto_442968 - TRUCK
      ?auto_442969 - PLACE
      ?auto_442970 - HOIST
      ?auto_442967 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_442966 ?auto_442971 ) ( SURFACE-AT ?auto_442964 ?auto_442971 ) ( CLEAR ?auto_442964 ) ( IS-CRATE ?auto_442965 ) ( not ( = ?auto_442964 ?auto_442965 ) ) ( AVAILABLE ?auto_442966 ) ( ON ?auto_442964 ?auto_442963 ) ( not ( = ?auto_442963 ?auto_442964 ) ) ( not ( = ?auto_442963 ?auto_442965 ) ) ( TRUCK-AT ?auto_442968 ?auto_442969 ) ( not ( = ?auto_442969 ?auto_442971 ) ) ( HOIST-AT ?auto_442970 ?auto_442969 ) ( not ( = ?auto_442966 ?auto_442970 ) ) ( AVAILABLE ?auto_442970 ) ( SURFACE-AT ?auto_442965 ?auto_442969 ) ( ON ?auto_442965 ?auto_442967 ) ( CLEAR ?auto_442965 ) ( not ( = ?auto_442964 ?auto_442967 ) ) ( not ( = ?auto_442965 ?auto_442967 ) ) ( not ( = ?auto_442963 ?auto_442967 ) ) ( ON ?auto_442961 ?auto_442960 ) ( ON ?auto_442962 ?auto_442961 ) ( ON ?auto_442963 ?auto_442962 ) ( not ( = ?auto_442960 ?auto_442961 ) ) ( not ( = ?auto_442960 ?auto_442962 ) ) ( not ( = ?auto_442960 ?auto_442963 ) ) ( not ( = ?auto_442960 ?auto_442964 ) ) ( not ( = ?auto_442960 ?auto_442965 ) ) ( not ( = ?auto_442960 ?auto_442967 ) ) ( not ( = ?auto_442961 ?auto_442962 ) ) ( not ( = ?auto_442961 ?auto_442963 ) ) ( not ( = ?auto_442961 ?auto_442964 ) ) ( not ( = ?auto_442961 ?auto_442965 ) ) ( not ( = ?auto_442961 ?auto_442967 ) ) ( not ( = ?auto_442962 ?auto_442963 ) ) ( not ( = ?auto_442962 ?auto_442964 ) ) ( not ( = ?auto_442962 ?auto_442965 ) ) ( not ( = ?auto_442962 ?auto_442967 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442963 ?auto_442964 ?auto_442965 )
      ( MAKE-5CRATE-VERIFY ?auto_442960 ?auto_442961 ?auto_442962 ?auto_442963 ?auto_442964 ?auto_442965 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_443011 - SURFACE
      ?auto_443012 - SURFACE
      ?auto_443013 - SURFACE
      ?auto_443014 - SURFACE
      ?auto_443015 - SURFACE
      ?auto_443016 - SURFACE
    )
    :vars
    (
      ?auto_443017 - HOIST
      ?auto_443018 - PLACE
      ?auto_443021 - PLACE
      ?auto_443020 - HOIST
      ?auto_443019 - SURFACE
      ?auto_443022 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_443017 ?auto_443018 ) ( SURFACE-AT ?auto_443015 ?auto_443018 ) ( CLEAR ?auto_443015 ) ( IS-CRATE ?auto_443016 ) ( not ( = ?auto_443015 ?auto_443016 ) ) ( AVAILABLE ?auto_443017 ) ( ON ?auto_443015 ?auto_443014 ) ( not ( = ?auto_443014 ?auto_443015 ) ) ( not ( = ?auto_443014 ?auto_443016 ) ) ( not ( = ?auto_443021 ?auto_443018 ) ) ( HOIST-AT ?auto_443020 ?auto_443021 ) ( not ( = ?auto_443017 ?auto_443020 ) ) ( AVAILABLE ?auto_443020 ) ( SURFACE-AT ?auto_443016 ?auto_443021 ) ( ON ?auto_443016 ?auto_443019 ) ( CLEAR ?auto_443016 ) ( not ( = ?auto_443015 ?auto_443019 ) ) ( not ( = ?auto_443016 ?auto_443019 ) ) ( not ( = ?auto_443014 ?auto_443019 ) ) ( TRUCK-AT ?auto_443022 ?auto_443018 ) ( ON ?auto_443012 ?auto_443011 ) ( ON ?auto_443013 ?auto_443012 ) ( ON ?auto_443014 ?auto_443013 ) ( not ( = ?auto_443011 ?auto_443012 ) ) ( not ( = ?auto_443011 ?auto_443013 ) ) ( not ( = ?auto_443011 ?auto_443014 ) ) ( not ( = ?auto_443011 ?auto_443015 ) ) ( not ( = ?auto_443011 ?auto_443016 ) ) ( not ( = ?auto_443011 ?auto_443019 ) ) ( not ( = ?auto_443012 ?auto_443013 ) ) ( not ( = ?auto_443012 ?auto_443014 ) ) ( not ( = ?auto_443012 ?auto_443015 ) ) ( not ( = ?auto_443012 ?auto_443016 ) ) ( not ( = ?auto_443012 ?auto_443019 ) ) ( not ( = ?auto_443013 ?auto_443014 ) ) ( not ( = ?auto_443013 ?auto_443015 ) ) ( not ( = ?auto_443013 ?auto_443016 ) ) ( not ( = ?auto_443013 ?auto_443019 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_443014 ?auto_443015 ?auto_443016 )
      ( MAKE-5CRATE-VERIFY ?auto_443011 ?auto_443012 ?auto_443013 ?auto_443014 ?auto_443015 ?auto_443016 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_443062 - SURFACE
      ?auto_443063 - SURFACE
      ?auto_443064 - SURFACE
      ?auto_443065 - SURFACE
      ?auto_443066 - SURFACE
      ?auto_443067 - SURFACE
    )
    :vars
    (
      ?auto_443072 - HOIST
      ?auto_443068 - PLACE
      ?auto_443073 - PLACE
      ?auto_443071 - HOIST
      ?auto_443069 - SURFACE
      ?auto_443070 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_443072 ?auto_443068 ) ( IS-CRATE ?auto_443067 ) ( not ( = ?auto_443066 ?auto_443067 ) ) ( not ( = ?auto_443065 ?auto_443066 ) ) ( not ( = ?auto_443065 ?auto_443067 ) ) ( not ( = ?auto_443073 ?auto_443068 ) ) ( HOIST-AT ?auto_443071 ?auto_443073 ) ( not ( = ?auto_443072 ?auto_443071 ) ) ( AVAILABLE ?auto_443071 ) ( SURFACE-AT ?auto_443067 ?auto_443073 ) ( ON ?auto_443067 ?auto_443069 ) ( CLEAR ?auto_443067 ) ( not ( = ?auto_443066 ?auto_443069 ) ) ( not ( = ?auto_443067 ?auto_443069 ) ) ( not ( = ?auto_443065 ?auto_443069 ) ) ( TRUCK-AT ?auto_443070 ?auto_443068 ) ( SURFACE-AT ?auto_443065 ?auto_443068 ) ( CLEAR ?auto_443065 ) ( LIFTING ?auto_443072 ?auto_443066 ) ( IS-CRATE ?auto_443066 ) ( ON ?auto_443063 ?auto_443062 ) ( ON ?auto_443064 ?auto_443063 ) ( ON ?auto_443065 ?auto_443064 ) ( not ( = ?auto_443062 ?auto_443063 ) ) ( not ( = ?auto_443062 ?auto_443064 ) ) ( not ( = ?auto_443062 ?auto_443065 ) ) ( not ( = ?auto_443062 ?auto_443066 ) ) ( not ( = ?auto_443062 ?auto_443067 ) ) ( not ( = ?auto_443062 ?auto_443069 ) ) ( not ( = ?auto_443063 ?auto_443064 ) ) ( not ( = ?auto_443063 ?auto_443065 ) ) ( not ( = ?auto_443063 ?auto_443066 ) ) ( not ( = ?auto_443063 ?auto_443067 ) ) ( not ( = ?auto_443063 ?auto_443069 ) ) ( not ( = ?auto_443064 ?auto_443065 ) ) ( not ( = ?auto_443064 ?auto_443066 ) ) ( not ( = ?auto_443064 ?auto_443067 ) ) ( not ( = ?auto_443064 ?auto_443069 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_443065 ?auto_443066 ?auto_443067 )
      ( MAKE-5CRATE-VERIFY ?auto_443062 ?auto_443063 ?auto_443064 ?auto_443065 ?auto_443066 ?auto_443067 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_443113 - SURFACE
      ?auto_443114 - SURFACE
      ?auto_443115 - SURFACE
      ?auto_443116 - SURFACE
      ?auto_443117 - SURFACE
      ?auto_443118 - SURFACE
    )
    :vars
    (
      ?auto_443122 - HOIST
      ?auto_443120 - PLACE
      ?auto_443119 - PLACE
      ?auto_443123 - HOIST
      ?auto_443121 - SURFACE
      ?auto_443124 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_443122 ?auto_443120 ) ( IS-CRATE ?auto_443118 ) ( not ( = ?auto_443117 ?auto_443118 ) ) ( not ( = ?auto_443116 ?auto_443117 ) ) ( not ( = ?auto_443116 ?auto_443118 ) ) ( not ( = ?auto_443119 ?auto_443120 ) ) ( HOIST-AT ?auto_443123 ?auto_443119 ) ( not ( = ?auto_443122 ?auto_443123 ) ) ( AVAILABLE ?auto_443123 ) ( SURFACE-AT ?auto_443118 ?auto_443119 ) ( ON ?auto_443118 ?auto_443121 ) ( CLEAR ?auto_443118 ) ( not ( = ?auto_443117 ?auto_443121 ) ) ( not ( = ?auto_443118 ?auto_443121 ) ) ( not ( = ?auto_443116 ?auto_443121 ) ) ( TRUCK-AT ?auto_443124 ?auto_443120 ) ( SURFACE-AT ?auto_443116 ?auto_443120 ) ( CLEAR ?auto_443116 ) ( IS-CRATE ?auto_443117 ) ( AVAILABLE ?auto_443122 ) ( IN ?auto_443117 ?auto_443124 ) ( ON ?auto_443114 ?auto_443113 ) ( ON ?auto_443115 ?auto_443114 ) ( ON ?auto_443116 ?auto_443115 ) ( not ( = ?auto_443113 ?auto_443114 ) ) ( not ( = ?auto_443113 ?auto_443115 ) ) ( not ( = ?auto_443113 ?auto_443116 ) ) ( not ( = ?auto_443113 ?auto_443117 ) ) ( not ( = ?auto_443113 ?auto_443118 ) ) ( not ( = ?auto_443113 ?auto_443121 ) ) ( not ( = ?auto_443114 ?auto_443115 ) ) ( not ( = ?auto_443114 ?auto_443116 ) ) ( not ( = ?auto_443114 ?auto_443117 ) ) ( not ( = ?auto_443114 ?auto_443118 ) ) ( not ( = ?auto_443114 ?auto_443121 ) ) ( not ( = ?auto_443115 ?auto_443116 ) ) ( not ( = ?auto_443115 ?auto_443117 ) ) ( not ( = ?auto_443115 ?auto_443118 ) ) ( not ( = ?auto_443115 ?auto_443121 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_443116 ?auto_443117 ?auto_443118 )
      ( MAKE-5CRATE-VERIFY ?auto_443113 ?auto_443114 ?auto_443115 ?auto_443116 ?auto_443117 ?auto_443118 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_443481 - SURFACE
      ?auto_443482 - SURFACE
    )
    :vars
    (
      ?auto_443483 - HOIST
      ?auto_443486 - PLACE
      ?auto_443485 - SURFACE
      ?auto_443488 - TRUCK
      ?auto_443484 - PLACE
      ?auto_443489 - HOIST
      ?auto_443487 - SURFACE
      ?auto_443490 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_443483 ?auto_443486 ) ( SURFACE-AT ?auto_443481 ?auto_443486 ) ( CLEAR ?auto_443481 ) ( IS-CRATE ?auto_443482 ) ( not ( = ?auto_443481 ?auto_443482 ) ) ( AVAILABLE ?auto_443483 ) ( ON ?auto_443481 ?auto_443485 ) ( not ( = ?auto_443485 ?auto_443481 ) ) ( not ( = ?auto_443485 ?auto_443482 ) ) ( TRUCK-AT ?auto_443488 ?auto_443484 ) ( not ( = ?auto_443484 ?auto_443486 ) ) ( HOIST-AT ?auto_443489 ?auto_443484 ) ( not ( = ?auto_443483 ?auto_443489 ) ) ( SURFACE-AT ?auto_443482 ?auto_443484 ) ( ON ?auto_443482 ?auto_443487 ) ( CLEAR ?auto_443482 ) ( not ( = ?auto_443481 ?auto_443487 ) ) ( not ( = ?auto_443482 ?auto_443487 ) ) ( not ( = ?auto_443485 ?auto_443487 ) ) ( LIFTING ?auto_443489 ?auto_443490 ) ( IS-CRATE ?auto_443490 ) ( not ( = ?auto_443481 ?auto_443490 ) ) ( not ( = ?auto_443482 ?auto_443490 ) ) ( not ( = ?auto_443485 ?auto_443490 ) ) ( not ( = ?auto_443487 ?auto_443490 ) ) )
    :subtasks
    ( ( !LOAD ?auto_443489 ?auto_443490 ?auto_443488 ?auto_443484 )
      ( MAKE-1CRATE ?auto_443481 ?auto_443482 )
      ( MAKE-1CRATE-VERIFY ?auto_443481 ?auto_443482 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_444318 - SURFACE
      ?auto_444319 - SURFACE
      ?auto_444320 - SURFACE
      ?auto_444321 - SURFACE
      ?auto_444322 - SURFACE
      ?auto_444323 - SURFACE
      ?auto_444324 - SURFACE
    )
    :vars
    (
      ?auto_444325 - HOIST
      ?auto_444326 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_444325 ?auto_444326 ) ( SURFACE-AT ?auto_444323 ?auto_444326 ) ( CLEAR ?auto_444323 ) ( LIFTING ?auto_444325 ?auto_444324 ) ( IS-CRATE ?auto_444324 ) ( not ( = ?auto_444323 ?auto_444324 ) ) ( ON ?auto_444319 ?auto_444318 ) ( ON ?auto_444320 ?auto_444319 ) ( ON ?auto_444321 ?auto_444320 ) ( ON ?auto_444322 ?auto_444321 ) ( ON ?auto_444323 ?auto_444322 ) ( not ( = ?auto_444318 ?auto_444319 ) ) ( not ( = ?auto_444318 ?auto_444320 ) ) ( not ( = ?auto_444318 ?auto_444321 ) ) ( not ( = ?auto_444318 ?auto_444322 ) ) ( not ( = ?auto_444318 ?auto_444323 ) ) ( not ( = ?auto_444318 ?auto_444324 ) ) ( not ( = ?auto_444319 ?auto_444320 ) ) ( not ( = ?auto_444319 ?auto_444321 ) ) ( not ( = ?auto_444319 ?auto_444322 ) ) ( not ( = ?auto_444319 ?auto_444323 ) ) ( not ( = ?auto_444319 ?auto_444324 ) ) ( not ( = ?auto_444320 ?auto_444321 ) ) ( not ( = ?auto_444320 ?auto_444322 ) ) ( not ( = ?auto_444320 ?auto_444323 ) ) ( not ( = ?auto_444320 ?auto_444324 ) ) ( not ( = ?auto_444321 ?auto_444322 ) ) ( not ( = ?auto_444321 ?auto_444323 ) ) ( not ( = ?auto_444321 ?auto_444324 ) ) ( not ( = ?auto_444322 ?auto_444323 ) ) ( not ( = ?auto_444322 ?auto_444324 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_444323 ?auto_444324 )
      ( MAKE-6CRATE-VERIFY ?auto_444318 ?auto_444319 ?auto_444320 ?auto_444321 ?auto_444322 ?auto_444323 ?auto_444324 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_444362 - SURFACE
      ?auto_444363 - SURFACE
      ?auto_444364 - SURFACE
      ?auto_444365 - SURFACE
      ?auto_444366 - SURFACE
      ?auto_444367 - SURFACE
      ?auto_444368 - SURFACE
    )
    :vars
    (
      ?auto_444371 - HOIST
      ?auto_444369 - PLACE
      ?auto_444370 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_444371 ?auto_444369 ) ( SURFACE-AT ?auto_444367 ?auto_444369 ) ( CLEAR ?auto_444367 ) ( IS-CRATE ?auto_444368 ) ( not ( = ?auto_444367 ?auto_444368 ) ) ( TRUCK-AT ?auto_444370 ?auto_444369 ) ( AVAILABLE ?auto_444371 ) ( IN ?auto_444368 ?auto_444370 ) ( ON ?auto_444367 ?auto_444366 ) ( not ( = ?auto_444366 ?auto_444367 ) ) ( not ( = ?auto_444366 ?auto_444368 ) ) ( ON ?auto_444363 ?auto_444362 ) ( ON ?auto_444364 ?auto_444363 ) ( ON ?auto_444365 ?auto_444364 ) ( ON ?auto_444366 ?auto_444365 ) ( not ( = ?auto_444362 ?auto_444363 ) ) ( not ( = ?auto_444362 ?auto_444364 ) ) ( not ( = ?auto_444362 ?auto_444365 ) ) ( not ( = ?auto_444362 ?auto_444366 ) ) ( not ( = ?auto_444362 ?auto_444367 ) ) ( not ( = ?auto_444362 ?auto_444368 ) ) ( not ( = ?auto_444363 ?auto_444364 ) ) ( not ( = ?auto_444363 ?auto_444365 ) ) ( not ( = ?auto_444363 ?auto_444366 ) ) ( not ( = ?auto_444363 ?auto_444367 ) ) ( not ( = ?auto_444363 ?auto_444368 ) ) ( not ( = ?auto_444364 ?auto_444365 ) ) ( not ( = ?auto_444364 ?auto_444366 ) ) ( not ( = ?auto_444364 ?auto_444367 ) ) ( not ( = ?auto_444364 ?auto_444368 ) ) ( not ( = ?auto_444365 ?auto_444366 ) ) ( not ( = ?auto_444365 ?auto_444367 ) ) ( not ( = ?auto_444365 ?auto_444368 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_444366 ?auto_444367 ?auto_444368 )
      ( MAKE-6CRATE-VERIFY ?auto_444362 ?auto_444363 ?auto_444364 ?auto_444365 ?auto_444366 ?auto_444367 ?auto_444368 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_444413 - SURFACE
      ?auto_444414 - SURFACE
      ?auto_444415 - SURFACE
      ?auto_444416 - SURFACE
      ?auto_444417 - SURFACE
      ?auto_444418 - SURFACE
      ?auto_444419 - SURFACE
    )
    :vars
    (
      ?auto_444423 - HOIST
      ?auto_444422 - PLACE
      ?auto_444420 - TRUCK
      ?auto_444421 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_444423 ?auto_444422 ) ( SURFACE-AT ?auto_444418 ?auto_444422 ) ( CLEAR ?auto_444418 ) ( IS-CRATE ?auto_444419 ) ( not ( = ?auto_444418 ?auto_444419 ) ) ( AVAILABLE ?auto_444423 ) ( IN ?auto_444419 ?auto_444420 ) ( ON ?auto_444418 ?auto_444417 ) ( not ( = ?auto_444417 ?auto_444418 ) ) ( not ( = ?auto_444417 ?auto_444419 ) ) ( TRUCK-AT ?auto_444420 ?auto_444421 ) ( not ( = ?auto_444421 ?auto_444422 ) ) ( ON ?auto_444414 ?auto_444413 ) ( ON ?auto_444415 ?auto_444414 ) ( ON ?auto_444416 ?auto_444415 ) ( ON ?auto_444417 ?auto_444416 ) ( not ( = ?auto_444413 ?auto_444414 ) ) ( not ( = ?auto_444413 ?auto_444415 ) ) ( not ( = ?auto_444413 ?auto_444416 ) ) ( not ( = ?auto_444413 ?auto_444417 ) ) ( not ( = ?auto_444413 ?auto_444418 ) ) ( not ( = ?auto_444413 ?auto_444419 ) ) ( not ( = ?auto_444414 ?auto_444415 ) ) ( not ( = ?auto_444414 ?auto_444416 ) ) ( not ( = ?auto_444414 ?auto_444417 ) ) ( not ( = ?auto_444414 ?auto_444418 ) ) ( not ( = ?auto_444414 ?auto_444419 ) ) ( not ( = ?auto_444415 ?auto_444416 ) ) ( not ( = ?auto_444415 ?auto_444417 ) ) ( not ( = ?auto_444415 ?auto_444418 ) ) ( not ( = ?auto_444415 ?auto_444419 ) ) ( not ( = ?auto_444416 ?auto_444417 ) ) ( not ( = ?auto_444416 ?auto_444418 ) ) ( not ( = ?auto_444416 ?auto_444419 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_444417 ?auto_444418 ?auto_444419 )
      ( MAKE-6CRATE-VERIFY ?auto_444413 ?auto_444414 ?auto_444415 ?auto_444416 ?auto_444417 ?auto_444418 ?auto_444419 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_444470 - SURFACE
      ?auto_444471 - SURFACE
      ?auto_444472 - SURFACE
      ?auto_444473 - SURFACE
      ?auto_444474 - SURFACE
      ?auto_444475 - SURFACE
      ?auto_444476 - SURFACE
    )
    :vars
    (
      ?auto_444480 - HOIST
      ?auto_444481 - PLACE
      ?auto_444478 - TRUCK
      ?auto_444479 - PLACE
      ?auto_444477 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_444480 ?auto_444481 ) ( SURFACE-AT ?auto_444475 ?auto_444481 ) ( CLEAR ?auto_444475 ) ( IS-CRATE ?auto_444476 ) ( not ( = ?auto_444475 ?auto_444476 ) ) ( AVAILABLE ?auto_444480 ) ( ON ?auto_444475 ?auto_444474 ) ( not ( = ?auto_444474 ?auto_444475 ) ) ( not ( = ?auto_444474 ?auto_444476 ) ) ( TRUCK-AT ?auto_444478 ?auto_444479 ) ( not ( = ?auto_444479 ?auto_444481 ) ) ( HOIST-AT ?auto_444477 ?auto_444479 ) ( LIFTING ?auto_444477 ?auto_444476 ) ( not ( = ?auto_444480 ?auto_444477 ) ) ( ON ?auto_444471 ?auto_444470 ) ( ON ?auto_444472 ?auto_444471 ) ( ON ?auto_444473 ?auto_444472 ) ( ON ?auto_444474 ?auto_444473 ) ( not ( = ?auto_444470 ?auto_444471 ) ) ( not ( = ?auto_444470 ?auto_444472 ) ) ( not ( = ?auto_444470 ?auto_444473 ) ) ( not ( = ?auto_444470 ?auto_444474 ) ) ( not ( = ?auto_444470 ?auto_444475 ) ) ( not ( = ?auto_444470 ?auto_444476 ) ) ( not ( = ?auto_444471 ?auto_444472 ) ) ( not ( = ?auto_444471 ?auto_444473 ) ) ( not ( = ?auto_444471 ?auto_444474 ) ) ( not ( = ?auto_444471 ?auto_444475 ) ) ( not ( = ?auto_444471 ?auto_444476 ) ) ( not ( = ?auto_444472 ?auto_444473 ) ) ( not ( = ?auto_444472 ?auto_444474 ) ) ( not ( = ?auto_444472 ?auto_444475 ) ) ( not ( = ?auto_444472 ?auto_444476 ) ) ( not ( = ?auto_444473 ?auto_444474 ) ) ( not ( = ?auto_444473 ?auto_444475 ) ) ( not ( = ?auto_444473 ?auto_444476 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_444474 ?auto_444475 ?auto_444476 )
      ( MAKE-6CRATE-VERIFY ?auto_444470 ?auto_444471 ?auto_444472 ?auto_444473 ?auto_444474 ?auto_444475 ?auto_444476 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_444533 - SURFACE
      ?auto_444534 - SURFACE
      ?auto_444535 - SURFACE
      ?auto_444536 - SURFACE
      ?auto_444537 - SURFACE
      ?auto_444538 - SURFACE
      ?auto_444539 - SURFACE
    )
    :vars
    (
      ?auto_444542 - HOIST
      ?auto_444544 - PLACE
      ?auto_444540 - TRUCK
      ?auto_444543 - PLACE
      ?auto_444541 - HOIST
      ?auto_444545 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_444542 ?auto_444544 ) ( SURFACE-AT ?auto_444538 ?auto_444544 ) ( CLEAR ?auto_444538 ) ( IS-CRATE ?auto_444539 ) ( not ( = ?auto_444538 ?auto_444539 ) ) ( AVAILABLE ?auto_444542 ) ( ON ?auto_444538 ?auto_444537 ) ( not ( = ?auto_444537 ?auto_444538 ) ) ( not ( = ?auto_444537 ?auto_444539 ) ) ( TRUCK-AT ?auto_444540 ?auto_444543 ) ( not ( = ?auto_444543 ?auto_444544 ) ) ( HOIST-AT ?auto_444541 ?auto_444543 ) ( not ( = ?auto_444542 ?auto_444541 ) ) ( AVAILABLE ?auto_444541 ) ( SURFACE-AT ?auto_444539 ?auto_444543 ) ( ON ?auto_444539 ?auto_444545 ) ( CLEAR ?auto_444539 ) ( not ( = ?auto_444538 ?auto_444545 ) ) ( not ( = ?auto_444539 ?auto_444545 ) ) ( not ( = ?auto_444537 ?auto_444545 ) ) ( ON ?auto_444534 ?auto_444533 ) ( ON ?auto_444535 ?auto_444534 ) ( ON ?auto_444536 ?auto_444535 ) ( ON ?auto_444537 ?auto_444536 ) ( not ( = ?auto_444533 ?auto_444534 ) ) ( not ( = ?auto_444533 ?auto_444535 ) ) ( not ( = ?auto_444533 ?auto_444536 ) ) ( not ( = ?auto_444533 ?auto_444537 ) ) ( not ( = ?auto_444533 ?auto_444538 ) ) ( not ( = ?auto_444533 ?auto_444539 ) ) ( not ( = ?auto_444533 ?auto_444545 ) ) ( not ( = ?auto_444534 ?auto_444535 ) ) ( not ( = ?auto_444534 ?auto_444536 ) ) ( not ( = ?auto_444534 ?auto_444537 ) ) ( not ( = ?auto_444534 ?auto_444538 ) ) ( not ( = ?auto_444534 ?auto_444539 ) ) ( not ( = ?auto_444534 ?auto_444545 ) ) ( not ( = ?auto_444535 ?auto_444536 ) ) ( not ( = ?auto_444535 ?auto_444537 ) ) ( not ( = ?auto_444535 ?auto_444538 ) ) ( not ( = ?auto_444535 ?auto_444539 ) ) ( not ( = ?auto_444535 ?auto_444545 ) ) ( not ( = ?auto_444536 ?auto_444537 ) ) ( not ( = ?auto_444536 ?auto_444538 ) ) ( not ( = ?auto_444536 ?auto_444539 ) ) ( not ( = ?auto_444536 ?auto_444545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_444537 ?auto_444538 ?auto_444539 )
      ( MAKE-6CRATE-VERIFY ?auto_444533 ?auto_444534 ?auto_444535 ?auto_444536 ?auto_444537 ?auto_444538 ?auto_444539 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_444597 - SURFACE
      ?auto_444598 - SURFACE
      ?auto_444599 - SURFACE
      ?auto_444600 - SURFACE
      ?auto_444601 - SURFACE
      ?auto_444602 - SURFACE
      ?auto_444603 - SURFACE
    )
    :vars
    (
      ?auto_444607 - HOIST
      ?auto_444609 - PLACE
      ?auto_444606 - PLACE
      ?auto_444604 - HOIST
      ?auto_444608 - SURFACE
      ?auto_444605 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_444607 ?auto_444609 ) ( SURFACE-AT ?auto_444602 ?auto_444609 ) ( CLEAR ?auto_444602 ) ( IS-CRATE ?auto_444603 ) ( not ( = ?auto_444602 ?auto_444603 ) ) ( AVAILABLE ?auto_444607 ) ( ON ?auto_444602 ?auto_444601 ) ( not ( = ?auto_444601 ?auto_444602 ) ) ( not ( = ?auto_444601 ?auto_444603 ) ) ( not ( = ?auto_444606 ?auto_444609 ) ) ( HOIST-AT ?auto_444604 ?auto_444606 ) ( not ( = ?auto_444607 ?auto_444604 ) ) ( AVAILABLE ?auto_444604 ) ( SURFACE-AT ?auto_444603 ?auto_444606 ) ( ON ?auto_444603 ?auto_444608 ) ( CLEAR ?auto_444603 ) ( not ( = ?auto_444602 ?auto_444608 ) ) ( not ( = ?auto_444603 ?auto_444608 ) ) ( not ( = ?auto_444601 ?auto_444608 ) ) ( TRUCK-AT ?auto_444605 ?auto_444609 ) ( ON ?auto_444598 ?auto_444597 ) ( ON ?auto_444599 ?auto_444598 ) ( ON ?auto_444600 ?auto_444599 ) ( ON ?auto_444601 ?auto_444600 ) ( not ( = ?auto_444597 ?auto_444598 ) ) ( not ( = ?auto_444597 ?auto_444599 ) ) ( not ( = ?auto_444597 ?auto_444600 ) ) ( not ( = ?auto_444597 ?auto_444601 ) ) ( not ( = ?auto_444597 ?auto_444602 ) ) ( not ( = ?auto_444597 ?auto_444603 ) ) ( not ( = ?auto_444597 ?auto_444608 ) ) ( not ( = ?auto_444598 ?auto_444599 ) ) ( not ( = ?auto_444598 ?auto_444600 ) ) ( not ( = ?auto_444598 ?auto_444601 ) ) ( not ( = ?auto_444598 ?auto_444602 ) ) ( not ( = ?auto_444598 ?auto_444603 ) ) ( not ( = ?auto_444598 ?auto_444608 ) ) ( not ( = ?auto_444599 ?auto_444600 ) ) ( not ( = ?auto_444599 ?auto_444601 ) ) ( not ( = ?auto_444599 ?auto_444602 ) ) ( not ( = ?auto_444599 ?auto_444603 ) ) ( not ( = ?auto_444599 ?auto_444608 ) ) ( not ( = ?auto_444600 ?auto_444601 ) ) ( not ( = ?auto_444600 ?auto_444602 ) ) ( not ( = ?auto_444600 ?auto_444603 ) ) ( not ( = ?auto_444600 ?auto_444608 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_444601 ?auto_444602 ?auto_444603 )
      ( MAKE-6CRATE-VERIFY ?auto_444597 ?auto_444598 ?auto_444599 ?auto_444600 ?auto_444601 ?auto_444602 ?auto_444603 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_444661 - SURFACE
      ?auto_444662 - SURFACE
      ?auto_444663 - SURFACE
      ?auto_444664 - SURFACE
      ?auto_444665 - SURFACE
      ?auto_444666 - SURFACE
      ?auto_444667 - SURFACE
    )
    :vars
    (
      ?auto_444671 - HOIST
      ?auto_444670 - PLACE
      ?auto_444672 - PLACE
      ?auto_444673 - HOIST
      ?auto_444669 - SURFACE
      ?auto_444668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_444671 ?auto_444670 ) ( IS-CRATE ?auto_444667 ) ( not ( = ?auto_444666 ?auto_444667 ) ) ( not ( = ?auto_444665 ?auto_444666 ) ) ( not ( = ?auto_444665 ?auto_444667 ) ) ( not ( = ?auto_444672 ?auto_444670 ) ) ( HOIST-AT ?auto_444673 ?auto_444672 ) ( not ( = ?auto_444671 ?auto_444673 ) ) ( AVAILABLE ?auto_444673 ) ( SURFACE-AT ?auto_444667 ?auto_444672 ) ( ON ?auto_444667 ?auto_444669 ) ( CLEAR ?auto_444667 ) ( not ( = ?auto_444666 ?auto_444669 ) ) ( not ( = ?auto_444667 ?auto_444669 ) ) ( not ( = ?auto_444665 ?auto_444669 ) ) ( TRUCK-AT ?auto_444668 ?auto_444670 ) ( SURFACE-AT ?auto_444665 ?auto_444670 ) ( CLEAR ?auto_444665 ) ( LIFTING ?auto_444671 ?auto_444666 ) ( IS-CRATE ?auto_444666 ) ( ON ?auto_444662 ?auto_444661 ) ( ON ?auto_444663 ?auto_444662 ) ( ON ?auto_444664 ?auto_444663 ) ( ON ?auto_444665 ?auto_444664 ) ( not ( = ?auto_444661 ?auto_444662 ) ) ( not ( = ?auto_444661 ?auto_444663 ) ) ( not ( = ?auto_444661 ?auto_444664 ) ) ( not ( = ?auto_444661 ?auto_444665 ) ) ( not ( = ?auto_444661 ?auto_444666 ) ) ( not ( = ?auto_444661 ?auto_444667 ) ) ( not ( = ?auto_444661 ?auto_444669 ) ) ( not ( = ?auto_444662 ?auto_444663 ) ) ( not ( = ?auto_444662 ?auto_444664 ) ) ( not ( = ?auto_444662 ?auto_444665 ) ) ( not ( = ?auto_444662 ?auto_444666 ) ) ( not ( = ?auto_444662 ?auto_444667 ) ) ( not ( = ?auto_444662 ?auto_444669 ) ) ( not ( = ?auto_444663 ?auto_444664 ) ) ( not ( = ?auto_444663 ?auto_444665 ) ) ( not ( = ?auto_444663 ?auto_444666 ) ) ( not ( = ?auto_444663 ?auto_444667 ) ) ( not ( = ?auto_444663 ?auto_444669 ) ) ( not ( = ?auto_444664 ?auto_444665 ) ) ( not ( = ?auto_444664 ?auto_444666 ) ) ( not ( = ?auto_444664 ?auto_444667 ) ) ( not ( = ?auto_444664 ?auto_444669 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_444665 ?auto_444666 ?auto_444667 )
      ( MAKE-6CRATE-VERIFY ?auto_444661 ?auto_444662 ?auto_444663 ?auto_444664 ?auto_444665 ?auto_444666 ?auto_444667 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_444725 - SURFACE
      ?auto_444726 - SURFACE
      ?auto_444727 - SURFACE
      ?auto_444728 - SURFACE
      ?auto_444729 - SURFACE
      ?auto_444730 - SURFACE
      ?auto_444731 - SURFACE
    )
    :vars
    (
      ?auto_444736 - HOIST
      ?auto_444732 - PLACE
      ?auto_444737 - PLACE
      ?auto_444733 - HOIST
      ?auto_444735 - SURFACE
      ?auto_444734 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_444736 ?auto_444732 ) ( IS-CRATE ?auto_444731 ) ( not ( = ?auto_444730 ?auto_444731 ) ) ( not ( = ?auto_444729 ?auto_444730 ) ) ( not ( = ?auto_444729 ?auto_444731 ) ) ( not ( = ?auto_444737 ?auto_444732 ) ) ( HOIST-AT ?auto_444733 ?auto_444737 ) ( not ( = ?auto_444736 ?auto_444733 ) ) ( AVAILABLE ?auto_444733 ) ( SURFACE-AT ?auto_444731 ?auto_444737 ) ( ON ?auto_444731 ?auto_444735 ) ( CLEAR ?auto_444731 ) ( not ( = ?auto_444730 ?auto_444735 ) ) ( not ( = ?auto_444731 ?auto_444735 ) ) ( not ( = ?auto_444729 ?auto_444735 ) ) ( TRUCK-AT ?auto_444734 ?auto_444732 ) ( SURFACE-AT ?auto_444729 ?auto_444732 ) ( CLEAR ?auto_444729 ) ( IS-CRATE ?auto_444730 ) ( AVAILABLE ?auto_444736 ) ( IN ?auto_444730 ?auto_444734 ) ( ON ?auto_444726 ?auto_444725 ) ( ON ?auto_444727 ?auto_444726 ) ( ON ?auto_444728 ?auto_444727 ) ( ON ?auto_444729 ?auto_444728 ) ( not ( = ?auto_444725 ?auto_444726 ) ) ( not ( = ?auto_444725 ?auto_444727 ) ) ( not ( = ?auto_444725 ?auto_444728 ) ) ( not ( = ?auto_444725 ?auto_444729 ) ) ( not ( = ?auto_444725 ?auto_444730 ) ) ( not ( = ?auto_444725 ?auto_444731 ) ) ( not ( = ?auto_444725 ?auto_444735 ) ) ( not ( = ?auto_444726 ?auto_444727 ) ) ( not ( = ?auto_444726 ?auto_444728 ) ) ( not ( = ?auto_444726 ?auto_444729 ) ) ( not ( = ?auto_444726 ?auto_444730 ) ) ( not ( = ?auto_444726 ?auto_444731 ) ) ( not ( = ?auto_444726 ?auto_444735 ) ) ( not ( = ?auto_444727 ?auto_444728 ) ) ( not ( = ?auto_444727 ?auto_444729 ) ) ( not ( = ?auto_444727 ?auto_444730 ) ) ( not ( = ?auto_444727 ?auto_444731 ) ) ( not ( = ?auto_444727 ?auto_444735 ) ) ( not ( = ?auto_444728 ?auto_444729 ) ) ( not ( = ?auto_444728 ?auto_444730 ) ) ( not ( = ?auto_444728 ?auto_444731 ) ) ( not ( = ?auto_444728 ?auto_444735 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_444729 ?auto_444730 ?auto_444731 )
      ( MAKE-6CRATE-VERIFY ?auto_444725 ?auto_444726 ?auto_444727 ?auto_444728 ?auto_444729 ?auto_444730 ?auto_444731 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_445597 - SURFACE
      ?auto_445598 - SURFACE
    )
    :vars
    (
      ?auto_445601 - HOIST
      ?auto_445602 - PLACE
      ?auto_445599 - SURFACE
      ?auto_445600 - PLACE
      ?auto_445605 - HOIST
      ?auto_445604 - SURFACE
      ?auto_445603 - TRUCK
      ?auto_445606 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_445601 ?auto_445602 ) ( SURFACE-AT ?auto_445597 ?auto_445602 ) ( CLEAR ?auto_445597 ) ( IS-CRATE ?auto_445598 ) ( not ( = ?auto_445597 ?auto_445598 ) ) ( ON ?auto_445597 ?auto_445599 ) ( not ( = ?auto_445599 ?auto_445597 ) ) ( not ( = ?auto_445599 ?auto_445598 ) ) ( not ( = ?auto_445600 ?auto_445602 ) ) ( HOIST-AT ?auto_445605 ?auto_445600 ) ( not ( = ?auto_445601 ?auto_445605 ) ) ( AVAILABLE ?auto_445605 ) ( SURFACE-AT ?auto_445598 ?auto_445600 ) ( ON ?auto_445598 ?auto_445604 ) ( CLEAR ?auto_445598 ) ( not ( = ?auto_445597 ?auto_445604 ) ) ( not ( = ?auto_445598 ?auto_445604 ) ) ( not ( = ?auto_445599 ?auto_445604 ) ) ( TRUCK-AT ?auto_445603 ?auto_445602 ) ( LIFTING ?auto_445601 ?auto_445606 ) ( IS-CRATE ?auto_445606 ) ( not ( = ?auto_445597 ?auto_445606 ) ) ( not ( = ?auto_445598 ?auto_445606 ) ) ( not ( = ?auto_445599 ?auto_445606 ) ) ( not ( = ?auto_445604 ?auto_445606 ) ) )
    :subtasks
    ( ( !LOAD ?auto_445601 ?auto_445606 ?auto_445603 ?auto_445602 )
      ( MAKE-1CRATE ?auto_445597 ?auto_445598 )
      ( MAKE-1CRATE-VERIFY ?auto_445597 ?auto_445598 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_446662 - SURFACE
      ?auto_446663 - SURFACE
      ?auto_446664 - SURFACE
      ?auto_446665 - SURFACE
      ?auto_446666 - SURFACE
      ?auto_446667 - SURFACE
      ?auto_446668 - SURFACE
      ?auto_446669 - SURFACE
    )
    :vars
    (
      ?auto_446671 - HOIST
      ?auto_446670 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_446671 ?auto_446670 ) ( SURFACE-AT ?auto_446668 ?auto_446670 ) ( CLEAR ?auto_446668 ) ( LIFTING ?auto_446671 ?auto_446669 ) ( IS-CRATE ?auto_446669 ) ( not ( = ?auto_446668 ?auto_446669 ) ) ( ON ?auto_446663 ?auto_446662 ) ( ON ?auto_446664 ?auto_446663 ) ( ON ?auto_446665 ?auto_446664 ) ( ON ?auto_446666 ?auto_446665 ) ( ON ?auto_446667 ?auto_446666 ) ( ON ?auto_446668 ?auto_446667 ) ( not ( = ?auto_446662 ?auto_446663 ) ) ( not ( = ?auto_446662 ?auto_446664 ) ) ( not ( = ?auto_446662 ?auto_446665 ) ) ( not ( = ?auto_446662 ?auto_446666 ) ) ( not ( = ?auto_446662 ?auto_446667 ) ) ( not ( = ?auto_446662 ?auto_446668 ) ) ( not ( = ?auto_446662 ?auto_446669 ) ) ( not ( = ?auto_446663 ?auto_446664 ) ) ( not ( = ?auto_446663 ?auto_446665 ) ) ( not ( = ?auto_446663 ?auto_446666 ) ) ( not ( = ?auto_446663 ?auto_446667 ) ) ( not ( = ?auto_446663 ?auto_446668 ) ) ( not ( = ?auto_446663 ?auto_446669 ) ) ( not ( = ?auto_446664 ?auto_446665 ) ) ( not ( = ?auto_446664 ?auto_446666 ) ) ( not ( = ?auto_446664 ?auto_446667 ) ) ( not ( = ?auto_446664 ?auto_446668 ) ) ( not ( = ?auto_446664 ?auto_446669 ) ) ( not ( = ?auto_446665 ?auto_446666 ) ) ( not ( = ?auto_446665 ?auto_446667 ) ) ( not ( = ?auto_446665 ?auto_446668 ) ) ( not ( = ?auto_446665 ?auto_446669 ) ) ( not ( = ?auto_446666 ?auto_446667 ) ) ( not ( = ?auto_446666 ?auto_446668 ) ) ( not ( = ?auto_446666 ?auto_446669 ) ) ( not ( = ?auto_446667 ?auto_446668 ) ) ( not ( = ?auto_446667 ?auto_446669 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_446668 ?auto_446669 )
      ( MAKE-7CRATE-VERIFY ?auto_446662 ?auto_446663 ?auto_446664 ?auto_446665 ?auto_446666 ?auto_446667 ?auto_446668 ?auto_446669 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_446717 - SURFACE
      ?auto_446718 - SURFACE
      ?auto_446719 - SURFACE
      ?auto_446720 - SURFACE
      ?auto_446721 - SURFACE
      ?auto_446722 - SURFACE
      ?auto_446723 - SURFACE
      ?auto_446724 - SURFACE
    )
    :vars
    (
      ?auto_446726 - HOIST
      ?auto_446725 - PLACE
      ?auto_446727 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_446726 ?auto_446725 ) ( SURFACE-AT ?auto_446723 ?auto_446725 ) ( CLEAR ?auto_446723 ) ( IS-CRATE ?auto_446724 ) ( not ( = ?auto_446723 ?auto_446724 ) ) ( TRUCK-AT ?auto_446727 ?auto_446725 ) ( AVAILABLE ?auto_446726 ) ( IN ?auto_446724 ?auto_446727 ) ( ON ?auto_446723 ?auto_446722 ) ( not ( = ?auto_446722 ?auto_446723 ) ) ( not ( = ?auto_446722 ?auto_446724 ) ) ( ON ?auto_446718 ?auto_446717 ) ( ON ?auto_446719 ?auto_446718 ) ( ON ?auto_446720 ?auto_446719 ) ( ON ?auto_446721 ?auto_446720 ) ( ON ?auto_446722 ?auto_446721 ) ( not ( = ?auto_446717 ?auto_446718 ) ) ( not ( = ?auto_446717 ?auto_446719 ) ) ( not ( = ?auto_446717 ?auto_446720 ) ) ( not ( = ?auto_446717 ?auto_446721 ) ) ( not ( = ?auto_446717 ?auto_446722 ) ) ( not ( = ?auto_446717 ?auto_446723 ) ) ( not ( = ?auto_446717 ?auto_446724 ) ) ( not ( = ?auto_446718 ?auto_446719 ) ) ( not ( = ?auto_446718 ?auto_446720 ) ) ( not ( = ?auto_446718 ?auto_446721 ) ) ( not ( = ?auto_446718 ?auto_446722 ) ) ( not ( = ?auto_446718 ?auto_446723 ) ) ( not ( = ?auto_446718 ?auto_446724 ) ) ( not ( = ?auto_446719 ?auto_446720 ) ) ( not ( = ?auto_446719 ?auto_446721 ) ) ( not ( = ?auto_446719 ?auto_446722 ) ) ( not ( = ?auto_446719 ?auto_446723 ) ) ( not ( = ?auto_446719 ?auto_446724 ) ) ( not ( = ?auto_446720 ?auto_446721 ) ) ( not ( = ?auto_446720 ?auto_446722 ) ) ( not ( = ?auto_446720 ?auto_446723 ) ) ( not ( = ?auto_446720 ?auto_446724 ) ) ( not ( = ?auto_446721 ?auto_446722 ) ) ( not ( = ?auto_446721 ?auto_446723 ) ) ( not ( = ?auto_446721 ?auto_446724 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_446722 ?auto_446723 ?auto_446724 )
      ( MAKE-7CRATE-VERIFY ?auto_446717 ?auto_446718 ?auto_446719 ?auto_446720 ?auto_446721 ?auto_446722 ?auto_446723 ?auto_446724 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_446780 - SURFACE
      ?auto_446781 - SURFACE
      ?auto_446782 - SURFACE
      ?auto_446783 - SURFACE
      ?auto_446784 - SURFACE
      ?auto_446785 - SURFACE
      ?auto_446786 - SURFACE
      ?auto_446787 - SURFACE
    )
    :vars
    (
      ?auto_446791 - HOIST
      ?auto_446789 - PLACE
      ?auto_446788 - TRUCK
      ?auto_446790 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_446791 ?auto_446789 ) ( SURFACE-AT ?auto_446786 ?auto_446789 ) ( CLEAR ?auto_446786 ) ( IS-CRATE ?auto_446787 ) ( not ( = ?auto_446786 ?auto_446787 ) ) ( AVAILABLE ?auto_446791 ) ( IN ?auto_446787 ?auto_446788 ) ( ON ?auto_446786 ?auto_446785 ) ( not ( = ?auto_446785 ?auto_446786 ) ) ( not ( = ?auto_446785 ?auto_446787 ) ) ( TRUCK-AT ?auto_446788 ?auto_446790 ) ( not ( = ?auto_446790 ?auto_446789 ) ) ( ON ?auto_446781 ?auto_446780 ) ( ON ?auto_446782 ?auto_446781 ) ( ON ?auto_446783 ?auto_446782 ) ( ON ?auto_446784 ?auto_446783 ) ( ON ?auto_446785 ?auto_446784 ) ( not ( = ?auto_446780 ?auto_446781 ) ) ( not ( = ?auto_446780 ?auto_446782 ) ) ( not ( = ?auto_446780 ?auto_446783 ) ) ( not ( = ?auto_446780 ?auto_446784 ) ) ( not ( = ?auto_446780 ?auto_446785 ) ) ( not ( = ?auto_446780 ?auto_446786 ) ) ( not ( = ?auto_446780 ?auto_446787 ) ) ( not ( = ?auto_446781 ?auto_446782 ) ) ( not ( = ?auto_446781 ?auto_446783 ) ) ( not ( = ?auto_446781 ?auto_446784 ) ) ( not ( = ?auto_446781 ?auto_446785 ) ) ( not ( = ?auto_446781 ?auto_446786 ) ) ( not ( = ?auto_446781 ?auto_446787 ) ) ( not ( = ?auto_446782 ?auto_446783 ) ) ( not ( = ?auto_446782 ?auto_446784 ) ) ( not ( = ?auto_446782 ?auto_446785 ) ) ( not ( = ?auto_446782 ?auto_446786 ) ) ( not ( = ?auto_446782 ?auto_446787 ) ) ( not ( = ?auto_446783 ?auto_446784 ) ) ( not ( = ?auto_446783 ?auto_446785 ) ) ( not ( = ?auto_446783 ?auto_446786 ) ) ( not ( = ?auto_446783 ?auto_446787 ) ) ( not ( = ?auto_446784 ?auto_446785 ) ) ( not ( = ?auto_446784 ?auto_446786 ) ) ( not ( = ?auto_446784 ?auto_446787 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_446785 ?auto_446786 ?auto_446787 )
      ( MAKE-7CRATE-VERIFY ?auto_446780 ?auto_446781 ?auto_446782 ?auto_446783 ?auto_446784 ?auto_446785 ?auto_446786 ?auto_446787 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_446850 - SURFACE
      ?auto_446851 - SURFACE
      ?auto_446852 - SURFACE
      ?auto_446853 - SURFACE
      ?auto_446854 - SURFACE
      ?auto_446855 - SURFACE
      ?auto_446856 - SURFACE
      ?auto_446857 - SURFACE
    )
    :vars
    (
      ?auto_446859 - HOIST
      ?auto_446861 - PLACE
      ?auto_446858 - TRUCK
      ?auto_446860 - PLACE
      ?auto_446862 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_446859 ?auto_446861 ) ( SURFACE-AT ?auto_446856 ?auto_446861 ) ( CLEAR ?auto_446856 ) ( IS-CRATE ?auto_446857 ) ( not ( = ?auto_446856 ?auto_446857 ) ) ( AVAILABLE ?auto_446859 ) ( ON ?auto_446856 ?auto_446855 ) ( not ( = ?auto_446855 ?auto_446856 ) ) ( not ( = ?auto_446855 ?auto_446857 ) ) ( TRUCK-AT ?auto_446858 ?auto_446860 ) ( not ( = ?auto_446860 ?auto_446861 ) ) ( HOIST-AT ?auto_446862 ?auto_446860 ) ( LIFTING ?auto_446862 ?auto_446857 ) ( not ( = ?auto_446859 ?auto_446862 ) ) ( ON ?auto_446851 ?auto_446850 ) ( ON ?auto_446852 ?auto_446851 ) ( ON ?auto_446853 ?auto_446852 ) ( ON ?auto_446854 ?auto_446853 ) ( ON ?auto_446855 ?auto_446854 ) ( not ( = ?auto_446850 ?auto_446851 ) ) ( not ( = ?auto_446850 ?auto_446852 ) ) ( not ( = ?auto_446850 ?auto_446853 ) ) ( not ( = ?auto_446850 ?auto_446854 ) ) ( not ( = ?auto_446850 ?auto_446855 ) ) ( not ( = ?auto_446850 ?auto_446856 ) ) ( not ( = ?auto_446850 ?auto_446857 ) ) ( not ( = ?auto_446851 ?auto_446852 ) ) ( not ( = ?auto_446851 ?auto_446853 ) ) ( not ( = ?auto_446851 ?auto_446854 ) ) ( not ( = ?auto_446851 ?auto_446855 ) ) ( not ( = ?auto_446851 ?auto_446856 ) ) ( not ( = ?auto_446851 ?auto_446857 ) ) ( not ( = ?auto_446852 ?auto_446853 ) ) ( not ( = ?auto_446852 ?auto_446854 ) ) ( not ( = ?auto_446852 ?auto_446855 ) ) ( not ( = ?auto_446852 ?auto_446856 ) ) ( not ( = ?auto_446852 ?auto_446857 ) ) ( not ( = ?auto_446853 ?auto_446854 ) ) ( not ( = ?auto_446853 ?auto_446855 ) ) ( not ( = ?auto_446853 ?auto_446856 ) ) ( not ( = ?auto_446853 ?auto_446857 ) ) ( not ( = ?auto_446854 ?auto_446855 ) ) ( not ( = ?auto_446854 ?auto_446856 ) ) ( not ( = ?auto_446854 ?auto_446857 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_446855 ?auto_446856 ?auto_446857 )
      ( MAKE-7CRATE-VERIFY ?auto_446850 ?auto_446851 ?auto_446852 ?auto_446853 ?auto_446854 ?auto_446855 ?auto_446856 ?auto_446857 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_446927 - SURFACE
      ?auto_446928 - SURFACE
      ?auto_446929 - SURFACE
      ?auto_446930 - SURFACE
      ?auto_446931 - SURFACE
      ?auto_446932 - SURFACE
      ?auto_446933 - SURFACE
      ?auto_446934 - SURFACE
    )
    :vars
    (
      ?auto_446936 - HOIST
      ?auto_446938 - PLACE
      ?auto_446940 - TRUCK
      ?auto_446935 - PLACE
      ?auto_446939 - HOIST
      ?auto_446937 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_446936 ?auto_446938 ) ( SURFACE-AT ?auto_446933 ?auto_446938 ) ( CLEAR ?auto_446933 ) ( IS-CRATE ?auto_446934 ) ( not ( = ?auto_446933 ?auto_446934 ) ) ( AVAILABLE ?auto_446936 ) ( ON ?auto_446933 ?auto_446932 ) ( not ( = ?auto_446932 ?auto_446933 ) ) ( not ( = ?auto_446932 ?auto_446934 ) ) ( TRUCK-AT ?auto_446940 ?auto_446935 ) ( not ( = ?auto_446935 ?auto_446938 ) ) ( HOIST-AT ?auto_446939 ?auto_446935 ) ( not ( = ?auto_446936 ?auto_446939 ) ) ( AVAILABLE ?auto_446939 ) ( SURFACE-AT ?auto_446934 ?auto_446935 ) ( ON ?auto_446934 ?auto_446937 ) ( CLEAR ?auto_446934 ) ( not ( = ?auto_446933 ?auto_446937 ) ) ( not ( = ?auto_446934 ?auto_446937 ) ) ( not ( = ?auto_446932 ?auto_446937 ) ) ( ON ?auto_446928 ?auto_446927 ) ( ON ?auto_446929 ?auto_446928 ) ( ON ?auto_446930 ?auto_446929 ) ( ON ?auto_446931 ?auto_446930 ) ( ON ?auto_446932 ?auto_446931 ) ( not ( = ?auto_446927 ?auto_446928 ) ) ( not ( = ?auto_446927 ?auto_446929 ) ) ( not ( = ?auto_446927 ?auto_446930 ) ) ( not ( = ?auto_446927 ?auto_446931 ) ) ( not ( = ?auto_446927 ?auto_446932 ) ) ( not ( = ?auto_446927 ?auto_446933 ) ) ( not ( = ?auto_446927 ?auto_446934 ) ) ( not ( = ?auto_446927 ?auto_446937 ) ) ( not ( = ?auto_446928 ?auto_446929 ) ) ( not ( = ?auto_446928 ?auto_446930 ) ) ( not ( = ?auto_446928 ?auto_446931 ) ) ( not ( = ?auto_446928 ?auto_446932 ) ) ( not ( = ?auto_446928 ?auto_446933 ) ) ( not ( = ?auto_446928 ?auto_446934 ) ) ( not ( = ?auto_446928 ?auto_446937 ) ) ( not ( = ?auto_446929 ?auto_446930 ) ) ( not ( = ?auto_446929 ?auto_446931 ) ) ( not ( = ?auto_446929 ?auto_446932 ) ) ( not ( = ?auto_446929 ?auto_446933 ) ) ( not ( = ?auto_446929 ?auto_446934 ) ) ( not ( = ?auto_446929 ?auto_446937 ) ) ( not ( = ?auto_446930 ?auto_446931 ) ) ( not ( = ?auto_446930 ?auto_446932 ) ) ( not ( = ?auto_446930 ?auto_446933 ) ) ( not ( = ?auto_446930 ?auto_446934 ) ) ( not ( = ?auto_446930 ?auto_446937 ) ) ( not ( = ?auto_446931 ?auto_446932 ) ) ( not ( = ?auto_446931 ?auto_446933 ) ) ( not ( = ?auto_446931 ?auto_446934 ) ) ( not ( = ?auto_446931 ?auto_446937 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_446932 ?auto_446933 ?auto_446934 )
      ( MAKE-7CRATE-VERIFY ?auto_446927 ?auto_446928 ?auto_446929 ?auto_446930 ?auto_446931 ?auto_446932 ?auto_446933 ?auto_446934 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_447005 - SURFACE
      ?auto_447006 - SURFACE
      ?auto_447007 - SURFACE
      ?auto_447008 - SURFACE
      ?auto_447009 - SURFACE
      ?auto_447010 - SURFACE
      ?auto_447011 - SURFACE
      ?auto_447012 - SURFACE
    )
    :vars
    (
      ?auto_447014 - HOIST
      ?auto_447017 - PLACE
      ?auto_447016 - PLACE
      ?auto_447015 - HOIST
      ?auto_447013 - SURFACE
      ?auto_447018 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_447014 ?auto_447017 ) ( SURFACE-AT ?auto_447011 ?auto_447017 ) ( CLEAR ?auto_447011 ) ( IS-CRATE ?auto_447012 ) ( not ( = ?auto_447011 ?auto_447012 ) ) ( AVAILABLE ?auto_447014 ) ( ON ?auto_447011 ?auto_447010 ) ( not ( = ?auto_447010 ?auto_447011 ) ) ( not ( = ?auto_447010 ?auto_447012 ) ) ( not ( = ?auto_447016 ?auto_447017 ) ) ( HOIST-AT ?auto_447015 ?auto_447016 ) ( not ( = ?auto_447014 ?auto_447015 ) ) ( AVAILABLE ?auto_447015 ) ( SURFACE-AT ?auto_447012 ?auto_447016 ) ( ON ?auto_447012 ?auto_447013 ) ( CLEAR ?auto_447012 ) ( not ( = ?auto_447011 ?auto_447013 ) ) ( not ( = ?auto_447012 ?auto_447013 ) ) ( not ( = ?auto_447010 ?auto_447013 ) ) ( TRUCK-AT ?auto_447018 ?auto_447017 ) ( ON ?auto_447006 ?auto_447005 ) ( ON ?auto_447007 ?auto_447006 ) ( ON ?auto_447008 ?auto_447007 ) ( ON ?auto_447009 ?auto_447008 ) ( ON ?auto_447010 ?auto_447009 ) ( not ( = ?auto_447005 ?auto_447006 ) ) ( not ( = ?auto_447005 ?auto_447007 ) ) ( not ( = ?auto_447005 ?auto_447008 ) ) ( not ( = ?auto_447005 ?auto_447009 ) ) ( not ( = ?auto_447005 ?auto_447010 ) ) ( not ( = ?auto_447005 ?auto_447011 ) ) ( not ( = ?auto_447005 ?auto_447012 ) ) ( not ( = ?auto_447005 ?auto_447013 ) ) ( not ( = ?auto_447006 ?auto_447007 ) ) ( not ( = ?auto_447006 ?auto_447008 ) ) ( not ( = ?auto_447006 ?auto_447009 ) ) ( not ( = ?auto_447006 ?auto_447010 ) ) ( not ( = ?auto_447006 ?auto_447011 ) ) ( not ( = ?auto_447006 ?auto_447012 ) ) ( not ( = ?auto_447006 ?auto_447013 ) ) ( not ( = ?auto_447007 ?auto_447008 ) ) ( not ( = ?auto_447007 ?auto_447009 ) ) ( not ( = ?auto_447007 ?auto_447010 ) ) ( not ( = ?auto_447007 ?auto_447011 ) ) ( not ( = ?auto_447007 ?auto_447012 ) ) ( not ( = ?auto_447007 ?auto_447013 ) ) ( not ( = ?auto_447008 ?auto_447009 ) ) ( not ( = ?auto_447008 ?auto_447010 ) ) ( not ( = ?auto_447008 ?auto_447011 ) ) ( not ( = ?auto_447008 ?auto_447012 ) ) ( not ( = ?auto_447008 ?auto_447013 ) ) ( not ( = ?auto_447009 ?auto_447010 ) ) ( not ( = ?auto_447009 ?auto_447011 ) ) ( not ( = ?auto_447009 ?auto_447012 ) ) ( not ( = ?auto_447009 ?auto_447013 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_447010 ?auto_447011 ?auto_447012 )
      ( MAKE-7CRATE-VERIFY ?auto_447005 ?auto_447006 ?auto_447007 ?auto_447008 ?auto_447009 ?auto_447010 ?auto_447011 ?auto_447012 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_447083 - SURFACE
      ?auto_447084 - SURFACE
      ?auto_447085 - SURFACE
      ?auto_447086 - SURFACE
      ?auto_447087 - SURFACE
      ?auto_447088 - SURFACE
      ?auto_447089 - SURFACE
      ?auto_447090 - SURFACE
    )
    :vars
    (
      ?auto_447091 - HOIST
      ?auto_447092 - PLACE
      ?auto_447096 - PLACE
      ?auto_447094 - HOIST
      ?auto_447093 - SURFACE
      ?auto_447095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_447091 ?auto_447092 ) ( IS-CRATE ?auto_447090 ) ( not ( = ?auto_447089 ?auto_447090 ) ) ( not ( = ?auto_447088 ?auto_447089 ) ) ( not ( = ?auto_447088 ?auto_447090 ) ) ( not ( = ?auto_447096 ?auto_447092 ) ) ( HOIST-AT ?auto_447094 ?auto_447096 ) ( not ( = ?auto_447091 ?auto_447094 ) ) ( AVAILABLE ?auto_447094 ) ( SURFACE-AT ?auto_447090 ?auto_447096 ) ( ON ?auto_447090 ?auto_447093 ) ( CLEAR ?auto_447090 ) ( not ( = ?auto_447089 ?auto_447093 ) ) ( not ( = ?auto_447090 ?auto_447093 ) ) ( not ( = ?auto_447088 ?auto_447093 ) ) ( TRUCK-AT ?auto_447095 ?auto_447092 ) ( SURFACE-AT ?auto_447088 ?auto_447092 ) ( CLEAR ?auto_447088 ) ( LIFTING ?auto_447091 ?auto_447089 ) ( IS-CRATE ?auto_447089 ) ( ON ?auto_447084 ?auto_447083 ) ( ON ?auto_447085 ?auto_447084 ) ( ON ?auto_447086 ?auto_447085 ) ( ON ?auto_447087 ?auto_447086 ) ( ON ?auto_447088 ?auto_447087 ) ( not ( = ?auto_447083 ?auto_447084 ) ) ( not ( = ?auto_447083 ?auto_447085 ) ) ( not ( = ?auto_447083 ?auto_447086 ) ) ( not ( = ?auto_447083 ?auto_447087 ) ) ( not ( = ?auto_447083 ?auto_447088 ) ) ( not ( = ?auto_447083 ?auto_447089 ) ) ( not ( = ?auto_447083 ?auto_447090 ) ) ( not ( = ?auto_447083 ?auto_447093 ) ) ( not ( = ?auto_447084 ?auto_447085 ) ) ( not ( = ?auto_447084 ?auto_447086 ) ) ( not ( = ?auto_447084 ?auto_447087 ) ) ( not ( = ?auto_447084 ?auto_447088 ) ) ( not ( = ?auto_447084 ?auto_447089 ) ) ( not ( = ?auto_447084 ?auto_447090 ) ) ( not ( = ?auto_447084 ?auto_447093 ) ) ( not ( = ?auto_447085 ?auto_447086 ) ) ( not ( = ?auto_447085 ?auto_447087 ) ) ( not ( = ?auto_447085 ?auto_447088 ) ) ( not ( = ?auto_447085 ?auto_447089 ) ) ( not ( = ?auto_447085 ?auto_447090 ) ) ( not ( = ?auto_447085 ?auto_447093 ) ) ( not ( = ?auto_447086 ?auto_447087 ) ) ( not ( = ?auto_447086 ?auto_447088 ) ) ( not ( = ?auto_447086 ?auto_447089 ) ) ( not ( = ?auto_447086 ?auto_447090 ) ) ( not ( = ?auto_447086 ?auto_447093 ) ) ( not ( = ?auto_447087 ?auto_447088 ) ) ( not ( = ?auto_447087 ?auto_447089 ) ) ( not ( = ?auto_447087 ?auto_447090 ) ) ( not ( = ?auto_447087 ?auto_447093 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_447088 ?auto_447089 ?auto_447090 )
      ( MAKE-7CRATE-VERIFY ?auto_447083 ?auto_447084 ?auto_447085 ?auto_447086 ?auto_447087 ?auto_447088 ?auto_447089 ?auto_447090 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_447161 - SURFACE
      ?auto_447162 - SURFACE
      ?auto_447163 - SURFACE
      ?auto_447164 - SURFACE
      ?auto_447165 - SURFACE
      ?auto_447166 - SURFACE
      ?auto_447167 - SURFACE
      ?auto_447168 - SURFACE
    )
    :vars
    (
      ?auto_447172 - HOIST
      ?auto_447171 - PLACE
      ?auto_447173 - PLACE
      ?auto_447174 - HOIST
      ?auto_447170 - SURFACE
      ?auto_447169 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_447172 ?auto_447171 ) ( IS-CRATE ?auto_447168 ) ( not ( = ?auto_447167 ?auto_447168 ) ) ( not ( = ?auto_447166 ?auto_447167 ) ) ( not ( = ?auto_447166 ?auto_447168 ) ) ( not ( = ?auto_447173 ?auto_447171 ) ) ( HOIST-AT ?auto_447174 ?auto_447173 ) ( not ( = ?auto_447172 ?auto_447174 ) ) ( AVAILABLE ?auto_447174 ) ( SURFACE-AT ?auto_447168 ?auto_447173 ) ( ON ?auto_447168 ?auto_447170 ) ( CLEAR ?auto_447168 ) ( not ( = ?auto_447167 ?auto_447170 ) ) ( not ( = ?auto_447168 ?auto_447170 ) ) ( not ( = ?auto_447166 ?auto_447170 ) ) ( TRUCK-AT ?auto_447169 ?auto_447171 ) ( SURFACE-AT ?auto_447166 ?auto_447171 ) ( CLEAR ?auto_447166 ) ( IS-CRATE ?auto_447167 ) ( AVAILABLE ?auto_447172 ) ( IN ?auto_447167 ?auto_447169 ) ( ON ?auto_447162 ?auto_447161 ) ( ON ?auto_447163 ?auto_447162 ) ( ON ?auto_447164 ?auto_447163 ) ( ON ?auto_447165 ?auto_447164 ) ( ON ?auto_447166 ?auto_447165 ) ( not ( = ?auto_447161 ?auto_447162 ) ) ( not ( = ?auto_447161 ?auto_447163 ) ) ( not ( = ?auto_447161 ?auto_447164 ) ) ( not ( = ?auto_447161 ?auto_447165 ) ) ( not ( = ?auto_447161 ?auto_447166 ) ) ( not ( = ?auto_447161 ?auto_447167 ) ) ( not ( = ?auto_447161 ?auto_447168 ) ) ( not ( = ?auto_447161 ?auto_447170 ) ) ( not ( = ?auto_447162 ?auto_447163 ) ) ( not ( = ?auto_447162 ?auto_447164 ) ) ( not ( = ?auto_447162 ?auto_447165 ) ) ( not ( = ?auto_447162 ?auto_447166 ) ) ( not ( = ?auto_447162 ?auto_447167 ) ) ( not ( = ?auto_447162 ?auto_447168 ) ) ( not ( = ?auto_447162 ?auto_447170 ) ) ( not ( = ?auto_447163 ?auto_447164 ) ) ( not ( = ?auto_447163 ?auto_447165 ) ) ( not ( = ?auto_447163 ?auto_447166 ) ) ( not ( = ?auto_447163 ?auto_447167 ) ) ( not ( = ?auto_447163 ?auto_447168 ) ) ( not ( = ?auto_447163 ?auto_447170 ) ) ( not ( = ?auto_447164 ?auto_447165 ) ) ( not ( = ?auto_447164 ?auto_447166 ) ) ( not ( = ?auto_447164 ?auto_447167 ) ) ( not ( = ?auto_447164 ?auto_447168 ) ) ( not ( = ?auto_447164 ?auto_447170 ) ) ( not ( = ?auto_447165 ?auto_447166 ) ) ( not ( = ?auto_447165 ?auto_447167 ) ) ( not ( = ?auto_447165 ?auto_447168 ) ) ( not ( = ?auto_447165 ?auto_447170 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_447166 ?auto_447167 ?auto_447168 )
      ( MAKE-7CRATE-VERIFY ?auto_447161 ?auto_447162 ?auto_447163 ?auto_447164 ?auto_447165 ?auto_447166 ?auto_447167 ?auto_447168 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_450065 - SURFACE
      ?auto_450066 - SURFACE
      ?auto_450067 - SURFACE
      ?auto_450068 - SURFACE
      ?auto_450069 - SURFACE
      ?auto_450070 - SURFACE
      ?auto_450071 - SURFACE
      ?auto_450072 - SURFACE
      ?auto_450073 - SURFACE
    )
    :vars
    (
      ?auto_450074 - HOIST
      ?auto_450075 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_450074 ?auto_450075 ) ( SURFACE-AT ?auto_450072 ?auto_450075 ) ( CLEAR ?auto_450072 ) ( LIFTING ?auto_450074 ?auto_450073 ) ( IS-CRATE ?auto_450073 ) ( not ( = ?auto_450072 ?auto_450073 ) ) ( ON ?auto_450066 ?auto_450065 ) ( ON ?auto_450067 ?auto_450066 ) ( ON ?auto_450068 ?auto_450067 ) ( ON ?auto_450069 ?auto_450068 ) ( ON ?auto_450070 ?auto_450069 ) ( ON ?auto_450071 ?auto_450070 ) ( ON ?auto_450072 ?auto_450071 ) ( not ( = ?auto_450065 ?auto_450066 ) ) ( not ( = ?auto_450065 ?auto_450067 ) ) ( not ( = ?auto_450065 ?auto_450068 ) ) ( not ( = ?auto_450065 ?auto_450069 ) ) ( not ( = ?auto_450065 ?auto_450070 ) ) ( not ( = ?auto_450065 ?auto_450071 ) ) ( not ( = ?auto_450065 ?auto_450072 ) ) ( not ( = ?auto_450065 ?auto_450073 ) ) ( not ( = ?auto_450066 ?auto_450067 ) ) ( not ( = ?auto_450066 ?auto_450068 ) ) ( not ( = ?auto_450066 ?auto_450069 ) ) ( not ( = ?auto_450066 ?auto_450070 ) ) ( not ( = ?auto_450066 ?auto_450071 ) ) ( not ( = ?auto_450066 ?auto_450072 ) ) ( not ( = ?auto_450066 ?auto_450073 ) ) ( not ( = ?auto_450067 ?auto_450068 ) ) ( not ( = ?auto_450067 ?auto_450069 ) ) ( not ( = ?auto_450067 ?auto_450070 ) ) ( not ( = ?auto_450067 ?auto_450071 ) ) ( not ( = ?auto_450067 ?auto_450072 ) ) ( not ( = ?auto_450067 ?auto_450073 ) ) ( not ( = ?auto_450068 ?auto_450069 ) ) ( not ( = ?auto_450068 ?auto_450070 ) ) ( not ( = ?auto_450068 ?auto_450071 ) ) ( not ( = ?auto_450068 ?auto_450072 ) ) ( not ( = ?auto_450068 ?auto_450073 ) ) ( not ( = ?auto_450069 ?auto_450070 ) ) ( not ( = ?auto_450069 ?auto_450071 ) ) ( not ( = ?auto_450069 ?auto_450072 ) ) ( not ( = ?auto_450069 ?auto_450073 ) ) ( not ( = ?auto_450070 ?auto_450071 ) ) ( not ( = ?auto_450070 ?auto_450072 ) ) ( not ( = ?auto_450070 ?auto_450073 ) ) ( not ( = ?auto_450071 ?auto_450072 ) ) ( not ( = ?auto_450071 ?auto_450073 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_450072 ?auto_450073 )
      ( MAKE-8CRATE-VERIFY ?auto_450065 ?auto_450066 ?auto_450067 ?auto_450068 ?auto_450069 ?auto_450070 ?auto_450071 ?auto_450072 ?auto_450073 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_450132 - SURFACE
      ?auto_450133 - SURFACE
      ?auto_450134 - SURFACE
      ?auto_450135 - SURFACE
      ?auto_450136 - SURFACE
      ?auto_450137 - SURFACE
      ?auto_450138 - SURFACE
      ?auto_450139 - SURFACE
      ?auto_450140 - SURFACE
    )
    :vars
    (
      ?auto_450142 - HOIST
      ?auto_450141 - PLACE
      ?auto_450143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_450142 ?auto_450141 ) ( SURFACE-AT ?auto_450139 ?auto_450141 ) ( CLEAR ?auto_450139 ) ( IS-CRATE ?auto_450140 ) ( not ( = ?auto_450139 ?auto_450140 ) ) ( TRUCK-AT ?auto_450143 ?auto_450141 ) ( AVAILABLE ?auto_450142 ) ( IN ?auto_450140 ?auto_450143 ) ( ON ?auto_450139 ?auto_450138 ) ( not ( = ?auto_450138 ?auto_450139 ) ) ( not ( = ?auto_450138 ?auto_450140 ) ) ( ON ?auto_450133 ?auto_450132 ) ( ON ?auto_450134 ?auto_450133 ) ( ON ?auto_450135 ?auto_450134 ) ( ON ?auto_450136 ?auto_450135 ) ( ON ?auto_450137 ?auto_450136 ) ( ON ?auto_450138 ?auto_450137 ) ( not ( = ?auto_450132 ?auto_450133 ) ) ( not ( = ?auto_450132 ?auto_450134 ) ) ( not ( = ?auto_450132 ?auto_450135 ) ) ( not ( = ?auto_450132 ?auto_450136 ) ) ( not ( = ?auto_450132 ?auto_450137 ) ) ( not ( = ?auto_450132 ?auto_450138 ) ) ( not ( = ?auto_450132 ?auto_450139 ) ) ( not ( = ?auto_450132 ?auto_450140 ) ) ( not ( = ?auto_450133 ?auto_450134 ) ) ( not ( = ?auto_450133 ?auto_450135 ) ) ( not ( = ?auto_450133 ?auto_450136 ) ) ( not ( = ?auto_450133 ?auto_450137 ) ) ( not ( = ?auto_450133 ?auto_450138 ) ) ( not ( = ?auto_450133 ?auto_450139 ) ) ( not ( = ?auto_450133 ?auto_450140 ) ) ( not ( = ?auto_450134 ?auto_450135 ) ) ( not ( = ?auto_450134 ?auto_450136 ) ) ( not ( = ?auto_450134 ?auto_450137 ) ) ( not ( = ?auto_450134 ?auto_450138 ) ) ( not ( = ?auto_450134 ?auto_450139 ) ) ( not ( = ?auto_450134 ?auto_450140 ) ) ( not ( = ?auto_450135 ?auto_450136 ) ) ( not ( = ?auto_450135 ?auto_450137 ) ) ( not ( = ?auto_450135 ?auto_450138 ) ) ( not ( = ?auto_450135 ?auto_450139 ) ) ( not ( = ?auto_450135 ?auto_450140 ) ) ( not ( = ?auto_450136 ?auto_450137 ) ) ( not ( = ?auto_450136 ?auto_450138 ) ) ( not ( = ?auto_450136 ?auto_450139 ) ) ( not ( = ?auto_450136 ?auto_450140 ) ) ( not ( = ?auto_450137 ?auto_450138 ) ) ( not ( = ?auto_450137 ?auto_450139 ) ) ( not ( = ?auto_450137 ?auto_450140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_450138 ?auto_450139 ?auto_450140 )
      ( MAKE-8CRATE-VERIFY ?auto_450132 ?auto_450133 ?auto_450134 ?auto_450135 ?auto_450136 ?auto_450137 ?auto_450138 ?auto_450139 ?auto_450140 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_450208 - SURFACE
      ?auto_450209 - SURFACE
      ?auto_450210 - SURFACE
      ?auto_450211 - SURFACE
      ?auto_450212 - SURFACE
      ?auto_450213 - SURFACE
      ?auto_450214 - SURFACE
      ?auto_450215 - SURFACE
      ?auto_450216 - SURFACE
    )
    :vars
    (
      ?auto_450217 - HOIST
      ?auto_450220 - PLACE
      ?auto_450219 - TRUCK
      ?auto_450218 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_450217 ?auto_450220 ) ( SURFACE-AT ?auto_450215 ?auto_450220 ) ( CLEAR ?auto_450215 ) ( IS-CRATE ?auto_450216 ) ( not ( = ?auto_450215 ?auto_450216 ) ) ( AVAILABLE ?auto_450217 ) ( IN ?auto_450216 ?auto_450219 ) ( ON ?auto_450215 ?auto_450214 ) ( not ( = ?auto_450214 ?auto_450215 ) ) ( not ( = ?auto_450214 ?auto_450216 ) ) ( TRUCK-AT ?auto_450219 ?auto_450218 ) ( not ( = ?auto_450218 ?auto_450220 ) ) ( ON ?auto_450209 ?auto_450208 ) ( ON ?auto_450210 ?auto_450209 ) ( ON ?auto_450211 ?auto_450210 ) ( ON ?auto_450212 ?auto_450211 ) ( ON ?auto_450213 ?auto_450212 ) ( ON ?auto_450214 ?auto_450213 ) ( not ( = ?auto_450208 ?auto_450209 ) ) ( not ( = ?auto_450208 ?auto_450210 ) ) ( not ( = ?auto_450208 ?auto_450211 ) ) ( not ( = ?auto_450208 ?auto_450212 ) ) ( not ( = ?auto_450208 ?auto_450213 ) ) ( not ( = ?auto_450208 ?auto_450214 ) ) ( not ( = ?auto_450208 ?auto_450215 ) ) ( not ( = ?auto_450208 ?auto_450216 ) ) ( not ( = ?auto_450209 ?auto_450210 ) ) ( not ( = ?auto_450209 ?auto_450211 ) ) ( not ( = ?auto_450209 ?auto_450212 ) ) ( not ( = ?auto_450209 ?auto_450213 ) ) ( not ( = ?auto_450209 ?auto_450214 ) ) ( not ( = ?auto_450209 ?auto_450215 ) ) ( not ( = ?auto_450209 ?auto_450216 ) ) ( not ( = ?auto_450210 ?auto_450211 ) ) ( not ( = ?auto_450210 ?auto_450212 ) ) ( not ( = ?auto_450210 ?auto_450213 ) ) ( not ( = ?auto_450210 ?auto_450214 ) ) ( not ( = ?auto_450210 ?auto_450215 ) ) ( not ( = ?auto_450210 ?auto_450216 ) ) ( not ( = ?auto_450211 ?auto_450212 ) ) ( not ( = ?auto_450211 ?auto_450213 ) ) ( not ( = ?auto_450211 ?auto_450214 ) ) ( not ( = ?auto_450211 ?auto_450215 ) ) ( not ( = ?auto_450211 ?auto_450216 ) ) ( not ( = ?auto_450212 ?auto_450213 ) ) ( not ( = ?auto_450212 ?auto_450214 ) ) ( not ( = ?auto_450212 ?auto_450215 ) ) ( not ( = ?auto_450212 ?auto_450216 ) ) ( not ( = ?auto_450213 ?auto_450214 ) ) ( not ( = ?auto_450213 ?auto_450215 ) ) ( not ( = ?auto_450213 ?auto_450216 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_450214 ?auto_450215 ?auto_450216 )
      ( MAKE-8CRATE-VERIFY ?auto_450208 ?auto_450209 ?auto_450210 ?auto_450211 ?auto_450212 ?auto_450213 ?auto_450214 ?auto_450215 ?auto_450216 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_450292 - SURFACE
      ?auto_450293 - SURFACE
      ?auto_450294 - SURFACE
      ?auto_450295 - SURFACE
      ?auto_450296 - SURFACE
      ?auto_450297 - SURFACE
      ?auto_450298 - SURFACE
      ?auto_450299 - SURFACE
      ?auto_450300 - SURFACE
    )
    :vars
    (
      ?auto_450302 - HOIST
      ?auto_450303 - PLACE
      ?auto_450301 - TRUCK
      ?auto_450305 - PLACE
      ?auto_450304 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_450302 ?auto_450303 ) ( SURFACE-AT ?auto_450299 ?auto_450303 ) ( CLEAR ?auto_450299 ) ( IS-CRATE ?auto_450300 ) ( not ( = ?auto_450299 ?auto_450300 ) ) ( AVAILABLE ?auto_450302 ) ( ON ?auto_450299 ?auto_450298 ) ( not ( = ?auto_450298 ?auto_450299 ) ) ( not ( = ?auto_450298 ?auto_450300 ) ) ( TRUCK-AT ?auto_450301 ?auto_450305 ) ( not ( = ?auto_450305 ?auto_450303 ) ) ( HOIST-AT ?auto_450304 ?auto_450305 ) ( LIFTING ?auto_450304 ?auto_450300 ) ( not ( = ?auto_450302 ?auto_450304 ) ) ( ON ?auto_450293 ?auto_450292 ) ( ON ?auto_450294 ?auto_450293 ) ( ON ?auto_450295 ?auto_450294 ) ( ON ?auto_450296 ?auto_450295 ) ( ON ?auto_450297 ?auto_450296 ) ( ON ?auto_450298 ?auto_450297 ) ( not ( = ?auto_450292 ?auto_450293 ) ) ( not ( = ?auto_450292 ?auto_450294 ) ) ( not ( = ?auto_450292 ?auto_450295 ) ) ( not ( = ?auto_450292 ?auto_450296 ) ) ( not ( = ?auto_450292 ?auto_450297 ) ) ( not ( = ?auto_450292 ?auto_450298 ) ) ( not ( = ?auto_450292 ?auto_450299 ) ) ( not ( = ?auto_450292 ?auto_450300 ) ) ( not ( = ?auto_450293 ?auto_450294 ) ) ( not ( = ?auto_450293 ?auto_450295 ) ) ( not ( = ?auto_450293 ?auto_450296 ) ) ( not ( = ?auto_450293 ?auto_450297 ) ) ( not ( = ?auto_450293 ?auto_450298 ) ) ( not ( = ?auto_450293 ?auto_450299 ) ) ( not ( = ?auto_450293 ?auto_450300 ) ) ( not ( = ?auto_450294 ?auto_450295 ) ) ( not ( = ?auto_450294 ?auto_450296 ) ) ( not ( = ?auto_450294 ?auto_450297 ) ) ( not ( = ?auto_450294 ?auto_450298 ) ) ( not ( = ?auto_450294 ?auto_450299 ) ) ( not ( = ?auto_450294 ?auto_450300 ) ) ( not ( = ?auto_450295 ?auto_450296 ) ) ( not ( = ?auto_450295 ?auto_450297 ) ) ( not ( = ?auto_450295 ?auto_450298 ) ) ( not ( = ?auto_450295 ?auto_450299 ) ) ( not ( = ?auto_450295 ?auto_450300 ) ) ( not ( = ?auto_450296 ?auto_450297 ) ) ( not ( = ?auto_450296 ?auto_450298 ) ) ( not ( = ?auto_450296 ?auto_450299 ) ) ( not ( = ?auto_450296 ?auto_450300 ) ) ( not ( = ?auto_450297 ?auto_450298 ) ) ( not ( = ?auto_450297 ?auto_450299 ) ) ( not ( = ?auto_450297 ?auto_450300 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_450298 ?auto_450299 ?auto_450300 )
      ( MAKE-8CRATE-VERIFY ?auto_450292 ?auto_450293 ?auto_450294 ?auto_450295 ?auto_450296 ?auto_450297 ?auto_450298 ?auto_450299 ?auto_450300 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_450384 - SURFACE
      ?auto_450385 - SURFACE
      ?auto_450386 - SURFACE
      ?auto_450387 - SURFACE
      ?auto_450388 - SURFACE
      ?auto_450389 - SURFACE
      ?auto_450390 - SURFACE
      ?auto_450391 - SURFACE
      ?auto_450392 - SURFACE
    )
    :vars
    (
      ?auto_450395 - HOIST
      ?auto_450393 - PLACE
      ?auto_450397 - TRUCK
      ?auto_450398 - PLACE
      ?auto_450396 - HOIST
      ?auto_450394 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_450395 ?auto_450393 ) ( SURFACE-AT ?auto_450391 ?auto_450393 ) ( CLEAR ?auto_450391 ) ( IS-CRATE ?auto_450392 ) ( not ( = ?auto_450391 ?auto_450392 ) ) ( AVAILABLE ?auto_450395 ) ( ON ?auto_450391 ?auto_450390 ) ( not ( = ?auto_450390 ?auto_450391 ) ) ( not ( = ?auto_450390 ?auto_450392 ) ) ( TRUCK-AT ?auto_450397 ?auto_450398 ) ( not ( = ?auto_450398 ?auto_450393 ) ) ( HOIST-AT ?auto_450396 ?auto_450398 ) ( not ( = ?auto_450395 ?auto_450396 ) ) ( AVAILABLE ?auto_450396 ) ( SURFACE-AT ?auto_450392 ?auto_450398 ) ( ON ?auto_450392 ?auto_450394 ) ( CLEAR ?auto_450392 ) ( not ( = ?auto_450391 ?auto_450394 ) ) ( not ( = ?auto_450392 ?auto_450394 ) ) ( not ( = ?auto_450390 ?auto_450394 ) ) ( ON ?auto_450385 ?auto_450384 ) ( ON ?auto_450386 ?auto_450385 ) ( ON ?auto_450387 ?auto_450386 ) ( ON ?auto_450388 ?auto_450387 ) ( ON ?auto_450389 ?auto_450388 ) ( ON ?auto_450390 ?auto_450389 ) ( not ( = ?auto_450384 ?auto_450385 ) ) ( not ( = ?auto_450384 ?auto_450386 ) ) ( not ( = ?auto_450384 ?auto_450387 ) ) ( not ( = ?auto_450384 ?auto_450388 ) ) ( not ( = ?auto_450384 ?auto_450389 ) ) ( not ( = ?auto_450384 ?auto_450390 ) ) ( not ( = ?auto_450384 ?auto_450391 ) ) ( not ( = ?auto_450384 ?auto_450392 ) ) ( not ( = ?auto_450384 ?auto_450394 ) ) ( not ( = ?auto_450385 ?auto_450386 ) ) ( not ( = ?auto_450385 ?auto_450387 ) ) ( not ( = ?auto_450385 ?auto_450388 ) ) ( not ( = ?auto_450385 ?auto_450389 ) ) ( not ( = ?auto_450385 ?auto_450390 ) ) ( not ( = ?auto_450385 ?auto_450391 ) ) ( not ( = ?auto_450385 ?auto_450392 ) ) ( not ( = ?auto_450385 ?auto_450394 ) ) ( not ( = ?auto_450386 ?auto_450387 ) ) ( not ( = ?auto_450386 ?auto_450388 ) ) ( not ( = ?auto_450386 ?auto_450389 ) ) ( not ( = ?auto_450386 ?auto_450390 ) ) ( not ( = ?auto_450386 ?auto_450391 ) ) ( not ( = ?auto_450386 ?auto_450392 ) ) ( not ( = ?auto_450386 ?auto_450394 ) ) ( not ( = ?auto_450387 ?auto_450388 ) ) ( not ( = ?auto_450387 ?auto_450389 ) ) ( not ( = ?auto_450387 ?auto_450390 ) ) ( not ( = ?auto_450387 ?auto_450391 ) ) ( not ( = ?auto_450387 ?auto_450392 ) ) ( not ( = ?auto_450387 ?auto_450394 ) ) ( not ( = ?auto_450388 ?auto_450389 ) ) ( not ( = ?auto_450388 ?auto_450390 ) ) ( not ( = ?auto_450388 ?auto_450391 ) ) ( not ( = ?auto_450388 ?auto_450392 ) ) ( not ( = ?auto_450388 ?auto_450394 ) ) ( not ( = ?auto_450389 ?auto_450390 ) ) ( not ( = ?auto_450389 ?auto_450391 ) ) ( not ( = ?auto_450389 ?auto_450392 ) ) ( not ( = ?auto_450389 ?auto_450394 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_450390 ?auto_450391 ?auto_450392 )
      ( MAKE-8CRATE-VERIFY ?auto_450384 ?auto_450385 ?auto_450386 ?auto_450387 ?auto_450388 ?auto_450389 ?auto_450390 ?auto_450391 ?auto_450392 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_450477 - SURFACE
      ?auto_450478 - SURFACE
      ?auto_450479 - SURFACE
      ?auto_450480 - SURFACE
      ?auto_450481 - SURFACE
      ?auto_450482 - SURFACE
      ?auto_450483 - SURFACE
      ?auto_450484 - SURFACE
      ?auto_450485 - SURFACE
    )
    :vars
    (
      ?auto_450487 - HOIST
      ?auto_450488 - PLACE
      ?auto_450491 - PLACE
      ?auto_450490 - HOIST
      ?auto_450489 - SURFACE
      ?auto_450486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_450487 ?auto_450488 ) ( SURFACE-AT ?auto_450484 ?auto_450488 ) ( CLEAR ?auto_450484 ) ( IS-CRATE ?auto_450485 ) ( not ( = ?auto_450484 ?auto_450485 ) ) ( AVAILABLE ?auto_450487 ) ( ON ?auto_450484 ?auto_450483 ) ( not ( = ?auto_450483 ?auto_450484 ) ) ( not ( = ?auto_450483 ?auto_450485 ) ) ( not ( = ?auto_450491 ?auto_450488 ) ) ( HOIST-AT ?auto_450490 ?auto_450491 ) ( not ( = ?auto_450487 ?auto_450490 ) ) ( AVAILABLE ?auto_450490 ) ( SURFACE-AT ?auto_450485 ?auto_450491 ) ( ON ?auto_450485 ?auto_450489 ) ( CLEAR ?auto_450485 ) ( not ( = ?auto_450484 ?auto_450489 ) ) ( not ( = ?auto_450485 ?auto_450489 ) ) ( not ( = ?auto_450483 ?auto_450489 ) ) ( TRUCK-AT ?auto_450486 ?auto_450488 ) ( ON ?auto_450478 ?auto_450477 ) ( ON ?auto_450479 ?auto_450478 ) ( ON ?auto_450480 ?auto_450479 ) ( ON ?auto_450481 ?auto_450480 ) ( ON ?auto_450482 ?auto_450481 ) ( ON ?auto_450483 ?auto_450482 ) ( not ( = ?auto_450477 ?auto_450478 ) ) ( not ( = ?auto_450477 ?auto_450479 ) ) ( not ( = ?auto_450477 ?auto_450480 ) ) ( not ( = ?auto_450477 ?auto_450481 ) ) ( not ( = ?auto_450477 ?auto_450482 ) ) ( not ( = ?auto_450477 ?auto_450483 ) ) ( not ( = ?auto_450477 ?auto_450484 ) ) ( not ( = ?auto_450477 ?auto_450485 ) ) ( not ( = ?auto_450477 ?auto_450489 ) ) ( not ( = ?auto_450478 ?auto_450479 ) ) ( not ( = ?auto_450478 ?auto_450480 ) ) ( not ( = ?auto_450478 ?auto_450481 ) ) ( not ( = ?auto_450478 ?auto_450482 ) ) ( not ( = ?auto_450478 ?auto_450483 ) ) ( not ( = ?auto_450478 ?auto_450484 ) ) ( not ( = ?auto_450478 ?auto_450485 ) ) ( not ( = ?auto_450478 ?auto_450489 ) ) ( not ( = ?auto_450479 ?auto_450480 ) ) ( not ( = ?auto_450479 ?auto_450481 ) ) ( not ( = ?auto_450479 ?auto_450482 ) ) ( not ( = ?auto_450479 ?auto_450483 ) ) ( not ( = ?auto_450479 ?auto_450484 ) ) ( not ( = ?auto_450479 ?auto_450485 ) ) ( not ( = ?auto_450479 ?auto_450489 ) ) ( not ( = ?auto_450480 ?auto_450481 ) ) ( not ( = ?auto_450480 ?auto_450482 ) ) ( not ( = ?auto_450480 ?auto_450483 ) ) ( not ( = ?auto_450480 ?auto_450484 ) ) ( not ( = ?auto_450480 ?auto_450485 ) ) ( not ( = ?auto_450480 ?auto_450489 ) ) ( not ( = ?auto_450481 ?auto_450482 ) ) ( not ( = ?auto_450481 ?auto_450483 ) ) ( not ( = ?auto_450481 ?auto_450484 ) ) ( not ( = ?auto_450481 ?auto_450485 ) ) ( not ( = ?auto_450481 ?auto_450489 ) ) ( not ( = ?auto_450482 ?auto_450483 ) ) ( not ( = ?auto_450482 ?auto_450484 ) ) ( not ( = ?auto_450482 ?auto_450485 ) ) ( not ( = ?auto_450482 ?auto_450489 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_450483 ?auto_450484 ?auto_450485 )
      ( MAKE-8CRATE-VERIFY ?auto_450477 ?auto_450478 ?auto_450479 ?auto_450480 ?auto_450481 ?auto_450482 ?auto_450483 ?auto_450484 ?auto_450485 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_450570 - SURFACE
      ?auto_450571 - SURFACE
      ?auto_450572 - SURFACE
      ?auto_450573 - SURFACE
      ?auto_450574 - SURFACE
      ?auto_450575 - SURFACE
      ?auto_450576 - SURFACE
      ?auto_450577 - SURFACE
      ?auto_450578 - SURFACE
    )
    :vars
    (
      ?auto_450582 - HOIST
      ?auto_450580 - PLACE
      ?auto_450579 - PLACE
      ?auto_450581 - HOIST
      ?auto_450584 - SURFACE
      ?auto_450583 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_450582 ?auto_450580 ) ( IS-CRATE ?auto_450578 ) ( not ( = ?auto_450577 ?auto_450578 ) ) ( not ( = ?auto_450576 ?auto_450577 ) ) ( not ( = ?auto_450576 ?auto_450578 ) ) ( not ( = ?auto_450579 ?auto_450580 ) ) ( HOIST-AT ?auto_450581 ?auto_450579 ) ( not ( = ?auto_450582 ?auto_450581 ) ) ( AVAILABLE ?auto_450581 ) ( SURFACE-AT ?auto_450578 ?auto_450579 ) ( ON ?auto_450578 ?auto_450584 ) ( CLEAR ?auto_450578 ) ( not ( = ?auto_450577 ?auto_450584 ) ) ( not ( = ?auto_450578 ?auto_450584 ) ) ( not ( = ?auto_450576 ?auto_450584 ) ) ( TRUCK-AT ?auto_450583 ?auto_450580 ) ( SURFACE-AT ?auto_450576 ?auto_450580 ) ( CLEAR ?auto_450576 ) ( LIFTING ?auto_450582 ?auto_450577 ) ( IS-CRATE ?auto_450577 ) ( ON ?auto_450571 ?auto_450570 ) ( ON ?auto_450572 ?auto_450571 ) ( ON ?auto_450573 ?auto_450572 ) ( ON ?auto_450574 ?auto_450573 ) ( ON ?auto_450575 ?auto_450574 ) ( ON ?auto_450576 ?auto_450575 ) ( not ( = ?auto_450570 ?auto_450571 ) ) ( not ( = ?auto_450570 ?auto_450572 ) ) ( not ( = ?auto_450570 ?auto_450573 ) ) ( not ( = ?auto_450570 ?auto_450574 ) ) ( not ( = ?auto_450570 ?auto_450575 ) ) ( not ( = ?auto_450570 ?auto_450576 ) ) ( not ( = ?auto_450570 ?auto_450577 ) ) ( not ( = ?auto_450570 ?auto_450578 ) ) ( not ( = ?auto_450570 ?auto_450584 ) ) ( not ( = ?auto_450571 ?auto_450572 ) ) ( not ( = ?auto_450571 ?auto_450573 ) ) ( not ( = ?auto_450571 ?auto_450574 ) ) ( not ( = ?auto_450571 ?auto_450575 ) ) ( not ( = ?auto_450571 ?auto_450576 ) ) ( not ( = ?auto_450571 ?auto_450577 ) ) ( not ( = ?auto_450571 ?auto_450578 ) ) ( not ( = ?auto_450571 ?auto_450584 ) ) ( not ( = ?auto_450572 ?auto_450573 ) ) ( not ( = ?auto_450572 ?auto_450574 ) ) ( not ( = ?auto_450572 ?auto_450575 ) ) ( not ( = ?auto_450572 ?auto_450576 ) ) ( not ( = ?auto_450572 ?auto_450577 ) ) ( not ( = ?auto_450572 ?auto_450578 ) ) ( not ( = ?auto_450572 ?auto_450584 ) ) ( not ( = ?auto_450573 ?auto_450574 ) ) ( not ( = ?auto_450573 ?auto_450575 ) ) ( not ( = ?auto_450573 ?auto_450576 ) ) ( not ( = ?auto_450573 ?auto_450577 ) ) ( not ( = ?auto_450573 ?auto_450578 ) ) ( not ( = ?auto_450573 ?auto_450584 ) ) ( not ( = ?auto_450574 ?auto_450575 ) ) ( not ( = ?auto_450574 ?auto_450576 ) ) ( not ( = ?auto_450574 ?auto_450577 ) ) ( not ( = ?auto_450574 ?auto_450578 ) ) ( not ( = ?auto_450574 ?auto_450584 ) ) ( not ( = ?auto_450575 ?auto_450576 ) ) ( not ( = ?auto_450575 ?auto_450577 ) ) ( not ( = ?auto_450575 ?auto_450578 ) ) ( not ( = ?auto_450575 ?auto_450584 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_450576 ?auto_450577 ?auto_450578 )
      ( MAKE-8CRATE-VERIFY ?auto_450570 ?auto_450571 ?auto_450572 ?auto_450573 ?auto_450574 ?auto_450575 ?auto_450576 ?auto_450577 ?auto_450578 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_450663 - SURFACE
      ?auto_450664 - SURFACE
      ?auto_450665 - SURFACE
      ?auto_450666 - SURFACE
      ?auto_450667 - SURFACE
      ?auto_450668 - SURFACE
      ?auto_450669 - SURFACE
      ?auto_450670 - SURFACE
      ?auto_450671 - SURFACE
    )
    :vars
    (
      ?auto_450676 - HOIST
      ?auto_450675 - PLACE
      ?auto_450672 - PLACE
      ?auto_450674 - HOIST
      ?auto_450673 - SURFACE
      ?auto_450677 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_450676 ?auto_450675 ) ( IS-CRATE ?auto_450671 ) ( not ( = ?auto_450670 ?auto_450671 ) ) ( not ( = ?auto_450669 ?auto_450670 ) ) ( not ( = ?auto_450669 ?auto_450671 ) ) ( not ( = ?auto_450672 ?auto_450675 ) ) ( HOIST-AT ?auto_450674 ?auto_450672 ) ( not ( = ?auto_450676 ?auto_450674 ) ) ( AVAILABLE ?auto_450674 ) ( SURFACE-AT ?auto_450671 ?auto_450672 ) ( ON ?auto_450671 ?auto_450673 ) ( CLEAR ?auto_450671 ) ( not ( = ?auto_450670 ?auto_450673 ) ) ( not ( = ?auto_450671 ?auto_450673 ) ) ( not ( = ?auto_450669 ?auto_450673 ) ) ( TRUCK-AT ?auto_450677 ?auto_450675 ) ( SURFACE-AT ?auto_450669 ?auto_450675 ) ( CLEAR ?auto_450669 ) ( IS-CRATE ?auto_450670 ) ( AVAILABLE ?auto_450676 ) ( IN ?auto_450670 ?auto_450677 ) ( ON ?auto_450664 ?auto_450663 ) ( ON ?auto_450665 ?auto_450664 ) ( ON ?auto_450666 ?auto_450665 ) ( ON ?auto_450667 ?auto_450666 ) ( ON ?auto_450668 ?auto_450667 ) ( ON ?auto_450669 ?auto_450668 ) ( not ( = ?auto_450663 ?auto_450664 ) ) ( not ( = ?auto_450663 ?auto_450665 ) ) ( not ( = ?auto_450663 ?auto_450666 ) ) ( not ( = ?auto_450663 ?auto_450667 ) ) ( not ( = ?auto_450663 ?auto_450668 ) ) ( not ( = ?auto_450663 ?auto_450669 ) ) ( not ( = ?auto_450663 ?auto_450670 ) ) ( not ( = ?auto_450663 ?auto_450671 ) ) ( not ( = ?auto_450663 ?auto_450673 ) ) ( not ( = ?auto_450664 ?auto_450665 ) ) ( not ( = ?auto_450664 ?auto_450666 ) ) ( not ( = ?auto_450664 ?auto_450667 ) ) ( not ( = ?auto_450664 ?auto_450668 ) ) ( not ( = ?auto_450664 ?auto_450669 ) ) ( not ( = ?auto_450664 ?auto_450670 ) ) ( not ( = ?auto_450664 ?auto_450671 ) ) ( not ( = ?auto_450664 ?auto_450673 ) ) ( not ( = ?auto_450665 ?auto_450666 ) ) ( not ( = ?auto_450665 ?auto_450667 ) ) ( not ( = ?auto_450665 ?auto_450668 ) ) ( not ( = ?auto_450665 ?auto_450669 ) ) ( not ( = ?auto_450665 ?auto_450670 ) ) ( not ( = ?auto_450665 ?auto_450671 ) ) ( not ( = ?auto_450665 ?auto_450673 ) ) ( not ( = ?auto_450666 ?auto_450667 ) ) ( not ( = ?auto_450666 ?auto_450668 ) ) ( not ( = ?auto_450666 ?auto_450669 ) ) ( not ( = ?auto_450666 ?auto_450670 ) ) ( not ( = ?auto_450666 ?auto_450671 ) ) ( not ( = ?auto_450666 ?auto_450673 ) ) ( not ( = ?auto_450667 ?auto_450668 ) ) ( not ( = ?auto_450667 ?auto_450669 ) ) ( not ( = ?auto_450667 ?auto_450670 ) ) ( not ( = ?auto_450667 ?auto_450671 ) ) ( not ( = ?auto_450667 ?auto_450673 ) ) ( not ( = ?auto_450668 ?auto_450669 ) ) ( not ( = ?auto_450668 ?auto_450670 ) ) ( not ( = ?auto_450668 ?auto_450671 ) ) ( not ( = ?auto_450668 ?auto_450673 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_450669 ?auto_450670 ?auto_450671 )
      ( MAKE-8CRATE-VERIFY ?auto_450663 ?auto_450664 ?auto_450665 ?auto_450666 ?auto_450667 ?auto_450668 ?auto_450669 ?auto_450670 ?auto_450671 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_454779 - SURFACE
      ?auto_454780 - SURFACE
      ?auto_454781 - SURFACE
      ?auto_454782 - SURFACE
      ?auto_454783 - SURFACE
      ?auto_454784 - SURFACE
      ?auto_454785 - SURFACE
      ?auto_454786 - SURFACE
      ?auto_454787 - SURFACE
      ?auto_454788 - SURFACE
    )
    :vars
    (
      ?auto_454790 - HOIST
      ?auto_454789 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_454790 ?auto_454789 ) ( SURFACE-AT ?auto_454787 ?auto_454789 ) ( CLEAR ?auto_454787 ) ( LIFTING ?auto_454790 ?auto_454788 ) ( IS-CRATE ?auto_454788 ) ( not ( = ?auto_454787 ?auto_454788 ) ) ( ON ?auto_454780 ?auto_454779 ) ( ON ?auto_454781 ?auto_454780 ) ( ON ?auto_454782 ?auto_454781 ) ( ON ?auto_454783 ?auto_454782 ) ( ON ?auto_454784 ?auto_454783 ) ( ON ?auto_454785 ?auto_454784 ) ( ON ?auto_454786 ?auto_454785 ) ( ON ?auto_454787 ?auto_454786 ) ( not ( = ?auto_454779 ?auto_454780 ) ) ( not ( = ?auto_454779 ?auto_454781 ) ) ( not ( = ?auto_454779 ?auto_454782 ) ) ( not ( = ?auto_454779 ?auto_454783 ) ) ( not ( = ?auto_454779 ?auto_454784 ) ) ( not ( = ?auto_454779 ?auto_454785 ) ) ( not ( = ?auto_454779 ?auto_454786 ) ) ( not ( = ?auto_454779 ?auto_454787 ) ) ( not ( = ?auto_454779 ?auto_454788 ) ) ( not ( = ?auto_454780 ?auto_454781 ) ) ( not ( = ?auto_454780 ?auto_454782 ) ) ( not ( = ?auto_454780 ?auto_454783 ) ) ( not ( = ?auto_454780 ?auto_454784 ) ) ( not ( = ?auto_454780 ?auto_454785 ) ) ( not ( = ?auto_454780 ?auto_454786 ) ) ( not ( = ?auto_454780 ?auto_454787 ) ) ( not ( = ?auto_454780 ?auto_454788 ) ) ( not ( = ?auto_454781 ?auto_454782 ) ) ( not ( = ?auto_454781 ?auto_454783 ) ) ( not ( = ?auto_454781 ?auto_454784 ) ) ( not ( = ?auto_454781 ?auto_454785 ) ) ( not ( = ?auto_454781 ?auto_454786 ) ) ( not ( = ?auto_454781 ?auto_454787 ) ) ( not ( = ?auto_454781 ?auto_454788 ) ) ( not ( = ?auto_454782 ?auto_454783 ) ) ( not ( = ?auto_454782 ?auto_454784 ) ) ( not ( = ?auto_454782 ?auto_454785 ) ) ( not ( = ?auto_454782 ?auto_454786 ) ) ( not ( = ?auto_454782 ?auto_454787 ) ) ( not ( = ?auto_454782 ?auto_454788 ) ) ( not ( = ?auto_454783 ?auto_454784 ) ) ( not ( = ?auto_454783 ?auto_454785 ) ) ( not ( = ?auto_454783 ?auto_454786 ) ) ( not ( = ?auto_454783 ?auto_454787 ) ) ( not ( = ?auto_454783 ?auto_454788 ) ) ( not ( = ?auto_454784 ?auto_454785 ) ) ( not ( = ?auto_454784 ?auto_454786 ) ) ( not ( = ?auto_454784 ?auto_454787 ) ) ( not ( = ?auto_454784 ?auto_454788 ) ) ( not ( = ?auto_454785 ?auto_454786 ) ) ( not ( = ?auto_454785 ?auto_454787 ) ) ( not ( = ?auto_454785 ?auto_454788 ) ) ( not ( = ?auto_454786 ?auto_454787 ) ) ( not ( = ?auto_454786 ?auto_454788 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_454787 ?auto_454788 )
      ( MAKE-9CRATE-VERIFY ?auto_454779 ?auto_454780 ?auto_454781 ?auto_454782 ?auto_454783 ?auto_454784 ?auto_454785 ?auto_454786 ?auto_454787 ?auto_454788 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_454859 - SURFACE
      ?auto_454860 - SURFACE
      ?auto_454861 - SURFACE
      ?auto_454862 - SURFACE
      ?auto_454863 - SURFACE
      ?auto_454864 - SURFACE
      ?auto_454865 - SURFACE
      ?auto_454866 - SURFACE
      ?auto_454867 - SURFACE
      ?auto_454868 - SURFACE
    )
    :vars
    (
      ?auto_454871 - HOIST
      ?auto_454870 - PLACE
      ?auto_454869 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_454871 ?auto_454870 ) ( SURFACE-AT ?auto_454867 ?auto_454870 ) ( CLEAR ?auto_454867 ) ( IS-CRATE ?auto_454868 ) ( not ( = ?auto_454867 ?auto_454868 ) ) ( TRUCK-AT ?auto_454869 ?auto_454870 ) ( AVAILABLE ?auto_454871 ) ( IN ?auto_454868 ?auto_454869 ) ( ON ?auto_454867 ?auto_454866 ) ( not ( = ?auto_454866 ?auto_454867 ) ) ( not ( = ?auto_454866 ?auto_454868 ) ) ( ON ?auto_454860 ?auto_454859 ) ( ON ?auto_454861 ?auto_454860 ) ( ON ?auto_454862 ?auto_454861 ) ( ON ?auto_454863 ?auto_454862 ) ( ON ?auto_454864 ?auto_454863 ) ( ON ?auto_454865 ?auto_454864 ) ( ON ?auto_454866 ?auto_454865 ) ( not ( = ?auto_454859 ?auto_454860 ) ) ( not ( = ?auto_454859 ?auto_454861 ) ) ( not ( = ?auto_454859 ?auto_454862 ) ) ( not ( = ?auto_454859 ?auto_454863 ) ) ( not ( = ?auto_454859 ?auto_454864 ) ) ( not ( = ?auto_454859 ?auto_454865 ) ) ( not ( = ?auto_454859 ?auto_454866 ) ) ( not ( = ?auto_454859 ?auto_454867 ) ) ( not ( = ?auto_454859 ?auto_454868 ) ) ( not ( = ?auto_454860 ?auto_454861 ) ) ( not ( = ?auto_454860 ?auto_454862 ) ) ( not ( = ?auto_454860 ?auto_454863 ) ) ( not ( = ?auto_454860 ?auto_454864 ) ) ( not ( = ?auto_454860 ?auto_454865 ) ) ( not ( = ?auto_454860 ?auto_454866 ) ) ( not ( = ?auto_454860 ?auto_454867 ) ) ( not ( = ?auto_454860 ?auto_454868 ) ) ( not ( = ?auto_454861 ?auto_454862 ) ) ( not ( = ?auto_454861 ?auto_454863 ) ) ( not ( = ?auto_454861 ?auto_454864 ) ) ( not ( = ?auto_454861 ?auto_454865 ) ) ( not ( = ?auto_454861 ?auto_454866 ) ) ( not ( = ?auto_454861 ?auto_454867 ) ) ( not ( = ?auto_454861 ?auto_454868 ) ) ( not ( = ?auto_454862 ?auto_454863 ) ) ( not ( = ?auto_454862 ?auto_454864 ) ) ( not ( = ?auto_454862 ?auto_454865 ) ) ( not ( = ?auto_454862 ?auto_454866 ) ) ( not ( = ?auto_454862 ?auto_454867 ) ) ( not ( = ?auto_454862 ?auto_454868 ) ) ( not ( = ?auto_454863 ?auto_454864 ) ) ( not ( = ?auto_454863 ?auto_454865 ) ) ( not ( = ?auto_454863 ?auto_454866 ) ) ( not ( = ?auto_454863 ?auto_454867 ) ) ( not ( = ?auto_454863 ?auto_454868 ) ) ( not ( = ?auto_454864 ?auto_454865 ) ) ( not ( = ?auto_454864 ?auto_454866 ) ) ( not ( = ?auto_454864 ?auto_454867 ) ) ( not ( = ?auto_454864 ?auto_454868 ) ) ( not ( = ?auto_454865 ?auto_454866 ) ) ( not ( = ?auto_454865 ?auto_454867 ) ) ( not ( = ?auto_454865 ?auto_454868 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_454866 ?auto_454867 ?auto_454868 )
      ( MAKE-9CRATE-VERIFY ?auto_454859 ?auto_454860 ?auto_454861 ?auto_454862 ?auto_454863 ?auto_454864 ?auto_454865 ?auto_454866 ?auto_454867 ?auto_454868 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_454949 - SURFACE
      ?auto_454950 - SURFACE
      ?auto_454951 - SURFACE
      ?auto_454952 - SURFACE
      ?auto_454953 - SURFACE
      ?auto_454954 - SURFACE
      ?auto_454955 - SURFACE
      ?auto_454956 - SURFACE
      ?auto_454957 - SURFACE
      ?auto_454958 - SURFACE
    )
    :vars
    (
      ?auto_454961 - HOIST
      ?auto_454959 - PLACE
      ?auto_454960 - TRUCK
      ?auto_454962 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_454961 ?auto_454959 ) ( SURFACE-AT ?auto_454957 ?auto_454959 ) ( CLEAR ?auto_454957 ) ( IS-CRATE ?auto_454958 ) ( not ( = ?auto_454957 ?auto_454958 ) ) ( AVAILABLE ?auto_454961 ) ( IN ?auto_454958 ?auto_454960 ) ( ON ?auto_454957 ?auto_454956 ) ( not ( = ?auto_454956 ?auto_454957 ) ) ( not ( = ?auto_454956 ?auto_454958 ) ) ( TRUCK-AT ?auto_454960 ?auto_454962 ) ( not ( = ?auto_454962 ?auto_454959 ) ) ( ON ?auto_454950 ?auto_454949 ) ( ON ?auto_454951 ?auto_454950 ) ( ON ?auto_454952 ?auto_454951 ) ( ON ?auto_454953 ?auto_454952 ) ( ON ?auto_454954 ?auto_454953 ) ( ON ?auto_454955 ?auto_454954 ) ( ON ?auto_454956 ?auto_454955 ) ( not ( = ?auto_454949 ?auto_454950 ) ) ( not ( = ?auto_454949 ?auto_454951 ) ) ( not ( = ?auto_454949 ?auto_454952 ) ) ( not ( = ?auto_454949 ?auto_454953 ) ) ( not ( = ?auto_454949 ?auto_454954 ) ) ( not ( = ?auto_454949 ?auto_454955 ) ) ( not ( = ?auto_454949 ?auto_454956 ) ) ( not ( = ?auto_454949 ?auto_454957 ) ) ( not ( = ?auto_454949 ?auto_454958 ) ) ( not ( = ?auto_454950 ?auto_454951 ) ) ( not ( = ?auto_454950 ?auto_454952 ) ) ( not ( = ?auto_454950 ?auto_454953 ) ) ( not ( = ?auto_454950 ?auto_454954 ) ) ( not ( = ?auto_454950 ?auto_454955 ) ) ( not ( = ?auto_454950 ?auto_454956 ) ) ( not ( = ?auto_454950 ?auto_454957 ) ) ( not ( = ?auto_454950 ?auto_454958 ) ) ( not ( = ?auto_454951 ?auto_454952 ) ) ( not ( = ?auto_454951 ?auto_454953 ) ) ( not ( = ?auto_454951 ?auto_454954 ) ) ( not ( = ?auto_454951 ?auto_454955 ) ) ( not ( = ?auto_454951 ?auto_454956 ) ) ( not ( = ?auto_454951 ?auto_454957 ) ) ( not ( = ?auto_454951 ?auto_454958 ) ) ( not ( = ?auto_454952 ?auto_454953 ) ) ( not ( = ?auto_454952 ?auto_454954 ) ) ( not ( = ?auto_454952 ?auto_454955 ) ) ( not ( = ?auto_454952 ?auto_454956 ) ) ( not ( = ?auto_454952 ?auto_454957 ) ) ( not ( = ?auto_454952 ?auto_454958 ) ) ( not ( = ?auto_454953 ?auto_454954 ) ) ( not ( = ?auto_454953 ?auto_454955 ) ) ( not ( = ?auto_454953 ?auto_454956 ) ) ( not ( = ?auto_454953 ?auto_454957 ) ) ( not ( = ?auto_454953 ?auto_454958 ) ) ( not ( = ?auto_454954 ?auto_454955 ) ) ( not ( = ?auto_454954 ?auto_454956 ) ) ( not ( = ?auto_454954 ?auto_454957 ) ) ( not ( = ?auto_454954 ?auto_454958 ) ) ( not ( = ?auto_454955 ?auto_454956 ) ) ( not ( = ?auto_454955 ?auto_454957 ) ) ( not ( = ?auto_454955 ?auto_454958 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_454956 ?auto_454957 ?auto_454958 )
      ( MAKE-9CRATE-VERIFY ?auto_454949 ?auto_454950 ?auto_454951 ?auto_454952 ?auto_454953 ?auto_454954 ?auto_454955 ?auto_454956 ?auto_454957 ?auto_454958 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_455048 - SURFACE
      ?auto_455049 - SURFACE
      ?auto_455050 - SURFACE
      ?auto_455051 - SURFACE
      ?auto_455052 - SURFACE
      ?auto_455053 - SURFACE
      ?auto_455054 - SURFACE
      ?auto_455055 - SURFACE
      ?auto_455056 - SURFACE
      ?auto_455057 - SURFACE
    )
    :vars
    (
      ?auto_455061 - HOIST
      ?auto_455058 - PLACE
      ?auto_455062 - TRUCK
      ?auto_455060 - PLACE
      ?auto_455059 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_455061 ?auto_455058 ) ( SURFACE-AT ?auto_455056 ?auto_455058 ) ( CLEAR ?auto_455056 ) ( IS-CRATE ?auto_455057 ) ( not ( = ?auto_455056 ?auto_455057 ) ) ( AVAILABLE ?auto_455061 ) ( ON ?auto_455056 ?auto_455055 ) ( not ( = ?auto_455055 ?auto_455056 ) ) ( not ( = ?auto_455055 ?auto_455057 ) ) ( TRUCK-AT ?auto_455062 ?auto_455060 ) ( not ( = ?auto_455060 ?auto_455058 ) ) ( HOIST-AT ?auto_455059 ?auto_455060 ) ( LIFTING ?auto_455059 ?auto_455057 ) ( not ( = ?auto_455061 ?auto_455059 ) ) ( ON ?auto_455049 ?auto_455048 ) ( ON ?auto_455050 ?auto_455049 ) ( ON ?auto_455051 ?auto_455050 ) ( ON ?auto_455052 ?auto_455051 ) ( ON ?auto_455053 ?auto_455052 ) ( ON ?auto_455054 ?auto_455053 ) ( ON ?auto_455055 ?auto_455054 ) ( not ( = ?auto_455048 ?auto_455049 ) ) ( not ( = ?auto_455048 ?auto_455050 ) ) ( not ( = ?auto_455048 ?auto_455051 ) ) ( not ( = ?auto_455048 ?auto_455052 ) ) ( not ( = ?auto_455048 ?auto_455053 ) ) ( not ( = ?auto_455048 ?auto_455054 ) ) ( not ( = ?auto_455048 ?auto_455055 ) ) ( not ( = ?auto_455048 ?auto_455056 ) ) ( not ( = ?auto_455048 ?auto_455057 ) ) ( not ( = ?auto_455049 ?auto_455050 ) ) ( not ( = ?auto_455049 ?auto_455051 ) ) ( not ( = ?auto_455049 ?auto_455052 ) ) ( not ( = ?auto_455049 ?auto_455053 ) ) ( not ( = ?auto_455049 ?auto_455054 ) ) ( not ( = ?auto_455049 ?auto_455055 ) ) ( not ( = ?auto_455049 ?auto_455056 ) ) ( not ( = ?auto_455049 ?auto_455057 ) ) ( not ( = ?auto_455050 ?auto_455051 ) ) ( not ( = ?auto_455050 ?auto_455052 ) ) ( not ( = ?auto_455050 ?auto_455053 ) ) ( not ( = ?auto_455050 ?auto_455054 ) ) ( not ( = ?auto_455050 ?auto_455055 ) ) ( not ( = ?auto_455050 ?auto_455056 ) ) ( not ( = ?auto_455050 ?auto_455057 ) ) ( not ( = ?auto_455051 ?auto_455052 ) ) ( not ( = ?auto_455051 ?auto_455053 ) ) ( not ( = ?auto_455051 ?auto_455054 ) ) ( not ( = ?auto_455051 ?auto_455055 ) ) ( not ( = ?auto_455051 ?auto_455056 ) ) ( not ( = ?auto_455051 ?auto_455057 ) ) ( not ( = ?auto_455052 ?auto_455053 ) ) ( not ( = ?auto_455052 ?auto_455054 ) ) ( not ( = ?auto_455052 ?auto_455055 ) ) ( not ( = ?auto_455052 ?auto_455056 ) ) ( not ( = ?auto_455052 ?auto_455057 ) ) ( not ( = ?auto_455053 ?auto_455054 ) ) ( not ( = ?auto_455053 ?auto_455055 ) ) ( not ( = ?auto_455053 ?auto_455056 ) ) ( not ( = ?auto_455053 ?auto_455057 ) ) ( not ( = ?auto_455054 ?auto_455055 ) ) ( not ( = ?auto_455054 ?auto_455056 ) ) ( not ( = ?auto_455054 ?auto_455057 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_455055 ?auto_455056 ?auto_455057 )
      ( MAKE-9CRATE-VERIFY ?auto_455048 ?auto_455049 ?auto_455050 ?auto_455051 ?auto_455052 ?auto_455053 ?auto_455054 ?auto_455055 ?auto_455056 ?auto_455057 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_455156 - SURFACE
      ?auto_455157 - SURFACE
      ?auto_455158 - SURFACE
      ?auto_455159 - SURFACE
      ?auto_455160 - SURFACE
      ?auto_455161 - SURFACE
      ?auto_455162 - SURFACE
      ?auto_455163 - SURFACE
      ?auto_455164 - SURFACE
      ?auto_455165 - SURFACE
    )
    :vars
    (
      ?auto_455169 - HOIST
      ?auto_455171 - PLACE
      ?auto_455166 - TRUCK
      ?auto_455167 - PLACE
      ?auto_455170 - HOIST
      ?auto_455168 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_455169 ?auto_455171 ) ( SURFACE-AT ?auto_455164 ?auto_455171 ) ( CLEAR ?auto_455164 ) ( IS-CRATE ?auto_455165 ) ( not ( = ?auto_455164 ?auto_455165 ) ) ( AVAILABLE ?auto_455169 ) ( ON ?auto_455164 ?auto_455163 ) ( not ( = ?auto_455163 ?auto_455164 ) ) ( not ( = ?auto_455163 ?auto_455165 ) ) ( TRUCK-AT ?auto_455166 ?auto_455167 ) ( not ( = ?auto_455167 ?auto_455171 ) ) ( HOIST-AT ?auto_455170 ?auto_455167 ) ( not ( = ?auto_455169 ?auto_455170 ) ) ( AVAILABLE ?auto_455170 ) ( SURFACE-AT ?auto_455165 ?auto_455167 ) ( ON ?auto_455165 ?auto_455168 ) ( CLEAR ?auto_455165 ) ( not ( = ?auto_455164 ?auto_455168 ) ) ( not ( = ?auto_455165 ?auto_455168 ) ) ( not ( = ?auto_455163 ?auto_455168 ) ) ( ON ?auto_455157 ?auto_455156 ) ( ON ?auto_455158 ?auto_455157 ) ( ON ?auto_455159 ?auto_455158 ) ( ON ?auto_455160 ?auto_455159 ) ( ON ?auto_455161 ?auto_455160 ) ( ON ?auto_455162 ?auto_455161 ) ( ON ?auto_455163 ?auto_455162 ) ( not ( = ?auto_455156 ?auto_455157 ) ) ( not ( = ?auto_455156 ?auto_455158 ) ) ( not ( = ?auto_455156 ?auto_455159 ) ) ( not ( = ?auto_455156 ?auto_455160 ) ) ( not ( = ?auto_455156 ?auto_455161 ) ) ( not ( = ?auto_455156 ?auto_455162 ) ) ( not ( = ?auto_455156 ?auto_455163 ) ) ( not ( = ?auto_455156 ?auto_455164 ) ) ( not ( = ?auto_455156 ?auto_455165 ) ) ( not ( = ?auto_455156 ?auto_455168 ) ) ( not ( = ?auto_455157 ?auto_455158 ) ) ( not ( = ?auto_455157 ?auto_455159 ) ) ( not ( = ?auto_455157 ?auto_455160 ) ) ( not ( = ?auto_455157 ?auto_455161 ) ) ( not ( = ?auto_455157 ?auto_455162 ) ) ( not ( = ?auto_455157 ?auto_455163 ) ) ( not ( = ?auto_455157 ?auto_455164 ) ) ( not ( = ?auto_455157 ?auto_455165 ) ) ( not ( = ?auto_455157 ?auto_455168 ) ) ( not ( = ?auto_455158 ?auto_455159 ) ) ( not ( = ?auto_455158 ?auto_455160 ) ) ( not ( = ?auto_455158 ?auto_455161 ) ) ( not ( = ?auto_455158 ?auto_455162 ) ) ( not ( = ?auto_455158 ?auto_455163 ) ) ( not ( = ?auto_455158 ?auto_455164 ) ) ( not ( = ?auto_455158 ?auto_455165 ) ) ( not ( = ?auto_455158 ?auto_455168 ) ) ( not ( = ?auto_455159 ?auto_455160 ) ) ( not ( = ?auto_455159 ?auto_455161 ) ) ( not ( = ?auto_455159 ?auto_455162 ) ) ( not ( = ?auto_455159 ?auto_455163 ) ) ( not ( = ?auto_455159 ?auto_455164 ) ) ( not ( = ?auto_455159 ?auto_455165 ) ) ( not ( = ?auto_455159 ?auto_455168 ) ) ( not ( = ?auto_455160 ?auto_455161 ) ) ( not ( = ?auto_455160 ?auto_455162 ) ) ( not ( = ?auto_455160 ?auto_455163 ) ) ( not ( = ?auto_455160 ?auto_455164 ) ) ( not ( = ?auto_455160 ?auto_455165 ) ) ( not ( = ?auto_455160 ?auto_455168 ) ) ( not ( = ?auto_455161 ?auto_455162 ) ) ( not ( = ?auto_455161 ?auto_455163 ) ) ( not ( = ?auto_455161 ?auto_455164 ) ) ( not ( = ?auto_455161 ?auto_455165 ) ) ( not ( = ?auto_455161 ?auto_455168 ) ) ( not ( = ?auto_455162 ?auto_455163 ) ) ( not ( = ?auto_455162 ?auto_455164 ) ) ( not ( = ?auto_455162 ?auto_455165 ) ) ( not ( = ?auto_455162 ?auto_455168 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_455163 ?auto_455164 ?auto_455165 )
      ( MAKE-9CRATE-VERIFY ?auto_455156 ?auto_455157 ?auto_455158 ?auto_455159 ?auto_455160 ?auto_455161 ?auto_455162 ?auto_455163 ?auto_455164 ?auto_455165 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_455265 - SURFACE
      ?auto_455266 - SURFACE
      ?auto_455267 - SURFACE
      ?auto_455268 - SURFACE
      ?auto_455269 - SURFACE
      ?auto_455270 - SURFACE
      ?auto_455271 - SURFACE
      ?auto_455272 - SURFACE
      ?auto_455273 - SURFACE
      ?auto_455274 - SURFACE
    )
    :vars
    (
      ?auto_455279 - HOIST
      ?auto_455276 - PLACE
      ?auto_455280 - PLACE
      ?auto_455275 - HOIST
      ?auto_455278 - SURFACE
      ?auto_455277 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_455279 ?auto_455276 ) ( SURFACE-AT ?auto_455273 ?auto_455276 ) ( CLEAR ?auto_455273 ) ( IS-CRATE ?auto_455274 ) ( not ( = ?auto_455273 ?auto_455274 ) ) ( AVAILABLE ?auto_455279 ) ( ON ?auto_455273 ?auto_455272 ) ( not ( = ?auto_455272 ?auto_455273 ) ) ( not ( = ?auto_455272 ?auto_455274 ) ) ( not ( = ?auto_455280 ?auto_455276 ) ) ( HOIST-AT ?auto_455275 ?auto_455280 ) ( not ( = ?auto_455279 ?auto_455275 ) ) ( AVAILABLE ?auto_455275 ) ( SURFACE-AT ?auto_455274 ?auto_455280 ) ( ON ?auto_455274 ?auto_455278 ) ( CLEAR ?auto_455274 ) ( not ( = ?auto_455273 ?auto_455278 ) ) ( not ( = ?auto_455274 ?auto_455278 ) ) ( not ( = ?auto_455272 ?auto_455278 ) ) ( TRUCK-AT ?auto_455277 ?auto_455276 ) ( ON ?auto_455266 ?auto_455265 ) ( ON ?auto_455267 ?auto_455266 ) ( ON ?auto_455268 ?auto_455267 ) ( ON ?auto_455269 ?auto_455268 ) ( ON ?auto_455270 ?auto_455269 ) ( ON ?auto_455271 ?auto_455270 ) ( ON ?auto_455272 ?auto_455271 ) ( not ( = ?auto_455265 ?auto_455266 ) ) ( not ( = ?auto_455265 ?auto_455267 ) ) ( not ( = ?auto_455265 ?auto_455268 ) ) ( not ( = ?auto_455265 ?auto_455269 ) ) ( not ( = ?auto_455265 ?auto_455270 ) ) ( not ( = ?auto_455265 ?auto_455271 ) ) ( not ( = ?auto_455265 ?auto_455272 ) ) ( not ( = ?auto_455265 ?auto_455273 ) ) ( not ( = ?auto_455265 ?auto_455274 ) ) ( not ( = ?auto_455265 ?auto_455278 ) ) ( not ( = ?auto_455266 ?auto_455267 ) ) ( not ( = ?auto_455266 ?auto_455268 ) ) ( not ( = ?auto_455266 ?auto_455269 ) ) ( not ( = ?auto_455266 ?auto_455270 ) ) ( not ( = ?auto_455266 ?auto_455271 ) ) ( not ( = ?auto_455266 ?auto_455272 ) ) ( not ( = ?auto_455266 ?auto_455273 ) ) ( not ( = ?auto_455266 ?auto_455274 ) ) ( not ( = ?auto_455266 ?auto_455278 ) ) ( not ( = ?auto_455267 ?auto_455268 ) ) ( not ( = ?auto_455267 ?auto_455269 ) ) ( not ( = ?auto_455267 ?auto_455270 ) ) ( not ( = ?auto_455267 ?auto_455271 ) ) ( not ( = ?auto_455267 ?auto_455272 ) ) ( not ( = ?auto_455267 ?auto_455273 ) ) ( not ( = ?auto_455267 ?auto_455274 ) ) ( not ( = ?auto_455267 ?auto_455278 ) ) ( not ( = ?auto_455268 ?auto_455269 ) ) ( not ( = ?auto_455268 ?auto_455270 ) ) ( not ( = ?auto_455268 ?auto_455271 ) ) ( not ( = ?auto_455268 ?auto_455272 ) ) ( not ( = ?auto_455268 ?auto_455273 ) ) ( not ( = ?auto_455268 ?auto_455274 ) ) ( not ( = ?auto_455268 ?auto_455278 ) ) ( not ( = ?auto_455269 ?auto_455270 ) ) ( not ( = ?auto_455269 ?auto_455271 ) ) ( not ( = ?auto_455269 ?auto_455272 ) ) ( not ( = ?auto_455269 ?auto_455273 ) ) ( not ( = ?auto_455269 ?auto_455274 ) ) ( not ( = ?auto_455269 ?auto_455278 ) ) ( not ( = ?auto_455270 ?auto_455271 ) ) ( not ( = ?auto_455270 ?auto_455272 ) ) ( not ( = ?auto_455270 ?auto_455273 ) ) ( not ( = ?auto_455270 ?auto_455274 ) ) ( not ( = ?auto_455270 ?auto_455278 ) ) ( not ( = ?auto_455271 ?auto_455272 ) ) ( not ( = ?auto_455271 ?auto_455273 ) ) ( not ( = ?auto_455271 ?auto_455274 ) ) ( not ( = ?auto_455271 ?auto_455278 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_455272 ?auto_455273 ?auto_455274 )
      ( MAKE-9CRATE-VERIFY ?auto_455265 ?auto_455266 ?auto_455267 ?auto_455268 ?auto_455269 ?auto_455270 ?auto_455271 ?auto_455272 ?auto_455273 ?auto_455274 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_455374 - SURFACE
      ?auto_455375 - SURFACE
      ?auto_455376 - SURFACE
      ?auto_455377 - SURFACE
      ?auto_455378 - SURFACE
      ?auto_455379 - SURFACE
      ?auto_455380 - SURFACE
      ?auto_455381 - SURFACE
      ?auto_455382 - SURFACE
      ?auto_455383 - SURFACE
    )
    :vars
    (
      ?auto_455387 - HOIST
      ?auto_455388 - PLACE
      ?auto_455386 - PLACE
      ?auto_455385 - HOIST
      ?auto_455389 - SURFACE
      ?auto_455384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_455387 ?auto_455388 ) ( IS-CRATE ?auto_455383 ) ( not ( = ?auto_455382 ?auto_455383 ) ) ( not ( = ?auto_455381 ?auto_455382 ) ) ( not ( = ?auto_455381 ?auto_455383 ) ) ( not ( = ?auto_455386 ?auto_455388 ) ) ( HOIST-AT ?auto_455385 ?auto_455386 ) ( not ( = ?auto_455387 ?auto_455385 ) ) ( AVAILABLE ?auto_455385 ) ( SURFACE-AT ?auto_455383 ?auto_455386 ) ( ON ?auto_455383 ?auto_455389 ) ( CLEAR ?auto_455383 ) ( not ( = ?auto_455382 ?auto_455389 ) ) ( not ( = ?auto_455383 ?auto_455389 ) ) ( not ( = ?auto_455381 ?auto_455389 ) ) ( TRUCK-AT ?auto_455384 ?auto_455388 ) ( SURFACE-AT ?auto_455381 ?auto_455388 ) ( CLEAR ?auto_455381 ) ( LIFTING ?auto_455387 ?auto_455382 ) ( IS-CRATE ?auto_455382 ) ( ON ?auto_455375 ?auto_455374 ) ( ON ?auto_455376 ?auto_455375 ) ( ON ?auto_455377 ?auto_455376 ) ( ON ?auto_455378 ?auto_455377 ) ( ON ?auto_455379 ?auto_455378 ) ( ON ?auto_455380 ?auto_455379 ) ( ON ?auto_455381 ?auto_455380 ) ( not ( = ?auto_455374 ?auto_455375 ) ) ( not ( = ?auto_455374 ?auto_455376 ) ) ( not ( = ?auto_455374 ?auto_455377 ) ) ( not ( = ?auto_455374 ?auto_455378 ) ) ( not ( = ?auto_455374 ?auto_455379 ) ) ( not ( = ?auto_455374 ?auto_455380 ) ) ( not ( = ?auto_455374 ?auto_455381 ) ) ( not ( = ?auto_455374 ?auto_455382 ) ) ( not ( = ?auto_455374 ?auto_455383 ) ) ( not ( = ?auto_455374 ?auto_455389 ) ) ( not ( = ?auto_455375 ?auto_455376 ) ) ( not ( = ?auto_455375 ?auto_455377 ) ) ( not ( = ?auto_455375 ?auto_455378 ) ) ( not ( = ?auto_455375 ?auto_455379 ) ) ( not ( = ?auto_455375 ?auto_455380 ) ) ( not ( = ?auto_455375 ?auto_455381 ) ) ( not ( = ?auto_455375 ?auto_455382 ) ) ( not ( = ?auto_455375 ?auto_455383 ) ) ( not ( = ?auto_455375 ?auto_455389 ) ) ( not ( = ?auto_455376 ?auto_455377 ) ) ( not ( = ?auto_455376 ?auto_455378 ) ) ( not ( = ?auto_455376 ?auto_455379 ) ) ( not ( = ?auto_455376 ?auto_455380 ) ) ( not ( = ?auto_455376 ?auto_455381 ) ) ( not ( = ?auto_455376 ?auto_455382 ) ) ( not ( = ?auto_455376 ?auto_455383 ) ) ( not ( = ?auto_455376 ?auto_455389 ) ) ( not ( = ?auto_455377 ?auto_455378 ) ) ( not ( = ?auto_455377 ?auto_455379 ) ) ( not ( = ?auto_455377 ?auto_455380 ) ) ( not ( = ?auto_455377 ?auto_455381 ) ) ( not ( = ?auto_455377 ?auto_455382 ) ) ( not ( = ?auto_455377 ?auto_455383 ) ) ( not ( = ?auto_455377 ?auto_455389 ) ) ( not ( = ?auto_455378 ?auto_455379 ) ) ( not ( = ?auto_455378 ?auto_455380 ) ) ( not ( = ?auto_455378 ?auto_455381 ) ) ( not ( = ?auto_455378 ?auto_455382 ) ) ( not ( = ?auto_455378 ?auto_455383 ) ) ( not ( = ?auto_455378 ?auto_455389 ) ) ( not ( = ?auto_455379 ?auto_455380 ) ) ( not ( = ?auto_455379 ?auto_455381 ) ) ( not ( = ?auto_455379 ?auto_455382 ) ) ( not ( = ?auto_455379 ?auto_455383 ) ) ( not ( = ?auto_455379 ?auto_455389 ) ) ( not ( = ?auto_455380 ?auto_455381 ) ) ( not ( = ?auto_455380 ?auto_455382 ) ) ( not ( = ?auto_455380 ?auto_455383 ) ) ( not ( = ?auto_455380 ?auto_455389 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_455381 ?auto_455382 ?auto_455383 )
      ( MAKE-9CRATE-VERIFY ?auto_455374 ?auto_455375 ?auto_455376 ?auto_455377 ?auto_455378 ?auto_455379 ?auto_455380 ?auto_455381 ?auto_455382 ?auto_455383 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_455483 - SURFACE
      ?auto_455484 - SURFACE
      ?auto_455485 - SURFACE
      ?auto_455486 - SURFACE
      ?auto_455487 - SURFACE
      ?auto_455488 - SURFACE
      ?auto_455489 - SURFACE
      ?auto_455490 - SURFACE
      ?auto_455491 - SURFACE
      ?auto_455492 - SURFACE
    )
    :vars
    (
      ?auto_455493 - HOIST
      ?auto_455497 - PLACE
      ?auto_455496 - PLACE
      ?auto_455498 - HOIST
      ?auto_455494 - SURFACE
      ?auto_455495 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_455493 ?auto_455497 ) ( IS-CRATE ?auto_455492 ) ( not ( = ?auto_455491 ?auto_455492 ) ) ( not ( = ?auto_455490 ?auto_455491 ) ) ( not ( = ?auto_455490 ?auto_455492 ) ) ( not ( = ?auto_455496 ?auto_455497 ) ) ( HOIST-AT ?auto_455498 ?auto_455496 ) ( not ( = ?auto_455493 ?auto_455498 ) ) ( AVAILABLE ?auto_455498 ) ( SURFACE-AT ?auto_455492 ?auto_455496 ) ( ON ?auto_455492 ?auto_455494 ) ( CLEAR ?auto_455492 ) ( not ( = ?auto_455491 ?auto_455494 ) ) ( not ( = ?auto_455492 ?auto_455494 ) ) ( not ( = ?auto_455490 ?auto_455494 ) ) ( TRUCK-AT ?auto_455495 ?auto_455497 ) ( SURFACE-AT ?auto_455490 ?auto_455497 ) ( CLEAR ?auto_455490 ) ( IS-CRATE ?auto_455491 ) ( AVAILABLE ?auto_455493 ) ( IN ?auto_455491 ?auto_455495 ) ( ON ?auto_455484 ?auto_455483 ) ( ON ?auto_455485 ?auto_455484 ) ( ON ?auto_455486 ?auto_455485 ) ( ON ?auto_455487 ?auto_455486 ) ( ON ?auto_455488 ?auto_455487 ) ( ON ?auto_455489 ?auto_455488 ) ( ON ?auto_455490 ?auto_455489 ) ( not ( = ?auto_455483 ?auto_455484 ) ) ( not ( = ?auto_455483 ?auto_455485 ) ) ( not ( = ?auto_455483 ?auto_455486 ) ) ( not ( = ?auto_455483 ?auto_455487 ) ) ( not ( = ?auto_455483 ?auto_455488 ) ) ( not ( = ?auto_455483 ?auto_455489 ) ) ( not ( = ?auto_455483 ?auto_455490 ) ) ( not ( = ?auto_455483 ?auto_455491 ) ) ( not ( = ?auto_455483 ?auto_455492 ) ) ( not ( = ?auto_455483 ?auto_455494 ) ) ( not ( = ?auto_455484 ?auto_455485 ) ) ( not ( = ?auto_455484 ?auto_455486 ) ) ( not ( = ?auto_455484 ?auto_455487 ) ) ( not ( = ?auto_455484 ?auto_455488 ) ) ( not ( = ?auto_455484 ?auto_455489 ) ) ( not ( = ?auto_455484 ?auto_455490 ) ) ( not ( = ?auto_455484 ?auto_455491 ) ) ( not ( = ?auto_455484 ?auto_455492 ) ) ( not ( = ?auto_455484 ?auto_455494 ) ) ( not ( = ?auto_455485 ?auto_455486 ) ) ( not ( = ?auto_455485 ?auto_455487 ) ) ( not ( = ?auto_455485 ?auto_455488 ) ) ( not ( = ?auto_455485 ?auto_455489 ) ) ( not ( = ?auto_455485 ?auto_455490 ) ) ( not ( = ?auto_455485 ?auto_455491 ) ) ( not ( = ?auto_455485 ?auto_455492 ) ) ( not ( = ?auto_455485 ?auto_455494 ) ) ( not ( = ?auto_455486 ?auto_455487 ) ) ( not ( = ?auto_455486 ?auto_455488 ) ) ( not ( = ?auto_455486 ?auto_455489 ) ) ( not ( = ?auto_455486 ?auto_455490 ) ) ( not ( = ?auto_455486 ?auto_455491 ) ) ( not ( = ?auto_455486 ?auto_455492 ) ) ( not ( = ?auto_455486 ?auto_455494 ) ) ( not ( = ?auto_455487 ?auto_455488 ) ) ( not ( = ?auto_455487 ?auto_455489 ) ) ( not ( = ?auto_455487 ?auto_455490 ) ) ( not ( = ?auto_455487 ?auto_455491 ) ) ( not ( = ?auto_455487 ?auto_455492 ) ) ( not ( = ?auto_455487 ?auto_455494 ) ) ( not ( = ?auto_455488 ?auto_455489 ) ) ( not ( = ?auto_455488 ?auto_455490 ) ) ( not ( = ?auto_455488 ?auto_455491 ) ) ( not ( = ?auto_455488 ?auto_455492 ) ) ( not ( = ?auto_455488 ?auto_455494 ) ) ( not ( = ?auto_455489 ?auto_455490 ) ) ( not ( = ?auto_455489 ?auto_455491 ) ) ( not ( = ?auto_455489 ?auto_455492 ) ) ( not ( = ?auto_455489 ?auto_455494 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_455490 ?auto_455491 ?auto_455492 )
      ( MAKE-9CRATE-VERIFY ?auto_455483 ?auto_455484 ?auto_455485 ?auto_455486 ?auto_455487 ?auto_455488 ?auto_455489 ?auto_455490 ?auto_455491 ?auto_455492 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_461048 - SURFACE
      ?auto_461049 - SURFACE
      ?auto_461050 - SURFACE
      ?auto_461051 - SURFACE
      ?auto_461052 - SURFACE
      ?auto_461053 - SURFACE
      ?auto_461054 - SURFACE
      ?auto_461055 - SURFACE
      ?auto_461056 - SURFACE
      ?auto_461057 - SURFACE
      ?auto_461058 - SURFACE
    )
    :vars
    (
      ?auto_461060 - HOIST
      ?auto_461059 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_461060 ?auto_461059 ) ( SURFACE-AT ?auto_461057 ?auto_461059 ) ( CLEAR ?auto_461057 ) ( LIFTING ?auto_461060 ?auto_461058 ) ( IS-CRATE ?auto_461058 ) ( not ( = ?auto_461057 ?auto_461058 ) ) ( ON ?auto_461049 ?auto_461048 ) ( ON ?auto_461050 ?auto_461049 ) ( ON ?auto_461051 ?auto_461050 ) ( ON ?auto_461052 ?auto_461051 ) ( ON ?auto_461053 ?auto_461052 ) ( ON ?auto_461054 ?auto_461053 ) ( ON ?auto_461055 ?auto_461054 ) ( ON ?auto_461056 ?auto_461055 ) ( ON ?auto_461057 ?auto_461056 ) ( not ( = ?auto_461048 ?auto_461049 ) ) ( not ( = ?auto_461048 ?auto_461050 ) ) ( not ( = ?auto_461048 ?auto_461051 ) ) ( not ( = ?auto_461048 ?auto_461052 ) ) ( not ( = ?auto_461048 ?auto_461053 ) ) ( not ( = ?auto_461048 ?auto_461054 ) ) ( not ( = ?auto_461048 ?auto_461055 ) ) ( not ( = ?auto_461048 ?auto_461056 ) ) ( not ( = ?auto_461048 ?auto_461057 ) ) ( not ( = ?auto_461048 ?auto_461058 ) ) ( not ( = ?auto_461049 ?auto_461050 ) ) ( not ( = ?auto_461049 ?auto_461051 ) ) ( not ( = ?auto_461049 ?auto_461052 ) ) ( not ( = ?auto_461049 ?auto_461053 ) ) ( not ( = ?auto_461049 ?auto_461054 ) ) ( not ( = ?auto_461049 ?auto_461055 ) ) ( not ( = ?auto_461049 ?auto_461056 ) ) ( not ( = ?auto_461049 ?auto_461057 ) ) ( not ( = ?auto_461049 ?auto_461058 ) ) ( not ( = ?auto_461050 ?auto_461051 ) ) ( not ( = ?auto_461050 ?auto_461052 ) ) ( not ( = ?auto_461050 ?auto_461053 ) ) ( not ( = ?auto_461050 ?auto_461054 ) ) ( not ( = ?auto_461050 ?auto_461055 ) ) ( not ( = ?auto_461050 ?auto_461056 ) ) ( not ( = ?auto_461050 ?auto_461057 ) ) ( not ( = ?auto_461050 ?auto_461058 ) ) ( not ( = ?auto_461051 ?auto_461052 ) ) ( not ( = ?auto_461051 ?auto_461053 ) ) ( not ( = ?auto_461051 ?auto_461054 ) ) ( not ( = ?auto_461051 ?auto_461055 ) ) ( not ( = ?auto_461051 ?auto_461056 ) ) ( not ( = ?auto_461051 ?auto_461057 ) ) ( not ( = ?auto_461051 ?auto_461058 ) ) ( not ( = ?auto_461052 ?auto_461053 ) ) ( not ( = ?auto_461052 ?auto_461054 ) ) ( not ( = ?auto_461052 ?auto_461055 ) ) ( not ( = ?auto_461052 ?auto_461056 ) ) ( not ( = ?auto_461052 ?auto_461057 ) ) ( not ( = ?auto_461052 ?auto_461058 ) ) ( not ( = ?auto_461053 ?auto_461054 ) ) ( not ( = ?auto_461053 ?auto_461055 ) ) ( not ( = ?auto_461053 ?auto_461056 ) ) ( not ( = ?auto_461053 ?auto_461057 ) ) ( not ( = ?auto_461053 ?auto_461058 ) ) ( not ( = ?auto_461054 ?auto_461055 ) ) ( not ( = ?auto_461054 ?auto_461056 ) ) ( not ( = ?auto_461054 ?auto_461057 ) ) ( not ( = ?auto_461054 ?auto_461058 ) ) ( not ( = ?auto_461055 ?auto_461056 ) ) ( not ( = ?auto_461055 ?auto_461057 ) ) ( not ( = ?auto_461055 ?auto_461058 ) ) ( not ( = ?auto_461056 ?auto_461057 ) ) ( not ( = ?auto_461056 ?auto_461058 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_461057 ?auto_461058 )
      ( MAKE-10CRATE-VERIFY ?auto_461048 ?auto_461049 ?auto_461050 ?auto_461051 ?auto_461052 ?auto_461053 ?auto_461054 ?auto_461055 ?auto_461056 ?auto_461057 ?auto_461058 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_461142 - SURFACE
      ?auto_461143 - SURFACE
      ?auto_461144 - SURFACE
      ?auto_461145 - SURFACE
      ?auto_461146 - SURFACE
      ?auto_461147 - SURFACE
      ?auto_461148 - SURFACE
      ?auto_461149 - SURFACE
      ?auto_461150 - SURFACE
      ?auto_461151 - SURFACE
      ?auto_461152 - SURFACE
    )
    :vars
    (
      ?auto_461154 - HOIST
      ?auto_461155 - PLACE
      ?auto_461153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_461154 ?auto_461155 ) ( SURFACE-AT ?auto_461151 ?auto_461155 ) ( CLEAR ?auto_461151 ) ( IS-CRATE ?auto_461152 ) ( not ( = ?auto_461151 ?auto_461152 ) ) ( TRUCK-AT ?auto_461153 ?auto_461155 ) ( AVAILABLE ?auto_461154 ) ( IN ?auto_461152 ?auto_461153 ) ( ON ?auto_461151 ?auto_461150 ) ( not ( = ?auto_461150 ?auto_461151 ) ) ( not ( = ?auto_461150 ?auto_461152 ) ) ( ON ?auto_461143 ?auto_461142 ) ( ON ?auto_461144 ?auto_461143 ) ( ON ?auto_461145 ?auto_461144 ) ( ON ?auto_461146 ?auto_461145 ) ( ON ?auto_461147 ?auto_461146 ) ( ON ?auto_461148 ?auto_461147 ) ( ON ?auto_461149 ?auto_461148 ) ( ON ?auto_461150 ?auto_461149 ) ( not ( = ?auto_461142 ?auto_461143 ) ) ( not ( = ?auto_461142 ?auto_461144 ) ) ( not ( = ?auto_461142 ?auto_461145 ) ) ( not ( = ?auto_461142 ?auto_461146 ) ) ( not ( = ?auto_461142 ?auto_461147 ) ) ( not ( = ?auto_461142 ?auto_461148 ) ) ( not ( = ?auto_461142 ?auto_461149 ) ) ( not ( = ?auto_461142 ?auto_461150 ) ) ( not ( = ?auto_461142 ?auto_461151 ) ) ( not ( = ?auto_461142 ?auto_461152 ) ) ( not ( = ?auto_461143 ?auto_461144 ) ) ( not ( = ?auto_461143 ?auto_461145 ) ) ( not ( = ?auto_461143 ?auto_461146 ) ) ( not ( = ?auto_461143 ?auto_461147 ) ) ( not ( = ?auto_461143 ?auto_461148 ) ) ( not ( = ?auto_461143 ?auto_461149 ) ) ( not ( = ?auto_461143 ?auto_461150 ) ) ( not ( = ?auto_461143 ?auto_461151 ) ) ( not ( = ?auto_461143 ?auto_461152 ) ) ( not ( = ?auto_461144 ?auto_461145 ) ) ( not ( = ?auto_461144 ?auto_461146 ) ) ( not ( = ?auto_461144 ?auto_461147 ) ) ( not ( = ?auto_461144 ?auto_461148 ) ) ( not ( = ?auto_461144 ?auto_461149 ) ) ( not ( = ?auto_461144 ?auto_461150 ) ) ( not ( = ?auto_461144 ?auto_461151 ) ) ( not ( = ?auto_461144 ?auto_461152 ) ) ( not ( = ?auto_461145 ?auto_461146 ) ) ( not ( = ?auto_461145 ?auto_461147 ) ) ( not ( = ?auto_461145 ?auto_461148 ) ) ( not ( = ?auto_461145 ?auto_461149 ) ) ( not ( = ?auto_461145 ?auto_461150 ) ) ( not ( = ?auto_461145 ?auto_461151 ) ) ( not ( = ?auto_461145 ?auto_461152 ) ) ( not ( = ?auto_461146 ?auto_461147 ) ) ( not ( = ?auto_461146 ?auto_461148 ) ) ( not ( = ?auto_461146 ?auto_461149 ) ) ( not ( = ?auto_461146 ?auto_461150 ) ) ( not ( = ?auto_461146 ?auto_461151 ) ) ( not ( = ?auto_461146 ?auto_461152 ) ) ( not ( = ?auto_461147 ?auto_461148 ) ) ( not ( = ?auto_461147 ?auto_461149 ) ) ( not ( = ?auto_461147 ?auto_461150 ) ) ( not ( = ?auto_461147 ?auto_461151 ) ) ( not ( = ?auto_461147 ?auto_461152 ) ) ( not ( = ?auto_461148 ?auto_461149 ) ) ( not ( = ?auto_461148 ?auto_461150 ) ) ( not ( = ?auto_461148 ?auto_461151 ) ) ( not ( = ?auto_461148 ?auto_461152 ) ) ( not ( = ?auto_461149 ?auto_461150 ) ) ( not ( = ?auto_461149 ?auto_461151 ) ) ( not ( = ?auto_461149 ?auto_461152 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_461150 ?auto_461151 ?auto_461152 )
      ( MAKE-10CRATE-VERIFY ?auto_461142 ?auto_461143 ?auto_461144 ?auto_461145 ?auto_461146 ?auto_461147 ?auto_461148 ?auto_461149 ?auto_461150 ?auto_461151 ?auto_461152 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_461247 - SURFACE
      ?auto_461248 - SURFACE
      ?auto_461249 - SURFACE
      ?auto_461250 - SURFACE
      ?auto_461251 - SURFACE
      ?auto_461252 - SURFACE
      ?auto_461253 - SURFACE
      ?auto_461254 - SURFACE
      ?auto_461255 - SURFACE
      ?auto_461256 - SURFACE
      ?auto_461257 - SURFACE
    )
    :vars
    (
      ?auto_461259 - HOIST
      ?auto_461261 - PLACE
      ?auto_461258 - TRUCK
      ?auto_461260 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_461259 ?auto_461261 ) ( SURFACE-AT ?auto_461256 ?auto_461261 ) ( CLEAR ?auto_461256 ) ( IS-CRATE ?auto_461257 ) ( not ( = ?auto_461256 ?auto_461257 ) ) ( AVAILABLE ?auto_461259 ) ( IN ?auto_461257 ?auto_461258 ) ( ON ?auto_461256 ?auto_461255 ) ( not ( = ?auto_461255 ?auto_461256 ) ) ( not ( = ?auto_461255 ?auto_461257 ) ) ( TRUCK-AT ?auto_461258 ?auto_461260 ) ( not ( = ?auto_461260 ?auto_461261 ) ) ( ON ?auto_461248 ?auto_461247 ) ( ON ?auto_461249 ?auto_461248 ) ( ON ?auto_461250 ?auto_461249 ) ( ON ?auto_461251 ?auto_461250 ) ( ON ?auto_461252 ?auto_461251 ) ( ON ?auto_461253 ?auto_461252 ) ( ON ?auto_461254 ?auto_461253 ) ( ON ?auto_461255 ?auto_461254 ) ( not ( = ?auto_461247 ?auto_461248 ) ) ( not ( = ?auto_461247 ?auto_461249 ) ) ( not ( = ?auto_461247 ?auto_461250 ) ) ( not ( = ?auto_461247 ?auto_461251 ) ) ( not ( = ?auto_461247 ?auto_461252 ) ) ( not ( = ?auto_461247 ?auto_461253 ) ) ( not ( = ?auto_461247 ?auto_461254 ) ) ( not ( = ?auto_461247 ?auto_461255 ) ) ( not ( = ?auto_461247 ?auto_461256 ) ) ( not ( = ?auto_461247 ?auto_461257 ) ) ( not ( = ?auto_461248 ?auto_461249 ) ) ( not ( = ?auto_461248 ?auto_461250 ) ) ( not ( = ?auto_461248 ?auto_461251 ) ) ( not ( = ?auto_461248 ?auto_461252 ) ) ( not ( = ?auto_461248 ?auto_461253 ) ) ( not ( = ?auto_461248 ?auto_461254 ) ) ( not ( = ?auto_461248 ?auto_461255 ) ) ( not ( = ?auto_461248 ?auto_461256 ) ) ( not ( = ?auto_461248 ?auto_461257 ) ) ( not ( = ?auto_461249 ?auto_461250 ) ) ( not ( = ?auto_461249 ?auto_461251 ) ) ( not ( = ?auto_461249 ?auto_461252 ) ) ( not ( = ?auto_461249 ?auto_461253 ) ) ( not ( = ?auto_461249 ?auto_461254 ) ) ( not ( = ?auto_461249 ?auto_461255 ) ) ( not ( = ?auto_461249 ?auto_461256 ) ) ( not ( = ?auto_461249 ?auto_461257 ) ) ( not ( = ?auto_461250 ?auto_461251 ) ) ( not ( = ?auto_461250 ?auto_461252 ) ) ( not ( = ?auto_461250 ?auto_461253 ) ) ( not ( = ?auto_461250 ?auto_461254 ) ) ( not ( = ?auto_461250 ?auto_461255 ) ) ( not ( = ?auto_461250 ?auto_461256 ) ) ( not ( = ?auto_461250 ?auto_461257 ) ) ( not ( = ?auto_461251 ?auto_461252 ) ) ( not ( = ?auto_461251 ?auto_461253 ) ) ( not ( = ?auto_461251 ?auto_461254 ) ) ( not ( = ?auto_461251 ?auto_461255 ) ) ( not ( = ?auto_461251 ?auto_461256 ) ) ( not ( = ?auto_461251 ?auto_461257 ) ) ( not ( = ?auto_461252 ?auto_461253 ) ) ( not ( = ?auto_461252 ?auto_461254 ) ) ( not ( = ?auto_461252 ?auto_461255 ) ) ( not ( = ?auto_461252 ?auto_461256 ) ) ( not ( = ?auto_461252 ?auto_461257 ) ) ( not ( = ?auto_461253 ?auto_461254 ) ) ( not ( = ?auto_461253 ?auto_461255 ) ) ( not ( = ?auto_461253 ?auto_461256 ) ) ( not ( = ?auto_461253 ?auto_461257 ) ) ( not ( = ?auto_461254 ?auto_461255 ) ) ( not ( = ?auto_461254 ?auto_461256 ) ) ( not ( = ?auto_461254 ?auto_461257 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_461255 ?auto_461256 ?auto_461257 )
      ( MAKE-10CRATE-VERIFY ?auto_461247 ?auto_461248 ?auto_461249 ?auto_461250 ?auto_461251 ?auto_461252 ?auto_461253 ?auto_461254 ?auto_461255 ?auto_461256 ?auto_461257 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_461362 - SURFACE
      ?auto_461363 - SURFACE
      ?auto_461364 - SURFACE
      ?auto_461365 - SURFACE
      ?auto_461366 - SURFACE
      ?auto_461367 - SURFACE
      ?auto_461368 - SURFACE
      ?auto_461369 - SURFACE
      ?auto_461370 - SURFACE
      ?auto_461371 - SURFACE
      ?auto_461372 - SURFACE
    )
    :vars
    (
      ?auto_461376 - HOIST
      ?auto_461374 - PLACE
      ?auto_461373 - TRUCK
      ?auto_461375 - PLACE
      ?auto_461377 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_461376 ?auto_461374 ) ( SURFACE-AT ?auto_461371 ?auto_461374 ) ( CLEAR ?auto_461371 ) ( IS-CRATE ?auto_461372 ) ( not ( = ?auto_461371 ?auto_461372 ) ) ( AVAILABLE ?auto_461376 ) ( ON ?auto_461371 ?auto_461370 ) ( not ( = ?auto_461370 ?auto_461371 ) ) ( not ( = ?auto_461370 ?auto_461372 ) ) ( TRUCK-AT ?auto_461373 ?auto_461375 ) ( not ( = ?auto_461375 ?auto_461374 ) ) ( HOIST-AT ?auto_461377 ?auto_461375 ) ( LIFTING ?auto_461377 ?auto_461372 ) ( not ( = ?auto_461376 ?auto_461377 ) ) ( ON ?auto_461363 ?auto_461362 ) ( ON ?auto_461364 ?auto_461363 ) ( ON ?auto_461365 ?auto_461364 ) ( ON ?auto_461366 ?auto_461365 ) ( ON ?auto_461367 ?auto_461366 ) ( ON ?auto_461368 ?auto_461367 ) ( ON ?auto_461369 ?auto_461368 ) ( ON ?auto_461370 ?auto_461369 ) ( not ( = ?auto_461362 ?auto_461363 ) ) ( not ( = ?auto_461362 ?auto_461364 ) ) ( not ( = ?auto_461362 ?auto_461365 ) ) ( not ( = ?auto_461362 ?auto_461366 ) ) ( not ( = ?auto_461362 ?auto_461367 ) ) ( not ( = ?auto_461362 ?auto_461368 ) ) ( not ( = ?auto_461362 ?auto_461369 ) ) ( not ( = ?auto_461362 ?auto_461370 ) ) ( not ( = ?auto_461362 ?auto_461371 ) ) ( not ( = ?auto_461362 ?auto_461372 ) ) ( not ( = ?auto_461363 ?auto_461364 ) ) ( not ( = ?auto_461363 ?auto_461365 ) ) ( not ( = ?auto_461363 ?auto_461366 ) ) ( not ( = ?auto_461363 ?auto_461367 ) ) ( not ( = ?auto_461363 ?auto_461368 ) ) ( not ( = ?auto_461363 ?auto_461369 ) ) ( not ( = ?auto_461363 ?auto_461370 ) ) ( not ( = ?auto_461363 ?auto_461371 ) ) ( not ( = ?auto_461363 ?auto_461372 ) ) ( not ( = ?auto_461364 ?auto_461365 ) ) ( not ( = ?auto_461364 ?auto_461366 ) ) ( not ( = ?auto_461364 ?auto_461367 ) ) ( not ( = ?auto_461364 ?auto_461368 ) ) ( not ( = ?auto_461364 ?auto_461369 ) ) ( not ( = ?auto_461364 ?auto_461370 ) ) ( not ( = ?auto_461364 ?auto_461371 ) ) ( not ( = ?auto_461364 ?auto_461372 ) ) ( not ( = ?auto_461365 ?auto_461366 ) ) ( not ( = ?auto_461365 ?auto_461367 ) ) ( not ( = ?auto_461365 ?auto_461368 ) ) ( not ( = ?auto_461365 ?auto_461369 ) ) ( not ( = ?auto_461365 ?auto_461370 ) ) ( not ( = ?auto_461365 ?auto_461371 ) ) ( not ( = ?auto_461365 ?auto_461372 ) ) ( not ( = ?auto_461366 ?auto_461367 ) ) ( not ( = ?auto_461366 ?auto_461368 ) ) ( not ( = ?auto_461366 ?auto_461369 ) ) ( not ( = ?auto_461366 ?auto_461370 ) ) ( not ( = ?auto_461366 ?auto_461371 ) ) ( not ( = ?auto_461366 ?auto_461372 ) ) ( not ( = ?auto_461367 ?auto_461368 ) ) ( not ( = ?auto_461367 ?auto_461369 ) ) ( not ( = ?auto_461367 ?auto_461370 ) ) ( not ( = ?auto_461367 ?auto_461371 ) ) ( not ( = ?auto_461367 ?auto_461372 ) ) ( not ( = ?auto_461368 ?auto_461369 ) ) ( not ( = ?auto_461368 ?auto_461370 ) ) ( not ( = ?auto_461368 ?auto_461371 ) ) ( not ( = ?auto_461368 ?auto_461372 ) ) ( not ( = ?auto_461369 ?auto_461370 ) ) ( not ( = ?auto_461369 ?auto_461371 ) ) ( not ( = ?auto_461369 ?auto_461372 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_461370 ?auto_461371 ?auto_461372 )
      ( MAKE-10CRATE-VERIFY ?auto_461362 ?auto_461363 ?auto_461364 ?auto_461365 ?auto_461366 ?auto_461367 ?auto_461368 ?auto_461369 ?auto_461370 ?auto_461371 ?auto_461372 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_461487 - SURFACE
      ?auto_461488 - SURFACE
      ?auto_461489 - SURFACE
      ?auto_461490 - SURFACE
      ?auto_461491 - SURFACE
      ?auto_461492 - SURFACE
      ?auto_461493 - SURFACE
      ?auto_461494 - SURFACE
      ?auto_461495 - SURFACE
      ?auto_461496 - SURFACE
      ?auto_461497 - SURFACE
    )
    :vars
    (
      ?auto_461503 - HOIST
      ?auto_461501 - PLACE
      ?auto_461500 - TRUCK
      ?auto_461502 - PLACE
      ?auto_461499 - HOIST
      ?auto_461498 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_461503 ?auto_461501 ) ( SURFACE-AT ?auto_461496 ?auto_461501 ) ( CLEAR ?auto_461496 ) ( IS-CRATE ?auto_461497 ) ( not ( = ?auto_461496 ?auto_461497 ) ) ( AVAILABLE ?auto_461503 ) ( ON ?auto_461496 ?auto_461495 ) ( not ( = ?auto_461495 ?auto_461496 ) ) ( not ( = ?auto_461495 ?auto_461497 ) ) ( TRUCK-AT ?auto_461500 ?auto_461502 ) ( not ( = ?auto_461502 ?auto_461501 ) ) ( HOIST-AT ?auto_461499 ?auto_461502 ) ( not ( = ?auto_461503 ?auto_461499 ) ) ( AVAILABLE ?auto_461499 ) ( SURFACE-AT ?auto_461497 ?auto_461502 ) ( ON ?auto_461497 ?auto_461498 ) ( CLEAR ?auto_461497 ) ( not ( = ?auto_461496 ?auto_461498 ) ) ( not ( = ?auto_461497 ?auto_461498 ) ) ( not ( = ?auto_461495 ?auto_461498 ) ) ( ON ?auto_461488 ?auto_461487 ) ( ON ?auto_461489 ?auto_461488 ) ( ON ?auto_461490 ?auto_461489 ) ( ON ?auto_461491 ?auto_461490 ) ( ON ?auto_461492 ?auto_461491 ) ( ON ?auto_461493 ?auto_461492 ) ( ON ?auto_461494 ?auto_461493 ) ( ON ?auto_461495 ?auto_461494 ) ( not ( = ?auto_461487 ?auto_461488 ) ) ( not ( = ?auto_461487 ?auto_461489 ) ) ( not ( = ?auto_461487 ?auto_461490 ) ) ( not ( = ?auto_461487 ?auto_461491 ) ) ( not ( = ?auto_461487 ?auto_461492 ) ) ( not ( = ?auto_461487 ?auto_461493 ) ) ( not ( = ?auto_461487 ?auto_461494 ) ) ( not ( = ?auto_461487 ?auto_461495 ) ) ( not ( = ?auto_461487 ?auto_461496 ) ) ( not ( = ?auto_461487 ?auto_461497 ) ) ( not ( = ?auto_461487 ?auto_461498 ) ) ( not ( = ?auto_461488 ?auto_461489 ) ) ( not ( = ?auto_461488 ?auto_461490 ) ) ( not ( = ?auto_461488 ?auto_461491 ) ) ( not ( = ?auto_461488 ?auto_461492 ) ) ( not ( = ?auto_461488 ?auto_461493 ) ) ( not ( = ?auto_461488 ?auto_461494 ) ) ( not ( = ?auto_461488 ?auto_461495 ) ) ( not ( = ?auto_461488 ?auto_461496 ) ) ( not ( = ?auto_461488 ?auto_461497 ) ) ( not ( = ?auto_461488 ?auto_461498 ) ) ( not ( = ?auto_461489 ?auto_461490 ) ) ( not ( = ?auto_461489 ?auto_461491 ) ) ( not ( = ?auto_461489 ?auto_461492 ) ) ( not ( = ?auto_461489 ?auto_461493 ) ) ( not ( = ?auto_461489 ?auto_461494 ) ) ( not ( = ?auto_461489 ?auto_461495 ) ) ( not ( = ?auto_461489 ?auto_461496 ) ) ( not ( = ?auto_461489 ?auto_461497 ) ) ( not ( = ?auto_461489 ?auto_461498 ) ) ( not ( = ?auto_461490 ?auto_461491 ) ) ( not ( = ?auto_461490 ?auto_461492 ) ) ( not ( = ?auto_461490 ?auto_461493 ) ) ( not ( = ?auto_461490 ?auto_461494 ) ) ( not ( = ?auto_461490 ?auto_461495 ) ) ( not ( = ?auto_461490 ?auto_461496 ) ) ( not ( = ?auto_461490 ?auto_461497 ) ) ( not ( = ?auto_461490 ?auto_461498 ) ) ( not ( = ?auto_461491 ?auto_461492 ) ) ( not ( = ?auto_461491 ?auto_461493 ) ) ( not ( = ?auto_461491 ?auto_461494 ) ) ( not ( = ?auto_461491 ?auto_461495 ) ) ( not ( = ?auto_461491 ?auto_461496 ) ) ( not ( = ?auto_461491 ?auto_461497 ) ) ( not ( = ?auto_461491 ?auto_461498 ) ) ( not ( = ?auto_461492 ?auto_461493 ) ) ( not ( = ?auto_461492 ?auto_461494 ) ) ( not ( = ?auto_461492 ?auto_461495 ) ) ( not ( = ?auto_461492 ?auto_461496 ) ) ( not ( = ?auto_461492 ?auto_461497 ) ) ( not ( = ?auto_461492 ?auto_461498 ) ) ( not ( = ?auto_461493 ?auto_461494 ) ) ( not ( = ?auto_461493 ?auto_461495 ) ) ( not ( = ?auto_461493 ?auto_461496 ) ) ( not ( = ?auto_461493 ?auto_461497 ) ) ( not ( = ?auto_461493 ?auto_461498 ) ) ( not ( = ?auto_461494 ?auto_461495 ) ) ( not ( = ?auto_461494 ?auto_461496 ) ) ( not ( = ?auto_461494 ?auto_461497 ) ) ( not ( = ?auto_461494 ?auto_461498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_461495 ?auto_461496 ?auto_461497 )
      ( MAKE-10CRATE-VERIFY ?auto_461487 ?auto_461488 ?auto_461489 ?auto_461490 ?auto_461491 ?auto_461492 ?auto_461493 ?auto_461494 ?auto_461495 ?auto_461496 ?auto_461497 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_461613 - SURFACE
      ?auto_461614 - SURFACE
      ?auto_461615 - SURFACE
      ?auto_461616 - SURFACE
      ?auto_461617 - SURFACE
      ?auto_461618 - SURFACE
      ?auto_461619 - SURFACE
      ?auto_461620 - SURFACE
      ?auto_461621 - SURFACE
      ?auto_461622 - SURFACE
      ?auto_461623 - SURFACE
    )
    :vars
    (
      ?auto_461625 - HOIST
      ?auto_461628 - PLACE
      ?auto_461629 - PLACE
      ?auto_461624 - HOIST
      ?auto_461627 - SURFACE
      ?auto_461626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_461625 ?auto_461628 ) ( SURFACE-AT ?auto_461622 ?auto_461628 ) ( CLEAR ?auto_461622 ) ( IS-CRATE ?auto_461623 ) ( not ( = ?auto_461622 ?auto_461623 ) ) ( AVAILABLE ?auto_461625 ) ( ON ?auto_461622 ?auto_461621 ) ( not ( = ?auto_461621 ?auto_461622 ) ) ( not ( = ?auto_461621 ?auto_461623 ) ) ( not ( = ?auto_461629 ?auto_461628 ) ) ( HOIST-AT ?auto_461624 ?auto_461629 ) ( not ( = ?auto_461625 ?auto_461624 ) ) ( AVAILABLE ?auto_461624 ) ( SURFACE-AT ?auto_461623 ?auto_461629 ) ( ON ?auto_461623 ?auto_461627 ) ( CLEAR ?auto_461623 ) ( not ( = ?auto_461622 ?auto_461627 ) ) ( not ( = ?auto_461623 ?auto_461627 ) ) ( not ( = ?auto_461621 ?auto_461627 ) ) ( TRUCK-AT ?auto_461626 ?auto_461628 ) ( ON ?auto_461614 ?auto_461613 ) ( ON ?auto_461615 ?auto_461614 ) ( ON ?auto_461616 ?auto_461615 ) ( ON ?auto_461617 ?auto_461616 ) ( ON ?auto_461618 ?auto_461617 ) ( ON ?auto_461619 ?auto_461618 ) ( ON ?auto_461620 ?auto_461619 ) ( ON ?auto_461621 ?auto_461620 ) ( not ( = ?auto_461613 ?auto_461614 ) ) ( not ( = ?auto_461613 ?auto_461615 ) ) ( not ( = ?auto_461613 ?auto_461616 ) ) ( not ( = ?auto_461613 ?auto_461617 ) ) ( not ( = ?auto_461613 ?auto_461618 ) ) ( not ( = ?auto_461613 ?auto_461619 ) ) ( not ( = ?auto_461613 ?auto_461620 ) ) ( not ( = ?auto_461613 ?auto_461621 ) ) ( not ( = ?auto_461613 ?auto_461622 ) ) ( not ( = ?auto_461613 ?auto_461623 ) ) ( not ( = ?auto_461613 ?auto_461627 ) ) ( not ( = ?auto_461614 ?auto_461615 ) ) ( not ( = ?auto_461614 ?auto_461616 ) ) ( not ( = ?auto_461614 ?auto_461617 ) ) ( not ( = ?auto_461614 ?auto_461618 ) ) ( not ( = ?auto_461614 ?auto_461619 ) ) ( not ( = ?auto_461614 ?auto_461620 ) ) ( not ( = ?auto_461614 ?auto_461621 ) ) ( not ( = ?auto_461614 ?auto_461622 ) ) ( not ( = ?auto_461614 ?auto_461623 ) ) ( not ( = ?auto_461614 ?auto_461627 ) ) ( not ( = ?auto_461615 ?auto_461616 ) ) ( not ( = ?auto_461615 ?auto_461617 ) ) ( not ( = ?auto_461615 ?auto_461618 ) ) ( not ( = ?auto_461615 ?auto_461619 ) ) ( not ( = ?auto_461615 ?auto_461620 ) ) ( not ( = ?auto_461615 ?auto_461621 ) ) ( not ( = ?auto_461615 ?auto_461622 ) ) ( not ( = ?auto_461615 ?auto_461623 ) ) ( not ( = ?auto_461615 ?auto_461627 ) ) ( not ( = ?auto_461616 ?auto_461617 ) ) ( not ( = ?auto_461616 ?auto_461618 ) ) ( not ( = ?auto_461616 ?auto_461619 ) ) ( not ( = ?auto_461616 ?auto_461620 ) ) ( not ( = ?auto_461616 ?auto_461621 ) ) ( not ( = ?auto_461616 ?auto_461622 ) ) ( not ( = ?auto_461616 ?auto_461623 ) ) ( not ( = ?auto_461616 ?auto_461627 ) ) ( not ( = ?auto_461617 ?auto_461618 ) ) ( not ( = ?auto_461617 ?auto_461619 ) ) ( not ( = ?auto_461617 ?auto_461620 ) ) ( not ( = ?auto_461617 ?auto_461621 ) ) ( not ( = ?auto_461617 ?auto_461622 ) ) ( not ( = ?auto_461617 ?auto_461623 ) ) ( not ( = ?auto_461617 ?auto_461627 ) ) ( not ( = ?auto_461618 ?auto_461619 ) ) ( not ( = ?auto_461618 ?auto_461620 ) ) ( not ( = ?auto_461618 ?auto_461621 ) ) ( not ( = ?auto_461618 ?auto_461622 ) ) ( not ( = ?auto_461618 ?auto_461623 ) ) ( not ( = ?auto_461618 ?auto_461627 ) ) ( not ( = ?auto_461619 ?auto_461620 ) ) ( not ( = ?auto_461619 ?auto_461621 ) ) ( not ( = ?auto_461619 ?auto_461622 ) ) ( not ( = ?auto_461619 ?auto_461623 ) ) ( not ( = ?auto_461619 ?auto_461627 ) ) ( not ( = ?auto_461620 ?auto_461621 ) ) ( not ( = ?auto_461620 ?auto_461622 ) ) ( not ( = ?auto_461620 ?auto_461623 ) ) ( not ( = ?auto_461620 ?auto_461627 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_461621 ?auto_461622 ?auto_461623 )
      ( MAKE-10CRATE-VERIFY ?auto_461613 ?auto_461614 ?auto_461615 ?auto_461616 ?auto_461617 ?auto_461618 ?auto_461619 ?auto_461620 ?auto_461621 ?auto_461622 ?auto_461623 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_461739 - SURFACE
      ?auto_461740 - SURFACE
      ?auto_461741 - SURFACE
      ?auto_461742 - SURFACE
      ?auto_461743 - SURFACE
      ?auto_461744 - SURFACE
      ?auto_461745 - SURFACE
      ?auto_461746 - SURFACE
      ?auto_461747 - SURFACE
      ?auto_461748 - SURFACE
      ?auto_461749 - SURFACE
    )
    :vars
    (
      ?auto_461750 - HOIST
      ?auto_461754 - PLACE
      ?auto_461751 - PLACE
      ?auto_461752 - HOIST
      ?auto_461755 - SURFACE
      ?auto_461753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_461750 ?auto_461754 ) ( IS-CRATE ?auto_461749 ) ( not ( = ?auto_461748 ?auto_461749 ) ) ( not ( = ?auto_461747 ?auto_461748 ) ) ( not ( = ?auto_461747 ?auto_461749 ) ) ( not ( = ?auto_461751 ?auto_461754 ) ) ( HOIST-AT ?auto_461752 ?auto_461751 ) ( not ( = ?auto_461750 ?auto_461752 ) ) ( AVAILABLE ?auto_461752 ) ( SURFACE-AT ?auto_461749 ?auto_461751 ) ( ON ?auto_461749 ?auto_461755 ) ( CLEAR ?auto_461749 ) ( not ( = ?auto_461748 ?auto_461755 ) ) ( not ( = ?auto_461749 ?auto_461755 ) ) ( not ( = ?auto_461747 ?auto_461755 ) ) ( TRUCK-AT ?auto_461753 ?auto_461754 ) ( SURFACE-AT ?auto_461747 ?auto_461754 ) ( CLEAR ?auto_461747 ) ( LIFTING ?auto_461750 ?auto_461748 ) ( IS-CRATE ?auto_461748 ) ( ON ?auto_461740 ?auto_461739 ) ( ON ?auto_461741 ?auto_461740 ) ( ON ?auto_461742 ?auto_461741 ) ( ON ?auto_461743 ?auto_461742 ) ( ON ?auto_461744 ?auto_461743 ) ( ON ?auto_461745 ?auto_461744 ) ( ON ?auto_461746 ?auto_461745 ) ( ON ?auto_461747 ?auto_461746 ) ( not ( = ?auto_461739 ?auto_461740 ) ) ( not ( = ?auto_461739 ?auto_461741 ) ) ( not ( = ?auto_461739 ?auto_461742 ) ) ( not ( = ?auto_461739 ?auto_461743 ) ) ( not ( = ?auto_461739 ?auto_461744 ) ) ( not ( = ?auto_461739 ?auto_461745 ) ) ( not ( = ?auto_461739 ?auto_461746 ) ) ( not ( = ?auto_461739 ?auto_461747 ) ) ( not ( = ?auto_461739 ?auto_461748 ) ) ( not ( = ?auto_461739 ?auto_461749 ) ) ( not ( = ?auto_461739 ?auto_461755 ) ) ( not ( = ?auto_461740 ?auto_461741 ) ) ( not ( = ?auto_461740 ?auto_461742 ) ) ( not ( = ?auto_461740 ?auto_461743 ) ) ( not ( = ?auto_461740 ?auto_461744 ) ) ( not ( = ?auto_461740 ?auto_461745 ) ) ( not ( = ?auto_461740 ?auto_461746 ) ) ( not ( = ?auto_461740 ?auto_461747 ) ) ( not ( = ?auto_461740 ?auto_461748 ) ) ( not ( = ?auto_461740 ?auto_461749 ) ) ( not ( = ?auto_461740 ?auto_461755 ) ) ( not ( = ?auto_461741 ?auto_461742 ) ) ( not ( = ?auto_461741 ?auto_461743 ) ) ( not ( = ?auto_461741 ?auto_461744 ) ) ( not ( = ?auto_461741 ?auto_461745 ) ) ( not ( = ?auto_461741 ?auto_461746 ) ) ( not ( = ?auto_461741 ?auto_461747 ) ) ( not ( = ?auto_461741 ?auto_461748 ) ) ( not ( = ?auto_461741 ?auto_461749 ) ) ( not ( = ?auto_461741 ?auto_461755 ) ) ( not ( = ?auto_461742 ?auto_461743 ) ) ( not ( = ?auto_461742 ?auto_461744 ) ) ( not ( = ?auto_461742 ?auto_461745 ) ) ( not ( = ?auto_461742 ?auto_461746 ) ) ( not ( = ?auto_461742 ?auto_461747 ) ) ( not ( = ?auto_461742 ?auto_461748 ) ) ( not ( = ?auto_461742 ?auto_461749 ) ) ( not ( = ?auto_461742 ?auto_461755 ) ) ( not ( = ?auto_461743 ?auto_461744 ) ) ( not ( = ?auto_461743 ?auto_461745 ) ) ( not ( = ?auto_461743 ?auto_461746 ) ) ( not ( = ?auto_461743 ?auto_461747 ) ) ( not ( = ?auto_461743 ?auto_461748 ) ) ( not ( = ?auto_461743 ?auto_461749 ) ) ( not ( = ?auto_461743 ?auto_461755 ) ) ( not ( = ?auto_461744 ?auto_461745 ) ) ( not ( = ?auto_461744 ?auto_461746 ) ) ( not ( = ?auto_461744 ?auto_461747 ) ) ( not ( = ?auto_461744 ?auto_461748 ) ) ( not ( = ?auto_461744 ?auto_461749 ) ) ( not ( = ?auto_461744 ?auto_461755 ) ) ( not ( = ?auto_461745 ?auto_461746 ) ) ( not ( = ?auto_461745 ?auto_461747 ) ) ( not ( = ?auto_461745 ?auto_461748 ) ) ( not ( = ?auto_461745 ?auto_461749 ) ) ( not ( = ?auto_461745 ?auto_461755 ) ) ( not ( = ?auto_461746 ?auto_461747 ) ) ( not ( = ?auto_461746 ?auto_461748 ) ) ( not ( = ?auto_461746 ?auto_461749 ) ) ( not ( = ?auto_461746 ?auto_461755 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_461747 ?auto_461748 ?auto_461749 )
      ( MAKE-10CRATE-VERIFY ?auto_461739 ?auto_461740 ?auto_461741 ?auto_461742 ?auto_461743 ?auto_461744 ?auto_461745 ?auto_461746 ?auto_461747 ?auto_461748 ?auto_461749 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_461865 - SURFACE
      ?auto_461866 - SURFACE
      ?auto_461867 - SURFACE
      ?auto_461868 - SURFACE
      ?auto_461869 - SURFACE
      ?auto_461870 - SURFACE
      ?auto_461871 - SURFACE
      ?auto_461872 - SURFACE
      ?auto_461873 - SURFACE
      ?auto_461874 - SURFACE
      ?auto_461875 - SURFACE
    )
    :vars
    (
      ?auto_461880 - HOIST
      ?auto_461878 - PLACE
      ?auto_461876 - PLACE
      ?auto_461879 - HOIST
      ?auto_461877 - SURFACE
      ?auto_461881 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_461880 ?auto_461878 ) ( IS-CRATE ?auto_461875 ) ( not ( = ?auto_461874 ?auto_461875 ) ) ( not ( = ?auto_461873 ?auto_461874 ) ) ( not ( = ?auto_461873 ?auto_461875 ) ) ( not ( = ?auto_461876 ?auto_461878 ) ) ( HOIST-AT ?auto_461879 ?auto_461876 ) ( not ( = ?auto_461880 ?auto_461879 ) ) ( AVAILABLE ?auto_461879 ) ( SURFACE-AT ?auto_461875 ?auto_461876 ) ( ON ?auto_461875 ?auto_461877 ) ( CLEAR ?auto_461875 ) ( not ( = ?auto_461874 ?auto_461877 ) ) ( not ( = ?auto_461875 ?auto_461877 ) ) ( not ( = ?auto_461873 ?auto_461877 ) ) ( TRUCK-AT ?auto_461881 ?auto_461878 ) ( SURFACE-AT ?auto_461873 ?auto_461878 ) ( CLEAR ?auto_461873 ) ( IS-CRATE ?auto_461874 ) ( AVAILABLE ?auto_461880 ) ( IN ?auto_461874 ?auto_461881 ) ( ON ?auto_461866 ?auto_461865 ) ( ON ?auto_461867 ?auto_461866 ) ( ON ?auto_461868 ?auto_461867 ) ( ON ?auto_461869 ?auto_461868 ) ( ON ?auto_461870 ?auto_461869 ) ( ON ?auto_461871 ?auto_461870 ) ( ON ?auto_461872 ?auto_461871 ) ( ON ?auto_461873 ?auto_461872 ) ( not ( = ?auto_461865 ?auto_461866 ) ) ( not ( = ?auto_461865 ?auto_461867 ) ) ( not ( = ?auto_461865 ?auto_461868 ) ) ( not ( = ?auto_461865 ?auto_461869 ) ) ( not ( = ?auto_461865 ?auto_461870 ) ) ( not ( = ?auto_461865 ?auto_461871 ) ) ( not ( = ?auto_461865 ?auto_461872 ) ) ( not ( = ?auto_461865 ?auto_461873 ) ) ( not ( = ?auto_461865 ?auto_461874 ) ) ( not ( = ?auto_461865 ?auto_461875 ) ) ( not ( = ?auto_461865 ?auto_461877 ) ) ( not ( = ?auto_461866 ?auto_461867 ) ) ( not ( = ?auto_461866 ?auto_461868 ) ) ( not ( = ?auto_461866 ?auto_461869 ) ) ( not ( = ?auto_461866 ?auto_461870 ) ) ( not ( = ?auto_461866 ?auto_461871 ) ) ( not ( = ?auto_461866 ?auto_461872 ) ) ( not ( = ?auto_461866 ?auto_461873 ) ) ( not ( = ?auto_461866 ?auto_461874 ) ) ( not ( = ?auto_461866 ?auto_461875 ) ) ( not ( = ?auto_461866 ?auto_461877 ) ) ( not ( = ?auto_461867 ?auto_461868 ) ) ( not ( = ?auto_461867 ?auto_461869 ) ) ( not ( = ?auto_461867 ?auto_461870 ) ) ( not ( = ?auto_461867 ?auto_461871 ) ) ( not ( = ?auto_461867 ?auto_461872 ) ) ( not ( = ?auto_461867 ?auto_461873 ) ) ( not ( = ?auto_461867 ?auto_461874 ) ) ( not ( = ?auto_461867 ?auto_461875 ) ) ( not ( = ?auto_461867 ?auto_461877 ) ) ( not ( = ?auto_461868 ?auto_461869 ) ) ( not ( = ?auto_461868 ?auto_461870 ) ) ( not ( = ?auto_461868 ?auto_461871 ) ) ( not ( = ?auto_461868 ?auto_461872 ) ) ( not ( = ?auto_461868 ?auto_461873 ) ) ( not ( = ?auto_461868 ?auto_461874 ) ) ( not ( = ?auto_461868 ?auto_461875 ) ) ( not ( = ?auto_461868 ?auto_461877 ) ) ( not ( = ?auto_461869 ?auto_461870 ) ) ( not ( = ?auto_461869 ?auto_461871 ) ) ( not ( = ?auto_461869 ?auto_461872 ) ) ( not ( = ?auto_461869 ?auto_461873 ) ) ( not ( = ?auto_461869 ?auto_461874 ) ) ( not ( = ?auto_461869 ?auto_461875 ) ) ( not ( = ?auto_461869 ?auto_461877 ) ) ( not ( = ?auto_461870 ?auto_461871 ) ) ( not ( = ?auto_461870 ?auto_461872 ) ) ( not ( = ?auto_461870 ?auto_461873 ) ) ( not ( = ?auto_461870 ?auto_461874 ) ) ( not ( = ?auto_461870 ?auto_461875 ) ) ( not ( = ?auto_461870 ?auto_461877 ) ) ( not ( = ?auto_461871 ?auto_461872 ) ) ( not ( = ?auto_461871 ?auto_461873 ) ) ( not ( = ?auto_461871 ?auto_461874 ) ) ( not ( = ?auto_461871 ?auto_461875 ) ) ( not ( = ?auto_461871 ?auto_461877 ) ) ( not ( = ?auto_461872 ?auto_461873 ) ) ( not ( = ?auto_461872 ?auto_461874 ) ) ( not ( = ?auto_461872 ?auto_461875 ) ) ( not ( = ?auto_461872 ?auto_461877 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_461873 ?auto_461874 ?auto_461875 )
      ( MAKE-10CRATE-VERIFY ?auto_461865 ?auto_461866 ?auto_461867 ?auto_461868 ?auto_461869 ?auto_461870 ?auto_461871 ?auto_461872 ?auto_461873 ?auto_461874 ?auto_461875 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_469111 - SURFACE
      ?auto_469112 - SURFACE
      ?auto_469113 - SURFACE
      ?auto_469114 - SURFACE
      ?auto_469115 - SURFACE
      ?auto_469116 - SURFACE
      ?auto_469117 - SURFACE
      ?auto_469118 - SURFACE
      ?auto_469119 - SURFACE
      ?auto_469120 - SURFACE
      ?auto_469121 - SURFACE
      ?auto_469122 - SURFACE
    )
    :vars
    (
      ?auto_469124 - HOIST
      ?auto_469123 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_469124 ?auto_469123 ) ( SURFACE-AT ?auto_469121 ?auto_469123 ) ( CLEAR ?auto_469121 ) ( LIFTING ?auto_469124 ?auto_469122 ) ( IS-CRATE ?auto_469122 ) ( not ( = ?auto_469121 ?auto_469122 ) ) ( ON ?auto_469112 ?auto_469111 ) ( ON ?auto_469113 ?auto_469112 ) ( ON ?auto_469114 ?auto_469113 ) ( ON ?auto_469115 ?auto_469114 ) ( ON ?auto_469116 ?auto_469115 ) ( ON ?auto_469117 ?auto_469116 ) ( ON ?auto_469118 ?auto_469117 ) ( ON ?auto_469119 ?auto_469118 ) ( ON ?auto_469120 ?auto_469119 ) ( ON ?auto_469121 ?auto_469120 ) ( not ( = ?auto_469111 ?auto_469112 ) ) ( not ( = ?auto_469111 ?auto_469113 ) ) ( not ( = ?auto_469111 ?auto_469114 ) ) ( not ( = ?auto_469111 ?auto_469115 ) ) ( not ( = ?auto_469111 ?auto_469116 ) ) ( not ( = ?auto_469111 ?auto_469117 ) ) ( not ( = ?auto_469111 ?auto_469118 ) ) ( not ( = ?auto_469111 ?auto_469119 ) ) ( not ( = ?auto_469111 ?auto_469120 ) ) ( not ( = ?auto_469111 ?auto_469121 ) ) ( not ( = ?auto_469111 ?auto_469122 ) ) ( not ( = ?auto_469112 ?auto_469113 ) ) ( not ( = ?auto_469112 ?auto_469114 ) ) ( not ( = ?auto_469112 ?auto_469115 ) ) ( not ( = ?auto_469112 ?auto_469116 ) ) ( not ( = ?auto_469112 ?auto_469117 ) ) ( not ( = ?auto_469112 ?auto_469118 ) ) ( not ( = ?auto_469112 ?auto_469119 ) ) ( not ( = ?auto_469112 ?auto_469120 ) ) ( not ( = ?auto_469112 ?auto_469121 ) ) ( not ( = ?auto_469112 ?auto_469122 ) ) ( not ( = ?auto_469113 ?auto_469114 ) ) ( not ( = ?auto_469113 ?auto_469115 ) ) ( not ( = ?auto_469113 ?auto_469116 ) ) ( not ( = ?auto_469113 ?auto_469117 ) ) ( not ( = ?auto_469113 ?auto_469118 ) ) ( not ( = ?auto_469113 ?auto_469119 ) ) ( not ( = ?auto_469113 ?auto_469120 ) ) ( not ( = ?auto_469113 ?auto_469121 ) ) ( not ( = ?auto_469113 ?auto_469122 ) ) ( not ( = ?auto_469114 ?auto_469115 ) ) ( not ( = ?auto_469114 ?auto_469116 ) ) ( not ( = ?auto_469114 ?auto_469117 ) ) ( not ( = ?auto_469114 ?auto_469118 ) ) ( not ( = ?auto_469114 ?auto_469119 ) ) ( not ( = ?auto_469114 ?auto_469120 ) ) ( not ( = ?auto_469114 ?auto_469121 ) ) ( not ( = ?auto_469114 ?auto_469122 ) ) ( not ( = ?auto_469115 ?auto_469116 ) ) ( not ( = ?auto_469115 ?auto_469117 ) ) ( not ( = ?auto_469115 ?auto_469118 ) ) ( not ( = ?auto_469115 ?auto_469119 ) ) ( not ( = ?auto_469115 ?auto_469120 ) ) ( not ( = ?auto_469115 ?auto_469121 ) ) ( not ( = ?auto_469115 ?auto_469122 ) ) ( not ( = ?auto_469116 ?auto_469117 ) ) ( not ( = ?auto_469116 ?auto_469118 ) ) ( not ( = ?auto_469116 ?auto_469119 ) ) ( not ( = ?auto_469116 ?auto_469120 ) ) ( not ( = ?auto_469116 ?auto_469121 ) ) ( not ( = ?auto_469116 ?auto_469122 ) ) ( not ( = ?auto_469117 ?auto_469118 ) ) ( not ( = ?auto_469117 ?auto_469119 ) ) ( not ( = ?auto_469117 ?auto_469120 ) ) ( not ( = ?auto_469117 ?auto_469121 ) ) ( not ( = ?auto_469117 ?auto_469122 ) ) ( not ( = ?auto_469118 ?auto_469119 ) ) ( not ( = ?auto_469118 ?auto_469120 ) ) ( not ( = ?auto_469118 ?auto_469121 ) ) ( not ( = ?auto_469118 ?auto_469122 ) ) ( not ( = ?auto_469119 ?auto_469120 ) ) ( not ( = ?auto_469119 ?auto_469121 ) ) ( not ( = ?auto_469119 ?auto_469122 ) ) ( not ( = ?auto_469120 ?auto_469121 ) ) ( not ( = ?auto_469120 ?auto_469122 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_469121 ?auto_469122 )
      ( MAKE-11CRATE-VERIFY ?auto_469111 ?auto_469112 ?auto_469113 ?auto_469114 ?auto_469115 ?auto_469116 ?auto_469117 ?auto_469118 ?auto_469119 ?auto_469120 ?auto_469121 ?auto_469122 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_469220 - SURFACE
      ?auto_469221 - SURFACE
      ?auto_469222 - SURFACE
      ?auto_469223 - SURFACE
      ?auto_469224 - SURFACE
      ?auto_469225 - SURFACE
      ?auto_469226 - SURFACE
      ?auto_469227 - SURFACE
      ?auto_469228 - SURFACE
      ?auto_469229 - SURFACE
      ?auto_469230 - SURFACE
      ?auto_469231 - SURFACE
    )
    :vars
    (
      ?auto_469234 - HOIST
      ?auto_469233 - PLACE
      ?auto_469232 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_469234 ?auto_469233 ) ( SURFACE-AT ?auto_469230 ?auto_469233 ) ( CLEAR ?auto_469230 ) ( IS-CRATE ?auto_469231 ) ( not ( = ?auto_469230 ?auto_469231 ) ) ( TRUCK-AT ?auto_469232 ?auto_469233 ) ( AVAILABLE ?auto_469234 ) ( IN ?auto_469231 ?auto_469232 ) ( ON ?auto_469230 ?auto_469229 ) ( not ( = ?auto_469229 ?auto_469230 ) ) ( not ( = ?auto_469229 ?auto_469231 ) ) ( ON ?auto_469221 ?auto_469220 ) ( ON ?auto_469222 ?auto_469221 ) ( ON ?auto_469223 ?auto_469222 ) ( ON ?auto_469224 ?auto_469223 ) ( ON ?auto_469225 ?auto_469224 ) ( ON ?auto_469226 ?auto_469225 ) ( ON ?auto_469227 ?auto_469226 ) ( ON ?auto_469228 ?auto_469227 ) ( ON ?auto_469229 ?auto_469228 ) ( not ( = ?auto_469220 ?auto_469221 ) ) ( not ( = ?auto_469220 ?auto_469222 ) ) ( not ( = ?auto_469220 ?auto_469223 ) ) ( not ( = ?auto_469220 ?auto_469224 ) ) ( not ( = ?auto_469220 ?auto_469225 ) ) ( not ( = ?auto_469220 ?auto_469226 ) ) ( not ( = ?auto_469220 ?auto_469227 ) ) ( not ( = ?auto_469220 ?auto_469228 ) ) ( not ( = ?auto_469220 ?auto_469229 ) ) ( not ( = ?auto_469220 ?auto_469230 ) ) ( not ( = ?auto_469220 ?auto_469231 ) ) ( not ( = ?auto_469221 ?auto_469222 ) ) ( not ( = ?auto_469221 ?auto_469223 ) ) ( not ( = ?auto_469221 ?auto_469224 ) ) ( not ( = ?auto_469221 ?auto_469225 ) ) ( not ( = ?auto_469221 ?auto_469226 ) ) ( not ( = ?auto_469221 ?auto_469227 ) ) ( not ( = ?auto_469221 ?auto_469228 ) ) ( not ( = ?auto_469221 ?auto_469229 ) ) ( not ( = ?auto_469221 ?auto_469230 ) ) ( not ( = ?auto_469221 ?auto_469231 ) ) ( not ( = ?auto_469222 ?auto_469223 ) ) ( not ( = ?auto_469222 ?auto_469224 ) ) ( not ( = ?auto_469222 ?auto_469225 ) ) ( not ( = ?auto_469222 ?auto_469226 ) ) ( not ( = ?auto_469222 ?auto_469227 ) ) ( not ( = ?auto_469222 ?auto_469228 ) ) ( not ( = ?auto_469222 ?auto_469229 ) ) ( not ( = ?auto_469222 ?auto_469230 ) ) ( not ( = ?auto_469222 ?auto_469231 ) ) ( not ( = ?auto_469223 ?auto_469224 ) ) ( not ( = ?auto_469223 ?auto_469225 ) ) ( not ( = ?auto_469223 ?auto_469226 ) ) ( not ( = ?auto_469223 ?auto_469227 ) ) ( not ( = ?auto_469223 ?auto_469228 ) ) ( not ( = ?auto_469223 ?auto_469229 ) ) ( not ( = ?auto_469223 ?auto_469230 ) ) ( not ( = ?auto_469223 ?auto_469231 ) ) ( not ( = ?auto_469224 ?auto_469225 ) ) ( not ( = ?auto_469224 ?auto_469226 ) ) ( not ( = ?auto_469224 ?auto_469227 ) ) ( not ( = ?auto_469224 ?auto_469228 ) ) ( not ( = ?auto_469224 ?auto_469229 ) ) ( not ( = ?auto_469224 ?auto_469230 ) ) ( not ( = ?auto_469224 ?auto_469231 ) ) ( not ( = ?auto_469225 ?auto_469226 ) ) ( not ( = ?auto_469225 ?auto_469227 ) ) ( not ( = ?auto_469225 ?auto_469228 ) ) ( not ( = ?auto_469225 ?auto_469229 ) ) ( not ( = ?auto_469225 ?auto_469230 ) ) ( not ( = ?auto_469225 ?auto_469231 ) ) ( not ( = ?auto_469226 ?auto_469227 ) ) ( not ( = ?auto_469226 ?auto_469228 ) ) ( not ( = ?auto_469226 ?auto_469229 ) ) ( not ( = ?auto_469226 ?auto_469230 ) ) ( not ( = ?auto_469226 ?auto_469231 ) ) ( not ( = ?auto_469227 ?auto_469228 ) ) ( not ( = ?auto_469227 ?auto_469229 ) ) ( not ( = ?auto_469227 ?auto_469230 ) ) ( not ( = ?auto_469227 ?auto_469231 ) ) ( not ( = ?auto_469228 ?auto_469229 ) ) ( not ( = ?auto_469228 ?auto_469230 ) ) ( not ( = ?auto_469228 ?auto_469231 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_469229 ?auto_469230 ?auto_469231 )
      ( MAKE-11CRATE-VERIFY ?auto_469220 ?auto_469221 ?auto_469222 ?auto_469223 ?auto_469224 ?auto_469225 ?auto_469226 ?auto_469227 ?auto_469228 ?auto_469229 ?auto_469230 ?auto_469231 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_469341 - SURFACE
      ?auto_469342 - SURFACE
      ?auto_469343 - SURFACE
      ?auto_469344 - SURFACE
      ?auto_469345 - SURFACE
      ?auto_469346 - SURFACE
      ?auto_469347 - SURFACE
      ?auto_469348 - SURFACE
      ?auto_469349 - SURFACE
      ?auto_469350 - SURFACE
      ?auto_469351 - SURFACE
      ?auto_469352 - SURFACE
    )
    :vars
    (
      ?auto_469355 - HOIST
      ?auto_469354 - PLACE
      ?auto_469356 - TRUCK
      ?auto_469353 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_469355 ?auto_469354 ) ( SURFACE-AT ?auto_469351 ?auto_469354 ) ( CLEAR ?auto_469351 ) ( IS-CRATE ?auto_469352 ) ( not ( = ?auto_469351 ?auto_469352 ) ) ( AVAILABLE ?auto_469355 ) ( IN ?auto_469352 ?auto_469356 ) ( ON ?auto_469351 ?auto_469350 ) ( not ( = ?auto_469350 ?auto_469351 ) ) ( not ( = ?auto_469350 ?auto_469352 ) ) ( TRUCK-AT ?auto_469356 ?auto_469353 ) ( not ( = ?auto_469353 ?auto_469354 ) ) ( ON ?auto_469342 ?auto_469341 ) ( ON ?auto_469343 ?auto_469342 ) ( ON ?auto_469344 ?auto_469343 ) ( ON ?auto_469345 ?auto_469344 ) ( ON ?auto_469346 ?auto_469345 ) ( ON ?auto_469347 ?auto_469346 ) ( ON ?auto_469348 ?auto_469347 ) ( ON ?auto_469349 ?auto_469348 ) ( ON ?auto_469350 ?auto_469349 ) ( not ( = ?auto_469341 ?auto_469342 ) ) ( not ( = ?auto_469341 ?auto_469343 ) ) ( not ( = ?auto_469341 ?auto_469344 ) ) ( not ( = ?auto_469341 ?auto_469345 ) ) ( not ( = ?auto_469341 ?auto_469346 ) ) ( not ( = ?auto_469341 ?auto_469347 ) ) ( not ( = ?auto_469341 ?auto_469348 ) ) ( not ( = ?auto_469341 ?auto_469349 ) ) ( not ( = ?auto_469341 ?auto_469350 ) ) ( not ( = ?auto_469341 ?auto_469351 ) ) ( not ( = ?auto_469341 ?auto_469352 ) ) ( not ( = ?auto_469342 ?auto_469343 ) ) ( not ( = ?auto_469342 ?auto_469344 ) ) ( not ( = ?auto_469342 ?auto_469345 ) ) ( not ( = ?auto_469342 ?auto_469346 ) ) ( not ( = ?auto_469342 ?auto_469347 ) ) ( not ( = ?auto_469342 ?auto_469348 ) ) ( not ( = ?auto_469342 ?auto_469349 ) ) ( not ( = ?auto_469342 ?auto_469350 ) ) ( not ( = ?auto_469342 ?auto_469351 ) ) ( not ( = ?auto_469342 ?auto_469352 ) ) ( not ( = ?auto_469343 ?auto_469344 ) ) ( not ( = ?auto_469343 ?auto_469345 ) ) ( not ( = ?auto_469343 ?auto_469346 ) ) ( not ( = ?auto_469343 ?auto_469347 ) ) ( not ( = ?auto_469343 ?auto_469348 ) ) ( not ( = ?auto_469343 ?auto_469349 ) ) ( not ( = ?auto_469343 ?auto_469350 ) ) ( not ( = ?auto_469343 ?auto_469351 ) ) ( not ( = ?auto_469343 ?auto_469352 ) ) ( not ( = ?auto_469344 ?auto_469345 ) ) ( not ( = ?auto_469344 ?auto_469346 ) ) ( not ( = ?auto_469344 ?auto_469347 ) ) ( not ( = ?auto_469344 ?auto_469348 ) ) ( not ( = ?auto_469344 ?auto_469349 ) ) ( not ( = ?auto_469344 ?auto_469350 ) ) ( not ( = ?auto_469344 ?auto_469351 ) ) ( not ( = ?auto_469344 ?auto_469352 ) ) ( not ( = ?auto_469345 ?auto_469346 ) ) ( not ( = ?auto_469345 ?auto_469347 ) ) ( not ( = ?auto_469345 ?auto_469348 ) ) ( not ( = ?auto_469345 ?auto_469349 ) ) ( not ( = ?auto_469345 ?auto_469350 ) ) ( not ( = ?auto_469345 ?auto_469351 ) ) ( not ( = ?auto_469345 ?auto_469352 ) ) ( not ( = ?auto_469346 ?auto_469347 ) ) ( not ( = ?auto_469346 ?auto_469348 ) ) ( not ( = ?auto_469346 ?auto_469349 ) ) ( not ( = ?auto_469346 ?auto_469350 ) ) ( not ( = ?auto_469346 ?auto_469351 ) ) ( not ( = ?auto_469346 ?auto_469352 ) ) ( not ( = ?auto_469347 ?auto_469348 ) ) ( not ( = ?auto_469347 ?auto_469349 ) ) ( not ( = ?auto_469347 ?auto_469350 ) ) ( not ( = ?auto_469347 ?auto_469351 ) ) ( not ( = ?auto_469347 ?auto_469352 ) ) ( not ( = ?auto_469348 ?auto_469349 ) ) ( not ( = ?auto_469348 ?auto_469350 ) ) ( not ( = ?auto_469348 ?auto_469351 ) ) ( not ( = ?auto_469348 ?auto_469352 ) ) ( not ( = ?auto_469349 ?auto_469350 ) ) ( not ( = ?auto_469349 ?auto_469351 ) ) ( not ( = ?auto_469349 ?auto_469352 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_469350 ?auto_469351 ?auto_469352 )
      ( MAKE-11CRATE-VERIFY ?auto_469341 ?auto_469342 ?auto_469343 ?auto_469344 ?auto_469345 ?auto_469346 ?auto_469347 ?auto_469348 ?auto_469349 ?auto_469350 ?auto_469351 ?auto_469352 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_469473 - SURFACE
      ?auto_469474 - SURFACE
      ?auto_469475 - SURFACE
      ?auto_469476 - SURFACE
      ?auto_469477 - SURFACE
      ?auto_469478 - SURFACE
      ?auto_469479 - SURFACE
      ?auto_469480 - SURFACE
      ?auto_469481 - SURFACE
      ?auto_469482 - SURFACE
      ?auto_469483 - SURFACE
      ?auto_469484 - SURFACE
    )
    :vars
    (
      ?auto_469485 - HOIST
      ?auto_469487 - PLACE
      ?auto_469486 - TRUCK
      ?auto_469489 - PLACE
      ?auto_469488 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_469485 ?auto_469487 ) ( SURFACE-AT ?auto_469483 ?auto_469487 ) ( CLEAR ?auto_469483 ) ( IS-CRATE ?auto_469484 ) ( not ( = ?auto_469483 ?auto_469484 ) ) ( AVAILABLE ?auto_469485 ) ( ON ?auto_469483 ?auto_469482 ) ( not ( = ?auto_469482 ?auto_469483 ) ) ( not ( = ?auto_469482 ?auto_469484 ) ) ( TRUCK-AT ?auto_469486 ?auto_469489 ) ( not ( = ?auto_469489 ?auto_469487 ) ) ( HOIST-AT ?auto_469488 ?auto_469489 ) ( LIFTING ?auto_469488 ?auto_469484 ) ( not ( = ?auto_469485 ?auto_469488 ) ) ( ON ?auto_469474 ?auto_469473 ) ( ON ?auto_469475 ?auto_469474 ) ( ON ?auto_469476 ?auto_469475 ) ( ON ?auto_469477 ?auto_469476 ) ( ON ?auto_469478 ?auto_469477 ) ( ON ?auto_469479 ?auto_469478 ) ( ON ?auto_469480 ?auto_469479 ) ( ON ?auto_469481 ?auto_469480 ) ( ON ?auto_469482 ?auto_469481 ) ( not ( = ?auto_469473 ?auto_469474 ) ) ( not ( = ?auto_469473 ?auto_469475 ) ) ( not ( = ?auto_469473 ?auto_469476 ) ) ( not ( = ?auto_469473 ?auto_469477 ) ) ( not ( = ?auto_469473 ?auto_469478 ) ) ( not ( = ?auto_469473 ?auto_469479 ) ) ( not ( = ?auto_469473 ?auto_469480 ) ) ( not ( = ?auto_469473 ?auto_469481 ) ) ( not ( = ?auto_469473 ?auto_469482 ) ) ( not ( = ?auto_469473 ?auto_469483 ) ) ( not ( = ?auto_469473 ?auto_469484 ) ) ( not ( = ?auto_469474 ?auto_469475 ) ) ( not ( = ?auto_469474 ?auto_469476 ) ) ( not ( = ?auto_469474 ?auto_469477 ) ) ( not ( = ?auto_469474 ?auto_469478 ) ) ( not ( = ?auto_469474 ?auto_469479 ) ) ( not ( = ?auto_469474 ?auto_469480 ) ) ( not ( = ?auto_469474 ?auto_469481 ) ) ( not ( = ?auto_469474 ?auto_469482 ) ) ( not ( = ?auto_469474 ?auto_469483 ) ) ( not ( = ?auto_469474 ?auto_469484 ) ) ( not ( = ?auto_469475 ?auto_469476 ) ) ( not ( = ?auto_469475 ?auto_469477 ) ) ( not ( = ?auto_469475 ?auto_469478 ) ) ( not ( = ?auto_469475 ?auto_469479 ) ) ( not ( = ?auto_469475 ?auto_469480 ) ) ( not ( = ?auto_469475 ?auto_469481 ) ) ( not ( = ?auto_469475 ?auto_469482 ) ) ( not ( = ?auto_469475 ?auto_469483 ) ) ( not ( = ?auto_469475 ?auto_469484 ) ) ( not ( = ?auto_469476 ?auto_469477 ) ) ( not ( = ?auto_469476 ?auto_469478 ) ) ( not ( = ?auto_469476 ?auto_469479 ) ) ( not ( = ?auto_469476 ?auto_469480 ) ) ( not ( = ?auto_469476 ?auto_469481 ) ) ( not ( = ?auto_469476 ?auto_469482 ) ) ( not ( = ?auto_469476 ?auto_469483 ) ) ( not ( = ?auto_469476 ?auto_469484 ) ) ( not ( = ?auto_469477 ?auto_469478 ) ) ( not ( = ?auto_469477 ?auto_469479 ) ) ( not ( = ?auto_469477 ?auto_469480 ) ) ( not ( = ?auto_469477 ?auto_469481 ) ) ( not ( = ?auto_469477 ?auto_469482 ) ) ( not ( = ?auto_469477 ?auto_469483 ) ) ( not ( = ?auto_469477 ?auto_469484 ) ) ( not ( = ?auto_469478 ?auto_469479 ) ) ( not ( = ?auto_469478 ?auto_469480 ) ) ( not ( = ?auto_469478 ?auto_469481 ) ) ( not ( = ?auto_469478 ?auto_469482 ) ) ( not ( = ?auto_469478 ?auto_469483 ) ) ( not ( = ?auto_469478 ?auto_469484 ) ) ( not ( = ?auto_469479 ?auto_469480 ) ) ( not ( = ?auto_469479 ?auto_469481 ) ) ( not ( = ?auto_469479 ?auto_469482 ) ) ( not ( = ?auto_469479 ?auto_469483 ) ) ( not ( = ?auto_469479 ?auto_469484 ) ) ( not ( = ?auto_469480 ?auto_469481 ) ) ( not ( = ?auto_469480 ?auto_469482 ) ) ( not ( = ?auto_469480 ?auto_469483 ) ) ( not ( = ?auto_469480 ?auto_469484 ) ) ( not ( = ?auto_469481 ?auto_469482 ) ) ( not ( = ?auto_469481 ?auto_469483 ) ) ( not ( = ?auto_469481 ?auto_469484 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_469482 ?auto_469483 ?auto_469484 )
      ( MAKE-11CRATE-VERIFY ?auto_469473 ?auto_469474 ?auto_469475 ?auto_469476 ?auto_469477 ?auto_469478 ?auto_469479 ?auto_469480 ?auto_469481 ?auto_469482 ?auto_469483 ?auto_469484 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_469616 - SURFACE
      ?auto_469617 - SURFACE
      ?auto_469618 - SURFACE
      ?auto_469619 - SURFACE
      ?auto_469620 - SURFACE
      ?auto_469621 - SURFACE
      ?auto_469622 - SURFACE
      ?auto_469623 - SURFACE
      ?auto_469624 - SURFACE
      ?auto_469625 - SURFACE
      ?auto_469626 - SURFACE
      ?auto_469627 - SURFACE
    )
    :vars
    (
      ?auto_469631 - HOIST
      ?auto_469633 - PLACE
      ?auto_469630 - TRUCK
      ?auto_469629 - PLACE
      ?auto_469628 - HOIST
      ?auto_469632 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_469631 ?auto_469633 ) ( SURFACE-AT ?auto_469626 ?auto_469633 ) ( CLEAR ?auto_469626 ) ( IS-CRATE ?auto_469627 ) ( not ( = ?auto_469626 ?auto_469627 ) ) ( AVAILABLE ?auto_469631 ) ( ON ?auto_469626 ?auto_469625 ) ( not ( = ?auto_469625 ?auto_469626 ) ) ( not ( = ?auto_469625 ?auto_469627 ) ) ( TRUCK-AT ?auto_469630 ?auto_469629 ) ( not ( = ?auto_469629 ?auto_469633 ) ) ( HOIST-AT ?auto_469628 ?auto_469629 ) ( not ( = ?auto_469631 ?auto_469628 ) ) ( AVAILABLE ?auto_469628 ) ( SURFACE-AT ?auto_469627 ?auto_469629 ) ( ON ?auto_469627 ?auto_469632 ) ( CLEAR ?auto_469627 ) ( not ( = ?auto_469626 ?auto_469632 ) ) ( not ( = ?auto_469627 ?auto_469632 ) ) ( not ( = ?auto_469625 ?auto_469632 ) ) ( ON ?auto_469617 ?auto_469616 ) ( ON ?auto_469618 ?auto_469617 ) ( ON ?auto_469619 ?auto_469618 ) ( ON ?auto_469620 ?auto_469619 ) ( ON ?auto_469621 ?auto_469620 ) ( ON ?auto_469622 ?auto_469621 ) ( ON ?auto_469623 ?auto_469622 ) ( ON ?auto_469624 ?auto_469623 ) ( ON ?auto_469625 ?auto_469624 ) ( not ( = ?auto_469616 ?auto_469617 ) ) ( not ( = ?auto_469616 ?auto_469618 ) ) ( not ( = ?auto_469616 ?auto_469619 ) ) ( not ( = ?auto_469616 ?auto_469620 ) ) ( not ( = ?auto_469616 ?auto_469621 ) ) ( not ( = ?auto_469616 ?auto_469622 ) ) ( not ( = ?auto_469616 ?auto_469623 ) ) ( not ( = ?auto_469616 ?auto_469624 ) ) ( not ( = ?auto_469616 ?auto_469625 ) ) ( not ( = ?auto_469616 ?auto_469626 ) ) ( not ( = ?auto_469616 ?auto_469627 ) ) ( not ( = ?auto_469616 ?auto_469632 ) ) ( not ( = ?auto_469617 ?auto_469618 ) ) ( not ( = ?auto_469617 ?auto_469619 ) ) ( not ( = ?auto_469617 ?auto_469620 ) ) ( not ( = ?auto_469617 ?auto_469621 ) ) ( not ( = ?auto_469617 ?auto_469622 ) ) ( not ( = ?auto_469617 ?auto_469623 ) ) ( not ( = ?auto_469617 ?auto_469624 ) ) ( not ( = ?auto_469617 ?auto_469625 ) ) ( not ( = ?auto_469617 ?auto_469626 ) ) ( not ( = ?auto_469617 ?auto_469627 ) ) ( not ( = ?auto_469617 ?auto_469632 ) ) ( not ( = ?auto_469618 ?auto_469619 ) ) ( not ( = ?auto_469618 ?auto_469620 ) ) ( not ( = ?auto_469618 ?auto_469621 ) ) ( not ( = ?auto_469618 ?auto_469622 ) ) ( not ( = ?auto_469618 ?auto_469623 ) ) ( not ( = ?auto_469618 ?auto_469624 ) ) ( not ( = ?auto_469618 ?auto_469625 ) ) ( not ( = ?auto_469618 ?auto_469626 ) ) ( not ( = ?auto_469618 ?auto_469627 ) ) ( not ( = ?auto_469618 ?auto_469632 ) ) ( not ( = ?auto_469619 ?auto_469620 ) ) ( not ( = ?auto_469619 ?auto_469621 ) ) ( not ( = ?auto_469619 ?auto_469622 ) ) ( not ( = ?auto_469619 ?auto_469623 ) ) ( not ( = ?auto_469619 ?auto_469624 ) ) ( not ( = ?auto_469619 ?auto_469625 ) ) ( not ( = ?auto_469619 ?auto_469626 ) ) ( not ( = ?auto_469619 ?auto_469627 ) ) ( not ( = ?auto_469619 ?auto_469632 ) ) ( not ( = ?auto_469620 ?auto_469621 ) ) ( not ( = ?auto_469620 ?auto_469622 ) ) ( not ( = ?auto_469620 ?auto_469623 ) ) ( not ( = ?auto_469620 ?auto_469624 ) ) ( not ( = ?auto_469620 ?auto_469625 ) ) ( not ( = ?auto_469620 ?auto_469626 ) ) ( not ( = ?auto_469620 ?auto_469627 ) ) ( not ( = ?auto_469620 ?auto_469632 ) ) ( not ( = ?auto_469621 ?auto_469622 ) ) ( not ( = ?auto_469621 ?auto_469623 ) ) ( not ( = ?auto_469621 ?auto_469624 ) ) ( not ( = ?auto_469621 ?auto_469625 ) ) ( not ( = ?auto_469621 ?auto_469626 ) ) ( not ( = ?auto_469621 ?auto_469627 ) ) ( not ( = ?auto_469621 ?auto_469632 ) ) ( not ( = ?auto_469622 ?auto_469623 ) ) ( not ( = ?auto_469622 ?auto_469624 ) ) ( not ( = ?auto_469622 ?auto_469625 ) ) ( not ( = ?auto_469622 ?auto_469626 ) ) ( not ( = ?auto_469622 ?auto_469627 ) ) ( not ( = ?auto_469622 ?auto_469632 ) ) ( not ( = ?auto_469623 ?auto_469624 ) ) ( not ( = ?auto_469623 ?auto_469625 ) ) ( not ( = ?auto_469623 ?auto_469626 ) ) ( not ( = ?auto_469623 ?auto_469627 ) ) ( not ( = ?auto_469623 ?auto_469632 ) ) ( not ( = ?auto_469624 ?auto_469625 ) ) ( not ( = ?auto_469624 ?auto_469626 ) ) ( not ( = ?auto_469624 ?auto_469627 ) ) ( not ( = ?auto_469624 ?auto_469632 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_469625 ?auto_469626 ?auto_469627 )
      ( MAKE-11CRATE-VERIFY ?auto_469616 ?auto_469617 ?auto_469618 ?auto_469619 ?auto_469620 ?auto_469621 ?auto_469622 ?auto_469623 ?auto_469624 ?auto_469625 ?auto_469626 ?auto_469627 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_469760 - SURFACE
      ?auto_469761 - SURFACE
      ?auto_469762 - SURFACE
      ?auto_469763 - SURFACE
      ?auto_469764 - SURFACE
      ?auto_469765 - SURFACE
      ?auto_469766 - SURFACE
      ?auto_469767 - SURFACE
      ?auto_469768 - SURFACE
      ?auto_469769 - SURFACE
      ?auto_469770 - SURFACE
      ?auto_469771 - SURFACE
    )
    :vars
    (
      ?auto_469777 - HOIST
      ?auto_469775 - PLACE
      ?auto_469773 - PLACE
      ?auto_469776 - HOIST
      ?auto_469772 - SURFACE
      ?auto_469774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_469777 ?auto_469775 ) ( SURFACE-AT ?auto_469770 ?auto_469775 ) ( CLEAR ?auto_469770 ) ( IS-CRATE ?auto_469771 ) ( not ( = ?auto_469770 ?auto_469771 ) ) ( AVAILABLE ?auto_469777 ) ( ON ?auto_469770 ?auto_469769 ) ( not ( = ?auto_469769 ?auto_469770 ) ) ( not ( = ?auto_469769 ?auto_469771 ) ) ( not ( = ?auto_469773 ?auto_469775 ) ) ( HOIST-AT ?auto_469776 ?auto_469773 ) ( not ( = ?auto_469777 ?auto_469776 ) ) ( AVAILABLE ?auto_469776 ) ( SURFACE-AT ?auto_469771 ?auto_469773 ) ( ON ?auto_469771 ?auto_469772 ) ( CLEAR ?auto_469771 ) ( not ( = ?auto_469770 ?auto_469772 ) ) ( not ( = ?auto_469771 ?auto_469772 ) ) ( not ( = ?auto_469769 ?auto_469772 ) ) ( TRUCK-AT ?auto_469774 ?auto_469775 ) ( ON ?auto_469761 ?auto_469760 ) ( ON ?auto_469762 ?auto_469761 ) ( ON ?auto_469763 ?auto_469762 ) ( ON ?auto_469764 ?auto_469763 ) ( ON ?auto_469765 ?auto_469764 ) ( ON ?auto_469766 ?auto_469765 ) ( ON ?auto_469767 ?auto_469766 ) ( ON ?auto_469768 ?auto_469767 ) ( ON ?auto_469769 ?auto_469768 ) ( not ( = ?auto_469760 ?auto_469761 ) ) ( not ( = ?auto_469760 ?auto_469762 ) ) ( not ( = ?auto_469760 ?auto_469763 ) ) ( not ( = ?auto_469760 ?auto_469764 ) ) ( not ( = ?auto_469760 ?auto_469765 ) ) ( not ( = ?auto_469760 ?auto_469766 ) ) ( not ( = ?auto_469760 ?auto_469767 ) ) ( not ( = ?auto_469760 ?auto_469768 ) ) ( not ( = ?auto_469760 ?auto_469769 ) ) ( not ( = ?auto_469760 ?auto_469770 ) ) ( not ( = ?auto_469760 ?auto_469771 ) ) ( not ( = ?auto_469760 ?auto_469772 ) ) ( not ( = ?auto_469761 ?auto_469762 ) ) ( not ( = ?auto_469761 ?auto_469763 ) ) ( not ( = ?auto_469761 ?auto_469764 ) ) ( not ( = ?auto_469761 ?auto_469765 ) ) ( not ( = ?auto_469761 ?auto_469766 ) ) ( not ( = ?auto_469761 ?auto_469767 ) ) ( not ( = ?auto_469761 ?auto_469768 ) ) ( not ( = ?auto_469761 ?auto_469769 ) ) ( not ( = ?auto_469761 ?auto_469770 ) ) ( not ( = ?auto_469761 ?auto_469771 ) ) ( not ( = ?auto_469761 ?auto_469772 ) ) ( not ( = ?auto_469762 ?auto_469763 ) ) ( not ( = ?auto_469762 ?auto_469764 ) ) ( not ( = ?auto_469762 ?auto_469765 ) ) ( not ( = ?auto_469762 ?auto_469766 ) ) ( not ( = ?auto_469762 ?auto_469767 ) ) ( not ( = ?auto_469762 ?auto_469768 ) ) ( not ( = ?auto_469762 ?auto_469769 ) ) ( not ( = ?auto_469762 ?auto_469770 ) ) ( not ( = ?auto_469762 ?auto_469771 ) ) ( not ( = ?auto_469762 ?auto_469772 ) ) ( not ( = ?auto_469763 ?auto_469764 ) ) ( not ( = ?auto_469763 ?auto_469765 ) ) ( not ( = ?auto_469763 ?auto_469766 ) ) ( not ( = ?auto_469763 ?auto_469767 ) ) ( not ( = ?auto_469763 ?auto_469768 ) ) ( not ( = ?auto_469763 ?auto_469769 ) ) ( not ( = ?auto_469763 ?auto_469770 ) ) ( not ( = ?auto_469763 ?auto_469771 ) ) ( not ( = ?auto_469763 ?auto_469772 ) ) ( not ( = ?auto_469764 ?auto_469765 ) ) ( not ( = ?auto_469764 ?auto_469766 ) ) ( not ( = ?auto_469764 ?auto_469767 ) ) ( not ( = ?auto_469764 ?auto_469768 ) ) ( not ( = ?auto_469764 ?auto_469769 ) ) ( not ( = ?auto_469764 ?auto_469770 ) ) ( not ( = ?auto_469764 ?auto_469771 ) ) ( not ( = ?auto_469764 ?auto_469772 ) ) ( not ( = ?auto_469765 ?auto_469766 ) ) ( not ( = ?auto_469765 ?auto_469767 ) ) ( not ( = ?auto_469765 ?auto_469768 ) ) ( not ( = ?auto_469765 ?auto_469769 ) ) ( not ( = ?auto_469765 ?auto_469770 ) ) ( not ( = ?auto_469765 ?auto_469771 ) ) ( not ( = ?auto_469765 ?auto_469772 ) ) ( not ( = ?auto_469766 ?auto_469767 ) ) ( not ( = ?auto_469766 ?auto_469768 ) ) ( not ( = ?auto_469766 ?auto_469769 ) ) ( not ( = ?auto_469766 ?auto_469770 ) ) ( not ( = ?auto_469766 ?auto_469771 ) ) ( not ( = ?auto_469766 ?auto_469772 ) ) ( not ( = ?auto_469767 ?auto_469768 ) ) ( not ( = ?auto_469767 ?auto_469769 ) ) ( not ( = ?auto_469767 ?auto_469770 ) ) ( not ( = ?auto_469767 ?auto_469771 ) ) ( not ( = ?auto_469767 ?auto_469772 ) ) ( not ( = ?auto_469768 ?auto_469769 ) ) ( not ( = ?auto_469768 ?auto_469770 ) ) ( not ( = ?auto_469768 ?auto_469771 ) ) ( not ( = ?auto_469768 ?auto_469772 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_469769 ?auto_469770 ?auto_469771 )
      ( MAKE-11CRATE-VERIFY ?auto_469760 ?auto_469761 ?auto_469762 ?auto_469763 ?auto_469764 ?auto_469765 ?auto_469766 ?auto_469767 ?auto_469768 ?auto_469769 ?auto_469770 ?auto_469771 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_469904 - SURFACE
      ?auto_469905 - SURFACE
      ?auto_469906 - SURFACE
      ?auto_469907 - SURFACE
      ?auto_469908 - SURFACE
      ?auto_469909 - SURFACE
      ?auto_469910 - SURFACE
      ?auto_469911 - SURFACE
      ?auto_469912 - SURFACE
      ?auto_469913 - SURFACE
      ?auto_469914 - SURFACE
      ?auto_469915 - SURFACE
    )
    :vars
    (
      ?auto_469921 - HOIST
      ?auto_469918 - PLACE
      ?auto_469919 - PLACE
      ?auto_469920 - HOIST
      ?auto_469916 - SURFACE
      ?auto_469917 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_469921 ?auto_469918 ) ( IS-CRATE ?auto_469915 ) ( not ( = ?auto_469914 ?auto_469915 ) ) ( not ( = ?auto_469913 ?auto_469914 ) ) ( not ( = ?auto_469913 ?auto_469915 ) ) ( not ( = ?auto_469919 ?auto_469918 ) ) ( HOIST-AT ?auto_469920 ?auto_469919 ) ( not ( = ?auto_469921 ?auto_469920 ) ) ( AVAILABLE ?auto_469920 ) ( SURFACE-AT ?auto_469915 ?auto_469919 ) ( ON ?auto_469915 ?auto_469916 ) ( CLEAR ?auto_469915 ) ( not ( = ?auto_469914 ?auto_469916 ) ) ( not ( = ?auto_469915 ?auto_469916 ) ) ( not ( = ?auto_469913 ?auto_469916 ) ) ( TRUCK-AT ?auto_469917 ?auto_469918 ) ( SURFACE-AT ?auto_469913 ?auto_469918 ) ( CLEAR ?auto_469913 ) ( LIFTING ?auto_469921 ?auto_469914 ) ( IS-CRATE ?auto_469914 ) ( ON ?auto_469905 ?auto_469904 ) ( ON ?auto_469906 ?auto_469905 ) ( ON ?auto_469907 ?auto_469906 ) ( ON ?auto_469908 ?auto_469907 ) ( ON ?auto_469909 ?auto_469908 ) ( ON ?auto_469910 ?auto_469909 ) ( ON ?auto_469911 ?auto_469910 ) ( ON ?auto_469912 ?auto_469911 ) ( ON ?auto_469913 ?auto_469912 ) ( not ( = ?auto_469904 ?auto_469905 ) ) ( not ( = ?auto_469904 ?auto_469906 ) ) ( not ( = ?auto_469904 ?auto_469907 ) ) ( not ( = ?auto_469904 ?auto_469908 ) ) ( not ( = ?auto_469904 ?auto_469909 ) ) ( not ( = ?auto_469904 ?auto_469910 ) ) ( not ( = ?auto_469904 ?auto_469911 ) ) ( not ( = ?auto_469904 ?auto_469912 ) ) ( not ( = ?auto_469904 ?auto_469913 ) ) ( not ( = ?auto_469904 ?auto_469914 ) ) ( not ( = ?auto_469904 ?auto_469915 ) ) ( not ( = ?auto_469904 ?auto_469916 ) ) ( not ( = ?auto_469905 ?auto_469906 ) ) ( not ( = ?auto_469905 ?auto_469907 ) ) ( not ( = ?auto_469905 ?auto_469908 ) ) ( not ( = ?auto_469905 ?auto_469909 ) ) ( not ( = ?auto_469905 ?auto_469910 ) ) ( not ( = ?auto_469905 ?auto_469911 ) ) ( not ( = ?auto_469905 ?auto_469912 ) ) ( not ( = ?auto_469905 ?auto_469913 ) ) ( not ( = ?auto_469905 ?auto_469914 ) ) ( not ( = ?auto_469905 ?auto_469915 ) ) ( not ( = ?auto_469905 ?auto_469916 ) ) ( not ( = ?auto_469906 ?auto_469907 ) ) ( not ( = ?auto_469906 ?auto_469908 ) ) ( not ( = ?auto_469906 ?auto_469909 ) ) ( not ( = ?auto_469906 ?auto_469910 ) ) ( not ( = ?auto_469906 ?auto_469911 ) ) ( not ( = ?auto_469906 ?auto_469912 ) ) ( not ( = ?auto_469906 ?auto_469913 ) ) ( not ( = ?auto_469906 ?auto_469914 ) ) ( not ( = ?auto_469906 ?auto_469915 ) ) ( not ( = ?auto_469906 ?auto_469916 ) ) ( not ( = ?auto_469907 ?auto_469908 ) ) ( not ( = ?auto_469907 ?auto_469909 ) ) ( not ( = ?auto_469907 ?auto_469910 ) ) ( not ( = ?auto_469907 ?auto_469911 ) ) ( not ( = ?auto_469907 ?auto_469912 ) ) ( not ( = ?auto_469907 ?auto_469913 ) ) ( not ( = ?auto_469907 ?auto_469914 ) ) ( not ( = ?auto_469907 ?auto_469915 ) ) ( not ( = ?auto_469907 ?auto_469916 ) ) ( not ( = ?auto_469908 ?auto_469909 ) ) ( not ( = ?auto_469908 ?auto_469910 ) ) ( not ( = ?auto_469908 ?auto_469911 ) ) ( not ( = ?auto_469908 ?auto_469912 ) ) ( not ( = ?auto_469908 ?auto_469913 ) ) ( not ( = ?auto_469908 ?auto_469914 ) ) ( not ( = ?auto_469908 ?auto_469915 ) ) ( not ( = ?auto_469908 ?auto_469916 ) ) ( not ( = ?auto_469909 ?auto_469910 ) ) ( not ( = ?auto_469909 ?auto_469911 ) ) ( not ( = ?auto_469909 ?auto_469912 ) ) ( not ( = ?auto_469909 ?auto_469913 ) ) ( not ( = ?auto_469909 ?auto_469914 ) ) ( not ( = ?auto_469909 ?auto_469915 ) ) ( not ( = ?auto_469909 ?auto_469916 ) ) ( not ( = ?auto_469910 ?auto_469911 ) ) ( not ( = ?auto_469910 ?auto_469912 ) ) ( not ( = ?auto_469910 ?auto_469913 ) ) ( not ( = ?auto_469910 ?auto_469914 ) ) ( not ( = ?auto_469910 ?auto_469915 ) ) ( not ( = ?auto_469910 ?auto_469916 ) ) ( not ( = ?auto_469911 ?auto_469912 ) ) ( not ( = ?auto_469911 ?auto_469913 ) ) ( not ( = ?auto_469911 ?auto_469914 ) ) ( not ( = ?auto_469911 ?auto_469915 ) ) ( not ( = ?auto_469911 ?auto_469916 ) ) ( not ( = ?auto_469912 ?auto_469913 ) ) ( not ( = ?auto_469912 ?auto_469914 ) ) ( not ( = ?auto_469912 ?auto_469915 ) ) ( not ( = ?auto_469912 ?auto_469916 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_469913 ?auto_469914 ?auto_469915 )
      ( MAKE-11CRATE-VERIFY ?auto_469904 ?auto_469905 ?auto_469906 ?auto_469907 ?auto_469908 ?auto_469909 ?auto_469910 ?auto_469911 ?auto_469912 ?auto_469913 ?auto_469914 ?auto_469915 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_470048 - SURFACE
      ?auto_470049 - SURFACE
      ?auto_470050 - SURFACE
      ?auto_470051 - SURFACE
      ?auto_470052 - SURFACE
      ?auto_470053 - SURFACE
      ?auto_470054 - SURFACE
      ?auto_470055 - SURFACE
      ?auto_470056 - SURFACE
      ?auto_470057 - SURFACE
      ?auto_470058 - SURFACE
      ?auto_470059 - SURFACE
    )
    :vars
    (
      ?auto_470064 - HOIST
      ?auto_470061 - PLACE
      ?auto_470060 - PLACE
      ?auto_470063 - HOIST
      ?auto_470065 - SURFACE
      ?auto_470062 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_470064 ?auto_470061 ) ( IS-CRATE ?auto_470059 ) ( not ( = ?auto_470058 ?auto_470059 ) ) ( not ( = ?auto_470057 ?auto_470058 ) ) ( not ( = ?auto_470057 ?auto_470059 ) ) ( not ( = ?auto_470060 ?auto_470061 ) ) ( HOIST-AT ?auto_470063 ?auto_470060 ) ( not ( = ?auto_470064 ?auto_470063 ) ) ( AVAILABLE ?auto_470063 ) ( SURFACE-AT ?auto_470059 ?auto_470060 ) ( ON ?auto_470059 ?auto_470065 ) ( CLEAR ?auto_470059 ) ( not ( = ?auto_470058 ?auto_470065 ) ) ( not ( = ?auto_470059 ?auto_470065 ) ) ( not ( = ?auto_470057 ?auto_470065 ) ) ( TRUCK-AT ?auto_470062 ?auto_470061 ) ( SURFACE-AT ?auto_470057 ?auto_470061 ) ( CLEAR ?auto_470057 ) ( IS-CRATE ?auto_470058 ) ( AVAILABLE ?auto_470064 ) ( IN ?auto_470058 ?auto_470062 ) ( ON ?auto_470049 ?auto_470048 ) ( ON ?auto_470050 ?auto_470049 ) ( ON ?auto_470051 ?auto_470050 ) ( ON ?auto_470052 ?auto_470051 ) ( ON ?auto_470053 ?auto_470052 ) ( ON ?auto_470054 ?auto_470053 ) ( ON ?auto_470055 ?auto_470054 ) ( ON ?auto_470056 ?auto_470055 ) ( ON ?auto_470057 ?auto_470056 ) ( not ( = ?auto_470048 ?auto_470049 ) ) ( not ( = ?auto_470048 ?auto_470050 ) ) ( not ( = ?auto_470048 ?auto_470051 ) ) ( not ( = ?auto_470048 ?auto_470052 ) ) ( not ( = ?auto_470048 ?auto_470053 ) ) ( not ( = ?auto_470048 ?auto_470054 ) ) ( not ( = ?auto_470048 ?auto_470055 ) ) ( not ( = ?auto_470048 ?auto_470056 ) ) ( not ( = ?auto_470048 ?auto_470057 ) ) ( not ( = ?auto_470048 ?auto_470058 ) ) ( not ( = ?auto_470048 ?auto_470059 ) ) ( not ( = ?auto_470048 ?auto_470065 ) ) ( not ( = ?auto_470049 ?auto_470050 ) ) ( not ( = ?auto_470049 ?auto_470051 ) ) ( not ( = ?auto_470049 ?auto_470052 ) ) ( not ( = ?auto_470049 ?auto_470053 ) ) ( not ( = ?auto_470049 ?auto_470054 ) ) ( not ( = ?auto_470049 ?auto_470055 ) ) ( not ( = ?auto_470049 ?auto_470056 ) ) ( not ( = ?auto_470049 ?auto_470057 ) ) ( not ( = ?auto_470049 ?auto_470058 ) ) ( not ( = ?auto_470049 ?auto_470059 ) ) ( not ( = ?auto_470049 ?auto_470065 ) ) ( not ( = ?auto_470050 ?auto_470051 ) ) ( not ( = ?auto_470050 ?auto_470052 ) ) ( not ( = ?auto_470050 ?auto_470053 ) ) ( not ( = ?auto_470050 ?auto_470054 ) ) ( not ( = ?auto_470050 ?auto_470055 ) ) ( not ( = ?auto_470050 ?auto_470056 ) ) ( not ( = ?auto_470050 ?auto_470057 ) ) ( not ( = ?auto_470050 ?auto_470058 ) ) ( not ( = ?auto_470050 ?auto_470059 ) ) ( not ( = ?auto_470050 ?auto_470065 ) ) ( not ( = ?auto_470051 ?auto_470052 ) ) ( not ( = ?auto_470051 ?auto_470053 ) ) ( not ( = ?auto_470051 ?auto_470054 ) ) ( not ( = ?auto_470051 ?auto_470055 ) ) ( not ( = ?auto_470051 ?auto_470056 ) ) ( not ( = ?auto_470051 ?auto_470057 ) ) ( not ( = ?auto_470051 ?auto_470058 ) ) ( not ( = ?auto_470051 ?auto_470059 ) ) ( not ( = ?auto_470051 ?auto_470065 ) ) ( not ( = ?auto_470052 ?auto_470053 ) ) ( not ( = ?auto_470052 ?auto_470054 ) ) ( not ( = ?auto_470052 ?auto_470055 ) ) ( not ( = ?auto_470052 ?auto_470056 ) ) ( not ( = ?auto_470052 ?auto_470057 ) ) ( not ( = ?auto_470052 ?auto_470058 ) ) ( not ( = ?auto_470052 ?auto_470059 ) ) ( not ( = ?auto_470052 ?auto_470065 ) ) ( not ( = ?auto_470053 ?auto_470054 ) ) ( not ( = ?auto_470053 ?auto_470055 ) ) ( not ( = ?auto_470053 ?auto_470056 ) ) ( not ( = ?auto_470053 ?auto_470057 ) ) ( not ( = ?auto_470053 ?auto_470058 ) ) ( not ( = ?auto_470053 ?auto_470059 ) ) ( not ( = ?auto_470053 ?auto_470065 ) ) ( not ( = ?auto_470054 ?auto_470055 ) ) ( not ( = ?auto_470054 ?auto_470056 ) ) ( not ( = ?auto_470054 ?auto_470057 ) ) ( not ( = ?auto_470054 ?auto_470058 ) ) ( not ( = ?auto_470054 ?auto_470059 ) ) ( not ( = ?auto_470054 ?auto_470065 ) ) ( not ( = ?auto_470055 ?auto_470056 ) ) ( not ( = ?auto_470055 ?auto_470057 ) ) ( not ( = ?auto_470055 ?auto_470058 ) ) ( not ( = ?auto_470055 ?auto_470059 ) ) ( not ( = ?auto_470055 ?auto_470065 ) ) ( not ( = ?auto_470056 ?auto_470057 ) ) ( not ( = ?auto_470056 ?auto_470058 ) ) ( not ( = ?auto_470056 ?auto_470059 ) ) ( not ( = ?auto_470056 ?auto_470065 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_470057 ?auto_470058 ?auto_470059 )
      ( MAKE-11CRATE-VERIFY ?auto_470048 ?auto_470049 ?auto_470050 ?auto_470051 ?auto_470052 ?auto_470053 ?auto_470054 ?auto_470055 ?auto_470056 ?auto_470057 ?auto_470058 ?auto_470059 ) )
  )

)

