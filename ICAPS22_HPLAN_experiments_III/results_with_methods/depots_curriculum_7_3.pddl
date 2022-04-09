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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3176 - SURFACE
      ?auto_3177 - SURFACE
    )
    :vars
    (
      ?auto_3178 - HOIST
      ?auto_3179 - PLACE
      ?auto_3181 - PLACE
      ?auto_3182 - HOIST
      ?auto_3183 - SURFACE
      ?auto_3180 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3178 ?auto_3179 ) ( SURFACE-AT ?auto_3176 ?auto_3179 ) ( CLEAR ?auto_3176 ) ( IS-CRATE ?auto_3177 ) ( AVAILABLE ?auto_3178 ) ( not ( = ?auto_3181 ?auto_3179 ) ) ( HOIST-AT ?auto_3182 ?auto_3181 ) ( AVAILABLE ?auto_3182 ) ( SURFACE-AT ?auto_3177 ?auto_3181 ) ( ON ?auto_3177 ?auto_3183 ) ( CLEAR ?auto_3177 ) ( TRUCK-AT ?auto_3180 ?auto_3179 ) ( not ( = ?auto_3176 ?auto_3177 ) ) ( not ( = ?auto_3176 ?auto_3183 ) ) ( not ( = ?auto_3177 ?auto_3183 ) ) ( not ( = ?auto_3178 ?auto_3182 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3180 ?auto_3179 ?auto_3181 )
      ( !LIFT ?auto_3182 ?auto_3177 ?auto_3183 ?auto_3181 )
      ( !LOAD ?auto_3182 ?auto_3177 ?auto_3180 ?auto_3181 )
      ( !DRIVE ?auto_3180 ?auto_3181 ?auto_3179 )
      ( !UNLOAD ?auto_3178 ?auto_3177 ?auto_3180 ?auto_3179 )
      ( !DROP ?auto_3178 ?auto_3177 ?auto_3176 ?auto_3179 )
      ( MAKE-1CRATE-VERIFY ?auto_3176 ?auto_3177 ) )
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
      ?auto_3193 - HOIST
      ?auto_3191 - PLACE
      ?auto_3190 - PLACE
      ?auto_3195 - HOIST
      ?auto_3192 - SURFACE
      ?auto_3198 - PLACE
      ?auto_3197 - HOIST
      ?auto_3196 - SURFACE
      ?auto_3194 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3193 ?auto_3191 ) ( IS-CRATE ?auto_3189 ) ( not ( = ?auto_3190 ?auto_3191 ) ) ( HOIST-AT ?auto_3195 ?auto_3190 ) ( AVAILABLE ?auto_3195 ) ( SURFACE-AT ?auto_3189 ?auto_3190 ) ( ON ?auto_3189 ?auto_3192 ) ( CLEAR ?auto_3189 ) ( not ( = ?auto_3188 ?auto_3189 ) ) ( not ( = ?auto_3188 ?auto_3192 ) ) ( not ( = ?auto_3189 ?auto_3192 ) ) ( not ( = ?auto_3193 ?auto_3195 ) ) ( SURFACE-AT ?auto_3187 ?auto_3191 ) ( CLEAR ?auto_3187 ) ( IS-CRATE ?auto_3188 ) ( AVAILABLE ?auto_3193 ) ( not ( = ?auto_3198 ?auto_3191 ) ) ( HOIST-AT ?auto_3197 ?auto_3198 ) ( AVAILABLE ?auto_3197 ) ( SURFACE-AT ?auto_3188 ?auto_3198 ) ( ON ?auto_3188 ?auto_3196 ) ( CLEAR ?auto_3188 ) ( TRUCK-AT ?auto_3194 ?auto_3191 ) ( not ( = ?auto_3187 ?auto_3188 ) ) ( not ( = ?auto_3187 ?auto_3196 ) ) ( not ( = ?auto_3188 ?auto_3196 ) ) ( not ( = ?auto_3193 ?auto_3197 ) ) ( not ( = ?auto_3187 ?auto_3189 ) ) ( not ( = ?auto_3187 ?auto_3192 ) ) ( not ( = ?auto_3189 ?auto_3196 ) ) ( not ( = ?auto_3190 ?auto_3198 ) ) ( not ( = ?auto_3195 ?auto_3197 ) ) ( not ( = ?auto_3192 ?auto_3196 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3187 ?auto_3188 )
      ( MAKE-1CRATE ?auto_3188 ?auto_3189 )
      ( MAKE-2CRATE-VERIFY ?auto_3187 ?auto_3188 ?auto_3189 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3201 - SURFACE
      ?auto_3202 - SURFACE
    )
    :vars
    (
      ?auto_3203 - HOIST
      ?auto_3204 - PLACE
      ?auto_3206 - PLACE
      ?auto_3207 - HOIST
      ?auto_3208 - SURFACE
      ?auto_3205 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3203 ?auto_3204 ) ( SURFACE-AT ?auto_3201 ?auto_3204 ) ( CLEAR ?auto_3201 ) ( IS-CRATE ?auto_3202 ) ( AVAILABLE ?auto_3203 ) ( not ( = ?auto_3206 ?auto_3204 ) ) ( HOIST-AT ?auto_3207 ?auto_3206 ) ( AVAILABLE ?auto_3207 ) ( SURFACE-AT ?auto_3202 ?auto_3206 ) ( ON ?auto_3202 ?auto_3208 ) ( CLEAR ?auto_3202 ) ( TRUCK-AT ?auto_3205 ?auto_3204 ) ( not ( = ?auto_3201 ?auto_3202 ) ) ( not ( = ?auto_3201 ?auto_3208 ) ) ( not ( = ?auto_3202 ?auto_3208 ) ) ( not ( = ?auto_3203 ?auto_3207 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3205 ?auto_3204 ?auto_3206 )
      ( !LIFT ?auto_3207 ?auto_3202 ?auto_3208 ?auto_3206 )
      ( !LOAD ?auto_3207 ?auto_3202 ?auto_3205 ?auto_3206 )
      ( !DRIVE ?auto_3205 ?auto_3206 ?auto_3204 )
      ( !UNLOAD ?auto_3203 ?auto_3202 ?auto_3205 ?auto_3204 )
      ( !DROP ?auto_3203 ?auto_3202 ?auto_3201 ?auto_3204 )
      ( MAKE-1CRATE-VERIFY ?auto_3201 ?auto_3202 ) )
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
      ?auto_3219 - HOIST
      ?auto_3218 - PLACE
      ?auto_3222 - PLACE
      ?auto_3221 - HOIST
      ?auto_3220 - SURFACE
      ?auto_3226 - PLACE
      ?auto_3223 - HOIST
      ?auto_3225 - SURFACE
      ?auto_3224 - SURFACE
      ?auto_3217 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3219 ?auto_3218 ) ( IS-CRATE ?auto_3216 ) ( not ( = ?auto_3222 ?auto_3218 ) ) ( HOIST-AT ?auto_3221 ?auto_3222 ) ( SURFACE-AT ?auto_3216 ?auto_3222 ) ( ON ?auto_3216 ?auto_3220 ) ( CLEAR ?auto_3216 ) ( not ( = ?auto_3215 ?auto_3216 ) ) ( not ( = ?auto_3215 ?auto_3220 ) ) ( not ( = ?auto_3216 ?auto_3220 ) ) ( not ( = ?auto_3219 ?auto_3221 ) ) ( IS-CRATE ?auto_3215 ) ( not ( = ?auto_3226 ?auto_3218 ) ) ( HOIST-AT ?auto_3223 ?auto_3226 ) ( AVAILABLE ?auto_3223 ) ( SURFACE-AT ?auto_3215 ?auto_3226 ) ( ON ?auto_3215 ?auto_3225 ) ( CLEAR ?auto_3215 ) ( not ( = ?auto_3214 ?auto_3215 ) ) ( not ( = ?auto_3214 ?auto_3225 ) ) ( not ( = ?auto_3215 ?auto_3225 ) ) ( not ( = ?auto_3219 ?auto_3223 ) ) ( SURFACE-AT ?auto_3213 ?auto_3218 ) ( CLEAR ?auto_3213 ) ( IS-CRATE ?auto_3214 ) ( AVAILABLE ?auto_3219 ) ( AVAILABLE ?auto_3221 ) ( SURFACE-AT ?auto_3214 ?auto_3222 ) ( ON ?auto_3214 ?auto_3224 ) ( CLEAR ?auto_3214 ) ( TRUCK-AT ?auto_3217 ?auto_3218 ) ( not ( = ?auto_3213 ?auto_3214 ) ) ( not ( = ?auto_3213 ?auto_3224 ) ) ( not ( = ?auto_3214 ?auto_3224 ) ) ( not ( = ?auto_3213 ?auto_3215 ) ) ( not ( = ?auto_3213 ?auto_3225 ) ) ( not ( = ?auto_3215 ?auto_3224 ) ) ( not ( = ?auto_3226 ?auto_3222 ) ) ( not ( = ?auto_3223 ?auto_3221 ) ) ( not ( = ?auto_3225 ?auto_3224 ) ) ( not ( = ?auto_3213 ?auto_3216 ) ) ( not ( = ?auto_3213 ?auto_3220 ) ) ( not ( = ?auto_3214 ?auto_3216 ) ) ( not ( = ?auto_3214 ?auto_3220 ) ) ( not ( = ?auto_3216 ?auto_3225 ) ) ( not ( = ?auto_3216 ?auto_3224 ) ) ( not ( = ?auto_3220 ?auto_3225 ) ) ( not ( = ?auto_3220 ?auto_3224 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3213 ?auto_3214 ?auto_3215 )
      ( MAKE-1CRATE ?auto_3215 ?auto_3216 )
      ( MAKE-3CRATE-VERIFY ?auto_3213 ?auto_3214 ?auto_3215 ?auto_3216 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3229 - SURFACE
      ?auto_3230 - SURFACE
    )
    :vars
    (
      ?auto_3231 - HOIST
      ?auto_3232 - PLACE
      ?auto_3234 - PLACE
      ?auto_3235 - HOIST
      ?auto_3236 - SURFACE
      ?auto_3233 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3231 ?auto_3232 ) ( SURFACE-AT ?auto_3229 ?auto_3232 ) ( CLEAR ?auto_3229 ) ( IS-CRATE ?auto_3230 ) ( AVAILABLE ?auto_3231 ) ( not ( = ?auto_3234 ?auto_3232 ) ) ( HOIST-AT ?auto_3235 ?auto_3234 ) ( AVAILABLE ?auto_3235 ) ( SURFACE-AT ?auto_3230 ?auto_3234 ) ( ON ?auto_3230 ?auto_3236 ) ( CLEAR ?auto_3230 ) ( TRUCK-AT ?auto_3233 ?auto_3232 ) ( not ( = ?auto_3229 ?auto_3230 ) ) ( not ( = ?auto_3229 ?auto_3236 ) ) ( not ( = ?auto_3230 ?auto_3236 ) ) ( not ( = ?auto_3231 ?auto_3235 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3233 ?auto_3232 ?auto_3234 )
      ( !LIFT ?auto_3235 ?auto_3230 ?auto_3236 ?auto_3234 )
      ( !LOAD ?auto_3235 ?auto_3230 ?auto_3233 ?auto_3234 )
      ( !DRIVE ?auto_3233 ?auto_3234 ?auto_3232 )
      ( !UNLOAD ?auto_3231 ?auto_3230 ?auto_3233 ?auto_3232 )
      ( !DROP ?auto_3231 ?auto_3230 ?auto_3229 ?auto_3232 )
      ( MAKE-1CRATE-VERIFY ?auto_3229 ?auto_3230 ) )
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
      ?auto_3249 - HOIST
      ?auto_3251 - PLACE
      ?auto_3250 - PLACE
      ?auto_3248 - HOIST
      ?auto_3247 - SURFACE
      ?auto_3255 - PLACE
      ?auto_3256 - HOIST
      ?auto_3257 - SURFACE
      ?auto_3254 - SURFACE
      ?auto_3253 - SURFACE
      ?auto_3252 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3249 ?auto_3251 ) ( IS-CRATE ?auto_3246 ) ( not ( = ?auto_3250 ?auto_3251 ) ) ( HOIST-AT ?auto_3248 ?auto_3250 ) ( SURFACE-AT ?auto_3246 ?auto_3250 ) ( ON ?auto_3246 ?auto_3247 ) ( CLEAR ?auto_3246 ) ( not ( = ?auto_3245 ?auto_3246 ) ) ( not ( = ?auto_3245 ?auto_3247 ) ) ( not ( = ?auto_3246 ?auto_3247 ) ) ( not ( = ?auto_3249 ?auto_3248 ) ) ( IS-CRATE ?auto_3245 ) ( not ( = ?auto_3255 ?auto_3251 ) ) ( HOIST-AT ?auto_3256 ?auto_3255 ) ( SURFACE-AT ?auto_3245 ?auto_3255 ) ( ON ?auto_3245 ?auto_3257 ) ( CLEAR ?auto_3245 ) ( not ( = ?auto_3244 ?auto_3245 ) ) ( not ( = ?auto_3244 ?auto_3257 ) ) ( not ( = ?auto_3245 ?auto_3257 ) ) ( not ( = ?auto_3249 ?auto_3256 ) ) ( IS-CRATE ?auto_3244 ) ( AVAILABLE ?auto_3248 ) ( SURFACE-AT ?auto_3244 ?auto_3250 ) ( ON ?auto_3244 ?auto_3254 ) ( CLEAR ?auto_3244 ) ( not ( = ?auto_3243 ?auto_3244 ) ) ( not ( = ?auto_3243 ?auto_3254 ) ) ( not ( = ?auto_3244 ?auto_3254 ) ) ( SURFACE-AT ?auto_3242 ?auto_3251 ) ( CLEAR ?auto_3242 ) ( IS-CRATE ?auto_3243 ) ( AVAILABLE ?auto_3249 ) ( AVAILABLE ?auto_3256 ) ( SURFACE-AT ?auto_3243 ?auto_3255 ) ( ON ?auto_3243 ?auto_3253 ) ( CLEAR ?auto_3243 ) ( TRUCK-AT ?auto_3252 ?auto_3251 ) ( not ( = ?auto_3242 ?auto_3243 ) ) ( not ( = ?auto_3242 ?auto_3253 ) ) ( not ( = ?auto_3243 ?auto_3253 ) ) ( not ( = ?auto_3242 ?auto_3244 ) ) ( not ( = ?auto_3242 ?auto_3254 ) ) ( not ( = ?auto_3244 ?auto_3253 ) ) ( not ( = ?auto_3250 ?auto_3255 ) ) ( not ( = ?auto_3248 ?auto_3256 ) ) ( not ( = ?auto_3254 ?auto_3253 ) ) ( not ( = ?auto_3242 ?auto_3245 ) ) ( not ( = ?auto_3242 ?auto_3257 ) ) ( not ( = ?auto_3243 ?auto_3245 ) ) ( not ( = ?auto_3243 ?auto_3257 ) ) ( not ( = ?auto_3245 ?auto_3254 ) ) ( not ( = ?auto_3245 ?auto_3253 ) ) ( not ( = ?auto_3257 ?auto_3254 ) ) ( not ( = ?auto_3257 ?auto_3253 ) ) ( not ( = ?auto_3242 ?auto_3246 ) ) ( not ( = ?auto_3242 ?auto_3247 ) ) ( not ( = ?auto_3243 ?auto_3246 ) ) ( not ( = ?auto_3243 ?auto_3247 ) ) ( not ( = ?auto_3244 ?auto_3246 ) ) ( not ( = ?auto_3244 ?auto_3247 ) ) ( not ( = ?auto_3246 ?auto_3257 ) ) ( not ( = ?auto_3246 ?auto_3254 ) ) ( not ( = ?auto_3246 ?auto_3253 ) ) ( not ( = ?auto_3247 ?auto_3257 ) ) ( not ( = ?auto_3247 ?auto_3254 ) ) ( not ( = ?auto_3247 ?auto_3253 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3242 ?auto_3243 ?auto_3244 ?auto_3245 )
      ( MAKE-1CRATE ?auto_3245 ?auto_3246 )
      ( MAKE-4CRATE-VERIFY ?auto_3242 ?auto_3243 ?auto_3244 ?auto_3245 ?auto_3246 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3260 - SURFACE
      ?auto_3261 - SURFACE
    )
    :vars
    (
      ?auto_3262 - HOIST
      ?auto_3263 - PLACE
      ?auto_3265 - PLACE
      ?auto_3266 - HOIST
      ?auto_3267 - SURFACE
      ?auto_3264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3262 ?auto_3263 ) ( SURFACE-AT ?auto_3260 ?auto_3263 ) ( CLEAR ?auto_3260 ) ( IS-CRATE ?auto_3261 ) ( AVAILABLE ?auto_3262 ) ( not ( = ?auto_3265 ?auto_3263 ) ) ( HOIST-AT ?auto_3266 ?auto_3265 ) ( AVAILABLE ?auto_3266 ) ( SURFACE-AT ?auto_3261 ?auto_3265 ) ( ON ?auto_3261 ?auto_3267 ) ( CLEAR ?auto_3261 ) ( TRUCK-AT ?auto_3264 ?auto_3263 ) ( not ( = ?auto_3260 ?auto_3261 ) ) ( not ( = ?auto_3260 ?auto_3267 ) ) ( not ( = ?auto_3261 ?auto_3267 ) ) ( not ( = ?auto_3262 ?auto_3266 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3264 ?auto_3263 ?auto_3265 )
      ( !LIFT ?auto_3266 ?auto_3261 ?auto_3267 ?auto_3265 )
      ( !LOAD ?auto_3266 ?auto_3261 ?auto_3264 ?auto_3265 )
      ( !DRIVE ?auto_3264 ?auto_3265 ?auto_3263 )
      ( !UNLOAD ?auto_3262 ?auto_3261 ?auto_3264 ?auto_3263 )
      ( !DROP ?auto_3262 ?auto_3261 ?auto_3260 ?auto_3263 )
      ( MAKE-1CRATE-VERIFY ?auto_3260 ?auto_3261 ) )
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
      ?auto_3281 - HOIST
      ?auto_3284 - PLACE
      ?auto_3285 - PLACE
      ?auto_3283 - HOIST
      ?auto_3282 - SURFACE
      ?auto_3293 - PLACE
      ?auto_3286 - HOIST
      ?auto_3287 - SURFACE
      ?auto_3288 - PLACE
      ?auto_3291 - HOIST
      ?auto_3292 - SURFACE
      ?auto_3290 - SURFACE
      ?auto_3289 - SURFACE
      ?auto_3280 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3281 ?auto_3284 ) ( IS-CRATE ?auto_3279 ) ( not ( = ?auto_3285 ?auto_3284 ) ) ( HOIST-AT ?auto_3283 ?auto_3285 ) ( AVAILABLE ?auto_3283 ) ( SURFACE-AT ?auto_3279 ?auto_3285 ) ( ON ?auto_3279 ?auto_3282 ) ( CLEAR ?auto_3279 ) ( not ( = ?auto_3278 ?auto_3279 ) ) ( not ( = ?auto_3278 ?auto_3282 ) ) ( not ( = ?auto_3279 ?auto_3282 ) ) ( not ( = ?auto_3281 ?auto_3283 ) ) ( IS-CRATE ?auto_3278 ) ( not ( = ?auto_3293 ?auto_3284 ) ) ( HOIST-AT ?auto_3286 ?auto_3293 ) ( SURFACE-AT ?auto_3278 ?auto_3293 ) ( ON ?auto_3278 ?auto_3287 ) ( CLEAR ?auto_3278 ) ( not ( = ?auto_3277 ?auto_3278 ) ) ( not ( = ?auto_3277 ?auto_3287 ) ) ( not ( = ?auto_3278 ?auto_3287 ) ) ( not ( = ?auto_3281 ?auto_3286 ) ) ( IS-CRATE ?auto_3277 ) ( not ( = ?auto_3288 ?auto_3284 ) ) ( HOIST-AT ?auto_3291 ?auto_3288 ) ( SURFACE-AT ?auto_3277 ?auto_3288 ) ( ON ?auto_3277 ?auto_3292 ) ( CLEAR ?auto_3277 ) ( not ( = ?auto_3276 ?auto_3277 ) ) ( not ( = ?auto_3276 ?auto_3292 ) ) ( not ( = ?auto_3277 ?auto_3292 ) ) ( not ( = ?auto_3281 ?auto_3291 ) ) ( IS-CRATE ?auto_3276 ) ( AVAILABLE ?auto_3286 ) ( SURFACE-AT ?auto_3276 ?auto_3293 ) ( ON ?auto_3276 ?auto_3290 ) ( CLEAR ?auto_3276 ) ( not ( = ?auto_3275 ?auto_3276 ) ) ( not ( = ?auto_3275 ?auto_3290 ) ) ( not ( = ?auto_3276 ?auto_3290 ) ) ( SURFACE-AT ?auto_3274 ?auto_3284 ) ( CLEAR ?auto_3274 ) ( IS-CRATE ?auto_3275 ) ( AVAILABLE ?auto_3281 ) ( AVAILABLE ?auto_3291 ) ( SURFACE-AT ?auto_3275 ?auto_3288 ) ( ON ?auto_3275 ?auto_3289 ) ( CLEAR ?auto_3275 ) ( TRUCK-AT ?auto_3280 ?auto_3284 ) ( not ( = ?auto_3274 ?auto_3275 ) ) ( not ( = ?auto_3274 ?auto_3289 ) ) ( not ( = ?auto_3275 ?auto_3289 ) ) ( not ( = ?auto_3274 ?auto_3276 ) ) ( not ( = ?auto_3274 ?auto_3290 ) ) ( not ( = ?auto_3276 ?auto_3289 ) ) ( not ( = ?auto_3293 ?auto_3288 ) ) ( not ( = ?auto_3286 ?auto_3291 ) ) ( not ( = ?auto_3290 ?auto_3289 ) ) ( not ( = ?auto_3274 ?auto_3277 ) ) ( not ( = ?auto_3274 ?auto_3292 ) ) ( not ( = ?auto_3275 ?auto_3277 ) ) ( not ( = ?auto_3275 ?auto_3292 ) ) ( not ( = ?auto_3277 ?auto_3290 ) ) ( not ( = ?auto_3277 ?auto_3289 ) ) ( not ( = ?auto_3292 ?auto_3290 ) ) ( not ( = ?auto_3292 ?auto_3289 ) ) ( not ( = ?auto_3274 ?auto_3278 ) ) ( not ( = ?auto_3274 ?auto_3287 ) ) ( not ( = ?auto_3275 ?auto_3278 ) ) ( not ( = ?auto_3275 ?auto_3287 ) ) ( not ( = ?auto_3276 ?auto_3278 ) ) ( not ( = ?auto_3276 ?auto_3287 ) ) ( not ( = ?auto_3278 ?auto_3292 ) ) ( not ( = ?auto_3278 ?auto_3290 ) ) ( not ( = ?auto_3278 ?auto_3289 ) ) ( not ( = ?auto_3287 ?auto_3292 ) ) ( not ( = ?auto_3287 ?auto_3290 ) ) ( not ( = ?auto_3287 ?auto_3289 ) ) ( not ( = ?auto_3274 ?auto_3279 ) ) ( not ( = ?auto_3274 ?auto_3282 ) ) ( not ( = ?auto_3275 ?auto_3279 ) ) ( not ( = ?auto_3275 ?auto_3282 ) ) ( not ( = ?auto_3276 ?auto_3279 ) ) ( not ( = ?auto_3276 ?auto_3282 ) ) ( not ( = ?auto_3277 ?auto_3279 ) ) ( not ( = ?auto_3277 ?auto_3282 ) ) ( not ( = ?auto_3279 ?auto_3287 ) ) ( not ( = ?auto_3279 ?auto_3292 ) ) ( not ( = ?auto_3279 ?auto_3290 ) ) ( not ( = ?auto_3279 ?auto_3289 ) ) ( not ( = ?auto_3285 ?auto_3293 ) ) ( not ( = ?auto_3285 ?auto_3288 ) ) ( not ( = ?auto_3283 ?auto_3286 ) ) ( not ( = ?auto_3283 ?auto_3291 ) ) ( not ( = ?auto_3282 ?auto_3287 ) ) ( not ( = ?auto_3282 ?auto_3292 ) ) ( not ( = ?auto_3282 ?auto_3290 ) ) ( not ( = ?auto_3282 ?auto_3289 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_3274 ?auto_3275 ?auto_3276 ?auto_3277 ?auto_3278 )
      ( MAKE-1CRATE ?auto_3278 ?auto_3279 )
      ( MAKE-5CRATE-VERIFY ?auto_3274 ?auto_3275 ?auto_3276 ?auto_3277 ?auto_3278 ?auto_3279 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3296 - SURFACE
      ?auto_3297 - SURFACE
    )
    :vars
    (
      ?auto_3298 - HOIST
      ?auto_3299 - PLACE
      ?auto_3301 - PLACE
      ?auto_3302 - HOIST
      ?auto_3303 - SURFACE
      ?auto_3300 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3298 ?auto_3299 ) ( SURFACE-AT ?auto_3296 ?auto_3299 ) ( CLEAR ?auto_3296 ) ( IS-CRATE ?auto_3297 ) ( AVAILABLE ?auto_3298 ) ( not ( = ?auto_3301 ?auto_3299 ) ) ( HOIST-AT ?auto_3302 ?auto_3301 ) ( AVAILABLE ?auto_3302 ) ( SURFACE-AT ?auto_3297 ?auto_3301 ) ( ON ?auto_3297 ?auto_3303 ) ( CLEAR ?auto_3297 ) ( TRUCK-AT ?auto_3300 ?auto_3299 ) ( not ( = ?auto_3296 ?auto_3297 ) ) ( not ( = ?auto_3296 ?auto_3303 ) ) ( not ( = ?auto_3297 ?auto_3303 ) ) ( not ( = ?auto_3298 ?auto_3302 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3300 ?auto_3299 ?auto_3301 )
      ( !LIFT ?auto_3302 ?auto_3297 ?auto_3303 ?auto_3301 )
      ( !LOAD ?auto_3302 ?auto_3297 ?auto_3300 ?auto_3301 )
      ( !DRIVE ?auto_3300 ?auto_3301 ?auto_3299 )
      ( !UNLOAD ?auto_3298 ?auto_3297 ?auto_3300 ?auto_3299 )
      ( !DROP ?auto_3298 ?auto_3297 ?auto_3296 ?auto_3299 )
      ( MAKE-1CRATE-VERIFY ?auto_3296 ?auto_3297 ) )
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
      ?auto_3323 - HOIST
      ?auto_3320 - PLACE
      ?auto_3318 - PLACE
      ?auto_3321 - HOIST
      ?auto_3322 - SURFACE
      ?auto_3327 - PLACE
      ?auto_3324 - HOIST
      ?auto_3331 - SURFACE
      ?auto_3330 - PLACE
      ?auto_3325 - HOIST
      ?auto_3326 - SURFACE
      ?auto_3328 - PLACE
      ?auto_3334 - HOIST
      ?auto_3333 - SURFACE
      ?auto_3332 - SURFACE
      ?auto_3329 - SURFACE
      ?auto_3319 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3323 ?auto_3320 ) ( IS-CRATE ?auto_3317 ) ( not ( = ?auto_3318 ?auto_3320 ) ) ( HOIST-AT ?auto_3321 ?auto_3318 ) ( AVAILABLE ?auto_3321 ) ( SURFACE-AT ?auto_3317 ?auto_3318 ) ( ON ?auto_3317 ?auto_3322 ) ( CLEAR ?auto_3317 ) ( not ( = ?auto_3316 ?auto_3317 ) ) ( not ( = ?auto_3316 ?auto_3322 ) ) ( not ( = ?auto_3317 ?auto_3322 ) ) ( not ( = ?auto_3323 ?auto_3321 ) ) ( IS-CRATE ?auto_3316 ) ( not ( = ?auto_3327 ?auto_3320 ) ) ( HOIST-AT ?auto_3324 ?auto_3327 ) ( AVAILABLE ?auto_3324 ) ( SURFACE-AT ?auto_3316 ?auto_3327 ) ( ON ?auto_3316 ?auto_3331 ) ( CLEAR ?auto_3316 ) ( not ( = ?auto_3315 ?auto_3316 ) ) ( not ( = ?auto_3315 ?auto_3331 ) ) ( not ( = ?auto_3316 ?auto_3331 ) ) ( not ( = ?auto_3323 ?auto_3324 ) ) ( IS-CRATE ?auto_3315 ) ( not ( = ?auto_3330 ?auto_3320 ) ) ( HOIST-AT ?auto_3325 ?auto_3330 ) ( SURFACE-AT ?auto_3315 ?auto_3330 ) ( ON ?auto_3315 ?auto_3326 ) ( CLEAR ?auto_3315 ) ( not ( = ?auto_3314 ?auto_3315 ) ) ( not ( = ?auto_3314 ?auto_3326 ) ) ( not ( = ?auto_3315 ?auto_3326 ) ) ( not ( = ?auto_3323 ?auto_3325 ) ) ( IS-CRATE ?auto_3314 ) ( not ( = ?auto_3328 ?auto_3320 ) ) ( HOIST-AT ?auto_3334 ?auto_3328 ) ( SURFACE-AT ?auto_3314 ?auto_3328 ) ( ON ?auto_3314 ?auto_3333 ) ( CLEAR ?auto_3314 ) ( not ( = ?auto_3313 ?auto_3314 ) ) ( not ( = ?auto_3313 ?auto_3333 ) ) ( not ( = ?auto_3314 ?auto_3333 ) ) ( not ( = ?auto_3323 ?auto_3334 ) ) ( IS-CRATE ?auto_3313 ) ( AVAILABLE ?auto_3325 ) ( SURFACE-AT ?auto_3313 ?auto_3330 ) ( ON ?auto_3313 ?auto_3332 ) ( CLEAR ?auto_3313 ) ( not ( = ?auto_3312 ?auto_3313 ) ) ( not ( = ?auto_3312 ?auto_3332 ) ) ( not ( = ?auto_3313 ?auto_3332 ) ) ( SURFACE-AT ?auto_3311 ?auto_3320 ) ( CLEAR ?auto_3311 ) ( IS-CRATE ?auto_3312 ) ( AVAILABLE ?auto_3323 ) ( AVAILABLE ?auto_3334 ) ( SURFACE-AT ?auto_3312 ?auto_3328 ) ( ON ?auto_3312 ?auto_3329 ) ( CLEAR ?auto_3312 ) ( TRUCK-AT ?auto_3319 ?auto_3320 ) ( not ( = ?auto_3311 ?auto_3312 ) ) ( not ( = ?auto_3311 ?auto_3329 ) ) ( not ( = ?auto_3312 ?auto_3329 ) ) ( not ( = ?auto_3311 ?auto_3313 ) ) ( not ( = ?auto_3311 ?auto_3332 ) ) ( not ( = ?auto_3313 ?auto_3329 ) ) ( not ( = ?auto_3330 ?auto_3328 ) ) ( not ( = ?auto_3325 ?auto_3334 ) ) ( not ( = ?auto_3332 ?auto_3329 ) ) ( not ( = ?auto_3311 ?auto_3314 ) ) ( not ( = ?auto_3311 ?auto_3333 ) ) ( not ( = ?auto_3312 ?auto_3314 ) ) ( not ( = ?auto_3312 ?auto_3333 ) ) ( not ( = ?auto_3314 ?auto_3332 ) ) ( not ( = ?auto_3314 ?auto_3329 ) ) ( not ( = ?auto_3333 ?auto_3332 ) ) ( not ( = ?auto_3333 ?auto_3329 ) ) ( not ( = ?auto_3311 ?auto_3315 ) ) ( not ( = ?auto_3311 ?auto_3326 ) ) ( not ( = ?auto_3312 ?auto_3315 ) ) ( not ( = ?auto_3312 ?auto_3326 ) ) ( not ( = ?auto_3313 ?auto_3315 ) ) ( not ( = ?auto_3313 ?auto_3326 ) ) ( not ( = ?auto_3315 ?auto_3333 ) ) ( not ( = ?auto_3315 ?auto_3332 ) ) ( not ( = ?auto_3315 ?auto_3329 ) ) ( not ( = ?auto_3326 ?auto_3333 ) ) ( not ( = ?auto_3326 ?auto_3332 ) ) ( not ( = ?auto_3326 ?auto_3329 ) ) ( not ( = ?auto_3311 ?auto_3316 ) ) ( not ( = ?auto_3311 ?auto_3331 ) ) ( not ( = ?auto_3312 ?auto_3316 ) ) ( not ( = ?auto_3312 ?auto_3331 ) ) ( not ( = ?auto_3313 ?auto_3316 ) ) ( not ( = ?auto_3313 ?auto_3331 ) ) ( not ( = ?auto_3314 ?auto_3316 ) ) ( not ( = ?auto_3314 ?auto_3331 ) ) ( not ( = ?auto_3316 ?auto_3326 ) ) ( not ( = ?auto_3316 ?auto_3333 ) ) ( not ( = ?auto_3316 ?auto_3332 ) ) ( not ( = ?auto_3316 ?auto_3329 ) ) ( not ( = ?auto_3327 ?auto_3330 ) ) ( not ( = ?auto_3327 ?auto_3328 ) ) ( not ( = ?auto_3324 ?auto_3325 ) ) ( not ( = ?auto_3324 ?auto_3334 ) ) ( not ( = ?auto_3331 ?auto_3326 ) ) ( not ( = ?auto_3331 ?auto_3333 ) ) ( not ( = ?auto_3331 ?auto_3332 ) ) ( not ( = ?auto_3331 ?auto_3329 ) ) ( not ( = ?auto_3311 ?auto_3317 ) ) ( not ( = ?auto_3311 ?auto_3322 ) ) ( not ( = ?auto_3312 ?auto_3317 ) ) ( not ( = ?auto_3312 ?auto_3322 ) ) ( not ( = ?auto_3313 ?auto_3317 ) ) ( not ( = ?auto_3313 ?auto_3322 ) ) ( not ( = ?auto_3314 ?auto_3317 ) ) ( not ( = ?auto_3314 ?auto_3322 ) ) ( not ( = ?auto_3315 ?auto_3317 ) ) ( not ( = ?auto_3315 ?auto_3322 ) ) ( not ( = ?auto_3317 ?auto_3331 ) ) ( not ( = ?auto_3317 ?auto_3326 ) ) ( not ( = ?auto_3317 ?auto_3333 ) ) ( not ( = ?auto_3317 ?auto_3332 ) ) ( not ( = ?auto_3317 ?auto_3329 ) ) ( not ( = ?auto_3318 ?auto_3327 ) ) ( not ( = ?auto_3318 ?auto_3330 ) ) ( not ( = ?auto_3318 ?auto_3328 ) ) ( not ( = ?auto_3321 ?auto_3324 ) ) ( not ( = ?auto_3321 ?auto_3325 ) ) ( not ( = ?auto_3321 ?auto_3334 ) ) ( not ( = ?auto_3322 ?auto_3331 ) ) ( not ( = ?auto_3322 ?auto_3326 ) ) ( not ( = ?auto_3322 ?auto_3333 ) ) ( not ( = ?auto_3322 ?auto_3332 ) ) ( not ( = ?auto_3322 ?auto_3329 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_3311 ?auto_3312 ?auto_3313 ?auto_3314 ?auto_3315 ?auto_3316 )
      ( MAKE-1CRATE ?auto_3316 ?auto_3317 )
      ( MAKE-6CRATE-VERIFY ?auto_3311 ?auto_3312 ?auto_3313 ?auto_3314 ?auto_3315 ?auto_3316 ?auto_3317 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3337 - SURFACE
      ?auto_3338 - SURFACE
    )
    :vars
    (
      ?auto_3339 - HOIST
      ?auto_3340 - PLACE
      ?auto_3342 - PLACE
      ?auto_3343 - HOIST
      ?auto_3344 - SURFACE
      ?auto_3341 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3339 ?auto_3340 ) ( SURFACE-AT ?auto_3337 ?auto_3340 ) ( CLEAR ?auto_3337 ) ( IS-CRATE ?auto_3338 ) ( AVAILABLE ?auto_3339 ) ( not ( = ?auto_3342 ?auto_3340 ) ) ( HOIST-AT ?auto_3343 ?auto_3342 ) ( AVAILABLE ?auto_3343 ) ( SURFACE-AT ?auto_3338 ?auto_3342 ) ( ON ?auto_3338 ?auto_3344 ) ( CLEAR ?auto_3338 ) ( TRUCK-AT ?auto_3341 ?auto_3340 ) ( not ( = ?auto_3337 ?auto_3338 ) ) ( not ( = ?auto_3337 ?auto_3344 ) ) ( not ( = ?auto_3338 ?auto_3344 ) ) ( not ( = ?auto_3339 ?auto_3343 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3341 ?auto_3340 ?auto_3342 )
      ( !LIFT ?auto_3343 ?auto_3338 ?auto_3344 ?auto_3342 )
      ( !LOAD ?auto_3343 ?auto_3338 ?auto_3341 ?auto_3342 )
      ( !DRIVE ?auto_3341 ?auto_3342 ?auto_3340 )
      ( !UNLOAD ?auto_3339 ?auto_3338 ?auto_3341 ?auto_3340 )
      ( !DROP ?auto_3339 ?auto_3338 ?auto_3337 ?auto_3340 )
      ( MAKE-1CRATE-VERIFY ?auto_3337 ?auto_3338 ) )
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
      ?auto_3365 - HOIST
      ?auto_3361 - PLACE
      ?auto_3364 - PLACE
      ?auto_3362 - HOIST
      ?auto_3363 - SURFACE
      ?auto_3376 - PLACE
      ?auto_3380 - HOIST
      ?auto_3377 - SURFACE
      ?auto_3379 - PLACE
      ?auto_3373 - HOIST
      ?auto_3369 - SURFACE
      ?auto_3370 - PLACE
      ?auto_3374 - HOIST
      ?auto_3375 - SURFACE
      ?auto_3372 - PLACE
      ?auto_3378 - HOIST
      ?auto_3368 - SURFACE
      ?auto_3367 - SURFACE
      ?auto_3371 - SURFACE
      ?auto_3366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3365 ?auto_3361 ) ( IS-CRATE ?auto_3360 ) ( not ( = ?auto_3364 ?auto_3361 ) ) ( HOIST-AT ?auto_3362 ?auto_3364 ) ( AVAILABLE ?auto_3362 ) ( SURFACE-AT ?auto_3360 ?auto_3364 ) ( ON ?auto_3360 ?auto_3363 ) ( CLEAR ?auto_3360 ) ( not ( = ?auto_3359 ?auto_3360 ) ) ( not ( = ?auto_3359 ?auto_3363 ) ) ( not ( = ?auto_3360 ?auto_3363 ) ) ( not ( = ?auto_3365 ?auto_3362 ) ) ( IS-CRATE ?auto_3359 ) ( not ( = ?auto_3376 ?auto_3361 ) ) ( HOIST-AT ?auto_3380 ?auto_3376 ) ( AVAILABLE ?auto_3380 ) ( SURFACE-AT ?auto_3359 ?auto_3376 ) ( ON ?auto_3359 ?auto_3377 ) ( CLEAR ?auto_3359 ) ( not ( = ?auto_3358 ?auto_3359 ) ) ( not ( = ?auto_3358 ?auto_3377 ) ) ( not ( = ?auto_3359 ?auto_3377 ) ) ( not ( = ?auto_3365 ?auto_3380 ) ) ( IS-CRATE ?auto_3358 ) ( not ( = ?auto_3379 ?auto_3361 ) ) ( HOIST-AT ?auto_3373 ?auto_3379 ) ( AVAILABLE ?auto_3373 ) ( SURFACE-AT ?auto_3358 ?auto_3379 ) ( ON ?auto_3358 ?auto_3369 ) ( CLEAR ?auto_3358 ) ( not ( = ?auto_3357 ?auto_3358 ) ) ( not ( = ?auto_3357 ?auto_3369 ) ) ( not ( = ?auto_3358 ?auto_3369 ) ) ( not ( = ?auto_3365 ?auto_3373 ) ) ( IS-CRATE ?auto_3357 ) ( not ( = ?auto_3370 ?auto_3361 ) ) ( HOIST-AT ?auto_3374 ?auto_3370 ) ( SURFACE-AT ?auto_3357 ?auto_3370 ) ( ON ?auto_3357 ?auto_3375 ) ( CLEAR ?auto_3357 ) ( not ( = ?auto_3356 ?auto_3357 ) ) ( not ( = ?auto_3356 ?auto_3375 ) ) ( not ( = ?auto_3357 ?auto_3375 ) ) ( not ( = ?auto_3365 ?auto_3374 ) ) ( IS-CRATE ?auto_3356 ) ( not ( = ?auto_3372 ?auto_3361 ) ) ( HOIST-AT ?auto_3378 ?auto_3372 ) ( SURFACE-AT ?auto_3356 ?auto_3372 ) ( ON ?auto_3356 ?auto_3368 ) ( CLEAR ?auto_3356 ) ( not ( = ?auto_3355 ?auto_3356 ) ) ( not ( = ?auto_3355 ?auto_3368 ) ) ( not ( = ?auto_3356 ?auto_3368 ) ) ( not ( = ?auto_3365 ?auto_3378 ) ) ( IS-CRATE ?auto_3355 ) ( AVAILABLE ?auto_3374 ) ( SURFACE-AT ?auto_3355 ?auto_3370 ) ( ON ?auto_3355 ?auto_3367 ) ( CLEAR ?auto_3355 ) ( not ( = ?auto_3354 ?auto_3355 ) ) ( not ( = ?auto_3354 ?auto_3367 ) ) ( not ( = ?auto_3355 ?auto_3367 ) ) ( SURFACE-AT ?auto_3353 ?auto_3361 ) ( CLEAR ?auto_3353 ) ( IS-CRATE ?auto_3354 ) ( AVAILABLE ?auto_3365 ) ( AVAILABLE ?auto_3378 ) ( SURFACE-AT ?auto_3354 ?auto_3372 ) ( ON ?auto_3354 ?auto_3371 ) ( CLEAR ?auto_3354 ) ( TRUCK-AT ?auto_3366 ?auto_3361 ) ( not ( = ?auto_3353 ?auto_3354 ) ) ( not ( = ?auto_3353 ?auto_3371 ) ) ( not ( = ?auto_3354 ?auto_3371 ) ) ( not ( = ?auto_3353 ?auto_3355 ) ) ( not ( = ?auto_3353 ?auto_3367 ) ) ( not ( = ?auto_3355 ?auto_3371 ) ) ( not ( = ?auto_3370 ?auto_3372 ) ) ( not ( = ?auto_3374 ?auto_3378 ) ) ( not ( = ?auto_3367 ?auto_3371 ) ) ( not ( = ?auto_3353 ?auto_3356 ) ) ( not ( = ?auto_3353 ?auto_3368 ) ) ( not ( = ?auto_3354 ?auto_3356 ) ) ( not ( = ?auto_3354 ?auto_3368 ) ) ( not ( = ?auto_3356 ?auto_3367 ) ) ( not ( = ?auto_3356 ?auto_3371 ) ) ( not ( = ?auto_3368 ?auto_3367 ) ) ( not ( = ?auto_3368 ?auto_3371 ) ) ( not ( = ?auto_3353 ?auto_3357 ) ) ( not ( = ?auto_3353 ?auto_3375 ) ) ( not ( = ?auto_3354 ?auto_3357 ) ) ( not ( = ?auto_3354 ?auto_3375 ) ) ( not ( = ?auto_3355 ?auto_3357 ) ) ( not ( = ?auto_3355 ?auto_3375 ) ) ( not ( = ?auto_3357 ?auto_3368 ) ) ( not ( = ?auto_3357 ?auto_3367 ) ) ( not ( = ?auto_3357 ?auto_3371 ) ) ( not ( = ?auto_3375 ?auto_3368 ) ) ( not ( = ?auto_3375 ?auto_3367 ) ) ( not ( = ?auto_3375 ?auto_3371 ) ) ( not ( = ?auto_3353 ?auto_3358 ) ) ( not ( = ?auto_3353 ?auto_3369 ) ) ( not ( = ?auto_3354 ?auto_3358 ) ) ( not ( = ?auto_3354 ?auto_3369 ) ) ( not ( = ?auto_3355 ?auto_3358 ) ) ( not ( = ?auto_3355 ?auto_3369 ) ) ( not ( = ?auto_3356 ?auto_3358 ) ) ( not ( = ?auto_3356 ?auto_3369 ) ) ( not ( = ?auto_3358 ?auto_3375 ) ) ( not ( = ?auto_3358 ?auto_3368 ) ) ( not ( = ?auto_3358 ?auto_3367 ) ) ( not ( = ?auto_3358 ?auto_3371 ) ) ( not ( = ?auto_3379 ?auto_3370 ) ) ( not ( = ?auto_3379 ?auto_3372 ) ) ( not ( = ?auto_3373 ?auto_3374 ) ) ( not ( = ?auto_3373 ?auto_3378 ) ) ( not ( = ?auto_3369 ?auto_3375 ) ) ( not ( = ?auto_3369 ?auto_3368 ) ) ( not ( = ?auto_3369 ?auto_3367 ) ) ( not ( = ?auto_3369 ?auto_3371 ) ) ( not ( = ?auto_3353 ?auto_3359 ) ) ( not ( = ?auto_3353 ?auto_3377 ) ) ( not ( = ?auto_3354 ?auto_3359 ) ) ( not ( = ?auto_3354 ?auto_3377 ) ) ( not ( = ?auto_3355 ?auto_3359 ) ) ( not ( = ?auto_3355 ?auto_3377 ) ) ( not ( = ?auto_3356 ?auto_3359 ) ) ( not ( = ?auto_3356 ?auto_3377 ) ) ( not ( = ?auto_3357 ?auto_3359 ) ) ( not ( = ?auto_3357 ?auto_3377 ) ) ( not ( = ?auto_3359 ?auto_3369 ) ) ( not ( = ?auto_3359 ?auto_3375 ) ) ( not ( = ?auto_3359 ?auto_3368 ) ) ( not ( = ?auto_3359 ?auto_3367 ) ) ( not ( = ?auto_3359 ?auto_3371 ) ) ( not ( = ?auto_3376 ?auto_3379 ) ) ( not ( = ?auto_3376 ?auto_3370 ) ) ( not ( = ?auto_3376 ?auto_3372 ) ) ( not ( = ?auto_3380 ?auto_3373 ) ) ( not ( = ?auto_3380 ?auto_3374 ) ) ( not ( = ?auto_3380 ?auto_3378 ) ) ( not ( = ?auto_3377 ?auto_3369 ) ) ( not ( = ?auto_3377 ?auto_3375 ) ) ( not ( = ?auto_3377 ?auto_3368 ) ) ( not ( = ?auto_3377 ?auto_3367 ) ) ( not ( = ?auto_3377 ?auto_3371 ) ) ( not ( = ?auto_3353 ?auto_3360 ) ) ( not ( = ?auto_3353 ?auto_3363 ) ) ( not ( = ?auto_3354 ?auto_3360 ) ) ( not ( = ?auto_3354 ?auto_3363 ) ) ( not ( = ?auto_3355 ?auto_3360 ) ) ( not ( = ?auto_3355 ?auto_3363 ) ) ( not ( = ?auto_3356 ?auto_3360 ) ) ( not ( = ?auto_3356 ?auto_3363 ) ) ( not ( = ?auto_3357 ?auto_3360 ) ) ( not ( = ?auto_3357 ?auto_3363 ) ) ( not ( = ?auto_3358 ?auto_3360 ) ) ( not ( = ?auto_3358 ?auto_3363 ) ) ( not ( = ?auto_3360 ?auto_3377 ) ) ( not ( = ?auto_3360 ?auto_3369 ) ) ( not ( = ?auto_3360 ?auto_3375 ) ) ( not ( = ?auto_3360 ?auto_3368 ) ) ( not ( = ?auto_3360 ?auto_3367 ) ) ( not ( = ?auto_3360 ?auto_3371 ) ) ( not ( = ?auto_3364 ?auto_3376 ) ) ( not ( = ?auto_3364 ?auto_3379 ) ) ( not ( = ?auto_3364 ?auto_3370 ) ) ( not ( = ?auto_3364 ?auto_3372 ) ) ( not ( = ?auto_3362 ?auto_3380 ) ) ( not ( = ?auto_3362 ?auto_3373 ) ) ( not ( = ?auto_3362 ?auto_3374 ) ) ( not ( = ?auto_3362 ?auto_3378 ) ) ( not ( = ?auto_3363 ?auto_3377 ) ) ( not ( = ?auto_3363 ?auto_3369 ) ) ( not ( = ?auto_3363 ?auto_3375 ) ) ( not ( = ?auto_3363 ?auto_3368 ) ) ( not ( = ?auto_3363 ?auto_3367 ) ) ( not ( = ?auto_3363 ?auto_3371 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_3353 ?auto_3354 ?auto_3355 ?auto_3356 ?auto_3357 ?auto_3358 ?auto_3359 )
      ( MAKE-1CRATE ?auto_3359 ?auto_3360 )
      ( MAKE-7CRATE-VERIFY ?auto_3353 ?auto_3354 ?auto_3355 ?auto_3356 ?auto_3357 ?auto_3358 ?auto_3359 ?auto_3360 ) )
  )

)

