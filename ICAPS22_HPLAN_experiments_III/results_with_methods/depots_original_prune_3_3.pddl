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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3240 - SURFACE
      ?auto_3241 - SURFACE
    )
    :vars
    (
      ?auto_3242 - HOIST
      ?auto_3243 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3242 ?auto_3243 ) ( SURFACE-AT ?auto_3240 ?auto_3243 ) ( CLEAR ?auto_3240 ) ( LIFTING ?auto_3242 ?auto_3241 ) ( IS-CRATE ?auto_3241 ) ( not ( = ?auto_3240 ?auto_3241 ) ) )
    :subtasks
    ( ( !DROP ?auto_3242 ?auto_3241 ?auto_3240 ?auto_3243 )
      ( MAKE-1CRATE-VERIFY ?auto_3240 ?auto_3241 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3244 - SURFACE
      ?auto_3245 - SURFACE
    )
    :vars
    (
      ?auto_3246 - HOIST
      ?auto_3247 - PLACE
      ?auto_3248 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3246 ?auto_3247 ) ( SURFACE-AT ?auto_3244 ?auto_3247 ) ( CLEAR ?auto_3244 ) ( IS-CRATE ?auto_3245 ) ( not ( = ?auto_3244 ?auto_3245 ) ) ( TRUCK-AT ?auto_3248 ?auto_3247 ) ( AVAILABLE ?auto_3246 ) ( IN ?auto_3245 ?auto_3248 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3246 ?auto_3245 ?auto_3248 ?auto_3247 )
      ( MAKE-1CRATE ?auto_3244 ?auto_3245 )
      ( MAKE-1CRATE-VERIFY ?auto_3244 ?auto_3245 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3249 - SURFACE
      ?auto_3250 - SURFACE
    )
    :vars
    (
      ?auto_3253 - HOIST
      ?auto_3252 - PLACE
      ?auto_3251 - TRUCK
      ?auto_3254 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3253 ?auto_3252 ) ( SURFACE-AT ?auto_3249 ?auto_3252 ) ( CLEAR ?auto_3249 ) ( IS-CRATE ?auto_3250 ) ( not ( = ?auto_3249 ?auto_3250 ) ) ( AVAILABLE ?auto_3253 ) ( IN ?auto_3250 ?auto_3251 ) ( TRUCK-AT ?auto_3251 ?auto_3254 ) ( not ( = ?auto_3254 ?auto_3252 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3251 ?auto_3254 ?auto_3252 )
      ( MAKE-1CRATE ?auto_3249 ?auto_3250 )
      ( MAKE-1CRATE-VERIFY ?auto_3249 ?auto_3250 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3255 - SURFACE
      ?auto_3256 - SURFACE
    )
    :vars
    (
      ?auto_3259 - HOIST
      ?auto_3257 - PLACE
      ?auto_3260 - TRUCK
      ?auto_3258 - PLACE
      ?auto_3261 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3259 ?auto_3257 ) ( SURFACE-AT ?auto_3255 ?auto_3257 ) ( CLEAR ?auto_3255 ) ( IS-CRATE ?auto_3256 ) ( not ( = ?auto_3255 ?auto_3256 ) ) ( AVAILABLE ?auto_3259 ) ( TRUCK-AT ?auto_3260 ?auto_3258 ) ( not ( = ?auto_3258 ?auto_3257 ) ) ( HOIST-AT ?auto_3261 ?auto_3258 ) ( LIFTING ?auto_3261 ?auto_3256 ) ( not ( = ?auto_3259 ?auto_3261 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3261 ?auto_3256 ?auto_3260 ?auto_3258 )
      ( MAKE-1CRATE ?auto_3255 ?auto_3256 )
      ( MAKE-1CRATE-VERIFY ?auto_3255 ?auto_3256 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3262 - SURFACE
      ?auto_3263 - SURFACE
    )
    :vars
    (
      ?auto_3266 - HOIST
      ?auto_3267 - PLACE
      ?auto_3264 - TRUCK
      ?auto_3265 - PLACE
      ?auto_3268 - HOIST
      ?auto_3269 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3266 ?auto_3267 ) ( SURFACE-AT ?auto_3262 ?auto_3267 ) ( CLEAR ?auto_3262 ) ( IS-CRATE ?auto_3263 ) ( not ( = ?auto_3262 ?auto_3263 ) ) ( AVAILABLE ?auto_3266 ) ( TRUCK-AT ?auto_3264 ?auto_3265 ) ( not ( = ?auto_3265 ?auto_3267 ) ) ( HOIST-AT ?auto_3268 ?auto_3265 ) ( not ( = ?auto_3266 ?auto_3268 ) ) ( AVAILABLE ?auto_3268 ) ( SURFACE-AT ?auto_3263 ?auto_3265 ) ( ON ?auto_3263 ?auto_3269 ) ( CLEAR ?auto_3263 ) ( not ( = ?auto_3262 ?auto_3269 ) ) ( not ( = ?auto_3263 ?auto_3269 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3268 ?auto_3263 ?auto_3269 ?auto_3265 )
      ( MAKE-1CRATE ?auto_3262 ?auto_3263 )
      ( MAKE-1CRATE-VERIFY ?auto_3262 ?auto_3263 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3270 - SURFACE
      ?auto_3271 - SURFACE
    )
    :vars
    (
      ?auto_3274 - HOIST
      ?auto_3273 - PLACE
      ?auto_3275 - PLACE
      ?auto_3272 - HOIST
      ?auto_3277 - SURFACE
      ?auto_3276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3274 ?auto_3273 ) ( SURFACE-AT ?auto_3270 ?auto_3273 ) ( CLEAR ?auto_3270 ) ( IS-CRATE ?auto_3271 ) ( not ( = ?auto_3270 ?auto_3271 ) ) ( AVAILABLE ?auto_3274 ) ( not ( = ?auto_3275 ?auto_3273 ) ) ( HOIST-AT ?auto_3272 ?auto_3275 ) ( not ( = ?auto_3274 ?auto_3272 ) ) ( AVAILABLE ?auto_3272 ) ( SURFACE-AT ?auto_3271 ?auto_3275 ) ( ON ?auto_3271 ?auto_3277 ) ( CLEAR ?auto_3271 ) ( not ( = ?auto_3270 ?auto_3277 ) ) ( not ( = ?auto_3271 ?auto_3277 ) ) ( TRUCK-AT ?auto_3276 ?auto_3273 ) )
    :subtasks
    ( ( !DRIVE ?auto_3276 ?auto_3273 ?auto_3275 )
      ( MAKE-1CRATE ?auto_3270 ?auto_3271 )
      ( MAKE-1CRATE-VERIFY ?auto_3270 ?auto_3271 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3287 - SURFACE
      ?auto_3288 - SURFACE
      ?auto_3289 - SURFACE
    )
    :vars
    (
      ?auto_3291 - HOIST
      ?auto_3290 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3291 ?auto_3290 ) ( SURFACE-AT ?auto_3288 ?auto_3290 ) ( CLEAR ?auto_3288 ) ( LIFTING ?auto_3291 ?auto_3289 ) ( IS-CRATE ?auto_3289 ) ( not ( = ?auto_3288 ?auto_3289 ) ) ( ON ?auto_3288 ?auto_3287 ) ( not ( = ?auto_3287 ?auto_3288 ) ) ( not ( = ?auto_3287 ?auto_3289 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3288 ?auto_3289 )
      ( MAKE-2CRATE-VERIFY ?auto_3287 ?auto_3288 ?auto_3289 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3297 - SURFACE
      ?auto_3298 - SURFACE
      ?auto_3299 - SURFACE
    )
    :vars
    (
      ?auto_3300 - HOIST
      ?auto_3302 - PLACE
      ?auto_3301 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3300 ?auto_3302 ) ( SURFACE-AT ?auto_3298 ?auto_3302 ) ( CLEAR ?auto_3298 ) ( IS-CRATE ?auto_3299 ) ( not ( = ?auto_3298 ?auto_3299 ) ) ( TRUCK-AT ?auto_3301 ?auto_3302 ) ( AVAILABLE ?auto_3300 ) ( IN ?auto_3299 ?auto_3301 ) ( ON ?auto_3298 ?auto_3297 ) ( not ( = ?auto_3297 ?auto_3298 ) ) ( not ( = ?auto_3297 ?auto_3299 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3298 ?auto_3299 )
      ( MAKE-2CRATE-VERIFY ?auto_3297 ?auto_3298 ?auto_3299 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3303 - SURFACE
      ?auto_3304 - SURFACE
    )
    :vars
    (
      ?auto_3307 - HOIST
      ?auto_3306 - PLACE
      ?auto_3308 - TRUCK
      ?auto_3305 - SURFACE
      ?auto_3309 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3307 ?auto_3306 ) ( SURFACE-AT ?auto_3303 ?auto_3306 ) ( CLEAR ?auto_3303 ) ( IS-CRATE ?auto_3304 ) ( not ( = ?auto_3303 ?auto_3304 ) ) ( AVAILABLE ?auto_3307 ) ( IN ?auto_3304 ?auto_3308 ) ( ON ?auto_3303 ?auto_3305 ) ( not ( = ?auto_3305 ?auto_3303 ) ) ( not ( = ?auto_3305 ?auto_3304 ) ) ( TRUCK-AT ?auto_3308 ?auto_3309 ) ( not ( = ?auto_3309 ?auto_3306 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3308 ?auto_3309 ?auto_3306 )
      ( MAKE-2CRATE ?auto_3305 ?auto_3303 ?auto_3304 )
      ( MAKE-1CRATE-VERIFY ?auto_3303 ?auto_3304 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3310 - SURFACE
      ?auto_3311 - SURFACE
      ?auto_3312 - SURFACE
    )
    :vars
    (
      ?auto_3316 - HOIST
      ?auto_3314 - PLACE
      ?auto_3315 - TRUCK
      ?auto_3313 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3316 ?auto_3314 ) ( SURFACE-AT ?auto_3311 ?auto_3314 ) ( CLEAR ?auto_3311 ) ( IS-CRATE ?auto_3312 ) ( not ( = ?auto_3311 ?auto_3312 ) ) ( AVAILABLE ?auto_3316 ) ( IN ?auto_3312 ?auto_3315 ) ( ON ?auto_3311 ?auto_3310 ) ( not ( = ?auto_3310 ?auto_3311 ) ) ( not ( = ?auto_3310 ?auto_3312 ) ) ( TRUCK-AT ?auto_3315 ?auto_3313 ) ( not ( = ?auto_3313 ?auto_3314 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3311 ?auto_3312 )
      ( MAKE-2CRATE-VERIFY ?auto_3310 ?auto_3311 ?auto_3312 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3317 - SURFACE
      ?auto_3318 - SURFACE
    )
    :vars
    (
      ?auto_3322 - HOIST
      ?auto_3323 - PLACE
      ?auto_3320 - SURFACE
      ?auto_3319 - TRUCK
      ?auto_3321 - PLACE
      ?auto_3324 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3322 ?auto_3323 ) ( SURFACE-AT ?auto_3317 ?auto_3323 ) ( CLEAR ?auto_3317 ) ( IS-CRATE ?auto_3318 ) ( not ( = ?auto_3317 ?auto_3318 ) ) ( AVAILABLE ?auto_3322 ) ( ON ?auto_3317 ?auto_3320 ) ( not ( = ?auto_3320 ?auto_3317 ) ) ( not ( = ?auto_3320 ?auto_3318 ) ) ( TRUCK-AT ?auto_3319 ?auto_3321 ) ( not ( = ?auto_3321 ?auto_3323 ) ) ( HOIST-AT ?auto_3324 ?auto_3321 ) ( LIFTING ?auto_3324 ?auto_3318 ) ( not ( = ?auto_3322 ?auto_3324 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3324 ?auto_3318 ?auto_3319 ?auto_3321 )
      ( MAKE-2CRATE ?auto_3320 ?auto_3317 ?auto_3318 )
      ( MAKE-1CRATE-VERIFY ?auto_3317 ?auto_3318 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3325 - SURFACE
      ?auto_3326 - SURFACE
      ?auto_3327 - SURFACE
    )
    :vars
    (
      ?auto_3329 - HOIST
      ?auto_3330 - PLACE
      ?auto_3331 - TRUCK
      ?auto_3332 - PLACE
      ?auto_3328 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3329 ?auto_3330 ) ( SURFACE-AT ?auto_3326 ?auto_3330 ) ( CLEAR ?auto_3326 ) ( IS-CRATE ?auto_3327 ) ( not ( = ?auto_3326 ?auto_3327 ) ) ( AVAILABLE ?auto_3329 ) ( ON ?auto_3326 ?auto_3325 ) ( not ( = ?auto_3325 ?auto_3326 ) ) ( not ( = ?auto_3325 ?auto_3327 ) ) ( TRUCK-AT ?auto_3331 ?auto_3332 ) ( not ( = ?auto_3332 ?auto_3330 ) ) ( HOIST-AT ?auto_3328 ?auto_3332 ) ( LIFTING ?auto_3328 ?auto_3327 ) ( not ( = ?auto_3329 ?auto_3328 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3326 ?auto_3327 )
      ( MAKE-2CRATE-VERIFY ?auto_3325 ?auto_3326 ?auto_3327 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3333 - SURFACE
      ?auto_3334 - SURFACE
    )
    :vars
    (
      ?auto_3337 - HOIST
      ?auto_3339 - PLACE
      ?auto_3335 - SURFACE
      ?auto_3336 - TRUCK
      ?auto_3340 - PLACE
      ?auto_3338 - HOIST
      ?auto_3341 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3337 ?auto_3339 ) ( SURFACE-AT ?auto_3333 ?auto_3339 ) ( CLEAR ?auto_3333 ) ( IS-CRATE ?auto_3334 ) ( not ( = ?auto_3333 ?auto_3334 ) ) ( AVAILABLE ?auto_3337 ) ( ON ?auto_3333 ?auto_3335 ) ( not ( = ?auto_3335 ?auto_3333 ) ) ( not ( = ?auto_3335 ?auto_3334 ) ) ( TRUCK-AT ?auto_3336 ?auto_3340 ) ( not ( = ?auto_3340 ?auto_3339 ) ) ( HOIST-AT ?auto_3338 ?auto_3340 ) ( not ( = ?auto_3337 ?auto_3338 ) ) ( AVAILABLE ?auto_3338 ) ( SURFACE-AT ?auto_3334 ?auto_3340 ) ( ON ?auto_3334 ?auto_3341 ) ( CLEAR ?auto_3334 ) ( not ( = ?auto_3333 ?auto_3341 ) ) ( not ( = ?auto_3334 ?auto_3341 ) ) ( not ( = ?auto_3335 ?auto_3341 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3338 ?auto_3334 ?auto_3341 ?auto_3340 )
      ( MAKE-2CRATE ?auto_3335 ?auto_3333 ?auto_3334 )
      ( MAKE-1CRATE-VERIFY ?auto_3333 ?auto_3334 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3342 - SURFACE
      ?auto_3343 - SURFACE
      ?auto_3344 - SURFACE
    )
    :vars
    (
      ?auto_3349 - HOIST
      ?auto_3350 - PLACE
      ?auto_3345 - TRUCK
      ?auto_3347 - PLACE
      ?auto_3346 - HOIST
      ?auto_3348 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3349 ?auto_3350 ) ( SURFACE-AT ?auto_3343 ?auto_3350 ) ( CLEAR ?auto_3343 ) ( IS-CRATE ?auto_3344 ) ( not ( = ?auto_3343 ?auto_3344 ) ) ( AVAILABLE ?auto_3349 ) ( ON ?auto_3343 ?auto_3342 ) ( not ( = ?auto_3342 ?auto_3343 ) ) ( not ( = ?auto_3342 ?auto_3344 ) ) ( TRUCK-AT ?auto_3345 ?auto_3347 ) ( not ( = ?auto_3347 ?auto_3350 ) ) ( HOIST-AT ?auto_3346 ?auto_3347 ) ( not ( = ?auto_3349 ?auto_3346 ) ) ( AVAILABLE ?auto_3346 ) ( SURFACE-AT ?auto_3344 ?auto_3347 ) ( ON ?auto_3344 ?auto_3348 ) ( CLEAR ?auto_3344 ) ( not ( = ?auto_3343 ?auto_3348 ) ) ( not ( = ?auto_3344 ?auto_3348 ) ) ( not ( = ?auto_3342 ?auto_3348 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3343 ?auto_3344 )
      ( MAKE-2CRATE-VERIFY ?auto_3342 ?auto_3343 ?auto_3344 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3351 - SURFACE
      ?auto_3352 - SURFACE
    )
    :vars
    (
      ?auto_3359 - HOIST
      ?auto_3358 - PLACE
      ?auto_3353 - SURFACE
      ?auto_3357 - PLACE
      ?auto_3354 - HOIST
      ?auto_3355 - SURFACE
      ?auto_3356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3359 ?auto_3358 ) ( SURFACE-AT ?auto_3351 ?auto_3358 ) ( CLEAR ?auto_3351 ) ( IS-CRATE ?auto_3352 ) ( not ( = ?auto_3351 ?auto_3352 ) ) ( AVAILABLE ?auto_3359 ) ( ON ?auto_3351 ?auto_3353 ) ( not ( = ?auto_3353 ?auto_3351 ) ) ( not ( = ?auto_3353 ?auto_3352 ) ) ( not ( = ?auto_3357 ?auto_3358 ) ) ( HOIST-AT ?auto_3354 ?auto_3357 ) ( not ( = ?auto_3359 ?auto_3354 ) ) ( AVAILABLE ?auto_3354 ) ( SURFACE-AT ?auto_3352 ?auto_3357 ) ( ON ?auto_3352 ?auto_3355 ) ( CLEAR ?auto_3352 ) ( not ( = ?auto_3351 ?auto_3355 ) ) ( not ( = ?auto_3352 ?auto_3355 ) ) ( not ( = ?auto_3353 ?auto_3355 ) ) ( TRUCK-AT ?auto_3356 ?auto_3358 ) )
    :subtasks
    ( ( !DRIVE ?auto_3356 ?auto_3358 ?auto_3357 )
      ( MAKE-2CRATE ?auto_3353 ?auto_3351 ?auto_3352 )
      ( MAKE-1CRATE-VERIFY ?auto_3351 ?auto_3352 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3360 - SURFACE
      ?auto_3361 - SURFACE
      ?auto_3362 - SURFACE
    )
    :vars
    (
      ?auto_3367 - HOIST
      ?auto_3366 - PLACE
      ?auto_3365 - PLACE
      ?auto_3364 - HOIST
      ?auto_3368 - SURFACE
      ?auto_3363 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3367 ?auto_3366 ) ( SURFACE-AT ?auto_3361 ?auto_3366 ) ( CLEAR ?auto_3361 ) ( IS-CRATE ?auto_3362 ) ( not ( = ?auto_3361 ?auto_3362 ) ) ( AVAILABLE ?auto_3367 ) ( ON ?auto_3361 ?auto_3360 ) ( not ( = ?auto_3360 ?auto_3361 ) ) ( not ( = ?auto_3360 ?auto_3362 ) ) ( not ( = ?auto_3365 ?auto_3366 ) ) ( HOIST-AT ?auto_3364 ?auto_3365 ) ( not ( = ?auto_3367 ?auto_3364 ) ) ( AVAILABLE ?auto_3364 ) ( SURFACE-AT ?auto_3362 ?auto_3365 ) ( ON ?auto_3362 ?auto_3368 ) ( CLEAR ?auto_3362 ) ( not ( = ?auto_3361 ?auto_3368 ) ) ( not ( = ?auto_3362 ?auto_3368 ) ) ( not ( = ?auto_3360 ?auto_3368 ) ) ( TRUCK-AT ?auto_3363 ?auto_3366 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3361 ?auto_3362 )
      ( MAKE-2CRATE-VERIFY ?auto_3360 ?auto_3361 ?auto_3362 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3369 - SURFACE
      ?auto_3370 - SURFACE
    )
    :vars
    (
      ?auto_3377 - HOIST
      ?auto_3372 - PLACE
      ?auto_3373 - SURFACE
      ?auto_3371 - PLACE
      ?auto_3374 - HOIST
      ?auto_3375 - SURFACE
      ?auto_3376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3377 ?auto_3372 ) ( IS-CRATE ?auto_3370 ) ( not ( = ?auto_3369 ?auto_3370 ) ) ( not ( = ?auto_3373 ?auto_3369 ) ) ( not ( = ?auto_3373 ?auto_3370 ) ) ( not ( = ?auto_3371 ?auto_3372 ) ) ( HOIST-AT ?auto_3374 ?auto_3371 ) ( not ( = ?auto_3377 ?auto_3374 ) ) ( AVAILABLE ?auto_3374 ) ( SURFACE-AT ?auto_3370 ?auto_3371 ) ( ON ?auto_3370 ?auto_3375 ) ( CLEAR ?auto_3370 ) ( not ( = ?auto_3369 ?auto_3375 ) ) ( not ( = ?auto_3370 ?auto_3375 ) ) ( not ( = ?auto_3373 ?auto_3375 ) ) ( TRUCK-AT ?auto_3376 ?auto_3372 ) ( SURFACE-AT ?auto_3373 ?auto_3372 ) ( CLEAR ?auto_3373 ) ( LIFTING ?auto_3377 ?auto_3369 ) ( IS-CRATE ?auto_3369 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3373 ?auto_3369 )
      ( MAKE-2CRATE ?auto_3373 ?auto_3369 ?auto_3370 )
      ( MAKE-1CRATE-VERIFY ?auto_3369 ?auto_3370 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3378 - SURFACE
      ?auto_3379 - SURFACE
      ?auto_3380 - SURFACE
    )
    :vars
    (
      ?auto_3383 - HOIST
      ?auto_3382 - PLACE
      ?auto_3385 - PLACE
      ?auto_3384 - HOIST
      ?auto_3386 - SURFACE
      ?auto_3381 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3383 ?auto_3382 ) ( IS-CRATE ?auto_3380 ) ( not ( = ?auto_3379 ?auto_3380 ) ) ( not ( = ?auto_3378 ?auto_3379 ) ) ( not ( = ?auto_3378 ?auto_3380 ) ) ( not ( = ?auto_3385 ?auto_3382 ) ) ( HOIST-AT ?auto_3384 ?auto_3385 ) ( not ( = ?auto_3383 ?auto_3384 ) ) ( AVAILABLE ?auto_3384 ) ( SURFACE-AT ?auto_3380 ?auto_3385 ) ( ON ?auto_3380 ?auto_3386 ) ( CLEAR ?auto_3380 ) ( not ( = ?auto_3379 ?auto_3386 ) ) ( not ( = ?auto_3380 ?auto_3386 ) ) ( not ( = ?auto_3378 ?auto_3386 ) ) ( TRUCK-AT ?auto_3381 ?auto_3382 ) ( SURFACE-AT ?auto_3378 ?auto_3382 ) ( CLEAR ?auto_3378 ) ( LIFTING ?auto_3383 ?auto_3379 ) ( IS-CRATE ?auto_3379 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3379 ?auto_3380 )
      ( MAKE-2CRATE-VERIFY ?auto_3378 ?auto_3379 ?auto_3380 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3387 - SURFACE
      ?auto_3388 - SURFACE
    )
    :vars
    (
      ?auto_3389 - HOIST
      ?auto_3394 - PLACE
      ?auto_3392 - SURFACE
      ?auto_3390 - PLACE
      ?auto_3391 - HOIST
      ?auto_3393 - SURFACE
      ?auto_3395 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3389 ?auto_3394 ) ( IS-CRATE ?auto_3388 ) ( not ( = ?auto_3387 ?auto_3388 ) ) ( not ( = ?auto_3392 ?auto_3387 ) ) ( not ( = ?auto_3392 ?auto_3388 ) ) ( not ( = ?auto_3390 ?auto_3394 ) ) ( HOIST-AT ?auto_3391 ?auto_3390 ) ( not ( = ?auto_3389 ?auto_3391 ) ) ( AVAILABLE ?auto_3391 ) ( SURFACE-AT ?auto_3388 ?auto_3390 ) ( ON ?auto_3388 ?auto_3393 ) ( CLEAR ?auto_3388 ) ( not ( = ?auto_3387 ?auto_3393 ) ) ( not ( = ?auto_3388 ?auto_3393 ) ) ( not ( = ?auto_3392 ?auto_3393 ) ) ( TRUCK-AT ?auto_3395 ?auto_3394 ) ( SURFACE-AT ?auto_3392 ?auto_3394 ) ( CLEAR ?auto_3392 ) ( IS-CRATE ?auto_3387 ) ( AVAILABLE ?auto_3389 ) ( IN ?auto_3387 ?auto_3395 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3389 ?auto_3387 ?auto_3395 ?auto_3394 )
      ( MAKE-2CRATE ?auto_3392 ?auto_3387 ?auto_3388 )
      ( MAKE-1CRATE-VERIFY ?auto_3387 ?auto_3388 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3396 - SURFACE
      ?auto_3397 - SURFACE
      ?auto_3398 - SURFACE
    )
    :vars
    (
      ?auto_3403 - HOIST
      ?auto_3404 - PLACE
      ?auto_3399 - PLACE
      ?auto_3402 - HOIST
      ?auto_3400 - SURFACE
      ?auto_3401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3403 ?auto_3404 ) ( IS-CRATE ?auto_3398 ) ( not ( = ?auto_3397 ?auto_3398 ) ) ( not ( = ?auto_3396 ?auto_3397 ) ) ( not ( = ?auto_3396 ?auto_3398 ) ) ( not ( = ?auto_3399 ?auto_3404 ) ) ( HOIST-AT ?auto_3402 ?auto_3399 ) ( not ( = ?auto_3403 ?auto_3402 ) ) ( AVAILABLE ?auto_3402 ) ( SURFACE-AT ?auto_3398 ?auto_3399 ) ( ON ?auto_3398 ?auto_3400 ) ( CLEAR ?auto_3398 ) ( not ( = ?auto_3397 ?auto_3400 ) ) ( not ( = ?auto_3398 ?auto_3400 ) ) ( not ( = ?auto_3396 ?auto_3400 ) ) ( TRUCK-AT ?auto_3401 ?auto_3404 ) ( SURFACE-AT ?auto_3396 ?auto_3404 ) ( CLEAR ?auto_3396 ) ( IS-CRATE ?auto_3397 ) ( AVAILABLE ?auto_3403 ) ( IN ?auto_3397 ?auto_3401 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3397 ?auto_3398 )
      ( MAKE-2CRATE-VERIFY ?auto_3396 ?auto_3397 ?auto_3398 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3441 - SURFACE
      ?auto_3442 - SURFACE
    )
    :vars
    (
      ?auto_3449 - HOIST
      ?auto_3448 - PLACE
      ?auto_3446 - SURFACE
      ?auto_3447 - PLACE
      ?auto_3444 - HOIST
      ?auto_3445 - SURFACE
      ?auto_3443 - TRUCK
      ?auto_3450 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3449 ?auto_3448 ) ( SURFACE-AT ?auto_3441 ?auto_3448 ) ( CLEAR ?auto_3441 ) ( IS-CRATE ?auto_3442 ) ( not ( = ?auto_3441 ?auto_3442 ) ) ( AVAILABLE ?auto_3449 ) ( ON ?auto_3441 ?auto_3446 ) ( not ( = ?auto_3446 ?auto_3441 ) ) ( not ( = ?auto_3446 ?auto_3442 ) ) ( not ( = ?auto_3447 ?auto_3448 ) ) ( HOIST-AT ?auto_3444 ?auto_3447 ) ( not ( = ?auto_3449 ?auto_3444 ) ) ( AVAILABLE ?auto_3444 ) ( SURFACE-AT ?auto_3442 ?auto_3447 ) ( ON ?auto_3442 ?auto_3445 ) ( CLEAR ?auto_3442 ) ( not ( = ?auto_3441 ?auto_3445 ) ) ( not ( = ?auto_3442 ?auto_3445 ) ) ( not ( = ?auto_3446 ?auto_3445 ) ) ( TRUCK-AT ?auto_3443 ?auto_3450 ) ( not ( = ?auto_3450 ?auto_3448 ) ) ( not ( = ?auto_3447 ?auto_3450 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3443 ?auto_3450 ?auto_3448 )
      ( MAKE-1CRATE ?auto_3441 ?auto_3442 )
      ( MAKE-1CRATE-VERIFY ?auto_3441 ?auto_3442 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3480 - SURFACE
      ?auto_3481 - SURFACE
      ?auto_3482 - SURFACE
      ?auto_3483 - SURFACE
    )
    :vars
    (
      ?auto_3485 - HOIST
      ?auto_3484 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3485 ?auto_3484 ) ( SURFACE-AT ?auto_3482 ?auto_3484 ) ( CLEAR ?auto_3482 ) ( LIFTING ?auto_3485 ?auto_3483 ) ( IS-CRATE ?auto_3483 ) ( not ( = ?auto_3482 ?auto_3483 ) ) ( ON ?auto_3481 ?auto_3480 ) ( ON ?auto_3482 ?auto_3481 ) ( not ( = ?auto_3480 ?auto_3481 ) ) ( not ( = ?auto_3480 ?auto_3482 ) ) ( not ( = ?auto_3480 ?auto_3483 ) ) ( not ( = ?auto_3481 ?auto_3482 ) ) ( not ( = ?auto_3481 ?auto_3483 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3482 ?auto_3483 )
      ( MAKE-3CRATE-VERIFY ?auto_3480 ?auto_3481 ?auto_3482 ?auto_3483 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3497 - SURFACE
      ?auto_3498 - SURFACE
      ?auto_3499 - SURFACE
      ?auto_3500 - SURFACE
    )
    :vars
    (
      ?auto_3502 - HOIST
      ?auto_3501 - PLACE
      ?auto_3503 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3502 ?auto_3501 ) ( SURFACE-AT ?auto_3499 ?auto_3501 ) ( CLEAR ?auto_3499 ) ( IS-CRATE ?auto_3500 ) ( not ( = ?auto_3499 ?auto_3500 ) ) ( TRUCK-AT ?auto_3503 ?auto_3501 ) ( AVAILABLE ?auto_3502 ) ( IN ?auto_3500 ?auto_3503 ) ( ON ?auto_3499 ?auto_3498 ) ( not ( = ?auto_3498 ?auto_3499 ) ) ( not ( = ?auto_3498 ?auto_3500 ) ) ( ON ?auto_3498 ?auto_3497 ) ( not ( = ?auto_3497 ?auto_3498 ) ) ( not ( = ?auto_3497 ?auto_3499 ) ) ( not ( = ?auto_3497 ?auto_3500 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3498 ?auto_3499 ?auto_3500 )
      ( MAKE-3CRATE-VERIFY ?auto_3497 ?auto_3498 ?auto_3499 ?auto_3500 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3518 - SURFACE
      ?auto_3519 - SURFACE
      ?auto_3520 - SURFACE
      ?auto_3521 - SURFACE
    )
    :vars
    (
      ?auto_3525 - HOIST
      ?auto_3522 - PLACE
      ?auto_3523 - TRUCK
      ?auto_3524 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3525 ?auto_3522 ) ( SURFACE-AT ?auto_3520 ?auto_3522 ) ( CLEAR ?auto_3520 ) ( IS-CRATE ?auto_3521 ) ( not ( = ?auto_3520 ?auto_3521 ) ) ( AVAILABLE ?auto_3525 ) ( IN ?auto_3521 ?auto_3523 ) ( ON ?auto_3520 ?auto_3519 ) ( not ( = ?auto_3519 ?auto_3520 ) ) ( not ( = ?auto_3519 ?auto_3521 ) ) ( TRUCK-AT ?auto_3523 ?auto_3524 ) ( not ( = ?auto_3524 ?auto_3522 ) ) ( ON ?auto_3519 ?auto_3518 ) ( not ( = ?auto_3518 ?auto_3519 ) ) ( not ( = ?auto_3518 ?auto_3520 ) ) ( not ( = ?auto_3518 ?auto_3521 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3519 ?auto_3520 ?auto_3521 )
      ( MAKE-3CRATE-VERIFY ?auto_3518 ?auto_3519 ?auto_3520 ?auto_3521 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3542 - SURFACE
      ?auto_3543 - SURFACE
      ?auto_3544 - SURFACE
      ?auto_3545 - SURFACE
    )
    :vars
    (
      ?auto_3550 - HOIST
      ?auto_3548 - PLACE
      ?auto_3549 - TRUCK
      ?auto_3547 - PLACE
      ?auto_3546 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3550 ?auto_3548 ) ( SURFACE-AT ?auto_3544 ?auto_3548 ) ( CLEAR ?auto_3544 ) ( IS-CRATE ?auto_3545 ) ( not ( = ?auto_3544 ?auto_3545 ) ) ( AVAILABLE ?auto_3550 ) ( ON ?auto_3544 ?auto_3543 ) ( not ( = ?auto_3543 ?auto_3544 ) ) ( not ( = ?auto_3543 ?auto_3545 ) ) ( TRUCK-AT ?auto_3549 ?auto_3547 ) ( not ( = ?auto_3547 ?auto_3548 ) ) ( HOIST-AT ?auto_3546 ?auto_3547 ) ( LIFTING ?auto_3546 ?auto_3545 ) ( not ( = ?auto_3550 ?auto_3546 ) ) ( ON ?auto_3543 ?auto_3542 ) ( not ( = ?auto_3542 ?auto_3543 ) ) ( not ( = ?auto_3542 ?auto_3544 ) ) ( not ( = ?auto_3542 ?auto_3545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3543 ?auto_3544 ?auto_3545 )
      ( MAKE-3CRATE-VERIFY ?auto_3542 ?auto_3543 ?auto_3544 ?auto_3545 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3569 - SURFACE
      ?auto_3570 - SURFACE
      ?auto_3571 - SURFACE
      ?auto_3572 - SURFACE
    )
    :vars
    (
      ?auto_3575 - HOIST
      ?auto_3577 - PLACE
      ?auto_3576 - TRUCK
      ?auto_3573 - PLACE
      ?auto_3578 - HOIST
      ?auto_3574 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3575 ?auto_3577 ) ( SURFACE-AT ?auto_3571 ?auto_3577 ) ( CLEAR ?auto_3571 ) ( IS-CRATE ?auto_3572 ) ( not ( = ?auto_3571 ?auto_3572 ) ) ( AVAILABLE ?auto_3575 ) ( ON ?auto_3571 ?auto_3570 ) ( not ( = ?auto_3570 ?auto_3571 ) ) ( not ( = ?auto_3570 ?auto_3572 ) ) ( TRUCK-AT ?auto_3576 ?auto_3573 ) ( not ( = ?auto_3573 ?auto_3577 ) ) ( HOIST-AT ?auto_3578 ?auto_3573 ) ( not ( = ?auto_3575 ?auto_3578 ) ) ( AVAILABLE ?auto_3578 ) ( SURFACE-AT ?auto_3572 ?auto_3573 ) ( ON ?auto_3572 ?auto_3574 ) ( CLEAR ?auto_3572 ) ( not ( = ?auto_3571 ?auto_3574 ) ) ( not ( = ?auto_3572 ?auto_3574 ) ) ( not ( = ?auto_3570 ?auto_3574 ) ) ( ON ?auto_3570 ?auto_3569 ) ( not ( = ?auto_3569 ?auto_3570 ) ) ( not ( = ?auto_3569 ?auto_3571 ) ) ( not ( = ?auto_3569 ?auto_3572 ) ) ( not ( = ?auto_3569 ?auto_3574 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3570 ?auto_3571 ?auto_3572 )
      ( MAKE-3CRATE-VERIFY ?auto_3569 ?auto_3570 ?auto_3571 ?auto_3572 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3597 - SURFACE
      ?auto_3598 - SURFACE
      ?auto_3599 - SURFACE
      ?auto_3600 - SURFACE
    )
    :vars
    (
      ?auto_3601 - HOIST
      ?auto_3605 - PLACE
      ?auto_3602 - PLACE
      ?auto_3606 - HOIST
      ?auto_3603 - SURFACE
      ?auto_3604 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3601 ?auto_3605 ) ( SURFACE-AT ?auto_3599 ?auto_3605 ) ( CLEAR ?auto_3599 ) ( IS-CRATE ?auto_3600 ) ( not ( = ?auto_3599 ?auto_3600 ) ) ( AVAILABLE ?auto_3601 ) ( ON ?auto_3599 ?auto_3598 ) ( not ( = ?auto_3598 ?auto_3599 ) ) ( not ( = ?auto_3598 ?auto_3600 ) ) ( not ( = ?auto_3602 ?auto_3605 ) ) ( HOIST-AT ?auto_3606 ?auto_3602 ) ( not ( = ?auto_3601 ?auto_3606 ) ) ( AVAILABLE ?auto_3606 ) ( SURFACE-AT ?auto_3600 ?auto_3602 ) ( ON ?auto_3600 ?auto_3603 ) ( CLEAR ?auto_3600 ) ( not ( = ?auto_3599 ?auto_3603 ) ) ( not ( = ?auto_3600 ?auto_3603 ) ) ( not ( = ?auto_3598 ?auto_3603 ) ) ( TRUCK-AT ?auto_3604 ?auto_3605 ) ( ON ?auto_3598 ?auto_3597 ) ( not ( = ?auto_3597 ?auto_3598 ) ) ( not ( = ?auto_3597 ?auto_3599 ) ) ( not ( = ?auto_3597 ?auto_3600 ) ) ( not ( = ?auto_3597 ?auto_3603 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3598 ?auto_3599 ?auto_3600 )
      ( MAKE-3CRATE-VERIFY ?auto_3597 ?auto_3598 ?auto_3599 ?auto_3600 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3625 - SURFACE
      ?auto_3626 - SURFACE
      ?auto_3627 - SURFACE
      ?auto_3628 - SURFACE
    )
    :vars
    (
      ?auto_3633 - HOIST
      ?auto_3634 - PLACE
      ?auto_3632 - PLACE
      ?auto_3630 - HOIST
      ?auto_3629 - SURFACE
      ?auto_3631 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3633 ?auto_3634 ) ( IS-CRATE ?auto_3628 ) ( not ( = ?auto_3627 ?auto_3628 ) ) ( not ( = ?auto_3626 ?auto_3627 ) ) ( not ( = ?auto_3626 ?auto_3628 ) ) ( not ( = ?auto_3632 ?auto_3634 ) ) ( HOIST-AT ?auto_3630 ?auto_3632 ) ( not ( = ?auto_3633 ?auto_3630 ) ) ( AVAILABLE ?auto_3630 ) ( SURFACE-AT ?auto_3628 ?auto_3632 ) ( ON ?auto_3628 ?auto_3629 ) ( CLEAR ?auto_3628 ) ( not ( = ?auto_3627 ?auto_3629 ) ) ( not ( = ?auto_3628 ?auto_3629 ) ) ( not ( = ?auto_3626 ?auto_3629 ) ) ( TRUCK-AT ?auto_3631 ?auto_3634 ) ( SURFACE-AT ?auto_3626 ?auto_3634 ) ( CLEAR ?auto_3626 ) ( LIFTING ?auto_3633 ?auto_3627 ) ( IS-CRATE ?auto_3627 ) ( ON ?auto_3626 ?auto_3625 ) ( not ( = ?auto_3625 ?auto_3626 ) ) ( not ( = ?auto_3625 ?auto_3627 ) ) ( not ( = ?auto_3625 ?auto_3628 ) ) ( not ( = ?auto_3625 ?auto_3629 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3626 ?auto_3627 ?auto_3628 )
      ( MAKE-3CRATE-VERIFY ?auto_3625 ?auto_3626 ?auto_3627 ?auto_3628 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3653 - SURFACE
      ?auto_3654 - SURFACE
      ?auto_3655 - SURFACE
      ?auto_3656 - SURFACE
    )
    :vars
    (
      ?auto_3661 - HOIST
      ?auto_3662 - PLACE
      ?auto_3660 - PLACE
      ?auto_3659 - HOIST
      ?auto_3657 - SURFACE
      ?auto_3658 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3661 ?auto_3662 ) ( IS-CRATE ?auto_3656 ) ( not ( = ?auto_3655 ?auto_3656 ) ) ( not ( = ?auto_3654 ?auto_3655 ) ) ( not ( = ?auto_3654 ?auto_3656 ) ) ( not ( = ?auto_3660 ?auto_3662 ) ) ( HOIST-AT ?auto_3659 ?auto_3660 ) ( not ( = ?auto_3661 ?auto_3659 ) ) ( AVAILABLE ?auto_3659 ) ( SURFACE-AT ?auto_3656 ?auto_3660 ) ( ON ?auto_3656 ?auto_3657 ) ( CLEAR ?auto_3656 ) ( not ( = ?auto_3655 ?auto_3657 ) ) ( not ( = ?auto_3656 ?auto_3657 ) ) ( not ( = ?auto_3654 ?auto_3657 ) ) ( TRUCK-AT ?auto_3658 ?auto_3662 ) ( SURFACE-AT ?auto_3654 ?auto_3662 ) ( CLEAR ?auto_3654 ) ( IS-CRATE ?auto_3655 ) ( AVAILABLE ?auto_3661 ) ( IN ?auto_3655 ?auto_3658 ) ( ON ?auto_3654 ?auto_3653 ) ( not ( = ?auto_3653 ?auto_3654 ) ) ( not ( = ?auto_3653 ?auto_3655 ) ) ( not ( = ?auto_3653 ?auto_3656 ) ) ( not ( = ?auto_3653 ?auto_3657 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3654 ?auto_3655 ?auto_3656 )
      ( MAKE-3CRATE-VERIFY ?auto_3653 ?auto_3654 ?auto_3655 ?auto_3656 ) )
  )

)

