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
      ?auto_423213 - BLOCK
    )
    :vars
    (
      ?auto_423214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423213 ?auto_423214 ) ( CLEAR ?auto_423213 ) ( HAND-EMPTY ) ( not ( = ?auto_423213 ?auto_423214 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_423213 ?auto_423214 )
      ( !PUTDOWN ?auto_423213 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_423216 - BLOCK
    )
    :vars
    (
      ?auto_423217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423216 ?auto_423217 ) ( CLEAR ?auto_423216 ) ( HAND-EMPTY ) ( not ( = ?auto_423216 ?auto_423217 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_423216 ?auto_423217 )
      ( !PUTDOWN ?auto_423216 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_423220 - BLOCK
      ?auto_423221 - BLOCK
    )
    :vars
    (
      ?auto_423222 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_423220 ) ( ON ?auto_423221 ?auto_423222 ) ( CLEAR ?auto_423221 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_423220 ) ( not ( = ?auto_423220 ?auto_423221 ) ) ( not ( = ?auto_423220 ?auto_423222 ) ) ( not ( = ?auto_423221 ?auto_423222 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_423221 ?auto_423222 )
      ( !STACK ?auto_423221 ?auto_423220 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_423225 - BLOCK
      ?auto_423226 - BLOCK
    )
    :vars
    (
      ?auto_423227 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_423225 ) ( ON ?auto_423226 ?auto_423227 ) ( CLEAR ?auto_423226 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_423225 ) ( not ( = ?auto_423225 ?auto_423226 ) ) ( not ( = ?auto_423225 ?auto_423227 ) ) ( not ( = ?auto_423226 ?auto_423227 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_423226 ?auto_423227 )
      ( !STACK ?auto_423226 ?auto_423225 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_423230 - BLOCK
      ?auto_423231 - BLOCK
    )
    :vars
    (
      ?auto_423232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423231 ?auto_423232 ) ( not ( = ?auto_423230 ?auto_423231 ) ) ( not ( = ?auto_423230 ?auto_423232 ) ) ( not ( = ?auto_423231 ?auto_423232 ) ) ( ON ?auto_423230 ?auto_423231 ) ( CLEAR ?auto_423230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_423230 )
      ( MAKE-2PILE ?auto_423230 ?auto_423231 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_423235 - BLOCK
      ?auto_423236 - BLOCK
    )
    :vars
    (
      ?auto_423237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423236 ?auto_423237 ) ( not ( = ?auto_423235 ?auto_423236 ) ) ( not ( = ?auto_423235 ?auto_423237 ) ) ( not ( = ?auto_423236 ?auto_423237 ) ) ( ON ?auto_423235 ?auto_423236 ) ( CLEAR ?auto_423235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_423235 )
      ( MAKE-2PILE ?auto_423235 ?auto_423236 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_423241 - BLOCK
      ?auto_423242 - BLOCK
      ?auto_423243 - BLOCK
    )
    :vars
    (
      ?auto_423244 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_423242 ) ( ON ?auto_423243 ?auto_423244 ) ( CLEAR ?auto_423243 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_423241 ) ( ON ?auto_423242 ?auto_423241 ) ( not ( = ?auto_423241 ?auto_423242 ) ) ( not ( = ?auto_423241 ?auto_423243 ) ) ( not ( = ?auto_423241 ?auto_423244 ) ) ( not ( = ?auto_423242 ?auto_423243 ) ) ( not ( = ?auto_423242 ?auto_423244 ) ) ( not ( = ?auto_423243 ?auto_423244 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_423243 ?auto_423244 )
      ( !STACK ?auto_423243 ?auto_423242 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_423248 - BLOCK
      ?auto_423249 - BLOCK
      ?auto_423250 - BLOCK
    )
    :vars
    (
      ?auto_423251 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_423249 ) ( ON ?auto_423250 ?auto_423251 ) ( CLEAR ?auto_423250 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_423248 ) ( ON ?auto_423249 ?auto_423248 ) ( not ( = ?auto_423248 ?auto_423249 ) ) ( not ( = ?auto_423248 ?auto_423250 ) ) ( not ( = ?auto_423248 ?auto_423251 ) ) ( not ( = ?auto_423249 ?auto_423250 ) ) ( not ( = ?auto_423249 ?auto_423251 ) ) ( not ( = ?auto_423250 ?auto_423251 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_423250 ?auto_423251 )
      ( !STACK ?auto_423250 ?auto_423249 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_423255 - BLOCK
      ?auto_423256 - BLOCK
      ?auto_423257 - BLOCK
    )
    :vars
    (
      ?auto_423258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423257 ?auto_423258 ) ( ON-TABLE ?auto_423255 ) ( not ( = ?auto_423255 ?auto_423256 ) ) ( not ( = ?auto_423255 ?auto_423257 ) ) ( not ( = ?auto_423255 ?auto_423258 ) ) ( not ( = ?auto_423256 ?auto_423257 ) ) ( not ( = ?auto_423256 ?auto_423258 ) ) ( not ( = ?auto_423257 ?auto_423258 ) ) ( CLEAR ?auto_423255 ) ( ON ?auto_423256 ?auto_423257 ) ( CLEAR ?auto_423256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_423255 ?auto_423256 )
      ( MAKE-3PILE ?auto_423255 ?auto_423256 ?auto_423257 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_423262 - BLOCK
      ?auto_423263 - BLOCK
      ?auto_423264 - BLOCK
    )
    :vars
    (
      ?auto_423265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423264 ?auto_423265 ) ( ON-TABLE ?auto_423262 ) ( not ( = ?auto_423262 ?auto_423263 ) ) ( not ( = ?auto_423262 ?auto_423264 ) ) ( not ( = ?auto_423262 ?auto_423265 ) ) ( not ( = ?auto_423263 ?auto_423264 ) ) ( not ( = ?auto_423263 ?auto_423265 ) ) ( not ( = ?auto_423264 ?auto_423265 ) ) ( CLEAR ?auto_423262 ) ( ON ?auto_423263 ?auto_423264 ) ( CLEAR ?auto_423263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_423262 ?auto_423263 )
      ( MAKE-3PILE ?auto_423262 ?auto_423263 ?auto_423264 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_423269 - BLOCK
      ?auto_423270 - BLOCK
      ?auto_423271 - BLOCK
    )
    :vars
    (
      ?auto_423272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423271 ?auto_423272 ) ( not ( = ?auto_423269 ?auto_423270 ) ) ( not ( = ?auto_423269 ?auto_423271 ) ) ( not ( = ?auto_423269 ?auto_423272 ) ) ( not ( = ?auto_423270 ?auto_423271 ) ) ( not ( = ?auto_423270 ?auto_423272 ) ) ( not ( = ?auto_423271 ?auto_423272 ) ) ( ON ?auto_423270 ?auto_423271 ) ( ON ?auto_423269 ?auto_423270 ) ( CLEAR ?auto_423269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_423269 )
      ( MAKE-3PILE ?auto_423269 ?auto_423270 ?auto_423271 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_423276 - BLOCK
      ?auto_423277 - BLOCK
      ?auto_423278 - BLOCK
    )
    :vars
    (
      ?auto_423279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423278 ?auto_423279 ) ( not ( = ?auto_423276 ?auto_423277 ) ) ( not ( = ?auto_423276 ?auto_423278 ) ) ( not ( = ?auto_423276 ?auto_423279 ) ) ( not ( = ?auto_423277 ?auto_423278 ) ) ( not ( = ?auto_423277 ?auto_423279 ) ) ( not ( = ?auto_423278 ?auto_423279 ) ) ( ON ?auto_423277 ?auto_423278 ) ( ON ?auto_423276 ?auto_423277 ) ( CLEAR ?auto_423276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_423276 )
      ( MAKE-3PILE ?auto_423276 ?auto_423277 ?auto_423278 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_423284 - BLOCK
      ?auto_423285 - BLOCK
      ?auto_423286 - BLOCK
      ?auto_423287 - BLOCK
    )
    :vars
    (
      ?auto_423288 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_423286 ) ( ON ?auto_423287 ?auto_423288 ) ( CLEAR ?auto_423287 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_423284 ) ( ON ?auto_423285 ?auto_423284 ) ( ON ?auto_423286 ?auto_423285 ) ( not ( = ?auto_423284 ?auto_423285 ) ) ( not ( = ?auto_423284 ?auto_423286 ) ) ( not ( = ?auto_423284 ?auto_423287 ) ) ( not ( = ?auto_423284 ?auto_423288 ) ) ( not ( = ?auto_423285 ?auto_423286 ) ) ( not ( = ?auto_423285 ?auto_423287 ) ) ( not ( = ?auto_423285 ?auto_423288 ) ) ( not ( = ?auto_423286 ?auto_423287 ) ) ( not ( = ?auto_423286 ?auto_423288 ) ) ( not ( = ?auto_423287 ?auto_423288 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_423287 ?auto_423288 )
      ( !STACK ?auto_423287 ?auto_423286 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_423293 - BLOCK
      ?auto_423294 - BLOCK
      ?auto_423295 - BLOCK
      ?auto_423296 - BLOCK
    )
    :vars
    (
      ?auto_423297 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_423295 ) ( ON ?auto_423296 ?auto_423297 ) ( CLEAR ?auto_423296 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_423293 ) ( ON ?auto_423294 ?auto_423293 ) ( ON ?auto_423295 ?auto_423294 ) ( not ( = ?auto_423293 ?auto_423294 ) ) ( not ( = ?auto_423293 ?auto_423295 ) ) ( not ( = ?auto_423293 ?auto_423296 ) ) ( not ( = ?auto_423293 ?auto_423297 ) ) ( not ( = ?auto_423294 ?auto_423295 ) ) ( not ( = ?auto_423294 ?auto_423296 ) ) ( not ( = ?auto_423294 ?auto_423297 ) ) ( not ( = ?auto_423295 ?auto_423296 ) ) ( not ( = ?auto_423295 ?auto_423297 ) ) ( not ( = ?auto_423296 ?auto_423297 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_423296 ?auto_423297 )
      ( !STACK ?auto_423296 ?auto_423295 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_423302 - BLOCK
      ?auto_423303 - BLOCK
      ?auto_423304 - BLOCK
      ?auto_423305 - BLOCK
    )
    :vars
    (
      ?auto_423306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423305 ?auto_423306 ) ( ON-TABLE ?auto_423302 ) ( ON ?auto_423303 ?auto_423302 ) ( not ( = ?auto_423302 ?auto_423303 ) ) ( not ( = ?auto_423302 ?auto_423304 ) ) ( not ( = ?auto_423302 ?auto_423305 ) ) ( not ( = ?auto_423302 ?auto_423306 ) ) ( not ( = ?auto_423303 ?auto_423304 ) ) ( not ( = ?auto_423303 ?auto_423305 ) ) ( not ( = ?auto_423303 ?auto_423306 ) ) ( not ( = ?auto_423304 ?auto_423305 ) ) ( not ( = ?auto_423304 ?auto_423306 ) ) ( not ( = ?auto_423305 ?auto_423306 ) ) ( CLEAR ?auto_423303 ) ( ON ?auto_423304 ?auto_423305 ) ( CLEAR ?auto_423304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_423302 ?auto_423303 ?auto_423304 )
      ( MAKE-4PILE ?auto_423302 ?auto_423303 ?auto_423304 ?auto_423305 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_423311 - BLOCK
      ?auto_423312 - BLOCK
      ?auto_423313 - BLOCK
      ?auto_423314 - BLOCK
    )
    :vars
    (
      ?auto_423315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423314 ?auto_423315 ) ( ON-TABLE ?auto_423311 ) ( ON ?auto_423312 ?auto_423311 ) ( not ( = ?auto_423311 ?auto_423312 ) ) ( not ( = ?auto_423311 ?auto_423313 ) ) ( not ( = ?auto_423311 ?auto_423314 ) ) ( not ( = ?auto_423311 ?auto_423315 ) ) ( not ( = ?auto_423312 ?auto_423313 ) ) ( not ( = ?auto_423312 ?auto_423314 ) ) ( not ( = ?auto_423312 ?auto_423315 ) ) ( not ( = ?auto_423313 ?auto_423314 ) ) ( not ( = ?auto_423313 ?auto_423315 ) ) ( not ( = ?auto_423314 ?auto_423315 ) ) ( CLEAR ?auto_423312 ) ( ON ?auto_423313 ?auto_423314 ) ( CLEAR ?auto_423313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_423311 ?auto_423312 ?auto_423313 )
      ( MAKE-4PILE ?auto_423311 ?auto_423312 ?auto_423313 ?auto_423314 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_423320 - BLOCK
      ?auto_423321 - BLOCK
      ?auto_423322 - BLOCK
      ?auto_423323 - BLOCK
    )
    :vars
    (
      ?auto_423324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423323 ?auto_423324 ) ( ON-TABLE ?auto_423320 ) ( not ( = ?auto_423320 ?auto_423321 ) ) ( not ( = ?auto_423320 ?auto_423322 ) ) ( not ( = ?auto_423320 ?auto_423323 ) ) ( not ( = ?auto_423320 ?auto_423324 ) ) ( not ( = ?auto_423321 ?auto_423322 ) ) ( not ( = ?auto_423321 ?auto_423323 ) ) ( not ( = ?auto_423321 ?auto_423324 ) ) ( not ( = ?auto_423322 ?auto_423323 ) ) ( not ( = ?auto_423322 ?auto_423324 ) ) ( not ( = ?auto_423323 ?auto_423324 ) ) ( ON ?auto_423322 ?auto_423323 ) ( CLEAR ?auto_423320 ) ( ON ?auto_423321 ?auto_423322 ) ( CLEAR ?auto_423321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_423320 ?auto_423321 )
      ( MAKE-4PILE ?auto_423320 ?auto_423321 ?auto_423322 ?auto_423323 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_423329 - BLOCK
      ?auto_423330 - BLOCK
      ?auto_423331 - BLOCK
      ?auto_423332 - BLOCK
    )
    :vars
    (
      ?auto_423333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423332 ?auto_423333 ) ( ON-TABLE ?auto_423329 ) ( not ( = ?auto_423329 ?auto_423330 ) ) ( not ( = ?auto_423329 ?auto_423331 ) ) ( not ( = ?auto_423329 ?auto_423332 ) ) ( not ( = ?auto_423329 ?auto_423333 ) ) ( not ( = ?auto_423330 ?auto_423331 ) ) ( not ( = ?auto_423330 ?auto_423332 ) ) ( not ( = ?auto_423330 ?auto_423333 ) ) ( not ( = ?auto_423331 ?auto_423332 ) ) ( not ( = ?auto_423331 ?auto_423333 ) ) ( not ( = ?auto_423332 ?auto_423333 ) ) ( ON ?auto_423331 ?auto_423332 ) ( CLEAR ?auto_423329 ) ( ON ?auto_423330 ?auto_423331 ) ( CLEAR ?auto_423330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_423329 ?auto_423330 )
      ( MAKE-4PILE ?auto_423329 ?auto_423330 ?auto_423331 ?auto_423332 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_423338 - BLOCK
      ?auto_423339 - BLOCK
      ?auto_423340 - BLOCK
      ?auto_423341 - BLOCK
    )
    :vars
    (
      ?auto_423342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423341 ?auto_423342 ) ( not ( = ?auto_423338 ?auto_423339 ) ) ( not ( = ?auto_423338 ?auto_423340 ) ) ( not ( = ?auto_423338 ?auto_423341 ) ) ( not ( = ?auto_423338 ?auto_423342 ) ) ( not ( = ?auto_423339 ?auto_423340 ) ) ( not ( = ?auto_423339 ?auto_423341 ) ) ( not ( = ?auto_423339 ?auto_423342 ) ) ( not ( = ?auto_423340 ?auto_423341 ) ) ( not ( = ?auto_423340 ?auto_423342 ) ) ( not ( = ?auto_423341 ?auto_423342 ) ) ( ON ?auto_423340 ?auto_423341 ) ( ON ?auto_423339 ?auto_423340 ) ( ON ?auto_423338 ?auto_423339 ) ( CLEAR ?auto_423338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_423338 )
      ( MAKE-4PILE ?auto_423338 ?auto_423339 ?auto_423340 ?auto_423341 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_423347 - BLOCK
      ?auto_423348 - BLOCK
      ?auto_423349 - BLOCK
      ?auto_423350 - BLOCK
    )
    :vars
    (
      ?auto_423351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423350 ?auto_423351 ) ( not ( = ?auto_423347 ?auto_423348 ) ) ( not ( = ?auto_423347 ?auto_423349 ) ) ( not ( = ?auto_423347 ?auto_423350 ) ) ( not ( = ?auto_423347 ?auto_423351 ) ) ( not ( = ?auto_423348 ?auto_423349 ) ) ( not ( = ?auto_423348 ?auto_423350 ) ) ( not ( = ?auto_423348 ?auto_423351 ) ) ( not ( = ?auto_423349 ?auto_423350 ) ) ( not ( = ?auto_423349 ?auto_423351 ) ) ( not ( = ?auto_423350 ?auto_423351 ) ) ( ON ?auto_423349 ?auto_423350 ) ( ON ?auto_423348 ?auto_423349 ) ( ON ?auto_423347 ?auto_423348 ) ( CLEAR ?auto_423347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_423347 )
      ( MAKE-4PILE ?auto_423347 ?auto_423348 ?auto_423349 ?auto_423350 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_423357 - BLOCK
      ?auto_423358 - BLOCK
      ?auto_423359 - BLOCK
      ?auto_423360 - BLOCK
      ?auto_423361 - BLOCK
    )
    :vars
    (
      ?auto_423362 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_423360 ) ( ON ?auto_423361 ?auto_423362 ) ( CLEAR ?auto_423361 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_423357 ) ( ON ?auto_423358 ?auto_423357 ) ( ON ?auto_423359 ?auto_423358 ) ( ON ?auto_423360 ?auto_423359 ) ( not ( = ?auto_423357 ?auto_423358 ) ) ( not ( = ?auto_423357 ?auto_423359 ) ) ( not ( = ?auto_423357 ?auto_423360 ) ) ( not ( = ?auto_423357 ?auto_423361 ) ) ( not ( = ?auto_423357 ?auto_423362 ) ) ( not ( = ?auto_423358 ?auto_423359 ) ) ( not ( = ?auto_423358 ?auto_423360 ) ) ( not ( = ?auto_423358 ?auto_423361 ) ) ( not ( = ?auto_423358 ?auto_423362 ) ) ( not ( = ?auto_423359 ?auto_423360 ) ) ( not ( = ?auto_423359 ?auto_423361 ) ) ( not ( = ?auto_423359 ?auto_423362 ) ) ( not ( = ?auto_423360 ?auto_423361 ) ) ( not ( = ?auto_423360 ?auto_423362 ) ) ( not ( = ?auto_423361 ?auto_423362 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_423361 ?auto_423362 )
      ( !STACK ?auto_423361 ?auto_423360 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_423368 - BLOCK
      ?auto_423369 - BLOCK
      ?auto_423370 - BLOCK
      ?auto_423371 - BLOCK
      ?auto_423372 - BLOCK
    )
    :vars
    (
      ?auto_423373 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_423371 ) ( ON ?auto_423372 ?auto_423373 ) ( CLEAR ?auto_423372 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_423368 ) ( ON ?auto_423369 ?auto_423368 ) ( ON ?auto_423370 ?auto_423369 ) ( ON ?auto_423371 ?auto_423370 ) ( not ( = ?auto_423368 ?auto_423369 ) ) ( not ( = ?auto_423368 ?auto_423370 ) ) ( not ( = ?auto_423368 ?auto_423371 ) ) ( not ( = ?auto_423368 ?auto_423372 ) ) ( not ( = ?auto_423368 ?auto_423373 ) ) ( not ( = ?auto_423369 ?auto_423370 ) ) ( not ( = ?auto_423369 ?auto_423371 ) ) ( not ( = ?auto_423369 ?auto_423372 ) ) ( not ( = ?auto_423369 ?auto_423373 ) ) ( not ( = ?auto_423370 ?auto_423371 ) ) ( not ( = ?auto_423370 ?auto_423372 ) ) ( not ( = ?auto_423370 ?auto_423373 ) ) ( not ( = ?auto_423371 ?auto_423372 ) ) ( not ( = ?auto_423371 ?auto_423373 ) ) ( not ( = ?auto_423372 ?auto_423373 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_423372 ?auto_423373 )
      ( !STACK ?auto_423372 ?auto_423371 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_423379 - BLOCK
      ?auto_423380 - BLOCK
      ?auto_423381 - BLOCK
      ?auto_423382 - BLOCK
      ?auto_423383 - BLOCK
    )
    :vars
    (
      ?auto_423384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423383 ?auto_423384 ) ( ON-TABLE ?auto_423379 ) ( ON ?auto_423380 ?auto_423379 ) ( ON ?auto_423381 ?auto_423380 ) ( not ( = ?auto_423379 ?auto_423380 ) ) ( not ( = ?auto_423379 ?auto_423381 ) ) ( not ( = ?auto_423379 ?auto_423382 ) ) ( not ( = ?auto_423379 ?auto_423383 ) ) ( not ( = ?auto_423379 ?auto_423384 ) ) ( not ( = ?auto_423380 ?auto_423381 ) ) ( not ( = ?auto_423380 ?auto_423382 ) ) ( not ( = ?auto_423380 ?auto_423383 ) ) ( not ( = ?auto_423380 ?auto_423384 ) ) ( not ( = ?auto_423381 ?auto_423382 ) ) ( not ( = ?auto_423381 ?auto_423383 ) ) ( not ( = ?auto_423381 ?auto_423384 ) ) ( not ( = ?auto_423382 ?auto_423383 ) ) ( not ( = ?auto_423382 ?auto_423384 ) ) ( not ( = ?auto_423383 ?auto_423384 ) ) ( CLEAR ?auto_423381 ) ( ON ?auto_423382 ?auto_423383 ) ( CLEAR ?auto_423382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_423379 ?auto_423380 ?auto_423381 ?auto_423382 )
      ( MAKE-5PILE ?auto_423379 ?auto_423380 ?auto_423381 ?auto_423382 ?auto_423383 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_423390 - BLOCK
      ?auto_423391 - BLOCK
      ?auto_423392 - BLOCK
      ?auto_423393 - BLOCK
      ?auto_423394 - BLOCK
    )
    :vars
    (
      ?auto_423395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423394 ?auto_423395 ) ( ON-TABLE ?auto_423390 ) ( ON ?auto_423391 ?auto_423390 ) ( ON ?auto_423392 ?auto_423391 ) ( not ( = ?auto_423390 ?auto_423391 ) ) ( not ( = ?auto_423390 ?auto_423392 ) ) ( not ( = ?auto_423390 ?auto_423393 ) ) ( not ( = ?auto_423390 ?auto_423394 ) ) ( not ( = ?auto_423390 ?auto_423395 ) ) ( not ( = ?auto_423391 ?auto_423392 ) ) ( not ( = ?auto_423391 ?auto_423393 ) ) ( not ( = ?auto_423391 ?auto_423394 ) ) ( not ( = ?auto_423391 ?auto_423395 ) ) ( not ( = ?auto_423392 ?auto_423393 ) ) ( not ( = ?auto_423392 ?auto_423394 ) ) ( not ( = ?auto_423392 ?auto_423395 ) ) ( not ( = ?auto_423393 ?auto_423394 ) ) ( not ( = ?auto_423393 ?auto_423395 ) ) ( not ( = ?auto_423394 ?auto_423395 ) ) ( CLEAR ?auto_423392 ) ( ON ?auto_423393 ?auto_423394 ) ( CLEAR ?auto_423393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_423390 ?auto_423391 ?auto_423392 ?auto_423393 )
      ( MAKE-5PILE ?auto_423390 ?auto_423391 ?auto_423392 ?auto_423393 ?auto_423394 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_423401 - BLOCK
      ?auto_423402 - BLOCK
      ?auto_423403 - BLOCK
      ?auto_423404 - BLOCK
      ?auto_423405 - BLOCK
    )
    :vars
    (
      ?auto_423406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423405 ?auto_423406 ) ( ON-TABLE ?auto_423401 ) ( ON ?auto_423402 ?auto_423401 ) ( not ( = ?auto_423401 ?auto_423402 ) ) ( not ( = ?auto_423401 ?auto_423403 ) ) ( not ( = ?auto_423401 ?auto_423404 ) ) ( not ( = ?auto_423401 ?auto_423405 ) ) ( not ( = ?auto_423401 ?auto_423406 ) ) ( not ( = ?auto_423402 ?auto_423403 ) ) ( not ( = ?auto_423402 ?auto_423404 ) ) ( not ( = ?auto_423402 ?auto_423405 ) ) ( not ( = ?auto_423402 ?auto_423406 ) ) ( not ( = ?auto_423403 ?auto_423404 ) ) ( not ( = ?auto_423403 ?auto_423405 ) ) ( not ( = ?auto_423403 ?auto_423406 ) ) ( not ( = ?auto_423404 ?auto_423405 ) ) ( not ( = ?auto_423404 ?auto_423406 ) ) ( not ( = ?auto_423405 ?auto_423406 ) ) ( ON ?auto_423404 ?auto_423405 ) ( CLEAR ?auto_423402 ) ( ON ?auto_423403 ?auto_423404 ) ( CLEAR ?auto_423403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_423401 ?auto_423402 ?auto_423403 )
      ( MAKE-5PILE ?auto_423401 ?auto_423402 ?auto_423403 ?auto_423404 ?auto_423405 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_423412 - BLOCK
      ?auto_423413 - BLOCK
      ?auto_423414 - BLOCK
      ?auto_423415 - BLOCK
      ?auto_423416 - BLOCK
    )
    :vars
    (
      ?auto_423417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423416 ?auto_423417 ) ( ON-TABLE ?auto_423412 ) ( ON ?auto_423413 ?auto_423412 ) ( not ( = ?auto_423412 ?auto_423413 ) ) ( not ( = ?auto_423412 ?auto_423414 ) ) ( not ( = ?auto_423412 ?auto_423415 ) ) ( not ( = ?auto_423412 ?auto_423416 ) ) ( not ( = ?auto_423412 ?auto_423417 ) ) ( not ( = ?auto_423413 ?auto_423414 ) ) ( not ( = ?auto_423413 ?auto_423415 ) ) ( not ( = ?auto_423413 ?auto_423416 ) ) ( not ( = ?auto_423413 ?auto_423417 ) ) ( not ( = ?auto_423414 ?auto_423415 ) ) ( not ( = ?auto_423414 ?auto_423416 ) ) ( not ( = ?auto_423414 ?auto_423417 ) ) ( not ( = ?auto_423415 ?auto_423416 ) ) ( not ( = ?auto_423415 ?auto_423417 ) ) ( not ( = ?auto_423416 ?auto_423417 ) ) ( ON ?auto_423415 ?auto_423416 ) ( CLEAR ?auto_423413 ) ( ON ?auto_423414 ?auto_423415 ) ( CLEAR ?auto_423414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_423412 ?auto_423413 ?auto_423414 )
      ( MAKE-5PILE ?auto_423412 ?auto_423413 ?auto_423414 ?auto_423415 ?auto_423416 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_423423 - BLOCK
      ?auto_423424 - BLOCK
      ?auto_423425 - BLOCK
      ?auto_423426 - BLOCK
      ?auto_423427 - BLOCK
    )
    :vars
    (
      ?auto_423428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423427 ?auto_423428 ) ( ON-TABLE ?auto_423423 ) ( not ( = ?auto_423423 ?auto_423424 ) ) ( not ( = ?auto_423423 ?auto_423425 ) ) ( not ( = ?auto_423423 ?auto_423426 ) ) ( not ( = ?auto_423423 ?auto_423427 ) ) ( not ( = ?auto_423423 ?auto_423428 ) ) ( not ( = ?auto_423424 ?auto_423425 ) ) ( not ( = ?auto_423424 ?auto_423426 ) ) ( not ( = ?auto_423424 ?auto_423427 ) ) ( not ( = ?auto_423424 ?auto_423428 ) ) ( not ( = ?auto_423425 ?auto_423426 ) ) ( not ( = ?auto_423425 ?auto_423427 ) ) ( not ( = ?auto_423425 ?auto_423428 ) ) ( not ( = ?auto_423426 ?auto_423427 ) ) ( not ( = ?auto_423426 ?auto_423428 ) ) ( not ( = ?auto_423427 ?auto_423428 ) ) ( ON ?auto_423426 ?auto_423427 ) ( ON ?auto_423425 ?auto_423426 ) ( CLEAR ?auto_423423 ) ( ON ?auto_423424 ?auto_423425 ) ( CLEAR ?auto_423424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_423423 ?auto_423424 )
      ( MAKE-5PILE ?auto_423423 ?auto_423424 ?auto_423425 ?auto_423426 ?auto_423427 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_423434 - BLOCK
      ?auto_423435 - BLOCK
      ?auto_423436 - BLOCK
      ?auto_423437 - BLOCK
      ?auto_423438 - BLOCK
    )
    :vars
    (
      ?auto_423439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423438 ?auto_423439 ) ( ON-TABLE ?auto_423434 ) ( not ( = ?auto_423434 ?auto_423435 ) ) ( not ( = ?auto_423434 ?auto_423436 ) ) ( not ( = ?auto_423434 ?auto_423437 ) ) ( not ( = ?auto_423434 ?auto_423438 ) ) ( not ( = ?auto_423434 ?auto_423439 ) ) ( not ( = ?auto_423435 ?auto_423436 ) ) ( not ( = ?auto_423435 ?auto_423437 ) ) ( not ( = ?auto_423435 ?auto_423438 ) ) ( not ( = ?auto_423435 ?auto_423439 ) ) ( not ( = ?auto_423436 ?auto_423437 ) ) ( not ( = ?auto_423436 ?auto_423438 ) ) ( not ( = ?auto_423436 ?auto_423439 ) ) ( not ( = ?auto_423437 ?auto_423438 ) ) ( not ( = ?auto_423437 ?auto_423439 ) ) ( not ( = ?auto_423438 ?auto_423439 ) ) ( ON ?auto_423437 ?auto_423438 ) ( ON ?auto_423436 ?auto_423437 ) ( CLEAR ?auto_423434 ) ( ON ?auto_423435 ?auto_423436 ) ( CLEAR ?auto_423435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_423434 ?auto_423435 )
      ( MAKE-5PILE ?auto_423434 ?auto_423435 ?auto_423436 ?auto_423437 ?auto_423438 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_423445 - BLOCK
      ?auto_423446 - BLOCK
      ?auto_423447 - BLOCK
      ?auto_423448 - BLOCK
      ?auto_423449 - BLOCK
    )
    :vars
    (
      ?auto_423450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423449 ?auto_423450 ) ( not ( = ?auto_423445 ?auto_423446 ) ) ( not ( = ?auto_423445 ?auto_423447 ) ) ( not ( = ?auto_423445 ?auto_423448 ) ) ( not ( = ?auto_423445 ?auto_423449 ) ) ( not ( = ?auto_423445 ?auto_423450 ) ) ( not ( = ?auto_423446 ?auto_423447 ) ) ( not ( = ?auto_423446 ?auto_423448 ) ) ( not ( = ?auto_423446 ?auto_423449 ) ) ( not ( = ?auto_423446 ?auto_423450 ) ) ( not ( = ?auto_423447 ?auto_423448 ) ) ( not ( = ?auto_423447 ?auto_423449 ) ) ( not ( = ?auto_423447 ?auto_423450 ) ) ( not ( = ?auto_423448 ?auto_423449 ) ) ( not ( = ?auto_423448 ?auto_423450 ) ) ( not ( = ?auto_423449 ?auto_423450 ) ) ( ON ?auto_423448 ?auto_423449 ) ( ON ?auto_423447 ?auto_423448 ) ( ON ?auto_423446 ?auto_423447 ) ( ON ?auto_423445 ?auto_423446 ) ( CLEAR ?auto_423445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_423445 )
      ( MAKE-5PILE ?auto_423445 ?auto_423446 ?auto_423447 ?auto_423448 ?auto_423449 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_423456 - BLOCK
      ?auto_423457 - BLOCK
      ?auto_423458 - BLOCK
      ?auto_423459 - BLOCK
      ?auto_423460 - BLOCK
    )
    :vars
    (
      ?auto_423461 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423460 ?auto_423461 ) ( not ( = ?auto_423456 ?auto_423457 ) ) ( not ( = ?auto_423456 ?auto_423458 ) ) ( not ( = ?auto_423456 ?auto_423459 ) ) ( not ( = ?auto_423456 ?auto_423460 ) ) ( not ( = ?auto_423456 ?auto_423461 ) ) ( not ( = ?auto_423457 ?auto_423458 ) ) ( not ( = ?auto_423457 ?auto_423459 ) ) ( not ( = ?auto_423457 ?auto_423460 ) ) ( not ( = ?auto_423457 ?auto_423461 ) ) ( not ( = ?auto_423458 ?auto_423459 ) ) ( not ( = ?auto_423458 ?auto_423460 ) ) ( not ( = ?auto_423458 ?auto_423461 ) ) ( not ( = ?auto_423459 ?auto_423460 ) ) ( not ( = ?auto_423459 ?auto_423461 ) ) ( not ( = ?auto_423460 ?auto_423461 ) ) ( ON ?auto_423459 ?auto_423460 ) ( ON ?auto_423458 ?auto_423459 ) ( ON ?auto_423457 ?auto_423458 ) ( ON ?auto_423456 ?auto_423457 ) ( CLEAR ?auto_423456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_423456 )
      ( MAKE-5PILE ?auto_423456 ?auto_423457 ?auto_423458 ?auto_423459 ?auto_423460 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_423468 - BLOCK
      ?auto_423469 - BLOCK
      ?auto_423470 - BLOCK
      ?auto_423471 - BLOCK
      ?auto_423472 - BLOCK
      ?auto_423473 - BLOCK
    )
    :vars
    (
      ?auto_423474 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_423472 ) ( ON ?auto_423473 ?auto_423474 ) ( CLEAR ?auto_423473 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_423468 ) ( ON ?auto_423469 ?auto_423468 ) ( ON ?auto_423470 ?auto_423469 ) ( ON ?auto_423471 ?auto_423470 ) ( ON ?auto_423472 ?auto_423471 ) ( not ( = ?auto_423468 ?auto_423469 ) ) ( not ( = ?auto_423468 ?auto_423470 ) ) ( not ( = ?auto_423468 ?auto_423471 ) ) ( not ( = ?auto_423468 ?auto_423472 ) ) ( not ( = ?auto_423468 ?auto_423473 ) ) ( not ( = ?auto_423468 ?auto_423474 ) ) ( not ( = ?auto_423469 ?auto_423470 ) ) ( not ( = ?auto_423469 ?auto_423471 ) ) ( not ( = ?auto_423469 ?auto_423472 ) ) ( not ( = ?auto_423469 ?auto_423473 ) ) ( not ( = ?auto_423469 ?auto_423474 ) ) ( not ( = ?auto_423470 ?auto_423471 ) ) ( not ( = ?auto_423470 ?auto_423472 ) ) ( not ( = ?auto_423470 ?auto_423473 ) ) ( not ( = ?auto_423470 ?auto_423474 ) ) ( not ( = ?auto_423471 ?auto_423472 ) ) ( not ( = ?auto_423471 ?auto_423473 ) ) ( not ( = ?auto_423471 ?auto_423474 ) ) ( not ( = ?auto_423472 ?auto_423473 ) ) ( not ( = ?auto_423472 ?auto_423474 ) ) ( not ( = ?auto_423473 ?auto_423474 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_423473 ?auto_423474 )
      ( !STACK ?auto_423473 ?auto_423472 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_423481 - BLOCK
      ?auto_423482 - BLOCK
      ?auto_423483 - BLOCK
      ?auto_423484 - BLOCK
      ?auto_423485 - BLOCK
      ?auto_423486 - BLOCK
    )
    :vars
    (
      ?auto_423487 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_423485 ) ( ON ?auto_423486 ?auto_423487 ) ( CLEAR ?auto_423486 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_423481 ) ( ON ?auto_423482 ?auto_423481 ) ( ON ?auto_423483 ?auto_423482 ) ( ON ?auto_423484 ?auto_423483 ) ( ON ?auto_423485 ?auto_423484 ) ( not ( = ?auto_423481 ?auto_423482 ) ) ( not ( = ?auto_423481 ?auto_423483 ) ) ( not ( = ?auto_423481 ?auto_423484 ) ) ( not ( = ?auto_423481 ?auto_423485 ) ) ( not ( = ?auto_423481 ?auto_423486 ) ) ( not ( = ?auto_423481 ?auto_423487 ) ) ( not ( = ?auto_423482 ?auto_423483 ) ) ( not ( = ?auto_423482 ?auto_423484 ) ) ( not ( = ?auto_423482 ?auto_423485 ) ) ( not ( = ?auto_423482 ?auto_423486 ) ) ( not ( = ?auto_423482 ?auto_423487 ) ) ( not ( = ?auto_423483 ?auto_423484 ) ) ( not ( = ?auto_423483 ?auto_423485 ) ) ( not ( = ?auto_423483 ?auto_423486 ) ) ( not ( = ?auto_423483 ?auto_423487 ) ) ( not ( = ?auto_423484 ?auto_423485 ) ) ( not ( = ?auto_423484 ?auto_423486 ) ) ( not ( = ?auto_423484 ?auto_423487 ) ) ( not ( = ?auto_423485 ?auto_423486 ) ) ( not ( = ?auto_423485 ?auto_423487 ) ) ( not ( = ?auto_423486 ?auto_423487 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_423486 ?auto_423487 )
      ( !STACK ?auto_423486 ?auto_423485 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_423494 - BLOCK
      ?auto_423495 - BLOCK
      ?auto_423496 - BLOCK
      ?auto_423497 - BLOCK
      ?auto_423498 - BLOCK
      ?auto_423499 - BLOCK
    )
    :vars
    (
      ?auto_423500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423499 ?auto_423500 ) ( ON-TABLE ?auto_423494 ) ( ON ?auto_423495 ?auto_423494 ) ( ON ?auto_423496 ?auto_423495 ) ( ON ?auto_423497 ?auto_423496 ) ( not ( = ?auto_423494 ?auto_423495 ) ) ( not ( = ?auto_423494 ?auto_423496 ) ) ( not ( = ?auto_423494 ?auto_423497 ) ) ( not ( = ?auto_423494 ?auto_423498 ) ) ( not ( = ?auto_423494 ?auto_423499 ) ) ( not ( = ?auto_423494 ?auto_423500 ) ) ( not ( = ?auto_423495 ?auto_423496 ) ) ( not ( = ?auto_423495 ?auto_423497 ) ) ( not ( = ?auto_423495 ?auto_423498 ) ) ( not ( = ?auto_423495 ?auto_423499 ) ) ( not ( = ?auto_423495 ?auto_423500 ) ) ( not ( = ?auto_423496 ?auto_423497 ) ) ( not ( = ?auto_423496 ?auto_423498 ) ) ( not ( = ?auto_423496 ?auto_423499 ) ) ( not ( = ?auto_423496 ?auto_423500 ) ) ( not ( = ?auto_423497 ?auto_423498 ) ) ( not ( = ?auto_423497 ?auto_423499 ) ) ( not ( = ?auto_423497 ?auto_423500 ) ) ( not ( = ?auto_423498 ?auto_423499 ) ) ( not ( = ?auto_423498 ?auto_423500 ) ) ( not ( = ?auto_423499 ?auto_423500 ) ) ( CLEAR ?auto_423497 ) ( ON ?auto_423498 ?auto_423499 ) ( CLEAR ?auto_423498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_423494 ?auto_423495 ?auto_423496 ?auto_423497 ?auto_423498 )
      ( MAKE-6PILE ?auto_423494 ?auto_423495 ?auto_423496 ?auto_423497 ?auto_423498 ?auto_423499 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_423507 - BLOCK
      ?auto_423508 - BLOCK
      ?auto_423509 - BLOCK
      ?auto_423510 - BLOCK
      ?auto_423511 - BLOCK
      ?auto_423512 - BLOCK
    )
    :vars
    (
      ?auto_423513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423512 ?auto_423513 ) ( ON-TABLE ?auto_423507 ) ( ON ?auto_423508 ?auto_423507 ) ( ON ?auto_423509 ?auto_423508 ) ( ON ?auto_423510 ?auto_423509 ) ( not ( = ?auto_423507 ?auto_423508 ) ) ( not ( = ?auto_423507 ?auto_423509 ) ) ( not ( = ?auto_423507 ?auto_423510 ) ) ( not ( = ?auto_423507 ?auto_423511 ) ) ( not ( = ?auto_423507 ?auto_423512 ) ) ( not ( = ?auto_423507 ?auto_423513 ) ) ( not ( = ?auto_423508 ?auto_423509 ) ) ( not ( = ?auto_423508 ?auto_423510 ) ) ( not ( = ?auto_423508 ?auto_423511 ) ) ( not ( = ?auto_423508 ?auto_423512 ) ) ( not ( = ?auto_423508 ?auto_423513 ) ) ( not ( = ?auto_423509 ?auto_423510 ) ) ( not ( = ?auto_423509 ?auto_423511 ) ) ( not ( = ?auto_423509 ?auto_423512 ) ) ( not ( = ?auto_423509 ?auto_423513 ) ) ( not ( = ?auto_423510 ?auto_423511 ) ) ( not ( = ?auto_423510 ?auto_423512 ) ) ( not ( = ?auto_423510 ?auto_423513 ) ) ( not ( = ?auto_423511 ?auto_423512 ) ) ( not ( = ?auto_423511 ?auto_423513 ) ) ( not ( = ?auto_423512 ?auto_423513 ) ) ( CLEAR ?auto_423510 ) ( ON ?auto_423511 ?auto_423512 ) ( CLEAR ?auto_423511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_423507 ?auto_423508 ?auto_423509 ?auto_423510 ?auto_423511 )
      ( MAKE-6PILE ?auto_423507 ?auto_423508 ?auto_423509 ?auto_423510 ?auto_423511 ?auto_423512 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_423520 - BLOCK
      ?auto_423521 - BLOCK
      ?auto_423522 - BLOCK
      ?auto_423523 - BLOCK
      ?auto_423524 - BLOCK
      ?auto_423525 - BLOCK
    )
    :vars
    (
      ?auto_423526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423525 ?auto_423526 ) ( ON-TABLE ?auto_423520 ) ( ON ?auto_423521 ?auto_423520 ) ( ON ?auto_423522 ?auto_423521 ) ( not ( = ?auto_423520 ?auto_423521 ) ) ( not ( = ?auto_423520 ?auto_423522 ) ) ( not ( = ?auto_423520 ?auto_423523 ) ) ( not ( = ?auto_423520 ?auto_423524 ) ) ( not ( = ?auto_423520 ?auto_423525 ) ) ( not ( = ?auto_423520 ?auto_423526 ) ) ( not ( = ?auto_423521 ?auto_423522 ) ) ( not ( = ?auto_423521 ?auto_423523 ) ) ( not ( = ?auto_423521 ?auto_423524 ) ) ( not ( = ?auto_423521 ?auto_423525 ) ) ( not ( = ?auto_423521 ?auto_423526 ) ) ( not ( = ?auto_423522 ?auto_423523 ) ) ( not ( = ?auto_423522 ?auto_423524 ) ) ( not ( = ?auto_423522 ?auto_423525 ) ) ( not ( = ?auto_423522 ?auto_423526 ) ) ( not ( = ?auto_423523 ?auto_423524 ) ) ( not ( = ?auto_423523 ?auto_423525 ) ) ( not ( = ?auto_423523 ?auto_423526 ) ) ( not ( = ?auto_423524 ?auto_423525 ) ) ( not ( = ?auto_423524 ?auto_423526 ) ) ( not ( = ?auto_423525 ?auto_423526 ) ) ( ON ?auto_423524 ?auto_423525 ) ( CLEAR ?auto_423522 ) ( ON ?auto_423523 ?auto_423524 ) ( CLEAR ?auto_423523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_423520 ?auto_423521 ?auto_423522 ?auto_423523 )
      ( MAKE-6PILE ?auto_423520 ?auto_423521 ?auto_423522 ?auto_423523 ?auto_423524 ?auto_423525 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_423533 - BLOCK
      ?auto_423534 - BLOCK
      ?auto_423535 - BLOCK
      ?auto_423536 - BLOCK
      ?auto_423537 - BLOCK
      ?auto_423538 - BLOCK
    )
    :vars
    (
      ?auto_423539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423538 ?auto_423539 ) ( ON-TABLE ?auto_423533 ) ( ON ?auto_423534 ?auto_423533 ) ( ON ?auto_423535 ?auto_423534 ) ( not ( = ?auto_423533 ?auto_423534 ) ) ( not ( = ?auto_423533 ?auto_423535 ) ) ( not ( = ?auto_423533 ?auto_423536 ) ) ( not ( = ?auto_423533 ?auto_423537 ) ) ( not ( = ?auto_423533 ?auto_423538 ) ) ( not ( = ?auto_423533 ?auto_423539 ) ) ( not ( = ?auto_423534 ?auto_423535 ) ) ( not ( = ?auto_423534 ?auto_423536 ) ) ( not ( = ?auto_423534 ?auto_423537 ) ) ( not ( = ?auto_423534 ?auto_423538 ) ) ( not ( = ?auto_423534 ?auto_423539 ) ) ( not ( = ?auto_423535 ?auto_423536 ) ) ( not ( = ?auto_423535 ?auto_423537 ) ) ( not ( = ?auto_423535 ?auto_423538 ) ) ( not ( = ?auto_423535 ?auto_423539 ) ) ( not ( = ?auto_423536 ?auto_423537 ) ) ( not ( = ?auto_423536 ?auto_423538 ) ) ( not ( = ?auto_423536 ?auto_423539 ) ) ( not ( = ?auto_423537 ?auto_423538 ) ) ( not ( = ?auto_423537 ?auto_423539 ) ) ( not ( = ?auto_423538 ?auto_423539 ) ) ( ON ?auto_423537 ?auto_423538 ) ( CLEAR ?auto_423535 ) ( ON ?auto_423536 ?auto_423537 ) ( CLEAR ?auto_423536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_423533 ?auto_423534 ?auto_423535 ?auto_423536 )
      ( MAKE-6PILE ?auto_423533 ?auto_423534 ?auto_423535 ?auto_423536 ?auto_423537 ?auto_423538 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_423546 - BLOCK
      ?auto_423547 - BLOCK
      ?auto_423548 - BLOCK
      ?auto_423549 - BLOCK
      ?auto_423550 - BLOCK
      ?auto_423551 - BLOCK
    )
    :vars
    (
      ?auto_423552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423551 ?auto_423552 ) ( ON-TABLE ?auto_423546 ) ( ON ?auto_423547 ?auto_423546 ) ( not ( = ?auto_423546 ?auto_423547 ) ) ( not ( = ?auto_423546 ?auto_423548 ) ) ( not ( = ?auto_423546 ?auto_423549 ) ) ( not ( = ?auto_423546 ?auto_423550 ) ) ( not ( = ?auto_423546 ?auto_423551 ) ) ( not ( = ?auto_423546 ?auto_423552 ) ) ( not ( = ?auto_423547 ?auto_423548 ) ) ( not ( = ?auto_423547 ?auto_423549 ) ) ( not ( = ?auto_423547 ?auto_423550 ) ) ( not ( = ?auto_423547 ?auto_423551 ) ) ( not ( = ?auto_423547 ?auto_423552 ) ) ( not ( = ?auto_423548 ?auto_423549 ) ) ( not ( = ?auto_423548 ?auto_423550 ) ) ( not ( = ?auto_423548 ?auto_423551 ) ) ( not ( = ?auto_423548 ?auto_423552 ) ) ( not ( = ?auto_423549 ?auto_423550 ) ) ( not ( = ?auto_423549 ?auto_423551 ) ) ( not ( = ?auto_423549 ?auto_423552 ) ) ( not ( = ?auto_423550 ?auto_423551 ) ) ( not ( = ?auto_423550 ?auto_423552 ) ) ( not ( = ?auto_423551 ?auto_423552 ) ) ( ON ?auto_423550 ?auto_423551 ) ( ON ?auto_423549 ?auto_423550 ) ( CLEAR ?auto_423547 ) ( ON ?auto_423548 ?auto_423549 ) ( CLEAR ?auto_423548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_423546 ?auto_423547 ?auto_423548 )
      ( MAKE-6PILE ?auto_423546 ?auto_423547 ?auto_423548 ?auto_423549 ?auto_423550 ?auto_423551 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_423559 - BLOCK
      ?auto_423560 - BLOCK
      ?auto_423561 - BLOCK
      ?auto_423562 - BLOCK
      ?auto_423563 - BLOCK
      ?auto_423564 - BLOCK
    )
    :vars
    (
      ?auto_423565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423564 ?auto_423565 ) ( ON-TABLE ?auto_423559 ) ( ON ?auto_423560 ?auto_423559 ) ( not ( = ?auto_423559 ?auto_423560 ) ) ( not ( = ?auto_423559 ?auto_423561 ) ) ( not ( = ?auto_423559 ?auto_423562 ) ) ( not ( = ?auto_423559 ?auto_423563 ) ) ( not ( = ?auto_423559 ?auto_423564 ) ) ( not ( = ?auto_423559 ?auto_423565 ) ) ( not ( = ?auto_423560 ?auto_423561 ) ) ( not ( = ?auto_423560 ?auto_423562 ) ) ( not ( = ?auto_423560 ?auto_423563 ) ) ( not ( = ?auto_423560 ?auto_423564 ) ) ( not ( = ?auto_423560 ?auto_423565 ) ) ( not ( = ?auto_423561 ?auto_423562 ) ) ( not ( = ?auto_423561 ?auto_423563 ) ) ( not ( = ?auto_423561 ?auto_423564 ) ) ( not ( = ?auto_423561 ?auto_423565 ) ) ( not ( = ?auto_423562 ?auto_423563 ) ) ( not ( = ?auto_423562 ?auto_423564 ) ) ( not ( = ?auto_423562 ?auto_423565 ) ) ( not ( = ?auto_423563 ?auto_423564 ) ) ( not ( = ?auto_423563 ?auto_423565 ) ) ( not ( = ?auto_423564 ?auto_423565 ) ) ( ON ?auto_423563 ?auto_423564 ) ( ON ?auto_423562 ?auto_423563 ) ( CLEAR ?auto_423560 ) ( ON ?auto_423561 ?auto_423562 ) ( CLEAR ?auto_423561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_423559 ?auto_423560 ?auto_423561 )
      ( MAKE-6PILE ?auto_423559 ?auto_423560 ?auto_423561 ?auto_423562 ?auto_423563 ?auto_423564 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_423572 - BLOCK
      ?auto_423573 - BLOCK
      ?auto_423574 - BLOCK
      ?auto_423575 - BLOCK
      ?auto_423576 - BLOCK
      ?auto_423577 - BLOCK
    )
    :vars
    (
      ?auto_423578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423577 ?auto_423578 ) ( ON-TABLE ?auto_423572 ) ( not ( = ?auto_423572 ?auto_423573 ) ) ( not ( = ?auto_423572 ?auto_423574 ) ) ( not ( = ?auto_423572 ?auto_423575 ) ) ( not ( = ?auto_423572 ?auto_423576 ) ) ( not ( = ?auto_423572 ?auto_423577 ) ) ( not ( = ?auto_423572 ?auto_423578 ) ) ( not ( = ?auto_423573 ?auto_423574 ) ) ( not ( = ?auto_423573 ?auto_423575 ) ) ( not ( = ?auto_423573 ?auto_423576 ) ) ( not ( = ?auto_423573 ?auto_423577 ) ) ( not ( = ?auto_423573 ?auto_423578 ) ) ( not ( = ?auto_423574 ?auto_423575 ) ) ( not ( = ?auto_423574 ?auto_423576 ) ) ( not ( = ?auto_423574 ?auto_423577 ) ) ( not ( = ?auto_423574 ?auto_423578 ) ) ( not ( = ?auto_423575 ?auto_423576 ) ) ( not ( = ?auto_423575 ?auto_423577 ) ) ( not ( = ?auto_423575 ?auto_423578 ) ) ( not ( = ?auto_423576 ?auto_423577 ) ) ( not ( = ?auto_423576 ?auto_423578 ) ) ( not ( = ?auto_423577 ?auto_423578 ) ) ( ON ?auto_423576 ?auto_423577 ) ( ON ?auto_423575 ?auto_423576 ) ( ON ?auto_423574 ?auto_423575 ) ( CLEAR ?auto_423572 ) ( ON ?auto_423573 ?auto_423574 ) ( CLEAR ?auto_423573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_423572 ?auto_423573 )
      ( MAKE-6PILE ?auto_423572 ?auto_423573 ?auto_423574 ?auto_423575 ?auto_423576 ?auto_423577 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_423585 - BLOCK
      ?auto_423586 - BLOCK
      ?auto_423587 - BLOCK
      ?auto_423588 - BLOCK
      ?auto_423589 - BLOCK
      ?auto_423590 - BLOCK
    )
    :vars
    (
      ?auto_423591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423590 ?auto_423591 ) ( ON-TABLE ?auto_423585 ) ( not ( = ?auto_423585 ?auto_423586 ) ) ( not ( = ?auto_423585 ?auto_423587 ) ) ( not ( = ?auto_423585 ?auto_423588 ) ) ( not ( = ?auto_423585 ?auto_423589 ) ) ( not ( = ?auto_423585 ?auto_423590 ) ) ( not ( = ?auto_423585 ?auto_423591 ) ) ( not ( = ?auto_423586 ?auto_423587 ) ) ( not ( = ?auto_423586 ?auto_423588 ) ) ( not ( = ?auto_423586 ?auto_423589 ) ) ( not ( = ?auto_423586 ?auto_423590 ) ) ( not ( = ?auto_423586 ?auto_423591 ) ) ( not ( = ?auto_423587 ?auto_423588 ) ) ( not ( = ?auto_423587 ?auto_423589 ) ) ( not ( = ?auto_423587 ?auto_423590 ) ) ( not ( = ?auto_423587 ?auto_423591 ) ) ( not ( = ?auto_423588 ?auto_423589 ) ) ( not ( = ?auto_423588 ?auto_423590 ) ) ( not ( = ?auto_423588 ?auto_423591 ) ) ( not ( = ?auto_423589 ?auto_423590 ) ) ( not ( = ?auto_423589 ?auto_423591 ) ) ( not ( = ?auto_423590 ?auto_423591 ) ) ( ON ?auto_423589 ?auto_423590 ) ( ON ?auto_423588 ?auto_423589 ) ( ON ?auto_423587 ?auto_423588 ) ( CLEAR ?auto_423585 ) ( ON ?auto_423586 ?auto_423587 ) ( CLEAR ?auto_423586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_423585 ?auto_423586 )
      ( MAKE-6PILE ?auto_423585 ?auto_423586 ?auto_423587 ?auto_423588 ?auto_423589 ?auto_423590 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_423598 - BLOCK
      ?auto_423599 - BLOCK
      ?auto_423600 - BLOCK
      ?auto_423601 - BLOCK
      ?auto_423602 - BLOCK
      ?auto_423603 - BLOCK
    )
    :vars
    (
      ?auto_423604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423603 ?auto_423604 ) ( not ( = ?auto_423598 ?auto_423599 ) ) ( not ( = ?auto_423598 ?auto_423600 ) ) ( not ( = ?auto_423598 ?auto_423601 ) ) ( not ( = ?auto_423598 ?auto_423602 ) ) ( not ( = ?auto_423598 ?auto_423603 ) ) ( not ( = ?auto_423598 ?auto_423604 ) ) ( not ( = ?auto_423599 ?auto_423600 ) ) ( not ( = ?auto_423599 ?auto_423601 ) ) ( not ( = ?auto_423599 ?auto_423602 ) ) ( not ( = ?auto_423599 ?auto_423603 ) ) ( not ( = ?auto_423599 ?auto_423604 ) ) ( not ( = ?auto_423600 ?auto_423601 ) ) ( not ( = ?auto_423600 ?auto_423602 ) ) ( not ( = ?auto_423600 ?auto_423603 ) ) ( not ( = ?auto_423600 ?auto_423604 ) ) ( not ( = ?auto_423601 ?auto_423602 ) ) ( not ( = ?auto_423601 ?auto_423603 ) ) ( not ( = ?auto_423601 ?auto_423604 ) ) ( not ( = ?auto_423602 ?auto_423603 ) ) ( not ( = ?auto_423602 ?auto_423604 ) ) ( not ( = ?auto_423603 ?auto_423604 ) ) ( ON ?auto_423602 ?auto_423603 ) ( ON ?auto_423601 ?auto_423602 ) ( ON ?auto_423600 ?auto_423601 ) ( ON ?auto_423599 ?auto_423600 ) ( ON ?auto_423598 ?auto_423599 ) ( CLEAR ?auto_423598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_423598 )
      ( MAKE-6PILE ?auto_423598 ?auto_423599 ?auto_423600 ?auto_423601 ?auto_423602 ?auto_423603 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_423611 - BLOCK
      ?auto_423612 - BLOCK
      ?auto_423613 - BLOCK
      ?auto_423614 - BLOCK
      ?auto_423615 - BLOCK
      ?auto_423616 - BLOCK
    )
    :vars
    (
      ?auto_423617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423616 ?auto_423617 ) ( not ( = ?auto_423611 ?auto_423612 ) ) ( not ( = ?auto_423611 ?auto_423613 ) ) ( not ( = ?auto_423611 ?auto_423614 ) ) ( not ( = ?auto_423611 ?auto_423615 ) ) ( not ( = ?auto_423611 ?auto_423616 ) ) ( not ( = ?auto_423611 ?auto_423617 ) ) ( not ( = ?auto_423612 ?auto_423613 ) ) ( not ( = ?auto_423612 ?auto_423614 ) ) ( not ( = ?auto_423612 ?auto_423615 ) ) ( not ( = ?auto_423612 ?auto_423616 ) ) ( not ( = ?auto_423612 ?auto_423617 ) ) ( not ( = ?auto_423613 ?auto_423614 ) ) ( not ( = ?auto_423613 ?auto_423615 ) ) ( not ( = ?auto_423613 ?auto_423616 ) ) ( not ( = ?auto_423613 ?auto_423617 ) ) ( not ( = ?auto_423614 ?auto_423615 ) ) ( not ( = ?auto_423614 ?auto_423616 ) ) ( not ( = ?auto_423614 ?auto_423617 ) ) ( not ( = ?auto_423615 ?auto_423616 ) ) ( not ( = ?auto_423615 ?auto_423617 ) ) ( not ( = ?auto_423616 ?auto_423617 ) ) ( ON ?auto_423615 ?auto_423616 ) ( ON ?auto_423614 ?auto_423615 ) ( ON ?auto_423613 ?auto_423614 ) ( ON ?auto_423612 ?auto_423613 ) ( ON ?auto_423611 ?auto_423612 ) ( CLEAR ?auto_423611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_423611 )
      ( MAKE-6PILE ?auto_423611 ?auto_423612 ?auto_423613 ?auto_423614 ?auto_423615 ?auto_423616 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_423625 - BLOCK
      ?auto_423626 - BLOCK
      ?auto_423627 - BLOCK
      ?auto_423628 - BLOCK
      ?auto_423629 - BLOCK
      ?auto_423630 - BLOCK
      ?auto_423631 - BLOCK
    )
    :vars
    (
      ?auto_423632 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_423630 ) ( ON ?auto_423631 ?auto_423632 ) ( CLEAR ?auto_423631 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_423625 ) ( ON ?auto_423626 ?auto_423625 ) ( ON ?auto_423627 ?auto_423626 ) ( ON ?auto_423628 ?auto_423627 ) ( ON ?auto_423629 ?auto_423628 ) ( ON ?auto_423630 ?auto_423629 ) ( not ( = ?auto_423625 ?auto_423626 ) ) ( not ( = ?auto_423625 ?auto_423627 ) ) ( not ( = ?auto_423625 ?auto_423628 ) ) ( not ( = ?auto_423625 ?auto_423629 ) ) ( not ( = ?auto_423625 ?auto_423630 ) ) ( not ( = ?auto_423625 ?auto_423631 ) ) ( not ( = ?auto_423625 ?auto_423632 ) ) ( not ( = ?auto_423626 ?auto_423627 ) ) ( not ( = ?auto_423626 ?auto_423628 ) ) ( not ( = ?auto_423626 ?auto_423629 ) ) ( not ( = ?auto_423626 ?auto_423630 ) ) ( not ( = ?auto_423626 ?auto_423631 ) ) ( not ( = ?auto_423626 ?auto_423632 ) ) ( not ( = ?auto_423627 ?auto_423628 ) ) ( not ( = ?auto_423627 ?auto_423629 ) ) ( not ( = ?auto_423627 ?auto_423630 ) ) ( not ( = ?auto_423627 ?auto_423631 ) ) ( not ( = ?auto_423627 ?auto_423632 ) ) ( not ( = ?auto_423628 ?auto_423629 ) ) ( not ( = ?auto_423628 ?auto_423630 ) ) ( not ( = ?auto_423628 ?auto_423631 ) ) ( not ( = ?auto_423628 ?auto_423632 ) ) ( not ( = ?auto_423629 ?auto_423630 ) ) ( not ( = ?auto_423629 ?auto_423631 ) ) ( not ( = ?auto_423629 ?auto_423632 ) ) ( not ( = ?auto_423630 ?auto_423631 ) ) ( not ( = ?auto_423630 ?auto_423632 ) ) ( not ( = ?auto_423631 ?auto_423632 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_423631 ?auto_423632 )
      ( !STACK ?auto_423631 ?auto_423630 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_423640 - BLOCK
      ?auto_423641 - BLOCK
      ?auto_423642 - BLOCK
      ?auto_423643 - BLOCK
      ?auto_423644 - BLOCK
      ?auto_423645 - BLOCK
      ?auto_423646 - BLOCK
    )
    :vars
    (
      ?auto_423647 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_423645 ) ( ON ?auto_423646 ?auto_423647 ) ( CLEAR ?auto_423646 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_423640 ) ( ON ?auto_423641 ?auto_423640 ) ( ON ?auto_423642 ?auto_423641 ) ( ON ?auto_423643 ?auto_423642 ) ( ON ?auto_423644 ?auto_423643 ) ( ON ?auto_423645 ?auto_423644 ) ( not ( = ?auto_423640 ?auto_423641 ) ) ( not ( = ?auto_423640 ?auto_423642 ) ) ( not ( = ?auto_423640 ?auto_423643 ) ) ( not ( = ?auto_423640 ?auto_423644 ) ) ( not ( = ?auto_423640 ?auto_423645 ) ) ( not ( = ?auto_423640 ?auto_423646 ) ) ( not ( = ?auto_423640 ?auto_423647 ) ) ( not ( = ?auto_423641 ?auto_423642 ) ) ( not ( = ?auto_423641 ?auto_423643 ) ) ( not ( = ?auto_423641 ?auto_423644 ) ) ( not ( = ?auto_423641 ?auto_423645 ) ) ( not ( = ?auto_423641 ?auto_423646 ) ) ( not ( = ?auto_423641 ?auto_423647 ) ) ( not ( = ?auto_423642 ?auto_423643 ) ) ( not ( = ?auto_423642 ?auto_423644 ) ) ( not ( = ?auto_423642 ?auto_423645 ) ) ( not ( = ?auto_423642 ?auto_423646 ) ) ( not ( = ?auto_423642 ?auto_423647 ) ) ( not ( = ?auto_423643 ?auto_423644 ) ) ( not ( = ?auto_423643 ?auto_423645 ) ) ( not ( = ?auto_423643 ?auto_423646 ) ) ( not ( = ?auto_423643 ?auto_423647 ) ) ( not ( = ?auto_423644 ?auto_423645 ) ) ( not ( = ?auto_423644 ?auto_423646 ) ) ( not ( = ?auto_423644 ?auto_423647 ) ) ( not ( = ?auto_423645 ?auto_423646 ) ) ( not ( = ?auto_423645 ?auto_423647 ) ) ( not ( = ?auto_423646 ?auto_423647 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_423646 ?auto_423647 )
      ( !STACK ?auto_423646 ?auto_423645 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_423655 - BLOCK
      ?auto_423656 - BLOCK
      ?auto_423657 - BLOCK
      ?auto_423658 - BLOCK
      ?auto_423659 - BLOCK
      ?auto_423660 - BLOCK
      ?auto_423661 - BLOCK
    )
    :vars
    (
      ?auto_423662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423661 ?auto_423662 ) ( ON-TABLE ?auto_423655 ) ( ON ?auto_423656 ?auto_423655 ) ( ON ?auto_423657 ?auto_423656 ) ( ON ?auto_423658 ?auto_423657 ) ( ON ?auto_423659 ?auto_423658 ) ( not ( = ?auto_423655 ?auto_423656 ) ) ( not ( = ?auto_423655 ?auto_423657 ) ) ( not ( = ?auto_423655 ?auto_423658 ) ) ( not ( = ?auto_423655 ?auto_423659 ) ) ( not ( = ?auto_423655 ?auto_423660 ) ) ( not ( = ?auto_423655 ?auto_423661 ) ) ( not ( = ?auto_423655 ?auto_423662 ) ) ( not ( = ?auto_423656 ?auto_423657 ) ) ( not ( = ?auto_423656 ?auto_423658 ) ) ( not ( = ?auto_423656 ?auto_423659 ) ) ( not ( = ?auto_423656 ?auto_423660 ) ) ( not ( = ?auto_423656 ?auto_423661 ) ) ( not ( = ?auto_423656 ?auto_423662 ) ) ( not ( = ?auto_423657 ?auto_423658 ) ) ( not ( = ?auto_423657 ?auto_423659 ) ) ( not ( = ?auto_423657 ?auto_423660 ) ) ( not ( = ?auto_423657 ?auto_423661 ) ) ( not ( = ?auto_423657 ?auto_423662 ) ) ( not ( = ?auto_423658 ?auto_423659 ) ) ( not ( = ?auto_423658 ?auto_423660 ) ) ( not ( = ?auto_423658 ?auto_423661 ) ) ( not ( = ?auto_423658 ?auto_423662 ) ) ( not ( = ?auto_423659 ?auto_423660 ) ) ( not ( = ?auto_423659 ?auto_423661 ) ) ( not ( = ?auto_423659 ?auto_423662 ) ) ( not ( = ?auto_423660 ?auto_423661 ) ) ( not ( = ?auto_423660 ?auto_423662 ) ) ( not ( = ?auto_423661 ?auto_423662 ) ) ( CLEAR ?auto_423659 ) ( ON ?auto_423660 ?auto_423661 ) ( CLEAR ?auto_423660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_423655 ?auto_423656 ?auto_423657 ?auto_423658 ?auto_423659 ?auto_423660 )
      ( MAKE-7PILE ?auto_423655 ?auto_423656 ?auto_423657 ?auto_423658 ?auto_423659 ?auto_423660 ?auto_423661 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_423670 - BLOCK
      ?auto_423671 - BLOCK
      ?auto_423672 - BLOCK
      ?auto_423673 - BLOCK
      ?auto_423674 - BLOCK
      ?auto_423675 - BLOCK
      ?auto_423676 - BLOCK
    )
    :vars
    (
      ?auto_423677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423676 ?auto_423677 ) ( ON-TABLE ?auto_423670 ) ( ON ?auto_423671 ?auto_423670 ) ( ON ?auto_423672 ?auto_423671 ) ( ON ?auto_423673 ?auto_423672 ) ( ON ?auto_423674 ?auto_423673 ) ( not ( = ?auto_423670 ?auto_423671 ) ) ( not ( = ?auto_423670 ?auto_423672 ) ) ( not ( = ?auto_423670 ?auto_423673 ) ) ( not ( = ?auto_423670 ?auto_423674 ) ) ( not ( = ?auto_423670 ?auto_423675 ) ) ( not ( = ?auto_423670 ?auto_423676 ) ) ( not ( = ?auto_423670 ?auto_423677 ) ) ( not ( = ?auto_423671 ?auto_423672 ) ) ( not ( = ?auto_423671 ?auto_423673 ) ) ( not ( = ?auto_423671 ?auto_423674 ) ) ( not ( = ?auto_423671 ?auto_423675 ) ) ( not ( = ?auto_423671 ?auto_423676 ) ) ( not ( = ?auto_423671 ?auto_423677 ) ) ( not ( = ?auto_423672 ?auto_423673 ) ) ( not ( = ?auto_423672 ?auto_423674 ) ) ( not ( = ?auto_423672 ?auto_423675 ) ) ( not ( = ?auto_423672 ?auto_423676 ) ) ( not ( = ?auto_423672 ?auto_423677 ) ) ( not ( = ?auto_423673 ?auto_423674 ) ) ( not ( = ?auto_423673 ?auto_423675 ) ) ( not ( = ?auto_423673 ?auto_423676 ) ) ( not ( = ?auto_423673 ?auto_423677 ) ) ( not ( = ?auto_423674 ?auto_423675 ) ) ( not ( = ?auto_423674 ?auto_423676 ) ) ( not ( = ?auto_423674 ?auto_423677 ) ) ( not ( = ?auto_423675 ?auto_423676 ) ) ( not ( = ?auto_423675 ?auto_423677 ) ) ( not ( = ?auto_423676 ?auto_423677 ) ) ( CLEAR ?auto_423674 ) ( ON ?auto_423675 ?auto_423676 ) ( CLEAR ?auto_423675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_423670 ?auto_423671 ?auto_423672 ?auto_423673 ?auto_423674 ?auto_423675 )
      ( MAKE-7PILE ?auto_423670 ?auto_423671 ?auto_423672 ?auto_423673 ?auto_423674 ?auto_423675 ?auto_423676 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_423685 - BLOCK
      ?auto_423686 - BLOCK
      ?auto_423687 - BLOCK
      ?auto_423688 - BLOCK
      ?auto_423689 - BLOCK
      ?auto_423690 - BLOCK
      ?auto_423691 - BLOCK
    )
    :vars
    (
      ?auto_423692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423691 ?auto_423692 ) ( ON-TABLE ?auto_423685 ) ( ON ?auto_423686 ?auto_423685 ) ( ON ?auto_423687 ?auto_423686 ) ( ON ?auto_423688 ?auto_423687 ) ( not ( = ?auto_423685 ?auto_423686 ) ) ( not ( = ?auto_423685 ?auto_423687 ) ) ( not ( = ?auto_423685 ?auto_423688 ) ) ( not ( = ?auto_423685 ?auto_423689 ) ) ( not ( = ?auto_423685 ?auto_423690 ) ) ( not ( = ?auto_423685 ?auto_423691 ) ) ( not ( = ?auto_423685 ?auto_423692 ) ) ( not ( = ?auto_423686 ?auto_423687 ) ) ( not ( = ?auto_423686 ?auto_423688 ) ) ( not ( = ?auto_423686 ?auto_423689 ) ) ( not ( = ?auto_423686 ?auto_423690 ) ) ( not ( = ?auto_423686 ?auto_423691 ) ) ( not ( = ?auto_423686 ?auto_423692 ) ) ( not ( = ?auto_423687 ?auto_423688 ) ) ( not ( = ?auto_423687 ?auto_423689 ) ) ( not ( = ?auto_423687 ?auto_423690 ) ) ( not ( = ?auto_423687 ?auto_423691 ) ) ( not ( = ?auto_423687 ?auto_423692 ) ) ( not ( = ?auto_423688 ?auto_423689 ) ) ( not ( = ?auto_423688 ?auto_423690 ) ) ( not ( = ?auto_423688 ?auto_423691 ) ) ( not ( = ?auto_423688 ?auto_423692 ) ) ( not ( = ?auto_423689 ?auto_423690 ) ) ( not ( = ?auto_423689 ?auto_423691 ) ) ( not ( = ?auto_423689 ?auto_423692 ) ) ( not ( = ?auto_423690 ?auto_423691 ) ) ( not ( = ?auto_423690 ?auto_423692 ) ) ( not ( = ?auto_423691 ?auto_423692 ) ) ( ON ?auto_423690 ?auto_423691 ) ( CLEAR ?auto_423688 ) ( ON ?auto_423689 ?auto_423690 ) ( CLEAR ?auto_423689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_423685 ?auto_423686 ?auto_423687 ?auto_423688 ?auto_423689 )
      ( MAKE-7PILE ?auto_423685 ?auto_423686 ?auto_423687 ?auto_423688 ?auto_423689 ?auto_423690 ?auto_423691 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_423700 - BLOCK
      ?auto_423701 - BLOCK
      ?auto_423702 - BLOCK
      ?auto_423703 - BLOCK
      ?auto_423704 - BLOCK
      ?auto_423705 - BLOCK
      ?auto_423706 - BLOCK
    )
    :vars
    (
      ?auto_423707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423706 ?auto_423707 ) ( ON-TABLE ?auto_423700 ) ( ON ?auto_423701 ?auto_423700 ) ( ON ?auto_423702 ?auto_423701 ) ( ON ?auto_423703 ?auto_423702 ) ( not ( = ?auto_423700 ?auto_423701 ) ) ( not ( = ?auto_423700 ?auto_423702 ) ) ( not ( = ?auto_423700 ?auto_423703 ) ) ( not ( = ?auto_423700 ?auto_423704 ) ) ( not ( = ?auto_423700 ?auto_423705 ) ) ( not ( = ?auto_423700 ?auto_423706 ) ) ( not ( = ?auto_423700 ?auto_423707 ) ) ( not ( = ?auto_423701 ?auto_423702 ) ) ( not ( = ?auto_423701 ?auto_423703 ) ) ( not ( = ?auto_423701 ?auto_423704 ) ) ( not ( = ?auto_423701 ?auto_423705 ) ) ( not ( = ?auto_423701 ?auto_423706 ) ) ( not ( = ?auto_423701 ?auto_423707 ) ) ( not ( = ?auto_423702 ?auto_423703 ) ) ( not ( = ?auto_423702 ?auto_423704 ) ) ( not ( = ?auto_423702 ?auto_423705 ) ) ( not ( = ?auto_423702 ?auto_423706 ) ) ( not ( = ?auto_423702 ?auto_423707 ) ) ( not ( = ?auto_423703 ?auto_423704 ) ) ( not ( = ?auto_423703 ?auto_423705 ) ) ( not ( = ?auto_423703 ?auto_423706 ) ) ( not ( = ?auto_423703 ?auto_423707 ) ) ( not ( = ?auto_423704 ?auto_423705 ) ) ( not ( = ?auto_423704 ?auto_423706 ) ) ( not ( = ?auto_423704 ?auto_423707 ) ) ( not ( = ?auto_423705 ?auto_423706 ) ) ( not ( = ?auto_423705 ?auto_423707 ) ) ( not ( = ?auto_423706 ?auto_423707 ) ) ( ON ?auto_423705 ?auto_423706 ) ( CLEAR ?auto_423703 ) ( ON ?auto_423704 ?auto_423705 ) ( CLEAR ?auto_423704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_423700 ?auto_423701 ?auto_423702 ?auto_423703 ?auto_423704 )
      ( MAKE-7PILE ?auto_423700 ?auto_423701 ?auto_423702 ?auto_423703 ?auto_423704 ?auto_423705 ?auto_423706 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_423715 - BLOCK
      ?auto_423716 - BLOCK
      ?auto_423717 - BLOCK
      ?auto_423718 - BLOCK
      ?auto_423719 - BLOCK
      ?auto_423720 - BLOCK
      ?auto_423721 - BLOCK
    )
    :vars
    (
      ?auto_423722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423721 ?auto_423722 ) ( ON-TABLE ?auto_423715 ) ( ON ?auto_423716 ?auto_423715 ) ( ON ?auto_423717 ?auto_423716 ) ( not ( = ?auto_423715 ?auto_423716 ) ) ( not ( = ?auto_423715 ?auto_423717 ) ) ( not ( = ?auto_423715 ?auto_423718 ) ) ( not ( = ?auto_423715 ?auto_423719 ) ) ( not ( = ?auto_423715 ?auto_423720 ) ) ( not ( = ?auto_423715 ?auto_423721 ) ) ( not ( = ?auto_423715 ?auto_423722 ) ) ( not ( = ?auto_423716 ?auto_423717 ) ) ( not ( = ?auto_423716 ?auto_423718 ) ) ( not ( = ?auto_423716 ?auto_423719 ) ) ( not ( = ?auto_423716 ?auto_423720 ) ) ( not ( = ?auto_423716 ?auto_423721 ) ) ( not ( = ?auto_423716 ?auto_423722 ) ) ( not ( = ?auto_423717 ?auto_423718 ) ) ( not ( = ?auto_423717 ?auto_423719 ) ) ( not ( = ?auto_423717 ?auto_423720 ) ) ( not ( = ?auto_423717 ?auto_423721 ) ) ( not ( = ?auto_423717 ?auto_423722 ) ) ( not ( = ?auto_423718 ?auto_423719 ) ) ( not ( = ?auto_423718 ?auto_423720 ) ) ( not ( = ?auto_423718 ?auto_423721 ) ) ( not ( = ?auto_423718 ?auto_423722 ) ) ( not ( = ?auto_423719 ?auto_423720 ) ) ( not ( = ?auto_423719 ?auto_423721 ) ) ( not ( = ?auto_423719 ?auto_423722 ) ) ( not ( = ?auto_423720 ?auto_423721 ) ) ( not ( = ?auto_423720 ?auto_423722 ) ) ( not ( = ?auto_423721 ?auto_423722 ) ) ( ON ?auto_423720 ?auto_423721 ) ( ON ?auto_423719 ?auto_423720 ) ( CLEAR ?auto_423717 ) ( ON ?auto_423718 ?auto_423719 ) ( CLEAR ?auto_423718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_423715 ?auto_423716 ?auto_423717 ?auto_423718 )
      ( MAKE-7PILE ?auto_423715 ?auto_423716 ?auto_423717 ?auto_423718 ?auto_423719 ?auto_423720 ?auto_423721 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_423730 - BLOCK
      ?auto_423731 - BLOCK
      ?auto_423732 - BLOCK
      ?auto_423733 - BLOCK
      ?auto_423734 - BLOCK
      ?auto_423735 - BLOCK
      ?auto_423736 - BLOCK
    )
    :vars
    (
      ?auto_423737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423736 ?auto_423737 ) ( ON-TABLE ?auto_423730 ) ( ON ?auto_423731 ?auto_423730 ) ( ON ?auto_423732 ?auto_423731 ) ( not ( = ?auto_423730 ?auto_423731 ) ) ( not ( = ?auto_423730 ?auto_423732 ) ) ( not ( = ?auto_423730 ?auto_423733 ) ) ( not ( = ?auto_423730 ?auto_423734 ) ) ( not ( = ?auto_423730 ?auto_423735 ) ) ( not ( = ?auto_423730 ?auto_423736 ) ) ( not ( = ?auto_423730 ?auto_423737 ) ) ( not ( = ?auto_423731 ?auto_423732 ) ) ( not ( = ?auto_423731 ?auto_423733 ) ) ( not ( = ?auto_423731 ?auto_423734 ) ) ( not ( = ?auto_423731 ?auto_423735 ) ) ( not ( = ?auto_423731 ?auto_423736 ) ) ( not ( = ?auto_423731 ?auto_423737 ) ) ( not ( = ?auto_423732 ?auto_423733 ) ) ( not ( = ?auto_423732 ?auto_423734 ) ) ( not ( = ?auto_423732 ?auto_423735 ) ) ( not ( = ?auto_423732 ?auto_423736 ) ) ( not ( = ?auto_423732 ?auto_423737 ) ) ( not ( = ?auto_423733 ?auto_423734 ) ) ( not ( = ?auto_423733 ?auto_423735 ) ) ( not ( = ?auto_423733 ?auto_423736 ) ) ( not ( = ?auto_423733 ?auto_423737 ) ) ( not ( = ?auto_423734 ?auto_423735 ) ) ( not ( = ?auto_423734 ?auto_423736 ) ) ( not ( = ?auto_423734 ?auto_423737 ) ) ( not ( = ?auto_423735 ?auto_423736 ) ) ( not ( = ?auto_423735 ?auto_423737 ) ) ( not ( = ?auto_423736 ?auto_423737 ) ) ( ON ?auto_423735 ?auto_423736 ) ( ON ?auto_423734 ?auto_423735 ) ( CLEAR ?auto_423732 ) ( ON ?auto_423733 ?auto_423734 ) ( CLEAR ?auto_423733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_423730 ?auto_423731 ?auto_423732 ?auto_423733 )
      ( MAKE-7PILE ?auto_423730 ?auto_423731 ?auto_423732 ?auto_423733 ?auto_423734 ?auto_423735 ?auto_423736 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_423745 - BLOCK
      ?auto_423746 - BLOCK
      ?auto_423747 - BLOCK
      ?auto_423748 - BLOCK
      ?auto_423749 - BLOCK
      ?auto_423750 - BLOCK
      ?auto_423751 - BLOCK
    )
    :vars
    (
      ?auto_423752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423751 ?auto_423752 ) ( ON-TABLE ?auto_423745 ) ( ON ?auto_423746 ?auto_423745 ) ( not ( = ?auto_423745 ?auto_423746 ) ) ( not ( = ?auto_423745 ?auto_423747 ) ) ( not ( = ?auto_423745 ?auto_423748 ) ) ( not ( = ?auto_423745 ?auto_423749 ) ) ( not ( = ?auto_423745 ?auto_423750 ) ) ( not ( = ?auto_423745 ?auto_423751 ) ) ( not ( = ?auto_423745 ?auto_423752 ) ) ( not ( = ?auto_423746 ?auto_423747 ) ) ( not ( = ?auto_423746 ?auto_423748 ) ) ( not ( = ?auto_423746 ?auto_423749 ) ) ( not ( = ?auto_423746 ?auto_423750 ) ) ( not ( = ?auto_423746 ?auto_423751 ) ) ( not ( = ?auto_423746 ?auto_423752 ) ) ( not ( = ?auto_423747 ?auto_423748 ) ) ( not ( = ?auto_423747 ?auto_423749 ) ) ( not ( = ?auto_423747 ?auto_423750 ) ) ( not ( = ?auto_423747 ?auto_423751 ) ) ( not ( = ?auto_423747 ?auto_423752 ) ) ( not ( = ?auto_423748 ?auto_423749 ) ) ( not ( = ?auto_423748 ?auto_423750 ) ) ( not ( = ?auto_423748 ?auto_423751 ) ) ( not ( = ?auto_423748 ?auto_423752 ) ) ( not ( = ?auto_423749 ?auto_423750 ) ) ( not ( = ?auto_423749 ?auto_423751 ) ) ( not ( = ?auto_423749 ?auto_423752 ) ) ( not ( = ?auto_423750 ?auto_423751 ) ) ( not ( = ?auto_423750 ?auto_423752 ) ) ( not ( = ?auto_423751 ?auto_423752 ) ) ( ON ?auto_423750 ?auto_423751 ) ( ON ?auto_423749 ?auto_423750 ) ( ON ?auto_423748 ?auto_423749 ) ( CLEAR ?auto_423746 ) ( ON ?auto_423747 ?auto_423748 ) ( CLEAR ?auto_423747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_423745 ?auto_423746 ?auto_423747 )
      ( MAKE-7PILE ?auto_423745 ?auto_423746 ?auto_423747 ?auto_423748 ?auto_423749 ?auto_423750 ?auto_423751 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_423760 - BLOCK
      ?auto_423761 - BLOCK
      ?auto_423762 - BLOCK
      ?auto_423763 - BLOCK
      ?auto_423764 - BLOCK
      ?auto_423765 - BLOCK
      ?auto_423766 - BLOCK
    )
    :vars
    (
      ?auto_423767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423766 ?auto_423767 ) ( ON-TABLE ?auto_423760 ) ( ON ?auto_423761 ?auto_423760 ) ( not ( = ?auto_423760 ?auto_423761 ) ) ( not ( = ?auto_423760 ?auto_423762 ) ) ( not ( = ?auto_423760 ?auto_423763 ) ) ( not ( = ?auto_423760 ?auto_423764 ) ) ( not ( = ?auto_423760 ?auto_423765 ) ) ( not ( = ?auto_423760 ?auto_423766 ) ) ( not ( = ?auto_423760 ?auto_423767 ) ) ( not ( = ?auto_423761 ?auto_423762 ) ) ( not ( = ?auto_423761 ?auto_423763 ) ) ( not ( = ?auto_423761 ?auto_423764 ) ) ( not ( = ?auto_423761 ?auto_423765 ) ) ( not ( = ?auto_423761 ?auto_423766 ) ) ( not ( = ?auto_423761 ?auto_423767 ) ) ( not ( = ?auto_423762 ?auto_423763 ) ) ( not ( = ?auto_423762 ?auto_423764 ) ) ( not ( = ?auto_423762 ?auto_423765 ) ) ( not ( = ?auto_423762 ?auto_423766 ) ) ( not ( = ?auto_423762 ?auto_423767 ) ) ( not ( = ?auto_423763 ?auto_423764 ) ) ( not ( = ?auto_423763 ?auto_423765 ) ) ( not ( = ?auto_423763 ?auto_423766 ) ) ( not ( = ?auto_423763 ?auto_423767 ) ) ( not ( = ?auto_423764 ?auto_423765 ) ) ( not ( = ?auto_423764 ?auto_423766 ) ) ( not ( = ?auto_423764 ?auto_423767 ) ) ( not ( = ?auto_423765 ?auto_423766 ) ) ( not ( = ?auto_423765 ?auto_423767 ) ) ( not ( = ?auto_423766 ?auto_423767 ) ) ( ON ?auto_423765 ?auto_423766 ) ( ON ?auto_423764 ?auto_423765 ) ( ON ?auto_423763 ?auto_423764 ) ( CLEAR ?auto_423761 ) ( ON ?auto_423762 ?auto_423763 ) ( CLEAR ?auto_423762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_423760 ?auto_423761 ?auto_423762 )
      ( MAKE-7PILE ?auto_423760 ?auto_423761 ?auto_423762 ?auto_423763 ?auto_423764 ?auto_423765 ?auto_423766 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_423775 - BLOCK
      ?auto_423776 - BLOCK
      ?auto_423777 - BLOCK
      ?auto_423778 - BLOCK
      ?auto_423779 - BLOCK
      ?auto_423780 - BLOCK
      ?auto_423781 - BLOCK
    )
    :vars
    (
      ?auto_423782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423781 ?auto_423782 ) ( ON-TABLE ?auto_423775 ) ( not ( = ?auto_423775 ?auto_423776 ) ) ( not ( = ?auto_423775 ?auto_423777 ) ) ( not ( = ?auto_423775 ?auto_423778 ) ) ( not ( = ?auto_423775 ?auto_423779 ) ) ( not ( = ?auto_423775 ?auto_423780 ) ) ( not ( = ?auto_423775 ?auto_423781 ) ) ( not ( = ?auto_423775 ?auto_423782 ) ) ( not ( = ?auto_423776 ?auto_423777 ) ) ( not ( = ?auto_423776 ?auto_423778 ) ) ( not ( = ?auto_423776 ?auto_423779 ) ) ( not ( = ?auto_423776 ?auto_423780 ) ) ( not ( = ?auto_423776 ?auto_423781 ) ) ( not ( = ?auto_423776 ?auto_423782 ) ) ( not ( = ?auto_423777 ?auto_423778 ) ) ( not ( = ?auto_423777 ?auto_423779 ) ) ( not ( = ?auto_423777 ?auto_423780 ) ) ( not ( = ?auto_423777 ?auto_423781 ) ) ( not ( = ?auto_423777 ?auto_423782 ) ) ( not ( = ?auto_423778 ?auto_423779 ) ) ( not ( = ?auto_423778 ?auto_423780 ) ) ( not ( = ?auto_423778 ?auto_423781 ) ) ( not ( = ?auto_423778 ?auto_423782 ) ) ( not ( = ?auto_423779 ?auto_423780 ) ) ( not ( = ?auto_423779 ?auto_423781 ) ) ( not ( = ?auto_423779 ?auto_423782 ) ) ( not ( = ?auto_423780 ?auto_423781 ) ) ( not ( = ?auto_423780 ?auto_423782 ) ) ( not ( = ?auto_423781 ?auto_423782 ) ) ( ON ?auto_423780 ?auto_423781 ) ( ON ?auto_423779 ?auto_423780 ) ( ON ?auto_423778 ?auto_423779 ) ( ON ?auto_423777 ?auto_423778 ) ( CLEAR ?auto_423775 ) ( ON ?auto_423776 ?auto_423777 ) ( CLEAR ?auto_423776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_423775 ?auto_423776 )
      ( MAKE-7PILE ?auto_423775 ?auto_423776 ?auto_423777 ?auto_423778 ?auto_423779 ?auto_423780 ?auto_423781 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_423790 - BLOCK
      ?auto_423791 - BLOCK
      ?auto_423792 - BLOCK
      ?auto_423793 - BLOCK
      ?auto_423794 - BLOCK
      ?auto_423795 - BLOCK
      ?auto_423796 - BLOCK
    )
    :vars
    (
      ?auto_423797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423796 ?auto_423797 ) ( ON-TABLE ?auto_423790 ) ( not ( = ?auto_423790 ?auto_423791 ) ) ( not ( = ?auto_423790 ?auto_423792 ) ) ( not ( = ?auto_423790 ?auto_423793 ) ) ( not ( = ?auto_423790 ?auto_423794 ) ) ( not ( = ?auto_423790 ?auto_423795 ) ) ( not ( = ?auto_423790 ?auto_423796 ) ) ( not ( = ?auto_423790 ?auto_423797 ) ) ( not ( = ?auto_423791 ?auto_423792 ) ) ( not ( = ?auto_423791 ?auto_423793 ) ) ( not ( = ?auto_423791 ?auto_423794 ) ) ( not ( = ?auto_423791 ?auto_423795 ) ) ( not ( = ?auto_423791 ?auto_423796 ) ) ( not ( = ?auto_423791 ?auto_423797 ) ) ( not ( = ?auto_423792 ?auto_423793 ) ) ( not ( = ?auto_423792 ?auto_423794 ) ) ( not ( = ?auto_423792 ?auto_423795 ) ) ( not ( = ?auto_423792 ?auto_423796 ) ) ( not ( = ?auto_423792 ?auto_423797 ) ) ( not ( = ?auto_423793 ?auto_423794 ) ) ( not ( = ?auto_423793 ?auto_423795 ) ) ( not ( = ?auto_423793 ?auto_423796 ) ) ( not ( = ?auto_423793 ?auto_423797 ) ) ( not ( = ?auto_423794 ?auto_423795 ) ) ( not ( = ?auto_423794 ?auto_423796 ) ) ( not ( = ?auto_423794 ?auto_423797 ) ) ( not ( = ?auto_423795 ?auto_423796 ) ) ( not ( = ?auto_423795 ?auto_423797 ) ) ( not ( = ?auto_423796 ?auto_423797 ) ) ( ON ?auto_423795 ?auto_423796 ) ( ON ?auto_423794 ?auto_423795 ) ( ON ?auto_423793 ?auto_423794 ) ( ON ?auto_423792 ?auto_423793 ) ( CLEAR ?auto_423790 ) ( ON ?auto_423791 ?auto_423792 ) ( CLEAR ?auto_423791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_423790 ?auto_423791 )
      ( MAKE-7PILE ?auto_423790 ?auto_423791 ?auto_423792 ?auto_423793 ?auto_423794 ?auto_423795 ?auto_423796 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_423805 - BLOCK
      ?auto_423806 - BLOCK
      ?auto_423807 - BLOCK
      ?auto_423808 - BLOCK
      ?auto_423809 - BLOCK
      ?auto_423810 - BLOCK
      ?auto_423811 - BLOCK
    )
    :vars
    (
      ?auto_423812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423811 ?auto_423812 ) ( not ( = ?auto_423805 ?auto_423806 ) ) ( not ( = ?auto_423805 ?auto_423807 ) ) ( not ( = ?auto_423805 ?auto_423808 ) ) ( not ( = ?auto_423805 ?auto_423809 ) ) ( not ( = ?auto_423805 ?auto_423810 ) ) ( not ( = ?auto_423805 ?auto_423811 ) ) ( not ( = ?auto_423805 ?auto_423812 ) ) ( not ( = ?auto_423806 ?auto_423807 ) ) ( not ( = ?auto_423806 ?auto_423808 ) ) ( not ( = ?auto_423806 ?auto_423809 ) ) ( not ( = ?auto_423806 ?auto_423810 ) ) ( not ( = ?auto_423806 ?auto_423811 ) ) ( not ( = ?auto_423806 ?auto_423812 ) ) ( not ( = ?auto_423807 ?auto_423808 ) ) ( not ( = ?auto_423807 ?auto_423809 ) ) ( not ( = ?auto_423807 ?auto_423810 ) ) ( not ( = ?auto_423807 ?auto_423811 ) ) ( not ( = ?auto_423807 ?auto_423812 ) ) ( not ( = ?auto_423808 ?auto_423809 ) ) ( not ( = ?auto_423808 ?auto_423810 ) ) ( not ( = ?auto_423808 ?auto_423811 ) ) ( not ( = ?auto_423808 ?auto_423812 ) ) ( not ( = ?auto_423809 ?auto_423810 ) ) ( not ( = ?auto_423809 ?auto_423811 ) ) ( not ( = ?auto_423809 ?auto_423812 ) ) ( not ( = ?auto_423810 ?auto_423811 ) ) ( not ( = ?auto_423810 ?auto_423812 ) ) ( not ( = ?auto_423811 ?auto_423812 ) ) ( ON ?auto_423810 ?auto_423811 ) ( ON ?auto_423809 ?auto_423810 ) ( ON ?auto_423808 ?auto_423809 ) ( ON ?auto_423807 ?auto_423808 ) ( ON ?auto_423806 ?auto_423807 ) ( ON ?auto_423805 ?auto_423806 ) ( CLEAR ?auto_423805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_423805 )
      ( MAKE-7PILE ?auto_423805 ?auto_423806 ?auto_423807 ?auto_423808 ?auto_423809 ?auto_423810 ?auto_423811 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_423820 - BLOCK
      ?auto_423821 - BLOCK
      ?auto_423822 - BLOCK
      ?auto_423823 - BLOCK
      ?auto_423824 - BLOCK
      ?auto_423825 - BLOCK
      ?auto_423826 - BLOCK
    )
    :vars
    (
      ?auto_423827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423826 ?auto_423827 ) ( not ( = ?auto_423820 ?auto_423821 ) ) ( not ( = ?auto_423820 ?auto_423822 ) ) ( not ( = ?auto_423820 ?auto_423823 ) ) ( not ( = ?auto_423820 ?auto_423824 ) ) ( not ( = ?auto_423820 ?auto_423825 ) ) ( not ( = ?auto_423820 ?auto_423826 ) ) ( not ( = ?auto_423820 ?auto_423827 ) ) ( not ( = ?auto_423821 ?auto_423822 ) ) ( not ( = ?auto_423821 ?auto_423823 ) ) ( not ( = ?auto_423821 ?auto_423824 ) ) ( not ( = ?auto_423821 ?auto_423825 ) ) ( not ( = ?auto_423821 ?auto_423826 ) ) ( not ( = ?auto_423821 ?auto_423827 ) ) ( not ( = ?auto_423822 ?auto_423823 ) ) ( not ( = ?auto_423822 ?auto_423824 ) ) ( not ( = ?auto_423822 ?auto_423825 ) ) ( not ( = ?auto_423822 ?auto_423826 ) ) ( not ( = ?auto_423822 ?auto_423827 ) ) ( not ( = ?auto_423823 ?auto_423824 ) ) ( not ( = ?auto_423823 ?auto_423825 ) ) ( not ( = ?auto_423823 ?auto_423826 ) ) ( not ( = ?auto_423823 ?auto_423827 ) ) ( not ( = ?auto_423824 ?auto_423825 ) ) ( not ( = ?auto_423824 ?auto_423826 ) ) ( not ( = ?auto_423824 ?auto_423827 ) ) ( not ( = ?auto_423825 ?auto_423826 ) ) ( not ( = ?auto_423825 ?auto_423827 ) ) ( not ( = ?auto_423826 ?auto_423827 ) ) ( ON ?auto_423825 ?auto_423826 ) ( ON ?auto_423824 ?auto_423825 ) ( ON ?auto_423823 ?auto_423824 ) ( ON ?auto_423822 ?auto_423823 ) ( ON ?auto_423821 ?auto_423822 ) ( ON ?auto_423820 ?auto_423821 ) ( CLEAR ?auto_423820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_423820 )
      ( MAKE-7PILE ?auto_423820 ?auto_423821 ?auto_423822 ?auto_423823 ?auto_423824 ?auto_423825 ?auto_423826 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_423836 - BLOCK
      ?auto_423837 - BLOCK
      ?auto_423838 - BLOCK
      ?auto_423839 - BLOCK
      ?auto_423840 - BLOCK
      ?auto_423841 - BLOCK
      ?auto_423842 - BLOCK
      ?auto_423843 - BLOCK
    )
    :vars
    (
      ?auto_423844 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_423842 ) ( ON ?auto_423843 ?auto_423844 ) ( CLEAR ?auto_423843 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_423836 ) ( ON ?auto_423837 ?auto_423836 ) ( ON ?auto_423838 ?auto_423837 ) ( ON ?auto_423839 ?auto_423838 ) ( ON ?auto_423840 ?auto_423839 ) ( ON ?auto_423841 ?auto_423840 ) ( ON ?auto_423842 ?auto_423841 ) ( not ( = ?auto_423836 ?auto_423837 ) ) ( not ( = ?auto_423836 ?auto_423838 ) ) ( not ( = ?auto_423836 ?auto_423839 ) ) ( not ( = ?auto_423836 ?auto_423840 ) ) ( not ( = ?auto_423836 ?auto_423841 ) ) ( not ( = ?auto_423836 ?auto_423842 ) ) ( not ( = ?auto_423836 ?auto_423843 ) ) ( not ( = ?auto_423836 ?auto_423844 ) ) ( not ( = ?auto_423837 ?auto_423838 ) ) ( not ( = ?auto_423837 ?auto_423839 ) ) ( not ( = ?auto_423837 ?auto_423840 ) ) ( not ( = ?auto_423837 ?auto_423841 ) ) ( not ( = ?auto_423837 ?auto_423842 ) ) ( not ( = ?auto_423837 ?auto_423843 ) ) ( not ( = ?auto_423837 ?auto_423844 ) ) ( not ( = ?auto_423838 ?auto_423839 ) ) ( not ( = ?auto_423838 ?auto_423840 ) ) ( not ( = ?auto_423838 ?auto_423841 ) ) ( not ( = ?auto_423838 ?auto_423842 ) ) ( not ( = ?auto_423838 ?auto_423843 ) ) ( not ( = ?auto_423838 ?auto_423844 ) ) ( not ( = ?auto_423839 ?auto_423840 ) ) ( not ( = ?auto_423839 ?auto_423841 ) ) ( not ( = ?auto_423839 ?auto_423842 ) ) ( not ( = ?auto_423839 ?auto_423843 ) ) ( not ( = ?auto_423839 ?auto_423844 ) ) ( not ( = ?auto_423840 ?auto_423841 ) ) ( not ( = ?auto_423840 ?auto_423842 ) ) ( not ( = ?auto_423840 ?auto_423843 ) ) ( not ( = ?auto_423840 ?auto_423844 ) ) ( not ( = ?auto_423841 ?auto_423842 ) ) ( not ( = ?auto_423841 ?auto_423843 ) ) ( not ( = ?auto_423841 ?auto_423844 ) ) ( not ( = ?auto_423842 ?auto_423843 ) ) ( not ( = ?auto_423842 ?auto_423844 ) ) ( not ( = ?auto_423843 ?auto_423844 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_423843 ?auto_423844 )
      ( !STACK ?auto_423843 ?auto_423842 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_423853 - BLOCK
      ?auto_423854 - BLOCK
      ?auto_423855 - BLOCK
      ?auto_423856 - BLOCK
      ?auto_423857 - BLOCK
      ?auto_423858 - BLOCK
      ?auto_423859 - BLOCK
      ?auto_423860 - BLOCK
    )
    :vars
    (
      ?auto_423861 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_423859 ) ( ON ?auto_423860 ?auto_423861 ) ( CLEAR ?auto_423860 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_423853 ) ( ON ?auto_423854 ?auto_423853 ) ( ON ?auto_423855 ?auto_423854 ) ( ON ?auto_423856 ?auto_423855 ) ( ON ?auto_423857 ?auto_423856 ) ( ON ?auto_423858 ?auto_423857 ) ( ON ?auto_423859 ?auto_423858 ) ( not ( = ?auto_423853 ?auto_423854 ) ) ( not ( = ?auto_423853 ?auto_423855 ) ) ( not ( = ?auto_423853 ?auto_423856 ) ) ( not ( = ?auto_423853 ?auto_423857 ) ) ( not ( = ?auto_423853 ?auto_423858 ) ) ( not ( = ?auto_423853 ?auto_423859 ) ) ( not ( = ?auto_423853 ?auto_423860 ) ) ( not ( = ?auto_423853 ?auto_423861 ) ) ( not ( = ?auto_423854 ?auto_423855 ) ) ( not ( = ?auto_423854 ?auto_423856 ) ) ( not ( = ?auto_423854 ?auto_423857 ) ) ( not ( = ?auto_423854 ?auto_423858 ) ) ( not ( = ?auto_423854 ?auto_423859 ) ) ( not ( = ?auto_423854 ?auto_423860 ) ) ( not ( = ?auto_423854 ?auto_423861 ) ) ( not ( = ?auto_423855 ?auto_423856 ) ) ( not ( = ?auto_423855 ?auto_423857 ) ) ( not ( = ?auto_423855 ?auto_423858 ) ) ( not ( = ?auto_423855 ?auto_423859 ) ) ( not ( = ?auto_423855 ?auto_423860 ) ) ( not ( = ?auto_423855 ?auto_423861 ) ) ( not ( = ?auto_423856 ?auto_423857 ) ) ( not ( = ?auto_423856 ?auto_423858 ) ) ( not ( = ?auto_423856 ?auto_423859 ) ) ( not ( = ?auto_423856 ?auto_423860 ) ) ( not ( = ?auto_423856 ?auto_423861 ) ) ( not ( = ?auto_423857 ?auto_423858 ) ) ( not ( = ?auto_423857 ?auto_423859 ) ) ( not ( = ?auto_423857 ?auto_423860 ) ) ( not ( = ?auto_423857 ?auto_423861 ) ) ( not ( = ?auto_423858 ?auto_423859 ) ) ( not ( = ?auto_423858 ?auto_423860 ) ) ( not ( = ?auto_423858 ?auto_423861 ) ) ( not ( = ?auto_423859 ?auto_423860 ) ) ( not ( = ?auto_423859 ?auto_423861 ) ) ( not ( = ?auto_423860 ?auto_423861 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_423860 ?auto_423861 )
      ( !STACK ?auto_423860 ?auto_423859 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_423870 - BLOCK
      ?auto_423871 - BLOCK
      ?auto_423872 - BLOCK
      ?auto_423873 - BLOCK
      ?auto_423874 - BLOCK
      ?auto_423875 - BLOCK
      ?auto_423876 - BLOCK
      ?auto_423877 - BLOCK
    )
    :vars
    (
      ?auto_423878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423877 ?auto_423878 ) ( ON-TABLE ?auto_423870 ) ( ON ?auto_423871 ?auto_423870 ) ( ON ?auto_423872 ?auto_423871 ) ( ON ?auto_423873 ?auto_423872 ) ( ON ?auto_423874 ?auto_423873 ) ( ON ?auto_423875 ?auto_423874 ) ( not ( = ?auto_423870 ?auto_423871 ) ) ( not ( = ?auto_423870 ?auto_423872 ) ) ( not ( = ?auto_423870 ?auto_423873 ) ) ( not ( = ?auto_423870 ?auto_423874 ) ) ( not ( = ?auto_423870 ?auto_423875 ) ) ( not ( = ?auto_423870 ?auto_423876 ) ) ( not ( = ?auto_423870 ?auto_423877 ) ) ( not ( = ?auto_423870 ?auto_423878 ) ) ( not ( = ?auto_423871 ?auto_423872 ) ) ( not ( = ?auto_423871 ?auto_423873 ) ) ( not ( = ?auto_423871 ?auto_423874 ) ) ( not ( = ?auto_423871 ?auto_423875 ) ) ( not ( = ?auto_423871 ?auto_423876 ) ) ( not ( = ?auto_423871 ?auto_423877 ) ) ( not ( = ?auto_423871 ?auto_423878 ) ) ( not ( = ?auto_423872 ?auto_423873 ) ) ( not ( = ?auto_423872 ?auto_423874 ) ) ( not ( = ?auto_423872 ?auto_423875 ) ) ( not ( = ?auto_423872 ?auto_423876 ) ) ( not ( = ?auto_423872 ?auto_423877 ) ) ( not ( = ?auto_423872 ?auto_423878 ) ) ( not ( = ?auto_423873 ?auto_423874 ) ) ( not ( = ?auto_423873 ?auto_423875 ) ) ( not ( = ?auto_423873 ?auto_423876 ) ) ( not ( = ?auto_423873 ?auto_423877 ) ) ( not ( = ?auto_423873 ?auto_423878 ) ) ( not ( = ?auto_423874 ?auto_423875 ) ) ( not ( = ?auto_423874 ?auto_423876 ) ) ( not ( = ?auto_423874 ?auto_423877 ) ) ( not ( = ?auto_423874 ?auto_423878 ) ) ( not ( = ?auto_423875 ?auto_423876 ) ) ( not ( = ?auto_423875 ?auto_423877 ) ) ( not ( = ?auto_423875 ?auto_423878 ) ) ( not ( = ?auto_423876 ?auto_423877 ) ) ( not ( = ?auto_423876 ?auto_423878 ) ) ( not ( = ?auto_423877 ?auto_423878 ) ) ( CLEAR ?auto_423875 ) ( ON ?auto_423876 ?auto_423877 ) ( CLEAR ?auto_423876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_423870 ?auto_423871 ?auto_423872 ?auto_423873 ?auto_423874 ?auto_423875 ?auto_423876 )
      ( MAKE-8PILE ?auto_423870 ?auto_423871 ?auto_423872 ?auto_423873 ?auto_423874 ?auto_423875 ?auto_423876 ?auto_423877 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_423887 - BLOCK
      ?auto_423888 - BLOCK
      ?auto_423889 - BLOCK
      ?auto_423890 - BLOCK
      ?auto_423891 - BLOCK
      ?auto_423892 - BLOCK
      ?auto_423893 - BLOCK
      ?auto_423894 - BLOCK
    )
    :vars
    (
      ?auto_423895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423894 ?auto_423895 ) ( ON-TABLE ?auto_423887 ) ( ON ?auto_423888 ?auto_423887 ) ( ON ?auto_423889 ?auto_423888 ) ( ON ?auto_423890 ?auto_423889 ) ( ON ?auto_423891 ?auto_423890 ) ( ON ?auto_423892 ?auto_423891 ) ( not ( = ?auto_423887 ?auto_423888 ) ) ( not ( = ?auto_423887 ?auto_423889 ) ) ( not ( = ?auto_423887 ?auto_423890 ) ) ( not ( = ?auto_423887 ?auto_423891 ) ) ( not ( = ?auto_423887 ?auto_423892 ) ) ( not ( = ?auto_423887 ?auto_423893 ) ) ( not ( = ?auto_423887 ?auto_423894 ) ) ( not ( = ?auto_423887 ?auto_423895 ) ) ( not ( = ?auto_423888 ?auto_423889 ) ) ( not ( = ?auto_423888 ?auto_423890 ) ) ( not ( = ?auto_423888 ?auto_423891 ) ) ( not ( = ?auto_423888 ?auto_423892 ) ) ( not ( = ?auto_423888 ?auto_423893 ) ) ( not ( = ?auto_423888 ?auto_423894 ) ) ( not ( = ?auto_423888 ?auto_423895 ) ) ( not ( = ?auto_423889 ?auto_423890 ) ) ( not ( = ?auto_423889 ?auto_423891 ) ) ( not ( = ?auto_423889 ?auto_423892 ) ) ( not ( = ?auto_423889 ?auto_423893 ) ) ( not ( = ?auto_423889 ?auto_423894 ) ) ( not ( = ?auto_423889 ?auto_423895 ) ) ( not ( = ?auto_423890 ?auto_423891 ) ) ( not ( = ?auto_423890 ?auto_423892 ) ) ( not ( = ?auto_423890 ?auto_423893 ) ) ( not ( = ?auto_423890 ?auto_423894 ) ) ( not ( = ?auto_423890 ?auto_423895 ) ) ( not ( = ?auto_423891 ?auto_423892 ) ) ( not ( = ?auto_423891 ?auto_423893 ) ) ( not ( = ?auto_423891 ?auto_423894 ) ) ( not ( = ?auto_423891 ?auto_423895 ) ) ( not ( = ?auto_423892 ?auto_423893 ) ) ( not ( = ?auto_423892 ?auto_423894 ) ) ( not ( = ?auto_423892 ?auto_423895 ) ) ( not ( = ?auto_423893 ?auto_423894 ) ) ( not ( = ?auto_423893 ?auto_423895 ) ) ( not ( = ?auto_423894 ?auto_423895 ) ) ( CLEAR ?auto_423892 ) ( ON ?auto_423893 ?auto_423894 ) ( CLEAR ?auto_423893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_423887 ?auto_423888 ?auto_423889 ?auto_423890 ?auto_423891 ?auto_423892 ?auto_423893 )
      ( MAKE-8PILE ?auto_423887 ?auto_423888 ?auto_423889 ?auto_423890 ?auto_423891 ?auto_423892 ?auto_423893 ?auto_423894 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_423904 - BLOCK
      ?auto_423905 - BLOCK
      ?auto_423906 - BLOCK
      ?auto_423907 - BLOCK
      ?auto_423908 - BLOCK
      ?auto_423909 - BLOCK
      ?auto_423910 - BLOCK
      ?auto_423911 - BLOCK
    )
    :vars
    (
      ?auto_423912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423911 ?auto_423912 ) ( ON-TABLE ?auto_423904 ) ( ON ?auto_423905 ?auto_423904 ) ( ON ?auto_423906 ?auto_423905 ) ( ON ?auto_423907 ?auto_423906 ) ( ON ?auto_423908 ?auto_423907 ) ( not ( = ?auto_423904 ?auto_423905 ) ) ( not ( = ?auto_423904 ?auto_423906 ) ) ( not ( = ?auto_423904 ?auto_423907 ) ) ( not ( = ?auto_423904 ?auto_423908 ) ) ( not ( = ?auto_423904 ?auto_423909 ) ) ( not ( = ?auto_423904 ?auto_423910 ) ) ( not ( = ?auto_423904 ?auto_423911 ) ) ( not ( = ?auto_423904 ?auto_423912 ) ) ( not ( = ?auto_423905 ?auto_423906 ) ) ( not ( = ?auto_423905 ?auto_423907 ) ) ( not ( = ?auto_423905 ?auto_423908 ) ) ( not ( = ?auto_423905 ?auto_423909 ) ) ( not ( = ?auto_423905 ?auto_423910 ) ) ( not ( = ?auto_423905 ?auto_423911 ) ) ( not ( = ?auto_423905 ?auto_423912 ) ) ( not ( = ?auto_423906 ?auto_423907 ) ) ( not ( = ?auto_423906 ?auto_423908 ) ) ( not ( = ?auto_423906 ?auto_423909 ) ) ( not ( = ?auto_423906 ?auto_423910 ) ) ( not ( = ?auto_423906 ?auto_423911 ) ) ( not ( = ?auto_423906 ?auto_423912 ) ) ( not ( = ?auto_423907 ?auto_423908 ) ) ( not ( = ?auto_423907 ?auto_423909 ) ) ( not ( = ?auto_423907 ?auto_423910 ) ) ( not ( = ?auto_423907 ?auto_423911 ) ) ( not ( = ?auto_423907 ?auto_423912 ) ) ( not ( = ?auto_423908 ?auto_423909 ) ) ( not ( = ?auto_423908 ?auto_423910 ) ) ( not ( = ?auto_423908 ?auto_423911 ) ) ( not ( = ?auto_423908 ?auto_423912 ) ) ( not ( = ?auto_423909 ?auto_423910 ) ) ( not ( = ?auto_423909 ?auto_423911 ) ) ( not ( = ?auto_423909 ?auto_423912 ) ) ( not ( = ?auto_423910 ?auto_423911 ) ) ( not ( = ?auto_423910 ?auto_423912 ) ) ( not ( = ?auto_423911 ?auto_423912 ) ) ( ON ?auto_423910 ?auto_423911 ) ( CLEAR ?auto_423908 ) ( ON ?auto_423909 ?auto_423910 ) ( CLEAR ?auto_423909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_423904 ?auto_423905 ?auto_423906 ?auto_423907 ?auto_423908 ?auto_423909 )
      ( MAKE-8PILE ?auto_423904 ?auto_423905 ?auto_423906 ?auto_423907 ?auto_423908 ?auto_423909 ?auto_423910 ?auto_423911 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_423921 - BLOCK
      ?auto_423922 - BLOCK
      ?auto_423923 - BLOCK
      ?auto_423924 - BLOCK
      ?auto_423925 - BLOCK
      ?auto_423926 - BLOCK
      ?auto_423927 - BLOCK
      ?auto_423928 - BLOCK
    )
    :vars
    (
      ?auto_423929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423928 ?auto_423929 ) ( ON-TABLE ?auto_423921 ) ( ON ?auto_423922 ?auto_423921 ) ( ON ?auto_423923 ?auto_423922 ) ( ON ?auto_423924 ?auto_423923 ) ( ON ?auto_423925 ?auto_423924 ) ( not ( = ?auto_423921 ?auto_423922 ) ) ( not ( = ?auto_423921 ?auto_423923 ) ) ( not ( = ?auto_423921 ?auto_423924 ) ) ( not ( = ?auto_423921 ?auto_423925 ) ) ( not ( = ?auto_423921 ?auto_423926 ) ) ( not ( = ?auto_423921 ?auto_423927 ) ) ( not ( = ?auto_423921 ?auto_423928 ) ) ( not ( = ?auto_423921 ?auto_423929 ) ) ( not ( = ?auto_423922 ?auto_423923 ) ) ( not ( = ?auto_423922 ?auto_423924 ) ) ( not ( = ?auto_423922 ?auto_423925 ) ) ( not ( = ?auto_423922 ?auto_423926 ) ) ( not ( = ?auto_423922 ?auto_423927 ) ) ( not ( = ?auto_423922 ?auto_423928 ) ) ( not ( = ?auto_423922 ?auto_423929 ) ) ( not ( = ?auto_423923 ?auto_423924 ) ) ( not ( = ?auto_423923 ?auto_423925 ) ) ( not ( = ?auto_423923 ?auto_423926 ) ) ( not ( = ?auto_423923 ?auto_423927 ) ) ( not ( = ?auto_423923 ?auto_423928 ) ) ( not ( = ?auto_423923 ?auto_423929 ) ) ( not ( = ?auto_423924 ?auto_423925 ) ) ( not ( = ?auto_423924 ?auto_423926 ) ) ( not ( = ?auto_423924 ?auto_423927 ) ) ( not ( = ?auto_423924 ?auto_423928 ) ) ( not ( = ?auto_423924 ?auto_423929 ) ) ( not ( = ?auto_423925 ?auto_423926 ) ) ( not ( = ?auto_423925 ?auto_423927 ) ) ( not ( = ?auto_423925 ?auto_423928 ) ) ( not ( = ?auto_423925 ?auto_423929 ) ) ( not ( = ?auto_423926 ?auto_423927 ) ) ( not ( = ?auto_423926 ?auto_423928 ) ) ( not ( = ?auto_423926 ?auto_423929 ) ) ( not ( = ?auto_423927 ?auto_423928 ) ) ( not ( = ?auto_423927 ?auto_423929 ) ) ( not ( = ?auto_423928 ?auto_423929 ) ) ( ON ?auto_423927 ?auto_423928 ) ( CLEAR ?auto_423925 ) ( ON ?auto_423926 ?auto_423927 ) ( CLEAR ?auto_423926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_423921 ?auto_423922 ?auto_423923 ?auto_423924 ?auto_423925 ?auto_423926 )
      ( MAKE-8PILE ?auto_423921 ?auto_423922 ?auto_423923 ?auto_423924 ?auto_423925 ?auto_423926 ?auto_423927 ?auto_423928 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_423938 - BLOCK
      ?auto_423939 - BLOCK
      ?auto_423940 - BLOCK
      ?auto_423941 - BLOCK
      ?auto_423942 - BLOCK
      ?auto_423943 - BLOCK
      ?auto_423944 - BLOCK
      ?auto_423945 - BLOCK
    )
    :vars
    (
      ?auto_423946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423945 ?auto_423946 ) ( ON-TABLE ?auto_423938 ) ( ON ?auto_423939 ?auto_423938 ) ( ON ?auto_423940 ?auto_423939 ) ( ON ?auto_423941 ?auto_423940 ) ( not ( = ?auto_423938 ?auto_423939 ) ) ( not ( = ?auto_423938 ?auto_423940 ) ) ( not ( = ?auto_423938 ?auto_423941 ) ) ( not ( = ?auto_423938 ?auto_423942 ) ) ( not ( = ?auto_423938 ?auto_423943 ) ) ( not ( = ?auto_423938 ?auto_423944 ) ) ( not ( = ?auto_423938 ?auto_423945 ) ) ( not ( = ?auto_423938 ?auto_423946 ) ) ( not ( = ?auto_423939 ?auto_423940 ) ) ( not ( = ?auto_423939 ?auto_423941 ) ) ( not ( = ?auto_423939 ?auto_423942 ) ) ( not ( = ?auto_423939 ?auto_423943 ) ) ( not ( = ?auto_423939 ?auto_423944 ) ) ( not ( = ?auto_423939 ?auto_423945 ) ) ( not ( = ?auto_423939 ?auto_423946 ) ) ( not ( = ?auto_423940 ?auto_423941 ) ) ( not ( = ?auto_423940 ?auto_423942 ) ) ( not ( = ?auto_423940 ?auto_423943 ) ) ( not ( = ?auto_423940 ?auto_423944 ) ) ( not ( = ?auto_423940 ?auto_423945 ) ) ( not ( = ?auto_423940 ?auto_423946 ) ) ( not ( = ?auto_423941 ?auto_423942 ) ) ( not ( = ?auto_423941 ?auto_423943 ) ) ( not ( = ?auto_423941 ?auto_423944 ) ) ( not ( = ?auto_423941 ?auto_423945 ) ) ( not ( = ?auto_423941 ?auto_423946 ) ) ( not ( = ?auto_423942 ?auto_423943 ) ) ( not ( = ?auto_423942 ?auto_423944 ) ) ( not ( = ?auto_423942 ?auto_423945 ) ) ( not ( = ?auto_423942 ?auto_423946 ) ) ( not ( = ?auto_423943 ?auto_423944 ) ) ( not ( = ?auto_423943 ?auto_423945 ) ) ( not ( = ?auto_423943 ?auto_423946 ) ) ( not ( = ?auto_423944 ?auto_423945 ) ) ( not ( = ?auto_423944 ?auto_423946 ) ) ( not ( = ?auto_423945 ?auto_423946 ) ) ( ON ?auto_423944 ?auto_423945 ) ( ON ?auto_423943 ?auto_423944 ) ( CLEAR ?auto_423941 ) ( ON ?auto_423942 ?auto_423943 ) ( CLEAR ?auto_423942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_423938 ?auto_423939 ?auto_423940 ?auto_423941 ?auto_423942 )
      ( MAKE-8PILE ?auto_423938 ?auto_423939 ?auto_423940 ?auto_423941 ?auto_423942 ?auto_423943 ?auto_423944 ?auto_423945 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_423955 - BLOCK
      ?auto_423956 - BLOCK
      ?auto_423957 - BLOCK
      ?auto_423958 - BLOCK
      ?auto_423959 - BLOCK
      ?auto_423960 - BLOCK
      ?auto_423961 - BLOCK
      ?auto_423962 - BLOCK
    )
    :vars
    (
      ?auto_423963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423962 ?auto_423963 ) ( ON-TABLE ?auto_423955 ) ( ON ?auto_423956 ?auto_423955 ) ( ON ?auto_423957 ?auto_423956 ) ( ON ?auto_423958 ?auto_423957 ) ( not ( = ?auto_423955 ?auto_423956 ) ) ( not ( = ?auto_423955 ?auto_423957 ) ) ( not ( = ?auto_423955 ?auto_423958 ) ) ( not ( = ?auto_423955 ?auto_423959 ) ) ( not ( = ?auto_423955 ?auto_423960 ) ) ( not ( = ?auto_423955 ?auto_423961 ) ) ( not ( = ?auto_423955 ?auto_423962 ) ) ( not ( = ?auto_423955 ?auto_423963 ) ) ( not ( = ?auto_423956 ?auto_423957 ) ) ( not ( = ?auto_423956 ?auto_423958 ) ) ( not ( = ?auto_423956 ?auto_423959 ) ) ( not ( = ?auto_423956 ?auto_423960 ) ) ( not ( = ?auto_423956 ?auto_423961 ) ) ( not ( = ?auto_423956 ?auto_423962 ) ) ( not ( = ?auto_423956 ?auto_423963 ) ) ( not ( = ?auto_423957 ?auto_423958 ) ) ( not ( = ?auto_423957 ?auto_423959 ) ) ( not ( = ?auto_423957 ?auto_423960 ) ) ( not ( = ?auto_423957 ?auto_423961 ) ) ( not ( = ?auto_423957 ?auto_423962 ) ) ( not ( = ?auto_423957 ?auto_423963 ) ) ( not ( = ?auto_423958 ?auto_423959 ) ) ( not ( = ?auto_423958 ?auto_423960 ) ) ( not ( = ?auto_423958 ?auto_423961 ) ) ( not ( = ?auto_423958 ?auto_423962 ) ) ( not ( = ?auto_423958 ?auto_423963 ) ) ( not ( = ?auto_423959 ?auto_423960 ) ) ( not ( = ?auto_423959 ?auto_423961 ) ) ( not ( = ?auto_423959 ?auto_423962 ) ) ( not ( = ?auto_423959 ?auto_423963 ) ) ( not ( = ?auto_423960 ?auto_423961 ) ) ( not ( = ?auto_423960 ?auto_423962 ) ) ( not ( = ?auto_423960 ?auto_423963 ) ) ( not ( = ?auto_423961 ?auto_423962 ) ) ( not ( = ?auto_423961 ?auto_423963 ) ) ( not ( = ?auto_423962 ?auto_423963 ) ) ( ON ?auto_423961 ?auto_423962 ) ( ON ?auto_423960 ?auto_423961 ) ( CLEAR ?auto_423958 ) ( ON ?auto_423959 ?auto_423960 ) ( CLEAR ?auto_423959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_423955 ?auto_423956 ?auto_423957 ?auto_423958 ?auto_423959 )
      ( MAKE-8PILE ?auto_423955 ?auto_423956 ?auto_423957 ?auto_423958 ?auto_423959 ?auto_423960 ?auto_423961 ?auto_423962 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_423972 - BLOCK
      ?auto_423973 - BLOCK
      ?auto_423974 - BLOCK
      ?auto_423975 - BLOCK
      ?auto_423976 - BLOCK
      ?auto_423977 - BLOCK
      ?auto_423978 - BLOCK
      ?auto_423979 - BLOCK
    )
    :vars
    (
      ?auto_423980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423979 ?auto_423980 ) ( ON-TABLE ?auto_423972 ) ( ON ?auto_423973 ?auto_423972 ) ( ON ?auto_423974 ?auto_423973 ) ( not ( = ?auto_423972 ?auto_423973 ) ) ( not ( = ?auto_423972 ?auto_423974 ) ) ( not ( = ?auto_423972 ?auto_423975 ) ) ( not ( = ?auto_423972 ?auto_423976 ) ) ( not ( = ?auto_423972 ?auto_423977 ) ) ( not ( = ?auto_423972 ?auto_423978 ) ) ( not ( = ?auto_423972 ?auto_423979 ) ) ( not ( = ?auto_423972 ?auto_423980 ) ) ( not ( = ?auto_423973 ?auto_423974 ) ) ( not ( = ?auto_423973 ?auto_423975 ) ) ( not ( = ?auto_423973 ?auto_423976 ) ) ( not ( = ?auto_423973 ?auto_423977 ) ) ( not ( = ?auto_423973 ?auto_423978 ) ) ( not ( = ?auto_423973 ?auto_423979 ) ) ( not ( = ?auto_423973 ?auto_423980 ) ) ( not ( = ?auto_423974 ?auto_423975 ) ) ( not ( = ?auto_423974 ?auto_423976 ) ) ( not ( = ?auto_423974 ?auto_423977 ) ) ( not ( = ?auto_423974 ?auto_423978 ) ) ( not ( = ?auto_423974 ?auto_423979 ) ) ( not ( = ?auto_423974 ?auto_423980 ) ) ( not ( = ?auto_423975 ?auto_423976 ) ) ( not ( = ?auto_423975 ?auto_423977 ) ) ( not ( = ?auto_423975 ?auto_423978 ) ) ( not ( = ?auto_423975 ?auto_423979 ) ) ( not ( = ?auto_423975 ?auto_423980 ) ) ( not ( = ?auto_423976 ?auto_423977 ) ) ( not ( = ?auto_423976 ?auto_423978 ) ) ( not ( = ?auto_423976 ?auto_423979 ) ) ( not ( = ?auto_423976 ?auto_423980 ) ) ( not ( = ?auto_423977 ?auto_423978 ) ) ( not ( = ?auto_423977 ?auto_423979 ) ) ( not ( = ?auto_423977 ?auto_423980 ) ) ( not ( = ?auto_423978 ?auto_423979 ) ) ( not ( = ?auto_423978 ?auto_423980 ) ) ( not ( = ?auto_423979 ?auto_423980 ) ) ( ON ?auto_423978 ?auto_423979 ) ( ON ?auto_423977 ?auto_423978 ) ( ON ?auto_423976 ?auto_423977 ) ( CLEAR ?auto_423974 ) ( ON ?auto_423975 ?auto_423976 ) ( CLEAR ?auto_423975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_423972 ?auto_423973 ?auto_423974 ?auto_423975 )
      ( MAKE-8PILE ?auto_423972 ?auto_423973 ?auto_423974 ?auto_423975 ?auto_423976 ?auto_423977 ?auto_423978 ?auto_423979 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_423989 - BLOCK
      ?auto_423990 - BLOCK
      ?auto_423991 - BLOCK
      ?auto_423992 - BLOCK
      ?auto_423993 - BLOCK
      ?auto_423994 - BLOCK
      ?auto_423995 - BLOCK
      ?auto_423996 - BLOCK
    )
    :vars
    (
      ?auto_423997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423996 ?auto_423997 ) ( ON-TABLE ?auto_423989 ) ( ON ?auto_423990 ?auto_423989 ) ( ON ?auto_423991 ?auto_423990 ) ( not ( = ?auto_423989 ?auto_423990 ) ) ( not ( = ?auto_423989 ?auto_423991 ) ) ( not ( = ?auto_423989 ?auto_423992 ) ) ( not ( = ?auto_423989 ?auto_423993 ) ) ( not ( = ?auto_423989 ?auto_423994 ) ) ( not ( = ?auto_423989 ?auto_423995 ) ) ( not ( = ?auto_423989 ?auto_423996 ) ) ( not ( = ?auto_423989 ?auto_423997 ) ) ( not ( = ?auto_423990 ?auto_423991 ) ) ( not ( = ?auto_423990 ?auto_423992 ) ) ( not ( = ?auto_423990 ?auto_423993 ) ) ( not ( = ?auto_423990 ?auto_423994 ) ) ( not ( = ?auto_423990 ?auto_423995 ) ) ( not ( = ?auto_423990 ?auto_423996 ) ) ( not ( = ?auto_423990 ?auto_423997 ) ) ( not ( = ?auto_423991 ?auto_423992 ) ) ( not ( = ?auto_423991 ?auto_423993 ) ) ( not ( = ?auto_423991 ?auto_423994 ) ) ( not ( = ?auto_423991 ?auto_423995 ) ) ( not ( = ?auto_423991 ?auto_423996 ) ) ( not ( = ?auto_423991 ?auto_423997 ) ) ( not ( = ?auto_423992 ?auto_423993 ) ) ( not ( = ?auto_423992 ?auto_423994 ) ) ( not ( = ?auto_423992 ?auto_423995 ) ) ( not ( = ?auto_423992 ?auto_423996 ) ) ( not ( = ?auto_423992 ?auto_423997 ) ) ( not ( = ?auto_423993 ?auto_423994 ) ) ( not ( = ?auto_423993 ?auto_423995 ) ) ( not ( = ?auto_423993 ?auto_423996 ) ) ( not ( = ?auto_423993 ?auto_423997 ) ) ( not ( = ?auto_423994 ?auto_423995 ) ) ( not ( = ?auto_423994 ?auto_423996 ) ) ( not ( = ?auto_423994 ?auto_423997 ) ) ( not ( = ?auto_423995 ?auto_423996 ) ) ( not ( = ?auto_423995 ?auto_423997 ) ) ( not ( = ?auto_423996 ?auto_423997 ) ) ( ON ?auto_423995 ?auto_423996 ) ( ON ?auto_423994 ?auto_423995 ) ( ON ?auto_423993 ?auto_423994 ) ( CLEAR ?auto_423991 ) ( ON ?auto_423992 ?auto_423993 ) ( CLEAR ?auto_423992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_423989 ?auto_423990 ?auto_423991 ?auto_423992 )
      ( MAKE-8PILE ?auto_423989 ?auto_423990 ?auto_423991 ?auto_423992 ?auto_423993 ?auto_423994 ?auto_423995 ?auto_423996 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_424006 - BLOCK
      ?auto_424007 - BLOCK
      ?auto_424008 - BLOCK
      ?auto_424009 - BLOCK
      ?auto_424010 - BLOCK
      ?auto_424011 - BLOCK
      ?auto_424012 - BLOCK
      ?auto_424013 - BLOCK
    )
    :vars
    (
      ?auto_424014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424013 ?auto_424014 ) ( ON-TABLE ?auto_424006 ) ( ON ?auto_424007 ?auto_424006 ) ( not ( = ?auto_424006 ?auto_424007 ) ) ( not ( = ?auto_424006 ?auto_424008 ) ) ( not ( = ?auto_424006 ?auto_424009 ) ) ( not ( = ?auto_424006 ?auto_424010 ) ) ( not ( = ?auto_424006 ?auto_424011 ) ) ( not ( = ?auto_424006 ?auto_424012 ) ) ( not ( = ?auto_424006 ?auto_424013 ) ) ( not ( = ?auto_424006 ?auto_424014 ) ) ( not ( = ?auto_424007 ?auto_424008 ) ) ( not ( = ?auto_424007 ?auto_424009 ) ) ( not ( = ?auto_424007 ?auto_424010 ) ) ( not ( = ?auto_424007 ?auto_424011 ) ) ( not ( = ?auto_424007 ?auto_424012 ) ) ( not ( = ?auto_424007 ?auto_424013 ) ) ( not ( = ?auto_424007 ?auto_424014 ) ) ( not ( = ?auto_424008 ?auto_424009 ) ) ( not ( = ?auto_424008 ?auto_424010 ) ) ( not ( = ?auto_424008 ?auto_424011 ) ) ( not ( = ?auto_424008 ?auto_424012 ) ) ( not ( = ?auto_424008 ?auto_424013 ) ) ( not ( = ?auto_424008 ?auto_424014 ) ) ( not ( = ?auto_424009 ?auto_424010 ) ) ( not ( = ?auto_424009 ?auto_424011 ) ) ( not ( = ?auto_424009 ?auto_424012 ) ) ( not ( = ?auto_424009 ?auto_424013 ) ) ( not ( = ?auto_424009 ?auto_424014 ) ) ( not ( = ?auto_424010 ?auto_424011 ) ) ( not ( = ?auto_424010 ?auto_424012 ) ) ( not ( = ?auto_424010 ?auto_424013 ) ) ( not ( = ?auto_424010 ?auto_424014 ) ) ( not ( = ?auto_424011 ?auto_424012 ) ) ( not ( = ?auto_424011 ?auto_424013 ) ) ( not ( = ?auto_424011 ?auto_424014 ) ) ( not ( = ?auto_424012 ?auto_424013 ) ) ( not ( = ?auto_424012 ?auto_424014 ) ) ( not ( = ?auto_424013 ?auto_424014 ) ) ( ON ?auto_424012 ?auto_424013 ) ( ON ?auto_424011 ?auto_424012 ) ( ON ?auto_424010 ?auto_424011 ) ( ON ?auto_424009 ?auto_424010 ) ( CLEAR ?auto_424007 ) ( ON ?auto_424008 ?auto_424009 ) ( CLEAR ?auto_424008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_424006 ?auto_424007 ?auto_424008 )
      ( MAKE-8PILE ?auto_424006 ?auto_424007 ?auto_424008 ?auto_424009 ?auto_424010 ?auto_424011 ?auto_424012 ?auto_424013 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_424023 - BLOCK
      ?auto_424024 - BLOCK
      ?auto_424025 - BLOCK
      ?auto_424026 - BLOCK
      ?auto_424027 - BLOCK
      ?auto_424028 - BLOCK
      ?auto_424029 - BLOCK
      ?auto_424030 - BLOCK
    )
    :vars
    (
      ?auto_424031 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424030 ?auto_424031 ) ( ON-TABLE ?auto_424023 ) ( ON ?auto_424024 ?auto_424023 ) ( not ( = ?auto_424023 ?auto_424024 ) ) ( not ( = ?auto_424023 ?auto_424025 ) ) ( not ( = ?auto_424023 ?auto_424026 ) ) ( not ( = ?auto_424023 ?auto_424027 ) ) ( not ( = ?auto_424023 ?auto_424028 ) ) ( not ( = ?auto_424023 ?auto_424029 ) ) ( not ( = ?auto_424023 ?auto_424030 ) ) ( not ( = ?auto_424023 ?auto_424031 ) ) ( not ( = ?auto_424024 ?auto_424025 ) ) ( not ( = ?auto_424024 ?auto_424026 ) ) ( not ( = ?auto_424024 ?auto_424027 ) ) ( not ( = ?auto_424024 ?auto_424028 ) ) ( not ( = ?auto_424024 ?auto_424029 ) ) ( not ( = ?auto_424024 ?auto_424030 ) ) ( not ( = ?auto_424024 ?auto_424031 ) ) ( not ( = ?auto_424025 ?auto_424026 ) ) ( not ( = ?auto_424025 ?auto_424027 ) ) ( not ( = ?auto_424025 ?auto_424028 ) ) ( not ( = ?auto_424025 ?auto_424029 ) ) ( not ( = ?auto_424025 ?auto_424030 ) ) ( not ( = ?auto_424025 ?auto_424031 ) ) ( not ( = ?auto_424026 ?auto_424027 ) ) ( not ( = ?auto_424026 ?auto_424028 ) ) ( not ( = ?auto_424026 ?auto_424029 ) ) ( not ( = ?auto_424026 ?auto_424030 ) ) ( not ( = ?auto_424026 ?auto_424031 ) ) ( not ( = ?auto_424027 ?auto_424028 ) ) ( not ( = ?auto_424027 ?auto_424029 ) ) ( not ( = ?auto_424027 ?auto_424030 ) ) ( not ( = ?auto_424027 ?auto_424031 ) ) ( not ( = ?auto_424028 ?auto_424029 ) ) ( not ( = ?auto_424028 ?auto_424030 ) ) ( not ( = ?auto_424028 ?auto_424031 ) ) ( not ( = ?auto_424029 ?auto_424030 ) ) ( not ( = ?auto_424029 ?auto_424031 ) ) ( not ( = ?auto_424030 ?auto_424031 ) ) ( ON ?auto_424029 ?auto_424030 ) ( ON ?auto_424028 ?auto_424029 ) ( ON ?auto_424027 ?auto_424028 ) ( ON ?auto_424026 ?auto_424027 ) ( CLEAR ?auto_424024 ) ( ON ?auto_424025 ?auto_424026 ) ( CLEAR ?auto_424025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_424023 ?auto_424024 ?auto_424025 )
      ( MAKE-8PILE ?auto_424023 ?auto_424024 ?auto_424025 ?auto_424026 ?auto_424027 ?auto_424028 ?auto_424029 ?auto_424030 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_424040 - BLOCK
      ?auto_424041 - BLOCK
      ?auto_424042 - BLOCK
      ?auto_424043 - BLOCK
      ?auto_424044 - BLOCK
      ?auto_424045 - BLOCK
      ?auto_424046 - BLOCK
      ?auto_424047 - BLOCK
    )
    :vars
    (
      ?auto_424048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424047 ?auto_424048 ) ( ON-TABLE ?auto_424040 ) ( not ( = ?auto_424040 ?auto_424041 ) ) ( not ( = ?auto_424040 ?auto_424042 ) ) ( not ( = ?auto_424040 ?auto_424043 ) ) ( not ( = ?auto_424040 ?auto_424044 ) ) ( not ( = ?auto_424040 ?auto_424045 ) ) ( not ( = ?auto_424040 ?auto_424046 ) ) ( not ( = ?auto_424040 ?auto_424047 ) ) ( not ( = ?auto_424040 ?auto_424048 ) ) ( not ( = ?auto_424041 ?auto_424042 ) ) ( not ( = ?auto_424041 ?auto_424043 ) ) ( not ( = ?auto_424041 ?auto_424044 ) ) ( not ( = ?auto_424041 ?auto_424045 ) ) ( not ( = ?auto_424041 ?auto_424046 ) ) ( not ( = ?auto_424041 ?auto_424047 ) ) ( not ( = ?auto_424041 ?auto_424048 ) ) ( not ( = ?auto_424042 ?auto_424043 ) ) ( not ( = ?auto_424042 ?auto_424044 ) ) ( not ( = ?auto_424042 ?auto_424045 ) ) ( not ( = ?auto_424042 ?auto_424046 ) ) ( not ( = ?auto_424042 ?auto_424047 ) ) ( not ( = ?auto_424042 ?auto_424048 ) ) ( not ( = ?auto_424043 ?auto_424044 ) ) ( not ( = ?auto_424043 ?auto_424045 ) ) ( not ( = ?auto_424043 ?auto_424046 ) ) ( not ( = ?auto_424043 ?auto_424047 ) ) ( not ( = ?auto_424043 ?auto_424048 ) ) ( not ( = ?auto_424044 ?auto_424045 ) ) ( not ( = ?auto_424044 ?auto_424046 ) ) ( not ( = ?auto_424044 ?auto_424047 ) ) ( not ( = ?auto_424044 ?auto_424048 ) ) ( not ( = ?auto_424045 ?auto_424046 ) ) ( not ( = ?auto_424045 ?auto_424047 ) ) ( not ( = ?auto_424045 ?auto_424048 ) ) ( not ( = ?auto_424046 ?auto_424047 ) ) ( not ( = ?auto_424046 ?auto_424048 ) ) ( not ( = ?auto_424047 ?auto_424048 ) ) ( ON ?auto_424046 ?auto_424047 ) ( ON ?auto_424045 ?auto_424046 ) ( ON ?auto_424044 ?auto_424045 ) ( ON ?auto_424043 ?auto_424044 ) ( ON ?auto_424042 ?auto_424043 ) ( CLEAR ?auto_424040 ) ( ON ?auto_424041 ?auto_424042 ) ( CLEAR ?auto_424041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_424040 ?auto_424041 )
      ( MAKE-8PILE ?auto_424040 ?auto_424041 ?auto_424042 ?auto_424043 ?auto_424044 ?auto_424045 ?auto_424046 ?auto_424047 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_424057 - BLOCK
      ?auto_424058 - BLOCK
      ?auto_424059 - BLOCK
      ?auto_424060 - BLOCK
      ?auto_424061 - BLOCK
      ?auto_424062 - BLOCK
      ?auto_424063 - BLOCK
      ?auto_424064 - BLOCK
    )
    :vars
    (
      ?auto_424065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424064 ?auto_424065 ) ( ON-TABLE ?auto_424057 ) ( not ( = ?auto_424057 ?auto_424058 ) ) ( not ( = ?auto_424057 ?auto_424059 ) ) ( not ( = ?auto_424057 ?auto_424060 ) ) ( not ( = ?auto_424057 ?auto_424061 ) ) ( not ( = ?auto_424057 ?auto_424062 ) ) ( not ( = ?auto_424057 ?auto_424063 ) ) ( not ( = ?auto_424057 ?auto_424064 ) ) ( not ( = ?auto_424057 ?auto_424065 ) ) ( not ( = ?auto_424058 ?auto_424059 ) ) ( not ( = ?auto_424058 ?auto_424060 ) ) ( not ( = ?auto_424058 ?auto_424061 ) ) ( not ( = ?auto_424058 ?auto_424062 ) ) ( not ( = ?auto_424058 ?auto_424063 ) ) ( not ( = ?auto_424058 ?auto_424064 ) ) ( not ( = ?auto_424058 ?auto_424065 ) ) ( not ( = ?auto_424059 ?auto_424060 ) ) ( not ( = ?auto_424059 ?auto_424061 ) ) ( not ( = ?auto_424059 ?auto_424062 ) ) ( not ( = ?auto_424059 ?auto_424063 ) ) ( not ( = ?auto_424059 ?auto_424064 ) ) ( not ( = ?auto_424059 ?auto_424065 ) ) ( not ( = ?auto_424060 ?auto_424061 ) ) ( not ( = ?auto_424060 ?auto_424062 ) ) ( not ( = ?auto_424060 ?auto_424063 ) ) ( not ( = ?auto_424060 ?auto_424064 ) ) ( not ( = ?auto_424060 ?auto_424065 ) ) ( not ( = ?auto_424061 ?auto_424062 ) ) ( not ( = ?auto_424061 ?auto_424063 ) ) ( not ( = ?auto_424061 ?auto_424064 ) ) ( not ( = ?auto_424061 ?auto_424065 ) ) ( not ( = ?auto_424062 ?auto_424063 ) ) ( not ( = ?auto_424062 ?auto_424064 ) ) ( not ( = ?auto_424062 ?auto_424065 ) ) ( not ( = ?auto_424063 ?auto_424064 ) ) ( not ( = ?auto_424063 ?auto_424065 ) ) ( not ( = ?auto_424064 ?auto_424065 ) ) ( ON ?auto_424063 ?auto_424064 ) ( ON ?auto_424062 ?auto_424063 ) ( ON ?auto_424061 ?auto_424062 ) ( ON ?auto_424060 ?auto_424061 ) ( ON ?auto_424059 ?auto_424060 ) ( CLEAR ?auto_424057 ) ( ON ?auto_424058 ?auto_424059 ) ( CLEAR ?auto_424058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_424057 ?auto_424058 )
      ( MAKE-8PILE ?auto_424057 ?auto_424058 ?auto_424059 ?auto_424060 ?auto_424061 ?auto_424062 ?auto_424063 ?auto_424064 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_424074 - BLOCK
      ?auto_424075 - BLOCK
      ?auto_424076 - BLOCK
      ?auto_424077 - BLOCK
      ?auto_424078 - BLOCK
      ?auto_424079 - BLOCK
      ?auto_424080 - BLOCK
      ?auto_424081 - BLOCK
    )
    :vars
    (
      ?auto_424082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424081 ?auto_424082 ) ( not ( = ?auto_424074 ?auto_424075 ) ) ( not ( = ?auto_424074 ?auto_424076 ) ) ( not ( = ?auto_424074 ?auto_424077 ) ) ( not ( = ?auto_424074 ?auto_424078 ) ) ( not ( = ?auto_424074 ?auto_424079 ) ) ( not ( = ?auto_424074 ?auto_424080 ) ) ( not ( = ?auto_424074 ?auto_424081 ) ) ( not ( = ?auto_424074 ?auto_424082 ) ) ( not ( = ?auto_424075 ?auto_424076 ) ) ( not ( = ?auto_424075 ?auto_424077 ) ) ( not ( = ?auto_424075 ?auto_424078 ) ) ( not ( = ?auto_424075 ?auto_424079 ) ) ( not ( = ?auto_424075 ?auto_424080 ) ) ( not ( = ?auto_424075 ?auto_424081 ) ) ( not ( = ?auto_424075 ?auto_424082 ) ) ( not ( = ?auto_424076 ?auto_424077 ) ) ( not ( = ?auto_424076 ?auto_424078 ) ) ( not ( = ?auto_424076 ?auto_424079 ) ) ( not ( = ?auto_424076 ?auto_424080 ) ) ( not ( = ?auto_424076 ?auto_424081 ) ) ( not ( = ?auto_424076 ?auto_424082 ) ) ( not ( = ?auto_424077 ?auto_424078 ) ) ( not ( = ?auto_424077 ?auto_424079 ) ) ( not ( = ?auto_424077 ?auto_424080 ) ) ( not ( = ?auto_424077 ?auto_424081 ) ) ( not ( = ?auto_424077 ?auto_424082 ) ) ( not ( = ?auto_424078 ?auto_424079 ) ) ( not ( = ?auto_424078 ?auto_424080 ) ) ( not ( = ?auto_424078 ?auto_424081 ) ) ( not ( = ?auto_424078 ?auto_424082 ) ) ( not ( = ?auto_424079 ?auto_424080 ) ) ( not ( = ?auto_424079 ?auto_424081 ) ) ( not ( = ?auto_424079 ?auto_424082 ) ) ( not ( = ?auto_424080 ?auto_424081 ) ) ( not ( = ?auto_424080 ?auto_424082 ) ) ( not ( = ?auto_424081 ?auto_424082 ) ) ( ON ?auto_424080 ?auto_424081 ) ( ON ?auto_424079 ?auto_424080 ) ( ON ?auto_424078 ?auto_424079 ) ( ON ?auto_424077 ?auto_424078 ) ( ON ?auto_424076 ?auto_424077 ) ( ON ?auto_424075 ?auto_424076 ) ( ON ?auto_424074 ?auto_424075 ) ( CLEAR ?auto_424074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_424074 )
      ( MAKE-8PILE ?auto_424074 ?auto_424075 ?auto_424076 ?auto_424077 ?auto_424078 ?auto_424079 ?auto_424080 ?auto_424081 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_424091 - BLOCK
      ?auto_424092 - BLOCK
      ?auto_424093 - BLOCK
      ?auto_424094 - BLOCK
      ?auto_424095 - BLOCK
      ?auto_424096 - BLOCK
      ?auto_424097 - BLOCK
      ?auto_424098 - BLOCK
    )
    :vars
    (
      ?auto_424099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424098 ?auto_424099 ) ( not ( = ?auto_424091 ?auto_424092 ) ) ( not ( = ?auto_424091 ?auto_424093 ) ) ( not ( = ?auto_424091 ?auto_424094 ) ) ( not ( = ?auto_424091 ?auto_424095 ) ) ( not ( = ?auto_424091 ?auto_424096 ) ) ( not ( = ?auto_424091 ?auto_424097 ) ) ( not ( = ?auto_424091 ?auto_424098 ) ) ( not ( = ?auto_424091 ?auto_424099 ) ) ( not ( = ?auto_424092 ?auto_424093 ) ) ( not ( = ?auto_424092 ?auto_424094 ) ) ( not ( = ?auto_424092 ?auto_424095 ) ) ( not ( = ?auto_424092 ?auto_424096 ) ) ( not ( = ?auto_424092 ?auto_424097 ) ) ( not ( = ?auto_424092 ?auto_424098 ) ) ( not ( = ?auto_424092 ?auto_424099 ) ) ( not ( = ?auto_424093 ?auto_424094 ) ) ( not ( = ?auto_424093 ?auto_424095 ) ) ( not ( = ?auto_424093 ?auto_424096 ) ) ( not ( = ?auto_424093 ?auto_424097 ) ) ( not ( = ?auto_424093 ?auto_424098 ) ) ( not ( = ?auto_424093 ?auto_424099 ) ) ( not ( = ?auto_424094 ?auto_424095 ) ) ( not ( = ?auto_424094 ?auto_424096 ) ) ( not ( = ?auto_424094 ?auto_424097 ) ) ( not ( = ?auto_424094 ?auto_424098 ) ) ( not ( = ?auto_424094 ?auto_424099 ) ) ( not ( = ?auto_424095 ?auto_424096 ) ) ( not ( = ?auto_424095 ?auto_424097 ) ) ( not ( = ?auto_424095 ?auto_424098 ) ) ( not ( = ?auto_424095 ?auto_424099 ) ) ( not ( = ?auto_424096 ?auto_424097 ) ) ( not ( = ?auto_424096 ?auto_424098 ) ) ( not ( = ?auto_424096 ?auto_424099 ) ) ( not ( = ?auto_424097 ?auto_424098 ) ) ( not ( = ?auto_424097 ?auto_424099 ) ) ( not ( = ?auto_424098 ?auto_424099 ) ) ( ON ?auto_424097 ?auto_424098 ) ( ON ?auto_424096 ?auto_424097 ) ( ON ?auto_424095 ?auto_424096 ) ( ON ?auto_424094 ?auto_424095 ) ( ON ?auto_424093 ?auto_424094 ) ( ON ?auto_424092 ?auto_424093 ) ( ON ?auto_424091 ?auto_424092 ) ( CLEAR ?auto_424091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_424091 )
      ( MAKE-8PILE ?auto_424091 ?auto_424092 ?auto_424093 ?auto_424094 ?auto_424095 ?auto_424096 ?auto_424097 ?auto_424098 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_424109 - BLOCK
      ?auto_424110 - BLOCK
      ?auto_424111 - BLOCK
      ?auto_424112 - BLOCK
      ?auto_424113 - BLOCK
      ?auto_424114 - BLOCK
      ?auto_424115 - BLOCK
      ?auto_424116 - BLOCK
      ?auto_424117 - BLOCK
    )
    :vars
    (
      ?auto_424118 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_424116 ) ( ON ?auto_424117 ?auto_424118 ) ( CLEAR ?auto_424117 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_424109 ) ( ON ?auto_424110 ?auto_424109 ) ( ON ?auto_424111 ?auto_424110 ) ( ON ?auto_424112 ?auto_424111 ) ( ON ?auto_424113 ?auto_424112 ) ( ON ?auto_424114 ?auto_424113 ) ( ON ?auto_424115 ?auto_424114 ) ( ON ?auto_424116 ?auto_424115 ) ( not ( = ?auto_424109 ?auto_424110 ) ) ( not ( = ?auto_424109 ?auto_424111 ) ) ( not ( = ?auto_424109 ?auto_424112 ) ) ( not ( = ?auto_424109 ?auto_424113 ) ) ( not ( = ?auto_424109 ?auto_424114 ) ) ( not ( = ?auto_424109 ?auto_424115 ) ) ( not ( = ?auto_424109 ?auto_424116 ) ) ( not ( = ?auto_424109 ?auto_424117 ) ) ( not ( = ?auto_424109 ?auto_424118 ) ) ( not ( = ?auto_424110 ?auto_424111 ) ) ( not ( = ?auto_424110 ?auto_424112 ) ) ( not ( = ?auto_424110 ?auto_424113 ) ) ( not ( = ?auto_424110 ?auto_424114 ) ) ( not ( = ?auto_424110 ?auto_424115 ) ) ( not ( = ?auto_424110 ?auto_424116 ) ) ( not ( = ?auto_424110 ?auto_424117 ) ) ( not ( = ?auto_424110 ?auto_424118 ) ) ( not ( = ?auto_424111 ?auto_424112 ) ) ( not ( = ?auto_424111 ?auto_424113 ) ) ( not ( = ?auto_424111 ?auto_424114 ) ) ( not ( = ?auto_424111 ?auto_424115 ) ) ( not ( = ?auto_424111 ?auto_424116 ) ) ( not ( = ?auto_424111 ?auto_424117 ) ) ( not ( = ?auto_424111 ?auto_424118 ) ) ( not ( = ?auto_424112 ?auto_424113 ) ) ( not ( = ?auto_424112 ?auto_424114 ) ) ( not ( = ?auto_424112 ?auto_424115 ) ) ( not ( = ?auto_424112 ?auto_424116 ) ) ( not ( = ?auto_424112 ?auto_424117 ) ) ( not ( = ?auto_424112 ?auto_424118 ) ) ( not ( = ?auto_424113 ?auto_424114 ) ) ( not ( = ?auto_424113 ?auto_424115 ) ) ( not ( = ?auto_424113 ?auto_424116 ) ) ( not ( = ?auto_424113 ?auto_424117 ) ) ( not ( = ?auto_424113 ?auto_424118 ) ) ( not ( = ?auto_424114 ?auto_424115 ) ) ( not ( = ?auto_424114 ?auto_424116 ) ) ( not ( = ?auto_424114 ?auto_424117 ) ) ( not ( = ?auto_424114 ?auto_424118 ) ) ( not ( = ?auto_424115 ?auto_424116 ) ) ( not ( = ?auto_424115 ?auto_424117 ) ) ( not ( = ?auto_424115 ?auto_424118 ) ) ( not ( = ?auto_424116 ?auto_424117 ) ) ( not ( = ?auto_424116 ?auto_424118 ) ) ( not ( = ?auto_424117 ?auto_424118 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_424117 ?auto_424118 )
      ( !STACK ?auto_424117 ?auto_424116 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_424128 - BLOCK
      ?auto_424129 - BLOCK
      ?auto_424130 - BLOCK
      ?auto_424131 - BLOCK
      ?auto_424132 - BLOCK
      ?auto_424133 - BLOCK
      ?auto_424134 - BLOCK
      ?auto_424135 - BLOCK
      ?auto_424136 - BLOCK
    )
    :vars
    (
      ?auto_424137 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_424135 ) ( ON ?auto_424136 ?auto_424137 ) ( CLEAR ?auto_424136 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_424128 ) ( ON ?auto_424129 ?auto_424128 ) ( ON ?auto_424130 ?auto_424129 ) ( ON ?auto_424131 ?auto_424130 ) ( ON ?auto_424132 ?auto_424131 ) ( ON ?auto_424133 ?auto_424132 ) ( ON ?auto_424134 ?auto_424133 ) ( ON ?auto_424135 ?auto_424134 ) ( not ( = ?auto_424128 ?auto_424129 ) ) ( not ( = ?auto_424128 ?auto_424130 ) ) ( not ( = ?auto_424128 ?auto_424131 ) ) ( not ( = ?auto_424128 ?auto_424132 ) ) ( not ( = ?auto_424128 ?auto_424133 ) ) ( not ( = ?auto_424128 ?auto_424134 ) ) ( not ( = ?auto_424128 ?auto_424135 ) ) ( not ( = ?auto_424128 ?auto_424136 ) ) ( not ( = ?auto_424128 ?auto_424137 ) ) ( not ( = ?auto_424129 ?auto_424130 ) ) ( not ( = ?auto_424129 ?auto_424131 ) ) ( not ( = ?auto_424129 ?auto_424132 ) ) ( not ( = ?auto_424129 ?auto_424133 ) ) ( not ( = ?auto_424129 ?auto_424134 ) ) ( not ( = ?auto_424129 ?auto_424135 ) ) ( not ( = ?auto_424129 ?auto_424136 ) ) ( not ( = ?auto_424129 ?auto_424137 ) ) ( not ( = ?auto_424130 ?auto_424131 ) ) ( not ( = ?auto_424130 ?auto_424132 ) ) ( not ( = ?auto_424130 ?auto_424133 ) ) ( not ( = ?auto_424130 ?auto_424134 ) ) ( not ( = ?auto_424130 ?auto_424135 ) ) ( not ( = ?auto_424130 ?auto_424136 ) ) ( not ( = ?auto_424130 ?auto_424137 ) ) ( not ( = ?auto_424131 ?auto_424132 ) ) ( not ( = ?auto_424131 ?auto_424133 ) ) ( not ( = ?auto_424131 ?auto_424134 ) ) ( not ( = ?auto_424131 ?auto_424135 ) ) ( not ( = ?auto_424131 ?auto_424136 ) ) ( not ( = ?auto_424131 ?auto_424137 ) ) ( not ( = ?auto_424132 ?auto_424133 ) ) ( not ( = ?auto_424132 ?auto_424134 ) ) ( not ( = ?auto_424132 ?auto_424135 ) ) ( not ( = ?auto_424132 ?auto_424136 ) ) ( not ( = ?auto_424132 ?auto_424137 ) ) ( not ( = ?auto_424133 ?auto_424134 ) ) ( not ( = ?auto_424133 ?auto_424135 ) ) ( not ( = ?auto_424133 ?auto_424136 ) ) ( not ( = ?auto_424133 ?auto_424137 ) ) ( not ( = ?auto_424134 ?auto_424135 ) ) ( not ( = ?auto_424134 ?auto_424136 ) ) ( not ( = ?auto_424134 ?auto_424137 ) ) ( not ( = ?auto_424135 ?auto_424136 ) ) ( not ( = ?auto_424135 ?auto_424137 ) ) ( not ( = ?auto_424136 ?auto_424137 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_424136 ?auto_424137 )
      ( !STACK ?auto_424136 ?auto_424135 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_424147 - BLOCK
      ?auto_424148 - BLOCK
      ?auto_424149 - BLOCK
      ?auto_424150 - BLOCK
      ?auto_424151 - BLOCK
      ?auto_424152 - BLOCK
      ?auto_424153 - BLOCK
      ?auto_424154 - BLOCK
      ?auto_424155 - BLOCK
    )
    :vars
    (
      ?auto_424156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424155 ?auto_424156 ) ( ON-TABLE ?auto_424147 ) ( ON ?auto_424148 ?auto_424147 ) ( ON ?auto_424149 ?auto_424148 ) ( ON ?auto_424150 ?auto_424149 ) ( ON ?auto_424151 ?auto_424150 ) ( ON ?auto_424152 ?auto_424151 ) ( ON ?auto_424153 ?auto_424152 ) ( not ( = ?auto_424147 ?auto_424148 ) ) ( not ( = ?auto_424147 ?auto_424149 ) ) ( not ( = ?auto_424147 ?auto_424150 ) ) ( not ( = ?auto_424147 ?auto_424151 ) ) ( not ( = ?auto_424147 ?auto_424152 ) ) ( not ( = ?auto_424147 ?auto_424153 ) ) ( not ( = ?auto_424147 ?auto_424154 ) ) ( not ( = ?auto_424147 ?auto_424155 ) ) ( not ( = ?auto_424147 ?auto_424156 ) ) ( not ( = ?auto_424148 ?auto_424149 ) ) ( not ( = ?auto_424148 ?auto_424150 ) ) ( not ( = ?auto_424148 ?auto_424151 ) ) ( not ( = ?auto_424148 ?auto_424152 ) ) ( not ( = ?auto_424148 ?auto_424153 ) ) ( not ( = ?auto_424148 ?auto_424154 ) ) ( not ( = ?auto_424148 ?auto_424155 ) ) ( not ( = ?auto_424148 ?auto_424156 ) ) ( not ( = ?auto_424149 ?auto_424150 ) ) ( not ( = ?auto_424149 ?auto_424151 ) ) ( not ( = ?auto_424149 ?auto_424152 ) ) ( not ( = ?auto_424149 ?auto_424153 ) ) ( not ( = ?auto_424149 ?auto_424154 ) ) ( not ( = ?auto_424149 ?auto_424155 ) ) ( not ( = ?auto_424149 ?auto_424156 ) ) ( not ( = ?auto_424150 ?auto_424151 ) ) ( not ( = ?auto_424150 ?auto_424152 ) ) ( not ( = ?auto_424150 ?auto_424153 ) ) ( not ( = ?auto_424150 ?auto_424154 ) ) ( not ( = ?auto_424150 ?auto_424155 ) ) ( not ( = ?auto_424150 ?auto_424156 ) ) ( not ( = ?auto_424151 ?auto_424152 ) ) ( not ( = ?auto_424151 ?auto_424153 ) ) ( not ( = ?auto_424151 ?auto_424154 ) ) ( not ( = ?auto_424151 ?auto_424155 ) ) ( not ( = ?auto_424151 ?auto_424156 ) ) ( not ( = ?auto_424152 ?auto_424153 ) ) ( not ( = ?auto_424152 ?auto_424154 ) ) ( not ( = ?auto_424152 ?auto_424155 ) ) ( not ( = ?auto_424152 ?auto_424156 ) ) ( not ( = ?auto_424153 ?auto_424154 ) ) ( not ( = ?auto_424153 ?auto_424155 ) ) ( not ( = ?auto_424153 ?auto_424156 ) ) ( not ( = ?auto_424154 ?auto_424155 ) ) ( not ( = ?auto_424154 ?auto_424156 ) ) ( not ( = ?auto_424155 ?auto_424156 ) ) ( CLEAR ?auto_424153 ) ( ON ?auto_424154 ?auto_424155 ) ( CLEAR ?auto_424154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_424147 ?auto_424148 ?auto_424149 ?auto_424150 ?auto_424151 ?auto_424152 ?auto_424153 ?auto_424154 )
      ( MAKE-9PILE ?auto_424147 ?auto_424148 ?auto_424149 ?auto_424150 ?auto_424151 ?auto_424152 ?auto_424153 ?auto_424154 ?auto_424155 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_424166 - BLOCK
      ?auto_424167 - BLOCK
      ?auto_424168 - BLOCK
      ?auto_424169 - BLOCK
      ?auto_424170 - BLOCK
      ?auto_424171 - BLOCK
      ?auto_424172 - BLOCK
      ?auto_424173 - BLOCK
      ?auto_424174 - BLOCK
    )
    :vars
    (
      ?auto_424175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424174 ?auto_424175 ) ( ON-TABLE ?auto_424166 ) ( ON ?auto_424167 ?auto_424166 ) ( ON ?auto_424168 ?auto_424167 ) ( ON ?auto_424169 ?auto_424168 ) ( ON ?auto_424170 ?auto_424169 ) ( ON ?auto_424171 ?auto_424170 ) ( ON ?auto_424172 ?auto_424171 ) ( not ( = ?auto_424166 ?auto_424167 ) ) ( not ( = ?auto_424166 ?auto_424168 ) ) ( not ( = ?auto_424166 ?auto_424169 ) ) ( not ( = ?auto_424166 ?auto_424170 ) ) ( not ( = ?auto_424166 ?auto_424171 ) ) ( not ( = ?auto_424166 ?auto_424172 ) ) ( not ( = ?auto_424166 ?auto_424173 ) ) ( not ( = ?auto_424166 ?auto_424174 ) ) ( not ( = ?auto_424166 ?auto_424175 ) ) ( not ( = ?auto_424167 ?auto_424168 ) ) ( not ( = ?auto_424167 ?auto_424169 ) ) ( not ( = ?auto_424167 ?auto_424170 ) ) ( not ( = ?auto_424167 ?auto_424171 ) ) ( not ( = ?auto_424167 ?auto_424172 ) ) ( not ( = ?auto_424167 ?auto_424173 ) ) ( not ( = ?auto_424167 ?auto_424174 ) ) ( not ( = ?auto_424167 ?auto_424175 ) ) ( not ( = ?auto_424168 ?auto_424169 ) ) ( not ( = ?auto_424168 ?auto_424170 ) ) ( not ( = ?auto_424168 ?auto_424171 ) ) ( not ( = ?auto_424168 ?auto_424172 ) ) ( not ( = ?auto_424168 ?auto_424173 ) ) ( not ( = ?auto_424168 ?auto_424174 ) ) ( not ( = ?auto_424168 ?auto_424175 ) ) ( not ( = ?auto_424169 ?auto_424170 ) ) ( not ( = ?auto_424169 ?auto_424171 ) ) ( not ( = ?auto_424169 ?auto_424172 ) ) ( not ( = ?auto_424169 ?auto_424173 ) ) ( not ( = ?auto_424169 ?auto_424174 ) ) ( not ( = ?auto_424169 ?auto_424175 ) ) ( not ( = ?auto_424170 ?auto_424171 ) ) ( not ( = ?auto_424170 ?auto_424172 ) ) ( not ( = ?auto_424170 ?auto_424173 ) ) ( not ( = ?auto_424170 ?auto_424174 ) ) ( not ( = ?auto_424170 ?auto_424175 ) ) ( not ( = ?auto_424171 ?auto_424172 ) ) ( not ( = ?auto_424171 ?auto_424173 ) ) ( not ( = ?auto_424171 ?auto_424174 ) ) ( not ( = ?auto_424171 ?auto_424175 ) ) ( not ( = ?auto_424172 ?auto_424173 ) ) ( not ( = ?auto_424172 ?auto_424174 ) ) ( not ( = ?auto_424172 ?auto_424175 ) ) ( not ( = ?auto_424173 ?auto_424174 ) ) ( not ( = ?auto_424173 ?auto_424175 ) ) ( not ( = ?auto_424174 ?auto_424175 ) ) ( CLEAR ?auto_424172 ) ( ON ?auto_424173 ?auto_424174 ) ( CLEAR ?auto_424173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_424166 ?auto_424167 ?auto_424168 ?auto_424169 ?auto_424170 ?auto_424171 ?auto_424172 ?auto_424173 )
      ( MAKE-9PILE ?auto_424166 ?auto_424167 ?auto_424168 ?auto_424169 ?auto_424170 ?auto_424171 ?auto_424172 ?auto_424173 ?auto_424174 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_424185 - BLOCK
      ?auto_424186 - BLOCK
      ?auto_424187 - BLOCK
      ?auto_424188 - BLOCK
      ?auto_424189 - BLOCK
      ?auto_424190 - BLOCK
      ?auto_424191 - BLOCK
      ?auto_424192 - BLOCK
      ?auto_424193 - BLOCK
    )
    :vars
    (
      ?auto_424194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424193 ?auto_424194 ) ( ON-TABLE ?auto_424185 ) ( ON ?auto_424186 ?auto_424185 ) ( ON ?auto_424187 ?auto_424186 ) ( ON ?auto_424188 ?auto_424187 ) ( ON ?auto_424189 ?auto_424188 ) ( ON ?auto_424190 ?auto_424189 ) ( not ( = ?auto_424185 ?auto_424186 ) ) ( not ( = ?auto_424185 ?auto_424187 ) ) ( not ( = ?auto_424185 ?auto_424188 ) ) ( not ( = ?auto_424185 ?auto_424189 ) ) ( not ( = ?auto_424185 ?auto_424190 ) ) ( not ( = ?auto_424185 ?auto_424191 ) ) ( not ( = ?auto_424185 ?auto_424192 ) ) ( not ( = ?auto_424185 ?auto_424193 ) ) ( not ( = ?auto_424185 ?auto_424194 ) ) ( not ( = ?auto_424186 ?auto_424187 ) ) ( not ( = ?auto_424186 ?auto_424188 ) ) ( not ( = ?auto_424186 ?auto_424189 ) ) ( not ( = ?auto_424186 ?auto_424190 ) ) ( not ( = ?auto_424186 ?auto_424191 ) ) ( not ( = ?auto_424186 ?auto_424192 ) ) ( not ( = ?auto_424186 ?auto_424193 ) ) ( not ( = ?auto_424186 ?auto_424194 ) ) ( not ( = ?auto_424187 ?auto_424188 ) ) ( not ( = ?auto_424187 ?auto_424189 ) ) ( not ( = ?auto_424187 ?auto_424190 ) ) ( not ( = ?auto_424187 ?auto_424191 ) ) ( not ( = ?auto_424187 ?auto_424192 ) ) ( not ( = ?auto_424187 ?auto_424193 ) ) ( not ( = ?auto_424187 ?auto_424194 ) ) ( not ( = ?auto_424188 ?auto_424189 ) ) ( not ( = ?auto_424188 ?auto_424190 ) ) ( not ( = ?auto_424188 ?auto_424191 ) ) ( not ( = ?auto_424188 ?auto_424192 ) ) ( not ( = ?auto_424188 ?auto_424193 ) ) ( not ( = ?auto_424188 ?auto_424194 ) ) ( not ( = ?auto_424189 ?auto_424190 ) ) ( not ( = ?auto_424189 ?auto_424191 ) ) ( not ( = ?auto_424189 ?auto_424192 ) ) ( not ( = ?auto_424189 ?auto_424193 ) ) ( not ( = ?auto_424189 ?auto_424194 ) ) ( not ( = ?auto_424190 ?auto_424191 ) ) ( not ( = ?auto_424190 ?auto_424192 ) ) ( not ( = ?auto_424190 ?auto_424193 ) ) ( not ( = ?auto_424190 ?auto_424194 ) ) ( not ( = ?auto_424191 ?auto_424192 ) ) ( not ( = ?auto_424191 ?auto_424193 ) ) ( not ( = ?auto_424191 ?auto_424194 ) ) ( not ( = ?auto_424192 ?auto_424193 ) ) ( not ( = ?auto_424192 ?auto_424194 ) ) ( not ( = ?auto_424193 ?auto_424194 ) ) ( ON ?auto_424192 ?auto_424193 ) ( CLEAR ?auto_424190 ) ( ON ?auto_424191 ?auto_424192 ) ( CLEAR ?auto_424191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_424185 ?auto_424186 ?auto_424187 ?auto_424188 ?auto_424189 ?auto_424190 ?auto_424191 )
      ( MAKE-9PILE ?auto_424185 ?auto_424186 ?auto_424187 ?auto_424188 ?auto_424189 ?auto_424190 ?auto_424191 ?auto_424192 ?auto_424193 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_424204 - BLOCK
      ?auto_424205 - BLOCK
      ?auto_424206 - BLOCK
      ?auto_424207 - BLOCK
      ?auto_424208 - BLOCK
      ?auto_424209 - BLOCK
      ?auto_424210 - BLOCK
      ?auto_424211 - BLOCK
      ?auto_424212 - BLOCK
    )
    :vars
    (
      ?auto_424213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424212 ?auto_424213 ) ( ON-TABLE ?auto_424204 ) ( ON ?auto_424205 ?auto_424204 ) ( ON ?auto_424206 ?auto_424205 ) ( ON ?auto_424207 ?auto_424206 ) ( ON ?auto_424208 ?auto_424207 ) ( ON ?auto_424209 ?auto_424208 ) ( not ( = ?auto_424204 ?auto_424205 ) ) ( not ( = ?auto_424204 ?auto_424206 ) ) ( not ( = ?auto_424204 ?auto_424207 ) ) ( not ( = ?auto_424204 ?auto_424208 ) ) ( not ( = ?auto_424204 ?auto_424209 ) ) ( not ( = ?auto_424204 ?auto_424210 ) ) ( not ( = ?auto_424204 ?auto_424211 ) ) ( not ( = ?auto_424204 ?auto_424212 ) ) ( not ( = ?auto_424204 ?auto_424213 ) ) ( not ( = ?auto_424205 ?auto_424206 ) ) ( not ( = ?auto_424205 ?auto_424207 ) ) ( not ( = ?auto_424205 ?auto_424208 ) ) ( not ( = ?auto_424205 ?auto_424209 ) ) ( not ( = ?auto_424205 ?auto_424210 ) ) ( not ( = ?auto_424205 ?auto_424211 ) ) ( not ( = ?auto_424205 ?auto_424212 ) ) ( not ( = ?auto_424205 ?auto_424213 ) ) ( not ( = ?auto_424206 ?auto_424207 ) ) ( not ( = ?auto_424206 ?auto_424208 ) ) ( not ( = ?auto_424206 ?auto_424209 ) ) ( not ( = ?auto_424206 ?auto_424210 ) ) ( not ( = ?auto_424206 ?auto_424211 ) ) ( not ( = ?auto_424206 ?auto_424212 ) ) ( not ( = ?auto_424206 ?auto_424213 ) ) ( not ( = ?auto_424207 ?auto_424208 ) ) ( not ( = ?auto_424207 ?auto_424209 ) ) ( not ( = ?auto_424207 ?auto_424210 ) ) ( not ( = ?auto_424207 ?auto_424211 ) ) ( not ( = ?auto_424207 ?auto_424212 ) ) ( not ( = ?auto_424207 ?auto_424213 ) ) ( not ( = ?auto_424208 ?auto_424209 ) ) ( not ( = ?auto_424208 ?auto_424210 ) ) ( not ( = ?auto_424208 ?auto_424211 ) ) ( not ( = ?auto_424208 ?auto_424212 ) ) ( not ( = ?auto_424208 ?auto_424213 ) ) ( not ( = ?auto_424209 ?auto_424210 ) ) ( not ( = ?auto_424209 ?auto_424211 ) ) ( not ( = ?auto_424209 ?auto_424212 ) ) ( not ( = ?auto_424209 ?auto_424213 ) ) ( not ( = ?auto_424210 ?auto_424211 ) ) ( not ( = ?auto_424210 ?auto_424212 ) ) ( not ( = ?auto_424210 ?auto_424213 ) ) ( not ( = ?auto_424211 ?auto_424212 ) ) ( not ( = ?auto_424211 ?auto_424213 ) ) ( not ( = ?auto_424212 ?auto_424213 ) ) ( ON ?auto_424211 ?auto_424212 ) ( CLEAR ?auto_424209 ) ( ON ?auto_424210 ?auto_424211 ) ( CLEAR ?auto_424210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_424204 ?auto_424205 ?auto_424206 ?auto_424207 ?auto_424208 ?auto_424209 ?auto_424210 )
      ( MAKE-9PILE ?auto_424204 ?auto_424205 ?auto_424206 ?auto_424207 ?auto_424208 ?auto_424209 ?auto_424210 ?auto_424211 ?auto_424212 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_424223 - BLOCK
      ?auto_424224 - BLOCK
      ?auto_424225 - BLOCK
      ?auto_424226 - BLOCK
      ?auto_424227 - BLOCK
      ?auto_424228 - BLOCK
      ?auto_424229 - BLOCK
      ?auto_424230 - BLOCK
      ?auto_424231 - BLOCK
    )
    :vars
    (
      ?auto_424232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424231 ?auto_424232 ) ( ON-TABLE ?auto_424223 ) ( ON ?auto_424224 ?auto_424223 ) ( ON ?auto_424225 ?auto_424224 ) ( ON ?auto_424226 ?auto_424225 ) ( ON ?auto_424227 ?auto_424226 ) ( not ( = ?auto_424223 ?auto_424224 ) ) ( not ( = ?auto_424223 ?auto_424225 ) ) ( not ( = ?auto_424223 ?auto_424226 ) ) ( not ( = ?auto_424223 ?auto_424227 ) ) ( not ( = ?auto_424223 ?auto_424228 ) ) ( not ( = ?auto_424223 ?auto_424229 ) ) ( not ( = ?auto_424223 ?auto_424230 ) ) ( not ( = ?auto_424223 ?auto_424231 ) ) ( not ( = ?auto_424223 ?auto_424232 ) ) ( not ( = ?auto_424224 ?auto_424225 ) ) ( not ( = ?auto_424224 ?auto_424226 ) ) ( not ( = ?auto_424224 ?auto_424227 ) ) ( not ( = ?auto_424224 ?auto_424228 ) ) ( not ( = ?auto_424224 ?auto_424229 ) ) ( not ( = ?auto_424224 ?auto_424230 ) ) ( not ( = ?auto_424224 ?auto_424231 ) ) ( not ( = ?auto_424224 ?auto_424232 ) ) ( not ( = ?auto_424225 ?auto_424226 ) ) ( not ( = ?auto_424225 ?auto_424227 ) ) ( not ( = ?auto_424225 ?auto_424228 ) ) ( not ( = ?auto_424225 ?auto_424229 ) ) ( not ( = ?auto_424225 ?auto_424230 ) ) ( not ( = ?auto_424225 ?auto_424231 ) ) ( not ( = ?auto_424225 ?auto_424232 ) ) ( not ( = ?auto_424226 ?auto_424227 ) ) ( not ( = ?auto_424226 ?auto_424228 ) ) ( not ( = ?auto_424226 ?auto_424229 ) ) ( not ( = ?auto_424226 ?auto_424230 ) ) ( not ( = ?auto_424226 ?auto_424231 ) ) ( not ( = ?auto_424226 ?auto_424232 ) ) ( not ( = ?auto_424227 ?auto_424228 ) ) ( not ( = ?auto_424227 ?auto_424229 ) ) ( not ( = ?auto_424227 ?auto_424230 ) ) ( not ( = ?auto_424227 ?auto_424231 ) ) ( not ( = ?auto_424227 ?auto_424232 ) ) ( not ( = ?auto_424228 ?auto_424229 ) ) ( not ( = ?auto_424228 ?auto_424230 ) ) ( not ( = ?auto_424228 ?auto_424231 ) ) ( not ( = ?auto_424228 ?auto_424232 ) ) ( not ( = ?auto_424229 ?auto_424230 ) ) ( not ( = ?auto_424229 ?auto_424231 ) ) ( not ( = ?auto_424229 ?auto_424232 ) ) ( not ( = ?auto_424230 ?auto_424231 ) ) ( not ( = ?auto_424230 ?auto_424232 ) ) ( not ( = ?auto_424231 ?auto_424232 ) ) ( ON ?auto_424230 ?auto_424231 ) ( ON ?auto_424229 ?auto_424230 ) ( CLEAR ?auto_424227 ) ( ON ?auto_424228 ?auto_424229 ) ( CLEAR ?auto_424228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_424223 ?auto_424224 ?auto_424225 ?auto_424226 ?auto_424227 ?auto_424228 )
      ( MAKE-9PILE ?auto_424223 ?auto_424224 ?auto_424225 ?auto_424226 ?auto_424227 ?auto_424228 ?auto_424229 ?auto_424230 ?auto_424231 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_424242 - BLOCK
      ?auto_424243 - BLOCK
      ?auto_424244 - BLOCK
      ?auto_424245 - BLOCK
      ?auto_424246 - BLOCK
      ?auto_424247 - BLOCK
      ?auto_424248 - BLOCK
      ?auto_424249 - BLOCK
      ?auto_424250 - BLOCK
    )
    :vars
    (
      ?auto_424251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424250 ?auto_424251 ) ( ON-TABLE ?auto_424242 ) ( ON ?auto_424243 ?auto_424242 ) ( ON ?auto_424244 ?auto_424243 ) ( ON ?auto_424245 ?auto_424244 ) ( ON ?auto_424246 ?auto_424245 ) ( not ( = ?auto_424242 ?auto_424243 ) ) ( not ( = ?auto_424242 ?auto_424244 ) ) ( not ( = ?auto_424242 ?auto_424245 ) ) ( not ( = ?auto_424242 ?auto_424246 ) ) ( not ( = ?auto_424242 ?auto_424247 ) ) ( not ( = ?auto_424242 ?auto_424248 ) ) ( not ( = ?auto_424242 ?auto_424249 ) ) ( not ( = ?auto_424242 ?auto_424250 ) ) ( not ( = ?auto_424242 ?auto_424251 ) ) ( not ( = ?auto_424243 ?auto_424244 ) ) ( not ( = ?auto_424243 ?auto_424245 ) ) ( not ( = ?auto_424243 ?auto_424246 ) ) ( not ( = ?auto_424243 ?auto_424247 ) ) ( not ( = ?auto_424243 ?auto_424248 ) ) ( not ( = ?auto_424243 ?auto_424249 ) ) ( not ( = ?auto_424243 ?auto_424250 ) ) ( not ( = ?auto_424243 ?auto_424251 ) ) ( not ( = ?auto_424244 ?auto_424245 ) ) ( not ( = ?auto_424244 ?auto_424246 ) ) ( not ( = ?auto_424244 ?auto_424247 ) ) ( not ( = ?auto_424244 ?auto_424248 ) ) ( not ( = ?auto_424244 ?auto_424249 ) ) ( not ( = ?auto_424244 ?auto_424250 ) ) ( not ( = ?auto_424244 ?auto_424251 ) ) ( not ( = ?auto_424245 ?auto_424246 ) ) ( not ( = ?auto_424245 ?auto_424247 ) ) ( not ( = ?auto_424245 ?auto_424248 ) ) ( not ( = ?auto_424245 ?auto_424249 ) ) ( not ( = ?auto_424245 ?auto_424250 ) ) ( not ( = ?auto_424245 ?auto_424251 ) ) ( not ( = ?auto_424246 ?auto_424247 ) ) ( not ( = ?auto_424246 ?auto_424248 ) ) ( not ( = ?auto_424246 ?auto_424249 ) ) ( not ( = ?auto_424246 ?auto_424250 ) ) ( not ( = ?auto_424246 ?auto_424251 ) ) ( not ( = ?auto_424247 ?auto_424248 ) ) ( not ( = ?auto_424247 ?auto_424249 ) ) ( not ( = ?auto_424247 ?auto_424250 ) ) ( not ( = ?auto_424247 ?auto_424251 ) ) ( not ( = ?auto_424248 ?auto_424249 ) ) ( not ( = ?auto_424248 ?auto_424250 ) ) ( not ( = ?auto_424248 ?auto_424251 ) ) ( not ( = ?auto_424249 ?auto_424250 ) ) ( not ( = ?auto_424249 ?auto_424251 ) ) ( not ( = ?auto_424250 ?auto_424251 ) ) ( ON ?auto_424249 ?auto_424250 ) ( ON ?auto_424248 ?auto_424249 ) ( CLEAR ?auto_424246 ) ( ON ?auto_424247 ?auto_424248 ) ( CLEAR ?auto_424247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_424242 ?auto_424243 ?auto_424244 ?auto_424245 ?auto_424246 ?auto_424247 )
      ( MAKE-9PILE ?auto_424242 ?auto_424243 ?auto_424244 ?auto_424245 ?auto_424246 ?auto_424247 ?auto_424248 ?auto_424249 ?auto_424250 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_424261 - BLOCK
      ?auto_424262 - BLOCK
      ?auto_424263 - BLOCK
      ?auto_424264 - BLOCK
      ?auto_424265 - BLOCK
      ?auto_424266 - BLOCK
      ?auto_424267 - BLOCK
      ?auto_424268 - BLOCK
      ?auto_424269 - BLOCK
    )
    :vars
    (
      ?auto_424270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424269 ?auto_424270 ) ( ON-TABLE ?auto_424261 ) ( ON ?auto_424262 ?auto_424261 ) ( ON ?auto_424263 ?auto_424262 ) ( ON ?auto_424264 ?auto_424263 ) ( not ( = ?auto_424261 ?auto_424262 ) ) ( not ( = ?auto_424261 ?auto_424263 ) ) ( not ( = ?auto_424261 ?auto_424264 ) ) ( not ( = ?auto_424261 ?auto_424265 ) ) ( not ( = ?auto_424261 ?auto_424266 ) ) ( not ( = ?auto_424261 ?auto_424267 ) ) ( not ( = ?auto_424261 ?auto_424268 ) ) ( not ( = ?auto_424261 ?auto_424269 ) ) ( not ( = ?auto_424261 ?auto_424270 ) ) ( not ( = ?auto_424262 ?auto_424263 ) ) ( not ( = ?auto_424262 ?auto_424264 ) ) ( not ( = ?auto_424262 ?auto_424265 ) ) ( not ( = ?auto_424262 ?auto_424266 ) ) ( not ( = ?auto_424262 ?auto_424267 ) ) ( not ( = ?auto_424262 ?auto_424268 ) ) ( not ( = ?auto_424262 ?auto_424269 ) ) ( not ( = ?auto_424262 ?auto_424270 ) ) ( not ( = ?auto_424263 ?auto_424264 ) ) ( not ( = ?auto_424263 ?auto_424265 ) ) ( not ( = ?auto_424263 ?auto_424266 ) ) ( not ( = ?auto_424263 ?auto_424267 ) ) ( not ( = ?auto_424263 ?auto_424268 ) ) ( not ( = ?auto_424263 ?auto_424269 ) ) ( not ( = ?auto_424263 ?auto_424270 ) ) ( not ( = ?auto_424264 ?auto_424265 ) ) ( not ( = ?auto_424264 ?auto_424266 ) ) ( not ( = ?auto_424264 ?auto_424267 ) ) ( not ( = ?auto_424264 ?auto_424268 ) ) ( not ( = ?auto_424264 ?auto_424269 ) ) ( not ( = ?auto_424264 ?auto_424270 ) ) ( not ( = ?auto_424265 ?auto_424266 ) ) ( not ( = ?auto_424265 ?auto_424267 ) ) ( not ( = ?auto_424265 ?auto_424268 ) ) ( not ( = ?auto_424265 ?auto_424269 ) ) ( not ( = ?auto_424265 ?auto_424270 ) ) ( not ( = ?auto_424266 ?auto_424267 ) ) ( not ( = ?auto_424266 ?auto_424268 ) ) ( not ( = ?auto_424266 ?auto_424269 ) ) ( not ( = ?auto_424266 ?auto_424270 ) ) ( not ( = ?auto_424267 ?auto_424268 ) ) ( not ( = ?auto_424267 ?auto_424269 ) ) ( not ( = ?auto_424267 ?auto_424270 ) ) ( not ( = ?auto_424268 ?auto_424269 ) ) ( not ( = ?auto_424268 ?auto_424270 ) ) ( not ( = ?auto_424269 ?auto_424270 ) ) ( ON ?auto_424268 ?auto_424269 ) ( ON ?auto_424267 ?auto_424268 ) ( ON ?auto_424266 ?auto_424267 ) ( CLEAR ?auto_424264 ) ( ON ?auto_424265 ?auto_424266 ) ( CLEAR ?auto_424265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_424261 ?auto_424262 ?auto_424263 ?auto_424264 ?auto_424265 )
      ( MAKE-9PILE ?auto_424261 ?auto_424262 ?auto_424263 ?auto_424264 ?auto_424265 ?auto_424266 ?auto_424267 ?auto_424268 ?auto_424269 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_424280 - BLOCK
      ?auto_424281 - BLOCK
      ?auto_424282 - BLOCK
      ?auto_424283 - BLOCK
      ?auto_424284 - BLOCK
      ?auto_424285 - BLOCK
      ?auto_424286 - BLOCK
      ?auto_424287 - BLOCK
      ?auto_424288 - BLOCK
    )
    :vars
    (
      ?auto_424289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424288 ?auto_424289 ) ( ON-TABLE ?auto_424280 ) ( ON ?auto_424281 ?auto_424280 ) ( ON ?auto_424282 ?auto_424281 ) ( ON ?auto_424283 ?auto_424282 ) ( not ( = ?auto_424280 ?auto_424281 ) ) ( not ( = ?auto_424280 ?auto_424282 ) ) ( not ( = ?auto_424280 ?auto_424283 ) ) ( not ( = ?auto_424280 ?auto_424284 ) ) ( not ( = ?auto_424280 ?auto_424285 ) ) ( not ( = ?auto_424280 ?auto_424286 ) ) ( not ( = ?auto_424280 ?auto_424287 ) ) ( not ( = ?auto_424280 ?auto_424288 ) ) ( not ( = ?auto_424280 ?auto_424289 ) ) ( not ( = ?auto_424281 ?auto_424282 ) ) ( not ( = ?auto_424281 ?auto_424283 ) ) ( not ( = ?auto_424281 ?auto_424284 ) ) ( not ( = ?auto_424281 ?auto_424285 ) ) ( not ( = ?auto_424281 ?auto_424286 ) ) ( not ( = ?auto_424281 ?auto_424287 ) ) ( not ( = ?auto_424281 ?auto_424288 ) ) ( not ( = ?auto_424281 ?auto_424289 ) ) ( not ( = ?auto_424282 ?auto_424283 ) ) ( not ( = ?auto_424282 ?auto_424284 ) ) ( not ( = ?auto_424282 ?auto_424285 ) ) ( not ( = ?auto_424282 ?auto_424286 ) ) ( not ( = ?auto_424282 ?auto_424287 ) ) ( not ( = ?auto_424282 ?auto_424288 ) ) ( not ( = ?auto_424282 ?auto_424289 ) ) ( not ( = ?auto_424283 ?auto_424284 ) ) ( not ( = ?auto_424283 ?auto_424285 ) ) ( not ( = ?auto_424283 ?auto_424286 ) ) ( not ( = ?auto_424283 ?auto_424287 ) ) ( not ( = ?auto_424283 ?auto_424288 ) ) ( not ( = ?auto_424283 ?auto_424289 ) ) ( not ( = ?auto_424284 ?auto_424285 ) ) ( not ( = ?auto_424284 ?auto_424286 ) ) ( not ( = ?auto_424284 ?auto_424287 ) ) ( not ( = ?auto_424284 ?auto_424288 ) ) ( not ( = ?auto_424284 ?auto_424289 ) ) ( not ( = ?auto_424285 ?auto_424286 ) ) ( not ( = ?auto_424285 ?auto_424287 ) ) ( not ( = ?auto_424285 ?auto_424288 ) ) ( not ( = ?auto_424285 ?auto_424289 ) ) ( not ( = ?auto_424286 ?auto_424287 ) ) ( not ( = ?auto_424286 ?auto_424288 ) ) ( not ( = ?auto_424286 ?auto_424289 ) ) ( not ( = ?auto_424287 ?auto_424288 ) ) ( not ( = ?auto_424287 ?auto_424289 ) ) ( not ( = ?auto_424288 ?auto_424289 ) ) ( ON ?auto_424287 ?auto_424288 ) ( ON ?auto_424286 ?auto_424287 ) ( ON ?auto_424285 ?auto_424286 ) ( CLEAR ?auto_424283 ) ( ON ?auto_424284 ?auto_424285 ) ( CLEAR ?auto_424284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_424280 ?auto_424281 ?auto_424282 ?auto_424283 ?auto_424284 )
      ( MAKE-9PILE ?auto_424280 ?auto_424281 ?auto_424282 ?auto_424283 ?auto_424284 ?auto_424285 ?auto_424286 ?auto_424287 ?auto_424288 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_424299 - BLOCK
      ?auto_424300 - BLOCK
      ?auto_424301 - BLOCK
      ?auto_424302 - BLOCK
      ?auto_424303 - BLOCK
      ?auto_424304 - BLOCK
      ?auto_424305 - BLOCK
      ?auto_424306 - BLOCK
      ?auto_424307 - BLOCK
    )
    :vars
    (
      ?auto_424308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424307 ?auto_424308 ) ( ON-TABLE ?auto_424299 ) ( ON ?auto_424300 ?auto_424299 ) ( ON ?auto_424301 ?auto_424300 ) ( not ( = ?auto_424299 ?auto_424300 ) ) ( not ( = ?auto_424299 ?auto_424301 ) ) ( not ( = ?auto_424299 ?auto_424302 ) ) ( not ( = ?auto_424299 ?auto_424303 ) ) ( not ( = ?auto_424299 ?auto_424304 ) ) ( not ( = ?auto_424299 ?auto_424305 ) ) ( not ( = ?auto_424299 ?auto_424306 ) ) ( not ( = ?auto_424299 ?auto_424307 ) ) ( not ( = ?auto_424299 ?auto_424308 ) ) ( not ( = ?auto_424300 ?auto_424301 ) ) ( not ( = ?auto_424300 ?auto_424302 ) ) ( not ( = ?auto_424300 ?auto_424303 ) ) ( not ( = ?auto_424300 ?auto_424304 ) ) ( not ( = ?auto_424300 ?auto_424305 ) ) ( not ( = ?auto_424300 ?auto_424306 ) ) ( not ( = ?auto_424300 ?auto_424307 ) ) ( not ( = ?auto_424300 ?auto_424308 ) ) ( not ( = ?auto_424301 ?auto_424302 ) ) ( not ( = ?auto_424301 ?auto_424303 ) ) ( not ( = ?auto_424301 ?auto_424304 ) ) ( not ( = ?auto_424301 ?auto_424305 ) ) ( not ( = ?auto_424301 ?auto_424306 ) ) ( not ( = ?auto_424301 ?auto_424307 ) ) ( not ( = ?auto_424301 ?auto_424308 ) ) ( not ( = ?auto_424302 ?auto_424303 ) ) ( not ( = ?auto_424302 ?auto_424304 ) ) ( not ( = ?auto_424302 ?auto_424305 ) ) ( not ( = ?auto_424302 ?auto_424306 ) ) ( not ( = ?auto_424302 ?auto_424307 ) ) ( not ( = ?auto_424302 ?auto_424308 ) ) ( not ( = ?auto_424303 ?auto_424304 ) ) ( not ( = ?auto_424303 ?auto_424305 ) ) ( not ( = ?auto_424303 ?auto_424306 ) ) ( not ( = ?auto_424303 ?auto_424307 ) ) ( not ( = ?auto_424303 ?auto_424308 ) ) ( not ( = ?auto_424304 ?auto_424305 ) ) ( not ( = ?auto_424304 ?auto_424306 ) ) ( not ( = ?auto_424304 ?auto_424307 ) ) ( not ( = ?auto_424304 ?auto_424308 ) ) ( not ( = ?auto_424305 ?auto_424306 ) ) ( not ( = ?auto_424305 ?auto_424307 ) ) ( not ( = ?auto_424305 ?auto_424308 ) ) ( not ( = ?auto_424306 ?auto_424307 ) ) ( not ( = ?auto_424306 ?auto_424308 ) ) ( not ( = ?auto_424307 ?auto_424308 ) ) ( ON ?auto_424306 ?auto_424307 ) ( ON ?auto_424305 ?auto_424306 ) ( ON ?auto_424304 ?auto_424305 ) ( ON ?auto_424303 ?auto_424304 ) ( CLEAR ?auto_424301 ) ( ON ?auto_424302 ?auto_424303 ) ( CLEAR ?auto_424302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_424299 ?auto_424300 ?auto_424301 ?auto_424302 )
      ( MAKE-9PILE ?auto_424299 ?auto_424300 ?auto_424301 ?auto_424302 ?auto_424303 ?auto_424304 ?auto_424305 ?auto_424306 ?auto_424307 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_424318 - BLOCK
      ?auto_424319 - BLOCK
      ?auto_424320 - BLOCK
      ?auto_424321 - BLOCK
      ?auto_424322 - BLOCK
      ?auto_424323 - BLOCK
      ?auto_424324 - BLOCK
      ?auto_424325 - BLOCK
      ?auto_424326 - BLOCK
    )
    :vars
    (
      ?auto_424327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424326 ?auto_424327 ) ( ON-TABLE ?auto_424318 ) ( ON ?auto_424319 ?auto_424318 ) ( ON ?auto_424320 ?auto_424319 ) ( not ( = ?auto_424318 ?auto_424319 ) ) ( not ( = ?auto_424318 ?auto_424320 ) ) ( not ( = ?auto_424318 ?auto_424321 ) ) ( not ( = ?auto_424318 ?auto_424322 ) ) ( not ( = ?auto_424318 ?auto_424323 ) ) ( not ( = ?auto_424318 ?auto_424324 ) ) ( not ( = ?auto_424318 ?auto_424325 ) ) ( not ( = ?auto_424318 ?auto_424326 ) ) ( not ( = ?auto_424318 ?auto_424327 ) ) ( not ( = ?auto_424319 ?auto_424320 ) ) ( not ( = ?auto_424319 ?auto_424321 ) ) ( not ( = ?auto_424319 ?auto_424322 ) ) ( not ( = ?auto_424319 ?auto_424323 ) ) ( not ( = ?auto_424319 ?auto_424324 ) ) ( not ( = ?auto_424319 ?auto_424325 ) ) ( not ( = ?auto_424319 ?auto_424326 ) ) ( not ( = ?auto_424319 ?auto_424327 ) ) ( not ( = ?auto_424320 ?auto_424321 ) ) ( not ( = ?auto_424320 ?auto_424322 ) ) ( not ( = ?auto_424320 ?auto_424323 ) ) ( not ( = ?auto_424320 ?auto_424324 ) ) ( not ( = ?auto_424320 ?auto_424325 ) ) ( not ( = ?auto_424320 ?auto_424326 ) ) ( not ( = ?auto_424320 ?auto_424327 ) ) ( not ( = ?auto_424321 ?auto_424322 ) ) ( not ( = ?auto_424321 ?auto_424323 ) ) ( not ( = ?auto_424321 ?auto_424324 ) ) ( not ( = ?auto_424321 ?auto_424325 ) ) ( not ( = ?auto_424321 ?auto_424326 ) ) ( not ( = ?auto_424321 ?auto_424327 ) ) ( not ( = ?auto_424322 ?auto_424323 ) ) ( not ( = ?auto_424322 ?auto_424324 ) ) ( not ( = ?auto_424322 ?auto_424325 ) ) ( not ( = ?auto_424322 ?auto_424326 ) ) ( not ( = ?auto_424322 ?auto_424327 ) ) ( not ( = ?auto_424323 ?auto_424324 ) ) ( not ( = ?auto_424323 ?auto_424325 ) ) ( not ( = ?auto_424323 ?auto_424326 ) ) ( not ( = ?auto_424323 ?auto_424327 ) ) ( not ( = ?auto_424324 ?auto_424325 ) ) ( not ( = ?auto_424324 ?auto_424326 ) ) ( not ( = ?auto_424324 ?auto_424327 ) ) ( not ( = ?auto_424325 ?auto_424326 ) ) ( not ( = ?auto_424325 ?auto_424327 ) ) ( not ( = ?auto_424326 ?auto_424327 ) ) ( ON ?auto_424325 ?auto_424326 ) ( ON ?auto_424324 ?auto_424325 ) ( ON ?auto_424323 ?auto_424324 ) ( ON ?auto_424322 ?auto_424323 ) ( CLEAR ?auto_424320 ) ( ON ?auto_424321 ?auto_424322 ) ( CLEAR ?auto_424321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_424318 ?auto_424319 ?auto_424320 ?auto_424321 )
      ( MAKE-9PILE ?auto_424318 ?auto_424319 ?auto_424320 ?auto_424321 ?auto_424322 ?auto_424323 ?auto_424324 ?auto_424325 ?auto_424326 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_424337 - BLOCK
      ?auto_424338 - BLOCK
      ?auto_424339 - BLOCK
      ?auto_424340 - BLOCK
      ?auto_424341 - BLOCK
      ?auto_424342 - BLOCK
      ?auto_424343 - BLOCK
      ?auto_424344 - BLOCK
      ?auto_424345 - BLOCK
    )
    :vars
    (
      ?auto_424346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424345 ?auto_424346 ) ( ON-TABLE ?auto_424337 ) ( ON ?auto_424338 ?auto_424337 ) ( not ( = ?auto_424337 ?auto_424338 ) ) ( not ( = ?auto_424337 ?auto_424339 ) ) ( not ( = ?auto_424337 ?auto_424340 ) ) ( not ( = ?auto_424337 ?auto_424341 ) ) ( not ( = ?auto_424337 ?auto_424342 ) ) ( not ( = ?auto_424337 ?auto_424343 ) ) ( not ( = ?auto_424337 ?auto_424344 ) ) ( not ( = ?auto_424337 ?auto_424345 ) ) ( not ( = ?auto_424337 ?auto_424346 ) ) ( not ( = ?auto_424338 ?auto_424339 ) ) ( not ( = ?auto_424338 ?auto_424340 ) ) ( not ( = ?auto_424338 ?auto_424341 ) ) ( not ( = ?auto_424338 ?auto_424342 ) ) ( not ( = ?auto_424338 ?auto_424343 ) ) ( not ( = ?auto_424338 ?auto_424344 ) ) ( not ( = ?auto_424338 ?auto_424345 ) ) ( not ( = ?auto_424338 ?auto_424346 ) ) ( not ( = ?auto_424339 ?auto_424340 ) ) ( not ( = ?auto_424339 ?auto_424341 ) ) ( not ( = ?auto_424339 ?auto_424342 ) ) ( not ( = ?auto_424339 ?auto_424343 ) ) ( not ( = ?auto_424339 ?auto_424344 ) ) ( not ( = ?auto_424339 ?auto_424345 ) ) ( not ( = ?auto_424339 ?auto_424346 ) ) ( not ( = ?auto_424340 ?auto_424341 ) ) ( not ( = ?auto_424340 ?auto_424342 ) ) ( not ( = ?auto_424340 ?auto_424343 ) ) ( not ( = ?auto_424340 ?auto_424344 ) ) ( not ( = ?auto_424340 ?auto_424345 ) ) ( not ( = ?auto_424340 ?auto_424346 ) ) ( not ( = ?auto_424341 ?auto_424342 ) ) ( not ( = ?auto_424341 ?auto_424343 ) ) ( not ( = ?auto_424341 ?auto_424344 ) ) ( not ( = ?auto_424341 ?auto_424345 ) ) ( not ( = ?auto_424341 ?auto_424346 ) ) ( not ( = ?auto_424342 ?auto_424343 ) ) ( not ( = ?auto_424342 ?auto_424344 ) ) ( not ( = ?auto_424342 ?auto_424345 ) ) ( not ( = ?auto_424342 ?auto_424346 ) ) ( not ( = ?auto_424343 ?auto_424344 ) ) ( not ( = ?auto_424343 ?auto_424345 ) ) ( not ( = ?auto_424343 ?auto_424346 ) ) ( not ( = ?auto_424344 ?auto_424345 ) ) ( not ( = ?auto_424344 ?auto_424346 ) ) ( not ( = ?auto_424345 ?auto_424346 ) ) ( ON ?auto_424344 ?auto_424345 ) ( ON ?auto_424343 ?auto_424344 ) ( ON ?auto_424342 ?auto_424343 ) ( ON ?auto_424341 ?auto_424342 ) ( ON ?auto_424340 ?auto_424341 ) ( CLEAR ?auto_424338 ) ( ON ?auto_424339 ?auto_424340 ) ( CLEAR ?auto_424339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_424337 ?auto_424338 ?auto_424339 )
      ( MAKE-9PILE ?auto_424337 ?auto_424338 ?auto_424339 ?auto_424340 ?auto_424341 ?auto_424342 ?auto_424343 ?auto_424344 ?auto_424345 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_424356 - BLOCK
      ?auto_424357 - BLOCK
      ?auto_424358 - BLOCK
      ?auto_424359 - BLOCK
      ?auto_424360 - BLOCK
      ?auto_424361 - BLOCK
      ?auto_424362 - BLOCK
      ?auto_424363 - BLOCK
      ?auto_424364 - BLOCK
    )
    :vars
    (
      ?auto_424365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424364 ?auto_424365 ) ( ON-TABLE ?auto_424356 ) ( ON ?auto_424357 ?auto_424356 ) ( not ( = ?auto_424356 ?auto_424357 ) ) ( not ( = ?auto_424356 ?auto_424358 ) ) ( not ( = ?auto_424356 ?auto_424359 ) ) ( not ( = ?auto_424356 ?auto_424360 ) ) ( not ( = ?auto_424356 ?auto_424361 ) ) ( not ( = ?auto_424356 ?auto_424362 ) ) ( not ( = ?auto_424356 ?auto_424363 ) ) ( not ( = ?auto_424356 ?auto_424364 ) ) ( not ( = ?auto_424356 ?auto_424365 ) ) ( not ( = ?auto_424357 ?auto_424358 ) ) ( not ( = ?auto_424357 ?auto_424359 ) ) ( not ( = ?auto_424357 ?auto_424360 ) ) ( not ( = ?auto_424357 ?auto_424361 ) ) ( not ( = ?auto_424357 ?auto_424362 ) ) ( not ( = ?auto_424357 ?auto_424363 ) ) ( not ( = ?auto_424357 ?auto_424364 ) ) ( not ( = ?auto_424357 ?auto_424365 ) ) ( not ( = ?auto_424358 ?auto_424359 ) ) ( not ( = ?auto_424358 ?auto_424360 ) ) ( not ( = ?auto_424358 ?auto_424361 ) ) ( not ( = ?auto_424358 ?auto_424362 ) ) ( not ( = ?auto_424358 ?auto_424363 ) ) ( not ( = ?auto_424358 ?auto_424364 ) ) ( not ( = ?auto_424358 ?auto_424365 ) ) ( not ( = ?auto_424359 ?auto_424360 ) ) ( not ( = ?auto_424359 ?auto_424361 ) ) ( not ( = ?auto_424359 ?auto_424362 ) ) ( not ( = ?auto_424359 ?auto_424363 ) ) ( not ( = ?auto_424359 ?auto_424364 ) ) ( not ( = ?auto_424359 ?auto_424365 ) ) ( not ( = ?auto_424360 ?auto_424361 ) ) ( not ( = ?auto_424360 ?auto_424362 ) ) ( not ( = ?auto_424360 ?auto_424363 ) ) ( not ( = ?auto_424360 ?auto_424364 ) ) ( not ( = ?auto_424360 ?auto_424365 ) ) ( not ( = ?auto_424361 ?auto_424362 ) ) ( not ( = ?auto_424361 ?auto_424363 ) ) ( not ( = ?auto_424361 ?auto_424364 ) ) ( not ( = ?auto_424361 ?auto_424365 ) ) ( not ( = ?auto_424362 ?auto_424363 ) ) ( not ( = ?auto_424362 ?auto_424364 ) ) ( not ( = ?auto_424362 ?auto_424365 ) ) ( not ( = ?auto_424363 ?auto_424364 ) ) ( not ( = ?auto_424363 ?auto_424365 ) ) ( not ( = ?auto_424364 ?auto_424365 ) ) ( ON ?auto_424363 ?auto_424364 ) ( ON ?auto_424362 ?auto_424363 ) ( ON ?auto_424361 ?auto_424362 ) ( ON ?auto_424360 ?auto_424361 ) ( ON ?auto_424359 ?auto_424360 ) ( CLEAR ?auto_424357 ) ( ON ?auto_424358 ?auto_424359 ) ( CLEAR ?auto_424358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_424356 ?auto_424357 ?auto_424358 )
      ( MAKE-9PILE ?auto_424356 ?auto_424357 ?auto_424358 ?auto_424359 ?auto_424360 ?auto_424361 ?auto_424362 ?auto_424363 ?auto_424364 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_424375 - BLOCK
      ?auto_424376 - BLOCK
      ?auto_424377 - BLOCK
      ?auto_424378 - BLOCK
      ?auto_424379 - BLOCK
      ?auto_424380 - BLOCK
      ?auto_424381 - BLOCK
      ?auto_424382 - BLOCK
      ?auto_424383 - BLOCK
    )
    :vars
    (
      ?auto_424384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424383 ?auto_424384 ) ( ON-TABLE ?auto_424375 ) ( not ( = ?auto_424375 ?auto_424376 ) ) ( not ( = ?auto_424375 ?auto_424377 ) ) ( not ( = ?auto_424375 ?auto_424378 ) ) ( not ( = ?auto_424375 ?auto_424379 ) ) ( not ( = ?auto_424375 ?auto_424380 ) ) ( not ( = ?auto_424375 ?auto_424381 ) ) ( not ( = ?auto_424375 ?auto_424382 ) ) ( not ( = ?auto_424375 ?auto_424383 ) ) ( not ( = ?auto_424375 ?auto_424384 ) ) ( not ( = ?auto_424376 ?auto_424377 ) ) ( not ( = ?auto_424376 ?auto_424378 ) ) ( not ( = ?auto_424376 ?auto_424379 ) ) ( not ( = ?auto_424376 ?auto_424380 ) ) ( not ( = ?auto_424376 ?auto_424381 ) ) ( not ( = ?auto_424376 ?auto_424382 ) ) ( not ( = ?auto_424376 ?auto_424383 ) ) ( not ( = ?auto_424376 ?auto_424384 ) ) ( not ( = ?auto_424377 ?auto_424378 ) ) ( not ( = ?auto_424377 ?auto_424379 ) ) ( not ( = ?auto_424377 ?auto_424380 ) ) ( not ( = ?auto_424377 ?auto_424381 ) ) ( not ( = ?auto_424377 ?auto_424382 ) ) ( not ( = ?auto_424377 ?auto_424383 ) ) ( not ( = ?auto_424377 ?auto_424384 ) ) ( not ( = ?auto_424378 ?auto_424379 ) ) ( not ( = ?auto_424378 ?auto_424380 ) ) ( not ( = ?auto_424378 ?auto_424381 ) ) ( not ( = ?auto_424378 ?auto_424382 ) ) ( not ( = ?auto_424378 ?auto_424383 ) ) ( not ( = ?auto_424378 ?auto_424384 ) ) ( not ( = ?auto_424379 ?auto_424380 ) ) ( not ( = ?auto_424379 ?auto_424381 ) ) ( not ( = ?auto_424379 ?auto_424382 ) ) ( not ( = ?auto_424379 ?auto_424383 ) ) ( not ( = ?auto_424379 ?auto_424384 ) ) ( not ( = ?auto_424380 ?auto_424381 ) ) ( not ( = ?auto_424380 ?auto_424382 ) ) ( not ( = ?auto_424380 ?auto_424383 ) ) ( not ( = ?auto_424380 ?auto_424384 ) ) ( not ( = ?auto_424381 ?auto_424382 ) ) ( not ( = ?auto_424381 ?auto_424383 ) ) ( not ( = ?auto_424381 ?auto_424384 ) ) ( not ( = ?auto_424382 ?auto_424383 ) ) ( not ( = ?auto_424382 ?auto_424384 ) ) ( not ( = ?auto_424383 ?auto_424384 ) ) ( ON ?auto_424382 ?auto_424383 ) ( ON ?auto_424381 ?auto_424382 ) ( ON ?auto_424380 ?auto_424381 ) ( ON ?auto_424379 ?auto_424380 ) ( ON ?auto_424378 ?auto_424379 ) ( ON ?auto_424377 ?auto_424378 ) ( CLEAR ?auto_424375 ) ( ON ?auto_424376 ?auto_424377 ) ( CLEAR ?auto_424376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_424375 ?auto_424376 )
      ( MAKE-9PILE ?auto_424375 ?auto_424376 ?auto_424377 ?auto_424378 ?auto_424379 ?auto_424380 ?auto_424381 ?auto_424382 ?auto_424383 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_424394 - BLOCK
      ?auto_424395 - BLOCK
      ?auto_424396 - BLOCK
      ?auto_424397 - BLOCK
      ?auto_424398 - BLOCK
      ?auto_424399 - BLOCK
      ?auto_424400 - BLOCK
      ?auto_424401 - BLOCK
      ?auto_424402 - BLOCK
    )
    :vars
    (
      ?auto_424403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424402 ?auto_424403 ) ( ON-TABLE ?auto_424394 ) ( not ( = ?auto_424394 ?auto_424395 ) ) ( not ( = ?auto_424394 ?auto_424396 ) ) ( not ( = ?auto_424394 ?auto_424397 ) ) ( not ( = ?auto_424394 ?auto_424398 ) ) ( not ( = ?auto_424394 ?auto_424399 ) ) ( not ( = ?auto_424394 ?auto_424400 ) ) ( not ( = ?auto_424394 ?auto_424401 ) ) ( not ( = ?auto_424394 ?auto_424402 ) ) ( not ( = ?auto_424394 ?auto_424403 ) ) ( not ( = ?auto_424395 ?auto_424396 ) ) ( not ( = ?auto_424395 ?auto_424397 ) ) ( not ( = ?auto_424395 ?auto_424398 ) ) ( not ( = ?auto_424395 ?auto_424399 ) ) ( not ( = ?auto_424395 ?auto_424400 ) ) ( not ( = ?auto_424395 ?auto_424401 ) ) ( not ( = ?auto_424395 ?auto_424402 ) ) ( not ( = ?auto_424395 ?auto_424403 ) ) ( not ( = ?auto_424396 ?auto_424397 ) ) ( not ( = ?auto_424396 ?auto_424398 ) ) ( not ( = ?auto_424396 ?auto_424399 ) ) ( not ( = ?auto_424396 ?auto_424400 ) ) ( not ( = ?auto_424396 ?auto_424401 ) ) ( not ( = ?auto_424396 ?auto_424402 ) ) ( not ( = ?auto_424396 ?auto_424403 ) ) ( not ( = ?auto_424397 ?auto_424398 ) ) ( not ( = ?auto_424397 ?auto_424399 ) ) ( not ( = ?auto_424397 ?auto_424400 ) ) ( not ( = ?auto_424397 ?auto_424401 ) ) ( not ( = ?auto_424397 ?auto_424402 ) ) ( not ( = ?auto_424397 ?auto_424403 ) ) ( not ( = ?auto_424398 ?auto_424399 ) ) ( not ( = ?auto_424398 ?auto_424400 ) ) ( not ( = ?auto_424398 ?auto_424401 ) ) ( not ( = ?auto_424398 ?auto_424402 ) ) ( not ( = ?auto_424398 ?auto_424403 ) ) ( not ( = ?auto_424399 ?auto_424400 ) ) ( not ( = ?auto_424399 ?auto_424401 ) ) ( not ( = ?auto_424399 ?auto_424402 ) ) ( not ( = ?auto_424399 ?auto_424403 ) ) ( not ( = ?auto_424400 ?auto_424401 ) ) ( not ( = ?auto_424400 ?auto_424402 ) ) ( not ( = ?auto_424400 ?auto_424403 ) ) ( not ( = ?auto_424401 ?auto_424402 ) ) ( not ( = ?auto_424401 ?auto_424403 ) ) ( not ( = ?auto_424402 ?auto_424403 ) ) ( ON ?auto_424401 ?auto_424402 ) ( ON ?auto_424400 ?auto_424401 ) ( ON ?auto_424399 ?auto_424400 ) ( ON ?auto_424398 ?auto_424399 ) ( ON ?auto_424397 ?auto_424398 ) ( ON ?auto_424396 ?auto_424397 ) ( CLEAR ?auto_424394 ) ( ON ?auto_424395 ?auto_424396 ) ( CLEAR ?auto_424395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_424394 ?auto_424395 )
      ( MAKE-9PILE ?auto_424394 ?auto_424395 ?auto_424396 ?auto_424397 ?auto_424398 ?auto_424399 ?auto_424400 ?auto_424401 ?auto_424402 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_424413 - BLOCK
      ?auto_424414 - BLOCK
      ?auto_424415 - BLOCK
      ?auto_424416 - BLOCK
      ?auto_424417 - BLOCK
      ?auto_424418 - BLOCK
      ?auto_424419 - BLOCK
      ?auto_424420 - BLOCK
      ?auto_424421 - BLOCK
    )
    :vars
    (
      ?auto_424422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424421 ?auto_424422 ) ( not ( = ?auto_424413 ?auto_424414 ) ) ( not ( = ?auto_424413 ?auto_424415 ) ) ( not ( = ?auto_424413 ?auto_424416 ) ) ( not ( = ?auto_424413 ?auto_424417 ) ) ( not ( = ?auto_424413 ?auto_424418 ) ) ( not ( = ?auto_424413 ?auto_424419 ) ) ( not ( = ?auto_424413 ?auto_424420 ) ) ( not ( = ?auto_424413 ?auto_424421 ) ) ( not ( = ?auto_424413 ?auto_424422 ) ) ( not ( = ?auto_424414 ?auto_424415 ) ) ( not ( = ?auto_424414 ?auto_424416 ) ) ( not ( = ?auto_424414 ?auto_424417 ) ) ( not ( = ?auto_424414 ?auto_424418 ) ) ( not ( = ?auto_424414 ?auto_424419 ) ) ( not ( = ?auto_424414 ?auto_424420 ) ) ( not ( = ?auto_424414 ?auto_424421 ) ) ( not ( = ?auto_424414 ?auto_424422 ) ) ( not ( = ?auto_424415 ?auto_424416 ) ) ( not ( = ?auto_424415 ?auto_424417 ) ) ( not ( = ?auto_424415 ?auto_424418 ) ) ( not ( = ?auto_424415 ?auto_424419 ) ) ( not ( = ?auto_424415 ?auto_424420 ) ) ( not ( = ?auto_424415 ?auto_424421 ) ) ( not ( = ?auto_424415 ?auto_424422 ) ) ( not ( = ?auto_424416 ?auto_424417 ) ) ( not ( = ?auto_424416 ?auto_424418 ) ) ( not ( = ?auto_424416 ?auto_424419 ) ) ( not ( = ?auto_424416 ?auto_424420 ) ) ( not ( = ?auto_424416 ?auto_424421 ) ) ( not ( = ?auto_424416 ?auto_424422 ) ) ( not ( = ?auto_424417 ?auto_424418 ) ) ( not ( = ?auto_424417 ?auto_424419 ) ) ( not ( = ?auto_424417 ?auto_424420 ) ) ( not ( = ?auto_424417 ?auto_424421 ) ) ( not ( = ?auto_424417 ?auto_424422 ) ) ( not ( = ?auto_424418 ?auto_424419 ) ) ( not ( = ?auto_424418 ?auto_424420 ) ) ( not ( = ?auto_424418 ?auto_424421 ) ) ( not ( = ?auto_424418 ?auto_424422 ) ) ( not ( = ?auto_424419 ?auto_424420 ) ) ( not ( = ?auto_424419 ?auto_424421 ) ) ( not ( = ?auto_424419 ?auto_424422 ) ) ( not ( = ?auto_424420 ?auto_424421 ) ) ( not ( = ?auto_424420 ?auto_424422 ) ) ( not ( = ?auto_424421 ?auto_424422 ) ) ( ON ?auto_424420 ?auto_424421 ) ( ON ?auto_424419 ?auto_424420 ) ( ON ?auto_424418 ?auto_424419 ) ( ON ?auto_424417 ?auto_424418 ) ( ON ?auto_424416 ?auto_424417 ) ( ON ?auto_424415 ?auto_424416 ) ( ON ?auto_424414 ?auto_424415 ) ( ON ?auto_424413 ?auto_424414 ) ( CLEAR ?auto_424413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_424413 )
      ( MAKE-9PILE ?auto_424413 ?auto_424414 ?auto_424415 ?auto_424416 ?auto_424417 ?auto_424418 ?auto_424419 ?auto_424420 ?auto_424421 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_424432 - BLOCK
      ?auto_424433 - BLOCK
      ?auto_424434 - BLOCK
      ?auto_424435 - BLOCK
      ?auto_424436 - BLOCK
      ?auto_424437 - BLOCK
      ?auto_424438 - BLOCK
      ?auto_424439 - BLOCK
      ?auto_424440 - BLOCK
    )
    :vars
    (
      ?auto_424441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424440 ?auto_424441 ) ( not ( = ?auto_424432 ?auto_424433 ) ) ( not ( = ?auto_424432 ?auto_424434 ) ) ( not ( = ?auto_424432 ?auto_424435 ) ) ( not ( = ?auto_424432 ?auto_424436 ) ) ( not ( = ?auto_424432 ?auto_424437 ) ) ( not ( = ?auto_424432 ?auto_424438 ) ) ( not ( = ?auto_424432 ?auto_424439 ) ) ( not ( = ?auto_424432 ?auto_424440 ) ) ( not ( = ?auto_424432 ?auto_424441 ) ) ( not ( = ?auto_424433 ?auto_424434 ) ) ( not ( = ?auto_424433 ?auto_424435 ) ) ( not ( = ?auto_424433 ?auto_424436 ) ) ( not ( = ?auto_424433 ?auto_424437 ) ) ( not ( = ?auto_424433 ?auto_424438 ) ) ( not ( = ?auto_424433 ?auto_424439 ) ) ( not ( = ?auto_424433 ?auto_424440 ) ) ( not ( = ?auto_424433 ?auto_424441 ) ) ( not ( = ?auto_424434 ?auto_424435 ) ) ( not ( = ?auto_424434 ?auto_424436 ) ) ( not ( = ?auto_424434 ?auto_424437 ) ) ( not ( = ?auto_424434 ?auto_424438 ) ) ( not ( = ?auto_424434 ?auto_424439 ) ) ( not ( = ?auto_424434 ?auto_424440 ) ) ( not ( = ?auto_424434 ?auto_424441 ) ) ( not ( = ?auto_424435 ?auto_424436 ) ) ( not ( = ?auto_424435 ?auto_424437 ) ) ( not ( = ?auto_424435 ?auto_424438 ) ) ( not ( = ?auto_424435 ?auto_424439 ) ) ( not ( = ?auto_424435 ?auto_424440 ) ) ( not ( = ?auto_424435 ?auto_424441 ) ) ( not ( = ?auto_424436 ?auto_424437 ) ) ( not ( = ?auto_424436 ?auto_424438 ) ) ( not ( = ?auto_424436 ?auto_424439 ) ) ( not ( = ?auto_424436 ?auto_424440 ) ) ( not ( = ?auto_424436 ?auto_424441 ) ) ( not ( = ?auto_424437 ?auto_424438 ) ) ( not ( = ?auto_424437 ?auto_424439 ) ) ( not ( = ?auto_424437 ?auto_424440 ) ) ( not ( = ?auto_424437 ?auto_424441 ) ) ( not ( = ?auto_424438 ?auto_424439 ) ) ( not ( = ?auto_424438 ?auto_424440 ) ) ( not ( = ?auto_424438 ?auto_424441 ) ) ( not ( = ?auto_424439 ?auto_424440 ) ) ( not ( = ?auto_424439 ?auto_424441 ) ) ( not ( = ?auto_424440 ?auto_424441 ) ) ( ON ?auto_424439 ?auto_424440 ) ( ON ?auto_424438 ?auto_424439 ) ( ON ?auto_424437 ?auto_424438 ) ( ON ?auto_424436 ?auto_424437 ) ( ON ?auto_424435 ?auto_424436 ) ( ON ?auto_424434 ?auto_424435 ) ( ON ?auto_424433 ?auto_424434 ) ( ON ?auto_424432 ?auto_424433 ) ( CLEAR ?auto_424432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_424432 )
      ( MAKE-9PILE ?auto_424432 ?auto_424433 ?auto_424434 ?auto_424435 ?auto_424436 ?auto_424437 ?auto_424438 ?auto_424439 ?auto_424440 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_424452 - BLOCK
      ?auto_424453 - BLOCK
      ?auto_424454 - BLOCK
      ?auto_424455 - BLOCK
      ?auto_424456 - BLOCK
      ?auto_424457 - BLOCK
      ?auto_424458 - BLOCK
      ?auto_424459 - BLOCK
      ?auto_424460 - BLOCK
      ?auto_424461 - BLOCK
    )
    :vars
    (
      ?auto_424462 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_424460 ) ( ON ?auto_424461 ?auto_424462 ) ( CLEAR ?auto_424461 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_424452 ) ( ON ?auto_424453 ?auto_424452 ) ( ON ?auto_424454 ?auto_424453 ) ( ON ?auto_424455 ?auto_424454 ) ( ON ?auto_424456 ?auto_424455 ) ( ON ?auto_424457 ?auto_424456 ) ( ON ?auto_424458 ?auto_424457 ) ( ON ?auto_424459 ?auto_424458 ) ( ON ?auto_424460 ?auto_424459 ) ( not ( = ?auto_424452 ?auto_424453 ) ) ( not ( = ?auto_424452 ?auto_424454 ) ) ( not ( = ?auto_424452 ?auto_424455 ) ) ( not ( = ?auto_424452 ?auto_424456 ) ) ( not ( = ?auto_424452 ?auto_424457 ) ) ( not ( = ?auto_424452 ?auto_424458 ) ) ( not ( = ?auto_424452 ?auto_424459 ) ) ( not ( = ?auto_424452 ?auto_424460 ) ) ( not ( = ?auto_424452 ?auto_424461 ) ) ( not ( = ?auto_424452 ?auto_424462 ) ) ( not ( = ?auto_424453 ?auto_424454 ) ) ( not ( = ?auto_424453 ?auto_424455 ) ) ( not ( = ?auto_424453 ?auto_424456 ) ) ( not ( = ?auto_424453 ?auto_424457 ) ) ( not ( = ?auto_424453 ?auto_424458 ) ) ( not ( = ?auto_424453 ?auto_424459 ) ) ( not ( = ?auto_424453 ?auto_424460 ) ) ( not ( = ?auto_424453 ?auto_424461 ) ) ( not ( = ?auto_424453 ?auto_424462 ) ) ( not ( = ?auto_424454 ?auto_424455 ) ) ( not ( = ?auto_424454 ?auto_424456 ) ) ( not ( = ?auto_424454 ?auto_424457 ) ) ( not ( = ?auto_424454 ?auto_424458 ) ) ( not ( = ?auto_424454 ?auto_424459 ) ) ( not ( = ?auto_424454 ?auto_424460 ) ) ( not ( = ?auto_424454 ?auto_424461 ) ) ( not ( = ?auto_424454 ?auto_424462 ) ) ( not ( = ?auto_424455 ?auto_424456 ) ) ( not ( = ?auto_424455 ?auto_424457 ) ) ( not ( = ?auto_424455 ?auto_424458 ) ) ( not ( = ?auto_424455 ?auto_424459 ) ) ( not ( = ?auto_424455 ?auto_424460 ) ) ( not ( = ?auto_424455 ?auto_424461 ) ) ( not ( = ?auto_424455 ?auto_424462 ) ) ( not ( = ?auto_424456 ?auto_424457 ) ) ( not ( = ?auto_424456 ?auto_424458 ) ) ( not ( = ?auto_424456 ?auto_424459 ) ) ( not ( = ?auto_424456 ?auto_424460 ) ) ( not ( = ?auto_424456 ?auto_424461 ) ) ( not ( = ?auto_424456 ?auto_424462 ) ) ( not ( = ?auto_424457 ?auto_424458 ) ) ( not ( = ?auto_424457 ?auto_424459 ) ) ( not ( = ?auto_424457 ?auto_424460 ) ) ( not ( = ?auto_424457 ?auto_424461 ) ) ( not ( = ?auto_424457 ?auto_424462 ) ) ( not ( = ?auto_424458 ?auto_424459 ) ) ( not ( = ?auto_424458 ?auto_424460 ) ) ( not ( = ?auto_424458 ?auto_424461 ) ) ( not ( = ?auto_424458 ?auto_424462 ) ) ( not ( = ?auto_424459 ?auto_424460 ) ) ( not ( = ?auto_424459 ?auto_424461 ) ) ( not ( = ?auto_424459 ?auto_424462 ) ) ( not ( = ?auto_424460 ?auto_424461 ) ) ( not ( = ?auto_424460 ?auto_424462 ) ) ( not ( = ?auto_424461 ?auto_424462 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_424461 ?auto_424462 )
      ( !STACK ?auto_424461 ?auto_424460 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_424473 - BLOCK
      ?auto_424474 - BLOCK
      ?auto_424475 - BLOCK
      ?auto_424476 - BLOCK
      ?auto_424477 - BLOCK
      ?auto_424478 - BLOCK
      ?auto_424479 - BLOCK
      ?auto_424480 - BLOCK
      ?auto_424481 - BLOCK
      ?auto_424482 - BLOCK
    )
    :vars
    (
      ?auto_424483 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_424481 ) ( ON ?auto_424482 ?auto_424483 ) ( CLEAR ?auto_424482 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_424473 ) ( ON ?auto_424474 ?auto_424473 ) ( ON ?auto_424475 ?auto_424474 ) ( ON ?auto_424476 ?auto_424475 ) ( ON ?auto_424477 ?auto_424476 ) ( ON ?auto_424478 ?auto_424477 ) ( ON ?auto_424479 ?auto_424478 ) ( ON ?auto_424480 ?auto_424479 ) ( ON ?auto_424481 ?auto_424480 ) ( not ( = ?auto_424473 ?auto_424474 ) ) ( not ( = ?auto_424473 ?auto_424475 ) ) ( not ( = ?auto_424473 ?auto_424476 ) ) ( not ( = ?auto_424473 ?auto_424477 ) ) ( not ( = ?auto_424473 ?auto_424478 ) ) ( not ( = ?auto_424473 ?auto_424479 ) ) ( not ( = ?auto_424473 ?auto_424480 ) ) ( not ( = ?auto_424473 ?auto_424481 ) ) ( not ( = ?auto_424473 ?auto_424482 ) ) ( not ( = ?auto_424473 ?auto_424483 ) ) ( not ( = ?auto_424474 ?auto_424475 ) ) ( not ( = ?auto_424474 ?auto_424476 ) ) ( not ( = ?auto_424474 ?auto_424477 ) ) ( not ( = ?auto_424474 ?auto_424478 ) ) ( not ( = ?auto_424474 ?auto_424479 ) ) ( not ( = ?auto_424474 ?auto_424480 ) ) ( not ( = ?auto_424474 ?auto_424481 ) ) ( not ( = ?auto_424474 ?auto_424482 ) ) ( not ( = ?auto_424474 ?auto_424483 ) ) ( not ( = ?auto_424475 ?auto_424476 ) ) ( not ( = ?auto_424475 ?auto_424477 ) ) ( not ( = ?auto_424475 ?auto_424478 ) ) ( not ( = ?auto_424475 ?auto_424479 ) ) ( not ( = ?auto_424475 ?auto_424480 ) ) ( not ( = ?auto_424475 ?auto_424481 ) ) ( not ( = ?auto_424475 ?auto_424482 ) ) ( not ( = ?auto_424475 ?auto_424483 ) ) ( not ( = ?auto_424476 ?auto_424477 ) ) ( not ( = ?auto_424476 ?auto_424478 ) ) ( not ( = ?auto_424476 ?auto_424479 ) ) ( not ( = ?auto_424476 ?auto_424480 ) ) ( not ( = ?auto_424476 ?auto_424481 ) ) ( not ( = ?auto_424476 ?auto_424482 ) ) ( not ( = ?auto_424476 ?auto_424483 ) ) ( not ( = ?auto_424477 ?auto_424478 ) ) ( not ( = ?auto_424477 ?auto_424479 ) ) ( not ( = ?auto_424477 ?auto_424480 ) ) ( not ( = ?auto_424477 ?auto_424481 ) ) ( not ( = ?auto_424477 ?auto_424482 ) ) ( not ( = ?auto_424477 ?auto_424483 ) ) ( not ( = ?auto_424478 ?auto_424479 ) ) ( not ( = ?auto_424478 ?auto_424480 ) ) ( not ( = ?auto_424478 ?auto_424481 ) ) ( not ( = ?auto_424478 ?auto_424482 ) ) ( not ( = ?auto_424478 ?auto_424483 ) ) ( not ( = ?auto_424479 ?auto_424480 ) ) ( not ( = ?auto_424479 ?auto_424481 ) ) ( not ( = ?auto_424479 ?auto_424482 ) ) ( not ( = ?auto_424479 ?auto_424483 ) ) ( not ( = ?auto_424480 ?auto_424481 ) ) ( not ( = ?auto_424480 ?auto_424482 ) ) ( not ( = ?auto_424480 ?auto_424483 ) ) ( not ( = ?auto_424481 ?auto_424482 ) ) ( not ( = ?auto_424481 ?auto_424483 ) ) ( not ( = ?auto_424482 ?auto_424483 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_424482 ?auto_424483 )
      ( !STACK ?auto_424482 ?auto_424481 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_424494 - BLOCK
      ?auto_424495 - BLOCK
      ?auto_424496 - BLOCK
      ?auto_424497 - BLOCK
      ?auto_424498 - BLOCK
      ?auto_424499 - BLOCK
      ?auto_424500 - BLOCK
      ?auto_424501 - BLOCK
      ?auto_424502 - BLOCK
      ?auto_424503 - BLOCK
    )
    :vars
    (
      ?auto_424504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424503 ?auto_424504 ) ( ON-TABLE ?auto_424494 ) ( ON ?auto_424495 ?auto_424494 ) ( ON ?auto_424496 ?auto_424495 ) ( ON ?auto_424497 ?auto_424496 ) ( ON ?auto_424498 ?auto_424497 ) ( ON ?auto_424499 ?auto_424498 ) ( ON ?auto_424500 ?auto_424499 ) ( ON ?auto_424501 ?auto_424500 ) ( not ( = ?auto_424494 ?auto_424495 ) ) ( not ( = ?auto_424494 ?auto_424496 ) ) ( not ( = ?auto_424494 ?auto_424497 ) ) ( not ( = ?auto_424494 ?auto_424498 ) ) ( not ( = ?auto_424494 ?auto_424499 ) ) ( not ( = ?auto_424494 ?auto_424500 ) ) ( not ( = ?auto_424494 ?auto_424501 ) ) ( not ( = ?auto_424494 ?auto_424502 ) ) ( not ( = ?auto_424494 ?auto_424503 ) ) ( not ( = ?auto_424494 ?auto_424504 ) ) ( not ( = ?auto_424495 ?auto_424496 ) ) ( not ( = ?auto_424495 ?auto_424497 ) ) ( not ( = ?auto_424495 ?auto_424498 ) ) ( not ( = ?auto_424495 ?auto_424499 ) ) ( not ( = ?auto_424495 ?auto_424500 ) ) ( not ( = ?auto_424495 ?auto_424501 ) ) ( not ( = ?auto_424495 ?auto_424502 ) ) ( not ( = ?auto_424495 ?auto_424503 ) ) ( not ( = ?auto_424495 ?auto_424504 ) ) ( not ( = ?auto_424496 ?auto_424497 ) ) ( not ( = ?auto_424496 ?auto_424498 ) ) ( not ( = ?auto_424496 ?auto_424499 ) ) ( not ( = ?auto_424496 ?auto_424500 ) ) ( not ( = ?auto_424496 ?auto_424501 ) ) ( not ( = ?auto_424496 ?auto_424502 ) ) ( not ( = ?auto_424496 ?auto_424503 ) ) ( not ( = ?auto_424496 ?auto_424504 ) ) ( not ( = ?auto_424497 ?auto_424498 ) ) ( not ( = ?auto_424497 ?auto_424499 ) ) ( not ( = ?auto_424497 ?auto_424500 ) ) ( not ( = ?auto_424497 ?auto_424501 ) ) ( not ( = ?auto_424497 ?auto_424502 ) ) ( not ( = ?auto_424497 ?auto_424503 ) ) ( not ( = ?auto_424497 ?auto_424504 ) ) ( not ( = ?auto_424498 ?auto_424499 ) ) ( not ( = ?auto_424498 ?auto_424500 ) ) ( not ( = ?auto_424498 ?auto_424501 ) ) ( not ( = ?auto_424498 ?auto_424502 ) ) ( not ( = ?auto_424498 ?auto_424503 ) ) ( not ( = ?auto_424498 ?auto_424504 ) ) ( not ( = ?auto_424499 ?auto_424500 ) ) ( not ( = ?auto_424499 ?auto_424501 ) ) ( not ( = ?auto_424499 ?auto_424502 ) ) ( not ( = ?auto_424499 ?auto_424503 ) ) ( not ( = ?auto_424499 ?auto_424504 ) ) ( not ( = ?auto_424500 ?auto_424501 ) ) ( not ( = ?auto_424500 ?auto_424502 ) ) ( not ( = ?auto_424500 ?auto_424503 ) ) ( not ( = ?auto_424500 ?auto_424504 ) ) ( not ( = ?auto_424501 ?auto_424502 ) ) ( not ( = ?auto_424501 ?auto_424503 ) ) ( not ( = ?auto_424501 ?auto_424504 ) ) ( not ( = ?auto_424502 ?auto_424503 ) ) ( not ( = ?auto_424502 ?auto_424504 ) ) ( not ( = ?auto_424503 ?auto_424504 ) ) ( CLEAR ?auto_424501 ) ( ON ?auto_424502 ?auto_424503 ) ( CLEAR ?auto_424502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_424494 ?auto_424495 ?auto_424496 ?auto_424497 ?auto_424498 ?auto_424499 ?auto_424500 ?auto_424501 ?auto_424502 )
      ( MAKE-10PILE ?auto_424494 ?auto_424495 ?auto_424496 ?auto_424497 ?auto_424498 ?auto_424499 ?auto_424500 ?auto_424501 ?auto_424502 ?auto_424503 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_424515 - BLOCK
      ?auto_424516 - BLOCK
      ?auto_424517 - BLOCK
      ?auto_424518 - BLOCK
      ?auto_424519 - BLOCK
      ?auto_424520 - BLOCK
      ?auto_424521 - BLOCK
      ?auto_424522 - BLOCK
      ?auto_424523 - BLOCK
      ?auto_424524 - BLOCK
    )
    :vars
    (
      ?auto_424525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424524 ?auto_424525 ) ( ON-TABLE ?auto_424515 ) ( ON ?auto_424516 ?auto_424515 ) ( ON ?auto_424517 ?auto_424516 ) ( ON ?auto_424518 ?auto_424517 ) ( ON ?auto_424519 ?auto_424518 ) ( ON ?auto_424520 ?auto_424519 ) ( ON ?auto_424521 ?auto_424520 ) ( ON ?auto_424522 ?auto_424521 ) ( not ( = ?auto_424515 ?auto_424516 ) ) ( not ( = ?auto_424515 ?auto_424517 ) ) ( not ( = ?auto_424515 ?auto_424518 ) ) ( not ( = ?auto_424515 ?auto_424519 ) ) ( not ( = ?auto_424515 ?auto_424520 ) ) ( not ( = ?auto_424515 ?auto_424521 ) ) ( not ( = ?auto_424515 ?auto_424522 ) ) ( not ( = ?auto_424515 ?auto_424523 ) ) ( not ( = ?auto_424515 ?auto_424524 ) ) ( not ( = ?auto_424515 ?auto_424525 ) ) ( not ( = ?auto_424516 ?auto_424517 ) ) ( not ( = ?auto_424516 ?auto_424518 ) ) ( not ( = ?auto_424516 ?auto_424519 ) ) ( not ( = ?auto_424516 ?auto_424520 ) ) ( not ( = ?auto_424516 ?auto_424521 ) ) ( not ( = ?auto_424516 ?auto_424522 ) ) ( not ( = ?auto_424516 ?auto_424523 ) ) ( not ( = ?auto_424516 ?auto_424524 ) ) ( not ( = ?auto_424516 ?auto_424525 ) ) ( not ( = ?auto_424517 ?auto_424518 ) ) ( not ( = ?auto_424517 ?auto_424519 ) ) ( not ( = ?auto_424517 ?auto_424520 ) ) ( not ( = ?auto_424517 ?auto_424521 ) ) ( not ( = ?auto_424517 ?auto_424522 ) ) ( not ( = ?auto_424517 ?auto_424523 ) ) ( not ( = ?auto_424517 ?auto_424524 ) ) ( not ( = ?auto_424517 ?auto_424525 ) ) ( not ( = ?auto_424518 ?auto_424519 ) ) ( not ( = ?auto_424518 ?auto_424520 ) ) ( not ( = ?auto_424518 ?auto_424521 ) ) ( not ( = ?auto_424518 ?auto_424522 ) ) ( not ( = ?auto_424518 ?auto_424523 ) ) ( not ( = ?auto_424518 ?auto_424524 ) ) ( not ( = ?auto_424518 ?auto_424525 ) ) ( not ( = ?auto_424519 ?auto_424520 ) ) ( not ( = ?auto_424519 ?auto_424521 ) ) ( not ( = ?auto_424519 ?auto_424522 ) ) ( not ( = ?auto_424519 ?auto_424523 ) ) ( not ( = ?auto_424519 ?auto_424524 ) ) ( not ( = ?auto_424519 ?auto_424525 ) ) ( not ( = ?auto_424520 ?auto_424521 ) ) ( not ( = ?auto_424520 ?auto_424522 ) ) ( not ( = ?auto_424520 ?auto_424523 ) ) ( not ( = ?auto_424520 ?auto_424524 ) ) ( not ( = ?auto_424520 ?auto_424525 ) ) ( not ( = ?auto_424521 ?auto_424522 ) ) ( not ( = ?auto_424521 ?auto_424523 ) ) ( not ( = ?auto_424521 ?auto_424524 ) ) ( not ( = ?auto_424521 ?auto_424525 ) ) ( not ( = ?auto_424522 ?auto_424523 ) ) ( not ( = ?auto_424522 ?auto_424524 ) ) ( not ( = ?auto_424522 ?auto_424525 ) ) ( not ( = ?auto_424523 ?auto_424524 ) ) ( not ( = ?auto_424523 ?auto_424525 ) ) ( not ( = ?auto_424524 ?auto_424525 ) ) ( CLEAR ?auto_424522 ) ( ON ?auto_424523 ?auto_424524 ) ( CLEAR ?auto_424523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_424515 ?auto_424516 ?auto_424517 ?auto_424518 ?auto_424519 ?auto_424520 ?auto_424521 ?auto_424522 ?auto_424523 )
      ( MAKE-10PILE ?auto_424515 ?auto_424516 ?auto_424517 ?auto_424518 ?auto_424519 ?auto_424520 ?auto_424521 ?auto_424522 ?auto_424523 ?auto_424524 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_424536 - BLOCK
      ?auto_424537 - BLOCK
      ?auto_424538 - BLOCK
      ?auto_424539 - BLOCK
      ?auto_424540 - BLOCK
      ?auto_424541 - BLOCK
      ?auto_424542 - BLOCK
      ?auto_424543 - BLOCK
      ?auto_424544 - BLOCK
      ?auto_424545 - BLOCK
    )
    :vars
    (
      ?auto_424546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424545 ?auto_424546 ) ( ON-TABLE ?auto_424536 ) ( ON ?auto_424537 ?auto_424536 ) ( ON ?auto_424538 ?auto_424537 ) ( ON ?auto_424539 ?auto_424538 ) ( ON ?auto_424540 ?auto_424539 ) ( ON ?auto_424541 ?auto_424540 ) ( ON ?auto_424542 ?auto_424541 ) ( not ( = ?auto_424536 ?auto_424537 ) ) ( not ( = ?auto_424536 ?auto_424538 ) ) ( not ( = ?auto_424536 ?auto_424539 ) ) ( not ( = ?auto_424536 ?auto_424540 ) ) ( not ( = ?auto_424536 ?auto_424541 ) ) ( not ( = ?auto_424536 ?auto_424542 ) ) ( not ( = ?auto_424536 ?auto_424543 ) ) ( not ( = ?auto_424536 ?auto_424544 ) ) ( not ( = ?auto_424536 ?auto_424545 ) ) ( not ( = ?auto_424536 ?auto_424546 ) ) ( not ( = ?auto_424537 ?auto_424538 ) ) ( not ( = ?auto_424537 ?auto_424539 ) ) ( not ( = ?auto_424537 ?auto_424540 ) ) ( not ( = ?auto_424537 ?auto_424541 ) ) ( not ( = ?auto_424537 ?auto_424542 ) ) ( not ( = ?auto_424537 ?auto_424543 ) ) ( not ( = ?auto_424537 ?auto_424544 ) ) ( not ( = ?auto_424537 ?auto_424545 ) ) ( not ( = ?auto_424537 ?auto_424546 ) ) ( not ( = ?auto_424538 ?auto_424539 ) ) ( not ( = ?auto_424538 ?auto_424540 ) ) ( not ( = ?auto_424538 ?auto_424541 ) ) ( not ( = ?auto_424538 ?auto_424542 ) ) ( not ( = ?auto_424538 ?auto_424543 ) ) ( not ( = ?auto_424538 ?auto_424544 ) ) ( not ( = ?auto_424538 ?auto_424545 ) ) ( not ( = ?auto_424538 ?auto_424546 ) ) ( not ( = ?auto_424539 ?auto_424540 ) ) ( not ( = ?auto_424539 ?auto_424541 ) ) ( not ( = ?auto_424539 ?auto_424542 ) ) ( not ( = ?auto_424539 ?auto_424543 ) ) ( not ( = ?auto_424539 ?auto_424544 ) ) ( not ( = ?auto_424539 ?auto_424545 ) ) ( not ( = ?auto_424539 ?auto_424546 ) ) ( not ( = ?auto_424540 ?auto_424541 ) ) ( not ( = ?auto_424540 ?auto_424542 ) ) ( not ( = ?auto_424540 ?auto_424543 ) ) ( not ( = ?auto_424540 ?auto_424544 ) ) ( not ( = ?auto_424540 ?auto_424545 ) ) ( not ( = ?auto_424540 ?auto_424546 ) ) ( not ( = ?auto_424541 ?auto_424542 ) ) ( not ( = ?auto_424541 ?auto_424543 ) ) ( not ( = ?auto_424541 ?auto_424544 ) ) ( not ( = ?auto_424541 ?auto_424545 ) ) ( not ( = ?auto_424541 ?auto_424546 ) ) ( not ( = ?auto_424542 ?auto_424543 ) ) ( not ( = ?auto_424542 ?auto_424544 ) ) ( not ( = ?auto_424542 ?auto_424545 ) ) ( not ( = ?auto_424542 ?auto_424546 ) ) ( not ( = ?auto_424543 ?auto_424544 ) ) ( not ( = ?auto_424543 ?auto_424545 ) ) ( not ( = ?auto_424543 ?auto_424546 ) ) ( not ( = ?auto_424544 ?auto_424545 ) ) ( not ( = ?auto_424544 ?auto_424546 ) ) ( not ( = ?auto_424545 ?auto_424546 ) ) ( ON ?auto_424544 ?auto_424545 ) ( CLEAR ?auto_424542 ) ( ON ?auto_424543 ?auto_424544 ) ( CLEAR ?auto_424543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_424536 ?auto_424537 ?auto_424538 ?auto_424539 ?auto_424540 ?auto_424541 ?auto_424542 ?auto_424543 )
      ( MAKE-10PILE ?auto_424536 ?auto_424537 ?auto_424538 ?auto_424539 ?auto_424540 ?auto_424541 ?auto_424542 ?auto_424543 ?auto_424544 ?auto_424545 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_424557 - BLOCK
      ?auto_424558 - BLOCK
      ?auto_424559 - BLOCK
      ?auto_424560 - BLOCK
      ?auto_424561 - BLOCK
      ?auto_424562 - BLOCK
      ?auto_424563 - BLOCK
      ?auto_424564 - BLOCK
      ?auto_424565 - BLOCK
      ?auto_424566 - BLOCK
    )
    :vars
    (
      ?auto_424567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424566 ?auto_424567 ) ( ON-TABLE ?auto_424557 ) ( ON ?auto_424558 ?auto_424557 ) ( ON ?auto_424559 ?auto_424558 ) ( ON ?auto_424560 ?auto_424559 ) ( ON ?auto_424561 ?auto_424560 ) ( ON ?auto_424562 ?auto_424561 ) ( ON ?auto_424563 ?auto_424562 ) ( not ( = ?auto_424557 ?auto_424558 ) ) ( not ( = ?auto_424557 ?auto_424559 ) ) ( not ( = ?auto_424557 ?auto_424560 ) ) ( not ( = ?auto_424557 ?auto_424561 ) ) ( not ( = ?auto_424557 ?auto_424562 ) ) ( not ( = ?auto_424557 ?auto_424563 ) ) ( not ( = ?auto_424557 ?auto_424564 ) ) ( not ( = ?auto_424557 ?auto_424565 ) ) ( not ( = ?auto_424557 ?auto_424566 ) ) ( not ( = ?auto_424557 ?auto_424567 ) ) ( not ( = ?auto_424558 ?auto_424559 ) ) ( not ( = ?auto_424558 ?auto_424560 ) ) ( not ( = ?auto_424558 ?auto_424561 ) ) ( not ( = ?auto_424558 ?auto_424562 ) ) ( not ( = ?auto_424558 ?auto_424563 ) ) ( not ( = ?auto_424558 ?auto_424564 ) ) ( not ( = ?auto_424558 ?auto_424565 ) ) ( not ( = ?auto_424558 ?auto_424566 ) ) ( not ( = ?auto_424558 ?auto_424567 ) ) ( not ( = ?auto_424559 ?auto_424560 ) ) ( not ( = ?auto_424559 ?auto_424561 ) ) ( not ( = ?auto_424559 ?auto_424562 ) ) ( not ( = ?auto_424559 ?auto_424563 ) ) ( not ( = ?auto_424559 ?auto_424564 ) ) ( not ( = ?auto_424559 ?auto_424565 ) ) ( not ( = ?auto_424559 ?auto_424566 ) ) ( not ( = ?auto_424559 ?auto_424567 ) ) ( not ( = ?auto_424560 ?auto_424561 ) ) ( not ( = ?auto_424560 ?auto_424562 ) ) ( not ( = ?auto_424560 ?auto_424563 ) ) ( not ( = ?auto_424560 ?auto_424564 ) ) ( not ( = ?auto_424560 ?auto_424565 ) ) ( not ( = ?auto_424560 ?auto_424566 ) ) ( not ( = ?auto_424560 ?auto_424567 ) ) ( not ( = ?auto_424561 ?auto_424562 ) ) ( not ( = ?auto_424561 ?auto_424563 ) ) ( not ( = ?auto_424561 ?auto_424564 ) ) ( not ( = ?auto_424561 ?auto_424565 ) ) ( not ( = ?auto_424561 ?auto_424566 ) ) ( not ( = ?auto_424561 ?auto_424567 ) ) ( not ( = ?auto_424562 ?auto_424563 ) ) ( not ( = ?auto_424562 ?auto_424564 ) ) ( not ( = ?auto_424562 ?auto_424565 ) ) ( not ( = ?auto_424562 ?auto_424566 ) ) ( not ( = ?auto_424562 ?auto_424567 ) ) ( not ( = ?auto_424563 ?auto_424564 ) ) ( not ( = ?auto_424563 ?auto_424565 ) ) ( not ( = ?auto_424563 ?auto_424566 ) ) ( not ( = ?auto_424563 ?auto_424567 ) ) ( not ( = ?auto_424564 ?auto_424565 ) ) ( not ( = ?auto_424564 ?auto_424566 ) ) ( not ( = ?auto_424564 ?auto_424567 ) ) ( not ( = ?auto_424565 ?auto_424566 ) ) ( not ( = ?auto_424565 ?auto_424567 ) ) ( not ( = ?auto_424566 ?auto_424567 ) ) ( ON ?auto_424565 ?auto_424566 ) ( CLEAR ?auto_424563 ) ( ON ?auto_424564 ?auto_424565 ) ( CLEAR ?auto_424564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_424557 ?auto_424558 ?auto_424559 ?auto_424560 ?auto_424561 ?auto_424562 ?auto_424563 ?auto_424564 )
      ( MAKE-10PILE ?auto_424557 ?auto_424558 ?auto_424559 ?auto_424560 ?auto_424561 ?auto_424562 ?auto_424563 ?auto_424564 ?auto_424565 ?auto_424566 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_424578 - BLOCK
      ?auto_424579 - BLOCK
      ?auto_424580 - BLOCK
      ?auto_424581 - BLOCK
      ?auto_424582 - BLOCK
      ?auto_424583 - BLOCK
      ?auto_424584 - BLOCK
      ?auto_424585 - BLOCK
      ?auto_424586 - BLOCK
      ?auto_424587 - BLOCK
    )
    :vars
    (
      ?auto_424588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424587 ?auto_424588 ) ( ON-TABLE ?auto_424578 ) ( ON ?auto_424579 ?auto_424578 ) ( ON ?auto_424580 ?auto_424579 ) ( ON ?auto_424581 ?auto_424580 ) ( ON ?auto_424582 ?auto_424581 ) ( ON ?auto_424583 ?auto_424582 ) ( not ( = ?auto_424578 ?auto_424579 ) ) ( not ( = ?auto_424578 ?auto_424580 ) ) ( not ( = ?auto_424578 ?auto_424581 ) ) ( not ( = ?auto_424578 ?auto_424582 ) ) ( not ( = ?auto_424578 ?auto_424583 ) ) ( not ( = ?auto_424578 ?auto_424584 ) ) ( not ( = ?auto_424578 ?auto_424585 ) ) ( not ( = ?auto_424578 ?auto_424586 ) ) ( not ( = ?auto_424578 ?auto_424587 ) ) ( not ( = ?auto_424578 ?auto_424588 ) ) ( not ( = ?auto_424579 ?auto_424580 ) ) ( not ( = ?auto_424579 ?auto_424581 ) ) ( not ( = ?auto_424579 ?auto_424582 ) ) ( not ( = ?auto_424579 ?auto_424583 ) ) ( not ( = ?auto_424579 ?auto_424584 ) ) ( not ( = ?auto_424579 ?auto_424585 ) ) ( not ( = ?auto_424579 ?auto_424586 ) ) ( not ( = ?auto_424579 ?auto_424587 ) ) ( not ( = ?auto_424579 ?auto_424588 ) ) ( not ( = ?auto_424580 ?auto_424581 ) ) ( not ( = ?auto_424580 ?auto_424582 ) ) ( not ( = ?auto_424580 ?auto_424583 ) ) ( not ( = ?auto_424580 ?auto_424584 ) ) ( not ( = ?auto_424580 ?auto_424585 ) ) ( not ( = ?auto_424580 ?auto_424586 ) ) ( not ( = ?auto_424580 ?auto_424587 ) ) ( not ( = ?auto_424580 ?auto_424588 ) ) ( not ( = ?auto_424581 ?auto_424582 ) ) ( not ( = ?auto_424581 ?auto_424583 ) ) ( not ( = ?auto_424581 ?auto_424584 ) ) ( not ( = ?auto_424581 ?auto_424585 ) ) ( not ( = ?auto_424581 ?auto_424586 ) ) ( not ( = ?auto_424581 ?auto_424587 ) ) ( not ( = ?auto_424581 ?auto_424588 ) ) ( not ( = ?auto_424582 ?auto_424583 ) ) ( not ( = ?auto_424582 ?auto_424584 ) ) ( not ( = ?auto_424582 ?auto_424585 ) ) ( not ( = ?auto_424582 ?auto_424586 ) ) ( not ( = ?auto_424582 ?auto_424587 ) ) ( not ( = ?auto_424582 ?auto_424588 ) ) ( not ( = ?auto_424583 ?auto_424584 ) ) ( not ( = ?auto_424583 ?auto_424585 ) ) ( not ( = ?auto_424583 ?auto_424586 ) ) ( not ( = ?auto_424583 ?auto_424587 ) ) ( not ( = ?auto_424583 ?auto_424588 ) ) ( not ( = ?auto_424584 ?auto_424585 ) ) ( not ( = ?auto_424584 ?auto_424586 ) ) ( not ( = ?auto_424584 ?auto_424587 ) ) ( not ( = ?auto_424584 ?auto_424588 ) ) ( not ( = ?auto_424585 ?auto_424586 ) ) ( not ( = ?auto_424585 ?auto_424587 ) ) ( not ( = ?auto_424585 ?auto_424588 ) ) ( not ( = ?auto_424586 ?auto_424587 ) ) ( not ( = ?auto_424586 ?auto_424588 ) ) ( not ( = ?auto_424587 ?auto_424588 ) ) ( ON ?auto_424586 ?auto_424587 ) ( ON ?auto_424585 ?auto_424586 ) ( CLEAR ?auto_424583 ) ( ON ?auto_424584 ?auto_424585 ) ( CLEAR ?auto_424584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_424578 ?auto_424579 ?auto_424580 ?auto_424581 ?auto_424582 ?auto_424583 ?auto_424584 )
      ( MAKE-10PILE ?auto_424578 ?auto_424579 ?auto_424580 ?auto_424581 ?auto_424582 ?auto_424583 ?auto_424584 ?auto_424585 ?auto_424586 ?auto_424587 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_424599 - BLOCK
      ?auto_424600 - BLOCK
      ?auto_424601 - BLOCK
      ?auto_424602 - BLOCK
      ?auto_424603 - BLOCK
      ?auto_424604 - BLOCK
      ?auto_424605 - BLOCK
      ?auto_424606 - BLOCK
      ?auto_424607 - BLOCK
      ?auto_424608 - BLOCK
    )
    :vars
    (
      ?auto_424609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424608 ?auto_424609 ) ( ON-TABLE ?auto_424599 ) ( ON ?auto_424600 ?auto_424599 ) ( ON ?auto_424601 ?auto_424600 ) ( ON ?auto_424602 ?auto_424601 ) ( ON ?auto_424603 ?auto_424602 ) ( ON ?auto_424604 ?auto_424603 ) ( not ( = ?auto_424599 ?auto_424600 ) ) ( not ( = ?auto_424599 ?auto_424601 ) ) ( not ( = ?auto_424599 ?auto_424602 ) ) ( not ( = ?auto_424599 ?auto_424603 ) ) ( not ( = ?auto_424599 ?auto_424604 ) ) ( not ( = ?auto_424599 ?auto_424605 ) ) ( not ( = ?auto_424599 ?auto_424606 ) ) ( not ( = ?auto_424599 ?auto_424607 ) ) ( not ( = ?auto_424599 ?auto_424608 ) ) ( not ( = ?auto_424599 ?auto_424609 ) ) ( not ( = ?auto_424600 ?auto_424601 ) ) ( not ( = ?auto_424600 ?auto_424602 ) ) ( not ( = ?auto_424600 ?auto_424603 ) ) ( not ( = ?auto_424600 ?auto_424604 ) ) ( not ( = ?auto_424600 ?auto_424605 ) ) ( not ( = ?auto_424600 ?auto_424606 ) ) ( not ( = ?auto_424600 ?auto_424607 ) ) ( not ( = ?auto_424600 ?auto_424608 ) ) ( not ( = ?auto_424600 ?auto_424609 ) ) ( not ( = ?auto_424601 ?auto_424602 ) ) ( not ( = ?auto_424601 ?auto_424603 ) ) ( not ( = ?auto_424601 ?auto_424604 ) ) ( not ( = ?auto_424601 ?auto_424605 ) ) ( not ( = ?auto_424601 ?auto_424606 ) ) ( not ( = ?auto_424601 ?auto_424607 ) ) ( not ( = ?auto_424601 ?auto_424608 ) ) ( not ( = ?auto_424601 ?auto_424609 ) ) ( not ( = ?auto_424602 ?auto_424603 ) ) ( not ( = ?auto_424602 ?auto_424604 ) ) ( not ( = ?auto_424602 ?auto_424605 ) ) ( not ( = ?auto_424602 ?auto_424606 ) ) ( not ( = ?auto_424602 ?auto_424607 ) ) ( not ( = ?auto_424602 ?auto_424608 ) ) ( not ( = ?auto_424602 ?auto_424609 ) ) ( not ( = ?auto_424603 ?auto_424604 ) ) ( not ( = ?auto_424603 ?auto_424605 ) ) ( not ( = ?auto_424603 ?auto_424606 ) ) ( not ( = ?auto_424603 ?auto_424607 ) ) ( not ( = ?auto_424603 ?auto_424608 ) ) ( not ( = ?auto_424603 ?auto_424609 ) ) ( not ( = ?auto_424604 ?auto_424605 ) ) ( not ( = ?auto_424604 ?auto_424606 ) ) ( not ( = ?auto_424604 ?auto_424607 ) ) ( not ( = ?auto_424604 ?auto_424608 ) ) ( not ( = ?auto_424604 ?auto_424609 ) ) ( not ( = ?auto_424605 ?auto_424606 ) ) ( not ( = ?auto_424605 ?auto_424607 ) ) ( not ( = ?auto_424605 ?auto_424608 ) ) ( not ( = ?auto_424605 ?auto_424609 ) ) ( not ( = ?auto_424606 ?auto_424607 ) ) ( not ( = ?auto_424606 ?auto_424608 ) ) ( not ( = ?auto_424606 ?auto_424609 ) ) ( not ( = ?auto_424607 ?auto_424608 ) ) ( not ( = ?auto_424607 ?auto_424609 ) ) ( not ( = ?auto_424608 ?auto_424609 ) ) ( ON ?auto_424607 ?auto_424608 ) ( ON ?auto_424606 ?auto_424607 ) ( CLEAR ?auto_424604 ) ( ON ?auto_424605 ?auto_424606 ) ( CLEAR ?auto_424605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_424599 ?auto_424600 ?auto_424601 ?auto_424602 ?auto_424603 ?auto_424604 ?auto_424605 )
      ( MAKE-10PILE ?auto_424599 ?auto_424600 ?auto_424601 ?auto_424602 ?auto_424603 ?auto_424604 ?auto_424605 ?auto_424606 ?auto_424607 ?auto_424608 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_424620 - BLOCK
      ?auto_424621 - BLOCK
      ?auto_424622 - BLOCK
      ?auto_424623 - BLOCK
      ?auto_424624 - BLOCK
      ?auto_424625 - BLOCK
      ?auto_424626 - BLOCK
      ?auto_424627 - BLOCK
      ?auto_424628 - BLOCK
      ?auto_424629 - BLOCK
    )
    :vars
    (
      ?auto_424630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424629 ?auto_424630 ) ( ON-TABLE ?auto_424620 ) ( ON ?auto_424621 ?auto_424620 ) ( ON ?auto_424622 ?auto_424621 ) ( ON ?auto_424623 ?auto_424622 ) ( ON ?auto_424624 ?auto_424623 ) ( not ( = ?auto_424620 ?auto_424621 ) ) ( not ( = ?auto_424620 ?auto_424622 ) ) ( not ( = ?auto_424620 ?auto_424623 ) ) ( not ( = ?auto_424620 ?auto_424624 ) ) ( not ( = ?auto_424620 ?auto_424625 ) ) ( not ( = ?auto_424620 ?auto_424626 ) ) ( not ( = ?auto_424620 ?auto_424627 ) ) ( not ( = ?auto_424620 ?auto_424628 ) ) ( not ( = ?auto_424620 ?auto_424629 ) ) ( not ( = ?auto_424620 ?auto_424630 ) ) ( not ( = ?auto_424621 ?auto_424622 ) ) ( not ( = ?auto_424621 ?auto_424623 ) ) ( not ( = ?auto_424621 ?auto_424624 ) ) ( not ( = ?auto_424621 ?auto_424625 ) ) ( not ( = ?auto_424621 ?auto_424626 ) ) ( not ( = ?auto_424621 ?auto_424627 ) ) ( not ( = ?auto_424621 ?auto_424628 ) ) ( not ( = ?auto_424621 ?auto_424629 ) ) ( not ( = ?auto_424621 ?auto_424630 ) ) ( not ( = ?auto_424622 ?auto_424623 ) ) ( not ( = ?auto_424622 ?auto_424624 ) ) ( not ( = ?auto_424622 ?auto_424625 ) ) ( not ( = ?auto_424622 ?auto_424626 ) ) ( not ( = ?auto_424622 ?auto_424627 ) ) ( not ( = ?auto_424622 ?auto_424628 ) ) ( not ( = ?auto_424622 ?auto_424629 ) ) ( not ( = ?auto_424622 ?auto_424630 ) ) ( not ( = ?auto_424623 ?auto_424624 ) ) ( not ( = ?auto_424623 ?auto_424625 ) ) ( not ( = ?auto_424623 ?auto_424626 ) ) ( not ( = ?auto_424623 ?auto_424627 ) ) ( not ( = ?auto_424623 ?auto_424628 ) ) ( not ( = ?auto_424623 ?auto_424629 ) ) ( not ( = ?auto_424623 ?auto_424630 ) ) ( not ( = ?auto_424624 ?auto_424625 ) ) ( not ( = ?auto_424624 ?auto_424626 ) ) ( not ( = ?auto_424624 ?auto_424627 ) ) ( not ( = ?auto_424624 ?auto_424628 ) ) ( not ( = ?auto_424624 ?auto_424629 ) ) ( not ( = ?auto_424624 ?auto_424630 ) ) ( not ( = ?auto_424625 ?auto_424626 ) ) ( not ( = ?auto_424625 ?auto_424627 ) ) ( not ( = ?auto_424625 ?auto_424628 ) ) ( not ( = ?auto_424625 ?auto_424629 ) ) ( not ( = ?auto_424625 ?auto_424630 ) ) ( not ( = ?auto_424626 ?auto_424627 ) ) ( not ( = ?auto_424626 ?auto_424628 ) ) ( not ( = ?auto_424626 ?auto_424629 ) ) ( not ( = ?auto_424626 ?auto_424630 ) ) ( not ( = ?auto_424627 ?auto_424628 ) ) ( not ( = ?auto_424627 ?auto_424629 ) ) ( not ( = ?auto_424627 ?auto_424630 ) ) ( not ( = ?auto_424628 ?auto_424629 ) ) ( not ( = ?auto_424628 ?auto_424630 ) ) ( not ( = ?auto_424629 ?auto_424630 ) ) ( ON ?auto_424628 ?auto_424629 ) ( ON ?auto_424627 ?auto_424628 ) ( ON ?auto_424626 ?auto_424627 ) ( CLEAR ?auto_424624 ) ( ON ?auto_424625 ?auto_424626 ) ( CLEAR ?auto_424625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_424620 ?auto_424621 ?auto_424622 ?auto_424623 ?auto_424624 ?auto_424625 )
      ( MAKE-10PILE ?auto_424620 ?auto_424621 ?auto_424622 ?auto_424623 ?auto_424624 ?auto_424625 ?auto_424626 ?auto_424627 ?auto_424628 ?auto_424629 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_424641 - BLOCK
      ?auto_424642 - BLOCK
      ?auto_424643 - BLOCK
      ?auto_424644 - BLOCK
      ?auto_424645 - BLOCK
      ?auto_424646 - BLOCK
      ?auto_424647 - BLOCK
      ?auto_424648 - BLOCK
      ?auto_424649 - BLOCK
      ?auto_424650 - BLOCK
    )
    :vars
    (
      ?auto_424651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424650 ?auto_424651 ) ( ON-TABLE ?auto_424641 ) ( ON ?auto_424642 ?auto_424641 ) ( ON ?auto_424643 ?auto_424642 ) ( ON ?auto_424644 ?auto_424643 ) ( ON ?auto_424645 ?auto_424644 ) ( not ( = ?auto_424641 ?auto_424642 ) ) ( not ( = ?auto_424641 ?auto_424643 ) ) ( not ( = ?auto_424641 ?auto_424644 ) ) ( not ( = ?auto_424641 ?auto_424645 ) ) ( not ( = ?auto_424641 ?auto_424646 ) ) ( not ( = ?auto_424641 ?auto_424647 ) ) ( not ( = ?auto_424641 ?auto_424648 ) ) ( not ( = ?auto_424641 ?auto_424649 ) ) ( not ( = ?auto_424641 ?auto_424650 ) ) ( not ( = ?auto_424641 ?auto_424651 ) ) ( not ( = ?auto_424642 ?auto_424643 ) ) ( not ( = ?auto_424642 ?auto_424644 ) ) ( not ( = ?auto_424642 ?auto_424645 ) ) ( not ( = ?auto_424642 ?auto_424646 ) ) ( not ( = ?auto_424642 ?auto_424647 ) ) ( not ( = ?auto_424642 ?auto_424648 ) ) ( not ( = ?auto_424642 ?auto_424649 ) ) ( not ( = ?auto_424642 ?auto_424650 ) ) ( not ( = ?auto_424642 ?auto_424651 ) ) ( not ( = ?auto_424643 ?auto_424644 ) ) ( not ( = ?auto_424643 ?auto_424645 ) ) ( not ( = ?auto_424643 ?auto_424646 ) ) ( not ( = ?auto_424643 ?auto_424647 ) ) ( not ( = ?auto_424643 ?auto_424648 ) ) ( not ( = ?auto_424643 ?auto_424649 ) ) ( not ( = ?auto_424643 ?auto_424650 ) ) ( not ( = ?auto_424643 ?auto_424651 ) ) ( not ( = ?auto_424644 ?auto_424645 ) ) ( not ( = ?auto_424644 ?auto_424646 ) ) ( not ( = ?auto_424644 ?auto_424647 ) ) ( not ( = ?auto_424644 ?auto_424648 ) ) ( not ( = ?auto_424644 ?auto_424649 ) ) ( not ( = ?auto_424644 ?auto_424650 ) ) ( not ( = ?auto_424644 ?auto_424651 ) ) ( not ( = ?auto_424645 ?auto_424646 ) ) ( not ( = ?auto_424645 ?auto_424647 ) ) ( not ( = ?auto_424645 ?auto_424648 ) ) ( not ( = ?auto_424645 ?auto_424649 ) ) ( not ( = ?auto_424645 ?auto_424650 ) ) ( not ( = ?auto_424645 ?auto_424651 ) ) ( not ( = ?auto_424646 ?auto_424647 ) ) ( not ( = ?auto_424646 ?auto_424648 ) ) ( not ( = ?auto_424646 ?auto_424649 ) ) ( not ( = ?auto_424646 ?auto_424650 ) ) ( not ( = ?auto_424646 ?auto_424651 ) ) ( not ( = ?auto_424647 ?auto_424648 ) ) ( not ( = ?auto_424647 ?auto_424649 ) ) ( not ( = ?auto_424647 ?auto_424650 ) ) ( not ( = ?auto_424647 ?auto_424651 ) ) ( not ( = ?auto_424648 ?auto_424649 ) ) ( not ( = ?auto_424648 ?auto_424650 ) ) ( not ( = ?auto_424648 ?auto_424651 ) ) ( not ( = ?auto_424649 ?auto_424650 ) ) ( not ( = ?auto_424649 ?auto_424651 ) ) ( not ( = ?auto_424650 ?auto_424651 ) ) ( ON ?auto_424649 ?auto_424650 ) ( ON ?auto_424648 ?auto_424649 ) ( ON ?auto_424647 ?auto_424648 ) ( CLEAR ?auto_424645 ) ( ON ?auto_424646 ?auto_424647 ) ( CLEAR ?auto_424646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_424641 ?auto_424642 ?auto_424643 ?auto_424644 ?auto_424645 ?auto_424646 )
      ( MAKE-10PILE ?auto_424641 ?auto_424642 ?auto_424643 ?auto_424644 ?auto_424645 ?auto_424646 ?auto_424647 ?auto_424648 ?auto_424649 ?auto_424650 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_424662 - BLOCK
      ?auto_424663 - BLOCK
      ?auto_424664 - BLOCK
      ?auto_424665 - BLOCK
      ?auto_424666 - BLOCK
      ?auto_424667 - BLOCK
      ?auto_424668 - BLOCK
      ?auto_424669 - BLOCK
      ?auto_424670 - BLOCK
      ?auto_424671 - BLOCK
    )
    :vars
    (
      ?auto_424672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424671 ?auto_424672 ) ( ON-TABLE ?auto_424662 ) ( ON ?auto_424663 ?auto_424662 ) ( ON ?auto_424664 ?auto_424663 ) ( ON ?auto_424665 ?auto_424664 ) ( not ( = ?auto_424662 ?auto_424663 ) ) ( not ( = ?auto_424662 ?auto_424664 ) ) ( not ( = ?auto_424662 ?auto_424665 ) ) ( not ( = ?auto_424662 ?auto_424666 ) ) ( not ( = ?auto_424662 ?auto_424667 ) ) ( not ( = ?auto_424662 ?auto_424668 ) ) ( not ( = ?auto_424662 ?auto_424669 ) ) ( not ( = ?auto_424662 ?auto_424670 ) ) ( not ( = ?auto_424662 ?auto_424671 ) ) ( not ( = ?auto_424662 ?auto_424672 ) ) ( not ( = ?auto_424663 ?auto_424664 ) ) ( not ( = ?auto_424663 ?auto_424665 ) ) ( not ( = ?auto_424663 ?auto_424666 ) ) ( not ( = ?auto_424663 ?auto_424667 ) ) ( not ( = ?auto_424663 ?auto_424668 ) ) ( not ( = ?auto_424663 ?auto_424669 ) ) ( not ( = ?auto_424663 ?auto_424670 ) ) ( not ( = ?auto_424663 ?auto_424671 ) ) ( not ( = ?auto_424663 ?auto_424672 ) ) ( not ( = ?auto_424664 ?auto_424665 ) ) ( not ( = ?auto_424664 ?auto_424666 ) ) ( not ( = ?auto_424664 ?auto_424667 ) ) ( not ( = ?auto_424664 ?auto_424668 ) ) ( not ( = ?auto_424664 ?auto_424669 ) ) ( not ( = ?auto_424664 ?auto_424670 ) ) ( not ( = ?auto_424664 ?auto_424671 ) ) ( not ( = ?auto_424664 ?auto_424672 ) ) ( not ( = ?auto_424665 ?auto_424666 ) ) ( not ( = ?auto_424665 ?auto_424667 ) ) ( not ( = ?auto_424665 ?auto_424668 ) ) ( not ( = ?auto_424665 ?auto_424669 ) ) ( not ( = ?auto_424665 ?auto_424670 ) ) ( not ( = ?auto_424665 ?auto_424671 ) ) ( not ( = ?auto_424665 ?auto_424672 ) ) ( not ( = ?auto_424666 ?auto_424667 ) ) ( not ( = ?auto_424666 ?auto_424668 ) ) ( not ( = ?auto_424666 ?auto_424669 ) ) ( not ( = ?auto_424666 ?auto_424670 ) ) ( not ( = ?auto_424666 ?auto_424671 ) ) ( not ( = ?auto_424666 ?auto_424672 ) ) ( not ( = ?auto_424667 ?auto_424668 ) ) ( not ( = ?auto_424667 ?auto_424669 ) ) ( not ( = ?auto_424667 ?auto_424670 ) ) ( not ( = ?auto_424667 ?auto_424671 ) ) ( not ( = ?auto_424667 ?auto_424672 ) ) ( not ( = ?auto_424668 ?auto_424669 ) ) ( not ( = ?auto_424668 ?auto_424670 ) ) ( not ( = ?auto_424668 ?auto_424671 ) ) ( not ( = ?auto_424668 ?auto_424672 ) ) ( not ( = ?auto_424669 ?auto_424670 ) ) ( not ( = ?auto_424669 ?auto_424671 ) ) ( not ( = ?auto_424669 ?auto_424672 ) ) ( not ( = ?auto_424670 ?auto_424671 ) ) ( not ( = ?auto_424670 ?auto_424672 ) ) ( not ( = ?auto_424671 ?auto_424672 ) ) ( ON ?auto_424670 ?auto_424671 ) ( ON ?auto_424669 ?auto_424670 ) ( ON ?auto_424668 ?auto_424669 ) ( ON ?auto_424667 ?auto_424668 ) ( CLEAR ?auto_424665 ) ( ON ?auto_424666 ?auto_424667 ) ( CLEAR ?auto_424666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_424662 ?auto_424663 ?auto_424664 ?auto_424665 ?auto_424666 )
      ( MAKE-10PILE ?auto_424662 ?auto_424663 ?auto_424664 ?auto_424665 ?auto_424666 ?auto_424667 ?auto_424668 ?auto_424669 ?auto_424670 ?auto_424671 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_424683 - BLOCK
      ?auto_424684 - BLOCK
      ?auto_424685 - BLOCK
      ?auto_424686 - BLOCK
      ?auto_424687 - BLOCK
      ?auto_424688 - BLOCK
      ?auto_424689 - BLOCK
      ?auto_424690 - BLOCK
      ?auto_424691 - BLOCK
      ?auto_424692 - BLOCK
    )
    :vars
    (
      ?auto_424693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424692 ?auto_424693 ) ( ON-TABLE ?auto_424683 ) ( ON ?auto_424684 ?auto_424683 ) ( ON ?auto_424685 ?auto_424684 ) ( ON ?auto_424686 ?auto_424685 ) ( not ( = ?auto_424683 ?auto_424684 ) ) ( not ( = ?auto_424683 ?auto_424685 ) ) ( not ( = ?auto_424683 ?auto_424686 ) ) ( not ( = ?auto_424683 ?auto_424687 ) ) ( not ( = ?auto_424683 ?auto_424688 ) ) ( not ( = ?auto_424683 ?auto_424689 ) ) ( not ( = ?auto_424683 ?auto_424690 ) ) ( not ( = ?auto_424683 ?auto_424691 ) ) ( not ( = ?auto_424683 ?auto_424692 ) ) ( not ( = ?auto_424683 ?auto_424693 ) ) ( not ( = ?auto_424684 ?auto_424685 ) ) ( not ( = ?auto_424684 ?auto_424686 ) ) ( not ( = ?auto_424684 ?auto_424687 ) ) ( not ( = ?auto_424684 ?auto_424688 ) ) ( not ( = ?auto_424684 ?auto_424689 ) ) ( not ( = ?auto_424684 ?auto_424690 ) ) ( not ( = ?auto_424684 ?auto_424691 ) ) ( not ( = ?auto_424684 ?auto_424692 ) ) ( not ( = ?auto_424684 ?auto_424693 ) ) ( not ( = ?auto_424685 ?auto_424686 ) ) ( not ( = ?auto_424685 ?auto_424687 ) ) ( not ( = ?auto_424685 ?auto_424688 ) ) ( not ( = ?auto_424685 ?auto_424689 ) ) ( not ( = ?auto_424685 ?auto_424690 ) ) ( not ( = ?auto_424685 ?auto_424691 ) ) ( not ( = ?auto_424685 ?auto_424692 ) ) ( not ( = ?auto_424685 ?auto_424693 ) ) ( not ( = ?auto_424686 ?auto_424687 ) ) ( not ( = ?auto_424686 ?auto_424688 ) ) ( not ( = ?auto_424686 ?auto_424689 ) ) ( not ( = ?auto_424686 ?auto_424690 ) ) ( not ( = ?auto_424686 ?auto_424691 ) ) ( not ( = ?auto_424686 ?auto_424692 ) ) ( not ( = ?auto_424686 ?auto_424693 ) ) ( not ( = ?auto_424687 ?auto_424688 ) ) ( not ( = ?auto_424687 ?auto_424689 ) ) ( not ( = ?auto_424687 ?auto_424690 ) ) ( not ( = ?auto_424687 ?auto_424691 ) ) ( not ( = ?auto_424687 ?auto_424692 ) ) ( not ( = ?auto_424687 ?auto_424693 ) ) ( not ( = ?auto_424688 ?auto_424689 ) ) ( not ( = ?auto_424688 ?auto_424690 ) ) ( not ( = ?auto_424688 ?auto_424691 ) ) ( not ( = ?auto_424688 ?auto_424692 ) ) ( not ( = ?auto_424688 ?auto_424693 ) ) ( not ( = ?auto_424689 ?auto_424690 ) ) ( not ( = ?auto_424689 ?auto_424691 ) ) ( not ( = ?auto_424689 ?auto_424692 ) ) ( not ( = ?auto_424689 ?auto_424693 ) ) ( not ( = ?auto_424690 ?auto_424691 ) ) ( not ( = ?auto_424690 ?auto_424692 ) ) ( not ( = ?auto_424690 ?auto_424693 ) ) ( not ( = ?auto_424691 ?auto_424692 ) ) ( not ( = ?auto_424691 ?auto_424693 ) ) ( not ( = ?auto_424692 ?auto_424693 ) ) ( ON ?auto_424691 ?auto_424692 ) ( ON ?auto_424690 ?auto_424691 ) ( ON ?auto_424689 ?auto_424690 ) ( ON ?auto_424688 ?auto_424689 ) ( CLEAR ?auto_424686 ) ( ON ?auto_424687 ?auto_424688 ) ( CLEAR ?auto_424687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_424683 ?auto_424684 ?auto_424685 ?auto_424686 ?auto_424687 )
      ( MAKE-10PILE ?auto_424683 ?auto_424684 ?auto_424685 ?auto_424686 ?auto_424687 ?auto_424688 ?auto_424689 ?auto_424690 ?auto_424691 ?auto_424692 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_424704 - BLOCK
      ?auto_424705 - BLOCK
      ?auto_424706 - BLOCK
      ?auto_424707 - BLOCK
      ?auto_424708 - BLOCK
      ?auto_424709 - BLOCK
      ?auto_424710 - BLOCK
      ?auto_424711 - BLOCK
      ?auto_424712 - BLOCK
      ?auto_424713 - BLOCK
    )
    :vars
    (
      ?auto_424714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424713 ?auto_424714 ) ( ON-TABLE ?auto_424704 ) ( ON ?auto_424705 ?auto_424704 ) ( ON ?auto_424706 ?auto_424705 ) ( not ( = ?auto_424704 ?auto_424705 ) ) ( not ( = ?auto_424704 ?auto_424706 ) ) ( not ( = ?auto_424704 ?auto_424707 ) ) ( not ( = ?auto_424704 ?auto_424708 ) ) ( not ( = ?auto_424704 ?auto_424709 ) ) ( not ( = ?auto_424704 ?auto_424710 ) ) ( not ( = ?auto_424704 ?auto_424711 ) ) ( not ( = ?auto_424704 ?auto_424712 ) ) ( not ( = ?auto_424704 ?auto_424713 ) ) ( not ( = ?auto_424704 ?auto_424714 ) ) ( not ( = ?auto_424705 ?auto_424706 ) ) ( not ( = ?auto_424705 ?auto_424707 ) ) ( not ( = ?auto_424705 ?auto_424708 ) ) ( not ( = ?auto_424705 ?auto_424709 ) ) ( not ( = ?auto_424705 ?auto_424710 ) ) ( not ( = ?auto_424705 ?auto_424711 ) ) ( not ( = ?auto_424705 ?auto_424712 ) ) ( not ( = ?auto_424705 ?auto_424713 ) ) ( not ( = ?auto_424705 ?auto_424714 ) ) ( not ( = ?auto_424706 ?auto_424707 ) ) ( not ( = ?auto_424706 ?auto_424708 ) ) ( not ( = ?auto_424706 ?auto_424709 ) ) ( not ( = ?auto_424706 ?auto_424710 ) ) ( not ( = ?auto_424706 ?auto_424711 ) ) ( not ( = ?auto_424706 ?auto_424712 ) ) ( not ( = ?auto_424706 ?auto_424713 ) ) ( not ( = ?auto_424706 ?auto_424714 ) ) ( not ( = ?auto_424707 ?auto_424708 ) ) ( not ( = ?auto_424707 ?auto_424709 ) ) ( not ( = ?auto_424707 ?auto_424710 ) ) ( not ( = ?auto_424707 ?auto_424711 ) ) ( not ( = ?auto_424707 ?auto_424712 ) ) ( not ( = ?auto_424707 ?auto_424713 ) ) ( not ( = ?auto_424707 ?auto_424714 ) ) ( not ( = ?auto_424708 ?auto_424709 ) ) ( not ( = ?auto_424708 ?auto_424710 ) ) ( not ( = ?auto_424708 ?auto_424711 ) ) ( not ( = ?auto_424708 ?auto_424712 ) ) ( not ( = ?auto_424708 ?auto_424713 ) ) ( not ( = ?auto_424708 ?auto_424714 ) ) ( not ( = ?auto_424709 ?auto_424710 ) ) ( not ( = ?auto_424709 ?auto_424711 ) ) ( not ( = ?auto_424709 ?auto_424712 ) ) ( not ( = ?auto_424709 ?auto_424713 ) ) ( not ( = ?auto_424709 ?auto_424714 ) ) ( not ( = ?auto_424710 ?auto_424711 ) ) ( not ( = ?auto_424710 ?auto_424712 ) ) ( not ( = ?auto_424710 ?auto_424713 ) ) ( not ( = ?auto_424710 ?auto_424714 ) ) ( not ( = ?auto_424711 ?auto_424712 ) ) ( not ( = ?auto_424711 ?auto_424713 ) ) ( not ( = ?auto_424711 ?auto_424714 ) ) ( not ( = ?auto_424712 ?auto_424713 ) ) ( not ( = ?auto_424712 ?auto_424714 ) ) ( not ( = ?auto_424713 ?auto_424714 ) ) ( ON ?auto_424712 ?auto_424713 ) ( ON ?auto_424711 ?auto_424712 ) ( ON ?auto_424710 ?auto_424711 ) ( ON ?auto_424709 ?auto_424710 ) ( ON ?auto_424708 ?auto_424709 ) ( CLEAR ?auto_424706 ) ( ON ?auto_424707 ?auto_424708 ) ( CLEAR ?auto_424707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_424704 ?auto_424705 ?auto_424706 ?auto_424707 )
      ( MAKE-10PILE ?auto_424704 ?auto_424705 ?auto_424706 ?auto_424707 ?auto_424708 ?auto_424709 ?auto_424710 ?auto_424711 ?auto_424712 ?auto_424713 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_424725 - BLOCK
      ?auto_424726 - BLOCK
      ?auto_424727 - BLOCK
      ?auto_424728 - BLOCK
      ?auto_424729 - BLOCK
      ?auto_424730 - BLOCK
      ?auto_424731 - BLOCK
      ?auto_424732 - BLOCK
      ?auto_424733 - BLOCK
      ?auto_424734 - BLOCK
    )
    :vars
    (
      ?auto_424735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424734 ?auto_424735 ) ( ON-TABLE ?auto_424725 ) ( ON ?auto_424726 ?auto_424725 ) ( ON ?auto_424727 ?auto_424726 ) ( not ( = ?auto_424725 ?auto_424726 ) ) ( not ( = ?auto_424725 ?auto_424727 ) ) ( not ( = ?auto_424725 ?auto_424728 ) ) ( not ( = ?auto_424725 ?auto_424729 ) ) ( not ( = ?auto_424725 ?auto_424730 ) ) ( not ( = ?auto_424725 ?auto_424731 ) ) ( not ( = ?auto_424725 ?auto_424732 ) ) ( not ( = ?auto_424725 ?auto_424733 ) ) ( not ( = ?auto_424725 ?auto_424734 ) ) ( not ( = ?auto_424725 ?auto_424735 ) ) ( not ( = ?auto_424726 ?auto_424727 ) ) ( not ( = ?auto_424726 ?auto_424728 ) ) ( not ( = ?auto_424726 ?auto_424729 ) ) ( not ( = ?auto_424726 ?auto_424730 ) ) ( not ( = ?auto_424726 ?auto_424731 ) ) ( not ( = ?auto_424726 ?auto_424732 ) ) ( not ( = ?auto_424726 ?auto_424733 ) ) ( not ( = ?auto_424726 ?auto_424734 ) ) ( not ( = ?auto_424726 ?auto_424735 ) ) ( not ( = ?auto_424727 ?auto_424728 ) ) ( not ( = ?auto_424727 ?auto_424729 ) ) ( not ( = ?auto_424727 ?auto_424730 ) ) ( not ( = ?auto_424727 ?auto_424731 ) ) ( not ( = ?auto_424727 ?auto_424732 ) ) ( not ( = ?auto_424727 ?auto_424733 ) ) ( not ( = ?auto_424727 ?auto_424734 ) ) ( not ( = ?auto_424727 ?auto_424735 ) ) ( not ( = ?auto_424728 ?auto_424729 ) ) ( not ( = ?auto_424728 ?auto_424730 ) ) ( not ( = ?auto_424728 ?auto_424731 ) ) ( not ( = ?auto_424728 ?auto_424732 ) ) ( not ( = ?auto_424728 ?auto_424733 ) ) ( not ( = ?auto_424728 ?auto_424734 ) ) ( not ( = ?auto_424728 ?auto_424735 ) ) ( not ( = ?auto_424729 ?auto_424730 ) ) ( not ( = ?auto_424729 ?auto_424731 ) ) ( not ( = ?auto_424729 ?auto_424732 ) ) ( not ( = ?auto_424729 ?auto_424733 ) ) ( not ( = ?auto_424729 ?auto_424734 ) ) ( not ( = ?auto_424729 ?auto_424735 ) ) ( not ( = ?auto_424730 ?auto_424731 ) ) ( not ( = ?auto_424730 ?auto_424732 ) ) ( not ( = ?auto_424730 ?auto_424733 ) ) ( not ( = ?auto_424730 ?auto_424734 ) ) ( not ( = ?auto_424730 ?auto_424735 ) ) ( not ( = ?auto_424731 ?auto_424732 ) ) ( not ( = ?auto_424731 ?auto_424733 ) ) ( not ( = ?auto_424731 ?auto_424734 ) ) ( not ( = ?auto_424731 ?auto_424735 ) ) ( not ( = ?auto_424732 ?auto_424733 ) ) ( not ( = ?auto_424732 ?auto_424734 ) ) ( not ( = ?auto_424732 ?auto_424735 ) ) ( not ( = ?auto_424733 ?auto_424734 ) ) ( not ( = ?auto_424733 ?auto_424735 ) ) ( not ( = ?auto_424734 ?auto_424735 ) ) ( ON ?auto_424733 ?auto_424734 ) ( ON ?auto_424732 ?auto_424733 ) ( ON ?auto_424731 ?auto_424732 ) ( ON ?auto_424730 ?auto_424731 ) ( ON ?auto_424729 ?auto_424730 ) ( CLEAR ?auto_424727 ) ( ON ?auto_424728 ?auto_424729 ) ( CLEAR ?auto_424728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_424725 ?auto_424726 ?auto_424727 ?auto_424728 )
      ( MAKE-10PILE ?auto_424725 ?auto_424726 ?auto_424727 ?auto_424728 ?auto_424729 ?auto_424730 ?auto_424731 ?auto_424732 ?auto_424733 ?auto_424734 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_424746 - BLOCK
      ?auto_424747 - BLOCK
      ?auto_424748 - BLOCK
      ?auto_424749 - BLOCK
      ?auto_424750 - BLOCK
      ?auto_424751 - BLOCK
      ?auto_424752 - BLOCK
      ?auto_424753 - BLOCK
      ?auto_424754 - BLOCK
      ?auto_424755 - BLOCK
    )
    :vars
    (
      ?auto_424756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424755 ?auto_424756 ) ( ON-TABLE ?auto_424746 ) ( ON ?auto_424747 ?auto_424746 ) ( not ( = ?auto_424746 ?auto_424747 ) ) ( not ( = ?auto_424746 ?auto_424748 ) ) ( not ( = ?auto_424746 ?auto_424749 ) ) ( not ( = ?auto_424746 ?auto_424750 ) ) ( not ( = ?auto_424746 ?auto_424751 ) ) ( not ( = ?auto_424746 ?auto_424752 ) ) ( not ( = ?auto_424746 ?auto_424753 ) ) ( not ( = ?auto_424746 ?auto_424754 ) ) ( not ( = ?auto_424746 ?auto_424755 ) ) ( not ( = ?auto_424746 ?auto_424756 ) ) ( not ( = ?auto_424747 ?auto_424748 ) ) ( not ( = ?auto_424747 ?auto_424749 ) ) ( not ( = ?auto_424747 ?auto_424750 ) ) ( not ( = ?auto_424747 ?auto_424751 ) ) ( not ( = ?auto_424747 ?auto_424752 ) ) ( not ( = ?auto_424747 ?auto_424753 ) ) ( not ( = ?auto_424747 ?auto_424754 ) ) ( not ( = ?auto_424747 ?auto_424755 ) ) ( not ( = ?auto_424747 ?auto_424756 ) ) ( not ( = ?auto_424748 ?auto_424749 ) ) ( not ( = ?auto_424748 ?auto_424750 ) ) ( not ( = ?auto_424748 ?auto_424751 ) ) ( not ( = ?auto_424748 ?auto_424752 ) ) ( not ( = ?auto_424748 ?auto_424753 ) ) ( not ( = ?auto_424748 ?auto_424754 ) ) ( not ( = ?auto_424748 ?auto_424755 ) ) ( not ( = ?auto_424748 ?auto_424756 ) ) ( not ( = ?auto_424749 ?auto_424750 ) ) ( not ( = ?auto_424749 ?auto_424751 ) ) ( not ( = ?auto_424749 ?auto_424752 ) ) ( not ( = ?auto_424749 ?auto_424753 ) ) ( not ( = ?auto_424749 ?auto_424754 ) ) ( not ( = ?auto_424749 ?auto_424755 ) ) ( not ( = ?auto_424749 ?auto_424756 ) ) ( not ( = ?auto_424750 ?auto_424751 ) ) ( not ( = ?auto_424750 ?auto_424752 ) ) ( not ( = ?auto_424750 ?auto_424753 ) ) ( not ( = ?auto_424750 ?auto_424754 ) ) ( not ( = ?auto_424750 ?auto_424755 ) ) ( not ( = ?auto_424750 ?auto_424756 ) ) ( not ( = ?auto_424751 ?auto_424752 ) ) ( not ( = ?auto_424751 ?auto_424753 ) ) ( not ( = ?auto_424751 ?auto_424754 ) ) ( not ( = ?auto_424751 ?auto_424755 ) ) ( not ( = ?auto_424751 ?auto_424756 ) ) ( not ( = ?auto_424752 ?auto_424753 ) ) ( not ( = ?auto_424752 ?auto_424754 ) ) ( not ( = ?auto_424752 ?auto_424755 ) ) ( not ( = ?auto_424752 ?auto_424756 ) ) ( not ( = ?auto_424753 ?auto_424754 ) ) ( not ( = ?auto_424753 ?auto_424755 ) ) ( not ( = ?auto_424753 ?auto_424756 ) ) ( not ( = ?auto_424754 ?auto_424755 ) ) ( not ( = ?auto_424754 ?auto_424756 ) ) ( not ( = ?auto_424755 ?auto_424756 ) ) ( ON ?auto_424754 ?auto_424755 ) ( ON ?auto_424753 ?auto_424754 ) ( ON ?auto_424752 ?auto_424753 ) ( ON ?auto_424751 ?auto_424752 ) ( ON ?auto_424750 ?auto_424751 ) ( ON ?auto_424749 ?auto_424750 ) ( CLEAR ?auto_424747 ) ( ON ?auto_424748 ?auto_424749 ) ( CLEAR ?auto_424748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_424746 ?auto_424747 ?auto_424748 )
      ( MAKE-10PILE ?auto_424746 ?auto_424747 ?auto_424748 ?auto_424749 ?auto_424750 ?auto_424751 ?auto_424752 ?auto_424753 ?auto_424754 ?auto_424755 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_424767 - BLOCK
      ?auto_424768 - BLOCK
      ?auto_424769 - BLOCK
      ?auto_424770 - BLOCK
      ?auto_424771 - BLOCK
      ?auto_424772 - BLOCK
      ?auto_424773 - BLOCK
      ?auto_424774 - BLOCK
      ?auto_424775 - BLOCK
      ?auto_424776 - BLOCK
    )
    :vars
    (
      ?auto_424777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424776 ?auto_424777 ) ( ON-TABLE ?auto_424767 ) ( ON ?auto_424768 ?auto_424767 ) ( not ( = ?auto_424767 ?auto_424768 ) ) ( not ( = ?auto_424767 ?auto_424769 ) ) ( not ( = ?auto_424767 ?auto_424770 ) ) ( not ( = ?auto_424767 ?auto_424771 ) ) ( not ( = ?auto_424767 ?auto_424772 ) ) ( not ( = ?auto_424767 ?auto_424773 ) ) ( not ( = ?auto_424767 ?auto_424774 ) ) ( not ( = ?auto_424767 ?auto_424775 ) ) ( not ( = ?auto_424767 ?auto_424776 ) ) ( not ( = ?auto_424767 ?auto_424777 ) ) ( not ( = ?auto_424768 ?auto_424769 ) ) ( not ( = ?auto_424768 ?auto_424770 ) ) ( not ( = ?auto_424768 ?auto_424771 ) ) ( not ( = ?auto_424768 ?auto_424772 ) ) ( not ( = ?auto_424768 ?auto_424773 ) ) ( not ( = ?auto_424768 ?auto_424774 ) ) ( not ( = ?auto_424768 ?auto_424775 ) ) ( not ( = ?auto_424768 ?auto_424776 ) ) ( not ( = ?auto_424768 ?auto_424777 ) ) ( not ( = ?auto_424769 ?auto_424770 ) ) ( not ( = ?auto_424769 ?auto_424771 ) ) ( not ( = ?auto_424769 ?auto_424772 ) ) ( not ( = ?auto_424769 ?auto_424773 ) ) ( not ( = ?auto_424769 ?auto_424774 ) ) ( not ( = ?auto_424769 ?auto_424775 ) ) ( not ( = ?auto_424769 ?auto_424776 ) ) ( not ( = ?auto_424769 ?auto_424777 ) ) ( not ( = ?auto_424770 ?auto_424771 ) ) ( not ( = ?auto_424770 ?auto_424772 ) ) ( not ( = ?auto_424770 ?auto_424773 ) ) ( not ( = ?auto_424770 ?auto_424774 ) ) ( not ( = ?auto_424770 ?auto_424775 ) ) ( not ( = ?auto_424770 ?auto_424776 ) ) ( not ( = ?auto_424770 ?auto_424777 ) ) ( not ( = ?auto_424771 ?auto_424772 ) ) ( not ( = ?auto_424771 ?auto_424773 ) ) ( not ( = ?auto_424771 ?auto_424774 ) ) ( not ( = ?auto_424771 ?auto_424775 ) ) ( not ( = ?auto_424771 ?auto_424776 ) ) ( not ( = ?auto_424771 ?auto_424777 ) ) ( not ( = ?auto_424772 ?auto_424773 ) ) ( not ( = ?auto_424772 ?auto_424774 ) ) ( not ( = ?auto_424772 ?auto_424775 ) ) ( not ( = ?auto_424772 ?auto_424776 ) ) ( not ( = ?auto_424772 ?auto_424777 ) ) ( not ( = ?auto_424773 ?auto_424774 ) ) ( not ( = ?auto_424773 ?auto_424775 ) ) ( not ( = ?auto_424773 ?auto_424776 ) ) ( not ( = ?auto_424773 ?auto_424777 ) ) ( not ( = ?auto_424774 ?auto_424775 ) ) ( not ( = ?auto_424774 ?auto_424776 ) ) ( not ( = ?auto_424774 ?auto_424777 ) ) ( not ( = ?auto_424775 ?auto_424776 ) ) ( not ( = ?auto_424775 ?auto_424777 ) ) ( not ( = ?auto_424776 ?auto_424777 ) ) ( ON ?auto_424775 ?auto_424776 ) ( ON ?auto_424774 ?auto_424775 ) ( ON ?auto_424773 ?auto_424774 ) ( ON ?auto_424772 ?auto_424773 ) ( ON ?auto_424771 ?auto_424772 ) ( ON ?auto_424770 ?auto_424771 ) ( CLEAR ?auto_424768 ) ( ON ?auto_424769 ?auto_424770 ) ( CLEAR ?auto_424769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_424767 ?auto_424768 ?auto_424769 )
      ( MAKE-10PILE ?auto_424767 ?auto_424768 ?auto_424769 ?auto_424770 ?auto_424771 ?auto_424772 ?auto_424773 ?auto_424774 ?auto_424775 ?auto_424776 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_424788 - BLOCK
      ?auto_424789 - BLOCK
      ?auto_424790 - BLOCK
      ?auto_424791 - BLOCK
      ?auto_424792 - BLOCK
      ?auto_424793 - BLOCK
      ?auto_424794 - BLOCK
      ?auto_424795 - BLOCK
      ?auto_424796 - BLOCK
      ?auto_424797 - BLOCK
    )
    :vars
    (
      ?auto_424798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424797 ?auto_424798 ) ( ON-TABLE ?auto_424788 ) ( not ( = ?auto_424788 ?auto_424789 ) ) ( not ( = ?auto_424788 ?auto_424790 ) ) ( not ( = ?auto_424788 ?auto_424791 ) ) ( not ( = ?auto_424788 ?auto_424792 ) ) ( not ( = ?auto_424788 ?auto_424793 ) ) ( not ( = ?auto_424788 ?auto_424794 ) ) ( not ( = ?auto_424788 ?auto_424795 ) ) ( not ( = ?auto_424788 ?auto_424796 ) ) ( not ( = ?auto_424788 ?auto_424797 ) ) ( not ( = ?auto_424788 ?auto_424798 ) ) ( not ( = ?auto_424789 ?auto_424790 ) ) ( not ( = ?auto_424789 ?auto_424791 ) ) ( not ( = ?auto_424789 ?auto_424792 ) ) ( not ( = ?auto_424789 ?auto_424793 ) ) ( not ( = ?auto_424789 ?auto_424794 ) ) ( not ( = ?auto_424789 ?auto_424795 ) ) ( not ( = ?auto_424789 ?auto_424796 ) ) ( not ( = ?auto_424789 ?auto_424797 ) ) ( not ( = ?auto_424789 ?auto_424798 ) ) ( not ( = ?auto_424790 ?auto_424791 ) ) ( not ( = ?auto_424790 ?auto_424792 ) ) ( not ( = ?auto_424790 ?auto_424793 ) ) ( not ( = ?auto_424790 ?auto_424794 ) ) ( not ( = ?auto_424790 ?auto_424795 ) ) ( not ( = ?auto_424790 ?auto_424796 ) ) ( not ( = ?auto_424790 ?auto_424797 ) ) ( not ( = ?auto_424790 ?auto_424798 ) ) ( not ( = ?auto_424791 ?auto_424792 ) ) ( not ( = ?auto_424791 ?auto_424793 ) ) ( not ( = ?auto_424791 ?auto_424794 ) ) ( not ( = ?auto_424791 ?auto_424795 ) ) ( not ( = ?auto_424791 ?auto_424796 ) ) ( not ( = ?auto_424791 ?auto_424797 ) ) ( not ( = ?auto_424791 ?auto_424798 ) ) ( not ( = ?auto_424792 ?auto_424793 ) ) ( not ( = ?auto_424792 ?auto_424794 ) ) ( not ( = ?auto_424792 ?auto_424795 ) ) ( not ( = ?auto_424792 ?auto_424796 ) ) ( not ( = ?auto_424792 ?auto_424797 ) ) ( not ( = ?auto_424792 ?auto_424798 ) ) ( not ( = ?auto_424793 ?auto_424794 ) ) ( not ( = ?auto_424793 ?auto_424795 ) ) ( not ( = ?auto_424793 ?auto_424796 ) ) ( not ( = ?auto_424793 ?auto_424797 ) ) ( not ( = ?auto_424793 ?auto_424798 ) ) ( not ( = ?auto_424794 ?auto_424795 ) ) ( not ( = ?auto_424794 ?auto_424796 ) ) ( not ( = ?auto_424794 ?auto_424797 ) ) ( not ( = ?auto_424794 ?auto_424798 ) ) ( not ( = ?auto_424795 ?auto_424796 ) ) ( not ( = ?auto_424795 ?auto_424797 ) ) ( not ( = ?auto_424795 ?auto_424798 ) ) ( not ( = ?auto_424796 ?auto_424797 ) ) ( not ( = ?auto_424796 ?auto_424798 ) ) ( not ( = ?auto_424797 ?auto_424798 ) ) ( ON ?auto_424796 ?auto_424797 ) ( ON ?auto_424795 ?auto_424796 ) ( ON ?auto_424794 ?auto_424795 ) ( ON ?auto_424793 ?auto_424794 ) ( ON ?auto_424792 ?auto_424793 ) ( ON ?auto_424791 ?auto_424792 ) ( ON ?auto_424790 ?auto_424791 ) ( CLEAR ?auto_424788 ) ( ON ?auto_424789 ?auto_424790 ) ( CLEAR ?auto_424789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_424788 ?auto_424789 )
      ( MAKE-10PILE ?auto_424788 ?auto_424789 ?auto_424790 ?auto_424791 ?auto_424792 ?auto_424793 ?auto_424794 ?auto_424795 ?auto_424796 ?auto_424797 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_424809 - BLOCK
      ?auto_424810 - BLOCK
      ?auto_424811 - BLOCK
      ?auto_424812 - BLOCK
      ?auto_424813 - BLOCK
      ?auto_424814 - BLOCK
      ?auto_424815 - BLOCK
      ?auto_424816 - BLOCK
      ?auto_424817 - BLOCK
      ?auto_424818 - BLOCK
    )
    :vars
    (
      ?auto_424819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424818 ?auto_424819 ) ( ON-TABLE ?auto_424809 ) ( not ( = ?auto_424809 ?auto_424810 ) ) ( not ( = ?auto_424809 ?auto_424811 ) ) ( not ( = ?auto_424809 ?auto_424812 ) ) ( not ( = ?auto_424809 ?auto_424813 ) ) ( not ( = ?auto_424809 ?auto_424814 ) ) ( not ( = ?auto_424809 ?auto_424815 ) ) ( not ( = ?auto_424809 ?auto_424816 ) ) ( not ( = ?auto_424809 ?auto_424817 ) ) ( not ( = ?auto_424809 ?auto_424818 ) ) ( not ( = ?auto_424809 ?auto_424819 ) ) ( not ( = ?auto_424810 ?auto_424811 ) ) ( not ( = ?auto_424810 ?auto_424812 ) ) ( not ( = ?auto_424810 ?auto_424813 ) ) ( not ( = ?auto_424810 ?auto_424814 ) ) ( not ( = ?auto_424810 ?auto_424815 ) ) ( not ( = ?auto_424810 ?auto_424816 ) ) ( not ( = ?auto_424810 ?auto_424817 ) ) ( not ( = ?auto_424810 ?auto_424818 ) ) ( not ( = ?auto_424810 ?auto_424819 ) ) ( not ( = ?auto_424811 ?auto_424812 ) ) ( not ( = ?auto_424811 ?auto_424813 ) ) ( not ( = ?auto_424811 ?auto_424814 ) ) ( not ( = ?auto_424811 ?auto_424815 ) ) ( not ( = ?auto_424811 ?auto_424816 ) ) ( not ( = ?auto_424811 ?auto_424817 ) ) ( not ( = ?auto_424811 ?auto_424818 ) ) ( not ( = ?auto_424811 ?auto_424819 ) ) ( not ( = ?auto_424812 ?auto_424813 ) ) ( not ( = ?auto_424812 ?auto_424814 ) ) ( not ( = ?auto_424812 ?auto_424815 ) ) ( not ( = ?auto_424812 ?auto_424816 ) ) ( not ( = ?auto_424812 ?auto_424817 ) ) ( not ( = ?auto_424812 ?auto_424818 ) ) ( not ( = ?auto_424812 ?auto_424819 ) ) ( not ( = ?auto_424813 ?auto_424814 ) ) ( not ( = ?auto_424813 ?auto_424815 ) ) ( not ( = ?auto_424813 ?auto_424816 ) ) ( not ( = ?auto_424813 ?auto_424817 ) ) ( not ( = ?auto_424813 ?auto_424818 ) ) ( not ( = ?auto_424813 ?auto_424819 ) ) ( not ( = ?auto_424814 ?auto_424815 ) ) ( not ( = ?auto_424814 ?auto_424816 ) ) ( not ( = ?auto_424814 ?auto_424817 ) ) ( not ( = ?auto_424814 ?auto_424818 ) ) ( not ( = ?auto_424814 ?auto_424819 ) ) ( not ( = ?auto_424815 ?auto_424816 ) ) ( not ( = ?auto_424815 ?auto_424817 ) ) ( not ( = ?auto_424815 ?auto_424818 ) ) ( not ( = ?auto_424815 ?auto_424819 ) ) ( not ( = ?auto_424816 ?auto_424817 ) ) ( not ( = ?auto_424816 ?auto_424818 ) ) ( not ( = ?auto_424816 ?auto_424819 ) ) ( not ( = ?auto_424817 ?auto_424818 ) ) ( not ( = ?auto_424817 ?auto_424819 ) ) ( not ( = ?auto_424818 ?auto_424819 ) ) ( ON ?auto_424817 ?auto_424818 ) ( ON ?auto_424816 ?auto_424817 ) ( ON ?auto_424815 ?auto_424816 ) ( ON ?auto_424814 ?auto_424815 ) ( ON ?auto_424813 ?auto_424814 ) ( ON ?auto_424812 ?auto_424813 ) ( ON ?auto_424811 ?auto_424812 ) ( CLEAR ?auto_424809 ) ( ON ?auto_424810 ?auto_424811 ) ( CLEAR ?auto_424810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_424809 ?auto_424810 )
      ( MAKE-10PILE ?auto_424809 ?auto_424810 ?auto_424811 ?auto_424812 ?auto_424813 ?auto_424814 ?auto_424815 ?auto_424816 ?auto_424817 ?auto_424818 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_424830 - BLOCK
      ?auto_424831 - BLOCK
      ?auto_424832 - BLOCK
      ?auto_424833 - BLOCK
      ?auto_424834 - BLOCK
      ?auto_424835 - BLOCK
      ?auto_424836 - BLOCK
      ?auto_424837 - BLOCK
      ?auto_424838 - BLOCK
      ?auto_424839 - BLOCK
    )
    :vars
    (
      ?auto_424840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424839 ?auto_424840 ) ( not ( = ?auto_424830 ?auto_424831 ) ) ( not ( = ?auto_424830 ?auto_424832 ) ) ( not ( = ?auto_424830 ?auto_424833 ) ) ( not ( = ?auto_424830 ?auto_424834 ) ) ( not ( = ?auto_424830 ?auto_424835 ) ) ( not ( = ?auto_424830 ?auto_424836 ) ) ( not ( = ?auto_424830 ?auto_424837 ) ) ( not ( = ?auto_424830 ?auto_424838 ) ) ( not ( = ?auto_424830 ?auto_424839 ) ) ( not ( = ?auto_424830 ?auto_424840 ) ) ( not ( = ?auto_424831 ?auto_424832 ) ) ( not ( = ?auto_424831 ?auto_424833 ) ) ( not ( = ?auto_424831 ?auto_424834 ) ) ( not ( = ?auto_424831 ?auto_424835 ) ) ( not ( = ?auto_424831 ?auto_424836 ) ) ( not ( = ?auto_424831 ?auto_424837 ) ) ( not ( = ?auto_424831 ?auto_424838 ) ) ( not ( = ?auto_424831 ?auto_424839 ) ) ( not ( = ?auto_424831 ?auto_424840 ) ) ( not ( = ?auto_424832 ?auto_424833 ) ) ( not ( = ?auto_424832 ?auto_424834 ) ) ( not ( = ?auto_424832 ?auto_424835 ) ) ( not ( = ?auto_424832 ?auto_424836 ) ) ( not ( = ?auto_424832 ?auto_424837 ) ) ( not ( = ?auto_424832 ?auto_424838 ) ) ( not ( = ?auto_424832 ?auto_424839 ) ) ( not ( = ?auto_424832 ?auto_424840 ) ) ( not ( = ?auto_424833 ?auto_424834 ) ) ( not ( = ?auto_424833 ?auto_424835 ) ) ( not ( = ?auto_424833 ?auto_424836 ) ) ( not ( = ?auto_424833 ?auto_424837 ) ) ( not ( = ?auto_424833 ?auto_424838 ) ) ( not ( = ?auto_424833 ?auto_424839 ) ) ( not ( = ?auto_424833 ?auto_424840 ) ) ( not ( = ?auto_424834 ?auto_424835 ) ) ( not ( = ?auto_424834 ?auto_424836 ) ) ( not ( = ?auto_424834 ?auto_424837 ) ) ( not ( = ?auto_424834 ?auto_424838 ) ) ( not ( = ?auto_424834 ?auto_424839 ) ) ( not ( = ?auto_424834 ?auto_424840 ) ) ( not ( = ?auto_424835 ?auto_424836 ) ) ( not ( = ?auto_424835 ?auto_424837 ) ) ( not ( = ?auto_424835 ?auto_424838 ) ) ( not ( = ?auto_424835 ?auto_424839 ) ) ( not ( = ?auto_424835 ?auto_424840 ) ) ( not ( = ?auto_424836 ?auto_424837 ) ) ( not ( = ?auto_424836 ?auto_424838 ) ) ( not ( = ?auto_424836 ?auto_424839 ) ) ( not ( = ?auto_424836 ?auto_424840 ) ) ( not ( = ?auto_424837 ?auto_424838 ) ) ( not ( = ?auto_424837 ?auto_424839 ) ) ( not ( = ?auto_424837 ?auto_424840 ) ) ( not ( = ?auto_424838 ?auto_424839 ) ) ( not ( = ?auto_424838 ?auto_424840 ) ) ( not ( = ?auto_424839 ?auto_424840 ) ) ( ON ?auto_424838 ?auto_424839 ) ( ON ?auto_424837 ?auto_424838 ) ( ON ?auto_424836 ?auto_424837 ) ( ON ?auto_424835 ?auto_424836 ) ( ON ?auto_424834 ?auto_424835 ) ( ON ?auto_424833 ?auto_424834 ) ( ON ?auto_424832 ?auto_424833 ) ( ON ?auto_424831 ?auto_424832 ) ( ON ?auto_424830 ?auto_424831 ) ( CLEAR ?auto_424830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_424830 )
      ( MAKE-10PILE ?auto_424830 ?auto_424831 ?auto_424832 ?auto_424833 ?auto_424834 ?auto_424835 ?auto_424836 ?auto_424837 ?auto_424838 ?auto_424839 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_424851 - BLOCK
      ?auto_424852 - BLOCK
      ?auto_424853 - BLOCK
      ?auto_424854 - BLOCK
      ?auto_424855 - BLOCK
      ?auto_424856 - BLOCK
      ?auto_424857 - BLOCK
      ?auto_424858 - BLOCK
      ?auto_424859 - BLOCK
      ?auto_424860 - BLOCK
    )
    :vars
    (
      ?auto_424861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424860 ?auto_424861 ) ( not ( = ?auto_424851 ?auto_424852 ) ) ( not ( = ?auto_424851 ?auto_424853 ) ) ( not ( = ?auto_424851 ?auto_424854 ) ) ( not ( = ?auto_424851 ?auto_424855 ) ) ( not ( = ?auto_424851 ?auto_424856 ) ) ( not ( = ?auto_424851 ?auto_424857 ) ) ( not ( = ?auto_424851 ?auto_424858 ) ) ( not ( = ?auto_424851 ?auto_424859 ) ) ( not ( = ?auto_424851 ?auto_424860 ) ) ( not ( = ?auto_424851 ?auto_424861 ) ) ( not ( = ?auto_424852 ?auto_424853 ) ) ( not ( = ?auto_424852 ?auto_424854 ) ) ( not ( = ?auto_424852 ?auto_424855 ) ) ( not ( = ?auto_424852 ?auto_424856 ) ) ( not ( = ?auto_424852 ?auto_424857 ) ) ( not ( = ?auto_424852 ?auto_424858 ) ) ( not ( = ?auto_424852 ?auto_424859 ) ) ( not ( = ?auto_424852 ?auto_424860 ) ) ( not ( = ?auto_424852 ?auto_424861 ) ) ( not ( = ?auto_424853 ?auto_424854 ) ) ( not ( = ?auto_424853 ?auto_424855 ) ) ( not ( = ?auto_424853 ?auto_424856 ) ) ( not ( = ?auto_424853 ?auto_424857 ) ) ( not ( = ?auto_424853 ?auto_424858 ) ) ( not ( = ?auto_424853 ?auto_424859 ) ) ( not ( = ?auto_424853 ?auto_424860 ) ) ( not ( = ?auto_424853 ?auto_424861 ) ) ( not ( = ?auto_424854 ?auto_424855 ) ) ( not ( = ?auto_424854 ?auto_424856 ) ) ( not ( = ?auto_424854 ?auto_424857 ) ) ( not ( = ?auto_424854 ?auto_424858 ) ) ( not ( = ?auto_424854 ?auto_424859 ) ) ( not ( = ?auto_424854 ?auto_424860 ) ) ( not ( = ?auto_424854 ?auto_424861 ) ) ( not ( = ?auto_424855 ?auto_424856 ) ) ( not ( = ?auto_424855 ?auto_424857 ) ) ( not ( = ?auto_424855 ?auto_424858 ) ) ( not ( = ?auto_424855 ?auto_424859 ) ) ( not ( = ?auto_424855 ?auto_424860 ) ) ( not ( = ?auto_424855 ?auto_424861 ) ) ( not ( = ?auto_424856 ?auto_424857 ) ) ( not ( = ?auto_424856 ?auto_424858 ) ) ( not ( = ?auto_424856 ?auto_424859 ) ) ( not ( = ?auto_424856 ?auto_424860 ) ) ( not ( = ?auto_424856 ?auto_424861 ) ) ( not ( = ?auto_424857 ?auto_424858 ) ) ( not ( = ?auto_424857 ?auto_424859 ) ) ( not ( = ?auto_424857 ?auto_424860 ) ) ( not ( = ?auto_424857 ?auto_424861 ) ) ( not ( = ?auto_424858 ?auto_424859 ) ) ( not ( = ?auto_424858 ?auto_424860 ) ) ( not ( = ?auto_424858 ?auto_424861 ) ) ( not ( = ?auto_424859 ?auto_424860 ) ) ( not ( = ?auto_424859 ?auto_424861 ) ) ( not ( = ?auto_424860 ?auto_424861 ) ) ( ON ?auto_424859 ?auto_424860 ) ( ON ?auto_424858 ?auto_424859 ) ( ON ?auto_424857 ?auto_424858 ) ( ON ?auto_424856 ?auto_424857 ) ( ON ?auto_424855 ?auto_424856 ) ( ON ?auto_424854 ?auto_424855 ) ( ON ?auto_424853 ?auto_424854 ) ( ON ?auto_424852 ?auto_424853 ) ( ON ?auto_424851 ?auto_424852 ) ( CLEAR ?auto_424851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_424851 )
      ( MAKE-10PILE ?auto_424851 ?auto_424852 ?auto_424853 ?auto_424854 ?auto_424855 ?auto_424856 ?auto_424857 ?auto_424858 ?auto_424859 ?auto_424860 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_424873 - BLOCK
      ?auto_424874 - BLOCK
      ?auto_424875 - BLOCK
      ?auto_424876 - BLOCK
      ?auto_424877 - BLOCK
      ?auto_424878 - BLOCK
      ?auto_424879 - BLOCK
      ?auto_424880 - BLOCK
      ?auto_424881 - BLOCK
      ?auto_424882 - BLOCK
      ?auto_424883 - BLOCK
    )
    :vars
    (
      ?auto_424884 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_424882 ) ( ON ?auto_424883 ?auto_424884 ) ( CLEAR ?auto_424883 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_424873 ) ( ON ?auto_424874 ?auto_424873 ) ( ON ?auto_424875 ?auto_424874 ) ( ON ?auto_424876 ?auto_424875 ) ( ON ?auto_424877 ?auto_424876 ) ( ON ?auto_424878 ?auto_424877 ) ( ON ?auto_424879 ?auto_424878 ) ( ON ?auto_424880 ?auto_424879 ) ( ON ?auto_424881 ?auto_424880 ) ( ON ?auto_424882 ?auto_424881 ) ( not ( = ?auto_424873 ?auto_424874 ) ) ( not ( = ?auto_424873 ?auto_424875 ) ) ( not ( = ?auto_424873 ?auto_424876 ) ) ( not ( = ?auto_424873 ?auto_424877 ) ) ( not ( = ?auto_424873 ?auto_424878 ) ) ( not ( = ?auto_424873 ?auto_424879 ) ) ( not ( = ?auto_424873 ?auto_424880 ) ) ( not ( = ?auto_424873 ?auto_424881 ) ) ( not ( = ?auto_424873 ?auto_424882 ) ) ( not ( = ?auto_424873 ?auto_424883 ) ) ( not ( = ?auto_424873 ?auto_424884 ) ) ( not ( = ?auto_424874 ?auto_424875 ) ) ( not ( = ?auto_424874 ?auto_424876 ) ) ( not ( = ?auto_424874 ?auto_424877 ) ) ( not ( = ?auto_424874 ?auto_424878 ) ) ( not ( = ?auto_424874 ?auto_424879 ) ) ( not ( = ?auto_424874 ?auto_424880 ) ) ( not ( = ?auto_424874 ?auto_424881 ) ) ( not ( = ?auto_424874 ?auto_424882 ) ) ( not ( = ?auto_424874 ?auto_424883 ) ) ( not ( = ?auto_424874 ?auto_424884 ) ) ( not ( = ?auto_424875 ?auto_424876 ) ) ( not ( = ?auto_424875 ?auto_424877 ) ) ( not ( = ?auto_424875 ?auto_424878 ) ) ( not ( = ?auto_424875 ?auto_424879 ) ) ( not ( = ?auto_424875 ?auto_424880 ) ) ( not ( = ?auto_424875 ?auto_424881 ) ) ( not ( = ?auto_424875 ?auto_424882 ) ) ( not ( = ?auto_424875 ?auto_424883 ) ) ( not ( = ?auto_424875 ?auto_424884 ) ) ( not ( = ?auto_424876 ?auto_424877 ) ) ( not ( = ?auto_424876 ?auto_424878 ) ) ( not ( = ?auto_424876 ?auto_424879 ) ) ( not ( = ?auto_424876 ?auto_424880 ) ) ( not ( = ?auto_424876 ?auto_424881 ) ) ( not ( = ?auto_424876 ?auto_424882 ) ) ( not ( = ?auto_424876 ?auto_424883 ) ) ( not ( = ?auto_424876 ?auto_424884 ) ) ( not ( = ?auto_424877 ?auto_424878 ) ) ( not ( = ?auto_424877 ?auto_424879 ) ) ( not ( = ?auto_424877 ?auto_424880 ) ) ( not ( = ?auto_424877 ?auto_424881 ) ) ( not ( = ?auto_424877 ?auto_424882 ) ) ( not ( = ?auto_424877 ?auto_424883 ) ) ( not ( = ?auto_424877 ?auto_424884 ) ) ( not ( = ?auto_424878 ?auto_424879 ) ) ( not ( = ?auto_424878 ?auto_424880 ) ) ( not ( = ?auto_424878 ?auto_424881 ) ) ( not ( = ?auto_424878 ?auto_424882 ) ) ( not ( = ?auto_424878 ?auto_424883 ) ) ( not ( = ?auto_424878 ?auto_424884 ) ) ( not ( = ?auto_424879 ?auto_424880 ) ) ( not ( = ?auto_424879 ?auto_424881 ) ) ( not ( = ?auto_424879 ?auto_424882 ) ) ( not ( = ?auto_424879 ?auto_424883 ) ) ( not ( = ?auto_424879 ?auto_424884 ) ) ( not ( = ?auto_424880 ?auto_424881 ) ) ( not ( = ?auto_424880 ?auto_424882 ) ) ( not ( = ?auto_424880 ?auto_424883 ) ) ( not ( = ?auto_424880 ?auto_424884 ) ) ( not ( = ?auto_424881 ?auto_424882 ) ) ( not ( = ?auto_424881 ?auto_424883 ) ) ( not ( = ?auto_424881 ?auto_424884 ) ) ( not ( = ?auto_424882 ?auto_424883 ) ) ( not ( = ?auto_424882 ?auto_424884 ) ) ( not ( = ?auto_424883 ?auto_424884 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_424883 ?auto_424884 )
      ( !STACK ?auto_424883 ?auto_424882 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_424896 - BLOCK
      ?auto_424897 - BLOCK
      ?auto_424898 - BLOCK
      ?auto_424899 - BLOCK
      ?auto_424900 - BLOCK
      ?auto_424901 - BLOCK
      ?auto_424902 - BLOCK
      ?auto_424903 - BLOCK
      ?auto_424904 - BLOCK
      ?auto_424905 - BLOCK
      ?auto_424906 - BLOCK
    )
    :vars
    (
      ?auto_424907 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_424905 ) ( ON ?auto_424906 ?auto_424907 ) ( CLEAR ?auto_424906 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_424896 ) ( ON ?auto_424897 ?auto_424896 ) ( ON ?auto_424898 ?auto_424897 ) ( ON ?auto_424899 ?auto_424898 ) ( ON ?auto_424900 ?auto_424899 ) ( ON ?auto_424901 ?auto_424900 ) ( ON ?auto_424902 ?auto_424901 ) ( ON ?auto_424903 ?auto_424902 ) ( ON ?auto_424904 ?auto_424903 ) ( ON ?auto_424905 ?auto_424904 ) ( not ( = ?auto_424896 ?auto_424897 ) ) ( not ( = ?auto_424896 ?auto_424898 ) ) ( not ( = ?auto_424896 ?auto_424899 ) ) ( not ( = ?auto_424896 ?auto_424900 ) ) ( not ( = ?auto_424896 ?auto_424901 ) ) ( not ( = ?auto_424896 ?auto_424902 ) ) ( not ( = ?auto_424896 ?auto_424903 ) ) ( not ( = ?auto_424896 ?auto_424904 ) ) ( not ( = ?auto_424896 ?auto_424905 ) ) ( not ( = ?auto_424896 ?auto_424906 ) ) ( not ( = ?auto_424896 ?auto_424907 ) ) ( not ( = ?auto_424897 ?auto_424898 ) ) ( not ( = ?auto_424897 ?auto_424899 ) ) ( not ( = ?auto_424897 ?auto_424900 ) ) ( not ( = ?auto_424897 ?auto_424901 ) ) ( not ( = ?auto_424897 ?auto_424902 ) ) ( not ( = ?auto_424897 ?auto_424903 ) ) ( not ( = ?auto_424897 ?auto_424904 ) ) ( not ( = ?auto_424897 ?auto_424905 ) ) ( not ( = ?auto_424897 ?auto_424906 ) ) ( not ( = ?auto_424897 ?auto_424907 ) ) ( not ( = ?auto_424898 ?auto_424899 ) ) ( not ( = ?auto_424898 ?auto_424900 ) ) ( not ( = ?auto_424898 ?auto_424901 ) ) ( not ( = ?auto_424898 ?auto_424902 ) ) ( not ( = ?auto_424898 ?auto_424903 ) ) ( not ( = ?auto_424898 ?auto_424904 ) ) ( not ( = ?auto_424898 ?auto_424905 ) ) ( not ( = ?auto_424898 ?auto_424906 ) ) ( not ( = ?auto_424898 ?auto_424907 ) ) ( not ( = ?auto_424899 ?auto_424900 ) ) ( not ( = ?auto_424899 ?auto_424901 ) ) ( not ( = ?auto_424899 ?auto_424902 ) ) ( not ( = ?auto_424899 ?auto_424903 ) ) ( not ( = ?auto_424899 ?auto_424904 ) ) ( not ( = ?auto_424899 ?auto_424905 ) ) ( not ( = ?auto_424899 ?auto_424906 ) ) ( not ( = ?auto_424899 ?auto_424907 ) ) ( not ( = ?auto_424900 ?auto_424901 ) ) ( not ( = ?auto_424900 ?auto_424902 ) ) ( not ( = ?auto_424900 ?auto_424903 ) ) ( not ( = ?auto_424900 ?auto_424904 ) ) ( not ( = ?auto_424900 ?auto_424905 ) ) ( not ( = ?auto_424900 ?auto_424906 ) ) ( not ( = ?auto_424900 ?auto_424907 ) ) ( not ( = ?auto_424901 ?auto_424902 ) ) ( not ( = ?auto_424901 ?auto_424903 ) ) ( not ( = ?auto_424901 ?auto_424904 ) ) ( not ( = ?auto_424901 ?auto_424905 ) ) ( not ( = ?auto_424901 ?auto_424906 ) ) ( not ( = ?auto_424901 ?auto_424907 ) ) ( not ( = ?auto_424902 ?auto_424903 ) ) ( not ( = ?auto_424902 ?auto_424904 ) ) ( not ( = ?auto_424902 ?auto_424905 ) ) ( not ( = ?auto_424902 ?auto_424906 ) ) ( not ( = ?auto_424902 ?auto_424907 ) ) ( not ( = ?auto_424903 ?auto_424904 ) ) ( not ( = ?auto_424903 ?auto_424905 ) ) ( not ( = ?auto_424903 ?auto_424906 ) ) ( not ( = ?auto_424903 ?auto_424907 ) ) ( not ( = ?auto_424904 ?auto_424905 ) ) ( not ( = ?auto_424904 ?auto_424906 ) ) ( not ( = ?auto_424904 ?auto_424907 ) ) ( not ( = ?auto_424905 ?auto_424906 ) ) ( not ( = ?auto_424905 ?auto_424907 ) ) ( not ( = ?auto_424906 ?auto_424907 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_424906 ?auto_424907 )
      ( !STACK ?auto_424906 ?auto_424905 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_424919 - BLOCK
      ?auto_424920 - BLOCK
      ?auto_424921 - BLOCK
      ?auto_424922 - BLOCK
      ?auto_424923 - BLOCK
      ?auto_424924 - BLOCK
      ?auto_424925 - BLOCK
      ?auto_424926 - BLOCK
      ?auto_424927 - BLOCK
      ?auto_424928 - BLOCK
      ?auto_424929 - BLOCK
    )
    :vars
    (
      ?auto_424930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424929 ?auto_424930 ) ( ON-TABLE ?auto_424919 ) ( ON ?auto_424920 ?auto_424919 ) ( ON ?auto_424921 ?auto_424920 ) ( ON ?auto_424922 ?auto_424921 ) ( ON ?auto_424923 ?auto_424922 ) ( ON ?auto_424924 ?auto_424923 ) ( ON ?auto_424925 ?auto_424924 ) ( ON ?auto_424926 ?auto_424925 ) ( ON ?auto_424927 ?auto_424926 ) ( not ( = ?auto_424919 ?auto_424920 ) ) ( not ( = ?auto_424919 ?auto_424921 ) ) ( not ( = ?auto_424919 ?auto_424922 ) ) ( not ( = ?auto_424919 ?auto_424923 ) ) ( not ( = ?auto_424919 ?auto_424924 ) ) ( not ( = ?auto_424919 ?auto_424925 ) ) ( not ( = ?auto_424919 ?auto_424926 ) ) ( not ( = ?auto_424919 ?auto_424927 ) ) ( not ( = ?auto_424919 ?auto_424928 ) ) ( not ( = ?auto_424919 ?auto_424929 ) ) ( not ( = ?auto_424919 ?auto_424930 ) ) ( not ( = ?auto_424920 ?auto_424921 ) ) ( not ( = ?auto_424920 ?auto_424922 ) ) ( not ( = ?auto_424920 ?auto_424923 ) ) ( not ( = ?auto_424920 ?auto_424924 ) ) ( not ( = ?auto_424920 ?auto_424925 ) ) ( not ( = ?auto_424920 ?auto_424926 ) ) ( not ( = ?auto_424920 ?auto_424927 ) ) ( not ( = ?auto_424920 ?auto_424928 ) ) ( not ( = ?auto_424920 ?auto_424929 ) ) ( not ( = ?auto_424920 ?auto_424930 ) ) ( not ( = ?auto_424921 ?auto_424922 ) ) ( not ( = ?auto_424921 ?auto_424923 ) ) ( not ( = ?auto_424921 ?auto_424924 ) ) ( not ( = ?auto_424921 ?auto_424925 ) ) ( not ( = ?auto_424921 ?auto_424926 ) ) ( not ( = ?auto_424921 ?auto_424927 ) ) ( not ( = ?auto_424921 ?auto_424928 ) ) ( not ( = ?auto_424921 ?auto_424929 ) ) ( not ( = ?auto_424921 ?auto_424930 ) ) ( not ( = ?auto_424922 ?auto_424923 ) ) ( not ( = ?auto_424922 ?auto_424924 ) ) ( not ( = ?auto_424922 ?auto_424925 ) ) ( not ( = ?auto_424922 ?auto_424926 ) ) ( not ( = ?auto_424922 ?auto_424927 ) ) ( not ( = ?auto_424922 ?auto_424928 ) ) ( not ( = ?auto_424922 ?auto_424929 ) ) ( not ( = ?auto_424922 ?auto_424930 ) ) ( not ( = ?auto_424923 ?auto_424924 ) ) ( not ( = ?auto_424923 ?auto_424925 ) ) ( not ( = ?auto_424923 ?auto_424926 ) ) ( not ( = ?auto_424923 ?auto_424927 ) ) ( not ( = ?auto_424923 ?auto_424928 ) ) ( not ( = ?auto_424923 ?auto_424929 ) ) ( not ( = ?auto_424923 ?auto_424930 ) ) ( not ( = ?auto_424924 ?auto_424925 ) ) ( not ( = ?auto_424924 ?auto_424926 ) ) ( not ( = ?auto_424924 ?auto_424927 ) ) ( not ( = ?auto_424924 ?auto_424928 ) ) ( not ( = ?auto_424924 ?auto_424929 ) ) ( not ( = ?auto_424924 ?auto_424930 ) ) ( not ( = ?auto_424925 ?auto_424926 ) ) ( not ( = ?auto_424925 ?auto_424927 ) ) ( not ( = ?auto_424925 ?auto_424928 ) ) ( not ( = ?auto_424925 ?auto_424929 ) ) ( not ( = ?auto_424925 ?auto_424930 ) ) ( not ( = ?auto_424926 ?auto_424927 ) ) ( not ( = ?auto_424926 ?auto_424928 ) ) ( not ( = ?auto_424926 ?auto_424929 ) ) ( not ( = ?auto_424926 ?auto_424930 ) ) ( not ( = ?auto_424927 ?auto_424928 ) ) ( not ( = ?auto_424927 ?auto_424929 ) ) ( not ( = ?auto_424927 ?auto_424930 ) ) ( not ( = ?auto_424928 ?auto_424929 ) ) ( not ( = ?auto_424928 ?auto_424930 ) ) ( not ( = ?auto_424929 ?auto_424930 ) ) ( CLEAR ?auto_424927 ) ( ON ?auto_424928 ?auto_424929 ) ( CLEAR ?auto_424928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_424919 ?auto_424920 ?auto_424921 ?auto_424922 ?auto_424923 ?auto_424924 ?auto_424925 ?auto_424926 ?auto_424927 ?auto_424928 )
      ( MAKE-11PILE ?auto_424919 ?auto_424920 ?auto_424921 ?auto_424922 ?auto_424923 ?auto_424924 ?auto_424925 ?auto_424926 ?auto_424927 ?auto_424928 ?auto_424929 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_424942 - BLOCK
      ?auto_424943 - BLOCK
      ?auto_424944 - BLOCK
      ?auto_424945 - BLOCK
      ?auto_424946 - BLOCK
      ?auto_424947 - BLOCK
      ?auto_424948 - BLOCK
      ?auto_424949 - BLOCK
      ?auto_424950 - BLOCK
      ?auto_424951 - BLOCK
      ?auto_424952 - BLOCK
    )
    :vars
    (
      ?auto_424953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424952 ?auto_424953 ) ( ON-TABLE ?auto_424942 ) ( ON ?auto_424943 ?auto_424942 ) ( ON ?auto_424944 ?auto_424943 ) ( ON ?auto_424945 ?auto_424944 ) ( ON ?auto_424946 ?auto_424945 ) ( ON ?auto_424947 ?auto_424946 ) ( ON ?auto_424948 ?auto_424947 ) ( ON ?auto_424949 ?auto_424948 ) ( ON ?auto_424950 ?auto_424949 ) ( not ( = ?auto_424942 ?auto_424943 ) ) ( not ( = ?auto_424942 ?auto_424944 ) ) ( not ( = ?auto_424942 ?auto_424945 ) ) ( not ( = ?auto_424942 ?auto_424946 ) ) ( not ( = ?auto_424942 ?auto_424947 ) ) ( not ( = ?auto_424942 ?auto_424948 ) ) ( not ( = ?auto_424942 ?auto_424949 ) ) ( not ( = ?auto_424942 ?auto_424950 ) ) ( not ( = ?auto_424942 ?auto_424951 ) ) ( not ( = ?auto_424942 ?auto_424952 ) ) ( not ( = ?auto_424942 ?auto_424953 ) ) ( not ( = ?auto_424943 ?auto_424944 ) ) ( not ( = ?auto_424943 ?auto_424945 ) ) ( not ( = ?auto_424943 ?auto_424946 ) ) ( not ( = ?auto_424943 ?auto_424947 ) ) ( not ( = ?auto_424943 ?auto_424948 ) ) ( not ( = ?auto_424943 ?auto_424949 ) ) ( not ( = ?auto_424943 ?auto_424950 ) ) ( not ( = ?auto_424943 ?auto_424951 ) ) ( not ( = ?auto_424943 ?auto_424952 ) ) ( not ( = ?auto_424943 ?auto_424953 ) ) ( not ( = ?auto_424944 ?auto_424945 ) ) ( not ( = ?auto_424944 ?auto_424946 ) ) ( not ( = ?auto_424944 ?auto_424947 ) ) ( not ( = ?auto_424944 ?auto_424948 ) ) ( not ( = ?auto_424944 ?auto_424949 ) ) ( not ( = ?auto_424944 ?auto_424950 ) ) ( not ( = ?auto_424944 ?auto_424951 ) ) ( not ( = ?auto_424944 ?auto_424952 ) ) ( not ( = ?auto_424944 ?auto_424953 ) ) ( not ( = ?auto_424945 ?auto_424946 ) ) ( not ( = ?auto_424945 ?auto_424947 ) ) ( not ( = ?auto_424945 ?auto_424948 ) ) ( not ( = ?auto_424945 ?auto_424949 ) ) ( not ( = ?auto_424945 ?auto_424950 ) ) ( not ( = ?auto_424945 ?auto_424951 ) ) ( not ( = ?auto_424945 ?auto_424952 ) ) ( not ( = ?auto_424945 ?auto_424953 ) ) ( not ( = ?auto_424946 ?auto_424947 ) ) ( not ( = ?auto_424946 ?auto_424948 ) ) ( not ( = ?auto_424946 ?auto_424949 ) ) ( not ( = ?auto_424946 ?auto_424950 ) ) ( not ( = ?auto_424946 ?auto_424951 ) ) ( not ( = ?auto_424946 ?auto_424952 ) ) ( not ( = ?auto_424946 ?auto_424953 ) ) ( not ( = ?auto_424947 ?auto_424948 ) ) ( not ( = ?auto_424947 ?auto_424949 ) ) ( not ( = ?auto_424947 ?auto_424950 ) ) ( not ( = ?auto_424947 ?auto_424951 ) ) ( not ( = ?auto_424947 ?auto_424952 ) ) ( not ( = ?auto_424947 ?auto_424953 ) ) ( not ( = ?auto_424948 ?auto_424949 ) ) ( not ( = ?auto_424948 ?auto_424950 ) ) ( not ( = ?auto_424948 ?auto_424951 ) ) ( not ( = ?auto_424948 ?auto_424952 ) ) ( not ( = ?auto_424948 ?auto_424953 ) ) ( not ( = ?auto_424949 ?auto_424950 ) ) ( not ( = ?auto_424949 ?auto_424951 ) ) ( not ( = ?auto_424949 ?auto_424952 ) ) ( not ( = ?auto_424949 ?auto_424953 ) ) ( not ( = ?auto_424950 ?auto_424951 ) ) ( not ( = ?auto_424950 ?auto_424952 ) ) ( not ( = ?auto_424950 ?auto_424953 ) ) ( not ( = ?auto_424951 ?auto_424952 ) ) ( not ( = ?auto_424951 ?auto_424953 ) ) ( not ( = ?auto_424952 ?auto_424953 ) ) ( CLEAR ?auto_424950 ) ( ON ?auto_424951 ?auto_424952 ) ( CLEAR ?auto_424951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_424942 ?auto_424943 ?auto_424944 ?auto_424945 ?auto_424946 ?auto_424947 ?auto_424948 ?auto_424949 ?auto_424950 ?auto_424951 )
      ( MAKE-11PILE ?auto_424942 ?auto_424943 ?auto_424944 ?auto_424945 ?auto_424946 ?auto_424947 ?auto_424948 ?auto_424949 ?auto_424950 ?auto_424951 ?auto_424952 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_424965 - BLOCK
      ?auto_424966 - BLOCK
      ?auto_424967 - BLOCK
      ?auto_424968 - BLOCK
      ?auto_424969 - BLOCK
      ?auto_424970 - BLOCK
      ?auto_424971 - BLOCK
      ?auto_424972 - BLOCK
      ?auto_424973 - BLOCK
      ?auto_424974 - BLOCK
      ?auto_424975 - BLOCK
    )
    :vars
    (
      ?auto_424976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424975 ?auto_424976 ) ( ON-TABLE ?auto_424965 ) ( ON ?auto_424966 ?auto_424965 ) ( ON ?auto_424967 ?auto_424966 ) ( ON ?auto_424968 ?auto_424967 ) ( ON ?auto_424969 ?auto_424968 ) ( ON ?auto_424970 ?auto_424969 ) ( ON ?auto_424971 ?auto_424970 ) ( ON ?auto_424972 ?auto_424971 ) ( not ( = ?auto_424965 ?auto_424966 ) ) ( not ( = ?auto_424965 ?auto_424967 ) ) ( not ( = ?auto_424965 ?auto_424968 ) ) ( not ( = ?auto_424965 ?auto_424969 ) ) ( not ( = ?auto_424965 ?auto_424970 ) ) ( not ( = ?auto_424965 ?auto_424971 ) ) ( not ( = ?auto_424965 ?auto_424972 ) ) ( not ( = ?auto_424965 ?auto_424973 ) ) ( not ( = ?auto_424965 ?auto_424974 ) ) ( not ( = ?auto_424965 ?auto_424975 ) ) ( not ( = ?auto_424965 ?auto_424976 ) ) ( not ( = ?auto_424966 ?auto_424967 ) ) ( not ( = ?auto_424966 ?auto_424968 ) ) ( not ( = ?auto_424966 ?auto_424969 ) ) ( not ( = ?auto_424966 ?auto_424970 ) ) ( not ( = ?auto_424966 ?auto_424971 ) ) ( not ( = ?auto_424966 ?auto_424972 ) ) ( not ( = ?auto_424966 ?auto_424973 ) ) ( not ( = ?auto_424966 ?auto_424974 ) ) ( not ( = ?auto_424966 ?auto_424975 ) ) ( not ( = ?auto_424966 ?auto_424976 ) ) ( not ( = ?auto_424967 ?auto_424968 ) ) ( not ( = ?auto_424967 ?auto_424969 ) ) ( not ( = ?auto_424967 ?auto_424970 ) ) ( not ( = ?auto_424967 ?auto_424971 ) ) ( not ( = ?auto_424967 ?auto_424972 ) ) ( not ( = ?auto_424967 ?auto_424973 ) ) ( not ( = ?auto_424967 ?auto_424974 ) ) ( not ( = ?auto_424967 ?auto_424975 ) ) ( not ( = ?auto_424967 ?auto_424976 ) ) ( not ( = ?auto_424968 ?auto_424969 ) ) ( not ( = ?auto_424968 ?auto_424970 ) ) ( not ( = ?auto_424968 ?auto_424971 ) ) ( not ( = ?auto_424968 ?auto_424972 ) ) ( not ( = ?auto_424968 ?auto_424973 ) ) ( not ( = ?auto_424968 ?auto_424974 ) ) ( not ( = ?auto_424968 ?auto_424975 ) ) ( not ( = ?auto_424968 ?auto_424976 ) ) ( not ( = ?auto_424969 ?auto_424970 ) ) ( not ( = ?auto_424969 ?auto_424971 ) ) ( not ( = ?auto_424969 ?auto_424972 ) ) ( not ( = ?auto_424969 ?auto_424973 ) ) ( not ( = ?auto_424969 ?auto_424974 ) ) ( not ( = ?auto_424969 ?auto_424975 ) ) ( not ( = ?auto_424969 ?auto_424976 ) ) ( not ( = ?auto_424970 ?auto_424971 ) ) ( not ( = ?auto_424970 ?auto_424972 ) ) ( not ( = ?auto_424970 ?auto_424973 ) ) ( not ( = ?auto_424970 ?auto_424974 ) ) ( not ( = ?auto_424970 ?auto_424975 ) ) ( not ( = ?auto_424970 ?auto_424976 ) ) ( not ( = ?auto_424971 ?auto_424972 ) ) ( not ( = ?auto_424971 ?auto_424973 ) ) ( not ( = ?auto_424971 ?auto_424974 ) ) ( not ( = ?auto_424971 ?auto_424975 ) ) ( not ( = ?auto_424971 ?auto_424976 ) ) ( not ( = ?auto_424972 ?auto_424973 ) ) ( not ( = ?auto_424972 ?auto_424974 ) ) ( not ( = ?auto_424972 ?auto_424975 ) ) ( not ( = ?auto_424972 ?auto_424976 ) ) ( not ( = ?auto_424973 ?auto_424974 ) ) ( not ( = ?auto_424973 ?auto_424975 ) ) ( not ( = ?auto_424973 ?auto_424976 ) ) ( not ( = ?auto_424974 ?auto_424975 ) ) ( not ( = ?auto_424974 ?auto_424976 ) ) ( not ( = ?auto_424975 ?auto_424976 ) ) ( ON ?auto_424974 ?auto_424975 ) ( CLEAR ?auto_424972 ) ( ON ?auto_424973 ?auto_424974 ) ( CLEAR ?auto_424973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_424965 ?auto_424966 ?auto_424967 ?auto_424968 ?auto_424969 ?auto_424970 ?auto_424971 ?auto_424972 ?auto_424973 )
      ( MAKE-11PILE ?auto_424965 ?auto_424966 ?auto_424967 ?auto_424968 ?auto_424969 ?auto_424970 ?auto_424971 ?auto_424972 ?auto_424973 ?auto_424974 ?auto_424975 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_424988 - BLOCK
      ?auto_424989 - BLOCK
      ?auto_424990 - BLOCK
      ?auto_424991 - BLOCK
      ?auto_424992 - BLOCK
      ?auto_424993 - BLOCK
      ?auto_424994 - BLOCK
      ?auto_424995 - BLOCK
      ?auto_424996 - BLOCK
      ?auto_424997 - BLOCK
      ?auto_424998 - BLOCK
    )
    :vars
    (
      ?auto_424999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424998 ?auto_424999 ) ( ON-TABLE ?auto_424988 ) ( ON ?auto_424989 ?auto_424988 ) ( ON ?auto_424990 ?auto_424989 ) ( ON ?auto_424991 ?auto_424990 ) ( ON ?auto_424992 ?auto_424991 ) ( ON ?auto_424993 ?auto_424992 ) ( ON ?auto_424994 ?auto_424993 ) ( ON ?auto_424995 ?auto_424994 ) ( not ( = ?auto_424988 ?auto_424989 ) ) ( not ( = ?auto_424988 ?auto_424990 ) ) ( not ( = ?auto_424988 ?auto_424991 ) ) ( not ( = ?auto_424988 ?auto_424992 ) ) ( not ( = ?auto_424988 ?auto_424993 ) ) ( not ( = ?auto_424988 ?auto_424994 ) ) ( not ( = ?auto_424988 ?auto_424995 ) ) ( not ( = ?auto_424988 ?auto_424996 ) ) ( not ( = ?auto_424988 ?auto_424997 ) ) ( not ( = ?auto_424988 ?auto_424998 ) ) ( not ( = ?auto_424988 ?auto_424999 ) ) ( not ( = ?auto_424989 ?auto_424990 ) ) ( not ( = ?auto_424989 ?auto_424991 ) ) ( not ( = ?auto_424989 ?auto_424992 ) ) ( not ( = ?auto_424989 ?auto_424993 ) ) ( not ( = ?auto_424989 ?auto_424994 ) ) ( not ( = ?auto_424989 ?auto_424995 ) ) ( not ( = ?auto_424989 ?auto_424996 ) ) ( not ( = ?auto_424989 ?auto_424997 ) ) ( not ( = ?auto_424989 ?auto_424998 ) ) ( not ( = ?auto_424989 ?auto_424999 ) ) ( not ( = ?auto_424990 ?auto_424991 ) ) ( not ( = ?auto_424990 ?auto_424992 ) ) ( not ( = ?auto_424990 ?auto_424993 ) ) ( not ( = ?auto_424990 ?auto_424994 ) ) ( not ( = ?auto_424990 ?auto_424995 ) ) ( not ( = ?auto_424990 ?auto_424996 ) ) ( not ( = ?auto_424990 ?auto_424997 ) ) ( not ( = ?auto_424990 ?auto_424998 ) ) ( not ( = ?auto_424990 ?auto_424999 ) ) ( not ( = ?auto_424991 ?auto_424992 ) ) ( not ( = ?auto_424991 ?auto_424993 ) ) ( not ( = ?auto_424991 ?auto_424994 ) ) ( not ( = ?auto_424991 ?auto_424995 ) ) ( not ( = ?auto_424991 ?auto_424996 ) ) ( not ( = ?auto_424991 ?auto_424997 ) ) ( not ( = ?auto_424991 ?auto_424998 ) ) ( not ( = ?auto_424991 ?auto_424999 ) ) ( not ( = ?auto_424992 ?auto_424993 ) ) ( not ( = ?auto_424992 ?auto_424994 ) ) ( not ( = ?auto_424992 ?auto_424995 ) ) ( not ( = ?auto_424992 ?auto_424996 ) ) ( not ( = ?auto_424992 ?auto_424997 ) ) ( not ( = ?auto_424992 ?auto_424998 ) ) ( not ( = ?auto_424992 ?auto_424999 ) ) ( not ( = ?auto_424993 ?auto_424994 ) ) ( not ( = ?auto_424993 ?auto_424995 ) ) ( not ( = ?auto_424993 ?auto_424996 ) ) ( not ( = ?auto_424993 ?auto_424997 ) ) ( not ( = ?auto_424993 ?auto_424998 ) ) ( not ( = ?auto_424993 ?auto_424999 ) ) ( not ( = ?auto_424994 ?auto_424995 ) ) ( not ( = ?auto_424994 ?auto_424996 ) ) ( not ( = ?auto_424994 ?auto_424997 ) ) ( not ( = ?auto_424994 ?auto_424998 ) ) ( not ( = ?auto_424994 ?auto_424999 ) ) ( not ( = ?auto_424995 ?auto_424996 ) ) ( not ( = ?auto_424995 ?auto_424997 ) ) ( not ( = ?auto_424995 ?auto_424998 ) ) ( not ( = ?auto_424995 ?auto_424999 ) ) ( not ( = ?auto_424996 ?auto_424997 ) ) ( not ( = ?auto_424996 ?auto_424998 ) ) ( not ( = ?auto_424996 ?auto_424999 ) ) ( not ( = ?auto_424997 ?auto_424998 ) ) ( not ( = ?auto_424997 ?auto_424999 ) ) ( not ( = ?auto_424998 ?auto_424999 ) ) ( ON ?auto_424997 ?auto_424998 ) ( CLEAR ?auto_424995 ) ( ON ?auto_424996 ?auto_424997 ) ( CLEAR ?auto_424996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_424988 ?auto_424989 ?auto_424990 ?auto_424991 ?auto_424992 ?auto_424993 ?auto_424994 ?auto_424995 ?auto_424996 )
      ( MAKE-11PILE ?auto_424988 ?auto_424989 ?auto_424990 ?auto_424991 ?auto_424992 ?auto_424993 ?auto_424994 ?auto_424995 ?auto_424996 ?auto_424997 ?auto_424998 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_425011 - BLOCK
      ?auto_425012 - BLOCK
      ?auto_425013 - BLOCK
      ?auto_425014 - BLOCK
      ?auto_425015 - BLOCK
      ?auto_425016 - BLOCK
      ?auto_425017 - BLOCK
      ?auto_425018 - BLOCK
      ?auto_425019 - BLOCK
      ?auto_425020 - BLOCK
      ?auto_425021 - BLOCK
    )
    :vars
    (
      ?auto_425022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425021 ?auto_425022 ) ( ON-TABLE ?auto_425011 ) ( ON ?auto_425012 ?auto_425011 ) ( ON ?auto_425013 ?auto_425012 ) ( ON ?auto_425014 ?auto_425013 ) ( ON ?auto_425015 ?auto_425014 ) ( ON ?auto_425016 ?auto_425015 ) ( ON ?auto_425017 ?auto_425016 ) ( not ( = ?auto_425011 ?auto_425012 ) ) ( not ( = ?auto_425011 ?auto_425013 ) ) ( not ( = ?auto_425011 ?auto_425014 ) ) ( not ( = ?auto_425011 ?auto_425015 ) ) ( not ( = ?auto_425011 ?auto_425016 ) ) ( not ( = ?auto_425011 ?auto_425017 ) ) ( not ( = ?auto_425011 ?auto_425018 ) ) ( not ( = ?auto_425011 ?auto_425019 ) ) ( not ( = ?auto_425011 ?auto_425020 ) ) ( not ( = ?auto_425011 ?auto_425021 ) ) ( not ( = ?auto_425011 ?auto_425022 ) ) ( not ( = ?auto_425012 ?auto_425013 ) ) ( not ( = ?auto_425012 ?auto_425014 ) ) ( not ( = ?auto_425012 ?auto_425015 ) ) ( not ( = ?auto_425012 ?auto_425016 ) ) ( not ( = ?auto_425012 ?auto_425017 ) ) ( not ( = ?auto_425012 ?auto_425018 ) ) ( not ( = ?auto_425012 ?auto_425019 ) ) ( not ( = ?auto_425012 ?auto_425020 ) ) ( not ( = ?auto_425012 ?auto_425021 ) ) ( not ( = ?auto_425012 ?auto_425022 ) ) ( not ( = ?auto_425013 ?auto_425014 ) ) ( not ( = ?auto_425013 ?auto_425015 ) ) ( not ( = ?auto_425013 ?auto_425016 ) ) ( not ( = ?auto_425013 ?auto_425017 ) ) ( not ( = ?auto_425013 ?auto_425018 ) ) ( not ( = ?auto_425013 ?auto_425019 ) ) ( not ( = ?auto_425013 ?auto_425020 ) ) ( not ( = ?auto_425013 ?auto_425021 ) ) ( not ( = ?auto_425013 ?auto_425022 ) ) ( not ( = ?auto_425014 ?auto_425015 ) ) ( not ( = ?auto_425014 ?auto_425016 ) ) ( not ( = ?auto_425014 ?auto_425017 ) ) ( not ( = ?auto_425014 ?auto_425018 ) ) ( not ( = ?auto_425014 ?auto_425019 ) ) ( not ( = ?auto_425014 ?auto_425020 ) ) ( not ( = ?auto_425014 ?auto_425021 ) ) ( not ( = ?auto_425014 ?auto_425022 ) ) ( not ( = ?auto_425015 ?auto_425016 ) ) ( not ( = ?auto_425015 ?auto_425017 ) ) ( not ( = ?auto_425015 ?auto_425018 ) ) ( not ( = ?auto_425015 ?auto_425019 ) ) ( not ( = ?auto_425015 ?auto_425020 ) ) ( not ( = ?auto_425015 ?auto_425021 ) ) ( not ( = ?auto_425015 ?auto_425022 ) ) ( not ( = ?auto_425016 ?auto_425017 ) ) ( not ( = ?auto_425016 ?auto_425018 ) ) ( not ( = ?auto_425016 ?auto_425019 ) ) ( not ( = ?auto_425016 ?auto_425020 ) ) ( not ( = ?auto_425016 ?auto_425021 ) ) ( not ( = ?auto_425016 ?auto_425022 ) ) ( not ( = ?auto_425017 ?auto_425018 ) ) ( not ( = ?auto_425017 ?auto_425019 ) ) ( not ( = ?auto_425017 ?auto_425020 ) ) ( not ( = ?auto_425017 ?auto_425021 ) ) ( not ( = ?auto_425017 ?auto_425022 ) ) ( not ( = ?auto_425018 ?auto_425019 ) ) ( not ( = ?auto_425018 ?auto_425020 ) ) ( not ( = ?auto_425018 ?auto_425021 ) ) ( not ( = ?auto_425018 ?auto_425022 ) ) ( not ( = ?auto_425019 ?auto_425020 ) ) ( not ( = ?auto_425019 ?auto_425021 ) ) ( not ( = ?auto_425019 ?auto_425022 ) ) ( not ( = ?auto_425020 ?auto_425021 ) ) ( not ( = ?auto_425020 ?auto_425022 ) ) ( not ( = ?auto_425021 ?auto_425022 ) ) ( ON ?auto_425020 ?auto_425021 ) ( ON ?auto_425019 ?auto_425020 ) ( CLEAR ?auto_425017 ) ( ON ?auto_425018 ?auto_425019 ) ( CLEAR ?auto_425018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_425011 ?auto_425012 ?auto_425013 ?auto_425014 ?auto_425015 ?auto_425016 ?auto_425017 ?auto_425018 )
      ( MAKE-11PILE ?auto_425011 ?auto_425012 ?auto_425013 ?auto_425014 ?auto_425015 ?auto_425016 ?auto_425017 ?auto_425018 ?auto_425019 ?auto_425020 ?auto_425021 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_425034 - BLOCK
      ?auto_425035 - BLOCK
      ?auto_425036 - BLOCK
      ?auto_425037 - BLOCK
      ?auto_425038 - BLOCK
      ?auto_425039 - BLOCK
      ?auto_425040 - BLOCK
      ?auto_425041 - BLOCK
      ?auto_425042 - BLOCK
      ?auto_425043 - BLOCK
      ?auto_425044 - BLOCK
    )
    :vars
    (
      ?auto_425045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425044 ?auto_425045 ) ( ON-TABLE ?auto_425034 ) ( ON ?auto_425035 ?auto_425034 ) ( ON ?auto_425036 ?auto_425035 ) ( ON ?auto_425037 ?auto_425036 ) ( ON ?auto_425038 ?auto_425037 ) ( ON ?auto_425039 ?auto_425038 ) ( ON ?auto_425040 ?auto_425039 ) ( not ( = ?auto_425034 ?auto_425035 ) ) ( not ( = ?auto_425034 ?auto_425036 ) ) ( not ( = ?auto_425034 ?auto_425037 ) ) ( not ( = ?auto_425034 ?auto_425038 ) ) ( not ( = ?auto_425034 ?auto_425039 ) ) ( not ( = ?auto_425034 ?auto_425040 ) ) ( not ( = ?auto_425034 ?auto_425041 ) ) ( not ( = ?auto_425034 ?auto_425042 ) ) ( not ( = ?auto_425034 ?auto_425043 ) ) ( not ( = ?auto_425034 ?auto_425044 ) ) ( not ( = ?auto_425034 ?auto_425045 ) ) ( not ( = ?auto_425035 ?auto_425036 ) ) ( not ( = ?auto_425035 ?auto_425037 ) ) ( not ( = ?auto_425035 ?auto_425038 ) ) ( not ( = ?auto_425035 ?auto_425039 ) ) ( not ( = ?auto_425035 ?auto_425040 ) ) ( not ( = ?auto_425035 ?auto_425041 ) ) ( not ( = ?auto_425035 ?auto_425042 ) ) ( not ( = ?auto_425035 ?auto_425043 ) ) ( not ( = ?auto_425035 ?auto_425044 ) ) ( not ( = ?auto_425035 ?auto_425045 ) ) ( not ( = ?auto_425036 ?auto_425037 ) ) ( not ( = ?auto_425036 ?auto_425038 ) ) ( not ( = ?auto_425036 ?auto_425039 ) ) ( not ( = ?auto_425036 ?auto_425040 ) ) ( not ( = ?auto_425036 ?auto_425041 ) ) ( not ( = ?auto_425036 ?auto_425042 ) ) ( not ( = ?auto_425036 ?auto_425043 ) ) ( not ( = ?auto_425036 ?auto_425044 ) ) ( not ( = ?auto_425036 ?auto_425045 ) ) ( not ( = ?auto_425037 ?auto_425038 ) ) ( not ( = ?auto_425037 ?auto_425039 ) ) ( not ( = ?auto_425037 ?auto_425040 ) ) ( not ( = ?auto_425037 ?auto_425041 ) ) ( not ( = ?auto_425037 ?auto_425042 ) ) ( not ( = ?auto_425037 ?auto_425043 ) ) ( not ( = ?auto_425037 ?auto_425044 ) ) ( not ( = ?auto_425037 ?auto_425045 ) ) ( not ( = ?auto_425038 ?auto_425039 ) ) ( not ( = ?auto_425038 ?auto_425040 ) ) ( not ( = ?auto_425038 ?auto_425041 ) ) ( not ( = ?auto_425038 ?auto_425042 ) ) ( not ( = ?auto_425038 ?auto_425043 ) ) ( not ( = ?auto_425038 ?auto_425044 ) ) ( not ( = ?auto_425038 ?auto_425045 ) ) ( not ( = ?auto_425039 ?auto_425040 ) ) ( not ( = ?auto_425039 ?auto_425041 ) ) ( not ( = ?auto_425039 ?auto_425042 ) ) ( not ( = ?auto_425039 ?auto_425043 ) ) ( not ( = ?auto_425039 ?auto_425044 ) ) ( not ( = ?auto_425039 ?auto_425045 ) ) ( not ( = ?auto_425040 ?auto_425041 ) ) ( not ( = ?auto_425040 ?auto_425042 ) ) ( not ( = ?auto_425040 ?auto_425043 ) ) ( not ( = ?auto_425040 ?auto_425044 ) ) ( not ( = ?auto_425040 ?auto_425045 ) ) ( not ( = ?auto_425041 ?auto_425042 ) ) ( not ( = ?auto_425041 ?auto_425043 ) ) ( not ( = ?auto_425041 ?auto_425044 ) ) ( not ( = ?auto_425041 ?auto_425045 ) ) ( not ( = ?auto_425042 ?auto_425043 ) ) ( not ( = ?auto_425042 ?auto_425044 ) ) ( not ( = ?auto_425042 ?auto_425045 ) ) ( not ( = ?auto_425043 ?auto_425044 ) ) ( not ( = ?auto_425043 ?auto_425045 ) ) ( not ( = ?auto_425044 ?auto_425045 ) ) ( ON ?auto_425043 ?auto_425044 ) ( ON ?auto_425042 ?auto_425043 ) ( CLEAR ?auto_425040 ) ( ON ?auto_425041 ?auto_425042 ) ( CLEAR ?auto_425041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_425034 ?auto_425035 ?auto_425036 ?auto_425037 ?auto_425038 ?auto_425039 ?auto_425040 ?auto_425041 )
      ( MAKE-11PILE ?auto_425034 ?auto_425035 ?auto_425036 ?auto_425037 ?auto_425038 ?auto_425039 ?auto_425040 ?auto_425041 ?auto_425042 ?auto_425043 ?auto_425044 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_425057 - BLOCK
      ?auto_425058 - BLOCK
      ?auto_425059 - BLOCK
      ?auto_425060 - BLOCK
      ?auto_425061 - BLOCK
      ?auto_425062 - BLOCK
      ?auto_425063 - BLOCK
      ?auto_425064 - BLOCK
      ?auto_425065 - BLOCK
      ?auto_425066 - BLOCK
      ?auto_425067 - BLOCK
    )
    :vars
    (
      ?auto_425068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425067 ?auto_425068 ) ( ON-TABLE ?auto_425057 ) ( ON ?auto_425058 ?auto_425057 ) ( ON ?auto_425059 ?auto_425058 ) ( ON ?auto_425060 ?auto_425059 ) ( ON ?auto_425061 ?auto_425060 ) ( ON ?auto_425062 ?auto_425061 ) ( not ( = ?auto_425057 ?auto_425058 ) ) ( not ( = ?auto_425057 ?auto_425059 ) ) ( not ( = ?auto_425057 ?auto_425060 ) ) ( not ( = ?auto_425057 ?auto_425061 ) ) ( not ( = ?auto_425057 ?auto_425062 ) ) ( not ( = ?auto_425057 ?auto_425063 ) ) ( not ( = ?auto_425057 ?auto_425064 ) ) ( not ( = ?auto_425057 ?auto_425065 ) ) ( not ( = ?auto_425057 ?auto_425066 ) ) ( not ( = ?auto_425057 ?auto_425067 ) ) ( not ( = ?auto_425057 ?auto_425068 ) ) ( not ( = ?auto_425058 ?auto_425059 ) ) ( not ( = ?auto_425058 ?auto_425060 ) ) ( not ( = ?auto_425058 ?auto_425061 ) ) ( not ( = ?auto_425058 ?auto_425062 ) ) ( not ( = ?auto_425058 ?auto_425063 ) ) ( not ( = ?auto_425058 ?auto_425064 ) ) ( not ( = ?auto_425058 ?auto_425065 ) ) ( not ( = ?auto_425058 ?auto_425066 ) ) ( not ( = ?auto_425058 ?auto_425067 ) ) ( not ( = ?auto_425058 ?auto_425068 ) ) ( not ( = ?auto_425059 ?auto_425060 ) ) ( not ( = ?auto_425059 ?auto_425061 ) ) ( not ( = ?auto_425059 ?auto_425062 ) ) ( not ( = ?auto_425059 ?auto_425063 ) ) ( not ( = ?auto_425059 ?auto_425064 ) ) ( not ( = ?auto_425059 ?auto_425065 ) ) ( not ( = ?auto_425059 ?auto_425066 ) ) ( not ( = ?auto_425059 ?auto_425067 ) ) ( not ( = ?auto_425059 ?auto_425068 ) ) ( not ( = ?auto_425060 ?auto_425061 ) ) ( not ( = ?auto_425060 ?auto_425062 ) ) ( not ( = ?auto_425060 ?auto_425063 ) ) ( not ( = ?auto_425060 ?auto_425064 ) ) ( not ( = ?auto_425060 ?auto_425065 ) ) ( not ( = ?auto_425060 ?auto_425066 ) ) ( not ( = ?auto_425060 ?auto_425067 ) ) ( not ( = ?auto_425060 ?auto_425068 ) ) ( not ( = ?auto_425061 ?auto_425062 ) ) ( not ( = ?auto_425061 ?auto_425063 ) ) ( not ( = ?auto_425061 ?auto_425064 ) ) ( not ( = ?auto_425061 ?auto_425065 ) ) ( not ( = ?auto_425061 ?auto_425066 ) ) ( not ( = ?auto_425061 ?auto_425067 ) ) ( not ( = ?auto_425061 ?auto_425068 ) ) ( not ( = ?auto_425062 ?auto_425063 ) ) ( not ( = ?auto_425062 ?auto_425064 ) ) ( not ( = ?auto_425062 ?auto_425065 ) ) ( not ( = ?auto_425062 ?auto_425066 ) ) ( not ( = ?auto_425062 ?auto_425067 ) ) ( not ( = ?auto_425062 ?auto_425068 ) ) ( not ( = ?auto_425063 ?auto_425064 ) ) ( not ( = ?auto_425063 ?auto_425065 ) ) ( not ( = ?auto_425063 ?auto_425066 ) ) ( not ( = ?auto_425063 ?auto_425067 ) ) ( not ( = ?auto_425063 ?auto_425068 ) ) ( not ( = ?auto_425064 ?auto_425065 ) ) ( not ( = ?auto_425064 ?auto_425066 ) ) ( not ( = ?auto_425064 ?auto_425067 ) ) ( not ( = ?auto_425064 ?auto_425068 ) ) ( not ( = ?auto_425065 ?auto_425066 ) ) ( not ( = ?auto_425065 ?auto_425067 ) ) ( not ( = ?auto_425065 ?auto_425068 ) ) ( not ( = ?auto_425066 ?auto_425067 ) ) ( not ( = ?auto_425066 ?auto_425068 ) ) ( not ( = ?auto_425067 ?auto_425068 ) ) ( ON ?auto_425066 ?auto_425067 ) ( ON ?auto_425065 ?auto_425066 ) ( ON ?auto_425064 ?auto_425065 ) ( CLEAR ?auto_425062 ) ( ON ?auto_425063 ?auto_425064 ) ( CLEAR ?auto_425063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_425057 ?auto_425058 ?auto_425059 ?auto_425060 ?auto_425061 ?auto_425062 ?auto_425063 )
      ( MAKE-11PILE ?auto_425057 ?auto_425058 ?auto_425059 ?auto_425060 ?auto_425061 ?auto_425062 ?auto_425063 ?auto_425064 ?auto_425065 ?auto_425066 ?auto_425067 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_425080 - BLOCK
      ?auto_425081 - BLOCK
      ?auto_425082 - BLOCK
      ?auto_425083 - BLOCK
      ?auto_425084 - BLOCK
      ?auto_425085 - BLOCK
      ?auto_425086 - BLOCK
      ?auto_425087 - BLOCK
      ?auto_425088 - BLOCK
      ?auto_425089 - BLOCK
      ?auto_425090 - BLOCK
    )
    :vars
    (
      ?auto_425091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425090 ?auto_425091 ) ( ON-TABLE ?auto_425080 ) ( ON ?auto_425081 ?auto_425080 ) ( ON ?auto_425082 ?auto_425081 ) ( ON ?auto_425083 ?auto_425082 ) ( ON ?auto_425084 ?auto_425083 ) ( ON ?auto_425085 ?auto_425084 ) ( not ( = ?auto_425080 ?auto_425081 ) ) ( not ( = ?auto_425080 ?auto_425082 ) ) ( not ( = ?auto_425080 ?auto_425083 ) ) ( not ( = ?auto_425080 ?auto_425084 ) ) ( not ( = ?auto_425080 ?auto_425085 ) ) ( not ( = ?auto_425080 ?auto_425086 ) ) ( not ( = ?auto_425080 ?auto_425087 ) ) ( not ( = ?auto_425080 ?auto_425088 ) ) ( not ( = ?auto_425080 ?auto_425089 ) ) ( not ( = ?auto_425080 ?auto_425090 ) ) ( not ( = ?auto_425080 ?auto_425091 ) ) ( not ( = ?auto_425081 ?auto_425082 ) ) ( not ( = ?auto_425081 ?auto_425083 ) ) ( not ( = ?auto_425081 ?auto_425084 ) ) ( not ( = ?auto_425081 ?auto_425085 ) ) ( not ( = ?auto_425081 ?auto_425086 ) ) ( not ( = ?auto_425081 ?auto_425087 ) ) ( not ( = ?auto_425081 ?auto_425088 ) ) ( not ( = ?auto_425081 ?auto_425089 ) ) ( not ( = ?auto_425081 ?auto_425090 ) ) ( not ( = ?auto_425081 ?auto_425091 ) ) ( not ( = ?auto_425082 ?auto_425083 ) ) ( not ( = ?auto_425082 ?auto_425084 ) ) ( not ( = ?auto_425082 ?auto_425085 ) ) ( not ( = ?auto_425082 ?auto_425086 ) ) ( not ( = ?auto_425082 ?auto_425087 ) ) ( not ( = ?auto_425082 ?auto_425088 ) ) ( not ( = ?auto_425082 ?auto_425089 ) ) ( not ( = ?auto_425082 ?auto_425090 ) ) ( not ( = ?auto_425082 ?auto_425091 ) ) ( not ( = ?auto_425083 ?auto_425084 ) ) ( not ( = ?auto_425083 ?auto_425085 ) ) ( not ( = ?auto_425083 ?auto_425086 ) ) ( not ( = ?auto_425083 ?auto_425087 ) ) ( not ( = ?auto_425083 ?auto_425088 ) ) ( not ( = ?auto_425083 ?auto_425089 ) ) ( not ( = ?auto_425083 ?auto_425090 ) ) ( not ( = ?auto_425083 ?auto_425091 ) ) ( not ( = ?auto_425084 ?auto_425085 ) ) ( not ( = ?auto_425084 ?auto_425086 ) ) ( not ( = ?auto_425084 ?auto_425087 ) ) ( not ( = ?auto_425084 ?auto_425088 ) ) ( not ( = ?auto_425084 ?auto_425089 ) ) ( not ( = ?auto_425084 ?auto_425090 ) ) ( not ( = ?auto_425084 ?auto_425091 ) ) ( not ( = ?auto_425085 ?auto_425086 ) ) ( not ( = ?auto_425085 ?auto_425087 ) ) ( not ( = ?auto_425085 ?auto_425088 ) ) ( not ( = ?auto_425085 ?auto_425089 ) ) ( not ( = ?auto_425085 ?auto_425090 ) ) ( not ( = ?auto_425085 ?auto_425091 ) ) ( not ( = ?auto_425086 ?auto_425087 ) ) ( not ( = ?auto_425086 ?auto_425088 ) ) ( not ( = ?auto_425086 ?auto_425089 ) ) ( not ( = ?auto_425086 ?auto_425090 ) ) ( not ( = ?auto_425086 ?auto_425091 ) ) ( not ( = ?auto_425087 ?auto_425088 ) ) ( not ( = ?auto_425087 ?auto_425089 ) ) ( not ( = ?auto_425087 ?auto_425090 ) ) ( not ( = ?auto_425087 ?auto_425091 ) ) ( not ( = ?auto_425088 ?auto_425089 ) ) ( not ( = ?auto_425088 ?auto_425090 ) ) ( not ( = ?auto_425088 ?auto_425091 ) ) ( not ( = ?auto_425089 ?auto_425090 ) ) ( not ( = ?auto_425089 ?auto_425091 ) ) ( not ( = ?auto_425090 ?auto_425091 ) ) ( ON ?auto_425089 ?auto_425090 ) ( ON ?auto_425088 ?auto_425089 ) ( ON ?auto_425087 ?auto_425088 ) ( CLEAR ?auto_425085 ) ( ON ?auto_425086 ?auto_425087 ) ( CLEAR ?auto_425086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_425080 ?auto_425081 ?auto_425082 ?auto_425083 ?auto_425084 ?auto_425085 ?auto_425086 )
      ( MAKE-11PILE ?auto_425080 ?auto_425081 ?auto_425082 ?auto_425083 ?auto_425084 ?auto_425085 ?auto_425086 ?auto_425087 ?auto_425088 ?auto_425089 ?auto_425090 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_425103 - BLOCK
      ?auto_425104 - BLOCK
      ?auto_425105 - BLOCK
      ?auto_425106 - BLOCK
      ?auto_425107 - BLOCK
      ?auto_425108 - BLOCK
      ?auto_425109 - BLOCK
      ?auto_425110 - BLOCK
      ?auto_425111 - BLOCK
      ?auto_425112 - BLOCK
      ?auto_425113 - BLOCK
    )
    :vars
    (
      ?auto_425114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425113 ?auto_425114 ) ( ON-TABLE ?auto_425103 ) ( ON ?auto_425104 ?auto_425103 ) ( ON ?auto_425105 ?auto_425104 ) ( ON ?auto_425106 ?auto_425105 ) ( ON ?auto_425107 ?auto_425106 ) ( not ( = ?auto_425103 ?auto_425104 ) ) ( not ( = ?auto_425103 ?auto_425105 ) ) ( not ( = ?auto_425103 ?auto_425106 ) ) ( not ( = ?auto_425103 ?auto_425107 ) ) ( not ( = ?auto_425103 ?auto_425108 ) ) ( not ( = ?auto_425103 ?auto_425109 ) ) ( not ( = ?auto_425103 ?auto_425110 ) ) ( not ( = ?auto_425103 ?auto_425111 ) ) ( not ( = ?auto_425103 ?auto_425112 ) ) ( not ( = ?auto_425103 ?auto_425113 ) ) ( not ( = ?auto_425103 ?auto_425114 ) ) ( not ( = ?auto_425104 ?auto_425105 ) ) ( not ( = ?auto_425104 ?auto_425106 ) ) ( not ( = ?auto_425104 ?auto_425107 ) ) ( not ( = ?auto_425104 ?auto_425108 ) ) ( not ( = ?auto_425104 ?auto_425109 ) ) ( not ( = ?auto_425104 ?auto_425110 ) ) ( not ( = ?auto_425104 ?auto_425111 ) ) ( not ( = ?auto_425104 ?auto_425112 ) ) ( not ( = ?auto_425104 ?auto_425113 ) ) ( not ( = ?auto_425104 ?auto_425114 ) ) ( not ( = ?auto_425105 ?auto_425106 ) ) ( not ( = ?auto_425105 ?auto_425107 ) ) ( not ( = ?auto_425105 ?auto_425108 ) ) ( not ( = ?auto_425105 ?auto_425109 ) ) ( not ( = ?auto_425105 ?auto_425110 ) ) ( not ( = ?auto_425105 ?auto_425111 ) ) ( not ( = ?auto_425105 ?auto_425112 ) ) ( not ( = ?auto_425105 ?auto_425113 ) ) ( not ( = ?auto_425105 ?auto_425114 ) ) ( not ( = ?auto_425106 ?auto_425107 ) ) ( not ( = ?auto_425106 ?auto_425108 ) ) ( not ( = ?auto_425106 ?auto_425109 ) ) ( not ( = ?auto_425106 ?auto_425110 ) ) ( not ( = ?auto_425106 ?auto_425111 ) ) ( not ( = ?auto_425106 ?auto_425112 ) ) ( not ( = ?auto_425106 ?auto_425113 ) ) ( not ( = ?auto_425106 ?auto_425114 ) ) ( not ( = ?auto_425107 ?auto_425108 ) ) ( not ( = ?auto_425107 ?auto_425109 ) ) ( not ( = ?auto_425107 ?auto_425110 ) ) ( not ( = ?auto_425107 ?auto_425111 ) ) ( not ( = ?auto_425107 ?auto_425112 ) ) ( not ( = ?auto_425107 ?auto_425113 ) ) ( not ( = ?auto_425107 ?auto_425114 ) ) ( not ( = ?auto_425108 ?auto_425109 ) ) ( not ( = ?auto_425108 ?auto_425110 ) ) ( not ( = ?auto_425108 ?auto_425111 ) ) ( not ( = ?auto_425108 ?auto_425112 ) ) ( not ( = ?auto_425108 ?auto_425113 ) ) ( not ( = ?auto_425108 ?auto_425114 ) ) ( not ( = ?auto_425109 ?auto_425110 ) ) ( not ( = ?auto_425109 ?auto_425111 ) ) ( not ( = ?auto_425109 ?auto_425112 ) ) ( not ( = ?auto_425109 ?auto_425113 ) ) ( not ( = ?auto_425109 ?auto_425114 ) ) ( not ( = ?auto_425110 ?auto_425111 ) ) ( not ( = ?auto_425110 ?auto_425112 ) ) ( not ( = ?auto_425110 ?auto_425113 ) ) ( not ( = ?auto_425110 ?auto_425114 ) ) ( not ( = ?auto_425111 ?auto_425112 ) ) ( not ( = ?auto_425111 ?auto_425113 ) ) ( not ( = ?auto_425111 ?auto_425114 ) ) ( not ( = ?auto_425112 ?auto_425113 ) ) ( not ( = ?auto_425112 ?auto_425114 ) ) ( not ( = ?auto_425113 ?auto_425114 ) ) ( ON ?auto_425112 ?auto_425113 ) ( ON ?auto_425111 ?auto_425112 ) ( ON ?auto_425110 ?auto_425111 ) ( ON ?auto_425109 ?auto_425110 ) ( CLEAR ?auto_425107 ) ( ON ?auto_425108 ?auto_425109 ) ( CLEAR ?auto_425108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_425103 ?auto_425104 ?auto_425105 ?auto_425106 ?auto_425107 ?auto_425108 )
      ( MAKE-11PILE ?auto_425103 ?auto_425104 ?auto_425105 ?auto_425106 ?auto_425107 ?auto_425108 ?auto_425109 ?auto_425110 ?auto_425111 ?auto_425112 ?auto_425113 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_425126 - BLOCK
      ?auto_425127 - BLOCK
      ?auto_425128 - BLOCK
      ?auto_425129 - BLOCK
      ?auto_425130 - BLOCK
      ?auto_425131 - BLOCK
      ?auto_425132 - BLOCK
      ?auto_425133 - BLOCK
      ?auto_425134 - BLOCK
      ?auto_425135 - BLOCK
      ?auto_425136 - BLOCK
    )
    :vars
    (
      ?auto_425137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425136 ?auto_425137 ) ( ON-TABLE ?auto_425126 ) ( ON ?auto_425127 ?auto_425126 ) ( ON ?auto_425128 ?auto_425127 ) ( ON ?auto_425129 ?auto_425128 ) ( ON ?auto_425130 ?auto_425129 ) ( not ( = ?auto_425126 ?auto_425127 ) ) ( not ( = ?auto_425126 ?auto_425128 ) ) ( not ( = ?auto_425126 ?auto_425129 ) ) ( not ( = ?auto_425126 ?auto_425130 ) ) ( not ( = ?auto_425126 ?auto_425131 ) ) ( not ( = ?auto_425126 ?auto_425132 ) ) ( not ( = ?auto_425126 ?auto_425133 ) ) ( not ( = ?auto_425126 ?auto_425134 ) ) ( not ( = ?auto_425126 ?auto_425135 ) ) ( not ( = ?auto_425126 ?auto_425136 ) ) ( not ( = ?auto_425126 ?auto_425137 ) ) ( not ( = ?auto_425127 ?auto_425128 ) ) ( not ( = ?auto_425127 ?auto_425129 ) ) ( not ( = ?auto_425127 ?auto_425130 ) ) ( not ( = ?auto_425127 ?auto_425131 ) ) ( not ( = ?auto_425127 ?auto_425132 ) ) ( not ( = ?auto_425127 ?auto_425133 ) ) ( not ( = ?auto_425127 ?auto_425134 ) ) ( not ( = ?auto_425127 ?auto_425135 ) ) ( not ( = ?auto_425127 ?auto_425136 ) ) ( not ( = ?auto_425127 ?auto_425137 ) ) ( not ( = ?auto_425128 ?auto_425129 ) ) ( not ( = ?auto_425128 ?auto_425130 ) ) ( not ( = ?auto_425128 ?auto_425131 ) ) ( not ( = ?auto_425128 ?auto_425132 ) ) ( not ( = ?auto_425128 ?auto_425133 ) ) ( not ( = ?auto_425128 ?auto_425134 ) ) ( not ( = ?auto_425128 ?auto_425135 ) ) ( not ( = ?auto_425128 ?auto_425136 ) ) ( not ( = ?auto_425128 ?auto_425137 ) ) ( not ( = ?auto_425129 ?auto_425130 ) ) ( not ( = ?auto_425129 ?auto_425131 ) ) ( not ( = ?auto_425129 ?auto_425132 ) ) ( not ( = ?auto_425129 ?auto_425133 ) ) ( not ( = ?auto_425129 ?auto_425134 ) ) ( not ( = ?auto_425129 ?auto_425135 ) ) ( not ( = ?auto_425129 ?auto_425136 ) ) ( not ( = ?auto_425129 ?auto_425137 ) ) ( not ( = ?auto_425130 ?auto_425131 ) ) ( not ( = ?auto_425130 ?auto_425132 ) ) ( not ( = ?auto_425130 ?auto_425133 ) ) ( not ( = ?auto_425130 ?auto_425134 ) ) ( not ( = ?auto_425130 ?auto_425135 ) ) ( not ( = ?auto_425130 ?auto_425136 ) ) ( not ( = ?auto_425130 ?auto_425137 ) ) ( not ( = ?auto_425131 ?auto_425132 ) ) ( not ( = ?auto_425131 ?auto_425133 ) ) ( not ( = ?auto_425131 ?auto_425134 ) ) ( not ( = ?auto_425131 ?auto_425135 ) ) ( not ( = ?auto_425131 ?auto_425136 ) ) ( not ( = ?auto_425131 ?auto_425137 ) ) ( not ( = ?auto_425132 ?auto_425133 ) ) ( not ( = ?auto_425132 ?auto_425134 ) ) ( not ( = ?auto_425132 ?auto_425135 ) ) ( not ( = ?auto_425132 ?auto_425136 ) ) ( not ( = ?auto_425132 ?auto_425137 ) ) ( not ( = ?auto_425133 ?auto_425134 ) ) ( not ( = ?auto_425133 ?auto_425135 ) ) ( not ( = ?auto_425133 ?auto_425136 ) ) ( not ( = ?auto_425133 ?auto_425137 ) ) ( not ( = ?auto_425134 ?auto_425135 ) ) ( not ( = ?auto_425134 ?auto_425136 ) ) ( not ( = ?auto_425134 ?auto_425137 ) ) ( not ( = ?auto_425135 ?auto_425136 ) ) ( not ( = ?auto_425135 ?auto_425137 ) ) ( not ( = ?auto_425136 ?auto_425137 ) ) ( ON ?auto_425135 ?auto_425136 ) ( ON ?auto_425134 ?auto_425135 ) ( ON ?auto_425133 ?auto_425134 ) ( ON ?auto_425132 ?auto_425133 ) ( CLEAR ?auto_425130 ) ( ON ?auto_425131 ?auto_425132 ) ( CLEAR ?auto_425131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_425126 ?auto_425127 ?auto_425128 ?auto_425129 ?auto_425130 ?auto_425131 )
      ( MAKE-11PILE ?auto_425126 ?auto_425127 ?auto_425128 ?auto_425129 ?auto_425130 ?auto_425131 ?auto_425132 ?auto_425133 ?auto_425134 ?auto_425135 ?auto_425136 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_425149 - BLOCK
      ?auto_425150 - BLOCK
      ?auto_425151 - BLOCK
      ?auto_425152 - BLOCK
      ?auto_425153 - BLOCK
      ?auto_425154 - BLOCK
      ?auto_425155 - BLOCK
      ?auto_425156 - BLOCK
      ?auto_425157 - BLOCK
      ?auto_425158 - BLOCK
      ?auto_425159 - BLOCK
    )
    :vars
    (
      ?auto_425160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425159 ?auto_425160 ) ( ON-TABLE ?auto_425149 ) ( ON ?auto_425150 ?auto_425149 ) ( ON ?auto_425151 ?auto_425150 ) ( ON ?auto_425152 ?auto_425151 ) ( not ( = ?auto_425149 ?auto_425150 ) ) ( not ( = ?auto_425149 ?auto_425151 ) ) ( not ( = ?auto_425149 ?auto_425152 ) ) ( not ( = ?auto_425149 ?auto_425153 ) ) ( not ( = ?auto_425149 ?auto_425154 ) ) ( not ( = ?auto_425149 ?auto_425155 ) ) ( not ( = ?auto_425149 ?auto_425156 ) ) ( not ( = ?auto_425149 ?auto_425157 ) ) ( not ( = ?auto_425149 ?auto_425158 ) ) ( not ( = ?auto_425149 ?auto_425159 ) ) ( not ( = ?auto_425149 ?auto_425160 ) ) ( not ( = ?auto_425150 ?auto_425151 ) ) ( not ( = ?auto_425150 ?auto_425152 ) ) ( not ( = ?auto_425150 ?auto_425153 ) ) ( not ( = ?auto_425150 ?auto_425154 ) ) ( not ( = ?auto_425150 ?auto_425155 ) ) ( not ( = ?auto_425150 ?auto_425156 ) ) ( not ( = ?auto_425150 ?auto_425157 ) ) ( not ( = ?auto_425150 ?auto_425158 ) ) ( not ( = ?auto_425150 ?auto_425159 ) ) ( not ( = ?auto_425150 ?auto_425160 ) ) ( not ( = ?auto_425151 ?auto_425152 ) ) ( not ( = ?auto_425151 ?auto_425153 ) ) ( not ( = ?auto_425151 ?auto_425154 ) ) ( not ( = ?auto_425151 ?auto_425155 ) ) ( not ( = ?auto_425151 ?auto_425156 ) ) ( not ( = ?auto_425151 ?auto_425157 ) ) ( not ( = ?auto_425151 ?auto_425158 ) ) ( not ( = ?auto_425151 ?auto_425159 ) ) ( not ( = ?auto_425151 ?auto_425160 ) ) ( not ( = ?auto_425152 ?auto_425153 ) ) ( not ( = ?auto_425152 ?auto_425154 ) ) ( not ( = ?auto_425152 ?auto_425155 ) ) ( not ( = ?auto_425152 ?auto_425156 ) ) ( not ( = ?auto_425152 ?auto_425157 ) ) ( not ( = ?auto_425152 ?auto_425158 ) ) ( not ( = ?auto_425152 ?auto_425159 ) ) ( not ( = ?auto_425152 ?auto_425160 ) ) ( not ( = ?auto_425153 ?auto_425154 ) ) ( not ( = ?auto_425153 ?auto_425155 ) ) ( not ( = ?auto_425153 ?auto_425156 ) ) ( not ( = ?auto_425153 ?auto_425157 ) ) ( not ( = ?auto_425153 ?auto_425158 ) ) ( not ( = ?auto_425153 ?auto_425159 ) ) ( not ( = ?auto_425153 ?auto_425160 ) ) ( not ( = ?auto_425154 ?auto_425155 ) ) ( not ( = ?auto_425154 ?auto_425156 ) ) ( not ( = ?auto_425154 ?auto_425157 ) ) ( not ( = ?auto_425154 ?auto_425158 ) ) ( not ( = ?auto_425154 ?auto_425159 ) ) ( not ( = ?auto_425154 ?auto_425160 ) ) ( not ( = ?auto_425155 ?auto_425156 ) ) ( not ( = ?auto_425155 ?auto_425157 ) ) ( not ( = ?auto_425155 ?auto_425158 ) ) ( not ( = ?auto_425155 ?auto_425159 ) ) ( not ( = ?auto_425155 ?auto_425160 ) ) ( not ( = ?auto_425156 ?auto_425157 ) ) ( not ( = ?auto_425156 ?auto_425158 ) ) ( not ( = ?auto_425156 ?auto_425159 ) ) ( not ( = ?auto_425156 ?auto_425160 ) ) ( not ( = ?auto_425157 ?auto_425158 ) ) ( not ( = ?auto_425157 ?auto_425159 ) ) ( not ( = ?auto_425157 ?auto_425160 ) ) ( not ( = ?auto_425158 ?auto_425159 ) ) ( not ( = ?auto_425158 ?auto_425160 ) ) ( not ( = ?auto_425159 ?auto_425160 ) ) ( ON ?auto_425158 ?auto_425159 ) ( ON ?auto_425157 ?auto_425158 ) ( ON ?auto_425156 ?auto_425157 ) ( ON ?auto_425155 ?auto_425156 ) ( ON ?auto_425154 ?auto_425155 ) ( CLEAR ?auto_425152 ) ( ON ?auto_425153 ?auto_425154 ) ( CLEAR ?auto_425153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_425149 ?auto_425150 ?auto_425151 ?auto_425152 ?auto_425153 )
      ( MAKE-11PILE ?auto_425149 ?auto_425150 ?auto_425151 ?auto_425152 ?auto_425153 ?auto_425154 ?auto_425155 ?auto_425156 ?auto_425157 ?auto_425158 ?auto_425159 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_425172 - BLOCK
      ?auto_425173 - BLOCK
      ?auto_425174 - BLOCK
      ?auto_425175 - BLOCK
      ?auto_425176 - BLOCK
      ?auto_425177 - BLOCK
      ?auto_425178 - BLOCK
      ?auto_425179 - BLOCK
      ?auto_425180 - BLOCK
      ?auto_425181 - BLOCK
      ?auto_425182 - BLOCK
    )
    :vars
    (
      ?auto_425183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425182 ?auto_425183 ) ( ON-TABLE ?auto_425172 ) ( ON ?auto_425173 ?auto_425172 ) ( ON ?auto_425174 ?auto_425173 ) ( ON ?auto_425175 ?auto_425174 ) ( not ( = ?auto_425172 ?auto_425173 ) ) ( not ( = ?auto_425172 ?auto_425174 ) ) ( not ( = ?auto_425172 ?auto_425175 ) ) ( not ( = ?auto_425172 ?auto_425176 ) ) ( not ( = ?auto_425172 ?auto_425177 ) ) ( not ( = ?auto_425172 ?auto_425178 ) ) ( not ( = ?auto_425172 ?auto_425179 ) ) ( not ( = ?auto_425172 ?auto_425180 ) ) ( not ( = ?auto_425172 ?auto_425181 ) ) ( not ( = ?auto_425172 ?auto_425182 ) ) ( not ( = ?auto_425172 ?auto_425183 ) ) ( not ( = ?auto_425173 ?auto_425174 ) ) ( not ( = ?auto_425173 ?auto_425175 ) ) ( not ( = ?auto_425173 ?auto_425176 ) ) ( not ( = ?auto_425173 ?auto_425177 ) ) ( not ( = ?auto_425173 ?auto_425178 ) ) ( not ( = ?auto_425173 ?auto_425179 ) ) ( not ( = ?auto_425173 ?auto_425180 ) ) ( not ( = ?auto_425173 ?auto_425181 ) ) ( not ( = ?auto_425173 ?auto_425182 ) ) ( not ( = ?auto_425173 ?auto_425183 ) ) ( not ( = ?auto_425174 ?auto_425175 ) ) ( not ( = ?auto_425174 ?auto_425176 ) ) ( not ( = ?auto_425174 ?auto_425177 ) ) ( not ( = ?auto_425174 ?auto_425178 ) ) ( not ( = ?auto_425174 ?auto_425179 ) ) ( not ( = ?auto_425174 ?auto_425180 ) ) ( not ( = ?auto_425174 ?auto_425181 ) ) ( not ( = ?auto_425174 ?auto_425182 ) ) ( not ( = ?auto_425174 ?auto_425183 ) ) ( not ( = ?auto_425175 ?auto_425176 ) ) ( not ( = ?auto_425175 ?auto_425177 ) ) ( not ( = ?auto_425175 ?auto_425178 ) ) ( not ( = ?auto_425175 ?auto_425179 ) ) ( not ( = ?auto_425175 ?auto_425180 ) ) ( not ( = ?auto_425175 ?auto_425181 ) ) ( not ( = ?auto_425175 ?auto_425182 ) ) ( not ( = ?auto_425175 ?auto_425183 ) ) ( not ( = ?auto_425176 ?auto_425177 ) ) ( not ( = ?auto_425176 ?auto_425178 ) ) ( not ( = ?auto_425176 ?auto_425179 ) ) ( not ( = ?auto_425176 ?auto_425180 ) ) ( not ( = ?auto_425176 ?auto_425181 ) ) ( not ( = ?auto_425176 ?auto_425182 ) ) ( not ( = ?auto_425176 ?auto_425183 ) ) ( not ( = ?auto_425177 ?auto_425178 ) ) ( not ( = ?auto_425177 ?auto_425179 ) ) ( not ( = ?auto_425177 ?auto_425180 ) ) ( not ( = ?auto_425177 ?auto_425181 ) ) ( not ( = ?auto_425177 ?auto_425182 ) ) ( not ( = ?auto_425177 ?auto_425183 ) ) ( not ( = ?auto_425178 ?auto_425179 ) ) ( not ( = ?auto_425178 ?auto_425180 ) ) ( not ( = ?auto_425178 ?auto_425181 ) ) ( not ( = ?auto_425178 ?auto_425182 ) ) ( not ( = ?auto_425178 ?auto_425183 ) ) ( not ( = ?auto_425179 ?auto_425180 ) ) ( not ( = ?auto_425179 ?auto_425181 ) ) ( not ( = ?auto_425179 ?auto_425182 ) ) ( not ( = ?auto_425179 ?auto_425183 ) ) ( not ( = ?auto_425180 ?auto_425181 ) ) ( not ( = ?auto_425180 ?auto_425182 ) ) ( not ( = ?auto_425180 ?auto_425183 ) ) ( not ( = ?auto_425181 ?auto_425182 ) ) ( not ( = ?auto_425181 ?auto_425183 ) ) ( not ( = ?auto_425182 ?auto_425183 ) ) ( ON ?auto_425181 ?auto_425182 ) ( ON ?auto_425180 ?auto_425181 ) ( ON ?auto_425179 ?auto_425180 ) ( ON ?auto_425178 ?auto_425179 ) ( ON ?auto_425177 ?auto_425178 ) ( CLEAR ?auto_425175 ) ( ON ?auto_425176 ?auto_425177 ) ( CLEAR ?auto_425176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_425172 ?auto_425173 ?auto_425174 ?auto_425175 ?auto_425176 )
      ( MAKE-11PILE ?auto_425172 ?auto_425173 ?auto_425174 ?auto_425175 ?auto_425176 ?auto_425177 ?auto_425178 ?auto_425179 ?auto_425180 ?auto_425181 ?auto_425182 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_425195 - BLOCK
      ?auto_425196 - BLOCK
      ?auto_425197 - BLOCK
      ?auto_425198 - BLOCK
      ?auto_425199 - BLOCK
      ?auto_425200 - BLOCK
      ?auto_425201 - BLOCK
      ?auto_425202 - BLOCK
      ?auto_425203 - BLOCK
      ?auto_425204 - BLOCK
      ?auto_425205 - BLOCK
    )
    :vars
    (
      ?auto_425206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425205 ?auto_425206 ) ( ON-TABLE ?auto_425195 ) ( ON ?auto_425196 ?auto_425195 ) ( ON ?auto_425197 ?auto_425196 ) ( not ( = ?auto_425195 ?auto_425196 ) ) ( not ( = ?auto_425195 ?auto_425197 ) ) ( not ( = ?auto_425195 ?auto_425198 ) ) ( not ( = ?auto_425195 ?auto_425199 ) ) ( not ( = ?auto_425195 ?auto_425200 ) ) ( not ( = ?auto_425195 ?auto_425201 ) ) ( not ( = ?auto_425195 ?auto_425202 ) ) ( not ( = ?auto_425195 ?auto_425203 ) ) ( not ( = ?auto_425195 ?auto_425204 ) ) ( not ( = ?auto_425195 ?auto_425205 ) ) ( not ( = ?auto_425195 ?auto_425206 ) ) ( not ( = ?auto_425196 ?auto_425197 ) ) ( not ( = ?auto_425196 ?auto_425198 ) ) ( not ( = ?auto_425196 ?auto_425199 ) ) ( not ( = ?auto_425196 ?auto_425200 ) ) ( not ( = ?auto_425196 ?auto_425201 ) ) ( not ( = ?auto_425196 ?auto_425202 ) ) ( not ( = ?auto_425196 ?auto_425203 ) ) ( not ( = ?auto_425196 ?auto_425204 ) ) ( not ( = ?auto_425196 ?auto_425205 ) ) ( not ( = ?auto_425196 ?auto_425206 ) ) ( not ( = ?auto_425197 ?auto_425198 ) ) ( not ( = ?auto_425197 ?auto_425199 ) ) ( not ( = ?auto_425197 ?auto_425200 ) ) ( not ( = ?auto_425197 ?auto_425201 ) ) ( not ( = ?auto_425197 ?auto_425202 ) ) ( not ( = ?auto_425197 ?auto_425203 ) ) ( not ( = ?auto_425197 ?auto_425204 ) ) ( not ( = ?auto_425197 ?auto_425205 ) ) ( not ( = ?auto_425197 ?auto_425206 ) ) ( not ( = ?auto_425198 ?auto_425199 ) ) ( not ( = ?auto_425198 ?auto_425200 ) ) ( not ( = ?auto_425198 ?auto_425201 ) ) ( not ( = ?auto_425198 ?auto_425202 ) ) ( not ( = ?auto_425198 ?auto_425203 ) ) ( not ( = ?auto_425198 ?auto_425204 ) ) ( not ( = ?auto_425198 ?auto_425205 ) ) ( not ( = ?auto_425198 ?auto_425206 ) ) ( not ( = ?auto_425199 ?auto_425200 ) ) ( not ( = ?auto_425199 ?auto_425201 ) ) ( not ( = ?auto_425199 ?auto_425202 ) ) ( not ( = ?auto_425199 ?auto_425203 ) ) ( not ( = ?auto_425199 ?auto_425204 ) ) ( not ( = ?auto_425199 ?auto_425205 ) ) ( not ( = ?auto_425199 ?auto_425206 ) ) ( not ( = ?auto_425200 ?auto_425201 ) ) ( not ( = ?auto_425200 ?auto_425202 ) ) ( not ( = ?auto_425200 ?auto_425203 ) ) ( not ( = ?auto_425200 ?auto_425204 ) ) ( not ( = ?auto_425200 ?auto_425205 ) ) ( not ( = ?auto_425200 ?auto_425206 ) ) ( not ( = ?auto_425201 ?auto_425202 ) ) ( not ( = ?auto_425201 ?auto_425203 ) ) ( not ( = ?auto_425201 ?auto_425204 ) ) ( not ( = ?auto_425201 ?auto_425205 ) ) ( not ( = ?auto_425201 ?auto_425206 ) ) ( not ( = ?auto_425202 ?auto_425203 ) ) ( not ( = ?auto_425202 ?auto_425204 ) ) ( not ( = ?auto_425202 ?auto_425205 ) ) ( not ( = ?auto_425202 ?auto_425206 ) ) ( not ( = ?auto_425203 ?auto_425204 ) ) ( not ( = ?auto_425203 ?auto_425205 ) ) ( not ( = ?auto_425203 ?auto_425206 ) ) ( not ( = ?auto_425204 ?auto_425205 ) ) ( not ( = ?auto_425204 ?auto_425206 ) ) ( not ( = ?auto_425205 ?auto_425206 ) ) ( ON ?auto_425204 ?auto_425205 ) ( ON ?auto_425203 ?auto_425204 ) ( ON ?auto_425202 ?auto_425203 ) ( ON ?auto_425201 ?auto_425202 ) ( ON ?auto_425200 ?auto_425201 ) ( ON ?auto_425199 ?auto_425200 ) ( CLEAR ?auto_425197 ) ( ON ?auto_425198 ?auto_425199 ) ( CLEAR ?auto_425198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_425195 ?auto_425196 ?auto_425197 ?auto_425198 )
      ( MAKE-11PILE ?auto_425195 ?auto_425196 ?auto_425197 ?auto_425198 ?auto_425199 ?auto_425200 ?auto_425201 ?auto_425202 ?auto_425203 ?auto_425204 ?auto_425205 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_425218 - BLOCK
      ?auto_425219 - BLOCK
      ?auto_425220 - BLOCK
      ?auto_425221 - BLOCK
      ?auto_425222 - BLOCK
      ?auto_425223 - BLOCK
      ?auto_425224 - BLOCK
      ?auto_425225 - BLOCK
      ?auto_425226 - BLOCK
      ?auto_425227 - BLOCK
      ?auto_425228 - BLOCK
    )
    :vars
    (
      ?auto_425229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425228 ?auto_425229 ) ( ON-TABLE ?auto_425218 ) ( ON ?auto_425219 ?auto_425218 ) ( ON ?auto_425220 ?auto_425219 ) ( not ( = ?auto_425218 ?auto_425219 ) ) ( not ( = ?auto_425218 ?auto_425220 ) ) ( not ( = ?auto_425218 ?auto_425221 ) ) ( not ( = ?auto_425218 ?auto_425222 ) ) ( not ( = ?auto_425218 ?auto_425223 ) ) ( not ( = ?auto_425218 ?auto_425224 ) ) ( not ( = ?auto_425218 ?auto_425225 ) ) ( not ( = ?auto_425218 ?auto_425226 ) ) ( not ( = ?auto_425218 ?auto_425227 ) ) ( not ( = ?auto_425218 ?auto_425228 ) ) ( not ( = ?auto_425218 ?auto_425229 ) ) ( not ( = ?auto_425219 ?auto_425220 ) ) ( not ( = ?auto_425219 ?auto_425221 ) ) ( not ( = ?auto_425219 ?auto_425222 ) ) ( not ( = ?auto_425219 ?auto_425223 ) ) ( not ( = ?auto_425219 ?auto_425224 ) ) ( not ( = ?auto_425219 ?auto_425225 ) ) ( not ( = ?auto_425219 ?auto_425226 ) ) ( not ( = ?auto_425219 ?auto_425227 ) ) ( not ( = ?auto_425219 ?auto_425228 ) ) ( not ( = ?auto_425219 ?auto_425229 ) ) ( not ( = ?auto_425220 ?auto_425221 ) ) ( not ( = ?auto_425220 ?auto_425222 ) ) ( not ( = ?auto_425220 ?auto_425223 ) ) ( not ( = ?auto_425220 ?auto_425224 ) ) ( not ( = ?auto_425220 ?auto_425225 ) ) ( not ( = ?auto_425220 ?auto_425226 ) ) ( not ( = ?auto_425220 ?auto_425227 ) ) ( not ( = ?auto_425220 ?auto_425228 ) ) ( not ( = ?auto_425220 ?auto_425229 ) ) ( not ( = ?auto_425221 ?auto_425222 ) ) ( not ( = ?auto_425221 ?auto_425223 ) ) ( not ( = ?auto_425221 ?auto_425224 ) ) ( not ( = ?auto_425221 ?auto_425225 ) ) ( not ( = ?auto_425221 ?auto_425226 ) ) ( not ( = ?auto_425221 ?auto_425227 ) ) ( not ( = ?auto_425221 ?auto_425228 ) ) ( not ( = ?auto_425221 ?auto_425229 ) ) ( not ( = ?auto_425222 ?auto_425223 ) ) ( not ( = ?auto_425222 ?auto_425224 ) ) ( not ( = ?auto_425222 ?auto_425225 ) ) ( not ( = ?auto_425222 ?auto_425226 ) ) ( not ( = ?auto_425222 ?auto_425227 ) ) ( not ( = ?auto_425222 ?auto_425228 ) ) ( not ( = ?auto_425222 ?auto_425229 ) ) ( not ( = ?auto_425223 ?auto_425224 ) ) ( not ( = ?auto_425223 ?auto_425225 ) ) ( not ( = ?auto_425223 ?auto_425226 ) ) ( not ( = ?auto_425223 ?auto_425227 ) ) ( not ( = ?auto_425223 ?auto_425228 ) ) ( not ( = ?auto_425223 ?auto_425229 ) ) ( not ( = ?auto_425224 ?auto_425225 ) ) ( not ( = ?auto_425224 ?auto_425226 ) ) ( not ( = ?auto_425224 ?auto_425227 ) ) ( not ( = ?auto_425224 ?auto_425228 ) ) ( not ( = ?auto_425224 ?auto_425229 ) ) ( not ( = ?auto_425225 ?auto_425226 ) ) ( not ( = ?auto_425225 ?auto_425227 ) ) ( not ( = ?auto_425225 ?auto_425228 ) ) ( not ( = ?auto_425225 ?auto_425229 ) ) ( not ( = ?auto_425226 ?auto_425227 ) ) ( not ( = ?auto_425226 ?auto_425228 ) ) ( not ( = ?auto_425226 ?auto_425229 ) ) ( not ( = ?auto_425227 ?auto_425228 ) ) ( not ( = ?auto_425227 ?auto_425229 ) ) ( not ( = ?auto_425228 ?auto_425229 ) ) ( ON ?auto_425227 ?auto_425228 ) ( ON ?auto_425226 ?auto_425227 ) ( ON ?auto_425225 ?auto_425226 ) ( ON ?auto_425224 ?auto_425225 ) ( ON ?auto_425223 ?auto_425224 ) ( ON ?auto_425222 ?auto_425223 ) ( CLEAR ?auto_425220 ) ( ON ?auto_425221 ?auto_425222 ) ( CLEAR ?auto_425221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_425218 ?auto_425219 ?auto_425220 ?auto_425221 )
      ( MAKE-11PILE ?auto_425218 ?auto_425219 ?auto_425220 ?auto_425221 ?auto_425222 ?auto_425223 ?auto_425224 ?auto_425225 ?auto_425226 ?auto_425227 ?auto_425228 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_425241 - BLOCK
      ?auto_425242 - BLOCK
      ?auto_425243 - BLOCK
      ?auto_425244 - BLOCK
      ?auto_425245 - BLOCK
      ?auto_425246 - BLOCK
      ?auto_425247 - BLOCK
      ?auto_425248 - BLOCK
      ?auto_425249 - BLOCK
      ?auto_425250 - BLOCK
      ?auto_425251 - BLOCK
    )
    :vars
    (
      ?auto_425252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425251 ?auto_425252 ) ( ON-TABLE ?auto_425241 ) ( ON ?auto_425242 ?auto_425241 ) ( not ( = ?auto_425241 ?auto_425242 ) ) ( not ( = ?auto_425241 ?auto_425243 ) ) ( not ( = ?auto_425241 ?auto_425244 ) ) ( not ( = ?auto_425241 ?auto_425245 ) ) ( not ( = ?auto_425241 ?auto_425246 ) ) ( not ( = ?auto_425241 ?auto_425247 ) ) ( not ( = ?auto_425241 ?auto_425248 ) ) ( not ( = ?auto_425241 ?auto_425249 ) ) ( not ( = ?auto_425241 ?auto_425250 ) ) ( not ( = ?auto_425241 ?auto_425251 ) ) ( not ( = ?auto_425241 ?auto_425252 ) ) ( not ( = ?auto_425242 ?auto_425243 ) ) ( not ( = ?auto_425242 ?auto_425244 ) ) ( not ( = ?auto_425242 ?auto_425245 ) ) ( not ( = ?auto_425242 ?auto_425246 ) ) ( not ( = ?auto_425242 ?auto_425247 ) ) ( not ( = ?auto_425242 ?auto_425248 ) ) ( not ( = ?auto_425242 ?auto_425249 ) ) ( not ( = ?auto_425242 ?auto_425250 ) ) ( not ( = ?auto_425242 ?auto_425251 ) ) ( not ( = ?auto_425242 ?auto_425252 ) ) ( not ( = ?auto_425243 ?auto_425244 ) ) ( not ( = ?auto_425243 ?auto_425245 ) ) ( not ( = ?auto_425243 ?auto_425246 ) ) ( not ( = ?auto_425243 ?auto_425247 ) ) ( not ( = ?auto_425243 ?auto_425248 ) ) ( not ( = ?auto_425243 ?auto_425249 ) ) ( not ( = ?auto_425243 ?auto_425250 ) ) ( not ( = ?auto_425243 ?auto_425251 ) ) ( not ( = ?auto_425243 ?auto_425252 ) ) ( not ( = ?auto_425244 ?auto_425245 ) ) ( not ( = ?auto_425244 ?auto_425246 ) ) ( not ( = ?auto_425244 ?auto_425247 ) ) ( not ( = ?auto_425244 ?auto_425248 ) ) ( not ( = ?auto_425244 ?auto_425249 ) ) ( not ( = ?auto_425244 ?auto_425250 ) ) ( not ( = ?auto_425244 ?auto_425251 ) ) ( not ( = ?auto_425244 ?auto_425252 ) ) ( not ( = ?auto_425245 ?auto_425246 ) ) ( not ( = ?auto_425245 ?auto_425247 ) ) ( not ( = ?auto_425245 ?auto_425248 ) ) ( not ( = ?auto_425245 ?auto_425249 ) ) ( not ( = ?auto_425245 ?auto_425250 ) ) ( not ( = ?auto_425245 ?auto_425251 ) ) ( not ( = ?auto_425245 ?auto_425252 ) ) ( not ( = ?auto_425246 ?auto_425247 ) ) ( not ( = ?auto_425246 ?auto_425248 ) ) ( not ( = ?auto_425246 ?auto_425249 ) ) ( not ( = ?auto_425246 ?auto_425250 ) ) ( not ( = ?auto_425246 ?auto_425251 ) ) ( not ( = ?auto_425246 ?auto_425252 ) ) ( not ( = ?auto_425247 ?auto_425248 ) ) ( not ( = ?auto_425247 ?auto_425249 ) ) ( not ( = ?auto_425247 ?auto_425250 ) ) ( not ( = ?auto_425247 ?auto_425251 ) ) ( not ( = ?auto_425247 ?auto_425252 ) ) ( not ( = ?auto_425248 ?auto_425249 ) ) ( not ( = ?auto_425248 ?auto_425250 ) ) ( not ( = ?auto_425248 ?auto_425251 ) ) ( not ( = ?auto_425248 ?auto_425252 ) ) ( not ( = ?auto_425249 ?auto_425250 ) ) ( not ( = ?auto_425249 ?auto_425251 ) ) ( not ( = ?auto_425249 ?auto_425252 ) ) ( not ( = ?auto_425250 ?auto_425251 ) ) ( not ( = ?auto_425250 ?auto_425252 ) ) ( not ( = ?auto_425251 ?auto_425252 ) ) ( ON ?auto_425250 ?auto_425251 ) ( ON ?auto_425249 ?auto_425250 ) ( ON ?auto_425248 ?auto_425249 ) ( ON ?auto_425247 ?auto_425248 ) ( ON ?auto_425246 ?auto_425247 ) ( ON ?auto_425245 ?auto_425246 ) ( ON ?auto_425244 ?auto_425245 ) ( CLEAR ?auto_425242 ) ( ON ?auto_425243 ?auto_425244 ) ( CLEAR ?auto_425243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_425241 ?auto_425242 ?auto_425243 )
      ( MAKE-11PILE ?auto_425241 ?auto_425242 ?auto_425243 ?auto_425244 ?auto_425245 ?auto_425246 ?auto_425247 ?auto_425248 ?auto_425249 ?auto_425250 ?auto_425251 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_425264 - BLOCK
      ?auto_425265 - BLOCK
      ?auto_425266 - BLOCK
      ?auto_425267 - BLOCK
      ?auto_425268 - BLOCK
      ?auto_425269 - BLOCK
      ?auto_425270 - BLOCK
      ?auto_425271 - BLOCK
      ?auto_425272 - BLOCK
      ?auto_425273 - BLOCK
      ?auto_425274 - BLOCK
    )
    :vars
    (
      ?auto_425275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425274 ?auto_425275 ) ( ON-TABLE ?auto_425264 ) ( ON ?auto_425265 ?auto_425264 ) ( not ( = ?auto_425264 ?auto_425265 ) ) ( not ( = ?auto_425264 ?auto_425266 ) ) ( not ( = ?auto_425264 ?auto_425267 ) ) ( not ( = ?auto_425264 ?auto_425268 ) ) ( not ( = ?auto_425264 ?auto_425269 ) ) ( not ( = ?auto_425264 ?auto_425270 ) ) ( not ( = ?auto_425264 ?auto_425271 ) ) ( not ( = ?auto_425264 ?auto_425272 ) ) ( not ( = ?auto_425264 ?auto_425273 ) ) ( not ( = ?auto_425264 ?auto_425274 ) ) ( not ( = ?auto_425264 ?auto_425275 ) ) ( not ( = ?auto_425265 ?auto_425266 ) ) ( not ( = ?auto_425265 ?auto_425267 ) ) ( not ( = ?auto_425265 ?auto_425268 ) ) ( not ( = ?auto_425265 ?auto_425269 ) ) ( not ( = ?auto_425265 ?auto_425270 ) ) ( not ( = ?auto_425265 ?auto_425271 ) ) ( not ( = ?auto_425265 ?auto_425272 ) ) ( not ( = ?auto_425265 ?auto_425273 ) ) ( not ( = ?auto_425265 ?auto_425274 ) ) ( not ( = ?auto_425265 ?auto_425275 ) ) ( not ( = ?auto_425266 ?auto_425267 ) ) ( not ( = ?auto_425266 ?auto_425268 ) ) ( not ( = ?auto_425266 ?auto_425269 ) ) ( not ( = ?auto_425266 ?auto_425270 ) ) ( not ( = ?auto_425266 ?auto_425271 ) ) ( not ( = ?auto_425266 ?auto_425272 ) ) ( not ( = ?auto_425266 ?auto_425273 ) ) ( not ( = ?auto_425266 ?auto_425274 ) ) ( not ( = ?auto_425266 ?auto_425275 ) ) ( not ( = ?auto_425267 ?auto_425268 ) ) ( not ( = ?auto_425267 ?auto_425269 ) ) ( not ( = ?auto_425267 ?auto_425270 ) ) ( not ( = ?auto_425267 ?auto_425271 ) ) ( not ( = ?auto_425267 ?auto_425272 ) ) ( not ( = ?auto_425267 ?auto_425273 ) ) ( not ( = ?auto_425267 ?auto_425274 ) ) ( not ( = ?auto_425267 ?auto_425275 ) ) ( not ( = ?auto_425268 ?auto_425269 ) ) ( not ( = ?auto_425268 ?auto_425270 ) ) ( not ( = ?auto_425268 ?auto_425271 ) ) ( not ( = ?auto_425268 ?auto_425272 ) ) ( not ( = ?auto_425268 ?auto_425273 ) ) ( not ( = ?auto_425268 ?auto_425274 ) ) ( not ( = ?auto_425268 ?auto_425275 ) ) ( not ( = ?auto_425269 ?auto_425270 ) ) ( not ( = ?auto_425269 ?auto_425271 ) ) ( not ( = ?auto_425269 ?auto_425272 ) ) ( not ( = ?auto_425269 ?auto_425273 ) ) ( not ( = ?auto_425269 ?auto_425274 ) ) ( not ( = ?auto_425269 ?auto_425275 ) ) ( not ( = ?auto_425270 ?auto_425271 ) ) ( not ( = ?auto_425270 ?auto_425272 ) ) ( not ( = ?auto_425270 ?auto_425273 ) ) ( not ( = ?auto_425270 ?auto_425274 ) ) ( not ( = ?auto_425270 ?auto_425275 ) ) ( not ( = ?auto_425271 ?auto_425272 ) ) ( not ( = ?auto_425271 ?auto_425273 ) ) ( not ( = ?auto_425271 ?auto_425274 ) ) ( not ( = ?auto_425271 ?auto_425275 ) ) ( not ( = ?auto_425272 ?auto_425273 ) ) ( not ( = ?auto_425272 ?auto_425274 ) ) ( not ( = ?auto_425272 ?auto_425275 ) ) ( not ( = ?auto_425273 ?auto_425274 ) ) ( not ( = ?auto_425273 ?auto_425275 ) ) ( not ( = ?auto_425274 ?auto_425275 ) ) ( ON ?auto_425273 ?auto_425274 ) ( ON ?auto_425272 ?auto_425273 ) ( ON ?auto_425271 ?auto_425272 ) ( ON ?auto_425270 ?auto_425271 ) ( ON ?auto_425269 ?auto_425270 ) ( ON ?auto_425268 ?auto_425269 ) ( ON ?auto_425267 ?auto_425268 ) ( CLEAR ?auto_425265 ) ( ON ?auto_425266 ?auto_425267 ) ( CLEAR ?auto_425266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_425264 ?auto_425265 ?auto_425266 )
      ( MAKE-11PILE ?auto_425264 ?auto_425265 ?auto_425266 ?auto_425267 ?auto_425268 ?auto_425269 ?auto_425270 ?auto_425271 ?auto_425272 ?auto_425273 ?auto_425274 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_425287 - BLOCK
      ?auto_425288 - BLOCK
      ?auto_425289 - BLOCK
      ?auto_425290 - BLOCK
      ?auto_425291 - BLOCK
      ?auto_425292 - BLOCK
      ?auto_425293 - BLOCK
      ?auto_425294 - BLOCK
      ?auto_425295 - BLOCK
      ?auto_425296 - BLOCK
      ?auto_425297 - BLOCK
    )
    :vars
    (
      ?auto_425298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425297 ?auto_425298 ) ( ON-TABLE ?auto_425287 ) ( not ( = ?auto_425287 ?auto_425288 ) ) ( not ( = ?auto_425287 ?auto_425289 ) ) ( not ( = ?auto_425287 ?auto_425290 ) ) ( not ( = ?auto_425287 ?auto_425291 ) ) ( not ( = ?auto_425287 ?auto_425292 ) ) ( not ( = ?auto_425287 ?auto_425293 ) ) ( not ( = ?auto_425287 ?auto_425294 ) ) ( not ( = ?auto_425287 ?auto_425295 ) ) ( not ( = ?auto_425287 ?auto_425296 ) ) ( not ( = ?auto_425287 ?auto_425297 ) ) ( not ( = ?auto_425287 ?auto_425298 ) ) ( not ( = ?auto_425288 ?auto_425289 ) ) ( not ( = ?auto_425288 ?auto_425290 ) ) ( not ( = ?auto_425288 ?auto_425291 ) ) ( not ( = ?auto_425288 ?auto_425292 ) ) ( not ( = ?auto_425288 ?auto_425293 ) ) ( not ( = ?auto_425288 ?auto_425294 ) ) ( not ( = ?auto_425288 ?auto_425295 ) ) ( not ( = ?auto_425288 ?auto_425296 ) ) ( not ( = ?auto_425288 ?auto_425297 ) ) ( not ( = ?auto_425288 ?auto_425298 ) ) ( not ( = ?auto_425289 ?auto_425290 ) ) ( not ( = ?auto_425289 ?auto_425291 ) ) ( not ( = ?auto_425289 ?auto_425292 ) ) ( not ( = ?auto_425289 ?auto_425293 ) ) ( not ( = ?auto_425289 ?auto_425294 ) ) ( not ( = ?auto_425289 ?auto_425295 ) ) ( not ( = ?auto_425289 ?auto_425296 ) ) ( not ( = ?auto_425289 ?auto_425297 ) ) ( not ( = ?auto_425289 ?auto_425298 ) ) ( not ( = ?auto_425290 ?auto_425291 ) ) ( not ( = ?auto_425290 ?auto_425292 ) ) ( not ( = ?auto_425290 ?auto_425293 ) ) ( not ( = ?auto_425290 ?auto_425294 ) ) ( not ( = ?auto_425290 ?auto_425295 ) ) ( not ( = ?auto_425290 ?auto_425296 ) ) ( not ( = ?auto_425290 ?auto_425297 ) ) ( not ( = ?auto_425290 ?auto_425298 ) ) ( not ( = ?auto_425291 ?auto_425292 ) ) ( not ( = ?auto_425291 ?auto_425293 ) ) ( not ( = ?auto_425291 ?auto_425294 ) ) ( not ( = ?auto_425291 ?auto_425295 ) ) ( not ( = ?auto_425291 ?auto_425296 ) ) ( not ( = ?auto_425291 ?auto_425297 ) ) ( not ( = ?auto_425291 ?auto_425298 ) ) ( not ( = ?auto_425292 ?auto_425293 ) ) ( not ( = ?auto_425292 ?auto_425294 ) ) ( not ( = ?auto_425292 ?auto_425295 ) ) ( not ( = ?auto_425292 ?auto_425296 ) ) ( not ( = ?auto_425292 ?auto_425297 ) ) ( not ( = ?auto_425292 ?auto_425298 ) ) ( not ( = ?auto_425293 ?auto_425294 ) ) ( not ( = ?auto_425293 ?auto_425295 ) ) ( not ( = ?auto_425293 ?auto_425296 ) ) ( not ( = ?auto_425293 ?auto_425297 ) ) ( not ( = ?auto_425293 ?auto_425298 ) ) ( not ( = ?auto_425294 ?auto_425295 ) ) ( not ( = ?auto_425294 ?auto_425296 ) ) ( not ( = ?auto_425294 ?auto_425297 ) ) ( not ( = ?auto_425294 ?auto_425298 ) ) ( not ( = ?auto_425295 ?auto_425296 ) ) ( not ( = ?auto_425295 ?auto_425297 ) ) ( not ( = ?auto_425295 ?auto_425298 ) ) ( not ( = ?auto_425296 ?auto_425297 ) ) ( not ( = ?auto_425296 ?auto_425298 ) ) ( not ( = ?auto_425297 ?auto_425298 ) ) ( ON ?auto_425296 ?auto_425297 ) ( ON ?auto_425295 ?auto_425296 ) ( ON ?auto_425294 ?auto_425295 ) ( ON ?auto_425293 ?auto_425294 ) ( ON ?auto_425292 ?auto_425293 ) ( ON ?auto_425291 ?auto_425292 ) ( ON ?auto_425290 ?auto_425291 ) ( ON ?auto_425289 ?auto_425290 ) ( CLEAR ?auto_425287 ) ( ON ?auto_425288 ?auto_425289 ) ( CLEAR ?auto_425288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_425287 ?auto_425288 )
      ( MAKE-11PILE ?auto_425287 ?auto_425288 ?auto_425289 ?auto_425290 ?auto_425291 ?auto_425292 ?auto_425293 ?auto_425294 ?auto_425295 ?auto_425296 ?auto_425297 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_425310 - BLOCK
      ?auto_425311 - BLOCK
      ?auto_425312 - BLOCK
      ?auto_425313 - BLOCK
      ?auto_425314 - BLOCK
      ?auto_425315 - BLOCK
      ?auto_425316 - BLOCK
      ?auto_425317 - BLOCK
      ?auto_425318 - BLOCK
      ?auto_425319 - BLOCK
      ?auto_425320 - BLOCK
    )
    :vars
    (
      ?auto_425321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425320 ?auto_425321 ) ( ON-TABLE ?auto_425310 ) ( not ( = ?auto_425310 ?auto_425311 ) ) ( not ( = ?auto_425310 ?auto_425312 ) ) ( not ( = ?auto_425310 ?auto_425313 ) ) ( not ( = ?auto_425310 ?auto_425314 ) ) ( not ( = ?auto_425310 ?auto_425315 ) ) ( not ( = ?auto_425310 ?auto_425316 ) ) ( not ( = ?auto_425310 ?auto_425317 ) ) ( not ( = ?auto_425310 ?auto_425318 ) ) ( not ( = ?auto_425310 ?auto_425319 ) ) ( not ( = ?auto_425310 ?auto_425320 ) ) ( not ( = ?auto_425310 ?auto_425321 ) ) ( not ( = ?auto_425311 ?auto_425312 ) ) ( not ( = ?auto_425311 ?auto_425313 ) ) ( not ( = ?auto_425311 ?auto_425314 ) ) ( not ( = ?auto_425311 ?auto_425315 ) ) ( not ( = ?auto_425311 ?auto_425316 ) ) ( not ( = ?auto_425311 ?auto_425317 ) ) ( not ( = ?auto_425311 ?auto_425318 ) ) ( not ( = ?auto_425311 ?auto_425319 ) ) ( not ( = ?auto_425311 ?auto_425320 ) ) ( not ( = ?auto_425311 ?auto_425321 ) ) ( not ( = ?auto_425312 ?auto_425313 ) ) ( not ( = ?auto_425312 ?auto_425314 ) ) ( not ( = ?auto_425312 ?auto_425315 ) ) ( not ( = ?auto_425312 ?auto_425316 ) ) ( not ( = ?auto_425312 ?auto_425317 ) ) ( not ( = ?auto_425312 ?auto_425318 ) ) ( not ( = ?auto_425312 ?auto_425319 ) ) ( not ( = ?auto_425312 ?auto_425320 ) ) ( not ( = ?auto_425312 ?auto_425321 ) ) ( not ( = ?auto_425313 ?auto_425314 ) ) ( not ( = ?auto_425313 ?auto_425315 ) ) ( not ( = ?auto_425313 ?auto_425316 ) ) ( not ( = ?auto_425313 ?auto_425317 ) ) ( not ( = ?auto_425313 ?auto_425318 ) ) ( not ( = ?auto_425313 ?auto_425319 ) ) ( not ( = ?auto_425313 ?auto_425320 ) ) ( not ( = ?auto_425313 ?auto_425321 ) ) ( not ( = ?auto_425314 ?auto_425315 ) ) ( not ( = ?auto_425314 ?auto_425316 ) ) ( not ( = ?auto_425314 ?auto_425317 ) ) ( not ( = ?auto_425314 ?auto_425318 ) ) ( not ( = ?auto_425314 ?auto_425319 ) ) ( not ( = ?auto_425314 ?auto_425320 ) ) ( not ( = ?auto_425314 ?auto_425321 ) ) ( not ( = ?auto_425315 ?auto_425316 ) ) ( not ( = ?auto_425315 ?auto_425317 ) ) ( not ( = ?auto_425315 ?auto_425318 ) ) ( not ( = ?auto_425315 ?auto_425319 ) ) ( not ( = ?auto_425315 ?auto_425320 ) ) ( not ( = ?auto_425315 ?auto_425321 ) ) ( not ( = ?auto_425316 ?auto_425317 ) ) ( not ( = ?auto_425316 ?auto_425318 ) ) ( not ( = ?auto_425316 ?auto_425319 ) ) ( not ( = ?auto_425316 ?auto_425320 ) ) ( not ( = ?auto_425316 ?auto_425321 ) ) ( not ( = ?auto_425317 ?auto_425318 ) ) ( not ( = ?auto_425317 ?auto_425319 ) ) ( not ( = ?auto_425317 ?auto_425320 ) ) ( not ( = ?auto_425317 ?auto_425321 ) ) ( not ( = ?auto_425318 ?auto_425319 ) ) ( not ( = ?auto_425318 ?auto_425320 ) ) ( not ( = ?auto_425318 ?auto_425321 ) ) ( not ( = ?auto_425319 ?auto_425320 ) ) ( not ( = ?auto_425319 ?auto_425321 ) ) ( not ( = ?auto_425320 ?auto_425321 ) ) ( ON ?auto_425319 ?auto_425320 ) ( ON ?auto_425318 ?auto_425319 ) ( ON ?auto_425317 ?auto_425318 ) ( ON ?auto_425316 ?auto_425317 ) ( ON ?auto_425315 ?auto_425316 ) ( ON ?auto_425314 ?auto_425315 ) ( ON ?auto_425313 ?auto_425314 ) ( ON ?auto_425312 ?auto_425313 ) ( CLEAR ?auto_425310 ) ( ON ?auto_425311 ?auto_425312 ) ( CLEAR ?auto_425311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_425310 ?auto_425311 )
      ( MAKE-11PILE ?auto_425310 ?auto_425311 ?auto_425312 ?auto_425313 ?auto_425314 ?auto_425315 ?auto_425316 ?auto_425317 ?auto_425318 ?auto_425319 ?auto_425320 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_425333 - BLOCK
      ?auto_425334 - BLOCK
      ?auto_425335 - BLOCK
      ?auto_425336 - BLOCK
      ?auto_425337 - BLOCK
      ?auto_425338 - BLOCK
      ?auto_425339 - BLOCK
      ?auto_425340 - BLOCK
      ?auto_425341 - BLOCK
      ?auto_425342 - BLOCK
      ?auto_425343 - BLOCK
    )
    :vars
    (
      ?auto_425344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425343 ?auto_425344 ) ( not ( = ?auto_425333 ?auto_425334 ) ) ( not ( = ?auto_425333 ?auto_425335 ) ) ( not ( = ?auto_425333 ?auto_425336 ) ) ( not ( = ?auto_425333 ?auto_425337 ) ) ( not ( = ?auto_425333 ?auto_425338 ) ) ( not ( = ?auto_425333 ?auto_425339 ) ) ( not ( = ?auto_425333 ?auto_425340 ) ) ( not ( = ?auto_425333 ?auto_425341 ) ) ( not ( = ?auto_425333 ?auto_425342 ) ) ( not ( = ?auto_425333 ?auto_425343 ) ) ( not ( = ?auto_425333 ?auto_425344 ) ) ( not ( = ?auto_425334 ?auto_425335 ) ) ( not ( = ?auto_425334 ?auto_425336 ) ) ( not ( = ?auto_425334 ?auto_425337 ) ) ( not ( = ?auto_425334 ?auto_425338 ) ) ( not ( = ?auto_425334 ?auto_425339 ) ) ( not ( = ?auto_425334 ?auto_425340 ) ) ( not ( = ?auto_425334 ?auto_425341 ) ) ( not ( = ?auto_425334 ?auto_425342 ) ) ( not ( = ?auto_425334 ?auto_425343 ) ) ( not ( = ?auto_425334 ?auto_425344 ) ) ( not ( = ?auto_425335 ?auto_425336 ) ) ( not ( = ?auto_425335 ?auto_425337 ) ) ( not ( = ?auto_425335 ?auto_425338 ) ) ( not ( = ?auto_425335 ?auto_425339 ) ) ( not ( = ?auto_425335 ?auto_425340 ) ) ( not ( = ?auto_425335 ?auto_425341 ) ) ( not ( = ?auto_425335 ?auto_425342 ) ) ( not ( = ?auto_425335 ?auto_425343 ) ) ( not ( = ?auto_425335 ?auto_425344 ) ) ( not ( = ?auto_425336 ?auto_425337 ) ) ( not ( = ?auto_425336 ?auto_425338 ) ) ( not ( = ?auto_425336 ?auto_425339 ) ) ( not ( = ?auto_425336 ?auto_425340 ) ) ( not ( = ?auto_425336 ?auto_425341 ) ) ( not ( = ?auto_425336 ?auto_425342 ) ) ( not ( = ?auto_425336 ?auto_425343 ) ) ( not ( = ?auto_425336 ?auto_425344 ) ) ( not ( = ?auto_425337 ?auto_425338 ) ) ( not ( = ?auto_425337 ?auto_425339 ) ) ( not ( = ?auto_425337 ?auto_425340 ) ) ( not ( = ?auto_425337 ?auto_425341 ) ) ( not ( = ?auto_425337 ?auto_425342 ) ) ( not ( = ?auto_425337 ?auto_425343 ) ) ( not ( = ?auto_425337 ?auto_425344 ) ) ( not ( = ?auto_425338 ?auto_425339 ) ) ( not ( = ?auto_425338 ?auto_425340 ) ) ( not ( = ?auto_425338 ?auto_425341 ) ) ( not ( = ?auto_425338 ?auto_425342 ) ) ( not ( = ?auto_425338 ?auto_425343 ) ) ( not ( = ?auto_425338 ?auto_425344 ) ) ( not ( = ?auto_425339 ?auto_425340 ) ) ( not ( = ?auto_425339 ?auto_425341 ) ) ( not ( = ?auto_425339 ?auto_425342 ) ) ( not ( = ?auto_425339 ?auto_425343 ) ) ( not ( = ?auto_425339 ?auto_425344 ) ) ( not ( = ?auto_425340 ?auto_425341 ) ) ( not ( = ?auto_425340 ?auto_425342 ) ) ( not ( = ?auto_425340 ?auto_425343 ) ) ( not ( = ?auto_425340 ?auto_425344 ) ) ( not ( = ?auto_425341 ?auto_425342 ) ) ( not ( = ?auto_425341 ?auto_425343 ) ) ( not ( = ?auto_425341 ?auto_425344 ) ) ( not ( = ?auto_425342 ?auto_425343 ) ) ( not ( = ?auto_425342 ?auto_425344 ) ) ( not ( = ?auto_425343 ?auto_425344 ) ) ( ON ?auto_425342 ?auto_425343 ) ( ON ?auto_425341 ?auto_425342 ) ( ON ?auto_425340 ?auto_425341 ) ( ON ?auto_425339 ?auto_425340 ) ( ON ?auto_425338 ?auto_425339 ) ( ON ?auto_425337 ?auto_425338 ) ( ON ?auto_425336 ?auto_425337 ) ( ON ?auto_425335 ?auto_425336 ) ( ON ?auto_425334 ?auto_425335 ) ( ON ?auto_425333 ?auto_425334 ) ( CLEAR ?auto_425333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_425333 )
      ( MAKE-11PILE ?auto_425333 ?auto_425334 ?auto_425335 ?auto_425336 ?auto_425337 ?auto_425338 ?auto_425339 ?auto_425340 ?auto_425341 ?auto_425342 ?auto_425343 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_425356 - BLOCK
      ?auto_425357 - BLOCK
      ?auto_425358 - BLOCK
      ?auto_425359 - BLOCK
      ?auto_425360 - BLOCK
      ?auto_425361 - BLOCK
      ?auto_425362 - BLOCK
      ?auto_425363 - BLOCK
      ?auto_425364 - BLOCK
      ?auto_425365 - BLOCK
      ?auto_425366 - BLOCK
    )
    :vars
    (
      ?auto_425367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425366 ?auto_425367 ) ( not ( = ?auto_425356 ?auto_425357 ) ) ( not ( = ?auto_425356 ?auto_425358 ) ) ( not ( = ?auto_425356 ?auto_425359 ) ) ( not ( = ?auto_425356 ?auto_425360 ) ) ( not ( = ?auto_425356 ?auto_425361 ) ) ( not ( = ?auto_425356 ?auto_425362 ) ) ( not ( = ?auto_425356 ?auto_425363 ) ) ( not ( = ?auto_425356 ?auto_425364 ) ) ( not ( = ?auto_425356 ?auto_425365 ) ) ( not ( = ?auto_425356 ?auto_425366 ) ) ( not ( = ?auto_425356 ?auto_425367 ) ) ( not ( = ?auto_425357 ?auto_425358 ) ) ( not ( = ?auto_425357 ?auto_425359 ) ) ( not ( = ?auto_425357 ?auto_425360 ) ) ( not ( = ?auto_425357 ?auto_425361 ) ) ( not ( = ?auto_425357 ?auto_425362 ) ) ( not ( = ?auto_425357 ?auto_425363 ) ) ( not ( = ?auto_425357 ?auto_425364 ) ) ( not ( = ?auto_425357 ?auto_425365 ) ) ( not ( = ?auto_425357 ?auto_425366 ) ) ( not ( = ?auto_425357 ?auto_425367 ) ) ( not ( = ?auto_425358 ?auto_425359 ) ) ( not ( = ?auto_425358 ?auto_425360 ) ) ( not ( = ?auto_425358 ?auto_425361 ) ) ( not ( = ?auto_425358 ?auto_425362 ) ) ( not ( = ?auto_425358 ?auto_425363 ) ) ( not ( = ?auto_425358 ?auto_425364 ) ) ( not ( = ?auto_425358 ?auto_425365 ) ) ( not ( = ?auto_425358 ?auto_425366 ) ) ( not ( = ?auto_425358 ?auto_425367 ) ) ( not ( = ?auto_425359 ?auto_425360 ) ) ( not ( = ?auto_425359 ?auto_425361 ) ) ( not ( = ?auto_425359 ?auto_425362 ) ) ( not ( = ?auto_425359 ?auto_425363 ) ) ( not ( = ?auto_425359 ?auto_425364 ) ) ( not ( = ?auto_425359 ?auto_425365 ) ) ( not ( = ?auto_425359 ?auto_425366 ) ) ( not ( = ?auto_425359 ?auto_425367 ) ) ( not ( = ?auto_425360 ?auto_425361 ) ) ( not ( = ?auto_425360 ?auto_425362 ) ) ( not ( = ?auto_425360 ?auto_425363 ) ) ( not ( = ?auto_425360 ?auto_425364 ) ) ( not ( = ?auto_425360 ?auto_425365 ) ) ( not ( = ?auto_425360 ?auto_425366 ) ) ( not ( = ?auto_425360 ?auto_425367 ) ) ( not ( = ?auto_425361 ?auto_425362 ) ) ( not ( = ?auto_425361 ?auto_425363 ) ) ( not ( = ?auto_425361 ?auto_425364 ) ) ( not ( = ?auto_425361 ?auto_425365 ) ) ( not ( = ?auto_425361 ?auto_425366 ) ) ( not ( = ?auto_425361 ?auto_425367 ) ) ( not ( = ?auto_425362 ?auto_425363 ) ) ( not ( = ?auto_425362 ?auto_425364 ) ) ( not ( = ?auto_425362 ?auto_425365 ) ) ( not ( = ?auto_425362 ?auto_425366 ) ) ( not ( = ?auto_425362 ?auto_425367 ) ) ( not ( = ?auto_425363 ?auto_425364 ) ) ( not ( = ?auto_425363 ?auto_425365 ) ) ( not ( = ?auto_425363 ?auto_425366 ) ) ( not ( = ?auto_425363 ?auto_425367 ) ) ( not ( = ?auto_425364 ?auto_425365 ) ) ( not ( = ?auto_425364 ?auto_425366 ) ) ( not ( = ?auto_425364 ?auto_425367 ) ) ( not ( = ?auto_425365 ?auto_425366 ) ) ( not ( = ?auto_425365 ?auto_425367 ) ) ( not ( = ?auto_425366 ?auto_425367 ) ) ( ON ?auto_425365 ?auto_425366 ) ( ON ?auto_425364 ?auto_425365 ) ( ON ?auto_425363 ?auto_425364 ) ( ON ?auto_425362 ?auto_425363 ) ( ON ?auto_425361 ?auto_425362 ) ( ON ?auto_425360 ?auto_425361 ) ( ON ?auto_425359 ?auto_425360 ) ( ON ?auto_425358 ?auto_425359 ) ( ON ?auto_425357 ?auto_425358 ) ( ON ?auto_425356 ?auto_425357 ) ( CLEAR ?auto_425356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_425356 )
      ( MAKE-11PILE ?auto_425356 ?auto_425357 ?auto_425358 ?auto_425359 ?auto_425360 ?auto_425361 ?auto_425362 ?auto_425363 ?auto_425364 ?auto_425365 ?auto_425366 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_425380 - BLOCK
      ?auto_425381 - BLOCK
      ?auto_425382 - BLOCK
      ?auto_425383 - BLOCK
      ?auto_425384 - BLOCK
      ?auto_425385 - BLOCK
      ?auto_425386 - BLOCK
      ?auto_425387 - BLOCK
      ?auto_425388 - BLOCK
      ?auto_425389 - BLOCK
      ?auto_425390 - BLOCK
      ?auto_425391 - BLOCK
    )
    :vars
    (
      ?auto_425392 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_425390 ) ( ON ?auto_425391 ?auto_425392 ) ( CLEAR ?auto_425391 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_425380 ) ( ON ?auto_425381 ?auto_425380 ) ( ON ?auto_425382 ?auto_425381 ) ( ON ?auto_425383 ?auto_425382 ) ( ON ?auto_425384 ?auto_425383 ) ( ON ?auto_425385 ?auto_425384 ) ( ON ?auto_425386 ?auto_425385 ) ( ON ?auto_425387 ?auto_425386 ) ( ON ?auto_425388 ?auto_425387 ) ( ON ?auto_425389 ?auto_425388 ) ( ON ?auto_425390 ?auto_425389 ) ( not ( = ?auto_425380 ?auto_425381 ) ) ( not ( = ?auto_425380 ?auto_425382 ) ) ( not ( = ?auto_425380 ?auto_425383 ) ) ( not ( = ?auto_425380 ?auto_425384 ) ) ( not ( = ?auto_425380 ?auto_425385 ) ) ( not ( = ?auto_425380 ?auto_425386 ) ) ( not ( = ?auto_425380 ?auto_425387 ) ) ( not ( = ?auto_425380 ?auto_425388 ) ) ( not ( = ?auto_425380 ?auto_425389 ) ) ( not ( = ?auto_425380 ?auto_425390 ) ) ( not ( = ?auto_425380 ?auto_425391 ) ) ( not ( = ?auto_425380 ?auto_425392 ) ) ( not ( = ?auto_425381 ?auto_425382 ) ) ( not ( = ?auto_425381 ?auto_425383 ) ) ( not ( = ?auto_425381 ?auto_425384 ) ) ( not ( = ?auto_425381 ?auto_425385 ) ) ( not ( = ?auto_425381 ?auto_425386 ) ) ( not ( = ?auto_425381 ?auto_425387 ) ) ( not ( = ?auto_425381 ?auto_425388 ) ) ( not ( = ?auto_425381 ?auto_425389 ) ) ( not ( = ?auto_425381 ?auto_425390 ) ) ( not ( = ?auto_425381 ?auto_425391 ) ) ( not ( = ?auto_425381 ?auto_425392 ) ) ( not ( = ?auto_425382 ?auto_425383 ) ) ( not ( = ?auto_425382 ?auto_425384 ) ) ( not ( = ?auto_425382 ?auto_425385 ) ) ( not ( = ?auto_425382 ?auto_425386 ) ) ( not ( = ?auto_425382 ?auto_425387 ) ) ( not ( = ?auto_425382 ?auto_425388 ) ) ( not ( = ?auto_425382 ?auto_425389 ) ) ( not ( = ?auto_425382 ?auto_425390 ) ) ( not ( = ?auto_425382 ?auto_425391 ) ) ( not ( = ?auto_425382 ?auto_425392 ) ) ( not ( = ?auto_425383 ?auto_425384 ) ) ( not ( = ?auto_425383 ?auto_425385 ) ) ( not ( = ?auto_425383 ?auto_425386 ) ) ( not ( = ?auto_425383 ?auto_425387 ) ) ( not ( = ?auto_425383 ?auto_425388 ) ) ( not ( = ?auto_425383 ?auto_425389 ) ) ( not ( = ?auto_425383 ?auto_425390 ) ) ( not ( = ?auto_425383 ?auto_425391 ) ) ( not ( = ?auto_425383 ?auto_425392 ) ) ( not ( = ?auto_425384 ?auto_425385 ) ) ( not ( = ?auto_425384 ?auto_425386 ) ) ( not ( = ?auto_425384 ?auto_425387 ) ) ( not ( = ?auto_425384 ?auto_425388 ) ) ( not ( = ?auto_425384 ?auto_425389 ) ) ( not ( = ?auto_425384 ?auto_425390 ) ) ( not ( = ?auto_425384 ?auto_425391 ) ) ( not ( = ?auto_425384 ?auto_425392 ) ) ( not ( = ?auto_425385 ?auto_425386 ) ) ( not ( = ?auto_425385 ?auto_425387 ) ) ( not ( = ?auto_425385 ?auto_425388 ) ) ( not ( = ?auto_425385 ?auto_425389 ) ) ( not ( = ?auto_425385 ?auto_425390 ) ) ( not ( = ?auto_425385 ?auto_425391 ) ) ( not ( = ?auto_425385 ?auto_425392 ) ) ( not ( = ?auto_425386 ?auto_425387 ) ) ( not ( = ?auto_425386 ?auto_425388 ) ) ( not ( = ?auto_425386 ?auto_425389 ) ) ( not ( = ?auto_425386 ?auto_425390 ) ) ( not ( = ?auto_425386 ?auto_425391 ) ) ( not ( = ?auto_425386 ?auto_425392 ) ) ( not ( = ?auto_425387 ?auto_425388 ) ) ( not ( = ?auto_425387 ?auto_425389 ) ) ( not ( = ?auto_425387 ?auto_425390 ) ) ( not ( = ?auto_425387 ?auto_425391 ) ) ( not ( = ?auto_425387 ?auto_425392 ) ) ( not ( = ?auto_425388 ?auto_425389 ) ) ( not ( = ?auto_425388 ?auto_425390 ) ) ( not ( = ?auto_425388 ?auto_425391 ) ) ( not ( = ?auto_425388 ?auto_425392 ) ) ( not ( = ?auto_425389 ?auto_425390 ) ) ( not ( = ?auto_425389 ?auto_425391 ) ) ( not ( = ?auto_425389 ?auto_425392 ) ) ( not ( = ?auto_425390 ?auto_425391 ) ) ( not ( = ?auto_425390 ?auto_425392 ) ) ( not ( = ?auto_425391 ?auto_425392 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_425391 ?auto_425392 )
      ( !STACK ?auto_425391 ?auto_425390 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_425405 - BLOCK
      ?auto_425406 - BLOCK
      ?auto_425407 - BLOCK
      ?auto_425408 - BLOCK
      ?auto_425409 - BLOCK
      ?auto_425410 - BLOCK
      ?auto_425411 - BLOCK
      ?auto_425412 - BLOCK
      ?auto_425413 - BLOCK
      ?auto_425414 - BLOCK
      ?auto_425415 - BLOCK
      ?auto_425416 - BLOCK
    )
    :vars
    (
      ?auto_425417 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_425415 ) ( ON ?auto_425416 ?auto_425417 ) ( CLEAR ?auto_425416 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_425405 ) ( ON ?auto_425406 ?auto_425405 ) ( ON ?auto_425407 ?auto_425406 ) ( ON ?auto_425408 ?auto_425407 ) ( ON ?auto_425409 ?auto_425408 ) ( ON ?auto_425410 ?auto_425409 ) ( ON ?auto_425411 ?auto_425410 ) ( ON ?auto_425412 ?auto_425411 ) ( ON ?auto_425413 ?auto_425412 ) ( ON ?auto_425414 ?auto_425413 ) ( ON ?auto_425415 ?auto_425414 ) ( not ( = ?auto_425405 ?auto_425406 ) ) ( not ( = ?auto_425405 ?auto_425407 ) ) ( not ( = ?auto_425405 ?auto_425408 ) ) ( not ( = ?auto_425405 ?auto_425409 ) ) ( not ( = ?auto_425405 ?auto_425410 ) ) ( not ( = ?auto_425405 ?auto_425411 ) ) ( not ( = ?auto_425405 ?auto_425412 ) ) ( not ( = ?auto_425405 ?auto_425413 ) ) ( not ( = ?auto_425405 ?auto_425414 ) ) ( not ( = ?auto_425405 ?auto_425415 ) ) ( not ( = ?auto_425405 ?auto_425416 ) ) ( not ( = ?auto_425405 ?auto_425417 ) ) ( not ( = ?auto_425406 ?auto_425407 ) ) ( not ( = ?auto_425406 ?auto_425408 ) ) ( not ( = ?auto_425406 ?auto_425409 ) ) ( not ( = ?auto_425406 ?auto_425410 ) ) ( not ( = ?auto_425406 ?auto_425411 ) ) ( not ( = ?auto_425406 ?auto_425412 ) ) ( not ( = ?auto_425406 ?auto_425413 ) ) ( not ( = ?auto_425406 ?auto_425414 ) ) ( not ( = ?auto_425406 ?auto_425415 ) ) ( not ( = ?auto_425406 ?auto_425416 ) ) ( not ( = ?auto_425406 ?auto_425417 ) ) ( not ( = ?auto_425407 ?auto_425408 ) ) ( not ( = ?auto_425407 ?auto_425409 ) ) ( not ( = ?auto_425407 ?auto_425410 ) ) ( not ( = ?auto_425407 ?auto_425411 ) ) ( not ( = ?auto_425407 ?auto_425412 ) ) ( not ( = ?auto_425407 ?auto_425413 ) ) ( not ( = ?auto_425407 ?auto_425414 ) ) ( not ( = ?auto_425407 ?auto_425415 ) ) ( not ( = ?auto_425407 ?auto_425416 ) ) ( not ( = ?auto_425407 ?auto_425417 ) ) ( not ( = ?auto_425408 ?auto_425409 ) ) ( not ( = ?auto_425408 ?auto_425410 ) ) ( not ( = ?auto_425408 ?auto_425411 ) ) ( not ( = ?auto_425408 ?auto_425412 ) ) ( not ( = ?auto_425408 ?auto_425413 ) ) ( not ( = ?auto_425408 ?auto_425414 ) ) ( not ( = ?auto_425408 ?auto_425415 ) ) ( not ( = ?auto_425408 ?auto_425416 ) ) ( not ( = ?auto_425408 ?auto_425417 ) ) ( not ( = ?auto_425409 ?auto_425410 ) ) ( not ( = ?auto_425409 ?auto_425411 ) ) ( not ( = ?auto_425409 ?auto_425412 ) ) ( not ( = ?auto_425409 ?auto_425413 ) ) ( not ( = ?auto_425409 ?auto_425414 ) ) ( not ( = ?auto_425409 ?auto_425415 ) ) ( not ( = ?auto_425409 ?auto_425416 ) ) ( not ( = ?auto_425409 ?auto_425417 ) ) ( not ( = ?auto_425410 ?auto_425411 ) ) ( not ( = ?auto_425410 ?auto_425412 ) ) ( not ( = ?auto_425410 ?auto_425413 ) ) ( not ( = ?auto_425410 ?auto_425414 ) ) ( not ( = ?auto_425410 ?auto_425415 ) ) ( not ( = ?auto_425410 ?auto_425416 ) ) ( not ( = ?auto_425410 ?auto_425417 ) ) ( not ( = ?auto_425411 ?auto_425412 ) ) ( not ( = ?auto_425411 ?auto_425413 ) ) ( not ( = ?auto_425411 ?auto_425414 ) ) ( not ( = ?auto_425411 ?auto_425415 ) ) ( not ( = ?auto_425411 ?auto_425416 ) ) ( not ( = ?auto_425411 ?auto_425417 ) ) ( not ( = ?auto_425412 ?auto_425413 ) ) ( not ( = ?auto_425412 ?auto_425414 ) ) ( not ( = ?auto_425412 ?auto_425415 ) ) ( not ( = ?auto_425412 ?auto_425416 ) ) ( not ( = ?auto_425412 ?auto_425417 ) ) ( not ( = ?auto_425413 ?auto_425414 ) ) ( not ( = ?auto_425413 ?auto_425415 ) ) ( not ( = ?auto_425413 ?auto_425416 ) ) ( not ( = ?auto_425413 ?auto_425417 ) ) ( not ( = ?auto_425414 ?auto_425415 ) ) ( not ( = ?auto_425414 ?auto_425416 ) ) ( not ( = ?auto_425414 ?auto_425417 ) ) ( not ( = ?auto_425415 ?auto_425416 ) ) ( not ( = ?auto_425415 ?auto_425417 ) ) ( not ( = ?auto_425416 ?auto_425417 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_425416 ?auto_425417 )
      ( !STACK ?auto_425416 ?auto_425415 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_425430 - BLOCK
      ?auto_425431 - BLOCK
      ?auto_425432 - BLOCK
      ?auto_425433 - BLOCK
      ?auto_425434 - BLOCK
      ?auto_425435 - BLOCK
      ?auto_425436 - BLOCK
      ?auto_425437 - BLOCK
      ?auto_425438 - BLOCK
      ?auto_425439 - BLOCK
      ?auto_425440 - BLOCK
      ?auto_425441 - BLOCK
    )
    :vars
    (
      ?auto_425442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425441 ?auto_425442 ) ( ON-TABLE ?auto_425430 ) ( ON ?auto_425431 ?auto_425430 ) ( ON ?auto_425432 ?auto_425431 ) ( ON ?auto_425433 ?auto_425432 ) ( ON ?auto_425434 ?auto_425433 ) ( ON ?auto_425435 ?auto_425434 ) ( ON ?auto_425436 ?auto_425435 ) ( ON ?auto_425437 ?auto_425436 ) ( ON ?auto_425438 ?auto_425437 ) ( ON ?auto_425439 ?auto_425438 ) ( not ( = ?auto_425430 ?auto_425431 ) ) ( not ( = ?auto_425430 ?auto_425432 ) ) ( not ( = ?auto_425430 ?auto_425433 ) ) ( not ( = ?auto_425430 ?auto_425434 ) ) ( not ( = ?auto_425430 ?auto_425435 ) ) ( not ( = ?auto_425430 ?auto_425436 ) ) ( not ( = ?auto_425430 ?auto_425437 ) ) ( not ( = ?auto_425430 ?auto_425438 ) ) ( not ( = ?auto_425430 ?auto_425439 ) ) ( not ( = ?auto_425430 ?auto_425440 ) ) ( not ( = ?auto_425430 ?auto_425441 ) ) ( not ( = ?auto_425430 ?auto_425442 ) ) ( not ( = ?auto_425431 ?auto_425432 ) ) ( not ( = ?auto_425431 ?auto_425433 ) ) ( not ( = ?auto_425431 ?auto_425434 ) ) ( not ( = ?auto_425431 ?auto_425435 ) ) ( not ( = ?auto_425431 ?auto_425436 ) ) ( not ( = ?auto_425431 ?auto_425437 ) ) ( not ( = ?auto_425431 ?auto_425438 ) ) ( not ( = ?auto_425431 ?auto_425439 ) ) ( not ( = ?auto_425431 ?auto_425440 ) ) ( not ( = ?auto_425431 ?auto_425441 ) ) ( not ( = ?auto_425431 ?auto_425442 ) ) ( not ( = ?auto_425432 ?auto_425433 ) ) ( not ( = ?auto_425432 ?auto_425434 ) ) ( not ( = ?auto_425432 ?auto_425435 ) ) ( not ( = ?auto_425432 ?auto_425436 ) ) ( not ( = ?auto_425432 ?auto_425437 ) ) ( not ( = ?auto_425432 ?auto_425438 ) ) ( not ( = ?auto_425432 ?auto_425439 ) ) ( not ( = ?auto_425432 ?auto_425440 ) ) ( not ( = ?auto_425432 ?auto_425441 ) ) ( not ( = ?auto_425432 ?auto_425442 ) ) ( not ( = ?auto_425433 ?auto_425434 ) ) ( not ( = ?auto_425433 ?auto_425435 ) ) ( not ( = ?auto_425433 ?auto_425436 ) ) ( not ( = ?auto_425433 ?auto_425437 ) ) ( not ( = ?auto_425433 ?auto_425438 ) ) ( not ( = ?auto_425433 ?auto_425439 ) ) ( not ( = ?auto_425433 ?auto_425440 ) ) ( not ( = ?auto_425433 ?auto_425441 ) ) ( not ( = ?auto_425433 ?auto_425442 ) ) ( not ( = ?auto_425434 ?auto_425435 ) ) ( not ( = ?auto_425434 ?auto_425436 ) ) ( not ( = ?auto_425434 ?auto_425437 ) ) ( not ( = ?auto_425434 ?auto_425438 ) ) ( not ( = ?auto_425434 ?auto_425439 ) ) ( not ( = ?auto_425434 ?auto_425440 ) ) ( not ( = ?auto_425434 ?auto_425441 ) ) ( not ( = ?auto_425434 ?auto_425442 ) ) ( not ( = ?auto_425435 ?auto_425436 ) ) ( not ( = ?auto_425435 ?auto_425437 ) ) ( not ( = ?auto_425435 ?auto_425438 ) ) ( not ( = ?auto_425435 ?auto_425439 ) ) ( not ( = ?auto_425435 ?auto_425440 ) ) ( not ( = ?auto_425435 ?auto_425441 ) ) ( not ( = ?auto_425435 ?auto_425442 ) ) ( not ( = ?auto_425436 ?auto_425437 ) ) ( not ( = ?auto_425436 ?auto_425438 ) ) ( not ( = ?auto_425436 ?auto_425439 ) ) ( not ( = ?auto_425436 ?auto_425440 ) ) ( not ( = ?auto_425436 ?auto_425441 ) ) ( not ( = ?auto_425436 ?auto_425442 ) ) ( not ( = ?auto_425437 ?auto_425438 ) ) ( not ( = ?auto_425437 ?auto_425439 ) ) ( not ( = ?auto_425437 ?auto_425440 ) ) ( not ( = ?auto_425437 ?auto_425441 ) ) ( not ( = ?auto_425437 ?auto_425442 ) ) ( not ( = ?auto_425438 ?auto_425439 ) ) ( not ( = ?auto_425438 ?auto_425440 ) ) ( not ( = ?auto_425438 ?auto_425441 ) ) ( not ( = ?auto_425438 ?auto_425442 ) ) ( not ( = ?auto_425439 ?auto_425440 ) ) ( not ( = ?auto_425439 ?auto_425441 ) ) ( not ( = ?auto_425439 ?auto_425442 ) ) ( not ( = ?auto_425440 ?auto_425441 ) ) ( not ( = ?auto_425440 ?auto_425442 ) ) ( not ( = ?auto_425441 ?auto_425442 ) ) ( CLEAR ?auto_425439 ) ( ON ?auto_425440 ?auto_425441 ) ( CLEAR ?auto_425440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_425430 ?auto_425431 ?auto_425432 ?auto_425433 ?auto_425434 ?auto_425435 ?auto_425436 ?auto_425437 ?auto_425438 ?auto_425439 ?auto_425440 )
      ( MAKE-12PILE ?auto_425430 ?auto_425431 ?auto_425432 ?auto_425433 ?auto_425434 ?auto_425435 ?auto_425436 ?auto_425437 ?auto_425438 ?auto_425439 ?auto_425440 ?auto_425441 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_425455 - BLOCK
      ?auto_425456 - BLOCK
      ?auto_425457 - BLOCK
      ?auto_425458 - BLOCK
      ?auto_425459 - BLOCK
      ?auto_425460 - BLOCK
      ?auto_425461 - BLOCK
      ?auto_425462 - BLOCK
      ?auto_425463 - BLOCK
      ?auto_425464 - BLOCK
      ?auto_425465 - BLOCK
      ?auto_425466 - BLOCK
    )
    :vars
    (
      ?auto_425467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425466 ?auto_425467 ) ( ON-TABLE ?auto_425455 ) ( ON ?auto_425456 ?auto_425455 ) ( ON ?auto_425457 ?auto_425456 ) ( ON ?auto_425458 ?auto_425457 ) ( ON ?auto_425459 ?auto_425458 ) ( ON ?auto_425460 ?auto_425459 ) ( ON ?auto_425461 ?auto_425460 ) ( ON ?auto_425462 ?auto_425461 ) ( ON ?auto_425463 ?auto_425462 ) ( ON ?auto_425464 ?auto_425463 ) ( not ( = ?auto_425455 ?auto_425456 ) ) ( not ( = ?auto_425455 ?auto_425457 ) ) ( not ( = ?auto_425455 ?auto_425458 ) ) ( not ( = ?auto_425455 ?auto_425459 ) ) ( not ( = ?auto_425455 ?auto_425460 ) ) ( not ( = ?auto_425455 ?auto_425461 ) ) ( not ( = ?auto_425455 ?auto_425462 ) ) ( not ( = ?auto_425455 ?auto_425463 ) ) ( not ( = ?auto_425455 ?auto_425464 ) ) ( not ( = ?auto_425455 ?auto_425465 ) ) ( not ( = ?auto_425455 ?auto_425466 ) ) ( not ( = ?auto_425455 ?auto_425467 ) ) ( not ( = ?auto_425456 ?auto_425457 ) ) ( not ( = ?auto_425456 ?auto_425458 ) ) ( not ( = ?auto_425456 ?auto_425459 ) ) ( not ( = ?auto_425456 ?auto_425460 ) ) ( not ( = ?auto_425456 ?auto_425461 ) ) ( not ( = ?auto_425456 ?auto_425462 ) ) ( not ( = ?auto_425456 ?auto_425463 ) ) ( not ( = ?auto_425456 ?auto_425464 ) ) ( not ( = ?auto_425456 ?auto_425465 ) ) ( not ( = ?auto_425456 ?auto_425466 ) ) ( not ( = ?auto_425456 ?auto_425467 ) ) ( not ( = ?auto_425457 ?auto_425458 ) ) ( not ( = ?auto_425457 ?auto_425459 ) ) ( not ( = ?auto_425457 ?auto_425460 ) ) ( not ( = ?auto_425457 ?auto_425461 ) ) ( not ( = ?auto_425457 ?auto_425462 ) ) ( not ( = ?auto_425457 ?auto_425463 ) ) ( not ( = ?auto_425457 ?auto_425464 ) ) ( not ( = ?auto_425457 ?auto_425465 ) ) ( not ( = ?auto_425457 ?auto_425466 ) ) ( not ( = ?auto_425457 ?auto_425467 ) ) ( not ( = ?auto_425458 ?auto_425459 ) ) ( not ( = ?auto_425458 ?auto_425460 ) ) ( not ( = ?auto_425458 ?auto_425461 ) ) ( not ( = ?auto_425458 ?auto_425462 ) ) ( not ( = ?auto_425458 ?auto_425463 ) ) ( not ( = ?auto_425458 ?auto_425464 ) ) ( not ( = ?auto_425458 ?auto_425465 ) ) ( not ( = ?auto_425458 ?auto_425466 ) ) ( not ( = ?auto_425458 ?auto_425467 ) ) ( not ( = ?auto_425459 ?auto_425460 ) ) ( not ( = ?auto_425459 ?auto_425461 ) ) ( not ( = ?auto_425459 ?auto_425462 ) ) ( not ( = ?auto_425459 ?auto_425463 ) ) ( not ( = ?auto_425459 ?auto_425464 ) ) ( not ( = ?auto_425459 ?auto_425465 ) ) ( not ( = ?auto_425459 ?auto_425466 ) ) ( not ( = ?auto_425459 ?auto_425467 ) ) ( not ( = ?auto_425460 ?auto_425461 ) ) ( not ( = ?auto_425460 ?auto_425462 ) ) ( not ( = ?auto_425460 ?auto_425463 ) ) ( not ( = ?auto_425460 ?auto_425464 ) ) ( not ( = ?auto_425460 ?auto_425465 ) ) ( not ( = ?auto_425460 ?auto_425466 ) ) ( not ( = ?auto_425460 ?auto_425467 ) ) ( not ( = ?auto_425461 ?auto_425462 ) ) ( not ( = ?auto_425461 ?auto_425463 ) ) ( not ( = ?auto_425461 ?auto_425464 ) ) ( not ( = ?auto_425461 ?auto_425465 ) ) ( not ( = ?auto_425461 ?auto_425466 ) ) ( not ( = ?auto_425461 ?auto_425467 ) ) ( not ( = ?auto_425462 ?auto_425463 ) ) ( not ( = ?auto_425462 ?auto_425464 ) ) ( not ( = ?auto_425462 ?auto_425465 ) ) ( not ( = ?auto_425462 ?auto_425466 ) ) ( not ( = ?auto_425462 ?auto_425467 ) ) ( not ( = ?auto_425463 ?auto_425464 ) ) ( not ( = ?auto_425463 ?auto_425465 ) ) ( not ( = ?auto_425463 ?auto_425466 ) ) ( not ( = ?auto_425463 ?auto_425467 ) ) ( not ( = ?auto_425464 ?auto_425465 ) ) ( not ( = ?auto_425464 ?auto_425466 ) ) ( not ( = ?auto_425464 ?auto_425467 ) ) ( not ( = ?auto_425465 ?auto_425466 ) ) ( not ( = ?auto_425465 ?auto_425467 ) ) ( not ( = ?auto_425466 ?auto_425467 ) ) ( CLEAR ?auto_425464 ) ( ON ?auto_425465 ?auto_425466 ) ( CLEAR ?auto_425465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_425455 ?auto_425456 ?auto_425457 ?auto_425458 ?auto_425459 ?auto_425460 ?auto_425461 ?auto_425462 ?auto_425463 ?auto_425464 ?auto_425465 )
      ( MAKE-12PILE ?auto_425455 ?auto_425456 ?auto_425457 ?auto_425458 ?auto_425459 ?auto_425460 ?auto_425461 ?auto_425462 ?auto_425463 ?auto_425464 ?auto_425465 ?auto_425466 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_425480 - BLOCK
      ?auto_425481 - BLOCK
      ?auto_425482 - BLOCK
      ?auto_425483 - BLOCK
      ?auto_425484 - BLOCK
      ?auto_425485 - BLOCK
      ?auto_425486 - BLOCK
      ?auto_425487 - BLOCK
      ?auto_425488 - BLOCK
      ?auto_425489 - BLOCK
      ?auto_425490 - BLOCK
      ?auto_425491 - BLOCK
    )
    :vars
    (
      ?auto_425492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425491 ?auto_425492 ) ( ON-TABLE ?auto_425480 ) ( ON ?auto_425481 ?auto_425480 ) ( ON ?auto_425482 ?auto_425481 ) ( ON ?auto_425483 ?auto_425482 ) ( ON ?auto_425484 ?auto_425483 ) ( ON ?auto_425485 ?auto_425484 ) ( ON ?auto_425486 ?auto_425485 ) ( ON ?auto_425487 ?auto_425486 ) ( ON ?auto_425488 ?auto_425487 ) ( not ( = ?auto_425480 ?auto_425481 ) ) ( not ( = ?auto_425480 ?auto_425482 ) ) ( not ( = ?auto_425480 ?auto_425483 ) ) ( not ( = ?auto_425480 ?auto_425484 ) ) ( not ( = ?auto_425480 ?auto_425485 ) ) ( not ( = ?auto_425480 ?auto_425486 ) ) ( not ( = ?auto_425480 ?auto_425487 ) ) ( not ( = ?auto_425480 ?auto_425488 ) ) ( not ( = ?auto_425480 ?auto_425489 ) ) ( not ( = ?auto_425480 ?auto_425490 ) ) ( not ( = ?auto_425480 ?auto_425491 ) ) ( not ( = ?auto_425480 ?auto_425492 ) ) ( not ( = ?auto_425481 ?auto_425482 ) ) ( not ( = ?auto_425481 ?auto_425483 ) ) ( not ( = ?auto_425481 ?auto_425484 ) ) ( not ( = ?auto_425481 ?auto_425485 ) ) ( not ( = ?auto_425481 ?auto_425486 ) ) ( not ( = ?auto_425481 ?auto_425487 ) ) ( not ( = ?auto_425481 ?auto_425488 ) ) ( not ( = ?auto_425481 ?auto_425489 ) ) ( not ( = ?auto_425481 ?auto_425490 ) ) ( not ( = ?auto_425481 ?auto_425491 ) ) ( not ( = ?auto_425481 ?auto_425492 ) ) ( not ( = ?auto_425482 ?auto_425483 ) ) ( not ( = ?auto_425482 ?auto_425484 ) ) ( not ( = ?auto_425482 ?auto_425485 ) ) ( not ( = ?auto_425482 ?auto_425486 ) ) ( not ( = ?auto_425482 ?auto_425487 ) ) ( not ( = ?auto_425482 ?auto_425488 ) ) ( not ( = ?auto_425482 ?auto_425489 ) ) ( not ( = ?auto_425482 ?auto_425490 ) ) ( not ( = ?auto_425482 ?auto_425491 ) ) ( not ( = ?auto_425482 ?auto_425492 ) ) ( not ( = ?auto_425483 ?auto_425484 ) ) ( not ( = ?auto_425483 ?auto_425485 ) ) ( not ( = ?auto_425483 ?auto_425486 ) ) ( not ( = ?auto_425483 ?auto_425487 ) ) ( not ( = ?auto_425483 ?auto_425488 ) ) ( not ( = ?auto_425483 ?auto_425489 ) ) ( not ( = ?auto_425483 ?auto_425490 ) ) ( not ( = ?auto_425483 ?auto_425491 ) ) ( not ( = ?auto_425483 ?auto_425492 ) ) ( not ( = ?auto_425484 ?auto_425485 ) ) ( not ( = ?auto_425484 ?auto_425486 ) ) ( not ( = ?auto_425484 ?auto_425487 ) ) ( not ( = ?auto_425484 ?auto_425488 ) ) ( not ( = ?auto_425484 ?auto_425489 ) ) ( not ( = ?auto_425484 ?auto_425490 ) ) ( not ( = ?auto_425484 ?auto_425491 ) ) ( not ( = ?auto_425484 ?auto_425492 ) ) ( not ( = ?auto_425485 ?auto_425486 ) ) ( not ( = ?auto_425485 ?auto_425487 ) ) ( not ( = ?auto_425485 ?auto_425488 ) ) ( not ( = ?auto_425485 ?auto_425489 ) ) ( not ( = ?auto_425485 ?auto_425490 ) ) ( not ( = ?auto_425485 ?auto_425491 ) ) ( not ( = ?auto_425485 ?auto_425492 ) ) ( not ( = ?auto_425486 ?auto_425487 ) ) ( not ( = ?auto_425486 ?auto_425488 ) ) ( not ( = ?auto_425486 ?auto_425489 ) ) ( not ( = ?auto_425486 ?auto_425490 ) ) ( not ( = ?auto_425486 ?auto_425491 ) ) ( not ( = ?auto_425486 ?auto_425492 ) ) ( not ( = ?auto_425487 ?auto_425488 ) ) ( not ( = ?auto_425487 ?auto_425489 ) ) ( not ( = ?auto_425487 ?auto_425490 ) ) ( not ( = ?auto_425487 ?auto_425491 ) ) ( not ( = ?auto_425487 ?auto_425492 ) ) ( not ( = ?auto_425488 ?auto_425489 ) ) ( not ( = ?auto_425488 ?auto_425490 ) ) ( not ( = ?auto_425488 ?auto_425491 ) ) ( not ( = ?auto_425488 ?auto_425492 ) ) ( not ( = ?auto_425489 ?auto_425490 ) ) ( not ( = ?auto_425489 ?auto_425491 ) ) ( not ( = ?auto_425489 ?auto_425492 ) ) ( not ( = ?auto_425490 ?auto_425491 ) ) ( not ( = ?auto_425490 ?auto_425492 ) ) ( not ( = ?auto_425491 ?auto_425492 ) ) ( ON ?auto_425490 ?auto_425491 ) ( CLEAR ?auto_425488 ) ( ON ?auto_425489 ?auto_425490 ) ( CLEAR ?auto_425489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_425480 ?auto_425481 ?auto_425482 ?auto_425483 ?auto_425484 ?auto_425485 ?auto_425486 ?auto_425487 ?auto_425488 ?auto_425489 )
      ( MAKE-12PILE ?auto_425480 ?auto_425481 ?auto_425482 ?auto_425483 ?auto_425484 ?auto_425485 ?auto_425486 ?auto_425487 ?auto_425488 ?auto_425489 ?auto_425490 ?auto_425491 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_425505 - BLOCK
      ?auto_425506 - BLOCK
      ?auto_425507 - BLOCK
      ?auto_425508 - BLOCK
      ?auto_425509 - BLOCK
      ?auto_425510 - BLOCK
      ?auto_425511 - BLOCK
      ?auto_425512 - BLOCK
      ?auto_425513 - BLOCK
      ?auto_425514 - BLOCK
      ?auto_425515 - BLOCK
      ?auto_425516 - BLOCK
    )
    :vars
    (
      ?auto_425517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425516 ?auto_425517 ) ( ON-TABLE ?auto_425505 ) ( ON ?auto_425506 ?auto_425505 ) ( ON ?auto_425507 ?auto_425506 ) ( ON ?auto_425508 ?auto_425507 ) ( ON ?auto_425509 ?auto_425508 ) ( ON ?auto_425510 ?auto_425509 ) ( ON ?auto_425511 ?auto_425510 ) ( ON ?auto_425512 ?auto_425511 ) ( ON ?auto_425513 ?auto_425512 ) ( not ( = ?auto_425505 ?auto_425506 ) ) ( not ( = ?auto_425505 ?auto_425507 ) ) ( not ( = ?auto_425505 ?auto_425508 ) ) ( not ( = ?auto_425505 ?auto_425509 ) ) ( not ( = ?auto_425505 ?auto_425510 ) ) ( not ( = ?auto_425505 ?auto_425511 ) ) ( not ( = ?auto_425505 ?auto_425512 ) ) ( not ( = ?auto_425505 ?auto_425513 ) ) ( not ( = ?auto_425505 ?auto_425514 ) ) ( not ( = ?auto_425505 ?auto_425515 ) ) ( not ( = ?auto_425505 ?auto_425516 ) ) ( not ( = ?auto_425505 ?auto_425517 ) ) ( not ( = ?auto_425506 ?auto_425507 ) ) ( not ( = ?auto_425506 ?auto_425508 ) ) ( not ( = ?auto_425506 ?auto_425509 ) ) ( not ( = ?auto_425506 ?auto_425510 ) ) ( not ( = ?auto_425506 ?auto_425511 ) ) ( not ( = ?auto_425506 ?auto_425512 ) ) ( not ( = ?auto_425506 ?auto_425513 ) ) ( not ( = ?auto_425506 ?auto_425514 ) ) ( not ( = ?auto_425506 ?auto_425515 ) ) ( not ( = ?auto_425506 ?auto_425516 ) ) ( not ( = ?auto_425506 ?auto_425517 ) ) ( not ( = ?auto_425507 ?auto_425508 ) ) ( not ( = ?auto_425507 ?auto_425509 ) ) ( not ( = ?auto_425507 ?auto_425510 ) ) ( not ( = ?auto_425507 ?auto_425511 ) ) ( not ( = ?auto_425507 ?auto_425512 ) ) ( not ( = ?auto_425507 ?auto_425513 ) ) ( not ( = ?auto_425507 ?auto_425514 ) ) ( not ( = ?auto_425507 ?auto_425515 ) ) ( not ( = ?auto_425507 ?auto_425516 ) ) ( not ( = ?auto_425507 ?auto_425517 ) ) ( not ( = ?auto_425508 ?auto_425509 ) ) ( not ( = ?auto_425508 ?auto_425510 ) ) ( not ( = ?auto_425508 ?auto_425511 ) ) ( not ( = ?auto_425508 ?auto_425512 ) ) ( not ( = ?auto_425508 ?auto_425513 ) ) ( not ( = ?auto_425508 ?auto_425514 ) ) ( not ( = ?auto_425508 ?auto_425515 ) ) ( not ( = ?auto_425508 ?auto_425516 ) ) ( not ( = ?auto_425508 ?auto_425517 ) ) ( not ( = ?auto_425509 ?auto_425510 ) ) ( not ( = ?auto_425509 ?auto_425511 ) ) ( not ( = ?auto_425509 ?auto_425512 ) ) ( not ( = ?auto_425509 ?auto_425513 ) ) ( not ( = ?auto_425509 ?auto_425514 ) ) ( not ( = ?auto_425509 ?auto_425515 ) ) ( not ( = ?auto_425509 ?auto_425516 ) ) ( not ( = ?auto_425509 ?auto_425517 ) ) ( not ( = ?auto_425510 ?auto_425511 ) ) ( not ( = ?auto_425510 ?auto_425512 ) ) ( not ( = ?auto_425510 ?auto_425513 ) ) ( not ( = ?auto_425510 ?auto_425514 ) ) ( not ( = ?auto_425510 ?auto_425515 ) ) ( not ( = ?auto_425510 ?auto_425516 ) ) ( not ( = ?auto_425510 ?auto_425517 ) ) ( not ( = ?auto_425511 ?auto_425512 ) ) ( not ( = ?auto_425511 ?auto_425513 ) ) ( not ( = ?auto_425511 ?auto_425514 ) ) ( not ( = ?auto_425511 ?auto_425515 ) ) ( not ( = ?auto_425511 ?auto_425516 ) ) ( not ( = ?auto_425511 ?auto_425517 ) ) ( not ( = ?auto_425512 ?auto_425513 ) ) ( not ( = ?auto_425512 ?auto_425514 ) ) ( not ( = ?auto_425512 ?auto_425515 ) ) ( not ( = ?auto_425512 ?auto_425516 ) ) ( not ( = ?auto_425512 ?auto_425517 ) ) ( not ( = ?auto_425513 ?auto_425514 ) ) ( not ( = ?auto_425513 ?auto_425515 ) ) ( not ( = ?auto_425513 ?auto_425516 ) ) ( not ( = ?auto_425513 ?auto_425517 ) ) ( not ( = ?auto_425514 ?auto_425515 ) ) ( not ( = ?auto_425514 ?auto_425516 ) ) ( not ( = ?auto_425514 ?auto_425517 ) ) ( not ( = ?auto_425515 ?auto_425516 ) ) ( not ( = ?auto_425515 ?auto_425517 ) ) ( not ( = ?auto_425516 ?auto_425517 ) ) ( ON ?auto_425515 ?auto_425516 ) ( CLEAR ?auto_425513 ) ( ON ?auto_425514 ?auto_425515 ) ( CLEAR ?auto_425514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_425505 ?auto_425506 ?auto_425507 ?auto_425508 ?auto_425509 ?auto_425510 ?auto_425511 ?auto_425512 ?auto_425513 ?auto_425514 )
      ( MAKE-12PILE ?auto_425505 ?auto_425506 ?auto_425507 ?auto_425508 ?auto_425509 ?auto_425510 ?auto_425511 ?auto_425512 ?auto_425513 ?auto_425514 ?auto_425515 ?auto_425516 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_425530 - BLOCK
      ?auto_425531 - BLOCK
      ?auto_425532 - BLOCK
      ?auto_425533 - BLOCK
      ?auto_425534 - BLOCK
      ?auto_425535 - BLOCK
      ?auto_425536 - BLOCK
      ?auto_425537 - BLOCK
      ?auto_425538 - BLOCK
      ?auto_425539 - BLOCK
      ?auto_425540 - BLOCK
      ?auto_425541 - BLOCK
    )
    :vars
    (
      ?auto_425542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425541 ?auto_425542 ) ( ON-TABLE ?auto_425530 ) ( ON ?auto_425531 ?auto_425530 ) ( ON ?auto_425532 ?auto_425531 ) ( ON ?auto_425533 ?auto_425532 ) ( ON ?auto_425534 ?auto_425533 ) ( ON ?auto_425535 ?auto_425534 ) ( ON ?auto_425536 ?auto_425535 ) ( ON ?auto_425537 ?auto_425536 ) ( not ( = ?auto_425530 ?auto_425531 ) ) ( not ( = ?auto_425530 ?auto_425532 ) ) ( not ( = ?auto_425530 ?auto_425533 ) ) ( not ( = ?auto_425530 ?auto_425534 ) ) ( not ( = ?auto_425530 ?auto_425535 ) ) ( not ( = ?auto_425530 ?auto_425536 ) ) ( not ( = ?auto_425530 ?auto_425537 ) ) ( not ( = ?auto_425530 ?auto_425538 ) ) ( not ( = ?auto_425530 ?auto_425539 ) ) ( not ( = ?auto_425530 ?auto_425540 ) ) ( not ( = ?auto_425530 ?auto_425541 ) ) ( not ( = ?auto_425530 ?auto_425542 ) ) ( not ( = ?auto_425531 ?auto_425532 ) ) ( not ( = ?auto_425531 ?auto_425533 ) ) ( not ( = ?auto_425531 ?auto_425534 ) ) ( not ( = ?auto_425531 ?auto_425535 ) ) ( not ( = ?auto_425531 ?auto_425536 ) ) ( not ( = ?auto_425531 ?auto_425537 ) ) ( not ( = ?auto_425531 ?auto_425538 ) ) ( not ( = ?auto_425531 ?auto_425539 ) ) ( not ( = ?auto_425531 ?auto_425540 ) ) ( not ( = ?auto_425531 ?auto_425541 ) ) ( not ( = ?auto_425531 ?auto_425542 ) ) ( not ( = ?auto_425532 ?auto_425533 ) ) ( not ( = ?auto_425532 ?auto_425534 ) ) ( not ( = ?auto_425532 ?auto_425535 ) ) ( not ( = ?auto_425532 ?auto_425536 ) ) ( not ( = ?auto_425532 ?auto_425537 ) ) ( not ( = ?auto_425532 ?auto_425538 ) ) ( not ( = ?auto_425532 ?auto_425539 ) ) ( not ( = ?auto_425532 ?auto_425540 ) ) ( not ( = ?auto_425532 ?auto_425541 ) ) ( not ( = ?auto_425532 ?auto_425542 ) ) ( not ( = ?auto_425533 ?auto_425534 ) ) ( not ( = ?auto_425533 ?auto_425535 ) ) ( not ( = ?auto_425533 ?auto_425536 ) ) ( not ( = ?auto_425533 ?auto_425537 ) ) ( not ( = ?auto_425533 ?auto_425538 ) ) ( not ( = ?auto_425533 ?auto_425539 ) ) ( not ( = ?auto_425533 ?auto_425540 ) ) ( not ( = ?auto_425533 ?auto_425541 ) ) ( not ( = ?auto_425533 ?auto_425542 ) ) ( not ( = ?auto_425534 ?auto_425535 ) ) ( not ( = ?auto_425534 ?auto_425536 ) ) ( not ( = ?auto_425534 ?auto_425537 ) ) ( not ( = ?auto_425534 ?auto_425538 ) ) ( not ( = ?auto_425534 ?auto_425539 ) ) ( not ( = ?auto_425534 ?auto_425540 ) ) ( not ( = ?auto_425534 ?auto_425541 ) ) ( not ( = ?auto_425534 ?auto_425542 ) ) ( not ( = ?auto_425535 ?auto_425536 ) ) ( not ( = ?auto_425535 ?auto_425537 ) ) ( not ( = ?auto_425535 ?auto_425538 ) ) ( not ( = ?auto_425535 ?auto_425539 ) ) ( not ( = ?auto_425535 ?auto_425540 ) ) ( not ( = ?auto_425535 ?auto_425541 ) ) ( not ( = ?auto_425535 ?auto_425542 ) ) ( not ( = ?auto_425536 ?auto_425537 ) ) ( not ( = ?auto_425536 ?auto_425538 ) ) ( not ( = ?auto_425536 ?auto_425539 ) ) ( not ( = ?auto_425536 ?auto_425540 ) ) ( not ( = ?auto_425536 ?auto_425541 ) ) ( not ( = ?auto_425536 ?auto_425542 ) ) ( not ( = ?auto_425537 ?auto_425538 ) ) ( not ( = ?auto_425537 ?auto_425539 ) ) ( not ( = ?auto_425537 ?auto_425540 ) ) ( not ( = ?auto_425537 ?auto_425541 ) ) ( not ( = ?auto_425537 ?auto_425542 ) ) ( not ( = ?auto_425538 ?auto_425539 ) ) ( not ( = ?auto_425538 ?auto_425540 ) ) ( not ( = ?auto_425538 ?auto_425541 ) ) ( not ( = ?auto_425538 ?auto_425542 ) ) ( not ( = ?auto_425539 ?auto_425540 ) ) ( not ( = ?auto_425539 ?auto_425541 ) ) ( not ( = ?auto_425539 ?auto_425542 ) ) ( not ( = ?auto_425540 ?auto_425541 ) ) ( not ( = ?auto_425540 ?auto_425542 ) ) ( not ( = ?auto_425541 ?auto_425542 ) ) ( ON ?auto_425540 ?auto_425541 ) ( ON ?auto_425539 ?auto_425540 ) ( CLEAR ?auto_425537 ) ( ON ?auto_425538 ?auto_425539 ) ( CLEAR ?auto_425538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_425530 ?auto_425531 ?auto_425532 ?auto_425533 ?auto_425534 ?auto_425535 ?auto_425536 ?auto_425537 ?auto_425538 )
      ( MAKE-12PILE ?auto_425530 ?auto_425531 ?auto_425532 ?auto_425533 ?auto_425534 ?auto_425535 ?auto_425536 ?auto_425537 ?auto_425538 ?auto_425539 ?auto_425540 ?auto_425541 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_425555 - BLOCK
      ?auto_425556 - BLOCK
      ?auto_425557 - BLOCK
      ?auto_425558 - BLOCK
      ?auto_425559 - BLOCK
      ?auto_425560 - BLOCK
      ?auto_425561 - BLOCK
      ?auto_425562 - BLOCK
      ?auto_425563 - BLOCK
      ?auto_425564 - BLOCK
      ?auto_425565 - BLOCK
      ?auto_425566 - BLOCK
    )
    :vars
    (
      ?auto_425567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425566 ?auto_425567 ) ( ON-TABLE ?auto_425555 ) ( ON ?auto_425556 ?auto_425555 ) ( ON ?auto_425557 ?auto_425556 ) ( ON ?auto_425558 ?auto_425557 ) ( ON ?auto_425559 ?auto_425558 ) ( ON ?auto_425560 ?auto_425559 ) ( ON ?auto_425561 ?auto_425560 ) ( ON ?auto_425562 ?auto_425561 ) ( not ( = ?auto_425555 ?auto_425556 ) ) ( not ( = ?auto_425555 ?auto_425557 ) ) ( not ( = ?auto_425555 ?auto_425558 ) ) ( not ( = ?auto_425555 ?auto_425559 ) ) ( not ( = ?auto_425555 ?auto_425560 ) ) ( not ( = ?auto_425555 ?auto_425561 ) ) ( not ( = ?auto_425555 ?auto_425562 ) ) ( not ( = ?auto_425555 ?auto_425563 ) ) ( not ( = ?auto_425555 ?auto_425564 ) ) ( not ( = ?auto_425555 ?auto_425565 ) ) ( not ( = ?auto_425555 ?auto_425566 ) ) ( not ( = ?auto_425555 ?auto_425567 ) ) ( not ( = ?auto_425556 ?auto_425557 ) ) ( not ( = ?auto_425556 ?auto_425558 ) ) ( not ( = ?auto_425556 ?auto_425559 ) ) ( not ( = ?auto_425556 ?auto_425560 ) ) ( not ( = ?auto_425556 ?auto_425561 ) ) ( not ( = ?auto_425556 ?auto_425562 ) ) ( not ( = ?auto_425556 ?auto_425563 ) ) ( not ( = ?auto_425556 ?auto_425564 ) ) ( not ( = ?auto_425556 ?auto_425565 ) ) ( not ( = ?auto_425556 ?auto_425566 ) ) ( not ( = ?auto_425556 ?auto_425567 ) ) ( not ( = ?auto_425557 ?auto_425558 ) ) ( not ( = ?auto_425557 ?auto_425559 ) ) ( not ( = ?auto_425557 ?auto_425560 ) ) ( not ( = ?auto_425557 ?auto_425561 ) ) ( not ( = ?auto_425557 ?auto_425562 ) ) ( not ( = ?auto_425557 ?auto_425563 ) ) ( not ( = ?auto_425557 ?auto_425564 ) ) ( not ( = ?auto_425557 ?auto_425565 ) ) ( not ( = ?auto_425557 ?auto_425566 ) ) ( not ( = ?auto_425557 ?auto_425567 ) ) ( not ( = ?auto_425558 ?auto_425559 ) ) ( not ( = ?auto_425558 ?auto_425560 ) ) ( not ( = ?auto_425558 ?auto_425561 ) ) ( not ( = ?auto_425558 ?auto_425562 ) ) ( not ( = ?auto_425558 ?auto_425563 ) ) ( not ( = ?auto_425558 ?auto_425564 ) ) ( not ( = ?auto_425558 ?auto_425565 ) ) ( not ( = ?auto_425558 ?auto_425566 ) ) ( not ( = ?auto_425558 ?auto_425567 ) ) ( not ( = ?auto_425559 ?auto_425560 ) ) ( not ( = ?auto_425559 ?auto_425561 ) ) ( not ( = ?auto_425559 ?auto_425562 ) ) ( not ( = ?auto_425559 ?auto_425563 ) ) ( not ( = ?auto_425559 ?auto_425564 ) ) ( not ( = ?auto_425559 ?auto_425565 ) ) ( not ( = ?auto_425559 ?auto_425566 ) ) ( not ( = ?auto_425559 ?auto_425567 ) ) ( not ( = ?auto_425560 ?auto_425561 ) ) ( not ( = ?auto_425560 ?auto_425562 ) ) ( not ( = ?auto_425560 ?auto_425563 ) ) ( not ( = ?auto_425560 ?auto_425564 ) ) ( not ( = ?auto_425560 ?auto_425565 ) ) ( not ( = ?auto_425560 ?auto_425566 ) ) ( not ( = ?auto_425560 ?auto_425567 ) ) ( not ( = ?auto_425561 ?auto_425562 ) ) ( not ( = ?auto_425561 ?auto_425563 ) ) ( not ( = ?auto_425561 ?auto_425564 ) ) ( not ( = ?auto_425561 ?auto_425565 ) ) ( not ( = ?auto_425561 ?auto_425566 ) ) ( not ( = ?auto_425561 ?auto_425567 ) ) ( not ( = ?auto_425562 ?auto_425563 ) ) ( not ( = ?auto_425562 ?auto_425564 ) ) ( not ( = ?auto_425562 ?auto_425565 ) ) ( not ( = ?auto_425562 ?auto_425566 ) ) ( not ( = ?auto_425562 ?auto_425567 ) ) ( not ( = ?auto_425563 ?auto_425564 ) ) ( not ( = ?auto_425563 ?auto_425565 ) ) ( not ( = ?auto_425563 ?auto_425566 ) ) ( not ( = ?auto_425563 ?auto_425567 ) ) ( not ( = ?auto_425564 ?auto_425565 ) ) ( not ( = ?auto_425564 ?auto_425566 ) ) ( not ( = ?auto_425564 ?auto_425567 ) ) ( not ( = ?auto_425565 ?auto_425566 ) ) ( not ( = ?auto_425565 ?auto_425567 ) ) ( not ( = ?auto_425566 ?auto_425567 ) ) ( ON ?auto_425565 ?auto_425566 ) ( ON ?auto_425564 ?auto_425565 ) ( CLEAR ?auto_425562 ) ( ON ?auto_425563 ?auto_425564 ) ( CLEAR ?auto_425563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_425555 ?auto_425556 ?auto_425557 ?auto_425558 ?auto_425559 ?auto_425560 ?auto_425561 ?auto_425562 ?auto_425563 )
      ( MAKE-12PILE ?auto_425555 ?auto_425556 ?auto_425557 ?auto_425558 ?auto_425559 ?auto_425560 ?auto_425561 ?auto_425562 ?auto_425563 ?auto_425564 ?auto_425565 ?auto_425566 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_425580 - BLOCK
      ?auto_425581 - BLOCK
      ?auto_425582 - BLOCK
      ?auto_425583 - BLOCK
      ?auto_425584 - BLOCK
      ?auto_425585 - BLOCK
      ?auto_425586 - BLOCK
      ?auto_425587 - BLOCK
      ?auto_425588 - BLOCK
      ?auto_425589 - BLOCK
      ?auto_425590 - BLOCK
      ?auto_425591 - BLOCK
    )
    :vars
    (
      ?auto_425592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425591 ?auto_425592 ) ( ON-TABLE ?auto_425580 ) ( ON ?auto_425581 ?auto_425580 ) ( ON ?auto_425582 ?auto_425581 ) ( ON ?auto_425583 ?auto_425582 ) ( ON ?auto_425584 ?auto_425583 ) ( ON ?auto_425585 ?auto_425584 ) ( ON ?auto_425586 ?auto_425585 ) ( not ( = ?auto_425580 ?auto_425581 ) ) ( not ( = ?auto_425580 ?auto_425582 ) ) ( not ( = ?auto_425580 ?auto_425583 ) ) ( not ( = ?auto_425580 ?auto_425584 ) ) ( not ( = ?auto_425580 ?auto_425585 ) ) ( not ( = ?auto_425580 ?auto_425586 ) ) ( not ( = ?auto_425580 ?auto_425587 ) ) ( not ( = ?auto_425580 ?auto_425588 ) ) ( not ( = ?auto_425580 ?auto_425589 ) ) ( not ( = ?auto_425580 ?auto_425590 ) ) ( not ( = ?auto_425580 ?auto_425591 ) ) ( not ( = ?auto_425580 ?auto_425592 ) ) ( not ( = ?auto_425581 ?auto_425582 ) ) ( not ( = ?auto_425581 ?auto_425583 ) ) ( not ( = ?auto_425581 ?auto_425584 ) ) ( not ( = ?auto_425581 ?auto_425585 ) ) ( not ( = ?auto_425581 ?auto_425586 ) ) ( not ( = ?auto_425581 ?auto_425587 ) ) ( not ( = ?auto_425581 ?auto_425588 ) ) ( not ( = ?auto_425581 ?auto_425589 ) ) ( not ( = ?auto_425581 ?auto_425590 ) ) ( not ( = ?auto_425581 ?auto_425591 ) ) ( not ( = ?auto_425581 ?auto_425592 ) ) ( not ( = ?auto_425582 ?auto_425583 ) ) ( not ( = ?auto_425582 ?auto_425584 ) ) ( not ( = ?auto_425582 ?auto_425585 ) ) ( not ( = ?auto_425582 ?auto_425586 ) ) ( not ( = ?auto_425582 ?auto_425587 ) ) ( not ( = ?auto_425582 ?auto_425588 ) ) ( not ( = ?auto_425582 ?auto_425589 ) ) ( not ( = ?auto_425582 ?auto_425590 ) ) ( not ( = ?auto_425582 ?auto_425591 ) ) ( not ( = ?auto_425582 ?auto_425592 ) ) ( not ( = ?auto_425583 ?auto_425584 ) ) ( not ( = ?auto_425583 ?auto_425585 ) ) ( not ( = ?auto_425583 ?auto_425586 ) ) ( not ( = ?auto_425583 ?auto_425587 ) ) ( not ( = ?auto_425583 ?auto_425588 ) ) ( not ( = ?auto_425583 ?auto_425589 ) ) ( not ( = ?auto_425583 ?auto_425590 ) ) ( not ( = ?auto_425583 ?auto_425591 ) ) ( not ( = ?auto_425583 ?auto_425592 ) ) ( not ( = ?auto_425584 ?auto_425585 ) ) ( not ( = ?auto_425584 ?auto_425586 ) ) ( not ( = ?auto_425584 ?auto_425587 ) ) ( not ( = ?auto_425584 ?auto_425588 ) ) ( not ( = ?auto_425584 ?auto_425589 ) ) ( not ( = ?auto_425584 ?auto_425590 ) ) ( not ( = ?auto_425584 ?auto_425591 ) ) ( not ( = ?auto_425584 ?auto_425592 ) ) ( not ( = ?auto_425585 ?auto_425586 ) ) ( not ( = ?auto_425585 ?auto_425587 ) ) ( not ( = ?auto_425585 ?auto_425588 ) ) ( not ( = ?auto_425585 ?auto_425589 ) ) ( not ( = ?auto_425585 ?auto_425590 ) ) ( not ( = ?auto_425585 ?auto_425591 ) ) ( not ( = ?auto_425585 ?auto_425592 ) ) ( not ( = ?auto_425586 ?auto_425587 ) ) ( not ( = ?auto_425586 ?auto_425588 ) ) ( not ( = ?auto_425586 ?auto_425589 ) ) ( not ( = ?auto_425586 ?auto_425590 ) ) ( not ( = ?auto_425586 ?auto_425591 ) ) ( not ( = ?auto_425586 ?auto_425592 ) ) ( not ( = ?auto_425587 ?auto_425588 ) ) ( not ( = ?auto_425587 ?auto_425589 ) ) ( not ( = ?auto_425587 ?auto_425590 ) ) ( not ( = ?auto_425587 ?auto_425591 ) ) ( not ( = ?auto_425587 ?auto_425592 ) ) ( not ( = ?auto_425588 ?auto_425589 ) ) ( not ( = ?auto_425588 ?auto_425590 ) ) ( not ( = ?auto_425588 ?auto_425591 ) ) ( not ( = ?auto_425588 ?auto_425592 ) ) ( not ( = ?auto_425589 ?auto_425590 ) ) ( not ( = ?auto_425589 ?auto_425591 ) ) ( not ( = ?auto_425589 ?auto_425592 ) ) ( not ( = ?auto_425590 ?auto_425591 ) ) ( not ( = ?auto_425590 ?auto_425592 ) ) ( not ( = ?auto_425591 ?auto_425592 ) ) ( ON ?auto_425590 ?auto_425591 ) ( ON ?auto_425589 ?auto_425590 ) ( ON ?auto_425588 ?auto_425589 ) ( CLEAR ?auto_425586 ) ( ON ?auto_425587 ?auto_425588 ) ( CLEAR ?auto_425587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_425580 ?auto_425581 ?auto_425582 ?auto_425583 ?auto_425584 ?auto_425585 ?auto_425586 ?auto_425587 )
      ( MAKE-12PILE ?auto_425580 ?auto_425581 ?auto_425582 ?auto_425583 ?auto_425584 ?auto_425585 ?auto_425586 ?auto_425587 ?auto_425588 ?auto_425589 ?auto_425590 ?auto_425591 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_425605 - BLOCK
      ?auto_425606 - BLOCK
      ?auto_425607 - BLOCK
      ?auto_425608 - BLOCK
      ?auto_425609 - BLOCK
      ?auto_425610 - BLOCK
      ?auto_425611 - BLOCK
      ?auto_425612 - BLOCK
      ?auto_425613 - BLOCK
      ?auto_425614 - BLOCK
      ?auto_425615 - BLOCK
      ?auto_425616 - BLOCK
    )
    :vars
    (
      ?auto_425617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425616 ?auto_425617 ) ( ON-TABLE ?auto_425605 ) ( ON ?auto_425606 ?auto_425605 ) ( ON ?auto_425607 ?auto_425606 ) ( ON ?auto_425608 ?auto_425607 ) ( ON ?auto_425609 ?auto_425608 ) ( ON ?auto_425610 ?auto_425609 ) ( ON ?auto_425611 ?auto_425610 ) ( not ( = ?auto_425605 ?auto_425606 ) ) ( not ( = ?auto_425605 ?auto_425607 ) ) ( not ( = ?auto_425605 ?auto_425608 ) ) ( not ( = ?auto_425605 ?auto_425609 ) ) ( not ( = ?auto_425605 ?auto_425610 ) ) ( not ( = ?auto_425605 ?auto_425611 ) ) ( not ( = ?auto_425605 ?auto_425612 ) ) ( not ( = ?auto_425605 ?auto_425613 ) ) ( not ( = ?auto_425605 ?auto_425614 ) ) ( not ( = ?auto_425605 ?auto_425615 ) ) ( not ( = ?auto_425605 ?auto_425616 ) ) ( not ( = ?auto_425605 ?auto_425617 ) ) ( not ( = ?auto_425606 ?auto_425607 ) ) ( not ( = ?auto_425606 ?auto_425608 ) ) ( not ( = ?auto_425606 ?auto_425609 ) ) ( not ( = ?auto_425606 ?auto_425610 ) ) ( not ( = ?auto_425606 ?auto_425611 ) ) ( not ( = ?auto_425606 ?auto_425612 ) ) ( not ( = ?auto_425606 ?auto_425613 ) ) ( not ( = ?auto_425606 ?auto_425614 ) ) ( not ( = ?auto_425606 ?auto_425615 ) ) ( not ( = ?auto_425606 ?auto_425616 ) ) ( not ( = ?auto_425606 ?auto_425617 ) ) ( not ( = ?auto_425607 ?auto_425608 ) ) ( not ( = ?auto_425607 ?auto_425609 ) ) ( not ( = ?auto_425607 ?auto_425610 ) ) ( not ( = ?auto_425607 ?auto_425611 ) ) ( not ( = ?auto_425607 ?auto_425612 ) ) ( not ( = ?auto_425607 ?auto_425613 ) ) ( not ( = ?auto_425607 ?auto_425614 ) ) ( not ( = ?auto_425607 ?auto_425615 ) ) ( not ( = ?auto_425607 ?auto_425616 ) ) ( not ( = ?auto_425607 ?auto_425617 ) ) ( not ( = ?auto_425608 ?auto_425609 ) ) ( not ( = ?auto_425608 ?auto_425610 ) ) ( not ( = ?auto_425608 ?auto_425611 ) ) ( not ( = ?auto_425608 ?auto_425612 ) ) ( not ( = ?auto_425608 ?auto_425613 ) ) ( not ( = ?auto_425608 ?auto_425614 ) ) ( not ( = ?auto_425608 ?auto_425615 ) ) ( not ( = ?auto_425608 ?auto_425616 ) ) ( not ( = ?auto_425608 ?auto_425617 ) ) ( not ( = ?auto_425609 ?auto_425610 ) ) ( not ( = ?auto_425609 ?auto_425611 ) ) ( not ( = ?auto_425609 ?auto_425612 ) ) ( not ( = ?auto_425609 ?auto_425613 ) ) ( not ( = ?auto_425609 ?auto_425614 ) ) ( not ( = ?auto_425609 ?auto_425615 ) ) ( not ( = ?auto_425609 ?auto_425616 ) ) ( not ( = ?auto_425609 ?auto_425617 ) ) ( not ( = ?auto_425610 ?auto_425611 ) ) ( not ( = ?auto_425610 ?auto_425612 ) ) ( not ( = ?auto_425610 ?auto_425613 ) ) ( not ( = ?auto_425610 ?auto_425614 ) ) ( not ( = ?auto_425610 ?auto_425615 ) ) ( not ( = ?auto_425610 ?auto_425616 ) ) ( not ( = ?auto_425610 ?auto_425617 ) ) ( not ( = ?auto_425611 ?auto_425612 ) ) ( not ( = ?auto_425611 ?auto_425613 ) ) ( not ( = ?auto_425611 ?auto_425614 ) ) ( not ( = ?auto_425611 ?auto_425615 ) ) ( not ( = ?auto_425611 ?auto_425616 ) ) ( not ( = ?auto_425611 ?auto_425617 ) ) ( not ( = ?auto_425612 ?auto_425613 ) ) ( not ( = ?auto_425612 ?auto_425614 ) ) ( not ( = ?auto_425612 ?auto_425615 ) ) ( not ( = ?auto_425612 ?auto_425616 ) ) ( not ( = ?auto_425612 ?auto_425617 ) ) ( not ( = ?auto_425613 ?auto_425614 ) ) ( not ( = ?auto_425613 ?auto_425615 ) ) ( not ( = ?auto_425613 ?auto_425616 ) ) ( not ( = ?auto_425613 ?auto_425617 ) ) ( not ( = ?auto_425614 ?auto_425615 ) ) ( not ( = ?auto_425614 ?auto_425616 ) ) ( not ( = ?auto_425614 ?auto_425617 ) ) ( not ( = ?auto_425615 ?auto_425616 ) ) ( not ( = ?auto_425615 ?auto_425617 ) ) ( not ( = ?auto_425616 ?auto_425617 ) ) ( ON ?auto_425615 ?auto_425616 ) ( ON ?auto_425614 ?auto_425615 ) ( ON ?auto_425613 ?auto_425614 ) ( CLEAR ?auto_425611 ) ( ON ?auto_425612 ?auto_425613 ) ( CLEAR ?auto_425612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_425605 ?auto_425606 ?auto_425607 ?auto_425608 ?auto_425609 ?auto_425610 ?auto_425611 ?auto_425612 )
      ( MAKE-12PILE ?auto_425605 ?auto_425606 ?auto_425607 ?auto_425608 ?auto_425609 ?auto_425610 ?auto_425611 ?auto_425612 ?auto_425613 ?auto_425614 ?auto_425615 ?auto_425616 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_425630 - BLOCK
      ?auto_425631 - BLOCK
      ?auto_425632 - BLOCK
      ?auto_425633 - BLOCK
      ?auto_425634 - BLOCK
      ?auto_425635 - BLOCK
      ?auto_425636 - BLOCK
      ?auto_425637 - BLOCK
      ?auto_425638 - BLOCK
      ?auto_425639 - BLOCK
      ?auto_425640 - BLOCK
      ?auto_425641 - BLOCK
    )
    :vars
    (
      ?auto_425642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425641 ?auto_425642 ) ( ON-TABLE ?auto_425630 ) ( ON ?auto_425631 ?auto_425630 ) ( ON ?auto_425632 ?auto_425631 ) ( ON ?auto_425633 ?auto_425632 ) ( ON ?auto_425634 ?auto_425633 ) ( ON ?auto_425635 ?auto_425634 ) ( not ( = ?auto_425630 ?auto_425631 ) ) ( not ( = ?auto_425630 ?auto_425632 ) ) ( not ( = ?auto_425630 ?auto_425633 ) ) ( not ( = ?auto_425630 ?auto_425634 ) ) ( not ( = ?auto_425630 ?auto_425635 ) ) ( not ( = ?auto_425630 ?auto_425636 ) ) ( not ( = ?auto_425630 ?auto_425637 ) ) ( not ( = ?auto_425630 ?auto_425638 ) ) ( not ( = ?auto_425630 ?auto_425639 ) ) ( not ( = ?auto_425630 ?auto_425640 ) ) ( not ( = ?auto_425630 ?auto_425641 ) ) ( not ( = ?auto_425630 ?auto_425642 ) ) ( not ( = ?auto_425631 ?auto_425632 ) ) ( not ( = ?auto_425631 ?auto_425633 ) ) ( not ( = ?auto_425631 ?auto_425634 ) ) ( not ( = ?auto_425631 ?auto_425635 ) ) ( not ( = ?auto_425631 ?auto_425636 ) ) ( not ( = ?auto_425631 ?auto_425637 ) ) ( not ( = ?auto_425631 ?auto_425638 ) ) ( not ( = ?auto_425631 ?auto_425639 ) ) ( not ( = ?auto_425631 ?auto_425640 ) ) ( not ( = ?auto_425631 ?auto_425641 ) ) ( not ( = ?auto_425631 ?auto_425642 ) ) ( not ( = ?auto_425632 ?auto_425633 ) ) ( not ( = ?auto_425632 ?auto_425634 ) ) ( not ( = ?auto_425632 ?auto_425635 ) ) ( not ( = ?auto_425632 ?auto_425636 ) ) ( not ( = ?auto_425632 ?auto_425637 ) ) ( not ( = ?auto_425632 ?auto_425638 ) ) ( not ( = ?auto_425632 ?auto_425639 ) ) ( not ( = ?auto_425632 ?auto_425640 ) ) ( not ( = ?auto_425632 ?auto_425641 ) ) ( not ( = ?auto_425632 ?auto_425642 ) ) ( not ( = ?auto_425633 ?auto_425634 ) ) ( not ( = ?auto_425633 ?auto_425635 ) ) ( not ( = ?auto_425633 ?auto_425636 ) ) ( not ( = ?auto_425633 ?auto_425637 ) ) ( not ( = ?auto_425633 ?auto_425638 ) ) ( not ( = ?auto_425633 ?auto_425639 ) ) ( not ( = ?auto_425633 ?auto_425640 ) ) ( not ( = ?auto_425633 ?auto_425641 ) ) ( not ( = ?auto_425633 ?auto_425642 ) ) ( not ( = ?auto_425634 ?auto_425635 ) ) ( not ( = ?auto_425634 ?auto_425636 ) ) ( not ( = ?auto_425634 ?auto_425637 ) ) ( not ( = ?auto_425634 ?auto_425638 ) ) ( not ( = ?auto_425634 ?auto_425639 ) ) ( not ( = ?auto_425634 ?auto_425640 ) ) ( not ( = ?auto_425634 ?auto_425641 ) ) ( not ( = ?auto_425634 ?auto_425642 ) ) ( not ( = ?auto_425635 ?auto_425636 ) ) ( not ( = ?auto_425635 ?auto_425637 ) ) ( not ( = ?auto_425635 ?auto_425638 ) ) ( not ( = ?auto_425635 ?auto_425639 ) ) ( not ( = ?auto_425635 ?auto_425640 ) ) ( not ( = ?auto_425635 ?auto_425641 ) ) ( not ( = ?auto_425635 ?auto_425642 ) ) ( not ( = ?auto_425636 ?auto_425637 ) ) ( not ( = ?auto_425636 ?auto_425638 ) ) ( not ( = ?auto_425636 ?auto_425639 ) ) ( not ( = ?auto_425636 ?auto_425640 ) ) ( not ( = ?auto_425636 ?auto_425641 ) ) ( not ( = ?auto_425636 ?auto_425642 ) ) ( not ( = ?auto_425637 ?auto_425638 ) ) ( not ( = ?auto_425637 ?auto_425639 ) ) ( not ( = ?auto_425637 ?auto_425640 ) ) ( not ( = ?auto_425637 ?auto_425641 ) ) ( not ( = ?auto_425637 ?auto_425642 ) ) ( not ( = ?auto_425638 ?auto_425639 ) ) ( not ( = ?auto_425638 ?auto_425640 ) ) ( not ( = ?auto_425638 ?auto_425641 ) ) ( not ( = ?auto_425638 ?auto_425642 ) ) ( not ( = ?auto_425639 ?auto_425640 ) ) ( not ( = ?auto_425639 ?auto_425641 ) ) ( not ( = ?auto_425639 ?auto_425642 ) ) ( not ( = ?auto_425640 ?auto_425641 ) ) ( not ( = ?auto_425640 ?auto_425642 ) ) ( not ( = ?auto_425641 ?auto_425642 ) ) ( ON ?auto_425640 ?auto_425641 ) ( ON ?auto_425639 ?auto_425640 ) ( ON ?auto_425638 ?auto_425639 ) ( ON ?auto_425637 ?auto_425638 ) ( CLEAR ?auto_425635 ) ( ON ?auto_425636 ?auto_425637 ) ( CLEAR ?auto_425636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_425630 ?auto_425631 ?auto_425632 ?auto_425633 ?auto_425634 ?auto_425635 ?auto_425636 )
      ( MAKE-12PILE ?auto_425630 ?auto_425631 ?auto_425632 ?auto_425633 ?auto_425634 ?auto_425635 ?auto_425636 ?auto_425637 ?auto_425638 ?auto_425639 ?auto_425640 ?auto_425641 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_425655 - BLOCK
      ?auto_425656 - BLOCK
      ?auto_425657 - BLOCK
      ?auto_425658 - BLOCK
      ?auto_425659 - BLOCK
      ?auto_425660 - BLOCK
      ?auto_425661 - BLOCK
      ?auto_425662 - BLOCK
      ?auto_425663 - BLOCK
      ?auto_425664 - BLOCK
      ?auto_425665 - BLOCK
      ?auto_425666 - BLOCK
    )
    :vars
    (
      ?auto_425667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425666 ?auto_425667 ) ( ON-TABLE ?auto_425655 ) ( ON ?auto_425656 ?auto_425655 ) ( ON ?auto_425657 ?auto_425656 ) ( ON ?auto_425658 ?auto_425657 ) ( ON ?auto_425659 ?auto_425658 ) ( ON ?auto_425660 ?auto_425659 ) ( not ( = ?auto_425655 ?auto_425656 ) ) ( not ( = ?auto_425655 ?auto_425657 ) ) ( not ( = ?auto_425655 ?auto_425658 ) ) ( not ( = ?auto_425655 ?auto_425659 ) ) ( not ( = ?auto_425655 ?auto_425660 ) ) ( not ( = ?auto_425655 ?auto_425661 ) ) ( not ( = ?auto_425655 ?auto_425662 ) ) ( not ( = ?auto_425655 ?auto_425663 ) ) ( not ( = ?auto_425655 ?auto_425664 ) ) ( not ( = ?auto_425655 ?auto_425665 ) ) ( not ( = ?auto_425655 ?auto_425666 ) ) ( not ( = ?auto_425655 ?auto_425667 ) ) ( not ( = ?auto_425656 ?auto_425657 ) ) ( not ( = ?auto_425656 ?auto_425658 ) ) ( not ( = ?auto_425656 ?auto_425659 ) ) ( not ( = ?auto_425656 ?auto_425660 ) ) ( not ( = ?auto_425656 ?auto_425661 ) ) ( not ( = ?auto_425656 ?auto_425662 ) ) ( not ( = ?auto_425656 ?auto_425663 ) ) ( not ( = ?auto_425656 ?auto_425664 ) ) ( not ( = ?auto_425656 ?auto_425665 ) ) ( not ( = ?auto_425656 ?auto_425666 ) ) ( not ( = ?auto_425656 ?auto_425667 ) ) ( not ( = ?auto_425657 ?auto_425658 ) ) ( not ( = ?auto_425657 ?auto_425659 ) ) ( not ( = ?auto_425657 ?auto_425660 ) ) ( not ( = ?auto_425657 ?auto_425661 ) ) ( not ( = ?auto_425657 ?auto_425662 ) ) ( not ( = ?auto_425657 ?auto_425663 ) ) ( not ( = ?auto_425657 ?auto_425664 ) ) ( not ( = ?auto_425657 ?auto_425665 ) ) ( not ( = ?auto_425657 ?auto_425666 ) ) ( not ( = ?auto_425657 ?auto_425667 ) ) ( not ( = ?auto_425658 ?auto_425659 ) ) ( not ( = ?auto_425658 ?auto_425660 ) ) ( not ( = ?auto_425658 ?auto_425661 ) ) ( not ( = ?auto_425658 ?auto_425662 ) ) ( not ( = ?auto_425658 ?auto_425663 ) ) ( not ( = ?auto_425658 ?auto_425664 ) ) ( not ( = ?auto_425658 ?auto_425665 ) ) ( not ( = ?auto_425658 ?auto_425666 ) ) ( not ( = ?auto_425658 ?auto_425667 ) ) ( not ( = ?auto_425659 ?auto_425660 ) ) ( not ( = ?auto_425659 ?auto_425661 ) ) ( not ( = ?auto_425659 ?auto_425662 ) ) ( not ( = ?auto_425659 ?auto_425663 ) ) ( not ( = ?auto_425659 ?auto_425664 ) ) ( not ( = ?auto_425659 ?auto_425665 ) ) ( not ( = ?auto_425659 ?auto_425666 ) ) ( not ( = ?auto_425659 ?auto_425667 ) ) ( not ( = ?auto_425660 ?auto_425661 ) ) ( not ( = ?auto_425660 ?auto_425662 ) ) ( not ( = ?auto_425660 ?auto_425663 ) ) ( not ( = ?auto_425660 ?auto_425664 ) ) ( not ( = ?auto_425660 ?auto_425665 ) ) ( not ( = ?auto_425660 ?auto_425666 ) ) ( not ( = ?auto_425660 ?auto_425667 ) ) ( not ( = ?auto_425661 ?auto_425662 ) ) ( not ( = ?auto_425661 ?auto_425663 ) ) ( not ( = ?auto_425661 ?auto_425664 ) ) ( not ( = ?auto_425661 ?auto_425665 ) ) ( not ( = ?auto_425661 ?auto_425666 ) ) ( not ( = ?auto_425661 ?auto_425667 ) ) ( not ( = ?auto_425662 ?auto_425663 ) ) ( not ( = ?auto_425662 ?auto_425664 ) ) ( not ( = ?auto_425662 ?auto_425665 ) ) ( not ( = ?auto_425662 ?auto_425666 ) ) ( not ( = ?auto_425662 ?auto_425667 ) ) ( not ( = ?auto_425663 ?auto_425664 ) ) ( not ( = ?auto_425663 ?auto_425665 ) ) ( not ( = ?auto_425663 ?auto_425666 ) ) ( not ( = ?auto_425663 ?auto_425667 ) ) ( not ( = ?auto_425664 ?auto_425665 ) ) ( not ( = ?auto_425664 ?auto_425666 ) ) ( not ( = ?auto_425664 ?auto_425667 ) ) ( not ( = ?auto_425665 ?auto_425666 ) ) ( not ( = ?auto_425665 ?auto_425667 ) ) ( not ( = ?auto_425666 ?auto_425667 ) ) ( ON ?auto_425665 ?auto_425666 ) ( ON ?auto_425664 ?auto_425665 ) ( ON ?auto_425663 ?auto_425664 ) ( ON ?auto_425662 ?auto_425663 ) ( CLEAR ?auto_425660 ) ( ON ?auto_425661 ?auto_425662 ) ( CLEAR ?auto_425661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_425655 ?auto_425656 ?auto_425657 ?auto_425658 ?auto_425659 ?auto_425660 ?auto_425661 )
      ( MAKE-12PILE ?auto_425655 ?auto_425656 ?auto_425657 ?auto_425658 ?auto_425659 ?auto_425660 ?auto_425661 ?auto_425662 ?auto_425663 ?auto_425664 ?auto_425665 ?auto_425666 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_425680 - BLOCK
      ?auto_425681 - BLOCK
      ?auto_425682 - BLOCK
      ?auto_425683 - BLOCK
      ?auto_425684 - BLOCK
      ?auto_425685 - BLOCK
      ?auto_425686 - BLOCK
      ?auto_425687 - BLOCK
      ?auto_425688 - BLOCK
      ?auto_425689 - BLOCK
      ?auto_425690 - BLOCK
      ?auto_425691 - BLOCK
    )
    :vars
    (
      ?auto_425692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425691 ?auto_425692 ) ( ON-TABLE ?auto_425680 ) ( ON ?auto_425681 ?auto_425680 ) ( ON ?auto_425682 ?auto_425681 ) ( ON ?auto_425683 ?auto_425682 ) ( ON ?auto_425684 ?auto_425683 ) ( not ( = ?auto_425680 ?auto_425681 ) ) ( not ( = ?auto_425680 ?auto_425682 ) ) ( not ( = ?auto_425680 ?auto_425683 ) ) ( not ( = ?auto_425680 ?auto_425684 ) ) ( not ( = ?auto_425680 ?auto_425685 ) ) ( not ( = ?auto_425680 ?auto_425686 ) ) ( not ( = ?auto_425680 ?auto_425687 ) ) ( not ( = ?auto_425680 ?auto_425688 ) ) ( not ( = ?auto_425680 ?auto_425689 ) ) ( not ( = ?auto_425680 ?auto_425690 ) ) ( not ( = ?auto_425680 ?auto_425691 ) ) ( not ( = ?auto_425680 ?auto_425692 ) ) ( not ( = ?auto_425681 ?auto_425682 ) ) ( not ( = ?auto_425681 ?auto_425683 ) ) ( not ( = ?auto_425681 ?auto_425684 ) ) ( not ( = ?auto_425681 ?auto_425685 ) ) ( not ( = ?auto_425681 ?auto_425686 ) ) ( not ( = ?auto_425681 ?auto_425687 ) ) ( not ( = ?auto_425681 ?auto_425688 ) ) ( not ( = ?auto_425681 ?auto_425689 ) ) ( not ( = ?auto_425681 ?auto_425690 ) ) ( not ( = ?auto_425681 ?auto_425691 ) ) ( not ( = ?auto_425681 ?auto_425692 ) ) ( not ( = ?auto_425682 ?auto_425683 ) ) ( not ( = ?auto_425682 ?auto_425684 ) ) ( not ( = ?auto_425682 ?auto_425685 ) ) ( not ( = ?auto_425682 ?auto_425686 ) ) ( not ( = ?auto_425682 ?auto_425687 ) ) ( not ( = ?auto_425682 ?auto_425688 ) ) ( not ( = ?auto_425682 ?auto_425689 ) ) ( not ( = ?auto_425682 ?auto_425690 ) ) ( not ( = ?auto_425682 ?auto_425691 ) ) ( not ( = ?auto_425682 ?auto_425692 ) ) ( not ( = ?auto_425683 ?auto_425684 ) ) ( not ( = ?auto_425683 ?auto_425685 ) ) ( not ( = ?auto_425683 ?auto_425686 ) ) ( not ( = ?auto_425683 ?auto_425687 ) ) ( not ( = ?auto_425683 ?auto_425688 ) ) ( not ( = ?auto_425683 ?auto_425689 ) ) ( not ( = ?auto_425683 ?auto_425690 ) ) ( not ( = ?auto_425683 ?auto_425691 ) ) ( not ( = ?auto_425683 ?auto_425692 ) ) ( not ( = ?auto_425684 ?auto_425685 ) ) ( not ( = ?auto_425684 ?auto_425686 ) ) ( not ( = ?auto_425684 ?auto_425687 ) ) ( not ( = ?auto_425684 ?auto_425688 ) ) ( not ( = ?auto_425684 ?auto_425689 ) ) ( not ( = ?auto_425684 ?auto_425690 ) ) ( not ( = ?auto_425684 ?auto_425691 ) ) ( not ( = ?auto_425684 ?auto_425692 ) ) ( not ( = ?auto_425685 ?auto_425686 ) ) ( not ( = ?auto_425685 ?auto_425687 ) ) ( not ( = ?auto_425685 ?auto_425688 ) ) ( not ( = ?auto_425685 ?auto_425689 ) ) ( not ( = ?auto_425685 ?auto_425690 ) ) ( not ( = ?auto_425685 ?auto_425691 ) ) ( not ( = ?auto_425685 ?auto_425692 ) ) ( not ( = ?auto_425686 ?auto_425687 ) ) ( not ( = ?auto_425686 ?auto_425688 ) ) ( not ( = ?auto_425686 ?auto_425689 ) ) ( not ( = ?auto_425686 ?auto_425690 ) ) ( not ( = ?auto_425686 ?auto_425691 ) ) ( not ( = ?auto_425686 ?auto_425692 ) ) ( not ( = ?auto_425687 ?auto_425688 ) ) ( not ( = ?auto_425687 ?auto_425689 ) ) ( not ( = ?auto_425687 ?auto_425690 ) ) ( not ( = ?auto_425687 ?auto_425691 ) ) ( not ( = ?auto_425687 ?auto_425692 ) ) ( not ( = ?auto_425688 ?auto_425689 ) ) ( not ( = ?auto_425688 ?auto_425690 ) ) ( not ( = ?auto_425688 ?auto_425691 ) ) ( not ( = ?auto_425688 ?auto_425692 ) ) ( not ( = ?auto_425689 ?auto_425690 ) ) ( not ( = ?auto_425689 ?auto_425691 ) ) ( not ( = ?auto_425689 ?auto_425692 ) ) ( not ( = ?auto_425690 ?auto_425691 ) ) ( not ( = ?auto_425690 ?auto_425692 ) ) ( not ( = ?auto_425691 ?auto_425692 ) ) ( ON ?auto_425690 ?auto_425691 ) ( ON ?auto_425689 ?auto_425690 ) ( ON ?auto_425688 ?auto_425689 ) ( ON ?auto_425687 ?auto_425688 ) ( ON ?auto_425686 ?auto_425687 ) ( CLEAR ?auto_425684 ) ( ON ?auto_425685 ?auto_425686 ) ( CLEAR ?auto_425685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_425680 ?auto_425681 ?auto_425682 ?auto_425683 ?auto_425684 ?auto_425685 )
      ( MAKE-12PILE ?auto_425680 ?auto_425681 ?auto_425682 ?auto_425683 ?auto_425684 ?auto_425685 ?auto_425686 ?auto_425687 ?auto_425688 ?auto_425689 ?auto_425690 ?auto_425691 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_425705 - BLOCK
      ?auto_425706 - BLOCK
      ?auto_425707 - BLOCK
      ?auto_425708 - BLOCK
      ?auto_425709 - BLOCK
      ?auto_425710 - BLOCK
      ?auto_425711 - BLOCK
      ?auto_425712 - BLOCK
      ?auto_425713 - BLOCK
      ?auto_425714 - BLOCK
      ?auto_425715 - BLOCK
      ?auto_425716 - BLOCK
    )
    :vars
    (
      ?auto_425717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425716 ?auto_425717 ) ( ON-TABLE ?auto_425705 ) ( ON ?auto_425706 ?auto_425705 ) ( ON ?auto_425707 ?auto_425706 ) ( ON ?auto_425708 ?auto_425707 ) ( ON ?auto_425709 ?auto_425708 ) ( not ( = ?auto_425705 ?auto_425706 ) ) ( not ( = ?auto_425705 ?auto_425707 ) ) ( not ( = ?auto_425705 ?auto_425708 ) ) ( not ( = ?auto_425705 ?auto_425709 ) ) ( not ( = ?auto_425705 ?auto_425710 ) ) ( not ( = ?auto_425705 ?auto_425711 ) ) ( not ( = ?auto_425705 ?auto_425712 ) ) ( not ( = ?auto_425705 ?auto_425713 ) ) ( not ( = ?auto_425705 ?auto_425714 ) ) ( not ( = ?auto_425705 ?auto_425715 ) ) ( not ( = ?auto_425705 ?auto_425716 ) ) ( not ( = ?auto_425705 ?auto_425717 ) ) ( not ( = ?auto_425706 ?auto_425707 ) ) ( not ( = ?auto_425706 ?auto_425708 ) ) ( not ( = ?auto_425706 ?auto_425709 ) ) ( not ( = ?auto_425706 ?auto_425710 ) ) ( not ( = ?auto_425706 ?auto_425711 ) ) ( not ( = ?auto_425706 ?auto_425712 ) ) ( not ( = ?auto_425706 ?auto_425713 ) ) ( not ( = ?auto_425706 ?auto_425714 ) ) ( not ( = ?auto_425706 ?auto_425715 ) ) ( not ( = ?auto_425706 ?auto_425716 ) ) ( not ( = ?auto_425706 ?auto_425717 ) ) ( not ( = ?auto_425707 ?auto_425708 ) ) ( not ( = ?auto_425707 ?auto_425709 ) ) ( not ( = ?auto_425707 ?auto_425710 ) ) ( not ( = ?auto_425707 ?auto_425711 ) ) ( not ( = ?auto_425707 ?auto_425712 ) ) ( not ( = ?auto_425707 ?auto_425713 ) ) ( not ( = ?auto_425707 ?auto_425714 ) ) ( not ( = ?auto_425707 ?auto_425715 ) ) ( not ( = ?auto_425707 ?auto_425716 ) ) ( not ( = ?auto_425707 ?auto_425717 ) ) ( not ( = ?auto_425708 ?auto_425709 ) ) ( not ( = ?auto_425708 ?auto_425710 ) ) ( not ( = ?auto_425708 ?auto_425711 ) ) ( not ( = ?auto_425708 ?auto_425712 ) ) ( not ( = ?auto_425708 ?auto_425713 ) ) ( not ( = ?auto_425708 ?auto_425714 ) ) ( not ( = ?auto_425708 ?auto_425715 ) ) ( not ( = ?auto_425708 ?auto_425716 ) ) ( not ( = ?auto_425708 ?auto_425717 ) ) ( not ( = ?auto_425709 ?auto_425710 ) ) ( not ( = ?auto_425709 ?auto_425711 ) ) ( not ( = ?auto_425709 ?auto_425712 ) ) ( not ( = ?auto_425709 ?auto_425713 ) ) ( not ( = ?auto_425709 ?auto_425714 ) ) ( not ( = ?auto_425709 ?auto_425715 ) ) ( not ( = ?auto_425709 ?auto_425716 ) ) ( not ( = ?auto_425709 ?auto_425717 ) ) ( not ( = ?auto_425710 ?auto_425711 ) ) ( not ( = ?auto_425710 ?auto_425712 ) ) ( not ( = ?auto_425710 ?auto_425713 ) ) ( not ( = ?auto_425710 ?auto_425714 ) ) ( not ( = ?auto_425710 ?auto_425715 ) ) ( not ( = ?auto_425710 ?auto_425716 ) ) ( not ( = ?auto_425710 ?auto_425717 ) ) ( not ( = ?auto_425711 ?auto_425712 ) ) ( not ( = ?auto_425711 ?auto_425713 ) ) ( not ( = ?auto_425711 ?auto_425714 ) ) ( not ( = ?auto_425711 ?auto_425715 ) ) ( not ( = ?auto_425711 ?auto_425716 ) ) ( not ( = ?auto_425711 ?auto_425717 ) ) ( not ( = ?auto_425712 ?auto_425713 ) ) ( not ( = ?auto_425712 ?auto_425714 ) ) ( not ( = ?auto_425712 ?auto_425715 ) ) ( not ( = ?auto_425712 ?auto_425716 ) ) ( not ( = ?auto_425712 ?auto_425717 ) ) ( not ( = ?auto_425713 ?auto_425714 ) ) ( not ( = ?auto_425713 ?auto_425715 ) ) ( not ( = ?auto_425713 ?auto_425716 ) ) ( not ( = ?auto_425713 ?auto_425717 ) ) ( not ( = ?auto_425714 ?auto_425715 ) ) ( not ( = ?auto_425714 ?auto_425716 ) ) ( not ( = ?auto_425714 ?auto_425717 ) ) ( not ( = ?auto_425715 ?auto_425716 ) ) ( not ( = ?auto_425715 ?auto_425717 ) ) ( not ( = ?auto_425716 ?auto_425717 ) ) ( ON ?auto_425715 ?auto_425716 ) ( ON ?auto_425714 ?auto_425715 ) ( ON ?auto_425713 ?auto_425714 ) ( ON ?auto_425712 ?auto_425713 ) ( ON ?auto_425711 ?auto_425712 ) ( CLEAR ?auto_425709 ) ( ON ?auto_425710 ?auto_425711 ) ( CLEAR ?auto_425710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_425705 ?auto_425706 ?auto_425707 ?auto_425708 ?auto_425709 ?auto_425710 )
      ( MAKE-12PILE ?auto_425705 ?auto_425706 ?auto_425707 ?auto_425708 ?auto_425709 ?auto_425710 ?auto_425711 ?auto_425712 ?auto_425713 ?auto_425714 ?auto_425715 ?auto_425716 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_425730 - BLOCK
      ?auto_425731 - BLOCK
      ?auto_425732 - BLOCK
      ?auto_425733 - BLOCK
      ?auto_425734 - BLOCK
      ?auto_425735 - BLOCK
      ?auto_425736 - BLOCK
      ?auto_425737 - BLOCK
      ?auto_425738 - BLOCK
      ?auto_425739 - BLOCK
      ?auto_425740 - BLOCK
      ?auto_425741 - BLOCK
    )
    :vars
    (
      ?auto_425742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425741 ?auto_425742 ) ( ON-TABLE ?auto_425730 ) ( ON ?auto_425731 ?auto_425730 ) ( ON ?auto_425732 ?auto_425731 ) ( ON ?auto_425733 ?auto_425732 ) ( not ( = ?auto_425730 ?auto_425731 ) ) ( not ( = ?auto_425730 ?auto_425732 ) ) ( not ( = ?auto_425730 ?auto_425733 ) ) ( not ( = ?auto_425730 ?auto_425734 ) ) ( not ( = ?auto_425730 ?auto_425735 ) ) ( not ( = ?auto_425730 ?auto_425736 ) ) ( not ( = ?auto_425730 ?auto_425737 ) ) ( not ( = ?auto_425730 ?auto_425738 ) ) ( not ( = ?auto_425730 ?auto_425739 ) ) ( not ( = ?auto_425730 ?auto_425740 ) ) ( not ( = ?auto_425730 ?auto_425741 ) ) ( not ( = ?auto_425730 ?auto_425742 ) ) ( not ( = ?auto_425731 ?auto_425732 ) ) ( not ( = ?auto_425731 ?auto_425733 ) ) ( not ( = ?auto_425731 ?auto_425734 ) ) ( not ( = ?auto_425731 ?auto_425735 ) ) ( not ( = ?auto_425731 ?auto_425736 ) ) ( not ( = ?auto_425731 ?auto_425737 ) ) ( not ( = ?auto_425731 ?auto_425738 ) ) ( not ( = ?auto_425731 ?auto_425739 ) ) ( not ( = ?auto_425731 ?auto_425740 ) ) ( not ( = ?auto_425731 ?auto_425741 ) ) ( not ( = ?auto_425731 ?auto_425742 ) ) ( not ( = ?auto_425732 ?auto_425733 ) ) ( not ( = ?auto_425732 ?auto_425734 ) ) ( not ( = ?auto_425732 ?auto_425735 ) ) ( not ( = ?auto_425732 ?auto_425736 ) ) ( not ( = ?auto_425732 ?auto_425737 ) ) ( not ( = ?auto_425732 ?auto_425738 ) ) ( not ( = ?auto_425732 ?auto_425739 ) ) ( not ( = ?auto_425732 ?auto_425740 ) ) ( not ( = ?auto_425732 ?auto_425741 ) ) ( not ( = ?auto_425732 ?auto_425742 ) ) ( not ( = ?auto_425733 ?auto_425734 ) ) ( not ( = ?auto_425733 ?auto_425735 ) ) ( not ( = ?auto_425733 ?auto_425736 ) ) ( not ( = ?auto_425733 ?auto_425737 ) ) ( not ( = ?auto_425733 ?auto_425738 ) ) ( not ( = ?auto_425733 ?auto_425739 ) ) ( not ( = ?auto_425733 ?auto_425740 ) ) ( not ( = ?auto_425733 ?auto_425741 ) ) ( not ( = ?auto_425733 ?auto_425742 ) ) ( not ( = ?auto_425734 ?auto_425735 ) ) ( not ( = ?auto_425734 ?auto_425736 ) ) ( not ( = ?auto_425734 ?auto_425737 ) ) ( not ( = ?auto_425734 ?auto_425738 ) ) ( not ( = ?auto_425734 ?auto_425739 ) ) ( not ( = ?auto_425734 ?auto_425740 ) ) ( not ( = ?auto_425734 ?auto_425741 ) ) ( not ( = ?auto_425734 ?auto_425742 ) ) ( not ( = ?auto_425735 ?auto_425736 ) ) ( not ( = ?auto_425735 ?auto_425737 ) ) ( not ( = ?auto_425735 ?auto_425738 ) ) ( not ( = ?auto_425735 ?auto_425739 ) ) ( not ( = ?auto_425735 ?auto_425740 ) ) ( not ( = ?auto_425735 ?auto_425741 ) ) ( not ( = ?auto_425735 ?auto_425742 ) ) ( not ( = ?auto_425736 ?auto_425737 ) ) ( not ( = ?auto_425736 ?auto_425738 ) ) ( not ( = ?auto_425736 ?auto_425739 ) ) ( not ( = ?auto_425736 ?auto_425740 ) ) ( not ( = ?auto_425736 ?auto_425741 ) ) ( not ( = ?auto_425736 ?auto_425742 ) ) ( not ( = ?auto_425737 ?auto_425738 ) ) ( not ( = ?auto_425737 ?auto_425739 ) ) ( not ( = ?auto_425737 ?auto_425740 ) ) ( not ( = ?auto_425737 ?auto_425741 ) ) ( not ( = ?auto_425737 ?auto_425742 ) ) ( not ( = ?auto_425738 ?auto_425739 ) ) ( not ( = ?auto_425738 ?auto_425740 ) ) ( not ( = ?auto_425738 ?auto_425741 ) ) ( not ( = ?auto_425738 ?auto_425742 ) ) ( not ( = ?auto_425739 ?auto_425740 ) ) ( not ( = ?auto_425739 ?auto_425741 ) ) ( not ( = ?auto_425739 ?auto_425742 ) ) ( not ( = ?auto_425740 ?auto_425741 ) ) ( not ( = ?auto_425740 ?auto_425742 ) ) ( not ( = ?auto_425741 ?auto_425742 ) ) ( ON ?auto_425740 ?auto_425741 ) ( ON ?auto_425739 ?auto_425740 ) ( ON ?auto_425738 ?auto_425739 ) ( ON ?auto_425737 ?auto_425738 ) ( ON ?auto_425736 ?auto_425737 ) ( ON ?auto_425735 ?auto_425736 ) ( CLEAR ?auto_425733 ) ( ON ?auto_425734 ?auto_425735 ) ( CLEAR ?auto_425734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_425730 ?auto_425731 ?auto_425732 ?auto_425733 ?auto_425734 )
      ( MAKE-12PILE ?auto_425730 ?auto_425731 ?auto_425732 ?auto_425733 ?auto_425734 ?auto_425735 ?auto_425736 ?auto_425737 ?auto_425738 ?auto_425739 ?auto_425740 ?auto_425741 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_425755 - BLOCK
      ?auto_425756 - BLOCK
      ?auto_425757 - BLOCK
      ?auto_425758 - BLOCK
      ?auto_425759 - BLOCK
      ?auto_425760 - BLOCK
      ?auto_425761 - BLOCK
      ?auto_425762 - BLOCK
      ?auto_425763 - BLOCK
      ?auto_425764 - BLOCK
      ?auto_425765 - BLOCK
      ?auto_425766 - BLOCK
    )
    :vars
    (
      ?auto_425767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425766 ?auto_425767 ) ( ON-TABLE ?auto_425755 ) ( ON ?auto_425756 ?auto_425755 ) ( ON ?auto_425757 ?auto_425756 ) ( ON ?auto_425758 ?auto_425757 ) ( not ( = ?auto_425755 ?auto_425756 ) ) ( not ( = ?auto_425755 ?auto_425757 ) ) ( not ( = ?auto_425755 ?auto_425758 ) ) ( not ( = ?auto_425755 ?auto_425759 ) ) ( not ( = ?auto_425755 ?auto_425760 ) ) ( not ( = ?auto_425755 ?auto_425761 ) ) ( not ( = ?auto_425755 ?auto_425762 ) ) ( not ( = ?auto_425755 ?auto_425763 ) ) ( not ( = ?auto_425755 ?auto_425764 ) ) ( not ( = ?auto_425755 ?auto_425765 ) ) ( not ( = ?auto_425755 ?auto_425766 ) ) ( not ( = ?auto_425755 ?auto_425767 ) ) ( not ( = ?auto_425756 ?auto_425757 ) ) ( not ( = ?auto_425756 ?auto_425758 ) ) ( not ( = ?auto_425756 ?auto_425759 ) ) ( not ( = ?auto_425756 ?auto_425760 ) ) ( not ( = ?auto_425756 ?auto_425761 ) ) ( not ( = ?auto_425756 ?auto_425762 ) ) ( not ( = ?auto_425756 ?auto_425763 ) ) ( not ( = ?auto_425756 ?auto_425764 ) ) ( not ( = ?auto_425756 ?auto_425765 ) ) ( not ( = ?auto_425756 ?auto_425766 ) ) ( not ( = ?auto_425756 ?auto_425767 ) ) ( not ( = ?auto_425757 ?auto_425758 ) ) ( not ( = ?auto_425757 ?auto_425759 ) ) ( not ( = ?auto_425757 ?auto_425760 ) ) ( not ( = ?auto_425757 ?auto_425761 ) ) ( not ( = ?auto_425757 ?auto_425762 ) ) ( not ( = ?auto_425757 ?auto_425763 ) ) ( not ( = ?auto_425757 ?auto_425764 ) ) ( not ( = ?auto_425757 ?auto_425765 ) ) ( not ( = ?auto_425757 ?auto_425766 ) ) ( not ( = ?auto_425757 ?auto_425767 ) ) ( not ( = ?auto_425758 ?auto_425759 ) ) ( not ( = ?auto_425758 ?auto_425760 ) ) ( not ( = ?auto_425758 ?auto_425761 ) ) ( not ( = ?auto_425758 ?auto_425762 ) ) ( not ( = ?auto_425758 ?auto_425763 ) ) ( not ( = ?auto_425758 ?auto_425764 ) ) ( not ( = ?auto_425758 ?auto_425765 ) ) ( not ( = ?auto_425758 ?auto_425766 ) ) ( not ( = ?auto_425758 ?auto_425767 ) ) ( not ( = ?auto_425759 ?auto_425760 ) ) ( not ( = ?auto_425759 ?auto_425761 ) ) ( not ( = ?auto_425759 ?auto_425762 ) ) ( not ( = ?auto_425759 ?auto_425763 ) ) ( not ( = ?auto_425759 ?auto_425764 ) ) ( not ( = ?auto_425759 ?auto_425765 ) ) ( not ( = ?auto_425759 ?auto_425766 ) ) ( not ( = ?auto_425759 ?auto_425767 ) ) ( not ( = ?auto_425760 ?auto_425761 ) ) ( not ( = ?auto_425760 ?auto_425762 ) ) ( not ( = ?auto_425760 ?auto_425763 ) ) ( not ( = ?auto_425760 ?auto_425764 ) ) ( not ( = ?auto_425760 ?auto_425765 ) ) ( not ( = ?auto_425760 ?auto_425766 ) ) ( not ( = ?auto_425760 ?auto_425767 ) ) ( not ( = ?auto_425761 ?auto_425762 ) ) ( not ( = ?auto_425761 ?auto_425763 ) ) ( not ( = ?auto_425761 ?auto_425764 ) ) ( not ( = ?auto_425761 ?auto_425765 ) ) ( not ( = ?auto_425761 ?auto_425766 ) ) ( not ( = ?auto_425761 ?auto_425767 ) ) ( not ( = ?auto_425762 ?auto_425763 ) ) ( not ( = ?auto_425762 ?auto_425764 ) ) ( not ( = ?auto_425762 ?auto_425765 ) ) ( not ( = ?auto_425762 ?auto_425766 ) ) ( not ( = ?auto_425762 ?auto_425767 ) ) ( not ( = ?auto_425763 ?auto_425764 ) ) ( not ( = ?auto_425763 ?auto_425765 ) ) ( not ( = ?auto_425763 ?auto_425766 ) ) ( not ( = ?auto_425763 ?auto_425767 ) ) ( not ( = ?auto_425764 ?auto_425765 ) ) ( not ( = ?auto_425764 ?auto_425766 ) ) ( not ( = ?auto_425764 ?auto_425767 ) ) ( not ( = ?auto_425765 ?auto_425766 ) ) ( not ( = ?auto_425765 ?auto_425767 ) ) ( not ( = ?auto_425766 ?auto_425767 ) ) ( ON ?auto_425765 ?auto_425766 ) ( ON ?auto_425764 ?auto_425765 ) ( ON ?auto_425763 ?auto_425764 ) ( ON ?auto_425762 ?auto_425763 ) ( ON ?auto_425761 ?auto_425762 ) ( ON ?auto_425760 ?auto_425761 ) ( CLEAR ?auto_425758 ) ( ON ?auto_425759 ?auto_425760 ) ( CLEAR ?auto_425759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_425755 ?auto_425756 ?auto_425757 ?auto_425758 ?auto_425759 )
      ( MAKE-12PILE ?auto_425755 ?auto_425756 ?auto_425757 ?auto_425758 ?auto_425759 ?auto_425760 ?auto_425761 ?auto_425762 ?auto_425763 ?auto_425764 ?auto_425765 ?auto_425766 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_425780 - BLOCK
      ?auto_425781 - BLOCK
      ?auto_425782 - BLOCK
      ?auto_425783 - BLOCK
      ?auto_425784 - BLOCK
      ?auto_425785 - BLOCK
      ?auto_425786 - BLOCK
      ?auto_425787 - BLOCK
      ?auto_425788 - BLOCK
      ?auto_425789 - BLOCK
      ?auto_425790 - BLOCK
      ?auto_425791 - BLOCK
    )
    :vars
    (
      ?auto_425792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425791 ?auto_425792 ) ( ON-TABLE ?auto_425780 ) ( ON ?auto_425781 ?auto_425780 ) ( ON ?auto_425782 ?auto_425781 ) ( not ( = ?auto_425780 ?auto_425781 ) ) ( not ( = ?auto_425780 ?auto_425782 ) ) ( not ( = ?auto_425780 ?auto_425783 ) ) ( not ( = ?auto_425780 ?auto_425784 ) ) ( not ( = ?auto_425780 ?auto_425785 ) ) ( not ( = ?auto_425780 ?auto_425786 ) ) ( not ( = ?auto_425780 ?auto_425787 ) ) ( not ( = ?auto_425780 ?auto_425788 ) ) ( not ( = ?auto_425780 ?auto_425789 ) ) ( not ( = ?auto_425780 ?auto_425790 ) ) ( not ( = ?auto_425780 ?auto_425791 ) ) ( not ( = ?auto_425780 ?auto_425792 ) ) ( not ( = ?auto_425781 ?auto_425782 ) ) ( not ( = ?auto_425781 ?auto_425783 ) ) ( not ( = ?auto_425781 ?auto_425784 ) ) ( not ( = ?auto_425781 ?auto_425785 ) ) ( not ( = ?auto_425781 ?auto_425786 ) ) ( not ( = ?auto_425781 ?auto_425787 ) ) ( not ( = ?auto_425781 ?auto_425788 ) ) ( not ( = ?auto_425781 ?auto_425789 ) ) ( not ( = ?auto_425781 ?auto_425790 ) ) ( not ( = ?auto_425781 ?auto_425791 ) ) ( not ( = ?auto_425781 ?auto_425792 ) ) ( not ( = ?auto_425782 ?auto_425783 ) ) ( not ( = ?auto_425782 ?auto_425784 ) ) ( not ( = ?auto_425782 ?auto_425785 ) ) ( not ( = ?auto_425782 ?auto_425786 ) ) ( not ( = ?auto_425782 ?auto_425787 ) ) ( not ( = ?auto_425782 ?auto_425788 ) ) ( not ( = ?auto_425782 ?auto_425789 ) ) ( not ( = ?auto_425782 ?auto_425790 ) ) ( not ( = ?auto_425782 ?auto_425791 ) ) ( not ( = ?auto_425782 ?auto_425792 ) ) ( not ( = ?auto_425783 ?auto_425784 ) ) ( not ( = ?auto_425783 ?auto_425785 ) ) ( not ( = ?auto_425783 ?auto_425786 ) ) ( not ( = ?auto_425783 ?auto_425787 ) ) ( not ( = ?auto_425783 ?auto_425788 ) ) ( not ( = ?auto_425783 ?auto_425789 ) ) ( not ( = ?auto_425783 ?auto_425790 ) ) ( not ( = ?auto_425783 ?auto_425791 ) ) ( not ( = ?auto_425783 ?auto_425792 ) ) ( not ( = ?auto_425784 ?auto_425785 ) ) ( not ( = ?auto_425784 ?auto_425786 ) ) ( not ( = ?auto_425784 ?auto_425787 ) ) ( not ( = ?auto_425784 ?auto_425788 ) ) ( not ( = ?auto_425784 ?auto_425789 ) ) ( not ( = ?auto_425784 ?auto_425790 ) ) ( not ( = ?auto_425784 ?auto_425791 ) ) ( not ( = ?auto_425784 ?auto_425792 ) ) ( not ( = ?auto_425785 ?auto_425786 ) ) ( not ( = ?auto_425785 ?auto_425787 ) ) ( not ( = ?auto_425785 ?auto_425788 ) ) ( not ( = ?auto_425785 ?auto_425789 ) ) ( not ( = ?auto_425785 ?auto_425790 ) ) ( not ( = ?auto_425785 ?auto_425791 ) ) ( not ( = ?auto_425785 ?auto_425792 ) ) ( not ( = ?auto_425786 ?auto_425787 ) ) ( not ( = ?auto_425786 ?auto_425788 ) ) ( not ( = ?auto_425786 ?auto_425789 ) ) ( not ( = ?auto_425786 ?auto_425790 ) ) ( not ( = ?auto_425786 ?auto_425791 ) ) ( not ( = ?auto_425786 ?auto_425792 ) ) ( not ( = ?auto_425787 ?auto_425788 ) ) ( not ( = ?auto_425787 ?auto_425789 ) ) ( not ( = ?auto_425787 ?auto_425790 ) ) ( not ( = ?auto_425787 ?auto_425791 ) ) ( not ( = ?auto_425787 ?auto_425792 ) ) ( not ( = ?auto_425788 ?auto_425789 ) ) ( not ( = ?auto_425788 ?auto_425790 ) ) ( not ( = ?auto_425788 ?auto_425791 ) ) ( not ( = ?auto_425788 ?auto_425792 ) ) ( not ( = ?auto_425789 ?auto_425790 ) ) ( not ( = ?auto_425789 ?auto_425791 ) ) ( not ( = ?auto_425789 ?auto_425792 ) ) ( not ( = ?auto_425790 ?auto_425791 ) ) ( not ( = ?auto_425790 ?auto_425792 ) ) ( not ( = ?auto_425791 ?auto_425792 ) ) ( ON ?auto_425790 ?auto_425791 ) ( ON ?auto_425789 ?auto_425790 ) ( ON ?auto_425788 ?auto_425789 ) ( ON ?auto_425787 ?auto_425788 ) ( ON ?auto_425786 ?auto_425787 ) ( ON ?auto_425785 ?auto_425786 ) ( ON ?auto_425784 ?auto_425785 ) ( CLEAR ?auto_425782 ) ( ON ?auto_425783 ?auto_425784 ) ( CLEAR ?auto_425783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_425780 ?auto_425781 ?auto_425782 ?auto_425783 )
      ( MAKE-12PILE ?auto_425780 ?auto_425781 ?auto_425782 ?auto_425783 ?auto_425784 ?auto_425785 ?auto_425786 ?auto_425787 ?auto_425788 ?auto_425789 ?auto_425790 ?auto_425791 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_425805 - BLOCK
      ?auto_425806 - BLOCK
      ?auto_425807 - BLOCK
      ?auto_425808 - BLOCK
      ?auto_425809 - BLOCK
      ?auto_425810 - BLOCK
      ?auto_425811 - BLOCK
      ?auto_425812 - BLOCK
      ?auto_425813 - BLOCK
      ?auto_425814 - BLOCK
      ?auto_425815 - BLOCK
      ?auto_425816 - BLOCK
    )
    :vars
    (
      ?auto_425817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425816 ?auto_425817 ) ( ON-TABLE ?auto_425805 ) ( ON ?auto_425806 ?auto_425805 ) ( ON ?auto_425807 ?auto_425806 ) ( not ( = ?auto_425805 ?auto_425806 ) ) ( not ( = ?auto_425805 ?auto_425807 ) ) ( not ( = ?auto_425805 ?auto_425808 ) ) ( not ( = ?auto_425805 ?auto_425809 ) ) ( not ( = ?auto_425805 ?auto_425810 ) ) ( not ( = ?auto_425805 ?auto_425811 ) ) ( not ( = ?auto_425805 ?auto_425812 ) ) ( not ( = ?auto_425805 ?auto_425813 ) ) ( not ( = ?auto_425805 ?auto_425814 ) ) ( not ( = ?auto_425805 ?auto_425815 ) ) ( not ( = ?auto_425805 ?auto_425816 ) ) ( not ( = ?auto_425805 ?auto_425817 ) ) ( not ( = ?auto_425806 ?auto_425807 ) ) ( not ( = ?auto_425806 ?auto_425808 ) ) ( not ( = ?auto_425806 ?auto_425809 ) ) ( not ( = ?auto_425806 ?auto_425810 ) ) ( not ( = ?auto_425806 ?auto_425811 ) ) ( not ( = ?auto_425806 ?auto_425812 ) ) ( not ( = ?auto_425806 ?auto_425813 ) ) ( not ( = ?auto_425806 ?auto_425814 ) ) ( not ( = ?auto_425806 ?auto_425815 ) ) ( not ( = ?auto_425806 ?auto_425816 ) ) ( not ( = ?auto_425806 ?auto_425817 ) ) ( not ( = ?auto_425807 ?auto_425808 ) ) ( not ( = ?auto_425807 ?auto_425809 ) ) ( not ( = ?auto_425807 ?auto_425810 ) ) ( not ( = ?auto_425807 ?auto_425811 ) ) ( not ( = ?auto_425807 ?auto_425812 ) ) ( not ( = ?auto_425807 ?auto_425813 ) ) ( not ( = ?auto_425807 ?auto_425814 ) ) ( not ( = ?auto_425807 ?auto_425815 ) ) ( not ( = ?auto_425807 ?auto_425816 ) ) ( not ( = ?auto_425807 ?auto_425817 ) ) ( not ( = ?auto_425808 ?auto_425809 ) ) ( not ( = ?auto_425808 ?auto_425810 ) ) ( not ( = ?auto_425808 ?auto_425811 ) ) ( not ( = ?auto_425808 ?auto_425812 ) ) ( not ( = ?auto_425808 ?auto_425813 ) ) ( not ( = ?auto_425808 ?auto_425814 ) ) ( not ( = ?auto_425808 ?auto_425815 ) ) ( not ( = ?auto_425808 ?auto_425816 ) ) ( not ( = ?auto_425808 ?auto_425817 ) ) ( not ( = ?auto_425809 ?auto_425810 ) ) ( not ( = ?auto_425809 ?auto_425811 ) ) ( not ( = ?auto_425809 ?auto_425812 ) ) ( not ( = ?auto_425809 ?auto_425813 ) ) ( not ( = ?auto_425809 ?auto_425814 ) ) ( not ( = ?auto_425809 ?auto_425815 ) ) ( not ( = ?auto_425809 ?auto_425816 ) ) ( not ( = ?auto_425809 ?auto_425817 ) ) ( not ( = ?auto_425810 ?auto_425811 ) ) ( not ( = ?auto_425810 ?auto_425812 ) ) ( not ( = ?auto_425810 ?auto_425813 ) ) ( not ( = ?auto_425810 ?auto_425814 ) ) ( not ( = ?auto_425810 ?auto_425815 ) ) ( not ( = ?auto_425810 ?auto_425816 ) ) ( not ( = ?auto_425810 ?auto_425817 ) ) ( not ( = ?auto_425811 ?auto_425812 ) ) ( not ( = ?auto_425811 ?auto_425813 ) ) ( not ( = ?auto_425811 ?auto_425814 ) ) ( not ( = ?auto_425811 ?auto_425815 ) ) ( not ( = ?auto_425811 ?auto_425816 ) ) ( not ( = ?auto_425811 ?auto_425817 ) ) ( not ( = ?auto_425812 ?auto_425813 ) ) ( not ( = ?auto_425812 ?auto_425814 ) ) ( not ( = ?auto_425812 ?auto_425815 ) ) ( not ( = ?auto_425812 ?auto_425816 ) ) ( not ( = ?auto_425812 ?auto_425817 ) ) ( not ( = ?auto_425813 ?auto_425814 ) ) ( not ( = ?auto_425813 ?auto_425815 ) ) ( not ( = ?auto_425813 ?auto_425816 ) ) ( not ( = ?auto_425813 ?auto_425817 ) ) ( not ( = ?auto_425814 ?auto_425815 ) ) ( not ( = ?auto_425814 ?auto_425816 ) ) ( not ( = ?auto_425814 ?auto_425817 ) ) ( not ( = ?auto_425815 ?auto_425816 ) ) ( not ( = ?auto_425815 ?auto_425817 ) ) ( not ( = ?auto_425816 ?auto_425817 ) ) ( ON ?auto_425815 ?auto_425816 ) ( ON ?auto_425814 ?auto_425815 ) ( ON ?auto_425813 ?auto_425814 ) ( ON ?auto_425812 ?auto_425813 ) ( ON ?auto_425811 ?auto_425812 ) ( ON ?auto_425810 ?auto_425811 ) ( ON ?auto_425809 ?auto_425810 ) ( CLEAR ?auto_425807 ) ( ON ?auto_425808 ?auto_425809 ) ( CLEAR ?auto_425808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_425805 ?auto_425806 ?auto_425807 ?auto_425808 )
      ( MAKE-12PILE ?auto_425805 ?auto_425806 ?auto_425807 ?auto_425808 ?auto_425809 ?auto_425810 ?auto_425811 ?auto_425812 ?auto_425813 ?auto_425814 ?auto_425815 ?auto_425816 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_425830 - BLOCK
      ?auto_425831 - BLOCK
      ?auto_425832 - BLOCK
      ?auto_425833 - BLOCK
      ?auto_425834 - BLOCK
      ?auto_425835 - BLOCK
      ?auto_425836 - BLOCK
      ?auto_425837 - BLOCK
      ?auto_425838 - BLOCK
      ?auto_425839 - BLOCK
      ?auto_425840 - BLOCK
      ?auto_425841 - BLOCK
    )
    :vars
    (
      ?auto_425842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425841 ?auto_425842 ) ( ON-TABLE ?auto_425830 ) ( ON ?auto_425831 ?auto_425830 ) ( not ( = ?auto_425830 ?auto_425831 ) ) ( not ( = ?auto_425830 ?auto_425832 ) ) ( not ( = ?auto_425830 ?auto_425833 ) ) ( not ( = ?auto_425830 ?auto_425834 ) ) ( not ( = ?auto_425830 ?auto_425835 ) ) ( not ( = ?auto_425830 ?auto_425836 ) ) ( not ( = ?auto_425830 ?auto_425837 ) ) ( not ( = ?auto_425830 ?auto_425838 ) ) ( not ( = ?auto_425830 ?auto_425839 ) ) ( not ( = ?auto_425830 ?auto_425840 ) ) ( not ( = ?auto_425830 ?auto_425841 ) ) ( not ( = ?auto_425830 ?auto_425842 ) ) ( not ( = ?auto_425831 ?auto_425832 ) ) ( not ( = ?auto_425831 ?auto_425833 ) ) ( not ( = ?auto_425831 ?auto_425834 ) ) ( not ( = ?auto_425831 ?auto_425835 ) ) ( not ( = ?auto_425831 ?auto_425836 ) ) ( not ( = ?auto_425831 ?auto_425837 ) ) ( not ( = ?auto_425831 ?auto_425838 ) ) ( not ( = ?auto_425831 ?auto_425839 ) ) ( not ( = ?auto_425831 ?auto_425840 ) ) ( not ( = ?auto_425831 ?auto_425841 ) ) ( not ( = ?auto_425831 ?auto_425842 ) ) ( not ( = ?auto_425832 ?auto_425833 ) ) ( not ( = ?auto_425832 ?auto_425834 ) ) ( not ( = ?auto_425832 ?auto_425835 ) ) ( not ( = ?auto_425832 ?auto_425836 ) ) ( not ( = ?auto_425832 ?auto_425837 ) ) ( not ( = ?auto_425832 ?auto_425838 ) ) ( not ( = ?auto_425832 ?auto_425839 ) ) ( not ( = ?auto_425832 ?auto_425840 ) ) ( not ( = ?auto_425832 ?auto_425841 ) ) ( not ( = ?auto_425832 ?auto_425842 ) ) ( not ( = ?auto_425833 ?auto_425834 ) ) ( not ( = ?auto_425833 ?auto_425835 ) ) ( not ( = ?auto_425833 ?auto_425836 ) ) ( not ( = ?auto_425833 ?auto_425837 ) ) ( not ( = ?auto_425833 ?auto_425838 ) ) ( not ( = ?auto_425833 ?auto_425839 ) ) ( not ( = ?auto_425833 ?auto_425840 ) ) ( not ( = ?auto_425833 ?auto_425841 ) ) ( not ( = ?auto_425833 ?auto_425842 ) ) ( not ( = ?auto_425834 ?auto_425835 ) ) ( not ( = ?auto_425834 ?auto_425836 ) ) ( not ( = ?auto_425834 ?auto_425837 ) ) ( not ( = ?auto_425834 ?auto_425838 ) ) ( not ( = ?auto_425834 ?auto_425839 ) ) ( not ( = ?auto_425834 ?auto_425840 ) ) ( not ( = ?auto_425834 ?auto_425841 ) ) ( not ( = ?auto_425834 ?auto_425842 ) ) ( not ( = ?auto_425835 ?auto_425836 ) ) ( not ( = ?auto_425835 ?auto_425837 ) ) ( not ( = ?auto_425835 ?auto_425838 ) ) ( not ( = ?auto_425835 ?auto_425839 ) ) ( not ( = ?auto_425835 ?auto_425840 ) ) ( not ( = ?auto_425835 ?auto_425841 ) ) ( not ( = ?auto_425835 ?auto_425842 ) ) ( not ( = ?auto_425836 ?auto_425837 ) ) ( not ( = ?auto_425836 ?auto_425838 ) ) ( not ( = ?auto_425836 ?auto_425839 ) ) ( not ( = ?auto_425836 ?auto_425840 ) ) ( not ( = ?auto_425836 ?auto_425841 ) ) ( not ( = ?auto_425836 ?auto_425842 ) ) ( not ( = ?auto_425837 ?auto_425838 ) ) ( not ( = ?auto_425837 ?auto_425839 ) ) ( not ( = ?auto_425837 ?auto_425840 ) ) ( not ( = ?auto_425837 ?auto_425841 ) ) ( not ( = ?auto_425837 ?auto_425842 ) ) ( not ( = ?auto_425838 ?auto_425839 ) ) ( not ( = ?auto_425838 ?auto_425840 ) ) ( not ( = ?auto_425838 ?auto_425841 ) ) ( not ( = ?auto_425838 ?auto_425842 ) ) ( not ( = ?auto_425839 ?auto_425840 ) ) ( not ( = ?auto_425839 ?auto_425841 ) ) ( not ( = ?auto_425839 ?auto_425842 ) ) ( not ( = ?auto_425840 ?auto_425841 ) ) ( not ( = ?auto_425840 ?auto_425842 ) ) ( not ( = ?auto_425841 ?auto_425842 ) ) ( ON ?auto_425840 ?auto_425841 ) ( ON ?auto_425839 ?auto_425840 ) ( ON ?auto_425838 ?auto_425839 ) ( ON ?auto_425837 ?auto_425838 ) ( ON ?auto_425836 ?auto_425837 ) ( ON ?auto_425835 ?auto_425836 ) ( ON ?auto_425834 ?auto_425835 ) ( ON ?auto_425833 ?auto_425834 ) ( CLEAR ?auto_425831 ) ( ON ?auto_425832 ?auto_425833 ) ( CLEAR ?auto_425832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_425830 ?auto_425831 ?auto_425832 )
      ( MAKE-12PILE ?auto_425830 ?auto_425831 ?auto_425832 ?auto_425833 ?auto_425834 ?auto_425835 ?auto_425836 ?auto_425837 ?auto_425838 ?auto_425839 ?auto_425840 ?auto_425841 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_425855 - BLOCK
      ?auto_425856 - BLOCK
      ?auto_425857 - BLOCK
      ?auto_425858 - BLOCK
      ?auto_425859 - BLOCK
      ?auto_425860 - BLOCK
      ?auto_425861 - BLOCK
      ?auto_425862 - BLOCK
      ?auto_425863 - BLOCK
      ?auto_425864 - BLOCK
      ?auto_425865 - BLOCK
      ?auto_425866 - BLOCK
    )
    :vars
    (
      ?auto_425867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425866 ?auto_425867 ) ( ON-TABLE ?auto_425855 ) ( ON ?auto_425856 ?auto_425855 ) ( not ( = ?auto_425855 ?auto_425856 ) ) ( not ( = ?auto_425855 ?auto_425857 ) ) ( not ( = ?auto_425855 ?auto_425858 ) ) ( not ( = ?auto_425855 ?auto_425859 ) ) ( not ( = ?auto_425855 ?auto_425860 ) ) ( not ( = ?auto_425855 ?auto_425861 ) ) ( not ( = ?auto_425855 ?auto_425862 ) ) ( not ( = ?auto_425855 ?auto_425863 ) ) ( not ( = ?auto_425855 ?auto_425864 ) ) ( not ( = ?auto_425855 ?auto_425865 ) ) ( not ( = ?auto_425855 ?auto_425866 ) ) ( not ( = ?auto_425855 ?auto_425867 ) ) ( not ( = ?auto_425856 ?auto_425857 ) ) ( not ( = ?auto_425856 ?auto_425858 ) ) ( not ( = ?auto_425856 ?auto_425859 ) ) ( not ( = ?auto_425856 ?auto_425860 ) ) ( not ( = ?auto_425856 ?auto_425861 ) ) ( not ( = ?auto_425856 ?auto_425862 ) ) ( not ( = ?auto_425856 ?auto_425863 ) ) ( not ( = ?auto_425856 ?auto_425864 ) ) ( not ( = ?auto_425856 ?auto_425865 ) ) ( not ( = ?auto_425856 ?auto_425866 ) ) ( not ( = ?auto_425856 ?auto_425867 ) ) ( not ( = ?auto_425857 ?auto_425858 ) ) ( not ( = ?auto_425857 ?auto_425859 ) ) ( not ( = ?auto_425857 ?auto_425860 ) ) ( not ( = ?auto_425857 ?auto_425861 ) ) ( not ( = ?auto_425857 ?auto_425862 ) ) ( not ( = ?auto_425857 ?auto_425863 ) ) ( not ( = ?auto_425857 ?auto_425864 ) ) ( not ( = ?auto_425857 ?auto_425865 ) ) ( not ( = ?auto_425857 ?auto_425866 ) ) ( not ( = ?auto_425857 ?auto_425867 ) ) ( not ( = ?auto_425858 ?auto_425859 ) ) ( not ( = ?auto_425858 ?auto_425860 ) ) ( not ( = ?auto_425858 ?auto_425861 ) ) ( not ( = ?auto_425858 ?auto_425862 ) ) ( not ( = ?auto_425858 ?auto_425863 ) ) ( not ( = ?auto_425858 ?auto_425864 ) ) ( not ( = ?auto_425858 ?auto_425865 ) ) ( not ( = ?auto_425858 ?auto_425866 ) ) ( not ( = ?auto_425858 ?auto_425867 ) ) ( not ( = ?auto_425859 ?auto_425860 ) ) ( not ( = ?auto_425859 ?auto_425861 ) ) ( not ( = ?auto_425859 ?auto_425862 ) ) ( not ( = ?auto_425859 ?auto_425863 ) ) ( not ( = ?auto_425859 ?auto_425864 ) ) ( not ( = ?auto_425859 ?auto_425865 ) ) ( not ( = ?auto_425859 ?auto_425866 ) ) ( not ( = ?auto_425859 ?auto_425867 ) ) ( not ( = ?auto_425860 ?auto_425861 ) ) ( not ( = ?auto_425860 ?auto_425862 ) ) ( not ( = ?auto_425860 ?auto_425863 ) ) ( not ( = ?auto_425860 ?auto_425864 ) ) ( not ( = ?auto_425860 ?auto_425865 ) ) ( not ( = ?auto_425860 ?auto_425866 ) ) ( not ( = ?auto_425860 ?auto_425867 ) ) ( not ( = ?auto_425861 ?auto_425862 ) ) ( not ( = ?auto_425861 ?auto_425863 ) ) ( not ( = ?auto_425861 ?auto_425864 ) ) ( not ( = ?auto_425861 ?auto_425865 ) ) ( not ( = ?auto_425861 ?auto_425866 ) ) ( not ( = ?auto_425861 ?auto_425867 ) ) ( not ( = ?auto_425862 ?auto_425863 ) ) ( not ( = ?auto_425862 ?auto_425864 ) ) ( not ( = ?auto_425862 ?auto_425865 ) ) ( not ( = ?auto_425862 ?auto_425866 ) ) ( not ( = ?auto_425862 ?auto_425867 ) ) ( not ( = ?auto_425863 ?auto_425864 ) ) ( not ( = ?auto_425863 ?auto_425865 ) ) ( not ( = ?auto_425863 ?auto_425866 ) ) ( not ( = ?auto_425863 ?auto_425867 ) ) ( not ( = ?auto_425864 ?auto_425865 ) ) ( not ( = ?auto_425864 ?auto_425866 ) ) ( not ( = ?auto_425864 ?auto_425867 ) ) ( not ( = ?auto_425865 ?auto_425866 ) ) ( not ( = ?auto_425865 ?auto_425867 ) ) ( not ( = ?auto_425866 ?auto_425867 ) ) ( ON ?auto_425865 ?auto_425866 ) ( ON ?auto_425864 ?auto_425865 ) ( ON ?auto_425863 ?auto_425864 ) ( ON ?auto_425862 ?auto_425863 ) ( ON ?auto_425861 ?auto_425862 ) ( ON ?auto_425860 ?auto_425861 ) ( ON ?auto_425859 ?auto_425860 ) ( ON ?auto_425858 ?auto_425859 ) ( CLEAR ?auto_425856 ) ( ON ?auto_425857 ?auto_425858 ) ( CLEAR ?auto_425857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_425855 ?auto_425856 ?auto_425857 )
      ( MAKE-12PILE ?auto_425855 ?auto_425856 ?auto_425857 ?auto_425858 ?auto_425859 ?auto_425860 ?auto_425861 ?auto_425862 ?auto_425863 ?auto_425864 ?auto_425865 ?auto_425866 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_425880 - BLOCK
      ?auto_425881 - BLOCK
      ?auto_425882 - BLOCK
      ?auto_425883 - BLOCK
      ?auto_425884 - BLOCK
      ?auto_425885 - BLOCK
      ?auto_425886 - BLOCK
      ?auto_425887 - BLOCK
      ?auto_425888 - BLOCK
      ?auto_425889 - BLOCK
      ?auto_425890 - BLOCK
      ?auto_425891 - BLOCK
    )
    :vars
    (
      ?auto_425892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425891 ?auto_425892 ) ( ON-TABLE ?auto_425880 ) ( not ( = ?auto_425880 ?auto_425881 ) ) ( not ( = ?auto_425880 ?auto_425882 ) ) ( not ( = ?auto_425880 ?auto_425883 ) ) ( not ( = ?auto_425880 ?auto_425884 ) ) ( not ( = ?auto_425880 ?auto_425885 ) ) ( not ( = ?auto_425880 ?auto_425886 ) ) ( not ( = ?auto_425880 ?auto_425887 ) ) ( not ( = ?auto_425880 ?auto_425888 ) ) ( not ( = ?auto_425880 ?auto_425889 ) ) ( not ( = ?auto_425880 ?auto_425890 ) ) ( not ( = ?auto_425880 ?auto_425891 ) ) ( not ( = ?auto_425880 ?auto_425892 ) ) ( not ( = ?auto_425881 ?auto_425882 ) ) ( not ( = ?auto_425881 ?auto_425883 ) ) ( not ( = ?auto_425881 ?auto_425884 ) ) ( not ( = ?auto_425881 ?auto_425885 ) ) ( not ( = ?auto_425881 ?auto_425886 ) ) ( not ( = ?auto_425881 ?auto_425887 ) ) ( not ( = ?auto_425881 ?auto_425888 ) ) ( not ( = ?auto_425881 ?auto_425889 ) ) ( not ( = ?auto_425881 ?auto_425890 ) ) ( not ( = ?auto_425881 ?auto_425891 ) ) ( not ( = ?auto_425881 ?auto_425892 ) ) ( not ( = ?auto_425882 ?auto_425883 ) ) ( not ( = ?auto_425882 ?auto_425884 ) ) ( not ( = ?auto_425882 ?auto_425885 ) ) ( not ( = ?auto_425882 ?auto_425886 ) ) ( not ( = ?auto_425882 ?auto_425887 ) ) ( not ( = ?auto_425882 ?auto_425888 ) ) ( not ( = ?auto_425882 ?auto_425889 ) ) ( not ( = ?auto_425882 ?auto_425890 ) ) ( not ( = ?auto_425882 ?auto_425891 ) ) ( not ( = ?auto_425882 ?auto_425892 ) ) ( not ( = ?auto_425883 ?auto_425884 ) ) ( not ( = ?auto_425883 ?auto_425885 ) ) ( not ( = ?auto_425883 ?auto_425886 ) ) ( not ( = ?auto_425883 ?auto_425887 ) ) ( not ( = ?auto_425883 ?auto_425888 ) ) ( not ( = ?auto_425883 ?auto_425889 ) ) ( not ( = ?auto_425883 ?auto_425890 ) ) ( not ( = ?auto_425883 ?auto_425891 ) ) ( not ( = ?auto_425883 ?auto_425892 ) ) ( not ( = ?auto_425884 ?auto_425885 ) ) ( not ( = ?auto_425884 ?auto_425886 ) ) ( not ( = ?auto_425884 ?auto_425887 ) ) ( not ( = ?auto_425884 ?auto_425888 ) ) ( not ( = ?auto_425884 ?auto_425889 ) ) ( not ( = ?auto_425884 ?auto_425890 ) ) ( not ( = ?auto_425884 ?auto_425891 ) ) ( not ( = ?auto_425884 ?auto_425892 ) ) ( not ( = ?auto_425885 ?auto_425886 ) ) ( not ( = ?auto_425885 ?auto_425887 ) ) ( not ( = ?auto_425885 ?auto_425888 ) ) ( not ( = ?auto_425885 ?auto_425889 ) ) ( not ( = ?auto_425885 ?auto_425890 ) ) ( not ( = ?auto_425885 ?auto_425891 ) ) ( not ( = ?auto_425885 ?auto_425892 ) ) ( not ( = ?auto_425886 ?auto_425887 ) ) ( not ( = ?auto_425886 ?auto_425888 ) ) ( not ( = ?auto_425886 ?auto_425889 ) ) ( not ( = ?auto_425886 ?auto_425890 ) ) ( not ( = ?auto_425886 ?auto_425891 ) ) ( not ( = ?auto_425886 ?auto_425892 ) ) ( not ( = ?auto_425887 ?auto_425888 ) ) ( not ( = ?auto_425887 ?auto_425889 ) ) ( not ( = ?auto_425887 ?auto_425890 ) ) ( not ( = ?auto_425887 ?auto_425891 ) ) ( not ( = ?auto_425887 ?auto_425892 ) ) ( not ( = ?auto_425888 ?auto_425889 ) ) ( not ( = ?auto_425888 ?auto_425890 ) ) ( not ( = ?auto_425888 ?auto_425891 ) ) ( not ( = ?auto_425888 ?auto_425892 ) ) ( not ( = ?auto_425889 ?auto_425890 ) ) ( not ( = ?auto_425889 ?auto_425891 ) ) ( not ( = ?auto_425889 ?auto_425892 ) ) ( not ( = ?auto_425890 ?auto_425891 ) ) ( not ( = ?auto_425890 ?auto_425892 ) ) ( not ( = ?auto_425891 ?auto_425892 ) ) ( ON ?auto_425890 ?auto_425891 ) ( ON ?auto_425889 ?auto_425890 ) ( ON ?auto_425888 ?auto_425889 ) ( ON ?auto_425887 ?auto_425888 ) ( ON ?auto_425886 ?auto_425887 ) ( ON ?auto_425885 ?auto_425886 ) ( ON ?auto_425884 ?auto_425885 ) ( ON ?auto_425883 ?auto_425884 ) ( ON ?auto_425882 ?auto_425883 ) ( CLEAR ?auto_425880 ) ( ON ?auto_425881 ?auto_425882 ) ( CLEAR ?auto_425881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_425880 ?auto_425881 )
      ( MAKE-12PILE ?auto_425880 ?auto_425881 ?auto_425882 ?auto_425883 ?auto_425884 ?auto_425885 ?auto_425886 ?auto_425887 ?auto_425888 ?auto_425889 ?auto_425890 ?auto_425891 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_425905 - BLOCK
      ?auto_425906 - BLOCK
      ?auto_425907 - BLOCK
      ?auto_425908 - BLOCK
      ?auto_425909 - BLOCK
      ?auto_425910 - BLOCK
      ?auto_425911 - BLOCK
      ?auto_425912 - BLOCK
      ?auto_425913 - BLOCK
      ?auto_425914 - BLOCK
      ?auto_425915 - BLOCK
      ?auto_425916 - BLOCK
    )
    :vars
    (
      ?auto_425917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425916 ?auto_425917 ) ( ON-TABLE ?auto_425905 ) ( not ( = ?auto_425905 ?auto_425906 ) ) ( not ( = ?auto_425905 ?auto_425907 ) ) ( not ( = ?auto_425905 ?auto_425908 ) ) ( not ( = ?auto_425905 ?auto_425909 ) ) ( not ( = ?auto_425905 ?auto_425910 ) ) ( not ( = ?auto_425905 ?auto_425911 ) ) ( not ( = ?auto_425905 ?auto_425912 ) ) ( not ( = ?auto_425905 ?auto_425913 ) ) ( not ( = ?auto_425905 ?auto_425914 ) ) ( not ( = ?auto_425905 ?auto_425915 ) ) ( not ( = ?auto_425905 ?auto_425916 ) ) ( not ( = ?auto_425905 ?auto_425917 ) ) ( not ( = ?auto_425906 ?auto_425907 ) ) ( not ( = ?auto_425906 ?auto_425908 ) ) ( not ( = ?auto_425906 ?auto_425909 ) ) ( not ( = ?auto_425906 ?auto_425910 ) ) ( not ( = ?auto_425906 ?auto_425911 ) ) ( not ( = ?auto_425906 ?auto_425912 ) ) ( not ( = ?auto_425906 ?auto_425913 ) ) ( not ( = ?auto_425906 ?auto_425914 ) ) ( not ( = ?auto_425906 ?auto_425915 ) ) ( not ( = ?auto_425906 ?auto_425916 ) ) ( not ( = ?auto_425906 ?auto_425917 ) ) ( not ( = ?auto_425907 ?auto_425908 ) ) ( not ( = ?auto_425907 ?auto_425909 ) ) ( not ( = ?auto_425907 ?auto_425910 ) ) ( not ( = ?auto_425907 ?auto_425911 ) ) ( not ( = ?auto_425907 ?auto_425912 ) ) ( not ( = ?auto_425907 ?auto_425913 ) ) ( not ( = ?auto_425907 ?auto_425914 ) ) ( not ( = ?auto_425907 ?auto_425915 ) ) ( not ( = ?auto_425907 ?auto_425916 ) ) ( not ( = ?auto_425907 ?auto_425917 ) ) ( not ( = ?auto_425908 ?auto_425909 ) ) ( not ( = ?auto_425908 ?auto_425910 ) ) ( not ( = ?auto_425908 ?auto_425911 ) ) ( not ( = ?auto_425908 ?auto_425912 ) ) ( not ( = ?auto_425908 ?auto_425913 ) ) ( not ( = ?auto_425908 ?auto_425914 ) ) ( not ( = ?auto_425908 ?auto_425915 ) ) ( not ( = ?auto_425908 ?auto_425916 ) ) ( not ( = ?auto_425908 ?auto_425917 ) ) ( not ( = ?auto_425909 ?auto_425910 ) ) ( not ( = ?auto_425909 ?auto_425911 ) ) ( not ( = ?auto_425909 ?auto_425912 ) ) ( not ( = ?auto_425909 ?auto_425913 ) ) ( not ( = ?auto_425909 ?auto_425914 ) ) ( not ( = ?auto_425909 ?auto_425915 ) ) ( not ( = ?auto_425909 ?auto_425916 ) ) ( not ( = ?auto_425909 ?auto_425917 ) ) ( not ( = ?auto_425910 ?auto_425911 ) ) ( not ( = ?auto_425910 ?auto_425912 ) ) ( not ( = ?auto_425910 ?auto_425913 ) ) ( not ( = ?auto_425910 ?auto_425914 ) ) ( not ( = ?auto_425910 ?auto_425915 ) ) ( not ( = ?auto_425910 ?auto_425916 ) ) ( not ( = ?auto_425910 ?auto_425917 ) ) ( not ( = ?auto_425911 ?auto_425912 ) ) ( not ( = ?auto_425911 ?auto_425913 ) ) ( not ( = ?auto_425911 ?auto_425914 ) ) ( not ( = ?auto_425911 ?auto_425915 ) ) ( not ( = ?auto_425911 ?auto_425916 ) ) ( not ( = ?auto_425911 ?auto_425917 ) ) ( not ( = ?auto_425912 ?auto_425913 ) ) ( not ( = ?auto_425912 ?auto_425914 ) ) ( not ( = ?auto_425912 ?auto_425915 ) ) ( not ( = ?auto_425912 ?auto_425916 ) ) ( not ( = ?auto_425912 ?auto_425917 ) ) ( not ( = ?auto_425913 ?auto_425914 ) ) ( not ( = ?auto_425913 ?auto_425915 ) ) ( not ( = ?auto_425913 ?auto_425916 ) ) ( not ( = ?auto_425913 ?auto_425917 ) ) ( not ( = ?auto_425914 ?auto_425915 ) ) ( not ( = ?auto_425914 ?auto_425916 ) ) ( not ( = ?auto_425914 ?auto_425917 ) ) ( not ( = ?auto_425915 ?auto_425916 ) ) ( not ( = ?auto_425915 ?auto_425917 ) ) ( not ( = ?auto_425916 ?auto_425917 ) ) ( ON ?auto_425915 ?auto_425916 ) ( ON ?auto_425914 ?auto_425915 ) ( ON ?auto_425913 ?auto_425914 ) ( ON ?auto_425912 ?auto_425913 ) ( ON ?auto_425911 ?auto_425912 ) ( ON ?auto_425910 ?auto_425911 ) ( ON ?auto_425909 ?auto_425910 ) ( ON ?auto_425908 ?auto_425909 ) ( ON ?auto_425907 ?auto_425908 ) ( CLEAR ?auto_425905 ) ( ON ?auto_425906 ?auto_425907 ) ( CLEAR ?auto_425906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_425905 ?auto_425906 )
      ( MAKE-12PILE ?auto_425905 ?auto_425906 ?auto_425907 ?auto_425908 ?auto_425909 ?auto_425910 ?auto_425911 ?auto_425912 ?auto_425913 ?auto_425914 ?auto_425915 ?auto_425916 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_425930 - BLOCK
      ?auto_425931 - BLOCK
      ?auto_425932 - BLOCK
      ?auto_425933 - BLOCK
      ?auto_425934 - BLOCK
      ?auto_425935 - BLOCK
      ?auto_425936 - BLOCK
      ?auto_425937 - BLOCK
      ?auto_425938 - BLOCK
      ?auto_425939 - BLOCK
      ?auto_425940 - BLOCK
      ?auto_425941 - BLOCK
    )
    :vars
    (
      ?auto_425942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425941 ?auto_425942 ) ( not ( = ?auto_425930 ?auto_425931 ) ) ( not ( = ?auto_425930 ?auto_425932 ) ) ( not ( = ?auto_425930 ?auto_425933 ) ) ( not ( = ?auto_425930 ?auto_425934 ) ) ( not ( = ?auto_425930 ?auto_425935 ) ) ( not ( = ?auto_425930 ?auto_425936 ) ) ( not ( = ?auto_425930 ?auto_425937 ) ) ( not ( = ?auto_425930 ?auto_425938 ) ) ( not ( = ?auto_425930 ?auto_425939 ) ) ( not ( = ?auto_425930 ?auto_425940 ) ) ( not ( = ?auto_425930 ?auto_425941 ) ) ( not ( = ?auto_425930 ?auto_425942 ) ) ( not ( = ?auto_425931 ?auto_425932 ) ) ( not ( = ?auto_425931 ?auto_425933 ) ) ( not ( = ?auto_425931 ?auto_425934 ) ) ( not ( = ?auto_425931 ?auto_425935 ) ) ( not ( = ?auto_425931 ?auto_425936 ) ) ( not ( = ?auto_425931 ?auto_425937 ) ) ( not ( = ?auto_425931 ?auto_425938 ) ) ( not ( = ?auto_425931 ?auto_425939 ) ) ( not ( = ?auto_425931 ?auto_425940 ) ) ( not ( = ?auto_425931 ?auto_425941 ) ) ( not ( = ?auto_425931 ?auto_425942 ) ) ( not ( = ?auto_425932 ?auto_425933 ) ) ( not ( = ?auto_425932 ?auto_425934 ) ) ( not ( = ?auto_425932 ?auto_425935 ) ) ( not ( = ?auto_425932 ?auto_425936 ) ) ( not ( = ?auto_425932 ?auto_425937 ) ) ( not ( = ?auto_425932 ?auto_425938 ) ) ( not ( = ?auto_425932 ?auto_425939 ) ) ( not ( = ?auto_425932 ?auto_425940 ) ) ( not ( = ?auto_425932 ?auto_425941 ) ) ( not ( = ?auto_425932 ?auto_425942 ) ) ( not ( = ?auto_425933 ?auto_425934 ) ) ( not ( = ?auto_425933 ?auto_425935 ) ) ( not ( = ?auto_425933 ?auto_425936 ) ) ( not ( = ?auto_425933 ?auto_425937 ) ) ( not ( = ?auto_425933 ?auto_425938 ) ) ( not ( = ?auto_425933 ?auto_425939 ) ) ( not ( = ?auto_425933 ?auto_425940 ) ) ( not ( = ?auto_425933 ?auto_425941 ) ) ( not ( = ?auto_425933 ?auto_425942 ) ) ( not ( = ?auto_425934 ?auto_425935 ) ) ( not ( = ?auto_425934 ?auto_425936 ) ) ( not ( = ?auto_425934 ?auto_425937 ) ) ( not ( = ?auto_425934 ?auto_425938 ) ) ( not ( = ?auto_425934 ?auto_425939 ) ) ( not ( = ?auto_425934 ?auto_425940 ) ) ( not ( = ?auto_425934 ?auto_425941 ) ) ( not ( = ?auto_425934 ?auto_425942 ) ) ( not ( = ?auto_425935 ?auto_425936 ) ) ( not ( = ?auto_425935 ?auto_425937 ) ) ( not ( = ?auto_425935 ?auto_425938 ) ) ( not ( = ?auto_425935 ?auto_425939 ) ) ( not ( = ?auto_425935 ?auto_425940 ) ) ( not ( = ?auto_425935 ?auto_425941 ) ) ( not ( = ?auto_425935 ?auto_425942 ) ) ( not ( = ?auto_425936 ?auto_425937 ) ) ( not ( = ?auto_425936 ?auto_425938 ) ) ( not ( = ?auto_425936 ?auto_425939 ) ) ( not ( = ?auto_425936 ?auto_425940 ) ) ( not ( = ?auto_425936 ?auto_425941 ) ) ( not ( = ?auto_425936 ?auto_425942 ) ) ( not ( = ?auto_425937 ?auto_425938 ) ) ( not ( = ?auto_425937 ?auto_425939 ) ) ( not ( = ?auto_425937 ?auto_425940 ) ) ( not ( = ?auto_425937 ?auto_425941 ) ) ( not ( = ?auto_425937 ?auto_425942 ) ) ( not ( = ?auto_425938 ?auto_425939 ) ) ( not ( = ?auto_425938 ?auto_425940 ) ) ( not ( = ?auto_425938 ?auto_425941 ) ) ( not ( = ?auto_425938 ?auto_425942 ) ) ( not ( = ?auto_425939 ?auto_425940 ) ) ( not ( = ?auto_425939 ?auto_425941 ) ) ( not ( = ?auto_425939 ?auto_425942 ) ) ( not ( = ?auto_425940 ?auto_425941 ) ) ( not ( = ?auto_425940 ?auto_425942 ) ) ( not ( = ?auto_425941 ?auto_425942 ) ) ( ON ?auto_425940 ?auto_425941 ) ( ON ?auto_425939 ?auto_425940 ) ( ON ?auto_425938 ?auto_425939 ) ( ON ?auto_425937 ?auto_425938 ) ( ON ?auto_425936 ?auto_425937 ) ( ON ?auto_425935 ?auto_425936 ) ( ON ?auto_425934 ?auto_425935 ) ( ON ?auto_425933 ?auto_425934 ) ( ON ?auto_425932 ?auto_425933 ) ( ON ?auto_425931 ?auto_425932 ) ( ON ?auto_425930 ?auto_425931 ) ( CLEAR ?auto_425930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_425930 )
      ( MAKE-12PILE ?auto_425930 ?auto_425931 ?auto_425932 ?auto_425933 ?auto_425934 ?auto_425935 ?auto_425936 ?auto_425937 ?auto_425938 ?auto_425939 ?auto_425940 ?auto_425941 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_425955 - BLOCK
      ?auto_425956 - BLOCK
      ?auto_425957 - BLOCK
      ?auto_425958 - BLOCK
      ?auto_425959 - BLOCK
      ?auto_425960 - BLOCK
      ?auto_425961 - BLOCK
      ?auto_425962 - BLOCK
      ?auto_425963 - BLOCK
      ?auto_425964 - BLOCK
      ?auto_425965 - BLOCK
      ?auto_425966 - BLOCK
    )
    :vars
    (
      ?auto_425967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_425966 ?auto_425967 ) ( not ( = ?auto_425955 ?auto_425956 ) ) ( not ( = ?auto_425955 ?auto_425957 ) ) ( not ( = ?auto_425955 ?auto_425958 ) ) ( not ( = ?auto_425955 ?auto_425959 ) ) ( not ( = ?auto_425955 ?auto_425960 ) ) ( not ( = ?auto_425955 ?auto_425961 ) ) ( not ( = ?auto_425955 ?auto_425962 ) ) ( not ( = ?auto_425955 ?auto_425963 ) ) ( not ( = ?auto_425955 ?auto_425964 ) ) ( not ( = ?auto_425955 ?auto_425965 ) ) ( not ( = ?auto_425955 ?auto_425966 ) ) ( not ( = ?auto_425955 ?auto_425967 ) ) ( not ( = ?auto_425956 ?auto_425957 ) ) ( not ( = ?auto_425956 ?auto_425958 ) ) ( not ( = ?auto_425956 ?auto_425959 ) ) ( not ( = ?auto_425956 ?auto_425960 ) ) ( not ( = ?auto_425956 ?auto_425961 ) ) ( not ( = ?auto_425956 ?auto_425962 ) ) ( not ( = ?auto_425956 ?auto_425963 ) ) ( not ( = ?auto_425956 ?auto_425964 ) ) ( not ( = ?auto_425956 ?auto_425965 ) ) ( not ( = ?auto_425956 ?auto_425966 ) ) ( not ( = ?auto_425956 ?auto_425967 ) ) ( not ( = ?auto_425957 ?auto_425958 ) ) ( not ( = ?auto_425957 ?auto_425959 ) ) ( not ( = ?auto_425957 ?auto_425960 ) ) ( not ( = ?auto_425957 ?auto_425961 ) ) ( not ( = ?auto_425957 ?auto_425962 ) ) ( not ( = ?auto_425957 ?auto_425963 ) ) ( not ( = ?auto_425957 ?auto_425964 ) ) ( not ( = ?auto_425957 ?auto_425965 ) ) ( not ( = ?auto_425957 ?auto_425966 ) ) ( not ( = ?auto_425957 ?auto_425967 ) ) ( not ( = ?auto_425958 ?auto_425959 ) ) ( not ( = ?auto_425958 ?auto_425960 ) ) ( not ( = ?auto_425958 ?auto_425961 ) ) ( not ( = ?auto_425958 ?auto_425962 ) ) ( not ( = ?auto_425958 ?auto_425963 ) ) ( not ( = ?auto_425958 ?auto_425964 ) ) ( not ( = ?auto_425958 ?auto_425965 ) ) ( not ( = ?auto_425958 ?auto_425966 ) ) ( not ( = ?auto_425958 ?auto_425967 ) ) ( not ( = ?auto_425959 ?auto_425960 ) ) ( not ( = ?auto_425959 ?auto_425961 ) ) ( not ( = ?auto_425959 ?auto_425962 ) ) ( not ( = ?auto_425959 ?auto_425963 ) ) ( not ( = ?auto_425959 ?auto_425964 ) ) ( not ( = ?auto_425959 ?auto_425965 ) ) ( not ( = ?auto_425959 ?auto_425966 ) ) ( not ( = ?auto_425959 ?auto_425967 ) ) ( not ( = ?auto_425960 ?auto_425961 ) ) ( not ( = ?auto_425960 ?auto_425962 ) ) ( not ( = ?auto_425960 ?auto_425963 ) ) ( not ( = ?auto_425960 ?auto_425964 ) ) ( not ( = ?auto_425960 ?auto_425965 ) ) ( not ( = ?auto_425960 ?auto_425966 ) ) ( not ( = ?auto_425960 ?auto_425967 ) ) ( not ( = ?auto_425961 ?auto_425962 ) ) ( not ( = ?auto_425961 ?auto_425963 ) ) ( not ( = ?auto_425961 ?auto_425964 ) ) ( not ( = ?auto_425961 ?auto_425965 ) ) ( not ( = ?auto_425961 ?auto_425966 ) ) ( not ( = ?auto_425961 ?auto_425967 ) ) ( not ( = ?auto_425962 ?auto_425963 ) ) ( not ( = ?auto_425962 ?auto_425964 ) ) ( not ( = ?auto_425962 ?auto_425965 ) ) ( not ( = ?auto_425962 ?auto_425966 ) ) ( not ( = ?auto_425962 ?auto_425967 ) ) ( not ( = ?auto_425963 ?auto_425964 ) ) ( not ( = ?auto_425963 ?auto_425965 ) ) ( not ( = ?auto_425963 ?auto_425966 ) ) ( not ( = ?auto_425963 ?auto_425967 ) ) ( not ( = ?auto_425964 ?auto_425965 ) ) ( not ( = ?auto_425964 ?auto_425966 ) ) ( not ( = ?auto_425964 ?auto_425967 ) ) ( not ( = ?auto_425965 ?auto_425966 ) ) ( not ( = ?auto_425965 ?auto_425967 ) ) ( not ( = ?auto_425966 ?auto_425967 ) ) ( ON ?auto_425965 ?auto_425966 ) ( ON ?auto_425964 ?auto_425965 ) ( ON ?auto_425963 ?auto_425964 ) ( ON ?auto_425962 ?auto_425963 ) ( ON ?auto_425961 ?auto_425962 ) ( ON ?auto_425960 ?auto_425961 ) ( ON ?auto_425959 ?auto_425960 ) ( ON ?auto_425958 ?auto_425959 ) ( ON ?auto_425957 ?auto_425958 ) ( ON ?auto_425956 ?auto_425957 ) ( ON ?auto_425955 ?auto_425956 ) ( CLEAR ?auto_425955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_425955 )
      ( MAKE-12PILE ?auto_425955 ?auto_425956 ?auto_425957 ?auto_425958 ?auto_425959 ?auto_425960 ?auto_425961 ?auto_425962 ?auto_425963 ?auto_425964 ?auto_425965 ?auto_425966 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_425981 - BLOCK
      ?auto_425982 - BLOCK
      ?auto_425983 - BLOCK
      ?auto_425984 - BLOCK
      ?auto_425985 - BLOCK
      ?auto_425986 - BLOCK
      ?auto_425987 - BLOCK
      ?auto_425988 - BLOCK
      ?auto_425989 - BLOCK
      ?auto_425990 - BLOCK
      ?auto_425991 - BLOCK
      ?auto_425992 - BLOCK
      ?auto_425993 - BLOCK
    )
    :vars
    (
      ?auto_425994 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_425992 ) ( ON ?auto_425993 ?auto_425994 ) ( CLEAR ?auto_425993 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_425981 ) ( ON ?auto_425982 ?auto_425981 ) ( ON ?auto_425983 ?auto_425982 ) ( ON ?auto_425984 ?auto_425983 ) ( ON ?auto_425985 ?auto_425984 ) ( ON ?auto_425986 ?auto_425985 ) ( ON ?auto_425987 ?auto_425986 ) ( ON ?auto_425988 ?auto_425987 ) ( ON ?auto_425989 ?auto_425988 ) ( ON ?auto_425990 ?auto_425989 ) ( ON ?auto_425991 ?auto_425990 ) ( ON ?auto_425992 ?auto_425991 ) ( not ( = ?auto_425981 ?auto_425982 ) ) ( not ( = ?auto_425981 ?auto_425983 ) ) ( not ( = ?auto_425981 ?auto_425984 ) ) ( not ( = ?auto_425981 ?auto_425985 ) ) ( not ( = ?auto_425981 ?auto_425986 ) ) ( not ( = ?auto_425981 ?auto_425987 ) ) ( not ( = ?auto_425981 ?auto_425988 ) ) ( not ( = ?auto_425981 ?auto_425989 ) ) ( not ( = ?auto_425981 ?auto_425990 ) ) ( not ( = ?auto_425981 ?auto_425991 ) ) ( not ( = ?auto_425981 ?auto_425992 ) ) ( not ( = ?auto_425981 ?auto_425993 ) ) ( not ( = ?auto_425981 ?auto_425994 ) ) ( not ( = ?auto_425982 ?auto_425983 ) ) ( not ( = ?auto_425982 ?auto_425984 ) ) ( not ( = ?auto_425982 ?auto_425985 ) ) ( not ( = ?auto_425982 ?auto_425986 ) ) ( not ( = ?auto_425982 ?auto_425987 ) ) ( not ( = ?auto_425982 ?auto_425988 ) ) ( not ( = ?auto_425982 ?auto_425989 ) ) ( not ( = ?auto_425982 ?auto_425990 ) ) ( not ( = ?auto_425982 ?auto_425991 ) ) ( not ( = ?auto_425982 ?auto_425992 ) ) ( not ( = ?auto_425982 ?auto_425993 ) ) ( not ( = ?auto_425982 ?auto_425994 ) ) ( not ( = ?auto_425983 ?auto_425984 ) ) ( not ( = ?auto_425983 ?auto_425985 ) ) ( not ( = ?auto_425983 ?auto_425986 ) ) ( not ( = ?auto_425983 ?auto_425987 ) ) ( not ( = ?auto_425983 ?auto_425988 ) ) ( not ( = ?auto_425983 ?auto_425989 ) ) ( not ( = ?auto_425983 ?auto_425990 ) ) ( not ( = ?auto_425983 ?auto_425991 ) ) ( not ( = ?auto_425983 ?auto_425992 ) ) ( not ( = ?auto_425983 ?auto_425993 ) ) ( not ( = ?auto_425983 ?auto_425994 ) ) ( not ( = ?auto_425984 ?auto_425985 ) ) ( not ( = ?auto_425984 ?auto_425986 ) ) ( not ( = ?auto_425984 ?auto_425987 ) ) ( not ( = ?auto_425984 ?auto_425988 ) ) ( not ( = ?auto_425984 ?auto_425989 ) ) ( not ( = ?auto_425984 ?auto_425990 ) ) ( not ( = ?auto_425984 ?auto_425991 ) ) ( not ( = ?auto_425984 ?auto_425992 ) ) ( not ( = ?auto_425984 ?auto_425993 ) ) ( not ( = ?auto_425984 ?auto_425994 ) ) ( not ( = ?auto_425985 ?auto_425986 ) ) ( not ( = ?auto_425985 ?auto_425987 ) ) ( not ( = ?auto_425985 ?auto_425988 ) ) ( not ( = ?auto_425985 ?auto_425989 ) ) ( not ( = ?auto_425985 ?auto_425990 ) ) ( not ( = ?auto_425985 ?auto_425991 ) ) ( not ( = ?auto_425985 ?auto_425992 ) ) ( not ( = ?auto_425985 ?auto_425993 ) ) ( not ( = ?auto_425985 ?auto_425994 ) ) ( not ( = ?auto_425986 ?auto_425987 ) ) ( not ( = ?auto_425986 ?auto_425988 ) ) ( not ( = ?auto_425986 ?auto_425989 ) ) ( not ( = ?auto_425986 ?auto_425990 ) ) ( not ( = ?auto_425986 ?auto_425991 ) ) ( not ( = ?auto_425986 ?auto_425992 ) ) ( not ( = ?auto_425986 ?auto_425993 ) ) ( not ( = ?auto_425986 ?auto_425994 ) ) ( not ( = ?auto_425987 ?auto_425988 ) ) ( not ( = ?auto_425987 ?auto_425989 ) ) ( not ( = ?auto_425987 ?auto_425990 ) ) ( not ( = ?auto_425987 ?auto_425991 ) ) ( not ( = ?auto_425987 ?auto_425992 ) ) ( not ( = ?auto_425987 ?auto_425993 ) ) ( not ( = ?auto_425987 ?auto_425994 ) ) ( not ( = ?auto_425988 ?auto_425989 ) ) ( not ( = ?auto_425988 ?auto_425990 ) ) ( not ( = ?auto_425988 ?auto_425991 ) ) ( not ( = ?auto_425988 ?auto_425992 ) ) ( not ( = ?auto_425988 ?auto_425993 ) ) ( not ( = ?auto_425988 ?auto_425994 ) ) ( not ( = ?auto_425989 ?auto_425990 ) ) ( not ( = ?auto_425989 ?auto_425991 ) ) ( not ( = ?auto_425989 ?auto_425992 ) ) ( not ( = ?auto_425989 ?auto_425993 ) ) ( not ( = ?auto_425989 ?auto_425994 ) ) ( not ( = ?auto_425990 ?auto_425991 ) ) ( not ( = ?auto_425990 ?auto_425992 ) ) ( not ( = ?auto_425990 ?auto_425993 ) ) ( not ( = ?auto_425990 ?auto_425994 ) ) ( not ( = ?auto_425991 ?auto_425992 ) ) ( not ( = ?auto_425991 ?auto_425993 ) ) ( not ( = ?auto_425991 ?auto_425994 ) ) ( not ( = ?auto_425992 ?auto_425993 ) ) ( not ( = ?auto_425992 ?auto_425994 ) ) ( not ( = ?auto_425993 ?auto_425994 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_425993 ?auto_425994 )
      ( !STACK ?auto_425993 ?auto_425992 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_426008 - BLOCK
      ?auto_426009 - BLOCK
      ?auto_426010 - BLOCK
      ?auto_426011 - BLOCK
      ?auto_426012 - BLOCK
      ?auto_426013 - BLOCK
      ?auto_426014 - BLOCK
      ?auto_426015 - BLOCK
      ?auto_426016 - BLOCK
      ?auto_426017 - BLOCK
      ?auto_426018 - BLOCK
      ?auto_426019 - BLOCK
      ?auto_426020 - BLOCK
    )
    :vars
    (
      ?auto_426021 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_426019 ) ( ON ?auto_426020 ?auto_426021 ) ( CLEAR ?auto_426020 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_426008 ) ( ON ?auto_426009 ?auto_426008 ) ( ON ?auto_426010 ?auto_426009 ) ( ON ?auto_426011 ?auto_426010 ) ( ON ?auto_426012 ?auto_426011 ) ( ON ?auto_426013 ?auto_426012 ) ( ON ?auto_426014 ?auto_426013 ) ( ON ?auto_426015 ?auto_426014 ) ( ON ?auto_426016 ?auto_426015 ) ( ON ?auto_426017 ?auto_426016 ) ( ON ?auto_426018 ?auto_426017 ) ( ON ?auto_426019 ?auto_426018 ) ( not ( = ?auto_426008 ?auto_426009 ) ) ( not ( = ?auto_426008 ?auto_426010 ) ) ( not ( = ?auto_426008 ?auto_426011 ) ) ( not ( = ?auto_426008 ?auto_426012 ) ) ( not ( = ?auto_426008 ?auto_426013 ) ) ( not ( = ?auto_426008 ?auto_426014 ) ) ( not ( = ?auto_426008 ?auto_426015 ) ) ( not ( = ?auto_426008 ?auto_426016 ) ) ( not ( = ?auto_426008 ?auto_426017 ) ) ( not ( = ?auto_426008 ?auto_426018 ) ) ( not ( = ?auto_426008 ?auto_426019 ) ) ( not ( = ?auto_426008 ?auto_426020 ) ) ( not ( = ?auto_426008 ?auto_426021 ) ) ( not ( = ?auto_426009 ?auto_426010 ) ) ( not ( = ?auto_426009 ?auto_426011 ) ) ( not ( = ?auto_426009 ?auto_426012 ) ) ( not ( = ?auto_426009 ?auto_426013 ) ) ( not ( = ?auto_426009 ?auto_426014 ) ) ( not ( = ?auto_426009 ?auto_426015 ) ) ( not ( = ?auto_426009 ?auto_426016 ) ) ( not ( = ?auto_426009 ?auto_426017 ) ) ( not ( = ?auto_426009 ?auto_426018 ) ) ( not ( = ?auto_426009 ?auto_426019 ) ) ( not ( = ?auto_426009 ?auto_426020 ) ) ( not ( = ?auto_426009 ?auto_426021 ) ) ( not ( = ?auto_426010 ?auto_426011 ) ) ( not ( = ?auto_426010 ?auto_426012 ) ) ( not ( = ?auto_426010 ?auto_426013 ) ) ( not ( = ?auto_426010 ?auto_426014 ) ) ( not ( = ?auto_426010 ?auto_426015 ) ) ( not ( = ?auto_426010 ?auto_426016 ) ) ( not ( = ?auto_426010 ?auto_426017 ) ) ( not ( = ?auto_426010 ?auto_426018 ) ) ( not ( = ?auto_426010 ?auto_426019 ) ) ( not ( = ?auto_426010 ?auto_426020 ) ) ( not ( = ?auto_426010 ?auto_426021 ) ) ( not ( = ?auto_426011 ?auto_426012 ) ) ( not ( = ?auto_426011 ?auto_426013 ) ) ( not ( = ?auto_426011 ?auto_426014 ) ) ( not ( = ?auto_426011 ?auto_426015 ) ) ( not ( = ?auto_426011 ?auto_426016 ) ) ( not ( = ?auto_426011 ?auto_426017 ) ) ( not ( = ?auto_426011 ?auto_426018 ) ) ( not ( = ?auto_426011 ?auto_426019 ) ) ( not ( = ?auto_426011 ?auto_426020 ) ) ( not ( = ?auto_426011 ?auto_426021 ) ) ( not ( = ?auto_426012 ?auto_426013 ) ) ( not ( = ?auto_426012 ?auto_426014 ) ) ( not ( = ?auto_426012 ?auto_426015 ) ) ( not ( = ?auto_426012 ?auto_426016 ) ) ( not ( = ?auto_426012 ?auto_426017 ) ) ( not ( = ?auto_426012 ?auto_426018 ) ) ( not ( = ?auto_426012 ?auto_426019 ) ) ( not ( = ?auto_426012 ?auto_426020 ) ) ( not ( = ?auto_426012 ?auto_426021 ) ) ( not ( = ?auto_426013 ?auto_426014 ) ) ( not ( = ?auto_426013 ?auto_426015 ) ) ( not ( = ?auto_426013 ?auto_426016 ) ) ( not ( = ?auto_426013 ?auto_426017 ) ) ( not ( = ?auto_426013 ?auto_426018 ) ) ( not ( = ?auto_426013 ?auto_426019 ) ) ( not ( = ?auto_426013 ?auto_426020 ) ) ( not ( = ?auto_426013 ?auto_426021 ) ) ( not ( = ?auto_426014 ?auto_426015 ) ) ( not ( = ?auto_426014 ?auto_426016 ) ) ( not ( = ?auto_426014 ?auto_426017 ) ) ( not ( = ?auto_426014 ?auto_426018 ) ) ( not ( = ?auto_426014 ?auto_426019 ) ) ( not ( = ?auto_426014 ?auto_426020 ) ) ( not ( = ?auto_426014 ?auto_426021 ) ) ( not ( = ?auto_426015 ?auto_426016 ) ) ( not ( = ?auto_426015 ?auto_426017 ) ) ( not ( = ?auto_426015 ?auto_426018 ) ) ( not ( = ?auto_426015 ?auto_426019 ) ) ( not ( = ?auto_426015 ?auto_426020 ) ) ( not ( = ?auto_426015 ?auto_426021 ) ) ( not ( = ?auto_426016 ?auto_426017 ) ) ( not ( = ?auto_426016 ?auto_426018 ) ) ( not ( = ?auto_426016 ?auto_426019 ) ) ( not ( = ?auto_426016 ?auto_426020 ) ) ( not ( = ?auto_426016 ?auto_426021 ) ) ( not ( = ?auto_426017 ?auto_426018 ) ) ( not ( = ?auto_426017 ?auto_426019 ) ) ( not ( = ?auto_426017 ?auto_426020 ) ) ( not ( = ?auto_426017 ?auto_426021 ) ) ( not ( = ?auto_426018 ?auto_426019 ) ) ( not ( = ?auto_426018 ?auto_426020 ) ) ( not ( = ?auto_426018 ?auto_426021 ) ) ( not ( = ?auto_426019 ?auto_426020 ) ) ( not ( = ?auto_426019 ?auto_426021 ) ) ( not ( = ?auto_426020 ?auto_426021 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_426020 ?auto_426021 )
      ( !STACK ?auto_426020 ?auto_426019 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_426035 - BLOCK
      ?auto_426036 - BLOCK
      ?auto_426037 - BLOCK
      ?auto_426038 - BLOCK
      ?auto_426039 - BLOCK
      ?auto_426040 - BLOCK
      ?auto_426041 - BLOCK
      ?auto_426042 - BLOCK
      ?auto_426043 - BLOCK
      ?auto_426044 - BLOCK
      ?auto_426045 - BLOCK
      ?auto_426046 - BLOCK
      ?auto_426047 - BLOCK
    )
    :vars
    (
      ?auto_426048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426047 ?auto_426048 ) ( ON-TABLE ?auto_426035 ) ( ON ?auto_426036 ?auto_426035 ) ( ON ?auto_426037 ?auto_426036 ) ( ON ?auto_426038 ?auto_426037 ) ( ON ?auto_426039 ?auto_426038 ) ( ON ?auto_426040 ?auto_426039 ) ( ON ?auto_426041 ?auto_426040 ) ( ON ?auto_426042 ?auto_426041 ) ( ON ?auto_426043 ?auto_426042 ) ( ON ?auto_426044 ?auto_426043 ) ( ON ?auto_426045 ?auto_426044 ) ( not ( = ?auto_426035 ?auto_426036 ) ) ( not ( = ?auto_426035 ?auto_426037 ) ) ( not ( = ?auto_426035 ?auto_426038 ) ) ( not ( = ?auto_426035 ?auto_426039 ) ) ( not ( = ?auto_426035 ?auto_426040 ) ) ( not ( = ?auto_426035 ?auto_426041 ) ) ( not ( = ?auto_426035 ?auto_426042 ) ) ( not ( = ?auto_426035 ?auto_426043 ) ) ( not ( = ?auto_426035 ?auto_426044 ) ) ( not ( = ?auto_426035 ?auto_426045 ) ) ( not ( = ?auto_426035 ?auto_426046 ) ) ( not ( = ?auto_426035 ?auto_426047 ) ) ( not ( = ?auto_426035 ?auto_426048 ) ) ( not ( = ?auto_426036 ?auto_426037 ) ) ( not ( = ?auto_426036 ?auto_426038 ) ) ( not ( = ?auto_426036 ?auto_426039 ) ) ( not ( = ?auto_426036 ?auto_426040 ) ) ( not ( = ?auto_426036 ?auto_426041 ) ) ( not ( = ?auto_426036 ?auto_426042 ) ) ( not ( = ?auto_426036 ?auto_426043 ) ) ( not ( = ?auto_426036 ?auto_426044 ) ) ( not ( = ?auto_426036 ?auto_426045 ) ) ( not ( = ?auto_426036 ?auto_426046 ) ) ( not ( = ?auto_426036 ?auto_426047 ) ) ( not ( = ?auto_426036 ?auto_426048 ) ) ( not ( = ?auto_426037 ?auto_426038 ) ) ( not ( = ?auto_426037 ?auto_426039 ) ) ( not ( = ?auto_426037 ?auto_426040 ) ) ( not ( = ?auto_426037 ?auto_426041 ) ) ( not ( = ?auto_426037 ?auto_426042 ) ) ( not ( = ?auto_426037 ?auto_426043 ) ) ( not ( = ?auto_426037 ?auto_426044 ) ) ( not ( = ?auto_426037 ?auto_426045 ) ) ( not ( = ?auto_426037 ?auto_426046 ) ) ( not ( = ?auto_426037 ?auto_426047 ) ) ( not ( = ?auto_426037 ?auto_426048 ) ) ( not ( = ?auto_426038 ?auto_426039 ) ) ( not ( = ?auto_426038 ?auto_426040 ) ) ( not ( = ?auto_426038 ?auto_426041 ) ) ( not ( = ?auto_426038 ?auto_426042 ) ) ( not ( = ?auto_426038 ?auto_426043 ) ) ( not ( = ?auto_426038 ?auto_426044 ) ) ( not ( = ?auto_426038 ?auto_426045 ) ) ( not ( = ?auto_426038 ?auto_426046 ) ) ( not ( = ?auto_426038 ?auto_426047 ) ) ( not ( = ?auto_426038 ?auto_426048 ) ) ( not ( = ?auto_426039 ?auto_426040 ) ) ( not ( = ?auto_426039 ?auto_426041 ) ) ( not ( = ?auto_426039 ?auto_426042 ) ) ( not ( = ?auto_426039 ?auto_426043 ) ) ( not ( = ?auto_426039 ?auto_426044 ) ) ( not ( = ?auto_426039 ?auto_426045 ) ) ( not ( = ?auto_426039 ?auto_426046 ) ) ( not ( = ?auto_426039 ?auto_426047 ) ) ( not ( = ?auto_426039 ?auto_426048 ) ) ( not ( = ?auto_426040 ?auto_426041 ) ) ( not ( = ?auto_426040 ?auto_426042 ) ) ( not ( = ?auto_426040 ?auto_426043 ) ) ( not ( = ?auto_426040 ?auto_426044 ) ) ( not ( = ?auto_426040 ?auto_426045 ) ) ( not ( = ?auto_426040 ?auto_426046 ) ) ( not ( = ?auto_426040 ?auto_426047 ) ) ( not ( = ?auto_426040 ?auto_426048 ) ) ( not ( = ?auto_426041 ?auto_426042 ) ) ( not ( = ?auto_426041 ?auto_426043 ) ) ( not ( = ?auto_426041 ?auto_426044 ) ) ( not ( = ?auto_426041 ?auto_426045 ) ) ( not ( = ?auto_426041 ?auto_426046 ) ) ( not ( = ?auto_426041 ?auto_426047 ) ) ( not ( = ?auto_426041 ?auto_426048 ) ) ( not ( = ?auto_426042 ?auto_426043 ) ) ( not ( = ?auto_426042 ?auto_426044 ) ) ( not ( = ?auto_426042 ?auto_426045 ) ) ( not ( = ?auto_426042 ?auto_426046 ) ) ( not ( = ?auto_426042 ?auto_426047 ) ) ( not ( = ?auto_426042 ?auto_426048 ) ) ( not ( = ?auto_426043 ?auto_426044 ) ) ( not ( = ?auto_426043 ?auto_426045 ) ) ( not ( = ?auto_426043 ?auto_426046 ) ) ( not ( = ?auto_426043 ?auto_426047 ) ) ( not ( = ?auto_426043 ?auto_426048 ) ) ( not ( = ?auto_426044 ?auto_426045 ) ) ( not ( = ?auto_426044 ?auto_426046 ) ) ( not ( = ?auto_426044 ?auto_426047 ) ) ( not ( = ?auto_426044 ?auto_426048 ) ) ( not ( = ?auto_426045 ?auto_426046 ) ) ( not ( = ?auto_426045 ?auto_426047 ) ) ( not ( = ?auto_426045 ?auto_426048 ) ) ( not ( = ?auto_426046 ?auto_426047 ) ) ( not ( = ?auto_426046 ?auto_426048 ) ) ( not ( = ?auto_426047 ?auto_426048 ) ) ( CLEAR ?auto_426045 ) ( ON ?auto_426046 ?auto_426047 ) ( CLEAR ?auto_426046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_426035 ?auto_426036 ?auto_426037 ?auto_426038 ?auto_426039 ?auto_426040 ?auto_426041 ?auto_426042 ?auto_426043 ?auto_426044 ?auto_426045 ?auto_426046 )
      ( MAKE-13PILE ?auto_426035 ?auto_426036 ?auto_426037 ?auto_426038 ?auto_426039 ?auto_426040 ?auto_426041 ?auto_426042 ?auto_426043 ?auto_426044 ?auto_426045 ?auto_426046 ?auto_426047 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_426062 - BLOCK
      ?auto_426063 - BLOCK
      ?auto_426064 - BLOCK
      ?auto_426065 - BLOCK
      ?auto_426066 - BLOCK
      ?auto_426067 - BLOCK
      ?auto_426068 - BLOCK
      ?auto_426069 - BLOCK
      ?auto_426070 - BLOCK
      ?auto_426071 - BLOCK
      ?auto_426072 - BLOCK
      ?auto_426073 - BLOCK
      ?auto_426074 - BLOCK
    )
    :vars
    (
      ?auto_426075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426074 ?auto_426075 ) ( ON-TABLE ?auto_426062 ) ( ON ?auto_426063 ?auto_426062 ) ( ON ?auto_426064 ?auto_426063 ) ( ON ?auto_426065 ?auto_426064 ) ( ON ?auto_426066 ?auto_426065 ) ( ON ?auto_426067 ?auto_426066 ) ( ON ?auto_426068 ?auto_426067 ) ( ON ?auto_426069 ?auto_426068 ) ( ON ?auto_426070 ?auto_426069 ) ( ON ?auto_426071 ?auto_426070 ) ( ON ?auto_426072 ?auto_426071 ) ( not ( = ?auto_426062 ?auto_426063 ) ) ( not ( = ?auto_426062 ?auto_426064 ) ) ( not ( = ?auto_426062 ?auto_426065 ) ) ( not ( = ?auto_426062 ?auto_426066 ) ) ( not ( = ?auto_426062 ?auto_426067 ) ) ( not ( = ?auto_426062 ?auto_426068 ) ) ( not ( = ?auto_426062 ?auto_426069 ) ) ( not ( = ?auto_426062 ?auto_426070 ) ) ( not ( = ?auto_426062 ?auto_426071 ) ) ( not ( = ?auto_426062 ?auto_426072 ) ) ( not ( = ?auto_426062 ?auto_426073 ) ) ( not ( = ?auto_426062 ?auto_426074 ) ) ( not ( = ?auto_426062 ?auto_426075 ) ) ( not ( = ?auto_426063 ?auto_426064 ) ) ( not ( = ?auto_426063 ?auto_426065 ) ) ( not ( = ?auto_426063 ?auto_426066 ) ) ( not ( = ?auto_426063 ?auto_426067 ) ) ( not ( = ?auto_426063 ?auto_426068 ) ) ( not ( = ?auto_426063 ?auto_426069 ) ) ( not ( = ?auto_426063 ?auto_426070 ) ) ( not ( = ?auto_426063 ?auto_426071 ) ) ( not ( = ?auto_426063 ?auto_426072 ) ) ( not ( = ?auto_426063 ?auto_426073 ) ) ( not ( = ?auto_426063 ?auto_426074 ) ) ( not ( = ?auto_426063 ?auto_426075 ) ) ( not ( = ?auto_426064 ?auto_426065 ) ) ( not ( = ?auto_426064 ?auto_426066 ) ) ( not ( = ?auto_426064 ?auto_426067 ) ) ( not ( = ?auto_426064 ?auto_426068 ) ) ( not ( = ?auto_426064 ?auto_426069 ) ) ( not ( = ?auto_426064 ?auto_426070 ) ) ( not ( = ?auto_426064 ?auto_426071 ) ) ( not ( = ?auto_426064 ?auto_426072 ) ) ( not ( = ?auto_426064 ?auto_426073 ) ) ( not ( = ?auto_426064 ?auto_426074 ) ) ( not ( = ?auto_426064 ?auto_426075 ) ) ( not ( = ?auto_426065 ?auto_426066 ) ) ( not ( = ?auto_426065 ?auto_426067 ) ) ( not ( = ?auto_426065 ?auto_426068 ) ) ( not ( = ?auto_426065 ?auto_426069 ) ) ( not ( = ?auto_426065 ?auto_426070 ) ) ( not ( = ?auto_426065 ?auto_426071 ) ) ( not ( = ?auto_426065 ?auto_426072 ) ) ( not ( = ?auto_426065 ?auto_426073 ) ) ( not ( = ?auto_426065 ?auto_426074 ) ) ( not ( = ?auto_426065 ?auto_426075 ) ) ( not ( = ?auto_426066 ?auto_426067 ) ) ( not ( = ?auto_426066 ?auto_426068 ) ) ( not ( = ?auto_426066 ?auto_426069 ) ) ( not ( = ?auto_426066 ?auto_426070 ) ) ( not ( = ?auto_426066 ?auto_426071 ) ) ( not ( = ?auto_426066 ?auto_426072 ) ) ( not ( = ?auto_426066 ?auto_426073 ) ) ( not ( = ?auto_426066 ?auto_426074 ) ) ( not ( = ?auto_426066 ?auto_426075 ) ) ( not ( = ?auto_426067 ?auto_426068 ) ) ( not ( = ?auto_426067 ?auto_426069 ) ) ( not ( = ?auto_426067 ?auto_426070 ) ) ( not ( = ?auto_426067 ?auto_426071 ) ) ( not ( = ?auto_426067 ?auto_426072 ) ) ( not ( = ?auto_426067 ?auto_426073 ) ) ( not ( = ?auto_426067 ?auto_426074 ) ) ( not ( = ?auto_426067 ?auto_426075 ) ) ( not ( = ?auto_426068 ?auto_426069 ) ) ( not ( = ?auto_426068 ?auto_426070 ) ) ( not ( = ?auto_426068 ?auto_426071 ) ) ( not ( = ?auto_426068 ?auto_426072 ) ) ( not ( = ?auto_426068 ?auto_426073 ) ) ( not ( = ?auto_426068 ?auto_426074 ) ) ( not ( = ?auto_426068 ?auto_426075 ) ) ( not ( = ?auto_426069 ?auto_426070 ) ) ( not ( = ?auto_426069 ?auto_426071 ) ) ( not ( = ?auto_426069 ?auto_426072 ) ) ( not ( = ?auto_426069 ?auto_426073 ) ) ( not ( = ?auto_426069 ?auto_426074 ) ) ( not ( = ?auto_426069 ?auto_426075 ) ) ( not ( = ?auto_426070 ?auto_426071 ) ) ( not ( = ?auto_426070 ?auto_426072 ) ) ( not ( = ?auto_426070 ?auto_426073 ) ) ( not ( = ?auto_426070 ?auto_426074 ) ) ( not ( = ?auto_426070 ?auto_426075 ) ) ( not ( = ?auto_426071 ?auto_426072 ) ) ( not ( = ?auto_426071 ?auto_426073 ) ) ( not ( = ?auto_426071 ?auto_426074 ) ) ( not ( = ?auto_426071 ?auto_426075 ) ) ( not ( = ?auto_426072 ?auto_426073 ) ) ( not ( = ?auto_426072 ?auto_426074 ) ) ( not ( = ?auto_426072 ?auto_426075 ) ) ( not ( = ?auto_426073 ?auto_426074 ) ) ( not ( = ?auto_426073 ?auto_426075 ) ) ( not ( = ?auto_426074 ?auto_426075 ) ) ( CLEAR ?auto_426072 ) ( ON ?auto_426073 ?auto_426074 ) ( CLEAR ?auto_426073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_426062 ?auto_426063 ?auto_426064 ?auto_426065 ?auto_426066 ?auto_426067 ?auto_426068 ?auto_426069 ?auto_426070 ?auto_426071 ?auto_426072 ?auto_426073 )
      ( MAKE-13PILE ?auto_426062 ?auto_426063 ?auto_426064 ?auto_426065 ?auto_426066 ?auto_426067 ?auto_426068 ?auto_426069 ?auto_426070 ?auto_426071 ?auto_426072 ?auto_426073 ?auto_426074 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_426089 - BLOCK
      ?auto_426090 - BLOCK
      ?auto_426091 - BLOCK
      ?auto_426092 - BLOCK
      ?auto_426093 - BLOCK
      ?auto_426094 - BLOCK
      ?auto_426095 - BLOCK
      ?auto_426096 - BLOCK
      ?auto_426097 - BLOCK
      ?auto_426098 - BLOCK
      ?auto_426099 - BLOCK
      ?auto_426100 - BLOCK
      ?auto_426101 - BLOCK
    )
    :vars
    (
      ?auto_426102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426101 ?auto_426102 ) ( ON-TABLE ?auto_426089 ) ( ON ?auto_426090 ?auto_426089 ) ( ON ?auto_426091 ?auto_426090 ) ( ON ?auto_426092 ?auto_426091 ) ( ON ?auto_426093 ?auto_426092 ) ( ON ?auto_426094 ?auto_426093 ) ( ON ?auto_426095 ?auto_426094 ) ( ON ?auto_426096 ?auto_426095 ) ( ON ?auto_426097 ?auto_426096 ) ( ON ?auto_426098 ?auto_426097 ) ( not ( = ?auto_426089 ?auto_426090 ) ) ( not ( = ?auto_426089 ?auto_426091 ) ) ( not ( = ?auto_426089 ?auto_426092 ) ) ( not ( = ?auto_426089 ?auto_426093 ) ) ( not ( = ?auto_426089 ?auto_426094 ) ) ( not ( = ?auto_426089 ?auto_426095 ) ) ( not ( = ?auto_426089 ?auto_426096 ) ) ( not ( = ?auto_426089 ?auto_426097 ) ) ( not ( = ?auto_426089 ?auto_426098 ) ) ( not ( = ?auto_426089 ?auto_426099 ) ) ( not ( = ?auto_426089 ?auto_426100 ) ) ( not ( = ?auto_426089 ?auto_426101 ) ) ( not ( = ?auto_426089 ?auto_426102 ) ) ( not ( = ?auto_426090 ?auto_426091 ) ) ( not ( = ?auto_426090 ?auto_426092 ) ) ( not ( = ?auto_426090 ?auto_426093 ) ) ( not ( = ?auto_426090 ?auto_426094 ) ) ( not ( = ?auto_426090 ?auto_426095 ) ) ( not ( = ?auto_426090 ?auto_426096 ) ) ( not ( = ?auto_426090 ?auto_426097 ) ) ( not ( = ?auto_426090 ?auto_426098 ) ) ( not ( = ?auto_426090 ?auto_426099 ) ) ( not ( = ?auto_426090 ?auto_426100 ) ) ( not ( = ?auto_426090 ?auto_426101 ) ) ( not ( = ?auto_426090 ?auto_426102 ) ) ( not ( = ?auto_426091 ?auto_426092 ) ) ( not ( = ?auto_426091 ?auto_426093 ) ) ( not ( = ?auto_426091 ?auto_426094 ) ) ( not ( = ?auto_426091 ?auto_426095 ) ) ( not ( = ?auto_426091 ?auto_426096 ) ) ( not ( = ?auto_426091 ?auto_426097 ) ) ( not ( = ?auto_426091 ?auto_426098 ) ) ( not ( = ?auto_426091 ?auto_426099 ) ) ( not ( = ?auto_426091 ?auto_426100 ) ) ( not ( = ?auto_426091 ?auto_426101 ) ) ( not ( = ?auto_426091 ?auto_426102 ) ) ( not ( = ?auto_426092 ?auto_426093 ) ) ( not ( = ?auto_426092 ?auto_426094 ) ) ( not ( = ?auto_426092 ?auto_426095 ) ) ( not ( = ?auto_426092 ?auto_426096 ) ) ( not ( = ?auto_426092 ?auto_426097 ) ) ( not ( = ?auto_426092 ?auto_426098 ) ) ( not ( = ?auto_426092 ?auto_426099 ) ) ( not ( = ?auto_426092 ?auto_426100 ) ) ( not ( = ?auto_426092 ?auto_426101 ) ) ( not ( = ?auto_426092 ?auto_426102 ) ) ( not ( = ?auto_426093 ?auto_426094 ) ) ( not ( = ?auto_426093 ?auto_426095 ) ) ( not ( = ?auto_426093 ?auto_426096 ) ) ( not ( = ?auto_426093 ?auto_426097 ) ) ( not ( = ?auto_426093 ?auto_426098 ) ) ( not ( = ?auto_426093 ?auto_426099 ) ) ( not ( = ?auto_426093 ?auto_426100 ) ) ( not ( = ?auto_426093 ?auto_426101 ) ) ( not ( = ?auto_426093 ?auto_426102 ) ) ( not ( = ?auto_426094 ?auto_426095 ) ) ( not ( = ?auto_426094 ?auto_426096 ) ) ( not ( = ?auto_426094 ?auto_426097 ) ) ( not ( = ?auto_426094 ?auto_426098 ) ) ( not ( = ?auto_426094 ?auto_426099 ) ) ( not ( = ?auto_426094 ?auto_426100 ) ) ( not ( = ?auto_426094 ?auto_426101 ) ) ( not ( = ?auto_426094 ?auto_426102 ) ) ( not ( = ?auto_426095 ?auto_426096 ) ) ( not ( = ?auto_426095 ?auto_426097 ) ) ( not ( = ?auto_426095 ?auto_426098 ) ) ( not ( = ?auto_426095 ?auto_426099 ) ) ( not ( = ?auto_426095 ?auto_426100 ) ) ( not ( = ?auto_426095 ?auto_426101 ) ) ( not ( = ?auto_426095 ?auto_426102 ) ) ( not ( = ?auto_426096 ?auto_426097 ) ) ( not ( = ?auto_426096 ?auto_426098 ) ) ( not ( = ?auto_426096 ?auto_426099 ) ) ( not ( = ?auto_426096 ?auto_426100 ) ) ( not ( = ?auto_426096 ?auto_426101 ) ) ( not ( = ?auto_426096 ?auto_426102 ) ) ( not ( = ?auto_426097 ?auto_426098 ) ) ( not ( = ?auto_426097 ?auto_426099 ) ) ( not ( = ?auto_426097 ?auto_426100 ) ) ( not ( = ?auto_426097 ?auto_426101 ) ) ( not ( = ?auto_426097 ?auto_426102 ) ) ( not ( = ?auto_426098 ?auto_426099 ) ) ( not ( = ?auto_426098 ?auto_426100 ) ) ( not ( = ?auto_426098 ?auto_426101 ) ) ( not ( = ?auto_426098 ?auto_426102 ) ) ( not ( = ?auto_426099 ?auto_426100 ) ) ( not ( = ?auto_426099 ?auto_426101 ) ) ( not ( = ?auto_426099 ?auto_426102 ) ) ( not ( = ?auto_426100 ?auto_426101 ) ) ( not ( = ?auto_426100 ?auto_426102 ) ) ( not ( = ?auto_426101 ?auto_426102 ) ) ( ON ?auto_426100 ?auto_426101 ) ( CLEAR ?auto_426098 ) ( ON ?auto_426099 ?auto_426100 ) ( CLEAR ?auto_426099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_426089 ?auto_426090 ?auto_426091 ?auto_426092 ?auto_426093 ?auto_426094 ?auto_426095 ?auto_426096 ?auto_426097 ?auto_426098 ?auto_426099 )
      ( MAKE-13PILE ?auto_426089 ?auto_426090 ?auto_426091 ?auto_426092 ?auto_426093 ?auto_426094 ?auto_426095 ?auto_426096 ?auto_426097 ?auto_426098 ?auto_426099 ?auto_426100 ?auto_426101 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_426116 - BLOCK
      ?auto_426117 - BLOCK
      ?auto_426118 - BLOCK
      ?auto_426119 - BLOCK
      ?auto_426120 - BLOCK
      ?auto_426121 - BLOCK
      ?auto_426122 - BLOCK
      ?auto_426123 - BLOCK
      ?auto_426124 - BLOCK
      ?auto_426125 - BLOCK
      ?auto_426126 - BLOCK
      ?auto_426127 - BLOCK
      ?auto_426128 - BLOCK
    )
    :vars
    (
      ?auto_426129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426128 ?auto_426129 ) ( ON-TABLE ?auto_426116 ) ( ON ?auto_426117 ?auto_426116 ) ( ON ?auto_426118 ?auto_426117 ) ( ON ?auto_426119 ?auto_426118 ) ( ON ?auto_426120 ?auto_426119 ) ( ON ?auto_426121 ?auto_426120 ) ( ON ?auto_426122 ?auto_426121 ) ( ON ?auto_426123 ?auto_426122 ) ( ON ?auto_426124 ?auto_426123 ) ( ON ?auto_426125 ?auto_426124 ) ( not ( = ?auto_426116 ?auto_426117 ) ) ( not ( = ?auto_426116 ?auto_426118 ) ) ( not ( = ?auto_426116 ?auto_426119 ) ) ( not ( = ?auto_426116 ?auto_426120 ) ) ( not ( = ?auto_426116 ?auto_426121 ) ) ( not ( = ?auto_426116 ?auto_426122 ) ) ( not ( = ?auto_426116 ?auto_426123 ) ) ( not ( = ?auto_426116 ?auto_426124 ) ) ( not ( = ?auto_426116 ?auto_426125 ) ) ( not ( = ?auto_426116 ?auto_426126 ) ) ( not ( = ?auto_426116 ?auto_426127 ) ) ( not ( = ?auto_426116 ?auto_426128 ) ) ( not ( = ?auto_426116 ?auto_426129 ) ) ( not ( = ?auto_426117 ?auto_426118 ) ) ( not ( = ?auto_426117 ?auto_426119 ) ) ( not ( = ?auto_426117 ?auto_426120 ) ) ( not ( = ?auto_426117 ?auto_426121 ) ) ( not ( = ?auto_426117 ?auto_426122 ) ) ( not ( = ?auto_426117 ?auto_426123 ) ) ( not ( = ?auto_426117 ?auto_426124 ) ) ( not ( = ?auto_426117 ?auto_426125 ) ) ( not ( = ?auto_426117 ?auto_426126 ) ) ( not ( = ?auto_426117 ?auto_426127 ) ) ( not ( = ?auto_426117 ?auto_426128 ) ) ( not ( = ?auto_426117 ?auto_426129 ) ) ( not ( = ?auto_426118 ?auto_426119 ) ) ( not ( = ?auto_426118 ?auto_426120 ) ) ( not ( = ?auto_426118 ?auto_426121 ) ) ( not ( = ?auto_426118 ?auto_426122 ) ) ( not ( = ?auto_426118 ?auto_426123 ) ) ( not ( = ?auto_426118 ?auto_426124 ) ) ( not ( = ?auto_426118 ?auto_426125 ) ) ( not ( = ?auto_426118 ?auto_426126 ) ) ( not ( = ?auto_426118 ?auto_426127 ) ) ( not ( = ?auto_426118 ?auto_426128 ) ) ( not ( = ?auto_426118 ?auto_426129 ) ) ( not ( = ?auto_426119 ?auto_426120 ) ) ( not ( = ?auto_426119 ?auto_426121 ) ) ( not ( = ?auto_426119 ?auto_426122 ) ) ( not ( = ?auto_426119 ?auto_426123 ) ) ( not ( = ?auto_426119 ?auto_426124 ) ) ( not ( = ?auto_426119 ?auto_426125 ) ) ( not ( = ?auto_426119 ?auto_426126 ) ) ( not ( = ?auto_426119 ?auto_426127 ) ) ( not ( = ?auto_426119 ?auto_426128 ) ) ( not ( = ?auto_426119 ?auto_426129 ) ) ( not ( = ?auto_426120 ?auto_426121 ) ) ( not ( = ?auto_426120 ?auto_426122 ) ) ( not ( = ?auto_426120 ?auto_426123 ) ) ( not ( = ?auto_426120 ?auto_426124 ) ) ( not ( = ?auto_426120 ?auto_426125 ) ) ( not ( = ?auto_426120 ?auto_426126 ) ) ( not ( = ?auto_426120 ?auto_426127 ) ) ( not ( = ?auto_426120 ?auto_426128 ) ) ( not ( = ?auto_426120 ?auto_426129 ) ) ( not ( = ?auto_426121 ?auto_426122 ) ) ( not ( = ?auto_426121 ?auto_426123 ) ) ( not ( = ?auto_426121 ?auto_426124 ) ) ( not ( = ?auto_426121 ?auto_426125 ) ) ( not ( = ?auto_426121 ?auto_426126 ) ) ( not ( = ?auto_426121 ?auto_426127 ) ) ( not ( = ?auto_426121 ?auto_426128 ) ) ( not ( = ?auto_426121 ?auto_426129 ) ) ( not ( = ?auto_426122 ?auto_426123 ) ) ( not ( = ?auto_426122 ?auto_426124 ) ) ( not ( = ?auto_426122 ?auto_426125 ) ) ( not ( = ?auto_426122 ?auto_426126 ) ) ( not ( = ?auto_426122 ?auto_426127 ) ) ( not ( = ?auto_426122 ?auto_426128 ) ) ( not ( = ?auto_426122 ?auto_426129 ) ) ( not ( = ?auto_426123 ?auto_426124 ) ) ( not ( = ?auto_426123 ?auto_426125 ) ) ( not ( = ?auto_426123 ?auto_426126 ) ) ( not ( = ?auto_426123 ?auto_426127 ) ) ( not ( = ?auto_426123 ?auto_426128 ) ) ( not ( = ?auto_426123 ?auto_426129 ) ) ( not ( = ?auto_426124 ?auto_426125 ) ) ( not ( = ?auto_426124 ?auto_426126 ) ) ( not ( = ?auto_426124 ?auto_426127 ) ) ( not ( = ?auto_426124 ?auto_426128 ) ) ( not ( = ?auto_426124 ?auto_426129 ) ) ( not ( = ?auto_426125 ?auto_426126 ) ) ( not ( = ?auto_426125 ?auto_426127 ) ) ( not ( = ?auto_426125 ?auto_426128 ) ) ( not ( = ?auto_426125 ?auto_426129 ) ) ( not ( = ?auto_426126 ?auto_426127 ) ) ( not ( = ?auto_426126 ?auto_426128 ) ) ( not ( = ?auto_426126 ?auto_426129 ) ) ( not ( = ?auto_426127 ?auto_426128 ) ) ( not ( = ?auto_426127 ?auto_426129 ) ) ( not ( = ?auto_426128 ?auto_426129 ) ) ( ON ?auto_426127 ?auto_426128 ) ( CLEAR ?auto_426125 ) ( ON ?auto_426126 ?auto_426127 ) ( CLEAR ?auto_426126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_426116 ?auto_426117 ?auto_426118 ?auto_426119 ?auto_426120 ?auto_426121 ?auto_426122 ?auto_426123 ?auto_426124 ?auto_426125 ?auto_426126 )
      ( MAKE-13PILE ?auto_426116 ?auto_426117 ?auto_426118 ?auto_426119 ?auto_426120 ?auto_426121 ?auto_426122 ?auto_426123 ?auto_426124 ?auto_426125 ?auto_426126 ?auto_426127 ?auto_426128 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_426143 - BLOCK
      ?auto_426144 - BLOCK
      ?auto_426145 - BLOCK
      ?auto_426146 - BLOCK
      ?auto_426147 - BLOCK
      ?auto_426148 - BLOCK
      ?auto_426149 - BLOCK
      ?auto_426150 - BLOCK
      ?auto_426151 - BLOCK
      ?auto_426152 - BLOCK
      ?auto_426153 - BLOCK
      ?auto_426154 - BLOCK
      ?auto_426155 - BLOCK
    )
    :vars
    (
      ?auto_426156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426155 ?auto_426156 ) ( ON-TABLE ?auto_426143 ) ( ON ?auto_426144 ?auto_426143 ) ( ON ?auto_426145 ?auto_426144 ) ( ON ?auto_426146 ?auto_426145 ) ( ON ?auto_426147 ?auto_426146 ) ( ON ?auto_426148 ?auto_426147 ) ( ON ?auto_426149 ?auto_426148 ) ( ON ?auto_426150 ?auto_426149 ) ( ON ?auto_426151 ?auto_426150 ) ( not ( = ?auto_426143 ?auto_426144 ) ) ( not ( = ?auto_426143 ?auto_426145 ) ) ( not ( = ?auto_426143 ?auto_426146 ) ) ( not ( = ?auto_426143 ?auto_426147 ) ) ( not ( = ?auto_426143 ?auto_426148 ) ) ( not ( = ?auto_426143 ?auto_426149 ) ) ( not ( = ?auto_426143 ?auto_426150 ) ) ( not ( = ?auto_426143 ?auto_426151 ) ) ( not ( = ?auto_426143 ?auto_426152 ) ) ( not ( = ?auto_426143 ?auto_426153 ) ) ( not ( = ?auto_426143 ?auto_426154 ) ) ( not ( = ?auto_426143 ?auto_426155 ) ) ( not ( = ?auto_426143 ?auto_426156 ) ) ( not ( = ?auto_426144 ?auto_426145 ) ) ( not ( = ?auto_426144 ?auto_426146 ) ) ( not ( = ?auto_426144 ?auto_426147 ) ) ( not ( = ?auto_426144 ?auto_426148 ) ) ( not ( = ?auto_426144 ?auto_426149 ) ) ( not ( = ?auto_426144 ?auto_426150 ) ) ( not ( = ?auto_426144 ?auto_426151 ) ) ( not ( = ?auto_426144 ?auto_426152 ) ) ( not ( = ?auto_426144 ?auto_426153 ) ) ( not ( = ?auto_426144 ?auto_426154 ) ) ( not ( = ?auto_426144 ?auto_426155 ) ) ( not ( = ?auto_426144 ?auto_426156 ) ) ( not ( = ?auto_426145 ?auto_426146 ) ) ( not ( = ?auto_426145 ?auto_426147 ) ) ( not ( = ?auto_426145 ?auto_426148 ) ) ( not ( = ?auto_426145 ?auto_426149 ) ) ( not ( = ?auto_426145 ?auto_426150 ) ) ( not ( = ?auto_426145 ?auto_426151 ) ) ( not ( = ?auto_426145 ?auto_426152 ) ) ( not ( = ?auto_426145 ?auto_426153 ) ) ( not ( = ?auto_426145 ?auto_426154 ) ) ( not ( = ?auto_426145 ?auto_426155 ) ) ( not ( = ?auto_426145 ?auto_426156 ) ) ( not ( = ?auto_426146 ?auto_426147 ) ) ( not ( = ?auto_426146 ?auto_426148 ) ) ( not ( = ?auto_426146 ?auto_426149 ) ) ( not ( = ?auto_426146 ?auto_426150 ) ) ( not ( = ?auto_426146 ?auto_426151 ) ) ( not ( = ?auto_426146 ?auto_426152 ) ) ( not ( = ?auto_426146 ?auto_426153 ) ) ( not ( = ?auto_426146 ?auto_426154 ) ) ( not ( = ?auto_426146 ?auto_426155 ) ) ( not ( = ?auto_426146 ?auto_426156 ) ) ( not ( = ?auto_426147 ?auto_426148 ) ) ( not ( = ?auto_426147 ?auto_426149 ) ) ( not ( = ?auto_426147 ?auto_426150 ) ) ( not ( = ?auto_426147 ?auto_426151 ) ) ( not ( = ?auto_426147 ?auto_426152 ) ) ( not ( = ?auto_426147 ?auto_426153 ) ) ( not ( = ?auto_426147 ?auto_426154 ) ) ( not ( = ?auto_426147 ?auto_426155 ) ) ( not ( = ?auto_426147 ?auto_426156 ) ) ( not ( = ?auto_426148 ?auto_426149 ) ) ( not ( = ?auto_426148 ?auto_426150 ) ) ( not ( = ?auto_426148 ?auto_426151 ) ) ( not ( = ?auto_426148 ?auto_426152 ) ) ( not ( = ?auto_426148 ?auto_426153 ) ) ( not ( = ?auto_426148 ?auto_426154 ) ) ( not ( = ?auto_426148 ?auto_426155 ) ) ( not ( = ?auto_426148 ?auto_426156 ) ) ( not ( = ?auto_426149 ?auto_426150 ) ) ( not ( = ?auto_426149 ?auto_426151 ) ) ( not ( = ?auto_426149 ?auto_426152 ) ) ( not ( = ?auto_426149 ?auto_426153 ) ) ( not ( = ?auto_426149 ?auto_426154 ) ) ( not ( = ?auto_426149 ?auto_426155 ) ) ( not ( = ?auto_426149 ?auto_426156 ) ) ( not ( = ?auto_426150 ?auto_426151 ) ) ( not ( = ?auto_426150 ?auto_426152 ) ) ( not ( = ?auto_426150 ?auto_426153 ) ) ( not ( = ?auto_426150 ?auto_426154 ) ) ( not ( = ?auto_426150 ?auto_426155 ) ) ( not ( = ?auto_426150 ?auto_426156 ) ) ( not ( = ?auto_426151 ?auto_426152 ) ) ( not ( = ?auto_426151 ?auto_426153 ) ) ( not ( = ?auto_426151 ?auto_426154 ) ) ( not ( = ?auto_426151 ?auto_426155 ) ) ( not ( = ?auto_426151 ?auto_426156 ) ) ( not ( = ?auto_426152 ?auto_426153 ) ) ( not ( = ?auto_426152 ?auto_426154 ) ) ( not ( = ?auto_426152 ?auto_426155 ) ) ( not ( = ?auto_426152 ?auto_426156 ) ) ( not ( = ?auto_426153 ?auto_426154 ) ) ( not ( = ?auto_426153 ?auto_426155 ) ) ( not ( = ?auto_426153 ?auto_426156 ) ) ( not ( = ?auto_426154 ?auto_426155 ) ) ( not ( = ?auto_426154 ?auto_426156 ) ) ( not ( = ?auto_426155 ?auto_426156 ) ) ( ON ?auto_426154 ?auto_426155 ) ( ON ?auto_426153 ?auto_426154 ) ( CLEAR ?auto_426151 ) ( ON ?auto_426152 ?auto_426153 ) ( CLEAR ?auto_426152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_426143 ?auto_426144 ?auto_426145 ?auto_426146 ?auto_426147 ?auto_426148 ?auto_426149 ?auto_426150 ?auto_426151 ?auto_426152 )
      ( MAKE-13PILE ?auto_426143 ?auto_426144 ?auto_426145 ?auto_426146 ?auto_426147 ?auto_426148 ?auto_426149 ?auto_426150 ?auto_426151 ?auto_426152 ?auto_426153 ?auto_426154 ?auto_426155 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_426170 - BLOCK
      ?auto_426171 - BLOCK
      ?auto_426172 - BLOCK
      ?auto_426173 - BLOCK
      ?auto_426174 - BLOCK
      ?auto_426175 - BLOCK
      ?auto_426176 - BLOCK
      ?auto_426177 - BLOCK
      ?auto_426178 - BLOCK
      ?auto_426179 - BLOCK
      ?auto_426180 - BLOCK
      ?auto_426181 - BLOCK
      ?auto_426182 - BLOCK
    )
    :vars
    (
      ?auto_426183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426182 ?auto_426183 ) ( ON-TABLE ?auto_426170 ) ( ON ?auto_426171 ?auto_426170 ) ( ON ?auto_426172 ?auto_426171 ) ( ON ?auto_426173 ?auto_426172 ) ( ON ?auto_426174 ?auto_426173 ) ( ON ?auto_426175 ?auto_426174 ) ( ON ?auto_426176 ?auto_426175 ) ( ON ?auto_426177 ?auto_426176 ) ( ON ?auto_426178 ?auto_426177 ) ( not ( = ?auto_426170 ?auto_426171 ) ) ( not ( = ?auto_426170 ?auto_426172 ) ) ( not ( = ?auto_426170 ?auto_426173 ) ) ( not ( = ?auto_426170 ?auto_426174 ) ) ( not ( = ?auto_426170 ?auto_426175 ) ) ( not ( = ?auto_426170 ?auto_426176 ) ) ( not ( = ?auto_426170 ?auto_426177 ) ) ( not ( = ?auto_426170 ?auto_426178 ) ) ( not ( = ?auto_426170 ?auto_426179 ) ) ( not ( = ?auto_426170 ?auto_426180 ) ) ( not ( = ?auto_426170 ?auto_426181 ) ) ( not ( = ?auto_426170 ?auto_426182 ) ) ( not ( = ?auto_426170 ?auto_426183 ) ) ( not ( = ?auto_426171 ?auto_426172 ) ) ( not ( = ?auto_426171 ?auto_426173 ) ) ( not ( = ?auto_426171 ?auto_426174 ) ) ( not ( = ?auto_426171 ?auto_426175 ) ) ( not ( = ?auto_426171 ?auto_426176 ) ) ( not ( = ?auto_426171 ?auto_426177 ) ) ( not ( = ?auto_426171 ?auto_426178 ) ) ( not ( = ?auto_426171 ?auto_426179 ) ) ( not ( = ?auto_426171 ?auto_426180 ) ) ( not ( = ?auto_426171 ?auto_426181 ) ) ( not ( = ?auto_426171 ?auto_426182 ) ) ( not ( = ?auto_426171 ?auto_426183 ) ) ( not ( = ?auto_426172 ?auto_426173 ) ) ( not ( = ?auto_426172 ?auto_426174 ) ) ( not ( = ?auto_426172 ?auto_426175 ) ) ( not ( = ?auto_426172 ?auto_426176 ) ) ( not ( = ?auto_426172 ?auto_426177 ) ) ( not ( = ?auto_426172 ?auto_426178 ) ) ( not ( = ?auto_426172 ?auto_426179 ) ) ( not ( = ?auto_426172 ?auto_426180 ) ) ( not ( = ?auto_426172 ?auto_426181 ) ) ( not ( = ?auto_426172 ?auto_426182 ) ) ( not ( = ?auto_426172 ?auto_426183 ) ) ( not ( = ?auto_426173 ?auto_426174 ) ) ( not ( = ?auto_426173 ?auto_426175 ) ) ( not ( = ?auto_426173 ?auto_426176 ) ) ( not ( = ?auto_426173 ?auto_426177 ) ) ( not ( = ?auto_426173 ?auto_426178 ) ) ( not ( = ?auto_426173 ?auto_426179 ) ) ( not ( = ?auto_426173 ?auto_426180 ) ) ( not ( = ?auto_426173 ?auto_426181 ) ) ( not ( = ?auto_426173 ?auto_426182 ) ) ( not ( = ?auto_426173 ?auto_426183 ) ) ( not ( = ?auto_426174 ?auto_426175 ) ) ( not ( = ?auto_426174 ?auto_426176 ) ) ( not ( = ?auto_426174 ?auto_426177 ) ) ( not ( = ?auto_426174 ?auto_426178 ) ) ( not ( = ?auto_426174 ?auto_426179 ) ) ( not ( = ?auto_426174 ?auto_426180 ) ) ( not ( = ?auto_426174 ?auto_426181 ) ) ( not ( = ?auto_426174 ?auto_426182 ) ) ( not ( = ?auto_426174 ?auto_426183 ) ) ( not ( = ?auto_426175 ?auto_426176 ) ) ( not ( = ?auto_426175 ?auto_426177 ) ) ( not ( = ?auto_426175 ?auto_426178 ) ) ( not ( = ?auto_426175 ?auto_426179 ) ) ( not ( = ?auto_426175 ?auto_426180 ) ) ( not ( = ?auto_426175 ?auto_426181 ) ) ( not ( = ?auto_426175 ?auto_426182 ) ) ( not ( = ?auto_426175 ?auto_426183 ) ) ( not ( = ?auto_426176 ?auto_426177 ) ) ( not ( = ?auto_426176 ?auto_426178 ) ) ( not ( = ?auto_426176 ?auto_426179 ) ) ( not ( = ?auto_426176 ?auto_426180 ) ) ( not ( = ?auto_426176 ?auto_426181 ) ) ( not ( = ?auto_426176 ?auto_426182 ) ) ( not ( = ?auto_426176 ?auto_426183 ) ) ( not ( = ?auto_426177 ?auto_426178 ) ) ( not ( = ?auto_426177 ?auto_426179 ) ) ( not ( = ?auto_426177 ?auto_426180 ) ) ( not ( = ?auto_426177 ?auto_426181 ) ) ( not ( = ?auto_426177 ?auto_426182 ) ) ( not ( = ?auto_426177 ?auto_426183 ) ) ( not ( = ?auto_426178 ?auto_426179 ) ) ( not ( = ?auto_426178 ?auto_426180 ) ) ( not ( = ?auto_426178 ?auto_426181 ) ) ( not ( = ?auto_426178 ?auto_426182 ) ) ( not ( = ?auto_426178 ?auto_426183 ) ) ( not ( = ?auto_426179 ?auto_426180 ) ) ( not ( = ?auto_426179 ?auto_426181 ) ) ( not ( = ?auto_426179 ?auto_426182 ) ) ( not ( = ?auto_426179 ?auto_426183 ) ) ( not ( = ?auto_426180 ?auto_426181 ) ) ( not ( = ?auto_426180 ?auto_426182 ) ) ( not ( = ?auto_426180 ?auto_426183 ) ) ( not ( = ?auto_426181 ?auto_426182 ) ) ( not ( = ?auto_426181 ?auto_426183 ) ) ( not ( = ?auto_426182 ?auto_426183 ) ) ( ON ?auto_426181 ?auto_426182 ) ( ON ?auto_426180 ?auto_426181 ) ( CLEAR ?auto_426178 ) ( ON ?auto_426179 ?auto_426180 ) ( CLEAR ?auto_426179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_426170 ?auto_426171 ?auto_426172 ?auto_426173 ?auto_426174 ?auto_426175 ?auto_426176 ?auto_426177 ?auto_426178 ?auto_426179 )
      ( MAKE-13PILE ?auto_426170 ?auto_426171 ?auto_426172 ?auto_426173 ?auto_426174 ?auto_426175 ?auto_426176 ?auto_426177 ?auto_426178 ?auto_426179 ?auto_426180 ?auto_426181 ?auto_426182 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_426197 - BLOCK
      ?auto_426198 - BLOCK
      ?auto_426199 - BLOCK
      ?auto_426200 - BLOCK
      ?auto_426201 - BLOCK
      ?auto_426202 - BLOCK
      ?auto_426203 - BLOCK
      ?auto_426204 - BLOCK
      ?auto_426205 - BLOCK
      ?auto_426206 - BLOCK
      ?auto_426207 - BLOCK
      ?auto_426208 - BLOCK
      ?auto_426209 - BLOCK
    )
    :vars
    (
      ?auto_426210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426209 ?auto_426210 ) ( ON-TABLE ?auto_426197 ) ( ON ?auto_426198 ?auto_426197 ) ( ON ?auto_426199 ?auto_426198 ) ( ON ?auto_426200 ?auto_426199 ) ( ON ?auto_426201 ?auto_426200 ) ( ON ?auto_426202 ?auto_426201 ) ( ON ?auto_426203 ?auto_426202 ) ( ON ?auto_426204 ?auto_426203 ) ( not ( = ?auto_426197 ?auto_426198 ) ) ( not ( = ?auto_426197 ?auto_426199 ) ) ( not ( = ?auto_426197 ?auto_426200 ) ) ( not ( = ?auto_426197 ?auto_426201 ) ) ( not ( = ?auto_426197 ?auto_426202 ) ) ( not ( = ?auto_426197 ?auto_426203 ) ) ( not ( = ?auto_426197 ?auto_426204 ) ) ( not ( = ?auto_426197 ?auto_426205 ) ) ( not ( = ?auto_426197 ?auto_426206 ) ) ( not ( = ?auto_426197 ?auto_426207 ) ) ( not ( = ?auto_426197 ?auto_426208 ) ) ( not ( = ?auto_426197 ?auto_426209 ) ) ( not ( = ?auto_426197 ?auto_426210 ) ) ( not ( = ?auto_426198 ?auto_426199 ) ) ( not ( = ?auto_426198 ?auto_426200 ) ) ( not ( = ?auto_426198 ?auto_426201 ) ) ( not ( = ?auto_426198 ?auto_426202 ) ) ( not ( = ?auto_426198 ?auto_426203 ) ) ( not ( = ?auto_426198 ?auto_426204 ) ) ( not ( = ?auto_426198 ?auto_426205 ) ) ( not ( = ?auto_426198 ?auto_426206 ) ) ( not ( = ?auto_426198 ?auto_426207 ) ) ( not ( = ?auto_426198 ?auto_426208 ) ) ( not ( = ?auto_426198 ?auto_426209 ) ) ( not ( = ?auto_426198 ?auto_426210 ) ) ( not ( = ?auto_426199 ?auto_426200 ) ) ( not ( = ?auto_426199 ?auto_426201 ) ) ( not ( = ?auto_426199 ?auto_426202 ) ) ( not ( = ?auto_426199 ?auto_426203 ) ) ( not ( = ?auto_426199 ?auto_426204 ) ) ( not ( = ?auto_426199 ?auto_426205 ) ) ( not ( = ?auto_426199 ?auto_426206 ) ) ( not ( = ?auto_426199 ?auto_426207 ) ) ( not ( = ?auto_426199 ?auto_426208 ) ) ( not ( = ?auto_426199 ?auto_426209 ) ) ( not ( = ?auto_426199 ?auto_426210 ) ) ( not ( = ?auto_426200 ?auto_426201 ) ) ( not ( = ?auto_426200 ?auto_426202 ) ) ( not ( = ?auto_426200 ?auto_426203 ) ) ( not ( = ?auto_426200 ?auto_426204 ) ) ( not ( = ?auto_426200 ?auto_426205 ) ) ( not ( = ?auto_426200 ?auto_426206 ) ) ( not ( = ?auto_426200 ?auto_426207 ) ) ( not ( = ?auto_426200 ?auto_426208 ) ) ( not ( = ?auto_426200 ?auto_426209 ) ) ( not ( = ?auto_426200 ?auto_426210 ) ) ( not ( = ?auto_426201 ?auto_426202 ) ) ( not ( = ?auto_426201 ?auto_426203 ) ) ( not ( = ?auto_426201 ?auto_426204 ) ) ( not ( = ?auto_426201 ?auto_426205 ) ) ( not ( = ?auto_426201 ?auto_426206 ) ) ( not ( = ?auto_426201 ?auto_426207 ) ) ( not ( = ?auto_426201 ?auto_426208 ) ) ( not ( = ?auto_426201 ?auto_426209 ) ) ( not ( = ?auto_426201 ?auto_426210 ) ) ( not ( = ?auto_426202 ?auto_426203 ) ) ( not ( = ?auto_426202 ?auto_426204 ) ) ( not ( = ?auto_426202 ?auto_426205 ) ) ( not ( = ?auto_426202 ?auto_426206 ) ) ( not ( = ?auto_426202 ?auto_426207 ) ) ( not ( = ?auto_426202 ?auto_426208 ) ) ( not ( = ?auto_426202 ?auto_426209 ) ) ( not ( = ?auto_426202 ?auto_426210 ) ) ( not ( = ?auto_426203 ?auto_426204 ) ) ( not ( = ?auto_426203 ?auto_426205 ) ) ( not ( = ?auto_426203 ?auto_426206 ) ) ( not ( = ?auto_426203 ?auto_426207 ) ) ( not ( = ?auto_426203 ?auto_426208 ) ) ( not ( = ?auto_426203 ?auto_426209 ) ) ( not ( = ?auto_426203 ?auto_426210 ) ) ( not ( = ?auto_426204 ?auto_426205 ) ) ( not ( = ?auto_426204 ?auto_426206 ) ) ( not ( = ?auto_426204 ?auto_426207 ) ) ( not ( = ?auto_426204 ?auto_426208 ) ) ( not ( = ?auto_426204 ?auto_426209 ) ) ( not ( = ?auto_426204 ?auto_426210 ) ) ( not ( = ?auto_426205 ?auto_426206 ) ) ( not ( = ?auto_426205 ?auto_426207 ) ) ( not ( = ?auto_426205 ?auto_426208 ) ) ( not ( = ?auto_426205 ?auto_426209 ) ) ( not ( = ?auto_426205 ?auto_426210 ) ) ( not ( = ?auto_426206 ?auto_426207 ) ) ( not ( = ?auto_426206 ?auto_426208 ) ) ( not ( = ?auto_426206 ?auto_426209 ) ) ( not ( = ?auto_426206 ?auto_426210 ) ) ( not ( = ?auto_426207 ?auto_426208 ) ) ( not ( = ?auto_426207 ?auto_426209 ) ) ( not ( = ?auto_426207 ?auto_426210 ) ) ( not ( = ?auto_426208 ?auto_426209 ) ) ( not ( = ?auto_426208 ?auto_426210 ) ) ( not ( = ?auto_426209 ?auto_426210 ) ) ( ON ?auto_426208 ?auto_426209 ) ( ON ?auto_426207 ?auto_426208 ) ( ON ?auto_426206 ?auto_426207 ) ( CLEAR ?auto_426204 ) ( ON ?auto_426205 ?auto_426206 ) ( CLEAR ?auto_426205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_426197 ?auto_426198 ?auto_426199 ?auto_426200 ?auto_426201 ?auto_426202 ?auto_426203 ?auto_426204 ?auto_426205 )
      ( MAKE-13PILE ?auto_426197 ?auto_426198 ?auto_426199 ?auto_426200 ?auto_426201 ?auto_426202 ?auto_426203 ?auto_426204 ?auto_426205 ?auto_426206 ?auto_426207 ?auto_426208 ?auto_426209 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_426224 - BLOCK
      ?auto_426225 - BLOCK
      ?auto_426226 - BLOCK
      ?auto_426227 - BLOCK
      ?auto_426228 - BLOCK
      ?auto_426229 - BLOCK
      ?auto_426230 - BLOCK
      ?auto_426231 - BLOCK
      ?auto_426232 - BLOCK
      ?auto_426233 - BLOCK
      ?auto_426234 - BLOCK
      ?auto_426235 - BLOCK
      ?auto_426236 - BLOCK
    )
    :vars
    (
      ?auto_426237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426236 ?auto_426237 ) ( ON-TABLE ?auto_426224 ) ( ON ?auto_426225 ?auto_426224 ) ( ON ?auto_426226 ?auto_426225 ) ( ON ?auto_426227 ?auto_426226 ) ( ON ?auto_426228 ?auto_426227 ) ( ON ?auto_426229 ?auto_426228 ) ( ON ?auto_426230 ?auto_426229 ) ( ON ?auto_426231 ?auto_426230 ) ( not ( = ?auto_426224 ?auto_426225 ) ) ( not ( = ?auto_426224 ?auto_426226 ) ) ( not ( = ?auto_426224 ?auto_426227 ) ) ( not ( = ?auto_426224 ?auto_426228 ) ) ( not ( = ?auto_426224 ?auto_426229 ) ) ( not ( = ?auto_426224 ?auto_426230 ) ) ( not ( = ?auto_426224 ?auto_426231 ) ) ( not ( = ?auto_426224 ?auto_426232 ) ) ( not ( = ?auto_426224 ?auto_426233 ) ) ( not ( = ?auto_426224 ?auto_426234 ) ) ( not ( = ?auto_426224 ?auto_426235 ) ) ( not ( = ?auto_426224 ?auto_426236 ) ) ( not ( = ?auto_426224 ?auto_426237 ) ) ( not ( = ?auto_426225 ?auto_426226 ) ) ( not ( = ?auto_426225 ?auto_426227 ) ) ( not ( = ?auto_426225 ?auto_426228 ) ) ( not ( = ?auto_426225 ?auto_426229 ) ) ( not ( = ?auto_426225 ?auto_426230 ) ) ( not ( = ?auto_426225 ?auto_426231 ) ) ( not ( = ?auto_426225 ?auto_426232 ) ) ( not ( = ?auto_426225 ?auto_426233 ) ) ( not ( = ?auto_426225 ?auto_426234 ) ) ( not ( = ?auto_426225 ?auto_426235 ) ) ( not ( = ?auto_426225 ?auto_426236 ) ) ( not ( = ?auto_426225 ?auto_426237 ) ) ( not ( = ?auto_426226 ?auto_426227 ) ) ( not ( = ?auto_426226 ?auto_426228 ) ) ( not ( = ?auto_426226 ?auto_426229 ) ) ( not ( = ?auto_426226 ?auto_426230 ) ) ( not ( = ?auto_426226 ?auto_426231 ) ) ( not ( = ?auto_426226 ?auto_426232 ) ) ( not ( = ?auto_426226 ?auto_426233 ) ) ( not ( = ?auto_426226 ?auto_426234 ) ) ( not ( = ?auto_426226 ?auto_426235 ) ) ( not ( = ?auto_426226 ?auto_426236 ) ) ( not ( = ?auto_426226 ?auto_426237 ) ) ( not ( = ?auto_426227 ?auto_426228 ) ) ( not ( = ?auto_426227 ?auto_426229 ) ) ( not ( = ?auto_426227 ?auto_426230 ) ) ( not ( = ?auto_426227 ?auto_426231 ) ) ( not ( = ?auto_426227 ?auto_426232 ) ) ( not ( = ?auto_426227 ?auto_426233 ) ) ( not ( = ?auto_426227 ?auto_426234 ) ) ( not ( = ?auto_426227 ?auto_426235 ) ) ( not ( = ?auto_426227 ?auto_426236 ) ) ( not ( = ?auto_426227 ?auto_426237 ) ) ( not ( = ?auto_426228 ?auto_426229 ) ) ( not ( = ?auto_426228 ?auto_426230 ) ) ( not ( = ?auto_426228 ?auto_426231 ) ) ( not ( = ?auto_426228 ?auto_426232 ) ) ( not ( = ?auto_426228 ?auto_426233 ) ) ( not ( = ?auto_426228 ?auto_426234 ) ) ( not ( = ?auto_426228 ?auto_426235 ) ) ( not ( = ?auto_426228 ?auto_426236 ) ) ( not ( = ?auto_426228 ?auto_426237 ) ) ( not ( = ?auto_426229 ?auto_426230 ) ) ( not ( = ?auto_426229 ?auto_426231 ) ) ( not ( = ?auto_426229 ?auto_426232 ) ) ( not ( = ?auto_426229 ?auto_426233 ) ) ( not ( = ?auto_426229 ?auto_426234 ) ) ( not ( = ?auto_426229 ?auto_426235 ) ) ( not ( = ?auto_426229 ?auto_426236 ) ) ( not ( = ?auto_426229 ?auto_426237 ) ) ( not ( = ?auto_426230 ?auto_426231 ) ) ( not ( = ?auto_426230 ?auto_426232 ) ) ( not ( = ?auto_426230 ?auto_426233 ) ) ( not ( = ?auto_426230 ?auto_426234 ) ) ( not ( = ?auto_426230 ?auto_426235 ) ) ( not ( = ?auto_426230 ?auto_426236 ) ) ( not ( = ?auto_426230 ?auto_426237 ) ) ( not ( = ?auto_426231 ?auto_426232 ) ) ( not ( = ?auto_426231 ?auto_426233 ) ) ( not ( = ?auto_426231 ?auto_426234 ) ) ( not ( = ?auto_426231 ?auto_426235 ) ) ( not ( = ?auto_426231 ?auto_426236 ) ) ( not ( = ?auto_426231 ?auto_426237 ) ) ( not ( = ?auto_426232 ?auto_426233 ) ) ( not ( = ?auto_426232 ?auto_426234 ) ) ( not ( = ?auto_426232 ?auto_426235 ) ) ( not ( = ?auto_426232 ?auto_426236 ) ) ( not ( = ?auto_426232 ?auto_426237 ) ) ( not ( = ?auto_426233 ?auto_426234 ) ) ( not ( = ?auto_426233 ?auto_426235 ) ) ( not ( = ?auto_426233 ?auto_426236 ) ) ( not ( = ?auto_426233 ?auto_426237 ) ) ( not ( = ?auto_426234 ?auto_426235 ) ) ( not ( = ?auto_426234 ?auto_426236 ) ) ( not ( = ?auto_426234 ?auto_426237 ) ) ( not ( = ?auto_426235 ?auto_426236 ) ) ( not ( = ?auto_426235 ?auto_426237 ) ) ( not ( = ?auto_426236 ?auto_426237 ) ) ( ON ?auto_426235 ?auto_426236 ) ( ON ?auto_426234 ?auto_426235 ) ( ON ?auto_426233 ?auto_426234 ) ( CLEAR ?auto_426231 ) ( ON ?auto_426232 ?auto_426233 ) ( CLEAR ?auto_426232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_426224 ?auto_426225 ?auto_426226 ?auto_426227 ?auto_426228 ?auto_426229 ?auto_426230 ?auto_426231 ?auto_426232 )
      ( MAKE-13PILE ?auto_426224 ?auto_426225 ?auto_426226 ?auto_426227 ?auto_426228 ?auto_426229 ?auto_426230 ?auto_426231 ?auto_426232 ?auto_426233 ?auto_426234 ?auto_426235 ?auto_426236 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_426251 - BLOCK
      ?auto_426252 - BLOCK
      ?auto_426253 - BLOCK
      ?auto_426254 - BLOCK
      ?auto_426255 - BLOCK
      ?auto_426256 - BLOCK
      ?auto_426257 - BLOCK
      ?auto_426258 - BLOCK
      ?auto_426259 - BLOCK
      ?auto_426260 - BLOCK
      ?auto_426261 - BLOCK
      ?auto_426262 - BLOCK
      ?auto_426263 - BLOCK
    )
    :vars
    (
      ?auto_426264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426263 ?auto_426264 ) ( ON-TABLE ?auto_426251 ) ( ON ?auto_426252 ?auto_426251 ) ( ON ?auto_426253 ?auto_426252 ) ( ON ?auto_426254 ?auto_426253 ) ( ON ?auto_426255 ?auto_426254 ) ( ON ?auto_426256 ?auto_426255 ) ( ON ?auto_426257 ?auto_426256 ) ( not ( = ?auto_426251 ?auto_426252 ) ) ( not ( = ?auto_426251 ?auto_426253 ) ) ( not ( = ?auto_426251 ?auto_426254 ) ) ( not ( = ?auto_426251 ?auto_426255 ) ) ( not ( = ?auto_426251 ?auto_426256 ) ) ( not ( = ?auto_426251 ?auto_426257 ) ) ( not ( = ?auto_426251 ?auto_426258 ) ) ( not ( = ?auto_426251 ?auto_426259 ) ) ( not ( = ?auto_426251 ?auto_426260 ) ) ( not ( = ?auto_426251 ?auto_426261 ) ) ( not ( = ?auto_426251 ?auto_426262 ) ) ( not ( = ?auto_426251 ?auto_426263 ) ) ( not ( = ?auto_426251 ?auto_426264 ) ) ( not ( = ?auto_426252 ?auto_426253 ) ) ( not ( = ?auto_426252 ?auto_426254 ) ) ( not ( = ?auto_426252 ?auto_426255 ) ) ( not ( = ?auto_426252 ?auto_426256 ) ) ( not ( = ?auto_426252 ?auto_426257 ) ) ( not ( = ?auto_426252 ?auto_426258 ) ) ( not ( = ?auto_426252 ?auto_426259 ) ) ( not ( = ?auto_426252 ?auto_426260 ) ) ( not ( = ?auto_426252 ?auto_426261 ) ) ( not ( = ?auto_426252 ?auto_426262 ) ) ( not ( = ?auto_426252 ?auto_426263 ) ) ( not ( = ?auto_426252 ?auto_426264 ) ) ( not ( = ?auto_426253 ?auto_426254 ) ) ( not ( = ?auto_426253 ?auto_426255 ) ) ( not ( = ?auto_426253 ?auto_426256 ) ) ( not ( = ?auto_426253 ?auto_426257 ) ) ( not ( = ?auto_426253 ?auto_426258 ) ) ( not ( = ?auto_426253 ?auto_426259 ) ) ( not ( = ?auto_426253 ?auto_426260 ) ) ( not ( = ?auto_426253 ?auto_426261 ) ) ( not ( = ?auto_426253 ?auto_426262 ) ) ( not ( = ?auto_426253 ?auto_426263 ) ) ( not ( = ?auto_426253 ?auto_426264 ) ) ( not ( = ?auto_426254 ?auto_426255 ) ) ( not ( = ?auto_426254 ?auto_426256 ) ) ( not ( = ?auto_426254 ?auto_426257 ) ) ( not ( = ?auto_426254 ?auto_426258 ) ) ( not ( = ?auto_426254 ?auto_426259 ) ) ( not ( = ?auto_426254 ?auto_426260 ) ) ( not ( = ?auto_426254 ?auto_426261 ) ) ( not ( = ?auto_426254 ?auto_426262 ) ) ( not ( = ?auto_426254 ?auto_426263 ) ) ( not ( = ?auto_426254 ?auto_426264 ) ) ( not ( = ?auto_426255 ?auto_426256 ) ) ( not ( = ?auto_426255 ?auto_426257 ) ) ( not ( = ?auto_426255 ?auto_426258 ) ) ( not ( = ?auto_426255 ?auto_426259 ) ) ( not ( = ?auto_426255 ?auto_426260 ) ) ( not ( = ?auto_426255 ?auto_426261 ) ) ( not ( = ?auto_426255 ?auto_426262 ) ) ( not ( = ?auto_426255 ?auto_426263 ) ) ( not ( = ?auto_426255 ?auto_426264 ) ) ( not ( = ?auto_426256 ?auto_426257 ) ) ( not ( = ?auto_426256 ?auto_426258 ) ) ( not ( = ?auto_426256 ?auto_426259 ) ) ( not ( = ?auto_426256 ?auto_426260 ) ) ( not ( = ?auto_426256 ?auto_426261 ) ) ( not ( = ?auto_426256 ?auto_426262 ) ) ( not ( = ?auto_426256 ?auto_426263 ) ) ( not ( = ?auto_426256 ?auto_426264 ) ) ( not ( = ?auto_426257 ?auto_426258 ) ) ( not ( = ?auto_426257 ?auto_426259 ) ) ( not ( = ?auto_426257 ?auto_426260 ) ) ( not ( = ?auto_426257 ?auto_426261 ) ) ( not ( = ?auto_426257 ?auto_426262 ) ) ( not ( = ?auto_426257 ?auto_426263 ) ) ( not ( = ?auto_426257 ?auto_426264 ) ) ( not ( = ?auto_426258 ?auto_426259 ) ) ( not ( = ?auto_426258 ?auto_426260 ) ) ( not ( = ?auto_426258 ?auto_426261 ) ) ( not ( = ?auto_426258 ?auto_426262 ) ) ( not ( = ?auto_426258 ?auto_426263 ) ) ( not ( = ?auto_426258 ?auto_426264 ) ) ( not ( = ?auto_426259 ?auto_426260 ) ) ( not ( = ?auto_426259 ?auto_426261 ) ) ( not ( = ?auto_426259 ?auto_426262 ) ) ( not ( = ?auto_426259 ?auto_426263 ) ) ( not ( = ?auto_426259 ?auto_426264 ) ) ( not ( = ?auto_426260 ?auto_426261 ) ) ( not ( = ?auto_426260 ?auto_426262 ) ) ( not ( = ?auto_426260 ?auto_426263 ) ) ( not ( = ?auto_426260 ?auto_426264 ) ) ( not ( = ?auto_426261 ?auto_426262 ) ) ( not ( = ?auto_426261 ?auto_426263 ) ) ( not ( = ?auto_426261 ?auto_426264 ) ) ( not ( = ?auto_426262 ?auto_426263 ) ) ( not ( = ?auto_426262 ?auto_426264 ) ) ( not ( = ?auto_426263 ?auto_426264 ) ) ( ON ?auto_426262 ?auto_426263 ) ( ON ?auto_426261 ?auto_426262 ) ( ON ?auto_426260 ?auto_426261 ) ( ON ?auto_426259 ?auto_426260 ) ( CLEAR ?auto_426257 ) ( ON ?auto_426258 ?auto_426259 ) ( CLEAR ?auto_426258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_426251 ?auto_426252 ?auto_426253 ?auto_426254 ?auto_426255 ?auto_426256 ?auto_426257 ?auto_426258 )
      ( MAKE-13PILE ?auto_426251 ?auto_426252 ?auto_426253 ?auto_426254 ?auto_426255 ?auto_426256 ?auto_426257 ?auto_426258 ?auto_426259 ?auto_426260 ?auto_426261 ?auto_426262 ?auto_426263 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_426278 - BLOCK
      ?auto_426279 - BLOCK
      ?auto_426280 - BLOCK
      ?auto_426281 - BLOCK
      ?auto_426282 - BLOCK
      ?auto_426283 - BLOCK
      ?auto_426284 - BLOCK
      ?auto_426285 - BLOCK
      ?auto_426286 - BLOCK
      ?auto_426287 - BLOCK
      ?auto_426288 - BLOCK
      ?auto_426289 - BLOCK
      ?auto_426290 - BLOCK
    )
    :vars
    (
      ?auto_426291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426290 ?auto_426291 ) ( ON-TABLE ?auto_426278 ) ( ON ?auto_426279 ?auto_426278 ) ( ON ?auto_426280 ?auto_426279 ) ( ON ?auto_426281 ?auto_426280 ) ( ON ?auto_426282 ?auto_426281 ) ( ON ?auto_426283 ?auto_426282 ) ( ON ?auto_426284 ?auto_426283 ) ( not ( = ?auto_426278 ?auto_426279 ) ) ( not ( = ?auto_426278 ?auto_426280 ) ) ( not ( = ?auto_426278 ?auto_426281 ) ) ( not ( = ?auto_426278 ?auto_426282 ) ) ( not ( = ?auto_426278 ?auto_426283 ) ) ( not ( = ?auto_426278 ?auto_426284 ) ) ( not ( = ?auto_426278 ?auto_426285 ) ) ( not ( = ?auto_426278 ?auto_426286 ) ) ( not ( = ?auto_426278 ?auto_426287 ) ) ( not ( = ?auto_426278 ?auto_426288 ) ) ( not ( = ?auto_426278 ?auto_426289 ) ) ( not ( = ?auto_426278 ?auto_426290 ) ) ( not ( = ?auto_426278 ?auto_426291 ) ) ( not ( = ?auto_426279 ?auto_426280 ) ) ( not ( = ?auto_426279 ?auto_426281 ) ) ( not ( = ?auto_426279 ?auto_426282 ) ) ( not ( = ?auto_426279 ?auto_426283 ) ) ( not ( = ?auto_426279 ?auto_426284 ) ) ( not ( = ?auto_426279 ?auto_426285 ) ) ( not ( = ?auto_426279 ?auto_426286 ) ) ( not ( = ?auto_426279 ?auto_426287 ) ) ( not ( = ?auto_426279 ?auto_426288 ) ) ( not ( = ?auto_426279 ?auto_426289 ) ) ( not ( = ?auto_426279 ?auto_426290 ) ) ( not ( = ?auto_426279 ?auto_426291 ) ) ( not ( = ?auto_426280 ?auto_426281 ) ) ( not ( = ?auto_426280 ?auto_426282 ) ) ( not ( = ?auto_426280 ?auto_426283 ) ) ( not ( = ?auto_426280 ?auto_426284 ) ) ( not ( = ?auto_426280 ?auto_426285 ) ) ( not ( = ?auto_426280 ?auto_426286 ) ) ( not ( = ?auto_426280 ?auto_426287 ) ) ( not ( = ?auto_426280 ?auto_426288 ) ) ( not ( = ?auto_426280 ?auto_426289 ) ) ( not ( = ?auto_426280 ?auto_426290 ) ) ( not ( = ?auto_426280 ?auto_426291 ) ) ( not ( = ?auto_426281 ?auto_426282 ) ) ( not ( = ?auto_426281 ?auto_426283 ) ) ( not ( = ?auto_426281 ?auto_426284 ) ) ( not ( = ?auto_426281 ?auto_426285 ) ) ( not ( = ?auto_426281 ?auto_426286 ) ) ( not ( = ?auto_426281 ?auto_426287 ) ) ( not ( = ?auto_426281 ?auto_426288 ) ) ( not ( = ?auto_426281 ?auto_426289 ) ) ( not ( = ?auto_426281 ?auto_426290 ) ) ( not ( = ?auto_426281 ?auto_426291 ) ) ( not ( = ?auto_426282 ?auto_426283 ) ) ( not ( = ?auto_426282 ?auto_426284 ) ) ( not ( = ?auto_426282 ?auto_426285 ) ) ( not ( = ?auto_426282 ?auto_426286 ) ) ( not ( = ?auto_426282 ?auto_426287 ) ) ( not ( = ?auto_426282 ?auto_426288 ) ) ( not ( = ?auto_426282 ?auto_426289 ) ) ( not ( = ?auto_426282 ?auto_426290 ) ) ( not ( = ?auto_426282 ?auto_426291 ) ) ( not ( = ?auto_426283 ?auto_426284 ) ) ( not ( = ?auto_426283 ?auto_426285 ) ) ( not ( = ?auto_426283 ?auto_426286 ) ) ( not ( = ?auto_426283 ?auto_426287 ) ) ( not ( = ?auto_426283 ?auto_426288 ) ) ( not ( = ?auto_426283 ?auto_426289 ) ) ( not ( = ?auto_426283 ?auto_426290 ) ) ( not ( = ?auto_426283 ?auto_426291 ) ) ( not ( = ?auto_426284 ?auto_426285 ) ) ( not ( = ?auto_426284 ?auto_426286 ) ) ( not ( = ?auto_426284 ?auto_426287 ) ) ( not ( = ?auto_426284 ?auto_426288 ) ) ( not ( = ?auto_426284 ?auto_426289 ) ) ( not ( = ?auto_426284 ?auto_426290 ) ) ( not ( = ?auto_426284 ?auto_426291 ) ) ( not ( = ?auto_426285 ?auto_426286 ) ) ( not ( = ?auto_426285 ?auto_426287 ) ) ( not ( = ?auto_426285 ?auto_426288 ) ) ( not ( = ?auto_426285 ?auto_426289 ) ) ( not ( = ?auto_426285 ?auto_426290 ) ) ( not ( = ?auto_426285 ?auto_426291 ) ) ( not ( = ?auto_426286 ?auto_426287 ) ) ( not ( = ?auto_426286 ?auto_426288 ) ) ( not ( = ?auto_426286 ?auto_426289 ) ) ( not ( = ?auto_426286 ?auto_426290 ) ) ( not ( = ?auto_426286 ?auto_426291 ) ) ( not ( = ?auto_426287 ?auto_426288 ) ) ( not ( = ?auto_426287 ?auto_426289 ) ) ( not ( = ?auto_426287 ?auto_426290 ) ) ( not ( = ?auto_426287 ?auto_426291 ) ) ( not ( = ?auto_426288 ?auto_426289 ) ) ( not ( = ?auto_426288 ?auto_426290 ) ) ( not ( = ?auto_426288 ?auto_426291 ) ) ( not ( = ?auto_426289 ?auto_426290 ) ) ( not ( = ?auto_426289 ?auto_426291 ) ) ( not ( = ?auto_426290 ?auto_426291 ) ) ( ON ?auto_426289 ?auto_426290 ) ( ON ?auto_426288 ?auto_426289 ) ( ON ?auto_426287 ?auto_426288 ) ( ON ?auto_426286 ?auto_426287 ) ( CLEAR ?auto_426284 ) ( ON ?auto_426285 ?auto_426286 ) ( CLEAR ?auto_426285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_426278 ?auto_426279 ?auto_426280 ?auto_426281 ?auto_426282 ?auto_426283 ?auto_426284 ?auto_426285 )
      ( MAKE-13PILE ?auto_426278 ?auto_426279 ?auto_426280 ?auto_426281 ?auto_426282 ?auto_426283 ?auto_426284 ?auto_426285 ?auto_426286 ?auto_426287 ?auto_426288 ?auto_426289 ?auto_426290 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_426305 - BLOCK
      ?auto_426306 - BLOCK
      ?auto_426307 - BLOCK
      ?auto_426308 - BLOCK
      ?auto_426309 - BLOCK
      ?auto_426310 - BLOCK
      ?auto_426311 - BLOCK
      ?auto_426312 - BLOCK
      ?auto_426313 - BLOCK
      ?auto_426314 - BLOCK
      ?auto_426315 - BLOCK
      ?auto_426316 - BLOCK
      ?auto_426317 - BLOCK
    )
    :vars
    (
      ?auto_426318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426317 ?auto_426318 ) ( ON-TABLE ?auto_426305 ) ( ON ?auto_426306 ?auto_426305 ) ( ON ?auto_426307 ?auto_426306 ) ( ON ?auto_426308 ?auto_426307 ) ( ON ?auto_426309 ?auto_426308 ) ( ON ?auto_426310 ?auto_426309 ) ( not ( = ?auto_426305 ?auto_426306 ) ) ( not ( = ?auto_426305 ?auto_426307 ) ) ( not ( = ?auto_426305 ?auto_426308 ) ) ( not ( = ?auto_426305 ?auto_426309 ) ) ( not ( = ?auto_426305 ?auto_426310 ) ) ( not ( = ?auto_426305 ?auto_426311 ) ) ( not ( = ?auto_426305 ?auto_426312 ) ) ( not ( = ?auto_426305 ?auto_426313 ) ) ( not ( = ?auto_426305 ?auto_426314 ) ) ( not ( = ?auto_426305 ?auto_426315 ) ) ( not ( = ?auto_426305 ?auto_426316 ) ) ( not ( = ?auto_426305 ?auto_426317 ) ) ( not ( = ?auto_426305 ?auto_426318 ) ) ( not ( = ?auto_426306 ?auto_426307 ) ) ( not ( = ?auto_426306 ?auto_426308 ) ) ( not ( = ?auto_426306 ?auto_426309 ) ) ( not ( = ?auto_426306 ?auto_426310 ) ) ( not ( = ?auto_426306 ?auto_426311 ) ) ( not ( = ?auto_426306 ?auto_426312 ) ) ( not ( = ?auto_426306 ?auto_426313 ) ) ( not ( = ?auto_426306 ?auto_426314 ) ) ( not ( = ?auto_426306 ?auto_426315 ) ) ( not ( = ?auto_426306 ?auto_426316 ) ) ( not ( = ?auto_426306 ?auto_426317 ) ) ( not ( = ?auto_426306 ?auto_426318 ) ) ( not ( = ?auto_426307 ?auto_426308 ) ) ( not ( = ?auto_426307 ?auto_426309 ) ) ( not ( = ?auto_426307 ?auto_426310 ) ) ( not ( = ?auto_426307 ?auto_426311 ) ) ( not ( = ?auto_426307 ?auto_426312 ) ) ( not ( = ?auto_426307 ?auto_426313 ) ) ( not ( = ?auto_426307 ?auto_426314 ) ) ( not ( = ?auto_426307 ?auto_426315 ) ) ( not ( = ?auto_426307 ?auto_426316 ) ) ( not ( = ?auto_426307 ?auto_426317 ) ) ( not ( = ?auto_426307 ?auto_426318 ) ) ( not ( = ?auto_426308 ?auto_426309 ) ) ( not ( = ?auto_426308 ?auto_426310 ) ) ( not ( = ?auto_426308 ?auto_426311 ) ) ( not ( = ?auto_426308 ?auto_426312 ) ) ( not ( = ?auto_426308 ?auto_426313 ) ) ( not ( = ?auto_426308 ?auto_426314 ) ) ( not ( = ?auto_426308 ?auto_426315 ) ) ( not ( = ?auto_426308 ?auto_426316 ) ) ( not ( = ?auto_426308 ?auto_426317 ) ) ( not ( = ?auto_426308 ?auto_426318 ) ) ( not ( = ?auto_426309 ?auto_426310 ) ) ( not ( = ?auto_426309 ?auto_426311 ) ) ( not ( = ?auto_426309 ?auto_426312 ) ) ( not ( = ?auto_426309 ?auto_426313 ) ) ( not ( = ?auto_426309 ?auto_426314 ) ) ( not ( = ?auto_426309 ?auto_426315 ) ) ( not ( = ?auto_426309 ?auto_426316 ) ) ( not ( = ?auto_426309 ?auto_426317 ) ) ( not ( = ?auto_426309 ?auto_426318 ) ) ( not ( = ?auto_426310 ?auto_426311 ) ) ( not ( = ?auto_426310 ?auto_426312 ) ) ( not ( = ?auto_426310 ?auto_426313 ) ) ( not ( = ?auto_426310 ?auto_426314 ) ) ( not ( = ?auto_426310 ?auto_426315 ) ) ( not ( = ?auto_426310 ?auto_426316 ) ) ( not ( = ?auto_426310 ?auto_426317 ) ) ( not ( = ?auto_426310 ?auto_426318 ) ) ( not ( = ?auto_426311 ?auto_426312 ) ) ( not ( = ?auto_426311 ?auto_426313 ) ) ( not ( = ?auto_426311 ?auto_426314 ) ) ( not ( = ?auto_426311 ?auto_426315 ) ) ( not ( = ?auto_426311 ?auto_426316 ) ) ( not ( = ?auto_426311 ?auto_426317 ) ) ( not ( = ?auto_426311 ?auto_426318 ) ) ( not ( = ?auto_426312 ?auto_426313 ) ) ( not ( = ?auto_426312 ?auto_426314 ) ) ( not ( = ?auto_426312 ?auto_426315 ) ) ( not ( = ?auto_426312 ?auto_426316 ) ) ( not ( = ?auto_426312 ?auto_426317 ) ) ( not ( = ?auto_426312 ?auto_426318 ) ) ( not ( = ?auto_426313 ?auto_426314 ) ) ( not ( = ?auto_426313 ?auto_426315 ) ) ( not ( = ?auto_426313 ?auto_426316 ) ) ( not ( = ?auto_426313 ?auto_426317 ) ) ( not ( = ?auto_426313 ?auto_426318 ) ) ( not ( = ?auto_426314 ?auto_426315 ) ) ( not ( = ?auto_426314 ?auto_426316 ) ) ( not ( = ?auto_426314 ?auto_426317 ) ) ( not ( = ?auto_426314 ?auto_426318 ) ) ( not ( = ?auto_426315 ?auto_426316 ) ) ( not ( = ?auto_426315 ?auto_426317 ) ) ( not ( = ?auto_426315 ?auto_426318 ) ) ( not ( = ?auto_426316 ?auto_426317 ) ) ( not ( = ?auto_426316 ?auto_426318 ) ) ( not ( = ?auto_426317 ?auto_426318 ) ) ( ON ?auto_426316 ?auto_426317 ) ( ON ?auto_426315 ?auto_426316 ) ( ON ?auto_426314 ?auto_426315 ) ( ON ?auto_426313 ?auto_426314 ) ( ON ?auto_426312 ?auto_426313 ) ( CLEAR ?auto_426310 ) ( ON ?auto_426311 ?auto_426312 ) ( CLEAR ?auto_426311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_426305 ?auto_426306 ?auto_426307 ?auto_426308 ?auto_426309 ?auto_426310 ?auto_426311 )
      ( MAKE-13PILE ?auto_426305 ?auto_426306 ?auto_426307 ?auto_426308 ?auto_426309 ?auto_426310 ?auto_426311 ?auto_426312 ?auto_426313 ?auto_426314 ?auto_426315 ?auto_426316 ?auto_426317 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_426332 - BLOCK
      ?auto_426333 - BLOCK
      ?auto_426334 - BLOCK
      ?auto_426335 - BLOCK
      ?auto_426336 - BLOCK
      ?auto_426337 - BLOCK
      ?auto_426338 - BLOCK
      ?auto_426339 - BLOCK
      ?auto_426340 - BLOCK
      ?auto_426341 - BLOCK
      ?auto_426342 - BLOCK
      ?auto_426343 - BLOCK
      ?auto_426344 - BLOCK
    )
    :vars
    (
      ?auto_426345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426344 ?auto_426345 ) ( ON-TABLE ?auto_426332 ) ( ON ?auto_426333 ?auto_426332 ) ( ON ?auto_426334 ?auto_426333 ) ( ON ?auto_426335 ?auto_426334 ) ( ON ?auto_426336 ?auto_426335 ) ( ON ?auto_426337 ?auto_426336 ) ( not ( = ?auto_426332 ?auto_426333 ) ) ( not ( = ?auto_426332 ?auto_426334 ) ) ( not ( = ?auto_426332 ?auto_426335 ) ) ( not ( = ?auto_426332 ?auto_426336 ) ) ( not ( = ?auto_426332 ?auto_426337 ) ) ( not ( = ?auto_426332 ?auto_426338 ) ) ( not ( = ?auto_426332 ?auto_426339 ) ) ( not ( = ?auto_426332 ?auto_426340 ) ) ( not ( = ?auto_426332 ?auto_426341 ) ) ( not ( = ?auto_426332 ?auto_426342 ) ) ( not ( = ?auto_426332 ?auto_426343 ) ) ( not ( = ?auto_426332 ?auto_426344 ) ) ( not ( = ?auto_426332 ?auto_426345 ) ) ( not ( = ?auto_426333 ?auto_426334 ) ) ( not ( = ?auto_426333 ?auto_426335 ) ) ( not ( = ?auto_426333 ?auto_426336 ) ) ( not ( = ?auto_426333 ?auto_426337 ) ) ( not ( = ?auto_426333 ?auto_426338 ) ) ( not ( = ?auto_426333 ?auto_426339 ) ) ( not ( = ?auto_426333 ?auto_426340 ) ) ( not ( = ?auto_426333 ?auto_426341 ) ) ( not ( = ?auto_426333 ?auto_426342 ) ) ( not ( = ?auto_426333 ?auto_426343 ) ) ( not ( = ?auto_426333 ?auto_426344 ) ) ( not ( = ?auto_426333 ?auto_426345 ) ) ( not ( = ?auto_426334 ?auto_426335 ) ) ( not ( = ?auto_426334 ?auto_426336 ) ) ( not ( = ?auto_426334 ?auto_426337 ) ) ( not ( = ?auto_426334 ?auto_426338 ) ) ( not ( = ?auto_426334 ?auto_426339 ) ) ( not ( = ?auto_426334 ?auto_426340 ) ) ( not ( = ?auto_426334 ?auto_426341 ) ) ( not ( = ?auto_426334 ?auto_426342 ) ) ( not ( = ?auto_426334 ?auto_426343 ) ) ( not ( = ?auto_426334 ?auto_426344 ) ) ( not ( = ?auto_426334 ?auto_426345 ) ) ( not ( = ?auto_426335 ?auto_426336 ) ) ( not ( = ?auto_426335 ?auto_426337 ) ) ( not ( = ?auto_426335 ?auto_426338 ) ) ( not ( = ?auto_426335 ?auto_426339 ) ) ( not ( = ?auto_426335 ?auto_426340 ) ) ( not ( = ?auto_426335 ?auto_426341 ) ) ( not ( = ?auto_426335 ?auto_426342 ) ) ( not ( = ?auto_426335 ?auto_426343 ) ) ( not ( = ?auto_426335 ?auto_426344 ) ) ( not ( = ?auto_426335 ?auto_426345 ) ) ( not ( = ?auto_426336 ?auto_426337 ) ) ( not ( = ?auto_426336 ?auto_426338 ) ) ( not ( = ?auto_426336 ?auto_426339 ) ) ( not ( = ?auto_426336 ?auto_426340 ) ) ( not ( = ?auto_426336 ?auto_426341 ) ) ( not ( = ?auto_426336 ?auto_426342 ) ) ( not ( = ?auto_426336 ?auto_426343 ) ) ( not ( = ?auto_426336 ?auto_426344 ) ) ( not ( = ?auto_426336 ?auto_426345 ) ) ( not ( = ?auto_426337 ?auto_426338 ) ) ( not ( = ?auto_426337 ?auto_426339 ) ) ( not ( = ?auto_426337 ?auto_426340 ) ) ( not ( = ?auto_426337 ?auto_426341 ) ) ( not ( = ?auto_426337 ?auto_426342 ) ) ( not ( = ?auto_426337 ?auto_426343 ) ) ( not ( = ?auto_426337 ?auto_426344 ) ) ( not ( = ?auto_426337 ?auto_426345 ) ) ( not ( = ?auto_426338 ?auto_426339 ) ) ( not ( = ?auto_426338 ?auto_426340 ) ) ( not ( = ?auto_426338 ?auto_426341 ) ) ( not ( = ?auto_426338 ?auto_426342 ) ) ( not ( = ?auto_426338 ?auto_426343 ) ) ( not ( = ?auto_426338 ?auto_426344 ) ) ( not ( = ?auto_426338 ?auto_426345 ) ) ( not ( = ?auto_426339 ?auto_426340 ) ) ( not ( = ?auto_426339 ?auto_426341 ) ) ( not ( = ?auto_426339 ?auto_426342 ) ) ( not ( = ?auto_426339 ?auto_426343 ) ) ( not ( = ?auto_426339 ?auto_426344 ) ) ( not ( = ?auto_426339 ?auto_426345 ) ) ( not ( = ?auto_426340 ?auto_426341 ) ) ( not ( = ?auto_426340 ?auto_426342 ) ) ( not ( = ?auto_426340 ?auto_426343 ) ) ( not ( = ?auto_426340 ?auto_426344 ) ) ( not ( = ?auto_426340 ?auto_426345 ) ) ( not ( = ?auto_426341 ?auto_426342 ) ) ( not ( = ?auto_426341 ?auto_426343 ) ) ( not ( = ?auto_426341 ?auto_426344 ) ) ( not ( = ?auto_426341 ?auto_426345 ) ) ( not ( = ?auto_426342 ?auto_426343 ) ) ( not ( = ?auto_426342 ?auto_426344 ) ) ( not ( = ?auto_426342 ?auto_426345 ) ) ( not ( = ?auto_426343 ?auto_426344 ) ) ( not ( = ?auto_426343 ?auto_426345 ) ) ( not ( = ?auto_426344 ?auto_426345 ) ) ( ON ?auto_426343 ?auto_426344 ) ( ON ?auto_426342 ?auto_426343 ) ( ON ?auto_426341 ?auto_426342 ) ( ON ?auto_426340 ?auto_426341 ) ( ON ?auto_426339 ?auto_426340 ) ( CLEAR ?auto_426337 ) ( ON ?auto_426338 ?auto_426339 ) ( CLEAR ?auto_426338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_426332 ?auto_426333 ?auto_426334 ?auto_426335 ?auto_426336 ?auto_426337 ?auto_426338 )
      ( MAKE-13PILE ?auto_426332 ?auto_426333 ?auto_426334 ?auto_426335 ?auto_426336 ?auto_426337 ?auto_426338 ?auto_426339 ?auto_426340 ?auto_426341 ?auto_426342 ?auto_426343 ?auto_426344 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_426359 - BLOCK
      ?auto_426360 - BLOCK
      ?auto_426361 - BLOCK
      ?auto_426362 - BLOCK
      ?auto_426363 - BLOCK
      ?auto_426364 - BLOCK
      ?auto_426365 - BLOCK
      ?auto_426366 - BLOCK
      ?auto_426367 - BLOCK
      ?auto_426368 - BLOCK
      ?auto_426369 - BLOCK
      ?auto_426370 - BLOCK
      ?auto_426371 - BLOCK
    )
    :vars
    (
      ?auto_426372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426371 ?auto_426372 ) ( ON-TABLE ?auto_426359 ) ( ON ?auto_426360 ?auto_426359 ) ( ON ?auto_426361 ?auto_426360 ) ( ON ?auto_426362 ?auto_426361 ) ( ON ?auto_426363 ?auto_426362 ) ( not ( = ?auto_426359 ?auto_426360 ) ) ( not ( = ?auto_426359 ?auto_426361 ) ) ( not ( = ?auto_426359 ?auto_426362 ) ) ( not ( = ?auto_426359 ?auto_426363 ) ) ( not ( = ?auto_426359 ?auto_426364 ) ) ( not ( = ?auto_426359 ?auto_426365 ) ) ( not ( = ?auto_426359 ?auto_426366 ) ) ( not ( = ?auto_426359 ?auto_426367 ) ) ( not ( = ?auto_426359 ?auto_426368 ) ) ( not ( = ?auto_426359 ?auto_426369 ) ) ( not ( = ?auto_426359 ?auto_426370 ) ) ( not ( = ?auto_426359 ?auto_426371 ) ) ( not ( = ?auto_426359 ?auto_426372 ) ) ( not ( = ?auto_426360 ?auto_426361 ) ) ( not ( = ?auto_426360 ?auto_426362 ) ) ( not ( = ?auto_426360 ?auto_426363 ) ) ( not ( = ?auto_426360 ?auto_426364 ) ) ( not ( = ?auto_426360 ?auto_426365 ) ) ( not ( = ?auto_426360 ?auto_426366 ) ) ( not ( = ?auto_426360 ?auto_426367 ) ) ( not ( = ?auto_426360 ?auto_426368 ) ) ( not ( = ?auto_426360 ?auto_426369 ) ) ( not ( = ?auto_426360 ?auto_426370 ) ) ( not ( = ?auto_426360 ?auto_426371 ) ) ( not ( = ?auto_426360 ?auto_426372 ) ) ( not ( = ?auto_426361 ?auto_426362 ) ) ( not ( = ?auto_426361 ?auto_426363 ) ) ( not ( = ?auto_426361 ?auto_426364 ) ) ( not ( = ?auto_426361 ?auto_426365 ) ) ( not ( = ?auto_426361 ?auto_426366 ) ) ( not ( = ?auto_426361 ?auto_426367 ) ) ( not ( = ?auto_426361 ?auto_426368 ) ) ( not ( = ?auto_426361 ?auto_426369 ) ) ( not ( = ?auto_426361 ?auto_426370 ) ) ( not ( = ?auto_426361 ?auto_426371 ) ) ( not ( = ?auto_426361 ?auto_426372 ) ) ( not ( = ?auto_426362 ?auto_426363 ) ) ( not ( = ?auto_426362 ?auto_426364 ) ) ( not ( = ?auto_426362 ?auto_426365 ) ) ( not ( = ?auto_426362 ?auto_426366 ) ) ( not ( = ?auto_426362 ?auto_426367 ) ) ( not ( = ?auto_426362 ?auto_426368 ) ) ( not ( = ?auto_426362 ?auto_426369 ) ) ( not ( = ?auto_426362 ?auto_426370 ) ) ( not ( = ?auto_426362 ?auto_426371 ) ) ( not ( = ?auto_426362 ?auto_426372 ) ) ( not ( = ?auto_426363 ?auto_426364 ) ) ( not ( = ?auto_426363 ?auto_426365 ) ) ( not ( = ?auto_426363 ?auto_426366 ) ) ( not ( = ?auto_426363 ?auto_426367 ) ) ( not ( = ?auto_426363 ?auto_426368 ) ) ( not ( = ?auto_426363 ?auto_426369 ) ) ( not ( = ?auto_426363 ?auto_426370 ) ) ( not ( = ?auto_426363 ?auto_426371 ) ) ( not ( = ?auto_426363 ?auto_426372 ) ) ( not ( = ?auto_426364 ?auto_426365 ) ) ( not ( = ?auto_426364 ?auto_426366 ) ) ( not ( = ?auto_426364 ?auto_426367 ) ) ( not ( = ?auto_426364 ?auto_426368 ) ) ( not ( = ?auto_426364 ?auto_426369 ) ) ( not ( = ?auto_426364 ?auto_426370 ) ) ( not ( = ?auto_426364 ?auto_426371 ) ) ( not ( = ?auto_426364 ?auto_426372 ) ) ( not ( = ?auto_426365 ?auto_426366 ) ) ( not ( = ?auto_426365 ?auto_426367 ) ) ( not ( = ?auto_426365 ?auto_426368 ) ) ( not ( = ?auto_426365 ?auto_426369 ) ) ( not ( = ?auto_426365 ?auto_426370 ) ) ( not ( = ?auto_426365 ?auto_426371 ) ) ( not ( = ?auto_426365 ?auto_426372 ) ) ( not ( = ?auto_426366 ?auto_426367 ) ) ( not ( = ?auto_426366 ?auto_426368 ) ) ( not ( = ?auto_426366 ?auto_426369 ) ) ( not ( = ?auto_426366 ?auto_426370 ) ) ( not ( = ?auto_426366 ?auto_426371 ) ) ( not ( = ?auto_426366 ?auto_426372 ) ) ( not ( = ?auto_426367 ?auto_426368 ) ) ( not ( = ?auto_426367 ?auto_426369 ) ) ( not ( = ?auto_426367 ?auto_426370 ) ) ( not ( = ?auto_426367 ?auto_426371 ) ) ( not ( = ?auto_426367 ?auto_426372 ) ) ( not ( = ?auto_426368 ?auto_426369 ) ) ( not ( = ?auto_426368 ?auto_426370 ) ) ( not ( = ?auto_426368 ?auto_426371 ) ) ( not ( = ?auto_426368 ?auto_426372 ) ) ( not ( = ?auto_426369 ?auto_426370 ) ) ( not ( = ?auto_426369 ?auto_426371 ) ) ( not ( = ?auto_426369 ?auto_426372 ) ) ( not ( = ?auto_426370 ?auto_426371 ) ) ( not ( = ?auto_426370 ?auto_426372 ) ) ( not ( = ?auto_426371 ?auto_426372 ) ) ( ON ?auto_426370 ?auto_426371 ) ( ON ?auto_426369 ?auto_426370 ) ( ON ?auto_426368 ?auto_426369 ) ( ON ?auto_426367 ?auto_426368 ) ( ON ?auto_426366 ?auto_426367 ) ( ON ?auto_426365 ?auto_426366 ) ( CLEAR ?auto_426363 ) ( ON ?auto_426364 ?auto_426365 ) ( CLEAR ?auto_426364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_426359 ?auto_426360 ?auto_426361 ?auto_426362 ?auto_426363 ?auto_426364 )
      ( MAKE-13PILE ?auto_426359 ?auto_426360 ?auto_426361 ?auto_426362 ?auto_426363 ?auto_426364 ?auto_426365 ?auto_426366 ?auto_426367 ?auto_426368 ?auto_426369 ?auto_426370 ?auto_426371 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_426386 - BLOCK
      ?auto_426387 - BLOCK
      ?auto_426388 - BLOCK
      ?auto_426389 - BLOCK
      ?auto_426390 - BLOCK
      ?auto_426391 - BLOCK
      ?auto_426392 - BLOCK
      ?auto_426393 - BLOCK
      ?auto_426394 - BLOCK
      ?auto_426395 - BLOCK
      ?auto_426396 - BLOCK
      ?auto_426397 - BLOCK
      ?auto_426398 - BLOCK
    )
    :vars
    (
      ?auto_426399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426398 ?auto_426399 ) ( ON-TABLE ?auto_426386 ) ( ON ?auto_426387 ?auto_426386 ) ( ON ?auto_426388 ?auto_426387 ) ( ON ?auto_426389 ?auto_426388 ) ( ON ?auto_426390 ?auto_426389 ) ( not ( = ?auto_426386 ?auto_426387 ) ) ( not ( = ?auto_426386 ?auto_426388 ) ) ( not ( = ?auto_426386 ?auto_426389 ) ) ( not ( = ?auto_426386 ?auto_426390 ) ) ( not ( = ?auto_426386 ?auto_426391 ) ) ( not ( = ?auto_426386 ?auto_426392 ) ) ( not ( = ?auto_426386 ?auto_426393 ) ) ( not ( = ?auto_426386 ?auto_426394 ) ) ( not ( = ?auto_426386 ?auto_426395 ) ) ( not ( = ?auto_426386 ?auto_426396 ) ) ( not ( = ?auto_426386 ?auto_426397 ) ) ( not ( = ?auto_426386 ?auto_426398 ) ) ( not ( = ?auto_426386 ?auto_426399 ) ) ( not ( = ?auto_426387 ?auto_426388 ) ) ( not ( = ?auto_426387 ?auto_426389 ) ) ( not ( = ?auto_426387 ?auto_426390 ) ) ( not ( = ?auto_426387 ?auto_426391 ) ) ( not ( = ?auto_426387 ?auto_426392 ) ) ( not ( = ?auto_426387 ?auto_426393 ) ) ( not ( = ?auto_426387 ?auto_426394 ) ) ( not ( = ?auto_426387 ?auto_426395 ) ) ( not ( = ?auto_426387 ?auto_426396 ) ) ( not ( = ?auto_426387 ?auto_426397 ) ) ( not ( = ?auto_426387 ?auto_426398 ) ) ( not ( = ?auto_426387 ?auto_426399 ) ) ( not ( = ?auto_426388 ?auto_426389 ) ) ( not ( = ?auto_426388 ?auto_426390 ) ) ( not ( = ?auto_426388 ?auto_426391 ) ) ( not ( = ?auto_426388 ?auto_426392 ) ) ( not ( = ?auto_426388 ?auto_426393 ) ) ( not ( = ?auto_426388 ?auto_426394 ) ) ( not ( = ?auto_426388 ?auto_426395 ) ) ( not ( = ?auto_426388 ?auto_426396 ) ) ( not ( = ?auto_426388 ?auto_426397 ) ) ( not ( = ?auto_426388 ?auto_426398 ) ) ( not ( = ?auto_426388 ?auto_426399 ) ) ( not ( = ?auto_426389 ?auto_426390 ) ) ( not ( = ?auto_426389 ?auto_426391 ) ) ( not ( = ?auto_426389 ?auto_426392 ) ) ( not ( = ?auto_426389 ?auto_426393 ) ) ( not ( = ?auto_426389 ?auto_426394 ) ) ( not ( = ?auto_426389 ?auto_426395 ) ) ( not ( = ?auto_426389 ?auto_426396 ) ) ( not ( = ?auto_426389 ?auto_426397 ) ) ( not ( = ?auto_426389 ?auto_426398 ) ) ( not ( = ?auto_426389 ?auto_426399 ) ) ( not ( = ?auto_426390 ?auto_426391 ) ) ( not ( = ?auto_426390 ?auto_426392 ) ) ( not ( = ?auto_426390 ?auto_426393 ) ) ( not ( = ?auto_426390 ?auto_426394 ) ) ( not ( = ?auto_426390 ?auto_426395 ) ) ( not ( = ?auto_426390 ?auto_426396 ) ) ( not ( = ?auto_426390 ?auto_426397 ) ) ( not ( = ?auto_426390 ?auto_426398 ) ) ( not ( = ?auto_426390 ?auto_426399 ) ) ( not ( = ?auto_426391 ?auto_426392 ) ) ( not ( = ?auto_426391 ?auto_426393 ) ) ( not ( = ?auto_426391 ?auto_426394 ) ) ( not ( = ?auto_426391 ?auto_426395 ) ) ( not ( = ?auto_426391 ?auto_426396 ) ) ( not ( = ?auto_426391 ?auto_426397 ) ) ( not ( = ?auto_426391 ?auto_426398 ) ) ( not ( = ?auto_426391 ?auto_426399 ) ) ( not ( = ?auto_426392 ?auto_426393 ) ) ( not ( = ?auto_426392 ?auto_426394 ) ) ( not ( = ?auto_426392 ?auto_426395 ) ) ( not ( = ?auto_426392 ?auto_426396 ) ) ( not ( = ?auto_426392 ?auto_426397 ) ) ( not ( = ?auto_426392 ?auto_426398 ) ) ( not ( = ?auto_426392 ?auto_426399 ) ) ( not ( = ?auto_426393 ?auto_426394 ) ) ( not ( = ?auto_426393 ?auto_426395 ) ) ( not ( = ?auto_426393 ?auto_426396 ) ) ( not ( = ?auto_426393 ?auto_426397 ) ) ( not ( = ?auto_426393 ?auto_426398 ) ) ( not ( = ?auto_426393 ?auto_426399 ) ) ( not ( = ?auto_426394 ?auto_426395 ) ) ( not ( = ?auto_426394 ?auto_426396 ) ) ( not ( = ?auto_426394 ?auto_426397 ) ) ( not ( = ?auto_426394 ?auto_426398 ) ) ( not ( = ?auto_426394 ?auto_426399 ) ) ( not ( = ?auto_426395 ?auto_426396 ) ) ( not ( = ?auto_426395 ?auto_426397 ) ) ( not ( = ?auto_426395 ?auto_426398 ) ) ( not ( = ?auto_426395 ?auto_426399 ) ) ( not ( = ?auto_426396 ?auto_426397 ) ) ( not ( = ?auto_426396 ?auto_426398 ) ) ( not ( = ?auto_426396 ?auto_426399 ) ) ( not ( = ?auto_426397 ?auto_426398 ) ) ( not ( = ?auto_426397 ?auto_426399 ) ) ( not ( = ?auto_426398 ?auto_426399 ) ) ( ON ?auto_426397 ?auto_426398 ) ( ON ?auto_426396 ?auto_426397 ) ( ON ?auto_426395 ?auto_426396 ) ( ON ?auto_426394 ?auto_426395 ) ( ON ?auto_426393 ?auto_426394 ) ( ON ?auto_426392 ?auto_426393 ) ( CLEAR ?auto_426390 ) ( ON ?auto_426391 ?auto_426392 ) ( CLEAR ?auto_426391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_426386 ?auto_426387 ?auto_426388 ?auto_426389 ?auto_426390 ?auto_426391 )
      ( MAKE-13PILE ?auto_426386 ?auto_426387 ?auto_426388 ?auto_426389 ?auto_426390 ?auto_426391 ?auto_426392 ?auto_426393 ?auto_426394 ?auto_426395 ?auto_426396 ?auto_426397 ?auto_426398 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_426413 - BLOCK
      ?auto_426414 - BLOCK
      ?auto_426415 - BLOCK
      ?auto_426416 - BLOCK
      ?auto_426417 - BLOCK
      ?auto_426418 - BLOCK
      ?auto_426419 - BLOCK
      ?auto_426420 - BLOCK
      ?auto_426421 - BLOCK
      ?auto_426422 - BLOCK
      ?auto_426423 - BLOCK
      ?auto_426424 - BLOCK
      ?auto_426425 - BLOCK
    )
    :vars
    (
      ?auto_426426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426425 ?auto_426426 ) ( ON-TABLE ?auto_426413 ) ( ON ?auto_426414 ?auto_426413 ) ( ON ?auto_426415 ?auto_426414 ) ( ON ?auto_426416 ?auto_426415 ) ( not ( = ?auto_426413 ?auto_426414 ) ) ( not ( = ?auto_426413 ?auto_426415 ) ) ( not ( = ?auto_426413 ?auto_426416 ) ) ( not ( = ?auto_426413 ?auto_426417 ) ) ( not ( = ?auto_426413 ?auto_426418 ) ) ( not ( = ?auto_426413 ?auto_426419 ) ) ( not ( = ?auto_426413 ?auto_426420 ) ) ( not ( = ?auto_426413 ?auto_426421 ) ) ( not ( = ?auto_426413 ?auto_426422 ) ) ( not ( = ?auto_426413 ?auto_426423 ) ) ( not ( = ?auto_426413 ?auto_426424 ) ) ( not ( = ?auto_426413 ?auto_426425 ) ) ( not ( = ?auto_426413 ?auto_426426 ) ) ( not ( = ?auto_426414 ?auto_426415 ) ) ( not ( = ?auto_426414 ?auto_426416 ) ) ( not ( = ?auto_426414 ?auto_426417 ) ) ( not ( = ?auto_426414 ?auto_426418 ) ) ( not ( = ?auto_426414 ?auto_426419 ) ) ( not ( = ?auto_426414 ?auto_426420 ) ) ( not ( = ?auto_426414 ?auto_426421 ) ) ( not ( = ?auto_426414 ?auto_426422 ) ) ( not ( = ?auto_426414 ?auto_426423 ) ) ( not ( = ?auto_426414 ?auto_426424 ) ) ( not ( = ?auto_426414 ?auto_426425 ) ) ( not ( = ?auto_426414 ?auto_426426 ) ) ( not ( = ?auto_426415 ?auto_426416 ) ) ( not ( = ?auto_426415 ?auto_426417 ) ) ( not ( = ?auto_426415 ?auto_426418 ) ) ( not ( = ?auto_426415 ?auto_426419 ) ) ( not ( = ?auto_426415 ?auto_426420 ) ) ( not ( = ?auto_426415 ?auto_426421 ) ) ( not ( = ?auto_426415 ?auto_426422 ) ) ( not ( = ?auto_426415 ?auto_426423 ) ) ( not ( = ?auto_426415 ?auto_426424 ) ) ( not ( = ?auto_426415 ?auto_426425 ) ) ( not ( = ?auto_426415 ?auto_426426 ) ) ( not ( = ?auto_426416 ?auto_426417 ) ) ( not ( = ?auto_426416 ?auto_426418 ) ) ( not ( = ?auto_426416 ?auto_426419 ) ) ( not ( = ?auto_426416 ?auto_426420 ) ) ( not ( = ?auto_426416 ?auto_426421 ) ) ( not ( = ?auto_426416 ?auto_426422 ) ) ( not ( = ?auto_426416 ?auto_426423 ) ) ( not ( = ?auto_426416 ?auto_426424 ) ) ( not ( = ?auto_426416 ?auto_426425 ) ) ( not ( = ?auto_426416 ?auto_426426 ) ) ( not ( = ?auto_426417 ?auto_426418 ) ) ( not ( = ?auto_426417 ?auto_426419 ) ) ( not ( = ?auto_426417 ?auto_426420 ) ) ( not ( = ?auto_426417 ?auto_426421 ) ) ( not ( = ?auto_426417 ?auto_426422 ) ) ( not ( = ?auto_426417 ?auto_426423 ) ) ( not ( = ?auto_426417 ?auto_426424 ) ) ( not ( = ?auto_426417 ?auto_426425 ) ) ( not ( = ?auto_426417 ?auto_426426 ) ) ( not ( = ?auto_426418 ?auto_426419 ) ) ( not ( = ?auto_426418 ?auto_426420 ) ) ( not ( = ?auto_426418 ?auto_426421 ) ) ( not ( = ?auto_426418 ?auto_426422 ) ) ( not ( = ?auto_426418 ?auto_426423 ) ) ( not ( = ?auto_426418 ?auto_426424 ) ) ( not ( = ?auto_426418 ?auto_426425 ) ) ( not ( = ?auto_426418 ?auto_426426 ) ) ( not ( = ?auto_426419 ?auto_426420 ) ) ( not ( = ?auto_426419 ?auto_426421 ) ) ( not ( = ?auto_426419 ?auto_426422 ) ) ( not ( = ?auto_426419 ?auto_426423 ) ) ( not ( = ?auto_426419 ?auto_426424 ) ) ( not ( = ?auto_426419 ?auto_426425 ) ) ( not ( = ?auto_426419 ?auto_426426 ) ) ( not ( = ?auto_426420 ?auto_426421 ) ) ( not ( = ?auto_426420 ?auto_426422 ) ) ( not ( = ?auto_426420 ?auto_426423 ) ) ( not ( = ?auto_426420 ?auto_426424 ) ) ( not ( = ?auto_426420 ?auto_426425 ) ) ( not ( = ?auto_426420 ?auto_426426 ) ) ( not ( = ?auto_426421 ?auto_426422 ) ) ( not ( = ?auto_426421 ?auto_426423 ) ) ( not ( = ?auto_426421 ?auto_426424 ) ) ( not ( = ?auto_426421 ?auto_426425 ) ) ( not ( = ?auto_426421 ?auto_426426 ) ) ( not ( = ?auto_426422 ?auto_426423 ) ) ( not ( = ?auto_426422 ?auto_426424 ) ) ( not ( = ?auto_426422 ?auto_426425 ) ) ( not ( = ?auto_426422 ?auto_426426 ) ) ( not ( = ?auto_426423 ?auto_426424 ) ) ( not ( = ?auto_426423 ?auto_426425 ) ) ( not ( = ?auto_426423 ?auto_426426 ) ) ( not ( = ?auto_426424 ?auto_426425 ) ) ( not ( = ?auto_426424 ?auto_426426 ) ) ( not ( = ?auto_426425 ?auto_426426 ) ) ( ON ?auto_426424 ?auto_426425 ) ( ON ?auto_426423 ?auto_426424 ) ( ON ?auto_426422 ?auto_426423 ) ( ON ?auto_426421 ?auto_426422 ) ( ON ?auto_426420 ?auto_426421 ) ( ON ?auto_426419 ?auto_426420 ) ( ON ?auto_426418 ?auto_426419 ) ( CLEAR ?auto_426416 ) ( ON ?auto_426417 ?auto_426418 ) ( CLEAR ?auto_426417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_426413 ?auto_426414 ?auto_426415 ?auto_426416 ?auto_426417 )
      ( MAKE-13PILE ?auto_426413 ?auto_426414 ?auto_426415 ?auto_426416 ?auto_426417 ?auto_426418 ?auto_426419 ?auto_426420 ?auto_426421 ?auto_426422 ?auto_426423 ?auto_426424 ?auto_426425 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_426440 - BLOCK
      ?auto_426441 - BLOCK
      ?auto_426442 - BLOCK
      ?auto_426443 - BLOCK
      ?auto_426444 - BLOCK
      ?auto_426445 - BLOCK
      ?auto_426446 - BLOCK
      ?auto_426447 - BLOCK
      ?auto_426448 - BLOCK
      ?auto_426449 - BLOCK
      ?auto_426450 - BLOCK
      ?auto_426451 - BLOCK
      ?auto_426452 - BLOCK
    )
    :vars
    (
      ?auto_426453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426452 ?auto_426453 ) ( ON-TABLE ?auto_426440 ) ( ON ?auto_426441 ?auto_426440 ) ( ON ?auto_426442 ?auto_426441 ) ( ON ?auto_426443 ?auto_426442 ) ( not ( = ?auto_426440 ?auto_426441 ) ) ( not ( = ?auto_426440 ?auto_426442 ) ) ( not ( = ?auto_426440 ?auto_426443 ) ) ( not ( = ?auto_426440 ?auto_426444 ) ) ( not ( = ?auto_426440 ?auto_426445 ) ) ( not ( = ?auto_426440 ?auto_426446 ) ) ( not ( = ?auto_426440 ?auto_426447 ) ) ( not ( = ?auto_426440 ?auto_426448 ) ) ( not ( = ?auto_426440 ?auto_426449 ) ) ( not ( = ?auto_426440 ?auto_426450 ) ) ( not ( = ?auto_426440 ?auto_426451 ) ) ( not ( = ?auto_426440 ?auto_426452 ) ) ( not ( = ?auto_426440 ?auto_426453 ) ) ( not ( = ?auto_426441 ?auto_426442 ) ) ( not ( = ?auto_426441 ?auto_426443 ) ) ( not ( = ?auto_426441 ?auto_426444 ) ) ( not ( = ?auto_426441 ?auto_426445 ) ) ( not ( = ?auto_426441 ?auto_426446 ) ) ( not ( = ?auto_426441 ?auto_426447 ) ) ( not ( = ?auto_426441 ?auto_426448 ) ) ( not ( = ?auto_426441 ?auto_426449 ) ) ( not ( = ?auto_426441 ?auto_426450 ) ) ( not ( = ?auto_426441 ?auto_426451 ) ) ( not ( = ?auto_426441 ?auto_426452 ) ) ( not ( = ?auto_426441 ?auto_426453 ) ) ( not ( = ?auto_426442 ?auto_426443 ) ) ( not ( = ?auto_426442 ?auto_426444 ) ) ( not ( = ?auto_426442 ?auto_426445 ) ) ( not ( = ?auto_426442 ?auto_426446 ) ) ( not ( = ?auto_426442 ?auto_426447 ) ) ( not ( = ?auto_426442 ?auto_426448 ) ) ( not ( = ?auto_426442 ?auto_426449 ) ) ( not ( = ?auto_426442 ?auto_426450 ) ) ( not ( = ?auto_426442 ?auto_426451 ) ) ( not ( = ?auto_426442 ?auto_426452 ) ) ( not ( = ?auto_426442 ?auto_426453 ) ) ( not ( = ?auto_426443 ?auto_426444 ) ) ( not ( = ?auto_426443 ?auto_426445 ) ) ( not ( = ?auto_426443 ?auto_426446 ) ) ( not ( = ?auto_426443 ?auto_426447 ) ) ( not ( = ?auto_426443 ?auto_426448 ) ) ( not ( = ?auto_426443 ?auto_426449 ) ) ( not ( = ?auto_426443 ?auto_426450 ) ) ( not ( = ?auto_426443 ?auto_426451 ) ) ( not ( = ?auto_426443 ?auto_426452 ) ) ( not ( = ?auto_426443 ?auto_426453 ) ) ( not ( = ?auto_426444 ?auto_426445 ) ) ( not ( = ?auto_426444 ?auto_426446 ) ) ( not ( = ?auto_426444 ?auto_426447 ) ) ( not ( = ?auto_426444 ?auto_426448 ) ) ( not ( = ?auto_426444 ?auto_426449 ) ) ( not ( = ?auto_426444 ?auto_426450 ) ) ( not ( = ?auto_426444 ?auto_426451 ) ) ( not ( = ?auto_426444 ?auto_426452 ) ) ( not ( = ?auto_426444 ?auto_426453 ) ) ( not ( = ?auto_426445 ?auto_426446 ) ) ( not ( = ?auto_426445 ?auto_426447 ) ) ( not ( = ?auto_426445 ?auto_426448 ) ) ( not ( = ?auto_426445 ?auto_426449 ) ) ( not ( = ?auto_426445 ?auto_426450 ) ) ( not ( = ?auto_426445 ?auto_426451 ) ) ( not ( = ?auto_426445 ?auto_426452 ) ) ( not ( = ?auto_426445 ?auto_426453 ) ) ( not ( = ?auto_426446 ?auto_426447 ) ) ( not ( = ?auto_426446 ?auto_426448 ) ) ( not ( = ?auto_426446 ?auto_426449 ) ) ( not ( = ?auto_426446 ?auto_426450 ) ) ( not ( = ?auto_426446 ?auto_426451 ) ) ( not ( = ?auto_426446 ?auto_426452 ) ) ( not ( = ?auto_426446 ?auto_426453 ) ) ( not ( = ?auto_426447 ?auto_426448 ) ) ( not ( = ?auto_426447 ?auto_426449 ) ) ( not ( = ?auto_426447 ?auto_426450 ) ) ( not ( = ?auto_426447 ?auto_426451 ) ) ( not ( = ?auto_426447 ?auto_426452 ) ) ( not ( = ?auto_426447 ?auto_426453 ) ) ( not ( = ?auto_426448 ?auto_426449 ) ) ( not ( = ?auto_426448 ?auto_426450 ) ) ( not ( = ?auto_426448 ?auto_426451 ) ) ( not ( = ?auto_426448 ?auto_426452 ) ) ( not ( = ?auto_426448 ?auto_426453 ) ) ( not ( = ?auto_426449 ?auto_426450 ) ) ( not ( = ?auto_426449 ?auto_426451 ) ) ( not ( = ?auto_426449 ?auto_426452 ) ) ( not ( = ?auto_426449 ?auto_426453 ) ) ( not ( = ?auto_426450 ?auto_426451 ) ) ( not ( = ?auto_426450 ?auto_426452 ) ) ( not ( = ?auto_426450 ?auto_426453 ) ) ( not ( = ?auto_426451 ?auto_426452 ) ) ( not ( = ?auto_426451 ?auto_426453 ) ) ( not ( = ?auto_426452 ?auto_426453 ) ) ( ON ?auto_426451 ?auto_426452 ) ( ON ?auto_426450 ?auto_426451 ) ( ON ?auto_426449 ?auto_426450 ) ( ON ?auto_426448 ?auto_426449 ) ( ON ?auto_426447 ?auto_426448 ) ( ON ?auto_426446 ?auto_426447 ) ( ON ?auto_426445 ?auto_426446 ) ( CLEAR ?auto_426443 ) ( ON ?auto_426444 ?auto_426445 ) ( CLEAR ?auto_426444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_426440 ?auto_426441 ?auto_426442 ?auto_426443 ?auto_426444 )
      ( MAKE-13PILE ?auto_426440 ?auto_426441 ?auto_426442 ?auto_426443 ?auto_426444 ?auto_426445 ?auto_426446 ?auto_426447 ?auto_426448 ?auto_426449 ?auto_426450 ?auto_426451 ?auto_426452 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_426467 - BLOCK
      ?auto_426468 - BLOCK
      ?auto_426469 - BLOCK
      ?auto_426470 - BLOCK
      ?auto_426471 - BLOCK
      ?auto_426472 - BLOCK
      ?auto_426473 - BLOCK
      ?auto_426474 - BLOCK
      ?auto_426475 - BLOCK
      ?auto_426476 - BLOCK
      ?auto_426477 - BLOCK
      ?auto_426478 - BLOCK
      ?auto_426479 - BLOCK
    )
    :vars
    (
      ?auto_426480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426479 ?auto_426480 ) ( ON-TABLE ?auto_426467 ) ( ON ?auto_426468 ?auto_426467 ) ( ON ?auto_426469 ?auto_426468 ) ( not ( = ?auto_426467 ?auto_426468 ) ) ( not ( = ?auto_426467 ?auto_426469 ) ) ( not ( = ?auto_426467 ?auto_426470 ) ) ( not ( = ?auto_426467 ?auto_426471 ) ) ( not ( = ?auto_426467 ?auto_426472 ) ) ( not ( = ?auto_426467 ?auto_426473 ) ) ( not ( = ?auto_426467 ?auto_426474 ) ) ( not ( = ?auto_426467 ?auto_426475 ) ) ( not ( = ?auto_426467 ?auto_426476 ) ) ( not ( = ?auto_426467 ?auto_426477 ) ) ( not ( = ?auto_426467 ?auto_426478 ) ) ( not ( = ?auto_426467 ?auto_426479 ) ) ( not ( = ?auto_426467 ?auto_426480 ) ) ( not ( = ?auto_426468 ?auto_426469 ) ) ( not ( = ?auto_426468 ?auto_426470 ) ) ( not ( = ?auto_426468 ?auto_426471 ) ) ( not ( = ?auto_426468 ?auto_426472 ) ) ( not ( = ?auto_426468 ?auto_426473 ) ) ( not ( = ?auto_426468 ?auto_426474 ) ) ( not ( = ?auto_426468 ?auto_426475 ) ) ( not ( = ?auto_426468 ?auto_426476 ) ) ( not ( = ?auto_426468 ?auto_426477 ) ) ( not ( = ?auto_426468 ?auto_426478 ) ) ( not ( = ?auto_426468 ?auto_426479 ) ) ( not ( = ?auto_426468 ?auto_426480 ) ) ( not ( = ?auto_426469 ?auto_426470 ) ) ( not ( = ?auto_426469 ?auto_426471 ) ) ( not ( = ?auto_426469 ?auto_426472 ) ) ( not ( = ?auto_426469 ?auto_426473 ) ) ( not ( = ?auto_426469 ?auto_426474 ) ) ( not ( = ?auto_426469 ?auto_426475 ) ) ( not ( = ?auto_426469 ?auto_426476 ) ) ( not ( = ?auto_426469 ?auto_426477 ) ) ( not ( = ?auto_426469 ?auto_426478 ) ) ( not ( = ?auto_426469 ?auto_426479 ) ) ( not ( = ?auto_426469 ?auto_426480 ) ) ( not ( = ?auto_426470 ?auto_426471 ) ) ( not ( = ?auto_426470 ?auto_426472 ) ) ( not ( = ?auto_426470 ?auto_426473 ) ) ( not ( = ?auto_426470 ?auto_426474 ) ) ( not ( = ?auto_426470 ?auto_426475 ) ) ( not ( = ?auto_426470 ?auto_426476 ) ) ( not ( = ?auto_426470 ?auto_426477 ) ) ( not ( = ?auto_426470 ?auto_426478 ) ) ( not ( = ?auto_426470 ?auto_426479 ) ) ( not ( = ?auto_426470 ?auto_426480 ) ) ( not ( = ?auto_426471 ?auto_426472 ) ) ( not ( = ?auto_426471 ?auto_426473 ) ) ( not ( = ?auto_426471 ?auto_426474 ) ) ( not ( = ?auto_426471 ?auto_426475 ) ) ( not ( = ?auto_426471 ?auto_426476 ) ) ( not ( = ?auto_426471 ?auto_426477 ) ) ( not ( = ?auto_426471 ?auto_426478 ) ) ( not ( = ?auto_426471 ?auto_426479 ) ) ( not ( = ?auto_426471 ?auto_426480 ) ) ( not ( = ?auto_426472 ?auto_426473 ) ) ( not ( = ?auto_426472 ?auto_426474 ) ) ( not ( = ?auto_426472 ?auto_426475 ) ) ( not ( = ?auto_426472 ?auto_426476 ) ) ( not ( = ?auto_426472 ?auto_426477 ) ) ( not ( = ?auto_426472 ?auto_426478 ) ) ( not ( = ?auto_426472 ?auto_426479 ) ) ( not ( = ?auto_426472 ?auto_426480 ) ) ( not ( = ?auto_426473 ?auto_426474 ) ) ( not ( = ?auto_426473 ?auto_426475 ) ) ( not ( = ?auto_426473 ?auto_426476 ) ) ( not ( = ?auto_426473 ?auto_426477 ) ) ( not ( = ?auto_426473 ?auto_426478 ) ) ( not ( = ?auto_426473 ?auto_426479 ) ) ( not ( = ?auto_426473 ?auto_426480 ) ) ( not ( = ?auto_426474 ?auto_426475 ) ) ( not ( = ?auto_426474 ?auto_426476 ) ) ( not ( = ?auto_426474 ?auto_426477 ) ) ( not ( = ?auto_426474 ?auto_426478 ) ) ( not ( = ?auto_426474 ?auto_426479 ) ) ( not ( = ?auto_426474 ?auto_426480 ) ) ( not ( = ?auto_426475 ?auto_426476 ) ) ( not ( = ?auto_426475 ?auto_426477 ) ) ( not ( = ?auto_426475 ?auto_426478 ) ) ( not ( = ?auto_426475 ?auto_426479 ) ) ( not ( = ?auto_426475 ?auto_426480 ) ) ( not ( = ?auto_426476 ?auto_426477 ) ) ( not ( = ?auto_426476 ?auto_426478 ) ) ( not ( = ?auto_426476 ?auto_426479 ) ) ( not ( = ?auto_426476 ?auto_426480 ) ) ( not ( = ?auto_426477 ?auto_426478 ) ) ( not ( = ?auto_426477 ?auto_426479 ) ) ( not ( = ?auto_426477 ?auto_426480 ) ) ( not ( = ?auto_426478 ?auto_426479 ) ) ( not ( = ?auto_426478 ?auto_426480 ) ) ( not ( = ?auto_426479 ?auto_426480 ) ) ( ON ?auto_426478 ?auto_426479 ) ( ON ?auto_426477 ?auto_426478 ) ( ON ?auto_426476 ?auto_426477 ) ( ON ?auto_426475 ?auto_426476 ) ( ON ?auto_426474 ?auto_426475 ) ( ON ?auto_426473 ?auto_426474 ) ( ON ?auto_426472 ?auto_426473 ) ( ON ?auto_426471 ?auto_426472 ) ( CLEAR ?auto_426469 ) ( ON ?auto_426470 ?auto_426471 ) ( CLEAR ?auto_426470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_426467 ?auto_426468 ?auto_426469 ?auto_426470 )
      ( MAKE-13PILE ?auto_426467 ?auto_426468 ?auto_426469 ?auto_426470 ?auto_426471 ?auto_426472 ?auto_426473 ?auto_426474 ?auto_426475 ?auto_426476 ?auto_426477 ?auto_426478 ?auto_426479 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_426494 - BLOCK
      ?auto_426495 - BLOCK
      ?auto_426496 - BLOCK
      ?auto_426497 - BLOCK
      ?auto_426498 - BLOCK
      ?auto_426499 - BLOCK
      ?auto_426500 - BLOCK
      ?auto_426501 - BLOCK
      ?auto_426502 - BLOCK
      ?auto_426503 - BLOCK
      ?auto_426504 - BLOCK
      ?auto_426505 - BLOCK
      ?auto_426506 - BLOCK
    )
    :vars
    (
      ?auto_426507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426506 ?auto_426507 ) ( ON-TABLE ?auto_426494 ) ( ON ?auto_426495 ?auto_426494 ) ( ON ?auto_426496 ?auto_426495 ) ( not ( = ?auto_426494 ?auto_426495 ) ) ( not ( = ?auto_426494 ?auto_426496 ) ) ( not ( = ?auto_426494 ?auto_426497 ) ) ( not ( = ?auto_426494 ?auto_426498 ) ) ( not ( = ?auto_426494 ?auto_426499 ) ) ( not ( = ?auto_426494 ?auto_426500 ) ) ( not ( = ?auto_426494 ?auto_426501 ) ) ( not ( = ?auto_426494 ?auto_426502 ) ) ( not ( = ?auto_426494 ?auto_426503 ) ) ( not ( = ?auto_426494 ?auto_426504 ) ) ( not ( = ?auto_426494 ?auto_426505 ) ) ( not ( = ?auto_426494 ?auto_426506 ) ) ( not ( = ?auto_426494 ?auto_426507 ) ) ( not ( = ?auto_426495 ?auto_426496 ) ) ( not ( = ?auto_426495 ?auto_426497 ) ) ( not ( = ?auto_426495 ?auto_426498 ) ) ( not ( = ?auto_426495 ?auto_426499 ) ) ( not ( = ?auto_426495 ?auto_426500 ) ) ( not ( = ?auto_426495 ?auto_426501 ) ) ( not ( = ?auto_426495 ?auto_426502 ) ) ( not ( = ?auto_426495 ?auto_426503 ) ) ( not ( = ?auto_426495 ?auto_426504 ) ) ( not ( = ?auto_426495 ?auto_426505 ) ) ( not ( = ?auto_426495 ?auto_426506 ) ) ( not ( = ?auto_426495 ?auto_426507 ) ) ( not ( = ?auto_426496 ?auto_426497 ) ) ( not ( = ?auto_426496 ?auto_426498 ) ) ( not ( = ?auto_426496 ?auto_426499 ) ) ( not ( = ?auto_426496 ?auto_426500 ) ) ( not ( = ?auto_426496 ?auto_426501 ) ) ( not ( = ?auto_426496 ?auto_426502 ) ) ( not ( = ?auto_426496 ?auto_426503 ) ) ( not ( = ?auto_426496 ?auto_426504 ) ) ( not ( = ?auto_426496 ?auto_426505 ) ) ( not ( = ?auto_426496 ?auto_426506 ) ) ( not ( = ?auto_426496 ?auto_426507 ) ) ( not ( = ?auto_426497 ?auto_426498 ) ) ( not ( = ?auto_426497 ?auto_426499 ) ) ( not ( = ?auto_426497 ?auto_426500 ) ) ( not ( = ?auto_426497 ?auto_426501 ) ) ( not ( = ?auto_426497 ?auto_426502 ) ) ( not ( = ?auto_426497 ?auto_426503 ) ) ( not ( = ?auto_426497 ?auto_426504 ) ) ( not ( = ?auto_426497 ?auto_426505 ) ) ( not ( = ?auto_426497 ?auto_426506 ) ) ( not ( = ?auto_426497 ?auto_426507 ) ) ( not ( = ?auto_426498 ?auto_426499 ) ) ( not ( = ?auto_426498 ?auto_426500 ) ) ( not ( = ?auto_426498 ?auto_426501 ) ) ( not ( = ?auto_426498 ?auto_426502 ) ) ( not ( = ?auto_426498 ?auto_426503 ) ) ( not ( = ?auto_426498 ?auto_426504 ) ) ( not ( = ?auto_426498 ?auto_426505 ) ) ( not ( = ?auto_426498 ?auto_426506 ) ) ( not ( = ?auto_426498 ?auto_426507 ) ) ( not ( = ?auto_426499 ?auto_426500 ) ) ( not ( = ?auto_426499 ?auto_426501 ) ) ( not ( = ?auto_426499 ?auto_426502 ) ) ( not ( = ?auto_426499 ?auto_426503 ) ) ( not ( = ?auto_426499 ?auto_426504 ) ) ( not ( = ?auto_426499 ?auto_426505 ) ) ( not ( = ?auto_426499 ?auto_426506 ) ) ( not ( = ?auto_426499 ?auto_426507 ) ) ( not ( = ?auto_426500 ?auto_426501 ) ) ( not ( = ?auto_426500 ?auto_426502 ) ) ( not ( = ?auto_426500 ?auto_426503 ) ) ( not ( = ?auto_426500 ?auto_426504 ) ) ( not ( = ?auto_426500 ?auto_426505 ) ) ( not ( = ?auto_426500 ?auto_426506 ) ) ( not ( = ?auto_426500 ?auto_426507 ) ) ( not ( = ?auto_426501 ?auto_426502 ) ) ( not ( = ?auto_426501 ?auto_426503 ) ) ( not ( = ?auto_426501 ?auto_426504 ) ) ( not ( = ?auto_426501 ?auto_426505 ) ) ( not ( = ?auto_426501 ?auto_426506 ) ) ( not ( = ?auto_426501 ?auto_426507 ) ) ( not ( = ?auto_426502 ?auto_426503 ) ) ( not ( = ?auto_426502 ?auto_426504 ) ) ( not ( = ?auto_426502 ?auto_426505 ) ) ( not ( = ?auto_426502 ?auto_426506 ) ) ( not ( = ?auto_426502 ?auto_426507 ) ) ( not ( = ?auto_426503 ?auto_426504 ) ) ( not ( = ?auto_426503 ?auto_426505 ) ) ( not ( = ?auto_426503 ?auto_426506 ) ) ( not ( = ?auto_426503 ?auto_426507 ) ) ( not ( = ?auto_426504 ?auto_426505 ) ) ( not ( = ?auto_426504 ?auto_426506 ) ) ( not ( = ?auto_426504 ?auto_426507 ) ) ( not ( = ?auto_426505 ?auto_426506 ) ) ( not ( = ?auto_426505 ?auto_426507 ) ) ( not ( = ?auto_426506 ?auto_426507 ) ) ( ON ?auto_426505 ?auto_426506 ) ( ON ?auto_426504 ?auto_426505 ) ( ON ?auto_426503 ?auto_426504 ) ( ON ?auto_426502 ?auto_426503 ) ( ON ?auto_426501 ?auto_426502 ) ( ON ?auto_426500 ?auto_426501 ) ( ON ?auto_426499 ?auto_426500 ) ( ON ?auto_426498 ?auto_426499 ) ( CLEAR ?auto_426496 ) ( ON ?auto_426497 ?auto_426498 ) ( CLEAR ?auto_426497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_426494 ?auto_426495 ?auto_426496 ?auto_426497 )
      ( MAKE-13PILE ?auto_426494 ?auto_426495 ?auto_426496 ?auto_426497 ?auto_426498 ?auto_426499 ?auto_426500 ?auto_426501 ?auto_426502 ?auto_426503 ?auto_426504 ?auto_426505 ?auto_426506 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_426521 - BLOCK
      ?auto_426522 - BLOCK
      ?auto_426523 - BLOCK
      ?auto_426524 - BLOCK
      ?auto_426525 - BLOCK
      ?auto_426526 - BLOCK
      ?auto_426527 - BLOCK
      ?auto_426528 - BLOCK
      ?auto_426529 - BLOCK
      ?auto_426530 - BLOCK
      ?auto_426531 - BLOCK
      ?auto_426532 - BLOCK
      ?auto_426533 - BLOCK
    )
    :vars
    (
      ?auto_426534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426533 ?auto_426534 ) ( ON-TABLE ?auto_426521 ) ( ON ?auto_426522 ?auto_426521 ) ( not ( = ?auto_426521 ?auto_426522 ) ) ( not ( = ?auto_426521 ?auto_426523 ) ) ( not ( = ?auto_426521 ?auto_426524 ) ) ( not ( = ?auto_426521 ?auto_426525 ) ) ( not ( = ?auto_426521 ?auto_426526 ) ) ( not ( = ?auto_426521 ?auto_426527 ) ) ( not ( = ?auto_426521 ?auto_426528 ) ) ( not ( = ?auto_426521 ?auto_426529 ) ) ( not ( = ?auto_426521 ?auto_426530 ) ) ( not ( = ?auto_426521 ?auto_426531 ) ) ( not ( = ?auto_426521 ?auto_426532 ) ) ( not ( = ?auto_426521 ?auto_426533 ) ) ( not ( = ?auto_426521 ?auto_426534 ) ) ( not ( = ?auto_426522 ?auto_426523 ) ) ( not ( = ?auto_426522 ?auto_426524 ) ) ( not ( = ?auto_426522 ?auto_426525 ) ) ( not ( = ?auto_426522 ?auto_426526 ) ) ( not ( = ?auto_426522 ?auto_426527 ) ) ( not ( = ?auto_426522 ?auto_426528 ) ) ( not ( = ?auto_426522 ?auto_426529 ) ) ( not ( = ?auto_426522 ?auto_426530 ) ) ( not ( = ?auto_426522 ?auto_426531 ) ) ( not ( = ?auto_426522 ?auto_426532 ) ) ( not ( = ?auto_426522 ?auto_426533 ) ) ( not ( = ?auto_426522 ?auto_426534 ) ) ( not ( = ?auto_426523 ?auto_426524 ) ) ( not ( = ?auto_426523 ?auto_426525 ) ) ( not ( = ?auto_426523 ?auto_426526 ) ) ( not ( = ?auto_426523 ?auto_426527 ) ) ( not ( = ?auto_426523 ?auto_426528 ) ) ( not ( = ?auto_426523 ?auto_426529 ) ) ( not ( = ?auto_426523 ?auto_426530 ) ) ( not ( = ?auto_426523 ?auto_426531 ) ) ( not ( = ?auto_426523 ?auto_426532 ) ) ( not ( = ?auto_426523 ?auto_426533 ) ) ( not ( = ?auto_426523 ?auto_426534 ) ) ( not ( = ?auto_426524 ?auto_426525 ) ) ( not ( = ?auto_426524 ?auto_426526 ) ) ( not ( = ?auto_426524 ?auto_426527 ) ) ( not ( = ?auto_426524 ?auto_426528 ) ) ( not ( = ?auto_426524 ?auto_426529 ) ) ( not ( = ?auto_426524 ?auto_426530 ) ) ( not ( = ?auto_426524 ?auto_426531 ) ) ( not ( = ?auto_426524 ?auto_426532 ) ) ( not ( = ?auto_426524 ?auto_426533 ) ) ( not ( = ?auto_426524 ?auto_426534 ) ) ( not ( = ?auto_426525 ?auto_426526 ) ) ( not ( = ?auto_426525 ?auto_426527 ) ) ( not ( = ?auto_426525 ?auto_426528 ) ) ( not ( = ?auto_426525 ?auto_426529 ) ) ( not ( = ?auto_426525 ?auto_426530 ) ) ( not ( = ?auto_426525 ?auto_426531 ) ) ( not ( = ?auto_426525 ?auto_426532 ) ) ( not ( = ?auto_426525 ?auto_426533 ) ) ( not ( = ?auto_426525 ?auto_426534 ) ) ( not ( = ?auto_426526 ?auto_426527 ) ) ( not ( = ?auto_426526 ?auto_426528 ) ) ( not ( = ?auto_426526 ?auto_426529 ) ) ( not ( = ?auto_426526 ?auto_426530 ) ) ( not ( = ?auto_426526 ?auto_426531 ) ) ( not ( = ?auto_426526 ?auto_426532 ) ) ( not ( = ?auto_426526 ?auto_426533 ) ) ( not ( = ?auto_426526 ?auto_426534 ) ) ( not ( = ?auto_426527 ?auto_426528 ) ) ( not ( = ?auto_426527 ?auto_426529 ) ) ( not ( = ?auto_426527 ?auto_426530 ) ) ( not ( = ?auto_426527 ?auto_426531 ) ) ( not ( = ?auto_426527 ?auto_426532 ) ) ( not ( = ?auto_426527 ?auto_426533 ) ) ( not ( = ?auto_426527 ?auto_426534 ) ) ( not ( = ?auto_426528 ?auto_426529 ) ) ( not ( = ?auto_426528 ?auto_426530 ) ) ( not ( = ?auto_426528 ?auto_426531 ) ) ( not ( = ?auto_426528 ?auto_426532 ) ) ( not ( = ?auto_426528 ?auto_426533 ) ) ( not ( = ?auto_426528 ?auto_426534 ) ) ( not ( = ?auto_426529 ?auto_426530 ) ) ( not ( = ?auto_426529 ?auto_426531 ) ) ( not ( = ?auto_426529 ?auto_426532 ) ) ( not ( = ?auto_426529 ?auto_426533 ) ) ( not ( = ?auto_426529 ?auto_426534 ) ) ( not ( = ?auto_426530 ?auto_426531 ) ) ( not ( = ?auto_426530 ?auto_426532 ) ) ( not ( = ?auto_426530 ?auto_426533 ) ) ( not ( = ?auto_426530 ?auto_426534 ) ) ( not ( = ?auto_426531 ?auto_426532 ) ) ( not ( = ?auto_426531 ?auto_426533 ) ) ( not ( = ?auto_426531 ?auto_426534 ) ) ( not ( = ?auto_426532 ?auto_426533 ) ) ( not ( = ?auto_426532 ?auto_426534 ) ) ( not ( = ?auto_426533 ?auto_426534 ) ) ( ON ?auto_426532 ?auto_426533 ) ( ON ?auto_426531 ?auto_426532 ) ( ON ?auto_426530 ?auto_426531 ) ( ON ?auto_426529 ?auto_426530 ) ( ON ?auto_426528 ?auto_426529 ) ( ON ?auto_426527 ?auto_426528 ) ( ON ?auto_426526 ?auto_426527 ) ( ON ?auto_426525 ?auto_426526 ) ( ON ?auto_426524 ?auto_426525 ) ( CLEAR ?auto_426522 ) ( ON ?auto_426523 ?auto_426524 ) ( CLEAR ?auto_426523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_426521 ?auto_426522 ?auto_426523 )
      ( MAKE-13PILE ?auto_426521 ?auto_426522 ?auto_426523 ?auto_426524 ?auto_426525 ?auto_426526 ?auto_426527 ?auto_426528 ?auto_426529 ?auto_426530 ?auto_426531 ?auto_426532 ?auto_426533 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_426548 - BLOCK
      ?auto_426549 - BLOCK
      ?auto_426550 - BLOCK
      ?auto_426551 - BLOCK
      ?auto_426552 - BLOCK
      ?auto_426553 - BLOCK
      ?auto_426554 - BLOCK
      ?auto_426555 - BLOCK
      ?auto_426556 - BLOCK
      ?auto_426557 - BLOCK
      ?auto_426558 - BLOCK
      ?auto_426559 - BLOCK
      ?auto_426560 - BLOCK
    )
    :vars
    (
      ?auto_426561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426560 ?auto_426561 ) ( ON-TABLE ?auto_426548 ) ( ON ?auto_426549 ?auto_426548 ) ( not ( = ?auto_426548 ?auto_426549 ) ) ( not ( = ?auto_426548 ?auto_426550 ) ) ( not ( = ?auto_426548 ?auto_426551 ) ) ( not ( = ?auto_426548 ?auto_426552 ) ) ( not ( = ?auto_426548 ?auto_426553 ) ) ( not ( = ?auto_426548 ?auto_426554 ) ) ( not ( = ?auto_426548 ?auto_426555 ) ) ( not ( = ?auto_426548 ?auto_426556 ) ) ( not ( = ?auto_426548 ?auto_426557 ) ) ( not ( = ?auto_426548 ?auto_426558 ) ) ( not ( = ?auto_426548 ?auto_426559 ) ) ( not ( = ?auto_426548 ?auto_426560 ) ) ( not ( = ?auto_426548 ?auto_426561 ) ) ( not ( = ?auto_426549 ?auto_426550 ) ) ( not ( = ?auto_426549 ?auto_426551 ) ) ( not ( = ?auto_426549 ?auto_426552 ) ) ( not ( = ?auto_426549 ?auto_426553 ) ) ( not ( = ?auto_426549 ?auto_426554 ) ) ( not ( = ?auto_426549 ?auto_426555 ) ) ( not ( = ?auto_426549 ?auto_426556 ) ) ( not ( = ?auto_426549 ?auto_426557 ) ) ( not ( = ?auto_426549 ?auto_426558 ) ) ( not ( = ?auto_426549 ?auto_426559 ) ) ( not ( = ?auto_426549 ?auto_426560 ) ) ( not ( = ?auto_426549 ?auto_426561 ) ) ( not ( = ?auto_426550 ?auto_426551 ) ) ( not ( = ?auto_426550 ?auto_426552 ) ) ( not ( = ?auto_426550 ?auto_426553 ) ) ( not ( = ?auto_426550 ?auto_426554 ) ) ( not ( = ?auto_426550 ?auto_426555 ) ) ( not ( = ?auto_426550 ?auto_426556 ) ) ( not ( = ?auto_426550 ?auto_426557 ) ) ( not ( = ?auto_426550 ?auto_426558 ) ) ( not ( = ?auto_426550 ?auto_426559 ) ) ( not ( = ?auto_426550 ?auto_426560 ) ) ( not ( = ?auto_426550 ?auto_426561 ) ) ( not ( = ?auto_426551 ?auto_426552 ) ) ( not ( = ?auto_426551 ?auto_426553 ) ) ( not ( = ?auto_426551 ?auto_426554 ) ) ( not ( = ?auto_426551 ?auto_426555 ) ) ( not ( = ?auto_426551 ?auto_426556 ) ) ( not ( = ?auto_426551 ?auto_426557 ) ) ( not ( = ?auto_426551 ?auto_426558 ) ) ( not ( = ?auto_426551 ?auto_426559 ) ) ( not ( = ?auto_426551 ?auto_426560 ) ) ( not ( = ?auto_426551 ?auto_426561 ) ) ( not ( = ?auto_426552 ?auto_426553 ) ) ( not ( = ?auto_426552 ?auto_426554 ) ) ( not ( = ?auto_426552 ?auto_426555 ) ) ( not ( = ?auto_426552 ?auto_426556 ) ) ( not ( = ?auto_426552 ?auto_426557 ) ) ( not ( = ?auto_426552 ?auto_426558 ) ) ( not ( = ?auto_426552 ?auto_426559 ) ) ( not ( = ?auto_426552 ?auto_426560 ) ) ( not ( = ?auto_426552 ?auto_426561 ) ) ( not ( = ?auto_426553 ?auto_426554 ) ) ( not ( = ?auto_426553 ?auto_426555 ) ) ( not ( = ?auto_426553 ?auto_426556 ) ) ( not ( = ?auto_426553 ?auto_426557 ) ) ( not ( = ?auto_426553 ?auto_426558 ) ) ( not ( = ?auto_426553 ?auto_426559 ) ) ( not ( = ?auto_426553 ?auto_426560 ) ) ( not ( = ?auto_426553 ?auto_426561 ) ) ( not ( = ?auto_426554 ?auto_426555 ) ) ( not ( = ?auto_426554 ?auto_426556 ) ) ( not ( = ?auto_426554 ?auto_426557 ) ) ( not ( = ?auto_426554 ?auto_426558 ) ) ( not ( = ?auto_426554 ?auto_426559 ) ) ( not ( = ?auto_426554 ?auto_426560 ) ) ( not ( = ?auto_426554 ?auto_426561 ) ) ( not ( = ?auto_426555 ?auto_426556 ) ) ( not ( = ?auto_426555 ?auto_426557 ) ) ( not ( = ?auto_426555 ?auto_426558 ) ) ( not ( = ?auto_426555 ?auto_426559 ) ) ( not ( = ?auto_426555 ?auto_426560 ) ) ( not ( = ?auto_426555 ?auto_426561 ) ) ( not ( = ?auto_426556 ?auto_426557 ) ) ( not ( = ?auto_426556 ?auto_426558 ) ) ( not ( = ?auto_426556 ?auto_426559 ) ) ( not ( = ?auto_426556 ?auto_426560 ) ) ( not ( = ?auto_426556 ?auto_426561 ) ) ( not ( = ?auto_426557 ?auto_426558 ) ) ( not ( = ?auto_426557 ?auto_426559 ) ) ( not ( = ?auto_426557 ?auto_426560 ) ) ( not ( = ?auto_426557 ?auto_426561 ) ) ( not ( = ?auto_426558 ?auto_426559 ) ) ( not ( = ?auto_426558 ?auto_426560 ) ) ( not ( = ?auto_426558 ?auto_426561 ) ) ( not ( = ?auto_426559 ?auto_426560 ) ) ( not ( = ?auto_426559 ?auto_426561 ) ) ( not ( = ?auto_426560 ?auto_426561 ) ) ( ON ?auto_426559 ?auto_426560 ) ( ON ?auto_426558 ?auto_426559 ) ( ON ?auto_426557 ?auto_426558 ) ( ON ?auto_426556 ?auto_426557 ) ( ON ?auto_426555 ?auto_426556 ) ( ON ?auto_426554 ?auto_426555 ) ( ON ?auto_426553 ?auto_426554 ) ( ON ?auto_426552 ?auto_426553 ) ( ON ?auto_426551 ?auto_426552 ) ( CLEAR ?auto_426549 ) ( ON ?auto_426550 ?auto_426551 ) ( CLEAR ?auto_426550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_426548 ?auto_426549 ?auto_426550 )
      ( MAKE-13PILE ?auto_426548 ?auto_426549 ?auto_426550 ?auto_426551 ?auto_426552 ?auto_426553 ?auto_426554 ?auto_426555 ?auto_426556 ?auto_426557 ?auto_426558 ?auto_426559 ?auto_426560 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_426575 - BLOCK
      ?auto_426576 - BLOCK
      ?auto_426577 - BLOCK
      ?auto_426578 - BLOCK
      ?auto_426579 - BLOCK
      ?auto_426580 - BLOCK
      ?auto_426581 - BLOCK
      ?auto_426582 - BLOCK
      ?auto_426583 - BLOCK
      ?auto_426584 - BLOCK
      ?auto_426585 - BLOCK
      ?auto_426586 - BLOCK
      ?auto_426587 - BLOCK
    )
    :vars
    (
      ?auto_426588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426587 ?auto_426588 ) ( ON-TABLE ?auto_426575 ) ( not ( = ?auto_426575 ?auto_426576 ) ) ( not ( = ?auto_426575 ?auto_426577 ) ) ( not ( = ?auto_426575 ?auto_426578 ) ) ( not ( = ?auto_426575 ?auto_426579 ) ) ( not ( = ?auto_426575 ?auto_426580 ) ) ( not ( = ?auto_426575 ?auto_426581 ) ) ( not ( = ?auto_426575 ?auto_426582 ) ) ( not ( = ?auto_426575 ?auto_426583 ) ) ( not ( = ?auto_426575 ?auto_426584 ) ) ( not ( = ?auto_426575 ?auto_426585 ) ) ( not ( = ?auto_426575 ?auto_426586 ) ) ( not ( = ?auto_426575 ?auto_426587 ) ) ( not ( = ?auto_426575 ?auto_426588 ) ) ( not ( = ?auto_426576 ?auto_426577 ) ) ( not ( = ?auto_426576 ?auto_426578 ) ) ( not ( = ?auto_426576 ?auto_426579 ) ) ( not ( = ?auto_426576 ?auto_426580 ) ) ( not ( = ?auto_426576 ?auto_426581 ) ) ( not ( = ?auto_426576 ?auto_426582 ) ) ( not ( = ?auto_426576 ?auto_426583 ) ) ( not ( = ?auto_426576 ?auto_426584 ) ) ( not ( = ?auto_426576 ?auto_426585 ) ) ( not ( = ?auto_426576 ?auto_426586 ) ) ( not ( = ?auto_426576 ?auto_426587 ) ) ( not ( = ?auto_426576 ?auto_426588 ) ) ( not ( = ?auto_426577 ?auto_426578 ) ) ( not ( = ?auto_426577 ?auto_426579 ) ) ( not ( = ?auto_426577 ?auto_426580 ) ) ( not ( = ?auto_426577 ?auto_426581 ) ) ( not ( = ?auto_426577 ?auto_426582 ) ) ( not ( = ?auto_426577 ?auto_426583 ) ) ( not ( = ?auto_426577 ?auto_426584 ) ) ( not ( = ?auto_426577 ?auto_426585 ) ) ( not ( = ?auto_426577 ?auto_426586 ) ) ( not ( = ?auto_426577 ?auto_426587 ) ) ( not ( = ?auto_426577 ?auto_426588 ) ) ( not ( = ?auto_426578 ?auto_426579 ) ) ( not ( = ?auto_426578 ?auto_426580 ) ) ( not ( = ?auto_426578 ?auto_426581 ) ) ( not ( = ?auto_426578 ?auto_426582 ) ) ( not ( = ?auto_426578 ?auto_426583 ) ) ( not ( = ?auto_426578 ?auto_426584 ) ) ( not ( = ?auto_426578 ?auto_426585 ) ) ( not ( = ?auto_426578 ?auto_426586 ) ) ( not ( = ?auto_426578 ?auto_426587 ) ) ( not ( = ?auto_426578 ?auto_426588 ) ) ( not ( = ?auto_426579 ?auto_426580 ) ) ( not ( = ?auto_426579 ?auto_426581 ) ) ( not ( = ?auto_426579 ?auto_426582 ) ) ( not ( = ?auto_426579 ?auto_426583 ) ) ( not ( = ?auto_426579 ?auto_426584 ) ) ( not ( = ?auto_426579 ?auto_426585 ) ) ( not ( = ?auto_426579 ?auto_426586 ) ) ( not ( = ?auto_426579 ?auto_426587 ) ) ( not ( = ?auto_426579 ?auto_426588 ) ) ( not ( = ?auto_426580 ?auto_426581 ) ) ( not ( = ?auto_426580 ?auto_426582 ) ) ( not ( = ?auto_426580 ?auto_426583 ) ) ( not ( = ?auto_426580 ?auto_426584 ) ) ( not ( = ?auto_426580 ?auto_426585 ) ) ( not ( = ?auto_426580 ?auto_426586 ) ) ( not ( = ?auto_426580 ?auto_426587 ) ) ( not ( = ?auto_426580 ?auto_426588 ) ) ( not ( = ?auto_426581 ?auto_426582 ) ) ( not ( = ?auto_426581 ?auto_426583 ) ) ( not ( = ?auto_426581 ?auto_426584 ) ) ( not ( = ?auto_426581 ?auto_426585 ) ) ( not ( = ?auto_426581 ?auto_426586 ) ) ( not ( = ?auto_426581 ?auto_426587 ) ) ( not ( = ?auto_426581 ?auto_426588 ) ) ( not ( = ?auto_426582 ?auto_426583 ) ) ( not ( = ?auto_426582 ?auto_426584 ) ) ( not ( = ?auto_426582 ?auto_426585 ) ) ( not ( = ?auto_426582 ?auto_426586 ) ) ( not ( = ?auto_426582 ?auto_426587 ) ) ( not ( = ?auto_426582 ?auto_426588 ) ) ( not ( = ?auto_426583 ?auto_426584 ) ) ( not ( = ?auto_426583 ?auto_426585 ) ) ( not ( = ?auto_426583 ?auto_426586 ) ) ( not ( = ?auto_426583 ?auto_426587 ) ) ( not ( = ?auto_426583 ?auto_426588 ) ) ( not ( = ?auto_426584 ?auto_426585 ) ) ( not ( = ?auto_426584 ?auto_426586 ) ) ( not ( = ?auto_426584 ?auto_426587 ) ) ( not ( = ?auto_426584 ?auto_426588 ) ) ( not ( = ?auto_426585 ?auto_426586 ) ) ( not ( = ?auto_426585 ?auto_426587 ) ) ( not ( = ?auto_426585 ?auto_426588 ) ) ( not ( = ?auto_426586 ?auto_426587 ) ) ( not ( = ?auto_426586 ?auto_426588 ) ) ( not ( = ?auto_426587 ?auto_426588 ) ) ( ON ?auto_426586 ?auto_426587 ) ( ON ?auto_426585 ?auto_426586 ) ( ON ?auto_426584 ?auto_426585 ) ( ON ?auto_426583 ?auto_426584 ) ( ON ?auto_426582 ?auto_426583 ) ( ON ?auto_426581 ?auto_426582 ) ( ON ?auto_426580 ?auto_426581 ) ( ON ?auto_426579 ?auto_426580 ) ( ON ?auto_426578 ?auto_426579 ) ( ON ?auto_426577 ?auto_426578 ) ( CLEAR ?auto_426575 ) ( ON ?auto_426576 ?auto_426577 ) ( CLEAR ?auto_426576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_426575 ?auto_426576 )
      ( MAKE-13PILE ?auto_426575 ?auto_426576 ?auto_426577 ?auto_426578 ?auto_426579 ?auto_426580 ?auto_426581 ?auto_426582 ?auto_426583 ?auto_426584 ?auto_426585 ?auto_426586 ?auto_426587 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_426602 - BLOCK
      ?auto_426603 - BLOCK
      ?auto_426604 - BLOCK
      ?auto_426605 - BLOCK
      ?auto_426606 - BLOCK
      ?auto_426607 - BLOCK
      ?auto_426608 - BLOCK
      ?auto_426609 - BLOCK
      ?auto_426610 - BLOCK
      ?auto_426611 - BLOCK
      ?auto_426612 - BLOCK
      ?auto_426613 - BLOCK
      ?auto_426614 - BLOCK
    )
    :vars
    (
      ?auto_426615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426614 ?auto_426615 ) ( ON-TABLE ?auto_426602 ) ( not ( = ?auto_426602 ?auto_426603 ) ) ( not ( = ?auto_426602 ?auto_426604 ) ) ( not ( = ?auto_426602 ?auto_426605 ) ) ( not ( = ?auto_426602 ?auto_426606 ) ) ( not ( = ?auto_426602 ?auto_426607 ) ) ( not ( = ?auto_426602 ?auto_426608 ) ) ( not ( = ?auto_426602 ?auto_426609 ) ) ( not ( = ?auto_426602 ?auto_426610 ) ) ( not ( = ?auto_426602 ?auto_426611 ) ) ( not ( = ?auto_426602 ?auto_426612 ) ) ( not ( = ?auto_426602 ?auto_426613 ) ) ( not ( = ?auto_426602 ?auto_426614 ) ) ( not ( = ?auto_426602 ?auto_426615 ) ) ( not ( = ?auto_426603 ?auto_426604 ) ) ( not ( = ?auto_426603 ?auto_426605 ) ) ( not ( = ?auto_426603 ?auto_426606 ) ) ( not ( = ?auto_426603 ?auto_426607 ) ) ( not ( = ?auto_426603 ?auto_426608 ) ) ( not ( = ?auto_426603 ?auto_426609 ) ) ( not ( = ?auto_426603 ?auto_426610 ) ) ( not ( = ?auto_426603 ?auto_426611 ) ) ( not ( = ?auto_426603 ?auto_426612 ) ) ( not ( = ?auto_426603 ?auto_426613 ) ) ( not ( = ?auto_426603 ?auto_426614 ) ) ( not ( = ?auto_426603 ?auto_426615 ) ) ( not ( = ?auto_426604 ?auto_426605 ) ) ( not ( = ?auto_426604 ?auto_426606 ) ) ( not ( = ?auto_426604 ?auto_426607 ) ) ( not ( = ?auto_426604 ?auto_426608 ) ) ( not ( = ?auto_426604 ?auto_426609 ) ) ( not ( = ?auto_426604 ?auto_426610 ) ) ( not ( = ?auto_426604 ?auto_426611 ) ) ( not ( = ?auto_426604 ?auto_426612 ) ) ( not ( = ?auto_426604 ?auto_426613 ) ) ( not ( = ?auto_426604 ?auto_426614 ) ) ( not ( = ?auto_426604 ?auto_426615 ) ) ( not ( = ?auto_426605 ?auto_426606 ) ) ( not ( = ?auto_426605 ?auto_426607 ) ) ( not ( = ?auto_426605 ?auto_426608 ) ) ( not ( = ?auto_426605 ?auto_426609 ) ) ( not ( = ?auto_426605 ?auto_426610 ) ) ( not ( = ?auto_426605 ?auto_426611 ) ) ( not ( = ?auto_426605 ?auto_426612 ) ) ( not ( = ?auto_426605 ?auto_426613 ) ) ( not ( = ?auto_426605 ?auto_426614 ) ) ( not ( = ?auto_426605 ?auto_426615 ) ) ( not ( = ?auto_426606 ?auto_426607 ) ) ( not ( = ?auto_426606 ?auto_426608 ) ) ( not ( = ?auto_426606 ?auto_426609 ) ) ( not ( = ?auto_426606 ?auto_426610 ) ) ( not ( = ?auto_426606 ?auto_426611 ) ) ( not ( = ?auto_426606 ?auto_426612 ) ) ( not ( = ?auto_426606 ?auto_426613 ) ) ( not ( = ?auto_426606 ?auto_426614 ) ) ( not ( = ?auto_426606 ?auto_426615 ) ) ( not ( = ?auto_426607 ?auto_426608 ) ) ( not ( = ?auto_426607 ?auto_426609 ) ) ( not ( = ?auto_426607 ?auto_426610 ) ) ( not ( = ?auto_426607 ?auto_426611 ) ) ( not ( = ?auto_426607 ?auto_426612 ) ) ( not ( = ?auto_426607 ?auto_426613 ) ) ( not ( = ?auto_426607 ?auto_426614 ) ) ( not ( = ?auto_426607 ?auto_426615 ) ) ( not ( = ?auto_426608 ?auto_426609 ) ) ( not ( = ?auto_426608 ?auto_426610 ) ) ( not ( = ?auto_426608 ?auto_426611 ) ) ( not ( = ?auto_426608 ?auto_426612 ) ) ( not ( = ?auto_426608 ?auto_426613 ) ) ( not ( = ?auto_426608 ?auto_426614 ) ) ( not ( = ?auto_426608 ?auto_426615 ) ) ( not ( = ?auto_426609 ?auto_426610 ) ) ( not ( = ?auto_426609 ?auto_426611 ) ) ( not ( = ?auto_426609 ?auto_426612 ) ) ( not ( = ?auto_426609 ?auto_426613 ) ) ( not ( = ?auto_426609 ?auto_426614 ) ) ( not ( = ?auto_426609 ?auto_426615 ) ) ( not ( = ?auto_426610 ?auto_426611 ) ) ( not ( = ?auto_426610 ?auto_426612 ) ) ( not ( = ?auto_426610 ?auto_426613 ) ) ( not ( = ?auto_426610 ?auto_426614 ) ) ( not ( = ?auto_426610 ?auto_426615 ) ) ( not ( = ?auto_426611 ?auto_426612 ) ) ( not ( = ?auto_426611 ?auto_426613 ) ) ( not ( = ?auto_426611 ?auto_426614 ) ) ( not ( = ?auto_426611 ?auto_426615 ) ) ( not ( = ?auto_426612 ?auto_426613 ) ) ( not ( = ?auto_426612 ?auto_426614 ) ) ( not ( = ?auto_426612 ?auto_426615 ) ) ( not ( = ?auto_426613 ?auto_426614 ) ) ( not ( = ?auto_426613 ?auto_426615 ) ) ( not ( = ?auto_426614 ?auto_426615 ) ) ( ON ?auto_426613 ?auto_426614 ) ( ON ?auto_426612 ?auto_426613 ) ( ON ?auto_426611 ?auto_426612 ) ( ON ?auto_426610 ?auto_426611 ) ( ON ?auto_426609 ?auto_426610 ) ( ON ?auto_426608 ?auto_426609 ) ( ON ?auto_426607 ?auto_426608 ) ( ON ?auto_426606 ?auto_426607 ) ( ON ?auto_426605 ?auto_426606 ) ( ON ?auto_426604 ?auto_426605 ) ( CLEAR ?auto_426602 ) ( ON ?auto_426603 ?auto_426604 ) ( CLEAR ?auto_426603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_426602 ?auto_426603 )
      ( MAKE-13PILE ?auto_426602 ?auto_426603 ?auto_426604 ?auto_426605 ?auto_426606 ?auto_426607 ?auto_426608 ?auto_426609 ?auto_426610 ?auto_426611 ?auto_426612 ?auto_426613 ?auto_426614 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_426629 - BLOCK
      ?auto_426630 - BLOCK
      ?auto_426631 - BLOCK
      ?auto_426632 - BLOCK
      ?auto_426633 - BLOCK
      ?auto_426634 - BLOCK
      ?auto_426635 - BLOCK
      ?auto_426636 - BLOCK
      ?auto_426637 - BLOCK
      ?auto_426638 - BLOCK
      ?auto_426639 - BLOCK
      ?auto_426640 - BLOCK
      ?auto_426641 - BLOCK
    )
    :vars
    (
      ?auto_426642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426641 ?auto_426642 ) ( not ( = ?auto_426629 ?auto_426630 ) ) ( not ( = ?auto_426629 ?auto_426631 ) ) ( not ( = ?auto_426629 ?auto_426632 ) ) ( not ( = ?auto_426629 ?auto_426633 ) ) ( not ( = ?auto_426629 ?auto_426634 ) ) ( not ( = ?auto_426629 ?auto_426635 ) ) ( not ( = ?auto_426629 ?auto_426636 ) ) ( not ( = ?auto_426629 ?auto_426637 ) ) ( not ( = ?auto_426629 ?auto_426638 ) ) ( not ( = ?auto_426629 ?auto_426639 ) ) ( not ( = ?auto_426629 ?auto_426640 ) ) ( not ( = ?auto_426629 ?auto_426641 ) ) ( not ( = ?auto_426629 ?auto_426642 ) ) ( not ( = ?auto_426630 ?auto_426631 ) ) ( not ( = ?auto_426630 ?auto_426632 ) ) ( not ( = ?auto_426630 ?auto_426633 ) ) ( not ( = ?auto_426630 ?auto_426634 ) ) ( not ( = ?auto_426630 ?auto_426635 ) ) ( not ( = ?auto_426630 ?auto_426636 ) ) ( not ( = ?auto_426630 ?auto_426637 ) ) ( not ( = ?auto_426630 ?auto_426638 ) ) ( not ( = ?auto_426630 ?auto_426639 ) ) ( not ( = ?auto_426630 ?auto_426640 ) ) ( not ( = ?auto_426630 ?auto_426641 ) ) ( not ( = ?auto_426630 ?auto_426642 ) ) ( not ( = ?auto_426631 ?auto_426632 ) ) ( not ( = ?auto_426631 ?auto_426633 ) ) ( not ( = ?auto_426631 ?auto_426634 ) ) ( not ( = ?auto_426631 ?auto_426635 ) ) ( not ( = ?auto_426631 ?auto_426636 ) ) ( not ( = ?auto_426631 ?auto_426637 ) ) ( not ( = ?auto_426631 ?auto_426638 ) ) ( not ( = ?auto_426631 ?auto_426639 ) ) ( not ( = ?auto_426631 ?auto_426640 ) ) ( not ( = ?auto_426631 ?auto_426641 ) ) ( not ( = ?auto_426631 ?auto_426642 ) ) ( not ( = ?auto_426632 ?auto_426633 ) ) ( not ( = ?auto_426632 ?auto_426634 ) ) ( not ( = ?auto_426632 ?auto_426635 ) ) ( not ( = ?auto_426632 ?auto_426636 ) ) ( not ( = ?auto_426632 ?auto_426637 ) ) ( not ( = ?auto_426632 ?auto_426638 ) ) ( not ( = ?auto_426632 ?auto_426639 ) ) ( not ( = ?auto_426632 ?auto_426640 ) ) ( not ( = ?auto_426632 ?auto_426641 ) ) ( not ( = ?auto_426632 ?auto_426642 ) ) ( not ( = ?auto_426633 ?auto_426634 ) ) ( not ( = ?auto_426633 ?auto_426635 ) ) ( not ( = ?auto_426633 ?auto_426636 ) ) ( not ( = ?auto_426633 ?auto_426637 ) ) ( not ( = ?auto_426633 ?auto_426638 ) ) ( not ( = ?auto_426633 ?auto_426639 ) ) ( not ( = ?auto_426633 ?auto_426640 ) ) ( not ( = ?auto_426633 ?auto_426641 ) ) ( not ( = ?auto_426633 ?auto_426642 ) ) ( not ( = ?auto_426634 ?auto_426635 ) ) ( not ( = ?auto_426634 ?auto_426636 ) ) ( not ( = ?auto_426634 ?auto_426637 ) ) ( not ( = ?auto_426634 ?auto_426638 ) ) ( not ( = ?auto_426634 ?auto_426639 ) ) ( not ( = ?auto_426634 ?auto_426640 ) ) ( not ( = ?auto_426634 ?auto_426641 ) ) ( not ( = ?auto_426634 ?auto_426642 ) ) ( not ( = ?auto_426635 ?auto_426636 ) ) ( not ( = ?auto_426635 ?auto_426637 ) ) ( not ( = ?auto_426635 ?auto_426638 ) ) ( not ( = ?auto_426635 ?auto_426639 ) ) ( not ( = ?auto_426635 ?auto_426640 ) ) ( not ( = ?auto_426635 ?auto_426641 ) ) ( not ( = ?auto_426635 ?auto_426642 ) ) ( not ( = ?auto_426636 ?auto_426637 ) ) ( not ( = ?auto_426636 ?auto_426638 ) ) ( not ( = ?auto_426636 ?auto_426639 ) ) ( not ( = ?auto_426636 ?auto_426640 ) ) ( not ( = ?auto_426636 ?auto_426641 ) ) ( not ( = ?auto_426636 ?auto_426642 ) ) ( not ( = ?auto_426637 ?auto_426638 ) ) ( not ( = ?auto_426637 ?auto_426639 ) ) ( not ( = ?auto_426637 ?auto_426640 ) ) ( not ( = ?auto_426637 ?auto_426641 ) ) ( not ( = ?auto_426637 ?auto_426642 ) ) ( not ( = ?auto_426638 ?auto_426639 ) ) ( not ( = ?auto_426638 ?auto_426640 ) ) ( not ( = ?auto_426638 ?auto_426641 ) ) ( not ( = ?auto_426638 ?auto_426642 ) ) ( not ( = ?auto_426639 ?auto_426640 ) ) ( not ( = ?auto_426639 ?auto_426641 ) ) ( not ( = ?auto_426639 ?auto_426642 ) ) ( not ( = ?auto_426640 ?auto_426641 ) ) ( not ( = ?auto_426640 ?auto_426642 ) ) ( not ( = ?auto_426641 ?auto_426642 ) ) ( ON ?auto_426640 ?auto_426641 ) ( ON ?auto_426639 ?auto_426640 ) ( ON ?auto_426638 ?auto_426639 ) ( ON ?auto_426637 ?auto_426638 ) ( ON ?auto_426636 ?auto_426637 ) ( ON ?auto_426635 ?auto_426636 ) ( ON ?auto_426634 ?auto_426635 ) ( ON ?auto_426633 ?auto_426634 ) ( ON ?auto_426632 ?auto_426633 ) ( ON ?auto_426631 ?auto_426632 ) ( ON ?auto_426630 ?auto_426631 ) ( ON ?auto_426629 ?auto_426630 ) ( CLEAR ?auto_426629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_426629 )
      ( MAKE-13PILE ?auto_426629 ?auto_426630 ?auto_426631 ?auto_426632 ?auto_426633 ?auto_426634 ?auto_426635 ?auto_426636 ?auto_426637 ?auto_426638 ?auto_426639 ?auto_426640 ?auto_426641 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_426656 - BLOCK
      ?auto_426657 - BLOCK
      ?auto_426658 - BLOCK
      ?auto_426659 - BLOCK
      ?auto_426660 - BLOCK
      ?auto_426661 - BLOCK
      ?auto_426662 - BLOCK
      ?auto_426663 - BLOCK
      ?auto_426664 - BLOCK
      ?auto_426665 - BLOCK
      ?auto_426666 - BLOCK
      ?auto_426667 - BLOCK
      ?auto_426668 - BLOCK
    )
    :vars
    (
      ?auto_426669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426668 ?auto_426669 ) ( not ( = ?auto_426656 ?auto_426657 ) ) ( not ( = ?auto_426656 ?auto_426658 ) ) ( not ( = ?auto_426656 ?auto_426659 ) ) ( not ( = ?auto_426656 ?auto_426660 ) ) ( not ( = ?auto_426656 ?auto_426661 ) ) ( not ( = ?auto_426656 ?auto_426662 ) ) ( not ( = ?auto_426656 ?auto_426663 ) ) ( not ( = ?auto_426656 ?auto_426664 ) ) ( not ( = ?auto_426656 ?auto_426665 ) ) ( not ( = ?auto_426656 ?auto_426666 ) ) ( not ( = ?auto_426656 ?auto_426667 ) ) ( not ( = ?auto_426656 ?auto_426668 ) ) ( not ( = ?auto_426656 ?auto_426669 ) ) ( not ( = ?auto_426657 ?auto_426658 ) ) ( not ( = ?auto_426657 ?auto_426659 ) ) ( not ( = ?auto_426657 ?auto_426660 ) ) ( not ( = ?auto_426657 ?auto_426661 ) ) ( not ( = ?auto_426657 ?auto_426662 ) ) ( not ( = ?auto_426657 ?auto_426663 ) ) ( not ( = ?auto_426657 ?auto_426664 ) ) ( not ( = ?auto_426657 ?auto_426665 ) ) ( not ( = ?auto_426657 ?auto_426666 ) ) ( not ( = ?auto_426657 ?auto_426667 ) ) ( not ( = ?auto_426657 ?auto_426668 ) ) ( not ( = ?auto_426657 ?auto_426669 ) ) ( not ( = ?auto_426658 ?auto_426659 ) ) ( not ( = ?auto_426658 ?auto_426660 ) ) ( not ( = ?auto_426658 ?auto_426661 ) ) ( not ( = ?auto_426658 ?auto_426662 ) ) ( not ( = ?auto_426658 ?auto_426663 ) ) ( not ( = ?auto_426658 ?auto_426664 ) ) ( not ( = ?auto_426658 ?auto_426665 ) ) ( not ( = ?auto_426658 ?auto_426666 ) ) ( not ( = ?auto_426658 ?auto_426667 ) ) ( not ( = ?auto_426658 ?auto_426668 ) ) ( not ( = ?auto_426658 ?auto_426669 ) ) ( not ( = ?auto_426659 ?auto_426660 ) ) ( not ( = ?auto_426659 ?auto_426661 ) ) ( not ( = ?auto_426659 ?auto_426662 ) ) ( not ( = ?auto_426659 ?auto_426663 ) ) ( not ( = ?auto_426659 ?auto_426664 ) ) ( not ( = ?auto_426659 ?auto_426665 ) ) ( not ( = ?auto_426659 ?auto_426666 ) ) ( not ( = ?auto_426659 ?auto_426667 ) ) ( not ( = ?auto_426659 ?auto_426668 ) ) ( not ( = ?auto_426659 ?auto_426669 ) ) ( not ( = ?auto_426660 ?auto_426661 ) ) ( not ( = ?auto_426660 ?auto_426662 ) ) ( not ( = ?auto_426660 ?auto_426663 ) ) ( not ( = ?auto_426660 ?auto_426664 ) ) ( not ( = ?auto_426660 ?auto_426665 ) ) ( not ( = ?auto_426660 ?auto_426666 ) ) ( not ( = ?auto_426660 ?auto_426667 ) ) ( not ( = ?auto_426660 ?auto_426668 ) ) ( not ( = ?auto_426660 ?auto_426669 ) ) ( not ( = ?auto_426661 ?auto_426662 ) ) ( not ( = ?auto_426661 ?auto_426663 ) ) ( not ( = ?auto_426661 ?auto_426664 ) ) ( not ( = ?auto_426661 ?auto_426665 ) ) ( not ( = ?auto_426661 ?auto_426666 ) ) ( not ( = ?auto_426661 ?auto_426667 ) ) ( not ( = ?auto_426661 ?auto_426668 ) ) ( not ( = ?auto_426661 ?auto_426669 ) ) ( not ( = ?auto_426662 ?auto_426663 ) ) ( not ( = ?auto_426662 ?auto_426664 ) ) ( not ( = ?auto_426662 ?auto_426665 ) ) ( not ( = ?auto_426662 ?auto_426666 ) ) ( not ( = ?auto_426662 ?auto_426667 ) ) ( not ( = ?auto_426662 ?auto_426668 ) ) ( not ( = ?auto_426662 ?auto_426669 ) ) ( not ( = ?auto_426663 ?auto_426664 ) ) ( not ( = ?auto_426663 ?auto_426665 ) ) ( not ( = ?auto_426663 ?auto_426666 ) ) ( not ( = ?auto_426663 ?auto_426667 ) ) ( not ( = ?auto_426663 ?auto_426668 ) ) ( not ( = ?auto_426663 ?auto_426669 ) ) ( not ( = ?auto_426664 ?auto_426665 ) ) ( not ( = ?auto_426664 ?auto_426666 ) ) ( not ( = ?auto_426664 ?auto_426667 ) ) ( not ( = ?auto_426664 ?auto_426668 ) ) ( not ( = ?auto_426664 ?auto_426669 ) ) ( not ( = ?auto_426665 ?auto_426666 ) ) ( not ( = ?auto_426665 ?auto_426667 ) ) ( not ( = ?auto_426665 ?auto_426668 ) ) ( not ( = ?auto_426665 ?auto_426669 ) ) ( not ( = ?auto_426666 ?auto_426667 ) ) ( not ( = ?auto_426666 ?auto_426668 ) ) ( not ( = ?auto_426666 ?auto_426669 ) ) ( not ( = ?auto_426667 ?auto_426668 ) ) ( not ( = ?auto_426667 ?auto_426669 ) ) ( not ( = ?auto_426668 ?auto_426669 ) ) ( ON ?auto_426667 ?auto_426668 ) ( ON ?auto_426666 ?auto_426667 ) ( ON ?auto_426665 ?auto_426666 ) ( ON ?auto_426664 ?auto_426665 ) ( ON ?auto_426663 ?auto_426664 ) ( ON ?auto_426662 ?auto_426663 ) ( ON ?auto_426661 ?auto_426662 ) ( ON ?auto_426660 ?auto_426661 ) ( ON ?auto_426659 ?auto_426660 ) ( ON ?auto_426658 ?auto_426659 ) ( ON ?auto_426657 ?auto_426658 ) ( ON ?auto_426656 ?auto_426657 ) ( CLEAR ?auto_426656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_426656 )
      ( MAKE-13PILE ?auto_426656 ?auto_426657 ?auto_426658 ?auto_426659 ?auto_426660 ?auto_426661 ?auto_426662 ?auto_426663 ?auto_426664 ?auto_426665 ?auto_426666 ?auto_426667 ?auto_426668 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_426684 - BLOCK
      ?auto_426685 - BLOCK
      ?auto_426686 - BLOCK
      ?auto_426687 - BLOCK
      ?auto_426688 - BLOCK
      ?auto_426689 - BLOCK
      ?auto_426690 - BLOCK
      ?auto_426691 - BLOCK
      ?auto_426692 - BLOCK
      ?auto_426693 - BLOCK
      ?auto_426694 - BLOCK
      ?auto_426695 - BLOCK
      ?auto_426696 - BLOCK
      ?auto_426697 - BLOCK
    )
    :vars
    (
      ?auto_426698 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_426696 ) ( ON ?auto_426697 ?auto_426698 ) ( CLEAR ?auto_426697 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_426684 ) ( ON ?auto_426685 ?auto_426684 ) ( ON ?auto_426686 ?auto_426685 ) ( ON ?auto_426687 ?auto_426686 ) ( ON ?auto_426688 ?auto_426687 ) ( ON ?auto_426689 ?auto_426688 ) ( ON ?auto_426690 ?auto_426689 ) ( ON ?auto_426691 ?auto_426690 ) ( ON ?auto_426692 ?auto_426691 ) ( ON ?auto_426693 ?auto_426692 ) ( ON ?auto_426694 ?auto_426693 ) ( ON ?auto_426695 ?auto_426694 ) ( ON ?auto_426696 ?auto_426695 ) ( not ( = ?auto_426684 ?auto_426685 ) ) ( not ( = ?auto_426684 ?auto_426686 ) ) ( not ( = ?auto_426684 ?auto_426687 ) ) ( not ( = ?auto_426684 ?auto_426688 ) ) ( not ( = ?auto_426684 ?auto_426689 ) ) ( not ( = ?auto_426684 ?auto_426690 ) ) ( not ( = ?auto_426684 ?auto_426691 ) ) ( not ( = ?auto_426684 ?auto_426692 ) ) ( not ( = ?auto_426684 ?auto_426693 ) ) ( not ( = ?auto_426684 ?auto_426694 ) ) ( not ( = ?auto_426684 ?auto_426695 ) ) ( not ( = ?auto_426684 ?auto_426696 ) ) ( not ( = ?auto_426684 ?auto_426697 ) ) ( not ( = ?auto_426684 ?auto_426698 ) ) ( not ( = ?auto_426685 ?auto_426686 ) ) ( not ( = ?auto_426685 ?auto_426687 ) ) ( not ( = ?auto_426685 ?auto_426688 ) ) ( not ( = ?auto_426685 ?auto_426689 ) ) ( not ( = ?auto_426685 ?auto_426690 ) ) ( not ( = ?auto_426685 ?auto_426691 ) ) ( not ( = ?auto_426685 ?auto_426692 ) ) ( not ( = ?auto_426685 ?auto_426693 ) ) ( not ( = ?auto_426685 ?auto_426694 ) ) ( not ( = ?auto_426685 ?auto_426695 ) ) ( not ( = ?auto_426685 ?auto_426696 ) ) ( not ( = ?auto_426685 ?auto_426697 ) ) ( not ( = ?auto_426685 ?auto_426698 ) ) ( not ( = ?auto_426686 ?auto_426687 ) ) ( not ( = ?auto_426686 ?auto_426688 ) ) ( not ( = ?auto_426686 ?auto_426689 ) ) ( not ( = ?auto_426686 ?auto_426690 ) ) ( not ( = ?auto_426686 ?auto_426691 ) ) ( not ( = ?auto_426686 ?auto_426692 ) ) ( not ( = ?auto_426686 ?auto_426693 ) ) ( not ( = ?auto_426686 ?auto_426694 ) ) ( not ( = ?auto_426686 ?auto_426695 ) ) ( not ( = ?auto_426686 ?auto_426696 ) ) ( not ( = ?auto_426686 ?auto_426697 ) ) ( not ( = ?auto_426686 ?auto_426698 ) ) ( not ( = ?auto_426687 ?auto_426688 ) ) ( not ( = ?auto_426687 ?auto_426689 ) ) ( not ( = ?auto_426687 ?auto_426690 ) ) ( not ( = ?auto_426687 ?auto_426691 ) ) ( not ( = ?auto_426687 ?auto_426692 ) ) ( not ( = ?auto_426687 ?auto_426693 ) ) ( not ( = ?auto_426687 ?auto_426694 ) ) ( not ( = ?auto_426687 ?auto_426695 ) ) ( not ( = ?auto_426687 ?auto_426696 ) ) ( not ( = ?auto_426687 ?auto_426697 ) ) ( not ( = ?auto_426687 ?auto_426698 ) ) ( not ( = ?auto_426688 ?auto_426689 ) ) ( not ( = ?auto_426688 ?auto_426690 ) ) ( not ( = ?auto_426688 ?auto_426691 ) ) ( not ( = ?auto_426688 ?auto_426692 ) ) ( not ( = ?auto_426688 ?auto_426693 ) ) ( not ( = ?auto_426688 ?auto_426694 ) ) ( not ( = ?auto_426688 ?auto_426695 ) ) ( not ( = ?auto_426688 ?auto_426696 ) ) ( not ( = ?auto_426688 ?auto_426697 ) ) ( not ( = ?auto_426688 ?auto_426698 ) ) ( not ( = ?auto_426689 ?auto_426690 ) ) ( not ( = ?auto_426689 ?auto_426691 ) ) ( not ( = ?auto_426689 ?auto_426692 ) ) ( not ( = ?auto_426689 ?auto_426693 ) ) ( not ( = ?auto_426689 ?auto_426694 ) ) ( not ( = ?auto_426689 ?auto_426695 ) ) ( not ( = ?auto_426689 ?auto_426696 ) ) ( not ( = ?auto_426689 ?auto_426697 ) ) ( not ( = ?auto_426689 ?auto_426698 ) ) ( not ( = ?auto_426690 ?auto_426691 ) ) ( not ( = ?auto_426690 ?auto_426692 ) ) ( not ( = ?auto_426690 ?auto_426693 ) ) ( not ( = ?auto_426690 ?auto_426694 ) ) ( not ( = ?auto_426690 ?auto_426695 ) ) ( not ( = ?auto_426690 ?auto_426696 ) ) ( not ( = ?auto_426690 ?auto_426697 ) ) ( not ( = ?auto_426690 ?auto_426698 ) ) ( not ( = ?auto_426691 ?auto_426692 ) ) ( not ( = ?auto_426691 ?auto_426693 ) ) ( not ( = ?auto_426691 ?auto_426694 ) ) ( not ( = ?auto_426691 ?auto_426695 ) ) ( not ( = ?auto_426691 ?auto_426696 ) ) ( not ( = ?auto_426691 ?auto_426697 ) ) ( not ( = ?auto_426691 ?auto_426698 ) ) ( not ( = ?auto_426692 ?auto_426693 ) ) ( not ( = ?auto_426692 ?auto_426694 ) ) ( not ( = ?auto_426692 ?auto_426695 ) ) ( not ( = ?auto_426692 ?auto_426696 ) ) ( not ( = ?auto_426692 ?auto_426697 ) ) ( not ( = ?auto_426692 ?auto_426698 ) ) ( not ( = ?auto_426693 ?auto_426694 ) ) ( not ( = ?auto_426693 ?auto_426695 ) ) ( not ( = ?auto_426693 ?auto_426696 ) ) ( not ( = ?auto_426693 ?auto_426697 ) ) ( not ( = ?auto_426693 ?auto_426698 ) ) ( not ( = ?auto_426694 ?auto_426695 ) ) ( not ( = ?auto_426694 ?auto_426696 ) ) ( not ( = ?auto_426694 ?auto_426697 ) ) ( not ( = ?auto_426694 ?auto_426698 ) ) ( not ( = ?auto_426695 ?auto_426696 ) ) ( not ( = ?auto_426695 ?auto_426697 ) ) ( not ( = ?auto_426695 ?auto_426698 ) ) ( not ( = ?auto_426696 ?auto_426697 ) ) ( not ( = ?auto_426696 ?auto_426698 ) ) ( not ( = ?auto_426697 ?auto_426698 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_426697 ?auto_426698 )
      ( !STACK ?auto_426697 ?auto_426696 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_426713 - BLOCK
      ?auto_426714 - BLOCK
      ?auto_426715 - BLOCK
      ?auto_426716 - BLOCK
      ?auto_426717 - BLOCK
      ?auto_426718 - BLOCK
      ?auto_426719 - BLOCK
      ?auto_426720 - BLOCK
      ?auto_426721 - BLOCK
      ?auto_426722 - BLOCK
      ?auto_426723 - BLOCK
      ?auto_426724 - BLOCK
      ?auto_426725 - BLOCK
      ?auto_426726 - BLOCK
    )
    :vars
    (
      ?auto_426727 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_426725 ) ( ON ?auto_426726 ?auto_426727 ) ( CLEAR ?auto_426726 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_426713 ) ( ON ?auto_426714 ?auto_426713 ) ( ON ?auto_426715 ?auto_426714 ) ( ON ?auto_426716 ?auto_426715 ) ( ON ?auto_426717 ?auto_426716 ) ( ON ?auto_426718 ?auto_426717 ) ( ON ?auto_426719 ?auto_426718 ) ( ON ?auto_426720 ?auto_426719 ) ( ON ?auto_426721 ?auto_426720 ) ( ON ?auto_426722 ?auto_426721 ) ( ON ?auto_426723 ?auto_426722 ) ( ON ?auto_426724 ?auto_426723 ) ( ON ?auto_426725 ?auto_426724 ) ( not ( = ?auto_426713 ?auto_426714 ) ) ( not ( = ?auto_426713 ?auto_426715 ) ) ( not ( = ?auto_426713 ?auto_426716 ) ) ( not ( = ?auto_426713 ?auto_426717 ) ) ( not ( = ?auto_426713 ?auto_426718 ) ) ( not ( = ?auto_426713 ?auto_426719 ) ) ( not ( = ?auto_426713 ?auto_426720 ) ) ( not ( = ?auto_426713 ?auto_426721 ) ) ( not ( = ?auto_426713 ?auto_426722 ) ) ( not ( = ?auto_426713 ?auto_426723 ) ) ( not ( = ?auto_426713 ?auto_426724 ) ) ( not ( = ?auto_426713 ?auto_426725 ) ) ( not ( = ?auto_426713 ?auto_426726 ) ) ( not ( = ?auto_426713 ?auto_426727 ) ) ( not ( = ?auto_426714 ?auto_426715 ) ) ( not ( = ?auto_426714 ?auto_426716 ) ) ( not ( = ?auto_426714 ?auto_426717 ) ) ( not ( = ?auto_426714 ?auto_426718 ) ) ( not ( = ?auto_426714 ?auto_426719 ) ) ( not ( = ?auto_426714 ?auto_426720 ) ) ( not ( = ?auto_426714 ?auto_426721 ) ) ( not ( = ?auto_426714 ?auto_426722 ) ) ( not ( = ?auto_426714 ?auto_426723 ) ) ( not ( = ?auto_426714 ?auto_426724 ) ) ( not ( = ?auto_426714 ?auto_426725 ) ) ( not ( = ?auto_426714 ?auto_426726 ) ) ( not ( = ?auto_426714 ?auto_426727 ) ) ( not ( = ?auto_426715 ?auto_426716 ) ) ( not ( = ?auto_426715 ?auto_426717 ) ) ( not ( = ?auto_426715 ?auto_426718 ) ) ( not ( = ?auto_426715 ?auto_426719 ) ) ( not ( = ?auto_426715 ?auto_426720 ) ) ( not ( = ?auto_426715 ?auto_426721 ) ) ( not ( = ?auto_426715 ?auto_426722 ) ) ( not ( = ?auto_426715 ?auto_426723 ) ) ( not ( = ?auto_426715 ?auto_426724 ) ) ( not ( = ?auto_426715 ?auto_426725 ) ) ( not ( = ?auto_426715 ?auto_426726 ) ) ( not ( = ?auto_426715 ?auto_426727 ) ) ( not ( = ?auto_426716 ?auto_426717 ) ) ( not ( = ?auto_426716 ?auto_426718 ) ) ( not ( = ?auto_426716 ?auto_426719 ) ) ( not ( = ?auto_426716 ?auto_426720 ) ) ( not ( = ?auto_426716 ?auto_426721 ) ) ( not ( = ?auto_426716 ?auto_426722 ) ) ( not ( = ?auto_426716 ?auto_426723 ) ) ( not ( = ?auto_426716 ?auto_426724 ) ) ( not ( = ?auto_426716 ?auto_426725 ) ) ( not ( = ?auto_426716 ?auto_426726 ) ) ( not ( = ?auto_426716 ?auto_426727 ) ) ( not ( = ?auto_426717 ?auto_426718 ) ) ( not ( = ?auto_426717 ?auto_426719 ) ) ( not ( = ?auto_426717 ?auto_426720 ) ) ( not ( = ?auto_426717 ?auto_426721 ) ) ( not ( = ?auto_426717 ?auto_426722 ) ) ( not ( = ?auto_426717 ?auto_426723 ) ) ( not ( = ?auto_426717 ?auto_426724 ) ) ( not ( = ?auto_426717 ?auto_426725 ) ) ( not ( = ?auto_426717 ?auto_426726 ) ) ( not ( = ?auto_426717 ?auto_426727 ) ) ( not ( = ?auto_426718 ?auto_426719 ) ) ( not ( = ?auto_426718 ?auto_426720 ) ) ( not ( = ?auto_426718 ?auto_426721 ) ) ( not ( = ?auto_426718 ?auto_426722 ) ) ( not ( = ?auto_426718 ?auto_426723 ) ) ( not ( = ?auto_426718 ?auto_426724 ) ) ( not ( = ?auto_426718 ?auto_426725 ) ) ( not ( = ?auto_426718 ?auto_426726 ) ) ( not ( = ?auto_426718 ?auto_426727 ) ) ( not ( = ?auto_426719 ?auto_426720 ) ) ( not ( = ?auto_426719 ?auto_426721 ) ) ( not ( = ?auto_426719 ?auto_426722 ) ) ( not ( = ?auto_426719 ?auto_426723 ) ) ( not ( = ?auto_426719 ?auto_426724 ) ) ( not ( = ?auto_426719 ?auto_426725 ) ) ( not ( = ?auto_426719 ?auto_426726 ) ) ( not ( = ?auto_426719 ?auto_426727 ) ) ( not ( = ?auto_426720 ?auto_426721 ) ) ( not ( = ?auto_426720 ?auto_426722 ) ) ( not ( = ?auto_426720 ?auto_426723 ) ) ( not ( = ?auto_426720 ?auto_426724 ) ) ( not ( = ?auto_426720 ?auto_426725 ) ) ( not ( = ?auto_426720 ?auto_426726 ) ) ( not ( = ?auto_426720 ?auto_426727 ) ) ( not ( = ?auto_426721 ?auto_426722 ) ) ( not ( = ?auto_426721 ?auto_426723 ) ) ( not ( = ?auto_426721 ?auto_426724 ) ) ( not ( = ?auto_426721 ?auto_426725 ) ) ( not ( = ?auto_426721 ?auto_426726 ) ) ( not ( = ?auto_426721 ?auto_426727 ) ) ( not ( = ?auto_426722 ?auto_426723 ) ) ( not ( = ?auto_426722 ?auto_426724 ) ) ( not ( = ?auto_426722 ?auto_426725 ) ) ( not ( = ?auto_426722 ?auto_426726 ) ) ( not ( = ?auto_426722 ?auto_426727 ) ) ( not ( = ?auto_426723 ?auto_426724 ) ) ( not ( = ?auto_426723 ?auto_426725 ) ) ( not ( = ?auto_426723 ?auto_426726 ) ) ( not ( = ?auto_426723 ?auto_426727 ) ) ( not ( = ?auto_426724 ?auto_426725 ) ) ( not ( = ?auto_426724 ?auto_426726 ) ) ( not ( = ?auto_426724 ?auto_426727 ) ) ( not ( = ?auto_426725 ?auto_426726 ) ) ( not ( = ?auto_426725 ?auto_426727 ) ) ( not ( = ?auto_426726 ?auto_426727 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_426726 ?auto_426727 )
      ( !STACK ?auto_426726 ?auto_426725 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_426742 - BLOCK
      ?auto_426743 - BLOCK
      ?auto_426744 - BLOCK
      ?auto_426745 - BLOCK
      ?auto_426746 - BLOCK
      ?auto_426747 - BLOCK
      ?auto_426748 - BLOCK
      ?auto_426749 - BLOCK
      ?auto_426750 - BLOCK
      ?auto_426751 - BLOCK
      ?auto_426752 - BLOCK
      ?auto_426753 - BLOCK
      ?auto_426754 - BLOCK
      ?auto_426755 - BLOCK
    )
    :vars
    (
      ?auto_426756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426755 ?auto_426756 ) ( ON-TABLE ?auto_426742 ) ( ON ?auto_426743 ?auto_426742 ) ( ON ?auto_426744 ?auto_426743 ) ( ON ?auto_426745 ?auto_426744 ) ( ON ?auto_426746 ?auto_426745 ) ( ON ?auto_426747 ?auto_426746 ) ( ON ?auto_426748 ?auto_426747 ) ( ON ?auto_426749 ?auto_426748 ) ( ON ?auto_426750 ?auto_426749 ) ( ON ?auto_426751 ?auto_426750 ) ( ON ?auto_426752 ?auto_426751 ) ( ON ?auto_426753 ?auto_426752 ) ( not ( = ?auto_426742 ?auto_426743 ) ) ( not ( = ?auto_426742 ?auto_426744 ) ) ( not ( = ?auto_426742 ?auto_426745 ) ) ( not ( = ?auto_426742 ?auto_426746 ) ) ( not ( = ?auto_426742 ?auto_426747 ) ) ( not ( = ?auto_426742 ?auto_426748 ) ) ( not ( = ?auto_426742 ?auto_426749 ) ) ( not ( = ?auto_426742 ?auto_426750 ) ) ( not ( = ?auto_426742 ?auto_426751 ) ) ( not ( = ?auto_426742 ?auto_426752 ) ) ( not ( = ?auto_426742 ?auto_426753 ) ) ( not ( = ?auto_426742 ?auto_426754 ) ) ( not ( = ?auto_426742 ?auto_426755 ) ) ( not ( = ?auto_426742 ?auto_426756 ) ) ( not ( = ?auto_426743 ?auto_426744 ) ) ( not ( = ?auto_426743 ?auto_426745 ) ) ( not ( = ?auto_426743 ?auto_426746 ) ) ( not ( = ?auto_426743 ?auto_426747 ) ) ( not ( = ?auto_426743 ?auto_426748 ) ) ( not ( = ?auto_426743 ?auto_426749 ) ) ( not ( = ?auto_426743 ?auto_426750 ) ) ( not ( = ?auto_426743 ?auto_426751 ) ) ( not ( = ?auto_426743 ?auto_426752 ) ) ( not ( = ?auto_426743 ?auto_426753 ) ) ( not ( = ?auto_426743 ?auto_426754 ) ) ( not ( = ?auto_426743 ?auto_426755 ) ) ( not ( = ?auto_426743 ?auto_426756 ) ) ( not ( = ?auto_426744 ?auto_426745 ) ) ( not ( = ?auto_426744 ?auto_426746 ) ) ( not ( = ?auto_426744 ?auto_426747 ) ) ( not ( = ?auto_426744 ?auto_426748 ) ) ( not ( = ?auto_426744 ?auto_426749 ) ) ( not ( = ?auto_426744 ?auto_426750 ) ) ( not ( = ?auto_426744 ?auto_426751 ) ) ( not ( = ?auto_426744 ?auto_426752 ) ) ( not ( = ?auto_426744 ?auto_426753 ) ) ( not ( = ?auto_426744 ?auto_426754 ) ) ( not ( = ?auto_426744 ?auto_426755 ) ) ( not ( = ?auto_426744 ?auto_426756 ) ) ( not ( = ?auto_426745 ?auto_426746 ) ) ( not ( = ?auto_426745 ?auto_426747 ) ) ( not ( = ?auto_426745 ?auto_426748 ) ) ( not ( = ?auto_426745 ?auto_426749 ) ) ( not ( = ?auto_426745 ?auto_426750 ) ) ( not ( = ?auto_426745 ?auto_426751 ) ) ( not ( = ?auto_426745 ?auto_426752 ) ) ( not ( = ?auto_426745 ?auto_426753 ) ) ( not ( = ?auto_426745 ?auto_426754 ) ) ( not ( = ?auto_426745 ?auto_426755 ) ) ( not ( = ?auto_426745 ?auto_426756 ) ) ( not ( = ?auto_426746 ?auto_426747 ) ) ( not ( = ?auto_426746 ?auto_426748 ) ) ( not ( = ?auto_426746 ?auto_426749 ) ) ( not ( = ?auto_426746 ?auto_426750 ) ) ( not ( = ?auto_426746 ?auto_426751 ) ) ( not ( = ?auto_426746 ?auto_426752 ) ) ( not ( = ?auto_426746 ?auto_426753 ) ) ( not ( = ?auto_426746 ?auto_426754 ) ) ( not ( = ?auto_426746 ?auto_426755 ) ) ( not ( = ?auto_426746 ?auto_426756 ) ) ( not ( = ?auto_426747 ?auto_426748 ) ) ( not ( = ?auto_426747 ?auto_426749 ) ) ( not ( = ?auto_426747 ?auto_426750 ) ) ( not ( = ?auto_426747 ?auto_426751 ) ) ( not ( = ?auto_426747 ?auto_426752 ) ) ( not ( = ?auto_426747 ?auto_426753 ) ) ( not ( = ?auto_426747 ?auto_426754 ) ) ( not ( = ?auto_426747 ?auto_426755 ) ) ( not ( = ?auto_426747 ?auto_426756 ) ) ( not ( = ?auto_426748 ?auto_426749 ) ) ( not ( = ?auto_426748 ?auto_426750 ) ) ( not ( = ?auto_426748 ?auto_426751 ) ) ( not ( = ?auto_426748 ?auto_426752 ) ) ( not ( = ?auto_426748 ?auto_426753 ) ) ( not ( = ?auto_426748 ?auto_426754 ) ) ( not ( = ?auto_426748 ?auto_426755 ) ) ( not ( = ?auto_426748 ?auto_426756 ) ) ( not ( = ?auto_426749 ?auto_426750 ) ) ( not ( = ?auto_426749 ?auto_426751 ) ) ( not ( = ?auto_426749 ?auto_426752 ) ) ( not ( = ?auto_426749 ?auto_426753 ) ) ( not ( = ?auto_426749 ?auto_426754 ) ) ( not ( = ?auto_426749 ?auto_426755 ) ) ( not ( = ?auto_426749 ?auto_426756 ) ) ( not ( = ?auto_426750 ?auto_426751 ) ) ( not ( = ?auto_426750 ?auto_426752 ) ) ( not ( = ?auto_426750 ?auto_426753 ) ) ( not ( = ?auto_426750 ?auto_426754 ) ) ( not ( = ?auto_426750 ?auto_426755 ) ) ( not ( = ?auto_426750 ?auto_426756 ) ) ( not ( = ?auto_426751 ?auto_426752 ) ) ( not ( = ?auto_426751 ?auto_426753 ) ) ( not ( = ?auto_426751 ?auto_426754 ) ) ( not ( = ?auto_426751 ?auto_426755 ) ) ( not ( = ?auto_426751 ?auto_426756 ) ) ( not ( = ?auto_426752 ?auto_426753 ) ) ( not ( = ?auto_426752 ?auto_426754 ) ) ( not ( = ?auto_426752 ?auto_426755 ) ) ( not ( = ?auto_426752 ?auto_426756 ) ) ( not ( = ?auto_426753 ?auto_426754 ) ) ( not ( = ?auto_426753 ?auto_426755 ) ) ( not ( = ?auto_426753 ?auto_426756 ) ) ( not ( = ?auto_426754 ?auto_426755 ) ) ( not ( = ?auto_426754 ?auto_426756 ) ) ( not ( = ?auto_426755 ?auto_426756 ) ) ( CLEAR ?auto_426753 ) ( ON ?auto_426754 ?auto_426755 ) ( CLEAR ?auto_426754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_426742 ?auto_426743 ?auto_426744 ?auto_426745 ?auto_426746 ?auto_426747 ?auto_426748 ?auto_426749 ?auto_426750 ?auto_426751 ?auto_426752 ?auto_426753 ?auto_426754 )
      ( MAKE-14PILE ?auto_426742 ?auto_426743 ?auto_426744 ?auto_426745 ?auto_426746 ?auto_426747 ?auto_426748 ?auto_426749 ?auto_426750 ?auto_426751 ?auto_426752 ?auto_426753 ?auto_426754 ?auto_426755 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_426771 - BLOCK
      ?auto_426772 - BLOCK
      ?auto_426773 - BLOCK
      ?auto_426774 - BLOCK
      ?auto_426775 - BLOCK
      ?auto_426776 - BLOCK
      ?auto_426777 - BLOCK
      ?auto_426778 - BLOCK
      ?auto_426779 - BLOCK
      ?auto_426780 - BLOCK
      ?auto_426781 - BLOCK
      ?auto_426782 - BLOCK
      ?auto_426783 - BLOCK
      ?auto_426784 - BLOCK
    )
    :vars
    (
      ?auto_426785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426784 ?auto_426785 ) ( ON-TABLE ?auto_426771 ) ( ON ?auto_426772 ?auto_426771 ) ( ON ?auto_426773 ?auto_426772 ) ( ON ?auto_426774 ?auto_426773 ) ( ON ?auto_426775 ?auto_426774 ) ( ON ?auto_426776 ?auto_426775 ) ( ON ?auto_426777 ?auto_426776 ) ( ON ?auto_426778 ?auto_426777 ) ( ON ?auto_426779 ?auto_426778 ) ( ON ?auto_426780 ?auto_426779 ) ( ON ?auto_426781 ?auto_426780 ) ( ON ?auto_426782 ?auto_426781 ) ( not ( = ?auto_426771 ?auto_426772 ) ) ( not ( = ?auto_426771 ?auto_426773 ) ) ( not ( = ?auto_426771 ?auto_426774 ) ) ( not ( = ?auto_426771 ?auto_426775 ) ) ( not ( = ?auto_426771 ?auto_426776 ) ) ( not ( = ?auto_426771 ?auto_426777 ) ) ( not ( = ?auto_426771 ?auto_426778 ) ) ( not ( = ?auto_426771 ?auto_426779 ) ) ( not ( = ?auto_426771 ?auto_426780 ) ) ( not ( = ?auto_426771 ?auto_426781 ) ) ( not ( = ?auto_426771 ?auto_426782 ) ) ( not ( = ?auto_426771 ?auto_426783 ) ) ( not ( = ?auto_426771 ?auto_426784 ) ) ( not ( = ?auto_426771 ?auto_426785 ) ) ( not ( = ?auto_426772 ?auto_426773 ) ) ( not ( = ?auto_426772 ?auto_426774 ) ) ( not ( = ?auto_426772 ?auto_426775 ) ) ( not ( = ?auto_426772 ?auto_426776 ) ) ( not ( = ?auto_426772 ?auto_426777 ) ) ( not ( = ?auto_426772 ?auto_426778 ) ) ( not ( = ?auto_426772 ?auto_426779 ) ) ( not ( = ?auto_426772 ?auto_426780 ) ) ( not ( = ?auto_426772 ?auto_426781 ) ) ( not ( = ?auto_426772 ?auto_426782 ) ) ( not ( = ?auto_426772 ?auto_426783 ) ) ( not ( = ?auto_426772 ?auto_426784 ) ) ( not ( = ?auto_426772 ?auto_426785 ) ) ( not ( = ?auto_426773 ?auto_426774 ) ) ( not ( = ?auto_426773 ?auto_426775 ) ) ( not ( = ?auto_426773 ?auto_426776 ) ) ( not ( = ?auto_426773 ?auto_426777 ) ) ( not ( = ?auto_426773 ?auto_426778 ) ) ( not ( = ?auto_426773 ?auto_426779 ) ) ( not ( = ?auto_426773 ?auto_426780 ) ) ( not ( = ?auto_426773 ?auto_426781 ) ) ( not ( = ?auto_426773 ?auto_426782 ) ) ( not ( = ?auto_426773 ?auto_426783 ) ) ( not ( = ?auto_426773 ?auto_426784 ) ) ( not ( = ?auto_426773 ?auto_426785 ) ) ( not ( = ?auto_426774 ?auto_426775 ) ) ( not ( = ?auto_426774 ?auto_426776 ) ) ( not ( = ?auto_426774 ?auto_426777 ) ) ( not ( = ?auto_426774 ?auto_426778 ) ) ( not ( = ?auto_426774 ?auto_426779 ) ) ( not ( = ?auto_426774 ?auto_426780 ) ) ( not ( = ?auto_426774 ?auto_426781 ) ) ( not ( = ?auto_426774 ?auto_426782 ) ) ( not ( = ?auto_426774 ?auto_426783 ) ) ( not ( = ?auto_426774 ?auto_426784 ) ) ( not ( = ?auto_426774 ?auto_426785 ) ) ( not ( = ?auto_426775 ?auto_426776 ) ) ( not ( = ?auto_426775 ?auto_426777 ) ) ( not ( = ?auto_426775 ?auto_426778 ) ) ( not ( = ?auto_426775 ?auto_426779 ) ) ( not ( = ?auto_426775 ?auto_426780 ) ) ( not ( = ?auto_426775 ?auto_426781 ) ) ( not ( = ?auto_426775 ?auto_426782 ) ) ( not ( = ?auto_426775 ?auto_426783 ) ) ( not ( = ?auto_426775 ?auto_426784 ) ) ( not ( = ?auto_426775 ?auto_426785 ) ) ( not ( = ?auto_426776 ?auto_426777 ) ) ( not ( = ?auto_426776 ?auto_426778 ) ) ( not ( = ?auto_426776 ?auto_426779 ) ) ( not ( = ?auto_426776 ?auto_426780 ) ) ( not ( = ?auto_426776 ?auto_426781 ) ) ( not ( = ?auto_426776 ?auto_426782 ) ) ( not ( = ?auto_426776 ?auto_426783 ) ) ( not ( = ?auto_426776 ?auto_426784 ) ) ( not ( = ?auto_426776 ?auto_426785 ) ) ( not ( = ?auto_426777 ?auto_426778 ) ) ( not ( = ?auto_426777 ?auto_426779 ) ) ( not ( = ?auto_426777 ?auto_426780 ) ) ( not ( = ?auto_426777 ?auto_426781 ) ) ( not ( = ?auto_426777 ?auto_426782 ) ) ( not ( = ?auto_426777 ?auto_426783 ) ) ( not ( = ?auto_426777 ?auto_426784 ) ) ( not ( = ?auto_426777 ?auto_426785 ) ) ( not ( = ?auto_426778 ?auto_426779 ) ) ( not ( = ?auto_426778 ?auto_426780 ) ) ( not ( = ?auto_426778 ?auto_426781 ) ) ( not ( = ?auto_426778 ?auto_426782 ) ) ( not ( = ?auto_426778 ?auto_426783 ) ) ( not ( = ?auto_426778 ?auto_426784 ) ) ( not ( = ?auto_426778 ?auto_426785 ) ) ( not ( = ?auto_426779 ?auto_426780 ) ) ( not ( = ?auto_426779 ?auto_426781 ) ) ( not ( = ?auto_426779 ?auto_426782 ) ) ( not ( = ?auto_426779 ?auto_426783 ) ) ( not ( = ?auto_426779 ?auto_426784 ) ) ( not ( = ?auto_426779 ?auto_426785 ) ) ( not ( = ?auto_426780 ?auto_426781 ) ) ( not ( = ?auto_426780 ?auto_426782 ) ) ( not ( = ?auto_426780 ?auto_426783 ) ) ( not ( = ?auto_426780 ?auto_426784 ) ) ( not ( = ?auto_426780 ?auto_426785 ) ) ( not ( = ?auto_426781 ?auto_426782 ) ) ( not ( = ?auto_426781 ?auto_426783 ) ) ( not ( = ?auto_426781 ?auto_426784 ) ) ( not ( = ?auto_426781 ?auto_426785 ) ) ( not ( = ?auto_426782 ?auto_426783 ) ) ( not ( = ?auto_426782 ?auto_426784 ) ) ( not ( = ?auto_426782 ?auto_426785 ) ) ( not ( = ?auto_426783 ?auto_426784 ) ) ( not ( = ?auto_426783 ?auto_426785 ) ) ( not ( = ?auto_426784 ?auto_426785 ) ) ( CLEAR ?auto_426782 ) ( ON ?auto_426783 ?auto_426784 ) ( CLEAR ?auto_426783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_426771 ?auto_426772 ?auto_426773 ?auto_426774 ?auto_426775 ?auto_426776 ?auto_426777 ?auto_426778 ?auto_426779 ?auto_426780 ?auto_426781 ?auto_426782 ?auto_426783 )
      ( MAKE-14PILE ?auto_426771 ?auto_426772 ?auto_426773 ?auto_426774 ?auto_426775 ?auto_426776 ?auto_426777 ?auto_426778 ?auto_426779 ?auto_426780 ?auto_426781 ?auto_426782 ?auto_426783 ?auto_426784 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_426800 - BLOCK
      ?auto_426801 - BLOCK
      ?auto_426802 - BLOCK
      ?auto_426803 - BLOCK
      ?auto_426804 - BLOCK
      ?auto_426805 - BLOCK
      ?auto_426806 - BLOCK
      ?auto_426807 - BLOCK
      ?auto_426808 - BLOCK
      ?auto_426809 - BLOCK
      ?auto_426810 - BLOCK
      ?auto_426811 - BLOCK
      ?auto_426812 - BLOCK
      ?auto_426813 - BLOCK
    )
    :vars
    (
      ?auto_426814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426813 ?auto_426814 ) ( ON-TABLE ?auto_426800 ) ( ON ?auto_426801 ?auto_426800 ) ( ON ?auto_426802 ?auto_426801 ) ( ON ?auto_426803 ?auto_426802 ) ( ON ?auto_426804 ?auto_426803 ) ( ON ?auto_426805 ?auto_426804 ) ( ON ?auto_426806 ?auto_426805 ) ( ON ?auto_426807 ?auto_426806 ) ( ON ?auto_426808 ?auto_426807 ) ( ON ?auto_426809 ?auto_426808 ) ( ON ?auto_426810 ?auto_426809 ) ( not ( = ?auto_426800 ?auto_426801 ) ) ( not ( = ?auto_426800 ?auto_426802 ) ) ( not ( = ?auto_426800 ?auto_426803 ) ) ( not ( = ?auto_426800 ?auto_426804 ) ) ( not ( = ?auto_426800 ?auto_426805 ) ) ( not ( = ?auto_426800 ?auto_426806 ) ) ( not ( = ?auto_426800 ?auto_426807 ) ) ( not ( = ?auto_426800 ?auto_426808 ) ) ( not ( = ?auto_426800 ?auto_426809 ) ) ( not ( = ?auto_426800 ?auto_426810 ) ) ( not ( = ?auto_426800 ?auto_426811 ) ) ( not ( = ?auto_426800 ?auto_426812 ) ) ( not ( = ?auto_426800 ?auto_426813 ) ) ( not ( = ?auto_426800 ?auto_426814 ) ) ( not ( = ?auto_426801 ?auto_426802 ) ) ( not ( = ?auto_426801 ?auto_426803 ) ) ( not ( = ?auto_426801 ?auto_426804 ) ) ( not ( = ?auto_426801 ?auto_426805 ) ) ( not ( = ?auto_426801 ?auto_426806 ) ) ( not ( = ?auto_426801 ?auto_426807 ) ) ( not ( = ?auto_426801 ?auto_426808 ) ) ( not ( = ?auto_426801 ?auto_426809 ) ) ( not ( = ?auto_426801 ?auto_426810 ) ) ( not ( = ?auto_426801 ?auto_426811 ) ) ( not ( = ?auto_426801 ?auto_426812 ) ) ( not ( = ?auto_426801 ?auto_426813 ) ) ( not ( = ?auto_426801 ?auto_426814 ) ) ( not ( = ?auto_426802 ?auto_426803 ) ) ( not ( = ?auto_426802 ?auto_426804 ) ) ( not ( = ?auto_426802 ?auto_426805 ) ) ( not ( = ?auto_426802 ?auto_426806 ) ) ( not ( = ?auto_426802 ?auto_426807 ) ) ( not ( = ?auto_426802 ?auto_426808 ) ) ( not ( = ?auto_426802 ?auto_426809 ) ) ( not ( = ?auto_426802 ?auto_426810 ) ) ( not ( = ?auto_426802 ?auto_426811 ) ) ( not ( = ?auto_426802 ?auto_426812 ) ) ( not ( = ?auto_426802 ?auto_426813 ) ) ( not ( = ?auto_426802 ?auto_426814 ) ) ( not ( = ?auto_426803 ?auto_426804 ) ) ( not ( = ?auto_426803 ?auto_426805 ) ) ( not ( = ?auto_426803 ?auto_426806 ) ) ( not ( = ?auto_426803 ?auto_426807 ) ) ( not ( = ?auto_426803 ?auto_426808 ) ) ( not ( = ?auto_426803 ?auto_426809 ) ) ( not ( = ?auto_426803 ?auto_426810 ) ) ( not ( = ?auto_426803 ?auto_426811 ) ) ( not ( = ?auto_426803 ?auto_426812 ) ) ( not ( = ?auto_426803 ?auto_426813 ) ) ( not ( = ?auto_426803 ?auto_426814 ) ) ( not ( = ?auto_426804 ?auto_426805 ) ) ( not ( = ?auto_426804 ?auto_426806 ) ) ( not ( = ?auto_426804 ?auto_426807 ) ) ( not ( = ?auto_426804 ?auto_426808 ) ) ( not ( = ?auto_426804 ?auto_426809 ) ) ( not ( = ?auto_426804 ?auto_426810 ) ) ( not ( = ?auto_426804 ?auto_426811 ) ) ( not ( = ?auto_426804 ?auto_426812 ) ) ( not ( = ?auto_426804 ?auto_426813 ) ) ( not ( = ?auto_426804 ?auto_426814 ) ) ( not ( = ?auto_426805 ?auto_426806 ) ) ( not ( = ?auto_426805 ?auto_426807 ) ) ( not ( = ?auto_426805 ?auto_426808 ) ) ( not ( = ?auto_426805 ?auto_426809 ) ) ( not ( = ?auto_426805 ?auto_426810 ) ) ( not ( = ?auto_426805 ?auto_426811 ) ) ( not ( = ?auto_426805 ?auto_426812 ) ) ( not ( = ?auto_426805 ?auto_426813 ) ) ( not ( = ?auto_426805 ?auto_426814 ) ) ( not ( = ?auto_426806 ?auto_426807 ) ) ( not ( = ?auto_426806 ?auto_426808 ) ) ( not ( = ?auto_426806 ?auto_426809 ) ) ( not ( = ?auto_426806 ?auto_426810 ) ) ( not ( = ?auto_426806 ?auto_426811 ) ) ( not ( = ?auto_426806 ?auto_426812 ) ) ( not ( = ?auto_426806 ?auto_426813 ) ) ( not ( = ?auto_426806 ?auto_426814 ) ) ( not ( = ?auto_426807 ?auto_426808 ) ) ( not ( = ?auto_426807 ?auto_426809 ) ) ( not ( = ?auto_426807 ?auto_426810 ) ) ( not ( = ?auto_426807 ?auto_426811 ) ) ( not ( = ?auto_426807 ?auto_426812 ) ) ( not ( = ?auto_426807 ?auto_426813 ) ) ( not ( = ?auto_426807 ?auto_426814 ) ) ( not ( = ?auto_426808 ?auto_426809 ) ) ( not ( = ?auto_426808 ?auto_426810 ) ) ( not ( = ?auto_426808 ?auto_426811 ) ) ( not ( = ?auto_426808 ?auto_426812 ) ) ( not ( = ?auto_426808 ?auto_426813 ) ) ( not ( = ?auto_426808 ?auto_426814 ) ) ( not ( = ?auto_426809 ?auto_426810 ) ) ( not ( = ?auto_426809 ?auto_426811 ) ) ( not ( = ?auto_426809 ?auto_426812 ) ) ( not ( = ?auto_426809 ?auto_426813 ) ) ( not ( = ?auto_426809 ?auto_426814 ) ) ( not ( = ?auto_426810 ?auto_426811 ) ) ( not ( = ?auto_426810 ?auto_426812 ) ) ( not ( = ?auto_426810 ?auto_426813 ) ) ( not ( = ?auto_426810 ?auto_426814 ) ) ( not ( = ?auto_426811 ?auto_426812 ) ) ( not ( = ?auto_426811 ?auto_426813 ) ) ( not ( = ?auto_426811 ?auto_426814 ) ) ( not ( = ?auto_426812 ?auto_426813 ) ) ( not ( = ?auto_426812 ?auto_426814 ) ) ( not ( = ?auto_426813 ?auto_426814 ) ) ( ON ?auto_426812 ?auto_426813 ) ( CLEAR ?auto_426810 ) ( ON ?auto_426811 ?auto_426812 ) ( CLEAR ?auto_426811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_426800 ?auto_426801 ?auto_426802 ?auto_426803 ?auto_426804 ?auto_426805 ?auto_426806 ?auto_426807 ?auto_426808 ?auto_426809 ?auto_426810 ?auto_426811 )
      ( MAKE-14PILE ?auto_426800 ?auto_426801 ?auto_426802 ?auto_426803 ?auto_426804 ?auto_426805 ?auto_426806 ?auto_426807 ?auto_426808 ?auto_426809 ?auto_426810 ?auto_426811 ?auto_426812 ?auto_426813 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_426829 - BLOCK
      ?auto_426830 - BLOCK
      ?auto_426831 - BLOCK
      ?auto_426832 - BLOCK
      ?auto_426833 - BLOCK
      ?auto_426834 - BLOCK
      ?auto_426835 - BLOCK
      ?auto_426836 - BLOCK
      ?auto_426837 - BLOCK
      ?auto_426838 - BLOCK
      ?auto_426839 - BLOCK
      ?auto_426840 - BLOCK
      ?auto_426841 - BLOCK
      ?auto_426842 - BLOCK
    )
    :vars
    (
      ?auto_426843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426842 ?auto_426843 ) ( ON-TABLE ?auto_426829 ) ( ON ?auto_426830 ?auto_426829 ) ( ON ?auto_426831 ?auto_426830 ) ( ON ?auto_426832 ?auto_426831 ) ( ON ?auto_426833 ?auto_426832 ) ( ON ?auto_426834 ?auto_426833 ) ( ON ?auto_426835 ?auto_426834 ) ( ON ?auto_426836 ?auto_426835 ) ( ON ?auto_426837 ?auto_426836 ) ( ON ?auto_426838 ?auto_426837 ) ( ON ?auto_426839 ?auto_426838 ) ( not ( = ?auto_426829 ?auto_426830 ) ) ( not ( = ?auto_426829 ?auto_426831 ) ) ( not ( = ?auto_426829 ?auto_426832 ) ) ( not ( = ?auto_426829 ?auto_426833 ) ) ( not ( = ?auto_426829 ?auto_426834 ) ) ( not ( = ?auto_426829 ?auto_426835 ) ) ( not ( = ?auto_426829 ?auto_426836 ) ) ( not ( = ?auto_426829 ?auto_426837 ) ) ( not ( = ?auto_426829 ?auto_426838 ) ) ( not ( = ?auto_426829 ?auto_426839 ) ) ( not ( = ?auto_426829 ?auto_426840 ) ) ( not ( = ?auto_426829 ?auto_426841 ) ) ( not ( = ?auto_426829 ?auto_426842 ) ) ( not ( = ?auto_426829 ?auto_426843 ) ) ( not ( = ?auto_426830 ?auto_426831 ) ) ( not ( = ?auto_426830 ?auto_426832 ) ) ( not ( = ?auto_426830 ?auto_426833 ) ) ( not ( = ?auto_426830 ?auto_426834 ) ) ( not ( = ?auto_426830 ?auto_426835 ) ) ( not ( = ?auto_426830 ?auto_426836 ) ) ( not ( = ?auto_426830 ?auto_426837 ) ) ( not ( = ?auto_426830 ?auto_426838 ) ) ( not ( = ?auto_426830 ?auto_426839 ) ) ( not ( = ?auto_426830 ?auto_426840 ) ) ( not ( = ?auto_426830 ?auto_426841 ) ) ( not ( = ?auto_426830 ?auto_426842 ) ) ( not ( = ?auto_426830 ?auto_426843 ) ) ( not ( = ?auto_426831 ?auto_426832 ) ) ( not ( = ?auto_426831 ?auto_426833 ) ) ( not ( = ?auto_426831 ?auto_426834 ) ) ( not ( = ?auto_426831 ?auto_426835 ) ) ( not ( = ?auto_426831 ?auto_426836 ) ) ( not ( = ?auto_426831 ?auto_426837 ) ) ( not ( = ?auto_426831 ?auto_426838 ) ) ( not ( = ?auto_426831 ?auto_426839 ) ) ( not ( = ?auto_426831 ?auto_426840 ) ) ( not ( = ?auto_426831 ?auto_426841 ) ) ( not ( = ?auto_426831 ?auto_426842 ) ) ( not ( = ?auto_426831 ?auto_426843 ) ) ( not ( = ?auto_426832 ?auto_426833 ) ) ( not ( = ?auto_426832 ?auto_426834 ) ) ( not ( = ?auto_426832 ?auto_426835 ) ) ( not ( = ?auto_426832 ?auto_426836 ) ) ( not ( = ?auto_426832 ?auto_426837 ) ) ( not ( = ?auto_426832 ?auto_426838 ) ) ( not ( = ?auto_426832 ?auto_426839 ) ) ( not ( = ?auto_426832 ?auto_426840 ) ) ( not ( = ?auto_426832 ?auto_426841 ) ) ( not ( = ?auto_426832 ?auto_426842 ) ) ( not ( = ?auto_426832 ?auto_426843 ) ) ( not ( = ?auto_426833 ?auto_426834 ) ) ( not ( = ?auto_426833 ?auto_426835 ) ) ( not ( = ?auto_426833 ?auto_426836 ) ) ( not ( = ?auto_426833 ?auto_426837 ) ) ( not ( = ?auto_426833 ?auto_426838 ) ) ( not ( = ?auto_426833 ?auto_426839 ) ) ( not ( = ?auto_426833 ?auto_426840 ) ) ( not ( = ?auto_426833 ?auto_426841 ) ) ( not ( = ?auto_426833 ?auto_426842 ) ) ( not ( = ?auto_426833 ?auto_426843 ) ) ( not ( = ?auto_426834 ?auto_426835 ) ) ( not ( = ?auto_426834 ?auto_426836 ) ) ( not ( = ?auto_426834 ?auto_426837 ) ) ( not ( = ?auto_426834 ?auto_426838 ) ) ( not ( = ?auto_426834 ?auto_426839 ) ) ( not ( = ?auto_426834 ?auto_426840 ) ) ( not ( = ?auto_426834 ?auto_426841 ) ) ( not ( = ?auto_426834 ?auto_426842 ) ) ( not ( = ?auto_426834 ?auto_426843 ) ) ( not ( = ?auto_426835 ?auto_426836 ) ) ( not ( = ?auto_426835 ?auto_426837 ) ) ( not ( = ?auto_426835 ?auto_426838 ) ) ( not ( = ?auto_426835 ?auto_426839 ) ) ( not ( = ?auto_426835 ?auto_426840 ) ) ( not ( = ?auto_426835 ?auto_426841 ) ) ( not ( = ?auto_426835 ?auto_426842 ) ) ( not ( = ?auto_426835 ?auto_426843 ) ) ( not ( = ?auto_426836 ?auto_426837 ) ) ( not ( = ?auto_426836 ?auto_426838 ) ) ( not ( = ?auto_426836 ?auto_426839 ) ) ( not ( = ?auto_426836 ?auto_426840 ) ) ( not ( = ?auto_426836 ?auto_426841 ) ) ( not ( = ?auto_426836 ?auto_426842 ) ) ( not ( = ?auto_426836 ?auto_426843 ) ) ( not ( = ?auto_426837 ?auto_426838 ) ) ( not ( = ?auto_426837 ?auto_426839 ) ) ( not ( = ?auto_426837 ?auto_426840 ) ) ( not ( = ?auto_426837 ?auto_426841 ) ) ( not ( = ?auto_426837 ?auto_426842 ) ) ( not ( = ?auto_426837 ?auto_426843 ) ) ( not ( = ?auto_426838 ?auto_426839 ) ) ( not ( = ?auto_426838 ?auto_426840 ) ) ( not ( = ?auto_426838 ?auto_426841 ) ) ( not ( = ?auto_426838 ?auto_426842 ) ) ( not ( = ?auto_426838 ?auto_426843 ) ) ( not ( = ?auto_426839 ?auto_426840 ) ) ( not ( = ?auto_426839 ?auto_426841 ) ) ( not ( = ?auto_426839 ?auto_426842 ) ) ( not ( = ?auto_426839 ?auto_426843 ) ) ( not ( = ?auto_426840 ?auto_426841 ) ) ( not ( = ?auto_426840 ?auto_426842 ) ) ( not ( = ?auto_426840 ?auto_426843 ) ) ( not ( = ?auto_426841 ?auto_426842 ) ) ( not ( = ?auto_426841 ?auto_426843 ) ) ( not ( = ?auto_426842 ?auto_426843 ) ) ( ON ?auto_426841 ?auto_426842 ) ( CLEAR ?auto_426839 ) ( ON ?auto_426840 ?auto_426841 ) ( CLEAR ?auto_426840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_426829 ?auto_426830 ?auto_426831 ?auto_426832 ?auto_426833 ?auto_426834 ?auto_426835 ?auto_426836 ?auto_426837 ?auto_426838 ?auto_426839 ?auto_426840 )
      ( MAKE-14PILE ?auto_426829 ?auto_426830 ?auto_426831 ?auto_426832 ?auto_426833 ?auto_426834 ?auto_426835 ?auto_426836 ?auto_426837 ?auto_426838 ?auto_426839 ?auto_426840 ?auto_426841 ?auto_426842 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_426858 - BLOCK
      ?auto_426859 - BLOCK
      ?auto_426860 - BLOCK
      ?auto_426861 - BLOCK
      ?auto_426862 - BLOCK
      ?auto_426863 - BLOCK
      ?auto_426864 - BLOCK
      ?auto_426865 - BLOCK
      ?auto_426866 - BLOCK
      ?auto_426867 - BLOCK
      ?auto_426868 - BLOCK
      ?auto_426869 - BLOCK
      ?auto_426870 - BLOCK
      ?auto_426871 - BLOCK
    )
    :vars
    (
      ?auto_426872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426871 ?auto_426872 ) ( ON-TABLE ?auto_426858 ) ( ON ?auto_426859 ?auto_426858 ) ( ON ?auto_426860 ?auto_426859 ) ( ON ?auto_426861 ?auto_426860 ) ( ON ?auto_426862 ?auto_426861 ) ( ON ?auto_426863 ?auto_426862 ) ( ON ?auto_426864 ?auto_426863 ) ( ON ?auto_426865 ?auto_426864 ) ( ON ?auto_426866 ?auto_426865 ) ( ON ?auto_426867 ?auto_426866 ) ( not ( = ?auto_426858 ?auto_426859 ) ) ( not ( = ?auto_426858 ?auto_426860 ) ) ( not ( = ?auto_426858 ?auto_426861 ) ) ( not ( = ?auto_426858 ?auto_426862 ) ) ( not ( = ?auto_426858 ?auto_426863 ) ) ( not ( = ?auto_426858 ?auto_426864 ) ) ( not ( = ?auto_426858 ?auto_426865 ) ) ( not ( = ?auto_426858 ?auto_426866 ) ) ( not ( = ?auto_426858 ?auto_426867 ) ) ( not ( = ?auto_426858 ?auto_426868 ) ) ( not ( = ?auto_426858 ?auto_426869 ) ) ( not ( = ?auto_426858 ?auto_426870 ) ) ( not ( = ?auto_426858 ?auto_426871 ) ) ( not ( = ?auto_426858 ?auto_426872 ) ) ( not ( = ?auto_426859 ?auto_426860 ) ) ( not ( = ?auto_426859 ?auto_426861 ) ) ( not ( = ?auto_426859 ?auto_426862 ) ) ( not ( = ?auto_426859 ?auto_426863 ) ) ( not ( = ?auto_426859 ?auto_426864 ) ) ( not ( = ?auto_426859 ?auto_426865 ) ) ( not ( = ?auto_426859 ?auto_426866 ) ) ( not ( = ?auto_426859 ?auto_426867 ) ) ( not ( = ?auto_426859 ?auto_426868 ) ) ( not ( = ?auto_426859 ?auto_426869 ) ) ( not ( = ?auto_426859 ?auto_426870 ) ) ( not ( = ?auto_426859 ?auto_426871 ) ) ( not ( = ?auto_426859 ?auto_426872 ) ) ( not ( = ?auto_426860 ?auto_426861 ) ) ( not ( = ?auto_426860 ?auto_426862 ) ) ( not ( = ?auto_426860 ?auto_426863 ) ) ( not ( = ?auto_426860 ?auto_426864 ) ) ( not ( = ?auto_426860 ?auto_426865 ) ) ( not ( = ?auto_426860 ?auto_426866 ) ) ( not ( = ?auto_426860 ?auto_426867 ) ) ( not ( = ?auto_426860 ?auto_426868 ) ) ( not ( = ?auto_426860 ?auto_426869 ) ) ( not ( = ?auto_426860 ?auto_426870 ) ) ( not ( = ?auto_426860 ?auto_426871 ) ) ( not ( = ?auto_426860 ?auto_426872 ) ) ( not ( = ?auto_426861 ?auto_426862 ) ) ( not ( = ?auto_426861 ?auto_426863 ) ) ( not ( = ?auto_426861 ?auto_426864 ) ) ( not ( = ?auto_426861 ?auto_426865 ) ) ( not ( = ?auto_426861 ?auto_426866 ) ) ( not ( = ?auto_426861 ?auto_426867 ) ) ( not ( = ?auto_426861 ?auto_426868 ) ) ( not ( = ?auto_426861 ?auto_426869 ) ) ( not ( = ?auto_426861 ?auto_426870 ) ) ( not ( = ?auto_426861 ?auto_426871 ) ) ( not ( = ?auto_426861 ?auto_426872 ) ) ( not ( = ?auto_426862 ?auto_426863 ) ) ( not ( = ?auto_426862 ?auto_426864 ) ) ( not ( = ?auto_426862 ?auto_426865 ) ) ( not ( = ?auto_426862 ?auto_426866 ) ) ( not ( = ?auto_426862 ?auto_426867 ) ) ( not ( = ?auto_426862 ?auto_426868 ) ) ( not ( = ?auto_426862 ?auto_426869 ) ) ( not ( = ?auto_426862 ?auto_426870 ) ) ( not ( = ?auto_426862 ?auto_426871 ) ) ( not ( = ?auto_426862 ?auto_426872 ) ) ( not ( = ?auto_426863 ?auto_426864 ) ) ( not ( = ?auto_426863 ?auto_426865 ) ) ( not ( = ?auto_426863 ?auto_426866 ) ) ( not ( = ?auto_426863 ?auto_426867 ) ) ( not ( = ?auto_426863 ?auto_426868 ) ) ( not ( = ?auto_426863 ?auto_426869 ) ) ( not ( = ?auto_426863 ?auto_426870 ) ) ( not ( = ?auto_426863 ?auto_426871 ) ) ( not ( = ?auto_426863 ?auto_426872 ) ) ( not ( = ?auto_426864 ?auto_426865 ) ) ( not ( = ?auto_426864 ?auto_426866 ) ) ( not ( = ?auto_426864 ?auto_426867 ) ) ( not ( = ?auto_426864 ?auto_426868 ) ) ( not ( = ?auto_426864 ?auto_426869 ) ) ( not ( = ?auto_426864 ?auto_426870 ) ) ( not ( = ?auto_426864 ?auto_426871 ) ) ( not ( = ?auto_426864 ?auto_426872 ) ) ( not ( = ?auto_426865 ?auto_426866 ) ) ( not ( = ?auto_426865 ?auto_426867 ) ) ( not ( = ?auto_426865 ?auto_426868 ) ) ( not ( = ?auto_426865 ?auto_426869 ) ) ( not ( = ?auto_426865 ?auto_426870 ) ) ( not ( = ?auto_426865 ?auto_426871 ) ) ( not ( = ?auto_426865 ?auto_426872 ) ) ( not ( = ?auto_426866 ?auto_426867 ) ) ( not ( = ?auto_426866 ?auto_426868 ) ) ( not ( = ?auto_426866 ?auto_426869 ) ) ( not ( = ?auto_426866 ?auto_426870 ) ) ( not ( = ?auto_426866 ?auto_426871 ) ) ( not ( = ?auto_426866 ?auto_426872 ) ) ( not ( = ?auto_426867 ?auto_426868 ) ) ( not ( = ?auto_426867 ?auto_426869 ) ) ( not ( = ?auto_426867 ?auto_426870 ) ) ( not ( = ?auto_426867 ?auto_426871 ) ) ( not ( = ?auto_426867 ?auto_426872 ) ) ( not ( = ?auto_426868 ?auto_426869 ) ) ( not ( = ?auto_426868 ?auto_426870 ) ) ( not ( = ?auto_426868 ?auto_426871 ) ) ( not ( = ?auto_426868 ?auto_426872 ) ) ( not ( = ?auto_426869 ?auto_426870 ) ) ( not ( = ?auto_426869 ?auto_426871 ) ) ( not ( = ?auto_426869 ?auto_426872 ) ) ( not ( = ?auto_426870 ?auto_426871 ) ) ( not ( = ?auto_426870 ?auto_426872 ) ) ( not ( = ?auto_426871 ?auto_426872 ) ) ( ON ?auto_426870 ?auto_426871 ) ( ON ?auto_426869 ?auto_426870 ) ( CLEAR ?auto_426867 ) ( ON ?auto_426868 ?auto_426869 ) ( CLEAR ?auto_426868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_426858 ?auto_426859 ?auto_426860 ?auto_426861 ?auto_426862 ?auto_426863 ?auto_426864 ?auto_426865 ?auto_426866 ?auto_426867 ?auto_426868 )
      ( MAKE-14PILE ?auto_426858 ?auto_426859 ?auto_426860 ?auto_426861 ?auto_426862 ?auto_426863 ?auto_426864 ?auto_426865 ?auto_426866 ?auto_426867 ?auto_426868 ?auto_426869 ?auto_426870 ?auto_426871 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_426887 - BLOCK
      ?auto_426888 - BLOCK
      ?auto_426889 - BLOCK
      ?auto_426890 - BLOCK
      ?auto_426891 - BLOCK
      ?auto_426892 - BLOCK
      ?auto_426893 - BLOCK
      ?auto_426894 - BLOCK
      ?auto_426895 - BLOCK
      ?auto_426896 - BLOCK
      ?auto_426897 - BLOCK
      ?auto_426898 - BLOCK
      ?auto_426899 - BLOCK
      ?auto_426900 - BLOCK
    )
    :vars
    (
      ?auto_426901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426900 ?auto_426901 ) ( ON-TABLE ?auto_426887 ) ( ON ?auto_426888 ?auto_426887 ) ( ON ?auto_426889 ?auto_426888 ) ( ON ?auto_426890 ?auto_426889 ) ( ON ?auto_426891 ?auto_426890 ) ( ON ?auto_426892 ?auto_426891 ) ( ON ?auto_426893 ?auto_426892 ) ( ON ?auto_426894 ?auto_426893 ) ( ON ?auto_426895 ?auto_426894 ) ( ON ?auto_426896 ?auto_426895 ) ( not ( = ?auto_426887 ?auto_426888 ) ) ( not ( = ?auto_426887 ?auto_426889 ) ) ( not ( = ?auto_426887 ?auto_426890 ) ) ( not ( = ?auto_426887 ?auto_426891 ) ) ( not ( = ?auto_426887 ?auto_426892 ) ) ( not ( = ?auto_426887 ?auto_426893 ) ) ( not ( = ?auto_426887 ?auto_426894 ) ) ( not ( = ?auto_426887 ?auto_426895 ) ) ( not ( = ?auto_426887 ?auto_426896 ) ) ( not ( = ?auto_426887 ?auto_426897 ) ) ( not ( = ?auto_426887 ?auto_426898 ) ) ( not ( = ?auto_426887 ?auto_426899 ) ) ( not ( = ?auto_426887 ?auto_426900 ) ) ( not ( = ?auto_426887 ?auto_426901 ) ) ( not ( = ?auto_426888 ?auto_426889 ) ) ( not ( = ?auto_426888 ?auto_426890 ) ) ( not ( = ?auto_426888 ?auto_426891 ) ) ( not ( = ?auto_426888 ?auto_426892 ) ) ( not ( = ?auto_426888 ?auto_426893 ) ) ( not ( = ?auto_426888 ?auto_426894 ) ) ( not ( = ?auto_426888 ?auto_426895 ) ) ( not ( = ?auto_426888 ?auto_426896 ) ) ( not ( = ?auto_426888 ?auto_426897 ) ) ( not ( = ?auto_426888 ?auto_426898 ) ) ( not ( = ?auto_426888 ?auto_426899 ) ) ( not ( = ?auto_426888 ?auto_426900 ) ) ( not ( = ?auto_426888 ?auto_426901 ) ) ( not ( = ?auto_426889 ?auto_426890 ) ) ( not ( = ?auto_426889 ?auto_426891 ) ) ( not ( = ?auto_426889 ?auto_426892 ) ) ( not ( = ?auto_426889 ?auto_426893 ) ) ( not ( = ?auto_426889 ?auto_426894 ) ) ( not ( = ?auto_426889 ?auto_426895 ) ) ( not ( = ?auto_426889 ?auto_426896 ) ) ( not ( = ?auto_426889 ?auto_426897 ) ) ( not ( = ?auto_426889 ?auto_426898 ) ) ( not ( = ?auto_426889 ?auto_426899 ) ) ( not ( = ?auto_426889 ?auto_426900 ) ) ( not ( = ?auto_426889 ?auto_426901 ) ) ( not ( = ?auto_426890 ?auto_426891 ) ) ( not ( = ?auto_426890 ?auto_426892 ) ) ( not ( = ?auto_426890 ?auto_426893 ) ) ( not ( = ?auto_426890 ?auto_426894 ) ) ( not ( = ?auto_426890 ?auto_426895 ) ) ( not ( = ?auto_426890 ?auto_426896 ) ) ( not ( = ?auto_426890 ?auto_426897 ) ) ( not ( = ?auto_426890 ?auto_426898 ) ) ( not ( = ?auto_426890 ?auto_426899 ) ) ( not ( = ?auto_426890 ?auto_426900 ) ) ( not ( = ?auto_426890 ?auto_426901 ) ) ( not ( = ?auto_426891 ?auto_426892 ) ) ( not ( = ?auto_426891 ?auto_426893 ) ) ( not ( = ?auto_426891 ?auto_426894 ) ) ( not ( = ?auto_426891 ?auto_426895 ) ) ( not ( = ?auto_426891 ?auto_426896 ) ) ( not ( = ?auto_426891 ?auto_426897 ) ) ( not ( = ?auto_426891 ?auto_426898 ) ) ( not ( = ?auto_426891 ?auto_426899 ) ) ( not ( = ?auto_426891 ?auto_426900 ) ) ( not ( = ?auto_426891 ?auto_426901 ) ) ( not ( = ?auto_426892 ?auto_426893 ) ) ( not ( = ?auto_426892 ?auto_426894 ) ) ( not ( = ?auto_426892 ?auto_426895 ) ) ( not ( = ?auto_426892 ?auto_426896 ) ) ( not ( = ?auto_426892 ?auto_426897 ) ) ( not ( = ?auto_426892 ?auto_426898 ) ) ( not ( = ?auto_426892 ?auto_426899 ) ) ( not ( = ?auto_426892 ?auto_426900 ) ) ( not ( = ?auto_426892 ?auto_426901 ) ) ( not ( = ?auto_426893 ?auto_426894 ) ) ( not ( = ?auto_426893 ?auto_426895 ) ) ( not ( = ?auto_426893 ?auto_426896 ) ) ( not ( = ?auto_426893 ?auto_426897 ) ) ( not ( = ?auto_426893 ?auto_426898 ) ) ( not ( = ?auto_426893 ?auto_426899 ) ) ( not ( = ?auto_426893 ?auto_426900 ) ) ( not ( = ?auto_426893 ?auto_426901 ) ) ( not ( = ?auto_426894 ?auto_426895 ) ) ( not ( = ?auto_426894 ?auto_426896 ) ) ( not ( = ?auto_426894 ?auto_426897 ) ) ( not ( = ?auto_426894 ?auto_426898 ) ) ( not ( = ?auto_426894 ?auto_426899 ) ) ( not ( = ?auto_426894 ?auto_426900 ) ) ( not ( = ?auto_426894 ?auto_426901 ) ) ( not ( = ?auto_426895 ?auto_426896 ) ) ( not ( = ?auto_426895 ?auto_426897 ) ) ( not ( = ?auto_426895 ?auto_426898 ) ) ( not ( = ?auto_426895 ?auto_426899 ) ) ( not ( = ?auto_426895 ?auto_426900 ) ) ( not ( = ?auto_426895 ?auto_426901 ) ) ( not ( = ?auto_426896 ?auto_426897 ) ) ( not ( = ?auto_426896 ?auto_426898 ) ) ( not ( = ?auto_426896 ?auto_426899 ) ) ( not ( = ?auto_426896 ?auto_426900 ) ) ( not ( = ?auto_426896 ?auto_426901 ) ) ( not ( = ?auto_426897 ?auto_426898 ) ) ( not ( = ?auto_426897 ?auto_426899 ) ) ( not ( = ?auto_426897 ?auto_426900 ) ) ( not ( = ?auto_426897 ?auto_426901 ) ) ( not ( = ?auto_426898 ?auto_426899 ) ) ( not ( = ?auto_426898 ?auto_426900 ) ) ( not ( = ?auto_426898 ?auto_426901 ) ) ( not ( = ?auto_426899 ?auto_426900 ) ) ( not ( = ?auto_426899 ?auto_426901 ) ) ( not ( = ?auto_426900 ?auto_426901 ) ) ( ON ?auto_426899 ?auto_426900 ) ( ON ?auto_426898 ?auto_426899 ) ( CLEAR ?auto_426896 ) ( ON ?auto_426897 ?auto_426898 ) ( CLEAR ?auto_426897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_426887 ?auto_426888 ?auto_426889 ?auto_426890 ?auto_426891 ?auto_426892 ?auto_426893 ?auto_426894 ?auto_426895 ?auto_426896 ?auto_426897 )
      ( MAKE-14PILE ?auto_426887 ?auto_426888 ?auto_426889 ?auto_426890 ?auto_426891 ?auto_426892 ?auto_426893 ?auto_426894 ?auto_426895 ?auto_426896 ?auto_426897 ?auto_426898 ?auto_426899 ?auto_426900 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_426916 - BLOCK
      ?auto_426917 - BLOCK
      ?auto_426918 - BLOCK
      ?auto_426919 - BLOCK
      ?auto_426920 - BLOCK
      ?auto_426921 - BLOCK
      ?auto_426922 - BLOCK
      ?auto_426923 - BLOCK
      ?auto_426924 - BLOCK
      ?auto_426925 - BLOCK
      ?auto_426926 - BLOCK
      ?auto_426927 - BLOCK
      ?auto_426928 - BLOCK
      ?auto_426929 - BLOCK
    )
    :vars
    (
      ?auto_426930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426929 ?auto_426930 ) ( ON-TABLE ?auto_426916 ) ( ON ?auto_426917 ?auto_426916 ) ( ON ?auto_426918 ?auto_426917 ) ( ON ?auto_426919 ?auto_426918 ) ( ON ?auto_426920 ?auto_426919 ) ( ON ?auto_426921 ?auto_426920 ) ( ON ?auto_426922 ?auto_426921 ) ( ON ?auto_426923 ?auto_426922 ) ( ON ?auto_426924 ?auto_426923 ) ( not ( = ?auto_426916 ?auto_426917 ) ) ( not ( = ?auto_426916 ?auto_426918 ) ) ( not ( = ?auto_426916 ?auto_426919 ) ) ( not ( = ?auto_426916 ?auto_426920 ) ) ( not ( = ?auto_426916 ?auto_426921 ) ) ( not ( = ?auto_426916 ?auto_426922 ) ) ( not ( = ?auto_426916 ?auto_426923 ) ) ( not ( = ?auto_426916 ?auto_426924 ) ) ( not ( = ?auto_426916 ?auto_426925 ) ) ( not ( = ?auto_426916 ?auto_426926 ) ) ( not ( = ?auto_426916 ?auto_426927 ) ) ( not ( = ?auto_426916 ?auto_426928 ) ) ( not ( = ?auto_426916 ?auto_426929 ) ) ( not ( = ?auto_426916 ?auto_426930 ) ) ( not ( = ?auto_426917 ?auto_426918 ) ) ( not ( = ?auto_426917 ?auto_426919 ) ) ( not ( = ?auto_426917 ?auto_426920 ) ) ( not ( = ?auto_426917 ?auto_426921 ) ) ( not ( = ?auto_426917 ?auto_426922 ) ) ( not ( = ?auto_426917 ?auto_426923 ) ) ( not ( = ?auto_426917 ?auto_426924 ) ) ( not ( = ?auto_426917 ?auto_426925 ) ) ( not ( = ?auto_426917 ?auto_426926 ) ) ( not ( = ?auto_426917 ?auto_426927 ) ) ( not ( = ?auto_426917 ?auto_426928 ) ) ( not ( = ?auto_426917 ?auto_426929 ) ) ( not ( = ?auto_426917 ?auto_426930 ) ) ( not ( = ?auto_426918 ?auto_426919 ) ) ( not ( = ?auto_426918 ?auto_426920 ) ) ( not ( = ?auto_426918 ?auto_426921 ) ) ( not ( = ?auto_426918 ?auto_426922 ) ) ( not ( = ?auto_426918 ?auto_426923 ) ) ( not ( = ?auto_426918 ?auto_426924 ) ) ( not ( = ?auto_426918 ?auto_426925 ) ) ( not ( = ?auto_426918 ?auto_426926 ) ) ( not ( = ?auto_426918 ?auto_426927 ) ) ( not ( = ?auto_426918 ?auto_426928 ) ) ( not ( = ?auto_426918 ?auto_426929 ) ) ( not ( = ?auto_426918 ?auto_426930 ) ) ( not ( = ?auto_426919 ?auto_426920 ) ) ( not ( = ?auto_426919 ?auto_426921 ) ) ( not ( = ?auto_426919 ?auto_426922 ) ) ( not ( = ?auto_426919 ?auto_426923 ) ) ( not ( = ?auto_426919 ?auto_426924 ) ) ( not ( = ?auto_426919 ?auto_426925 ) ) ( not ( = ?auto_426919 ?auto_426926 ) ) ( not ( = ?auto_426919 ?auto_426927 ) ) ( not ( = ?auto_426919 ?auto_426928 ) ) ( not ( = ?auto_426919 ?auto_426929 ) ) ( not ( = ?auto_426919 ?auto_426930 ) ) ( not ( = ?auto_426920 ?auto_426921 ) ) ( not ( = ?auto_426920 ?auto_426922 ) ) ( not ( = ?auto_426920 ?auto_426923 ) ) ( not ( = ?auto_426920 ?auto_426924 ) ) ( not ( = ?auto_426920 ?auto_426925 ) ) ( not ( = ?auto_426920 ?auto_426926 ) ) ( not ( = ?auto_426920 ?auto_426927 ) ) ( not ( = ?auto_426920 ?auto_426928 ) ) ( not ( = ?auto_426920 ?auto_426929 ) ) ( not ( = ?auto_426920 ?auto_426930 ) ) ( not ( = ?auto_426921 ?auto_426922 ) ) ( not ( = ?auto_426921 ?auto_426923 ) ) ( not ( = ?auto_426921 ?auto_426924 ) ) ( not ( = ?auto_426921 ?auto_426925 ) ) ( not ( = ?auto_426921 ?auto_426926 ) ) ( not ( = ?auto_426921 ?auto_426927 ) ) ( not ( = ?auto_426921 ?auto_426928 ) ) ( not ( = ?auto_426921 ?auto_426929 ) ) ( not ( = ?auto_426921 ?auto_426930 ) ) ( not ( = ?auto_426922 ?auto_426923 ) ) ( not ( = ?auto_426922 ?auto_426924 ) ) ( not ( = ?auto_426922 ?auto_426925 ) ) ( not ( = ?auto_426922 ?auto_426926 ) ) ( not ( = ?auto_426922 ?auto_426927 ) ) ( not ( = ?auto_426922 ?auto_426928 ) ) ( not ( = ?auto_426922 ?auto_426929 ) ) ( not ( = ?auto_426922 ?auto_426930 ) ) ( not ( = ?auto_426923 ?auto_426924 ) ) ( not ( = ?auto_426923 ?auto_426925 ) ) ( not ( = ?auto_426923 ?auto_426926 ) ) ( not ( = ?auto_426923 ?auto_426927 ) ) ( not ( = ?auto_426923 ?auto_426928 ) ) ( not ( = ?auto_426923 ?auto_426929 ) ) ( not ( = ?auto_426923 ?auto_426930 ) ) ( not ( = ?auto_426924 ?auto_426925 ) ) ( not ( = ?auto_426924 ?auto_426926 ) ) ( not ( = ?auto_426924 ?auto_426927 ) ) ( not ( = ?auto_426924 ?auto_426928 ) ) ( not ( = ?auto_426924 ?auto_426929 ) ) ( not ( = ?auto_426924 ?auto_426930 ) ) ( not ( = ?auto_426925 ?auto_426926 ) ) ( not ( = ?auto_426925 ?auto_426927 ) ) ( not ( = ?auto_426925 ?auto_426928 ) ) ( not ( = ?auto_426925 ?auto_426929 ) ) ( not ( = ?auto_426925 ?auto_426930 ) ) ( not ( = ?auto_426926 ?auto_426927 ) ) ( not ( = ?auto_426926 ?auto_426928 ) ) ( not ( = ?auto_426926 ?auto_426929 ) ) ( not ( = ?auto_426926 ?auto_426930 ) ) ( not ( = ?auto_426927 ?auto_426928 ) ) ( not ( = ?auto_426927 ?auto_426929 ) ) ( not ( = ?auto_426927 ?auto_426930 ) ) ( not ( = ?auto_426928 ?auto_426929 ) ) ( not ( = ?auto_426928 ?auto_426930 ) ) ( not ( = ?auto_426929 ?auto_426930 ) ) ( ON ?auto_426928 ?auto_426929 ) ( ON ?auto_426927 ?auto_426928 ) ( ON ?auto_426926 ?auto_426927 ) ( CLEAR ?auto_426924 ) ( ON ?auto_426925 ?auto_426926 ) ( CLEAR ?auto_426925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_426916 ?auto_426917 ?auto_426918 ?auto_426919 ?auto_426920 ?auto_426921 ?auto_426922 ?auto_426923 ?auto_426924 ?auto_426925 )
      ( MAKE-14PILE ?auto_426916 ?auto_426917 ?auto_426918 ?auto_426919 ?auto_426920 ?auto_426921 ?auto_426922 ?auto_426923 ?auto_426924 ?auto_426925 ?auto_426926 ?auto_426927 ?auto_426928 ?auto_426929 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_426945 - BLOCK
      ?auto_426946 - BLOCK
      ?auto_426947 - BLOCK
      ?auto_426948 - BLOCK
      ?auto_426949 - BLOCK
      ?auto_426950 - BLOCK
      ?auto_426951 - BLOCK
      ?auto_426952 - BLOCK
      ?auto_426953 - BLOCK
      ?auto_426954 - BLOCK
      ?auto_426955 - BLOCK
      ?auto_426956 - BLOCK
      ?auto_426957 - BLOCK
      ?auto_426958 - BLOCK
    )
    :vars
    (
      ?auto_426959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426958 ?auto_426959 ) ( ON-TABLE ?auto_426945 ) ( ON ?auto_426946 ?auto_426945 ) ( ON ?auto_426947 ?auto_426946 ) ( ON ?auto_426948 ?auto_426947 ) ( ON ?auto_426949 ?auto_426948 ) ( ON ?auto_426950 ?auto_426949 ) ( ON ?auto_426951 ?auto_426950 ) ( ON ?auto_426952 ?auto_426951 ) ( ON ?auto_426953 ?auto_426952 ) ( not ( = ?auto_426945 ?auto_426946 ) ) ( not ( = ?auto_426945 ?auto_426947 ) ) ( not ( = ?auto_426945 ?auto_426948 ) ) ( not ( = ?auto_426945 ?auto_426949 ) ) ( not ( = ?auto_426945 ?auto_426950 ) ) ( not ( = ?auto_426945 ?auto_426951 ) ) ( not ( = ?auto_426945 ?auto_426952 ) ) ( not ( = ?auto_426945 ?auto_426953 ) ) ( not ( = ?auto_426945 ?auto_426954 ) ) ( not ( = ?auto_426945 ?auto_426955 ) ) ( not ( = ?auto_426945 ?auto_426956 ) ) ( not ( = ?auto_426945 ?auto_426957 ) ) ( not ( = ?auto_426945 ?auto_426958 ) ) ( not ( = ?auto_426945 ?auto_426959 ) ) ( not ( = ?auto_426946 ?auto_426947 ) ) ( not ( = ?auto_426946 ?auto_426948 ) ) ( not ( = ?auto_426946 ?auto_426949 ) ) ( not ( = ?auto_426946 ?auto_426950 ) ) ( not ( = ?auto_426946 ?auto_426951 ) ) ( not ( = ?auto_426946 ?auto_426952 ) ) ( not ( = ?auto_426946 ?auto_426953 ) ) ( not ( = ?auto_426946 ?auto_426954 ) ) ( not ( = ?auto_426946 ?auto_426955 ) ) ( not ( = ?auto_426946 ?auto_426956 ) ) ( not ( = ?auto_426946 ?auto_426957 ) ) ( not ( = ?auto_426946 ?auto_426958 ) ) ( not ( = ?auto_426946 ?auto_426959 ) ) ( not ( = ?auto_426947 ?auto_426948 ) ) ( not ( = ?auto_426947 ?auto_426949 ) ) ( not ( = ?auto_426947 ?auto_426950 ) ) ( not ( = ?auto_426947 ?auto_426951 ) ) ( not ( = ?auto_426947 ?auto_426952 ) ) ( not ( = ?auto_426947 ?auto_426953 ) ) ( not ( = ?auto_426947 ?auto_426954 ) ) ( not ( = ?auto_426947 ?auto_426955 ) ) ( not ( = ?auto_426947 ?auto_426956 ) ) ( not ( = ?auto_426947 ?auto_426957 ) ) ( not ( = ?auto_426947 ?auto_426958 ) ) ( not ( = ?auto_426947 ?auto_426959 ) ) ( not ( = ?auto_426948 ?auto_426949 ) ) ( not ( = ?auto_426948 ?auto_426950 ) ) ( not ( = ?auto_426948 ?auto_426951 ) ) ( not ( = ?auto_426948 ?auto_426952 ) ) ( not ( = ?auto_426948 ?auto_426953 ) ) ( not ( = ?auto_426948 ?auto_426954 ) ) ( not ( = ?auto_426948 ?auto_426955 ) ) ( not ( = ?auto_426948 ?auto_426956 ) ) ( not ( = ?auto_426948 ?auto_426957 ) ) ( not ( = ?auto_426948 ?auto_426958 ) ) ( not ( = ?auto_426948 ?auto_426959 ) ) ( not ( = ?auto_426949 ?auto_426950 ) ) ( not ( = ?auto_426949 ?auto_426951 ) ) ( not ( = ?auto_426949 ?auto_426952 ) ) ( not ( = ?auto_426949 ?auto_426953 ) ) ( not ( = ?auto_426949 ?auto_426954 ) ) ( not ( = ?auto_426949 ?auto_426955 ) ) ( not ( = ?auto_426949 ?auto_426956 ) ) ( not ( = ?auto_426949 ?auto_426957 ) ) ( not ( = ?auto_426949 ?auto_426958 ) ) ( not ( = ?auto_426949 ?auto_426959 ) ) ( not ( = ?auto_426950 ?auto_426951 ) ) ( not ( = ?auto_426950 ?auto_426952 ) ) ( not ( = ?auto_426950 ?auto_426953 ) ) ( not ( = ?auto_426950 ?auto_426954 ) ) ( not ( = ?auto_426950 ?auto_426955 ) ) ( not ( = ?auto_426950 ?auto_426956 ) ) ( not ( = ?auto_426950 ?auto_426957 ) ) ( not ( = ?auto_426950 ?auto_426958 ) ) ( not ( = ?auto_426950 ?auto_426959 ) ) ( not ( = ?auto_426951 ?auto_426952 ) ) ( not ( = ?auto_426951 ?auto_426953 ) ) ( not ( = ?auto_426951 ?auto_426954 ) ) ( not ( = ?auto_426951 ?auto_426955 ) ) ( not ( = ?auto_426951 ?auto_426956 ) ) ( not ( = ?auto_426951 ?auto_426957 ) ) ( not ( = ?auto_426951 ?auto_426958 ) ) ( not ( = ?auto_426951 ?auto_426959 ) ) ( not ( = ?auto_426952 ?auto_426953 ) ) ( not ( = ?auto_426952 ?auto_426954 ) ) ( not ( = ?auto_426952 ?auto_426955 ) ) ( not ( = ?auto_426952 ?auto_426956 ) ) ( not ( = ?auto_426952 ?auto_426957 ) ) ( not ( = ?auto_426952 ?auto_426958 ) ) ( not ( = ?auto_426952 ?auto_426959 ) ) ( not ( = ?auto_426953 ?auto_426954 ) ) ( not ( = ?auto_426953 ?auto_426955 ) ) ( not ( = ?auto_426953 ?auto_426956 ) ) ( not ( = ?auto_426953 ?auto_426957 ) ) ( not ( = ?auto_426953 ?auto_426958 ) ) ( not ( = ?auto_426953 ?auto_426959 ) ) ( not ( = ?auto_426954 ?auto_426955 ) ) ( not ( = ?auto_426954 ?auto_426956 ) ) ( not ( = ?auto_426954 ?auto_426957 ) ) ( not ( = ?auto_426954 ?auto_426958 ) ) ( not ( = ?auto_426954 ?auto_426959 ) ) ( not ( = ?auto_426955 ?auto_426956 ) ) ( not ( = ?auto_426955 ?auto_426957 ) ) ( not ( = ?auto_426955 ?auto_426958 ) ) ( not ( = ?auto_426955 ?auto_426959 ) ) ( not ( = ?auto_426956 ?auto_426957 ) ) ( not ( = ?auto_426956 ?auto_426958 ) ) ( not ( = ?auto_426956 ?auto_426959 ) ) ( not ( = ?auto_426957 ?auto_426958 ) ) ( not ( = ?auto_426957 ?auto_426959 ) ) ( not ( = ?auto_426958 ?auto_426959 ) ) ( ON ?auto_426957 ?auto_426958 ) ( ON ?auto_426956 ?auto_426957 ) ( ON ?auto_426955 ?auto_426956 ) ( CLEAR ?auto_426953 ) ( ON ?auto_426954 ?auto_426955 ) ( CLEAR ?auto_426954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_426945 ?auto_426946 ?auto_426947 ?auto_426948 ?auto_426949 ?auto_426950 ?auto_426951 ?auto_426952 ?auto_426953 ?auto_426954 )
      ( MAKE-14PILE ?auto_426945 ?auto_426946 ?auto_426947 ?auto_426948 ?auto_426949 ?auto_426950 ?auto_426951 ?auto_426952 ?auto_426953 ?auto_426954 ?auto_426955 ?auto_426956 ?auto_426957 ?auto_426958 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_426974 - BLOCK
      ?auto_426975 - BLOCK
      ?auto_426976 - BLOCK
      ?auto_426977 - BLOCK
      ?auto_426978 - BLOCK
      ?auto_426979 - BLOCK
      ?auto_426980 - BLOCK
      ?auto_426981 - BLOCK
      ?auto_426982 - BLOCK
      ?auto_426983 - BLOCK
      ?auto_426984 - BLOCK
      ?auto_426985 - BLOCK
      ?auto_426986 - BLOCK
      ?auto_426987 - BLOCK
    )
    :vars
    (
      ?auto_426988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_426987 ?auto_426988 ) ( ON-TABLE ?auto_426974 ) ( ON ?auto_426975 ?auto_426974 ) ( ON ?auto_426976 ?auto_426975 ) ( ON ?auto_426977 ?auto_426976 ) ( ON ?auto_426978 ?auto_426977 ) ( ON ?auto_426979 ?auto_426978 ) ( ON ?auto_426980 ?auto_426979 ) ( ON ?auto_426981 ?auto_426980 ) ( not ( = ?auto_426974 ?auto_426975 ) ) ( not ( = ?auto_426974 ?auto_426976 ) ) ( not ( = ?auto_426974 ?auto_426977 ) ) ( not ( = ?auto_426974 ?auto_426978 ) ) ( not ( = ?auto_426974 ?auto_426979 ) ) ( not ( = ?auto_426974 ?auto_426980 ) ) ( not ( = ?auto_426974 ?auto_426981 ) ) ( not ( = ?auto_426974 ?auto_426982 ) ) ( not ( = ?auto_426974 ?auto_426983 ) ) ( not ( = ?auto_426974 ?auto_426984 ) ) ( not ( = ?auto_426974 ?auto_426985 ) ) ( not ( = ?auto_426974 ?auto_426986 ) ) ( not ( = ?auto_426974 ?auto_426987 ) ) ( not ( = ?auto_426974 ?auto_426988 ) ) ( not ( = ?auto_426975 ?auto_426976 ) ) ( not ( = ?auto_426975 ?auto_426977 ) ) ( not ( = ?auto_426975 ?auto_426978 ) ) ( not ( = ?auto_426975 ?auto_426979 ) ) ( not ( = ?auto_426975 ?auto_426980 ) ) ( not ( = ?auto_426975 ?auto_426981 ) ) ( not ( = ?auto_426975 ?auto_426982 ) ) ( not ( = ?auto_426975 ?auto_426983 ) ) ( not ( = ?auto_426975 ?auto_426984 ) ) ( not ( = ?auto_426975 ?auto_426985 ) ) ( not ( = ?auto_426975 ?auto_426986 ) ) ( not ( = ?auto_426975 ?auto_426987 ) ) ( not ( = ?auto_426975 ?auto_426988 ) ) ( not ( = ?auto_426976 ?auto_426977 ) ) ( not ( = ?auto_426976 ?auto_426978 ) ) ( not ( = ?auto_426976 ?auto_426979 ) ) ( not ( = ?auto_426976 ?auto_426980 ) ) ( not ( = ?auto_426976 ?auto_426981 ) ) ( not ( = ?auto_426976 ?auto_426982 ) ) ( not ( = ?auto_426976 ?auto_426983 ) ) ( not ( = ?auto_426976 ?auto_426984 ) ) ( not ( = ?auto_426976 ?auto_426985 ) ) ( not ( = ?auto_426976 ?auto_426986 ) ) ( not ( = ?auto_426976 ?auto_426987 ) ) ( not ( = ?auto_426976 ?auto_426988 ) ) ( not ( = ?auto_426977 ?auto_426978 ) ) ( not ( = ?auto_426977 ?auto_426979 ) ) ( not ( = ?auto_426977 ?auto_426980 ) ) ( not ( = ?auto_426977 ?auto_426981 ) ) ( not ( = ?auto_426977 ?auto_426982 ) ) ( not ( = ?auto_426977 ?auto_426983 ) ) ( not ( = ?auto_426977 ?auto_426984 ) ) ( not ( = ?auto_426977 ?auto_426985 ) ) ( not ( = ?auto_426977 ?auto_426986 ) ) ( not ( = ?auto_426977 ?auto_426987 ) ) ( not ( = ?auto_426977 ?auto_426988 ) ) ( not ( = ?auto_426978 ?auto_426979 ) ) ( not ( = ?auto_426978 ?auto_426980 ) ) ( not ( = ?auto_426978 ?auto_426981 ) ) ( not ( = ?auto_426978 ?auto_426982 ) ) ( not ( = ?auto_426978 ?auto_426983 ) ) ( not ( = ?auto_426978 ?auto_426984 ) ) ( not ( = ?auto_426978 ?auto_426985 ) ) ( not ( = ?auto_426978 ?auto_426986 ) ) ( not ( = ?auto_426978 ?auto_426987 ) ) ( not ( = ?auto_426978 ?auto_426988 ) ) ( not ( = ?auto_426979 ?auto_426980 ) ) ( not ( = ?auto_426979 ?auto_426981 ) ) ( not ( = ?auto_426979 ?auto_426982 ) ) ( not ( = ?auto_426979 ?auto_426983 ) ) ( not ( = ?auto_426979 ?auto_426984 ) ) ( not ( = ?auto_426979 ?auto_426985 ) ) ( not ( = ?auto_426979 ?auto_426986 ) ) ( not ( = ?auto_426979 ?auto_426987 ) ) ( not ( = ?auto_426979 ?auto_426988 ) ) ( not ( = ?auto_426980 ?auto_426981 ) ) ( not ( = ?auto_426980 ?auto_426982 ) ) ( not ( = ?auto_426980 ?auto_426983 ) ) ( not ( = ?auto_426980 ?auto_426984 ) ) ( not ( = ?auto_426980 ?auto_426985 ) ) ( not ( = ?auto_426980 ?auto_426986 ) ) ( not ( = ?auto_426980 ?auto_426987 ) ) ( not ( = ?auto_426980 ?auto_426988 ) ) ( not ( = ?auto_426981 ?auto_426982 ) ) ( not ( = ?auto_426981 ?auto_426983 ) ) ( not ( = ?auto_426981 ?auto_426984 ) ) ( not ( = ?auto_426981 ?auto_426985 ) ) ( not ( = ?auto_426981 ?auto_426986 ) ) ( not ( = ?auto_426981 ?auto_426987 ) ) ( not ( = ?auto_426981 ?auto_426988 ) ) ( not ( = ?auto_426982 ?auto_426983 ) ) ( not ( = ?auto_426982 ?auto_426984 ) ) ( not ( = ?auto_426982 ?auto_426985 ) ) ( not ( = ?auto_426982 ?auto_426986 ) ) ( not ( = ?auto_426982 ?auto_426987 ) ) ( not ( = ?auto_426982 ?auto_426988 ) ) ( not ( = ?auto_426983 ?auto_426984 ) ) ( not ( = ?auto_426983 ?auto_426985 ) ) ( not ( = ?auto_426983 ?auto_426986 ) ) ( not ( = ?auto_426983 ?auto_426987 ) ) ( not ( = ?auto_426983 ?auto_426988 ) ) ( not ( = ?auto_426984 ?auto_426985 ) ) ( not ( = ?auto_426984 ?auto_426986 ) ) ( not ( = ?auto_426984 ?auto_426987 ) ) ( not ( = ?auto_426984 ?auto_426988 ) ) ( not ( = ?auto_426985 ?auto_426986 ) ) ( not ( = ?auto_426985 ?auto_426987 ) ) ( not ( = ?auto_426985 ?auto_426988 ) ) ( not ( = ?auto_426986 ?auto_426987 ) ) ( not ( = ?auto_426986 ?auto_426988 ) ) ( not ( = ?auto_426987 ?auto_426988 ) ) ( ON ?auto_426986 ?auto_426987 ) ( ON ?auto_426985 ?auto_426986 ) ( ON ?auto_426984 ?auto_426985 ) ( ON ?auto_426983 ?auto_426984 ) ( CLEAR ?auto_426981 ) ( ON ?auto_426982 ?auto_426983 ) ( CLEAR ?auto_426982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_426974 ?auto_426975 ?auto_426976 ?auto_426977 ?auto_426978 ?auto_426979 ?auto_426980 ?auto_426981 ?auto_426982 )
      ( MAKE-14PILE ?auto_426974 ?auto_426975 ?auto_426976 ?auto_426977 ?auto_426978 ?auto_426979 ?auto_426980 ?auto_426981 ?auto_426982 ?auto_426983 ?auto_426984 ?auto_426985 ?auto_426986 ?auto_426987 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_427003 - BLOCK
      ?auto_427004 - BLOCK
      ?auto_427005 - BLOCK
      ?auto_427006 - BLOCK
      ?auto_427007 - BLOCK
      ?auto_427008 - BLOCK
      ?auto_427009 - BLOCK
      ?auto_427010 - BLOCK
      ?auto_427011 - BLOCK
      ?auto_427012 - BLOCK
      ?auto_427013 - BLOCK
      ?auto_427014 - BLOCK
      ?auto_427015 - BLOCK
      ?auto_427016 - BLOCK
    )
    :vars
    (
      ?auto_427017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_427016 ?auto_427017 ) ( ON-TABLE ?auto_427003 ) ( ON ?auto_427004 ?auto_427003 ) ( ON ?auto_427005 ?auto_427004 ) ( ON ?auto_427006 ?auto_427005 ) ( ON ?auto_427007 ?auto_427006 ) ( ON ?auto_427008 ?auto_427007 ) ( ON ?auto_427009 ?auto_427008 ) ( ON ?auto_427010 ?auto_427009 ) ( not ( = ?auto_427003 ?auto_427004 ) ) ( not ( = ?auto_427003 ?auto_427005 ) ) ( not ( = ?auto_427003 ?auto_427006 ) ) ( not ( = ?auto_427003 ?auto_427007 ) ) ( not ( = ?auto_427003 ?auto_427008 ) ) ( not ( = ?auto_427003 ?auto_427009 ) ) ( not ( = ?auto_427003 ?auto_427010 ) ) ( not ( = ?auto_427003 ?auto_427011 ) ) ( not ( = ?auto_427003 ?auto_427012 ) ) ( not ( = ?auto_427003 ?auto_427013 ) ) ( not ( = ?auto_427003 ?auto_427014 ) ) ( not ( = ?auto_427003 ?auto_427015 ) ) ( not ( = ?auto_427003 ?auto_427016 ) ) ( not ( = ?auto_427003 ?auto_427017 ) ) ( not ( = ?auto_427004 ?auto_427005 ) ) ( not ( = ?auto_427004 ?auto_427006 ) ) ( not ( = ?auto_427004 ?auto_427007 ) ) ( not ( = ?auto_427004 ?auto_427008 ) ) ( not ( = ?auto_427004 ?auto_427009 ) ) ( not ( = ?auto_427004 ?auto_427010 ) ) ( not ( = ?auto_427004 ?auto_427011 ) ) ( not ( = ?auto_427004 ?auto_427012 ) ) ( not ( = ?auto_427004 ?auto_427013 ) ) ( not ( = ?auto_427004 ?auto_427014 ) ) ( not ( = ?auto_427004 ?auto_427015 ) ) ( not ( = ?auto_427004 ?auto_427016 ) ) ( not ( = ?auto_427004 ?auto_427017 ) ) ( not ( = ?auto_427005 ?auto_427006 ) ) ( not ( = ?auto_427005 ?auto_427007 ) ) ( not ( = ?auto_427005 ?auto_427008 ) ) ( not ( = ?auto_427005 ?auto_427009 ) ) ( not ( = ?auto_427005 ?auto_427010 ) ) ( not ( = ?auto_427005 ?auto_427011 ) ) ( not ( = ?auto_427005 ?auto_427012 ) ) ( not ( = ?auto_427005 ?auto_427013 ) ) ( not ( = ?auto_427005 ?auto_427014 ) ) ( not ( = ?auto_427005 ?auto_427015 ) ) ( not ( = ?auto_427005 ?auto_427016 ) ) ( not ( = ?auto_427005 ?auto_427017 ) ) ( not ( = ?auto_427006 ?auto_427007 ) ) ( not ( = ?auto_427006 ?auto_427008 ) ) ( not ( = ?auto_427006 ?auto_427009 ) ) ( not ( = ?auto_427006 ?auto_427010 ) ) ( not ( = ?auto_427006 ?auto_427011 ) ) ( not ( = ?auto_427006 ?auto_427012 ) ) ( not ( = ?auto_427006 ?auto_427013 ) ) ( not ( = ?auto_427006 ?auto_427014 ) ) ( not ( = ?auto_427006 ?auto_427015 ) ) ( not ( = ?auto_427006 ?auto_427016 ) ) ( not ( = ?auto_427006 ?auto_427017 ) ) ( not ( = ?auto_427007 ?auto_427008 ) ) ( not ( = ?auto_427007 ?auto_427009 ) ) ( not ( = ?auto_427007 ?auto_427010 ) ) ( not ( = ?auto_427007 ?auto_427011 ) ) ( not ( = ?auto_427007 ?auto_427012 ) ) ( not ( = ?auto_427007 ?auto_427013 ) ) ( not ( = ?auto_427007 ?auto_427014 ) ) ( not ( = ?auto_427007 ?auto_427015 ) ) ( not ( = ?auto_427007 ?auto_427016 ) ) ( not ( = ?auto_427007 ?auto_427017 ) ) ( not ( = ?auto_427008 ?auto_427009 ) ) ( not ( = ?auto_427008 ?auto_427010 ) ) ( not ( = ?auto_427008 ?auto_427011 ) ) ( not ( = ?auto_427008 ?auto_427012 ) ) ( not ( = ?auto_427008 ?auto_427013 ) ) ( not ( = ?auto_427008 ?auto_427014 ) ) ( not ( = ?auto_427008 ?auto_427015 ) ) ( not ( = ?auto_427008 ?auto_427016 ) ) ( not ( = ?auto_427008 ?auto_427017 ) ) ( not ( = ?auto_427009 ?auto_427010 ) ) ( not ( = ?auto_427009 ?auto_427011 ) ) ( not ( = ?auto_427009 ?auto_427012 ) ) ( not ( = ?auto_427009 ?auto_427013 ) ) ( not ( = ?auto_427009 ?auto_427014 ) ) ( not ( = ?auto_427009 ?auto_427015 ) ) ( not ( = ?auto_427009 ?auto_427016 ) ) ( not ( = ?auto_427009 ?auto_427017 ) ) ( not ( = ?auto_427010 ?auto_427011 ) ) ( not ( = ?auto_427010 ?auto_427012 ) ) ( not ( = ?auto_427010 ?auto_427013 ) ) ( not ( = ?auto_427010 ?auto_427014 ) ) ( not ( = ?auto_427010 ?auto_427015 ) ) ( not ( = ?auto_427010 ?auto_427016 ) ) ( not ( = ?auto_427010 ?auto_427017 ) ) ( not ( = ?auto_427011 ?auto_427012 ) ) ( not ( = ?auto_427011 ?auto_427013 ) ) ( not ( = ?auto_427011 ?auto_427014 ) ) ( not ( = ?auto_427011 ?auto_427015 ) ) ( not ( = ?auto_427011 ?auto_427016 ) ) ( not ( = ?auto_427011 ?auto_427017 ) ) ( not ( = ?auto_427012 ?auto_427013 ) ) ( not ( = ?auto_427012 ?auto_427014 ) ) ( not ( = ?auto_427012 ?auto_427015 ) ) ( not ( = ?auto_427012 ?auto_427016 ) ) ( not ( = ?auto_427012 ?auto_427017 ) ) ( not ( = ?auto_427013 ?auto_427014 ) ) ( not ( = ?auto_427013 ?auto_427015 ) ) ( not ( = ?auto_427013 ?auto_427016 ) ) ( not ( = ?auto_427013 ?auto_427017 ) ) ( not ( = ?auto_427014 ?auto_427015 ) ) ( not ( = ?auto_427014 ?auto_427016 ) ) ( not ( = ?auto_427014 ?auto_427017 ) ) ( not ( = ?auto_427015 ?auto_427016 ) ) ( not ( = ?auto_427015 ?auto_427017 ) ) ( not ( = ?auto_427016 ?auto_427017 ) ) ( ON ?auto_427015 ?auto_427016 ) ( ON ?auto_427014 ?auto_427015 ) ( ON ?auto_427013 ?auto_427014 ) ( ON ?auto_427012 ?auto_427013 ) ( CLEAR ?auto_427010 ) ( ON ?auto_427011 ?auto_427012 ) ( CLEAR ?auto_427011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_427003 ?auto_427004 ?auto_427005 ?auto_427006 ?auto_427007 ?auto_427008 ?auto_427009 ?auto_427010 ?auto_427011 )
      ( MAKE-14PILE ?auto_427003 ?auto_427004 ?auto_427005 ?auto_427006 ?auto_427007 ?auto_427008 ?auto_427009 ?auto_427010 ?auto_427011 ?auto_427012 ?auto_427013 ?auto_427014 ?auto_427015 ?auto_427016 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_427032 - BLOCK
      ?auto_427033 - BLOCK
      ?auto_427034 - BLOCK
      ?auto_427035 - BLOCK
      ?auto_427036 - BLOCK
      ?auto_427037 - BLOCK
      ?auto_427038 - BLOCK
      ?auto_427039 - BLOCK
      ?auto_427040 - BLOCK
      ?auto_427041 - BLOCK
      ?auto_427042 - BLOCK
      ?auto_427043 - BLOCK
      ?auto_427044 - BLOCK
      ?auto_427045 - BLOCK
    )
    :vars
    (
      ?auto_427046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_427045 ?auto_427046 ) ( ON-TABLE ?auto_427032 ) ( ON ?auto_427033 ?auto_427032 ) ( ON ?auto_427034 ?auto_427033 ) ( ON ?auto_427035 ?auto_427034 ) ( ON ?auto_427036 ?auto_427035 ) ( ON ?auto_427037 ?auto_427036 ) ( ON ?auto_427038 ?auto_427037 ) ( not ( = ?auto_427032 ?auto_427033 ) ) ( not ( = ?auto_427032 ?auto_427034 ) ) ( not ( = ?auto_427032 ?auto_427035 ) ) ( not ( = ?auto_427032 ?auto_427036 ) ) ( not ( = ?auto_427032 ?auto_427037 ) ) ( not ( = ?auto_427032 ?auto_427038 ) ) ( not ( = ?auto_427032 ?auto_427039 ) ) ( not ( = ?auto_427032 ?auto_427040 ) ) ( not ( = ?auto_427032 ?auto_427041 ) ) ( not ( = ?auto_427032 ?auto_427042 ) ) ( not ( = ?auto_427032 ?auto_427043 ) ) ( not ( = ?auto_427032 ?auto_427044 ) ) ( not ( = ?auto_427032 ?auto_427045 ) ) ( not ( = ?auto_427032 ?auto_427046 ) ) ( not ( = ?auto_427033 ?auto_427034 ) ) ( not ( = ?auto_427033 ?auto_427035 ) ) ( not ( = ?auto_427033 ?auto_427036 ) ) ( not ( = ?auto_427033 ?auto_427037 ) ) ( not ( = ?auto_427033 ?auto_427038 ) ) ( not ( = ?auto_427033 ?auto_427039 ) ) ( not ( = ?auto_427033 ?auto_427040 ) ) ( not ( = ?auto_427033 ?auto_427041 ) ) ( not ( = ?auto_427033 ?auto_427042 ) ) ( not ( = ?auto_427033 ?auto_427043 ) ) ( not ( = ?auto_427033 ?auto_427044 ) ) ( not ( = ?auto_427033 ?auto_427045 ) ) ( not ( = ?auto_427033 ?auto_427046 ) ) ( not ( = ?auto_427034 ?auto_427035 ) ) ( not ( = ?auto_427034 ?auto_427036 ) ) ( not ( = ?auto_427034 ?auto_427037 ) ) ( not ( = ?auto_427034 ?auto_427038 ) ) ( not ( = ?auto_427034 ?auto_427039 ) ) ( not ( = ?auto_427034 ?auto_427040 ) ) ( not ( = ?auto_427034 ?auto_427041 ) ) ( not ( = ?auto_427034 ?auto_427042 ) ) ( not ( = ?auto_427034 ?auto_427043 ) ) ( not ( = ?auto_427034 ?auto_427044 ) ) ( not ( = ?auto_427034 ?auto_427045 ) ) ( not ( = ?auto_427034 ?auto_427046 ) ) ( not ( = ?auto_427035 ?auto_427036 ) ) ( not ( = ?auto_427035 ?auto_427037 ) ) ( not ( = ?auto_427035 ?auto_427038 ) ) ( not ( = ?auto_427035 ?auto_427039 ) ) ( not ( = ?auto_427035 ?auto_427040 ) ) ( not ( = ?auto_427035 ?auto_427041 ) ) ( not ( = ?auto_427035 ?auto_427042 ) ) ( not ( = ?auto_427035 ?auto_427043 ) ) ( not ( = ?auto_427035 ?auto_427044 ) ) ( not ( = ?auto_427035 ?auto_427045 ) ) ( not ( = ?auto_427035 ?auto_427046 ) ) ( not ( = ?auto_427036 ?auto_427037 ) ) ( not ( = ?auto_427036 ?auto_427038 ) ) ( not ( = ?auto_427036 ?auto_427039 ) ) ( not ( = ?auto_427036 ?auto_427040 ) ) ( not ( = ?auto_427036 ?auto_427041 ) ) ( not ( = ?auto_427036 ?auto_427042 ) ) ( not ( = ?auto_427036 ?auto_427043 ) ) ( not ( = ?auto_427036 ?auto_427044 ) ) ( not ( = ?auto_427036 ?auto_427045 ) ) ( not ( = ?auto_427036 ?auto_427046 ) ) ( not ( = ?auto_427037 ?auto_427038 ) ) ( not ( = ?auto_427037 ?auto_427039 ) ) ( not ( = ?auto_427037 ?auto_427040 ) ) ( not ( = ?auto_427037 ?auto_427041 ) ) ( not ( = ?auto_427037 ?auto_427042 ) ) ( not ( = ?auto_427037 ?auto_427043 ) ) ( not ( = ?auto_427037 ?auto_427044 ) ) ( not ( = ?auto_427037 ?auto_427045 ) ) ( not ( = ?auto_427037 ?auto_427046 ) ) ( not ( = ?auto_427038 ?auto_427039 ) ) ( not ( = ?auto_427038 ?auto_427040 ) ) ( not ( = ?auto_427038 ?auto_427041 ) ) ( not ( = ?auto_427038 ?auto_427042 ) ) ( not ( = ?auto_427038 ?auto_427043 ) ) ( not ( = ?auto_427038 ?auto_427044 ) ) ( not ( = ?auto_427038 ?auto_427045 ) ) ( not ( = ?auto_427038 ?auto_427046 ) ) ( not ( = ?auto_427039 ?auto_427040 ) ) ( not ( = ?auto_427039 ?auto_427041 ) ) ( not ( = ?auto_427039 ?auto_427042 ) ) ( not ( = ?auto_427039 ?auto_427043 ) ) ( not ( = ?auto_427039 ?auto_427044 ) ) ( not ( = ?auto_427039 ?auto_427045 ) ) ( not ( = ?auto_427039 ?auto_427046 ) ) ( not ( = ?auto_427040 ?auto_427041 ) ) ( not ( = ?auto_427040 ?auto_427042 ) ) ( not ( = ?auto_427040 ?auto_427043 ) ) ( not ( = ?auto_427040 ?auto_427044 ) ) ( not ( = ?auto_427040 ?auto_427045 ) ) ( not ( = ?auto_427040 ?auto_427046 ) ) ( not ( = ?auto_427041 ?auto_427042 ) ) ( not ( = ?auto_427041 ?auto_427043 ) ) ( not ( = ?auto_427041 ?auto_427044 ) ) ( not ( = ?auto_427041 ?auto_427045 ) ) ( not ( = ?auto_427041 ?auto_427046 ) ) ( not ( = ?auto_427042 ?auto_427043 ) ) ( not ( = ?auto_427042 ?auto_427044 ) ) ( not ( = ?auto_427042 ?auto_427045 ) ) ( not ( = ?auto_427042 ?auto_427046 ) ) ( not ( = ?auto_427043 ?auto_427044 ) ) ( not ( = ?auto_427043 ?auto_427045 ) ) ( not ( = ?auto_427043 ?auto_427046 ) ) ( not ( = ?auto_427044 ?auto_427045 ) ) ( not ( = ?auto_427044 ?auto_427046 ) ) ( not ( = ?auto_427045 ?auto_427046 ) ) ( ON ?auto_427044 ?auto_427045 ) ( ON ?auto_427043 ?auto_427044 ) ( ON ?auto_427042 ?auto_427043 ) ( ON ?auto_427041 ?auto_427042 ) ( ON ?auto_427040 ?auto_427041 ) ( CLEAR ?auto_427038 ) ( ON ?auto_427039 ?auto_427040 ) ( CLEAR ?auto_427039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_427032 ?auto_427033 ?auto_427034 ?auto_427035 ?auto_427036 ?auto_427037 ?auto_427038 ?auto_427039 )
      ( MAKE-14PILE ?auto_427032 ?auto_427033 ?auto_427034 ?auto_427035 ?auto_427036 ?auto_427037 ?auto_427038 ?auto_427039 ?auto_427040 ?auto_427041 ?auto_427042 ?auto_427043 ?auto_427044 ?auto_427045 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_427061 - BLOCK
      ?auto_427062 - BLOCK
      ?auto_427063 - BLOCK
      ?auto_427064 - BLOCK
      ?auto_427065 - BLOCK
      ?auto_427066 - BLOCK
      ?auto_427067 - BLOCK
      ?auto_427068 - BLOCK
      ?auto_427069 - BLOCK
      ?auto_427070 - BLOCK
      ?auto_427071 - BLOCK
      ?auto_427072 - BLOCK
      ?auto_427073 - BLOCK
      ?auto_427074 - BLOCK
    )
    :vars
    (
      ?auto_427075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_427074 ?auto_427075 ) ( ON-TABLE ?auto_427061 ) ( ON ?auto_427062 ?auto_427061 ) ( ON ?auto_427063 ?auto_427062 ) ( ON ?auto_427064 ?auto_427063 ) ( ON ?auto_427065 ?auto_427064 ) ( ON ?auto_427066 ?auto_427065 ) ( ON ?auto_427067 ?auto_427066 ) ( not ( = ?auto_427061 ?auto_427062 ) ) ( not ( = ?auto_427061 ?auto_427063 ) ) ( not ( = ?auto_427061 ?auto_427064 ) ) ( not ( = ?auto_427061 ?auto_427065 ) ) ( not ( = ?auto_427061 ?auto_427066 ) ) ( not ( = ?auto_427061 ?auto_427067 ) ) ( not ( = ?auto_427061 ?auto_427068 ) ) ( not ( = ?auto_427061 ?auto_427069 ) ) ( not ( = ?auto_427061 ?auto_427070 ) ) ( not ( = ?auto_427061 ?auto_427071 ) ) ( not ( = ?auto_427061 ?auto_427072 ) ) ( not ( = ?auto_427061 ?auto_427073 ) ) ( not ( = ?auto_427061 ?auto_427074 ) ) ( not ( = ?auto_427061 ?auto_427075 ) ) ( not ( = ?auto_427062 ?auto_427063 ) ) ( not ( = ?auto_427062 ?auto_427064 ) ) ( not ( = ?auto_427062 ?auto_427065 ) ) ( not ( = ?auto_427062 ?auto_427066 ) ) ( not ( = ?auto_427062 ?auto_427067 ) ) ( not ( = ?auto_427062 ?auto_427068 ) ) ( not ( = ?auto_427062 ?auto_427069 ) ) ( not ( = ?auto_427062 ?auto_427070 ) ) ( not ( = ?auto_427062 ?auto_427071 ) ) ( not ( = ?auto_427062 ?auto_427072 ) ) ( not ( = ?auto_427062 ?auto_427073 ) ) ( not ( = ?auto_427062 ?auto_427074 ) ) ( not ( = ?auto_427062 ?auto_427075 ) ) ( not ( = ?auto_427063 ?auto_427064 ) ) ( not ( = ?auto_427063 ?auto_427065 ) ) ( not ( = ?auto_427063 ?auto_427066 ) ) ( not ( = ?auto_427063 ?auto_427067 ) ) ( not ( = ?auto_427063 ?auto_427068 ) ) ( not ( = ?auto_427063 ?auto_427069 ) ) ( not ( = ?auto_427063 ?auto_427070 ) ) ( not ( = ?auto_427063 ?auto_427071 ) ) ( not ( = ?auto_427063 ?auto_427072 ) ) ( not ( = ?auto_427063 ?auto_427073 ) ) ( not ( = ?auto_427063 ?auto_427074 ) ) ( not ( = ?auto_427063 ?auto_427075 ) ) ( not ( = ?auto_427064 ?auto_427065 ) ) ( not ( = ?auto_427064 ?auto_427066 ) ) ( not ( = ?auto_427064 ?auto_427067 ) ) ( not ( = ?auto_427064 ?auto_427068 ) ) ( not ( = ?auto_427064 ?auto_427069 ) ) ( not ( = ?auto_427064 ?auto_427070 ) ) ( not ( = ?auto_427064 ?auto_427071 ) ) ( not ( = ?auto_427064 ?auto_427072 ) ) ( not ( = ?auto_427064 ?auto_427073 ) ) ( not ( = ?auto_427064 ?auto_427074 ) ) ( not ( = ?auto_427064 ?auto_427075 ) ) ( not ( = ?auto_427065 ?auto_427066 ) ) ( not ( = ?auto_427065 ?auto_427067 ) ) ( not ( = ?auto_427065 ?auto_427068 ) ) ( not ( = ?auto_427065 ?auto_427069 ) ) ( not ( = ?auto_427065 ?auto_427070 ) ) ( not ( = ?auto_427065 ?auto_427071 ) ) ( not ( = ?auto_427065 ?auto_427072 ) ) ( not ( = ?auto_427065 ?auto_427073 ) ) ( not ( = ?auto_427065 ?auto_427074 ) ) ( not ( = ?auto_427065 ?auto_427075 ) ) ( not ( = ?auto_427066 ?auto_427067 ) ) ( not ( = ?auto_427066 ?auto_427068 ) ) ( not ( = ?auto_427066 ?auto_427069 ) ) ( not ( = ?auto_427066 ?auto_427070 ) ) ( not ( = ?auto_427066 ?auto_427071 ) ) ( not ( = ?auto_427066 ?auto_427072 ) ) ( not ( = ?auto_427066 ?auto_427073 ) ) ( not ( = ?auto_427066 ?auto_427074 ) ) ( not ( = ?auto_427066 ?auto_427075 ) ) ( not ( = ?auto_427067 ?auto_427068 ) ) ( not ( = ?auto_427067 ?auto_427069 ) ) ( not ( = ?auto_427067 ?auto_427070 ) ) ( not ( = ?auto_427067 ?auto_427071 ) ) ( not ( = ?auto_427067 ?auto_427072 ) ) ( not ( = ?auto_427067 ?auto_427073 ) ) ( not ( = ?auto_427067 ?auto_427074 ) ) ( not ( = ?auto_427067 ?auto_427075 ) ) ( not ( = ?auto_427068 ?auto_427069 ) ) ( not ( = ?auto_427068 ?auto_427070 ) ) ( not ( = ?auto_427068 ?auto_427071 ) ) ( not ( = ?auto_427068 ?auto_427072 ) ) ( not ( = ?auto_427068 ?auto_427073 ) ) ( not ( = ?auto_427068 ?auto_427074 ) ) ( not ( = ?auto_427068 ?auto_427075 ) ) ( not ( = ?auto_427069 ?auto_427070 ) ) ( not ( = ?auto_427069 ?auto_427071 ) ) ( not ( = ?auto_427069 ?auto_427072 ) ) ( not ( = ?auto_427069 ?auto_427073 ) ) ( not ( = ?auto_427069 ?auto_427074 ) ) ( not ( = ?auto_427069 ?auto_427075 ) ) ( not ( = ?auto_427070 ?auto_427071 ) ) ( not ( = ?auto_427070 ?auto_427072 ) ) ( not ( = ?auto_427070 ?auto_427073 ) ) ( not ( = ?auto_427070 ?auto_427074 ) ) ( not ( = ?auto_427070 ?auto_427075 ) ) ( not ( = ?auto_427071 ?auto_427072 ) ) ( not ( = ?auto_427071 ?auto_427073 ) ) ( not ( = ?auto_427071 ?auto_427074 ) ) ( not ( = ?auto_427071 ?auto_427075 ) ) ( not ( = ?auto_427072 ?auto_427073 ) ) ( not ( = ?auto_427072 ?auto_427074 ) ) ( not ( = ?auto_427072 ?auto_427075 ) ) ( not ( = ?auto_427073 ?auto_427074 ) ) ( not ( = ?auto_427073 ?auto_427075 ) ) ( not ( = ?auto_427074 ?auto_427075 ) ) ( ON ?auto_427073 ?auto_427074 ) ( ON ?auto_427072 ?auto_427073 ) ( ON ?auto_427071 ?auto_427072 ) ( ON ?auto_427070 ?auto_427071 ) ( ON ?auto_427069 ?auto_427070 ) ( CLEAR ?auto_427067 ) ( ON ?auto_427068 ?auto_427069 ) ( CLEAR ?auto_427068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_427061 ?auto_427062 ?auto_427063 ?auto_427064 ?auto_427065 ?auto_427066 ?auto_427067 ?auto_427068 )
      ( MAKE-14PILE ?auto_427061 ?auto_427062 ?auto_427063 ?auto_427064 ?auto_427065 ?auto_427066 ?auto_427067 ?auto_427068 ?auto_427069 ?auto_427070 ?auto_427071 ?auto_427072 ?auto_427073 ?auto_427074 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_427090 - BLOCK
      ?auto_427091 - BLOCK
      ?auto_427092 - BLOCK
      ?auto_427093 - BLOCK
      ?auto_427094 - BLOCK
      ?auto_427095 - BLOCK
      ?auto_427096 - BLOCK
      ?auto_427097 - BLOCK
      ?auto_427098 - BLOCK
      ?auto_427099 - BLOCK
      ?auto_427100 - BLOCK
      ?auto_427101 - BLOCK
      ?auto_427102 - BLOCK
      ?auto_427103 - BLOCK
    )
    :vars
    (
      ?auto_427104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_427103 ?auto_427104 ) ( ON-TABLE ?auto_427090 ) ( ON ?auto_427091 ?auto_427090 ) ( ON ?auto_427092 ?auto_427091 ) ( ON ?auto_427093 ?auto_427092 ) ( ON ?auto_427094 ?auto_427093 ) ( ON ?auto_427095 ?auto_427094 ) ( not ( = ?auto_427090 ?auto_427091 ) ) ( not ( = ?auto_427090 ?auto_427092 ) ) ( not ( = ?auto_427090 ?auto_427093 ) ) ( not ( = ?auto_427090 ?auto_427094 ) ) ( not ( = ?auto_427090 ?auto_427095 ) ) ( not ( = ?auto_427090 ?auto_427096 ) ) ( not ( = ?auto_427090 ?auto_427097 ) ) ( not ( = ?auto_427090 ?auto_427098 ) ) ( not ( = ?auto_427090 ?auto_427099 ) ) ( not ( = ?auto_427090 ?auto_427100 ) ) ( not ( = ?auto_427090 ?auto_427101 ) ) ( not ( = ?auto_427090 ?auto_427102 ) ) ( not ( = ?auto_427090 ?auto_427103 ) ) ( not ( = ?auto_427090 ?auto_427104 ) ) ( not ( = ?auto_427091 ?auto_427092 ) ) ( not ( = ?auto_427091 ?auto_427093 ) ) ( not ( = ?auto_427091 ?auto_427094 ) ) ( not ( = ?auto_427091 ?auto_427095 ) ) ( not ( = ?auto_427091 ?auto_427096 ) ) ( not ( = ?auto_427091 ?auto_427097 ) ) ( not ( = ?auto_427091 ?auto_427098 ) ) ( not ( = ?auto_427091 ?auto_427099 ) ) ( not ( = ?auto_427091 ?auto_427100 ) ) ( not ( = ?auto_427091 ?auto_427101 ) ) ( not ( = ?auto_427091 ?auto_427102 ) ) ( not ( = ?auto_427091 ?auto_427103 ) ) ( not ( = ?auto_427091 ?auto_427104 ) ) ( not ( = ?auto_427092 ?auto_427093 ) ) ( not ( = ?auto_427092 ?auto_427094 ) ) ( not ( = ?auto_427092 ?auto_427095 ) ) ( not ( = ?auto_427092 ?auto_427096 ) ) ( not ( = ?auto_427092 ?auto_427097 ) ) ( not ( = ?auto_427092 ?auto_427098 ) ) ( not ( = ?auto_427092 ?auto_427099 ) ) ( not ( = ?auto_427092 ?auto_427100 ) ) ( not ( = ?auto_427092 ?auto_427101 ) ) ( not ( = ?auto_427092 ?auto_427102 ) ) ( not ( = ?auto_427092 ?auto_427103 ) ) ( not ( = ?auto_427092 ?auto_427104 ) ) ( not ( = ?auto_427093 ?auto_427094 ) ) ( not ( = ?auto_427093 ?auto_427095 ) ) ( not ( = ?auto_427093 ?auto_427096 ) ) ( not ( = ?auto_427093 ?auto_427097 ) ) ( not ( = ?auto_427093 ?auto_427098 ) ) ( not ( = ?auto_427093 ?auto_427099 ) ) ( not ( = ?auto_427093 ?auto_427100 ) ) ( not ( = ?auto_427093 ?auto_427101 ) ) ( not ( = ?auto_427093 ?auto_427102 ) ) ( not ( = ?auto_427093 ?auto_427103 ) ) ( not ( = ?auto_427093 ?auto_427104 ) ) ( not ( = ?auto_427094 ?auto_427095 ) ) ( not ( = ?auto_427094 ?auto_427096 ) ) ( not ( = ?auto_427094 ?auto_427097 ) ) ( not ( = ?auto_427094 ?auto_427098 ) ) ( not ( = ?auto_427094 ?auto_427099 ) ) ( not ( = ?auto_427094 ?auto_427100 ) ) ( not ( = ?auto_427094 ?auto_427101 ) ) ( not ( = ?auto_427094 ?auto_427102 ) ) ( not ( = ?auto_427094 ?auto_427103 ) ) ( not ( = ?auto_427094 ?auto_427104 ) ) ( not ( = ?auto_427095 ?auto_427096 ) ) ( not ( = ?auto_427095 ?auto_427097 ) ) ( not ( = ?auto_427095 ?auto_427098 ) ) ( not ( = ?auto_427095 ?auto_427099 ) ) ( not ( = ?auto_427095 ?auto_427100 ) ) ( not ( = ?auto_427095 ?auto_427101 ) ) ( not ( = ?auto_427095 ?auto_427102 ) ) ( not ( = ?auto_427095 ?auto_427103 ) ) ( not ( = ?auto_427095 ?auto_427104 ) ) ( not ( = ?auto_427096 ?auto_427097 ) ) ( not ( = ?auto_427096 ?auto_427098 ) ) ( not ( = ?auto_427096 ?auto_427099 ) ) ( not ( = ?auto_427096 ?auto_427100 ) ) ( not ( = ?auto_427096 ?auto_427101 ) ) ( not ( = ?auto_427096 ?auto_427102 ) ) ( not ( = ?auto_427096 ?auto_427103 ) ) ( not ( = ?auto_427096 ?auto_427104 ) ) ( not ( = ?auto_427097 ?auto_427098 ) ) ( not ( = ?auto_427097 ?auto_427099 ) ) ( not ( = ?auto_427097 ?auto_427100 ) ) ( not ( = ?auto_427097 ?auto_427101 ) ) ( not ( = ?auto_427097 ?auto_427102 ) ) ( not ( = ?auto_427097 ?auto_427103 ) ) ( not ( = ?auto_427097 ?auto_427104 ) ) ( not ( = ?auto_427098 ?auto_427099 ) ) ( not ( = ?auto_427098 ?auto_427100 ) ) ( not ( = ?auto_427098 ?auto_427101 ) ) ( not ( = ?auto_427098 ?auto_427102 ) ) ( not ( = ?auto_427098 ?auto_427103 ) ) ( not ( = ?auto_427098 ?auto_427104 ) ) ( not ( = ?auto_427099 ?auto_427100 ) ) ( not ( = ?auto_427099 ?auto_427101 ) ) ( not ( = ?auto_427099 ?auto_427102 ) ) ( not ( = ?auto_427099 ?auto_427103 ) ) ( not ( = ?auto_427099 ?auto_427104 ) ) ( not ( = ?auto_427100 ?auto_427101 ) ) ( not ( = ?auto_427100 ?auto_427102 ) ) ( not ( = ?auto_427100 ?auto_427103 ) ) ( not ( = ?auto_427100 ?auto_427104 ) ) ( not ( = ?auto_427101 ?auto_427102 ) ) ( not ( = ?auto_427101 ?auto_427103 ) ) ( not ( = ?auto_427101 ?auto_427104 ) ) ( not ( = ?auto_427102 ?auto_427103 ) ) ( not ( = ?auto_427102 ?auto_427104 ) ) ( not ( = ?auto_427103 ?auto_427104 ) ) ( ON ?auto_427102 ?auto_427103 ) ( ON ?auto_427101 ?auto_427102 ) ( ON ?auto_427100 ?auto_427101 ) ( ON ?auto_427099 ?auto_427100 ) ( ON ?auto_427098 ?auto_427099 ) ( ON ?auto_427097 ?auto_427098 ) ( CLEAR ?auto_427095 ) ( ON ?auto_427096 ?auto_427097 ) ( CLEAR ?auto_427096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_427090 ?auto_427091 ?auto_427092 ?auto_427093 ?auto_427094 ?auto_427095 ?auto_427096 )
      ( MAKE-14PILE ?auto_427090 ?auto_427091 ?auto_427092 ?auto_427093 ?auto_427094 ?auto_427095 ?auto_427096 ?auto_427097 ?auto_427098 ?auto_427099 ?auto_427100 ?auto_427101 ?auto_427102 ?auto_427103 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_427119 - BLOCK
      ?auto_427120 - BLOCK
      ?auto_427121 - BLOCK
      ?auto_427122 - BLOCK
      ?auto_427123 - BLOCK
      ?auto_427124 - BLOCK
      ?auto_427125 - BLOCK
      ?auto_427126 - BLOCK
      ?auto_427127 - BLOCK
      ?auto_427128 - BLOCK
      ?auto_427129 - BLOCK
      ?auto_427130 - BLOCK
      ?auto_427131 - BLOCK
      ?auto_427132 - BLOCK
    )
    :vars
    (
      ?auto_427133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_427132 ?auto_427133 ) ( ON-TABLE ?auto_427119 ) ( ON ?auto_427120 ?auto_427119 ) ( ON ?auto_427121 ?auto_427120 ) ( ON ?auto_427122 ?auto_427121 ) ( ON ?auto_427123 ?auto_427122 ) ( ON ?auto_427124 ?auto_427123 ) ( not ( = ?auto_427119 ?auto_427120 ) ) ( not ( = ?auto_427119 ?auto_427121 ) ) ( not ( = ?auto_427119 ?auto_427122 ) ) ( not ( = ?auto_427119 ?auto_427123 ) ) ( not ( = ?auto_427119 ?auto_427124 ) ) ( not ( = ?auto_427119 ?auto_427125 ) ) ( not ( = ?auto_427119 ?auto_427126 ) ) ( not ( = ?auto_427119 ?auto_427127 ) ) ( not ( = ?auto_427119 ?auto_427128 ) ) ( not ( = ?auto_427119 ?auto_427129 ) ) ( not ( = ?auto_427119 ?auto_427130 ) ) ( not ( = ?auto_427119 ?auto_427131 ) ) ( not ( = ?auto_427119 ?auto_427132 ) ) ( not ( = ?auto_427119 ?auto_427133 ) ) ( not ( = ?auto_427120 ?auto_427121 ) ) ( not ( = ?auto_427120 ?auto_427122 ) ) ( not ( = ?auto_427120 ?auto_427123 ) ) ( not ( = ?auto_427120 ?auto_427124 ) ) ( not ( = ?auto_427120 ?auto_427125 ) ) ( not ( = ?auto_427120 ?auto_427126 ) ) ( not ( = ?auto_427120 ?auto_427127 ) ) ( not ( = ?auto_427120 ?auto_427128 ) ) ( not ( = ?auto_427120 ?auto_427129 ) ) ( not ( = ?auto_427120 ?auto_427130 ) ) ( not ( = ?auto_427120 ?auto_427131 ) ) ( not ( = ?auto_427120 ?auto_427132 ) ) ( not ( = ?auto_427120 ?auto_427133 ) ) ( not ( = ?auto_427121 ?auto_427122 ) ) ( not ( = ?auto_427121 ?auto_427123 ) ) ( not ( = ?auto_427121 ?auto_427124 ) ) ( not ( = ?auto_427121 ?auto_427125 ) ) ( not ( = ?auto_427121 ?auto_427126 ) ) ( not ( = ?auto_427121 ?auto_427127 ) ) ( not ( = ?auto_427121 ?auto_427128 ) ) ( not ( = ?auto_427121 ?auto_427129 ) ) ( not ( = ?auto_427121 ?auto_427130 ) ) ( not ( = ?auto_427121 ?auto_427131 ) ) ( not ( = ?auto_427121 ?auto_427132 ) ) ( not ( = ?auto_427121 ?auto_427133 ) ) ( not ( = ?auto_427122 ?auto_427123 ) ) ( not ( = ?auto_427122 ?auto_427124 ) ) ( not ( = ?auto_427122 ?auto_427125 ) ) ( not ( = ?auto_427122 ?auto_427126 ) ) ( not ( = ?auto_427122 ?auto_427127 ) ) ( not ( = ?auto_427122 ?auto_427128 ) ) ( not ( = ?auto_427122 ?auto_427129 ) ) ( not ( = ?auto_427122 ?auto_427130 ) ) ( not ( = ?auto_427122 ?auto_427131 ) ) ( not ( = ?auto_427122 ?auto_427132 ) ) ( not ( = ?auto_427122 ?auto_427133 ) ) ( not ( = ?auto_427123 ?auto_427124 ) ) ( not ( = ?auto_427123 ?auto_427125 ) ) ( not ( = ?auto_427123 ?auto_427126 ) ) ( not ( = ?auto_427123 ?auto_427127 ) ) ( not ( = ?auto_427123 ?auto_427128 ) ) ( not ( = ?auto_427123 ?auto_427129 ) ) ( not ( = ?auto_427123 ?auto_427130 ) ) ( not ( = ?auto_427123 ?auto_427131 ) ) ( not ( = ?auto_427123 ?auto_427132 ) ) ( not ( = ?auto_427123 ?auto_427133 ) ) ( not ( = ?auto_427124 ?auto_427125 ) ) ( not ( = ?auto_427124 ?auto_427126 ) ) ( not ( = ?auto_427124 ?auto_427127 ) ) ( not ( = ?auto_427124 ?auto_427128 ) ) ( not ( = ?auto_427124 ?auto_427129 ) ) ( not ( = ?auto_427124 ?auto_427130 ) ) ( not ( = ?auto_427124 ?auto_427131 ) ) ( not ( = ?auto_427124 ?auto_427132 ) ) ( not ( = ?auto_427124 ?auto_427133 ) ) ( not ( = ?auto_427125 ?auto_427126 ) ) ( not ( = ?auto_427125 ?auto_427127 ) ) ( not ( = ?auto_427125 ?auto_427128 ) ) ( not ( = ?auto_427125 ?auto_427129 ) ) ( not ( = ?auto_427125 ?auto_427130 ) ) ( not ( = ?auto_427125 ?auto_427131 ) ) ( not ( = ?auto_427125 ?auto_427132 ) ) ( not ( = ?auto_427125 ?auto_427133 ) ) ( not ( = ?auto_427126 ?auto_427127 ) ) ( not ( = ?auto_427126 ?auto_427128 ) ) ( not ( = ?auto_427126 ?auto_427129 ) ) ( not ( = ?auto_427126 ?auto_427130 ) ) ( not ( = ?auto_427126 ?auto_427131 ) ) ( not ( = ?auto_427126 ?auto_427132 ) ) ( not ( = ?auto_427126 ?auto_427133 ) ) ( not ( = ?auto_427127 ?auto_427128 ) ) ( not ( = ?auto_427127 ?auto_427129 ) ) ( not ( = ?auto_427127 ?auto_427130 ) ) ( not ( = ?auto_427127 ?auto_427131 ) ) ( not ( = ?auto_427127 ?auto_427132 ) ) ( not ( = ?auto_427127 ?auto_427133 ) ) ( not ( = ?auto_427128 ?auto_427129 ) ) ( not ( = ?auto_427128 ?auto_427130 ) ) ( not ( = ?auto_427128 ?auto_427131 ) ) ( not ( = ?auto_427128 ?auto_427132 ) ) ( not ( = ?auto_427128 ?auto_427133 ) ) ( not ( = ?auto_427129 ?auto_427130 ) ) ( not ( = ?auto_427129 ?auto_427131 ) ) ( not ( = ?auto_427129 ?auto_427132 ) ) ( not ( = ?auto_427129 ?auto_427133 ) ) ( not ( = ?auto_427130 ?auto_427131 ) ) ( not ( = ?auto_427130 ?auto_427132 ) ) ( not ( = ?auto_427130 ?auto_427133 ) ) ( not ( = ?auto_427131 ?auto_427132 ) ) ( not ( = ?auto_427131 ?auto_427133 ) ) ( not ( = ?auto_427132 ?auto_427133 ) ) ( ON ?auto_427131 ?auto_427132 ) ( ON ?auto_427130 ?auto_427131 ) ( ON ?auto_427129 ?auto_427130 ) ( ON ?auto_427128 ?auto_427129 ) ( ON ?auto_427127 ?auto_427128 ) ( ON ?auto_427126 ?auto_427127 ) ( CLEAR ?auto_427124 ) ( ON ?auto_427125 ?auto_427126 ) ( CLEAR ?auto_427125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_427119 ?auto_427120 ?auto_427121 ?auto_427122 ?auto_427123 ?auto_427124 ?auto_427125 )
      ( MAKE-14PILE ?auto_427119 ?auto_427120 ?auto_427121 ?auto_427122 ?auto_427123 ?auto_427124 ?auto_427125 ?auto_427126 ?auto_427127 ?auto_427128 ?auto_427129 ?auto_427130 ?auto_427131 ?auto_427132 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_427148 - BLOCK
      ?auto_427149 - BLOCK
      ?auto_427150 - BLOCK
      ?auto_427151 - BLOCK
      ?auto_427152 - BLOCK
      ?auto_427153 - BLOCK
      ?auto_427154 - BLOCK
      ?auto_427155 - BLOCK
      ?auto_427156 - BLOCK
      ?auto_427157 - BLOCK
      ?auto_427158 - BLOCK
      ?auto_427159 - BLOCK
      ?auto_427160 - BLOCK
      ?auto_427161 - BLOCK
    )
    :vars
    (
      ?auto_427162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_427161 ?auto_427162 ) ( ON-TABLE ?auto_427148 ) ( ON ?auto_427149 ?auto_427148 ) ( ON ?auto_427150 ?auto_427149 ) ( ON ?auto_427151 ?auto_427150 ) ( ON ?auto_427152 ?auto_427151 ) ( not ( = ?auto_427148 ?auto_427149 ) ) ( not ( = ?auto_427148 ?auto_427150 ) ) ( not ( = ?auto_427148 ?auto_427151 ) ) ( not ( = ?auto_427148 ?auto_427152 ) ) ( not ( = ?auto_427148 ?auto_427153 ) ) ( not ( = ?auto_427148 ?auto_427154 ) ) ( not ( = ?auto_427148 ?auto_427155 ) ) ( not ( = ?auto_427148 ?auto_427156 ) ) ( not ( = ?auto_427148 ?auto_427157 ) ) ( not ( = ?auto_427148 ?auto_427158 ) ) ( not ( = ?auto_427148 ?auto_427159 ) ) ( not ( = ?auto_427148 ?auto_427160 ) ) ( not ( = ?auto_427148 ?auto_427161 ) ) ( not ( = ?auto_427148 ?auto_427162 ) ) ( not ( = ?auto_427149 ?auto_427150 ) ) ( not ( = ?auto_427149 ?auto_427151 ) ) ( not ( = ?auto_427149 ?auto_427152 ) ) ( not ( = ?auto_427149 ?auto_427153 ) ) ( not ( = ?auto_427149 ?auto_427154 ) ) ( not ( = ?auto_427149 ?auto_427155 ) ) ( not ( = ?auto_427149 ?auto_427156 ) ) ( not ( = ?auto_427149 ?auto_427157 ) ) ( not ( = ?auto_427149 ?auto_427158 ) ) ( not ( = ?auto_427149 ?auto_427159 ) ) ( not ( = ?auto_427149 ?auto_427160 ) ) ( not ( = ?auto_427149 ?auto_427161 ) ) ( not ( = ?auto_427149 ?auto_427162 ) ) ( not ( = ?auto_427150 ?auto_427151 ) ) ( not ( = ?auto_427150 ?auto_427152 ) ) ( not ( = ?auto_427150 ?auto_427153 ) ) ( not ( = ?auto_427150 ?auto_427154 ) ) ( not ( = ?auto_427150 ?auto_427155 ) ) ( not ( = ?auto_427150 ?auto_427156 ) ) ( not ( = ?auto_427150 ?auto_427157 ) ) ( not ( = ?auto_427150 ?auto_427158 ) ) ( not ( = ?auto_427150 ?auto_427159 ) ) ( not ( = ?auto_427150 ?auto_427160 ) ) ( not ( = ?auto_427150 ?auto_427161 ) ) ( not ( = ?auto_427150 ?auto_427162 ) ) ( not ( = ?auto_427151 ?auto_427152 ) ) ( not ( = ?auto_427151 ?auto_427153 ) ) ( not ( = ?auto_427151 ?auto_427154 ) ) ( not ( = ?auto_427151 ?auto_427155 ) ) ( not ( = ?auto_427151 ?auto_427156 ) ) ( not ( = ?auto_427151 ?auto_427157 ) ) ( not ( = ?auto_427151 ?auto_427158 ) ) ( not ( = ?auto_427151 ?auto_427159 ) ) ( not ( = ?auto_427151 ?auto_427160 ) ) ( not ( = ?auto_427151 ?auto_427161 ) ) ( not ( = ?auto_427151 ?auto_427162 ) ) ( not ( = ?auto_427152 ?auto_427153 ) ) ( not ( = ?auto_427152 ?auto_427154 ) ) ( not ( = ?auto_427152 ?auto_427155 ) ) ( not ( = ?auto_427152 ?auto_427156 ) ) ( not ( = ?auto_427152 ?auto_427157 ) ) ( not ( = ?auto_427152 ?auto_427158 ) ) ( not ( = ?auto_427152 ?auto_427159 ) ) ( not ( = ?auto_427152 ?auto_427160 ) ) ( not ( = ?auto_427152 ?auto_427161 ) ) ( not ( = ?auto_427152 ?auto_427162 ) ) ( not ( = ?auto_427153 ?auto_427154 ) ) ( not ( = ?auto_427153 ?auto_427155 ) ) ( not ( = ?auto_427153 ?auto_427156 ) ) ( not ( = ?auto_427153 ?auto_427157 ) ) ( not ( = ?auto_427153 ?auto_427158 ) ) ( not ( = ?auto_427153 ?auto_427159 ) ) ( not ( = ?auto_427153 ?auto_427160 ) ) ( not ( = ?auto_427153 ?auto_427161 ) ) ( not ( = ?auto_427153 ?auto_427162 ) ) ( not ( = ?auto_427154 ?auto_427155 ) ) ( not ( = ?auto_427154 ?auto_427156 ) ) ( not ( = ?auto_427154 ?auto_427157 ) ) ( not ( = ?auto_427154 ?auto_427158 ) ) ( not ( = ?auto_427154 ?auto_427159 ) ) ( not ( = ?auto_427154 ?auto_427160 ) ) ( not ( = ?auto_427154 ?auto_427161 ) ) ( not ( = ?auto_427154 ?auto_427162 ) ) ( not ( = ?auto_427155 ?auto_427156 ) ) ( not ( = ?auto_427155 ?auto_427157 ) ) ( not ( = ?auto_427155 ?auto_427158 ) ) ( not ( = ?auto_427155 ?auto_427159 ) ) ( not ( = ?auto_427155 ?auto_427160 ) ) ( not ( = ?auto_427155 ?auto_427161 ) ) ( not ( = ?auto_427155 ?auto_427162 ) ) ( not ( = ?auto_427156 ?auto_427157 ) ) ( not ( = ?auto_427156 ?auto_427158 ) ) ( not ( = ?auto_427156 ?auto_427159 ) ) ( not ( = ?auto_427156 ?auto_427160 ) ) ( not ( = ?auto_427156 ?auto_427161 ) ) ( not ( = ?auto_427156 ?auto_427162 ) ) ( not ( = ?auto_427157 ?auto_427158 ) ) ( not ( = ?auto_427157 ?auto_427159 ) ) ( not ( = ?auto_427157 ?auto_427160 ) ) ( not ( = ?auto_427157 ?auto_427161 ) ) ( not ( = ?auto_427157 ?auto_427162 ) ) ( not ( = ?auto_427158 ?auto_427159 ) ) ( not ( = ?auto_427158 ?auto_427160 ) ) ( not ( = ?auto_427158 ?auto_427161 ) ) ( not ( = ?auto_427158 ?auto_427162 ) ) ( not ( = ?auto_427159 ?auto_427160 ) ) ( not ( = ?auto_427159 ?auto_427161 ) ) ( not ( = ?auto_427159 ?auto_427162 ) ) ( not ( = ?auto_427160 ?auto_427161 ) ) ( not ( = ?auto_427160 ?auto_427162 ) ) ( not ( = ?auto_427161 ?auto_427162 ) ) ( ON ?auto_427160 ?auto_427161 ) ( ON ?auto_427159 ?auto_427160 ) ( ON ?auto_427158 ?auto_427159 ) ( ON ?auto_427157 ?auto_427158 ) ( ON ?auto_427156 ?auto_427157 ) ( ON ?auto_427155 ?auto_427156 ) ( ON ?auto_427154 ?auto_427155 ) ( CLEAR ?auto_427152 ) ( ON ?auto_427153 ?auto_427154 ) ( CLEAR ?auto_427153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_427148 ?auto_427149 ?auto_427150 ?auto_427151 ?auto_427152 ?auto_427153 )
      ( MAKE-14PILE ?auto_427148 ?auto_427149 ?auto_427150 ?auto_427151 ?auto_427152 ?auto_427153 ?auto_427154 ?auto_427155 ?auto_427156 ?auto_427157 ?auto_427158 ?auto_427159 ?auto_427160 ?auto_427161 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_427177 - BLOCK
      ?auto_427178 - BLOCK
      ?auto_427179 - BLOCK
      ?auto_427180 - BLOCK
      ?auto_427181 - BLOCK
      ?auto_427182 - BLOCK
      ?auto_427183 - BLOCK
      ?auto_427184 - BLOCK
      ?auto_427185 - BLOCK
      ?auto_427186 - BLOCK
      ?auto_427187 - BLOCK
      ?auto_427188 - BLOCK
      ?auto_427189 - BLOCK
      ?auto_427190 - BLOCK
    )
    :vars
    (
      ?auto_427191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_427190 ?auto_427191 ) ( ON-TABLE ?auto_427177 ) ( ON ?auto_427178 ?auto_427177 ) ( ON ?auto_427179 ?auto_427178 ) ( ON ?auto_427180 ?auto_427179 ) ( ON ?auto_427181 ?auto_427180 ) ( not ( = ?auto_427177 ?auto_427178 ) ) ( not ( = ?auto_427177 ?auto_427179 ) ) ( not ( = ?auto_427177 ?auto_427180 ) ) ( not ( = ?auto_427177 ?auto_427181 ) ) ( not ( = ?auto_427177 ?auto_427182 ) ) ( not ( = ?auto_427177 ?auto_427183 ) ) ( not ( = ?auto_427177 ?auto_427184 ) ) ( not ( = ?auto_427177 ?auto_427185 ) ) ( not ( = ?auto_427177 ?auto_427186 ) ) ( not ( = ?auto_427177 ?auto_427187 ) ) ( not ( = ?auto_427177 ?auto_427188 ) ) ( not ( = ?auto_427177 ?auto_427189 ) ) ( not ( = ?auto_427177 ?auto_427190 ) ) ( not ( = ?auto_427177 ?auto_427191 ) ) ( not ( = ?auto_427178 ?auto_427179 ) ) ( not ( = ?auto_427178 ?auto_427180 ) ) ( not ( = ?auto_427178 ?auto_427181 ) ) ( not ( = ?auto_427178 ?auto_427182 ) ) ( not ( = ?auto_427178 ?auto_427183 ) ) ( not ( = ?auto_427178 ?auto_427184 ) ) ( not ( = ?auto_427178 ?auto_427185 ) ) ( not ( = ?auto_427178 ?auto_427186 ) ) ( not ( = ?auto_427178 ?auto_427187 ) ) ( not ( = ?auto_427178 ?auto_427188 ) ) ( not ( = ?auto_427178 ?auto_427189 ) ) ( not ( = ?auto_427178 ?auto_427190 ) ) ( not ( = ?auto_427178 ?auto_427191 ) ) ( not ( = ?auto_427179 ?auto_427180 ) ) ( not ( = ?auto_427179 ?auto_427181 ) ) ( not ( = ?auto_427179 ?auto_427182 ) ) ( not ( = ?auto_427179 ?auto_427183 ) ) ( not ( = ?auto_427179 ?auto_427184 ) ) ( not ( = ?auto_427179 ?auto_427185 ) ) ( not ( = ?auto_427179 ?auto_427186 ) ) ( not ( = ?auto_427179 ?auto_427187 ) ) ( not ( = ?auto_427179 ?auto_427188 ) ) ( not ( = ?auto_427179 ?auto_427189 ) ) ( not ( = ?auto_427179 ?auto_427190 ) ) ( not ( = ?auto_427179 ?auto_427191 ) ) ( not ( = ?auto_427180 ?auto_427181 ) ) ( not ( = ?auto_427180 ?auto_427182 ) ) ( not ( = ?auto_427180 ?auto_427183 ) ) ( not ( = ?auto_427180 ?auto_427184 ) ) ( not ( = ?auto_427180 ?auto_427185 ) ) ( not ( = ?auto_427180 ?auto_427186 ) ) ( not ( = ?auto_427180 ?auto_427187 ) ) ( not ( = ?auto_427180 ?auto_427188 ) ) ( not ( = ?auto_427180 ?auto_427189 ) ) ( not ( = ?auto_427180 ?auto_427190 ) ) ( not ( = ?auto_427180 ?auto_427191 ) ) ( not ( = ?auto_427181 ?auto_427182 ) ) ( not ( = ?auto_427181 ?auto_427183 ) ) ( not ( = ?auto_427181 ?auto_427184 ) ) ( not ( = ?auto_427181 ?auto_427185 ) ) ( not ( = ?auto_427181 ?auto_427186 ) ) ( not ( = ?auto_427181 ?auto_427187 ) ) ( not ( = ?auto_427181 ?auto_427188 ) ) ( not ( = ?auto_427181 ?auto_427189 ) ) ( not ( = ?auto_427181 ?auto_427190 ) ) ( not ( = ?auto_427181 ?auto_427191 ) ) ( not ( = ?auto_427182 ?auto_427183 ) ) ( not ( = ?auto_427182 ?auto_427184 ) ) ( not ( = ?auto_427182 ?auto_427185 ) ) ( not ( = ?auto_427182 ?auto_427186 ) ) ( not ( = ?auto_427182 ?auto_427187 ) ) ( not ( = ?auto_427182 ?auto_427188 ) ) ( not ( = ?auto_427182 ?auto_427189 ) ) ( not ( = ?auto_427182 ?auto_427190 ) ) ( not ( = ?auto_427182 ?auto_427191 ) ) ( not ( = ?auto_427183 ?auto_427184 ) ) ( not ( = ?auto_427183 ?auto_427185 ) ) ( not ( = ?auto_427183 ?auto_427186 ) ) ( not ( = ?auto_427183 ?auto_427187 ) ) ( not ( = ?auto_427183 ?auto_427188 ) ) ( not ( = ?auto_427183 ?auto_427189 ) ) ( not ( = ?auto_427183 ?auto_427190 ) ) ( not ( = ?auto_427183 ?auto_427191 ) ) ( not ( = ?auto_427184 ?auto_427185 ) ) ( not ( = ?auto_427184 ?auto_427186 ) ) ( not ( = ?auto_427184 ?auto_427187 ) ) ( not ( = ?auto_427184 ?auto_427188 ) ) ( not ( = ?auto_427184 ?auto_427189 ) ) ( not ( = ?auto_427184 ?auto_427190 ) ) ( not ( = ?auto_427184 ?auto_427191 ) ) ( not ( = ?auto_427185 ?auto_427186 ) ) ( not ( = ?auto_427185 ?auto_427187 ) ) ( not ( = ?auto_427185 ?auto_427188 ) ) ( not ( = ?auto_427185 ?auto_427189 ) ) ( not ( = ?auto_427185 ?auto_427190 ) ) ( not ( = ?auto_427185 ?auto_427191 ) ) ( not ( = ?auto_427186 ?auto_427187 ) ) ( not ( = ?auto_427186 ?auto_427188 ) ) ( not ( = ?auto_427186 ?auto_427189 ) ) ( not ( = ?auto_427186 ?auto_427190 ) ) ( not ( = ?auto_427186 ?auto_427191 ) ) ( not ( = ?auto_427187 ?auto_427188 ) ) ( not ( = ?auto_427187 ?auto_427189 ) ) ( not ( = ?auto_427187 ?auto_427190 ) ) ( not ( = ?auto_427187 ?auto_427191 ) ) ( not ( = ?auto_427188 ?auto_427189 ) ) ( not ( = ?auto_427188 ?auto_427190 ) ) ( not ( = ?auto_427188 ?auto_427191 ) ) ( not ( = ?auto_427189 ?auto_427190 ) ) ( not ( = ?auto_427189 ?auto_427191 ) ) ( not ( = ?auto_427190 ?auto_427191 ) ) ( ON ?auto_427189 ?auto_427190 ) ( ON ?auto_427188 ?auto_427189 ) ( ON ?auto_427187 ?auto_427188 ) ( ON ?auto_427186 ?auto_427187 ) ( ON ?auto_427185 ?auto_427186 ) ( ON ?auto_427184 ?auto_427185 ) ( ON ?auto_427183 ?auto_427184 ) ( CLEAR ?auto_427181 ) ( ON ?auto_427182 ?auto_427183 ) ( CLEAR ?auto_427182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_427177 ?auto_427178 ?auto_427179 ?auto_427180 ?auto_427181 ?auto_427182 )
      ( MAKE-14PILE ?auto_427177 ?auto_427178 ?auto_427179 ?auto_427180 ?auto_427181 ?auto_427182 ?auto_427183 ?auto_427184 ?auto_427185 ?auto_427186 ?auto_427187 ?auto_427188 ?auto_427189 ?auto_427190 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_427206 - BLOCK
      ?auto_427207 - BLOCK
      ?auto_427208 - BLOCK
      ?auto_427209 - BLOCK
      ?auto_427210 - BLOCK
      ?auto_427211 - BLOCK
      ?auto_427212 - BLOCK
      ?auto_427213 - BLOCK
      ?auto_427214 - BLOCK
      ?auto_427215 - BLOCK
      ?auto_427216 - BLOCK
      ?auto_427217 - BLOCK
      ?auto_427218 - BLOCK
      ?auto_427219 - BLOCK
    )
    :vars
    (
      ?auto_427220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_427219 ?auto_427220 ) ( ON-TABLE ?auto_427206 ) ( ON ?auto_427207 ?auto_427206 ) ( ON ?auto_427208 ?auto_427207 ) ( ON ?auto_427209 ?auto_427208 ) ( not ( = ?auto_427206 ?auto_427207 ) ) ( not ( = ?auto_427206 ?auto_427208 ) ) ( not ( = ?auto_427206 ?auto_427209 ) ) ( not ( = ?auto_427206 ?auto_427210 ) ) ( not ( = ?auto_427206 ?auto_427211 ) ) ( not ( = ?auto_427206 ?auto_427212 ) ) ( not ( = ?auto_427206 ?auto_427213 ) ) ( not ( = ?auto_427206 ?auto_427214 ) ) ( not ( = ?auto_427206 ?auto_427215 ) ) ( not ( = ?auto_427206 ?auto_427216 ) ) ( not ( = ?auto_427206 ?auto_427217 ) ) ( not ( = ?auto_427206 ?auto_427218 ) ) ( not ( = ?auto_427206 ?auto_427219 ) ) ( not ( = ?auto_427206 ?auto_427220 ) ) ( not ( = ?auto_427207 ?auto_427208 ) ) ( not ( = ?auto_427207 ?auto_427209 ) ) ( not ( = ?auto_427207 ?auto_427210 ) ) ( not ( = ?auto_427207 ?auto_427211 ) ) ( not ( = ?auto_427207 ?auto_427212 ) ) ( not ( = ?auto_427207 ?auto_427213 ) ) ( not ( = ?auto_427207 ?auto_427214 ) ) ( not ( = ?auto_427207 ?auto_427215 ) ) ( not ( = ?auto_427207 ?auto_427216 ) ) ( not ( = ?auto_427207 ?auto_427217 ) ) ( not ( = ?auto_427207 ?auto_427218 ) ) ( not ( = ?auto_427207 ?auto_427219 ) ) ( not ( = ?auto_427207 ?auto_427220 ) ) ( not ( = ?auto_427208 ?auto_427209 ) ) ( not ( = ?auto_427208 ?auto_427210 ) ) ( not ( = ?auto_427208 ?auto_427211 ) ) ( not ( = ?auto_427208 ?auto_427212 ) ) ( not ( = ?auto_427208 ?auto_427213 ) ) ( not ( = ?auto_427208 ?auto_427214 ) ) ( not ( = ?auto_427208 ?auto_427215 ) ) ( not ( = ?auto_427208 ?auto_427216 ) ) ( not ( = ?auto_427208 ?auto_427217 ) ) ( not ( = ?auto_427208 ?auto_427218 ) ) ( not ( = ?auto_427208 ?auto_427219 ) ) ( not ( = ?auto_427208 ?auto_427220 ) ) ( not ( = ?auto_427209 ?auto_427210 ) ) ( not ( = ?auto_427209 ?auto_427211 ) ) ( not ( = ?auto_427209 ?auto_427212 ) ) ( not ( = ?auto_427209 ?auto_427213 ) ) ( not ( = ?auto_427209 ?auto_427214 ) ) ( not ( = ?auto_427209 ?auto_427215 ) ) ( not ( = ?auto_427209 ?auto_427216 ) ) ( not ( = ?auto_427209 ?auto_427217 ) ) ( not ( = ?auto_427209 ?auto_427218 ) ) ( not ( = ?auto_427209 ?auto_427219 ) ) ( not ( = ?auto_427209 ?auto_427220 ) ) ( not ( = ?auto_427210 ?auto_427211 ) ) ( not ( = ?auto_427210 ?auto_427212 ) ) ( not ( = ?auto_427210 ?auto_427213 ) ) ( not ( = ?auto_427210 ?auto_427214 ) ) ( not ( = ?auto_427210 ?auto_427215 ) ) ( not ( = ?auto_427210 ?auto_427216 ) ) ( not ( = ?auto_427210 ?auto_427217 ) ) ( not ( = ?auto_427210 ?auto_427218 ) ) ( not ( = ?auto_427210 ?auto_427219 ) ) ( not ( = ?auto_427210 ?auto_427220 ) ) ( not ( = ?auto_427211 ?auto_427212 ) ) ( not ( = ?auto_427211 ?auto_427213 ) ) ( not ( = ?auto_427211 ?auto_427214 ) ) ( not ( = ?auto_427211 ?auto_427215 ) ) ( not ( = ?auto_427211 ?auto_427216 ) ) ( not ( = ?auto_427211 ?auto_427217 ) ) ( not ( = ?auto_427211 ?auto_427218 ) ) ( not ( = ?auto_427211 ?auto_427219 ) ) ( not ( = ?auto_427211 ?auto_427220 ) ) ( not ( = ?auto_427212 ?auto_427213 ) ) ( not ( = ?auto_427212 ?auto_427214 ) ) ( not ( = ?auto_427212 ?auto_427215 ) ) ( not ( = ?auto_427212 ?auto_427216 ) ) ( not ( = ?auto_427212 ?auto_427217 ) ) ( not ( = ?auto_427212 ?auto_427218 ) ) ( not ( = ?auto_427212 ?auto_427219 ) ) ( not ( = ?auto_427212 ?auto_427220 ) ) ( not ( = ?auto_427213 ?auto_427214 ) ) ( not ( = ?auto_427213 ?auto_427215 ) ) ( not ( = ?auto_427213 ?auto_427216 ) ) ( not ( = ?auto_427213 ?auto_427217 ) ) ( not ( = ?auto_427213 ?auto_427218 ) ) ( not ( = ?auto_427213 ?auto_427219 ) ) ( not ( = ?auto_427213 ?auto_427220 ) ) ( not ( = ?auto_427214 ?auto_427215 ) ) ( not ( = ?auto_427214 ?auto_427216 ) ) ( not ( = ?auto_427214 ?auto_427217 ) ) ( not ( = ?auto_427214 ?auto_427218 ) ) ( not ( = ?auto_427214 ?auto_427219 ) ) ( not ( = ?auto_427214 ?auto_427220 ) ) ( not ( = ?auto_427215 ?auto_427216 ) ) ( not ( = ?auto_427215 ?auto_427217 ) ) ( not ( = ?auto_427215 ?auto_427218 ) ) ( not ( = ?auto_427215 ?auto_427219 ) ) ( not ( = ?auto_427215 ?auto_427220 ) ) ( not ( = ?auto_427216 ?auto_427217 ) ) ( not ( = ?auto_427216 ?auto_427218 ) ) ( not ( = ?auto_427216 ?auto_427219 ) ) ( not ( = ?auto_427216 ?auto_427220 ) ) ( not ( = ?auto_427217 ?auto_427218 ) ) ( not ( = ?auto_427217 ?auto_427219 ) ) ( not ( = ?auto_427217 ?auto_427220 ) ) ( not ( = ?auto_427218 ?auto_427219 ) ) ( not ( = ?auto_427218 ?auto_427220 ) ) ( not ( = ?auto_427219 ?auto_427220 ) ) ( ON ?auto_427218 ?auto_427219 ) ( ON ?auto_427217 ?auto_427218 ) ( ON ?auto_427216 ?auto_427217 ) ( ON ?auto_427215 ?auto_427216 ) ( ON ?auto_427214 ?auto_427215 ) ( ON ?auto_427213 ?auto_427214 ) ( ON ?auto_427212 ?auto_427213 ) ( ON ?auto_427211 ?auto_427212 ) ( CLEAR ?auto_427209 ) ( ON ?auto_427210 ?auto_427211 ) ( CLEAR ?auto_427210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_427206 ?auto_427207 ?auto_427208 ?auto_427209 ?auto_427210 )
      ( MAKE-14PILE ?auto_427206 ?auto_427207 ?auto_427208 ?auto_427209 ?auto_427210 ?auto_427211 ?auto_427212 ?auto_427213 ?auto_427214 ?auto_427215 ?auto_427216 ?auto_427217 ?auto_427218 ?auto_427219 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_427235 - BLOCK
      ?auto_427236 - BLOCK
      ?auto_427237 - BLOCK
      ?auto_427238 - BLOCK
      ?auto_427239 - BLOCK
      ?auto_427240 - BLOCK
      ?auto_427241 - BLOCK
      ?auto_427242 - BLOCK
      ?auto_427243 - BLOCK
      ?auto_427244 - BLOCK
      ?auto_427245 - BLOCK
      ?auto_427246 - BLOCK
      ?auto_427247 - BLOCK
      ?auto_427248 - BLOCK
    )
    :vars
    (
      ?auto_427249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_427248 ?auto_427249 ) ( ON-TABLE ?auto_427235 ) ( ON ?auto_427236 ?auto_427235 ) ( ON ?auto_427237 ?auto_427236 ) ( ON ?auto_427238 ?auto_427237 ) ( not ( = ?auto_427235 ?auto_427236 ) ) ( not ( = ?auto_427235 ?auto_427237 ) ) ( not ( = ?auto_427235 ?auto_427238 ) ) ( not ( = ?auto_427235 ?auto_427239 ) ) ( not ( = ?auto_427235 ?auto_427240 ) ) ( not ( = ?auto_427235 ?auto_427241 ) ) ( not ( = ?auto_427235 ?auto_427242 ) ) ( not ( = ?auto_427235 ?auto_427243 ) ) ( not ( = ?auto_427235 ?auto_427244 ) ) ( not ( = ?auto_427235 ?auto_427245 ) ) ( not ( = ?auto_427235 ?auto_427246 ) ) ( not ( = ?auto_427235 ?auto_427247 ) ) ( not ( = ?auto_427235 ?auto_427248 ) ) ( not ( = ?auto_427235 ?auto_427249 ) ) ( not ( = ?auto_427236 ?auto_427237 ) ) ( not ( = ?auto_427236 ?auto_427238 ) ) ( not ( = ?auto_427236 ?auto_427239 ) ) ( not ( = ?auto_427236 ?auto_427240 ) ) ( not ( = ?auto_427236 ?auto_427241 ) ) ( not ( = ?auto_427236 ?auto_427242 ) ) ( not ( = ?auto_427236 ?auto_427243 ) ) ( not ( = ?auto_427236 ?auto_427244 ) ) ( not ( = ?auto_427236 ?auto_427245 ) ) ( not ( = ?auto_427236 ?auto_427246 ) ) ( not ( = ?auto_427236 ?auto_427247 ) ) ( not ( = ?auto_427236 ?auto_427248 ) ) ( not ( = ?auto_427236 ?auto_427249 ) ) ( not ( = ?auto_427237 ?auto_427238 ) ) ( not ( = ?auto_427237 ?auto_427239 ) ) ( not ( = ?auto_427237 ?auto_427240 ) ) ( not ( = ?auto_427237 ?auto_427241 ) ) ( not ( = ?auto_427237 ?auto_427242 ) ) ( not ( = ?auto_427237 ?auto_427243 ) ) ( not ( = ?auto_427237 ?auto_427244 ) ) ( not ( = ?auto_427237 ?auto_427245 ) ) ( not ( = ?auto_427237 ?auto_427246 ) ) ( not ( = ?auto_427237 ?auto_427247 ) ) ( not ( = ?auto_427237 ?auto_427248 ) ) ( not ( = ?auto_427237 ?auto_427249 ) ) ( not ( = ?auto_427238 ?auto_427239 ) ) ( not ( = ?auto_427238 ?auto_427240 ) ) ( not ( = ?auto_427238 ?auto_427241 ) ) ( not ( = ?auto_427238 ?auto_427242 ) ) ( not ( = ?auto_427238 ?auto_427243 ) ) ( not ( = ?auto_427238 ?auto_427244 ) ) ( not ( = ?auto_427238 ?auto_427245 ) ) ( not ( = ?auto_427238 ?auto_427246 ) ) ( not ( = ?auto_427238 ?auto_427247 ) ) ( not ( = ?auto_427238 ?auto_427248 ) ) ( not ( = ?auto_427238 ?auto_427249 ) ) ( not ( = ?auto_427239 ?auto_427240 ) ) ( not ( = ?auto_427239 ?auto_427241 ) ) ( not ( = ?auto_427239 ?auto_427242 ) ) ( not ( = ?auto_427239 ?auto_427243 ) ) ( not ( = ?auto_427239 ?auto_427244 ) ) ( not ( = ?auto_427239 ?auto_427245 ) ) ( not ( = ?auto_427239 ?auto_427246 ) ) ( not ( = ?auto_427239 ?auto_427247 ) ) ( not ( = ?auto_427239 ?auto_427248 ) ) ( not ( = ?auto_427239 ?auto_427249 ) ) ( not ( = ?auto_427240 ?auto_427241 ) ) ( not ( = ?auto_427240 ?auto_427242 ) ) ( not ( = ?auto_427240 ?auto_427243 ) ) ( not ( = ?auto_427240 ?auto_427244 ) ) ( not ( = ?auto_427240 ?auto_427245 ) ) ( not ( = ?auto_427240 ?auto_427246 ) ) ( not ( = ?auto_427240 ?auto_427247 ) ) ( not ( = ?auto_427240 ?auto_427248 ) ) ( not ( = ?auto_427240 ?auto_427249 ) ) ( not ( = ?auto_427241 ?auto_427242 ) ) ( not ( = ?auto_427241 ?auto_427243 ) ) ( not ( = ?auto_427241 ?auto_427244 ) ) ( not ( = ?auto_427241 ?auto_427245 ) ) ( not ( = ?auto_427241 ?auto_427246 ) ) ( not ( = ?auto_427241 ?auto_427247 ) ) ( not ( = ?auto_427241 ?auto_427248 ) ) ( not ( = ?auto_427241 ?auto_427249 ) ) ( not ( = ?auto_427242 ?auto_427243 ) ) ( not ( = ?auto_427242 ?auto_427244 ) ) ( not ( = ?auto_427242 ?auto_427245 ) ) ( not ( = ?auto_427242 ?auto_427246 ) ) ( not ( = ?auto_427242 ?auto_427247 ) ) ( not ( = ?auto_427242 ?auto_427248 ) ) ( not ( = ?auto_427242 ?auto_427249 ) ) ( not ( = ?auto_427243 ?auto_427244 ) ) ( not ( = ?auto_427243 ?auto_427245 ) ) ( not ( = ?auto_427243 ?auto_427246 ) ) ( not ( = ?auto_427243 ?auto_427247 ) ) ( not ( = ?auto_427243 ?auto_427248 ) ) ( not ( = ?auto_427243 ?auto_427249 ) ) ( not ( = ?auto_427244 ?auto_427245 ) ) ( not ( = ?auto_427244 ?auto_427246 ) ) ( not ( = ?auto_427244 ?auto_427247 ) ) ( not ( = ?auto_427244 ?auto_427248 ) ) ( not ( = ?auto_427244 ?auto_427249 ) ) ( not ( = ?auto_427245 ?auto_427246 ) ) ( not ( = ?auto_427245 ?auto_427247 ) ) ( not ( = ?auto_427245 ?auto_427248 ) ) ( not ( = ?auto_427245 ?auto_427249 ) ) ( not ( = ?auto_427246 ?auto_427247 ) ) ( not ( = ?auto_427246 ?auto_427248 ) ) ( not ( = ?auto_427246 ?auto_427249 ) ) ( not ( = ?auto_427247 ?auto_427248 ) ) ( not ( = ?auto_427247 ?auto_427249 ) ) ( not ( = ?auto_427248 ?auto_427249 ) ) ( ON ?auto_427247 ?auto_427248 ) ( ON ?auto_427246 ?auto_427247 ) ( ON ?auto_427245 ?auto_427246 ) ( ON ?auto_427244 ?auto_427245 ) ( ON ?auto_427243 ?auto_427244 ) ( ON ?auto_427242 ?auto_427243 ) ( ON ?auto_427241 ?auto_427242 ) ( ON ?auto_427240 ?auto_427241 ) ( CLEAR ?auto_427238 ) ( ON ?auto_427239 ?auto_427240 ) ( CLEAR ?auto_427239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_427235 ?auto_427236 ?auto_427237 ?auto_427238 ?auto_427239 )
      ( MAKE-14PILE ?auto_427235 ?auto_427236 ?auto_427237 ?auto_427238 ?auto_427239 ?auto_427240 ?auto_427241 ?auto_427242 ?auto_427243 ?auto_427244 ?auto_427245 ?auto_427246 ?auto_427247 ?auto_427248 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_427264 - BLOCK
      ?auto_427265 - BLOCK
      ?auto_427266 - BLOCK
      ?auto_427267 - BLOCK
      ?auto_427268 - BLOCK
      ?auto_427269 - BLOCK
      ?auto_427270 - BLOCK
      ?auto_427271 - BLOCK
      ?auto_427272 - BLOCK
      ?auto_427273 - BLOCK
      ?auto_427274 - BLOCK
      ?auto_427275 - BLOCK
      ?auto_427276 - BLOCK
      ?auto_427277 - BLOCK
    )
    :vars
    (
      ?auto_427278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_427277 ?auto_427278 ) ( ON-TABLE ?auto_427264 ) ( ON ?auto_427265 ?auto_427264 ) ( ON ?auto_427266 ?auto_427265 ) ( not ( = ?auto_427264 ?auto_427265 ) ) ( not ( = ?auto_427264 ?auto_427266 ) ) ( not ( = ?auto_427264 ?auto_427267 ) ) ( not ( = ?auto_427264 ?auto_427268 ) ) ( not ( = ?auto_427264 ?auto_427269 ) ) ( not ( = ?auto_427264 ?auto_427270 ) ) ( not ( = ?auto_427264 ?auto_427271 ) ) ( not ( = ?auto_427264 ?auto_427272 ) ) ( not ( = ?auto_427264 ?auto_427273 ) ) ( not ( = ?auto_427264 ?auto_427274 ) ) ( not ( = ?auto_427264 ?auto_427275 ) ) ( not ( = ?auto_427264 ?auto_427276 ) ) ( not ( = ?auto_427264 ?auto_427277 ) ) ( not ( = ?auto_427264 ?auto_427278 ) ) ( not ( = ?auto_427265 ?auto_427266 ) ) ( not ( = ?auto_427265 ?auto_427267 ) ) ( not ( = ?auto_427265 ?auto_427268 ) ) ( not ( = ?auto_427265 ?auto_427269 ) ) ( not ( = ?auto_427265 ?auto_427270 ) ) ( not ( = ?auto_427265 ?auto_427271 ) ) ( not ( = ?auto_427265 ?auto_427272 ) ) ( not ( = ?auto_427265 ?auto_427273 ) ) ( not ( = ?auto_427265 ?auto_427274 ) ) ( not ( = ?auto_427265 ?auto_427275 ) ) ( not ( = ?auto_427265 ?auto_427276 ) ) ( not ( = ?auto_427265 ?auto_427277 ) ) ( not ( = ?auto_427265 ?auto_427278 ) ) ( not ( = ?auto_427266 ?auto_427267 ) ) ( not ( = ?auto_427266 ?auto_427268 ) ) ( not ( = ?auto_427266 ?auto_427269 ) ) ( not ( = ?auto_427266 ?auto_427270 ) ) ( not ( = ?auto_427266 ?auto_427271 ) ) ( not ( = ?auto_427266 ?auto_427272 ) ) ( not ( = ?auto_427266 ?auto_427273 ) ) ( not ( = ?auto_427266 ?auto_427274 ) ) ( not ( = ?auto_427266 ?auto_427275 ) ) ( not ( = ?auto_427266 ?auto_427276 ) ) ( not ( = ?auto_427266 ?auto_427277 ) ) ( not ( = ?auto_427266 ?auto_427278 ) ) ( not ( = ?auto_427267 ?auto_427268 ) ) ( not ( = ?auto_427267 ?auto_427269 ) ) ( not ( = ?auto_427267 ?auto_427270 ) ) ( not ( = ?auto_427267 ?auto_427271 ) ) ( not ( = ?auto_427267 ?auto_427272 ) ) ( not ( = ?auto_427267 ?auto_427273 ) ) ( not ( = ?auto_427267 ?auto_427274 ) ) ( not ( = ?auto_427267 ?auto_427275 ) ) ( not ( = ?auto_427267 ?auto_427276 ) ) ( not ( = ?auto_427267 ?auto_427277 ) ) ( not ( = ?auto_427267 ?auto_427278 ) ) ( not ( = ?auto_427268 ?auto_427269 ) ) ( not ( = ?auto_427268 ?auto_427270 ) ) ( not ( = ?auto_427268 ?auto_427271 ) ) ( not ( = ?auto_427268 ?auto_427272 ) ) ( not ( = ?auto_427268 ?auto_427273 ) ) ( not ( = ?auto_427268 ?auto_427274 ) ) ( not ( = ?auto_427268 ?auto_427275 ) ) ( not ( = ?auto_427268 ?auto_427276 ) ) ( not ( = ?auto_427268 ?auto_427277 ) ) ( not ( = ?auto_427268 ?auto_427278 ) ) ( not ( = ?auto_427269 ?auto_427270 ) ) ( not ( = ?auto_427269 ?auto_427271 ) ) ( not ( = ?auto_427269 ?auto_427272 ) ) ( not ( = ?auto_427269 ?auto_427273 ) ) ( not ( = ?auto_427269 ?auto_427274 ) ) ( not ( = ?auto_427269 ?auto_427275 ) ) ( not ( = ?auto_427269 ?auto_427276 ) ) ( not ( = ?auto_427269 ?auto_427277 ) ) ( not ( = ?auto_427269 ?auto_427278 ) ) ( not ( = ?auto_427270 ?auto_427271 ) ) ( not ( = ?auto_427270 ?auto_427272 ) ) ( not ( = ?auto_427270 ?auto_427273 ) ) ( not ( = ?auto_427270 ?auto_427274 ) ) ( not ( = ?auto_427270 ?auto_427275 ) ) ( not ( = ?auto_427270 ?auto_427276 ) ) ( not ( = ?auto_427270 ?auto_427277 ) ) ( not ( = ?auto_427270 ?auto_427278 ) ) ( not ( = ?auto_427271 ?auto_427272 ) ) ( not ( = ?auto_427271 ?auto_427273 ) ) ( not ( = ?auto_427271 ?auto_427274 ) ) ( not ( = ?auto_427271 ?auto_427275 ) ) ( not ( = ?auto_427271 ?auto_427276 ) ) ( not ( = ?auto_427271 ?auto_427277 ) ) ( not ( = ?auto_427271 ?auto_427278 ) ) ( not ( = ?auto_427272 ?auto_427273 ) ) ( not ( = ?auto_427272 ?auto_427274 ) ) ( not ( = ?auto_427272 ?auto_427275 ) ) ( not ( = ?auto_427272 ?auto_427276 ) ) ( not ( = ?auto_427272 ?auto_427277 ) ) ( not ( = ?auto_427272 ?auto_427278 ) ) ( not ( = ?auto_427273 ?auto_427274 ) ) ( not ( = ?auto_427273 ?auto_427275 ) ) ( not ( = ?auto_427273 ?auto_427276 ) ) ( not ( = ?auto_427273 ?auto_427277 ) ) ( not ( = ?auto_427273 ?auto_427278 ) ) ( not ( = ?auto_427274 ?auto_427275 ) ) ( not ( = ?auto_427274 ?auto_427276 ) ) ( not ( = ?auto_427274 ?auto_427277 ) ) ( not ( = ?auto_427274 ?auto_427278 ) ) ( not ( = ?auto_427275 ?auto_427276 ) ) ( not ( = ?auto_427275 ?auto_427277 ) ) ( not ( = ?auto_427275 ?auto_427278 ) ) ( not ( = ?auto_427276 ?auto_427277 ) ) ( not ( = ?auto_427276 ?auto_427278 ) ) ( not ( = ?auto_427277 ?auto_427278 ) ) ( ON ?auto_427276 ?auto_427277 ) ( ON ?auto_427275 ?auto_427276 ) ( ON ?auto_427274 ?auto_427275 ) ( ON ?auto_427273 ?auto_427274 ) ( ON ?auto_427272 ?auto_427273 ) ( ON ?auto_427271 ?auto_427272 ) ( ON ?auto_427270 ?auto_427271 ) ( ON ?auto_427269 ?auto_427270 ) ( ON ?auto_427268 ?auto_427269 ) ( CLEAR ?auto_427266 ) ( ON ?auto_427267 ?auto_427268 ) ( CLEAR ?auto_427267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_427264 ?auto_427265 ?auto_427266 ?auto_427267 )
      ( MAKE-14PILE ?auto_427264 ?auto_427265 ?auto_427266 ?auto_427267 ?auto_427268 ?auto_427269 ?auto_427270 ?auto_427271 ?auto_427272 ?auto_427273 ?auto_427274 ?auto_427275 ?auto_427276 ?auto_427277 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_427293 - BLOCK
      ?auto_427294 - BLOCK
      ?auto_427295 - BLOCK
      ?auto_427296 - BLOCK
      ?auto_427297 - BLOCK
      ?auto_427298 - BLOCK
      ?auto_427299 - BLOCK
      ?auto_427300 - BLOCK
      ?auto_427301 - BLOCK
      ?auto_427302 - BLOCK
      ?auto_427303 - BLOCK
      ?auto_427304 - BLOCK
      ?auto_427305 - BLOCK
      ?auto_427306 - BLOCK
    )
    :vars
    (
      ?auto_427307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_427306 ?auto_427307 ) ( ON-TABLE ?auto_427293 ) ( ON ?auto_427294 ?auto_427293 ) ( ON ?auto_427295 ?auto_427294 ) ( not ( = ?auto_427293 ?auto_427294 ) ) ( not ( = ?auto_427293 ?auto_427295 ) ) ( not ( = ?auto_427293 ?auto_427296 ) ) ( not ( = ?auto_427293 ?auto_427297 ) ) ( not ( = ?auto_427293 ?auto_427298 ) ) ( not ( = ?auto_427293 ?auto_427299 ) ) ( not ( = ?auto_427293 ?auto_427300 ) ) ( not ( = ?auto_427293 ?auto_427301 ) ) ( not ( = ?auto_427293 ?auto_427302 ) ) ( not ( = ?auto_427293 ?auto_427303 ) ) ( not ( = ?auto_427293 ?auto_427304 ) ) ( not ( = ?auto_427293 ?auto_427305 ) ) ( not ( = ?auto_427293 ?auto_427306 ) ) ( not ( = ?auto_427293 ?auto_427307 ) ) ( not ( = ?auto_427294 ?auto_427295 ) ) ( not ( = ?auto_427294 ?auto_427296 ) ) ( not ( = ?auto_427294 ?auto_427297 ) ) ( not ( = ?auto_427294 ?auto_427298 ) ) ( not ( = ?auto_427294 ?auto_427299 ) ) ( not ( = ?auto_427294 ?auto_427300 ) ) ( not ( = ?auto_427294 ?auto_427301 ) ) ( not ( = ?auto_427294 ?auto_427302 ) ) ( not ( = ?auto_427294 ?auto_427303 ) ) ( not ( = ?auto_427294 ?auto_427304 ) ) ( not ( = ?auto_427294 ?auto_427305 ) ) ( not ( = ?auto_427294 ?auto_427306 ) ) ( not ( = ?auto_427294 ?auto_427307 ) ) ( not ( = ?auto_427295 ?auto_427296 ) ) ( not ( = ?auto_427295 ?auto_427297 ) ) ( not ( = ?auto_427295 ?auto_427298 ) ) ( not ( = ?auto_427295 ?auto_427299 ) ) ( not ( = ?auto_427295 ?auto_427300 ) ) ( not ( = ?auto_427295 ?auto_427301 ) ) ( not ( = ?auto_427295 ?auto_427302 ) ) ( not ( = ?auto_427295 ?auto_427303 ) ) ( not ( = ?auto_427295 ?auto_427304 ) ) ( not ( = ?auto_427295 ?auto_427305 ) ) ( not ( = ?auto_427295 ?auto_427306 ) ) ( not ( = ?auto_427295 ?auto_427307 ) ) ( not ( = ?auto_427296 ?auto_427297 ) ) ( not ( = ?auto_427296 ?auto_427298 ) ) ( not ( = ?auto_427296 ?auto_427299 ) ) ( not ( = ?auto_427296 ?auto_427300 ) ) ( not ( = ?auto_427296 ?auto_427301 ) ) ( not ( = ?auto_427296 ?auto_427302 ) ) ( not ( = ?auto_427296 ?auto_427303 ) ) ( not ( = ?auto_427296 ?auto_427304 ) ) ( not ( = ?auto_427296 ?auto_427305 ) ) ( not ( = ?auto_427296 ?auto_427306 ) ) ( not ( = ?auto_427296 ?auto_427307 ) ) ( not ( = ?auto_427297 ?auto_427298 ) ) ( not ( = ?auto_427297 ?auto_427299 ) ) ( not ( = ?auto_427297 ?auto_427300 ) ) ( not ( = ?auto_427297 ?auto_427301 ) ) ( not ( = ?auto_427297 ?auto_427302 ) ) ( not ( = ?auto_427297 ?auto_427303 ) ) ( not ( = ?auto_427297 ?auto_427304 ) ) ( not ( = ?auto_427297 ?auto_427305 ) ) ( not ( = ?auto_427297 ?auto_427306 ) ) ( not ( = ?auto_427297 ?auto_427307 ) ) ( not ( = ?auto_427298 ?auto_427299 ) ) ( not ( = ?auto_427298 ?auto_427300 ) ) ( not ( = ?auto_427298 ?auto_427301 ) ) ( not ( = ?auto_427298 ?auto_427302 ) ) ( not ( = ?auto_427298 ?auto_427303 ) ) ( not ( = ?auto_427298 ?auto_427304 ) ) ( not ( = ?auto_427298 ?auto_427305 ) ) ( not ( = ?auto_427298 ?auto_427306 ) ) ( not ( = ?auto_427298 ?auto_427307 ) ) ( not ( = ?auto_427299 ?auto_427300 ) ) ( not ( = ?auto_427299 ?auto_427301 ) ) ( not ( = ?auto_427299 ?auto_427302 ) ) ( not ( = ?auto_427299 ?auto_427303 ) ) ( not ( = ?auto_427299 ?auto_427304 ) ) ( not ( = ?auto_427299 ?auto_427305 ) ) ( not ( = ?auto_427299 ?auto_427306 ) ) ( not ( = ?auto_427299 ?auto_427307 ) ) ( not ( = ?auto_427300 ?auto_427301 ) ) ( not ( = ?auto_427300 ?auto_427302 ) ) ( not ( = ?auto_427300 ?auto_427303 ) ) ( not ( = ?auto_427300 ?auto_427304 ) ) ( not ( = ?auto_427300 ?auto_427305 ) ) ( not ( = ?auto_427300 ?auto_427306 ) ) ( not ( = ?auto_427300 ?auto_427307 ) ) ( not ( = ?auto_427301 ?auto_427302 ) ) ( not ( = ?auto_427301 ?auto_427303 ) ) ( not ( = ?auto_427301 ?auto_427304 ) ) ( not ( = ?auto_427301 ?auto_427305 ) ) ( not ( = ?auto_427301 ?auto_427306 ) ) ( not ( = ?auto_427301 ?auto_427307 ) ) ( not ( = ?auto_427302 ?auto_427303 ) ) ( not ( = ?auto_427302 ?auto_427304 ) ) ( not ( = ?auto_427302 ?auto_427305 ) ) ( not ( = ?auto_427302 ?auto_427306 ) ) ( not ( = ?auto_427302 ?auto_427307 ) ) ( not ( = ?auto_427303 ?auto_427304 ) ) ( not ( = ?auto_427303 ?auto_427305 ) ) ( not ( = ?auto_427303 ?auto_427306 ) ) ( not ( = ?auto_427303 ?auto_427307 ) ) ( not ( = ?auto_427304 ?auto_427305 ) ) ( not ( = ?auto_427304 ?auto_427306 ) ) ( not ( = ?auto_427304 ?auto_427307 ) ) ( not ( = ?auto_427305 ?auto_427306 ) ) ( not ( = ?auto_427305 ?auto_427307 ) ) ( not ( = ?auto_427306 ?auto_427307 ) ) ( ON ?auto_427305 ?auto_427306 ) ( ON ?auto_427304 ?auto_427305 ) ( ON ?auto_427303 ?auto_427304 ) ( ON ?auto_427302 ?auto_427303 ) ( ON ?auto_427301 ?auto_427302 ) ( ON ?auto_427300 ?auto_427301 ) ( ON ?auto_427299 ?auto_427300 ) ( ON ?auto_427298 ?auto_427299 ) ( ON ?auto_427297 ?auto_427298 ) ( CLEAR ?auto_427295 ) ( ON ?auto_427296 ?auto_427297 ) ( CLEAR ?auto_427296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_427293 ?auto_427294 ?auto_427295 ?auto_427296 )
      ( MAKE-14PILE ?auto_427293 ?auto_427294 ?auto_427295 ?auto_427296 ?auto_427297 ?auto_427298 ?auto_427299 ?auto_427300 ?auto_427301 ?auto_427302 ?auto_427303 ?auto_427304 ?auto_427305 ?auto_427306 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_427322 - BLOCK
      ?auto_427323 - BLOCK
      ?auto_427324 - BLOCK
      ?auto_427325 - BLOCK
      ?auto_427326 - BLOCK
      ?auto_427327 - BLOCK
      ?auto_427328 - BLOCK
      ?auto_427329 - BLOCK
      ?auto_427330 - BLOCK
      ?auto_427331 - BLOCK
      ?auto_427332 - BLOCK
      ?auto_427333 - BLOCK
      ?auto_427334 - BLOCK
      ?auto_427335 - BLOCK
    )
    :vars
    (
      ?auto_427336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_427335 ?auto_427336 ) ( ON-TABLE ?auto_427322 ) ( ON ?auto_427323 ?auto_427322 ) ( not ( = ?auto_427322 ?auto_427323 ) ) ( not ( = ?auto_427322 ?auto_427324 ) ) ( not ( = ?auto_427322 ?auto_427325 ) ) ( not ( = ?auto_427322 ?auto_427326 ) ) ( not ( = ?auto_427322 ?auto_427327 ) ) ( not ( = ?auto_427322 ?auto_427328 ) ) ( not ( = ?auto_427322 ?auto_427329 ) ) ( not ( = ?auto_427322 ?auto_427330 ) ) ( not ( = ?auto_427322 ?auto_427331 ) ) ( not ( = ?auto_427322 ?auto_427332 ) ) ( not ( = ?auto_427322 ?auto_427333 ) ) ( not ( = ?auto_427322 ?auto_427334 ) ) ( not ( = ?auto_427322 ?auto_427335 ) ) ( not ( = ?auto_427322 ?auto_427336 ) ) ( not ( = ?auto_427323 ?auto_427324 ) ) ( not ( = ?auto_427323 ?auto_427325 ) ) ( not ( = ?auto_427323 ?auto_427326 ) ) ( not ( = ?auto_427323 ?auto_427327 ) ) ( not ( = ?auto_427323 ?auto_427328 ) ) ( not ( = ?auto_427323 ?auto_427329 ) ) ( not ( = ?auto_427323 ?auto_427330 ) ) ( not ( = ?auto_427323 ?auto_427331 ) ) ( not ( = ?auto_427323 ?auto_427332 ) ) ( not ( = ?auto_427323 ?auto_427333 ) ) ( not ( = ?auto_427323 ?auto_427334 ) ) ( not ( = ?auto_427323 ?auto_427335 ) ) ( not ( = ?auto_427323 ?auto_427336 ) ) ( not ( = ?auto_427324 ?auto_427325 ) ) ( not ( = ?auto_427324 ?auto_427326 ) ) ( not ( = ?auto_427324 ?auto_427327 ) ) ( not ( = ?auto_427324 ?auto_427328 ) ) ( not ( = ?auto_427324 ?auto_427329 ) ) ( not ( = ?auto_427324 ?auto_427330 ) ) ( not ( = ?auto_427324 ?auto_427331 ) ) ( not ( = ?auto_427324 ?auto_427332 ) ) ( not ( = ?auto_427324 ?auto_427333 ) ) ( not ( = ?auto_427324 ?auto_427334 ) ) ( not ( = ?auto_427324 ?auto_427335 ) ) ( not ( = ?auto_427324 ?auto_427336 ) ) ( not ( = ?auto_427325 ?auto_427326 ) ) ( not ( = ?auto_427325 ?auto_427327 ) ) ( not ( = ?auto_427325 ?auto_427328 ) ) ( not ( = ?auto_427325 ?auto_427329 ) ) ( not ( = ?auto_427325 ?auto_427330 ) ) ( not ( = ?auto_427325 ?auto_427331 ) ) ( not ( = ?auto_427325 ?auto_427332 ) ) ( not ( = ?auto_427325 ?auto_427333 ) ) ( not ( = ?auto_427325 ?auto_427334 ) ) ( not ( = ?auto_427325 ?auto_427335 ) ) ( not ( = ?auto_427325 ?auto_427336 ) ) ( not ( = ?auto_427326 ?auto_427327 ) ) ( not ( = ?auto_427326 ?auto_427328 ) ) ( not ( = ?auto_427326 ?auto_427329 ) ) ( not ( = ?auto_427326 ?auto_427330 ) ) ( not ( = ?auto_427326 ?auto_427331 ) ) ( not ( = ?auto_427326 ?auto_427332 ) ) ( not ( = ?auto_427326 ?auto_427333 ) ) ( not ( = ?auto_427326 ?auto_427334 ) ) ( not ( = ?auto_427326 ?auto_427335 ) ) ( not ( = ?auto_427326 ?auto_427336 ) ) ( not ( = ?auto_427327 ?auto_427328 ) ) ( not ( = ?auto_427327 ?auto_427329 ) ) ( not ( = ?auto_427327 ?auto_427330 ) ) ( not ( = ?auto_427327 ?auto_427331 ) ) ( not ( = ?auto_427327 ?auto_427332 ) ) ( not ( = ?auto_427327 ?auto_427333 ) ) ( not ( = ?auto_427327 ?auto_427334 ) ) ( not ( = ?auto_427327 ?auto_427335 ) ) ( not ( = ?auto_427327 ?auto_427336 ) ) ( not ( = ?auto_427328 ?auto_427329 ) ) ( not ( = ?auto_427328 ?auto_427330 ) ) ( not ( = ?auto_427328 ?auto_427331 ) ) ( not ( = ?auto_427328 ?auto_427332 ) ) ( not ( = ?auto_427328 ?auto_427333 ) ) ( not ( = ?auto_427328 ?auto_427334 ) ) ( not ( = ?auto_427328 ?auto_427335 ) ) ( not ( = ?auto_427328 ?auto_427336 ) ) ( not ( = ?auto_427329 ?auto_427330 ) ) ( not ( = ?auto_427329 ?auto_427331 ) ) ( not ( = ?auto_427329 ?auto_427332 ) ) ( not ( = ?auto_427329 ?auto_427333 ) ) ( not ( = ?auto_427329 ?auto_427334 ) ) ( not ( = ?auto_427329 ?auto_427335 ) ) ( not ( = ?auto_427329 ?auto_427336 ) ) ( not ( = ?auto_427330 ?auto_427331 ) ) ( not ( = ?auto_427330 ?auto_427332 ) ) ( not ( = ?auto_427330 ?auto_427333 ) ) ( not ( = ?auto_427330 ?auto_427334 ) ) ( not ( = ?auto_427330 ?auto_427335 ) ) ( not ( = ?auto_427330 ?auto_427336 ) ) ( not ( = ?auto_427331 ?auto_427332 ) ) ( not ( = ?auto_427331 ?auto_427333 ) ) ( not ( = ?auto_427331 ?auto_427334 ) ) ( not ( = ?auto_427331 ?auto_427335 ) ) ( not ( = ?auto_427331 ?auto_427336 ) ) ( not ( = ?auto_427332 ?auto_427333 ) ) ( not ( = ?auto_427332 ?auto_427334 ) ) ( not ( = ?auto_427332 ?auto_427335 ) ) ( not ( = ?auto_427332 ?auto_427336 ) ) ( not ( = ?auto_427333 ?auto_427334 ) ) ( not ( = ?auto_427333 ?auto_427335 ) ) ( not ( = ?auto_427333 ?auto_427336 ) ) ( not ( = ?auto_427334 ?auto_427335 ) ) ( not ( = ?auto_427334 ?auto_427336 ) ) ( not ( = ?auto_427335 ?auto_427336 ) ) ( ON ?auto_427334 ?auto_427335 ) ( ON ?auto_427333 ?auto_427334 ) ( ON ?auto_427332 ?auto_427333 ) ( ON ?auto_427331 ?auto_427332 ) ( ON ?auto_427330 ?auto_427331 ) ( ON ?auto_427329 ?auto_427330 ) ( ON ?auto_427328 ?auto_427329 ) ( ON ?auto_427327 ?auto_427328 ) ( ON ?auto_427326 ?auto_427327 ) ( ON ?auto_427325 ?auto_427326 ) ( CLEAR ?auto_427323 ) ( ON ?auto_427324 ?auto_427325 ) ( CLEAR ?auto_427324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_427322 ?auto_427323 ?auto_427324 )
      ( MAKE-14PILE ?auto_427322 ?auto_427323 ?auto_427324 ?auto_427325 ?auto_427326 ?auto_427327 ?auto_427328 ?auto_427329 ?auto_427330 ?auto_427331 ?auto_427332 ?auto_427333 ?auto_427334 ?auto_427335 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_427351 - BLOCK
      ?auto_427352 - BLOCK
      ?auto_427353 - BLOCK
      ?auto_427354 - BLOCK
      ?auto_427355 - BLOCK
      ?auto_427356 - BLOCK
      ?auto_427357 - BLOCK
      ?auto_427358 - BLOCK
      ?auto_427359 - BLOCK
      ?auto_427360 - BLOCK
      ?auto_427361 - BLOCK
      ?auto_427362 - BLOCK
      ?auto_427363 - BLOCK
      ?auto_427364 - BLOCK
    )
    :vars
    (
      ?auto_427365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_427364 ?auto_427365 ) ( ON-TABLE ?auto_427351 ) ( ON ?auto_427352 ?auto_427351 ) ( not ( = ?auto_427351 ?auto_427352 ) ) ( not ( = ?auto_427351 ?auto_427353 ) ) ( not ( = ?auto_427351 ?auto_427354 ) ) ( not ( = ?auto_427351 ?auto_427355 ) ) ( not ( = ?auto_427351 ?auto_427356 ) ) ( not ( = ?auto_427351 ?auto_427357 ) ) ( not ( = ?auto_427351 ?auto_427358 ) ) ( not ( = ?auto_427351 ?auto_427359 ) ) ( not ( = ?auto_427351 ?auto_427360 ) ) ( not ( = ?auto_427351 ?auto_427361 ) ) ( not ( = ?auto_427351 ?auto_427362 ) ) ( not ( = ?auto_427351 ?auto_427363 ) ) ( not ( = ?auto_427351 ?auto_427364 ) ) ( not ( = ?auto_427351 ?auto_427365 ) ) ( not ( = ?auto_427352 ?auto_427353 ) ) ( not ( = ?auto_427352 ?auto_427354 ) ) ( not ( = ?auto_427352 ?auto_427355 ) ) ( not ( = ?auto_427352 ?auto_427356 ) ) ( not ( = ?auto_427352 ?auto_427357 ) ) ( not ( = ?auto_427352 ?auto_427358 ) ) ( not ( = ?auto_427352 ?auto_427359 ) ) ( not ( = ?auto_427352 ?auto_427360 ) ) ( not ( = ?auto_427352 ?auto_427361 ) ) ( not ( = ?auto_427352 ?auto_427362 ) ) ( not ( = ?auto_427352 ?auto_427363 ) ) ( not ( = ?auto_427352 ?auto_427364 ) ) ( not ( = ?auto_427352 ?auto_427365 ) ) ( not ( = ?auto_427353 ?auto_427354 ) ) ( not ( = ?auto_427353 ?auto_427355 ) ) ( not ( = ?auto_427353 ?auto_427356 ) ) ( not ( = ?auto_427353 ?auto_427357 ) ) ( not ( = ?auto_427353 ?auto_427358 ) ) ( not ( = ?auto_427353 ?auto_427359 ) ) ( not ( = ?auto_427353 ?auto_427360 ) ) ( not ( = ?auto_427353 ?auto_427361 ) ) ( not ( = ?auto_427353 ?auto_427362 ) ) ( not ( = ?auto_427353 ?auto_427363 ) ) ( not ( = ?auto_427353 ?auto_427364 ) ) ( not ( = ?auto_427353 ?auto_427365 ) ) ( not ( = ?auto_427354 ?auto_427355 ) ) ( not ( = ?auto_427354 ?auto_427356 ) ) ( not ( = ?auto_427354 ?auto_427357 ) ) ( not ( = ?auto_427354 ?auto_427358 ) ) ( not ( = ?auto_427354 ?auto_427359 ) ) ( not ( = ?auto_427354 ?auto_427360 ) ) ( not ( = ?auto_427354 ?auto_427361 ) ) ( not ( = ?auto_427354 ?auto_427362 ) ) ( not ( = ?auto_427354 ?auto_427363 ) ) ( not ( = ?auto_427354 ?auto_427364 ) ) ( not ( = ?auto_427354 ?auto_427365 ) ) ( not ( = ?auto_427355 ?auto_427356 ) ) ( not ( = ?auto_427355 ?auto_427357 ) ) ( not ( = ?auto_427355 ?auto_427358 ) ) ( not ( = ?auto_427355 ?auto_427359 ) ) ( not ( = ?auto_427355 ?auto_427360 ) ) ( not ( = ?auto_427355 ?auto_427361 ) ) ( not ( = ?auto_427355 ?auto_427362 ) ) ( not ( = ?auto_427355 ?auto_427363 ) ) ( not ( = ?auto_427355 ?auto_427364 ) ) ( not ( = ?auto_427355 ?auto_427365 ) ) ( not ( = ?auto_427356 ?auto_427357 ) ) ( not ( = ?auto_427356 ?auto_427358 ) ) ( not ( = ?auto_427356 ?auto_427359 ) ) ( not ( = ?auto_427356 ?auto_427360 ) ) ( not ( = ?auto_427356 ?auto_427361 ) ) ( not ( = ?auto_427356 ?auto_427362 ) ) ( not ( = ?auto_427356 ?auto_427363 ) ) ( not ( = ?auto_427356 ?auto_427364 ) ) ( not ( = ?auto_427356 ?auto_427365 ) ) ( not ( = ?auto_427357 ?auto_427358 ) ) ( not ( = ?auto_427357 ?auto_427359 ) ) ( not ( = ?auto_427357 ?auto_427360 ) ) ( not ( = ?auto_427357 ?auto_427361 ) ) ( not ( = ?auto_427357 ?auto_427362 ) ) ( not ( = ?auto_427357 ?auto_427363 ) ) ( not ( = ?auto_427357 ?auto_427364 ) ) ( not ( = ?auto_427357 ?auto_427365 ) ) ( not ( = ?auto_427358 ?auto_427359 ) ) ( not ( = ?auto_427358 ?auto_427360 ) ) ( not ( = ?auto_427358 ?auto_427361 ) ) ( not ( = ?auto_427358 ?auto_427362 ) ) ( not ( = ?auto_427358 ?auto_427363 ) ) ( not ( = ?auto_427358 ?auto_427364 ) ) ( not ( = ?auto_427358 ?auto_427365 ) ) ( not ( = ?auto_427359 ?auto_427360 ) ) ( not ( = ?auto_427359 ?auto_427361 ) ) ( not ( = ?auto_427359 ?auto_427362 ) ) ( not ( = ?auto_427359 ?auto_427363 ) ) ( not ( = ?auto_427359 ?auto_427364 ) ) ( not ( = ?auto_427359 ?auto_427365 ) ) ( not ( = ?auto_427360 ?auto_427361 ) ) ( not ( = ?auto_427360 ?auto_427362 ) ) ( not ( = ?auto_427360 ?auto_427363 ) ) ( not ( = ?auto_427360 ?auto_427364 ) ) ( not ( = ?auto_427360 ?auto_427365 ) ) ( not ( = ?auto_427361 ?auto_427362 ) ) ( not ( = ?auto_427361 ?auto_427363 ) ) ( not ( = ?auto_427361 ?auto_427364 ) ) ( not ( = ?auto_427361 ?auto_427365 ) ) ( not ( = ?auto_427362 ?auto_427363 ) ) ( not ( = ?auto_427362 ?auto_427364 ) ) ( not ( = ?auto_427362 ?auto_427365 ) ) ( not ( = ?auto_427363 ?auto_427364 ) ) ( not ( = ?auto_427363 ?auto_427365 ) ) ( not ( = ?auto_427364 ?auto_427365 ) ) ( ON ?auto_427363 ?auto_427364 ) ( ON ?auto_427362 ?auto_427363 ) ( ON ?auto_427361 ?auto_427362 ) ( ON ?auto_427360 ?auto_427361 ) ( ON ?auto_427359 ?auto_427360 ) ( ON ?auto_427358 ?auto_427359 ) ( ON ?auto_427357 ?auto_427358 ) ( ON ?auto_427356 ?auto_427357 ) ( ON ?auto_427355 ?auto_427356 ) ( ON ?auto_427354 ?auto_427355 ) ( CLEAR ?auto_427352 ) ( ON ?auto_427353 ?auto_427354 ) ( CLEAR ?auto_427353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_427351 ?auto_427352 ?auto_427353 )
      ( MAKE-14PILE ?auto_427351 ?auto_427352 ?auto_427353 ?auto_427354 ?auto_427355 ?auto_427356 ?auto_427357 ?auto_427358 ?auto_427359 ?auto_427360 ?auto_427361 ?auto_427362 ?auto_427363 ?auto_427364 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_427380 - BLOCK
      ?auto_427381 - BLOCK
      ?auto_427382 - BLOCK
      ?auto_427383 - BLOCK
      ?auto_427384 - BLOCK
      ?auto_427385 - BLOCK
      ?auto_427386 - BLOCK
      ?auto_427387 - BLOCK
      ?auto_427388 - BLOCK
      ?auto_427389 - BLOCK
      ?auto_427390 - BLOCK
      ?auto_427391 - BLOCK
      ?auto_427392 - BLOCK
      ?auto_427393 - BLOCK
    )
    :vars
    (
      ?auto_427394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_427393 ?auto_427394 ) ( ON-TABLE ?auto_427380 ) ( not ( = ?auto_427380 ?auto_427381 ) ) ( not ( = ?auto_427380 ?auto_427382 ) ) ( not ( = ?auto_427380 ?auto_427383 ) ) ( not ( = ?auto_427380 ?auto_427384 ) ) ( not ( = ?auto_427380 ?auto_427385 ) ) ( not ( = ?auto_427380 ?auto_427386 ) ) ( not ( = ?auto_427380 ?auto_427387 ) ) ( not ( = ?auto_427380 ?auto_427388 ) ) ( not ( = ?auto_427380 ?auto_427389 ) ) ( not ( = ?auto_427380 ?auto_427390 ) ) ( not ( = ?auto_427380 ?auto_427391 ) ) ( not ( = ?auto_427380 ?auto_427392 ) ) ( not ( = ?auto_427380 ?auto_427393 ) ) ( not ( = ?auto_427380 ?auto_427394 ) ) ( not ( = ?auto_427381 ?auto_427382 ) ) ( not ( = ?auto_427381 ?auto_427383 ) ) ( not ( = ?auto_427381 ?auto_427384 ) ) ( not ( = ?auto_427381 ?auto_427385 ) ) ( not ( = ?auto_427381 ?auto_427386 ) ) ( not ( = ?auto_427381 ?auto_427387 ) ) ( not ( = ?auto_427381 ?auto_427388 ) ) ( not ( = ?auto_427381 ?auto_427389 ) ) ( not ( = ?auto_427381 ?auto_427390 ) ) ( not ( = ?auto_427381 ?auto_427391 ) ) ( not ( = ?auto_427381 ?auto_427392 ) ) ( not ( = ?auto_427381 ?auto_427393 ) ) ( not ( = ?auto_427381 ?auto_427394 ) ) ( not ( = ?auto_427382 ?auto_427383 ) ) ( not ( = ?auto_427382 ?auto_427384 ) ) ( not ( = ?auto_427382 ?auto_427385 ) ) ( not ( = ?auto_427382 ?auto_427386 ) ) ( not ( = ?auto_427382 ?auto_427387 ) ) ( not ( = ?auto_427382 ?auto_427388 ) ) ( not ( = ?auto_427382 ?auto_427389 ) ) ( not ( = ?auto_427382 ?auto_427390 ) ) ( not ( = ?auto_427382 ?auto_427391 ) ) ( not ( = ?auto_427382 ?auto_427392 ) ) ( not ( = ?auto_427382 ?auto_427393 ) ) ( not ( = ?auto_427382 ?auto_427394 ) ) ( not ( = ?auto_427383 ?auto_427384 ) ) ( not ( = ?auto_427383 ?auto_427385 ) ) ( not ( = ?auto_427383 ?auto_427386 ) ) ( not ( = ?auto_427383 ?auto_427387 ) ) ( not ( = ?auto_427383 ?auto_427388 ) ) ( not ( = ?auto_427383 ?auto_427389 ) ) ( not ( = ?auto_427383 ?auto_427390 ) ) ( not ( = ?auto_427383 ?auto_427391 ) ) ( not ( = ?auto_427383 ?auto_427392 ) ) ( not ( = ?auto_427383 ?auto_427393 ) ) ( not ( = ?auto_427383 ?auto_427394 ) ) ( not ( = ?auto_427384 ?auto_427385 ) ) ( not ( = ?auto_427384 ?auto_427386 ) ) ( not ( = ?auto_427384 ?auto_427387 ) ) ( not ( = ?auto_427384 ?auto_427388 ) ) ( not ( = ?auto_427384 ?auto_427389 ) ) ( not ( = ?auto_427384 ?auto_427390 ) ) ( not ( = ?auto_427384 ?auto_427391 ) ) ( not ( = ?auto_427384 ?auto_427392 ) ) ( not ( = ?auto_427384 ?auto_427393 ) ) ( not ( = ?auto_427384 ?auto_427394 ) ) ( not ( = ?auto_427385 ?auto_427386 ) ) ( not ( = ?auto_427385 ?auto_427387 ) ) ( not ( = ?auto_427385 ?auto_427388 ) ) ( not ( = ?auto_427385 ?auto_427389 ) ) ( not ( = ?auto_427385 ?auto_427390 ) ) ( not ( = ?auto_427385 ?auto_427391 ) ) ( not ( = ?auto_427385 ?auto_427392 ) ) ( not ( = ?auto_427385 ?auto_427393 ) ) ( not ( = ?auto_427385 ?auto_427394 ) ) ( not ( = ?auto_427386 ?auto_427387 ) ) ( not ( = ?auto_427386 ?auto_427388 ) ) ( not ( = ?auto_427386 ?auto_427389 ) ) ( not ( = ?auto_427386 ?auto_427390 ) ) ( not ( = ?auto_427386 ?auto_427391 ) ) ( not ( = ?auto_427386 ?auto_427392 ) ) ( not ( = ?auto_427386 ?auto_427393 ) ) ( not ( = ?auto_427386 ?auto_427394 ) ) ( not ( = ?auto_427387 ?auto_427388 ) ) ( not ( = ?auto_427387 ?auto_427389 ) ) ( not ( = ?auto_427387 ?auto_427390 ) ) ( not ( = ?auto_427387 ?auto_427391 ) ) ( not ( = ?auto_427387 ?auto_427392 ) ) ( not ( = ?auto_427387 ?auto_427393 ) ) ( not ( = ?auto_427387 ?auto_427394 ) ) ( not ( = ?auto_427388 ?auto_427389 ) ) ( not ( = ?auto_427388 ?auto_427390 ) ) ( not ( = ?auto_427388 ?auto_427391 ) ) ( not ( = ?auto_427388 ?auto_427392 ) ) ( not ( = ?auto_427388 ?auto_427393 ) ) ( not ( = ?auto_427388 ?auto_427394 ) ) ( not ( = ?auto_427389 ?auto_427390 ) ) ( not ( = ?auto_427389 ?auto_427391 ) ) ( not ( = ?auto_427389 ?auto_427392 ) ) ( not ( = ?auto_427389 ?auto_427393 ) ) ( not ( = ?auto_427389 ?auto_427394 ) ) ( not ( = ?auto_427390 ?auto_427391 ) ) ( not ( = ?auto_427390 ?auto_427392 ) ) ( not ( = ?auto_427390 ?auto_427393 ) ) ( not ( = ?auto_427390 ?auto_427394 ) ) ( not ( = ?auto_427391 ?auto_427392 ) ) ( not ( = ?auto_427391 ?auto_427393 ) ) ( not ( = ?auto_427391 ?auto_427394 ) ) ( not ( = ?auto_427392 ?auto_427393 ) ) ( not ( = ?auto_427392 ?auto_427394 ) ) ( not ( = ?auto_427393 ?auto_427394 ) ) ( ON ?auto_427392 ?auto_427393 ) ( ON ?auto_427391 ?auto_427392 ) ( ON ?auto_427390 ?auto_427391 ) ( ON ?auto_427389 ?auto_427390 ) ( ON ?auto_427388 ?auto_427389 ) ( ON ?auto_427387 ?auto_427388 ) ( ON ?auto_427386 ?auto_427387 ) ( ON ?auto_427385 ?auto_427386 ) ( ON ?auto_427384 ?auto_427385 ) ( ON ?auto_427383 ?auto_427384 ) ( ON ?auto_427382 ?auto_427383 ) ( CLEAR ?auto_427380 ) ( ON ?auto_427381 ?auto_427382 ) ( CLEAR ?auto_427381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_427380 ?auto_427381 )
      ( MAKE-14PILE ?auto_427380 ?auto_427381 ?auto_427382 ?auto_427383 ?auto_427384 ?auto_427385 ?auto_427386 ?auto_427387 ?auto_427388 ?auto_427389 ?auto_427390 ?auto_427391 ?auto_427392 ?auto_427393 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_427409 - BLOCK
      ?auto_427410 - BLOCK
      ?auto_427411 - BLOCK
      ?auto_427412 - BLOCK
      ?auto_427413 - BLOCK
      ?auto_427414 - BLOCK
      ?auto_427415 - BLOCK
      ?auto_427416 - BLOCK
      ?auto_427417 - BLOCK
      ?auto_427418 - BLOCK
      ?auto_427419 - BLOCK
      ?auto_427420 - BLOCK
      ?auto_427421 - BLOCK
      ?auto_427422 - BLOCK
    )
    :vars
    (
      ?auto_427423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_427422 ?auto_427423 ) ( ON-TABLE ?auto_427409 ) ( not ( = ?auto_427409 ?auto_427410 ) ) ( not ( = ?auto_427409 ?auto_427411 ) ) ( not ( = ?auto_427409 ?auto_427412 ) ) ( not ( = ?auto_427409 ?auto_427413 ) ) ( not ( = ?auto_427409 ?auto_427414 ) ) ( not ( = ?auto_427409 ?auto_427415 ) ) ( not ( = ?auto_427409 ?auto_427416 ) ) ( not ( = ?auto_427409 ?auto_427417 ) ) ( not ( = ?auto_427409 ?auto_427418 ) ) ( not ( = ?auto_427409 ?auto_427419 ) ) ( not ( = ?auto_427409 ?auto_427420 ) ) ( not ( = ?auto_427409 ?auto_427421 ) ) ( not ( = ?auto_427409 ?auto_427422 ) ) ( not ( = ?auto_427409 ?auto_427423 ) ) ( not ( = ?auto_427410 ?auto_427411 ) ) ( not ( = ?auto_427410 ?auto_427412 ) ) ( not ( = ?auto_427410 ?auto_427413 ) ) ( not ( = ?auto_427410 ?auto_427414 ) ) ( not ( = ?auto_427410 ?auto_427415 ) ) ( not ( = ?auto_427410 ?auto_427416 ) ) ( not ( = ?auto_427410 ?auto_427417 ) ) ( not ( = ?auto_427410 ?auto_427418 ) ) ( not ( = ?auto_427410 ?auto_427419 ) ) ( not ( = ?auto_427410 ?auto_427420 ) ) ( not ( = ?auto_427410 ?auto_427421 ) ) ( not ( = ?auto_427410 ?auto_427422 ) ) ( not ( = ?auto_427410 ?auto_427423 ) ) ( not ( = ?auto_427411 ?auto_427412 ) ) ( not ( = ?auto_427411 ?auto_427413 ) ) ( not ( = ?auto_427411 ?auto_427414 ) ) ( not ( = ?auto_427411 ?auto_427415 ) ) ( not ( = ?auto_427411 ?auto_427416 ) ) ( not ( = ?auto_427411 ?auto_427417 ) ) ( not ( = ?auto_427411 ?auto_427418 ) ) ( not ( = ?auto_427411 ?auto_427419 ) ) ( not ( = ?auto_427411 ?auto_427420 ) ) ( not ( = ?auto_427411 ?auto_427421 ) ) ( not ( = ?auto_427411 ?auto_427422 ) ) ( not ( = ?auto_427411 ?auto_427423 ) ) ( not ( = ?auto_427412 ?auto_427413 ) ) ( not ( = ?auto_427412 ?auto_427414 ) ) ( not ( = ?auto_427412 ?auto_427415 ) ) ( not ( = ?auto_427412 ?auto_427416 ) ) ( not ( = ?auto_427412 ?auto_427417 ) ) ( not ( = ?auto_427412 ?auto_427418 ) ) ( not ( = ?auto_427412 ?auto_427419 ) ) ( not ( = ?auto_427412 ?auto_427420 ) ) ( not ( = ?auto_427412 ?auto_427421 ) ) ( not ( = ?auto_427412 ?auto_427422 ) ) ( not ( = ?auto_427412 ?auto_427423 ) ) ( not ( = ?auto_427413 ?auto_427414 ) ) ( not ( = ?auto_427413 ?auto_427415 ) ) ( not ( = ?auto_427413 ?auto_427416 ) ) ( not ( = ?auto_427413 ?auto_427417 ) ) ( not ( = ?auto_427413 ?auto_427418 ) ) ( not ( = ?auto_427413 ?auto_427419 ) ) ( not ( = ?auto_427413 ?auto_427420 ) ) ( not ( = ?auto_427413 ?auto_427421 ) ) ( not ( = ?auto_427413 ?auto_427422 ) ) ( not ( = ?auto_427413 ?auto_427423 ) ) ( not ( = ?auto_427414 ?auto_427415 ) ) ( not ( = ?auto_427414 ?auto_427416 ) ) ( not ( = ?auto_427414 ?auto_427417 ) ) ( not ( = ?auto_427414 ?auto_427418 ) ) ( not ( = ?auto_427414 ?auto_427419 ) ) ( not ( = ?auto_427414 ?auto_427420 ) ) ( not ( = ?auto_427414 ?auto_427421 ) ) ( not ( = ?auto_427414 ?auto_427422 ) ) ( not ( = ?auto_427414 ?auto_427423 ) ) ( not ( = ?auto_427415 ?auto_427416 ) ) ( not ( = ?auto_427415 ?auto_427417 ) ) ( not ( = ?auto_427415 ?auto_427418 ) ) ( not ( = ?auto_427415 ?auto_427419 ) ) ( not ( = ?auto_427415 ?auto_427420 ) ) ( not ( = ?auto_427415 ?auto_427421 ) ) ( not ( = ?auto_427415 ?auto_427422 ) ) ( not ( = ?auto_427415 ?auto_427423 ) ) ( not ( = ?auto_427416 ?auto_427417 ) ) ( not ( = ?auto_427416 ?auto_427418 ) ) ( not ( = ?auto_427416 ?auto_427419 ) ) ( not ( = ?auto_427416 ?auto_427420 ) ) ( not ( = ?auto_427416 ?auto_427421 ) ) ( not ( = ?auto_427416 ?auto_427422 ) ) ( not ( = ?auto_427416 ?auto_427423 ) ) ( not ( = ?auto_427417 ?auto_427418 ) ) ( not ( = ?auto_427417 ?auto_427419 ) ) ( not ( = ?auto_427417 ?auto_427420 ) ) ( not ( = ?auto_427417 ?auto_427421 ) ) ( not ( = ?auto_427417 ?auto_427422 ) ) ( not ( = ?auto_427417 ?auto_427423 ) ) ( not ( = ?auto_427418 ?auto_427419 ) ) ( not ( = ?auto_427418 ?auto_427420 ) ) ( not ( = ?auto_427418 ?auto_427421 ) ) ( not ( = ?auto_427418 ?auto_427422 ) ) ( not ( = ?auto_427418 ?auto_427423 ) ) ( not ( = ?auto_427419 ?auto_427420 ) ) ( not ( = ?auto_427419 ?auto_427421 ) ) ( not ( = ?auto_427419 ?auto_427422 ) ) ( not ( = ?auto_427419 ?auto_427423 ) ) ( not ( = ?auto_427420 ?auto_427421 ) ) ( not ( = ?auto_427420 ?auto_427422 ) ) ( not ( = ?auto_427420 ?auto_427423 ) ) ( not ( = ?auto_427421 ?auto_427422 ) ) ( not ( = ?auto_427421 ?auto_427423 ) ) ( not ( = ?auto_427422 ?auto_427423 ) ) ( ON ?auto_427421 ?auto_427422 ) ( ON ?auto_427420 ?auto_427421 ) ( ON ?auto_427419 ?auto_427420 ) ( ON ?auto_427418 ?auto_427419 ) ( ON ?auto_427417 ?auto_427418 ) ( ON ?auto_427416 ?auto_427417 ) ( ON ?auto_427415 ?auto_427416 ) ( ON ?auto_427414 ?auto_427415 ) ( ON ?auto_427413 ?auto_427414 ) ( ON ?auto_427412 ?auto_427413 ) ( ON ?auto_427411 ?auto_427412 ) ( CLEAR ?auto_427409 ) ( ON ?auto_427410 ?auto_427411 ) ( CLEAR ?auto_427410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_427409 ?auto_427410 )
      ( MAKE-14PILE ?auto_427409 ?auto_427410 ?auto_427411 ?auto_427412 ?auto_427413 ?auto_427414 ?auto_427415 ?auto_427416 ?auto_427417 ?auto_427418 ?auto_427419 ?auto_427420 ?auto_427421 ?auto_427422 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_427438 - BLOCK
      ?auto_427439 - BLOCK
      ?auto_427440 - BLOCK
      ?auto_427441 - BLOCK
      ?auto_427442 - BLOCK
      ?auto_427443 - BLOCK
      ?auto_427444 - BLOCK
      ?auto_427445 - BLOCK
      ?auto_427446 - BLOCK
      ?auto_427447 - BLOCK
      ?auto_427448 - BLOCK
      ?auto_427449 - BLOCK
      ?auto_427450 - BLOCK
      ?auto_427451 - BLOCK
    )
    :vars
    (
      ?auto_427452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_427451 ?auto_427452 ) ( not ( = ?auto_427438 ?auto_427439 ) ) ( not ( = ?auto_427438 ?auto_427440 ) ) ( not ( = ?auto_427438 ?auto_427441 ) ) ( not ( = ?auto_427438 ?auto_427442 ) ) ( not ( = ?auto_427438 ?auto_427443 ) ) ( not ( = ?auto_427438 ?auto_427444 ) ) ( not ( = ?auto_427438 ?auto_427445 ) ) ( not ( = ?auto_427438 ?auto_427446 ) ) ( not ( = ?auto_427438 ?auto_427447 ) ) ( not ( = ?auto_427438 ?auto_427448 ) ) ( not ( = ?auto_427438 ?auto_427449 ) ) ( not ( = ?auto_427438 ?auto_427450 ) ) ( not ( = ?auto_427438 ?auto_427451 ) ) ( not ( = ?auto_427438 ?auto_427452 ) ) ( not ( = ?auto_427439 ?auto_427440 ) ) ( not ( = ?auto_427439 ?auto_427441 ) ) ( not ( = ?auto_427439 ?auto_427442 ) ) ( not ( = ?auto_427439 ?auto_427443 ) ) ( not ( = ?auto_427439 ?auto_427444 ) ) ( not ( = ?auto_427439 ?auto_427445 ) ) ( not ( = ?auto_427439 ?auto_427446 ) ) ( not ( = ?auto_427439 ?auto_427447 ) ) ( not ( = ?auto_427439 ?auto_427448 ) ) ( not ( = ?auto_427439 ?auto_427449 ) ) ( not ( = ?auto_427439 ?auto_427450 ) ) ( not ( = ?auto_427439 ?auto_427451 ) ) ( not ( = ?auto_427439 ?auto_427452 ) ) ( not ( = ?auto_427440 ?auto_427441 ) ) ( not ( = ?auto_427440 ?auto_427442 ) ) ( not ( = ?auto_427440 ?auto_427443 ) ) ( not ( = ?auto_427440 ?auto_427444 ) ) ( not ( = ?auto_427440 ?auto_427445 ) ) ( not ( = ?auto_427440 ?auto_427446 ) ) ( not ( = ?auto_427440 ?auto_427447 ) ) ( not ( = ?auto_427440 ?auto_427448 ) ) ( not ( = ?auto_427440 ?auto_427449 ) ) ( not ( = ?auto_427440 ?auto_427450 ) ) ( not ( = ?auto_427440 ?auto_427451 ) ) ( not ( = ?auto_427440 ?auto_427452 ) ) ( not ( = ?auto_427441 ?auto_427442 ) ) ( not ( = ?auto_427441 ?auto_427443 ) ) ( not ( = ?auto_427441 ?auto_427444 ) ) ( not ( = ?auto_427441 ?auto_427445 ) ) ( not ( = ?auto_427441 ?auto_427446 ) ) ( not ( = ?auto_427441 ?auto_427447 ) ) ( not ( = ?auto_427441 ?auto_427448 ) ) ( not ( = ?auto_427441 ?auto_427449 ) ) ( not ( = ?auto_427441 ?auto_427450 ) ) ( not ( = ?auto_427441 ?auto_427451 ) ) ( not ( = ?auto_427441 ?auto_427452 ) ) ( not ( = ?auto_427442 ?auto_427443 ) ) ( not ( = ?auto_427442 ?auto_427444 ) ) ( not ( = ?auto_427442 ?auto_427445 ) ) ( not ( = ?auto_427442 ?auto_427446 ) ) ( not ( = ?auto_427442 ?auto_427447 ) ) ( not ( = ?auto_427442 ?auto_427448 ) ) ( not ( = ?auto_427442 ?auto_427449 ) ) ( not ( = ?auto_427442 ?auto_427450 ) ) ( not ( = ?auto_427442 ?auto_427451 ) ) ( not ( = ?auto_427442 ?auto_427452 ) ) ( not ( = ?auto_427443 ?auto_427444 ) ) ( not ( = ?auto_427443 ?auto_427445 ) ) ( not ( = ?auto_427443 ?auto_427446 ) ) ( not ( = ?auto_427443 ?auto_427447 ) ) ( not ( = ?auto_427443 ?auto_427448 ) ) ( not ( = ?auto_427443 ?auto_427449 ) ) ( not ( = ?auto_427443 ?auto_427450 ) ) ( not ( = ?auto_427443 ?auto_427451 ) ) ( not ( = ?auto_427443 ?auto_427452 ) ) ( not ( = ?auto_427444 ?auto_427445 ) ) ( not ( = ?auto_427444 ?auto_427446 ) ) ( not ( = ?auto_427444 ?auto_427447 ) ) ( not ( = ?auto_427444 ?auto_427448 ) ) ( not ( = ?auto_427444 ?auto_427449 ) ) ( not ( = ?auto_427444 ?auto_427450 ) ) ( not ( = ?auto_427444 ?auto_427451 ) ) ( not ( = ?auto_427444 ?auto_427452 ) ) ( not ( = ?auto_427445 ?auto_427446 ) ) ( not ( = ?auto_427445 ?auto_427447 ) ) ( not ( = ?auto_427445 ?auto_427448 ) ) ( not ( = ?auto_427445 ?auto_427449 ) ) ( not ( = ?auto_427445 ?auto_427450 ) ) ( not ( = ?auto_427445 ?auto_427451 ) ) ( not ( = ?auto_427445 ?auto_427452 ) ) ( not ( = ?auto_427446 ?auto_427447 ) ) ( not ( = ?auto_427446 ?auto_427448 ) ) ( not ( = ?auto_427446 ?auto_427449 ) ) ( not ( = ?auto_427446 ?auto_427450 ) ) ( not ( = ?auto_427446 ?auto_427451 ) ) ( not ( = ?auto_427446 ?auto_427452 ) ) ( not ( = ?auto_427447 ?auto_427448 ) ) ( not ( = ?auto_427447 ?auto_427449 ) ) ( not ( = ?auto_427447 ?auto_427450 ) ) ( not ( = ?auto_427447 ?auto_427451 ) ) ( not ( = ?auto_427447 ?auto_427452 ) ) ( not ( = ?auto_427448 ?auto_427449 ) ) ( not ( = ?auto_427448 ?auto_427450 ) ) ( not ( = ?auto_427448 ?auto_427451 ) ) ( not ( = ?auto_427448 ?auto_427452 ) ) ( not ( = ?auto_427449 ?auto_427450 ) ) ( not ( = ?auto_427449 ?auto_427451 ) ) ( not ( = ?auto_427449 ?auto_427452 ) ) ( not ( = ?auto_427450 ?auto_427451 ) ) ( not ( = ?auto_427450 ?auto_427452 ) ) ( not ( = ?auto_427451 ?auto_427452 ) ) ( ON ?auto_427450 ?auto_427451 ) ( ON ?auto_427449 ?auto_427450 ) ( ON ?auto_427448 ?auto_427449 ) ( ON ?auto_427447 ?auto_427448 ) ( ON ?auto_427446 ?auto_427447 ) ( ON ?auto_427445 ?auto_427446 ) ( ON ?auto_427444 ?auto_427445 ) ( ON ?auto_427443 ?auto_427444 ) ( ON ?auto_427442 ?auto_427443 ) ( ON ?auto_427441 ?auto_427442 ) ( ON ?auto_427440 ?auto_427441 ) ( ON ?auto_427439 ?auto_427440 ) ( ON ?auto_427438 ?auto_427439 ) ( CLEAR ?auto_427438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_427438 )
      ( MAKE-14PILE ?auto_427438 ?auto_427439 ?auto_427440 ?auto_427441 ?auto_427442 ?auto_427443 ?auto_427444 ?auto_427445 ?auto_427446 ?auto_427447 ?auto_427448 ?auto_427449 ?auto_427450 ?auto_427451 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_427467 - BLOCK
      ?auto_427468 - BLOCK
      ?auto_427469 - BLOCK
      ?auto_427470 - BLOCK
      ?auto_427471 - BLOCK
      ?auto_427472 - BLOCK
      ?auto_427473 - BLOCK
      ?auto_427474 - BLOCK
      ?auto_427475 - BLOCK
      ?auto_427476 - BLOCK
      ?auto_427477 - BLOCK
      ?auto_427478 - BLOCK
      ?auto_427479 - BLOCK
      ?auto_427480 - BLOCK
    )
    :vars
    (
      ?auto_427481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_427480 ?auto_427481 ) ( not ( = ?auto_427467 ?auto_427468 ) ) ( not ( = ?auto_427467 ?auto_427469 ) ) ( not ( = ?auto_427467 ?auto_427470 ) ) ( not ( = ?auto_427467 ?auto_427471 ) ) ( not ( = ?auto_427467 ?auto_427472 ) ) ( not ( = ?auto_427467 ?auto_427473 ) ) ( not ( = ?auto_427467 ?auto_427474 ) ) ( not ( = ?auto_427467 ?auto_427475 ) ) ( not ( = ?auto_427467 ?auto_427476 ) ) ( not ( = ?auto_427467 ?auto_427477 ) ) ( not ( = ?auto_427467 ?auto_427478 ) ) ( not ( = ?auto_427467 ?auto_427479 ) ) ( not ( = ?auto_427467 ?auto_427480 ) ) ( not ( = ?auto_427467 ?auto_427481 ) ) ( not ( = ?auto_427468 ?auto_427469 ) ) ( not ( = ?auto_427468 ?auto_427470 ) ) ( not ( = ?auto_427468 ?auto_427471 ) ) ( not ( = ?auto_427468 ?auto_427472 ) ) ( not ( = ?auto_427468 ?auto_427473 ) ) ( not ( = ?auto_427468 ?auto_427474 ) ) ( not ( = ?auto_427468 ?auto_427475 ) ) ( not ( = ?auto_427468 ?auto_427476 ) ) ( not ( = ?auto_427468 ?auto_427477 ) ) ( not ( = ?auto_427468 ?auto_427478 ) ) ( not ( = ?auto_427468 ?auto_427479 ) ) ( not ( = ?auto_427468 ?auto_427480 ) ) ( not ( = ?auto_427468 ?auto_427481 ) ) ( not ( = ?auto_427469 ?auto_427470 ) ) ( not ( = ?auto_427469 ?auto_427471 ) ) ( not ( = ?auto_427469 ?auto_427472 ) ) ( not ( = ?auto_427469 ?auto_427473 ) ) ( not ( = ?auto_427469 ?auto_427474 ) ) ( not ( = ?auto_427469 ?auto_427475 ) ) ( not ( = ?auto_427469 ?auto_427476 ) ) ( not ( = ?auto_427469 ?auto_427477 ) ) ( not ( = ?auto_427469 ?auto_427478 ) ) ( not ( = ?auto_427469 ?auto_427479 ) ) ( not ( = ?auto_427469 ?auto_427480 ) ) ( not ( = ?auto_427469 ?auto_427481 ) ) ( not ( = ?auto_427470 ?auto_427471 ) ) ( not ( = ?auto_427470 ?auto_427472 ) ) ( not ( = ?auto_427470 ?auto_427473 ) ) ( not ( = ?auto_427470 ?auto_427474 ) ) ( not ( = ?auto_427470 ?auto_427475 ) ) ( not ( = ?auto_427470 ?auto_427476 ) ) ( not ( = ?auto_427470 ?auto_427477 ) ) ( not ( = ?auto_427470 ?auto_427478 ) ) ( not ( = ?auto_427470 ?auto_427479 ) ) ( not ( = ?auto_427470 ?auto_427480 ) ) ( not ( = ?auto_427470 ?auto_427481 ) ) ( not ( = ?auto_427471 ?auto_427472 ) ) ( not ( = ?auto_427471 ?auto_427473 ) ) ( not ( = ?auto_427471 ?auto_427474 ) ) ( not ( = ?auto_427471 ?auto_427475 ) ) ( not ( = ?auto_427471 ?auto_427476 ) ) ( not ( = ?auto_427471 ?auto_427477 ) ) ( not ( = ?auto_427471 ?auto_427478 ) ) ( not ( = ?auto_427471 ?auto_427479 ) ) ( not ( = ?auto_427471 ?auto_427480 ) ) ( not ( = ?auto_427471 ?auto_427481 ) ) ( not ( = ?auto_427472 ?auto_427473 ) ) ( not ( = ?auto_427472 ?auto_427474 ) ) ( not ( = ?auto_427472 ?auto_427475 ) ) ( not ( = ?auto_427472 ?auto_427476 ) ) ( not ( = ?auto_427472 ?auto_427477 ) ) ( not ( = ?auto_427472 ?auto_427478 ) ) ( not ( = ?auto_427472 ?auto_427479 ) ) ( not ( = ?auto_427472 ?auto_427480 ) ) ( not ( = ?auto_427472 ?auto_427481 ) ) ( not ( = ?auto_427473 ?auto_427474 ) ) ( not ( = ?auto_427473 ?auto_427475 ) ) ( not ( = ?auto_427473 ?auto_427476 ) ) ( not ( = ?auto_427473 ?auto_427477 ) ) ( not ( = ?auto_427473 ?auto_427478 ) ) ( not ( = ?auto_427473 ?auto_427479 ) ) ( not ( = ?auto_427473 ?auto_427480 ) ) ( not ( = ?auto_427473 ?auto_427481 ) ) ( not ( = ?auto_427474 ?auto_427475 ) ) ( not ( = ?auto_427474 ?auto_427476 ) ) ( not ( = ?auto_427474 ?auto_427477 ) ) ( not ( = ?auto_427474 ?auto_427478 ) ) ( not ( = ?auto_427474 ?auto_427479 ) ) ( not ( = ?auto_427474 ?auto_427480 ) ) ( not ( = ?auto_427474 ?auto_427481 ) ) ( not ( = ?auto_427475 ?auto_427476 ) ) ( not ( = ?auto_427475 ?auto_427477 ) ) ( not ( = ?auto_427475 ?auto_427478 ) ) ( not ( = ?auto_427475 ?auto_427479 ) ) ( not ( = ?auto_427475 ?auto_427480 ) ) ( not ( = ?auto_427475 ?auto_427481 ) ) ( not ( = ?auto_427476 ?auto_427477 ) ) ( not ( = ?auto_427476 ?auto_427478 ) ) ( not ( = ?auto_427476 ?auto_427479 ) ) ( not ( = ?auto_427476 ?auto_427480 ) ) ( not ( = ?auto_427476 ?auto_427481 ) ) ( not ( = ?auto_427477 ?auto_427478 ) ) ( not ( = ?auto_427477 ?auto_427479 ) ) ( not ( = ?auto_427477 ?auto_427480 ) ) ( not ( = ?auto_427477 ?auto_427481 ) ) ( not ( = ?auto_427478 ?auto_427479 ) ) ( not ( = ?auto_427478 ?auto_427480 ) ) ( not ( = ?auto_427478 ?auto_427481 ) ) ( not ( = ?auto_427479 ?auto_427480 ) ) ( not ( = ?auto_427479 ?auto_427481 ) ) ( not ( = ?auto_427480 ?auto_427481 ) ) ( ON ?auto_427479 ?auto_427480 ) ( ON ?auto_427478 ?auto_427479 ) ( ON ?auto_427477 ?auto_427478 ) ( ON ?auto_427476 ?auto_427477 ) ( ON ?auto_427475 ?auto_427476 ) ( ON ?auto_427474 ?auto_427475 ) ( ON ?auto_427473 ?auto_427474 ) ( ON ?auto_427472 ?auto_427473 ) ( ON ?auto_427471 ?auto_427472 ) ( ON ?auto_427470 ?auto_427471 ) ( ON ?auto_427469 ?auto_427470 ) ( ON ?auto_427468 ?auto_427469 ) ( ON ?auto_427467 ?auto_427468 ) ( CLEAR ?auto_427467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_427467 )
      ( MAKE-14PILE ?auto_427467 ?auto_427468 ?auto_427469 ?auto_427470 ?auto_427471 ?auto_427472 ?auto_427473 ?auto_427474 ?auto_427475 ?auto_427476 ?auto_427477 ?auto_427478 ?auto_427479 ?auto_427480 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_427497 - BLOCK
      ?auto_427498 - BLOCK
      ?auto_427499 - BLOCK
      ?auto_427500 - BLOCK
      ?auto_427501 - BLOCK
      ?auto_427502 - BLOCK
      ?auto_427503 - BLOCK
      ?auto_427504 - BLOCK
      ?auto_427505 - BLOCK
      ?auto_427506 - BLOCK
      ?auto_427507 - BLOCK
      ?auto_427508 - BLOCK
      ?auto_427509 - BLOCK
      ?auto_427510 - BLOCK
      ?auto_427511 - BLOCK
    )
    :vars
    (
      ?auto_427512 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_427510 ) ( ON ?auto_427511 ?auto_427512 ) ( CLEAR ?auto_427511 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_427497 ) ( ON ?auto_427498 ?auto_427497 ) ( ON ?auto_427499 ?auto_427498 ) ( ON ?auto_427500 ?auto_427499 ) ( ON ?auto_427501 ?auto_427500 ) ( ON ?auto_427502 ?auto_427501 ) ( ON ?auto_427503 ?auto_427502 ) ( ON ?auto_427504 ?auto_427503 ) ( ON ?auto_427505 ?auto_427504 ) ( ON ?auto_427506 ?auto_427505 ) ( ON ?auto_427507 ?auto_427506 ) ( ON ?auto_427508 ?auto_427507 ) ( ON ?auto_427509 ?auto_427508 ) ( ON ?auto_427510 ?auto_427509 ) ( not ( = ?auto_427497 ?auto_427498 ) ) ( not ( = ?auto_427497 ?auto_427499 ) ) ( not ( = ?auto_427497 ?auto_427500 ) ) ( not ( = ?auto_427497 ?auto_427501 ) ) ( not ( = ?auto_427497 ?auto_427502 ) ) ( not ( = ?auto_427497 ?auto_427503 ) ) ( not ( = ?auto_427497 ?auto_427504 ) ) ( not ( = ?auto_427497 ?auto_427505 ) ) ( not ( = ?auto_427497 ?auto_427506 ) ) ( not ( = ?auto_427497 ?auto_427507 ) ) ( not ( = ?auto_427497 ?auto_427508 ) ) ( not ( = ?auto_427497 ?auto_427509 ) ) ( not ( = ?auto_427497 ?auto_427510 ) ) ( not ( = ?auto_427497 ?auto_427511 ) ) ( not ( = ?auto_427497 ?auto_427512 ) ) ( not ( = ?auto_427498 ?auto_427499 ) ) ( not ( = ?auto_427498 ?auto_427500 ) ) ( not ( = ?auto_427498 ?auto_427501 ) ) ( not ( = ?auto_427498 ?auto_427502 ) ) ( not ( = ?auto_427498 ?auto_427503 ) ) ( not ( = ?auto_427498 ?auto_427504 ) ) ( not ( = ?auto_427498 ?auto_427505 ) ) ( not ( = ?auto_427498 ?auto_427506 ) ) ( not ( = ?auto_427498 ?auto_427507 ) ) ( not ( = ?auto_427498 ?auto_427508 ) ) ( not ( = ?auto_427498 ?auto_427509 ) ) ( not ( = ?auto_427498 ?auto_427510 ) ) ( not ( = ?auto_427498 ?auto_427511 ) ) ( not ( = ?auto_427498 ?auto_427512 ) ) ( not ( = ?auto_427499 ?auto_427500 ) ) ( not ( = ?auto_427499 ?auto_427501 ) ) ( not ( = ?auto_427499 ?auto_427502 ) ) ( not ( = ?auto_427499 ?auto_427503 ) ) ( not ( = ?auto_427499 ?auto_427504 ) ) ( not ( = ?auto_427499 ?auto_427505 ) ) ( not ( = ?auto_427499 ?auto_427506 ) ) ( not ( = ?auto_427499 ?auto_427507 ) ) ( not ( = ?auto_427499 ?auto_427508 ) ) ( not ( = ?auto_427499 ?auto_427509 ) ) ( not ( = ?auto_427499 ?auto_427510 ) ) ( not ( = ?auto_427499 ?auto_427511 ) ) ( not ( = ?auto_427499 ?auto_427512 ) ) ( not ( = ?auto_427500 ?auto_427501 ) ) ( not ( = ?auto_427500 ?auto_427502 ) ) ( not ( = ?auto_427500 ?auto_427503 ) ) ( not ( = ?auto_427500 ?auto_427504 ) ) ( not ( = ?auto_427500 ?auto_427505 ) ) ( not ( = ?auto_427500 ?auto_427506 ) ) ( not ( = ?auto_427500 ?auto_427507 ) ) ( not ( = ?auto_427500 ?auto_427508 ) ) ( not ( = ?auto_427500 ?auto_427509 ) ) ( not ( = ?auto_427500 ?auto_427510 ) ) ( not ( = ?auto_427500 ?auto_427511 ) ) ( not ( = ?auto_427500 ?auto_427512 ) ) ( not ( = ?auto_427501 ?auto_427502 ) ) ( not ( = ?auto_427501 ?auto_427503 ) ) ( not ( = ?auto_427501 ?auto_427504 ) ) ( not ( = ?auto_427501 ?auto_427505 ) ) ( not ( = ?auto_427501 ?auto_427506 ) ) ( not ( = ?auto_427501 ?auto_427507 ) ) ( not ( = ?auto_427501 ?auto_427508 ) ) ( not ( = ?auto_427501 ?auto_427509 ) ) ( not ( = ?auto_427501 ?auto_427510 ) ) ( not ( = ?auto_427501 ?auto_427511 ) ) ( not ( = ?auto_427501 ?auto_427512 ) ) ( not ( = ?auto_427502 ?auto_427503 ) ) ( not ( = ?auto_427502 ?auto_427504 ) ) ( not ( = ?auto_427502 ?auto_427505 ) ) ( not ( = ?auto_427502 ?auto_427506 ) ) ( not ( = ?auto_427502 ?auto_427507 ) ) ( not ( = ?auto_427502 ?auto_427508 ) ) ( not ( = ?auto_427502 ?auto_427509 ) ) ( not ( = ?auto_427502 ?auto_427510 ) ) ( not ( = ?auto_427502 ?auto_427511 ) ) ( not ( = ?auto_427502 ?auto_427512 ) ) ( not ( = ?auto_427503 ?auto_427504 ) ) ( not ( = ?auto_427503 ?auto_427505 ) ) ( not ( = ?auto_427503 ?auto_427506 ) ) ( not ( = ?auto_427503 ?auto_427507 ) ) ( not ( = ?auto_427503 ?auto_427508 ) ) ( not ( = ?auto_427503 ?auto_427509 ) ) ( not ( = ?auto_427503 ?auto_427510 ) ) ( not ( = ?auto_427503 ?auto_427511 ) ) ( not ( = ?auto_427503 ?auto_427512 ) ) ( not ( = ?auto_427504 ?auto_427505 ) ) ( not ( = ?auto_427504 ?auto_427506 ) ) ( not ( = ?auto_427504 ?auto_427507 ) ) ( not ( = ?auto_427504 ?auto_427508 ) ) ( not ( = ?auto_427504 ?auto_427509 ) ) ( not ( = ?auto_427504 ?auto_427510 ) ) ( not ( = ?auto_427504 ?auto_427511 ) ) ( not ( = ?auto_427504 ?auto_427512 ) ) ( not ( = ?auto_427505 ?auto_427506 ) ) ( not ( = ?auto_427505 ?auto_427507 ) ) ( not ( = ?auto_427505 ?auto_427508 ) ) ( not ( = ?auto_427505 ?auto_427509 ) ) ( not ( = ?auto_427505 ?auto_427510 ) ) ( not ( = ?auto_427505 ?auto_427511 ) ) ( not ( = ?auto_427505 ?auto_427512 ) ) ( not ( = ?auto_427506 ?auto_427507 ) ) ( not ( = ?auto_427506 ?auto_427508 ) ) ( not ( = ?auto_427506 ?auto_427509 ) ) ( not ( = ?auto_427506 ?auto_427510 ) ) ( not ( = ?auto_427506 ?auto_427511 ) ) ( not ( = ?auto_427506 ?auto_427512 ) ) ( not ( = ?auto_427507 ?auto_427508 ) ) ( not ( = ?auto_427507 ?auto_427509 ) ) ( not ( = ?auto_427507 ?auto_427510 ) ) ( not ( = ?auto_427507 ?auto_427511 ) ) ( not ( = ?auto_427507 ?auto_427512 ) ) ( not ( = ?auto_427508 ?auto_427509 ) ) ( not ( = ?auto_427508 ?auto_427510 ) ) ( not ( = ?auto_427508 ?auto_427511 ) ) ( not ( = ?auto_427508 ?auto_427512 ) ) ( not ( = ?auto_427509 ?auto_427510 ) ) ( not ( = ?auto_427509 ?auto_427511 ) ) ( not ( = ?auto_427509 ?auto_427512 ) ) ( not ( = ?auto_427510 ?auto_427511 ) ) ( not ( = ?auto_427510 ?auto_427512 ) ) ( not ( = ?auto_427511 ?auto_427512 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_427511 ?auto_427512 )
      ( !STACK ?auto_427511 ?auto_427510 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_427528 - BLOCK
      ?auto_427529 - BLOCK
      ?auto_427530 - BLOCK
      ?auto_427531 - BLOCK
      ?auto_427532 - BLOCK
      ?auto_427533 - BLOCK
      ?auto_427534 - BLOCK
      ?auto_427535 - BLOCK
      ?auto_427536 - BLOCK
      ?auto_427537 - BLOCK
      ?auto_427538 - BLOCK
      ?auto_427539 - BLOCK
      ?auto_427540 - BLOCK
      ?auto_427541 - BLOCK
      ?auto_427542 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_427541 ) ( ON-TABLE ?auto_427542 ) ( CLEAR ?auto_427542 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_427528 ) ( ON ?auto_427529 ?auto_427528 ) ( ON ?auto_427530 ?auto_427529 ) ( ON ?auto_427531 ?auto_427530 ) ( ON ?auto_427532 ?auto_427531 ) ( ON ?auto_427533 ?auto_427532 ) ( ON ?auto_427534 ?auto_427533 ) ( ON ?auto_427535 ?auto_427534 ) ( ON ?auto_427536 ?auto_427535 ) ( ON ?auto_427537 ?auto_427536 ) ( ON ?auto_427538 ?auto_427537 ) ( ON ?auto_427539 ?auto_427538 ) ( ON ?auto_427540 ?auto_427539 ) ( ON ?auto_427541 ?auto_427540 ) ( not ( = ?auto_427528 ?auto_427529 ) ) ( not ( = ?auto_427528 ?auto_427530 ) ) ( not ( = ?auto_427528 ?auto_427531 ) ) ( not ( = ?auto_427528 ?auto_427532 ) ) ( not ( = ?auto_427528 ?auto_427533 ) ) ( not ( = ?auto_427528 ?auto_427534 ) ) ( not ( = ?auto_427528 ?auto_427535 ) ) ( not ( = ?auto_427528 ?auto_427536 ) ) ( not ( = ?auto_427528 ?auto_427537 ) ) ( not ( = ?auto_427528 ?auto_427538 ) ) ( not ( = ?auto_427528 ?auto_427539 ) ) ( not ( = ?auto_427528 ?auto_427540 ) ) ( not ( = ?auto_427528 ?auto_427541 ) ) ( not ( = ?auto_427528 ?auto_427542 ) ) ( not ( = ?auto_427529 ?auto_427530 ) ) ( not ( = ?auto_427529 ?auto_427531 ) ) ( not ( = ?auto_427529 ?auto_427532 ) ) ( not ( = ?auto_427529 ?auto_427533 ) ) ( not ( = ?auto_427529 ?auto_427534 ) ) ( not ( = ?auto_427529 ?auto_427535 ) ) ( not ( = ?auto_427529 ?auto_427536 ) ) ( not ( = ?auto_427529 ?auto_427537 ) ) ( not ( = ?auto_427529 ?auto_427538 ) ) ( not ( = ?auto_427529 ?auto_427539 ) ) ( not ( = ?auto_427529 ?auto_427540 ) ) ( not ( = ?auto_427529 ?auto_427541 ) ) ( not ( = ?auto_427529 ?auto_427542 ) ) ( not ( = ?auto_427530 ?auto_427531 ) ) ( not ( = ?auto_427530 ?auto_427532 ) ) ( not ( = ?auto_427530 ?auto_427533 ) ) ( not ( = ?auto_427530 ?auto_427534 ) ) ( not ( = ?auto_427530 ?auto_427535 ) ) ( not ( = ?auto_427530 ?auto_427536 ) ) ( not ( = ?auto_427530 ?auto_427537 ) ) ( not ( = ?auto_427530 ?auto_427538 ) ) ( not ( = ?auto_427530 ?auto_427539 ) ) ( not ( = ?auto_427530 ?auto_427540 ) ) ( not ( = ?auto_427530 ?auto_427541 ) ) ( not ( = ?auto_427530 ?auto_427542 ) ) ( not ( = ?auto_427531 ?auto_427532 ) ) ( not ( = ?auto_427531 ?auto_427533 ) ) ( not ( = ?auto_427531 ?auto_427534 ) ) ( not ( = ?auto_427531 ?auto_427535 ) ) ( not ( = ?auto_427531 ?auto_427536 ) ) ( not ( = ?auto_427531 ?auto_427537 ) ) ( not ( = ?auto_427531 ?auto_427538 ) ) ( not ( = ?auto_427531 ?auto_427539 ) ) ( not ( = ?auto_427531 ?auto_427540 ) ) ( not ( = ?auto_427531 ?auto_427541 ) ) ( not ( = ?auto_427531 ?auto_427542 ) ) ( not ( = ?auto_427532 ?auto_427533 ) ) ( not ( = ?auto_427532 ?auto_427534 ) ) ( not ( = ?auto_427532 ?auto_427535 ) ) ( not ( = ?auto_427532 ?auto_427536 ) ) ( not ( = ?auto_427532 ?auto_427537 ) ) ( not ( = ?auto_427532 ?auto_427538 ) ) ( not ( = ?auto_427532 ?auto_427539 ) ) ( not ( = ?auto_427532 ?auto_427540 ) ) ( not ( = ?auto_427532 ?auto_427541 ) ) ( not ( = ?auto_427532 ?auto_427542 ) ) ( not ( = ?auto_427533 ?auto_427534 ) ) ( not ( = ?auto_427533 ?auto_427535 ) ) ( not ( = ?auto_427533 ?auto_427536 ) ) ( not ( = ?auto_427533 ?auto_427537 ) ) ( not ( = ?auto_427533 ?auto_427538 ) ) ( not ( = ?auto_427533 ?auto_427539 ) ) ( not ( = ?auto_427533 ?auto_427540 ) ) ( not ( = ?auto_427533 ?auto_427541 ) ) ( not ( = ?auto_427533 ?auto_427542 ) ) ( not ( = ?auto_427534 ?auto_427535 ) ) ( not ( = ?auto_427534 ?auto_427536 ) ) ( not ( = ?auto_427534 ?auto_427537 ) ) ( not ( = ?auto_427534 ?auto_427538 ) ) ( not ( = ?auto_427534 ?auto_427539 ) ) ( not ( = ?auto_427534 ?auto_427540 ) ) ( not ( = ?auto_427534 ?auto_427541 ) ) ( not ( = ?auto_427534 ?auto_427542 ) ) ( not ( = ?auto_427535 ?auto_427536 ) ) ( not ( = ?auto_427535 ?auto_427537 ) ) ( not ( = ?auto_427535 ?auto_427538 ) ) ( not ( = ?auto_427535 ?auto_427539 ) ) ( not ( = ?auto_427535 ?auto_427540 ) ) ( not ( = ?auto_427535 ?auto_427541 ) ) ( not ( = ?auto_427535 ?auto_427542 ) ) ( not ( = ?auto_427536 ?auto_427537 ) ) ( not ( = ?auto_427536 ?auto_427538 ) ) ( not ( = ?auto_427536 ?auto_427539 ) ) ( not ( = ?auto_427536 ?auto_427540 ) ) ( not ( = ?auto_427536 ?auto_427541 ) ) ( not ( = ?auto_427536 ?auto_427542 ) ) ( not ( = ?auto_427537 ?auto_427538 ) ) ( not ( = ?auto_427537 ?auto_427539 ) ) ( not ( = ?auto_427537 ?auto_427540 ) ) ( not ( = ?auto_427537 ?auto_427541 ) ) ( not ( = ?auto_427537 ?auto_427542 ) ) ( not ( = ?auto_427538 ?auto_427539 ) ) ( not ( = ?auto_427538 ?auto_427540 ) ) ( not ( = ?auto_427538 ?auto_427541 ) ) ( not ( = ?auto_427538 ?auto_427542 ) ) ( not ( = ?auto_427539 ?auto_427540 ) ) ( not ( = ?auto_427539 ?auto_427541 ) ) ( not ( = ?auto_427539 ?auto_427542 ) ) ( not ( = ?auto_427540 ?auto_427541 ) ) ( not ( = ?auto_427540 ?auto_427542 ) ) ( not ( = ?auto_427541 ?auto_427542 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_427542 )
      ( !STACK ?auto_427542 ?auto_427541 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_427558 - BLOCK
      ?auto_427559 - BLOCK
      ?auto_427560 - BLOCK
      ?auto_427561 - BLOCK
      ?auto_427562 - BLOCK
      ?auto_427563 - BLOCK
      ?auto_427564 - BLOCK
      ?auto_427565 - BLOCK
      ?auto_427566 - BLOCK
      ?auto_427567 - BLOCK
      ?auto_427568 - BLOCK
      ?auto_427569 - BLOCK
      ?auto_427570 - BLOCK
      ?auto_427571 - BLOCK
      ?auto_427572 - BLOCK
    )
    :vars
    (
      ?auto_427573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_427572 ?auto_427573 ) ( ON-TABLE ?auto_427558 ) ( ON ?auto_427559 ?auto_427558 ) ( ON ?auto_427560 ?auto_427559 ) ( ON ?auto_427561 ?auto_427560 ) ( ON ?auto_427562 ?auto_427561 ) ( ON ?auto_427563 ?auto_427562 ) ( ON ?auto_427564 ?auto_427563 ) ( ON ?auto_427565 ?auto_427564 ) ( ON ?auto_427566 ?auto_427565 ) ( ON ?auto_427567 ?auto_427566 ) ( ON ?auto_427568 ?auto_427567 ) ( ON ?auto_427569 ?auto_427568 ) ( ON ?auto_427570 ?auto_427569 ) ( not ( = ?auto_427558 ?auto_427559 ) ) ( not ( = ?auto_427558 ?auto_427560 ) ) ( not ( = ?auto_427558 ?auto_427561 ) ) ( not ( = ?auto_427558 ?auto_427562 ) ) ( not ( = ?auto_427558 ?auto_427563 ) ) ( not ( = ?auto_427558 ?auto_427564 ) ) ( not ( = ?auto_427558 ?auto_427565 ) ) ( not ( = ?auto_427558 ?auto_427566 ) ) ( not ( = ?auto_427558 ?auto_427567 ) ) ( not ( = ?auto_427558 ?auto_427568 ) ) ( not ( = ?auto_427558 ?auto_427569 ) ) ( not ( = ?auto_427558 ?auto_427570 ) ) ( not ( = ?auto_427558 ?auto_427571 ) ) ( not ( = ?auto_427558 ?auto_427572 ) ) ( not ( = ?auto_427558 ?auto_427573 ) ) ( not ( = ?auto_427559 ?auto_427560 ) ) ( not ( = ?auto_427559 ?auto_427561 ) ) ( not ( = ?auto_427559 ?auto_427562 ) ) ( not ( = ?auto_427559 ?auto_427563 ) ) ( not ( = ?auto_427559 ?auto_427564 ) ) ( not ( = ?auto_427559 ?auto_427565 ) ) ( not ( = ?auto_427559 ?auto_427566 ) ) ( not ( = ?auto_427559 ?auto_427567 ) ) ( not ( = ?auto_427559 ?auto_427568 ) ) ( not ( = ?auto_427559 ?auto_427569 ) ) ( not ( = ?auto_427559 ?auto_427570 ) ) ( not ( = ?auto_427559 ?auto_427571 ) ) ( not ( = ?auto_427559 ?auto_427572 ) ) ( not ( = ?auto_427559 ?auto_427573 ) ) ( not ( = ?auto_427560 ?auto_427561 ) ) ( not ( = ?auto_427560 ?auto_427562 ) ) ( not ( = ?auto_427560 ?auto_427563 ) ) ( not ( = ?auto_427560 ?auto_427564 ) ) ( not ( = ?auto_427560 ?auto_427565 ) ) ( not ( = ?auto_427560 ?auto_427566 ) ) ( not ( = ?auto_427560 ?auto_427567 ) ) ( not ( = ?auto_427560 ?auto_427568 ) ) ( not ( = ?auto_427560 ?auto_427569 ) ) ( not ( = ?auto_427560 ?auto_427570 ) ) ( not ( = ?auto_427560 ?auto_427571 ) ) ( not ( = ?auto_427560 ?auto_427572 ) ) ( not ( = ?auto_427560 ?auto_427573 ) ) ( not ( = ?auto_427561 ?auto_427562 ) ) ( not ( = ?auto_427561 ?auto_427563 ) ) ( not ( = ?auto_427561 ?auto_427564 ) ) ( not ( = ?auto_427561 ?auto_427565 ) ) ( not ( = ?auto_427561 ?auto_427566 ) ) ( not ( = ?auto_427561 ?auto_427567 ) ) ( not ( = ?auto_427561 ?auto_427568 ) ) ( not ( = ?auto_427561 ?auto_427569 ) ) ( not ( = ?auto_427561 ?auto_427570 ) ) ( not ( = ?auto_427561 ?auto_427571 ) ) ( not ( = ?auto_427561 ?auto_427572 ) ) ( not ( = ?auto_427561 ?auto_427573 ) ) ( not ( = ?auto_427562 ?auto_427563 ) ) ( not ( = ?auto_427562 ?auto_427564 ) ) ( not ( = ?auto_427562 ?auto_427565 ) ) ( not ( = ?auto_427562 ?auto_427566 ) ) ( not ( = ?auto_427562 ?auto_427567 ) ) ( not ( = ?auto_427562 ?auto_427568 ) ) ( not ( = ?auto_427562 ?auto_427569 ) ) ( not ( = ?auto_427562 ?auto_427570 ) ) ( not ( = ?auto_427562 ?auto_427571 ) ) ( not ( = ?auto_427562 ?auto_427572 ) ) ( not ( = ?auto_427562 ?auto_427573 ) ) ( not ( = ?auto_427563 ?auto_427564 ) ) ( not ( = ?auto_427563 ?auto_427565 ) ) ( not ( = ?auto_427563 ?auto_427566 ) ) ( not ( = ?auto_427563 ?auto_427567 ) ) ( not ( = ?auto_427563 ?auto_427568 ) ) ( not ( = ?auto_427563 ?auto_427569 ) ) ( not ( = ?auto_427563 ?auto_427570 ) ) ( not ( = ?auto_427563 ?auto_427571 ) ) ( not ( = ?auto_427563 ?auto_427572 ) ) ( not ( = ?auto_427563 ?auto_427573 ) ) ( not ( = ?auto_427564 ?auto_427565 ) ) ( not ( = ?auto_427564 ?auto_427566 ) ) ( not ( = ?auto_427564 ?auto_427567 ) ) ( not ( = ?auto_427564 ?auto_427568 ) ) ( not ( = ?auto_427564 ?auto_427569 ) ) ( not ( = ?auto_427564 ?auto_427570 ) ) ( not ( = ?auto_427564 ?auto_427571 ) ) ( not ( = ?auto_427564 ?auto_427572 ) ) ( not ( = ?auto_427564 ?auto_427573 ) ) ( not ( = ?auto_427565 ?auto_427566 ) ) ( not ( = ?auto_427565 ?auto_427567 ) ) ( not ( = ?auto_427565 ?auto_427568 ) ) ( not ( = ?auto_427565 ?auto_427569 ) ) ( not ( = ?auto_427565 ?auto_427570 ) ) ( not ( = ?auto_427565 ?auto_427571 ) ) ( not ( = ?auto_427565 ?auto_427572 ) ) ( not ( = ?auto_427565 ?auto_427573 ) ) ( not ( = ?auto_427566 ?auto_427567 ) ) ( not ( = ?auto_427566 ?auto_427568 ) ) ( not ( = ?auto_427566 ?auto_427569 ) ) ( not ( = ?auto_427566 ?auto_427570 ) ) ( not ( = ?auto_427566 ?auto_427571 ) ) ( not ( = ?auto_427566 ?auto_427572 ) ) ( not ( = ?auto_427566 ?auto_427573 ) ) ( not ( = ?auto_427567 ?auto_427568 ) ) ( not ( = ?auto_427567 ?auto_427569 ) ) ( not ( = ?auto_427567 ?auto_427570 ) ) ( not ( = ?auto_427567 ?auto_427571 ) ) ( not ( = ?auto_427567 ?auto_427572 ) ) ( not ( = ?auto_427567 ?auto_427573 ) ) ( not ( = ?auto_427568 ?auto_427569 ) ) ( not ( = ?auto_427568 ?auto_427570 ) ) ( not ( = ?auto_427568 ?auto_427571 ) ) ( not ( = ?auto_427568 ?auto_427572 ) ) ( not ( = ?auto_427568 ?auto_427573 ) ) ( not ( = ?auto_427569 ?auto_427570 ) ) ( not ( = ?auto_427569 ?auto_427571 ) ) ( not ( = ?auto_427569 ?auto_427572 ) ) ( not ( = ?auto_427569 ?auto_427573 ) ) ( not ( = ?auto_427570 ?auto_427571 ) ) ( not ( = ?auto_427570 ?auto_427572 ) ) ( not ( = ?auto_427570 ?auto_427573 ) ) ( not ( = ?auto_427571 ?auto_427572 ) ) ( not ( = ?auto_427571 ?auto_427573 ) ) ( not ( = ?auto_427572 ?auto_427573 ) ) ( CLEAR ?auto_427570 ) ( ON ?auto_427571 ?auto_427572 ) ( CLEAR ?auto_427571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_427558 ?auto_427559 ?auto_427560 ?auto_427561 ?auto_427562 ?auto_427563 ?auto_427564 ?auto_427565 ?auto_427566 ?auto_427567 ?auto_427568 ?auto_427569 ?auto_427570 ?auto_427571 )
      ( MAKE-15PILE ?auto_427558 ?auto_427559 ?auto_427560 ?auto_427561 ?auto_427562 ?auto_427563 ?auto_427564 ?auto_427565 ?auto_427566 ?auto_427567 ?auto_427568 ?auto_427569 ?auto_427570 ?auto_427571 ?auto_427572 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_427589 - BLOCK
      ?auto_427590 - BLOCK
      ?auto_427591 - BLOCK
      ?auto_427592 - BLOCK
      ?auto_427593 - BLOCK
      ?auto_427594 - BLOCK
      ?auto_427595 - BLOCK
      ?auto_427596 - BLOCK
      ?auto_427597 - BLOCK
      ?auto_427598 - BLOCK
      ?auto_427599 - BLOCK
      ?auto_427600 - BLOCK
      ?auto_427601 - BLOCK
      ?auto_427602 - BLOCK
      ?auto_427603 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_427603 ) ( ON-TABLE ?auto_427589 ) ( ON ?auto_427590 ?auto_427589 ) ( ON ?auto_427591 ?auto_427590 ) ( ON ?auto_427592 ?auto_427591 ) ( ON ?auto_427593 ?auto_427592 ) ( ON ?auto_427594 ?auto_427593 ) ( ON ?auto_427595 ?auto_427594 ) ( ON ?auto_427596 ?auto_427595 ) ( ON ?auto_427597 ?auto_427596 ) ( ON ?auto_427598 ?auto_427597 ) ( ON ?auto_427599 ?auto_427598 ) ( ON ?auto_427600 ?auto_427599 ) ( ON ?auto_427601 ?auto_427600 ) ( not ( = ?auto_427589 ?auto_427590 ) ) ( not ( = ?auto_427589 ?auto_427591 ) ) ( not ( = ?auto_427589 ?auto_427592 ) ) ( not ( = ?auto_427589 ?auto_427593 ) ) ( not ( = ?auto_427589 ?auto_427594 ) ) ( not ( = ?auto_427589 ?auto_427595 ) ) ( not ( = ?auto_427589 ?auto_427596 ) ) ( not ( = ?auto_427589 ?auto_427597 ) ) ( not ( = ?auto_427589 ?auto_427598 ) ) ( not ( = ?auto_427589 ?auto_427599 ) ) ( not ( = ?auto_427589 ?auto_427600 ) ) ( not ( = ?auto_427589 ?auto_427601 ) ) ( not ( = ?auto_427589 ?auto_427602 ) ) ( not ( = ?auto_427589 ?auto_427603 ) ) ( not ( = ?auto_427590 ?auto_427591 ) ) ( not ( = ?auto_427590 ?auto_427592 ) ) ( not ( = ?auto_427590 ?auto_427593 ) ) ( not ( = ?auto_427590 ?auto_427594 ) ) ( not ( = ?auto_427590 ?auto_427595 ) ) ( not ( = ?auto_427590 ?auto_427596 ) ) ( not ( = ?auto_427590 ?auto_427597 ) ) ( not ( = ?auto_427590 ?auto_427598 ) ) ( not ( = ?auto_427590 ?auto_427599 ) ) ( not ( = ?auto_427590 ?auto_427600 ) ) ( not ( = ?auto_427590 ?auto_427601 ) ) ( not ( = ?auto_427590 ?auto_427602 ) ) ( not ( = ?auto_427590 ?auto_427603 ) ) ( not ( = ?auto_427591 ?auto_427592 ) ) ( not ( = ?auto_427591 ?auto_427593 ) ) ( not ( = ?auto_427591 ?auto_427594 ) ) ( not ( = ?auto_427591 ?auto_427595 ) ) ( not ( = ?auto_427591 ?auto_427596 ) ) ( not ( = ?auto_427591 ?auto_427597 ) ) ( not ( = ?auto_427591 ?auto_427598 ) ) ( not ( = ?auto_427591 ?auto_427599 ) ) ( not ( = ?auto_427591 ?auto_427600 ) ) ( not ( = ?auto_427591 ?auto_427601 ) ) ( not ( = ?auto_427591 ?auto_427602 ) ) ( not ( = ?auto_427591 ?auto_427603 ) ) ( not ( = ?auto_427592 ?auto_427593 ) ) ( not ( = ?auto_427592 ?auto_427594 ) ) ( not ( = ?auto_427592 ?auto_427595 ) ) ( not ( = ?auto_427592 ?auto_427596 ) ) ( not ( = ?auto_427592 ?auto_427597 ) ) ( not ( = ?auto_427592 ?auto_427598 ) ) ( not ( = ?auto_427592 ?auto_427599 ) ) ( not ( = ?auto_427592 ?auto_427600 ) ) ( not ( = ?auto_427592 ?auto_427601 ) ) ( not ( = ?auto_427592 ?auto_427602 ) ) ( not ( = ?auto_427592 ?auto_427603 ) ) ( not ( = ?auto_427593 ?auto_427594 ) ) ( not ( = ?auto_427593 ?auto_427595 ) ) ( not ( = ?auto_427593 ?auto_427596 ) ) ( not ( = ?auto_427593 ?auto_427597 ) ) ( not ( = ?auto_427593 ?auto_427598 ) ) ( not ( = ?auto_427593 ?auto_427599 ) ) ( not ( = ?auto_427593 ?auto_427600 ) ) ( not ( = ?auto_427593 ?auto_427601 ) ) ( not ( = ?auto_427593 ?auto_427602 ) ) ( not ( = ?auto_427593 ?auto_427603 ) ) ( not ( = ?auto_427594 ?auto_427595 ) ) ( not ( = ?auto_427594 ?auto_427596 ) ) ( not ( = ?auto_427594 ?auto_427597 ) ) ( not ( = ?auto_427594 ?auto_427598 ) ) ( not ( = ?auto_427594 ?auto_427599 ) ) ( not ( = ?auto_427594 ?auto_427600 ) ) ( not ( = ?auto_427594 ?auto_427601 ) ) ( not ( = ?auto_427594 ?auto_427602 ) ) ( not ( = ?auto_427594 ?auto_427603 ) ) ( not ( = ?auto_427595 ?auto_427596 ) ) ( not ( = ?auto_427595 ?auto_427597 ) ) ( not ( = ?auto_427595 ?auto_427598 ) ) ( not ( = ?auto_427595 ?auto_427599 ) ) ( not ( = ?auto_427595 ?auto_427600 ) ) ( not ( = ?auto_427595 ?auto_427601 ) ) ( not ( = ?auto_427595 ?auto_427602 ) ) ( not ( = ?auto_427595 ?auto_427603 ) ) ( not ( = ?auto_427596 ?auto_427597 ) ) ( not ( = ?auto_427596 ?auto_427598 ) ) ( not ( = ?auto_427596 ?auto_427599 ) ) ( not ( = ?auto_427596 ?auto_427600 ) ) ( not ( = ?auto_427596 ?auto_427601 ) ) ( not ( = ?auto_427596 ?auto_427602 ) ) ( not ( = ?auto_427596 ?auto_427603 ) ) ( not ( = ?auto_427597 ?auto_427598 ) ) ( not ( = ?auto_427597 ?auto_427599 ) ) ( not ( = ?auto_427597 ?auto_427600 ) ) ( not ( = ?auto_427597 ?auto_427601 ) ) ( not ( = ?auto_427597 ?auto_427602 ) ) ( not ( = ?auto_427597 ?auto_427603 ) ) ( not ( = ?auto_427598 ?auto_427599 ) ) ( not ( = ?auto_427598 ?auto_427600 ) ) ( not ( = ?auto_427598 ?auto_427601 ) ) ( not ( = ?auto_427598 ?auto_427602 ) ) ( not ( = ?auto_427598 ?auto_427603 ) ) ( not ( = ?auto_427599 ?auto_427600 ) ) ( not ( = ?auto_427599 ?auto_427601 ) ) ( not ( = ?auto_427599 ?auto_427602 ) ) ( not ( = ?auto_427599 ?auto_427603 ) ) ( not ( = ?auto_427600 ?auto_427601 ) ) ( not ( = ?auto_427600 ?auto_427602 ) ) ( not ( = ?auto_427600 ?auto_427603 ) ) ( not ( = ?auto_427601 ?auto_427602 ) ) ( not ( = ?auto_427601 ?auto_427603 ) ) ( not ( = ?auto_427602 ?auto_427603 ) ) ( CLEAR ?auto_427601 ) ( ON ?auto_427602 ?auto_427603 ) ( CLEAR ?auto_427602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_427589 ?auto_427590 ?auto_427591 ?auto_427592 ?auto_427593 ?auto_427594 ?auto_427595 ?auto_427596 ?auto_427597 ?auto_427598 ?auto_427599 ?auto_427600 ?auto_427601 ?auto_427602 )
      ( MAKE-15PILE ?auto_427589 ?auto_427590 ?auto_427591 ?auto_427592 ?auto_427593 ?auto_427594 ?auto_427595 ?auto_427596 ?auto_427597 ?auto_427598 ?auto_427599 ?auto_427600 ?auto_427601 ?auto_427602 ?auto_427603 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_427619 - BLOCK
      ?auto_427620 - BLOCK
      ?auto_427621 - BLOCK
      ?auto_427622 - BLOCK
      ?auto_427623 - BLOCK
      ?auto_427624 - BLOCK
      ?auto_427625 - BLOCK
      ?auto_427626 - BLOCK
      ?auto_427627 - BLOCK
      ?auto_427628 - BLOCK
      ?auto_427629 - BLOCK
      ?auto_427630 - BLOCK
      ?auto_427631 - BLOCK
      ?auto_427632 - BLOCK
      ?auto_427633 - BLOCK
    )
    :vars
    (
      ?auto_427634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_427633 ?auto_427634 ) ( ON-TABLE ?auto_427619 ) ( ON ?auto_427620 ?auto_427619 ) ( ON ?auto_427621 ?auto_427620 ) ( ON ?auto_427622 ?auto_427621 ) ( ON ?auto_427623 ?auto_427622 ) ( ON ?auto_427624 ?auto_427623 ) ( ON ?auto_427625 ?auto_427624 ) ( ON ?auto_427626 ?auto_427625 ) ( ON ?auto_427627 ?auto_427626 ) ( ON ?auto_427628 ?auto_427627 ) ( ON ?auto_427629 ?auto_427628 ) ( ON ?auto_427630 ?auto_427629 ) ( not ( = ?auto_427619 ?auto_427620 ) ) ( not ( = ?auto_427619 ?auto_427621 ) ) ( not ( = ?auto_427619 ?auto_427622 ) ) ( not ( = ?auto_427619 ?auto_427623 ) ) ( not ( = ?auto_427619 ?auto_427624 ) ) ( not ( = ?auto_427619 ?auto_427625 ) ) ( not ( = ?auto_427619 ?auto_427626 ) ) ( not ( = ?auto_427619 ?auto_427627 ) ) ( not ( = ?auto_427619 ?auto_427628 ) ) ( not ( = ?auto_427619 ?auto_427629 ) ) ( not ( = ?auto_427619 ?auto_427630 ) ) ( not ( = ?auto_427619 ?auto_427631 ) ) ( not ( = ?auto_427619 ?auto_427632 ) ) ( not ( = ?auto_427619 ?auto_427633 ) ) ( not ( = ?auto_427619 ?auto_427634 ) ) ( not ( = ?auto_427620 ?auto_427621 ) ) ( not ( = ?auto_427620 ?auto_427622 ) ) ( not ( = ?auto_427620 ?auto_427623 ) ) ( not ( = ?auto_427620 ?auto_427624 ) ) ( not ( = ?auto_427620 ?auto_427625 ) ) ( not ( = ?auto_427620 ?auto_427626 ) ) ( not ( = ?auto_427620 ?auto_427627 ) ) ( not ( = ?auto_427620 ?auto_427628 ) ) ( not ( = ?auto_427620 ?auto_427629 ) ) ( not ( = ?auto_427620 ?auto_427630 ) ) ( not ( = ?auto_427620 ?auto_427631 ) ) ( not ( = ?auto_427620 ?auto_427632 ) ) ( not ( = ?auto_427620 ?auto_427633 ) ) ( not ( = ?auto_427620 ?auto_427634 ) ) ( not ( = ?auto_427621 ?auto_427622 ) ) ( not ( = ?auto_427621 ?auto_427623 ) ) ( not ( = ?auto_427621 ?auto_427624 ) ) ( not ( = ?auto_427621 ?auto_427625 ) ) ( not ( = ?auto_427621 ?auto_427626 ) ) ( not ( = ?auto_427621 ?auto_427627 ) ) ( not ( = ?auto_427621 ?auto_427628 ) ) ( not ( = ?auto_427621 ?auto_427629 ) ) ( not ( = ?auto_427621 ?auto_427630 ) ) ( not ( = ?auto_427621 ?auto_427631 ) ) ( not ( = ?auto_427621 ?auto_427632 ) ) ( not ( = ?auto_427621 ?auto_427633 ) ) ( not ( = ?auto_427621 ?auto_427634 ) ) ( not ( = ?auto_427622 ?auto_427623 ) ) ( not ( = ?auto_427622 ?auto_427624 ) ) ( not ( = ?auto_427622 ?auto_427625 ) ) ( not ( = ?auto_427622 ?auto_427626 ) ) ( not ( = ?auto_427622 ?auto_427627 ) ) ( not ( = ?auto_427622 ?auto_427628 ) ) ( not ( = ?auto_427622 ?auto_427629 ) ) ( not ( = ?auto_427622 ?auto_427630 ) ) ( not ( = ?auto_427622 ?auto_427631 ) ) ( not ( = ?auto_427622 ?auto_427632 ) ) ( not ( = ?auto_427622 ?auto_427633 ) ) ( not ( = ?auto_427622 ?auto_427634 ) ) ( not ( = ?auto_427623 ?auto_427624 ) ) ( not ( = ?auto_427623 ?auto_427625 ) ) ( not ( = ?auto_427623 ?auto_427626 ) ) ( not ( = ?auto_427623 ?auto_427627 ) ) ( not ( = ?auto_427623 ?auto_427628 ) ) ( not ( = ?auto_427623 ?auto_427629 ) ) ( not ( = ?auto_427623 ?auto_427630 ) ) ( not ( = ?auto_427623 ?auto_427631 ) ) ( not ( = ?auto_427623 ?auto_427632 ) ) ( not ( = ?auto_427623 ?auto_427633 ) ) ( not ( = ?auto_427623 ?auto_427634 ) ) ( not ( = ?auto_427624 ?auto_427625 ) ) ( not ( = ?auto_427624 ?auto_427626 ) ) ( not ( = ?auto_427624 ?auto_427627 ) ) ( not ( = ?auto_427624 ?auto_427628 ) ) ( not ( = ?auto_427624 ?auto_427629 ) ) ( not ( = ?auto_427624 ?auto_427630 ) ) ( not ( = ?auto_427624 ?auto_427631 ) ) ( not ( = ?auto_427624 ?auto_427632 ) ) ( not ( = ?auto_427624 ?auto_427633 ) ) ( not ( = ?auto_427624 ?auto_427634 ) ) ( not ( = ?auto_427625 ?auto_427626 ) ) ( not ( = ?auto_427625 ?auto_427627 ) ) ( not ( = ?auto_427625 ?auto_427628 ) ) ( not ( = ?auto_427625 ?auto_427629 ) ) ( not ( = ?auto_427625 ?auto_427630 ) ) ( not ( = ?auto_427625 ?auto_427631 ) ) ( not ( = ?auto_427625 ?auto_427632 ) ) ( not ( = ?auto_427625 ?auto_427633 ) ) ( not ( = ?auto_427625 ?auto_427634 ) ) ( not ( = ?auto_427626 ?auto_427627 ) ) ( not ( = ?auto_427626 ?auto_427628 ) ) ( not ( = ?auto_427626 ?auto_427629 ) ) ( not ( = ?auto_427626 ?auto_427630 ) ) ( not ( = ?auto_427626 ?auto_427631 ) ) ( not ( = ?auto_427626 ?auto_427632 ) ) ( not ( = ?auto_427626 ?auto_427633 ) ) ( not ( = ?auto_427626 ?auto_427634 ) ) ( not ( = ?auto_427627 ?auto_427628 ) ) ( not ( = ?auto_427627 ?auto_427629 ) ) ( not ( = ?auto_427627 ?auto_427630 ) ) ( not ( = ?auto_427627 ?auto_427631 ) ) ( not ( = ?auto_427627 ?auto_427632 ) ) ( not ( = ?auto_427627 ?auto_427633 ) ) ( not ( = ?auto_427627 ?auto_427634 ) ) ( not ( = ?auto_427628 ?auto_427629 ) ) ( not ( = ?auto_427628 ?auto_427630 ) ) ( not ( = ?auto_427628 ?auto_427631 ) ) ( not ( = ?auto_427628 ?auto_427632 ) ) ( not ( = ?auto_427628 ?auto_427633 ) ) ( not ( = ?auto_427628 ?auto_427634 ) ) ( not ( = ?auto_427629 ?auto_427630 ) ) ( not ( = ?auto_427629 ?auto_427631 ) ) ( not ( = ?auto_427629 ?auto_427632 ) ) ( not ( = ?auto_427629 ?auto_427633 ) ) ( not ( = ?auto_427629 ?auto_427634 ) ) ( not ( = ?auto_427630 ?auto_427631 ) ) ( not ( = ?auto_427630 ?auto_427632 ) ) ( not ( = ?auto_427630 ?auto_427633 ) ) ( not ( = ?auto_427630 ?auto_427634 ) ) ( not ( = ?auto_427631 ?auto_427632 ) ) ( not ( = ?auto_427631 ?auto_427633 ) ) ( not ( = ?auto_427631 ?auto_427634 ) ) ( not ( = ?auto_427632 ?auto_427633 ) ) ( not ( = ?auto_427632 ?auto_427634 ) ) ( not ( = ?auto_427633 ?auto_427634 ) ) ( ON ?auto_427632 ?auto_427633 ) ( CLEAR ?auto_427630 ) ( ON ?auto_427631 ?auto_427632 ) ( CLEAR ?auto_427631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_427619 ?auto_427620 ?auto_427621 ?auto_427622 ?auto_427623 ?auto_427624 ?auto_427625 ?auto_427626 ?auto_427627 ?auto_427628 ?auto_427629 ?auto_427630 ?auto_427631 )
      ( MAKE-15PILE ?auto_427619 ?auto_427620 ?auto_427621 ?auto_427622 ?auto_427623 ?auto_427624 ?auto_427625 ?auto_427626 ?auto_427627 ?auto_427628 ?auto_427629 ?auto_427630 ?auto_427631 ?auto_427632 ?auto_427633 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_427650 - BLOCK
      ?auto_427651 - BLOCK
      ?auto_427652 - BLOCK
      ?auto_427653 - BLOCK
      ?auto_427654 - BLOCK
      ?auto_427655 - BLOCK
      ?auto_427656 - BLOCK
      ?auto_427657 - BLOCK
      ?auto_427658 - BLOCK
      ?auto_427659 - BLOCK
      ?auto_427660 - BLOCK
      ?auto_427661 - BLOCK
      ?auto_427662 - BLOCK
      ?auto_427663 - BLOCK
      ?auto_427664 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_427664 ) ( ON-TABLE ?auto_427650 ) ( ON ?auto_427651 ?auto_427650 ) ( ON ?auto_427652 ?auto_427651 ) ( ON ?auto_427653 ?auto_427652 ) ( ON ?auto_427654 ?auto_427653 ) ( ON ?auto_427655 ?auto_427654 ) ( ON ?auto_427656 ?auto_427655 ) ( ON ?auto_427657 ?auto_427656 ) ( ON ?auto_427658 ?auto_427657 ) ( ON ?auto_427659 ?auto_427658 ) ( ON ?auto_427660 ?auto_427659 ) ( ON ?auto_427661 ?auto_427660 ) ( not ( = ?auto_427650 ?auto_427651 ) ) ( not ( = ?auto_427650 ?auto_427652 ) ) ( not ( = ?auto_427650 ?auto_427653 ) ) ( not ( = ?auto_427650 ?auto_427654 ) ) ( not ( = ?auto_427650 ?auto_427655 ) ) ( not ( = ?auto_427650 ?auto_427656 ) ) ( not ( = ?auto_427650 ?auto_427657 ) ) ( not ( = ?auto_427650 ?auto_427658 ) ) ( not ( = ?auto_427650 ?auto_427659 ) ) ( not ( = ?auto_427650 ?auto_427660 ) ) ( not ( = ?auto_427650 ?auto_427661 ) ) ( not ( = ?auto_427650 ?auto_427662 ) ) ( not ( = ?auto_427650 ?auto_427663 ) ) ( not ( = ?auto_427650 ?auto_427664 ) ) ( not ( = ?auto_427651 ?auto_427652 ) ) ( not ( = ?auto_427651 ?auto_427653 ) ) ( not ( = ?auto_427651 ?auto_427654 ) ) ( not ( = ?auto_427651 ?auto_427655 ) ) ( not ( = ?auto_427651 ?auto_427656 ) ) ( not ( = ?auto_427651 ?auto_427657 ) ) ( not ( = ?auto_427651 ?auto_427658 ) ) ( not ( = ?auto_427651 ?auto_427659 ) ) ( not ( = ?auto_427651 ?auto_427660 ) ) ( not ( = ?auto_427651 ?auto_427661 ) ) ( not ( = ?auto_427651 ?auto_427662 ) ) ( not ( = ?auto_427651 ?auto_427663 ) ) ( not ( = ?auto_427651 ?auto_427664 ) ) ( not ( = ?auto_427652 ?auto_427653 ) ) ( not ( = ?auto_427652 ?auto_427654 ) ) ( not ( = ?auto_427652 ?auto_427655 ) ) ( not ( = ?auto_427652 ?auto_427656 ) ) ( not ( = ?auto_427652 ?auto_427657 ) ) ( not ( = ?auto_427652 ?auto_427658 ) ) ( not ( = ?auto_427652 ?auto_427659 ) ) ( not ( = ?auto_427652 ?auto_427660 ) ) ( not ( = ?auto_427652 ?auto_427661 ) ) ( not ( = ?auto_427652 ?auto_427662 ) ) ( not ( = ?auto_427652 ?auto_427663 ) ) ( not ( = ?auto_427652 ?auto_427664 ) ) ( not ( = ?auto_427653 ?auto_427654 ) ) ( not ( = ?auto_427653 ?auto_427655 ) ) ( not ( = ?auto_427653 ?auto_427656 ) ) ( not ( = ?auto_427653 ?auto_427657 ) ) ( not ( = ?auto_427653 ?auto_427658 ) ) ( not ( = ?auto_427653 ?auto_427659 ) ) ( not ( = ?auto_427653 ?auto_427660 ) ) ( not ( = ?auto_427653 ?auto_427661 ) ) ( not ( = ?auto_427653 ?auto_427662 ) ) ( not ( = ?auto_427653 ?auto_427663 ) ) ( not ( = ?auto_427653 ?auto_427664 ) ) ( not ( = ?auto_427654 ?auto_427655 ) ) ( not ( = ?auto_427654 ?auto_427656 ) ) ( not ( = ?auto_427654 ?auto_427657 ) ) ( not ( = ?auto_427654 ?auto_427658 ) ) ( not ( = ?auto_427654 ?auto_427659 ) ) ( not ( = ?auto_427654 ?auto_427660 ) ) ( not ( = ?auto_427654 ?auto_427661 ) ) ( not ( = ?auto_427654 ?auto_427662 ) ) ( not ( = ?auto_427654 ?auto_427663 ) ) ( not ( = ?auto_427654 ?auto_427664 ) ) ( not ( = ?auto_427655 ?auto_427656 ) ) ( not ( = ?auto_427655 ?auto_427657 ) ) ( not ( = ?auto_427655 ?auto_427658 ) ) ( not ( = ?auto_427655 ?auto_427659 ) ) ( not ( = ?auto_427655 ?auto_427660 ) ) ( not ( = ?auto_427655 ?auto_427661 ) ) ( not ( = ?auto_427655 ?auto_427662 ) ) ( not ( = ?auto_427655 ?auto_427663 ) ) ( not ( = ?auto_427655 ?auto_427664 ) ) ( not ( = ?auto_427656 ?auto_427657 ) ) ( not ( = ?auto_427656 ?auto_427658 ) ) ( not ( = ?auto_427656 ?auto_427659 ) ) ( not ( = ?auto_427656 ?auto_427660 ) ) ( not ( = ?auto_427656 ?auto_427661 ) ) ( not ( = ?auto_427656 ?auto_427662 ) ) ( not ( = ?auto_427656 ?auto_427663 ) ) ( not ( = ?auto_427656 ?auto_427664 ) ) ( not ( = ?auto_427657 ?auto_427658 ) ) ( not ( = ?auto_427657 ?auto_427659 ) ) ( not ( = ?auto_427657 ?auto_427660 ) ) ( not ( = ?auto_427657 ?auto_427661 ) ) ( not ( = ?auto_427657 ?auto_427662 ) ) ( not ( = ?auto_427657 ?auto_427663 ) ) ( not ( = ?auto_427657 ?auto_427664 ) ) ( not ( = ?auto_427658 ?auto_427659 ) ) ( not ( = ?auto_427658 ?auto_427660 ) ) ( not ( = ?auto_427658 ?auto_427661 ) ) ( not ( = ?auto_427658 ?auto_427662 ) ) ( not ( = ?auto_427658 ?auto_427663 ) ) ( not ( = ?auto_427658 ?auto_427664 ) ) ( not ( = ?auto_427659 ?auto_427660 ) ) ( not ( = ?auto_427659 ?auto_427661 ) ) ( not ( = ?auto_427659 ?auto_427662 ) ) ( not ( = ?auto_427659 ?auto_427663 ) ) ( not ( = ?auto_427659 ?auto_427664 ) ) ( not ( = ?auto_427660 ?auto_427661 ) ) ( not ( = ?auto_427660 ?auto_427662 ) ) ( not ( = ?auto_427660 ?auto_427663 ) ) ( not ( = ?auto_427660 ?auto_427664 ) ) ( not ( = ?auto_427661 ?auto_427662 ) ) ( not ( = ?auto_427661 ?auto_427663 ) ) ( not ( = ?auto_427661 ?auto_427664 ) ) ( not ( = ?auto_427662 ?auto_427663 ) ) ( not ( = ?auto_427662 ?auto_427664 ) ) ( not ( = ?auto_427663 ?auto_427664 ) ) ( ON ?auto_427663 ?auto_427664 ) ( CLEAR ?auto_427661 ) ( ON ?auto_427662 ?auto_427663 ) ( CLEAR ?auto_427662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_427650 ?auto_427651 ?auto_427652 ?auto_427653 ?auto_427654 ?auto_427655 ?auto_427656 ?auto_427657 ?auto_427658 ?auto_427659 ?auto_427660 ?auto_427661 ?auto_427662 )
      ( MAKE-15PILE ?auto_427650 ?auto_427651 ?auto_427652 ?auto_427653 ?auto_427654 ?auto_427655 ?auto_427656 ?auto_427657 ?auto_427658 ?auto_427659 ?auto_427660 ?auto_427661 ?auto_427662 ?auto_427663 ?auto_427664 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_427680 - BLOCK
      ?auto_427681 - BLOCK
      ?auto_427682 - BLOCK
      ?auto_427683 - BLOCK
      ?auto_427684 - BLOCK
      ?auto_427685 - BLOCK
      ?auto_427686 - BLOCK
      ?auto_427687 - BLOCK
      ?auto_427688 - BLOCK
      ?auto_427689 - BLOCK
      ?auto_427690 - BLOCK
      ?auto_427691 - BLOCK
      ?auto_427692 - BLOCK
      ?auto_427693 - BLOCK
      ?auto_427694 - BLOCK
    )
    :vars
    (
      ?auto_427695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_427694 ?auto_427695 ) ( ON-TABLE ?auto_427680 ) ( ON ?auto_427681 ?auto_427680 ) ( ON ?auto_427682 ?auto_427681 ) ( ON ?auto_427683 ?auto_427682 ) ( ON ?auto_427684 ?auto_427683 ) ( ON ?auto_427685 ?auto_427684 ) ( ON ?auto_427686 ?auto_427685 ) ( ON ?auto_427687 ?auto_427686 ) ( ON ?auto_427688 ?auto_427687 ) ( ON ?auto_427689 ?auto_427688 ) ( ON ?auto_427690 ?auto_427689 ) ( not ( = ?auto_427680 ?auto_427681 ) ) ( not ( = ?auto_427680 ?auto_427682 ) ) ( not ( = ?auto_427680 ?auto_427683 ) ) ( not ( = ?auto_427680 ?auto_427684 ) ) ( not ( = ?auto_427680 ?auto_427685 ) ) ( not ( = ?auto_427680 ?auto_427686 ) ) ( not ( = ?auto_427680 ?auto_427687 ) ) ( not ( = ?auto_427680 ?auto_427688 ) ) ( not ( = ?auto_427680 ?auto_427689 ) ) ( not ( = ?auto_427680 ?auto_427690 ) ) ( not ( = ?auto_427680 ?auto_427691 ) ) ( not ( = ?auto_427680 ?auto_427692 ) ) ( not ( = ?auto_427680 ?auto_427693 ) ) ( not ( = ?auto_427680 ?auto_427694 ) ) ( not ( = ?auto_427680 ?auto_427695 ) ) ( not ( = ?auto_427681 ?auto_427682 ) ) ( not ( = ?auto_427681 ?auto_427683 ) ) ( not ( = ?auto_427681 ?auto_427684 ) ) ( not ( = ?auto_427681 ?auto_427685 ) ) ( not ( = ?auto_427681 ?auto_427686 ) ) ( not ( = ?auto_427681 ?auto_427687 ) ) ( not ( = ?auto_427681 ?auto_427688 ) ) ( not ( = ?auto_427681 ?auto_427689 ) ) ( not ( = ?auto_427681 ?auto_427690 ) ) ( not ( = ?auto_427681 ?auto_427691 ) ) ( not ( = ?auto_427681 ?auto_427692 ) ) ( not ( = ?auto_427681 ?auto_427693 ) ) ( not ( = ?auto_427681 ?auto_427694 ) ) ( not ( = ?auto_427681 ?auto_427695 ) ) ( not ( = ?auto_427682 ?auto_427683 ) ) ( not ( = ?auto_427682 ?auto_427684 ) ) ( not ( = ?auto_427682 ?auto_427685 ) ) ( not ( = ?auto_427682 ?auto_427686 ) ) ( not ( = ?auto_427682 ?auto_427687 ) ) ( not ( = ?auto_427682 ?auto_427688 ) ) ( not ( = ?auto_427682 ?auto_427689 ) ) ( not ( = ?auto_427682 ?auto_427690 ) ) ( not ( = ?auto_427682 ?auto_427691 ) ) ( not ( = ?auto_427682 ?auto_427692 ) ) ( not ( = ?auto_427682 ?auto_427693 ) ) ( not ( = ?auto_427682 ?auto_427694 ) ) ( not ( = ?auto_427682 ?auto_427695 ) ) ( not ( = ?auto_427683 ?auto_427684 ) ) ( not ( = ?auto_427683 ?auto_427685 ) ) ( not ( = ?auto_427683 ?auto_427686 ) ) ( not ( = ?auto_427683 ?auto_427687 ) ) ( not ( = ?auto_427683 ?auto_427688 ) ) ( not ( = ?auto_427683 ?auto_427689 ) ) ( not ( = ?auto_427683 ?auto_427690 ) ) ( not ( = ?auto_427683 ?auto_427691 ) ) ( not ( = ?auto_427683 ?auto_427692 ) ) ( not ( = ?auto_427683 ?auto_427693 ) ) ( not ( = ?auto_427683 ?auto_427694 ) ) ( not ( = ?auto_427683 ?auto_427695 ) ) ( not ( = ?auto_427684 ?auto_427685 ) ) ( not ( = ?auto_427684 ?auto_427686 ) ) ( not ( = ?auto_427684 ?auto_427687 ) ) ( not ( = ?auto_427684 ?auto_427688 ) ) ( not ( = ?auto_427684 ?auto_427689 ) ) ( not ( = ?auto_427684 ?auto_427690 ) ) ( not ( = ?auto_427684 ?auto_427691 ) ) ( not ( = ?auto_427684 ?auto_427692 ) ) ( not ( = ?auto_427684 ?auto_427693 ) ) ( not ( = ?auto_427684 ?auto_427694 ) ) ( not ( = ?auto_427684 ?auto_427695 ) ) ( not ( = ?auto_427685 ?auto_427686 ) ) ( not ( = ?auto_427685 ?auto_427687 ) ) ( not ( = ?auto_427685 ?auto_427688 ) ) ( not ( = ?auto_427685 ?auto_427689 ) ) ( not ( = ?auto_427685 ?auto_427690 ) ) ( not ( = ?auto_427685 ?auto_427691 ) ) ( not ( = ?auto_427685 ?auto_427692 ) ) ( not ( = ?auto_427685 ?auto_427693 ) ) ( not ( = ?auto_427685 ?auto_427694 ) ) ( not ( = ?auto_427685 ?auto_427695 ) ) ( not ( = ?auto_427686 ?auto_427687 ) ) ( not ( = ?auto_427686 ?auto_427688 ) ) ( not ( = ?auto_427686 ?auto_427689 ) ) ( not ( = ?auto_427686 ?auto_427690 ) ) ( not ( = ?auto_427686 ?auto_427691 ) ) ( not ( = ?auto_427686 ?auto_427692 ) ) ( not ( = ?auto_427686 ?auto_427693 ) ) ( not ( = ?auto_427686 ?auto_427694 ) ) ( not ( = ?auto_427686 ?auto_427695 ) ) ( not ( = ?auto_427687 ?auto_427688 ) ) ( not ( = ?auto_427687 ?auto_427689 ) ) ( not ( = ?auto_427687 ?auto_427690 ) ) ( not ( = ?auto_427687 ?auto_427691 ) ) ( not ( = ?auto_427687 ?auto_427692 ) ) ( not ( = ?auto_427687 ?auto_427693 ) ) ( not ( = ?auto_427687 ?auto_427694 ) ) ( not ( = ?auto_427687 ?auto_427695 ) ) ( not ( = ?auto_427688 ?auto_427689 ) ) ( not ( = ?auto_427688 ?auto_427690 ) ) ( not ( = ?auto_427688 ?auto_427691 ) ) ( not ( = ?auto_427688 ?auto_427692 ) ) ( not ( = ?auto_427688 ?auto_427693 ) ) ( not ( = ?auto_427688 ?auto_427694 ) ) ( not ( = ?auto_427688 ?auto_427695 ) ) ( not ( = ?auto_427689 ?auto_427690 ) ) ( not ( = ?auto_427689 ?auto_427691 ) ) ( not ( = ?auto_427689 ?auto_427692 ) ) ( not ( = ?auto_427689 ?auto_427693 ) ) ( not ( = ?auto_427689 ?auto_427694 ) ) ( not ( = ?auto_427689 ?auto_427695 ) ) ( not ( = ?auto_427690 ?auto_427691 ) ) ( not ( = ?auto_427690 ?auto_427692 ) ) ( not ( = ?auto_427690 ?auto_427693 ) ) ( not ( = ?auto_427690 ?auto_427694 ) ) ( not ( = ?auto_427690 ?auto_427695 ) ) ( not ( = ?auto_427691 ?auto_427692 ) ) ( not ( = ?auto_427691 ?auto_427693 ) ) ( not ( = ?auto_427691 ?auto_427694 ) ) ( not ( = ?auto_427691 ?auto_427695 ) ) ( not ( = ?auto_427692 ?auto_427693 ) ) ( not ( = ?auto_427692 ?auto_427694 ) ) ( not ( = ?auto_427692 ?auto_427695 ) ) ( not ( = ?auto_427693 ?auto_427694 ) ) ( not ( = ?auto_427693 ?auto_427695 ) ) ( not ( = ?auto_427694 ?auto_427695 ) ) ( ON ?auto_427693 ?auto_427694 ) ( ON ?auto_427692 ?auto_427693 ) ( CLEAR ?auto_427690 ) ( ON ?auto_427691 ?auto_427692 ) ( CLEAR ?auto_427691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_427680 ?auto_427681 ?auto_427682 ?auto_427683 ?auto_427684 ?auto_427685 ?auto_427686 ?auto_427687 ?auto_427688 ?auto_427689 ?auto_427690 ?auto_427691 )
      ( MAKE-15PILE ?auto_427680 ?auto_427681 ?auto_427682 ?auto_427683 ?auto_427684 ?auto_427685 ?auto_427686 ?auto_427687 ?auto_427688 ?auto_427689 ?auto_427690 ?auto_427691 ?auto_427692 ?auto_427693 ?auto_427694 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_427711 - BLOCK
      ?auto_427712 - BLOCK
      ?auto_427713 - BLOCK
      ?auto_427714 - BLOCK
      ?auto_427715 - BLOCK
      ?auto_427716 - BLOCK
      ?auto_427717 - BLOCK
      ?auto_427718 - BLOCK
      ?auto_427719 - BLOCK
      ?auto_427720 - BLOCK
      ?auto_427721 - BLOCK
      ?auto_427722 - BLOCK
      ?auto_427723 - BLOCK
      ?auto_427724 - BLOCK
      ?auto_427725 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_427725 ) ( ON-TABLE ?auto_427711 ) ( ON ?auto_427712 ?auto_427711 ) ( ON ?auto_427713 ?auto_427712 ) ( ON ?auto_427714 ?auto_427713 ) ( ON ?auto_427715 ?auto_427714 ) ( ON ?auto_427716 ?auto_427715 ) ( ON ?auto_427717 ?auto_427716 ) ( ON ?auto_427718 ?auto_427717 ) ( ON ?auto_427719 ?auto_427718 ) ( ON ?auto_427720 ?auto_427719 ) ( ON ?auto_427721 ?auto_427720 ) ( not ( = ?auto_427711 ?auto_427712 ) ) ( not ( = ?auto_427711 ?auto_427713 ) ) ( not ( = ?auto_427711 ?auto_427714 ) ) ( not ( = ?auto_427711 ?auto_427715 ) ) ( not ( = ?auto_427711 ?auto_427716 ) ) ( not ( = ?auto_427711 ?auto_427717 ) ) ( not ( = ?auto_427711 ?auto_427718 ) ) ( not ( = ?auto_427711 ?auto_427719 ) ) ( not ( = ?auto_427711 ?auto_427720 ) ) ( not ( = ?auto_427711 ?auto_427721 ) ) ( not ( = ?auto_427711 ?auto_427722 ) ) ( not ( = ?auto_427711 ?auto_427723 ) ) ( not ( = ?auto_427711 ?auto_427724 ) ) ( not ( = ?auto_427711 ?auto_427725 ) ) ( not ( = ?auto_427712 ?auto_427713 ) ) ( not ( = ?auto_427712 ?auto_427714 ) ) ( not ( = ?auto_427712 ?auto_427715 ) ) ( not ( = ?auto_427712 ?auto_427716 ) ) ( not ( = ?auto_427712 ?auto_427717 ) ) ( not ( = ?auto_427712 ?auto_427718 ) ) ( not ( = ?auto_427712 ?auto_427719 ) ) ( not ( = ?auto_427712 ?auto_427720 ) ) ( not ( = ?auto_427712 ?auto_427721 ) ) ( not ( = ?auto_427712 ?auto_427722 ) ) ( not ( = ?auto_427712 ?auto_427723 ) ) ( not ( = ?auto_427712 ?auto_427724 ) ) ( not ( = ?auto_427712 ?auto_427725 ) ) ( not ( = ?auto_427713 ?auto_427714 ) ) ( not ( = ?auto_427713 ?auto_427715 ) ) ( not ( = ?auto_427713 ?auto_427716 ) ) ( not ( = ?auto_427713 ?auto_427717 ) ) ( not ( = ?auto_427713 ?auto_427718 ) ) ( not ( = ?auto_427713 ?auto_427719 ) ) ( not ( = ?auto_427713 ?auto_427720 ) ) ( not ( = ?auto_427713 ?auto_427721 ) ) ( not ( = ?auto_427713 ?auto_427722 ) ) ( not ( = ?auto_427713 ?auto_427723 ) ) ( not ( = ?auto_427713 ?auto_427724 ) ) ( not ( = ?auto_427713 ?auto_427725 ) ) ( not ( = ?auto_427714 ?auto_427715 ) ) ( not ( = ?auto_427714 ?auto_427716 ) ) ( not ( = ?auto_427714 ?auto_427717 ) ) ( not ( = ?auto_427714 ?auto_427718 ) ) ( not ( = ?auto_427714 ?auto_427719 ) ) ( not ( = ?auto_427714 ?auto_427720 ) ) ( not ( = ?auto_427714 ?auto_427721 ) ) ( not ( = ?auto_427714 ?auto_427722 ) ) ( not ( = ?auto_427714 ?auto_427723 ) ) ( not ( = ?auto_427714 ?auto_427724 ) ) ( not ( = ?auto_427714 ?auto_427725 ) ) ( not ( = ?auto_427715 ?auto_427716 ) ) ( not ( = ?auto_427715 ?auto_427717 ) ) ( not ( = ?auto_427715 ?auto_427718 ) ) ( not ( = ?auto_427715 ?auto_427719 ) ) ( not ( = ?auto_427715 ?auto_427720 ) ) ( not ( = ?auto_427715 ?auto_427721 ) ) ( not ( = ?auto_427715 ?auto_427722 ) ) ( not ( = ?auto_427715 ?auto_427723 ) ) ( not ( = ?auto_427715 ?auto_427724 ) ) ( not ( = ?auto_427715 ?auto_427725 ) ) ( not ( = ?auto_427716 ?auto_427717 ) ) ( not ( = ?auto_427716 ?auto_427718 ) ) ( not ( = ?auto_427716 ?auto_427719 ) ) ( not ( = ?auto_427716 ?auto_427720 ) ) ( not ( = ?auto_427716 ?auto_427721 ) ) ( not ( = ?auto_427716 ?auto_427722 ) ) ( not ( = ?auto_427716 ?auto_427723 ) ) ( not ( = ?auto_427716 ?auto_427724 ) ) ( not ( = ?auto_427716 ?auto_427725 ) ) ( not ( = ?auto_427717 ?auto_427718 ) ) ( not ( = ?auto_427717 ?auto_427719 ) ) ( not ( = ?auto_427717 ?auto_427720 ) ) ( not ( = ?auto_427717 ?auto_427721 ) ) ( not ( = ?auto_427717 ?auto_427722 ) ) ( not ( = ?auto_427717 ?auto_427723 ) ) ( not ( = ?auto_427717 ?auto_427724 ) ) ( not ( = ?auto_427717 ?auto_427725 ) ) ( not ( = ?auto_427718 ?auto_427719 ) ) ( not ( = ?auto_427718 ?auto_427720 ) ) ( not ( = ?auto_427718 ?auto_427721 ) ) ( not ( = ?auto_427718 ?auto_427722 ) ) ( not ( = ?auto_427718 ?auto_427723 ) ) ( not ( = ?auto_427718 ?auto_427724 ) ) ( not ( = ?auto_427718 ?auto_427725 ) ) ( not ( = ?auto_427719 ?auto_427720 ) ) ( not ( = ?auto_427719 ?auto_427721 ) ) ( not ( = ?auto_427719 ?auto_427722 ) ) ( not ( = ?auto_427719 ?auto_427723 ) ) ( not ( = ?auto_427719 ?auto_427724 ) ) ( not ( = ?auto_427719 ?auto_427725 ) ) ( not ( = ?auto_427720 ?auto_427721 ) ) ( not ( = ?auto_427720 ?auto_427722 ) ) ( not ( = ?auto_427720 ?auto_427723 ) ) ( not ( = ?auto_427720 ?auto_427724 ) ) ( not ( = ?auto_427720 ?auto_427725 ) ) ( not ( = ?auto_427721 ?auto_427722 ) ) ( not ( = ?auto_427721 ?auto_427723 ) ) ( not ( = ?auto_427721 ?auto_427724 ) ) ( not ( = ?auto_427721 ?auto_427725 ) ) ( not ( = ?auto_427722 ?auto_427723 ) ) ( not ( = ?auto_427722 ?auto_427724 ) ) ( not ( = ?auto_427722 ?auto_427725 ) ) ( not ( = ?auto_427723 ?auto_427724 ) ) ( not ( = ?auto_427723 ?auto_427725 ) ) ( not ( = ?auto_427724 ?auto_427725 ) ) ( ON ?auto_427724 ?auto_427725 ) ( ON ?auto_427723 ?auto_427724 ) ( CLEAR ?auto_427721 ) ( ON ?auto_427722 ?auto_427723 ) ( CLEAR ?auto_427722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_427711 ?auto_427712 ?auto_427713 ?auto_427714 ?auto_427715 ?auto_427716 ?auto_427717 ?auto_427718 ?auto_427719 ?auto_427720 ?auto_427721 ?auto_427722 )
      ( MAKE-15PILE ?auto_427711 ?auto_427712 ?auto_427713 ?auto_427714 ?auto_427715 ?auto_427716 ?auto_427717 ?auto_427718 ?auto_427719 ?auto_427720 ?auto_427721 ?auto_427722 ?auto_427723 ?auto_427724 ?auto_427725 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_427741 - BLOCK
      ?auto_427742 - BLOCK
      ?auto_427743 - BLOCK
      ?auto_427744 - BLOCK
      ?auto_427745 - BLOCK
      ?auto_427746 - BLOCK
      ?auto_427747 - BLOCK
      ?auto_427748 - BLOCK
      ?auto_427749 - BLOCK
      ?auto_427750 - BLOCK
      ?auto_427751 - BLOCK
      ?auto_427752 - BLOCK
      ?auto_427753 - BLOCK
      ?auto_427754 - BLOCK
      ?auto_427755 - BLOCK
    )
    :vars
    (
      ?auto_427756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_427755 ?auto_427756 ) ( ON-TABLE ?auto_427741 ) ( ON ?auto_427742 ?auto_427741 ) ( ON ?auto_427743 ?auto_427742 ) ( ON ?auto_427744 ?auto_427743 ) ( ON ?auto_427745 ?auto_427744 ) ( ON ?auto_427746 ?auto_427745 ) ( ON ?auto_427747 ?auto_427746 ) ( ON ?auto_427748 ?auto_427747 ) ( ON ?auto_427749 ?auto_427748 ) ( ON ?auto_427750 ?auto_427749 ) ( not ( = ?auto_427741 ?auto_427742 ) ) ( not ( = ?auto_427741 ?auto_427743 ) ) ( not ( = ?auto_427741 ?auto_427744 ) ) ( not ( = ?auto_427741 ?auto_427745 ) ) ( not ( = ?auto_427741 ?auto_427746 ) ) ( not ( = ?auto_427741 ?auto_427747 ) ) ( not ( = ?auto_427741 ?auto_427748 ) ) ( not ( = ?auto_427741 ?auto_427749 ) ) ( not ( = ?auto_427741 ?auto_427750 ) ) ( not ( = ?auto_427741 ?auto_427751 ) ) ( not ( = ?auto_427741 ?auto_427752 ) ) ( not ( = ?auto_427741 ?auto_427753 ) ) ( not ( = ?auto_427741 ?auto_427754 ) ) ( not ( = ?auto_427741 ?auto_427755 ) ) ( not ( = ?auto_427741 ?auto_427756 ) ) ( not ( = ?auto_427742 ?auto_427743 ) ) ( not ( = ?auto_427742 ?auto_427744 ) ) ( not ( = ?auto_427742 ?auto_427745 ) ) ( not ( = ?auto_427742 ?auto_427746 ) ) ( not ( = ?auto_427742 ?auto_427747 ) ) ( not ( = ?auto_427742 ?auto_427748 ) ) ( not ( = ?auto_427742 ?auto_427749 ) ) ( not ( = ?auto_427742 ?auto_427750 ) ) ( not ( = ?auto_427742 ?auto_427751 ) ) ( not ( = ?auto_427742 ?auto_427752 ) ) ( not ( = ?auto_427742 ?auto_427753 ) ) ( not ( = ?auto_427742 ?auto_427754 ) ) ( not ( = ?auto_427742 ?auto_427755 ) ) ( not ( = ?auto_427742 ?auto_427756 ) ) ( not ( = ?auto_427743 ?auto_427744 ) ) ( not ( = ?auto_427743 ?auto_427745 ) ) ( not ( = ?auto_427743 ?auto_427746 ) ) ( not ( = ?auto_427743 ?auto_427747 ) ) ( not ( = ?auto_427743 ?auto_427748 ) ) ( not ( = ?auto_427743 ?auto_427749 ) ) ( not ( = ?auto_427743 ?auto_427750 ) ) ( not ( = ?auto_427743 ?auto_427751 ) ) ( not ( = ?auto_427743 ?auto_427752 ) ) ( not ( = ?auto_427743 ?auto_427753 ) ) ( not ( = ?auto_427743 ?auto_427754 ) ) ( not ( = ?auto_427743 ?auto_427755 ) ) ( not ( = ?auto_427743 ?auto_427756 ) ) ( not ( = ?auto_427744 ?auto_427745 ) ) ( not ( = ?auto_427744 ?auto_427746 ) ) ( not ( = ?auto_427744 ?auto_427747 ) ) ( not ( = ?auto_427744 ?auto_427748 ) ) ( not ( = ?auto_427744 ?auto_427749 ) ) ( not ( = ?auto_427744 ?auto_427750 ) ) ( not ( = ?auto_427744 ?auto_427751 ) ) ( not ( = ?auto_427744 ?auto_427752 ) ) ( not ( = ?auto_427744 ?auto_427753 ) ) ( not ( = ?auto_427744 ?auto_427754 ) ) ( not ( = ?auto_427744 ?auto_427755 ) ) ( not ( = ?auto_427744 ?auto_427756 ) ) ( not ( = ?auto_427745 ?auto_427746 ) ) ( not ( = ?auto_427745 ?auto_427747 ) ) ( not ( = ?auto_427745 ?auto_427748 ) ) ( not ( = ?auto_427745 ?auto_427749 ) ) ( not ( = ?auto_427745 ?auto_427750 ) ) ( not ( = ?auto_427745 ?auto_427751 ) ) ( not ( = ?auto_427745 ?auto_427752 ) ) ( not ( = ?auto_427745 ?auto_427753 ) ) ( not ( = ?auto_427745 ?auto_427754 ) ) ( not ( = ?auto_427745 ?auto_427755 ) ) ( not ( = ?auto_427745 ?auto_427756 ) ) ( not ( = ?auto_427746 ?auto_427747 ) ) ( not ( = ?auto_427746 ?auto_427748 ) ) ( not ( = ?auto_427746 ?auto_427749 ) ) ( not ( = ?auto_427746 ?auto_427750 ) ) ( not ( = ?auto_427746 ?auto_427751 ) ) ( not ( = ?auto_427746 ?auto_427752 ) ) ( not ( = ?auto_427746 ?auto_427753 ) ) ( not ( = ?auto_427746 ?auto_427754 ) ) ( not ( = ?auto_427746 ?auto_427755 ) ) ( not ( = ?auto_427746 ?auto_427756 ) ) ( not ( = ?auto_427747 ?auto_427748 ) ) ( not ( = ?auto_427747 ?auto_427749 ) ) ( not ( = ?auto_427747 ?auto_427750 ) ) ( not ( = ?auto_427747 ?auto_427751 ) ) ( not ( = ?auto_427747 ?auto_427752 ) ) ( not ( = ?auto_427747 ?auto_427753 ) ) ( not ( = ?auto_427747 ?auto_427754 ) ) ( not ( = ?auto_427747 ?auto_427755 ) ) ( not ( = ?auto_427747 ?auto_427756 ) ) ( not ( = ?auto_427748 ?auto_427749 ) ) ( not ( = ?auto_427748 ?auto_427750 ) ) ( not ( = ?auto_427748 ?auto_427751 ) ) ( not ( = ?auto_427748 ?auto_427752 ) ) ( not ( = ?auto_427748 ?auto_427753 ) ) ( not ( = ?auto_427748 ?auto_427754 ) ) ( not ( = ?auto_427748 ?auto_427755 ) ) ( not ( = ?auto_427748 ?auto_427756 ) ) ( not ( = ?auto_427749 ?auto_427750 ) ) ( not ( = ?auto_427749 ?auto_427751 ) ) ( not ( = ?auto_427749 ?auto_427752 ) ) ( not ( = ?auto_427749 ?auto_427753 ) ) ( not ( = ?auto_427749 ?auto_427754 ) ) ( not ( = ?auto_427749 ?auto_427755 ) ) ( not ( = ?auto_427749 ?auto_427756 ) ) ( not ( = ?auto_427750 ?auto_427751 ) ) ( not ( = ?auto_427750 ?auto_427752 ) ) ( not ( = ?auto_427750 ?auto_427753 ) ) ( not ( = ?auto_427750 ?auto_427754 ) ) ( not ( = ?auto_427750 ?auto_427755 ) ) ( not ( = ?auto_427750 ?auto_427756 ) ) ( not ( = ?auto_427751 ?auto_427752 ) ) ( not ( = ?auto_427751 ?auto_427753 ) ) ( not ( = ?auto_427751 ?auto_427754 ) ) ( not ( = ?auto_427751 ?auto_427755 ) ) ( not ( = ?auto_427751 ?auto_427756 ) ) ( not ( = ?auto_427752 ?auto_427753 ) ) ( not ( = ?auto_427752 ?auto_427754 ) ) ( not ( = ?auto_427752 ?auto_427755 ) ) ( not ( = ?auto_427752 ?auto_427756 ) ) ( not ( = ?auto_427753 ?auto_427754 ) ) ( not ( = ?auto_427753 ?auto_427755 ) ) ( not ( = ?auto_427753 ?auto_427756 ) ) ( not ( = ?auto_427754 ?auto_427755 ) ) ( not ( = ?auto_427754 ?auto_427756 ) ) ( not ( = ?auto_427755 ?auto_427756 ) ) ( ON ?auto_427754 ?auto_427755 ) ( ON ?auto_427753 ?auto_427754 ) ( ON ?auto_427752 ?auto_427753 ) ( CLEAR ?auto_427750 ) ( ON ?auto_427751 ?auto_427752 ) ( CLEAR ?auto_427751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_427741 ?auto_427742 ?auto_427743 ?auto_427744 ?auto_427745 ?auto_427746 ?auto_427747 ?auto_427748 ?auto_427749 ?auto_427750 ?auto_427751 )
      ( MAKE-15PILE ?auto_427741 ?auto_427742 ?auto_427743 ?auto_427744 ?auto_427745 ?auto_427746 ?auto_427747 ?auto_427748 ?auto_427749 ?auto_427750 ?auto_427751 ?auto_427752 ?auto_427753 ?auto_427754 ?auto_427755 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_427772 - BLOCK
      ?auto_427773 - BLOCK
      ?auto_427774 - BLOCK
      ?auto_427775 - BLOCK
      ?auto_427776 - BLOCK
      ?auto_427777 - BLOCK
      ?auto_427778 - BLOCK
      ?auto_427779 - BLOCK
      ?auto_427780 - BLOCK
      ?auto_427781 - BLOCK
      ?auto_427782 - BLOCK
      ?auto_427783 - BLOCK
      ?auto_427784 - BLOCK
      ?auto_427785 - BLOCK
      ?auto_427786 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_427786 ) ( ON-TABLE ?auto_427772 ) ( ON ?auto_427773 ?auto_427772 ) ( ON ?auto_427774 ?auto_427773 ) ( ON ?auto_427775 ?auto_427774 ) ( ON ?auto_427776 ?auto_427775 ) ( ON ?auto_427777 ?auto_427776 ) ( ON ?auto_427778 ?auto_427777 ) ( ON ?auto_427779 ?auto_427778 ) ( ON ?auto_427780 ?auto_427779 ) ( ON ?auto_427781 ?auto_427780 ) ( not ( = ?auto_427772 ?auto_427773 ) ) ( not ( = ?auto_427772 ?auto_427774 ) ) ( not ( = ?auto_427772 ?auto_427775 ) ) ( not ( = ?auto_427772 ?auto_427776 ) ) ( not ( = ?auto_427772 ?auto_427777 ) ) ( not ( = ?auto_427772 ?auto_427778 ) ) ( not ( = ?auto_427772 ?auto_427779 ) ) ( not ( = ?auto_427772 ?auto_427780 ) ) ( not ( = ?auto_427772 ?auto_427781 ) ) ( not ( = ?auto_427772 ?auto_427782 ) ) ( not ( = ?auto_427772 ?auto_427783 ) ) ( not ( = ?auto_427772 ?auto_427784 ) ) ( not ( = ?auto_427772 ?auto_427785 ) ) ( not ( = ?auto_427772 ?auto_427786 ) ) ( not ( = ?auto_427773 ?auto_427774 ) ) ( not ( = ?auto_427773 ?auto_427775 ) ) ( not ( = ?auto_427773 ?auto_427776 ) ) ( not ( = ?auto_427773 ?auto_427777 ) ) ( not ( = ?auto_427773 ?auto_427778 ) ) ( not ( = ?auto_427773 ?auto_427779 ) ) ( not ( = ?auto_427773 ?auto_427780 ) ) ( not ( = ?auto_427773 ?auto_427781 ) ) ( not ( = ?auto_427773 ?auto_427782 ) ) ( not ( = ?auto_427773 ?auto_427783 ) ) ( not ( = ?auto_427773 ?auto_427784 ) ) ( not ( = ?auto_427773 ?auto_427785 ) ) ( not ( = ?auto_427773 ?auto_427786 ) ) ( not ( = ?auto_427774 ?auto_427775 ) ) ( not ( = ?auto_427774 ?auto_427776 ) ) ( not ( = ?auto_427774 ?auto_427777 ) ) ( not ( = ?auto_427774 ?auto_427778 ) ) ( not ( = ?auto_427774 ?auto_427779 ) ) ( not ( = ?auto_427774 ?auto_427780 ) ) ( not ( = ?auto_427774 ?auto_427781 ) ) ( not ( = ?auto_427774 ?auto_427782 ) ) ( not ( = ?auto_427774 ?auto_427783 ) ) ( not ( = ?auto_427774 ?auto_427784 ) ) ( not ( = ?auto_427774 ?auto_427785 ) ) ( not ( = ?auto_427774 ?auto_427786 ) ) ( not ( = ?auto_427775 ?auto_427776 ) ) ( not ( = ?auto_427775 ?auto_427777 ) ) ( not ( = ?auto_427775 ?auto_427778 ) ) ( not ( = ?auto_427775 ?auto_427779 ) ) ( not ( = ?auto_427775 ?auto_427780 ) ) ( not ( = ?auto_427775 ?auto_427781 ) ) ( not ( = ?auto_427775 ?auto_427782 ) ) ( not ( = ?auto_427775 ?auto_427783 ) ) ( not ( = ?auto_427775 ?auto_427784 ) ) ( not ( = ?auto_427775 ?auto_427785 ) ) ( not ( = ?auto_427775 ?auto_427786 ) ) ( not ( = ?auto_427776 ?auto_427777 ) ) ( not ( = ?auto_427776 ?auto_427778 ) ) ( not ( = ?auto_427776 ?auto_427779 ) ) ( not ( = ?auto_427776 ?auto_427780 ) ) ( not ( = ?auto_427776 ?auto_427781 ) ) ( not ( = ?auto_427776 ?auto_427782 ) ) ( not ( = ?auto_427776 ?auto_427783 ) ) ( not ( = ?auto_427776 ?auto_427784 ) ) ( not ( = ?auto_427776 ?auto_427785 ) ) ( not ( = ?auto_427776 ?auto_427786 ) ) ( not ( = ?auto_427777 ?auto_427778 ) ) ( not ( = ?auto_427777 ?auto_427779 ) ) ( not ( = ?auto_427777 ?auto_427780 ) ) ( not ( = ?auto_427777 ?auto_427781 ) ) ( not ( = ?auto_427777 ?auto_427782 ) ) ( not ( = ?auto_427777 ?auto_427783 ) ) ( not ( = ?auto_427777 ?auto_427784 ) ) ( not ( = ?auto_427777 ?auto_427785 ) ) ( not ( = ?auto_427777 ?auto_427786 ) ) ( not ( = ?auto_427778 ?auto_427779 ) ) ( not ( = ?auto_427778 ?auto_427780 ) ) ( not ( = ?auto_427778 ?auto_427781 ) ) ( not ( = ?auto_427778 ?auto_427782 ) ) ( not ( = ?auto_427778 ?auto_427783 ) ) ( not ( = ?auto_427778 ?auto_427784 ) ) ( not ( = ?auto_427778 ?auto_427785 ) ) ( not ( = ?auto_427778 ?auto_427786 ) ) ( not ( = ?auto_427779 ?auto_427780 ) ) ( not ( = ?auto_427779 ?auto_427781 ) ) ( not ( = ?auto_427779 ?auto_427782 ) ) ( not ( = ?auto_427779 ?auto_427783 ) ) ( not ( = ?auto_427779 ?auto_427784 ) ) ( not ( = ?auto_427779 ?auto_427785 ) ) ( not ( = ?auto_427779 ?auto_427786 ) ) ( not ( = ?auto_427780 ?auto_427781 ) ) ( not ( = ?auto_427780 ?auto_427782 ) ) ( not ( = ?auto_427780 ?auto_427783 ) ) ( not ( = ?auto_427780 ?auto_427784 ) ) ( not ( = ?auto_427780 ?auto_427785 ) ) ( not ( = ?auto_427780 ?auto_427786 ) ) ( not ( = ?auto_427781 ?auto_427782 ) ) ( not ( = ?auto_427781 ?auto_427783 ) ) ( not ( = ?auto_427781 ?auto_427784 ) ) ( not ( = ?auto_427781 ?auto_427785 ) ) ( not ( = ?auto_427781 ?auto_427786 ) ) ( not ( = ?auto_427782 ?auto_427783 ) ) ( not ( = ?auto_427782 ?auto_427784 ) ) ( not ( = ?auto_427782 ?auto_427785 ) ) ( not ( = ?auto_427782 ?auto_427786 ) ) ( not ( = ?auto_427783 ?auto_427784 ) ) ( not ( = ?auto_427783 ?auto_427785 ) ) ( not ( = ?auto_427783 ?auto_427786 ) ) ( not ( = ?auto_427784 ?auto_427785 ) ) ( not ( = ?auto_427784 ?auto_427786 ) ) ( not ( = ?auto_427785 ?auto_427786 ) ) ( ON ?auto_427785 ?auto_427786 ) ( ON ?auto_427784 ?auto_427785 ) ( ON ?auto_427783 ?auto_427784 ) ( CLEAR ?auto_427781 ) ( ON ?auto_427782 ?auto_427783 ) ( CLEAR ?auto_427782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_427772 ?auto_427773 ?auto_427774 ?auto_427775 ?auto_427776 ?auto_427777 ?auto_427778 ?auto_427779 ?auto_427780 ?auto_427781 ?auto_427782 )
      ( MAKE-15PILE ?auto_427772 ?auto_427773 ?auto_427774 ?auto_427775 ?auto_427776 ?auto_427777 ?auto_427778 ?auto_427779 ?auto_427780 ?auto_427781 ?auto_427782 ?auto_427783 ?auto_427784 ?auto_427785 ?auto_427786 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_427802 - BLOCK
      ?auto_427803 - BLOCK
      ?auto_427804 - BLOCK
      ?auto_427805 - BLOCK
      ?auto_427806 - BLOCK
      ?auto_427807 - BLOCK
      ?auto_427808 - BLOCK
      ?auto_427809 - BLOCK
      ?auto_427810 - BLOCK
      ?auto_427811 - BLOCK
      ?auto_427812 - BLOCK
      ?auto_427813 - BLOCK
      ?auto_427814 - BLOCK
      ?auto_427815 - BLOCK
      ?auto_427816 - BLOCK
    )
    :vars
    (
      ?auto_427817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_427816 ?auto_427817 ) ( ON-TABLE ?auto_427802 ) ( ON ?auto_427803 ?auto_427802 ) ( ON ?auto_427804 ?auto_427803 ) ( ON ?auto_427805 ?auto_427804 ) ( ON ?auto_427806 ?auto_427805 ) ( ON ?auto_427807 ?auto_427806 ) ( ON ?auto_427808 ?auto_427807 ) ( ON ?auto_427809 ?auto_427808 ) ( ON ?auto_427810 ?auto_427809 ) ( not ( = ?auto_427802 ?auto_427803 ) ) ( not ( = ?auto_427802 ?auto_427804 ) ) ( not ( = ?auto_427802 ?auto_427805 ) ) ( not ( = ?auto_427802 ?auto_427806 ) ) ( not ( = ?auto_427802 ?auto_427807 ) ) ( not ( = ?auto_427802 ?auto_427808 ) ) ( not ( = ?auto_427802 ?auto_427809 ) ) ( not ( = ?auto_427802 ?auto_427810 ) ) ( not ( = ?auto_427802 ?auto_427811 ) ) ( not ( = ?auto_427802 ?auto_427812 ) ) ( not ( = ?auto_427802 ?auto_427813 ) ) ( not ( = ?auto_427802 ?auto_427814 ) ) ( not ( = ?auto_427802 ?auto_427815 ) ) ( not ( = ?auto_427802 ?auto_427816 ) ) ( not ( = ?auto_427802 ?auto_427817 ) ) ( not ( = ?auto_427803 ?auto_427804 ) ) ( not ( = ?auto_427803 ?auto_427805 ) ) ( not ( = ?auto_427803 ?auto_427806 ) ) ( not ( = ?auto_427803 ?auto_427807 ) ) ( not ( = ?auto_427803 ?auto_427808 ) ) ( not ( = ?auto_427803 ?auto_427809 ) ) ( not ( = ?auto_427803 ?auto_427810 ) ) ( not ( = ?auto_427803 ?auto_427811 ) ) ( not ( = ?auto_427803 ?auto_427812 ) ) ( not ( = ?auto_427803 ?auto_427813 ) ) ( not ( = ?auto_427803 ?auto_427814 ) ) ( not ( = ?auto_427803 ?auto_427815 ) ) ( not ( = ?auto_427803 ?auto_427816 ) ) ( not ( = ?auto_427803 ?auto_427817 ) ) ( not ( = ?auto_427804 ?auto_427805 ) ) ( not ( = ?auto_427804 ?auto_427806 ) ) ( not ( = ?auto_427804 ?auto_427807 ) ) ( not ( = ?auto_427804 ?auto_427808 ) ) ( not ( = ?auto_427804 ?auto_427809 ) ) ( not ( = ?auto_427804 ?auto_427810 ) ) ( not ( = ?auto_427804 ?auto_427811 ) ) ( not ( = ?auto_427804 ?auto_427812 ) ) ( not ( = ?auto_427804 ?auto_427813 ) ) ( not ( = ?auto_427804 ?auto_427814 ) ) ( not ( = ?auto_427804 ?auto_427815 ) ) ( not ( = ?auto_427804 ?auto_427816 ) ) ( not ( = ?auto_427804 ?auto_427817 ) ) ( not ( = ?auto_427805 ?auto_427806 ) ) ( not ( = ?auto_427805 ?auto_427807 ) ) ( not ( = ?auto_427805 ?auto_427808 ) ) ( not ( = ?auto_427805 ?auto_427809 ) ) ( not ( = ?auto_427805 ?auto_427810 ) ) ( not ( = ?auto_427805 ?auto_427811 ) ) ( not ( = ?auto_427805 ?auto_427812 ) ) ( not ( = ?auto_427805 ?auto_427813 ) ) ( not ( = ?auto_427805 ?auto_427814 ) ) ( not ( = ?auto_427805 ?auto_427815 ) ) ( not ( = ?auto_427805 ?auto_427816 ) ) ( not ( = ?auto_427805 ?auto_427817 ) ) ( not ( = ?auto_427806 ?auto_427807 ) ) ( not ( = ?auto_427806 ?auto_427808 ) ) ( not ( = ?auto_427806 ?auto_427809 ) ) ( not ( = ?auto_427806 ?auto_427810 ) ) ( not ( = ?auto_427806 ?auto_427811 ) ) ( not ( = ?auto_427806 ?auto_427812 ) ) ( not ( = ?auto_427806 ?auto_427813 ) ) ( not ( = ?auto_427806 ?auto_427814 ) ) ( not ( = ?auto_427806 ?auto_427815 ) ) ( not ( = ?auto_427806 ?auto_427816 ) ) ( not ( = ?auto_427806 ?auto_427817 ) ) ( not ( = ?auto_427807 ?auto_427808 ) ) ( not ( = ?auto_427807 ?auto_427809 ) ) ( not ( = ?auto_427807 ?auto_427810 ) ) ( not ( = ?auto_427807 ?auto_427811 ) ) ( not ( = ?auto_427807 ?auto_427812 ) ) ( not ( = ?auto_427807 ?auto_427813 ) ) ( not ( = ?auto_427807 ?auto_427814 ) ) ( not ( = ?auto_427807 ?auto_427815 ) ) ( not ( = ?auto_427807 ?auto_427816 ) ) ( not ( = ?auto_427807 ?auto_427817 ) ) ( not ( = ?auto_427808 ?auto_427809 ) ) ( not ( = ?auto_427808 ?auto_427810 ) ) ( not ( = ?auto_427808 ?auto_427811 ) ) ( not ( = ?auto_427808 ?auto_427812 ) ) ( not ( = ?auto_427808 ?auto_427813 ) ) ( not ( = ?auto_427808 ?auto_427814 ) ) ( not ( = ?auto_427808 ?auto_427815 ) ) ( not ( = ?auto_427808 ?auto_427816 ) ) ( not ( = ?auto_427808 ?auto_427817 ) ) ( not ( = ?auto_427809 ?auto_427810 ) ) ( not ( = ?auto_427809 ?auto_427811 ) ) ( not ( = ?auto_427809 ?auto_427812 ) ) ( not ( = ?auto_427809 ?auto_427813 ) ) ( not ( = ?auto_427809 ?auto_427814 ) ) ( not ( = ?auto_427809 ?auto_427815 ) ) ( not ( = ?auto_427809 ?auto_427816 ) ) ( not ( = ?auto_427809 ?auto_427817 ) ) ( not ( = ?auto_427810 ?auto_427811 ) ) ( not ( = ?auto_427810 ?auto_427812 ) ) ( not ( = ?auto_427810 ?auto_427813 ) ) ( not ( = ?auto_427810 ?auto_427814 ) ) ( not ( = ?auto_427810 ?auto_427815 ) ) ( not ( = ?auto_427810 ?auto_427816 ) ) ( not ( = ?auto_427810 ?auto_427817 ) ) ( not ( = ?auto_427811 ?auto_427812 ) ) ( not ( = ?auto_427811 ?auto_427813 ) ) ( not ( = ?auto_427811 ?auto_427814 ) ) ( not ( = ?auto_427811 ?auto_427815 ) ) ( not ( = ?auto_427811 ?auto_427816 ) ) ( not ( = ?auto_427811 ?auto_427817 ) ) ( not ( = ?auto_427812 ?auto_427813 ) ) ( not ( = ?auto_427812 ?auto_427814 ) ) ( not ( = ?auto_427812 ?auto_427815 ) ) ( not ( = ?auto_427812 ?auto_427816 ) ) ( not ( = ?auto_427812 ?auto_427817 ) ) ( not ( = ?auto_427813 ?auto_427814 ) ) ( not ( = ?auto_427813 ?auto_427815 ) ) ( not ( = ?auto_427813 ?auto_427816 ) ) ( not ( = ?auto_427813 ?auto_427817 ) ) ( not ( = ?auto_427814 ?auto_427815 ) ) ( not ( = ?auto_427814 ?auto_427816 ) ) ( not ( = ?auto_427814 ?auto_427817 ) ) ( not ( = ?auto_427815 ?auto_427816 ) ) ( not ( = ?auto_427815 ?auto_427817 ) ) ( not ( = ?auto_427816 ?auto_427817 ) ) ( ON ?auto_427815 ?auto_427816 ) ( ON ?auto_427814 ?auto_427815 ) ( ON ?auto_427813 ?auto_427814 ) ( ON ?auto_427812 ?auto_427813 ) ( CLEAR ?auto_427810 ) ( ON ?auto_427811 ?auto_427812 ) ( CLEAR ?auto_427811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_427802 ?auto_427803 ?auto_427804 ?auto_427805 ?auto_427806 ?auto_427807 ?auto_427808 ?auto_427809 ?auto_427810 ?auto_427811 )
      ( MAKE-15PILE ?auto_427802 ?auto_427803 ?auto_427804 ?auto_427805 ?auto_427806 ?auto_427807 ?auto_427808 ?auto_427809 ?auto_427810 ?auto_427811 ?auto_427812 ?auto_427813 ?auto_427814 ?auto_427815 ?auto_427816 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_427833 - BLOCK
      ?auto_427834 - BLOCK
      ?auto_427835 - BLOCK
      ?auto_427836 - BLOCK
      ?auto_427837 - BLOCK
      ?auto_427838 - BLOCK
      ?auto_427839 - BLOCK
      ?auto_427840 - BLOCK
      ?auto_427841 - BLOCK
      ?auto_427842 - BLOCK
      ?auto_427843 - BLOCK
      ?auto_427844 - BLOCK
      ?auto_427845 - BLOCK
      ?auto_427846 - BLOCK
      ?auto_427847 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_427847 ) ( ON-TABLE ?auto_427833 ) ( ON ?auto_427834 ?auto_427833 ) ( ON ?auto_427835 ?auto_427834 ) ( ON ?auto_427836 ?auto_427835 ) ( ON ?auto_427837 ?auto_427836 ) ( ON ?auto_427838 ?auto_427837 ) ( ON ?auto_427839 ?auto_427838 ) ( ON ?auto_427840 ?auto_427839 ) ( ON ?auto_427841 ?auto_427840 ) ( not ( = ?auto_427833 ?auto_427834 ) ) ( not ( = ?auto_427833 ?auto_427835 ) ) ( not ( = ?auto_427833 ?auto_427836 ) ) ( not ( = ?auto_427833 ?auto_427837 ) ) ( not ( = ?auto_427833 ?auto_427838 ) ) ( not ( = ?auto_427833 ?auto_427839 ) ) ( not ( = ?auto_427833 ?auto_427840 ) ) ( not ( = ?auto_427833 ?auto_427841 ) ) ( not ( = ?auto_427833 ?auto_427842 ) ) ( not ( = ?auto_427833 ?auto_427843 ) ) ( not ( = ?auto_427833 ?auto_427844 ) ) ( not ( = ?auto_427833 ?auto_427845 ) ) ( not ( = ?auto_427833 ?auto_427846 ) ) ( not ( = ?auto_427833 ?auto_427847 ) ) ( not ( = ?auto_427834 ?auto_427835 ) ) ( not ( = ?auto_427834 ?auto_427836 ) ) ( not ( = ?auto_427834 ?auto_427837 ) ) ( not ( = ?auto_427834 ?auto_427838 ) ) ( not ( = ?auto_427834 ?auto_427839 ) ) ( not ( = ?auto_427834 ?auto_427840 ) ) ( not ( = ?auto_427834 ?auto_427841 ) ) ( not ( = ?auto_427834 ?auto_427842 ) ) ( not ( = ?auto_427834 ?auto_427843 ) ) ( not ( = ?auto_427834 ?auto_427844 ) ) ( not ( = ?auto_427834 ?auto_427845 ) ) ( not ( = ?auto_427834 ?auto_427846 ) ) ( not ( = ?auto_427834 ?auto_427847 ) ) ( not ( = ?auto_427835 ?auto_427836 ) ) ( not ( = ?auto_427835 ?auto_427837 ) ) ( not ( = ?auto_427835 ?auto_427838 ) ) ( not ( = ?auto_427835 ?auto_427839 ) ) ( not ( = ?auto_427835 ?auto_427840 ) ) ( not ( = ?auto_427835 ?auto_427841 ) ) ( not ( = ?auto_427835 ?auto_427842 ) ) ( not ( = ?auto_427835 ?auto_427843 ) ) ( not ( = ?auto_427835 ?auto_427844 ) ) ( not ( = ?auto_427835 ?auto_427845 ) ) ( not ( = ?auto_427835 ?auto_427846 ) ) ( not ( = ?auto_427835 ?auto_427847 ) ) ( not ( = ?auto_427836 ?auto_427837 ) ) ( not ( = ?auto_427836 ?auto_427838 ) ) ( not ( = ?auto_427836 ?auto_427839 ) ) ( not ( = ?auto_427836 ?auto_427840 ) ) ( not ( = ?auto_427836 ?auto_427841 ) ) ( not ( = ?auto_427836 ?auto_427842 ) ) ( not ( = ?auto_427836 ?auto_427843 ) ) ( not ( = ?auto_427836 ?auto_427844 ) ) ( not ( = ?auto_427836 ?auto_427845 ) ) ( not ( = ?auto_427836 ?auto_427846 ) ) ( not ( = ?auto_427836 ?auto_427847 ) ) ( not ( = ?auto_427837 ?auto_427838 ) ) ( not ( = ?auto_427837 ?auto_427839 ) ) ( not ( = ?auto_427837 ?auto_427840 ) ) ( not ( = ?auto_427837 ?auto_427841 ) ) ( not ( = ?auto_427837 ?auto_427842 ) ) ( not ( = ?auto_427837 ?auto_427843 ) ) ( not ( = ?auto_427837 ?auto_427844 ) ) ( not ( = ?auto_427837 ?auto_427845 ) ) ( not ( = ?auto_427837 ?auto_427846 ) ) ( not ( = ?auto_427837 ?auto_427847 ) ) ( not ( = ?auto_427838 ?auto_427839 ) ) ( not ( = ?auto_427838 ?auto_427840 ) ) ( not ( = ?auto_427838 ?auto_427841 ) ) ( not ( = ?auto_427838 ?auto_427842 ) ) ( not ( = ?auto_427838 ?auto_427843 ) ) ( not ( = ?auto_427838 ?auto_427844 ) ) ( not ( = ?auto_427838 ?auto_427845 ) ) ( not ( = ?auto_427838 ?auto_427846 ) ) ( not ( = ?auto_427838 ?auto_427847 ) ) ( not ( = ?auto_427839 ?auto_427840 ) ) ( not ( = ?auto_427839 ?auto_427841 ) ) ( not ( = ?auto_427839 ?auto_427842 ) ) ( not ( = ?auto_427839 ?auto_427843 ) ) ( not ( = ?auto_427839 ?auto_427844 ) ) ( not ( = ?auto_427839 ?auto_427845 ) ) ( not ( = ?auto_427839 ?auto_427846 ) ) ( not ( = ?auto_427839 ?auto_427847 ) ) ( not ( = ?auto_427840 ?auto_427841 ) ) ( not ( = ?auto_427840 ?auto_427842 ) ) ( not ( = ?auto_427840 ?auto_427843 ) ) ( not ( = ?auto_427840 ?auto_427844 ) ) ( not ( = ?auto_427840 ?auto_427845 ) ) ( not ( = ?auto_427840 ?auto_427846 ) ) ( not ( = ?auto_427840 ?auto_427847 ) ) ( not ( = ?auto_427841 ?auto_427842 ) ) ( not ( = ?auto_427841 ?auto_427843 ) ) ( not ( = ?auto_427841 ?auto_427844 ) ) ( not ( = ?auto_427841 ?auto_427845 ) ) ( not ( = ?auto_427841 ?auto_427846 ) ) ( not ( = ?auto_427841 ?auto_427847 ) ) ( not ( = ?auto_427842 ?auto_427843 ) ) ( not ( = ?auto_427842 ?auto_427844 ) ) ( not ( = ?auto_427842 ?auto_427845 ) ) ( not ( = ?auto_427842 ?auto_427846 ) ) ( not ( = ?auto_427842 ?auto_427847 ) ) ( not ( = ?auto_427843 ?auto_427844 ) ) ( not ( = ?auto_427843 ?auto_427845 ) ) ( not ( = ?auto_427843 ?auto_427846 ) ) ( not ( = ?auto_427843 ?auto_427847 ) ) ( not ( = ?auto_427844 ?auto_427845 ) ) ( not ( = ?auto_427844 ?auto_427846 ) ) ( not ( = ?auto_427844 ?auto_427847 ) ) ( not ( = ?auto_427845 ?auto_427846 ) ) ( not ( = ?auto_427845 ?auto_427847 ) ) ( not ( = ?auto_427846 ?auto_427847 ) ) ( ON ?auto_427846 ?auto_427847 ) ( ON ?auto_427845 ?auto_427846 ) ( ON ?auto_427844 ?auto_427845 ) ( ON ?auto_427843 ?auto_427844 ) ( CLEAR ?auto_427841 ) ( ON ?auto_427842 ?auto_427843 ) ( CLEAR ?auto_427842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_427833 ?auto_427834 ?auto_427835 ?auto_427836 ?auto_427837 ?auto_427838 ?auto_427839 ?auto_427840 ?auto_427841 ?auto_427842 )
      ( MAKE-15PILE ?auto_427833 ?auto_427834 ?auto_427835 ?auto_427836 ?auto_427837 ?auto_427838 ?auto_427839 ?auto_427840 ?auto_427841 ?auto_427842 ?auto_427843 ?auto_427844 ?auto_427845 ?auto_427846 ?auto_427847 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_427863 - BLOCK
      ?auto_427864 - BLOCK
      ?auto_427865 - BLOCK
      ?auto_427866 - BLOCK
      ?auto_427867 - BLOCK
      ?auto_427868 - BLOCK
      ?auto_427869 - BLOCK
      ?auto_427870 - BLOCK
      ?auto_427871 - BLOCK
      ?auto_427872 - BLOCK
      ?auto_427873 - BLOCK
      ?auto_427874 - BLOCK
      ?auto_427875 - BLOCK
      ?auto_427876 - BLOCK
      ?auto_427877 - BLOCK
    )
    :vars
    (
      ?auto_427878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_427877 ?auto_427878 ) ( ON-TABLE ?auto_427863 ) ( ON ?auto_427864 ?auto_427863 ) ( ON ?auto_427865 ?auto_427864 ) ( ON ?auto_427866 ?auto_427865 ) ( ON ?auto_427867 ?auto_427866 ) ( ON ?auto_427868 ?auto_427867 ) ( ON ?auto_427869 ?auto_427868 ) ( ON ?auto_427870 ?auto_427869 ) ( not ( = ?auto_427863 ?auto_427864 ) ) ( not ( = ?auto_427863 ?auto_427865 ) ) ( not ( = ?auto_427863 ?auto_427866 ) ) ( not ( = ?auto_427863 ?auto_427867 ) ) ( not ( = ?auto_427863 ?auto_427868 ) ) ( not ( = ?auto_427863 ?auto_427869 ) ) ( not ( = ?auto_427863 ?auto_427870 ) ) ( not ( = ?auto_427863 ?auto_427871 ) ) ( not ( = ?auto_427863 ?auto_427872 ) ) ( not ( = ?auto_427863 ?auto_427873 ) ) ( not ( = ?auto_427863 ?auto_427874 ) ) ( not ( = ?auto_427863 ?auto_427875 ) ) ( not ( = ?auto_427863 ?auto_427876 ) ) ( not ( = ?auto_427863 ?auto_427877 ) ) ( not ( = ?auto_427863 ?auto_427878 ) ) ( not ( = ?auto_427864 ?auto_427865 ) ) ( not ( = ?auto_427864 ?auto_427866 ) ) ( not ( = ?auto_427864 ?auto_427867 ) ) ( not ( = ?auto_427864 ?auto_427868 ) ) ( not ( = ?auto_427864 ?auto_427869 ) ) ( not ( = ?auto_427864 ?auto_427870 ) ) ( not ( = ?auto_427864 ?auto_427871 ) ) ( not ( = ?auto_427864 ?auto_427872 ) ) ( not ( = ?auto_427864 ?auto_427873 ) ) ( not ( = ?auto_427864 ?auto_427874 ) ) ( not ( = ?auto_427864 ?auto_427875 ) ) ( not ( = ?auto_427864 ?auto_427876 ) ) ( not ( = ?auto_427864 ?auto_427877 ) ) ( not ( = ?auto_427864 ?auto_427878 ) ) ( not ( = ?auto_427865 ?auto_427866 ) ) ( not ( = ?auto_427865 ?auto_427867 ) ) ( not ( = ?auto_427865 ?auto_427868 ) ) ( not ( = ?auto_427865 ?auto_427869 ) ) ( not ( = ?auto_427865 ?auto_427870 ) ) ( not ( = ?auto_427865 ?auto_427871 ) ) ( not ( = ?auto_427865 ?auto_427872 ) ) ( not ( = ?auto_427865 ?auto_427873 ) ) ( not ( = ?auto_427865 ?auto_427874 ) ) ( not ( = ?auto_427865 ?auto_427875 ) ) ( not ( = ?auto_427865 ?auto_427876 ) ) ( not ( = ?auto_427865 ?auto_427877 ) ) ( not ( = ?auto_427865 ?auto_427878 ) ) ( not ( = ?auto_427866 ?auto_427867 ) ) ( not ( = ?auto_427866 ?auto_427868 ) ) ( not ( = ?auto_427866 ?auto_427869 ) ) ( not ( = ?auto_427866 ?auto_427870 ) ) ( not ( = ?auto_427866 ?auto_427871 ) ) ( not ( = ?auto_427866 ?auto_427872 ) ) ( not ( = ?auto_427866 ?auto_427873 ) ) ( not ( = ?auto_427866 ?auto_427874 ) ) ( not ( = ?auto_427866 ?auto_427875 ) ) ( not ( = ?auto_427866 ?auto_427876 ) ) ( not ( = ?auto_427866 ?auto_427877 ) ) ( not ( = ?auto_427866 ?auto_427878 ) ) ( not ( = ?auto_427867 ?auto_427868 ) ) ( not ( = ?auto_427867 ?auto_427869 ) ) ( not ( = ?auto_427867 ?auto_427870 ) ) ( not ( = ?auto_427867 ?auto_427871 ) ) ( not ( = ?auto_427867 ?auto_427872 ) ) ( not ( = ?auto_427867 ?auto_427873 ) ) ( not ( = ?auto_427867 ?auto_427874 ) ) ( not ( = ?auto_427867 ?auto_427875 ) ) ( not ( = ?auto_427867 ?auto_427876 ) ) ( not ( = ?auto_427867 ?auto_427877 ) ) ( not ( = ?auto_427867 ?auto_427878 ) ) ( not ( = ?auto_427868 ?auto_427869 ) ) ( not ( = ?auto_427868 ?auto_427870 ) ) ( not ( = ?auto_427868 ?auto_427871 ) ) ( not ( = ?auto_427868 ?auto_427872 ) ) ( not ( = ?auto_427868 ?auto_427873 ) ) ( not ( = ?auto_427868 ?auto_427874 ) ) ( not ( = ?auto_427868 ?auto_427875 ) ) ( not ( = ?auto_427868 ?auto_427876 ) ) ( not ( = ?auto_427868 ?auto_427877 ) ) ( not ( = ?auto_427868 ?auto_427878 ) ) ( not ( = ?auto_427869 ?auto_427870 ) ) ( not ( = ?auto_427869 ?auto_427871 ) ) ( not ( = ?auto_427869 ?auto_427872 ) ) ( not ( = ?auto_427869 ?auto_427873 ) ) ( not ( = ?auto_427869 ?auto_427874 ) ) ( not ( = ?auto_427869 ?auto_427875 ) ) ( not ( = ?auto_427869 ?auto_427876 ) ) ( not ( = ?auto_427869 ?auto_427877 ) ) ( not ( = ?auto_427869 ?auto_427878 ) ) ( not ( = ?auto_427870 ?auto_427871 ) ) ( not ( = ?auto_427870 ?auto_427872 ) ) ( not ( = ?auto_427870 ?auto_427873 ) ) ( not ( = ?auto_427870 ?auto_427874 ) ) ( not ( = ?auto_427870 ?auto_427875 ) ) ( not ( = ?auto_427870 ?auto_427876 ) ) ( not ( = ?auto_427870 ?auto_427877 ) ) ( not ( = ?auto_427870 ?auto_427878 ) ) ( not ( = ?auto_427871 ?auto_427872 ) ) ( not ( = ?auto_427871 ?auto_427873 ) ) ( not ( = ?auto_427871 ?auto_427874 ) ) ( not ( = ?auto_427871 ?auto_427875 ) ) ( not ( = ?auto_427871 ?auto_427876 ) ) ( not ( = ?auto_427871 ?auto_427877 ) ) ( not ( = ?auto_427871 ?auto_427878 ) ) ( not ( = ?auto_427872 ?auto_427873 ) ) ( not ( = ?auto_427872 ?auto_427874 ) ) ( not ( = ?auto_427872 ?auto_427875 ) ) ( not ( = ?auto_427872 ?auto_427876 ) ) ( not ( = ?auto_427872 ?auto_427877 ) ) ( not ( = ?auto_427872 ?auto_427878 ) ) ( not ( = ?auto_427873 ?auto_427874 ) ) ( not ( = ?auto_427873 ?auto_427875 ) ) ( not ( = ?auto_427873 ?auto_427876 ) ) ( not ( = ?auto_427873 ?auto_427877 ) ) ( not ( = ?auto_427873 ?auto_427878 ) ) ( not ( = ?auto_427874 ?auto_427875 ) ) ( not ( = ?auto_427874 ?auto_427876 ) ) ( not ( = ?auto_427874 ?auto_427877 ) ) ( not ( = ?auto_427874 ?auto_427878 ) ) ( not ( = ?auto_427875 ?auto_427876 ) ) ( not ( = ?auto_427875 ?auto_427877 ) ) ( not ( = ?auto_427875 ?auto_427878 ) ) ( not ( = ?auto_427876 ?auto_427877 ) ) ( not ( = ?auto_427876 ?auto_427878 ) ) ( not ( = ?auto_427877 ?auto_427878 ) ) ( ON ?auto_427876 ?auto_427877 ) ( ON ?auto_427875 ?auto_427876 ) ( ON ?auto_427874 ?auto_427875 ) ( ON ?auto_427873 ?auto_427874 ) ( ON ?auto_427872 ?auto_427873 ) ( CLEAR ?auto_427870 ) ( ON ?auto_427871 ?auto_427872 ) ( CLEAR ?auto_427871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_427863 ?auto_427864 ?auto_427865 ?auto_427866 ?auto_427867 ?auto_427868 ?auto_427869 ?auto_427870 ?auto_427871 )
      ( MAKE-15PILE ?auto_427863 ?auto_427864 ?auto_427865 ?auto_427866 ?auto_427867 ?auto_427868 ?auto_427869 ?auto_427870 ?auto_427871 ?auto_427872 ?auto_427873 ?auto_427874 ?auto_427875 ?auto_427876 ?auto_427877 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_427894 - BLOCK
      ?auto_427895 - BLOCK
      ?auto_427896 - BLOCK
      ?auto_427897 - BLOCK
      ?auto_427898 - BLOCK
      ?auto_427899 - BLOCK
      ?auto_427900 - BLOCK
      ?auto_427901 - BLOCK
      ?auto_427902 - BLOCK
      ?auto_427903 - BLOCK
      ?auto_427904 - BLOCK
      ?auto_427905 - BLOCK
      ?auto_427906 - BLOCK
      ?auto_427907 - BLOCK
      ?auto_427908 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_427908 ) ( ON-TABLE ?auto_427894 ) ( ON ?auto_427895 ?auto_427894 ) ( ON ?auto_427896 ?auto_427895 ) ( ON ?auto_427897 ?auto_427896 ) ( ON ?auto_427898 ?auto_427897 ) ( ON ?auto_427899 ?auto_427898 ) ( ON ?auto_427900 ?auto_427899 ) ( ON ?auto_427901 ?auto_427900 ) ( not ( = ?auto_427894 ?auto_427895 ) ) ( not ( = ?auto_427894 ?auto_427896 ) ) ( not ( = ?auto_427894 ?auto_427897 ) ) ( not ( = ?auto_427894 ?auto_427898 ) ) ( not ( = ?auto_427894 ?auto_427899 ) ) ( not ( = ?auto_427894 ?auto_427900 ) ) ( not ( = ?auto_427894 ?auto_427901 ) ) ( not ( = ?auto_427894 ?auto_427902 ) ) ( not ( = ?auto_427894 ?auto_427903 ) ) ( not ( = ?auto_427894 ?auto_427904 ) ) ( not ( = ?auto_427894 ?auto_427905 ) ) ( not ( = ?auto_427894 ?auto_427906 ) ) ( not ( = ?auto_427894 ?auto_427907 ) ) ( not ( = ?auto_427894 ?auto_427908 ) ) ( not ( = ?auto_427895 ?auto_427896 ) ) ( not ( = ?auto_427895 ?auto_427897 ) ) ( not ( = ?auto_427895 ?auto_427898 ) ) ( not ( = ?auto_427895 ?auto_427899 ) ) ( not ( = ?auto_427895 ?auto_427900 ) ) ( not ( = ?auto_427895 ?auto_427901 ) ) ( not ( = ?auto_427895 ?auto_427902 ) ) ( not ( = ?auto_427895 ?auto_427903 ) ) ( not ( = ?auto_427895 ?auto_427904 ) ) ( not ( = ?auto_427895 ?auto_427905 ) ) ( not ( = ?auto_427895 ?auto_427906 ) ) ( not ( = ?auto_427895 ?auto_427907 ) ) ( not ( = ?auto_427895 ?auto_427908 ) ) ( not ( = ?auto_427896 ?auto_427897 ) ) ( not ( = ?auto_427896 ?auto_427898 ) ) ( not ( = ?auto_427896 ?auto_427899 ) ) ( not ( = ?auto_427896 ?auto_427900 ) ) ( not ( = ?auto_427896 ?auto_427901 ) ) ( not ( = ?auto_427896 ?auto_427902 ) ) ( not ( = ?auto_427896 ?auto_427903 ) ) ( not ( = ?auto_427896 ?auto_427904 ) ) ( not ( = ?auto_427896 ?auto_427905 ) ) ( not ( = ?auto_427896 ?auto_427906 ) ) ( not ( = ?auto_427896 ?auto_427907 ) ) ( not ( = ?auto_427896 ?auto_427908 ) ) ( not ( = ?auto_427897 ?auto_427898 ) ) ( not ( = ?auto_427897 ?auto_427899 ) ) ( not ( = ?auto_427897 ?auto_427900 ) ) ( not ( = ?auto_427897 ?auto_427901 ) ) ( not ( = ?auto_427897 ?auto_427902 ) ) ( not ( = ?auto_427897 ?auto_427903 ) ) ( not ( = ?auto_427897 ?auto_427904 ) ) ( not ( = ?auto_427897 ?auto_427905 ) ) ( not ( = ?auto_427897 ?auto_427906 ) ) ( not ( = ?auto_427897 ?auto_427907 ) ) ( not ( = ?auto_427897 ?auto_427908 ) ) ( not ( = ?auto_427898 ?auto_427899 ) ) ( not ( = ?auto_427898 ?auto_427900 ) ) ( not ( = ?auto_427898 ?auto_427901 ) ) ( not ( = ?auto_427898 ?auto_427902 ) ) ( not ( = ?auto_427898 ?auto_427903 ) ) ( not ( = ?auto_427898 ?auto_427904 ) ) ( not ( = ?auto_427898 ?auto_427905 ) ) ( not ( = ?auto_427898 ?auto_427906 ) ) ( not ( = ?auto_427898 ?auto_427907 ) ) ( not ( = ?auto_427898 ?auto_427908 ) ) ( not ( = ?auto_427899 ?auto_427900 ) ) ( not ( = ?auto_427899 ?auto_427901 ) ) ( not ( = ?auto_427899 ?auto_427902 ) ) ( not ( = ?auto_427899 ?auto_427903 ) ) ( not ( = ?auto_427899 ?auto_427904 ) ) ( not ( = ?auto_427899 ?auto_427905 ) ) ( not ( = ?auto_427899 ?auto_427906 ) ) ( not ( = ?auto_427899 ?auto_427907 ) ) ( not ( = ?auto_427899 ?auto_427908 ) ) ( not ( = ?auto_427900 ?auto_427901 ) ) ( not ( = ?auto_427900 ?auto_427902 ) ) ( not ( = ?auto_427900 ?auto_427903 ) ) ( not ( = ?auto_427900 ?auto_427904 ) ) ( not ( = ?auto_427900 ?auto_427905 ) ) ( not ( = ?auto_427900 ?auto_427906 ) ) ( not ( = ?auto_427900 ?auto_427907 ) ) ( not ( = ?auto_427900 ?auto_427908 ) ) ( not ( = ?auto_427901 ?auto_427902 ) ) ( not ( = ?auto_427901 ?auto_427903 ) ) ( not ( = ?auto_427901 ?auto_427904 ) ) ( not ( = ?auto_427901 ?auto_427905 ) ) ( not ( = ?auto_427901 ?auto_427906 ) ) ( not ( = ?auto_427901 ?auto_427907 ) ) ( not ( = ?auto_427901 ?auto_427908 ) ) ( not ( = ?auto_427902 ?auto_427903 ) ) ( not ( = ?auto_427902 ?auto_427904 ) ) ( not ( = ?auto_427902 ?auto_427905 ) ) ( not ( = ?auto_427902 ?auto_427906 ) ) ( not ( = ?auto_427902 ?auto_427907 ) ) ( not ( = ?auto_427902 ?auto_427908 ) ) ( not ( = ?auto_427903 ?auto_427904 ) ) ( not ( = ?auto_427903 ?auto_427905 ) ) ( not ( = ?auto_427903 ?auto_427906 ) ) ( not ( = ?auto_427903 ?auto_427907 ) ) ( not ( = ?auto_427903 ?auto_427908 ) ) ( not ( = ?auto_427904 ?auto_427905 ) ) ( not ( = ?auto_427904 ?auto_427906 ) ) ( not ( = ?auto_427904 ?auto_427907 ) ) ( not ( = ?auto_427904 ?auto_427908 ) ) ( not ( = ?auto_427905 ?auto_427906 ) ) ( not ( = ?auto_427905 ?auto_427907 ) ) ( not ( = ?auto_427905 ?auto_427908 ) ) ( not ( = ?auto_427906 ?auto_427907 ) ) ( not ( = ?auto_427906 ?auto_427908 ) ) ( not ( = ?auto_427907 ?auto_427908 ) ) ( ON ?auto_427907 ?auto_427908 ) ( ON ?auto_427906 ?auto_427907 ) ( ON ?auto_427905 ?auto_427906 ) ( ON ?auto_427904 ?auto_427905 ) ( ON ?auto_427903 ?auto_427904 ) ( CLEAR ?auto_427901 ) ( ON ?auto_427902 ?auto_427903 ) ( CLEAR ?auto_427902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_427894 ?auto_427895 ?auto_427896 ?auto_427897 ?auto_427898 ?auto_427899 ?auto_427900 ?auto_427901 ?auto_427902 )
      ( MAKE-15PILE ?auto_427894 ?auto_427895 ?auto_427896 ?auto_427897 ?auto_427898 ?auto_427899 ?auto_427900 ?auto_427901 ?auto_427902 ?auto_427903 ?auto_427904 ?auto_427905 ?auto_427906 ?auto_427907 ?auto_427908 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_427924 - BLOCK
      ?auto_427925 - BLOCK
      ?auto_427926 - BLOCK
      ?auto_427927 - BLOCK
      ?auto_427928 - BLOCK
      ?auto_427929 - BLOCK
      ?auto_427930 - BLOCK
      ?auto_427931 - BLOCK
      ?auto_427932 - BLOCK
      ?auto_427933 - BLOCK
      ?auto_427934 - BLOCK
      ?auto_427935 - BLOCK
      ?auto_427936 - BLOCK
      ?auto_427937 - BLOCK
      ?auto_427938 - BLOCK
    )
    :vars
    (
      ?auto_427939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_427938 ?auto_427939 ) ( ON-TABLE ?auto_427924 ) ( ON ?auto_427925 ?auto_427924 ) ( ON ?auto_427926 ?auto_427925 ) ( ON ?auto_427927 ?auto_427926 ) ( ON ?auto_427928 ?auto_427927 ) ( ON ?auto_427929 ?auto_427928 ) ( ON ?auto_427930 ?auto_427929 ) ( not ( = ?auto_427924 ?auto_427925 ) ) ( not ( = ?auto_427924 ?auto_427926 ) ) ( not ( = ?auto_427924 ?auto_427927 ) ) ( not ( = ?auto_427924 ?auto_427928 ) ) ( not ( = ?auto_427924 ?auto_427929 ) ) ( not ( = ?auto_427924 ?auto_427930 ) ) ( not ( = ?auto_427924 ?auto_427931 ) ) ( not ( = ?auto_427924 ?auto_427932 ) ) ( not ( = ?auto_427924 ?auto_427933 ) ) ( not ( = ?auto_427924 ?auto_427934 ) ) ( not ( = ?auto_427924 ?auto_427935 ) ) ( not ( = ?auto_427924 ?auto_427936 ) ) ( not ( = ?auto_427924 ?auto_427937 ) ) ( not ( = ?auto_427924 ?auto_427938 ) ) ( not ( = ?auto_427924 ?auto_427939 ) ) ( not ( = ?auto_427925 ?auto_427926 ) ) ( not ( = ?auto_427925 ?auto_427927 ) ) ( not ( = ?auto_427925 ?auto_427928 ) ) ( not ( = ?auto_427925 ?auto_427929 ) ) ( not ( = ?auto_427925 ?auto_427930 ) ) ( not ( = ?auto_427925 ?auto_427931 ) ) ( not ( = ?auto_427925 ?auto_427932 ) ) ( not ( = ?auto_427925 ?auto_427933 ) ) ( not ( = ?auto_427925 ?auto_427934 ) ) ( not ( = ?auto_427925 ?auto_427935 ) ) ( not ( = ?auto_427925 ?auto_427936 ) ) ( not ( = ?auto_427925 ?auto_427937 ) ) ( not ( = ?auto_427925 ?auto_427938 ) ) ( not ( = ?auto_427925 ?auto_427939 ) ) ( not ( = ?auto_427926 ?auto_427927 ) ) ( not ( = ?auto_427926 ?auto_427928 ) ) ( not ( = ?auto_427926 ?auto_427929 ) ) ( not ( = ?auto_427926 ?auto_427930 ) ) ( not ( = ?auto_427926 ?auto_427931 ) ) ( not ( = ?auto_427926 ?auto_427932 ) ) ( not ( = ?auto_427926 ?auto_427933 ) ) ( not ( = ?auto_427926 ?auto_427934 ) ) ( not ( = ?auto_427926 ?auto_427935 ) ) ( not ( = ?auto_427926 ?auto_427936 ) ) ( not ( = ?auto_427926 ?auto_427937 ) ) ( not ( = ?auto_427926 ?auto_427938 ) ) ( not ( = ?auto_427926 ?auto_427939 ) ) ( not ( = ?auto_427927 ?auto_427928 ) ) ( not ( = ?auto_427927 ?auto_427929 ) ) ( not ( = ?auto_427927 ?auto_427930 ) ) ( not ( = ?auto_427927 ?auto_427931 ) ) ( not ( = ?auto_427927 ?auto_427932 ) ) ( not ( = ?auto_427927 ?auto_427933 ) ) ( not ( = ?auto_427927 ?auto_427934 ) ) ( not ( = ?auto_427927 ?auto_427935 ) ) ( not ( = ?auto_427927 ?auto_427936 ) ) ( not ( = ?auto_427927 ?auto_427937 ) ) ( not ( = ?auto_427927 ?auto_427938 ) ) ( not ( = ?auto_427927 ?auto_427939 ) ) ( not ( = ?auto_427928 ?auto_427929 ) ) ( not ( = ?auto_427928 ?auto_427930 ) ) ( not ( = ?auto_427928 ?auto_427931 ) ) ( not ( = ?auto_427928 ?auto_427932 ) ) ( not ( = ?auto_427928 ?auto_427933 ) ) ( not ( = ?auto_427928 ?auto_427934 ) ) ( not ( = ?auto_427928 ?auto_427935 ) ) ( not ( = ?auto_427928 ?auto_427936 ) ) ( not ( = ?auto_427928 ?auto_427937 ) ) ( not ( = ?auto_427928 ?auto_427938 ) ) ( not ( = ?auto_427928 ?auto_427939 ) ) ( not ( = ?auto_427929 ?auto_427930 ) ) ( not ( = ?auto_427929 ?auto_427931 ) ) ( not ( = ?auto_427929 ?auto_427932 ) ) ( not ( = ?auto_427929 ?auto_427933 ) ) ( not ( = ?auto_427929 ?auto_427934 ) ) ( not ( = ?auto_427929 ?auto_427935 ) ) ( not ( = ?auto_427929 ?auto_427936 ) ) ( not ( = ?auto_427929 ?auto_427937 ) ) ( not ( = ?auto_427929 ?auto_427938 ) ) ( not ( = ?auto_427929 ?auto_427939 ) ) ( not ( = ?auto_427930 ?auto_427931 ) ) ( not ( = ?auto_427930 ?auto_427932 ) ) ( not ( = ?auto_427930 ?auto_427933 ) ) ( not ( = ?auto_427930 ?auto_427934 ) ) ( not ( = ?auto_427930 ?auto_427935 ) ) ( not ( = ?auto_427930 ?auto_427936 ) ) ( not ( = ?auto_427930 ?auto_427937 ) ) ( not ( = ?auto_427930 ?auto_427938 ) ) ( not ( = ?auto_427930 ?auto_427939 ) ) ( not ( = ?auto_427931 ?auto_427932 ) ) ( not ( = ?auto_427931 ?auto_427933 ) ) ( not ( = ?auto_427931 ?auto_427934 ) ) ( not ( = ?auto_427931 ?auto_427935 ) ) ( not ( = ?auto_427931 ?auto_427936 ) ) ( not ( = ?auto_427931 ?auto_427937 ) ) ( not ( = ?auto_427931 ?auto_427938 ) ) ( not ( = ?auto_427931 ?auto_427939 ) ) ( not ( = ?auto_427932 ?auto_427933 ) ) ( not ( = ?auto_427932 ?auto_427934 ) ) ( not ( = ?auto_427932 ?auto_427935 ) ) ( not ( = ?auto_427932 ?auto_427936 ) ) ( not ( = ?auto_427932 ?auto_427937 ) ) ( not ( = ?auto_427932 ?auto_427938 ) ) ( not ( = ?auto_427932 ?auto_427939 ) ) ( not ( = ?auto_427933 ?auto_427934 ) ) ( not ( = ?auto_427933 ?auto_427935 ) ) ( not ( = ?auto_427933 ?auto_427936 ) ) ( not ( = ?auto_427933 ?auto_427937 ) ) ( not ( = ?auto_427933 ?auto_427938 ) ) ( not ( = ?auto_427933 ?auto_427939 ) ) ( not ( = ?auto_427934 ?auto_427935 ) ) ( not ( = ?auto_427934 ?auto_427936 ) ) ( not ( = ?auto_427934 ?auto_427937 ) ) ( not ( = ?auto_427934 ?auto_427938 ) ) ( not ( = ?auto_427934 ?auto_427939 ) ) ( not ( = ?auto_427935 ?auto_427936 ) ) ( not ( = ?auto_427935 ?auto_427937 ) ) ( not ( = ?auto_427935 ?auto_427938 ) ) ( not ( = ?auto_427935 ?auto_427939 ) ) ( not ( = ?auto_427936 ?auto_427937 ) ) ( not ( = ?auto_427936 ?auto_427938 ) ) ( not ( = ?auto_427936 ?auto_427939 ) ) ( not ( = ?auto_427937 ?auto_427938 ) ) ( not ( = ?auto_427937 ?auto_427939 ) ) ( not ( = ?auto_427938 ?auto_427939 ) ) ( ON ?auto_427937 ?auto_427938 ) ( ON ?auto_427936 ?auto_427937 ) ( ON ?auto_427935 ?auto_427936 ) ( ON ?auto_427934 ?auto_427935 ) ( ON ?auto_427933 ?auto_427934 ) ( ON ?auto_427932 ?auto_427933 ) ( CLEAR ?auto_427930 ) ( ON ?auto_427931 ?auto_427932 ) ( CLEAR ?auto_427931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_427924 ?auto_427925 ?auto_427926 ?auto_427927 ?auto_427928 ?auto_427929 ?auto_427930 ?auto_427931 )
      ( MAKE-15PILE ?auto_427924 ?auto_427925 ?auto_427926 ?auto_427927 ?auto_427928 ?auto_427929 ?auto_427930 ?auto_427931 ?auto_427932 ?auto_427933 ?auto_427934 ?auto_427935 ?auto_427936 ?auto_427937 ?auto_427938 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_427955 - BLOCK
      ?auto_427956 - BLOCK
      ?auto_427957 - BLOCK
      ?auto_427958 - BLOCK
      ?auto_427959 - BLOCK
      ?auto_427960 - BLOCK
      ?auto_427961 - BLOCK
      ?auto_427962 - BLOCK
      ?auto_427963 - BLOCK
      ?auto_427964 - BLOCK
      ?auto_427965 - BLOCK
      ?auto_427966 - BLOCK
      ?auto_427967 - BLOCK
      ?auto_427968 - BLOCK
      ?auto_427969 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_427969 ) ( ON-TABLE ?auto_427955 ) ( ON ?auto_427956 ?auto_427955 ) ( ON ?auto_427957 ?auto_427956 ) ( ON ?auto_427958 ?auto_427957 ) ( ON ?auto_427959 ?auto_427958 ) ( ON ?auto_427960 ?auto_427959 ) ( ON ?auto_427961 ?auto_427960 ) ( not ( = ?auto_427955 ?auto_427956 ) ) ( not ( = ?auto_427955 ?auto_427957 ) ) ( not ( = ?auto_427955 ?auto_427958 ) ) ( not ( = ?auto_427955 ?auto_427959 ) ) ( not ( = ?auto_427955 ?auto_427960 ) ) ( not ( = ?auto_427955 ?auto_427961 ) ) ( not ( = ?auto_427955 ?auto_427962 ) ) ( not ( = ?auto_427955 ?auto_427963 ) ) ( not ( = ?auto_427955 ?auto_427964 ) ) ( not ( = ?auto_427955 ?auto_427965 ) ) ( not ( = ?auto_427955 ?auto_427966 ) ) ( not ( = ?auto_427955 ?auto_427967 ) ) ( not ( = ?auto_427955 ?auto_427968 ) ) ( not ( = ?auto_427955 ?auto_427969 ) ) ( not ( = ?auto_427956 ?auto_427957 ) ) ( not ( = ?auto_427956 ?auto_427958 ) ) ( not ( = ?auto_427956 ?auto_427959 ) ) ( not ( = ?auto_427956 ?auto_427960 ) ) ( not ( = ?auto_427956 ?auto_427961 ) ) ( not ( = ?auto_427956 ?auto_427962 ) ) ( not ( = ?auto_427956 ?auto_427963 ) ) ( not ( = ?auto_427956 ?auto_427964 ) ) ( not ( = ?auto_427956 ?auto_427965 ) ) ( not ( = ?auto_427956 ?auto_427966 ) ) ( not ( = ?auto_427956 ?auto_427967 ) ) ( not ( = ?auto_427956 ?auto_427968 ) ) ( not ( = ?auto_427956 ?auto_427969 ) ) ( not ( = ?auto_427957 ?auto_427958 ) ) ( not ( = ?auto_427957 ?auto_427959 ) ) ( not ( = ?auto_427957 ?auto_427960 ) ) ( not ( = ?auto_427957 ?auto_427961 ) ) ( not ( = ?auto_427957 ?auto_427962 ) ) ( not ( = ?auto_427957 ?auto_427963 ) ) ( not ( = ?auto_427957 ?auto_427964 ) ) ( not ( = ?auto_427957 ?auto_427965 ) ) ( not ( = ?auto_427957 ?auto_427966 ) ) ( not ( = ?auto_427957 ?auto_427967 ) ) ( not ( = ?auto_427957 ?auto_427968 ) ) ( not ( = ?auto_427957 ?auto_427969 ) ) ( not ( = ?auto_427958 ?auto_427959 ) ) ( not ( = ?auto_427958 ?auto_427960 ) ) ( not ( = ?auto_427958 ?auto_427961 ) ) ( not ( = ?auto_427958 ?auto_427962 ) ) ( not ( = ?auto_427958 ?auto_427963 ) ) ( not ( = ?auto_427958 ?auto_427964 ) ) ( not ( = ?auto_427958 ?auto_427965 ) ) ( not ( = ?auto_427958 ?auto_427966 ) ) ( not ( = ?auto_427958 ?auto_427967 ) ) ( not ( = ?auto_427958 ?auto_427968 ) ) ( not ( = ?auto_427958 ?auto_427969 ) ) ( not ( = ?auto_427959 ?auto_427960 ) ) ( not ( = ?auto_427959 ?auto_427961 ) ) ( not ( = ?auto_427959 ?auto_427962 ) ) ( not ( = ?auto_427959 ?auto_427963 ) ) ( not ( = ?auto_427959 ?auto_427964 ) ) ( not ( = ?auto_427959 ?auto_427965 ) ) ( not ( = ?auto_427959 ?auto_427966 ) ) ( not ( = ?auto_427959 ?auto_427967 ) ) ( not ( = ?auto_427959 ?auto_427968 ) ) ( not ( = ?auto_427959 ?auto_427969 ) ) ( not ( = ?auto_427960 ?auto_427961 ) ) ( not ( = ?auto_427960 ?auto_427962 ) ) ( not ( = ?auto_427960 ?auto_427963 ) ) ( not ( = ?auto_427960 ?auto_427964 ) ) ( not ( = ?auto_427960 ?auto_427965 ) ) ( not ( = ?auto_427960 ?auto_427966 ) ) ( not ( = ?auto_427960 ?auto_427967 ) ) ( not ( = ?auto_427960 ?auto_427968 ) ) ( not ( = ?auto_427960 ?auto_427969 ) ) ( not ( = ?auto_427961 ?auto_427962 ) ) ( not ( = ?auto_427961 ?auto_427963 ) ) ( not ( = ?auto_427961 ?auto_427964 ) ) ( not ( = ?auto_427961 ?auto_427965 ) ) ( not ( = ?auto_427961 ?auto_427966 ) ) ( not ( = ?auto_427961 ?auto_427967 ) ) ( not ( = ?auto_427961 ?auto_427968 ) ) ( not ( = ?auto_427961 ?auto_427969 ) ) ( not ( = ?auto_427962 ?auto_427963 ) ) ( not ( = ?auto_427962 ?auto_427964 ) ) ( not ( = ?auto_427962 ?auto_427965 ) ) ( not ( = ?auto_427962 ?auto_427966 ) ) ( not ( = ?auto_427962 ?auto_427967 ) ) ( not ( = ?auto_427962 ?auto_427968 ) ) ( not ( = ?auto_427962 ?auto_427969 ) ) ( not ( = ?auto_427963 ?auto_427964 ) ) ( not ( = ?auto_427963 ?auto_427965 ) ) ( not ( = ?auto_427963 ?auto_427966 ) ) ( not ( = ?auto_427963 ?auto_427967 ) ) ( not ( = ?auto_427963 ?auto_427968 ) ) ( not ( = ?auto_427963 ?auto_427969 ) ) ( not ( = ?auto_427964 ?auto_427965 ) ) ( not ( = ?auto_427964 ?auto_427966 ) ) ( not ( = ?auto_427964 ?auto_427967 ) ) ( not ( = ?auto_427964 ?auto_427968 ) ) ( not ( = ?auto_427964 ?auto_427969 ) ) ( not ( = ?auto_427965 ?auto_427966 ) ) ( not ( = ?auto_427965 ?auto_427967 ) ) ( not ( = ?auto_427965 ?auto_427968 ) ) ( not ( = ?auto_427965 ?auto_427969 ) ) ( not ( = ?auto_427966 ?auto_427967 ) ) ( not ( = ?auto_427966 ?auto_427968 ) ) ( not ( = ?auto_427966 ?auto_427969 ) ) ( not ( = ?auto_427967 ?auto_427968 ) ) ( not ( = ?auto_427967 ?auto_427969 ) ) ( not ( = ?auto_427968 ?auto_427969 ) ) ( ON ?auto_427968 ?auto_427969 ) ( ON ?auto_427967 ?auto_427968 ) ( ON ?auto_427966 ?auto_427967 ) ( ON ?auto_427965 ?auto_427966 ) ( ON ?auto_427964 ?auto_427965 ) ( ON ?auto_427963 ?auto_427964 ) ( CLEAR ?auto_427961 ) ( ON ?auto_427962 ?auto_427963 ) ( CLEAR ?auto_427962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_427955 ?auto_427956 ?auto_427957 ?auto_427958 ?auto_427959 ?auto_427960 ?auto_427961 ?auto_427962 )
      ( MAKE-15PILE ?auto_427955 ?auto_427956 ?auto_427957 ?auto_427958 ?auto_427959 ?auto_427960 ?auto_427961 ?auto_427962 ?auto_427963 ?auto_427964 ?auto_427965 ?auto_427966 ?auto_427967 ?auto_427968 ?auto_427969 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_427985 - BLOCK
      ?auto_427986 - BLOCK
      ?auto_427987 - BLOCK
      ?auto_427988 - BLOCK
      ?auto_427989 - BLOCK
      ?auto_427990 - BLOCK
      ?auto_427991 - BLOCK
      ?auto_427992 - BLOCK
      ?auto_427993 - BLOCK
      ?auto_427994 - BLOCK
      ?auto_427995 - BLOCK
      ?auto_427996 - BLOCK
      ?auto_427997 - BLOCK
      ?auto_427998 - BLOCK
      ?auto_427999 - BLOCK
    )
    :vars
    (
      ?auto_428000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_427999 ?auto_428000 ) ( ON-TABLE ?auto_427985 ) ( ON ?auto_427986 ?auto_427985 ) ( ON ?auto_427987 ?auto_427986 ) ( ON ?auto_427988 ?auto_427987 ) ( ON ?auto_427989 ?auto_427988 ) ( ON ?auto_427990 ?auto_427989 ) ( not ( = ?auto_427985 ?auto_427986 ) ) ( not ( = ?auto_427985 ?auto_427987 ) ) ( not ( = ?auto_427985 ?auto_427988 ) ) ( not ( = ?auto_427985 ?auto_427989 ) ) ( not ( = ?auto_427985 ?auto_427990 ) ) ( not ( = ?auto_427985 ?auto_427991 ) ) ( not ( = ?auto_427985 ?auto_427992 ) ) ( not ( = ?auto_427985 ?auto_427993 ) ) ( not ( = ?auto_427985 ?auto_427994 ) ) ( not ( = ?auto_427985 ?auto_427995 ) ) ( not ( = ?auto_427985 ?auto_427996 ) ) ( not ( = ?auto_427985 ?auto_427997 ) ) ( not ( = ?auto_427985 ?auto_427998 ) ) ( not ( = ?auto_427985 ?auto_427999 ) ) ( not ( = ?auto_427985 ?auto_428000 ) ) ( not ( = ?auto_427986 ?auto_427987 ) ) ( not ( = ?auto_427986 ?auto_427988 ) ) ( not ( = ?auto_427986 ?auto_427989 ) ) ( not ( = ?auto_427986 ?auto_427990 ) ) ( not ( = ?auto_427986 ?auto_427991 ) ) ( not ( = ?auto_427986 ?auto_427992 ) ) ( not ( = ?auto_427986 ?auto_427993 ) ) ( not ( = ?auto_427986 ?auto_427994 ) ) ( not ( = ?auto_427986 ?auto_427995 ) ) ( not ( = ?auto_427986 ?auto_427996 ) ) ( not ( = ?auto_427986 ?auto_427997 ) ) ( not ( = ?auto_427986 ?auto_427998 ) ) ( not ( = ?auto_427986 ?auto_427999 ) ) ( not ( = ?auto_427986 ?auto_428000 ) ) ( not ( = ?auto_427987 ?auto_427988 ) ) ( not ( = ?auto_427987 ?auto_427989 ) ) ( not ( = ?auto_427987 ?auto_427990 ) ) ( not ( = ?auto_427987 ?auto_427991 ) ) ( not ( = ?auto_427987 ?auto_427992 ) ) ( not ( = ?auto_427987 ?auto_427993 ) ) ( not ( = ?auto_427987 ?auto_427994 ) ) ( not ( = ?auto_427987 ?auto_427995 ) ) ( not ( = ?auto_427987 ?auto_427996 ) ) ( not ( = ?auto_427987 ?auto_427997 ) ) ( not ( = ?auto_427987 ?auto_427998 ) ) ( not ( = ?auto_427987 ?auto_427999 ) ) ( not ( = ?auto_427987 ?auto_428000 ) ) ( not ( = ?auto_427988 ?auto_427989 ) ) ( not ( = ?auto_427988 ?auto_427990 ) ) ( not ( = ?auto_427988 ?auto_427991 ) ) ( not ( = ?auto_427988 ?auto_427992 ) ) ( not ( = ?auto_427988 ?auto_427993 ) ) ( not ( = ?auto_427988 ?auto_427994 ) ) ( not ( = ?auto_427988 ?auto_427995 ) ) ( not ( = ?auto_427988 ?auto_427996 ) ) ( not ( = ?auto_427988 ?auto_427997 ) ) ( not ( = ?auto_427988 ?auto_427998 ) ) ( not ( = ?auto_427988 ?auto_427999 ) ) ( not ( = ?auto_427988 ?auto_428000 ) ) ( not ( = ?auto_427989 ?auto_427990 ) ) ( not ( = ?auto_427989 ?auto_427991 ) ) ( not ( = ?auto_427989 ?auto_427992 ) ) ( not ( = ?auto_427989 ?auto_427993 ) ) ( not ( = ?auto_427989 ?auto_427994 ) ) ( not ( = ?auto_427989 ?auto_427995 ) ) ( not ( = ?auto_427989 ?auto_427996 ) ) ( not ( = ?auto_427989 ?auto_427997 ) ) ( not ( = ?auto_427989 ?auto_427998 ) ) ( not ( = ?auto_427989 ?auto_427999 ) ) ( not ( = ?auto_427989 ?auto_428000 ) ) ( not ( = ?auto_427990 ?auto_427991 ) ) ( not ( = ?auto_427990 ?auto_427992 ) ) ( not ( = ?auto_427990 ?auto_427993 ) ) ( not ( = ?auto_427990 ?auto_427994 ) ) ( not ( = ?auto_427990 ?auto_427995 ) ) ( not ( = ?auto_427990 ?auto_427996 ) ) ( not ( = ?auto_427990 ?auto_427997 ) ) ( not ( = ?auto_427990 ?auto_427998 ) ) ( not ( = ?auto_427990 ?auto_427999 ) ) ( not ( = ?auto_427990 ?auto_428000 ) ) ( not ( = ?auto_427991 ?auto_427992 ) ) ( not ( = ?auto_427991 ?auto_427993 ) ) ( not ( = ?auto_427991 ?auto_427994 ) ) ( not ( = ?auto_427991 ?auto_427995 ) ) ( not ( = ?auto_427991 ?auto_427996 ) ) ( not ( = ?auto_427991 ?auto_427997 ) ) ( not ( = ?auto_427991 ?auto_427998 ) ) ( not ( = ?auto_427991 ?auto_427999 ) ) ( not ( = ?auto_427991 ?auto_428000 ) ) ( not ( = ?auto_427992 ?auto_427993 ) ) ( not ( = ?auto_427992 ?auto_427994 ) ) ( not ( = ?auto_427992 ?auto_427995 ) ) ( not ( = ?auto_427992 ?auto_427996 ) ) ( not ( = ?auto_427992 ?auto_427997 ) ) ( not ( = ?auto_427992 ?auto_427998 ) ) ( not ( = ?auto_427992 ?auto_427999 ) ) ( not ( = ?auto_427992 ?auto_428000 ) ) ( not ( = ?auto_427993 ?auto_427994 ) ) ( not ( = ?auto_427993 ?auto_427995 ) ) ( not ( = ?auto_427993 ?auto_427996 ) ) ( not ( = ?auto_427993 ?auto_427997 ) ) ( not ( = ?auto_427993 ?auto_427998 ) ) ( not ( = ?auto_427993 ?auto_427999 ) ) ( not ( = ?auto_427993 ?auto_428000 ) ) ( not ( = ?auto_427994 ?auto_427995 ) ) ( not ( = ?auto_427994 ?auto_427996 ) ) ( not ( = ?auto_427994 ?auto_427997 ) ) ( not ( = ?auto_427994 ?auto_427998 ) ) ( not ( = ?auto_427994 ?auto_427999 ) ) ( not ( = ?auto_427994 ?auto_428000 ) ) ( not ( = ?auto_427995 ?auto_427996 ) ) ( not ( = ?auto_427995 ?auto_427997 ) ) ( not ( = ?auto_427995 ?auto_427998 ) ) ( not ( = ?auto_427995 ?auto_427999 ) ) ( not ( = ?auto_427995 ?auto_428000 ) ) ( not ( = ?auto_427996 ?auto_427997 ) ) ( not ( = ?auto_427996 ?auto_427998 ) ) ( not ( = ?auto_427996 ?auto_427999 ) ) ( not ( = ?auto_427996 ?auto_428000 ) ) ( not ( = ?auto_427997 ?auto_427998 ) ) ( not ( = ?auto_427997 ?auto_427999 ) ) ( not ( = ?auto_427997 ?auto_428000 ) ) ( not ( = ?auto_427998 ?auto_427999 ) ) ( not ( = ?auto_427998 ?auto_428000 ) ) ( not ( = ?auto_427999 ?auto_428000 ) ) ( ON ?auto_427998 ?auto_427999 ) ( ON ?auto_427997 ?auto_427998 ) ( ON ?auto_427996 ?auto_427997 ) ( ON ?auto_427995 ?auto_427996 ) ( ON ?auto_427994 ?auto_427995 ) ( ON ?auto_427993 ?auto_427994 ) ( ON ?auto_427992 ?auto_427993 ) ( CLEAR ?auto_427990 ) ( ON ?auto_427991 ?auto_427992 ) ( CLEAR ?auto_427991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_427985 ?auto_427986 ?auto_427987 ?auto_427988 ?auto_427989 ?auto_427990 ?auto_427991 )
      ( MAKE-15PILE ?auto_427985 ?auto_427986 ?auto_427987 ?auto_427988 ?auto_427989 ?auto_427990 ?auto_427991 ?auto_427992 ?auto_427993 ?auto_427994 ?auto_427995 ?auto_427996 ?auto_427997 ?auto_427998 ?auto_427999 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_428016 - BLOCK
      ?auto_428017 - BLOCK
      ?auto_428018 - BLOCK
      ?auto_428019 - BLOCK
      ?auto_428020 - BLOCK
      ?auto_428021 - BLOCK
      ?auto_428022 - BLOCK
      ?auto_428023 - BLOCK
      ?auto_428024 - BLOCK
      ?auto_428025 - BLOCK
      ?auto_428026 - BLOCK
      ?auto_428027 - BLOCK
      ?auto_428028 - BLOCK
      ?auto_428029 - BLOCK
      ?auto_428030 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_428030 ) ( ON-TABLE ?auto_428016 ) ( ON ?auto_428017 ?auto_428016 ) ( ON ?auto_428018 ?auto_428017 ) ( ON ?auto_428019 ?auto_428018 ) ( ON ?auto_428020 ?auto_428019 ) ( ON ?auto_428021 ?auto_428020 ) ( not ( = ?auto_428016 ?auto_428017 ) ) ( not ( = ?auto_428016 ?auto_428018 ) ) ( not ( = ?auto_428016 ?auto_428019 ) ) ( not ( = ?auto_428016 ?auto_428020 ) ) ( not ( = ?auto_428016 ?auto_428021 ) ) ( not ( = ?auto_428016 ?auto_428022 ) ) ( not ( = ?auto_428016 ?auto_428023 ) ) ( not ( = ?auto_428016 ?auto_428024 ) ) ( not ( = ?auto_428016 ?auto_428025 ) ) ( not ( = ?auto_428016 ?auto_428026 ) ) ( not ( = ?auto_428016 ?auto_428027 ) ) ( not ( = ?auto_428016 ?auto_428028 ) ) ( not ( = ?auto_428016 ?auto_428029 ) ) ( not ( = ?auto_428016 ?auto_428030 ) ) ( not ( = ?auto_428017 ?auto_428018 ) ) ( not ( = ?auto_428017 ?auto_428019 ) ) ( not ( = ?auto_428017 ?auto_428020 ) ) ( not ( = ?auto_428017 ?auto_428021 ) ) ( not ( = ?auto_428017 ?auto_428022 ) ) ( not ( = ?auto_428017 ?auto_428023 ) ) ( not ( = ?auto_428017 ?auto_428024 ) ) ( not ( = ?auto_428017 ?auto_428025 ) ) ( not ( = ?auto_428017 ?auto_428026 ) ) ( not ( = ?auto_428017 ?auto_428027 ) ) ( not ( = ?auto_428017 ?auto_428028 ) ) ( not ( = ?auto_428017 ?auto_428029 ) ) ( not ( = ?auto_428017 ?auto_428030 ) ) ( not ( = ?auto_428018 ?auto_428019 ) ) ( not ( = ?auto_428018 ?auto_428020 ) ) ( not ( = ?auto_428018 ?auto_428021 ) ) ( not ( = ?auto_428018 ?auto_428022 ) ) ( not ( = ?auto_428018 ?auto_428023 ) ) ( not ( = ?auto_428018 ?auto_428024 ) ) ( not ( = ?auto_428018 ?auto_428025 ) ) ( not ( = ?auto_428018 ?auto_428026 ) ) ( not ( = ?auto_428018 ?auto_428027 ) ) ( not ( = ?auto_428018 ?auto_428028 ) ) ( not ( = ?auto_428018 ?auto_428029 ) ) ( not ( = ?auto_428018 ?auto_428030 ) ) ( not ( = ?auto_428019 ?auto_428020 ) ) ( not ( = ?auto_428019 ?auto_428021 ) ) ( not ( = ?auto_428019 ?auto_428022 ) ) ( not ( = ?auto_428019 ?auto_428023 ) ) ( not ( = ?auto_428019 ?auto_428024 ) ) ( not ( = ?auto_428019 ?auto_428025 ) ) ( not ( = ?auto_428019 ?auto_428026 ) ) ( not ( = ?auto_428019 ?auto_428027 ) ) ( not ( = ?auto_428019 ?auto_428028 ) ) ( not ( = ?auto_428019 ?auto_428029 ) ) ( not ( = ?auto_428019 ?auto_428030 ) ) ( not ( = ?auto_428020 ?auto_428021 ) ) ( not ( = ?auto_428020 ?auto_428022 ) ) ( not ( = ?auto_428020 ?auto_428023 ) ) ( not ( = ?auto_428020 ?auto_428024 ) ) ( not ( = ?auto_428020 ?auto_428025 ) ) ( not ( = ?auto_428020 ?auto_428026 ) ) ( not ( = ?auto_428020 ?auto_428027 ) ) ( not ( = ?auto_428020 ?auto_428028 ) ) ( not ( = ?auto_428020 ?auto_428029 ) ) ( not ( = ?auto_428020 ?auto_428030 ) ) ( not ( = ?auto_428021 ?auto_428022 ) ) ( not ( = ?auto_428021 ?auto_428023 ) ) ( not ( = ?auto_428021 ?auto_428024 ) ) ( not ( = ?auto_428021 ?auto_428025 ) ) ( not ( = ?auto_428021 ?auto_428026 ) ) ( not ( = ?auto_428021 ?auto_428027 ) ) ( not ( = ?auto_428021 ?auto_428028 ) ) ( not ( = ?auto_428021 ?auto_428029 ) ) ( not ( = ?auto_428021 ?auto_428030 ) ) ( not ( = ?auto_428022 ?auto_428023 ) ) ( not ( = ?auto_428022 ?auto_428024 ) ) ( not ( = ?auto_428022 ?auto_428025 ) ) ( not ( = ?auto_428022 ?auto_428026 ) ) ( not ( = ?auto_428022 ?auto_428027 ) ) ( not ( = ?auto_428022 ?auto_428028 ) ) ( not ( = ?auto_428022 ?auto_428029 ) ) ( not ( = ?auto_428022 ?auto_428030 ) ) ( not ( = ?auto_428023 ?auto_428024 ) ) ( not ( = ?auto_428023 ?auto_428025 ) ) ( not ( = ?auto_428023 ?auto_428026 ) ) ( not ( = ?auto_428023 ?auto_428027 ) ) ( not ( = ?auto_428023 ?auto_428028 ) ) ( not ( = ?auto_428023 ?auto_428029 ) ) ( not ( = ?auto_428023 ?auto_428030 ) ) ( not ( = ?auto_428024 ?auto_428025 ) ) ( not ( = ?auto_428024 ?auto_428026 ) ) ( not ( = ?auto_428024 ?auto_428027 ) ) ( not ( = ?auto_428024 ?auto_428028 ) ) ( not ( = ?auto_428024 ?auto_428029 ) ) ( not ( = ?auto_428024 ?auto_428030 ) ) ( not ( = ?auto_428025 ?auto_428026 ) ) ( not ( = ?auto_428025 ?auto_428027 ) ) ( not ( = ?auto_428025 ?auto_428028 ) ) ( not ( = ?auto_428025 ?auto_428029 ) ) ( not ( = ?auto_428025 ?auto_428030 ) ) ( not ( = ?auto_428026 ?auto_428027 ) ) ( not ( = ?auto_428026 ?auto_428028 ) ) ( not ( = ?auto_428026 ?auto_428029 ) ) ( not ( = ?auto_428026 ?auto_428030 ) ) ( not ( = ?auto_428027 ?auto_428028 ) ) ( not ( = ?auto_428027 ?auto_428029 ) ) ( not ( = ?auto_428027 ?auto_428030 ) ) ( not ( = ?auto_428028 ?auto_428029 ) ) ( not ( = ?auto_428028 ?auto_428030 ) ) ( not ( = ?auto_428029 ?auto_428030 ) ) ( ON ?auto_428029 ?auto_428030 ) ( ON ?auto_428028 ?auto_428029 ) ( ON ?auto_428027 ?auto_428028 ) ( ON ?auto_428026 ?auto_428027 ) ( ON ?auto_428025 ?auto_428026 ) ( ON ?auto_428024 ?auto_428025 ) ( ON ?auto_428023 ?auto_428024 ) ( CLEAR ?auto_428021 ) ( ON ?auto_428022 ?auto_428023 ) ( CLEAR ?auto_428022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_428016 ?auto_428017 ?auto_428018 ?auto_428019 ?auto_428020 ?auto_428021 ?auto_428022 )
      ( MAKE-15PILE ?auto_428016 ?auto_428017 ?auto_428018 ?auto_428019 ?auto_428020 ?auto_428021 ?auto_428022 ?auto_428023 ?auto_428024 ?auto_428025 ?auto_428026 ?auto_428027 ?auto_428028 ?auto_428029 ?auto_428030 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_428046 - BLOCK
      ?auto_428047 - BLOCK
      ?auto_428048 - BLOCK
      ?auto_428049 - BLOCK
      ?auto_428050 - BLOCK
      ?auto_428051 - BLOCK
      ?auto_428052 - BLOCK
      ?auto_428053 - BLOCK
      ?auto_428054 - BLOCK
      ?auto_428055 - BLOCK
      ?auto_428056 - BLOCK
      ?auto_428057 - BLOCK
      ?auto_428058 - BLOCK
      ?auto_428059 - BLOCK
      ?auto_428060 - BLOCK
    )
    :vars
    (
      ?auto_428061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428060 ?auto_428061 ) ( ON-TABLE ?auto_428046 ) ( ON ?auto_428047 ?auto_428046 ) ( ON ?auto_428048 ?auto_428047 ) ( ON ?auto_428049 ?auto_428048 ) ( ON ?auto_428050 ?auto_428049 ) ( not ( = ?auto_428046 ?auto_428047 ) ) ( not ( = ?auto_428046 ?auto_428048 ) ) ( not ( = ?auto_428046 ?auto_428049 ) ) ( not ( = ?auto_428046 ?auto_428050 ) ) ( not ( = ?auto_428046 ?auto_428051 ) ) ( not ( = ?auto_428046 ?auto_428052 ) ) ( not ( = ?auto_428046 ?auto_428053 ) ) ( not ( = ?auto_428046 ?auto_428054 ) ) ( not ( = ?auto_428046 ?auto_428055 ) ) ( not ( = ?auto_428046 ?auto_428056 ) ) ( not ( = ?auto_428046 ?auto_428057 ) ) ( not ( = ?auto_428046 ?auto_428058 ) ) ( not ( = ?auto_428046 ?auto_428059 ) ) ( not ( = ?auto_428046 ?auto_428060 ) ) ( not ( = ?auto_428046 ?auto_428061 ) ) ( not ( = ?auto_428047 ?auto_428048 ) ) ( not ( = ?auto_428047 ?auto_428049 ) ) ( not ( = ?auto_428047 ?auto_428050 ) ) ( not ( = ?auto_428047 ?auto_428051 ) ) ( not ( = ?auto_428047 ?auto_428052 ) ) ( not ( = ?auto_428047 ?auto_428053 ) ) ( not ( = ?auto_428047 ?auto_428054 ) ) ( not ( = ?auto_428047 ?auto_428055 ) ) ( not ( = ?auto_428047 ?auto_428056 ) ) ( not ( = ?auto_428047 ?auto_428057 ) ) ( not ( = ?auto_428047 ?auto_428058 ) ) ( not ( = ?auto_428047 ?auto_428059 ) ) ( not ( = ?auto_428047 ?auto_428060 ) ) ( not ( = ?auto_428047 ?auto_428061 ) ) ( not ( = ?auto_428048 ?auto_428049 ) ) ( not ( = ?auto_428048 ?auto_428050 ) ) ( not ( = ?auto_428048 ?auto_428051 ) ) ( not ( = ?auto_428048 ?auto_428052 ) ) ( not ( = ?auto_428048 ?auto_428053 ) ) ( not ( = ?auto_428048 ?auto_428054 ) ) ( not ( = ?auto_428048 ?auto_428055 ) ) ( not ( = ?auto_428048 ?auto_428056 ) ) ( not ( = ?auto_428048 ?auto_428057 ) ) ( not ( = ?auto_428048 ?auto_428058 ) ) ( not ( = ?auto_428048 ?auto_428059 ) ) ( not ( = ?auto_428048 ?auto_428060 ) ) ( not ( = ?auto_428048 ?auto_428061 ) ) ( not ( = ?auto_428049 ?auto_428050 ) ) ( not ( = ?auto_428049 ?auto_428051 ) ) ( not ( = ?auto_428049 ?auto_428052 ) ) ( not ( = ?auto_428049 ?auto_428053 ) ) ( not ( = ?auto_428049 ?auto_428054 ) ) ( not ( = ?auto_428049 ?auto_428055 ) ) ( not ( = ?auto_428049 ?auto_428056 ) ) ( not ( = ?auto_428049 ?auto_428057 ) ) ( not ( = ?auto_428049 ?auto_428058 ) ) ( not ( = ?auto_428049 ?auto_428059 ) ) ( not ( = ?auto_428049 ?auto_428060 ) ) ( not ( = ?auto_428049 ?auto_428061 ) ) ( not ( = ?auto_428050 ?auto_428051 ) ) ( not ( = ?auto_428050 ?auto_428052 ) ) ( not ( = ?auto_428050 ?auto_428053 ) ) ( not ( = ?auto_428050 ?auto_428054 ) ) ( not ( = ?auto_428050 ?auto_428055 ) ) ( not ( = ?auto_428050 ?auto_428056 ) ) ( not ( = ?auto_428050 ?auto_428057 ) ) ( not ( = ?auto_428050 ?auto_428058 ) ) ( not ( = ?auto_428050 ?auto_428059 ) ) ( not ( = ?auto_428050 ?auto_428060 ) ) ( not ( = ?auto_428050 ?auto_428061 ) ) ( not ( = ?auto_428051 ?auto_428052 ) ) ( not ( = ?auto_428051 ?auto_428053 ) ) ( not ( = ?auto_428051 ?auto_428054 ) ) ( not ( = ?auto_428051 ?auto_428055 ) ) ( not ( = ?auto_428051 ?auto_428056 ) ) ( not ( = ?auto_428051 ?auto_428057 ) ) ( not ( = ?auto_428051 ?auto_428058 ) ) ( not ( = ?auto_428051 ?auto_428059 ) ) ( not ( = ?auto_428051 ?auto_428060 ) ) ( not ( = ?auto_428051 ?auto_428061 ) ) ( not ( = ?auto_428052 ?auto_428053 ) ) ( not ( = ?auto_428052 ?auto_428054 ) ) ( not ( = ?auto_428052 ?auto_428055 ) ) ( not ( = ?auto_428052 ?auto_428056 ) ) ( not ( = ?auto_428052 ?auto_428057 ) ) ( not ( = ?auto_428052 ?auto_428058 ) ) ( not ( = ?auto_428052 ?auto_428059 ) ) ( not ( = ?auto_428052 ?auto_428060 ) ) ( not ( = ?auto_428052 ?auto_428061 ) ) ( not ( = ?auto_428053 ?auto_428054 ) ) ( not ( = ?auto_428053 ?auto_428055 ) ) ( not ( = ?auto_428053 ?auto_428056 ) ) ( not ( = ?auto_428053 ?auto_428057 ) ) ( not ( = ?auto_428053 ?auto_428058 ) ) ( not ( = ?auto_428053 ?auto_428059 ) ) ( not ( = ?auto_428053 ?auto_428060 ) ) ( not ( = ?auto_428053 ?auto_428061 ) ) ( not ( = ?auto_428054 ?auto_428055 ) ) ( not ( = ?auto_428054 ?auto_428056 ) ) ( not ( = ?auto_428054 ?auto_428057 ) ) ( not ( = ?auto_428054 ?auto_428058 ) ) ( not ( = ?auto_428054 ?auto_428059 ) ) ( not ( = ?auto_428054 ?auto_428060 ) ) ( not ( = ?auto_428054 ?auto_428061 ) ) ( not ( = ?auto_428055 ?auto_428056 ) ) ( not ( = ?auto_428055 ?auto_428057 ) ) ( not ( = ?auto_428055 ?auto_428058 ) ) ( not ( = ?auto_428055 ?auto_428059 ) ) ( not ( = ?auto_428055 ?auto_428060 ) ) ( not ( = ?auto_428055 ?auto_428061 ) ) ( not ( = ?auto_428056 ?auto_428057 ) ) ( not ( = ?auto_428056 ?auto_428058 ) ) ( not ( = ?auto_428056 ?auto_428059 ) ) ( not ( = ?auto_428056 ?auto_428060 ) ) ( not ( = ?auto_428056 ?auto_428061 ) ) ( not ( = ?auto_428057 ?auto_428058 ) ) ( not ( = ?auto_428057 ?auto_428059 ) ) ( not ( = ?auto_428057 ?auto_428060 ) ) ( not ( = ?auto_428057 ?auto_428061 ) ) ( not ( = ?auto_428058 ?auto_428059 ) ) ( not ( = ?auto_428058 ?auto_428060 ) ) ( not ( = ?auto_428058 ?auto_428061 ) ) ( not ( = ?auto_428059 ?auto_428060 ) ) ( not ( = ?auto_428059 ?auto_428061 ) ) ( not ( = ?auto_428060 ?auto_428061 ) ) ( ON ?auto_428059 ?auto_428060 ) ( ON ?auto_428058 ?auto_428059 ) ( ON ?auto_428057 ?auto_428058 ) ( ON ?auto_428056 ?auto_428057 ) ( ON ?auto_428055 ?auto_428056 ) ( ON ?auto_428054 ?auto_428055 ) ( ON ?auto_428053 ?auto_428054 ) ( ON ?auto_428052 ?auto_428053 ) ( CLEAR ?auto_428050 ) ( ON ?auto_428051 ?auto_428052 ) ( CLEAR ?auto_428051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_428046 ?auto_428047 ?auto_428048 ?auto_428049 ?auto_428050 ?auto_428051 )
      ( MAKE-15PILE ?auto_428046 ?auto_428047 ?auto_428048 ?auto_428049 ?auto_428050 ?auto_428051 ?auto_428052 ?auto_428053 ?auto_428054 ?auto_428055 ?auto_428056 ?auto_428057 ?auto_428058 ?auto_428059 ?auto_428060 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_428077 - BLOCK
      ?auto_428078 - BLOCK
      ?auto_428079 - BLOCK
      ?auto_428080 - BLOCK
      ?auto_428081 - BLOCK
      ?auto_428082 - BLOCK
      ?auto_428083 - BLOCK
      ?auto_428084 - BLOCK
      ?auto_428085 - BLOCK
      ?auto_428086 - BLOCK
      ?auto_428087 - BLOCK
      ?auto_428088 - BLOCK
      ?auto_428089 - BLOCK
      ?auto_428090 - BLOCK
      ?auto_428091 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_428091 ) ( ON-TABLE ?auto_428077 ) ( ON ?auto_428078 ?auto_428077 ) ( ON ?auto_428079 ?auto_428078 ) ( ON ?auto_428080 ?auto_428079 ) ( ON ?auto_428081 ?auto_428080 ) ( not ( = ?auto_428077 ?auto_428078 ) ) ( not ( = ?auto_428077 ?auto_428079 ) ) ( not ( = ?auto_428077 ?auto_428080 ) ) ( not ( = ?auto_428077 ?auto_428081 ) ) ( not ( = ?auto_428077 ?auto_428082 ) ) ( not ( = ?auto_428077 ?auto_428083 ) ) ( not ( = ?auto_428077 ?auto_428084 ) ) ( not ( = ?auto_428077 ?auto_428085 ) ) ( not ( = ?auto_428077 ?auto_428086 ) ) ( not ( = ?auto_428077 ?auto_428087 ) ) ( not ( = ?auto_428077 ?auto_428088 ) ) ( not ( = ?auto_428077 ?auto_428089 ) ) ( not ( = ?auto_428077 ?auto_428090 ) ) ( not ( = ?auto_428077 ?auto_428091 ) ) ( not ( = ?auto_428078 ?auto_428079 ) ) ( not ( = ?auto_428078 ?auto_428080 ) ) ( not ( = ?auto_428078 ?auto_428081 ) ) ( not ( = ?auto_428078 ?auto_428082 ) ) ( not ( = ?auto_428078 ?auto_428083 ) ) ( not ( = ?auto_428078 ?auto_428084 ) ) ( not ( = ?auto_428078 ?auto_428085 ) ) ( not ( = ?auto_428078 ?auto_428086 ) ) ( not ( = ?auto_428078 ?auto_428087 ) ) ( not ( = ?auto_428078 ?auto_428088 ) ) ( not ( = ?auto_428078 ?auto_428089 ) ) ( not ( = ?auto_428078 ?auto_428090 ) ) ( not ( = ?auto_428078 ?auto_428091 ) ) ( not ( = ?auto_428079 ?auto_428080 ) ) ( not ( = ?auto_428079 ?auto_428081 ) ) ( not ( = ?auto_428079 ?auto_428082 ) ) ( not ( = ?auto_428079 ?auto_428083 ) ) ( not ( = ?auto_428079 ?auto_428084 ) ) ( not ( = ?auto_428079 ?auto_428085 ) ) ( not ( = ?auto_428079 ?auto_428086 ) ) ( not ( = ?auto_428079 ?auto_428087 ) ) ( not ( = ?auto_428079 ?auto_428088 ) ) ( not ( = ?auto_428079 ?auto_428089 ) ) ( not ( = ?auto_428079 ?auto_428090 ) ) ( not ( = ?auto_428079 ?auto_428091 ) ) ( not ( = ?auto_428080 ?auto_428081 ) ) ( not ( = ?auto_428080 ?auto_428082 ) ) ( not ( = ?auto_428080 ?auto_428083 ) ) ( not ( = ?auto_428080 ?auto_428084 ) ) ( not ( = ?auto_428080 ?auto_428085 ) ) ( not ( = ?auto_428080 ?auto_428086 ) ) ( not ( = ?auto_428080 ?auto_428087 ) ) ( not ( = ?auto_428080 ?auto_428088 ) ) ( not ( = ?auto_428080 ?auto_428089 ) ) ( not ( = ?auto_428080 ?auto_428090 ) ) ( not ( = ?auto_428080 ?auto_428091 ) ) ( not ( = ?auto_428081 ?auto_428082 ) ) ( not ( = ?auto_428081 ?auto_428083 ) ) ( not ( = ?auto_428081 ?auto_428084 ) ) ( not ( = ?auto_428081 ?auto_428085 ) ) ( not ( = ?auto_428081 ?auto_428086 ) ) ( not ( = ?auto_428081 ?auto_428087 ) ) ( not ( = ?auto_428081 ?auto_428088 ) ) ( not ( = ?auto_428081 ?auto_428089 ) ) ( not ( = ?auto_428081 ?auto_428090 ) ) ( not ( = ?auto_428081 ?auto_428091 ) ) ( not ( = ?auto_428082 ?auto_428083 ) ) ( not ( = ?auto_428082 ?auto_428084 ) ) ( not ( = ?auto_428082 ?auto_428085 ) ) ( not ( = ?auto_428082 ?auto_428086 ) ) ( not ( = ?auto_428082 ?auto_428087 ) ) ( not ( = ?auto_428082 ?auto_428088 ) ) ( not ( = ?auto_428082 ?auto_428089 ) ) ( not ( = ?auto_428082 ?auto_428090 ) ) ( not ( = ?auto_428082 ?auto_428091 ) ) ( not ( = ?auto_428083 ?auto_428084 ) ) ( not ( = ?auto_428083 ?auto_428085 ) ) ( not ( = ?auto_428083 ?auto_428086 ) ) ( not ( = ?auto_428083 ?auto_428087 ) ) ( not ( = ?auto_428083 ?auto_428088 ) ) ( not ( = ?auto_428083 ?auto_428089 ) ) ( not ( = ?auto_428083 ?auto_428090 ) ) ( not ( = ?auto_428083 ?auto_428091 ) ) ( not ( = ?auto_428084 ?auto_428085 ) ) ( not ( = ?auto_428084 ?auto_428086 ) ) ( not ( = ?auto_428084 ?auto_428087 ) ) ( not ( = ?auto_428084 ?auto_428088 ) ) ( not ( = ?auto_428084 ?auto_428089 ) ) ( not ( = ?auto_428084 ?auto_428090 ) ) ( not ( = ?auto_428084 ?auto_428091 ) ) ( not ( = ?auto_428085 ?auto_428086 ) ) ( not ( = ?auto_428085 ?auto_428087 ) ) ( not ( = ?auto_428085 ?auto_428088 ) ) ( not ( = ?auto_428085 ?auto_428089 ) ) ( not ( = ?auto_428085 ?auto_428090 ) ) ( not ( = ?auto_428085 ?auto_428091 ) ) ( not ( = ?auto_428086 ?auto_428087 ) ) ( not ( = ?auto_428086 ?auto_428088 ) ) ( not ( = ?auto_428086 ?auto_428089 ) ) ( not ( = ?auto_428086 ?auto_428090 ) ) ( not ( = ?auto_428086 ?auto_428091 ) ) ( not ( = ?auto_428087 ?auto_428088 ) ) ( not ( = ?auto_428087 ?auto_428089 ) ) ( not ( = ?auto_428087 ?auto_428090 ) ) ( not ( = ?auto_428087 ?auto_428091 ) ) ( not ( = ?auto_428088 ?auto_428089 ) ) ( not ( = ?auto_428088 ?auto_428090 ) ) ( not ( = ?auto_428088 ?auto_428091 ) ) ( not ( = ?auto_428089 ?auto_428090 ) ) ( not ( = ?auto_428089 ?auto_428091 ) ) ( not ( = ?auto_428090 ?auto_428091 ) ) ( ON ?auto_428090 ?auto_428091 ) ( ON ?auto_428089 ?auto_428090 ) ( ON ?auto_428088 ?auto_428089 ) ( ON ?auto_428087 ?auto_428088 ) ( ON ?auto_428086 ?auto_428087 ) ( ON ?auto_428085 ?auto_428086 ) ( ON ?auto_428084 ?auto_428085 ) ( ON ?auto_428083 ?auto_428084 ) ( CLEAR ?auto_428081 ) ( ON ?auto_428082 ?auto_428083 ) ( CLEAR ?auto_428082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_428077 ?auto_428078 ?auto_428079 ?auto_428080 ?auto_428081 ?auto_428082 )
      ( MAKE-15PILE ?auto_428077 ?auto_428078 ?auto_428079 ?auto_428080 ?auto_428081 ?auto_428082 ?auto_428083 ?auto_428084 ?auto_428085 ?auto_428086 ?auto_428087 ?auto_428088 ?auto_428089 ?auto_428090 ?auto_428091 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_428107 - BLOCK
      ?auto_428108 - BLOCK
      ?auto_428109 - BLOCK
      ?auto_428110 - BLOCK
      ?auto_428111 - BLOCK
      ?auto_428112 - BLOCK
      ?auto_428113 - BLOCK
      ?auto_428114 - BLOCK
      ?auto_428115 - BLOCK
      ?auto_428116 - BLOCK
      ?auto_428117 - BLOCK
      ?auto_428118 - BLOCK
      ?auto_428119 - BLOCK
      ?auto_428120 - BLOCK
      ?auto_428121 - BLOCK
    )
    :vars
    (
      ?auto_428122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428121 ?auto_428122 ) ( ON-TABLE ?auto_428107 ) ( ON ?auto_428108 ?auto_428107 ) ( ON ?auto_428109 ?auto_428108 ) ( ON ?auto_428110 ?auto_428109 ) ( not ( = ?auto_428107 ?auto_428108 ) ) ( not ( = ?auto_428107 ?auto_428109 ) ) ( not ( = ?auto_428107 ?auto_428110 ) ) ( not ( = ?auto_428107 ?auto_428111 ) ) ( not ( = ?auto_428107 ?auto_428112 ) ) ( not ( = ?auto_428107 ?auto_428113 ) ) ( not ( = ?auto_428107 ?auto_428114 ) ) ( not ( = ?auto_428107 ?auto_428115 ) ) ( not ( = ?auto_428107 ?auto_428116 ) ) ( not ( = ?auto_428107 ?auto_428117 ) ) ( not ( = ?auto_428107 ?auto_428118 ) ) ( not ( = ?auto_428107 ?auto_428119 ) ) ( not ( = ?auto_428107 ?auto_428120 ) ) ( not ( = ?auto_428107 ?auto_428121 ) ) ( not ( = ?auto_428107 ?auto_428122 ) ) ( not ( = ?auto_428108 ?auto_428109 ) ) ( not ( = ?auto_428108 ?auto_428110 ) ) ( not ( = ?auto_428108 ?auto_428111 ) ) ( not ( = ?auto_428108 ?auto_428112 ) ) ( not ( = ?auto_428108 ?auto_428113 ) ) ( not ( = ?auto_428108 ?auto_428114 ) ) ( not ( = ?auto_428108 ?auto_428115 ) ) ( not ( = ?auto_428108 ?auto_428116 ) ) ( not ( = ?auto_428108 ?auto_428117 ) ) ( not ( = ?auto_428108 ?auto_428118 ) ) ( not ( = ?auto_428108 ?auto_428119 ) ) ( not ( = ?auto_428108 ?auto_428120 ) ) ( not ( = ?auto_428108 ?auto_428121 ) ) ( not ( = ?auto_428108 ?auto_428122 ) ) ( not ( = ?auto_428109 ?auto_428110 ) ) ( not ( = ?auto_428109 ?auto_428111 ) ) ( not ( = ?auto_428109 ?auto_428112 ) ) ( not ( = ?auto_428109 ?auto_428113 ) ) ( not ( = ?auto_428109 ?auto_428114 ) ) ( not ( = ?auto_428109 ?auto_428115 ) ) ( not ( = ?auto_428109 ?auto_428116 ) ) ( not ( = ?auto_428109 ?auto_428117 ) ) ( not ( = ?auto_428109 ?auto_428118 ) ) ( not ( = ?auto_428109 ?auto_428119 ) ) ( not ( = ?auto_428109 ?auto_428120 ) ) ( not ( = ?auto_428109 ?auto_428121 ) ) ( not ( = ?auto_428109 ?auto_428122 ) ) ( not ( = ?auto_428110 ?auto_428111 ) ) ( not ( = ?auto_428110 ?auto_428112 ) ) ( not ( = ?auto_428110 ?auto_428113 ) ) ( not ( = ?auto_428110 ?auto_428114 ) ) ( not ( = ?auto_428110 ?auto_428115 ) ) ( not ( = ?auto_428110 ?auto_428116 ) ) ( not ( = ?auto_428110 ?auto_428117 ) ) ( not ( = ?auto_428110 ?auto_428118 ) ) ( not ( = ?auto_428110 ?auto_428119 ) ) ( not ( = ?auto_428110 ?auto_428120 ) ) ( not ( = ?auto_428110 ?auto_428121 ) ) ( not ( = ?auto_428110 ?auto_428122 ) ) ( not ( = ?auto_428111 ?auto_428112 ) ) ( not ( = ?auto_428111 ?auto_428113 ) ) ( not ( = ?auto_428111 ?auto_428114 ) ) ( not ( = ?auto_428111 ?auto_428115 ) ) ( not ( = ?auto_428111 ?auto_428116 ) ) ( not ( = ?auto_428111 ?auto_428117 ) ) ( not ( = ?auto_428111 ?auto_428118 ) ) ( not ( = ?auto_428111 ?auto_428119 ) ) ( not ( = ?auto_428111 ?auto_428120 ) ) ( not ( = ?auto_428111 ?auto_428121 ) ) ( not ( = ?auto_428111 ?auto_428122 ) ) ( not ( = ?auto_428112 ?auto_428113 ) ) ( not ( = ?auto_428112 ?auto_428114 ) ) ( not ( = ?auto_428112 ?auto_428115 ) ) ( not ( = ?auto_428112 ?auto_428116 ) ) ( not ( = ?auto_428112 ?auto_428117 ) ) ( not ( = ?auto_428112 ?auto_428118 ) ) ( not ( = ?auto_428112 ?auto_428119 ) ) ( not ( = ?auto_428112 ?auto_428120 ) ) ( not ( = ?auto_428112 ?auto_428121 ) ) ( not ( = ?auto_428112 ?auto_428122 ) ) ( not ( = ?auto_428113 ?auto_428114 ) ) ( not ( = ?auto_428113 ?auto_428115 ) ) ( not ( = ?auto_428113 ?auto_428116 ) ) ( not ( = ?auto_428113 ?auto_428117 ) ) ( not ( = ?auto_428113 ?auto_428118 ) ) ( not ( = ?auto_428113 ?auto_428119 ) ) ( not ( = ?auto_428113 ?auto_428120 ) ) ( not ( = ?auto_428113 ?auto_428121 ) ) ( not ( = ?auto_428113 ?auto_428122 ) ) ( not ( = ?auto_428114 ?auto_428115 ) ) ( not ( = ?auto_428114 ?auto_428116 ) ) ( not ( = ?auto_428114 ?auto_428117 ) ) ( not ( = ?auto_428114 ?auto_428118 ) ) ( not ( = ?auto_428114 ?auto_428119 ) ) ( not ( = ?auto_428114 ?auto_428120 ) ) ( not ( = ?auto_428114 ?auto_428121 ) ) ( not ( = ?auto_428114 ?auto_428122 ) ) ( not ( = ?auto_428115 ?auto_428116 ) ) ( not ( = ?auto_428115 ?auto_428117 ) ) ( not ( = ?auto_428115 ?auto_428118 ) ) ( not ( = ?auto_428115 ?auto_428119 ) ) ( not ( = ?auto_428115 ?auto_428120 ) ) ( not ( = ?auto_428115 ?auto_428121 ) ) ( not ( = ?auto_428115 ?auto_428122 ) ) ( not ( = ?auto_428116 ?auto_428117 ) ) ( not ( = ?auto_428116 ?auto_428118 ) ) ( not ( = ?auto_428116 ?auto_428119 ) ) ( not ( = ?auto_428116 ?auto_428120 ) ) ( not ( = ?auto_428116 ?auto_428121 ) ) ( not ( = ?auto_428116 ?auto_428122 ) ) ( not ( = ?auto_428117 ?auto_428118 ) ) ( not ( = ?auto_428117 ?auto_428119 ) ) ( not ( = ?auto_428117 ?auto_428120 ) ) ( not ( = ?auto_428117 ?auto_428121 ) ) ( not ( = ?auto_428117 ?auto_428122 ) ) ( not ( = ?auto_428118 ?auto_428119 ) ) ( not ( = ?auto_428118 ?auto_428120 ) ) ( not ( = ?auto_428118 ?auto_428121 ) ) ( not ( = ?auto_428118 ?auto_428122 ) ) ( not ( = ?auto_428119 ?auto_428120 ) ) ( not ( = ?auto_428119 ?auto_428121 ) ) ( not ( = ?auto_428119 ?auto_428122 ) ) ( not ( = ?auto_428120 ?auto_428121 ) ) ( not ( = ?auto_428120 ?auto_428122 ) ) ( not ( = ?auto_428121 ?auto_428122 ) ) ( ON ?auto_428120 ?auto_428121 ) ( ON ?auto_428119 ?auto_428120 ) ( ON ?auto_428118 ?auto_428119 ) ( ON ?auto_428117 ?auto_428118 ) ( ON ?auto_428116 ?auto_428117 ) ( ON ?auto_428115 ?auto_428116 ) ( ON ?auto_428114 ?auto_428115 ) ( ON ?auto_428113 ?auto_428114 ) ( ON ?auto_428112 ?auto_428113 ) ( CLEAR ?auto_428110 ) ( ON ?auto_428111 ?auto_428112 ) ( CLEAR ?auto_428111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_428107 ?auto_428108 ?auto_428109 ?auto_428110 ?auto_428111 )
      ( MAKE-15PILE ?auto_428107 ?auto_428108 ?auto_428109 ?auto_428110 ?auto_428111 ?auto_428112 ?auto_428113 ?auto_428114 ?auto_428115 ?auto_428116 ?auto_428117 ?auto_428118 ?auto_428119 ?auto_428120 ?auto_428121 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_428138 - BLOCK
      ?auto_428139 - BLOCK
      ?auto_428140 - BLOCK
      ?auto_428141 - BLOCK
      ?auto_428142 - BLOCK
      ?auto_428143 - BLOCK
      ?auto_428144 - BLOCK
      ?auto_428145 - BLOCK
      ?auto_428146 - BLOCK
      ?auto_428147 - BLOCK
      ?auto_428148 - BLOCK
      ?auto_428149 - BLOCK
      ?auto_428150 - BLOCK
      ?auto_428151 - BLOCK
      ?auto_428152 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_428152 ) ( ON-TABLE ?auto_428138 ) ( ON ?auto_428139 ?auto_428138 ) ( ON ?auto_428140 ?auto_428139 ) ( ON ?auto_428141 ?auto_428140 ) ( not ( = ?auto_428138 ?auto_428139 ) ) ( not ( = ?auto_428138 ?auto_428140 ) ) ( not ( = ?auto_428138 ?auto_428141 ) ) ( not ( = ?auto_428138 ?auto_428142 ) ) ( not ( = ?auto_428138 ?auto_428143 ) ) ( not ( = ?auto_428138 ?auto_428144 ) ) ( not ( = ?auto_428138 ?auto_428145 ) ) ( not ( = ?auto_428138 ?auto_428146 ) ) ( not ( = ?auto_428138 ?auto_428147 ) ) ( not ( = ?auto_428138 ?auto_428148 ) ) ( not ( = ?auto_428138 ?auto_428149 ) ) ( not ( = ?auto_428138 ?auto_428150 ) ) ( not ( = ?auto_428138 ?auto_428151 ) ) ( not ( = ?auto_428138 ?auto_428152 ) ) ( not ( = ?auto_428139 ?auto_428140 ) ) ( not ( = ?auto_428139 ?auto_428141 ) ) ( not ( = ?auto_428139 ?auto_428142 ) ) ( not ( = ?auto_428139 ?auto_428143 ) ) ( not ( = ?auto_428139 ?auto_428144 ) ) ( not ( = ?auto_428139 ?auto_428145 ) ) ( not ( = ?auto_428139 ?auto_428146 ) ) ( not ( = ?auto_428139 ?auto_428147 ) ) ( not ( = ?auto_428139 ?auto_428148 ) ) ( not ( = ?auto_428139 ?auto_428149 ) ) ( not ( = ?auto_428139 ?auto_428150 ) ) ( not ( = ?auto_428139 ?auto_428151 ) ) ( not ( = ?auto_428139 ?auto_428152 ) ) ( not ( = ?auto_428140 ?auto_428141 ) ) ( not ( = ?auto_428140 ?auto_428142 ) ) ( not ( = ?auto_428140 ?auto_428143 ) ) ( not ( = ?auto_428140 ?auto_428144 ) ) ( not ( = ?auto_428140 ?auto_428145 ) ) ( not ( = ?auto_428140 ?auto_428146 ) ) ( not ( = ?auto_428140 ?auto_428147 ) ) ( not ( = ?auto_428140 ?auto_428148 ) ) ( not ( = ?auto_428140 ?auto_428149 ) ) ( not ( = ?auto_428140 ?auto_428150 ) ) ( not ( = ?auto_428140 ?auto_428151 ) ) ( not ( = ?auto_428140 ?auto_428152 ) ) ( not ( = ?auto_428141 ?auto_428142 ) ) ( not ( = ?auto_428141 ?auto_428143 ) ) ( not ( = ?auto_428141 ?auto_428144 ) ) ( not ( = ?auto_428141 ?auto_428145 ) ) ( not ( = ?auto_428141 ?auto_428146 ) ) ( not ( = ?auto_428141 ?auto_428147 ) ) ( not ( = ?auto_428141 ?auto_428148 ) ) ( not ( = ?auto_428141 ?auto_428149 ) ) ( not ( = ?auto_428141 ?auto_428150 ) ) ( not ( = ?auto_428141 ?auto_428151 ) ) ( not ( = ?auto_428141 ?auto_428152 ) ) ( not ( = ?auto_428142 ?auto_428143 ) ) ( not ( = ?auto_428142 ?auto_428144 ) ) ( not ( = ?auto_428142 ?auto_428145 ) ) ( not ( = ?auto_428142 ?auto_428146 ) ) ( not ( = ?auto_428142 ?auto_428147 ) ) ( not ( = ?auto_428142 ?auto_428148 ) ) ( not ( = ?auto_428142 ?auto_428149 ) ) ( not ( = ?auto_428142 ?auto_428150 ) ) ( not ( = ?auto_428142 ?auto_428151 ) ) ( not ( = ?auto_428142 ?auto_428152 ) ) ( not ( = ?auto_428143 ?auto_428144 ) ) ( not ( = ?auto_428143 ?auto_428145 ) ) ( not ( = ?auto_428143 ?auto_428146 ) ) ( not ( = ?auto_428143 ?auto_428147 ) ) ( not ( = ?auto_428143 ?auto_428148 ) ) ( not ( = ?auto_428143 ?auto_428149 ) ) ( not ( = ?auto_428143 ?auto_428150 ) ) ( not ( = ?auto_428143 ?auto_428151 ) ) ( not ( = ?auto_428143 ?auto_428152 ) ) ( not ( = ?auto_428144 ?auto_428145 ) ) ( not ( = ?auto_428144 ?auto_428146 ) ) ( not ( = ?auto_428144 ?auto_428147 ) ) ( not ( = ?auto_428144 ?auto_428148 ) ) ( not ( = ?auto_428144 ?auto_428149 ) ) ( not ( = ?auto_428144 ?auto_428150 ) ) ( not ( = ?auto_428144 ?auto_428151 ) ) ( not ( = ?auto_428144 ?auto_428152 ) ) ( not ( = ?auto_428145 ?auto_428146 ) ) ( not ( = ?auto_428145 ?auto_428147 ) ) ( not ( = ?auto_428145 ?auto_428148 ) ) ( not ( = ?auto_428145 ?auto_428149 ) ) ( not ( = ?auto_428145 ?auto_428150 ) ) ( not ( = ?auto_428145 ?auto_428151 ) ) ( not ( = ?auto_428145 ?auto_428152 ) ) ( not ( = ?auto_428146 ?auto_428147 ) ) ( not ( = ?auto_428146 ?auto_428148 ) ) ( not ( = ?auto_428146 ?auto_428149 ) ) ( not ( = ?auto_428146 ?auto_428150 ) ) ( not ( = ?auto_428146 ?auto_428151 ) ) ( not ( = ?auto_428146 ?auto_428152 ) ) ( not ( = ?auto_428147 ?auto_428148 ) ) ( not ( = ?auto_428147 ?auto_428149 ) ) ( not ( = ?auto_428147 ?auto_428150 ) ) ( not ( = ?auto_428147 ?auto_428151 ) ) ( not ( = ?auto_428147 ?auto_428152 ) ) ( not ( = ?auto_428148 ?auto_428149 ) ) ( not ( = ?auto_428148 ?auto_428150 ) ) ( not ( = ?auto_428148 ?auto_428151 ) ) ( not ( = ?auto_428148 ?auto_428152 ) ) ( not ( = ?auto_428149 ?auto_428150 ) ) ( not ( = ?auto_428149 ?auto_428151 ) ) ( not ( = ?auto_428149 ?auto_428152 ) ) ( not ( = ?auto_428150 ?auto_428151 ) ) ( not ( = ?auto_428150 ?auto_428152 ) ) ( not ( = ?auto_428151 ?auto_428152 ) ) ( ON ?auto_428151 ?auto_428152 ) ( ON ?auto_428150 ?auto_428151 ) ( ON ?auto_428149 ?auto_428150 ) ( ON ?auto_428148 ?auto_428149 ) ( ON ?auto_428147 ?auto_428148 ) ( ON ?auto_428146 ?auto_428147 ) ( ON ?auto_428145 ?auto_428146 ) ( ON ?auto_428144 ?auto_428145 ) ( ON ?auto_428143 ?auto_428144 ) ( CLEAR ?auto_428141 ) ( ON ?auto_428142 ?auto_428143 ) ( CLEAR ?auto_428142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_428138 ?auto_428139 ?auto_428140 ?auto_428141 ?auto_428142 )
      ( MAKE-15PILE ?auto_428138 ?auto_428139 ?auto_428140 ?auto_428141 ?auto_428142 ?auto_428143 ?auto_428144 ?auto_428145 ?auto_428146 ?auto_428147 ?auto_428148 ?auto_428149 ?auto_428150 ?auto_428151 ?auto_428152 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_428168 - BLOCK
      ?auto_428169 - BLOCK
      ?auto_428170 - BLOCK
      ?auto_428171 - BLOCK
      ?auto_428172 - BLOCK
      ?auto_428173 - BLOCK
      ?auto_428174 - BLOCK
      ?auto_428175 - BLOCK
      ?auto_428176 - BLOCK
      ?auto_428177 - BLOCK
      ?auto_428178 - BLOCK
      ?auto_428179 - BLOCK
      ?auto_428180 - BLOCK
      ?auto_428181 - BLOCK
      ?auto_428182 - BLOCK
    )
    :vars
    (
      ?auto_428183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428182 ?auto_428183 ) ( ON-TABLE ?auto_428168 ) ( ON ?auto_428169 ?auto_428168 ) ( ON ?auto_428170 ?auto_428169 ) ( not ( = ?auto_428168 ?auto_428169 ) ) ( not ( = ?auto_428168 ?auto_428170 ) ) ( not ( = ?auto_428168 ?auto_428171 ) ) ( not ( = ?auto_428168 ?auto_428172 ) ) ( not ( = ?auto_428168 ?auto_428173 ) ) ( not ( = ?auto_428168 ?auto_428174 ) ) ( not ( = ?auto_428168 ?auto_428175 ) ) ( not ( = ?auto_428168 ?auto_428176 ) ) ( not ( = ?auto_428168 ?auto_428177 ) ) ( not ( = ?auto_428168 ?auto_428178 ) ) ( not ( = ?auto_428168 ?auto_428179 ) ) ( not ( = ?auto_428168 ?auto_428180 ) ) ( not ( = ?auto_428168 ?auto_428181 ) ) ( not ( = ?auto_428168 ?auto_428182 ) ) ( not ( = ?auto_428168 ?auto_428183 ) ) ( not ( = ?auto_428169 ?auto_428170 ) ) ( not ( = ?auto_428169 ?auto_428171 ) ) ( not ( = ?auto_428169 ?auto_428172 ) ) ( not ( = ?auto_428169 ?auto_428173 ) ) ( not ( = ?auto_428169 ?auto_428174 ) ) ( not ( = ?auto_428169 ?auto_428175 ) ) ( not ( = ?auto_428169 ?auto_428176 ) ) ( not ( = ?auto_428169 ?auto_428177 ) ) ( not ( = ?auto_428169 ?auto_428178 ) ) ( not ( = ?auto_428169 ?auto_428179 ) ) ( not ( = ?auto_428169 ?auto_428180 ) ) ( not ( = ?auto_428169 ?auto_428181 ) ) ( not ( = ?auto_428169 ?auto_428182 ) ) ( not ( = ?auto_428169 ?auto_428183 ) ) ( not ( = ?auto_428170 ?auto_428171 ) ) ( not ( = ?auto_428170 ?auto_428172 ) ) ( not ( = ?auto_428170 ?auto_428173 ) ) ( not ( = ?auto_428170 ?auto_428174 ) ) ( not ( = ?auto_428170 ?auto_428175 ) ) ( not ( = ?auto_428170 ?auto_428176 ) ) ( not ( = ?auto_428170 ?auto_428177 ) ) ( not ( = ?auto_428170 ?auto_428178 ) ) ( not ( = ?auto_428170 ?auto_428179 ) ) ( not ( = ?auto_428170 ?auto_428180 ) ) ( not ( = ?auto_428170 ?auto_428181 ) ) ( not ( = ?auto_428170 ?auto_428182 ) ) ( not ( = ?auto_428170 ?auto_428183 ) ) ( not ( = ?auto_428171 ?auto_428172 ) ) ( not ( = ?auto_428171 ?auto_428173 ) ) ( not ( = ?auto_428171 ?auto_428174 ) ) ( not ( = ?auto_428171 ?auto_428175 ) ) ( not ( = ?auto_428171 ?auto_428176 ) ) ( not ( = ?auto_428171 ?auto_428177 ) ) ( not ( = ?auto_428171 ?auto_428178 ) ) ( not ( = ?auto_428171 ?auto_428179 ) ) ( not ( = ?auto_428171 ?auto_428180 ) ) ( not ( = ?auto_428171 ?auto_428181 ) ) ( not ( = ?auto_428171 ?auto_428182 ) ) ( not ( = ?auto_428171 ?auto_428183 ) ) ( not ( = ?auto_428172 ?auto_428173 ) ) ( not ( = ?auto_428172 ?auto_428174 ) ) ( not ( = ?auto_428172 ?auto_428175 ) ) ( not ( = ?auto_428172 ?auto_428176 ) ) ( not ( = ?auto_428172 ?auto_428177 ) ) ( not ( = ?auto_428172 ?auto_428178 ) ) ( not ( = ?auto_428172 ?auto_428179 ) ) ( not ( = ?auto_428172 ?auto_428180 ) ) ( not ( = ?auto_428172 ?auto_428181 ) ) ( not ( = ?auto_428172 ?auto_428182 ) ) ( not ( = ?auto_428172 ?auto_428183 ) ) ( not ( = ?auto_428173 ?auto_428174 ) ) ( not ( = ?auto_428173 ?auto_428175 ) ) ( not ( = ?auto_428173 ?auto_428176 ) ) ( not ( = ?auto_428173 ?auto_428177 ) ) ( not ( = ?auto_428173 ?auto_428178 ) ) ( not ( = ?auto_428173 ?auto_428179 ) ) ( not ( = ?auto_428173 ?auto_428180 ) ) ( not ( = ?auto_428173 ?auto_428181 ) ) ( not ( = ?auto_428173 ?auto_428182 ) ) ( not ( = ?auto_428173 ?auto_428183 ) ) ( not ( = ?auto_428174 ?auto_428175 ) ) ( not ( = ?auto_428174 ?auto_428176 ) ) ( not ( = ?auto_428174 ?auto_428177 ) ) ( not ( = ?auto_428174 ?auto_428178 ) ) ( not ( = ?auto_428174 ?auto_428179 ) ) ( not ( = ?auto_428174 ?auto_428180 ) ) ( not ( = ?auto_428174 ?auto_428181 ) ) ( not ( = ?auto_428174 ?auto_428182 ) ) ( not ( = ?auto_428174 ?auto_428183 ) ) ( not ( = ?auto_428175 ?auto_428176 ) ) ( not ( = ?auto_428175 ?auto_428177 ) ) ( not ( = ?auto_428175 ?auto_428178 ) ) ( not ( = ?auto_428175 ?auto_428179 ) ) ( not ( = ?auto_428175 ?auto_428180 ) ) ( not ( = ?auto_428175 ?auto_428181 ) ) ( not ( = ?auto_428175 ?auto_428182 ) ) ( not ( = ?auto_428175 ?auto_428183 ) ) ( not ( = ?auto_428176 ?auto_428177 ) ) ( not ( = ?auto_428176 ?auto_428178 ) ) ( not ( = ?auto_428176 ?auto_428179 ) ) ( not ( = ?auto_428176 ?auto_428180 ) ) ( not ( = ?auto_428176 ?auto_428181 ) ) ( not ( = ?auto_428176 ?auto_428182 ) ) ( not ( = ?auto_428176 ?auto_428183 ) ) ( not ( = ?auto_428177 ?auto_428178 ) ) ( not ( = ?auto_428177 ?auto_428179 ) ) ( not ( = ?auto_428177 ?auto_428180 ) ) ( not ( = ?auto_428177 ?auto_428181 ) ) ( not ( = ?auto_428177 ?auto_428182 ) ) ( not ( = ?auto_428177 ?auto_428183 ) ) ( not ( = ?auto_428178 ?auto_428179 ) ) ( not ( = ?auto_428178 ?auto_428180 ) ) ( not ( = ?auto_428178 ?auto_428181 ) ) ( not ( = ?auto_428178 ?auto_428182 ) ) ( not ( = ?auto_428178 ?auto_428183 ) ) ( not ( = ?auto_428179 ?auto_428180 ) ) ( not ( = ?auto_428179 ?auto_428181 ) ) ( not ( = ?auto_428179 ?auto_428182 ) ) ( not ( = ?auto_428179 ?auto_428183 ) ) ( not ( = ?auto_428180 ?auto_428181 ) ) ( not ( = ?auto_428180 ?auto_428182 ) ) ( not ( = ?auto_428180 ?auto_428183 ) ) ( not ( = ?auto_428181 ?auto_428182 ) ) ( not ( = ?auto_428181 ?auto_428183 ) ) ( not ( = ?auto_428182 ?auto_428183 ) ) ( ON ?auto_428181 ?auto_428182 ) ( ON ?auto_428180 ?auto_428181 ) ( ON ?auto_428179 ?auto_428180 ) ( ON ?auto_428178 ?auto_428179 ) ( ON ?auto_428177 ?auto_428178 ) ( ON ?auto_428176 ?auto_428177 ) ( ON ?auto_428175 ?auto_428176 ) ( ON ?auto_428174 ?auto_428175 ) ( ON ?auto_428173 ?auto_428174 ) ( ON ?auto_428172 ?auto_428173 ) ( CLEAR ?auto_428170 ) ( ON ?auto_428171 ?auto_428172 ) ( CLEAR ?auto_428171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_428168 ?auto_428169 ?auto_428170 ?auto_428171 )
      ( MAKE-15PILE ?auto_428168 ?auto_428169 ?auto_428170 ?auto_428171 ?auto_428172 ?auto_428173 ?auto_428174 ?auto_428175 ?auto_428176 ?auto_428177 ?auto_428178 ?auto_428179 ?auto_428180 ?auto_428181 ?auto_428182 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_428199 - BLOCK
      ?auto_428200 - BLOCK
      ?auto_428201 - BLOCK
      ?auto_428202 - BLOCK
      ?auto_428203 - BLOCK
      ?auto_428204 - BLOCK
      ?auto_428205 - BLOCK
      ?auto_428206 - BLOCK
      ?auto_428207 - BLOCK
      ?auto_428208 - BLOCK
      ?auto_428209 - BLOCK
      ?auto_428210 - BLOCK
      ?auto_428211 - BLOCK
      ?auto_428212 - BLOCK
      ?auto_428213 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_428213 ) ( ON-TABLE ?auto_428199 ) ( ON ?auto_428200 ?auto_428199 ) ( ON ?auto_428201 ?auto_428200 ) ( not ( = ?auto_428199 ?auto_428200 ) ) ( not ( = ?auto_428199 ?auto_428201 ) ) ( not ( = ?auto_428199 ?auto_428202 ) ) ( not ( = ?auto_428199 ?auto_428203 ) ) ( not ( = ?auto_428199 ?auto_428204 ) ) ( not ( = ?auto_428199 ?auto_428205 ) ) ( not ( = ?auto_428199 ?auto_428206 ) ) ( not ( = ?auto_428199 ?auto_428207 ) ) ( not ( = ?auto_428199 ?auto_428208 ) ) ( not ( = ?auto_428199 ?auto_428209 ) ) ( not ( = ?auto_428199 ?auto_428210 ) ) ( not ( = ?auto_428199 ?auto_428211 ) ) ( not ( = ?auto_428199 ?auto_428212 ) ) ( not ( = ?auto_428199 ?auto_428213 ) ) ( not ( = ?auto_428200 ?auto_428201 ) ) ( not ( = ?auto_428200 ?auto_428202 ) ) ( not ( = ?auto_428200 ?auto_428203 ) ) ( not ( = ?auto_428200 ?auto_428204 ) ) ( not ( = ?auto_428200 ?auto_428205 ) ) ( not ( = ?auto_428200 ?auto_428206 ) ) ( not ( = ?auto_428200 ?auto_428207 ) ) ( not ( = ?auto_428200 ?auto_428208 ) ) ( not ( = ?auto_428200 ?auto_428209 ) ) ( not ( = ?auto_428200 ?auto_428210 ) ) ( not ( = ?auto_428200 ?auto_428211 ) ) ( not ( = ?auto_428200 ?auto_428212 ) ) ( not ( = ?auto_428200 ?auto_428213 ) ) ( not ( = ?auto_428201 ?auto_428202 ) ) ( not ( = ?auto_428201 ?auto_428203 ) ) ( not ( = ?auto_428201 ?auto_428204 ) ) ( not ( = ?auto_428201 ?auto_428205 ) ) ( not ( = ?auto_428201 ?auto_428206 ) ) ( not ( = ?auto_428201 ?auto_428207 ) ) ( not ( = ?auto_428201 ?auto_428208 ) ) ( not ( = ?auto_428201 ?auto_428209 ) ) ( not ( = ?auto_428201 ?auto_428210 ) ) ( not ( = ?auto_428201 ?auto_428211 ) ) ( not ( = ?auto_428201 ?auto_428212 ) ) ( not ( = ?auto_428201 ?auto_428213 ) ) ( not ( = ?auto_428202 ?auto_428203 ) ) ( not ( = ?auto_428202 ?auto_428204 ) ) ( not ( = ?auto_428202 ?auto_428205 ) ) ( not ( = ?auto_428202 ?auto_428206 ) ) ( not ( = ?auto_428202 ?auto_428207 ) ) ( not ( = ?auto_428202 ?auto_428208 ) ) ( not ( = ?auto_428202 ?auto_428209 ) ) ( not ( = ?auto_428202 ?auto_428210 ) ) ( not ( = ?auto_428202 ?auto_428211 ) ) ( not ( = ?auto_428202 ?auto_428212 ) ) ( not ( = ?auto_428202 ?auto_428213 ) ) ( not ( = ?auto_428203 ?auto_428204 ) ) ( not ( = ?auto_428203 ?auto_428205 ) ) ( not ( = ?auto_428203 ?auto_428206 ) ) ( not ( = ?auto_428203 ?auto_428207 ) ) ( not ( = ?auto_428203 ?auto_428208 ) ) ( not ( = ?auto_428203 ?auto_428209 ) ) ( not ( = ?auto_428203 ?auto_428210 ) ) ( not ( = ?auto_428203 ?auto_428211 ) ) ( not ( = ?auto_428203 ?auto_428212 ) ) ( not ( = ?auto_428203 ?auto_428213 ) ) ( not ( = ?auto_428204 ?auto_428205 ) ) ( not ( = ?auto_428204 ?auto_428206 ) ) ( not ( = ?auto_428204 ?auto_428207 ) ) ( not ( = ?auto_428204 ?auto_428208 ) ) ( not ( = ?auto_428204 ?auto_428209 ) ) ( not ( = ?auto_428204 ?auto_428210 ) ) ( not ( = ?auto_428204 ?auto_428211 ) ) ( not ( = ?auto_428204 ?auto_428212 ) ) ( not ( = ?auto_428204 ?auto_428213 ) ) ( not ( = ?auto_428205 ?auto_428206 ) ) ( not ( = ?auto_428205 ?auto_428207 ) ) ( not ( = ?auto_428205 ?auto_428208 ) ) ( not ( = ?auto_428205 ?auto_428209 ) ) ( not ( = ?auto_428205 ?auto_428210 ) ) ( not ( = ?auto_428205 ?auto_428211 ) ) ( not ( = ?auto_428205 ?auto_428212 ) ) ( not ( = ?auto_428205 ?auto_428213 ) ) ( not ( = ?auto_428206 ?auto_428207 ) ) ( not ( = ?auto_428206 ?auto_428208 ) ) ( not ( = ?auto_428206 ?auto_428209 ) ) ( not ( = ?auto_428206 ?auto_428210 ) ) ( not ( = ?auto_428206 ?auto_428211 ) ) ( not ( = ?auto_428206 ?auto_428212 ) ) ( not ( = ?auto_428206 ?auto_428213 ) ) ( not ( = ?auto_428207 ?auto_428208 ) ) ( not ( = ?auto_428207 ?auto_428209 ) ) ( not ( = ?auto_428207 ?auto_428210 ) ) ( not ( = ?auto_428207 ?auto_428211 ) ) ( not ( = ?auto_428207 ?auto_428212 ) ) ( not ( = ?auto_428207 ?auto_428213 ) ) ( not ( = ?auto_428208 ?auto_428209 ) ) ( not ( = ?auto_428208 ?auto_428210 ) ) ( not ( = ?auto_428208 ?auto_428211 ) ) ( not ( = ?auto_428208 ?auto_428212 ) ) ( not ( = ?auto_428208 ?auto_428213 ) ) ( not ( = ?auto_428209 ?auto_428210 ) ) ( not ( = ?auto_428209 ?auto_428211 ) ) ( not ( = ?auto_428209 ?auto_428212 ) ) ( not ( = ?auto_428209 ?auto_428213 ) ) ( not ( = ?auto_428210 ?auto_428211 ) ) ( not ( = ?auto_428210 ?auto_428212 ) ) ( not ( = ?auto_428210 ?auto_428213 ) ) ( not ( = ?auto_428211 ?auto_428212 ) ) ( not ( = ?auto_428211 ?auto_428213 ) ) ( not ( = ?auto_428212 ?auto_428213 ) ) ( ON ?auto_428212 ?auto_428213 ) ( ON ?auto_428211 ?auto_428212 ) ( ON ?auto_428210 ?auto_428211 ) ( ON ?auto_428209 ?auto_428210 ) ( ON ?auto_428208 ?auto_428209 ) ( ON ?auto_428207 ?auto_428208 ) ( ON ?auto_428206 ?auto_428207 ) ( ON ?auto_428205 ?auto_428206 ) ( ON ?auto_428204 ?auto_428205 ) ( ON ?auto_428203 ?auto_428204 ) ( CLEAR ?auto_428201 ) ( ON ?auto_428202 ?auto_428203 ) ( CLEAR ?auto_428202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_428199 ?auto_428200 ?auto_428201 ?auto_428202 )
      ( MAKE-15PILE ?auto_428199 ?auto_428200 ?auto_428201 ?auto_428202 ?auto_428203 ?auto_428204 ?auto_428205 ?auto_428206 ?auto_428207 ?auto_428208 ?auto_428209 ?auto_428210 ?auto_428211 ?auto_428212 ?auto_428213 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_428229 - BLOCK
      ?auto_428230 - BLOCK
      ?auto_428231 - BLOCK
      ?auto_428232 - BLOCK
      ?auto_428233 - BLOCK
      ?auto_428234 - BLOCK
      ?auto_428235 - BLOCK
      ?auto_428236 - BLOCK
      ?auto_428237 - BLOCK
      ?auto_428238 - BLOCK
      ?auto_428239 - BLOCK
      ?auto_428240 - BLOCK
      ?auto_428241 - BLOCK
      ?auto_428242 - BLOCK
      ?auto_428243 - BLOCK
    )
    :vars
    (
      ?auto_428244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428243 ?auto_428244 ) ( ON-TABLE ?auto_428229 ) ( ON ?auto_428230 ?auto_428229 ) ( not ( = ?auto_428229 ?auto_428230 ) ) ( not ( = ?auto_428229 ?auto_428231 ) ) ( not ( = ?auto_428229 ?auto_428232 ) ) ( not ( = ?auto_428229 ?auto_428233 ) ) ( not ( = ?auto_428229 ?auto_428234 ) ) ( not ( = ?auto_428229 ?auto_428235 ) ) ( not ( = ?auto_428229 ?auto_428236 ) ) ( not ( = ?auto_428229 ?auto_428237 ) ) ( not ( = ?auto_428229 ?auto_428238 ) ) ( not ( = ?auto_428229 ?auto_428239 ) ) ( not ( = ?auto_428229 ?auto_428240 ) ) ( not ( = ?auto_428229 ?auto_428241 ) ) ( not ( = ?auto_428229 ?auto_428242 ) ) ( not ( = ?auto_428229 ?auto_428243 ) ) ( not ( = ?auto_428229 ?auto_428244 ) ) ( not ( = ?auto_428230 ?auto_428231 ) ) ( not ( = ?auto_428230 ?auto_428232 ) ) ( not ( = ?auto_428230 ?auto_428233 ) ) ( not ( = ?auto_428230 ?auto_428234 ) ) ( not ( = ?auto_428230 ?auto_428235 ) ) ( not ( = ?auto_428230 ?auto_428236 ) ) ( not ( = ?auto_428230 ?auto_428237 ) ) ( not ( = ?auto_428230 ?auto_428238 ) ) ( not ( = ?auto_428230 ?auto_428239 ) ) ( not ( = ?auto_428230 ?auto_428240 ) ) ( not ( = ?auto_428230 ?auto_428241 ) ) ( not ( = ?auto_428230 ?auto_428242 ) ) ( not ( = ?auto_428230 ?auto_428243 ) ) ( not ( = ?auto_428230 ?auto_428244 ) ) ( not ( = ?auto_428231 ?auto_428232 ) ) ( not ( = ?auto_428231 ?auto_428233 ) ) ( not ( = ?auto_428231 ?auto_428234 ) ) ( not ( = ?auto_428231 ?auto_428235 ) ) ( not ( = ?auto_428231 ?auto_428236 ) ) ( not ( = ?auto_428231 ?auto_428237 ) ) ( not ( = ?auto_428231 ?auto_428238 ) ) ( not ( = ?auto_428231 ?auto_428239 ) ) ( not ( = ?auto_428231 ?auto_428240 ) ) ( not ( = ?auto_428231 ?auto_428241 ) ) ( not ( = ?auto_428231 ?auto_428242 ) ) ( not ( = ?auto_428231 ?auto_428243 ) ) ( not ( = ?auto_428231 ?auto_428244 ) ) ( not ( = ?auto_428232 ?auto_428233 ) ) ( not ( = ?auto_428232 ?auto_428234 ) ) ( not ( = ?auto_428232 ?auto_428235 ) ) ( not ( = ?auto_428232 ?auto_428236 ) ) ( not ( = ?auto_428232 ?auto_428237 ) ) ( not ( = ?auto_428232 ?auto_428238 ) ) ( not ( = ?auto_428232 ?auto_428239 ) ) ( not ( = ?auto_428232 ?auto_428240 ) ) ( not ( = ?auto_428232 ?auto_428241 ) ) ( not ( = ?auto_428232 ?auto_428242 ) ) ( not ( = ?auto_428232 ?auto_428243 ) ) ( not ( = ?auto_428232 ?auto_428244 ) ) ( not ( = ?auto_428233 ?auto_428234 ) ) ( not ( = ?auto_428233 ?auto_428235 ) ) ( not ( = ?auto_428233 ?auto_428236 ) ) ( not ( = ?auto_428233 ?auto_428237 ) ) ( not ( = ?auto_428233 ?auto_428238 ) ) ( not ( = ?auto_428233 ?auto_428239 ) ) ( not ( = ?auto_428233 ?auto_428240 ) ) ( not ( = ?auto_428233 ?auto_428241 ) ) ( not ( = ?auto_428233 ?auto_428242 ) ) ( not ( = ?auto_428233 ?auto_428243 ) ) ( not ( = ?auto_428233 ?auto_428244 ) ) ( not ( = ?auto_428234 ?auto_428235 ) ) ( not ( = ?auto_428234 ?auto_428236 ) ) ( not ( = ?auto_428234 ?auto_428237 ) ) ( not ( = ?auto_428234 ?auto_428238 ) ) ( not ( = ?auto_428234 ?auto_428239 ) ) ( not ( = ?auto_428234 ?auto_428240 ) ) ( not ( = ?auto_428234 ?auto_428241 ) ) ( not ( = ?auto_428234 ?auto_428242 ) ) ( not ( = ?auto_428234 ?auto_428243 ) ) ( not ( = ?auto_428234 ?auto_428244 ) ) ( not ( = ?auto_428235 ?auto_428236 ) ) ( not ( = ?auto_428235 ?auto_428237 ) ) ( not ( = ?auto_428235 ?auto_428238 ) ) ( not ( = ?auto_428235 ?auto_428239 ) ) ( not ( = ?auto_428235 ?auto_428240 ) ) ( not ( = ?auto_428235 ?auto_428241 ) ) ( not ( = ?auto_428235 ?auto_428242 ) ) ( not ( = ?auto_428235 ?auto_428243 ) ) ( not ( = ?auto_428235 ?auto_428244 ) ) ( not ( = ?auto_428236 ?auto_428237 ) ) ( not ( = ?auto_428236 ?auto_428238 ) ) ( not ( = ?auto_428236 ?auto_428239 ) ) ( not ( = ?auto_428236 ?auto_428240 ) ) ( not ( = ?auto_428236 ?auto_428241 ) ) ( not ( = ?auto_428236 ?auto_428242 ) ) ( not ( = ?auto_428236 ?auto_428243 ) ) ( not ( = ?auto_428236 ?auto_428244 ) ) ( not ( = ?auto_428237 ?auto_428238 ) ) ( not ( = ?auto_428237 ?auto_428239 ) ) ( not ( = ?auto_428237 ?auto_428240 ) ) ( not ( = ?auto_428237 ?auto_428241 ) ) ( not ( = ?auto_428237 ?auto_428242 ) ) ( not ( = ?auto_428237 ?auto_428243 ) ) ( not ( = ?auto_428237 ?auto_428244 ) ) ( not ( = ?auto_428238 ?auto_428239 ) ) ( not ( = ?auto_428238 ?auto_428240 ) ) ( not ( = ?auto_428238 ?auto_428241 ) ) ( not ( = ?auto_428238 ?auto_428242 ) ) ( not ( = ?auto_428238 ?auto_428243 ) ) ( not ( = ?auto_428238 ?auto_428244 ) ) ( not ( = ?auto_428239 ?auto_428240 ) ) ( not ( = ?auto_428239 ?auto_428241 ) ) ( not ( = ?auto_428239 ?auto_428242 ) ) ( not ( = ?auto_428239 ?auto_428243 ) ) ( not ( = ?auto_428239 ?auto_428244 ) ) ( not ( = ?auto_428240 ?auto_428241 ) ) ( not ( = ?auto_428240 ?auto_428242 ) ) ( not ( = ?auto_428240 ?auto_428243 ) ) ( not ( = ?auto_428240 ?auto_428244 ) ) ( not ( = ?auto_428241 ?auto_428242 ) ) ( not ( = ?auto_428241 ?auto_428243 ) ) ( not ( = ?auto_428241 ?auto_428244 ) ) ( not ( = ?auto_428242 ?auto_428243 ) ) ( not ( = ?auto_428242 ?auto_428244 ) ) ( not ( = ?auto_428243 ?auto_428244 ) ) ( ON ?auto_428242 ?auto_428243 ) ( ON ?auto_428241 ?auto_428242 ) ( ON ?auto_428240 ?auto_428241 ) ( ON ?auto_428239 ?auto_428240 ) ( ON ?auto_428238 ?auto_428239 ) ( ON ?auto_428237 ?auto_428238 ) ( ON ?auto_428236 ?auto_428237 ) ( ON ?auto_428235 ?auto_428236 ) ( ON ?auto_428234 ?auto_428235 ) ( ON ?auto_428233 ?auto_428234 ) ( ON ?auto_428232 ?auto_428233 ) ( CLEAR ?auto_428230 ) ( ON ?auto_428231 ?auto_428232 ) ( CLEAR ?auto_428231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_428229 ?auto_428230 ?auto_428231 )
      ( MAKE-15PILE ?auto_428229 ?auto_428230 ?auto_428231 ?auto_428232 ?auto_428233 ?auto_428234 ?auto_428235 ?auto_428236 ?auto_428237 ?auto_428238 ?auto_428239 ?auto_428240 ?auto_428241 ?auto_428242 ?auto_428243 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_428260 - BLOCK
      ?auto_428261 - BLOCK
      ?auto_428262 - BLOCK
      ?auto_428263 - BLOCK
      ?auto_428264 - BLOCK
      ?auto_428265 - BLOCK
      ?auto_428266 - BLOCK
      ?auto_428267 - BLOCK
      ?auto_428268 - BLOCK
      ?auto_428269 - BLOCK
      ?auto_428270 - BLOCK
      ?auto_428271 - BLOCK
      ?auto_428272 - BLOCK
      ?auto_428273 - BLOCK
      ?auto_428274 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_428274 ) ( ON-TABLE ?auto_428260 ) ( ON ?auto_428261 ?auto_428260 ) ( not ( = ?auto_428260 ?auto_428261 ) ) ( not ( = ?auto_428260 ?auto_428262 ) ) ( not ( = ?auto_428260 ?auto_428263 ) ) ( not ( = ?auto_428260 ?auto_428264 ) ) ( not ( = ?auto_428260 ?auto_428265 ) ) ( not ( = ?auto_428260 ?auto_428266 ) ) ( not ( = ?auto_428260 ?auto_428267 ) ) ( not ( = ?auto_428260 ?auto_428268 ) ) ( not ( = ?auto_428260 ?auto_428269 ) ) ( not ( = ?auto_428260 ?auto_428270 ) ) ( not ( = ?auto_428260 ?auto_428271 ) ) ( not ( = ?auto_428260 ?auto_428272 ) ) ( not ( = ?auto_428260 ?auto_428273 ) ) ( not ( = ?auto_428260 ?auto_428274 ) ) ( not ( = ?auto_428261 ?auto_428262 ) ) ( not ( = ?auto_428261 ?auto_428263 ) ) ( not ( = ?auto_428261 ?auto_428264 ) ) ( not ( = ?auto_428261 ?auto_428265 ) ) ( not ( = ?auto_428261 ?auto_428266 ) ) ( not ( = ?auto_428261 ?auto_428267 ) ) ( not ( = ?auto_428261 ?auto_428268 ) ) ( not ( = ?auto_428261 ?auto_428269 ) ) ( not ( = ?auto_428261 ?auto_428270 ) ) ( not ( = ?auto_428261 ?auto_428271 ) ) ( not ( = ?auto_428261 ?auto_428272 ) ) ( not ( = ?auto_428261 ?auto_428273 ) ) ( not ( = ?auto_428261 ?auto_428274 ) ) ( not ( = ?auto_428262 ?auto_428263 ) ) ( not ( = ?auto_428262 ?auto_428264 ) ) ( not ( = ?auto_428262 ?auto_428265 ) ) ( not ( = ?auto_428262 ?auto_428266 ) ) ( not ( = ?auto_428262 ?auto_428267 ) ) ( not ( = ?auto_428262 ?auto_428268 ) ) ( not ( = ?auto_428262 ?auto_428269 ) ) ( not ( = ?auto_428262 ?auto_428270 ) ) ( not ( = ?auto_428262 ?auto_428271 ) ) ( not ( = ?auto_428262 ?auto_428272 ) ) ( not ( = ?auto_428262 ?auto_428273 ) ) ( not ( = ?auto_428262 ?auto_428274 ) ) ( not ( = ?auto_428263 ?auto_428264 ) ) ( not ( = ?auto_428263 ?auto_428265 ) ) ( not ( = ?auto_428263 ?auto_428266 ) ) ( not ( = ?auto_428263 ?auto_428267 ) ) ( not ( = ?auto_428263 ?auto_428268 ) ) ( not ( = ?auto_428263 ?auto_428269 ) ) ( not ( = ?auto_428263 ?auto_428270 ) ) ( not ( = ?auto_428263 ?auto_428271 ) ) ( not ( = ?auto_428263 ?auto_428272 ) ) ( not ( = ?auto_428263 ?auto_428273 ) ) ( not ( = ?auto_428263 ?auto_428274 ) ) ( not ( = ?auto_428264 ?auto_428265 ) ) ( not ( = ?auto_428264 ?auto_428266 ) ) ( not ( = ?auto_428264 ?auto_428267 ) ) ( not ( = ?auto_428264 ?auto_428268 ) ) ( not ( = ?auto_428264 ?auto_428269 ) ) ( not ( = ?auto_428264 ?auto_428270 ) ) ( not ( = ?auto_428264 ?auto_428271 ) ) ( not ( = ?auto_428264 ?auto_428272 ) ) ( not ( = ?auto_428264 ?auto_428273 ) ) ( not ( = ?auto_428264 ?auto_428274 ) ) ( not ( = ?auto_428265 ?auto_428266 ) ) ( not ( = ?auto_428265 ?auto_428267 ) ) ( not ( = ?auto_428265 ?auto_428268 ) ) ( not ( = ?auto_428265 ?auto_428269 ) ) ( not ( = ?auto_428265 ?auto_428270 ) ) ( not ( = ?auto_428265 ?auto_428271 ) ) ( not ( = ?auto_428265 ?auto_428272 ) ) ( not ( = ?auto_428265 ?auto_428273 ) ) ( not ( = ?auto_428265 ?auto_428274 ) ) ( not ( = ?auto_428266 ?auto_428267 ) ) ( not ( = ?auto_428266 ?auto_428268 ) ) ( not ( = ?auto_428266 ?auto_428269 ) ) ( not ( = ?auto_428266 ?auto_428270 ) ) ( not ( = ?auto_428266 ?auto_428271 ) ) ( not ( = ?auto_428266 ?auto_428272 ) ) ( not ( = ?auto_428266 ?auto_428273 ) ) ( not ( = ?auto_428266 ?auto_428274 ) ) ( not ( = ?auto_428267 ?auto_428268 ) ) ( not ( = ?auto_428267 ?auto_428269 ) ) ( not ( = ?auto_428267 ?auto_428270 ) ) ( not ( = ?auto_428267 ?auto_428271 ) ) ( not ( = ?auto_428267 ?auto_428272 ) ) ( not ( = ?auto_428267 ?auto_428273 ) ) ( not ( = ?auto_428267 ?auto_428274 ) ) ( not ( = ?auto_428268 ?auto_428269 ) ) ( not ( = ?auto_428268 ?auto_428270 ) ) ( not ( = ?auto_428268 ?auto_428271 ) ) ( not ( = ?auto_428268 ?auto_428272 ) ) ( not ( = ?auto_428268 ?auto_428273 ) ) ( not ( = ?auto_428268 ?auto_428274 ) ) ( not ( = ?auto_428269 ?auto_428270 ) ) ( not ( = ?auto_428269 ?auto_428271 ) ) ( not ( = ?auto_428269 ?auto_428272 ) ) ( not ( = ?auto_428269 ?auto_428273 ) ) ( not ( = ?auto_428269 ?auto_428274 ) ) ( not ( = ?auto_428270 ?auto_428271 ) ) ( not ( = ?auto_428270 ?auto_428272 ) ) ( not ( = ?auto_428270 ?auto_428273 ) ) ( not ( = ?auto_428270 ?auto_428274 ) ) ( not ( = ?auto_428271 ?auto_428272 ) ) ( not ( = ?auto_428271 ?auto_428273 ) ) ( not ( = ?auto_428271 ?auto_428274 ) ) ( not ( = ?auto_428272 ?auto_428273 ) ) ( not ( = ?auto_428272 ?auto_428274 ) ) ( not ( = ?auto_428273 ?auto_428274 ) ) ( ON ?auto_428273 ?auto_428274 ) ( ON ?auto_428272 ?auto_428273 ) ( ON ?auto_428271 ?auto_428272 ) ( ON ?auto_428270 ?auto_428271 ) ( ON ?auto_428269 ?auto_428270 ) ( ON ?auto_428268 ?auto_428269 ) ( ON ?auto_428267 ?auto_428268 ) ( ON ?auto_428266 ?auto_428267 ) ( ON ?auto_428265 ?auto_428266 ) ( ON ?auto_428264 ?auto_428265 ) ( ON ?auto_428263 ?auto_428264 ) ( CLEAR ?auto_428261 ) ( ON ?auto_428262 ?auto_428263 ) ( CLEAR ?auto_428262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_428260 ?auto_428261 ?auto_428262 )
      ( MAKE-15PILE ?auto_428260 ?auto_428261 ?auto_428262 ?auto_428263 ?auto_428264 ?auto_428265 ?auto_428266 ?auto_428267 ?auto_428268 ?auto_428269 ?auto_428270 ?auto_428271 ?auto_428272 ?auto_428273 ?auto_428274 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_428290 - BLOCK
      ?auto_428291 - BLOCK
      ?auto_428292 - BLOCK
      ?auto_428293 - BLOCK
      ?auto_428294 - BLOCK
      ?auto_428295 - BLOCK
      ?auto_428296 - BLOCK
      ?auto_428297 - BLOCK
      ?auto_428298 - BLOCK
      ?auto_428299 - BLOCK
      ?auto_428300 - BLOCK
      ?auto_428301 - BLOCK
      ?auto_428302 - BLOCK
      ?auto_428303 - BLOCK
      ?auto_428304 - BLOCK
    )
    :vars
    (
      ?auto_428305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428304 ?auto_428305 ) ( ON-TABLE ?auto_428290 ) ( not ( = ?auto_428290 ?auto_428291 ) ) ( not ( = ?auto_428290 ?auto_428292 ) ) ( not ( = ?auto_428290 ?auto_428293 ) ) ( not ( = ?auto_428290 ?auto_428294 ) ) ( not ( = ?auto_428290 ?auto_428295 ) ) ( not ( = ?auto_428290 ?auto_428296 ) ) ( not ( = ?auto_428290 ?auto_428297 ) ) ( not ( = ?auto_428290 ?auto_428298 ) ) ( not ( = ?auto_428290 ?auto_428299 ) ) ( not ( = ?auto_428290 ?auto_428300 ) ) ( not ( = ?auto_428290 ?auto_428301 ) ) ( not ( = ?auto_428290 ?auto_428302 ) ) ( not ( = ?auto_428290 ?auto_428303 ) ) ( not ( = ?auto_428290 ?auto_428304 ) ) ( not ( = ?auto_428290 ?auto_428305 ) ) ( not ( = ?auto_428291 ?auto_428292 ) ) ( not ( = ?auto_428291 ?auto_428293 ) ) ( not ( = ?auto_428291 ?auto_428294 ) ) ( not ( = ?auto_428291 ?auto_428295 ) ) ( not ( = ?auto_428291 ?auto_428296 ) ) ( not ( = ?auto_428291 ?auto_428297 ) ) ( not ( = ?auto_428291 ?auto_428298 ) ) ( not ( = ?auto_428291 ?auto_428299 ) ) ( not ( = ?auto_428291 ?auto_428300 ) ) ( not ( = ?auto_428291 ?auto_428301 ) ) ( not ( = ?auto_428291 ?auto_428302 ) ) ( not ( = ?auto_428291 ?auto_428303 ) ) ( not ( = ?auto_428291 ?auto_428304 ) ) ( not ( = ?auto_428291 ?auto_428305 ) ) ( not ( = ?auto_428292 ?auto_428293 ) ) ( not ( = ?auto_428292 ?auto_428294 ) ) ( not ( = ?auto_428292 ?auto_428295 ) ) ( not ( = ?auto_428292 ?auto_428296 ) ) ( not ( = ?auto_428292 ?auto_428297 ) ) ( not ( = ?auto_428292 ?auto_428298 ) ) ( not ( = ?auto_428292 ?auto_428299 ) ) ( not ( = ?auto_428292 ?auto_428300 ) ) ( not ( = ?auto_428292 ?auto_428301 ) ) ( not ( = ?auto_428292 ?auto_428302 ) ) ( not ( = ?auto_428292 ?auto_428303 ) ) ( not ( = ?auto_428292 ?auto_428304 ) ) ( not ( = ?auto_428292 ?auto_428305 ) ) ( not ( = ?auto_428293 ?auto_428294 ) ) ( not ( = ?auto_428293 ?auto_428295 ) ) ( not ( = ?auto_428293 ?auto_428296 ) ) ( not ( = ?auto_428293 ?auto_428297 ) ) ( not ( = ?auto_428293 ?auto_428298 ) ) ( not ( = ?auto_428293 ?auto_428299 ) ) ( not ( = ?auto_428293 ?auto_428300 ) ) ( not ( = ?auto_428293 ?auto_428301 ) ) ( not ( = ?auto_428293 ?auto_428302 ) ) ( not ( = ?auto_428293 ?auto_428303 ) ) ( not ( = ?auto_428293 ?auto_428304 ) ) ( not ( = ?auto_428293 ?auto_428305 ) ) ( not ( = ?auto_428294 ?auto_428295 ) ) ( not ( = ?auto_428294 ?auto_428296 ) ) ( not ( = ?auto_428294 ?auto_428297 ) ) ( not ( = ?auto_428294 ?auto_428298 ) ) ( not ( = ?auto_428294 ?auto_428299 ) ) ( not ( = ?auto_428294 ?auto_428300 ) ) ( not ( = ?auto_428294 ?auto_428301 ) ) ( not ( = ?auto_428294 ?auto_428302 ) ) ( not ( = ?auto_428294 ?auto_428303 ) ) ( not ( = ?auto_428294 ?auto_428304 ) ) ( not ( = ?auto_428294 ?auto_428305 ) ) ( not ( = ?auto_428295 ?auto_428296 ) ) ( not ( = ?auto_428295 ?auto_428297 ) ) ( not ( = ?auto_428295 ?auto_428298 ) ) ( not ( = ?auto_428295 ?auto_428299 ) ) ( not ( = ?auto_428295 ?auto_428300 ) ) ( not ( = ?auto_428295 ?auto_428301 ) ) ( not ( = ?auto_428295 ?auto_428302 ) ) ( not ( = ?auto_428295 ?auto_428303 ) ) ( not ( = ?auto_428295 ?auto_428304 ) ) ( not ( = ?auto_428295 ?auto_428305 ) ) ( not ( = ?auto_428296 ?auto_428297 ) ) ( not ( = ?auto_428296 ?auto_428298 ) ) ( not ( = ?auto_428296 ?auto_428299 ) ) ( not ( = ?auto_428296 ?auto_428300 ) ) ( not ( = ?auto_428296 ?auto_428301 ) ) ( not ( = ?auto_428296 ?auto_428302 ) ) ( not ( = ?auto_428296 ?auto_428303 ) ) ( not ( = ?auto_428296 ?auto_428304 ) ) ( not ( = ?auto_428296 ?auto_428305 ) ) ( not ( = ?auto_428297 ?auto_428298 ) ) ( not ( = ?auto_428297 ?auto_428299 ) ) ( not ( = ?auto_428297 ?auto_428300 ) ) ( not ( = ?auto_428297 ?auto_428301 ) ) ( not ( = ?auto_428297 ?auto_428302 ) ) ( not ( = ?auto_428297 ?auto_428303 ) ) ( not ( = ?auto_428297 ?auto_428304 ) ) ( not ( = ?auto_428297 ?auto_428305 ) ) ( not ( = ?auto_428298 ?auto_428299 ) ) ( not ( = ?auto_428298 ?auto_428300 ) ) ( not ( = ?auto_428298 ?auto_428301 ) ) ( not ( = ?auto_428298 ?auto_428302 ) ) ( not ( = ?auto_428298 ?auto_428303 ) ) ( not ( = ?auto_428298 ?auto_428304 ) ) ( not ( = ?auto_428298 ?auto_428305 ) ) ( not ( = ?auto_428299 ?auto_428300 ) ) ( not ( = ?auto_428299 ?auto_428301 ) ) ( not ( = ?auto_428299 ?auto_428302 ) ) ( not ( = ?auto_428299 ?auto_428303 ) ) ( not ( = ?auto_428299 ?auto_428304 ) ) ( not ( = ?auto_428299 ?auto_428305 ) ) ( not ( = ?auto_428300 ?auto_428301 ) ) ( not ( = ?auto_428300 ?auto_428302 ) ) ( not ( = ?auto_428300 ?auto_428303 ) ) ( not ( = ?auto_428300 ?auto_428304 ) ) ( not ( = ?auto_428300 ?auto_428305 ) ) ( not ( = ?auto_428301 ?auto_428302 ) ) ( not ( = ?auto_428301 ?auto_428303 ) ) ( not ( = ?auto_428301 ?auto_428304 ) ) ( not ( = ?auto_428301 ?auto_428305 ) ) ( not ( = ?auto_428302 ?auto_428303 ) ) ( not ( = ?auto_428302 ?auto_428304 ) ) ( not ( = ?auto_428302 ?auto_428305 ) ) ( not ( = ?auto_428303 ?auto_428304 ) ) ( not ( = ?auto_428303 ?auto_428305 ) ) ( not ( = ?auto_428304 ?auto_428305 ) ) ( ON ?auto_428303 ?auto_428304 ) ( ON ?auto_428302 ?auto_428303 ) ( ON ?auto_428301 ?auto_428302 ) ( ON ?auto_428300 ?auto_428301 ) ( ON ?auto_428299 ?auto_428300 ) ( ON ?auto_428298 ?auto_428299 ) ( ON ?auto_428297 ?auto_428298 ) ( ON ?auto_428296 ?auto_428297 ) ( ON ?auto_428295 ?auto_428296 ) ( ON ?auto_428294 ?auto_428295 ) ( ON ?auto_428293 ?auto_428294 ) ( ON ?auto_428292 ?auto_428293 ) ( CLEAR ?auto_428290 ) ( ON ?auto_428291 ?auto_428292 ) ( CLEAR ?auto_428291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_428290 ?auto_428291 )
      ( MAKE-15PILE ?auto_428290 ?auto_428291 ?auto_428292 ?auto_428293 ?auto_428294 ?auto_428295 ?auto_428296 ?auto_428297 ?auto_428298 ?auto_428299 ?auto_428300 ?auto_428301 ?auto_428302 ?auto_428303 ?auto_428304 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_428321 - BLOCK
      ?auto_428322 - BLOCK
      ?auto_428323 - BLOCK
      ?auto_428324 - BLOCK
      ?auto_428325 - BLOCK
      ?auto_428326 - BLOCK
      ?auto_428327 - BLOCK
      ?auto_428328 - BLOCK
      ?auto_428329 - BLOCK
      ?auto_428330 - BLOCK
      ?auto_428331 - BLOCK
      ?auto_428332 - BLOCK
      ?auto_428333 - BLOCK
      ?auto_428334 - BLOCK
      ?auto_428335 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_428335 ) ( ON-TABLE ?auto_428321 ) ( not ( = ?auto_428321 ?auto_428322 ) ) ( not ( = ?auto_428321 ?auto_428323 ) ) ( not ( = ?auto_428321 ?auto_428324 ) ) ( not ( = ?auto_428321 ?auto_428325 ) ) ( not ( = ?auto_428321 ?auto_428326 ) ) ( not ( = ?auto_428321 ?auto_428327 ) ) ( not ( = ?auto_428321 ?auto_428328 ) ) ( not ( = ?auto_428321 ?auto_428329 ) ) ( not ( = ?auto_428321 ?auto_428330 ) ) ( not ( = ?auto_428321 ?auto_428331 ) ) ( not ( = ?auto_428321 ?auto_428332 ) ) ( not ( = ?auto_428321 ?auto_428333 ) ) ( not ( = ?auto_428321 ?auto_428334 ) ) ( not ( = ?auto_428321 ?auto_428335 ) ) ( not ( = ?auto_428322 ?auto_428323 ) ) ( not ( = ?auto_428322 ?auto_428324 ) ) ( not ( = ?auto_428322 ?auto_428325 ) ) ( not ( = ?auto_428322 ?auto_428326 ) ) ( not ( = ?auto_428322 ?auto_428327 ) ) ( not ( = ?auto_428322 ?auto_428328 ) ) ( not ( = ?auto_428322 ?auto_428329 ) ) ( not ( = ?auto_428322 ?auto_428330 ) ) ( not ( = ?auto_428322 ?auto_428331 ) ) ( not ( = ?auto_428322 ?auto_428332 ) ) ( not ( = ?auto_428322 ?auto_428333 ) ) ( not ( = ?auto_428322 ?auto_428334 ) ) ( not ( = ?auto_428322 ?auto_428335 ) ) ( not ( = ?auto_428323 ?auto_428324 ) ) ( not ( = ?auto_428323 ?auto_428325 ) ) ( not ( = ?auto_428323 ?auto_428326 ) ) ( not ( = ?auto_428323 ?auto_428327 ) ) ( not ( = ?auto_428323 ?auto_428328 ) ) ( not ( = ?auto_428323 ?auto_428329 ) ) ( not ( = ?auto_428323 ?auto_428330 ) ) ( not ( = ?auto_428323 ?auto_428331 ) ) ( not ( = ?auto_428323 ?auto_428332 ) ) ( not ( = ?auto_428323 ?auto_428333 ) ) ( not ( = ?auto_428323 ?auto_428334 ) ) ( not ( = ?auto_428323 ?auto_428335 ) ) ( not ( = ?auto_428324 ?auto_428325 ) ) ( not ( = ?auto_428324 ?auto_428326 ) ) ( not ( = ?auto_428324 ?auto_428327 ) ) ( not ( = ?auto_428324 ?auto_428328 ) ) ( not ( = ?auto_428324 ?auto_428329 ) ) ( not ( = ?auto_428324 ?auto_428330 ) ) ( not ( = ?auto_428324 ?auto_428331 ) ) ( not ( = ?auto_428324 ?auto_428332 ) ) ( not ( = ?auto_428324 ?auto_428333 ) ) ( not ( = ?auto_428324 ?auto_428334 ) ) ( not ( = ?auto_428324 ?auto_428335 ) ) ( not ( = ?auto_428325 ?auto_428326 ) ) ( not ( = ?auto_428325 ?auto_428327 ) ) ( not ( = ?auto_428325 ?auto_428328 ) ) ( not ( = ?auto_428325 ?auto_428329 ) ) ( not ( = ?auto_428325 ?auto_428330 ) ) ( not ( = ?auto_428325 ?auto_428331 ) ) ( not ( = ?auto_428325 ?auto_428332 ) ) ( not ( = ?auto_428325 ?auto_428333 ) ) ( not ( = ?auto_428325 ?auto_428334 ) ) ( not ( = ?auto_428325 ?auto_428335 ) ) ( not ( = ?auto_428326 ?auto_428327 ) ) ( not ( = ?auto_428326 ?auto_428328 ) ) ( not ( = ?auto_428326 ?auto_428329 ) ) ( not ( = ?auto_428326 ?auto_428330 ) ) ( not ( = ?auto_428326 ?auto_428331 ) ) ( not ( = ?auto_428326 ?auto_428332 ) ) ( not ( = ?auto_428326 ?auto_428333 ) ) ( not ( = ?auto_428326 ?auto_428334 ) ) ( not ( = ?auto_428326 ?auto_428335 ) ) ( not ( = ?auto_428327 ?auto_428328 ) ) ( not ( = ?auto_428327 ?auto_428329 ) ) ( not ( = ?auto_428327 ?auto_428330 ) ) ( not ( = ?auto_428327 ?auto_428331 ) ) ( not ( = ?auto_428327 ?auto_428332 ) ) ( not ( = ?auto_428327 ?auto_428333 ) ) ( not ( = ?auto_428327 ?auto_428334 ) ) ( not ( = ?auto_428327 ?auto_428335 ) ) ( not ( = ?auto_428328 ?auto_428329 ) ) ( not ( = ?auto_428328 ?auto_428330 ) ) ( not ( = ?auto_428328 ?auto_428331 ) ) ( not ( = ?auto_428328 ?auto_428332 ) ) ( not ( = ?auto_428328 ?auto_428333 ) ) ( not ( = ?auto_428328 ?auto_428334 ) ) ( not ( = ?auto_428328 ?auto_428335 ) ) ( not ( = ?auto_428329 ?auto_428330 ) ) ( not ( = ?auto_428329 ?auto_428331 ) ) ( not ( = ?auto_428329 ?auto_428332 ) ) ( not ( = ?auto_428329 ?auto_428333 ) ) ( not ( = ?auto_428329 ?auto_428334 ) ) ( not ( = ?auto_428329 ?auto_428335 ) ) ( not ( = ?auto_428330 ?auto_428331 ) ) ( not ( = ?auto_428330 ?auto_428332 ) ) ( not ( = ?auto_428330 ?auto_428333 ) ) ( not ( = ?auto_428330 ?auto_428334 ) ) ( not ( = ?auto_428330 ?auto_428335 ) ) ( not ( = ?auto_428331 ?auto_428332 ) ) ( not ( = ?auto_428331 ?auto_428333 ) ) ( not ( = ?auto_428331 ?auto_428334 ) ) ( not ( = ?auto_428331 ?auto_428335 ) ) ( not ( = ?auto_428332 ?auto_428333 ) ) ( not ( = ?auto_428332 ?auto_428334 ) ) ( not ( = ?auto_428332 ?auto_428335 ) ) ( not ( = ?auto_428333 ?auto_428334 ) ) ( not ( = ?auto_428333 ?auto_428335 ) ) ( not ( = ?auto_428334 ?auto_428335 ) ) ( ON ?auto_428334 ?auto_428335 ) ( ON ?auto_428333 ?auto_428334 ) ( ON ?auto_428332 ?auto_428333 ) ( ON ?auto_428331 ?auto_428332 ) ( ON ?auto_428330 ?auto_428331 ) ( ON ?auto_428329 ?auto_428330 ) ( ON ?auto_428328 ?auto_428329 ) ( ON ?auto_428327 ?auto_428328 ) ( ON ?auto_428326 ?auto_428327 ) ( ON ?auto_428325 ?auto_428326 ) ( ON ?auto_428324 ?auto_428325 ) ( ON ?auto_428323 ?auto_428324 ) ( CLEAR ?auto_428321 ) ( ON ?auto_428322 ?auto_428323 ) ( CLEAR ?auto_428322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_428321 ?auto_428322 )
      ( MAKE-15PILE ?auto_428321 ?auto_428322 ?auto_428323 ?auto_428324 ?auto_428325 ?auto_428326 ?auto_428327 ?auto_428328 ?auto_428329 ?auto_428330 ?auto_428331 ?auto_428332 ?auto_428333 ?auto_428334 ?auto_428335 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_428351 - BLOCK
      ?auto_428352 - BLOCK
      ?auto_428353 - BLOCK
      ?auto_428354 - BLOCK
      ?auto_428355 - BLOCK
      ?auto_428356 - BLOCK
      ?auto_428357 - BLOCK
      ?auto_428358 - BLOCK
      ?auto_428359 - BLOCK
      ?auto_428360 - BLOCK
      ?auto_428361 - BLOCK
      ?auto_428362 - BLOCK
      ?auto_428363 - BLOCK
      ?auto_428364 - BLOCK
      ?auto_428365 - BLOCK
    )
    :vars
    (
      ?auto_428366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428365 ?auto_428366 ) ( not ( = ?auto_428351 ?auto_428352 ) ) ( not ( = ?auto_428351 ?auto_428353 ) ) ( not ( = ?auto_428351 ?auto_428354 ) ) ( not ( = ?auto_428351 ?auto_428355 ) ) ( not ( = ?auto_428351 ?auto_428356 ) ) ( not ( = ?auto_428351 ?auto_428357 ) ) ( not ( = ?auto_428351 ?auto_428358 ) ) ( not ( = ?auto_428351 ?auto_428359 ) ) ( not ( = ?auto_428351 ?auto_428360 ) ) ( not ( = ?auto_428351 ?auto_428361 ) ) ( not ( = ?auto_428351 ?auto_428362 ) ) ( not ( = ?auto_428351 ?auto_428363 ) ) ( not ( = ?auto_428351 ?auto_428364 ) ) ( not ( = ?auto_428351 ?auto_428365 ) ) ( not ( = ?auto_428351 ?auto_428366 ) ) ( not ( = ?auto_428352 ?auto_428353 ) ) ( not ( = ?auto_428352 ?auto_428354 ) ) ( not ( = ?auto_428352 ?auto_428355 ) ) ( not ( = ?auto_428352 ?auto_428356 ) ) ( not ( = ?auto_428352 ?auto_428357 ) ) ( not ( = ?auto_428352 ?auto_428358 ) ) ( not ( = ?auto_428352 ?auto_428359 ) ) ( not ( = ?auto_428352 ?auto_428360 ) ) ( not ( = ?auto_428352 ?auto_428361 ) ) ( not ( = ?auto_428352 ?auto_428362 ) ) ( not ( = ?auto_428352 ?auto_428363 ) ) ( not ( = ?auto_428352 ?auto_428364 ) ) ( not ( = ?auto_428352 ?auto_428365 ) ) ( not ( = ?auto_428352 ?auto_428366 ) ) ( not ( = ?auto_428353 ?auto_428354 ) ) ( not ( = ?auto_428353 ?auto_428355 ) ) ( not ( = ?auto_428353 ?auto_428356 ) ) ( not ( = ?auto_428353 ?auto_428357 ) ) ( not ( = ?auto_428353 ?auto_428358 ) ) ( not ( = ?auto_428353 ?auto_428359 ) ) ( not ( = ?auto_428353 ?auto_428360 ) ) ( not ( = ?auto_428353 ?auto_428361 ) ) ( not ( = ?auto_428353 ?auto_428362 ) ) ( not ( = ?auto_428353 ?auto_428363 ) ) ( not ( = ?auto_428353 ?auto_428364 ) ) ( not ( = ?auto_428353 ?auto_428365 ) ) ( not ( = ?auto_428353 ?auto_428366 ) ) ( not ( = ?auto_428354 ?auto_428355 ) ) ( not ( = ?auto_428354 ?auto_428356 ) ) ( not ( = ?auto_428354 ?auto_428357 ) ) ( not ( = ?auto_428354 ?auto_428358 ) ) ( not ( = ?auto_428354 ?auto_428359 ) ) ( not ( = ?auto_428354 ?auto_428360 ) ) ( not ( = ?auto_428354 ?auto_428361 ) ) ( not ( = ?auto_428354 ?auto_428362 ) ) ( not ( = ?auto_428354 ?auto_428363 ) ) ( not ( = ?auto_428354 ?auto_428364 ) ) ( not ( = ?auto_428354 ?auto_428365 ) ) ( not ( = ?auto_428354 ?auto_428366 ) ) ( not ( = ?auto_428355 ?auto_428356 ) ) ( not ( = ?auto_428355 ?auto_428357 ) ) ( not ( = ?auto_428355 ?auto_428358 ) ) ( not ( = ?auto_428355 ?auto_428359 ) ) ( not ( = ?auto_428355 ?auto_428360 ) ) ( not ( = ?auto_428355 ?auto_428361 ) ) ( not ( = ?auto_428355 ?auto_428362 ) ) ( not ( = ?auto_428355 ?auto_428363 ) ) ( not ( = ?auto_428355 ?auto_428364 ) ) ( not ( = ?auto_428355 ?auto_428365 ) ) ( not ( = ?auto_428355 ?auto_428366 ) ) ( not ( = ?auto_428356 ?auto_428357 ) ) ( not ( = ?auto_428356 ?auto_428358 ) ) ( not ( = ?auto_428356 ?auto_428359 ) ) ( not ( = ?auto_428356 ?auto_428360 ) ) ( not ( = ?auto_428356 ?auto_428361 ) ) ( not ( = ?auto_428356 ?auto_428362 ) ) ( not ( = ?auto_428356 ?auto_428363 ) ) ( not ( = ?auto_428356 ?auto_428364 ) ) ( not ( = ?auto_428356 ?auto_428365 ) ) ( not ( = ?auto_428356 ?auto_428366 ) ) ( not ( = ?auto_428357 ?auto_428358 ) ) ( not ( = ?auto_428357 ?auto_428359 ) ) ( not ( = ?auto_428357 ?auto_428360 ) ) ( not ( = ?auto_428357 ?auto_428361 ) ) ( not ( = ?auto_428357 ?auto_428362 ) ) ( not ( = ?auto_428357 ?auto_428363 ) ) ( not ( = ?auto_428357 ?auto_428364 ) ) ( not ( = ?auto_428357 ?auto_428365 ) ) ( not ( = ?auto_428357 ?auto_428366 ) ) ( not ( = ?auto_428358 ?auto_428359 ) ) ( not ( = ?auto_428358 ?auto_428360 ) ) ( not ( = ?auto_428358 ?auto_428361 ) ) ( not ( = ?auto_428358 ?auto_428362 ) ) ( not ( = ?auto_428358 ?auto_428363 ) ) ( not ( = ?auto_428358 ?auto_428364 ) ) ( not ( = ?auto_428358 ?auto_428365 ) ) ( not ( = ?auto_428358 ?auto_428366 ) ) ( not ( = ?auto_428359 ?auto_428360 ) ) ( not ( = ?auto_428359 ?auto_428361 ) ) ( not ( = ?auto_428359 ?auto_428362 ) ) ( not ( = ?auto_428359 ?auto_428363 ) ) ( not ( = ?auto_428359 ?auto_428364 ) ) ( not ( = ?auto_428359 ?auto_428365 ) ) ( not ( = ?auto_428359 ?auto_428366 ) ) ( not ( = ?auto_428360 ?auto_428361 ) ) ( not ( = ?auto_428360 ?auto_428362 ) ) ( not ( = ?auto_428360 ?auto_428363 ) ) ( not ( = ?auto_428360 ?auto_428364 ) ) ( not ( = ?auto_428360 ?auto_428365 ) ) ( not ( = ?auto_428360 ?auto_428366 ) ) ( not ( = ?auto_428361 ?auto_428362 ) ) ( not ( = ?auto_428361 ?auto_428363 ) ) ( not ( = ?auto_428361 ?auto_428364 ) ) ( not ( = ?auto_428361 ?auto_428365 ) ) ( not ( = ?auto_428361 ?auto_428366 ) ) ( not ( = ?auto_428362 ?auto_428363 ) ) ( not ( = ?auto_428362 ?auto_428364 ) ) ( not ( = ?auto_428362 ?auto_428365 ) ) ( not ( = ?auto_428362 ?auto_428366 ) ) ( not ( = ?auto_428363 ?auto_428364 ) ) ( not ( = ?auto_428363 ?auto_428365 ) ) ( not ( = ?auto_428363 ?auto_428366 ) ) ( not ( = ?auto_428364 ?auto_428365 ) ) ( not ( = ?auto_428364 ?auto_428366 ) ) ( not ( = ?auto_428365 ?auto_428366 ) ) ( ON ?auto_428364 ?auto_428365 ) ( ON ?auto_428363 ?auto_428364 ) ( ON ?auto_428362 ?auto_428363 ) ( ON ?auto_428361 ?auto_428362 ) ( ON ?auto_428360 ?auto_428361 ) ( ON ?auto_428359 ?auto_428360 ) ( ON ?auto_428358 ?auto_428359 ) ( ON ?auto_428357 ?auto_428358 ) ( ON ?auto_428356 ?auto_428357 ) ( ON ?auto_428355 ?auto_428356 ) ( ON ?auto_428354 ?auto_428355 ) ( ON ?auto_428353 ?auto_428354 ) ( ON ?auto_428352 ?auto_428353 ) ( ON ?auto_428351 ?auto_428352 ) ( CLEAR ?auto_428351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_428351 )
      ( MAKE-15PILE ?auto_428351 ?auto_428352 ?auto_428353 ?auto_428354 ?auto_428355 ?auto_428356 ?auto_428357 ?auto_428358 ?auto_428359 ?auto_428360 ?auto_428361 ?auto_428362 ?auto_428363 ?auto_428364 ?auto_428365 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_428382 - BLOCK
      ?auto_428383 - BLOCK
      ?auto_428384 - BLOCK
      ?auto_428385 - BLOCK
      ?auto_428386 - BLOCK
      ?auto_428387 - BLOCK
      ?auto_428388 - BLOCK
      ?auto_428389 - BLOCK
      ?auto_428390 - BLOCK
      ?auto_428391 - BLOCK
      ?auto_428392 - BLOCK
      ?auto_428393 - BLOCK
      ?auto_428394 - BLOCK
      ?auto_428395 - BLOCK
      ?auto_428396 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_428396 ) ( not ( = ?auto_428382 ?auto_428383 ) ) ( not ( = ?auto_428382 ?auto_428384 ) ) ( not ( = ?auto_428382 ?auto_428385 ) ) ( not ( = ?auto_428382 ?auto_428386 ) ) ( not ( = ?auto_428382 ?auto_428387 ) ) ( not ( = ?auto_428382 ?auto_428388 ) ) ( not ( = ?auto_428382 ?auto_428389 ) ) ( not ( = ?auto_428382 ?auto_428390 ) ) ( not ( = ?auto_428382 ?auto_428391 ) ) ( not ( = ?auto_428382 ?auto_428392 ) ) ( not ( = ?auto_428382 ?auto_428393 ) ) ( not ( = ?auto_428382 ?auto_428394 ) ) ( not ( = ?auto_428382 ?auto_428395 ) ) ( not ( = ?auto_428382 ?auto_428396 ) ) ( not ( = ?auto_428383 ?auto_428384 ) ) ( not ( = ?auto_428383 ?auto_428385 ) ) ( not ( = ?auto_428383 ?auto_428386 ) ) ( not ( = ?auto_428383 ?auto_428387 ) ) ( not ( = ?auto_428383 ?auto_428388 ) ) ( not ( = ?auto_428383 ?auto_428389 ) ) ( not ( = ?auto_428383 ?auto_428390 ) ) ( not ( = ?auto_428383 ?auto_428391 ) ) ( not ( = ?auto_428383 ?auto_428392 ) ) ( not ( = ?auto_428383 ?auto_428393 ) ) ( not ( = ?auto_428383 ?auto_428394 ) ) ( not ( = ?auto_428383 ?auto_428395 ) ) ( not ( = ?auto_428383 ?auto_428396 ) ) ( not ( = ?auto_428384 ?auto_428385 ) ) ( not ( = ?auto_428384 ?auto_428386 ) ) ( not ( = ?auto_428384 ?auto_428387 ) ) ( not ( = ?auto_428384 ?auto_428388 ) ) ( not ( = ?auto_428384 ?auto_428389 ) ) ( not ( = ?auto_428384 ?auto_428390 ) ) ( not ( = ?auto_428384 ?auto_428391 ) ) ( not ( = ?auto_428384 ?auto_428392 ) ) ( not ( = ?auto_428384 ?auto_428393 ) ) ( not ( = ?auto_428384 ?auto_428394 ) ) ( not ( = ?auto_428384 ?auto_428395 ) ) ( not ( = ?auto_428384 ?auto_428396 ) ) ( not ( = ?auto_428385 ?auto_428386 ) ) ( not ( = ?auto_428385 ?auto_428387 ) ) ( not ( = ?auto_428385 ?auto_428388 ) ) ( not ( = ?auto_428385 ?auto_428389 ) ) ( not ( = ?auto_428385 ?auto_428390 ) ) ( not ( = ?auto_428385 ?auto_428391 ) ) ( not ( = ?auto_428385 ?auto_428392 ) ) ( not ( = ?auto_428385 ?auto_428393 ) ) ( not ( = ?auto_428385 ?auto_428394 ) ) ( not ( = ?auto_428385 ?auto_428395 ) ) ( not ( = ?auto_428385 ?auto_428396 ) ) ( not ( = ?auto_428386 ?auto_428387 ) ) ( not ( = ?auto_428386 ?auto_428388 ) ) ( not ( = ?auto_428386 ?auto_428389 ) ) ( not ( = ?auto_428386 ?auto_428390 ) ) ( not ( = ?auto_428386 ?auto_428391 ) ) ( not ( = ?auto_428386 ?auto_428392 ) ) ( not ( = ?auto_428386 ?auto_428393 ) ) ( not ( = ?auto_428386 ?auto_428394 ) ) ( not ( = ?auto_428386 ?auto_428395 ) ) ( not ( = ?auto_428386 ?auto_428396 ) ) ( not ( = ?auto_428387 ?auto_428388 ) ) ( not ( = ?auto_428387 ?auto_428389 ) ) ( not ( = ?auto_428387 ?auto_428390 ) ) ( not ( = ?auto_428387 ?auto_428391 ) ) ( not ( = ?auto_428387 ?auto_428392 ) ) ( not ( = ?auto_428387 ?auto_428393 ) ) ( not ( = ?auto_428387 ?auto_428394 ) ) ( not ( = ?auto_428387 ?auto_428395 ) ) ( not ( = ?auto_428387 ?auto_428396 ) ) ( not ( = ?auto_428388 ?auto_428389 ) ) ( not ( = ?auto_428388 ?auto_428390 ) ) ( not ( = ?auto_428388 ?auto_428391 ) ) ( not ( = ?auto_428388 ?auto_428392 ) ) ( not ( = ?auto_428388 ?auto_428393 ) ) ( not ( = ?auto_428388 ?auto_428394 ) ) ( not ( = ?auto_428388 ?auto_428395 ) ) ( not ( = ?auto_428388 ?auto_428396 ) ) ( not ( = ?auto_428389 ?auto_428390 ) ) ( not ( = ?auto_428389 ?auto_428391 ) ) ( not ( = ?auto_428389 ?auto_428392 ) ) ( not ( = ?auto_428389 ?auto_428393 ) ) ( not ( = ?auto_428389 ?auto_428394 ) ) ( not ( = ?auto_428389 ?auto_428395 ) ) ( not ( = ?auto_428389 ?auto_428396 ) ) ( not ( = ?auto_428390 ?auto_428391 ) ) ( not ( = ?auto_428390 ?auto_428392 ) ) ( not ( = ?auto_428390 ?auto_428393 ) ) ( not ( = ?auto_428390 ?auto_428394 ) ) ( not ( = ?auto_428390 ?auto_428395 ) ) ( not ( = ?auto_428390 ?auto_428396 ) ) ( not ( = ?auto_428391 ?auto_428392 ) ) ( not ( = ?auto_428391 ?auto_428393 ) ) ( not ( = ?auto_428391 ?auto_428394 ) ) ( not ( = ?auto_428391 ?auto_428395 ) ) ( not ( = ?auto_428391 ?auto_428396 ) ) ( not ( = ?auto_428392 ?auto_428393 ) ) ( not ( = ?auto_428392 ?auto_428394 ) ) ( not ( = ?auto_428392 ?auto_428395 ) ) ( not ( = ?auto_428392 ?auto_428396 ) ) ( not ( = ?auto_428393 ?auto_428394 ) ) ( not ( = ?auto_428393 ?auto_428395 ) ) ( not ( = ?auto_428393 ?auto_428396 ) ) ( not ( = ?auto_428394 ?auto_428395 ) ) ( not ( = ?auto_428394 ?auto_428396 ) ) ( not ( = ?auto_428395 ?auto_428396 ) ) ( ON ?auto_428395 ?auto_428396 ) ( ON ?auto_428394 ?auto_428395 ) ( ON ?auto_428393 ?auto_428394 ) ( ON ?auto_428392 ?auto_428393 ) ( ON ?auto_428391 ?auto_428392 ) ( ON ?auto_428390 ?auto_428391 ) ( ON ?auto_428389 ?auto_428390 ) ( ON ?auto_428388 ?auto_428389 ) ( ON ?auto_428387 ?auto_428388 ) ( ON ?auto_428386 ?auto_428387 ) ( ON ?auto_428385 ?auto_428386 ) ( ON ?auto_428384 ?auto_428385 ) ( ON ?auto_428383 ?auto_428384 ) ( ON ?auto_428382 ?auto_428383 ) ( CLEAR ?auto_428382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_428382 )
      ( MAKE-15PILE ?auto_428382 ?auto_428383 ?auto_428384 ?auto_428385 ?auto_428386 ?auto_428387 ?auto_428388 ?auto_428389 ?auto_428390 ?auto_428391 ?auto_428392 ?auto_428393 ?auto_428394 ?auto_428395 ?auto_428396 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_428412 - BLOCK
      ?auto_428413 - BLOCK
      ?auto_428414 - BLOCK
      ?auto_428415 - BLOCK
      ?auto_428416 - BLOCK
      ?auto_428417 - BLOCK
      ?auto_428418 - BLOCK
      ?auto_428419 - BLOCK
      ?auto_428420 - BLOCK
      ?auto_428421 - BLOCK
      ?auto_428422 - BLOCK
      ?auto_428423 - BLOCK
      ?auto_428424 - BLOCK
      ?auto_428425 - BLOCK
      ?auto_428426 - BLOCK
    )
    :vars
    (
      ?auto_428427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_428412 ?auto_428413 ) ) ( not ( = ?auto_428412 ?auto_428414 ) ) ( not ( = ?auto_428412 ?auto_428415 ) ) ( not ( = ?auto_428412 ?auto_428416 ) ) ( not ( = ?auto_428412 ?auto_428417 ) ) ( not ( = ?auto_428412 ?auto_428418 ) ) ( not ( = ?auto_428412 ?auto_428419 ) ) ( not ( = ?auto_428412 ?auto_428420 ) ) ( not ( = ?auto_428412 ?auto_428421 ) ) ( not ( = ?auto_428412 ?auto_428422 ) ) ( not ( = ?auto_428412 ?auto_428423 ) ) ( not ( = ?auto_428412 ?auto_428424 ) ) ( not ( = ?auto_428412 ?auto_428425 ) ) ( not ( = ?auto_428412 ?auto_428426 ) ) ( not ( = ?auto_428413 ?auto_428414 ) ) ( not ( = ?auto_428413 ?auto_428415 ) ) ( not ( = ?auto_428413 ?auto_428416 ) ) ( not ( = ?auto_428413 ?auto_428417 ) ) ( not ( = ?auto_428413 ?auto_428418 ) ) ( not ( = ?auto_428413 ?auto_428419 ) ) ( not ( = ?auto_428413 ?auto_428420 ) ) ( not ( = ?auto_428413 ?auto_428421 ) ) ( not ( = ?auto_428413 ?auto_428422 ) ) ( not ( = ?auto_428413 ?auto_428423 ) ) ( not ( = ?auto_428413 ?auto_428424 ) ) ( not ( = ?auto_428413 ?auto_428425 ) ) ( not ( = ?auto_428413 ?auto_428426 ) ) ( not ( = ?auto_428414 ?auto_428415 ) ) ( not ( = ?auto_428414 ?auto_428416 ) ) ( not ( = ?auto_428414 ?auto_428417 ) ) ( not ( = ?auto_428414 ?auto_428418 ) ) ( not ( = ?auto_428414 ?auto_428419 ) ) ( not ( = ?auto_428414 ?auto_428420 ) ) ( not ( = ?auto_428414 ?auto_428421 ) ) ( not ( = ?auto_428414 ?auto_428422 ) ) ( not ( = ?auto_428414 ?auto_428423 ) ) ( not ( = ?auto_428414 ?auto_428424 ) ) ( not ( = ?auto_428414 ?auto_428425 ) ) ( not ( = ?auto_428414 ?auto_428426 ) ) ( not ( = ?auto_428415 ?auto_428416 ) ) ( not ( = ?auto_428415 ?auto_428417 ) ) ( not ( = ?auto_428415 ?auto_428418 ) ) ( not ( = ?auto_428415 ?auto_428419 ) ) ( not ( = ?auto_428415 ?auto_428420 ) ) ( not ( = ?auto_428415 ?auto_428421 ) ) ( not ( = ?auto_428415 ?auto_428422 ) ) ( not ( = ?auto_428415 ?auto_428423 ) ) ( not ( = ?auto_428415 ?auto_428424 ) ) ( not ( = ?auto_428415 ?auto_428425 ) ) ( not ( = ?auto_428415 ?auto_428426 ) ) ( not ( = ?auto_428416 ?auto_428417 ) ) ( not ( = ?auto_428416 ?auto_428418 ) ) ( not ( = ?auto_428416 ?auto_428419 ) ) ( not ( = ?auto_428416 ?auto_428420 ) ) ( not ( = ?auto_428416 ?auto_428421 ) ) ( not ( = ?auto_428416 ?auto_428422 ) ) ( not ( = ?auto_428416 ?auto_428423 ) ) ( not ( = ?auto_428416 ?auto_428424 ) ) ( not ( = ?auto_428416 ?auto_428425 ) ) ( not ( = ?auto_428416 ?auto_428426 ) ) ( not ( = ?auto_428417 ?auto_428418 ) ) ( not ( = ?auto_428417 ?auto_428419 ) ) ( not ( = ?auto_428417 ?auto_428420 ) ) ( not ( = ?auto_428417 ?auto_428421 ) ) ( not ( = ?auto_428417 ?auto_428422 ) ) ( not ( = ?auto_428417 ?auto_428423 ) ) ( not ( = ?auto_428417 ?auto_428424 ) ) ( not ( = ?auto_428417 ?auto_428425 ) ) ( not ( = ?auto_428417 ?auto_428426 ) ) ( not ( = ?auto_428418 ?auto_428419 ) ) ( not ( = ?auto_428418 ?auto_428420 ) ) ( not ( = ?auto_428418 ?auto_428421 ) ) ( not ( = ?auto_428418 ?auto_428422 ) ) ( not ( = ?auto_428418 ?auto_428423 ) ) ( not ( = ?auto_428418 ?auto_428424 ) ) ( not ( = ?auto_428418 ?auto_428425 ) ) ( not ( = ?auto_428418 ?auto_428426 ) ) ( not ( = ?auto_428419 ?auto_428420 ) ) ( not ( = ?auto_428419 ?auto_428421 ) ) ( not ( = ?auto_428419 ?auto_428422 ) ) ( not ( = ?auto_428419 ?auto_428423 ) ) ( not ( = ?auto_428419 ?auto_428424 ) ) ( not ( = ?auto_428419 ?auto_428425 ) ) ( not ( = ?auto_428419 ?auto_428426 ) ) ( not ( = ?auto_428420 ?auto_428421 ) ) ( not ( = ?auto_428420 ?auto_428422 ) ) ( not ( = ?auto_428420 ?auto_428423 ) ) ( not ( = ?auto_428420 ?auto_428424 ) ) ( not ( = ?auto_428420 ?auto_428425 ) ) ( not ( = ?auto_428420 ?auto_428426 ) ) ( not ( = ?auto_428421 ?auto_428422 ) ) ( not ( = ?auto_428421 ?auto_428423 ) ) ( not ( = ?auto_428421 ?auto_428424 ) ) ( not ( = ?auto_428421 ?auto_428425 ) ) ( not ( = ?auto_428421 ?auto_428426 ) ) ( not ( = ?auto_428422 ?auto_428423 ) ) ( not ( = ?auto_428422 ?auto_428424 ) ) ( not ( = ?auto_428422 ?auto_428425 ) ) ( not ( = ?auto_428422 ?auto_428426 ) ) ( not ( = ?auto_428423 ?auto_428424 ) ) ( not ( = ?auto_428423 ?auto_428425 ) ) ( not ( = ?auto_428423 ?auto_428426 ) ) ( not ( = ?auto_428424 ?auto_428425 ) ) ( not ( = ?auto_428424 ?auto_428426 ) ) ( not ( = ?auto_428425 ?auto_428426 ) ) ( ON ?auto_428412 ?auto_428427 ) ( not ( = ?auto_428426 ?auto_428427 ) ) ( not ( = ?auto_428425 ?auto_428427 ) ) ( not ( = ?auto_428424 ?auto_428427 ) ) ( not ( = ?auto_428423 ?auto_428427 ) ) ( not ( = ?auto_428422 ?auto_428427 ) ) ( not ( = ?auto_428421 ?auto_428427 ) ) ( not ( = ?auto_428420 ?auto_428427 ) ) ( not ( = ?auto_428419 ?auto_428427 ) ) ( not ( = ?auto_428418 ?auto_428427 ) ) ( not ( = ?auto_428417 ?auto_428427 ) ) ( not ( = ?auto_428416 ?auto_428427 ) ) ( not ( = ?auto_428415 ?auto_428427 ) ) ( not ( = ?auto_428414 ?auto_428427 ) ) ( not ( = ?auto_428413 ?auto_428427 ) ) ( not ( = ?auto_428412 ?auto_428427 ) ) ( ON ?auto_428413 ?auto_428412 ) ( ON ?auto_428414 ?auto_428413 ) ( ON ?auto_428415 ?auto_428414 ) ( ON ?auto_428416 ?auto_428415 ) ( ON ?auto_428417 ?auto_428416 ) ( ON ?auto_428418 ?auto_428417 ) ( ON ?auto_428419 ?auto_428418 ) ( ON ?auto_428420 ?auto_428419 ) ( ON ?auto_428421 ?auto_428420 ) ( ON ?auto_428422 ?auto_428421 ) ( ON ?auto_428423 ?auto_428422 ) ( ON ?auto_428424 ?auto_428423 ) ( ON ?auto_428425 ?auto_428424 ) ( ON ?auto_428426 ?auto_428425 ) ( CLEAR ?auto_428426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_428426 ?auto_428425 ?auto_428424 ?auto_428423 ?auto_428422 ?auto_428421 ?auto_428420 ?auto_428419 ?auto_428418 ?auto_428417 ?auto_428416 ?auto_428415 ?auto_428414 ?auto_428413 ?auto_428412 )
      ( MAKE-15PILE ?auto_428412 ?auto_428413 ?auto_428414 ?auto_428415 ?auto_428416 ?auto_428417 ?auto_428418 ?auto_428419 ?auto_428420 ?auto_428421 ?auto_428422 ?auto_428423 ?auto_428424 ?auto_428425 ?auto_428426 ) )
  )

)

