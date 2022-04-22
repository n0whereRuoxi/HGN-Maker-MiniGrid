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
      ?auto_7225 - BLOCK
    )
    :vars
    (
      ?auto_7226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7225 ?auto_7226 ) ( CLEAR ?auto_7225 ) ( HAND-EMPTY ) ( not ( = ?auto_7225 ?auto_7226 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7225 ?auto_7226 )
      ( !PUTDOWN ?auto_7225 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7232 - BLOCK
      ?auto_7233 - BLOCK
    )
    :vars
    (
      ?auto_7234 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7232 ) ( ON ?auto_7233 ?auto_7234 ) ( CLEAR ?auto_7233 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7232 ) ( not ( = ?auto_7232 ?auto_7233 ) ) ( not ( = ?auto_7232 ?auto_7234 ) ) ( not ( = ?auto_7233 ?auto_7234 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7233 ?auto_7234 )
      ( !STACK ?auto_7233 ?auto_7232 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7242 - BLOCK
      ?auto_7243 - BLOCK
    )
    :vars
    (
      ?auto_7244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7243 ?auto_7244 ) ( not ( = ?auto_7242 ?auto_7243 ) ) ( not ( = ?auto_7242 ?auto_7244 ) ) ( not ( = ?auto_7243 ?auto_7244 ) ) ( ON ?auto_7242 ?auto_7243 ) ( CLEAR ?auto_7242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7242 )
      ( MAKE-2PILE ?auto_7242 ?auto_7243 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7253 - BLOCK
      ?auto_7254 - BLOCK
      ?auto_7255 - BLOCK
    )
    :vars
    (
      ?auto_7256 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7254 ) ( ON ?auto_7255 ?auto_7256 ) ( CLEAR ?auto_7255 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7253 ) ( ON ?auto_7254 ?auto_7253 ) ( not ( = ?auto_7253 ?auto_7254 ) ) ( not ( = ?auto_7253 ?auto_7255 ) ) ( not ( = ?auto_7253 ?auto_7256 ) ) ( not ( = ?auto_7254 ?auto_7255 ) ) ( not ( = ?auto_7254 ?auto_7256 ) ) ( not ( = ?auto_7255 ?auto_7256 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7255 ?auto_7256 )
      ( !STACK ?auto_7255 ?auto_7254 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7267 - BLOCK
      ?auto_7268 - BLOCK
      ?auto_7269 - BLOCK
    )
    :vars
    (
      ?auto_7270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7269 ?auto_7270 ) ( ON-TABLE ?auto_7267 ) ( not ( = ?auto_7267 ?auto_7268 ) ) ( not ( = ?auto_7267 ?auto_7269 ) ) ( not ( = ?auto_7267 ?auto_7270 ) ) ( not ( = ?auto_7268 ?auto_7269 ) ) ( not ( = ?auto_7268 ?auto_7270 ) ) ( not ( = ?auto_7269 ?auto_7270 ) ) ( CLEAR ?auto_7267 ) ( ON ?auto_7268 ?auto_7269 ) ( CLEAR ?auto_7268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7267 ?auto_7268 )
      ( MAKE-3PILE ?auto_7267 ?auto_7268 ?auto_7269 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7281 - BLOCK
      ?auto_7282 - BLOCK
      ?auto_7283 - BLOCK
    )
    :vars
    (
      ?auto_7284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7283 ?auto_7284 ) ( not ( = ?auto_7281 ?auto_7282 ) ) ( not ( = ?auto_7281 ?auto_7283 ) ) ( not ( = ?auto_7281 ?auto_7284 ) ) ( not ( = ?auto_7282 ?auto_7283 ) ) ( not ( = ?auto_7282 ?auto_7284 ) ) ( not ( = ?auto_7283 ?auto_7284 ) ) ( ON ?auto_7282 ?auto_7283 ) ( ON ?auto_7281 ?auto_7282 ) ( CLEAR ?auto_7281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7281 )
      ( MAKE-3PILE ?auto_7281 ?auto_7282 ?auto_7283 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7296 - BLOCK
      ?auto_7297 - BLOCK
      ?auto_7298 - BLOCK
      ?auto_7299 - BLOCK
    )
    :vars
    (
      ?auto_7300 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7298 ) ( ON ?auto_7299 ?auto_7300 ) ( CLEAR ?auto_7299 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7296 ) ( ON ?auto_7297 ?auto_7296 ) ( ON ?auto_7298 ?auto_7297 ) ( not ( = ?auto_7296 ?auto_7297 ) ) ( not ( = ?auto_7296 ?auto_7298 ) ) ( not ( = ?auto_7296 ?auto_7299 ) ) ( not ( = ?auto_7296 ?auto_7300 ) ) ( not ( = ?auto_7297 ?auto_7298 ) ) ( not ( = ?auto_7297 ?auto_7299 ) ) ( not ( = ?auto_7297 ?auto_7300 ) ) ( not ( = ?auto_7298 ?auto_7299 ) ) ( not ( = ?auto_7298 ?auto_7300 ) ) ( not ( = ?auto_7299 ?auto_7300 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7299 ?auto_7300 )
      ( !STACK ?auto_7299 ?auto_7298 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7314 - BLOCK
      ?auto_7315 - BLOCK
      ?auto_7316 - BLOCK
      ?auto_7317 - BLOCK
    )
    :vars
    (
      ?auto_7318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7317 ?auto_7318 ) ( ON-TABLE ?auto_7314 ) ( ON ?auto_7315 ?auto_7314 ) ( not ( = ?auto_7314 ?auto_7315 ) ) ( not ( = ?auto_7314 ?auto_7316 ) ) ( not ( = ?auto_7314 ?auto_7317 ) ) ( not ( = ?auto_7314 ?auto_7318 ) ) ( not ( = ?auto_7315 ?auto_7316 ) ) ( not ( = ?auto_7315 ?auto_7317 ) ) ( not ( = ?auto_7315 ?auto_7318 ) ) ( not ( = ?auto_7316 ?auto_7317 ) ) ( not ( = ?auto_7316 ?auto_7318 ) ) ( not ( = ?auto_7317 ?auto_7318 ) ) ( CLEAR ?auto_7315 ) ( ON ?auto_7316 ?auto_7317 ) ( CLEAR ?auto_7316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7314 ?auto_7315 ?auto_7316 )
      ( MAKE-4PILE ?auto_7314 ?auto_7315 ?auto_7316 ?auto_7317 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7332 - BLOCK
      ?auto_7333 - BLOCK
      ?auto_7334 - BLOCK
      ?auto_7335 - BLOCK
    )
    :vars
    (
      ?auto_7336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7335 ?auto_7336 ) ( ON-TABLE ?auto_7332 ) ( not ( = ?auto_7332 ?auto_7333 ) ) ( not ( = ?auto_7332 ?auto_7334 ) ) ( not ( = ?auto_7332 ?auto_7335 ) ) ( not ( = ?auto_7332 ?auto_7336 ) ) ( not ( = ?auto_7333 ?auto_7334 ) ) ( not ( = ?auto_7333 ?auto_7335 ) ) ( not ( = ?auto_7333 ?auto_7336 ) ) ( not ( = ?auto_7334 ?auto_7335 ) ) ( not ( = ?auto_7334 ?auto_7336 ) ) ( not ( = ?auto_7335 ?auto_7336 ) ) ( ON ?auto_7334 ?auto_7335 ) ( CLEAR ?auto_7332 ) ( ON ?auto_7333 ?auto_7334 ) ( CLEAR ?auto_7333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7332 ?auto_7333 )
      ( MAKE-4PILE ?auto_7332 ?auto_7333 ?auto_7334 ?auto_7335 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7350 - BLOCK
      ?auto_7351 - BLOCK
      ?auto_7352 - BLOCK
      ?auto_7353 - BLOCK
    )
    :vars
    (
      ?auto_7354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7353 ?auto_7354 ) ( not ( = ?auto_7350 ?auto_7351 ) ) ( not ( = ?auto_7350 ?auto_7352 ) ) ( not ( = ?auto_7350 ?auto_7353 ) ) ( not ( = ?auto_7350 ?auto_7354 ) ) ( not ( = ?auto_7351 ?auto_7352 ) ) ( not ( = ?auto_7351 ?auto_7353 ) ) ( not ( = ?auto_7351 ?auto_7354 ) ) ( not ( = ?auto_7352 ?auto_7353 ) ) ( not ( = ?auto_7352 ?auto_7354 ) ) ( not ( = ?auto_7353 ?auto_7354 ) ) ( ON ?auto_7352 ?auto_7353 ) ( ON ?auto_7351 ?auto_7352 ) ( ON ?auto_7350 ?auto_7351 ) ( CLEAR ?auto_7350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7350 )
      ( MAKE-4PILE ?auto_7350 ?auto_7351 ?auto_7352 ?auto_7353 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7369 - BLOCK
      ?auto_7370 - BLOCK
      ?auto_7371 - BLOCK
      ?auto_7372 - BLOCK
      ?auto_7373 - BLOCK
    )
    :vars
    (
      ?auto_7374 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7372 ) ( ON ?auto_7373 ?auto_7374 ) ( CLEAR ?auto_7373 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7369 ) ( ON ?auto_7370 ?auto_7369 ) ( ON ?auto_7371 ?auto_7370 ) ( ON ?auto_7372 ?auto_7371 ) ( not ( = ?auto_7369 ?auto_7370 ) ) ( not ( = ?auto_7369 ?auto_7371 ) ) ( not ( = ?auto_7369 ?auto_7372 ) ) ( not ( = ?auto_7369 ?auto_7373 ) ) ( not ( = ?auto_7369 ?auto_7374 ) ) ( not ( = ?auto_7370 ?auto_7371 ) ) ( not ( = ?auto_7370 ?auto_7372 ) ) ( not ( = ?auto_7370 ?auto_7373 ) ) ( not ( = ?auto_7370 ?auto_7374 ) ) ( not ( = ?auto_7371 ?auto_7372 ) ) ( not ( = ?auto_7371 ?auto_7373 ) ) ( not ( = ?auto_7371 ?auto_7374 ) ) ( not ( = ?auto_7372 ?auto_7373 ) ) ( not ( = ?auto_7372 ?auto_7374 ) ) ( not ( = ?auto_7373 ?auto_7374 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7373 ?auto_7374 )
      ( !STACK ?auto_7373 ?auto_7372 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7380 - BLOCK
      ?auto_7381 - BLOCK
      ?auto_7382 - BLOCK
      ?auto_7383 - BLOCK
      ?auto_7384 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7383 ) ( ON-TABLE ?auto_7384 ) ( CLEAR ?auto_7384 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7380 ) ( ON ?auto_7381 ?auto_7380 ) ( ON ?auto_7382 ?auto_7381 ) ( ON ?auto_7383 ?auto_7382 ) ( not ( = ?auto_7380 ?auto_7381 ) ) ( not ( = ?auto_7380 ?auto_7382 ) ) ( not ( = ?auto_7380 ?auto_7383 ) ) ( not ( = ?auto_7380 ?auto_7384 ) ) ( not ( = ?auto_7381 ?auto_7382 ) ) ( not ( = ?auto_7381 ?auto_7383 ) ) ( not ( = ?auto_7381 ?auto_7384 ) ) ( not ( = ?auto_7382 ?auto_7383 ) ) ( not ( = ?auto_7382 ?auto_7384 ) ) ( not ( = ?auto_7383 ?auto_7384 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_7384 )
      ( !STACK ?auto_7384 ?auto_7383 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7390 - BLOCK
      ?auto_7391 - BLOCK
      ?auto_7392 - BLOCK
      ?auto_7393 - BLOCK
      ?auto_7394 - BLOCK
    )
    :vars
    (
      ?auto_7395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7394 ?auto_7395 ) ( ON-TABLE ?auto_7390 ) ( ON ?auto_7391 ?auto_7390 ) ( ON ?auto_7392 ?auto_7391 ) ( not ( = ?auto_7390 ?auto_7391 ) ) ( not ( = ?auto_7390 ?auto_7392 ) ) ( not ( = ?auto_7390 ?auto_7393 ) ) ( not ( = ?auto_7390 ?auto_7394 ) ) ( not ( = ?auto_7390 ?auto_7395 ) ) ( not ( = ?auto_7391 ?auto_7392 ) ) ( not ( = ?auto_7391 ?auto_7393 ) ) ( not ( = ?auto_7391 ?auto_7394 ) ) ( not ( = ?auto_7391 ?auto_7395 ) ) ( not ( = ?auto_7392 ?auto_7393 ) ) ( not ( = ?auto_7392 ?auto_7394 ) ) ( not ( = ?auto_7392 ?auto_7395 ) ) ( not ( = ?auto_7393 ?auto_7394 ) ) ( not ( = ?auto_7393 ?auto_7395 ) ) ( not ( = ?auto_7394 ?auto_7395 ) ) ( CLEAR ?auto_7392 ) ( ON ?auto_7393 ?auto_7394 ) ( CLEAR ?auto_7393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7390 ?auto_7391 ?auto_7392 ?auto_7393 )
      ( MAKE-5PILE ?auto_7390 ?auto_7391 ?auto_7392 ?auto_7393 ?auto_7394 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7401 - BLOCK
      ?auto_7402 - BLOCK
      ?auto_7403 - BLOCK
      ?auto_7404 - BLOCK
      ?auto_7405 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7405 ) ( ON-TABLE ?auto_7401 ) ( ON ?auto_7402 ?auto_7401 ) ( ON ?auto_7403 ?auto_7402 ) ( not ( = ?auto_7401 ?auto_7402 ) ) ( not ( = ?auto_7401 ?auto_7403 ) ) ( not ( = ?auto_7401 ?auto_7404 ) ) ( not ( = ?auto_7401 ?auto_7405 ) ) ( not ( = ?auto_7402 ?auto_7403 ) ) ( not ( = ?auto_7402 ?auto_7404 ) ) ( not ( = ?auto_7402 ?auto_7405 ) ) ( not ( = ?auto_7403 ?auto_7404 ) ) ( not ( = ?auto_7403 ?auto_7405 ) ) ( not ( = ?auto_7404 ?auto_7405 ) ) ( CLEAR ?auto_7403 ) ( ON ?auto_7404 ?auto_7405 ) ( CLEAR ?auto_7404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7401 ?auto_7402 ?auto_7403 ?auto_7404 )
      ( MAKE-5PILE ?auto_7401 ?auto_7402 ?auto_7403 ?auto_7404 ?auto_7405 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7411 - BLOCK
      ?auto_7412 - BLOCK
      ?auto_7413 - BLOCK
      ?auto_7414 - BLOCK
      ?auto_7415 - BLOCK
    )
    :vars
    (
      ?auto_7416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7415 ?auto_7416 ) ( ON-TABLE ?auto_7411 ) ( ON ?auto_7412 ?auto_7411 ) ( not ( = ?auto_7411 ?auto_7412 ) ) ( not ( = ?auto_7411 ?auto_7413 ) ) ( not ( = ?auto_7411 ?auto_7414 ) ) ( not ( = ?auto_7411 ?auto_7415 ) ) ( not ( = ?auto_7411 ?auto_7416 ) ) ( not ( = ?auto_7412 ?auto_7413 ) ) ( not ( = ?auto_7412 ?auto_7414 ) ) ( not ( = ?auto_7412 ?auto_7415 ) ) ( not ( = ?auto_7412 ?auto_7416 ) ) ( not ( = ?auto_7413 ?auto_7414 ) ) ( not ( = ?auto_7413 ?auto_7415 ) ) ( not ( = ?auto_7413 ?auto_7416 ) ) ( not ( = ?auto_7414 ?auto_7415 ) ) ( not ( = ?auto_7414 ?auto_7416 ) ) ( not ( = ?auto_7415 ?auto_7416 ) ) ( ON ?auto_7414 ?auto_7415 ) ( CLEAR ?auto_7412 ) ( ON ?auto_7413 ?auto_7414 ) ( CLEAR ?auto_7413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7411 ?auto_7412 ?auto_7413 )
      ( MAKE-5PILE ?auto_7411 ?auto_7412 ?auto_7413 ?auto_7414 ?auto_7415 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7422 - BLOCK
      ?auto_7423 - BLOCK
      ?auto_7424 - BLOCK
      ?auto_7425 - BLOCK
      ?auto_7426 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7426 ) ( ON-TABLE ?auto_7422 ) ( ON ?auto_7423 ?auto_7422 ) ( not ( = ?auto_7422 ?auto_7423 ) ) ( not ( = ?auto_7422 ?auto_7424 ) ) ( not ( = ?auto_7422 ?auto_7425 ) ) ( not ( = ?auto_7422 ?auto_7426 ) ) ( not ( = ?auto_7423 ?auto_7424 ) ) ( not ( = ?auto_7423 ?auto_7425 ) ) ( not ( = ?auto_7423 ?auto_7426 ) ) ( not ( = ?auto_7424 ?auto_7425 ) ) ( not ( = ?auto_7424 ?auto_7426 ) ) ( not ( = ?auto_7425 ?auto_7426 ) ) ( ON ?auto_7425 ?auto_7426 ) ( CLEAR ?auto_7423 ) ( ON ?auto_7424 ?auto_7425 ) ( CLEAR ?auto_7424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7422 ?auto_7423 ?auto_7424 )
      ( MAKE-5PILE ?auto_7422 ?auto_7423 ?auto_7424 ?auto_7425 ?auto_7426 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7432 - BLOCK
      ?auto_7433 - BLOCK
      ?auto_7434 - BLOCK
      ?auto_7435 - BLOCK
      ?auto_7436 - BLOCK
    )
    :vars
    (
      ?auto_7437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7436 ?auto_7437 ) ( ON-TABLE ?auto_7432 ) ( not ( = ?auto_7432 ?auto_7433 ) ) ( not ( = ?auto_7432 ?auto_7434 ) ) ( not ( = ?auto_7432 ?auto_7435 ) ) ( not ( = ?auto_7432 ?auto_7436 ) ) ( not ( = ?auto_7432 ?auto_7437 ) ) ( not ( = ?auto_7433 ?auto_7434 ) ) ( not ( = ?auto_7433 ?auto_7435 ) ) ( not ( = ?auto_7433 ?auto_7436 ) ) ( not ( = ?auto_7433 ?auto_7437 ) ) ( not ( = ?auto_7434 ?auto_7435 ) ) ( not ( = ?auto_7434 ?auto_7436 ) ) ( not ( = ?auto_7434 ?auto_7437 ) ) ( not ( = ?auto_7435 ?auto_7436 ) ) ( not ( = ?auto_7435 ?auto_7437 ) ) ( not ( = ?auto_7436 ?auto_7437 ) ) ( ON ?auto_7435 ?auto_7436 ) ( ON ?auto_7434 ?auto_7435 ) ( CLEAR ?auto_7432 ) ( ON ?auto_7433 ?auto_7434 ) ( CLEAR ?auto_7433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7432 ?auto_7433 )
      ( MAKE-5PILE ?auto_7432 ?auto_7433 ?auto_7434 ?auto_7435 ?auto_7436 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7443 - BLOCK
      ?auto_7444 - BLOCK
      ?auto_7445 - BLOCK
      ?auto_7446 - BLOCK
      ?auto_7447 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7447 ) ( ON-TABLE ?auto_7443 ) ( not ( = ?auto_7443 ?auto_7444 ) ) ( not ( = ?auto_7443 ?auto_7445 ) ) ( not ( = ?auto_7443 ?auto_7446 ) ) ( not ( = ?auto_7443 ?auto_7447 ) ) ( not ( = ?auto_7444 ?auto_7445 ) ) ( not ( = ?auto_7444 ?auto_7446 ) ) ( not ( = ?auto_7444 ?auto_7447 ) ) ( not ( = ?auto_7445 ?auto_7446 ) ) ( not ( = ?auto_7445 ?auto_7447 ) ) ( not ( = ?auto_7446 ?auto_7447 ) ) ( ON ?auto_7446 ?auto_7447 ) ( ON ?auto_7445 ?auto_7446 ) ( CLEAR ?auto_7443 ) ( ON ?auto_7444 ?auto_7445 ) ( CLEAR ?auto_7444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7443 ?auto_7444 )
      ( MAKE-5PILE ?auto_7443 ?auto_7444 ?auto_7445 ?auto_7446 ?auto_7447 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7453 - BLOCK
      ?auto_7454 - BLOCK
      ?auto_7455 - BLOCK
      ?auto_7456 - BLOCK
      ?auto_7457 - BLOCK
    )
    :vars
    (
      ?auto_7458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7457 ?auto_7458 ) ( not ( = ?auto_7453 ?auto_7454 ) ) ( not ( = ?auto_7453 ?auto_7455 ) ) ( not ( = ?auto_7453 ?auto_7456 ) ) ( not ( = ?auto_7453 ?auto_7457 ) ) ( not ( = ?auto_7453 ?auto_7458 ) ) ( not ( = ?auto_7454 ?auto_7455 ) ) ( not ( = ?auto_7454 ?auto_7456 ) ) ( not ( = ?auto_7454 ?auto_7457 ) ) ( not ( = ?auto_7454 ?auto_7458 ) ) ( not ( = ?auto_7455 ?auto_7456 ) ) ( not ( = ?auto_7455 ?auto_7457 ) ) ( not ( = ?auto_7455 ?auto_7458 ) ) ( not ( = ?auto_7456 ?auto_7457 ) ) ( not ( = ?auto_7456 ?auto_7458 ) ) ( not ( = ?auto_7457 ?auto_7458 ) ) ( ON ?auto_7456 ?auto_7457 ) ( ON ?auto_7455 ?auto_7456 ) ( ON ?auto_7454 ?auto_7455 ) ( ON ?auto_7453 ?auto_7454 ) ( CLEAR ?auto_7453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7453 )
      ( MAKE-5PILE ?auto_7453 ?auto_7454 ?auto_7455 ?auto_7456 ?auto_7457 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7464 - BLOCK
      ?auto_7465 - BLOCK
      ?auto_7466 - BLOCK
      ?auto_7467 - BLOCK
      ?auto_7468 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7468 ) ( not ( = ?auto_7464 ?auto_7465 ) ) ( not ( = ?auto_7464 ?auto_7466 ) ) ( not ( = ?auto_7464 ?auto_7467 ) ) ( not ( = ?auto_7464 ?auto_7468 ) ) ( not ( = ?auto_7465 ?auto_7466 ) ) ( not ( = ?auto_7465 ?auto_7467 ) ) ( not ( = ?auto_7465 ?auto_7468 ) ) ( not ( = ?auto_7466 ?auto_7467 ) ) ( not ( = ?auto_7466 ?auto_7468 ) ) ( not ( = ?auto_7467 ?auto_7468 ) ) ( ON ?auto_7467 ?auto_7468 ) ( ON ?auto_7466 ?auto_7467 ) ( ON ?auto_7465 ?auto_7466 ) ( ON ?auto_7464 ?auto_7465 ) ( CLEAR ?auto_7464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7464 )
      ( MAKE-5PILE ?auto_7464 ?auto_7465 ?auto_7466 ?auto_7467 ?auto_7468 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7474 - BLOCK
      ?auto_7475 - BLOCK
      ?auto_7476 - BLOCK
      ?auto_7477 - BLOCK
      ?auto_7478 - BLOCK
    )
    :vars
    (
      ?auto_7479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7474 ?auto_7475 ) ) ( not ( = ?auto_7474 ?auto_7476 ) ) ( not ( = ?auto_7474 ?auto_7477 ) ) ( not ( = ?auto_7474 ?auto_7478 ) ) ( not ( = ?auto_7475 ?auto_7476 ) ) ( not ( = ?auto_7475 ?auto_7477 ) ) ( not ( = ?auto_7475 ?auto_7478 ) ) ( not ( = ?auto_7476 ?auto_7477 ) ) ( not ( = ?auto_7476 ?auto_7478 ) ) ( not ( = ?auto_7477 ?auto_7478 ) ) ( ON ?auto_7474 ?auto_7479 ) ( not ( = ?auto_7478 ?auto_7479 ) ) ( not ( = ?auto_7477 ?auto_7479 ) ) ( not ( = ?auto_7476 ?auto_7479 ) ) ( not ( = ?auto_7475 ?auto_7479 ) ) ( not ( = ?auto_7474 ?auto_7479 ) ) ( ON ?auto_7475 ?auto_7474 ) ( ON ?auto_7476 ?auto_7475 ) ( ON ?auto_7477 ?auto_7476 ) ( ON ?auto_7478 ?auto_7477 ) ( CLEAR ?auto_7478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_7478 ?auto_7477 ?auto_7476 ?auto_7475 ?auto_7474 )
      ( MAKE-5PILE ?auto_7474 ?auto_7475 ?auto_7476 ?auto_7477 ?auto_7478 ) )
  )

)

