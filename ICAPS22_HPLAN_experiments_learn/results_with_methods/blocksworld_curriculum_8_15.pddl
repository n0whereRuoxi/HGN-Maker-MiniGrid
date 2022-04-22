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
      ?auto_44236 - BLOCK
    )
    :vars
    (
      ?auto_44237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44236 ?auto_44237 ) ( CLEAR ?auto_44236 ) ( HAND-EMPTY ) ( not ( = ?auto_44236 ?auto_44237 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44236 ?auto_44237 )
      ( !PUTDOWN ?auto_44236 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44239 - BLOCK
    )
    :vars
    (
      ?auto_44240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44239 ?auto_44240 ) ( CLEAR ?auto_44239 ) ( HAND-EMPTY ) ( not ( = ?auto_44239 ?auto_44240 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44239 ?auto_44240 )
      ( !PUTDOWN ?auto_44239 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44243 - BLOCK
      ?auto_44244 - BLOCK
    )
    :vars
    (
      ?auto_44245 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_44243 ) ( ON ?auto_44244 ?auto_44245 ) ( CLEAR ?auto_44244 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44243 ) ( not ( = ?auto_44243 ?auto_44244 ) ) ( not ( = ?auto_44243 ?auto_44245 ) ) ( not ( = ?auto_44244 ?auto_44245 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44244 ?auto_44245 )
      ( !STACK ?auto_44244 ?auto_44243 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44248 - BLOCK
      ?auto_44249 - BLOCK
    )
    :vars
    (
      ?auto_44250 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_44248 ) ( ON ?auto_44249 ?auto_44250 ) ( CLEAR ?auto_44249 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44248 ) ( not ( = ?auto_44248 ?auto_44249 ) ) ( not ( = ?auto_44248 ?auto_44250 ) ) ( not ( = ?auto_44249 ?auto_44250 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44249 ?auto_44250 )
      ( !STACK ?auto_44249 ?auto_44248 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44253 - BLOCK
      ?auto_44254 - BLOCK
    )
    :vars
    (
      ?auto_44255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44254 ?auto_44255 ) ( not ( = ?auto_44253 ?auto_44254 ) ) ( not ( = ?auto_44253 ?auto_44255 ) ) ( not ( = ?auto_44254 ?auto_44255 ) ) ( ON ?auto_44253 ?auto_44254 ) ( CLEAR ?auto_44253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44253 )
      ( MAKE-2PILE ?auto_44253 ?auto_44254 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44258 - BLOCK
      ?auto_44259 - BLOCK
    )
    :vars
    (
      ?auto_44260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44259 ?auto_44260 ) ( not ( = ?auto_44258 ?auto_44259 ) ) ( not ( = ?auto_44258 ?auto_44260 ) ) ( not ( = ?auto_44259 ?auto_44260 ) ) ( ON ?auto_44258 ?auto_44259 ) ( CLEAR ?auto_44258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44258 )
      ( MAKE-2PILE ?auto_44258 ?auto_44259 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44264 - BLOCK
      ?auto_44265 - BLOCK
      ?auto_44266 - BLOCK
    )
    :vars
    (
      ?auto_44267 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_44265 ) ( ON ?auto_44266 ?auto_44267 ) ( CLEAR ?auto_44266 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44264 ) ( ON ?auto_44265 ?auto_44264 ) ( not ( = ?auto_44264 ?auto_44265 ) ) ( not ( = ?auto_44264 ?auto_44266 ) ) ( not ( = ?auto_44264 ?auto_44267 ) ) ( not ( = ?auto_44265 ?auto_44266 ) ) ( not ( = ?auto_44265 ?auto_44267 ) ) ( not ( = ?auto_44266 ?auto_44267 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44266 ?auto_44267 )
      ( !STACK ?auto_44266 ?auto_44265 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44271 - BLOCK
      ?auto_44272 - BLOCK
      ?auto_44273 - BLOCK
    )
    :vars
    (
      ?auto_44274 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_44272 ) ( ON ?auto_44273 ?auto_44274 ) ( CLEAR ?auto_44273 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44271 ) ( ON ?auto_44272 ?auto_44271 ) ( not ( = ?auto_44271 ?auto_44272 ) ) ( not ( = ?auto_44271 ?auto_44273 ) ) ( not ( = ?auto_44271 ?auto_44274 ) ) ( not ( = ?auto_44272 ?auto_44273 ) ) ( not ( = ?auto_44272 ?auto_44274 ) ) ( not ( = ?auto_44273 ?auto_44274 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44273 ?auto_44274 )
      ( !STACK ?auto_44273 ?auto_44272 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44278 - BLOCK
      ?auto_44279 - BLOCK
      ?auto_44280 - BLOCK
    )
    :vars
    (
      ?auto_44281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44280 ?auto_44281 ) ( ON-TABLE ?auto_44278 ) ( not ( = ?auto_44278 ?auto_44279 ) ) ( not ( = ?auto_44278 ?auto_44280 ) ) ( not ( = ?auto_44278 ?auto_44281 ) ) ( not ( = ?auto_44279 ?auto_44280 ) ) ( not ( = ?auto_44279 ?auto_44281 ) ) ( not ( = ?auto_44280 ?auto_44281 ) ) ( CLEAR ?auto_44278 ) ( ON ?auto_44279 ?auto_44280 ) ( CLEAR ?auto_44279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44278 ?auto_44279 )
      ( MAKE-3PILE ?auto_44278 ?auto_44279 ?auto_44280 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44285 - BLOCK
      ?auto_44286 - BLOCK
      ?auto_44287 - BLOCK
    )
    :vars
    (
      ?auto_44288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44287 ?auto_44288 ) ( ON-TABLE ?auto_44285 ) ( not ( = ?auto_44285 ?auto_44286 ) ) ( not ( = ?auto_44285 ?auto_44287 ) ) ( not ( = ?auto_44285 ?auto_44288 ) ) ( not ( = ?auto_44286 ?auto_44287 ) ) ( not ( = ?auto_44286 ?auto_44288 ) ) ( not ( = ?auto_44287 ?auto_44288 ) ) ( CLEAR ?auto_44285 ) ( ON ?auto_44286 ?auto_44287 ) ( CLEAR ?auto_44286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44285 ?auto_44286 )
      ( MAKE-3PILE ?auto_44285 ?auto_44286 ?auto_44287 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44292 - BLOCK
      ?auto_44293 - BLOCK
      ?auto_44294 - BLOCK
    )
    :vars
    (
      ?auto_44295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44294 ?auto_44295 ) ( not ( = ?auto_44292 ?auto_44293 ) ) ( not ( = ?auto_44292 ?auto_44294 ) ) ( not ( = ?auto_44292 ?auto_44295 ) ) ( not ( = ?auto_44293 ?auto_44294 ) ) ( not ( = ?auto_44293 ?auto_44295 ) ) ( not ( = ?auto_44294 ?auto_44295 ) ) ( ON ?auto_44293 ?auto_44294 ) ( ON ?auto_44292 ?auto_44293 ) ( CLEAR ?auto_44292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44292 )
      ( MAKE-3PILE ?auto_44292 ?auto_44293 ?auto_44294 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44299 - BLOCK
      ?auto_44300 - BLOCK
      ?auto_44301 - BLOCK
    )
    :vars
    (
      ?auto_44302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44301 ?auto_44302 ) ( not ( = ?auto_44299 ?auto_44300 ) ) ( not ( = ?auto_44299 ?auto_44301 ) ) ( not ( = ?auto_44299 ?auto_44302 ) ) ( not ( = ?auto_44300 ?auto_44301 ) ) ( not ( = ?auto_44300 ?auto_44302 ) ) ( not ( = ?auto_44301 ?auto_44302 ) ) ( ON ?auto_44300 ?auto_44301 ) ( ON ?auto_44299 ?auto_44300 ) ( CLEAR ?auto_44299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44299 )
      ( MAKE-3PILE ?auto_44299 ?auto_44300 ?auto_44301 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44307 - BLOCK
      ?auto_44308 - BLOCK
      ?auto_44309 - BLOCK
      ?auto_44310 - BLOCK
    )
    :vars
    (
      ?auto_44311 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_44309 ) ( ON ?auto_44310 ?auto_44311 ) ( CLEAR ?auto_44310 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44307 ) ( ON ?auto_44308 ?auto_44307 ) ( ON ?auto_44309 ?auto_44308 ) ( not ( = ?auto_44307 ?auto_44308 ) ) ( not ( = ?auto_44307 ?auto_44309 ) ) ( not ( = ?auto_44307 ?auto_44310 ) ) ( not ( = ?auto_44307 ?auto_44311 ) ) ( not ( = ?auto_44308 ?auto_44309 ) ) ( not ( = ?auto_44308 ?auto_44310 ) ) ( not ( = ?auto_44308 ?auto_44311 ) ) ( not ( = ?auto_44309 ?auto_44310 ) ) ( not ( = ?auto_44309 ?auto_44311 ) ) ( not ( = ?auto_44310 ?auto_44311 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44310 ?auto_44311 )
      ( !STACK ?auto_44310 ?auto_44309 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44316 - BLOCK
      ?auto_44317 - BLOCK
      ?auto_44318 - BLOCK
      ?auto_44319 - BLOCK
    )
    :vars
    (
      ?auto_44320 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_44318 ) ( ON ?auto_44319 ?auto_44320 ) ( CLEAR ?auto_44319 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44316 ) ( ON ?auto_44317 ?auto_44316 ) ( ON ?auto_44318 ?auto_44317 ) ( not ( = ?auto_44316 ?auto_44317 ) ) ( not ( = ?auto_44316 ?auto_44318 ) ) ( not ( = ?auto_44316 ?auto_44319 ) ) ( not ( = ?auto_44316 ?auto_44320 ) ) ( not ( = ?auto_44317 ?auto_44318 ) ) ( not ( = ?auto_44317 ?auto_44319 ) ) ( not ( = ?auto_44317 ?auto_44320 ) ) ( not ( = ?auto_44318 ?auto_44319 ) ) ( not ( = ?auto_44318 ?auto_44320 ) ) ( not ( = ?auto_44319 ?auto_44320 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44319 ?auto_44320 )
      ( !STACK ?auto_44319 ?auto_44318 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44325 - BLOCK
      ?auto_44326 - BLOCK
      ?auto_44327 - BLOCK
      ?auto_44328 - BLOCK
    )
    :vars
    (
      ?auto_44329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44328 ?auto_44329 ) ( ON-TABLE ?auto_44325 ) ( ON ?auto_44326 ?auto_44325 ) ( not ( = ?auto_44325 ?auto_44326 ) ) ( not ( = ?auto_44325 ?auto_44327 ) ) ( not ( = ?auto_44325 ?auto_44328 ) ) ( not ( = ?auto_44325 ?auto_44329 ) ) ( not ( = ?auto_44326 ?auto_44327 ) ) ( not ( = ?auto_44326 ?auto_44328 ) ) ( not ( = ?auto_44326 ?auto_44329 ) ) ( not ( = ?auto_44327 ?auto_44328 ) ) ( not ( = ?auto_44327 ?auto_44329 ) ) ( not ( = ?auto_44328 ?auto_44329 ) ) ( CLEAR ?auto_44326 ) ( ON ?auto_44327 ?auto_44328 ) ( CLEAR ?auto_44327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44325 ?auto_44326 ?auto_44327 )
      ( MAKE-4PILE ?auto_44325 ?auto_44326 ?auto_44327 ?auto_44328 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44334 - BLOCK
      ?auto_44335 - BLOCK
      ?auto_44336 - BLOCK
      ?auto_44337 - BLOCK
    )
    :vars
    (
      ?auto_44338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44337 ?auto_44338 ) ( ON-TABLE ?auto_44334 ) ( ON ?auto_44335 ?auto_44334 ) ( not ( = ?auto_44334 ?auto_44335 ) ) ( not ( = ?auto_44334 ?auto_44336 ) ) ( not ( = ?auto_44334 ?auto_44337 ) ) ( not ( = ?auto_44334 ?auto_44338 ) ) ( not ( = ?auto_44335 ?auto_44336 ) ) ( not ( = ?auto_44335 ?auto_44337 ) ) ( not ( = ?auto_44335 ?auto_44338 ) ) ( not ( = ?auto_44336 ?auto_44337 ) ) ( not ( = ?auto_44336 ?auto_44338 ) ) ( not ( = ?auto_44337 ?auto_44338 ) ) ( CLEAR ?auto_44335 ) ( ON ?auto_44336 ?auto_44337 ) ( CLEAR ?auto_44336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44334 ?auto_44335 ?auto_44336 )
      ( MAKE-4PILE ?auto_44334 ?auto_44335 ?auto_44336 ?auto_44337 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44343 - BLOCK
      ?auto_44344 - BLOCK
      ?auto_44345 - BLOCK
      ?auto_44346 - BLOCK
    )
    :vars
    (
      ?auto_44347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44346 ?auto_44347 ) ( ON-TABLE ?auto_44343 ) ( not ( = ?auto_44343 ?auto_44344 ) ) ( not ( = ?auto_44343 ?auto_44345 ) ) ( not ( = ?auto_44343 ?auto_44346 ) ) ( not ( = ?auto_44343 ?auto_44347 ) ) ( not ( = ?auto_44344 ?auto_44345 ) ) ( not ( = ?auto_44344 ?auto_44346 ) ) ( not ( = ?auto_44344 ?auto_44347 ) ) ( not ( = ?auto_44345 ?auto_44346 ) ) ( not ( = ?auto_44345 ?auto_44347 ) ) ( not ( = ?auto_44346 ?auto_44347 ) ) ( ON ?auto_44345 ?auto_44346 ) ( CLEAR ?auto_44343 ) ( ON ?auto_44344 ?auto_44345 ) ( CLEAR ?auto_44344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44343 ?auto_44344 )
      ( MAKE-4PILE ?auto_44343 ?auto_44344 ?auto_44345 ?auto_44346 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44352 - BLOCK
      ?auto_44353 - BLOCK
      ?auto_44354 - BLOCK
      ?auto_44355 - BLOCK
    )
    :vars
    (
      ?auto_44356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44355 ?auto_44356 ) ( ON-TABLE ?auto_44352 ) ( not ( = ?auto_44352 ?auto_44353 ) ) ( not ( = ?auto_44352 ?auto_44354 ) ) ( not ( = ?auto_44352 ?auto_44355 ) ) ( not ( = ?auto_44352 ?auto_44356 ) ) ( not ( = ?auto_44353 ?auto_44354 ) ) ( not ( = ?auto_44353 ?auto_44355 ) ) ( not ( = ?auto_44353 ?auto_44356 ) ) ( not ( = ?auto_44354 ?auto_44355 ) ) ( not ( = ?auto_44354 ?auto_44356 ) ) ( not ( = ?auto_44355 ?auto_44356 ) ) ( ON ?auto_44354 ?auto_44355 ) ( CLEAR ?auto_44352 ) ( ON ?auto_44353 ?auto_44354 ) ( CLEAR ?auto_44353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44352 ?auto_44353 )
      ( MAKE-4PILE ?auto_44352 ?auto_44353 ?auto_44354 ?auto_44355 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44361 - BLOCK
      ?auto_44362 - BLOCK
      ?auto_44363 - BLOCK
      ?auto_44364 - BLOCK
    )
    :vars
    (
      ?auto_44365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44364 ?auto_44365 ) ( not ( = ?auto_44361 ?auto_44362 ) ) ( not ( = ?auto_44361 ?auto_44363 ) ) ( not ( = ?auto_44361 ?auto_44364 ) ) ( not ( = ?auto_44361 ?auto_44365 ) ) ( not ( = ?auto_44362 ?auto_44363 ) ) ( not ( = ?auto_44362 ?auto_44364 ) ) ( not ( = ?auto_44362 ?auto_44365 ) ) ( not ( = ?auto_44363 ?auto_44364 ) ) ( not ( = ?auto_44363 ?auto_44365 ) ) ( not ( = ?auto_44364 ?auto_44365 ) ) ( ON ?auto_44363 ?auto_44364 ) ( ON ?auto_44362 ?auto_44363 ) ( ON ?auto_44361 ?auto_44362 ) ( CLEAR ?auto_44361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44361 )
      ( MAKE-4PILE ?auto_44361 ?auto_44362 ?auto_44363 ?auto_44364 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44370 - BLOCK
      ?auto_44371 - BLOCK
      ?auto_44372 - BLOCK
      ?auto_44373 - BLOCK
    )
    :vars
    (
      ?auto_44374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44373 ?auto_44374 ) ( not ( = ?auto_44370 ?auto_44371 ) ) ( not ( = ?auto_44370 ?auto_44372 ) ) ( not ( = ?auto_44370 ?auto_44373 ) ) ( not ( = ?auto_44370 ?auto_44374 ) ) ( not ( = ?auto_44371 ?auto_44372 ) ) ( not ( = ?auto_44371 ?auto_44373 ) ) ( not ( = ?auto_44371 ?auto_44374 ) ) ( not ( = ?auto_44372 ?auto_44373 ) ) ( not ( = ?auto_44372 ?auto_44374 ) ) ( not ( = ?auto_44373 ?auto_44374 ) ) ( ON ?auto_44372 ?auto_44373 ) ( ON ?auto_44371 ?auto_44372 ) ( ON ?auto_44370 ?auto_44371 ) ( CLEAR ?auto_44370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44370 )
      ( MAKE-4PILE ?auto_44370 ?auto_44371 ?auto_44372 ?auto_44373 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44380 - BLOCK
      ?auto_44381 - BLOCK
      ?auto_44382 - BLOCK
      ?auto_44383 - BLOCK
      ?auto_44384 - BLOCK
    )
    :vars
    (
      ?auto_44385 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_44383 ) ( ON ?auto_44384 ?auto_44385 ) ( CLEAR ?auto_44384 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44380 ) ( ON ?auto_44381 ?auto_44380 ) ( ON ?auto_44382 ?auto_44381 ) ( ON ?auto_44383 ?auto_44382 ) ( not ( = ?auto_44380 ?auto_44381 ) ) ( not ( = ?auto_44380 ?auto_44382 ) ) ( not ( = ?auto_44380 ?auto_44383 ) ) ( not ( = ?auto_44380 ?auto_44384 ) ) ( not ( = ?auto_44380 ?auto_44385 ) ) ( not ( = ?auto_44381 ?auto_44382 ) ) ( not ( = ?auto_44381 ?auto_44383 ) ) ( not ( = ?auto_44381 ?auto_44384 ) ) ( not ( = ?auto_44381 ?auto_44385 ) ) ( not ( = ?auto_44382 ?auto_44383 ) ) ( not ( = ?auto_44382 ?auto_44384 ) ) ( not ( = ?auto_44382 ?auto_44385 ) ) ( not ( = ?auto_44383 ?auto_44384 ) ) ( not ( = ?auto_44383 ?auto_44385 ) ) ( not ( = ?auto_44384 ?auto_44385 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44384 ?auto_44385 )
      ( !STACK ?auto_44384 ?auto_44383 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44391 - BLOCK
      ?auto_44392 - BLOCK
      ?auto_44393 - BLOCK
      ?auto_44394 - BLOCK
      ?auto_44395 - BLOCK
    )
    :vars
    (
      ?auto_44396 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_44394 ) ( ON ?auto_44395 ?auto_44396 ) ( CLEAR ?auto_44395 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44391 ) ( ON ?auto_44392 ?auto_44391 ) ( ON ?auto_44393 ?auto_44392 ) ( ON ?auto_44394 ?auto_44393 ) ( not ( = ?auto_44391 ?auto_44392 ) ) ( not ( = ?auto_44391 ?auto_44393 ) ) ( not ( = ?auto_44391 ?auto_44394 ) ) ( not ( = ?auto_44391 ?auto_44395 ) ) ( not ( = ?auto_44391 ?auto_44396 ) ) ( not ( = ?auto_44392 ?auto_44393 ) ) ( not ( = ?auto_44392 ?auto_44394 ) ) ( not ( = ?auto_44392 ?auto_44395 ) ) ( not ( = ?auto_44392 ?auto_44396 ) ) ( not ( = ?auto_44393 ?auto_44394 ) ) ( not ( = ?auto_44393 ?auto_44395 ) ) ( not ( = ?auto_44393 ?auto_44396 ) ) ( not ( = ?auto_44394 ?auto_44395 ) ) ( not ( = ?auto_44394 ?auto_44396 ) ) ( not ( = ?auto_44395 ?auto_44396 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44395 ?auto_44396 )
      ( !STACK ?auto_44395 ?auto_44394 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44402 - BLOCK
      ?auto_44403 - BLOCK
      ?auto_44404 - BLOCK
      ?auto_44405 - BLOCK
      ?auto_44406 - BLOCK
    )
    :vars
    (
      ?auto_44407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44406 ?auto_44407 ) ( ON-TABLE ?auto_44402 ) ( ON ?auto_44403 ?auto_44402 ) ( ON ?auto_44404 ?auto_44403 ) ( not ( = ?auto_44402 ?auto_44403 ) ) ( not ( = ?auto_44402 ?auto_44404 ) ) ( not ( = ?auto_44402 ?auto_44405 ) ) ( not ( = ?auto_44402 ?auto_44406 ) ) ( not ( = ?auto_44402 ?auto_44407 ) ) ( not ( = ?auto_44403 ?auto_44404 ) ) ( not ( = ?auto_44403 ?auto_44405 ) ) ( not ( = ?auto_44403 ?auto_44406 ) ) ( not ( = ?auto_44403 ?auto_44407 ) ) ( not ( = ?auto_44404 ?auto_44405 ) ) ( not ( = ?auto_44404 ?auto_44406 ) ) ( not ( = ?auto_44404 ?auto_44407 ) ) ( not ( = ?auto_44405 ?auto_44406 ) ) ( not ( = ?auto_44405 ?auto_44407 ) ) ( not ( = ?auto_44406 ?auto_44407 ) ) ( CLEAR ?auto_44404 ) ( ON ?auto_44405 ?auto_44406 ) ( CLEAR ?auto_44405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44402 ?auto_44403 ?auto_44404 ?auto_44405 )
      ( MAKE-5PILE ?auto_44402 ?auto_44403 ?auto_44404 ?auto_44405 ?auto_44406 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44413 - BLOCK
      ?auto_44414 - BLOCK
      ?auto_44415 - BLOCK
      ?auto_44416 - BLOCK
      ?auto_44417 - BLOCK
    )
    :vars
    (
      ?auto_44418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44417 ?auto_44418 ) ( ON-TABLE ?auto_44413 ) ( ON ?auto_44414 ?auto_44413 ) ( ON ?auto_44415 ?auto_44414 ) ( not ( = ?auto_44413 ?auto_44414 ) ) ( not ( = ?auto_44413 ?auto_44415 ) ) ( not ( = ?auto_44413 ?auto_44416 ) ) ( not ( = ?auto_44413 ?auto_44417 ) ) ( not ( = ?auto_44413 ?auto_44418 ) ) ( not ( = ?auto_44414 ?auto_44415 ) ) ( not ( = ?auto_44414 ?auto_44416 ) ) ( not ( = ?auto_44414 ?auto_44417 ) ) ( not ( = ?auto_44414 ?auto_44418 ) ) ( not ( = ?auto_44415 ?auto_44416 ) ) ( not ( = ?auto_44415 ?auto_44417 ) ) ( not ( = ?auto_44415 ?auto_44418 ) ) ( not ( = ?auto_44416 ?auto_44417 ) ) ( not ( = ?auto_44416 ?auto_44418 ) ) ( not ( = ?auto_44417 ?auto_44418 ) ) ( CLEAR ?auto_44415 ) ( ON ?auto_44416 ?auto_44417 ) ( CLEAR ?auto_44416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44413 ?auto_44414 ?auto_44415 ?auto_44416 )
      ( MAKE-5PILE ?auto_44413 ?auto_44414 ?auto_44415 ?auto_44416 ?auto_44417 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44424 - BLOCK
      ?auto_44425 - BLOCK
      ?auto_44426 - BLOCK
      ?auto_44427 - BLOCK
      ?auto_44428 - BLOCK
    )
    :vars
    (
      ?auto_44429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44428 ?auto_44429 ) ( ON-TABLE ?auto_44424 ) ( ON ?auto_44425 ?auto_44424 ) ( not ( = ?auto_44424 ?auto_44425 ) ) ( not ( = ?auto_44424 ?auto_44426 ) ) ( not ( = ?auto_44424 ?auto_44427 ) ) ( not ( = ?auto_44424 ?auto_44428 ) ) ( not ( = ?auto_44424 ?auto_44429 ) ) ( not ( = ?auto_44425 ?auto_44426 ) ) ( not ( = ?auto_44425 ?auto_44427 ) ) ( not ( = ?auto_44425 ?auto_44428 ) ) ( not ( = ?auto_44425 ?auto_44429 ) ) ( not ( = ?auto_44426 ?auto_44427 ) ) ( not ( = ?auto_44426 ?auto_44428 ) ) ( not ( = ?auto_44426 ?auto_44429 ) ) ( not ( = ?auto_44427 ?auto_44428 ) ) ( not ( = ?auto_44427 ?auto_44429 ) ) ( not ( = ?auto_44428 ?auto_44429 ) ) ( ON ?auto_44427 ?auto_44428 ) ( CLEAR ?auto_44425 ) ( ON ?auto_44426 ?auto_44427 ) ( CLEAR ?auto_44426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44424 ?auto_44425 ?auto_44426 )
      ( MAKE-5PILE ?auto_44424 ?auto_44425 ?auto_44426 ?auto_44427 ?auto_44428 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44435 - BLOCK
      ?auto_44436 - BLOCK
      ?auto_44437 - BLOCK
      ?auto_44438 - BLOCK
      ?auto_44439 - BLOCK
    )
    :vars
    (
      ?auto_44440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44439 ?auto_44440 ) ( ON-TABLE ?auto_44435 ) ( ON ?auto_44436 ?auto_44435 ) ( not ( = ?auto_44435 ?auto_44436 ) ) ( not ( = ?auto_44435 ?auto_44437 ) ) ( not ( = ?auto_44435 ?auto_44438 ) ) ( not ( = ?auto_44435 ?auto_44439 ) ) ( not ( = ?auto_44435 ?auto_44440 ) ) ( not ( = ?auto_44436 ?auto_44437 ) ) ( not ( = ?auto_44436 ?auto_44438 ) ) ( not ( = ?auto_44436 ?auto_44439 ) ) ( not ( = ?auto_44436 ?auto_44440 ) ) ( not ( = ?auto_44437 ?auto_44438 ) ) ( not ( = ?auto_44437 ?auto_44439 ) ) ( not ( = ?auto_44437 ?auto_44440 ) ) ( not ( = ?auto_44438 ?auto_44439 ) ) ( not ( = ?auto_44438 ?auto_44440 ) ) ( not ( = ?auto_44439 ?auto_44440 ) ) ( ON ?auto_44438 ?auto_44439 ) ( CLEAR ?auto_44436 ) ( ON ?auto_44437 ?auto_44438 ) ( CLEAR ?auto_44437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44435 ?auto_44436 ?auto_44437 )
      ( MAKE-5PILE ?auto_44435 ?auto_44436 ?auto_44437 ?auto_44438 ?auto_44439 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44446 - BLOCK
      ?auto_44447 - BLOCK
      ?auto_44448 - BLOCK
      ?auto_44449 - BLOCK
      ?auto_44450 - BLOCK
    )
    :vars
    (
      ?auto_44451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44450 ?auto_44451 ) ( ON-TABLE ?auto_44446 ) ( not ( = ?auto_44446 ?auto_44447 ) ) ( not ( = ?auto_44446 ?auto_44448 ) ) ( not ( = ?auto_44446 ?auto_44449 ) ) ( not ( = ?auto_44446 ?auto_44450 ) ) ( not ( = ?auto_44446 ?auto_44451 ) ) ( not ( = ?auto_44447 ?auto_44448 ) ) ( not ( = ?auto_44447 ?auto_44449 ) ) ( not ( = ?auto_44447 ?auto_44450 ) ) ( not ( = ?auto_44447 ?auto_44451 ) ) ( not ( = ?auto_44448 ?auto_44449 ) ) ( not ( = ?auto_44448 ?auto_44450 ) ) ( not ( = ?auto_44448 ?auto_44451 ) ) ( not ( = ?auto_44449 ?auto_44450 ) ) ( not ( = ?auto_44449 ?auto_44451 ) ) ( not ( = ?auto_44450 ?auto_44451 ) ) ( ON ?auto_44449 ?auto_44450 ) ( ON ?auto_44448 ?auto_44449 ) ( CLEAR ?auto_44446 ) ( ON ?auto_44447 ?auto_44448 ) ( CLEAR ?auto_44447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44446 ?auto_44447 )
      ( MAKE-5PILE ?auto_44446 ?auto_44447 ?auto_44448 ?auto_44449 ?auto_44450 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44457 - BLOCK
      ?auto_44458 - BLOCK
      ?auto_44459 - BLOCK
      ?auto_44460 - BLOCK
      ?auto_44461 - BLOCK
    )
    :vars
    (
      ?auto_44462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44461 ?auto_44462 ) ( ON-TABLE ?auto_44457 ) ( not ( = ?auto_44457 ?auto_44458 ) ) ( not ( = ?auto_44457 ?auto_44459 ) ) ( not ( = ?auto_44457 ?auto_44460 ) ) ( not ( = ?auto_44457 ?auto_44461 ) ) ( not ( = ?auto_44457 ?auto_44462 ) ) ( not ( = ?auto_44458 ?auto_44459 ) ) ( not ( = ?auto_44458 ?auto_44460 ) ) ( not ( = ?auto_44458 ?auto_44461 ) ) ( not ( = ?auto_44458 ?auto_44462 ) ) ( not ( = ?auto_44459 ?auto_44460 ) ) ( not ( = ?auto_44459 ?auto_44461 ) ) ( not ( = ?auto_44459 ?auto_44462 ) ) ( not ( = ?auto_44460 ?auto_44461 ) ) ( not ( = ?auto_44460 ?auto_44462 ) ) ( not ( = ?auto_44461 ?auto_44462 ) ) ( ON ?auto_44460 ?auto_44461 ) ( ON ?auto_44459 ?auto_44460 ) ( CLEAR ?auto_44457 ) ( ON ?auto_44458 ?auto_44459 ) ( CLEAR ?auto_44458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44457 ?auto_44458 )
      ( MAKE-5PILE ?auto_44457 ?auto_44458 ?auto_44459 ?auto_44460 ?auto_44461 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44468 - BLOCK
      ?auto_44469 - BLOCK
      ?auto_44470 - BLOCK
      ?auto_44471 - BLOCK
      ?auto_44472 - BLOCK
    )
    :vars
    (
      ?auto_44473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44472 ?auto_44473 ) ( not ( = ?auto_44468 ?auto_44469 ) ) ( not ( = ?auto_44468 ?auto_44470 ) ) ( not ( = ?auto_44468 ?auto_44471 ) ) ( not ( = ?auto_44468 ?auto_44472 ) ) ( not ( = ?auto_44468 ?auto_44473 ) ) ( not ( = ?auto_44469 ?auto_44470 ) ) ( not ( = ?auto_44469 ?auto_44471 ) ) ( not ( = ?auto_44469 ?auto_44472 ) ) ( not ( = ?auto_44469 ?auto_44473 ) ) ( not ( = ?auto_44470 ?auto_44471 ) ) ( not ( = ?auto_44470 ?auto_44472 ) ) ( not ( = ?auto_44470 ?auto_44473 ) ) ( not ( = ?auto_44471 ?auto_44472 ) ) ( not ( = ?auto_44471 ?auto_44473 ) ) ( not ( = ?auto_44472 ?auto_44473 ) ) ( ON ?auto_44471 ?auto_44472 ) ( ON ?auto_44470 ?auto_44471 ) ( ON ?auto_44469 ?auto_44470 ) ( ON ?auto_44468 ?auto_44469 ) ( CLEAR ?auto_44468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44468 )
      ( MAKE-5PILE ?auto_44468 ?auto_44469 ?auto_44470 ?auto_44471 ?auto_44472 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44479 - BLOCK
      ?auto_44480 - BLOCK
      ?auto_44481 - BLOCK
      ?auto_44482 - BLOCK
      ?auto_44483 - BLOCK
    )
    :vars
    (
      ?auto_44484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44483 ?auto_44484 ) ( not ( = ?auto_44479 ?auto_44480 ) ) ( not ( = ?auto_44479 ?auto_44481 ) ) ( not ( = ?auto_44479 ?auto_44482 ) ) ( not ( = ?auto_44479 ?auto_44483 ) ) ( not ( = ?auto_44479 ?auto_44484 ) ) ( not ( = ?auto_44480 ?auto_44481 ) ) ( not ( = ?auto_44480 ?auto_44482 ) ) ( not ( = ?auto_44480 ?auto_44483 ) ) ( not ( = ?auto_44480 ?auto_44484 ) ) ( not ( = ?auto_44481 ?auto_44482 ) ) ( not ( = ?auto_44481 ?auto_44483 ) ) ( not ( = ?auto_44481 ?auto_44484 ) ) ( not ( = ?auto_44482 ?auto_44483 ) ) ( not ( = ?auto_44482 ?auto_44484 ) ) ( not ( = ?auto_44483 ?auto_44484 ) ) ( ON ?auto_44482 ?auto_44483 ) ( ON ?auto_44481 ?auto_44482 ) ( ON ?auto_44480 ?auto_44481 ) ( ON ?auto_44479 ?auto_44480 ) ( CLEAR ?auto_44479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44479 )
      ( MAKE-5PILE ?auto_44479 ?auto_44480 ?auto_44481 ?auto_44482 ?auto_44483 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44491 - BLOCK
      ?auto_44492 - BLOCK
      ?auto_44493 - BLOCK
      ?auto_44494 - BLOCK
      ?auto_44495 - BLOCK
      ?auto_44496 - BLOCK
    )
    :vars
    (
      ?auto_44497 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_44495 ) ( ON ?auto_44496 ?auto_44497 ) ( CLEAR ?auto_44496 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44491 ) ( ON ?auto_44492 ?auto_44491 ) ( ON ?auto_44493 ?auto_44492 ) ( ON ?auto_44494 ?auto_44493 ) ( ON ?auto_44495 ?auto_44494 ) ( not ( = ?auto_44491 ?auto_44492 ) ) ( not ( = ?auto_44491 ?auto_44493 ) ) ( not ( = ?auto_44491 ?auto_44494 ) ) ( not ( = ?auto_44491 ?auto_44495 ) ) ( not ( = ?auto_44491 ?auto_44496 ) ) ( not ( = ?auto_44491 ?auto_44497 ) ) ( not ( = ?auto_44492 ?auto_44493 ) ) ( not ( = ?auto_44492 ?auto_44494 ) ) ( not ( = ?auto_44492 ?auto_44495 ) ) ( not ( = ?auto_44492 ?auto_44496 ) ) ( not ( = ?auto_44492 ?auto_44497 ) ) ( not ( = ?auto_44493 ?auto_44494 ) ) ( not ( = ?auto_44493 ?auto_44495 ) ) ( not ( = ?auto_44493 ?auto_44496 ) ) ( not ( = ?auto_44493 ?auto_44497 ) ) ( not ( = ?auto_44494 ?auto_44495 ) ) ( not ( = ?auto_44494 ?auto_44496 ) ) ( not ( = ?auto_44494 ?auto_44497 ) ) ( not ( = ?auto_44495 ?auto_44496 ) ) ( not ( = ?auto_44495 ?auto_44497 ) ) ( not ( = ?auto_44496 ?auto_44497 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44496 ?auto_44497 )
      ( !STACK ?auto_44496 ?auto_44495 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44504 - BLOCK
      ?auto_44505 - BLOCK
      ?auto_44506 - BLOCK
      ?auto_44507 - BLOCK
      ?auto_44508 - BLOCK
      ?auto_44509 - BLOCK
    )
    :vars
    (
      ?auto_44510 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_44508 ) ( ON ?auto_44509 ?auto_44510 ) ( CLEAR ?auto_44509 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44504 ) ( ON ?auto_44505 ?auto_44504 ) ( ON ?auto_44506 ?auto_44505 ) ( ON ?auto_44507 ?auto_44506 ) ( ON ?auto_44508 ?auto_44507 ) ( not ( = ?auto_44504 ?auto_44505 ) ) ( not ( = ?auto_44504 ?auto_44506 ) ) ( not ( = ?auto_44504 ?auto_44507 ) ) ( not ( = ?auto_44504 ?auto_44508 ) ) ( not ( = ?auto_44504 ?auto_44509 ) ) ( not ( = ?auto_44504 ?auto_44510 ) ) ( not ( = ?auto_44505 ?auto_44506 ) ) ( not ( = ?auto_44505 ?auto_44507 ) ) ( not ( = ?auto_44505 ?auto_44508 ) ) ( not ( = ?auto_44505 ?auto_44509 ) ) ( not ( = ?auto_44505 ?auto_44510 ) ) ( not ( = ?auto_44506 ?auto_44507 ) ) ( not ( = ?auto_44506 ?auto_44508 ) ) ( not ( = ?auto_44506 ?auto_44509 ) ) ( not ( = ?auto_44506 ?auto_44510 ) ) ( not ( = ?auto_44507 ?auto_44508 ) ) ( not ( = ?auto_44507 ?auto_44509 ) ) ( not ( = ?auto_44507 ?auto_44510 ) ) ( not ( = ?auto_44508 ?auto_44509 ) ) ( not ( = ?auto_44508 ?auto_44510 ) ) ( not ( = ?auto_44509 ?auto_44510 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44509 ?auto_44510 )
      ( !STACK ?auto_44509 ?auto_44508 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44517 - BLOCK
      ?auto_44518 - BLOCK
      ?auto_44519 - BLOCK
      ?auto_44520 - BLOCK
      ?auto_44521 - BLOCK
      ?auto_44522 - BLOCK
    )
    :vars
    (
      ?auto_44523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44522 ?auto_44523 ) ( ON-TABLE ?auto_44517 ) ( ON ?auto_44518 ?auto_44517 ) ( ON ?auto_44519 ?auto_44518 ) ( ON ?auto_44520 ?auto_44519 ) ( not ( = ?auto_44517 ?auto_44518 ) ) ( not ( = ?auto_44517 ?auto_44519 ) ) ( not ( = ?auto_44517 ?auto_44520 ) ) ( not ( = ?auto_44517 ?auto_44521 ) ) ( not ( = ?auto_44517 ?auto_44522 ) ) ( not ( = ?auto_44517 ?auto_44523 ) ) ( not ( = ?auto_44518 ?auto_44519 ) ) ( not ( = ?auto_44518 ?auto_44520 ) ) ( not ( = ?auto_44518 ?auto_44521 ) ) ( not ( = ?auto_44518 ?auto_44522 ) ) ( not ( = ?auto_44518 ?auto_44523 ) ) ( not ( = ?auto_44519 ?auto_44520 ) ) ( not ( = ?auto_44519 ?auto_44521 ) ) ( not ( = ?auto_44519 ?auto_44522 ) ) ( not ( = ?auto_44519 ?auto_44523 ) ) ( not ( = ?auto_44520 ?auto_44521 ) ) ( not ( = ?auto_44520 ?auto_44522 ) ) ( not ( = ?auto_44520 ?auto_44523 ) ) ( not ( = ?auto_44521 ?auto_44522 ) ) ( not ( = ?auto_44521 ?auto_44523 ) ) ( not ( = ?auto_44522 ?auto_44523 ) ) ( CLEAR ?auto_44520 ) ( ON ?auto_44521 ?auto_44522 ) ( CLEAR ?auto_44521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44517 ?auto_44518 ?auto_44519 ?auto_44520 ?auto_44521 )
      ( MAKE-6PILE ?auto_44517 ?auto_44518 ?auto_44519 ?auto_44520 ?auto_44521 ?auto_44522 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44530 - BLOCK
      ?auto_44531 - BLOCK
      ?auto_44532 - BLOCK
      ?auto_44533 - BLOCK
      ?auto_44534 - BLOCK
      ?auto_44535 - BLOCK
    )
    :vars
    (
      ?auto_44536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44535 ?auto_44536 ) ( ON-TABLE ?auto_44530 ) ( ON ?auto_44531 ?auto_44530 ) ( ON ?auto_44532 ?auto_44531 ) ( ON ?auto_44533 ?auto_44532 ) ( not ( = ?auto_44530 ?auto_44531 ) ) ( not ( = ?auto_44530 ?auto_44532 ) ) ( not ( = ?auto_44530 ?auto_44533 ) ) ( not ( = ?auto_44530 ?auto_44534 ) ) ( not ( = ?auto_44530 ?auto_44535 ) ) ( not ( = ?auto_44530 ?auto_44536 ) ) ( not ( = ?auto_44531 ?auto_44532 ) ) ( not ( = ?auto_44531 ?auto_44533 ) ) ( not ( = ?auto_44531 ?auto_44534 ) ) ( not ( = ?auto_44531 ?auto_44535 ) ) ( not ( = ?auto_44531 ?auto_44536 ) ) ( not ( = ?auto_44532 ?auto_44533 ) ) ( not ( = ?auto_44532 ?auto_44534 ) ) ( not ( = ?auto_44532 ?auto_44535 ) ) ( not ( = ?auto_44532 ?auto_44536 ) ) ( not ( = ?auto_44533 ?auto_44534 ) ) ( not ( = ?auto_44533 ?auto_44535 ) ) ( not ( = ?auto_44533 ?auto_44536 ) ) ( not ( = ?auto_44534 ?auto_44535 ) ) ( not ( = ?auto_44534 ?auto_44536 ) ) ( not ( = ?auto_44535 ?auto_44536 ) ) ( CLEAR ?auto_44533 ) ( ON ?auto_44534 ?auto_44535 ) ( CLEAR ?auto_44534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44530 ?auto_44531 ?auto_44532 ?auto_44533 ?auto_44534 )
      ( MAKE-6PILE ?auto_44530 ?auto_44531 ?auto_44532 ?auto_44533 ?auto_44534 ?auto_44535 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44543 - BLOCK
      ?auto_44544 - BLOCK
      ?auto_44545 - BLOCK
      ?auto_44546 - BLOCK
      ?auto_44547 - BLOCK
      ?auto_44548 - BLOCK
    )
    :vars
    (
      ?auto_44549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44548 ?auto_44549 ) ( ON-TABLE ?auto_44543 ) ( ON ?auto_44544 ?auto_44543 ) ( ON ?auto_44545 ?auto_44544 ) ( not ( = ?auto_44543 ?auto_44544 ) ) ( not ( = ?auto_44543 ?auto_44545 ) ) ( not ( = ?auto_44543 ?auto_44546 ) ) ( not ( = ?auto_44543 ?auto_44547 ) ) ( not ( = ?auto_44543 ?auto_44548 ) ) ( not ( = ?auto_44543 ?auto_44549 ) ) ( not ( = ?auto_44544 ?auto_44545 ) ) ( not ( = ?auto_44544 ?auto_44546 ) ) ( not ( = ?auto_44544 ?auto_44547 ) ) ( not ( = ?auto_44544 ?auto_44548 ) ) ( not ( = ?auto_44544 ?auto_44549 ) ) ( not ( = ?auto_44545 ?auto_44546 ) ) ( not ( = ?auto_44545 ?auto_44547 ) ) ( not ( = ?auto_44545 ?auto_44548 ) ) ( not ( = ?auto_44545 ?auto_44549 ) ) ( not ( = ?auto_44546 ?auto_44547 ) ) ( not ( = ?auto_44546 ?auto_44548 ) ) ( not ( = ?auto_44546 ?auto_44549 ) ) ( not ( = ?auto_44547 ?auto_44548 ) ) ( not ( = ?auto_44547 ?auto_44549 ) ) ( not ( = ?auto_44548 ?auto_44549 ) ) ( ON ?auto_44547 ?auto_44548 ) ( CLEAR ?auto_44545 ) ( ON ?auto_44546 ?auto_44547 ) ( CLEAR ?auto_44546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44543 ?auto_44544 ?auto_44545 ?auto_44546 )
      ( MAKE-6PILE ?auto_44543 ?auto_44544 ?auto_44545 ?auto_44546 ?auto_44547 ?auto_44548 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44556 - BLOCK
      ?auto_44557 - BLOCK
      ?auto_44558 - BLOCK
      ?auto_44559 - BLOCK
      ?auto_44560 - BLOCK
      ?auto_44561 - BLOCK
    )
    :vars
    (
      ?auto_44562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44561 ?auto_44562 ) ( ON-TABLE ?auto_44556 ) ( ON ?auto_44557 ?auto_44556 ) ( ON ?auto_44558 ?auto_44557 ) ( not ( = ?auto_44556 ?auto_44557 ) ) ( not ( = ?auto_44556 ?auto_44558 ) ) ( not ( = ?auto_44556 ?auto_44559 ) ) ( not ( = ?auto_44556 ?auto_44560 ) ) ( not ( = ?auto_44556 ?auto_44561 ) ) ( not ( = ?auto_44556 ?auto_44562 ) ) ( not ( = ?auto_44557 ?auto_44558 ) ) ( not ( = ?auto_44557 ?auto_44559 ) ) ( not ( = ?auto_44557 ?auto_44560 ) ) ( not ( = ?auto_44557 ?auto_44561 ) ) ( not ( = ?auto_44557 ?auto_44562 ) ) ( not ( = ?auto_44558 ?auto_44559 ) ) ( not ( = ?auto_44558 ?auto_44560 ) ) ( not ( = ?auto_44558 ?auto_44561 ) ) ( not ( = ?auto_44558 ?auto_44562 ) ) ( not ( = ?auto_44559 ?auto_44560 ) ) ( not ( = ?auto_44559 ?auto_44561 ) ) ( not ( = ?auto_44559 ?auto_44562 ) ) ( not ( = ?auto_44560 ?auto_44561 ) ) ( not ( = ?auto_44560 ?auto_44562 ) ) ( not ( = ?auto_44561 ?auto_44562 ) ) ( ON ?auto_44560 ?auto_44561 ) ( CLEAR ?auto_44558 ) ( ON ?auto_44559 ?auto_44560 ) ( CLEAR ?auto_44559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44556 ?auto_44557 ?auto_44558 ?auto_44559 )
      ( MAKE-6PILE ?auto_44556 ?auto_44557 ?auto_44558 ?auto_44559 ?auto_44560 ?auto_44561 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44569 - BLOCK
      ?auto_44570 - BLOCK
      ?auto_44571 - BLOCK
      ?auto_44572 - BLOCK
      ?auto_44573 - BLOCK
      ?auto_44574 - BLOCK
    )
    :vars
    (
      ?auto_44575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44574 ?auto_44575 ) ( ON-TABLE ?auto_44569 ) ( ON ?auto_44570 ?auto_44569 ) ( not ( = ?auto_44569 ?auto_44570 ) ) ( not ( = ?auto_44569 ?auto_44571 ) ) ( not ( = ?auto_44569 ?auto_44572 ) ) ( not ( = ?auto_44569 ?auto_44573 ) ) ( not ( = ?auto_44569 ?auto_44574 ) ) ( not ( = ?auto_44569 ?auto_44575 ) ) ( not ( = ?auto_44570 ?auto_44571 ) ) ( not ( = ?auto_44570 ?auto_44572 ) ) ( not ( = ?auto_44570 ?auto_44573 ) ) ( not ( = ?auto_44570 ?auto_44574 ) ) ( not ( = ?auto_44570 ?auto_44575 ) ) ( not ( = ?auto_44571 ?auto_44572 ) ) ( not ( = ?auto_44571 ?auto_44573 ) ) ( not ( = ?auto_44571 ?auto_44574 ) ) ( not ( = ?auto_44571 ?auto_44575 ) ) ( not ( = ?auto_44572 ?auto_44573 ) ) ( not ( = ?auto_44572 ?auto_44574 ) ) ( not ( = ?auto_44572 ?auto_44575 ) ) ( not ( = ?auto_44573 ?auto_44574 ) ) ( not ( = ?auto_44573 ?auto_44575 ) ) ( not ( = ?auto_44574 ?auto_44575 ) ) ( ON ?auto_44573 ?auto_44574 ) ( ON ?auto_44572 ?auto_44573 ) ( CLEAR ?auto_44570 ) ( ON ?auto_44571 ?auto_44572 ) ( CLEAR ?auto_44571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44569 ?auto_44570 ?auto_44571 )
      ( MAKE-6PILE ?auto_44569 ?auto_44570 ?auto_44571 ?auto_44572 ?auto_44573 ?auto_44574 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44582 - BLOCK
      ?auto_44583 - BLOCK
      ?auto_44584 - BLOCK
      ?auto_44585 - BLOCK
      ?auto_44586 - BLOCK
      ?auto_44587 - BLOCK
    )
    :vars
    (
      ?auto_44588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44587 ?auto_44588 ) ( ON-TABLE ?auto_44582 ) ( ON ?auto_44583 ?auto_44582 ) ( not ( = ?auto_44582 ?auto_44583 ) ) ( not ( = ?auto_44582 ?auto_44584 ) ) ( not ( = ?auto_44582 ?auto_44585 ) ) ( not ( = ?auto_44582 ?auto_44586 ) ) ( not ( = ?auto_44582 ?auto_44587 ) ) ( not ( = ?auto_44582 ?auto_44588 ) ) ( not ( = ?auto_44583 ?auto_44584 ) ) ( not ( = ?auto_44583 ?auto_44585 ) ) ( not ( = ?auto_44583 ?auto_44586 ) ) ( not ( = ?auto_44583 ?auto_44587 ) ) ( not ( = ?auto_44583 ?auto_44588 ) ) ( not ( = ?auto_44584 ?auto_44585 ) ) ( not ( = ?auto_44584 ?auto_44586 ) ) ( not ( = ?auto_44584 ?auto_44587 ) ) ( not ( = ?auto_44584 ?auto_44588 ) ) ( not ( = ?auto_44585 ?auto_44586 ) ) ( not ( = ?auto_44585 ?auto_44587 ) ) ( not ( = ?auto_44585 ?auto_44588 ) ) ( not ( = ?auto_44586 ?auto_44587 ) ) ( not ( = ?auto_44586 ?auto_44588 ) ) ( not ( = ?auto_44587 ?auto_44588 ) ) ( ON ?auto_44586 ?auto_44587 ) ( ON ?auto_44585 ?auto_44586 ) ( CLEAR ?auto_44583 ) ( ON ?auto_44584 ?auto_44585 ) ( CLEAR ?auto_44584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44582 ?auto_44583 ?auto_44584 )
      ( MAKE-6PILE ?auto_44582 ?auto_44583 ?auto_44584 ?auto_44585 ?auto_44586 ?auto_44587 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44595 - BLOCK
      ?auto_44596 - BLOCK
      ?auto_44597 - BLOCK
      ?auto_44598 - BLOCK
      ?auto_44599 - BLOCK
      ?auto_44600 - BLOCK
    )
    :vars
    (
      ?auto_44601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44600 ?auto_44601 ) ( ON-TABLE ?auto_44595 ) ( not ( = ?auto_44595 ?auto_44596 ) ) ( not ( = ?auto_44595 ?auto_44597 ) ) ( not ( = ?auto_44595 ?auto_44598 ) ) ( not ( = ?auto_44595 ?auto_44599 ) ) ( not ( = ?auto_44595 ?auto_44600 ) ) ( not ( = ?auto_44595 ?auto_44601 ) ) ( not ( = ?auto_44596 ?auto_44597 ) ) ( not ( = ?auto_44596 ?auto_44598 ) ) ( not ( = ?auto_44596 ?auto_44599 ) ) ( not ( = ?auto_44596 ?auto_44600 ) ) ( not ( = ?auto_44596 ?auto_44601 ) ) ( not ( = ?auto_44597 ?auto_44598 ) ) ( not ( = ?auto_44597 ?auto_44599 ) ) ( not ( = ?auto_44597 ?auto_44600 ) ) ( not ( = ?auto_44597 ?auto_44601 ) ) ( not ( = ?auto_44598 ?auto_44599 ) ) ( not ( = ?auto_44598 ?auto_44600 ) ) ( not ( = ?auto_44598 ?auto_44601 ) ) ( not ( = ?auto_44599 ?auto_44600 ) ) ( not ( = ?auto_44599 ?auto_44601 ) ) ( not ( = ?auto_44600 ?auto_44601 ) ) ( ON ?auto_44599 ?auto_44600 ) ( ON ?auto_44598 ?auto_44599 ) ( ON ?auto_44597 ?auto_44598 ) ( CLEAR ?auto_44595 ) ( ON ?auto_44596 ?auto_44597 ) ( CLEAR ?auto_44596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44595 ?auto_44596 )
      ( MAKE-6PILE ?auto_44595 ?auto_44596 ?auto_44597 ?auto_44598 ?auto_44599 ?auto_44600 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44608 - BLOCK
      ?auto_44609 - BLOCK
      ?auto_44610 - BLOCK
      ?auto_44611 - BLOCK
      ?auto_44612 - BLOCK
      ?auto_44613 - BLOCK
    )
    :vars
    (
      ?auto_44614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44613 ?auto_44614 ) ( ON-TABLE ?auto_44608 ) ( not ( = ?auto_44608 ?auto_44609 ) ) ( not ( = ?auto_44608 ?auto_44610 ) ) ( not ( = ?auto_44608 ?auto_44611 ) ) ( not ( = ?auto_44608 ?auto_44612 ) ) ( not ( = ?auto_44608 ?auto_44613 ) ) ( not ( = ?auto_44608 ?auto_44614 ) ) ( not ( = ?auto_44609 ?auto_44610 ) ) ( not ( = ?auto_44609 ?auto_44611 ) ) ( not ( = ?auto_44609 ?auto_44612 ) ) ( not ( = ?auto_44609 ?auto_44613 ) ) ( not ( = ?auto_44609 ?auto_44614 ) ) ( not ( = ?auto_44610 ?auto_44611 ) ) ( not ( = ?auto_44610 ?auto_44612 ) ) ( not ( = ?auto_44610 ?auto_44613 ) ) ( not ( = ?auto_44610 ?auto_44614 ) ) ( not ( = ?auto_44611 ?auto_44612 ) ) ( not ( = ?auto_44611 ?auto_44613 ) ) ( not ( = ?auto_44611 ?auto_44614 ) ) ( not ( = ?auto_44612 ?auto_44613 ) ) ( not ( = ?auto_44612 ?auto_44614 ) ) ( not ( = ?auto_44613 ?auto_44614 ) ) ( ON ?auto_44612 ?auto_44613 ) ( ON ?auto_44611 ?auto_44612 ) ( ON ?auto_44610 ?auto_44611 ) ( CLEAR ?auto_44608 ) ( ON ?auto_44609 ?auto_44610 ) ( CLEAR ?auto_44609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44608 ?auto_44609 )
      ( MAKE-6PILE ?auto_44608 ?auto_44609 ?auto_44610 ?auto_44611 ?auto_44612 ?auto_44613 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44621 - BLOCK
      ?auto_44622 - BLOCK
      ?auto_44623 - BLOCK
      ?auto_44624 - BLOCK
      ?auto_44625 - BLOCK
      ?auto_44626 - BLOCK
    )
    :vars
    (
      ?auto_44627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44626 ?auto_44627 ) ( not ( = ?auto_44621 ?auto_44622 ) ) ( not ( = ?auto_44621 ?auto_44623 ) ) ( not ( = ?auto_44621 ?auto_44624 ) ) ( not ( = ?auto_44621 ?auto_44625 ) ) ( not ( = ?auto_44621 ?auto_44626 ) ) ( not ( = ?auto_44621 ?auto_44627 ) ) ( not ( = ?auto_44622 ?auto_44623 ) ) ( not ( = ?auto_44622 ?auto_44624 ) ) ( not ( = ?auto_44622 ?auto_44625 ) ) ( not ( = ?auto_44622 ?auto_44626 ) ) ( not ( = ?auto_44622 ?auto_44627 ) ) ( not ( = ?auto_44623 ?auto_44624 ) ) ( not ( = ?auto_44623 ?auto_44625 ) ) ( not ( = ?auto_44623 ?auto_44626 ) ) ( not ( = ?auto_44623 ?auto_44627 ) ) ( not ( = ?auto_44624 ?auto_44625 ) ) ( not ( = ?auto_44624 ?auto_44626 ) ) ( not ( = ?auto_44624 ?auto_44627 ) ) ( not ( = ?auto_44625 ?auto_44626 ) ) ( not ( = ?auto_44625 ?auto_44627 ) ) ( not ( = ?auto_44626 ?auto_44627 ) ) ( ON ?auto_44625 ?auto_44626 ) ( ON ?auto_44624 ?auto_44625 ) ( ON ?auto_44623 ?auto_44624 ) ( ON ?auto_44622 ?auto_44623 ) ( ON ?auto_44621 ?auto_44622 ) ( CLEAR ?auto_44621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44621 )
      ( MAKE-6PILE ?auto_44621 ?auto_44622 ?auto_44623 ?auto_44624 ?auto_44625 ?auto_44626 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44634 - BLOCK
      ?auto_44635 - BLOCK
      ?auto_44636 - BLOCK
      ?auto_44637 - BLOCK
      ?auto_44638 - BLOCK
      ?auto_44639 - BLOCK
    )
    :vars
    (
      ?auto_44640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44639 ?auto_44640 ) ( not ( = ?auto_44634 ?auto_44635 ) ) ( not ( = ?auto_44634 ?auto_44636 ) ) ( not ( = ?auto_44634 ?auto_44637 ) ) ( not ( = ?auto_44634 ?auto_44638 ) ) ( not ( = ?auto_44634 ?auto_44639 ) ) ( not ( = ?auto_44634 ?auto_44640 ) ) ( not ( = ?auto_44635 ?auto_44636 ) ) ( not ( = ?auto_44635 ?auto_44637 ) ) ( not ( = ?auto_44635 ?auto_44638 ) ) ( not ( = ?auto_44635 ?auto_44639 ) ) ( not ( = ?auto_44635 ?auto_44640 ) ) ( not ( = ?auto_44636 ?auto_44637 ) ) ( not ( = ?auto_44636 ?auto_44638 ) ) ( not ( = ?auto_44636 ?auto_44639 ) ) ( not ( = ?auto_44636 ?auto_44640 ) ) ( not ( = ?auto_44637 ?auto_44638 ) ) ( not ( = ?auto_44637 ?auto_44639 ) ) ( not ( = ?auto_44637 ?auto_44640 ) ) ( not ( = ?auto_44638 ?auto_44639 ) ) ( not ( = ?auto_44638 ?auto_44640 ) ) ( not ( = ?auto_44639 ?auto_44640 ) ) ( ON ?auto_44638 ?auto_44639 ) ( ON ?auto_44637 ?auto_44638 ) ( ON ?auto_44636 ?auto_44637 ) ( ON ?auto_44635 ?auto_44636 ) ( ON ?auto_44634 ?auto_44635 ) ( CLEAR ?auto_44634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44634 )
      ( MAKE-6PILE ?auto_44634 ?auto_44635 ?auto_44636 ?auto_44637 ?auto_44638 ?auto_44639 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_44648 - BLOCK
      ?auto_44649 - BLOCK
      ?auto_44650 - BLOCK
      ?auto_44651 - BLOCK
      ?auto_44652 - BLOCK
      ?auto_44653 - BLOCK
      ?auto_44654 - BLOCK
    )
    :vars
    (
      ?auto_44655 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_44653 ) ( ON ?auto_44654 ?auto_44655 ) ( CLEAR ?auto_44654 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44648 ) ( ON ?auto_44649 ?auto_44648 ) ( ON ?auto_44650 ?auto_44649 ) ( ON ?auto_44651 ?auto_44650 ) ( ON ?auto_44652 ?auto_44651 ) ( ON ?auto_44653 ?auto_44652 ) ( not ( = ?auto_44648 ?auto_44649 ) ) ( not ( = ?auto_44648 ?auto_44650 ) ) ( not ( = ?auto_44648 ?auto_44651 ) ) ( not ( = ?auto_44648 ?auto_44652 ) ) ( not ( = ?auto_44648 ?auto_44653 ) ) ( not ( = ?auto_44648 ?auto_44654 ) ) ( not ( = ?auto_44648 ?auto_44655 ) ) ( not ( = ?auto_44649 ?auto_44650 ) ) ( not ( = ?auto_44649 ?auto_44651 ) ) ( not ( = ?auto_44649 ?auto_44652 ) ) ( not ( = ?auto_44649 ?auto_44653 ) ) ( not ( = ?auto_44649 ?auto_44654 ) ) ( not ( = ?auto_44649 ?auto_44655 ) ) ( not ( = ?auto_44650 ?auto_44651 ) ) ( not ( = ?auto_44650 ?auto_44652 ) ) ( not ( = ?auto_44650 ?auto_44653 ) ) ( not ( = ?auto_44650 ?auto_44654 ) ) ( not ( = ?auto_44650 ?auto_44655 ) ) ( not ( = ?auto_44651 ?auto_44652 ) ) ( not ( = ?auto_44651 ?auto_44653 ) ) ( not ( = ?auto_44651 ?auto_44654 ) ) ( not ( = ?auto_44651 ?auto_44655 ) ) ( not ( = ?auto_44652 ?auto_44653 ) ) ( not ( = ?auto_44652 ?auto_44654 ) ) ( not ( = ?auto_44652 ?auto_44655 ) ) ( not ( = ?auto_44653 ?auto_44654 ) ) ( not ( = ?auto_44653 ?auto_44655 ) ) ( not ( = ?auto_44654 ?auto_44655 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44654 ?auto_44655 )
      ( !STACK ?auto_44654 ?auto_44653 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_44663 - BLOCK
      ?auto_44664 - BLOCK
      ?auto_44665 - BLOCK
      ?auto_44666 - BLOCK
      ?auto_44667 - BLOCK
      ?auto_44668 - BLOCK
      ?auto_44669 - BLOCK
    )
    :vars
    (
      ?auto_44670 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_44668 ) ( ON ?auto_44669 ?auto_44670 ) ( CLEAR ?auto_44669 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44663 ) ( ON ?auto_44664 ?auto_44663 ) ( ON ?auto_44665 ?auto_44664 ) ( ON ?auto_44666 ?auto_44665 ) ( ON ?auto_44667 ?auto_44666 ) ( ON ?auto_44668 ?auto_44667 ) ( not ( = ?auto_44663 ?auto_44664 ) ) ( not ( = ?auto_44663 ?auto_44665 ) ) ( not ( = ?auto_44663 ?auto_44666 ) ) ( not ( = ?auto_44663 ?auto_44667 ) ) ( not ( = ?auto_44663 ?auto_44668 ) ) ( not ( = ?auto_44663 ?auto_44669 ) ) ( not ( = ?auto_44663 ?auto_44670 ) ) ( not ( = ?auto_44664 ?auto_44665 ) ) ( not ( = ?auto_44664 ?auto_44666 ) ) ( not ( = ?auto_44664 ?auto_44667 ) ) ( not ( = ?auto_44664 ?auto_44668 ) ) ( not ( = ?auto_44664 ?auto_44669 ) ) ( not ( = ?auto_44664 ?auto_44670 ) ) ( not ( = ?auto_44665 ?auto_44666 ) ) ( not ( = ?auto_44665 ?auto_44667 ) ) ( not ( = ?auto_44665 ?auto_44668 ) ) ( not ( = ?auto_44665 ?auto_44669 ) ) ( not ( = ?auto_44665 ?auto_44670 ) ) ( not ( = ?auto_44666 ?auto_44667 ) ) ( not ( = ?auto_44666 ?auto_44668 ) ) ( not ( = ?auto_44666 ?auto_44669 ) ) ( not ( = ?auto_44666 ?auto_44670 ) ) ( not ( = ?auto_44667 ?auto_44668 ) ) ( not ( = ?auto_44667 ?auto_44669 ) ) ( not ( = ?auto_44667 ?auto_44670 ) ) ( not ( = ?auto_44668 ?auto_44669 ) ) ( not ( = ?auto_44668 ?auto_44670 ) ) ( not ( = ?auto_44669 ?auto_44670 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44669 ?auto_44670 )
      ( !STACK ?auto_44669 ?auto_44668 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_44678 - BLOCK
      ?auto_44679 - BLOCK
      ?auto_44680 - BLOCK
      ?auto_44681 - BLOCK
      ?auto_44682 - BLOCK
      ?auto_44683 - BLOCK
      ?auto_44684 - BLOCK
    )
    :vars
    (
      ?auto_44685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44684 ?auto_44685 ) ( ON-TABLE ?auto_44678 ) ( ON ?auto_44679 ?auto_44678 ) ( ON ?auto_44680 ?auto_44679 ) ( ON ?auto_44681 ?auto_44680 ) ( ON ?auto_44682 ?auto_44681 ) ( not ( = ?auto_44678 ?auto_44679 ) ) ( not ( = ?auto_44678 ?auto_44680 ) ) ( not ( = ?auto_44678 ?auto_44681 ) ) ( not ( = ?auto_44678 ?auto_44682 ) ) ( not ( = ?auto_44678 ?auto_44683 ) ) ( not ( = ?auto_44678 ?auto_44684 ) ) ( not ( = ?auto_44678 ?auto_44685 ) ) ( not ( = ?auto_44679 ?auto_44680 ) ) ( not ( = ?auto_44679 ?auto_44681 ) ) ( not ( = ?auto_44679 ?auto_44682 ) ) ( not ( = ?auto_44679 ?auto_44683 ) ) ( not ( = ?auto_44679 ?auto_44684 ) ) ( not ( = ?auto_44679 ?auto_44685 ) ) ( not ( = ?auto_44680 ?auto_44681 ) ) ( not ( = ?auto_44680 ?auto_44682 ) ) ( not ( = ?auto_44680 ?auto_44683 ) ) ( not ( = ?auto_44680 ?auto_44684 ) ) ( not ( = ?auto_44680 ?auto_44685 ) ) ( not ( = ?auto_44681 ?auto_44682 ) ) ( not ( = ?auto_44681 ?auto_44683 ) ) ( not ( = ?auto_44681 ?auto_44684 ) ) ( not ( = ?auto_44681 ?auto_44685 ) ) ( not ( = ?auto_44682 ?auto_44683 ) ) ( not ( = ?auto_44682 ?auto_44684 ) ) ( not ( = ?auto_44682 ?auto_44685 ) ) ( not ( = ?auto_44683 ?auto_44684 ) ) ( not ( = ?auto_44683 ?auto_44685 ) ) ( not ( = ?auto_44684 ?auto_44685 ) ) ( CLEAR ?auto_44682 ) ( ON ?auto_44683 ?auto_44684 ) ( CLEAR ?auto_44683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44678 ?auto_44679 ?auto_44680 ?auto_44681 ?auto_44682 ?auto_44683 )
      ( MAKE-7PILE ?auto_44678 ?auto_44679 ?auto_44680 ?auto_44681 ?auto_44682 ?auto_44683 ?auto_44684 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_44693 - BLOCK
      ?auto_44694 - BLOCK
      ?auto_44695 - BLOCK
      ?auto_44696 - BLOCK
      ?auto_44697 - BLOCK
      ?auto_44698 - BLOCK
      ?auto_44699 - BLOCK
    )
    :vars
    (
      ?auto_44700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44699 ?auto_44700 ) ( ON-TABLE ?auto_44693 ) ( ON ?auto_44694 ?auto_44693 ) ( ON ?auto_44695 ?auto_44694 ) ( ON ?auto_44696 ?auto_44695 ) ( ON ?auto_44697 ?auto_44696 ) ( not ( = ?auto_44693 ?auto_44694 ) ) ( not ( = ?auto_44693 ?auto_44695 ) ) ( not ( = ?auto_44693 ?auto_44696 ) ) ( not ( = ?auto_44693 ?auto_44697 ) ) ( not ( = ?auto_44693 ?auto_44698 ) ) ( not ( = ?auto_44693 ?auto_44699 ) ) ( not ( = ?auto_44693 ?auto_44700 ) ) ( not ( = ?auto_44694 ?auto_44695 ) ) ( not ( = ?auto_44694 ?auto_44696 ) ) ( not ( = ?auto_44694 ?auto_44697 ) ) ( not ( = ?auto_44694 ?auto_44698 ) ) ( not ( = ?auto_44694 ?auto_44699 ) ) ( not ( = ?auto_44694 ?auto_44700 ) ) ( not ( = ?auto_44695 ?auto_44696 ) ) ( not ( = ?auto_44695 ?auto_44697 ) ) ( not ( = ?auto_44695 ?auto_44698 ) ) ( not ( = ?auto_44695 ?auto_44699 ) ) ( not ( = ?auto_44695 ?auto_44700 ) ) ( not ( = ?auto_44696 ?auto_44697 ) ) ( not ( = ?auto_44696 ?auto_44698 ) ) ( not ( = ?auto_44696 ?auto_44699 ) ) ( not ( = ?auto_44696 ?auto_44700 ) ) ( not ( = ?auto_44697 ?auto_44698 ) ) ( not ( = ?auto_44697 ?auto_44699 ) ) ( not ( = ?auto_44697 ?auto_44700 ) ) ( not ( = ?auto_44698 ?auto_44699 ) ) ( not ( = ?auto_44698 ?auto_44700 ) ) ( not ( = ?auto_44699 ?auto_44700 ) ) ( CLEAR ?auto_44697 ) ( ON ?auto_44698 ?auto_44699 ) ( CLEAR ?auto_44698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44693 ?auto_44694 ?auto_44695 ?auto_44696 ?auto_44697 ?auto_44698 )
      ( MAKE-7PILE ?auto_44693 ?auto_44694 ?auto_44695 ?auto_44696 ?auto_44697 ?auto_44698 ?auto_44699 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_44708 - BLOCK
      ?auto_44709 - BLOCK
      ?auto_44710 - BLOCK
      ?auto_44711 - BLOCK
      ?auto_44712 - BLOCK
      ?auto_44713 - BLOCK
      ?auto_44714 - BLOCK
    )
    :vars
    (
      ?auto_44715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44714 ?auto_44715 ) ( ON-TABLE ?auto_44708 ) ( ON ?auto_44709 ?auto_44708 ) ( ON ?auto_44710 ?auto_44709 ) ( ON ?auto_44711 ?auto_44710 ) ( not ( = ?auto_44708 ?auto_44709 ) ) ( not ( = ?auto_44708 ?auto_44710 ) ) ( not ( = ?auto_44708 ?auto_44711 ) ) ( not ( = ?auto_44708 ?auto_44712 ) ) ( not ( = ?auto_44708 ?auto_44713 ) ) ( not ( = ?auto_44708 ?auto_44714 ) ) ( not ( = ?auto_44708 ?auto_44715 ) ) ( not ( = ?auto_44709 ?auto_44710 ) ) ( not ( = ?auto_44709 ?auto_44711 ) ) ( not ( = ?auto_44709 ?auto_44712 ) ) ( not ( = ?auto_44709 ?auto_44713 ) ) ( not ( = ?auto_44709 ?auto_44714 ) ) ( not ( = ?auto_44709 ?auto_44715 ) ) ( not ( = ?auto_44710 ?auto_44711 ) ) ( not ( = ?auto_44710 ?auto_44712 ) ) ( not ( = ?auto_44710 ?auto_44713 ) ) ( not ( = ?auto_44710 ?auto_44714 ) ) ( not ( = ?auto_44710 ?auto_44715 ) ) ( not ( = ?auto_44711 ?auto_44712 ) ) ( not ( = ?auto_44711 ?auto_44713 ) ) ( not ( = ?auto_44711 ?auto_44714 ) ) ( not ( = ?auto_44711 ?auto_44715 ) ) ( not ( = ?auto_44712 ?auto_44713 ) ) ( not ( = ?auto_44712 ?auto_44714 ) ) ( not ( = ?auto_44712 ?auto_44715 ) ) ( not ( = ?auto_44713 ?auto_44714 ) ) ( not ( = ?auto_44713 ?auto_44715 ) ) ( not ( = ?auto_44714 ?auto_44715 ) ) ( ON ?auto_44713 ?auto_44714 ) ( CLEAR ?auto_44711 ) ( ON ?auto_44712 ?auto_44713 ) ( CLEAR ?auto_44712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44708 ?auto_44709 ?auto_44710 ?auto_44711 ?auto_44712 )
      ( MAKE-7PILE ?auto_44708 ?auto_44709 ?auto_44710 ?auto_44711 ?auto_44712 ?auto_44713 ?auto_44714 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_44723 - BLOCK
      ?auto_44724 - BLOCK
      ?auto_44725 - BLOCK
      ?auto_44726 - BLOCK
      ?auto_44727 - BLOCK
      ?auto_44728 - BLOCK
      ?auto_44729 - BLOCK
    )
    :vars
    (
      ?auto_44730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44729 ?auto_44730 ) ( ON-TABLE ?auto_44723 ) ( ON ?auto_44724 ?auto_44723 ) ( ON ?auto_44725 ?auto_44724 ) ( ON ?auto_44726 ?auto_44725 ) ( not ( = ?auto_44723 ?auto_44724 ) ) ( not ( = ?auto_44723 ?auto_44725 ) ) ( not ( = ?auto_44723 ?auto_44726 ) ) ( not ( = ?auto_44723 ?auto_44727 ) ) ( not ( = ?auto_44723 ?auto_44728 ) ) ( not ( = ?auto_44723 ?auto_44729 ) ) ( not ( = ?auto_44723 ?auto_44730 ) ) ( not ( = ?auto_44724 ?auto_44725 ) ) ( not ( = ?auto_44724 ?auto_44726 ) ) ( not ( = ?auto_44724 ?auto_44727 ) ) ( not ( = ?auto_44724 ?auto_44728 ) ) ( not ( = ?auto_44724 ?auto_44729 ) ) ( not ( = ?auto_44724 ?auto_44730 ) ) ( not ( = ?auto_44725 ?auto_44726 ) ) ( not ( = ?auto_44725 ?auto_44727 ) ) ( not ( = ?auto_44725 ?auto_44728 ) ) ( not ( = ?auto_44725 ?auto_44729 ) ) ( not ( = ?auto_44725 ?auto_44730 ) ) ( not ( = ?auto_44726 ?auto_44727 ) ) ( not ( = ?auto_44726 ?auto_44728 ) ) ( not ( = ?auto_44726 ?auto_44729 ) ) ( not ( = ?auto_44726 ?auto_44730 ) ) ( not ( = ?auto_44727 ?auto_44728 ) ) ( not ( = ?auto_44727 ?auto_44729 ) ) ( not ( = ?auto_44727 ?auto_44730 ) ) ( not ( = ?auto_44728 ?auto_44729 ) ) ( not ( = ?auto_44728 ?auto_44730 ) ) ( not ( = ?auto_44729 ?auto_44730 ) ) ( ON ?auto_44728 ?auto_44729 ) ( CLEAR ?auto_44726 ) ( ON ?auto_44727 ?auto_44728 ) ( CLEAR ?auto_44727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44723 ?auto_44724 ?auto_44725 ?auto_44726 ?auto_44727 )
      ( MAKE-7PILE ?auto_44723 ?auto_44724 ?auto_44725 ?auto_44726 ?auto_44727 ?auto_44728 ?auto_44729 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_44738 - BLOCK
      ?auto_44739 - BLOCK
      ?auto_44740 - BLOCK
      ?auto_44741 - BLOCK
      ?auto_44742 - BLOCK
      ?auto_44743 - BLOCK
      ?auto_44744 - BLOCK
    )
    :vars
    (
      ?auto_44745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44744 ?auto_44745 ) ( ON-TABLE ?auto_44738 ) ( ON ?auto_44739 ?auto_44738 ) ( ON ?auto_44740 ?auto_44739 ) ( not ( = ?auto_44738 ?auto_44739 ) ) ( not ( = ?auto_44738 ?auto_44740 ) ) ( not ( = ?auto_44738 ?auto_44741 ) ) ( not ( = ?auto_44738 ?auto_44742 ) ) ( not ( = ?auto_44738 ?auto_44743 ) ) ( not ( = ?auto_44738 ?auto_44744 ) ) ( not ( = ?auto_44738 ?auto_44745 ) ) ( not ( = ?auto_44739 ?auto_44740 ) ) ( not ( = ?auto_44739 ?auto_44741 ) ) ( not ( = ?auto_44739 ?auto_44742 ) ) ( not ( = ?auto_44739 ?auto_44743 ) ) ( not ( = ?auto_44739 ?auto_44744 ) ) ( not ( = ?auto_44739 ?auto_44745 ) ) ( not ( = ?auto_44740 ?auto_44741 ) ) ( not ( = ?auto_44740 ?auto_44742 ) ) ( not ( = ?auto_44740 ?auto_44743 ) ) ( not ( = ?auto_44740 ?auto_44744 ) ) ( not ( = ?auto_44740 ?auto_44745 ) ) ( not ( = ?auto_44741 ?auto_44742 ) ) ( not ( = ?auto_44741 ?auto_44743 ) ) ( not ( = ?auto_44741 ?auto_44744 ) ) ( not ( = ?auto_44741 ?auto_44745 ) ) ( not ( = ?auto_44742 ?auto_44743 ) ) ( not ( = ?auto_44742 ?auto_44744 ) ) ( not ( = ?auto_44742 ?auto_44745 ) ) ( not ( = ?auto_44743 ?auto_44744 ) ) ( not ( = ?auto_44743 ?auto_44745 ) ) ( not ( = ?auto_44744 ?auto_44745 ) ) ( ON ?auto_44743 ?auto_44744 ) ( ON ?auto_44742 ?auto_44743 ) ( CLEAR ?auto_44740 ) ( ON ?auto_44741 ?auto_44742 ) ( CLEAR ?auto_44741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44738 ?auto_44739 ?auto_44740 ?auto_44741 )
      ( MAKE-7PILE ?auto_44738 ?auto_44739 ?auto_44740 ?auto_44741 ?auto_44742 ?auto_44743 ?auto_44744 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_44753 - BLOCK
      ?auto_44754 - BLOCK
      ?auto_44755 - BLOCK
      ?auto_44756 - BLOCK
      ?auto_44757 - BLOCK
      ?auto_44758 - BLOCK
      ?auto_44759 - BLOCK
    )
    :vars
    (
      ?auto_44760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44759 ?auto_44760 ) ( ON-TABLE ?auto_44753 ) ( ON ?auto_44754 ?auto_44753 ) ( ON ?auto_44755 ?auto_44754 ) ( not ( = ?auto_44753 ?auto_44754 ) ) ( not ( = ?auto_44753 ?auto_44755 ) ) ( not ( = ?auto_44753 ?auto_44756 ) ) ( not ( = ?auto_44753 ?auto_44757 ) ) ( not ( = ?auto_44753 ?auto_44758 ) ) ( not ( = ?auto_44753 ?auto_44759 ) ) ( not ( = ?auto_44753 ?auto_44760 ) ) ( not ( = ?auto_44754 ?auto_44755 ) ) ( not ( = ?auto_44754 ?auto_44756 ) ) ( not ( = ?auto_44754 ?auto_44757 ) ) ( not ( = ?auto_44754 ?auto_44758 ) ) ( not ( = ?auto_44754 ?auto_44759 ) ) ( not ( = ?auto_44754 ?auto_44760 ) ) ( not ( = ?auto_44755 ?auto_44756 ) ) ( not ( = ?auto_44755 ?auto_44757 ) ) ( not ( = ?auto_44755 ?auto_44758 ) ) ( not ( = ?auto_44755 ?auto_44759 ) ) ( not ( = ?auto_44755 ?auto_44760 ) ) ( not ( = ?auto_44756 ?auto_44757 ) ) ( not ( = ?auto_44756 ?auto_44758 ) ) ( not ( = ?auto_44756 ?auto_44759 ) ) ( not ( = ?auto_44756 ?auto_44760 ) ) ( not ( = ?auto_44757 ?auto_44758 ) ) ( not ( = ?auto_44757 ?auto_44759 ) ) ( not ( = ?auto_44757 ?auto_44760 ) ) ( not ( = ?auto_44758 ?auto_44759 ) ) ( not ( = ?auto_44758 ?auto_44760 ) ) ( not ( = ?auto_44759 ?auto_44760 ) ) ( ON ?auto_44758 ?auto_44759 ) ( ON ?auto_44757 ?auto_44758 ) ( CLEAR ?auto_44755 ) ( ON ?auto_44756 ?auto_44757 ) ( CLEAR ?auto_44756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44753 ?auto_44754 ?auto_44755 ?auto_44756 )
      ( MAKE-7PILE ?auto_44753 ?auto_44754 ?auto_44755 ?auto_44756 ?auto_44757 ?auto_44758 ?auto_44759 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_44768 - BLOCK
      ?auto_44769 - BLOCK
      ?auto_44770 - BLOCK
      ?auto_44771 - BLOCK
      ?auto_44772 - BLOCK
      ?auto_44773 - BLOCK
      ?auto_44774 - BLOCK
    )
    :vars
    (
      ?auto_44775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44774 ?auto_44775 ) ( ON-TABLE ?auto_44768 ) ( ON ?auto_44769 ?auto_44768 ) ( not ( = ?auto_44768 ?auto_44769 ) ) ( not ( = ?auto_44768 ?auto_44770 ) ) ( not ( = ?auto_44768 ?auto_44771 ) ) ( not ( = ?auto_44768 ?auto_44772 ) ) ( not ( = ?auto_44768 ?auto_44773 ) ) ( not ( = ?auto_44768 ?auto_44774 ) ) ( not ( = ?auto_44768 ?auto_44775 ) ) ( not ( = ?auto_44769 ?auto_44770 ) ) ( not ( = ?auto_44769 ?auto_44771 ) ) ( not ( = ?auto_44769 ?auto_44772 ) ) ( not ( = ?auto_44769 ?auto_44773 ) ) ( not ( = ?auto_44769 ?auto_44774 ) ) ( not ( = ?auto_44769 ?auto_44775 ) ) ( not ( = ?auto_44770 ?auto_44771 ) ) ( not ( = ?auto_44770 ?auto_44772 ) ) ( not ( = ?auto_44770 ?auto_44773 ) ) ( not ( = ?auto_44770 ?auto_44774 ) ) ( not ( = ?auto_44770 ?auto_44775 ) ) ( not ( = ?auto_44771 ?auto_44772 ) ) ( not ( = ?auto_44771 ?auto_44773 ) ) ( not ( = ?auto_44771 ?auto_44774 ) ) ( not ( = ?auto_44771 ?auto_44775 ) ) ( not ( = ?auto_44772 ?auto_44773 ) ) ( not ( = ?auto_44772 ?auto_44774 ) ) ( not ( = ?auto_44772 ?auto_44775 ) ) ( not ( = ?auto_44773 ?auto_44774 ) ) ( not ( = ?auto_44773 ?auto_44775 ) ) ( not ( = ?auto_44774 ?auto_44775 ) ) ( ON ?auto_44773 ?auto_44774 ) ( ON ?auto_44772 ?auto_44773 ) ( ON ?auto_44771 ?auto_44772 ) ( CLEAR ?auto_44769 ) ( ON ?auto_44770 ?auto_44771 ) ( CLEAR ?auto_44770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44768 ?auto_44769 ?auto_44770 )
      ( MAKE-7PILE ?auto_44768 ?auto_44769 ?auto_44770 ?auto_44771 ?auto_44772 ?auto_44773 ?auto_44774 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_44783 - BLOCK
      ?auto_44784 - BLOCK
      ?auto_44785 - BLOCK
      ?auto_44786 - BLOCK
      ?auto_44787 - BLOCK
      ?auto_44788 - BLOCK
      ?auto_44789 - BLOCK
    )
    :vars
    (
      ?auto_44790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44789 ?auto_44790 ) ( ON-TABLE ?auto_44783 ) ( ON ?auto_44784 ?auto_44783 ) ( not ( = ?auto_44783 ?auto_44784 ) ) ( not ( = ?auto_44783 ?auto_44785 ) ) ( not ( = ?auto_44783 ?auto_44786 ) ) ( not ( = ?auto_44783 ?auto_44787 ) ) ( not ( = ?auto_44783 ?auto_44788 ) ) ( not ( = ?auto_44783 ?auto_44789 ) ) ( not ( = ?auto_44783 ?auto_44790 ) ) ( not ( = ?auto_44784 ?auto_44785 ) ) ( not ( = ?auto_44784 ?auto_44786 ) ) ( not ( = ?auto_44784 ?auto_44787 ) ) ( not ( = ?auto_44784 ?auto_44788 ) ) ( not ( = ?auto_44784 ?auto_44789 ) ) ( not ( = ?auto_44784 ?auto_44790 ) ) ( not ( = ?auto_44785 ?auto_44786 ) ) ( not ( = ?auto_44785 ?auto_44787 ) ) ( not ( = ?auto_44785 ?auto_44788 ) ) ( not ( = ?auto_44785 ?auto_44789 ) ) ( not ( = ?auto_44785 ?auto_44790 ) ) ( not ( = ?auto_44786 ?auto_44787 ) ) ( not ( = ?auto_44786 ?auto_44788 ) ) ( not ( = ?auto_44786 ?auto_44789 ) ) ( not ( = ?auto_44786 ?auto_44790 ) ) ( not ( = ?auto_44787 ?auto_44788 ) ) ( not ( = ?auto_44787 ?auto_44789 ) ) ( not ( = ?auto_44787 ?auto_44790 ) ) ( not ( = ?auto_44788 ?auto_44789 ) ) ( not ( = ?auto_44788 ?auto_44790 ) ) ( not ( = ?auto_44789 ?auto_44790 ) ) ( ON ?auto_44788 ?auto_44789 ) ( ON ?auto_44787 ?auto_44788 ) ( ON ?auto_44786 ?auto_44787 ) ( CLEAR ?auto_44784 ) ( ON ?auto_44785 ?auto_44786 ) ( CLEAR ?auto_44785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44783 ?auto_44784 ?auto_44785 )
      ( MAKE-7PILE ?auto_44783 ?auto_44784 ?auto_44785 ?auto_44786 ?auto_44787 ?auto_44788 ?auto_44789 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_44798 - BLOCK
      ?auto_44799 - BLOCK
      ?auto_44800 - BLOCK
      ?auto_44801 - BLOCK
      ?auto_44802 - BLOCK
      ?auto_44803 - BLOCK
      ?auto_44804 - BLOCK
    )
    :vars
    (
      ?auto_44805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44804 ?auto_44805 ) ( ON-TABLE ?auto_44798 ) ( not ( = ?auto_44798 ?auto_44799 ) ) ( not ( = ?auto_44798 ?auto_44800 ) ) ( not ( = ?auto_44798 ?auto_44801 ) ) ( not ( = ?auto_44798 ?auto_44802 ) ) ( not ( = ?auto_44798 ?auto_44803 ) ) ( not ( = ?auto_44798 ?auto_44804 ) ) ( not ( = ?auto_44798 ?auto_44805 ) ) ( not ( = ?auto_44799 ?auto_44800 ) ) ( not ( = ?auto_44799 ?auto_44801 ) ) ( not ( = ?auto_44799 ?auto_44802 ) ) ( not ( = ?auto_44799 ?auto_44803 ) ) ( not ( = ?auto_44799 ?auto_44804 ) ) ( not ( = ?auto_44799 ?auto_44805 ) ) ( not ( = ?auto_44800 ?auto_44801 ) ) ( not ( = ?auto_44800 ?auto_44802 ) ) ( not ( = ?auto_44800 ?auto_44803 ) ) ( not ( = ?auto_44800 ?auto_44804 ) ) ( not ( = ?auto_44800 ?auto_44805 ) ) ( not ( = ?auto_44801 ?auto_44802 ) ) ( not ( = ?auto_44801 ?auto_44803 ) ) ( not ( = ?auto_44801 ?auto_44804 ) ) ( not ( = ?auto_44801 ?auto_44805 ) ) ( not ( = ?auto_44802 ?auto_44803 ) ) ( not ( = ?auto_44802 ?auto_44804 ) ) ( not ( = ?auto_44802 ?auto_44805 ) ) ( not ( = ?auto_44803 ?auto_44804 ) ) ( not ( = ?auto_44803 ?auto_44805 ) ) ( not ( = ?auto_44804 ?auto_44805 ) ) ( ON ?auto_44803 ?auto_44804 ) ( ON ?auto_44802 ?auto_44803 ) ( ON ?auto_44801 ?auto_44802 ) ( ON ?auto_44800 ?auto_44801 ) ( CLEAR ?auto_44798 ) ( ON ?auto_44799 ?auto_44800 ) ( CLEAR ?auto_44799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44798 ?auto_44799 )
      ( MAKE-7PILE ?auto_44798 ?auto_44799 ?auto_44800 ?auto_44801 ?auto_44802 ?auto_44803 ?auto_44804 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_44813 - BLOCK
      ?auto_44814 - BLOCK
      ?auto_44815 - BLOCK
      ?auto_44816 - BLOCK
      ?auto_44817 - BLOCK
      ?auto_44818 - BLOCK
      ?auto_44819 - BLOCK
    )
    :vars
    (
      ?auto_44820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44819 ?auto_44820 ) ( ON-TABLE ?auto_44813 ) ( not ( = ?auto_44813 ?auto_44814 ) ) ( not ( = ?auto_44813 ?auto_44815 ) ) ( not ( = ?auto_44813 ?auto_44816 ) ) ( not ( = ?auto_44813 ?auto_44817 ) ) ( not ( = ?auto_44813 ?auto_44818 ) ) ( not ( = ?auto_44813 ?auto_44819 ) ) ( not ( = ?auto_44813 ?auto_44820 ) ) ( not ( = ?auto_44814 ?auto_44815 ) ) ( not ( = ?auto_44814 ?auto_44816 ) ) ( not ( = ?auto_44814 ?auto_44817 ) ) ( not ( = ?auto_44814 ?auto_44818 ) ) ( not ( = ?auto_44814 ?auto_44819 ) ) ( not ( = ?auto_44814 ?auto_44820 ) ) ( not ( = ?auto_44815 ?auto_44816 ) ) ( not ( = ?auto_44815 ?auto_44817 ) ) ( not ( = ?auto_44815 ?auto_44818 ) ) ( not ( = ?auto_44815 ?auto_44819 ) ) ( not ( = ?auto_44815 ?auto_44820 ) ) ( not ( = ?auto_44816 ?auto_44817 ) ) ( not ( = ?auto_44816 ?auto_44818 ) ) ( not ( = ?auto_44816 ?auto_44819 ) ) ( not ( = ?auto_44816 ?auto_44820 ) ) ( not ( = ?auto_44817 ?auto_44818 ) ) ( not ( = ?auto_44817 ?auto_44819 ) ) ( not ( = ?auto_44817 ?auto_44820 ) ) ( not ( = ?auto_44818 ?auto_44819 ) ) ( not ( = ?auto_44818 ?auto_44820 ) ) ( not ( = ?auto_44819 ?auto_44820 ) ) ( ON ?auto_44818 ?auto_44819 ) ( ON ?auto_44817 ?auto_44818 ) ( ON ?auto_44816 ?auto_44817 ) ( ON ?auto_44815 ?auto_44816 ) ( CLEAR ?auto_44813 ) ( ON ?auto_44814 ?auto_44815 ) ( CLEAR ?auto_44814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44813 ?auto_44814 )
      ( MAKE-7PILE ?auto_44813 ?auto_44814 ?auto_44815 ?auto_44816 ?auto_44817 ?auto_44818 ?auto_44819 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_44828 - BLOCK
      ?auto_44829 - BLOCK
      ?auto_44830 - BLOCK
      ?auto_44831 - BLOCK
      ?auto_44832 - BLOCK
      ?auto_44833 - BLOCK
      ?auto_44834 - BLOCK
    )
    :vars
    (
      ?auto_44835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44834 ?auto_44835 ) ( not ( = ?auto_44828 ?auto_44829 ) ) ( not ( = ?auto_44828 ?auto_44830 ) ) ( not ( = ?auto_44828 ?auto_44831 ) ) ( not ( = ?auto_44828 ?auto_44832 ) ) ( not ( = ?auto_44828 ?auto_44833 ) ) ( not ( = ?auto_44828 ?auto_44834 ) ) ( not ( = ?auto_44828 ?auto_44835 ) ) ( not ( = ?auto_44829 ?auto_44830 ) ) ( not ( = ?auto_44829 ?auto_44831 ) ) ( not ( = ?auto_44829 ?auto_44832 ) ) ( not ( = ?auto_44829 ?auto_44833 ) ) ( not ( = ?auto_44829 ?auto_44834 ) ) ( not ( = ?auto_44829 ?auto_44835 ) ) ( not ( = ?auto_44830 ?auto_44831 ) ) ( not ( = ?auto_44830 ?auto_44832 ) ) ( not ( = ?auto_44830 ?auto_44833 ) ) ( not ( = ?auto_44830 ?auto_44834 ) ) ( not ( = ?auto_44830 ?auto_44835 ) ) ( not ( = ?auto_44831 ?auto_44832 ) ) ( not ( = ?auto_44831 ?auto_44833 ) ) ( not ( = ?auto_44831 ?auto_44834 ) ) ( not ( = ?auto_44831 ?auto_44835 ) ) ( not ( = ?auto_44832 ?auto_44833 ) ) ( not ( = ?auto_44832 ?auto_44834 ) ) ( not ( = ?auto_44832 ?auto_44835 ) ) ( not ( = ?auto_44833 ?auto_44834 ) ) ( not ( = ?auto_44833 ?auto_44835 ) ) ( not ( = ?auto_44834 ?auto_44835 ) ) ( ON ?auto_44833 ?auto_44834 ) ( ON ?auto_44832 ?auto_44833 ) ( ON ?auto_44831 ?auto_44832 ) ( ON ?auto_44830 ?auto_44831 ) ( ON ?auto_44829 ?auto_44830 ) ( ON ?auto_44828 ?auto_44829 ) ( CLEAR ?auto_44828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44828 )
      ( MAKE-7PILE ?auto_44828 ?auto_44829 ?auto_44830 ?auto_44831 ?auto_44832 ?auto_44833 ?auto_44834 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_44843 - BLOCK
      ?auto_44844 - BLOCK
      ?auto_44845 - BLOCK
      ?auto_44846 - BLOCK
      ?auto_44847 - BLOCK
      ?auto_44848 - BLOCK
      ?auto_44849 - BLOCK
    )
    :vars
    (
      ?auto_44850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44849 ?auto_44850 ) ( not ( = ?auto_44843 ?auto_44844 ) ) ( not ( = ?auto_44843 ?auto_44845 ) ) ( not ( = ?auto_44843 ?auto_44846 ) ) ( not ( = ?auto_44843 ?auto_44847 ) ) ( not ( = ?auto_44843 ?auto_44848 ) ) ( not ( = ?auto_44843 ?auto_44849 ) ) ( not ( = ?auto_44843 ?auto_44850 ) ) ( not ( = ?auto_44844 ?auto_44845 ) ) ( not ( = ?auto_44844 ?auto_44846 ) ) ( not ( = ?auto_44844 ?auto_44847 ) ) ( not ( = ?auto_44844 ?auto_44848 ) ) ( not ( = ?auto_44844 ?auto_44849 ) ) ( not ( = ?auto_44844 ?auto_44850 ) ) ( not ( = ?auto_44845 ?auto_44846 ) ) ( not ( = ?auto_44845 ?auto_44847 ) ) ( not ( = ?auto_44845 ?auto_44848 ) ) ( not ( = ?auto_44845 ?auto_44849 ) ) ( not ( = ?auto_44845 ?auto_44850 ) ) ( not ( = ?auto_44846 ?auto_44847 ) ) ( not ( = ?auto_44846 ?auto_44848 ) ) ( not ( = ?auto_44846 ?auto_44849 ) ) ( not ( = ?auto_44846 ?auto_44850 ) ) ( not ( = ?auto_44847 ?auto_44848 ) ) ( not ( = ?auto_44847 ?auto_44849 ) ) ( not ( = ?auto_44847 ?auto_44850 ) ) ( not ( = ?auto_44848 ?auto_44849 ) ) ( not ( = ?auto_44848 ?auto_44850 ) ) ( not ( = ?auto_44849 ?auto_44850 ) ) ( ON ?auto_44848 ?auto_44849 ) ( ON ?auto_44847 ?auto_44848 ) ( ON ?auto_44846 ?auto_44847 ) ( ON ?auto_44845 ?auto_44846 ) ( ON ?auto_44844 ?auto_44845 ) ( ON ?auto_44843 ?auto_44844 ) ( CLEAR ?auto_44843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44843 )
      ( MAKE-7PILE ?auto_44843 ?auto_44844 ?auto_44845 ?auto_44846 ?auto_44847 ?auto_44848 ?auto_44849 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_44859 - BLOCK
      ?auto_44860 - BLOCK
      ?auto_44861 - BLOCK
      ?auto_44862 - BLOCK
      ?auto_44863 - BLOCK
      ?auto_44864 - BLOCK
      ?auto_44865 - BLOCK
      ?auto_44866 - BLOCK
    )
    :vars
    (
      ?auto_44867 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_44865 ) ( ON ?auto_44866 ?auto_44867 ) ( CLEAR ?auto_44866 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44859 ) ( ON ?auto_44860 ?auto_44859 ) ( ON ?auto_44861 ?auto_44860 ) ( ON ?auto_44862 ?auto_44861 ) ( ON ?auto_44863 ?auto_44862 ) ( ON ?auto_44864 ?auto_44863 ) ( ON ?auto_44865 ?auto_44864 ) ( not ( = ?auto_44859 ?auto_44860 ) ) ( not ( = ?auto_44859 ?auto_44861 ) ) ( not ( = ?auto_44859 ?auto_44862 ) ) ( not ( = ?auto_44859 ?auto_44863 ) ) ( not ( = ?auto_44859 ?auto_44864 ) ) ( not ( = ?auto_44859 ?auto_44865 ) ) ( not ( = ?auto_44859 ?auto_44866 ) ) ( not ( = ?auto_44859 ?auto_44867 ) ) ( not ( = ?auto_44860 ?auto_44861 ) ) ( not ( = ?auto_44860 ?auto_44862 ) ) ( not ( = ?auto_44860 ?auto_44863 ) ) ( not ( = ?auto_44860 ?auto_44864 ) ) ( not ( = ?auto_44860 ?auto_44865 ) ) ( not ( = ?auto_44860 ?auto_44866 ) ) ( not ( = ?auto_44860 ?auto_44867 ) ) ( not ( = ?auto_44861 ?auto_44862 ) ) ( not ( = ?auto_44861 ?auto_44863 ) ) ( not ( = ?auto_44861 ?auto_44864 ) ) ( not ( = ?auto_44861 ?auto_44865 ) ) ( not ( = ?auto_44861 ?auto_44866 ) ) ( not ( = ?auto_44861 ?auto_44867 ) ) ( not ( = ?auto_44862 ?auto_44863 ) ) ( not ( = ?auto_44862 ?auto_44864 ) ) ( not ( = ?auto_44862 ?auto_44865 ) ) ( not ( = ?auto_44862 ?auto_44866 ) ) ( not ( = ?auto_44862 ?auto_44867 ) ) ( not ( = ?auto_44863 ?auto_44864 ) ) ( not ( = ?auto_44863 ?auto_44865 ) ) ( not ( = ?auto_44863 ?auto_44866 ) ) ( not ( = ?auto_44863 ?auto_44867 ) ) ( not ( = ?auto_44864 ?auto_44865 ) ) ( not ( = ?auto_44864 ?auto_44866 ) ) ( not ( = ?auto_44864 ?auto_44867 ) ) ( not ( = ?auto_44865 ?auto_44866 ) ) ( not ( = ?auto_44865 ?auto_44867 ) ) ( not ( = ?auto_44866 ?auto_44867 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44866 ?auto_44867 )
      ( !STACK ?auto_44866 ?auto_44865 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_44876 - BLOCK
      ?auto_44877 - BLOCK
      ?auto_44878 - BLOCK
      ?auto_44879 - BLOCK
      ?auto_44880 - BLOCK
      ?auto_44881 - BLOCK
      ?auto_44882 - BLOCK
      ?auto_44883 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_44882 ) ( ON-TABLE ?auto_44883 ) ( CLEAR ?auto_44883 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44876 ) ( ON ?auto_44877 ?auto_44876 ) ( ON ?auto_44878 ?auto_44877 ) ( ON ?auto_44879 ?auto_44878 ) ( ON ?auto_44880 ?auto_44879 ) ( ON ?auto_44881 ?auto_44880 ) ( ON ?auto_44882 ?auto_44881 ) ( not ( = ?auto_44876 ?auto_44877 ) ) ( not ( = ?auto_44876 ?auto_44878 ) ) ( not ( = ?auto_44876 ?auto_44879 ) ) ( not ( = ?auto_44876 ?auto_44880 ) ) ( not ( = ?auto_44876 ?auto_44881 ) ) ( not ( = ?auto_44876 ?auto_44882 ) ) ( not ( = ?auto_44876 ?auto_44883 ) ) ( not ( = ?auto_44877 ?auto_44878 ) ) ( not ( = ?auto_44877 ?auto_44879 ) ) ( not ( = ?auto_44877 ?auto_44880 ) ) ( not ( = ?auto_44877 ?auto_44881 ) ) ( not ( = ?auto_44877 ?auto_44882 ) ) ( not ( = ?auto_44877 ?auto_44883 ) ) ( not ( = ?auto_44878 ?auto_44879 ) ) ( not ( = ?auto_44878 ?auto_44880 ) ) ( not ( = ?auto_44878 ?auto_44881 ) ) ( not ( = ?auto_44878 ?auto_44882 ) ) ( not ( = ?auto_44878 ?auto_44883 ) ) ( not ( = ?auto_44879 ?auto_44880 ) ) ( not ( = ?auto_44879 ?auto_44881 ) ) ( not ( = ?auto_44879 ?auto_44882 ) ) ( not ( = ?auto_44879 ?auto_44883 ) ) ( not ( = ?auto_44880 ?auto_44881 ) ) ( not ( = ?auto_44880 ?auto_44882 ) ) ( not ( = ?auto_44880 ?auto_44883 ) ) ( not ( = ?auto_44881 ?auto_44882 ) ) ( not ( = ?auto_44881 ?auto_44883 ) ) ( not ( = ?auto_44882 ?auto_44883 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_44883 )
      ( !STACK ?auto_44883 ?auto_44882 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_44892 - BLOCK
      ?auto_44893 - BLOCK
      ?auto_44894 - BLOCK
      ?auto_44895 - BLOCK
      ?auto_44896 - BLOCK
      ?auto_44897 - BLOCK
      ?auto_44898 - BLOCK
      ?auto_44899 - BLOCK
    )
    :vars
    (
      ?auto_44900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44899 ?auto_44900 ) ( ON-TABLE ?auto_44892 ) ( ON ?auto_44893 ?auto_44892 ) ( ON ?auto_44894 ?auto_44893 ) ( ON ?auto_44895 ?auto_44894 ) ( ON ?auto_44896 ?auto_44895 ) ( ON ?auto_44897 ?auto_44896 ) ( not ( = ?auto_44892 ?auto_44893 ) ) ( not ( = ?auto_44892 ?auto_44894 ) ) ( not ( = ?auto_44892 ?auto_44895 ) ) ( not ( = ?auto_44892 ?auto_44896 ) ) ( not ( = ?auto_44892 ?auto_44897 ) ) ( not ( = ?auto_44892 ?auto_44898 ) ) ( not ( = ?auto_44892 ?auto_44899 ) ) ( not ( = ?auto_44892 ?auto_44900 ) ) ( not ( = ?auto_44893 ?auto_44894 ) ) ( not ( = ?auto_44893 ?auto_44895 ) ) ( not ( = ?auto_44893 ?auto_44896 ) ) ( not ( = ?auto_44893 ?auto_44897 ) ) ( not ( = ?auto_44893 ?auto_44898 ) ) ( not ( = ?auto_44893 ?auto_44899 ) ) ( not ( = ?auto_44893 ?auto_44900 ) ) ( not ( = ?auto_44894 ?auto_44895 ) ) ( not ( = ?auto_44894 ?auto_44896 ) ) ( not ( = ?auto_44894 ?auto_44897 ) ) ( not ( = ?auto_44894 ?auto_44898 ) ) ( not ( = ?auto_44894 ?auto_44899 ) ) ( not ( = ?auto_44894 ?auto_44900 ) ) ( not ( = ?auto_44895 ?auto_44896 ) ) ( not ( = ?auto_44895 ?auto_44897 ) ) ( not ( = ?auto_44895 ?auto_44898 ) ) ( not ( = ?auto_44895 ?auto_44899 ) ) ( not ( = ?auto_44895 ?auto_44900 ) ) ( not ( = ?auto_44896 ?auto_44897 ) ) ( not ( = ?auto_44896 ?auto_44898 ) ) ( not ( = ?auto_44896 ?auto_44899 ) ) ( not ( = ?auto_44896 ?auto_44900 ) ) ( not ( = ?auto_44897 ?auto_44898 ) ) ( not ( = ?auto_44897 ?auto_44899 ) ) ( not ( = ?auto_44897 ?auto_44900 ) ) ( not ( = ?auto_44898 ?auto_44899 ) ) ( not ( = ?auto_44898 ?auto_44900 ) ) ( not ( = ?auto_44899 ?auto_44900 ) ) ( CLEAR ?auto_44897 ) ( ON ?auto_44898 ?auto_44899 ) ( CLEAR ?auto_44898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_44892 ?auto_44893 ?auto_44894 ?auto_44895 ?auto_44896 ?auto_44897 ?auto_44898 )
      ( MAKE-8PILE ?auto_44892 ?auto_44893 ?auto_44894 ?auto_44895 ?auto_44896 ?auto_44897 ?auto_44898 ?auto_44899 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_44909 - BLOCK
      ?auto_44910 - BLOCK
      ?auto_44911 - BLOCK
      ?auto_44912 - BLOCK
      ?auto_44913 - BLOCK
      ?auto_44914 - BLOCK
      ?auto_44915 - BLOCK
      ?auto_44916 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44916 ) ( ON-TABLE ?auto_44909 ) ( ON ?auto_44910 ?auto_44909 ) ( ON ?auto_44911 ?auto_44910 ) ( ON ?auto_44912 ?auto_44911 ) ( ON ?auto_44913 ?auto_44912 ) ( ON ?auto_44914 ?auto_44913 ) ( not ( = ?auto_44909 ?auto_44910 ) ) ( not ( = ?auto_44909 ?auto_44911 ) ) ( not ( = ?auto_44909 ?auto_44912 ) ) ( not ( = ?auto_44909 ?auto_44913 ) ) ( not ( = ?auto_44909 ?auto_44914 ) ) ( not ( = ?auto_44909 ?auto_44915 ) ) ( not ( = ?auto_44909 ?auto_44916 ) ) ( not ( = ?auto_44910 ?auto_44911 ) ) ( not ( = ?auto_44910 ?auto_44912 ) ) ( not ( = ?auto_44910 ?auto_44913 ) ) ( not ( = ?auto_44910 ?auto_44914 ) ) ( not ( = ?auto_44910 ?auto_44915 ) ) ( not ( = ?auto_44910 ?auto_44916 ) ) ( not ( = ?auto_44911 ?auto_44912 ) ) ( not ( = ?auto_44911 ?auto_44913 ) ) ( not ( = ?auto_44911 ?auto_44914 ) ) ( not ( = ?auto_44911 ?auto_44915 ) ) ( not ( = ?auto_44911 ?auto_44916 ) ) ( not ( = ?auto_44912 ?auto_44913 ) ) ( not ( = ?auto_44912 ?auto_44914 ) ) ( not ( = ?auto_44912 ?auto_44915 ) ) ( not ( = ?auto_44912 ?auto_44916 ) ) ( not ( = ?auto_44913 ?auto_44914 ) ) ( not ( = ?auto_44913 ?auto_44915 ) ) ( not ( = ?auto_44913 ?auto_44916 ) ) ( not ( = ?auto_44914 ?auto_44915 ) ) ( not ( = ?auto_44914 ?auto_44916 ) ) ( not ( = ?auto_44915 ?auto_44916 ) ) ( CLEAR ?auto_44914 ) ( ON ?auto_44915 ?auto_44916 ) ( CLEAR ?auto_44915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_44909 ?auto_44910 ?auto_44911 ?auto_44912 ?auto_44913 ?auto_44914 ?auto_44915 )
      ( MAKE-8PILE ?auto_44909 ?auto_44910 ?auto_44911 ?auto_44912 ?auto_44913 ?auto_44914 ?auto_44915 ?auto_44916 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_44925 - BLOCK
      ?auto_44926 - BLOCK
      ?auto_44927 - BLOCK
      ?auto_44928 - BLOCK
      ?auto_44929 - BLOCK
      ?auto_44930 - BLOCK
      ?auto_44931 - BLOCK
      ?auto_44932 - BLOCK
    )
    :vars
    (
      ?auto_44933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44932 ?auto_44933 ) ( ON-TABLE ?auto_44925 ) ( ON ?auto_44926 ?auto_44925 ) ( ON ?auto_44927 ?auto_44926 ) ( ON ?auto_44928 ?auto_44927 ) ( ON ?auto_44929 ?auto_44928 ) ( not ( = ?auto_44925 ?auto_44926 ) ) ( not ( = ?auto_44925 ?auto_44927 ) ) ( not ( = ?auto_44925 ?auto_44928 ) ) ( not ( = ?auto_44925 ?auto_44929 ) ) ( not ( = ?auto_44925 ?auto_44930 ) ) ( not ( = ?auto_44925 ?auto_44931 ) ) ( not ( = ?auto_44925 ?auto_44932 ) ) ( not ( = ?auto_44925 ?auto_44933 ) ) ( not ( = ?auto_44926 ?auto_44927 ) ) ( not ( = ?auto_44926 ?auto_44928 ) ) ( not ( = ?auto_44926 ?auto_44929 ) ) ( not ( = ?auto_44926 ?auto_44930 ) ) ( not ( = ?auto_44926 ?auto_44931 ) ) ( not ( = ?auto_44926 ?auto_44932 ) ) ( not ( = ?auto_44926 ?auto_44933 ) ) ( not ( = ?auto_44927 ?auto_44928 ) ) ( not ( = ?auto_44927 ?auto_44929 ) ) ( not ( = ?auto_44927 ?auto_44930 ) ) ( not ( = ?auto_44927 ?auto_44931 ) ) ( not ( = ?auto_44927 ?auto_44932 ) ) ( not ( = ?auto_44927 ?auto_44933 ) ) ( not ( = ?auto_44928 ?auto_44929 ) ) ( not ( = ?auto_44928 ?auto_44930 ) ) ( not ( = ?auto_44928 ?auto_44931 ) ) ( not ( = ?auto_44928 ?auto_44932 ) ) ( not ( = ?auto_44928 ?auto_44933 ) ) ( not ( = ?auto_44929 ?auto_44930 ) ) ( not ( = ?auto_44929 ?auto_44931 ) ) ( not ( = ?auto_44929 ?auto_44932 ) ) ( not ( = ?auto_44929 ?auto_44933 ) ) ( not ( = ?auto_44930 ?auto_44931 ) ) ( not ( = ?auto_44930 ?auto_44932 ) ) ( not ( = ?auto_44930 ?auto_44933 ) ) ( not ( = ?auto_44931 ?auto_44932 ) ) ( not ( = ?auto_44931 ?auto_44933 ) ) ( not ( = ?auto_44932 ?auto_44933 ) ) ( ON ?auto_44931 ?auto_44932 ) ( CLEAR ?auto_44929 ) ( ON ?auto_44930 ?auto_44931 ) ( CLEAR ?auto_44930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44925 ?auto_44926 ?auto_44927 ?auto_44928 ?auto_44929 ?auto_44930 )
      ( MAKE-8PILE ?auto_44925 ?auto_44926 ?auto_44927 ?auto_44928 ?auto_44929 ?auto_44930 ?auto_44931 ?auto_44932 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_44942 - BLOCK
      ?auto_44943 - BLOCK
      ?auto_44944 - BLOCK
      ?auto_44945 - BLOCK
      ?auto_44946 - BLOCK
      ?auto_44947 - BLOCK
      ?auto_44948 - BLOCK
      ?auto_44949 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44949 ) ( ON-TABLE ?auto_44942 ) ( ON ?auto_44943 ?auto_44942 ) ( ON ?auto_44944 ?auto_44943 ) ( ON ?auto_44945 ?auto_44944 ) ( ON ?auto_44946 ?auto_44945 ) ( not ( = ?auto_44942 ?auto_44943 ) ) ( not ( = ?auto_44942 ?auto_44944 ) ) ( not ( = ?auto_44942 ?auto_44945 ) ) ( not ( = ?auto_44942 ?auto_44946 ) ) ( not ( = ?auto_44942 ?auto_44947 ) ) ( not ( = ?auto_44942 ?auto_44948 ) ) ( not ( = ?auto_44942 ?auto_44949 ) ) ( not ( = ?auto_44943 ?auto_44944 ) ) ( not ( = ?auto_44943 ?auto_44945 ) ) ( not ( = ?auto_44943 ?auto_44946 ) ) ( not ( = ?auto_44943 ?auto_44947 ) ) ( not ( = ?auto_44943 ?auto_44948 ) ) ( not ( = ?auto_44943 ?auto_44949 ) ) ( not ( = ?auto_44944 ?auto_44945 ) ) ( not ( = ?auto_44944 ?auto_44946 ) ) ( not ( = ?auto_44944 ?auto_44947 ) ) ( not ( = ?auto_44944 ?auto_44948 ) ) ( not ( = ?auto_44944 ?auto_44949 ) ) ( not ( = ?auto_44945 ?auto_44946 ) ) ( not ( = ?auto_44945 ?auto_44947 ) ) ( not ( = ?auto_44945 ?auto_44948 ) ) ( not ( = ?auto_44945 ?auto_44949 ) ) ( not ( = ?auto_44946 ?auto_44947 ) ) ( not ( = ?auto_44946 ?auto_44948 ) ) ( not ( = ?auto_44946 ?auto_44949 ) ) ( not ( = ?auto_44947 ?auto_44948 ) ) ( not ( = ?auto_44947 ?auto_44949 ) ) ( not ( = ?auto_44948 ?auto_44949 ) ) ( ON ?auto_44948 ?auto_44949 ) ( CLEAR ?auto_44946 ) ( ON ?auto_44947 ?auto_44948 ) ( CLEAR ?auto_44947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44942 ?auto_44943 ?auto_44944 ?auto_44945 ?auto_44946 ?auto_44947 )
      ( MAKE-8PILE ?auto_44942 ?auto_44943 ?auto_44944 ?auto_44945 ?auto_44946 ?auto_44947 ?auto_44948 ?auto_44949 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_44958 - BLOCK
      ?auto_44959 - BLOCK
      ?auto_44960 - BLOCK
      ?auto_44961 - BLOCK
      ?auto_44962 - BLOCK
      ?auto_44963 - BLOCK
      ?auto_44964 - BLOCK
      ?auto_44965 - BLOCK
    )
    :vars
    (
      ?auto_44966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44965 ?auto_44966 ) ( ON-TABLE ?auto_44958 ) ( ON ?auto_44959 ?auto_44958 ) ( ON ?auto_44960 ?auto_44959 ) ( ON ?auto_44961 ?auto_44960 ) ( not ( = ?auto_44958 ?auto_44959 ) ) ( not ( = ?auto_44958 ?auto_44960 ) ) ( not ( = ?auto_44958 ?auto_44961 ) ) ( not ( = ?auto_44958 ?auto_44962 ) ) ( not ( = ?auto_44958 ?auto_44963 ) ) ( not ( = ?auto_44958 ?auto_44964 ) ) ( not ( = ?auto_44958 ?auto_44965 ) ) ( not ( = ?auto_44958 ?auto_44966 ) ) ( not ( = ?auto_44959 ?auto_44960 ) ) ( not ( = ?auto_44959 ?auto_44961 ) ) ( not ( = ?auto_44959 ?auto_44962 ) ) ( not ( = ?auto_44959 ?auto_44963 ) ) ( not ( = ?auto_44959 ?auto_44964 ) ) ( not ( = ?auto_44959 ?auto_44965 ) ) ( not ( = ?auto_44959 ?auto_44966 ) ) ( not ( = ?auto_44960 ?auto_44961 ) ) ( not ( = ?auto_44960 ?auto_44962 ) ) ( not ( = ?auto_44960 ?auto_44963 ) ) ( not ( = ?auto_44960 ?auto_44964 ) ) ( not ( = ?auto_44960 ?auto_44965 ) ) ( not ( = ?auto_44960 ?auto_44966 ) ) ( not ( = ?auto_44961 ?auto_44962 ) ) ( not ( = ?auto_44961 ?auto_44963 ) ) ( not ( = ?auto_44961 ?auto_44964 ) ) ( not ( = ?auto_44961 ?auto_44965 ) ) ( not ( = ?auto_44961 ?auto_44966 ) ) ( not ( = ?auto_44962 ?auto_44963 ) ) ( not ( = ?auto_44962 ?auto_44964 ) ) ( not ( = ?auto_44962 ?auto_44965 ) ) ( not ( = ?auto_44962 ?auto_44966 ) ) ( not ( = ?auto_44963 ?auto_44964 ) ) ( not ( = ?auto_44963 ?auto_44965 ) ) ( not ( = ?auto_44963 ?auto_44966 ) ) ( not ( = ?auto_44964 ?auto_44965 ) ) ( not ( = ?auto_44964 ?auto_44966 ) ) ( not ( = ?auto_44965 ?auto_44966 ) ) ( ON ?auto_44964 ?auto_44965 ) ( ON ?auto_44963 ?auto_44964 ) ( CLEAR ?auto_44961 ) ( ON ?auto_44962 ?auto_44963 ) ( CLEAR ?auto_44962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44958 ?auto_44959 ?auto_44960 ?auto_44961 ?auto_44962 )
      ( MAKE-8PILE ?auto_44958 ?auto_44959 ?auto_44960 ?auto_44961 ?auto_44962 ?auto_44963 ?auto_44964 ?auto_44965 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_44975 - BLOCK
      ?auto_44976 - BLOCK
      ?auto_44977 - BLOCK
      ?auto_44978 - BLOCK
      ?auto_44979 - BLOCK
      ?auto_44980 - BLOCK
      ?auto_44981 - BLOCK
      ?auto_44982 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44982 ) ( ON-TABLE ?auto_44975 ) ( ON ?auto_44976 ?auto_44975 ) ( ON ?auto_44977 ?auto_44976 ) ( ON ?auto_44978 ?auto_44977 ) ( not ( = ?auto_44975 ?auto_44976 ) ) ( not ( = ?auto_44975 ?auto_44977 ) ) ( not ( = ?auto_44975 ?auto_44978 ) ) ( not ( = ?auto_44975 ?auto_44979 ) ) ( not ( = ?auto_44975 ?auto_44980 ) ) ( not ( = ?auto_44975 ?auto_44981 ) ) ( not ( = ?auto_44975 ?auto_44982 ) ) ( not ( = ?auto_44976 ?auto_44977 ) ) ( not ( = ?auto_44976 ?auto_44978 ) ) ( not ( = ?auto_44976 ?auto_44979 ) ) ( not ( = ?auto_44976 ?auto_44980 ) ) ( not ( = ?auto_44976 ?auto_44981 ) ) ( not ( = ?auto_44976 ?auto_44982 ) ) ( not ( = ?auto_44977 ?auto_44978 ) ) ( not ( = ?auto_44977 ?auto_44979 ) ) ( not ( = ?auto_44977 ?auto_44980 ) ) ( not ( = ?auto_44977 ?auto_44981 ) ) ( not ( = ?auto_44977 ?auto_44982 ) ) ( not ( = ?auto_44978 ?auto_44979 ) ) ( not ( = ?auto_44978 ?auto_44980 ) ) ( not ( = ?auto_44978 ?auto_44981 ) ) ( not ( = ?auto_44978 ?auto_44982 ) ) ( not ( = ?auto_44979 ?auto_44980 ) ) ( not ( = ?auto_44979 ?auto_44981 ) ) ( not ( = ?auto_44979 ?auto_44982 ) ) ( not ( = ?auto_44980 ?auto_44981 ) ) ( not ( = ?auto_44980 ?auto_44982 ) ) ( not ( = ?auto_44981 ?auto_44982 ) ) ( ON ?auto_44981 ?auto_44982 ) ( ON ?auto_44980 ?auto_44981 ) ( CLEAR ?auto_44978 ) ( ON ?auto_44979 ?auto_44980 ) ( CLEAR ?auto_44979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44975 ?auto_44976 ?auto_44977 ?auto_44978 ?auto_44979 )
      ( MAKE-8PILE ?auto_44975 ?auto_44976 ?auto_44977 ?auto_44978 ?auto_44979 ?auto_44980 ?auto_44981 ?auto_44982 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_44991 - BLOCK
      ?auto_44992 - BLOCK
      ?auto_44993 - BLOCK
      ?auto_44994 - BLOCK
      ?auto_44995 - BLOCK
      ?auto_44996 - BLOCK
      ?auto_44997 - BLOCK
      ?auto_44998 - BLOCK
    )
    :vars
    (
      ?auto_44999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44998 ?auto_44999 ) ( ON-TABLE ?auto_44991 ) ( ON ?auto_44992 ?auto_44991 ) ( ON ?auto_44993 ?auto_44992 ) ( not ( = ?auto_44991 ?auto_44992 ) ) ( not ( = ?auto_44991 ?auto_44993 ) ) ( not ( = ?auto_44991 ?auto_44994 ) ) ( not ( = ?auto_44991 ?auto_44995 ) ) ( not ( = ?auto_44991 ?auto_44996 ) ) ( not ( = ?auto_44991 ?auto_44997 ) ) ( not ( = ?auto_44991 ?auto_44998 ) ) ( not ( = ?auto_44991 ?auto_44999 ) ) ( not ( = ?auto_44992 ?auto_44993 ) ) ( not ( = ?auto_44992 ?auto_44994 ) ) ( not ( = ?auto_44992 ?auto_44995 ) ) ( not ( = ?auto_44992 ?auto_44996 ) ) ( not ( = ?auto_44992 ?auto_44997 ) ) ( not ( = ?auto_44992 ?auto_44998 ) ) ( not ( = ?auto_44992 ?auto_44999 ) ) ( not ( = ?auto_44993 ?auto_44994 ) ) ( not ( = ?auto_44993 ?auto_44995 ) ) ( not ( = ?auto_44993 ?auto_44996 ) ) ( not ( = ?auto_44993 ?auto_44997 ) ) ( not ( = ?auto_44993 ?auto_44998 ) ) ( not ( = ?auto_44993 ?auto_44999 ) ) ( not ( = ?auto_44994 ?auto_44995 ) ) ( not ( = ?auto_44994 ?auto_44996 ) ) ( not ( = ?auto_44994 ?auto_44997 ) ) ( not ( = ?auto_44994 ?auto_44998 ) ) ( not ( = ?auto_44994 ?auto_44999 ) ) ( not ( = ?auto_44995 ?auto_44996 ) ) ( not ( = ?auto_44995 ?auto_44997 ) ) ( not ( = ?auto_44995 ?auto_44998 ) ) ( not ( = ?auto_44995 ?auto_44999 ) ) ( not ( = ?auto_44996 ?auto_44997 ) ) ( not ( = ?auto_44996 ?auto_44998 ) ) ( not ( = ?auto_44996 ?auto_44999 ) ) ( not ( = ?auto_44997 ?auto_44998 ) ) ( not ( = ?auto_44997 ?auto_44999 ) ) ( not ( = ?auto_44998 ?auto_44999 ) ) ( ON ?auto_44997 ?auto_44998 ) ( ON ?auto_44996 ?auto_44997 ) ( ON ?auto_44995 ?auto_44996 ) ( CLEAR ?auto_44993 ) ( ON ?auto_44994 ?auto_44995 ) ( CLEAR ?auto_44994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44991 ?auto_44992 ?auto_44993 ?auto_44994 )
      ( MAKE-8PILE ?auto_44991 ?auto_44992 ?auto_44993 ?auto_44994 ?auto_44995 ?auto_44996 ?auto_44997 ?auto_44998 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_45008 - BLOCK
      ?auto_45009 - BLOCK
      ?auto_45010 - BLOCK
      ?auto_45011 - BLOCK
      ?auto_45012 - BLOCK
      ?auto_45013 - BLOCK
      ?auto_45014 - BLOCK
      ?auto_45015 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45015 ) ( ON-TABLE ?auto_45008 ) ( ON ?auto_45009 ?auto_45008 ) ( ON ?auto_45010 ?auto_45009 ) ( not ( = ?auto_45008 ?auto_45009 ) ) ( not ( = ?auto_45008 ?auto_45010 ) ) ( not ( = ?auto_45008 ?auto_45011 ) ) ( not ( = ?auto_45008 ?auto_45012 ) ) ( not ( = ?auto_45008 ?auto_45013 ) ) ( not ( = ?auto_45008 ?auto_45014 ) ) ( not ( = ?auto_45008 ?auto_45015 ) ) ( not ( = ?auto_45009 ?auto_45010 ) ) ( not ( = ?auto_45009 ?auto_45011 ) ) ( not ( = ?auto_45009 ?auto_45012 ) ) ( not ( = ?auto_45009 ?auto_45013 ) ) ( not ( = ?auto_45009 ?auto_45014 ) ) ( not ( = ?auto_45009 ?auto_45015 ) ) ( not ( = ?auto_45010 ?auto_45011 ) ) ( not ( = ?auto_45010 ?auto_45012 ) ) ( not ( = ?auto_45010 ?auto_45013 ) ) ( not ( = ?auto_45010 ?auto_45014 ) ) ( not ( = ?auto_45010 ?auto_45015 ) ) ( not ( = ?auto_45011 ?auto_45012 ) ) ( not ( = ?auto_45011 ?auto_45013 ) ) ( not ( = ?auto_45011 ?auto_45014 ) ) ( not ( = ?auto_45011 ?auto_45015 ) ) ( not ( = ?auto_45012 ?auto_45013 ) ) ( not ( = ?auto_45012 ?auto_45014 ) ) ( not ( = ?auto_45012 ?auto_45015 ) ) ( not ( = ?auto_45013 ?auto_45014 ) ) ( not ( = ?auto_45013 ?auto_45015 ) ) ( not ( = ?auto_45014 ?auto_45015 ) ) ( ON ?auto_45014 ?auto_45015 ) ( ON ?auto_45013 ?auto_45014 ) ( ON ?auto_45012 ?auto_45013 ) ( CLEAR ?auto_45010 ) ( ON ?auto_45011 ?auto_45012 ) ( CLEAR ?auto_45011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45008 ?auto_45009 ?auto_45010 ?auto_45011 )
      ( MAKE-8PILE ?auto_45008 ?auto_45009 ?auto_45010 ?auto_45011 ?auto_45012 ?auto_45013 ?auto_45014 ?auto_45015 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_45024 - BLOCK
      ?auto_45025 - BLOCK
      ?auto_45026 - BLOCK
      ?auto_45027 - BLOCK
      ?auto_45028 - BLOCK
      ?auto_45029 - BLOCK
      ?auto_45030 - BLOCK
      ?auto_45031 - BLOCK
    )
    :vars
    (
      ?auto_45032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45031 ?auto_45032 ) ( ON-TABLE ?auto_45024 ) ( ON ?auto_45025 ?auto_45024 ) ( not ( = ?auto_45024 ?auto_45025 ) ) ( not ( = ?auto_45024 ?auto_45026 ) ) ( not ( = ?auto_45024 ?auto_45027 ) ) ( not ( = ?auto_45024 ?auto_45028 ) ) ( not ( = ?auto_45024 ?auto_45029 ) ) ( not ( = ?auto_45024 ?auto_45030 ) ) ( not ( = ?auto_45024 ?auto_45031 ) ) ( not ( = ?auto_45024 ?auto_45032 ) ) ( not ( = ?auto_45025 ?auto_45026 ) ) ( not ( = ?auto_45025 ?auto_45027 ) ) ( not ( = ?auto_45025 ?auto_45028 ) ) ( not ( = ?auto_45025 ?auto_45029 ) ) ( not ( = ?auto_45025 ?auto_45030 ) ) ( not ( = ?auto_45025 ?auto_45031 ) ) ( not ( = ?auto_45025 ?auto_45032 ) ) ( not ( = ?auto_45026 ?auto_45027 ) ) ( not ( = ?auto_45026 ?auto_45028 ) ) ( not ( = ?auto_45026 ?auto_45029 ) ) ( not ( = ?auto_45026 ?auto_45030 ) ) ( not ( = ?auto_45026 ?auto_45031 ) ) ( not ( = ?auto_45026 ?auto_45032 ) ) ( not ( = ?auto_45027 ?auto_45028 ) ) ( not ( = ?auto_45027 ?auto_45029 ) ) ( not ( = ?auto_45027 ?auto_45030 ) ) ( not ( = ?auto_45027 ?auto_45031 ) ) ( not ( = ?auto_45027 ?auto_45032 ) ) ( not ( = ?auto_45028 ?auto_45029 ) ) ( not ( = ?auto_45028 ?auto_45030 ) ) ( not ( = ?auto_45028 ?auto_45031 ) ) ( not ( = ?auto_45028 ?auto_45032 ) ) ( not ( = ?auto_45029 ?auto_45030 ) ) ( not ( = ?auto_45029 ?auto_45031 ) ) ( not ( = ?auto_45029 ?auto_45032 ) ) ( not ( = ?auto_45030 ?auto_45031 ) ) ( not ( = ?auto_45030 ?auto_45032 ) ) ( not ( = ?auto_45031 ?auto_45032 ) ) ( ON ?auto_45030 ?auto_45031 ) ( ON ?auto_45029 ?auto_45030 ) ( ON ?auto_45028 ?auto_45029 ) ( ON ?auto_45027 ?auto_45028 ) ( CLEAR ?auto_45025 ) ( ON ?auto_45026 ?auto_45027 ) ( CLEAR ?auto_45026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45024 ?auto_45025 ?auto_45026 )
      ( MAKE-8PILE ?auto_45024 ?auto_45025 ?auto_45026 ?auto_45027 ?auto_45028 ?auto_45029 ?auto_45030 ?auto_45031 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_45041 - BLOCK
      ?auto_45042 - BLOCK
      ?auto_45043 - BLOCK
      ?auto_45044 - BLOCK
      ?auto_45045 - BLOCK
      ?auto_45046 - BLOCK
      ?auto_45047 - BLOCK
      ?auto_45048 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45048 ) ( ON-TABLE ?auto_45041 ) ( ON ?auto_45042 ?auto_45041 ) ( not ( = ?auto_45041 ?auto_45042 ) ) ( not ( = ?auto_45041 ?auto_45043 ) ) ( not ( = ?auto_45041 ?auto_45044 ) ) ( not ( = ?auto_45041 ?auto_45045 ) ) ( not ( = ?auto_45041 ?auto_45046 ) ) ( not ( = ?auto_45041 ?auto_45047 ) ) ( not ( = ?auto_45041 ?auto_45048 ) ) ( not ( = ?auto_45042 ?auto_45043 ) ) ( not ( = ?auto_45042 ?auto_45044 ) ) ( not ( = ?auto_45042 ?auto_45045 ) ) ( not ( = ?auto_45042 ?auto_45046 ) ) ( not ( = ?auto_45042 ?auto_45047 ) ) ( not ( = ?auto_45042 ?auto_45048 ) ) ( not ( = ?auto_45043 ?auto_45044 ) ) ( not ( = ?auto_45043 ?auto_45045 ) ) ( not ( = ?auto_45043 ?auto_45046 ) ) ( not ( = ?auto_45043 ?auto_45047 ) ) ( not ( = ?auto_45043 ?auto_45048 ) ) ( not ( = ?auto_45044 ?auto_45045 ) ) ( not ( = ?auto_45044 ?auto_45046 ) ) ( not ( = ?auto_45044 ?auto_45047 ) ) ( not ( = ?auto_45044 ?auto_45048 ) ) ( not ( = ?auto_45045 ?auto_45046 ) ) ( not ( = ?auto_45045 ?auto_45047 ) ) ( not ( = ?auto_45045 ?auto_45048 ) ) ( not ( = ?auto_45046 ?auto_45047 ) ) ( not ( = ?auto_45046 ?auto_45048 ) ) ( not ( = ?auto_45047 ?auto_45048 ) ) ( ON ?auto_45047 ?auto_45048 ) ( ON ?auto_45046 ?auto_45047 ) ( ON ?auto_45045 ?auto_45046 ) ( ON ?auto_45044 ?auto_45045 ) ( CLEAR ?auto_45042 ) ( ON ?auto_45043 ?auto_45044 ) ( CLEAR ?auto_45043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45041 ?auto_45042 ?auto_45043 )
      ( MAKE-8PILE ?auto_45041 ?auto_45042 ?auto_45043 ?auto_45044 ?auto_45045 ?auto_45046 ?auto_45047 ?auto_45048 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_45057 - BLOCK
      ?auto_45058 - BLOCK
      ?auto_45059 - BLOCK
      ?auto_45060 - BLOCK
      ?auto_45061 - BLOCK
      ?auto_45062 - BLOCK
      ?auto_45063 - BLOCK
      ?auto_45064 - BLOCK
    )
    :vars
    (
      ?auto_45065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45064 ?auto_45065 ) ( ON-TABLE ?auto_45057 ) ( not ( = ?auto_45057 ?auto_45058 ) ) ( not ( = ?auto_45057 ?auto_45059 ) ) ( not ( = ?auto_45057 ?auto_45060 ) ) ( not ( = ?auto_45057 ?auto_45061 ) ) ( not ( = ?auto_45057 ?auto_45062 ) ) ( not ( = ?auto_45057 ?auto_45063 ) ) ( not ( = ?auto_45057 ?auto_45064 ) ) ( not ( = ?auto_45057 ?auto_45065 ) ) ( not ( = ?auto_45058 ?auto_45059 ) ) ( not ( = ?auto_45058 ?auto_45060 ) ) ( not ( = ?auto_45058 ?auto_45061 ) ) ( not ( = ?auto_45058 ?auto_45062 ) ) ( not ( = ?auto_45058 ?auto_45063 ) ) ( not ( = ?auto_45058 ?auto_45064 ) ) ( not ( = ?auto_45058 ?auto_45065 ) ) ( not ( = ?auto_45059 ?auto_45060 ) ) ( not ( = ?auto_45059 ?auto_45061 ) ) ( not ( = ?auto_45059 ?auto_45062 ) ) ( not ( = ?auto_45059 ?auto_45063 ) ) ( not ( = ?auto_45059 ?auto_45064 ) ) ( not ( = ?auto_45059 ?auto_45065 ) ) ( not ( = ?auto_45060 ?auto_45061 ) ) ( not ( = ?auto_45060 ?auto_45062 ) ) ( not ( = ?auto_45060 ?auto_45063 ) ) ( not ( = ?auto_45060 ?auto_45064 ) ) ( not ( = ?auto_45060 ?auto_45065 ) ) ( not ( = ?auto_45061 ?auto_45062 ) ) ( not ( = ?auto_45061 ?auto_45063 ) ) ( not ( = ?auto_45061 ?auto_45064 ) ) ( not ( = ?auto_45061 ?auto_45065 ) ) ( not ( = ?auto_45062 ?auto_45063 ) ) ( not ( = ?auto_45062 ?auto_45064 ) ) ( not ( = ?auto_45062 ?auto_45065 ) ) ( not ( = ?auto_45063 ?auto_45064 ) ) ( not ( = ?auto_45063 ?auto_45065 ) ) ( not ( = ?auto_45064 ?auto_45065 ) ) ( ON ?auto_45063 ?auto_45064 ) ( ON ?auto_45062 ?auto_45063 ) ( ON ?auto_45061 ?auto_45062 ) ( ON ?auto_45060 ?auto_45061 ) ( ON ?auto_45059 ?auto_45060 ) ( CLEAR ?auto_45057 ) ( ON ?auto_45058 ?auto_45059 ) ( CLEAR ?auto_45058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45057 ?auto_45058 )
      ( MAKE-8PILE ?auto_45057 ?auto_45058 ?auto_45059 ?auto_45060 ?auto_45061 ?auto_45062 ?auto_45063 ?auto_45064 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_45074 - BLOCK
      ?auto_45075 - BLOCK
      ?auto_45076 - BLOCK
      ?auto_45077 - BLOCK
      ?auto_45078 - BLOCK
      ?auto_45079 - BLOCK
      ?auto_45080 - BLOCK
      ?auto_45081 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45081 ) ( ON-TABLE ?auto_45074 ) ( not ( = ?auto_45074 ?auto_45075 ) ) ( not ( = ?auto_45074 ?auto_45076 ) ) ( not ( = ?auto_45074 ?auto_45077 ) ) ( not ( = ?auto_45074 ?auto_45078 ) ) ( not ( = ?auto_45074 ?auto_45079 ) ) ( not ( = ?auto_45074 ?auto_45080 ) ) ( not ( = ?auto_45074 ?auto_45081 ) ) ( not ( = ?auto_45075 ?auto_45076 ) ) ( not ( = ?auto_45075 ?auto_45077 ) ) ( not ( = ?auto_45075 ?auto_45078 ) ) ( not ( = ?auto_45075 ?auto_45079 ) ) ( not ( = ?auto_45075 ?auto_45080 ) ) ( not ( = ?auto_45075 ?auto_45081 ) ) ( not ( = ?auto_45076 ?auto_45077 ) ) ( not ( = ?auto_45076 ?auto_45078 ) ) ( not ( = ?auto_45076 ?auto_45079 ) ) ( not ( = ?auto_45076 ?auto_45080 ) ) ( not ( = ?auto_45076 ?auto_45081 ) ) ( not ( = ?auto_45077 ?auto_45078 ) ) ( not ( = ?auto_45077 ?auto_45079 ) ) ( not ( = ?auto_45077 ?auto_45080 ) ) ( not ( = ?auto_45077 ?auto_45081 ) ) ( not ( = ?auto_45078 ?auto_45079 ) ) ( not ( = ?auto_45078 ?auto_45080 ) ) ( not ( = ?auto_45078 ?auto_45081 ) ) ( not ( = ?auto_45079 ?auto_45080 ) ) ( not ( = ?auto_45079 ?auto_45081 ) ) ( not ( = ?auto_45080 ?auto_45081 ) ) ( ON ?auto_45080 ?auto_45081 ) ( ON ?auto_45079 ?auto_45080 ) ( ON ?auto_45078 ?auto_45079 ) ( ON ?auto_45077 ?auto_45078 ) ( ON ?auto_45076 ?auto_45077 ) ( CLEAR ?auto_45074 ) ( ON ?auto_45075 ?auto_45076 ) ( CLEAR ?auto_45075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45074 ?auto_45075 )
      ( MAKE-8PILE ?auto_45074 ?auto_45075 ?auto_45076 ?auto_45077 ?auto_45078 ?auto_45079 ?auto_45080 ?auto_45081 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_45090 - BLOCK
      ?auto_45091 - BLOCK
      ?auto_45092 - BLOCK
      ?auto_45093 - BLOCK
      ?auto_45094 - BLOCK
      ?auto_45095 - BLOCK
      ?auto_45096 - BLOCK
      ?auto_45097 - BLOCK
    )
    :vars
    (
      ?auto_45098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45097 ?auto_45098 ) ( not ( = ?auto_45090 ?auto_45091 ) ) ( not ( = ?auto_45090 ?auto_45092 ) ) ( not ( = ?auto_45090 ?auto_45093 ) ) ( not ( = ?auto_45090 ?auto_45094 ) ) ( not ( = ?auto_45090 ?auto_45095 ) ) ( not ( = ?auto_45090 ?auto_45096 ) ) ( not ( = ?auto_45090 ?auto_45097 ) ) ( not ( = ?auto_45090 ?auto_45098 ) ) ( not ( = ?auto_45091 ?auto_45092 ) ) ( not ( = ?auto_45091 ?auto_45093 ) ) ( not ( = ?auto_45091 ?auto_45094 ) ) ( not ( = ?auto_45091 ?auto_45095 ) ) ( not ( = ?auto_45091 ?auto_45096 ) ) ( not ( = ?auto_45091 ?auto_45097 ) ) ( not ( = ?auto_45091 ?auto_45098 ) ) ( not ( = ?auto_45092 ?auto_45093 ) ) ( not ( = ?auto_45092 ?auto_45094 ) ) ( not ( = ?auto_45092 ?auto_45095 ) ) ( not ( = ?auto_45092 ?auto_45096 ) ) ( not ( = ?auto_45092 ?auto_45097 ) ) ( not ( = ?auto_45092 ?auto_45098 ) ) ( not ( = ?auto_45093 ?auto_45094 ) ) ( not ( = ?auto_45093 ?auto_45095 ) ) ( not ( = ?auto_45093 ?auto_45096 ) ) ( not ( = ?auto_45093 ?auto_45097 ) ) ( not ( = ?auto_45093 ?auto_45098 ) ) ( not ( = ?auto_45094 ?auto_45095 ) ) ( not ( = ?auto_45094 ?auto_45096 ) ) ( not ( = ?auto_45094 ?auto_45097 ) ) ( not ( = ?auto_45094 ?auto_45098 ) ) ( not ( = ?auto_45095 ?auto_45096 ) ) ( not ( = ?auto_45095 ?auto_45097 ) ) ( not ( = ?auto_45095 ?auto_45098 ) ) ( not ( = ?auto_45096 ?auto_45097 ) ) ( not ( = ?auto_45096 ?auto_45098 ) ) ( not ( = ?auto_45097 ?auto_45098 ) ) ( ON ?auto_45096 ?auto_45097 ) ( ON ?auto_45095 ?auto_45096 ) ( ON ?auto_45094 ?auto_45095 ) ( ON ?auto_45093 ?auto_45094 ) ( ON ?auto_45092 ?auto_45093 ) ( ON ?auto_45091 ?auto_45092 ) ( ON ?auto_45090 ?auto_45091 ) ( CLEAR ?auto_45090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45090 )
      ( MAKE-8PILE ?auto_45090 ?auto_45091 ?auto_45092 ?auto_45093 ?auto_45094 ?auto_45095 ?auto_45096 ?auto_45097 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_45107 - BLOCK
      ?auto_45108 - BLOCK
      ?auto_45109 - BLOCK
      ?auto_45110 - BLOCK
      ?auto_45111 - BLOCK
      ?auto_45112 - BLOCK
      ?auto_45113 - BLOCK
      ?auto_45114 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45114 ) ( not ( = ?auto_45107 ?auto_45108 ) ) ( not ( = ?auto_45107 ?auto_45109 ) ) ( not ( = ?auto_45107 ?auto_45110 ) ) ( not ( = ?auto_45107 ?auto_45111 ) ) ( not ( = ?auto_45107 ?auto_45112 ) ) ( not ( = ?auto_45107 ?auto_45113 ) ) ( not ( = ?auto_45107 ?auto_45114 ) ) ( not ( = ?auto_45108 ?auto_45109 ) ) ( not ( = ?auto_45108 ?auto_45110 ) ) ( not ( = ?auto_45108 ?auto_45111 ) ) ( not ( = ?auto_45108 ?auto_45112 ) ) ( not ( = ?auto_45108 ?auto_45113 ) ) ( not ( = ?auto_45108 ?auto_45114 ) ) ( not ( = ?auto_45109 ?auto_45110 ) ) ( not ( = ?auto_45109 ?auto_45111 ) ) ( not ( = ?auto_45109 ?auto_45112 ) ) ( not ( = ?auto_45109 ?auto_45113 ) ) ( not ( = ?auto_45109 ?auto_45114 ) ) ( not ( = ?auto_45110 ?auto_45111 ) ) ( not ( = ?auto_45110 ?auto_45112 ) ) ( not ( = ?auto_45110 ?auto_45113 ) ) ( not ( = ?auto_45110 ?auto_45114 ) ) ( not ( = ?auto_45111 ?auto_45112 ) ) ( not ( = ?auto_45111 ?auto_45113 ) ) ( not ( = ?auto_45111 ?auto_45114 ) ) ( not ( = ?auto_45112 ?auto_45113 ) ) ( not ( = ?auto_45112 ?auto_45114 ) ) ( not ( = ?auto_45113 ?auto_45114 ) ) ( ON ?auto_45113 ?auto_45114 ) ( ON ?auto_45112 ?auto_45113 ) ( ON ?auto_45111 ?auto_45112 ) ( ON ?auto_45110 ?auto_45111 ) ( ON ?auto_45109 ?auto_45110 ) ( ON ?auto_45108 ?auto_45109 ) ( ON ?auto_45107 ?auto_45108 ) ( CLEAR ?auto_45107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45107 )
      ( MAKE-8PILE ?auto_45107 ?auto_45108 ?auto_45109 ?auto_45110 ?auto_45111 ?auto_45112 ?auto_45113 ?auto_45114 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_45123 - BLOCK
      ?auto_45124 - BLOCK
      ?auto_45125 - BLOCK
      ?auto_45126 - BLOCK
      ?auto_45127 - BLOCK
      ?auto_45128 - BLOCK
      ?auto_45129 - BLOCK
      ?auto_45130 - BLOCK
    )
    :vars
    (
      ?auto_45131 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45123 ?auto_45124 ) ) ( not ( = ?auto_45123 ?auto_45125 ) ) ( not ( = ?auto_45123 ?auto_45126 ) ) ( not ( = ?auto_45123 ?auto_45127 ) ) ( not ( = ?auto_45123 ?auto_45128 ) ) ( not ( = ?auto_45123 ?auto_45129 ) ) ( not ( = ?auto_45123 ?auto_45130 ) ) ( not ( = ?auto_45124 ?auto_45125 ) ) ( not ( = ?auto_45124 ?auto_45126 ) ) ( not ( = ?auto_45124 ?auto_45127 ) ) ( not ( = ?auto_45124 ?auto_45128 ) ) ( not ( = ?auto_45124 ?auto_45129 ) ) ( not ( = ?auto_45124 ?auto_45130 ) ) ( not ( = ?auto_45125 ?auto_45126 ) ) ( not ( = ?auto_45125 ?auto_45127 ) ) ( not ( = ?auto_45125 ?auto_45128 ) ) ( not ( = ?auto_45125 ?auto_45129 ) ) ( not ( = ?auto_45125 ?auto_45130 ) ) ( not ( = ?auto_45126 ?auto_45127 ) ) ( not ( = ?auto_45126 ?auto_45128 ) ) ( not ( = ?auto_45126 ?auto_45129 ) ) ( not ( = ?auto_45126 ?auto_45130 ) ) ( not ( = ?auto_45127 ?auto_45128 ) ) ( not ( = ?auto_45127 ?auto_45129 ) ) ( not ( = ?auto_45127 ?auto_45130 ) ) ( not ( = ?auto_45128 ?auto_45129 ) ) ( not ( = ?auto_45128 ?auto_45130 ) ) ( not ( = ?auto_45129 ?auto_45130 ) ) ( ON ?auto_45123 ?auto_45131 ) ( not ( = ?auto_45130 ?auto_45131 ) ) ( not ( = ?auto_45129 ?auto_45131 ) ) ( not ( = ?auto_45128 ?auto_45131 ) ) ( not ( = ?auto_45127 ?auto_45131 ) ) ( not ( = ?auto_45126 ?auto_45131 ) ) ( not ( = ?auto_45125 ?auto_45131 ) ) ( not ( = ?auto_45124 ?auto_45131 ) ) ( not ( = ?auto_45123 ?auto_45131 ) ) ( ON ?auto_45124 ?auto_45123 ) ( ON ?auto_45125 ?auto_45124 ) ( ON ?auto_45126 ?auto_45125 ) ( ON ?auto_45127 ?auto_45126 ) ( ON ?auto_45128 ?auto_45127 ) ( ON ?auto_45129 ?auto_45128 ) ( ON ?auto_45130 ?auto_45129 ) ( CLEAR ?auto_45130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_45130 ?auto_45129 ?auto_45128 ?auto_45127 ?auto_45126 ?auto_45125 ?auto_45124 ?auto_45123 )
      ( MAKE-8PILE ?auto_45123 ?auto_45124 ?auto_45125 ?auto_45126 ?auto_45127 ?auto_45128 ?auto_45129 ?auto_45130 ) )
  )

)

