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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6202 - SURFACE
      ?auto_6203 - SURFACE
    )
    :vars
    (
      ?auto_6204 - HOIST
      ?auto_6205 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6204 ?auto_6205 ) ( SURFACE-AT ?auto_6202 ?auto_6205 ) ( CLEAR ?auto_6202 ) ( LIFTING ?auto_6204 ?auto_6203 ) ( IS-CRATE ?auto_6203 ) ( not ( = ?auto_6202 ?auto_6203 ) ) )
    :subtasks
    ( ( !DROP ?auto_6204 ?auto_6203 ?auto_6202 ?auto_6205 )
      ( MAKE-1CRATE-VERIFY ?auto_6202 ?auto_6203 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6206 - SURFACE
      ?auto_6207 - SURFACE
    )
    :vars
    (
      ?auto_6208 - HOIST
      ?auto_6209 - PLACE
      ?auto_6210 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6208 ?auto_6209 ) ( SURFACE-AT ?auto_6206 ?auto_6209 ) ( CLEAR ?auto_6206 ) ( IS-CRATE ?auto_6207 ) ( not ( = ?auto_6206 ?auto_6207 ) ) ( TRUCK-AT ?auto_6210 ?auto_6209 ) ( AVAILABLE ?auto_6208 ) ( IN ?auto_6207 ?auto_6210 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6208 ?auto_6207 ?auto_6210 ?auto_6209 )
      ( MAKE-1CRATE ?auto_6206 ?auto_6207 )
      ( MAKE-1CRATE-VERIFY ?auto_6206 ?auto_6207 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6211 - SURFACE
      ?auto_6212 - SURFACE
    )
    :vars
    (
      ?auto_6213 - HOIST
      ?auto_6215 - PLACE
      ?auto_6214 - TRUCK
      ?auto_6216 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6213 ?auto_6215 ) ( SURFACE-AT ?auto_6211 ?auto_6215 ) ( CLEAR ?auto_6211 ) ( IS-CRATE ?auto_6212 ) ( not ( = ?auto_6211 ?auto_6212 ) ) ( AVAILABLE ?auto_6213 ) ( IN ?auto_6212 ?auto_6214 ) ( TRUCK-AT ?auto_6214 ?auto_6216 ) ( not ( = ?auto_6216 ?auto_6215 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6214 ?auto_6216 ?auto_6215 )
      ( MAKE-1CRATE ?auto_6211 ?auto_6212 )
      ( MAKE-1CRATE-VERIFY ?auto_6211 ?auto_6212 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6217 - SURFACE
      ?auto_6218 - SURFACE
    )
    :vars
    (
      ?auto_6220 - HOIST
      ?auto_6222 - PLACE
      ?auto_6219 - TRUCK
      ?auto_6221 - PLACE
      ?auto_6223 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6220 ?auto_6222 ) ( SURFACE-AT ?auto_6217 ?auto_6222 ) ( CLEAR ?auto_6217 ) ( IS-CRATE ?auto_6218 ) ( not ( = ?auto_6217 ?auto_6218 ) ) ( AVAILABLE ?auto_6220 ) ( TRUCK-AT ?auto_6219 ?auto_6221 ) ( not ( = ?auto_6221 ?auto_6222 ) ) ( HOIST-AT ?auto_6223 ?auto_6221 ) ( LIFTING ?auto_6223 ?auto_6218 ) ( not ( = ?auto_6220 ?auto_6223 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6223 ?auto_6218 ?auto_6219 ?auto_6221 )
      ( MAKE-1CRATE ?auto_6217 ?auto_6218 )
      ( MAKE-1CRATE-VERIFY ?auto_6217 ?auto_6218 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6224 - SURFACE
      ?auto_6225 - SURFACE
    )
    :vars
    (
      ?auto_6229 - HOIST
      ?auto_6227 - PLACE
      ?auto_6228 - TRUCK
      ?auto_6226 - PLACE
      ?auto_6230 - HOIST
      ?auto_6231 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6229 ?auto_6227 ) ( SURFACE-AT ?auto_6224 ?auto_6227 ) ( CLEAR ?auto_6224 ) ( IS-CRATE ?auto_6225 ) ( not ( = ?auto_6224 ?auto_6225 ) ) ( AVAILABLE ?auto_6229 ) ( TRUCK-AT ?auto_6228 ?auto_6226 ) ( not ( = ?auto_6226 ?auto_6227 ) ) ( HOIST-AT ?auto_6230 ?auto_6226 ) ( not ( = ?auto_6229 ?auto_6230 ) ) ( AVAILABLE ?auto_6230 ) ( SURFACE-AT ?auto_6225 ?auto_6226 ) ( ON ?auto_6225 ?auto_6231 ) ( CLEAR ?auto_6225 ) ( not ( = ?auto_6224 ?auto_6231 ) ) ( not ( = ?auto_6225 ?auto_6231 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6230 ?auto_6225 ?auto_6231 ?auto_6226 )
      ( MAKE-1CRATE ?auto_6224 ?auto_6225 )
      ( MAKE-1CRATE-VERIFY ?auto_6224 ?auto_6225 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6232 - SURFACE
      ?auto_6233 - SURFACE
    )
    :vars
    (
      ?auto_6235 - HOIST
      ?auto_6238 - PLACE
      ?auto_6236 - PLACE
      ?auto_6234 - HOIST
      ?auto_6239 - SURFACE
      ?auto_6237 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6235 ?auto_6238 ) ( SURFACE-AT ?auto_6232 ?auto_6238 ) ( CLEAR ?auto_6232 ) ( IS-CRATE ?auto_6233 ) ( not ( = ?auto_6232 ?auto_6233 ) ) ( AVAILABLE ?auto_6235 ) ( not ( = ?auto_6236 ?auto_6238 ) ) ( HOIST-AT ?auto_6234 ?auto_6236 ) ( not ( = ?auto_6235 ?auto_6234 ) ) ( AVAILABLE ?auto_6234 ) ( SURFACE-AT ?auto_6233 ?auto_6236 ) ( ON ?auto_6233 ?auto_6239 ) ( CLEAR ?auto_6233 ) ( not ( = ?auto_6232 ?auto_6239 ) ) ( not ( = ?auto_6233 ?auto_6239 ) ) ( TRUCK-AT ?auto_6237 ?auto_6238 ) )
    :subtasks
    ( ( !DRIVE ?auto_6237 ?auto_6238 ?auto_6236 )
      ( MAKE-1CRATE ?auto_6232 ?auto_6233 )
      ( MAKE-1CRATE-VERIFY ?auto_6232 ?auto_6233 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6249 - SURFACE
      ?auto_6250 - SURFACE
      ?auto_6251 - SURFACE
    )
    :vars
    (
      ?auto_6253 - HOIST
      ?auto_6252 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6253 ?auto_6252 ) ( SURFACE-AT ?auto_6250 ?auto_6252 ) ( CLEAR ?auto_6250 ) ( LIFTING ?auto_6253 ?auto_6251 ) ( IS-CRATE ?auto_6251 ) ( not ( = ?auto_6250 ?auto_6251 ) ) ( ON ?auto_6250 ?auto_6249 ) ( not ( = ?auto_6249 ?auto_6250 ) ) ( not ( = ?auto_6249 ?auto_6251 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6250 ?auto_6251 )
      ( MAKE-2CRATE-VERIFY ?auto_6249 ?auto_6250 ?auto_6251 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6259 - SURFACE
      ?auto_6260 - SURFACE
      ?auto_6261 - SURFACE
    )
    :vars
    (
      ?auto_6263 - HOIST
      ?auto_6262 - PLACE
      ?auto_6264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6263 ?auto_6262 ) ( SURFACE-AT ?auto_6260 ?auto_6262 ) ( CLEAR ?auto_6260 ) ( IS-CRATE ?auto_6261 ) ( not ( = ?auto_6260 ?auto_6261 ) ) ( TRUCK-AT ?auto_6264 ?auto_6262 ) ( AVAILABLE ?auto_6263 ) ( IN ?auto_6261 ?auto_6264 ) ( ON ?auto_6260 ?auto_6259 ) ( not ( = ?auto_6259 ?auto_6260 ) ) ( not ( = ?auto_6259 ?auto_6261 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6260 ?auto_6261 )
      ( MAKE-2CRATE-VERIFY ?auto_6259 ?auto_6260 ?auto_6261 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6265 - SURFACE
      ?auto_6266 - SURFACE
    )
    :vars
    (
      ?auto_6270 - HOIST
      ?auto_6267 - PLACE
      ?auto_6269 - TRUCK
      ?auto_6268 - SURFACE
      ?auto_6271 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6270 ?auto_6267 ) ( SURFACE-AT ?auto_6265 ?auto_6267 ) ( CLEAR ?auto_6265 ) ( IS-CRATE ?auto_6266 ) ( not ( = ?auto_6265 ?auto_6266 ) ) ( AVAILABLE ?auto_6270 ) ( IN ?auto_6266 ?auto_6269 ) ( ON ?auto_6265 ?auto_6268 ) ( not ( = ?auto_6268 ?auto_6265 ) ) ( not ( = ?auto_6268 ?auto_6266 ) ) ( TRUCK-AT ?auto_6269 ?auto_6271 ) ( not ( = ?auto_6271 ?auto_6267 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6269 ?auto_6271 ?auto_6267 )
      ( MAKE-2CRATE ?auto_6268 ?auto_6265 ?auto_6266 )
      ( MAKE-1CRATE-VERIFY ?auto_6265 ?auto_6266 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6272 - SURFACE
      ?auto_6273 - SURFACE
      ?auto_6274 - SURFACE
    )
    :vars
    (
      ?auto_6276 - HOIST
      ?auto_6278 - PLACE
      ?auto_6275 - TRUCK
      ?auto_6277 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6276 ?auto_6278 ) ( SURFACE-AT ?auto_6273 ?auto_6278 ) ( CLEAR ?auto_6273 ) ( IS-CRATE ?auto_6274 ) ( not ( = ?auto_6273 ?auto_6274 ) ) ( AVAILABLE ?auto_6276 ) ( IN ?auto_6274 ?auto_6275 ) ( ON ?auto_6273 ?auto_6272 ) ( not ( = ?auto_6272 ?auto_6273 ) ) ( not ( = ?auto_6272 ?auto_6274 ) ) ( TRUCK-AT ?auto_6275 ?auto_6277 ) ( not ( = ?auto_6277 ?auto_6278 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6273 ?auto_6274 )
      ( MAKE-2CRATE-VERIFY ?auto_6272 ?auto_6273 ?auto_6274 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6279 - SURFACE
      ?auto_6280 - SURFACE
    )
    :vars
    (
      ?auto_6285 - HOIST
      ?auto_6282 - PLACE
      ?auto_6281 - SURFACE
      ?auto_6284 - TRUCK
      ?auto_6283 - PLACE
      ?auto_6286 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6285 ?auto_6282 ) ( SURFACE-AT ?auto_6279 ?auto_6282 ) ( CLEAR ?auto_6279 ) ( IS-CRATE ?auto_6280 ) ( not ( = ?auto_6279 ?auto_6280 ) ) ( AVAILABLE ?auto_6285 ) ( ON ?auto_6279 ?auto_6281 ) ( not ( = ?auto_6281 ?auto_6279 ) ) ( not ( = ?auto_6281 ?auto_6280 ) ) ( TRUCK-AT ?auto_6284 ?auto_6283 ) ( not ( = ?auto_6283 ?auto_6282 ) ) ( HOIST-AT ?auto_6286 ?auto_6283 ) ( LIFTING ?auto_6286 ?auto_6280 ) ( not ( = ?auto_6285 ?auto_6286 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6286 ?auto_6280 ?auto_6284 ?auto_6283 )
      ( MAKE-2CRATE ?auto_6281 ?auto_6279 ?auto_6280 )
      ( MAKE-1CRATE-VERIFY ?auto_6279 ?auto_6280 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6287 - SURFACE
      ?auto_6288 - SURFACE
      ?auto_6289 - SURFACE
    )
    :vars
    (
      ?auto_6294 - HOIST
      ?auto_6292 - PLACE
      ?auto_6291 - TRUCK
      ?auto_6293 - PLACE
      ?auto_6290 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6294 ?auto_6292 ) ( SURFACE-AT ?auto_6288 ?auto_6292 ) ( CLEAR ?auto_6288 ) ( IS-CRATE ?auto_6289 ) ( not ( = ?auto_6288 ?auto_6289 ) ) ( AVAILABLE ?auto_6294 ) ( ON ?auto_6288 ?auto_6287 ) ( not ( = ?auto_6287 ?auto_6288 ) ) ( not ( = ?auto_6287 ?auto_6289 ) ) ( TRUCK-AT ?auto_6291 ?auto_6293 ) ( not ( = ?auto_6293 ?auto_6292 ) ) ( HOIST-AT ?auto_6290 ?auto_6293 ) ( LIFTING ?auto_6290 ?auto_6289 ) ( not ( = ?auto_6294 ?auto_6290 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6288 ?auto_6289 )
      ( MAKE-2CRATE-VERIFY ?auto_6287 ?auto_6288 ?auto_6289 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6295 - SURFACE
      ?auto_6296 - SURFACE
    )
    :vars
    (
      ?auto_6299 - HOIST
      ?auto_6300 - PLACE
      ?auto_6302 - SURFACE
      ?auto_6297 - TRUCK
      ?auto_6301 - PLACE
      ?auto_6298 - HOIST
      ?auto_6303 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6299 ?auto_6300 ) ( SURFACE-AT ?auto_6295 ?auto_6300 ) ( CLEAR ?auto_6295 ) ( IS-CRATE ?auto_6296 ) ( not ( = ?auto_6295 ?auto_6296 ) ) ( AVAILABLE ?auto_6299 ) ( ON ?auto_6295 ?auto_6302 ) ( not ( = ?auto_6302 ?auto_6295 ) ) ( not ( = ?auto_6302 ?auto_6296 ) ) ( TRUCK-AT ?auto_6297 ?auto_6301 ) ( not ( = ?auto_6301 ?auto_6300 ) ) ( HOIST-AT ?auto_6298 ?auto_6301 ) ( not ( = ?auto_6299 ?auto_6298 ) ) ( AVAILABLE ?auto_6298 ) ( SURFACE-AT ?auto_6296 ?auto_6301 ) ( ON ?auto_6296 ?auto_6303 ) ( CLEAR ?auto_6296 ) ( not ( = ?auto_6295 ?auto_6303 ) ) ( not ( = ?auto_6296 ?auto_6303 ) ) ( not ( = ?auto_6302 ?auto_6303 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6298 ?auto_6296 ?auto_6303 ?auto_6301 )
      ( MAKE-2CRATE ?auto_6302 ?auto_6295 ?auto_6296 )
      ( MAKE-1CRATE-VERIFY ?auto_6295 ?auto_6296 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6304 - SURFACE
      ?auto_6305 - SURFACE
      ?auto_6306 - SURFACE
    )
    :vars
    (
      ?auto_6308 - HOIST
      ?auto_6309 - PLACE
      ?auto_6311 - TRUCK
      ?auto_6307 - PLACE
      ?auto_6310 - HOIST
      ?auto_6312 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6308 ?auto_6309 ) ( SURFACE-AT ?auto_6305 ?auto_6309 ) ( CLEAR ?auto_6305 ) ( IS-CRATE ?auto_6306 ) ( not ( = ?auto_6305 ?auto_6306 ) ) ( AVAILABLE ?auto_6308 ) ( ON ?auto_6305 ?auto_6304 ) ( not ( = ?auto_6304 ?auto_6305 ) ) ( not ( = ?auto_6304 ?auto_6306 ) ) ( TRUCK-AT ?auto_6311 ?auto_6307 ) ( not ( = ?auto_6307 ?auto_6309 ) ) ( HOIST-AT ?auto_6310 ?auto_6307 ) ( not ( = ?auto_6308 ?auto_6310 ) ) ( AVAILABLE ?auto_6310 ) ( SURFACE-AT ?auto_6306 ?auto_6307 ) ( ON ?auto_6306 ?auto_6312 ) ( CLEAR ?auto_6306 ) ( not ( = ?auto_6305 ?auto_6312 ) ) ( not ( = ?auto_6306 ?auto_6312 ) ) ( not ( = ?auto_6304 ?auto_6312 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6305 ?auto_6306 )
      ( MAKE-2CRATE-VERIFY ?auto_6304 ?auto_6305 ?auto_6306 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6313 - SURFACE
      ?auto_6314 - SURFACE
    )
    :vars
    (
      ?auto_6319 - HOIST
      ?auto_6321 - PLACE
      ?auto_6316 - SURFACE
      ?auto_6320 - PLACE
      ?auto_6317 - HOIST
      ?auto_6318 - SURFACE
      ?auto_6315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6319 ?auto_6321 ) ( SURFACE-AT ?auto_6313 ?auto_6321 ) ( CLEAR ?auto_6313 ) ( IS-CRATE ?auto_6314 ) ( not ( = ?auto_6313 ?auto_6314 ) ) ( AVAILABLE ?auto_6319 ) ( ON ?auto_6313 ?auto_6316 ) ( not ( = ?auto_6316 ?auto_6313 ) ) ( not ( = ?auto_6316 ?auto_6314 ) ) ( not ( = ?auto_6320 ?auto_6321 ) ) ( HOIST-AT ?auto_6317 ?auto_6320 ) ( not ( = ?auto_6319 ?auto_6317 ) ) ( AVAILABLE ?auto_6317 ) ( SURFACE-AT ?auto_6314 ?auto_6320 ) ( ON ?auto_6314 ?auto_6318 ) ( CLEAR ?auto_6314 ) ( not ( = ?auto_6313 ?auto_6318 ) ) ( not ( = ?auto_6314 ?auto_6318 ) ) ( not ( = ?auto_6316 ?auto_6318 ) ) ( TRUCK-AT ?auto_6315 ?auto_6321 ) )
    :subtasks
    ( ( !DRIVE ?auto_6315 ?auto_6321 ?auto_6320 )
      ( MAKE-2CRATE ?auto_6316 ?auto_6313 ?auto_6314 )
      ( MAKE-1CRATE-VERIFY ?auto_6313 ?auto_6314 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6322 - SURFACE
      ?auto_6323 - SURFACE
      ?auto_6324 - SURFACE
    )
    :vars
    (
      ?auto_6330 - HOIST
      ?auto_6325 - PLACE
      ?auto_6326 - PLACE
      ?auto_6328 - HOIST
      ?auto_6329 - SURFACE
      ?auto_6327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6330 ?auto_6325 ) ( SURFACE-AT ?auto_6323 ?auto_6325 ) ( CLEAR ?auto_6323 ) ( IS-CRATE ?auto_6324 ) ( not ( = ?auto_6323 ?auto_6324 ) ) ( AVAILABLE ?auto_6330 ) ( ON ?auto_6323 ?auto_6322 ) ( not ( = ?auto_6322 ?auto_6323 ) ) ( not ( = ?auto_6322 ?auto_6324 ) ) ( not ( = ?auto_6326 ?auto_6325 ) ) ( HOIST-AT ?auto_6328 ?auto_6326 ) ( not ( = ?auto_6330 ?auto_6328 ) ) ( AVAILABLE ?auto_6328 ) ( SURFACE-AT ?auto_6324 ?auto_6326 ) ( ON ?auto_6324 ?auto_6329 ) ( CLEAR ?auto_6324 ) ( not ( = ?auto_6323 ?auto_6329 ) ) ( not ( = ?auto_6324 ?auto_6329 ) ) ( not ( = ?auto_6322 ?auto_6329 ) ) ( TRUCK-AT ?auto_6327 ?auto_6325 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6323 ?auto_6324 )
      ( MAKE-2CRATE-VERIFY ?auto_6322 ?auto_6323 ?auto_6324 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6331 - SURFACE
      ?auto_6332 - SURFACE
    )
    :vars
    (
      ?auto_6334 - HOIST
      ?auto_6339 - PLACE
      ?auto_6337 - SURFACE
      ?auto_6333 - PLACE
      ?auto_6336 - HOIST
      ?auto_6338 - SURFACE
      ?auto_6335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6334 ?auto_6339 ) ( IS-CRATE ?auto_6332 ) ( not ( = ?auto_6331 ?auto_6332 ) ) ( not ( = ?auto_6337 ?auto_6331 ) ) ( not ( = ?auto_6337 ?auto_6332 ) ) ( not ( = ?auto_6333 ?auto_6339 ) ) ( HOIST-AT ?auto_6336 ?auto_6333 ) ( not ( = ?auto_6334 ?auto_6336 ) ) ( AVAILABLE ?auto_6336 ) ( SURFACE-AT ?auto_6332 ?auto_6333 ) ( ON ?auto_6332 ?auto_6338 ) ( CLEAR ?auto_6332 ) ( not ( = ?auto_6331 ?auto_6338 ) ) ( not ( = ?auto_6332 ?auto_6338 ) ) ( not ( = ?auto_6337 ?auto_6338 ) ) ( TRUCK-AT ?auto_6335 ?auto_6339 ) ( SURFACE-AT ?auto_6337 ?auto_6339 ) ( CLEAR ?auto_6337 ) ( LIFTING ?auto_6334 ?auto_6331 ) ( IS-CRATE ?auto_6331 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6337 ?auto_6331 )
      ( MAKE-2CRATE ?auto_6337 ?auto_6331 ?auto_6332 )
      ( MAKE-1CRATE-VERIFY ?auto_6331 ?auto_6332 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6340 - SURFACE
      ?auto_6341 - SURFACE
      ?auto_6342 - SURFACE
    )
    :vars
    (
      ?auto_6347 - HOIST
      ?auto_6346 - PLACE
      ?auto_6345 - PLACE
      ?auto_6343 - HOIST
      ?auto_6344 - SURFACE
      ?auto_6348 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6347 ?auto_6346 ) ( IS-CRATE ?auto_6342 ) ( not ( = ?auto_6341 ?auto_6342 ) ) ( not ( = ?auto_6340 ?auto_6341 ) ) ( not ( = ?auto_6340 ?auto_6342 ) ) ( not ( = ?auto_6345 ?auto_6346 ) ) ( HOIST-AT ?auto_6343 ?auto_6345 ) ( not ( = ?auto_6347 ?auto_6343 ) ) ( AVAILABLE ?auto_6343 ) ( SURFACE-AT ?auto_6342 ?auto_6345 ) ( ON ?auto_6342 ?auto_6344 ) ( CLEAR ?auto_6342 ) ( not ( = ?auto_6341 ?auto_6344 ) ) ( not ( = ?auto_6342 ?auto_6344 ) ) ( not ( = ?auto_6340 ?auto_6344 ) ) ( TRUCK-AT ?auto_6348 ?auto_6346 ) ( SURFACE-AT ?auto_6340 ?auto_6346 ) ( CLEAR ?auto_6340 ) ( LIFTING ?auto_6347 ?auto_6341 ) ( IS-CRATE ?auto_6341 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6341 ?auto_6342 )
      ( MAKE-2CRATE-VERIFY ?auto_6340 ?auto_6341 ?auto_6342 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6349 - SURFACE
      ?auto_6350 - SURFACE
    )
    :vars
    (
      ?auto_6352 - HOIST
      ?auto_6357 - PLACE
      ?auto_6351 - SURFACE
      ?auto_6354 - PLACE
      ?auto_6356 - HOIST
      ?auto_6355 - SURFACE
      ?auto_6353 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6352 ?auto_6357 ) ( IS-CRATE ?auto_6350 ) ( not ( = ?auto_6349 ?auto_6350 ) ) ( not ( = ?auto_6351 ?auto_6349 ) ) ( not ( = ?auto_6351 ?auto_6350 ) ) ( not ( = ?auto_6354 ?auto_6357 ) ) ( HOIST-AT ?auto_6356 ?auto_6354 ) ( not ( = ?auto_6352 ?auto_6356 ) ) ( AVAILABLE ?auto_6356 ) ( SURFACE-AT ?auto_6350 ?auto_6354 ) ( ON ?auto_6350 ?auto_6355 ) ( CLEAR ?auto_6350 ) ( not ( = ?auto_6349 ?auto_6355 ) ) ( not ( = ?auto_6350 ?auto_6355 ) ) ( not ( = ?auto_6351 ?auto_6355 ) ) ( TRUCK-AT ?auto_6353 ?auto_6357 ) ( SURFACE-AT ?auto_6351 ?auto_6357 ) ( CLEAR ?auto_6351 ) ( IS-CRATE ?auto_6349 ) ( AVAILABLE ?auto_6352 ) ( IN ?auto_6349 ?auto_6353 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6352 ?auto_6349 ?auto_6353 ?auto_6357 )
      ( MAKE-2CRATE ?auto_6351 ?auto_6349 ?auto_6350 )
      ( MAKE-1CRATE-VERIFY ?auto_6349 ?auto_6350 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6358 - SURFACE
      ?auto_6359 - SURFACE
      ?auto_6360 - SURFACE
    )
    :vars
    (
      ?auto_6361 - HOIST
      ?auto_6362 - PLACE
      ?auto_6363 - PLACE
      ?auto_6366 - HOIST
      ?auto_6365 - SURFACE
      ?auto_6364 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6361 ?auto_6362 ) ( IS-CRATE ?auto_6360 ) ( not ( = ?auto_6359 ?auto_6360 ) ) ( not ( = ?auto_6358 ?auto_6359 ) ) ( not ( = ?auto_6358 ?auto_6360 ) ) ( not ( = ?auto_6363 ?auto_6362 ) ) ( HOIST-AT ?auto_6366 ?auto_6363 ) ( not ( = ?auto_6361 ?auto_6366 ) ) ( AVAILABLE ?auto_6366 ) ( SURFACE-AT ?auto_6360 ?auto_6363 ) ( ON ?auto_6360 ?auto_6365 ) ( CLEAR ?auto_6360 ) ( not ( = ?auto_6359 ?auto_6365 ) ) ( not ( = ?auto_6360 ?auto_6365 ) ) ( not ( = ?auto_6358 ?auto_6365 ) ) ( TRUCK-AT ?auto_6364 ?auto_6362 ) ( SURFACE-AT ?auto_6358 ?auto_6362 ) ( CLEAR ?auto_6358 ) ( IS-CRATE ?auto_6359 ) ( AVAILABLE ?auto_6361 ) ( IN ?auto_6359 ?auto_6364 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6359 ?auto_6360 )
      ( MAKE-2CRATE-VERIFY ?auto_6358 ?auto_6359 ?auto_6360 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6403 - SURFACE
      ?auto_6404 - SURFACE
    )
    :vars
    (
      ?auto_6410 - HOIST
      ?auto_6405 - PLACE
      ?auto_6407 - SURFACE
      ?auto_6409 - PLACE
      ?auto_6406 - HOIST
      ?auto_6411 - SURFACE
      ?auto_6408 - TRUCK
      ?auto_6412 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6410 ?auto_6405 ) ( SURFACE-AT ?auto_6403 ?auto_6405 ) ( CLEAR ?auto_6403 ) ( IS-CRATE ?auto_6404 ) ( not ( = ?auto_6403 ?auto_6404 ) ) ( AVAILABLE ?auto_6410 ) ( ON ?auto_6403 ?auto_6407 ) ( not ( = ?auto_6407 ?auto_6403 ) ) ( not ( = ?auto_6407 ?auto_6404 ) ) ( not ( = ?auto_6409 ?auto_6405 ) ) ( HOIST-AT ?auto_6406 ?auto_6409 ) ( not ( = ?auto_6410 ?auto_6406 ) ) ( AVAILABLE ?auto_6406 ) ( SURFACE-AT ?auto_6404 ?auto_6409 ) ( ON ?auto_6404 ?auto_6411 ) ( CLEAR ?auto_6404 ) ( not ( = ?auto_6403 ?auto_6411 ) ) ( not ( = ?auto_6404 ?auto_6411 ) ) ( not ( = ?auto_6407 ?auto_6411 ) ) ( TRUCK-AT ?auto_6408 ?auto_6412 ) ( not ( = ?auto_6412 ?auto_6405 ) ) ( not ( = ?auto_6409 ?auto_6412 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6408 ?auto_6412 ?auto_6405 )
      ( MAKE-1CRATE ?auto_6403 ?auto_6404 )
      ( MAKE-1CRATE-VERIFY ?auto_6403 ?auto_6404 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6442 - SURFACE
      ?auto_6443 - SURFACE
      ?auto_6444 - SURFACE
      ?auto_6445 - SURFACE
    )
    :vars
    (
      ?auto_6446 - HOIST
      ?auto_6447 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6446 ?auto_6447 ) ( SURFACE-AT ?auto_6444 ?auto_6447 ) ( CLEAR ?auto_6444 ) ( LIFTING ?auto_6446 ?auto_6445 ) ( IS-CRATE ?auto_6445 ) ( not ( = ?auto_6444 ?auto_6445 ) ) ( ON ?auto_6443 ?auto_6442 ) ( ON ?auto_6444 ?auto_6443 ) ( not ( = ?auto_6442 ?auto_6443 ) ) ( not ( = ?auto_6442 ?auto_6444 ) ) ( not ( = ?auto_6442 ?auto_6445 ) ) ( not ( = ?auto_6443 ?auto_6444 ) ) ( not ( = ?auto_6443 ?auto_6445 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6444 ?auto_6445 )
      ( MAKE-3CRATE-VERIFY ?auto_6442 ?auto_6443 ?auto_6444 ?auto_6445 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6459 - SURFACE
      ?auto_6460 - SURFACE
      ?auto_6461 - SURFACE
      ?auto_6462 - SURFACE
    )
    :vars
    (
      ?auto_6465 - HOIST
      ?auto_6463 - PLACE
      ?auto_6464 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6465 ?auto_6463 ) ( SURFACE-AT ?auto_6461 ?auto_6463 ) ( CLEAR ?auto_6461 ) ( IS-CRATE ?auto_6462 ) ( not ( = ?auto_6461 ?auto_6462 ) ) ( TRUCK-AT ?auto_6464 ?auto_6463 ) ( AVAILABLE ?auto_6465 ) ( IN ?auto_6462 ?auto_6464 ) ( ON ?auto_6461 ?auto_6460 ) ( not ( = ?auto_6460 ?auto_6461 ) ) ( not ( = ?auto_6460 ?auto_6462 ) ) ( ON ?auto_6460 ?auto_6459 ) ( not ( = ?auto_6459 ?auto_6460 ) ) ( not ( = ?auto_6459 ?auto_6461 ) ) ( not ( = ?auto_6459 ?auto_6462 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6460 ?auto_6461 ?auto_6462 )
      ( MAKE-3CRATE-VERIFY ?auto_6459 ?auto_6460 ?auto_6461 ?auto_6462 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6480 - SURFACE
      ?auto_6481 - SURFACE
      ?auto_6482 - SURFACE
      ?auto_6483 - SURFACE
    )
    :vars
    (
      ?auto_6486 - HOIST
      ?auto_6484 - PLACE
      ?auto_6485 - TRUCK
      ?auto_6487 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6486 ?auto_6484 ) ( SURFACE-AT ?auto_6482 ?auto_6484 ) ( CLEAR ?auto_6482 ) ( IS-CRATE ?auto_6483 ) ( not ( = ?auto_6482 ?auto_6483 ) ) ( AVAILABLE ?auto_6486 ) ( IN ?auto_6483 ?auto_6485 ) ( ON ?auto_6482 ?auto_6481 ) ( not ( = ?auto_6481 ?auto_6482 ) ) ( not ( = ?auto_6481 ?auto_6483 ) ) ( TRUCK-AT ?auto_6485 ?auto_6487 ) ( not ( = ?auto_6487 ?auto_6484 ) ) ( ON ?auto_6481 ?auto_6480 ) ( not ( = ?auto_6480 ?auto_6481 ) ) ( not ( = ?auto_6480 ?auto_6482 ) ) ( not ( = ?auto_6480 ?auto_6483 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6481 ?auto_6482 ?auto_6483 )
      ( MAKE-3CRATE-VERIFY ?auto_6480 ?auto_6481 ?auto_6482 ?auto_6483 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6504 - SURFACE
      ?auto_6505 - SURFACE
      ?auto_6506 - SURFACE
      ?auto_6507 - SURFACE
    )
    :vars
    (
      ?auto_6512 - HOIST
      ?auto_6508 - PLACE
      ?auto_6509 - TRUCK
      ?auto_6511 - PLACE
      ?auto_6510 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6512 ?auto_6508 ) ( SURFACE-AT ?auto_6506 ?auto_6508 ) ( CLEAR ?auto_6506 ) ( IS-CRATE ?auto_6507 ) ( not ( = ?auto_6506 ?auto_6507 ) ) ( AVAILABLE ?auto_6512 ) ( ON ?auto_6506 ?auto_6505 ) ( not ( = ?auto_6505 ?auto_6506 ) ) ( not ( = ?auto_6505 ?auto_6507 ) ) ( TRUCK-AT ?auto_6509 ?auto_6511 ) ( not ( = ?auto_6511 ?auto_6508 ) ) ( HOIST-AT ?auto_6510 ?auto_6511 ) ( LIFTING ?auto_6510 ?auto_6507 ) ( not ( = ?auto_6512 ?auto_6510 ) ) ( ON ?auto_6505 ?auto_6504 ) ( not ( = ?auto_6504 ?auto_6505 ) ) ( not ( = ?auto_6504 ?auto_6506 ) ) ( not ( = ?auto_6504 ?auto_6507 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6505 ?auto_6506 ?auto_6507 )
      ( MAKE-3CRATE-VERIFY ?auto_6504 ?auto_6505 ?auto_6506 ?auto_6507 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6531 - SURFACE
      ?auto_6532 - SURFACE
      ?auto_6533 - SURFACE
      ?auto_6534 - SURFACE
    )
    :vars
    (
      ?auto_6536 - HOIST
      ?auto_6535 - PLACE
      ?auto_6538 - TRUCK
      ?auto_6539 - PLACE
      ?auto_6540 - HOIST
      ?auto_6537 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6536 ?auto_6535 ) ( SURFACE-AT ?auto_6533 ?auto_6535 ) ( CLEAR ?auto_6533 ) ( IS-CRATE ?auto_6534 ) ( not ( = ?auto_6533 ?auto_6534 ) ) ( AVAILABLE ?auto_6536 ) ( ON ?auto_6533 ?auto_6532 ) ( not ( = ?auto_6532 ?auto_6533 ) ) ( not ( = ?auto_6532 ?auto_6534 ) ) ( TRUCK-AT ?auto_6538 ?auto_6539 ) ( not ( = ?auto_6539 ?auto_6535 ) ) ( HOIST-AT ?auto_6540 ?auto_6539 ) ( not ( = ?auto_6536 ?auto_6540 ) ) ( AVAILABLE ?auto_6540 ) ( SURFACE-AT ?auto_6534 ?auto_6539 ) ( ON ?auto_6534 ?auto_6537 ) ( CLEAR ?auto_6534 ) ( not ( = ?auto_6533 ?auto_6537 ) ) ( not ( = ?auto_6534 ?auto_6537 ) ) ( not ( = ?auto_6532 ?auto_6537 ) ) ( ON ?auto_6532 ?auto_6531 ) ( not ( = ?auto_6531 ?auto_6532 ) ) ( not ( = ?auto_6531 ?auto_6533 ) ) ( not ( = ?auto_6531 ?auto_6534 ) ) ( not ( = ?auto_6531 ?auto_6537 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6532 ?auto_6533 ?auto_6534 )
      ( MAKE-3CRATE-VERIFY ?auto_6531 ?auto_6532 ?auto_6533 ?auto_6534 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6559 - SURFACE
      ?auto_6560 - SURFACE
      ?auto_6561 - SURFACE
      ?auto_6562 - SURFACE
    )
    :vars
    (
      ?auto_6563 - HOIST
      ?auto_6566 - PLACE
      ?auto_6565 - PLACE
      ?auto_6568 - HOIST
      ?auto_6567 - SURFACE
      ?auto_6564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6563 ?auto_6566 ) ( SURFACE-AT ?auto_6561 ?auto_6566 ) ( CLEAR ?auto_6561 ) ( IS-CRATE ?auto_6562 ) ( not ( = ?auto_6561 ?auto_6562 ) ) ( AVAILABLE ?auto_6563 ) ( ON ?auto_6561 ?auto_6560 ) ( not ( = ?auto_6560 ?auto_6561 ) ) ( not ( = ?auto_6560 ?auto_6562 ) ) ( not ( = ?auto_6565 ?auto_6566 ) ) ( HOIST-AT ?auto_6568 ?auto_6565 ) ( not ( = ?auto_6563 ?auto_6568 ) ) ( AVAILABLE ?auto_6568 ) ( SURFACE-AT ?auto_6562 ?auto_6565 ) ( ON ?auto_6562 ?auto_6567 ) ( CLEAR ?auto_6562 ) ( not ( = ?auto_6561 ?auto_6567 ) ) ( not ( = ?auto_6562 ?auto_6567 ) ) ( not ( = ?auto_6560 ?auto_6567 ) ) ( TRUCK-AT ?auto_6564 ?auto_6566 ) ( ON ?auto_6560 ?auto_6559 ) ( not ( = ?auto_6559 ?auto_6560 ) ) ( not ( = ?auto_6559 ?auto_6561 ) ) ( not ( = ?auto_6559 ?auto_6562 ) ) ( not ( = ?auto_6559 ?auto_6567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6560 ?auto_6561 ?auto_6562 )
      ( MAKE-3CRATE-VERIFY ?auto_6559 ?auto_6560 ?auto_6561 ?auto_6562 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6587 - SURFACE
      ?auto_6588 - SURFACE
      ?auto_6589 - SURFACE
      ?auto_6590 - SURFACE
    )
    :vars
    (
      ?auto_6595 - HOIST
      ?auto_6593 - PLACE
      ?auto_6596 - PLACE
      ?auto_6594 - HOIST
      ?auto_6591 - SURFACE
      ?auto_6592 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6595 ?auto_6593 ) ( IS-CRATE ?auto_6590 ) ( not ( = ?auto_6589 ?auto_6590 ) ) ( not ( = ?auto_6588 ?auto_6589 ) ) ( not ( = ?auto_6588 ?auto_6590 ) ) ( not ( = ?auto_6596 ?auto_6593 ) ) ( HOIST-AT ?auto_6594 ?auto_6596 ) ( not ( = ?auto_6595 ?auto_6594 ) ) ( AVAILABLE ?auto_6594 ) ( SURFACE-AT ?auto_6590 ?auto_6596 ) ( ON ?auto_6590 ?auto_6591 ) ( CLEAR ?auto_6590 ) ( not ( = ?auto_6589 ?auto_6591 ) ) ( not ( = ?auto_6590 ?auto_6591 ) ) ( not ( = ?auto_6588 ?auto_6591 ) ) ( TRUCK-AT ?auto_6592 ?auto_6593 ) ( SURFACE-AT ?auto_6588 ?auto_6593 ) ( CLEAR ?auto_6588 ) ( LIFTING ?auto_6595 ?auto_6589 ) ( IS-CRATE ?auto_6589 ) ( ON ?auto_6588 ?auto_6587 ) ( not ( = ?auto_6587 ?auto_6588 ) ) ( not ( = ?auto_6587 ?auto_6589 ) ) ( not ( = ?auto_6587 ?auto_6590 ) ) ( not ( = ?auto_6587 ?auto_6591 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6588 ?auto_6589 ?auto_6590 )
      ( MAKE-3CRATE-VERIFY ?auto_6587 ?auto_6588 ?auto_6589 ?auto_6590 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6615 - SURFACE
      ?auto_6616 - SURFACE
      ?auto_6617 - SURFACE
      ?auto_6618 - SURFACE
    )
    :vars
    (
      ?auto_6623 - HOIST
      ?auto_6622 - PLACE
      ?auto_6619 - PLACE
      ?auto_6620 - HOIST
      ?auto_6621 - SURFACE
      ?auto_6624 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6623 ?auto_6622 ) ( IS-CRATE ?auto_6618 ) ( not ( = ?auto_6617 ?auto_6618 ) ) ( not ( = ?auto_6616 ?auto_6617 ) ) ( not ( = ?auto_6616 ?auto_6618 ) ) ( not ( = ?auto_6619 ?auto_6622 ) ) ( HOIST-AT ?auto_6620 ?auto_6619 ) ( not ( = ?auto_6623 ?auto_6620 ) ) ( AVAILABLE ?auto_6620 ) ( SURFACE-AT ?auto_6618 ?auto_6619 ) ( ON ?auto_6618 ?auto_6621 ) ( CLEAR ?auto_6618 ) ( not ( = ?auto_6617 ?auto_6621 ) ) ( not ( = ?auto_6618 ?auto_6621 ) ) ( not ( = ?auto_6616 ?auto_6621 ) ) ( TRUCK-AT ?auto_6624 ?auto_6622 ) ( SURFACE-AT ?auto_6616 ?auto_6622 ) ( CLEAR ?auto_6616 ) ( IS-CRATE ?auto_6617 ) ( AVAILABLE ?auto_6623 ) ( IN ?auto_6617 ?auto_6624 ) ( ON ?auto_6616 ?auto_6615 ) ( not ( = ?auto_6615 ?auto_6616 ) ) ( not ( = ?auto_6615 ?auto_6617 ) ) ( not ( = ?auto_6615 ?auto_6618 ) ) ( not ( = ?auto_6615 ?auto_6621 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6616 ?auto_6617 ?auto_6618 )
      ( MAKE-3CRATE-VERIFY ?auto_6615 ?auto_6616 ?auto_6617 ?auto_6618 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6625 - SURFACE
      ?auto_6626 - SURFACE
    )
    :vars
    (
      ?auto_6631 - HOIST
      ?auto_6630 - PLACE
      ?auto_6633 - SURFACE
      ?auto_6627 - PLACE
      ?auto_6628 - HOIST
      ?auto_6629 - SURFACE
      ?auto_6632 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6631 ?auto_6630 ) ( IS-CRATE ?auto_6626 ) ( not ( = ?auto_6625 ?auto_6626 ) ) ( not ( = ?auto_6633 ?auto_6625 ) ) ( not ( = ?auto_6633 ?auto_6626 ) ) ( not ( = ?auto_6627 ?auto_6630 ) ) ( HOIST-AT ?auto_6628 ?auto_6627 ) ( not ( = ?auto_6631 ?auto_6628 ) ) ( AVAILABLE ?auto_6628 ) ( SURFACE-AT ?auto_6626 ?auto_6627 ) ( ON ?auto_6626 ?auto_6629 ) ( CLEAR ?auto_6626 ) ( not ( = ?auto_6625 ?auto_6629 ) ) ( not ( = ?auto_6626 ?auto_6629 ) ) ( not ( = ?auto_6633 ?auto_6629 ) ) ( SURFACE-AT ?auto_6633 ?auto_6630 ) ( CLEAR ?auto_6633 ) ( IS-CRATE ?auto_6625 ) ( AVAILABLE ?auto_6631 ) ( IN ?auto_6625 ?auto_6632 ) ( TRUCK-AT ?auto_6632 ?auto_6627 ) )
    :subtasks
    ( ( !DRIVE ?auto_6632 ?auto_6627 ?auto_6630 )
      ( MAKE-2CRATE ?auto_6633 ?auto_6625 ?auto_6626 )
      ( MAKE-1CRATE-VERIFY ?auto_6625 ?auto_6626 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6634 - SURFACE
      ?auto_6635 - SURFACE
      ?auto_6636 - SURFACE
    )
    :vars
    (
      ?auto_6642 - HOIST
      ?auto_6639 - PLACE
      ?auto_6638 - PLACE
      ?auto_6640 - HOIST
      ?auto_6637 - SURFACE
      ?auto_6641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6642 ?auto_6639 ) ( IS-CRATE ?auto_6636 ) ( not ( = ?auto_6635 ?auto_6636 ) ) ( not ( = ?auto_6634 ?auto_6635 ) ) ( not ( = ?auto_6634 ?auto_6636 ) ) ( not ( = ?auto_6638 ?auto_6639 ) ) ( HOIST-AT ?auto_6640 ?auto_6638 ) ( not ( = ?auto_6642 ?auto_6640 ) ) ( AVAILABLE ?auto_6640 ) ( SURFACE-AT ?auto_6636 ?auto_6638 ) ( ON ?auto_6636 ?auto_6637 ) ( CLEAR ?auto_6636 ) ( not ( = ?auto_6635 ?auto_6637 ) ) ( not ( = ?auto_6636 ?auto_6637 ) ) ( not ( = ?auto_6634 ?auto_6637 ) ) ( SURFACE-AT ?auto_6634 ?auto_6639 ) ( CLEAR ?auto_6634 ) ( IS-CRATE ?auto_6635 ) ( AVAILABLE ?auto_6642 ) ( IN ?auto_6635 ?auto_6641 ) ( TRUCK-AT ?auto_6641 ?auto_6638 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6635 ?auto_6636 )
      ( MAKE-2CRATE-VERIFY ?auto_6634 ?auto_6635 ?auto_6636 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6643 - SURFACE
      ?auto_6644 - SURFACE
      ?auto_6645 - SURFACE
      ?auto_6646 - SURFACE
    )
    :vars
    (
      ?auto_6650 - HOIST
      ?auto_6651 - PLACE
      ?auto_6649 - PLACE
      ?auto_6647 - HOIST
      ?auto_6652 - SURFACE
      ?auto_6648 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6650 ?auto_6651 ) ( IS-CRATE ?auto_6646 ) ( not ( = ?auto_6645 ?auto_6646 ) ) ( not ( = ?auto_6644 ?auto_6645 ) ) ( not ( = ?auto_6644 ?auto_6646 ) ) ( not ( = ?auto_6649 ?auto_6651 ) ) ( HOIST-AT ?auto_6647 ?auto_6649 ) ( not ( = ?auto_6650 ?auto_6647 ) ) ( AVAILABLE ?auto_6647 ) ( SURFACE-AT ?auto_6646 ?auto_6649 ) ( ON ?auto_6646 ?auto_6652 ) ( CLEAR ?auto_6646 ) ( not ( = ?auto_6645 ?auto_6652 ) ) ( not ( = ?auto_6646 ?auto_6652 ) ) ( not ( = ?auto_6644 ?auto_6652 ) ) ( SURFACE-AT ?auto_6644 ?auto_6651 ) ( CLEAR ?auto_6644 ) ( IS-CRATE ?auto_6645 ) ( AVAILABLE ?auto_6650 ) ( IN ?auto_6645 ?auto_6648 ) ( TRUCK-AT ?auto_6648 ?auto_6649 ) ( ON ?auto_6644 ?auto_6643 ) ( not ( = ?auto_6643 ?auto_6644 ) ) ( not ( = ?auto_6643 ?auto_6645 ) ) ( not ( = ?auto_6643 ?auto_6646 ) ) ( not ( = ?auto_6643 ?auto_6652 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6644 ?auto_6645 ?auto_6646 )
      ( MAKE-3CRATE-VERIFY ?auto_6643 ?auto_6644 ?auto_6645 ?auto_6646 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6653 - SURFACE
      ?auto_6654 - SURFACE
    )
    :vars
    (
      ?auto_6659 - HOIST
      ?auto_6660 - PLACE
      ?auto_6655 - SURFACE
      ?auto_6658 - PLACE
      ?auto_6656 - HOIST
      ?auto_6661 - SURFACE
      ?auto_6657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6659 ?auto_6660 ) ( IS-CRATE ?auto_6654 ) ( not ( = ?auto_6653 ?auto_6654 ) ) ( not ( = ?auto_6655 ?auto_6653 ) ) ( not ( = ?auto_6655 ?auto_6654 ) ) ( not ( = ?auto_6658 ?auto_6660 ) ) ( HOIST-AT ?auto_6656 ?auto_6658 ) ( not ( = ?auto_6659 ?auto_6656 ) ) ( SURFACE-AT ?auto_6654 ?auto_6658 ) ( ON ?auto_6654 ?auto_6661 ) ( CLEAR ?auto_6654 ) ( not ( = ?auto_6653 ?auto_6661 ) ) ( not ( = ?auto_6654 ?auto_6661 ) ) ( not ( = ?auto_6655 ?auto_6661 ) ) ( SURFACE-AT ?auto_6655 ?auto_6660 ) ( CLEAR ?auto_6655 ) ( IS-CRATE ?auto_6653 ) ( AVAILABLE ?auto_6659 ) ( TRUCK-AT ?auto_6657 ?auto_6658 ) ( LIFTING ?auto_6656 ?auto_6653 ) )
    :subtasks
    ( ( !LOAD ?auto_6656 ?auto_6653 ?auto_6657 ?auto_6658 )
      ( MAKE-2CRATE ?auto_6655 ?auto_6653 ?auto_6654 )
      ( MAKE-1CRATE-VERIFY ?auto_6653 ?auto_6654 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6662 - SURFACE
      ?auto_6663 - SURFACE
      ?auto_6664 - SURFACE
    )
    :vars
    (
      ?auto_6669 - HOIST
      ?auto_6665 - PLACE
      ?auto_6666 - PLACE
      ?auto_6670 - HOIST
      ?auto_6668 - SURFACE
      ?auto_6667 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6669 ?auto_6665 ) ( IS-CRATE ?auto_6664 ) ( not ( = ?auto_6663 ?auto_6664 ) ) ( not ( = ?auto_6662 ?auto_6663 ) ) ( not ( = ?auto_6662 ?auto_6664 ) ) ( not ( = ?auto_6666 ?auto_6665 ) ) ( HOIST-AT ?auto_6670 ?auto_6666 ) ( not ( = ?auto_6669 ?auto_6670 ) ) ( SURFACE-AT ?auto_6664 ?auto_6666 ) ( ON ?auto_6664 ?auto_6668 ) ( CLEAR ?auto_6664 ) ( not ( = ?auto_6663 ?auto_6668 ) ) ( not ( = ?auto_6664 ?auto_6668 ) ) ( not ( = ?auto_6662 ?auto_6668 ) ) ( SURFACE-AT ?auto_6662 ?auto_6665 ) ( CLEAR ?auto_6662 ) ( IS-CRATE ?auto_6663 ) ( AVAILABLE ?auto_6669 ) ( TRUCK-AT ?auto_6667 ?auto_6666 ) ( LIFTING ?auto_6670 ?auto_6663 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6663 ?auto_6664 )
      ( MAKE-2CRATE-VERIFY ?auto_6662 ?auto_6663 ?auto_6664 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6671 - SURFACE
      ?auto_6672 - SURFACE
      ?auto_6673 - SURFACE
      ?auto_6674 - SURFACE
    )
    :vars
    (
      ?auto_6678 - HOIST
      ?auto_6680 - PLACE
      ?auto_6676 - PLACE
      ?auto_6677 - HOIST
      ?auto_6679 - SURFACE
      ?auto_6675 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6678 ?auto_6680 ) ( IS-CRATE ?auto_6674 ) ( not ( = ?auto_6673 ?auto_6674 ) ) ( not ( = ?auto_6672 ?auto_6673 ) ) ( not ( = ?auto_6672 ?auto_6674 ) ) ( not ( = ?auto_6676 ?auto_6680 ) ) ( HOIST-AT ?auto_6677 ?auto_6676 ) ( not ( = ?auto_6678 ?auto_6677 ) ) ( SURFACE-AT ?auto_6674 ?auto_6676 ) ( ON ?auto_6674 ?auto_6679 ) ( CLEAR ?auto_6674 ) ( not ( = ?auto_6673 ?auto_6679 ) ) ( not ( = ?auto_6674 ?auto_6679 ) ) ( not ( = ?auto_6672 ?auto_6679 ) ) ( SURFACE-AT ?auto_6672 ?auto_6680 ) ( CLEAR ?auto_6672 ) ( IS-CRATE ?auto_6673 ) ( AVAILABLE ?auto_6678 ) ( TRUCK-AT ?auto_6675 ?auto_6676 ) ( LIFTING ?auto_6677 ?auto_6673 ) ( ON ?auto_6672 ?auto_6671 ) ( not ( = ?auto_6671 ?auto_6672 ) ) ( not ( = ?auto_6671 ?auto_6673 ) ) ( not ( = ?auto_6671 ?auto_6674 ) ) ( not ( = ?auto_6671 ?auto_6679 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6672 ?auto_6673 ?auto_6674 )
      ( MAKE-3CRATE-VERIFY ?auto_6671 ?auto_6672 ?auto_6673 ?auto_6674 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6681 - SURFACE
      ?auto_6682 - SURFACE
    )
    :vars
    (
      ?auto_6686 - HOIST
      ?auto_6689 - PLACE
      ?auto_6687 - SURFACE
      ?auto_6684 - PLACE
      ?auto_6685 - HOIST
      ?auto_6688 - SURFACE
      ?auto_6683 - TRUCK
      ?auto_6690 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6686 ?auto_6689 ) ( IS-CRATE ?auto_6682 ) ( not ( = ?auto_6681 ?auto_6682 ) ) ( not ( = ?auto_6687 ?auto_6681 ) ) ( not ( = ?auto_6687 ?auto_6682 ) ) ( not ( = ?auto_6684 ?auto_6689 ) ) ( HOIST-AT ?auto_6685 ?auto_6684 ) ( not ( = ?auto_6686 ?auto_6685 ) ) ( SURFACE-AT ?auto_6682 ?auto_6684 ) ( ON ?auto_6682 ?auto_6688 ) ( CLEAR ?auto_6682 ) ( not ( = ?auto_6681 ?auto_6688 ) ) ( not ( = ?auto_6682 ?auto_6688 ) ) ( not ( = ?auto_6687 ?auto_6688 ) ) ( SURFACE-AT ?auto_6687 ?auto_6689 ) ( CLEAR ?auto_6687 ) ( IS-CRATE ?auto_6681 ) ( AVAILABLE ?auto_6686 ) ( TRUCK-AT ?auto_6683 ?auto_6684 ) ( AVAILABLE ?auto_6685 ) ( SURFACE-AT ?auto_6681 ?auto_6684 ) ( ON ?auto_6681 ?auto_6690 ) ( CLEAR ?auto_6681 ) ( not ( = ?auto_6681 ?auto_6690 ) ) ( not ( = ?auto_6682 ?auto_6690 ) ) ( not ( = ?auto_6687 ?auto_6690 ) ) ( not ( = ?auto_6688 ?auto_6690 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6685 ?auto_6681 ?auto_6690 ?auto_6684 )
      ( MAKE-2CRATE ?auto_6687 ?auto_6681 ?auto_6682 )
      ( MAKE-1CRATE-VERIFY ?auto_6681 ?auto_6682 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6691 - SURFACE
      ?auto_6692 - SURFACE
      ?auto_6693 - SURFACE
    )
    :vars
    (
      ?auto_6694 - HOIST
      ?auto_6699 - PLACE
      ?auto_6697 - PLACE
      ?auto_6696 - HOIST
      ?auto_6698 - SURFACE
      ?auto_6700 - TRUCK
      ?auto_6695 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6694 ?auto_6699 ) ( IS-CRATE ?auto_6693 ) ( not ( = ?auto_6692 ?auto_6693 ) ) ( not ( = ?auto_6691 ?auto_6692 ) ) ( not ( = ?auto_6691 ?auto_6693 ) ) ( not ( = ?auto_6697 ?auto_6699 ) ) ( HOIST-AT ?auto_6696 ?auto_6697 ) ( not ( = ?auto_6694 ?auto_6696 ) ) ( SURFACE-AT ?auto_6693 ?auto_6697 ) ( ON ?auto_6693 ?auto_6698 ) ( CLEAR ?auto_6693 ) ( not ( = ?auto_6692 ?auto_6698 ) ) ( not ( = ?auto_6693 ?auto_6698 ) ) ( not ( = ?auto_6691 ?auto_6698 ) ) ( SURFACE-AT ?auto_6691 ?auto_6699 ) ( CLEAR ?auto_6691 ) ( IS-CRATE ?auto_6692 ) ( AVAILABLE ?auto_6694 ) ( TRUCK-AT ?auto_6700 ?auto_6697 ) ( AVAILABLE ?auto_6696 ) ( SURFACE-AT ?auto_6692 ?auto_6697 ) ( ON ?auto_6692 ?auto_6695 ) ( CLEAR ?auto_6692 ) ( not ( = ?auto_6692 ?auto_6695 ) ) ( not ( = ?auto_6693 ?auto_6695 ) ) ( not ( = ?auto_6691 ?auto_6695 ) ) ( not ( = ?auto_6698 ?auto_6695 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6692 ?auto_6693 )
      ( MAKE-2CRATE-VERIFY ?auto_6691 ?auto_6692 ?auto_6693 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6701 - SURFACE
      ?auto_6702 - SURFACE
      ?auto_6703 - SURFACE
      ?auto_6704 - SURFACE
    )
    :vars
    (
      ?auto_6706 - HOIST
      ?auto_6709 - PLACE
      ?auto_6705 - PLACE
      ?auto_6707 - HOIST
      ?auto_6708 - SURFACE
      ?auto_6711 - TRUCK
      ?auto_6710 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6706 ?auto_6709 ) ( IS-CRATE ?auto_6704 ) ( not ( = ?auto_6703 ?auto_6704 ) ) ( not ( = ?auto_6702 ?auto_6703 ) ) ( not ( = ?auto_6702 ?auto_6704 ) ) ( not ( = ?auto_6705 ?auto_6709 ) ) ( HOIST-AT ?auto_6707 ?auto_6705 ) ( not ( = ?auto_6706 ?auto_6707 ) ) ( SURFACE-AT ?auto_6704 ?auto_6705 ) ( ON ?auto_6704 ?auto_6708 ) ( CLEAR ?auto_6704 ) ( not ( = ?auto_6703 ?auto_6708 ) ) ( not ( = ?auto_6704 ?auto_6708 ) ) ( not ( = ?auto_6702 ?auto_6708 ) ) ( SURFACE-AT ?auto_6702 ?auto_6709 ) ( CLEAR ?auto_6702 ) ( IS-CRATE ?auto_6703 ) ( AVAILABLE ?auto_6706 ) ( TRUCK-AT ?auto_6711 ?auto_6705 ) ( AVAILABLE ?auto_6707 ) ( SURFACE-AT ?auto_6703 ?auto_6705 ) ( ON ?auto_6703 ?auto_6710 ) ( CLEAR ?auto_6703 ) ( not ( = ?auto_6703 ?auto_6710 ) ) ( not ( = ?auto_6704 ?auto_6710 ) ) ( not ( = ?auto_6702 ?auto_6710 ) ) ( not ( = ?auto_6708 ?auto_6710 ) ) ( ON ?auto_6702 ?auto_6701 ) ( not ( = ?auto_6701 ?auto_6702 ) ) ( not ( = ?auto_6701 ?auto_6703 ) ) ( not ( = ?auto_6701 ?auto_6704 ) ) ( not ( = ?auto_6701 ?auto_6708 ) ) ( not ( = ?auto_6701 ?auto_6710 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6702 ?auto_6703 ?auto_6704 )
      ( MAKE-3CRATE-VERIFY ?auto_6701 ?auto_6702 ?auto_6703 ?auto_6704 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6712 - SURFACE
      ?auto_6713 - SURFACE
    )
    :vars
    (
      ?auto_6715 - HOIST
      ?auto_6718 - PLACE
      ?auto_6721 - SURFACE
      ?auto_6714 - PLACE
      ?auto_6716 - HOIST
      ?auto_6717 - SURFACE
      ?auto_6719 - SURFACE
      ?auto_6720 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6715 ?auto_6718 ) ( IS-CRATE ?auto_6713 ) ( not ( = ?auto_6712 ?auto_6713 ) ) ( not ( = ?auto_6721 ?auto_6712 ) ) ( not ( = ?auto_6721 ?auto_6713 ) ) ( not ( = ?auto_6714 ?auto_6718 ) ) ( HOIST-AT ?auto_6716 ?auto_6714 ) ( not ( = ?auto_6715 ?auto_6716 ) ) ( SURFACE-AT ?auto_6713 ?auto_6714 ) ( ON ?auto_6713 ?auto_6717 ) ( CLEAR ?auto_6713 ) ( not ( = ?auto_6712 ?auto_6717 ) ) ( not ( = ?auto_6713 ?auto_6717 ) ) ( not ( = ?auto_6721 ?auto_6717 ) ) ( SURFACE-AT ?auto_6721 ?auto_6718 ) ( CLEAR ?auto_6721 ) ( IS-CRATE ?auto_6712 ) ( AVAILABLE ?auto_6715 ) ( AVAILABLE ?auto_6716 ) ( SURFACE-AT ?auto_6712 ?auto_6714 ) ( ON ?auto_6712 ?auto_6719 ) ( CLEAR ?auto_6712 ) ( not ( = ?auto_6712 ?auto_6719 ) ) ( not ( = ?auto_6713 ?auto_6719 ) ) ( not ( = ?auto_6721 ?auto_6719 ) ) ( not ( = ?auto_6717 ?auto_6719 ) ) ( TRUCK-AT ?auto_6720 ?auto_6718 ) )
    :subtasks
    ( ( !DRIVE ?auto_6720 ?auto_6718 ?auto_6714 )
      ( MAKE-2CRATE ?auto_6721 ?auto_6712 ?auto_6713 )
      ( MAKE-1CRATE-VERIFY ?auto_6712 ?auto_6713 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6722 - SURFACE
      ?auto_6723 - SURFACE
      ?auto_6724 - SURFACE
    )
    :vars
    (
      ?auto_6727 - HOIST
      ?auto_6728 - PLACE
      ?auto_6725 - PLACE
      ?auto_6726 - HOIST
      ?auto_6731 - SURFACE
      ?auto_6730 - SURFACE
      ?auto_6729 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6727 ?auto_6728 ) ( IS-CRATE ?auto_6724 ) ( not ( = ?auto_6723 ?auto_6724 ) ) ( not ( = ?auto_6722 ?auto_6723 ) ) ( not ( = ?auto_6722 ?auto_6724 ) ) ( not ( = ?auto_6725 ?auto_6728 ) ) ( HOIST-AT ?auto_6726 ?auto_6725 ) ( not ( = ?auto_6727 ?auto_6726 ) ) ( SURFACE-AT ?auto_6724 ?auto_6725 ) ( ON ?auto_6724 ?auto_6731 ) ( CLEAR ?auto_6724 ) ( not ( = ?auto_6723 ?auto_6731 ) ) ( not ( = ?auto_6724 ?auto_6731 ) ) ( not ( = ?auto_6722 ?auto_6731 ) ) ( SURFACE-AT ?auto_6722 ?auto_6728 ) ( CLEAR ?auto_6722 ) ( IS-CRATE ?auto_6723 ) ( AVAILABLE ?auto_6727 ) ( AVAILABLE ?auto_6726 ) ( SURFACE-AT ?auto_6723 ?auto_6725 ) ( ON ?auto_6723 ?auto_6730 ) ( CLEAR ?auto_6723 ) ( not ( = ?auto_6723 ?auto_6730 ) ) ( not ( = ?auto_6724 ?auto_6730 ) ) ( not ( = ?auto_6722 ?auto_6730 ) ) ( not ( = ?auto_6731 ?auto_6730 ) ) ( TRUCK-AT ?auto_6729 ?auto_6728 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6723 ?auto_6724 )
      ( MAKE-2CRATE-VERIFY ?auto_6722 ?auto_6723 ?auto_6724 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6732 - SURFACE
      ?auto_6733 - SURFACE
      ?auto_6734 - SURFACE
      ?auto_6735 - SURFACE
    )
    :vars
    (
      ?auto_6737 - HOIST
      ?auto_6738 - PLACE
      ?auto_6740 - PLACE
      ?auto_6741 - HOIST
      ?auto_6736 - SURFACE
      ?auto_6739 - SURFACE
      ?auto_6742 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6737 ?auto_6738 ) ( IS-CRATE ?auto_6735 ) ( not ( = ?auto_6734 ?auto_6735 ) ) ( not ( = ?auto_6733 ?auto_6734 ) ) ( not ( = ?auto_6733 ?auto_6735 ) ) ( not ( = ?auto_6740 ?auto_6738 ) ) ( HOIST-AT ?auto_6741 ?auto_6740 ) ( not ( = ?auto_6737 ?auto_6741 ) ) ( SURFACE-AT ?auto_6735 ?auto_6740 ) ( ON ?auto_6735 ?auto_6736 ) ( CLEAR ?auto_6735 ) ( not ( = ?auto_6734 ?auto_6736 ) ) ( not ( = ?auto_6735 ?auto_6736 ) ) ( not ( = ?auto_6733 ?auto_6736 ) ) ( SURFACE-AT ?auto_6733 ?auto_6738 ) ( CLEAR ?auto_6733 ) ( IS-CRATE ?auto_6734 ) ( AVAILABLE ?auto_6737 ) ( AVAILABLE ?auto_6741 ) ( SURFACE-AT ?auto_6734 ?auto_6740 ) ( ON ?auto_6734 ?auto_6739 ) ( CLEAR ?auto_6734 ) ( not ( = ?auto_6734 ?auto_6739 ) ) ( not ( = ?auto_6735 ?auto_6739 ) ) ( not ( = ?auto_6733 ?auto_6739 ) ) ( not ( = ?auto_6736 ?auto_6739 ) ) ( TRUCK-AT ?auto_6742 ?auto_6738 ) ( ON ?auto_6733 ?auto_6732 ) ( not ( = ?auto_6732 ?auto_6733 ) ) ( not ( = ?auto_6732 ?auto_6734 ) ) ( not ( = ?auto_6732 ?auto_6735 ) ) ( not ( = ?auto_6732 ?auto_6736 ) ) ( not ( = ?auto_6732 ?auto_6739 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6733 ?auto_6734 ?auto_6735 )
      ( MAKE-3CRATE-VERIFY ?auto_6732 ?auto_6733 ?auto_6734 ?auto_6735 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6743 - SURFACE
      ?auto_6744 - SURFACE
    )
    :vars
    (
      ?auto_6746 - HOIST
      ?auto_6747 - PLACE
      ?auto_6750 - SURFACE
      ?auto_6749 - PLACE
      ?auto_6751 - HOIST
      ?auto_6745 - SURFACE
      ?auto_6748 - SURFACE
      ?auto_6752 - TRUCK
      ?auto_6753 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6746 ?auto_6747 ) ( IS-CRATE ?auto_6744 ) ( not ( = ?auto_6743 ?auto_6744 ) ) ( not ( = ?auto_6750 ?auto_6743 ) ) ( not ( = ?auto_6750 ?auto_6744 ) ) ( not ( = ?auto_6749 ?auto_6747 ) ) ( HOIST-AT ?auto_6751 ?auto_6749 ) ( not ( = ?auto_6746 ?auto_6751 ) ) ( SURFACE-AT ?auto_6744 ?auto_6749 ) ( ON ?auto_6744 ?auto_6745 ) ( CLEAR ?auto_6744 ) ( not ( = ?auto_6743 ?auto_6745 ) ) ( not ( = ?auto_6744 ?auto_6745 ) ) ( not ( = ?auto_6750 ?auto_6745 ) ) ( IS-CRATE ?auto_6743 ) ( AVAILABLE ?auto_6751 ) ( SURFACE-AT ?auto_6743 ?auto_6749 ) ( ON ?auto_6743 ?auto_6748 ) ( CLEAR ?auto_6743 ) ( not ( = ?auto_6743 ?auto_6748 ) ) ( not ( = ?auto_6744 ?auto_6748 ) ) ( not ( = ?auto_6750 ?auto_6748 ) ) ( not ( = ?auto_6745 ?auto_6748 ) ) ( TRUCK-AT ?auto_6752 ?auto_6747 ) ( SURFACE-AT ?auto_6753 ?auto_6747 ) ( CLEAR ?auto_6753 ) ( LIFTING ?auto_6746 ?auto_6750 ) ( IS-CRATE ?auto_6750 ) ( not ( = ?auto_6753 ?auto_6750 ) ) ( not ( = ?auto_6743 ?auto_6753 ) ) ( not ( = ?auto_6744 ?auto_6753 ) ) ( not ( = ?auto_6745 ?auto_6753 ) ) ( not ( = ?auto_6748 ?auto_6753 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6753 ?auto_6750 )
      ( MAKE-2CRATE ?auto_6750 ?auto_6743 ?auto_6744 )
      ( MAKE-1CRATE-VERIFY ?auto_6743 ?auto_6744 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6754 - SURFACE
      ?auto_6755 - SURFACE
      ?auto_6756 - SURFACE
    )
    :vars
    (
      ?auto_6761 - HOIST
      ?auto_6758 - PLACE
      ?auto_6763 - PLACE
      ?auto_6759 - HOIST
      ?auto_6760 - SURFACE
      ?auto_6757 - SURFACE
      ?auto_6762 - TRUCK
      ?auto_6764 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6761 ?auto_6758 ) ( IS-CRATE ?auto_6756 ) ( not ( = ?auto_6755 ?auto_6756 ) ) ( not ( = ?auto_6754 ?auto_6755 ) ) ( not ( = ?auto_6754 ?auto_6756 ) ) ( not ( = ?auto_6763 ?auto_6758 ) ) ( HOIST-AT ?auto_6759 ?auto_6763 ) ( not ( = ?auto_6761 ?auto_6759 ) ) ( SURFACE-AT ?auto_6756 ?auto_6763 ) ( ON ?auto_6756 ?auto_6760 ) ( CLEAR ?auto_6756 ) ( not ( = ?auto_6755 ?auto_6760 ) ) ( not ( = ?auto_6756 ?auto_6760 ) ) ( not ( = ?auto_6754 ?auto_6760 ) ) ( IS-CRATE ?auto_6755 ) ( AVAILABLE ?auto_6759 ) ( SURFACE-AT ?auto_6755 ?auto_6763 ) ( ON ?auto_6755 ?auto_6757 ) ( CLEAR ?auto_6755 ) ( not ( = ?auto_6755 ?auto_6757 ) ) ( not ( = ?auto_6756 ?auto_6757 ) ) ( not ( = ?auto_6754 ?auto_6757 ) ) ( not ( = ?auto_6760 ?auto_6757 ) ) ( TRUCK-AT ?auto_6762 ?auto_6758 ) ( SURFACE-AT ?auto_6764 ?auto_6758 ) ( CLEAR ?auto_6764 ) ( LIFTING ?auto_6761 ?auto_6754 ) ( IS-CRATE ?auto_6754 ) ( not ( = ?auto_6764 ?auto_6754 ) ) ( not ( = ?auto_6755 ?auto_6764 ) ) ( not ( = ?auto_6756 ?auto_6764 ) ) ( not ( = ?auto_6760 ?auto_6764 ) ) ( not ( = ?auto_6757 ?auto_6764 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6755 ?auto_6756 )
      ( MAKE-2CRATE-VERIFY ?auto_6754 ?auto_6755 ?auto_6756 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6765 - SURFACE
      ?auto_6766 - SURFACE
      ?auto_6767 - SURFACE
      ?auto_6768 - SURFACE
    )
    :vars
    (
      ?auto_6769 - HOIST
      ?auto_6773 - PLACE
      ?auto_6774 - PLACE
      ?auto_6772 - HOIST
      ?auto_6775 - SURFACE
      ?auto_6771 - SURFACE
      ?auto_6770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6769 ?auto_6773 ) ( IS-CRATE ?auto_6768 ) ( not ( = ?auto_6767 ?auto_6768 ) ) ( not ( = ?auto_6766 ?auto_6767 ) ) ( not ( = ?auto_6766 ?auto_6768 ) ) ( not ( = ?auto_6774 ?auto_6773 ) ) ( HOIST-AT ?auto_6772 ?auto_6774 ) ( not ( = ?auto_6769 ?auto_6772 ) ) ( SURFACE-AT ?auto_6768 ?auto_6774 ) ( ON ?auto_6768 ?auto_6775 ) ( CLEAR ?auto_6768 ) ( not ( = ?auto_6767 ?auto_6775 ) ) ( not ( = ?auto_6768 ?auto_6775 ) ) ( not ( = ?auto_6766 ?auto_6775 ) ) ( IS-CRATE ?auto_6767 ) ( AVAILABLE ?auto_6772 ) ( SURFACE-AT ?auto_6767 ?auto_6774 ) ( ON ?auto_6767 ?auto_6771 ) ( CLEAR ?auto_6767 ) ( not ( = ?auto_6767 ?auto_6771 ) ) ( not ( = ?auto_6768 ?auto_6771 ) ) ( not ( = ?auto_6766 ?auto_6771 ) ) ( not ( = ?auto_6775 ?auto_6771 ) ) ( TRUCK-AT ?auto_6770 ?auto_6773 ) ( SURFACE-AT ?auto_6765 ?auto_6773 ) ( CLEAR ?auto_6765 ) ( LIFTING ?auto_6769 ?auto_6766 ) ( IS-CRATE ?auto_6766 ) ( not ( = ?auto_6765 ?auto_6766 ) ) ( not ( = ?auto_6767 ?auto_6765 ) ) ( not ( = ?auto_6768 ?auto_6765 ) ) ( not ( = ?auto_6775 ?auto_6765 ) ) ( not ( = ?auto_6771 ?auto_6765 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6766 ?auto_6767 ?auto_6768 )
      ( MAKE-3CRATE-VERIFY ?auto_6765 ?auto_6766 ?auto_6767 ?auto_6768 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6911 - SURFACE
      ?auto_6912 - SURFACE
      ?auto_6913 - SURFACE
      ?auto_6914 - SURFACE
      ?auto_6915 - SURFACE
    )
    :vars
    (
      ?auto_6917 - HOIST
      ?auto_6916 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6917 ?auto_6916 ) ( SURFACE-AT ?auto_6914 ?auto_6916 ) ( CLEAR ?auto_6914 ) ( LIFTING ?auto_6917 ?auto_6915 ) ( IS-CRATE ?auto_6915 ) ( not ( = ?auto_6914 ?auto_6915 ) ) ( ON ?auto_6912 ?auto_6911 ) ( ON ?auto_6913 ?auto_6912 ) ( ON ?auto_6914 ?auto_6913 ) ( not ( = ?auto_6911 ?auto_6912 ) ) ( not ( = ?auto_6911 ?auto_6913 ) ) ( not ( = ?auto_6911 ?auto_6914 ) ) ( not ( = ?auto_6911 ?auto_6915 ) ) ( not ( = ?auto_6912 ?auto_6913 ) ) ( not ( = ?auto_6912 ?auto_6914 ) ) ( not ( = ?auto_6912 ?auto_6915 ) ) ( not ( = ?auto_6913 ?auto_6914 ) ) ( not ( = ?auto_6913 ?auto_6915 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6914 ?auto_6915 )
      ( MAKE-4CRATE-VERIFY ?auto_6911 ?auto_6912 ?auto_6913 ?auto_6914 ?auto_6915 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6936 - SURFACE
      ?auto_6937 - SURFACE
      ?auto_6938 - SURFACE
      ?auto_6939 - SURFACE
      ?auto_6940 - SURFACE
    )
    :vars
    (
      ?auto_6941 - HOIST
      ?auto_6943 - PLACE
      ?auto_6942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6941 ?auto_6943 ) ( SURFACE-AT ?auto_6939 ?auto_6943 ) ( CLEAR ?auto_6939 ) ( IS-CRATE ?auto_6940 ) ( not ( = ?auto_6939 ?auto_6940 ) ) ( TRUCK-AT ?auto_6942 ?auto_6943 ) ( AVAILABLE ?auto_6941 ) ( IN ?auto_6940 ?auto_6942 ) ( ON ?auto_6939 ?auto_6938 ) ( not ( = ?auto_6938 ?auto_6939 ) ) ( not ( = ?auto_6938 ?auto_6940 ) ) ( ON ?auto_6937 ?auto_6936 ) ( ON ?auto_6938 ?auto_6937 ) ( not ( = ?auto_6936 ?auto_6937 ) ) ( not ( = ?auto_6936 ?auto_6938 ) ) ( not ( = ?auto_6936 ?auto_6939 ) ) ( not ( = ?auto_6936 ?auto_6940 ) ) ( not ( = ?auto_6937 ?auto_6938 ) ) ( not ( = ?auto_6937 ?auto_6939 ) ) ( not ( = ?auto_6937 ?auto_6940 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6938 ?auto_6939 ?auto_6940 )
      ( MAKE-4CRATE-VERIFY ?auto_6936 ?auto_6937 ?auto_6938 ?auto_6939 ?auto_6940 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6966 - SURFACE
      ?auto_6967 - SURFACE
      ?auto_6968 - SURFACE
      ?auto_6969 - SURFACE
      ?auto_6970 - SURFACE
    )
    :vars
    (
      ?auto_6974 - HOIST
      ?auto_6972 - PLACE
      ?auto_6971 - TRUCK
      ?auto_6973 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6974 ?auto_6972 ) ( SURFACE-AT ?auto_6969 ?auto_6972 ) ( CLEAR ?auto_6969 ) ( IS-CRATE ?auto_6970 ) ( not ( = ?auto_6969 ?auto_6970 ) ) ( AVAILABLE ?auto_6974 ) ( IN ?auto_6970 ?auto_6971 ) ( ON ?auto_6969 ?auto_6968 ) ( not ( = ?auto_6968 ?auto_6969 ) ) ( not ( = ?auto_6968 ?auto_6970 ) ) ( TRUCK-AT ?auto_6971 ?auto_6973 ) ( not ( = ?auto_6973 ?auto_6972 ) ) ( ON ?auto_6967 ?auto_6966 ) ( ON ?auto_6968 ?auto_6967 ) ( not ( = ?auto_6966 ?auto_6967 ) ) ( not ( = ?auto_6966 ?auto_6968 ) ) ( not ( = ?auto_6966 ?auto_6969 ) ) ( not ( = ?auto_6966 ?auto_6970 ) ) ( not ( = ?auto_6967 ?auto_6968 ) ) ( not ( = ?auto_6967 ?auto_6969 ) ) ( not ( = ?auto_6967 ?auto_6970 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6968 ?auto_6969 ?auto_6970 )
      ( MAKE-4CRATE-VERIFY ?auto_6966 ?auto_6967 ?auto_6968 ?auto_6969 ?auto_6970 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7000 - SURFACE
      ?auto_7001 - SURFACE
      ?auto_7002 - SURFACE
      ?auto_7003 - SURFACE
      ?auto_7004 - SURFACE
    )
    :vars
    (
      ?auto_7006 - HOIST
      ?auto_7009 - PLACE
      ?auto_7007 - TRUCK
      ?auto_7008 - PLACE
      ?auto_7005 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7006 ?auto_7009 ) ( SURFACE-AT ?auto_7003 ?auto_7009 ) ( CLEAR ?auto_7003 ) ( IS-CRATE ?auto_7004 ) ( not ( = ?auto_7003 ?auto_7004 ) ) ( AVAILABLE ?auto_7006 ) ( ON ?auto_7003 ?auto_7002 ) ( not ( = ?auto_7002 ?auto_7003 ) ) ( not ( = ?auto_7002 ?auto_7004 ) ) ( TRUCK-AT ?auto_7007 ?auto_7008 ) ( not ( = ?auto_7008 ?auto_7009 ) ) ( HOIST-AT ?auto_7005 ?auto_7008 ) ( LIFTING ?auto_7005 ?auto_7004 ) ( not ( = ?auto_7006 ?auto_7005 ) ) ( ON ?auto_7001 ?auto_7000 ) ( ON ?auto_7002 ?auto_7001 ) ( not ( = ?auto_7000 ?auto_7001 ) ) ( not ( = ?auto_7000 ?auto_7002 ) ) ( not ( = ?auto_7000 ?auto_7003 ) ) ( not ( = ?auto_7000 ?auto_7004 ) ) ( not ( = ?auto_7001 ?auto_7002 ) ) ( not ( = ?auto_7001 ?auto_7003 ) ) ( not ( = ?auto_7001 ?auto_7004 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7002 ?auto_7003 ?auto_7004 )
      ( MAKE-4CRATE-VERIFY ?auto_7000 ?auto_7001 ?auto_7002 ?auto_7003 ?auto_7004 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7038 - SURFACE
      ?auto_7039 - SURFACE
      ?auto_7040 - SURFACE
      ?auto_7041 - SURFACE
      ?auto_7042 - SURFACE
    )
    :vars
    (
      ?auto_7046 - HOIST
      ?auto_7043 - PLACE
      ?auto_7048 - TRUCK
      ?auto_7044 - PLACE
      ?auto_7047 - HOIST
      ?auto_7045 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7046 ?auto_7043 ) ( SURFACE-AT ?auto_7041 ?auto_7043 ) ( CLEAR ?auto_7041 ) ( IS-CRATE ?auto_7042 ) ( not ( = ?auto_7041 ?auto_7042 ) ) ( AVAILABLE ?auto_7046 ) ( ON ?auto_7041 ?auto_7040 ) ( not ( = ?auto_7040 ?auto_7041 ) ) ( not ( = ?auto_7040 ?auto_7042 ) ) ( TRUCK-AT ?auto_7048 ?auto_7044 ) ( not ( = ?auto_7044 ?auto_7043 ) ) ( HOIST-AT ?auto_7047 ?auto_7044 ) ( not ( = ?auto_7046 ?auto_7047 ) ) ( AVAILABLE ?auto_7047 ) ( SURFACE-AT ?auto_7042 ?auto_7044 ) ( ON ?auto_7042 ?auto_7045 ) ( CLEAR ?auto_7042 ) ( not ( = ?auto_7041 ?auto_7045 ) ) ( not ( = ?auto_7042 ?auto_7045 ) ) ( not ( = ?auto_7040 ?auto_7045 ) ) ( ON ?auto_7039 ?auto_7038 ) ( ON ?auto_7040 ?auto_7039 ) ( not ( = ?auto_7038 ?auto_7039 ) ) ( not ( = ?auto_7038 ?auto_7040 ) ) ( not ( = ?auto_7038 ?auto_7041 ) ) ( not ( = ?auto_7038 ?auto_7042 ) ) ( not ( = ?auto_7038 ?auto_7045 ) ) ( not ( = ?auto_7039 ?auto_7040 ) ) ( not ( = ?auto_7039 ?auto_7041 ) ) ( not ( = ?auto_7039 ?auto_7042 ) ) ( not ( = ?auto_7039 ?auto_7045 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7040 ?auto_7041 ?auto_7042 )
      ( MAKE-4CRATE-VERIFY ?auto_7038 ?auto_7039 ?auto_7040 ?auto_7041 ?auto_7042 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7077 - SURFACE
      ?auto_7078 - SURFACE
      ?auto_7079 - SURFACE
      ?auto_7080 - SURFACE
      ?auto_7081 - SURFACE
    )
    :vars
    (
      ?auto_7082 - HOIST
      ?auto_7087 - PLACE
      ?auto_7084 - PLACE
      ?auto_7086 - HOIST
      ?auto_7083 - SURFACE
      ?auto_7085 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7082 ?auto_7087 ) ( SURFACE-AT ?auto_7080 ?auto_7087 ) ( CLEAR ?auto_7080 ) ( IS-CRATE ?auto_7081 ) ( not ( = ?auto_7080 ?auto_7081 ) ) ( AVAILABLE ?auto_7082 ) ( ON ?auto_7080 ?auto_7079 ) ( not ( = ?auto_7079 ?auto_7080 ) ) ( not ( = ?auto_7079 ?auto_7081 ) ) ( not ( = ?auto_7084 ?auto_7087 ) ) ( HOIST-AT ?auto_7086 ?auto_7084 ) ( not ( = ?auto_7082 ?auto_7086 ) ) ( AVAILABLE ?auto_7086 ) ( SURFACE-AT ?auto_7081 ?auto_7084 ) ( ON ?auto_7081 ?auto_7083 ) ( CLEAR ?auto_7081 ) ( not ( = ?auto_7080 ?auto_7083 ) ) ( not ( = ?auto_7081 ?auto_7083 ) ) ( not ( = ?auto_7079 ?auto_7083 ) ) ( TRUCK-AT ?auto_7085 ?auto_7087 ) ( ON ?auto_7078 ?auto_7077 ) ( ON ?auto_7079 ?auto_7078 ) ( not ( = ?auto_7077 ?auto_7078 ) ) ( not ( = ?auto_7077 ?auto_7079 ) ) ( not ( = ?auto_7077 ?auto_7080 ) ) ( not ( = ?auto_7077 ?auto_7081 ) ) ( not ( = ?auto_7077 ?auto_7083 ) ) ( not ( = ?auto_7078 ?auto_7079 ) ) ( not ( = ?auto_7078 ?auto_7080 ) ) ( not ( = ?auto_7078 ?auto_7081 ) ) ( not ( = ?auto_7078 ?auto_7083 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7079 ?auto_7080 ?auto_7081 )
      ( MAKE-4CRATE-VERIFY ?auto_7077 ?auto_7078 ?auto_7079 ?auto_7080 ?auto_7081 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7116 - SURFACE
      ?auto_7117 - SURFACE
      ?auto_7118 - SURFACE
      ?auto_7119 - SURFACE
      ?auto_7120 - SURFACE
    )
    :vars
    (
      ?auto_7122 - HOIST
      ?auto_7125 - PLACE
      ?auto_7121 - PLACE
      ?auto_7123 - HOIST
      ?auto_7124 - SURFACE
      ?auto_7126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7122 ?auto_7125 ) ( IS-CRATE ?auto_7120 ) ( not ( = ?auto_7119 ?auto_7120 ) ) ( not ( = ?auto_7118 ?auto_7119 ) ) ( not ( = ?auto_7118 ?auto_7120 ) ) ( not ( = ?auto_7121 ?auto_7125 ) ) ( HOIST-AT ?auto_7123 ?auto_7121 ) ( not ( = ?auto_7122 ?auto_7123 ) ) ( AVAILABLE ?auto_7123 ) ( SURFACE-AT ?auto_7120 ?auto_7121 ) ( ON ?auto_7120 ?auto_7124 ) ( CLEAR ?auto_7120 ) ( not ( = ?auto_7119 ?auto_7124 ) ) ( not ( = ?auto_7120 ?auto_7124 ) ) ( not ( = ?auto_7118 ?auto_7124 ) ) ( TRUCK-AT ?auto_7126 ?auto_7125 ) ( SURFACE-AT ?auto_7118 ?auto_7125 ) ( CLEAR ?auto_7118 ) ( LIFTING ?auto_7122 ?auto_7119 ) ( IS-CRATE ?auto_7119 ) ( ON ?auto_7117 ?auto_7116 ) ( ON ?auto_7118 ?auto_7117 ) ( not ( = ?auto_7116 ?auto_7117 ) ) ( not ( = ?auto_7116 ?auto_7118 ) ) ( not ( = ?auto_7116 ?auto_7119 ) ) ( not ( = ?auto_7116 ?auto_7120 ) ) ( not ( = ?auto_7116 ?auto_7124 ) ) ( not ( = ?auto_7117 ?auto_7118 ) ) ( not ( = ?auto_7117 ?auto_7119 ) ) ( not ( = ?auto_7117 ?auto_7120 ) ) ( not ( = ?auto_7117 ?auto_7124 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7118 ?auto_7119 ?auto_7120 )
      ( MAKE-4CRATE-VERIFY ?auto_7116 ?auto_7117 ?auto_7118 ?auto_7119 ?auto_7120 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7155 - SURFACE
      ?auto_7156 - SURFACE
      ?auto_7157 - SURFACE
      ?auto_7158 - SURFACE
      ?auto_7159 - SURFACE
    )
    :vars
    (
      ?auto_7160 - HOIST
      ?auto_7162 - PLACE
      ?auto_7164 - PLACE
      ?auto_7163 - HOIST
      ?auto_7165 - SURFACE
      ?auto_7161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7160 ?auto_7162 ) ( IS-CRATE ?auto_7159 ) ( not ( = ?auto_7158 ?auto_7159 ) ) ( not ( = ?auto_7157 ?auto_7158 ) ) ( not ( = ?auto_7157 ?auto_7159 ) ) ( not ( = ?auto_7164 ?auto_7162 ) ) ( HOIST-AT ?auto_7163 ?auto_7164 ) ( not ( = ?auto_7160 ?auto_7163 ) ) ( AVAILABLE ?auto_7163 ) ( SURFACE-AT ?auto_7159 ?auto_7164 ) ( ON ?auto_7159 ?auto_7165 ) ( CLEAR ?auto_7159 ) ( not ( = ?auto_7158 ?auto_7165 ) ) ( not ( = ?auto_7159 ?auto_7165 ) ) ( not ( = ?auto_7157 ?auto_7165 ) ) ( TRUCK-AT ?auto_7161 ?auto_7162 ) ( SURFACE-AT ?auto_7157 ?auto_7162 ) ( CLEAR ?auto_7157 ) ( IS-CRATE ?auto_7158 ) ( AVAILABLE ?auto_7160 ) ( IN ?auto_7158 ?auto_7161 ) ( ON ?auto_7156 ?auto_7155 ) ( ON ?auto_7157 ?auto_7156 ) ( not ( = ?auto_7155 ?auto_7156 ) ) ( not ( = ?auto_7155 ?auto_7157 ) ) ( not ( = ?auto_7155 ?auto_7158 ) ) ( not ( = ?auto_7155 ?auto_7159 ) ) ( not ( = ?auto_7155 ?auto_7165 ) ) ( not ( = ?auto_7156 ?auto_7157 ) ) ( not ( = ?auto_7156 ?auto_7158 ) ) ( not ( = ?auto_7156 ?auto_7159 ) ) ( not ( = ?auto_7156 ?auto_7165 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7157 ?auto_7158 ?auto_7159 )
      ( MAKE-4CRATE-VERIFY ?auto_7155 ?auto_7156 ?auto_7157 ?auto_7158 ?auto_7159 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7194 - SURFACE
      ?auto_7195 - SURFACE
      ?auto_7196 - SURFACE
      ?auto_7197 - SURFACE
      ?auto_7198 - SURFACE
    )
    :vars
    (
      ?auto_7203 - HOIST
      ?auto_7202 - PLACE
      ?auto_7199 - PLACE
      ?auto_7204 - HOIST
      ?auto_7201 - SURFACE
      ?auto_7200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7203 ?auto_7202 ) ( IS-CRATE ?auto_7198 ) ( not ( = ?auto_7197 ?auto_7198 ) ) ( not ( = ?auto_7196 ?auto_7197 ) ) ( not ( = ?auto_7196 ?auto_7198 ) ) ( not ( = ?auto_7199 ?auto_7202 ) ) ( HOIST-AT ?auto_7204 ?auto_7199 ) ( not ( = ?auto_7203 ?auto_7204 ) ) ( AVAILABLE ?auto_7204 ) ( SURFACE-AT ?auto_7198 ?auto_7199 ) ( ON ?auto_7198 ?auto_7201 ) ( CLEAR ?auto_7198 ) ( not ( = ?auto_7197 ?auto_7201 ) ) ( not ( = ?auto_7198 ?auto_7201 ) ) ( not ( = ?auto_7196 ?auto_7201 ) ) ( SURFACE-AT ?auto_7196 ?auto_7202 ) ( CLEAR ?auto_7196 ) ( IS-CRATE ?auto_7197 ) ( AVAILABLE ?auto_7203 ) ( IN ?auto_7197 ?auto_7200 ) ( TRUCK-AT ?auto_7200 ?auto_7199 ) ( ON ?auto_7195 ?auto_7194 ) ( ON ?auto_7196 ?auto_7195 ) ( not ( = ?auto_7194 ?auto_7195 ) ) ( not ( = ?auto_7194 ?auto_7196 ) ) ( not ( = ?auto_7194 ?auto_7197 ) ) ( not ( = ?auto_7194 ?auto_7198 ) ) ( not ( = ?auto_7194 ?auto_7201 ) ) ( not ( = ?auto_7195 ?auto_7196 ) ) ( not ( = ?auto_7195 ?auto_7197 ) ) ( not ( = ?auto_7195 ?auto_7198 ) ) ( not ( = ?auto_7195 ?auto_7201 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7196 ?auto_7197 ?auto_7198 )
      ( MAKE-4CRATE-VERIFY ?auto_7194 ?auto_7195 ?auto_7196 ?auto_7197 ?auto_7198 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7233 - SURFACE
      ?auto_7234 - SURFACE
      ?auto_7235 - SURFACE
      ?auto_7236 - SURFACE
      ?auto_7237 - SURFACE
    )
    :vars
    (
      ?auto_7242 - HOIST
      ?auto_7243 - PLACE
      ?auto_7238 - PLACE
      ?auto_7239 - HOIST
      ?auto_7241 - SURFACE
      ?auto_7240 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7242 ?auto_7243 ) ( IS-CRATE ?auto_7237 ) ( not ( = ?auto_7236 ?auto_7237 ) ) ( not ( = ?auto_7235 ?auto_7236 ) ) ( not ( = ?auto_7235 ?auto_7237 ) ) ( not ( = ?auto_7238 ?auto_7243 ) ) ( HOIST-AT ?auto_7239 ?auto_7238 ) ( not ( = ?auto_7242 ?auto_7239 ) ) ( SURFACE-AT ?auto_7237 ?auto_7238 ) ( ON ?auto_7237 ?auto_7241 ) ( CLEAR ?auto_7237 ) ( not ( = ?auto_7236 ?auto_7241 ) ) ( not ( = ?auto_7237 ?auto_7241 ) ) ( not ( = ?auto_7235 ?auto_7241 ) ) ( SURFACE-AT ?auto_7235 ?auto_7243 ) ( CLEAR ?auto_7235 ) ( IS-CRATE ?auto_7236 ) ( AVAILABLE ?auto_7242 ) ( TRUCK-AT ?auto_7240 ?auto_7238 ) ( LIFTING ?auto_7239 ?auto_7236 ) ( ON ?auto_7234 ?auto_7233 ) ( ON ?auto_7235 ?auto_7234 ) ( not ( = ?auto_7233 ?auto_7234 ) ) ( not ( = ?auto_7233 ?auto_7235 ) ) ( not ( = ?auto_7233 ?auto_7236 ) ) ( not ( = ?auto_7233 ?auto_7237 ) ) ( not ( = ?auto_7233 ?auto_7241 ) ) ( not ( = ?auto_7234 ?auto_7235 ) ) ( not ( = ?auto_7234 ?auto_7236 ) ) ( not ( = ?auto_7234 ?auto_7237 ) ) ( not ( = ?auto_7234 ?auto_7241 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7235 ?auto_7236 ?auto_7237 )
      ( MAKE-4CRATE-VERIFY ?auto_7233 ?auto_7234 ?auto_7235 ?auto_7236 ?auto_7237 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7275 - SURFACE
      ?auto_7276 - SURFACE
      ?auto_7277 - SURFACE
      ?auto_7278 - SURFACE
      ?auto_7279 - SURFACE
    )
    :vars
    (
      ?auto_7282 - HOIST
      ?auto_7284 - PLACE
      ?auto_7283 - PLACE
      ?auto_7286 - HOIST
      ?auto_7280 - SURFACE
      ?auto_7285 - TRUCK
      ?auto_7281 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7282 ?auto_7284 ) ( IS-CRATE ?auto_7279 ) ( not ( = ?auto_7278 ?auto_7279 ) ) ( not ( = ?auto_7277 ?auto_7278 ) ) ( not ( = ?auto_7277 ?auto_7279 ) ) ( not ( = ?auto_7283 ?auto_7284 ) ) ( HOIST-AT ?auto_7286 ?auto_7283 ) ( not ( = ?auto_7282 ?auto_7286 ) ) ( SURFACE-AT ?auto_7279 ?auto_7283 ) ( ON ?auto_7279 ?auto_7280 ) ( CLEAR ?auto_7279 ) ( not ( = ?auto_7278 ?auto_7280 ) ) ( not ( = ?auto_7279 ?auto_7280 ) ) ( not ( = ?auto_7277 ?auto_7280 ) ) ( SURFACE-AT ?auto_7277 ?auto_7284 ) ( CLEAR ?auto_7277 ) ( IS-CRATE ?auto_7278 ) ( AVAILABLE ?auto_7282 ) ( TRUCK-AT ?auto_7285 ?auto_7283 ) ( AVAILABLE ?auto_7286 ) ( SURFACE-AT ?auto_7278 ?auto_7283 ) ( ON ?auto_7278 ?auto_7281 ) ( CLEAR ?auto_7278 ) ( not ( = ?auto_7278 ?auto_7281 ) ) ( not ( = ?auto_7279 ?auto_7281 ) ) ( not ( = ?auto_7277 ?auto_7281 ) ) ( not ( = ?auto_7280 ?auto_7281 ) ) ( ON ?auto_7276 ?auto_7275 ) ( ON ?auto_7277 ?auto_7276 ) ( not ( = ?auto_7275 ?auto_7276 ) ) ( not ( = ?auto_7275 ?auto_7277 ) ) ( not ( = ?auto_7275 ?auto_7278 ) ) ( not ( = ?auto_7275 ?auto_7279 ) ) ( not ( = ?auto_7275 ?auto_7280 ) ) ( not ( = ?auto_7275 ?auto_7281 ) ) ( not ( = ?auto_7276 ?auto_7277 ) ) ( not ( = ?auto_7276 ?auto_7278 ) ) ( not ( = ?auto_7276 ?auto_7279 ) ) ( not ( = ?auto_7276 ?auto_7280 ) ) ( not ( = ?auto_7276 ?auto_7281 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7277 ?auto_7278 ?auto_7279 )
      ( MAKE-4CRATE-VERIFY ?auto_7275 ?auto_7276 ?auto_7277 ?auto_7278 ?auto_7279 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7318 - SURFACE
      ?auto_7319 - SURFACE
      ?auto_7320 - SURFACE
      ?auto_7321 - SURFACE
      ?auto_7322 - SURFACE
    )
    :vars
    (
      ?auto_7326 - HOIST
      ?auto_7324 - PLACE
      ?auto_7325 - PLACE
      ?auto_7327 - HOIST
      ?auto_7329 - SURFACE
      ?auto_7323 - SURFACE
      ?auto_7328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7326 ?auto_7324 ) ( IS-CRATE ?auto_7322 ) ( not ( = ?auto_7321 ?auto_7322 ) ) ( not ( = ?auto_7320 ?auto_7321 ) ) ( not ( = ?auto_7320 ?auto_7322 ) ) ( not ( = ?auto_7325 ?auto_7324 ) ) ( HOIST-AT ?auto_7327 ?auto_7325 ) ( not ( = ?auto_7326 ?auto_7327 ) ) ( SURFACE-AT ?auto_7322 ?auto_7325 ) ( ON ?auto_7322 ?auto_7329 ) ( CLEAR ?auto_7322 ) ( not ( = ?auto_7321 ?auto_7329 ) ) ( not ( = ?auto_7322 ?auto_7329 ) ) ( not ( = ?auto_7320 ?auto_7329 ) ) ( SURFACE-AT ?auto_7320 ?auto_7324 ) ( CLEAR ?auto_7320 ) ( IS-CRATE ?auto_7321 ) ( AVAILABLE ?auto_7326 ) ( AVAILABLE ?auto_7327 ) ( SURFACE-AT ?auto_7321 ?auto_7325 ) ( ON ?auto_7321 ?auto_7323 ) ( CLEAR ?auto_7321 ) ( not ( = ?auto_7321 ?auto_7323 ) ) ( not ( = ?auto_7322 ?auto_7323 ) ) ( not ( = ?auto_7320 ?auto_7323 ) ) ( not ( = ?auto_7329 ?auto_7323 ) ) ( TRUCK-AT ?auto_7328 ?auto_7324 ) ( ON ?auto_7319 ?auto_7318 ) ( ON ?auto_7320 ?auto_7319 ) ( not ( = ?auto_7318 ?auto_7319 ) ) ( not ( = ?auto_7318 ?auto_7320 ) ) ( not ( = ?auto_7318 ?auto_7321 ) ) ( not ( = ?auto_7318 ?auto_7322 ) ) ( not ( = ?auto_7318 ?auto_7329 ) ) ( not ( = ?auto_7318 ?auto_7323 ) ) ( not ( = ?auto_7319 ?auto_7320 ) ) ( not ( = ?auto_7319 ?auto_7321 ) ) ( not ( = ?auto_7319 ?auto_7322 ) ) ( not ( = ?auto_7319 ?auto_7329 ) ) ( not ( = ?auto_7319 ?auto_7323 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7320 ?auto_7321 ?auto_7322 )
      ( MAKE-4CRATE-VERIFY ?auto_7318 ?auto_7319 ?auto_7320 ?auto_7321 ?auto_7322 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7363 - SURFACE
      ?auto_7364 - SURFACE
      ?auto_7365 - SURFACE
      ?auto_7366 - SURFACE
      ?auto_7367 - SURFACE
    )
    :vars
    (
      ?auto_7371 - HOIST
      ?auto_7369 - PLACE
      ?auto_7372 - PLACE
      ?auto_7368 - HOIST
      ?auto_7370 - SURFACE
      ?auto_7373 - SURFACE
      ?auto_7374 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7371 ?auto_7369 ) ( IS-CRATE ?auto_7367 ) ( not ( = ?auto_7366 ?auto_7367 ) ) ( not ( = ?auto_7365 ?auto_7366 ) ) ( not ( = ?auto_7365 ?auto_7367 ) ) ( not ( = ?auto_7372 ?auto_7369 ) ) ( HOIST-AT ?auto_7368 ?auto_7372 ) ( not ( = ?auto_7371 ?auto_7368 ) ) ( SURFACE-AT ?auto_7367 ?auto_7372 ) ( ON ?auto_7367 ?auto_7370 ) ( CLEAR ?auto_7367 ) ( not ( = ?auto_7366 ?auto_7370 ) ) ( not ( = ?auto_7367 ?auto_7370 ) ) ( not ( = ?auto_7365 ?auto_7370 ) ) ( IS-CRATE ?auto_7366 ) ( AVAILABLE ?auto_7368 ) ( SURFACE-AT ?auto_7366 ?auto_7372 ) ( ON ?auto_7366 ?auto_7373 ) ( CLEAR ?auto_7366 ) ( not ( = ?auto_7366 ?auto_7373 ) ) ( not ( = ?auto_7367 ?auto_7373 ) ) ( not ( = ?auto_7365 ?auto_7373 ) ) ( not ( = ?auto_7370 ?auto_7373 ) ) ( TRUCK-AT ?auto_7374 ?auto_7369 ) ( SURFACE-AT ?auto_7364 ?auto_7369 ) ( CLEAR ?auto_7364 ) ( LIFTING ?auto_7371 ?auto_7365 ) ( IS-CRATE ?auto_7365 ) ( not ( = ?auto_7364 ?auto_7365 ) ) ( not ( = ?auto_7366 ?auto_7364 ) ) ( not ( = ?auto_7367 ?auto_7364 ) ) ( not ( = ?auto_7370 ?auto_7364 ) ) ( not ( = ?auto_7373 ?auto_7364 ) ) ( ON ?auto_7364 ?auto_7363 ) ( not ( = ?auto_7363 ?auto_7364 ) ) ( not ( = ?auto_7363 ?auto_7365 ) ) ( not ( = ?auto_7363 ?auto_7366 ) ) ( not ( = ?auto_7363 ?auto_7367 ) ) ( not ( = ?auto_7363 ?auto_7370 ) ) ( not ( = ?auto_7363 ?auto_7373 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7365 ?auto_7366 ?auto_7367 )
      ( MAKE-4CRATE-VERIFY ?auto_7363 ?auto_7364 ?auto_7365 ?auto_7366 ?auto_7367 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7449 - SURFACE
      ?auto_7450 - SURFACE
    )
    :vars
    (
      ?auto_7454 - HOIST
      ?auto_7452 - PLACE
      ?auto_7455 - SURFACE
      ?auto_7451 - PLACE
      ?auto_7456 - HOIST
      ?auto_7453 - SURFACE
      ?auto_7457 - TRUCK
      ?auto_7458 - SURFACE
      ?auto_7459 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7454 ?auto_7452 ) ( IS-CRATE ?auto_7450 ) ( not ( = ?auto_7449 ?auto_7450 ) ) ( not ( = ?auto_7455 ?auto_7449 ) ) ( not ( = ?auto_7455 ?auto_7450 ) ) ( not ( = ?auto_7451 ?auto_7452 ) ) ( HOIST-AT ?auto_7456 ?auto_7451 ) ( not ( = ?auto_7454 ?auto_7456 ) ) ( SURFACE-AT ?auto_7450 ?auto_7451 ) ( ON ?auto_7450 ?auto_7453 ) ( CLEAR ?auto_7450 ) ( not ( = ?auto_7449 ?auto_7453 ) ) ( not ( = ?auto_7450 ?auto_7453 ) ) ( not ( = ?auto_7455 ?auto_7453 ) ) ( SURFACE-AT ?auto_7455 ?auto_7452 ) ( CLEAR ?auto_7455 ) ( IS-CRATE ?auto_7449 ) ( AVAILABLE ?auto_7454 ) ( TRUCK-AT ?auto_7457 ?auto_7451 ) ( SURFACE-AT ?auto_7449 ?auto_7451 ) ( ON ?auto_7449 ?auto_7458 ) ( CLEAR ?auto_7449 ) ( not ( = ?auto_7449 ?auto_7458 ) ) ( not ( = ?auto_7450 ?auto_7458 ) ) ( not ( = ?auto_7455 ?auto_7458 ) ) ( not ( = ?auto_7453 ?auto_7458 ) ) ( LIFTING ?auto_7456 ?auto_7459 ) ( IS-CRATE ?auto_7459 ) ( not ( = ?auto_7449 ?auto_7459 ) ) ( not ( = ?auto_7450 ?auto_7459 ) ) ( not ( = ?auto_7455 ?auto_7459 ) ) ( not ( = ?auto_7453 ?auto_7459 ) ) ( not ( = ?auto_7458 ?auto_7459 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7456 ?auto_7459 ?auto_7457 ?auto_7451 )
      ( MAKE-1CRATE ?auto_7449 ?auto_7450 )
      ( MAKE-1CRATE-VERIFY ?auto_7449 ?auto_7450 ) )
  )

)

