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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3166 - SURFACE
      ?auto_3167 - SURFACE
    )
    :vars
    (
      ?auto_3168 - HOIST
      ?auto_3169 - PLACE
      ?auto_3171 - PLACE
      ?auto_3172 - HOIST
      ?auto_3173 - SURFACE
      ?auto_3170 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3168 ?auto_3169 ) ( SURFACE-AT ?auto_3166 ?auto_3169 ) ( CLEAR ?auto_3166 ) ( IS-CRATE ?auto_3167 ) ( AVAILABLE ?auto_3168 ) ( not ( = ?auto_3171 ?auto_3169 ) ) ( HOIST-AT ?auto_3172 ?auto_3171 ) ( AVAILABLE ?auto_3172 ) ( SURFACE-AT ?auto_3167 ?auto_3171 ) ( ON ?auto_3167 ?auto_3173 ) ( CLEAR ?auto_3167 ) ( TRUCK-AT ?auto_3170 ?auto_3169 ) ( not ( = ?auto_3166 ?auto_3167 ) ) ( not ( = ?auto_3166 ?auto_3173 ) ) ( not ( = ?auto_3167 ?auto_3173 ) ) ( not ( = ?auto_3168 ?auto_3172 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3170 ?auto_3169 ?auto_3171 )
      ( !LIFT ?auto_3172 ?auto_3167 ?auto_3173 ?auto_3171 )
      ( !LOAD ?auto_3172 ?auto_3167 ?auto_3170 ?auto_3171 )
      ( !DRIVE ?auto_3170 ?auto_3171 ?auto_3169 )
      ( !UNLOAD ?auto_3168 ?auto_3167 ?auto_3170 ?auto_3169 )
      ( !DROP ?auto_3168 ?auto_3167 ?auto_3166 ?auto_3169 )
      ( MAKE-1CRATE-VERIFY ?auto_3166 ?auto_3167 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3187 - SURFACE
      ?auto_3188 - SURFACE
      ?auto_3189 - SURFACE
    )
    :vars
    (
      ?auto_3192 - HOIST
      ?auto_3194 - PLACE
      ?auto_3193 - PLACE
      ?auto_3191 - HOIST
      ?auto_3190 - SURFACE
      ?auto_3197 - PLACE
      ?auto_3198 - HOIST
      ?auto_3196 - SURFACE
      ?auto_3195 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3192 ?auto_3194 ) ( IS-CRATE ?auto_3189 ) ( not ( = ?auto_3193 ?auto_3194 ) ) ( HOIST-AT ?auto_3191 ?auto_3193 ) ( AVAILABLE ?auto_3191 ) ( SURFACE-AT ?auto_3189 ?auto_3193 ) ( ON ?auto_3189 ?auto_3190 ) ( CLEAR ?auto_3189 ) ( not ( = ?auto_3188 ?auto_3189 ) ) ( not ( = ?auto_3188 ?auto_3190 ) ) ( not ( = ?auto_3189 ?auto_3190 ) ) ( not ( = ?auto_3192 ?auto_3191 ) ) ( SURFACE-AT ?auto_3187 ?auto_3194 ) ( CLEAR ?auto_3187 ) ( IS-CRATE ?auto_3188 ) ( AVAILABLE ?auto_3192 ) ( not ( = ?auto_3197 ?auto_3194 ) ) ( HOIST-AT ?auto_3198 ?auto_3197 ) ( AVAILABLE ?auto_3198 ) ( SURFACE-AT ?auto_3188 ?auto_3197 ) ( ON ?auto_3188 ?auto_3196 ) ( CLEAR ?auto_3188 ) ( TRUCK-AT ?auto_3195 ?auto_3194 ) ( not ( = ?auto_3187 ?auto_3188 ) ) ( not ( = ?auto_3187 ?auto_3196 ) ) ( not ( = ?auto_3188 ?auto_3196 ) ) ( not ( = ?auto_3192 ?auto_3198 ) ) ( not ( = ?auto_3187 ?auto_3189 ) ) ( not ( = ?auto_3187 ?auto_3190 ) ) ( not ( = ?auto_3189 ?auto_3196 ) ) ( not ( = ?auto_3193 ?auto_3197 ) ) ( not ( = ?auto_3191 ?auto_3198 ) ) ( not ( = ?auto_3190 ?auto_3196 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3187 ?auto_3188 )
      ( MAKE-1CRATE ?auto_3188 ?auto_3189 )
      ( MAKE-2CRATE-VERIFY ?auto_3187 ?auto_3188 ?auto_3189 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3213 - SURFACE
      ?auto_3214 - SURFACE
      ?auto_3215 - SURFACE
      ?auto_3216 - SURFACE
    )
    :vars
    (
      ?auto_3222 - HOIST
      ?auto_3221 - PLACE
      ?auto_3220 - PLACE
      ?auto_3218 - HOIST
      ?auto_3217 - SURFACE
      ?auto_3223 - PLACE
      ?auto_3225 - HOIST
      ?auto_3226 - SURFACE
      ?auto_3224 - SURFACE
      ?auto_3219 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3222 ?auto_3221 ) ( IS-CRATE ?auto_3216 ) ( not ( = ?auto_3220 ?auto_3221 ) ) ( HOIST-AT ?auto_3218 ?auto_3220 ) ( SURFACE-AT ?auto_3216 ?auto_3220 ) ( ON ?auto_3216 ?auto_3217 ) ( CLEAR ?auto_3216 ) ( not ( = ?auto_3215 ?auto_3216 ) ) ( not ( = ?auto_3215 ?auto_3217 ) ) ( not ( = ?auto_3216 ?auto_3217 ) ) ( not ( = ?auto_3222 ?auto_3218 ) ) ( IS-CRATE ?auto_3215 ) ( not ( = ?auto_3223 ?auto_3221 ) ) ( HOIST-AT ?auto_3225 ?auto_3223 ) ( AVAILABLE ?auto_3225 ) ( SURFACE-AT ?auto_3215 ?auto_3223 ) ( ON ?auto_3215 ?auto_3226 ) ( CLEAR ?auto_3215 ) ( not ( = ?auto_3214 ?auto_3215 ) ) ( not ( = ?auto_3214 ?auto_3226 ) ) ( not ( = ?auto_3215 ?auto_3226 ) ) ( not ( = ?auto_3222 ?auto_3225 ) ) ( SURFACE-AT ?auto_3213 ?auto_3221 ) ( CLEAR ?auto_3213 ) ( IS-CRATE ?auto_3214 ) ( AVAILABLE ?auto_3222 ) ( AVAILABLE ?auto_3218 ) ( SURFACE-AT ?auto_3214 ?auto_3220 ) ( ON ?auto_3214 ?auto_3224 ) ( CLEAR ?auto_3214 ) ( TRUCK-AT ?auto_3219 ?auto_3221 ) ( not ( = ?auto_3213 ?auto_3214 ) ) ( not ( = ?auto_3213 ?auto_3224 ) ) ( not ( = ?auto_3214 ?auto_3224 ) ) ( not ( = ?auto_3213 ?auto_3215 ) ) ( not ( = ?auto_3213 ?auto_3226 ) ) ( not ( = ?auto_3215 ?auto_3224 ) ) ( not ( = ?auto_3223 ?auto_3220 ) ) ( not ( = ?auto_3225 ?auto_3218 ) ) ( not ( = ?auto_3226 ?auto_3224 ) ) ( not ( = ?auto_3213 ?auto_3216 ) ) ( not ( = ?auto_3213 ?auto_3217 ) ) ( not ( = ?auto_3214 ?auto_3216 ) ) ( not ( = ?auto_3214 ?auto_3217 ) ) ( not ( = ?auto_3216 ?auto_3226 ) ) ( not ( = ?auto_3216 ?auto_3224 ) ) ( not ( = ?auto_3217 ?auto_3226 ) ) ( not ( = ?auto_3217 ?auto_3224 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3213 ?auto_3214 ?auto_3215 )
      ( MAKE-1CRATE ?auto_3215 ?auto_3216 )
      ( MAKE-3CRATE-VERIFY ?auto_3213 ?auto_3214 ?auto_3215 ?auto_3216 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_3242 - SURFACE
      ?auto_3243 - SURFACE
      ?auto_3244 - SURFACE
      ?auto_3245 - SURFACE
      ?auto_3246 - SURFACE
    )
    :vars
    (
      ?auto_3250 - HOIST
      ?auto_3251 - PLACE
      ?auto_3247 - PLACE
      ?auto_3249 - HOIST
      ?auto_3248 - SURFACE
      ?auto_3256 - PLACE
      ?auto_3255 - HOIST
      ?auto_3254 - SURFACE
      ?auto_3257 - SURFACE
      ?auto_3253 - SURFACE
      ?auto_3252 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3250 ?auto_3251 ) ( IS-CRATE ?auto_3246 ) ( not ( = ?auto_3247 ?auto_3251 ) ) ( HOIST-AT ?auto_3249 ?auto_3247 ) ( SURFACE-AT ?auto_3246 ?auto_3247 ) ( ON ?auto_3246 ?auto_3248 ) ( CLEAR ?auto_3246 ) ( not ( = ?auto_3245 ?auto_3246 ) ) ( not ( = ?auto_3245 ?auto_3248 ) ) ( not ( = ?auto_3246 ?auto_3248 ) ) ( not ( = ?auto_3250 ?auto_3249 ) ) ( IS-CRATE ?auto_3245 ) ( not ( = ?auto_3256 ?auto_3251 ) ) ( HOIST-AT ?auto_3255 ?auto_3256 ) ( SURFACE-AT ?auto_3245 ?auto_3256 ) ( ON ?auto_3245 ?auto_3254 ) ( CLEAR ?auto_3245 ) ( not ( = ?auto_3244 ?auto_3245 ) ) ( not ( = ?auto_3244 ?auto_3254 ) ) ( not ( = ?auto_3245 ?auto_3254 ) ) ( not ( = ?auto_3250 ?auto_3255 ) ) ( IS-CRATE ?auto_3244 ) ( AVAILABLE ?auto_3249 ) ( SURFACE-AT ?auto_3244 ?auto_3247 ) ( ON ?auto_3244 ?auto_3257 ) ( CLEAR ?auto_3244 ) ( not ( = ?auto_3243 ?auto_3244 ) ) ( not ( = ?auto_3243 ?auto_3257 ) ) ( not ( = ?auto_3244 ?auto_3257 ) ) ( SURFACE-AT ?auto_3242 ?auto_3251 ) ( CLEAR ?auto_3242 ) ( IS-CRATE ?auto_3243 ) ( AVAILABLE ?auto_3250 ) ( AVAILABLE ?auto_3255 ) ( SURFACE-AT ?auto_3243 ?auto_3256 ) ( ON ?auto_3243 ?auto_3253 ) ( CLEAR ?auto_3243 ) ( TRUCK-AT ?auto_3252 ?auto_3251 ) ( not ( = ?auto_3242 ?auto_3243 ) ) ( not ( = ?auto_3242 ?auto_3253 ) ) ( not ( = ?auto_3243 ?auto_3253 ) ) ( not ( = ?auto_3242 ?auto_3244 ) ) ( not ( = ?auto_3242 ?auto_3257 ) ) ( not ( = ?auto_3244 ?auto_3253 ) ) ( not ( = ?auto_3247 ?auto_3256 ) ) ( not ( = ?auto_3249 ?auto_3255 ) ) ( not ( = ?auto_3257 ?auto_3253 ) ) ( not ( = ?auto_3242 ?auto_3245 ) ) ( not ( = ?auto_3242 ?auto_3254 ) ) ( not ( = ?auto_3243 ?auto_3245 ) ) ( not ( = ?auto_3243 ?auto_3254 ) ) ( not ( = ?auto_3245 ?auto_3257 ) ) ( not ( = ?auto_3245 ?auto_3253 ) ) ( not ( = ?auto_3254 ?auto_3257 ) ) ( not ( = ?auto_3254 ?auto_3253 ) ) ( not ( = ?auto_3242 ?auto_3246 ) ) ( not ( = ?auto_3242 ?auto_3248 ) ) ( not ( = ?auto_3243 ?auto_3246 ) ) ( not ( = ?auto_3243 ?auto_3248 ) ) ( not ( = ?auto_3244 ?auto_3246 ) ) ( not ( = ?auto_3244 ?auto_3248 ) ) ( not ( = ?auto_3246 ?auto_3254 ) ) ( not ( = ?auto_3246 ?auto_3257 ) ) ( not ( = ?auto_3246 ?auto_3253 ) ) ( not ( = ?auto_3248 ?auto_3254 ) ) ( not ( = ?auto_3248 ?auto_3257 ) ) ( not ( = ?auto_3248 ?auto_3253 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3242 ?auto_3243 ?auto_3244 ?auto_3245 )
      ( MAKE-1CRATE ?auto_3245 ?auto_3246 )
      ( MAKE-4CRATE-VERIFY ?auto_3242 ?auto_3243 ?auto_3244 ?auto_3245 ?auto_3246 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_3274 - SURFACE
      ?auto_3275 - SURFACE
      ?auto_3276 - SURFACE
      ?auto_3277 - SURFACE
      ?auto_3278 - SURFACE
      ?auto_3279 - SURFACE
    )
    :vars
    (
      ?auto_3284 - HOIST
      ?auto_3280 - PLACE
      ?auto_3283 - PLACE
      ?auto_3281 - HOIST
      ?auto_3282 - SURFACE
      ?auto_3291 - PLACE
      ?auto_3293 - HOIST
      ?auto_3287 - SURFACE
      ?auto_3288 - PLACE
      ?auto_3286 - HOIST
      ?auto_3289 - SURFACE
      ?auto_3290 - SURFACE
      ?auto_3292 - SURFACE
      ?auto_3285 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3284 ?auto_3280 ) ( IS-CRATE ?auto_3279 ) ( not ( = ?auto_3283 ?auto_3280 ) ) ( HOIST-AT ?auto_3281 ?auto_3283 ) ( AVAILABLE ?auto_3281 ) ( SURFACE-AT ?auto_3279 ?auto_3283 ) ( ON ?auto_3279 ?auto_3282 ) ( CLEAR ?auto_3279 ) ( not ( = ?auto_3278 ?auto_3279 ) ) ( not ( = ?auto_3278 ?auto_3282 ) ) ( not ( = ?auto_3279 ?auto_3282 ) ) ( not ( = ?auto_3284 ?auto_3281 ) ) ( IS-CRATE ?auto_3278 ) ( not ( = ?auto_3291 ?auto_3280 ) ) ( HOIST-AT ?auto_3293 ?auto_3291 ) ( SURFACE-AT ?auto_3278 ?auto_3291 ) ( ON ?auto_3278 ?auto_3287 ) ( CLEAR ?auto_3278 ) ( not ( = ?auto_3277 ?auto_3278 ) ) ( not ( = ?auto_3277 ?auto_3287 ) ) ( not ( = ?auto_3278 ?auto_3287 ) ) ( not ( = ?auto_3284 ?auto_3293 ) ) ( IS-CRATE ?auto_3277 ) ( not ( = ?auto_3288 ?auto_3280 ) ) ( HOIST-AT ?auto_3286 ?auto_3288 ) ( SURFACE-AT ?auto_3277 ?auto_3288 ) ( ON ?auto_3277 ?auto_3289 ) ( CLEAR ?auto_3277 ) ( not ( = ?auto_3276 ?auto_3277 ) ) ( not ( = ?auto_3276 ?auto_3289 ) ) ( not ( = ?auto_3277 ?auto_3289 ) ) ( not ( = ?auto_3284 ?auto_3286 ) ) ( IS-CRATE ?auto_3276 ) ( AVAILABLE ?auto_3293 ) ( SURFACE-AT ?auto_3276 ?auto_3291 ) ( ON ?auto_3276 ?auto_3290 ) ( CLEAR ?auto_3276 ) ( not ( = ?auto_3275 ?auto_3276 ) ) ( not ( = ?auto_3275 ?auto_3290 ) ) ( not ( = ?auto_3276 ?auto_3290 ) ) ( SURFACE-AT ?auto_3274 ?auto_3280 ) ( CLEAR ?auto_3274 ) ( IS-CRATE ?auto_3275 ) ( AVAILABLE ?auto_3284 ) ( AVAILABLE ?auto_3286 ) ( SURFACE-AT ?auto_3275 ?auto_3288 ) ( ON ?auto_3275 ?auto_3292 ) ( CLEAR ?auto_3275 ) ( TRUCK-AT ?auto_3285 ?auto_3280 ) ( not ( = ?auto_3274 ?auto_3275 ) ) ( not ( = ?auto_3274 ?auto_3292 ) ) ( not ( = ?auto_3275 ?auto_3292 ) ) ( not ( = ?auto_3274 ?auto_3276 ) ) ( not ( = ?auto_3274 ?auto_3290 ) ) ( not ( = ?auto_3276 ?auto_3292 ) ) ( not ( = ?auto_3291 ?auto_3288 ) ) ( not ( = ?auto_3293 ?auto_3286 ) ) ( not ( = ?auto_3290 ?auto_3292 ) ) ( not ( = ?auto_3274 ?auto_3277 ) ) ( not ( = ?auto_3274 ?auto_3289 ) ) ( not ( = ?auto_3275 ?auto_3277 ) ) ( not ( = ?auto_3275 ?auto_3289 ) ) ( not ( = ?auto_3277 ?auto_3290 ) ) ( not ( = ?auto_3277 ?auto_3292 ) ) ( not ( = ?auto_3289 ?auto_3290 ) ) ( not ( = ?auto_3289 ?auto_3292 ) ) ( not ( = ?auto_3274 ?auto_3278 ) ) ( not ( = ?auto_3274 ?auto_3287 ) ) ( not ( = ?auto_3275 ?auto_3278 ) ) ( not ( = ?auto_3275 ?auto_3287 ) ) ( not ( = ?auto_3276 ?auto_3278 ) ) ( not ( = ?auto_3276 ?auto_3287 ) ) ( not ( = ?auto_3278 ?auto_3289 ) ) ( not ( = ?auto_3278 ?auto_3290 ) ) ( not ( = ?auto_3278 ?auto_3292 ) ) ( not ( = ?auto_3287 ?auto_3289 ) ) ( not ( = ?auto_3287 ?auto_3290 ) ) ( not ( = ?auto_3287 ?auto_3292 ) ) ( not ( = ?auto_3274 ?auto_3279 ) ) ( not ( = ?auto_3274 ?auto_3282 ) ) ( not ( = ?auto_3275 ?auto_3279 ) ) ( not ( = ?auto_3275 ?auto_3282 ) ) ( not ( = ?auto_3276 ?auto_3279 ) ) ( not ( = ?auto_3276 ?auto_3282 ) ) ( not ( = ?auto_3277 ?auto_3279 ) ) ( not ( = ?auto_3277 ?auto_3282 ) ) ( not ( = ?auto_3279 ?auto_3287 ) ) ( not ( = ?auto_3279 ?auto_3289 ) ) ( not ( = ?auto_3279 ?auto_3290 ) ) ( not ( = ?auto_3279 ?auto_3292 ) ) ( not ( = ?auto_3283 ?auto_3291 ) ) ( not ( = ?auto_3283 ?auto_3288 ) ) ( not ( = ?auto_3281 ?auto_3293 ) ) ( not ( = ?auto_3281 ?auto_3286 ) ) ( not ( = ?auto_3282 ?auto_3287 ) ) ( not ( = ?auto_3282 ?auto_3289 ) ) ( not ( = ?auto_3282 ?auto_3290 ) ) ( not ( = ?auto_3282 ?auto_3292 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_3274 ?auto_3275 ?auto_3276 ?auto_3277 ?auto_3278 )
      ( MAKE-1CRATE ?auto_3278 ?auto_3279 )
      ( MAKE-5CRATE-VERIFY ?auto_3274 ?auto_3275 ?auto_3276 ?auto_3277 ?auto_3278 ?auto_3279 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_3311 - SURFACE
      ?auto_3312 - SURFACE
      ?auto_3313 - SURFACE
      ?auto_3314 - SURFACE
      ?auto_3315 - SURFACE
      ?auto_3316 - SURFACE
      ?auto_3317 - SURFACE
    )
    :vars
    (
      ?auto_3321 - HOIST
      ?auto_3320 - PLACE
      ?auto_3318 - PLACE
      ?auto_3319 - HOIST
      ?auto_3322 - SURFACE
      ?auto_3329 - PLACE
      ?auto_3330 - HOIST
      ?auto_3334 - SURFACE
      ?auto_3331 - PLACE
      ?auto_3326 - HOIST
      ?auto_3325 - SURFACE
      ?auto_3324 - PLACE
      ?auto_3327 - HOIST
      ?auto_3328 - SURFACE
      ?auto_3332 - SURFACE
      ?auto_3333 - SURFACE
      ?auto_3323 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3321 ?auto_3320 ) ( IS-CRATE ?auto_3317 ) ( not ( = ?auto_3318 ?auto_3320 ) ) ( HOIST-AT ?auto_3319 ?auto_3318 ) ( AVAILABLE ?auto_3319 ) ( SURFACE-AT ?auto_3317 ?auto_3318 ) ( ON ?auto_3317 ?auto_3322 ) ( CLEAR ?auto_3317 ) ( not ( = ?auto_3316 ?auto_3317 ) ) ( not ( = ?auto_3316 ?auto_3322 ) ) ( not ( = ?auto_3317 ?auto_3322 ) ) ( not ( = ?auto_3321 ?auto_3319 ) ) ( IS-CRATE ?auto_3316 ) ( not ( = ?auto_3329 ?auto_3320 ) ) ( HOIST-AT ?auto_3330 ?auto_3329 ) ( AVAILABLE ?auto_3330 ) ( SURFACE-AT ?auto_3316 ?auto_3329 ) ( ON ?auto_3316 ?auto_3334 ) ( CLEAR ?auto_3316 ) ( not ( = ?auto_3315 ?auto_3316 ) ) ( not ( = ?auto_3315 ?auto_3334 ) ) ( not ( = ?auto_3316 ?auto_3334 ) ) ( not ( = ?auto_3321 ?auto_3330 ) ) ( IS-CRATE ?auto_3315 ) ( not ( = ?auto_3331 ?auto_3320 ) ) ( HOIST-AT ?auto_3326 ?auto_3331 ) ( SURFACE-AT ?auto_3315 ?auto_3331 ) ( ON ?auto_3315 ?auto_3325 ) ( CLEAR ?auto_3315 ) ( not ( = ?auto_3314 ?auto_3315 ) ) ( not ( = ?auto_3314 ?auto_3325 ) ) ( not ( = ?auto_3315 ?auto_3325 ) ) ( not ( = ?auto_3321 ?auto_3326 ) ) ( IS-CRATE ?auto_3314 ) ( not ( = ?auto_3324 ?auto_3320 ) ) ( HOIST-AT ?auto_3327 ?auto_3324 ) ( SURFACE-AT ?auto_3314 ?auto_3324 ) ( ON ?auto_3314 ?auto_3328 ) ( CLEAR ?auto_3314 ) ( not ( = ?auto_3313 ?auto_3314 ) ) ( not ( = ?auto_3313 ?auto_3328 ) ) ( not ( = ?auto_3314 ?auto_3328 ) ) ( not ( = ?auto_3321 ?auto_3327 ) ) ( IS-CRATE ?auto_3313 ) ( AVAILABLE ?auto_3326 ) ( SURFACE-AT ?auto_3313 ?auto_3331 ) ( ON ?auto_3313 ?auto_3332 ) ( CLEAR ?auto_3313 ) ( not ( = ?auto_3312 ?auto_3313 ) ) ( not ( = ?auto_3312 ?auto_3332 ) ) ( not ( = ?auto_3313 ?auto_3332 ) ) ( SURFACE-AT ?auto_3311 ?auto_3320 ) ( CLEAR ?auto_3311 ) ( IS-CRATE ?auto_3312 ) ( AVAILABLE ?auto_3321 ) ( AVAILABLE ?auto_3327 ) ( SURFACE-AT ?auto_3312 ?auto_3324 ) ( ON ?auto_3312 ?auto_3333 ) ( CLEAR ?auto_3312 ) ( TRUCK-AT ?auto_3323 ?auto_3320 ) ( not ( = ?auto_3311 ?auto_3312 ) ) ( not ( = ?auto_3311 ?auto_3333 ) ) ( not ( = ?auto_3312 ?auto_3333 ) ) ( not ( = ?auto_3311 ?auto_3313 ) ) ( not ( = ?auto_3311 ?auto_3332 ) ) ( not ( = ?auto_3313 ?auto_3333 ) ) ( not ( = ?auto_3331 ?auto_3324 ) ) ( not ( = ?auto_3326 ?auto_3327 ) ) ( not ( = ?auto_3332 ?auto_3333 ) ) ( not ( = ?auto_3311 ?auto_3314 ) ) ( not ( = ?auto_3311 ?auto_3328 ) ) ( not ( = ?auto_3312 ?auto_3314 ) ) ( not ( = ?auto_3312 ?auto_3328 ) ) ( not ( = ?auto_3314 ?auto_3332 ) ) ( not ( = ?auto_3314 ?auto_3333 ) ) ( not ( = ?auto_3328 ?auto_3332 ) ) ( not ( = ?auto_3328 ?auto_3333 ) ) ( not ( = ?auto_3311 ?auto_3315 ) ) ( not ( = ?auto_3311 ?auto_3325 ) ) ( not ( = ?auto_3312 ?auto_3315 ) ) ( not ( = ?auto_3312 ?auto_3325 ) ) ( not ( = ?auto_3313 ?auto_3315 ) ) ( not ( = ?auto_3313 ?auto_3325 ) ) ( not ( = ?auto_3315 ?auto_3328 ) ) ( not ( = ?auto_3315 ?auto_3332 ) ) ( not ( = ?auto_3315 ?auto_3333 ) ) ( not ( = ?auto_3325 ?auto_3328 ) ) ( not ( = ?auto_3325 ?auto_3332 ) ) ( not ( = ?auto_3325 ?auto_3333 ) ) ( not ( = ?auto_3311 ?auto_3316 ) ) ( not ( = ?auto_3311 ?auto_3334 ) ) ( not ( = ?auto_3312 ?auto_3316 ) ) ( not ( = ?auto_3312 ?auto_3334 ) ) ( not ( = ?auto_3313 ?auto_3316 ) ) ( not ( = ?auto_3313 ?auto_3334 ) ) ( not ( = ?auto_3314 ?auto_3316 ) ) ( not ( = ?auto_3314 ?auto_3334 ) ) ( not ( = ?auto_3316 ?auto_3325 ) ) ( not ( = ?auto_3316 ?auto_3328 ) ) ( not ( = ?auto_3316 ?auto_3332 ) ) ( not ( = ?auto_3316 ?auto_3333 ) ) ( not ( = ?auto_3329 ?auto_3331 ) ) ( not ( = ?auto_3329 ?auto_3324 ) ) ( not ( = ?auto_3330 ?auto_3326 ) ) ( not ( = ?auto_3330 ?auto_3327 ) ) ( not ( = ?auto_3334 ?auto_3325 ) ) ( not ( = ?auto_3334 ?auto_3328 ) ) ( not ( = ?auto_3334 ?auto_3332 ) ) ( not ( = ?auto_3334 ?auto_3333 ) ) ( not ( = ?auto_3311 ?auto_3317 ) ) ( not ( = ?auto_3311 ?auto_3322 ) ) ( not ( = ?auto_3312 ?auto_3317 ) ) ( not ( = ?auto_3312 ?auto_3322 ) ) ( not ( = ?auto_3313 ?auto_3317 ) ) ( not ( = ?auto_3313 ?auto_3322 ) ) ( not ( = ?auto_3314 ?auto_3317 ) ) ( not ( = ?auto_3314 ?auto_3322 ) ) ( not ( = ?auto_3315 ?auto_3317 ) ) ( not ( = ?auto_3315 ?auto_3322 ) ) ( not ( = ?auto_3317 ?auto_3334 ) ) ( not ( = ?auto_3317 ?auto_3325 ) ) ( not ( = ?auto_3317 ?auto_3328 ) ) ( not ( = ?auto_3317 ?auto_3332 ) ) ( not ( = ?auto_3317 ?auto_3333 ) ) ( not ( = ?auto_3318 ?auto_3329 ) ) ( not ( = ?auto_3318 ?auto_3331 ) ) ( not ( = ?auto_3318 ?auto_3324 ) ) ( not ( = ?auto_3319 ?auto_3330 ) ) ( not ( = ?auto_3319 ?auto_3326 ) ) ( not ( = ?auto_3319 ?auto_3327 ) ) ( not ( = ?auto_3322 ?auto_3334 ) ) ( not ( = ?auto_3322 ?auto_3325 ) ) ( not ( = ?auto_3322 ?auto_3328 ) ) ( not ( = ?auto_3322 ?auto_3332 ) ) ( not ( = ?auto_3322 ?auto_3333 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_3311 ?auto_3312 ?auto_3313 ?auto_3314 ?auto_3315 ?auto_3316 )
      ( MAKE-1CRATE ?auto_3316 ?auto_3317 )
      ( MAKE-6CRATE-VERIFY ?auto_3311 ?auto_3312 ?auto_3313 ?auto_3314 ?auto_3315 ?auto_3316 ?auto_3317 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_3353 - SURFACE
      ?auto_3354 - SURFACE
      ?auto_3355 - SURFACE
      ?auto_3356 - SURFACE
      ?auto_3357 - SURFACE
      ?auto_3358 - SURFACE
      ?auto_3359 - SURFACE
      ?auto_3360 - SURFACE
    )
    :vars
    (
      ?auto_3363 - HOIST
      ?auto_3366 - PLACE
      ?auto_3365 - PLACE
      ?auto_3364 - HOIST
      ?auto_3361 - SURFACE
      ?auto_3374 - PLACE
      ?auto_3371 - HOIST
      ?auto_3379 - SURFACE
      ?auto_3378 - PLACE
      ?auto_3369 - HOIST
      ?auto_3376 - SURFACE
      ?auto_3372 - PLACE
      ?auto_3367 - HOIST
      ?auto_3373 - SURFACE
      ?auto_3377 - PLACE
      ?auto_3368 - HOIST
      ?auto_3380 - SURFACE
      ?auto_3375 - SURFACE
      ?auto_3370 - SURFACE
      ?auto_3362 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3363 ?auto_3366 ) ( IS-CRATE ?auto_3360 ) ( not ( = ?auto_3365 ?auto_3366 ) ) ( HOIST-AT ?auto_3364 ?auto_3365 ) ( AVAILABLE ?auto_3364 ) ( SURFACE-AT ?auto_3360 ?auto_3365 ) ( ON ?auto_3360 ?auto_3361 ) ( CLEAR ?auto_3360 ) ( not ( = ?auto_3359 ?auto_3360 ) ) ( not ( = ?auto_3359 ?auto_3361 ) ) ( not ( = ?auto_3360 ?auto_3361 ) ) ( not ( = ?auto_3363 ?auto_3364 ) ) ( IS-CRATE ?auto_3359 ) ( not ( = ?auto_3374 ?auto_3366 ) ) ( HOIST-AT ?auto_3371 ?auto_3374 ) ( AVAILABLE ?auto_3371 ) ( SURFACE-AT ?auto_3359 ?auto_3374 ) ( ON ?auto_3359 ?auto_3379 ) ( CLEAR ?auto_3359 ) ( not ( = ?auto_3358 ?auto_3359 ) ) ( not ( = ?auto_3358 ?auto_3379 ) ) ( not ( = ?auto_3359 ?auto_3379 ) ) ( not ( = ?auto_3363 ?auto_3371 ) ) ( IS-CRATE ?auto_3358 ) ( not ( = ?auto_3378 ?auto_3366 ) ) ( HOIST-AT ?auto_3369 ?auto_3378 ) ( AVAILABLE ?auto_3369 ) ( SURFACE-AT ?auto_3358 ?auto_3378 ) ( ON ?auto_3358 ?auto_3376 ) ( CLEAR ?auto_3358 ) ( not ( = ?auto_3357 ?auto_3358 ) ) ( not ( = ?auto_3357 ?auto_3376 ) ) ( not ( = ?auto_3358 ?auto_3376 ) ) ( not ( = ?auto_3363 ?auto_3369 ) ) ( IS-CRATE ?auto_3357 ) ( not ( = ?auto_3372 ?auto_3366 ) ) ( HOIST-AT ?auto_3367 ?auto_3372 ) ( SURFACE-AT ?auto_3357 ?auto_3372 ) ( ON ?auto_3357 ?auto_3373 ) ( CLEAR ?auto_3357 ) ( not ( = ?auto_3356 ?auto_3357 ) ) ( not ( = ?auto_3356 ?auto_3373 ) ) ( not ( = ?auto_3357 ?auto_3373 ) ) ( not ( = ?auto_3363 ?auto_3367 ) ) ( IS-CRATE ?auto_3356 ) ( not ( = ?auto_3377 ?auto_3366 ) ) ( HOIST-AT ?auto_3368 ?auto_3377 ) ( SURFACE-AT ?auto_3356 ?auto_3377 ) ( ON ?auto_3356 ?auto_3380 ) ( CLEAR ?auto_3356 ) ( not ( = ?auto_3355 ?auto_3356 ) ) ( not ( = ?auto_3355 ?auto_3380 ) ) ( not ( = ?auto_3356 ?auto_3380 ) ) ( not ( = ?auto_3363 ?auto_3368 ) ) ( IS-CRATE ?auto_3355 ) ( AVAILABLE ?auto_3367 ) ( SURFACE-AT ?auto_3355 ?auto_3372 ) ( ON ?auto_3355 ?auto_3375 ) ( CLEAR ?auto_3355 ) ( not ( = ?auto_3354 ?auto_3355 ) ) ( not ( = ?auto_3354 ?auto_3375 ) ) ( not ( = ?auto_3355 ?auto_3375 ) ) ( SURFACE-AT ?auto_3353 ?auto_3366 ) ( CLEAR ?auto_3353 ) ( IS-CRATE ?auto_3354 ) ( AVAILABLE ?auto_3363 ) ( AVAILABLE ?auto_3368 ) ( SURFACE-AT ?auto_3354 ?auto_3377 ) ( ON ?auto_3354 ?auto_3370 ) ( CLEAR ?auto_3354 ) ( TRUCK-AT ?auto_3362 ?auto_3366 ) ( not ( = ?auto_3353 ?auto_3354 ) ) ( not ( = ?auto_3353 ?auto_3370 ) ) ( not ( = ?auto_3354 ?auto_3370 ) ) ( not ( = ?auto_3353 ?auto_3355 ) ) ( not ( = ?auto_3353 ?auto_3375 ) ) ( not ( = ?auto_3355 ?auto_3370 ) ) ( not ( = ?auto_3372 ?auto_3377 ) ) ( not ( = ?auto_3367 ?auto_3368 ) ) ( not ( = ?auto_3375 ?auto_3370 ) ) ( not ( = ?auto_3353 ?auto_3356 ) ) ( not ( = ?auto_3353 ?auto_3380 ) ) ( not ( = ?auto_3354 ?auto_3356 ) ) ( not ( = ?auto_3354 ?auto_3380 ) ) ( not ( = ?auto_3356 ?auto_3375 ) ) ( not ( = ?auto_3356 ?auto_3370 ) ) ( not ( = ?auto_3380 ?auto_3375 ) ) ( not ( = ?auto_3380 ?auto_3370 ) ) ( not ( = ?auto_3353 ?auto_3357 ) ) ( not ( = ?auto_3353 ?auto_3373 ) ) ( not ( = ?auto_3354 ?auto_3357 ) ) ( not ( = ?auto_3354 ?auto_3373 ) ) ( not ( = ?auto_3355 ?auto_3357 ) ) ( not ( = ?auto_3355 ?auto_3373 ) ) ( not ( = ?auto_3357 ?auto_3380 ) ) ( not ( = ?auto_3357 ?auto_3375 ) ) ( not ( = ?auto_3357 ?auto_3370 ) ) ( not ( = ?auto_3373 ?auto_3380 ) ) ( not ( = ?auto_3373 ?auto_3375 ) ) ( not ( = ?auto_3373 ?auto_3370 ) ) ( not ( = ?auto_3353 ?auto_3358 ) ) ( not ( = ?auto_3353 ?auto_3376 ) ) ( not ( = ?auto_3354 ?auto_3358 ) ) ( not ( = ?auto_3354 ?auto_3376 ) ) ( not ( = ?auto_3355 ?auto_3358 ) ) ( not ( = ?auto_3355 ?auto_3376 ) ) ( not ( = ?auto_3356 ?auto_3358 ) ) ( not ( = ?auto_3356 ?auto_3376 ) ) ( not ( = ?auto_3358 ?auto_3373 ) ) ( not ( = ?auto_3358 ?auto_3380 ) ) ( not ( = ?auto_3358 ?auto_3375 ) ) ( not ( = ?auto_3358 ?auto_3370 ) ) ( not ( = ?auto_3378 ?auto_3372 ) ) ( not ( = ?auto_3378 ?auto_3377 ) ) ( not ( = ?auto_3369 ?auto_3367 ) ) ( not ( = ?auto_3369 ?auto_3368 ) ) ( not ( = ?auto_3376 ?auto_3373 ) ) ( not ( = ?auto_3376 ?auto_3380 ) ) ( not ( = ?auto_3376 ?auto_3375 ) ) ( not ( = ?auto_3376 ?auto_3370 ) ) ( not ( = ?auto_3353 ?auto_3359 ) ) ( not ( = ?auto_3353 ?auto_3379 ) ) ( not ( = ?auto_3354 ?auto_3359 ) ) ( not ( = ?auto_3354 ?auto_3379 ) ) ( not ( = ?auto_3355 ?auto_3359 ) ) ( not ( = ?auto_3355 ?auto_3379 ) ) ( not ( = ?auto_3356 ?auto_3359 ) ) ( not ( = ?auto_3356 ?auto_3379 ) ) ( not ( = ?auto_3357 ?auto_3359 ) ) ( not ( = ?auto_3357 ?auto_3379 ) ) ( not ( = ?auto_3359 ?auto_3376 ) ) ( not ( = ?auto_3359 ?auto_3373 ) ) ( not ( = ?auto_3359 ?auto_3380 ) ) ( not ( = ?auto_3359 ?auto_3375 ) ) ( not ( = ?auto_3359 ?auto_3370 ) ) ( not ( = ?auto_3374 ?auto_3378 ) ) ( not ( = ?auto_3374 ?auto_3372 ) ) ( not ( = ?auto_3374 ?auto_3377 ) ) ( not ( = ?auto_3371 ?auto_3369 ) ) ( not ( = ?auto_3371 ?auto_3367 ) ) ( not ( = ?auto_3371 ?auto_3368 ) ) ( not ( = ?auto_3379 ?auto_3376 ) ) ( not ( = ?auto_3379 ?auto_3373 ) ) ( not ( = ?auto_3379 ?auto_3380 ) ) ( not ( = ?auto_3379 ?auto_3375 ) ) ( not ( = ?auto_3379 ?auto_3370 ) ) ( not ( = ?auto_3353 ?auto_3360 ) ) ( not ( = ?auto_3353 ?auto_3361 ) ) ( not ( = ?auto_3354 ?auto_3360 ) ) ( not ( = ?auto_3354 ?auto_3361 ) ) ( not ( = ?auto_3355 ?auto_3360 ) ) ( not ( = ?auto_3355 ?auto_3361 ) ) ( not ( = ?auto_3356 ?auto_3360 ) ) ( not ( = ?auto_3356 ?auto_3361 ) ) ( not ( = ?auto_3357 ?auto_3360 ) ) ( not ( = ?auto_3357 ?auto_3361 ) ) ( not ( = ?auto_3358 ?auto_3360 ) ) ( not ( = ?auto_3358 ?auto_3361 ) ) ( not ( = ?auto_3360 ?auto_3379 ) ) ( not ( = ?auto_3360 ?auto_3376 ) ) ( not ( = ?auto_3360 ?auto_3373 ) ) ( not ( = ?auto_3360 ?auto_3380 ) ) ( not ( = ?auto_3360 ?auto_3375 ) ) ( not ( = ?auto_3360 ?auto_3370 ) ) ( not ( = ?auto_3365 ?auto_3374 ) ) ( not ( = ?auto_3365 ?auto_3378 ) ) ( not ( = ?auto_3365 ?auto_3372 ) ) ( not ( = ?auto_3365 ?auto_3377 ) ) ( not ( = ?auto_3364 ?auto_3371 ) ) ( not ( = ?auto_3364 ?auto_3369 ) ) ( not ( = ?auto_3364 ?auto_3367 ) ) ( not ( = ?auto_3364 ?auto_3368 ) ) ( not ( = ?auto_3361 ?auto_3379 ) ) ( not ( = ?auto_3361 ?auto_3376 ) ) ( not ( = ?auto_3361 ?auto_3373 ) ) ( not ( = ?auto_3361 ?auto_3380 ) ) ( not ( = ?auto_3361 ?auto_3375 ) ) ( not ( = ?auto_3361 ?auto_3370 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_3353 ?auto_3354 ?auto_3355 ?auto_3356 ?auto_3357 ?auto_3358 ?auto_3359 )
      ( MAKE-1CRATE ?auto_3359 ?auto_3360 )
      ( MAKE-7CRATE-VERIFY ?auto_3353 ?auto_3354 ?auto_3355 ?auto_3356 ?auto_3357 ?auto_3358 ?auto_3359 ?auto_3360 ) )
  )

)

