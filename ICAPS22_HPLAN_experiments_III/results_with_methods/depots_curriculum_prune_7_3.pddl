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
      ?auto_3174 - SURFACE
      ?auto_3175 - SURFACE
    )
    :vars
    (
      ?auto_3176 - HOIST
      ?auto_3177 - PLACE
      ?auto_3179 - PLACE
      ?auto_3180 - HOIST
      ?auto_3181 - SURFACE
      ?auto_3178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3176 ?auto_3177 ) ( SURFACE-AT ?auto_3174 ?auto_3177 ) ( CLEAR ?auto_3174 ) ( IS-CRATE ?auto_3175 ) ( AVAILABLE ?auto_3176 ) ( not ( = ?auto_3179 ?auto_3177 ) ) ( HOIST-AT ?auto_3180 ?auto_3179 ) ( AVAILABLE ?auto_3180 ) ( SURFACE-AT ?auto_3175 ?auto_3179 ) ( ON ?auto_3175 ?auto_3181 ) ( CLEAR ?auto_3175 ) ( TRUCK-AT ?auto_3178 ?auto_3177 ) ( not ( = ?auto_3174 ?auto_3175 ) ) ( not ( = ?auto_3174 ?auto_3181 ) ) ( not ( = ?auto_3175 ?auto_3181 ) ) ( not ( = ?auto_3176 ?auto_3180 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3178 ?auto_3177 ?auto_3179 )
      ( !LIFT ?auto_3180 ?auto_3175 ?auto_3181 ?auto_3179 )
      ( !LOAD ?auto_3180 ?auto_3175 ?auto_3178 ?auto_3179 )
      ( !DRIVE ?auto_3178 ?auto_3179 ?auto_3177 )
      ( !UNLOAD ?auto_3176 ?auto_3175 ?auto_3178 ?auto_3177 )
      ( !DROP ?auto_3176 ?auto_3175 ?auto_3174 ?auto_3177 )
      ( MAKE-1CRATE-VERIFY ?auto_3174 ?auto_3175 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3195 - SURFACE
      ?auto_3196 - SURFACE
      ?auto_3197 - SURFACE
    )
    :vars
    (
      ?auto_3198 - HOIST
      ?auto_3199 - PLACE
      ?auto_3200 - PLACE
      ?auto_3201 - HOIST
      ?auto_3203 - SURFACE
      ?auto_3206 - PLACE
      ?auto_3204 - HOIST
      ?auto_3205 - SURFACE
      ?auto_3202 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3198 ?auto_3199 ) ( IS-CRATE ?auto_3197 ) ( not ( = ?auto_3200 ?auto_3199 ) ) ( HOIST-AT ?auto_3201 ?auto_3200 ) ( AVAILABLE ?auto_3201 ) ( SURFACE-AT ?auto_3197 ?auto_3200 ) ( ON ?auto_3197 ?auto_3203 ) ( CLEAR ?auto_3197 ) ( not ( = ?auto_3196 ?auto_3197 ) ) ( not ( = ?auto_3196 ?auto_3203 ) ) ( not ( = ?auto_3197 ?auto_3203 ) ) ( not ( = ?auto_3198 ?auto_3201 ) ) ( SURFACE-AT ?auto_3195 ?auto_3199 ) ( CLEAR ?auto_3195 ) ( IS-CRATE ?auto_3196 ) ( AVAILABLE ?auto_3198 ) ( not ( = ?auto_3206 ?auto_3199 ) ) ( HOIST-AT ?auto_3204 ?auto_3206 ) ( AVAILABLE ?auto_3204 ) ( SURFACE-AT ?auto_3196 ?auto_3206 ) ( ON ?auto_3196 ?auto_3205 ) ( CLEAR ?auto_3196 ) ( TRUCK-AT ?auto_3202 ?auto_3199 ) ( not ( = ?auto_3195 ?auto_3196 ) ) ( not ( = ?auto_3195 ?auto_3205 ) ) ( not ( = ?auto_3196 ?auto_3205 ) ) ( not ( = ?auto_3198 ?auto_3204 ) ) ( not ( = ?auto_3195 ?auto_3197 ) ) ( not ( = ?auto_3195 ?auto_3203 ) ) ( not ( = ?auto_3197 ?auto_3205 ) ) ( not ( = ?auto_3200 ?auto_3206 ) ) ( not ( = ?auto_3201 ?auto_3204 ) ) ( not ( = ?auto_3203 ?auto_3205 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3195 ?auto_3196 )
      ( MAKE-1CRATE ?auto_3196 ?auto_3197 )
      ( MAKE-2CRATE-VERIFY ?auto_3195 ?auto_3196 ?auto_3197 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3221 - SURFACE
      ?auto_3222 - SURFACE
      ?auto_3223 - SURFACE
      ?auto_3224 - SURFACE
    )
    :vars
    (
      ?auto_3228 - HOIST
      ?auto_3230 - PLACE
      ?auto_3225 - PLACE
      ?auto_3229 - HOIST
      ?auto_3227 - SURFACE
      ?auto_3236 - PLACE
      ?auto_3231 - HOIST
      ?auto_3234 - SURFACE
      ?auto_3235 - PLACE
      ?auto_3233 - HOIST
      ?auto_3232 - SURFACE
      ?auto_3226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3228 ?auto_3230 ) ( IS-CRATE ?auto_3224 ) ( not ( = ?auto_3225 ?auto_3230 ) ) ( HOIST-AT ?auto_3229 ?auto_3225 ) ( AVAILABLE ?auto_3229 ) ( SURFACE-AT ?auto_3224 ?auto_3225 ) ( ON ?auto_3224 ?auto_3227 ) ( CLEAR ?auto_3224 ) ( not ( = ?auto_3223 ?auto_3224 ) ) ( not ( = ?auto_3223 ?auto_3227 ) ) ( not ( = ?auto_3224 ?auto_3227 ) ) ( not ( = ?auto_3228 ?auto_3229 ) ) ( IS-CRATE ?auto_3223 ) ( not ( = ?auto_3236 ?auto_3230 ) ) ( HOIST-AT ?auto_3231 ?auto_3236 ) ( AVAILABLE ?auto_3231 ) ( SURFACE-AT ?auto_3223 ?auto_3236 ) ( ON ?auto_3223 ?auto_3234 ) ( CLEAR ?auto_3223 ) ( not ( = ?auto_3222 ?auto_3223 ) ) ( not ( = ?auto_3222 ?auto_3234 ) ) ( not ( = ?auto_3223 ?auto_3234 ) ) ( not ( = ?auto_3228 ?auto_3231 ) ) ( SURFACE-AT ?auto_3221 ?auto_3230 ) ( CLEAR ?auto_3221 ) ( IS-CRATE ?auto_3222 ) ( AVAILABLE ?auto_3228 ) ( not ( = ?auto_3235 ?auto_3230 ) ) ( HOIST-AT ?auto_3233 ?auto_3235 ) ( AVAILABLE ?auto_3233 ) ( SURFACE-AT ?auto_3222 ?auto_3235 ) ( ON ?auto_3222 ?auto_3232 ) ( CLEAR ?auto_3222 ) ( TRUCK-AT ?auto_3226 ?auto_3230 ) ( not ( = ?auto_3221 ?auto_3222 ) ) ( not ( = ?auto_3221 ?auto_3232 ) ) ( not ( = ?auto_3222 ?auto_3232 ) ) ( not ( = ?auto_3228 ?auto_3233 ) ) ( not ( = ?auto_3221 ?auto_3223 ) ) ( not ( = ?auto_3221 ?auto_3234 ) ) ( not ( = ?auto_3223 ?auto_3232 ) ) ( not ( = ?auto_3236 ?auto_3235 ) ) ( not ( = ?auto_3231 ?auto_3233 ) ) ( not ( = ?auto_3234 ?auto_3232 ) ) ( not ( = ?auto_3221 ?auto_3224 ) ) ( not ( = ?auto_3221 ?auto_3227 ) ) ( not ( = ?auto_3222 ?auto_3224 ) ) ( not ( = ?auto_3222 ?auto_3227 ) ) ( not ( = ?auto_3224 ?auto_3234 ) ) ( not ( = ?auto_3224 ?auto_3232 ) ) ( not ( = ?auto_3225 ?auto_3236 ) ) ( not ( = ?auto_3225 ?auto_3235 ) ) ( not ( = ?auto_3229 ?auto_3231 ) ) ( not ( = ?auto_3229 ?auto_3233 ) ) ( not ( = ?auto_3227 ?auto_3234 ) ) ( not ( = ?auto_3227 ?auto_3232 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3221 ?auto_3222 ?auto_3223 )
      ( MAKE-1CRATE ?auto_3223 ?auto_3224 )
      ( MAKE-3CRATE-VERIFY ?auto_3221 ?auto_3222 ?auto_3223 ?auto_3224 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_3252 - SURFACE
      ?auto_3253 - SURFACE
      ?auto_3254 - SURFACE
      ?auto_3255 - SURFACE
      ?auto_3256 - SURFACE
    )
    :vars
    (
      ?auto_3260 - HOIST
      ?auto_3258 - PLACE
      ?auto_3259 - PLACE
      ?auto_3262 - HOIST
      ?auto_3257 - SURFACE
      ?auto_3265 - PLACE
      ?auto_3268 - HOIST
      ?auto_3269 - SURFACE
      ?auto_3266 - PLACE
      ?auto_3263 - HOIST
      ?auto_3267 - SURFACE
      ?auto_3264 - SURFACE
      ?auto_3261 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3260 ?auto_3258 ) ( IS-CRATE ?auto_3256 ) ( not ( = ?auto_3259 ?auto_3258 ) ) ( HOIST-AT ?auto_3262 ?auto_3259 ) ( SURFACE-AT ?auto_3256 ?auto_3259 ) ( ON ?auto_3256 ?auto_3257 ) ( CLEAR ?auto_3256 ) ( not ( = ?auto_3255 ?auto_3256 ) ) ( not ( = ?auto_3255 ?auto_3257 ) ) ( not ( = ?auto_3256 ?auto_3257 ) ) ( not ( = ?auto_3260 ?auto_3262 ) ) ( IS-CRATE ?auto_3255 ) ( not ( = ?auto_3265 ?auto_3258 ) ) ( HOIST-AT ?auto_3268 ?auto_3265 ) ( AVAILABLE ?auto_3268 ) ( SURFACE-AT ?auto_3255 ?auto_3265 ) ( ON ?auto_3255 ?auto_3269 ) ( CLEAR ?auto_3255 ) ( not ( = ?auto_3254 ?auto_3255 ) ) ( not ( = ?auto_3254 ?auto_3269 ) ) ( not ( = ?auto_3255 ?auto_3269 ) ) ( not ( = ?auto_3260 ?auto_3268 ) ) ( IS-CRATE ?auto_3254 ) ( not ( = ?auto_3266 ?auto_3258 ) ) ( HOIST-AT ?auto_3263 ?auto_3266 ) ( AVAILABLE ?auto_3263 ) ( SURFACE-AT ?auto_3254 ?auto_3266 ) ( ON ?auto_3254 ?auto_3267 ) ( CLEAR ?auto_3254 ) ( not ( = ?auto_3253 ?auto_3254 ) ) ( not ( = ?auto_3253 ?auto_3267 ) ) ( not ( = ?auto_3254 ?auto_3267 ) ) ( not ( = ?auto_3260 ?auto_3263 ) ) ( SURFACE-AT ?auto_3252 ?auto_3258 ) ( CLEAR ?auto_3252 ) ( IS-CRATE ?auto_3253 ) ( AVAILABLE ?auto_3260 ) ( AVAILABLE ?auto_3262 ) ( SURFACE-AT ?auto_3253 ?auto_3259 ) ( ON ?auto_3253 ?auto_3264 ) ( CLEAR ?auto_3253 ) ( TRUCK-AT ?auto_3261 ?auto_3258 ) ( not ( = ?auto_3252 ?auto_3253 ) ) ( not ( = ?auto_3252 ?auto_3264 ) ) ( not ( = ?auto_3253 ?auto_3264 ) ) ( not ( = ?auto_3252 ?auto_3254 ) ) ( not ( = ?auto_3252 ?auto_3267 ) ) ( not ( = ?auto_3254 ?auto_3264 ) ) ( not ( = ?auto_3266 ?auto_3259 ) ) ( not ( = ?auto_3263 ?auto_3262 ) ) ( not ( = ?auto_3267 ?auto_3264 ) ) ( not ( = ?auto_3252 ?auto_3255 ) ) ( not ( = ?auto_3252 ?auto_3269 ) ) ( not ( = ?auto_3253 ?auto_3255 ) ) ( not ( = ?auto_3253 ?auto_3269 ) ) ( not ( = ?auto_3255 ?auto_3267 ) ) ( not ( = ?auto_3255 ?auto_3264 ) ) ( not ( = ?auto_3265 ?auto_3266 ) ) ( not ( = ?auto_3265 ?auto_3259 ) ) ( not ( = ?auto_3268 ?auto_3263 ) ) ( not ( = ?auto_3268 ?auto_3262 ) ) ( not ( = ?auto_3269 ?auto_3267 ) ) ( not ( = ?auto_3269 ?auto_3264 ) ) ( not ( = ?auto_3252 ?auto_3256 ) ) ( not ( = ?auto_3252 ?auto_3257 ) ) ( not ( = ?auto_3253 ?auto_3256 ) ) ( not ( = ?auto_3253 ?auto_3257 ) ) ( not ( = ?auto_3254 ?auto_3256 ) ) ( not ( = ?auto_3254 ?auto_3257 ) ) ( not ( = ?auto_3256 ?auto_3269 ) ) ( not ( = ?auto_3256 ?auto_3267 ) ) ( not ( = ?auto_3256 ?auto_3264 ) ) ( not ( = ?auto_3257 ?auto_3269 ) ) ( not ( = ?auto_3257 ?auto_3267 ) ) ( not ( = ?auto_3257 ?auto_3264 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3252 ?auto_3253 ?auto_3254 ?auto_3255 )
      ( MAKE-1CRATE ?auto_3255 ?auto_3256 )
      ( MAKE-4CRATE-VERIFY ?auto_3252 ?auto_3253 ?auto_3254 ?auto_3255 ?auto_3256 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_3286 - SURFACE
      ?auto_3287 - SURFACE
      ?auto_3288 - SURFACE
      ?auto_3289 - SURFACE
      ?auto_3290 - SURFACE
      ?auto_3291 - SURFACE
    )
    :vars
    (
      ?auto_3292 - HOIST
      ?auto_3293 - PLACE
      ?auto_3297 - PLACE
      ?auto_3296 - HOIST
      ?auto_3295 - SURFACE
      ?auto_3300 - PLACE
      ?auto_3305 - HOIST
      ?auto_3299 - SURFACE
      ?auto_3302 - PLACE
      ?auto_3307 - HOIST
      ?auto_3301 - SURFACE
      ?auto_3306 - PLACE
      ?auto_3304 - HOIST
      ?auto_3298 - SURFACE
      ?auto_3303 - SURFACE
      ?auto_3294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3292 ?auto_3293 ) ( IS-CRATE ?auto_3291 ) ( not ( = ?auto_3297 ?auto_3293 ) ) ( HOIST-AT ?auto_3296 ?auto_3297 ) ( AVAILABLE ?auto_3296 ) ( SURFACE-AT ?auto_3291 ?auto_3297 ) ( ON ?auto_3291 ?auto_3295 ) ( CLEAR ?auto_3291 ) ( not ( = ?auto_3290 ?auto_3291 ) ) ( not ( = ?auto_3290 ?auto_3295 ) ) ( not ( = ?auto_3291 ?auto_3295 ) ) ( not ( = ?auto_3292 ?auto_3296 ) ) ( IS-CRATE ?auto_3290 ) ( not ( = ?auto_3300 ?auto_3293 ) ) ( HOIST-AT ?auto_3305 ?auto_3300 ) ( SURFACE-AT ?auto_3290 ?auto_3300 ) ( ON ?auto_3290 ?auto_3299 ) ( CLEAR ?auto_3290 ) ( not ( = ?auto_3289 ?auto_3290 ) ) ( not ( = ?auto_3289 ?auto_3299 ) ) ( not ( = ?auto_3290 ?auto_3299 ) ) ( not ( = ?auto_3292 ?auto_3305 ) ) ( IS-CRATE ?auto_3289 ) ( not ( = ?auto_3302 ?auto_3293 ) ) ( HOIST-AT ?auto_3307 ?auto_3302 ) ( AVAILABLE ?auto_3307 ) ( SURFACE-AT ?auto_3289 ?auto_3302 ) ( ON ?auto_3289 ?auto_3301 ) ( CLEAR ?auto_3289 ) ( not ( = ?auto_3288 ?auto_3289 ) ) ( not ( = ?auto_3288 ?auto_3301 ) ) ( not ( = ?auto_3289 ?auto_3301 ) ) ( not ( = ?auto_3292 ?auto_3307 ) ) ( IS-CRATE ?auto_3288 ) ( not ( = ?auto_3306 ?auto_3293 ) ) ( HOIST-AT ?auto_3304 ?auto_3306 ) ( AVAILABLE ?auto_3304 ) ( SURFACE-AT ?auto_3288 ?auto_3306 ) ( ON ?auto_3288 ?auto_3298 ) ( CLEAR ?auto_3288 ) ( not ( = ?auto_3287 ?auto_3288 ) ) ( not ( = ?auto_3287 ?auto_3298 ) ) ( not ( = ?auto_3288 ?auto_3298 ) ) ( not ( = ?auto_3292 ?auto_3304 ) ) ( SURFACE-AT ?auto_3286 ?auto_3293 ) ( CLEAR ?auto_3286 ) ( IS-CRATE ?auto_3287 ) ( AVAILABLE ?auto_3292 ) ( AVAILABLE ?auto_3305 ) ( SURFACE-AT ?auto_3287 ?auto_3300 ) ( ON ?auto_3287 ?auto_3303 ) ( CLEAR ?auto_3287 ) ( TRUCK-AT ?auto_3294 ?auto_3293 ) ( not ( = ?auto_3286 ?auto_3287 ) ) ( not ( = ?auto_3286 ?auto_3303 ) ) ( not ( = ?auto_3287 ?auto_3303 ) ) ( not ( = ?auto_3286 ?auto_3288 ) ) ( not ( = ?auto_3286 ?auto_3298 ) ) ( not ( = ?auto_3288 ?auto_3303 ) ) ( not ( = ?auto_3306 ?auto_3300 ) ) ( not ( = ?auto_3304 ?auto_3305 ) ) ( not ( = ?auto_3298 ?auto_3303 ) ) ( not ( = ?auto_3286 ?auto_3289 ) ) ( not ( = ?auto_3286 ?auto_3301 ) ) ( not ( = ?auto_3287 ?auto_3289 ) ) ( not ( = ?auto_3287 ?auto_3301 ) ) ( not ( = ?auto_3289 ?auto_3298 ) ) ( not ( = ?auto_3289 ?auto_3303 ) ) ( not ( = ?auto_3302 ?auto_3306 ) ) ( not ( = ?auto_3302 ?auto_3300 ) ) ( not ( = ?auto_3307 ?auto_3304 ) ) ( not ( = ?auto_3307 ?auto_3305 ) ) ( not ( = ?auto_3301 ?auto_3298 ) ) ( not ( = ?auto_3301 ?auto_3303 ) ) ( not ( = ?auto_3286 ?auto_3290 ) ) ( not ( = ?auto_3286 ?auto_3299 ) ) ( not ( = ?auto_3287 ?auto_3290 ) ) ( not ( = ?auto_3287 ?auto_3299 ) ) ( not ( = ?auto_3288 ?auto_3290 ) ) ( not ( = ?auto_3288 ?auto_3299 ) ) ( not ( = ?auto_3290 ?auto_3301 ) ) ( not ( = ?auto_3290 ?auto_3298 ) ) ( not ( = ?auto_3290 ?auto_3303 ) ) ( not ( = ?auto_3299 ?auto_3301 ) ) ( not ( = ?auto_3299 ?auto_3298 ) ) ( not ( = ?auto_3299 ?auto_3303 ) ) ( not ( = ?auto_3286 ?auto_3291 ) ) ( not ( = ?auto_3286 ?auto_3295 ) ) ( not ( = ?auto_3287 ?auto_3291 ) ) ( not ( = ?auto_3287 ?auto_3295 ) ) ( not ( = ?auto_3288 ?auto_3291 ) ) ( not ( = ?auto_3288 ?auto_3295 ) ) ( not ( = ?auto_3289 ?auto_3291 ) ) ( not ( = ?auto_3289 ?auto_3295 ) ) ( not ( = ?auto_3291 ?auto_3299 ) ) ( not ( = ?auto_3291 ?auto_3301 ) ) ( not ( = ?auto_3291 ?auto_3298 ) ) ( not ( = ?auto_3291 ?auto_3303 ) ) ( not ( = ?auto_3297 ?auto_3300 ) ) ( not ( = ?auto_3297 ?auto_3302 ) ) ( not ( = ?auto_3297 ?auto_3306 ) ) ( not ( = ?auto_3296 ?auto_3305 ) ) ( not ( = ?auto_3296 ?auto_3307 ) ) ( not ( = ?auto_3296 ?auto_3304 ) ) ( not ( = ?auto_3295 ?auto_3299 ) ) ( not ( = ?auto_3295 ?auto_3301 ) ) ( not ( = ?auto_3295 ?auto_3298 ) ) ( not ( = ?auto_3295 ?auto_3303 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_3286 ?auto_3287 ?auto_3288 ?auto_3289 ?auto_3290 )
      ( MAKE-1CRATE ?auto_3290 ?auto_3291 )
      ( MAKE-5CRATE-VERIFY ?auto_3286 ?auto_3287 ?auto_3288 ?auto_3289 ?auto_3290 ?auto_3291 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_3325 - SURFACE
      ?auto_3326 - SURFACE
      ?auto_3327 - SURFACE
      ?auto_3328 - SURFACE
      ?auto_3329 - SURFACE
      ?auto_3330 - SURFACE
      ?auto_3331 - SURFACE
    )
    :vars
    (
      ?auto_3332 - HOIST
      ?auto_3336 - PLACE
      ?auto_3337 - PLACE
      ?auto_3335 - HOIST
      ?auto_3333 - SURFACE
      ?auto_3348 - PLACE
      ?auto_3342 - HOIST
      ?auto_3341 - SURFACE
      ?auto_3339 - PLACE
      ?auto_3340 - HOIST
      ?auto_3349 - SURFACE
      ?auto_3345 - PLACE
      ?auto_3343 - HOIST
      ?auto_3350 - SURFACE
      ?auto_3347 - PLACE
      ?auto_3338 - HOIST
      ?auto_3344 - SURFACE
      ?auto_3346 - SURFACE
      ?auto_3334 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3332 ?auto_3336 ) ( IS-CRATE ?auto_3331 ) ( not ( = ?auto_3337 ?auto_3336 ) ) ( HOIST-AT ?auto_3335 ?auto_3337 ) ( AVAILABLE ?auto_3335 ) ( SURFACE-AT ?auto_3331 ?auto_3337 ) ( ON ?auto_3331 ?auto_3333 ) ( CLEAR ?auto_3331 ) ( not ( = ?auto_3330 ?auto_3331 ) ) ( not ( = ?auto_3330 ?auto_3333 ) ) ( not ( = ?auto_3331 ?auto_3333 ) ) ( not ( = ?auto_3332 ?auto_3335 ) ) ( IS-CRATE ?auto_3330 ) ( not ( = ?auto_3348 ?auto_3336 ) ) ( HOIST-AT ?auto_3342 ?auto_3348 ) ( AVAILABLE ?auto_3342 ) ( SURFACE-AT ?auto_3330 ?auto_3348 ) ( ON ?auto_3330 ?auto_3341 ) ( CLEAR ?auto_3330 ) ( not ( = ?auto_3329 ?auto_3330 ) ) ( not ( = ?auto_3329 ?auto_3341 ) ) ( not ( = ?auto_3330 ?auto_3341 ) ) ( not ( = ?auto_3332 ?auto_3342 ) ) ( IS-CRATE ?auto_3329 ) ( not ( = ?auto_3339 ?auto_3336 ) ) ( HOIST-AT ?auto_3340 ?auto_3339 ) ( SURFACE-AT ?auto_3329 ?auto_3339 ) ( ON ?auto_3329 ?auto_3349 ) ( CLEAR ?auto_3329 ) ( not ( = ?auto_3328 ?auto_3329 ) ) ( not ( = ?auto_3328 ?auto_3349 ) ) ( not ( = ?auto_3329 ?auto_3349 ) ) ( not ( = ?auto_3332 ?auto_3340 ) ) ( IS-CRATE ?auto_3328 ) ( not ( = ?auto_3345 ?auto_3336 ) ) ( HOIST-AT ?auto_3343 ?auto_3345 ) ( AVAILABLE ?auto_3343 ) ( SURFACE-AT ?auto_3328 ?auto_3345 ) ( ON ?auto_3328 ?auto_3350 ) ( CLEAR ?auto_3328 ) ( not ( = ?auto_3327 ?auto_3328 ) ) ( not ( = ?auto_3327 ?auto_3350 ) ) ( not ( = ?auto_3328 ?auto_3350 ) ) ( not ( = ?auto_3332 ?auto_3343 ) ) ( IS-CRATE ?auto_3327 ) ( not ( = ?auto_3347 ?auto_3336 ) ) ( HOIST-AT ?auto_3338 ?auto_3347 ) ( AVAILABLE ?auto_3338 ) ( SURFACE-AT ?auto_3327 ?auto_3347 ) ( ON ?auto_3327 ?auto_3344 ) ( CLEAR ?auto_3327 ) ( not ( = ?auto_3326 ?auto_3327 ) ) ( not ( = ?auto_3326 ?auto_3344 ) ) ( not ( = ?auto_3327 ?auto_3344 ) ) ( not ( = ?auto_3332 ?auto_3338 ) ) ( SURFACE-AT ?auto_3325 ?auto_3336 ) ( CLEAR ?auto_3325 ) ( IS-CRATE ?auto_3326 ) ( AVAILABLE ?auto_3332 ) ( AVAILABLE ?auto_3340 ) ( SURFACE-AT ?auto_3326 ?auto_3339 ) ( ON ?auto_3326 ?auto_3346 ) ( CLEAR ?auto_3326 ) ( TRUCK-AT ?auto_3334 ?auto_3336 ) ( not ( = ?auto_3325 ?auto_3326 ) ) ( not ( = ?auto_3325 ?auto_3346 ) ) ( not ( = ?auto_3326 ?auto_3346 ) ) ( not ( = ?auto_3325 ?auto_3327 ) ) ( not ( = ?auto_3325 ?auto_3344 ) ) ( not ( = ?auto_3327 ?auto_3346 ) ) ( not ( = ?auto_3347 ?auto_3339 ) ) ( not ( = ?auto_3338 ?auto_3340 ) ) ( not ( = ?auto_3344 ?auto_3346 ) ) ( not ( = ?auto_3325 ?auto_3328 ) ) ( not ( = ?auto_3325 ?auto_3350 ) ) ( not ( = ?auto_3326 ?auto_3328 ) ) ( not ( = ?auto_3326 ?auto_3350 ) ) ( not ( = ?auto_3328 ?auto_3344 ) ) ( not ( = ?auto_3328 ?auto_3346 ) ) ( not ( = ?auto_3345 ?auto_3347 ) ) ( not ( = ?auto_3345 ?auto_3339 ) ) ( not ( = ?auto_3343 ?auto_3338 ) ) ( not ( = ?auto_3343 ?auto_3340 ) ) ( not ( = ?auto_3350 ?auto_3344 ) ) ( not ( = ?auto_3350 ?auto_3346 ) ) ( not ( = ?auto_3325 ?auto_3329 ) ) ( not ( = ?auto_3325 ?auto_3349 ) ) ( not ( = ?auto_3326 ?auto_3329 ) ) ( not ( = ?auto_3326 ?auto_3349 ) ) ( not ( = ?auto_3327 ?auto_3329 ) ) ( not ( = ?auto_3327 ?auto_3349 ) ) ( not ( = ?auto_3329 ?auto_3350 ) ) ( not ( = ?auto_3329 ?auto_3344 ) ) ( not ( = ?auto_3329 ?auto_3346 ) ) ( not ( = ?auto_3349 ?auto_3350 ) ) ( not ( = ?auto_3349 ?auto_3344 ) ) ( not ( = ?auto_3349 ?auto_3346 ) ) ( not ( = ?auto_3325 ?auto_3330 ) ) ( not ( = ?auto_3325 ?auto_3341 ) ) ( not ( = ?auto_3326 ?auto_3330 ) ) ( not ( = ?auto_3326 ?auto_3341 ) ) ( not ( = ?auto_3327 ?auto_3330 ) ) ( not ( = ?auto_3327 ?auto_3341 ) ) ( not ( = ?auto_3328 ?auto_3330 ) ) ( not ( = ?auto_3328 ?auto_3341 ) ) ( not ( = ?auto_3330 ?auto_3349 ) ) ( not ( = ?auto_3330 ?auto_3350 ) ) ( not ( = ?auto_3330 ?auto_3344 ) ) ( not ( = ?auto_3330 ?auto_3346 ) ) ( not ( = ?auto_3348 ?auto_3339 ) ) ( not ( = ?auto_3348 ?auto_3345 ) ) ( not ( = ?auto_3348 ?auto_3347 ) ) ( not ( = ?auto_3342 ?auto_3340 ) ) ( not ( = ?auto_3342 ?auto_3343 ) ) ( not ( = ?auto_3342 ?auto_3338 ) ) ( not ( = ?auto_3341 ?auto_3349 ) ) ( not ( = ?auto_3341 ?auto_3350 ) ) ( not ( = ?auto_3341 ?auto_3344 ) ) ( not ( = ?auto_3341 ?auto_3346 ) ) ( not ( = ?auto_3325 ?auto_3331 ) ) ( not ( = ?auto_3325 ?auto_3333 ) ) ( not ( = ?auto_3326 ?auto_3331 ) ) ( not ( = ?auto_3326 ?auto_3333 ) ) ( not ( = ?auto_3327 ?auto_3331 ) ) ( not ( = ?auto_3327 ?auto_3333 ) ) ( not ( = ?auto_3328 ?auto_3331 ) ) ( not ( = ?auto_3328 ?auto_3333 ) ) ( not ( = ?auto_3329 ?auto_3331 ) ) ( not ( = ?auto_3329 ?auto_3333 ) ) ( not ( = ?auto_3331 ?auto_3341 ) ) ( not ( = ?auto_3331 ?auto_3349 ) ) ( not ( = ?auto_3331 ?auto_3350 ) ) ( not ( = ?auto_3331 ?auto_3344 ) ) ( not ( = ?auto_3331 ?auto_3346 ) ) ( not ( = ?auto_3337 ?auto_3348 ) ) ( not ( = ?auto_3337 ?auto_3339 ) ) ( not ( = ?auto_3337 ?auto_3345 ) ) ( not ( = ?auto_3337 ?auto_3347 ) ) ( not ( = ?auto_3335 ?auto_3342 ) ) ( not ( = ?auto_3335 ?auto_3340 ) ) ( not ( = ?auto_3335 ?auto_3343 ) ) ( not ( = ?auto_3335 ?auto_3338 ) ) ( not ( = ?auto_3333 ?auto_3341 ) ) ( not ( = ?auto_3333 ?auto_3349 ) ) ( not ( = ?auto_3333 ?auto_3350 ) ) ( not ( = ?auto_3333 ?auto_3344 ) ) ( not ( = ?auto_3333 ?auto_3346 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_3325 ?auto_3326 ?auto_3327 ?auto_3328 ?auto_3329 ?auto_3330 )
      ( MAKE-1CRATE ?auto_3330 ?auto_3331 )
      ( MAKE-6CRATE-VERIFY ?auto_3325 ?auto_3326 ?auto_3327 ?auto_3328 ?auto_3329 ?auto_3330 ?auto_3331 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_3369 - SURFACE
      ?auto_3370 - SURFACE
      ?auto_3371 - SURFACE
      ?auto_3372 - SURFACE
      ?auto_3373 - SURFACE
      ?auto_3374 - SURFACE
      ?auto_3375 - SURFACE
      ?auto_3376 - SURFACE
    )
    :vars
    (
      ?auto_3380 - HOIST
      ?auto_3381 - PLACE
      ?auto_3379 - PLACE
      ?auto_3378 - HOIST
      ?auto_3377 - SURFACE
      ?auto_3391 - PLACE
      ?auto_3387 - HOIST
      ?auto_3398 - SURFACE
      ?auto_3390 - PLACE
      ?auto_3386 - HOIST
      ?auto_3396 - SURFACE
      ?auto_3393 - PLACE
      ?auto_3385 - HOIST
      ?auto_3397 - SURFACE
      ?auto_3383 - PLACE
      ?auto_3392 - HOIST
      ?auto_3388 - SURFACE
      ?auto_3389 - PLACE
      ?auto_3395 - HOIST
      ?auto_3394 - SURFACE
      ?auto_3384 - SURFACE
      ?auto_3382 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3380 ?auto_3381 ) ( IS-CRATE ?auto_3376 ) ( not ( = ?auto_3379 ?auto_3381 ) ) ( HOIST-AT ?auto_3378 ?auto_3379 ) ( AVAILABLE ?auto_3378 ) ( SURFACE-AT ?auto_3376 ?auto_3379 ) ( ON ?auto_3376 ?auto_3377 ) ( CLEAR ?auto_3376 ) ( not ( = ?auto_3375 ?auto_3376 ) ) ( not ( = ?auto_3375 ?auto_3377 ) ) ( not ( = ?auto_3376 ?auto_3377 ) ) ( not ( = ?auto_3380 ?auto_3378 ) ) ( IS-CRATE ?auto_3375 ) ( not ( = ?auto_3391 ?auto_3381 ) ) ( HOIST-AT ?auto_3387 ?auto_3391 ) ( AVAILABLE ?auto_3387 ) ( SURFACE-AT ?auto_3375 ?auto_3391 ) ( ON ?auto_3375 ?auto_3398 ) ( CLEAR ?auto_3375 ) ( not ( = ?auto_3374 ?auto_3375 ) ) ( not ( = ?auto_3374 ?auto_3398 ) ) ( not ( = ?auto_3375 ?auto_3398 ) ) ( not ( = ?auto_3380 ?auto_3387 ) ) ( IS-CRATE ?auto_3374 ) ( not ( = ?auto_3390 ?auto_3381 ) ) ( HOIST-AT ?auto_3386 ?auto_3390 ) ( AVAILABLE ?auto_3386 ) ( SURFACE-AT ?auto_3374 ?auto_3390 ) ( ON ?auto_3374 ?auto_3396 ) ( CLEAR ?auto_3374 ) ( not ( = ?auto_3373 ?auto_3374 ) ) ( not ( = ?auto_3373 ?auto_3396 ) ) ( not ( = ?auto_3374 ?auto_3396 ) ) ( not ( = ?auto_3380 ?auto_3386 ) ) ( IS-CRATE ?auto_3373 ) ( not ( = ?auto_3393 ?auto_3381 ) ) ( HOIST-AT ?auto_3385 ?auto_3393 ) ( SURFACE-AT ?auto_3373 ?auto_3393 ) ( ON ?auto_3373 ?auto_3397 ) ( CLEAR ?auto_3373 ) ( not ( = ?auto_3372 ?auto_3373 ) ) ( not ( = ?auto_3372 ?auto_3397 ) ) ( not ( = ?auto_3373 ?auto_3397 ) ) ( not ( = ?auto_3380 ?auto_3385 ) ) ( IS-CRATE ?auto_3372 ) ( not ( = ?auto_3383 ?auto_3381 ) ) ( HOIST-AT ?auto_3392 ?auto_3383 ) ( AVAILABLE ?auto_3392 ) ( SURFACE-AT ?auto_3372 ?auto_3383 ) ( ON ?auto_3372 ?auto_3388 ) ( CLEAR ?auto_3372 ) ( not ( = ?auto_3371 ?auto_3372 ) ) ( not ( = ?auto_3371 ?auto_3388 ) ) ( not ( = ?auto_3372 ?auto_3388 ) ) ( not ( = ?auto_3380 ?auto_3392 ) ) ( IS-CRATE ?auto_3371 ) ( not ( = ?auto_3389 ?auto_3381 ) ) ( HOIST-AT ?auto_3395 ?auto_3389 ) ( AVAILABLE ?auto_3395 ) ( SURFACE-AT ?auto_3371 ?auto_3389 ) ( ON ?auto_3371 ?auto_3394 ) ( CLEAR ?auto_3371 ) ( not ( = ?auto_3370 ?auto_3371 ) ) ( not ( = ?auto_3370 ?auto_3394 ) ) ( not ( = ?auto_3371 ?auto_3394 ) ) ( not ( = ?auto_3380 ?auto_3395 ) ) ( SURFACE-AT ?auto_3369 ?auto_3381 ) ( CLEAR ?auto_3369 ) ( IS-CRATE ?auto_3370 ) ( AVAILABLE ?auto_3380 ) ( AVAILABLE ?auto_3385 ) ( SURFACE-AT ?auto_3370 ?auto_3393 ) ( ON ?auto_3370 ?auto_3384 ) ( CLEAR ?auto_3370 ) ( TRUCK-AT ?auto_3382 ?auto_3381 ) ( not ( = ?auto_3369 ?auto_3370 ) ) ( not ( = ?auto_3369 ?auto_3384 ) ) ( not ( = ?auto_3370 ?auto_3384 ) ) ( not ( = ?auto_3369 ?auto_3371 ) ) ( not ( = ?auto_3369 ?auto_3394 ) ) ( not ( = ?auto_3371 ?auto_3384 ) ) ( not ( = ?auto_3389 ?auto_3393 ) ) ( not ( = ?auto_3395 ?auto_3385 ) ) ( not ( = ?auto_3394 ?auto_3384 ) ) ( not ( = ?auto_3369 ?auto_3372 ) ) ( not ( = ?auto_3369 ?auto_3388 ) ) ( not ( = ?auto_3370 ?auto_3372 ) ) ( not ( = ?auto_3370 ?auto_3388 ) ) ( not ( = ?auto_3372 ?auto_3394 ) ) ( not ( = ?auto_3372 ?auto_3384 ) ) ( not ( = ?auto_3383 ?auto_3389 ) ) ( not ( = ?auto_3383 ?auto_3393 ) ) ( not ( = ?auto_3392 ?auto_3395 ) ) ( not ( = ?auto_3392 ?auto_3385 ) ) ( not ( = ?auto_3388 ?auto_3394 ) ) ( not ( = ?auto_3388 ?auto_3384 ) ) ( not ( = ?auto_3369 ?auto_3373 ) ) ( not ( = ?auto_3369 ?auto_3397 ) ) ( not ( = ?auto_3370 ?auto_3373 ) ) ( not ( = ?auto_3370 ?auto_3397 ) ) ( not ( = ?auto_3371 ?auto_3373 ) ) ( not ( = ?auto_3371 ?auto_3397 ) ) ( not ( = ?auto_3373 ?auto_3388 ) ) ( not ( = ?auto_3373 ?auto_3394 ) ) ( not ( = ?auto_3373 ?auto_3384 ) ) ( not ( = ?auto_3397 ?auto_3388 ) ) ( not ( = ?auto_3397 ?auto_3394 ) ) ( not ( = ?auto_3397 ?auto_3384 ) ) ( not ( = ?auto_3369 ?auto_3374 ) ) ( not ( = ?auto_3369 ?auto_3396 ) ) ( not ( = ?auto_3370 ?auto_3374 ) ) ( not ( = ?auto_3370 ?auto_3396 ) ) ( not ( = ?auto_3371 ?auto_3374 ) ) ( not ( = ?auto_3371 ?auto_3396 ) ) ( not ( = ?auto_3372 ?auto_3374 ) ) ( not ( = ?auto_3372 ?auto_3396 ) ) ( not ( = ?auto_3374 ?auto_3397 ) ) ( not ( = ?auto_3374 ?auto_3388 ) ) ( not ( = ?auto_3374 ?auto_3394 ) ) ( not ( = ?auto_3374 ?auto_3384 ) ) ( not ( = ?auto_3390 ?auto_3393 ) ) ( not ( = ?auto_3390 ?auto_3383 ) ) ( not ( = ?auto_3390 ?auto_3389 ) ) ( not ( = ?auto_3386 ?auto_3385 ) ) ( not ( = ?auto_3386 ?auto_3392 ) ) ( not ( = ?auto_3386 ?auto_3395 ) ) ( not ( = ?auto_3396 ?auto_3397 ) ) ( not ( = ?auto_3396 ?auto_3388 ) ) ( not ( = ?auto_3396 ?auto_3394 ) ) ( not ( = ?auto_3396 ?auto_3384 ) ) ( not ( = ?auto_3369 ?auto_3375 ) ) ( not ( = ?auto_3369 ?auto_3398 ) ) ( not ( = ?auto_3370 ?auto_3375 ) ) ( not ( = ?auto_3370 ?auto_3398 ) ) ( not ( = ?auto_3371 ?auto_3375 ) ) ( not ( = ?auto_3371 ?auto_3398 ) ) ( not ( = ?auto_3372 ?auto_3375 ) ) ( not ( = ?auto_3372 ?auto_3398 ) ) ( not ( = ?auto_3373 ?auto_3375 ) ) ( not ( = ?auto_3373 ?auto_3398 ) ) ( not ( = ?auto_3375 ?auto_3396 ) ) ( not ( = ?auto_3375 ?auto_3397 ) ) ( not ( = ?auto_3375 ?auto_3388 ) ) ( not ( = ?auto_3375 ?auto_3394 ) ) ( not ( = ?auto_3375 ?auto_3384 ) ) ( not ( = ?auto_3391 ?auto_3390 ) ) ( not ( = ?auto_3391 ?auto_3393 ) ) ( not ( = ?auto_3391 ?auto_3383 ) ) ( not ( = ?auto_3391 ?auto_3389 ) ) ( not ( = ?auto_3387 ?auto_3386 ) ) ( not ( = ?auto_3387 ?auto_3385 ) ) ( not ( = ?auto_3387 ?auto_3392 ) ) ( not ( = ?auto_3387 ?auto_3395 ) ) ( not ( = ?auto_3398 ?auto_3396 ) ) ( not ( = ?auto_3398 ?auto_3397 ) ) ( not ( = ?auto_3398 ?auto_3388 ) ) ( not ( = ?auto_3398 ?auto_3394 ) ) ( not ( = ?auto_3398 ?auto_3384 ) ) ( not ( = ?auto_3369 ?auto_3376 ) ) ( not ( = ?auto_3369 ?auto_3377 ) ) ( not ( = ?auto_3370 ?auto_3376 ) ) ( not ( = ?auto_3370 ?auto_3377 ) ) ( not ( = ?auto_3371 ?auto_3376 ) ) ( not ( = ?auto_3371 ?auto_3377 ) ) ( not ( = ?auto_3372 ?auto_3376 ) ) ( not ( = ?auto_3372 ?auto_3377 ) ) ( not ( = ?auto_3373 ?auto_3376 ) ) ( not ( = ?auto_3373 ?auto_3377 ) ) ( not ( = ?auto_3374 ?auto_3376 ) ) ( not ( = ?auto_3374 ?auto_3377 ) ) ( not ( = ?auto_3376 ?auto_3398 ) ) ( not ( = ?auto_3376 ?auto_3396 ) ) ( not ( = ?auto_3376 ?auto_3397 ) ) ( not ( = ?auto_3376 ?auto_3388 ) ) ( not ( = ?auto_3376 ?auto_3394 ) ) ( not ( = ?auto_3376 ?auto_3384 ) ) ( not ( = ?auto_3379 ?auto_3391 ) ) ( not ( = ?auto_3379 ?auto_3390 ) ) ( not ( = ?auto_3379 ?auto_3393 ) ) ( not ( = ?auto_3379 ?auto_3383 ) ) ( not ( = ?auto_3379 ?auto_3389 ) ) ( not ( = ?auto_3378 ?auto_3387 ) ) ( not ( = ?auto_3378 ?auto_3386 ) ) ( not ( = ?auto_3378 ?auto_3385 ) ) ( not ( = ?auto_3378 ?auto_3392 ) ) ( not ( = ?auto_3378 ?auto_3395 ) ) ( not ( = ?auto_3377 ?auto_3398 ) ) ( not ( = ?auto_3377 ?auto_3396 ) ) ( not ( = ?auto_3377 ?auto_3397 ) ) ( not ( = ?auto_3377 ?auto_3388 ) ) ( not ( = ?auto_3377 ?auto_3394 ) ) ( not ( = ?auto_3377 ?auto_3384 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_3369 ?auto_3370 ?auto_3371 ?auto_3372 ?auto_3373 ?auto_3374 ?auto_3375 )
      ( MAKE-1CRATE ?auto_3375 ?auto_3376 )
      ( MAKE-7CRATE-VERIFY ?auto_3369 ?auto_3370 ?auto_3371 ?auto_3372 ?auto_3373 ?auto_3374 ?auto_3375 ?auto_3376 ) )
  )

)

