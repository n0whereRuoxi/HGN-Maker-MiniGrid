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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3184 - SURFACE
      ?auto_3185 - SURFACE
    )
    :vars
    (
      ?auto_3186 - HOIST
      ?auto_3187 - PLACE
      ?auto_3189 - PLACE
      ?auto_3190 - HOIST
      ?auto_3191 - SURFACE
      ?auto_3188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3186 ?auto_3187 ) ( SURFACE-AT ?auto_3184 ?auto_3187 ) ( CLEAR ?auto_3184 ) ( IS-CRATE ?auto_3185 ) ( AVAILABLE ?auto_3186 ) ( not ( = ?auto_3189 ?auto_3187 ) ) ( HOIST-AT ?auto_3190 ?auto_3189 ) ( AVAILABLE ?auto_3190 ) ( SURFACE-AT ?auto_3185 ?auto_3189 ) ( ON ?auto_3185 ?auto_3191 ) ( CLEAR ?auto_3185 ) ( TRUCK-AT ?auto_3188 ?auto_3187 ) ( not ( = ?auto_3184 ?auto_3185 ) ) ( not ( = ?auto_3184 ?auto_3191 ) ) ( not ( = ?auto_3185 ?auto_3191 ) ) ( not ( = ?auto_3186 ?auto_3190 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3188 ?auto_3187 ?auto_3189 )
      ( !LIFT ?auto_3190 ?auto_3185 ?auto_3191 ?auto_3189 )
      ( !LOAD ?auto_3190 ?auto_3185 ?auto_3188 ?auto_3189 )
      ( !DRIVE ?auto_3188 ?auto_3189 ?auto_3187 )
      ( !UNLOAD ?auto_3186 ?auto_3185 ?auto_3188 ?auto_3187 )
      ( !DROP ?auto_3186 ?auto_3185 ?auto_3184 ?auto_3187 )
      ( MAKE-1CRATE-VERIFY ?auto_3184 ?auto_3185 ) )
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
      ?auto_3203 - HOIST
      ?auto_3200 - PLACE
      ?auto_3201 - PLACE
      ?auto_3202 - HOIST
      ?auto_3198 - SURFACE
      ?auto_3206 - PLACE
      ?auto_3205 - HOIST
      ?auto_3204 - SURFACE
      ?auto_3199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3203 ?auto_3200 ) ( IS-CRATE ?auto_3197 ) ( not ( = ?auto_3201 ?auto_3200 ) ) ( HOIST-AT ?auto_3202 ?auto_3201 ) ( AVAILABLE ?auto_3202 ) ( SURFACE-AT ?auto_3197 ?auto_3201 ) ( ON ?auto_3197 ?auto_3198 ) ( CLEAR ?auto_3197 ) ( not ( = ?auto_3196 ?auto_3197 ) ) ( not ( = ?auto_3196 ?auto_3198 ) ) ( not ( = ?auto_3197 ?auto_3198 ) ) ( not ( = ?auto_3203 ?auto_3202 ) ) ( SURFACE-AT ?auto_3195 ?auto_3200 ) ( CLEAR ?auto_3195 ) ( IS-CRATE ?auto_3196 ) ( AVAILABLE ?auto_3203 ) ( not ( = ?auto_3206 ?auto_3200 ) ) ( HOIST-AT ?auto_3205 ?auto_3206 ) ( AVAILABLE ?auto_3205 ) ( SURFACE-AT ?auto_3196 ?auto_3206 ) ( ON ?auto_3196 ?auto_3204 ) ( CLEAR ?auto_3196 ) ( TRUCK-AT ?auto_3199 ?auto_3200 ) ( not ( = ?auto_3195 ?auto_3196 ) ) ( not ( = ?auto_3195 ?auto_3204 ) ) ( not ( = ?auto_3196 ?auto_3204 ) ) ( not ( = ?auto_3203 ?auto_3205 ) ) ( not ( = ?auto_3195 ?auto_3197 ) ) ( not ( = ?auto_3195 ?auto_3198 ) ) ( not ( = ?auto_3197 ?auto_3204 ) ) ( not ( = ?auto_3201 ?auto_3206 ) ) ( not ( = ?auto_3202 ?auto_3205 ) ) ( not ( = ?auto_3198 ?auto_3204 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3195 ?auto_3196 )
      ( MAKE-1CRATE ?auto_3196 ?auto_3197 )
      ( MAKE-2CRATE-VERIFY ?auto_3195 ?auto_3196 ?auto_3197 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3209 - SURFACE
      ?auto_3210 - SURFACE
    )
    :vars
    (
      ?auto_3211 - HOIST
      ?auto_3212 - PLACE
      ?auto_3214 - PLACE
      ?auto_3215 - HOIST
      ?auto_3216 - SURFACE
      ?auto_3213 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3211 ?auto_3212 ) ( SURFACE-AT ?auto_3209 ?auto_3212 ) ( CLEAR ?auto_3209 ) ( IS-CRATE ?auto_3210 ) ( AVAILABLE ?auto_3211 ) ( not ( = ?auto_3214 ?auto_3212 ) ) ( HOIST-AT ?auto_3215 ?auto_3214 ) ( AVAILABLE ?auto_3215 ) ( SURFACE-AT ?auto_3210 ?auto_3214 ) ( ON ?auto_3210 ?auto_3216 ) ( CLEAR ?auto_3210 ) ( TRUCK-AT ?auto_3213 ?auto_3212 ) ( not ( = ?auto_3209 ?auto_3210 ) ) ( not ( = ?auto_3209 ?auto_3216 ) ) ( not ( = ?auto_3210 ?auto_3216 ) ) ( not ( = ?auto_3211 ?auto_3215 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3213 ?auto_3212 ?auto_3214 )
      ( !LIFT ?auto_3215 ?auto_3210 ?auto_3216 ?auto_3214 )
      ( !LOAD ?auto_3215 ?auto_3210 ?auto_3213 ?auto_3214 )
      ( !DRIVE ?auto_3213 ?auto_3214 ?auto_3212 )
      ( !UNLOAD ?auto_3211 ?auto_3210 ?auto_3213 ?auto_3212 )
      ( !DROP ?auto_3211 ?auto_3210 ?auto_3209 ?auto_3212 )
      ( MAKE-1CRATE-VERIFY ?auto_3209 ?auto_3210 ) )
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
      ?auto_3226 - PLACE
      ?auto_3229 - PLACE
      ?auto_3227 - HOIST
      ?auto_3230 - SURFACE
      ?auto_3236 - PLACE
      ?auto_3234 - HOIST
      ?auto_3235 - SURFACE
      ?auto_3233 - PLACE
      ?auto_3232 - HOIST
      ?auto_3231 - SURFACE
      ?auto_3225 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3228 ?auto_3226 ) ( IS-CRATE ?auto_3224 ) ( not ( = ?auto_3229 ?auto_3226 ) ) ( HOIST-AT ?auto_3227 ?auto_3229 ) ( AVAILABLE ?auto_3227 ) ( SURFACE-AT ?auto_3224 ?auto_3229 ) ( ON ?auto_3224 ?auto_3230 ) ( CLEAR ?auto_3224 ) ( not ( = ?auto_3223 ?auto_3224 ) ) ( not ( = ?auto_3223 ?auto_3230 ) ) ( not ( = ?auto_3224 ?auto_3230 ) ) ( not ( = ?auto_3228 ?auto_3227 ) ) ( IS-CRATE ?auto_3223 ) ( not ( = ?auto_3236 ?auto_3226 ) ) ( HOIST-AT ?auto_3234 ?auto_3236 ) ( AVAILABLE ?auto_3234 ) ( SURFACE-AT ?auto_3223 ?auto_3236 ) ( ON ?auto_3223 ?auto_3235 ) ( CLEAR ?auto_3223 ) ( not ( = ?auto_3222 ?auto_3223 ) ) ( not ( = ?auto_3222 ?auto_3235 ) ) ( not ( = ?auto_3223 ?auto_3235 ) ) ( not ( = ?auto_3228 ?auto_3234 ) ) ( SURFACE-AT ?auto_3221 ?auto_3226 ) ( CLEAR ?auto_3221 ) ( IS-CRATE ?auto_3222 ) ( AVAILABLE ?auto_3228 ) ( not ( = ?auto_3233 ?auto_3226 ) ) ( HOIST-AT ?auto_3232 ?auto_3233 ) ( AVAILABLE ?auto_3232 ) ( SURFACE-AT ?auto_3222 ?auto_3233 ) ( ON ?auto_3222 ?auto_3231 ) ( CLEAR ?auto_3222 ) ( TRUCK-AT ?auto_3225 ?auto_3226 ) ( not ( = ?auto_3221 ?auto_3222 ) ) ( not ( = ?auto_3221 ?auto_3231 ) ) ( not ( = ?auto_3222 ?auto_3231 ) ) ( not ( = ?auto_3228 ?auto_3232 ) ) ( not ( = ?auto_3221 ?auto_3223 ) ) ( not ( = ?auto_3221 ?auto_3235 ) ) ( not ( = ?auto_3223 ?auto_3231 ) ) ( not ( = ?auto_3236 ?auto_3233 ) ) ( not ( = ?auto_3234 ?auto_3232 ) ) ( not ( = ?auto_3235 ?auto_3231 ) ) ( not ( = ?auto_3221 ?auto_3224 ) ) ( not ( = ?auto_3221 ?auto_3230 ) ) ( not ( = ?auto_3222 ?auto_3224 ) ) ( not ( = ?auto_3222 ?auto_3230 ) ) ( not ( = ?auto_3224 ?auto_3235 ) ) ( not ( = ?auto_3224 ?auto_3231 ) ) ( not ( = ?auto_3229 ?auto_3236 ) ) ( not ( = ?auto_3229 ?auto_3233 ) ) ( not ( = ?auto_3227 ?auto_3234 ) ) ( not ( = ?auto_3227 ?auto_3232 ) ) ( not ( = ?auto_3230 ?auto_3235 ) ) ( not ( = ?auto_3230 ?auto_3231 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3221 ?auto_3222 ?auto_3223 )
      ( MAKE-1CRATE ?auto_3223 ?auto_3224 )
      ( MAKE-3CRATE-VERIFY ?auto_3221 ?auto_3222 ?auto_3223 ?auto_3224 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3239 - SURFACE
      ?auto_3240 - SURFACE
    )
    :vars
    (
      ?auto_3241 - HOIST
      ?auto_3242 - PLACE
      ?auto_3244 - PLACE
      ?auto_3245 - HOIST
      ?auto_3246 - SURFACE
      ?auto_3243 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3241 ?auto_3242 ) ( SURFACE-AT ?auto_3239 ?auto_3242 ) ( CLEAR ?auto_3239 ) ( IS-CRATE ?auto_3240 ) ( AVAILABLE ?auto_3241 ) ( not ( = ?auto_3244 ?auto_3242 ) ) ( HOIST-AT ?auto_3245 ?auto_3244 ) ( AVAILABLE ?auto_3245 ) ( SURFACE-AT ?auto_3240 ?auto_3244 ) ( ON ?auto_3240 ?auto_3246 ) ( CLEAR ?auto_3240 ) ( TRUCK-AT ?auto_3243 ?auto_3242 ) ( not ( = ?auto_3239 ?auto_3240 ) ) ( not ( = ?auto_3239 ?auto_3246 ) ) ( not ( = ?auto_3240 ?auto_3246 ) ) ( not ( = ?auto_3241 ?auto_3245 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3243 ?auto_3242 ?auto_3244 )
      ( !LIFT ?auto_3245 ?auto_3240 ?auto_3246 ?auto_3244 )
      ( !LOAD ?auto_3245 ?auto_3240 ?auto_3243 ?auto_3244 )
      ( !DRIVE ?auto_3243 ?auto_3244 ?auto_3242 )
      ( !UNLOAD ?auto_3241 ?auto_3240 ?auto_3243 ?auto_3242 )
      ( !DROP ?auto_3241 ?auto_3240 ?auto_3239 ?auto_3242 )
      ( MAKE-1CRATE-VERIFY ?auto_3239 ?auto_3240 ) )
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
      ?auto_3261 - HOIST
      ?auto_3262 - PLACE
      ?auto_3260 - PLACE
      ?auto_3259 - HOIST
      ?auto_3257 - SURFACE
      ?auto_3265 - PLACE
      ?auto_3263 - HOIST
      ?auto_3264 - SURFACE
      ?auto_3266 - PLACE
      ?auto_3268 - HOIST
      ?auto_3267 - SURFACE
      ?auto_3269 - SURFACE
      ?auto_3258 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3261 ?auto_3262 ) ( IS-CRATE ?auto_3256 ) ( not ( = ?auto_3260 ?auto_3262 ) ) ( HOIST-AT ?auto_3259 ?auto_3260 ) ( SURFACE-AT ?auto_3256 ?auto_3260 ) ( ON ?auto_3256 ?auto_3257 ) ( CLEAR ?auto_3256 ) ( not ( = ?auto_3255 ?auto_3256 ) ) ( not ( = ?auto_3255 ?auto_3257 ) ) ( not ( = ?auto_3256 ?auto_3257 ) ) ( not ( = ?auto_3261 ?auto_3259 ) ) ( IS-CRATE ?auto_3255 ) ( not ( = ?auto_3265 ?auto_3262 ) ) ( HOIST-AT ?auto_3263 ?auto_3265 ) ( AVAILABLE ?auto_3263 ) ( SURFACE-AT ?auto_3255 ?auto_3265 ) ( ON ?auto_3255 ?auto_3264 ) ( CLEAR ?auto_3255 ) ( not ( = ?auto_3254 ?auto_3255 ) ) ( not ( = ?auto_3254 ?auto_3264 ) ) ( not ( = ?auto_3255 ?auto_3264 ) ) ( not ( = ?auto_3261 ?auto_3263 ) ) ( IS-CRATE ?auto_3254 ) ( not ( = ?auto_3266 ?auto_3262 ) ) ( HOIST-AT ?auto_3268 ?auto_3266 ) ( AVAILABLE ?auto_3268 ) ( SURFACE-AT ?auto_3254 ?auto_3266 ) ( ON ?auto_3254 ?auto_3267 ) ( CLEAR ?auto_3254 ) ( not ( = ?auto_3253 ?auto_3254 ) ) ( not ( = ?auto_3253 ?auto_3267 ) ) ( not ( = ?auto_3254 ?auto_3267 ) ) ( not ( = ?auto_3261 ?auto_3268 ) ) ( SURFACE-AT ?auto_3252 ?auto_3262 ) ( CLEAR ?auto_3252 ) ( IS-CRATE ?auto_3253 ) ( AVAILABLE ?auto_3261 ) ( AVAILABLE ?auto_3259 ) ( SURFACE-AT ?auto_3253 ?auto_3260 ) ( ON ?auto_3253 ?auto_3269 ) ( CLEAR ?auto_3253 ) ( TRUCK-AT ?auto_3258 ?auto_3262 ) ( not ( = ?auto_3252 ?auto_3253 ) ) ( not ( = ?auto_3252 ?auto_3269 ) ) ( not ( = ?auto_3253 ?auto_3269 ) ) ( not ( = ?auto_3252 ?auto_3254 ) ) ( not ( = ?auto_3252 ?auto_3267 ) ) ( not ( = ?auto_3254 ?auto_3269 ) ) ( not ( = ?auto_3266 ?auto_3260 ) ) ( not ( = ?auto_3268 ?auto_3259 ) ) ( not ( = ?auto_3267 ?auto_3269 ) ) ( not ( = ?auto_3252 ?auto_3255 ) ) ( not ( = ?auto_3252 ?auto_3264 ) ) ( not ( = ?auto_3253 ?auto_3255 ) ) ( not ( = ?auto_3253 ?auto_3264 ) ) ( not ( = ?auto_3255 ?auto_3267 ) ) ( not ( = ?auto_3255 ?auto_3269 ) ) ( not ( = ?auto_3265 ?auto_3266 ) ) ( not ( = ?auto_3265 ?auto_3260 ) ) ( not ( = ?auto_3263 ?auto_3268 ) ) ( not ( = ?auto_3263 ?auto_3259 ) ) ( not ( = ?auto_3264 ?auto_3267 ) ) ( not ( = ?auto_3264 ?auto_3269 ) ) ( not ( = ?auto_3252 ?auto_3256 ) ) ( not ( = ?auto_3252 ?auto_3257 ) ) ( not ( = ?auto_3253 ?auto_3256 ) ) ( not ( = ?auto_3253 ?auto_3257 ) ) ( not ( = ?auto_3254 ?auto_3256 ) ) ( not ( = ?auto_3254 ?auto_3257 ) ) ( not ( = ?auto_3256 ?auto_3264 ) ) ( not ( = ?auto_3256 ?auto_3267 ) ) ( not ( = ?auto_3256 ?auto_3269 ) ) ( not ( = ?auto_3257 ?auto_3264 ) ) ( not ( = ?auto_3257 ?auto_3267 ) ) ( not ( = ?auto_3257 ?auto_3269 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3252 ?auto_3253 ?auto_3254 ?auto_3255 )
      ( MAKE-1CRATE ?auto_3255 ?auto_3256 )
      ( MAKE-4CRATE-VERIFY ?auto_3252 ?auto_3253 ?auto_3254 ?auto_3255 ?auto_3256 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3272 - SURFACE
      ?auto_3273 - SURFACE
    )
    :vars
    (
      ?auto_3274 - HOIST
      ?auto_3275 - PLACE
      ?auto_3277 - PLACE
      ?auto_3278 - HOIST
      ?auto_3279 - SURFACE
      ?auto_3276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3274 ?auto_3275 ) ( SURFACE-AT ?auto_3272 ?auto_3275 ) ( CLEAR ?auto_3272 ) ( IS-CRATE ?auto_3273 ) ( AVAILABLE ?auto_3274 ) ( not ( = ?auto_3277 ?auto_3275 ) ) ( HOIST-AT ?auto_3278 ?auto_3277 ) ( AVAILABLE ?auto_3278 ) ( SURFACE-AT ?auto_3273 ?auto_3277 ) ( ON ?auto_3273 ?auto_3279 ) ( CLEAR ?auto_3273 ) ( TRUCK-AT ?auto_3276 ?auto_3275 ) ( not ( = ?auto_3272 ?auto_3273 ) ) ( not ( = ?auto_3272 ?auto_3279 ) ) ( not ( = ?auto_3273 ?auto_3279 ) ) ( not ( = ?auto_3274 ?auto_3278 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3276 ?auto_3275 ?auto_3277 )
      ( !LIFT ?auto_3278 ?auto_3273 ?auto_3279 ?auto_3277 )
      ( !LOAD ?auto_3278 ?auto_3273 ?auto_3276 ?auto_3277 )
      ( !DRIVE ?auto_3276 ?auto_3277 ?auto_3275 )
      ( !UNLOAD ?auto_3274 ?auto_3273 ?auto_3276 ?auto_3275 )
      ( !DROP ?auto_3274 ?auto_3273 ?auto_3272 ?auto_3275 )
      ( MAKE-1CRATE-VERIFY ?auto_3272 ?auto_3273 ) )
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
      ?auto_3297 - HOIST
      ?auto_3294 - PLACE
      ?auto_3295 - PLACE
      ?auto_3293 - HOIST
      ?auto_3292 - SURFACE
      ?auto_3303 - PLACE
      ?auto_3306 - HOIST
      ?auto_3299 - SURFACE
      ?auto_3301 - PLACE
      ?auto_3307 - HOIST
      ?auto_3302 - SURFACE
      ?auto_3298 - PLACE
      ?auto_3305 - HOIST
      ?auto_3300 - SURFACE
      ?auto_3304 - SURFACE
      ?auto_3296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3297 ?auto_3294 ) ( IS-CRATE ?auto_3291 ) ( not ( = ?auto_3295 ?auto_3294 ) ) ( HOIST-AT ?auto_3293 ?auto_3295 ) ( AVAILABLE ?auto_3293 ) ( SURFACE-AT ?auto_3291 ?auto_3295 ) ( ON ?auto_3291 ?auto_3292 ) ( CLEAR ?auto_3291 ) ( not ( = ?auto_3290 ?auto_3291 ) ) ( not ( = ?auto_3290 ?auto_3292 ) ) ( not ( = ?auto_3291 ?auto_3292 ) ) ( not ( = ?auto_3297 ?auto_3293 ) ) ( IS-CRATE ?auto_3290 ) ( not ( = ?auto_3303 ?auto_3294 ) ) ( HOIST-AT ?auto_3306 ?auto_3303 ) ( SURFACE-AT ?auto_3290 ?auto_3303 ) ( ON ?auto_3290 ?auto_3299 ) ( CLEAR ?auto_3290 ) ( not ( = ?auto_3289 ?auto_3290 ) ) ( not ( = ?auto_3289 ?auto_3299 ) ) ( not ( = ?auto_3290 ?auto_3299 ) ) ( not ( = ?auto_3297 ?auto_3306 ) ) ( IS-CRATE ?auto_3289 ) ( not ( = ?auto_3301 ?auto_3294 ) ) ( HOIST-AT ?auto_3307 ?auto_3301 ) ( AVAILABLE ?auto_3307 ) ( SURFACE-AT ?auto_3289 ?auto_3301 ) ( ON ?auto_3289 ?auto_3302 ) ( CLEAR ?auto_3289 ) ( not ( = ?auto_3288 ?auto_3289 ) ) ( not ( = ?auto_3288 ?auto_3302 ) ) ( not ( = ?auto_3289 ?auto_3302 ) ) ( not ( = ?auto_3297 ?auto_3307 ) ) ( IS-CRATE ?auto_3288 ) ( not ( = ?auto_3298 ?auto_3294 ) ) ( HOIST-AT ?auto_3305 ?auto_3298 ) ( AVAILABLE ?auto_3305 ) ( SURFACE-AT ?auto_3288 ?auto_3298 ) ( ON ?auto_3288 ?auto_3300 ) ( CLEAR ?auto_3288 ) ( not ( = ?auto_3287 ?auto_3288 ) ) ( not ( = ?auto_3287 ?auto_3300 ) ) ( not ( = ?auto_3288 ?auto_3300 ) ) ( not ( = ?auto_3297 ?auto_3305 ) ) ( SURFACE-AT ?auto_3286 ?auto_3294 ) ( CLEAR ?auto_3286 ) ( IS-CRATE ?auto_3287 ) ( AVAILABLE ?auto_3297 ) ( AVAILABLE ?auto_3306 ) ( SURFACE-AT ?auto_3287 ?auto_3303 ) ( ON ?auto_3287 ?auto_3304 ) ( CLEAR ?auto_3287 ) ( TRUCK-AT ?auto_3296 ?auto_3294 ) ( not ( = ?auto_3286 ?auto_3287 ) ) ( not ( = ?auto_3286 ?auto_3304 ) ) ( not ( = ?auto_3287 ?auto_3304 ) ) ( not ( = ?auto_3286 ?auto_3288 ) ) ( not ( = ?auto_3286 ?auto_3300 ) ) ( not ( = ?auto_3288 ?auto_3304 ) ) ( not ( = ?auto_3298 ?auto_3303 ) ) ( not ( = ?auto_3305 ?auto_3306 ) ) ( not ( = ?auto_3300 ?auto_3304 ) ) ( not ( = ?auto_3286 ?auto_3289 ) ) ( not ( = ?auto_3286 ?auto_3302 ) ) ( not ( = ?auto_3287 ?auto_3289 ) ) ( not ( = ?auto_3287 ?auto_3302 ) ) ( not ( = ?auto_3289 ?auto_3300 ) ) ( not ( = ?auto_3289 ?auto_3304 ) ) ( not ( = ?auto_3301 ?auto_3298 ) ) ( not ( = ?auto_3301 ?auto_3303 ) ) ( not ( = ?auto_3307 ?auto_3305 ) ) ( not ( = ?auto_3307 ?auto_3306 ) ) ( not ( = ?auto_3302 ?auto_3300 ) ) ( not ( = ?auto_3302 ?auto_3304 ) ) ( not ( = ?auto_3286 ?auto_3290 ) ) ( not ( = ?auto_3286 ?auto_3299 ) ) ( not ( = ?auto_3287 ?auto_3290 ) ) ( not ( = ?auto_3287 ?auto_3299 ) ) ( not ( = ?auto_3288 ?auto_3290 ) ) ( not ( = ?auto_3288 ?auto_3299 ) ) ( not ( = ?auto_3290 ?auto_3302 ) ) ( not ( = ?auto_3290 ?auto_3300 ) ) ( not ( = ?auto_3290 ?auto_3304 ) ) ( not ( = ?auto_3299 ?auto_3302 ) ) ( not ( = ?auto_3299 ?auto_3300 ) ) ( not ( = ?auto_3299 ?auto_3304 ) ) ( not ( = ?auto_3286 ?auto_3291 ) ) ( not ( = ?auto_3286 ?auto_3292 ) ) ( not ( = ?auto_3287 ?auto_3291 ) ) ( not ( = ?auto_3287 ?auto_3292 ) ) ( not ( = ?auto_3288 ?auto_3291 ) ) ( not ( = ?auto_3288 ?auto_3292 ) ) ( not ( = ?auto_3289 ?auto_3291 ) ) ( not ( = ?auto_3289 ?auto_3292 ) ) ( not ( = ?auto_3291 ?auto_3299 ) ) ( not ( = ?auto_3291 ?auto_3302 ) ) ( not ( = ?auto_3291 ?auto_3300 ) ) ( not ( = ?auto_3291 ?auto_3304 ) ) ( not ( = ?auto_3295 ?auto_3303 ) ) ( not ( = ?auto_3295 ?auto_3301 ) ) ( not ( = ?auto_3295 ?auto_3298 ) ) ( not ( = ?auto_3293 ?auto_3306 ) ) ( not ( = ?auto_3293 ?auto_3307 ) ) ( not ( = ?auto_3293 ?auto_3305 ) ) ( not ( = ?auto_3292 ?auto_3299 ) ) ( not ( = ?auto_3292 ?auto_3302 ) ) ( not ( = ?auto_3292 ?auto_3300 ) ) ( not ( = ?auto_3292 ?auto_3304 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_3286 ?auto_3287 ?auto_3288 ?auto_3289 ?auto_3290 )
      ( MAKE-1CRATE ?auto_3290 ?auto_3291 )
      ( MAKE-5CRATE-VERIFY ?auto_3286 ?auto_3287 ?auto_3288 ?auto_3289 ?auto_3290 ?auto_3291 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3310 - SURFACE
      ?auto_3311 - SURFACE
    )
    :vars
    (
      ?auto_3312 - HOIST
      ?auto_3313 - PLACE
      ?auto_3315 - PLACE
      ?auto_3316 - HOIST
      ?auto_3317 - SURFACE
      ?auto_3314 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3312 ?auto_3313 ) ( SURFACE-AT ?auto_3310 ?auto_3313 ) ( CLEAR ?auto_3310 ) ( IS-CRATE ?auto_3311 ) ( AVAILABLE ?auto_3312 ) ( not ( = ?auto_3315 ?auto_3313 ) ) ( HOIST-AT ?auto_3316 ?auto_3315 ) ( AVAILABLE ?auto_3316 ) ( SURFACE-AT ?auto_3311 ?auto_3315 ) ( ON ?auto_3311 ?auto_3317 ) ( CLEAR ?auto_3311 ) ( TRUCK-AT ?auto_3314 ?auto_3313 ) ( not ( = ?auto_3310 ?auto_3311 ) ) ( not ( = ?auto_3310 ?auto_3317 ) ) ( not ( = ?auto_3311 ?auto_3317 ) ) ( not ( = ?auto_3312 ?auto_3316 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3314 ?auto_3313 ?auto_3315 )
      ( !LIFT ?auto_3316 ?auto_3311 ?auto_3317 ?auto_3315 )
      ( !LOAD ?auto_3316 ?auto_3311 ?auto_3314 ?auto_3315 )
      ( !DRIVE ?auto_3314 ?auto_3315 ?auto_3313 )
      ( !UNLOAD ?auto_3312 ?auto_3311 ?auto_3314 ?auto_3313 )
      ( !DROP ?auto_3312 ?auto_3311 ?auto_3310 ?auto_3313 )
      ( MAKE-1CRATE-VERIFY ?auto_3310 ?auto_3311 ) )
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
      ?auto_3337 - PLACE
      ?auto_3335 - PLACE
      ?auto_3334 - HOIST
      ?auto_3336 - SURFACE
      ?auto_3346 - PLACE
      ?auto_3348 - HOIST
      ?auto_3350 - SURFACE
      ?auto_3343 - PLACE
      ?auto_3342 - HOIST
      ?auto_3341 - SURFACE
      ?auto_3338 - PLACE
      ?auto_3339 - HOIST
      ?auto_3349 - SURFACE
      ?auto_3345 - PLACE
      ?auto_3347 - HOIST
      ?auto_3340 - SURFACE
      ?auto_3344 - SURFACE
      ?auto_3333 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3332 ?auto_3337 ) ( IS-CRATE ?auto_3331 ) ( not ( = ?auto_3335 ?auto_3337 ) ) ( HOIST-AT ?auto_3334 ?auto_3335 ) ( AVAILABLE ?auto_3334 ) ( SURFACE-AT ?auto_3331 ?auto_3335 ) ( ON ?auto_3331 ?auto_3336 ) ( CLEAR ?auto_3331 ) ( not ( = ?auto_3330 ?auto_3331 ) ) ( not ( = ?auto_3330 ?auto_3336 ) ) ( not ( = ?auto_3331 ?auto_3336 ) ) ( not ( = ?auto_3332 ?auto_3334 ) ) ( IS-CRATE ?auto_3330 ) ( not ( = ?auto_3346 ?auto_3337 ) ) ( HOIST-AT ?auto_3348 ?auto_3346 ) ( AVAILABLE ?auto_3348 ) ( SURFACE-AT ?auto_3330 ?auto_3346 ) ( ON ?auto_3330 ?auto_3350 ) ( CLEAR ?auto_3330 ) ( not ( = ?auto_3329 ?auto_3330 ) ) ( not ( = ?auto_3329 ?auto_3350 ) ) ( not ( = ?auto_3330 ?auto_3350 ) ) ( not ( = ?auto_3332 ?auto_3348 ) ) ( IS-CRATE ?auto_3329 ) ( not ( = ?auto_3343 ?auto_3337 ) ) ( HOIST-AT ?auto_3342 ?auto_3343 ) ( SURFACE-AT ?auto_3329 ?auto_3343 ) ( ON ?auto_3329 ?auto_3341 ) ( CLEAR ?auto_3329 ) ( not ( = ?auto_3328 ?auto_3329 ) ) ( not ( = ?auto_3328 ?auto_3341 ) ) ( not ( = ?auto_3329 ?auto_3341 ) ) ( not ( = ?auto_3332 ?auto_3342 ) ) ( IS-CRATE ?auto_3328 ) ( not ( = ?auto_3338 ?auto_3337 ) ) ( HOIST-AT ?auto_3339 ?auto_3338 ) ( AVAILABLE ?auto_3339 ) ( SURFACE-AT ?auto_3328 ?auto_3338 ) ( ON ?auto_3328 ?auto_3349 ) ( CLEAR ?auto_3328 ) ( not ( = ?auto_3327 ?auto_3328 ) ) ( not ( = ?auto_3327 ?auto_3349 ) ) ( not ( = ?auto_3328 ?auto_3349 ) ) ( not ( = ?auto_3332 ?auto_3339 ) ) ( IS-CRATE ?auto_3327 ) ( not ( = ?auto_3345 ?auto_3337 ) ) ( HOIST-AT ?auto_3347 ?auto_3345 ) ( AVAILABLE ?auto_3347 ) ( SURFACE-AT ?auto_3327 ?auto_3345 ) ( ON ?auto_3327 ?auto_3340 ) ( CLEAR ?auto_3327 ) ( not ( = ?auto_3326 ?auto_3327 ) ) ( not ( = ?auto_3326 ?auto_3340 ) ) ( not ( = ?auto_3327 ?auto_3340 ) ) ( not ( = ?auto_3332 ?auto_3347 ) ) ( SURFACE-AT ?auto_3325 ?auto_3337 ) ( CLEAR ?auto_3325 ) ( IS-CRATE ?auto_3326 ) ( AVAILABLE ?auto_3332 ) ( AVAILABLE ?auto_3342 ) ( SURFACE-AT ?auto_3326 ?auto_3343 ) ( ON ?auto_3326 ?auto_3344 ) ( CLEAR ?auto_3326 ) ( TRUCK-AT ?auto_3333 ?auto_3337 ) ( not ( = ?auto_3325 ?auto_3326 ) ) ( not ( = ?auto_3325 ?auto_3344 ) ) ( not ( = ?auto_3326 ?auto_3344 ) ) ( not ( = ?auto_3325 ?auto_3327 ) ) ( not ( = ?auto_3325 ?auto_3340 ) ) ( not ( = ?auto_3327 ?auto_3344 ) ) ( not ( = ?auto_3345 ?auto_3343 ) ) ( not ( = ?auto_3347 ?auto_3342 ) ) ( not ( = ?auto_3340 ?auto_3344 ) ) ( not ( = ?auto_3325 ?auto_3328 ) ) ( not ( = ?auto_3325 ?auto_3349 ) ) ( not ( = ?auto_3326 ?auto_3328 ) ) ( not ( = ?auto_3326 ?auto_3349 ) ) ( not ( = ?auto_3328 ?auto_3340 ) ) ( not ( = ?auto_3328 ?auto_3344 ) ) ( not ( = ?auto_3338 ?auto_3345 ) ) ( not ( = ?auto_3338 ?auto_3343 ) ) ( not ( = ?auto_3339 ?auto_3347 ) ) ( not ( = ?auto_3339 ?auto_3342 ) ) ( not ( = ?auto_3349 ?auto_3340 ) ) ( not ( = ?auto_3349 ?auto_3344 ) ) ( not ( = ?auto_3325 ?auto_3329 ) ) ( not ( = ?auto_3325 ?auto_3341 ) ) ( not ( = ?auto_3326 ?auto_3329 ) ) ( not ( = ?auto_3326 ?auto_3341 ) ) ( not ( = ?auto_3327 ?auto_3329 ) ) ( not ( = ?auto_3327 ?auto_3341 ) ) ( not ( = ?auto_3329 ?auto_3349 ) ) ( not ( = ?auto_3329 ?auto_3340 ) ) ( not ( = ?auto_3329 ?auto_3344 ) ) ( not ( = ?auto_3341 ?auto_3349 ) ) ( not ( = ?auto_3341 ?auto_3340 ) ) ( not ( = ?auto_3341 ?auto_3344 ) ) ( not ( = ?auto_3325 ?auto_3330 ) ) ( not ( = ?auto_3325 ?auto_3350 ) ) ( not ( = ?auto_3326 ?auto_3330 ) ) ( not ( = ?auto_3326 ?auto_3350 ) ) ( not ( = ?auto_3327 ?auto_3330 ) ) ( not ( = ?auto_3327 ?auto_3350 ) ) ( not ( = ?auto_3328 ?auto_3330 ) ) ( not ( = ?auto_3328 ?auto_3350 ) ) ( not ( = ?auto_3330 ?auto_3341 ) ) ( not ( = ?auto_3330 ?auto_3349 ) ) ( not ( = ?auto_3330 ?auto_3340 ) ) ( not ( = ?auto_3330 ?auto_3344 ) ) ( not ( = ?auto_3346 ?auto_3343 ) ) ( not ( = ?auto_3346 ?auto_3338 ) ) ( not ( = ?auto_3346 ?auto_3345 ) ) ( not ( = ?auto_3348 ?auto_3342 ) ) ( not ( = ?auto_3348 ?auto_3339 ) ) ( not ( = ?auto_3348 ?auto_3347 ) ) ( not ( = ?auto_3350 ?auto_3341 ) ) ( not ( = ?auto_3350 ?auto_3349 ) ) ( not ( = ?auto_3350 ?auto_3340 ) ) ( not ( = ?auto_3350 ?auto_3344 ) ) ( not ( = ?auto_3325 ?auto_3331 ) ) ( not ( = ?auto_3325 ?auto_3336 ) ) ( not ( = ?auto_3326 ?auto_3331 ) ) ( not ( = ?auto_3326 ?auto_3336 ) ) ( not ( = ?auto_3327 ?auto_3331 ) ) ( not ( = ?auto_3327 ?auto_3336 ) ) ( not ( = ?auto_3328 ?auto_3331 ) ) ( not ( = ?auto_3328 ?auto_3336 ) ) ( not ( = ?auto_3329 ?auto_3331 ) ) ( not ( = ?auto_3329 ?auto_3336 ) ) ( not ( = ?auto_3331 ?auto_3350 ) ) ( not ( = ?auto_3331 ?auto_3341 ) ) ( not ( = ?auto_3331 ?auto_3349 ) ) ( not ( = ?auto_3331 ?auto_3340 ) ) ( not ( = ?auto_3331 ?auto_3344 ) ) ( not ( = ?auto_3335 ?auto_3346 ) ) ( not ( = ?auto_3335 ?auto_3343 ) ) ( not ( = ?auto_3335 ?auto_3338 ) ) ( not ( = ?auto_3335 ?auto_3345 ) ) ( not ( = ?auto_3334 ?auto_3348 ) ) ( not ( = ?auto_3334 ?auto_3342 ) ) ( not ( = ?auto_3334 ?auto_3339 ) ) ( not ( = ?auto_3334 ?auto_3347 ) ) ( not ( = ?auto_3336 ?auto_3350 ) ) ( not ( = ?auto_3336 ?auto_3341 ) ) ( not ( = ?auto_3336 ?auto_3349 ) ) ( not ( = ?auto_3336 ?auto_3340 ) ) ( not ( = ?auto_3336 ?auto_3344 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_3325 ?auto_3326 ?auto_3327 ?auto_3328 ?auto_3329 ?auto_3330 )
      ( MAKE-1CRATE ?auto_3330 ?auto_3331 )
      ( MAKE-6CRATE-VERIFY ?auto_3325 ?auto_3326 ?auto_3327 ?auto_3328 ?auto_3329 ?auto_3330 ?auto_3331 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3353 - SURFACE
      ?auto_3354 - SURFACE
    )
    :vars
    (
      ?auto_3355 - HOIST
      ?auto_3356 - PLACE
      ?auto_3358 - PLACE
      ?auto_3359 - HOIST
      ?auto_3360 - SURFACE
      ?auto_3357 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3355 ?auto_3356 ) ( SURFACE-AT ?auto_3353 ?auto_3356 ) ( CLEAR ?auto_3353 ) ( IS-CRATE ?auto_3354 ) ( AVAILABLE ?auto_3355 ) ( not ( = ?auto_3358 ?auto_3356 ) ) ( HOIST-AT ?auto_3359 ?auto_3358 ) ( AVAILABLE ?auto_3359 ) ( SURFACE-AT ?auto_3354 ?auto_3358 ) ( ON ?auto_3354 ?auto_3360 ) ( CLEAR ?auto_3354 ) ( TRUCK-AT ?auto_3357 ?auto_3356 ) ( not ( = ?auto_3353 ?auto_3354 ) ) ( not ( = ?auto_3353 ?auto_3360 ) ) ( not ( = ?auto_3354 ?auto_3360 ) ) ( not ( = ?auto_3355 ?auto_3359 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3357 ?auto_3356 ?auto_3358 )
      ( !LIFT ?auto_3359 ?auto_3354 ?auto_3360 ?auto_3358 )
      ( !LOAD ?auto_3359 ?auto_3354 ?auto_3357 ?auto_3358 )
      ( !DRIVE ?auto_3357 ?auto_3358 ?auto_3356 )
      ( !UNLOAD ?auto_3355 ?auto_3354 ?auto_3357 ?auto_3356 )
      ( !DROP ?auto_3355 ?auto_3354 ?auto_3353 ?auto_3356 )
      ( MAKE-1CRATE-VERIFY ?auto_3353 ?auto_3354 ) )
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
      ?auto_3376 - SURFACE
      ?auto_3375 - SURFACE
    )
    :vars
    (
      ?auto_3380 - HOIST
      ?auto_3382 - PLACE
      ?auto_3377 - PLACE
      ?auto_3378 - HOIST
      ?auto_3379 - SURFACE
      ?auto_3387 - PLACE
      ?auto_3386 - HOIST
      ?auto_3385 - SURFACE
      ?auto_3390 - PLACE
      ?auto_3391 - HOIST
      ?auto_3394 - SURFACE
      ?auto_3397 - PLACE
      ?auto_3398 - HOIST
      ?auto_3389 - SURFACE
      ?auto_3383 - PLACE
      ?auto_3384 - HOIST
      ?auto_3393 - SURFACE
      ?auto_3395 - PLACE
      ?auto_3392 - HOIST
      ?auto_3388 - SURFACE
      ?auto_3396 - SURFACE
      ?auto_3381 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3380 ?auto_3382 ) ( IS-CRATE ?auto_3375 ) ( not ( = ?auto_3377 ?auto_3382 ) ) ( HOIST-AT ?auto_3378 ?auto_3377 ) ( AVAILABLE ?auto_3378 ) ( SURFACE-AT ?auto_3375 ?auto_3377 ) ( ON ?auto_3375 ?auto_3379 ) ( CLEAR ?auto_3375 ) ( not ( = ?auto_3376 ?auto_3375 ) ) ( not ( = ?auto_3376 ?auto_3379 ) ) ( not ( = ?auto_3375 ?auto_3379 ) ) ( not ( = ?auto_3380 ?auto_3378 ) ) ( IS-CRATE ?auto_3376 ) ( not ( = ?auto_3387 ?auto_3382 ) ) ( HOIST-AT ?auto_3386 ?auto_3387 ) ( AVAILABLE ?auto_3386 ) ( SURFACE-AT ?auto_3376 ?auto_3387 ) ( ON ?auto_3376 ?auto_3385 ) ( CLEAR ?auto_3376 ) ( not ( = ?auto_3374 ?auto_3376 ) ) ( not ( = ?auto_3374 ?auto_3385 ) ) ( not ( = ?auto_3376 ?auto_3385 ) ) ( not ( = ?auto_3380 ?auto_3386 ) ) ( IS-CRATE ?auto_3374 ) ( not ( = ?auto_3390 ?auto_3382 ) ) ( HOIST-AT ?auto_3391 ?auto_3390 ) ( AVAILABLE ?auto_3391 ) ( SURFACE-AT ?auto_3374 ?auto_3390 ) ( ON ?auto_3374 ?auto_3394 ) ( CLEAR ?auto_3374 ) ( not ( = ?auto_3373 ?auto_3374 ) ) ( not ( = ?auto_3373 ?auto_3394 ) ) ( not ( = ?auto_3374 ?auto_3394 ) ) ( not ( = ?auto_3380 ?auto_3391 ) ) ( IS-CRATE ?auto_3373 ) ( not ( = ?auto_3397 ?auto_3382 ) ) ( HOIST-AT ?auto_3398 ?auto_3397 ) ( SURFACE-AT ?auto_3373 ?auto_3397 ) ( ON ?auto_3373 ?auto_3389 ) ( CLEAR ?auto_3373 ) ( not ( = ?auto_3372 ?auto_3373 ) ) ( not ( = ?auto_3372 ?auto_3389 ) ) ( not ( = ?auto_3373 ?auto_3389 ) ) ( not ( = ?auto_3380 ?auto_3398 ) ) ( IS-CRATE ?auto_3372 ) ( not ( = ?auto_3383 ?auto_3382 ) ) ( HOIST-AT ?auto_3384 ?auto_3383 ) ( AVAILABLE ?auto_3384 ) ( SURFACE-AT ?auto_3372 ?auto_3383 ) ( ON ?auto_3372 ?auto_3393 ) ( CLEAR ?auto_3372 ) ( not ( = ?auto_3371 ?auto_3372 ) ) ( not ( = ?auto_3371 ?auto_3393 ) ) ( not ( = ?auto_3372 ?auto_3393 ) ) ( not ( = ?auto_3380 ?auto_3384 ) ) ( IS-CRATE ?auto_3371 ) ( not ( = ?auto_3395 ?auto_3382 ) ) ( HOIST-AT ?auto_3392 ?auto_3395 ) ( AVAILABLE ?auto_3392 ) ( SURFACE-AT ?auto_3371 ?auto_3395 ) ( ON ?auto_3371 ?auto_3388 ) ( CLEAR ?auto_3371 ) ( not ( = ?auto_3370 ?auto_3371 ) ) ( not ( = ?auto_3370 ?auto_3388 ) ) ( not ( = ?auto_3371 ?auto_3388 ) ) ( not ( = ?auto_3380 ?auto_3392 ) ) ( SURFACE-AT ?auto_3369 ?auto_3382 ) ( CLEAR ?auto_3369 ) ( IS-CRATE ?auto_3370 ) ( AVAILABLE ?auto_3380 ) ( AVAILABLE ?auto_3398 ) ( SURFACE-AT ?auto_3370 ?auto_3397 ) ( ON ?auto_3370 ?auto_3396 ) ( CLEAR ?auto_3370 ) ( TRUCK-AT ?auto_3381 ?auto_3382 ) ( not ( = ?auto_3369 ?auto_3370 ) ) ( not ( = ?auto_3369 ?auto_3396 ) ) ( not ( = ?auto_3370 ?auto_3396 ) ) ( not ( = ?auto_3369 ?auto_3371 ) ) ( not ( = ?auto_3369 ?auto_3388 ) ) ( not ( = ?auto_3371 ?auto_3396 ) ) ( not ( = ?auto_3395 ?auto_3397 ) ) ( not ( = ?auto_3392 ?auto_3398 ) ) ( not ( = ?auto_3388 ?auto_3396 ) ) ( not ( = ?auto_3369 ?auto_3372 ) ) ( not ( = ?auto_3369 ?auto_3393 ) ) ( not ( = ?auto_3370 ?auto_3372 ) ) ( not ( = ?auto_3370 ?auto_3393 ) ) ( not ( = ?auto_3372 ?auto_3388 ) ) ( not ( = ?auto_3372 ?auto_3396 ) ) ( not ( = ?auto_3383 ?auto_3395 ) ) ( not ( = ?auto_3383 ?auto_3397 ) ) ( not ( = ?auto_3384 ?auto_3392 ) ) ( not ( = ?auto_3384 ?auto_3398 ) ) ( not ( = ?auto_3393 ?auto_3388 ) ) ( not ( = ?auto_3393 ?auto_3396 ) ) ( not ( = ?auto_3369 ?auto_3373 ) ) ( not ( = ?auto_3369 ?auto_3389 ) ) ( not ( = ?auto_3370 ?auto_3373 ) ) ( not ( = ?auto_3370 ?auto_3389 ) ) ( not ( = ?auto_3371 ?auto_3373 ) ) ( not ( = ?auto_3371 ?auto_3389 ) ) ( not ( = ?auto_3373 ?auto_3393 ) ) ( not ( = ?auto_3373 ?auto_3388 ) ) ( not ( = ?auto_3373 ?auto_3396 ) ) ( not ( = ?auto_3389 ?auto_3393 ) ) ( not ( = ?auto_3389 ?auto_3388 ) ) ( not ( = ?auto_3389 ?auto_3396 ) ) ( not ( = ?auto_3369 ?auto_3374 ) ) ( not ( = ?auto_3369 ?auto_3394 ) ) ( not ( = ?auto_3370 ?auto_3374 ) ) ( not ( = ?auto_3370 ?auto_3394 ) ) ( not ( = ?auto_3371 ?auto_3374 ) ) ( not ( = ?auto_3371 ?auto_3394 ) ) ( not ( = ?auto_3372 ?auto_3374 ) ) ( not ( = ?auto_3372 ?auto_3394 ) ) ( not ( = ?auto_3374 ?auto_3389 ) ) ( not ( = ?auto_3374 ?auto_3393 ) ) ( not ( = ?auto_3374 ?auto_3388 ) ) ( not ( = ?auto_3374 ?auto_3396 ) ) ( not ( = ?auto_3390 ?auto_3397 ) ) ( not ( = ?auto_3390 ?auto_3383 ) ) ( not ( = ?auto_3390 ?auto_3395 ) ) ( not ( = ?auto_3391 ?auto_3398 ) ) ( not ( = ?auto_3391 ?auto_3384 ) ) ( not ( = ?auto_3391 ?auto_3392 ) ) ( not ( = ?auto_3394 ?auto_3389 ) ) ( not ( = ?auto_3394 ?auto_3393 ) ) ( not ( = ?auto_3394 ?auto_3388 ) ) ( not ( = ?auto_3394 ?auto_3396 ) ) ( not ( = ?auto_3369 ?auto_3376 ) ) ( not ( = ?auto_3369 ?auto_3385 ) ) ( not ( = ?auto_3370 ?auto_3376 ) ) ( not ( = ?auto_3370 ?auto_3385 ) ) ( not ( = ?auto_3371 ?auto_3376 ) ) ( not ( = ?auto_3371 ?auto_3385 ) ) ( not ( = ?auto_3372 ?auto_3376 ) ) ( not ( = ?auto_3372 ?auto_3385 ) ) ( not ( = ?auto_3373 ?auto_3376 ) ) ( not ( = ?auto_3373 ?auto_3385 ) ) ( not ( = ?auto_3376 ?auto_3394 ) ) ( not ( = ?auto_3376 ?auto_3389 ) ) ( not ( = ?auto_3376 ?auto_3393 ) ) ( not ( = ?auto_3376 ?auto_3388 ) ) ( not ( = ?auto_3376 ?auto_3396 ) ) ( not ( = ?auto_3387 ?auto_3390 ) ) ( not ( = ?auto_3387 ?auto_3397 ) ) ( not ( = ?auto_3387 ?auto_3383 ) ) ( not ( = ?auto_3387 ?auto_3395 ) ) ( not ( = ?auto_3386 ?auto_3391 ) ) ( not ( = ?auto_3386 ?auto_3398 ) ) ( not ( = ?auto_3386 ?auto_3384 ) ) ( not ( = ?auto_3386 ?auto_3392 ) ) ( not ( = ?auto_3385 ?auto_3394 ) ) ( not ( = ?auto_3385 ?auto_3389 ) ) ( not ( = ?auto_3385 ?auto_3393 ) ) ( not ( = ?auto_3385 ?auto_3388 ) ) ( not ( = ?auto_3385 ?auto_3396 ) ) ( not ( = ?auto_3369 ?auto_3375 ) ) ( not ( = ?auto_3369 ?auto_3379 ) ) ( not ( = ?auto_3370 ?auto_3375 ) ) ( not ( = ?auto_3370 ?auto_3379 ) ) ( not ( = ?auto_3371 ?auto_3375 ) ) ( not ( = ?auto_3371 ?auto_3379 ) ) ( not ( = ?auto_3372 ?auto_3375 ) ) ( not ( = ?auto_3372 ?auto_3379 ) ) ( not ( = ?auto_3373 ?auto_3375 ) ) ( not ( = ?auto_3373 ?auto_3379 ) ) ( not ( = ?auto_3374 ?auto_3375 ) ) ( not ( = ?auto_3374 ?auto_3379 ) ) ( not ( = ?auto_3375 ?auto_3385 ) ) ( not ( = ?auto_3375 ?auto_3394 ) ) ( not ( = ?auto_3375 ?auto_3389 ) ) ( not ( = ?auto_3375 ?auto_3393 ) ) ( not ( = ?auto_3375 ?auto_3388 ) ) ( not ( = ?auto_3375 ?auto_3396 ) ) ( not ( = ?auto_3377 ?auto_3387 ) ) ( not ( = ?auto_3377 ?auto_3390 ) ) ( not ( = ?auto_3377 ?auto_3397 ) ) ( not ( = ?auto_3377 ?auto_3383 ) ) ( not ( = ?auto_3377 ?auto_3395 ) ) ( not ( = ?auto_3378 ?auto_3386 ) ) ( not ( = ?auto_3378 ?auto_3391 ) ) ( not ( = ?auto_3378 ?auto_3398 ) ) ( not ( = ?auto_3378 ?auto_3384 ) ) ( not ( = ?auto_3378 ?auto_3392 ) ) ( not ( = ?auto_3379 ?auto_3385 ) ) ( not ( = ?auto_3379 ?auto_3394 ) ) ( not ( = ?auto_3379 ?auto_3389 ) ) ( not ( = ?auto_3379 ?auto_3393 ) ) ( not ( = ?auto_3379 ?auto_3388 ) ) ( not ( = ?auto_3379 ?auto_3396 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_3369 ?auto_3370 ?auto_3371 ?auto_3372 ?auto_3373 ?auto_3374 ?auto_3376 )
      ( MAKE-1CRATE ?auto_3376 ?auto_3375 )
      ( MAKE-7CRATE-VERIFY ?auto_3369 ?auto_3370 ?auto_3371 ?auto_3372 ?auto_3373 ?auto_3374 ?auto_3376 ?auto_3375 ) )
  )

)

