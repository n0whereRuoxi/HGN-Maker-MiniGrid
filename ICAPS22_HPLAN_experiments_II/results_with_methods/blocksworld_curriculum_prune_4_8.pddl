( define ( domain Blocks4 )
  ( :requirements :strips :typing :equality :htn )
  ( :types block )
  ( :predicates
    ( ON-TABLE ?b - BLOCK )
    ( ON ?b1 - BLOCK ?b2 - BLOCK )
    ( CLEAR ?b - BLOCK )
    ( HAND-EMPTY )
    ( HOLDING ?b - BLOCK )
  )
  ( :action !PICKUP
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?b ) ( CLEAR ?b ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON-TABLE ?b ) ) ( not ( CLEAR ?b ) ) ( not ( HAND-EMPTY ) ) ( HOLDING ?b ) )
  )
  ( :action !PUTDOWN
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b ) )
    :effect
    ( and ( not ( HOLDING ?b ) ) ( HAND-EMPTY ) ( ON-TABLE ?b ) ( CLEAR ?b ) )
  )
  ( :action !UNSTACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON ?b1 ?b2 ) ) ( not ( CLEAR ?b1 ) ) ( not ( HAND-EMPTY ) ) ( CLEAR ?b2 ) ( HOLDING ?b1 ) )
  )
  ( :action !STACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b1 ) ( CLEAR ?b2 ) )
    :effect
    ( and ( not ( HOLDING ?b1 ) ) ( not ( CLEAR ?b2 ) ) ( HAND-EMPTY ) ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) )
  )
  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?goal - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?goal ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?top - BLOCK
      ?bottom - BLOCK
    )
    :precondition
    ( and ( ON ?top ?bottom ) )
    :subtasks
    (  )
  )

  ( :method MAKE-CLEAR
    :parameters
    (
      ?target - BLOCK
    )
    :precondition
    ( and ( CLEAR ?target ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3181 - BLOCK
    )
    :vars
    (
      ?auto_3182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3181 ?auto_3182 ) ( CLEAR ?auto_3181 ) ( HAND-EMPTY ) ( not ( = ?auto_3181 ?auto_3182 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3181 ?auto_3182 )
      ( !PUTDOWN ?auto_3181 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3188 - BLOCK
      ?auto_3189 - BLOCK
    )
    :vars
    (
      ?auto_3190 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3188 ) ( ON ?auto_3189 ?auto_3190 ) ( CLEAR ?auto_3189 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3188 ) ( not ( = ?auto_3188 ?auto_3189 ) ) ( not ( = ?auto_3188 ?auto_3190 ) ) ( not ( = ?auto_3189 ?auto_3190 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3189 ?auto_3190 )
      ( !STACK ?auto_3189 ?auto_3188 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3198 - BLOCK
      ?auto_3199 - BLOCK
    )
    :vars
    (
      ?auto_3200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3199 ?auto_3200 ) ( not ( = ?auto_3198 ?auto_3199 ) ) ( not ( = ?auto_3198 ?auto_3200 ) ) ( not ( = ?auto_3199 ?auto_3200 ) ) ( ON ?auto_3198 ?auto_3199 ) ( CLEAR ?auto_3198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3198 )
      ( MAKE-2PILE ?auto_3198 ?auto_3199 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3209 - BLOCK
      ?auto_3210 - BLOCK
      ?auto_3211 - BLOCK
    )
    :vars
    (
      ?auto_3212 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3210 ) ( ON ?auto_3211 ?auto_3212 ) ( CLEAR ?auto_3211 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3209 ) ( ON ?auto_3210 ?auto_3209 ) ( not ( = ?auto_3209 ?auto_3210 ) ) ( not ( = ?auto_3209 ?auto_3211 ) ) ( not ( = ?auto_3209 ?auto_3212 ) ) ( not ( = ?auto_3210 ?auto_3211 ) ) ( not ( = ?auto_3210 ?auto_3212 ) ) ( not ( = ?auto_3211 ?auto_3212 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3211 ?auto_3212 )
      ( !STACK ?auto_3211 ?auto_3210 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3223 - BLOCK
      ?auto_3224 - BLOCK
      ?auto_3225 - BLOCK
    )
    :vars
    (
      ?auto_3226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3225 ?auto_3226 ) ( ON-TABLE ?auto_3223 ) ( not ( = ?auto_3223 ?auto_3224 ) ) ( not ( = ?auto_3223 ?auto_3225 ) ) ( not ( = ?auto_3223 ?auto_3226 ) ) ( not ( = ?auto_3224 ?auto_3225 ) ) ( not ( = ?auto_3224 ?auto_3226 ) ) ( not ( = ?auto_3225 ?auto_3226 ) ) ( CLEAR ?auto_3223 ) ( ON ?auto_3224 ?auto_3225 ) ( CLEAR ?auto_3224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3223 ?auto_3224 )
      ( MAKE-3PILE ?auto_3223 ?auto_3224 ?auto_3225 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3237 - BLOCK
      ?auto_3238 - BLOCK
      ?auto_3239 - BLOCK
    )
    :vars
    (
      ?auto_3240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3239 ?auto_3240 ) ( not ( = ?auto_3237 ?auto_3238 ) ) ( not ( = ?auto_3237 ?auto_3239 ) ) ( not ( = ?auto_3237 ?auto_3240 ) ) ( not ( = ?auto_3238 ?auto_3239 ) ) ( not ( = ?auto_3238 ?auto_3240 ) ) ( not ( = ?auto_3239 ?auto_3240 ) ) ( ON ?auto_3238 ?auto_3239 ) ( ON ?auto_3237 ?auto_3238 ) ( CLEAR ?auto_3237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3237 )
      ( MAKE-3PILE ?auto_3237 ?auto_3238 ?auto_3239 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3252 - BLOCK
      ?auto_3253 - BLOCK
      ?auto_3254 - BLOCK
      ?auto_3255 - BLOCK
    )
    :vars
    (
      ?auto_3256 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3254 ) ( ON ?auto_3255 ?auto_3256 ) ( CLEAR ?auto_3255 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3252 ) ( ON ?auto_3253 ?auto_3252 ) ( ON ?auto_3254 ?auto_3253 ) ( not ( = ?auto_3252 ?auto_3253 ) ) ( not ( = ?auto_3252 ?auto_3254 ) ) ( not ( = ?auto_3252 ?auto_3255 ) ) ( not ( = ?auto_3252 ?auto_3256 ) ) ( not ( = ?auto_3253 ?auto_3254 ) ) ( not ( = ?auto_3253 ?auto_3255 ) ) ( not ( = ?auto_3253 ?auto_3256 ) ) ( not ( = ?auto_3254 ?auto_3255 ) ) ( not ( = ?auto_3254 ?auto_3256 ) ) ( not ( = ?auto_3255 ?auto_3256 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3255 ?auto_3256 )
      ( !STACK ?auto_3255 ?auto_3254 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3261 - BLOCK
      ?auto_3262 - BLOCK
      ?auto_3263 - BLOCK
      ?auto_3264 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3263 ) ( ON-TABLE ?auto_3264 ) ( CLEAR ?auto_3264 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3261 ) ( ON ?auto_3262 ?auto_3261 ) ( ON ?auto_3263 ?auto_3262 ) ( not ( = ?auto_3261 ?auto_3262 ) ) ( not ( = ?auto_3261 ?auto_3263 ) ) ( not ( = ?auto_3261 ?auto_3264 ) ) ( not ( = ?auto_3262 ?auto_3263 ) ) ( not ( = ?auto_3262 ?auto_3264 ) ) ( not ( = ?auto_3263 ?auto_3264 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_3264 )
      ( !STACK ?auto_3264 ?auto_3263 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3269 - BLOCK
      ?auto_3270 - BLOCK
      ?auto_3271 - BLOCK
      ?auto_3272 - BLOCK
    )
    :vars
    (
      ?auto_3273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3272 ?auto_3273 ) ( ON-TABLE ?auto_3269 ) ( ON ?auto_3270 ?auto_3269 ) ( not ( = ?auto_3269 ?auto_3270 ) ) ( not ( = ?auto_3269 ?auto_3271 ) ) ( not ( = ?auto_3269 ?auto_3272 ) ) ( not ( = ?auto_3269 ?auto_3273 ) ) ( not ( = ?auto_3270 ?auto_3271 ) ) ( not ( = ?auto_3270 ?auto_3272 ) ) ( not ( = ?auto_3270 ?auto_3273 ) ) ( not ( = ?auto_3271 ?auto_3272 ) ) ( not ( = ?auto_3271 ?auto_3273 ) ) ( not ( = ?auto_3272 ?auto_3273 ) ) ( CLEAR ?auto_3270 ) ( ON ?auto_3271 ?auto_3272 ) ( CLEAR ?auto_3271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3269 ?auto_3270 ?auto_3271 )
      ( MAKE-4PILE ?auto_3269 ?auto_3270 ?auto_3271 ?auto_3272 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3278 - BLOCK
      ?auto_3279 - BLOCK
      ?auto_3280 - BLOCK
      ?auto_3281 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3281 ) ( ON-TABLE ?auto_3278 ) ( ON ?auto_3279 ?auto_3278 ) ( not ( = ?auto_3278 ?auto_3279 ) ) ( not ( = ?auto_3278 ?auto_3280 ) ) ( not ( = ?auto_3278 ?auto_3281 ) ) ( not ( = ?auto_3279 ?auto_3280 ) ) ( not ( = ?auto_3279 ?auto_3281 ) ) ( not ( = ?auto_3280 ?auto_3281 ) ) ( CLEAR ?auto_3279 ) ( ON ?auto_3280 ?auto_3281 ) ( CLEAR ?auto_3280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3278 ?auto_3279 ?auto_3280 )
      ( MAKE-4PILE ?auto_3278 ?auto_3279 ?auto_3280 ?auto_3281 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3286 - BLOCK
      ?auto_3287 - BLOCK
      ?auto_3288 - BLOCK
      ?auto_3289 - BLOCK
    )
    :vars
    (
      ?auto_3290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3289 ?auto_3290 ) ( ON-TABLE ?auto_3286 ) ( not ( = ?auto_3286 ?auto_3287 ) ) ( not ( = ?auto_3286 ?auto_3288 ) ) ( not ( = ?auto_3286 ?auto_3289 ) ) ( not ( = ?auto_3286 ?auto_3290 ) ) ( not ( = ?auto_3287 ?auto_3288 ) ) ( not ( = ?auto_3287 ?auto_3289 ) ) ( not ( = ?auto_3287 ?auto_3290 ) ) ( not ( = ?auto_3288 ?auto_3289 ) ) ( not ( = ?auto_3288 ?auto_3290 ) ) ( not ( = ?auto_3289 ?auto_3290 ) ) ( ON ?auto_3288 ?auto_3289 ) ( CLEAR ?auto_3286 ) ( ON ?auto_3287 ?auto_3288 ) ( CLEAR ?auto_3287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3286 ?auto_3287 )
      ( MAKE-4PILE ?auto_3286 ?auto_3287 ?auto_3288 ?auto_3289 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3295 - BLOCK
      ?auto_3296 - BLOCK
      ?auto_3297 - BLOCK
      ?auto_3298 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3298 ) ( ON-TABLE ?auto_3295 ) ( not ( = ?auto_3295 ?auto_3296 ) ) ( not ( = ?auto_3295 ?auto_3297 ) ) ( not ( = ?auto_3295 ?auto_3298 ) ) ( not ( = ?auto_3296 ?auto_3297 ) ) ( not ( = ?auto_3296 ?auto_3298 ) ) ( not ( = ?auto_3297 ?auto_3298 ) ) ( ON ?auto_3297 ?auto_3298 ) ( CLEAR ?auto_3295 ) ( ON ?auto_3296 ?auto_3297 ) ( CLEAR ?auto_3296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3295 ?auto_3296 )
      ( MAKE-4PILE ?auto_3295 ?auto_3296 ?auto_3297 ?auto_3298 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3303 - BLOCK
      ?auto_3304 - BLOCK
      ?auto_3305 - BLOCK
      ?auto_3306 - BLOCK
    )
    :vars
    (
      ?auto_3307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3306 ?auto_3307 ) ( not ( = ?auto_3303 ?auto_3304 ) ) ( not ( = ?auto_3303 ?auto_3305 ) ) ( not ( = ?auto_3303 ?auto_3306 ) ) ( not ( = ?auto_3303 ?auto_3307 ) ) ( not ( = ?auto_3304 ?auto_3305 ) ) ( not ( = ?auto_3304 ?auto_3306 ) ) ( not ( = ?auto_3304 ?auto_3307 ) ) ( not ( = ?auto_3305 ?auto_3306 ) ) ( not ( = ?auto_3305 ?auto_3307 ) ) ( not ( = ?auto_3306 ?auto_3307 ) ) ( ON ?auto_3305 ?auto_3306 ) ( ON ?auto_3304 ?auto_3305 ) ( ON ?auto_3303 ?auto_3304 ) ( CLEAR ?auto_3303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3303 )
      ( MAKE-4PILE ?auto_3303 ?auto_3304 ?auto_3305 ?auto_3306 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3312 - BLOCK
      ?auto_3313 - BLOCK
      ?auto_3314 - BLOCK
      ?auto_3315 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3315 ) ( not ( = ?auto_3312 ?auto_3313 ) ) ( not ( = ?auto_3312 ?auto_3314 ) ) ( not ( = ?auto_3312 ?auto_3315 ) ) ( not ( = ?auto_3313 ?auto_3314 ) ) ( not ( = ?auto_3313 ?auto_3315 ) ) ( not ( = ?auto_3314 ?auto_3315 ) ) ( ON ?auto_3314 ?auto_3315 ) ( ON ?auto_3313 ?auto_3314 ) ( ON ?auto_3312 ?auto_3313 ) ( CLEAR ?auto_3312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3312 )
      ( MAKE-4PILE ?auto_3312 ?auto_3313 ?auto_3314 ?auto_3315 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3320 - BLOCK
      ?auto_3321 - BLOCK
      ?auto_3322 - BLOCK
      ?auto_3323 - BLOCK
    )
    :vars
    (
      ?auto_3324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3320 ?auto_3321 ) ) ( not ( = ?auto_3320 ?auto_3322 ) ) ( not ( = ?auto_3320 ?auto_3323 ) ) ( not ( = ?auto_3321 ?auto_3322 ) ) ( not ( = ?auto_3321 ?auto_3323 ) ) ( not ( = ?auto_3322 ?auto_3323 ) ) ( ON ?auto_3320 ?auto_3324 ) ( not ( = ?auto_3323 ?auto_3324 ) ) ( not ( = ?auto_3322 ?auto_3324 ) ) ( not ( = ?auto_3321 ?auto_3324 ) ) ( not ( = ?auto_3320 ?auto_3324 ) ) ( ON ?auto_3321 ?auto_3320 ) ( ON ?auto_3322 ?auto_3321 ) ( ON ?auto_3323 ?auto_3322 ) ( CLEAR ?auto_3323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_3323 ?auto_3322 ?auto_3321 ?auto_3320 )
      ( MAKE-4PILE ?auto_3320 ?auto_3321 ?auto_3322 ?auto_3323 ) )
  )

)

