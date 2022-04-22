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
      ?auto_23261 - BLOCK
      ?auto_23262 - BLOCK
      ?auto_23263 - BLOCK
      ?auto_23264 - BLOCK
      ?auto_23265 - BLOCK
    )
    :vars
    (
      ?auto_23266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23266 ?auto_23265 ) ( CLEAR ?auto_23266 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23261 ) ( ON ?auto_23262 ?auto_23261 ) ( ON ?auto_23263 ?auto_23262 ) ( ON ?auto_23264 ?auto_23263 ) ( ON ?auto_23265 ?auto_23264 ) ( not ( = ?auto_23261 ?auto_23262 ) ) ( not ( = ?auto_23261 ?auto_23263 ) ) ( not ( = ?auto_23261 ?auto_23264 ) ) ( not ( = ?auto_23261 ?auto_23265 ) ) ( not ( = ?auto_23261 ?auto_23266 ) ) ( not ( = ?auto_23262 ?auto_23263 ) ) ( not ( = ?auto_23262 ?auto_23264 ) ) ( not ( = ?auto_23262 ?auto_23265 ) ) ( not ( = ?auto_23262 ?auto_23266 ) ) ( not ( = ?auto_23263 ?auto_23264 ) ) ( not ( = ?auto_23263 ?auto_23265 ) ) ( not ( = ?auto_23263 ?auto_23266 ) ) ( not ( = ?auto_23264 ?auto_23265 ) ) ( not ( = ?auto_23264 ?auto_23266 ) ) ( not ( = ?auto_23265 ?auto_23266 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23266 ?auto_23265 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23268 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_23268 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_23268 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23269 - BLOCK
    )
    :vars
    (
      ?auto_23270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23269 ?auto_23270 ) ( CLEAR ?auto_23269 ) ( HAND-EMPTY ) ( not ( = ?auto_23269 ?auto_23270 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23269 ?auto_23270 )
      ( MAKE-1PILE ?auto_23269 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23275 - BLOCK
      ?auto_23276 - BLOCK
      ?auto_23277 - BLOCK
      ?auto_23278 - BLOCK
    )
    :vars
    (
      ?auto_23279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23279 ?auto_23278 ) ( CLEAR ?auto_23279 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23275 ) ( ON ?auto_23276 ?auto_23275 ) ( ON ?auto_23277 ?auto_23276 ) ( ON ?auto_23278 ?auto_23277 ) ( not ( = ?auto_23275 ?auto_23276 ) ) ( not ( = ?auto_23275 ?auto_23277 ) ) ( not ( = ?auto_23275 ?auto_23278 ) ) ( not ( = ?auto_23275 ?auto_23279 ) ) ( not ( = ?auto_23276 ?auto_23277 ) ) ( not ( = ?auto_23276 ?auto_23278 ) ) ( not ( = ?auto_23276 ?auto_23279 ) ) ( not ( = ?auto_23277 ?auto_23278 ) ) ( not ( = ?auto_23277 ?auto_23279 ) ) ( not ( = ?auto_23278 ?auto_23279 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23279 ?auto_23278 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23280 - BLOCK
      ?auto_23281 - BLOCK
      ?auto_23282 - BLOCK
      ?auto_23283 - BLOCK
    )
    :vars
    (
      ?auto_23284 - BLOCK
      ?auto_23285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23284 ?auto_23283 ) ( CLEAR ?auto_23284 ) ( ON-TABLE ?auto_23280 ) ( ON ?auto_23281 ?auto_23280 ) ( ON ?auto_23282 ?auto_23281 ) ( ON ?auto_23283 ?auto_23282 ) ( not ( = ?auto_23280 ?auto_23281 ) ) ( not ( = ?auto_23280 ?auto_23282 ) ) ( not ( = ?auto_23280 ?auto_23283 ) ) ( not ( = ?auto_23280 ?auto_23284 ) ) ( not ( = ?auto_23281 ?auto_23282 ) ) ( not ( = ?auto_23281 ?auto_23283 ) ) ( not ( = ?auto_23281 ?auto_23284 ) ) ( not ( = ?auto_23282 ?auto_23283 ) ) ( not ( = ?auto_23282 ?auto_23284 ) ) ( not ( = ?auto_23283 ?auto_23284 ) ) ( HOLDING ?auto_23285 ) ( not ( = ?auto_23280 ?auto_23285 ) ) ( not ( = ?auto_23281 ?auto_23285 ) ) ( not ( = ?auto_23282 ?auto_23285 ) ) ( not ( = ?auto_23283 ?auto_23285 ) ) ( not ( = ?auto_23284 ?auto_23285 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_23285 )
      ( MAKE-4PILE ?auto_23280 ?auto_23281 ?auto_23282 ?auto_23283 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23286 - BLOCK
      ?auto_23287 - BLOCK
      ?auto_23288 - BLOCK
      ?auto_23289 - BLOCK
    )
    :vars
    (
      ?auto_23290 - BLOCK
      ?auto_23291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23290 ?auto_23289 ) ( ON-TABLE ?auto_23286 ) ( ON ?auto_23287 ?auto_23286 ) ( ON ?auto_23288 ?auto_23287 ) ( ON ?auto_23289 ?auto_23288 ) ( not ( = ?auto_23286 ?auto_23287 ) ) ( not ( = ?auto_23286 ?auto_23288 ) ) ( not ( = ?auto_23286 ?auto_23289 ) ) ( not ( = ?auto_23286 ?auto_23290 ) ) ( not ( = ?auto_23287 ?auto_23288 ) ) ( not ( = ?auto_23287 ?auto_23289 ) ) ( not ( = ?auto_23287 ?auto_23290 ) ) ( not ( = ?auto_23288 ?auto_23289 ) ) ( not ( = ?auto_23288 ?auto_23290 ) ) ( not ( = ?auto_23289 ?auto_23290 ) ) ( not ( = ?auto_23286 ?auto_23291 ) ) ( not ( = ?auto_23287 ?auto_23291 ) ) ( not ( = ?auto_23288 ?auto_23291 ) ) ( not ( = ?auto_23289 ?auto_23291 ) ) ( not ( = ?auto_23290 ?auto_23291 ) ) ( ON ?auto_23291 ?auto_23290 ) ( CLEAR ?auto_23291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23286 ?auto_23287 ?auto_23288 ?auto_23289 ?auto_23290 )
      ( MAKE-4PILE ?auto_23286 ?auto_23287 ?auto_23288 ?auto_23289 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23294 - BLOCK
      ?auto_23295 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_23295 ) ( CLEAR ?auto_23294 ) ( ON-TABLE ?auto_23294 ) ( not ( = ?auto_23294 ?auto_23295 ) ) )
    :subtasks
    ( ( !STACK ?auto_23295 ?auto_23294 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23296 - BLOCK
      ?auto_23297 - BLOCK
    )
    :vars
    (
      ?auto_23298 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23296 ) ( ON-TABLE ?auto_23296 ) ( not ( = ?auto_23296 ?auto_23297 ) ) ( ON ?auto_23297 ?auto_23298 ) ( CLEAR ?auto_23297 ) ( HAND-EMPTY ) ( not ( = ?auto_23296 ?auto_23298 ) ) ( not ( = ?auto_23297 ?auto_23298 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23297 ?auto_23298 )
      ( MAKE-2PILE ?auto_23296 ?auto_23297 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23299 - BLOCK
      ?auto_23300 - BLOCK
    )
    :vars
    (
      ?auto_23301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23299 ?auto_23300 ) ) ( ON ?auto_23300 ?auto_23301 ) ( CLEAR ?auto_23300 ) ( not ( = ?auto_23299 ?auto_23301 ) ) ( not ( = ?auto_23300 ?auto_23301 ) ) ( HOLDING ?auto_23299 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23299 )
      ( MAKE-2PILE ?auto_23299 ?auto_23300 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23302 - BLOCK
      ?auto_23303 - BLOCK
    )
    :vars
    (
      ?auto_23304 - BLOCK
      ?auto_23306 - BLOCK
      ?auto_23307 - BLOCK
      ?auto_23305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23302 ?auto_23303 ) ) ( ON ?auto_23303 ?auto_23304 ) ( not ( = ?auto_23302 ?auto_23304 ) ) ( not ( = ?auto_23303 ?auto_23304 ) ) ( ON ?auto_23302 ?auto_23303 ) ( CLEAR ?auto_23302 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23306 ) ( ON ?auto_23307 ?auto_23306 ) ( ON ?auto_23305 ?auto_23307 ) ( ON ?auto_23304 ?auto_23305 ) ( not ( = ?auto_23306 ?auto_23307 ) ) ( not ( = ?auto_23306 ?auto_23305 ) ) ( not ( = ?auto_23306 ?auto_23304 ) ) ( not ( = ?auto_23306 ?auto_23303 ) ) ( not ( = ?auto_23306 ?auto_23302 ) ) ( not ( = ?auto_23307 ?auto_23305 ) ) ( not ( = ?auto_23307 ?auto_23304 ) ) ( not ( = ?auto_23307 ?auto_23303 ) ) ( not ( = ?auto_23307 ?auto_23302 ) ) ( not ( = ?auto_23305 ?auto_23304 ) ) ( not ( = ?auto_23305 ?auto_23303 ) ) ( not ( = ?auto_23305 ?auto_23302 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23306 ?auto_23307 ?auto_23305 ?auto_23304 ?auto_23303 )
      ( MAKE-2PILE ?auto_23302 ?auto_23303 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23311 - BLOCK
      ?auto_23312 - BLOCK
      ?auto_23313 - BLOCK
    )
    :vars
    (
      ?auto_23314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23314 ?auto_23313 ) ( CLEAR ?auto_23314 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23311 ) ( ON ?auto_23312 ?auto_23311 ) ( ON ?auto_23313 ?auto_23312 ) ( not ( = ?auto_23311 ?auto_23312 ) ) ( not ( = ?auto_23311 ?auto_23313 ) ) ( not ( = ?auto_23311 ?auto_23314 ) ) ( not ( = ?auto_23312 ?auto_23313 ) ) ( not ( = ?auto_23312 ?auto_23314 ) ) ( not ( = ?auto_23313 ?auto_23314 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23314 ?auto_23313 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23315 - BLOCK
      ?auto_23316 - BLOCK
      ?auto_23317 - BLOCK
    )
    :vars
    (
      ?auto_23318 - BLOCK
      ?auto_23319 - BLOCK
      ?auto_23320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23318 ?auto_23317 ) ( CLEAR ?auto_23318 ) ( ON-TABLE ?auto_23315 ) ( ON ?auto_23316 ?auto_23315 ) ( ON ?auto_23317 ?auto_23316 ) ( not ( = ?auto_23315 ?auto_23316 ) ) ( not ( = ?auto_23315 ?auto_23317 ) ) ( not ( = ?auto_23315 ?auto_23318 ) ) ( not ( = ?auto_23316 ?auto_23317 ) ) ( not ( = ?auto_23316 ?auto_23318 ) ) ( not ( = ?auto_23317 ?auto_23318 ) ) ( HOLDING ?auto_23319 ) ( CLEAR ?auto_23320 ) ( not ( = ?auto_23315 ?auto_23319 ) ) ( not ( = ?auto_23315 ?auto_23320 ) ) ( not ( = ?auto_23316 ?auto_23319 ) ) ( not ( = ?auto_23316 ?auto_23320 ) ) ( not ( = ?auto_23317 ?auto_23319 ) ) ( not ( = ?auto_23317 ?auto_23320 ) ) ( not ( = ?auto_23318 ?auto_23319 ) ) ( not ( = ?auto_23318 ?auto_23320 ) ) ( not ( = ?auto_23319 ?auto_23320 ) ) )
    :subtasks
    ( ( !STACK ?auto_23319 ?auto_23320 )
      ( MAKE-3PILE ?auto_23315 ?auto_23316 ?auto_23317 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23683 - BLOCK
      ?auto_23684 - BLOCK
      ?auto_23685 - BLOCK
    )
    :vars
    (
      ?auto_23686 - BLOCK
      ?auto_23687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23686 ?auto_23685 ) ( ON-TABLE ?auto_23683 ) ( ON ?auto_23684 ?auto_23683 ) ( ON ?auto_23685 ?auto_23684 ) ( not ( = ?auto_23683 ?auto_23684 ) ) ( not ( = ?auto_23683 ?auto_23685 ) ) ( not ( = ?auto_23683 ?auto_23686 ) ) ( not ( = ?auto_23684 ?auto_23685 ) ) ( not ( = ?auto_23684 ?auto_23686 ) ) ( not ( = ?auto_23685 ?auto_23686 ) ) ( not ( = ?auto_23683 ?auto_23687 ) ) ( not ( = ?auto_23684 ?auto_23687 ) ) ( not ( = ?auto_23685 ?auto_23687 ) ) ( not ( = ?auto_23686 ?auto_23687 ) ) ( ON ?auto_23687 ?auto_23686 ) ( CLEAR ?auto_23687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23683 ?auto_23684 ?auto_23685 ?auto_23686 )
      ( MAKE-3PILE ?auto_23683 ?auto_23684 ?auto_23685 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23327 - BLOCK
      ?auto_23328 - BLOCK
      ?auto_23329 - BLOCK
    )
    :vars
    (
      ?auto_23330 - BLOCK
      ?auto_23331 - BLOCK
      ?auto_23332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23330 ?auto_23329 ) ( ON-TABLE ?auto_23327 ) ( ON ?auto_23328 ?auto_23327 ) ( ON ?auto_23329 ?auto_23328 ) ( not ( = ?auto_23327 ?auto_23328 ) ) ( not ( = ?auto_23327 ?auto_23329 ) ) ( not ( = ?auto_23327 ?auto_23330 ) ) ( not ( = ?auto_23328 ?auto_23329 ) ) ( not ( = ?auto_23328 ?auto_23330 ) ) ( not ( = ?auto_23329 ?auto_23330 ) ) ( not ( = ?auto_23327 ?auto_23331 ) ) ( not ( = ?auto_23327 ?auto_23332 ) ) ( not ( = ?auto_23328 ?auto_23331 ) ) ( not ( = ?auto_23328 ?auto_23332 ) ) ( not ( = ?auto_23329 ?auto_23331 ) ) ( not ( = ?auto_23329 ?auto_23332 ) ) ( not ( = ?auto_23330 ?auto_23331 ) ) ( not ( = ?auto_23330 ?auto_23332 ) ) ( not ( = ?auto_23331 ?auto_23332 ) ) ( ON ?auto_23331 ?auto_23330 ) ( CLEAR ?auto_23331 ) ( HOLDING ?auto_23332 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23332 )
      ( MAKE-3PILE ?auto_23327 ?auto_23328 ?auto_23329 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23333 - BLOCK
      ?auto_23334 - BLOCK
      ?auto_23335 - BLOCK
    )
    :vars
    (
      ?auto_23337 - BLOCK
      ?auto_23338 - BLOCK
      ?auto_23336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23337 ?auto_23335 ) ( ON-TABLE ?auto_23333 ) ( ON ?auto_23334 ?auto_23333 ) ( ON ?auto_23335 ?auto_23334 ) ( not ( = ?auto_23333 ?auto_23334 ) ) ( not ( = ?auto_23333 ?auto_23335 ) ) ( not ( = ?auto_23333 ?auto_23337 ) ) ( not ( = ?auto_23334 ?auto_23335 ) ) ( not ( = ?auto_23334 ?auto_23337 ) ) ( not ( = ?auto_23335 ?auto_23337 ) ) ( not ( = ?auto_23333 ?auto_23338 ) ) ( not ( = ?auto_23333 ?auto_23336 ) ) ( not ( = ?auto_23334 ?auto_23338 ) ) ( not ( = ?auto_23334 ?auto_23336 ) ) ( not ( = ?auto_23335 ?auto_23338 ) ) ( not ( = ?auto_23335 ?auto_23336 ) ) ( not ( = ?auto_23337 ?auto_23338 ) ) ( not ( = ?auto_23337 ?auto_23336 ) ) ( not ( = ?auto_23338 ?auto_23336 ) ) ( ON ?auto_23338 ?auto_23337 ) ( ON ?auto_23336 ?auto_23338 ) ( CLEAR ?auto_23336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23333 ?auto_23334 ?auto_23335 ?auto_23337 ?auto_23338 )
      ( MAKE-3PILE ?auto_23333 ?auto_23334 ?auto_23335 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23342 - BLOCK
      ?auto_23343 - BLOCK
      ?auto_23344 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_23344 ) ( CLEAR ?auto_23343 ) ( ON-TABLE ?auto_23342 ) ( ON ?auto_23343 ?auto_23342 ) ( not ( = ?auto_23342 ?auto_23343 ) ) ( not ( = ?auto_23342 ?auto_23344 ) ) ( not ( = ?auto_23343 ?auto_23344 ) ) )
    :subtasks
    ( ( !STACK ?auto_23344 ?auto_23343 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23345 - BLOCK
      ?auto_23346 - BLOCK
      ?auto_23347 - BLOCK
    )
    :vars
    (
      ?auto_23348 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23346 ) ( ON-TABLE ?auto_23345 ) ( ON ?auto_23346 ?auto_23345 ) ( not ( = ?auto_23345 ?auto_23346 ) ) ( not ( = ?auto_23345 ?auto_23347 ) ) ( not ( = ?auto_23346 ?auto_23347 ) ) ( ON ?auto_23347 ?auto_23348 ) ( CLEAR ?auto_23347 ) ( HAND-EMPTY ) ( not ( = ?auto_23345 ?auto_23348 ) ) ( not ( = ?auto_23346 ?auto_23348 ) ) ( not ( = ?auto_23347 ?auto_23348 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23347 ?auto_23348 )
      ( MAKE-3PILE ?auto_23345 ?auto_23346 ?auto_23347 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23349 - BLOCK
      ?auto_23350 - BLOCK
      ?auto_23351 - BLOCK
    )
    :vars
    (
      ?auto_23352 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23349 ) ( not ( = ?auto_23349 ?auto_23350 ) ) ( not ( = ?auto_23349 ?auto_23351 ) ) ( not ( = ?auto_23350 ?auto_23351 ) ) ( ON ?auto_23351 ?auto_23352 ) ( CLEAR ?auto_23351 ) ( not ( = ?auto_23349 ?auto_23352 ) ) ( not ( = ?auto_23350 ?auto_23352 ) ) ( not ( = ?auto_23351 ?auto_23352 ) ) ( HOLDING ?auto_23350 ) ( CLEAR ?auto_23349 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23349 ?auto_23350 )
      ( MAKE-3PILE ?auto_23349 ?auto_23350 ?auto_23351 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23353 - BLOCK
      ?auto_23354 - BLOCK
      ?auto_23355 - BLOCK
    )
    :vars
    (
      ?auto_23356 - BLOCK
      ?auto_23358 - BLOCK
      ?auto_23357 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23353 ) ( not ( = ?auto_23353 ?auto_23354 ) ) ( not ( = ?auto_23353 ?auto_23355 ) ) ( not ( = ?auto_23354 ?auto_23355 ) ) ( ON ?auto_23355 ?auto_23356 ) ( not ( = ?auto_23353 ?auto_23356 ) ) ( not ( = ?auto_23354 ?auto_23356 ) ) ( not ( = ?auto_23355 ?auto_23356 ) ) ( CLEAR ?auto_23353 ) ( ON ?auto_23354 ?auto_23355 ) ( CLEAR ?auto_23354 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23358 ) ( ON ?auto_23357 ?auto_23358 ) ( ON ?auto_23356 ?auto_23357 ) ( not ( = ?auto_23358 ?auto_23357 ) ) ( not ( = ?auto_23358 ?auto_23356 ) ) ( not ( = ?auto_23358 ?auto_23355 ) ) ( not ( = ?auto_23358 ?auto_23354 ) ) ( not ( = ?auto_23357 ?auto_23356 ) ) ( not ( = ?auto_23357 ?auto_23355 ) ) ( not ( = ?auto_23357 ?auto_23354 ) ) ( not ( = ?auto_23353 ?auto_23358 ) ) ( not ( = ?auto_23353 ?auto_23357 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23358 ?auto_23357 ?auto_23356 ?auto_23355 )
      ( MAKE-3PILE ?auto_23353 ?auto_23354 ?auto_23355 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23359 - BLOCK
      ?auto_23360 - BLOCK
      ?auto_23361 - BLOCK
    )
    :vars
    (
      ?auto_23363 - BLOCK
      ?auto_23364 - BLOCK
      ?auto_23362 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23359 ?auto_23360 ) ) ( not ( = ?auto_23359 ?auto_23361 ) ) ( not ( = ?auto_23360 ?auto_23361 ) ) ( ON ?auto_23361 ?auto_23363 ) ( not ( = ?auto_23359 ?auto_23363 ) ) ( not ( = ?auto_23360 ?auto_23363 ) ) ( not ( = ?auto_23361 ?auto_23363 ) ) ( ON ?auto_23360 ?auto_23361 ) ( CLEAR ?auto_23360 ) ( ON-TABLE ?auto_23364 ) ( ON ?auto_23362 ?auto_23364 ) ( ON ?auto_23363 ?auto_23362 ) ( not ( = ?auto_23364 ?auto_23362 ) ) ( not ( = ?auto_23364 ?auto_23363 ) ) ( not ( = ?auto_23364 ?auto_23361 ) ) ( not ( = ?auto_23364 ?auto_23360 ) ) ( not ( = ?auto_23362 ?auto_23363 ) ) ( not ( = ?auto_23362 ?auto_23361 ) ) ( not ( = ?auto_23362 ?auto_23360 ) ) ( not ( = ?auto_23359 ?auto_23364 ) ) ( not ( = ?auto_23359 ?auto_23362 ) ) ( HOLDING ?auto_23359 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23359 )
      ( MAKE-3PILE ?auto_23359 ?auto_23360 ?auto_23361 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23365 - BLOCK
      ?auto_23366 - BLOCK
      ?auto_23367 - BLOCK
    )
    :vars
    (
      ?auto_23368 - BLOCK
      ?auto_23369 - BLOCK
      ?auto_23370 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23365 ?auto_23366 ) ) ( not ( = ?auto_23365 ?auto_23367 ) ) ( not ( = ?auto_23366 ?auto_23367 ) ) ( ON ?auto_23367 ?auto_23368 ) ( not ( = ?auto_23365 ?auto_23368 ) ) ( not ( = ?auto_23366 ?auto_23368 ) ) ( not ( = ?auto_23367 ?auto_23368 ) ) ( ON ?auto_23366 ?auto_23367 ) ( ON-TABLE ?auto_23369 ) ( ON ?auto_23370 ?auto_23369 ) ( ON ?auto_23368 ?auto_23370 ) ( not ( = ?auto_23369 ?auto_23370 ) ) ( not ( = ?auto_23369 ?auto_23368 ) ) ( not ( = ?auto_23369 ?auto_23367 ) ) ( not ( = ?auto_23369 ?auto_23366 ) ) ( not ( = ?auto_23370 ?auto_23368 ) ) ( not ( = ?auto_23370 ?auto_23367 ) ) ( not ( = ?auto_23370 ?auto_23366 ) ) ( not ( = ?auto_23365 ?auto_23369 ) ) ( not ( = ?auto_23365 ?auto_23370 ) ) ( ON ?auto_23365 ?auto_23366 ) ( CLEAR ?auto_23365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23369 ?auto_23370 ?auto_23368 ?auto_23367 ?auto_23366 )
      ( MAKE-3PILE ?auto_23365 ?auto_23366 ?auto_23367 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23373 - BLOCK
      ?auto_23374 - BLOCK
    )
    :vars
    (
      ?auto_23375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23375 ?auto_23374 ) ( CLEAR ?auto_23375 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23373 ) ( ON ?auto_23374 ?auto_23373 ) ( not ( = ?auto_23373 ?auto_23374 ) ) ( not ( = ?auto_23373 ?auto_23375 ) ) ( not ( = ?auto_23374 ?auto_23375 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23375 ?auto_23374 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23376 - BLOCK
      ?auto_23377 - BLOCK
    )
    :vars
    (
      ?auto_23378 - BLOCK
      ?auto_23379 - BLOCK
      ?auto_23380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23378 ?auto_23377 ) ( CLEAR ?auto_23378 ) ( ON-TABLE ?auto_23376 ) ( ON ?auto_23377 ?auto_23376 ) ( not ( = ?auto_23376 ?auto_23377 ) ) ( not ( = ?auto_23376 ?auto_23378 ) ) ( not ( = ?auto_23377 ?auto_23378 ) ) ( HOLDING ?auto_23379 ) ( CLEAR ?auto_23380 ) ( not ( = ?auto_23376 ?auto_23379 ) ) ( not ( = ?auto_23376 ?auto_23380 ) ) ( not ( = ?auto_23377 ?auto_23379 ) ) ( not ( = ?auto_23377 ?auto_23380 ) ) ( not ( = ?auto_23378 ?auto_23379 ) ) ( not ( = ?auto_23378 ?auto_23380 ) ) ( not ( = ?auto_23379 ?auto_23380 ) ) )
    :subtasks
    ( ( !STACK ?auto_23379 ?auto_23380 )
      ( MAKE-2PILE ?auto_23376 ?auto_23377 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23381 - BLOCK
      ?auto_23382 - BLOCK
    )
    :vars
    (
      ?auto_23384 - BLOCK
      ?auto_23383 - BLOCK
      ?auto_23385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23384 ?auto_23382 ) ( ON-TABLE ?auto_23381 ) ( ON ?auto_23382 ?auto_23381 ) ( not ( = ?auto_23381 ?auto_23382 ) ) ( not ( = ?auto_23381 ?auto_23384 ) ) ( not ( = ?auto_23382 ?auto_23384 ) ) ( CLEAR ?auto_23383 ) ( not ( = ?auto_23381 ?auto_23385 ) ) ( not ( = ?auto_23381 ?auto_23383 ) ) ( not ( = ?auto_23382 ?auto_23385 ) ) ( not ( = ?auto_23382 ?auto_23383 ) ) ( not ( = ?auto_23384 ?auto_23385 ) ) ( not ( = ?auto_23384 ?auto_23383 ) ) ( not ( = ?auto_23385 ?auto_23383 ) ) ( ON ?auto_23385 ?auto_23384 ) ( CLEAR ?auto_23385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23381 ?auto_23382 ?auto_23384 )
      ( MAKE-2PILE ?auto_23381 ?auto_23382 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23386 - BLOCK
      ?auto_23387 - BLOCK
    )
    :vars
    (
      ?auto_23388 - BLOCK
      ?auto_23389 - BLOCK
      ?auto_23390 - BLOCK
      ?auto_23391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23388 ?auto_23387 ) ( ON-TABLE ?auto_23386 ) ( ON ?auto_23387 ?auto_23386 ) ( not ( = ?auto_23386 ?auto_23387 ) ) ( not ( = ?auto_23386 ?auto_23388 ) ) ( not ( = ?auto_23387 ?auto_23388 ) ) ( not ( = ?auto_23386 ?auto_23389 ) ) ( not ( = ?auto_23386 ?auto_23390 ) ) ( not ( = ?auto_23387 ?auto_23389 ) ) ( not ( = ?auto_23387 ?auto_23390 ) ) ( not ( = ?auto_23388 ?auto_23389 ) ) ( not ( = ?auto_23388 ?auto_23390 ) ) ( not ( = ?auto_23389 ?auto_23390 ) ) ( ON ?auto_23389 ?auto_23388 ) ( CLEAR ?auto_23389 ) ( HOLDING ?auto_23390 ) ( CLEAR ?auto_23391 ) ( ON-TABLE ?auto_23391 ) ( not ( = ?auto_23391 ?auto_23390 ) ) ( not ( = ?auto_23386 ?auto_23391 ) ) ( not ( = ?auto_23387 ?auto_23391 ) ) ( not ( = ?auto_23388 ?auto_23391 ) ) ( not ( = ?auto_23389 ?auto_23391 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23391 ?auto_23390 )
      ( MAKE-2PILE ?auto_23386 ?auto_23387 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23810 - BLOCK
      ?auto_23811 - BLOCK
    )
    :vars
    (
      ?auto_23813 - BLOCK
      ?auto_23814 - BLOCK
      ?auto_23812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23813 ?auto_23811 ) ( ON-TABLE ?auto_23810 ) ( ON ?auto_23811 ?auto_23810 ) ( not ( = ?auto_23810 ?auto_23811 ) ) ( not ( = ?auto_23810 ?auto_23813 ) ) ( not ( = ?auto_23811 ?auto_23813 ) ) ( not ( = ?auto_23810 ?auto_23814 ) ) ( not ( = ?auto_23810 ?auto_23812 ) ) ( not ( = ?auto_23811 ?auto_23814 ) ) ( not ( = ?auto_23811 ?auto_23812 ) ) ( not ( = ?auto_23813 ?auto_23814 ) ) ( not ( = ?auto_23813 ?auto_23812 ) ) ( not ( = ?auto_23814 ?auto_23812 ) ) ( ON ?auto_23814 ?auto_23813 ) ( ON ?auto_23812 ?auto_23814 ) ( CLEAR ?auto_23812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23810 ?auto_23811 ?auto_23813 ?auto_23814 )
      ( MAKE-2PILE ?auto_23810 ?auto_23811 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23398 - BLOCK
      ?auto_23399 - BLOCK
    )
    :vars
    (
      ?auto_23402 - BLOCK
      ?auto_23403 - BLOCK
      ?auto_23401 - BLOCK
      ?auto_23400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23402 ?auto_23399 ) ( ON-TABLE ?auto_23398 ) ( ON ?auto_23399 ?auto_23398 ) ( not ( = ?auto_23398 ?auto_23399 ) ) ( not ( = ?auto_23398 ?auto_23402 ) ) ( not ( = ?auto_23399 ?auto_23402 ) ) ( not ( = ?auto_23398 ?auto_23403 ) ) ( not ( = ?auto_23398 ?auto_23401 ) ) ( not ( = ?auto_23399 ?auto_23403 ) ) ( not ( = ?auto_23399 ?auto_23401 ) ) ( not ( = ?auto_23402 ?auto_23403 ) ) ( not ( = ?auto_23402 ?auto_23401 ) ) ( not ( = ?auto_23403 ?auto_23401 ) ) ( ON ?auto_23403 ?auto_23402 ) ( not ( = ?auto_23400 ?auto_23401 ) ) ( not ( = ?auto_23398 ?auto_23400 ) ) ( not ( = ?auto_23399 ?auto_23400 ) ) ( not ( = ?auto_23402 ?auto_23400 ) ) ( not ( = ?auto_23403 ?auto_23400 ) ) ( ON ?auto_23401 ?auto_23403 ) ( CLEAR ?auto_23401 ) ( HOLDING ?auto_23400 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23400 )
      ( MAKE-2PILE ?auto_23398 ?auto_23399 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23404 - BLOCK
      ?auto_23405 - BLOCK
    )
    :vars
    (
      ?auto_23409 - BLOCK
      ?auto_23408 - BLOCK
      ?auto_23406 - BLOCK
      ?auto_23407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23409 ?auto_23405 ) ( ON-TABLE ?auto_23404 ) ( ON ?auto_23405 ?auto_23404 ) ( not ( = ?auto_23404 ?auto_23405 ) ) ( not ( = ?auto_23404 ?auto_23409 ) ) ( not ( = ?auto_23405 ?auto_23409 ) ) ( not ( = ?auto_23404 ?auto_23408 ) ) ( not ( = ?auto_23404 ?auto_23406 ) ) ( not ( = ?auto_23405 ?auto_23408 ) ) ( not ( = ?auto_23405 ?auto_23406 ) ) ( not ( = ?auto_23409 ?auto_23408 ) ) ( not ( = ?auto_23409 ?auto_23406 ) ) ( not ( = ?auto_23408 ?auto_23406 ) ) ( ON ?auto_23408 ?auto_23409 ) ( not ( = ?auto_23407 ?auto_23406 ) ) ( not ( = ?auto_23404 ?auto_23407 ) ) ( not ( = ?auto_23405 ?auto_23407 ) ) ( not ( = ?auto_23409 ?auto_23407 ) ) ( not ( = ?auto_23408 ?auto_23407 ) ) ( ON ?auto_23406 ?auto_23408 ) ( ON ?auto_23407 ?auto_23406 ) ( CLEAR ?auto_23407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23404 ?auto_23405 ?auto_23409 ?auto_23408 ?auto_23406 )
      ( MAKE-2PILE ?auto_23404 ?auto_23405 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23414 - BLOCK
      ?auto_23415 - BLOCK
      ?auto_23416 - BLOCK
      ?auto_23417 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_23417 ) ( CLEAR ?auto_23416 ) ( ON-TABLE ?auto_23414 ) ( ON ?auto_23415 ?auto_23414 ) ( ON ?auto_23416 ?auto_23415 ) ( not ( = ?auto_23414 ?auto_23415 ) ) ( not ( = ?auto_23414 ?auto_23416 ) ) ( not ( = ?auto_23414 ?auto_23417 ) ) ( not ( = ?auto_23415 ?auto_23416 ) ) ( not ( = ?auto_23415 ?auto_23417 ) ) ( not ( = ?auto_23416 ?auto_23417 ) ) )
    :subtasks
    ( ( !STACK ?auto_23417 ?auto_23416 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23418 - BLOCK
      ?auto_23419 - BLOCK
      ?auto_23420 - BLOCK
      ?auto_23421 - BLOCK
    )
    :vars
    (
      ?auto_23422 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23420 ) ( ON-TABLE ?auto_23418 ) ( ON ?auto_23419 ?auto_23418 ) ( ON ?auto_23420 ?auto_23419 ) ( not ( = ?auto_23418 ?auto_23419 ) ) ( not ( = ?auto_23418 ?auto_23420 ) ) ( not ( = ?auto_23418 ?auto_23421 ) ) ( not ( = ?auto_23419 ?auto_23420 ) ) ( not ( = ?auto_23419 ?auto_23421 ) ) ( not ( = ?auto_23420 ?auto_23421 ) ) ( ON ?auto_23421 ?auto_23422 ) ( CLEAR ?auto_23421 ) ( HAND-EMPTY ) ( not ( = ?auto_23418 ?auto_23422 ) ) ( not ( = ?auto_23419 ?auto_23422 ) ) ( not ( = ?auto_23420 ?auto_23422 ) ) ( not ( = ?auto_23421 ?auto_23422 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23421 ?auto_23422 )
      ( MAKE-4PILE ?auto_23418 ?auto_23419 ?auto_23420 ?auto_23421 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23423 - BLOCK
      ?auto_23424 - BLOCK
      ?auto_23425 - BLOCK
      ?auto_23426 - BLOCK
    )
    :vars
    (
      ?auto_23427 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23423 ) ( ON ?auto_23424 ?auto_23423 ) ( not ( = ?auto_23423 ?auto_23424 ) ) ( not ( = ?auto_23423 ?auto_23425 ) ) ( not ( = ?auto_23423 ?auto_23426 ) ) ( not ( = ?auto_23424 ?auto_23425 ) ) ( not ( = ?auto_23424 ?auto_23426 ) ) ( not ( = ?auto_23425 ?auto_23426 ) ) ( ON ?auto_23426 ?auto_23427 ) ( CLEAR ?auto_23426 ) ( not ( = ?auto_23423 ?auto_23427 ) ) ( not ( = ?auto_23424 ?auto_23427 ) ) ( not ( = ?auto_23425 ?auto_23427 ) ) ( not ( = ?auto_23426 ?auto_23427 ) ) ( HOLDING ?auto_23425 ) ( CLEAR ?auto_23424 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23423 ?auto_23424 ?auto_23425 )
      ( MAKE-4PILE ?auto_23423 ?auto_23424 ?auto_23425 ?auto_23426 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23428 - BLOCK
      ?auto_23429 - BLOCK
      ?auto_23430 - BLOCK
      ?auto_23431 - BLOCK
    )
    :vars
    (
      ?auto_23432 - BLOCK
      ?auto_23433 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23428 ) ( ON ?auto_23429 ?auto_23428 ) ( not ( = ?auto_23428 ?auto_23429 ) ) ( not ( = ?auto_23428 ?auto_23430 ) ) ( not ( = ?auto_23428 ?auto_23431 ) ) ( not ( = ?auto_23429 ?auto_23430 ) ) ( not ( = ?auto_23429 ?auto_23431 ) ) ( not ( = ?auto_23430 ?auto_23431 ) ) ( ON ?auto_23431 ?auto_23432 ) ( not ( = ?auto_23428 ?auto_23432 ) ) ( not ( = ?auto_23429 ?auto_23432 ) ) ( not ( = ?auto_23430 ?auto_23432 ) ) ( not ( = ?auto_23431 ?auto_23432 ) ) ( CLEAR ?auto_23429 ) ( ON ?auto_23430 ?auto_23431 ) ( CLEAR ?auto_23430 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23433 ) ( ON ?auto_23432 ?auto_23433 ) ( not ( = ?auto_23433 ?auto_23432 ) ) ( not ( = ?auto_23433 ?auto_23431 ) ) ( not ( = ?auto_23433 ?auto_23430 ) ) ( not ( = ?auto_23428 ?auto_23433 ) ) ( not ( = ?auto_23429 ?auto_23433 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23433 ?auto_23432 ?auto_23431 )
      ( MAKE-4PILE ?auto_23428 ?auto_23429 ?auto_23430 ?auto_23431 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23434 - BLOCK
      ?auto_23435 - BLOCK
      ?auto_23436 - BLOCK
      ?auto_23437 - BLOCK
    )
    :vars
    (
      ?auto_23438 - BLOCK
      ?auto_23439 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23434 ) ( not ( = ?auto_23434 ?auto_23435 ) ) ( not ( = ?auto_23434 ?auto_23436 ) ) ( not ( = ?auto_23434 ?auto_23437 ) ) ( not ( = ?auto_23435 ?auto_23436 ) ) ( not ( = ?auto_23435 ?auto_23437 ) ) ( not ( = ?auto_23436 ?auto_23437 ) ) ( ON ?auto_23437 ?auto_23438 ) ( not ( = ?auto_23434 ?auto_23438 ) ) ( not ( = ?auto_23435 ?auto_23438 ) ) ( not ( = ?auto_23436 ?auto_23438 ) ) ( not ( = ?auto_23437 ?auto_23438 ) ) ( ON ?auto_23436 ?auto_23437 ) ( CLEAR ?auto_23436 ) ( ON-TABLE ?auto_23439 ) ( ON ?auto_23438 ?auto_23439 ) ( not ( = ?auto_23439 ?auto_23438 ) ) ( not ( = ?auto_23439 ?auto_23437 ) ) ( not ( = ?auto_23439 ?auto_23436 ) ) ( not ( = ?auto_23434 ?auto_23439 ) ) ( not ( = ?auto_23435 ?auto_23439 ) ) ( HOLDING ?auto_23435 ) ( CLEAR ?auto_23434 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23434 ?auto_23435 )
      ( MAKE-4PILE ?auto_23434 ?auto_23435 ?auto_23436 ?auto_23437 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23440 - BLOCK
      ?auto_23441 - BLOCK
      ?auto_23442 - BLOCK
      ?auto_23443 - BLOCK
    )
    :vars
    (
      ?auto_23445 - BLOCK
      ?auto_23444 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23440 ) ( not ( = ?auto_23440 ?auto_23441 ) ) ( not ( = ?auto_23440 ?auto_23442 ) ) ( not ( = ?auto_23440 ?auto_23443 ) ) ( not ( = ?auto_23441 ?auto_23442 ) ) ( not ( = ?auto_23441 ?auto_23443 ) ) ( not ( = ?auto_23442 ?auto_23443 ) ) ( ON ?auto_23443 ?auto_23445 ) ( not ( = ?auto_23440 ?auto_23445 ) ) ( not ( = ?auto_23441 ?auto_23445 ) ) ( not ( = ?auto_23442 ?auto_23445 ) ) ( not ( = ?auto_23443 ?auto_23445 ) ) ( ON ?auto_23442 ?auto_23443 ) ( ON-TABLE ?auto_23444 ) ( ON ?auto_23445 ?auto_23444 ) ( not ( = ?auto_23444 ?auto_23445 ) ) ( not ( = ?auto_23444 ?auto_23443 ) ) ( not ( = ?auto_23444 ?auto_23442 ) ) ( not ( = ?auto_23440 ?auto_23444 ) ) ( not ( = ?auto_23441 ?auto_23444 ) ) ( CLEAR ?auto_23440 ) ( ON ?auto_23441 ?auto_23442 ) ( CLEAR ?auto_23441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23444 ?auto_23445 ?auto_23443 ?auto_23442 )
      ( MAKE-4PILE ?auto_23440 ?auto_23441 ?auto_23442 ?auto_23443 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23446 - BLOCK
      ?auto_23447 - BLOCK
      ?auto_23448 - BLOCK
      ?auto_23449 - BLOCK
    )
    :vars
    (
      ?auto_23450 - BLOCK
      ?auto_23451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23446 ?auto_23447 ) ) ( not ( = ?auto_23446 ?auto_23448 ) ) ( not ( = ?auto_23446 ?auto_23449 ) ) ( not ( = ?auto_23447 ?auto_23448 ) ) ( not ( = ?auto_23447 ?auto_23449 ) ) ( not ( = ?auto_23448 ?auto_23449 ) ) ( ON ?auto_23449 ?auto_23450 ) ( not ( = ?auto_23446 ?auto_23450 ) ) ( not ( = ?auto_23447 ?auto_23450 ) ) ( not ( = ?auto_23448 ?auto_23450 ) ) ( not ( = ?auto_23449 ?auto_23450 ) ) ( ON ?auto_23448 ?auto_23449 ) ( ON-TABLE ?auto_23451 ) ( ON ?auto_23450 ?auto_23451 ) ( not ( = ?auto_23451 ?auto_23450 ) ) ( not ( = ?auto_23451 ?auto_23449 ) ) ( not ( = ?auto_23451 ?auto_23448 ) ) ( not ( = ?auto_23446 ?auto_23451 ) ) ( not ( = ?auto_23447 ?auto_23451 ) ) ( ON ?auto_23447 ?auto_23448 ) ( CLEAR ?auto_23447 ) ( HOLDING ?auto_23446 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23446 )
      ( MAKE-4PILE ?auto_23446 ?auto_23447 ?auto_23448 ?auto_23449 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23452 - BLOCK
      ?auto_23453 - BLOCK
      ?auto_23454 - BLOCK
      ?auto_23455 - BLOCK
    )
    :vars
    (
      ?auto_23456 - BLOCK
      ?auto_23457 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23452 ?auto_23453 ) ) ( not ( = ?auto_23452 ?auto_23454 ) ) ( not ( = ?auto_23452 ?auto_23455 ) ) ( not ( = ?auto_23453 ?auto_23454 ) ) ( not ( = ?auto_23453 ?auto_23455 ) ) ( not ( = ?auto_23454 ?auto_23455 ) ) ( ON ?auto_23455 ?auto_23456 ) ( not ( = ?auto_23452 ?auto_23456 ) ) ( not ( = ?auto_23453 ?auto_23456 ) ) ( not ( = ?auto_23454 ?auto_23456 ) ) ( not ( = ?auto_23455 ?auto_23456 ) ) ( ON ?auto_23454 ?auto_23455 ) ( ON-TABLE ?auto_23457 ) ( ON ?auto_23456 ?auto_23457 ) ( not ( = ?auto_23457 ?auto_23456 ) ) ( not ( = ?auto_23457 ?auto_23455 ) ) ( not ( = ?auto_23457 ?auto_23454 ) ) ( not ( = ?auto_23452 ?auto_23457 ) ) ( not ( = ?auto_23453 ?auto_23457 ) ) ( ON ?auto_23453 ?auto_23454 ) ( ON ?auto_23452 ?auto_23453 ) ( CLEAR ?auto_23452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23457 ?auto_23456 ?auto_23455 ?auto_23454 ?auto_23453 )
      ( MAKE-4PILE ?auto_23452 ?auto_23453 ?auto_23454 ?auto_23455 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23459 - BLOCK
    )
    :vars
    (
      ?auto_23460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23460 ?auto_23459 ) ( CLEAR ?auto_23460 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23459 ) ( not ( = ?auto_23459 ?auto_23460 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23460 ?auto_23459 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23461 - BLOCK
    )
    :vars
    (
      ?auto_23462 - BLOCK
      ?auto_23463 - BLOCK
      ?auto_23464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23462 ?auto_23461 ) ( CLEAR ?auto_23462 ) ( ON-TABLE ?auto_23461 ) ( not ( = ?auto_23461 ?auto_23462 ) ) ( HOLDING ?auto_23463 ) ( CLEAR ?auto_23464 ) ( not ( = ?auto_23461 ?auto_23463 ) ) ( not ( = ?auto_23461 ?auto_23464 ) ) ( not ( = ?auto_23462 ?auto_23463 ) ) ( not ( = ?auto_23462 ?auto_23464 ) ) ( not ( = ?auto_23463 ?auto_23464 ) ) )
    :subtasks
    ( ( !STACK ?auto_23463 ?auto_23464 )
      ( MAKE-1PILE ?auto_23461 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23465 - BLOCK
    )
    :vars
    (
      ?auto_23466 - BLOCK
      ?auto_23467 - BLOCK
      ?auto_23468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23466 ?auto_23465 ) ( ON-TABLE ?auto_23465 ) ( not ( = ?auto_23465 ?auto_23466 ) ) ( CLEAR ?auto_23467 ) ( not ( = ?auto_23465 ?auto_23468 ) ) ( not ( = ?auto_23465 ?auto_23467 ) ) ( not ( = ?auto_23466 ?auto_23468 ) ) ( not ( = ?auto_23466 ?auto_23467 ) ) ( not ( = ?auto_23468 ?auto_23467 ) ) ( ON ?auto_23468 ?auto_23466 ) ( CLEAR ?auto_23468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23465 ?auto_23466 )
      ( MAKE-1PILE ?auto_23465 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23469 - BLOCK
    )
    :vars
    (
      ?auto_23471 - BLOCK
      ?auto_23470 - BLOCK
      ?auto_23472 - BLOCK
      ?auto_23473 - BLOCK
      ?auto_23474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23471 ?auto_23469 ) ( ON-TABLE ?auto_23469 ) ( not ( = ?auto_23469 ?auto_23471 ) ) ( not ( = ?auto_23469 ?auto_23470 ) ) ( not ( = ?auto_23469 ?auto_23472 ) ) ( not ( = ?auto_23471 ?auto_23470 ) ) ( not ( = ?auto_23471 ?auto_23472 ) ) ( not ( = ?auto_23470 ?auto_23472 ) ) ( ON ?auto_23470 ?auto_23471 ) ( CLEAR ?auto_23470 ) ( HOLDING ?auto_23472 ) ( CLEAR ?auto_23473 ) ( ON-TABLE ?auto_23474 ) ( ON ?auto_23473 ?auto_23474 ) ( not ( = ?auto_23474 ?auto_23473 ) ) ( not ( = ?auto_23474 ?auto_23472 ) ) ( not ( = ?auto_23473 ?auto_23472 ) ) ( not ( = ?auto_23469 ?auto_23473 ) ) ( not ( = ?auto_23469 ?auto_23474 ) ) ( not ( = ?auto_23471 ?auto_23473 ) ) ( not ( = ?auto_23471 ?auto_23474 ) ) ( not ( = ?auto_23470 ?auto_23473 ) ) ( not ( = ?auto_23470 ?auto_23474 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23474 ?auto_23473 ?auto_23472 )
      ( MAKE-1PILE ?auto_23469 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23475 - BLOCK
    )
    :vars
    (
      ?auto_23478 - BLOCK
      ?auto_23480 - BLOCK
      ?auto_23477 - BLOCK
      ?auto_23479 - BLOCK
      ?auto_23476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23478 ?auto_23475 ) ( ON-TABLE ?auto_23475 ) ( not ( = ?auto_23475 ?auto_23478 ) ) ( not ( = ?auto_23475 ?auto_23480 ) ) ( not ( = ?auto_23475 ?auto_23477 ) ) ( not ( = ?auto_23478 ?auto_23480 ) ) ( not ( = ?auto_23478 ?auto_23477 ) ) ( not ( = ?auto_23480 ?auto_23477 ) ) ( ON ?auto_23480 ?auto_23478 ) ( CLEAR ?auto_23479 ) ( ON-TABLE ?auto_23476 ) ( ON ?auto_23479 ?auto_23476 ) ( not ( = ?auto_23476 ?auto_23479 ) ) ( not ( = ?auto_23476 ?auto_23477 ) ) ( not ( = ?auto_23479 ?auto_23477 ) ) ( not ( = ?auto_23475 ?auto_23479 ) ) ( not ( = ?auto_23475 ?auto_23476 ) ) ( not ( = ?auto_23478 ?auto_23479 ) ) ( not ( = ?auto_23478 ?auto_23476 ) ) ( not ( = ?auto_23480 ?auto_23479 ) ) ( not ( = ?auto_23480 ?auto_23476 ) ) ( ON ?auto_23477 ?auto_23480 ) ( CLEAR ?auto_23477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23475 ?auto_23478 ?auto_23480 )
      ( MAKE-1PILE ?auto_23475 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23481 - BLOCK
    )
    :vars
    (
      ?auto_23484 - BLOCK
      ?auto_23486 - BLOCK
      ?auto_23485 - BLOCK
      ?auto_23482 - BLOCK
      ?auto_23483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23484 ?auto_23481 ) ( ON-TABLE ?auto_23481 ) ( not ( = ?auto_23481 ?auto_23484 ) ) ( not ( = ?auto_23481 ?auto_23486 ) ) ( not ( = ?auto_23481 ?auto_23485 ) ) ( not ( = ?auto_23484 ?auto_23486 ) ) ( not ( = ?auto_23484 ?auto_23485 ) ) ( not ( = ?auto_23486 ?auto_23485 ) ) ( ON ?auto_23486 ?auto_23484 ) ( ON-TABLE ?auto_23482 ) ( not ( = ?auto_23482 ?auto_23483 ) ) ( not ( = ?auto_23482 ?auto_23485 ) ) ( not ( = ?auto_23483 ?auto_23485 ) ) ( not ( = ?auto_23481 ?auto_23483 ) ) ( not ( = ?auto_23481 ?auto_23482 ) ) ( not ( = ?auto_23484 ?auto_23483 ) ) ( not ( = ?auto_23484 ?auto_23482 ) ) ( not ( = ?auto_23486 ?auto_23483 ) ) ( not ( = ?auto_23486 ?auto_23482 ) ) ( ON ?auto_23485 ?auto_23486 ) ( CLEAR ?auto_23485 ) ( HOLDING ?auto_23483 ) ( CLEAR ?auto_23482 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23482 ?auto_23483 )
      ( MAKE-1PILE ?auto_23481 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23950 - BLOCK
    )
    :vars
    (
      ?auto_23952 - BLOCK
      ?auto_23951 - BLOCK
      ?auto_23953 - BLOCK
      ?auto_23954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23952 ?auto_23950 ) ( ON-TABLE ?auto_23950 ) ( not ( = ?auto_23950 ?auto_23952 ) ) ( not ( = ?auto_23950 ?auto_23951 ) ) ( not ( = ?auto_23950 ?auto_23953 ) ) ( not ( = ?auto_23952 ?auto_23951 ) ) ( not ( = ?auto_23952 ?auto_23953 ) ) ( not ( = ?auto_23951 ?auto_23953 ) ) ( ON ?auto_23951 ?auto_23952 ) ( not ( = ?auto_23954 ?auto_23953 ) ) ( not ( = ?auto_23950 ?auto_23954 ) ) ( not ( = ?auto_23952 ?auto_23954 ) ) ( not ( = ?auto_23951 ?auto_23954 ) ) ( ON ?auto_23953 ?auto_23951 ) ( ON ?auto_23954 ?auto_23953 ) ( CLEAR ?auto_23954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23950 ?auto_23952 ?auto_23951 ?auto_23953 )
      ( MAKE-1PILE ?auto_23950 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23493 - BLOCK
    )
    :vars
    (
      ?auto_23495 - BLOCK
      ?auto_23498 - BLOCK
      ?auto_23497 - BLOCK
      ?auto_23494 - BLOCK
      ?auto_23496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23495 ?auto_23493 ) ( ON-TABLE ?auto_23493 ) ( not ( = ?auto_23493 ?auto_23495 ) ) ( not ( = ?auto_23493 ?auto_23498 ) ) ( not ( = ?auto_23493 ?auto_23497 ) ) ( not ( = ?auto_23495 ?auto_23498 ) ) ( not ( = ?auto_23495 ?auto_23497 ) ) ( not ( = ?auto_23498 ?auto_23497 ) ) ( ON ?auto_23498 ?auto_23495 ) ( not ( = ?auto_23494 ?auto_23496 ) ) ( not ( = ?auto_23494 ?auto_23497 ) ) ( not ( = ?auto_23496 ?auto_23497 ) ) ( not ( = ?auto_23493 ?auto_23496 ) ) ( not ( = ?auto_23493 ?auto_23494 ) ) ( not ( = ?auto_23495 ?auto_23496 ) ) ( not ( = ?auto_23495 ?auto_23494 ) ) ( not ( = ?auto_23498 ?auto_23496 ) ) ( not ( = ?auto_23498 ?auto_23494 ) ) ( ON ?auto_23497 ?auto_23498 ) ( ON ?auto_23496 ?auto_23497 ) ( CLEAR ?auto_23496 ) ( HOLDING ?auto_23494 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23494 )
      ( MAKE-1PILE ?auto_23493 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23499 - BLOCK
    )
    :vars
    (
      ?auto_23501 - BLOCK
      ?auto_23503 - BLOCK
      ?auto_23504 - BLOCK
      ?auto_23502 - BLOCK
      ?auto_23500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23501 ?auto_23499 ) ( ON-TABLE ?auto_23499 ) ( not ( = ?auto_23499 ?auto_23501 ) ) ( not ( = ?auto_23499 ?auto_23503 ) ) ( not ( = ?auto_23499 ?auto_23504 ) ) ( not ( = ?auto_23501 ?auto_23503 ) ) ( not ( = ?auto_23501 ?auto_23504 ) ) ( not ( = ?auto_23503 ?auto_23504 ) ) ( ON ?auto_23503 ?auto_23501 ) ( not ( = ?auto_23502 ?auto_23500 ) ) ( not ( = ?auto_23502 ?auto_23504 ) ) ( not ( = ?auto_23500 ?auto_23504 ) ) ( not ( = ?auto_23499 ?auto_23500 ) ) ( not ( = ?auto_23499 ?auto_23502 ) ) ( not ( = ?auto_23501 ?auto_23500 ) ) ( not ( = ?auto_23501 ?auto_23502 ) ) ( not ( = ?auto_23503 ?auto_23500 ) ) ( not ( = ?auto_23503 ?auto_23502 ) ) ( ON ?auto_23504 ?auto_23503 ) ( ON ?auto_23500 ?auto_23504 ) ( ON ?auto_23502 ?auto_23500 ) ( CLEAR ?auto_23502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23499 ?auto_23501 ?auto_23503 ?auto_23504 ?auto_23500 )
      ( MAKE-1PILE ?auto_23499 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23510 - BLOCK
      ?auto_23511 - BLOCK
      ?auto_23512 - BLOCK
      ?auto_23513 - BLOCK
      ?auto_23514 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_23514 ) ( CLEAR ?auto_23513 ) ( ON-TABLE ?auto_23510 ) ( ON ?auto_23511 ?auto_23510 ) ( ON ?auto_23512 ?auto_23511 ) ( ON ?auto_23513 ?auto_23512 ) ( not ( = ?auto_23510 ?auto_23511 ) ) ( not ( = ?auto_23510 ?auto_23512 ) ) ( not ( = ?auto_23510 ?auto_23513 ) ) ( not ( = ?auto_23510 ?auto_23514 ) ) ( not ( = ?auto_23511 ?auto_23512 ) ) ( not ( = ?auto_23511 ?auto_23513 ) ) ( not ( = ?auto_23511 ?auto_23514 ) ) ( not ( = ?auto_23512 ?auto_23513 ) ) ( not ( = ?auto_23512 ?auto_23514 ) ) ( not ( = ?auto_23513 ?auto_23514 ) ) )
    :subtasks
    ( ( !STACK ?auto_23514 ?auto_23513 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23515 - BLOCK
      ?auto_23516 - BLOCK
      ?auto_23517 - BLOCK
      ?auto_23518 - BLOCK
      ?auto_23519 - BLOCK
    )
    :vars
    (
      ?auto_23520 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23518 ) ( ON-TABLE ?auto_23515 ) ( ON ?auto_23516 ?auto_23515 ) ( ON ?auto_23517 ?auto_23516 ) ( ON ?auto_23518 ?auto_23517 ) ( not ( = ?auto_23515 ?auto_23516 ) ) ( not ( = ?auto_23515 ?auto_23517 ) ) ( not ( = ?auto_23515 ?auto_23518 ) ) ( not ( = ?auto_23515 ?auto_23519 ) ) ( not ( = ?auto_23516 ?auto_23517 ) ) ( not ( = ?auto_23516 ?auto_23518 ) ) ( not ( = ?auto_23516 ?auto_23519 ) ) ( not ( = ?auto_23517 ?auto_23518 ) ) ( not ( = ?auto_23517 ?auto_23519 ) ) ( not ( = ?auto_23518 ?auto_23519 ) ) ( ON ?auto_23519 ?auto_23520 ) ( CLEAR ?auto_23519 ) ( HAND-EMPTY ) ( not ( = ?auto_23515 ?auto_23520 ) ) ( not ( = ?auto_23516 ?auto_23520 ) ) ( not ( = ?auto_23517 ?auto_23520 ) ) ( not ( = ?auto_23518 ?auto_23520 ) ) ( not ( = ?auto_23519 ?auto_23520 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23519 ?auto_23520 )
      ( MAKE-5PILE ?auto_23515 ?auto_23516 ?auto_23517 ?auto_23518 ?auto_23519 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23521 - BLOCK
      ?auto_23522 - BLOCK
      ?auto_23523 - BLOCK
      ?auto_23524 - BLOCK
      ?auto_23525 - BLOCK
    )
    :vars
    (
      ?auto_23526 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23521 ) ( ON ?auto_23522 ?auto_23521 ) ( ON ?auto_23523 ?auto_23522 ) ( not ( = ?auto_23521 ?auto_23522 ) ) ( not ( = ?auto_23521 ?auto_23523 ) ) ( not ( = ?auto_23521 ?auto_23524 ) ) ( not ( = ?auto_23521 ?auto_23525 ) ) ( not ( = ?auto_23522 ?auto_23523 ) ) ( not ( = ?auto_23522 ?auto_23524 ) ) ( not ( = ?auto_23522 ?auto_23525 ) ) ( not ( = ?auto_23523 ?auto_23524 ) ) ( not ( = ?auto_23523 ?auto_23525 ) ) ( not ( = ?auto_23524 ?auto_23525 ) ) ( ON ?auto_23525 ?auto_23526 ) ( CLEAR ?auto_23525 ) ( not ( = ?auto_23521 ?auto_23526 ) ) ( not ( = ?auto_23522 ?auto_23526 ) ) ( not ( = ?auto_23523 ?auto_23526 ) ) ( not ( = ?auto_23524 ?auto_23526 ) ) ( not ( = ?auto_23525 ?auto_23526 ) ) ( HOLDING ?auto_23524 ) ( CLEAR ?auto_23523 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23521 ?auto_23522 ?auto_23523 ?auto_23524 )
      ( MAKE-5PILE ?auto_23521 ?auto_23522 ?auto_23523 ?auto_23524 ?auto_23525 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23527 - BLOCK
      ?auto_23528 - BLOCK
      ?auto_23529 - BLOCK
      ?auto_23530 - BLOCK
      ?auto_23531 - BLOCK
    )
    :vars
    (
      ?auto_23532 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23527 ) ( ON ?auto_23528 ?auto_23527 ) ( ON ?auto_23529 ?auto_23528 ) ( not ( = ?auto_23527 ?auto_23528 ) ) ( not ( = ?auto_23527 ?auto_23529 ) ) ( not ( = ?auto_23527 ?auto_23530 ) ) ( not ( = ?auto_23527 ?auto_23531 ) ) ( not ( = ?auto_23528 ?auto_23529 ) ) ( not ( = ?auto_23528 ?auto_23530 ) ) ( not ( = ?auto_23528 ?auto_23531 ) ) ( not ( = ?auto_23529 ?auto_23530 ) ) ( not ( = ?auto_23529 ?auto_23531 ) ) ( not ( = ?auto_23530 ?auto_23531 ) ) ( ON ?auto_23531 ?auto_23532 ) ( not ( = ?auto_23527 ?auto_23532 ) ) ( not ( = ?auto_23528 ?auto_23532 ) ) ( not ( = ?auto_23529 ?auto_23532 ) ) ( not ( = ?auto_23530 ?auto_23532 ) ) ( not ( = ?auto_23531 ?auto_23532 ) ) ( CLEAR ?auto_23529 ) ( ON ?auto_23530 ?auto_23531 ) ( CLEAR ?auto_23530 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23532 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23532 ?auto_23531 )
      ( MAKE-5PILE ?auto_23527 ?auto_23528 ?auto_23529 ?auto_23530 ?auto_23531 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23533 - BLOCK
      ?auto_23534 - BLOCK
      ?auto_23535 - BLOCK
      ?auto_23536 - BLOCK
      ?auto_23537 - BLOCK
    )
    :vars
    (
      ?auto_23538 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23533 ) ( ON ?auto_23534 ?auto_23533 ) ( not ( = ?auto_23533 ?auto_23534 ) ) ( not ( = ?auto_23533 ?auto_23535 ) ) ( not ( = ?auto_23533 ?auto_23536 ) ) ( not ( = ?auto_23533 ?auto_23537 ) ) ( not ( = ?auto_23534 ?auto_23535 ) ) ( not ( = ?auto_23534 ?auto_23536 ) ) ( not ( = ?auto_23534 ?auto_23537 ) ) ( not ( = ?auto_23535 ?auto_23536 ) ) ( not ( = ?auto_23535 ?auto_23537 ) ) ( not ( = ?auto_23536 ?auto_23537 ) ) ( ON ?auto_23537 ?auto_23538 ) ( not ( = ?auto_23533 ?auto_23538 ) ) ( not ( = ?auto_23534 ?auto_23538 ) ) ( not ( = ?auto_23535 ?auto_23538 ) ) ( not ( = ?auto_23536 ?auto_23538 ) ) ( not ( = ?auto_23537 ?auto_23538 ) ) ( ON ?auto_23536 ?auto_23537 ) ( CLEAR ?auto_23536 ) ( ON-TABLE ?auto_23538 ) ( HOLDING ?auto_23535 ) ( CLEAR ?auto_23534 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23533 ?auto_23534 ?auto_23535 )
      ( MAKE-5PILE ?auto_23533 ?auto_23534 ?auto_23535 ?auto_23536 ?auto_23537 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23539 - BLOCK
      ?auto_23540 - BLOCK
      ?auto_23541 - BLOCK
      ?auto_23542 - BLOCK
      ?auto_23543 - BLOCK
    )
    :vars
    (
      ?auto_23544 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23539 ) ( ON ?auto_23540 ?auto_23539 ) ( not ( = ?auto_23539 ?auto_23540 ) ) ( not ( = ?auto_23539 ?auto_23541 ) ) ( not ( = ?auto_23539 ?auto_23542 ) ) ( not ( = ?auto_23539 ?auto_23543 ) ) ( not ( = ?auto_23540 ?auto_23541 ) ) ( not ( = ?auto_23540 ?auto_23542 ) ) ( not ( = ?auto_23540 ?auto_23543 ) ) ( not ( = ?auto_23541 ?auto_23542 ) ) ( not ( = ?auto_23541 ?auto_23543 ) ) ( not ( = ?auto_23542 ?auto_23543 ) ) ( ON ?auto_23543 ?auto_23544 ) ( not ( = ?auto_23539 ?auto_23544 ) ) ( not ( = ?auto_23540 ?auto_23544 ) ) ( not ( = ?auto_23541 ?auto_23544 ) ) ( not ( = ?auto_23542 ?auto_23544 ) ) ( not ( = ?auto_23543 ?auto_23544 ) ) ( ON ?auto_23542 ?auto_23543 ) ( ON-TABLE ?auto_23544 ) ( CLEAR ?auto_23540 ) ( ON ?auto_23541 ?auto_23542 ) ( CLEAR ?auto_23541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23544 ?auto_23543 ?auto_23542 )
      ( MAKE-5PILE ?auto_23539 ?auto_23540 ?auto_23541 ?auto_23542 ?auto_23543 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23545 - BLOCK
      ?auto_23546 - BLOCK
      ?auto_23547 - BLOCK
      ?auto_23548 - BLOCK
      ?auto_23549 - BLOCK
    )
    :vars
    (
      ?auto_23550 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23545 ) ( not ( = ?auto_23545 ?auto_23546 ) ) ( not ( = ?auto_23545 ?auto_23547 ) ) ( not ( = ?auto_23545 ?auto_23548 ) ) ( not ( = ?auto_23545 ?auto_23549 ) ) ( not ( = ?auto_23546 ?auto_23547 ) ) ( not ( = ?auto_23546 ?auto_23548 ) ) ( not ( = ?auto_23546 ?auto_23549 ) ) ( not ( = ?auto_23547 ?auto_23548 ) ) ( not ( = ?auto_23547 ?auto_23549 ) ) ( not ( = ?auto_23548 ?auto_23549 ) ) ( ON ?auto_23549 ?auto_23550 ) ( not ( = ?auto_23545 ?auto_23550 ) ) ( not ( = ?auto_23546 ?auto_23550 ) ) ( not ( = ?auto_23547 ?auto_23550 ) ) ( not ( = ?auto_23548 ?auto_23550 ) ) ( not ( = ?auto_23549 ?auto_23550 ) ) ( ON ?auto_23548 ?auto_23549 ) ( ON-TABLE ?auto_23550 ) ( ON ?auto_23547 ?auto_23548 ) ( CLEAR ?auto_23547 ) ( HOLDING ?auto_23546 ) ( CLEAR ?auto_23545 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23545 ?auto_23546 )
      ( MAKE-5PILE ?auto_23545 ?auto_23546 ?auto_23547 ?auto_23548 ?auto_23549 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23551 - BLOCK
      ?auto_23552 - BLOCK
      ?auto_23553 - BLOCK
      ?auto_23554 - BLOCK
      ?auto_23555 - BLOCK
    )
    :vars
    (
      ?auto_23556 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23551 ) ( not ( = ?auto_23551 ?auto_23552 ) ) ( not ( = ?auto_23551 ?auto_23553 ) ) ( not ( = ?auto_23551 ?auto_23554 ) ) ( not ( = ?auto_23551 ?auto_23555 ) ) ( not ( = ?auto_23552 ?auto_23553 ) ) ( not ( = ?auto_23552 ?auto_23554 ) ) ( not ( = ?auto_23552 ?auto_23555 ) ) ( not ( = ?auto_23553 ?auto_23554 ) ) ( not ( = ?auto_23553 ?auto_23555 ) ) ( not ( = ?auto_23554 ?auto_23555 ) ) ( ON ?auto_23555 ?auto_23556 ) ( not ( = ?auto_23551 ?auto_23556 ) ) ( not ( = ?auto_23552 ?auto_23556 ) ) ( not ( = ?auto_23553 ?auto_23556 ) ) ( not ( = ?auto_23554 ?auto_23556 ) ) ( not ( = ?auto_23555 ?auto_23556 ) ) ( ON ?auto_23554 ?auto_23555 ) ( ON-TABLE ?auto_23556 ) ( ON ?auto_23553 ?auto_23554 ) ( CLEAR ?auto_23551 ) ( ON ?auto_23552 ?auto_23553 ) ( CLEAR ?auto_23552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23556 ?auto_23555 ?auto_23554 ?auto_23553 )
      ( MAKE-5PILE ?auto_23551 ?auto_23552 ?auto_23553 ?auto_23554 ?auto_23555 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23557 - BLOCK
      ?auto_23558 - BLOCK
      ?auto_23559 - BLOCK
      ?auto_23560 - BLOCK
      ?auto_23561 - BLOCK
    )
    :vars
    (
      ?auto_23562 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23557 ?auto_23558 ) ) ( not ( = ?auto_23557 ?auto_23559 ) ) ( not ( = ?auto_23557 ?auto_23560 ) ) ( not ( = ?auto_23557 ?auto_23561 ) ) ( not ( = ?auto_23558 ?auto_23559 ) ) ( not ( = ?auto_23558 ?auto_23560 ) ) ( not ( = ?auto_23558 ?auto_23561 ) ) ( not ( = ?auto_23559 ?auto_23560 ) ) ( not ( = ?auto_23559 ?auto_23561 ) ) ( not ( = ?auto_23560 ?auto_23561 ) ) ( ON ?auto_23561 ?auto_23562 ) ( not ( = ?auto_23557 ?auto_23562 ) ) ( not ( = ?auto_23558 ?auto_23562 ) ) ( not ( = ?auto_23559 ?auto_23562 ) ) ( not ( = ?auto_23560 ?auto_23562 ) ) ( not ( = ?auto_23561 ?auto_23562 ) ) ( ON ?auto_23560 ?auto_23561 ) ( ON-TABLE ?auto_23562 ) ( ON ?auto_23559 ?auto_23560 ) ( ON ?auto_23558 ?auto_23559 ) ( CLEAR ?auto_23558 ) ( HOLDING ?auto_23557 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23557 )
      ( MAKE-5PILE ?auto_23557 ?auto_23558 ?auto_23559 ?auto_23560 ?auto_23561 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23563 - BLOCK
      ?auto_23564 - BLOCK
      ?auto_23565 - BLOCK
      ?auto_23566 - BLOCK
      ?auto_23567 - BLOCK
    )
    :vars
    (
      ?auto_23568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23563 ?auto_23564 ) ) ( not ( = ?auto_23563 ?auto_23565 ) ) ( not ( = ?auto_23563 ?auto_23566 ) ) ( not ( = ?auto_23563 ?auto_23567 ) ) ( not ( = ?auto_23564 ?auto_23565 ) ) ( not ( = ?auto_23564 ?auto_23566 ) ) ( not ( = ?auto_23564 ?auto_23567 ) ) ( not ( = ?auto_23565 ?auto_23566 ) ) ( not ( = ?auto_23565 ?auto_23567 ) ) ( not ( = ?auto_23566 ?auto_23567 ) ) ( ON ?auto_23567 ?auto_23568 ) ( not ( = ?auto_23563 ?auto_23568 ) ) ( not ( = ?auto_23564 ?auto_23568 ) ) ( not ( = ?auto_23565 ?auto_23568 ) ) ( not ( = ?auto_23566 ?auto_23568 ) ) ( not ( = ?auto_23567 ?auto_23568 ) ) ( ON ?auto_23566 ?auto_23567 ) ( ON-TABLE ?auto_23568 ) ( ON ?auto_23565 ?auto_23566 ) ( ON ?auto_23564 ?auto_23565 ) ( ON ?auto_23563 ?auto_23564 ) ( CLEAR ?auto_23563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23568 ?auto_23567 ?auto_23566 ?auto_23565 ?auto_23564 )
      ( MAKE-5PILE ?auto_23563 ?auto_23564 ?auto_23565 ?auto_23566 ?auto_23567 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23627 - BLOCK
    )
    :vars
    (
      ?auto_23628 - BLOCK
      ?auto_23629 - BLOCK
      ?auto_23630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23627 ?auto_23628 ) ( CLEAR ?auto_23627 ) ( not ( = ?auto_23627 ?auto_23628 ) ) ( HOLDING ?auto_23629 ) ( CLEAR ?auto_23630 ) ( not ( = ?auto_23627 ?auto_23629 ) ) ( not ( = ?auto_23627 ?auto_23630 ) ) ( not ( = ?auto_23628 ?auto_23629 ) ) ( not ( = ?auto_23628 ?auto_23630 ) ) ( not ( = ?auto_23629 ?auto_23630 ) ) )
    :subtasks
    ( ( !STACK ?auto_23629 ?auto_23630 )
      ( MAKE-1PILE ?auto_23627 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23631 - BLOCK
    )
    :vars
    (
      ?auto_23634 - BLOCK
      ?auto_23633 - BLOCK
      ?auto_23632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23631 ?auto_23634 ) ( not ( = ?auto_23631 ?auto_23634 ) ) ( CLEAR ?auto_23633 ) ( not ( = ?auto_23631 ?auto_23632 ) ) ( not ( = ?auto_23631 ?auto_23633 ) ) ( not ( = ?auto_23634 ?auto_23632 ) ) ( not ( = ?auto_23634 ?auto_23633 ) ) ( not ( = ?auto_23632 ?auto_23633 ) ) ( ON ?auto_23632 ?auto_23631 ) ( CLEAR ?auto_23632 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23634 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23634 ?auto_23631 )
      ( MAKE-1PILE ?auto_23631 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23635 - BLOCK
    )
    :vars
    (
      ?auto_23637 - BLOCK
      ?auto_23636 - BLOCK
      ?auto_23638 - BLOCK
      ?auto_23639 - BLOCK
      ?auto_23640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23635 ?auto_23637 ) ( not ( = ?auto_23635 ?auto_23637 ) ) ( not ( = ?auto_23635 ?auto_23636 ) ) ( not ( = ?auto_23635 ?auto_23638 ) ) ( not ( = ?auto_23637 ?auto_23636 ) ) ( not ( = ?auto_23637 ?auto_23638 ) ) ( not ( = ?auto_23636 ?auto_23638 ) ) ( ON ?auto_23636 ?auto_23635 ) ( CLEAR ?auto_23636 ) ( ON-TABLE ?auto_23637 ) ( HOLDING ?auto_23638 ) ( CLEAR ?auto_23639 ) ( ON-TABLE ?auto_23640 ) ( ON ?auto_23639 ?auto_23640 ) ( not ( = ?auto_23640 ?auto_23639 ) ) ( not ( = ?auto_23640 ?auto_23638 ) ) ( not ( = ?auto_23639 ?auto_23638 ) ) ( not ( = ?auto_23635 ?auto_23639 ) ) ( not ( = ?auto_23635 ?auto_23640 ) ) ( not ( = ?auto_23637 ?auto_23639 ) ) ( not ( = ?auto_23637 ?auto_23640 ) ) ( not ( = ?auto_23636 ?auto_23639 ) ) ( not ( = ?auto_23636 ?auto_23640 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23640 ?auto_23639 ?auto_23638 )
      ( MAKE-1PILE ?auto_23635 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23641 - BLOCK
    )
    :vars
    (
      ?auto_23646 - BLOCK
      ?auto_23644 - BLOCK
      ?auto_23645 - BLOCK
      ?auto_23642 - BLOCK
      ?auto_23643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23641 ?auto_23646 ) ( not ( = ?auto_23641 ?auto_23646 ) ) ( not ( = ?auto_23641 ?auto_23644 ) ) ( not ( = ?auto_23641 ?auto_23645 ) ) ( not ( = ?auto_23646 ?auto_23644 ) ) ( not ( = ?auto_23646 ?auto_23645 ) ) ( not ( = ?auto_23644 ?auto_23645 ) ) ( ON ?auto_23644 ?auto_23641 ) ( ON-TABLE ?auto_23646 ) ( CLEAR ?auto_23642 ) ( ON-TABLE ?auto_23643 ) ( ON ?auto_23642 ?auto_23643 ) ( not ( = ?auto_23643 ?auto_23642 ) ) ( not ( = ?auto_23643 ?auto_23645 ) ) ( not ( = ?auto_23642 ?auto_23645 ) ) ( not ( = ?auto_23641 ?auto_23642 ) ) ( not ( = ?auto_23641 ?auto_23643 ) ) ( not ( = ?auto_23646 ?auto_23642 ) ) ( not ( = ?auto_23646 ?auto_23643 ) ) ( not ( = ?auto_23644 ?auto_23642 ) ) ( not ( = ?auto_23644 ?auto_23643 ) ) ( ON ?auto_23645 ?auto_23644 ) ( CLEAR ?auto_23645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23646 ?auto_23641 ?auto_23644 )
      ( MAKE-1PILE ?auto_23641 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23647 - BLOCK
    )
    :vars
    (
      ?auto_23649 - BLOCK
      ?auto_23650 - BLOCK
      ?auto_23648 - BLOCK
      ?auto_23651 - BLOCK
      ?auto_23652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23647 ?auto_23649 ) ( not ( = ?auto_23647 ?auto_23649 ) ) ( not ( = ?auto_23647 ?auto_23650 ) ) ( not ( = ?auto_23647 ?auto_23648 ) ) ( not ( = ?auto_23649 ?auto_23650 ) ) ( not ( = ?auto_23649 ?auto_23648 ) ) ( not ( = ?auto_23650 ?auto_23648 ) ) ( ON ?auto_23650 ?auto_23647 ) ( ON-TABLE ?auto_23649 ) ( ON-TABLE ?auto_23651 ) ( not ( = ?auto_23651 ?auto_23652 ) ) ( not ( = ?auto_23651 ?auto_23648 ) ) ( not ( = ?auto_23652 ?auto_23648 ) ) ( not ( = ?auto_23647 ?auto_23652 ) ) ( not ( = ?auto_23647 ?auto_23651 ) ) ( not ( = ?auto_23649 ?auto_23652 ) ) ( not ( = ?auto_23649 ?auto_23651 ) ) ( not ( = ?auto_23650 ?auto_23652 ) ) ( not ( = ?auto_23650 ?auto_23651 ) ) ( ON ?auto_23648 ?auto_23650 ) ( CLEAR ?auto_23648 ) ( HOLDING ?auto_23652 ) ( CLEAR ?auto_23651 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23651 ?auto_23652 )
      ( MAKE-1PILE ?auto_23647 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23653 - BLOCK
    )
    :vars
    (
      ?auto_23654 - BLOCK
      ?auto_23657 - BLOCK
      ?auto_23655 - BLOCK
      ?auto_23656 - BLOCK
      ?auto_23658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23653 ?auto_23654 ) ( not ( = ?auto_23653 ?auto_23654 ) ) ( not ( = ?auto_23653 ?auto_23657 ) ) ( not ( = ?auto_23653 ?auto_23655 ) ) ( not ( = ?auto_23654 ?auto_23657 ) ) ( not ( = ?auto_23654 ?auto_23655 ) ) ( not ( = ?auto_23657 ?auto_23655 ) ) ( ON ?auto_23657 ?auto_23653 ) ( ON-TABLE ?auto_23654 ) ( ON-TABLE ?auto_23656 ) ( not ( = ?auto_23656 ?auto_23658 ) ) ( not ( = ?auto_23656 ?auto_23655 ) ) ( not ( = ?auto_23658 ?auto_23655 ) ) ( not ( = ?auto_23653 ?auto_23658 ) ) ( not ( = ?auto_23653 ?auto_23656 ) ) ( not ( = ?auto_23654 ?auto_23658 ) ) ( not ( = ?auto_23654 ?auto_23656 ) ) ( not ( = ?auto_23657 ?auto_23658 ) ) ( not ( = ?auto_23657 ?auto_23656 ) ) ( ON ?auto_23655 ?auto_23657 ) ( CLEAR ?auto_23656 ) ( ON ?auto_23658 ?auto_23655 ) ( CLEAR ?auto_23658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23654 ?auto_23653 ?auto_23657 ?auto_23655 )
      ( MAKE-1PILE ?auto_23653 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23659 - BLOCK
    )
    :vars
    (
      ?auto_23662 - BLOCK
      ?auto_23661 - BLOCK
      ?auto_23660 - BLOCK
      ?auto_23664 - BLOCK
      ?auto_23663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23659 ?auto_23662 ) ( not ( = ?auto_23659 ?auto_23662 ) ) ( not ( = ?auto_23659 ?auto_23661 ) ) ( not ( = ?auto_23659 ?auto_23660 ) ) ( not ( = ?auto_23662 ?auto_23661 ) ) ( not ( = ?auto_23662 ?auto_23660 ) ) ( not ( = ?auto_23661 ?auto_23660 ) ) ( ON ?auto_23661 ?auto_23659 ) ( ON-TABLE ?auto_23662 ) ( not ( = ?auto_23664 ?auto_23663 ) ) ( not ( = ?auto_23664 ?auto_23660 ) ) ( not ( = ?auto_23663 ?auto_23660 ) ) ( not ( = ?auto_23659 ?auto_23663 ) ) ( not ( = ?auto_23659 ?auto_23664 ) ) ( not ( = ?auto_23662 ?auto_23663 ) ) ( not ( = ?auto_23662 ?auto_23664 ) ) ( not ( = ?auto_23661 ?auto_23663 ) ) ( not ( = ?auto_23661 ?auto_23664 ) ) ( ON ?auto_23660 ?auto_23661 ) ( ON ?auto_23663 ?auto_23660 ) ( CLEAR ?auto_23663 ) ( HOLDING ?auto_23664 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23664 )
      ( MAKE-1PILE ?auto_23659 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23665 - BLOCK
    )
    :vars
    (
      ?auto_23670 - BLOCK
      ?auto_23666 - BLOCK
      ?auto_23668 - BLOCK
      ?auto_23669 - BLOCK
      ?auto_23667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23665 ?auto_23670 ) ( not ( = ?auto_23665 ?auto_23670 ) ) ( not ( = ?auto_23665 ?auto_23666 ) ) ( not ( = ?auto_23665 ?auto_23668 ) ) ( not ( = ?auto_23670 ?auto_23666 ) ) ( not ( = ?auto_23670 ?auto_23668 ) ) ( not ( = ?auto_23666 ?auto_23668 ) ) ( ON ?auto_23666 ?auto_23665 ) ( ON-TABLE ?auto_23670 ) ( not ( = ?auto_23669 ?auto_23667 ) ) ( not ( = ?auto_23669 ?auto_23668 ) ) ( not ( = ?auto_23667 ?auto_23668 ) ) ( not ( = ?auto_23665 ?auto_23667 ) ) ( not ( = ?auto_23665 ?auto_23669 ) ) ( not ( = ?auto_23670 ?auto_23667 ) ) ( not ( = ?auto_23670 ?auto_23669 ) ) ( not ( = ?auto_23666 ?auto_23667 ) ) ( not ( = ?auto_23666 ?auto_23669 ) ) ( ON ?auto_23668 ?auto_23666 ) ( ON ?auto_23667 ?auto_23668 ) ( ON ?auto_23669 ?auto_23667 ) ( CLEAR ?auto_23669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23670 ?auto_23665 ?auto_23666 ?auto_23668 ?auto_23667 )
      ( MAKE-1PILE ?auto_23665 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23678 - BLOCK
      ?auto_23679 - BLOCK
      ?auto_23680 - BLOCK
    )
    :vars
    (
      ?auto_23681 - BLOCK
      ?auto_23682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23681 ?auto_23680 ) ( CLEAR ?auto_23681 ) ( ON-TABLE ?auto_23678 ) ( ON ?auto_23679 ?auto_23678 ) ( ON ?auto_23680 ?auto_23679 ) ( not ( = ?auto_23678 ?auto_23679 ) ) ( not ( = ?auto_23678 ?auto_23680 ) ) ( not ( = ?auto_23678 ?auto_23681 ) ) ( not ( = ?auto_23679 ?auto_23680 ) ) ( not ( = ?auto_23679 ?auto_23681 ) ) ( not ( = ?auto_23680 ?auto_23681 ) ) ( HOLDING ?auto_23682 ) ( not ( = ?auto_23678 ?auto_23682 ) ) ( not ( = ?auto_23679 ?auto_23682 ) ) ( not ( = ?auto_23680 ?auto_23682 ) ) ( not ( = ?auto_23681 ?auto_23682 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_23682 )
      ( MAKE-3PILE ?auto_23678 ?auto_23679 ?auto_23680 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23731 - BLOCK
      ?auto_23732 - BLOCK
    )
    :vars
    (
      ?auto_23733 - BLOCK
      ?auto_23735 - BLOCK
      ?auto_23734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23731 ?auto_23732 ) ) ( ON ?auto_23732 ?auto_23733 ) ( not ( = ?auto_23731 ?auto_23733 ) ) ( not ( = ?auto_23732 ?auto_23733 ) ) ( ON ?auto_23731 ?auto_23732 ) ( CLEAR ?auto_23731 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23735 ) ( ON ?auto_23734 ?auto_23735 ) ( ON ?auto_23733 ?auto_23734 ) ( not ( = ?auto_23735 ?auto_23734 ) ) ( not ( = ?auto_23735 ?auto_23733 ) ) ( not ( = ?auto_23735 ?auto_23732 ) ) ( not ( = ?auto_23735 ?auto_23731 ) ) ( not ( = ?auto_23734 ?auto_23733 ) ) ( not ( = ?auto_23734 ?auto_23732 ) ) ( not ( = ?auto_23734 ?auto_23731 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23735 ?auto_23734 ?auto_23733 ?auto_23732 )
      ( MAKE-2PILE ?auto_23731 ?auto_23732 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23738 - BLOCK
      ?auto_23739 - BLOCK
    )
    :vars
    (
      ?auto_23740 - BLOCK
      ?auto_23741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23738 ?auto_23739 ) ) ( ON ?auto_23739 ?auto_23740 ) ( CLEAR ?auto_23739 ) ( not ( = ?auto_23738 ?auto_23740 ) ) ( not ( = ?auto_23739 ?auto_23740 ) ) ( ON ?auto_23738 ?auto_23741 ) ( CLEAR ?auto_23738 ) ( HAND-EMPTY ) ( not ( = ?auto_23738 ?auto_23741 ) ) ( not ( = ?auto_23739 ?auto_23741 ) ) ( not ( = ?auto_23740 ?auto_23741 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23738 ?auto_23741 )
      ( MAKE-2PILE ?auto_23738 ?auto_23739 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23742 - BLOCK
      ?auto_23743 - BLOCK
    )
    :vars
    (
      ?auto_23745 - BLOCK
      ?auto_23744 - BLOCK
      ?auto_23746 - BLOCK
      ?auto_23747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23742 ?auto_23743 ) ) ( not ( = ?auto_23742 ?auto_23745 ) ) ( not ( = ?auto_23743 ?auto_23745 ) ) ( ON ?auto_23742 ?auto_23744 ) ( CLEAR ?auto_23742 ) ( not ( = ?auto_23742 ?auto_23744 ) ) ( not ( = ?auto_23743 ?auto_23744 ) ) ( not ( = ?auto_23745 ?auto_23744 ) ) ( HOLDING ?auto_23743 ) ( CLEAR ?auto_23745 ) ( ON-TABLE ?auto_23746 ) ( ON ?auto_23747 ?auto_23746 ) ( ON ?auto_23745 ?auto_23747 ) ( not ( = ?auto_23746 ?auto_23747 ) ) ( not ( = ?auto_23746 ?auto_23745 ) ) ( not ( = ?auto_23746 ?auto_23743 ) ) ( not ( = ?auto_23747 ?auto_23745 ) ) ( not ( = ?auto_23747 ?auto_23743 ) ) ( not ( = ?auto_23742 ?auto_23746 ) ) ( not ( = ?auto_23742 ?auto_23747 ) ) ( not ( = ?auto_23744 ?auto_23746 ) ) ( not ( = ?auto_23744 ?auto_23747 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23746 ?auto_23747 ?auto_23745 ?auto_23743 )
      ( MAKE-2PILE ?auto_23742 ?auto_23743 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23748 - BLOCK
      ?auto_23749 - BLOCK
    )
    :vars
    (
      ?auto_23752 - BLOCK
      ?auto_23750 - BLOCK
      ?auto_23751 - BLOCK
      ?auto_23753 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23748 ?auto_23749 ) ) ( not ( = ?auto_23748 ?auto_23752 ) ) ( not ( = ?auto_23749 ?auto_23752 ) ) ( ON ?auto_23748 ?auto_23750 ) ( not ( = ?auto_23748 ?auto_23750 ) ) ( not ( = ?auto_23749 ?auto_23750 ) ) ( not ( = ?auto_23752 ?auto_23750 ) ) ( CLEAR ?auto_23752 ) ( ON-TABLE ?auto_23751 ) ( ON ?auto_23753 ?auto_23751 ) ( ON ?auto_23752 ?auto_23753 ) ( not ( = ?auto_23751 ?auto_23753 ) ) ( not ( = ?auto_23751 ?auto_23752 ) ) ( not ( = ?auto_23751 ?auto_23749 ) ) ( not ( = ?auto_23753 ?auto_23752 ) ) ( not ( = ?auto_23753 ?auto_23749 ) ) ( not ( = ?auto_23748 ?auto_23751 ) ) ( not ( = ?auto_23748 ?auto_23753 ) ) ( not ( = ?auto_23750 ?auto_23751 ) ) ( not ( = ?auto_23750 ?auto_23753 ) ) ( ON ?auto_23749 ?auto_23748 ) ( CLEAR ?auto_23749 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23750 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23750 ?auto_23748 )
      ( MAKE-2PILE ?auto_23748 ?auto_23749 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23754 - BLOCK
      ?auto_23755 - BLOCK
    )
    :vars
    (
      ?auto_23758 - BLOCK
      ?auto_23757 - BLOCK
      ?auto_23756 - BLOCK
      ?auto_23759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23754 ?auto_23755 ) ) ( not ( = ?auto_23754 ?auto_23758 ) ) ( not ( = ?auto_23755 ?auto_23758 ) ) ( ON ?auto_23754 ?auto_23757 ) ( not ( = ?auto_23754 ?auto_23757 ) ) ( not ( = ?auto_23755 ?auto_23757 ) ) ( not ( = ?auto_23758 ?auto_23757 ) ) ( ON-TABLE ?auto_23756 ) ( ON ?auto_23759 ?auto_23756 ) ( not ( = ?auto_23756 ?auto_23759 ) ) ( not ( = ?auto_23756 ?auto_23758 ) ) ( not ( = ?auto_23756 ?auto_23755 ) ) ( not ( = ?auto_23759 ?auto_23758 ) ) ( not ( = ?auto_23759 ?auto_23755 ) ) ( not ( = ?auto_23754 ?auto_23756 ) ) ( not ( = ?auto_23754 ?auto_23759 ) ) ( not ( = ?auto_23757 ?auto_23756 ) ) ( not ( = ?auto_23757 ?auto_23759 ) ) ( ON ?auto_23755 ?auto_23754 ) ( CLEAR ?auto_23755 ) ( ON-TABLE ?auto_23757 ) ( HOLDING ?auto_23758 ) ( CLEAR ?auto_23759 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23756 ?auto_23759 ?auto_23758 )
      ( MAKE-2PILE ?auto_23754 ?auto_23755 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23760 - BLOCK
      ?auto_23761 - BLOCK
    )
    :vars
    (
      ?auto_23763 - BLOCK
      ?auto_23762 - BLOCK
      ?auto_23765 - BLOCK
      ?auto_23764 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23760 ?auto_23761 ) ) ( not ( = ?auto_23760 ?auto_23763 ) ) ( not ( = ?auto_23761 ?auto_23763 ) ) ( ON ?auto_23760 ?auto_23762 ) ( not ( = ?auto_23760 ?auto_23762 ) ) ( not ( = ?auto_23761 ?auto_23762 ) ) ( not ( = ?auto_23763 ?auto_23762 ) ) ( ON-TABLE ?auto_23765 ) ( ON ?auto_23764 ?auto_23765 ) ( not ( = ?auto_23765 ?auto_23764 ) ) ( not ( = ?auto_23765 ?auto_23763 ) ) ( not ( = ?auto_23765 ?auto_23761 ) ) ( not ( = ?auto_23764 ?auto_23763 ) ) ( not ( = ?auto_23764 ?auto_23761 ) ) ( not ( = ?auto_23760 ?auto_23765 ) ) ( not ( = ?auto_23760 ?auto_23764 ) ) ( not ( = ?auto_23762 ?auto_23765 ) ) ( not ( = ?auto_23762 ?auto_23764 ) ) ( ON ?auto_23761 ?auto_23760 ) ( ON-TABLE ?auto_23762 ) ( CLEAR ?auto_23764 ) ( ON ?auto_23763 ?auto_23761 ) ( CLEAR ?auto_23763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23762 ?auto_23760 ?auto_23761 )
      ( MAKE-2PILE ?auto_23760 ?auto_23761 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23766 - BLOCK
      ?auto_23767 - BLOCK
    )
    :vars
    (
      ?auto_23771 - BLOCK
      ?auto_23768 - BLOCK
      ?auto_23769 - BLOCK
      ?auto_23770 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23766 ?auto_23767 ) ) ( not ( = ?auto_23766 ?auto_23771 ) ) ( not ( = ?auto_23767 ?auto_23771 ) ) ( ON ?auto_23766 ?auto_23768 ) ( not ( = ?auto_23766 ?auto_23768 ) ) ( not ( = ?auto_23767 ?auto_23768 ) ) ( not ( = ?auto_23771 ?auto_23768 ) ) ( ON-TABLE ?auto_23769 ) ( not ( = ?auto_23769 ?auto_23770 ) ) ( not ( = ?auto_23769 ?auto_23771 ) ) ( not ( = ?auto_23769 ?auto_23767 ) ) ( not ( = ?auto_23770 ?auto_23771 ) ) ( not ( = ?auto_23770 ?auto_23767 ) ) ( not ( = ?auto_23766 ?auto_23769 ) ) ( not ( = ?auto_23766 ?auto_23770 ) ) ( not ( = ?auto_23768 ?auto_23769 ) ) ( not ( = ?auto_23768 ?auto_23770 ) ) ( ON ?auto_23767 ?auto_23766 ) ( ON-TABLE ?auto_23768 ) ( ON ?auto_23771 ?auto_23767 ) ( CLEAR ?auto_23771 ) ( HOLDING ?auto_23770 ) ( CLEAR ?auto_23769 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23769 ?auto_23770 )
      ( MAKE-2PILE ?auto_23766 ?auto_23767 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23772 - BLOCK
      ?auto_23773 - BLOCK
    )
    :vars
    (
      ?auto_23777 - BLOCK
      ?auto_23775 - BLOCK
      ?auto_23774 - BLOCK
      ?auto_23776 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23772 ?auto_23773 ) ) ( not ( = ?auto_23772 ?auto_23777 ) ) ( not ( = ?auto_23773 ?auto_23777 ) ) ( ON ?auto_23772 ?auto_23775 ) ( not ( = ?auto_23772 ?auto_23775 ) ) ( not ( = ?auto_23773 ?auto_23775 ) ) ( not ( = ?auto_23777 ?auto_23775 ) ) ( ON-TABLE ?auto_23774 ) ( not ( = ?auto_23774 ?auto_23776 ) ) ( not ( = ?auto_23774 ?auto_23777 ) ) ( not ( = ?auto_23774 ?auto_23773 ) ) ( not ( = ?auto_23776 ?auto_23777 ) ) ( not ( = ?auto_23776 ?auto_23773 ) ) ( not ( = ?auto_23772 ?auto_23774 ) ) ( not ( = ?auto_23772 ?auto_23776 ) ) ( not ( = ?auto_23775 ?auto_23774 ) ) ( not ( = ?auto_23775 ?auto_23776 ) ) ( ON ?auto_23773 ?auto_23772 ) ( ON-TABLE ?auto_23775 ) ( ON ?auto_23777 ?auto_23773 ) ( CLEAR ?auto_23774 ) ( ON ?auto_23776 ?auto_23777 ) ( CLEAR ?auto_23776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23775 ?auto_23772 ?auto_23773 ?auto_23777 )
      ( MAKE-2PILE ?auto_23772 ?auto_23773 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23778 - BLOCK
      ?auto_23779 - BLOCK
    )
    :vars
    (
      ?auto_23781 - BLOCK
      ?auto_23780 - BLOCK
      ?auto_23782 - BLOCK
      ?auto_23783 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23778 ?auto_23779 ) ) ( not ( = ?auto_23778 ?auto_23781 ) ) ( not ( = ?auto_23779 ?auto_23781 ) ) ( ON ?auto_23778 ?auto_23780 ) ( not ( = ?auto_23778 ?auto_23780 ) ) ( not ( = ?auto_23779 ?auto_23780 ) ) ( not ( = ?auto_23781 ?auto_23780 ) ) ( not ( = ?auto_23782 ?auto_23783 ) ) ( not ( = ?auto_23782 ?auto_23781 ) ) ( not ( = ?auto_23782 ?auto_23779 ) ) ( not ( = ?auto_23783 ?auto_23781 ) ) ( not ( = ?auto_23783 ?auto_23779 ) ) ( not ( = ?auto_23778 ?auto_23782 ) ) ( not ( = ?auto_23778 ?auto_23783 ) ) ( not ( = ?auto_23780 ?auto_23782 ) ) ( not ( = ?auto_23780 ?auto_23783 ) ) ( ON ?auto_23779 ?auto_23778 ) ( ON-TABLE ?auto_23780 ) ( ON ?auto_23781 ?auto_23779 ) ( ON ?auto_23783 ?auto_23781 ) ( CLEAR ?auto_23783 ) ( HOLDING ?auto_23782 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23782 )
      ( MAKE-2PILE ?auto_23778 ?auto_23779 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23784 - BLOCK
      ?auto_23785 - BLOCK
    )
    :vars
    (
      ?auto_23788 - BLOCK
      ?auto_23786 - BLOCK
      ?auto_23789 - BLOCK
      ?auto_23787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23784 ?auto_23785 ) ) ( not ( = ?auto_23784 ?auto_23788 ) ) ( not ( = ?auto_23785 ?auto_23788 ) ) ( ON ?auto_23784 ?auto_23786 ) ( not ( = ?auto_23784 ?auto_23786 ) ) ( not ( = ?auto_23785 ?auto_23786 ) ) ( not ( = ?auto_23788 ?auto_23786 ) ) ( not ( = ?auto_23789 ?auto_23787 ) ) ( not ( = ?auto_23789 ?auto_23788 ) ) ( not ( = ?auto_23789 ?auto_23785 ) ) ( not ( = ?auto_23787 ?auto_23788 ) ) ( not ( = ?auto_23787 ?auto_23785 ) ) ( not ( = ?auto_23784 ?auto_23789 ) ) ( not ( = ?auto_23784 ?auto_23787 ) ) ( not ( = ?auto_23786 ?auto_23789 ) ) ( not ( = ?auto_23786 ?auto_23787 ) ) ( ON ?auto_23785 ?auto_23784 ) ( ON-TABLE ?auto_23786 ) ( ON ?auto_23788 ?auto_23785 ) ( ON ?auto_23787 ?auto_23788 ) ( ON ?auto_23789 ?auto_23787 ) ( CLEAR ?auto_23789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23786 ?auto_23784 ?auto_23785 ?auto_23788 ?auto_23787 )
      ( MAKE-2PILE ?auto_23784 ?auto_23785 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23805 - BLOCK
      ?auto_23806 - BLOCK
    )
    :vars
    (
      ?auto_23809 - BLOCK
      ?auto_23807 - BLOCK
      ?auto_23808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23809 ?auto_23806 ) ( ON-TABLE ?auto_23805 ) ( ON ?auto_23806 ?auto_23805 ) ( not ( = ?auto_23805 ?auto_23806 ) ) ( not ( = ?auto_23805 ?auto_23809 ) ) ( not ( = ?auto_23806 ?auto_23809 ) ) ( not ( = ?auto_23805 ?auto_23807 ) ) ( not ( = ?auto_23805 ?auto_23808 ) ) ( not ( = ?auto_23806 ?auto_23807 ) ) ( not ( = ?auto_23806 ?auto_23808 ) ) ( not ( = ?auto_23809 ?auto_23807 ) ) ( not ( = ?auto_23809 ?auto_23808 ) ) ( not ( = ?auto_23807 ?auto_23808 ) ) ( ON ?auto_23807 ?auto_23809 ) ( CLEAR ?auto_23807 ) ( HOLDING ?auto_23808 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23808 )
      ( MAKE-2PILE ?auto_23805 ?auto_23806 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23852 - BLOCK
      ?auto_23853 - BLOCK
      ?auto_23854 - BLOCK
    )
    :vars
    (
      ?auto_23855 - BLOCK
      ?auto_23856 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23852 ) ( not ( = ?auto_23852 ?auto_23853 ) ) ( not ( = ?auto_23852 ?auto_23854 ) ) ( not ( = ?auto_23853 ?auto_23854 ) ) ( ON ?auto_23854 ?auto_23855 ) ( not ( = ?auto_23852 ?auto_23855 ) ) ( not ( = ?auto_23853 ?auto_23855 ) ) ( not ( = ?auto_23854 ?auto_23855 ) ) ( CLEAR ?auto_23852 ) ( ON ?auto_23853 ?auto_23854 ) ( CLEAR ?auto_23853 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23856 ) ( ON ?auto_23855 ?auto_23856 ) ( not ( = ?auto_23856 ?auto_23855 ) ) ( not ( = ?auto_23856 ?auto_23854 ) ) ( not ( = ?auto_23856 ?auto_23853 ) ) ( not ( = ?auto_23852 ?auto_23856 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23856 ?auto_23855 ?auto_23854 )
      ( MAKE-3PILE ?auto_23852 ?auto_23853 ?auto_23854 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23857 - BLOCK
      ?auto_23858 - BLOCK
      ?auto_23859 - BLOCK
    )
    :vars
    (
      ?auto_23861 - BLOCK
      ?auto_23860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23857 ?auto_23858 ) ) ( not ( = ?auto_23857 ?auto_23859 ) ) ( not ( = ?auto_23858 ?auto_23859 ) ) ( ON ?auto_23859 ?auto_23861 ) ( not ( = ?auto_23857 ?auto_23861 ) ) ( not ( = ?auto_23858 ?auto_23861 ) ) ( not ( = ?auto_23859 ?auto_23861 ) ) ( ON ?auto_23858 ?auto_23859 ) ( CLEAR ?auto_23858 ) ( ON-TABLE ?auto_23860 ) ( ON ?auto_23861 ?auto_23860 ) ( not ( = ?auto_23860 ?auto_23861 ) ) ( not ( = ?auto_23860 ?auto_23859 ) ) ( not ( = ?auto_23860 ?auto_23858 ) ) ( not ( = ?auto_23857 ?auto_23860 ) ) ( HOLDING ?auto_23857 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23857 )
      ( MAKE-3PILE ?auto_23857 ?auto_23858 ?auto_23859 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23862 - BLOCK
      ?auto_23863 - BLOCK
      ?auto_23864 - BLOCK
    )
    :vars
    (
      ?auto_23866 - BLOCK
      ?auto_23865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23862 ?auto_23863 ) ) ( not ( = ?auto_23862 ?auto_23864 ) ) ( not ( = ?auto_23863 ?auto_23864 ) ) ( ON ?auto_23864 ?auto_23866 ) ( not ( = ?auto_23862 ?auto_23866 ) ) ( not ( = ?auto_23863 ?auto_23866 ) ) ( not ( = ?auto_23864 ?auto_23866 ) ) ( ON ?auto_23863 ?auto_23864 ) ( ON-TABLE ?auto_23865 ) ( ON ?auto_23866 ?auto_23865 ) ( not ( = ?auto_23865 ?auto_23866 ) ) ( not ( = ?auto_23865 ?auto_23864 ) ) ( not ( = ?auto_23865 ?auto_23863 ) ) ( not ( = ?auto_23862 ?auto_23865 ) ) ( ON ?auto_23862 ?auto_23863 ) ( CLEAR ?auto_23862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23865 ?auto_23866 ?auto_23864 ?auto_23863 )
      ( MAKE-3PILE ?auto_23862 ?auto_23863 ?auto_23864 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23870 - BLOCK
      ?auto_23871 - BLOCK
      ?auto_23872 - BLOCK
    )
    :vars
    (
      ?auto_23873 - BLOCK
      ?auto_23874 - BLOCK
      ?auto_23875 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23870 ?auto_23871 ) ) ( not ( = ?auto_23870 ?auto_23872 ) ) ( not ( = ?auto_23871 ?auto_23872 ) ) ( ON ?auto_23872 ?auto_23873 ) ( not ( = ?auto_23870 ?auto_23873 ) ) ( not ( = ?auto_23871 ?auto_23873 ) ) ( not ( = ?auto_23872 ?auto_23873 ) ) ( ON ?auto_23871 ?auto_23872 ) ( CLEAR ?auto_23871 ) ( ON-TABLE ?auto_23874 ) ( ON ?auto_23873 ?auto_23874 ) ( not ( = ?auto_23874 ?auto_23873 ) ) ( not ( = ?auto_23874 ?auto_23872 ) ) ( not ( = ?auto_23874 ?auto_23871 ) ) ( not ( = ?auto_23870 ?auto_23874 ) ) ( ON ?auto_23870 ?auto_23875 ) ( CLEAR ?auto_23870 ) ( HAND-EMPTY ) ( not ( = ?auto_23870 ?auto_23875 ) ) ( not ( = ?auto_23871 ?auto_23875 ) ) ( not ( = ?auto_23872 ?auto_23875 ) ) ( not ( = ?auto_23873 ?auto_23875 ) ) ( not ( = ?auto_23874 ?auto_23875 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23870 ?auto_23875 )
      ( MAKE-3PILE ?auto_23870 ?auto_23871 ?auto_23872 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23876 - BLOCK
      ?auto_23877 - BLOCK
      ?auto_23878 - BLOCK
    )
    :vars
    (
      ?auto_23879 - BLOCK
      ?auto_23881 - BLOCK
      ?auto_23880 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23876 ?auto_23877 ) ) ( not ( = ?auto_23876 ?auto_23878 ) ) ( not ( = ?auto_23877 ?auto_23878 ) ) ( ON ?auto_23878 ?auto_23879 ) ( not ( = ?auto_23876 ?auto_23879 ) ) ( not ( = ?auto_23877 ?auto_23879 ) ) ( not ( = ?auto_23878 ?auto_23879 ) ) ( ON-TABLE ?auto_23881 ) ( ON ?auto_23879 ?auto_23881 ) ( not ( = ?auto_23881 ?auto_23879 ) ) ( not ( = ?auto_23881 ?auto_23878 ) ) ( not ( = ?auto_23881 ?auto_23877 ) ) ( not ( = ?auto_23876 ?auto_23881 ) ) ( ON ?auto_23876 ?auto_23880 ) ( CLEAR ?auto_23876 ) ( not ( = ?auto_23876 ?auto_23880 ) ) ( not ( = ?auto_23877 ?auto_23880 ) ) ( not ( = ?auto_23878 ?auto_23880 ) ) ( not ( = ?auto_23879 ?auto_23880 ) ) ( not ( = ?auto_23881 ?auto_23880 ) ) ( HOLDING ?auto_23877 ) ( CLEAR ?auto_23878 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23881 ?auto_23879 ?auto_23878 ?auto_23877 )
      ( MAKE-3PILE ?auto_23876 ?auto_23877 ?auto_23878 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23882 - BLOCK
      ?auto_23883 - BLOCK
      ?auto_23884 - BLOCK
    )
    :vars
    (
      ?auto_23887 - BLOCK
      ?auto_23886 - BLOCK
      ?auto_23885 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23882 ?auto_23883 ) ) ( not ( = ?auto_23882 ?auto_23884 ) ) ( not ( = ?auto_23883 ?auto_23884 ) ) ( ON ?auto_23884 ?auto_23887 ) ( not ( = ?auto_23882 ?auto_23887 ) ) ( not ( = ?auto_23883 ?auto_23887 ) ) ( not ( = ?auto_23884 ?auto_23887 ) ) ( ON-TABLE ?auto_23886 ) ( ON ?auto_23887 ?auto_23886 ) ( not ( = ?auto_23886 ?auto_23887 ) ) ( not ( = ?auto_23886 ?auto_23884 ) ) ( not ( = ?auto_23886 ?auto_23883 ) ) ( not ( = ?auto_23882 ?auto_23886 ) ) ( ON ?auto_23882 ?auto_23885 ) ( not ( = ?auto_23882 ?auto_23885 ) ) ( not ( = ?auto_23883 ?auto_23885 ) ) ( not ( = ?auto_23884 ?auto_23885 ) ) ( not ( = ?auto_23887 ?auto_23885 ) ) ( not ( = ?auto_23886 ?auto_23885 ) ) ( CLEAR ?auto_23884 ) ( ON ?auto_23883 ?auto_23882 ) ( CLEAR ?auto_23883 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23885 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23885 ?auto_23882 )
      ( MAKE-3PILE ?auto_23882 ?auto_23883 ?auto_23884 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23888 - BLOCK
      ?auto_23889 - BLOCK
      ?auto_23890 - BLOCK
    )
    :vars
    (
      ?auto_23891 - BLOCK
      ?auto_23892 - BLOCK
      ?auto_23893 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23888 ?auto_23889 ) ) ( not ( = ?auto_23888 ?auto_23890 ) ) ( not ( = ?auto_23889 ?auto_23890 ) ) ( not ( = ?auto_23888 ?auto_23891 ) ) ( not ( = ?auto_23889 ?auto_23891 ) ) ( not ( = ?auto_23890 ?auto_23891 ) ) ( ON-TABLE ?auto_23892 ) ( ON ?auto_23891 ?auto_23892 ) ( not ( = ?auto_23892 ?auto_23891 ) ) ( not ( = ?auto_23892 ?auto_23890 ) ) ( not ( = ?auto_23892 ?auto_23889 ) ) ( not ( = ?auto_23888 ?auto_23892 ) ) ( ON ?auto_23888 ?auto_23893 ) ( not ( = ?auto_23888 ?auto_23893 ) ) ( not ( = ?auto_23889 ?auto_23893 ) ) ( not ( = ?auto_23890 ?auto_23893 ) ) ( not ( = ?auto_23891 ?auto_23893 ) ) ( not ( = ?auto_23892 ?auto_23893 ) ) ( ON ?auto_23889 ?auto_23888 ) ( CLEAR ?auto_23889 ) ( ON-TABLE ?auto_23893 ) ( HOLDING ?auto_23890 ) ( CLEAR ?auto_23891 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23892 ?auto_23891 ?auto_23890 )
      ( MAKE-3PILE ?auto_23888 ?auto_23889 ?auto_23890 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23894 - BLOCK
      ?auto_23895 - BLOCK
      ?auto_23896 - BLOCK
    )
    :vars
    (
      ?auto_23897 - BLOCK
      ?auto_23899 - BLOCK
      ?auto_23898 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23894 ?auto_23895 ) ) ( not ( = ?auto_23894 ?auto_23896 ) ) ( not ( = ?auto_23895 ?auto_23896 ) ) ( not ( = ?auto_23894 ?auto_23897 ) ) ( not ( = ?auto_23895 ?auto_23897 ) ) ( not ( = ?auto_23896 ?auto_23897 ) ) ( ON-TABLE ?auto_23899 ) ( ON ?auto_23897 ?auto_23899 ) ( not ( = ?auto_23899 ?auto_23897 ) ) ( not ( = ?auto_23899 ?auto_23896 ) ) ( not ( = ?auto_23899 ?auto_23895 ) ) ( not ( = ?auto_23894 ?auto_23899 ) ) ( ON ?auto_23894 ?auto_23898 ) ( not ( = ?auto_23894 ?auto_23898 ) ) ( not ( = ?auto_23895 ?auto_23898 ) ) ( not ( = ?auto_23896 ?auto_23898 ) ) ( not ( = ?auto_23897 ?auto_23898 ) ) ( not ( = ?auto_23899 ?auto_23898 ) ) ( ON ?auto_23895 ?auto_23894 ) ( ON-TABLE ?auto_23898 ) ( CLEAR ?auto_23897 ) ( ON ?auto_23896 ?auto_23895 ) ( CLEAR ?auto_23896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23898 ?auto_23894 ?auto_23895 )
      ( MAKE-3PILE ?auto_23894 ?auto_23895 ?auto_23896 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23900 - BLOCK
      ?auto_23901 - BLOCK
      ?auto_23902 - BLOCK
    )
    :vars
    (
      ?auto_23904 - BLOCK
      ?auto_23903 - BLOCK
      ?auto_23905 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23900 ?auto_23901 ) ) ( not ( = ?auto_23900 ?auto_23902 ) ) ( not ( = ?auto_23901 ?auto_23902 ) ) ( not ( = ?auto_23900 ?auto_23904 ) ) ( not ( = ?auto_23901 ?auto_23904 ) ) ( not ( = ?auto_23902 ?auto_23904 ) ) ( ON-TABLE ?auto_23903 ) ( not ( = ?auto_23903 ?auto_23904 ) ) ( not ( = ?auto_23903 ?auto_23902 ) ) ( not ( = ?auto_23903 ?auto_23901 ) ) ( not ( = ?auto_23900 ?auto_23903 ) ) ( ON ?auto_23900 ?auto_23905 ) ( not ( = ?auto_23900 ?auto_23905 ) ) ( not ( = ?auto_23901 ?auto_23905 ) ) ( not ( = ?auto_23902 ?auto_23905 ) ) ( not ( = ?auto_23904 ?auto_23905 ) ) ( not ( = ?auto_23903 ?auto_23905 ) ) ( ON ?auto_23901 ?auto_23900 ) ( ON-TABLE ?auto_23905 ) ( ON ?auto_23902 ?auto_23901 ) ( CLEAR ?auto_23902 ) ( HOLDING ?auto_23904 ) ( CLEAR ?auto_23903 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23903 ?auto_23904 )
      ( MAKE-3PILE ?auto_23900 ?auto_23901 ?auto_23902 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23906 - BLOCK
      ?auto_23907 - BLOCK
      ?auto_23908 - BLOCK
    )
    :vars
    (
      ?auto_23910 - BLOCK
      ?auto_23909 - BLOCK
      ?auto_23911 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23906 ?auto_23907 ) ) ( not ( = ?auto_23906 ?auto_23908 ) ) ( not ( = ?auto_23907 ?auto_23908 ) ) ( not ( = ?auto_23906 ?auto_23910 ) ) ( not ( = ?auto_23907 ?auto_23910 ) ) ( not ( = ?auto_23908 ?auto_23910 ) ) ( ON-TABLE ?auto_23909 ) ( not ( = ?auto_23909 ?auto_23910 ) ) ( not ( = ?auto_23909 ?auto_23908 ) ) ( not ( = ?auto_23909 ?auto_23907 ) ) ( not ( = ?auto_23906 ?auto_23909 ) ) ( ON ?auto_23906 ?auto_23911 ) ( not ( = ?auto_23906 ?auto_23911 ) ) ( not ( = ?auto_23907 ?auto_23911 ) ) ( not ( = ?auto_23908 ?auto_23911 ) ) ( not ( = ?auto_23910 ?auto_23911 ) ) ( not ( = ?auto_23909 ?auto_23911 ) ) ( ON ?auto_23907 ?auto_23906 ) ( ON-TABLE ?auto_23911 ) ( ON ?auto_23908 ?auto_23907 ) ( CLEAR ?auto_23909 ) ( ON ?auto_23910 ?auto_23908 ) ( CLEAR ?auto_23910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23911 ?auto_23906 ?auto_23907 ?auto_23908 )
      ( MAKE-3PILE ?auto_23906 ?auto_23907 ?auto_23908 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23912 - BLOCK
      ?auto_23913 - BLOCK
      ?auto_23914 - BLOCK
    )
    :vars
    (
      ?auto_23917 - BLOCK
      ?auto_23916 - BLOCK
      ?auto_23915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23912 ?auto_23913 ) ) ( not ( = ?auto_23912 ?auto_23914 ) ) ( not ( = ?auto_23913 ?auto_23914 ) ) ( not ( = ?auto_23912 ?auto_23917 ) ) ( not ( = ?auto_23913 ?auto_23917 ) ) ( not ( = ?auto_23914 ?auto_23917 ) ) ( not ( = ?auto_23916 ?auto_23917 ) ) ( not ( = ?auto_23916 ?auto_23914 ) ) ( not ( = ?auto_23916 ?auto_23913 ) ) ( not ( = ?auto_23912 ?auto_23916 ) ) ( ON ?auto_23912 ?auto_23915 ) ( not ( = ?auto_23912 ?auto_23915 ) ) ( not ( = ?auto_23913 ?auto_23915 ) ) ( not ( = ?auto_23914 ?auto_23915 ) ) ( not ( = ?auto_23917 ?auto_23915 ) ) ( not ( = ?auto_23916 ?auto_23915 ) ) ( ON ?auto_23913 ?auto_23912 ) ( ON-TABLE ?auto_23915 ) ( ON ?auto_23914 ?auto_23913 ) ( ON ?auto_23917 ?auto_23914 ) ( CLEAR ?auto_23917 ) ( HOLDING ?auto_23916 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23916 )
      ( MAKE-3PILE ?auto_23912 ?auto_23913 ?auto_23914 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23918 - BLOCK
      ?auto_23919 - BLOCK
      ?auto_23920 - BLOCK
    )
    :vars
    (
      ?auto_23921 - BLOCK
      ?auto_23922 - BLOCK
      ?auto_23923 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23918 ?auto_23919 ) ) ( not ( = ?auto_23918 ?auto_23920 ) ) ( not ( = ?auto_23919 ?auto_23920 ) ) ( not ( = ?auto_23918 ?auto_23921 ) ) ( not ( = ?auto_23919 ?auto_23921 ) ) ( not ( = ?auto_23920 ?auto_23921 ) ) ( not ( = ?auto_23922 ?auto_23921 ) ) ( not ( = ?auto_23922 ?auto_23920 ) ) ( not ( = ?auto_23922 ?auto_23919 ) ) ( not ( = ?auto_23918 ?auto_23922 ) ) ( ON ?auto_23918 ?auto_23923 ) ( not ( = ?auto_23918 ?auto_23923 ) ) ( not ( = ?auto_23919 ?auto_23923 ) ) ( not ( = ?auto_23920 ?auto_23923 ) ) ( not ( = ?auto_23921 ?auto_23923 ) ) ( not ( = ?auto_23922 ?auto_23923 ) ) ( ON ?auto_23919 ?auto_23918 ) ( ON-TABLE ?auto_23923 ) ( ON ?auto_23920 ?auto_23919 ) ( ON ?auto_23921 ?auto_23920 ) ( ON ?auto_23922 ?auto_23921 ) ( CLEAR ?auto_23922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23923 ?auto_23918 ?auto_23919 ?auto_23920 ?auto_23921 )
      ( MAKE-3PILE ?auto_23918 ?auto_23919 ?auto_23920 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23935 - BLOCK
    )
    :vars
    (
      ?auto_23938 - BLOCK
      ?auto_23936 - BLOCK
      ?auto_23937 - BLOCK
      ?auto_23939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23938 ?auto_23935 ) ( ON-TABLE ?auto_23935 ) ( not ( = ?auto_23935 ?auto_23938 ) ) ( not ( = ?auto_23935 ?auto_23936 ) ) ( not ( = ?auto_23935 ?auto_23937 ) ) ( not ( = ?auto_23938 ?auto_23936 ) ) ( not ( = ?auto_23938 ?auto_23937 ) ) ( not ( = ?auto_23936 ?auto_23937 ) ) ( ON ?auto_23936 ?auto_23938 ) ( CLEAR ?auto_23936 ) ( HOLDING ?auto_23937 ) ( CLEAR ?auto_23939 ) ( ON-TABLE ?auto_23939 ) ( not ( = ?auto_23939 ?auto_23937 ) ) ( not ( = ?auto_23935 ?auto_23939 ) ) ( not ( = ?auto_23938 ?auto_23939 ) ) ( not ( = ?auto_23936 ?auto_23939 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23939 ?auto_23937 )
      ( MAKE-1PILE ?auto_23935 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23940 - BLOCK
    )
    :vars
    (
      ?auto_23943 - BLOCK
      ?auto_23944 - BLOCK
      ?auto_23942 - BLOCK
      ?auto_23941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23943 ?auto_23940 ) ( ON-TABLE ?auto_23940 ) ( not ( = ?auto_23940 ?auto_23943 ) ) ( not ( = ?auto_23940 ?auto_23944 ) ) ( not ( = ?auto_23940 ?auto_23942 ) ) ( not ( = ?auto_23943 ?auto_23944 ) ) ( not ( = ?auto_23943 ?auto_23942 ) ) ( not ( = ?auto_23944 ?auto_23942 ) ) ( ON ?auto_23944 ?auto_23943 ) ( CLEAR ?auto_23941 ) ( ON-TABLE ?auto_23941 ) ( not ( = ?auto_23941 ?auto_23942 ) ) ( not ( = ?auto_23940 ?auto_23941 ) ) ( not ( = ?auto_23943 ?auto_23941 ) ) ( not ( = ?auto_23944 ?auto_23941 ) ) ( ON ?auto_23942 ?auto_23944 ) ( CLEAR ?auto_23942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23940 ?auto_23943 ?auto_23944 )
      ( MAKE-1PILE ?auto_23940 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23945 - BLOCK
    )
    :vars
    (
      ?auto_23948 - BLOCK
      ?auto_23946 - BLOCK
      ?auto_23947 - BLOCK
      ?auto_23949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23948 ?auto_23945 ) ( ON-TABLE ?auto_23945 ) ( not ( = ?auto_23945 ?auto_23948 ) ) ( not ( = ?auto_23945 ?auto_23946 ) ) ( not ( = ?auto_23945 ?auto_23947 ) ) ( not ( = ?auto_23948 ?auto_23946 ) ) ( not ( = ?auto_23948 ?auto_23947 ) ) ( not ( = ?auto_23946 ?auto_23947 ) ) ( ON ?auto_23946 ?auto_23948 ) ( not ( = ?auto_23949 ?auto_23947 ) ) ( not ( = ?auto_23945 ?auto_23949 ) ) ( not ( = ?auto_23948 ?auto_23949 ) ) ( not ( = ?auto_23946 ?auto_23949 ) ) ( ON ?auto_23947 ?auto_23946 ) ( CLEAR ?auto_23947 ) ( HOLDING ?auto_23949 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23949 )
      ( MAKE-1PILE ?auto_23945 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23956 - BLOCK
    )
    :vars
    (
      ?auto_23957 - BLOCK
      ?auto_23958 - BLOCK
      ?auto_23960 - BLOCK
      ?auto_23959 - BLOCK
      ?auto_23961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23957 ?auto_23956 ) ( ON-TABLE ?auto_23956 ) ( not ( = ?auto_23956 ?auto_23957 ) ) ( not ( = ?auto_23956 ?auto_23958 ) ) ( not ( = ?auto_23956 ?auto_23960 ) ) ( not ( = ?auto_23957 ?auto_23958 ) ) ( not ( = ?auto_23957 ?auto_23960 ) ) ( not ( = ?auto_23958 ?auto_23960 ) ) ( ON ?auto_23958 ?auto_23957 ) ( not ( = ?auto_23959 ?auto_23960 ) ) ( not ( = ?auto_23956 ?auto_23959 ) ) ( not ( = ?auto_23957 ?auto_23959 ) ) ( not ( = ?auto_23958 ?auto_23959 ) ) ( ON ?auto_23960 ?auto_23958 ) ( CLEAR ?auto_23960 ) ( ON ?auto_23959 ?auto_23961 ) ( CLEAR ?auto_23959 ) ( HAND-EMPTY ) ( not ( = ?auto_23956 ?auto_23961 ) ) ( not ( = ?auto_23957 ?auto_23961 ) ) ( not ( = ?auto_23958 ?auto_23961 ) ) ( not ( = ?auto_23960 ?auto_23961 ) ) ( not ( = ?auto_23959 ?auto_23961 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23959 ?auto_23961 )
      ( MAKE-1PILE ?auto_23956 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23962 - BLOCK
    )
    :vars
    (
      ?auto_23963 - BLOCK
      ?auto_23965 - BLOCK
      ?auto_23964 - BLOCK
      ?auto_23966 - BLOCK
      ?auto_23967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23963 ?auto_23962 ) ( ON-TABLE ?auto_23962 ) ( not ( = ?auto_23962 ?auto_23963 ) ) ( not ( = ?auto_23962 ?auto_23965 ) ) ( not ( = ?auto_23962 ?auto_23964 ) ) ( not ( = ?auto_23963 ?auto_23965 ) ) ( not ( = ?auto_23963 ?auto_23964 ) ) ( not ( = ?auto_23965 ?auto_23964 ) ) ( ON ?auto_23965 ?auto_23963 ) ( not ( = ?auto_23966 ?auto_23964 ) ) ( not ( = ?auto_23962 ?auto_23966 ) ) ( not ( = ?auto_23963 ?auto_23966 ) ) ( not ( = ?auto_23965 ?auto_23966 ) ) ( ON ?auto_23966 ?auto_23967 ) ( CLEAR ?auto_23966 ) ( not ( = ?auto_23962 ?auto_23967 ) ) ( not ( = ?auto_23963 ?auto_23967 ) ) ( not ( = ?auto_23965 ?auto_23967 ) ) ( not ( = ?auto_23964 ?auto_23967 ) ) ( not ( = ?auto_23966 ?auto_23967 ) ) ( HOLDING ?auto_23964 ) ( CLEAR ?auto_23965 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23962 ?auto_23963 ?auto_23965 ?auto_23964 )
      ( MAKE-1PILE ?auto_23962 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23996 - BLOCK
      ?auto_23997 - BLOCK
      ?auto_23998 - BLOCK
      ?auto_23999 - BLOCK
    )
    :vars
    (
      ?auto_24000 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23996 ) ( ON ?auto_23997 ?auto_23996 ) ( not ( = ?auto_23996 ?auto_23997 ) ) ( not ( = ?auto_23996 ?auto_23998 ) ) ( not ( = ?auto_23996 ?auto_23999 ) ) ( not ( = ?auto_23997 ?auto_23998 ) ) ( not ( = ?auto_23997 ?auto_23999 ) ) ( not ( = ?auto_23998 ?auto_23999 ) ) ( ON ?auto_23999 ?auto_24000 ) ( not ( = ?auto_23996 ?auto_24000 ) ) ( not ( = ?auto_23997 ?auto_24000 ) ) ( not ( = ?auto_23998 ?auto_24000 ) ) ( not ( = ?auto_23999 ?auto_24000 ) ) ( CLEAR ?auto_23997 ) ( ON ?auto_23998 ?auto_23999 ) ( CLEAR ?auto_23998 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24000 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24000 ?auto_23999 )
      ( MAKE-4PILE ?auto_23996 ?auto_23997 ?auto_23998 ?auto_23999 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24001 - BLOCK
      ?auto_24002 - BLOCK
      ?auto_24003 - BLOCK
      ?auto_24004 - BLOCK
    )
    :vars
    (
      ?auto_24005 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24001 ) ( not ( = ?auto_24001 ?auto_24002 ) ) ( not ( = ?auto_24001 ?auto_24003 ) ) ( not ( = ?auto_24001 ?auto_24004 ) ) ( not ( = ?auto_24002 ?auto_24003 ) ) ( not ( = ?auto_24002 ?auto_24004 ) ) ( not ( = ?auto_24003 ?auto_24004 ) ) ( ON ?auto_24004 ?auto_24005 ) ( not ( = ?auto_24001 ?auto_24005 ) ) ( not ( = ?auto_24002 ?auto_24005 ) ) ( not ( = ?auto_24003 ?auto_24005 ) ) ( not ( = ?auto_24004 ?auto_24005 ) ) ( ON ?auto_24003 ?auto_24004 ) ( CLEAR ?auto_24003 ) ( ON-TABLE ?auto_24005 ) ( HOLDING ?auto_24002 ) ( CLEAR ?auto_24001 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24001 ?auto_24002 )
      ( MAKE-4PILE ?auto_24001 ?auto_24002 ?auto_24003 ?auto_24004 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24006 - BLOCK
      ?auto_24007 - BLOCK
      ?auto_24008 - BLOCK
      ?auto_24009 - BLOCK
    )
    :vars
    (
      ?auto_24010 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24006 ) ( not ( = ?auto_24006 ?auto_24007 ) ) ( not ( = ?auto_24006 ?auto_24008 ) ) ( not ( = ?auto_24006 ?auto_24009 ) ) ( not ( = ?auto_24007 ?auto_24008 ) ) ( not ( = ?auto_24007 ?auto_24009 ) ) ( not ( = ?auto_24008 ?auto_24009 ) ) ( ON ?auto_24009 ?auto_24010 ) ( not ( = ?auto_24006 ?auto_24010 ) ) ( not ( = ?auto_24007 ?auto_24010 ) ) ( not ( = ?auto_24008 ?auto_24010 ) ) ( not ( = ?auto_24009 ?auto_24010 ) ) ( ON ?auto_24008 ?auto_24009 ) ( ON-TABLE ?auto_24010 ) ( CLEAR ?auto_24006 ) ( ON ?auto_24007 ?auto_24008 ) ( CLEAR ?auto_24007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24010 ?auto_24009 ?auto_24008 )
      ( MAKE-4PILE ?auto_24006 ?auto_24007 ?auto_24008 ?auto_24009 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24011 - BLOCK
      ?auto_24012 - BLOCK
      ?auto_24013 - BLOCK
      ?auto_24014 - BLOCK
    )
    :vars
    (
      ?auto_24015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24011 ?auto_24012 ) ) ( not ( = ?auto_24011 ?auto_24013 ) ) ( not ( = ?auto_24011 ?auto_24014 ) ) ( not ( = ?auto_24012 ?auto_24013 ) ) ( not ( = ?auto_24012 ?auto_24014 ) ) ( not ( = ?auto_24013 ?auto_24014 ) ) ( ON ?auto_24014 ?auto_24015 ) ( not ( = ?auto_24011 ?auto_24015 ) ) ( not ( = ?auto_24012 ?auto_24015 ) ) ( not ( = ?auto_24013 ?auto_24015 ) ) ( not ( = ?auto_24014 ?auto_24015 ) ) ( ON ?auto_24013 ?auto_24014 ) ( ON-TABLE ?auto_24015 ) ( ON ?auto_24012 ?auto_24013 ) ( CLEAR ?auto_24012 ) ( HOLDING ?auto_24011 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24011 )
      ( MAKE-4PILE ?auto_24011 ?auto_24012 ?auto_24013 ?auto_24014 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24016 - BLOCK
      ?auto_24017 - BLOCK
      ?auto_24018 - BLOCK
      ?auto_24019 - BLOCK
    )
    :vars
    (
      ?auto_24020 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24016 ?auto_24017 ) ) ( not ( = ?auto_24016 ?auto_24018 ) ) ( not ( = ?auto_24016 ?auto_24019 ) ) ( not ( = ?auto_24017 ?auto_24018 ) ) ( not ( = ?auto_24017 ?auto_24019 ) ) ( not ( = ?auto_24018 ?auto_24019 ) ) ( ON ?auto_24019 ?auto_24020 ) ( not ( = ?auto_24016 ?auto_24020 ) ) ( not ( = ?auto_24017 ?auto_24020 ) ) ( not ( = ?auto_24018 ?auto_24020 ) ) ( not ( = ?auto_24019 ?auto_24020 ) ) ( ON ?auto_24018 ?auto_24019 ) ( ON-TABLE ?auto_24020 ) ( ON ?auto_24017 ?auto_24018 ) ( ON ?auto_24016 ?auto_24017 ) ( CLEAR ?auto_24016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24020 ?auto_24019 ?auto_24018 ?auto_24017 )
      ( MAKE-4PILE ?auto_24016 ?auto_24017 ?auto_24018 ?auto_24019 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24025 - BLOCK
      ?auto_24026 - BLOCK
      ?auto_24027 - BLOCK
      ?auto_24028 - BLOCK
    )
    :vars
    (
      ?auto_24029 - BLOCK
      ?auto_24030 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24025 ?auto_24026 ) ) ( not ( = ?auto_24025 ?auto_24027 ) ) ( not ( = ?auto_24025 ?auto_24028 ) ) ( not ( = ?auto_24026 ?auto_24027 ) ) ( not ( = ?auto_24026 ?auto_24028 ) ) ( not ( = ?auto_24027 ?auto_24028 ) ) ( ON ?auto_24028 ?auto_24029 ) ( not ( = ?auto_24025 ?auto_24029 ) ) ( not ( = ?auto_24026 ?auto_24029 ) ) ( not ( = ?auto_24027 ?auto_24029 ) ) ( not ( = ?auto_24028 ?auto_24029 ) ) ( ON ?auto_24027 ?auto_24028 ) ( ON-TABLE ?auto_24029 ) ( ON ?auto_24026 ?auto_24027 ) ( CLEAR ?auto_24026 ) ( ON ?auto_24025 ?auto_24030 ) ( CLEAR ?auto_24025 ) ( HAND-EMPTY ) ( not ( = ?auto_24025 ?auto_24030 ) ) ( not ( = ?auto_24026 ?auto_24030 ) ) ( not ( = ?auto_24027 ?auto_24030 ) ) ( not ( = ?auto_24028 ?auto_24030 ) ) ( not ( = ?auto_24029 ?auto_24030 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24025 ?auto_24030 )
      ( MAKE-4PILE ?auto_24025 ?auto_24026 ?auto_24027 ?auto_24028 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24031 - BLOCK
      ?auto_24032 - BLOCK
      ?auto_24033 - BLOCK
      ?auto_24034 - BLOCK
    )
    :vars
    (
      ?auto_24035 - BLOCK
      ?auto_24036 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24031 ?auto_24032 ) ) ( not ( = ?auto_24031 ?auto_24033 ) ) ( not ( = ?auto_24031 ?auto_24034 ) ) ( not ( = ?auto_24032 ?auto_24033 ) ) ( not ( = ?auto_24032 ?auto_24034 ) ) ( not ( = ?auto_24033 ?auto_24034 ) ) ( ON ?auto_24034 ?auto_24035 ) ( not ( = ?auto_24031 ?auto_24035 ) ) ( not ( = ?auto_24032 ?auto_24035 ) ) ( not ( = ?auto_24033 ?auto_24035 ) ) ( not ( = ?auto_24034 ?auto_24035 ) ) ( ON ?auto_24033 ?auto_24034 ) ( ON-TABLE ?auto_24035 ) ( ON ?auto_24031 ?auto_24036 ) ( CLEAR ?auto_24031 ) ( not ( = ?auto_24031 ?auto_24036 ) ) ( not ( = ?auto_24032 ?auto_24036 ) ) ( not ( = ?auto_24033 ?auto_24036 ) ) ( not ( = ?auto_24034 ?auto_24036 ) ) ( not ( = ?auto_24035 ?auto_24036 ) ) ( HOLDING ?auto_24032 ) ( CLEAR ?auto_24033 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24035 ?auto_24034 ?auto_24033 ?auto_24032 )
      ( MAKE-4PILE ?auto_24031 ?auto_24032 ?auto_24033 ?auto_24034 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24037 - BLOCK
      ?auto_24038 - BLOCK
      ?auto_24039 - BLOCK
      ?auto_24040 - BLOCK
    )
    :vars
    (
      ?auto_24042 - BLOCK
      ?auto_24041 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24037 ?auto_24038 ) ) ( not ( = ?auto_24037 ?auto_24039 ) ) ( not ( = ?auto_24037 ?auto_24040 ) ) ( not ( = ?auto_24038 ?auto_24039 ) ) ( not ( = ?auto_24038 ?auto_24040 ) ) ( not ( = ?auto_24039 ?auto_24040 ) ) ( ON ?auto_24040 ?auto_24042 ) ( not ( = ?auto_24037 ?auto_24042 ) ) ( not ( = ?auto_24038 ?auto_24042 ) ) ( not ( = ?auto_24039 ?auto_24042 ) ) ( not ( = ?auto_24040 ?auto_24042 ) ) ( ON ?auto_24039 ?auto_24040 ) ( ON-TABLE ?auto_24042 ) ( ON ?auto_24037 ?auto_24041 ) ( not ( = ?auto_24037 ?auto_24041 ) ) ( not ( = ?auto_24038 ?auto_24041 ) ) ( not ( = ?auto_24039 ?auto_24041 ) ) ( not ( = ?auto_24040 ?auto_24041 ) ) ( not ( = ?auto_24042 ?auto_24041 ) ) ( CLEAR ?auto_24039 ) ( ON ?auto_24038 ?auto_24037 ) ( CLEAR ?auto_24038 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24041 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24041 ?auto_24037 )
      ( MAKE-4PILE ?auto_24037 ?auto_24038 ?auto_24039 ?auto_24040 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24043 - BLOCK
      ?auto_24044 - BLOCK
      ?auto_24045 - BLOCK
      ?auto_24046 - BLOCK
    )
    :vars
    (
      ?auto_24048 - BLOCK
      ?auto_24047 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24043 ?auto_24044 ) ) ( not ( = ?auto_24043 ?auto_24045 ) ) ( not ( = ?auto_24043 ?auto_24046 ) ) ( not ( = ?auto_24044 ?auto_24045 ) ) ( not ( = ?auto_24044 ?auto_24046 ) ) ( not ( = ?auto_24045 ?auto_24046 ) ) ( ON ?auto_24046 ?auto_24048 ) ( not ( = ?auto_24043 ?auto_24048 ) ) ( not ( = ?auto_24044 ?auto_24048 ) ) ( not ( = ?auto_24045 ?auto_24048 ) ) ( not ( = ?auto_24046 ?auto_24048 ) ) ( ON-TABLE ?auto_24048 ) ( ON ?auto_24043 ?auto_24047 ) ( not ( = ?auto_24043 ?auto_24047 ) ) ( not ( = ?auto_24044 ?auto_24047 ) ) ( not ( = ?auto_24045 ?auto_24047 ) ) ( not ( = ?auto_24046 ?auto_24047 ) ) ( not ( = ?auto_24048 ?auto_24047 ) ) ( ON ?auto_24044 ?auto_24043 ) ( CLEAR ?auto_24044 ) ( ON-TABLE ?auto_24047 ) ( HOLDING ?auto_24045 ) ( CLEAR ?auto_24046 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24048 ?auto_24046 ?auto_24045 )
      ( MAKE-4PILE ?auto_24043 ?auto_24044 ?auto_24045 ?auto_24046 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24049 - BLOCK
      ?auto_24050 - BLOCK
      ?auto_24051 - BLOCK
      ?auto_24052 - BLOCK
    )
    :vars
    (
      ?auto_24053 - BLOCK
      ?auto_24054 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24049 ?auto_24050 ) ) ( not ( = ?auto_24049 ?auto_24051 ) ) ( not ( = ?auto_24049 ?auto_24052 ) ) ( not ( = ?auto_24050 ?auto_24051 ) ) ( not ( = ?auto_24050 ?auto_24052 ) ) ( not ( = ?auto_24051 ?auto_24052 ) ) ( ON ?auto_24052 ?auto_24053 ) ( not ( = ?auto_24049 ?auto_24053 ) ) ( not ( = ?auto_24050 ?auto_24053 ) ) ( not ( = ?auto_24051 ?auto_24053 ) ) ( not ( = ?auto_24052 ?auto_24053 ) ) ( ON-TABLE ?auto_24053 ) ( ON ?auto_24049 ?auto_24054 ) ( not ( = ?auto_24049 ?auto_24054 ) ) ( not ( = ?auto_24050 ?auto_24054 ) ) ( not ( = ?auto_24051 ?auto_24054 ) ) ( not ( = ?auto_24052 ?auto_24054 ) ) ( not ( = ?auto_24053 ?auto_24054 ) ) ( ON ?auto_24050 ?auto_24049 ) ( ON-TABLE ?auto_24054 ) ( CLEAR ?auto_24052 ) ( ON ?auto_24051 ?auto_24050 ) ( CLEAR ?auto_24051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24054 ?auto_24049 ?auto_24050 )
      ( MAKE-4PILE ?auto_24049 ?auto_24050 ?auto_24051 ?auto_24052 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24055 - BLOCK
      ?auto_24056 - BLOCK
      ?auto_24057 - BLOCK
      ?auto_24058 - BLOCK
    )
    :vars
    (
      ?auto_24059 - BLOCK
      ?auto_24060 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24055 ?auto_24056 ) ) ( not ( = ?auto_24055 ?auto_24057 ) ) ( not ( = ?auto_24055 ?auto_24058 ) ) ( not ( = ?auto_24056 ?auto_24057 ) ) ( not ( = ?auto_24056 ?auto_24058 ) ) ( not ( = ?auto_24057 ?auto_24058 ) ) ( not ( = ?auto_24055 ?auto_24059 ) ) ( not ( = ?auto_24056 ?auto_24059 ) ) ( not ( = ?auto_24057 ?auto_24059 ) ) ( not ( = ?auto_24058 ?auto_24059 ) ) ( ON-TABLE ?auto_24059 ) ( ON ?auto_24055 ?auto_24060 ) ( not ( = ?auto_24055 ?auto_24060 ) ) ( not ( = ?auto_24056 ?auto_24060 ) ) ( not ( = ?auto_24057 ?auto_24060 ) ) ( not ( = ?auto_24058 ?auto_24060 ) ) ( not ( = ?auto_24059 ?auto_24060 ) ) ( ON ?auto_24056 ?auto_24055 ) ( ON-TABLE ?auto_24060 ) ( ON ?auto_24057 ?auto_24056 ) ( CLEAR ?auto_24057 ) ( HOLDING ?auto_24058 ) ( CLEAR ?auto_24059 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24059 ?auto_24058 )
      ( MAKE-4PILE ?auto_24055 ?auto_24056 ?auto_24057 ?auto_24058 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24061 - BLOCK
      ?auto_24062 - BLOCK
      ?auto_24063 - BLOCK
      ?auto_24064 - BLOCK
    )
    :vars
    (
      ?auto_24065 - BLOCK
      ?auto_24066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24061 ?auto_24062 ) ) ( not ( = ?auto_24061 ?auto_24063 ) ) ( not ( = ?auto_24061 ?auto_24064 ) ) ( not ( = ?auto_24062 ?auto_24063 ) ) ( not ( = ?auto_24062 ?auto_24064 ) ) ( not ( = ?auto_24063 ?auto_24064 ) ) ( not ( = ?auto_24061 ?auto_24065 ) ) ( not ( = ?auto_24062 ?auto_24065 ) ) ( not ( = ?auto_24063 ?auto_24065 ) ) ( not ( = ?auto_24064 ?auto_24065 ) ) ( ON-TABLE ?auto_24065 ) ( ON ?auto_24061 ?auto_24066 ) ( not ( = ?auto_24061 ?auto_24066 ) ) ( not ( = ?auto_24062 ?auto_24066 ) ) ( not ( = ?auto_24063 ?auto_24066 ) ) ( not ( = ?auto_24064 ?auto_24066 ) ) ( not ( = ?auto_24065 ?auto_24066 ) ) ( ON ?auto_24062 ?auto_24061 ) ( ON-TABLE ?auto_24066 ) ( ON ?auto_24063 ?auto_24062 ) ( CLEAR ?auto_24065 ) ( ON ?auto_24064 ?auto_24063 ) ( CLEAR ?auto_24064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24066 ?auto_24061 ?auto_24062 ?auto_24063 )
      ( MAKE-4PILE ?auto_24061 ?auto_24062 ?auto_24063 ?auto_24064 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24067 - BLOCK
      ?auto_24068 - BLOCK
      ?auto_24069 - BLOCK
      ?auto_24070 - BLOCK
    )
    :vars
    (
      ?auto_24071 - BLOCK
      ?auto_24072 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24067 ?auto_24068 ) ) ( not ( = ?auto_24067 ?auto_24069 ) ) ( not ( = ?auto_24067 ?auto_24070 ) ) ( not ( = ?auto_24068 ?auto_24069 ) ) ( not ( = ?auto_24068 ?auto_24070 ) ) ( not ( = ?auto_24069 ?auto_24070 ) ) ( not ( = ?auto_24067 ?auto_24071 ) ) ( not ( = ?auto_24068 ?auto_24071 ) ) ( not ( = ?auto_24069 ?auto_24071 ) ) ( not ( = ?auto_24070 ?auto_24071 ) ) ( ON ?auto_24067 ?auto_24072 ) ( not ( = ?auto_24067 ?auto_24072 ) ) ( not ( = ?auto_24068 ?auto_24072 ) ) ( not ( = ?auto_24069 ?auto_24072 ) ) ( not ( = ?auto_24070 ?auto_24072 ) ) ( not ( = ?auto_24071 ?auto_24072 ) ) ( ON ?auto_24068 ?auto_24067 ) ( ON-TABLE ?auto_24072 ) ( ON ?auto_24069 ?auto_24068 ) ( ON ?auto_24070 ?auto_24069 ) ( CLEAR ?auto_24070 ) ( HOLDING ?auto_24071 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24071 )
      ( MAKE-4PILE ?auto_24067 ?auto_24068 ?auto_24069 ?auto_24070 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24073 - BLOCK
      ?auto_24074 - BLOCK
      ?auto_24075 - BLOCK
      ?auto_24076 - BLOCK
    )
    :vars
    (
      ?auto_24077 - BLOCK
      ?auto_24078 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24073 ?auto_24074 ) ) ( not ( = ?auto_24073 ?auto_24075 ) ) ( not ( = ?auto_24073 ?auto_24076 ) ) ( not ( = ?auto_24074 ?auto_24075 ) ) ( not ( = ?auto_24074 ?auto_24076 ) ) ( not ( = ?auto_24075 ?auto_24076 ) ) ( not ( = ?auto_24073 ?auto_24077 ) ) ( not ( = ?auto_24074 ?auto_24077 ) ) ( not ( = ?auto_24075 ?auto_24077 ) ) ( not ( = ?auto_24076 ?auto_24077 ) ) ( ON ?auto_24073 ?auto_24078 ) ( not ( = ?auto_24073 ?auto_24078 ) ) ( not ( = ?auto_24074 ?auto_24078 ) ) ( not ( = ?auto_24075 ?auto_24078 ) ) ( not ( = ?auto_24076 ?auto_24078 ) ) ( not ( = ?auto_24077 ?auto_24078 ) ) ( ON ?auto_24074 ?auto_24073 ) ( ON-TABLE ?auto_24078 ) ( ON ?auto_24075 ?auto_24074 ) ( ON ?auto_24076 ?auto_24075 ) ( ON ?auto_24077 ?auto_24076 ) ( CLEAR ?auto_24077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24078 ?auto_24073 ?auto_24074 ?auto_24075 ?auto_24076 )
      ( MAKE-4PILE ?auto_24073 ?auto_24074 ?auto_24075 ?auto_24076 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24089 - BLOCK
      ?auto_24090 - BLOCK
      ?auto_24091 - BLOCK
      ?auto_24092 - BLOCK
      ?auto_24093 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_24092 ) ( ON-TABLE ?auto_24089 ) ( ON ?auto_24090 ?auto_24089 ) ( ON ?auto_24091 ?auto_24090 ) ( ON ?auto_24092 ?auto_24091 ) ( not ( = ?auto_24089 ?auto_24090 ) ) ( not ( = ?auto_24089 ?auto_24091 ) ) ( not ( = ?auto_24089 ?auto_24092 ) ) ( not ( = ?auto_24089 ?auto_24093 ) ) ( not ( = ?auto_24090 ?auto_24091 ) ) ( not ( = ?auto_24090 ?auto_24092 ) ) ( not ( = ?auto_24090 ?auto_24093 ) ) ( not ( = ?auto_24091 ?auto_24092 ) ) ( not ( = ?auto_24091 ?auto_24093 ) ) ( not ( = ?auto_24092 ?auto_24093 ) ) ( ON-TABLE ?auto_24093 ) ( CLEAR ?auto_24093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_24093 )
      ( MAKE-5PILE ?auto_24089 ?auto_24090 ?auto_24091 ?auto_24092 ?auto_24093 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24094 - BLOCK
      ?auto_24095 - BLOCK
      ?auto_24096 - BLOCK
      ?auto_24097 - BLOCK
      ?auto_24098 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24094 ) ( ON ?auto_24095 ?auto_24094 ) ( ON ?auto_24096 ?auto_24095 ) ( not ( = ?auto_24094 ?auto_24095 ) ) ( not ( = ?auto_24094 ?auto_24096 ) ) ( not ( = ?auto_24094 ?auto_24097 ) ) ( not ( = ?auto_24094 ?auto_24098 ) ) ( not ( = ?auto_24095 ?auto_24096 ) ) ( not ( = ?auto_24095 ?auto_24097 ) ) ( not ( = ?auto_24095 ?auto_24098 ) ) ( not ( = ?auto_24096 ?auto_24097 ) ) ( not ( = ?auto_24096 ?auto_24098 ) ) ( not ( = ?auto_24097 ?auto_24098 ) ) ( ON-TABLE ?auto_24098 ) ( CLEAR ?auto_24098 ) ( HOLDING ?auto_24097 ) ( CLEAR ?auto_24096 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24094 ?auto_24095 ?auto_24096 ?auto_24097 )
      ( MAKE-5PILE ?auto_24094 ?auto_24095 ?auto_24096 ?auto_24097 ?auto_24098 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24099 - BLOCK
      ?auto_24100 - BLOCK
      ?auto_24101 - BLOCK
      ?auto_24102 - BLOCK
      ?auto_24103 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24099 ) ( ON ?auto_24100 ?auto_24099 ) ( ON ?auto_24101 ?auto_24100 ) ( not ( = ?auto_24099 ?auto_24100 ) ) ( not ( = ?auto_24099 ?auto_24101 ) ) ( not ( = ?auto_24099 ?auto_24102 ) ) ( not ( = ?auto_24099 ?auto_24103 ) ) ( not ( = ?auto_24100 ?auto_24101 ) ) ( not ( = ?auto_24100 ?auto_24102 ) ) ( not ( = ?auto_24100 ?auto_24103 ) ) ( not ( = ?auto_24101 ?auto_24102 ) ) ( not ( = ?auto_24101 ?auto_24103 ) ) ( not ( = ?auto_24102 ?auto_24103 ) ) ( ON-TABLE ?auto_24103 ) ( CLEAR ?auto_24101 ) ( ON ?auto_24102 ?auto_24103 ) ( CLEAR ?auto_24102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24103 )
      ( MAKE-5PILE ?auto_24099 ?auto_24100 ?auto_24101 ?auto_24102 ?auto_24103 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24104 - BLOCK
      ?auto_24105 - BLOCK
      ?auto_24106 - BLOCK
      ?auto_24107 - BLOCK
      ?auto_24108 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24104 ) ( ON ?auto_24105 ?auto_24104 ) ( not ( = ?auto_24104 ?auto_24105 ) ) ( not ( = ?auto_24104 ?auto_24106 ) ) ( not ( = ?auto_24104 ?auto_24107 ) ) ( not ( = ?auto_24104 ?auto_24108 ) ) ( not ( = ?auto_24105 ?auto_24106 ) ) ( not ( = ?auto_24105 ?auto_24107 ) ) ( not ( = ?auto_24105 ?auto_24108 ) ) ( not ( = ?auto_24106 ?auto_24107 ) ) ( not ( = ?auto_24106 ?auto_24108 ) ) ( not ( = ?auto_24107 ?auto_24108 ) ) ( ON-TABLE ?auto_24108 ) ( ON ?auto_24107 ?auto_24108 ) ( CLEAR ?auto_24107 ) ( HOLDING ?auto_24106 ) ( CLEAR ?auto_24105 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24104 ?auto_24105 ?auto_24106 )
      ( MAKE-5PILE ?auto_24104 ?auto_24105 ?auto_24106 ?auto_24107 ?auto_24108 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24109 - BLOCK
      ?auto_24110 - BLOCK
      ?auto_24111 - BLOCK
      ?auto_24112 - BLOCK
      ?auto_24113 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24109 ) ( ON ?auto_24110 ?auto_24109 ) ( not ( = ?auto_24109 ?auto_24110 ) ) ( not ( = ?auto_24109 ?auto_24111 ) ) ( not ( = ?auto_24109 ?auto_24112 ) ) ( not ( = ?auto_24109 ?auto_24113 ) ) ( not ( = ?auto_24110 ?auto_24111 ) ) ( not ( = ?auto_24110 ?auto_24112 ) ) ( not ( = ?auto_24110 ?auto_24113 ) ) ( not ( = ?auto_24111 ?auto_24112 ) ) ( not ( = ?auto_24111 ?auto_24113 ) ) ( not ( = ?auto_24112 ?auto_24113 ) ) ( ON-TABLE ?auto_24113 ) ( ON ?auto_24112 ?auto_24113 ) ( CLEAR ?auto_24110 ) ( ON ?auto_24111 ?auto_24112 ) ( CLEAR ?auto_24111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24113 ?auto_24112 )
      ( MAKE-5PILE ?auto_24109 ?auto_24110 ?auto_24111 ?auto_24112 ?auto_24113 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24114 - BLOCK
      ?auto_24115 - BLOCK
      ?auto_24116 - BLOCK
      ?auto_24117 - BLOCK
      ?auto_24118 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24114 ) ( not ( = ?auto_24114 ?auto_24115 ) ) ( not ( = ?auto_24114 ?auto_24116 ) ) ( not ( = ?auto_24114 ?auto_24117 ) ) ( not ( = ?auto_24114 ?auto_24118 ) ) ( not ( = ?auto_24115 ?auto_24116 ) ) ( not ( = ?auto_24115 ?auto_24117 ) ) ( not ( = ?auto_24115 ?auto_24118 ) ) ( not ( = ?auto_24116 ?auto_24117 ) ) ( not ( = ?auto_24116 ?auto_24118 ) ) ( not ( = ?auto_24117 ?auto_24118 ) ) ( ON-TABLE ?auto_24118 ) ( ON ?auto_24117 ?auto_24118 ) ( ON ?auto_24116 ?auto_24117 ) ( CLEAR ?auto_24116 ) ( HOLDING ?auto_24115 ) ( CLEAR ?auto_24114 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24114 ?auto_24115 )
      ( MAKE-5PILE ?auto_24114 ?auto_24115 ?auto_24116 ?auto_24117 ?auto_24118 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24119 - BLOCK
      ?auto_24120 - BLOCK
      ?auto_24121 - BLOCK
      ?auto_24122 - BLOCK
      ?auto_24123 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24119 ) ( not ( = ?auto_24119 ?auto_24120 ) ) ( not ( = ?auto_24119 ?auto_24121 ) ) ( not ( = ?auto_24119 ?auto_24122 ) ) ( not ( = ?auto_24119 ?auto_24123 ) ) ( not ( = ?auto_24120 ?auto_24121 ) ) ( not ( = ?auto_24120 ?auto_24122 ) ) ( not ( = ?auto_24120 ?auto_24123 ) ) ( not ( = ?auto_24121 ?auto_24122 ) ) ( not ( = ?auto_24121 ?auto_24123 ) ) ( not ( = ?auto_24122 ?auto_24123 ) ) ( ON-TABLE ?auto_24123 ) ( ON ?auto_24122 ?auto_24123 ) ( ON ?auto_24121 ?auto_24122 ) ( CLEAR ?auto_24119 ) ( ON ?auto_24120 ?auto_24121 ) ( CLEAR ?auto_24120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24123 ?auto_24122 ?auto_24121 )
      ( MAKE-5PILE ?auto_24119 ?auto_24120 ?auto_24121 ?auto_24122 ?auto_24123 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24124 - BLOCK
      ?auto_24125 - BLOCK
      ?auto_24126 - BLOCK
      ?auto_24127 - BLOCK
      ?auto_24128 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24124 ?auto_24125 ) ) ( not ( = ?auto_24124 ?auto_24126 ) ) ( not ( = ?auto_24124 ?auto_24127 ) ) ( not ( = ?auto_24124 ?auto_24128 ) ) ( not ( = ?auto_24125 ?auto_24126 ) ) ( not ( = ?auto_24125 ?auto_24127 ) ) ( not ( = ?auto_24125 ?auto_24128 ) ) ( not ( = ?auto_24126 ?auto_24127 ) ) ( not ( = ?auto_24126 ?auto_24128 ) ) ( not ( = ?auto_24127 ?auto_24128 ) ) ( ON-TABLE ?auto_24128 ) ( ON ?auto_24127 ?auto_24128 ) ( ON ?auto_24126 ?auto_24127 ) ( ON ?auto_24125 ?auto_24126 ) ( CLEAR ?auto_24125 ) ( HOLDING ?auto_24124 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24124 )
      ( MAKE-5PILE ?auto_24124 ?auto_24125 ?auto_24126 ?auto_24127 ?auto_24128 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24129 - BLOCK
      ?auto_24130 - BLOCK
      ?auto_24131 - BLOCK
      ?auto_24132 - BLOCK
      ?auto_24133 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24129 ?auto_24130 ) ) ( not ( = ?auto_24129 ?auto_24131 ) ) ( not ( = ?auto_24129 ?auto_24132 ) ) ( not ( = ?auto_24129 ?auto_24133 ) ) ( not ( = ?auto_24130 ?auto_24131 ) ) ( not ( = ?auto_24130 ?auto_24132 ) ) ( not ( = ?auto_24130 ?auto_24133 ) ) ( not ( = ?auto_24131 ?auto_24132 ) ) ( not ( = ?auto_24131 ?auto_24133 ) ) ( not ( = ?auto_24132 ?auto_24133 ) ) ( ON-TABLE ?auto_24133 ) ( ON ?auto_24132 ?auto_24133 ) ( ON ?auto_24131 ?auto_24132 ) ( ON ?auto_24130 ?auto_24131 ) ( ON ?auto_24129 ?auto_24130 ) ( CLEAR ?auto_24129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24133 ?auto_24132 ?auto_24131 ?auto_24130 )
      ( MAKE-5PILE ?auto_24129 ?auto_24130 ?auto_24131 ?auto_24132 ?auto_24133 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24139 - BLOCK
      ?auto_24140 - BLOCK
      ?auto_24141 - BLOCK
      ?auto_24142 - BLOCK
      ?auto_24143 - BLOCK
    )
    :vars
    (
      ?auto_24144 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24139 ?auto_24140 ) ) ( not ( = ?auto_24139 ?auto_24141 ) ) ( not ( = ?auto_24139 ?auto_24142 ) ) ( not ( = ?auto_24139 ?auto_24143 ) ) ( not ( = ?auto_24140 ?auto_24141 ) ) ( not ( = ?auto_24140 ?auto_24142 ) ) ( not ( = ?auto_24140 ?auto_24143 ) ) ( not ( = ?auto_24141 ?auto_24142 ) ) ( not ( = ?auto_24141 ?auto_24143 ) ) ( not ( = ?auto_24142 ?auto_24143 ) ) ( ON-TABLE ?auto_24143 ) ( ON ?auto_24142 ?auto_24143 ) ( ON ?auto_24141 ?auto_24142 ) ( ON ?auto_24140 ?auto_24141 ) ( CLEAR ?auto_24140 ) ( ON ?auto_24139 ?auto_24144 ) ( CLEAR ?auto_24139 ) ( HAND-EMPTY ) ( not ( = ?auto_24139 ?auto_24144 ) ) ( not ( = ?auto_24140 ?auto_24144 ) ) ( not ( = ?auto_24141 ?auto_24144 ) ) ( not ( = ?auto_24142 ?auto_24144 ) ) ( not ( = ?auto_24143 ?auto_24144 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24139 ?auto_24144 )
      ( MAKE-5PILE ?auto_24139 ?auto_24140 ?auto_24141 ?auto_24142 ?auto_24143 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24145 - BLOCK
      ?auto_24146 - BLOCK
      ?auto_24147 - BLOCK
      ?auto_24148 - BLOCK
      ?auto_24149 - BLOCK
    )
    :vars
    (
      ?auto_24150 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24145 ?auto_24146 ) ) ( not ( = ?auto_24145 ?auto_24147 ) ) ( not ( = ?auto_24145 ?auto_24148 ) ) ( not ( = ?auto_24145 ?auto_24149 ) ) ( not ( = ?auto_24146 ?auto_24147 ) ) ( not ( = ?auto_24146 ?auto_24148 ) ) ( not ( = ?auto_24146 ?auto_24149 ) ) ( not ( = ?auto_24147 ?auto_24148 ) ) ( not ( = ?auto_24147 ?auto_24149 ) ) ( not ( = ?auto_24148 ?auto_24149 ) ) ( ON-TABLE ?auto_24149 ) ( ON ?auto_24148 ?auto_24149 ) ( ON ?auto_24147 ?auto_24148 ) ( ON ?auto_24145 ?auto_24150 ) ( CLEAR ?auto_24145 ) ( not ( = ?auto_24145 ?auto_24150 ) ) ( not ( = ?auto_24146 ?auto_24150 ) ) ( not ( = ?auto_24147 ?auto_24150 ) ) ( not ( = ?auto_24148 ?auto_24150 ) ) ( not ( = ?auto_24149 ?auto_24150 ) ) ( HOLDING ?auto_24146 ) ( CLEAR ?auto_24147 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24149 ?auto_24148 ?auto_24147 ?auto_24146 )
      ( MAKE-5PILE ?auto_24145 ?auto_24146 ?auto_24147 ?auto_24148 ?auto_24149 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24151 - BLOCK
      ?auto_24152 - BLOCK
      ?auto_24153 - BLOCK
      ?auto_24154 - BLOCK
      ?auto_24155 - BLOCK
    )
    :vars
    (
      ?auto_24156 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24151 ?auto_24152 ) ) ( not ( = ?auto_24151 ?auto_24153 ) ) ( not ( = ?auto_24151 ?auto_24154 ) ) ( not ( = ?auto_24151 ?auto_24155 ) ) ( not ( = ?auto_24152 ?auto_24153 ) ) ( not ( = ?auto_24152 ?auto_24154 ) ) ( not ( = ?auto_24152 ?auto_24155 ) ) ( not ( = ?auto_24153 ?auto_24154 ) ) ( not ( = ?auto_24153 ?auto_24155 ) ) ( not ( = ?auto_24154 ?auto_24155 ) ) ( ON-TABLE ?auto_24155 ) ( ON ?auto_24154 ?auto_24155 ) ( ON ?auto_24153 ?auto_24154 ) ( ON ?auto_24151 ?auto_24156 ) ( not ( = ?auto_24151 ?auto_24156 ) ) ( not ( = ?auto_24152 ?auto_24156 ) ) ( not ( = ?auto_24153 ?auto_24156 ) ) ( not ( = ?auto_24154 ?auto_24156 ) ) ( not ( = ?auto_24155 ?auto_24156 ) ) ( CLEAR ?auto_24153 ) ( ON ?auto_24152 ?auto_24151 ) ( CLEAR ?auto_24152 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24156 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24156 ?auto_24151 )
      ( MAKE-5PILE ?auto_24151 ?auto_24152 ?auto_24153 ?auto_24154 ?auto_24155 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24157 - BLOCK
      ?auto_24158 - BLOCK
      ?auto_24159 - BLOCK
      ?auto_24160 - BLOCK
      ?auto_24161 - BLOCK
    )
    :vars
    (
      ?auto_24162 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24157 ?auto_24158 ) ) ( not ( = ?auto_24157 ?auto_24159 ) ) ( not ( = ?auto_24157 ?auto_24160 ) ) ( not ( = ?auto_24157 ?auto_24161 ) ) ( not ( = ?auto_24158 ?auto_24159 ) ) ( not ( = ?auto_24158 ?auto_24160 ) ) ( not ( = ?auto_24158 ?auto_24161 ) ) ( not ( = ?auto_24159 ?auto_24160 ) ) ( not ( = ?auto_24159 ?auto_24161 ) ) ( not ( = ?auto_24160 ?auto_24161 ) ) ( ON-TABLE ?auto_24161 ) ( ON ?auto_24160 ?auto_24161 ) ( ON ?auto_24157 ?auto_24162 ) ( not ( = ?auto_24157 ?auto_24162 ) ) ( not ( = ?auto_24158 ?auto_24162 ) ) ( not ( = ?auto_24159 ?auto_24162 ) ) ( not ( = ?auto_24160 ?auto_24162 ) ) ( not ( = ?auto_24161 ?auto_24162 ) ) ( ON ?auto_24158 ?auto_24157 ) ( CLEAR ?auto_24158 ) ( ON-TABLE ?auto_24162 ) ( HOLDING ?auto_24159 ) ( CLEAR ?auto_24160 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24161 ?auto_24160 ?auto_24159 )
      ( MAKE-5PILE ?auto_24157 ?auto_24158 ?auto_24159 ?auto_24160 ?auto_24161 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24163 - BLOCK
      ?auto_24164 - BLOCK
      ?auto_24165 - BLOCK
      ?auto_24166 - BLOCK
      ?auto_24167 - BLOCK
    )
    :vars
    (
      ?auto_24168 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24163 ?auto_24164 ) ) ( not ( = ?auto_24163 ?auto_24165 ) ) ( not ( = ?auto_24163 ?auto_24166 ) ) ( not ( = ?auto_24163 ?auto_24167 ) ) ( not ( = ?auto_24164 ?auto_24165 ) ) ( not ( = ?auto_24164 ?auto_24166 ) ) ( not ( = ?auto_24164 ?auto_24167 ) ) ( not ( = ?auto_24165 ?auto_24166 ) ) ( not ( = ?auto_24165 ?auto_24167 ) ) ( not ( = ?auto_24166 ?auto_24167 ) ) ( ON-TABLE ?auto_24167 ) ( ON ?auto_24166 ?auto_24167 ) ( ON ?auto_24163 ?auto_24168 ) ( not ( = ?auto_24163 ?auto_24168 ) ) ( not ( = ?auto_24164 ?auto_24168 ) ) ( not ( = ?auto_24165 ?auto_24168 ) ) ( not ( = ?auto_24166 ?auto_24168 ) ) ( not ( = ?auto_24167 ?auto_24168 ) ) ( ON ?auto_24164 ?auto_24163 ) ( ON-TABLE ?auto_24168 ) ( CLEAR ?auto_24166 ) ( ON ?auto_24165 ?auto_24164 ) ( CLEAR ?auto_24165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24168 ?auto_24163 ?auto_24164 )
      ( MAKE-5PILE ?auto_24163 ?auto_24164 ?auto_24165 ?auto_24166 ?auto_24167 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24169 - BLOCK
      ?auto_24170 - BLOCK
      ?auto_24171 - BLOCK
      ?auto_24172 - BLOCK
      ?auto_24173 - BLOCK
    )
    :vars
    (
      ?auto_24174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24169 ?auto_24170 ) ) ( not ( = ?auto_24169 ?auto_24171 ) ) ( not ( = ?auto_24169 ?auto_24172 ) ) ( not ( = ?auto_24169 ?auto_24173 ) ) ( not ( = ?auto_24170 ?auto_24171 ) ) ( not ( = ?auto_24170 ?auto_24172 ) ) ( not ( = ?auto_24170 ?auto_24173 ) ) ( not ( = ?auto_24171 ?auto_24172 ) ) ( not ( = ?auto_24171 ?auto_24173 ) ) ( not ( = ?auto_24172 ?auto_24173 ) ) ( ON-TABLE ?auto_24173 ) ( ON ?auto_24169 ?auto_24174 ) ( not ( = ?auto_24169 ?auto_24174 ) ) ( not ( = ?auto_24170 ?auto_24174 ) ) ( not ( = ?auto_24171 ?auto_24174 ) ) ( not ( = ?auto_24172 ?auto_24174 ) ) ( not ( = ?auto_24173 ?auto_24174 ) ) ( ON ?auto_24170 ?auto_24169 ) ( ON-TABLE ?auto_24174 ) ( ON ?auto_24171 ?auto_24170 ) ( CLEAR ?auto_24171 ) ( HOLDING ?auto_24172 ) ( CLEAR ?auto_24173 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24173 ?auto_24172 )
      ( MAKE-5PILE ?auto_24169 ?auto_24170 ?auto_24171 ?auto_24172 ?auto_24173 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24175 - BLOCK
      ?auto_24176 - BLOCK
      ?auto_24177 - BLOCK
      ?auto_24178 - BLOCK
      ?auto_24179 - BLOCK
    )
    :vars
    (
      ?auto_24180 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24175 ?auto_24176 ) ) ( not ( = ?auto_24175 ?auto_24177 ) ) ( not ( = ?auto_24175 ?auto_24178 ) ) ( not ( = ?auto_24175 ?auto_24179 ) ) ( not ( = ?auto_24176 ?auto_24177 ) ) ( not ( = ?auto_24176 ?auto_24178 ) ) ( not ( = ?auto_24176 ?auto_24179 ) ) ( not ( = ?auto_24177 ?auto_24178 ) ) ( not ( = ?auto_24177 ?auto_24179 ) ) ( not ( = ?auto_24178 ?auto_24179 ) ) ( ON-TABLE ?auto_24179 ) ( ON ?auto_24175 ?auto_24180 ) ( not ( = ?auto_24175 ?auto_24180 ) ) ( not ( = ?auto_24176 ?auto_24180 ) ) ( not ( = ?auto_24177 ?auto_24180 ) ) ( not ( = ?auto_24178 ?auto_24180 ) ) ( not ( = ?auto_24179 ?auto_24180 ) ) ( ON ?auto_24176 ?auto_24175 ) ( ON-TABLE ?auto_24180 ) ( ON ?auto_24177 ?auto_24176 ) ( CLEAR ?auto_24179 ) ( ON ?auto_24178 ?auto_24177 ) ( CLEAR ?auto_24178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24180 ?auto_24175 ?auto_24176 ?auto_24177 )
      ( MAKE-5PILE ?auto_24175 ?auto_24176 ?auto_24177 ?auto_24178 ?auto_24179 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24181 - BLOCK
      ?auto_24182 - BLOCK
      ?auto_24183 - BLOCK
      ?auto_24184 - BLOCK
      ?auto_24185 - BLOCK
    )
    :vars
    (
      ?auto_24186 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24181 ?auto_24182 ) ) ( not ( = ?auto_24181 ?auto_24183 ) ) ( not ( = ?auto_24181 ?auto_24184 ) ) ( not ( = ?auto_24181 ?auto_24185 ) ) ( not ( = ?auto_24182 ?auto_24183 ) ) ( not ( = ?auto_24182 ?auto_24184 ) ) ( not ( = ?auto_24182 ?auto_24185 ) ) ( not ( = ?auto_24183 ?auto_24184 ) ) ( not ( = ?auto_24183 ?auto_24185 ) ) ( not ( = ?auto_24184 ?auto_24185 ) ) ( ON ?auto_24181 ?auto_24186 ) ( not ( = ?auto_24181 ?auto_24186 ) ) ( not ( = ?auto_24182 ?auto_24186 ) ) ( not ( = ?auto_24183 ?auto_24186 ) ) ( not ( = ?auto_24184 ?auto_24186 ) ) ( not ( = ?auto_24185 ?auto_24186 ) ) ( ON ?auto_24182 ?auto_24181 ) ( ON-TABLE ?auto_24186 ) ( ON ?auto_24183 ?auto_24182 ) ( ON ?auto_24184 ?auto_24183 ) ( CLEAR ?auto_24184 ) ( HOLDING ?auto_24185 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24185 )
      ( MAKE-5PILE ?auto_24181 ?auto_24182 ?auto_24183 ?auto_24184 ?auto_24185 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24187 - BLOCK
      ?auto_24188 - BLOCK
      ?auto_24189 - BLOCK
      ?auto_24190 - BLOCK
      ?auto_24191 - BLOCK
    )
    :vars
    (
      ?auto_24192 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24187 ?auto_24188 ) ) ( not ( = ?auto_24187 ?auto_24189 ) ) ( not ( = ?auto_24187 ?auto_24190 ) ) ( not ( = ?auto_24187 ?auto_24191 ) ) ( not ( = ?auto_24188 ?auto_24189 ) ) ( not ( = ?auto_24188 ?auto_24190 ) ) ( not ( = ?auto_24188 ?auto_24191 ) ) ( not ( = ?auto_24189 ?auto_24190 ) ) ( not ( = ?auto_24189 ?auto_24191 ) ) ( not ( = ?auto_24190 ?auto_24191 ) ) ( ON ?auto_24187 ?auto_24192 ) ( not ( = ?auto_24187 ?auto_24192 ) ) ( not ( = ?auto_24188 ?auto_24192 ) ) ( not ( = ?auto_24189 ?auto_24192 ) ) ( not ( = ?auto_24190 ?auto_24192 ) ) ( not ( = ?auto_24191 ?auto_24192 ) ) ( ON ?auto_24188 ?auto_24187 ) ( ON-TABLE ?auto_24192 ) ( ON ?auto_24189 ?auto_24188 ) ( ON ?auto_24190 ?auto_24189 ) ( ON ?auto_24191 ?auto_24190 ) ( CLEAR ?auto_24191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24192 ?auto_24187 ?auto_24188 ?auto_24189 ?auto_24190 )
      ( MAKE-5PILE ?auto_24187 ?auto_24188 ?auto_24189 ?auto_24190 ?auto_24191 ) )
  )

)

