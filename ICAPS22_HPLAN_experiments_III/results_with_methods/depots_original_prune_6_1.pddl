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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33190 - SURFACE
      ?auto_33191 - SURFACE
    )
    :vars
    (
      ?auto_33192 - HOIST
      ?auto_33193 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33192 ?auto_33193 ) ( SURFACE-AT ?auto_33190 ?auto_33193 ) ( CLEAR ?auto_33190 ) ( LIFTING ?auto_33192 ?auto_33191 ) ( IS-CRATE ?auto_33191 ) ( not ( = ?auto_33190 ?auto_33191 ) ) )
    :subtasks
    ( ( !DROP ?auto_33192 ?auto_33191 ?auto_33190 ?auto_33193 )
      ( MAKE-1CRATE-VERIFY ?auto_33190 ?auto_33191 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33194 - SURFACE
      ?auto_33195 - SURFACE
    )
    :vars
    (
      ?auto_33196 - HOIST
      ?auto_33197 - PLACE
      ?auto_33198 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33196 ?auto_33197 ) ( SURFACE-AT ?auto_33194 ?auto_33197 ) ( CLEAR ?auto_33194 ) ( IS-CRATE ?auto_33195 ) ( not ( = ?auto_33194 ?auto_33195 ) ) ( TRUCK-AT ?auto_33198 ?auto_33197 ) ( AVAILABLE ?auto_33196 ) ( IN ?auto_33195 ?auto_33198 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33196 ?auto_33195 ?auto_33198 ?auto_33197 )
      ( MAKE-1CRATE ?auto_33194 ?auto_33195 )
      ( MAKE-1CRATE-VERIFY ?auto_33194 ?auto_33195 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33199 - SURFACE
      ?auto_33200 - SURFACE
    )
    :vars
    (
      ?auto_33203 - HOIST
      ?auto_33202 - PLACE
      ?auto_33201 - TRUCK
      ?auto_33204 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33203 ?auto_33202 ) ( SURFACE-AT ?auto_33199 ?auto_33202 ) ( CLEAR ?auto_33199 ) ( IS-CRATE ?auto_33200 ) ( not ( = ?auto_33199 ?auto_33200 ) ) ( AVAILABLE ?auto_33203 ) ( IN ?auto_33200 ?auto_33201 ) ( TRUCK-AT ?auto_33201 ?auto_33204 ) ( not ( = ?auto_33204 ?auto_33202 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33201 ?auto_33204 ?auto_33202 )
      ( MAKE-1CRATE ?auto_33199 ?auto_33200 )
      ( MAKE-1CRATE-VERIFY ?auto_33199 ?auto_33200 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33205 - SURFACE
      ?auto_33206 - SURFACE
    )
    :vars
    (
      ?auto_33207 - HOIST
      ?auto_33210 - PLACE
      ?auto_33208 - TRUCK
      ?auto_33209 - PLACE
      ?auto_33211 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33207 ?auto_33210 ) ( SURFACE-AT ?auto_33205 ?auto_33210 ) ( CLEAR ?auto_33205 ) ( IS-CRATE ?auto_33206 ) ( not ( = ?auto_33205 ?auto_33206 ) ) ( AVAILABLE ?auto_33207 ) ( TRUCK-AT ?auto_33208 ?auto_33209 ) ( not ( = ?auto_33209 ?auto_33210 ) ) ( HOIST-AT ?auto_33211 ?auto_33209 ) ( LIFTING ?auto_33211 ?auto_33206 ) ( not ( = ?auto_33207 ?auto_33211 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33211 ?auto_33206 ?auto_33208 ?auto_33209 )
      ( MAKE-1CRATE ?auto_33205 ?auto_33206 )
      ( MAKE-1CRATE-VERIFY ?auto_33205 ?auto_33206 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33212 - SURFACE
      ?auto_33213 - SURFACE
    )
    :vars
    (
      ?auto_33217 - HOIST
      ?auto_33215 - PLACE
      ?auto_33216 - TRUCK
      ?auto_33214 - PLACE
      ?auto_33218 - HOIST
      ?auto_33219 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33217 ?auto_33215 ) ( SURFACE-AT ?auto_33212 ?auto_33215 ) ( CLEAR ?auto_33212 ) ( IS-CRATE ?auto_33213 ) ( not ( = ?auto_33212 ?auto_33213 ) ) ( AVAILABLE ?auto_33217 ) ( TRUCK-AT ?auto_33216 ?auto_33214 ) ( not ( = ?auto_33214 ?auto_33215 ) ) ( HOIST-AT ?auto_33218 ?auto_33214 ) ( not ( = ?auto_33217 ?auto_33218 ) ) ( AVAILABLE ?auto_33218 ) ( SURFACE-AT ?auto_33213 ?auto_33214 ) ( ON ?auto_33213 ?auto_33219 ) ( CLEAR ?auto_33213 ) ( not ( = ?auto_33212 ?auto_33219 ) ) ( not ( = ?auto_33213 ?auto_33219 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33218 ?auto_33213 ?auto_33219 ?auto_33214 )
      ( MAKE-1CRATE ?auto_33212 ?auto_33213 )
      ( MAKE-1CRATE-VERIFY ?auto_33212 ?auto_33213 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33220 - SURFACE
      ?auto_33221 - SURFACE
    )
    :vars
    (
      ?auto_33222 - HOIST
      ?auto_33225 - PLACE
      ?auto_33224 - PLACE
      ?auto_33223 - HOIST
      ?auto_33227 - SURFACE
      ?auto_33226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33222 ?auto_33225 ) ( SURFACE-AT ?auto_33220 ?auto_33225 ) ( CLEAR ?auto_33220 ) ( IS-CRATE ?auto_33221 ) ( not ( = ?auto_33220 ?auto_33221 ) ) ( AVAILABLE ?auto_33222 ) ( not ( = ?auto_33224 ?auto_33225 ) ) ( HOIST-AT ?auto_33223 ?auto_33224 ) ( not ( = ?auto_33222 ?auto_33223 ) ) ( AVAILABLE ?auto_33223 ) ( SURFACE-AT ?auto_33221 ?auto_33224 ) ( ON ?auto_33221 ?auto_33227 ) ( CLEAR ?auto_33221 ) ( not ( = ?auto_33220 ?auto_33227 ) ) ( not ( = ?auto_33221 ?auto_33227 ) ) ( TRUCK-AT ?auto_33226 ?auto_33225 ) )
    :subtasks
    ( ( !DRIVE ?auto_33226 ?auto_33225 ?auto_33224 )
      ( MAKE-1CRATE ?auto_33220 ?auto_33221 )
      ( MAKE-1CRATE-VERIFY ?auto_33220 ?auto_33221 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33237 - SURFACE
      ?auto_33238 - SURFACE
      ?auto_33239 - SURFACE
    )
    :vars
    (
      ?auto_33241 - HOIST
      ?auto_33240 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33241 ?auto_33240 ) ( SURFACE-AT ?auto_33238 ?auto_33240 ) ( CLEAR ?auto_33238 ) ( LIFTING ?auto_33241 ?auto_33239 ) ( IS-CRATE ?auto_33239 ) ( not ( = ?auto_33238 ?auto_33239 ) ) ( ON ?auto_33238 ?auto_33237 ) ( not ( = ?auto_33237 ?auto_33238 ) ) ( not ( = ?auto_33237 ?auto_33239 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33238 ?auto_33239 )
      ( MAKE-2CRATE-VERIFY ?auto_33237 ?auto_33238 ?auto_33239 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33247 - SURFACE
      ?auto_33248 - SURFACE
      ?auto_33249 - SURFACE
    )
    :vars
    (
      ?auto_33251 - HOIST
      ?auto_33252 - PLACE
      ?auto_33250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33251 ?auto_33252 ) ( SURFACE-AT ?auto_33248 ?auto_33252 ) ( CLEAR ?auto_33248 ) ( IS-CRATE ?auto_33249 ) ( not ( = ?auto_33248 ?auto_33249 ) ) ( TRUCK-AT ?auto_33250 ?auto_33252 ) ( AVAILABLE ?auto_33251 ) ( IN ?auto_33249 ?auto_33250 ) ( ON ?auto_33248 ?auto_33247 ) ( not ( = ?auto_33247 ?auto_33248 ) ) ( not ( = ?auto_33247 ?auto_33249 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33248 ?auto_33249 )
      ( MAKE-2CRATE-VERIFY ?auto_33247 ?auto_33248 ?auto_33249 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33253 - SURFACE
      ?auto_33254 - SURFACE
    )
    :vars
    (
      ?auto_33258 - HOIST
      ?auto_33256 - PLACE
      ?auto_33257 - TRUCK
      ?auto_33255 - SURFACE
      ?auto_33259 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33258 ?auto_33256 ) ( SURFACE-AT ?auto_33253 ?auto_33256 ) ( CLEAR ?auto_33253 ) ( IS-CRATE ?auto_33254 ) ( not ( = ?auto_33253 ?auto_33254 ) ) ( AVAILABLE ?auto_33258 ) ( IN ?auto_33254 ?auto_33257 ) ( ON ?auto_33253 ?auto_33255 ) ( not ( = ?auto_33255 ?auto_33253 ) ) ( not ( = ?auto_33255 ?auto_33254 ) ) ( TRUCK-AT ?auto_33257 ?auto_33259 ) ( not ( = ?auto_33259 ?auto_33256 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33257 ?auto_33259 ?auto_33256 )
      ( MAKE-2CRATE ?auto_33255 ?auto_33253 ?auto_33254 )
      ( MAKE-1CRATE-VERIFY ?auto_33253 ?auto_33254 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33260 - SURFACE
      ?auto_33261 - SURFACE
      ?auto_33262 - SURFACE
    )
    :vars
    (
      ?auto_33264 - HOIST
      ?auto_33265 - PLACE
      ?auto_33263 - TRUCK
      ?auto_33266 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33264 ?auto_33265 ) ( SURFACE-AT ?auto_33261 ?auto_33265 ) ( CLEAR ?auto_33261 ) ( IS-CRATE ?auto_33262 ) ( not ( = ?auto_33261 ?auto_33262 ) ) ( AVAILABLE ?auto_33264 ) ( IN ?auto_33262 ?auto_33263 ) ( ON ?auto_33261 ?auto_33260 ) ( not ( = ?auto_33260 ?auto_33261 ) ) ( not ( = ?auto_33260 ?auto_33262 ) ) ( TRUCK-AT ?auto_33263 ?auto_33266 ) ( not ( = ?auto_33266 ?auto_33265 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33261 ?auto_33262 )
      ( MAKE-2CRATE-VERIFY ?auto_33260 ?auto_33261 ?auto_33262 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33267 - SURFACE
      ?auto_33268 - SURFACE
    )
    :vars
    (
      ?auto_33273 - HOIST
      ?auto_33271 - PLACE
      ?auto_33269 - SURFACE
      ?auto_33270 - TRUCK
      ?auto_33272 - PLACE
      ?auto_33274 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33273 ?auto_33271 ) ( SURFACE-AT ?auto_33267 ?auto_33271 ) ( CLEAR ?auto_33267 ) ( IS-CRATE ?auto_33268 ) ( not ( = ?auto_33267 ?auto_33268 ) ) ( AVAILABLE ?auto_33273 ) ( ON ?auto_33267 ?auto_33269 ) ( not ( = ?auto_33269 ?auto_33267 ) ) ( not ( = ?auto_33269 ?auto_33268 ) ) ( TRUCK-AT ?auto_33270 ?auto_33272 ) ( not ( = ?auto_33272 ?auto_33271 ) ) ( HOIST-AT ?auto_33274 ?auto_33272 ) ( LIFTING ?auto_33274 ?auto_33268 ) ( not ( = ?auto_33273 ?auto_33274 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33274 ?auto_33268 ?auto_33270 ?auto_33272 )
      ( MAKE-2CRATE ?auto_33269 ?auto_33267 ?auto_33268 )
      ( MAKE-1CRATE-VERIFY ?auto_33267 ?auto_33268 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33275 - SURFACE
      ?auto_33276 - SURFACE
      ?auto_33277 - SURFACE
    )
    :vars
    (
      ?auto_33282 - HOIST
      ?auto_33278 - PLACE
      ?auto_33281 - TRUCK
      ?auto_33280 - PLACE
      ?auto_33279 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33282 ?auto_33278 ) ( SURFACE-AT ?auto_33276 ?auto_33278 ) ( CLEAR ?auto_33276 ) ( IS-CRATE ?auto_33277 ) ( not ( = ?auto_33276 ?auto_33277 ) ) ( AVAILABLE ?auto_33282 ) ( ON ?auto_33276 ?auto_33275 ) ( not ( = ?auto_33275 ?auto_33276 ) ) ( not ( = ?auto_33275 ?auto_33277 ) ) ( TRUCK-AT ?auto_33281 ?auto_33280 ) ( not ( = ?auto_33280 ?auto_33278 ) ) ( HOIST-AT ?auto_33279 ?auto_33280 ) ( LIFTING ?auto_33279 ?auto_33277 ) ( not ( = ?auto_33282 ?auto_33279 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33276 ?auto_33277 )
      ( MAKE-2CRATE-VERIFY ?auto_33275 ?auto_33276 ?auto_33277 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33283 - SURFACE
      ?auto_33284 - SURFACE
    )
    :vars
    (
      ?auto_33285 - HOIST
      ?auto_33286 - PLACE
      ?auto_33288 - SURFACE
      ?auto_33289 - TRUCK
      ?auto_33287 - PLACE
      ?auto_33290 - HOIST
      ?auto_33291 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33285 ?auto_33286 ) ( SURFACE-AT ?auto_33283 ?auto_33286 ) ( CLEAR ?auto_33283 ) ( IS-CRATE ?auto_33284 ) ( not ( = ?auto_33283 ?auto_33284 ) ) ( AVAILABLE ?auto_33285 ) ( ON ?auto_33283 ?auto_33288 ) ( not ( = ?auto_33288 ?auto_33283 ) ) ( not ( = ?auto_33288 ?auto_33284 ) ) ( TRUCK-AT ?auto_33289 ?auto_33287 ) ( not ( = ?auto_33287 ?auto_33286 ) ) ( HOIST-AT ?auto_33290 ?auto_33287 ) ( not ( = ?auto_33285 ?auto_33290 ) ) ( AVAILABLE ?auto_33290 ) ( SURFACE-AT ?auto_33284 ?auto_33287 ) ( ON ?auto_33284 ?auto_33291 ) ( CLEAR ?auto_33284 ) ( not ( = ?auto_33283 ?auto_33291 ) ) ( not ( = ?auto_33284 ?auto_33291 ) ) ( not ( = ?auto_33288 ?auto_33291 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33290 ?auto_33284 ?auto_33291 ?auto_33287 )
      ( MAKE-2CRATE ?auto_33288 ?auto_33283 ?auto_33284 )
      ( MAKE-1CRATE-VERIFY ?auto_33283 ?auto_33284 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33292 - SURFACE
      ?auto_33293 - SURFACE
      ?auto_33294 - SURFACE
    )
    :vars
    (
      ?auto_33296 - HOIST
      ?auto_33299 - PLACE
      ?auto_33298 - TRUCK
      ?auto_33295 - PLACE
      ?auto_33300 - HOIST
      ?auto_33297 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33296 ?auto_33299 ) ( SURFACE-AT ?auto_33293 ?auto_33299 ) ( CLEAR ?auto_33293 ) ( IS-CRATE ?auto_33294 ) ( not ( = ?auto_33293 ?auto_33294 ) ) ( AVAILABLE ?auto_33296 ) ( ON ?auto_33293 ?auto_33292 ) ( not ( = ?auto_33292 ?auto_33293 ) ) ( not ( = ?auto_33292 ?auto_33294 ) ) ( TRUCK-AT ?auto_33298 ?auto_33295 ) ( not ( = ?auto_33295 ?auto_33299 ) ) ( HOIST-AT ?auto_33300 ?auto_33295 ) ( not ( = ?auto_33296 ?auto_33300 ) ) ( AVAILABLE ?auto_33300 ) ( SURFACE-AT ?auto_33294 ?auto_33295 ) ( ON ?auto_33294 ?auto_33297 ) ( CLEAR ?auto_33294 ) ( not ( = ?auto_33293 ?auto_33297 ) ) ( not ( = ?auto_33294 ?auto_33297 ) ) ( not ( = ?auto_33292 ?auto_33297 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33293 ?auto_33294 )
      ( MAKE-2CRATE-VERIFY ?auto_33292 ?auto_33293 ?auto_33294 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33301 - SURFACE
      ?auto_33302 - SURFACE
    )
    :vars
    (
      ?auto_33304 - HOIST
      ?auto_33305 - PLACE
      ?auto_33306 - SURFACE
      ?auto_33307 - PLACE
      ?auto_33309 - HOIST
      ?auto_33308 - SURFACE
      ?auto_33303 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33304 ?auto_33305 ) ( SURFACE-AT ?auto_33301 ?auto_33305 ) ( CLEAR ?auto_33301 ) ( IS-CRATE ?auto_33302 ) ( not ( = ?auto_33301 ?auto_33302 ) ) ( AVAILABLE ?auto_33304 ) ( ON ?auto_33301 ?auto_33306 ) ( not ( = ?auto_33306 ?auto_33301 ) ) ( not ( = ?auto_33306 ?auto_33302 ) ) ( not ( = ?auto_33307 ?auto_33305 ) ) ( HOIST-AT ?auto_33309 ?auto_33307 ) ( not ( = ?auto_33304 ?auto_33309 ) ) ( AVAILABLE ?auto_33309 ) ( SURFACE-AT ?auto_33302 ?auto_33307 ) ( ON ?auto_33302 ?auto_33308 ) ( CLEAR ?auto_33302 ) ( not ( = ?auto_33301 ?auto_33308 ) ) ( not ( = ?auto_33302 ?auto_33308 ) ) ( not ( = ?auto_33306 ?auto_33308 ) ) ( TRUCK-AT ?auto_33303 ?auto_33305 ) )
    :subtasks
    ( ( !DRIVE ?auto_33303 ?auto_33305 ?auto_33307 )
      ( MAKE-2CRATE ?auto_33306 ?auto_33301 ?auto_33302 )
      ( MAKE-1CRATE-VERIFY ?auto_33301 ?auto_33302 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33310 - SURFACE
      ?auto_33311 - SURFACE
      ?auto_33312 - SURFACE
    )
    :vars
    (
      ?auto_33317 - HOIST
      ?auto_33314 - PLACE
      ?auto_33316 - PLACE
      ?auto_33313 - HOIST
      ?auto_33318 - SURFACE
      ?auto_33315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33317 ?auto_33314 ) ( SURFACE-AT ?auto_33311 ?auto_33314 ) ( CLEAR ?auto_33311 ) ( IS-CRATE ?auto_33312 ) ( not ( = ?auto_33311 ?auto_33312 ) ) ( AVAILABLE ?auto_33317 ) ( ON ?auto_33311 ?auto_33310 ) ( not ( = ?auto_33310 ?auto_33311 ) ) ( not ( = ?auto_33310 ?auto_33312 ) ) ( not ( = ?auto_33316 ?auto_33314 ) ) ( HOIST-AT ?auto_33313 ?auto_33316 ) ( not ( = ?auto_33317 ?auto_33313 ) ) ( AVAILABLE ?auto_33313 ) ( SURFACE-AT ?auto_33312 ?auto_33316 ) ( ON ?auto_33312 ?auto_33318 ) ( CLEAR ?auto_33312 ) ( not ( = ?auto_33311 ?auto_33318 ) ) ( not ( = ?auto_33312 ?auto_33318 ) ) ( not ( = ?auto_33310 ?auto_33318 ) ) ( TRUCK-AT ?auto_33315 ?auto_33314 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33311 ?auto_33312 )
      ( MAKE-2CRATE-VERIFY ?auto_33310 ?auto_33311 ?auto_33312 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33319 - SURFACE
      ?auto_33320 - SURFACE
    )
    :vars
    (
      ?auto_33321 - HOIST
      ?auto_33326 - PLACE
      ?auto_33323 - SURFACE
      ?auto_33327 - PLACE
      ?auto_33324 - HOIST
      ?auto_33322 - SURFACE
      ?auto_33325 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33321 ?auto_33326 ) ( IS-CRATE ?auto_33320 ) ( not ( = ?auto_33319 ?auto_33320 ) ) ( not ( = ?auto_33323 ?auto_33319 ) ) ( not ( = ?auto_33323 ?auto_33320 ) ) ( not ( = ?auto_33327 ?auto_33326 ) ) ( HOIST-AT ?auto_33324 ?auto_33327 ) ( not ( = ?auto_33321 ?auto_33324 ) ) ( AVAILABLE ?auto_33324 ) ( SURFACE-AT ?auto_33320 ?auto_33327 ) ( ON ?auto_33320 ?auto_33322 ) ( CLEAR ?auto_33320 ) ( not ( = ?auto_33319 ?auto_33322 ) ) ( not ( = ?auto_33320 ?auto_33322 ) ) ( not ( = ?auto_33323 ?auto_33322 ) ) ( TRUCK-AT ?auto_33325 ?auto_33326 ) ( SURFACE-AT ?auto_33323 ?auto_33326 ) ( CLEAR ?auto_33323 ) ( LIFTING ?auto_33321 ?auto_33319 ) ( IS-CRATE ?auto_33319 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33323 ?auto_33319 )
      ( MAKE-2CRATE ?auto_33323 ?auto_33319 ?auto_33320 )
      ( MAKE-1CRATE-VERIFY ?auto_33319 ?auto_33320 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33328 - SURFACE
      ?auto_33329 - SURFACE
      ?auto_33330 - SURFACE
    )
    :vars
    (
      ?auto_33332 - HOIST
      ?auto_33336 - PLACE
      ?auto_33334 - PLACE
      ?auto_33333 - HOIST
      ?auto_33331 - SURFACE
      ?auto_33335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33332 ?auto_33336 ) ( IS-CRATE ?auto_33330 ) ( not ( = ?auto_33329 ?auto_33330 ) ) ( not ( = ?auto_33328 ?auto_33329 ) ) ( not ( = ?auto_33328 ?auto_33330 ) ) ( not ( = ?auto_33334 ?auto_33336 ) ) ( HOIST-AT ?auto_33333 ?auto_33334 ) ( not ( = ?auto_33332 ?auto_33333 ) ) ( AVAILABLE ?auto_33333 ) ( SURFACE-AT ?auto_33330 ?auto_33334 ) ( ON ?auto_33330 ?auto_33331 ) ( CLEAR ?auto_33330 ) ( not ( = ?auto_33329 ?auto_33331 ) ) ( not ( = ?auto_33330 ?auto_33331 ) ) ( not ( = ?auto_33328 ?auto_33331 ) ) ( TRUCK-AT ?auto_33335 ?auto_33336 ) ( SURFACE-AT ?auto_33328 ?auto_33336 ) ( CLEAR ?auto_33328 ) ( LIFTING ?auto_33332 ?auto_33329 ) ( IS-CRATE ?auto_33329 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33329 ?auto_33330 )
      ( MAKE-2CRATE-VERIFY ?auto_33328 ?auto_33329 ?auto_33330 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33337 - SURFACE
      ?auto_33338 - SURFACE
    )
    :vars
    (
      ?auto_33341 - HOIST
      ?auto_33339 - PLACE
      ?auto_33340 - SURFACE
      ?auto_33344 - PLACE
      ?auto_33343 - HOIST
      ?auto_33342 - SURFACE
      ?auto_33345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33341 ?auto_33339 ) ( IS-CRATE ?auto_33338 ) ( not ( = ?auto_33337 ?auto_33338 ) ) ( not ( = ?auto_33340 ?auto_33337 ) ) ( not ( = ?auto_33340 ?auto_33338 ) ) ( not ( = ?auto_33344 ?auto_33339 ) ) ( HOIST-AT ?auto_33343 ?auto_33344 ) ( not ( = ?auto_33341 ?auto_33343 ) ) ( AVAILABLE ?auto_33343 ) ( SURFACE-AT ?auto_33338 ?auto_33344 ) ( ON ?auto_33338 ?auto_33342 ) ( CLEAR ?auto_33338 ) ( not ( = ?auto_33337 ?auto_33342 ) ) ( not ( = ?auto_33338 ?auto_33342 ) ) ( not ( = ?auto_33340 ?auto_33342 ) ) ( TRUCK-AT ?auto_33345 ?auto_33339 ) ( SURFACE-AT ?auto_33340 ?auto_33339 ) ( CLEAR ?auto_33340 ) ( IS-CRATE ?auto_33337 ) ( AVAILABLE ?auto_33341 ) ( IN ?auto_33337 ?auto_33345 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33341 ?auto_33337 ?auto_33345 ?auto_33339 )
      ( MAKE-2CRATE ?auto_33340 ?auto_33337 ?auto_33338 )
      ( MAKE-1CRATE-VERIFY ?auto_33337 ?auto_33338 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33346 - SURFACE
      ?auto_33347 - SURFACE
      ?auto_33348 - SURFACE
    )
    :vars
    (
      ?auto_33351 - HOIST
      ?auto_33353 - PLACE
      ?auto_33354 - PLACE
      ?auto_33350 - HOIST
      ?auto_33349 - SURFACE
      ?auto_33352 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33351 ?auto_33353 ) ( IS-CRATE ?auto_33348 ) ( not ( = ?auto_33347 ?auto_33348 ) ) ( not ( = ?auto_33346 ?auto_33347 ) ) ( not ( = ?auto_33346 ?auto_33348 ) ) ( not ( = ?auto_33354 ?auto_33353 ) ) ( HOIST-AT ?auto_33350 ?auto_33354 ) ( not ( = ?auto_33351 ?auto_33350 ) ) ( AVAILABLE ?auto_33350 ) ( SURFACE-AT ?auto_33348 ?auto_33354 ) ( ON ?auto_33348 ?auto_33349 ) ( CLEAR ?auto_33348 ) ( not ( = ?auto_33347 ?auto_33349 ) ) ( not ( = ?auto_33348 ?auto_33349 ) ) ( not ( = ?auto_33346 ?auto_33349 ) ) ( TRUCK-AT ?auto_33352 ?auto_33353 ) ( SURFACE-AT ?auto_33346 ?auto_33353 ) ( CLEAR ?auto_33346 ) ( IS-CRATE ?auto_33347 ) ( AVAILABLE ?auto_33351 ) ( IN ?auto_33347 ?auto_33352 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33347 ?auto_33348 )
      ( MAKE-2CRATE-VERIFY ?auto_33346 ?auto_33347 ?auto_33348 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33391 - SURFACE
      ?auto_33392 - SURFACE
    )
    :vars
    (
      ?auto_33399 - HOIST
      ?auto_33394 - PLACE
      ?auto_33393 - SURFACE
      ?auto_33397 - PLACE
      ?auto_33396 - HOIST
      ?auto_33398 - SURFACE
      ?auto_33395 - TRUCK
      ?auto_33400 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33399 ?auto_33394 ) ( SURFACE-AT ?auto_33391 ?auto_33394 ) ( CLEAR ?auto_33391 ) ( IS-CRATE ?auto_33392 ) ( not ( = ?auto_33391 ?auto_33392 ) ) ( AVAILABLE ?auto_33399 ) ( ON ?auto_33391 ?auto_33393 ) ( not ( = ?auto_33393 ?auto_33391 ) ) ( not ( = ?auto_33393 ?auto_33392 ) ) ( not ( = ?auto_33397 ?auto_33394 ) ) ( HOIST-AT ?auto_33396 ?auto_33397 ) ( not ( = ?auto_33399 ?auto_33396 ) ) ( AVAILABLE ?auto_33396 ) ( SURFACE-AT ?auto_33392 ?auto_33397 ) ( ON ?auto_33392 ?auto_33398 ) ( CLEAR ?auto_33392 ) ( not ( = ?auto_33391 ?auto_33398 ) ) ( not ( = ?auto_33392 ?auto_33398 ) ) ( not ( = ?auto_33393 ?auto_33398 ) ) ( TRUCK-AT ?auto_33395 ?auto_33400 ) ( not ( = ?auto_33400 ?auto_33394 ) ) ( not ( = ?auto_33397 ?auto_33400 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33395 ?auto_33400 ?auto_33394 )
      ( MAKE-1CRATE ?auto_33391 ?auto_33392 )
      ( MAKE-1CRATE-VERIFY ?auto_33391 ?auto_33392 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33430 - SURFACE
      ?auto_33431 - SURFACE
      ?auto_33432 - SURFACE
      ?auto_33433 - SURFACE
    )
    :vars
    (
      ?auto_33435 - HOIST
      ?auto_33434 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33435 ?auto_33434 ) ( SURFACE-AT ?auto_33432 ?auto_33434 ) ( CLEAR ?auto_33432 ) ( LIFTING ?auto_33435 ?auto_33433 ) ( IS-CRATE ?auto_33433 ) ( not ( = ?auto_33432 ?auto_33433 ) ) ( ON ?auto_33431 ?auto_33430 ) ( ON ?auto_33432 ?auto_33431 ) ( not ( = ?auto_33430 ?auto_33431 ) ) ( not ( = ?auto_33430 ?auto_33432 ) ) ( not ( = ?auto_33430 ?auto_33433 ) ) ( not ( = ?auto_33431 ?auto_33432 ) ) ( not ( = ?auto_33431 ?auto_33433 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33432 ?auto_33433 )
      ( MAKE-3CRATE-VERIFY ?auto_33430 ?auto_33431 ?auto_33432 ?auto_33433 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33447 - SURFACE
      ?auto_33448 - SURFACE
      ?auto_33449 - SURFACE
      ?auto_33450 - SURFACE
    )
    :vars
    (
      ?auto_33451 - HOIST
      ?auto_33452 - PLACE
      ?auto_33453 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33451 ?auto_33452 ) ( SURFACE-AT ?auto_33449 ?auto_33452 ) ( CLEAR ?auto_33449 ) ( IS-CRATE ?auto_33450 ) ( not ( = ?auto_33449 ?auto_33450 ) ) ( TRUCK-AT ?auto_33453 ?auto_33452 ) ( AVAILABLE ?auto_33451 ) ( IN ?auto_33450 ?auto_33453 ) ( ON ?auto_33449 ?auto_33448 ) ( not ( = ?auto_33448 ?auto_33449 ) ) ( not ( = ?auto_33448 ?auto_33450 ) ) ( ON ?auto_33448 ?auto_33447 ) ( not ( = ?auto_33447 ?auto_33448 ) ) ( not ( = ?auto_33447 ?auto_33449 ) ) ( not ( = ?auto_33447 ?auto_33450 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33448 ?auto_33449 ?auto_33450 )
      ( MAKE-3CRATE-VERIFY ?auto_33447 ?auto_33448 ?auto_33449 ?auto_33450 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33468 - SURFACE
      ?auto_33469 - SURFACE
      ?auto_33470 - SURFACE
      ?auto_33471 - SURFACE
    )
    :vars
    (
      ?auto_33475 - HOIST
      ?auto_33472 - PLACE
      ?auto_33473 - TRUCK
      ?auto_33474 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33475 ?auto_33472 ) ( SURFACE-AT ?auto_33470 ?auto_33472 ) ( CLEAR ?auto_33470 ) ( IS-CRATE ?auto_33471 ) ( not ( = ?auto_33470 ?auto_33471 ) ) ( AVAILABLE ?auto_33475 ) ( IN ?auto_33471 ?auto_33473 ) ( ON ?auto_33470 ?auto_33469 ) ( not ( = ?auto_33469 ?auto_33470 ) ) ( not ( = ?auto_33469 ?auto_33471 ) ) ( TRUCK-AT ?auto_33473 ?auto_33474 ) ( not ( = ?auto_33474 ?auto_33472 ) ) ( ON ?auto_33469 ?auto_33468 ) ( not ( = ?auto_33468 ?auto_33469 ) ) ( not ( = ?auto_33468 ?auto_33470 ) ) ( not ( = ?auto_33468 ?auto_33471 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33469 ?auto_33470 ?auto_33471 )
      ( MAKE-3CRATE-VERIFY ?auto_33468 ?auto_33469 ?auto_33470 ?auto_33471 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33492 - SURFACE
      ?auto_33493 - SURFACE
      ?auto_33494 - SURFACE
      ?auto_33495 - SURFACE
    )
    :vars
    (
      ?auto_33499 - HOIST
      ?auto_33497 - PLACE
      ?auto_33498 - TRUCK
      ?auto_33496 - PLACE
      ?auto_33500 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33499 ?auto_33497 ) ( SURFACE-AT ?auto_33494 ?auto_33497 ) ( CLEAR ?auto_33494 ) ( IS-CRATE ?auto_33495 ) ( not ( = ?auto_33494 ?auto_33495 ) ) ( AVAILABLE ?auto_33499 ) ( ON ?auto_33494 ?auto_33493 ) ( not ( = ?auto_33493 ?auto_33494 ) ) ( not ( = ?auto_33493 ?auto_33495 ) ) ( TRUCK-AT ?auto_33498 ?auto_33496 ) ( not ( = ?auto_33496 ?auto_33497 ) ) ( HOIST-AT ?auto_33500 ?auto_33496 ) ( LIFTING ?auto_33500 ?auto_33495 ) ( not ( = ?auto_33499 ?auto_33500 ) ) ( ON ?auto_33493 ?auto_33492 ) ( not ( = ?auto_33492 ?auto_33493 ) ) ( not ( = ?auto_33492 ?auto_33494 ) ) ( not ( = ?auto_33492 ?auto_33495 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33493 ?auto_33494 ?auto_33495 )
      ( MAKE-3CRATE-VERIFY ?auto_33492 ?auto_33493 ?auto_33494 ?auto_33495 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33519 - SURFACE
      ?auto_33520 - SURFACE
      ?auto_33521 - SURFACE
      ?auto_33522 - SURFACE
    )
    :vars
    (
      ?auto_33525 - HOIST
      ?auto_33528 - PLACE
      ?auto_33524 - TRUCK
      ?auto_33526 - PLACE
      ?auto_33523 - HOIST
      ?auto_33527 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33525 ?auto_33528 ) ( SURFACE-AT ?auto_33521 ?auto_33528 ) ( CLEAR ?auto_33521 ) ( IS-CRATE ?auto_33522 ) ( not ( = ?auto_33521 ?auto_33522 ) ) ( AVAILABLE ?auto_33525 ) ( ON ?auto_33521 ?auto_33520 ) ( not ( = ?auto_33520 ?auto_33521 ) ) ( not ( = ?auto_33520 ?auto_33522 ) ) ( TRUCK-AT ?auto_33524 ?auto_33526 ) ( not ( = ?auto_33526 ?auto_33528 ) ) ( HOIST-AT ?auto_33523 ?auto_33526 ) ( not ( = ?auto_33525 ?auto_33523 ) ) ( AVAILABLE ?auto_33523 ) ( SURFACE-AT ?auto_33522 ?auto_33526 ) ( ON ?auto_33522 ?auto_33527 ) ( CLEAR ?auto_33522 ) ( not ( = ?auto_33521 ?auto_33527 ) ) ( not ( = ?auto_33522 ?auto_33527 ) ) ( not ( = ?auto_33520 ?auto_33527 ) ) ( ON ?auto_33520 ?auto_33519 ) ( not ( = ?auto_33519 ?auto_33520 ) ) ( not ( = ?auto_33519 ?auto_33521 ) ) ( not ( = ?auto_33519 ?auto_33522 ) ) ( not ( = ?auto_33519 ?auto_33527 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33520 ?auto_33521 ?auto_33522 )
      ( MAKE-3CRATE-VERIFY ?auto_33519 ?auto_33520 ?auto_33521 ?auto_33522 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33547 - SURFACE
      ?auto_33548 - SURFACE
      ?auto_33549 - SURFACE
      ?auto_33550 - SURFACE
    )
    :vars
    (
      ?auto_33554 - HOIST
      ?auto_33551 - PLACE
      ?auto_33553 - PLACE
      ?auto_33556 - HOIST
      ?auto_33552 - SURFACE
      ?auto_33555 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33554 ?auto_33551 ) ( SURFACE-AT ?auto_33549 ?auto_33551 ) ( CLEAR ?auto_33549 ) ( IS-CRATE ?auto_33550 ) ( not ( = ?auto_33549 ?auto_33550 ) ) ( AVAILABLE ?auto_33554 ) ( ON ?auto_33549 ?auto_33548 ) ( not ( = ?auto_33548 ?auto_33549 ) ) ( not ( = ?auto_33548 ?auto_33550 ) ) ( not ( = ?auto_33553 ?auto_33551 ) ) ( HOIST-AT ?auto_33556 ?auto_33553 ) ( not ( = ?auto_33554 ?auto_33556 ) ) ( AVAILABLE ?auto_33556 ) ( SURFACE-AT ?auto_33550 ?auto_33553 ) ( ON ?auto_33550 ?auto_33552 ) ( CLEAR ?auto_33550 ) ( not ( = ?auto_33549 ?auto_33552 ) ) ( not ( = ?auto_33550 ?auto_33552 ) ) ( not ( = ?auto_33548 ?auto_33552 ) ) ( TRUCK-AT ?auto_33555 ?auto_33551 ) ( ON ?auto_33548 ?auto_33547 ) ( not ( = ?auto_33547 ?auto_33548 ) ) ( not ( = ?auto_33547 ?auto_33549 ) ) ( not ( = ?auto_33547 ?auto_33550 ) ) ( not ( = ?auto_33547 ?auto_33552 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33548 ?auto_33549 ?auto_33550 )
      ( MAKE-3CRATE-VERIFY ?auto_33547 ?auto_33548 ?auto_33549 ?auto_33550 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33575 - SURFACE
      ?auto_33576 - SURFACE
      ?auto_33577 - SURFACE
      ?auto_33578 - SURFACE
    )
    :vars
    (
      ?auto_33580 - HOIST
      ?auto_33583 - PLACE
      ?auto_33584 - PLACE
      ?auto_33582 - HOIST
      ?auto_33579 - SURFACE
      ?auto_33581 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33580 ?auto_33583 ) ( IS-CRATE ?auto_33578 ) ( not ( = ?auto_33577 ?auto_33578 ) ) ( not ( = ?auto_33576 ?auto_33577 ) ) ( not ( = ?auto_33576 ?auto_33578 ) ) ( not ( = ?auto_33584 ?auto_33583 ) ) ( HOIST-AT ?auto_33582 ?auto_33584 ) ( not ( = ?auto_33580 ?auto_33582 ) ) ( AVAILABLE ?auto_33582 ) ( SURFACE-AT ?auto_33578 ?auto_33584 ) ( ON ?auto_33578 ?auto_33579 ) ( CLEAR ?auto_33578 ) ( not ( = ?auto_33577 ?auto_33579 ) ) ( not ( = ?auto_33578 ?auto_33579 ) ) ( not ( = ?auto_33576 ?auto_33579 ) ) ( TRUCK-AT ?auto_33581 ?auto_33583 ) ( SURFACE-AT ?auto_33576 ?auto_33583 ) ( CLEAR ?auto_33576 ) ( LIFTING ?auto_33580 ?auto_33577 ) ( IS-CRATE ?auto_33577 ) ( ON ?auto_33576 ?auto_33575 ) ( not ( = ?auto_33575 ?auto_33576 ) ) ( not ( = ?auto_33575 ?auto_33577 ) ) ( not ( = ?auto_33575 ?auto_33578 ) ) ( not ( = ?auto_33575 ?auto_33579 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33576 ?auto_33577 ?auto_33578 )
      ( MAKE-3CRATE-VERIFY ?auto_33575 ?auto_33576 ?auto_33577 ?auto_33578 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33603 - SURFACE
      ?auto_33604 - SURFACE
      ?auto_33605 - SURFACE
      ?auto_33606 - SURFACE
    )
    :vars
    (
      ?auto_33609 - HOIST
      ?auto_33608 - PLACE
      ?auto_33610 - PLACE
      ?auto_33612 - HOIST
      ?auto_33611 - SURFACE
      ?auto_33607 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33609 ?auto_33608 ) ( IS-CRATE ?auto_33606 ) ( not ( = ?auto_33605 ?auto_33606 ) ) ( not ( = ?auto_33604 ?auto_33605 ) ) ( not ( = ?auto_33604 ?auto_33606 ) ) ( not ( = ?auto_33610 ?auto_33608 ) ) ( HOIST-AT ?auto_33612 ?auto_33610 ) ( not ( = ?auto_33609 ?auto_33612 ) ) ( AVAILABLE ?auto_33612 ) ( SURFACE-AT ?auto_33606 ?auto_33610 ) ( ON ?auto_33606 ?auto_33611 ) ( CLEAR ?auto_33606 ) ( not ( = ?auto_33605 ?auto_33611 ) ) ( not ( = ?auto_33606 ?auto_33611 ) ) ( not ( = ?auto_33604 ?auto_33611 ) ) ( TRUCK-AT ?auto_33607 ?auto_33608 ) ( SURFACE-AT ?auto_33604 ?auto_33608 ) ( CLEAR ?auto_33604 ) ( IS-CRATE ?auto_33605 ) ( AVAILABLE ?auto_33609 ) ( IN ?auto_33605 ?auto_33607 ) ( ON ?auto_33604 ?auto_33603 ) ( not ( = ?auto_33603 ?auto_33604 ) ) ( not ( = ?auto_33603 ?auto_33605 ) ) ( not ( = ?auto_33603 ?auto_33606 ) ) ( not ( = ?auto_33603 ?auto_33611 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33604 ?auto_33605 ?auto_33606 )
      ( MAKE-3CRATE-VERIFY ?auto_33603 ?auto_33604 ?auto_33605 ?auto_33606 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33788 - SURFACE
      ?auto_33789 - SURFACE
    )
    :vars
    (
      ?auto_33794 - HOIST
      ?auto_33791 - PLACE
      ?auto_33792 - SURFACE
      ?auto_33793 - TRUCK
      ?auto_33790 - PLACE
      ?auto_33795 - HOIST
      ?auto_33796 - SURFACE
      ?auto_33797 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33794 ?auto_33791 ) ( SURFACE-AT ?auto_33788 ?auto_33791 ) ( CLEAR ?auto_33788 ) ( IS-CRATE ?auto_33789 ) ( not ( = ?auto_33788 ?auto_33789 ) ) ( AVAILABLE ?auto_33794 ) ( ON ?auto_33788 ?auto_33792 ) ( not ( = ?auto_33792 ?auto_33788 ) ) ( not ( = ?auto_33792 ?auto_33789 ) ) ( TRUCK-AT ?auto_33793 ?auto_33790 ) ( not ( = ?auto_33790 ?auto_33791 ) ) ( HOIST-AT ?auto_33795 ?auto_33790 ) ( not ( = ?auto_33794 ?auto_33795 ) ) ( SURFACE-AT ?auto_33789 ?auto_33790 ) ( ON ?auto_33789 ?auto_33796 ) ( CLEAR ?auto_33789 ) ( not ( = ?auto_33788 ?auto_33796 ) ) ( not ( = ?auto_33789 ?auto_33796 ) ) ( not ( = ?auto_33792 ?auto_33796 ) ) ( LIFTING ?auto_33795 ?auto_33797 ) ( IS-CRATE ?auto_33797 ) ( not ( = ?auto_33788 ?auto_33797 ) ) ( not ( = ?auto_33789 ?auto_33797 ) ) ( not ( = ?auto_33792 ?auto_33797 ) ) ( not ( = ?auto_33796 ?auto_33797 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33795 ?auto_33797 ?auto_33793 ?auto_33790 )
      ( MAKE-1CRATE ?auto_33788 ?auto_33789 )
      ( MAKE-1CRATE-VERIFY ?auto_33788 ?auto_33789 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33896 - SURFACE
      ?auto_33897 - SURFACE
      ?auto_33898 - SURFACE
      ?auto_33900 - SURFACE
      ?auto_33899 - SURFACE
    )
    :vars
    (
      ?auto_33901 - HOIST
      ?auto_33902 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33901 ?auto_33902 ) ( SURFACE-AT ?auto_33900 ?auto_33902 ) ( CLEAR ?auto_33900 ) ( LIFTING ?auto_33901 ?auto_33899 ) ( IS-CRATE ?auto_33899 ) ( not ( = ?auto_33900 ?auto_33899 ) ) ( ON ?auto_33897 ?auto_33896 ) ( ON ?auto_33898 ?auto_33897 ) ( ON ?auto_33900 ?auto_33898 ) ( not ( = ?auto_33896 ?auto_33897 ) ) ( not ( = ?auto_33896 ?auto_33898 ) ) ( not ( = ?auto_33896 ?auto_33900 ) ) ( not ( = ?auto_33896 ?auto_33899 ) ) ( not ( = ?auto_33897 ?auto_33898 ) ) ( not ( = ?auto_33897 ?auto_33900 ) ) ( not ( = ?auto_33897 ?auto_33899 ) ) ( not ( = ?auto_33898 ?auto_33900 ) ) ( not ( = ?auto_33898 ?auto_33899 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33900 ?auto_33899 )
      ( MAKE-4CRATE-VERIFY ?auto_33896 ?auto_33897 ?auto_33898 ?auto_33900 ?auto_33899 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33921 - SURFACE
      ?auto_33922 - SURFACE
      ?auto_33923 - SURFACE
      ?auto_33925 - SURFACE
      ?auto_33924 - SURFACE
    )
    :vars
    (
      ?auto_33928 - HOIST
      ?auto_33927 - PLACE
      ?auto_33926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33928 ?auto_33927 ) ( SURFACE-AT ?auto_33925 ?auto_33927 ) ( CLEAR ?auto_33925 ) ( IS-CRATE ?auto_33924 ) ( not ( = ?auto_33925 ?auto_33924 ) ) ( TRUCK-AT ?auto_33926 ?auto_33927 ) ( AVAILABLE ?auto_33928 ) ( IN ?auto_33924 ?auto_33926 ) ( ON ?auto_33925 ?auto_33923 ) ( not ( = ?auto_33923 ?auto_33925 ) ) ( not ( = ?auto_33923 ?auto_33924 ) ) ( ON ?auto_33922 ?auto_33921 ) ( ON ?auto_33923 ?auto_33922 ) ( not ( = ?auto_33921 ?auto_33922 ) ) ( not ( = ?auto_33921 ?auto_33923 ) ) ( not ( = ?auto_33921 ?auto_33925 ) ) ( not ( = ?auto_33921 ?auto_33924 ) ) ( not ( = ?auto_33922 ?auto_33923 ) ) ( not ( = ?auto_33922 ?auto_33925 ) ) ( not ( = ?auto_33922 ?auto_33924 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33923 ?auto_33925 ?auto_33924 )
      ( MAKE-4CRATE-VERIFY ?auto_33921 ?auto_33922 ?auto_33923 ?auto_33925 ?auto_33924 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33951 - SURFACE
      ?auto_33952 - SURFACE
      ?auto_33953 - SURFACE
      ?auto_33955 - SURFACE
      ?auto_33954 - SURFACE
    )
    :vars
    (
      ?auto_33956 - HOIST
      ?auto_33957 - PLACE
      ?auto_33958 - TRUCK
      ?auto_33959 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33956 ?auto_33957 ) ( SURFACE-AT ?auto_33955 ?auto_33957 ) ( CLEAR ?auto_33955 ) ( IS-CRATE ?auto_33954 ) ( not ( = ?auto_33955 ?auto_33954 ) ) ( AVAILABLE ?auto_33956 ) ( IN ?auto_33954 ?auto_33958 ) ( ON ?auto_33955 ?auto_33953 ) ( not ( = ?auto_33953 ?auto_33955 ) ) ( not ( = ?auto_33953 ?auto_33954 ) ) ( TRUCK-AT ?auto_33958 ?auto_33959 ) ( not ( = ?auto_33959 ?auto_33957 ) ) ( ON ?auto_33952 ?auto_33951 ) ( ON ?auto_33953 ?auto_33952 ) ( not ( = ?auto_33951 ?auto_33952 ) ) ( not ( = ?auto_33951 ?auto_33953 ) ) ( not ( = ?auto_33951 ?auto_33955 ) ) ( not ( = ?auto_33951 ?auto_33954 ) ) ( not ( = ?auto_33952 ?auto_33953 ) ) ( not ( = ?auto_33952 ?auto_33955 ) ) ( not ( = ?auto_33952 ?auto_33954 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33953 ?auto_33955 ?auto_33954 )
      ( MAKE-4CRATE-VERIFY ?auto_33951 ?auto_33952 ?auto_33953 ?auto_33955 ?auto_33954 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33985 - SURFACE
      ?auto_33986 - SURFACE
      ?auto_33987 - SURFACE
      ?auto_33989 - SURFACE
      ?auto_33988 - SURFACE
    )
    :vars
    (
      ?auto_33994 - HOIST
      ?auto_33992 - PLACE
      ?auto_33993 - TRUCK
      ?auto_33990 - PLACE
      ?auto_33991 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33994 ?auto_33992 ) ( SURFACE-AT ?auto_33989 ?auto_33992 ) ( CLEAR ?auto_33989 ) ( IS-CRATE ?auto_33988 ) ( not ( = ?auto_33989 ?auto_33988 ) ) ( AVAILABLE ?auto_33994 ) ( ON ?auto_33989 ?auto_33987 ) ( not ( = ?auto_33987 ?auto_33989 ) ) ( not ( = ?auto_33987 ?auto_33988 ) ) ( TRUCK-AT ?auto_33993 ?auto_33990 ) ( not ( = ?auto_33990 ?auto_33992 ) ) ( HOIST-AT ?auto_33991 ?auto_33990 ) ( LIFTING ?auto_33991 ?auto_33988 ) ( not ( = ?auto_33994 ?auto_33991 ) ) ( ON ?auto_33986 ?auto_33985 ) ( ON ?auto_33987 ?auto_33986 ) ( not ( = ?auto_33985 ?auto_33986 ) ) ( not ( = ?auto_33985 ?auto_33987 ) ) ( not ( = ?auto_33985 ?auto_33989 ) ) ( not ( = ?auto_33985 ?auto_33988 ) ) ( not ( = ?auto_33986 ?auto_33987 ) ) ( not ( = ?auto_33986 ?auto_33989 ) ) ( not ( = ?auto_33986 ?auto_33988 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33987 ?auto_33989 ?auto_33988 )
      ( MAKE-4CRATE-VERIFY ?auto_33985 ?auto_33986 ?auto_33987 ?auto_33989 ?auto_33988 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34023 - SURFACE
      ?auto_34024 - SURFACE
      ?auto_34025 - SURFACE
      ?auto_34027 - SURFACE
      ?auto_34026 - SURFACE
    )
    :vars
    (
      ?auto_34033 - HOIST
      ?auto_34028 - PLACE
      ?auto_34032 - TRUCK
      ?auto_34030 - PLACE
      ?auto_34031 - HOIST
      ?auto_34029 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34033 ?auto_34028 ) ( SURFACE-AT ?auto_34027 ?auto_34028 ) ( CLEAR ?auto_34027 ) ( IS-CRATE ?auto_34026 ) ( not ( = ?auto_34027 ?auto_34026 ) ) ( AVAILABLE ?auto_34033 ) ( ON ?auto_34027 ?auto_34025 ) ( not ( = ?auto_34025 ?auto_34027 ) ) ( not ( = ?auto_34025 ?auto_34026 ) ) ( TRUCK-AT ?auto_34032 ?auto_34030 ) ( not ( = ?auto_34030 ?auto_34028 ) ) ( HOIST-AT ?auto_34031 ?auto_34030 ) ( not ( = ?auto_34033 ?auto_34031 ) ) ( AVAILABLE ?auto_34031 ) ( SURFACE-AT ?auto_34026 ?auto_34030 ) ( ON ?auto_34026 ?auto_34029 ) ( CLEAR ?auto_34026 ) ( not ( = ?auto_34027 ?auto_34029 ) ) ( not ( = ?auto_34026 ?auto_34029 ) ) ( not ( = ?auto_34025 ?auto_34029 ) ) ( ON ?auto_34024 ?auto_34023 ) ( ON ?auto_34025 ?auto_34024 ) ( not ( = ?auto_34023 ?auto_34024 ) ) ( not ( = ?auto_34023 ?auto_34025 ) ) ( not ( = ?auto_34023 ?auto_34027 ) ) ( not ( = ?auto_34023 ?auto_34026 ) ) ( not ( = ?auto_34023 ?auto_34029 ) ) ( not ( = ?auto_34024 ?auto_34025 ) ) ( not ( = ?auto_34024 ?auto_34027 ) ) ( not ( = ?auto_34024 ?auto_34026 ) ) ( not ( = ?auto_34024 ?auto_34029 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34025 ?auto_34027 ?auto_34026 )
      ( MAKE-4CRATE-VERIFY ?auto_34023 ?auto_34024 ?auto_34025 ?auto_34027 ?auto_34026 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34062 - SURFACE
      ?auto_34063 - SURFACE
      ?auto_34064 - SURFACE
      ?auto_34066 - SURFACE
      ?auto_34065 - SURFACE
    )
    :vars
    (
      ?auto_34071 - HOIST
      ?auto_34070 - PLACE
      ?auto_34068 - PLACE
      ?auto_34072 - HOIST
      ?auto_34067 - SURFACE
      ?auto_34069 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34071 ?auto_34070 ) ( SURFACE-AT ?auto_34066 ?auto_34070 ) ( CLEAR ?auto_34066 ) ( IS-CRATE ?auto_34065 ) ( not ( = ?auto_34066 ?auto_34065 ) ) ( AVAILABLE ?auto_34071 ) ( ON ?auto_34066 ?auto_34064 ) ( not ( = ?auto_34064 ?auto_34066 ) ) ( not ( = ?auto_34064 ?auto_34065 ) ) ( not ( = ?auto_34068 ?auto_34070 ) ) ( HOIST-AT ?auto_34072 ?auto_34068 ) ( not ( = ?auto_34071 ?auto_34072 ) ) ( AVAILABLE ?auto_34072 ) ( SURFACE-AT ?auto_34065 ?auto_34068 ) ( ON ?auto_34065 ?auto_34067 ) ( CLEAR ?auto_34065 ) ( not ( = ?auto_34066 ?auto_34067 ) ) ( not ( = ?auto_34065 ?auto_34067 ) ) ( not ( = ?auto_34064 ?auto_34067 ) ) ( TRUCK-AT ?auto_34069 ?auto_34070 ) ( ON ?auto_34063 ?auto_34062 ) ( ON ?auto_34064 ?auto_34063 ) ( not ( = ?auto_34062 ?auto_34063 ) ) ( not ( = ?auto_34062 ?auto_34064 ) ) ( not ( = ?auto_34062 ?auto_34066 ) ) ( not ( = ?auto_34062 ?auto_34065 ) ) ( not ( = ?auto_34062 ?auto_34067 ) ) ( not ( = ?auto_34063 ?auto_34064 ) ) ( not ( = ?auto_34063 ?auto_34066 ) ) ( not ( = ?auto_34063 ?auto_34065 ) ) ( not ( = ?auto_34063 ?auto_34067 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34064 ?auto_34066 ?auto_34065 )
      ( MAKE-4CRATE-VERIFY ?auto_34062 ?auto_34063 ?auto_34064 ?auto_34066 ?auto_34065 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34101 - SURFACE
      ?auto_34102 - SURFACE
      ?auto_34103 - SURFACE
      ?auto_34105 - SURFACE
      ?auto_34104 - SURFACE
    )
    :vars
    (
      ?auto_34109 - HOIST
      ?auto_34106 - PLACE
      ?auto_34107 - PLACE
      ?auto_34110 - HOIST
      ?auto_34108 - SURFACE
      ?auto_34111 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34109 ?auto_34106 ) ( IS-CRATE ?auto_34104 ) ( not ( = ?auto_34105 ?auto_34104 ) ) ( not ( = ?auto_34103 ?auto_34105 ) ) ( not ( = ?auto_34103 ?auto_34104 ) ) ( not ( = ?auto_34107 ?auto_34106 ) ) ( HOIST-AT ?auto_34110 ?auto_34107 ) ( not ( = ?auto_34109 ?auto_34110 ) ) ( AVAILABLE ?auto_34110 ) ( SURFACE-AT ?auto_34104 ?auto_34107 ) ( ON ?auto_34104 ?auto_34108 ) ( CLEAR ?auto_34104 ) ( not ( = ?auto_34105 ?auto_34108 ) ) ( not ( = ?auto_34104 ?auto_34108 ) ) ( not ( = ?auto_34103 ?auto_34108 ) ) ( TRUCK-AT ?auto_34111 ?auto_34106 ) ( SURFACE-AT ?auto_34103 ?auto_34106 ) ( CLEAR ?auto_34103 ) ( LIFTING ?auto_34109 ?auto_34105 ) ( IS-CRATE ?auto_34105 ) ( ON ?auto_34102 ?auto_34101 ) ( ON ?auto_34103 ?auto_34102 ) ( not ( = ?auto_34101 ?auto_34102 ) ) ( not ( = ?auto_34101 ?auto_34103 ) ) ( not ( = ?auto_34101 ?auto_34105 ) ) ( not ( = ?auto_34101 ?auto_34104 ) ) ( not ( = ?auto_34101 ?auto_34108 ) ) ( not ( = ?auto_34102 ?auto_34103 ) ) ( not ( = ?auto_34102 ?auto_34105 ) ) ( not ( = ?auto_34102 ?auto_34104 ) ) ( not ( = ?auto_34102 ?auto_34108 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34103 ?auto_34105 ?auto_34104 )
      ( MAKE-4CRATE-VERIFY ?auto_34101 ?auto_34102 ?auto_34103 ?auto_34105 ?auto_34104 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34140 - SURFACE
      ?auto_34141 - SURFACE
      ?auto_34142 - SURFACE
      ?auto_34144 - SURFACE
      ?auto_34143 - SURFACE
    )
    :vars
    (
      ?auto_34149 - HOIST
      ?auto_34145 - PLACE
      ?auto_34147 - PLACE
      ?auto_34150 - HOIST
      ?auto_34148 - SURFACE
      ?auto_34146 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34149 ?auto_34145 ) ( IS-CRATE ?auto_34143 ) ( not ( = ?auto_34144 ?auto_34143 ) ) ( not ( = ?auto_34142 ?auto_34144 ) ) ( not ( = ?auto_34142 ?auto_34143 ) ) ( not ( = ?auto_34147 ?auto_34145 ) ) ( HOIST-AT ?auto_34150 ?auto_34147 ) ( not ( = ?auto_34149 ?auto_34150 ) ) ( AVAILABLE ?auto_34150 ) ( SURFACE-AT ?auto_34143 ?auto_34147 ) ( ON ?auto_34143 ?auto_34148 ) ( CLEAR ?auto_34143 ) ( not ( = ?auto_34144 ?auto_34148 ) ) ( not ( = ?auto_34143 ?auto_34148 ) ) ( not ( = ?auto_34142 ?auto_34148 ) ) ( TRUCK-AT ?auto_34146 ?auto_34145 ) ( SURFACE-AT ?auto_34142 ?auto_34145 ) ( CLEAR ?auto_34142 ) ( IS-CRATE ?auto_34144 ) ( AVAILABLE ?auto_34149 ) ( IN ?auto_34144 ?auto_34146 ) ( ON ?auto_34141 ?auto_34140 ) ( ON ?auto_34142 ?auto_34141 ) ( not ( = ?auto_34140 ?auto_34141 ) ) ( not ( = ?auto_34140 ?auto_34142 ) ) ( not ( = ?auto_34140 ?auto_34144 ) ) ( not ( = ?auto_34140 ?auto_34143 ) ) ( not ( = ?auto_34140 ?auto_34148 ) ) ( not ( = ?auto_34141 ?auto_34142 ) ) ( not ( = ?auto_34141 ?auto_34144 ) ) ( not ( = ?auto_34141 ?auto_34143 ) ) ( not ( = ?auto_34141 ?auto_34148 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34142 ?auto_34144 ?auto_34143 )
      ( MAKE-4CRATE-VERIFY ?auto_34140 ?auto_34141 ?auto_34142 ?auto_34144 ?auto_34143 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34640 - SURFACE
      ?auto_34641 - SURFACE
    )
    :vars
    (
      ?auto_34648 - HOIST
      ?auto_34647 - PLACE
      ?auto_34645 - SURFACE
      ?auto_34643 - PLACE
      ?auto_34642 - HOIST
      ?auto_34644 - SURFACE
      ?auto_34646 - TRUCK
      ?auto_34649 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34648 ?auto_34647 ) ( SURFACE-AT ?auto_34640 ?auto_34647 ) ( CLEAR ?auto_34640 ) ( IS-CRATE ?auto_34641 ) ( not ( = ?auto_34640 ?auto_34641 ) ) ( ON ?auto_34640 ?auto_34645 ) ( not ( = ?auto_34645 ?auto_34640 ) ) ( not ( = ?auto_34645 ?auto_34641 ) ) ( not ( = ?auto_34643 ?auto_34647 ) ) ( HOIST-AT ?auto_34642 ?auto_34643 ) ( not ( = ?auto_34648 ?auto_34642 ) ) ( AVAILABLE ?auto_34642 ) ( SURFACE-AT ?auto_34641 ?auto_34643 ) ( ON ?auto_34641 ?auto_34644 ) ( CLEAR ?auto_34641 ) ( not ( = ?auto_34640 ?auto_34644 ) ) ( not ( = ?auto_34641 ?auto_34644 ) ) ( not ( = ?auto_34645 ?auto_34644 ) ) ( TRUCK-AT ?auto_34646 ?auto_34647 ) ( LIFTING ?auto_34648 ?auto_34649 ) ( IS-CRATE ?auto_34649 ) ( not ( = ?auto_34640 ?auto_34649 ) ) ( not ( = ?auto_34641 ?auto_34649 ) ) ( not ( = ?auto_34645 ?auto_34649 ) ) ( not ( = ?auto_34644 ?auto_34649 ) ) )
    :subtasks
    ( ( !LOAD ?auto_34648 ?auto_34649 ?auto_34646 ?auto_34647 )
      ( MAKE-1CRATE ?auto_34640 ?auto_34641 )
      ( MAKE-1CRATE-VERIFY ?auto_34640 ?auto_34641 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34799 - SURFACE
      ?auto_34800 - SURFACE
      ?auto_34801 - SURFACE
      ?auto_34803 - SURFACE
      ?auto_34802 - SURFACE
      ?auto_34804 - SURFACE
    )
    :vars
    (
      ?auto_34806 - HOIST
      ?auto_34805 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34806 ?auto_34805 ) ( SURFACE-AT ?auto_34802 ?auto_34805 ) ( CLEAR ?auto_34802 ) ( LIFTING ?auto_34806 ?auto_34804 ) ( IS-CRATE ?auto_34804 ) ( not ( = ?auto_34802 ?auto_34804 ) ) ( ON ?auto_34800 ?auto_34799 ) ( ON ?auto_34801 ?auto_34800 ) ( ON ?auto_34803 ?auto_34801 ) ( ON ?auto_34802 ?auto_34803 ) ( not ( = ?auto_34799 ?auto_34800 ) ) ( not ( = ?auto_34799 ?auto_34801 ) ) ( not ( = ?auto_34799 ?auto_34803 ) ) ( not ( = ?auto_34799 ?auto_34802 ) ) ( not ( = ?auto_34799 ?auto_34804 ) ) ( not ( = ?auto_34800 ?auto_34801 ) ) ( not ( = ?auto_34800 ?auto_34803 ) ) ( not ( = ?auto_34800 ?auto_34802 ) ) ( not ( = ?auto_34800 ?auto_34804 ) ) ( not ( = ?auto_34801 ?auto_34803 ) ) ( not ( = ?auto_34801 ?auto_34802 ) ) ( not ( = ?auto_34801 ?auto_34804 ) ) ( not ( = ?auto_34803 ?auto_34802 ) ) ( not ( = ?auto_34803 ?auto_34804 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34802 ?auto_34804 )
      ( MAKE-5CRATE-VERIFY ?auto_34799 ?auto_34800 ?auto_34801 ?auto_34803 ?auto_34802 ?auto_34804 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34833 - SURFACE
      ?auto_34834 - SURFACE
      ?auto_34835 - SURFACE
      ?auto_34837 - SURFACE
      ?auto_34836 - SURFACE
      ?auto_34838 - SURFACE
    )
    :vars
    (
      ?auto_34841 - HOIST
      ?auto_34840 - PLACE
      ?auto_34839 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34841 ?auto_34840 ) ( SURFACE-AT ?auto_34836 ?auto_34840 ) ( CLEAR ?auto_34836 ) ( IS-CRATE ?auto_34838 ) ( not ( = ?auto_34836 ?auto_34838 ) ) ( TRUCK-AT ?auto_34839 ?auto_34840 ) ( AVAILABLE ?auto_34841 ) ( IN ?auto_34838 ?auto_34839 ) ( ON ?auto_34836 ?auto_34837 ) ( not ( = ?auto_34837 ?auto_34836 ) ) ( not ( = ?auto_34837 ?auto_34838 ) ) ( ON ?auto_34834 ?auto_34833 ) ( ON ?auto_34835 ?auto_34834 ) ( ON ?auto_34837 ?auto_34835 ) ( not ( = ?auto_34833 ?auto_34834 ) ) ( not ( = ?auto_34833 ?auto_34835 ) ) ( not ( = ?auto_34833 ?auto_34837 ) ) ( not ( = ?auto_34833 ?auto_34836 ) ) ( not ( = ?auto_34833 ?auto_34838 ) ) ( not ( = ?auto_34834 ?auto_34835 ) ) ( not ( = ?auto_34834 ?auto_34837 ) ) ( not ( = ?auto_34834 ?auto_34836 ) ) ( not ( = ?auto_34834 ?auto_34838 ) ) ( not ( = ?auto_34835 ?auto_34837 ) ) ( not ( = ?auto_34835 ?auto_34836 ) ) ( not ( = ?auto_34835 ?auto_34838 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34837 ?auto_34836 ?auto_34838 )
      ( MAKE-5CRATE-VERIFY ?auto_34833 ?auto_34834 ?auto_34835 ?auto_34837 ?auto_34836 ?auto_34838 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34873 - SURFACE
      ?auto_34874 - SURFACE
      ?auto_34875 - SURFACE
      ?auto_34877 - SURFACE
      ?auto_34876 - SURFACE
      ?auto_34878 - SURFACE
    )
    :vars
    (
      ?auto_34881 - HOIST
      ?auto_34879 - PLACE
      ?auto_34882 - TRUCK
      ?auto_34880 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34881 ?auto_34879 ) ( SURFACE-AT ?auto_34876 ?auto_34879 ) ( CLEAR ?auto_34876 ) ( IS-CRATE ?auto_34878 ) ( not ( = ?auto_34876 ?auto_34878 ) ) ( AVAILABLE ?auto_34881 ) ( IN ?auto_34878 ?auto_34882 ) ( ON ?auto_34876 ?auto_34877 ) ( not ( = ?auto_34877 ?auto_34876 ) ) ( not ( = ?auto_34877 ?auto_34878 ) ) ( TRUCK-AT ?auto_34882 ?auto_34880 ) ( not ( = ?auto_34880 ?auto_34879 ) ) ( ON ?auto_34874 ?auto_34873 ) ( ON ?auto_34875 ?auto_34874 ) ( ON ?auto_34877 ?auto_34875 ) ( not ( = ?auto_34873 ?auto_34874 ) ) ( not ( = ?auto_34873 ?auto_34875 ) ) ( not ( = ?auto_34873 ?auto_34877 ) ) ( not ( = ?auto_34873 ?auto_34876 ) ) ( not ( = ?auto_34873 ?auto_34878 ) ) ( not ( = ?auto_34874 ?auto_34875 ) ) ( not ( = ?auto_34874 ?auto_34877 ) ) ( not ( = ?auto_34874 ?auto_34876 ) ) ( not ( = ?auto_34874 ?auto_34878 ) ) ( not ( = ?auto_34875 ?auto_34877 ) ) ( not ( = ?auto_34875 ?auto_34876 ) ) ( not ( = ?auto_34875 ?auto_34878 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34877 ?auto_34876 ?auto_34878 )
      ( MAKE-5CRATE-VERIFY ?auto_34873 ?auto_34874 ?auto_34875 ?auto_34877 ?auto_34876 ?auto_34878 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34918 - SURFACE
      ?auto_34919 - SURFACE
      ?auto_34920 - SURFACE
      ?auto_34922 - SURFACE
      ?auto_34921 - SURFACE
      ?auto_34923 - SURFACE
    )
    :vars
    (
      ?auto_34924 - HOIST
      ?auto_34928 - PLACE
      ?auto_34927 - TRUCK
      ?auto_34925 - PLACE
      ?auto_34926 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34924 ?auto_34928 ) ( SURFACE-AT ?auto_34921 ?auto_34928 ) ( CLEAR ?auto_34921 ) ( IS-CRATE ?auto_34923 ) ( not ( = ?auto_34921 ?auto_34923 ) ) ( AVAILABLE ?auto_34924 ) ( ON ?auto_34921 ?auto_34922 ) ( not ( = ?auto_34922 ?auto_34921 ) ) ( not ( = ?auto_34922 ?auto_34923 ) ) ( TRUCK-AT ?auto_34927 ?auto_34925 ) ( not ( = ?auto_34925 ?auto_34928 ) ) ( HOIST-AT ?auto_34926 ?auto_34925 ) ( LIFTING ?auto_34926 ?auto_34923 ) ( not ( = ?auto_34924 ?auto_34926 ) ) ( ON ?auto_34919 ?auto_34918 ) ( ON ?auto_34920 ?auto_34919 ) ( ON ?auto_34922 ?auto_34920 ) ( not ( = ?auto_34918 ?auto_34919 ) ) ( not ( = ?auto_34918 ?auto_34920 ) ) ( not ( = ?auto_34918 ?auto_34922 ) ) ( not ( = ?auto_34918 ?auto_34921 ) ) ( not ( = ?auto_34918 ?auto_34923 ) ) ( not ( = ?auto_34919 ?auto_34920 ) ) ( not ( = ?auto_34919 ?auto_34922 ) ) ( not ( = ?auto_34919 ?auto_34921 ) ) ( not ( = ?auto_34919 ?auto_34923 ) ) ( not ( = ?auto_34920 ?auto_34922 ) ) ( not ( = ?auto_34920 ?auto_34921 ) ) ( not ( = ?auto_34920 ?auto_34923 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34922 ?auto_34921 ?auto_34923 )
      ( MAKE-5CRATE-VERIFY ?auto_34918 ?auto_34919 ?auto_34920 ?auto_34922 ?auto_34921 ?auto_34923 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34968 - SURFACE
      ?auto_34969 - SURFACE
      ?auto_34970 - SURFACE
      ?auto_34972 - SURFACE
      ?auto_34971 - SURFACE
      ?auto_34973 - SURFACE
    )
    :vars
    (
      ?auto_34975 - HOIST
      ?auto_34974 - PLACE
      ?auto_34978 - TRUCK
      ?auto_34979 - PLACE
      ?auto_34976 - HOIST
      ?auto_34977 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34975 ?auto_34974 ) ( SURFACE-AT ?auto_34971 ?auto_34974 ) ( CLEAR ?auto_34971 ) ( IS-CRATE ?auto_34973 ) ( not ( = ?auto_34971 ?auto_34973 ) ) ( AVAILABLE ?auto_34975 ) ( ON ?auto_34971 ?auto_34972 ) ( not ( = ?auto_34972 ?auto_34971 ) ) ( not ( = ?auto_34972 ?auto_34973 ) ) ( TRUCK-AT ?auto_34978 ?auto_34979 ) ( not ( = ?auto_34979 ?auto_34974 ) ) ( HOIST-AT ?auto_34976 ?auto_34979 ) ( not ( = ?auto_34975 ?auto_34976 ) ) ( AVAILABLE ?auto_34976 ) ( SURFACE-AT ?auto_34973 ?auto_34979 ) ( ON ?auto_34973 ?auto_34977 ) ( CLEAR ?auto_34973 ) ( not ( = ?auto_34971 ?auto_34977 ) ) ( not ( = ?auto_34973 ?auto_34977 ) ) ( not ( = ?auto_34972 ?auto_34977 ) ) ( ON ?auto_34969 ?auto_34968 ) ( ON ?auto_34970 ?auto_34969 ) ( ON ?auto_34972 ?auto_34970 ) ( not ( = ?auto_34968 ?auto_34969 ) ) ( not ( = ?auto_34968 ?auto_34970 ) ) ( not ( = ?auto_34968 ?auto_34972 ) ) ( not ( = ?auto_34968 ?auto_34971 ) ) ( not ( = ?auto_34968 ?auto_34973 ) ) ( not ( = ?auto_34968 ?auto_34977 ) ) ( not ( = ?auto_34969 ?auto_34970 ) ) ( not ( = ?auto_34969 ?auto_34972 ) ) ( not ( = ?auto_34969 ?auto_34971 ) ) ( not ( = ?auto_34969 ?auto_34973 ) ) ( not ( = ?auto_34969 ?auto_34977 ) ) ( not ( = ?auto_34970 ?auto_34972 ) ) ( not ( = ?auto_34970 ?auto_34971 ) ) ( not ( = ?auto_34970 ?auto_34973 ) ) ( not ( = ?auto_34970 ?auto_34977 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34972 ?auto_34971 ?auto_34973 )
      ( MAKE-5CRATE-VERIFY ?auto_34968 ?auto_34969 ?auto_34970 ?auto_34972 ?auto_34971 ?auto_34973 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35019 - SURFACE
      ?auto_35020 - SURFACE
      ?auto_35021 - SURFACE
      ?auto_35023 - SURFACE
      ?auto_35022 - SURFACE
      ?auto_35024 - SURFACE
    )
    :vars
    (
      ?auto_35027 - HOIST
      ?auto_35028 - PLACE
      ?auto_35030 - PLACE
      ?auto_35029 - HOIST
      ?auto_35025 - SURFACE
      ?auto_35026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35027 ?auto_35028 ) ( SURFACE-AT ?auto_35022 ?auto_35028 ) ( CLEAR ?auto_35022 ) ( IS-CRATE ?auto_35024 ) ( not ( = ?auto_35022 ?auto_35024 ) ) ( AVAILABLE ?auto_35027 ) ( ON ?auto_35022 ?auto_35023 ) ( not ( = ?auto_35023 ?auto_35022 ) ) ( not ( = ?auto_35023 ?auto_35024 ) ) ( not ( = ?auto_35030 ?auto_35028 ) ) ( HOIST-AT ?auto_35029 ?auto_35030 ) ( not ( = ?auto_35027 ?auto_35029 ) ) ( AVAILABLE ?auto_35029 ) ( SURFACE-AT ?auto_35024 ?auto_35030 ) ( ON ?auto_35024 ?auto_35025 ) ( CLEAR ?auto_35024 ) ( not ( = ?auto_35022 ?auto_35025 ) ) ( not ( = ?auto_35024 ?auto_35025 ) ) ( not ( = ?auto_35023 ?auto_35025 ) ) ( TRUCK-AT ?auto_35026 ?auto_35028 ) ( ON ?auto_35020 ?auto_35019 ) ( ON ?auto_35021 ?auto_35020 ) ( ON ?auto_35023 ?auto_35021 ) ( not ( = ?auto_35019 ?auto_35020 ) ) ( not ( = ?auto_35019 ?auto_35021 ) ) ( not ( = ?auto_35019 ?auto_35023 ) ) ( not ( = ?auto_35019 ?auto_35022 ) ) ( not ( = ?auto_35019 ?auto_35024 ) ) ( not ( = ?auto_35019 ?auto_35025 ) ) ( not ( = ?auto_35020 ?auto_35021 ) ) ( not ( = ?auto_35020 ?auto_35023 ) ) ( not ( = ?auto_35020 ?auto_35022 ) ) ( not ( = ?auto_35020 ?auto_35024 ) ) ( not ( = ?auto_35020 ?auto_35025 ) ) ( not ( = ?auto_35021 ?auto_35023 ) ) ( not ( = ?auto_35021 ?auto_35022 ) ) ( not ( = ?auto_35021 ?auto_35024 ) ) ( not ( = ?auto_35021 ?auto_35025 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35023 ?auto_35022 ?auto_35024 )
      ( MAKE-5CRATE-VERIFY ?auto_35019 ?auto_35020 ?auto_35021 ?auto_35023 ?auto_35022 ?auto_35024 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35070 - SURFACE
      ?auto_35071 - SURFACE
      ?auto_35072 - SURFACE
      ?auto_35074 - SURFACE
      ?auto_35073 - SURFACE
      ?auto_35075 - SURFACE
    )
    :vars
    (
      ?auto_35077 - HOIST
      ?auto_35078 - PLACE
      ?auto_35081 - PLACE
      ?auto_35076 - HOIST
      ?auto_35079 - SURFACE
      ?auto_35080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35077 ?auto_35078 ) ( IS-CRATE ?auto_35075 ) ( not ( = ?auto_35073 ?auto_35075 ) ) ( not ( = ?auto_35074 ?auto_35073 ) ) ( not ( = ?auto_35074 ?auto_35075 ) ) ( not ( = ?auto_35081 ?auto_35078 ) ) ( HOIST-AT ?auto_35076 ?auto_35081 ) ( not ( = ?auto_35077 ?auto_35076 ) ) ( AVAILABLE ?auto_35076 ) ( SURFACE-AT ?auto_35075 ?auto_35081 ) ( ON ?auto_35075 ?auto_35079 ) ( CLEAR ?auto_35075 ) ( not ( = ?auto_35073 ?auto_35079 ) ) ( not ( = ?auto_35075 ?auto_35079 ) ) ( not ( = ?auto_35074 ?auto_35079 ) ) ( TRUCK-AT ?auto_35080 ?auto_35078 ) ( SURFACE-AT ?auto_35074 ?auto_35078 ) ( CLEAR ?auto_35074 ) ( LIFTING ?auto_35077 ?auto_35073 ) ( IS-CRATE ?auto_35073 ) ( ON ?auto_35071 ?auto_35070 ) ( ON ?auto_35072 ?auto_35071 ) ( ON ?auto_35074 ?auto_35072 ) ( not ( = ?auto_35070 ?auto_35071 ) ) ( not ( = ?auto_35070 ?auto_35072 ) ) ( not ( = ?auto_35070 ?auto_35074 ) ) ( not ( = ?auto_35070 ?auto_35073 ) ) ( not ( = ?auto_35070 ?auto_35075 ) ) ( not ( = ?auto_35070 ?auto_35079 ) ) ( not ( = ?auto_35071 ?auto_35072 ) ) ( not ( = ?auto_35071 ?auto_35074 ) ) ( not ( = ?auto_35071 ?auto_35073 ) ) ( not ( = ?auto_35071 ?auto_35075 ) ) ( not ( = ?auto_35071 ?auto_35079 ) ) ( not ( = ?auto_35072 ?auto_35074 ) ) ( not ( = ?auto_35072 ?auto_35073 ) ) ( not ( = ?auto_35072 ?auto_35075 ) ) ( not ( = ?auto_35072 ?auto_35079 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35074 ?auto_35073 ?auto_35075 )
      ( MAKE-5CRATE-VERIFY ?auto_35070 ?auto_35071 ?auto_35072 ?auto_35074 ?auto_35073 ?auto_35075 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35121 - SURFACE
      ?auto_35122 - SURFACE
      ?auto_35123 - SURFACE
      ?auto_35125 - SURFACE
      ?auto_35124 - SURFACE
      ?auto_35126 - SURFACE
    )
    :vars
    (
      ?auto_35132 - HOIST
      ?auto_35131 - PLACE
      ?auto_35130 - PLACE
      ?auto_35128 - HOIST
      ?auto_35127 - SURFACE
      ?auto_35129 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35132 ?auto_35131 ) ( IS-CRATE ?auto_35126 ) ( not ( = ?auto_35124 ?auto_35126 ) ) ( not ( = ?auto_35125 ?auto_35124 ) ) ( not ( = ?auto_35125 ?auto_35126 ) ) ( not ( = ?auto_35130 ?auto_35131 ) ) ( HOIST-AT ?auto_35128 ?auto_35130 ) ( not ( = ?auto_35132 ?auto_35128 ) ) ( AVAILABLE ?auto_35128 ) ( SURFACE-AT ?auto_35126 ?auto_35130 ) ( ON ?auto_35126 ?auto_35127 ) ( CLEAR ?auto_35126 ) ( not ( = ?auto_35124 ?auto_35127 ) ) ( not ( = ?auto_35126 ?auto_35127 ) ) ( not ( = ?auto_35125 ?auto_35127 ) ) ( TRUCK-AT ?auto_35129 ?auto_35131 ) ( SURFACE-AT ?auto_35125 ?auto_35131 ) ( CLEAR ?auto_35125 ) ( IS-CRATE ?auto_35124 ) ( AVAILABLE ?auto_35132 ) ( IN ?auto_35124 ?auto_35129 ) ( ON ?auto_35122 ?auto_35121 ) ( ON ?auto_35123 ?auto_35122 ) ( ON ?auto_35125 ?auto_35123 ) ( not ( = ?auto_35121 ?auto_35122 ) ) ( not ( = ?auto_35121 ?auto_35123 ) ) ( not ( = ?auto_35121 ?auto_35125 ) ) ( not ( = ?auto_35121 ?auto_35124 ) ) ( not ( = ?auto_35121 ?auto_35126 ) ) ( not ( = ?auto_35121 ?auto_35127 ) ) ( not ( = ?auto_35122 ?auto_35123 ) ) ( not ( = ?auto_35122 ?auto_35125 ) ) ( not ( = ?auto_35122 ?auto_35124 ) ) ( not ( = ?auto_35122 ?auto_35126 ) ) ( not ( = ?auto_35122 ?auto_35127 ) ) ( not ( = ?auto_35123 ?auto_35125 ) ) ( not ( = ?auto_35123 ?auto_35124 ) ) ( not ( = ?auto_35123 ?auto_35126 ) ) ( not ( = ?auto_35123 ?auto_35127 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35125 ?auto_35124 ?auto_35126 )
      ( MAKE-5CRATE-VERIFY ?auto_35121 ?auto_35122 ?auto_35123 ?auto_35125 ?auto_35124 ?auto_35126 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_36327 - SURFACE
      ?auto_36328 - SURFACE
      ?auto_36329 - SURFACE
      ?auto_36331 - SURFACE
      ?auto_36330 - SURFACE
      ?auto_36332 - SURFACE
      ?auto_36333 - SURFACE
    )
    :vars
    (
      ?auto_36335 - HOIST
      ?auto_36334 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36335 ?auto_36334 ) ( SURFACE-AT ?auto_36332 ?auto_36334 ) ( CLEAR ?auto_36332 ) ( LIFTING ?auto_36335 ?auto_36333 ) ( IS-CRATE ?auto_36333 ) ( not ( = ?auto_36332 ?auto_36333 ) ) ( ON ?auto_36328 ?auto_36327 ) ( ON ?auto_36329 ?auto_36328 ) ( ON ?auto_36331 ?auto_36329 ) ( ON ?auto_36330 ?auto_36331 ) ( ON ?auto_36332 ?auto_36330 ) ( not ( = ?auto_36327 ?auto_36328 ) ) ( not ( = ?auto_36327 ?auto_36329 ) ) ( not ( = ?auto_36327 ?auto_36331 ) ) ( not ( = ?auto_36327 ?auto_36330 ) ) ( not ( = ?auto_36327 ?auto_36332 ) ) ( not ( = ?auto_36327 ?auto_36333 ) ) ( not ( = ?auto_36328 ?auto_36329 ) ) ( not ( = ?auto_36328 ?auto_36331 ) ) ( not ( = ?auto_36328 ?auto_36330 ) ) ( not ( = ?auto_36328 ?auto_36332 ) ) ( not ( = ?auto_36328 ?auto_36333 ) ) ( not ( = ?auto_36329 ?auto_36331 ) ) ( not ( = ?auto_36329 ?auto_36330 ) ) ( not ( = ?auto_36329 ?auto_36332 ) ) ( not ( = ?auto_36329 ?auto_36333 ) ) ( not ( = ?auto_36331 ?auto_36330 ) ) ( not ( = ?auto_36331 ?auto_36332 ) ) ( not ( = ?auto_36331 ?auto_36333 ) ) ( not ( = ?auto_36330 ?auto_36332 ) ) ( not ( = ?auto_36330 ?auto_36333 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_36332 ?auto_36333 )
      ( MAKE-6CRATE-VERIFY ?auto_36327 ?auto_36328 ?auto_36329 ?auto_36331 ?auto_36330 ?auto_36332 ?auto_36333 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_36371 - SURFACE
      ?auto_36372 - SURFACE
      ?auto_36373 - SURFACE
      ?auto_36375 - SURFACE
      ?auto_36374 - SURFACE
      ?auto_36376 - SURFACE
      ?auto_36377 - SURFACE
    )
    :vars
    (
      ?auto_36379 - HOIST
      ?auto_36380 - PLACE
      ?auto_36378 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36379 ?auto_36380 ) ( SURFACE-AT ?auto_36376 ?auto_36380 ) ( CLEAR ?auto_36376 ) ( IS-CRATE ?auto_36377 ) ( not ( = ?auto_36376 ?auto_36377 ) ) ( TRUCK-AT ?auto_36378 ?auto_36380 ) ( AVAILABLE ?auto_36379 ) ( IN ?auto_36377 ?auto_36378 ) ( ON ?auto_36376 ?auto_36374 ) ( not ( = ?auto_36374 ?auto_36376 ) ) ( not ( = ?auto_36374 ?auto_36377 ) ) ( ON ?auto_36372 ?auto_36371 ) ( ON ?auto_36373 ?auto_36372 ) ( ON ?auto_36375 ?auto_36373 ) ( ON ?auto_36374 ?auto_36375 ) ( not ( = ?auto_36371 ?auto_36372 ) ) ( not ( = ?auto_36371 ?auto_36373 ) ) ( not ( = ?auto_36371 ?auto_36375 ) ) ( not ( = ?auto_36371 ?auto_36374 ) ) ( not ( = ?auto_36371 ?auto_36376 ) ) ( not ( = ?auto_36371 ?auto_36377 ) ) ( not ( = ?auto_36372 ?auto_36373 ) ) ( not ( = ?auto_36372 ?auto_36375 ) ) ( not ( = ?auto_36372 ?auto_36374 ) ) ( not ( = ?auto_36372 ?auto_36376 ) ) ( not ( = ?auto_36372 ?auto_36377 ) ) ( not ( = ?auto_36373 ?auto_36375 ) ) ( not ( = ?auto_36373 ?auto_36374 ) ) ( not ( = ?auto_36373 ?auto_36376 ) ) ( not ( = ?auto_36373 ?auto_36377 ) ) ( not ( = ?auto_36375 ?auto_36374 ) ) ( not ( = ?auto_36375 ?auto_36376 ) ) ( not ( = ?auto_36375 ?auto_36377 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36374 ?auto_36376 ?auto_36377 )
      ( MAKE-6CRATE-VERIFY ?auto_36371 ?auto_36372 ?auto_36373 ?auto_36375 ?auto_36374 ?auto_36376 ?auto_36377 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_36422 - SURFACE
      ?auto_36423 - SURFACE
      ?auto_36424 - SURFACE
      ?auto_36426 - SURFACE
      ?auto_36425 - SURFACE
      ?auto_36427 - SURFACE
      ?auto_36428 - SURFACE
    )
    :vars
    (
      ?auto_36430 - HOIST
      ?auto_36431 - PLACE
      ?auto_36432 - TRUCK
      ?auto_36429 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36430 ?auto_36431 ) ( SURFACE-AT ?auto_36427 ?auto_36431 ) ( CLEAR ?auto_36427 ) ( IS-CRATE ?auto_36428 ) ( not ( = ?auto_36427 ?auto_36428 ) ) ( AVAILABLE ?auto_36430 ) ( IN ?auto_36428 ?auto_36432 ) ( ON ?auto_36427 ?auto_36425 ) ( not ( = ?auto_36425 ?auto_36427 ) ) ( not ( = ?auto_36425 ?auto_36428 ) ) ( TRUCK-AT ?auto_36432 ?auto_36429 ) ( not ( = ?auto_36429 ?auto_36431 ) ) ( ON ?auto_36423 ?auto_36422 ) ( ON ?auto_36424 ?auto_36423 ) ( ON ?auto_36426 ?auto_36424 ) ( ON ?auto_36425 ?auto_36426 ) ( not ( = ?auto_36422 ?auto_36423 ) ) ( not ( = ?auto_36422 ?auto_36424 ) ) ( not ( = ?auto_36422 ?auto_36426 ) ) ( not ( = ?auto_36422 ?auto_36425 ) ) ( not ( = ?auto_36422 ?auto_36427 ) ) ( not ( = ?auto_36422 ?auto_36428 ) ) ( not ( = ?auto_36423 ?auto_36424 ) ) ( not ( = ?auto_36423 ?auto_36426 ) ) ( not ( = ?auto_36423 ?auto_36425 ) ) ( not ( = ?auto_36423 ?auto_36427 ) ) ( not ( = ?auto_36423 ?auto_36428 ) ) ( not ( = ?auto_36424 ?auto_36426 ) ) ( not ( = ?auto_36424 ?auto_36425 ) ) ( not ( = ?auto_36424 ?auto_36427 ) ) ( not ( = ?auto_36424 ?auto_36428 ) ) ( not ( = ?auto_36426 ?auto_36425 ) ) ( not ( = ?auto_36426 ?auto_36427 ) ) ( not ( = ?auto_36426 ?auto_36428 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36425 ?auto_36427 ?auto_36428 )
      ( MAKE-6CRATE-VERIFY ?auto_36422 ?auto_36423 ?auto_36424 ?auto_36426 ?auto_36425 ?auto_36427 ?auto_36428 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_36479 - SURFACE
      ?auto_36480 - SURFACE
      ?auto_36481 - SURFACE
      ?auto_36483 - SURFACE
      ?auto_36482 - SURFACE
      ?auto_36484 - SURFACE
      ?auto_36485 - SURFACE
    )
    :vars
    (
      ?auto_36487 - HOIST
      ?auto_36490 - PLACE
      ?auto_36486 - TRUCK
      ?auto_36488 - PLACE
      ?auto_36489 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_36487 ?auto_36490 ) ( SURFACE-AT ?auto_36484 ?auto_36490 ) ( CLEAR ?auto_36484 ) ( IS-CRATE ?auto_36485 ) ( not ( = ?auto_36484 ?auto_36485 ) ) ( AVAILABLE ?auto_36487 ) ( ON ?auto_36484 ?auto_36482 ) ( not ( = ?auto_36482 ?auto_36484 ) ) ( not ( = ?auto_36482 ?auto_36485 ) ) ( TRUCK-AT ?auto_36486 ?auto_36488 ) ( not ( = ?auto_36488 ?auto_36490 ) ) ( HOIST-AT ?auto_36489 ?auto_36488 ) ( LIFTING ?auto_36489 ?auto_36485 ) ( not ( = ?auto_36487 ?auto_36489 ) ) ( ON ?auto_36480 ?auto_36479 ) ( ON ?auto_36481 ?auto_36480 ) ( ON ?auto_36483 ?auto_36481 ) ( ON ?auto_36482 ?auto_36483 ) ( not ( = ?auto_36479 ?auto_36480 ) ) ( not ( = ?auto_36479 ?auto_36481 ) ) ( not ( = ?auto_36479 ?auto_36483 ) ) ( not ( = ?auto_36479 ?auto_36482 ) ) ( not ( = ?auto_36479 ?auto_36484 ) ) ( not ( = ?auto_36479 ?auto_36485 ) ) ( not ( = ?auto_36480 ?auto_36481 ) ) ( not ( = ?auto_36480 ?auto_36483 ) ) ( not ( = ?auto_36480 ?auto_36482 ) ) ( not ( = ?auto_36480 ?auto_36484 ) ) ( not ( = ?auto_36480 ?auto_36485 ) ) ( not ( = ?auto_36481 ?auto_36483 ) ) ( not ( = ?auto_36481 ?auto_36482 ) ) ( not ( = ?auto_36481 ?auto_36484 ) ) ( not ( = ?auto_36481 ?auto_36485 ) ) ( not ( = ?auto_36483 ?auto_36482 ) ) ( not ( = ?auto_36483 ?auto_36484 ) ) ( not ( = ?auto_36483 ?auto_36485 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36482 ?auto_36484 ?auto_36485 )
      ( MAKE-6CRATE-VERIFY ?auto_36479 ?auto_36480 ?auto_36481 ?auto_36483 ?auto_36482 ?auto_36484 ?auto_36485 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_36542 - SURFACE
      ?auto_36543 - SURFACE
      ?auto_36544 - SURFACE
      ?auto_36546 - SURFACE
      ?auto_36545 - SURFACE
      ?auto_36547 - SURFACE
      ?auto_36548 - SURFACE
    )
    :vars
    (
      ?auto_36550 - HOIST
      ?auto_36551 - PLACE
      ?auto_36553 - TRUCK
      ?auto_36554 - PLACE
      ?auto_36552 - HOIST
      ?auto_36549 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36550 ?auto_36551 ) ( SURFACE-AT ?auto_36547 ?auto_36551 ) ( CLEAR ?auto_36547 ) ( IS-CRATE ?auto_36548 ) ( not ( = ?auto_36547 ?auto_36548 ) ) ( AVAILABLE ?auto_36550 ) ( ON ?auto_36547 ?auto_36545 ) ( not ( = ?auto_36545 ?auto_36547 ) ) ( not ( = ?auto_36545 ?auto_36548 ) ) ( TRUCK-AT ?auto_36553 ?auto_36554 ) ( not ( = ?auto_36554 ?auto_36551 ) ) ( HOIST-AT ?auto_36552 ?auto_36554 ) ( not ( = ?auto_36550 ?auto_36552 ) ) ( AVAILABLE ?auto_36552 ) ( SURFACE-AT ?auto_36548 ?auto_36554 ) ( ON ?auto_36548 ?auto_36549 ) ( CLEAR ?auto_36548 ) ( not ( = ?auto_36547 ?auto_36549 ) ) ( not ( = ?auto_36548 ?auto_36549 ) ) ( not ( = ?auto_36545 ?auto_36549 ) ) ( ON ?auto_36543 ?auto_36542 ) ( ON ?auto_36544 ?auto_36543 ) ( ON ?auto_36546 ?auto_36544 ) ( ON ?auto_36545 ?auto_36546 ) ( not ( = ?auto_36542 ?auto_36543 ) ) ( not ( = ?auto_36542 ?auto_36544 ) ) ( not ( = ?auto_36542 ?auto_36546 ) ) ( not ( = ?auto_36542 ?auto_36545 ) ) ( not ( = ?auto_36542 ?auto_36547 ) ) ( not ( = ?auto_36542 ?auto_36548 ) ) ( not ( = ?auto_36542 ?auto_36549 ) ) ( not ( = ?auto_36543 ?auto_36544 ) ) ( not ( = ?auto_36543 ?auto_36546 ) ) ( not ( = ?auto_36543 ?auto_36545 ) ) ( not ( = ?auto_36543 ?auto_36547 ) ) ( not ( = ?auto_36543 ?auto_36548 ) ) ( not ( = ?auto_36543 ?auto_36549 ) ) ( not ( = ?auto_36544 ?auto_36546 ) ) ( not ( = ?auto_36544 ?auto_36545 ) ) ( not ( = ?auto_36544 ?auto_36547 ) ) ( not ( = ?auto_36544 ?auto_36548 ) ) ( not ( = ?auto_36544 ?auto_36549 ) ) ( not ( = ?auto_36546 ?auto_36545 ) ) ( not ( = ?auto_36546 ?auto_36547 ) ) ( not ( = ?auto_36546 ?auto_36548 ) ) ( not ( = ?auto_36546 ?auto_36549 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36545 ?auto_36547 ?auto_36548 )
      ( MAKE-6CRATE-VERIFY ?auto_36542 ?auto_36543 ?auto_36544 ?auto_36546 ?auto_36545 ?auto_36547 ?auto_36548 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_36606 - SURFACE
      ?auto_36607 - SURFACE
      ?auto_36608 - SURFACE
      ?auto_36610 - SURFACE
      ?auto_36609 - SURFACE
      ?auto_36611 - SURFACE
      ?auto_36612 - SURFACE
    )
    :vars
    (
      ?auto_36613 - HOIST
      ?auto_36615 - PLACE
      ?auto_36614 - PLACE
      ?auto_36618 - HOIST
      ?auto_36616 - SURFACE
      ?auto_36617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36613 ?auto_36615 ) ( SURFACE-AT ?auto_36611 ?auto_36615 ) ( CLEAR ?auto_36611 ) ( IS-CRATE ?auto_36612 ) ( not ( = ?auto_36611 ?auto_36612 ) ) ( AVAILABLE ?auto_36613 ) ( ON ?auto_36611 ?auto_36609 ) ( not ( = ?auto_36609 ?auto_36611 ) ) ( not ( = ?auto_36609 ?auto_36612 ) ) ( not ( = ?auto_36614 ?auto_36615 ) ) ( HOIST-AT ?auto_36618 ?auto_36614 ) ( not ( = ?auto_36613 ?auto_36618 ) ) ( AVAILABLE ?auto_36618 ) ( SURFACE-AT ?auto_36612 ?auto_36614 ) ( ON ?auto_36612 ?auto_36616 ) ( CLEAR ?auto_36612 ) ( not ( = ?auto_36611 ?auto_36616 ) ) ( not ( = ?auto_36612 ?auto_36616 ) ) ( not ( = ?auto_36609 ?auto_36616 ) ) ( TRUCK-AT ?auto_36617 ?auto_36615 ) ( ON ?auto_36607 ?auto_36606 ) ( ON ?auto_36608 ?auto_36607 ) ( ON ?auto_36610 ?auto_36608 ) ( ON ?auto_36609 ?auto_36610 ) ( not ( = ?auto_36606 ?auto_36607 ) ) ( not ( = ?auto_36606 ?auto_36608 ) ) ( not ( = ?auto_36606 ?auto_36610 ) ) ( not ( = ?auto_36606 ?auto_36609 ) ) ( not ( = ?auto_36606 ?auto_36611 ) ) ( not ( = ?auto_36606 ?auto_36612 ) ) ( not ( = ?auto_36606 ?auto_36616 ) ) ( not ( = ?auto_36607 ?auto_36608 ) ) ( not ( = ?auto_36607 ?auto_36610 ) ) ( not ( = ?auto_36607 ?auto_36609 ) ) ( not ( = ?auto_36607 ?auto_36611 ) ) ( not ( = ?auto_36607 ?auto_36612 ) ) ( not ( = ?auto_36607 ?auto_36616 ) ) ( not ( = ?auto_36608 ?auto_36610 ) ) ( not ( = ?auto_36608 ?auto_36609 ) ) ( not ( = ?auto_36608 ?auto_36611 ) ) ( not ( = ?auto_36608 ?auto_36612 ) ) ( not ( = ?auto_36608 ?auto_36616 ) ) ( not ( = ?auto_36610 ?auto_36609 ) ) ( not ( = ?auto_36610 ?auto_36611 ) ) ( not ( = ?auto_36610 ?auto_36612 ) ) ( not ( = ?auto_36610 ?auto_36616 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36609 ?auto_36611 ?auto_36612 )
      ( MAKE-6CRATE-VERIFY ?auto_36606 ?auto_36607 ?auto_36608 ?auto_36610 ?auto_36609 ?auto_36611 ?auto_36612 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_36670 - SURFACE
      ?auto_36671 - SURFACE
      ?auto_36672 - SURFACE
      ?auto_36674 - SURFACE
      ?auto_36673 - SURFACE
      ?auto_36675 - SURFACE
      ?auto_36676 - SURFACE
    )
    :vars
    (
      ?auto_36679 - HOIST
      ?auto_36680 - PLACE
      ?auto_36681 - PLACE
      ?auto_36678 - HOIST
      ?auto_36677 - SURFACE
      ?auto_36682 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36679 ?auto_36680 ) ( IS-CRATE ?auto_36676 ) ( not ( = ?auto_36675 ?auto_36676 ) ) ( not ( = ?auto_36673 ?auto_36675 ) ) ( not ( = ?auto_36673 ?auto_36676 ) ) ( not ( = ?auto_36681 ?auto_36680 ) ) ( HOIST-AT ?auto_36678 ?auto_36681 ) ( not ( = ?auto_36679 ?auto_36678 ) ) ( AVAILABLE ?auto_36678 ) ( SURFACE-AT ?auto_36676 ?auto_36681 ) ( ON ?auto_36676 ?auto_36677 ) ( CLEAR ?auto_36676 ) ( not ( = ?auto_36675 ?auto_36677 ) ) ( not ( = ?auto_36676 ?auto_36677 ) ) ( not ( = ?auto_36673 ?auto_36677 ) ) ( TRUCK-AT ?auto_36682 ?auto_36680 ) ( SURFACE-AT ?auto_36673 ?auto_36680 ) ( CLEAR ?auto_36673 ) ( LIFTING ?auto_36679 ?auto_36675 ) ( IS-CRATE ?auto_36675 ) ( ON ?auto_36671 ?auto_36670 ) ( ON ?auto_36672 ?auto_36671 ) ( ON ?auto_36674 ?auto_36672 ) ( ON ?auto_36673 ?auto_36674 ) ( not ( = ?auto_36670 ?auto_36671 ) ) ( not ( = ?auto_36670 ?auto_36672 ) ) ( not ( = ?auto_36670 ?auto_36674 ) ) ( not ( = ?auto_36670 ?auto_36673 ) ) ( not ( = ?auto_36670 ?auto_36675 ) ) ( not ( = ?auto_36670 ?auto_36676 ) ) ( not ( = ?auto_36670 ?auto_36677 ) ) ( not ( = ?auto_36671 ?auto_36672 ) ) ( not ( = ?auto_36671 ?auto_36674 ) ) ( not ( = ?auto_36671 ?auto_36673 ) ) ( not ( = ?auto_36671 ?auto_36675 ) ) ( not ( = ?auto_36671 ?auto_36676 ) ) ( not ( = ?auto_36671 ?auto_36677 ) ) ( not ( = ?auto_36672 ?auto_36674 ) ) ( not ( = ?auto_36672 ?auto_36673 ) ) ( not ( = ?auto_36672 ?auto_36675 ) ) ( not ( = ?auto_36672 ?auto_36676 ) ) ( not ( = ?auto_36672 ?auto_36677 ) ) ( not ( = ?auto_36674 ?auto_36673 ) ) ( not ( = ?auto_36674 ?auto_36675 ) ) ( not ( = ?auto_36674 ?auto_36676 ) ) ( not ( = ?auto_36674 ?auto_36677 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36673 ?auto_36675 ?auto_36676 )
      ( MAKE-6CRATE-VERIFY ?auto_36670 ?auto_36671 ?auto_36672 ?auto_36674 ?auto_36673 ?auto_36675 ?auto_36676 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_36734 - SURFACE
      ?auto_36735 - SURFACE
      ?auto_36736 - SURFACE
      ?auto_36738 - SURFACE
      ?auto_36737 - SURFACE
      ?auto_36739 - SURFACE
      ?auto_36740 - SURFACE
    )
    :vars
    (
      ?auto_36743 - HOIST
      ?auto_36744 - PLACE
      ?auto_36742 - PLACE
      ?auto_36745 - HOIST
      ?auto_36746 - SURFACE
      ?auto_36741 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36743 ?auto_36744 ) ( IS-CRATE ?auto_36740 ) ( not ( = ?auto_36739 ?auto_36740 ) ) ( not ( = ?auto_36737 ?auto_36739 ) ) ( not ( = ?auto_36737 ?auto_36740 ) ) ( not ( = ?auto_36742 ?auto_36744 ) ) ( HOIST-AT ?auto_36745 ?auto_36742 ) ( not ( = ?auto_36743 ?auto_36745 ) ) ( AVAILABLE ?auto_36745 ) ( SURFACE-AT ?auto_36740 ?auto_36742 ) ( ON ?auto_36740 ?auto_36746 ) ( CLEAR ?auto_36740 ) ( not ( = ?auto_36739 ?auto_36746 ) ) ( not ( = ?auto_36740 ?auto_36746 ) ) ( not ( = ?auto_36737 ?auto_36746 ) ) ( TRUCK-AT ?auto_36741 ?auto_36744 ) ( SURFACE-AT ?auto_36737 ?auto_36744 ) ( CLEAR ?auto_36737 ) ( IS-CRATE ?auto_36739 ) ( AVAILABLE ?auto_36743 ) ( IN ?auto_36739 ?auto_36741 ) ( ON ?auto_36735 ?auto_36734 ) ( ON ?auto_36736 ?auto_36735 ) ( ON ?auto_36738 ?auto_36736 ) ( ON ?auto_36737 ?auto_36738 ) ( not ( = ?auto_36734 ?auto_36735 ) ) ( not ( = ?auto_36734 ?auto_36736 ) ) ( not ( = ?auto_36734 ?auto_36738 ) ) ( not ( = ?auto_36734 ?auto_36737 ) ) ( not ( = ?auto_36734 ?auto_36739 ) ) ( not ( = ?auto_36734 ?auto_36740 ) ) ( not ( = ?auto_36734 ?auto_36746 ) ) ( not ( = ?auto_36735 ?auto_36736 ) ) ( not ( = ?auto_36735 ?auto_36738 ) ) ( not ( = ?auto_36735 ?auto_36737 ) ) ( not ( = ?auto_36735 ?auto_36739 ) ) ( not ( = ?auto_36735 ?auto_36740 ) ) ( not ( = ?auto_36735 ?auto_36746 ) ) ( not ( = ?auto_36736 ?auto_36738 ) ) ( not ( = ?auto_36736 ?auto_36737 ) ) ( not ( = ?auto_36736 ?auto_36739 ) ) ( not ( = ?auto_36736 ?auto_36740 ) ) ( not ( = ?auto_36736 ?auto_36746 ) ) ( not ( = ?auto_36738 ?auto_36737 ) ) ( not ( = ?auto_36738 ?auto_36739 ) ) ( not ( = ?auto_36738 ?auto_36740 ) ) ( not ( = ?auto_36738 ?auto_36746 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36737 ?auto_36739 ?auto_36740 )
      ( MAKE-6CRATE-VERIFY ?auto_36734 ?auto_36735 ?auto_36736 ?auto_36738 ?auto_36737 ?auto_36739 ?auto_36740 ) )
  )

)

