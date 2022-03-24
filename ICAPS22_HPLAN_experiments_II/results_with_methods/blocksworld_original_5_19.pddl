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

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38293 - BLOCK
      ?auto_38294 - BLOCK
      ?auto_38295 - BLOCK
      ?auto_38296 - BLOCK
      ?auto_38297 - BLOCK
    )
    :vars
    (
      ?auto_38298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38298 ?auto_38297 ) ( CLEAR ?auto_38298 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38293 ) ( ON ?auto_38294 ?auto_38293 ) ( ON ?auto_38295 ?auto_38294 ) ( ON ?auto_38296 ?auto_38295 ) ( ON ?auto_38297 ?auto_38296 ) ( not ( = ?auto_38293 ?auto_38294 ) ) ( not ( = ?auto_38293 ?auto_38295 ) ) ( not ( = ?auto_38293 ?auto_38296 ) ) ( not ( = ?auto_38293 ?auto_38297 ) ) ( not ( = ?auto_38293 ?auto_38298 ) ) ( not ( = ?auto_38294 ?auto_38295 ) ) ( not ( = ?auto_38294 ?auto_38296 ) ) ( not ( = ?auto_38294 ?auto_38297 ) ) ( not ( = ?auto_38294 ?auto_38298 ) ) ( not ( = ?auto_38295 ?auto_38296 ) ) ( not ( = ?auto_38295 ?auto_38297 ) ) ( not ( = ?auto_38295 ?auto_38298 ) ) ( not ( = ?auto_38296 ?auto_38297 ) ) ( not ( = ?auto_38296 ?auto_38298 ) ) ( not ( = ?auto_38297 ?auto_38298 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38298 ?auto_38297 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38300 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_38300 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_38300 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38301 - BLOCK
    )
    :vars
    (
      ?auto_38302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38301 ?auto_38302 ) ( CLEAR ?auto_38301 ) ( HAND-EMPTY ) ( not ( = ?auto_38301 ?auto_38302 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38301 ?auto_38302 )
      ( MAKE-1PILE ?auto_38301 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38307 - BLOCK
      ?auto_38308 - BLOCK
      ?auto_38309 - BLOCK
      ?auto_38310 - BLOCK
    )
    :vars
    (
      ?auto_38311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38311 ?auto_38310 ) ( CLEAR ?auto_38311 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38307 ) ( ON ?auto_38308 ?auto_38307 ) ( ON ?auto_38309 ?auto_38308 ) ( ON ?auto_38310 ?auto_38309 ) ( not ( = ?auto_38307 ?auto_38308 ) ) ( not ( = ?auto_38307 ?auto_38309 ) ) ( not ( = ?auto_38307 ?auto_38310 ) ) ( not ( = ?auto_38307 ?auto_38311 ) ) ( not ( = ?auto_38308 ?auto_38309 ) ) ( not ( = ?auto_38308 ?auto_38310 ) ) ( not ( = ?auto_38308 ?auto_38311 ) ) ( not ( = ?auto_38309 ?auto_38310 ) ) ( not ( = ?auto_38309 ?auto_38311 ) ) ( not ( = ?auto_38310 ?auto_38311 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38311 ?auto_38310 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38312 - BLOCK
      ?auto_38313 - BLOCK
      ?auto_38314 - BLOCK
      ?auto_38315 - BLOCK
    )
    :vars
    (
      ?auto_38316 - BLOCK
      ?auto_38317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38316 ?auto_38315 ) ( CLEAR ?auto_38316 ) ( ON-TABLE ?auto_38312 ) ( ON ?auto_38313 ?auto_38312 ) ( ON ?auto_38314 ?auto_38313 ) ( ON ?auto_38315 ?auto_38314 ) ( not ( = ?auto_38312 ?auto_38313 ) ) ( not ( = ?auto_38312 ?auto_38314 ) ) ( not ( = ?auto_38312 ?auto_38315 ) ) ( not ( = ?auto_38312 ?auto_38316 ) ) ( not ( = ?auto_38313 ?auto_38314 ) ) ( not ( = ?auto_38313 ?auto_38315 ) ) ( not ( = ?auto_38313 ?auto_38316 ) ) ( not ( = ?auto_38314 ?auto_38315 ) ) ( not ( = ?auto_38314 ?auto_38316 ) ) ( not ( = ?auto_38315 ?auto_38316 ) ) ( HOLDING ?auto_38317 ) ( not ( = ?auto_38312 ?auto_38317 ) ) ( not ( = ?auto_38313 ?auto_38317 ) ) ( not ( = ?auto_38314 ?auto_38317 ) ) ( not ( = ?auto_38315 ?auto_38317 ) ) ( not ( = ?auto_38316 ?auto_38317 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_38317 )
      ( MAKE-4PILE ?auto_38312 ?auto_38313 ?auto_38314 ?auto_38315 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38318 - BLOCK
      ?auto_38319 - BLOCK
      ?auto_38320 - BLOCK
      ?auto_38321 - BLOCK
    )
    :vars
    (
      ?auto_38323 - BLOCK
      ?auto_38322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38323 ?auto_38321 ) ( ON-TABLE ?auto_38318 ) ( ON ?auto_38319 ?auto_38318 ) ( ON ?auto_38320 ?auto_38319 ) ( ON ?auto_38321 ?auto_38320 ) ( not ( = ?auto_38318 ?auto_38319 ) ) ( not ( = ?auto_38318 ?auto_38320 ) ) ( not ( = ?auto_38318 ?auto_38321 ) ) ( not ( = ?auto_38318 ?auto_38323 ) ) ( not ( = ?auto_38319 ?auto_38320 ) ) ( not ( = ?auto_38319 ?auto_38321 ) ) ( not ( = ?auto_38319 ?auto_38323 ) ) ( not ( = ?auto_38320 ?auto_38321 ) ) ( not ( = ?auto_38320 ?auto_38323 ) ) ( not ( = ?auto_38321 ?auto_38323 ) ) ( not ( = ?auto_38318 ?auto_38322 ) ) ( not ( = ?auto_38319 ?auto_38322 ) ) ( not ( = ?auto_38320 ?auto_38322 ) ) ( not ( = ?auto_38321 ?auto_38322 ) ) ( not ( = ?auto_38323 ?auto_38322 ) ) ( ON ?auto_38322 ?auto_38323 ) ( CLEAR ?auto_38322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38318 ?auto_38319 ?auto_38320 ?auto_38321 ?auto_38323 )
      ( MAKE-4PILE ?auto_38318 ?auto_38319 ?auto_38320 ?auto_38321 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38326 - BLOCK
      ?auto_38327 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_38327 ) ( CLEAR ?auto_38326 ) ( ON-TABLE ?auto_38326 ) ( not ( = ?auto_38326 ?auto_38327 ) ) )
    :subtasks
    ( ( !STACK ?auto_38327 ?auto_38326 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38328 - BLOCK
      ?auto_38329 - BLOCK
    )
    :vars
    (
      ?auto_38330 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_38328 ) ( ON-TABLE ?auto_38328 ) ( not ( = ?auto_38328 ?auto_38329 ) ) ( ON ?auto_38329 ?auto_38330 ) ( CLEAR ?auto_38329 ) ( HAND-EMPTY ) ( not ( = ?auto_38328 ?auto_38330 ) ) ( not ( = ?auto_38329 ?auto_38330 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38329 ?auto_38330 )
      ( MAKE-2PILE ?auto_38328 ?auto_38329 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38331 - BLOCK
      ?auto_38332 - BLOCK
    )
    :vars
    (
      ?auto_38333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38331 ?auto_38332 ) ) ( ON ?auto_38332 ?auto_38333 ) ( CLEAR ?auto_38332 ) ( not ( = ?auto_38331 ?auto_38333 ) ) ( not ( = ?auto_38332 ?auto_38333 ) ) ( HOLDING ?auto_38331 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38331 )
      ( MAKE-2PILE ?auto_38331 ?auto_38332 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38334 - BLOCK
      ?auto_38335 - BLOCK
    )
    :vars
    (
      ?auto_38336 - BLOCK
      ?auto_38338 - BLOCK
      ?auto_38339 - BLOCK
      ?auto_38337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38334 ?auto_38335 ) ) ( ON ?auto_38335 ?auto_38336 ) ( not ( = ?auto_38334 ?auto_38336 ) ) ( not ( = ?auto_38335 ?auto_38336 ) ) ( ON ?auto_38334 ?auto_38335 ) ( CLEAR ?auto_38334 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38338 ) ( ON ?auto_38339 ?auto_38338 ) ( ON ?auto_38337 ?auto_38339 ) ( ON ?auto_38336 ?auto_38337 ) ( not ( = ?auto_38338 ?auto_38339 ) ) ( not ( = ?auto_38338 ?auto_38337 ) ) ( not ( = ?auto_38338 ?auto_38336 ) ) ( not ( = ?auto_38338 ?auto_38335 ) ) ( not ( = ?auto_38338 ?auto_38334 ) ) ( not ( = ?auto_38339 ?auto_38337 ) ) ( not ( = ?auto_38339 ?auto_38336 ) ) ( not ( = ?auto_38339 ?auto_38335 ) ) ( not ( = ?auto_38339 ?auto_38334 ) ) ( not ( = ?auto_38337 ?auto_38336 ) ) ( not ( = ?auto_38337 ?auto_38335 ) ) ( not ( = ?auto_38337 ?auto_38334 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38338 ?auto_38339 ?auto_38337 ?auto_38336 ?auto_38335 )
      ( MAKE-2PILE ?auto_38334 ?auto_38335 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38343 - BLOCK
      ?auto_38344 - BLOCK
      ?auto_38345 - BLOCK
    )
    :vars
    (
      ?auto_38346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38346 ?auto_38345 ) ( CLEAR ?auto_38346 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38343 ) ( ON ?auto_38344 ?auto_38343 ) ( ON ?auto_38345 ?auto_38344 ) ( not ( = ?auto_38343 ?auto_38344 ) ) ( not ( = ?auto_38343 ?auto_38345 ) ) ( not ( = ?auto_38343 ?auto_38346 ) ) ( not ( = ?auto_38344 ?auto_38345 ) ) ( not ( = ?auto_38344 ?auto_38346 ) ) ( not ( = ?auto_38345 ?auto_38346 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38346 ?auto_38345 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38347 - BLOCK
      ?auto_38348 - BLOCK
      ?auto_38349 - BLOCK
    )
    :vars
    (
      ?auto_38350 - BLOCK
      ?auto_38351 - BLOCK
      ?auto_38352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38350 ?auto_38349 ) ( CLEAR ?auto_38350 ) ( ON-TABLE ?auto_38347 ) ( ON ?auto_38348 ?auto_38347 ) ( ON ?auto_38349 ?auto_38348 ) ( not ( = ?auto_38347 ?auto_38348 ) ) ( not ( = ?auto_38347 ?auto_38349 ) ) ( not ( = ?auto_38347 ?auto_38350 ) ) ( not ( = ?auto_38348 ?auto_38349 ) ) ( not ( = ?auto_38348 ?auto_38350 ) ) ( not ( = ?auto_38349 ?auto_38350 ) ) ( HOLDING ?auto_38351 ) ( CLEAR ?auto_38352 ) ( not ( = ?auto_38347 ?auto_38351 ) ) ( not ( = ?auto_38347 ?auto_38352 ) ) ( not ( = ?auto_38348 ?auto_38351 ) ) ( not ( = ?auto_38348 ?auto_38352 ) ) ( not ( = ?auto_38349 ?auto_38351 ) ) ( not ( = ?auto_38349 ?auto_38352 ) ) ( not ( = ?auto_38350 ?auto_38351 ) ) ( not ( = ?auto_38350 ?auto_38352 ) ) ( not ( = ?auto_38351 ?auto_38352 ) ) )
    :subtasks
    ( ( !STACK ?auto_38351 ?auto_38352 )
      ( MAKE-3PILE ?auto_38347 ?auto_38348 ?auto_38349 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38353 - BLOCK
      ?auto_38354 - BLOCK
      ?auto_38355 - BLOCK
    )
    :vars
    (
      ?auto_38358 - BLOCK
      ?auto_38356 - BLOCK
      ?auto_38357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38358 ?auto_38355 ) ( ON-TABLE ?auto_38353 ) ( ON ?auto_38354 ?auto_38353 ) ( ON ?auto_38355 ?auto_38354 ) ( not ( = ?auto_38353 ?auto_38354 ) ) ( not ( = ?auto_38353 ?auto_38355 ) ) ( not ( = ?auto_38353 ?auto_38358 ) ) ( not ( = ?auto_38354 ?auto_38355 ) ) ( not ( = ?auto_38354 ?auto_38358 ) ) ( not ( = ?auto_38355 ?auto_38358 ) ) ( CLEAR ?auto_38356 ) ( not ( = ?auto_38353 ?auto_38357 ) ) ( not ( = ?auto_38353 ?auto_38356 ) ) ( not ( = ?auto_38354 ?auto_38357 ) ) ( not ( = ?auto_38354 ?auto_38356 ) ) ( not ( = ?auto_38355 ?auto_38357 ) ) ( not ( = ?auto_38355 ?auto_38356 ) ) ( not ( = ?auto_38358 ?auto_38357 ) ) ( not ( = ?auto_38358 ?auto_38356 ) ) ( not ( = ?auto_38357 ?auto_38356 ) ) ( ON ?auto_38357 ?auto_38358 ) ( CLEAR ?auto_38357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38353 ?auto_38354 ?auto_38355 ?auto_38358 )
      ( MAKE-3PILE ?auto_38353 ?auto_38354 ?auto_38355 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38359 - BLOCK
      ?auto_38360 - BLOCK
      ?auto_38361 - BLOCK
    )
    :vars
    (
      ?auto_38364 - BLOCK
      ?auto_38363 - BLOCK
      ?auto_38362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38364 ?auto_38361 ) ( ON-TABLE ?auto_38359 ) ( ON ?auto_38360 ?auto_38359 ) ( ON ?auto_38361 ?auto_38360 ) ( not ( = ?auto_38359 ?auto_38360 ) ) ( not ( = ?auto_38359 ?auto_38361 ) ) ( not ( = ?auto_38359 ?auto_38364 ) ) ( not ( = ?auto_38360 ?auto_38361 ) ) ( not ( = ?auto_38360 ?auto_38364 ) ) ( not ( = ?auto_38361 ?auto_38364 ) ) ( not ( = ?auto_38359 ?auto_38363 ) ) ( not ( = ?auto_38359 ?auto_38362 ) ) ( not ( = ?auto_38360 ?auto_38363 ) ) ( not ( = ?auto_38360 ?auto_38362 ) ) ( not ( = ?auto_38361 ?auto_38363 ) ) ( not ( = ?auto_38361 ?auto_38362 ) ) ( not ( = ?auto_38364 ?auto_38363 ) ) ( not ( = ?auto_38364 ?auto_38362 ) ) ( not ( = ?auto_38363 ?auto_38362 ) ) ( ON ?auto_38363 ?auto_38364 ) ( CLEAR ?auto_38363 ) ( HOLDING ?auto_38362 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38362 )
      ( MAKE-3PILE ?auto_38359 ?auto_38360 ?auto_38361 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38365 - BLOCK
      ?auto_38366 - BLOCK
      ?auto_38367 - BLOCK
    )
    :vars
    (
      ?auto_38369 - BLOCK
      ?auto_38368 - BLOCK
      ?auto_38370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38369 ?auto_38367 ) ( ON-TABLE ?auto_38365 ) ( ON ?auto_38366 ?auto_38365 ) ( ON ?auto_38367 ?auto_38366 ) ( not ( = ?auto_38365 ?auto_38366 ) ) ( not ( = ?auto_38365 ?auto_38367 ) ) ( not ( = ?auto_38365 ?auto_38369 ) ) ( not ( = ?auto_38366 ?auto_38367 ) ) ( not ( = ?auto_38366 ?auto_38369 ) ) ( not ( = ?auto_38367 ?auto_38369 ) ) ( not ( = ?auto_38365 ?auto_38368 ) ) ( not ( = ?auto_38365 ?auto_38370 ) ) ( not ( = ?auto_38366 ?auto_38368 ) ) ( not ( = ?auto_38366 ?auto_38370 ) ) ( not ( = ?auto_38367 ?auto_38368 ) ) ( not ( = ?auto_38367 ?auto_38370 ) ) ( not ( = ?auto_38369 ?auto_38368 ) ) ( not ( = ?auto_38369 ?auto_38370 ) ) ( not ( = ?auto_38368 ?auto_38370 ) ) ( ON ?auto_38368 ?auto_38369 ) ( ON ?auto_38370 ?auto_38368 ) ( CLEAR ?auto_38370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38365 ?auto_38366 ?auto_38367 ?auto_38369 ?auto_38368 )
      ( MAKE-3PILE ?auto_38365 ?auto_38366 ?auto_38367 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38374 - BLOCK
      ?auto_38375 - BLOCK
      ?auto_38376 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_38376 ) ( CLEAR ?auto_38375 ) ( ON-TABLE ?auto_38374 ) ( ON ?auto_38375 ?auto_38374 ) ( not ( = ?auto_38374 ?auto_38375 ) ) ( not ( = ?auto_38374 ?auto_38376 ) ) ( not ( = ?auto_38375 ?auto_38376 ) ) )
    :subtasks
    ( ( !STACK ?auto_38376 ?auto_38375 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38377 - BLOCK
      ?auto_38378 - BLOCK
      ?auto_38379 - BLOCK
    )
    :vars
    (
      ?auto_38380 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_38378 ) ( ON-TABLE ?auto_38377 ) ( ON ?auto_38378 ?auto_38377 ) ( not ( = ?auto_38377 ?auto_38378 ) ) ( not ( = ?auto_38377 ?auto_38379 ) ) ( not ( = ?auto_38378 ?auto_38379 ) ) ( ON ?auto_38379 ?auto_38380 ) ( CLEAR ?auto_38379 ) ( HAND-EMPTY ) ( not ( = ?auto_38377 ?auto_38380 ) ) ( not ( = ?auto_38378 ?auto_38380 ) ) ( not ( = ?auto_38379 ?auto_38380 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38379 ?auto_38380 )
      ( MAKE-3PILE ?auto_38377 ?auto_38378 ?auto_38379 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38381 - BLOCK
      ?auto_38382 - BLOCK
      ?auto_38383 - BLOCK
    )
    :vars
    (
      ?auto_38384 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38381 ) ( not ( = ?auto_38381 ?auto_38382 ) ) ( not ( = ?auto_38381 ?auto_38383 ) ) ( not ( = ?auto_38382 ?auto_38383 ) ) ( ON ?auto_38383 ?auto_38384 ) ( CLEAR ?auto_38383 ) ( not ( = ?auto_38381 ?auto_38384 ) ) ( not ( = ?auto_38382 ?auto_38384 ) ) ( not ( = ?auto_38383 ?auto_38384 ) ) ( HOLDING ?auto_38382 ) ( CLEAR ?auto_38381 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38381 ?auto_38382 )
      ( MAKE-3PILE ?auto_38381 ?auto_38382 ?auto_38383 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38385 - BLOCK
      ?auto_38386 - BLOCK
      ?auto_38387 - BLOCK
    )
    :vars
    (
      ?auto_38388 - BLOCK
      ?auto_38390 - BLOCK
      ?auto_38389 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38385 ) ( not ( = ?auto_38385 ?auto_38386 ) ) ( not ( = ?auto_38385 ?auto_38387 ) ) ( not ( = ?auto_38386 ?auto_38387 ) ) ( ON ?auto_38387 ?auto_38388 ) ( not ( = ?auto_38385 ?auto_38388 ) ) ( not ( = ?auto_38386 ?auto_38388 ) ) ( not ( = ?auto_38387 ?auto_38388 ) ) ( CLEAR ?auto_38385 ) ( ON ?auto_38386 ?auto_38387 ) ( CLEAR ?auto_38386 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38390 ) ( ON ?auto_38389 ?auto_38390 ) ( ON ?auto_38388 ?auto_38389 ) ( not ( = ?auto_38390 ?auto_38389 ) ) ( not ( = ?auto_38390 ?auto_38388 ) ) ( not ( = ?auto_38390 ?auto_38387 ) ) ( not ( = ?auto_38390 ?auto_38386 ) ) ( not ( = ?auto_38389 ?auto_38388 ) ) ( not ( = ?auto_38389 ?auto_38387 ) ) ( not ( = ?auto_38389 ?auto_38386 ) ) ( not ( = ?auto_38385 ?auto_38390 ) ) ( not ( = ?auto_38385 ?auto_38389 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38390 ?auto_38389 ?auto_38388 ?auto_38387 )
      ( MAKE-3PILE ?auto_38385 ?auto_38386 ?auto_38387 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38391 - BLOCK
      ?auto_38392 - BLOCK
      ?auto_38393 - BLOCK
    )
    :vars
    (
      ?auto_38394 - BLOCK
      ?auto_38395 - BLOCK
      ?auto_38396 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38391 ?auto_38392 ) ) ( not ( = ?auto_38391 ?auto_38393 ) ) ( not ( = ?auto_38392 ?auto_38393 ) ) ( ON ?auto_38393 ?auto_38394 ) ( not ( = ?auto_38391 ?auto_38394 ) ) ( not ( = ?auto_38392 ?auto_38394 ) ) ( not ( = ?auto_38393 ?auto_38394 ) ) ( ON ?auto_38392 ?auto_38393 ) ( CLEAR ?auto_38392 ) ( ON-TABLE ?auto_38395 ) ( ON ?auto_38396 ?auto_38395 ) ( ON ?auto_38394 ?auto_38396 ) ( not ( = ?auto_38395 ?auto_38396 ) ) ( not ( = ?auto_38395 ?auto_38394 ) ) ( not ( = ?auto_38395 ?auto_38393 ) ) ( not ( = ?auto_38395 ?auto_38392 ) ) ( not ( = ?auto_38396 ?auto_38394 ) ) ( not ( = ?auto_38396 ?auto_38393 ) ) ( not ( = ?auto_38396 ?auto_38392 ) ) ( not ( = ?auto_38391 ?auto_38395 ) ) ( not ( = ?auto_38391 ?auto_38396 ) ) ( HOLDING ?auto_38391 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38391 )
      ( MAKE-3PILE ?auto_38391 ?auto_38392 ?auto_38393 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38397 - BLOCK
      ?auto_38398 - BLOCK
      ?auto_38399 - BLOCK
    )
    :vars
    (
      ?auto_38400 - BLOCK
      ?auto_38401 - BLOCK
      ?auto_38402 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38397 ?auto_38398 ) ) ( not ( = ?auto_38397 ?auto_38399 ) ) ( not ( = ?auto_38398 ?auto_38399 ) ) ( ON ?auto_38399 ?auto_38400 ) ( not ( = ?auto_38397 ?auto_38400 ) ) ( not ( = ?auto_38398 ?auto_38400 ) ) ( not ( = ?auto_38399 ?auto_38400 ) ) ( ON ?auto_38398 ?auto_38399 ) ( ON-TABLE ?auto_38401 ) ( ON ?auto_38402 ?auto_38401 ) ( ON ?auto_38400 ?auto_38402 ) ( not ( = ?auto_38401 ?auto_38402 ) ) ( not ( = ?auto_38401 ?auto_38400 ) ) ( not ( = ?auto_38401 ?auto_38399 ) ) ( not ( = ?auto_38401 ?auto_38398 ) ) ( not ( = ?auto_38402 ?auto_38400 ) ) ( not ( = ?auto_38402 ?auto_38399 ) ) ( not ( = ?auto_38402 ?auto_38398 ) ) ( not ( = ?auto_38397 ?auto_38401 ) ) ( not ( = ?auto_38397 ?auto_38402 ) ) ( ON ?auto_38397 ?auto_38398 ) ( CLEAR ?auto_38397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38401 ?auto_38402 ?auto_38400 ?auto_38399 ?auto_38398 )
      ( MAKE-3PILE ?auto_38397 ?auto_38398 ?auto_38399 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38405 - BLOCK
      ?auto_38406 - BLOCK
    )
    :vars
    (
      ?auto_38407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38407 ?auto_38406 ) ( CLEAR ?auto_38407 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38405 ) ( ON ?auto_38406 ?auto_38405 ) ( not ( = ?auto_38405 ?auto_38406 ) ) ( not ( = ?auto_38405 ?auto_38407 ) ) ( not ( = ?auto_38406 ?auto_38407 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38407 ?auto_38406 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38408 - BLOCK
      ?auto_38409 - BLOCK
    )
    :vars
    (
      ?auto_38410 - BLOCK
      ?auto_38411 - BLOCK
      ?auto_38412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38410 ?auto_38409 ) ( CLEAR ?auto_38410 ) ( ON-TABLE ?auto_38408 ) ( ON ?auto_38409 ?auto_38408 ) ( not ( = ?auto_38408 ?auto_38409 ) ) ( not ( = ?auto_38408 ?auto_38410 ) ) ( not ( = ?auto_38409 ?auto_38410 ) ) ( HOLDING ?auto_38411 ) ( CLEAR ?auto_38412 ) ( not ( = ?auto_38408 ?auto_38411 ) ) ( not ( = ?auto_38408 ?auto_38412 ) ) ( not ( = ?auto_38409 ?auto_38411 ) ) ( not ( = ?auto_38409 ?auto_38412 ) ) ( not ( = ?auto_38410 ?auto_38411 ) ) ( not ( = ?auto_38410 ?auto_38412 ) ) ( not ( = ?auto_38411 ?auto_38412 ) ) )
    :subtasks
    ( ( !STACK ?auto_38411 ?auto_38412 )
      ( MAKE-2PILE ?auto_38408 ?auto_38409 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38413 - BLOCK
      ?auto_38414 - BLOCK
    )
    :vars
    (
      ?auto_38416 - BLOCK
      ?auto_38417 - BLOCK
      ?auto_38415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38416 ?auto_38414 ) ( ON-TABLE ?auto_38413 ) ( ON ?auto_38414 ?auto_38413 ) ( not ( = ?auto_38413 ?auto_38414 ) ) ( not ( = ?auto_38413 ?auto_38416 ) ) ( not ( = ?auto_38414 ?auto_38416 ) ) ( CLEAR ?auto_38417 ) ( not ( = ?auto_38413 ?auto_38415 ) ) ( not ( = ?auto_38413 ?auto_38417 ) ) ( not ( = ?auto_38414 ?auto_38415 ) ) ( not ( = ?auto_38414 ?auto_38417 ) ) ( not ( = ?auto_38416 ?auto_38415 ) ) ( not ( = ?auto_38416 ?auto_38417 ) ) ( not ( = ?auto_38415 ?auto_38417 ) ) ( ON ?auto_38415 ?auto_38416 ) ( CLEAR ?auto_38415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38413 ?auto_38414 ?auto_38416 )
      ( MAKE-2PILE ?auto_38413 ?auto_38414 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38418 - BLOCK
      ?auto_38419 - BLOCK
    )
    :vars
    (
      ?auto_38422 - BLOCK
      ?auto_38421 - BLOCK
      ?auto_38420 - BLOCK
      ?auto_38423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38422 ?auto_38419 ) ( ON-TABLE ?auto_38418 ) ( ON ?auto_38419 ?auto_38418 ) ( not ( = ?auto_38418 ?auto_38419 ) ) ( not ( = ?auto_38418 ?auto_38422 ) ) ( not ( = ?auto_38419 ?auto_38422 ) ) ( not ( = ?auto_38418 ?auto_38421 ) ) ( not ( = ?auto_38418 ?auto_38420 ) ) ( not ( = ?auto_38419 ?auto_38421 ) ) ( not ( = ?auto_38419 ?auto_38420 ) ) ( not ( = ?auto_38422 ?auto_38421 ) ) ( not ( = ?auto_38422 ?auto_38420 ) ) ( not ( = ?auto_38421 ?auto_38420 ) ) ( ON ?auto_38421 ?auto_38422 ) ( CLEAR ?auto_38421 ) ( HOLDING ?auto_38420 ) ( CLEAR ?auto_38423 ) ( ON-TABLE ?auto_38423 ) ( not ( = ?auto_38423 ?auto_38420 ) ) ( not ( = ?auto_38418 ?auto_38423 ) ) ( not ( = ?auto_38419 ?auto_38423 ) ) ( not ( = ?auto_38422 ?auto_38423 ) ) ( not ( = ?auto_38421 ?auto_38423 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38423 ?auto_38420 )
      ( MAKE-2PILE ?auto_38418 ?auto_38419 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38424 - BLOCK
      ?auto_38425 - BLOCK
    )
    :vars
    (
      ?auto_38429 - BLOCK
      ?auto_38428 - BLOCK
      ?auto_38427 - BLOCK
      ?auto_38426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38429 ?auto_38425 ) ( ON-TABLE ?auto_38424 ) ( ON ?auto_38425 ?auto_38424 ) ( not ( = ?auto_38424 ?auto_38425 ) ) ( not ( = ?auto_38424 ?auto_38429 ) ) ( not ( = ?auto_38425 ?auto_38429 ) ) ( not ( = ?auto_38424 ?auto_38428 ) ) ( not ( = ?auto_38424 ?auto_38427 ) ) ( not ( = ?auto_38425 ?auto_38428 ) ) ( not ( = ?auto_38425 ?auto_38427 ) ) ( not ( = ?auto_38429 ?auto_38428 ) ) ( not ( = ?auto_38429 ?auto_38427 ) ) ( not ( = ?auto_38428 ?auto_38427 ) ) ( ON ?auto_38428 ?auto_38429 ) ( CLEAR ?auto_38426 ) ( ON-TABLE ?auto_38426 ) ( not ( = ?auto_38426 ?auto_38427 ) ) ( not ( = ?auto_38424 ?auto_38426 ) ) ( not ( = ?auto_38425 ?auto_38426 ) ) ( not ( = ?auto_38429 ?auto_38426 ) ) ( not ( = ?auto_38428 ?auto_38426 ) ) ( ON ?auto_38427 ?auto_38428 ) ( CLEAR ?auto_38427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38424 ?auto_38425 ?auto_38429 ?auto_38428 )
      ( MAKE-2PILE ?auto_38424 ?auto_38425 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38430 - BLOCK
      ?auto_38431 - BLOCK
    )
    :vars
    (
      ?auto_38432 - BLOCK
      ?auto_38434 - BLOCK
      ?auto_38433 - BLOCK
      ?auto_38435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38432 ?auto_38431 ) ( ON-TABLE ?auto_38430 ) ( ON ?auto_38431 ?auto_38430 ) ( not ( = ?auto_38430 ?auto_38431 ) ) ( not ( = ?auto_38430 ?auto_38432 ) ) ( not ( = ?auto_38431 ?auto_38432 ) ) ( not ( = ?auto_38430 ?auto_38434 ) ) ( not ( = ?auto_38430 ?auto_38433 ) ) ( not ( = ?auto_38431 ?auto_38434 ) ) ( not ( = ?auto_38431 ?auto_38433 ) ) ( not ( = ?auto_38432 ?auto_38434 ) ) ( not ( = ?auto_38432 ?auto_38433 ) ) ( not ( = ?auto_38434 ?auto_38433 ) ) ( ON ?auto_38434 ?auto_38432 ) ( not ( = ?auto_38435 ?auto_38433 ) ) ( not ( = ?auto_38430 ?auto_38435 ) ) ( not ( = ?auto_38431 ?auto_38435 ) ) ( not ( = ?auto_38432 ?auto_38435 ) ) ( not ( = ?auto_38434 ?auto_38435 ) ) ( ON ?auto_38433 ?auto_38434 ) ( CLEAR ?auto_38433 ) ( HOLDING ?auto_38435 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38435 )
      ( MAKE-2PILE ?auto_38430 ?auto_38431 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38436 - BLOCK
      ?auto_38437 - BLOCK
    )
    :vars
    (
      ?auto_38438 - BLOCK
      ?auto_38441 - BLOCK
      ?auto_38440 - BLOCK
      ?auto_38439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38438 ?auto_38437 ) ( ON-TABLE ?auto_38436 ) ( ON ?auto_38437 ?auto_38436 ) ( not ( = ?auto_38436 ?auto_38437 ) ) ( not ( = ?auto_38436 ?auto_38438 ) ) ( not ( = ?auto_38437 ?auto_38438 ) ) ( not ( = ?auto_38436 ?auto_38441 ) ) ( not ( = ?auto_38436 ?auto_38440 ) ) ( not ( = ?auto_38437 ?auto_38441 ) ) ( not ( = ?auto_38437 ?auto_38440 ) ) ( not ( = ?auto_38438 ?auto_38441 ) ) ( not ( = ?auto_38438 ?auto_38440 ) ) ( not ( = ?auto_38441 ?auto_38440 ) ) ( ON ?auto_38441 ?auto_38438 ) ( not ( = ?auto_38439 ?auto_38440 ) ) ( not ( = ?auto_38436 ?auto_38439 ) ) ( not ( = ?auto_38437 ?auto_38439 ) ) ( not ( = ?auto_38438 ?auto_38439 ) ) ( not ( = ?auto_38441 ?auto_38439 ) ) ( ON ?auto_38440 ?auto_38441 ) ( ON ?auto_38439 ?auto_38440 ) ( CLEAR ?auto_38439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38436 ?auto_38437 ?auto_38438 ?auto_38441 ?auto_38440 )
      ( MAKE-2PILE ?auto_38436 ?auto_38437 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38446 - BLOCK
      ?auto_38447 - BLOCK
      ?auto_38448 - BLOCK
      ?auto_38449 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_38449 ) ( CLEAR ?auto_38448 ) ( ON-TABLE ?auto_38446 ) ( ON ?auto_38447 ?auto_38446 ) ( ON ?auto_38448 ?auto_38447 ) ( not ( = ?auto_38446 ?auto_38447 ) ) ( not ( = ?auto_38446 ?auto_38448 ) ) ( not ( = ?auto_38446 ?auto_38449 ) ) ( not ( = ?auto_38447 ?auto_38448 ) ) ( not ( = ?auto_38447 ?auto_38449 ) ) ( not ( = ?auto_38448 ?auto_38449 ) ) )
    :subtasks
    ( ( !STACK ?auto_38449 ?auto_38448 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38450 - BLOCK
      ?auto_38451 - BLOCK
      ?auto_38452 - BLOCK
      ?auto_38453 - BLOCK
    )
    :vars
    (
      ?auto_38454 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_38452 ) ( ON-TABLE ?auto_38450 ) ( ON ?auto_38451 ?auto_38450 ) ( ON ?auto_38452 ?auto_38451 ) ( not ( = ?auto_38450 ?auto_38451 ) ) ( not ( = ?auto_38450 ?auto_38452 ) ) ( not ( = ?auto_38450 ?auto_38453 ) ) ( not ( = ?auto_38451 ?auto_38452 ) ) ( not ( = ?auto_38451 ?auto_38453 ) ) ( not ( = ?auto_38452 ?auto_38453 ) ) ( ON ?auto_38453 ?auto_38454 ) ( CLEAR ?auto_38453 ) ( HAND-EMPTY ) ( not ( = ?auto_38450 ?auto_38454 ) ) ( not ( = ?auto_38451 ?auto_38454 ) ) ( not ( = ?auto_38452 ?auto_38454 ) ) ( not ( = ?auto_38453 ?auto_38454 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38453 ?auto_38454 )
      ( MAKE-4PILE ?auto_38450 ?auto_38451 ?auto_38452 ?auto_38453 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38455 - BLOCK
      ?auto_38456 - BLOCK
      ?auto_38457 - BLOCK
      ?auto_38458 - BLOCK
    )
    :vars
    (
      ?auto_38459 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38455 ) ( ON ?auto_38456 ?auto_38455 ) ( not ( = ?auto_38455 ?auto_38456 ) ) ( not ( = ?auto_38455 ?auto_38457 ) ) ( not ( = ?auto_38455 ?auto_38458 ) ) ( not ( = ?auto_38456 ?auto_38457 ) ) ( not ( = ?auto_38456 ?auto_38458 ) ) ( not ( = ?auto_38457 ?auto_38458 ) ) ( ON ?auto_38458 ?auto_38459 ) ( CLEAR ?auto_38458 ) ( not ( = ?auto_38455 ?auto_38459 ) ) ( not ( = ?auto_38456 ?auto_38459 ) ) ( not ( = ?auto_38457 ?auto_38459 ) ) ( not ( = ?auto_38458 ?auto_38459 ) ) ( HOLDING ?auto_38457 ) ( CLEAR ?auto_38456 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38455 ?auto_38456 ?auto_38457 )
      ( MAKE-4PILE ?auto_38455 ?auto_38456 ?auto_38457 ?auto_38458 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38460 - BLOCK
      ?auto_38461 - BLOCK
      ?auto_38462 - BLOCK
      ?auto_38463 - BLOCK
    )
    :vars
    (
      ?auto_38464 - BLOCK
      ?auto_38465 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38460 ) ( ON ?auto_38461 ?auto_38460 ) ( not ( = ?auto_38460 ?auto_38461 ) ) ( not ( = ?auto_38460 ?auto_38462 ) ) ( not ( = ?auto_38460 ?auto_38463 ) ) ( not ( = ?auto_38461 ?auto_38462 ) ) ( not ( = ?auto_38461 ?auto_38463 ) ) ( not ( = ?auto_38462 ?auto_38463 ) ) ( ON ?auto_38463 ?auto_38464 ) ( not ( = ?auto_38460 ?auto_38464 ) ) ( not ( = ?auto_38461 ?auto_38464 ) ) ( not ( = ?auto_38462 ?auto_38464 ) ) ( not ( = ?auto_38463 ?auto_38464 ) ) ( CLEAR ?auto_38461 ) ( ON ?auto_38462 ?auto_38463 ) ( CLEAR ?auto_38462 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38465 ) ( ON ?auto_38464 ?auto_38465 ) ( not ( = ?auto_38465 ?auto_38464 ) ) ( not ( = ?auto_38465 ?auto_38463 ) ) ( not ( = ?auto_38465 ?auto_38462 ) ) ( not ( = ?auto_38460 ?auto_38465 ) ) ( not ( = ?auto_38461 ?auto_38465 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38465 ?auto_38464 ?auto_38463 )
      ( MAKE-4PILE ?auto_38460 ?auto_38461 ?auto_38462 ?auto_38463 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38466 - BLOCK
      ?auto_38467 - BLOCK
      ?auto_38468 - BLOCK
      ?auto_38469 - BLOCK
    )
    :vars
    (
      ?auto_38471 - BLOCK
      ?auto_38470 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38466 ) ( not ( = ?auto_38466 ?auto_38467 ) ) ( not ( = ?auto_38466 ?auto_38468 ) ) ( not ( = ?auto_38466 ?auto_38469 ) ) ( not ( = ?auto_38467 ?auto_38468 ) ) ( not ( = ?auto_38467 ?auto_38469 ) ) ( not ( = ?auto_38468 ?auto_38469 ) ) ( ON ?auto_38469 ?auto_38471 ) ( not ( = ?auto_38466 ?auto_38471 ) ) ( not ( = ?auto_38467 ?auto_38471 ) ) ( not ( = ?auto_38468 ?auto_38471 ) ) ( not ( = ?auto_38469 ?auto_38471 ) ) ( ON ?auto_38468 ?auto_38469 ) ( CLEAR ?auto_38468 ) ( ON-TABLE ?auto_38470 ) ( ON ?auto_38471 ?auto_38470 ) ( not ( = ?auto_38470 ?auto_38471 ) ) ( not ( = ?auto_38470 ?auto_38469 ) ) ( not ( = ?auto_38470 ?auto_38468 ) ) ( not ( = ?auto_38466 ?auto_38470 ) ) ( not ( = ?auto_38467 ?auto_38470 ) ) ( HOLDING ?auto_38467 ) ( CLEAR ?auto_38466 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38466 ?auto_38467 )
      ( MAKE-4PILE ?auto_38466 ?auto_38467 ?auto_38468 ?auto_38469 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38472 - BLOCK
      ?auto_38473 - BLOCK
      ?auto_38474 - BLOCK
      ?auto_38475 - BLOCK
    )
    :vars
    (
      ?auto_38477 - BLOCK
      ?auto_38476 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38472 ) ( not ( = ?auto_38472 ?auto_38473 ) ) ( not ( = ?auto_38472 ?auto_38474 ) ) ( not ( = ?auto_38472 ?auto_38475 ) ) ( not ( = ?auto_38473 ?auto_38474 ) ) ( not ( = ?auto_38473 ?auto_38475 ) ) ( not ( = ?auto_38474 ?auto_38475 ) ) ( ON ?auto_38475 ?auto_38477 ) ( not ( = ?auto_38472 ?auto_38477 ) ) ( not ( = ?auto_38473 ?auto_38477 ) ) ( not ( = ?auto_38474 ?auto_38477 ) ) ( not ( = ?auto_38475 ?auto_38477 ) ) ( ON ?auto_38474 ?auto_38475 ) ( ON-TABLE ?auto_38476 ) ( ON ?auto_38477 ?auto_38476 ) ( not ( = ?auto_38476 ?auto_38477 ) ) ( not ( = ?auto_38476 ?auto_38475 ) ) ( not ( = ?auto_38476 ?auto_38474 ) ) ( not ( = ?auto_38472 ?auto_38476 ) ) ( not ( = ?auto_38473 ?auto_38476 ) ) ( CLEAR ?auto_38472 ) ( ON ?auto_38473 ?auto_38474 ) ( CLEAR ?auto_38473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38476 ?auto_38477 ?auto_38475 ?auto_38474 )
      ( MAKE-4PILE ?auto_38472 ?auto_38473 ?auto_38474 ?auto_38475 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38478 - BLOCK
      ?auto_38479 - BLOCK
      ?auto_38480 - BLOCK
      ?auto_38481 - BLOCK
    )
    :vars
    (
      ?auto_38482 - BLOCK
      ?auto_38483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38478 ?auto_38479 ) ) ( not ( = ?auto_38478 ?auto_38480 ) ) ( not ( = ?auto_38478 ?auto_38481 ) ) ( not ( = ?auto_38479 ?auto_38480 ) ) ( not ( = ?auto_38479 ?auto_38481 ) ) ( not ( = ?auto_38480 ?auto_38481 ) ) ( ON ?auto_38481 ?auto_38482 ) ( not ( = ?auto_38478 ?auto_38482 ) ) ( not ( = ?auto_38479 ?auto_38482 ) ) ( not ( = ?auto_38480 ?auto_38482 ) ) ( not ( = ?auto_38481 ?auto_38482 ) ) ( ON ?auto_38480 ?auto_38481 ) ( ON-TABLE ?auto_38483 ) ( ON ?auto_38482 ?auto_38483 ) ( not ( = ?auto_38483 ?auto_38482 ) ) ( not ( = ?auto_38483 ?auto_38481 ) ) ( not ( = ?auto_38483 ?auto_38480 ) ) ( not ( = ?auto_38478 ?auto_38483 ) ) ( not ( = ?auto_38479 ?auto_38483 ) ) ( ON ?auto_38479 ?auto_38480 ) ( CLEAR ?auto_38479 ) ( HOLDING ?auto_38478 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38478 )
      ( MAKE-4PILE ?auto_38478 ?auto_38479 ?auto_38480 ?auto_38481 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38484 - BLOCK
      ?auto_38485 - BLOCK
      ?auto_38486 - BLOCK
      ?auto_38487 - BLOCK
    )
    :vars
    (
      ?auto_38489 - BLOCK
      ?auto_38488 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38484 ?auto_38485 ) ) ( not ( = ?auto_38484 ?auto_38486 ) ) ( not ( = ?auto_38484 ?auto_38487 ) ) ( not ( = ?auto_38485 ?auto_38486 ) ) ( not ( = ?auto_38485 ?auto_38487 ) ) ( not ( = ?auto_38486 ?auto_38487 ) ) ( ON ?auto_38487 ?auto_38489 ) ( not ( = ?auto_38484 ?auto_38489 ) ) ( not ( = ?auto_38485 ?auto_38489 ) ) ( not ( = ?auto_38486 ?auto_38489 ) ) ( not ( = ?auto_38487 ?auto_38489 ) ) ( ON ?auto_38486 ?auto_38487 ) ( ON-TABLE ?auto_38488 ) ( ON ?auto_38489 ?auto_38488 ) ( not ( = ?auto_38488 ?auto_38489 ) ) ( not ( = ?auto_38488 ?auto_38487 ) ) ( not ( = ?auto_38488 ?auto_38486 ) ) ( not ( = ?auto_38484 ?auto_38488 ) ) ( not ( = ?auto_38485 ?auto_38488 ) ) ( ON ?auto_38485 ?auto_38486 ) ( ON ?auto_38484 ?auto_38485 ) ( CLEAR ?auto_38484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38488 ?auto_38489 ?auto_38487 ?auto_38486 ?auto_38485 )
      ( MAKE-4PILE ?auto_38484 ?auto_38485 ?auto_38486 ?auto_38487 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38491 - BLOCK
    )
    :vars
    (
      ?auto_38492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38492 ?auto_38491 ) ( CLEAR ?auto_38492 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38491 ) ( not ( = ?auto_38491 ?auto_38492 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38492 ?auto_38491 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38493 - BLOCK
    )
    :vars
    (
      ?auto_38494 - BLOCK
      ?auto_38495 - BLOCK
      ?auto_38496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38494 ?auto_38493 ) ( CLEAR ?auto_38494 ) ( ON-TABLE ?auto_38493 ) ( not ( = ?auto_38493 ?auto_38494 ) ) ( HOLDING ?auto_38495 ) ( CLEAR ?auto_38496 ) ( not ( = ?auto_38493 ?auto_38495 ) ) ( not ( = ?auto_38493 ?auto_38496 ) ) ( not ( = ?auto_38494 ?auto_38495 ) ) ( not ( = ?auto_38494 ?auto_38496 ) ) ( not ( = ?auto_38495 ?auto_38496 ) ) )
    :subtasks
    ( ( !STACK ?auto_38495 ?auto_38496 )
      ( MAKE-1PILE ?auto_38493 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38497 - BLOCK
    )
    :vars
    (
      ?auto_38499 - BLOCK
      ?auto_38500 - BLOCK
      ?auto_38498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38499 ?auto_38497 ) ( ON-TABLE ?auto_38497 ) ( not ( = ?auto_38497 ?auto_38499 ) ) ( CLEAR ?auto_38500 ) ( not ( = ?auto_38497 ?auto_38498 ) ) ( not ( = ?auto_38497 ?auto_38500 ) ) ( not ( = ?auto_38499 ?auto_38498 ) ) ( not ( = ?auto_38499 ?auto_38500 ) ) ( not ( = ?auto_38498 ?auto_38500 ) ) ( ON ?auto_38498 ?auto_38499 ) ( CLEAR ?auto_38498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38497 ?auto_38499 )
      ( MAKE-1PILE ?auto_38497 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38501 - BLOCK
    )
    :vars
    (
      ?auto_38503 - BLOCK
      ?auto_38502 - BLOCK
      ?auto_38504 - BLOCK
      ?auto_38505 - BLOCK
      ?auto_38506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38503 ?auto_38501 ) ( ON-TABLE ?auto_38501 ) ( not ( = ?auto_38501 ?auto_38503 ) ) ( not ( = ?auto_38501 ?auto_38502 ) ) ( not ( = ?auto_38501 ?auto_38504 ) ) ( not ( = ?auto_38503 ?auto_38502 ) ) ( not ( = ?auto_38503 ?auto_38504 ) ) ( not ( = ?auto_38502 ?auto_38504 ) ) ( ON ?auto_38502 ?auto_38503 ) ( CLEAR ?auto_38502 ) ( HOLDING ?auto_38504 ) ( CLEAR ?auto_38505 ) ( ON-TABLE ?auto_38506 ) ( ON ?auto_38505 ?auto_38506 ) ( not ( = ?auto_38506 ?auto_38505 ) ) ( not ( = ?auto_38506 ?auto_38504 ) ) ( not ( = ?auto_38505 ?auto_38504 ) ) ( not ( = ?auto_38501 ?auto_38505 ) ) ( not ( = ?auto_38501 ?auto_38506 ) ) ( not ( = ?auto_38503 ?auto_38505 ) ) ( not ( = ?auto_38503 ?auto_38506 ) ) ( not ( = ?auto_38502 ?auto_38505 ) ) ( not ( = ?auto_38502 ?auto_38506 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38506 ?auto_38505 ?auto_38504 )
      ( MAKE-1PILE ?auto_38501 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38507 - BLOCK
    )
    :vars
    (
      ?auto_38512 - BLOCK
      ?auto_38509 - BLOCK
      ?auto_38508 - BLOCK
      ?auto_38511 - BLOCK
      ?auto_38510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38512 ?auto_38507 ) ( ON-TABLE ?auto_38507 ) ( not ( = ?auto_38507 ?auto_38512 ) ) ( not ( = ?auto_38507 ?auto_38509 ) ) ( not ( = ?auto_38507 ?auto_38508 ) ) ( not ( = ?auto_38512 ?auto_38509 ) ) ( not ( = ?auto_38512 ?auto_38508 ) ) ( not ( = ?auto_38509 ?auto_38508 ) ) ( ON ?auto_38509 ?auto_38512 ) ( CLEAR ?auto_38511 ) ( ON-TABLE ?auto_38510 ) ( ON ?auto_38511 ?auto_38510 ) ( not ( = ?auto_38510 ?auto_38511 ) ) ( not ( = ?auto_38510 ?auto_38508 ) ) ( not ( = ?auto_38511 ?auto_38508 ) ) ( not ( = ?auto_38507 ?auto_38511 ) ) ( not ( = ?auto_38507 ?auto_38510 ) ) ( not ( = ?auto_38512 ?auto_38511 ) ) ( not ( = ?auto_38512 ?auto_38510 ) ) ( not ( = ?auto_38509 ?auto_38511 ) ) ( not ( = ?auto_38509 ?auto_38510 ) ) ( ON ?auto_38508 ?auto_38509 ) ( CLEAR ?auto_38508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38507 ?auto_38512 ?auto_38509 )
      ( MAKE-1PILE ?auto_38507 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38513 - BLOCK
    )
    :vars
    (
      ?auto_38518 - BLOCK
      ?auto_38516 - BLOCK
      ?auto_38515 - BLOCK
      ?auto_38514 - BLOCK
      ?auto_38517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38518 ?auto_38513 ) ( ON-TABLE ?auto_38513 ) ( not ( = ?auto_38513 ?auto_38518 ) ) ( not ( = ?auto_38513 ?auto_38516 ) ) ( not ( = ?auto_38513 ?auto_38515 ) ) ( not ( = ?auto_38518 ?auto_38516 ) ) ( not ( = ?auto_38518 ?auto_38515 ) ) ( not ( = ?auto_38516 ?auto_38515 ) ) ( ON ?auto_38516 ?auto_38518 ) ( ON-TABLE ?auto_38514 ) ( not ( = ?auto_38514 ?auto_38517 ) ) ( not ( = ?auto_38514 ?auto_38515 ) ) ( not ( = ?auto_38517 ?auto_38515 ) ) ( not ( = ?auto_38513 ?auto_38517 ) ) ( not ( = ?auto_38513 ?auto_38514 ) ) ( not ( = ?auto_38518 ?auto_38517 ) ) ( not ( = ?auto_38518 ?auto_38514 ) ) ( not ( = ?auto_38516 ?auto_38517 ) ) ( not ( = ?auto_38516 ?auto_38514 ) ) ( ON ?auto_38515 ?auto_38516 ) ( CLEAR ?auto_38515 ) ( HOLDING ?auto_38517 ) ( CLEAR ?auto_38514 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38514 ?auto_38517 )
      ( MAKE-1PILE ?auto_38513 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38519 - BLOCK
    )
    :vars
    (
      ?auto_38523 - BLOCK
      ?auto_38520 - BLOCK
      ?auto_38524 - BLOCK
      ?auto_38521 - BLOCK
      ?auto_38522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38523 ?auto_38519 ) ( ON-TABLE ?auto_38519 ) ( not ( = ?auto_38519 ?auto_38523 ) ) ( not ( = ?auto_38519 ?auto_38520 ) ) ( not ( = ?auto_38519 ?auto_38524 ) ) ( not ( = ?auto_38523 ?auto_38520 ) ) ( not ( = ?auto_38523 ?auto_38524 ) ) ( not ( = ?auto_38520 ?auto_38524 ) ) ( ON ?auto_38520 ?auto_38523 ) ( ON-TABLE ?auto_38521 ) ( not ( = ?auto_38521 ?auto_38522 ) ) ( not ( = ?auto_38521 ?auto_38524 ) ) ( not ( = ?auto_38522 ?auto_38524 ) ) ( not ( = ?auto_38519 ?auto_38522 ) ) ( not ( = ?auto_38519 ?auto_38521 ) ) ( not ( = ?auto_38523 ?auto_38522 ) ) ( not ( = ?auto_38523 ?auto_38521 ) ) ( not ( = ?auto_38520 ?auto_38522 ) ) ( not ( = ?auto_38520 ?auto_38521 ) ) ( ON ?auto_38524 ?auto_38520 ) ( CLEAR ?auto_38521 ) ( ON ?auto_38522 ?auto_38524 ) ( CLEAR ?auto_38522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38519 ?auto_38523 ?auto_38520 ?auto_38524 )
      ( MAKE-1PILE ?auto_38519 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38525 - BLOCK
    )
    :vars
    (
      ?auto_38528 - BLOCK
      ?auto_38530 - BLOCK
      ?auto_38527 - BLOCK
      ?auto_38529 - BLOCK
      ?auto_38526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38528 ?auto_38525 ) ( ON-TABLE ?auto_38525 ) ( not ( = ?auto_38525 ?auto_38528 ) ) ( not ( = ?auto_38525 ?auto_38530 ) ) ( not ( = ?auto_38525 ?auto_38527 ) ) ( not ( = ?auto_38528 ?auto_38530 ) ) ( not ( = ?auto_38528 ?auto_38527 ) ) ( not ( = ?auto_38530 ?auto_38527 ) ) ( ON ?auto_38530 ?auto_38528 ) ( not ( = ?auto_38529 ?auto_38526 ) ) ( not ( = ?auto_38529 ?auto_38527 ) ) ( not ( = ?auto_38526 ?auto_38527 ) ) ( not ( = ?auto_38525 ?auto_38526 ) ) ( not ( = ?auto_38525 ?auto_38529 ) ) ( not ( = ?auto_38528 ?auto_38526 ) ) ( not ( = ?auto_38528 ?auto_38529 ) ) ( not ( = ?auto_38530 ?auto_38526 ) ) ( not ( = ?auto_38530 ?auto_38529 ) ) ( ON ?auto_38527 ?auto_38530 ) ( ON ?auto_38526 ?auto_38527 ) ( CLEAR ?auto_38526 ) ( HOLDING ?auto_38529 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38529 )
      ( MAKE-1PILE ?auto_38525 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38531 - BLOCK
    )
    :vars
    (
      ?auto_38533 - BLOCK
      ?auto_38535 - BLOCK
      ?auto_38534 - BLOCK
      ?auto_38536 - BLOCK
      ?auto_38532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38533 ?auto_38531 ) ( ON-TABLE ?auto_38531 ) ( not ( = ?auto_38531 ?auto_38533 ) ) ( not ( = ?auto_38531 ?auto_38535 ) ) ( not ( = ?auto_38531 ?auto_38534 ) ) ( not ( = ?auto_38533 ?auto_38535 ) ) ( not ( = ?auto_38533 ?auto_38534 ) ) ( not ( = ?auto_38535 ?auto_38534 ) ) ( ON ?auto_38535 ?auto_38533 ) ( not ( = ?auto_38536 ?auto_38532 ) ) ( not ( = ?auto_38536 ?auto_38534 ) ) ( not ( = ?auto_38532 ?auto_38534 ) ) ( not ( = ?auto_38531 ?auto_38532 ) ) ( not ( = ?auto_38531 ?auto_38536 ) ) ( not ( = ?auto_38533 ?auto_38532 ) ) ( not ( = ?auto_38533 ?auto_38536 ) ) ( not ( = ?auto_38535 ?auto_38532 ) ) ( not ( = ?auto_38535 ?auto_38536 ) ) ( ON ?auto_38534 ?auto_38535 ) ( ON ?auto_38532 ?auto_38534 ) ( ON ?auto_38536 ?auto_38532 ) ( CLEAR ?auto_38536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38531 ?auto_38533 ?auto_38535 ?auto_38534 ?auto_38532 )
      ( MAKE-1PILE ?auto_38531 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38542 - BLOCK
      ?auto_38543 - BLOCK
      ?auto_38544 - BLOCK
      ?auto_38545 - BLOCK
      ?auto_38546 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_38546 ) ( CLEAR ?auto_38545 ) ( ON-TABLE ?auto_38542 ) ( ON ?auto_38543 ?auto_38542 ) ( ON ?auto_38544 ?auto_38543 ) ( ON ?auto_38545 ?auto_38544 ) ( not ( = ?auto_38542 ?auto_38543 ) ) ( not ( = ?auto_38542 ?auto_38544 ) ) ( not ( = ?auto_38542 ?auto_38545 ) ) ( not ( = ?auto_38542 ?auto_38546 ) ) ( not ( = ?auto_38543 ?auto_38544 ) ) ( not ( = ?auto_38543 ?auto_38545 ) ) ( not ( = ?auto_38543 ?auto_38546 ) ) ( not ( = ?auto_38544 ?auto_38545 ) ) ( not ( = ?auto_38544 ?auto_38546 ) ) ( not ( = ?auto_38545 ?auto_38546 ) ) )
    :subtasks
    ( ( !STACK ?auto_38546 ?auto_38545 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38547 - BLOCK
      ?auto_38548 - BLOCK
      ?auto_38549 - BLOCK
      ?auto_38550 - BLOCK
      ?auto_38551 - BLOCK
    )
    :vars
    (
      ?auto_38552 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_38550 ) ( ON-TABLE ?auto_38547 ) ( ON ?auto_38548 ?auto_38547 ) ( ON ?auto_38549 ?auto_38548 ) ( ON ?auto_38550 ?auto_38549 ) ( not ( = ?auto_38547 ?auto_38548 ) ) ( not ( = ?auto_38547 ?auto_38549 ) ) ( not ( = ?auto_38547 ?auto_38550 ) ) ( not ( = ?auto_38547 ?auto_38551 ) ) ( not ( = ?auto_38548 ?auto_38549 ) ) ( not ( = ?auto_38548 ?auto_38550 ) ) ( not ( = ?auto_38548 ?auto_38551 ) ) ( not ( = ?auto_38549 ?auto_38550 ) ) ( not ( = ?auto_38549 ?auto_38551 ) ) ( not ( = ?auto_38550 ?auto_38551 ) ) ( ON ?auto_38551 ?auto_38552 ) ( CLEAR ?auto_38551 ) ( HAND-EMPTY ) ( not ( = ?auto_38547 ?auto_38552 ) ) ( not ( = ?auto_38548 ?auto_38552 ) ) ( not ( = ?auto_38549 ?auto_38552 ) ) ( not ( = ?auto_38550 ?auto_38552 ) ) ( not ( = ?auto_38551 ?auto_38552 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38551 ?auto_38552 )
      ( MAKE-5PILE ?auto_38547 ?auto_38548 ?auto_38549 ?auto_38550 ?auto_38551 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38553 - BLOCK
      ?auto_38554 - BLOCK
      ?auto_38555 - BLOCK
      ?auto_38556 - BLOCK
      ?auto_38557 - BLOCK
    )
    :vars
    (
      ?auto_38558 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38553 ) ( ON ?auto_38554 ?auto_38553 ) ( ON ?auto_38555 ?auto_38554 ) ( not ( = ?auto_38553 ?auto_38554 ) ) ( not ( = ?auto_38553 ?auto_38555 ) ) ( not ( = ?auto_38553 ?auto_38556 ) ) ( not ( = ?auto_38553 ?auto_38557 ) ) ( not ( = ?auto_38554 ?auto_38555 ) ) ( not ( = ?auto_38554 ?auto_38556 ) ) ( not ( = ?auto_38554 ?auto_38557 ) ) ( not ( = ?auto_38555 ?auto_38556 ) ) ( not ( = ?auto_38555 ?auto_38557 ) ) ( not ( = ?auto_38556 ?auto_38557 ) ) ( ON ?auto_38557 ?auto_38558 ) ( CLEAR ?auto_38557 ) ( not ( = ?auto_38553 ?auto_38558 ) ) ( not ( = ?auto_38554 ?auto_38558 ) ) ( not ( = ?auto_38555 ?auto_38558 ) ) ( not ( = ?auto_38556 ?auto_38558 ) ) ( not ( = ?auto_38557 ?auto_38558 ) ) ( HOLDING ?auto_38556 ) ( CLEAR ?auto_38555 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38553 ?auto_38554 ?auto_38555 ?auto_38556 )
      ( MAKE-5PILE ?auto_38553 ?auto_38554 ?auto_38555 ?auto_38556 ?auto_38557 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38559 - BLOCK
      ?auto_38560 - BLOCK
      ?auto_38561 - BLOCK
      ?auto_38562 - BLOCK
      ?auto_38563 - BLOCK
    )
    :vars
    (
      ?auto_38564 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38559 ) ( ON ?auto_38560 ?auto_38559 ) ( ON ?auto_38561 ?auto_38560 ) ( not ( = ?auto_38559 ?auto_38560 ) ) ( not ( = ?auto_38559 ?auto_38561 ) ) ( not ( = ?auto_38559 ?auto_38562 ) ) ( not ( = ?auto_38559 ?auto_38563 ) ) ( not ( = ?auto_38560 ?auto_38561 ) ) ( not ( = ?auto_38560 ?auto_38562 ) ) ( not ( = ?auto_38560 ?auto_38563 ) ) ( not ( = ?auto_38561 ?auto_38562 ) ) ( not ( = ?auto_38561 ?auto_38563 ) ) ( not ( = ?auto_38562 ?auto_38563 ) ) ( ON ?auto_38563 ?auto_38564 ) ( not ( = ?auto_38559 ?auto_38564 ) ) ( not ( = ?auto_38560 ?auto_38564 ) ) ( not ( = ?auto_38561 ?auto_38564 ) ) ( not ( = ?auto_38562 ?auto_38564 ) ) ( not ( = ?auto_38563 ?auto_38564 ) ) ( CLEAR ?auto_38561 ) ( ON ?auto_38562 ?auto_38563 ) ( CLEAR ?auto_38562 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38564 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38564 ?auto_38563 )
      ( MAKE-5PILE ?auto_38559 ?auto_38560 ?auto_38561 ?auto_38562 ?auto_38563 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38565 - BLOCK
      ?auto_38566 - BLOCK
      ?auto_38567 - BLOCK
      ?auto_38568 - BLOCK
      ?auto_38569 - BLOCK
    )
    :vars
    (
      ?auto_38570 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38565 ) ( ON ?auto_38566 ?auto_38565 ) ( not ( = ?auto_38565 ?auto_38566 ) ) ( not ( = ?auto_38565 ?auto_38567 ) ) ( not ( = ?auto_38565 ?auto_38568 ) ) ( not ( = ?auto_38565 ?auto_38569 ) ) ( not ( = ?auto_38566 ?auto_38567 ) ) ( not ( = ?auto_38566 ?auto_38568 ) ) ( not ( = ?auto_38566 ?auto_38569 ) ) ( not ( = ?auto_38567 ?auto_38568 ) ) ( not ( = ?auto_38567 ?auto_38569 ) ) ( not ( = ?auto_38568 ?auto_38569 ) ) ( ON ?auto_38569 ?auto_38570 ) ( not ( = ?auto_38565 ?auto_38570 ) ) ( not ( = ?auto_38566 ?auto_38570 ) ) ( not ( = ?auto_38567 ?auto_38570 ) ) ( not ( = ?auto_38568 ?auto_38570 ) ) ( not ( = ?auto_38569 ?auto_38570 ) ) ( ON ?auto_38568 ?auto_38569 ) ( CLEAR ?auto_38568 ) ( ON-TABLE ?auto_38570 ) ( HOLDING ?auto_38567 ) ( CLEAR ?auto_38566 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38565 ?auto_38566 ?auto_38567 )
      ( MAKE-5PILE ?auto_38565 ?auto_38566 ?auto_38567 ?auto_38568 ?auto_38569 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38571 - BLOCK
      ?auto_38572 - BLOCK
      ?auto_38573 - BLOCK
      ?auto_38574 - BLOCK
      ?auto_38575 - BLOCK
    )
    :vars
    (
      ?auto_38576 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38571 ) ( ON ?auto_38572 ?auto_38571 ) ( not ( = ?auto_38571 ?auto_38572 ) ) ( not ( = ?auto_38571 ?auto_38573 ) ) ( not ( = ?auto_38571 ?auto_38574 ) ) ( not ( = ?auto_38571 ?auto_38575 ) ) ( not ( = ?auto_38572 ?auto_38573 ) ) ( not ( = ?auto_38572 ?auto_38574 ) ) ( not ( = ?auto_38572 ?auto_38575 ) ) ( not ( = ?auto_38573 ?auto_38574 ) ) ( not ( = ?auto_38573 ?auto_38575 ) ) ( not ( = ?auto_38574 ?auto_38575 ) ) ( ON ?auto_38575 ?auto_38576 ) ( not ( = ?auto_38571 ?auto_38576 ) ) ( not ( = ?auto_38572 ?auto_38576 ) ) ( not ( = ?auto_38573 ?auto_38576 ) ) ( not ( = ?auto_38574 ?auto_38576 ) ) ( not ( = ?auto_38575 ?auto_38576 ) ) ( ON ?auto_38574 ?auto_38575 ) ( ON-TABLE ?auto_38576 ) ( CLEAR ?auto_38572 ) ( ON ?auto_38573 ?auto_38574 ) ( CLEAR ?auto_38573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38576 ?auto_38575 ?auto_38574 )
      ( MAKE-5PILE ?auto_38571 ?auto_38572 ?auto_38573 ?auto_38574 ?auto_38575 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38577 - BLOCK
      ?auto_38578 - BLOCK
      ?auto_38579 - BLOCK
      ?auto_38580 - BLOCK
      ?auto_38581 - BLOCK
    )
    :vars
    (
      ?auto_38582 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38577 ) ( not ( = ?auto_38577 ?auto_38578 ) ) ( not ( = ?auto_38577 ?auto_38579 ) ) ( not ( = ?auto_38577 ?auto_38580 ) ) ( not ( = ?auto_38577 ?auto_38581 ) ) ( not ( = ?auto_38578 ?auto_38579 ) ) ( not ( = ?auto_38578 ?auto_38580 ) ) ( not ( = ?auto_38578 ?auto_38581 ) ) ( not ( = ?auto_38579 ?auto_38580 ) ) ( not ( = ?auto_38579 ?auto_38581 ) ) ( not ( = ?auto_38580 ?auto_38581 ) ) ( ON ?auto_38581 ?auto_38582 ) ( not ( = ?auto_38577 ?auto_38582 ) ) ( not ( = ?auto_38578 ?auto_38582 ) ) ( not ( = ?auto_38579 ?auto_38582 ) ) ( not ( = ?auto_38580 ?auto_38582 ) ) ( not ( = ?auto_38581 ?auto_38582 ) ) ( ON ?auto_38580 ?auto_38581 ) ( ON-TABLE ?auto_38582 ) ( ON ?auto_38579 ?auto_38580 ) ( CLEAR ?auto_38579 ) ( HOLDING ?auto_38578 ) ( CLEAR ?auto_38577 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38577 ?auto_38578 )
      ( MAKE-5PILE ?auto_38577 ?auto_38578 ?auto_38579 ?auto_38580 ?auto_38581 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38583 - BLOCK
      ?auto_38584 - BLOCK
      ?auto_38585 - BLOCK
      ?auto_38586 - BLOCK
      ?auto_38587 - BLOCK
    )
    :vars
    (
      ?auto_38588 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38583 ) ( not ( = ?auto_38583 ?auto_38584 ) ) ( not ( = ?auto_38583 ?auto_38585 ) ) ( not ( = ?auto_38583 ?auto_38586 ) ) ( not ( = ?auto_38583 ?auto_38587 ) ) ( not ( = ?auto_38584 ?auto_38585 ) ) ( not ( = ?auto_38584 ?auto_38586 ) ) ( not ( = ?auto_38584 ?auto_38587 ) ) ( not ( = ?auto_38585 ?auto_38586 ) ) ( not ( = ?auto_38585 ?auto_38587 ) ) ( not ( = ?auto_38586 ?auto_38587 ) ) ( ON ?auto_38587 ?auto_38588 ) ( not ( = ?auto_38583 ?auto_38588 ) ) ( not ( = ?auto_38584 ?auto_38588 ) ) ( not ( = ?auto_38585 ?auto_38588 ) ) ( not ( = ?auto_38586 ?auto_38588 ) ) ( not ( = ?auto_38587 ?auto_38588 ) ) ( ON ?auto_38586 ?auto_38587 ) ( ON-TABLE ?auto_38588 ) ( ON ?auto_38585 ?auto_38586 ) ( CLEAR ?auto_38583 ) ( ON ?auto_38584 ?auto_38585 ) ( CLEAR ?auto_38584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38588 ?auto_38587 ?auto_38586 ?auto_38585 )
      ( MAKE-5PILE ?auto_38583 ?auto_38584 ?auto_38585 ?auto_38586 ?auto_38587 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38589 - BLOCK
      ?auto_38590 - BLOCK
      ?auto_38591 - BLOCK
      ?auto_38592 - BLOCK
      ?auto_38593 - BLOCK
    )
    :vars
    (
      ?auto_38594 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38589 ?auto_38590 ) ) ( not ( = ?auto_38589 ?auto_38591 ) ) ( not ( = ?auto_38589 ?auto_38592 ) ) ( not ( = ?auto_38589 ?auto_38593 ) ) ( not ( = ?auto_38590 ?auto_38591 ) ) ( not ( = ?auto_38590 ?auto_38592 ) ) ( not ( = ?auto_38590 ?auto_38593 ) ) ( not ( = ?auto_38591 ?auto_38592 ) ) ( not ( = ?auto_38591 ?auto_38593 ) ) ( not ( = ?auto_38592 ?auto_38593 ) ) ( ON ?auto_38593 ?auto_38594 ) ( not ( = ?auto_38589 ?auto_38594 ) ) ( not ( = ?auto_38590 ?auto_38594 ) ) ( not ( = ?auto_38591 ?auto_38594 ) ) ( not ( = ?auto_38592 ?auto_38594 ) ) ( not ( = ?auto_38593 ?auto_38594 ) ) ( ON ?auto_38592 ?auto_38593 ) ( ON-TABLE ?auto_38594 ) ( ON ?auto_38591 ?auto_38592 ) ( ON ?auto_38590 ?auto_38591 ) ( CLEAR ?auto_38590 ) ( HOLDING ?auto_38589 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38589 )
      ( MAKE-5PILE ?auto_38589 ?auto_38590 ?auto_38591 ?auto_38592 ?auto_38593 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38595 - BLOCK
      ?auto_38596 - BLOCK
      ?auto_38597 - BLOCK
      ?auto_38598 - BLOCK
      ?auto_38599 - BLOCK
    )
    :vars
    (
      ?auto_38600 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38595 ?auto_38596 ) ) ( not ( = ?auto_38595 ?auto_38597 ) ) ( not ( = ?auto_38595 ?auto_38598 ) ) ( not ( = ?auto_38595 ?auto_38599 ) ) ( not ( = ?auto_38596 ?auto_38597 ) ) ( not ( = ?auto_38596 ?auto_38598 ) ) ( not ( = ?auto_38596 ?auto_38599 ) ) ( not ( = ?auto_38597 ?auto_38598 ) ) ( not ( = ?auto_38597 ?auto_38599 ) ) ( not ( = ?auto_38598 ?auto_38599 ) ) ( ON ?auto_38599 ?auto_38600 ) ( not ( = ?auto_38595 ?auto_38600 ) ) ( not ( = ?auto_38596 ?auto_38600 ) ) ( not ( = ?auto_38597 ?auto_38600 ) ) ( not ( = ?auto_38598 ?auto_38600 ) ) ( not ( = ?auto_38599 ?auto_38600 ) ) ( ON ?auto_38598 ?auto_38599 ) ( ON-TABLE ?auto_38600 ) ( ON ?auto_38597 ?auto_38598 ) ( ON ?auto_38596 ?auto_38597 ) ( ON ?auto_38595 ?auto_38596 ) ( CLEAR ?auto_38595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38600 ?auto_38599 ?auto_38598 ?auto_38597 ?auto_38596 )
      ( MAKE-5PILE ?auto_38595 ?auto_38596 ?auto_38597 ?auto_38598 ?auto_38599 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38605 - BLOCK
      ?auto_38606 - BLOCK
      ?auto_38607 - BLOCK
      ?auto_38608 - BLOCK
    )
    :vars
    (
      ?auto_38609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38609 ?auto_38608 ) ( CLEAR ?auto_38609 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38605 ) ( ON ?auto_38606 ?auto_38605 ) ( ON ?auto_38607 ?auto_38606 ) ( ON ?auto_38608 ?auto_38607 ) ( not ( = ?auto_38605 ?auto_38606 ) ) ( not ( = ?auto_38605 ?auto_38607 ) ) ( not ( = ?auto_38605 ?auto_38608 ) ) ( not ( = ?auto_38605 ?auto_38609 ) ) ( not ( = ?auto_38606 ?auto_38607 ) ) ( not ( = ?auto_38606 ?auto_38608 ) ) ( not ( = ?auto_38606 ?auto_38609 ) ) ( not ( = ?auto_38607 ?auto_38608 ) ) ( not ( = ?auto_38607 ?auto_38609 ) ) ( not ( = ?auto_38608 ?auto_38609 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38609 ?auto_38608 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38621 - BLOCK
      ?auto_38622 - BLOCK
      ?auto_38623 - BLOCK
      ?auto_38624 - BLOCK
    )
    :vars
    (
      ?auto_38625 - BLOCK
      ?auto_38626 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38621 ) ( ON ?auto_38622 ?auto_38621 ) ( ON ?auto_38623 ?auto_38622 ) ( not ( = ?auto_38621 ?auto_38622 ) ) ( not ( = ?auto_38621 ?auto_38623 ) ) ( not ( = ?auto_38621 ?auto_38624 ) ) ( not ( = ?auto_38621 ?auto_38625 ) ) ( not ( = ?auto_38622 ?auto_38623 ) ) ( not ( = ?auto_38622 ?auto_38624 ) ) ( not ( = ?auto_38622 ?auto_38625 ) ) ( not ( = ?auto_38623 ?auto_38624 ) ) ( not ( = ?auto_38623 ?auto_38625 ) ) ( not ( = ?auto_38624 ?auto_38625 ) ) ( ON ?auto_38625 ?auto_38626 ) ( CLEAR ?auto_38625 ) ( not ( = ?auto_38621 ?auto_38626 ) ) ( not ( = ?auto_38622 ?auto_38626 ) ) ( not ( = ?auto_38623 ?auto_38626 ) ) ( not ( = ?auto_38624 ?auto_38626 ) ) ( not ( = ?auto_38625 ?auto_38626 ) ) ( HOLDING ?auto_38624 ) ( CLEAR ?auto_38623 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38621 ?auto_38622 ?auto_38623 ?auto_38624 ?auto_38625 )
      ( MAKE-4PILE ?auto_38621 ?auto_38622 ?auto_38623 ?auto_38624 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38627 - BLOCK
      ?auto_38628 - BLOCK
      ?auto_38629 - BLOCK
      ?auto_38630 - BLOCK
    )
    :vars
    (
      ?auto_38631 - BLOCK
      ?auto_38632 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38627 ) ( ON ?auto_38628 ?auto_38627 ) ( ON ?auto_38629 ?auto_38628 ) ( not ( = ?auto_38627 ?auto_38628 ) ) ( not ( = ?auto_38627 ?auto_38629 ) ) ( not ( = ?auto_38627 ?auto_38630 ) ) ( not ( = ?auto_38627 ?auto_38631 ) ) ( not ( = ?auto_38628 ?auto_38629 ) ) ( not ( = ?auto_38628 ?auto_38630 ) ) ( not ( = ?auto_38628 ?auto_38631 ) ) ( not ( = ?auto_38629 ?auto_38630 ) ) ( not ( = ?auto_38629 ?auto_38631 ) ) ( not ( = ?auto_38630 ?auto_38631 ) ) ( ON ?auto_38631 ?auto_38632 ) ( not ( = ?auto_38627 ?auto_38632 ) ) ( not ( = ?auto_38628 ?auto_38632 ) ) ( not ( = ?auto_38629 ?auto_38632 ) ) ( not ( = ?auto_38630 ?auto_38632 ) ) ( not ( = ?auto_38631 ?auto_38632 ) ) ( CLEAR ?auto_38629 ) ( ON ?auto_38630 ?auto_38631 ) ( CLEAR ?auto_38630 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38632 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38632 ?auto_38631 )
      ( MAKE-4PILE ?auto_38627 ?auto_38628 ?auto_38629 ?auto_38630 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38633 - BLOCK
      ?auto_38634 - BLOCK
      ?auto_38635 - BLOCK
      ?auto_38636 - BLOCK
    )
    :vars
    (
      ?auto_38638 - BLOCK
      ?auto_38637 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38633 ) ( ON ?auto_38634 ?auto_38633 ) ( not ( = ?auto_38633 ?auto_38634 ) ) ( not ( = ?auto_38633 ?auto_38635 ) ) ( not ( = ?auto_38633 ?auto_38636 ) ) ( not ( = ?auto_38633 ?auto_38638 ) ) ( not ( = ?auto_38634 ?auto_38635 ) ) ( not ( = ?auto_38634 ?auto_38636 ) ) ( not ( = ?auto_38634 ?auto_38638 ) ) ( not ( = ?auto_38635 ?auto_38636 ) ) ( not ( = ?auto_38635 ?auto_38638 ) ) ( not ( = ?auto_38636 ?auto_38638 ) ) ( ON ?auto_38638 ?auto_38637 ) ( not ( = ?auto_38633 ?auto_38637 ) ) ( not ( = ?auto_38634 ?auto_38637 ) ) ( not ( = ?auto_38635 ?auto_38637 ) ) ( not ( = ?auto_38636 ?auto_38637 ) ) ( not ( = ?auto_38638 ?auto_38637 ) ) ( ON ?auto_38636 ?auto_38638 ) ( CLEAR ?auto_38636 ) ( ON-TABLE ?auto_38637 ) ( HOLDING ?auto_38635 ) ( CLEAR ?auto_38634 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38633 ?auto_38634 ?auto_38635 )
      ( MAKE-4PILE ?auto_38633 ?auto_38634 ?auto_38635 ?auto_38636 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38639 - BLOCK
      ?auto_38640 - BLOCK
      ?auto_38641 - BLOCK
      ?auto_38642 - BLOCK
    )
    :vars
    (
      ?auto_38644 - BLOCK
      ?auto_38643 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38639 ) ( ON ?auto_38640 ?auto_38639 ) ( not ( = ?auto_38639 ?auto_38640 ) ) ( not ( = ?auto_38639 ?auto_38641 ) ) ( not ( = ?auto_38639 ?auto_38642 ) ) ( not ( = ?auto_38639 ?auto_38644 ) ) ( not ( = ?auto_38640 ?auto_38641 ) ) ( not ( = ?auto_38640 ?auto_38642 ) ) ( not ( = ?auto_38640 ?auto_38644 ) ) ( not ( = ?auto_38641 ?auto_38642 ) ) ( not ( = ?auto_38641 ?auto_38644 ) ) ( not ( = ?auto_38642 ?auto_38644 ) ) ( ON ?auto_38644 ?auto_38643 ) ( not ( = ?auto_38639 ?auto_38643 ) ) ( not ( = ?auto_38640 ?auto_38643 ) ) ( not ( = ?auto_38641 ?auto_38643 ) ) ( not ( = ?auto_38642 ?auto_38643 ) ) ( not ( = ?auto_38644 ?auto_38643 ) ) ( ON ?auto_38642 ?auto_38644 ) ( ON-TABLE ?auto_38643 ) ( CLEAR ?auto_38640 ) ( ON ?auto_38641 ?auto_38642 ) ( CLEAR ?auto_38641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38643 ?auto_38644 ?auto_38642 )
      ( MAKE-4PILE ?auto_38639 ?auto_38640 ?auto_38641 ?auto_38642 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38645 - BLOCK
      ?auto_38646 - BLOCK
      ?auto_38647 - BLOCK
      ?auto_38648 - BLOCK
    )
    :vars
    (
      ?auto_38649 - BLOCK
      ?auto_38650 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38645 ) ( not ( = ?auto_38645 ?auto_38646 ) ) ( not ( = ?auto_38645 ?auto_38647 ) ) ( not ( = ?auto_38645 ?auto_38648 ) ) ( not ( = ?auto_38645 ?auto_38649 ) ) ( not ( = ?auto_38646 ?auto_38647 ) ) ( not ( = ?auto_38646 ?auto_38648 ) ) ( not ( = ?auto_38646 ?auto_38649 ) ) ( not ( = ?auto_38647 ?auto_38648 ) ) ( not ( = ?auto_38647 ?auto_38649 ) ) ( not ( = ?auto_38648 ?auto_38649 ) ) ( ON ?auto_38649 ?auto_38650 ) ( not ( = ?auto_38645 ?auto_38650 ) ) ( not ( = ?auto_38646 ?auto_38650 ) ) ( not ( = ?auto_38647 ?auto_38650 ) ) ( not ( = ?auto_38648 ?auto_38650 ) ) ( not ( = ?auto_38649 ?auto_38650 ) ) ( ON ?auto_38648 ?auto_38649 ) ( ON-TABLE ?auto_38650 ) ( ON ?auto_38647 ?auto_38648 ) ( CLEAR ?auto_38647 ) ( HOLDING ?auto_38646 ) ( CLEAR ?auto_38645 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38645 ?auto_38646 )
      ( MAKE-4PILE ?auto_38645 ?auto_38646 ?auto_38647 ?auto_38648 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38651 - BLOCK
      ?auto_38652 - BLOCK
      ?auto_38653 - BLOCK
      ?auto_38654 - BLOCK
    )
    :vars
    (
      ?auto_38656 - BLOCK
      ?auto_38655 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38651 ) ( not ( = ?auto_38651 ?auto_38652 ) ) ( not ( = ?auto_38651 ?auto_38653 ) ) ( not ( = ?auto_38651 ?auto_38654 ) ) ( not ( = ?auto_38651 ?auto_38656 ) ) ( not ( = ?auto_38652 ?auto_38653 ) ) ( not ( = ?auto_38652 ?auto_38654 ) ) ( not ( = ?auto_38652 ?auto_38656 ) ) ( not ( = ?auto_38653 ?auto_38654 ) ) ( not ( = ?auto_38653 ?auto_38656 ) ) ( not ( = ?auto_38654 ?auto_38656 ) ) ( ON ?auto_38656 ?auto_38655 ) ( not ( = ?auto_38651 ?auto_38655 ) ) ( not ( = ?auto_38652 ?auto_38655 ) ) ( not ( = ?auto_38653 ?auto_38655 ) ) ( not ( = ?auto_38654 ?auto_38655 ) ) ( not ( = ?auto_38656 ?auto_38655 ) ) ( ON ?auto_38654 ?auto_38656 ) ( ON-TABLE ?auto_38655 ) ( ON ?auto_38653 ?auto_38654 ) ( CLEAR ?auto_38651 ) ( ON ?auto_38652 ?auto_38653 ) ( CLEAR ?auto_38652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38655 ?auto_38656 ?auto_38654 ?auto_38653 )
      ( MAKE-4PILE ?auto_38651 ?auto_38652 ?auto_38653 ?auto_38654 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38657 - BLOCK
      ?auto_38658 - BLOCK
      ?auto_38659 - BLOCK
      ?auto_38660 - BLOCK
    )
    :vars
    (
      ?auto_38662 - BLOCK
      ?auto_38661 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38657 ?auto_38658 ) ) ( not ( = ?auto_38657 ?auto_38659 ) ) ( not ( = ?auto_38657 ?auto_38660 ) ) ( not ( = ?auto_38657 ?auto_38662 ) ) ( not ( = ?auto_38658 ?auto_38659 ) ) ( not ( = ?auto_38658 ?auto_38660 ) ) ( not ( = ?auto_38658 ?auto_38662 ) ) ( not ( = ?auto_38659 ?auto_38660 ) ) ( not ( = ?auto_38659 ?auto_38662 ) ) ( not ( = ?auto_38660 ?auto_38662 ) ) ( ON ?auto_38662 ?auto_38661 ) ( not ( = ?auto_38657 ?auto_38661 ) ) ( not ( = ?auto_38658 ?auto_38661 ) ) ( not ( = ?auto_38659 ?auto_38661 ) ) ( not ( = ?auto_38660 ?auto_38661 ) ) ( not ( = ?auto_38662 ?auto_38661 ) ) ( ON ?auto_38660 ?auto_38662 ) ( ON-TABLE ?auto_38661 ) ( ON ?auto_38659 ?auto_38660 ) ( ON ?auto_38658 ?auto_38659 ) ( CLEAR ?auto_38658 ) ( HOLDING ?auto_38657 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38657 )
      ( MAKE-4PILE ?auto_38657 ?auto_38658 ?auto_38659 ?auto_38660 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38663 - BLOCK
      ?auto_38664 - BLOCK
      ?auto_38665 - BLOCK
      ?auto_38666 - BLOCK
    )
    :vars
    (
      ?auto_38667 - BLOCK
      ?auto_38668 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38663 ?auto_38664 ) ) ( not ( = ?auto_38663 ?auto_38665 ) ) ( not ( = ?auto_38663 ?auto_38666 ) ) ( not ( = ?auto_38663 ?auto_38667 ) ) ( not ( = ?auto_38664 ?auto_38665 ) ) ( not ( = ?auto_38664 ?auto_38666 ) ) ( not ( = ?auto_38664 ?auto_38667 ) ) ( not ( = ?auto_38665 ?auto_38666 ) ) ( not ( = ?auto_38665 ?auto_38667 ) ) ( not ( = ?auto_38666 ?auto_38667 ) ) ( ON ?auto_38667 ?auto_38668 ) ( not ( = ?auto_38663 ?auto_38668 ) ) ( not ( = ?auto_38664 ?auto_38668 ) ) ( not ( = ?auto_38665 ?auto_38668 ) ) ( not ( = ?auto_38666 ?auto_38668 ) ) ( not ( = ?auto_38667 ?auto_38668 ) ) ( ON ?auto_38666 ?auto_38667 ) ( ON-TABLE ?auto_38668 ) ( ON ?auto_38665 ?auto_38666 ) ( ON ?auto_38664 ?auto_38665 ) ( ON ?auto_38663 ?auto_38664 ) ( CLEAR ?auto_38663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38668 ?auto_38667 ?auto_38666 ?auto_38665 ?auto_38664 )
      ( MAKE-4PILE ?auto_38663 ?auto_38664 ?auto_38665 ?auto_38666 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38670 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_38670 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_38670 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38671 - BLOCK
    )
    :vars
    (
      ?auto_38672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38671 ?auto_38672 ) ( CLEAR ?auto_38671 ) ( HAND-EMPTY ) ( not ( = ?auto_38671 ?auto_38672 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38671 ?auto_38672 )
      ( MAKE-1PILE ?auto_38671 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38673 - BLOCK
    )
    :vars
    (
      ?auto_38674 - BLOCK
      ?auto_38675 - BLOCK
      ?auto_38677 - BLOCK
      ?auto_38676 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38673 ?auto_38674 ) ) ( HOLDING ?auto_38673 ) ( CLEAR ?auto_38674 ) ( ON-TABLE ?auto_38675 ) ( ON ?auto_38677 ?auto_38675 ) ( ON ?auto_38676 ?auto_38677 ) ( ON ?auto_38674 ?auto_38676 ) ( not ( = ?auto_38675 ?auto_38677 ) ) ( not ( = ?auto_38675 ?auto_38676 ) ) ( not ( = ?auto_38675 ?auto_38674 ) ) ( not ( = ?auto_38675 ?auto_38673 ) ) ( not ( = ?auto_38677 ?auto_38676 ) ) ( not ( = ?auto_38677 ?auto_38674 ) ) ( not ( = ?auto_38677 ?auto_38673 ) ) ( not ( = ?auto_38676 ?auto_38674 ) ) ( not ( = ?auto_38676 ?auto_38673 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38675 ?auto_38677 ?auto_38676 ?auto_38674 ?auto_38673 )
      ( MAKE-1PILE ?auto_38673 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38678 - BLOCK
    )
    :vars
    (
      ?auto_38681 - BLOCK
      ?auto_38679 - BLOCK
      ?auto_38680 - BLOCK
      ?auto_38682 - BLOCK
      ?auto_38683 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38678 ?auto_38681 ) ) ( CLEAR ?auto_38681 ) ( ON-TABLE ?auto_38679 ) ( ON ?auto_38680 ?auto_38679 ) ( ON ?auto_38682 ?auto_38680 ) ( ON ?auto_38681 ?auto_38682 ) ( not ( = ?auto_38679 ?auto_38680 ) ) ( not ( = ?auto_38679 ?auto_38682 ) ) ( not ( = ?auto_38679 ?auto_38681 ) ) ( not ( = ?auto_38679 ?auto_38678 ) ) ( not ( = ?auto_38680 ?auto_38682 ) ) ( not ( = ?auto_38680 ?auto_38681 ) ) ( not ( = ?auto_38680 ?auto_38678 ) ) ( not ( = ?auto_38682 ?auto_38681 ) ) ( not ( = ?auto_38682 ?auto_38678 ) ) ( ON ?auto_38678 ?auto_38683 ) ( CLEAR ?auto_38678 ) ( HAND-EMPTY ) ( not ( = ?auto_38678 ?auto_38683 ) ) ( not ( = ?auto_38681 ?auto_38683 ) ) ( not ( = ?auto_38679 ?auto_38683 ) ) ( not ( = ?auto_38680 ?auto_38683 ) ) ( not ( = ?auto_38682 ?auto_38683 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38678 ?auto_38683 )
      ( MAKE-1PILE ?auto_38678 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38684 - BLOCK
    )
    :vars
    (
      ?auto_38688 - BLOCK
      ?auto_38685 - BLOCK
      ?auto_38686 - BLOCK
      ?auto_38689 - BLOCK
      ?auto_38687 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38684 ?auto_38688 ) ) ( ON-TABLE ?auto_38685 ) ( ON ?auto_38686 ?auto_38685 ) ( ON ?auto_38689 ?auto_38686 ) ( not ( = ?auto_38685 ?auto_38686 ) ) ( not ( = ?auto_38685 ?auto_38689 ) ) ( not ( = ?auto_38685 ?auto_38688 ) ) ( not ( = ?auto_38685 ?auto_38684 ) ) ( not ( = ?auto_38686 ?auto_38689 ) ) ( not ( = ?auto_38686 ?auto_38688 ) ) ( not ( = ?auto_38686 ?auto_38684 ) ) ( not ( = ?auto_38689 ?auto_38688 ) ) ( not ( = ?auto_38689 ?auto_38684 ) ) ( ON ?auto_38684 ?auto_38687 ) ( CLEAR ?auto_38684 ) ( not ( = ?auto_38684 ?auto_38687 ) ) ( not ( = ?auto_38688 ?auto_38687 ) ) ( not ( = ?auto_38685 ?auto_38687 ) ) ( not ( = ?auto_38686 ?auto_38687 ) ) ( not ( = ?auto_38689 ?auto_38687 ) ) ( HOLDING ?auto_38688 ) ( CLEAR ?auto_38689 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38685 ?auto_38686 ?auto_38689 ?auto_38688 )
      ( MAKE-1PILE ?auto_38684 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38690 - BLOCK
    )
    :vars
    (
      ?auto_38695 - BLOCK
      ?auto_38694 - BLOCK
      ?auto_38691 - BLOCK
      ?auto_38692 - BLOCK
      ?auto_38693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38690 ?auto_38695 ) ) ( ON-TABLE ?auto_38694 ) ( ON ?auto_38691 ?auto_38694 ) ( ON ?auto_38692 ?auto_38691 ) ( not ( = ?auto_38694 ?auto_38691 ) ) ( not ( = ?auto_38694 ?auto_38692 ) ) ( not ( = ?auto_38694 ?auto_38695 ) ) ( not ( = ?auto_38694 ?auto_38690 ) ) ( not ( = ?auto_38691 ?auto_38692 ) ) ( not ( = ?auto_38691 ?auto_38695 ) ) ( not ( = ?auto_38691 ?auto_38690 ) ) ( not ( = ?auto_38692 ?auto_38695 ) ) ( not ( = ?auto_38692 ?auto_38690 ) ) ( ON ?auto_38690 ?auto_38693 ) ( not ( = ?auto_38690 ?auto_38693 ) ) ( not ( = ?auto_38695 ?auto_38693 ) ) ( not ( = ?auto_38694 ?auto_38693 ) ) ( not ( = ?auto_38691 ?auto_38693 ) ) ( not ( = ?auto_38692 ?auto_38693 ) ) ( CLEAR ?auto_38692 ) ( ON ?auto_38695 ?auto_38690 ) ( CLEAR ?auto_38695 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38693 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38693 ?auto_38690 )
      ( MAKE-1PILE ?auto_38690 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38696 - BLOCK
    )
    :vars
    (
      ?auto_38697 - BLOCK
      ?auto_38700 - BLOCK
      ?auto_38701 - BLOCK
      ?auto_38698 - BLOCK
      ?auto_38699 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38696 ?auto_38697 ) ) ( ON-TABLE ?auto_38700 ) ( ON ?auto_38701 ?auto_38700 ) ( not ( = ?auto_38700 ?auto_38701 ) ) ( not ( = ?auto_38700 ?auto_38698 ) ) ( not ( = ?auto_38700 ?auto_38697 ) ) ( not ( = ?auto_38700 ?auto_38696 ) ) ( not ( = ?auto_38701 ?auto_38698 ) ) ( not ( = ?auto_38701 ?auto_38697 ) ) ( not ( = ?auto_38701 ?auto_38696 ) ) ( not ( = ?auto_38698 ?auto_38697 ) ) ( not ( = ?auto_38698 ?auto_38696 ) ) ( ON ?auto_38696 ?auto_38699 ) ( not ( = ?auto_38696 ?auto_38699 ) ) ( not ( = ?auto_38697 ?auto_38699 ) ) ( not ( = ?auto_38700 ?auto_38699 ) ) ( not ( = ?auto_38701 ?auto_38699 ) ) ( not ( = ?auto_38698 ?auto_38699 ) ) ( ON ?auto_38697 ?auto_38696 ) ( CLEAR ?auto_38697 ) ( ON-TABLE ?auto_38699 ) ( HOLDING ?auto_38698 ) ( CLEAR ?auto_38701 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38700 ?auto_38701 ?auto_38698 )
      ( MAKE-1PILE ?auto_38696 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38702 - BLOCK
    )
    :vars
    (
      ?auto_38704 - BLOCK
      ?auto_38706 - BLOCK
      ?auto_38703 - BLOCK
      ?auto_38707 - BLOCK
      ?auto_38705 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38702 ?auto_38704 ) ) ( ON-TABLE ?auto_38706 ) ( ON ?auto_38703 ?auto_38706 ) ( not ( = ?auto_38706 ?auto_38703 ) ) ( not ( = ?auto_38706 ?auto_38707 ) ) ( not ( = ?auto_38706 ?auto_38704 ) ) ( not ( = ?auto_38706 ?auto_38702 ) ) ( not ( = ?auto_38703 ?auto_38707 ) ) ( not ( = ?auto_38703 ?auto_38704 ) ) ( not ( = ?auto_38703 ?auto_38702 ) ) ( not ( = ?auto_38707 ?auto_38704 ) ) ( not ( = ?auto_38707 ?auto_38702 ) ) ( ON ?auto_38702 ?auto_38705 ) ( not ( = ?auto_38702 ?auto_38705 ) ) ( not ( = ?auto_38704 ?auto_38705 ) ) ( not ( = ?auto_38706 ?auto_38705 ) ) ( not ( = ?auto_38703 ?auto_38705 ) ) ( not ( = ?auto_38707 ?auto_38705 ) ) ( ON ?auto_38704 ?auto_38702 ) ( ON-TABLE ?auto_38705 ) ( CLEAR ?auto_38703 ) ( ON ?auto_38707 ?auto_38704 ) ( CLEAR ?auto_38707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38705 ?auto_38702 ?auto_38704 )
      ( MAKE-1PILE ?auto_38702 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38708 - BLOCK
    )
    :vars
    (
      ?auto_38709 - BLOCK
      ?auto_38713 - BLOCK
      ?auto_38711 - BLOCK
      ?auto_38710 - BLOCK
      ?auto_38712 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38708 ?auto_38709 ) ) ( ON-TABLE ?auto_38713 ) ( not ( = ?auto_38713 ?auto_38711 ) ) ( not ( = ?auto_38713 ?auto_38710 ) ) ( not ( = ?auto_38713 ?auto_38709 ) ) ( not ( = ?auto_38713 ?auto_38708 ) ) ( not ( = ?auto_38711 ?auto_38710 ) ) ( not ( = ?auto_38711 ?auto_38709 ) ) ( not ( = ?auto_38711 ?auto_38708 ) ) ( not ( = ?auto_38710 ?auto_38709 ) ) ( not ( = ?auto_38710 ?auto_38708 ) ) ( ON ?auto_38708 ?auto_38712 ) ( not ( = ?auto_38708 ?auto_38712 ) ) ( not ( = ?auto_38709 ?auto_38712 ) ) ( not ( = ?auto_38713 ?auto_38712 ) ) ( not ( = ?auto_38711 ?auto_38712 ) ) ( not ( = ?auto_38710 ?auto_38712 ) ) ( ON ?auto_38709 ?auto_38708 ) ( ON-TABLE ?auto_38712 ) ( ON ?auto_38710 ?auto_38709 ) ( CLEAR ?auto_38710 ) ( HOLDING ?auto_38711 ) ( CLEAR ?auto_38713 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38713 ?auto_38711 )
      ( MAKE-1PILE ?auto_38708 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38714 - BLOCK
    )
    :vars
    (
      ?auto_38717 - BLOCK
      ?auto_38718 - BLOCK
      ?auto_38715 - BLOCK
      ?auto_38719 - BLOCK
      ?auto_38716 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38714 ?auto_38717 ) ) ( ON-TABLE ?auto_38718 ) ( not ( = ?auto_38718 ?auto_38715 ) ) ( not ( = ?auto_38718 ?auto_38719 ) ) ( not ( = ?auto_38718 ?auto_38717 ) ) ( not ( = ?auto_38718 ?auto_38714 ) ) ( not ( = ?auto_38715 ?auto_38719 ) ) ( not ( = ?auto_38715 ?auto_38717 ) ) ( not ( = ?auto_38715 ?auto_38714 ) ) ( not ( = ?auto_38719 ?auto_38717 ) ) ( not ( = ?auto_38719 ?auto_38714 ) ) ( ON ?auto_38714 ?auto_38716 ) ( not ( = ?auto_38714 ?auto_38716 ) ) ( not ( = ?auto_38717 ?auto_38716 ) ) ( not ( = ?auto_38718 ?auto_38716 ) ) ( not ( = ?auto_38715 ?auto_38716 ) ) ( not ( = ?auto_38719 ?auto_38716 ) ) ( ON ?auto_38717 ?auto_38714 ) ( ON-TABLE ?auto_38716 ) ( ON ?auto_38719 ?auto_38717 ) ( CLEAR ?auto_38718 ) ( ON ?auto_38715 ?auto_38719 ) ( CLEAR ?auto_38715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38716 ?auto_38714 ?auto_38717 ?auto_38719 )
      ( MAKE-1PILE ?auto_38714 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38720 - BLOCK
    )
    :vars
    (
      ?auto_38723 - BLOCK
      ?auto_38725 - BLOCK
      ?auto_38721 - BLOCK
      ?auto_38724 - BLOCK
      ?auto_38722 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38720 ?auto_38723 ) ) ( not ( = ?auto_38725 ?auto_38721 ) ) ( not ( = ?auto_38725 ?auto_38724 ) ) ( not ( = ?auto_38725 ?auto_38723 ) ) ( not ( = ?auto_38725 ?auto_38720 ) ) ( not ( = ?auto_38721 ?auto_38724 ) ) ( not ( = ?auto_38721 ?auto_38723 ) ) ( not ( = ?auto_38721 ?auto_38720 ) ) ( not ( = ?auto_38724 ?auto_38723 ) ) ( not ( = ?auto_38724 ?auto_38720 ) ) ( ON ?auto_38720 ?auto_38722 ) ( not ( = ?auto_38720 ?auto_38722 ) ) ( not ( = ?auto_38723 ?auto_38722 ) ) ( not ( = ?auto_38725 ?auto_38722 ) ) ( not ( = ?auto_38721 ?auto_38722 ) ) ( not ( = ?auto_38724 ?auto_38722 ) ) ( ON ?auto_38723 ?auto_38720 ) ( ON-TABLE ?auto_38722 ) ( ON ?auto_38724 ?auto_38723 ) ( ON ?auto_38721 ?auto_38724 ) ( CLEAR ?auto_38721 ) ( HOLDING ?auto_38725 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38725 )
      ( MAKE-1PILE ?auto_38720 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38726 - BLOCK
    )
    :vars
    (
      ?auto_38728 - BLOCK
      ?auto_38729 - BLOCK
      ?auto_38730 - BLOCK
      ?auto_38731 - BLOCK
      ?auto_38727 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38726 ?auto_38728 ) ) ( not ( = ?auto_38729 ?auto_38730 ) ) ( not ( = ?auto_38729 ?auto_38731 ) ) ( not ( = ?auto_38729 ?auto_38728 ) ) ( not ( = ?auto_38729 ?auto_38726 ) ) ( not ( = ?auto_38730 ?auto_38731 ) ) ( not ( = ?auto_38730 ?auto_38728 ) ) ( not ( = ?auto_38730 ?auto_38726 ) ) ( not ( = ?auto_38731 ?auto_38728 ) ) ( not ( = ?auto_38731 ?auto_38726 ) ) ( ON ?auto_38726 ?auto_38727 ) ( not ( = ?auto_38726 ?auto_38727 ) ) ( not ( = ?auto_38728 ?auto_38727 ) ) ( not ( = ?auto_38729 ?auto_38727 ) ) ( not ( = ?auto_38730 ?auto_38727 ) ) ( not ( = ?auto_38731 ?auto_38727 ) ) ( ON ?auto_38728 ?auto_38726 ) ( ON-TABLE ?auto_38727 ) ( ON ?auto_38731 ?auto_38728 ) ( ON ?auto_38730 ?auto_38731 ) ( ON ?auto_38729 ?auto_38730 ) ( CLEAR ?auto_38729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38727 ?auto_38726 ?auto_38728 ?auto_38731 ?auto_38730 )
      ( MAKE-1PILE ?auto_38726 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38735 - BLOCK
      ?auto_38736 - BLOCK
      ?auto_38737 - BLOCK
    )
    :vars
    (
      ?auto_38738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38738 ?auto_38737 ) ( CLEAR ?auto_38738 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38735 ) ( ON ?auto_38736 ?auto_38735 ) ( ON ?auto_38737 ?auto_38736 ) ( not ( = ?auto_38735 ?auto_38736 ) ) ( not ( = ?auto_38735 ?auto_38737 ) ) ( not ( = ?auto_38735 ?auto_38738 ) ) ( not ( = ?auto_38736 ?auto_38737 ) ) ( not ( = ?auto_38736 ?auto_38738 ) ) ( not ( = ?auto_38737 ?auto_38738 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38738 ?auto_38737 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38739 - BLOCK
      ?auto_38740 - BLOCK
      ?auto_38741 - BLOCK
    )
    :vars
    (
      ?auto_38742 - BLOCK
      ?auto_38743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38742 ?auto_38741 ) ( CLEAR ?auto_38742 ) ( ON-TABLE ?auto_38739 ) ( ON ?auto_38740 ?auto_38739 ) ( ON ?auto_38741 ?auto_38740 ) ( not ( = ?auto_38739 ?auto_38740 ) ) ( not ( = ?auto_38739 ?auto_38741 ) ) ( not ( = ?auto_38739 ?auto_38742 ) ) ( not ( = ?auto_38740 ?auto_38741 ) ) ( not ( = ?auto_38740 ?auto_38742 ) ) ( not ( = ?auto_38741 ?auto_38742 ) ) ( HOLDING ?auto_38743 ) ( not ( = ?auto_38739 ?auto_38743 ) ) ( not ( = ?auto_38740 ?auto_38743 ) ) ( not ( = ?auto_38741 ?auto_38743 ) ) ( not ( = ?auto_38742 ?auto_38743 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_38743 )
      ( MAKE-3PILE ?auto_38739 ?auto_38740 ?auto_38741 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38744 - BLOCK
      ?auto_38745 - BLOCK
      ?auto_38746 - BLOCK
    )
    :vars
    (
      ?auto_38748 - BLOCK
      ?auto_38747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38748 ?auto_38746 ) ( ON-TABLE ?auto_38744 ) ( ON ?auto_38745 ?auto_38744 ) ( ON ?auto_38746 ?auto_38745 ) ( not ( = ?auto_38744 ?auto_38745 ) ) ( not ( = ?auto_38744 ?auto_38746 ) ) ( not ( = ?auto_38744 ?auto_38748 ) ) ( not ( = ?auto_38745 ?auto_38746 ) ) ( not ( = ?auto_38745 ?auto_38748 ) ) ( not ( = ?auto_38746 ?auto_38748 ) ) ( not ( = ?auto_38744 ?auto_38747 ) ) ( not ( = ?auto_38745 ?auto_38747 ) ) ( not ( = ?auto_38746 ?auto_38747 ) ) ( not ( = ?auto_38748 ?auto_38747 ) ) ( ON ?auto_38747 ?auto_38748 ) ( CLEAR ?auto_38747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38744 ?auto_38745 ?auto_38746 ?auto_38748 )
      ( MAKE-3PILE ?auto_38744 ?auto_38745 ?auto_38746 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38749 - BLOCK
      ?auto_38750 - BLOCK
      ?auto_38751 - BLOCK
    )
    :vars
    (
      ?auto_38752 - BLOCK
      ?auto_38753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38752 ?auto_38751 ) ( ON-TABLE ?auto_38749 ) ( ON ?auto_38750 ?auto_38749 ) ( ON ?auto_38751 ?auto_38750 ) ( not ( = ?auto_38749 ?auto_38750 ) ) ( not ( = ?auto_38749 ?auto_38751 ) ) ( not ( = ?auto_38749 ?auto_38752 ) ) ( not ( = ?auto_38750 ?auto_38751 ) ) ( not ( = ?auto_38750 ?auto_38752 ) ) ( not ( = ?auto_38751 ?auto_38752 ) ) ( not ( = ?auto_38749 ?auto_38753 ) ) ( not ( = ?auto_38750 ?auto_38753 ) ) ( not ( = ?auto_38751 ?auto_38753 ) ) ( not ( = ?auto_38752 ?auto_38753 ) ) ( HOLDING ?auto_38753 ) ( CLEAR ?auto_38752 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38749 ?auto_38750 ?auto_38751 ?auto_38752 ?auto_38753 )
      ( MAKE-3PILE ?auto_38749 ?auto_38750 ?auto_38751 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38754 - BLOCK
      ?auto_38755 - BLOCK
      ?auto_38756 - BLOCK
    )
    :vars
    (
      ?auto_38757 - BLOCK
      ?auto_38758 - BLOCK
      ?auto_38759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38757 ?auto_38756 ) ( ON-TABLE ?auto_38754 ) ( ON ?auto_38755 ?auto_38754 ) ( ON ?auto_38756 ?auto_38755 ) ( not ( = ?auto_38754 ?auto_38755 ) ) ( not ( = ?auto_38754 ?auto_38756 ) ) ( not ( = ?auto_38754 ?auto_38757 ) ) ( not ( = ?auto_38755 ?auto_38756 ) ) ( not ( = ?auto_38755 ?auto_38757 ) ) ( not ( = ?auto_38756 ?auto_38757 ) ) ( not ( = ?auto_38754 ?auto_38758 ) ) ( not ( = ?auto_38755 ?auto_38758 ) ) ( not ( = ?auto_38756 ?auto_38758 ) ) ( not ( = ?auto_38757 ?auto_38758 ) ) ( CLEAR ?auto_38757 ) ( ON ?auto_38758 ?auto_38759 ) ( CLEAR ?auto_38758 ) ( HAND-EMPTY ) ( not ( = ?auto_38754 ?auto_38759 ) ) ( not ( = ?auto_38755 ?auto_38759 ) ) ( not ( = ?auto_38756 ?auto_38759 ) ) ( not ( = ?auto_38757 ?auto_38759 ) ) ( not ( = ?auto_38758 ?auto_38759 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38758 ?auto_38759 )
      ( MAKE-3PILE ?auto_38754 ?auto_38755 ?auto_38756 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38772 - BLOCK
      ?auto_38773 - BLOCK
      ?auto_38774 - BLOCK
    )
    :vars
    (
      ?auto_38775 - BLOCK
      ?auto_38776 - BLOCK
      ?auto_38777 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38772 ) ( ON ?auto_38773 ?auto_38772 ) ( not ( = ?auto_38772 ?auto_38773 ) ) ( not ( = ?auto_38772 ?auto_38774 ) ) ( not ( = ?auto_38772 ?auto_38775 ) ) ( not ( = ?auto_38773 ?auto_38774 ) ) ( not ( = ?auto_38773 ?auto_38775 ) ) ( not ( = ?auto_38774 ?auto_38775 ) ) ( not ( = ?auto_38772 ?auto_38776 ) ) ( not ( = ?auto_38773 ?auto_38776 ) ) ( not ( = ?auto_38774 ?auto_38776 ) ) ( not ( = ?auto_38775 ?auto_38776 ) ) ( ON ?auto_38776 ?auto_38777 ) ( not ( = ?auto_38772 ?auto_38777 ) ) ( not ( = ?auto_38773 ?auto_38777 ) ) ( not ( = ?auto_38774 ?auto_38777 ) ) ( not ( = ?auto_38775 ?auto_38777 ) ) ( not ( = ?auto_38776 ?auto_38777 ) ) ( ON ?auto_38775 ?auto_38776 ) ( CLEAR ?auto_38775 ) ( HOLDING ?auto_38774 ) ( CLEAR ?auto_38773 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38772 ?auto_38773 ?auto_38774 ?auto_38775 )
      ( MAKE-3PILE ?auto_38772 ?auto_38773 ?auto_38774 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38778 - BLOCK
      ?auto_38779 - BLOCK
      ?auto_38780 - BLOCK
    )
    :vars
    (
      ?auto_38782 - BLOCK
      ?auto_38781 - BLOCK
      ?auto_38783 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38778 ) ( ON ?auto_38779 ?auto_38778 ) ( not ( = ?auto_38778 ?auto_38779 ) ) ( not ( = ?auto_38778 ?auto_38780 ) ) ( not ( = ?auto_38778 ?auto_38782 ) ) ( not ( = ?auto_38779 ?auto_38780 ) ) ( not ( = ?auto_38779 ?auto_38782 ) ) ( not ( = ?auto_38780 ?auto_38782 ) ) ( not ( = ?auto_38778 ?auto_38781 ) ) ( not ( = ?auto_38779 ?auto_38781 ) ) ( not ( = ?auto_38780 ?auto_38781 ) ) ( not ( = ?auto_38782 ?auto_38781 ) ) ( ON ?auto_38781 ?auto_38783 ) ( not ( = ?auto_38778 ?auto_38783 ) ) ( not ( = ?auto_38779 ?auto_38783 ) ) ( not ( = ?auto_38780 ?auto_38783 ) ) ( not ( = ?auto_38782 ?auto_38783 ) ) ( not ( = ?auto_38781 ?auto_38783 ) ) ( ON ?auto_38782 ?auto_38781 ) ( CLEAR ?auto_38779 ) ( ON ?auto_38780 ?auto_38782 ) ( CLEAR ?auto_38780 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38783 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38783 ?auto_38781 ?auto_38782 )
      ( MAKE-3PILE ?auto_38778 ?auto_38779 ?auto_38780 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38784 - BLOCK
      ?auto_38785 - BLOCK
      ?auto_38786 - BLOCK
    )
    :vars
    (
      ?auto_38788 - BLOCK
      ?auto_38789 - BLOCK
      ?auto_38787 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38784 ) ( not ( = ?auto_38784 ?auto_38785 ) ) ( not ( = ?auto_38784 ?auto_38786 ) ) ( not ( = ?auto_38784 ?auto_38788 ) ) ( not ( = ?auto_38785 ?auto_38786 ) ) ( not ( = ?auto_38785 ?auto_38788 ) ) ( not ( = ?auto_38786 ?auto_38788 ) ) ( not ( = ?auto_38784 ?auto_38789 ) ) ( not ( = ?auto_38785 ?auto_38789 ) ) ( not ( = ?auto_38786 ?auto_38789 ) ) ( not ( = ?auto_38788 ?auto_38789 ) ) ( ON ?auto_38789 ?auto_38787 ) ( not ( = ?auto_38784 ?auto_38787 ) ) ( not ( = ?auto_38785 ?auto_38787 ) ) ( not ( = ?auto_38786 ?auto_38787 ) ) ( not ( = ?auto_38788 ?auto_38787 ) ) ( not ( = ?auto_38789 ?auto_38787 ) ) ( ON ?auto_38788 ?auto_38789 ) ( ON ?auto_38786 ?auto_38788 ) ( CLEAR ?auto_38786 ) ( ON-TABLE ?auto_38787 ) ( HOLDING ?auto_38785 ) ( CLEAR ?auto_38784 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38784 ?auto_38785 )
      ( MAKE-3PILE ?auto_38784 ?auto_38785 ?auto_38786 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38790 - BLOCK
      ?auto_38791 - BLOCK
      ?auto_38792 - BLOCK
    )
    :vars
    (
      ?auto_38793 - BLOCK
      ?auto_38794 - BLOCK
      ?auto_38795 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38790 ) ( not ( = ?auto_38790 ?auto_38791 ) ) ( not ( = ?auto_38790 ?auto_38792 ) ) ( not ( = ?auto_38790 ?auto_38793 ) ) ( not ( = ?auto_38791 ?auto_38792 ) ) ( not ( = ?auto_38791 ?auto_38793 ) ) ( not ( = ?auto_38792 ?auto_38793 ) ) ( not ( = ?auto_38790 ?auto_38794 ) ) ( not ( = ?auto_38791 ?auto_38794 ) ) ( not ( = ?auto_38792 ?auto_38794 ) ) ( not ( = ?auto_38793 ?auto_38794 ) ) ( ON ?auto_38794 ?auto_38795 ) ( not ( = ?auto_38790 ?auto_38795 ) ) ( not ( = ?auto_38791 ?auto_38795 ) ) ( not ( = ?auto_38792 ?auto_38795 ) ) ( not ( = ?auto_38793 ?auto_38795 ) ) ( not ( = ?auto_38794 ?auto_38795 ) ) ( ON ?auto_38793 ?auto_38794 ) ( ON ?auto_38792 ?auto_38793 ) ( ON-TABLE ?auto_38795 ) ( CLEAR ?auto_38790 ) ( ON ?auto_38791 ?auto_38792 ) ( CLEAR ?auto_38791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38795 ?auto_38794 ?auto_38793 ?auto_38792 )
      ( MAKE-3PILE ?auto_38790 ?auto_38791 ?auto_38792 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38796 - BLOCK
      ?auto_38797 - BLOCK
      ?auto_38798 - BLOCK
    )
    :vars
    (
      ?auto_38800 - BLOCK
      ?auto_38801 - BLOCK
      ?auto_38799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38796 ?auto_38797 ) ) ( not ( = ?auto_38796 ?auto_38798 ) ) ( not ( = ?auto_38796 ?auto_38800 ) ) ( not ( = ?auto_38797 ?auto_38798 ) ) ( not ( = ?auto_38797 ?auto_38800 ) ) ( not ( = ?auto_38798 ?auto_38800 ) ) ( not ( = ?auto_38796 ?auto_38801 ) ) ( not ( = ?auto_38797 ?auto_38801 ) ) ( not ( = ?auto_38798 ?auto_38801 ) ) ( not ( = ?auto_38800 ?auto_38801 ) ) ( ON ?auto_38801 ?auto_38799 ) ( not ( = ?auto_38796 ?auto_38799 ) ) ( not ( = ?auto_38797 ?auto_38799 ) ) ( not ( = ?auto_38798 ?auto_38799 ) ) ( not ( = ?auto_38800 ?auto_38799 ) ) ( not ( = ?auto_38801 ?auto_38799 ) ) ( ON ?auto_38800 ?auto_38801 ) ( ON ?auto_38798 ?auto_38800 ) ( ON-TABLE ?auto_38799 ) ( ON ?auto_38797 ?auto_38798 ) ( CLEAR ?auto_38797 ) ( HOLDING ?auto_38796 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38796 )
      ( MAKE-3PILE ?auto_38796 ?auto_38797 ?auto_38798 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38802 - BLOCK
      ?auto_38803 - BLOCK
      ?auto_38804 - BLOCK
    )
    :vars
    (
      ?auto_38805 - BLOCK
      ?auto_38807 - BLOCK
      ?auto_38806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38802 ?auto_38803 ) ) ( not ( = ?auto_38802 ?auto_38804 ) ) ( not ( = ?auto_38802 ?auto_38805 ) ) ( not ( = ?auto_38803 ?auto_38804 ) ) ( not ( = ?auto_38803 ?auto_38805 ) ) ( not ( = ?auto_38804 ?auto_38805 ) ) ( not ( = ?auto_38802 ?auto_38807 ) ) ( not ( = ?auto_38803 ?auto_38807 ) ) ( not ( = ?auto_38804 ?auto_38807 ) ) ( not ( = ?auto_38805 ?auto_38807 ) ) ( ON ?auto_38807 ?auto_38806 ) ( not ( = ?auto_38802 ?auto_38806 ) ) ( not ( = ?auto_38803 ?auto_38806 ) ) ( not ( = ?auto_38804 ?auto_38806 ) ) ( not ( = ?auto_38805 ?auto_38806 ) ) ( not ( = ?auto_38807 ?auto_38806 ) ) ( ON ?auto_38805 ?auto_38807 ) ( ON ?auto_38804 ?auto_38805 ) ( ON-TABLE ?auto_38806 ) ( ON ?auto_38803 ?auto_38804 ) ( ON ?auto_38802 ?auto_38803 ) ( CLEAR ?auto_38802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38806 ?auto_38807 ?auto_38805 ?auto_38804 ?auto_38803 )
      ( MAKE-3PILE ?auto_38802 ?auto_38803 ?auto_38804 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38810 - BLOCK
      ?auto_38811 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_38811 ) ( CLEAR ?auto_38810 ) ( ON-TABLE ?auto_38810 ) ( not ( = ?auto_38810 ?auto_38811 ) ) )
    :subtasks
    ( ( !STACK ?auto_38811 ?auto_38810 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38812 - BLOCK
      ?auto_38813 - BLOCK
    )
    :vars
    (
      ?auto_38814 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_38812 ) ( ON-TABLE ?auto_38812 ) ( not ( = ?auto_38812 ?auto_38813 ) ) ( ON ?auto_38813 ?auto_38814 ) ( CLEAR ?auto_38813 ) ( HAND-EMPTY ) ( not ( = ?auto_38812 ?auto_38814 ) ) ( not ( = ?auto_38813 ?auto_38814 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38813 ?auto_38814 )
      ( MAKE-2PILE ?auto_38812 ?auto_38813 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38815 - BLOCK
      ?auto_38816 - BLOCK
    )
    :vars
    (
      ?auto_38817 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38815 ?auto_38816 ) ) ( ON ?auto_38816 ?auto_38817 ) ( CLEAR ?auto_38816 ) ( not ( = ?auto_38815 ?auto_38817 ) ) ( not ( = ?auto_38816 ?auto_38817 ) ) ( HOLDING ?auto_38815 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38815 )
      ( MAKE-2PILE ?auto_38815 ?auto_38816 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38818 - BLOCK
      ?auto_38819 - BLOCK
    )
    :vars
    (
      ?auto_38820 - BLOCK
      ?auto_38822 - BLOCK
      ?auto_38821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38818 ?auto_38819 ) ) ( ON ?auto_38819 ?auto_38820 ) ( not ( = ?auto_38818 ?auto_38820 ) ) ( not ( = ?auto_38819 ?auto_38820 ) ) ( ON ?auto_38818 ?auto_38819 ) ( CLEAR ?auto_38818 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38822 ) ( ON ?auto_38821 ?auto_38822 ) ( ON ?auto_38820 ?auto_38821 ) ( not ( = ?auto_38822 ?auto_38821 ) ) ( not ( = ?auto_38822 ?auto_38820 ) ) ( not ( = ?auto_38822 ?auto_38819 ) ) ( not ( = ?auto_38822 ?auto_38818 ) ) ( not ( = ?auto_38821 ?auto_38820 ) ) ( not ( = ?auto_38821 ?auto_38819 ) ) ( not ( = ?auto_38821 ?auto_38818 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38822 ?auto_38821 ?auto_38820 ?auto_38819 )
      ( MAKE-2PILE ?auto_38818 ?auto_38819 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38823 - BLOCK
      ?auto_38824 - BLOCK
    )
    :vars
    (
      ?auto_38825 - BLOCK
      ?auto_38826 - BLOCK
      ?auto_38827 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38823 ?auto_38824 ) ) ( ON ?auto_38824 ?auto_38825 ) ( not ( = ?auto_38823 ?auto_38825 ) ) ( not ( = ?auto_38824 ?auto_38825 ) ) ( ON-TABLE ?auto_38826 ) ( ON ?auto_38827 ?auto_38826 ) ( ON ?auto_38825 ?auto_38827 ) ( not ( = ?auto_38826 ?auto_38827 ) ) ( not ( = ?auto_38826 ?auto_38825 ) ) ( not ( = ?auto_38826 ?auto_38824 ) ) ( not ( = ?auto_38826 ?auto_38823 ) ) ( not ( = ?auto_38827 ?auto_38825 ) ) ( not ( = ?auto_38827 ?auto_38824 ) ) ( not ( = ?auto_38827 ?auto_38823 ) ) ( HOLDING ?auto_38823 ) ( CLEAR ?auto_38824 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38826 ?auto_38827 ?auto_38825 ?auto_38824 ?auto_38823 )
      ( MAKE-2PILE ?auto_38823 ?auto_38824 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38828 - BLOCK
      ?auto_38829 - BLOCK
    )
    :vars
    (
      ?auto_38832 - BLOCK
      ?auto_38831 - BLOCK
      ?auto_38830 - BLOCK
      ?auto_38833 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38828 ?auto_38829 ) ) ( ON ?auto_38829 ?auto_38832 ) ( not ( = ?auto_38828 ?auto_38832 ) ) ( not ( = ?auto_38829 ?auto_38832 ) ) ( ON-TABLE ?auto_38831 ) ( ON ?auto_38830 ?auto_38831 ) ( ON ?auto_38832 ?auto_38830 ) ( not ( = ?auto_38831 ?auto_38830 ) ) ( not ( = ?auto_38831 ?auto_38832 ) ) ( not ( = ?auto_38831 ?auto_38829 ) ) ( not ( = ?auto_38831 ?auto_38828 ) ) ( not ( = ?auto_38830 ?auto_38832 ) ) ( not ( = ?auto_38830 ?auto_38829 ) ) ( not ( = ?auto_38830 ?auto_38828 ) ) ( CLEAR ?auto_38829 ) ( ON ?auto_38828 ?auto_38833 ) ( CLEAR ?auto_38828 ) ( HAND-EMPTY ) ( not ( = ?auto_38828 ?auto_38833 ) ) ( not ( = ?auto_38829 ?auto_38833 ) ) ( not ( = ?auto_38832 ?auto_38833 ) ) ( not ( = ?auto_38831 ?auto_38833 ) ) ( not ( = ?auto_38830 ?auto_38833 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38828 ?auto_38833 )
      ( MAKE-2PILE ?auto_38828 ?auto_38829 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38834 - BLOCK
      ?auto_38835 - BLOCK
    )
    :vars
    (
      ?auto_38836 - BLOCK
      ?auto_38838 - BLOCK
      ?auto_38839 - BLOCK
      ?auto_38837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38834 ?auto_38835 ) ) ( not ( = ?auto_38834 ?auto_38836 ) ) ( not ( = ?auto_38835 ?auto_38836 ) ) ( ON-TABLE ?auto_38838 ) ( ON ?auto_38839 ?auto_38838 ) ( ON ?auto_38836 ?auto_38839 ) ( not ( = ?auto_38838 ?auto_38839 ) ) ( not ( = ?auto_38838 ?auto_38836 ) ) ( not ( = ?auto_38838 ?auto_38835 ) ) ( not ( = ?auto_38838 ?auto_38834 ) ) ( not ( = ?auto_38839 ?auto_38836 ) ) ( not ( = ?auto_38839 ?auto_38835 ) ) ( not ( = ?auto_38839 ?auto_38834 ) ) ( ON ?auto_38834 ?auto_38837 ) ( CLEAR ?auto_38834 ) ( not ( = ?auto_38834 ?auto_38837 ) ) ( not ( = ?auto_38835 ?auto_38837 ) ) ( not ( = ?auto_38836 ?auto_38837 ) ) ( not ( = ?auto_38838 ?auto_38837 ) ) ( not ( = ?auto_38839 ?auto_38837 ) ) ( HOLDING ?auto_38835 ) ( CLEAR ?auto_38836 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38838 ?auto_38839 ?auto_38836 ?auto_38835 )
      ( MAKE-2PILE ?auto_38834 ?auto_38835 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38840 - BLOCK
      ?auto_38841 - BLOCK
    )
    :vars
    (
      ?auto_38843 - BLOCK
      ?auto_38845 - BLOCK
      ?auto_38842 - BLOCK
      ?auto_38844 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38840 ?auto_38841 ) ) ( not ( = ?auto_38840 ?auto_38843 ) ) ( not ( = ?auto_38841 ?auto_38843 ) ) ( ON-TABLE ?auto_38845 ) ( ON ?auto_38842 ?auto_38845 ) ( ON ?auto_38843 ?auto_38842 ) ( not ( = ?auto_38845 ?auto_38842 ) ) ( not ( = ?auto_38845 ?auto_38843 ) ) ( not ( = ?auto_38845 ?auto_38841 ) ) ( not ( = ?auto_38845 ?auto_38840 ) ) ( not ( = ?auto_38842 ?auto_38843 ) ) ( not ( = ?auto_38842 ?auto_38841 ) ) ( not ( = ?auto_38842 ?auto_38840 ) ) ( ON ?auto_38840 ?auto_38844 ) ( not ( = ?auto_38840 ?auto_38844 ) ) ( not ( = ?auto_38841 ?auto_38844 ) ) ( not ( = ?auto_38843 ?auto_38844 ) ) ( not ( = ?auto_38845 ?auto_38844 ) ) ( not ( = ?auto_38842 ?auto_38844 ) ) ( CLEAR ?auto_38843 ) ( ON ?auto_38841 ?auto_38840 ) ( CLEAR ?auto_38841 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38844 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38844 ?auto_38840 )
      ( MAKE-2PILE ?auto_38840 ?auto_38841 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38846 - BLOCK
      ?auto_38847 - BLOCK
    )
    :vars
    (
      ?auto_38849 - BLOCK
      ?auto_38850 - BLOCK
      ?auto_38851 - BLOCK
      ?auto_38848 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38846 ?auto_38847 ) ) ( not ( = ?auto_38846 ?auto_38849 ) ) ( not ( = ?auto_38847 ?auto_38849 ) ) ( ON-TABLE ?auto_38850 ) ( ON ?auto_38851 ?auto_38850 ) ( not ( = ?auto_38850 ?auto_38851 ) ) ( not ( = ?auto_38850 ?auto_38849 ) ) ( not ( = ?auto_38850 ?auto_38847 ) ) ( not ( = ?auto_38850 ?auto_38846 ) ) ( not ( = ?auto_38851 ?auto_38849 ) ) ( not ( = ?auto_38851 ?auto_38847 ) ) ( not ( = ?auto_38851 ?auto_38846 ) ) ( ON ?auto_38846 ?auto_38848 ) ( not ( = ?auto_38846 ?auto_38848 ) ) ( not ( = ?auto_38847 ?auto_38848 ) ) ( not ( = ?auto_38849 ?auto_38848 ) ) ( not ( = ?auto_38850 ?auto_38848 ) ) ( not ( = ?auto_38851 ?auto_38848 ) ) ( ON ?auto_38847 ?auto_38846 ) ( CLEAR ?auto_38847 ) ( ON-TABLE ?auto_38848 ) ( HOLDING ?auto_38849 ) ( CLEAR ?auto_38851 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38850 ?auto_38851 ?auto_38849 )
      ( MAKE-2PILE ?auto_38846 ?auto_38847 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38852 - BLOCK
      ?auto_38853 - BLOCK
    )
    :vars
    (
      ?auto_38855 - BLOCK
      ?auto_38856 - BLOCK
      ?auto_38854 - BLOCK
      ?auto_38857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38852 ?auto_38853 ) ) ( not ( = ?auto_38852 ?auto_38855 ) ) ( not ( = ?auto_38853 ?auto_38855 ) ) ( ON-TABLE ?auto_38856 ) ( ON ?auto_38854 ?auto_38856 ) ( not ( = ?auto_38856 ?auto_38854 ) ) ( not ( = ?auto_38856 ?auto_38855 ) ) ( not ( = ?auto_38856 ?auto_38853 ) ) ( not ( = ?auto_38856 ?auto_38852 ) ) ( not ( = ?auto_38854 ?auto_38855 ) ) ( not ( = ?auto_38854 ?auto_38853 ) ) ( not ( = ?auto_38854 ?auto_38852 ) ) ( ON ?auto_38852 ?auto_38857 ) ( not ( = ?auto_38852 ?auto_38857 ) ) ( not ( = ?auto_38853 ?auto_38857 ) ) ( not ( = ?auto_38855 ?auto_38857 ) ) ( not ( = ?auto_38856 ?auto_38857 ) ) ( not ( = ?auto_38854 ?auto_38857 ) ) ( ON ?auto_38853 ?auto_38852 ) ( ON-TABLE ?auto_38857 ) ( CLEAR ?auto_38854 ) ( ON ?auto_38855 ?auto_38853 ) ( CLEAR ?auto_38855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38857 ?auto_38852 ?auto_38853 )
      ( MAKE-2PILE ?auto_38852 ?auto_38853 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38858 - BLOCK
      ?auto_38859 - BLOCK
    )
    :vars
    (
      ?auto_38863 - BLOCK
      ?auto_38861 - BLOCK
      ?auto_38862 - BLOCK
      ?auto_38860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38858 ?auto_38859 ) ) ( not ( = ?auto_38858 ?auto_38863 ) ) ( not ( = ?auto_38859 ?auto_38863 ) ) ( ON-TABLE ?auto_38861 ) ( not ( = ?auto_38861 ?auto_38862 ) ) ( not ( = ?auto_38861 ?auto_38863 ) ) ( not ( = ?auto_38861 ?auto_38859 ) ) ( not ( = ?auto_38861 ?auto_38858 ) ) ( not ( = ?auto_38862 ?auto_38863 ) ) ( not ( = ?auto_38862 ?auto_38859 ) ) ( not ( = ?auto_38862 ?auto_38858 ) ) ( ON ?auto_38858 ?auto_38860 ) ( not ( = ?auto_38858 ?auto_38860 ) ) ( not ( = ?auto_38859 ?auto_38860 ) ) ( not ( = ?auto_38863 ?auto_38860 ) ) ( not ( = ?auto_38861 ?auto_38860 ) ) ( not ( = ?auto_38862 ?auto_38860 ) ) ( ON ?auto_38859 ?auto_38858 ) ( ON-TABLE ?auto_38860 ) ( ON ?auto_38863 ?auto_38859 ) ( CLEAR ?auto_38863 ) ( HOLDING ?auto_38862 ) ( CLEAR ?auto_38861 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38861 ?auto_38862 )
      ( MAKE-2PILE ?auto_38858 ?auto_38859 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38864 - BLOCK
      ?auto_38865 - BLOCK
    )
    :vars
    (
      ?auto_38867 - BLOCK
      ?auto_38869 - BLOCK
      ?auto_38868 - BLOCK
      ?auto_38866 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38864 ?auto_38865 ) ) ( not ( = ?auto_38864 ?auto_38867 ) ) ( not ( = ?auto_38865 ?auto_38867 ) ) ( ON-TABLE ?auto_38869 ) ( not ( = ?auto_38869 ?auto_38868 ) ) ( not ( = ?auto_38869 ?auto_38867 ) ) ( not ( = ?auto_38869 ?auto_38865 ) ) ( not ( = ?auto_38869 ?auto_38864 ) ) ( not ( = ?auto_38868 ?auto_38867 ) ) ( not ( = ?auto_38868 ?auto_38865 ) ) ( not ( = ?auto_38868 ?auto_38864 ) ) ( ON ?auto_38864 ?auto_38866 ) ( not ( = ?auto_38864 ?auto_38866 ) ) ( not ( = ?auto_38865 ?auto_38866 ) ) ( not ( = ?auto_38867 ?auto_38866 ) ) ( not ( = ?auto_38869 ?auto_38866 ) ) ( not ( = ?auto_38868 ?auto_38866 ) ) ( ON ?auto_38865 ?auto_38864 ) ( ON-TABLE ?auto_38866 ) ( ON ?auto_38867 ?auto_38865 ) ( CLEAR ?auto_38869 ) ( ON ?auto_38868 ?auto_38867 ) ( CLEAR ?auto_38868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38866 ?auto_38864 ?auto_38865 ?auto_38867 )
      ( MAKE-2PILE ?auto_38864 ?auto_38865 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38870 - BLOCK
      ?auto_38871 - BLOCK
    )
    :vars
    (
      ?auto_38873 - BLOCK
      ?auto_38874 - BLOCK
      ?auto_38872 - BLOCK
      ?auto_38875 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38870 ?auto_38871 ) ) ( not ( = ?auto_38870 ?auto_38873 ) ) ( not ( = ?auto_38871 ?auto_38873 ) ) ( not ( = ?auto_38874 ?auto_38872 ) ) ( not ( = ?auto_38874 ?auto_38873 ) ) ( not ( = ?auto_38874 ?auto_38871 ) ) ( not ( = ?auto_38874 ?auto_38870 ) ) ( not ( = ?auto_38872 ?auto_38873 ) ) ( not ( = ?auto_38872 ?auto_38871 ) ) ( not ( = ?auto_38872 ?auto_38870 ) ) ( ON ?auto_38870 ?auto_38875 ) ( not ( = ?auto_38870 ?auto_38875 ) ) ( not ( = ?auto_38871 ?auto_38875 ) ) ( not ( = ?auto_38873 ?auto_38875 ) ) ( not ( = ?auto_38874 ?auto_38875 ) ) ( not ( = ?auto_38872 ?auto_38875 ) ) ( ON ?auto_38871 ?auto_38870 ) ( ON-TABLE ?auto_38875 ) ( ON ?auto_38873 ?auto_38871 ) ( ON ?auto_38872 ?auto_38873 ) ( CLEAR ?auto_38872 ) ( HOLDING ?auto_38874 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38874 )
      ( MAKE-2PILE ?auto_38870 ?auto_38871 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38876 - BLOCK
      ?auto_38877 - BLOCK
    )
    :vars
    (
      ?auto_38881 - BLOCK
      ?auto_38880 - BLOCK
      ?auto_38879 - BLOCK
      ?auto_38878 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38876 ?auto_38877 ) ) ( not ( = ?auto_38876 ?auto_38881 ) ) ( not ( = ?auto_38877 ?auto_38881 ) ) ( not ( = ?auto_38880 ?auto_38879 ) ) ( not ( = ?auto_38880 ?auto_38881 ) ) ( not ( = ?auto_38880 ?auto_38877 ) ) ( not ( = ?auto_38880 ?auto_38876 ) ) ( not ( = ?auto_38879 ?auto_38881 ) ) ( not ( = ?auto_38879 ?auto_38877 ) ) ( not ( = ?auto_38879 ?auto_38876 ) ) ( ON ?auto_38876 ?auto_38878 ) ( not ( = ?auto_38876 ?auto_38878 ) ) ( not ( = ?auto_38877 ?auto_38878 ) ) ( not ( = ?auto_38881 ?auto_38878 ) ) ( not ( = ?auto_38880 ?auto_38878 ) ) ( not ( = ?auto_38879 ?auto_38878 ) ) ( ON ?auto_38877 ?auto_38876 ) ( ON-TABLE ?auto_38878 ) ( ON ?auto_38881 ?auto_38877 ) ( ON ?auto_38879 ?auto_38881 ) ( ON ?auto_38880 ?auto_38879 ) ( CLEAR ?auto_38880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38878 ?auto_38876 ?auto_38877 ?auto_38881 ?auto_38879 )
      ( MAKE-2PILE ?auto_38876 ?auto_38877 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38884 - BLOCK
      ?auto_38885 - BLOCK
    )
    :vars
    (
      ?auto_38886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38886 ?auto_38885 ) ( CLEAR ?auto_38886 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38884 ) ( ON ?auto_38885 ?auto_38884 ) ( not ( = ?auto_38884 ?auto_38885 ) ) ( not ( = ?auto_38884 ?auto_38886 ) ) ( not ( = ?auto_38885 ?auto_38886 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38886 ?auto_38885 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38887 - BLOCK
      ?auto_38888 - BLOCK
    )
    :vars
    (
      ?auto_38889 - BLOCK
      ?auto_38890 - BLOCK
      ?auto_38891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38889 ?auto_38888 ) ( CLEAR ?auto_38889 ) ( ON-TABLE ?auto_38887 ) ( ON ?auto_38888 ?auto_38887 ) ( not ( = ?auto_38887 ?auto_38888 ) ) ( not ( = ?auto_38887 ?auto_38889 ) ) ( not ( = ?auto_38888 ?auto_38889 ) ) ( HOLDING ?auto_38890 ) ( CLEAR ?auto_38891 ) ( not ( = ?auto_38887 ?auto_38890 ) ) ( not ( = ?auto_38887 ?auto_38891 ) ) ( not ( = ?auto_38888 ?auto_38890 ) ) ( not ( = ?auto_38888 ?auto_38891 ) ) ( not ( = ?auto_38889 ?auto_38890 ) ) ( not ( = ?auto_38889 ?auto_38891 ) ) ( not ( = ?auto_38890 ?auto_38891 ) ) )
    :subtasks
    ( ( !STACK ?auto_38890 ?auto_38891 )
      ( MAKE-2PILE ?auto_38887 ?auto_38888 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38892 - BLOCK
      ?auto_38893 - BLOCK
    )
    :vars
    (
      ?auto_38895 - BLOCK
      ?auto_38896 - BLOCK
      ?auto_38894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38895 ?auto_38893 ) ( ON-TABLE ?auto_38892 ) ( ON ?auto_38893 ?auto_38892 ) ( not ( = ?auto_38892 ?auto_38893 ) ) ( not ( = ?auto_38892 ?auto_38895 ) ) ( not ( = ?auto_38893 ?auto_38895 ) ) ( CLEAR ?auto_38896 ) ( not ( = ?auto_38892 ?auto_38894 ) ) ( not ( = ?auto_38892 ?auto_38896 ) ) ( not ( = ?auto_38893 ?auto_38894 ) ) ( not ( = ?auto_38893 ?auto_38896 ) ) ( not ( = ?auto_38895 ?auto_38894 ) ) ( not ( = ?auto_38895 ?auto_38896 ) ) ( not ( = ?auto_38894 ?auto_38896 ) ) ( ON ?auto_38894 ?auto_38895 ) ( CLEAR ?auto_38894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38892 ?auto_38893 ?auto_38895 )
      ( MAKE-2PILE ?auto_38892 ?auto_38893 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38897 - BLOCK
      ?auto_38898 - BLOCK
    )
    :vars
    (
      ?auto_38899 - BLOCK
      ?auto_38901 - BLOCK
      ?auto_38900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38899 ?auto_38898 ) ( ON-TABLE ?auto_38897 ) ( ON ?auto_38898 ?auto_38897 ) ( not ( = ?auto_38897 ?auto_38898 ) ) ( not ( = ?auto_38897 ?auto_38899 ) ) ( not ( = ?auto_38898 ?auto_38899 ) ) ( not ( = ?auto_38897 ?auto_38901 ) ) ( not ( = ?auto_38897 ?auto_38900 ) ) ( not ( = ?auto_38898 ?auto_38901 ) ) ( not ( = ?auto_38898 ?auto_38900 ) ) ( not ( = ?auto_38899 ?auto_38901 ) ) ( not ( = ?auto_38899 ?auto_38900 ) ) ( not ( = ?auto_38901 ?auto_38900 ) ) ( ON ?auto_38901 ?auto_38899 ) ( CLEAR ?auto_38901 ) ( HOLDING ?auto_38900 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38900 )
      ( MAKE-2PILE ?auto_38897 ?auto_38898 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38902 - BLOCK
      ?auto_38903 - BLOCK
    )
    :vars
    (
      ?auto_38904 - BLOCK
      ?auto_38906 - BLOCK
      ?auto_38905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38904 ?auto_38903 ) ( ON-TABLE ?auto_38902 ) ( ON ?auto_38903 ?auto_38902 ) ( not ( = ?auto_38902 ?auto_38903 ) ) ( not ( = ?auto_38902 ?auto_38904 ) ) ( not ( = ?auto_38903 ?auto_38904 ) ) ( not ( = ?auto_38902 ?auto_38906 ) ) ( not ( = ?auto_38902 ?auto_38905 ) ) ( not ( = ?auto_38903 ?auto_38906 ) ) ( not ( = ?auto_38903 ?auto_38905 ) ) ( not ( = ?auto_38904 ?auto_38906 ) ) ( not ( = ?auto_38904 ?auto_38905 ) ) ( not ( = ?auto_38906 ?auto_38905 ) ) ( ON ?auto_38906 ?auto_38904 ) ( ON ?auto_38905 ?auto_38906 ) ( CLEAR ?auto_38905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38902 ?auto_38903 ?auto_38904 ?auto_38906 )
      ( MAKE-2PILE ?auto_38902 ?auto_38903 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38907 - BLOCK
      ?auto_38908 - BLOCK
    )
    :vars
    (
      ?auto_38909 - BLOCK
      ?auto_38910 - BLOCK
      ?auto_38911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38909 ?auto_38908 ) ( ON-TABLE ?auto_38907 ) ( ON ?auto_38908 ?auto_38907 ) ( not ( = ?auto_38907 ?auto_38908 ) ) ( not ( = ?auto_38907 ?auto_38909 ) ) ( not ( = ?auto_38908 ?auto_38909 ) ) ( not ( = ?auto_38907 ?auto_38910 ) ) ( not ( = ?auto_38907 ?auto_38911 ) ) ( not ( = ?auto_38908 ?auto_38910 ) ) ( not ( = ?auto_38908 ?auto_38911 ) ) ( not ( = ?auto_38909 ?auto_38910 ) ) ( not ( = ?auto_38909 ?auto_38911 ) ) ( not ( = ?auto_38910 ?auto_38911 ) ) ( ON ?auto_38910 ?auto_38909 ) ( HOLDING ?auto_38911 ) ( CLEAR ?auto_38910 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38907 ?auto_38908 ?auto_38909 ?auto_38910 ?auto_38911 )
      ( MAKE-2PILE ?auto_38907 ?auto_38908 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38912 - BLOCK
      ?auto_38913 - BLOCK
    )
    :vars
    (
      ?auto_38914 - BLOCK
      ?auto_38916 - BLOCK
      ?auto_38915 - BLOCK
      ?auto_38917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38914 ?auto_38913 ) ( ON-TABLE ?auto_38912 ) ( ON ?auto_38913 ?auto_38912 ) ( not ( = ?auto_38912 ?auto_38913 ) ) ( not ( = ?auto_38912 ?auto_38914 ) ) ( not ( = ?auto_38913 ?auto_38914 ) ) ( not ( = ?auto_38912 ?auto_38916 ) ) ( not ( = ?auto_38912 ?auto_38915 ) ) ( not ( = ?auto_38913 ?auto_38916 ) ) ( not ( = ?auto_38913 ?auto_38915 ) ) ( not ( = ?auto_38914 ?auto_38916 ) ) ( not ( = ?auto_38914 ?auto_38915 ) ) ( not ( = ?auto_38916 ?auto_38915 ) ) ( ON ?auto_38916 ?auto_38914 ) ( CLEAR ?auto_38916 ) ( ON ?auto_38915 ?auto_38917 ) ( CLEAR ?auto_38915 ) ( HAND-EMPTY ) ( not ( = ?auto_38912 ?auto_38917 ) ) ( not ( = ?auto_38913 ?auto_38917 ) ) ( not ( = ?auto_38914 ?auto_38917 ) ) ( not ( = ?auto_38916 ?auto_38917 ) ) ( not ( = ?auto_38915 ?auto_38917 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38915 ?auto_38917 )
      ( MAKE-2PILE ?auto_38912 ?auto_38913 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38918 - BLOCK
      ?auto_38919 - BLOCK
    )
    :vars
    (
      ?auto_38923 - BLOCK
      ?auto_38921 - BLOCK
      ?auto_38922 - BLOCK
      ?auto_38920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38923 ?auto_38919 ) ( ON-TABLE ?auto_38918 ) ( ON ?auto_38919 ?auto_38918 ) ( not ( = ?auto_38918 ?auto_38919 ) ) ( not ( = ?auto_38918 ?auto_38923 ) ) ( not ( = ?auto_38919 ?auto_38923 ) ) ( not ( = ?auto_38918 ?auto_38921 ) ) ( not ( = ?auto_38918 ?auto_38922 ) ) ( not ( = ?auto_38919 ?auto_38921 ) ) ( not ( = ?auto_38919 ?auto_38922 ) ) ( not ( = ?auto_38923 ?auto_38921 ) ) ( not ( = ?auto_38923 ?auto_38922 ) ) ( not ( = ?auto_38921 ?auto_38922 ) ) ( ON ?auto_38922 ?auto_38920 ) ( CLEAR ?auto_38922 ) ( not ( = ?auto_38918 ?auto_38920 ) ) ( not ( = ?auto_38919 ?auto_38920 ) ) ( not ( = ?auto_38923 ?auto_38920 ) ) ( not ( = ?auto_38921 ?auto_38920 ) ) ( not ( = ?auto_38922 ?auto_38920 ) ) ( HOLDING ?auto_38921 ) ( CLEAR ?auto_38923 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38918 ?auto_38919 ?auto_38923 ?auto_38921 )
      ( MAKE-2PILE ?auto_38918 ?auto_38919 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38924 - BLOCK
      ?auto_38925 - BLOCK
    )
    :vars
    (
      ?auto_38926 - BLOCK
      ?auto_38928 - BLOCK
      ?auto_38929 - BLOCK
      ?auto_38927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38926 ?auto_38925 ) ( ON-TABLE ?auto_38924 ) ( ON ?auto_38925 ?auto_38924 ) ( not ( = ?auto_38924 ?auto_38925 ) ) ( not ( = ?auto_38924 ?auto_38926 ) ) ( not ( = ?auto_38925 ?auto_38926 ) ) ( not ( = ?auto_38924 ?auto_38928 ) ) ( not ( = ?auto_38924 ?auto_38929 ) ) ( not ( = ?auto_38925 ?auto_38928 ) ) ( not ( = ?auto_38925 ?auto_38929 ) ) ( not ( = ?auto_38926 ?auto_38928 ) ) ( not ( = ?auto_38926 ?auto_38929 ) ) ( not ( = ?auto_38928 ?auto_38929 ) ) ( ON ?auto_38929 ?auto_38927 ) ( not ( = ?auto_38924 ?auto_38927 ) ) ( not ( = ?auto_38925 ?auto_38927 ) ) ( not ( = ?auto_38926 ?auto_38927 ) ) ( not ( = ?auto_38928 ?auto_38927 ) ) ( not ( = ?auto_38929 ?auto_38927 ) ) ( CLEAR ?auto_38926 ) ( ON ?auto_38928 ?auto_38929 ) ( CLEAR ?auto_38928 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38927 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38927 ?auto_38929 )
      ( MAKE-2PILE ?auto_38924 ?auto_38925 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38942 - BLOCK
      ?auto_38943 - BLOCK
    )
    :vars
    (
      ?auto_38947 - BLOCK
      ?auto_38944 - BLOCK
      ?auto_38946 - BLOCK
      ?auto_38945 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38942 ) ( not ( = ?auto_38942 ?auto_38943 ) ) ( not ( = ?auto_38942 ?auto_38947 ) ) ( not ( = ?auto_38943 ?auto_38947 ) ) ( not ( = ?auto_38942 ?auto_38944 ) ) ( not ( = ?auto_38942 ?auto_38946 ) ) ( not ( = ?auto_38943 ?auto_38944 ) ) ( not ( = ?auto_38943 ?auto_38946 ) ) ( not ( = ?auto_38947 ?auto_38944 ) ) ( not ( = ?auto_38947 ?auto_38946 ) ) ( not ( = ?auto_38944 ?auto_38946 ) ) ( ON ?auto_38946 ?auto_38945 ) ( not ( = ?auto_38942 ?auto_38945 ) ) ( not ( = ?auto_38943 ?auto_38945 ) ) ( not ( = ?auto_38947 ?auto_38945 ) ) ( not ( = ?auto_38944 ?auto_38945 ) ) ( not ( = ?auto_38946 ?auto_38945 ) ) ( ON ?auto_38944 ?auto_38946 ) ( ON-TABLE ?auto_38945 ) ( ON ?auto_38947 ?auto_38944 ) ( CLEAR ?auto_38947 ) ( HOLDING ?auto_38943 ) ( CLEAR ?auto_38942 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38942 ?auto_38943 ?auto_38947 )
      ( MAKE-2PILE ?auto_38942 ?auto_38943 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38948 - BLOCK
      ?auto_38949 - BLOCK
    )
    :vars
    (
      ?auto_38950 - BLOCK
      ?auto_38953 - BLOCK
      ?auto_38952 - BLOCK
      ?auto_38951 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38948 ) ( not ( = ?auto_38948 ?auto_38949 ) ) ( not ( = ?auto_38948 ?auto_38950 ) ) ( not ( = ?auto_38949 ?auto_38950 ) ) ( not ( = ?auto_38948 ?auto_38953 ) ) ( not ( = ?auto_38948 ?auto_38952 ) ) ( not ( = ?auto_38949 ?auto_38953 ) ) ( not ( = ?auto_38949 ?auto_38952 ) ) ( not ( = ?auto_38950 ?auto_38953 ) ) ( not ( = ?auto_38950 ?auto_38952 ) ) ( not ( = ?auto_38953 ?auto_38952 ) ) ( ON ?auto_38952 ?auto_38951 ) ( not ( = ?auto_38948 ?auto_38951 ) ) ( not ( = ?auto_38949 ?auto_38951 ) ) ( not ( = ?auto_38950 ?auto_38951 ) ) ( not ( = ?auto_38953 ?auto_38951 ) ) ( not ( = ?auto_38952 ?auto_38951 ) ) ( ON ?auto_38953 ?auto_38952 ) ( ON-TABLE ?auto_38951 ) ( ON ?auto_38950 ?auto_38953 ) ( CLEAR ?auto_38948 ) ( ON ?auto_38949 ?auto_38950 ) ( CLEAR ?auto_38949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38951 ?auto_38952 ?auto_38953 ?auto_38950 )
      ( MAKE-2PILE ?auto_38948 ?auto_38949 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38954 - BLOCK
      ?auto_38955 - BLOCK
    )
    :vars
    (
      ?auto_38957 - BLOCK
      ?auto_38958 - BLOCK
      ?auto_38956 - BLOCK
      ?auto_38959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38954 ?auto_38955 ) ) ( not ( = ?auto_38954 ?auto_38957 ) ) ( not ( = ?auto_38955 ?auto_38957 ) ) ( not ( = ?auto_38954 ?auto_38958 ) ) ( not ( = ?auto_38954 ?auto_38956 ) ) ( not ( = ?auto_38955 ?auto_38958 ) ) ( not ( = ?auto_38955 ?auto_38956 ) ) ( not ( = ?auto_38957 ?auto_38958 ) ) ( not ( = ?auto_38957 ?auto_38956 ) ) ( not ( = ?auto_38958 ?auto_38956 ) ) ( ON ?auto_38956 ?auto_38959 ) ( not ( = ?auto_38954 ?auto_38959 ) ) ( not ( = ?auto_38955 ?auto_38959 ) ) ( not ( = ?auto_38957 ?auto_38959 ) ) ( not ( = ?auto_38958 ?auto_38959 ) ) ( not ( = ?auto_38956 ?auto_38959 ) ) ( ON ?auto_38958 ?auto_38956 ) ( ON-TABLE ?auto_38959 ) ( ON ?auto_38957 ?auto_38958 ) ( ON ?auto_38955 ?auto_38957 ) ( CLEAR ?auto_38955 ) ( HOLDING ?auto_38954 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38954 )
      ( MAKE-2PILE ?auto_38954 ?auto_38955 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38960 - BLOCK
      ?auto_38961 - BLOCK
    )
    :vars
    (
      ?auto_38964 - BLOCK
      ?auto_38965 - BLOCK
      ?auto_38962 - BLOCK
      ?auto_38963 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38960 ?auto_38961 ) ) ( not ( = ?auto_38960 ?auto_38964 ) ) ( not ( = ?auto_38961 ?auto_38964 ) ) ( not ( = ?auto_38960 ?auto_38965 ) ) ( not ( = ?auto_38960 ?auto_38962 ) ) ( not ( = ?auto_38961 ?auto_38965 ) ) ( not ( = ?auto_38961 ?auto_38962 ) ) ( not ( = ?auto_38964 ?auto_38965 ) ) ( not ( = ?auto_38964 ?auto_38962 ) ) ( not ( = ?auto_38965 ?auto_38962 ) ) ( ON ?auto_38962 ?auto_38963 ) ( not ( = ?auto_38960 ?auto_38963 ) ) ( not ( = ?auto_38961 ?auto_38963 ) ) ( not ( = ?auto_38964 ?auto_38963 ) ) ( not ( = ?auto_38965 ?auto_38963 ) ) ( not ( = ?auto_38962 ?auto_38963 ) ) ( ON ?auto_38965 ?auto_38962 ) ( ON-TABLE ?auto_38963 ) ( ON ?auto_38964 ?auto_38965 ) ( ON ?auto_38961 ?auto_38964 ) ( ON ?auto_38960 ?auto_38961 ) ( CLEAR ?auto_38960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38963 ?auto_38962 ?auto_38965 ?auto_38964 ?auto_38961 )
      ( MAKE-2PILE ?auto_38960 ?auto_38961 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38969 - BLOCK
      ?auto_38970 - BLOCK
      ?auto_38971 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_38971 ) ( CLEAR ?auto_38970 ) ( ON-TABLE ?auto_38969 ) ( ON ?auto_38970 ?auto_38969 ) ( not ( = ?auto_38969 ?auto_38970 ) ) ( not ( = ?auto_38969 ?auto_38971 ) ) ( not ( = ?auto_38970 ?auto_38971 ) ) )
    :subtasks
    ( ( !STACK ?auto_38971 ?auto_38970 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38972 - BLOCK
      ?auto_38973 - BLOCK
      ?auto_38974 - BLOCK
    )
    :vars
    (
      ?auto_38975 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_38973 ) ( ON-TABLE ?auto_38972 ) ( ON ?auto_38973 ?auto_38972 ) ( not ( = ?auto_38972 ?auto_38973 ) ) ( not ( = ?auto_38972 ?auto_38974 ) ) ( not ( = ?auto_38973 ?auto_38974 ) ) ( ON ?auto_38974 ?auto_38975 ) ( CLEAR ?auto_38974 ) ( HAND-EMPTY ) ( not ( = ?auto_38972 ?auto_38975 ) ) ( not ( = ?auto_38973 ?auto_38975 ) ) ( not ( = ?auto_38974 ?auto_38975 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38974 ?auto_38975 )
      ( MAKE-3PILE ?auto_38972 ?auto_38973 ?auto_38974 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38976 - BLOCK
      ?auto_38977 - BLOCK
      ?auto_38978 - BLOCK
    )
    :vars
    (
      ?auto_38979 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38976 ) ( not ( = ?auto_38976 ?auto_38977 ) ) ( not ( = ?auto_38976 ?auto_38978 ) ) ( not ( = ?auto_38977 ?auto_38978 ) ) ( ON ?auto_38978 ?auto_38979 ) ( CLEAR ?auto_38978 ) ( not ( = ?auto_38976 ?auto_38979 ) ) ( not ( = ?auto_38977 ?auto_38979 ) ) ( not ( = ?auto_38978 ?auto_38979 ) ) ( HOLDING ?auto_38977 ) ( CLEAR ?auto_38976 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38976 ?auto_38977 )
      ( MAKE-3PILE ?auto_38976 ?auto_38977 ?auto_38978 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38980 - BLOCK
      ?auto_38981 - BLOCK
      ?auto_38982 - BLOCK
    )
    :vars
    (
      ?auto_38983 - BLOCK
      ?auto_38984 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38980 ) ( not ( = ?auto_38980 ?auto_38981 ) ) ( not ( = ?auto_38980 ?auto_38982 ) ) ( not ( = ?auto_38981 ?auto_38982 ) ) ( ON ?auto_38982 ?auto_38983 ) ( not ( = ?auto_38980 ?auto_38983 ) ) ( not ( = ?auto_38981 ?auto_38983 ) ) ( not ( = ?auto_38982 ?auto_38983 ) ) ( CLEAR ?auto_38980 ) ( ON ?auto_38981 ?auto_38982 ) ( CLEAR ?auto_38981 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38984 ) ( ON ?auto_38983 ?auto_38984 ) ( not ( = ?auto_38984 ?auto_38983 ) ) ( not ( = ?auto_38984 ?auto_38982 ) ) ( not ( = ?auto_38984 ?auto_38981 ) ) ( not ( = ?auto_38980 ?auto_38984 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38984 ?auto_38983 ?auto_38982 )
      ( MAKE-3PILE ?auto_38980 ?auto_38981 ?auto_38982 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38985 - BLOCK
      ?auto_38986 - BLOCK
      ?auto_38987 - BLOCK
    )
    :vars
    (
      ?auto_38989 - BLOCK
      ?auto_38988 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38985 ?auto_38986 ) ) ( not ( = ?auto_38985 ?auto_38987 ) ) ( not ( = ?auto_38986 ?auto_38987 ) ) ( ON ?auto_38987 ?auto_38989 ) ( not ( = ?auto_38985 ?auto_38989 ) ) ( not ( = ?auto_38986 ?auto_38989 ) ) ( not ( = ?auto_38987 ?auto_38989 ) ) ( ON ?auto_38986 ?auto_38987 ) ( CLEAR ?auto_38986 ) ( ON-TABLE ?auto_38988 ) ( ON ?auto_38989 ?auto_38988 ) ( not ( = ?auto_38988 ?auto_38989 ) ) ( not ( = ?auto_38988 ?auto_38987 ) ) ( not ( = ?auto_38988 ?auto_38986 ) ) ( not ( = ?auto_38985 ?auto_38988 ) ) ( HOLDING ?auto_38985 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38985 )
      ( MAKE-3PILE ?auto_38985 ?auto_38986 ?auto_38987 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38990 - BLOCK
      ?auto_38991 - BLOCK
      ?auto_38992 - BLOCK
    )
    :vars
    (
      ?auto_38994 - BLOCK
      ?auto_38993 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38990 ?auto_38991 ) ) ( not ( = ?auto_38990 ?auto_38992 ) ) ( not ( = ?auto_38991 ?auto_38992 ) ) ( ON ?auto_38992 ?auto_38994 ) ( not ( = ?auto_38990 ?auto_38994 ) ) ( not ( = ?auto_38991 ?auto_38994 ) ) ( not ( = ?auto_38992 ?auto_38994 ) ) ( ON ?auto_38991 ?auto_38992 ) ( ON-TABLE ?auto_38993 ) ( ON ?auto_38994 ?auto_38993 ) ( not ( = ?auto_38993 ?auto_38994 ) ) ( not ( = ?auto_38993 ?auto_38992 ) ) ( not ( = ?auto_38993 ?auto_38991 ) ) ( not ( = ?auto_38990 ?auto_38993 ) ) ( ON ?auto_38990 ?auto_38991 ) ( CLEAR ?auto_38990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38993 ?auto_38994 ?auto_38992 ?auto_38991 )
      ( MAKE-3PILE ?auto_38990 ?auto_38991 ?auto_38992 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38995 - BLOCK
      ?auto_38996 - BLOCK
      ?auto_38997 - BLOCK
    )
    :vars
    (
      ?auto_38998 - BLOCK
      ?auto_38999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38995 ?auto_38996 ) ) ( not ( = ?auto_38995 ?auto_38997 ) ) ( not ( = ?auto_38996 ?auto_38997 ) ) ( ON ?auto_38997 ?auto_38998 ) ( not ( = ?auto_38995 ?auto_38998 ) ) ( not ( = ?auto_38996 ?auto_38998 ) ) ( not ( = ?auto_38997 ?auto_38998 ) ) ( ON ?auto_38996 ?auto_38997 ) ( ON-TABLE ?auto_38999 ) ( ON ?auto_38998 ?auto_38999 ) ( not ( = ?auto_38999 ?auto_38998 ) ) ( not ( = ?auto_38999 ?auto_38997 ) ) ( not ( = ?auto_38999 ?auto_38996 ) ) ( not ( = ?auto_38995 ?auto_38999 ) ) ( HOLDING ?auto_38995 ) ( CLEAR ?auto_38996 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38999 ?auto_38998 ?auto_38997 ?auto_38996 ?auto_38995 )
      ( MAKE-3PILE ?auto_38995 ?auto_38996 ?auto_38997 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39000 - BLOCK
      ?auto_39001 - BLOCK
      ?auto_39002 - BLOCK
    )
    :vars
    (
      ?auto_39004 - BLOCK
      ?auto_39003 - BLOCK
      ?auto_39005 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39000 ?auto_39001 ) ) ( not ( = ?auto_39000 ?auto_39002 ) ) ( not ( = ?auto_39001 ?auto_39002 ) ) ( ON ?auto_39002 ?auto_39004 ) ( not ( = ?auto_39000 ?auto_39004 ) ) ( not ( = ?auto_39001 ?auto_39004 ) ) ( not ( = ?auto_39002 ?auto_39004 ) ) ( ON ?auto_39001 ?auto_39002 ) ( ON-TABLE ?auto_39003 ) ( ON ?auto_39004 ?auto_39003 ) ( not ( = ?auto_39003 ?auto_39004 ) ) ( not ( = ?auto_39003 ?auto_39002 ) ) ( not ( = ?auto_39003 ?auto_39001 ) ) ( not ( = ?auto_39000 ?auto_39003 ) ) ( CLEAR ?auto_39001 ) ( ON ?auto_39000 ?auto_39005 ) ( CLEAR ?auto_39000 ) ( HAND-EMPTY ) ( not ( = ?auto_39000 ?auto_39005 ) ) ( not ( = ?auto_39001 ?auto_39005 ) ) ( not ( = ?auto_39002 ?auto_39005 ) ) ( not ( = ?auto_39004 ?auto_39005 ) ) ( not ( = ?auto_39003 ?auto_39005 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39000 ?auto_39005 )
      ( MAKE-3PILE ?auto_39000 ?auto_39001 ?auto_39002 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39006 - BLOCK
      ?auto_39007 - BLOCK
      ?auto_39008 - BLOCK
    )
    :vars
    (
      ?auto_39009 - BLOCK
      ?auto_39010 - BLOCK
      ?auto_39011 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39006 ?auto_39007 ) ) ( not ( = ?auto_39006 ?auto_39008 ) ) ( not ( = ?auto_39007 ?auto_39008 ) ) ( ON ?auto_39008 ?auto_39009 ) ( not ( = ?auto_39006 ?auto_39009 ) ) ( not ( = ?auto_39007 ?auto_39009 ) ) ( not ( = ?auto_39008 ?auto_39009 ) ) ( ON-TABLE ?auto_39010 ) ( ON ?auto_39009 ?auto_39010 ) ( not ( = ?auto_39010 ?auto_39009 ) ) ( not ( = ?auto_39010 ?auto_39008 ) ) ( not ( = ?auto_39010 ?auto_39007 ) ) ( not ( = ?auto_39006 ?auto_39010 ) ) ( ON ?auto_39006 ?auto_39011 ) ( CLEAR ?auto_39006 ) ( not ( = ?auto_39006 ?auto_39011 ) ) ( not ( = ?auto_39007 ?auto_39011 ) ) ( not ( = ?auto_39008 ?auto_39011 ) ) ( not ( = ?auto_39009 ?auto_39011 ) ) ( not ( = ?auto_39010 ?auto_39011 ) ) ( HOLDING ?auto_39007 ) ( CLEAR ?auto_39008 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39010 ?auto_39009 ?auto_39008 ?auto_39007 )
      ( MAKE-3PILE ?auto_39006 ?auto_39007 ?auto_39008 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39012 - BLOCK
      ?auto_39013 - BLOCK
      ?auto_39014 - BLOCK
    )
    :vars
    (
      ?auto_39017 - BLOCK
      ?auto_39016 - BLOCK
      ?auto_39015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39012 ?auto_39013 ) ) ( not ( = ?auto_39012 ?auto_39014 ) ) ( not ( = ?auto_39013 ?auto_39014 ) ) ( ON ?auto_39014 ?auto_39017 ) ( not ( = ?auto_39012 ?auto_39017 ) ) ( not ( = ?auto_39013 ?auto_39017 ) ) ( not ( = ?auto_39014 ?auto_39017 ) ) ( ON-TABLE ?auto_39016 ) ( ON ?auto_39017 ?auto_39016 ) ( not ( = ?auto_39016 ?auto_39017 ) ) ( not ( = ?auto_39016 ?auto_39014 ) ) ( not ( = ?auto_39016 ?auto_39013 ) ) ( not ( = ?auto_39012 ?auto_39016 ) ) ( ON ?auto_39012 ?auto_39015 ) ( not ( = ?auto_39012 ?auto_39015 ) ) ( not ( = ?auto_39013 ?auto_39015 ) ) ( not ( = ?auto_39014 ?auto_39015 ) ) ( not ( = ?auto_39017 ?auto_39015 ) ) ( not ( = ?auto_39016 ?auto_39015 ) ) ( CLEAR ?auto_39014 ) ( ON ?auto_39013 ?auto_39012 ) ( CLEAR ?auto_39013 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39015 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39015 ?auto_39012 )
      ( MAKE-3PILE ?auto_39012 ?auto_39013 ?auto_39014 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39018 - BLOCK
      ?auto_39019 - BLOCK
      ?auto_39020 - BLOCK
    )
    :vars
    (
      ?auto_39022 - BLOCK
      ?auto_39023 - BLOCK
      ?auto_39021 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39018 ?auto_39019 ) ) ( not ( = ?auto_39018 ?auto_39020 ) ) ( not ( = ?auto_39019 ?auto_39020 ) ) ( not ( = ?auto_39018 ?auto_39022 ) ) ( not ( = ?auto_39019 ?auto_39022 ) ) ( not ( = ?auto_39020 ?auto_39022 ) ) ( ON-TABLE ?auto_39023 ) ( ON ?auto_39022 ?auto_39023 ) ( not ( = ?auto_39023 ?auto_39022 ) ) ( not ( = ?auto_39023 ?auto_39020 ) ) ( not ( = ?auto_39023 ?auto_39019 ) ) ( not ( = ?auto_39018 ?auto_39023 ) ) ( ON ?auto_39018 ?auto_39021 ) ( not ( = ?auto_39018 ?auto_39021 ) ) ( not ( = ?auto_39019 ?auto_39021 ) ) ( not ( = ?auto_39020 ?auto_39021 ) ) ( not ( = ?auto_39022 ?auto_39021 ) ) ( not ( = ?auto_39023 ?auto_39021 ) ) ( ON ?auto_39019 ?auto_39018 ) ( CLEAR ?auto_39019 ) ( ON-TABLE ?auto_39021 ) ( HOLDING ?auto_39020 ) ( CLEAR ?auto_39022 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39023 ?auto_39022 ?auto_39020 )
      ( MAKE-3PILE ?auto_39018 ?auto_39019 ?auto_39020 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39024 - BLOCK
      ?auto_39025 - BLOCK
      ?auto_39026 - BLOCK
    )
    :vars
    (
      ?auto_39029 - BLOCK
      ?auto_39027 - BLOCK
      ?auto_39028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39024 ?auto_39025 ) ) ( not ( = ?auto_39024 ?auto_39026 ) ) ( not ( = ?auto_39025 ?auto_39026 ) ) ( not ( = ?auto_39024 ?auto_39029 ) ) ( not ( = ?auto_39025 ?auto_39029 ) ) ( not ( = ?auto_39026 ?auto_39029 ) ) ( ON-TABLE ?auto_39027 ) ( ON ?auto_39029 ?auto_39027 ) ( not ( = ?auto_39027 ?auto_39029 ) ) ( not ( = ?auto_39027 ?auto_39026 ) ) ( not ( = ?auto_39027 ?auto_39025 ) ) ( not ( = ?auto_39024 ?auto_39027 ) ) ( ON ?auto_39024 ?auto_39028 ) ( not ( = ?auto_39024 ?auto_39028 ) ) ( not ( = ?auto_39025 ?auto_39028 ) ) ( not ( = ?auto_39026 ?auto_39028 ) ) ( not ( = ?auto_39029 ?auto_39028 ) ) ( not ( = ?auto_39027 ?auto_39028 ) ) ( ON ?auto_39025 ?auto_39024 ) ( ON-TABLE ?auto_39028 ) ( CLEAR ?auto_39029 ) ( ON ?auto_39026 ?auto_39025 ) ( CLEAR ?auto_39026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39028 ?auto_39024 ?auto_39025 )
      ( MAKE-3PILE ?auto_39024 ?auto_39025 ?auto_39026 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39030 - BLOCK
      ?auto_39031 - BLOCK
      ?auto_39032 - BLOCK
    )
    :vars
    (
      ?auto_39033 - BLOCK
      ?auto_39034 - BLOCK
      ?auto_39035 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39030 ?auto_39031 ) ) ( not ( = ?auto_39030 ?auto_39032 ) ) ( not ( = ?auto_39031 ?auto_39032 ) ) ( not ( = ?auto_39030 ?auto_39033 ) ) ( not ( = ?auto_39031 ?auto_39033 ) ) ( not ( = ?auto_39032 ?auto_39033 ) ) ( ON-TABLE ?auto_39034 ) ( not ( = ?auto_39034 ?auto_39033 ) ) ( not ( = ?auto_39034 ?auto_39032 ) ) ( not ( = ?auto_39034 ?auto_39031 ) ) ( not ( = ?auto_39030 ?auto_39034 ) ) ( ON ?auto_39030 ?auto_39035 ) ( not ( = ?auto_39030 ?auto_39035 ) ) ( not ( = ?auto_39031 ?auto_39035 ) ) ( not ( = ?auto_39032 ?auto_39035 ) ) ( not ( = ?auto_39033 ?auto_39035 ) ) ( not ( = ?auto_39034 ?auto_39035 ) ) ( ON ?auto_39031 ?auto_39030 ) ( ON-TABLE ?auto_39035 ) ( ON ?auto_39032 ?auto_39031 ) ( CLEAR ?auto_39032 ) ( HOLDING ?auto_39033 ) ( CLEAR ?auto_39034 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39034 ?auto_39033 )
      ( MAKE-3PILE ?auto_39030 ?auto_39031 ?auto_39032 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39036 - BLOCK
      ?auto_39037 - BLOCK
      ?auto_39038 - BLOCK
    )
    :vars
    (
      ?auto_39039 - BLOCK
      ?auto_39040 - BLOCK
      ?auto_39041 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39036 ?auto_39037 ) ) ( not ( = ?auto_39036 ?auto_39038 ) ) ( not ( = ?auto_39037 ?auto_39038 ) ) ( not ( = ?auto_39036 ?auto_39039 ) ) ( not ( = ?auto_39037 ?auto_39039 ) ) ( not ( = ?auto_39038 ?auto_39039 ) ) ( ON-TABLE ?auto_39040 ) ( not ( = ?auto_39040 ?auto_39039 ) ) ( not ( = ?auto_39040 ?auto_39038 ) ) ( not ( = ?auto_39040 ?auto_39037 ) ) ( not ( = ?auto_39036 ?auto_39040 ) ) ( ON ?auto_39036 ?auto_39041 ) ( not ( = ?auto_39036 ?auto_39041 ) ) ( not ( = ?auto_39037 ?auto_39041 ) ) ( not ( = ?auto_39038 ?auto_39041 ) ) ( not ( = ?auto_39039 ?auto_39041 ) ) ( not ( = ?auto_39040 ?auto_39041 ) ) ( ON ?auto_39037 ?auto_39036 ) ( ON-TABLE ?auto_39041 ) ( ON ?auto_39038 ?auto_39037 ) ( CLEAR ?auto_39040 ) ( ON ?auto_39039 ?auto_39038 ) ( CLEAR ?auto_39039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39041 ?auto_39036 ?auto_39037 ?auto_39038 )
      ( MAKE-3PILE ?auto_39036 ?auto_39037 ?auto_39038 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39042 - BLOCK
      ?auto_39043 - BLOCK
      ?auto_39044 - BLOCK
    )
    :vars
    (
      ?auto_39045 - BLOCK
      ?auto_39047 - BLOCK
      ?auto_39046 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39042 ?auto_39043 ) ) ( not ( = ?auto_39042 ?auto_39044 ) ) ( not ( = ?auto_39043 ?auto_39044 ) ) ( not ( = ?auto_39042 ?auto_39045 ) ) ( not ( = ?auto_39043 ?auto_39045 ) ) ( not ( = ?auto_39044 ?auto_39045 ) ) ( not ( = ?auto_39047 ?auto_39045 ) ) ( not ( = ?auto_39047 ?auto_39044 ) ) ( not ( = ?auto_39047 ?auto_39043 ) ) ( not ( = ?auto_39042 ?auto_39047 ) ) ( ON ?auto_39042 ?auto_39046 ) ( not ( = ?auto_39042 ?auto_39046 ) ) ( not ( = ?auto_39043 ?auto_39046 ) ) ( not ( = ?auto_39044 ?auto_39046 ) ) ( not ( = ?auto_39045 ?auto_39046 ) ) ( not ( = ?auto_39047 ?auto_39046 ) ) ( ON ?auto_39043 ?auto_39042 ) ( ON-TABLE ?auto_39046 ) ( ON ?auto_39044 ?auto_39043 ) ( ON ?auto_39045 ?auto_39044 ) ( CLEAR ?auto_39045 ) ( HOLDING ?auto_39047 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39047 )
      ( MAKE-3PILE ?auto_39042 ?auto_39043 ?auto_39044 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39048 - BLOCK
      ?auto_39049 - BLOCK
      ?auto_39050 - BLOCK
    )
    :vars
    (
      ?auto_39052 - BLOCK
      ?auto_39053 - BLOCK
      ?auto_39051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39048 ?auto_39049 ) ) ( not ( = ?auto_39048 ?auto_39050 ) ) ( not ( = ?auto_39049 ?auto_39050 ) ) ( not ( = ?auto_39048 ?auto_39052 ) ) ( not ( = ?auto_39049 ?auto_39052 ) ) ( not ( = ?auto_39050 ?auto_39052 ) ) ( not ( = ?auto_39053 ?auto_39052 ) ) ( not ( = ?auto_39053 ?auto_39050 ) ) ( not ( = ?auto_39053 ?auto_39049 ) ) ( not ( = ?auto_39048 ?auto_39053 ) ) ( ON ?auto_39048 ?auto_39051 ) ( not ( = ?auto_39048 ?auto_39051 ) ) ( not ( = ?auto_39049 ?auto_39051 ) ) ( not ( = ?auto_39050 ?auto_39051 ) ) ( not ( = ?auto_39052 ?auto_39051 ) ) ( not ( = ?auto_39053 ?auto_39051 ) ) ( ON ?auto_39049 ?auto_39048 ) ( ON-TABLE ?auto_39051 ) ( ON ?auto_39050 ?auto_39049 ) ( ON ?auto_39052 ?auto_39050 ) ( ON ?auto_39053 ?auto_39052 ) ( CLEAR ?auto_39053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39051 ?auto_39048 ?auto_39049 ?auto_39050 ?auto_39052 )
      ( MAKE-3PILE ?auto_39048 ?auto_39049 ?auto_39050 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39055 - BLOCK
    )
    :vars
    (
      ?auto_39056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39056 ?auto_39055 ) ( CLEAR ?auto_39056 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39055 ) ( not ( = ?auto_39055 ?auto_39056 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39056 ?auto_39055 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39057 - BLOCK
    )
    :vars
    (
      ?auto_39058 - BLOCK
      ?auto_39059 - BLOCK
      ?auto_39060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39058 ?auto_39057 ) ( CLEAR ?auto_39058 ) ( ON-TABLE ?auto_39057 ) ( not ( = ?auto_39057 ?auto_39058 ) ) ( HOLDING ?auto_39059 ) ( CLEAR ?auto_39060 ) ( not ( = ?auto_39057 ?auto_39059 ) ) ( not ( = ?auto_39057 ?auto_39060 ) ) ( not ( = ?auto_39058 ?auto_39059 ) ) ( not ( = ?auto_39058 ?auto_39060 ) ) ( not ( = ?auto_39059 ?auto_39060 ) ) )
    :subtasks
    ( ( !STACK ?auto_39059 ?auto_39060 )
      ( MAKE-1PILE ?auto_39057 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39061 - BLOCK
    )
    :vars
    (
      ?auto_39063 - BLOCK
      ?auto_39064 - BLOCK
      ?auto_39062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39063 ?auto_39061 ) ( ON-TABLE ?auto_39061 ) ( not ( = ?auto_39061 ?auto_39063 ) ) ( CLEAR ?auto_39064 ) ( not ( = ?auto_39061 ?auto_39062 ) ) ( not ( = ?auto_39061 ?auto_39064 ) ) ( not ( = ?auto_39063 ?auto_39062 ) ) ( not ( = ?auto_39063 ?auto_39064 ) ) ( not ( = ?auto_39062 ?auto_39064 ) ) ( ON ?auto_39062 ?auto_39063 ) ( CLEAR ?auto_39062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39061 ?auto_39063 )
      ( MAKE-1PILE ?auto_39061 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39065 - BLOCK
    )
    :vars
    (
      ?auto_39066 - BLOCK
      ?auto_39068 - BLOCK
      ?auto_39067 - BLOCK
      ?auto_39069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39066 ?auto_39065 ) ( ON-TABLE ?auto_39065 ) ( not ( = ?auto_39065 ?auto_39066 ) ) ( not ( = ?auto_39065 ?auto_39068 ) ) ( not ( = ?auto_39065 ?auto_39067 ) ) ( not ( = ?auto_39066 ?auto_39068 ) ) ( not ( = ?auto_39066 ?auto_39067 ) ) ( not ( = ?auto_39068 ?auto_39067 ) ) ( ON ?auto_39068 ?auto_39066 ) ( CLEAR ?auto_39068 ) ( HOLDING ?auto_39067 ) ( CLEAR ?auto_39069 ) ( ON-TABLE ?auto_39069 ) ( not ( = ?auto_39069 ?auto_39067 ) ) ( not ( = ?auto_39065 ?auto_39069 ) ) ( not ( = ?auto_39066 ?auto_39069 ) ) ( not ( = ?auto_39068 ?auto_39069 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39069 ?auto_39067 )
      ( MAKE-1PILE ?auto_39065 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39070 - BLOCK
    )
    :vars
    (
      ?auto_39072 - BLOCK
      ?auto_39071 - BLOCK
      ?auto_39074 - BLOCK
      ?auto_39073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39072 ?auto_39070 ) ( ON-TABLE ?auto_39070 ) ( not ( = ?auto_39070 ?auto_39072 ) ) ( not ( = ?auto_39070 ?auto_39071 ) ) ( not ( = ?auto_39070 ?auto_39074 ) ) ( not ( = ?auto_39072 ?auto_39071 ) ) ( not ( = ?auto_39072 ?auto_39074 ) ) ( not ( = ?auto_39071 ?auto_39074 ) ) ( ON ?auto_39071 ?auto_39072 ) ( CLEAR ?auto_39073 ) ( ON-TABLE ?auto_39073 ) ( not ( = ?auto_39073 ?auto_39074 ) ) ( not ( = ?auto_39070 ?auto_39073 ) ) ( not ( = ?auto_39072 ?auto_39073 ) ) ( not ( = ?auto_39071 ?auto_39073 ) ) ( ON ?auto_39074 ?auto_39071 ) ( CLEAR ?auto_39074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39070 ?auto_39072 ?auto_39071 )
      ( MAKE-1PILE ?auto_39070 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39075 - BLOCK
    )
    :vars
    (
      ?auto_39076 - BLOCK
      ?auto_39077 - BLOCK
      ?auto_39078 - BLOCK
      ?auto_39079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39076 ?auto_39075 ) ( ON-TABLE ?auto_39075 ) ( not ( = ?auto_39075 ?auto_39076 ) ) ( not ( = ?auto_39075 ?auto_39077 ) ) ( not ( = ?auto_39075 ?auto_39078 ) ) ( not ( = ?auto_39076 ?auto_39077 ) ) ( not ( = ?auto_39076 ?auto_39078 ) ) ( not ( = ?auto_39077 ?auto_39078 ) ) ( ON ?auto_39077 ?auto_39076 ) ( not ( = ?auto_39079 ?auto_39078 ) ) ( not ( = ?auto_39075 ?auto_39079 ) ) ( not ( = ?auto_39076 ?auto_39079 ) ) ( not ( = ?auto_39077 ?auto_39079 ) ) ( ON ?auto_39078 ?auto_39077 ) ( CLEAR ?auto_39078 ) ( HOLDING ?auto_39079 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39079 )
      ( MAKE-1PILE ?auto_39075 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39080 - BLOCK
    )
    :vars
    (
      ?auto_39084 - BLOCK
      ?auto_39081 - BLOCK
      ?auto_39082 - BLOCK
      ?auto_39083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39084 ?auto_39080 ) ( ON-TABLE ?auto_39080 ) ( not ( = ?auto_39080 ?auto_39084 ) ) ( not ( = ?auto_39080 ?auto_39081 ) ) ( not ( = ?auto_39080 ?auto_39082 ) ) ( not ( = ?auto_39084 ?auto_39081 ) ) ( not ( = ?auto_39084 ?auto_39082 ) ) ( not ( = ?auto_39081 ?auto_39082 ) ) ( ON ?auto_39081 ?auto_39084 ) ( not ( = ?auto_39083 ?auto_39082 ) ) ( not ( = ?auto_39080 ?auto_39083 ) ) ( not ( = ?auto_39084 ?auto_39083 ) ) ( not ( = ?auto_39081 ?auto_39083 ) ) ( ON ?auto_39082 ?auto_39081 ) ( ON ?auto_39083 ?auto_39082 ) ( CLEAR ?auto_39083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39080 ?auto_39084 ?auto_39081 ?auto_39082 )
      ( MAKE-1PILE ?auto_39080 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39085 - BLOCK
    )
    :vars
    (
      ?auto_39086 - BLOCK
      ?auto_39088 - BLOCK
      ?auto_39089 - BLOCK
      ?auto_39087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39086 ?auto_39085 ) ( ON-TABLE ?auto_39085 ) ( not ( = ?auto_39085 ?auto_39086 ) ) ( not ( = ?auto_39085 ?auto_39088 ) ) ( not ( = ?auto_39085 ?auto_39089 ) ) ( not ( = ?auto_39086 ?auto_39088 ) ) ( not ( = ?auto_39086 ?auto_39089 ) ) ( not ( = ?auto_39088 ?auto_39089 ) ) ( ON ?auto_39088 ?auto_39086 ) ( not ( = ?auto_39087 ?auto_39089 ) ) ( not ( = ?auto_39085 ?auto_39087 ) ) ( not ( = ?auto_39086 ?auto_39087 ) ) ( not ( = ?auto_39088 ?auto_39087 ) ) ( ON ?auto_39089 ?auto_39088 ) ( HOLDING ?auto_39087 ) ( CLEAR ?auto_39089 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39085 ?auto_39086 ?auto_39088 ?auto_39089 ?auto_39087 )
      ( MAKE-1PILE ?auto_39085 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39090 - BLOCK
    )
    :vars
    (
      ?auto_39094 - BLOCK
      ?auto_39091 - BLOCK
      ?auto_39093 - BLOCK
      ?auto_39092 - BLOCK
      ?auto_39095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39094 ?auto_39090 ) ( ON-TABLE ?auto_39090 ) ( not ( = ?auto_39090 ?auto_39094 ) ) ( not ( = ?auto_39090 ?auto_39091 ) ) ( not ( = ?auto_39090 ?auto_39093 ) ) ( not ( = ?auto_39094 ?auto_39091 ) ) ( not ( = ?auto_39094 ?auto_39093 ) ) ( not ( = ?auto_39091 ?auto_39093 ) ) ( ON ?auto_39091 ?auto_39094 ) ( not ( = ?auto_39092 ?auto_39093 ) ) ( not ( = ?auto_39090 ?auto_39092 ) ) ( not ( = ?auto_39094 ?auto_39092 ) ) ( not ( = ?auto_39091 ?auto_39092 ) ) ( ON ?auto_39093 ?auto_39091 ) ( CLEAR ?auto_39093 ) ( ON ?auto_39092 ?auto_39095 ) ( CLEAR ?auto_39092 ) ( HAND-EMPTY ) ( not ( = ?auto_39090 ?auto_39095 ) ) ( not ( = ?auto_39094 ?auto_39095 ) ) ( not ( = ?auto_39091 ?auto_39095 ) ) ( not ( = ?auto_39093 ?auto_39095 ) ) ( not ( = ?auto_39092 ?auto_39095 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39092 ?auto_39095 )
      ( MAKE-1PILE ?auto_39090 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39096 - BLOCK
    )
    :vars
    (
      ?auto_39098 - BLOCK
      ?auto_39100 - BLOCK
      ?auto_39099 - BLOCK
      ?auto_39101 - BLOCK
      ?auto_39097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39098 ?auto_39096 ) ( ON-TABLE ?auto_39096 ) ( not ( = ?auto_39096 ?auto_39098 ) ) ( not ( = ?auto_39096 ?auto_39100 ) ) ( not ( = ?auto_39096 ?auto_39099 ) ) ( not ( = ?auto_39098 ?auto_39100 ) ) ( not ( = ?auto_39098 ?auto_39099 ) ) ( not ( = ?auto_39100 ?auto_39099 ) ) ( ON ?auto_39100 ?auto_39098 ) ( not ( = ?auto_39101 ?auto_39099 ) ) ( not ( = ?auto_39096 ?auto_39101 ) ) ( not ( = ?auto_39098 ?auto_39101 ) ) ( not ( = ?auto_39100 ?auto_39101 ) ) ( ON ?auto_39101 ?auto_39097 ) ( CLEAR ?auto_39101 ) ( not ( = ?auto_39096 ?auto_39097 ) ) ( not ( = ?auto_39098 ?auto_39097 ) ) ( not ( = ?auto_39100 ?auto_39097 ) ) ( not ( = ?auto_39099 ?auto_39097 ) ) ( not ( = ?auto_39101 ?auto_39097 ) ) ( HOLDING ?auto_39099 ) ( CLEAR ?auto_39100 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39096 ?auto_39098 ?auto_39100 ?auto_39099 )
      ( MAKE-1PILE ?auto_39096 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39102 - BLOCK
    )
    :vars
    (
      ?auto_39104 - BLOCK
      ?auto_39105 - BLOCK
      ?auto_39103 - BLOCK
      ?auto_39106 - BLOCK
      ?auto_39107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39104 ?auto_39102 ) ( ON-TABLE ?auto_39102 ) ( not ( = ?auto_39102 ?auto_39104 ) ) ( not ( = ?auto_39102 ?auto_39105 ) ) ( not ( = ?auto_39102 ?auto_39103 ) ) ( not ( = ?auto_39104 ?auto_39105 ) ) ( not ( = ?auto_39104 ?auto_39103 ) ) ( not ( = ?auto_39105 ?auto_39103 ) ) ( ON ?auto_39105 ?auto_39104 ) ( not ( = ?auto_39106 ?auto_39103 ) ) ( not ( = ?auto_39102 ?auto_39106 ) ) ( not ( = ?auto_39104 ?auto_39106 ) ) ( not ( = ?auto_39105 ?auto_39106 ) ) ( ON ?auto_39106 ?auto_39107 ) ( not ( = ?auto_39102 ?auto_39107 ) ) ( not ( = ?auto_39104 ?auto_39107 ) ) ( not ( = ?auto_39105 ?auto_39107 ) ) ( not ( = ?auto_39103 ?auto_39107 ) ) ( not ( = ?auto_39106 ?auto_39107 ) ) ( CLEAR ?auto_39105 ) ( ON ?auto_39103 ?auto_39106 ) ( CLEAR ?auto_39103 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39107 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39107 ?auto_39106 )
      ( MAKE-1PILE ?auto_39102 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39108 - BLOCK
    )
    :vars
    (
      ?auto_39112 - BLOCK
      ?auto_39113 - BLOCK
      ?auto_39109 - BLOCK
      ?auto_39111 - BLOCK
      ?auto_39110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39112 ?auto_39108 ) ( ON-TABLE ?auto_39108 ) ( not ( = ?auto_39108 ?auto_39112 ) ) ( not ( = ?auto_39108 ?auto_39113 ) ) ( not ( = ?auto_39108 ?auto_39109 ) ) ( not ( = ?auto_39112 ?auto_39113 ) ) ( not ( = ?auto_39112 ?auto_39109 ) ) ( not ( = ?auto_39113 ?auto_39109 ) ) ( not ( = ?auto_39111 ?auto_39109 ) ) ( not ( = ?auto_39108 ?auto_39111 ) ) ( not ( = ?auto_39112 ?auto_39111 ) ) ( not ( = ?auto_39113 ?auto_39111 ) ) ( ON ?auto_39111 ?auto_39110 ) ( not ( = ?auto_39108 ?auto_39110 ) ) ( not ( = ?auto_39112 ?auto_39110 ) ) ( not ( = ?auto_39113 ?auto_39110 ) ) ( not ( = ?auto_39109 ?auto_39110 ) ) ( not ( = ?auto_39111 ?auto_39110 ) ) ( ON ?auto_39109 ?auto_39111 ) ( CLEAR ?auto_39109 ) ( ON-TABLE ?auto_39110 ) ( HOLDING ?auto_39113 ) ( CLEAR ?auto_39112 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39108 ?auto_39112 ?auto_39113 )
      ( MAKE-1PILE ?auto_39108 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39114 - BLOCK
    )
    :vars
    (
      ?auto_39118 - BLOCK
      ?auto_39115 - BLOCK
      ?auto_39117 - BLOCK
      ?auto_39116 - BLOCK
      ?auto_39119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39118 ?auto_39114 ) ( ON-TABLE ?auto_39114 ) ( not ( = ?auto_39114 ?auto_39118 ) ) ( not ( = ?auto_39114 ?auto_39115 ) ) ( not ( = ?auto_39114 ?auto_39117 ) ) ( not ( = ?auto_39118 ?auto_39115 ) ) ( not ( = ?auto_39118 ?auto_39117 ) ) ( not ( = ?auto_39115 ?auto_39117 ) ) ( not ( = ?auto_39116 ?auto_39117 ) ) ( not ( = ?auto_39114 ?auto_39116 ) ) ( not ( = ?auto_39118 ?auto_39116 ) ) ( not ( = ?auto_39115 ?auto_39116 ) ) ( ON ?auto_39116 ?auto_39119 ) ( not ( = ?auto_39114 ?auto_39119 ) ) ( not ( = ?auto_39118 ?auto_39119 ) ) ( not ( = ?auto_39115 ?auto_39119 ) ) ( not ( = ?auto_39117 ?auto_39119 ) ) ( not ( = ?auto_39116 ?auto_39119 ) ) ( ON ?auto_39117 ?auto_39116 ) ( ON-TABLE ?auto_39119 ) ( CLEAR ?auto_39118 ) ( ON ?auto_39115 ?auto_39117 ) ( CLEAR ?auto_39115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39119 ?auto_39116 ?auto_39117 )
      ( MAKE-1PILE ?auto_39114 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39132 - BLOCK
    )
    :vars
    (
      ?auto_39135 - BLOCK
      ?auto_39137 - BLOCK
      ?auto_39136 - BLOCK
      ?auto_39133 - BLOCK
      ?auto_39134 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39132 ?auto_39135 ) ) ( not ( = ?auto_39132 ?auto_39137 ) ) ( not ( = ?auto_39132 ?auto_39136 ) ) ( not ( = ?auto_39135 ?auto_39137 ) ) ( not ( = ?auto_39135 ?auto_39136 ) ) ( not ( = ?auto_39137 ?auto_39136 ) ) ( not ( = ?auto_39133 ?auto_39136 ) ) ( not ( = ?auto_39132 ?auto_39133 ) ) ( not ( = ?auto_39135 ?auto_39133 ) ) ( not ( = ?auto_39137 ?auto_39133 ) ) ( ON ?auto_39133 ?auto_39134 ) ( not ( = ?auto_39132 ?auto_39134 ) ) ( not ( = ?auto_39135 ?auto_39134 ) ) ( not ( = ?auto_39137 ?auto_39134 ) ) ( not ( = ?auto_39136 ?auto_39134 ) ) ( not ( = ?auto_39133 ?auto_39134 ) ) ( ON ?auto_39136 ?auto_39133 ) ( ON-TABLE ?auto_39134 ) ( ON ?auto_39137 ?auto_39136 ) ( ON ?auto_39135 ?auto_39137 ) ( CLEAR ?auto_39135 ) ( HOLDING ?auto_39132 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39132 ?auto_39135 )
      ( MAKE-1PILE ?auto_39132 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39138 - BLOCK
    )
    :vars
    (
      ?auto_39143 - BLOCK
      ?auto_39139 - BLOCK
      ?auto_39140 - BLOCK
      ?auto_39142 - BLOCK
      ?auto_39141 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39138 ?auto_39143 ) ) ( not ( = ?auto_39138 ?auto_39139 ) ) ( not ( = ?auto_39138 ?auto_39140 ) ) ( not ( = ?auto_39143 ?auto_39139 ) ) ( not ( = ?auto_39143 ?auto_39140 ) ) ( not ( = ?auto_39139 ?auto_39140 ) ) ( not ( = ?auto_39142 ?auto_39140 ) ) ( not ( = ?auto_39138 ?auto_39142 ) ) ( not ( = ?auto_39143 ?auto_39142 ) ) ( not ( = ?auto_39139 ?auto_39142 ) ) ( ON ?auto_39142 ?auto_39141 ) ( not ( = ?auto_39138 ?auto_39141 ) ) ( not ( = ?auto_39143 ?auto_39141 ) ) ( not ( = ?auto_39139 ?auto_39141 ) ) ( not ( = ?auto_39140 ?auto_39141 ) ) ( not ( = ?auto_39142 ?auto_39141 ) ) ( ON ?auto_39140 ?auto_39142 ) ( ON-TABLE ?auto_39141 ) ( ON ?auto_39139 ?auto_39140 ) ( ON ?auto_39143 ?auto_39139 ) ( ON ?auto_39138 ?auto_39143 ) ( CLEAR ?auto_39138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39141 ?auto_39142 ?auto_39140 ?auto_39139 ?auto_39143 )
      ( MAKE-1PILE ?auto_39138 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39148 - BLOCK
      ?auto_39149 - BLOCK
      ?auto_39150 - BLOCK
      ?auto_39151 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_39151 ) ( CLEAR ?auto_39150 ) ( ON-TABLE ?auto_39148 ) ( ON ?auto_39149 ?auto_39148 ) ( ON ?auto_39150 ?auto_39149 ) ( not ( = ?auto_39148 ?auto_39149 ) ) ( not ( = ?auto_39148 ?auto_39150 ) ) ( not ( = ?auto_39148 ?auto_39151 ) ) ( not ( = ?auto_39149 ?auto_39150 ) ) ( not ( = ?auto_39149 ?auto_39151 ) ) ( not ( = ?auto_39150 ?auto_39151 ) ) )
    :subtasks
    ( ( !STACK ?auto_39151 ?auto_39150 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39152 - BLOCK
      ?auto_39153 - BLOCK
      ?auto_39154 - BLOCK
      ?auto_39155 - BLOCK
    )
    :vars
    (
      ?auto_39156 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_39154 ) ( ON-TABLE ?auto_39152 ) ( ON ?auto_39153 ?auto_39152 ) ( ON ?auto_39154 ?auto_39153 ) ( not ( = ?auto_39152 ?auto_39153 ) ) ( not ( = ?auto_39152 ?auto_39154 ) ) ( not ( = ?auto_39152 ?auto_39155 ) ) ( not ( = ?auto_39153 ?auto_39154 ) ) ( not ( = ?auto_39153 ?auto_39155 ) ) ( not ( = ?auto_39154 ?auto_39155 ) ) ( ON ?auto_39155 ?auto_39156 ) ( CLEAR ?auto_39155 ) ( HAND-EMPTY ) ( not ( = ?auto_39152 ?auto_39156 ) ) ( not ( = ?auto_39153 ?auto_39156 ) ) ( not ( = ?auto_39154 ?auto_39156 ) ) ( not ( = ?auto_39155 ?auto_39156 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39155 ?auto_39156 )
      ( MAKE-4PILE ?auto_39152 ?auto_39153 ?auto_39154 ?auto_39155 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39157 - BLOCK
      ?auto_39158 - BLOCK
      ?auto_39159 - BLOCK
      ?auto_39160 - BLOCK
    )
    :vars
    (
      ?auto_39161 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39157 ) ( ON ?auto_39158 ?auto_39157 ) ( not ( = ?auto_39157 ?auto_39158 ) ) ( not ( = ?auto_39157 ?auto_39159 ) ) ( not ( = ?auto_39157 ?auto_39160 ) ) ( not ( = ?auto_39158 ?auto_39159 ) ) ( not ( = ?auto_39158 ?auto_39160 ) ) ( not ( = ?auto_39159 ?auto_39160 ) ) ( ON ?auto_39160 ?auto_39161 ) ( CLEAR ?auto_39160 ) ( not ( = ?auto_39157 ?auto_39161 ) ) ( not ( = ?auto_39158 ?auto_39161 ) ) ( not ( = ?auto_39159 ?auto_39161 ) ) ( not ( = ?auto_39160 ?auto_39161 ) ) ( HOLDING ?auto_39159 ) ( CLEAR ?auto_39158 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39157 ?auto_39158 ?auto_39159 )
      ( MAKE-4PILE ?auto_39157 ?auto_39158 ?auto_39159 ?auto_39160 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39162 - BLOCK
      ?auto_39163 - BLOCK
      ?auto_39164 - BLOCK
      ?auto_39165 - BLOCK
    )
    :vars
    (
      ?auto_39166 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39162 ) ( ON ?auto_39163 ?auto_39162 ) ( not ( = ?auto_39162 ?auto_39163 ) ) ( not ( = ?auto_39162 ?auto_39164 ) ) ( not ( = ?auto_39162 ?auto_39165 ) ) ( not ( = ?auto_39163 ?auto_39164 ) ) ( not ( = ?auto_39163 ?auto_39165 ) ) ( not ( = ?auto_39164 ?auto_39165 ) ) ( ON ?auto_39165 ?auto_39166 ) ( not ( = ?auto_39162 ?auto_39166 ) ) ( not ( = ?auto_39163 ?auto_39166 ) ) ( not ( = ?auto_39164 ?auto_39166 ) ) ( not ( = ?auto_39165 ?auto_39166 ) ) ( CLEAR ?auto_39163 ) ( ON ?auto_39164 ?auto_39165 ) ( CLEAR ?auto_39164 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39166 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39166 ?auto_39165 )
      ( MAKE-4PILE ?auto_39162 ?auto_39163 ?auto_39164 ?auto_39165 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39167 - BLOCK
      ?auto_39168 - BLOCK
      ?auto_39169 - BLOCK
      ?auto_39170 - BLOCK
    )
    :vars
    (
      ?auto_39171 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39167 ) ( not ( = ?auto_39167 ?auto_39168 ) ) ( not ( = ?auto_39167 ?auto_39169 ) ) ( not ( = ?auto_39167 ?auto_39170 ) ) ( not ( = ?auto_39168 ?auto_39169 ) ) ( not ( = ?auto_39168 ?auto_39170 ) ) ( not ( = ?auto_39169 ?auto_39170 ) ) ( ON ?auto_39170 ?auto_39171 ) ( not ( = ?auto_39167 ?auto_39171 ) ) ( not ( = ?auto_39168 ?auto_39171 ) ) ( not ( = ?auto_39169 ?auto_39171 ) ) ( not ( = ?auto_39170 ?auto_39171 ) ) ( ON ?auto_39169 ?auto_39170 ) ( CLEAR ?auto_39169 ) ( ON-TABLE ?auto_39171 ) ( HOLDING ?auto_39168 ) ( CLEAR ?auto_39167 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39167 ?auto_39168 )
      ( MAKE-4PILE ?auto_39167 ?auto_39168 ?auto_39169 ?auto_39170 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39172 - BLOCK
      ?auto_39173 - BLOCK
      ?auto_39174 - BLOCK
      ?auto_39175 - BLOCK
    )
    :vars
    (
      ?auto_39176 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39172 ) ( not ( = ?auto_39172 ?auto_39173 ) ) ( not ( = ?auto_39172 ?auto_39174 ) ) ( not ( = ?auto_39172 ?auto_39175 ) ) ( not ( = ?auto_39173 ?auto_39174 ) ) ( not ( = ?auto_39173 ?auto_39175 ) ) ( not ( = ?auto_39174 ?auto_39175 ) ) ( ON ?auto_39175 ?auto_39176 ) ( not ( = ?auto_39172 ?auto_39176 ) ) ( not ( = ?auto_39173 ?auto_39176 ) ) ( not ( = ?auto_39174 ?auto_39176 ) ) ( not ( = ?auto_39175 ?auto_39176 ) ) ( ON ?auto_39174 ?auto_39175 ) ( ON-TABLE ?auto_39176 ) ( CLEAR ?auto_39172 ) ( ON ?auto_39173 ?auto_39174 ) ( CLEAR ?auto_39173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39176 ?auto_39175 ?auto_39174 )
      ( MAKE-4PILE ?auto_39172 ?auto_39173 ?auto_39174 ?auto_39175 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39177 - BLOCK
      ?auto_39178 - BLOCK
      ?auto_39179 - BLOCK
      ?auto_39180 - BLOCK
    )
    :vars
    (
      ?auto_39181 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39177 ?auto_39178 ) ) ( not ( = ?auto_39177 ?auto_39179 ) ) ( not ( = ?auto_39177 ?auto_39180 ) ) ( not ( = ?auto_39178 ?auto_39179 ) ) ( not ( = ?auto_39178 ?auto_39180 ) ) ( not ( = ?auto_39179 ?auto_39180 ) ) ( ON ?auto_39180 ?auto_39181 ) ( not ( = ?auto_39177 ?auto_39181 ) ) ( not ( = ?auto_39178 ?auto_39181 ) ) ( not ( = ?auto_39179 ?auto_39181 ) ) ( not ( = ?auto_39180 ?auto_39181 ) ) ( ON ?auto_39179 ?auto_39180 ) ( ON-TABLE ?auto_39181 ) ( ON ?auto_39178 ?auto_39179 ) ( CLEAR ?auto_39178 ) ( HOLDING ?auto_39177 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39177 )
      ( MAKE-4PILE ?auto_39177 ?auto_39178 ?auto_39179 ?auto_39180 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39182 - BLOCK
      ?auto_39183 - BLOCK
      ?auto_39184 - BLOCK
      ?auto_39185 - BLOCK
    )
    :vars
    (
      ?auto_39186 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39182 ?auto_39183 ) ) ( not ( = ?auto_39182 ?auto_39184 ) ) ( not ( = ?auto_39182 ?auto_39185 ) ) ( not ( = ?auto_39183 ?auto_39184 ) ) ( not ( = ?auto_39183 ?auto_39185 ) ) ( not ( = ?auto_39184 ?auto_39185 ) ) ( ON ?auto_39185 ?auto_39186 ) ( not ( = ?auto_39182 ?auto_39186 ) ) ( not ( = ?auto_39183 ?auto_39186 ) ) ( not ( = ?auto_39184 ?auto_39186 ) ) ( not ( = ?auto_39185 ?auto_39186 ) ) ( ON ?auto_39184 ?auto_39185 ) ( ON-TABLE ?auto_39186 ) ( ON ?auto_39183 ?auto_39184 ) ( ON ?auto_39182 ?auto_39183 ) ( CLEAR ?auto_39182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39186 ?auto_39185 ?auto_39184 ?auto_39183 )
      ( MAKE-4PILE ?auto_39182 ?auto_39183 ?auto_39184 ?auto_39185 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39187 - BLOCK
      ?auto_39188 - BLOCK
      ?auto_39189 - BLOCK
      ?auto_39190 - BLOCK
    )
    :vars
    (
      ?auto_39191 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39187 ?auto_39188 ) ) ( not ( = ?auto_39187 ?auto_39189 ) ) ( not ( = ?auto_39187 ?auto_39190 ) ) ( not ( = ?auto_39188 ?auto_39189 ) ) ( not ( = ?auto_39188 ?auto_39190 ) ) ( not ( = ?auto_39189 ?auto_39190 ) ) ( ON ?auto_39190 ?auto_39191 ) ( not ( = ?auto_39187 ?auto_39191 ) ) ( not ( = ?auto_39188 ?auto_39191 ) ) ( not ( = ?auto_39189 ?auto_39191 ) ) ( not ( = ?auto_39190 ?auto_39191 ) ) ( ON ?auto_39189 ?auto_39190 ) ( ON-TABLE ?auto_39191 ) ( ON ?auto_39188 ?auto_39189 ) ( HOLDING ?auto_39187 ) ( CLEAR ?auto_39188 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39191 ?auto_39190 ?auto_39189 ?auto_39188 ?auto_39187 )
      ( MAKE-4PILE ?auto_39187 ?auto_39188 ?auto_39189 ?auto_39190 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39192 - BLOCK
      ?auto_39193 - BLOCK
      ?auto_39194 - BLOCK
      ?auto_39195 - BLOCK
    )
    :vars
    (
      ?auto_39196 - BLOCK
      ?auto_39197 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39192 ?auto_39193 ) ) ( not ( = ?auto_39192 ?auto_39194 ) ) ( not ( = ?auto_39192 ?auto_39195 ) ) ( not ( = ?auto_39193 ?auto_39194 ) ) ( not ( = ?auto_39193 ?auto_39195 ) ) ( not ( = ?auto_39194 ?auto_39195 ) ) ( ON ?auto_39195 ?auto_39196 ) ( not ( = ?auto_39192 ?auto_39196 ) ) ( not ( = ?auto_39193 ?auto_39196 ) ) ( not ( = ?auto_39194 ?auto_39196 ) ) ( not ( = ?auto_39195 ?auto_39196 ) ) ( ON ?auto_39194 ?auto_39195 ) ( ON-TABLE ?auto_39196 ) ( ON ?auto_39193 ?auto_39194 ) ( CLEAR ?auto_39193 ) ( ON ?auto_39192 ?auto_39197 ) ( CLEAR ?auto_39192 ) ( HAND-EMPTY ) ( not ( = ?auto_39192 ?auto_39197 ) ) ( not ( = ?auto_39193 ?auto_39197 ) ) ( not ( = ?auto_39194 ?auto_39197 ) ) ( not ( = ?auto_39195 ?auto_39197 ) ) ( not ( = ?auto_39196 ?auto_39197 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39192 ?auto_39197 )
      ( MAKE-4PILE ?auto_39192 ?auto_39193 ?auto_39194 ?auto_39195 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39198 - BLOCK
      ?auto_39199 - BLOCK
      ?auto_39200 - BLOCK
      ?auto_39201 - BLOCK
    )
    :vars
    (
      ?auto_39203 - BLOCK
      ?auto_39202 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39198 ?auto_39199 ) ) ( not ( = ?auto_39198 ?auto_39200 ) ) ( not ( = ?auto_39198 ?auto_39201 ) ) ( not ( = ?auto_39199 ?auto_39200 ) ) ( not ( = ?auto_39199 ?auto_39201 ) ) ( not ( = ?auto_39200 ?auto_39201 ) ) ( ON ?auto_39201 ?auto_39203 ) ( not ( = ?auto_39198 ?auto_39203 ) ) ( not ( = ?auto_39199 ?auto_39203 ) ) ( not ( = ?auto_39200 ?auto_39203 ) ) ( not ( = ?auto_39201 ?auto_39203 ) ) ( ON ?auto_39200 ?auto_39201 ) ( ON-TABLE ?auto_39203 ) ( ON ?auto_39198 ?auto_39202 ) ( CLEAR ?auto_39198 ) ( not ( = ?auto_39198 ?auto_39202 ) ) ( not ( = ?auto_39199 ?auto_39202 ) ) ( not ( = ?auto_39200 ?auto_39202 ) ) ( not ( = ?auto_39201 ?auto_39202 ) ) ( not ( = ?auto_39203 ?auto_39202 ) ) ( HOLDING ?auto_39199 ) ( CLEAR ?auto_39200 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39203 ?auto_39201 ?auto_39200 ?auto_39199 )
      ( MAKE-4PILE ?auto_39198 ?auto_39199 ?auto_39200 ?auto_39201 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39204 - BLOCK
      ?auto_39205 - BLOCK
      ?auto_39206 - BLOCK
      ?auto_39207 - BLOCK
    )
    :vars
    (
      ?auto_39208 - BLOCK
      ?auto_39209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39204 ?auto_39205 ) ) ( not ( = ?auto_39204 ?auto_39206 ) ) ( not ( = ?auto_39204 ?auto_39207 ) ) ( not ( = ?auto_39205 ?auto_39206 ) ) ( not ( = ?auto_39205 ?auto_39207 ) ) ( not ( = ?auto_39206 ?auto_39207 ) ) ( ON ?auto_39207 ?auto_39208 ) ( not ( = ?auto_39204 ?auto_39208 ) ) ( not ( = ?auto_39205 ?auto_39208 ) ) ( not ( = ?auto_39206 ?auto_39208 ) ) ( not ( = ?auto_39207 ?auto_39208 ) ) ( ON ?auto_39206 ?auto_39207 ) ( ON-TABLE ?auto_39208 ) ( ON ?auto_39204 ?auto_39209 ) ( not ( = ?auto_39204 ?auto_39209 ) ) ( not ( = ?auto_39205 ?auto_39209 ) ) ( not ( = ?auto_39206 ?auto_39209 ) ) ( not ( = ?auto_39207 ?auto_39209 ) ) ( not ( = ?auto_39208 ?auto_39209 ) ) ( CLEAR ?auto_39206 ) ( ON ?auto_39205 ?auto_39204 ) ( CLEAR ?auto_39205 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39209 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39209 ?auto_39204 )
      ( MAKE-4PILE ?auto_39204 ?auto_39205 ?auto_39206 ?auto_39207 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39210 - BLOCK
      ?auto_39211 - BLOCK
      ?auto_39212 - BLOCK
      ?auto_39213 - BLOCK
    )
    :vars
    (
      ?auto_39214 - BLOCK
      ?auto_39215 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39210 ?auto_39211 ) ) ( not ( = ?auto_39210 ?auto_39212 ) ) ( not ( = ?auto_39210 ?auto_39213 ) ) ( not ( = ?auto_39211 ?auto_39212 ) ) ( not ( = ?auto_39211 ?auto_39213 ) ) ( not ( = ?auto_39212 ?auto_39213 ) ) ( ON ?auto_39213 ?auto_39214 ) ( not ( = ?auto_39210 ?auto_39214 ) ) ( not ( = ?auto_39211 ?auto_39214 ) ) ( not ( = ?auto_39212 ?auto_39214 ) ) ( not ( = ?auto_39213 ?auto_39214 ) ) ( ON-TABLE ?auto_39214 ) ( ON ?auto_39210 ?auto_39215 ) ( not ( = ?auto_39210 ?auto_39215 ) ) ( not ( = ?auto_39211 ?auto_39215 ) ) ( not ( = ?auto_39212 ?auto_39215 ) ) ( not ( = ?auto_39213 ?auto_39215 ) ) ( not ( = ?auto_39214 ?auto_39215 ) ) ( ON ?auto_39211 ?auto_39210 ) ( CLEAR ?auto_39211 ) ( ON-TABLE ?auto_39215 ) ( HOLDING ?auto_39212 ) ( CLEAR ?auto_39213 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39214 ?auto_39213 ?auto_39212 )
      ( MAKE-4PILE ?auto_39210 ?auto_39211 ?auto_39212 ?auto_39213 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39216 - BLOCK
      ?auto_39217 - BLOCK
      ?auto_39218 - BLOCK
      ?auto_39219 - BLOCK
    )
    :vars
    (
      ?auto_39220 - BLOCK
      ?auto_39221 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39216 ?auto_39217 ) ) ( not ( = ?auto_39216 ?auto_39218 ) ) ( not ( = ?auto_39216 ?auto_39219 ) ) ( not ( = ?auto_39217 ?auto_39218 ) ) ( not ( = ?auto_39217 ?auto_39219 ) ) ( not ( = ?auto_39218 ?auto_39219 ) ) ( ON ?auto_39219 ?auto_39220 ) ( not ( = ?auto_39216 ?auto_39220 ) ) ( not ( = ?auto_39217 ?auto_39220 ) ) ( not ( = ?auto_39218 ?auto_39220 ) ) ( not ( = ?auto_39219 ?auto_39220 ) ) ( ON-TABLE ?auto_39220 ) ( ON ?auto_39216 ?auto_39221 ) ( not ( = ?auto_39216 ?auto_39221 ) ) ( not ( = ?auto_39217 ?auto_39221 ) ) ( not ( = ?auto_39218 ?auto_39221 ) ) ( not ( = ?auto_39219 ?auto_39221 ) ) ( not ( = ?auto_39220 ?auto_39221 ) ) ( ON ?auto_39217 ?auto_39216 ) ( ON-TABLE ?auto_39221 ) ( CLEAR ?auto_39219 ) ( ON ?auto_39218 ?auto_39217 ) ( CLEAR ?auto_39218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39221 ?auto_39216 ?auto_39217 )
      ( MAKE-4PILE ?auto_39216 ?auto_39217 ?auto_39218 ?auto_39219 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39222 - BLOCK
      ?auto_39223 - BLOCK
      ?auto_39224 - BLOCK
      ?auto_39225 - BLOCK
    )
    :vars
    (
      ?auto_39227 - BLOCK
      ?auto_39226 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39222 ?auto_39223 ) ) ( not ( = ?auto_39222 ?auto_39224 ) ) ( not ( = ?auto_39222 ?auto_39225 ) ) ( not ( = ?auto_39223 ?auto_39224 ) ) ( not ( = ?auto_39223 ?auto_39225 ) ) ( not ( = ?auto_39224 ?auto_39225 ) ) ( not ( = ?auto_39222 ?auto_39227 ) ) ( not ( = ?auto_39223 ?auto_39227 ) ) ( not ( = ?auto_39224 ?auto_39227 ) ) ( not ( = ?auto_39225 ?auto_39227 ) ) ( ON-TABLE ?auto_39227 ) ( ON ?auto_39222 ?auto_39226 ) ( not ( = ?auto_39222 ?auto_39226 ) ) ( not ( = ?auto_39223 ?auto_39226 ) ) ( not ( = ?auto_39224 ?auto_39226 ) ) ( not ( = ?auto_39225 ?auto_39226 ) ) ( not ( = ?auto_39227 ?auto_39226 ) ) ( ON ?auto_39223 ?auto_39222 ) ( ON-TABLE ?auto_39226 ) ( ON ?auto_39224 ?auto_39223 ) ( CLEAR ?auto_39224 ) ( HOLDING ?auto_39225 ) ( CLEAR ?auto_39227 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39227 ?auto_39225 )
      ( MAKE-4PILE ?auto_39222 ?auto_39223 ?auto_39224 ?auto_39225 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39228 - BLOCK
      ?auto_39229 - BLOCK
      ?auto_39230 - BLOCK
      ?auto_39231 - BLOCK
    )
    :vars
    (
      ?auto_39233 - BLOCK
      ?auto_39232 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39228 ?auto_39229 ) ) ( not ( = ?auto_39228 ?auto_39230 ) ) ( not ( = ?auto_39228 ?auto_39231 ) ) ( not ( = ?auto_39229 ?auto_39230 ) ) ( not ( = ?auto_39229 ?auto_39231 ) ) ( not ( = ?auto_39230 ?auto_39231 ) ) ( not ( = ?auto_39228 ?auto_39233 ) ) ( not ( = ?auto_39229 ?auto_39233 ) ) ( not ( = ?auto_39230 ?auto_39233 ) ) ( not ( = ?auto_39231 ?auto_39233 ) ) ( ON-TABLE ?auto_39233 ) ( ON ?auto_39228 ?auto_39232 ) ( not ( = ?auto_39228 ?auto_39232 ) ) ( not ( = ?auto_39229 ?auto_39232 ) ) ( not ( = ?auto_39230 ?auto_39232 ) ) ( not ( = ?auto_39231 ?auto_39232 ) ) ( not ( = ?auto_39233 ?auto_39232 ) ) ( ON ?auto_39229 ?auto_39228 ) ( ON-TABLE ?auto_39232 ) ( ON ?auto_39230 ?auto_39229 ) ( CLEAR ?auto_39233 ) ( ON ?auto_39231 ?auto_39230 ) ( CLEAR ?auto_39231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39232 ?auto_39228 ?auto_39229 ?auto_39230 )
      ( MAKE-4PILE ?auto_39228 ?auto_39229 ?auto_39230 ?auto_39231 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39234 - BLOCK
      ?auto_39235 - BLOCK
      ?auto_39236 - BLOCK
      ?auto_39237 - BLOCK
    )
    :vars
    (
      ?auto_39238 - BLOCK
      ?auto_39239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39234 ?auto_39235 ) ) ( not ( = ?auto_39234 ?auto_39236 ) ) ( not ( = ?auto_39234 ?auto_39237 ) ) ( not ( = ?auto_39235 ?auto_39236 ) ) ( not ( = ?auto_39235 ?auto_39237 ) ) ( not ( = ?auto_39236 ?auto_39237 ) ) ( not ( = ?auto_39234 ?auto_39238 ) ) ( not ( = ?auto_39235 ?auto_39238 ) ) ( not ( = ?auto_39236 ?auto_39238 ) ) ( not ( = ?auto_39237 ?auto_39238 ) ) ( ON ?auto_39234 ?auto_39239 ) ( not ( = ?auto_39234 ?auto_39239 ) ) ( not ( = ?auto_39235 ?auto_39239 ) ) ( not ( = ?auto_39236 ?auto_39239 ) ) ( not ( = ?auto_39237 ?auto_39239 ) ) ( not ( = ?auto_39238 ?auto_39239 ) ) ( ON ?auto_39235 ?auto_39234 ) ( ON-TABLE ?auto_39239 ) ( ON ?auto_39236 ?auto_39235 ) ( ON ?auto_39237 ?auto_39236 ) ( CLEAR ?auto_39237 ) ( HOLDING ?auto_39238 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39238 )
      ( MAKE-4PILE ?auto_39234 ?auto_39235 ?auto_39236 ?auto_39237 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39240 - BLOCK
      ?auto_39241 - BLOCK
      ?auto_39242 - BLOCK
      ?auto_39243 - BLOCK
    )
    :vars
    (
      ?auto_39244 - BLOCK
      ?auto_39245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39240 ?auto_39241 ) ) ( not ( = ?auto_39240 ?auto_39242 ) ) ( not ( = ?auto_39240 ?auto_39243 ) ) ( not ( = ?auto_39241 ?auto_39242 ) ) ( not ( = ?auto_39241 ?auto_39243 ) ) ( not ( = ?auto_39242 ?auto_39243 ) ) ( not ( = ?auto_39240 ?auto_39244 ) ) ( not ( = ?auto_39241 ?auto_39244 ) ) ( not ( = ?auto_39242 ?auto_39244 ) ) ( not ( = ?auto_39243 ?auto_39244 ) ) ( ON ?auto_39240 ?auto_39245 ) ( not ( = ?auto_39240 ?auto_39245 ) ) ( not ( = ?auto_39241 ?auto_39245 ) ) ( not ( = ?auto_39242 ?auto_39245 ) ) ( not ( = ?auto_39243 ?auto_39245 ) ) ( not ( = ?auto_39244 ?auto_39245 ) ) ( ON ?auto_39241 ?auto_39240 ) ( ON-TABLE ?auto_39245 ) ( ON ?auto_39242 ?auto_39241 ) ( ON ?auto_39243 ?auto_39242 ) ( ON ?auto_39244 ?auto_39243 ) ( CLEAR ?auto_39244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39245 ?auto_39240 ?auto_39241 ?auto_39242 ?auto_39243 )
      ( MAKE-4PILE ?auto_39240 ?auto_39241 ?auto_39242 ?auto_39243 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39251 - BLOCK
      ?auto_39252 - BLOCK
      ?auto_39253 - BLOCK
      ?auto_39254 - BLOCK
      ?auto_39255 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_39255 ) ( CLEAR ?auto_39254 ) ( ON-TABLE ?auto_39251 ) ( ON ?auto_39252 ?auto_39251 ) ( ON ?auto_39253 ?auto_39252 ) ( ON ?auto_39254 ?auto_39253 ) ( not ( = ?auto_39251 ?auto_39252 ) ) ( not ( = ?auto_39251 ?auto_39253 ) ) ( not ( = ?auto_39251 ?auto_39254 ) ) ( not ( = ?auto_39251 ?auto_39255 ) ) ( not ( = ?auto_39252 ?auto_39253 ) ) ( not ( = ?auto_39252 ?auto_39254 ) ) ( not ( = ?auto_39252 ?auto_39255 ) ) ( not ( = ?auto_39253 ?auto_39254 ) ) ( not ( = ?auto_39253 ?auto_39255 ) ) ( not ( = ?auto_39254 ?auto_39255 ) ) )
    :subtasks
    ( ( !STACK ?auto_39255 ?auto_39254 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39256 - BLOCK
      ?auto_39257 - BLOCK
      ?auto_39258 - BLOCK
      ?auto_39259 - BLOCK
      ?auto_39260 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_39259 ) ( ON-TABLE ?auto_39256 ) ( ON ?auto_39257 ?auto_39256 ) ( ON ?auto_39258 ?auto_39257 ) ( ON ?auto_39259 ?auto_39258 ) ( not ( = ?auto_39256 ?auto_39257 ) ) ( not ( = ?auto_39256 ?auto_39258 ) ) ( not ( = ?auto_39256 ?auto_39259 ) ) ( not ( = ?auto_39256 ?auto_39260 ) ) ( not ( = ?auto_39257 ?auto_39258 ) ) ( not ( = ?auto_39257 ?auto_39259 ) ) ( not ( = ?auto_39257 ?auto_39260 ) ) ( not ( = ?auto_39258 ?auto_39259 ) ) ( not ( = ?auto_39258 ?auto_39260 ) ) ( not ( = ?auto_39259 ?auto_39260 ) ) ( ON-TABLE ?auto_39260 ) ( CLEAR ?auto_39260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_39260 )
      ( MAKE-5PILE ?auto_39256 ?auto_39257 ?auto_39258 ?auto_39259 ?auto_39260 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39261 - BLOCK
      ?auto_39262 - BLOCK
      ?auto_39263 - BLOCK
      ?auto_39264 - BLOCK
      ?auto_39265 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39261 ) ( ON ?auto_39262 ?auto_39261 ) ( ON ?auto_39263 ?auto_39262 ) ( not ( = ?auto_39261 ?auto_39262 ) ) ( not ( = ?auto_39261 ?auto_39263 ) ) ( not ( = ?auto_39261 ?auto_39264 ) ) ( not ( = ?auto_39261 ?auto_39265 ) ) ( not ( = ?auto_39262 ?auto_39263 ) ) ( not ( = ?auto_39262 ?auto_39264 ) ) ( not ( = ?auto_39262 ?auto_39265 ) ) ( not ( = ?auto_39263 ?auto_39264 ) ) ( not ( = ?auto_39263 ?auto_39265 ) ) ( not ( = ?auto_39264 ?auto_39265 ) ) ( ON-TABLE ?auto_39265 ) ( CLEAR ?auto_39265 ) ( HOLDING ?auto_39264 ) ( CLEAR ?auto_39263 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39261 ?auto_39262 ?auto_39263 ?auto_39264 )
      ( MAKE-5PILE ?auto_39261 ?auto_39262 ?auto_39263 ?auto_39264 ?auto_39265 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39266 - BLOCK
      ?auto_39267 - BLOCK
      ?auto_39268 - BLOCK
      ?auto_39269 - BLOCK
      ?auto_39270 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39266 ) ( ON ?auto_39267 ?auto_39266 ) ( ON ?auto_39268 ?auto_39267 ) ( not ( = ?auto_39266 ?auto_39267 ) ) ( not ( = ?auto_39266 ?auto_39268 ) ) ( not ( = ?auto_39266 ?auto_39269 ) ) ( not ( = ?auto_39266 ?auto_39270 ) ) ( not ( = ?auto_39267 ?auto_39268 ) ) ( not ( = ?auto_39267 ?auto_39269 ) ) ( not ( = ?auto_39267 ?auto_39270 ) ) ( not ( = ?auto_39268 ?auto_39269 ) ) ( not ( = ?auto_39268 ?auto_39270 ) ) ( not ( = ?auto_39269 ?auto_39270 ) ) ( ON-TABLE ?auto_39270 ) ( CLEAR ?auto_39268 ) ( ON ?auto_39269 ?auto_39270 ) ( CLEAR ?auto_39269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39270 )
      ( MAKE-5PILE ?auto_39266 ?auto_39267 ?auto_39268 ?auto_39269 ?auto_39270 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39271 - BLOCK
      ?auto_39272 - BLOCK
      ?auto_39273 - BLOCK
      ?auto_39274 - BLOCK
      ?auto_39275 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39271 ) ( ON ?auto_39272 ?auto_39271 ) ( not ( = ?auto_39271 ?auto_39272 ) ) ( not ( = ?auto_39271 ?auto_39273 ) ) ( not ( = ?auto_39271 ?auto_39274 ) ) ( not ( = ?auto_39271 ?auto_39275 ) ) ( not ( = ?auto_39272 ?auto_39273 ) ) ( not ( = ?auto_39272 ?auto_39274 ) ) ( not ( = ?auto_39272 ?auto_39275 ) ) ( not ( = ?auto_39273 ?auto_39274 ) ) ( not ( = ?auto_39273 ?auto_39275 ) ) ( not ( = ?auto_39274 ?auto_39275 ) ) ( ON-TABLE ?auto_39275 ) ( ON ?auto_39274 ?auto_39275 ) ( CLEAR ?auto_39274 ) ( HOLDING ?auto_39273 ) ( CLEAR ?auto_39272 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39271 ?auto_39272 ?auto_39273 )
      ( MAKE-5PILE ?auto_39271 ?auto_39272 ?auto_39273 ?auto_39274 ?auto_39275 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39276 - BLOCK
      ?auto_39277 - BLOCK
      ?auto_39278 - BLOCK
      ?auto_39279 - BLOCK
      ?auto_39280 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39276 ) ( ON ?auto_39277 ?auto_39276 ) ( not ( = ?auto_39276 ?auto_39277 ) ) ( not ( = ?auto_39276 ?auto_39278 ) ) ( not ( = ?auto_39276 ?auto_39279 ) ) ( not ( = ?auto_39276 ?auto_39280 ) ) ( not ( = ?auto_39277 ?auto_39278 ) ) ( not ( = ?auto_39277 ?auto_39279 ) ) ( not ( = ?auto_39277 ?auto_39280 ) ) ( not ( = ?auto_39278 ?auto_39279 ) ) ( not ( = ?auto_39278 ?auto_39280 ) ) ( not ( = ?auto_39279 ?auto_39280 ) ) ( ON-TABLE ?auto_39280 ) ( ON ?auto_39279 ?auto_39280 ) ( CLEAR ?auto_39277 ) ( ON ?auto_39278 ?auto_39279 ) ( CLEAR ?auto_39278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39280 ?auto_39279 )
      ( MAKE-5PILE ?auto_39276 ?auto_39277 ?auto_39278 ?auto_39279 ?auto_39280 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39281 - BLOCK
      ?auto_39282 - BLOCK
      ?auto_39283 - BLOCK
      ?auto_39284 - BLOCK
      ?auto_39285 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39281 ) ( not ( = ?auto_39281 ?auto_39282 ) ) ( not ( = ?auto_39281 ?auto_39283 ) ) ( not ( = ?auto_39281 ?auto_39284 ) ) ( not ( = ?auto_39281 ?auto_39285 ) ) ( not ( = ?auto_39282 ?auto_39283 ) ) ( not ( = ?auto_39282 ?auto_39284 ) ) ( not ( = ?auto_39282 ?auto_39285 ) ) ( not ( = ?auto_39283 ?auto_39284 ) ) ( not ( = ?auto_39283 ?auto_39285 ) ) ( not ( = ?auto_39284 ?auto_39285 ) ) ( ON-TABLE ?auto_39285 ) ( ON ?auto_39284 ?auto_39285 ) ( ON ?auto_39283 ?auto_39284 ) ( CLEAR ?auto_39283 ) ( HOLDING ?auto_39282 ) ( CLEAR ?auto_39281 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39281 ?auto_39282 )
      ( MAKE-5PILE ?auto_39281 ?auto_39282 ?auto_39283 ?auto_39284 ?auto_39285 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39286 - BLOCK
      ?auto_39287 - BLOCK
      ?auto_39288 - BLOCK
      ?auto_39289 - BLOCK
      ?auto_39290 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39286 ) ( not ( = ?auto_39286 ?auto_39287 ) ) ( not ( = ?auto_39286 ?auto_39288 ) ) ( not ( = ?auto_39286 ?auto_39289 ) ) ( not ( = ?auto_39286 ?auto_39290 ) ) ( not ( = ?auto_39287 ?auto_39288 ) ) ( not ( = ?auto_39287 ?auto_39289 ) ) ( not ( = ?auto_39287 ?auto_39290 ) ) ( not ( = ?auto_39288 ?auto_39289 ) ) ( not ( = ?auto_39288 ?auto_39290 ) ) ( not ( = ?auto_39289 ?auto_39290 ) ) ( ON-TABLE ?auto_39290 ) ( ON ?auto_39289 ?auto_39290 ) ( ON ?auto_39288 ?auto_39289 ) ( CLEAR ?auto_39286 ) ( ON ?auto_39287 ?auto_39288 ) ( CLEAR ?auto_39287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39290 ?auto_39289 ?auto_39288 )
      ( MAKE-5PILE ?auto_39286 ?auto_39287 ?auto_39288 ?auto_39289 ?auto_39290 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39291 - BLOCK
      ?auto_39292 - BLOCK
      ?auto_39293 - BLOCK
      ?auto_39294 - BLOCK
      ?auto_39295 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39291 ?auto_39292 ) ) ( not ( = ?auto_39291 ?auto_39293 ) ) ( not ( = ?auto_39291 ?auto_39294 ) ) ( not ( = ?auto_39291 ?auto_39295 ) ) ( not ( = ?auto_39292 ?auto_39293 ) ) ( not ( = ?auto_39292 ?auto_39294 ) ) ( not ( = ?auto_39292 ?auto_39295 ) ) ( not ( = ?auto_39293 ?auto_39294 ) ) ( not ( = ?auto_39293 ?auto_39295 ) ) ( not ( = ?auto_39294 ?auto_39295 ) ) ( ON-TABLE ?auto_39295 ) ( ON ?auto_39294 ?auto_39295 ) ( ON ?auto_39293 ?auto_39294 ) ( ON ?auto_39292 ?auto_39293 ) ( CLEAR ?auto_39292 ) ( HOLDING ?auto_39291 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39291 )
      ( MAKE-5PILE ?auto_39291 ?auto_39292 ?auto_39293 ?auto_39294 ?auto_39295 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39296 - BLOCK
      ?auto_39297 - BLOCK
      ?auto_39298 - BLOCK
      ?auto_39299 - BLOCK
      ?auto_39300 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39296 ?auto_39297 ) ) ( not ( = ?auto_39296 ?auto_39298 ) ) ( not ( = ?auto_39296 ?auto_39299 ) ) ( not ( = ?auto_39296 ?auto_39300 ) ) ( not ( = ?auto_39297 ?auto_39298 ) ) ( not ( = ?auto_39297 ?auto_39299 ) ) ( not ( = ?auto_39297 ?auto_39300 ) ) ( not ( = ?auto_39298 ?auto_39299 ) ) ( not ( = ?auto_39298 ?auto_39300 ) ) ( not ( = ?auto_39299 ?auto_39300 ) ) ( ON-TABLE ?auto_39300 ) ( ON ?auto_39299 ?auto_39300 ) ( ON ?auto_39298 ?auto_39299 ) ( ON ?auto_39297 ?auto_39298 ) ( ON ?auto_39296 ?auto_39297 ) ( CLEAR ?auto_39296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39300 ?auto_39299 ?auto_39298 ?auto_39297 )
      ( MAKE-5PILE ?auto_39296 ?auto_39297 ?auto_39298 ?auto_39299 ?auto_39300 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39301 - BLOCK
      ?auto_39302 - BLOCK
      ?auto_39303 - BLOCK
      ?auto_39304 - BLOCK
      ?auto_39305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39301 ?auto_39302 ) ) ( not ( = ?auto_39301 ?auto_39303 ) ) ( not ( = ?auto_39301 ?auto_39304 ) ) ( not ( = ?auto_39301 ?auto_39305 ) ) ( not ( = ?auto_39302 ?auto_39303 ) ) ( not ( = ?auto_39302 ?auto_39304 ) ) ( not ( = ?auto_39302 ?auto_39305 ) ) ( not ( = ?auto_39303 ?auto_39304 ) ) ( not ( = ?auto_39303 ?auto_39305 ) ) ( not ( = ?auto_39304 ?auto_39305 ) ) ( ON-TABLE ?auto_39305 ) ( ON ?auto_39304 ?auto_39305 ) ( ON ?auto_39303 ?auto_39304 ) ( ON ?auto_39302 ?auto_39303 ) ( HOLDING ?auto_39301 ) ( CLEAR ?auto_39302 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39305 ?auto_39304 ?auto_39303 ?auto_39302 ?auto_39301 )
      ( MAKE-5PILE ?auto_39301 ?auto_39302 ?auto_39303 ?auto_39304 ?auto_39305 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39306 - BLOCK
      ?auto_39307 - BLOCK
      ?auto_39308 - BLOCK
      ?auto_39309 - BLOCK
      ?auto_39310 - BLOCK
    )
    :vars
    (
      ?auto_39311 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39306 ?auto_39307 ) ) ( not ( = ?auto_39306 ?auto_39308 ) ) ( not ( = ?auto_39306 ?auto_39309 ) ) ( not ( = ?auto_39306 ?auto_39310 ) ) ( not ( = ?auto_39307 ?auto_39308 ) ) ( not ( = ?auto_39307 ?auto_39309 ) ) ( not ( = ?auto_39307 ?auto_39310 ) ) ( not ( = ?auto_39308 ?auto_39309 ) ) ( not ( = ?auto_39308 ?auto_39310 ) ) ( not ( = ?auto_39309 ?auto_39310 ) ) ( ON-TABLE ?auto_39310 ) ( ON ?auto_39309 ?auto_39310 ) ( ON ?auto_39308 ?auto_39309 ) ( ON ?auto_39307 ?auto_39308 ) ( CLEAR ?auto_39307 ) ( ON ?auto_39306 ?auto_39311 ) ( CLEAR ?auto_39306 ) ( HAND-EMPTY ) ( not ( = ?auto_39306 ?auto_39311 ) ) ( not ( = ?auto_39307 ?auto_39311 ) ) ( not ( = ?auto_39308 ?auto_39311 ) ) ( not ( = ?auto_39309 ?auto_39311 ) ) ( not ( = ?auto_39310 ?auto_39311 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39306 ?auto_39311 )
      ( MAKE-5PILE ?auto_39306 ?auto_39307 ?auto_39308 ?auto_39309 ?auto_39310 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39312 - BLOCK
      ?auto_39313 - BLOCK
      ?auto_39314 - BLOCK
      ?auto_39315 - BLOCK
      ?auto_39316 - BLOCK
    )
    :vars
    (
      ?auto_39317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39312 ?auto_39313 ) ) ( not ( = ?auto_39312 ?auto_39314 ) ) ( not ( = ?auto_39312 ?auto_39315 ) ) ( not ( = ?auto_39312 ?auto_39316 ) ) ( not ( = ?auto_39313 ?auto_39314 ) ) ( not ( = ?auto_39313 ?auto_39315 ) ) ( not ( = ?auto_39313 ?auto_39316 ) ) ( not ( = ?auto_39314 ?auto_39315 ) ) ( not ( = ?auto_39314 ?auto_39316 ) ) ( not ( = ?auto_39315 ?auto_39316 ) ) ( ON-TABLE ?auto_39316 ) ( ON ?auto_39315 ?auto_39316 ) ( ON ?auto_39314 ?auto_39315 ) ( ON ?auto_39312 ?auto_39317 ) ( CLEAR ?auto_39312 ) ( not ( = ?auto_39312 ?auto_39317 ) ) ( not ( = ?auto_39313 ?auto_39317 ) ) ( not ( = ?auto_39314 ?auto_39317 ) ) ( not ( = ?auto_39315 ?auto_39317 ) ) ( not ( = ?auto_39316 ?auto_39317 ) ) ( HOLDING ?auto_39313 ) ( CLEAR ?auto_39314 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39316 ?auto_39315 ?auto_39314 ?auto_39313 )
      ( MAKE-5PILE ?auto_39312 ?auto_39313 ?auto_39314 ?auto_39315 ?auto_39316 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39318 - BLOCK
      ?auto_39319 - BLOCK
      ?auto_39320 - BLOCK
      ?auto_39321 - BLOCK
      ?auto_39322 - BLOCK
    )
    :vars
    (
      ?auto_39323 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39318 ?auto_39319 ) ) ( not ( = ?auto_39318 ?auto_39320 ) ) ( not ( = ?auto_39318 ?auto_39321 ) ) ( not ( = ?auto_39318 ?auto_39322 ) ) ( not ( = ?auto_39319 ?auto_39320 ) ) ( not ( = ?auto_39319 ?auto_39321 ) ) ( not ( = ?auto_39319 ?auto_39322 ) ) ( not ( = ?auto_39320 ?auto_39321 ) ) ( not ( = ?auto_39320 ?auto_39322 ) ) ( not ( = ?auto_39321 ?auto_39322 ) ) ( ON-TABLE ?auto_39322 ) ( ON ?auto_39321 ?auto_39322 ) ( ON ?auto_39320 ?auto_39321 ) ( ON ?auto_39318 ?auto_39323 ) ( not ( = ?auto_39318 ?auto_39323 ) ) ( not ( = ?auto_39319 ?auto_39323 ) ) ( not ( = ?auto_39320 ?auto_39323 ) ) ( not ( = ?auto_39321 ?auto_39323 ) ) ( not ( = ?auto_39322 ?auto_39323 ) ) ( CLEAR ?auto_39320 ) ( ON ?auto_39319 ?auto_39318 ) ( CLEAR ?auto_39319 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39323 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39323 ?auto_39318 )
      ( MAKE-5PILE ?auto_39318 ?auto_39319 ?auto_39320 ?auto_39321 ?auto_39322 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39324 - BLOCK
      ?auto_39325 - BLOCK
      ?auto_39326 - BLOCK
      ?auto_39327 - BLOCK
      ?auto_39328 - BLOCK
    )
    :vars
    (
      ?auto_39329 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39324 ?auto_39325 ) ) ( not ( = ?auto_39324 ?auto_39326 ) ) ( not ( = ?auto_39324 ?auto_39327 ) ) ( not ( = ?auto_39324 ?auto_39328 ) ) ( not ( = ?auto_39325 ?auto_39326 ) ) ( not ( = ?auto_39325 ?auto_39327 ) ) ( not ( = ?auto_39325 ?auto_39328 ) ) ( not ( = ?auto_39326 ?auto_39327 ) ) ( not ( = ?auto_39326 ?auto_39328 ) ) ( not ( = ?auto_39327 ?auto_39328 ) ) ( ON-TABLE ?auto_39328 ) ( ON ?auto_39327 ?auto_39328 ) ( ON ?auto_39324 ?auto_39329 ) ( not ( = ?auto_39324 ?auto_39329 ) ) ( not ( = ?auto_39325 ?auto_39329 ) ) ( not ( = ?auto_39326 ?auto_39329 ) ) ( not ( = ?auto_39327 ?auto_39329 ) ) ( not ( = ?auto_39328 ?auto_39329 ) ) ( ON ?auto_39325 ?auto_39324 ) ( CLEAR ?auto_39325 ) ( ON-TABLE ?auto_39329 ) ( HOLDING ?auto_39326 ) ( CLEAR ?auto_39327 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39328 ?auto_39327 ?auto_39326 )
      ( MAKE-5PILE ?auto_39324 ?auto_39325 ?auto_39326 ?auto_39327 ?auto_39328 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39330 - BLOCK
      ?auto_39331 - BLOCK
      ?auto_39332 - BLOCK
      ?auto_39333 - BLOCK
      ?auto_39334 - BLOCK
    )
    :vars
    (
      ?auto_39335 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39330 ?auto_39331 ) ) ( not ( = ?auto_39330 ?auto_39332 ) ) ( not ( = ?auto_39330 ?auto_39333 ) ) ( not ( = ?auto_39330 ?auto_39334 ) ) ( not ( = ?auto_39331 ?auto_39332 ) ) ( not ( = ?auto_39331 ?auto_39333 ) ) ( not ( = ?auto_39331 ?auto_39334 ) ) ( not ( = ?auto_39332 ?auto_39333 ) ) ( not ( = ?auto_39332 ?auto_39334 ) ) ( not ( = ?auto_39333 ?auto_39334 ) ) ( ON-TABLE ?auto_39334 ) ( ON ?auto_39333 ?auto_39334 ) ( ON ?auto_39330 ?auto_39335 ) ( not ( = ?auto_39330 ?auto_39335 ) ) ( not ( = ?auto_39331 ?auto_39335 ) ) ( not ( = ?auto_39332 ?auto_39335 ) ) ( not ( = ?auto_39333 ?auto_39335 ) ) ( not ( = ?auto_39334 ?auto_39335 ) ) ( ON ?auto_39331 ?auto_39330 ) ( ON-TABLE ?auto_39335 ) ( CLEAR ?auto_39333 ) ( ON ?auto_39332 ?auto_39331 ) ( CLEAR ?auto_39332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39335 ?auto_39330 ?auto_39331 )
      ( MAKE-5PILE ?auto_39330 ?auto_39331 ?auto_39332 ?auto_39333 ?auto_39334 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39336 - BLOCK
      ?auto_39337 - BLOCK
      ?auto_39338 - BLOCK
      ?auto_39339 - BLOCK
      ?auto_39340 - BLOCK
    )
    :vars
    (
      ?auto_39341 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39336 ?auto_39337 ) ) ( not ( = ?auto_39336 ?auto_39338 ) ) ( not ( = ?auto_39336 ?auto_39339 ) ) ( not ( = ?auto_39336 ?auto_39340 ) ) ( not ( = ?auto_39337 ?auto_39338 ) ) ( not ( = ?auto_39337 ?auto_39339 ) ) ( not ( = ?auto_39337 ?auto_39340 ) ) ( not ( = ?auto_39338 ?auto_39339 ) ) ( not ( = ?auto_39338 ?auto_39340 ) ) ( not ( = ?auto_39339 ?auto_39340 ) ) ( ON-TABLE ?auto_39340 ) ( ON ?auto_39336 ?auto_39341 ) ( not ( = ?auto_39336 ?auto_39341 ) ) ( not ( = ?auto_39337 ?auto_39341 ) ) ( not ( = ?auto_39338 ?auto_39341 ) ) ( not ( = ?auto_39339 ?auto_39341 ) ) ( not ( = ?auto_39340 ?auto_39341 ) ) ( ON ?auto_39337 ?auto_39336 ) ( ON-TABLE ?auto_39341 ) ( ON ?auto_39338 ?auto_39337 ) ( CLEAR ?auto_39338 ) ( HOLDING ?auto_39339 ) ( CLEAR ?auto_39340 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39340 ?auto_39339 )
      ( MAKE-5PILE ?auto_39336 ?auto_39337 ?auto_39338 ?auto_39339 ?auto_39340 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39342 - BLOCK
      ?auto_39343 - BLOCK
      ?auto_39344 - BLOCK
      ?auto_39345 - BLOCK
      ?auto_39346 - BLOCK
    )
    :vars
    (
      ?auto_39347 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39342 ?auto_39343 ) ) ( not ( = ?auto_39342 ?auto_39344 ) ) ( not ( = ?auto_39342 ?auto_39345 ) ) ( not ( = ?auto_39342 ?auto_39346 ) ) ( not ( = ?auto_39343 ?auto_39344 ) ) ( not ( = ?auto_39343 ?auto_39345 ) ) ( not ( = ?auto_39343 ?auto_39346 ) ) ( not ( = ?auto_39344 ?auto_39345 ) ) ( not ( = ?auto_39344 ?auto_39346 ) ) ( not ( = ?auto_39345 ?auto_39346 ) ) ( ON-TABLE ?auto_39346 ) ( ON ?auto_39342 ?auto_39347 ) ( not ( = ?auto_39342 ?auto_39347 ) ) ( not ( = ?auto_39343 ?auto_39347 ) ) ( not ( = ?auto_39344 ?auto_39347 ) ) ( not ( = ?auto_39345 ?auto_39347 ) ) ( not ( = ?auto_39346 ?auto_39347 ) ) ( ON ?auto_39343 ?auto_39342 ) ( ON-TABLE ?auto_39347 ) ( ON ?auto_39344 ?auto_39343 ) ( CLEAR ?auto_39346 ) ( ON ?auto_39345 ?auto_39344 ) ( CLEAR ?auto_39345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39347 ?auto_39342 ?auto_39343 ?auto_39344 )
      ( MAKE-5PILE ?auto_39342 ?auto_39343 ?auto_39344 ?auto_39345 ?auto_39346 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39348 - BLOCK
      ?auto_39349 - BLOCK
      ?auto_39350 - BLOCK
      ?auto_39351 - BLOCK
      ?auto_39352 - BLOCK
    )
    :vars
    (
      ?auto_39353 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39348 ?auto_39349 ) ) ( not ( = ?auto_39348 ?auto_39350 ) ) ( not ( = ?auto_39348 ?auto_39351 ) ) ( not ( = ?auto_39348 ?auto_39352 ) ) ( not ( = ?auto_39349 ?auto_39350 ) ) ( not ( = ?auto_39349 ?auto_39351 ) ) ( not ( = ?auto_39349 ?auto_39352 ) ) ( not ( = ?auto_39350 ?auto_39351 ) ) ( not ( = ?auto_39350 ?auto_39352 ) ) ( not ( = ?auto_39351 ?auto_39352 ) ) ( ON ?auto_39348 ?auto_39353 ) ( not ( = ?auto_39348 ?auto_39353 ) ) ( not ( = ?auto_39349 ?auto_39353 ) ) ( not ( = ?auto_39350 ?auto_39353 ) ) ( not ( = ?auto_39351 ?auto_39353 ) ) ( not ( = ?auto_39352 ?auto_39353 ) ) ( ON ?auto_39349 ?auto_39348 ) ( ON-TABLE ?auto_39353 ) ( ON ?auto_39350 ?auto_39349 ) ( ON ?auto_39351 ?auto_39350 ) ( CLEAR ?auto_39351 ) ( HOLDING ?auto_39352 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39352 )
      ( MAKE-5PILE ?auto_39348 ?auto_39349 ?auto_39350 ?auto_39351 ?auto_39352 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39354 - BLOCK
      ?auto_39355 - BLOCK
      ?auto_39356 - BLOCK
      ?auto_39357 - BLOCK
      ?auto_39358 - BLOCK
    )
    :vars
    (
      ?auto_39359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39354 ?auto_39355 ) ) ( not ( = ?auto_39354 ?auto_39356 ) ) ( not ( = ?auto_39354 ?auto_39357 ) ) ( not ( = ?auto_39354 ?auto_39358 ) ) ( not ( = ?auto_39355 ?auto_39356 ) ) ( not ( = ?auto_39355 ?auto_39357 ) ) ( not ( = ?auto_39355 ?auto_39358 ) ) ( not ( = ?auto_39356 ?auto_39357 ) ) ( not ( = ?auto_39356 ?auto_39358 ) ) ( not ( = ?auto_39357 ?auto_39358 ) ) ( ON ?auto_39354 ?auto_39359 ) ( not ( = ?auto_39354 ?auto_39359 ) ) ( not ( = ?auto_39355 ?auto_39359 ) ) ( not ( = ?auto_39356 ?auto_39359 ) ) ( not ( = ?auto_39357 ?auto_39359 ) ) ( not ( = ?auto_39358 ?auto_39359 ) ) ( ON ?auto_39355 ?auto_39354 ) ( ON-TABLE ?auto_39359 ) ( ON ?auto_39356 ?auto_39355 ) ( ON ?auto_39357 ?auto_39356 ) ( ON ?auto_39358 ?auto_39357 ) ( CLEAR ?auto_39358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39359 ?auto_39354 ?auto_39355 ?auto_39356 ?auto_39357 )
      ( MAKE-5PILE ?auto_39354 ?auto_39355 ?auto_39356 ?auto_39357 ?auto_39358 ) )
  )

)

