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
      ?auto_3236 - SURFACE
      ?auto_3237 - SURFACE
    )
    :vars
    (
      ?auto_3238 - HOIST
      ?auto_3239 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3238 ?auto_3239 ) ( SURFACE-AT ?auto_3236 ?auto_3239 ) ( CLEAR ?auto_3236 ) ( LIFTING ?auto_3238 ?auto_3237 ) ( IS-CRATE ?auto_3237 ) ( not ( = ?auto_3236 ?auto_3237 ) ) )
    :subtasks
    ( ( !DROP ?auto_3238 ?auto_3237 ?auto_3236 ?auto_3239 )
      ( MAKE-1CRATE-VERIFY ?auto_3236 ?auto_3237 ) )
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
      ?auto_3244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3242 ?auto_3243 ) ( SURFACE-AT ?auto_3240 ?auto_3243 ) ( CLEAR ?auto_3240 ) ( IS-CRATE ?auto_3241 ) ( not ( = ?auto_3240 ?auto_3241 ) ) ( TRUCK-AT ?auto_3244 ?auto_3243 ) ( AVAILABLE ?auto_3242 ) ( IN ?auto_3241 ?auto_3244 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3242 ?auto_3241 ?auto_3244 ?auto_3243 )
      ( MAKE-1CRATE ?auto_3240 ?auto_3241 )
      ( MAKE-1CRATE-VERIFY ?auto_3240 ?auto_3241 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3245 - SURFACE
      ?auto_3246 - SURFACE
    )
    :vars
    (
      ?auto_3249 - HOIST
      ?auto_3248 - PLACE
      ?auto_3247 - TRUCK
      ?auto_3250 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3249 ?auto_3248 ) ( SURFACE-AT ?auto_3245 ?auto_3248 ) ( CLEAR ?auto_3245 ) ( IS-CRATE ?auto_3246 ) ( not ( = ?auto_3245 ?auto_3246 ) ) ( AVAILABLE ?auto_3249 ) ( IN ?auto_3246 ?auto_3247 ) ( TRUCK-AT ?auto_3247 ?auto_3250 ) ( not ( = ?auto_3250 ?auto_3248 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3247 ?auto_3250 ?auto_3248 )
      ( MAKE-1CRATE ?auto_3245 ?auto_3246 )
      ( MAKE-1CRATE-VERIFY ?auto_3245 ?auto_3246 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3251 - SURFACE
      ?auto_3252 - SURFACE
    )
    :vars
    (
      ?auto_3254 - HOIST
      ?auto_3253 - PLACE
      ?auto_3256 - TRUCK
      ?auto_3255 - PLACE
      ?auto_3257 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3254 ?auto_3253 ) ( SURFACE-AT ?auto_3251 ?auto_3253 ) ( CLEAR ?auto_3251 ) ( IS-CRATE ?auto_3252 ) ( not ( = ?auto_3251 ?auto_3252 ) ) ( AVAILABLE ?auto_3254 ) ( TRUCK-AT ?auto_3256 ?auto_3255 ) ( not ( = ?auto_3255 ?auto_3253 ) ) ( HOIST-AT ?auto_3257 ?auto_3255 ) ( LIFTING ?auto_3257 ?auto_3252 ) ( not ( = ?auto_3254 ?auto_3257 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3257 ?auto_3252 ?auto_3256 ?auto_3255 )
      ( MAKE-1CRATE ?auto_3251 ?auto_3252 )
      ( MAKE-1CRATE-VERIFY ?auto_3251 ?auto_3252 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3258 - SURFACE
      ?auto_3259 - SURFACE
    )
    :vars
    (
      ?auto_3264 - HOIST
      ?auto_3263 - PLACE
      ?auto_3260 - TRUCK
      ?auto_3261 - PLACE
      ?auto_3262 - HOIST
      ?auto_3265 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3264 ?auto_3263 ) ( SURFACE-AT ?auto_3258 ?auto_3263 ) ( CLEAR ?auto_3258 ) ( IS-CRATE ?auto_3259 ) ( not ( = ?auto_3258 ?auto_3259 ) ) ( AVAILABLE ?auto_3264 ) ( TRUCK-AT ?auto_3260 ?auto_3261 ) ( not ( = ?auto_3261 ?auto_3263 ) ) ( HOIST-AT ?auto_3262 ?auto_3261 ) ( not ( = ?auto_3264 ?auto_3262 ) ) ( AVAILABLE ?auto_3262 ) ( SURFACE-AT ?auto_3259 ?auto_3261 ) ( ON ?auto_3259 ?auto_3265 ) ( CLEAR ?auto_3259 ) ( not ( = ?auto_3258 ?auto_3265 ) ) ( not ( = ?auto_3259 ?auto_3265 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3262 ?auto_3259 ?auto_3265 ?auto_3261 )
      ( MAKE-1CRATE ?auto_3258 ?auto_3259 )
      ( MAKE-1CRATE-VERIFY ?auto_3258 ?auto_3259 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3266 - SURFACE
      ?auto_3267 - SURFACE
    )
    :vars
    (
      ?auto_3268 - HOIST
      ?auto_3270 - PLACE
      ?auto_3272 - PLACE
      ?auto_3273 - HOIST
      ?auto_3271 - SURFACE
      ?auto_3269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3268 ?auto_3270 ) ( SURFACE-AT ?auto_3266 ?auto_3270 ) ( CLEAR ?auto_3266 ) ( IS-CRATE ?auto_3267 ) ( not ( = ?auto_3266 ?auto_3267 ) ) ( AVAILABLE ?auto_3268 ) ( not ( = ?auto_3272 ?auto_3270 ) ) ( HOIST-AT ?auto_3273 ?auto_3272 ) ( not ( = ?auto_3268 ?auto_3273 ) ) ( AVAILABLE ?auto_3273 ) ( SURFACE-AT ?auto_3267 ?auto_3272 ) ( ON ?auto_3267 ?auto_3271 ) ( CLEAR ?auto_3267 ) ( not ( = ?auto_3266 ?auto_3271 ) ) ( not ( = ?auto_3267 ?auto_3271 ) ) ( TRUCK-AT ?auto_3269 ?auto_3270 ) )
    :subtasks
    ( ( !DRIVE ?auto_3269 ?auto_3270 ?auto_3272 )
      ( MAKE-1CRATE ?auto_3266 ?auto_3267 )
      ( MAKE-1CRATE-VERIFY ?auto_3266 ?auto_3267 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3283 - SURFACE
      ?auto_3284 - SURFACE
      ?auto_3285 - SURFACE
    )
    :vars
    (
      ?auto_3286 - HOIST
      ?auto_3287 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3286 ?auto_3287 ) ( SURFACE-AT ?auto_3284 ?auto_3287 ) ( CLEAR ?auto_3284 ) ( LIFTING ?auto_3286 ?auto_3285 ) ( IS-CRATE ?auto_3285 ) ( not ( = ?auto_3284 ?auto_3285 ) ) ( ON ?auto_3284 ?auto_3283 ) ( not ( = ?auto_3283 ?auto_3284 ) ) ( not ( = ?auto_3283 ?auto_3285 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3284 ?auto_3285 )
      ( MAKE-2CRATE-VERIFY ?auto_3283 ?auto_3284 ?auto_3285 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3293 - SURFACE
      ?auto_3294 - SURFACE
      ?auto_3295 - SURFACE
    )
    :vars
    (
      ?auto_3297 - HOIST
      ?auto_3296 - PLACE
      ?auto_3298 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3297 ?auto_3296 ) ( SURFACE-AT ?auto_3294 ?auto_3296 ) ( CLEAR ?auto_3294 ) ( IS-CRATE ?auto_3295 ) ( not ( = ?auto_3294 ?auto_3295 ) ) ( TRUCK-AT ?auto_3298 ?auto_3296 ) ( AVAILABLE ?auto_3297 ) ( IN ?auto_3295 ?auto_3298 ) ( ON ?auto_3294 ?auto_3293 ) ( not ( = ?auto_3293 ?auto_3294 ) ) ( not ( = ?auto_3293 ?auto_3295 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3294 ?auto_3295 )
      ( MAKE-2CRATE-VERIFY ?auto_3293 ?auto_3294 ?auto_3295 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3299 - SURFACE
      ?auto_3300 - SURFACE
    )
    :vars
    (
      ?auto_3302 - HOIST
      ?auto_3304 - PLACE
      ?auto_3301 - TRUCK
      ?auto_3303 - SURFACE
      ?auto_3305 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3302 ?auto_3304 ) ( SURFACE-AT ?auto_3299 ?auto_3304 ) ( CLEAR ?auto_3299 ) ( IS-CRATE ?auto_3300 ) ( not ( = ?auto_3299 ?auto_3300 ) ) ( AVAILABLE ?auto_3302 ) ( IN ?auto_3300 ?auto_3301 ) ( ON ?auto_3299 ?auto_3303 ) ( not ( = ?auto_3303 ?auto_3299 ) ) ( not ( = ?auto_3303 ?auto_3300 ) ) ( TRUCK-AT ?auto_3301 ?auto_3305 ) ( not ( = ?auto_3305 ?auto_3304 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3301 ?auto_3305 ?auto_3304 )
      ( MAKE-2CRATE ?auto_3303 ?auto_3299 ?auto_3300 )
      ( MAKE-1CRATE-VERIFY ?auto_3299 ?auto_3300 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3306 - SURFACE
      ?auto_3307 - SURFACE
      ?auto_3308 - SURFACE
    )
    :vars
    (
      ?auto_3312 - HOIST
      ?auto_3311 - PLACE
      ?auto_3309 - TRUCK
      ?auto_3310 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3312 ?auto_3311 ) ( SURFACE-AT ?auto_3307 ?auto_3311 ) ( CLEAR ?auto_3307 ) ( IS-CRATE ?auto_3308 ) ( not ( = ?auto_3307 ?auto_3308 ) ) ( AVAILABLE ?auto_3312 ) ( IN ?auto_3308 ?auto_3309 ) ( ON ?auto_3307 ?auto_3306 ) ( not ( = ?auto_3306 ?auto_3307 ) ) ( not ( = ?auto_3306 ?auto_3308 ) ) ( TRUCK-AT ?auto_3309 ?auto_3310 ) ( not ( = ?auto_3310 ?auto_3311 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3307 ?auto_3308 )
      ( MAKE-2CRATE-VERIFY ?auto_3306 ?auto_3307 ?auto_3308 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3313 - SURFACE
      ?auto_3314 - SURFACE
    )
    :vars
    (
      ?auto_3319 - HOIST
      ?auto_3316 - PLACE
      ?auto_3317 - SURFACE
      ?auto_3315 - TRUCK
      ?auto_3318 - PLACE
      ?auto_3320 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3319 ?auto_3316 ) ( SURFACE-AT ?auto_3313 ?auto_3316 ) ( CLEAR ?auto_3313 ) ( IS-CRATE ?auto_3314 ) ( not ( = ?auto_3313 ?auto_3314 ) ) ( AVAILABLE ?auto_3319 ) ( ON ?auto_3313 ?auto_3317 ) ( not ( = ?auto_3317 ?auto_3313 ) ) ( not ( = ?auto_3317 ?auto_3314 ) ) ( TRUCK-AT ?auto_3315 ?auto_3318 ) ( not ( = ?auto_3318 ?auto_3316 ) ) ( HOIST-AT ?auto_3320 ?auto_3318 ) ( LIFTING ?auto_3320 ?auto_3314 ) ( not ( = ?auto_3319 ?auto_3320 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3320 ?auto_3314 ?auto_3315 ?auto_3318 )
      ( MAKE-2CRATE ?auto_3317 ?auto_3313 ?auto_3314 )
      ( MAKE-1CRATE-VERIFY ?auto_3313 ?auto_3314 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3321 - SURFACE
      ?auto_3322 - SURFACE
      ?auto_3323 - SURFACE
    )
    :vars
    (
      ?auto_3324 - HOIST
      ?auto_3325 - PLACE
      ?auto_3326 - TRUCK
      ?auto_3328 - PLACE
      ?auto_3327 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3324 ?auto_3325 ) ( SURFACE-AT ?auto_3322 ?auto_3325 ) ( CLEAR ?auto_3322 ) ( IS-CRATE ?auto_3323 ) ( not ( = ?auto_3322 ?auto_3323 ) ) ( AVAILABLE ?auto_3324 ) ( ON ?auto_3322 ?auto_3321 ) ( not ( = ?auto_3321 ?auto_3322 ) ) ( not ( = ?auto_3321 ?auto_3323 ) ) ( TRUCK-AT ?auto_3326 ?auto_3328 ) ( not ( = ?auto_3328 ?auto_3325 ) ) ( HOIST-AT ?auto_3327 ?auto_3328 ) ( LIFTING ?auto_3327 ?auto_3323 ) ( not ( = ?auto_3324 ?auto_3327 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3322 ?auto_3323 )
      ( MAKE-2CRATE-VERIFY ?auto_3321 ?auto_3322 ?auto_3323 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3329 - SURFACE
      ?auto_3330 - SURFACE
    )
    :vars
    (
      ?auto_3334 - HOIST
      ?auto_3335 - PLACE
      ?auto_3333 - SURFACE
      ?auto_3332 - TRUCK
      ?auto_3336 - PLACE
      ?auto_3331 - HOIST
      ?auto_3337 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3334 ?auto_3335 ) ( SURFACE-AT ?auto_3329 ?auto_3335 ) ( CLEAR ?auto_3329 ) ( IS-CRATE ?auto_3330 ) ( not ( = ?auto_3329 ?auto_3330 ) ) ( AVAILABLE ?auto_3334 ) ( ON ?auto_3329 ?auto_3333 ) ( not ( = ?auto_3333 ?auto_3329 ) ) ( not ( = ?auto_3333 ?auto_3330 ) ) ( TRUCK-AT ?auto_3332 ?auto_3336 ) ( not ( = ?auto_3336 ?auto_3335 ) ) ( HOIST-AT ?auto_3331 ?auto_3336 ) ( not ( = ?auto_3334 ?auto_3331 ) ) ( AVAILABLE ?auto_3331 ) ( SURFACE-AT ?auto_3330 ?auto_3336 ) ( ON ?auto_3330 ?auto_3337 ) ( CLEAR ?auto_3330 ) ( not ( = ?auto_3329 ?auto_3337 ) ) ( not ( = ?auto_3330 ?auto_3337 ) ) ( not ( = ?auto_3333 ?auto_3337 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3331 ?auto_3330 ?auto_3337 ?auto_3336 )
      ( MAKE-2CRATE ?auto_3333 ?auto_3329 ?auto_3330 )
      ( MAKE-1CRATE-VERIFY ?auto_3329 ?auto_3330 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3338 - SURFACE
      ?auto_3339 - SURFACE
      ?auto_3340 - SURFACE
    )
    :vars
    (
      ?auto_3344 - HOIST
      ?auto_3342 - PLACE
      ?auto_3343 - TRUCK
      ?auto_3345 - PLACE
      ?auto_3341 - HOIST
      ?auto_3346 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3344 ?auto_3342 ) ( SURFACE-AT ?auto_3339 ?auto_3342 ) ( CLEAR ?auto_3339 ) ( IS-CRATE ?auto_3340 ) ( not ( = ?auto_3339 ?auto_3340 ) ) ( AVAILABLE ?auto_3344 ) ( ON ?auto_3339 ?auto_3338 ) ( not ( = ?auto_3338 ?auto_3339 ) ) ( not ( = ?auto_3338 ?auto_3340 ) ) ( TRUCK-AT ?auto_3343 ?auto_3345 ) ( not ( = ?auto_3345 ?auto_3342 ) ) ( HOIST-AT ?auto_3341 ?auto_3345 ) ( not ( = ?auto_3344 ?auto_3341 ) ) ( AVAILABLE ?auto_3341 ) ( SURFACE-AT ?auto_3340 ?auto_3345 ) ( ON ?auto_3340 ?auto_3346 ) ( CLEAR ?auto_3340 ) ( not ( = ?auto_3339 ?auto_3346 ) ) ( not ( = ?auto_3340 ?auto_3346 ) ) ( not ( = ?auto_3338 ?auto_3346 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3339 ?auto_3340 )
      ( MAKE-2CRATE-VERIFY ?auto_3338 ?auto_3339 ?auto_3340 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3347 - SURFACE
      ?auto_3348 - SURFACE
    )
    :vars
    (
      ?auto_3350 - HOIST
      ?auto_3355 - PLACE
      ?auto_3351 - SURFACE
      ?auto_3354 - PLACE
      ?auto_3352 - HOIST
      ?auto_3353 - SURFACE
      ?auto_3349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3350 ?auto_3355 ) ( SURFACE-AT ?auto_3347 ?auto_3355 ) ( CLEAR ?auto_3347 ) ( IS-CRATE ?auto_3348 ) ( not ( = ?auto_3347 ?auto_3348 ) ) ( AVAILABLE ?auto_3350 ) ( ON ?auto_3347 ?auto_3351 ) ( not ( = ?auto_3351 ?auto_3347 ) ) ( not ( = ?auto_3351 ?auto_3348 ) ) ( not ( = ?auto_3354 ?auto_3355 ) ) ( HOIST-AT ?auto_3352 ?auto_3354 ) ( not ( = ?auto_3350 ?auto_3352 ) ) ( AVAILABLE ?auto_3352 ) ( SURFACE-AT ?auto_3348 ?auto_3354 ) ( ON ?auto_3348 ?auto_3353 ) ( CLEAR ?auto_3348 ) ( not ( = ?auto_3347 ?auto_3353 ) ) ( not ( = ?auto_3348 ?auto_3353 ) ) ( not ( = ?auto_3351 ?auto_3353 ) ) ( TRUCK-AT ?auto_3349 ?auto_3355 ) )
    :subtasks
    ( ( !DRIVE ?auto_3349 ?auto_3355 ?auto_3354 )
      ( MAKE-2CRATE ?auto_3351 ?auto_3347 ?auto_3348 )
      ( MAKE-1CRATE-VERIFY ?auto_3347 ?auto_3348 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3356 - SURFACE
      ?auto_3357 - SURFACE
      ?auto_3358 - SURFACE
    )
    :vars
    (
      ?auto_3361 - HOIST
      ?auto_3359 - PLACE
      ?auto_3362 - PLACE
      ?auto_3364 - HOIST
      ?auto_3363 - SURFACE
      ?auto_3360 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3361 ?auto_3359 ) ( SURFACE-AT ?auto_3357 ?auto_3359 ) ( CLEAR ?auto_3357 ) ( IS-CRATE ?auto_3358 ) ( not ( = ?auto_3357 ?auto_3358 ) ) ( AVAILABLE ?auto_3361 ) ( ON ?auto_3357 ?auto_3356 ) ( not ( = ?auto_3356 ?auto_3357 ) ) ( not ( = ?auto_3356 ?auto_3358 ) ) ( not ( = ?auto_3362 ?auto_3359 ) ) ( HOIST-AT ?auto_3364 ?auto_3362 ) ( not ( = ?auto_3361 ?auto_3364 ) ) ( AVAILABLE ?auto_3364 ) ( SURFACE-AT ?auto_3358 ?auto_3362 ) ( ON ?auto_3358 ?auto_3363 ) ( CLEAR ?auto_3358 ) ( not ( = ?auto_3357 ?auto_3363 ) ) ( not ( = ?auto_3358 ?auto_3363 ) ) ( not ( = ?auto_3356 ?auto_3363 ) ) ( TRUCK-AT ?auto_3360 ?auto_3359 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3357 ?auto_3358 )
      ( MAKE-2CRATE-VERIFY ?auto_3356 ?auto_3357 ?auto_3358 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3365 - SURFACE
      ?auto_3366 - SURFACE
    )
    :vars
    (
      ?auto_3370 - HOIST
      ?auto_3371 - PLACE
      ?auto_3368 - SURFACE
      ?auto_3372 - PLACE
      ?auto_3369 - HOIST
      ?auto_3373 - SURFACE
      ?auto_3367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3370 ?auto_3371 ) ( IS-CRATE ?auto_3366 ) ( not ( = ?auto_3365 ?auto_3366 ) ) ( not ( = ?auto_3368 ?auto_3365 ) ) ( not ( = ?auto_3368 ?auto_3366 ) ) ( not ( = ?auto_3372 ?auto_3371 ) ) ( HOIST-AT ?auto_3369 ?auto_3372 ) ( not ( = ?auto_3370 ?auto_3369 ) ) ( AVAILABLE ?auto_3369 ) ( SURFACE-AT ?auto_3366 ?auto_3372 ) ( ON ?auto_3366 ?auto_3373 ) ( CLEAR ?auto_3366 ) ( not ( = ?auto_3365 ?auto_3373 ) ) ( not ( = ?auto_3366 ?auto_3373 ) ) ( not ( = ?auto_3368 ?auto_3373 ) ) ( TRUCK-AT ?auto_3367 ?auto_3371 ) ( SURFACE-AT ?auto_3368 ?auto_3371 ) ( CLEAR ?auto_3368 ) ( LIFTING ?auto_3370 ?auto_3365 ) ( IS-CRATE ?auto_3365 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3368 ?auto_3365 )
      ( MAKE-2CRATE ?auto_3368 ?auto_3365 ?auto_3366 )
      ( MAKE-1CRATE-VERIFY ?auto_3365 ?auto_3366 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3374 - SURFACE
      ?auto_3375 - SURFACE
      ?auto_3376 - SURFACE
    )
    :vars
    (
      ?auto_3377 - HOIST
      ?auto_3378 - PLACE
      ?auto_3381 - PLACE
      ?auto_3380 - HOIST
      ?auto_3379 - SURFACE
      ?auto_3382 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3377 ?auto_3378 ) ( IS-CRATE ?auto_3376 ) ( not ( = ?auto_3375 ?auto_3376 ) ) ( not ( = ?auto_3374 ?auto_3375 ) ) ( not ( = ?auto_3374 ?auto_3376 ) ) ( not ( = ?auto_3381 ?auto_3378 ) ) ( HOIST-AT ?auto_3380 ?auto_3381 ) ( not ( = ?auto_3377 ?auto_3380 ) ) ( AVAILABLE ?auto_3380 ) ( SURFACE-AT ?auto_3376 ?auto_3381 ) ( ON ?auto_3376 ?auto_3379 ) ( CLEAR ?auto_3376 ) ( not ( = ?auto_3375 ?auto_3379 ) ) ( not ( = ?auto_3376 ?auto_3379 ) ) ( not ( = ?auto_3374 ?auto_3379 ) ) ( TRUCK-AT ?auto_3382 ?auto_3378 ) ( SURFACE-AT ?auto_3374 ?auto_3378 ) ( CLEAR ?auto_3374 ) ( LIFTING ?auto_3377 ?auto_3375 ) ( IS-CRATE ?auto_3375 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3375 ?auto_3376 )
      ( MAKE-2CRATE-VERIFY ?auto_3374 ?auto_3375 ?auto_3376 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3383 - SURFACE
      ?auto_3384 - SURFACE
    )
    :vars
    (
      ?auto_3391 - HOIST
      ?auto_3386 - PLACE
      ?auto_3388 - SURFACE
      ?auto_3389 - PLACE
      ?auto_3390 - HOIST
      ?auto_3387 - SURFACE
      ?auto_3385 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3391 ?auto_3386 ) ( IS-CRATE ?auto_3384 ) ( not ( = ?auto_3383 ?auto_3384 ) ) ( not ( = ?auto_3388 ?auto_3383 ) ) ( not ( = ?auto_3388 ?auto_3384 ) ) ( not ( = ?auto_3389 ?auto_3386 ) ) ( HOIST-AT ?auto_3390 ?auto_3389 ) ( not ( = ?auto_3391 ?auto_3390 ) ) ( AVAILABLE ?auto_3390 ) ( SURFACE-AT ?auto_3384 ?auto_3389 ) ( ON ?auto_3384 ?auto_3387 ) ( CLEAR ?auto_3384 ) ( not ( = ?auto_3383 ?auto_3387 ) ) ( not ( = ?auto_3384 ?auto_3387 ) ) ( not ( = ?auto_3388 ?auto_3387 ) ) ( TRUCK-AT ?auto_3385 ?auto_3386 ) ( SURFACE-AT ?auto_3388 ?auto_3386 ) ( CLEAR ?auto_3388 ) ( IS-CRATE ?auto_3383 ) ( AVAILABLE ?auto_3391 ) ( IN ?auto_3383 ?auto_3385 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3391 ?auto_3383 ?auto_3385 ?auto_3386 )
      ( MAKE-2CRATE ?auto_3388 ?auto_3383 ?auto_3384 )
      ( MAKE-1CRATE-VERIFY ?auto_3383 ?auto_3384 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3392 - SURFACE
      ?auto_3393 - SURFACE
      ?auto_3394 - SURFACE
    )
    :vars
    (
      ?auto_3395 - HOIST
      ?auto_3399 - PLACE
      ?auto_3398 - PLACE
      ?auto_3400 - HOIST
      ?auto_3397 - SURFACE
      ?auto_3396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3395 ?auto_3399 ) ( IS-CRATE ?auto_3394 ) ( not ( = ?auto_3393 ?auto_3394 ) ) ( not ( = ?auto_3392 ?auto_3393 ) ) ( not ( = ?auto_3392 ?auto_3394 ) ) ( not ( = ?auto_3398 ?auto_3399 ) ) ( HOIST-AT ?auto_3400 ?auto_3398 ) ( not ( = ?auto_3395 ?auto_3400 ) ) ( AVAILABLE ?auto_3400 ) ( SURFACE-AT ?auto_3394 ?auto_3398 ) ( ON ?auto_3394 ?auto_3397 ) ( CLEAR ?auto_3394 ) ( not ( = ?auto_3393 ?auto_3397 ) ) ( not ( = ?auto_3394 ?auto_3397 ) ) ( not ( = ?auto_3392 ?auto_3397 ) ) ( TRUCK-AT ?auto_3396 ?auto_3399 ) ( SURFACE-AT ?auto_3392 ?auto_3399 ) ( CLEAR ?auto_3392 ) ( IS-CRATE ?auto_3393 ) ( AVAILABLE ?auto_3395 ) ( IN ?auto_3393 ?auto_3396 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3393 ?auto_3394 )
      ( MAKE-2CRATE-VERIFY ?auto_3392 ?auto_3393 ?auto_3394 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3401 - SURFACE
      ?auto_3402 - SURFACE
    )
    :vars
    (
      ?auto_3405 - HOIST
      ?auto_3407 - PLACE
      ?auto_3403 - SURFACE
      ?auto_3406 - PLACE
      ?auto_3408 - HOIST
      ?auto_3409 - SURFACE
      ?auto_3404 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3405 ?auto_3407 ) ( IS-CRATE ?auto_3402 ) ( not ( = ?auto_3401 ?auto_3402 ) ) ( not ( = ?auto_3403 ?auto_3401 ) ) ( not ( = ?auto_3403 ?auto_3402 ) ) ( not ( = ?auto_3406 ?auto_3407 ) ) ( HOIST-AT ?auto_3408 ?auto_3406 ) ( not ( = ?auto_3405 ?auto_3408 ) ) ( AVAILABLE ?auto_3408 ) ( SURFACE-AT ?auto_3402 ?auto_3406 ) ( ON ?auto_3402 ?auto_3409 ) ( CLEAR ?auto_3402 ) ( not ( = ?auto_3401 ?auto_3409 ) ) ( not ( = ?auto_3402 ?auto_3409 ) ) ( not ( = ?auto_3403 ?auto_3409 ) ) ( SURFACE-AT ?auto_3403 ?auto_3407 ) ( CLEAR ?auto_3403 ) ( IS-CRATE ?auto_3401 ) ( AVAILABLE ?auto_3405 ) ( IN ?auto_3401 ?auto_3404 ) ( TRUCK-AT ?auto_3404 ?auto_3406 ) )
    :subtasks
    ( ( !DRIVE ?auto_3404 ?auto_3406 ?auto_3407 )
      ( MAKE-2CRATE ?auto_3403 ?auto_3401 ?auto_3402 )
      ( MAKE-1CRATE-VERIFY ?auto_3401 ?auto_3402 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3410 - SURFACE
      ?auto_3411 - SURFACE
      ?auto_3412 - SURFACE
    )
    :vars
    (
      ?auto_3416 - HOIST
      ?auto_3415 - PLACE
      ?auto_3413 - PLACE
      ?auto_3417 - HOIST
      ?auto_3418 - SURFACE
      ?auto_3414 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3416 ?auto_3415 ) ( IS-CRATE ?auto_3412 ) ( not ( = ?auto_3411 ?auto_3412 ) ) ( not ( = ?auto_3410 ?auto_3411 ) ) ( not ( = ?auto_3410 ?auto_3412 ) ) ( not ( = ?auto_3413 ?auto_3415 ) ) ( HOIST-AT ?auto_3417 ?auto_3413 ) ( not ( = ?auto_3416 ?auto_3417 ) ) ( AVAILABLE ?auto_3417 ) ( SURFACE-AT ?auto_3412 ?auto_3413 ) ( ON ?auto_3412 ?auto_3418 ) ( CLEAR ?auto_3412 ) ( not ( = ?auto_3411 ?auto_3418 ) ) ( not ( = ?auto_3412 ?auto_3418 ) ) ( not ( = ?auto_3410 ?auto_3418 ) ) ( SURFACE-AT ?auto_3410 ?auto_3415 ) ( CLEAR ?auto_3410 ) ( IS-CRATE ?auto_3411 ) ( AVAILABLE ?auto_3416 ) ( IN ?auto_3411 ?auto_3414 ) ( TRUCK-AT ?auto_3414 ?auto_3413 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3411 ?auto_3412 )
      ( MAKE-2CRATE-VERIFY ?auto_3410 ?auto_3411 ?auto_3412 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3419 - SURFACE
      ?auto_3420 - SURFACE
    )
    :vars
    (
      ?auto_3424 - HOIST
      ?auto_3423 - PLACE
      ?auto_3427 - SURFACE
      ?auto_3426 - PLACE
      ?auto_3422 - HOIST
      ?auto_3421 - SURFACE
      ?auto_3425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3424 ?auto_3423 ) ( IS-CRATE ?auto_3420 ) ( not ( = ?auto_3419 ?auto_3420 ) ) ( not ( = ?auto_3427 ?auto_3419 ) ) ( not ( = ?auto_3427 ?auto_3420 ) ) ( not ( = ?auto_3426 ?auto_3423 ) ) ( HOIST-AT ?auto_3422 ?auto_3426 ) ( not ( = ?auto_3424 ?auto_3422 ) ) ( SURFACE-AT ?auto_3420 ?auto_3426 ) ( ON ?auto_3420 ?auto_3421 ) ( CLEAR ?auto_3420 ) ( not ( = ?auto_3419 ?auto_3421 ) ) ( not ( = ?auto_3420 ?auto_3421 ) ) ( not ( = ?auto_3427 ?auto_3421 ) ) ( SURFACE-AT ?auto_3427 ?auto_3423 ) ( CLEAR ?auto_3427 ) ( IS-CRATE ?auto_3419 ) ( AVAILABLE ?auto_3424 ) ( TRUCK-AT ?auto_3425 ?auto_3426 ) ( LIFTING ?auto_3422 ?auto_3419 ) )
    :subtasks
    ( ( !LOAD ?auto_3422 ?auto_3419 ?auto_3425 ?auto_3426 )
      ( MAKE-2CRATE ?auto_3427 ?auto_3419 ?auto_3420 )
      ( MAKE-1CRATE-VERIFY ?auto_3419 ?auto_3420 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3428 - SURFACE
      ?auto_3429 - SURFACE
      ?auto_3430 - SURFACE
    )
    :vars
    (
      ?auto_3432 - HOIST
      ?auto_3433 - PLACE
      ?auto_3434 - PLACE
      ?auto_3436 - HOIST
      ?auto_3431 - SURFACE
      ?auto_3435 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3432 ?auto_3433 ) ( IS-CRATE ?auto_3430 ) ( not ( = ?auto_3429 ?auto_3430 ) ) ( not ( = ?auto_3428 ?auto_3429 ) ) ( not ( = ?auto_3428 ?auto_3430 ) ) ( not ( = ?auto_3434 ?auto_3433 ) ) ( HOIST-AT ?auto_3436 ?auto_3434 ) ( not ( = ?auto_3432 ?auto_3436 ) ) ( SURFACE-AT ?auto_3430 ?auto_3434 ) ( ON ?auto_3430 ?auto_3431 ) ( CLEAR ?auto_3430 ) ( not ( = ?auto_3429 ?auto_3431 ) ) ( not ( = ?auto_3430 ?auto_3431 ) ) ( not ( = ?auto_3428 ?auto_3431 ) ) ( SURFACE-AT ?auto_3428 ?auto_3433 ) ( CLEAR ?auto_3428 ) ( IS-CRATE ?auto_3429 ) ( AVAILABLE ?auto_3432 ) ( TRUCK-AT ?auto_3435 ?auto_3434 ) ( LIFTING ?auto_3436 ?auto_3429 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3429 ?auto_3430 )
      ( MAKE-2CRATE-VERIFY ?auto_3428 ?auto_3429 ?auto_3430 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3437 - SURFACE
      ?auto_3438 - SURFACE
    )
    :vars
    (
      ?auto_3442 - HOIST
      ?auto_3439 - PLACE
      ?auto_3443 - SURFACE
      ?auto_3444 - PLACE
      ?auto_3440 - HOIST
      ?auto_3441 - SURFACE
      ?auto_3445 - TRUCK
      ?auto_3446 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3442 ?auto_3439 ) ( IS-CRATE ?auto_3438 ) ( not ( = ?auto_3437 ?auto_3438 ) ) ( not ( = ?auto_3443 ?auto_3437 ) ) ( not ( = ?auto_3443 ?auto_3438 ) ) ( not ( = ?auto_3444 ?auto_3439 ) ) ( HOIST-AT ?auto_3440 ?auto_3444 ) ( not ( = ?auto_3442 ?auto_3440 ) ) ( SURFACE-AT ?auto_3438 ?auto_3444 ) ( ON ?auto_3438 ?auto_3441 ) ( CLEAR ?auto_3438 ) ( not ( = ?auto_3437 ?auto_3441 ) ) ( not ( = ?auto_3438 ?auto_3441 ) ) ( not ( = ?auto_3443 ?auto_3441 ) ) ( SURFACE-AT ?auto_3443 ?auto_3439 ) ( CLEAR ?auto_3443 ) ( IS-CRATE ?auto_3437 ) ( AVAILABLE ?auto_3442 ) ( TRUCK-AT ?auto_3445 ?auto_3444 ) ( AVAILABLE ?auto_3440 ) ( SURFACE-AT ?auto_3437 ?auto_3444 ) ( ON ?auto_3437 ?auto_3446 ) ( CLEAR ?auto_3437 ) ( not ( = ?auto_3437 ?auto_3446 ) ) ( not ( = ?auto_3438 ?auto_3446 ) ) ( not ( = ?auto_3443 ?auto_3446 ) ) ( not ( = ?auto_3441 ?auto_3446 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3440 ?auto_3437 ?auto_3446 ?auto_3444 )
      ( MAKE-2CRATE ?auto_3443 ?auto_3437 ?auto_3438 )
      ( MAKE-1CRATE-VERIFY ?auto_3437 ?auto_3438 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3447 - SURFACE
      ?auto_3448 - SURFACE
      ?auto_3449 - SURFACE
    )
    :vars
    (
      ?auto_3453 - HOIST
      ?auto_3455 - PLACE
      ?auto_3452 - PLACE
      ?auto_3450 - HOIST
      ?auto_3456 - SURFACE
      ?auto_3451 - TRUCK
      ?auto_3454 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3453 ?auto_3455 ) ( IS-CRATE ?auto_3449 ) ( not ( = ?auto_3448 ?auto_3449 ) ) ( not ( = ?auto_3447 ?auto_3448 ) ) ( not ( = ?auto_3447 ?auto_3449 ) ) ( not ( = ?auto_3452 ?auto_3455 ) ) ( HOIST-AT ?auto_3450 ?auto_3452 ) ( not ( = ?auto_3453 ?auto_3450 ) ) ( SURFACE-AT ?auto_3449 ?auto_3452 ) ( ON ?auto_3449 ?auto_3456 ) ( CLEAR ?auto_3449 ) ( not ( = ?auto_3448 ?auto_3456 ) ) ( not ( = ?auto_3449 ?auto_3456 ) ) ( not ( = ?auto_3447 ?auto_3456 ) ) ( SURFACE-AT ?auto_3447 ?auto_3455 ) ( CLEAR ?auto_3447 ) ( IS-CRATE ?auto_3448 ) ( AVAILABLE ?auto_3453 ) ( TRUCK-AT ?auto_3451 ?auto_3452 ) ( AVAILABLE ?auto_3450 ) ( SURFACE-AT ?auto_3448 ?auto_3452 ) ( ON ?auto_3448 ?auto_3454 ) ( CLEAR ?auto_3448 ) ( not ( = ?auto_3448 ?auto_3454 ) ) ( not ( = ?auto_3449 ?auto_3454 ) ) ( not ( = ?auto_3447 ?auto_3454 ) ) ( not ( = ?auto_3456 ?auto_3454 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3448 ?auto_3449 )
      ( MAKE-2CRATE-VERIFY ?auto_3447 ?auto_3448 ?auto_3449 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3457 - SURFACE
      ?auto_3458 - SURFACE
    )
    :vars
    (
      ?auto_3459 - HOIST
      ?auto_3462 - PLACE
      ?auto_3466 - SURFACE
      ?auto_3460 - PLACE
      ?auto_3463 - HOIST
      ?auto_3464 - SURFACE
      ?auto_3465 - SURFACE
      ?auto_3461 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3459 ?auto_3462 ) ( IS-CRATE ?auto_3458 ) ( not ( = ?auto_3457 ?auto_3458 ) ) ( not ( = ?auto_3466 ?auto_3457 ) ) ( not ( = ?auto_3466 ?auto_3458 ) ) ( not ( = ?auto_3460 ?auto_3462 ) ) ( HOIST-AT ?auto_3463 ?auto_3460 ) ( not ( = ?auto_3459 ?auto_3463 ) ) ( SURFACE-AT ?auto_3458 ?auto_3460 ) ( ON ?auto_3458 ?auto_3464 ) ( CLEAR ?auto_3458 ) ( not ( = ?auto_3457 ?auto_3464 ) ) ( not ( = ?auto_3458 ?auto_3464 ) ) ( not ( = ?auto_3466 ?auto_3464 ) ) ( SURFACE-AT ?auto_3466 ?auto_3462 ) ( CLEAR ?auto_3466 ) ( IS-CRATE ?auto_3457 ) ( AVAILABLE ?auto_3459 ) ( AVAILABLE ?auto_3463 ) ( SURFACE-AT ?auto_3457 ?auto_3460 ) ( ON ?auto_3457 ?auto_3465 ) ( CLEAR ?auto_3457 ) ( not ( = ?auto_3457 ?auto_3465 ) ) ( not ( = ?auto_3458 ?auto_3465 ) ) ( not ( = ?auto_3466 ?auto_3465 ) ) ( not ( = ?auto_3464 ?auto_3465 ) ) ( TRUCK-AT ?auto_3461 ?auto_3462 ) )
    :subtasks
    ( ( !DRIVE ?auto_3461 ?auto_3462 ?auto_3460 )
      ( MAKE-2CRATE ?auto_3466 ?auto_3457 ?auto_3458 )
      ( MAKE-1CRATE-VERIFY ?auto_3457 ?auto_3458 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3467 - SURFACE
      ?auto_3468 - SURFACE
      ?auto_3469 - SURFACE
    )
    :vars
    (
      ?auto_3472 - HOIST
      ?auto_3471 - PLACE
      ?auto_3470 - PLACE
      ?auto_3476 - HOIST
      ?auto_3474 - SURFACE
      ?auto_3475 - SURFACE
      ?auto_3473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3472 ?auto_3471 ) ( IS-CRATE ?auto_3469 ) ( not ( = ?auto_3468 ?auto_3469 ) ) ( not ( = ?auto_3467 ?auto_3468 ) ) ( not ( = ?auto_3467 ?auto_3469 ) ) ( not ( = ?auto_3470 ?auto_3471 ) ) ( HOIST-AT ?auto_3476 ?auto_3470 ) ( not ( = ?auto_3472 ?auto_3476 ) ) ( SURFACE-AT ?auto_3469 ?auto_3470 ) ( ON ?auto_3469 ?auto_3474 ) ( CLEAR ?auto_3469 ) ( not ( = ?auto_3468 ?auto_3474 ) ) ( not ( = ?auto_3469 ?auto_3474 ) ) ( not ( = ?auto_3467 ?auto_3474 ) ) ( SURFACE-AT ?auto_3467 ?auto_3471 ) ( CLEAR ?auto_3467 ) ( IS-CRATE ?auto_3468 ) ( AVAILABLE ?auto_3472 ) ( AVAILABLE ?auto_3476 ) ( SURFACE-AT ?auto_3468 ?auto_3470 ) ( ON ?auto_3468 ?auto_3475 ) ( CLEAR ?auto_3468 ) ( not ( = ?auto_3468 ?auto_3475 ) ) ( not ( = ?auto_3469 ?auto_3475 ) ) ( not ( = ?auto_3467 ?auto_3475 ) ) ( not ( = ?auto_3474 ?auto_3475 ) ) ( TRUCK-AT ?auto_3473 ?auto_3471 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3468 ?auto_3469 )
      ( MAKE-2CRATE-VERIFY ?auto_3467 ?auto_3468 ?auto_3469 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3495 - SURFACE
      ?auto_3496 - SURFACE
      ?auto_3497 - SURFACE
      ?auto_3498 - SURFACE
    )
    :vars
    (
      ?auto_3499 - HOIST
      ?auto_3500 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3499 ?auto_3500 ) ( SURFACE-AT ?auto_3497 ?auto_3500 ) ( CLEAR ?auto_3497 ) ( LIFTING ?auto_3499 ?auto_3498 ) ( IS-CRATE ?auto_3498 ) ( not ( = ?auto_3497 ?auto_3498 ) ) ( ON ?auto_3496 ?auto_3495 ) ( ON ?auto_3497 ?auto_3496 ) ( not ( = ?auto_3495 ?auto_3496 ) ) ( not ( = ?auto_3495 ?auto_3497 ) ) ( not ( = ?auto_3495 ?auto_3498 ) ) ( not ( = ?auto_3496 ?auto_3497 ) ) ( not ( = ?auto_3496 ?auto_3498 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3497 ?auto_3498 )
      ( MAKE-3CRATE-VERIFY ?auto_3495 ?auto_3496 ?auto_3497 ?auto_3498 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3512 - SURFACE
      ?auto_3513 - SURFACE
      ?auto_3514 - SURFACE
      ?auto_3515 - SURFACE
    )
    :vars
    (
      ?auto_3518 - HOIST
      ?auto_3517 - PLACE
      ?auto_3516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3518 ?auto_3517 ) ( SURFACE-AT ?auto_3514 ?auto_3517 ) ( CLEAR ?auto_3514 ) ( IS-CRATE ?auto_3515 ) ( not ( = ?auto_3514 ?auto_3515 ) ) ( TRUCK-AT ?auto_3516 ?auto_3517 ) ( AVAILABLE ?auto_3518 ) ( IN ?auto_3515 ?auto_3516 ) ( ON ?auto_3514 ?auto_3513 ) ( not ( = ?auto_3513 ?auto_3514 ) ) ( not ( = ?auto_3513 ?auto_3515 ) ) ( ON ?auto_3513 ?auto_3512 ) ( not ( = ?auto_3512 ?auto_3513 ) ) ( not ( = ?auto_3512 ?auto_3514 ) ) ( not ( = ?auto_3512 ?auto_3515 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3513 ?auto_3514 ?auto_3515 )
      ( MAKE-3CRATE-VERIFY ?auto_3512 ?auto_3513 ?auto_3514 ?auto_3515 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3533 - SURFACE
      ?auto_3534 - SURFACE
      ?auto_3535 - SURFACE
      ?auto_3536 - SURFACE
    )
    :vars
    (
      ?auto_3540 - HOIST
      ?auto_3538 - PLACE
      ?auto_3537 - TRUCK
      ?auto_3539 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3540 ?auto_3538 ) ( SURFACE-AT ?auto_3535 ?auto_3538 ) ( CLEAR ?auto_3535 ) ( IS-CRATE ?auto_3536 ) ( not ( = ?auto_3535 ?auto_3536 ) ) ( AVAILABLE ?auto_3540 ) ( IN ?auto_3536 ?auto_3537 ) ( ON ?auto_3535 ?auto_3534 ) ( not ( = ?auto_3534 ?auto_3535 ) ) ( not ( = ?auto_3534 ?auto_3536 ) ) ( TRUCK-AT ?auto_3537 ?auto_3539 ) ( not ( = ?auto_3539 ?auto_3538 ) ) ( ON ?auto_3534 ?auto_3533 ) ( not ( = ?auto_3533 ?auto_3534 ) ) ( not ( = ?auto_3533 ?auto_3535 ) ) ( not ( = ?auto_3533 ?auto_3536 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3534 ?auto_3535 ?auto_3536 )
      ( MAKE-3CRATE-VERIFY ?auto_3533 ?auto_3534 ?auto_3535 ?auto_3536 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3557 - SURFACE
      ?auto_3558 - SURFACE
      ?auto_3559 - SURFACE
      ?auto_3560 - SURFACE
    )
    :vars
    (
      ?auto_3564 - HOIST
      ?auto_3562 - PLACE
      ?auto_3565 - TRUCK
      ?auto_3563 - PLACE
      ?auto_3561 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3564 ?auto_3562 ) ( SURFACE-AT ?auto_3559 ?auto_3562 ) ( CLEAR ?auto_3559 ) ( IS-CRATE ?auto_3560 ) ( not ( = ?auto_3559 ?auto_3560 ) ) ( AVAILABLE ?auto_3564 ) ( ON ?auto_3559 ?auto_3558 ) ( not ( = ?auto_3558 ?auto_3559 ) ) ( not ( = ?auto_3558 ?auto_3560 ) ) ( TRUCK-AT ?auto_3565 ?auto_3563 ) ( not ( = ?auto_3563 ?auto_3562 ) ) ( HOIST-AT ?auto_3561 ?auto_3563 ) ( LIFTING ?auto_3561 ?auto_3560 ) ( not ( = ?auto_3564 ?auto_3561 ) ) ( ON ?auto_3558 ?auto_3557 ) ( not ( = ?auto_3557 ?auto_3558 ) ) ( not ( = ?auto_3557 ?auto_3559 ) ) ( not ( = ?auto_3557 ?auto_3560 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3558 ?auto_3559 ?auto_3560 )
      ( MAKE-3CRATE-VERIFY ?auto_3557 ?auto_3558 ?auto_3559 ?auto_3560 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3584 - SURFACE
      ?auto_3585 - SURFACE
      ?auto_3586 - SURFACE
      ?auto_3587 - SURFACE
    )
    :vars
    (
      ?auto_3588 - HOIST
      ?auto_3592 - PLACE
      ?auto_3591 - TRUCK
      ?auto_3590 - PLACE
      ?auto_3589 - HOIST
      ?auto_3593 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3588 ?auto_3592 ) ( SURFACE-AT ?auto_3586 ?auto_3592 ) ( CLEAR ?auto_3586 ) ( IS-CRATE ?auto_3587 ) ( not ( = ?auto_3586 ?auto_3587 ) ) ( AVAILABLE ?auto_3588 ) ( ON ?auto_3586 ?auto_3585 ) ( not ( = ?auto_3585 ?auto_3586 ) ) ( not ( = ?auto_3585 ?auto_3587 ) ) ( TRUCK-AT ?auto_3591 ?auto_3590 ) ( not ( = ?auto_3590 ?auto_3592 ) ) ( HOIST-AT ?auto_3589 ?auto_3590 ) ( not ( = ?auto_3588 ?auto_3589 ) ) ( AVAILABLE ?auto_3589 ) ( SURFACE-AT ?auto_3587 ?auto_3590 ) ( ON ?auto_3587 ?auto_3593 ) ( CLEAR ?auto_3587 ) ( not ( = ?auto_3586 ?auto_3593 ) ) ( not ( = ?auto_3587 ?auto_3593 ) ) ( not ( = ?auto_3585 ?auto_3593 ) ) ( ON ?auto_3585 ?auto_3584 ) ( not ( = ?auto_3584 ?auto_3585 ) ) ( not ( = ?auto_3584 ?auto_3586 ) ) ( not ( = ?auto_3584 ?auto_3587 ) ) ( not ( = ?auto_3584 ?auto_3593 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3585 ?auto_3586 ?auto_3587 )
      ( MAKE-3CRATE-VERIFY ?auto_3584 ?auto_3585 ?auto_3586 ?auto_3587 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3612 - SURFACE
      ?auto_3613 - SURFACE
      ?auto_3614 - SURFACE
      ?auto_3615 - SURFACE
    )
    :vars
    (
      ?auto_3618 - HOIST
      ?auto_3620 - PLACE
      ?auto_3621 - PLACE
      ?auto_3617 - HOIST
      ?auto_3619 - SURFACE
      ?auto_3616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3618 ?auto_3620 ) ( SURFACE-AT ?auto_3614 ?auto_3620 ) ( CLEAR ?auto_3614 ) ( IS-CRATE ?auto_3615 ) ( not ( = ?auto_3614 ?auto_3615 ) ) ( AVAILABLE ?auto_3618 ) ( ON ?auto_3614 ?auto_3613 ) ( not ( = ?auto_3613 ?auto_3614 ) ) ( not ( = ?auto_3613 ?auto_3615 ) ) ( not ( = ?auto_3621 ?auto_3620 ) ) ( HOIST-AT ?auto_3617 ?auto_3621 ) ( not ( = ?auto_3618 ?auto_3617 ) ) ( AVAILABLE ?auto_3617 ) ( SURFACE-AT ?auto_3615 ?auto_3621 ) ( ON ?auto_3615 ?auto_3619 ) ( CLEAR ?auto_3615 ) ( not ( = ?auto_3614 ?auto_3619 ) ) ( not ( = ?auto_3615 ?auto_3619 ) ) ( not ( = ?auto_3613 ?auto_3619 ) ) ( TRUCK-AT ?auto_3616 ?auto_3620 ) ( ON ?auto_3613 ?auto_3612 ) ( not ( = ?auto_3612 ?auto_3613 ) ) ( not ( = ?auto_3612 ?auto_3614 ) ) ( not ( = ?auto_3612 ?auto_3615 ) ) ( not ( = ?auto_3612 ?auto_3619 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3613 ?auto_3614 ?auto_3615 )
      ( MAKE-3CRATE-VERIFY ?auto_3612 ?auto_3613 ?auto_3614 ?auto_3615 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3640 - SURFACE
      ?auto_3641 - SURFACE
      ?auto_3642 - SURFACE
      ?auto_3643 - SURFACE
    )
    :vars
    (
      ?auto_3647 - HOIST
      ?auto_3646 - PLACE
      ?auto_3645 - PLACE
      ?auto_3649 - HOIST
      ?auto_3644 - SURFACE
      ?auto_3648 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3647 ?auto_3646 ) ( IS-CRATE ?auto_3643 ) ( not ( = ?auto_3642 ?auto_3643 ) ) ( not ( = ?auto_3641 ?auto_3642 ) ) ( not ( = ?auto_3641 ?auto_3643 ) ) ( not ( = ?auto_3645 ?auto_3646 ) ) ( HOIST-AT ?auto_3649 ?auto_3645 ) ( not ( = ?auto_3647 ?auto_3649 ) ) ( AVAILABLE ?auto_3649 ) ( SURFACE-AT ?auto_3643 ?auto_3645 ) ( ON ?auto_3643 ?auto_3644 ) ( CLEAR ?auto_3643 ) ( not ( = ?auto_3642 ?auto_3644 ) ) ( not ( = ?auto_3643 ?auto_3644 ) ) ( not ( = ?auto_3641 ?auto_3644 ) ) ( TRUCK-AT ?auto_3648 ?auto_3646 ) ( SURFACE-AT ?auto_3641 ?auto_3646 ) ( CLEAR ?auto_3641 ) ( LIFTING ?auto_3647 ?auto_3642 ) ( IS-CRATE ?auto_3642 ) ( ON ?auto_3641 ?auto_3640 ) ( not ( = ?auto_3640 ?auto_3641 ) ) ( not ( = ?auto_3640 ?auto_3642 ) ) ( not ( = ?auto_3640 ?auto_3643 ) ) ( not ( = ?auto_3640 ?auto_3644 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3641 ?auto_3642 ?auto_3643 )
      ( MAKE-3CRATE-VERIFY ?auto_3640 ?auto_3641 ?auto_3642 ?auto_3643 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3668 - SURFACE
      ?auto_3669 - SURFACE
      ?auto_3670 - SURFACE
      ?auto_3671 - SURFACE
    )
    :vars
    (
      ?auto_3674 - HOIST
      ?auto_3675 - PLACE
      ?auto_3673 - PLACE
      ?auto_3672 - HOIST
      ?auto_3677 - SURFACE
      ?auto_3676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3674 ?auto_3675 ) ( IS-CRATE ?auto_3671 ) ( not ( = ?auto_3670 ?auto_3671 ) ) ( not ( = ?auto_3669 ?auto_3670 ) ) ( not ( = ?auto_3669 ?auto_3671 ) ) ( not ( = ?auto_3673 ?auto_3675 ) ) ( HOIST-AT ?auto_3672 ?auto_3673 ) ( not ( = ?auto_3674 ?auto_3672 ) ) ( AVAILABLE ?auto_3672 ) ( SURFACE-AT ?auto_3671 ?auto_3673 ) ( ON ?auto_3671 ?auto_3677 ) ( CLEAR ?auto_3671 ) ( not ( = ?auto_3670 ?auto_3677 ) ) ( not ( = ?auto_3671 ?auto_3677 ) ) ( not ( = ?auto_3669 ?auto_3677 ) ) ( TRUCK-AT ?auto_3676 ?auto_3675 ) ( SURFACE-AT ?auto_3669 ?auto_3675 ) ( CLEAR ?auto_3669 ) ( IS-CRATE ?auto_3670 ) ( AVAILABLE ?auto_3674 ) ( IN ?auto_3670 ?auto_3676 ) ( ON ?auto_3669 ?auto_3668 ) ( not ( = ?auto_3668 ?auto_3669 ) ) ( not ( = ?auto_3668 ?auto_3670 ) ) ( not ( = ?auto_3668 ?auto_3671 ) ) ( not ( = ?auto_3668 ?auto_3677 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3669 ?auto_3670 ?auto_3671 )
      ( MAKE-3CRATE-VERIFY ?auto_3668 ?auto_3669 ?auto_3670 ?auto_3671 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3696 - SURFACE
      ?auto_3697 - SURFACE
      ?auto_3698 - SURFACE
      ?auto_3699 - SURFACE
    )
    :vars
    (
      ?auto_3702 - HOIST
      ?auto_3703 - PLACE
      ?auto_3700 - PLACE
      ?auto_3705 - HOIST
      ?auto_3704 - SURFACE
      ?auto_3701 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3702 ?auto_3703 ) ( IS-CRATE ?auto_3699 ) ( not ( = ?auto_3698 ?auto_3699 ) ) ( not ( = ?auto_3697 ?auto_3698 ) ) ( not ( = ?auto_3697 ?auto_3699 ) ) ( not ( = ?auto_3700 ?auto_3703 ) ) ( HOIST-AT ?auto_3705 ?auto_3700 ) ( not ( = ?auto_3702 ?auto_3705 ) ) ( AVAILABLE ?auto_3705 ) ( SURFACE-AT ?auto_3699 ?auto_3700 ) ( ON ?auto_3699 ?auto_3704 ) ( CLEAR ?auto_3699 ) ( not ( = ?auto_3698 ?auto_3704 ) ) ( not ( = ?auto_3699 ?auto_3704 ) ) ( not ( = ?auto_3697 ?auto_3704 ) ) ( SURFACE-AT ?auto_3697 ?auto_3703 ) ( CLEAR ?auto_3697 ) ( IS-CRATE ?auto_3698 ) ( AVAILABLE ?auto_3702 ) ( IN ?auto_3698 ?auto_3701 ) ( TRUCK-AT ?auto_3701 ?auto_3700 ) ( ON ?auto_3697 ?auto_3696 ) ( not ( = ?auto_3696 ?auto_3697 ) ) ( not ( = ?auto_3696 ?auto_3698 ) ) ( not ( = ?auto_3696 ?auto_3699 ) ) ( not ( = ?auto_3696 ?auto_3704 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3697 ?auto_3698 ?auto_3699 )
      ( MAKE-3CRATE-VERIFY ?auto_3696 ?auto_3697 ?auto_3698 ?auto_3699 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3724 - SURFACE
      ?auto_3725 - SURFACE
      ?auto_3726 - SURFACE
      ?auto_3727 - SURFACE
    )
    :vars
    (
      ?auto_3731 - HOIST
      ?auto_3732 - PLACE
      ?auto_3730 - PLACE
      ?auto_3733 - HOIST
      ?auto_3729 - SURFACE
      ?auto_3728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3731 ?auto_3732 ) ( IS-CRATE ?auto_3727 ) ( not ( = ?auto_3726 ?auto_3727 ) ) ( not ( = ?auto_3725 ?auto_3726 ) ) ( not ( = ?auto_3725 ?auto_3727 ) ) ( not ( = ?auto_3730 ?auto_3732 ) ) ( HOIST-AT ?auto_3733 ?auto_3730 ) ( not ( = ?auto_3731 ?auto_3733 ) ) ( SURFACE-AT ?auto_3727 ?auto_3730 ) ( ON ?auto_3727 ?auto_3729 ) ( CLEAR ?auto_3727 ) ( not ( = ?auto_3726 ?auto_3729 ) ) ( not ( = ?auto_3727 ?auto_3729 ) ) ( not ( = ?auto_3725 ?auto_3729 ) ) ( SURFACE-AT ?auto_3725 ?auto_3732 ) ( CLEAR ?auto_3725 ) ( IS-CRATE ?auto_3726 ) ( AVAILABLE ?auto_3731 ) ( TRUCK-AT ?auto_3728 ?auto_3730 ) ( LIFTING ?auto_3733 ?auto_3726 ) ( ON ?auto_3725 ?auto_3724 ) ( not ( = ?auto_3724 ?auto_3725 ) ) ( not ( = ?auto_3724 ?auto_3726 ) ) ( not ( = ?auto_3724 ?auto_3727 ) ) ( not ( = ?auto_3724 ?auto_3729 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3725 ?auto_3726 ?auto_3727 )
      ( MAKE-3CRATE-VERIFY ?auto_3724 ?auto_3725 ?auto_3726 ?auto_3727 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3754 - SURFACE
      ?auto_3755 - SURFACE
      ?auto_3756 - SURFACE
      ?auto_3757 - SURFACE
    )
    :vars
    (
      ?auto_3758 - HOIST
      ?auto_3762 - PLACE
      ?auto_3760 - PLACE
      ?auto_3759 - HOIST
      ?auto_3763 - SURFACE
      ?auto_3761 - TRUCK
      ?auto_3764 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3758 ?auto_3762 ) ( IS-CRATE ?auto_3757 ) ( not ( = ?auto_3756 ?auto_3757 ) ) ( not ( = ?auto_3755 ?auto_3756 ) ) ( not ( = ?auto_3755 ?auto_3757 ) ) ( not ( = ?auto_3760 ?auto_3762 ) ) ( HOIST-AT ?auto_3759 ?auto_3760 ) ( not ( = ?auto_3758 ?auto_3759 ) ) ( SURFACE-AT ?auto_3757 ?auto_3760 ) ( ON ?auto_3757 ?auto_3763 ) ( CLEAR ?auto_3757 ) ( not ( = ?auto_3756 ?auto_3763 ) ) ( not ( = ?auto_3757 ?auto_3763 ) ) ( not ( = ?auto_3755 ?auto_3763 ) ) ( SURFACE-AT ?auto_3755 ?auto_3762 ) ( CLEAR ?auto_3755 ) ( IS-CRATE ?auto_3756 ) ( AVAILABLE ?auto_3758 ) ( TRUCK-AT ?auto_3761 ?auto_3760 ) ( AVAILABLE ?auto_3759 ) ( SURFACE-AT ?auto_3756 ?auto_3760 ) ( ON ?auto_3756 ?auto_3764 ) ( CLEAR ?auto_3756 ) ( not ( = ?auto_3756 ?auto_3764 ) ) ( not ( = ?auto_3757 ?auto_3764 ) ) ( not ( = ?auto_3755 ?auto_3764 ) ) ( not ( = ?auto_3763 ?auto_3764 ) ) ( ON ?auto_3755 ?auto_3754 ) ( not ( = ?auto_3754 ?auto_3755 ) ) ( not ( = ?auto_3754 ?auto_3756 ) ) ( not ( = ?auto_3754 ?auto_3757 ) ) ( not ( = ?auto_3754 ?auto_3763 ) ) ( not ( = ?auto_3754 ?auto_3764 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3755 ?auto_3756 ?auto_3757 )
      ( MAKE-3CRATE-VERIFY ?auto_3754 ?auto_3755 ?auto_3756 ?auto_3757 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3785 - SURFACE
      ?auto_3786 - SURFACE
      ?auto_3787 - SURFACE
      ?auto_3788 - SURFACE
    )
    :vars
    (
      ?auto_3789 - HOIST
      ?auto_3792 - PLACE
      ?auto_3793 - PLACE
      ?auto_3794 - HOIST
      ?auto_3795 - SURFACE
      ?auto_3790 - SURFACE
      ?auto_3791 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3789 ?auto_3792 ) ( IS-CRATE ?auto_3788 ) ( not ( = ?auto_3787 ?auto_3788 ) ) ( not ( = ?auto_3786 ?auto_3787 ) ) ( not ( = ?auto_3786 ?auto_3788 ) ) ( not ( = ?auto_3793 ?auto_3792 ) ) ( HOIST-AT ?auto_3794 ?auto_3793 ) ( not ( = ?auto_3789 ?auto_3794 ) ) ( SURFACE-AT ?auto_3788 ?auto_3793 ) ( ON ?auto_3788 ?auto_3795 ) ( CLEAR ?auto_3788 ) ( not ( = ?auto_3787 ?auto_3795 ) ) ( not ( = ?auto_3788 ?auto_3795 ) ) ( not ( = ?auto_3786 ?auto_3795 ) ) ( SURFACE-AT ?auto_3786 ?auto_3792 ) ( CLEAR ?auto_3786 ) ( IS-CRATE ?auto_3787 ) ( AVAILABLE ?auto_3789 ) ( AVAILABLE ?auto_3794 ) ( SURFACE-AT ?auto_3787 ?auto_3793 ) ( ON ?auto_3787 ?auto_3790 ) ( CLEAR ?auto_3787 ) ( not ( = ?auto_3787 ?auto_3790 ) ) ( not ( = ?auto_3788 ?auto_3790 ) ) ( not ( = ?auto_3786 ?auto_3790 ) ) ( not ( = ?auto_3795 ?auto_3790 ) ) ( TRUCK-AT ?auto_3791 ?auto_3792 ) ( ON ?auto_3786 ?auto_3785 ) ( not ( = ?auto_3785 ?auto_3786 ) ) ( not ( = ?auto_3785 ?auto_3787 ) ) ( not ( = ?auto_3785 ?auto_3788 ) ) ( not ( = ?auto_3785 ?auto_3795 ) ) ( not ( = ?auto_3785 ?auto_3790 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3786 ?auto_3787 ?auto_3788 )
      ( MAKE-3CRATE-VERIFY ?auto_3785 ?auto_3786 ?auto_3787 ?auto_3788 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3796 - SURFACE
      ?auto_3797 - SURFACE
    )
    :vars
    (
      ?auto_3798 - HOIST
      ?auto_3801 - PLACE
      ?auto_3805 - SURFACE
      ?auto_3802 - PLACE
      ?auto_3803 - HOIST
      ?auto_3804 - SURFACE
      ?auto_3799 - SURFACE
      ?auto_3800 - TRUCK
      ?auto_3806 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3798 ?auto_3801 ) ( IS-CRATE ?auto_3797 ) ( not ( = ?auto_3796 ?auto_3797 ) ) ( not ( = ?auto_3805 ?auto_3796 ) ) ( not ( = ?auto_3805 ?auto_3797 ) ) ( not ( = ?auto_3802 ?auto_3801 ) ) ( HOIST-AT ?auto_3803 ?auto_3802 ) ( not ( = ?auto_3798 ?auto_3803 ) ) ( SURFACE-AT ?auto_3797 ?auto_3802 ) ( ON ?auto_3797 ?auto_3804 ) ( CLEAR ?auto_3797 ) ( not ( = ?auto_3796 ?auto_3804 ) ) ( not ( = ?auto_3797 ?auto_3804 ) ) ( not ( = ?auto_3805 ?auto_3804 ) ) ( IS-CRATE ?auto_3796 ) ( AVAILABLE ?auto_3803 ) ( SURFACE-AT ?auto_3796 ?auto_3802 ) ( ON ?auto_3796 ?auto_3799 ) ( CLEAR ?auto_3796 ) ( not ( = ?auto_3796 ?auto_3799 ) ) ( not ( = ?auto_3797 ?auto_3799 ) ) ( not ( = ?auto_3805 ?auto_3799 ) ) ( not ( = ?auto_3804 ?auto_3799 ) ) ( TRUCK-AT ?auto_3800 ?auto_3801 ) ( SURFACE-AT ?auto_3806 ?auto_3801 ) ( CLEAR ?auto_3806 ) ( LIFTING ?auto_3798 ?auto_3805 ) ( IS-CRATE ?auto_3805 ) ( not ( = ?auto_3806 ?auto_3805 ) ) ( not ( = ?auto_3796 ?auto_3806 ) ) ( not ( = ?auto_3797 ?auto_3806 ) ) ( not ( = ?auto_3804 ?auto_3806 ) ) ( not ( = ?auto_3799 ?auto_3806 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3806 ?auto_3805 )
      ( MAKE-2CRATE ?auto_3805 ?auto_3796 ?auto_3797 )
      ( MAKE-1CRATE-VERIFY ?auto_3796 ?auto_3797 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3807 - SURFACE
      ?auto_3808 - SURFACE
      ?auto_3809 - SURFACE
    )
    :vars
    (
      ?auto_3810 - HOIST
      ?auto_3815 - PLACE
      ?auto_3813 - PLACE
      ?auto_3811 - HOIST
      ?auto_3816 - SURFACE
      ?auto_3817 - SURFACE
      ?auto_3814 - TRUCK
      ?auto_3812 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3810 ?auto_3815 ) ( IS-CRATE ?auto_3809 ) ( not ( = ?auto_3808 ?auto_3809 ) ) ( not ( = ?auto_3807 ?auto_3808 ) ) ( not ( = ?auto_3807 ?auto_3809 ) ) ( not ( = ?auto_3813 ?auto_3815 ) ) ( HOIST-AT ?auto_3811 ?auto_3813 ) ( not ( = ?auto_3810 ?auto_3811 ) ) ( SURFACE-AT ?auto_3809 ?auto_3813 ) ( ON ?auto_3809 ?auto_3816 ) ( CLEAR ?auto_3809 ) ( not ( = ?auto_3808 ?auto_3816 ) ) ( not ( = ?auto_3809 ?auto_3816 ) ) ( not ( = ?auto_3807 ?auto_3816 ) ) ( IS-CRATE ?auto_3808 ) ( AVAILABLE ?auto_3811 ) ( SURFACE-AT ?auto_3808 ?auto_3813 ) ( ON ?auto_3808 ?auto_3817 ) ( CLEAR ?auto_3808 ) ( not ( = ?auto_3808 ?auto_3817 ) ) ( not ( = ?auto_3809 ?auto_3817 ) ) ( not ( = ?auto_3807 ?auto_3817 ) ) ( not ( = ?auto_3816 ?auto_3817 ) ) ( TRUCK-AT ?auto_3814 ?auto_3815 ) ( SURFACE-AT ?auto_3812 ?auto_3815 ) ( CLEAR ?auto_3812 ) ( LIFTING ?auto_3810 ?auto_3807 ) ( IS-CRATE ?auto_3807 ) ( not ( = ?auto_3812 ?auto_3807 ) ) ( not ( = ?auto_3808 ?auto_3812 ) ) ( not ( = ?auto_3809 ?auto_3812 ) ) ( not ( = ?auto_3816 ?auto_3812 ) ) ( not ( = ?auto_3817 ?auto_3812 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3808 ?auto_3809 )
      ( MAKE-2CRATE-VERIFY ?auto_3807 ?auto_3808 ?auto_3809 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3818 - SURFACE
      ?auto_3819 - SURFACE
      ?auto_3820 - SURFACE
      ?auto_3821 - SURFACE
    )
    :vars
    (
      ?auto_3825 - HOIST
      ?auto_3824 - PLACE
      ?auto_3828 - PLACE
      ?auto_3826 - HOIST
      ?auto_3823 - SURFACE
      ?auto_3827 - SURFACE
      ?auto_3822 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3825 ?auto_3824 ) ( IS-CRATE ?auto_3821 ) ( not ( = ?auto_3820 ?auto_3821 ) ) ( not ( = ?auto_3819 ?auto_3820 ) ) ( not ( = ?auto_3819 ?auto_3821 ) ) ( not ( = ?auto_3828 ?auto_3824 ) ) ( HOIST-AT ?auto_3826 ?auto_3828 ) ( not ( = ?auto_3825 ?auto_3826 ) ) ( SURFACE-AT ?auto_3821 ?auto_3828 ) ( ON ?auto_3821 ?auto_3823 ) ( CLEAR ?auto_3821 ) ( not ( = ?auto_3820 ?auto_3823 ) ) ( not ( = ?auto_3821 ?auto_3823 ) ) ( not ( = ?auto_3819 ?auto_3823 ) ) ( IS-CRATE ?auto_3820 ) ( AVAILABLE ?auto_3826 ) ( SURFACE-AT ?auto_3820 ?auto_3828 ) ( ON ?auto_3820 ?auto_3827 ) ( CLEAR ?auto_3820 ) ( not ( = ?auto_3820 ?auto_3827 ) ) ( not ( = ?auto_3821 ?auto_3827 ) ) ( not ( = ?auto_3819 ?auto_3827 ) ) ( not ( = ?auto_3823 ?auto_3827 ) ) ( TRUCK-AT ?auto_3822 ?auto_3824 ) ( SURFACE-AT ?auto_3818 ?auto_3824 ) ( CLEAR ?auto_3818 ) ( LIFTING ?auto_3825 ?auto_3819 ) ( IS-CRATE ?auto_3819 ) ( not ( = ?auto_3818 ?auto_3819 ) ) ( not ( = ?auto_3820 ?auto_3818 ) ) ( not ( = ?auto_3821 ?auto_3818 ) ) ( not ( = ?auto_3823 ?auto_3818 ) ) ( not ( = ?auto_3827 ?auto_3818 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3819 ?auto_3820 ?auto_3821 )
      ( MAKE-3CRATE-VERIFY ?auto_3818 ?auto_3819 ?auto_3820 ?auto_3821 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3877 - SURFACE
      ?auto_3878 - SURFACE
    )
    :vars
    (
      ?auto_3885 - HOIST
      ?auto_3879 - PLACE
      ?auto_3880 - SURFACE
      ?auto_3883 - PLACE
      ?auto_3884 - HOIST
      ?auto_3886 - SURFACE
      ?auto_3882 - TRUCK
      ?auto_3881 - SURFACE
      ?auto_3887 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3885 ?auto_3879 ) ( IS-CRATE ?auto_3878 ) ( not ( = ?auto_3877 ?auto_3878 ) ) ( not ( = ?auto_3880 ?auto_3877 ) ) ( not ( = ?auto_3880 ?auto_3878 ) ) ( not ( = ?auto_3883 ?auto_3879 ) ) ( HOIST-AT ?auto_3884 ?auto_3883 ) ( not ( = ?auto_3885 ?auto_3884 ) ) ( SURFACE-AT ?auto_3878 ?auto_3883 ) ( ON ?auto_3878 ?auto_3886 ) ( CLEAR ?auto_3878 ) ( not ( = ?auto_3877 ?auto_3886 ) ) ( not ( = ?auto_3878 ?auto_3886 ) ) ( not ( = ?auto_3880 ?auto_3886 ) ) ( SURFACE-AT ?auto_3880 ?auto_3879 ) ( CLEAR ?auto_3880 ) ( IS-CRATE ?auto_3877 ) ( AVAILABLE ?auto_3885 ) ( TRUCK-AT ?auto_3882 ?auto_3883 ) ( SURFACE-AT ?auto_3877 ?auto_3883 ) ( ON ?auto_3877 ?auto_3881 ) ( CLEAR ?auto_3877 ) ( not ( = ?auto_3877 ?auto_3881 ) ) ( not ( = ?auto_3878 ?auto_3881 ) ) ( not ( = ?auto_3880 ?auto_3881 ) ) ( not ( = ?auto_3886 ?auto_3881 ) ) ( LIFTING ?auto_3884 ?auto_3887 ) ( IS-CRATE ?auto_3887 ) ( not ( = ?auto_3877 ?auto_3887 ) ) ( not ( = ?auto_3878 ?auto_3887 ) ) ( not ( = ?auto_3880 ?auto_3887 ) ) ( not ( = ?auto_3886 ?auto_3887 ) ) ( not ( = ?auto_3881 ?auto_3887 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3884 ?auto_3887 ?auto_3882 ?auto_3883 )
      ( MAKE-1CRATE ?auto_3877 ?auto_3878 )
      ( MAKE-1CRATE-VERIFY ?auto_3877 ?auto_3878 ) )
  )

)

