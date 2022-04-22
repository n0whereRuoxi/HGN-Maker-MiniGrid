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
      ?auto_635185 - BLOCK
    )
    :vars
    (
      ?auto_635186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635185 ?auto_635186 ) ( CLEAR ?auto_635185 ) ( HAND-EMPTY ) ( not ( = ?auto_635185 ?auto_635186 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_635185 ?auto_635186 )
      ( !PUTDOWN ?auto_635185 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_635192 - BLOCK
      ?auto_635193 - BLOCK
    )
    :vars
    (
      ?auto_635194 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_635192 ) ( ON ?auto_635193 ?auto_635194 ) ( CLEAR ?auto_635193 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_635192 ) ( not ( = ?auto_635192 ?auto_635193 ) ) ( not ( = ?auto_635192 ?auto_635194 ) ) ( not ( = ?auto_635193 ?auto_635194 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_635193 ?auto_635194 )
      ( !STACK ?auto_635193 ?auto_635192 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_635202 - BLOCK
      ?auto_635203 - BLOCK
    )
    :vars
    (
      ?auto_635204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635203 ?auto_635204 ) ( not ( = ?auto_635202 ?auto_635203 ) ) ( not ( = ?auto_635202 ?auto_635204 ) ) ( not ( = ?auto_635203 ?auto_635204 ) ) ( ON ?auto_635202 ?auto_635203 ) ( CLEAR ?auto_635202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_635202 )
      ( MAKE-2PILE ?auto_635202 ?auto_635203 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_635213 - BLOCK
      ?auto_635214 - BLOCK
      ?auto_635215 - BLOCK
    )
    :vars
    (
      ?auto_635216 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_635214 ) ( ON ?auto_635215 ?auto_635216 ) ( CLEAR ?auto_635215 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_635213 ) ( ON ?auto_635214 ?auto_635213 ) ( not ( = ?auto_635213 ?auto_635214 ) ) ( not ( = ?auto_635213 ?auto_635215 ) ) ( not ( = ?auto_635213 ?auto_635216 ) ) ( not ( = ?auto_635214 ?auto_635215 ) ) ( not ( = ?auto_635214 ?auto_635216 ) ) ( not ( = ?auto_635215 ?auto_635216 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_635215 ?auto_635216 )
      ( !STACK ?auto_635215 ?auto_635214 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_635227 - BLOCK
      ?auto_635228 - BLOCK
      ?auto_635229 - BLOCK
    )
    :vars
    (
      ?auto_635230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635229 ?auto_635230 ) ( ON-TABLE ?auto_635227 ) ( not ( = ?auto_635227 ?auto_635228 ) ) ( not ( = ?auto_635227 ?auto_635229 ) ) ( not ( = ?auto_635227 ?auto_635230 ) ) ( not ( = ?auto_635228 ?auto_635229 ) ) ( not ( = ?auto_635228 ?auto_635230 ) ) ( not ( = ?auto_635229 ?auto_635230 ) ) ( CLEAR ?auto_635227 ) ( ON ?auto_635228 ?auto_635229 ) ( CLEAR ?auto_635228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_635227 ?auto_635228 )
      ( MAKE-3PILE ?auto_635227 ?auto_635228 ?auto_635229 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_635241 - BLOCK
      ?auto_635242 - BLOCK
      ?auto_635243 - BLOCK
    )
    :vars
    (
      ?auto_635244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635243 ?auto_635244 ) ( not ( = ?auto_635241 ?auto_635242 ) ) ( not ( = ?auto_635241 ?auto_635243 ) ) ( not ( = ?auto_635241 ?auto_635244 ) ) ( not ( = ?auto_635242 ?auto_635243 ) ) ( not ( = ?auto_635242 ?auto_635244 ) ) ( not ( = ?auto_635243 ?auto_635244 ) ) ( ON ?auto_635242 ?auto_635243 ) ( ON ?auto_635241 ?auto_635242 ) ( CLEAR ?auto_635241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_635241 )
      ( MAKE-3PILE ?auto_635241 ?auto_635242 ?auto_635243 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_635256 - BLOCK
      ?auto_635257 - BLOCK
      ?auto_635258 - BLOCK
      ?auto_635259 - BLOCK
    )
    :vars
    (
      ?auto_635260 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_635258 ) ( ON ?auto_635259 ?auto_635260 ) ( CLEAR ?auto_635259 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_635256 ) ( ON ?auto_635257 ?auto_635256 ) ( ON ?auto_635258 ?auto_635257 ) ( not ( = ?auto_635256 ?auto_635257 ) ) ( not ( = ?auto_635256 ?auto_635258 ) ) ( not ( = ?auto_635256 ?auto_635259 ) ) ( not ( = ?auto_635256 ?auto_635260 ) ) ( not ( = ?auto_635257 ?auto_635258 ) ) ( not ( = ?auto_635257 ?auto_635259 ) ) ( not ( = ?auto_635257 ?auto_635260 ) ) ( not ( = ?auto_635258 ?auto_635259 ) ) ( not ( = ?auto_635258 ?auto_635260 ) ) ( not ( = ?auto_635259 ?auto_635260 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_635259 ?auto_635260 )
      ( !STACK ?auto_635259 ?auto_635258 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_635274 - BLOCK
      ?auto_635275 - BLOCK
      ?auto_635276 - BLOCK
      ?auto_635277 - BLOCK
    )
    :vars
    (
      ?auto_635278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635277 ?auto_635278 ) ( ON-TABLE ?auto_635274 ) ( ON ?auto_635275 ?auto_635274 ) ( not ( = ?auto_635274 ?auto_635275 ) ) ( not ( = ?auto_635274 ?auto_635276 ) ) ( not ( = ?auto_635274 ?auto_635277 ) ) ( not ( = ?auto_635274 ?auto_635278 ) ) ( not ( = ?auto_635275 ?auto_635276 ) ) ( not ( = ?auto_635275 ?auto_635277 ) ) ( not ( = ?auto_635275 ?auto_635278 ) ) ( not ( = ?auto_635276 ?auto_635277 ) ) ( not ( = ?auto_635276 ?auto_635278 ) ) ( not ( = ?auto_635277 ?auto_635278 ) ) ( CLEAR ?auto_635275 ) ( ON ?auto_635276 ?auto_635277 ) ( CLEAR ?auto_635276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_635274 ?auto_635275 ?auto_635276 )
      ( MAKE-4PILE ?auto_635274 ?auto_635275 ?auto_635276 ?auto_635277 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_635292 - BLOCK
      ?auto_635293 - BLOCK
      ?auto_635294 - BLOCK
      ?auto_635295 - BLOCK
    )
    :vars
    (
      ?auto_635296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635295 ?auto_635296 ) ( ON-TABLE ?auto_635292 ) ( not ( = ?auto_635292 ?auto_635293 ) ) ( not ( = ?auto_635292 ?auto_635294 ) ) ( not ( = ?auto_635292 ?auto_635295 ) ) ( not ( = ?auto_635292 ?auto_635296 ) ) ( not ( = ?auto_635293 ?auto_635294 ) ) ( not ( = ?auto_635293 ?auto_635295 ) ) ( not ( = ?auto_635293 ?auto_635296 ) ) ( not ( = ?auto_635294 ?auto_635295 ) ) ( not ( = ?auto_635294 ?auto_635296 ) ) ( not ( = ?auto_635295 ?auto_635296 ) ) ( ON ?auto_635294 ?auto_635295 ) ( CLEAR ?auto_635292 ) ( ON ?auto_635293 ?auto_635294 ) ( CLEAR ?auto_635293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_635292 ?auto_635293 )
      ( MAKE-4PILE ?auto_635292 ?auto_635293 ?auto_635294 ?auto_635295 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_635310 - BLOCK
      ?auto_635311 - BLOCK
      ?auto_635312 - BLOCK
      ?auto_635313 - BLOCK
    )
    :vars
    (
      ?auto_635314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635313 ?auto_635314 ) ( not ( = ?auto_635310 ?auto_635311 ) ) ( not ( = ?auto_635310 ?auto_635312 ) ) ( not ( = ?auto_635310 ?auto_635313 ) ) ( not ( = ?auto_635310 ?auto_635314 ) ) ( not ( = ?auto_635311 ?auto_635312 ) ) ( not ( = ?auto_635311 ?auto_635313 ) ) ( not ( = ?auto_635311 ?auto_635314 ) ) ( not ( = ?auto_635312 ?auto_635313 ) ) ( not ( = ?auto_635312 ?auto_635314 ) ) ( not ( = ?auto_635313 ?auto_635314 ) ) ( ON ?auto_635312 ?auto_635313 ) ( ON ?auto_635311 ?auto_635312 ) ( ON ?auto_635310 ?auto_635311 ) ( CLEAR ?auto_635310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_635310 )
      ( MAKE-4PILE ?auto_635310 ?auto_635311 ?auto_635312 ?auto_635313 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_635329 - BLOCK
      ?auto_635330 - BLOCK
      ?auto_635331 - BLOCK
      ?auto_635332 - BLOCK
      ?auto_635333 - BLOCK
    )
    :vars
    (
      ?auto_635334 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_635332 ) ( ON ?auto_635333 ?auto_635334 ) ( CLEAR ?auto_635333 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_635329 ) ( ON ?auto_635330 ?auto_635329 ) ( ON ?auto_635331 ?auto_635330 ) ( ON ?auto_635332 ?auto_635331 ) ( not ( = ?auto_635329 ?auto_635330 ) ) ( not ( = ?auto_635329 ?auto_635331 ) ) ( not ( = ?auto_635329 ?auto_635332 ) ) ( not ( = ?auto_635329 ?auto_635333 ) ) ( not ( = ?auto_635329 ?auto_635334 ) ) ( not ( = ?auto_635330 ?auto_635331 ) ) ( not ( = ?auto_635330 ?auto_635332 ) ) ( not ( = ?auto_635330 ?auto_635333 ) ) ( not ( = ?auto_635330 ?auto_635334 ) ) ( not ( = ?auto_635331 ?auto_635332 ) ) ( not ( = ?auto_635331 ?auto_635333 ) ) ( not ( = ?auto_635331 ?auto_635334 ) ) ( not ( = ?auto_635332 ?auto_635333 ) ) ( not ( = ?auto_635332 ?auto_635334 ) ) ( not ( = ?auto_635333 ?auto_635334 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_635333 ?auto_635334 )
      ( !STACK ?auto_635333 ?auto_635332 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_635351 - BLOCK
      ?auto_635352 - BLOCK
      ?auto_635353 - BLOCK
      ?auto_635354 - BLOCK
      ?auto_635355 - BLOCK
    )
    :vars
    (
      ?auto_635356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635355 ?auto_635356 ) ( ON-TABLE ?auto_635351 ) ( ON ?auto_635352 ?auto_635351 ) ( ON ?auto_635353 ?auto_635352 ) ( not ( = ?auto_635351 ?auto_635352 ) ) ( not ( = ?auto_635351 ?auto_635353 ) ) ( not ( = ?auto_635351 ?auto_635354 ) ) ( not ( = ?auto_635351 ?auto_635355 ) ) ( not ( = ?auto_635351 ?auto_635356 ) ) ( not ( = ?auto_635352 ?auto_635353 ) ) ( not ( = ?auto_635352 ?auto_635354 ) ) ( not ( = ?auto_635352 ?auto_635355 ) ) ( not ( = ?auto_635352 ?auto_635356 ) ) ( not ( = ?auto_635353 ?auto_635354 ) ) ( not ( = ?auto_635353 ?auto_635355 ) ) ( not ( = ?auto_635353 ?auto_635356 ) ) ( not ( = ?auto_635354 ?auto_635355 ) ) ( not ( = ?auto_635354 ?auto_635356 ) ) ( not ( = ?auto_635355 ?auto_635356 ) ) ( CLEAR ?auto_635353 ) ( ON ?auto_635354 ?auto_635355 ) ( CLEAR ?auto_635354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_635351 ?auto_635352 ?auto_635353 ?auto_635354 )
      ( MAKE-5PILE ?auto_635351 ?auto_635352 ?auto_635353 ?auto_635354 ?auto_635355 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_635373 - BLOCK
      ?auto_635374 - BLOCK
      ?auto_635375 - BLOCK
      ?auto_635376 - BLOCK
      ?auto_635377 - BLOCK
    )
    :vars
    (
      ?auto_635378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635377 ?auto_635378 ) ( ON-TABLE ?auto_635373 ) ( ON ?auto_635374 ?auto_635373 ) ( not ( = ?auto_635373 ?auto_635374 ) ) ( not ( = ?auto_635373 ?auto_635375 ) ) ( not ( = ?auto_635373 ?auto_635376 ) ) ( not ( = ?auto_635373 ?auto_635377 ) ) ( not ( = ?auto_635373 ?auto_635378 ) ) ( not ( = ?auto_635374 ?auto_635375 ) ) ( not ( = ?auto_635374 ?auto_635376 ) ) ( not ( = ?auto_635374 ?auto_635377 ) ) ( not ( = ?auto_635374 ?auto_635378 ) ) ( not ( = ?auto_635375 ?auto_635376 ) ) ( not ( = ?auto_635375 ?auto_635377 ) ) ( not ( = ?auto_635375 ?auto_635378 ) ) ( not ( = ?auto_635376 ?auto_635377 ) ) ( not ( = ?auto_635376 ?auto_635378 ) ) ( not ( = ?auto_635377 ?auto_635378 ) ) ( ON ?auto_635376 ?auto_635377 ) ( CLEAR ?auto_635374 ) ( ON ?auto_635375 ?auto_635376 ) ( CLEAR ?auto_635375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_635373 ?auto_635374 ?auto_635375 )
      ( MAKE-5PILE ?auto_635373 ?auto_635374 ?auto_635375 ?auto_635376 ?auto_635377 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_635395 - BLOCK
      ?auto_635396 - BLOCK
      ?auto_635397 - BLOCK
      ?auto_635398 - BLOCK
      ?auto_635399 - BLOCK
    )
    :vars
    (
      ?auto_635400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635399 ?auto_635400 ) ( ON-TABLE ?auto_635395 ) ( not ( = ?auto_635395 ?auto_635396 ) ) ( not ( = ?auto_635395 ?auto_635397 ) ) ( not ( = ?auto_635395 ?auto_635398 ) ) ( not ( = ?auto_635395 ?auto_635399 ) ) ( not ( = ?auto_635395 ?auto_635400 ) ) ( not ( = ?auto_635396 ?auto_635397 ) ) ( not ( = ?auto_635396 ?auto_635398 ) ) ( not ( = ?auto_635396 ?auto_635399 ) ) ( not ( = ?auto_635396 ?auto_635400 ) ) ( not ( = ?auto_635397 ?auto_635398 ) ) ( not ( = ?auto_635397 ?auto_635399 ) ) ( not ( = ?auto_635397 ?auto_635400 ) ) ( not ( = ?auto_635398 ?auto_635399 ) ) ( not ( = ?auto_635398 ?auto_635400 ) ) ( not ( = ?auto_635399 ?auto_635400 ) ) ( ON ?auto_635398 ?auto_635399 ) ( ON ?auto_635397 ?auto_635398 ) ( CLEAR ?auto_635395 ) ( ON ?auto_635396 ?auto_635397 ) ( CLEAR ?auto_635396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_635395 ?auto_635396 )
      ( MAKE-5PILE ?auto_635395 ?auto_635396 ?auto_635397 ?auto_635398 ?auto_635399 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_635417 - BLOCK
      ?auto_635418 - BLOCK
      ?auto_635419 - BLOCK
      ?auto_635420 - BLOCK
      ?auto_635421 - BLOCK
    )
    :vars
    (
      ?auto_635422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635421 ?auto_635422 ) ( not ( = ?auto_635417 ?auto_635418 ) ) ( not ( = ?auto_635417 ?auto_635419 ) ) ( not ( = ?auto_635417 ?auto_635420 ) ) ( not ( = ?auto_635417 ?auto_635421 ) ) ( not ( = ?auto_635417 ?auto_635422 ) ) ( not ( = ?auto_635418 ?auto_635419 ) ) ( not ( = ?auto_635418 ?auto_635420 ) ) ( not ( = ?auto_635418 ?auto_635421 ) ) ( not ( = ?auto_635418 ?auto_635422 ) ) ( not ( = ?auto_635419 ?auto_635420 ) ) ( not ( = ?auto_635419 ?auto_635421 ) ) ( not ( = ?auto_635419 ?auto_635422 ) ) ( not ( = ?auto_635420 ?auto_635421 ) ) ( not ( = ?auto_635420 ?auto_635422 ) ) ( not ( = ?auto_635421 ?auto_635422 ) ) ( ON ?auto_635420 ?auto_635421 ) ( ON ?auto_635419 ?auto_635420 ) ( ON ?auto_635418 ?auto_635419 ) ( ON ?auto_635417 ?auto_635418 ) ( CLEAR ?auto_635417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_635417 )
      ( MAKE-5PILE ?auto_635417 ?auto_635418 ?auto_635419 ?auto_635420 ?auto_635421 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_635440 - BLOCK
      ?auto_635441 - BLOCK
      ?auto_635442 - BLOCK
      ?auto_635443 - BLOCK
      ?auto_635444 - BLOCK
      ?auto_635445 - BLOCK
    )
    :vars
    (
      ?auto_635446 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_635444 ) ( ON ?auto_635445 ?auto_635446 ) ( CLEAR ?auto_635445 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_635440 ) ( ON ?auto_635441 ?auto_635440 ) ( ON ?auto_635442 ?auto_635441 ) ( ON ?auto_635443 ?auto_635442 ) ( ON ?auto_635444 ?auto_635443 ) ( not ( = ?auto_635440 ?auto_635441 ) ) ( not ( = ?auto_635440 ?auto_635442 ) ) ( not ( = ?auto_635440 ?auto_635443 ) ) ( not ( = ?auto_635440 ?auto_635444 ) ) ( not ( = ?auto_635440 ?auto_635445 ) ) ( not ( = ?auto_635440 ?auto_635446 ) ) ( not ( = ?auto_635441 ?auto_635442 ) ) ( not ( = ?auto_635441 ?auto_635443 ) ) ( not ( = ?auto_635441 ?auto_635444 ) ) ( not ( = ?auto_635441 ?auto_635445 ) ) ( not ( = ?auto_635441 ?auto_635446 ) ) ( not ( = ?auto_635442 ?auto_635443 ) ) ( not ( = ?auto_635442 ?auto_635444 ) ) ( not ( = ?auto_635442 ?auto_635445 ) ) ( not ( = ?auto_635442 ?auto_635446 ) ) ( not ( = ?auto_635443 ?auto_635444 ) ) ( not ( = ?auto_635443 ?auto_635445 ) ) ( not ( = ?auto_635443 ?auto_635446 ) ) ( not ( = ?auto_635444 ?auto_635445 ) ) ( not ( = ?auto_635444 ?auto_635446 ) ) ( not ( = ?auto_635445 ?auto_635446 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_635445 ?auto_635446 )
      ( !STACK ?auto_635445 ?auto_635444 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_635466 - BLOCK
      ?auto_635467 - BLOCK
      ?auto_635468 - BLOCK
      ?auto_635469 - BLOCK
      ?auto_635470 - BLOCK
      ?auto_635471 - BLOCK
    )
    :vars
    (
      ?auto_635472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635471 ?auto_635472 ) ( ON-TABLE ?auto_635466 ) ( ON ?auto_635467 ?auto_635466 ) ( ON ?auto_635468 ?auto_635467 ) ( ON ?auto_635469 ?auto_635468 ) ( not ( = ?auto_635466 ?auto_635467 ) ) ( not ( = ?auto_635466 ?auto_635468 ) ) ( not ( = ?auto_635466 ?auto_635469 ) ) ( not ( = ?auto_635466 ?auto_635470 ) ) ( not ( = ?auto_635466 ?auto_635471 ) ) ( not ( = ?auto_635466 ?auto_635472 ) ) ( not ( = ?auto_635467 ?auto_635468 ) ) ( not ( = ?auto_635467 ?auto_635469 ) ) ( not ( = ?auto_635467 ?auto_635470 ) ) ( not ( = ?auto_635467 ?auto_635471 ) ) ( not ( = ?auto_635467 ?auto_635472 ) ) ( not ( = ?auto_635468 ?auto_635469 ) ) ( not ( = ?auto_635468 ?auto_635470 ) ) ( not ( = ?auto_635468 ?auto_635471 ) ) ( not ( = ?auto_635468 ?auto_635472 ) ) ( not ( = ?auto_635469 ?auto_635470 ) ) ( not ( = ?auto_635469 ?auto_635471 ) ) ( not ( = ?auto_635469 ?auto_635472 ) ) ( not ( = ?auto_635470 ?auto_635471 ) ) ( not ( = ?auto_635470 ?auto_635472 ) ) ( not ( = ?auto_635471 ?auto_635472 ) ) ( CLEAR ?auto_635469 ) ( ON ?auto_635470 ?auto_635471 ) ( CLEAR ?auto_635470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_635466 ?auto_635467 ?auto_635468 ?auto_635469 ?auto_635470 )
      ( MAKE-6PILE ?auto_635466 ?auto_635467 ?auto_635468 ?auto_635469 ?auto_635470 ?auto_635471 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_635492 - BLOCK
      ?auto_635493 - BLOCK
      ?auto_635494 - BLOCK
      ?auto_635495 - BLOCK
      ?auto_635496 - BLOCK
      ?auto_635497 - BLOCK
    )
    :vars
    (
      ?auto_635498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635497 ?auto_635498 ) ( ON-TABLE ?auto_635492 ) ( ON ?auto_635493 ?auto_635492 ) ( ON ?auto_635494 ?auto_635493 ) ( not ( = ?auto_635492 ?auto_635493 ) ) ( not ( = ?auto_635492 ?auto_635494 ) ) ( not ( = ?auto_635492 ?auto_635495 ) ) ( not ( = ?auto_635492 ?auto_635496 ) ) ( not ( = ?auto_635492 ?auto_635497 ) ) ( not ( = ?auto_635492 ?auto_635498 ) ) ( not ( = ?auto_635493 ?auto_635494 ) ) ( not ( = ?auto_635493 ?auto_635495 ) ) ( not ( = ?auto_635493 ?auto_635496 ) ) ( not ( = ?auto_635493 ?auto_635497 ) ) ( not ( = ?auto_635493 ?auto_635498 ) ) ( not ( = ?auto_635494 ?auto_635495 ) ) ( not ( = ?auto_635494 ?auto_635496 ) ) ( not ( = ?auto_635494 ?auto_635497 ) ) ( not ( = ?auto_635494 ?auto_635498 ) ) ( not ( = ?auto_635495 ?auto_635496 ) ) ( not ( = ?auto_635495 ?auto_635497 ) ) ( not ( = ?auto_635495 ?auto_635498 ) ) ( not ( = ?auto_635496 ?auto_635497 ) ) ( not ( = ?auto_635496 ?auto_635498 ) ) ( not ( = ?auto_635497 ?auto_635498 ) ) ( ON ?auto_635496 ?auto_635497 ) ( CLEAR ?auto_635494 ) ( ON ?auto_635495 ?auto_635496 ) ( CLEAR ?auto_635495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_635492 ?auto_635493 ?auto_635494 ?auto_635495 )
      ( MAKE-6PILE ?auto_635492 ?auto_635493 ?auto_635494 ?auto_635495 ?auto_635496 ?auto_635497 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_635518 - BLOCK
      ?auto_635519 - BLOCK
      ?auto_635520 - BLOCK
      ?auto_635521 - BLOCK
      ?auto_635522 - BLOCK
      ?auto_635523 - BLOCK
    )
    :vars
    (
      ?auto_635524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635523 ?auto_635524 ) ( ON-TABLE ?auto_635518 ) ( ON ?auto_635519 ?auto_635518 ) ( not ( = ?auto_635518 ?auto_635519 ) ) ( not ( = ?auto_635518 ?auto_635520 ) ) ( not ( = ?auto_635518 ?auto_635521 ) ) ( not ( = ?auto_635518 ?auto_635522 ) ) ( not ( = ?auto_635518 ?auto_635523 ) ) ( not ( = ?auto_635518 ?auto_635524 ) ) ( not ( = ?auto_635519 ?auto_635520 ) ) ( not ( = ?auto_635519 ?auto_635521 ) ) ( not ( = ?auto_635519 ?auto_635522 ) ) ( not ( = ?auto_635519 ?auto_635523 ) ) ( not ( = ?auto_635519 ?auto_635524 ) ) ( not ( = ?auto_635520 ?auto_635521 ) ) ( not ( = ?auto_635520 ?auto_635522 ) ) ( not ( = ?auto_635520 ?auto_635523 ) ) ( not ( = ?auto_635520 ?auto_635524 ) ) ( not ( = ?auto_635521 ?auto_635522 ) ) ( not ( = ?auto_635521 ?auto_635523 ) ) ( not ( = ?auto_635521 ?auto_635524 ) ) ( not ( = ?auto_635522 ?auto_635523 ) ) ( not ( = ?auto_635522 ?auto_635524 ) ) ( not ( = ?auto_635523 ?auto_635524 ) ) ( ON ?auto_635522 ?auto_635523 ) ( ON ?auto_635521 ?auto_635522 ) ( CLEAR ?auto_635519 ) ( ON ?auto_635520 ?auto_635521 ) ( CLEAR ?auto_635520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_635518 ?auto_635519 ?auto_635520 )
      ( MAKE-6PILE ?auto_635518 ?auto_635519 ?auto_635520 ?auto_635521 ?auto_635522 ?auto_635523 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_635544 - BLOCK
      ?auto_635545 - BLOCK
      ?auto_635546 - BLOCK
      ?auto_635547 - BLOCK
      ?auto_635548 - BLOCK
      ?auto_635549 - BLOCK
    )
    :vars
    (
      ?auto_635550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635549 ?auto_635550 ) ( ON-TABLE ?auto_635544 ) ( not ( = ?auto_635544 ?auto_635545 ) ) ( not ( = ?auto_635544 ?auto_635546 ) ) ( not ( = ?auto_635544 ?auto_635547 ) ) ( not ( = ?auto_635544 ?auto_635548 ) ) ( not ( = ?auto_635544 ?auto_635549 ) ) ( not ( = ?auto_635544 ?auto_635550 ) ) ( not ( = ?auto_635545 ?auto_635546 ) ) ( not ( = ?auto_635545 ?auto_635547 ) ) ( not ( = ?auto_635545 ?auto_635548 ) ) ( not ( = ?auto_635545 ?auto_635549 ) ) ( not ( = ?auto_635545 ?auto_635550 ) ) ( not ( = ?auto_635546 ?auto_635547 ) ) ( not ( = ?auto_635546 ?auto_635548 ) ) ( not ( = ?auto_635546 ?auto_635549 ) ) ( not ( = ?auto_635546 ?auto_635550 ) ) ( not ( = ?auto_635547 ?auto_635548 ) ) ( not ( = ?auto_635547 ?auto_635549 ) ) ( not ( = ?auto_635547 ?auto_635550 ) ) ( not ( = ?auto_635548 ?auto_635549 ) ) ( not ( = ?auto_635548 ?auto_635550 ) ) ( not ( = ?auto_635549 ?auto_635550 ) ) ( ON ?auto_635548 ?auto_635549 ) ( ON ?auto_635547 ?auto_635548 ) ( ON ?auto_635546 ?auto_635547 ) ( CLEAR ?auto_635544 ) ( ON ?auto_635545 ?auto_635546 ) ( CLEAR ?auto_635545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_635544 ?auto_635545 )
      ( MAKE-6PILE ?auto_635544 ?auto_635545 ?auto_635546 ?auto_635547 ?auto_635548 ?auto_635549 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_635570 - BLOCK
      ?auto_635571 - BLOCK
      ?auto_635572 - BLOCK
      ?auto_635573 - BLOCK
      ?auto_635574 - BLOCK
      ?auto_635575 - BLOCK
    )
    :vars
    (
      ?auto_635576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635575 ?auto_635576 ) ( not ( = ?auto_635570 ?auto_635571 ) ) ( not ( = ?auto_635570 ?auto_635572 ) ) ( not ( = ?auto_635570 ?auto_635573 ) ) ( not ( = ?auto_635570 ?auto_635574 ) ) ( not ( = ?auto_635570 ?auto_635575 ) ) ( not ( = ?auto_635570 ?auto_635576 ) ) ( not ( = ?auto_635571 ?auto_635572 ) ) ( not ( = ?auto_635571 ?auto_635573 ) ) ( not ( = ?auto_635571 ?auto_635574 ) ) ( not ( = ?auto_635571 ?auto_635575 ) ) ( not ( = ?auto_635571 ?auto_635576 ) ) ( not ( = ?auto_635572 ?auto_635573 ) ) ( not ( = ?auto_635572 ?auto_635574 ) ) ( not ( = ?auto_635572 ?auto_635575 ) ) ( not ( = ?auto_635572 ?auto_635576 ) ) ( not ( = ?auto_635573 ?auto_635574 ) ) ( not ( = ?auto_635573 ?auto_635575 ) ) ( not ( = ?auto_635573 ?auto_635576 ) ) ( not ( = ?auto_635574 ?auto_635575 ) ) ( not ( = ?auto_635574 ?auto_635576 ) ) ( not ( = ?auto_635575 ?auto_635576 ) ) ( ON ?auto_635574 ?auto_635575 ) ( ON ?auto_635573 ?auto_635574 ) ( ON ?auto_635572 ?auto_635573 ) ( ON ?auto_635571 ?auto_635572 ) ( ON ?auto_635570 ?auto_635571 ) ( CLEAR ?auto_635570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_635570 )
      ( MAKE-6PILE ?auto_635570 ?auto_635571 ?auto_635572 ?auto_635573 ?auto_635574 ?auto_635575 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_635597 - BLOCK
      ?auto_635598 - BLOCK
      ?auto_635599 - BLOCK
      ?auto_635600 - BLOCK
      ?auto_635601 - BLOCK
      ?auto_635602 - BLOCK
      ?auto_635603 - BLOCK
    )
    :vars
    (
      ?auto_635604 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_635602 ) ( ON ?auto_635603 ?auto_635604 ) ( CLEAR ?auto_635603 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_635597 ) ( ON ?auto_635598 ?auto_635597 ) ( ON ?auto_635599 ?auto_635598 ) ( ON ?auto_635600 ?auto_635599 ) ( ON ?auto_635601 ?auto_635600 ) ( ON ?auto_635602 ?auto_635601 ) ( not ( = ?auto_635597 ?auto_635598 ) ) ( not ( = ?auto_635597 ?auto_635599 ) ) ( not ( = ?auto_635597 ?auto_635600 ) ) ( not ( = ?auto_635597 ?auto_635601 ) ) ( not ( = ?auto_635597 ?auto_635602 ) ) ( not ( = ?auto_635597 ?auto_635603 ) ) ( not ( = ?auto_635597 ?auto_635604 ) ) ( not ( = ?auto_635598 ?auto_635599 ) ) ( not ( = ?auto_635598 ?auto_635600 ) ) ( not ( = ?auto_635598 ?auto_635601 ) ) ( not ( = ?auto_635598 ?auto_635602 ) ) ( not ( = ?auto_635598 ?auto_635603 ) ) ( not ( = ?auto_635598 ?auto_635604 ) ) ( not ( = ?auto_635599 ?auto_635600 ) ) ( not ( = ?auto_635599 ?auto_635601 ) ) ( not ( = ?auto_635599 ?auto_635602 ) ) ( not ( = ?auto_635599 ?auto_635603 ) ) ( not ( = ?auto_635599 ?auto_635604 ) ) ( not ( = ?auto_635600 ?auto_635601 ) ) ( not ( = ?auto_635600 ?auto_635602 ) ) ( not ( = ?auto_635600 ?auto_635603 ) ) ( not ( = ?auto_635600 ?auto_635604 ) ) ( not ( = ?auto_635601 ?auto_635602 ) ) ( not ( = ?auto_635601 ?auto_635603 ) ) ( not ( = ?auto_635601 ?auto_635604 ) ) ( not ( = ?auto_635602 ?auto_635603 ) ) ( not ( = ?auto_635602 ?auto_635604 ) ) ( not ( = ?auto_635603 ?auto_635604 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_635603 ?auto_635604 )
      ( !STACK ?auto_635603 ?auto_635602 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_635627 - BLOCK
      ?auto_635628 - BLOCK
      ?auto_635629 - BLOCK
      ?auto_635630 - BLOCK
      ?auto_635631 - BLOCK
      ?auto_635632 - BLOCK
      ?auto_635633 - BLOCK
    )
    :vars
    (
      ?auto_635634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635633 ?auto_635634 ) ( ON-TABLE ?auto_635627 ) ( ON ?auto_635628 ?auto_635627 ) ( ON ?auto_635629 ?auto_635628 ) ( ON ?auto_635630 ?auto_635629 ) ( ON ?auto_635631 ?auto_635630 ) ( not ( = ?auto_635627 ?auto_635628 ) ) ( not ( = ?auto_635627 ?auto_635629 ) ) ( not ( = ?auto_635627 ?auto_635630 ) ) ( not ( = ?auto_635627 ?auto_635631 ) ) ( not ( = ?auto_635627 ?auto_635632 ) ) ( not ( = ?auto_635627 ?auto_635633 ) ) ( not ( = ?auto_635627 ?auto_635634 ) ) ( not ( = ?auto_635628 ?auto_635629 ) ) ( not ( = ?auto_635628 ?auto_635630 ) ) ( not ( = ?auto_635628 ?auto_635631 ) ) ( not ( = ?auto_635628 ?auto_635632 ) ) ( not ( = ?auto_635628 ?auto_635633 ) ) ( not ( = ?auto_635628 ?auto_635634 ) ) ( not ( = ?auto_635629 ?auto_635630 ) ) ( not ( = ?auto_635629 ?auto_635631 ) ) ( not ( = ?auto_635629 ?auto_635632 ) ) ( not ( = ?auto_635629 ?auto_635633 ) ) ( not ( = ?auto_635629 ?auto_635634 ) ) ( not ( = ?auto_635630 ?auto_635631 ) ) ( not ( = ?auto_635630 ?auto_635632 ) ) ( not ( = ?auto_635630 ?auto_635633 ) ) ( not ( = ?auto_635630 ?auto_635634 ) ) ( not ( = ?auto_635631 ?auto_635632 ) ) ( not ( = ?auto_635631 ?auto_635633 ) ) ( not ( = ?auto_635631 ?auto_635634 ) ) ( not ( = ?auto_635632 ?auto_635633 ) ) ( not ( = ?auto_635632 ?auto_635634 ) ) ( not ( = ?auto_635633 ?auto_635634 ) ) ( CLEAR ?auto_635631 ) ( ON ?auto_635632 ?auto_635633 ) ( CLEAR ?auto_635632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_635627 ?auto_635628 ?auto_635629 ?auto_635630 ?auto_635631 ?auto_635632 )
      ( MAKE-7PILE ?auto_635627 ?auto_635628 ?auto_635629 ?auto_635630 ?auto_635631 ?auto_635632 ?auto_635633 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_635657 - BLOCK
      ?auto_635658 - BLOCK
      ?auto_635659 - BLOCK
      ?auto_635660 - BLOCK
      ?auto_635661 - BLOCK
      ?auto_635662 - BLOCK
      ?auto_635663 - BLOCK
    )
    :vars
    (
      ?auto_635664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635663 ?auto_635664 ) ( ON-TABLE ?auto_635657 ) ( ON ?auto_635658 ?auto_635657 ) ( ON ?auto_635659 ?auto_635658 ) ( ON ?auto_635660 ?auto_635659 ) ( not ( = ?auto_635657 ?auto_635658 ) ) ( not ( = ?auto_635657 ?auto_635659 ) ) ( not ( = ?auto_635657 ?auto_635660 ) ) ( not ( = ?auto_635657 ?auto_635661 ) ) ( not ( = ?auto_635657 ?auto_635662 ) ) ( not ( = ?auto_635657 ?auto_635663 ) ) ( not ( = ?auto_635657 ?auto_635664 ) ) ( not ( = ?auto_635658 ?auto_635659 ) ) ( not ( = ?auto_635658 ?auto_635660 ) ) ( not ( = ?auto_635658 ?auto_635661 ) ) ( not ( = ?auto_635658 ?auto_635662 ) ) ( not ( = ?auto_635658 ?auto_635663 ) ) ( not ( = ?auto_635658 ?auto_635664 ) ) ( not ( = ?auto_635659 ?auto_635660 ) ) ( not ( = ?auto_635659 ?auto_635661 ) ) ( not ( = ?auto_635659 ?auto_635662 ) ) ( not ( = ?auto_635659 ?auto_635663 ) ) ( not ( = ?auto_635659 ?auto_635664 ) ) ( not ( = ?auto_635660 ?auto_635661 ) ) ( not ( = ?auto_635660 ?auto_635662 ) ) ( not ( = ?auto_635660 ?auto_635663 ) ) ( not ( = ?auto_635660 ?auto_635664 ) ) ( not ( = ?auto_635661 ?auto_635662 ) ) ( not ( = ?auto_635661 ?auto_635663 ) ) ( not ( = ?auto_635661 ?auto_635664 ) ) ( not ( = ?auto_635662 ?auto_635663 ) ) ( not ( = ?auto_635662 ?auto_635664 ) ) ( not ( = ?auto_635663 ?auto_635664 ) ) ( ON ?auto_635662 ?auto_635663 ) ( CLEAR ?auto_635660 ) ( ON ?auto_635661 ?auto_635662 ) ( CLEAR ?auto_635661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_635657 ?auto_635658 ?auto_635659 ?auto_635660 ?auto_635661 )
      ( MAKE-7PILE ?auto_635657 ?auto_635658 ?auto_635659 ?auto_635660 ?auto_635661 ?auto_635662 ?auto_635663 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_635687 - BLOCK
      ?auto_635688 - BLOCK
      ?auto_635689 - BLOCK
      ?auto_635690 - BLOCK
      ?auto_635691 - BLOCK
      ?auto_635692 - BLOCK
      ?auto_635693 - BLOCK
    )
    :vars
    (
      ?auto_635694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635693 ?auto_635694 ) ( ON-TABLE ?auto_635687 ) ( ON ?auto_635688 ?auto_635687 ) ( ON ?auto_635689 ?auto_635688 ) ( not ( = ?auto_635687 ?auto_635688 ) ) ( not ( = ?auto_635687 ?auto_635689 ) ) ( not ( = ?auto_635687 ?auto_635690 ) ) ( not ( = ?auto_635687 ?auto_635691 ) ) ( not ( = ?auto_635687 ?auto_635692 ) ) ( not ( = ?auto_635687 ?auto_635693 ) ) ( not ( = ?auto_635687 ?auto_635694 ) ) ( not ( = ?auto_635688 ?auto_635689 ) ) ( not ( = ?auto_635688 ?auto_635690 ) ) ( not ( = ?auto_635688 ?auto_635691 ) ) ( not ( = ?auto_635688 ?auto_635692 ) ) ( not ( = ?auto_635688 ?auto_635693 ) ) ( not ( = ?auto_635688 ?auto_635694 ) ) ( not ( = ?auto_635689 ?auto_635690 ) ) ( not ( = ?auto_635689 ?auto_635691 ) ) ( not ( = ?auto_635689 ?auto_635692 ) ) ( not ( = ?auto_635689 ?auto_635693 ) ) ( not ( = ?auto_635689 ?auto_635694 ) ) ( not ( = ?auto_635690 ?auto_635691 ) ) ( not ( = ?auto_635690 ?auto_635692 ) ) ( not ( = ?auto_635690 ?auto_635693 ) ) ( not ( = ?auto_635690 ?auto_635694 ) ) ( not ( = ?auto_635691 ?auto_635692 ) ) ( not ( = ?auto_635691 ?auto_635693 ) ) ( not ( = ?auto_635691 ?auto_635694 ) ) ( not ( = ?auto_635692 ?auto_635693 ) ) ( not ( = ?auto_635692 ?auto_635694 ) ) ( not ( = ?auto_635693 ?auto_635694 ) ) ( ON ?auto_635692 ?auto_635693 ) ( ON ?auto_635691 ?auto_635692 ) ( CLEAR ?auto_635689 ) ( ON ?auto_635690 ?auto_635691 ) ( CLEAR ?auto_635690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_635687 ?auto_635688 ?auto_635689 ?auto_635690 )
      ( MAKE-7PILE ?auto_635687 ?auto_635688 ?auto_635689 ?auto_635690 ?auto_635691 ?auto_635692 ?auto_635693 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_635717 - BLOCK
      ?auto_635718 - BLOCK
      ?auto_635719 - BLOCK
      ?auto_635720 - BLOCK
      ?auto_635721 - BLOCK
      ?auto_635722 - BLOCK
      ?auto_635723 - BLOCK
    )
    :vars
    (
      ?auto_635724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635723 ?auto_635724 ) ( ON-TABLE ?auto_635717 ) ( ON ?auto_635718 ?auto_635717 ) ( not ( = ?auto_635717 ?auto_635718 ) ) ( not ( = ?auto_635717 ?auto_635719 ) ) ( not ( = ?auto_635717 ?auto_635720 ) ) ( not ( = ?auto_635717 ?auto_635721 ) ) ( not ( = ?auto_635717 ?auto_635722 ) ) ( not ( = ?auto_635717 ?auto_635723 ) ) ( not ( = ?auto_635717 ?auto_635724 ) ) ( not ( = ?auto_635718 ?auto_635719 ) ) ( not ( = ?auto_635718 ?auto_635720 ) ) ( not ( = ?auto_635718 ?auto_635721 ) ) ( not ( = ?auto_635718 ?auto_635722 ) ) ( not ( = ?auto_635718 ?auto_635723 ) ) ( not ( = ?auto_635718 ?auto_635724 ) ) ( not ( = ?auto_635719 ?auto_635720 ) ) ( not ( = ?auto_635719 ?auto_635721 ) ) ( not ( = ?auto_635719 ?auto_635722 ) ) ( not ( = ?auto_635719 ?auto_635723 ) ) ( not ( = ?auto_635719 ?auto_635724 ) ) ( not ( = ?auto_635720 ?auto_635721 ) ) ( not ( = ?auto_635720 ?auto_635722 ) ) ( not ( = ?auto_635720 ?auto_635723 ) ) ( not ( = ?auto_635720 ?auto_635724 ) ) ( not ( = ?auto_635721 ?auto_635722 ) ) ( not ( = ?auto_635721 ?auto_635723 ) ) ( not ( = ?auto_635721 ?auto_635724 ) ) ( not ( = ?auto_635722 ?auto_635723 ) ) ( not ( = ?auto_635722 ?auto_635724 ) ) ( not ( = ?auto_635723 ?auto_635724 ) ) ( ON ?auto_635722 ?auto_635723 ) ( ON ?auto_635721 ?auto_635722 ) ( ON ?auto_635720 ?auto_635721 ) ( CLEAR ?auto_635718 ) ( ON ?auto_635719 ?auto_635720 ) ( CLEAR ?auto_635719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_635717 ?auto_635718 ?auto_635719 )
      ( MAKE-7PILE ?auto_635717 ?auto_635718 ?auto_635719 ?auto_635720 ?auto_635721 ?auto_635722 ?auto_635723 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_635747 - BLOCK
      ?auto_635748 - BLOCK
      ?auto_635749 - BLOCK
      ?auto_635750 - BLOCK
      ?auto_635751 - BLOCK
      ?auto_635752 - BLOCK
      ?auto_635753 - BLOCK
    )
    :vars
    (
      ?auto_635754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635753 ?auto_635754 ) ( ON-TABLE ?auto_635747 ) ( not ( = ?auto_635747 ?auto_635748 ) ) ( not ( = ?auto_635747 ?auto_635749 ) ) ( not ( = ?auto_635747 ?auto_635750 ) ) ( not ( = ?auto_635747 ?auto_635751 ) ) ( not ( = ?auto_635747 ?auto_635752 ) ) ( not ( = ?auto_635747 ?auto_635753 ) ) ( not ( = ?auto_635747 ?auto_635754 ) ) ( not ( = ?auto_635748 ?auto_635749 ) ) ( not ( = ?auto_635748 ?auto_635750 ) ) ( not ( = ?auto_635748 ?auto_635751 ) ) ( not ( = ?auto_635748 ?auto_635752 ) ) ( not ( = ?auto_635748 ?auto_635753 ) ) ( not ( = ?auto_635748 ?auto_635754 ) ) ( not ( = ?auto_635749 ?auto_635750 ) ) ( not ( = ?auto_635749 ?auto_635751 ) ) ( not ( = ?auto_635749 ?auto_635752 ) ) ( not ( = ?auto_635749 ?auto_635753 ) ) ( not ( = ?auto_635749 ?auto_635754 ) ) ( not ( = ?auto_635750 ?auto_635751 ) ) ( not ( = ?auto_635750 ?auto_635752 ) ) ( not ( = ?auto_635750 ?auto_635753 ) ) ( not ( = ?auto_635750 ?auto_635754 ) ) ( not ( = ?auto_635751 ?auto_635752 ) ) ( not ( = ?auto_635751 ?auto_635753 ) ) ( not ( = ?auto_635751 ?auto_635754 ) ) ( not ( = ?auto_635752 ?auto_635753 ) ) ( not ( = ?auto_635752 ?auto_635754 ) ) ( not ( = ?auto_635753 ?auto_635754 ) ) ( ON ?auto_635752 ?auto_635753 ) ( ON ?auto_635751 ?auto_635752 ) ( ON ?auto_635750 ?auto_635751 ) ( ON ?auto_635749 ?auto_635750 ) ( CLEAR ?auto_635747 ) ( ON ?auto_635748 ?auto_635749 ) ( CLEAR ?auto_635748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_635747 ?auto_635748 )
      ( MAKE-7PILE ?auto_635747 ?auto_635748 ?auto_635749 ?auto_635750 ?auto_635751 ?auto_635752 ?auto_635753 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_635777 - BLOCK
      ?auto_635778 - BLOCK
      ?auto_635779 - BLOCK
      ?auto_635780 - BLOCK
      ?auto_635781 - BLOCK
      ?auto_635782 - BLOCK
      ?auto_635783 - BLOCK
    )
    :vars
    (
      ?auto_635784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635783 ?auto_635784 ) ( not ( = ?auto_635777 ?auto_635778 ) ) ( not ( = ?auto_635777 ?auto_635779 ) ) ( not ( = ?auto_635777 ?auto_635780 ) ) ( not ( = ?auto_635777 ?auto_635781 ) ) ( not ( = ?auto_635777 ?auto_635782 ) ) ( not ( = ?auto_635777 ?auto_635783 ) ) ( not ( = ?auto_635777 ?auto_635784 ) ) ( not ( = ?auto_635778 ?auto_635779 ) ) ( not ( = ?auto_635778 ?auto_635780 ) ) ( not ( = ?auto_635778 ?auto_635781 ) ) ( not ( = ?auto_635778 ?auto_635782 ) ) ( not ( = ?auto_635778 ?auto_635783 ) ) ( not ( = ?auto_635778 ?auto_635784 ) ) ( not ( = ?auto_635779 ?auto_635780 ) ) ( not ( = ?auto_635779 ?auto_635781 ) ) ( not ( = ?auto_635779 ?auto_635782 ) ) ( not ( = ?auto_635779 ?auto_635783 ) ) ( not ( = ?auto_635779 ?auto_635784 ) ) ( not ( = ?auto_635780 ?auto_635781 ) ) ( not ( = ?auto_635780 ?auto_635782 ) ) ( not ( = ?auto_635780 ?auto_635783 ) ) ( not ( = ?auto_635780 ?auto_635784 ) ) ( not ( = ?auto_635781 ?auto_635782 ) ) ( not ( = ?auto_635781 ?auto_635783 ) ) ( not ( = ?auto_635781 ?auto_635784 ) ) ( not ( = ?auto_635782 ?auto_635783 ) ) ( not ( = ?auto_635782 ?auto_635784 ) ) ( not ( = ?auto_635783 ?auto_635784 ) ) ( ON ?auto_635782 ?auto_635783 ) ( ON ?auto_635781 ?auto_635782 ) ( ON ?auto_635780 ?auto_635781 ) ( ON ?auto_635779 ?auto_635780 ) ( ON ?auto_635778 ?auto_635779 ) ( ON ?auto_635777 ?auto_635778 ) ( CLEAR ?auto_635777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_635777 )
      ( MAKE-7PILE ?auto_635777 ?auto_635778 ?auto_635779 ?auto_635780 ?auto_635781 ?auto_635782 ?auto_635783 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_635808 - BLOCK
      ?auto_635809 - BLOCK
      ?auto_635810 - BLOCK
      ?auto_635811 - BLOCK
      ?auto_635812 - BLOCK
      ?auto_635813 - BLOCK
      ?auto_635814 - BLOCK
      ?auto_635815 - BLOCK
    )
    :vars
    (
      ?auto_635816 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_635814 ) ( ON ?auto_635815 ?auto_635816 ) ( CLEAR ?auto_635815 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_635808 ) ( ON ?auto_635809 ?auto_635808 ) ( ON ?auto_635810 ?auto_635809 ) ( ON ?auto_635811 ?auto_635810 ) ( ON ?auto_635812 ?auto_635811 ) ( ON ?auto_635813 ?auto_635812 ) ( ON ?auto_635814 ?auto_635813 ) ( not ( = ?auto_635808 ?auto_635809 ) ) ( not ( = ?auto_635808 ?auto_635810 ) ) ( not ( = ?auto_635808 ?auto_635811 ) ) ( not ( = ?auto_635808 ?auto_635812 ) ) ( not ( = ?auto_635808 ?auto_635813 ) ) ( not ( = ?auto_635808 ?auto_635814 ) ) ( not ( = ?auto_635808 ?auto_635815 ) ) ( not ( = ?auto_635808 ?auto_635816 ) ) ( not ( = ?auto_635809 ?auto_635810 ) ) ( not ( = ?auto_635809 ?auto_635811 ) ) ( not ( = ?auto_635809 ?auto_635812 ) ) ( not ( = ?auto_635809 ?auto_635813 ) ) ( not ( = ?auto_635809 ?auto_635814 ) ) ( not ( = ?auto_635809 ?auto_635815 ) ) ( not ( = ?auto_635809 ?auto_635816 ) ) ( not ( = ?auto_635810 ?auto_635811 ) ) ( not ( = ?auto_635810 ?auto_635812 ) ) ( not ( = ?auto_635810 ?auto_635813 ) ) ( not ( = ?auto_635810 ?auto_635814 ) ) ( not ( = ?auto_635810 ?auto_635815 ) ) ( not ( = ?auto_635810 ?auto_635816 ) ) ( not ( = ?auto_635811 ?auto_635812 ) ) ( not ( = ?auto_635811 ?auto_635813 ) ) ( not ( = ?auto_635811 ?auto_635814 ) ) ( not ( = ?auto_635811 ?auto_635815 ) ) ( not ( = ?auto_635811 ?auto_635816 ) ) ( not ( = ?auto_635812 ?auto_635813 ) ) ( not ( = ?auto_635812 ?auto_635814 ) ) ( not ( = ?auto_635812 ?auto_635815 ) ) ( not ( = ?auto_635812 ?auto_635816 ) ) ( not ( = ?auto_635813 ?auto_635814 ) ) ( not ( = ?auto_635813 ?auto_635815 ) ) ( not ( = ?auto_635813 ?auto_635816 ) ) ( not ( = ?auto_635814 ?auto_635815 ) ) ( not ( = ?auto_635814 ?auto_635816 ) ) ( not ( = ?auto_635815 ?auto_635816 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_635815 ?auto_635816 )
      ( !STACK ?auto_635815 ?auto_635814 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_635842 - BLOCK
      ?auto_635843 - BLOCK
      ?auto_635844 - BLOCK
      ?auto_635845 - BLOCK
      ?auto_635846 - BLOCK
      ?auto_635847 - BLOCK
      ?auto_635848 - BLOCK
      ?auto_635849 - BLOCK
    )
    :vars
    (
      ?auto_635850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635849 ?auto_635850 ) ( ON-TABLE ?auto_635842 ) ( ON ?auto_635843 ?auto_635842 ) ( ON ?auto_635844 ?auto_635843 ) ( ON ?auto_635845 ?auto_635844 ) ( ON ?auto_635846 ?auto_635845 ) ( ON ?auto_635847 ?auto_635846 ) ( not ( = ?auto_635842 ?auto_635843 ) ) ( not ( = ?auto_635842 ?auto_635844 ) ) ( not ( = ?auto_635842 ?auto_635845 ) ) ( not ( = ?auto_635842 ?auto_635846 ) ) ( not ( = ?auto_635842 ?auto_635847 ) ) ( not ( = ?auto_635842 ?auto_635848 ) ) ( not ( = ?auto_635842 ?auto_635849 ) ) ( not ( = ?auto_635842 ?auto_635850 ) ) ( not ( = ?auto_635843 ?auto_635844 ) ) ( not ( = ?auto_635843 ?auto_635845 ) ) ( not ( = ?auto_635843 ?auto_635846 ) ) ( not ( = ?auto_635843 ?auto_635847 ) ) ( not ( = ?auto_635843 ?auto_635848 ) ) ( not ( = ?auto_635843 ?auto_635849 ) ) ( not ( = ?auto_635843 ?auto_635850 ) ) ( not ( = ?auto_635844 ?auto_635845 ) ) ( not ( = ?auto_635844 ?auto_635846 ) ) ( not ( = ?auto_635844 ?auto_635847 ) ) ( not ( = ?auto_635844 ?auto_635848 ) ) ( not ( = ?auto_635844 ?auto_635849 ) ) ( not ( = ?auto_635844 ?auto_635850 ) ) ( not ( = ?auto_635845 ?auto_635846 ) ) ( not ( = ?auto_635845 ?auto_635847 ) ) ( not ( = ?auto_635845 ?auto_635848 ) ) ( not ( = ?auto_635845 ?auto_635849 ) ) ( not ( = ?auto_635845 ?auto_635850 ) ) ( not ( = ?auto_635846 ?auto_635847 ) ) ( not ( = ?auto_635846 ?auto_635848 ) ) ( not ( = ?auto_635846 ?auto_635849 ) ) ( not ( = ?auto_635846 ?auto_635850 ) ) ( not ( = ?auto_635847 ?auto_635848 ) ) ( not ( = ?auto_635847 ?auto_635849 ) ) ( not ( = ?auto_635847 ?auto_635850 ) ) ( not ( = ?auto_635848 ?auto_635849 ) ) ( not ( = ?auto_635848 ?auto_635850 ) ) ( not ( = ?auto_635849 ?auto_635850 ) ) ( CLEAR ?auto_635847 ) ( ON ?auto_635848 ?auto_635849 ) ( CLEAR ?auto_635848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_635842 ?auto_635843 ?auto_635844 ?auto_635845 ?auto_635846 ?auto_635847 ?auto_635848 )
      ( MAKE-8PILE ?auto_635842 ?auto_635843 ?auto_635844 ?auto_635845 ?auto_635846 ?auto_635847 ?auto_635848 ?auto_635849 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_635876 - BLOCK
      ?auto_635877 - BLOCK
      ?auto_635878 - BLOCK
      ?auto_635879 - BLOCK
      ?auto_635880 - BLOCK
      ?auto_635881 - BLOCK
      ?auto_635882 - BLOCK
      ?auto_635883 - BLOCK
    )
    :vars
    (
      ?auto_635884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635883 ?auto_635884 ) ( ON-TABLE ?auto_635876 ) ( ON ?auto_635877 ?auto_635876 ) ( ON ?auto_635878 ?auto_635877 ) ( ON ?auto_635879 ?auto_635878 ) ( ON ?auto_635880 ?auto_635879 ) ( not ( = ?auto_635876 ?auto_635877 ) ) ( not ( = ?auto_635876 ?auto_635878 ) ) ( not ( = ?auto_635876 ?auto_635879 ) ) ( not ( = ?auto_635876 ?auto_635880 ) ) ( not ( = ?auto_635876 ?auto_635881 ) ) ( not ( = ?auto_635876 ?auto_635882 ) ) ( not ( = ?auto_635876 ?auto_635883 ) ) ( not ( = ?auto_635876 ?auto_635884 ) ) ( not ( = ?auto_635877 ?auto_635878 ) ) ( not ( = ?auto_635877 ?auto_635879 ) ) ( not ( = ?auto_635877 ?auto_635880 ) ) ( not ( = ?auto_635877 ?auto_635881 ) ) ( not ( = ?auto_635877 ?auto_635882 ) ) ( not ( = ?auto_635877 ?auto_635883 ) ) ( not ( = ?auto_635877 ?auto_635884 ) ) ( not ( = ?auto_635878 ?auto_635879 ) ) ( not ( = ?auto_635878 ?auto_635880 ) ) ( not ( = ?auto_635878 ?auto_635881 ) ) ( not ( = ?auto_635878 ?auto_635882 ) ) ( not ( = ?auto_635878 ?auto_635883 ) ) ( not ( = ?auto_635878 ?auto_635884 ) ) ( not ( = ?auto_635879 ?auto_635880 ) ) ( not ( = ?auto_635879 ?auto_635881 ) ) ( not ( = ?auto_635879 ?auto_635882 ) ) ( not ( = ?auto_635879 ?auto_635883 ) ) ( not ( = ?auto_635879 ?auto_635884 ) ) ( not ( = ?auto_635880 ?auto_635881 ) ) ( not ( = ?auto_635880 ?auto_635882 ) ) ( not ( = ?auto_635880 ?auto_635883 ) ) ( not ( = ?auto_635880 ?auto_635884 ) ) ( not ( = ?auto_635881 ?auto_635882 ) ) ( not ( = ?auto_635881 ?auto_635883 ) ) ( not ( = ?auto_635881 ?auto_635884 ) ) ( not ( = ?auto_635882 ?auto_635883 ) ) ( not ( = ?auto_635882 ?auto_635884 ) ) ( not ( = ?auto_635883 ?auto_635884 ) ) ( ON ?auto_635882 ?auto_635883 ) ( CLEAR ?auto_635880 ) ( ON ?auto_635881 ?auto_635882 ) ( CLEAR ?auto_635881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_635876 ?auto_635877 ?auto_635878 ?auto_635879 ?auto_635880 ?auto_635881 )
      ( MAKE-8PILE ?auto_635876 ?auto_635877 ?auto_635878 ?auto_635879 ?auto_635880 ?auto_635881 ?auto_635882 ?auto_635883 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_635910 - BLOCK
      ?auto_635911 - BLOCK
      ?auto_635912 - BLOCK
      ?auto_635913 - BLOCK
      ?auto_635914 - BLOCK
      ?auto_635915 - BLOCK
      ?auto_635916 - BLOCK
      ?auto_635917 - BLOCK
    )
    :vars
    (
      ?auto_635918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635917 ?auto_635918 ) ( ON-TABLE ?auto_635910 ) ( ON ?auto_635911 ?auto_635910 ) ( ON ?auto_635912 ?auto_635911 ) ( ON ?auto_635913 ?auto_635912 ) ( not ( = ?auto_635910 ?auto_635911 ) ) ( not ( = ?auto_635910 ?auto_635912 ) ) ( not ( = ?auto_635910 ?auto_635913 ) ) ( not ( = ?auto_635910 ?auto_635914 ) ) ( not ( = ?auto_635910 ?auto_635915 ) ) ( not ( = ?auto_635910 ?auto_635916 ) ) ( not ( = ?auto_635910 ?auto_635917 ) ) ( not ( = ?auto_635910 ?auto_635918 ) ) ( not ( = ?auto_635911 ?auto_635912 ) ) ( not ( = ?auto_635911 ?auto_635913 ) ) ( not ( = ?auto_635911 ?auto_635914 ) ) ( not ( = ?auto_635911 ?auto_635915 ) ) ( not ( = ?auto_635911 ?auto_635916 ) ) ( not ( = ?auto_635911 ?auto_635917 ) ) ( not ( = ?auto_635911 ?auto_635918 ) ) ( not ( = ?auto_635912 ?auto_635913 ) ) ( not ( = ?auto_635912 ?auto_635914 ) ) ( not ( = ?auto_635912 ?auto_635915 ) ) ( not ( = ?auto_635912 ?auto_635916 ) ) ( not ( = ?auto_635912 ?auto_635917 ) ) ( not ( = ?auto_635912 ?auto_635918 ) ) ( not ( = ?auto_635913 ?auto_635914 ) ) ( not ( = ?auto_635913 ?auto_635915 ) ) ( not ( = ?auto_635913 ?auto_635916 ) ) ( not ( = ?auto_635913 ?auto_635917 ) ) ( not ( = ?auto_635913 ?auto_635918 ) ) ( not ( = ?auto_635914 ?auto_635915 ) ) ( not ( = ?auto_635914 ?auto_635916 ) ) ( not ( = ?auto_635914 ?auto_635917 ) ) ( not ( = ?auto_635914 ?auto_635918 ) ) ( not ( = ?auto_635915 ?auto_635916 ) ) ( not ( = ?auto_635915 ?auto_635917 ) ) ( not ( = ?auto_635915 ?auto_635918 ) ) ( not ( = ?auto_635916 ?auto_635917 ) ) ( not ( = ?auto_635916 ?auto_635918 ) ) ( not ( = ?auto_635917 ?auto_635918 ) ) ( ON ?auto_635916 ?auto_635917 ) ( ON ?auto_635915 ?auto_635916 ) ( CLEAR ?auto_635913 ) ( ON ?auto_635914 ?auto_635915 ) ( CLEAR ?auto_635914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_635910 ?auto_635911 ?auto_635912 ?auto_635913 ?auto_635914 )
      ( MAKE-8PILE ?auto_635910 ?auto_635911 ?auto_635912 ?auto_635913 ?auto_635914 ?auto_635915 ?auto_635916 ?auto_635917 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_635944 - BLOCK
      ?auto_635945 - BLOCK
      ?auto_635946 - BLOCK
      ?auto_635947 - BLOCK
      ?auto_635948 - BLOCK
      ?auto_635949 - BLOCK
      ?auto_635950 - BLOCK
      ?auto_635951 - BLOCK
    )
    :vars
    (
      ?auto_635952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635951 ?auto_635952 ) ( ON-TABLE ?auto_635944 ) ( ON ?auto_635945 ?auto_635944 ) ( ON ?auto_635946 ?auto_635945 ) ( not ( = ?auto_635944 ?auto_635945 ) ) ( not ( = ?auto_635944 ?auto_635946 ) ) ( not ( = ?auto_635944 ?auto_635947 ) ) ( not ( = ?auto_635944 ?auto_635948 ) ) ( not ( = ?auto_635944 ?auto_635949 ) ) ( not ( = ?auto_635944 ?auto_635950 ) ) ( not ( = ?auto_635944 ?auto_635951 ) ) ( not ( = ?auto_635944 ?auto_635952 ) ) ( not ( = ?auto_635945 ?auto_635946 ) ) ( not ( = ?auto_635945 ?auto_635947 ) ) ( not ( = ?auto_635945 ?auto_635948 ) ) ( not ( = ?auto_635945 ?auto_635949 ) ) ( not ( = ?auto_635945 ?auto_635950 ) ) ( not ( = ?auto_635945 ?auto_635951 ) ) ( not ( = ?auto_635945 ?auto_635952 ) ) ( not ( = ?auto_635946 ?auto_635947 ) ) ( not ( = ?auto_635946 ?auto_635948 ) ) ( not ( = ?auto_635946 ?auto_635949 ) ) ( not ( = ?auto_635946 ?auto_635950 ) ) ( not ( = ?auto_635946 ?auto_635951 ) ) ( not ( = ?auto_635946 ?auto_635952 ) ) ( not ( = ?auto_635947 ?auto_635948 ) ) ( not ( = ?auto_635947 ?auto_635949 ) ) ( not ( = ?auto_635947 ?auto_635950 ) ) ( not ( = ?auto_635947 ?auto_635951 ) ) ( not ( = ?auto_635947 ?auto_635952 ) ) ( not ( = ?auto_635948 ?auto_635949 ) ) ( not ( = ?auto_635948 ?auto_635950 ) ) ( not ( = ?auto_635948 ?auto_635951 ) ) ( not ( = ?auto_635948 ?auto_635952 ) ) ( not ( = ?auto_635949 ?auto_635950 ) ) ( not ( = ?auto_635949 ?auto_635951 ) ) ( not ( = ?auto_635949 ?auto_635952 ) ) ( not ( = ?auto_635950 ?auto_635951 ) ) ( not ( = ?auto_635950 ?auto_635952 ) ) ( not ( = ?auto_635951 ?auto_635952 ) ) ( ON ?auto_635950 ?auto_635951 ) ( ON ?auto_635949 ?auto_635950 ) ( ON ?auto_635948 ?auto_635949 ) ( CLEAR ?auto_635946 ) ( ON ?auto_635947 ?auto_635948 ) ( CLEAR ?auto_635947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_635944 ?auto_635945 ?auto_635946 ?auto_635947 )
      ( MAKE-8PILE ?auto_635944 ?auto_635945 ?auto_635946 ?auto_635947 ?auto_635948 ?auto_635949 ?auto_635950 ?auto_635951 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_635978 - BLOCK
      ?auto_635979 - BLOCK
      ?auto_635980 - BLOCK
      ?auto_635981 - BLOCK
      ?auto_635982 - BLOCK
      ?auto_635983 - BLOCK
      ?auto_635984 - BLOCK
      ?auto_635985 - BLOCK
    )
    :vars
    (
      ?auto_635986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635985 ?auto_635986 ) ( ON-TABLE ?auto_635978 ) ( ON ?auto_635979 ?auto_635978 ) ( not ( = ?auto_635978 ?auto_635979 ) ) ( not ( = ?auto_635978 ?auto_635980 ) ) ( not ( = ?auto_635978 ?auto_635981 ) ) ( not ( = ?auto_635978 ?auto_635982 ) ) ( not ( = ?auto_635978 ?auto_635983 ) ) ( not ( = ?auto_635978 ?auto_635984 ) ) ( not ( = ?auto_635978 ?auto_635985 ) ) ( not ( = ?auto_635978 ?auto_635986 ) ) ( not ( = ?auto_635979 ?auto_635980 ) ) ( not ( = ?auto_635979 ?auto_635981 ) ) ( not ( = ?auto_635979 ?auto_635982 ) ) ( not ( = ?auto_635979 ?auto_635983 ) ) ( not ( = ?auto_635979 ?auto_635984 ) ) ( not ( = ?auto_635979 ?auto_635985 ) ) ( not ( = ?auto_635979 ?auto_635986 ) ) ( not ( = ?auto_635980 ?auto_635981 ) ) ( not ( = ?auto_635980 ?auto_635982 ) ) ( not ( = ?auto_635980 ?auto_635983 ) ) ( not ( = ?auto_635980 ?auto_635984 ) ) ( not ( = ?auto_635980 ?auto_635985 ) ) ( not ( = ?auto_635980 ?auto_635986 ) ) ( not ( = ?auto_635981 ?auto_635982 ) ) ( not ( = ?auto_635981 ?auto_635983 ) ) ( not ( = ?auto_635981 ?auto_635984 ) ) ( not ( = ?auto_635981 ?auto_635985 ) ) ( not ( = ?auto_635981 ?auto_635986 ) ) ( not ( = ?auto_635982 ?auto_635983 ) ) ( not ( = ?auto_635982 ?auto_635984 ) ) ( not ( = ?auto_635982 ?auto_635985 ) ) ( not ( = ?auto_635982 ?auto_635986 ) ) ( not ( = ?auto_635983 ?auto_635984 ) ) ( not ( = ?auto_635983 ?auto_635985 ) ) ( not ( = ?auto_635983 ?auto_635986 ) ) ( not ( = ?auto_635984 ?auto_635985 ) ) ( not ( = ?auto_635984 ?auto_635986 ) ) ( not ( = ?auto_635985 ?auto_635986 ) ) ( ON ?auto_635984 ?auto_635985 ) ( ON ?auto_635983 ?auto_635984 ) ( ON ?auto_635982 ?auto_635983 ) ( ON ?auto_635981 ?auto_635982 ) ( CLEAR ?auto_635979 ) ( ON ?auto_635980 ?auto_635981 ) ( CLEAR ?auto_635980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_635978 ?auto_635979 ?auto_635980 )
      ( MAKE-8PILE ?auto_635978 ?auto_635979 ?auto_635980 ?auto_635981 ?auto_635982 ?auto_635983 ?auto_635984 ?auto_635985 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_636012 - BLOCK
      ?auto_636013 - BLOCK
      ?auto_636014 - BLOCK
      ?auto_636015 - BLOCK
      ?auto_636016 - BLOCK
      ?auto_636017 - BLOCK
      ?auto_636018 - BLOCK
      ?auto_636019 - BLOCK
    )
    :vars
    (
      ?auto_636020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_636019 ?auto_636020 ) ( ON-TABLE ?auto_636012 ) ( not ( = ?auto_636012 ?auto_636013 ) ) ( not ( = ?auto_636012 ?auto_636014 ) ) ( not ( = ?auto_636012 ?auto_636015 ) ) ( not ( = ?auto_636012 ?auto_636016 ) ) ( not ( = ?auto_636012 ?auto_636017 ) ) ( not ( = ?auto_636012 ?auto_636018 ) ) ( not ( = ?auto_636012 ?auto_636019 ) ) ( not ( = ?auto_636012 ?auto_636020 ) ) ( not ( = ?auto_636013 ?auto_636014 ) ) ( not ( = ?auto_636013 ?auto_636015 ) ) ( not ( = ?auto_636013 ?auto_636016 ) ) ( not ( = ?auto_636013 ?auto_636017 ) ) ( not ( = ?auto_636013 ?auto_636018 ) ) ( not ( = ?auto_636013 ?auto_636019 ) ) ( not ( = ?auto_636013 ?auto_636020 ) ) ( not ( = ?auto_636014 ?auto_636015 ) ) ( not ( = ?auto_636014 ?auto_636016 ) ) ( not ( = ?auto_636014 ?auto_636017 ) ) ( not ( = ?auto_636014 ?auto_636018 ) ) ( not ( = ?auto_636014 ?auto_636019 ) ) ( not ( = ?auto_636014 ?auto_636020 ) ) ( not ( = ?auto_636015 ?auto_636016 ) ) ( not ( = ?auto_636015 ?auto_636017 ) ) ( not ( = ?auto_636015 ?auto_636018 ) ) ( not ( = ?auto_636015 ?auto_636019 ) ) ( not ( = ?auto_636015 ?auto_636020 ) ) ( not ( = ?auto_636016 ?auto_636017 ) ) ( not ( = ?auto_636016 ?auto_636018 ) ) ( not ( = ?auto_636016 ?auto_636019 ) ) ( not ( = ?auto_636016 ?auto_636020 ) ) ( not ( = ?auto_636017 ?auto_636018 ) ) ( not ( = ?auto_636017 ?auto_636019 ) ) ( not ( = ?auto_636017 ?auto_636020 ) ) ( not ( = ?auto_636018 ?auto_636019 ) ) ( not ( = ?auto_636018 ?auto_636020 ) ) ( not ( = ?auto_636019 ?auto_636020 ) ) ( ON ?auto_636018 ?auto_636019 ) ( ON ?auto_636017 ?auto_636018 ) ( ON ?auto_636016 ?auto_636017 ) ( ON ?auto_636015 ?auto_636016 ) ( ON ?auto_636014 ?auto_636015 ) ( CLEAR ?auto_636012 ) ( ON ?auto_636013 ?auto_636014 ) ( CLEAR ?auto_636013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_636012 ?auto_636013 )
      ( MAKE-8PILE ?auto_636012 ?auto_636013 ?auto_636014 ?auto_636015 ?auto_636016 ?auto_636017 ?auto_636018 ?auto_636019 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_636046 - BLOCK
      ?auto_636047 - BLOCK
      ?auto_636048 - BLOCK
      ?auto_636049 - BLOCK
      ?auto_636050 - BLOCK
      ?auto_636051 - BLOCK
      ?auto_636052 - BLOCK
      ?auto_636053 - BLOCK
    )
    :vars
    (
      ?auto_636054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_636053 ?auto_636054 ) ( not ( = ?auto_636046 ?auto_636047 ) ) ( not ( = ?auto_636046 ?auto_636048 ) ) ( not ( = ?auto_636046 ?auto_636049 ) ) ( not ( = ?auto_636046 ?auto_636050 ) ) ( not ( = ?auto_636046 ?auto_636051 ) ) ( not ( = ?auto_636046 ?auto_636052 ) ) ( not ( = ?auto_636046 ?auto_636053 ) ) ( not ( = ?auto_636046 ?auto_636054 ) ) ( not ( = ?auto_636047 ?auto_636048 ) ) ( not ( = ?auto_636047 ?auto_636049 ) ) ( not ( = ?auto_636047 ?auto_636050 ) ) ( not ( = ?auto_636047 ?auto_636051 ) ) ( not ( = ?auto_636047 ?auto_636052 ) ) ( not ( = ?auto_636047 ?auto_636053 ) ) ( not ( = ?auto_636047 ?auto_636054 ) ) ( not ( = ?auto_636048 ?auto_636049 ) ) ( not ( = ?auto_636048 ?auto_636050 ) ) ( not ( = ?auto_636048 ?auto_636051 ) ) ( not ( = ?auto_636048 ?auto_636052 ) ) ( not ( = ?auto_636048 ?auto_636053 ) ) ( not ( = ?auto_636048 ?auto_636054 ) ) ( not ( = ?auto_636049 ?auto_636050 ) ) ( not ( = ?auto_636049 ?auto_636051 ) ) ( not ( = ?auto_636049 ?auto_636052 ) ) ( not ( = ?auto_636049 ?auto_636053 ) ) ( not ( = ?auto_636049 ?auto_636054 ) ) ( not ( = ?auto_636050 ?auto_636051 ) ) ( not ( = ?auto_636050 ?auto_636052 ) ) ( not ( = ?auto_636050 ?auto_636053 ) ) ( not ( = ?auto_636050 ?auto_636054 ) ) ( not ( = ?auto_636051 ?auto_636052 ) ) ( not ( = ?auto_636051 ?auto_636053 ) ) ( not ( = ?auto_636051 ?auto_636054 ) ) ( not ( = ?auto_636052 ?auto_636053 ) ) ( not ( = ?auto_636052 ?auto_636054 ) ) ( not ( = ?auto_636053 ?auto_636054 ) ) ( ON ?auto_636052 ?auto_636053 ) ( ON ?auto_636051 ?auto_636052 ) ( ON ?auto_636050 ?auto_636051 ) ( ON ?auto_636049 ?auto_636050 ) ( ON ?auto_636048 ?auto_636049 ) ( ON ?auto_636047 ?auto_636048 ) ( ON ?auto_636046 ?auto_636047 ) ( CLEAR ?auto_636046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_636046 )
      ( MAKE-8PILE ?auto_636046 ?auto_636047 ?auto_636048 ?auto_636049 ?auto_636050 ?auto_636051 ?auto_636052 ?auto_636053 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_636081 - BLOCK
      ?auto_636082 - BLOCK
      ?auto_636083 - BLOCK
      ?auto_636084 - BLOCK
      ?auto_636085 - BLOCK
      ?auto_636086 - BLOCK
      ?auto_636087 - BLOCK
      ?auto_636088 - BLOCK
      ?auto_636089 - BLOCK
    )
    :vars
    (
      ?auto_636090 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_636088 ) ( ON ?auto_636089 ?auto_636090 ) ( CLEAR ?auto_636089 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_636081 ) ( ON ?auto_636082 ?auto_636081 ) ( ON ?auto_636083 ?auto_636082 ) ( ON ?auto_636084 ?auto_636083 ) ( ON ?auto_636085 ?auto_636084 ) ( ON ?auto_636086 ?auto_636085 ) ( ON ?auto_636087 ?auto_636086 ) ( ON ?auto_636088 ?auto_636087 ) ( not ( = ?auto_636081 ?auto_636082 ) ) ( not ( = ?auto_636081 ?auto_636083 ) ) ( not ( = ?auto_636081 ?auto_636084 ) ) ( not ( = ?auto_636081 ?auto_636085 ) ) ( not ( = ?auto_636081 ?auto_636086 ) ) ( not ( = ?auto_636081 ?auto_636087 ) ) ( not ( = ?auto_636081 ?auto_636088 ) ) ( not ( = ?auto_636081 ?auto_636089 ) ) ( not ( = ?auto_636081 ?auto_636090 ) ) ( not ( = ?auto_636082 ?auto_636083 ) ) ( not ( = ?auto_636082 ?auto_636084 ) ) ( not ( = ?auto_636082 ?auto_636085 ) ) ( not ( = ?auto_636082 ?auto_636086 ) ) ( not ( = ?auto_636082 ?auto_636087 ) ) ( not ( = ?auto_636082 ?auto_636088 ) ) ( not ( = ?auto_636082 ?auto_636089 ) ) ( not ( = ?auto_636082 ?auto_636090 ) ) ( not ( = ?auto_636083 ?auto_636084 ) ) ( not ( = ?auto_636083 ?auto_636085 ) ) ( not ( = ?auto_636083 ?auto_636086 ) ) ( not ( = ?auto_636083 ?auto_636087 ) ) ( not ( = ?auto_636083 ?auto_636088 ) ) ( not ( = ?auto_636083 ?auto_636089 ) ) ( not ( = ?auto_636083 ?auto_636090 ) ) ( not ( = ?auto_636084 ?auto_636085 ) ) ( not ( = ?auto_636084 ?auto_636086 ) ) ( not ( = ?auto_636084 ?auto_636087 ) ) ( not ( = ?auto_636084 ?auto_636088 ) ) ( not ( = ?auto_636084 ?auto_636089 ) ) ( not ( = ?auto_636084 ?auto_636090 ) ) ( not ( = ?auto_636085 ?auto_636086 ) ) ( not ( = ?auto_636085 ?auto_636087 ) ) ( not ( = ?auto_636085 ?auto_636088 ) ) ( not ( = ?auto_636085 ?auto_636089 ) ) ( not ( = ?auto_636085 ?auto_636090 ) ) ( not ( = ?auto_636086 ?auto_636087 ) ) ( not ( = ?auto_636086 ?auto_636088 ) ) ( not ( = ?auto_636086 ?auto_636089 ) ) ( not ( = ?auto_636086 ?auto_636090 ) ) ( not ( = ?auto_636087 ?auto_636088 ) ) ( not ( = ?auto_636087 ?auto_636089 ) ) ( not ( = ?auto_636087 ?auto_636090 ) ) ( not ( = ?auto_636088 ?auto_636089 ) ) ( not ( = ?auto_636088 ?auto_636090 ) ) ( not ( = ?auto_636089 ?auto_636090 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_636089 ?auto_636090 )
      ( !STACK ?auto_636089 ?auto_636088 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_636119 - BLOCK
      ?auto_636120 - BLOCK
      ?auto_636121 - BLOCK
      ?auto_636122 - BLOCK
      ?auto_636123 - BLOCK
      ?auto_636124 - BLOCK
      ?auto_636125 - BLOCK
      ?auto_636126 - BLOCK
      ?auto_636127 - BLOCK
    )
    :vars
    (
      ?auto_636128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_636127 ?auto_636128 ) ( ON-TABLE ?auto_636119 ) ( ON ?auto_636120 ?auto_636119 ) ( ON ?auto_636121 ?auto_636120 ) ( ON ?auto_636122 ?auto_636121 ) ( ON ?auto_636123 ?auto_636122 ) ( ON ?auto_636124 ?auto_636123 ) ( ON ?auto_636125 ?auto_636124 ) ( not ( = ?auto_636119 ?auto_636120 ) ) ( not ( = ?auto_636119 ?auto_636121 ) ) ( not ( = ?auto_636119 ?auto_636122 ) ) ( not ( = ?auto_636119 ?auto_636123 ) ) ( not ( = ?auto_636119 ?auto_636124 ) ) ( not ( = ?auto_636119 ?auto_636125 ) ) ( not ( = ?auto_636119 ?auto_636126 ) ) ( not ( = ?auto_636119 ?auto_636127 ) ) ( not ( = ?auto_636119 ?auto_636128 ) ) ( not ( = ?auto_636120 ?auto_636121 ) ) ( not ( = ?auto_636120 ?auto_636122 ) ) ( not ( = ?auto_636120 ?auto_636123 ) ) ( not ( = ?auto_636120 ?auto_636124 ) ) ( not ( = ?auto_636120 ?auto_636125 ) ) ( not ( = ?auto_636120 ?auto_636126 ) ) ( not ( = ?auto_636120 ?auto_636127 ) ) ( not ( = ?auto_636120 ?auto_636128 ) ) ( not ( = ?auto_636121 ?auto_636122 ) ) ( not ( = ?auto_636121 ?auto_636123 ) ) ( not ( = ?auto_636121 ?auto_636124 ) ) ( not ( = ?auto_636121 ?auto_636125 ) ) ( not ( = ?auto_636121 ?auto_636126 ) ) ( not ( = ?auto_636121 ?auto_636127 ) ) ( not ( = ?auto_636121 ?auto_636128 ) ) ( not ( = ?auto_636122 ?auto_636123 ) ) ( not ( = ?auto_636122 ?auto_636124 ) ) ( not ( = ?auto_636122 ?auto_636125 ) ) ( not ( = ?auto_636122 ?auto_636126 ) ) ( not ( = ?auto_636122 ?auto_636127 ) ) ( not ( = ?auto_636122 ?auto_636128 ) ) ( not ( = ?auto_636123 ?auto_636124 ) ) ( not ( = ?auto_636123 ?auto_636125 ) ) ( not ( = ?auto_636123 ?auto_636126 ) ) ( not ( = ?auto_636123 ?auto_636127 ) ) ( not ( = ?auto_636123 ?auto_636128 ) ) ( not ( = ?auto_636124 ?auto_636125 ) ) ( not ( = ?auto_636124 ?auto_636126 ) ) ( not ( = ?auto_636124 ?auto_636127 ) ) ( not ( = ?auto_636124 ?auto_636128 ) ) ( not ( = ?auto_636125 ?auto_636126 ) ) ( not ( = ?auto_636125 ?auto_636127 ) ) ( not ( = ?auto_636125 ?auto_636128 ) ) ( not ( = ?auto_636126 ?auto_636127 ) ) ( not ( = ?auto_636126 ?auto_636128 ) ) ( not ( = ?auto_636127 ?auto_636128 ) ) ( CLEAR ?auto_636125 ) ( ON ?auto_636126 ?auto_636127 ) ( CLEAR ?auto_636126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_636119 ?auto_636120 ?auto_636121 ?auto_636122 ?auto_636123 ?auto_636124 ?auto_636125 ?auto_636126 )
      ( MAKE-9PILE ?auto_636119 ?auto_636120 ?auto_636121 ?auto_636122 ?auto_636123 ?auto_636124 ?auto_636125 ?auto_636126 ?auto_636127 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_636157 - BLOCK
      ?auto_636158 - BLOCK
      ?auto_636159 - BLOCK
      ?auto_636160 - BLOCK
      ?auto_636161 - BLOCK
      ?auto_636162 - BLOCK
      ?auto_636163 - BLOCK
      ?auto_636164 - BLOCK
      ?auto_636165 - BLOCK
    )
    :vars
    (
      ?auto_636166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_636165 ?auto_636166 ) ( ON-TABLE ?auto_636157 ) ( ON ?auto_636158 ?auto_636157 ) ( ON ?auto_636159 ?auto_636158 ) ( ON ?auto_636160 ?auto_636159 ) ( ON ?auto_636161 ?auto_636160 ) ( ON ?auto_636162 ?auto_636161 ) ( not ( = ?auto_636157 ?auto_636158 ) ) ( not ( = ?auto_636157 ?auto_636159 ) ) ( not ( = ?auto_636157 ?auto_636160 ) ) ( not ( = ?auto_636157 ?auto_636161 ) ) ( not ( = ?auto_636157 ?auto_636162 ) ) ( not ( = ?auto_636157 ?auto_636163 ) ) ( not ( = ?auto_636157 ?auto_636164 ) ) ( not ( = ?auto_636157 ?auto_636165 ) ) ( not ( = ?auto_636157 ?auto_636166 ) ) ( not ( = ?auto_636158 ?auto_636159 ) ) ( not ( = ?auto_636158 ?auto_636160 ) ) ( not ( = ?auto_636158 ?auto_636161 ) ) ( not ( = ?auto_636158 ?auto_636162 ) ) ( not ( = ?auto_636158 ?auto_636163 ) ) ( not ( = ?auto_636158 ?auto_636164 ) ) ( not ( = ?auto_636158 ?auto_636165 ) ) ( not ( = ?auto_636158 ?auto_636166 ) ) ( not ( = ?auto_636159 ?auto_636160 ) ) ( not ( = ?auto_636159 ?auto_636161 ) ) ( not ( = ?auto_636159 ?auto_636162 ) ) ( not ( = ?auto_636159 ?auto_636163 ) ) ( not ( = ?auto_636159 ?auto_636164 ) ) ( not ( = ?auto_636159 ?auto_636165 ) ) ( not ( = ?auto_636159 ?auto_636166 ) ) ( not ( = ?auto_636160 ?auto_636161 ) ) ( not ( = ?auto_636160 ?auto_636162 ) ) ( not ( = ?auto_636160 ?auto_636163 ) ) ( not ( = ?auto_636160 ?auto_636164 ) ) ( not ( = ?auto_636160 ?auto_636165 ) ) ( not ( = ?auto_636160 ?auto_636166 ) ) ( not ( = ?auto_636161 ?auto_636162 ) ) ( not ( = ?auto_636161 ?auto_636163 ) ) ( not ( = ?auto_636161 ?auto_636164 ) ) ( not ( = ?auto_636161 ?auto_636165 ) ) ( not ( = ?auto_636161 ?auto_636166 ) ) ( not ( = ?auto_636162 ?auto_636163 ) ) ( not ( = ?auto_636162 ?auto_636164 ) ) ( not ( = ?auto_636162 ?auto_636165 ) ) ( not ( = ?auto_636162 ?auto_636166 ) ) ( not ( = ?auto_636163 ?auto_636164 ) ) ( not ( = ?auto_636163 ?auto_636165 ) ) ( not ( = ?auto_636163 ?auto_636166 ) ) ( not ( = ?auto_636164 ?auto_636165 ) ) ( not ( = ?auto_636164 ?auto_636166 ) ) ( not ( = ?auto_636165 ?auto_636166 ) ) ( ON ?auto_636164 ?auto_636165 ) ( CLEAR ?auto_636162 ) ( ON ?auto_636163 ?auto_636164 ) ( CLEAR ?auto_636163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_636157 ?auto_636158 ?auto_636159 ?auto_636160 ?auto_636161 ?auto_636162 ?auto_636163 )
      ( MAKE-9PILE ?auto_636157 ?auto_636158 ?auto_636159 ?auto_636160 ?auto_636161 ?auto_636162 ?auto_636163 ?auto_636164 ?auto_636165 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_636195 - BLOCK
      ?auto_636196 - BLOCK
      ?auto_636197 - BLOCK
      ?auto_636198 - BLOCK
      ?auto_636199 - BLOCK
      ?auto_636200 - BLOCK
      ?auto_636201 - BLOCK
      ?auto_636202 - BLOCK
      ?auto_636203 - BLOCK
    )
    :vars
    (
      ?auto_636204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_636203 ?auto_636204 ) ( ON-TABLE ?auto_636195 ) ( ON ?auto_636196 ?auto_636195 ) ( ON ?auto_636197 ?auto_636196 ) ( ON ?auto_636198 ?auto_636197 ) ( ON ?auto_636199 ?auto_636198 ) ( not ( = ?auto_636195 ?auto_636196 ) ) ( not ( = ?auto_636195 ?auto_636197 ) ) ( not ( = ?auto_636195 ?auto_636198 ) ) ( not ( = ?auto_636195 ?auto_636199 ) ) ( not ( = ?auto_636195 ?auto_636200 ) ) ( not ( = ?auto_636195 ?auto_636201 ) ) ( not ( = ?auto_636195 ?auto_636202 ) ) ( not ( = ?auto_636195 ?auto_636203 ) ) ( not ( = ?auto_636195 ?auto_636204 ) ) ( not ( = ?auto_636196 ?auto_636197 ) ) ( not ( = ?auto_636196 ?auto_636198 ) ) ( not ( = ?auto_636196 ?auto_636199 ) ) ( not ( = ?auto_636196 ?auto_636200 ) ) ( not ( = ?auto_636196 ?auto_636201 ) ) ( not ( = ?auto_636196 ?auto_636202 ) ) ( not ( = ?auto_636196 ?auto_636203 ) ) ( not ( = ?auto_636196 ?auto_636204 ) ) ( not ( = ?auto_636197 ?auto_636198 ) ) ( not ( = ?auto_636197 ?auto_636199 ) ) ( not ( = ?auto_636197 ?auto_636200 ) ) ( not ( = ?auto_636197 ?auto_636201 ) ) ( not ( = ?auto_636197 ?auto_636202 ) ) ( not ( = ?auto_636197 ?auto_636203 ) ) ( not ( = ?auto_636197 ?auto_636204 ) ) ( not ( = ?auto_636198 ?auto_636199 ) ) ( not ( = ?auto_636198 ?auto_636200 ) ) ( not ( = ?auto_636198 ?auto_636201 ) ) ( not ( = ?auto_636198 ?auto_636202 ) ) ( not ( = ?auto_636198 ?auto_636203 ) ) ( not ( = ?auto_636198 ?auto_636204 ) ) ( not ( = ?auto_636199 ?auto_636200 ) ) ( not ( = ?auto_636199 ?auto_636201 ) ) ( not ( = ?auto_636199 ?auto_636202 ) ) ( not ( = ?auto_636199 ?auto_636203 ) ) ( not ( = ?auto_636199 ?auto_636204 ) ) ( not ( = ?auto_636200 ?auto_636201 ) ) ( not ( = ?auto_636200 ?auto_636202 ) ) ( not ( = ?auto_636200 ?auto_636203 ) ) ( not ( = ?auto_636200 ?auto_636204 ) ) ( not ( = ?auto_636201 ?auto_636202 ) ) ( not ( = ?auto_636201 ?auto_636203 ) ) ( not ( = ?auto_636201 ?auto_636204 ) ) ( not ( = ?auto_636202 ?auto_636203 ) ) ( not ( = ?auto_636202 ?auto_636204 ) ) ( not ( = ?auto_636203 ?auto_636204 ) ) ( ON ?auto_636202 ?auto_636203 ) ( ON ?auto_636201 ?auto_636202 ) ( CLEAR ?auto_636199 ) ( ON ?auto_636200 ?auto_636201 ) ( CLEAR ?auto_636200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_636195 ?auto_636196 ?auto_636197 ?auto_636198 ?auto_636199 ?auto_636200 )
      ( MAKE-9PILE ?auto_636195 ?auto_636196 ?auto_636197 ?auto_636198 ?auto_636199 ?auto_636200 ?auto_636201 ?auto_636202 ?auto_636203 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_636233 - BLOCK
      ?auto_636234 - BLOCK
      ?auto_636235 - BLOCK
      ?auto_636236 - BLOCK
      ?auto_636237 - BLOCK
      ?auto_636238 - BLOCK
      ?auto_636239 - BLOCK
      ?auto_636240 - BLOCK
      ?auto_636241 - BLOCK
    )
    :vars
    (
      ?auto_636242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_636241 ?auto_636242 ) ( ON-TABLE ?auto_636233 ) ( ON ?auto_636234 ?auto_636233 ) ( ON ?auto_636235 ?auto_636234 ) ( ON ?auto_636236 ?auto_636235 ) ( not ( = ?auto_636233 ?auto_636234 ) ) ( not ( = ?auto_636233 ?auto_636235 ) ) ( not ( = ?auto_636233 ?auto_636236 ) ) ( not ( = ?auto_636233 ?auto_636237 ) ) ( not ( = ?auto_636233 ?auto_636238 ) ) ( not ( = ?auto_636233 ?auto_636239 ) ) ( not ( = ?auto_636233 ?auto_636240 ) ) ( not ( = ?auto_636233 ?auto_636241 ) ) ( not ( = ?auto_636233 ?auto_636242 ) ) ( not ( = ?auto_636234 ?auto_636235 ) ) ( not ( = ?auto_636234 ?auto_636236 ) ) ( not ( = ?auto_636234 ?auto_636237 ) ) ( not ( = ?auto_636234 ?auto_636238 ) ) ( not ( = ?auto_636234 ?auto_636239 ) ) ( not ( = ?auto_636234 ?auto_636240 ) ) ( not ( = ?auto_636234 ?auto_636241 ) ) ( not ( = ?auto_636234 ?auto_636242 ) ) ( not ( = ?auto_636235 ?auto_636236 ) ) ( not ( = ?auto_636235 ?auto_636237 ) ) ( not ( = ?auto_636235 ?auto_636238 ) ) ( not ( = ?auto_636235 ?auto_636239 ) ) ( not ( = ?auto_636235 ?auto_636240 ) ) ( not ( = ?auto_636235 ?auto_636241 ) ) ( not ( = ?auto_636235 ?auto_636242 ) ) ( not ( = ?auto_636236 ?auto_636237 ) ) ( not ( = ?auto_636236 ?auto_636238 ) ) ( not ( = ?auto_636236 ?auto_636239 ) ) ( not ( = ?auto_636236 ?auto_636240 ) ) ( not ( = ?auto_636236 ?auto_636241 ) ) ( not ( = ?auto_636236 ?auto_636242 ) ) ( not ( = ?auto_636237 ?auto_636238 ) ) ( not ( = ?auto_636237 ?auto_636239 ) ) ( not ( = ?auto_636237 ?auto_636240 ) ) ( not ( = ?auto_636237 ?auto_636241 ) ) ( not ( = ?auto_636237 ?auto_636242 ) ) ( not ( = ?auto_636238 ?auto_636239 ) ) ( not ( = ?auto_636238 ?auto_636240 ) ) ( not ( = ?auto_636238 ?auto_636241 ) ) ( not ( = ?auto_636238 ?auto_636242 ) ) ( not ( = ?auto_636239 ?auto_636240 ) ) ( not ( = ?auto_636239 ?auto_636241 ) ) ( not ( = ?auto_636239 ?auto_636242 ) ) ( not ( = ?auto_636240 ?auto_636241 ) ) ( not ( = ?auto_636240 ?auto_636242 ) ) ( not ( = ?auto_636241 ?auto_636242 ) ) ( ON ?auto_636240 ?auto_636241 ) ( ON ?auto_636239 ?auto_636240 ) ( ON ?auto_636238 ?auto_636239 ) ( CLEAR ?auto_636236 ) ( ON ?auto_636237 ?auto_636238 ) ( CLEAR ?auto_636237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_636233 ?auto_636234 ?auto_636235 ?auto_636236 ?auto_636237 )
      ( MAKE-9PILE ?auto_636233 ?auto_636234 ?auto_636235 ?auto_636236 ?auto_636237 ?auto_636238 ?auto_636239 ?auto_636240 ?auto_636241 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_636271 - BLOCK
      ?auto_636272 - BLOCK
      ?auto_636273 - BLOCK
      ?auto_636274 - BLOCK
      ?auto_636275 - BLOCK
      ?auto_636276 - BLOCK
      ?auto_636277 - BLOCK
      ?auto_636278 - BLOCK
      ?auto_636279 - BLOCK
    )
    :vars
    (
      ?auto_636280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_636279 ?auto_636280 ) ( ON-TABLE ?auto_636271 ) ( ON ?auto_636272 ?auto_636271 ) ( ON ?auto_636273 ?auto_636272 ) ( not ( = ?auto_636271 ?auto_636272 ) ) ( not ( = ?auto_636271 ?auto_636273 ) ) ( not ( = ?auto_636271 ?auto_636274 ) ) ( not ( = ?auto_636271 ?auto_636275 ) ) ( not ( = ?auto_636271 ?auto_636276 ) ) ( not ( = ?auto_636271 ?auto_636277 ) ) ( not ( = ?auto_636271 ?auto_636278 ) ) ( not ( = ?auto_636271 ?auto_636279 ) ) ( not ( = ?auto_636271 ?auto_636280 ) ) ( not ( = ?auto_636272 ?auto_636273 ) ) ( not ( = ?auto_636272 ?auto_636274 ) ) ( not ( = ?auto_636272 ?auto_636275 ) ) ( not ( = ?auto_636272 ?auto_636276 ) ) ( not ( = ?auto_636272 ?auto_636277 ) ) ( not ( = ?auto_636272 ?auto_636278 ) ) ( not ( = ?auto_636272 ?auto_636279 ) ) ( not ( = ?auto_636272 ?auto_636280 ) ) ( not ( = ?auto_636273 ?auto_636274 ) ) ( not ( = ?auto_636273 ?auto_636275 ) ) ( not ( = ?auto_636273 ?auto_636276 ) ) ( not ( = ?auto_636273 ?auto_636277 ) ) ( not ( = ?auto_636273 ?auto_636278 ) ) ( not ( = ?auto_636273 ?auto_636279 ) ) ( not ( = ?auto_636273 ?auto_636280 ) ) ( not ( = ?auto_636274 ?auto_636275 ) ) ( not ( = ?auto_636274 ?auto_636276 ) ) ( not ( = ?auto_636274 ?auto_636277 ) ) ( not ( = ?auto_636274 ?auto_636278 ) ) ( not ( = ?auto_636274 ?auto_636279 ) ) ( not ( = ?auto_636274 ?auto_636280 ) ) ( not ( = ?auto_636275 ?auto_636276 ) ) ( not ( = ?auto_636275 ?auto_636277 ) ) ( not ( = ?auto_636275 ?auto_636278 ) ) ( not ( = ?auto_636275 ?auto_636279 ) ) ( not ( = ?auto_636275 ?auto_636280 ) ) ( not ( = ?auto_636276 ?auto_636277 ) ) ( not ( = ?auto_636276 ?auto_636278 ) ) ( not ( = ?auto_636276 ?auto_636279 ) ) ( not ( = ?auto_636276 ?auto_636280 ) ) ( not ( = ?auto_636277 ?auto_636278 ) ) ( not ( = ?auto_636277 ?auto_636279 ) ) ( not ( = ?auto_636277 ?auto_636280 ) ) ( not ( = ?auto_636278 ?auto_636279 ) ) ( not ( = ?auto_636278 ?auto_636280 ) ) ( not ( = ?auto_636279 ?auto_636280 ) ) ( ON ?auto_636278 ?auto_636279 ) ( ON ?auto_636277 ?auto_636278 ) ( ON ?auto_636276 ?auto_636277 ) ( ON ?auto_636275 ?auto_636276 ) ( CLEAR ?auto_636273 ) ( ON ?auto_636274 ?auto_636275 ) ( CLEAR ?auto_636274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_636271 ?auto_636272 ?auto_636273 ?auto_636274 )
      ( MAKE-9PILE ?auto_636271 ?auto_636272 ?auto_636273 ?auto_636274 ?auto_636275 ?auto_636276 ?auto_636277 ?auto_636278 ?auto_636279 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_636309 - BLOCK
      ?auto_636310 - BLOCK
      ?auto_636311 - BLOCK
      ?auto_636312 - BLOCK
      ?auto_636313 - BLOCK
      ?auto_636314 - BLOCK
      ?auto_636315 - BLOCK
      ?auto_636316 - BLOCK
      ?auto_636317 - BLOCK
    )
    :vars
    (
      ?auto_636318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_636317 ?auto_636318 ) ( ON-TABLE ?auto_636309 ) ( ON ?auto_636310 ?auto_636309 ) ( not ( = ?auto_636309 ?auto_636310 ) ) ( not ( = ?auto_636309 ?auto_636311 ) ) ( not ( = ?auto_636309 ?auto_636312 ) ) ( not ( = ?auto_636309 ?auto_636313 ) ) ( not ( = ?auto_636309 ?auto_636314 ) ) ( not ( = ?auto_636309 ?auto_636315 ) ) ( not ( = ?auto_636309 ?auto_636316 ) ) ( not ( = ?auto_636309 ?auto_636317 ) ) ( not ( = ?auto_636309 ?auto_636318 ) ) ( not ( = ?auto_636310 ?auto_636311 ) ) ( not ( = ?auto_636310 ?auto_636312 ) ) ( not ( = ?auto_636310 ?auto_636313 ) ) ( not ( = ?auto_636310 ?auto_636314 ) ) ( not ( = ?auto_636310 ?auto_636315 ) ) ( not ( = ?auto_636310 ?auto_636316 ) ) ( not ( = ?auto_636310 ?auto_636317 ) ) ( not ( = ?auto_636310 ?auto_636318 ) ) ( not ( = ?auto_636311 ?auto_636312 ) ) ( not ( = ?auto_636311 ?auto_636313 ) ) ( not ( = ?auto_636311 ?auto_636314 ) ) ( not ( = ?auto_636311 ?auto_636315 ) ) ( not ( = ?auto_636311 ?auto_636316 ) ) ( not ( = ?auto_636311 ?auto_636317 ) ) ( not ( = ?auto_636311 ?auto_636318 ) ) ( not ( = ?auto_636312 ?auto_636313 ) ) ( not ( = ?auto_636312 ?auto_636314 ) ) ( not ( = ?auto_636312 ?auto_636315 ) ) ( not ( = ?auto_636312 ?auto_636316 ) ) ( not ( = ?auto_636312 ?auto_636317 ) ) ( not ( = ?auto_636312 ?auto_636318 ) ) ( not ( = ?auto_636313 ?auto_636314 ) ) ( not ( = ?auto_636313 ?auto_636315 ) ) ( not ( = ?auto_636313 ?auto_636316 ) ) ( not ( = ?auto_636313 ?auto_636317 ) ) ( not ( = ?auto_636313 ?auto_636318 ) ) ( not ( = ?auto_636314 ?auto_636315 ) ) ( not ( = ?auto_636314 ?auto_636316 ) ) ( not ( = ?auto_636314 ?auto_636317 ) ) ( not ( = ?auto_636314 ?auto_636318 ) ) ( not ( = ?auto_636315 ?auto_636316 ) ) ( not ( = ?auto_636315 ?auto_636317 ) ) ( not ( = ?auto_636315 ?auto_636318 ) ) ( not ( = ?auto_636316 ?auto_636317 ) ) ( not ( = ?auto_636316 ?auto_636318 ) ) ( not ( = ?auto_636317 ?auto_636318 ) ) ( ON ?auto_636316 ?auto_636317 ) ( ON ?auto_636315 ?auto_636316 ) ( ON ?auto_636314 ?auto_636315 ) ( ON ?auto_636313 ?auto_636314 ) ( ON ?auto_636312 ?auto_636313 ) ( CLEAR ?auto_636310 ) ( ON ?auto_636311 ?auto_636312 ) ( CLEAR ?auto_636311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_636309 ?auto_636310 ?auto_636311 )
      ( MAKE-9PILE ?auto_636309 ?auto_636310 ?auto_636311 ?auto_636312 ?auto_636313 ?auto_636314 ?auto_636315 ?auto_636316 ?auto_636317 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_636347 - BLOCK
      ?auto_636348 - BLOCK
      ?auto_636349 - BLOCK
      ?auto_636350 - BLOCK
      ?auto_636351 - BLOCK
      ?auto_636352 - BLOCK
      ?auto_636353 - BLOCK
      ?auto_636354 - BLOCK
      ?auto_636355 - BLOCK
    )
    :vars
    (
      ?auto_636356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_636355 ?auto_636356 ) ( ON-TABLE ?auto_636347 ) ( not ( = ?auto_636347 ?auto_636348 ) ) ( not ( = ?auto_636347 ?auto_636349 ) ) ( not ( = ?auto_636347 ?auto_636350 ) ) ( not ( = ?auto_636347 ?auto_636351 ) ) ( not ( = ?auto_636347 ?auto_636352 ) ) ( not ( = ?auto_636347 ?auto_636353 ) ) ( not ( = ?auto_636347 ?auto_636354 ) ) ( not ( = ?auto_636347 ?auto_636355 ) ) ( not ( = ?auto_636347 ?auto_636356 ) ) ( not ( = ?auto_636348 ?auto_636349 ) ) ( not ( = ?auto_636348 ?auto_636350 ) ) ( not ( = ?auto_636348 ?auto_636351 ) ) ( not ( = ?auto_636348 ?auto_636352 ) ) ( not ( = ?auto_636348 ?auto_636353 ) ) ( not ( = ?auto_636348 ?auto_636354 ) ) ( not ( = ?auto_636348 ?auto_636355 ) ) ( not ( = ?auto_636348 ?auto_636356 ) ) ( not ( = ?auto_636349 ?auto_636350 ) ) ( not ( = ?auto_636349 ?auto_636351 ) ) ( not ( = ?auto_636349 ?auto_636352 ) ) ( not ( = ?auto_636349 ?auto_636353 ) ) ( not ( = ?auto_636349 ?auto_636354 ) ) ( not ( = ?auto_636349 ?auto_636355 ) ) ( not ( = ?auto_636349 ?auto_636356 ) ) ( not ( = ?auto_636350 ?auto_636351 ) ) ( not ( = ?auto_636350 ?auto_636352 ) ) ( not ( = ?auto_636350 ?auto_636353 ) ) ( not ( = ?auto_636350 ?auto_636354 ) ) ( not ( = ?auto_636350 ?auto_636355 ) ) ( not ( = ?auto_636350 ?auto_636356 ) ) ( not ( = ?auto_636351 ?auto_636352 ) ) ( not ( = ?auto_636351 ?auto_636353 ) ) ( not ( = ?auto_636351 ?auto_636354 ) ) ( not ( = ?auto_636351 ?auto_636355 ) ) ( not ( = ?auto_636351 ?auto_636356 ) ) ( not ( = ?auto_636352 ?auto_636353 ) ) ( not ( = ?auto_636352 ?auto_636354 ) ) ( not ( = ?auto_636352 ?auto_636355 ) ) ( not ( = ?auto_636352 ?auto_636356 ) ) ( not ( = ?auto_636353 ?auto_636354 ) ) ( not ( = ?auto_636353 ?auto_636355 ) ) ( not ( = ?auto_636353 ?auto_636356 ) ) ( not ( = ?auto_636354 ?auto_636355 ) ) ( not ( = ?auto_636354 ?auto_636356 ) ) ( not ( = ?auto_636355 ?auto_636356 ) ) ( ON ?auto_636354 ?auto_636355 ) ( ON ?auto_636353 ?auto_636354 ) ( ON ?auto_636352 ?auto_636353 ) ( ON ?auto_636351 ?auto_636352 ) ( ON ?auto_636350 ?auto_636351 ) ( ON ?auto_636349 ?auto_636350 ) ( CLEAR ?auto_636347 ) ( ON ?auto_636348 ?auto_636349 ) ( CLEAR ?auto_636348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_636347 ?auto_636348 )
      ( MAKE-9PILE ?auto_636347 ?auto_636348 ?auto_636349 ?auto_636350 ?auto_636351 ?auto_636352 ?auto_636353 ?auto_636354 ?auto_636355 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_636385 - BLOCK
      ?auto_636386 - BLOCK
      ?auto_636387 - BLOCK
      ?auto_636388 - BLOCK
      ?auto_636389 - BLOCK
      ?auto_636390 - BLOCK
      ?auto_636391 - BLOCK
      ?auto_636392 - BLOCK
      ?auto_636393 - BLOCK
    )
    :vars
    (
      ?auto_636394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_636393 ?auto_636394 ) ( not ( = ?auto_636385 ?auto_636386 ) ) ( not ( = ?auto_636385 ?auto_636387 ) ) ( not ( = ?auto_636385 ?auto_636388 ) ) ( not ( = ?auto_636385 ?auto_636389 ) ) ( not ( = ?auto_636385 ?auto_636390 ) ) ( not ( = ?auto_636385 ?auto_636391 ) ) ( not ( = ?auto_636385 ?auto_636392 ) ) ( not ( = ?auto_636385 ?auto_636393 ) ) ( not ( = ?auto_636385 ?auto_636394 ) ) ( not ( = ?auto_636386 ?auto_636387 ) ) ( not ( = ?auto_636386 ?auto_636388 ) ) ( not ( = ?auto_636386 ?auto_636389 ) ) ( not ( = ?auto_636386 ?auto_636390 ) ) ( not ( = ?auto_636386 ?auto_636391 ) ) ( not ( = ?auto_636386 ?auto_636392 ) ) ( not ( = ?auto_636386 ?auto_636393 ) ) ( not ( = ?auto_636386 ?auto_636394 ) ) ( not ( = ?auto_636387 ?auto_636388 ) ) ( not ( = ?auto_636387 ?auto_636389 ) ) ( not ( = ?auto_636387 ?auto_636390 ) ) ( not ( = ?auto_636387 ?auto_636391 ) ) ( not ( = ?auto_636387 ?auto_636392 ) ) ( not ( = ?auto_636387 ?auto_636393 ) ) ( not ( = ?auto_636387 ?auto_636394 ) ) ( not ( = ?auto_636388 ?auto_636389 ) ) ( not ( = ?auto_636388 ?auto_636390 ) ) ( not ( = ?auto_636388 ?auto_636391 ) ) ( not ( = ?auto_636388 ?auto_636392 ) ) ( not ( = ?auto_636388 ?auto_636393 ) ) ( not ( = ?auto_636388 ?auto_636394 ) ) ( not ( = ?auto_636389 ?auto_636390 ) ) ( not ( = ?auto_636389 ?auto_636391 ) ) ( not ( = ?auto_636389 ?auto_636392 ) ) ( not ( = ?auto_636389 ?auto_636393 ) ) ( not ( = ?auto_636389 ?auto_636394 ) ) ( not ( = ?auto_636390 ?auto_636391 ) ) ( not ( = ?auto_636390 ?auto_636392 ) ) ( not ( = ?auto_636390 ?auto_636393 ) ) ( not ( = ?auto_636390 ?auto_636394 ) ) ( not ( = ?auto_636391 ?auto_636392 ) ) ( not ( = ?auto_636391 ?auto_636393 ) ) ( not ( = ?auto_636391 ?auto_636394 ) ) ( not ( = ?auto_636392 ?auto_636393 ) ) ( not ( = ?auto_636392 ?auto_636394 ) ) ( not ( = ?auto_636393 ?auto_636394 ) ) ( ON ?auto_636392 ?auto_636393 ) ( ON ?auto_636391 ?auto_636392 ) ( ON ?auto_636390 ?auto_636391 ) ( ON ?auto_636389 ?auto_636390 ) ( ON ?auto_636388 ?auto_636389 ) ( ON ?auto_636387 ?auto_636388 ) ( ON ?auto_636386 ?auto_636387 ) ( ON ?auto_636385 ?auto_636386 ) ( CLEAR ?auto_636385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_636385 )
      ( MAKE-9PILE ?auto_636385 ?auto_636386 ?auto_636387 ?auto_636388 ?auto_636389 ?auto_636390 ?auto_636391 ?auto_636392 ?auto_636393 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_636424 - BLOCK
      ?auto_636425 - BLOCK
      ?auto_636426 - BLOCK
      ?auto_636427 - BLOCK
      ?auto_636428 - BLOCK
      ?auto_636429 - BLOCK
      ?auto_636430 - BLOCK
      ?auto_636431 - BLOCK
      ?auto_636432 - BLOCK
      ?auto_636433 - BLOCK
    )
    :vars
    (
      ?auto_636434 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_636432 ) ( ON ?auto_636433 ?auto_636434 ) ( CLEAR ?auto_636433 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_636424 ) ( ON ?auto_636425 ?auto_636424 ) ( ON ?auto_636426 ?auto_636425 ) ( ON ?auto_636427 ?auto_636426 ) ( ON ?auto_636428 ?auto_636427 ) ( ON ?auto_636429 ?auto_636428 ) ( ON ?auto_636430 ?auto_636429 ) ( ON ?auto_636431 ?auto_636430 ) ( ON ?auto_636432 ?auto_636431 ) ( not ( = ?auto_636424 ?auto_636425 ) ) ( not ( = ?auto_636424 ?auto_636426 ) ) ( not ( = ?auto_636424 ?auto_636427 ) ) ( not ( = ?auto_636424 ?auto_636428 ) ) ( not ( = ?auto_636424 ?auto_636429 ) ) ( not ( = ?auto_636424 ?auto_636430 ) ) ( not ( = ?auto_636424 ?auto_636431 ) ) ( not ( = ?auto_636424 ?auto_636432 ) ) ( not ( = ?auto_636424 ?auto_636433 ) ) ( not ( = ?auto_636424 ?auto_636434 ) ) ( not ( = ?auto_636425 ?auto_636426 ) ) ( not ( = ?auto_636425 ?auto_636427 ) ) ( not ( = ?auto_636425 ?auto_636428 ) ) ( not ( = ?auto_636425 ?auto_636429 ) ) ( not ( = ?auto_636425 ?auto_636430 ) ) ( not ( = ?auto_636425 ?auto_636431 ) ) ( not ( = ?auto_636425 ?auto_636432 ) ) ( not ( = ?auto_636425 ?auto_636433 ) ) ( not ( = ?auto_636425 ?auto_636434 ) ) ( not ( = ?auto_636426 ?auto_636427 ) ) ( not ( = ?auto_636426 ?auto_636428 ) ) ( not ( = ?auto_636426 ?auto_636429 ) ) ( not ( = ?auto_636426 ?auto_636430 ) ) ( not ( = ?auto_636426 ?auto_636431 ) ) ( not ( = ?auto_636426 ?auto_636432 ) ) ( not ( = ?auto_636426 ?auto_636433 ) ) ( not ( = ?auto_636426 ?auto_636434 ) ) ( not ( = ?auto_636427 ?auto_636428 ) ) ( not ( = ?auto_636427 ?auto_636429 ) ) ( not ( = ?auto_636427 ?auto_636430 ) ) ( not ( = ?auto_636427 ?auto_636431 ) ) ( not ( = ?auto_636427 ?auto_636432 ) ) ( not ( = ?auto_636427 ?auto_636433 ) ) ( not ( = ?auto_636427 ?auto_636434 ) ) ( not ( = ?auto_636428 ?auto_636429 ) ) ( not ( = ?auto_636428 ?auto_636430 ) ) ( not ( = ?auto_636428 ?auto_636431 ) ) ( not ( = ?auto_636428 ?auto_636432 ) ) ( not ( = ?auto_636428 ?auto_636433 ) ) ( not ( = ?auto_636428 ?auto_636434 ) ) ( not ( = ?auto_636429 ?auto_636430 ) ) ( not ( = ?auto_636429 ?auto_636431 ) ) ( not ( = ?auto_636429 ?auto_636432 ) ) ( not ( = ?auto_636429 ?auto_636433 ) ) ( not ( = ?auto_636429 ?auto_636434 ) ) ( not ( = ?auto_636430 ?auto_636431 ) ) ( not ( = ?auto_636430 ?auto_636432 ) ) ( not ( = ?auto_636430 ?auto_636433 ) ) ( not ( = ?auto_636430 ?auto_636434 ) ) ( not ( = ?auto_636431 ?auto_636432 ) ) ( not ( = ?auto_636431 ?auto_636433 ) ) ( not ( = ?auto_636431 ?auto_636434 ) ) ( not ( = ?auto_636432 ?auto_636433 ) ) ( not ( = ?auto_636432 ?auto_636434 ) ) ( not ( = ?auto_636433 ?auto_636434 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_636433 ?auto_636434 )
      ( !STACK ?auto_636433 ?auto_636432 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_636466 - BLOCK
      ?auto_636467 - BLOCK
      ?auto_636468 - BLOCK
      ?auto_636469 - BLOCK
      ?auto_636470 - BLOCK
      ?auto_636471 - BLOCK
      ?auto_636472 - BLOCK
      ?auto_636473 - BLOCK
      ?auto_636474 - BLOCK
      ?auto_636475 - BLOCK
    )
    :vars
    (
      ?auto_636476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_636475 ?auto_636476 ) ( ON-TABLE ?auto_636466 ) ( ON ?auto_636467 ?auto_636466 ) ( ON ?auto_636468 ?auto_636467 ) ( ON ?auto_636469 ?auto_636468 ) ( ON ?auto_636470 ?auto_636469 ) ( ON ?auto_636471 ?auto_636470 ) ( ON ?auto_636472 ?auto_636471 ) ( ON ?auto_636473 ?auto_636472 ) ( not ( = ?auto_636466 ?auto_636467 ) ) ( not ( = ?auto_636466 ?auto_636468 ) ) ( not ( = ?auto_636466 ?auto_636469 ) ) ( not ( = ?auto_636466 ?auto_636470 ) ) ( not ( = ?auto_636466 ?auto_636471 ) ) ( not ( = ?auto_636466 ?auto_636472 ) ) ( not ( = ?auto_636466 ?auto_636473 ) ) ( not ( = ?auto_636466 ?auto_636474 ) ) ( not ( = ?auto_636466 ?auto_636475 ) ) ( not ( = ?auto_636466 ?auto_636476 ) ) ( not ( = ?auto_636467 ?auto_636468 ) ) ( not ( = ?auto_636467 ?auto_636469 ) ) ( not ( = ?auto_636467 ?auto_636470 ) ) ( not ( = ?auto_636467 ?auto_636471 ) ) ( not ( = ?auto_636467 ?auto_636472 ) ) ( not ( = ?auto_636467 ?auto_636473 ) ) ( not ( = ?auto_636467 ?auto_636474 ) ) ( not ( = ?auto_636467 ?auto_636475 ) ) ( not ( = ?auto_636467 ?auto_636476 ) ) ( not ( = ?auto_636468 ?auto_636469 ) ) ( not ( = ?auto_636468 ?auto_636470 ) ) ( not ( = ?auto_636468 ?auto_636471 ) ) ( not ( = ?auto_636468 ?auto_636472 ) ) ( not ( = ?auto_636468 ?auto_636473 ) ) ( not ( = ?auto_636468 ?auto_636474 ) ) ( not ( = ?auto_636468 ?auto_636475 ) ) ( not ( = ?auto_636468 ?auto_636476 ) ) ( not ( = ?auto_636469 ?auto_636470 ) ) ( not ( = ?auto_636469 ?auto_636471 ) ) ( not ( = ?auto_636469 ?auto_636472 ) ) ( not ( = ?auto_636469 ?auto_636473 ) ) ( not ( = ?auto_636469 ?auto_636474 ) ) ( not ( = ?auto_636469 ?auto_636475 ) ) ( not ( = ?auto_636469 ?auto_636476 ) ) ( not ( = ?auto_636470 ?auto_636471 ) ) ( not ( = ?auto_636470 ?auto_636472 ) ) ( not ( = ?auto_636470 ?auto_636473 ) ) ( not ( = ?auto_636470 ?auto_636474 ) ) ( not ( = ?auto_636470 ?auto_636475 ) ) ( not ( = ?auto_636470 ?auto_636476 ) ) ( not ( = ?auto_636471 ?auto_636472 ) ) ( not ( = ?auto_636471 ?auto_636473 ) ) ( not ( = ?auto_636471 ?auto_636474 ) ) ( not ( = ?auto_636471 ?auto_636475 ) ) ( not ( = ?auto_636471 ?auto_636476 ) ) ( not ( = ?auto_636472 ?auto_636473 ) ) ( not ( = ?auto_636472 ?auto_636474 ) ) ( not ( = ?auto_636472 ?auto_636475 ) ) ( not ( = ?auto_636472 ?auto_636476 ) ) ( not ( = ?auto_636473 ?auto_636474 ) ) ( not ( = ?auto_636473 ?auto_636475 ) ) ( not ( = ?auto_636473 ?auto_636476 ) ) ( not ( = ?auto_636474 ?auto_636475 ) ) ( not ( = ?auto_636474 ?auto_636476 ) ) ( not ( = ?auto_636475 ?auto_636476 ) ) ( CLEAR ?auto_636473 ) ( ON ?auto_636474 ?auto_636475 ) ( CLEAR ?auto_636474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_636466 ?auto_636467 ?auto_636468 ?auto_636469 ?auto_636470 ?auto_636471 ?auto_636472 ?auto_636473 ?auto_636474 )
      ( MAKE-10PILE ?auto_636466 ?auto_636467 ?auto_636468 ?auto_636469 ?auto_636470 ?auto_636471 ?auto_636472 ?auto_636473 ?auto_636474 ?auto_636475 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_636508 - BLOCK
      ?auto_636509 - BLOCK
      ?auto_636510 - BLOCK
      ?auto_636511 - BLOCK
      ?auto_636512 - BLOCK
      ?auto_636513 - BLOCK
      ?auto_636514 - BLOCK
      ?auto_636515 - BLOCK
      ?auto_636516 - BLOCK
      ?auto_636517 - BLOCK
    )
    :vars
    (
      ?auto_636518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_636517 ?auto_636518 ) ( ON-TABLE ?auto_636508 ) ( ON ?auto_636509 ?auto_636508 ) ( ON ?auto_636510 ?auto_636509 ) ( ON ?auto_636511 ?auto_636510 ) ( ON ?auto_636512 ?auto_636511 ) ( ON ?auto_636513 ?auto_636512 ) ( ON ?auto_636514 ?auto_636513 ) ( not ( = ?auto_636508 ?auto_636509 ) ) ( not ( = ?auto_636508 ?auto_636510 ) ) ( not ( = ?auto_636508 ?auto_636511 ) ) ( not ( = ?auto_636508 ?auto_636512 ) ) ( not ( = ?auto_636508 ?auto_636513 ) ) ( not ( = ?auto_636508 ?auto_636514 ) ) ( not ( = ?auto_636508 ?auto_636515 ) ) ( not ( = ?auto_636508 ?auto_636516 ) ) ( not ( = ?auto_636508 ?auto_636517 ) ) ( not ( = ?auto_636508 ?auto_636518 ) ) ( not ( = ?auto_636509 ?auto_636510 ) ) ( not ( = ?auto_636509 ?auto_636511 ) ) ( not ( = ?auto_636509 ?auto_636512 ) ) ( not ( = ?auto_636509 ?auto_636513 ) ) ( not ( = ?auto_636509 ?auto_636514 ) ) ( not ( = ?auto_636509 ?auto_636515 ) ) ( not ( = ?auto_636509 ?auto_636516 ) ) ( not ( = ?auto_636509 ?auto_636517 ) ) ( not ( = ?auto_636509 ?auto_636518 ) ) ( not ( = ?auto_636510 ?auto_636511 ) ) ( not ( = ?auto_636510 ?auto_636512 ) ) ( not ( = ?auto_636510 ?auto_636513 ) ) ( not ( = ?auto_636510 ?auto_636514 ) ) ( not ( = ?auto_636510 ?auto_636515 ) ) ( not ( = ?auto_636510 ?auto_636516 ) ) ( not ( = ?auto_636510 ?auto_636517 ) ) ( not ( = ?auto_636510 ?auto_636518 ) ) ( not ( = ?auto_636511 ?auto_636512 ) ) ( not ( = ?auto_636511 ?auto_636513 ) ) ( not ( = ?auto_636511 ?auto_636514 ) ) ( not ( = ?auto_636511 ?auto_636515 ) ) ( not ( = ?auto_636511 ?auto_636516 ) ) ( not ( = ?auto_636511 ?auto_636517 ) ) ( not ( = ?auto_636511 ?auto_636518 ) ) ( not ( = ?auto_636512 ?auto_636513 ) ) ( not ( = ?auto_636512 ?auto_636514 ) ) ( not ( = ?auto_636512 ?auto_636515 ) ) ( not ( = ?auto_636512 ?auto_636516 ) ) ( not ( = ?auto_636512 ?auto_636517 ) ) ( not ( = ?auto_636512 ?auto_636518 ) ) ( not ( = ?auto_636513 ?auto_636514 ) ) ( not ( = ?auto_636513 ?auto_636515 ) ) ( not ( = ?auto_636513 ?auto_636516 ) ) ( not ( = ?auto_636513 ?auto_636517 ) ) ( not ( = ?auto_636513 ?auto_636518 ) ) ( not ( = ?auto_636514 ?auto_636515 ) ) ( not ( = ?auto_636514 ?auto_636516 ) ) ( not ( = ?auto_636514 ?auto_636517 ) ) ( not ( = ?auto_636514 ?auto_636518 ) ) ( not ( = ?auto_636515 ?auto_636516 ) ) ( not ( = ?auto_636515 ?auto_636517 ) ) ( not ( = ?auto_636515 ?auto_636518 ) ) ( not ( = ?auto_636516 ?auto_636517 ) ) ( not ( = ?auto_636516 ?auto_636518 ) ) ( not ( = ?auto_636517 ?auto_636518 ) ) ( ON ?auto_636516 ?auto_636517 ) ( CLEAR ?auto_636514 ) ( ON ?auto_636515 ?auto_636516 ) ( CLEAR ?auto_636515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_636508 ?auto_636509 ?auto_636510 ?auto_636511 ?auto_636512 ?auto_636513 ?auto_636514 ?auto_636515 )
      ( MAKE-10PILE ?auto_636508 ?auto_636509 ?auto_636510 ?auto_636511 ?auto_636512 ?auto_636513 ?auto_636514 ?auto_636515 ?auto_636516 ?auto_636517 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_636550 - BLOCK
      ?auto_636551 - BLOCK
      ?auto_636552 - BLOCK
      ?auto_636553 - BLOCK
      ?auto_636554 - BLOCK
      ?auto_636555 - BLOCK
      ?auto_636556 - BLOCK
      ?auto_636557 - BLOCK
      ?auto_636558 - BLOCK
      ?auto_636559 - BLOCK
    )
    :vars
    (
      ?auto_636560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_636559 ?auto_636560 ) ( ON-TABLE ?auto_636550 ) ( ON ?auto_636551 ?auto_636550 ) ( ON ?auto_636552 ?auto_636551 ) ( ON ?auto_636553 ?auto_636552 ) ( ON ?auto_636554 ?auto_636553 ) ( ON ?auto_636555 ?auto_636554 ) ( not ( = ?auto_636550 ?auto_636551 ) ) ( not ( = ?auto_636550 ?auto_636552 ) ) ( not ( = ?auto_636550 ?auto_636553 ) ) ( not ( = ?auto_636550 ?auto_636554 ) ) ( not ( = ?auto_636550 ?auto_636555 ) ) ( not ( = ?auto_636550 ?auto_636556 ) ) ( not ( = ?auto_636550 ?auto_636557 ) ) ( not ( = ?auto_636550 ?auto_636558 ) ) ( not ( = ?auto_636550 ?auto_636559 ) ) ( not ( = ?auto_636550 ?auto_636560 ) ) ( not ( = ?auto_636551 ?auto_636552 ) ) ( not ( = ?auto_636551 ?auto_636553 ) ) ( not ( = ?auto_636551 ?auto_636554 ) ) ( not ( = ?auto_636551 ?auto_636555 ) ) ( not ( = ?auto_636551 ?auto_636556 ) ) ( not ( = ?auto_636551 ?auto_636557 ) ) ( not ( = ?auto_636551 ?auto_636558 ) ) ( not ( = ?auto_636551 ?auto_636559 ) ) ( not ( = ?auto_636551 ?auto_636560 ) ) ( not ( = ?auto_636552 ?auto_636553 ) ) ( not ( = ?auto_636552 ?auto_636554 ) ) ( not ( = ?auto_636552 ?auto_636555 ) ) ( not ( = ?auto_636552 ?auto_636556 ) ) ( not ( = ?auto_636552 ?auto_636557 ) ) ( not ( = ?auto_636552 ?auto_636558 ) ) ( not ( = ?auto_636552 ?auto_636559 ) ) ( not ( = ?auto_636552 ?auto_636560 ) ) ( not ( = ?auto_636553 ?auto_636554 ) ) ( not ( = ?auto_636553 ?auto_636555 ) ) ( not ( = ?auto_636553 ?auto_636556 ) ) ( not ( = ?auto_636553 ?auto_636557 ) ) ( not ( = ?auto_636553 ?auto_636558 ) ) ( not ( = ?auto_636553 ?auto_636559 ) ) ( not ( = ?auto_636553 ?auto_636560 ) ) ( not ( = ?auto_636554 ?auto_636555 ) ) ( not ( = ?auto_636554 ?auto_636556 ) ) ( not ( = ?auto_636554 ?auto_636557 ) ) ( not ( = ?auto_636554 ?auto_636558 ) ) ( not ( = ?auto_636554 ?auto_636559 ) ) ( not ( = ?auto_636554 ?auto_636560 ) ) ( not ( = ?auto_636555 ?auto_636556 ) ) ( not ( = ?auto_636555 ?auto_636557 ) ) ( not ( = ?auto_636555 ?auto_636558 ) ) ( not ( = ?auto_636555 ?auto_636559 ) ) ( not ( = ?auto_636555 ?auto_636560 ) ) ( not ( = ?auto_636556 ?auto_636557 ) ) ( not ( = ?auto_636556 ?auto_636558 ) ) ( not ( = ?auto_636556 ?auto_636559 ) ) ( not ( = ?auto_636556 ?auto_636560 ) ) ( not ( = ?auto_636557 ?auto_636558 ) ) ( not ( = ?auto_636557 ?auto_636559 ) ) ( not ( = ?auto_636557 ?auto_636560 ) ) ( not ( = ?auto_636558 ?auto_636559 ) ) ( not ( = ?auto_636558 ?auto_636560 ) ) ( not ( = ?auto_636559 ?auto_636560 ) ) ( ON ?auto_636558 ?auto_636559 ) ( ON ?auto_636557 ?auto_636558 ) ( CLEAR ?auto_636555 ) ( ON ?auto_636556 ?auto_636557 ) ( CLEAR ?auto_636556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_636550 ?auto_636551 ?auto_636552 ?auto_636553 ?auto_636554 ?auto_636555 ?auto_636556 )
      ( MAKE-10PILE ?auto_636550 ?auto_636551 ?auto_636552 ?auto_636553 ?auto_636554 ?auto_636555 ?auto_636556 ?auto_636557 ?auto_636558 ?auto_636559 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_636592 - BLOCK
      ?auto_636593 - BLOCK
      ?auto_636594 - BLOCK
      ?auto_636595 - BLOCK
      ?auto_636596 - BLOCK
      ?auto_636597 - BLOCK
      ?auto_636598 - BLOCK
      ?auto_636599 - BLOCK
      ?auto_636600 - BLOCK
      ?auto_636601 - BLOCK
    )
    :vars
    (
      ?auto_636602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_636601 ?auto_636602 ) ( ON-TABLE ?auto_636592 ) ( ON ?auto_636593 ?auto_636592 ) ( ON ?auto_636594 ?auto_636593 ) ( ON ?auto_636595 ?auto_636594 ) ( ON ?auto_636596 ?auto_636595 ) ( not ( = ?auto_636592 ?auto_636593 ) ) ( not ( = ?auto_636592 ?auto_636594 ) ) ( not ( = ?auto_636592 ?auto_636595 ) ) ( not ( = ?auto_636592 ?auto_636596 ) ) ( not ( = ?auto_636592 ?auto_636597 ) ) ( not ( = ?auto_636592 ?auto_636598 ) ) ( not ( = ?auto_636592 ?auto_636599 ) ) ( not ( = ?auto_636592 ?auto_636600 ) ) ( not ( = ?auto_636592 ?auto_636601 ) ) ( not ( = ?auto_636592 ?auto_636602 ) ) ( not ( = ?auto_636593 ?auto_636594 ) ) ( not ( = ?auto_636593 ?auto_636595 ) ) ( not ( = ?auto_636593 ?auto_636596 ) ) ( not ( = ?auto_636593 ?auto_636597 ) ) ( not ( = ?auto_636593 ?auto_636598 ) ) ( not ( = ?auto_636593 ?auto_636599 ) ) ( not ( = ?auto_636593 ?auto_636600 ) ) ( not ( = ?auto_636593 ?auto_636601 ) ) ( not ( = ?auto_636593 ?auto_636602 ) ) ( not ( = ?auto_636594 ?auto_636595 ) ) ( not ( = ?auto_636594 ?auto_636596 ) ) ( not ( = ?auto_636594 ?auto_636597 ) ) ( not ( = ?auto_636594 ?auto_636598 ) ) ( not ( = ?auto_636594 ?auto_636599 ) ) ( not ( = ?auto_636594 ?auto_636600 ) ) ( not ( = ?auto_636594 ?auto_636601 ) ) ( not ( = ?auto_636594 ?auto_636602 ) ) ( not ( = ?auto_636595 ?auto_636596 ) ) ( not ( = ?auto_636595 ?auto_636597 ) ) ( not ( = ?auto_636595 ?auto_636598 ) ) ( not ( = ?auto_636595 ?auto_636599 ) ) ( not ( = ?auto_636595 ?auto_636600 ) ) ( not ( = ?auto_636595 ?auto_636601 ) ) ( not ( = ?auto_636595 ?auto_636602 ) ) ( not ( = ?auto_636596 ?auto_636597 ) ) ( not ( = ?auto_636596 ?auto_636598 ) ) ( not ( = ?auto_636596 ?auto_636599 ) ) ( not ( = ?auto_636596 ?auto_636600 ) ) ( not ( = ?auto_636596 ?auto_636601 ) ) ( not ( = ?auto_636596 ?auto_636602 ) ) ( not ( = ?auto_636597 ?auto_636598 ) ) ( not ( = ?auto_636597 ?auto_636599 ) ) ( not ( = ?auto_636597 ?auto_636600 ) ) ( not ( = ?auto_636597 ?auto_636601 ) ) ( not ( = ?auto_636597 ?auto_636602 ) ) ( not ( = ?auto_636598 ?auto_636599 ) ) ( not ( = ?auto_636598 ?auto_636600 ) ) ( not ( = ?auto_636598 ?auto_636601 ) ) ( not ( = ?auto_636598 ?auto_636602 ) ) ( not ( = ?auto_636599 ?auto_636600 ) ) ( not ( = ?auto_636599 ?auto_636601 ) ) ( not ( = ?auto_636599 ?auto_636602 ) ) ( not ( = ?auto_636600 ?auto_636601 ) ) ( not ( = ?auto_636600 ?auto_636602 ) ) ( not ( = ?auto_636601 ?auto_636602 ) ) ( ON ?auto_636600 ?auto_636601 ) ( ON ?auto_636599 ?auto_636600 ) ( ON ?auto_636598 ?auto_636599 ) ( CLEAR ?auto_636596 ) ( ON ?auto_636597 ?auto_636598 ) ( CLEAR ?auto_636597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_636592 ?auto_636593 ?auto_636594 ?auto_636595 ?auto_636596 ?auto_636597 )
      ( MAKE-10PILE ?auto_636592 ?auto_636593 ?auto_636594 ?auto_636595 ?auto_636596 ?auto_636597 ?auto_636598 ?auto_636599 ?auto_636600 ?auto_636601 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_636634 - BLOCK
      ?auto_636635 - BLOCK
      ?auto_636636 - BLOCK
      ?auto_636637 - BLOCK
      ?auto_636638 - BLOCK
      ?auto_636639 - BLOCK
      ?auto_636640 - BLOCK
      ?auto_636641 - BLOCK
      ?auto_636642 - BLOCK
      ?auto_636643 - BLOCK
    )
    :vars
    (
      ?auto_636644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_636643 ?auto_636644 ) ( ON-TABLE ?auto_636634 ) ( ON ?auto_636635 ?auto_636634 ) ( ON ?auto_636636 ?auto_636635 ) ( ON ?auto_636637 ?auto_636636 ) ( not ( = ?auto_636634 ?auto_636635 ) ) ( not ( = ?auto_636634 ?auto_636636 ) ) ( not ( = ?auto_636634 ?auto_636637 ) ) ( not ( = ?auto_636634 ?auto_636638 ) ) ( not ( = ?auto_636634 ?auto_636639 ) ) ( not ( = ?auto_636634 ?auto_636640 ) ) ( not ( = ?auto_636634 ?auto_636641 ) ) ( not ( = ?auto_636634 ?auto_636642 ) ) ( not ( = ?auto_636634 ?auto_636643 ) ) ( not ( = ?auto_636634 ?auto_636644 ) ) ( not ( = ?auto_636635 ?auto_636636 ) ) ( not ( = ?auto_636635 ?auto_636637 ) ) ( not ( = ?auto_636635 ?auto_636638 ) ) ( not ( = ?auto_636635 ?auto_636639 ) ) ( not ( = ?auto_636635 ?auto_636640 ) ) ( not ( = ?auto_636635 ?auto_636641 ) ) ( not ( = ?auto_636635 ?auto_636642 ) ) ( not ( = ?auto_636635 ?auto_636643 ) ) ( not ( = ?auto_636635 ?auto_636644 ) ) ( not ( = ?auto_636636 ?auto_636637 ) ) ( not ( = ?auto_636636 ?auto_636638 ) ) ( not ( = ?auto_636636 ?auto_636639 ) ) ( not ( = ?auto_636636 ?auto_636640 ) ) ( not ( = ?auto_636636 ?auto_636641 ) ) ( not ( = ?auto_636636 ?auto_636642 ) ) ( not ( = ?auto_636636 ?auto_636643 ) ) ( not ( = ?auto_636636 ?auto_636644 ) ) ( not ( = ?auto_636637 ?auto_636638 ) ) ( not ( = ?auto_636637 ?auto_636639 ) ) ( not ( = ?auto_636637 ?auto_636640 ) ) ( not ( = ?auto_636637 ?auto_636641 ) ) ( not ( = ?auto_636637 ?auto_636642 ) ) ( not ( = ?auto_636637 ?auto_636643 ) ) ( not ( = ?auto_636637 ?auto_636644 ) ) ( not ( = ?auto_636638 ?auto_636639 ) ) ( not ( = ?auto_636638 ?auto_636640 ) ) ( not ( = ?auto_636638 ?auto_636641 ) ) ( not ( = ?auto_636638 ?auto_636642 ) ) ( not ( = ?auto_636638 ?auto_636643 ) ) ( not ( = ?auto_636638 ?auto_636644 ) ) ( not ( = ?auto_636639 ?auto_636640 ) ) ( not ( = ?auto_636639 ?auto_636641 ) ) ( not ( = ?auto_636639 ?auto_636642 ) ) ( not ( = ?auto_636639 ?auto_636643 ) ) ( not ( = ?auto_636639 ?auto_636644 ) ) ( not ( = ?auto_636640 ?auto_636641 ) ) ( not ( = ?auto_636640 ?auto_636642 ) ) ( not ( = ?auto_636640 ?auto_636643 ) ) ( not ( = ?auto_636640 ?auto_636644 ) ) ( not ( = ?auto_636641 ?auto_636642 ) ) ( not ( = ?auto_636641 ?auto_636643 ) ) ( not ( = ?auto_636641 ?auto_636644 ) ) ( not ( = ?auto_636642 ?auto_636643 ) ) ( not ( = ?auto_636642 ?auto_636644 ) ) ( not ( = ?auto_636643 ?auto_636644 ) ) ( ON ?auto_636642 ?auto_636643 ) ( ON ?auto_636641 ?auto_636642 ) ( ON ?auto_636640 ?auto_636641 ) ( ON ?auto_636639 ?auto_636640 ) ( CLEAR ?auto_636637 ) ( ON ?auto_636638 ?auto_636639 ) ( CLEAR ?auto_636638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_636634 ?auto_636635 ?auto_636636 ?auto_636637 ?auto_636638 )
      ( MAKE-10PILE ?auto_636634 ?auto_636635 ?auto_636636 ?auto_636637 ?auto_636638 ?auto_636639 ?auto_636640 ?auto_636641 ?auto_636642 ?auto_636643 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_636676 - BLOCK
      ?auto_636677 - BLOCK
      ?auto_636678 - BLOCK
      ?auto_636679 - BLOCK
      ?auto_636680 - BLOCK
      ?auto_636681 - BLOCK
      ?auto_636682 - BLOCK
      ?auto_636683 - BLOCK
      ?auto_636684 - BLOCK
      ?auto_636685 - BLOCK
    )
    :vars
    (
      ?auto_636686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_636685 ?auto_636686 ) ( ON-TABLE ?auto_636676 ) ( ON ?auto_636677 ?auto_636676 ) ( ON ?auto_636678 ?auto_636677 ) ( not ( = ?auto_636676 ?auto_636677 ) ) ( not ( = ?auto_636676 ?auto_636678 ) ) ( not ( = ?auto_636676 ?auto_636679 ) ) ( not ( = ?auto_636676 ?auto_636680 ) ) ( not ( = ?auto_636676 ?auto_636681 ) ) ( not ( = ?auto_636676 ?auto_636682 ) ) ( not ( = ?auto_636676 ?auto_636683 ) ) ( not ( = ?auto_636676 ?auto_636684 ) ) ( not ( = ?auto_636676 ?auto_636685 ) ) ( not ( = ?auto_636676 ?auto_636686 ) ) ( not ( = ?auto_636677 ?auto_636678 ) ) ( not ( = ?auto_636677 ?auto_636679 ) ) ( not ( = ?auto_636677 ?auto_636680 ) ) ( not ( = ?auto_636677 ?auto_636681 ) ) ( not ( = ?auto_636677 ?auto_636682 ) ) ( not ( = ?auto_636677 ?auto_636683 ) ) ( not ( = ?auto_636677 ?auto_636684 ) ) ( not ( = ?auto_636677 ?auto_636685 ) ) ( not ( = ?auto_636677 ?auto_636686 ) ) ( not ( = ?auto_636678 ?auto_636679 ) ) ( not ( = ?auto_636678 ?auto_636680 ) ) ( not ( = ?auto_636678 ?auto_636681 ) ) ( not ( = ?auto_636678 ?auto_636682 ) ) ( not ( = ?auto_636678 ?auto_636683 ) ) ( not ( = ?auto_636678 ?auto_636684 ) ) ( not ( = ?auto_636678 ?auto_636685 ) ) ( not ( = ?auto_636678 ?auto_636686 ) ) ( not ( = ?auto_636679 ?auto_636680 ) ) ( not ( = ?auto_636679 ?auto_636681 ) ) ( not ( = ?auto_636679 ?auto_636682 ) ) ( not ( = ?auto_636679 ?auto_636683 ) ) ( not ( = ?auto_636679 ?auto_636684 ) ) ( not ( = ?auto_636679 ?auto_636685 ) ) ( not ( = ?auto_636679 ?auto_636686 ) ) ( not ( = ?auto_636680 ?auto_636681 ) ) ( not ( = ?auto_636680 ?auto_636682 ) ) ( not ( = ?auto_636680 ?auto_636683 ) ) ( not ( = ?auto_636680 ?auto_636684 ) ) ( not ( = ?auto_636680 ?auto_636685 ) ) ( not ( = ?auto_636680 ?auto_636686 ) ) ( not ( = ?auto_636681 ?auto_636682 ) ) ( not ( = ?auto_636681 ?auto_636683 ) ) ( not ( = ?auto_636681 ?auto_636684 ) ) ( not ( = ?auto_636681 ?auto_636685 ) ) ( not ( = ?auto_636681 ?auto_636686 ) ) ( not ( = ?auto_636682 ?auto_636683 ) ) ( not ( = ?auto_636682 ?auto_636684 ) ) ( not ( = ?auto_636682 ?auto_636685 ) ) ( not ( = ?auto_636682 ?auto_636686 ) ) ( not ( = ?auto_636683 ?auto_636684 ) ) ( not ( = ?auto_636683 ?auto_636685 ) ) ( not ( = ?auto_636683 ?auto_636686 ) ) ( not ( = ?auto_636684 ?auto_636685 ) ) ( not ( = ?auto_636684 ?auto_636686 ) ) ( not ( = ?auto_636685 ?auto_636686 ) ) ( ON ?auto_636684 ?auto_636685 ) ( ON ?auto_636683 ?auto_636684 ) ( ON ?auto_636682 ?auto_636683 ) ( ON ?auto_636681 ?auto_636682 ) ( ON ?auto_636680 ?auto_636681 ) ( CLEAR ?auto_636678 ) ( ON ?auto_636679 ?auto_636680 ) ( CLEAR ?auto_636679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_636676 ?auto_636677 ?auto_636678 ?auto_636679 )
      ( MAKE-10PILE ?auto_636676 ?auto_636677 ?auto_636678 ?auto_636679 ?auto_636680 ?auto_636681 ?auto_636682 ?auto_636683 ?auto_636684 ?auto_636685 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_636718 - BLOCK
      ?auto_636719 - BLOCK
      ?auto_636720 - BLOCK
      ?auto_636721 - BLOCK
      ?auto_636722 - BLOCK
      ?auto_636723 - BLOCK
      ?auto_636724 - BLOCK
      ?auto_636725 - BLOCK
      ?auto_636726 - BLOCK
      ?auto_636727 - BLOCK
    )
    :vars
    (
      ?auto_636728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_636727 ?auto_636728 ) ( ON-TABLE ?auto_636718 ) ( ON ?auto_636719 ?auto_636718 ) ( not ( = ?auto_636718 ?auto_636719 ) ) ( not ( = ?auto_636718 ?auto_636720 ) ) ( not ( = ?auto_636718 ?auto_636721 ) ) ( not ( = ?auto_636718 ?auto_636722 ) ) ( not ( = ?auto_636718 ?auto_636723 ) ) ( not ( = ?auto_636718 ?auto_636724 ) ) ( not ( = ?auto_636718 ?auto_636725 ) ) ( not ( = ?auto_636718 ?auto_636726 ) ) ( not ( = ?auto_636718 ?auto_636727 ) ) ( not ( = ?auto_636718 ?auto_636728 ) ) ( not ( = ?auto_636719 ?auto_636720 ) ) ( not ( = ?auto_636719 ?auto_636721 ) ) ( not ( = ?auto_636719 ?auto_636722 ) ) ( not ( = ?auto_636719 ?auto_636723 ) ) ( not ( = ?auto_636719 ?auto_636724 ) ) ( not ( = ?auto_636719 ?auto_636725 ) ) ( not ( = ?auto_636719 ?auto_636726 ) ) ( not ( = ?auto_636719 ?auto_636727 ) ) ( not ( = ?auto_636719 ?auto_636728 ) ) ( not ( = ?auto_636720 ?auto_636721 ) ) ( not ( = ?auto_636720 ?auto_636722 ) ) ( not ( = ?auto_636720 ?auto_636723 ) ) ( not ( = ?auto_636720 ?auto_636724 ) ) ( not ( = ?auto_636720 ?auto_636725 ) ) ( not ( = ?auto_636720 ?auto_636726 ) ) ( not ( = ?auto_636720 ?auto_636727 ) ) ( not ( = ?auto_636720 ?auto_636728 ) ) ( not ( = ?auto_636721 ?auto_636722 ) ) ( not ( = ?auto_636721 ?auto_636723 ) ) ( not ( = ?auto_636721 ?auto_636724 ) ) ( not ( = ?auto_636721 ?auto_636725 ) ) ( not ( = ?auto_636721 ?auto_636726 ) ) ( not ( = ?auto_636721 ?auto_636727 ) ) ( not ( = ?auto_636721 ?auto_636728 ) ) ( not ( = ?auto_636722 ?auto_636723 ) ) ( not ( = ?auto_636722 ?auto_636724 ) ) ( not ( = ?auto_636722 ?auto_636725 ) ) ( not ( = ?auto_636722 ?auto_636726 ) ) ( not ( = ?auto_636722 ?auto_636727 ) ) ( not ( = ?auto_636722 ?auto_636728 ) ) ( not ( = ?auto_636723 ?auto_636724 ) ) ( not ( = ?auto_636723 ?auto_636725 ) ) ( not ( = ?auto_636723 ?auto_636726 ) ) ( not ( = ?auto_636723 ?auto_636727 ) ) ( not ( = ?auto_636723 ?auto_636728 ) ) ( not ( = ?auto_636724 ?auto_636725 ) ) ( not ( = ?auto_636724 ?auto_636726 ) ) ( not ( = ?auto_636724 ?auto_636727 ) ) ( not ( = ?auto_636724 ?auto_636728 ) ) ( not ( = ?auto_636725 ?auto_636726 ) ) ( not ( = ?auto_636725 ?auto_636727 ) ) ( not ( = ?auto_636725 ?auto_636728 ) ) ( not ( = ?auto_636726 ?auto_636727 ) ) ( not ( = ?auto_636726 ?auto_636728 ) ) ( not ( = ?auto_636727 ?auto_636728 ) ) ( ON ?auto_636726 ?auto_636727 ) ( ON ?auto_636725 ?auto_636726 ) ( ON ?auto_636724 ?auto_636725 ) ( ON ?auto_636723 ?auto_636724 ) ( ON ?auto_636722 ?auto_636723 ) ( ON ?auto_636721 ?auto_636722 ) ( CLEAR ?auto_636719 ) ( ON ?auto_636720 ?auto_636721 ) ( CLEAR ?auto_636720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_636718 ?auto_636719 ?auto_636720 )
      ( MAKE-10PILE ?auto_636718 ?auto_636719 ?auto_636720 ?auto_636721 ?auto_636722 ?auto_636723 ?auto_636724 ?auto_636725 ?auto_636726 ?auto_636727 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_636760 - BLOCK
      ?auto_636761 - BLOCK
      ?auto_636762 - BLOCK
      ?auto_636763 - BLOCK
      ?auto_636764 - BLOCK
      ?auto_636765 - BLOCK
      ?auto_636766 - BLOCK
      ?auto_636767 - BLOCK
      ?auto_636768 - BLOCK
      ?auto_636769 - BLOCK
    )
    :vars
    (
      ?auto_636770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_636769 ?auto_636770 ) ( ON-TABLE ?auto_636760 ) ( not ( = ?auto_636760 ?auto_636761 ) ) ( not ( = ?auto_636760 ?auto_636762 ) ) ( not ( = ?auto_636760 ?auto_636763 ) ) ( not ( = ?auto_636760 ?auto_636764 ) ) ( not ( = ?auto_636760 ?auto_636765 ) ) ( not ( = ?auto_636760 ?auto_636766 ) ) ( not ( = ?auto_636760 ?auto_636767 ) ) ( not ( = ?auto_636760 ?auto_636768 ) ) ( not ( = ?auto_636760 ?auto_636769 ) ) ( not ( = ?auto_636760 ?auto_636770 ) ) ( not ( = ?auto_636761 ?auto_636762 ) ) ( not ( = ?auto_636761 ?auto_636763 ) ) ( not ( = ?auto_636761 ?auto_636764 ) ) ( not ( = ?auto_636761 ?auto_636765 ) ) ( not ( = ?auto_636761 ?auto_636766 ) ) ( not ( = ?auto_636761 ?auto_636767 ) ) ( not ( = ?auto_636761 ?auto_636768 ) ) ( not ( = ?auto_636761 ?auto_636769 ) ) ( not ( = ?auto_636761 ?auto_636770 ) ) ( not ( = ?auto_636762 ?auto_636763 ) ) ( not ( = ?auto_636762 ?auto_636764 ) ) ( not ( = ?auto_636762 ?auto_636765 ) ) ( not ( = ?auto_636762 ?auto_636766 ) ) ( not ( = ?auto_636762 ?auto_636767 ) ) ( not ( = ?auto_636762 ?auto_636768 ) ) ( not ( = ?auto_636762 ?auto_636769 ) ) ( not ( = ?auto_636762 ?auto_636770 ) ) ( not ( = ?auto_636763 ?auto_636764 ) ) ( not ( = ?auto_636763 ?auto_636765 ) ) ( not ( = ?auto_636763 ?auto_636766 ) ) ( not ( = ?auto_636763 ?auto_636767 ) ) ( not ( = ?auto_636763 ?auto_636768 ) ) ( not ( = ?auto_636763 ?auto_636769 ) ) ( not ( = ?auto_636763 ?auto_636770 ) ) ( not ( = ?auto_636764 ?auto_636765 ) ) ( not ( = ?auto_636764 ?auto_636766 ) ) ( not ( = ?auto_636764 ?auto_636767 ) ) ( not ( = ?auto_636764 ?auto_636768 ) ) ( not ( = ?auto_636764 ?auto_636769 ) ) ( not ( = ?auto_636764 ?auto_636770 ) ) ( not ( = ?auto_636765 ?auto_636766 ) ) ( not ( = ?auto_636765 ?auto_636767 ) ) ( not ( = ?auto_636765 ?auto_636768 ) ) ( not ( = ?auto_636765 ?auto_636769 ) ) ( not ( = ?auto_636765 ?auto_636770 ) ) ( not ( = ?auto_636766 ?auto_636767 ) ) ( not ( = ?auto_636766 ?auto_636768 ) ) ( not ( = ?auto_636766 ?auto_636769 ) ) ( not ( = ?auto_636766 ?auto_636770 ) ) ( not ( = ?auto_636767 ?auto_636768 ) ) ( not ( = ?auto_636767 ?auto_636769 ) ) ( not ( = ?auto_636767 ?auto_636770 ) ) ( not ( = ?auto_636768 ?auto_636769 ) ) ( not ( = ?auto_636768 ?auto_636770 ) ) ( not ( = ?auto_636769 ?auto_636770 ) ) ( ON ?auto_636768 ?auto_636769 ) ( ON ?auto_636767 ?auto_636768 ) ( ON ?auto_636766 ?auto_636767 ) ( ON ?auto_636765 ?auto_636766 ) ( ON ?auto_636764 ?auto_636765 ) ( ON ?auto_636763 ?auto_636764 ) ( ON ?auto_636762 ?auto_636763 ) ( CLEAR ?auto_636760 ) ( ON ?auto_636761 ?auto_636762 ) ( CLEAR ?auto_636761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_636760 ?auto_636761 )
      ( MAKE-10PILE ?auto_636760 ?auto_636761 ?auto_636762 ?auto_636763 ?auto_636764 ?auto_636765 ?auto_636766 ?auto_636767 ?auto_636768 ?auto_636769 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_636802 - BLOCK
      ?auto_636803 - BLOCK
      ?auto_636804 - BLOCK
      ?auto_636805 - BLOCK
      ?auto_636806 - BLOCK
      ?auto_636807 - BLOCK
      ?auto_636808 - BLOCK
      ?auto_636809 - BLOCK
      ?auto_636810 - BLOCK
      ?auto_636811 - BLOCK
    )
    :vars
    (
      ?auto_636812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_636811 ?auto_636812 ) ( not ( = ?auto_636802 ?auto_636803 ) ) ( not ( = ?auto_636802 ?auto_636804 ) ) ( not ( = ?auto_636802 ?auto_636805 ) ) ( not ( = ?auto_636802 ?auto_636806 ) ) ( not ( = ?auto_636802 ?auto_636807 ) ) ( not ( = ?auto_636802 ?auto_636808 ) ) ( not ( = ?auto_636802 ?auto_636809 ) ) ( not ( = ?auto_636802 ?auto_636810 ) ) ( not ( = ?auto_636802 ?auto_636811 ) ) ( not ( = ?auto_636802 ?auto_636812 ) ) ( not ( = ?auto_636803 ?auto_636804 ) ) ( not ( = ?auto_636803 ?auto_636805 ) ) ( not ( = ?auto_636803 ?auto_636806 ) ) ( not ( = ?auto_636803 ?auto_636807 ) ) ( not ( = ?auto_636803 ?auto_636808 ) ) ( not ( = ?auto_636803 ?auto_636809 ) ) ( not ( = ?auto_636803 ?auto_636810 ) ) ( not ( = ?auto_636803 ?auto_636811 ) ) ( not ( = ?auto_636803 ?auto_636812 ) ) ( not ( = ?auto_636804 ?auto_636805 ) ) ( not ( = ?auto_636804 ?auto_636806 ) ) ( not ( = ?auto_636804 ?auto_636807 ) ) ( not ( = ?auto_636804 ?auto_636808 ) ) ( not ( = ?auto_636804 ?auto_636809 ) ) ( not ( = ?auto_636804 ?auto_636810 ) ) ( not ( = ?auto_636804 ?auto_636811 ) ) ( not ( = ?auto_636804 ?auto_636812 ) ) ( not ( = ?auto_636805 ?auto_636806 ) ) ( not ( = ?auto_636805 ?auto_636807 ) ) ( not ( = ?auto_636805 ?auto_636808 ) ) ( not ( = ?auto_636805 ?auto_636809 ) ) ( not ( = ?auto_636805 ?auto_636810 ) ) ( not ( = ?auto_636805 ?auto_636811 ) ) ( not ( = ?auto_636805 ?auto_636812 ) ) ( not ( = ?auto_636806 ?auto_636807 ) ) ( not ( = ?auto_636806 ?auto_636808 ) ) ( not ( = ?auto_636806 ?auto_636809 ) ) ( not ( = ?auto_636806 ?auto_636810 ) ) ( not ( = ?auto_636806 ?auto_636811 ) ) ( not ( = ?auto_636806 ?auto_636812 ) ) ( not ( = ?auto_636807 ?auto_636808 ) ) ( not ( = ?auto_636807 ?auto_636809 ) ) ( not ( = ?auto_636807 ?auto_636810 ) ) ( not ( = ?auto_636807 ?auto_636811 ) ) ( not ( = ?auto_636807 ?auto_636812 ) ) ( not ( = ?auto_636808 ?auto_636809 ) ) ( not ( = ?auto_636808 ?auto_636810 ) ) ( not ( = ?auto_636808 ?auto_636811 ) ) ( not ( = ?auto_636808 ?auto_636812 ) ) ( not ( = ?auto_636809 ?auto_636810 ) ) ( not ( = ?auto_636809 ?auto_636811 ) ) ( not ( = ?auto_636809 ?auto_636812 ) ) ( not ( = ?auto_636810 ?auto_636811 ) ) ( not ( = ?auto_636810 ?auto_636812 ) ) ( not ( = ?auto_636811 ?auto_636812 ) ) ( ON ?auto_636810 ?auto_636811 ) ( ON ?auto_636809 ?auto_636810 ) ( ON ?auto_636808 ?auto_636809 ) ( ON ?auto_636807 ?auto_636808 ) ( ON ?auto_636806 ?auto_636807 ) ( ON ?auto_636805 ?auto_636806 ) ( ON ?auto_636804 ?auto_636805 ) ( ON ?auto_636803 ?auto_636804 ) ( ON ?auto_636802 ?auto_636803 ) ( CLEAR ?auto_636802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_636802 )
      ( MAKE-10PILE ?auto_636802 ?auto_636803 ?auto_636804 ?auto_636805 ?auto_636806 ?auto_636807 ?auto_636808 ?auto_636809 ?auto_636810 ?auto_636811 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_636845 - BLOCK
      ?auto_636846 - BLOCK
      ?auto_636847 - BLOCK
      ?auto_636848 - BLOCK
      ?auto_636849 - BLOCK
      ?auto_636850 - BLOCK
      ?auto_636851 - BLOCK
      ?auto_636852 - BLOCK
      ?auto_636853 - BLOCK
      ?auto_636854 - BLOCK
      ?auto_636855 - BLOCK
    )
    :vars
    (
      ?auto_636856 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_636854 ) ( ON ?auto_636855 ?auto_636856 ) ( CLEAR ?auto_636855 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_636845 ) ( ON ?auto_636846 ?auto_636845 ) ( ON ?auto_636847 ?auto_636846 ) ( ON ?auto_636848 ?auto_636847 ) ( ON ?auto_636849 ?auto_636848 ) ( ON ?auto_636850 ?auto_636849 ) ( ON ?auto_636851 ?auto_636850 ) ( ON ?auto_636852 ?auto_636851 ) ( ON ?auto_636853 ?auto_636852 ) ( ON ?auto_636854 ?auto_636853 ) ( not ( = ?auto_636845 ?auto_636846 ) ) ( not ( = ?auto_636845 ?auto_636847 ) ) ( not ( = ?auto_636845 ?auto_636848 ) ) ( not ( = ?auto_636845 ?auto_636849 ) ) ( not ( = ?auto_636845 ?auto_636850 ) ) ( not ( = ?auto_636845 ?auto_636851 ) ) ( not ( = ?auto_636845 ?auto_636852 ) ) ( not ( = ?auto_636845 ?auto_636853 ) ) ( not ( = ?auto_636845 ?auto_636854 ) ) ( not ( = ?auto_636845 ?auto_636855 ) ) ( not ( = ?auto_636845 ?auto_636856 ) ) ( not ( = ?auto_636846 ?auto_636847 ) ) ( not ( = ?auto_636846 ?auto_636848 ) ) ( not ( = ?auto_636846 ?auto_636849 ) ) ( not ( = ?auto_636846 ?auto_636850 ) ) ( not ( = ?auto_636846 ?auto_636851 ) ) ( not ( = ?auto_636846 ?auto_636852 ) ) ( not ( = ?auto_636846 ?auto_636853 ) ) ( not ( = ?auto_636846 ?auto_636854 ) ) ( not ( = ?auto_636846 ?auto_636855 ) ) ( not ( = ?auto_636846 ?auto_636856 ) ) ( not ( = ?auto_636847 ?auto_636848 ) ) ( not ( = ?auto_636847 ?auto_636849 ) ) ( not ( = ?auto_636847 ?auto_636850 ) ) ( not ( = ?auto_636847 ?auto_636851 ) ) ( not ( = ?auto_636847 ?auto_636852 ) ) ( not ( = ?auto_636847 ?auto_636853 ) ) ( not ( = ?auto_636847 ?auto_636854 ) ) ( not ( = ?auto_636847 ?auto_636855 ) ) ( not ( = ?auto_636847 ?auto_636856 ) ) ( not ( = ?auto_636848 ?auto_636849 ) ) ( not ( = ?auto_636848 ?auto_636850 ) ) ( not ( = ?auto_636848 ?auto_636851 ) ) ( not ( = ?auto_636848 ?auto_636852 ) ) ( not ( = ?auto_636848 ?auto_636853 ) ) ( not ( = ?auto_636848 ?auto_636854 ) ) ( not ( = ?auto_636848 ?auto_636855 ) ) ( not ( = ?auto_636848 ?auto_636856 ) ) ( not ( = ?auto_636849 ?auto_636850 ) ) ( not ( = ?auto_636849 ?auto_636851 ) ) ( not ( = ?auto_636849 ?auto_636852 ) ) ( not ( = ?auto_636849 ?auto_636853 ) ) ( not ( = ?auto_636849 ?auto_636854 ) ) ( not ( = ?auto_636849 ?auto_636855 ) ) ( not ( = ?auto_636849 ?auto_636856 ) ) ( not ( = ?auto_636850 ?auto_636851 ) ) ( not ( = ?auto_636850 ?auto_636852 ) ) ( not ( = ?auto_636850 ?auto_636853 ) ) ( not ( = ?auto_636850 ?auto_636854 ) ) ( not ( = ?auto_636850 ?auto_636855 ) ) ( not ( = ?auto_636850 ?auto_636856 ) ) ( not ( = ?auto_636851 ?auto_636852 ) ) ( not ( = ?auto_636851 ?auto_636853 ) ) ( not ( = ?auto_636851 ?auto_636854 ) ) ( not ( = ?auto_636851 ?auto_636855 ) ) ( not ( = ?auto_636851 ?auto_636856 ) ) ( not ( = ?auto_636852 ?auto_636853 ) ) ( not ( = ?auto_636852 ?auto_636854 ) ) ( not ( = ?auto_636852 ?auto_636855 ) ) ( not ( = ?auto_636852 ?auto_636856 ) ) ( not ( = ?auto_636853 ?auto_636854 ) ) ( not ( = ?auto_636853 ?auto_636855 ) ) ( not ( = ?auto_636853 ?auto_636856 ) ) ( not ( = ?auto_636854 ?auto_636855 ) ) ( not ( = ?auto_636854 ?auto_636856 ) ) ( not ( = ?auto_636855 ?auto_636856 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_636855 ?auto_636856 )
      ( !STACK ?auto_636855 ?auto_636854 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_636891 - BLOCK
      ?auto_636892 - BLOCK
      ?auto_636893 - BLOCK
      ?auto_636894 - BLOCK
      ?auto_636895 - BLOCK
      ?auto_636896 - BLOCK
      ?auto_636897 - BLOCK
      ?auto_636898 - BLOCK
      ?auto_636899 - BLOCK
      ?auto_636900 - BLOCK
      ?auto_636901 - BLOCK
    )
    :vars
    (
      ?auto_636902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_636901 ?auto_636902 ) ( ON-TABLE ?auto_636891 ) ( ON ?auto_636892 ?auto_636891 ) ( ON ?auto_636893 ?auto_636892 ) ( ON ?auto_636894 ?auto_636893 ) ( ON ?auto_636895 ?auto_636894 ) ( ON ?auto_636896 ?auto_636895 ) ( ON ?auto_636897 ?auto_636896 ) ( ON ?auto_636898 ?auto_636897 ) ( ON ?auto_636899 ?auto_636898 ) ( not ( = ?auto_636891 ?auto_636892 ) ) ( not ( = ?auto_636891 ?auto_636893 ) ) ( not ( = ?auto_636891 ?auto_636894 ) ) ( not ( = ?auto_636891 ?auto_636895 ) ) ( not ( = ?auto_636891 ?auto_636896 ) ) ( not ( = ?auto_636891 ?auto_636897 ) ) ( not ( = ?auto_636891 ?auto_636898 ) ) ( not ( = ?auto_636891 ?auto_636899 ) ) ( not ( = ?auto_636891 ?auto_636900 ) ) ( not ( = ?auto_636891 ?auto_636901 ) ) ( not ( = ?auto_636891 ?auto_636902 ) ) ( not ( = ?auto_636892 ?auto_636893 ) ) ( not ( = ?auto_636892 ?auto_636894 ) ) ( not ( = ?auto_636892 ?auto_636895 ) ) ( not ( = ?auto_636892 ?auto_636896 ) ) ( not ( = ?auto_636892 ?auto_636897 ) ) ( not ( = ?auto_636892 ?auto_636898 ) ) ( not ( = ?auto_636892 ?auto_636899 ) ) ( not ( = ?auto_636892 ?auto_636900 ) ) ( not ( = ?auto_636892 ?auto_636901 ) ) ( not ( = ?auto_636892 ?auto_636902 ) ) ( not ( = ?auto_636893 ?auto_636894 ) ) ( not ( = ?auto_636893 ?auto_636895 ) ) ( not ( = ?auto_636893 ?auto_636896 ) ) ( not ( = ?auto_636893 ?auto_636897 ) ) ( not ( = ?auto_636893 ?auto_636898 ) ) ( not ( = ?auto_636893 ?auto_636899 ) ) ( not ( = ?auto_636893 ?auto_636900 ) ) ( not ( = ?auto_636893 ?auto_636901 ) ) ( not ( = ?auto_636893 ?auto_636902 ) ) ( not ( = ?auto_636894 ?auto_636895 ) ) ( not ( = ?auto_636894 ?auto_636896 ) ) ( not ( = ?auto_636894 ?auto_636897 ) ) ( not ( = ?auto_636894 ?auto_636898 ) ) ( not ( = ?auto_636894 ?auto_636899 ) ) ( not ( = ?auto_636894 ?auto_636900 ) ) ( not ( = ?auto_636894 ?auto_636901 ) ) ( not ( = ?auto_636894 ?auto_636902 ) ) ( not ( = ?auto_636895 ?auto_636896 ) ) ( not ( = ?auto_636895 ?auto_636897 ) ) ( not ( = ?auto_636895 ?auto_636898 ) ) ( not ( = ?auto_636895 ?auto_636899 ) ) ( not ( = ?auto_636895 ?auto_636900 ) ) ( not ( = ?auto_636895 ?auto_636901 ) ) ( not ( = ?auto_636895 ?auto_636902 ) ) ( not ( = ?auto_636896 ?auto_636897 ) ) ( not ( = ?auto_636896 ?auto_636898 ) ) ( not ( = ?auto_636896 ?auto_636899 ) ) ( not ( = ?auto_636896 ?auto_636900 ) ) ( not ( = ?auto_636896 ?auto_636901 ) ) ( not ( = ?auto_636896 ?auto_636902 ) ) ( not ( = ?auto_636897 ?auto_636898 ) ) ( not ( = ?auto_636897 ?auto_636899 ) ) ( not ( = ?auto_636897 ?auto_636900 ) ) ( not ( = ?auto_636897 ?auto_636901 ) ) ( not ( = ?auto_636897 ?auto_636902 ) ) ( not ( = ?auto_636898 ?auto_636899 ) ) ( not ( = ?auto_636898 ?auto_636900 ) ) ( not ( = ?auto_636898 ?auto_636901 ) ) ( not ( = ?auto_636898 ?auto_636902 ) ) ( not ( = ?auto_636899 ?auto_636900 ) ) ( not ( = ?auto_636899 ?auto_636901 ) ) ( not ( = ?auto_636899 ?auto_636902 ) ) ( not ( = ?auto_636900 ?auto_636901 ) ) ( not ( = ?auto_636900 ?auto_636902 ) ) ( not ( = ?auto_636901 ?auto_636902 ) ) ( CLEAR ?auto_636899 ) ( ON ?auto_636900 ?auto_636901 ) ( CLEAR ?auto_636900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_636891 ?auto_636892 ?auto_636893 ?auto_636894 ?auto_636895 ?auto_636896 ?auto_636897 ?auto_636898 ?auto_636899 ?auto_636900 )
      ( MAKE-11PILE ?auto_636891 ?auto_636892 ?auto_636893 ?auto_636894 ?auto_636895 ?auto_636896 ?auto_636897 ?auto_636898 ?auto_636899 ?auto_636900 ?auto_636901 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_636937 - BLOCK
      ?auto_636938 - BLOCK
      ?auto_636939 - BLOCK
      ?auto_636940 - BLOCK
      ?auto_636941 - BLOCK
      ?auto_636942 - BLOCK
      ?auto_636943 - BLOCK
      ?auto_636944 - BLOCK
      ?auto_636945 - BLOCK
      ?auto_636946 - BLOCK
      ?auto_636947 - BLOCK
    )
    :vars
    (
      ?auto_636948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_636947 ?auto_636948 ) ( ON-TABLE ?auto_636937 ) ( ON ?auto_636938 ?auto_636937 ) ( ON ?auto_636939 ?auto_636938 ) ( ON ?auto_636940 ?auto_636939 ) ( ON ?auto_636941 ?auto_636940 ) ( ON ?auto_636942 ?auto_636941 ) ( ON ?auto_636943 ?auto_636942 ) ( ON ?auto_636944 ?auto_636943 ) ( not ( = ?auto_636937 ?auto_636938 ) ) ( not ( = ?auto_636937 ?auto_636939 ) ) ( not ( = ?auto_636937 ?auto_636940 ) ) ( not ( = ?auto_636937 ?auto_636941 ) ) ( not ( = ?auto_636937 ?auto_636942 ) ) ( not ( = ?auto_636937 ?auto_636943 ) ) ( not ( = ?auto_636937 ?auto_636944 ) ) ( not ( = ?auto_636937 ?auto_636945 ) ) ( not ( = ?auto_636937 ?auto_636946 ) ) ( not ( = ?auto_636937 ?auto_636947 ) ) ( not ( = ?auto_636937 ?auto_636948 ) ) ( not ( = ?auto_636938 ?auto_636939 ) ) ( not ( = ?auto_636938 ?auto_636940 ) ) ( not ( = ?auto_636938 ?auto_636941 ) ) ( not ( = ?auto_636938 ?auto_636942 ) ) ( not ( = ?auto_636938 ?auto_636943 ) ) ( not ( = ?auto_636938 ?auto_636944 ) ) ( not ( = ?auto_636938 ?auto_636945 ) ) ( not ( = ?auto_636938 ?auto_636946 ) ) ( not ( = ?auto_636938 ?auto_636947 ) ) ( not ( = ?auto_636938 ?auto_636948 ) ) ( not ( = ?auto_636939 ?auto_636940 ) ) ( not ( = ?auto_636939 ?auto_636941 ) ) ( not ( = ?auto_636939 ?auto_636942 ) ) ( not ( = ?auto_636939 ?auto_636943 ) ) ( not ( = ?auto_636939 ?auto_636944 ) ) ( not ( = ?auto_636939 ?auto_636945 ) ) ( not ( = ?auto_636939 ?auto_636946 ) ) ( not ( = ?auto_636939 ?auto_636947 ) ) ( not ( = ?auto_636939 ?auto_636948 ) ) ( not ( = ?auto_636940 ?auto_636941 ) ) ( not ( = ?auto_636940 ?auto_636942 ) ) ( not ( = ?auto_636940 ?auto_636943 ) ) ( not ( = ?auto_636940 ?auto_636944 ) ) ( not ( = ?auto_636940 ?auto_636945 ) ) ( not ( = ?auto_636940 ?auto_636946 ) ) ( not ( = ?auto_636940 ?auto_636947 ) ) ( not ( = ?auto_636940 ?auto_636948 ) ) ( not ( = ?auto_636941 ?auto_636942 ) ) ( not ( = ?auto_636941 ?auto_636943 ) ) ( not ( = ?auto_636941 ?auto_636944 ) ) ( not ( = ?auto_636941 ?auto_636945 ) ) ( not ( = ?auto_636941 ?auto_636946 ) ) ( not ( = ?auto_636941 ?auto_636947 ) ) ( not ( = ?auto_636941 ?auto_636948 ) ) ( not ( = ?auto_636942 ?auto_636943 ) ) ( not ( = ?auto_636942 ?auto_636944 ) ) ( not ( = ?auto_636942 ?auto_636945 ) ) ( not ( = ?auto_636942 ?auto_636946 ) ) ( not ( = ?auto_636942 ?auto_636947 ) ) ( not ( = ?auto_636942 ?auto_636948 ) ) ( not ( = ?auto_636943 ?auto_636944 ) ) ( not ( = ?auto_636943 ?auto_636945 ) ) ( not ( = ?auto_636943 ?auto_636946 ) ) ( not ( = ?auto_636943 ?auto_636947 ) ) ( not ( = ?auto_636943 ?auto_636948 ) ) ( not ( = ?auto_636944 ?auto_636945 ) ) ( not ( = ?auto_636944 ?auto_636946 ) ) ( not ( = ?auto_636944 ?auto_636947 ) ) ( not ( = ?auto_636944 ?auto_636948 ) ) ( not ( = ?auto_636945 ?auto_636946 ) ) ( not ( = ?auto_636945 ?auto_636947 ) ) ( not ( = ?auto_636945 ?auto_636948 ) ) ( not ( = ?auto_636946 ?auto_636947 ) ) ( not ( = ?auto_636946 ?auto_636948 ) ) ( not ( = ?auto_636947 ?auto_636948 ) ) ( ON ?auto_636946 ?auto_636947 ) ( CLEAR ?auto_636944 ) ( ON ?auto_636945 ?auto_636946 ) ( CLEAR ?auto_636945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_636937 ?auto_636938 ?auto_636939 ?auto_636940 ?auto_636941 ?auto_636942 ?auto_636943 ?auto_636944 ?auto_636945 )
      ( MAKE-11PILE ?auto_636937 ?auto_636938 ?auto_636939 ?auto_636940 ?auto_636941 ?auto_636942 ?auto_636943 ?auto_636944 ?auto_636945 ?auto_636946 ?auto_636947 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_636983 - BLOCK
      ?auto_636984 - BLOCK
      ?auto_636985 - BLOCK
      ?auto_636986 - BLOCK
      ?auto_636987 - BLOCK
      ?auto_636988 - BLOCK
      ?auto_636989 - BLOCK
      ?auto_636990 - BLOCK
      ?auto_636991 - BLOCK
      ?auto_636992 - BLOCK
      ?auto_636993 - BLOCK
    )
    :vars
    (
      ?auto_636994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_636993 ?auto_636994 ) ( ON-TABLE ?auto_636983 ) ( ON ?auto_636984 ?auto_636983 ) ( ON ?auto_636985 ?auto_636984 ) ( ON ?auto_636986 ?auto_636985 ) ( ON ?auto_636987 ?auto_636986 ) ( ON ?auto_636988 ?auto_636987 ) ( ON ?auto_636989 ?auto_636988 ) ( not ( = ?auto_636983 ?auto_636984 ) ) ( not ( = ?auto_636983 ?auto_636985 ) ) ( not ( = ?auto_636983 ?auto_636986 ) ) ( not ( = ?auto_636983 ?auto_636987 ) ) ( not ( = ?auto_636983 ?auto_636988 ) ) ( not ( = ?auto_636983 ?auto_636989 ) ) ( not ( = ?auto_636983 ?auto_636990 ) ) ( not ( = ?auto_636983 ?auto_636991 ) ) ( not ( = ?auto_636983 ?auto_636992 ) ) ( not ( = ?auto_636983 ?auto_636993 ) ) ( not ( = ?auto_636983 ?auto_636994 ) ) ( not ( = ?auto_636984 ?auto_636985 ) ) ( not ( = ?auto_636984 ?auto_636986 ) ) ( not ( = ?auto_636984 ?auto_636987 ) ) ( not ( = ?auto_636984 ?auto_636988 ) ) ( not ( = ?auto_636984 ?auto_636989 ) ) ( not ( = ?auto_636984 ?auto_636990 ) ) ( not ( = ?auto_636984 ?auto_636991 ) ) ( not ( = ?auto_636984 ?auto_636992 ) ) ( not ( = ?auto_636984 ?auto_636993 ) ) ( not ( = ?auto_636984 ?auto_636994 ) ) ( not ( = ?auto_636985 ?auto_636986 ) ) ( not ( = ?auto_636985 ?auto_636987 ) ) ( not ( = ?auto_636985 ?auto_636988 ) ) ( not ( = ?auto_636985 ?auto_636989 ) ) ( not ( = ?auto_636985 ?auto_636990 ) ) ( not ( = ?auto_636985 ?auto_636991 ) ) ( not ( = ?auto_636985 ?auto_636992 ) ) ( not ( = ?auto_636985 ?auto_636993 ) ) ( not ( = ?auto_636985 ?auto_636994 ) ) ( not ( = ?auto_636986 ?auto_636987 ) ) ( not ( = ?auto_636986 ?auto_636988 ) ) ( not ( = ?auto_636986 ?auto_636989 ) ) ( not ( = ?auto_636986 ?auto_636990 ) ) ( not ( = ?auto_636986 ?auto_636991 ) ) ( not ( = ?auto_636986 ?auto_636992 ) ) ( not ( = ?auto_636986 ?auto_636993 ) ) ( not ( = ?auto_636986 ?auto_636994 ) ) ( not ( = ?auto_636987 ?auto_636988 ) ) ( not ( = ?auto_636987 ?auto_636989 ) ) ( not ( = ?auto_636987 ?auto_636990 ) ) ( not ( = ?auto_636987 ?auto_636991 ) ) ( not ( = ?auto_636987 ?auto_636992 ) ) ( not ( = ?auto_636987 ?auto_636993 ) ) ( not ( = ?auto_636987 ?auto_636994 ) ) ( not ( = ?auto_636988 ?auto_636989 ) ) ( not ( = ?auto_636988 ?auto_636990 ) ) ( not ( = ?auto_636988 ?auto_636991 ) ) ( not ( = ?auto_636988 ?auto_636992 ) ) ( not ( = ?auto_636988 ?auto_636993 ) ) ( not ( = ?auto_636988 ?auto_636994 ) ) ( not ( = ?auto_636989 ?auto_636990 ) ) ( not ( = ?auto_636989 ?auto_636991 ) ) ( not ( = ?auto_636989 ?auto_636992 ) ) ( not ( = ?auto_636989 ?auto_636993 ) ) ( not ( = ?auto_636989 ?auto_636994 ) ) ( not ( = ?auto_636990 ?auto_636991 ) ) ( not ( = ?auto_636990 ?auto_636992 ) ) ( not ( = ?auto_636990 ?auto_636993 ) ) ( not ( = ?auto_636990 ?auto_636994 ) ) ( not ( = ?auto_636991 ?auto_636992 ) ) ( not ( = ?auto_636991 ?auto_636993 ) ) ( not ( = ?auto_636991 ?auto_636994 ) ) ( not ( = ?auto_636992 ?auto_636993 ) ) ( not ( = ?auto_636992 ?auto_636994 ) ) ( not ( = ?auto_636993 ?auto_636994 ) ) ( ON ?auto_636992 ?auto_636993 ) ( ON ?auto_636991 ?auto_636992 ) ( CLEAR ?auto_636989 ) ( ON ?auto_636990 ?auto_636991 ) ( CLEAR ?auto_636990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_636983 ?auto_636984 ?auto_636985 ?auto_636986 ?auto_636987 ?auto_636988 ?auto_636989 ?auto_636990 )
      ( MAKE-11PILE ?auto_636983 ?auto_636984 ?auto_636985 ?auto_636986 ?auto_636987 ?auto_636988 ?auto_636989 ?auto_636990 ?auto_636991 ?auto_636992 ?auto_636993 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_637029 - BLOCK
      ?auto_637030 - BLOCK
      ?auto_637031 - BLOCK
      ?auto_637032 - BLOCK
      ?auto_637033 - BLOCK
      ?auto_637034 - BLOCK
      ?auto_637035 - BLOCK
      ?auto_637036 - BLOCK
      ?auto_637037 - BLOCK
      ?auto_637038 - BLOCK
      ?auto_637039 - BLOCK
    )
    :vars
    (
      ?auto_637040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_637039 ?auto_637040 ) ( ON-TABLE ?auto_637029 ) ( ON ?auto_637030 ?auto_637029 ) ( ON ?auto_637031 ?auto_637030 ) ( ON ?auto_637032 ?auto_637031 ) ( ON ?auto_637033 ?auto_637032 ) ( ON ?auto_637034 ?auto_637033 ) ( not ( = ?auto_637029 ?auto_637030 ) ) ( not ( = ?auto_637029 ?auto_637031 ) ) ( not ( = ?auto_637029 ?auto_637032 ) ) ( not ( = ?auto_637029 ?auto_637033 ) ) ( not ( = ?auto_637029 ?auto_637034 ) ) ( not ( = ?auto_637029 ?auto_637035 ) ) ( not ( = ?auto_637029 ?auto_637036 ) ) ( not ( = ?auto_637029 ?auto_637037 ) ) ( not ( = ?auto_637029 ?auto_637038 ) ) ( not ( = ?auto_637029 ?auto_637039 ) ) ( not ( = ?auto_637029 ?auto_637040 ) ) ( not ( = ?auto_637030 ?auto_637031 ) ) ( not ( = ?auto_637030 ?auto_637032 ) ) ( not ( = ?auto_637030 ?auto_637033 ) ) ( not ( = ?auto_637030 ?auto_637034 ) ) ( not ( = ?auto_637030 ?auto_637035 ) ) ( not ( = ?auto_637030 ?auto_637036 ) ) ( not ( = ?auto_637030 ?auto_637037 ) ) ( not ( = ?auto_637030 ?auto_637038 ) ) ( not ( = ?auto_637030 ?auto_637039 ) ) ( not ( = ?auto_637030 ?auto_637040 ) ) ( not ( = ?auto_637031 ?auto_637032 ) ) ( not ( = ?auto_637031 ?auto_637033 ) ) ( not ( = ?auto_637031 ?auto_637034 ) ) ( not ( = ?auto_637031 ?auto_637035 ) ) ( not ( = ?auto_637031 ?auto_637036 ) ) ( not ( = ?auto_637031 ?auto_637037 ) ) ( not ( = ?auto_637031 ?auto_637038 ) ) ( not ( = ?auto_637031 ?auto_637039 ) ) ( not ( = ?auto_637031 ?auto_637040 ) ) ( not ( = ?auto_637032 ?auto_637033 ) ) ( not ( = ?auto_637032 ?auto_637034 ) ) ( not ( = ?auto_637032 ?auto_637035 ) ) ( not ( = ?auto_637032 ?auto_637036 ) ) ( not ( = ?auto_637032 ?auto_637037 ) ) ( not ( = ?auto_637032 ?auto_637038 ) ) ( not ( = ?auto_637032 ?auto_637039 ) ) ( not ( = ?auto_637032 ?auto_637040 ) ) ( not ( = ?auto_637033 ?auto_637034 ) ) ( not ( = ?auto_637033 ?auto_637035 ) ) ( not ( = ?auto_637033 ?auto_637036 ) ) ( not ( = ?auto_637033 ?auto_637037 ) ) ( not ( = ?auto_637033 ?auto_637038 ) ) ( not ( = ?auto_637033 ?auto_637039 ) ) ( not ( = ?auto_637033 ?auto_637040 ) ) ( not ( = ?auto_637034 ?auto_637035 ) ) ( not ( = ?auto_637034 ?auto_637036 ) ) ( not ( = ?auto_637034 ?auto_637037 ) ) ( not ( = ?auto_637034 ?auto_637038 ) ) ( not ( = ?auto_637034 ?auto_637039 ) ) ( not ( = ?auto_637034 ?auto_637040 ) ) ( not ( = ?auto_637035 ?auto_637036 ) ) ( not ( = ?auto_637035 ?auto_637037 ) ) ( not ( = ?auto_637035 ?auto_637038 ) ) ( not ( = ?auto_637035 ?auto_637039 ) ) ( not ( = ?auto_637035 ?auto_637040 ) ) ( not ( = ?auto_637036 ?auto_637037 ) ) ( not ( = ?auto_637036 ?auto_637038 ) ) ( not ( = ?auto_637036 ?auto_637039 ) ) ( not ( = ?auto_637036 ?auto_637040 ) ) ( not ( = ?auto_637037 ?auto_637038 ) ) ( not ( = ?auto_637037 ?auto_637039 ) ) ( not ( = ?auto_637037 ?auto_637040 ) ) ( not ( = ?auto_637038 ?auto_637039 ) ) ( not ( = ?auto_637038 ?auto_637040 ) ) ( not ( = ?auto_637039 ?auto_637040 ) ) ( ON ?auto_637038 ?auto_637039 ) ( ON ?auto_637037 ?auto_637038 ) ( ON ?auto_637036 ?auto_637037 ) ( CLEAR ?auto_637034 ) ( ON ?auto_637035 ?auto_637036 ) ( CLEAR ?auto_637035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_637029 ?auto_637030 ?auto_637031 ?auto_637032 ?auto_637033 ?auto_637034 ?auto_637035 )
      ( MAKE-11PILE ?auto_637029 ?auto_637030 ?auto_637031 ?auto_637032 ?auto_637033 ?auto_637034 ?auto_637035 ?auto_637036 ?auto_637037 ?auto_637038 ?auto_637039 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_637075 - BLOCK
      ?auto_637076 - BLOCK
      ?auto_637077 - BLOCK
      ?auto_637078 - BLOCK
      ?auto_637079 - BLOCK
      ?auto_637080 - BLOCK
      ?auto_637081 - BLOCK
      ?auto_637082 - BLOCK
      ?auto_637083 - BLOCK
      ?auto_637084 - BLOCK
      ?auto_637085 - BLOCK
    )
    :vars
    (
      ?auto_637086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_637085 ?auto_637086 ) ( ON-TABLE ?auto_637075 ) ( ON ?auto_637076 ?auto_637075 ) ( ON ?auto_637077 ?auto_637076 ) ( ON ?auto_637078 ?auto_637077 ) ( ON ?auto_637079 ?auto_637078 ) ( not ( = ?auto_637075 ?auto_637076 ) ) ( not ( = ?auto_637075 ?auto_637077 ) ) ( not ( = ?auto_637075 ?auto_637078 ) ) ( not ( = ?auto_637075 ?auto_637079 ) ) ( not ( = ?auto_637075 ?auto_637080 ) ) ( not ( = ?auto_637075 ?auto_637081 ) ) ( not ( = ?auto_637075 ?auto_637082 ) ) ( not ( = ?auto_637075 ?auto_637083 ) ) ( not ( = ?auto_637075 ?auto_637084 ) ) ( not ( = ?auto_637075 ?auto_637085 ) ) ( not ( = ?auto_637075 ?auto_637086 ) ) ( not ( = ?auto_637076 ?auto_637077 ) ) ( not ( = ?auto_637076 ?auto_637078 ) ) ( not ( = ?auto_637076 ?auto_637079 ) ) ( not ( = ?auto_637076 ?auto_637080 ) ) ( not ( = ?auto_637076 ?auto_637081 ) ) ( not ( = ?auto_637076 ?auto_637082 ) ) ( not ( = ?auto_637076 ?auto_637083 ) ) ( not ( = ?auto_637076 ?auto_637084 ) ) ( not ( = ?auto_637076 ?auto_637085 ) ) ( not ( = ?auto_637076 ?auto_637086 ) ) ( not ( = ?auto_637077 ?auto_637078 ) ) ( not ( = ?auto_637077 ?auto_637079 ) ) ( not ( = ?auto_637077 ?auto_637080 ) ) ( not ( = ?auto_637077 ?auto_637081 ) ) ( not ( = ?auto_637077 ?auto_637082 ) ) ( not ( = ?auto_637077 ?auto_637083 ) ) ( not ( = ?auto_637077 ?auto_637084 ) ) ( not ( = ?auto_637077 ?auto_637085 ) ) ( not ( = ?auto_637077 ?auto_637086 ) ) ( not ( = ?auto_637078 ?auto_637079 ) ) ( not ( = ?auto_637078 ?auto_637080 ) ) ( not ( = ?auto_637078 ?auto_637081 ) ) ( not ( = ?auto_637078 ?auto_637082 ) ) ( not ( = ?auto_637078 ?auto_637083 ) ) ( not ( = ?auto_637078 ?auto_637084 ) ) ( not ( = ?auto_637078 ?auto_637085 ) ) ( not ( = ?auto_637078 ?auto_637086 ) ) ( not ( = ?auto_637079 ?auto_637080 ) ) ( not ( = ?auto_637079 ?auto_637081 ) ) ( not ( = ?auto_637079 ?auto_637082 ) ) ( not ( = ?auto_637079 ?auto_637083 ) ) ( not ( = ?auto_637079 ?auto_637084 ) ) ( not ( = ?auto_637079 ?auto_637085 ) ) ( not ( = ?auto_637079 ?auto_637086 ) ) ( not ( = ?auto_637080 ?auto_637081 ) ) ( not ( = ?auto_637080 ?auto_637082 ) ) ( not ( = ?auto_637080 ?auto_637083 ) ) ( not ( = ?auto_637080 ?auto_637084 ) ) ( not ( = ?auto_637080 ?auto_637085 ) ) ( not ( = ?auto_637080 ?auto_637086 ) ) ( not ( = ?auto_637081 ?auto_637082 ) ) ( not ( = ?auto_637081 ?auto_637083 ) ) ( not ( = ?auto_637081 ?auto_637084 ) ) ( not ( = ?auto_637081 ?auto_637085 ) ) ( not ( = ?auto_637081 ?auto_637086 ) ) ( not ( = ?auto_637082 ?auto_637083 ) ) ( not ( = ?auto_637082 ?auto_637084 ) ) ( not ( = ?auto_637082 ?auto_637085 ) ) ( not ( = ?auto_637082 ?auto_637086 ) ) ( not ( = ?auto_637083 ?auto_637084 ) ) ( not ( = ?auto_637083 ?auto_637085 ) ) ( not ( = ?auto_637083 ?auto_637086 ) ) ( not ( = ?auto_637084 ?auto_637085 ) ) ( not ( = ?auto_637084 ?auto_637086 ) ) ( not ( = ?auto_637085 ?auto_637086 ) ) ( ON ?auto_637084 ?auto_637085 ) ( ON ?auto_637083 ?auto_637084 ) ( ON ?auto_637082 ?auto_637083 ) ( ON ?auto_637081 ?auto_637082 ) ( CLEAR ?auto_637079 ) ( ON ?auto_637080 ?auto_637081 ) ( CLEAR ?auto_637080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_637075 ?auto_637076 ?auto_637077 ?auto_637078 ?auto_637079 ?auto_637080 )
      ( MAKE-11PILE ?auto_637075 ?auto_637076 ?auto_637077 ?auto_637078 ?auto_637079 ?auto_637080 ?auto_637081 ?auto_637082 ?auto_637083 ?auto_637084 ?auto_637085 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_637121 - BLOCK
      ?auto_637122 - BLOCK
      ?auto_637123 - BLOCK
      ?auto_637124 - BLOCK
      ?auto_637125 - BLOCK
      ?auto_637126 - BLOCK
      ?auto_637127 - BLOCK
      ?auto_637128 - BLOCK
      ?auto_637129 - BLOCK
      ?auto_637130 - BLOCK
      ?auto_637131 - BLOCK
    )
    :vars
    (
      ?auto_637132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_637131 ?auto_637132 ) ( ON-TABLE ?auto_637121 ) ( ON ?auto_637122 ?auto_637121 ) ( ON ?auto_637123 ?auto_637122 ) ( ON ?auto_637124 ?auto_637123 ) ( not ( = ?auto_637121 ?auto_637122 ) ) ( not ( = ?auto_637121 ?auto_637123 ) ) ( not ( = ?auto_637121 ?auto_637124 ) ) ( not ( = ?auto_637121 ?auto_637125 ) ) ( not ( = ?auto_637121 ?auto_637126 ) ) ( not ( = ?auto_637121 ?auto_637127 ) ) ( not ( = ?auto_637121 ?auto_637128 ) ) ( not ( = ?auto_637121 ?auto_637129 ) ) ( not ( = ?auto_637121 ?auto_637130 ) ) ( not ( = ?auto_637121 ?auto_637131 ) ) ( not ( = ?auto_637121 ?auto_637132 ) ) ( not ( = ?auto_637122 ?auto_637123 ) ) ( not ( = ?auto_637122 ?auto_637124 ) ) ( not ( = ?auto_637122 ?auto_637125 ) ) ( not ( = ?auto_637122 ?auto_637126 ) ) ( not ( = ?auto_637122 ?auto_637127 ) ) ( not ( = ?auto_637122 ?auto_637128 ) ) ( not ( = ?auto_637122 ?auto_637129 ) ) ( not ( = ?auto_637122 ?auto_637130 ) ) ( not ( = ?auto_637122 ?auto_637131 ) ) ( not ( = ?auto_637122 ?auto_637132 ) ) ( not ( = ?auto_637123 ?auto_637124 ) ) ( not ( = ?auto_637123 ?auto_637125 ) ) ( not ( = ?auto_637123 ?auto_637126 ) ) ( not ( = ?auto_637123 ?auto_637127 ) ) ( not ( = ?auto_637123 ?auto_637128 ) ) ( not ( = ?auto_637123 ?auto_637129 ) ) ( not ( = ?auto_637123 ?auto_637130 ) ) ( not ( = ?auto_637123 ?auto_637131 ) ) ( not ( = ?auto_637123 ?auto_637132 ) ) ( not ( = ?auto_637124 ?auto_637125 ) ) ( not ( = ?auto_637124 ?auto_637126 ) ) ( not ( = ?auto_637124 ?auto_637127 ) ) ( not ( = ?auto_637124 ?auto_637128 ) ) ( not ( = ?auto_637124 ?auto_637129 ) ) ( not ( = ?auto_637124 ?auto_637130 ) ) ( not ( = ?auto_637124 ?auto_637131 ) ) ( not ( = ?auto_637124 ?auto_637132 ) ) ( not ( = ?auto_637125 ?auto_637126 ) ) ( not ( = ?auto_637125 ?auto_637127 ) ) ( not ( = ?auto_637125 ?auto_637128 ) ) ( not ( = ?auto_637125 ?auto_637129 ) ) ( not ( = ?auto_637125 ?auto_637130 ) ) ( not ( = ?auto_637125 ?auto_637131 ) ) ( not ( = ?auto_637125 ?auto_637132 ) ) ( not ( = ?auto_637126 ?auto_637127 ) ) ( not ( = ?auto_637126 ?auto_637128 ) ) ( not ( = ?auto_637126 ?auto_637129 ) ) ( not ( = ?auto_637126 ?auto_637130 ) ) ( not ( = ?auto_637126 ?auto_637131 ) ) ( not ( = ?auto_637126 ?auto_637132 ) ) ( not ( = ?auto_637127 ?auto_637128 ) ) ( not ( = ?auto_637127 ?auto_637129 ) ) ( not ( = ?auto_637127 ?auto_637130 ) ) ( not ( = ?auto_637127 ?auto_637131 ) ) ( not ( = ?auto_637127 ?auto_637132 ) ) ( not ( = ?auto_637128 ?auto_637129 ) ) ( not ( = ?auto_637128 ?auto_637130 ) ) ( not ( = ?auto_637128 ?auto_637131 ) ) ( not ( = ?auto_637128 ?auto_637132 ) ) ( not ( = ?auto_637129 ?auto_637130 ) ) ( not ( = ?auto_637129 ?auto_637131 ) ) ( not ( = ?auto_637129 ?auto_637132 ) ) ( not ( = ?auto_637130 ?auto_637131 ) ) ( not ( = ?auto_637130 ?auto_637132 ) ) ( not ( = ?auto_637131 ?auto_637132 ) ) ( ON ?auto_637130 ?auto_637131 ) ( ON ?auto_637129 ?auto_637130 ) ( ON ?auto_637128 ?auto_637129 ) ( ON ?auto_637127 ?auto_637128 ) ( ON ?auto_637126 ?auto_637127 ) ( CLEAR ?auto_637124 ) ( ON ?auto_637125 ?auto_637126 ) ( CLEAR ?auto_637125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_637121 ?auto_637122 ?auto_637123 ?auto_637124 ?auto_637125 )
      ( MAKE-11PILE ?auto_637121 ?auto_637122 ?auto_637123 ?auto_637124 ?auto_637125 ?auto_637126 ?auto_637127 ?auto_637128 ?auto_637129 ?auto_637130 ?auto_637131 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_637167 - BLOCK
      ?auto_637168 - BLOCK
      ?auto_637169 - BLOCK
      ?auto_637170 - BLOCK
      ?auto_637171 - BLOCK
      ?auto_637172 - BLOCK
      ?auto_637173 - BLOCK
      ?auto_637174 - BLOCK
      ?auto_637175 - BLOCK
      ?auto_637176 - BLOCK
      ?auto_637177 - BLOCK
    )
    :vars
    (
      ?auto_637178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_637177 ?auto_637178 ) ( ON-TABLE ?auto_637167 ) ( ON ?auto_637168 ?auto_637167 ) ( ON ?auto_637169 ?auto_637168 ) ( not ( = ?auto_637167 ?auto_637168 ) ) ( not ( = ?auto_637167 ?auto_637169 ) ) ( not ( = ?auto_637167 ?auto_637170 ) ) ( not ( = ?auto_637167 ?auto_637171 ) ) ( not ( = ?auto_637167 ?auto_637172 ) ) ( not ( = ?auto_637167 ?auto_637173 ) ) ( not ( = ?auto_637167 ?auto_637174 ) ) ( not ( = ?auto_637167 ?auto_637175 ) ) ( not ( = ?auto_637167 ?auto_637176 ) ) ( not ( = ?auto_637167 ?auto_637177 ) ) ( not ( = ?auto_637167 ?auto_637178 ) ) ( not ( = ?auto_637168 ?auto_637169 ) ) ( not ( = ?auto_637168 ?auto_637170 ) ) ( not ( = ?auto_637168 ?auto_637171 ) ) ( not ( = ?auto_637168 ?auto_637172 ) ) ( not ( = ?auto_637168 ?auto_637173 ) ) ( not ( = ?auto_637168 ?auto_637174 ) ) ( not ( = ?auto_637168 ?auto_637175 ) ) ( not ( = ?auto_637168 ?auto_637176 ) ) ( not ( = ?auto_637168 ?auto_637177 ) ) ( not ( = ?auto_637168 ?auto_637178 ) ) ( not ( = ?auto_637169 ?auto_637170 ) ) ( not ( = ?auto_637169 ?auto_637171 ) ) ( not ( = ?auto_637169 ?auto_637172 ) ) ( not ( = ?auto_637169 ?auto_637173 ) ) ( not ( = ?auto_637169 ?auto_637174 ) ) ( not ( = ?auto_637169 ?auto_637175 ) ) ( not ( = ?auto_637169 ?auto_637176 ) ) ( not ( = ?auto_637169 ?auto_637177 ) ) ( not ( = ?auto_637169 ?auto_637178 ) ) ( not ( = ?auto_637170 ?auto_637171 ) ) ( not ( = ?auto_637170 ?auto_637172 ) ) ( not ( = ?auto_637170 ?auto_637173 ) ) ( not ( = ?auto_637170 ?auto_637174 ) ) ( not ( = ?auto_637170 ?auto_637175 ) ) ( not ( = ?auto_637170 ?auto_637176 ) ) ( not ( = ?auto_637170 ?auto_637177 ) ) ( not ( = ?auto_637170 ?auto_637178 ) ) ( not ( = ?auto_637171 ?auto_637172 ) ) ( not ( = ?auto_637171 ?auto_637173 ) ) ( not ( = ?auto_637171 ?auto_637174 ) ) ( not ( = ?auto_637171 ?auto_637175 ) ) ( not ( = ?auto_637171 ?auto_637176 ) ) ( not ( = ?auto_637171 ?auto_637177 ) ) ( not ( = ?auto_637171 ?auto_637178 ) ) ( not ( = ?auto_637172 ?auto_637173 ) ) ( not ( = ?auto_637172 ?auto_637174 ) ) ( not ( = ?auto_637172 ?auto_637175 ) ) ( not ( = ?auto_637172 ?auto_637176 ) ) ( not ( = ?auto_637172 ?auto_637177 ) ) ( not ( = ?auto_637172 ?auto_637178 ) ) ( not ( = ?auto_637173 ?auto_637174 ) ) ( not ( = ?auto_637173 ?auto_637175 ) ) ( not ( = ?auto_637173 ?auto_637176 ) ) ( not ( = ?auto_637173 ?auto_637177 ) ) ( not ( = ?auto_637173 ?auto_637178 ) ) ( not ( = ?auto_637174 ?auto_637175 ) ) ( not ( = ?auto_637174 ?auto_637176 ) ) ( not ( = ?auto_637174 ?auto_637177 ) ) ( not ( = ?auto_637174 ?auto_637178 ) ) ( not ( = ?auto_637175 ?auto_637176 ) ) ( not ( = ?auto_637175 ?auto_637177 ) ) ( not ( = ?auto_637175 ?auto_637178 ) ) ( not ( = ?auto_637176 ?auto_637177 ) ) ( not ( = ?auto_637176 ?auto_637178 ) ) ( not ( = ?auto_637177 ?auto_637178 ) ) ( ON ?auto_637176 ?auto_637177 ) ( ON ?auto_637175 ?auto_637176 ) ( ON ?auto_637174 ?auto_637175 ) ( ON ?auto_637173 ?auto_637174 ) ( ON ?auto_637172 ?auto_637173 ) ( ON ?auto_637171 ?auto_637172 ) ( CLEAR ?auto_637169 ) ( ON ?auto_637170 ?auto_637171 ) ( CLEAR ?auto_637170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_637167 ?auto_637168 ?auto_637169 ?auto_637170 )
      ( MAKE-11PILE ?auto_637167 ?auto_637168 ?auto_637169 ?auto_637170 ?auto_637171 ?auto_637172 ?auto_637173 ?auto_637174 ?auto_637175 ?auto_637176 ?auto_637177 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_637213 - BLOCK
      ?auto_637214 - BLOCK
      ?auto_637215 - BLOCK
      ?auto_637216 - BLOCK
      ?auto_637217 - BLOCK
      ?auto_637218 - BLOCK
      ?auto_637219 - BLOCK
      ?auto_637220 - BLOCK
      ?auto_637221 - BLOCK
      ?auto_637222 - BLOCK
      ?auto_637223 - BLOCK
    )
    :vars
    (
      ?auto_637224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_637223 ?auto_637224 ) ( ON-TABLE ?auto_637213 ) ( ON ?auto_637214 ?auto_637213 ) ( not ( = ?auto_637213 ?auto_637214 ) ) ( not ( = ?auto_637213 ?auto_637215 ) ) ( not ( = ?auto_637213 ?auto_637216 ) ) ( not ( = ?auto_637213 ?auto_637217 ) ) ( not ( = ?auto_637213 ?auto_637218 ) ) ( not ( = ?auto_637213 ?auto_637219 ) ) ( not ( = ?auto_637213 ?auto_637220 ) ) ( not ( = ?auto_637213 ?auto_637221 ) ) ( not ( = ?auto_637213 ?auto_637222 ) ) ( not ( = ?auto_637213 ?auto_637223 ) ) ( not ( = ?auto_637213 ?auto_637224 ) ) ( not ( = ?auto_637214 ?auto_637215 ) ) ( not ( = ?auto_637214 ?auto_637216 ) ) ( not ( = ?auto_637214 ?auto_637217 ) ) ( not ( = ?auto_637214 ?auto_637218 ) ) ( not ( = ?auto_637214 ?auto_637219 ) ) ( not ( = ?auto_637214 ?auto_637220 ) ) ( not ( = ?auto_637214 ?auto_637221 ) ) ( not ( = ?auto_637214 ?auto_637222 ) ) ( not ( = ?auto_637214 ?auto_637223 ) ) ( not ( = ?auto_637214 ?auto_637224 ) ) ( not ( = ?auto_637215 ?auto_637216 ) ) ( not ( = ?auto_637215 ?auto_637217 ) ) ( not ( = ?auto_637215 ?auto_637218 ) ) ( not ( = ?auto_637215 ?auto_637219 ) ) ( not ( = ?auto_637215 ?auto_637220 ) ) ( not ( = ?auto_637215 ?auto_637221 ) ) ( not ( = ?auto_637215 ?auto_637222 ) ) ( not ( = ?auto_637215 ?auto_637223 ) ) ( not ( = ?auto_637215 ?auto_637224 ) ) ( not ( = ?auto_637216 ?auto_637217 ) ) ( not ( = ?auto_637216 ?auto_637218 ) ) ( not ( = ?auto_637216 ?auto_637219 ) ) ( not ( = ?auto_637216 ?auto_637220 ) ) ( not ( = ?auto_637216 ?auto_637221 ) ) ( not ( = ?auto_637216 ?auto_637222 ) ) ( not ( = ?auto_637216 ?auto_637223 ) ) ( not ( = ?auto_637216 ?auto_637224 ) ) ( not ( = ?auto_637217 ?auto_637218 ) ) ( not ( = ?auto_637217 ?auto_637219 ) ) ( not ( = ?auto_637217 ?auto_637220 ) ) ( not ( = ?auto_637217 ?auto_637221 ) ) ( not ( = ?auto_637217 ?auto_637222 ) ) ( not ( = ?auto_637217 ?auto_637223 ) ) ( not ( = ?auto_637217 ?auto_637224 ) ) ( not ( = ?auto_637218 ?auto_637219 ) ) ( not ( = ?auto_637218 ?auto_637220 ) ) ( not ( = ?auto_637218 ?auto_637221 ) ) ( not ( = ?auto_637218 ?auto_637222 ) ) ( not ( = ?auto_637218 ?auto_637223 ) ) ( not ( = ?auto_637218 ?auto_637224 ) ) ( not ( = ?auto_637219 ?auto_637220 ) ) ( not ( = ?auto_637219 ?auto_637221 ) ) ( not ( = ?auto_637219 ?auto_637222 ) ) ( not ( = ?auto_637219 ?auto_637223 ) ) ( not ( = ?auto_637219 ?auto_637224 ) ) ( not ( = ?auto_637220 ?auto_637221 ) ) ( not ( = ?auto_637220 ?auto_637222 ) ) ( not ( = ?auto_637220 ?auto_637223 ) ) ( not ( = ?auto_637220 ?auto_637224 ) ) ( not ( = ?auto_637221 ?auto_637222 ) ) ( not ( = ?auto_637221 ?auto_637223 ) ) ( not ( = ?auto_637221 ?auto_637224 ) ) ( not ( = ?auto_637222 ?auto_637223 ) ) ( not ( = ?auto_637222 ?auto_637224 ) ) ( not ( = ?auto_637223 ?auto_637224 ) ) ( ON ?auto_637222 ?auto_637223 ) ( ON ?auto_637221 ?auto_637222 ) ( ON ?auto_637220 ?auto_637221 ) ( ON ?auto_637219 ?auto_637220 ) ( ON ?auto_637218 ?auto_637219 ) ( ON ?auto_637217 ?auto_637218 ) ( ON ?auto_637216 ?auto_637217 ) ( CLEAR ?auto_637214 ) ( ON ?auto_637215 ?auto_637216 ) ( CLEAR ?auto_637215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_637213 ?auto_637214 ?auto_637215 )
      ( MAKE-11PILE ?auto_637213 ?auto_637214 ?auto_637215 ?auto_637216 ?auto_637217 ?auto_637218 ?auto_637219 ?auto_637220 ?auto_637221 ?auto_637222 ?auto_637223 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_637259 - BLOCK
      ?auto_637260 - BLOCK
      ?auto_637261 - BLOCK
      ?auto_637262 - BLOCK
      ?auto_637263 - BLOCK
      ?auto_637264 - BLOCK
      ?auto_637265 - BLOCK
      ?auto_637266 - BLOCK
      ?auto_637267 - BLOCK
      ?auto_637268 - BLOCK
      ?auto_637269 - BLOCK
    )
    :vars
    (
      ?auto_637270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_637269 ?auto_637270 ) ( ON-TABLE ?auto_637259 ) ( not ( = ?auto_637259 ?auto_637260 ) ) ( not ( = ?auto_637259 ?auto_637261 ) ) ( not ( = ?auto_637259 ?auto_637262 ) ) ( not ( = ?auto_637259 ?auto_637263 ) ) ( not ( = ?auto_637259 ?auto_637264 ) ) ( not ( = ?auto_637259 ?auto_637265 ) ) ( not ( = ?auto_637259 ?auto_637266 ) ) ( not ( = ?auto_637259 ?auto_637267 ) ) ( not ( = ?auto_637259 ?auto_637268 ) ) ( not ( = ?auto_637259 ?auto_637269 ) ) ( not ( = ?auto_637259 ?auto_637270 ) ) ( not ( = ?auto_637260 ?auto_637261 ) ) ( not ( = ?auto_637260 ?auto_637262 ) ) ( not ( = ?auto_637260 ?auto_637263 ) ) ( not ( = ?auto_637260 ?auto_637264 ) ) ( not ( = ?auto_637260 ?auto_637265 ) ) ( not ( = ?auto_637260 ?auto_637266 ) ) ( not ( = ?auto_637260 ?auto_637267 ) ) ( not ( = ?auto_637260 ?auto_637268 ) ) ( not ( = ?auto_637260 ?auto_637269 ) ) ( not ( = ?auto_637260 ?auto_637270 ) ) ( not ( = ?auto_637261 ?auto_637262 ) ) ( not ( = ?auto_637261 ?auto_637263 ) ) ( not ( = ?auto_637261 ?auto_637264 ) ) ( not ( = ?auto_637261 ?auto_637265 ) ) ( not ( = ?auto_637261 ?auto_637266 ) ) ( not ( = ?auto_637261 ?auto_637267 ) ) ( not ( = ?auto_637261 ?auto_637268 ) ) ( not ( = ?auto_637261 ?auto_637269 ) ) ( not ( = ?auto_637261 ?auto_637270 ) ) ( not ( = ?auto_637262 ?auto_637263 ) ) ( not ( = ?auto_637262 ?auto_637264 ) ) ( not ( = ?auto_637262 ?auto_637265 ) ) ( not ( = ?auto_637262 ?auto_637266 ) ) ( not ( = ?auto_637262 ?auto_637267 ) ) ( not ( = ?auto_637262 ?auto_637268 ) ) ( not ( = ?auto_637262 ?auto_637269 ) ) ( not ( = ?auto_637262 ?auto_637270 ) ) ( not ( = ?auto_637263 ?auto_637264 ) ) ( not ( = ?auto_637263 ?auto_637265 ) ) ( not ( = ?auto_637263 ?auto_637266 ) ) ( not ( = ?auto_637263 ?auto_637267 ) ) ( not ( = ?auto_637263 ?auto_637268 ) ) ( not ( = ?auto_637263 ?auto_637269 ) ) ( not ( = ?auto_637263 ?auto_637270 ) ) ( not ( = ?auto_637264 ?auto_637265 ) ) ( not ( = ?auto_637264 ?auto_637266 ) ) ( not ( = ?auto_637264 ?auto_637267 ) ) ( not ( = ?auto_637264 ?auto_637268 ) ) ( not ( = ?auto_637264 ?auto_637269 ) ) ( not ( = ?auto_637264 ?auto_637270 ) ) ( not ( = ?auto_637265 ?auto_637266 ) ) ( not ( = ?auto_637265 ?auto_637267 ) ) ( not ( = ?auto_637265 ?auto_637268 ) ) ( not ( = ?auto_637265 ?auto_637269 ) ) ( not ( = ?auto_637265 ?auto_637270 ) ) ( not ( = ?auto_637266 ?auto_637267 ) ) ( not ( = ?auto_637266 ?auto_637268 ) ) ( not ( = ?auto_637266 ?auto_637269 ) ) ( not ( = ?auto_637266 ?auto_637270 ) ) ( not ( = ?auto_637267 ?auto_637268 ) ) ( not ( = ?auto_637267 ?auto_637269 ) ) ( not ( = ?auto_637267 ?auto_637270 ) ) ( not ( = ?auto_637268 ?auto_637269 ) ) ( not ( = ?auto_637268 ?auto_637270 ) ) ( not ( = ?auto_637269 ?auto_637270 ) ) ( ON ?auto_637268 ?auto_637269 ) ( ON ?auto_637267 ?auto_637268 ) ( ON ?auto_637266 ?auto_637267 ) ( ON ?auto_637265 ?auto_637266 ) ( ON ?auto_637264 ?auto_637265 ) ( ON ?auto_637263 ?auto_637264 ) ( ON ?auto_637262 ?auto_637263 ) ( ON ?auto_637261 ?auto_637262 ) ( CLEAR ?auto_637259 ) ( ON ?auto_637260 ?auto_637261 ) ( CLEAR ?auto_637260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_637259 ?auto_637260 )
      ( MAKE-11PILE ?auto_637259 ?auto_637260 ?auto_637261 ?auto_637262 ?auto_637263 ?auto_637264 ?auto_637265 ?auto_637266 ?auto_637267 ?auto_637268 ?auto_637269 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_637305 - BLOCK
      ?auto_637306 - BLOCK
      ?auto_637307 - BLOCK
      ?auto_637308 - BLOCK
      ?auto_637309 - BLOCK
      ?auto_637310 - BLOCK
      ?auto_637311 - BLOCK
      ?auto_637312 - BLOCK
      ?auto_637313 - BLOCK
      ?auto_637314 - BLOCK
      ?auto_637315 - BLOCK
    )
    :vars
    (
      ?auto_637316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_637315 ?auto_637316 ) ( not ( = ?auto_637305 ?auto_637306 ) ) ( not ( = ?auto_637305 ?auto_637307 ) ) ( not ( = ?auto_637305 ?auto_637308 ) ) ( not ( = ?auto_637305 ?auto_637309 ) ) ( not ( = ?auto_637305 ?auto_637310 ) ) ( not ( = ?auto_637305 ?auto_637311 ) ) ( not ( = ?auto_637305 ?auto_637312 ) ) ( not ( = ?auto_637305 ?auto_637313 ) ) ( not ( = ?auto_637305 ?auto_637314 ) ) ( not ( = ?auto_637305 ?auto_637315 ) ) ( not ( = ?auto_637305 ?auto_637316 ) ) ( not ( = ?auto_637306 ?auto_637307 ) ) ( not ( = ?auto_637306 ?auto_637308 ) ) ( not ( = ?auto_637306 ?auto_637309 ) ) ( not ( = ?auto_637306 ?auto_637310 ) ) ( not ( = ?auto_637306 ?auto_637311 ) ) ( not ( = ?auto_637306 ?auto_637312 ) ) ( not ( = ?auto_637306 ?auto_637313 ) ) ( not ( = ?auto_637306 ?auto_637314 ) ) ( not ( = ?auto_637306 ?auto_637315 ) ) ( not ( = ?auto_637306 ?auto_637316 ) ) ( not ( = ?auto_637307 ?auto_637308 ) ) ( not ( = ?auto_637307 ?auto_637309 ) ) ( not ( = ?auto_637307 ?auto_637310 ) ) ( not ( = ?auto_637307 ?auto_637311 ) ) ( not ( = ?auto_637307 ?auto_637312 ) ) ( not ( = ?auto_637307 ?auto_637313 ) ) ( not ( = ?auto_637307 ?auto_637314 ) ) ( not ( = ?auto_637307 ?auto_637315 ) ) ( not ( = ?auto_637307 ?auto_637316 ) ) ( not ( = ?auto_637308 ?auto_637309 ) ) ( not ( = ?auto_637308 ?auto_637310 ) ) ( not ( = ?auto_637308 ?auto_637311 ) ) ( not ( = ?auto_637308 ?auto_637312 ) ) ( not ( = ?auto_637308 ?auto_637313 ) ) ( not ( = ?auto_637308 ?auto_637314 ) ) ( not ( = ?auto_637308 ?auto_637315 ) ) ( not ( = ?auto_637308 ?auto_637316 ) ) ( not ( = ?auto_637309 ?auto_637310 ) ) ( not ( = ?auto_637309 ?auto_637311 ) ) ( not ( = ?auto_637309 ?auto_637312 ) ) ( not ( = ?auto_637309 ?auto_637313 ) ) ( not ( = ?auto_637309 ?auto_637314 ) ) ( not ( = ?auto_637309 ?auto_637315 ) ) ( not ( = ?auto_637309 ?auto_637316 ) ) ( not ( = ?auto_637310 ?auto_637311 ) ) ( not ( = ?auto_637310 ?auto_637312 ) ) ( not ( = ?auto_637310 ?auto_637313 ) ) ( not ( = ?auto_637310 ?auto_637314 ) ) ( not ( = ?auto_637310 ?auto_637315 ) ) ( not ( = ?auto_637310 ?auto_637316 ) ) ( not ( = ?auto_637311 ?auto_637312 ) ) ( not ( = ?auto_637311 ?auto_637313 ) ) ( not ( = ?auto_637311 ?auto_637314 ) ) ( not ( = ?auto_637311 ?auto_637315 ) ) ( not ( = ?auto_637311 ?auto_637316 ) ) ( not ( = ?auto_637312 ?auto_637313 ) ) ( not ( = ?auto_637312 ?auto_637314 ) ) ( not ( = ?auto_637312 ?auto_637315 ) ) ( not ( = ?auto_637312 ?auto_637316 ) ) ( not ( = ?auto_637313 ?auto_637314 ) ) ( not ( = ?auto_637313 ?auto_637315 ) ) ( not ( = ?auto_637313 ?auto_637316 ) ) ( not ( = ?auto_637314 ?auto_637315 ) ) ( not ( = ?auto_637314 ?auto_637316 ) ) ( not ( = ?auto_637315 ?auto_637316 ) ) ( ON ?auto_637314 ?auto_637315 ) ( ON ?auto_637313 ?auto_637314 ) ( ON ?auto_637312 ?auto_637313 ) ( ON ?auto_637311 ?auto_637312 ) ( ON ?auto_637310 ?auto_637311 ) ( ON ?auto_637309 ?auto_637310 ) ( ON ?auto_637308 ?auto_637309 ) ( ON ?auto_637307 ?auto_637308 ) ( ON ?auto_637306 ?auto_637307 ) ( ON ?auto_637305 ?auto_637306 ) ( CLEAR ?auto_637305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_637305 )
      ( MAKE-11PILE ?auto_637305 ?auto_637306 ?auto_637307 ?auto_637308 ?auto_637309 ?auto_637310 ?auto_637311 ?auto_637312 ?auto_637313 ?auto_637314 ?auto_637315 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_637352 - BLOCK
      ?auto_637353 - BLOCK
      ?auto_637354 - BLOCK
      ?auto_637355 - BLOCK
      ?auto_637356 - BLOCK
      ?auto_637357 - BLOCK
      ?auto_637358 - BLOCK
      ?auto_637359 - BLOCK
      ?auto_637360 - BLOCK
      ?auto_637361 - BLOCK
      ?auto_637362 - BLOCK
      ?auto_637363 - BLOCK
    )
    :vars
    (
      ?auto_637364 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_637362 ) ( ON ?auto_637363 ?auto_637364 ) ( CLEAR ?auto_637363 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_637352 ) ( ON ?auto_637353 ?auto_637352 ) ( ON ?auto_637354 ?auto_637353 ) ( ON ?auto_637355 ?auto_637354 ) ( ON ?auto_637356 ?auto_637355 ) ( ON ?auto_637357 ?auto_637356 ) ( ON ?auto_637358 ?auto_637357 ) ( ON ?auto_637359 ?auto_637358 ) ( ON ?auto_637360 ?auto_637359 ) ( ON ?auto_637361 ?auto_637360 ) ( ON ?auto_637362 ?auto_637361 ) ( not ( = ?auto_637352 ?auto_637353 ) ) ( not ( = ?auto_637352 ?auto_637354 ) ) ( not ( = ?auto_637352 ?auto_637355 ) ) ( not ( = ?auto_637352 ?auto_637356 ) ) ( not ( = ?auto_637352 ?auto_637357 ) ) ( not ( = ?auto_637352 ?auto_637358 ) ) ( not ( = ?auto_637352 ?auto_637359 ) ) ( not ( = ?auto_637352 ?auto_637360 ) ) ( not ( = ?auto_637352 ?auto_637361 ) ) ( not ( = ?auto_637352 ?auto_637362 ) ) ( not ( = ?auto_637352 ?auto_637363 ) ) ( not ( = ?auto_637352 ?auto_637364 ) ) ( not ( = ?auto_637353 ?auto_637354 ) ) ( not ( = ?auto_637353 ?auto_637355 ) ) ( not ( = ?auto_637353 ?auto_637356 ) ) ( not ( = ?auto_637353 ?auto_637357 ) ) ( not ( = ?auto_637353 ?auto_637358 ) ) ( not ( = ?auto_637353 ?auto_637359 ) ) ( not ( = ?auto_637353 ?auto_637360 ) ) ( not ( = ?auto_637353 ?auto_637361 ) ) ( not ( = ?auto_637353 ?auto_637362 ) ) ( not ( = ?auto_637353 ?auto_637363 ) ) ( not ( = ?auto_637353 ?auto_637364 ) ) ( not ( = ?auto_637354 ?auto_637355 ) ) ( not ( = ?auto_637354 ?auto_637356 ) ) ( not ( = ?auto_637354 ?auto_637357 ) ) ( not ( = ?auto_637354 ?auto_637358 ) ) ( not ( = ?auto_637354 ?auto_637359 ) ) ( not ( = ?auto_637354 ?auto_637360 ) ) ( not ( = ?auto_637354 ?auto_637361 ) ) ( not ( = ?auto_637354 ?auto_637362 ) ) ( not ( = ?auto_637354 ?auto_637363 ) ) ( not ( = ?auto_637354 ?auto_637364 ) ) ( not ( = ?auto_637355 ?auto_637356 ) ) ( not ( = ?auto_637355 ?auto_637357 ) ) ( not ( = ?auto_637355 ?auto_637358 ) ) ( not ( = ?auto_637355 ?auto_637359 ) ) ( not ( = ?auto_637355 ?auto_637360 ) ) ( not ( = ?auto_637355 ?auto_637361 ) ) ( not ( = ?auto_637355 ?auto_637362 ) ) ( not ( = ?auto_637355 ?auto_637363 ) ) ( not ( = ?auto_637355 ?auto_637364 ) ) ( not ( = ?auto_637356 ?auto_637357 ) ) ( not ( = ?auto_637356 ?auto_637358 ) ) ( not ( = ?auto_637356 ?auto_637359 ) ) ( not ( = ?auto_637356 ?auto_637360 ) ) ( not ( = ?auto_637356 ?auto_637361 ) ) ( not ( = ?auto_637356 ?auto_637362 ) ) ( not ( = ?auto_637356 ?auto_637363 ) ) ( not ( = ?auto_637356 ?auto_637364 ) ) ( not ( = ?auto_637357 ?auto_637358 ) ) ( not ( = ?auto_637357 ?auto_637359 ) ) ( not ( = ?auto_637357 ?auto_637360 ) ) ( not ( = ?auto_637357 ?auto_637361 ) ) ( not ( = ?auto_637357 ?auto_637362 ) ) ( not ( = ?auto_637357 ?auto_637363 ) ) ( not ( = ?auto_637357 ?auto_637364 ) ) ( not ( = ?auto_637358 ?auto_637359 ) ) ( not ( = ?auto_637358 ?auto_637360 ) ) ( not ( = ?auto_637358 ?auto_637361 ) ) ( not ( = ?auto_637358 ?auto_637362 ) ) ( not ( = ?auto_637358 ?auto_637363 ) ) ( not ( = ?auto_637358 ?auto_637364 ) ) ( not ( = ?auto_637359 ?auto_637360 ) ) ( not ( = ?auto_637359 ?auto_637361 ) ) ( not ( = ?auto_637359 ?auto_637362 ) ) ( not ( = ?auto_637359 ?auto_637363 ) ) ( not ( = ?auto_637359 ?auto_637364 ) ) ( not ( = ?auto_637360 ?auto_637361 ) ) ( not ( = ?auto_637360 ?auto_637362 ) ) ( not ( = ?auto_637360 ?auto_637363 ) ) ( not ( = ?auto_637360 ?auto_637364 ) ) ( not ( = ?auto_637361 ?auto_637362 ) ) ( not ( = ?auto_637361 ?auto_637363 ) ) ( not ( = ?auto_637361 ?auto_637364 ) ) ( not ( = ?auto_637362 ?auto_637363 ) ) ( not ( = ?auto_637362 ?auto_637364 ) ) ( not ( = ?auto_637363 ?auto_637364 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_637363 ?auto_637364 )
      ( !STACK ?auto_637363 ?auto_637362 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_637402 - BLOCK
      ?auto_637403 - BLOCK
      ?auto_637404 - BLOCK
      ?auto_637405 - BLOCK
      ?auto_637406 - BLOCK
      ?auto_637407 - BLOCK
      ?auto_637408 - BLOCK
      ?auto_637409 - BLOCK
      ?auto_637410 - BLOCK
      ?auto_637411 - BLOCK
      ?auto_637412 - BLOCK
      ?auto_637413 - BLOCK
    )
    :vars
    (
      ?auto_637414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_637413 ?auto_637414 ) ( ON-TABLE ?auto_637402 ) ( ON ?auto_637403 ?auto_637402 ) ( ON ?auto_637404 ?auto_637403 ) ( ON ?auto_637405 ?auto_637404 ) ( ON ?auto_637406 ?auto_637405 ) ( ON ?auto_637407 ?auto_637406 ) ( ON ?auto_637408 ?auto_637407 ) ( ON ?auto_637409 ?auto_637408 ) ( ON ?auto_637410 ?auto_637409 ) ( ON ?auto_637411 ?auto_637410 ) ( not ( = ?auto_637402 ?auto_637403 ) ) ( not ( = ?auto_637402 ?auto_637404 ) ) ( not ( = ?auto_637402 ?auto_637405 ) ) ( not ( = ?auto_637402 ?auto_637406 ) ) ( not ( = ?auto_637402 ?auto_637407 ) ) ( not ( = ?auto_637402 ?auto_637408 ) ) ( not ( = ?auto_637402 ?auto_637409 ) ) ( not ( = ?auto_637402 ?auto_637410 ) ) ( not ( = ?auto_637402 ?auto_637411 ) ) ( not ( = ?auto_637402 ?auto_637412 ) ) ( not ( = ?auto_637402 ?auto_637413 ) ) ( not ( = ?auto_637402 ?auto_637414 ) ) ( not ( = ?auto_637403 ?auto_637404 ) ) ( not ( = ?auto_637403 ?auto_637405 ) ) ( not ( = ?auto_637403 ?auto_637406 ) ) ( not ( = ?auto_637403 ?auto_637407 ) ) ( not ( = ?auto_637403 ?auto_637408 ) ) ( not ( = ?auto_637403 ?auto_637409 ) ) ( not ( = ?auto_637403 ?auto_637410 ) ) ( not ( = ?auto_637403 ?auto_637411 ) ) ( not ( = ?auto_637403 ?auto_637412 ) ) ( not ( = ?auto_637403 ?auto_637413 ) ) ( not ( = ?auto_637403 ?auto_637414 ) ) ( not ( = ?auto_637404 ?auto_637405 ) ) ( not ( = ?auto_637404 ?auto_637406 ) ) ( not ( = ?auto_637404 ?auto_637407 ) ) ( not ( = ?auto_637404 ?auto_637408 ) ) ( not ( = ?auto_637404 ?auto_637409 ) ) ( not ( = ?auto_637404 ?auto_637410 ) ) ( not ( = ?auto_637404 ?auto_637411 ) ) ( not ( = ?auto_637404 ?auto_637412 ) ) ( not ( = ?auto_637404 ?auto_637413 ) ) ( not ( = ?auto_637404 ?auto_637414 ) ) ( not ( = ?auto_637405 ?auto_637406 ) ) ( not ( = ?auto_637405 ?auto_637407 ) ) ( not ( = ?auto_637405 ?auto_637408 ) ) ( not ( = ?auto_637405 ?auto_637409 ) ) ( not ( = ?auto_637405 ?auto_637410 ) ) ( not ( = ?auto_637405 ?auto_637411 ) ) ( not ( = ?auto_637405 ?auto_637412 ) ) ( not ( = ?auto_637405 ?auto_637413 ) ) ( not ( = ?auto_637405 ?auto_637414 ) ) ( not ( = ?auto_637406 ?auto_637407 ) ) ( not ( = ?auto_637406 ?auto_637408 ) ) ( not ( = ?auto_637406 ?auto_637409 ) ) ( not ( = ?auto_637406 ?auto_637410 ) ) ( not ( = ?auto_637406 ?auto_637411 ) ) ( not ( = ?auto_637406 ?auto_637412 ) ) ( not ( = ?auto_637406 ?auto_637413 ) ) ( not ( = ?auto_637406 ?auto_637414 ) ) ( not ( = ?auto_637407 ?auto_637408 ) ) ( not ( = ?auto_637407 ?auto_637409 ) ) ( not ( = ?auto_637407 ?auto_637410 ) ) ( not ( = ?auto_637407 ?auto_637411 ) ) ( not ( = ?auto_637407 ?auto_637412 ) ) ( not ( = ?auto_637407 ?auto_637413 ) ) ( not ( = ?auto_637407 ?auto_637414 ) ) ( not ( = ?auto_637408 ?auto_637409 ) ) ( not ( = ?auto_637408 ?auto_637410 ) ) ( not ( = ?auto_637408 ?auto_637411 ) ) ( not ( = ?auto_637408 ?auto_637412 ) ) ( not ( = ?auto_637408 ?auto_637413 ) ) ( not ( = ?auto_637408 ?auto_637414 ) ) ( not ( = ?auto_637409 ?auto_637410 ) ) ( not ( = ?auto_637409 ?auto_637411 ) ) ( not ( = ?auto_637409 ?auto_637412 ) ) ( not ( = ?auto_637409 ?auto_637413 ) ) ( not ( = ?auto_637409 ?auto_637414 ) ) ( not ( = ?auto_637410 ?auto_637411 ) ) ( not ( = ?auto_637410 ?auto_637412 ) ) ( not ( = ?auto_637410 ?auto_637413 ) ) ( not ( = ?auto_637410 ?auto_637414 ) ) ( not ( = ?auto_637411 ?auto_637412 ) ) ( not ( = ?auto_637411 ?auto_637413 ) ) ( not ( = ?auto_637411 ?auto_637414 ) ) ( not ( = ?auto_637412 ?auto_637413 ) ) ( not ( = ?auto_637412 ?auto_637414 ) ) ( not ( = ?auto_637413 ?auto_637414 ) ) ( CLEAR ?auto_637411 ) ( ON ?auto_637412 ?auto_637413 ) ( CLEAR ?auto_637412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_637402 ?auto_637403 ?auto_637404 ?auto_637405 ?auto_637406 ?auto_637407 ?auto_637408 ?auto_637409 ?auto_637410 ?auto_637411 ?auto_637412 )
      ( MAKE-12PILE ?auto_637402 ?auto_637403 ?auto_637404 ?auto_637405 ?auto_637406 ?auto_637407 ?auto_637408 ?auto_637409 ?auto_637410 ?auto_637411 ?auto_637412 ?auto_637413 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_637452 - BLOCK
      ?auto_637453 - BLOCK
      ?auto_637454 - BLOCK
      ?auto_637455 - BLOCK
      ?auto_637456 - BLOCK
      ?auto_637457 - BLOCK
      ?auto_637458 - BLOCK
      ?auto_637459 - BLOCK
      ?auto_637460 - BLOCK
      ?auto_637461 - BLOCK
      ?auto_637462 - BLOCK
      ?auto_637463 - BLOCK
    )
    :vars
    (
      ?auto_637464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_637463 ?auto_637464 ) ( ON-TABLE ?auto_637452 ) ( ON ?auto_637453 ?auto_637452 ) ( ON ?auto_637454 ?auto_637453 ) ( ON ?auto_637455 ?auto_637454 ) ( ON ?auto_637456 ?auto_637455 ) ( ON ?auto_637457 ?auto_637456 ) ( ON ?auto_637458 ?auto_637457 ) ( ON ?auto_637459 ?auto_637458 ) ( ON ?auto_637460 ?auto_637459 ) ( not ( = ?auto_637452 ?auto_637453 ) ) ( not ( = ?auto_637452 ?auto_637454 ) ) ( not ( = ?auto_637452 ?auto_637455 ) ) ( not ( = ?auto_637452 ?auto_637456 ) ) ( not ( = ?auto_637452 ?auto_637457 ) ) ( not ( = ?auto_637452 ?auto_637458 ) ) ( not ( = ?auto_637452 ?auto_637459 ) ) ( not ( = ?auto_637452 ?auto_637460 ) ) ( not ( = ?auto_637452 ?auto_637461 ) ) ( not ( = ?auto_637452 ?auto_637462 ) ) ( not ( = ?auto_637452 ?auto_637463 ) ) ( not ( = ?auto_637452 ?auto_637464 ) ) ( not ( = ?auto_637453 ?auto_637454 ) ) ( not ( = ?auto_637453 ?auto_637455 ) ) ( not ( = ?auto_637453 ?auto_637456 ) ) ( not ( = ?auto_637453 ?auto_637457 ) ) ( not ( = ?auto_637453 ?auto_637458 ) ) ( not ( = ?auto_637453 ?auto_637459 ) ) ( not ( = ?auto_637453 ?auto_637460 ) ) ( not ( = ?auto_637453 ?auto_637461 ) ) ( not ( = ?auto_637453 ?auto_637462 ) ) ( not ( = ?auto_637453 ?auto_637463 ) ) ( not ( = ?auto_637453 ?auto_637464 ) ) ( not ( = ?auto_637454 ?auto_637455 ) ) ( not ( = ?auto_637454 ?auto_637456 ) ) ( not ( = ?auto_637454 ?auto_637457 ) ) ( not ( = ?auto_637454 ?auto_637458 ) ) ( not ( = ?auto_637454 ?auto_637459 ) ) ( not ( = ?auto_637454 ?auto_637460 ) ) ( not ( = ?auto_637454 ?auto_637461 ) ) ( not ( = ?auto_637454 ?auto_637462 ) ) ( not ( = ?auto_637454 ?auto_637463 ) ) ( not ( = ?auto_637454 ?auto_637464 ) ) ( not ( = ?auto_637455 ?auto_637456 ) ) ( not ( = ?auto_637455 ?auto_637457 ) ) ( not ( = ?auto_637455 ?auto_637458 ) ) ( not ( = ?auto_637455 ?auto_637459 ) ) ( not ( = ?auto_637455 ?auto_637460 ) ) ( not ( = ?auto_637455 ?auto_637461 ) ) ( not ( = ?auto_637455 ?auto_637462 ) ) ( not ( = ?auto_637455 ?auto_637463 ) ) ( not ( = ?auto_637455 ?auto_637464 ) ) ( not ( = ?auto_637456 ?auto_637457 ) ) ( not ( = ?auto_637456 ?auto_637458 ) ) ( not ( = ?auto_637456 ?auto_637459 ) ) ( not ( = ?auto_637456 ?auto_637460 ) ) ( not ( = ?auto_637456 ?auto_637461 ) ) ( not ( = ?auto_637456 ?auto_637462 ) ) ( not ( = ?auto_637456 ?auto_637463 ) ) ( not ( = ?auto_637456 ?auto_637464 ) ) ( not ( = ?auto_637457 ?auto_637458 ) ) ( not ( = ?auto_637457 ?auto_637459 ) ) ( not ( = ?auto_637457 ?auto_637460 ) ) ( not ( = ?auto_637457 ?auto_637461 ) ) ( not ( = ?auto_637457 ?auto_637462 ) ) ( not ( = ?auto_637457 ?auto_637463 ) ) ( not ( = ?auto_637457 ?auto_637464 ) ) ( not ( = ?auto_637458 ?auto_637459 ) ) ( not ( = ?auto_637458 ?auto_637460 ) ) ( not ( = ?auto_637458 ?auto_637461 ) ) ( not ( = ?auto_637458 ?auto_637462 ) ) ( not ( = ?auto_637458 ?auto_637463 ) ) ( not ( = ?auto_637458 ?auto_637464 ) ) ( not ( = ?auto_637459 ?auto_637460 ) ) ( not ( = ?auto_637459 ?auto_637461 ) ) ( not ( = ?auto_637459 ?auto_637462 ) ) ( not ( = ?auto_637459 ?auto_637463 ) ) ( not ( = ?auto_637459 ?auto_637464 ) ) ( not ( = ?auto_637460 ?auto_637461 ) ) ( not ( = ?auto_637460 ?auto_637462 ) ) ( not ( = ?auto_637460 ?auto_637463 ) ) ( not ( = ?auto_637460 ?auto_637464 ) ) ( not ( = ?auto_637461 ?auto_637462 ) ) ( not ( = ?auto_637461 ?auto_637463 ) ) ( not ( = ?auto_637461 ?auto_637464 ) ) ( not ( = ?auto_637462 ?auto_637463 ) ) ( not ( = ?auto_637462 ?auto_637464 ) ) ( not ( = ?auto_637463 ?auto_637464 ) ) ( ON ?auto_637462 ?auto_637463 ) ( CLEAR ?auto_637460 ) ( ON ?auto_637461 ?auto_637462 ) ( CLEAR ?auto_637461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_637452 ?auto_637453 ?auto_637454 ?auto_637455 ?auto_637456 ?auto_637457 ?auto_637458 ?auto_637459 ?auto_637460 ?auto_637461 )
      ( MAKE-12PILE ?auto_637452 ?auto_637453 ?auto_637454 ?auto_637455 ?auto_637456 ?auto_637457 ?auto_637458 ?auto_637459 ?auto_637460 ?auto_637461 ?auto_637462 ?auto_637463 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_637502 - BLOCK
      ?auto_637503 - BLOCK
      ?auto_637504 - BLOCK
      ?auto_637505 - BLOCK
      ?auto_637506 - BLOCK
      ?auto_637507 - BLOCK
      ?auto_637508 - BLOCK
      ?auto_637509 - BLOCK
      ?auto_637510 - BLOCK
      ?auto_637511 - BLOCK
      ?auto_637512 - BLOCK
      ?auto_637513 - BLOCK
    )
    :vars
    (
      ?auto_637514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_637513 ?auto_637514 ) ( ON-TABLE ?auto_637502 ) ( ON ?auto_637503 ?auto_637502 ) ( ON ?auto_637504 ?auto_637503 ) ( ON ?auto_637505 ?auto_637504 ) ( ON ?auto_637506 ?auto_637505 ) ( ON ?auto_637507 ?auto_637506 ) ( ON ?auto_637508 ?auto_637507 ) ( ON ?auto_637509 ?auto_637508 ) ( not ( = ?auto_637502 ?auto_637503 ) ) ( not ( = ?auto_637502 ?auto_637504 ) ) ( not ( = ?auto_637502 ?auto_637505 ) ) ( not ( = ?auto_637502 ?auto_637506 ) ) ( not ( = ?auto_637502 ?auto_637507 ) ) ( not ( = ?auto_637502 ?auto_637508 ) ) ( not ( = ?auto_637502 ?auto_637509 ) ) ( not ( = ?auto_637502 ?auto_637510 ) ) ( not ( = ?auto_637502 ?auto_637511 ) ) ( not ( = ?auto_637502 ?auto_637512 ) ) ( not ( = ?auto_637502 ?auto_637513 ) ) ( not ( = ?auto_637502 ?auto_637514 ) ) ( not ( = ?auto_637503 ?auto_637504 ) ) ( not ( = ?auto_637503 ?auto_637505 ) ) ( not ( = ?auto_637503 ?auto_637506 ) ) ( not ( = ?auto_637503 ?auto_637507 ) ) ( not ( = ?auto_637503 ?auto_637508 ) ) ( not ( = ?auto_637503 ?auto_637509 ) ) ( not ( = ?auto_637503 ?auto_637510 ) ) ( not ( = ?auto_637503 ?auto_637511 ) ) ( not ( = ?auto_637503 ?auto_637512 ) ) ( not ( = ?auto_637503 ?auto_637513 ) ) ( not ( = ?auto_637503 ?auto_637514 ) ) ( not ( = ?auto_637504 ?auto_637505 ) ) ( not ( = ?auto_637504 ?auto_637506 ) ) ( not ( = ?auto_637504 ?auto_637507 ) ) ( not ( = ?auto_637504 ?auto_637508 ) ) ( not ( = ?auto_637504 ?auto_637509 ) ) ( not ( = ?auto_637504 ?auto_637510 ) ) ( not ( = ?auto_637504 ?auto_637511 ) ) ( not ( = ?auto_637504 ?auto_637512 ) ) ( not ( = ?auto_637504 ?auto_637513 ) ) ( not ( = ?auto_637504 ?auto_637514 ) ) ( not ( = ?auto_637505 ?auto_637506 ) ) ( not ( = ?auto_637505 ?auto_637507 ) ) ( not ( = ?auto_637505 ?auto_637508 ) ) ( not ( = ?auto_637505 ?auto_637509 ) ) ( not ( = ?auto_637505 ?auto_637510 ) ) ( not ( = ?auto_637505 ?auto_637511 ) ) ( not ( = ?auto_637505 ?auto_637512 ) ) ( not ( = ?auto_637505 ?auto_637513 ) ) ( not ( = ?auto_637505 ?auto_637514 ) ) ( not ( = ?auto_637506 ?auto_637507 ) ) ( not ( = ?auto_637506 ?auto_637508 ) ) ( not ( = ?auto_637506 ?auto_637509 ) ) ( not ( = ?auto_637506 ?auto_637510 ) ) ( not ( = ?auto_637506 ?auto_637511 ) ) ( not ( = ?auto_637506 ?auto_637512 ) ) ( not ( = ?auto_637506 ?auto_637513 ) ) ( not ( = ?auto_637506 ?auto_637514 ) ) ( not ( = ?auto_637507 ?auto_637508 ) ) ( not ( = ?auto_637507 ?auto_637509 ) ) ( not ( = ?auto_637507 ?auto_637510 ) ) ( not ( = ?auto_637507 ?auto_637511 ) ) ( not ( = ?auto_637507 ?auto_637512 ) ) ( not ( = ?auto_637507 ?auto_637513 ) ) ( not ( = ?auto_637507 ?auto_637514 ) ) ( not ( = ?auto_637508 ?auto_637509 ) ) ( not ( = ?auto_637508 ?auto_637510 ) ) ( not ( = ?auto_637508 ?auto_637511 ) ) ( not ( = ?auto_637508 ?auto_637512 ) ) ( not ( = ?auto_637508 ?auto_637513 ) ) ( not ( = ?auto_637508 ?auto_637514 ) ) ( not ( = ?auto_637509 ?auto_637510 ) ) ( not ( = ?auto_637509 ?auto_637511 ) ) ( not ( = ?auto_637509 ?auto_637512 ) ) ( not ( = ?auto_637509 ?auto_637513 ) ) ( not ( = ?auto_637509 ?auto_637514 ) ) ( not ( = ?auto_637510 ?auto_637511 ) ) ( not ( = ?auto_637510 ?auto_637512 ) ) ( not ( = ?auto_637510 ?auto_637513 ) ) ( not ( = ?auto_637510 ?auto_637514 ) ) ( not ( = ?auto_637511 ?auto_637512 ) ) ( not ( = ?auto_637511 ?auto_637513 ) ) ( not ( = ?auto_637511 ?auto_637514 ) ) ( not ( = ?auto_637512 ?auto_637513 ) ) ( not ( = ?auto_637512 ?auto_637514 ) ) ( not ( = ?auto_637513 ?auto_637514 ) ) ( ON ?auto_637512 ?auto_637513 ) ( ON ?auto_637511 ?auto_637512 ) ( CLEAR ?auto_637509 ) ( ON ?auto_637510 ?auto_637511 ) ( CLEAR ?auto_637510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_637502 ?auto_637503 ?auto_637504 ?auto_637505 ?auto_637506 ?auto_637507 ?auto_637508 ?auto_637509 ?auto_637510 )
      ( MAKE-12PILE ?auto_637502 ?auto_637503 ?auto_637504 ?auto_637505 ?auto_637506 ?auto_637507 ?auto_637508 ?auto_637509 ?auto_637510 ?auto_637511 ?auto_637512 ?auto_637513 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_637552 - BLOCK
      ?auto_637553 - BLOCK
      ?auto_637554 - BLOCK
      ?auto_637555 - BLOCK
      ?auto_637556 - BLOCK
      ?auto_637557 - BLOCK
      ?auto_637558 - BLOCK
      ?auto_637559 - BLOCK
      ?auto_637560 - BLOCK
      ?auto_637561 - BLOCK
      ?auto_637562 - BLOCK
      ?auto_637563 - BLOCK
    )
    :vars
    (
      ?auto_637564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_637563 ?auto_637564 ) ( ON-TABLE ?auto_637552 ) ( ON ?auto_637553 ?auto_637552 ) ( ON ?auto_637554 ?auto_637553 ) ( ON ?auto_637555 ?auto_637554 ) ( ON ?auto_637556 ?auto_637555 ) ( ON ?auto_637557 ?auto_637556 ) ( ON ?auto_637558 ?auto_637557 ) ( not ( = ?auto_637552 ?auto_637553 ) ) ( not ( = ?auto_637552 ?auto_637554 ) ) ( not ( = ?auto_637552 ?auto_637555 ) ) ( not ( = ?auto_637552 ?auto_637556 ) ) ( not ( = ?auto_637552 ?auto_637557 ) ) ( not ( = ?auto_637552 ?auto_637558 ) ) ( not ( = ?auto_637552 ?auto_637559 ) ) ( not ( = ?auto_637552 ?auto_637560 ) ) ( not ( = ?auto_637552 ?auto_637561 ) ) ( not ( = ?auto_637552 ?auto_637562 ) ) ( not ( = ?auto_637552 ?auto_637563 ) ) ( not ( = ?auto_637552 ?auto_637564 ) ) ( not ( = ?auto_637553 ?auto_637554 ) ) ( not ( = ?auto_637553 ?auto_637555 ) ) ( not ( = ?auto_637553 ?auto_637556 ) ) ( not ( = ?auto_637553 ?auto_637557 ) ) ( not ( = ?auto_637553 ?auto_637558 ) ) ( not ( = ?auto_637553 ?auto_637559 ) ) ( not ( = ?auto_637553 ?auto_637560 ) ) ( not ( = ?auto_637553 ?auto_637561 ) ) ( not ( = ?auto_637553 ?auto_637562 ) ) ( not ( = ?auto_637553 ?auto_637563 ) ) ( not ( = ?auto_637553 ?auto_637564 ) ) ( not ( = ?auto_637554 ?auto_637555 ) ) ( not ( = ?auto_637554 ?auto_637556 ) ) ( not ( = ?auto_637554 ?auto_637557 ) ) ( not ( = ?auto_637554 ?auto_637558 ) ) ( not ( = ?auto_637554 ?auto_637559 ) ) ( not ( = ?auto_637554 ?auto_637560 ) ) ( not ( = ?auto_637554 ?auto_637561 ) ) ( not ( = ?auto_637554 ?auto_637562 ) ) ( not ( = ?auto_637554 ?auto_637563 ) ) ( not ( = ?auto_637554 ?auto_637564 ) ) ( not ( = ?auto_637555 ?auto_637556 ) ) ( not ( = ?auto_637555 ?auto_637557 ) ) ( not ( = ?auto_637555 ?auto_637558 ) ) ( not ( = ?auto_637555 ?auto_637559 ) ) ( not ( = ?auto_637555 ?auto_637560 ) ) ( not ( = ?auto_637555 ?auto_637561 ) ) ( not ( = ?auto_637555 ?auto_637562 ) ) ( not ( = ?auto_637555 ?auto_637563 ) ) ( not ( = ?auto_637555 ?auto_637564 ) ) ( not ( = ?auto_637556 ?auto_637557 ) ) ( not ( = ?auto_637556 ?auto_637558 ) ) ( not ( = ?auto_637556 ?auto_637559 ) ) ( not ( = ?auto_637556 ?auto_637560 ) ) ( not ( = ?auto_637556 ?auto_637561 ) ) ( not ( = ?auto_637556 ?auto_637562 ) ) ( not ( = ?auto_637556 ?auto_637563 ) ) ( not ( = ?auto_637556 ?auto_637564 ) ) ( not ( = ?auto_637557 ?auto_637558 ) ) ( not ( = ?auto_637557 ?auto_637559 ) ) ( not ( = ?auto_637557 ?auto_637560 ) ) ( not ( = ?auto_637557 ?auto_637561 ) ) ( not ( = ?auto_637557 ?auto_637562 ) ) ( not ( = ?auto_637557 ?auto_637563 ) ) ( not ( = ?auto_637557 ?auto_637564 ) ) ( not ( = ?auto_637558 ?auto_637559 ) ) ( not ( = ?auto_637558 ?auto_637560 ) ) ( not ( = ?auto_637558 ?auto_637561 ) ) ( not ( = ?auto_637558 ?auto_637562 ) ) ( not ( = ?auto_637558 ?auto_637563 ) ) ( not ( = ?auto_637558 ?auto_637564 ) ) ( not ( = ?auto_637559 ?auto_637560 ) ) ( not ( = ?auto_637559 ?auto_637561 ) ) ( not ( = ?auto_637559 ?auto_637562 ) ) ( not ( = ?auto_637559 ?auto_637563 ) ) ( not ( = ?auto_637559 ?auto_637564 ) ) ( not ( = ?auto_637560 ?auto_637561 ) ) ( not ( = ?auto_637560 ?auto_637562 ) ) ( not ( = ?auto_637560 ?auto_637563 ) ) ( not ( = ?auto_637560 ?auto_637564 ) ) ( not ( = ?auto_637561 ?auto_637562 ) ) ( not ( = ?auto_637561 ?auto_637563 ) ) ( not ( = ?auto_637561 ?auto_637564 ) ) ( not ( = ?auto_637562 ?auto_637563 ) ) ( not ( = ?auto_637562 ?auto_637564 ) ) ( not ( = ?auto_637563 ?auto_637564 ) ) ( ON ?auto_637562 ?auto_637563 ) ( ON ?auto_637561 ?auto_637562 ) ( ON ?auto_637560 ?auto_637561 ) ( CLEAR ?auto_637558 ) ( ON ?auto_637559 ?auto_637560 ) ( CLEAR ?auto_637559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_637552 ?auto_637553 ?auto_637554 ?auto_637555 ?auto_637556 ?auto_637557 ?auto_637558 ?auto_637559 )
      ( MAKE-12PILE ?auto_637552 ?auto_637553 ?auto_637554 ?auto_637555 ?auto_637556 ?auto_637557 ?auto_637558 ?auto_637559 ?auto_637560 ?auto_637561 ?auto_637562 ?auto_637563 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_637602 - BLOCK
      ?auto_637603 - BLOCK
      ?auto_637604 - BLOCK
      ?auto_637605 - BLOCK
      ?auto_637606 - BLOCK
      ?auto_637607 - BLOCK
      ?auto_637608 - BLOCK
      ?auto_637609 - BLOCK
      ?auto_637610 - BLOCK
      ?auto_637611 - BLOCK
      ?auto_637612 - BLOCK
      ?auto_637613 - BLOCK
    )
    :vars
    (
      ?auto_637614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_637613 ?auto_637614 ) ( ON-TABLE ?auto_637602 ) ( ON ?auto_637603 ?auto_637602 ) ( ON ?auto_637604 ?auto_637603 ) ( ON ?auto_637605 ?auto_637604 ) ( ON ?auto_637606 ?auto_637605 ) ( ON ?auto_637607 ?auto_637606 ) ( not ( = ?auto_637602 ?auto_637603 ) ) ( not ( = ?auto_637602 ?auto_637604 ) ) ( not ( = ?auto_637602 ?auto_637605 ) ) ( not ( = ?auto_637602 ?auto_637606 ) ) ( not ( = ?auto_637602 ?auto_637607 ) ) ( not ( = ?auto_637602 ?auto_637608 ) ) ( not ( = ?auto_637602 ?auto_637609 ) ) ( not ( = ?auto_637602 ?auto_637610 ) ) ( not ( = ?auto_637602 ?auto_637611 ) ) ( not ( = ?auto_637602 ?auto_637612 ) ) ( not ( = ?auto_637602 ?auto_637613 ) ) ( not ( = ?auto_637602 ?auto_637614 ) ) ( not ( = ?auto_637603 ?auto_637604 ) ) ( not ( = ?auto_637603 ?auto_637605 ) ) ( not ( = ?auto_637603 ?auto_637606 ) ) ( not ( = ?auto_637603 ?auto_637607 ) ) ( not ( = ?auto_637603 ?auto_637608 ) ) ( not ( = ?auto_637603 ?auto_637609 ) ) ( not ( = ?auto_637603 ?auto_637610 ) ) ( not ( = ?auto_637603 ?auto_637611 ) ) ( not ( = ?auto_637603 ?auto_637612 ) ) ( not ( = ?auto_637603 ?auto_637613 ) ) ( not ( = ?auto_637603 ?auto_637614 ) ) ( not ( = ?auto_637604 ?auto_637605 ) ) ( not ( = ?auto_637604 ?auto_637606 ) ) ( not ( = ?auto_637604 ?auto_637607 ) ) ( not ( = ?auto_637604 ?auto_637608 ) ) ( not ( = ?auto_637604 ?auto_637609 ) ) ( not ( = ?auto_637604 ?auto_637610 ) ) ( not ( = ?auto_637604 ?auto_637611 ) ) ( not ( = ?auto_637604 ?auto_637612 ) ) ( not ( = ?auto_637604 ?auto_637613 ) ) ( not ( = ?auto_637604 ?auto_637614 ) ) ( not ( = ?auto_637605 ?auto_637606 ) ) ( not ( = ?auto_637605 ?auto_637607 ) ) ( not ( = ?auto_637605 ?auto_637608 ) ) ( not ( = ?auto_637605 ?auto_637609 ) ) ( not ( = ?auto_637605 ?auto_637610 ) ) ( not ( = ?auto_637605 ?auto_637611 ) ) ( not ( = ?auto_637605 ?auto_637612 ) ) ( not ( = ?auto_637605 ?auto_637613 ) ) ( not ( = ?auto_637605 ?auto_637614 ) ) ( not ( = ?auto_637606 ?auto_637607 ) ) ( not ( = ?auto_637606 ?auto_637608 ) ) ( not ( = ?auto_637606 ?auto_637609 ) ) ( not ( = ?auto_637606 ?auto_637610 ) ) ( not ( = ?auto_637606 ?auto_637611 ) ) ( not ( = ?auto_637606 ?auto_637612 ) ) ( not ( = ?auto_637606 ?auto_637613 ) ) ( not ( = ?auto_637606 ?auto_637614 ) ) ( not ( = ?auto_637607 ?auto_637608 ) ) ( not ( = ?auto_637607 ?auto_637609 ) ) ( not ( = ?auto_637607 ?auto_637610 ) ) ( not ( = ?auto_637607 ?auto_637611 ) ) ( not ( = ?auto_637607 ?auto_637612 ) ) ( not ( = ?auto_637607 ?auto_637613 ) ) ( not ( = ?auto_637607 ?auto_637614 ) ) ( not ( = ?auto_637608 ?auto_637609 ) ) ( not ( = ?auto_637608 ?auto_637610 ) ) ( not ( = ?auto_637608 ?auto_637611 ) ) ( not ( = ?auto_637608 ?auto_637612 ) ) ( not ( = ?auto_637608 ?auto_637613 ) ) ( not ( = ?auto_637608 ?auto_637614 ) ) ( not ( = ?auto_637609 ?auto_637610 ) ) ( not ( = ?auto_637609 ?auto_637611 ) ) ( not ( = ?auto_637609 ?auto_637612 ) ) ( not ( = ?auto_637609 ?auto_637613 ) ) ( not ( = ?auto_637609 ?auto_637614 ) ) ( not ( = ?auto_637610 ?auto_637611 ) ) ( not ( = ?auto_637610 ?auto_637612 ) ) ( not ( = ?auto_637610 ?auto_637613 ) ) ( not ( = ?auto_637610 ?auto_637614 ) ) ( not ( = ?auto_637611 ?auto_637612 ) ) ( not ( = ?auto_637611 ?auto_637613 ) ) ( not ( = ?auto_637611 ?auto_637614 ) ) ( not ( = ?auto_637612 ?auto_637613 ) ) ( not ( = ?auto_637612 ?auto_637614 ) ) ( not ( = ?auto_637613 ?auto_637614 ) ) ( ON ?auto_637612 ?auto_637613 ) ( ON ?auto_637611 ?auto_637612 ) ( ON ?auto_637610 ?auto_637611 ) ( ON ?auto_637609 ?auto_637610 ) ( CLEAR ?auto_637607 ) ( ON ?auto_637608 ?auto_637609 ) ( CLEAR ?auto_637608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_637602 ?auto_637603 ?auto_637604 ?auto_637605 ?auto_637606 ?auto_637607 ?auto_637608 )
      ( MAKE-12PILE ?auto_637602 ?auto_637603 ?auto_637604 ?auto_637605 ?auto_637606 ?auto_637607 ?auto_637608 ?auto_637609 ?auto_637610 ?auto_637611 ?auto_637612 ?auto_637613 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_637652 - BLOCK
      ?auto_637653 - BLOCK
      ?auto_637654 - BLOCK
      ?auto_637655 - BLOCK
      ?auto_637656 - BLOCK
      ?auto_637657 - BLOCK
      ?auto_637658 - BLOCK
      ?auto_637659 - BLOCK
      ?auto_637660 - BLOCK
      ?auto_637661 - BLOCK
      ?auto_637662 - BLOCK
      ?auto_637663 - BLOCK
    )
    :vars
    (
      ?auto_637664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_637663 ?auto_637664 ) ( ON-TABLE ?auto_637652 ) ( ON ?auto_637653 ?auto_637652 ) ( ON ?auto_637654 ?auto_637653 ) ( ON ?auto_637655 ?auto_637654 ) ( ON ?auto_637656 ?auto_637655 ) ( not ( = ?auto_637652 ?auto_637653 ) ) ( not ( = ?auto_637652 ?auto_637654 ) ) ( not ( = ?auto_637652 ?auto_637655 ) ) ( not ( = ?auto_637652 ?auto_637656 ) ) ( not ( = ?auto_637652 ?auto_637657 ) ) ( not ( = ?auto_637652 ?auto_637658 ) ) ( not ( = ?auto_637652 ?auto_637659 ) ) ( not ( = ?auto_637652 ?auto_637660 ) ) ( not ( = ?auto_637652 ?auto_637661 ) ) ( not ( = ?auto_637652 ?auto_637662 ) ) ( not ( = ?auto_637652 ?auto_637663 ) ) ( not ( = ?auto_637652 ?auto_637664 ) ) ( not ( = ?auto_637653 ?auto_637654 ) ) ( not ( = ?auto_637653 ?auto_637655 ) ) ( not ( = ?auto_637653 ?auto_637656 ) ) ( not ( = ?auto_637653 ?auto_637657 ) ) ( not ( = ?auto_637653 ?auto_637658 ) ) ( not ( = ?auto_637653 ?auto_637659 ) ) ( not ( = ?auto_637653 ?auto_637660 ) ) ( not ( = ?auto_637653 ?auto_637661 ) ) ( not ( = ?auto_637653 ?auto_637662 ) ) ( not ( = ?auto_637653 ?auto_637663 ) ) ( not ( = ?auto_637653 ?auto_637664 ) ) ( not ( = ?auto_637654 ?auto_637655 ) ) ( not ( = ?auto_637654 ?auto_637656 ) ) ( not ( = ?auto_637654 ?auto_637657 ) ) ( not ( = ?auto_637654 ?auto_637658 ) ) ( not ( = ?auto_637654 ?auto_637659 ) ) ( not ( = ?auto_637654 ?auto_637660 ) ) ( not ( = ?auto_637654 ?auto_637661 ) ) ( not ( = ?auto_637654 ?auto_637662 ) ) ( not ( = ?auto_637654 ?auto_637663 ) ) ( not ( = ?auto_637654 ?auto_637664 ) ) ( not ( = ?auto_637655 ?auto_637656 ) ) ( not ( = ?auto_637655 ?auto_637657 ) ) ( not ( = ?auto_637655 ?auto_637658 ) ) ( not ( = ?auto_637655 ?auto_637659 ) ) ( not ( = ?auto_637655 ?auto_637660 ) ) ( not ( = ?auto_637655 ?auto_637661 ) ) ( not ( = ?auto_637655 ?auto_637662 ) ) ( not ( = ?auto_637655 ?auto_637663 ) ) ( not ( = ?auto_637655 ?auto_637664 ) ) ( not ( = ?auto_637656 ?auto_637657 ) ) ( not ( = ?auto_637656 ?auto_637658 ) ) ( not ( = ?auto_637656 ?auto_637659 ) ) ( not ( = ?auto_637656 ?auto_637660 ) ) ( not ( = ?auto_637656 ?auto_637661 ) ) ( not ( = ?auto_637656 ?auto_637662 ) ) ( not ( = ?auto_637656 ?auto_637663 ) ) ( not ( = ?auto_637656 ?auto_637664 ) ) ( not ( = ?auto_637657 ?auto_637658 ) ) ( not ( = ?auto_637657 ?auto_637659 ) ) ( not ( = ?auto_637657 ?auto_637660 ) ) ( not ( = ?auto_637657 ?auto_637661 ) ) ( not ( = ?auto_637657 ?auto_637662 ) ) ( not ( = ?auto_637657 ?auto_637663 ) ) ( not ( = ?auto_637657 ?auto_637664 ) ) ( not ( = ?auto_637658 ?auto_637659 ) ) ( not ( = ?auto_637658 ?auto_637660 ) ) ( not ( = ?auto_637658 ?auto_637661 ) ) ( not ( = ?auto_637658 ?auto_637662 ) ) ( not ( = ?auto_637658 ?auto_637663 ) ) ( not ( = ?auto_637658 ?auto_637664 ) ) ( not ( = ?auto_637659 ?auto_637660 ) ) ( not ( = ?auto_637659 ?auto_637661 ) ) ( not ( = ?auto_637659 ?auto_637662 ) ) ( not ( = ?auto_637659 ?auto_637663 ) ) ( not ( = ?auto_637659 ?auto_637664 ) ) ( not ( = ?auto_637660 ?auto_637661 ) ) ( not ( = ?auto_637660 ?auto_637662 ) ) ( not ( = ?auto_637660 ?auto_637663 ) ) ( not ( = ?auto_637660 ?auto_637664 ) ) ( not ( = ?auto_637661 ?auto_637662 ) ) ( not ( = ?auto_637661 ?auto_637663 ) ) ( not ( = ?auto_637661 ?auto_637664 ) ) ( not ( = ?auto_637662 ?auto_637663 ) ) ( not ( = ?auto_637662 ?auto_637664 ) ) ( not ( = ?auto_637663 ?auto_637664 ) ) ( ON ?auto_637662 ?auto_637663 ) ( ON ?auto_637661 ?auto_637662 ) ( ON ?auto_637660 ?auto_637661 ) ( ON ?auto_637659 ?auto_637660 ) ( ON ?auto_637658 ?auto_637659 ) ( CLEAR ?auto_637656 ) ( ON ?auto_637657 ?auto_637658 ) ( CLEAR ?auto_637657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_637652 ?auto_637653 ?auto_637654 ?auto_637655 ?auto_637656 ?auto_637657 )
      ( MAKE-12PILE ?auto_637652 ?auto_637653 ?auto_637654 ?auto_637655 ?auto_637656 ?auto_637657 ?auto_637658 ?auto_637659 ?auto_637660 ?auto_637661 ?auto_637662 ?auto_637663 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_637702 - BLOCK
      ?auto_637703 - BLOCK
      ?auto_637704 - BLOCK
      ?auto_637705 - BLOCK
      ?auto_637706 - BLOCK
      ?auto_637707 - BLOCK
      ?auto_637708 - BLOCK
      ?auto_637709 - BLOCK
      ?auto_637710 - BLOCK
      ?auto_637711 - BLOCK
      ?auto_637712 - BLOCK
      ?auto_637713 - BLOCK
    )
    :vars
    (
      ?auto_637714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_637713 ?auto_637714 ) ( ON-TABLE ?auto_637702 ) ( ON ?auto_637703 ?auto_637702 ) ( ON ?auto_637704 ?auto_637703 ) ( ON ?auto_637705 ?auto_637704 ) ( not ( = ?auto_637702 ?auto_637703 ) ) ( not ( = ?auto_637702 ?auto_637704 ) ) ( not ( = ?auto_637702 ?auto_637705 ) ) ( not ( = ?auto_637702 ?auto_637706 ) ) ( not ( = ?auto_637702 ?auto_637707 ) ) ( not ( = ?auto_637702 ?auto_637708 ) ) ( not ( = ?auto_637702 ?auto_637709 ) ) ( not ( = ?auto_637702 ?auto_637710 ) ) ( not ( = ?auto_637702 ?auto_637711 ) ) ( not ( = ?auto_637702 ?auto_637712 ) ) ( not ( = ?auto_637702 ?auto_637713 ) ) ( not ( = ?auto_637702 ?auto_637714 ) ) ( not ( = ?auto_637703 ?auto_637704 ) ) ( not ( = ?auto_637703 ?auto_637705 ) ) ( not ( = ?auto_637703 ?auto_637706 ) ) ( not ( = ?auto_637703 ?auto_637707 ) ) ( not ( = ?auto_637703 ?auto_637708 ) ) ( not ( = ?auto_637703 ?auto_637709 ) ) ( not ( = ?auto_637703 ?auto_637710 ) ) ( not ( = ?auto_637703 ?auto_637711 ) ) ( not ( = ?auto_637703 ?auto_637712 ) ) ( not ( = ?auto_637703 ?auto_637713 ) ) ( not ( = ?auto_637703 ?auto_637714 ) ) ( not ( = ?auto_637704 ?auto_637705 ) ) ( not ( = ?auto_637704 ?auto_637706 ) ) ( not ( = ?auto_637704 ?auto_637707 ) ) ( not ( = ?auto_637704 ?auto_637708 ) ) ( not ( = ?auto_637704 ?auto_637709 ) ) ( not ( = ?auto_637704 ?auto_637710 ) ) ( not ( = ?auto_637704 ?auto_637711 ) ) ( not ( = ?auto_637704 ?auto_637712 ) ) ( not ( = ?auto_637704 ?auto_637713 ) ) ( not ( = ?auto_637704 ?auto_637714 ) ) ( not ( = ?auto_637705 ?auto_637706 ) ) ( not ( = ?auto_637705 ?auto_637707 ) ) ( not ( = ?auto_637705 ?auto_637708 ) ) ( not ( = ?auto_637705 ?auto_637709 ) ) ( not ( = ?auto_637705 ?auto_637710 ) ) ( not ( = ?auto_637705 ?auto_637711 ) ) ( not ( = ?auto_637705 ?auto_637712 ) ) ( not ( = ?auto_637705 ?auto_637713 ) ) ( not ( = ?auto_637705 ?auto_637714 ) ) ( not ( = ?auto_637706 ?auto_637707 ) ) ( not ( = ?auto_637706 ?auto_637708 ) ) ( not ( = ?auto_637706 ?auto_637709 ) ) ( not ( = ?auto_637706 ?auto_637710 ) ) ( not ( = ?auto_637706 ?auto_637711 ) ) ( not ( = ?auto_637706 ?auto_637712 ) ) ( not ( = ?auto_637706 ?auto_637713 ) ) ( not ( = ?auto_637706 ?auto_637714 ) ) ( not ( = ?auto_637707 ?auto_637708 ) ) ( not ( = ?auto_637707 ?auto_637709 ) ) ( not ( = ?auto_637707 ?auto_637710 ) ) ( not ( = ?auto_637707 ?auto_637711 ) ) ( not ( = ?auto_637707 ?auto_637712 ) ) ( not ( = ?auto_637707 ?auto_637713 ) ) ( not ( = ?auto_637707 ?auto_637714 ) ) ( not ( = ?auto_637708 ?auto_637709 ) ) ( not ( = ?auto_637708 ?auto_637710 ) ) ( not ( = ?auto_637708 ?auto_637711 ) ) ( not ( = ?auto_637708 ?auto_637712 ) ) ( not ( = ?auto_637708 ?auto_637713 ) ) ( not ( = ?auto_637708 ?auto_637714 ) ) ( not ( = ?auto_637709 ?auto_637710 ) ) ( not ( = ?auto_637709 ?auto_637711 ) ) ( not ( = ?auto_637709 ?auto_637712 ) ) ( not ( = ?auto_637709 ?auto_637713 ) ) ( not ( = ?auto_637709 ?auto_637714 ) ) ( not ( = ?auto_637710 ?auto_637711 ) ) ( not ( = ?auto_637710 ?auto_637712 ) ) ( not ( = ?auto_637710 ?auto_637713 ) ) ( not ( = ?auto_637710 ?auto_637714 ) ) ( not ( = ?auto_637711 ?auto_637712 ) ) ( not ( = ?auto_637711 ?auto_637713 ) ) ( not ( = ?auto_637711 ?auto_637714 ) ) ( not ( = ?auto_637712 ?auto_637713 ) ) ( not ( = ?auto_637712 ?auto_637714 ) ) ( not ( = ?auto_637713 ?auto_637714 ) ) ( ON ?auto_637712 ?auto_637713 ) ( ON ?auto_637711 ?auto_637712 ) ( ON ?auto_637710 ?auto_637711 ) ( ON ?auto_637709 ?auto_637710 ) ( ON ?auto_637708 ?auto_637709 ) ( ON ?auto_637707 ?auto_637708 ) ( CLEAR ?auto_637705 ) ( ON ?auto_637706 ?auto_637707 ) ( CLEAR ?auto_637706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_637702 ?auto_637703 ?auto_637704 ?auto_637705 ?auto_637706 )
      ( MAKE-12PILE ?auto_637702 ?auto_637703 ?auto_637704 ?auto_637705 ?auto_637706 ?auto_637707 ?auto_637708 ?auto_637709 ?auto_637710 ?auto_637711 ?auto_637712 ?auto_637713 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_637752 - BLOCK
      ?auto_637753 - BLOCK
      ?auto_637754 - BLOCK
      ?auto_637755 - BLOCK
      ?auto_637756 - BLOCK
      ?auto_637757 - BLOCK
      ?auto_637758 - BLOCK
      ?auto_637759 - BLOCK
      ?auto_637760 - BLOCK
      ?auto_637761 - BLOCK
      ?auto_637762 - BLOCK
      ?auto_637763 - BLOCK
    )
    :vars
    (
      ?auto_637764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_637763 ?auto_637764 ) ( ON-TABLE ?auto_637752 ) ( ON ?auto_637753 ?auto_637752 ) ( ON ?auto_637754 ?auto_637753 ) ( not ( = ?auto_637752 ?auto_637753 ) ) ( not ( = ?auto_637752 ?auto_637754 ) ) ( not ( = ?auto_637752 ?auto_637755 ) ) ( not ( = ?auto_637752 ?auto_637756 ) ) ( not ( = ?auto_637752 ?auto_637757 ) ) ( not ( = ?auto_637752 ?auto_637758 ) ) ( not ( = ?auto_637752 ?auto_637759 ) ) ( not ( = ?auto_637752 ?auto_637760 ) ) ( not ( = ?auto_637752 ?auto_637761 ) ) ( not ( = ?auto_637752 ?auto_637762 ) ) ( not ( = ?auto_637752 ?auto_637763 ) ) ( not ( = ?auto_637752 ?auto_637764 ) ) ( not ( = ?auto_637753 ?auto_637754 ) ) ( not ( = ?auto_637753 ?auto_637755 ) ) ( not ( = ?auto_637753 ?auto_637756 ) ) ( not ( = ?auto_637753 ?auto_637757 ) ) ( not ( = ?auto_637753 ?auto_637758 ) ) ( not ( = ?auto_637753 ?auto_637759 ) ) ( not ( = ?auto_637753 ?auto_637760 ) ) ( not ( = ?auto_637753 ?auto_637761 ) ) ( not ( = ?auto_637753 ?auto_637762 ) ) ( not ( = ?auto_637753 ?auto_637763 ) ) ( not ( = ?auto_637753 ?auto_637764 ) ) ( not ( = ?auto_637754 ?auto_637755 ) ) ( not ( = ?auto_637754 ?auto_637756 ) ) ( not ( = ?auto_637754 ?auto_637757 ) ) ( not ( = ?auto_637754 ?auto_637758 ) ) ( not ( = ?auto_637754 ?auto_637759 ) ) ( not ( = ?auto_637754 ?auto_637760 ) ) ( not ( = ?auto_637754 ?auto_637761 ) ) ( not ( = ?auto_637754 ?auto_637762 ) ) ( not ( = ?auto_637754 ?auto_637763 ) ) ( not ( = ?auto_637754 ?auto_637764 ) ) ( not ( = ?auto_637755 ?auto_637756 ) ) ( not ( = ?auto_637755 ?auto_637757 ) ) ( not ( = ?auto_637755 ?auto_637758 ) ) ( not ( = ?auto_637755 ?auto_637759 ) ) ( not ( = ?auto_637755 ?auto_637760 ) ) ( not ( = ?auto_637755 ?auto_637761 ) ) ( not ( = ?auto_637755 ?auto_637762 ) ) ( not ( = ?auto_637755 ?auto_637763 ) ) ( not ( = ?auto_637755 ?auto_637764 ) ) ( not ( = ?auto_637756 ?auto_637757 ) ) ( not ( = ?auto_637756 ?auto_637758 ) ) ( not ( = ?auto_637756 ?auto_637759 ) ) ( not ( = ?auto_637756 ?auto_637760 ) ) ( not ( = ?auto_637756 ?auto_637761 ) ) ( not ( = ?auto_637756 ?auto_637762 ) ) ( not ( = ?auto_637756 ?auto_637763 ) ) ( not ( = ?auto_637756 ?auto_637764 ) ) ( not ( = ?auto_637757 ?auto_637758 ) ) ( not ( = ?auto_637757 ?auto_637759 ) ) ( not ( = ?auto_637757 ?auto_637760 ) ) ( not ( = ?auto_637757 ?auto_637761 ) ) ( not ( = ?auto_637757 ?auto_637762 ) ) ( not ( = ?auto_637757 ?auto_637763 ) ) ( not ( = ?auto_637757 ?auto_637764 ) ) ( not ( = ?auto_637758 ?auto_637759 ) ) ( not ( = ?auto_637758 ?auto_637760 ) ) ( not ( = ?auto_637758 ?auto_637761 ) ) ( not ( = ?auto_637758 ?auto_637762 ) ) ( not ( = ?auto_637758 ?auto_637763 ) ) ( not ( = ?auto_637758 ?auto_637764 ) ) ( not ( = ?auto_637759 ?auto_637760 ) ) ( not ( = ?auto_637759 ?auto_637761 ) ) ( not ( = ?auto_637759 ?auto_637762 ) ) ( not ( = ?auto_637759 ?auto_637763 ) ) ( not ( = ?auto_637759 ?auto_637764 ) ) ( not ( = ?auto_637760 ?auto_637761 ) ) ( not ( = ?auto_637760 ?auto_637762 ) ) ( not ( = ?auto_637760 ?auto_637763 ) ) ( not ( = ?auto_637760 ?auto_637764 ) ) ( not ( = ?auto_637761 ?auto_637762 ) ) ( not ( = ?auto_637761 ?auto_637763 ) ) ( not ( = ?auto_637761 ?auto_637764 ) ) ( not ( = ?auto_637762 ?auto_637763 ) ) ( not ( = ?auto_637762 ?auto_637764 ) ) ( not ( = ?auto_637763 ?auto_637764 ) ) ( ON ?auto_637762 ?auto_637763 ) ( ON ?auto_637761 ?auto_637762 ) ( ON ?auto_637760 ?auto_637761 ) ( ON ?auto_637759 ?auto_637760 ) ( ON ?auto_637758 ?auto_637759 ) ( ON ?auto_637757 ?auto_637758 ) ( ON ?auto_637756 ?auto_637757 ) ( CLEAR ?auto_637754 ) ( ON ?auto_637755 ?auto_637756 ) ( CLEAR ?auto_637755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_637752 ?auto_637753 ?auto_637754 ?auto_637755 )
      ( MAKE-12PILE ?auto_637752 ?auto_637753 ?auto_637754 ?auto_637755 ?auto_637756 ?auto_637757 ?auto_637758 ?auto_637759 ?auto_637760 ?auto_637761 ?auto_637762 ?auto_637763 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_637802 - BLOCK
      ?auto_637803 - BLOCK
      ?auto_637804 - BLOCK
      ?auto_637805 - BLOCK
      ?auto_637806 - BLOCK
      ?auto_637807 - BLOCK
      ?auto_637808 - BLOCK
      ?auto_637809 - BLOCK
      ?auto_637810 - BLOCK
      ?auto_637811 - BLOCK
      ?auto_637812 - BLOCK
      ?auto_637813 - BLOCK
    )
    :vars
    (
      ?auto_637814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_637813 ?auto_637814 ) ( ON-TABLE ?auto_637802 ) ( ON ?auto_637803 ?auto_637802 ) ( not ( = ?auto_637802 ?auto_637803 ) ) ( not ( = ?auto_637802 ?auto_637804 ) ) ( not ( = ?auto_637802 ?auto_637805 ) ) ( not ( = ?auto_637802 ?auto_637806 ) ) ( not ( = ?auto_637802 ?auto_637807 ) ) ( not ( = ?auto_637802 ?auto_637808 ) ) ( not ( = ?auto_637802 ?auto_637809 ) ) ( not ( = ?auto_637802 ?auto_637810 ) ) ( not ( = ?auto_637802 ?auto_637811 ) ) ( not ( = ?auto_637802 ?auto_637812 ) ) ( not ( = ?auto_637802 ?auto_637813 ) ) ( not ( = ?auto_637802 ?auto_637814 ) ) ( not ( = ?auto_637803 ?auto_637804 ) ) ( not ( = ?auto_637803 ?auto_637805 ) ) ( not ( = ?auto_637803 ?auto_637806 ) ) ( not ( = ?auto_637803 ?auto_637807 ) ) ( not ( = ?auto_637803 ?auto_637808 ) ) ( not ( = ?auto_637803 ?auto_637809 ) ) ( not ( = ?auto_637803 ?auto_637810 ) ) ( not ( = ?auto_637803 ?auto_637811 ) ) ( not ( = ?auto_637803 ?auto_637812 ) ) ( not ( = ?auto_637803 ?auto_637813 ) ) ( not ( = ?auto_637803 ?auto_637814 ) ) ( not ( = ?auto_637804 ?auto_637805 ) ) ( not ( = ?auto_637804 ?auto_637806 ) ) ( not ( = ?auto_637804 ?auto_637807 ) ) ( not ( = ?auto_637804 ?auto_637808 ) ) ( not ( = ?auto_637804 ?auto_637809 ) ) ( not ( = ?auto_637804 ?auto_637810 ) ) ( not ( = ?auto_637804 ?auto_637811 ) ) ( not ( = ?auto_637804 ?auto_637812 ) ) ( not ( = ?auto_637804 ?auto_637813 ) ) ( not ( = ?auto_637804 ?auto_637814 ) ) ( not ( = ?auto_637805 ?auto_637806 ) ) ( not ( = ?auto_637805 ?auto_637807 ) ) ( not ( = ?auto_637805 ?auto_637808 ) ) ( not ( = ?auto_637805 ?auto_637809 ) ) ( not ( = ?auto_637805 ?auto_637810 ) ) ( not ( = ?auto_637805 ?auto_637811 ) ) ( not ( = ?auto_637805 ?auto_637812 ) ) ( not ( = ?auto_637805 ?auto_637813 ) ) ( not ( = ?auto_637805 ?auto_637814 ) ) ( not ( = ?auto_637806 ?auto_637807 ) ) ( not ( = ?auto_637806 ?auto_637808 ) ) ( not ( = ?auto_637806 ?auto_637809 ) ) ( not ( = ?auto_637806 ?auto_637810 ) ) ( not ( = ?auto_637806 ?auto_637811 ) ) ( not ( = ?auto_637806 ?auto_637812 ) ) ( not ( = ?auto_637806 ?auto_637813 ) ) ( not ( = ?auto_637806 ?auto_637814 ) ) ( not ( = ?auto_637807 ?auto_637808 ) ) ( not ( = ?auto_637807 ?auto_637809 ) ) ( not ( = ?auto_637807 ?auto_637810 ) ) ( not ( = ?auto_637807 ?auto_637811 ) ) ( not ( = ?auto_637807 ?auto_637812 ) ) ( not ( = ?auto_637807 ?auto_637813 ) ) ( not ( = ?auto_637807 ?auto_637814 ) ) ( not ( = ?auto_637808 ?auto_637809 ) ) ( not ( = ?auto_637808 ?auto_637810 ) ) ( not ( = ?auto_637808 ?auto_637811 ) ) ( not ( = ?auto_637808 ?auto_637812 ) ) ( not ( = ?auto_637808 ?auto_637813 ) ) ( not ( = ?auto_637808 ?auto_637814 ) ) ( not ( = ?auto_637809 ?auto_637810 ) ) ( not ( = ?auto_637809 ?auto_637811 ) ) ( not ( = ?auto_637809 ?auto_637812 ) ) ( not ( = ?auto_637809 ?auto_637813 ) ) ( not ( = ?auto_637809 ?auto_637814 ) ) ( not ( = ?auto_637810 ?auto_637811 ) ) ( not ( = ?auto_637810 ?auto_637812 ) ) ( not ( = ?auto_637810 ?auto_637813 ) ) ( not ( = ?auto_637810 ?auto_637814 ) ) ( not ( = ?auto_637811 ?auto_637812 ) ) ( not ( = ?auto_637811 ?auto_637813 ) ) ( not ( = ?auto_637811 ?auto_637814 ) ) ( not ( = ?auto_637812 ?auto_637813 ) ) ( not ( = ?auto_637812 ?auto_637814 ) ) ( not ( = ?auto_637813 ?auto_637814 ) ) ( ON ?auto_637812 ?auto_637813 ) ( ON ?auto_637811 ?auto_637812 ) ( ON ?auto_637810 ?auto_637811 ) ( ON ?auto_637809 ?auto_637810 ) ( ON ?auto_637808 ?auto_637809 ) ( ON ?auto_637807 ?auto_637808 ) ( ON ?auto_637806 ?auto_637807 ) ( ON ?auto_637805 ?auto_637806 ) ( CLEAR ?auto_637803 ) ( ON ?auto_637804 ?auto_637805 ) ( CLEAR ?auto_637804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_637802 ?auto_637803 ?auto_637804 )
      ( MAKE-12PILE ?auto_637802 ?auto_637803 ?auto_637804 ?auto_637805 ?auto_637806 ?auto_637807 ?auto_637808 ?auto_637809 ?auto_637810 ?auto_637811 ?auto_637812 ?auto_637813 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_637852 - BLOCK
      ?auto_637853 - BLOCK
      ?auto_637854 - BLOCK
      ?auto_637855 - BLOCK
      ?auto_637856 - BLOCK
      ?auto_637857 - BLOCK
      ?auto_637858 - BLOCK
      ?auto_637859 - BLOCK
      ?auto_637860 - BLOCK
      ?auto_637861 - BLOCK
      ?auto_637862 - BLOCK
      ?auto_637863 - BLOCK
    )
    :vars
    (
      ?auto_637864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_637863 ?auto_637864 ) ( ON-TABLE ?auto_637852 ) ( not ( = ?auto_637852 ?auto_637853 ) ) ( not ( = ?auto_637852 ?auto_637854 ) ) ( not ( = ?auto_637852 ?auto_637855 ) ) ( not ( = ?auto_637852 ?auto_637856 ) ) ( not ( = ?auto_637852 ?auto_637857 ) ) ( not ( = ?auto_637852 ?auto_637858 ) ) ( not ( = ?auto_637852 ?auto_637859 ) ) ( not ( = ?auto_637852 ?auto_637860 ) ) ( not ( = ?auto_637852 ?auto_637861 ) ) ( not ( = ?auto_637852 ?auto_637862 ) ) ( not ( = ?auto_637852 ?auto_637863 ) ) ( not ( = ?auto_637852 ?auto_637864 ) ) ( not ( = ?auto_637853 ?auto_637854 ) ) ( not ( = ?auto_637853 ?auto_637855 ) ) ( not ( = ?auto_637853 ?auto_637856 ) ) ( not ( = ?auto_637853 ?auto_637857 ) ) ( not ( = ?auto_637853 ?auto_637858 ) ) ( not ( = ?auto_637853 ?auto_637859 ) ) ( not ( = ?auto_637853 ?auto_637860 ) ) ( not ( = ?auto_637853 ?auto_637861 ) ) ( not ( = ?auto_637853 ?auto_637862 ) ) ( not ( = ?auto_637853 ?auto_637863 ) ) ( not ( = ?auto_637853 ?auto_637864 ) ) ( not ( = ?auto_637854 ?auto_637855 ) ) ( not ( = ?auto_637854 ?auto_637856 ) ) ( not ( = ?auto_637854 ?auto_637857 ) ) ( not ( = ?auto_637854 ?auto_637858 ) ) ( not ( = ?auto_637854 ?auto_637859 ) ) ( not ( = ?auto_637854 ?auto_637860 ) ) ( not ( = ?auto_637854 ?auto_637861 ) ) ( not ( = ?auto_637854 ?auto_637862 ) ) ( not ( = ?auto_637854 ?auto_637863 ) ) ( not ( = ?auto_637854 ?auto_637864 ) ) ( not ( = ?auto_637855 ?auto_637856 ) ) ( not ( = ?auto_637855 ?auto_637857 ) ) ( not ( = ?auto_637855 ?auto_637858 ) ) ( not ( = ?auto_637855 ?auto_637859 ) ) ( not ( = ?auto_637855 ?auto_637860 ) ) ( not ( = ?auto_637855 ?auto_637861 ) ) ( not ( = ?auto_637855 ?auto_637862 ) ) ( not ( = ?auto_637855 ?auto_637863 ) ) ( not ( = ?auto_637855 ?auto_637864 ) ) ( not ( = ?auto_637856 ?auto_637857 ) ) ( not ( = ?auto_637856 ?auto_637858 ) ) ( not ( = ?auto_637856 ?auto_637859 ) ) ( not ( = ?auto_637856 ?auto_637860 ) ) ( not ( = ?auto_637856 ?auto_637861 ) ) ( not ( = ?auto_637856 ?auto_637862 ) ) ( not ( = ?auto_637856 ?auto_637863 ) ) ( not ( = ?auto_637856 ?auto_637864 ) ) ( not ( = ?auto_637857 ?auto_637858 ) ) ( not ( = ?auto_637857 ?auto_637859 ) ) ( not ( = ?auto_637857 ?auto_637860 ) ) ( not ( = ?auto_637857 ?auto_637861 ) ) ( not ( = ?auto_637857 ?auto_637862 ) ) ( not ( = ?auto_637857 ?auto_637863 ) ) ( not ( = ?auto_637857 ?auto_637864 ) ) ( not ( = ?auto_637858 ?auto_637859 ) ) ( not ( = ?auto_637858 ?auto_637860 ) ) ( not ( = ?auto_637858 ?auto_637861 ) ) ( not ( = ?auto_637858 ?auto_637862 ) ) ( not ( = ?auto_637858 ?auto_637863 ) ) ( not ( = ?auto_637858 ?auto_637864 ) ) ( not ( = ?auto_637859 ?auto_637860 ) ) ( not ( = ?auto_637859 ?auto_637861 ) ) ( not ( = ?auto_637859 ?auto_637862 ) ) ( not ( = ?auto_637859 ?auto_637863 ) ) ( not ( = ?auto_637859 ?auto_637864 ) ) ( not ( = ?auto_637860 ?auto_637861 ) ) ( not ( = ?auto_637860 ?auto_637862 ) ) ( not ( = ?auto_637860 ?auto_637863 ) ) ( not ( = ?auto_637860 ?auto_637864 ) ) ( not ( = ?auto_637861 ?auto_637862 ) ) ( not ( = ?auto_637861 ?auto_637863 ) ) ( not ( = ?auto_637861 ?auto_637864 ) ) ( not ( = ?auto_637862 ?auto_637863 ) ) ( not ( = ?auto_637862 ?auto_637864 ) ) ( not ( = ?auto_637863 ?auto_637864 ) ) ( ON ?auto_637862 ?auto_637863 ) ( ON ?auto_637861 ?auto_637862 ) ( ON ?auto_637860 ?auto_637861 ) ( ON ?auto_637859 ?auto_637860 ) ( ON ?auto_637858 ?auto_637859 ) ( ON ?auto_637857 ?auto_637858 ) ( ON ?auto_637856 ?auto_637857 ) ( ON ?auto_637855 ?auto_637856 ) ( ON ?auto_637854 ?auto_637855 ) ( CLEAR ?auto_637852 ) ( ON ?auto_637853 ?auto_637854 ) ( CLEAR ?auto_637853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_637852 ?auto_637853 )
      ( MAKE-12PILE ?auto_637852 ?auto_637853 ?auto_637854 ?auto_637855 ?auto_637856 ?auto_637857 ?auto_637858 ?auto_637859 ?auto_637860 ?auto_637861 ?auto_637862 ?auto_637863 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_637902 - BLOCK
      ?auto_637903 - BLOCK
      ?auto_637904 - BLOCK
      ?auto_637905 - BLOCK
      ?auto_637906 - BLOCK
      ?auto_637907 - BLOCK
      ?auto_637908 - BLOCK
      ?auto_637909 - BLOCK
      ?auto_637910 - BLOCK
      ?auto_637911 - BLOCK
      ?auto_637912 - BLOCK
      ?auto_637913 - BLOCK
    )
    :vars
    (
      ?auto_637914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_637913 ?auto_637914 ) ( not ( = ?auto_637902 ?auto_637903 ) ) ( not ( = ?auto_637902 ?auto_637904 ) ) ( not ( = ?auto_637902 ?auto_637905 ) ) ( not ( = ?auto_637902 ?auto_637906 ) ) ( not ( = ?auto_637902 ?auto_637907 ) ) ( not ( = ?auto_637902 ?auto_637908 ) ) ( not ( = ?auto_637902 ?auto_637909 ) ) ( not ( = ?auto_637902 ?auto_637910 ) ) ( not ( = ?auto_637902 ?auto_637911 ) ) ( not ( = ?auto_637902 ?auto_637912 ) ) ( not ( = ?auto_637902 ?auto_637913 ) ) ( not ( = ?auto_637902 ?auto_637914 ) ) ( not ( = ?auto_637903 ?auto_637904 ) ) ( not ( = ?auto_637903 ?auto_637905 ) ) ( not ( = ?auto_637903 ?auto_637906 ) ) ( not ( = ?auto_637903 ?auto_637907 ) ) ( not ( = ?auto_637903 ?auto_637908 ) ) ( not ( = ?auto_637903 ?auto_637909 ) ) ( not ( = ?auto_637903 ?auto_637910 ) ) ( not ( = ?auto_637903 ?auto_637911 ) ) ( not ( = ?auto_637903 ?auto_637912 ) ) ( not ( = ?auto_637903 ?auto_637913 ) ) ( not ( = ?auto_637903 ?auto_637914 ) ) ( not ( = ?auto_637904 ?auto_637905 ) ) ( not ( = ?auto_637904 ?auto_637906 ) ) ( not ( = ?auto_637904 ?auto_637907 ) ) ( not ( = ?auto_637904 ?auto_637908 ) ) ( not ( = ?auto_637904 ?auto_637909 ) ) ( not ( = ?auto_637904 ?auto_637910 ) ) ( not ( = ?auto_637904 ?auto_637911 ) ) ( not ( = ?auto_637904 ?auto_637912 ) ) ( not ( = ?auto_637904 ?auto_637913 ) ) ( not ( = ?auto_637904 ?auto_637914 ) ) ( not ( = ?auto_637905 ?auto_637906 ) ) ( not ( = ?auto_637905 ?auto_637907 ) ) ( not ( = ?auto_637905 ?auto_637908 ) ) ( not ( = ?auto_637905 ?auto_637909 ) ) ( not ( = ?auto_637905 ?auto_637910 ) ) ( not ( = ?auto_637905 ?auto_637911 ) ) ( not ( = ?auto_637905 ?auto_637912 ) ) ( not ( = ?auto_637905 ?auto_637913 ) ) ( not ( = ?auto_637905 ?auto_637914 ) ) ( not ( = ?auto_637906 ?auto_637907 ) ) ( not ( = ?auto_637906 ?auto_637908 ) ) ( not ( = ?auto_637906 ?auto_637909 ) ) ( not ( = ?auto_637906 ?auto_637910 ) ) ( not ( = ?auto_637906 ?auto_637911 ) ) ( not ( = ?auto_637906 ?auto_637912 ) ) ( not ( = ?auto_637906 ?auto_637913 ) ) ( not ( = ?auto_637906 ?auto_637914 ) ) ( not ( = ?auto_637907 ?auto_637908 ) ) ( not ( = ?auto_637907 ?auto_637909 ) ) ( not ( = ?auto_637907 ?auto_637910 ) ) ( not ( = ?auto_637907 ?auto_637911 ) ) ( not ( = ?auto_637907 ?auto_637912 ) ) ( not ( = ?auto_637907 ?auto_637913 ) ) ( not ( = ?auto_637907 ?auto_637914 ) ) ( not ( = ?auto_637908 ?auto_637909 ) ) ( not ( = ?auto_637908 ?auto_637910 ) ) ( not ( = ?auto_637908 ?auto_637911 ) ) ( not ( = ?auto_637908 ?auto_637912 ) ) ( not ( = ?auto_637908 ?auto_637913 ) ) ( not ( = ?auto_637908 ?auto_637914 ) ) ( not ( = ?auto_637909 ?auto_637910 ) ) ( not ( = ?auto_637909 ?auto_637911 ) ) ( not ( = ?auto_637909 ?auto_637912 ) ) ( not ( = ?auto_637909 ?auto_637913 ) ) ( not ( = ?auto_637909 ?auto_637914 ) ) ( not ( = ?auto_637910 ?auto_637911 ) ) ( not ( = ?auto_637910 ?auto_637912 ) ) ( not ( = ?auto_637910 ?auto_637913 ) ) ( not ( = ?auto_637910 ?auto_637914 ) ) ( not ( = ?auto_637911 ?auto_637912 ) ) ( not ( = ?auto_637911 ?auto_637913 ) ) ( not ( = ?auto_637911 ?auto_637914 ) ) ( not ( = ?auto_637912 ?auto_637913 ) ) ( not ( = ?auto_637912 ?auto_637914 ) ) ( not ( = ?auto_637913 ?auto_637914 ) ) ( ON ?auto_637912 ?auto_637913 ) ( ON ?auto_637911 ?auto_637912 ) ( ON ?auto_637910 ?auto_637911 ) ( ON ?auto_637909 ?auto_637910 ) ( ON ?auto_637908 ?auto_637909 ) ( ON ?auto_637907 ?auto_637908 ) ( ON ?auto_637906 ?auto_637907 ) ( ON ?auto_637905 ?auto_637906 ) ( ON ?auto_637904 ?auto_637905 ) ( ON ?auto_637903 ?auto_637904 ) ( ON ?auto_637902 ?auto_637903 ) ( CLEAR ?auto_637902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_637902 )
      ( MAKE-12PILE ?auto_637902 ?auto_637903 ?auto_637904 ?auto_637905 ?auto_637906 ?auto_637907 ?auto_637908 ?auto_637909 ?auto_637910 ?auto_637911 ?auto_637912 ?auto_637913 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_637953 - BLOCK
      ?auto_637954 - BLOCK
      ?auto_637955 - BLOCK
      ?auto_637956 - BLOCK
      ?auto_637957 - BLOCK
      ?auto_637958 - BLOCK
      ?auto_637959 - BLOCK
      ?auto_637960 - BLOCK
      ?auto_637961 - BLOCK
      ?auto_637962 - BLOCK
      ?auto_637963 - BLOCK
      ?auto_637964 - BLOCK
      ?auto_637965 - BLOCK
    )
    :vars
    (
      ?auto_637966 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_637964 ) ( ON ?auto_637965 ?auto_637966 ) ( CLEAR ?auto_637965 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_637953 ) ( ON ?auto_637954 ?auto_637953 ) ( ON ?auto_637955 ?auto_637954 ) ( ON ?auto_637956 ?auto_637955 ) ( ON ?auto_637957 ?auto_637956 ) ( ON ?auto_637958 ?auto_637957 ) ( ON ?auto_637959 ?auto_637958 ) ( ON ?auto_637960 ?auto_637959 ) ( ON ?auto_637961 ?auto_637960 ) ( ON ?auto_637962 ?auto_637961 ) ( ON ?auto_637963 ?auto_637962 ) ( ON ?auto_637964 ?auto_637963 ) ( not ( = ?auto_637953 ?auto_637954 ) ) ( not ( = ?auto_637953 ?auto_637955 ) ) ( not ( = ?auto_637953 ?auto_637956 ) ) ( not ( = ?auto_637953 ?auto_637957 ) ) ( not ( = ?auto_637953 ?auto_637958 ) ) ( not ( = ?auto_637953 ?auto_637959 ) ) ( not ( = ?auto_637953 ?auto_637960 ) ) ( not ( = ?auto_637953 ?auto_637961 ) ) ( not ( = ?auto_637953 ?auto_637962 ) ) ( not ( = ?auto_637953 ?auto_637963 ) ) ( not ( = ?auto_637953 ?auto_637964 ) ) ( not ( = ?auto_637953 ?auto_637965 ) ) ( not ( = ?auto_637953 ?auto_637966 ) ) ( not ( = ?auto_637954 ?auto_637955 ) ) ( not ( = ?auto_637954 ?auto_637956 ) ) ( not ( = ?auto_637954 ?auto_637957 ) ) ( not ( = ?auto_637954 ?auto_637958 ) ) ( not ( = ?auto_637954 ?auto_637959 ) ) ( not ( = ?auto_637954 ?auto_637960 ) ) ( not ( = ?auto_637954 ?auto_637961 ) ) ( not ( = ?auto_637954 ?auto_637962 ) ) ( not ( = ?auto_637954 ?auto_637963 ) ) ( not ( = ?auto_637954 ?auto_637964 ) ) ( not ( = ?auto_637954 ?auto_637965 ) ) ( not ( = ?auto_637954 ?auto_637966 ) ) ( not ( = ?auto_637955 ?auto_637956 ) ) ( not ( = ?auto_637955 ?auto_637957 ) ) ( not ( = ?auto_637955 ?auto_637958 ) ) ( not ( = ?auto_637955 ?auto_637959 ) ) ( not ( = ?auto_637955 ?auto_637960 ) ) ( not ( = ?auto_637955 ?auto_637961 ) ) ( not ( = ?auto_637955 ?auto_637962 ) ) ( not ( = ?auto_637955 ?auto_637963 ) ) ( not ( = ?auto_637955 ?auto_637964 ) ) ( not ( = ?auto_637955 ?auto_637965 ) ) ( not ( = ?auto_637955 ?auto_637966 ) ) ( not ( = ?auto_637956 ?auto_637957 ) ) ( not ( = ?auto_637956 ?auto_637958 ) ) ( not ( = ?auto_637956 ?auto_637959 ) ) ( not ( = ?auto_637956 ?auto_637960 ) ) ( not ( = ?auto_637956 ?auto_637961 ) ) ( not ( = ?auto_637956 ?auto_637962 ) ) ( not ( = ?auto_637956 ?auto_637963 ) ) ( not ( = ?auto_637956 ?auto_637964 ) ) ( not ( = ?auto_637956 ?auto_637965 ) ) ( not ( = ?auto_637956 ?auto_637966 ) ) ( not ( = ?auto_637957 ?auto_637958 ) ) ( not ( = ?auto_637957 ?auto_637959 ) ) ( not ( = ?auto_637957 ?auto_637960 ) ) ( not ( = ?auto_637957 ?auto_637961 ) ) ( not ( = ?auto_637957 ?auto_637962 ) ) ( not ( = ?auto_637957 ?auto_637963 ) ) ( not ( = ?auto_637957 ?auto_637964 ) ) ( not ( = ?auto_637957 ?auto_637965 ) ) ( not ( = ?auto_637957 ?auto_637966 ) ) ( not ( = ?auto_637958 ?auto_637959 ) ) ( not ( = ?auto_637958 ?auto_637960 ) ) ( not ( = ?auto_637958 ?auto_637961 ) ) ( not ( = ?auto_637958 ?auto_637962 ) ) ( not ( = ?auto_637958 ?auto_637963 ) ) ( not ( = ?auto_637958 ?auto_637964 ) ) ( not ( = ?auto_637958 ?auto_637965 ) ) ( not ( = ?auto_637958 ?auto_637966 ) ) ( not ( = ?auto_637959 ?auto_637960 ) ) ( not ( = ?auto_637959 ?auto_637961 ) ) ( not ( = ?auto_637959 ?auto_637962 ) ) ( not ( = ?auto_637959 ?auto_637963 ) ) ( not ( = ?auto_637959 ?auto_637964 ) ) ( not ( = ?auto_637959 ?auto_637965 ) ) ( not ( = ?auto_637959 ?auto_637966 ) ) ( not ( = ?auto_637960 ?auto_637961 ) ) ( not ( = ?auto_637960 ?auto_637962 ) ) ( not ( = ?auto_637960 ?auto_637963 ) ) ( not ( = ?auto_637960 ?auto_637964 ) ) ( not ( = ?auto_637960 ?auto_637965 ) ) ( not ( = ?auto_637960 ?auto_637966 ) ) ( not ( = ?auto_637961 ?auto_637962 ) ) ( not ( = ?auto_637961 ?auto_637963 ) ) ( not ( = ?auto_637961 ?auto_637964 ) ) ( not ( = ?auto_637961 ?auto_637965 ) ) ( not ( = ?auto_637961 ?auto_637966 ) ) ( not ( = ?auto_637962 ?auto_637963 ) ) ( not ( = ?auto_637962 ?auto_637964 ) ) ( not ( = ?auto_637962 ?auto_637965 ) ) ( not ( = ?auto_637962 ?auto_637966 ) ) ( not ( = ?auto_637963 ?auto_637964 ) ) ( not ( = ?auto_637963 ?auto_637965 ) ) ( not ( = ?auto_637963 ?auto_637966 ) ) ( not ( = ?auto_637964 ?auto_637965 ) ) ( not ( = ?auto_637964 ?auto_637966 ) ) ( not ( = ?auto_637965 ?auto_637966 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_637965 ?auto_637966 )
      ( !STACK ?auto_637965 ?auto_637964 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_638007 - BLOCK
      ?auto_638008 - BLOCK
      ?auto_638009 - BLOCK
      ?auto_638010 - BLOCK
      ?auto_638011 - BLOCK
      ?auto_638012 - BLOCK
      ?auto_638013 - BLOCK
      ?auto_638014 - BLOCK
      ?auto_638015 - BLOCK
      ?auto_638016 - BLOCK
      ?auto_638017 - BLOCK
      ?auto_638018 - BLOCK
      ?auto_638019 - BLOCK
    )
    :vars
    (
      ?auto_638020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_638019 ?auto_638020 ) ( ON-TABLE ?auto_638007 ) ( ON ?auto_638008 ?auto_638007 ) ( ON ?auto_638009 ?auto_638008 ) ( ON ?auto_638010 ?auto_638009 ) ( ON ?auto_638011 ?auto_638010 ) ( ON ?auto_638012 ?auto_638011 ) ( ON ?auto_638013 ?auto_638012 ) ( ON ?auto_638014 ?auto_638013 ) ( ON ?auto_638015 ?auto_638014 ) ( ON ?auto_638016 ?auto_638015 ) ( ON ?auto_638017 ?auto_638016 ) ( not ( = ?auto_638007 ?auto_638008 ) ) ( not ( = ?auto_638007 ?auto_638009 ) ) ( not ( = ?auto_638007 ?auto_638010 ) ) ( not ( = ?auto_638007 ?auto_638011 ) ) ( not ( = ?auto_638007 ?auto_638012 ) ) ( not ( = ?auto_638007 ?auto_638013 ) ) ( not ( = ?auto_638007 ?auto_638014 ) ) ( not ( = ?auto_638007 ?auto_638015 ) ) ( not ( = ?auto_638007 ?auto_638016 ) ) ( not ( = ?auto_638007 ?auto_638017 ) ) ( not ( = ?auto_638007 ?auto_638018 ) ) ( not ( = ?auto_638007 ?auto_638019 ) ) ( not ( = ?auto_638007 ?auto_638020 ) ) ( not ( = ?auto_638008 ?auto_638009 ) ) ( not ( = ?auto_638008 ?auto_638010 ) ) ( not ( = ?auto_638008 ?auto_638011 ) ) ( not ( = ?auto_638008 ?auto_638012 ) ) ( not ( = ?auto_638008 ?auto_638013 ) ) ( not ( = ?auto_638008 ?auto_638014 ) ) ( not ( = ?auto_638008 ?auto_638015 ) ) ( not ( = ?auto_638008 ?auto_638016 ) ) ( not ( = ?auto_638008 ?auto_638017 ) ) ( not ( = ?auto_638008 ?auto_638018 ) ) ( not ( = ?auto_638008 ?auto_638019 ) ) ( not ( = ?auto_638008 ?auto_638020 ) ) ( not ( = ?auto_638009 ?auto_638010 ) ) ( not ( = ?auto_638009 ?auto_638011 ) ) ( not ( = ?auto_638009 ?auto_638012 ) ) ( not ( = ?auto_638009 ?auto_638013 ) ) ( not ( = ?auto_638009 ?auto_638014 ) ) ( not ( = ?auto_638009 ?auto_638015 ) ) ( not ( = ?auto_638009 ?auto_638016 ) ) ( not ( = ?auto_638009 ?auto_638017 ) ) ( not ( = ?auto_638009 ?auto_638018 ) ) ( not ( = ?auto_638009 ?auto_638019 ) ) ( not ( = ?auto_638009 ?auto_638020 ) ) ( not ( = ?auto_638010 ?auto_638011 ) ) ( not ( = ?auto_638010 ?auto_638012 ) ) ( not ( = ?auto_638010 ?auto_638013 ) ) ( not ( = ?auto_638010 ?auto_638014 ) ) ( not ( = ?auto_638010 ?auto_638015 ) ) ( not ( = ?auto_638010 ?auto_638016 ) ) ( not ( = ?auto_638010 ?auto_638017 ) ) ( not ( = ?auto_638010 ?auto_638018 ) ) ( not ( = ?auto_638010 ?auto_638019 ) ) ( not ( = ?auto_638010 ?auto_638020 ) ) ( not ( = ?auto_638011 ?auto_638012 ) ) ( not ( = ?auto_638011 ?auto_638013 ) ) ( not ( = ?auto_638011 ?auto_638014 ) ) ( not ( = ?auto_638011 ?auto_638015 ) ) ( not ( = ?auto_638011 ?auto_638016 ) ) ( not ( = ?auto_638011 ?auto_638017 ) ) ( not ( = ?auto_638011 ?auto_638018 ) ) ( not ( = ?auto_638011 ?auto_638019 ) ) ( not ( = ?auto_638011 ?auto_638020 ) ) ( not ( = ?auto_638012 ?auto_638013 ) ) ( not ( = ?auto_638012 ?auto_638014 ) ) ( not ( = ?auto_638012 ?auto_638015 ) ) ( not ( = ?auto_638012 ?auto_638016 ) ) ( not ( = ?auto_638012 ?auto_638017 ) ) ( not ( = ?auto_638012 ?auto_638018 ) ) ( not ( = ?auto_638012 ?auto_638019 ) ) ( not ( = ?auto_638012 ?auto_638020 ) ) ( not ( = ?auto_638013 ?auto_638014 ) ) ( not ( = ?auto_638013 ?auto_638015 ) ) ( not ( = ?auto_638013 ?auto_638016 ) ) ( not ( = ?auto_638013 ?auto_638017 ) ) ( not ( = ?auto_638013 ?auto_638018 ) ) ( not ( = ?auto_638013 ?auto_638019 ) ) ( not ( = ?auto_638013 ?auto_638020 ) ) ( not ( = ?auto_638014 ?auto_638015 ) ) ( not ( = ?auto_638014 ?auto_638016 ) ) ( not ( = ?auto_638014 ?auto_638017 ) ) ( not ( = ?auto_638014 ?auto_638018 ) ) ( not ( = ?auto_638014 ?auto_638019 ) ) ( not ( = ?auto_638014 ?auto_638020 ) ) ( not ( = ?auto_638015 ?auto_638016 ) ) ( not ( = ?auto_638015 ?auto_638017 ) ) ( not ( = ?auto_638015 ?auto_638018 ) ) ( not ( = ?auto_638015 ?auto_638019 ) ) ( not ( = ?auto_638015 ?auto_638020 ) ) ( not ( = ?auto_638016 ?auto_638017 ) ) ( not ( = ?auto_638016 ?auto_638018 ) ) ( not ( = ?auto_638016 ?auto_638019 ) ) ( not ( = ?auto_638016 ?auto_638020 ) ) ( not ( = ?auto_638017 ?auto_638018 ) ) ( not ( = ?auto_638017 ?auto_638019 ) ) ( not ( = ?auto_638017 ?auto_638020 ) ) ( not ( = ?auto_638018 ?auto_638019 ) ) ( not ( = ?auto_638018 ?auto_638020 ) ) ( not ( = ?auto_638019 ?auto_638020 ) ) ( CLEAR ?auto_638017 ) ( ON ?auto_638018 ?auto_638019 ) ( CLEAR ?auto_638018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_638007 ?auto_638008 ?auto_638009 ?auto_638010 ?auto_638011 ?auto_638012 ?auto_638013 ?auto_638014 ?auto_638015 ?auto_638016 ?auto_638017 ?auto_638018 )
      ( MAKE-13PILE ?auto_638007 ?auto_638008 ?auto_638009 ?auto_638010 ?auto_638011 ?auto_638012 ?auto_638013 ?auto_638014 ?auto_638015 ?auto_638016 ?auto_638017 ?auto_638018 ?auto_638019 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_638061 - BLOCK
      ?auto_638062 - BLOCK
      ?auto_638063 - BLOCK
      ?auto_638064 - BLOCK
      ?auto_638065 - BLOCK
      ?auto_638066 - BLOCK
      ?auto_638067 - BLOCK
      ?auto_638068 - BLOCK
      ?auto_638069 - BLOCK
      ?auto_638070 - BLOCK
      ?auto_638071 - BLOCK
      ?auto_638072 - BLOCK
      ?auto_638073 - BLOCK
    )
    :vars
    (
      ?auto_638074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_638073 ?auto_638074 ) ( ON-TABLE ?auto_638061 ) ( ON ?auto_638062 ?auto_638061 ) ( ON ?auto_638063 ?auto_638062 ) ( ON ?auto_638064 ?auto_638063 ) ( ON ?auto_638065 ?auto_638064 ) ( ON ?auto_638066 ?auto_638065 ) ( ON ?auto_638067 ?auto_638066 ) ( ON ?auto_638068 ?auto_638067 ) ( ON ?auto_638069 ?auto_638068 ) ( ON ?auto_638070 ?auto_638069 ) ( not ( = ?auto_638061 ?auto_638062 ) ) ( not ( = ?auto_638061 ?auto_638063 ) ) ( not ( = ?auto_638061 ?auto_638064 ) ) ( not ( = ?auto_638061 ?auto_638065 ) ) ( not ( = ?auto_638061 ?auto_638066 ) ) ( not ( = ?auto_638061 ?auto_638067 ) ) ( not ( = ?auto_638061 ?auto_638068 ) ) ( not ( = ?auto_638061 ?auto_638069 ) ) ( not ( = ?auto_638061 ?auto_638070 ) ) ( not ( = ?auto_638061 ?auto_638071 ) ) ( not ( = ?auto_638061 ?auto_638072 ) ) ( not ( = ?auto_638061 ?auto_638073 ) ) ( not ( = ?auto_638061 ?auto_638074 ) ) ( not ( = ?auto_638062 ?auto_638063 ) ) ( not ( = ?auto_638062 ?auto_638064 ) ) ( not ( = ?auto_638062 ?auto_638065 ) ) ( not ( = ?auto_638062 ?auto_638066 ) ) ( not ( = ?auto_638062 ?auto_638067 ) ) ( not ( = ?auto_638062 ?auto_638068 ) ) ( not ( = ?auto_638062 ?auto_638069 ) ) ( not ( = ?auto_638062 ?auto_638070 ) ) ( not ( = ?auto_638062 ?auto_638071 ) ) ( not ( = ?auto_638062 ?auto_638072 ) ) ( not ( = ?auto_638062 ?auto_638073 ) ) ( not ( = ?auto_638062 ?auto_638074 ) ) ( not ( = ?auto_638063 ?auto_638064 ) ) ( not ( = ?auto_638063 ?auto_638065 ) ) ( not ( = ?auto_638063 ?auto_638066 ) ) ( not ( = ?auto_638063 ?auto_638067 ) ) ( not ( = ?auto_638063 ?auto_638068 ) ) ( not ( = ?auto_638063 ?auto_638069 ) ) ( not ( = ?auto_638063 ?auto_638070 ) ) ( not ( = ?auto_638063 ?auto_638071 ) ) ( not ( = ?auto_638063 ?auto_638072 ) ) ( not ( = ?auto_638063 ?auto_638073 ) ) ( not ( = ?auto_638063 ?auto_638074 ) ) ( not ( = ?auto_638064 ?auto_638065 ) ) ( not ( = ?auto_638064 ?auto_638066 ) ) ( not ( = ?auto_638064 ?auto_638067 ) ) ( not ( = ?auto_638064 ?auto_638068 ) ) ( not ( = ?auto_638064 ?auto_638069 ) ) ( not ( = ?auto_638064 ?auto_638070 ) ) ( not ( = ?auto_638064 ?auto_638071 ) ) ( not ( = ?auto_638064 ?auto_638072 ) ) ( not ( = ?auto_638064 ?auto_638073 ) ) ( not ( = ?auto_638064 ?auto_638074 ) ) ( not ( = ?auto_638065 ?auto_638066 ) ) ( not ( = ?auto_638065 ?auto_638067 ) ) ( not ( = ?auto_638065 ?auto_638068 ) ) ( not ( = ?auto_638065 ?auto_638069 ) ) ( not ( = ?auto_638065 ?auto_638070 ) ) ( not ( = ?auto_638065 ?auto_638071 ) ) ( not ( = ?auto_638065 ?auto_638072 ) ) ( not ( = ?auto_638065 ?auto_638073 ) ) ( not ( = ?auto_638065 ?auto_638074 ) ) ( not ( = ?auto_638066 ?auto_638067 ) ) ( not ( = ?auto_638066 ?auto_638068 ) ) ( not ( = ?auto_638066 ?auto_638069 ) ) ( not ( = ?auto_638066 ?auto_638070 ) ) ( not ( = ?auto_638066 ?auto_638071 ) ) ( not ( = ?auto_638066 ?auto_638072 ) ) ( not ( = ?auto_638066 ?auto_638073 ) ) ( not ( = ?auto_638066 ?auto_638074 ) ) ( not ( = ?auto_638067 ?auto_638068 ) ) ( not ( = ?auto_638067 ?auto_638069 ) ) ( not ( = ?auto_638067 ?auto_638070 ) ) ( not ( = ?auto_638067 ?auto_638071 ) ) ( not ( = ?auto_638067 ?auto_638072 ) ) ( not ( = ?auto_638067 ?auto_638073 ) ) ( not ( = ?auto_638067 ?auto_638074 ) ) ( not ( = ?auto_638068 ?auto_638069 ) ) ( not ( = ?auto_638068 ?auto_638070 ) ) ( not ( = ?auto_638068 ?auto_638071 ) ) ( not ( = ?auto_638068 ?auto_638072 ) ) ( not ( = ?auto_638068 ?auto_638073 ) ) ( not ( = ?auto_638068 ?auto_638074 ) ) ( not ( = ?auto_638069 ?auto_638070 ) ) ( not ( = ?auto_638069 ?auto_638071 ) ) ( not ( = ?auto_638069 ?auto_638072 ) ) ( not ( = ?auto_638069 ?auto_638073 ) ) ( not ( = ?auto_638069 ?auto_638074 ) ) ( not ( = ?auto_638070 ?auto_638071 ) ) ( not ( = ?auto_638070 ?auto_638072 ) ) ( not ( = ?auto_638070 ?auto_638073 ) ) ( not ( = ?auto_638070 ?auto_638074 ) ) ( not ( = ?auto_638071 ?auto_638072 ) ) ( not ( = ?auto_638071 ?auto_638073 ) ) ( not ( = ?auto_638071 ?auto_638074 ) ) ( not ( = ?auto_638072 ?auto_638073 ) ) ( not ( = ?auto_638072 ?auto_638074 ) ) ( not ( = ?auto_638073 ?auto_638074 ) ) ( ON ?auto_638072 ?auto_638073 ) ( CLEAR ?auto_638070 ) ( ON ?auto_638071 ?auto_638072 ) ( CLEAR ?auto_638071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_638061 ?auto_638062 ?auto_638063 ?auto_638064 ?auto_638065 ?auto_638066 ?auto_638067 ?auto_638068 ?auto_638069 ?auto_638070 ?auto_638071 )
      ( MAKE-13PILE ?auto_638061 ?auto_638062 ?auto_638063 ?auto_638064 ?auto_638065 ?auto_638066 ?auto_638067 ?auto_638068 ?auto_638069 ?auto_638070 ?auto_638071 ?auto_638072 ?auto_638073 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_638115 - BLOCK
      ?auto_638116 - BLOCK
      ?auto_638117 - BLOCK
      ?auto_638118 - BLOCK
      ?auto_638119 - BLOCK
      ?auto_638120 - BLOCK
      ?auto_638121 - BLOCK
      ?auto_638122 - BLOCK
      ?auto_638123 - BLOCK
      ?auto_638124 - BLOCK
      ?auto_638125 - BLOCK
      ?auto_638126 - BLOCK
      ?auto_638127 - BLOCK
    )
    :vars
    (
      ?auto_638128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_638127 ?auto_638128 ) ( ON-TABLE ?auto_638115 ) ( ON ?auto_638116 ?auto_638115 ) ( ON ?auto_638117 ?auto_638116 ) ( ON ?auto_638118 ?auto_638117 ) ( ON ?auto_638119 ?auto_638118 ) ( ON ?auto_638120 ?auto_638119 ) ( ON ?auto_638121 ?auto_638120 ) ( ON ?auto_638122 ?auto_638121 ) ( ON ?auto_638123 ?auto_638122 ) ( not ( = ?auto_638115 ?auto_638116 ) ) ( not ( = ?auto_638115 ?auto_638117 ) ) ( not ( = ?auto_638115 ?auto_638118 ) ) ( not ( = ?auto_638115 ?auto_638119 ) ) ( not ( = ?auto_638115 ?auto_638120 ) ) ( not ( = ?auto_638115 ?auto_638121 ) ) ( not ( = ?auto_638115 ?auto_638122 ) ) ( not ( = ?auto_638115 ?auto_638123 ) ) ( not ( = ?auto_638115 ?auto_638124 ) ) ( not ( = ?auto_638115 ?auto_638125 ) ) ( not ( = ?auto_638115 ?auto_638126 ) ) ( not ( = ?auto_638115 ?auto_638127 ) ) ( not ( = ?auto_638115 ?auto_638128 ) ) ( not ( = ?auto_638116 ?auto_638117 ) ) ( not ( = ?auto_638116 ?auto_638118 ) ) ( not ( = ?auto_638116 ?auto_638119 ) ) ( not ( = ?auto_638116 ?auto_638120 ) ) ( not ( = ?auto_638116 ?auto_638121 ) ) ( not ( = ?auto_638116 ?auto_638122 ) ) ( not ( = ?auto_638116 ?auto_638123 ) ) ( not ( = ?auto_638116 ?auto_638124 ) ) ( not ( = ?auto_638116 ?auto_638125 ) ) ( not ( = ?auto_638116 ?auto_638126 ) ) ( not ( = ?auto_638116 ?auto_638127 ) ) ( not ( = ?auto_638116 ?auto_638128 ) ) ( not ( = ?auto_638117 ?auto_638118 ) ) ( not ( = ?auto_638117 ?auto_638119 ) ) ( not ( = ?auto_638117 ?auto_638120 ) ) ( not ( = ?auto_638117 ?auto_638121 ) ) ( not ( = ?auto_638117 ?auto_638122 ) ) ( not ( = ?auto_638117 ?auto_638123 ) ) ( not ( = ?auto_638117 ?auto_638124 ) ) ( not ( = ?auto_638117 ?auto_638125 ) ) ( not ( = ?auto_638117 ?auto_638126 ) ) ( not ( = ?auto_638117 ?auto_638127 ) ) ( not ( = ?auto_638117 ?auto_638128 ) ) ( not ( = ?auto_638118 ?auto_638119 ) ) ( not ( = ?auto_638118 ?auto_638120 ) ) ( not ( = ?auto_638118 ?auto_638121 ) ) ( not ( = ?auto_638118 ?auto_638122 ) ) ( not ( = ?auto_638118 ?auto_638123 ) ) ( not ( = ?auto_638118 ?auto_638124 ) ) ( not ( = ?auto_638118 ?auto_638125 ) ) ( not ( = ?auto_638118 ?auto_638126 ) ) ( not ( = ?auto_638118 ?auto_638127 ) ) ( not ( = ?auto_638118 ?auto_638128 ) ) ( not ( = ?auto_638119 ?auto_638120 ) ) ( not ( = ?auto_638119 ?auto_638121 ) ) ( not ( = ?auto_638119 ?auto_638122 ) ) ( not ( = ?auto_638119 ?auto_638123 ) ) ( not ( = ?auto_638119 ?auto_638124 ) ) ( not ( = ?auto_638119 ?auto_638125 ) ) ( not ( = ?auto_638119 ?auto_638126 ) ) ( not ( = ?auto_638119 ?auto_638127 ) ) ( not ( = ?auto_638119 ?auto_638128 ) ) ( not ( = ?auto_638120 ?auto_638121 ) ) ( not ( = ?auto_638120 ?auto_638122 ) ) ( not ( = ?auto_638120 ?auto_638123 ) ) ( not ( = ?auto_638120 ?auto_638124 ) ) ( not ( = ?auto_638120 ?auto_638125 ) ) ( not ( = ?auto_638120 ?auto_638126 ) ) ( not ( = ?auto_638120 ?auto_638127 ) ) ( not ( = ?auto_638120 ?auto_638128 ) ) ( not ( = ?auto_638121 ?auto_638122 ) ) ( not ( = ?auto_638121 ?auto_638123 ) ) ( not ( = ?auto_638121 ?auto_638124 ) ) ( not ( = ?auto_638121 ?auto_638125 ) ) ( not ( = ?auto_638121 ?auto_638126 ) ) ( not ( = ?auto_638121 ?auto_638127 ) ) ( not ( = ?auto_638121 ?auto_638128 ) ) ( not ( = ?auto_638122 ?auto_638123 ) ) ( not ( = ?auto_638122 ?auto_638124 ) ) ( not ( = ?auto_638122 ?auto_638125 ) ) ( not ( = ?auto_638122 ?auto_638126 ) ) ( not ( = ?auto_638122 ?auto_638127 ) ) ( not ( = ?auto_638122 ?auto_638128 ) ) ( not ( = ?auto_638123 ?auto_638124 ) ) ( not ( = ?auto_638123 ?auto_638125 ) ) ( not ( = ?auto_638123 ?auto_638126 ) ) ( not ( = ?auto_638123 ?auto_638127 ) ) ( not ( = ?auto_638123 ?auto_638128 ) ) ( not ( = ?auto_638124 ?auto_638125 ) ) ( not ( = ?auto_638124 ?auto_638126 ) ) ( not ( = ?auto_638124 ?auto_638127 ) ) ( not ( = ?auto_638124 ?auto_638128 ) ) ( not ( = ?auto_638125 ?auto_638126 ) ) ( not ( = ?auto_638125 ?auto_638127 ) ) ( not ( = ?auto_638125 ?auto_638128 ) ) ( not ( = ?auto_638126 ?auto_638127 ) ) ( not ( = ?auto_638126 ?auto_638128 ) ) ( not ( = ?auto_638127 ?auto_638128 ) ) ( ON ?auto_638126 ?auto_638127 ) ( ON ?auto_638125 ?auto_638126 ) ( CLEAR ?auto_638123 ) ( ON ?auto_638124 ?auto_638125 ) ( CLEAR ?auto_638124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_638115 ?auto_638116 ?auto_638117 ?auto_638118 ?auto_638119 ?auto_638120 ?auto_638121 ?auto_638122 ?auto_638123 ?auto_638124 )
      ( MAKE-13PILE ?auto_638115 ?auto_638116 ?auto_638117 ?auto_638118 ?auto_638119 ?auto_638120 ?auto_638121 ?auto_638122 ?auto_638123 ?auto_638124 ?auto_638125 ?auto_638126 ?auto_638127 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_638169 - BLOCK
      ?auto_638170 - BLOCK
      ?auto_638171 - BLOCK
      ?auto_638172 - BLOCK
      ?auto_638173 - BLOCK
      ?auto_638174 - BLOCK
      ?auto_638175 - BLOCK
      ?auto_638176 - BLOCK
      ?auto_638177 - BLOCK
      ?auto_638178 - BLOCK
      ?auto_638179 - BLOCK
      ?auto_638180 - BLOCK
      ?auto_638181 - BLOCK
    )
    :vars
    (
      ?auto_638182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_638181 ?auto_638182 ) ( ON-TABLE ?auto_638169 ) ( ON ?auto_638170 ?auto_638169 ) ( ON ?auto_638171 ?auto_638170 ) ( ON ?auto_638172 ?auto_638171 ) ( ON ?auto_638173 ?auto_638172 ) ( ON ?auto_638174 ?auto_638173 ) ( ON ?auto_638175 ?auto_638174 ) ( ON ?auto_638176 ?auto_638175 ) ( not ( = ?auto_638169 ?auto_638170 ) ) ( not ( = ?auto_638169 ?auto_638171 ) ) ( not ( = ?auto_638169 ?auto_638172 ) ) ( not ( = ?auto_638169 ?auto_638173 ) ) ( not ( = ?auto_638169 ?auto_638174 ) ) ( not ( = ?auto_638169 ?auto_638175 ) ) ( not ( = ?auto_638169 ?auto_638176 ) ) ( not ( = ?auto_638169 ?auto_638177 ) ) ( not ( = ?auto_638169 ?auto_638178 ) ) ( not ( = ?auto_638169 ?auto_638179 ) ) ( not ( = ?auto_638169 ?auto_638180 ) ) ( not ( = ?auto_638169 ?auto_638181 ) ) ( not ( = ?auto_638169 ?auto_638182 ) ) ( not ( = ?auto_638170 ?auto_638171 ) ) ( not ( = ?auto_638170 ?auto_638172 ) ) ( not ( = ?auto_638170 ?auto_638173 ) ) ( not ( = ?auto_638170 ?auto_638174 ) ) ( not ( = ?auto_638170 ?auto_638175 ) ) ( not ( = ?auto_638170 ?auto_638176 ) ) ( not ( = ?auto_638170 ?auto_638177 ) ) ( not ( = ?auto_638170 ?auto_638178 ) ) ( not ( = ?auto_638170 ?auto_638179 ) ) ( not ( = ?auto_638170 ?auto_638180 ) ) ( not ( = ?auto_638170 ?auto_638181 ) ) ( not ( = ?auto_638170 ?auto_638182 ) ) ( not ( = ?auto_638171 ?auto_638172 ) ) ( not ( = ?auto_638171 ?auto_638173 ) ) ( not ( = ?auto_638171 ?auto_638174 ) ) ( not ( = ?auto_638171 ?auto_638175 ) ) ( not ( = ?auto_638171 ?auto_638176 ) ) ( not ( = ?auto_638171 ?auto_638177 ) ) ( not ( = ?auto_638171 ?auto_638178 ) ) ( not ( = ?auto_638171 ?auto_638179 ) ) ( not ( = ?auto_638171 ?auto_638180 ) ) ( not ( = ?auto_638171 ?auto_638181 ) ) ( not ( = ?auto_638171 ?auto_638182 ) ) ( not ( = ?auto_638172 ?auto_638173 ) ) ( not ( = ?auto_638172 ?auto_638174 ) ) ( not ( = ?auto_638172 ?auto_638175 ) ) ( not ( = ?auto_638172 ?auto_638176 ) ) ( not ( = ?auto_638172 ?auto_638177 ) ) ( not ( = ?auto_638172 ?auto_638178 ) ) ( not ( = ?auto_638172 ?auto_638179 ) ) ( not ( = ?auto_638172 ?auto_638180 ) ) ( not ( = ?auto_638172 ?auto_638181 ) ) ( not ( = ?auto_638172 ?auto_638182 ) ) ( not ( = ?auto_638173 ?auto_638174 ) ) ( not ( = ?auto_638173 ?auto_638175 ) ) ( not ( = ?auto_638173 ?auto_638176 ) ) ( not ( = ?auto_638173 ?auto_638177 ) ) ( not ( = ?auto_638173 ?auto_638178 ) ) ( not ( = ?auto_638173 ?auto_638179 ) ) ( not ( = ?auto_638173 ?auto_638180 ) ) ( not ( = ?auto_638173 ?auto_638181 ) ) ( not ( = ?auto_638173 ?auto_638182 ) ) ( not ( = ?auto_638174 ?auto_638175 ) ) ( not ( = ?auto_638174 ?auto_638176 ) ) ( not ( = ?auto_638174 ?auto_638177 ) ) ( not ( = ?auto_638174 ?auto_638178 ) ) ( not ( = ?auto_638174 ?auto_638179 ) ) ( not ( = ?auto_638174 ?auto_638180 ) ) ( not ( = ?auto_638174 ?auto_638181 ) ) ( not ( = ?auto_638174 ?auto_638182 ) ) ( not ( = ?auto_638175 ?auto_638176 ) ) ( not ( = ?auto_638175 ?auto_638177 ) ) ( not ( = ?auto_638175 ?auto_638178 ) ) ( not ( = ?auto_638175 ?auto_638179 ) ) ( not ( = ?auto_638175 ?auto_638180 ) ) ( not ( = ?auto_638175 ?auto_638181 ) ) ( not ( = ?auto_638175 ?auto_638182 ) ) ( not ( = ?auto_638176 ?auto_638177 ) ) ( not ( = ?auto_638176 ?auto_638178 ) ) ( not ( = ?auto_638176 ?auto_638179 ) ) ( not ( = ?auto_638176 ?auto_638180 ) ) ( not ( = ?auto_638176 ?auto_638181 ) ) ( not ( = ?auto_638176 ?auto_638182 ) ) ( not ( = ?auto_638177 ?auto_638178 ) ) ( not ( = ?auto_638177 ?auto_638179 ) ) ( not ( = ?auto_638177 ?auto_638180 ) ) ( not ( = ?auto_638177 ?auto_638181 ) ) ( not ( = ?auto_638177 ?auto_638182 ) ) ( not ( = ?auto_638178 ?auto_638179 ) ) ( not ( = ?auto_638178 ?auto_638180 ) ) ( not ( = ?auto_638178 ?auto_638181 ) ) ( not ( = ?auto_638178 ?auto_638182 ) ) ( not ( = ?auto_638179 ?auto_638180 ) ) ( not ( = ?auto_638179 ?auto_638181 ) ) ( not ( = ?auto_638179 ?auto_638182 ) ) ( not ( = ?auto_638180 ?auto_638181 ) ) ( not ( = ?auto_638180 ?auto_638182 ) ) ( not ( = ?auto_638181 ?auto_638182 ) ) ( ON ?auto_638180 ?auto_638181 ) ( ON ?auto_638179 ?auto_638180 ) ( ON ?auto_638178 ?auto_638179 ) ( CLEAR ?auto_638176 ) ( ON ?auto_638177 ?auto_638178 ) ( CLEAR ?auto_638177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_638169 ?auto_638170 ?auto_638171 ?auto_638172 ?auto_638173 ?auto_638174 ?auto_638175 ?auto_638176 ?auto_638177 )
      ( MAKE-13PILE ?auto_638169 ?auto_638170 ?auto_638171 ?auto_638172 ?auto_638173 ?auto_638174 ?auto_638175 ?auto_638176 ?auto_638177 ?auto_638178 ?auto_638179 ?auto_638180 ?auto_638181 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_638223 - BLOCK
      ?auto_638224 - BLOCK
      ?auto_638225 - BLOCK
      ?auto_638226 - BLOCK
      ?auto_638227 - BLOCK
      ?auto_638228 - BLOCK
      ?auto_638229 - BLOCK
      ?auto_638230 - BLOCK
      ?auto_638231 - BLOCK
      ?auto_638232 - BLOCK
      ?auto_638233 - BLOCK
      ?auto_638234 - BLOCK
      ?auto_638235 - BLOCK
    )
    :vars
    (
      ?auto_638236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_638235 ?auto_638236 ) ( ON-TABLE ?auto_638223 ) ( ON ?auto_638224 ?auto_638223 ) ( ON ?auto_638225 ?auto_638224 ) ( ON ?auto_638226 ?auto_638225 ) ( ON ?auto_638227 ?auto_638226 ) ( ON ?auto_638228 ?auto_638227 ) ( ON ?auto_638229 ?auto_638228 ) ( not ( = ?auto_638223 ?auto_638224 ) ) ( not ( = ?auto_638223 ?auto_638225 ) ) ( not ( = ?auto_638223 ?auto_638226 ) ) ( not ( = ?auto_638223 ?auto_638227 ) ) ( not ( = ?auto_638223 ?auto_638228 ) ) ( not ( = ?auto_638223 ?auto_638229 ) ) ( not ( = ?auto_638223 ?auto_638230 ) ) ( not ( = ?auto_638223 ?auto_638231 ) ) ( not ( = ?auto_638223 ?auto_638232 ) ) ( not ( = ?auto_638223 ?auto_638233 ) ) ( not ( = ?auto_638223 ?auto_638234 ) ) ( not ( = ?auto_638223 ?auto_638235 ) ) ( not ( = ?auto_638223 ?auto_638236 ) ) ( not ( = ?auto_638224 ?auto_638225 ) ) ( not ( = ?auto_638224 ?auto_638226 ) ) ( not ( = ?auto_638224 ?auto_638227 ) ) ( not ( = ?auto_638224 ?auto_638228 ) ) ( not ( = ?auto_638224 ?auto_638229 ) ) ( not ( = ?auto_638224 ?auto_638230 ) ) ( not ( = ?auto_638224 ?auto_638231 ) ) ( not ( = ?auto_638224 ?auto_638232 ) ) ( not ( = ?auto_638224 ?auto_638233 ) ) ( not ( = ?auto_638224 ?auto_638234 ) ) ( not ( = ?auto_638224 ?auto_638235 ) ) ( not ( = ?auto_638224 ?auto_638236 ) ) ( not ( = ?auto_638225 ?auto_638226 ) ) ( not ( = ?auto_638225 ?auto_638227 ) ) ( not ( = ?auto_638225 ?auto_638228 ) ) ( not ( = ?auto_638225 ?auto_638229 ) ) ( not ( = ?auto_638225 ?auto_638230 ) ) ( not ( = ?auto_638225 ?auto_638231 ) ) ( not ( = ?auto_638225 ?auto_638232 ) ) ( not ( = ?auto_638225 ?auto_638233 ) ) ( not ( = ?auto_638225 ?auto_638234 ) ) ( not ( = ?auto_638225 ?auto_638235 ) ) ( not ( = ?auto_638225 ?auto_638236 ) ) ( not ( = ?auto_638226 ?auto_638227 ) ) ( not ( = ?auto_638226 ?auto_638228 ) ) ( not ( = ?auto_638226 ?auto_638229 ) ) ( not ( = ?auto_638226 ?auto_638230 ) ) ( not ( = ?auto_638226 ?auto_638231 ) ) ( not ( = ?auto_638226 ?auto_638232 ) ) ( not ( = ?auto_638226 ?auto_638233 ) ) ( not ( = ?auto_638226 ?auto_638234 ) ) ( not ( = ?auto_638226 ?auto_638235 ) ) ( not ( = ?auto_638226 ?auto_638236 ) ) ( not ( = ?auto_638227 ?auto_638228 ) ) ( not ( = ?auto_638227 ?auto_638229 ) ) ( not ( = ?auto_638227 ?auto_638230 ) ) ( not ( = ?auto_638227 ?auto_638231 ) ) ( not ( = ?auto_638227 ?auto_638232 ) ) ( not ( = ?auto_638227 ?auto_638233 ) ) ( not ( = ?auto_638227 ?auto_638234 ) ) ( not ( = ?auto_638227 ?auto_638235 ) ) ( not ( = ?auto_638227 ?auto_638236 ) ) ( not ( = ?auto_638228 ?auto_638229 ) ) ( not ( = ?auto_638228 ?auto_638230 ) ) ( not ( = ?auto_638228 ?auto_638231 ) ) ( not ( = ?auto_638228 ?auto_638232 ) ) ( not ( = ?auto_638228 ?auto_638233 ) ) ( not ( = ?auto_638228 ?auto_638234 ) ) ( not ( = ?auto_638228 ?auto_638235 ) ) ( not ( = ?auto_638228 ?auto_638236 ) ) ( not ( = ?auto_638229 ?auto_638230 ) ) ( not ( = ?auto_638229 ?auto_638231 ) ) ( not ( = ?auto_638229 ?auto_638232 ) ) ( not ( = ?auto_638229 ?auto_638233 ) ) ( not ( = ?auto_638229 ?auto_638234 ) ) ( not ( = ?auto_638229 ?auto_638235 ) ) ( not ( = ?auto_638229 ?auto_638236 ) ) ( not ( = ?auto_638230 ?auto_638231 ) ) ( not ( = ?auto_638230 ?auto_638232 ) ) ( not ( = ?auto_638230 ?auto_638233 ) ) ( not ( = ?auto_638230 ?auto_638234 ) ) ( not ( = ?auto_638230 ?auto_638235 ) ) ( not ( = ?auto_638230 ?auto_638236 ) ) ( not ( = ?auto_638231 ?auto_638232 ) ) ( not ( = ?auto_638231 ?auto_638233 ) ) ( not ( = ?auto_638231 ?auto_638234 ) ) ( not ( = ?auto_638231 ?auto_638235 ) ) ( not ( = ?auto_638231 ?auto_638236 ) ) ( not ( = ?auto_638232 ?auto_638233 ) ) ( not ( = ?auto_638232 ?auto_638234 ) ) ( not ( = ?auto_638232 ?auto_638235 ) ) ( not ( = ?auto_638232 ?auto_638236 ) ) ( not ( = ?auto_638233 ?auto_638234 ) ) ( not ( = ?auto_638233 ?auto_638235 ) ) ( not ( = ?auto_638233 ?auto_638236 ) ) ( not ( = ?auto_638234 ?auto_638235 ) ) ( not ( = ?auto_638234 ?auto_638236 ) ) ( not ( = ?auto_638235 ?auto_638236 ) ) ( ON ?auto_638234 ?auto_638235 ) ( ON ?auto_638233 ?auto_638234 ) ( ON ?auto_638232 ?auto_638233 ) ( ON ?auto_638231 ?auto_638232 ) ( CLEAR ?auto_638229 ) ( ON ?auto_638230 ?auto_638231 ) ( CLEAR ?auto_638230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_638223 ?auto_638224 ?auto_638225 ?auto_638226 ?auto_638227 ?auto_638228 ?auto_638229 ?auto_638230 )
      ( MAKE-13PILE ?auto_638223 ?auto_638224 ?auto_638225 ?auto_638226 ?auto_638227 ?auto_638228 ?auto_638229 ?auto_638230 ?auto_638231 ?auto_638232 ?auto_638233 ?auto_638234 ?auto_638235 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_638277 - BLOCK
      ?auto_638278 - BLOCK
      ?auto_638279 - BLOCK
      ?auto_638280 - BLOCK
      ?auto_638281 - BLOCK
      ?auto_638282 - BLOCK
      ?auto_638283 - BLOCK
      ?auto_638284 - BLOCK
      ?auto_638285 - BLOCK
      ?auto_638286 - BLOCK
      ?auto_638287 - BLOCK
      ?auto_638288 - BLOCK
      ?auto_638289 - BLOCK
    )
    :vars
    (
      ?auto_638290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_638289 ?auto_638290 ) ( ON-TABLE ?auto_638277 ) ( ON ?auto_638278 ?auto_638277 ) ( ON ?auto_638279 ?auto_638278 ) ( ON ?auto_638280 ?auto_638279 ) ( ON ?auto_638281 ?auto_638280 ) ( ON ?auto_638282 ?auto_638281 ) ( not ( = ?auto_638277 ?auto_638278 ) ) ( not ( = ?auto_638277 ?auto_638279 ) ) ( not ( = ?auto_638277 ?auto_638280 ) ) ( not ( = ?auto_638277 ?auto_638281 ) ) ( not ( = ?auto_638277 ?auto_638282 ) ) ( not ( = ?auto_638277 ?auto_638283 ) ) ( not ( = ?auto_638277 ?auto_638284 ) ) ( not ( = ?auto_638277 ?auto_638285 ) ) ( not ( = ?auto_638277 ?auto_638286 ) ) ( not ( = ?auto_638277 ?auto_638287 ) ) ( not ( = ?auto_638277 ?auto_638288 ) ) ( not ( = ?auto_638277 ?auto_638289 ) ) ( not ( = ?auto_638277 ?auto_638290 ) ) ( not ( = ?auto_638278 ?auto_638279 ) ) ( not ( = ?auto_638278 ?auto_638280 ) ) ( not ( = ?auto_638278 ?auto_638281 ) ) ( not ( = ?auto_638278 ?auto_638282 ) ) ( not ( = ?auto_638278 ?auto_638283 ) ) ( not ( = ?auto_638278 ?auto_638284 ) ) ( not ( = ?auto_638278 ?auto_638285 ) ) ( not ( = ?auto_638278 ?auto_638286 ) ) ( not ( = ?auto_638278 ?auto_638287 ) ) ( not ( = ?auto_638278 ?auto_638288 ) ) ( not ( = ?auto_638278 ?auto_638289 ) ) ( not ( = ?auto_638278 ?auto_638290 ) ) ( not ( = ?auto_638279 ?auto_638280 ) ) ( not ( = ?auto_638279 ?auto_638281 ) ) ( not ( = ?auto_638279 ?auto_638282 ) ) ( not ( = ?auto_638279 ?auto_638283 ) ) ( not ( = ?auto_638279 ?auto_638284 ) ) ( not ( = ?auto_638279 ?auto_638285 ) ) ( not ( = ?auto_638279 ?auto_638286 ) ) ( not ( = ?auto_638279 ?auto_638287 ) ) ( not ( = ?auto_638279 ?auto_638288 ) ) ( not ( = ?auto_638279 ?auto_638289 ) ) ( not ( = ?auto_638279 ?auto_638290 ) ) ( not ( = ?auto_638280 ?auto_638281 ) ) ( not ( = ?auto_638280 ?auto_638282 ) ) ( not ( = ?auto_638280 ?auto_638283 ) ) ( not ( = ?auto_638280 ?auto_638284 ) ) ( not ( = ?auto_638280 ?auto_638285 ) ) ( not ( = ?auto_638280 ?auto_638286 ) ) ( not ( = ?auto_638280 ?auto_638287 ) ) ( not ( = ?auto_638280 ?auto_638288 ) ) ( not ( = ?auto_638280 ?auto_638289 ) ) ( not ( = ?auto_638280 ?auto_638290 ) ) ( not ( = ?auto_638281 ?auto_638282 ) ) ( not ( = ?auto_638281 ?auto_638283 ) ) ( not ( = ?auto_638281 ?auto_638284 ) ) ( not ( = ?auto_638281 ?auto_638285 ) ) ( not ( = ?auto_638281 ?auto_638286 ) ) ( not ( = ?auto_638281 ?auto_638287 ) ) ( not ( = ?auto_638281 ?auto_638288 ) ) ( not ( = ?auto_638281 ?auto_638289 ) ) ( not ( = ?auto_638281 ?auto_638290 ) ) ( not ( = ?auto_638282 ?auto_638283 ) ) ( not ( = ?auto_638282 ?auto_638284 ) ) ( not ( = ?auto_638282 ?auto_638285 ) ) ( not ( = ?auto_638282 ?auto_638286 ) ) ( not ( = ?auto_638282 ?auto_638287 ) ) ( not ( = ?auto_638282 ?auto_638288 ) ) ( not ( = ?auto_638282 ?auto_638289 ) ) ( not ( = ?auto_638282 ?auto_638290 ) ) ( not ( = ?auto_638283 ?auto_638284 ) ) ( not ( = ?auto_638283 ?auto_638285 ) ) ( not ( = ?auto_638283 ?auto_638286 ) ) ( not ( = ?auto_638283 ?auto_638287 ) ) ( not ( = ?auto_638283 ?auto_638288 ) ) ( not ( = ?auto_638283 ?auto_638289 ) ) ( not ( = ?auto_638283 ?auto_638290 ) ) ( not ( = ?auto_638284 ?auto_638285 ) ) ( not ( = ?auto_638284 ?auto_638286 ) ) ( not ( = ?auto_638284 ?auto_638287 ) ) ( not ( = ?auto_638284 ?auto_638288 ) ) ( not ( = ?auto_638284 ?auto_638289 ) ) ( not ( = ?auto_638284 ?auto_638290 ) ) ( not ( = ?auto_638285 ?auto_638286 ) ) ( not ( = ?auto_638285 ?auto_638287 ) ) ( not ( = ?auto_638285 ?auto_638288 ) ) ( not ( = ?auto_638285 ?auto_638289 ) ) ( not ( = ?auto_638285 ?auto_638290 ) ) ( not ( = ?auto_638286 ?auto_638287 ) ) ( not ( = ?auto_638286 ?auto_638288 ) ) ( not ( = ?auto_638286 ?auto_638289 ) ) ( not ( = ?auto_638286 ?auto_638290 ) ) ( not ( = ?auto_638287 ?auto_638288 ) ) ( not ( = ?auto_638287 ?auto_638289 ) ) ( not ( = ?auto_638287 ?auto_638290 ) ) ( not ( = ?auto_638288 ?auto_638289 ) ) ( not ( = ?auto_638288 ?auto_638290 ) ) ( not ( = ?auto_638289 ?auto_638290 ) ) ( ON ?auto_638288 ?auto_638289 ) ( ON ?auto_638287 ?auto_638288 ) ( ON ?auto_638286 ?auto_638287 ) ( ON ?auto_638285 ?auto_638286 ) ( ON ?auto_638284 ?auto_638285 ) ( CLEAR ?auto_638282 ) ( ON ?auto_638283 ?auto_638284 ) ( CLEAR ?auto_638283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_638277 ?auto_638278 ?auto_638279 ?auto_638280 ?auto_638281 ?auto_638282 ?auto_638283 )
      ( MAKE-13PILE ?auto_638277 ?auto_638278 ?auto_638279 ?auto_638280 ?auto_638281 ?auto_638282 ?auto_638283 ?auto_638284 ?auto_638285 ?auto_638286 ?auto_638287 ?auto_638288 ?auto_638289 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_638331 - BLOCK
      ?auto_638332 - BLOCK
      ?auto_638333 - BLOCK
      ?auto_638334 - BLOCK
      ?auto_638335 - BLOCK
      ?auto_638336 - BLOCK
      ?auto_638337 - BLOCK
      ?auto_638338 - BLOCK
      ?auto_638339 - BLOCK
      ?auto_638340 - BLOCK
      ?auto_638341 - BLOCK
      ?auto_638342 - BLOCK
      ?auto_638343 - BLOCK
    )
    :vars
    (
      ?auto_638344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_638343 ?auto_638344 ) ( ON-TABLE ?auto_638331 ) ( ON ?auto_638332 ?auto_638331 ) ( ON ?auto_638333 ?auto_638332 ) ( ON ?auto_638334 ?auto_638333 ) ( ON ?auto_638335 ?auto_638334 ) ( not ( = ?auto_638331 ?auto_638332 ) ) ( not ( = ?auto_638331 ?auto_638333 ) ) ( not ( = ?auto_638331 ?auto_638334 ) ) ( not ( = ?auto_638331 ?auto_638335 ) ) ( not ( = ?auto_638331 ?auto_638336 ) ) ( not ( = ?auto_638331 ?auto_638337 ) ) ( not ( = ?auto_638331 ?auto_638338 ) ) ( not ( = ?auto_638331 ?auto_638339 ) ) ( not ( = ?auto_638331 ?auto_638340 ) ) ( not ( = ?auto_638331 ?auto_638341 ) ) ( not ( = ?auto_638331 ?auto_638342 ) ) ( not ( = ?auto_638331 ?auto_638343 ) ) ( not ( = ?auto_638331 ?auto_638344 ) ) ( not ( = ?auto_638332 ?auto_638333 ) ) ( not ( = ?auto_638332 ?auto_638334 ) ) ( not ( = ?auto_638332 ?auto_638335 ) ) ( not ( = ?auto_638332 ?auto_638336 ) ) ( not ( = ?auto_638332 ?auto_638337 ) ) ( not ( = ?auto_638332 ?auto_638338 ) ) ( not ( = ?auto_638332 ?auto_638339 ) ) ( not ( = ?auto_638332 ?auto_638340 ) ) ( not ( = ?auto_638332 ?auto_638341 ) ) ( not ( = ?auto_638332 ?auto_638342 ) ) ( not ( = ?auto_638332 ?auto_638343 ) ) ( not ( = ?auto_638332 ?auto_638344 ) ) ( not ( = ?auto_638333 ?auto_638334 ) ) ( not ( = ?auto_638333 ?auto_638335 ) ) ( not ( = ?auto_638333 ?auto_638336 ) ) ( not ( = ?auto_638333 ?auto_638337 ) ) ( not ( = ?auto_638333 ?auto_638338 ) ) ( not ( = ?auto_638333 ?auto_638339 ) ) ( not ( = ?auto_638333 ?auto_638340 ) ) ( not ( = ?auto_638333 ?auto_638341 ) ) ( not ( = ?auto_638333 ?auto_638342 ) ) ( not ( = ?auto_638333 ?auto_638343 ) ) ( not ( = ?auto_638333 ?auto_638344 ) ) ( not ( = ?auto_638334 ?auto_638335 ) ) ( not ( = ?auto_638334 ?auto_638336 ) ) ( not ( = ?auto_638334 ?auto_638337 ) ) ( not ( = ?auto_638334 ?auto_638338 ) ) ( not ( = ?auto_638334 ?auto_638339 ) ) ( not ( = ?auto_638334 ?auto_638340 ) ) ( not ( = ?auto_638334 ?auto_638341 ) ) ( not ( = ?auto_638334 ?auto_638342 ) ) ( not ( = ?auto_638334 ?auto_638343 ) ) ( not ( = ?auto_638334 ?auto_638344 ) ) ( not ( = ?auto_638335 ?auto_638336 ) ) ( not ( = ?auto_638335 ?auto_638337 ) ) ( not ( = ?auto_638335 ?auto_638338 ) ) ( not ( = ?auto_638335 ?auto_638339 ) ) ( not ( = ?auto_638335 ?auto_638340 ) ) ( not ( = ?auto_638335 ?auto_638341 ) ) ( not ( = ?auto_638335 ?auto_638342 ) ) ( not ( = ?auto_638335 ?auto_638343 ) ) ( not ( = ?auto_638335 ?auto_638344 ) ) ( not ( = ?auto_638336 ?auto_638337 ) ) ( not ( = ?auto_638336 ?auto_638338 ) ) ( not ( = ?auto_638336 ?auto_638339 ) ) ( not ( = ?auto_638336 ?auto_638340 ) ) ( not ( = ?auto_638336 ?auto_638341 ) ) ( not ( = ?auto_638336 ?auto_638342 ) ) ( not ( = ?auto_638336 ?auto_638343 ) ) ( not ( = ?auto_638336 ?auto_638344 ) ) ( not ( = ?auto_638337 ?auto_638338 ) ) ( not ( = ?auto_638337 ?auto_638339 ) ) ( not ( = ?auto_638337 ?auto_638340 ) ) ( not ( = ?auto_638337 ?auto_638341 ) ) ( not ( = ?auto_638337 ?auto_638342 ) ) ( not ( = ?auto_638337 ?auto_638343 ) ) ( not ( = ?auto_638337 ?auto_638344 ) ) ( not ( = ?auto_638338 ?auto_638339 ) ) ( not ( = ?auto_638338 ?auto_638340 ) ) ( not ( = ?auto_638338 ?auto_638341 ) ) ( not ( = ?auto_638338 ?auto_638342 ) ) ( not ( = ?auto_638338 ?auto_638343 ) ) ( not ( = ?auto_638338 ?auto_638344 ) ) ( not ( = ?auto_638339 ?auto_638340 ) ) ( not ( = ?auto_638339 ?auto_638341 ) ) ( not ( = ?auto_638339 ?auto_638342 ) ) ( not ( = ?auto_638339 ?auto_638343 ) ) ( not ( = ?auto_638339 ?auto_638344 ) ) ( not ( = ?auto_638340 ?auto_638341 ) ) ( not ( = ?auto_638340 ?auto_638342 ) ) ( not ( = ?auto_638340 ?auto_638343 ) ) ( not ( = ?auto_638340 ?auto_638344 ) ) ( not ( = ?auto_638341 ?auto_638342 ) ) ( not ( = ?auto_638341 ?auto_638343 ) ) ( not ( = ?auto_638341 ?auto_638344 ) ) ( not ( = ?auto_638342 ?auto_638343 ) ) ( not ( = ?auto_638342 ?auto_638344 ) ) ( not ( = ?auto_638343 ?auto_638344 ) ) ( ON ?auto_638342 ?auto_638343 ) ( ON ?auto_638341 ?auto_638342 ) ( ON ?auto_638340 ?auto_638341 ) ( ON ?auto_638339 ?auto_638340 ) ( ON ?auto_638338 ?auto_638339 ) ( ON ?auto_638337 ?auto_638338 ) ( CLEAR ?auto_638335 ) ( ON ?auto_638336 ?auto_638337 ) ( CLEAR ?auto_638336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_638331 ?auto_638332 ?auto_638333 ?auto_638334 ?auto_638335 ?auto_638336 )
      ( MAKE-13PILE ?auto_638331 ?auto_638332 ?auto_638333 ?auto_638334 ?auto_638335 ?auto_638336 ?auto_638337 ?auto_638338 ?auto_638339 ?auto_638340 ?auto_638341 ?auto_638342 ?auto_638343 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_638385 - BLOCK
      ?auto_638386 - BLOCK
      ?auto_638387 - BLOCK
      ?auto_638388 - BLOCK
      ?auto_638389 - BLOCK
      ?auto_638390 - BLOCK
      ?auto_638391 - BLOCK
      ?auto_638392 - BLOCK
      ?auto_638393 - BLOCK
      ?auto_638394 - BLOCK
      ?auto_638395 - BLOCK
      ?auto_638396 - BLOCK
      ?auto_638397 - BLOCK
    )
    :vars
    (
      ?auto_638398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_638397 ?auto_638398 ) ( ON-TABLE ?auto_638385 ) ( ON ?auto_638386 ?auto_638385 ) ( ON ?auto_638387 ?auto_638386 ) ( ON ?auto_638388 ?auto_638387 ) ( not ( = ?auto_638385 ?auto_638386 ) ) ( not ( = ?auto_638385 ?auto_638387 ) ) ( not ( = ?auto_638385 ?auto_638388 ) ) ( not ( = ?auto_638385 ?auto_638389 ) ) ( not ( = ?auto_638385 ?auto_638390 ) ) ( not ( = ?auto_638385 ?auto_638391 ) ) ( not ( = ?auto_638385 ?auto_638392 ) ) ( not ( = ?auto_638385 ?auto_638393 ) ) ( not ( = ?auto_638385 ?auto_638394 ) ) ( not ( = ?auto_638385 ?auto_638395 ) ) ( not ( = ?auto_638385 ?auto_638396 ) ) ( not ( = ?auto_638385 ?auto_638397 ) ) ( not ( = ?auto_638385 ?auto_638398 ) ) ( not ( = ?auto_638386 ?auto_638387 ) ) ( not ( = ?auto_638386 ?auto_638388 ) ) ( not ( = ?auto_638386 ?auto_638389 ) ) ( not ( = ?auto_638386 ?auto_638390 ) ) ( not ( = ?auto_638386 ?auto_638391 ) ) ( not ( = ?auto_638386 ?auto_638392 ) ) ( not ( = ?auto_638386 ?auto_638393 ) ) ( not ( = ?auto_638386 ?auto_638394 ) ) ( not ( = ?auto_638386 ?auto_638395 ) ) ( not ( = ?auto_638386 ?auto_638396 ) ) ( not ( = ?auto_638386 ?auto_638397 ) ) ( not ( = ?auto_638386 ?auto_638398 ) ) ( not ( = ?auto_638387 ?auto_638388 ) ) ( not ( = ?auto_638387 ?auto_638389 ) ) ( not ( = ?auto_638387 ?auto_638390 ) ) ( not ( = ?auto_638387 ?auto_638391 ) ) ( not ( = ?auto_638387 ?auto_638392 ) ) ( not ( = ?auto_638387 ?auto_638393 ) ) ( not ( = ?auto_638387 ?auto_638394 ) ) ( not ( = ?auto_638387 ?auto_638395 ) ) ( not ( = ?auto_638387 ?auto_638396 ) ) ( not ( = ?auto_638387 ?auto_638397 ) ) ( not ( = ?auto_638387 ?auto_638398 ) ) ( not ( = ?auto_638388 ?auto_638389 ) ) ( not ( = ?auto_638388 ?auto_638390 ) ) ( not ( = ?auto_638388 ?auto_638391 ) ) ( not ( = ?auto_638388 ?auto_638392 ) ) ( not ( = ?auto_638388 ?auto_638393 ) ) ( not ( = ?auto_638388 ?auto_638394 ) ) ( not ( = ?auto_638388 ?auto_638395 ) ) ( not ( = ?auto_638388 ?auto_638396 ) ) ( not ( = ?auto_638388 ?auto_638397 ) ) ( not ( = ?auto_638388 ?auto_638398 ) ) ( not ( = ?auto_638389 ?auto_638390 ) ) ( not ( = ?auto_638389 ?auto_638391 ) ) ( not ( = ?auto_638389 ?auto_638392 ) ) ( not ( = ?auto_638389 ?auto_638393 ) ) ( not ( = ?auto_638389 ?auto_638394 ) ) ( not ( = ?auto_638389 ?auto_638395 ) ) ( not ( = ?auto_638389 ?auto_638396 ) ) ( not ( = ?auto_638389 ?auto_638397 ) ) ( not ( = ?auto_638389 ?auto_638398 ) ) ( not ( = ?auto_638390 ?auto_638391 ) ) ( not ( = ?auto_638390 ?auto_638392 ) ) ( not ( = ?auto_638390 ?auto_638393 ) ) ( not ( = ?auto_638390 ?auto_638394 ) ) ( not ( = ?auto_638390 ?auto_638395 ) ) ( not ( = ?auto_638390 ?auto_638396 ) ) ( not ( = ?auto_638390 ?auto_638397 ) ) ( not ( = ?auto_638390 ?auto_638398 ) ) ( not ( = ?auto_638391 ?auto_638392 ) ) ( not ( = ?auto_638391 ?auto_638393 ) ) ( not ( = ?auto_638391 ?auto_638394 ) ) ( not ( = ?auto_638391 ?auto_638395 ) ) ( not ( = ?auto_638391 ?auto_638396 ) ) ( not ( = ?auto_638391 ?auto_638397 ) ) ( not ( = ?auto_638391 ?auto_638398 ) ) ( not ( = ?auto_638392 ?auto_638393 ) ) ( not ( = ?auto_638392 ?auto_638394 ) ) ( not ( = ?auto_638392 ?auto_638395 ) ) ( not ( = ?auto_638392 ?auto_638396 ) ) ( not ( = ?auto_638392 ?auto_638397 ) ) ( not ( = ?auto_638392 ?auto_638398 ) ) ( not ( = ?auto_638393 ?auto_638394 ) ) ( not ( = ?auto_638393 ?auto_638395 ) ) ( not ( = ?auto_638393 ?auto_638396 ) ) ( not ( = ?auto_638393 ?auto_638397 ) ) ( not ( = ?auto_638393 ?auto_638398 ) ) ( not ( = ?auto_638394 ?auto_638395 ) ) ( not ( = ?auto_638394 ?auto_638396 ) ) ( not ( = ?auto_638394 ?auto_638397 ) ) ( not ( = ?auto_638394 ?auto_638398 ) ) ( not ( = ?auto_638395 ?auto_638396 ) ) ( not ( = ?auto_638395 ?auto_638397 ) ) ( not ( = ?auto_638395 ?auto_638398 ) ) ( not ( = ?auto_638396 ?auto_638397 ) ) ( not ( = ?auto_638396 ?auto_638398 ) ) ( not ( = ?auto_638397 ?auto_638398 ) ) ( ON ?auto_638396 ?auto_638397 ) ( ON ?auto_638395 ?auto_638396 ) ( ON ?auto_638394 ?auto_638395 ) ( ON ?auto_638393 ?auto_638394 ) ( ON ?auto_638392 ?auto_638393 ) ( ON ?auto_638391 ?auto_638392 ) ( ON ?auto_638390 ?auto_638391 ) ( CLEAR ?auto_638388 ) ( ON ?auto_638389 ?auto_638390 ) ( CLEAR ?auto_638389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_638385 ?auto_638386 ?auto_638387 ?auto_638388 ?auto_638389 )
      ( MAKE-13PILE ?auto_638385 ?auto_638386 ?auto_638387 ?auto_638388 ?auto_638389 ?auto_638390 ?auto_638391 ?auto_638392 ?auto_638393 ?auto_638394 ?auto_638395 ?auto_638396 ?auto_638397 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_638439 - BLOCK
      ?auto_638440 - BLOCK
      ?auto_638441 - BLOCK
      ?auto_638442 - BLOCK
      ?auto_638443 - BLOCK
      ?auto_638444 - BLOCK
      ?auto_638445 - BLOCK
      ?auto_638446 - BLOCK
      ?auto_638447 - BLOCK
      ?auto_638448 - BLOCK
      ?auto_638449 - BLOCK
      ?auto_638450 - BLOCK
      ?auto_638451 - BLOCK
    )
    :vars
    (
      ?auto_638452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_638451 ?auto_638452 ) ( ON-TABLE ?auto_638439 ) ( ON ?auto_638440 ?auto_638439 ) ( ON ?auto_638441 ?auto_638440 ) ( not ( = ?auto_638439 ?auto_638440 ) ) ( not ( = ?auto_638439 ?auto_638441 ) ) ( not ( = ?auto_638439 ?auto_638442 ) ) ( not ( = ?auto_638439 ?auto_638443 ) ) ( not ( = ?auto_638439 ?auto_638444 ) ) ( not ( = ?auto_638439 ?auto_638445 ) ) ( not ( = ?auto_638439 ?auto_638446 ) ) ( not ( = ?auto_638439 ?auto_638447 ) ) ( not ( = ?auto_638439 ?auto_638448 ) ) ( not ( = ?auto_638439 ?auto_638449 ) ) ( not ( = ?auto_638439 ?auto_638450 ) ) ( not ( = ?auto_638439 ?auto_638451 ) ) ( not ( = ?auto_638439 ?auto_638452 ) ) ( not ( = ?auto_638440 ?auto_638441 ) ) ( not ( = ?auto_638440 ?auto_638442 ) ) ( not ( = ?auto_638440 ?auto_638443 ) ) ( not ( = ?auto_638440 ?auto_638444 ) ) ( not ( = ?auto_638440 ?auto_638445 ) ) ( not ( = ?auto_638440 ?auto_638446 ) ) ( not ( = ?auto_638440 ?auto_638447 ) ) ( not ( = ?auto_638440 ?auto_638448 ) ) ( not ( = ?auto_638440 ?auto_638449 ) ) ( not ( = ?auto_638440 ?auto_638450 ) ) ( not ( = ?auto_638440 ?auto_638451 ) ) ( not ( = ?auto_638440 ?auto_638452 ) ) ( not ( = ?auto_638441 ?auto_638442 ) ) ( not ( = ?auto_638441 ?auto_638443 ) ) ( not ( = ?auto_638441 ?auto_638444 ) ) ( not ( = ?auto_638441 ?auto_638445 ) ) ( not ( = ?auto_638441 ?auto_638446 ) ) ( not ( = ?auto_638441 ?auto_638447 ) ) ( not ( = ?auto_638441 ?auto_638448 ) ) ( not ( = ?auto_638441 ?auto_638449 ) ) ( not ( = ?auto_638441 ?auto_638450 ) ) ( not ( = ?auto_638441 ?auto_638451 ) ) ( not ( = ?auto_638441 ?auto_638452 ) ) ( not ( = ?auto_638442 ?auto_638443 ) ) ( not ( = ?auto_638442 ?auto_638444 ) ) ( not ( = ?auto_638442 ?auto_638445 ) ) ( not ( = ?auto_638442 ?auto_638446 ) ) ( not ( = ?auto_638442 ?auto_638447 ) ) ( not ( = ?auto_638442 ?auto_638448 ) ) ( not ( = ?auto_638442 ?auto_638449 ) ) ( not ( = ?auto_638442 ?auto_638450 ) ) ( not ( = ?auto_638442 ?auto_638451 ) ) ( not ( = ?auto_638442 ?auto_638452 ) ) ( not ( = ?auto_638443 ?auto_638444 ) ) ( not ( = ?auto_638443 ?auto_638445 ) ) ( not ( = ?auto_638443 ?auto_638446 ) ) ( not ( = ?auto_638443 ?auto_638447 ) ) ( not ( = ?auto_638443 ?auto_638448 ) ) ( not ( = ?auto_638443 ?auto_638449 ) ) ( not ( = ?auto_638443 ?auto_638450 ) ) ( not ( = ?auto_638443 ?auto_638451 ) ) ( not ( = ?auto_638443 ?auto_638452 ) ) ( not ( = ?auto_638444 ?auto_638445 ) ) ( not ( = ?auto_638444 ?auto_638446 ) ) ( not ( = ?auto_638444 ?auto_638447 ) ) ( not ( = ?auto_638444 ?auto_638448 ) ) ( not ( = ?auto_638444 ?auto_638449 ) ) ( not ( = ?auto_638444 ?auto_638450 ) ) ( not ( = ?auto_638444 ?auto_638451 ) ) ( not ( = ?auto_638444 ?auto_638452 ) ) ( not ( = ?auto_638445 ?auto_638446 ) ) ( not ( = ?auto_638445 ?auto_638447 ) ) ( not ( = ?auto_638445 ?auto_638448 ) ) ( not ( = ?auto_638445 ?auto_638449 ) ) ( not ( = ?auto_638445 ?auto_638450 ) ) ( not ( = ?auto_638445 ?auto_638451 ) ) ( not ( = ?auto_638445 ?auto_638452 ) ) ( not ( = ?auto_638446 ?auto_638447 ) ) ( not ( = ?auto_638446 ?auto_638448 ) ) ( not ( = ?auto_638446 ?auto_638449 ) ) ( not ( = ?auto_638446 ?auto_638450 ) ) ( not ( = ?auto_638446 ?auto_638451 ) ) ( not ( = ?auto_638446 ?auto_638452 ) ) ( not ( = ?auto_638447 ?auto_638448 ) ) ( not ( = ?auto_638447 ?auto_638449 ) ) ( not ( = ?auto_638447 ?auto_638450 ) ) ( not ( = ?auto_638447 ?auto_638451 ) ) ( not ( = ?auto_638447 ?auto_638452 ) ) ( not ( = ?auto_638448 ?auto_638449 ) ) ( not ( = ?auto_638448 ?auto_638450 ) ) ( not ( = ?auto_638448 ?auto_638451 ) ) ( not ( = ?auto_638448 ?auto_638452 ) ) ( not ( = ?auto_638449 ?auto_638450 ) ) ( not ( = ?auto_638449 ?auto_638451 ) ) ( not ( = ?auto_638449 ?auto_638452 ) ) ( not ( = ?auto_638450 ?auto_638451 ) ) ( not ( = ?auto_638450 ?auto_638452 ) ) ( not ( = ?auto_638451 ?auto_638452 ) ) ( ON ?auto_638450 ?auto_638451 ) ( ON ?auto_638449 ?auto_638450 ) ( ON ?auto_638448 ?auto_638449 ) ( ON ?auto_638447 ?auto_638448 ) ( ON ?auto_638446 ?auto_638447 ) ( ON ?auto_638445 ?auto_638446 ) ( ON ?auto_638444 ?auto_638445 ) ( ON ?auto_638443 ?auto_638444 ) ( CLEAR ?auto_638441 ) ( ON ?auto_638442 ?auto_638443 ) ( CLEAR ?auto_638442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_638439 ?auto_638440 ?auto_638441 ?auto_638442 )
      ( MAKE-13PILE ?auto_638439 ?auto_638440 ?auto_638441 ?auto_638442 ?auto_638443 ?auto_638444 ?auto_638445 ?auto_638446 ?auto_638447 ?auto_638448 ?auto_638449 ?auto_638450 ?auto_638451 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_638493 - BLOCK
      ?auto_638494 - BLOCK
      ?auto_638495 - BLOCK
      ?auto_638496 - BLOCK
      ?auto_638497 - BLOCK
      ?auto_638498 - BLOCK
      ?auto_638499 - BLOCK
      ?auto_638500 - BLOCK
      ?auto_638501 - BLOCK
      ?auto_638502 - BLOCK
      ?auto_638503 - BLOCK
      ?auto_638504 - BLOCK
      ?auto_638505 - BLOCK
    )
    :vars
    (
      ?auto_638506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_638505 ?auto_638506 ) ( ON-TABLE ?auto_638493 ) ( ON ?auto_638494 ?auto_638493 ) ( not ( = ?auto_638493 ?auto_638494 ) ) ( not ( = ?auto_638493 ?auto_638495 ) ) ( not ( = ?auto_638493 ?auto_638496 ) ) ( not ( = ?auto_638493 ?auto_638497 ) ) ( not ( = ?auto_638493 ?auto_638498 ) ) ( not ( = ?auto_638493 ?auto_638499 ) ) ( not ( = ?auto_638493 ?auto_638500 ) ) ( not ( = ?auto_638493 ?auto_638501 ) ) ( not ( = ?auto_638493 ?auto_638502 ) ) ( not ( = ?auto_638493 ?auto_638503 ) ) ( not ( = ?auto_638493 ?auto_638504 ) ) ( not ( = ?auto_638493 ?auto_638505 ) ) ( not ( = ?auto_638493 ?auto_638506 ) ) ( not ( = ?auto_638494 ?auto_638495 ) ) ( not ( = ?auto_638494 ?auto_638496 ) ) ( not ( = ?auto_638494 ?auto_638497 ) ) ( not ( = ?auto_638494 ?auto_638498 ) ) ( not ( = ?auto_638494 ?auto_638499 ) ) ( not ( = ?auto_638494 ?auto_638500 ) ) ( not ( = ?auto_638494 ?auto_638501 ) ) ( not ( = ?auto_638494 ?auto_638502 ) ) ( not ( = ?auto_638494 ?auto_638503 ) ) ( not ( = ?auto_638494 ?auto_638504 ) ) ( not ( = ?auto_638494 ?auto_638505 ) ) ( not ( = ?auto_638494 ?auto_638506 ) ) ( not ( = ?auto_638495 ?auto_638496 ) ) ( not ( = ?auto_638495 ?auto_638497 ) ) ( not ( = ?auto_638495 ?auto_638498 ) ) ( not ( = ?auto_638495 ?auto_638499 ) ) ( not ( = ?auto_638495 ?auto_638500 ) ) ( not ( = ?auto_638495 ?auto_638501 ) ) ( not ( = ?auto_638495 ?auto_638502 ) ) ( not ( = ?auto_638495 ?auto_638503 ) ) ( not ( = ?auto_638495 ?auto_638504 ) ) ( not ( = ?auto_638495 ?auto_638505 ) ) ( not ( = ?auto_638495 ?auto_638506 ) ) ( not ( = ?auto_638496 ?auto_638497 ) ) ( not ( = ?auto_638496 ?auto_638498 ) ) ( not ( = ?auto_638496 ?auto_638499 ) ) ( not ( = ?auto_638496 ?auto_638500 ) ) ( not ( = ?auto_638496 ?auto_638501 ) ) ( not ( = ?auto_638496 ?auto_638502 ) ) ( not ( = ?auto_638496 ?auto_638503 ) ) ( not ( = ?auto_638496 ?auto_638504 ) ) ( not ( = ?auto_638496 ?auto_638505 ) ) ( not ( = ?auto_638496 ?auto_638506 ) ) ( not ( = ?auto_638497 ?auto_638498 ) ) ( not ( = ?auto_638497 ?auto_638499 ) ) ( not ( = ?auto_638497 ?auto_638500 ) ) ( not ( = ?auto_638497 ?auto_638501 ) ) ( not ( = ?auto_638497 ?auto_638502 ) ) ( not ( = ?auto_638497 ?auto_638503 ) ) ( not ( = ?auto_638497 ?auto_638504 ) ) ( not ( = ?auto_638497 ?auto_638505 ) ) ( not ( = ?auto_638497 ?auto_638506 ) ) ( not ( = ?auto_638498 ?auto_638499 ) ) ( not ( = ?auto_638498 ?auto_638500 ) ) ( not ( = ?auto_638498 ?auto_638501 ) ) ( not ( = ?auto_638498 ?auto_638502 ) ) ( not ( = ?auto_638498 ?auto_638503 ) ) ( not ( = ?auto_638498 ?auto_638504 ) ) ( not ( = ?auto_638498 ?auto_638505 ) ) ( not ( = ?auto_638498 ?auto_638506 ) ) ( not ( = ?auto_638499 ?auto_638500 ) ) ( not ( = ?auto_638499 ?auto_638501 ) ) ( not ( = ?auto_638499 ?auto_638502 ) ) ( not ( = ?auto_638499 ?auto_638503 ) ) ( not ( = ?auto_638499 ?auto_638504 ) ) ( not ( = ?auto_638499 ?auto_638505 ) ) ( not ( = ?auto_638499 ?auto_638506 ) ) ( not ( = ?auto_638500 ?auto_638501 ) ) ( not ( = ?auto_638500 ?auto_638502 ) ) ( not ( = ?auto_638500 ?auto_638503 ) ) ( not ( = ?auto_638500 ?auto_638504 ) ) ( not ( = ?auto_638500 ?auto_638505 ) ) ( not ( = ?auto_638500 ?auto_638506 ) ) ( not ( = ?auto_638501 ?auto_638502 ) ) ( not ( = ?auto_638501 ?auto_638503 ) ) ( not ( = ?auto_638501 ?auto_638504 ) ) ( not ( = ?auto_638501 ?auto_638505 ) ) ( not ( = ?auto_638501 ?auto_638506 ) ) ( not ( = ?auto_638502 ?auto_638503 ) ) ( not ( = ?auto_638502 ?auto_638504 ) ) ( not ( = ?auto_638502 ?auto_638505 ) ) ( not ( = ?auto_638502 ?auto_638506 ) ) ( not ( = ?auto_638503 ?auto_638504 ) ) ( not ( = ?auto_638503 ?auto_638505 ) ) ( not ( = ?auto_638503 ?auto_638506 ) ) ( not ( = ?auto_638504 ?auto_638505 ) ) ( not ( = ?auto_638504 ?auto_638506 ) ) ( not ( = ?auto_638505 ?auto_638506 ) ) ( ON ?auto_638504 ?auto_638505 ) ( ON ?auto_638503 ?auto_638504 ) ( ON ?auto_638502 ?auto_638503 ) ( ON ?auto_638501 ?auto_638502 ) ( ON ?auto_638500 ?auto_638501 ) ( ON ?auto_638499 ?auto_638500 ) ( ON ?auto_638498 ?auto_638499 ) ( ON ?auto_638497 ?auto_638498 ) ( ON ?auto_638496 ?auto_638497 ) ( CLEAR ?auto_638494 ) ( ON ?auto_638495 ?auto_638496 ) ( CLEAR ?auto_638495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_638493 ?auto_638494 ?auto_638495 )
      ( MAKE-13PILE ?auto_638493 ?auto_638494 ?auto_638495 ?auto_638496 ?auto_638497 ?auto_638498 ?auto_638499 ?auto_638500 ?auto_638501 ?auto_638502 ?auto_638503 ?auto_638504 ?auto_638505 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_638547 - BLOCK
      ?auto_638548 - BLOCK
      ?auto_638549 - BLOCK
      ?auto_638550 - BLOCK
      ?auto_638551 - BLOCK
      ?auto_638552 - BLOCK
      ?auto_638553 - BLOCK
      ?auto_638554 - BLOCK
      ?auto_638555 - BLOCK
      ?auto_638556 - BLOCK
      ?auto_638557 - BLOCK
      ?auto_638558 - BLOCK
      ?auto_638559 - BLOCK
    )
    :vars
    (
      ?auto_638560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_638559 ?auto_638560 ) ( ON-TABLE ?auto_638547 ) ( not ( = ?auto_638547 ?auto_638548 ) ) ( not ( = ?auto_638547 ?auto_638549 ) ) ( not ( = ?auto_638547 ?auto_638550 ) ) ( not ( = ?auto_638547 ?auto_638551 ) ) ( not ( = ?auto_638547 ?auto_638552 ) ) ( not ( = ?auto_638547 ?auto_638553 ) ) ( not ( = ?auto_638547 ?auto_638554 ) ) ( not ( = ?auto_638547 ?auto_638555 ) ) ( not ( = ?auto_638547 ?auto_638556 ) ) ( not ( = ?auto_638547 ?auto_638557 ) ) ( not ( = ?auto_638547 ?auto_638558 ) ) ( not ( = ?auto_638547 ?auto_638559 ) ) ( not ( = ?auto_638547 ?auto_638560 ) ) ( not ( = ?auto_638548 ?auto_638549 ) ) ( not ( = ?auto_638548 ?auto_638550 ) ) ( not ( = ?auto_638548 ?auto_638551 ) ) ( not ( = ?auto_638548 ?auto_638552 ) ) ( not ( = ?auto_638548 ?auto_638553 ) ) ( not ( = ?auto_638548 ?auto_638554 ) ) ( not ( = ?auto_638548 ?auto_638555 ) ) ( not ( = ?auto_638548 ?auto_638556 ) ) ( not ( = ?auto_638548 ?auto_638557 ) ) ( not ( = ?auto_638548 ?auto_638558 ) ) ( not ( = ?auto_638548 ?auto_638559 ) ) ( not ( = ?auto_638548 ?auto_638560 ) ) ( not ( = ?auto_638549 ?auto_638550 ) ) ( not ( = ?auto_638549 ?auto_638551 ) ) ( not ( = ?auto_638549 ?auto_638552 ) ) ( not ( = ?auto_638549 ?auto_638553 ) ) ( not ( = ?auto_638549 ?auto_638554 ) ) ( not ( = ?auto_638549 ?auto_638555 ) ) ( not ( = ?auto_638549 ?auto_638556 ) ) ( not ( = ?auto_638549 ?auto_638557 ) ) ( not ( = ?auto_638549 ?auto_638558 ) ) ( not ( = ?auto_638549 ?auto_638559 ) ) ( not ( = ?auto_638549 ?auto_638560 ) ) ( not ( = ?auto_638550 ?auto_638551 ) ) ( not ( = ?auto_638550 ?auto_638552 ) ) ( not ( = ?auto_638550 ?auto_638553 ) ) ( not ( = ?auto_638550 ?auto_638554 ) ) ( not ( = ?auto_638550 ?auto_638555 ) ) ( not ( = ?auto_638550 ?auto_638556 ) ) ( not ( = ?auto_638550 ?auto_638557 ) ) ( not ( = ?auto_638550 ?auto_638558 ) ) ( not ( = ?auto_638550 ?auto_638559 ) ) ( not ( = ?auto_638550 ?auto_638560 ) ) ( not ( = ?auto_638551 ?auto_638552 ) ) ( not ( = ?auto_638551 ?auto_638553 ) ) ( not ( = ?auto_638551 ?auto_638554 ) ) ( not ( = ?auto_638551 ?auto_638555 ) ) ( not ( = ?auto_638551 ?auto_638556 ) ) ( not ( = ?auto_638551 ?auto_638557 ) ) ( not ( = ?auto_638551 ?auto_638558 ) ) ( not ( = ?auto_638551 ?auto_638559 ) ) ( not ( = ?auto_638551 ?auto_638560 ) ) ( not ( = ?auto_638552 ?auto_638553 ) ) ( not ( = ?auto_638552 ?auto_638554 ) ) ( not ( = ?auto_638552 ?auto_638555 ) ) ( not ( = ?auto_638552 ?auto_638556 ) ) ( not ( = ?auto_638552 ?auto_638557 ) ) ( not ( = ?auto_638552 ?auto_638558 ) ) ( not ( = ?auto_638552 ?auto_638559 ) ) ( not ( = ?auto_638552 ?auto_638560 ) ) ( not ( = ?auto_638553 ?auto_638554 ) ) ( not ( = ?auto_638553 ?auto_638555 ) ) ( not ( = ?auto_638553 ?auto_638556 ) ) ( not ( = ?auto_638553 ?auto_638557 ) ) ( not ( = ?auto_638553 ?auto_638558 ) ) ( not ( = ?auto_638553 ?auto_638559 ) ) ( not ( = ?auto_638553 ?auto_638560 ) ) ( not ( = ?auto_638554 ?auto_638555 ) ) ( not ( = ?auto_638554 ?auto_638556 ) ) ( not ( = ?auto_638554 ?auto_638557 ) ) ( not ( = ?auto_638554 ?auto_638558 ) ) ( not ( = ?auto_638554 ?auto_638559 ) ) ( not ( = ?auto_638554 ?auto_638560 ) ) ( not ( = ?auto_638555 ?auto_638556 ) ) ( not ( = ?auto_638555 ?auto_638557 ) ) ( not ( = ?auto_638555 ?auto_638558 ) ) ( not ( = ?auto_638555 ?auto_638559 ) ) ( not ( = ?auto_638555 ?auto_638560 ) ) ( not ( = ?auto_638556 ?auto_638557 ) ) ( not ( = ?auto_638556 ?auto_638558 ) ) ( not ( = ?auto_638556 ?auto_638559 ) ) ( not ( = ?auto_638556 ?auto_638560 ) ) ( not ( = ?auto_638557 ?auto_638558 ) ) ( not ( = ?auto_638557 ?auto_638559 ) ) ( not ( = ?auto_638557 ?auto_638560 ) ) ( not ( = ?auto_638558 ?auto_638559 ) ) ( not ( = ?auto_638558 ?auto_638560 ) ) ( not ( = ?auto_638559 ?auto_638560 ) ) ( ON ?auto_638558 ?auto_638559 ) ( ON ?auto_638557 ?auto_638558 ) ( ON ?auto_638556 ?auto_638557 ) ( ON ?auto_638555 ?auto_638556 ) ( ON ?auto_638554 ?auto_638555 ) ( ON ?auto_638553 ?auto_638554 ) ( ON ?auto_638552 ?auto_638553 ) ( ON ?auto_638551 ?auto_638552 ) ( ON ?auto_638550 ?auto_638551 ) ( ON ?auto_638549 ?auto_638550 ) ( CLEAR ?auto_638547 ) ( ON ?auto_638548 ?auto_638549 ) ( CLEAR ?auto_638548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_638547 ?auto_638548 )
      ( MAKE-13PILE ?auto_638547 ?auto_638548 ?auto_638549 ?auto_638550 ?auto_638551 ?auto_638552 ?auto_638553 ?auto_638554 ?auto_638555 ?auto_638556 ?auto_638557 ?auto_638558 ?auto_638559 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_638601 - BLOCK
      ?auto_638602 - BLOCK
      ?auto_638603 - BLOCK
      ?auto_638604 - BLOCK
      ?auto_638605 - BLOCK
      ?auto_638606 - BLOCK
      ?auto_638607 - BLOCK
      ?auto_638608 - BLOCK
      ?auto_638609 - BLOCK
      ?auto_638610 - BLOCK
      ?auto_638611 - BLOCK
      ?auto_638612 - BLOCK
      ?auto_638613 - BLOCK
    )
    :vars
    (
      ?auto_638614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_638613 ?auto_638614 ) ( not ( = ?auto_638601 ?auto_638602 ) ) ( not ( = ?auto_638601 ?auto_638603 ) ) ( not ( = ?auto_638601 ?auto_638604 ) ) ( not ( = ?auto_638601 ?auto_638605 ) ) ( not ( = ?auto_638601 ?auto_638606 ) ) ( not ( = ?auto_638601 ?auto_638607 ) ) ( not ( = ?auto_638601 ?auto_638608 ) ) ( not ( = ?auto_638601 ?auto_638609 ) ) ( not ( = ?auto_638601 ?auto_638610 ) ) ( not ( = ?auto_638601 ?auto_638611 ) ) ( not ( = ?auto_638601 ?auto_638612 ) ) ( not ( = ?auto_638601 ?auto_638613 ) ) ( not ( = ?auto_638601 ?auto_638614 ) ) ( not ( = ?auto_638602 ?auto_638603 ) ) ( not ( = ?auto_638602 ?auto_638604 ) ) ( not ( = ?auto_638602 ?auto_638605 ) ) ( not ( = ?auto_638602 ?auto_638606 ) ) ( not ( = ?auto_638602 ?auto_638607 ) ) ( not ( = ?auto_638602 ?auto_638608 ) ) ( not ( = ?auto_638602 ?auto_638609 ) ) ( not ( = ?auto_638602 ?auto_638610 ) ) ( not ( = ?auto_638602 ?auto_638611 ) ) ( not ( = ?auto_638602 ?auto_638612 ) ) ( not ( = ?auto_638602 ?auto_638613 ) ) ( not ( = ?auto_638602 ?auto_638614 ) ) ( not ( = ?auto_638603 ?auto_638604 ) ) ( not ( = ?auto_638603 ?auto_638605 ) ) ( not ( = ?auto_638603 ?auto_638606 ) ) ( not ( = ?auto_638603 ?auto_638607 ) ) ( not ( = ?auto_638603 ?auto_638608 ) ) ( not ( = ?auto_638603 ?auto_638609 ) ) ( not ( = ?auto_638603 ?auto_638610 ) ) ( not ( = ?auto_638603 ?auto_638611 ) ) ( not ( = ?auto_638603 ?auto_638612 ) ) ( not ( = ?auto_638603 ?auto_638613 ) ) ( not ( = ?auto_638603 ?auto_638614 ) ) ( not ( = ?auto_638604 ?auto_638605 ) ) ( not ( = ?auto_638604 ?auto_638606 ) ) ( not ( = ?auto_638604 ?auto_638607 ) ) ( not ( = ?auto_638604 ?auto_638608 ) ) ( not ( = ?auto_638604 ?auto_638609 ) ) ( not ( = ?auto_638604 ?auto_638610 ) ) ( not ( = ?auto_638604 ?auto_638611 ) ) ( not ( = ?auto_638604 ?auto_638612 ) ) ( not ( = ?auto_638604 ?auto_638613 ) ) ( not ( = ?auto_638604 ?auto_638614 ) ) ( not ( = ?auto_638605 ?auto_638606 ) ) ( not ( = ?auto_638605 ?auto_638607 ) ) ( not ( = ?auto_638605 ?auto_638608 ) ) ( not ( = ?auto_638605 ?auto_638609 ) ) ( not ( = ?auto_638605 ?auto_638610 ) ) ( not ( = ?auto_638605 ?auto_638611 ) ) ( not ( = ?auto_638605 ?auto_638612 ) ) ( not ( = ?auto_638605 ?auto_638613 ) ) ( not ( = ?auto_638605 ?auto_638614 ) ) ( not ( = ?auto_638606 ?auto_638607 ) ) ( not ( = ?auto_638606 ?auto_638608 ) ) ( not ( = ?auto_638606 ?auto_638609 ) ) ( not ( = ?auto_638606 ?auto_638610 ) ) ( not ( = ?auto_638606 ?auto_638611 ) ) ( not ( = ?auto_638606 ?auto_638612 ) ) ( not ( = ?auto_638606 ?auto_638613 ) ) ( not ( = ?auto_638606 ?auto_638614 ) ) ( not ( = ?auto_638607 ?auto_638608 ) ) ( not ( = ?auto_638607 ?auto_638609 ) ) ( not ( = ?auto_638607 ?auto_638610 ) ) ( not ( = ?auto_638607 ?auto_638611 ) ) ( not ( = ?auto_638607 ?auto_638612 ) ) ( not ( = ?auto_638607 ?auto_638613 ) ) ( not ( = ?auto_638607 ?auto_638614 ) ) ( not ( = ?auto_638608 ?auto_638609 ) ) ( not ( = ?auto_638608 ?auto_638610 ) ) ( not ( = ?auto_638608 ?auto_638611 ) ) ( not ( = ?auto_638608 ?auto_638612 ) ) ( not ( = ?auto_638608 ?auto_638613 ) ) ( not ( = ?auto_638608 ?auto_638614 ) ) ( not ( = ?auto_638609 ?auto_638610 ) ) ( not ( = ?auto_638609 ?auto_638611 ) ) ( not ( = ?auto_638609 ?auto_638612 ) ) ( not ( = ?auto_638609 ?auto_638613 ) ) ( not ( = ?auto_638609 ?auto_638614 ) ) ( not ( = ?auto_638610 ?auto_638611 ) ) ( not ( = ?auto_638610 ?auto_638612 ) ) ( not ( = ?auto_638610 ?auto_638613 ) ) ( not ( = ?auto_638610 ?auto_638614 ) ) ( not ( = ?auto_638611 ?auto_638612 ) ) ( not ( = ?auto_638611 ?auto_638613 ) ) ( not ( = ?auto_638611 ?auto_638614 ) ) ( not ( = ?auto_638612 ?auto_638613 ) ) ( not ( = ?auto_638612 ?auto_638614 ) ) ( not ( = ?auto_638613 ?auto_638614 ) ) ( ON ?auto_638612 ?auto_638613 ) ( ON ?auto_638611 ?auto_638612 ) ( ON ?auto_638610 ?auto_638611 ) ( ON ?auto_638609 ?auto_638610 ) ( ON ?auto_638608 ?auto_638609 ) ( ON ?auto_638607 ?auto_638608 ) ( ON ?auto_638606 ?auto_638607 ) ( ON ?auto_638605 ?auto_638606 ) ( ON ?auto_638604 ?auto_638605 ) ( ON ?auto_638603 ?auto_638604 ) ( ON ?auto_638602 ?auto_638603 ) ( ON ?auto_638601 ?auto_638602 ) ( CLEAR ?auto_638601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_638601 )
      ( MAKE-13PILE ?auto_638601 ?auto_638602 ?auto_638603 ?auto_638604 ?auto_638605 ?auto_638606 ?auto_638607 ?auto_638608 ?auto_638609 ?auto_638610 ?auto_638611 ?auto_638612 ?auto_638613 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_638656 - BLOCK
      ?auto_638657 - BLOCK
      ?auto_638658 - BLOCK
      ?auto_638659 - BLOCK
      ?auto_638660 - BLOCK
      ?auto_638661 - BLOCK
      ?auto_638662 - BLOCK
      ?auto_638663 - BLOCK
      ?auto_638664 - BLOCK
      ?auto_638665 - BLOCK
      ?auto_638666 - BLOCK
      ?auto_638667 - BLOCK
      ?auto_638668 - BLOCK
      ?auto_638669 - BLOCK
    )
    :vars
    (
      ?auto_638670 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_638668 ) ( ON ?auto_638669 ?auto_638670 ) ( CLEAR ?auto_638669 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_638656 ) ( ON ?auto_638657 ?auto_638656 ) ( ON ?auto_638658 ?auto_638657 ) ( ON ?auto_638659 ?auto_638658 ) ( ON ?auto_638660 ?auto_638659 ) ( ON ?auto_638661 ?auto_638660 ) ( ON ?auto_638662 ?auto_638661 ) ( ON ?auto_638663 ?auto_638662 ) ( ON ?auto_638664 ?auto_638663 ) ( ON ?auto_638665 ?auto_638664 ) ( ON ?auto_638666 ?auto_638665 ) ( ON ?auto_638667 ?auto_638666 ) ( ON ?auto_638668 ?auto_638667 ) ( not ( = ?auto_638656 ?auto_638657 ) ) ( not ( = ?auto_638656 ?auto_638658 ) ) ( not ( = ?auto_638656 ?auto_638659 ) ) ( not ( = ?auto_638656 ?auto_638660 ) ) ( not ( = ?auto_638656 ?auto_638661 ) ) ( not ( = ?auto_638656 ?auto_638662 ) ) ( not ( = ?auto_638656 ?auto_638663 ) ) ( not ( = ?auto_638656 ?auto_638664 ) ) ( not ( = ?auto_638656 ?auto_638665 ) ) ( not ( = ?auto_638656 ?auto_638666 ) ) ( not ( = ?auto_638656 ?auto_638667 ) ) ( not ( = ?auto_638656 ?auto_638668 ) ) ( not ( = ?auto_638656 ?auto_638669 ) ) ( not ( = ?auto_638656 ?auto_638670 ) ) ( not ( = ?auto_638657 ?auto_638658 ) ) ( not ( = ?auto_638657 ?auto_638659 ) ) ( not ( = ?auto_638657 ?auto_638660 ) ) ( not ( = ?auto_638657 ?auto_638661 ) ) ( not ( = ?auto_638657 ?auto_638662 ) ) ( not ( = ?auto_638657 ?auto_638663 ) ) ( not ( = ?auto_638657 ?auto_638664 ) ) ( not ( = ?auto_638657 ?auto_638665 ) ) ( not ( = ?auto_638657 ?auto_638666 ) ) ( not ( = ?auto_638657 ?auto_638667 ) ) ( not ( = ?auto_638657 ?auto_638668 ) ) ( not ( = ?auto_638657 ?auto_638669 ) ) ( not ( = ?auto_638657 ?auto_638670 ) ) ( not ( = ?auto_638658 ?auto_638659 ) ) ( not ( = ?auto_638658 ?auto_638660 ) ) ( not ( = ?auto_638658 ?auto_638661 ) ) ( not ( = ?auto_638658 ?auto_638662 ) ) ( not ( = ?auto_638658 ?auto_638663 ) ) ( not ( = ?auto_638658 ?auto_638664 ) ) ( not ( = ?auto_638658 ?auto_638665 ) ) ( not ( = ?auto_638658 ?auto_638666 ) ) ( not ( = ?auto_638658 ?auto_638667 ) ) ( not ( = ?auto_638658 ?auto_638668 ) ) ( not ( = ?auto_638658 ?auto_638669 ) ) ( not ( = ?auto_638658 ?auto_638670 ) ) ( not ( = ?auto_638659 ?auto_638660 ) ) ( not ( = ?auto_638659 ?auto_638661 ) ) ( not ( = ?auto_638659 ?auto_638662 ) ) ( not ( = ?auto_638659 ?auto_638663 ) ) ( not ( = ?auto_638659 ?auto_638664 ) ) ( not ( = ?auto_638659 ?auto_638665 ) ) ( not ( = ?auto_638659 ?auto_638666 ) ) ( not ( = ?auto_638659 ?auto_638667 ) ) ( not ( = ?auto_638659 ?auto_638668 ) ) ( not ( = ?auto_638659 ?auto_638669 ) ) ( not ( = ?auto_638659 ?auto_638670 ) ) ( not ( = ?auto_638660 ?auto_638661 ) ) ( not ( = ?auto_638660 ?auto_638662 ) ) ( not ( = ?auto_638660 ?auto_638663 ) ) ( not ( = ?auto_638660 ?auto_638664 ) ) ( not ( = ?auto_638660 ?auto_638665 ) ) ( not ( = ?auto_638660 ?auto_638666 ) ) ( not ( = ?auto_638660 ?auto_638667 ) ) ( not ( = ?auto_638660 ?auto_638668 ) ) ( not ( = ?auto_638660 ?auto_638669 ) ) ( not ( = ?auto_638660 ?auto_638670 ) ) ( not ( = ?auto_638661 ?auto_638662 ) ) ( not ( = ?auto_638661 ?auto_638663 ) ) ( not ( = ?auto_638661 ?auto_638664 ) ) ( not ( = ?auto_638661 ?auto_638665 ) ) ( not ( = ?auto_638661 ?auto_638666 ) ) ( not ( = ?auto_638661 ?auto_638667 ) ) ( not ( = ?auto_638661 ?auto_638668 ) ) ( not ( = ?auto_638661 ?auto_638669 ) ) ( not ( = ?auto_638661 ?auto_638670 ) ) ( not ( = ?auto_638662 ?auto_638663 ) ) ( not ( = ?auto_638662 ?auto_638664 ) ) ( not ( = ?auto_638662 ?auto_638665 ) ) ( not ( = ?auto_638662 ?auto_638666 ) ) ( not ( = ?auto_638662 ?auto_638667 ) ) ( not ( = ?auto_638662 ?auto_638668 ) ) ( not ( = ?auto_638662 ?auto_638669 ) ) ( not ( = ?auto_638662 ?auto_638670 ) ) ( not ( = ?auto_638663 ?auto_638664 ) ) ( not ( = ?auto_638663 ?auto_638665 ) ) ( not ( = ?auto_638663 ?auto_638666 ) ) ( not ( = ?auto_638663 ?auto_638667 ) ) ( not ( = ?auto_638663 ?auto_638668 ) ) ( not ( = ?auto_638663 ?auto_638669 ) ) ( not ( = ?auto_638663 ?auto_638670 ) ) ( not ( = ?auto_638664 ?auto_638665 ) ) ( not ( = ?auto_638664 ?auto_638666 ) ) ( not ( = ?auto_638664 ?auto_638667 ) ) ( not ( = ?auto_638664 ?auto_638668 ) ) ( not ( = ?auto_638664 ?auto_638669 ) ) ( not ( = ?auto_638664 ?auto_638670 ) ) ( not ( = ?auto_638665 ?auto_638666 ) ) ( not ( = ?auto_638665 ?auto_638667 ) ) ( not ( = ?auto_638665 ?auto_638668 ) ) ( not ( = ?auto_638665 ?auto_638669 ) ) ( not ( = ?auto_638665 ?auto_638670 ) ) ( not ( = ?auto_638666 ?auto_638667 ) ) ( not ( = ?auto_638666 ?auto_638668 ) ) ( not ( = ?auto_638666 ?auto_638669 ) ) ( not ( = ?auto_638666 ?auto_638670 ) ) ( not ( = ?auto_638667 ?auto_638668 ) ) ( not ( = ?auto_638667 ?auto_638669 ) ) ( not ( = ?auto_638667 ?auto_638670 ) ) ( not ( = ?auto_638668 ?auto_638669 ) ) ( not ( = ?auto_638668 ?auto_638670 ) ) ( not ( = ?auto_638669 ?auto_638670 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_638669 ?auto_638670 )
      ( !STACK ?auto_638669 ?auto_638668 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_638714 - BLOCK
      ?auto_638715 - BLOCK
      ?auto_638716 - BLOCK
      ?auto_638717 - BLOCK
      ?auto_638718 - BLOCK
      ?auto_638719 - BLOCK
      ?auto_638720 - BLOCK
      ?auto_638721 - BLOCK
      ?auto_638722 - BLOCK
      ?auto_638723 - BLOCK
      ?auto_638724 - BLOCK
      ?auto_638725 - BLOCK
      ?auto_638726 - BLOCK
      ?auto_638727 - BLOCK
    )
    :vars
    (
      ?auto_638728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_638727 ?auto_638728 ) ( ON-TABLE ?auto_638714 ) ( ON ?auto_638715 ?auto_638714 ) ( ON ?auto_638716 ?auto_638715 ) ( ON ?auto_638717 ?auto_638716 ) ( ON ?auto_638718 ?auto_638717 ) ( ON ?auto_638719 ?auto_638718 ) ( ON ?auto_638720 ?auto_638719 ) ( ON ?auto_638721 ?auto_638720 ) ( ON ?auto_638722 ?auto_638721 ) ( ON ?auto_638723 ?auto_638722 ) ( ON ?auto_638724 ?auto_638723 ) ( ON ?auto_638725 ?auto_638724 ) ( not ( = ?auto_638714 ?auto_638715 ) ) ( not ( = ?auto_638714 ?auto_638716 ) ) ( not ( = ?auto_638714 ?auto_638717 ) ) ( not ( = ?auto_638714 ?auto_638718 ) ) ( not ( = ?auto_638714 ?auto_638719 ) ) ( not ( = ?auto_638714 ?auto_638720 ) ) ( not ( = ?auto_638714 ?auto_638721 ) ) ( not ( = ?auto_638714 ?auto_638722 ) ) ( not ( = ?auto_638714 ?auto_638723 ) ) ( not ( = ?auto_638714 ?auto_638724 ) ) ( not ( = ?auto_638714 ?auto_638725 ) ) ( not ( = ?auto_638714 ?auto_638726 ) ) ( not ( = ?auto_638714 ?auto_638727 ) ) ( not ( = ?auto_638714 ?auto_638728 ) ) ( not ( = ?auto_638715 ?auto_638716 ) ) ( not ( = ?auto_638715 ?auto_638717 ) ) ( not ( = ?auto_638715 ?auto_638718 ) ) ( not ( = ?auto_638715 ?auto_638719 ) ) ( not ( = ?auto_638715 ?auto_638720 ) ) ( not ( = ?auto_638715 ?auto_638721 ) ) ( not ( = ?auto_638715 ?auto_638722 ) ) ( not ( = ?auto_638715 ?auto_638723 ) ) ( not ( = ?auto_638715 ?auto_638724 ) ) ( not ( = ?auto_638715 ?auto_638725 ) ) ( not ( = ?auto_638715 ?auto_638726 ) ) ( not ( = ?auto_638715 ?auto_638727 ) ) ( not ( = ?auto_638715 ?auto_638728 ) ) ( not ( = ?auto_638716 ?auto_638717 ) ) ( not ( = ?auto_638716 ?auto_638718 ) ) ( not ( = ?auto_638716 ?auto_638719 ) ) ( not ( = ?auto_638716 ?auto_638720 ) ) ( not ( = ?auto_638716 ?auto_638721 ) ) ( not ( = ?auto_638716 ?auto_638722 ) ) ( not ( = ?auto_638716 ?auto_638723 ) ) ( not ( = ?auto_638716 ?auto_638724 ) ) ( not ( = ?auto_638716 ?auto_638725 ) ) ( not ( = ?auto_638716 ?auto_638726 ) ) ( not ( = ?auto_638716 ?auto_638727 ) ) ( not ( = ?auto_638716 ?auto_638728 ) ) ( not ( = ?auto_638717 ?auto_638718 ) ) ( not ( = ?auto_638717 ?auto_638719 ) ) ( not ( = ?auto_638717 ?auto_638720 ) ) ( not ( = ?auto_638717 ?auto_638721 ) ) ( not ( = ?auto_638717 ?auto_638722 ) ) ( not ( = ?auto_638717 ?auto_638723 ) ) ( not ( = ?auto_638717 ?auto_638724 ) ) ( not ( = ?auto_638717 ?auto_638725 ) ) ( not ( = ?auto_638717 ?auto_638726 ) ) ( not ( = ?auto_638717 ?auto_638727 ) ) ( not ( = ?auto_638717 ?auto_638728 ) ) ( not ( = ?auto_638718 ?auto_638719 ) ) ( not ( = ?auto_638718 ?auto_638720 ) ) ( not ( = ?auto_638718 ?auto_638721 ) ) ( not ( = ?auto_638718 ?auto_638722 ) ) ( not ( = ?auto_638718 ?auto_638723 ) ) ( not ( = ?auto_638718 ?auto_638724 ) ) ( not ( = ?auto_638718 ?auto_638725 ) ) ( not ( = ?auto_638718 ?auto_638726 ) ) ( not ( = ?auto_638718 ?auto_638727 ) ) ( not ( = ?auto_638718 ?auto_638728 ) ) ( not ( = ?auto_638719 ?auto_638720 ) ) ( not ( = ?auto_638719 ?auto_638721 ) ) ( not ( = ?auto_638719 ?auto_638722 ) ) ( not ( = ?auto_638719 ?auto_638723 ) ) ( not ( = ?auto_638719 ?auto_638724 ) ) ( not ( = ?auto_638719 ?auto_638725 ) ) ( not ( = ?auto_638719 ?auto_638726 ) ) ( not ( = ?auto_638719 ?auto_638727 ) ) ( not ( = ?auto_638719 ?auto_638728 ) ) ( not ( = ?auto_638720 ?auto_638721 ) ) ( not ( = ?auto_638720 ?auto_638722 ) ) ( not ( = ?auto_638720 ?auto_638723 ) ) ( not ( = ?auto_638720 ?auto_638724 ) ) ( not ( = ?auto_638720 ?auto_638725 ) ) ( not ( = ?auto_638720 ?auto_638726 ) ) ( not ( = ?auto_638720 ?auto_638727 ) ) ( not ( = ?auto_638720 ?auto_638728 ) ) ( not ( = ?auto_638721 ?auto_638722 ) ) ( not ( = ?auto_638721 ?auto_638723 ) ) ( not ( = ?auto_638721 ?auto_638724 ) ) ( not ( = ?auto_638721 ?auto_638725 ) ) ( not ( = ?auto_638721 ?auto_638726 ) ) ( not ( = ?auto_638721 ?auto_638727 ) ) ( not ( = ?auto_638721 ?auto_638728 ) ) ( not ( = ?auto_638722 ?auto_638723 ) ) ( not ( = ?auto_638722 ?auto_638724 ) ) ( not ( = ?auto_638722 ?auto_638725 ) ) ( not ( = ?auto_638722 ?auto_638726 ) ) ( not ( = ?auto_638722 ?auto_638727 ) ) ( not ( = ?auto_638722 ?auto_638728 ) ) ( not ( = ?auto_638723 ?auto_638724 ) ) ( not ( = ?auto_638723 ?auto_638725 ) ) ( not ( = ?auto_638723 ?auto_638726 ) ) ( not ( = ?auto_638723 ?auto_638727 ) ) ( not ( = ?auto_638723 ?auto_638728 ) ) ( not ( = ?auto_638724 ?auto_638725 ) ) ( not ( = ?auto_638724 ?auto_638726 ) ) ( not ( = ?auto_638724 ?auto_638727 ) ) ( not ( = ?auto_638724 ?auto_638728 ) ) ( not ( = ?auto_638725 ?auto_638726 ) ) ( not ( = ?auto_638725 ?auto_638727 ) ) ( not ( = ?auto_638725 ?auto_638728 ) ) ( not ( = ?auto_638726 ?auto_638727 ) ) ( not ( = ?auto_638726 ?auto_638728 ) ) ( not ( = ?auto_638727 ?auto_638728 ) ) ( CLEAR ?auto_638725 ) ( ON ?auto_638726 ?auto_638727 ) ( CLEAR ?auto_638726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_638714 ?auto_638715 ?auto_638716 ?auto_638717 ?auto_638718 ?auto_638719 ?auto_638720 ?auto_638721 ?auto_638722 ?auto_638723 ?auto_638724 ?auto_638725 ?auto_638726 )
      ( MAKE-14PILE ?auto_638714 ?auto_638715 ?auto_638716 ?auto_638717 ?auto_638718 ?auto_638719 ?auto_638720 ?auto_638721 ?auto_638722 ?auto_638723 ?auto_638724 ?auto_638725 ?auto_638726 ?auto_638727 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_638772 - BLOCK
      ?auto_638773 - BLOCK
      ?auto_638774 - BLOCK
      ?auto_638775 - BLOCK
      ?auto_638776 - BLOCK
      ?auto_638777 - BLOCK
      ?auto_638778 - BLOCK
      ?auto_638779 - BLOCK
      ?auto_638780 - BLOCK
      ?auto_638781 - BLOCK
      ?auto_638782 - BLOCK
      ?auto_638783 - BLOCK
      ?auto_638784 - BLOCK
      ?auto_638785 - BLOCK
    )
    :vars
    (
      ?auto_638786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_638785 ?auto_638786 ) ( ON-TABLE ?auto_638772 ) ( ON ?auto_638773 ?auto_638772 ) ( ON ?auto_638774 ?auto_638773 ) ( ON ?auto_638775 ?auto_638774 ) ( ON ?auto_638776 ?auto_638775 ) ( ON ?auto_638777 ?auto_638776 ) ( ON ?auto_638778 ?auto_638777 ) ( ON ?auto_638779 ?auto_638778 ) ( ON ?auto_638780 ?auto_638779 ) ( ON ?auto_638781 ?auto_638780 ) ( ON ?auto_638782 ?auto_638781 ) ( not ( = ?auto_638772 ?auto_638773 ) ) ( not ( = ?auto_638772 ?auto_638774 ) ) ( not ( = ?auto_638772 ?auto_638775 ) ) ( not ( = ?auto_638772 ?auto_638776 ) ) ( not ( = ?auto_638772 ?auto_638777 ) ) ( not ( = ?auto_638772 ?auto_638778 ) ) ( not ( = ?auto_638772 ?auto_638779 ) ) ( not ( = ?auto_638772 ?auto_638780 ) ) ( not ( = ?auto_638772 ?auto_638781 ) ) ( not ( = ?auto_638772 ?auto_638782 ) ) ( not ( = ?auto_638772 ?auto_638783 ) ) ( not ( = ?auto_638772 ?auto_638784 ) ) ( not ( = ?auto_638772 ?auto_638785 ) ) ( not ( = ?auto_638772 ?auto_638786 ) ) ( not ( = ?auto_638773 ?auto_638774 ) ) ( not ( = ?auto_638773 ?auto_638775 ) ) ( not ( = ?auto_638773 ?auto_638776 ) ) ( not ( = ?auto_638773 ?auto_638777 ) ) ( not ( = ?auto_638773 ?auto_638778 ) ) ( not ( = ?auto_638773 ?auto_638779 ) ) ( not ( = ?auto_638773 ?auto_638780 ) ) ( not ( = ?auto_638773 ?auto_638781 ) ) ( not ( = ?auto_638773 ?auto_638782 ) ) ( not ( = ?auto_638773 ?auto_638783 ) ) ( not ( = ?auto_638773 ?auto_638784 ) ) ( not ( = ?auto_638773 ?auto_638785 ) ) ( not ( = ?auto_638773 ?auto_638786 ) ) ( not ( = ?auto_638774 ?auto_638775 ) ) ( not ( = ?auto_638774 ?auto_638776 ) ) ( not ( = ?auto_638774 ?auto_638777 ) ) ( not ( = ?auto_638774 ?auto_638778 ) ) ( not ( = ?auto_638774 ?auto_638779 ) ) ( not ( = ?auto_638774 ?auto_638780 ) ) ( not ( = ?auto_638774 ?auto_638781 ) ) ( not ( = ?auto_638774 ?auto_638782 ) ) ( not ( = ?auto_638774 ?auto_638783 ) ) ( not ( = ?auto_638774 ?auto_638784 ) ) ( not ( = ?auto_638774 ?auto_638785 ) ) ( not ( = ?auto_638774 ?auto_638786 ) ) ( not ( = ?auto_638775 ?auto_638776 ) ) ( not ( = ?auto_638775 ?auto_638777 ) ) ( not ( = ?auto_638775 ?auto_638778 ) ) ( not ( = ?auto_638775 ?auto_638779 ) ) ( not ( = ?auto_638775 ?auto_638780 ) ) ( not ( = ?auto_638775 ?auto_638781 ) ) ( not ( = ?auto_638775 ?auto_638782 ) ) ( not ( = ?auto_638775 ?auto_638783 ) ) ( not ( = ?auto_638775 ?auto_638784 ) ) ( not ( = ?auto_638775 ?auto_638785 ) ) ( not ( = ?auto_638775 ?auto_638786 ) ) ( not ( = ?auto_638776 ?auto_638777 ) ) ( not ( = ?auto_638776 ?auto_638778 ) ) ( not ( = ?auto_638776 ?auto_638779 ) ) ( not ( = ?auto_638776 ?auto_638780 ) ) ( not ( = ?auto_638776 ?auto_638781 ) ) ( not ( = ?auto_638776 ?auto_638782 ) ) ( not ( = ?auto_638776 ?auto_638783 ) ) ( not ( = ?auto_638776 ?auto_638784 ) ) ( not ( = ?auto_638776 ?auto_638785 ) ) ( not ( = ?auto_638776 ?auto_638786 ) ) ( not ( = ?auto_638777 ?auto_638778 ) ) ( not ( = ?auto_638777 ?auto_638779 ) ) ( not ( = ?auto_638777 ?auto_638780 ) ) ( not ( = ?auto_638777 ?auto_638781 ) ) ( not ( = ?auto_638777 ?auto_638782 ) ) ( not ( = ?auto_638777 ?auto_638783 ) ) ( not ( = ?auto_638777 ?auto_638784 ) ) ( not ( = ?auto_638777 ?auto_638785 ) ) ( not ( = ?auto_638777 ?auto_638786 ) ) ( not ( = ?auto_638778 ?auto_638779 ) ) ( not ( = ?auto_638778 ?auto_638780 ) ) ( not ( = ?auto_638778 ?auto_638781 ) ) ( not ( = ?auto_638778 ?auto_638782 ) ) ( not ( = ?auto_638778 ?auto_638783 ) ) ( not ( = ?auto_638778 ?auto_638784 ) ) ( not ( = ?auto_638778 ?auto_638785 ) ) ( not ( = ?auto_638778 ?auto_638786 ) ) ( not ( = ?auto_638779 ?auto_638780 ) ) ( not ( = ?auto_638779 ?auto_638781 ) ) ( not ( = ?auto_638779 ?auto_638782 ) ) ( not ( = ?auto_638779 ?auto_638783 ) ) ( not ( = ?auto_638779 ?auto_638784 ) ) ( not ( = ?auto_638779 ?auto_638785 ) ) ( not ( = ?auto_638779 ?auto_638786 ) ) ( not ( = ?auto_638780 ?auto_638781 ) ) ( not ( = ?auto_638780 ?auto_638782 ) ) ( not ( = ?auto_638780 ?auto_638783 ) ) ( not ( = ?auto_638780 ?auto_638784 ) ) ( not ( = ?auto_638780 ?auto_638785 ) ) ( not ( = ?auto_638780 ?auto_638786 ) ) ( not ( = ?auto_638781 ?auto_638782 ) ) ( not ( = ?auto_638781 ?auto_638783 ) ) ( not ( = ?auto_638781 ?auto_638784 ) ) ( not ( = ?auto_638781 ?auto_638785 ) ) ( not ( = ?auto_638781 ?auto_638786 ) ) ( not ( = ?auto_638782 ?auto_638783 ) ) ( not ( = ?auto_638782 ?auto_638784 ) ) ( not ( = ?auto_638782 ?auto_638785 ) ) ( not ( = ?auto_638782 ?auto_638786 ) ) ( not ( = ?auto_638783 ?auto_638784 ) ) ( not ( = ?auto_638783 ?auto_638785 ) ) ( not ( = ?auto_638783 ?auto_638786 ) ) ( not ( = ?auto_638784 ?auto_638785 ) ) ( not ( = ?auto_638784 ?auto_638786 ) ) ( not ( = ?auto_638785 ?auto_638786 ) ) ( ON ?auto_638784 ?auto_638785 ) ( CLEAR ?auto_638782 ) ( ON ?auto_638783 ?auto_638784 ) ( CLEAR ?auto_638783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_638772 ?auto_638773 ?auto_638774 ?auto_638775 ?auto_638776 ?auto_638777 ?auto_638778 ?auto_638779 ?auto_638780 ?auto_638781 ?auto_638782 ?auto_638783 )
      ( MAKE-14PILE ?auto_638772 ?auto_638773 ?auto_638774 ?auto_638775 ?auto_638776 ?auto_638777 ?auto_638778 ?auto_638779 ?auto_638780 ?auto_638781 ?auto_638782 ?auto_638783 ?auto_638784 ?auto_638785 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_638830 - BLOCK
      ?auto_638831 - BLOCK
      ?auto_638832 - BLOCK
      ?auto_638833 - BLOCK
      ?auto_638834 - BLOCK
      ?auto_638835 - BLOCK
      ?auto_638836 - BLOCK
      ?auto_638837 - BLOCK
      ?auto_638838 - BLOCK
      ?auto_638839 - BLOCK
      ?auto_638840 - BLOCK
      ?auto_638841 - BLOCK
      ?auto_638842 - BLOCK
      ?auto_638843 - BLOCK
    )
    :vars
    (
      ?auto_638844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_638843 ?auto_638844 ) ( ON-TABLE ?auto_638830 ) ( ON ?auto_638831 ?auto_638830 ) ( ON ?auto_638832 ?auto_638831 ) ( ON ?auto_638833 ?auto_638832 ) ( ON ?auto_638834 ?auto_638833 ) ( ON ?auto_638835 ?auto_638834 ) ( ON ?auto_638836 ?auto_638835 ) ( ON ?auto_638837 ?auto_638836 ) ( ON ?auto_638838 ?auto_638837 ) ( ON ?auto_638839 ?auto_638838 ) ( not ( = ?auto_638830 ?auto_638831 ) ) ( not ( = ?auto_638830 ?auto_638832 ) ) ( not ( = ?auto_638830 ?auto_638833 ) ) ( not ( = ?auto_638830 ?auto_638834 ) ) ( not ( = ?auto_638830 ?auto_638835 ) ) ( not ( = ?auto_638830 ?auto_638836 ) ) ( not ( = ?auto_638830 ?auto_638837 ) ) ( not ( = ?auto_638830 ?auto_638838 ) ) ( not ( = ?auto_638830 ?auto_638839 ) ) ( not ( = ?auto_638830 ?auto_638840 ) ) ( not ( = ?auto_638830 ?auto_638841 ) ) ( not ( = ?auto_638830 ?auto_638842 ) ) ( not ( = ?auto_638830 ?auto_638843 ) ) ( not ( = ?auto_638830 ?auto_638844 ) ) ( not ( = ?auto_638831 ?auto_638832 ) ) ( not ( = ?auto_638831 ?auto_638833 ) ) ( not ( = ?auto_638831 ?auto_638834 ) ) ( not ( = ?auto_638831 ?auto_638835 ) ) ( not ( = ?auto_638831 ?auto_638836 ) ) ( not ( = ?auto_638831 ?auto_638837 ) ) ( not ( = ?auto_638831 ?auto_638838 ) ) ( not ( = ?auto_638831 ?auto_638839 ) ) ( not ( = ?auto_638831 ?auto_638840 ) ) ( not ( = ?auto_638831 ?auto_638841 ) ) ( not ( = ?auto_638831 ?auto_638842 ) ) ( not ( = ?auto_638831 ?auto_638843 ) ) ( not ( = ?auto_638831 ?auto_638844 ) ) ( not ( = ?auto_638832 ?auto_638833 ) ) ( not ( = ?auto_638832 ?auto_638834 ) ) ( not ( = ?auto_638832 ?auto_638835 ) ) ( not ( = ?auto_638832 ?auto_638836 ) ) ( not ( = ?auto_638832 ?auto_638837 ) ) ( not ( = ?auto_638832 ?auto_638838 ) ) ( not ( = ?auto_638832 ?auto_638839 ) ) ( not ( = ?auto_638832 ?auto_638840 ) ) ( not ( = ?auto_638832 ?auto_638841 ) ) ( not ( = ?auto_638832 ?auto_638842 ) ) ( not ( = ?auto_638832 ?auto_638843 ) ) ( not ( = ?auto_638832 ?auto_638844 ) ) ( not ( = ?auto_638833 ?auto_638834 ) ) ( not ( = ?auto_638833 ?auto_638835 ) ) ( not ( = ?auto_638833 ?auto_638836 ) ) ( not ( = ?auto_638833 ?auto_638837 ) ) ( not ( = ?auto_638833 ?auto_638838 ) ) ( not ( = ?auto_638833 ?auto_638839 ) ) ( not ( = ?auto_638833 ?auto_638840 ) ) ( not ( = ?auto_638833 ?auto_638841 ) ) ( not ( = ?auto_638833 ?auto_638842 ) ) ( not ( = ?auto_638833 ?auto_638843 ) ) ( not ( = ?auto_638833 ?auto_638844 ) ) ( not ( = ?auto_638834 ?auto_638835 ) ) ( not ( = ?auto_638834 ?auto_638836 ) ) ( not ( = ?auto_638834 ?auto_638837 ) ) ( not ( = ?auto_638834 ?auto_638838 ) ) ( not ( = ?auto_638834 ?auto_638839 ) ) ( not ( = ?auto_638834 ?auto_638840 ) ) ( not ( = ?auto_638834 ?auto_638841 ) ) ( not ( = ?auto_638834 ?auto_638842 ) ) ( not ( = ?auto_638834 ?auto_638843 ) ) ( not ( = ?auto_638834 ?auto_638844 ) ) ( not ( = ?auto_638835 ?auto_638836 ) ) ( not ( = ?auto_638835 ?auto_638837 ) ) ( not ( = ?auto_638835 ?auto_638838 ) ) ( not ( = ?auto_638835 ?auto_638839 ) ) ( not ( = ?auto_638835 ?auto_638840 ) ) ( not ( = ?auto_638835 ?auto_638841 ) ) ( not ( = ?auto_638835 ?auto_638842 ) ) ( not ( = ?auto_638835 ?auto_638843 ) ) ( not ( = ?auto_638835 ?auto_638844 ) ) ( not ( = ?auto_638836 ?auto_638837 ) ) ( not ( = ?auto_638836 ?auto_638838 ) ) ( not ( = ?auto_638836 ?auto_638839 ) ) ( not ( = ?auto_638836 ?auto_638840 ) ) ( not ( = ?auto_638836 ?auto_638841 ) ) ( not ( = ?auto_638836 ?auto_638842 ) ) ( not ( = ?auto_638836 ?auto_638843 ) ) ( not ( = ?auto_638836 ?auto_638844 ) ) ( not ( = ?auto_638837 ?auto_638838 ) ) ( not ( = ?auto_638837 ?auto_638839 ) ) ( not ( = ?auto_638837 ?auto_638840 ) ) ( not ( = ?auto_638837 ?auto_638841 ) ) ( not ( = ?auto_638837 ?auto_638842 ) ) ( not ( = ?auto_638837 ?auto_638843 ) ) ( not ( = ?auto_638837 ?auto_638844 ) ) ( not ( = ?auto_638838 ?auto_638839 ) ) ( not ( = ?auto_638838 ?auto_638840 ) ) ( not ( = ?auto_638838 ?auto_638841 ) ) ( not ( = ?auto_638838 ?auto_638842 ) ) ( not ( = ?auto_638838 ?auto_638843 ) ) ( not ( = ?auto_638838 ?auto_638844 ) ) ( not ( = ?auto_638839 ?auto_638840 ) ) ( not ( = ?auto_638839 ?auto_638841 ) ) ( not ( = ?auto_638839 ?auto_638842 ) ) ( not ( = ?auto_638839 ?auto_638843 ) ) ( not ( = ?auto_638839 ?auto_638844 ) ) ( not ( = ?auto_638840 ?auto_638841 ) ) ( not ( = ?auto_638840 ?auto_638842 ) ) ( not ( = ?auto_638840 ?auto_638843 ) ) ( not ( = ?auto_638840 ?auto_638844 ) ) ( not ( = ?auto_638841 ?auto_638842 ) ) ( not ( = ?auto_638841 ?auto_638843 ) ) ( not ( = ?auto_638841 ?auto_638844 ) ) ( not ( = ?auto_638842 ?auto_638843 ) ) ( not ( = ?auto_638842 ?auto_638844 ) ) ( not ( = ?auto_638843 ?auto_638844 ) ) ( ON ?auto_638842 ?auto_638843 ) ( ON ?auto_638841 ?auto_638842 ) ( CLEAR ?auto_638839 ) ( ON ?auto_638840 ?auto_638841 ) ( CLEAR ?auto_638840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_638830 ?auto_638831 ?auto_638832 ?auto_638833 ?auto_638834 ?auto_638835 ?auto_638836 ?auto_638837 ?auto_638838 ?auto_638839 ?auto_638840 )
      ( MAKE-14PILE ?auto_638830 ?auto_638831 ?auto_638832 ?auto_638833 ?auto_638834 ?auto_638835 ?auto_638836 ?auto_638837 ?auto_638838 ?auto_638839 ?auto_638840 ?auto_638841 ?auto_638842 ?auto_638843 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_638888 - BLOCK
      ?auto_638889 - BLOCK
      ?auto_638890 - BLOCK
      ?auto_638891 - BLOCK
      ?auto_638892 - BLOCK
      ?auto_638893 - BLOCK
      ?auto_638894 - BLOCK
      ?auto_638895 - BLOCK
      ?auto_638896 - BLOCK
      ?auto_638897 - BLOCK
      ?auto_638898 - BLOCK
      ?auto_638899 - BLOCK
      ?auto_638900 - BLOCK
      ?auto_638901 - BLOCK
    )
    :vars
    (
      ?auto_638902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_638901 ?auto_638902 ) ( ON-TABLE ?auto_638888 ) ( ON ?auto_638889 ?auto_638888 ) ( ON ?auto_638890 ?auto_638889 ) ( ON ?auto_638891 ?auto_638890 ) ( ON ?auto_638892 ?auto_638891 ) ( ON ?auto_638893 ?auto_638892 ) ( ON ?auto_638894 ?auto_638893 ) ( ON ?auto_638895 ?auto_638894 ) ( ON ?auto_638896 ?auto_638895 ) ( not ( = ?auto_638888 ?auto_638889 ) ) ( not ( = ?auto_638888 ?auto_638890 ) ) ( not ( = ?auto_638888 ?auto_638891 ) ) ( not ( = ?auto_638888 ?auto_638892 ) ) ( not ( = ?auto_638888 ?auto_638893 ) ) ( not ( = ?auto_638888 ?auto_638894 ) ) ( not ( = ?auto_638888 ?auto_638895 ) ) ( not ( = ?auto_638888 ?auto_638896 ) ) ( not ( = ?auto_638888 ?auto_638897 ) ) ( not ( = ?auto_638888 ?auto_638898 ) ) ( not ( = ?auto_638888 ?auto_638899 ) ) ( not ( = ?auto_638888 ?auto_638900 ) ) ( not ( = ?auto_638888 ?auto_638901 ) ) ( not ( = ?auto_638888 ?auto_638902 ) ) ( not ( = ?auto_638889 ?auto_638890 ) ) ( not ( = ?auto_638889 ?auto_638891 ) ) ( not ( = ?auto_638889 ?auto_638892 ) ) ( not ( = ?auto_638889 ?auto_638893 ) ) ( not ( = ?auto_638889 ?auto_638894 ) ) ( not ( = ?auto_638889 ?auto_638895 ) ) ( not ( = ?auto_638889 ?auto_638896 ) ) ( not ( = ?auto_638889 ?auto_638897 ) ) ( not ( = ?auto_638889 ?auto_638898 ) ) ( not ( = ?auto_638889 ?auto_638899 ) ) ( not ( = ?auto_638889 ?auto_638900 ) ) ( not ( = ?auto_638889 ?auto_638901 ) ) ( not ( = ?auto_638889 ?auto_638902 ) ) ( not ( = ?auto_638890 ?auto_638891 ) ) ( not ( = ?auto_638890 ?auto_638892 ) ) ( not ( = ?auto_638890 ?auto_638893 ) ) ( not ( = ?auto_638890 ?auto_638894 ) ) ( not ( = ?auto_638890 ?auto_638895 ) ) ( not ( = ?auto_638890 ?auto_638896 ) ) ( not ( = ?auto_638890 ?auto_638897 ) ) ( not ( = ?auto_638890 ?auto_638898 ) ) ( not ( = ?auto_638890 ?auto_638899 ) ) ( not ( = ?auto_638890 ?auto_638900 ) ) ( not ( = ?auto_638890 ?auto_638901 ) ) ( not ( = ?auto_638890 ?auto_638902 ) ) ( not ( = ?auto_638891 ?auto_638892 ) ) ( not ( = ?auto_638891 ?auto_638893 ) ) ( not ( = ?auto_638891 ?auto_638894 ) ) ( not ( = ?auto_638891 ?auto_638895 ) ) ( not ( = ?auto_638891 ?auto_638896 ) ) ( not ( = ?auto_638891 ?auto_638897 ) ) ( not ( = ?auto_638891 ?auto_638898 ) ) ( not ( = ?auto_638891 ?auto_638899 ) ) ( not ( = ?auto_638891 ?auto_638900 ) ) ( not ( = ?auto_638891 ?auto_638901 ) ) ( not ( = ?auto_638891 ?auto_638902 ) ) ( not ( = ?auto_638892 ?auto_638893 ) ) ( not ( = ?auto_638892 ?auto_638894 ) ) ( not ( = ?auto_638892 ?auto_638895 ) ) ( not ( = ?auto_638892 ?auto_638896 ) ) ( not ( = ?auto_638892 ?auto_638897 ) ) ( not ( = ?auto_638892 ?auto_638898 ) ) ( not ( = ?auto_638892 ?auto_638899 ) ) ( not ( = ?auto_638892 ?auto_638900 ) ) ( not ( = ?auto_638892 ?auto_638901 ) ) ( not ( = ?auto_638892 ?auto_638902 ) ) ( not ( = ?auto_638893 ?auto_638894 ) ) ( not ( = ?auto_638893 ?auto_638895 ) ) ( not ( = ?auto_638893 ?auto_638896 ) ) ( not ( = ?auto_638893 ?auto_638897 ) ) ( not ( = ?auto_638893 ?auto_638898 ) ) ( not ( = ?auto_638893 ?auto_638899 ) ) ( not ( = ?auto_638893 ?auto_638900 ) ) ( not ( = ?auto_638893 ?auto_638901 ) ) ( not ( = ?auto_638893 ?auto_638902 ) ) ( not ( = ?auto_638894 ?auto_638895 ) ) ( not ( = ?auto_638894 ?auto_638896 ) ) ( not ( = ?auto_638894 ?auto_638897 ) ) ( not ( = ?auto_638894 ?auto_638898 ) ) ( not ( = ?auto_638894 ?auto_638899 ) ) ( not ( = ?auto_638894 ?auto_638900 ) ) ( not ( = ?auto_638894 ?auto_638901 ) ) ( not ( = ?auto_638894 ?auto_638902 ) ) ( not ( = ?auto_638895 ?auto_638896 ) ) ( not ( = ?auto_638895 ?auto_638897 ) ) ( not ( = ?auto_638895 ?auto_638898 ) ) ( not ( = ?auto_638895 ?auto_638899 ) ) ( not ( = ?auto_638895 ?auto_638900 ) ) ( not ( = ?auto_638895 ?auto_638901 ) ) ( not ( = ?auto_638895 ?auto_638902 ) ) ( not ( = ?auto_638896 ?auto_638897 ) ) ( not ( = ?auto_638896 ?auto_638898 ) ) ( not ( = ?auto_638896 ?auto_638899 ) ) ( not ( = ?auto_638896 ?auto_638900 ) ) ( not ( = ?auto_638896 ?auto_638901 ) ) ( not ( = ?auto_638896 ?auto_638902 ) ) ( not ( = ?auto_638897 ?auto_638898 ) ) ( not ( = ?auto_638897 ?auto_638899 ) ) ( not ( = ?auto_638897 ?auto_638900 ) ) ( not ( = ?auto_638897 ?auto_638901 ) ) ( not ( = ?auto_638897 ?auto_638902 ) ) ( not ( = ?auto_638898 ?auto_638899 ) ) ( not ( = ?auto_638898 ?auto_638900 ) ) ( not ( = ?auto_638898 ?auto_638901 ) ) ( not ( = ?auto_638898 ?auto_638902 ) ) ( not ( = ?auto_638899 ?auto_638900 ) ) ( not ( = ?auto_638899 ?auto_638901 ) ) ( not ( = ?auto_638899 ?auto_638902 ) ) ( not ( = ?auto_638900 ?auto_638901 ) ) ( not ( = ?auto_638900 ?auto_638902 ) ) ( not ( = ?auto_638901 ?auto_638902 ) ) ( ON ?auto_638900 ?auto_638901 ) ( ON ?auto_638899 ?auto_638900 ) ( ON ?auto_638898 ?auto_638899 ) ( CLEAR ?auto_638896 ) ( ON ?auto_638897 ?auto_638898 ) ( CLEAR ?auto_638897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_638888 ?auto_638889 ?auto_638890 ?auto_638891 ?auto_638892 ?auto_638893 ?auto_638894 ?auto_638895 ?auto_638896 ?auto_638897 )
      ( MAKE-14PILE ?auto_638888 ?auto_638889 ?auto_638890 ?auto_638891 ?auto_638892 ?auto_638893 ?auto_638894 ?auto_638895 ?auto_638896 ?auto_638897 ?auto_638898 ?auto_638899 ?auto_638900 ?auto_638901 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_638946 - BLOCK
      ?auto_638947 - BLOCK
      ?auto_638948 - BLOCK
      ?auto_638949 - BLOCK
      ?auto_638950 - BLOCK
      ?auto_638951 - BLOCK
      ?auto_638952 - BLOCK
      ?auto_638953 - BLOCK
      ?auto_638954 - BLOCK
      ?auto_638955 - BLOCK
      ?auto_638956 - BLOCK
      ?auto_638957 - BLOCK
      ?auto_638958 - BLOCK
      ?auto_638959 - BLOCK
    )
    :vars
    (
      ?auto_638960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_638959 ?auto_638960 ) ( ON-TABLE ?auto_638946 ) ( ON ?auto_638947 ?auto_638946 ) ( ON ?auto_638948 ?auto_638947 ) ( ON ?auto_638949 ?auto_638948 ) ( ON ?auto_638950 ?auto_638949 ) ( ON ?auto_638951 ?auto_638950 ) ( ON ?auto_638952 ?auto_638951 ) ( ON ?auto_638953 ?auto_638952 ) ( not ( = ?auto_638946 ?auto_638947 ) ) ( not ( = ?auto_638946 ?auto_638948 ) ) ( not ( = ?auto_638946 ?auto_638949 ) ) ( not ( = ?auto_638946 ?auto_638950 ) ) ( not ( = ?auto_638946 ?auto_638951 ) ) ( not ( = ?auto_638946 ?auto_638952 ) ) ( not ( = ?auto_638946 ?auto_638953 ) ) ( not ( = ?auto_638946 ?auto_638954 ) ) ( not ( = ?auto_638946 ?auto_638955 ) ) ( not ( = ?auto_638946 ?auto_638956 ) ) ( not ( = ?auto_638946 ?auto_638957 ) ) ( not ( = ?auto_638946 ?auto_638958 ) ) ( not ( = ?auto_638946 ?auto_638959 ) ) ( not ( = ?auto_638946 ?auto_638960 ) ) ( not ( = ?auto_638947 ?auto_638948 ) ) ( not ( = ?auto_638947 ?auto_638949 ) ) ( not ( = ?auto_638947 ?auto_638950 ) ) ( not ( = ?auto_638947 ?auto_638951 ) ) ( not ( = ?auto_638947 ?auto_638952 ) ) ( not ( = ?auto_638947 ?auto_638953 ) ) ( not ( = ?auto_638947 ?auto_638954 ) ) ( not ( = ?auto_638947 ?auto_638955 ) ) ( not ( = ?auto_638947 ?auto_638956 ) ) ( not ( = ?auto_638947 ?auto_638957 ) ) ( not ( = ?auto_638947 ?auto_638958 ) ) ( not ( = ?auto_638947 ?auto_638959 ) ) ( not ( = ?auto_638947 ?auto_638960 ) ) ( not ( = ?auto_638948 ?auto_638949 ) ) ( not ( = ?auto_638948 ?auto_638950 ) ) ( not ( = ?auto_638948 ?auto_638951 ) ) ( not ( = ?auto_638948 ?auto_638952 ) ) ( not ( = ?auto_638948 ?auto_638953 ) ) ( not ( = ?auto_638948 ?auto_638954 ) ) ( not ( = ?auto_638948 ?auto_638955 ) ) ( not ( = ?auto_638948 ?auto_638956 ) ) ( not ( = ?auto_638948 ?auto_638957 ) ) ( not ( = ?auto_638948 ?auto_638958 ) ) ( not ( = ?auto_638948 ?auto_638959 ) ) ( not ( = ?auto_638948 ?auto_638960 ) ) ( not ( = ?auto_638949 ?auto_638950 ) ) ( not ( = ?auto_638949 ?auto_638951 ) ) ( not ( = ?auto_638949 ?auto_638952 ) ) ( not ( = ?auto_638949 ?auto_638953 ) ) ( not ( = ?auto_638949 ?auto_638954 ) ) ( not ( = ?auto_638949 ?auto_638955 ) ) ( not ( = ?auto_638949 ?auto_638956 ) ) ( not ( = ?auto_638949 ?auto_638957 ) ) ( not ( = ?auto_638949 ?auto_638958 ) ) ( not ( = ?auto_638949 ?auto_638959 ) ) ( not ( = ?auto_638949 ?auto_638960 ) ) ( not ( = ?auto_638950 ?auto_638951 ) ) ( not ( = ?auto_638950 ?auto_638952 ) ) ( not ( = ?auto_638950 ?auto_638953 ) ) ( not ( = ?auto_638950 ?auto_638954 ) ) ( not ( = ?auto_638950 ?auto_638955 ) ) ( not ( = ?auto_638950 ?auto_638956 ) ) ( not ( = ?auto_638950 ?auto_638957 ) ) ( not ( = ?auto_638950 ?auto_638958 ) ) ( not ( = ?auto_638950 ?auto_638959 ) ) ( not ( = ?auto_638950 ?auto_638960 ) ) ( not ( = ?auto_638951 ?auto_638952 ) ) ( not ( = ?auto_638951 ?auto_638953 ) ) ( not ( = ?auto_638951 ?auto_638954 ) ) ( not ( = ?auto_638951 ?auto_638955 ) ) ( not ( = ?auto_638951 ?auto_638956 ) ) ( not ( = ?auto_638951 ?auto_638957 ) ) ( not ( = ?auto_638951 ?auto_638958 ) ) ( not ( = ?auto_638951 ?auto_638959 ) ) ( not ( = ?auto_638951 ?auto_638960 ) ) ( not ( = ?auto_638952 ?auto_638953 ) ) ( not ( = ?auto_638952 ?auto_638954 ) ) ( not ( = ?auto_638952 ?auto_638955 ) ) ( not ( = ?auto_638952 ?auto_638956 ) ) ( not ( = ?auto_638952 ?auto_638957 ) ) ( not ( = ?auto_638952 ?auto_638958 ) ) ( not ( = ?auto_638952 ?auto_638959 ) ) ( not ( = ?auto_638952 ?auto_638960 ) ) ( not ( = ?auto_638953 ?auto_638954 ) ) ( not ( = ?auto_638953 ?auto_638955 ) ) ( not ( = ?auto_638953 ?auto_638956 ) ) ( not ( = ?auto_638953 ?auto_638957 ) ) ( not ( = ?auto_638953 ?auto_638958 ) ) ( not ( = ?auto_638953 ?auto_638959 ) ) ( not ( = ?auto_638953 ?auto_638960 ) ) ( not ( = ?auto_638954 ?auto_638955 ) ) ( not ( = ?auto_638954 ?auto_638956 ) ) ( not ( = ?auto_638954 ?auto_638957 ) ) ( not ( = ?auto_638954 ?auto_638958 ) ) ( not ( = ?auto_638954 ?auto_638959 ) ) ( not ( = ?auto_638954 ?auto_638960 ) ) ( not ( = ?auto_638955 ?auto_638956 ) ) ( not ( = ?auto_638955 ?auto_638957 ) ) ( not ( = ?auto_638955 ?auto_638958 ) ) ( not ( = ?auto_638955 ?auto_638959 ) ) ( not ( = ?auto_638955 ?auto_638960 ) ) ( not ( = ?auto_638956 ?auto_638957 ) ) ( not ( = ?auto_638956 ?auto_638958 ) ) ( not ( = ?auto_638956 ?auto_638959 ) ) ( not ( = ?auto_638956 ?auto_638960 ) ) ( not ( = ?auto_638957 ?auto_638958 ) ) ( not ( = ?auto_638957 ?auto_638959 ) ) ( not ( = ?auto_638957 ?auto_638960 ) ) ( not ( = ?auto_638958 ?auto_638959 ) ) ( not ( = ?auto_638958 ?auto_638960 ) ) ( not ( = ?auto_638959 ?auto_638960 ) ) ( ON ?auto_638958 ?auto_638959 ) ( ON ?auto_638957 ?auto_638958 ) ( ON ?auto_638956 ?auto_638957 ) ( ON ?auto_638955 ?auto_638956 ) ( CLEAR ?auto_638953 ) ( ON ?auto_638954 ?auto_638955 ) ( CLEAR ?auto_638954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_638946 ?auto_638947 ?auto_638948 ?auto_638949 ?auto_638950 ?auto_638951 ?auto_638952 ?auto_638953 ?auto_638954 )
      ( MAKE-14PILE ?auto_638946 ?auto_638947 ?auto_638948 ?auto_638949 ?auto_638950 ?auto_638951 ?auto_638952 ?auto_638953 ?auto_638954 ?auto_638955 ?auto_638956 ?auto_638957 ?auto_638958 ?auto_638959 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_639004 - BLOCK
      ?auto_639005 - BLOCK
      ?auto_639006 - BLOCK
      ?auto_639007 - BLOCK
      ?auto_639008 - BLOCK
      ?auto_639009 - BLOCK
      ?auto_639010 - BLOCK
      ?auto_639011 - BLOCK
      ?auto_639012 - BLOCK
      ?auto_639013 - BLOCK
      ?auto_639014 - BLOCK
      ?auto_639015 - BLOCK
      ?auto_639016 - BLOCK
      ?auto_639017 - BLOCK
    )
    :vars
    (
      ?auto_639018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_639017 ?auto_639018 ) ( ON-TABLE ?auto_639004 ) ( ON ?auto_639005 ?auto_639004 ) ( ON ?auto_639006 ?auto_639005 ) ( ON ?auto_639007 ?auto_639006 ) ( ON ?auto_639008 ?auto_639007 ) ( ON ?auto_639009 ?auto_639008 ) ( ON ?auto_639010 ?auto_639009 ) ( not ( = ?auto_639004 ?auto_639005 ) ) ( not ( = ?auto_639004 ?auto_639006 ) ) ( not ( = ?auto_639004 ?auto_639007 ) ) ( not ( = ?auto_639004 ?auto_639008 ) ) ( not ( = ?auto_639004 ?auto_639009 ) ) ( not ( = ?auto_639004 ?auto_639010 ) ) ( not ( = ?auto_639004 ?auto_639011 ) ) ( not ( = ?auto_639004 ?auto_639012 ) ) ( not ( = ?auto_639004 ?auto_639013 ) ) ( not ( = ?auto_639004 ?auto_639014 ) ) ( not ( = ?auto_639004 ?auto_639015 ) ) ( not ( = ?auto_639004 ?auto_639016 ) ) ( not ( = ?auto_639004 ?auto_639017 ) ) ( not ( = ?auto_639004 ?auto_639018 ) ) ( not ( = ?auto_639005 ?auto_639006 ) ) ( not ( = ?auto_639005 ?auto_639007 ) ) ( not ( = ?auto_639005 ?auto_639008 ) ) ( not ( = ?auto_639005 ?auto_639009 ) ) ( not ( = ?auto_639005 ?auto_639010 ) ) ( not ( = ?auto_639005 ?auto_639011 ) ) ( not ( = ?auto_639005 ?auto_639012 ) ) ( not ( = ?auto_639005 ?auto_639013 ) ) ( not ( = ?auto_639005 ?auto_639014 ) ) ( not ( = ?auto_639005 ?auto_639015 ) ) ( not ( = ?auto_639005 ?auto_639016 ) ) ( not ( = ?auto_639005 ?auto_639017 ) ) ( not ( = ?auto_639005 ?auto_639018 ) ) ( not ( = ?auto_639006 ?auto_639007 ) ) ( not ( = ?auto_639006 ?auto_639008 ) ) ( not ( = ?auto_639006 ?auto_639009 ) ) ( not ( = ?auto_639006 ?auto_639010 ) ) ( not ( = ?auto_639006 ?auto_639011 ) ) ( not ( = ?auto_639006 ?auto_639012 ) ) ( not ( = ?auto_639006 ?auto_639013 ) ) ( not ( = ?auto_639006 ?auto_639014 ) ) ( not ( = ?auto_639006 ?auto_639015 ) ) ( not ( = ?auto_639006 ?auto_639016 ) ) ( not ( = ?auto_639006 ?auto_639017 ) ) ( not ( = ?auto_639006 ?auto_639018 ) ) ( not ( = ?auto_639007 ?auto_639008 ) ) ( not ( = ?auto_639007 ?auto_639009 ) ) ( not ( = ?auto_639007 ?auto_639010 ) ) ( not ( = ?auto_639007 ?auto_639011 ) ) ( not ( = ?auto_639007 ?auto_639012 ) ) ( not ( = ?auto_639007 ?auto_639013 ) ) ( not ( = ?auto_639007 ?auto_639014 ) ) ( not ( = ?auto_639007 ?auto_639015 ) ) ( not ( = ?auto_639007 ?auto_639016 ) ) ( not ( = ?auto_639007 ?auto_639017 ) ) ( not ( = ?auto_639007 ?auto_639018 ) ) ( not ( = ?auto_639008 ?auto_639009 ) ) ( not ( = ?auto_639008 ?auto_639010 ) ) ( not ( = ?auto_639008 ?auto_639011 ) ) ( not ( = ?auto_639008 ?auto_639012 ) ) ( not ( = ?auto_639008 ?auto_639013 ) ) ( not ( = ?auto_639008 ?auto_639014 ) ) ( not ( = ?auto_639008 ?auto_639015 ) ) ( not ( = ?auto_639008 ?auto_639016 ) ) ( not ( = ?auto_639008 ?auto_639017 ) ) ( not ( = ?auto_639008 ?auto_639018 ) ) ( not ( = ?auto_639009 ?auto_639010 ) ) ( not ( = ?auto_639009 ?auto_639011 ) ) ( not ( = ?auto_639009 ?auto_639012 ) ) ( not ( = ?auto_639009 ?auto_639013 ) ) ( not ( = ?auto_639009 ?auto_639014 ) ) ( not ( = ?auto_639009 ?auto_639015 ) ) ( not ( = ?auto_639009 ?auto_639016 ) ) ( not ( = ?auto_639009 ?auto_639017 ) ) ( not ( = ?auto_639009 ?auto_639018 ) ) ( not ( = ?auto_639010 ?auto_639011 ) ) ( not ( = ?auto_639010 ?auto_639012 ) ) ( not ( = ?auto_639010 ?auto_639013 ) ) ( not ( = ?auto_639010 ?auto_639014 ) ) ( not ( = ?auto_639010 ?auto_639015 ) ) ( not ( = ?auto_639010 ?auto_639016 ) ) ( not ( = ?auto_639010 ?auto_639017 ) ) ( not ( = ?auto_639010 ?auto_639018 ) ) ( not ( = ?auto_639011 ?auto_639012 ) ) ( not ( = ?auto_639011 ?auto_639013 ) ) ( not ( = ?auto_639011 ?auto_639014 ) ) ( not ( = ?auto_639011 ?auto_639015 ) ) ( not ( = ?auto_639011 ?auto_639016 ) ) ( not ( = ?auto_639011 ?auto_639017 ) ) ( not ( = ?auto_639011 ?auto_639018 ) ) ( not ( = ?auto_639012 ?auto_639013 ) ) ( not ( = ?auto_639012 ?auto_639014 ) ) ( not ( = ?auto_639012 ?auto_639015 ) ) ( not ( = ?auto_639012 ?auto_639016 ) ) ( not ( = ?auto_639012 ?auto_639017 ) ) ( not ( = ?auto_639012 ?auto_639018 ) ) ( not ( = ?auto_639013 ?auto_639014 ) ) ( not ( = ?auto_639013 ?auto_639015 ) ) ( not ( = ?auto_639013 ?auto_639016 ) ) ( not ( = ?auto_639013 ?auto_639017 ) ) ( not ( = ?auto_639013 ?auto_639018 ) ) ( not ( = ?auto_639014 ?auto_639015 ) ) ( not ( = ?auto_639014 ?auto_639016 ) ) ( not ( = ?auto_639014 ?auto_639017 ) ) ( not ( = ?auto_639014 ?auto_639018 ) ) ( not ( = ?auto_639015 ?auto_639016 ) ) ( not ( = ?auto_639015 ?auto_639017 ) ) ( not ( = ?auto_639015 ?auto_639018 ) ) ( not ( = ?auto_639016 ?auto_639017 ) ) ( not ( = ?auto_639016 ?auto_639018 ) ) ( not ( = ?auto_639017 ?auto_639018 ) ) ( ON ?auto_639016 ?auto_639017 ) ( ON ?auto_639015 ?auto_639016 ) ( ON ?auto_639014 ?auto_639015 ) ( ON ?auto_639013 ?auto_639014 ) ( ON ?auto_639012 ?auto_639013 ) ( CLEAR ?auto_639010 ) ( ON ?auto_639011 ?auto_639012 ) ( CLEAR ?auto_639011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_639004 ?auto_639005 ?auto_639006 ?auto_639007 ?auto_639008 ?auto_639009 ?auto_639010 ?auto_639011 )
      ( MAKE-14PILE ?auto_639004 ?auto_639005 ?auto_639006 ?auto_639007 ?auto_639008 ?auto_639009 ?auto_639010 ?auto_639011 ?auto_639012 ?auto_639013 ?auto_639014 ?auto_639015 ?auto_639016 ?auto_639017 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_639062 - BLOCK
      ?auto_639063 - BLOCK
      ?auto_639064 - BLOCK
      ?auto_639065 - BLOCK
      ?auto_639066 - BLOCK
      ?auto_639067 - BLOCK
      ?auto_639068 - BLOCK
      ?auto_639069 - BLOCK
      ?auto_639070 - BLOCK
      ?auto_639071 - BLOCK
      ?auto_639072 - BLOCK
      ?auto_639073 - BLOCK
      ?auto_639074 - BLOCK
      ?auto_639075 - BLOCK
    )
    :vars
    (
      ?auto_639076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_639075 ?auto_639076 ) ( ON-TABLE ?auto_639062 ) ( ON ?auto_639063 ?auto_639062 ) ( ON ?auto_639064 ?auto_639063 ) ( ON ?auto_639065 ?auto_639064 ) ( ON ?auto_639066 ?auto_639065 ) ( ON ?auto_639067 ?auto_639066 ) ( not ( = ?auto_639062 ?auto_639063 ) ) ( not ( = ?auto_639062 ?auto_639064 ) ) ( not ( = ?auto_639062 ?auto_639065 ) ) ( not ( = ?auto_639062 ?auto_639066 ) ) ( not ( = ?auto_639062 ?auto_639067 ) ) ( not ( = ?auto_639062 ?auto_639068 ) ) ( not ( = ?auto_639062 ?auto_639069 ) ) ( not ( = ?auto_639062 ?auto_639070 ) ) ( not ( = ?auto_639062 ?auto_639071 ) ) ( not ( = ?auto_639062 ?auto_639072 ) ) ( not ( = ?auto_639062 ?auto_639073 ) ) ( not ( = ?auto_639062 ?auto_639074 ) ) ( not ( = ?auto_639062 ?auto_639075 ) ) ( not ( = ?auto_639062 ?auto_639076 ) ) ( not ( = ?auto_639063 ?auto_639064 ) ) ( not ( = ?auto_639063 ?auto_639065 ) ) ( not ( = ?auto_639063 ?auto_639066 ) ) ( not ( = ?auto_639063 ?auto_639067 ) ) ( not ( = ?auto_639063 ?auto_639068 ) ) ( not ( = ?auto_639063 ?auto_639069 ) ) ( not ( = ?auto_639063 ?auto_639070 ) ) ( not ( = ?auto_639063 ?auto_639071 ) ) ( not ( = ?auto_639063 ?auto_639072 ) ) ( not ( = ?auto_639063 ?auto_639073 ) ) ( not ( = ?auto_639063 ?auto_639074 ) ) ( not ( = ?auto_639063 ?auto_639075 ) ) ( not ( = ?auto_639063 ?auto_639076 ) ) ( not ( = ?auto_639064 ?auto_639065 ) ) ( not ( = ?auto_639064 ?auto_639066 ) ) ( not ( = ?auto_639064 ?auto_639067 ) ) ( not ( = ?auto_639064 ?auto_639068 ) ) ( not ( = ?auto_639064 ?auto_639069 ) ) ( not ( = ?auto_639064 ?auto_639070 ) ) ( not ( = ?auto_639064 ?auto_639071 ) ) ( not ( = ?auto_639064 ?auto_639072 ) ) ( not ( = ?auto_639064 ?auto_639073 ) ) ( not ( = ?auto_639064 ?auto_639074 ) ) ( not ( = ?auto_639064 ?auto_639075 ) ) ( not ( = ?auto_639064 ?auto_639076 ) ) ( not ( = ?auto_639065 ?auto_639066 ) ) ( not ( = ?auto_639065 ?auto_639067 ) ) ( not ( = ?auto_639065 ?auto_639068 ) ) ( not ( = ?auto_639065 ?auto_639069 ) ) ( not ( = ?auto_639065 ?auto_639070 ) ) ( not ( = ?auto_639065 ?auto_639071 ) ) ( not ( = ?auto_639065 ?auto_639072 ) ) ( not ( = ?auto_639065 ?auto_639073 ) ) ( not ( = ?auto_639065 ?auto_639074 ) ) ( not ( = ?auto_639065 ?auto_639075 ) ) ( not ( = ?auto_639065 ?auto_639076 ) ) ( not ( = ?auto_639066 ?auto_639067 ) ) ( not ( = ?auto_639066 ?auto_639068 ) ) ( not ( = ?auto_639066 ?auto_639069 ) ) ( not ( = ?auto_639066 ?auto_639070 ) ) ( not ( = ?auto_639066 ?auto_639071 ) ) ( not ( = ?auto_639066 ?auto_639072 ) ) ( not ( = ?auto_639066 ?auto_639073 ) ) ( not ( = ?auto_639066 ?auto_639074 ) ) ( not ( = ?auto_639066 ?auto_639075 ) ) ( not ( = ?auto_639066 ?auto_639076 ) ) ( not ( = ?auto_639067 ?auto_639068 ) ) ( not ( = ?auto_639067 ?auto_639069 ) ) ( not ( = ?auto_639067 ?auto_639070 ) ) ( not ( = ?auto_639067 ?auto_639071 ) ) ( not ( = ?auto_639067 ?auto_639072 ) ) ( not ( = ?auto_639067 ?auto_639073 ) ) ( not ( = ?auto_639067 ?auto_639074 ) ) ( not ( = ?auto_639067 ?auto_639075 ) ) ( not ( = ?auto_639067 ?auto_639076 ) ) ( not ( = ?auto_639068 ?auto_639069 ) ) ( not ( = ?auto_639068 ?auto_639070 ) ) ( not ( = ?auto_639068 ?auto_639071 ) ) ( not ( = ?auto_639068 ?auto_639072 ) ) ( not ( = ?auto_639068 ?auto_639073 ) ) ( not ( = ?auto_639068 ?auto_639074 ) ) ( not ( = ?auto_639068 ?auto_639075 ) ) ( not ( = ?auto_639068 ?auto_639076 ) ) ( not ( = ?auto_639069 ?auto_639070 ) ) ( not ( = ?auto_639069 ?auto_639071 ) ) ( not ( = ?auto_639069 ?auto_639072 ) ) ( not ( = ?auto_639069 ?auto_639073 ) ) ( not ( = ?auto_639069 ?auto_639074 ) ) ( not ( = ?auto_639069 ?auto_639075 ) ) ( not ( = ?auto_639069 ?auto_639076 ) ) ( not ( = ?auto_639070 ?auto_639071 ) ) ( not ( = ?auto_639070 ?auto_639072 ) ) ( not ( = ?auto_639070 ?auto_639073 ) ) ( not ( = ?auto_639070 ?auto_639074 ) ) ( not ( = ?auto_639070 ?auto_639075 ) ) ( not ( = ?auto_639070 ?auto_639076 ) ) ( not ( = ?auto_639071 ?auto_639072 ) ) ( not ( = ?auto_639071 ?auto_639073 ) ) ( not ( = ?auto_639071 ?auto_639074 ) ) ( not ( = ?auto_639071 ?auto_639075 ) ) ( not ( = ?auto_639071 ?auto_639076 ) ) ( not ( = ?auto_639072 ?auto_639073 ) ) ( not ( = ?auto_639072 ?auto_639074 ) ) ( not ( = ?auto_639072 ?auto_639075 ) ) ( not ( = ?auto_639072 ?auto_639076 ) ) ( not ( = ?auto_639073 ?auto_639074 ) ) ( not ( = ?auto_639073 ?auto_639075 ) ) ( not ( = ?auto_639073 ?auto_639076 ) ) ( not ( = ?auto_639074 ?auto_639075 ) ) ( not ( = ?auto_639074 ?auto_639076 ) ) ( not ( = ?auto_639075 ?auto_639076 ) ) ( ON ?auto_639074 ?auto_639075 ) ( ON ?auto_639073 ?auto_639074 ) ( ON ?auto_639072 ?auto_639073 ) ( ON ?auto_639071 ?auto_639072 ) ( ON ?auto_639070 ?auto_639071 ) ( ON ?auto_639069 ?auto_639070 ) ( CLEAR ?auto_639067 ) ( ON ?auto_639068 ?auto_639069 ) ( CLEAR ?auto_639068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_639062 ?auto_639063 ?auto_639064 ?auto_639065 ?auto_639066 ?auto_639067 ?auto_639068 )
      ( MAKE-14PILE ?auto_639062 ?auto_639063 ?auto_639064 ?auto_639065 ?auto_639066 ?auto_639067 ?auto_639068 ?auto_639069 ?auto_639070 ?auto_639071 ?auto_639072 ?auto_639073 ?auto_639074 ?auto_639075 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_639120 - BLOCK
      ?auto_639121 - BLOCK
      ?auto_639122 - BLOCK
      ?auto_639123 - BLOCK
      ?auto_639124 - BLOCK
      ?auto_639125 - BLOCK
      ?auto_639126 - BLOCK
      ?auto_639127 - BLOCK
      ?auto_639128 - BLOCK
      ?auto_639129 - BLOCK
      ?auto_639130 - BLOCK
      ?auto_639131 - BLOCK
      ?auto_639132 - BLOCK
      ?auto_639133 - BLOCK
    )
    :vars
    (
      ?auto_639134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_639133 ?auto_639134 ) ( ON-TABLE ?auto_639120 ) ( ON ?auto_639121 ?auto_639120 ) ( ON ?auto_639122 ?auto_639121 ) ( ON ?auto_639123 ?auto_639122 ) ( ON ?auto_639124 ?auto_639123 ) ( not ( = ?auto_639120 ?auto_639121 ) ) ( not ( = ?auto_639120 ?auto_639122 ) ) ( not ( = ?auto_639120 ?auto_639123 ) ) ( not ( = ?auto_639120 ?auto_639124 ) ) ( not ( = ?auto_639120 ?auto_639125 ) ) ( not ( = ?auto_639120 ?auto_639126 ) ) ( not ( = ?auto_639120 ?auto_639127 ) ) ( not ( = ?auto_639120 ?auto_639128 ) ) ( not ( = ?auto_639120 ?auto_639129 ) ) ( not ( = ?auto_639120 ?auto_639130 ) ) ( not ( = ?auto_639120 ?auto_639131 ) ) ( not ( = ?auto_639120 ?auto_639132 ) ) ( not ( = ?auto_639120 ?auto_639133 ) ) ( not ( = ?auto_639120 ?auto_639134 ) ) ( not ( = ?auto_639121 ?auto_639122 ) ) ( not ( = ?auto_639121 ?auto_639123 ) ) ( not ( = ?auto_639121 ?auto_639124 ) ) ( not ( = ?auto_639121 ?auto_639125 ) ) ( not ( = ?auto_639121 ?auto_639126 ) ) ( not ( = ?auto_639121 ?auto_639127 ) ) ( not ( = ?auto_639121 ?auto_639128 ) ) ( not ( = ?auto_639121 ?auto_639129 ) ) ( not ( = ?auto_639121 ?auto_639130 ) ) ( not ( = ?auto_639121 ?auto_639131 ) ) ( not ( = ?auto_639121 ?auto_639132 ) ) ( not ( = ?auto_639121 ?auto_639133 ) ) ( not ( = ?auto_639121 ?auto_639134 ) ) ( not ( = ?auto_639122 ?auto_639123 ) ) ( not ( = ?auto_639122 ?auto_639124 ) ) ( not ( = ?auto_639122 ?auto_639125 ) ) ( not ( = ?auto_639122 ?auto_639126 ) ) ( not ( = ?auto_639122 ?auto_639127 ) ) ( not ( = ?auto_639122 ?auto_639128 ) ) ( not ( = ?auto_639122 ?auto_639129 ) ) ( not ( = ?auto_639122 ?auto_639130 ) ) ( not ( = ?auto_639122 ?auto_639131 ) ) ( not ( = ?auto_639122 ?auto_639132 ) ) ( not ( = ?auto_639122 ?auto_639133 ) ) ( not ( = ?auto_639122 ?auto_639134 ) ) ( not ( = ?auto_639123 ?auto_639124 ) ) ( not ( = ?auto_639123 ?auto_639125 ) ) ( not ( = ?auto_639123 ?auto_639126 ) ) ( not ( = ?auto_639123 ?auto_639127 ) ) ( not ( = ?auto_639123 ?auto_639128 ) ) ( not ( = ?auto_639123 ?auto_639129 ) ) ( not ( = ?auto_639123 ?auto_639130 ) ) ( not ( = ?auto_639123 ?auto_639131 ) ) ( not ( = ?auto_639123 ?auto_639132 ) ) ( not ( = ?auto_639123 ?auto_639133 ) ) ( not ( = ?auto_639123 ?auto_639134 ) ) ( not ( = ?auto_639124 ?auto_639125 ) ) ( not ( = ?auto_639124 ?auto_639126 ) ) ( not ( = ?auto_639124 ?auto_639127 ) ) ( not ( = ?auto_639124 ?auto_639128 ) ) ( not ( = ?auto_639124 ?auto_639129 ) ) ( not ( = ?auto_639124 ?auto_639130 ) ) ( not ( = ?auto_639124 ?auto_639131 ) ) ( not ( = ?auto_639124 ?auto_639132 ) ) ( not ( = ?auto_639124 ?auto_639133 ) ) ( not ( = ?auto_639124 ?auto_639134 ) ) ( not ( = ?auto_639125 ?auto_639126 ) ) ( not ( = ?auto_639125 ?auto_639127 ) ) ( not ( = ?auto_639125 ?auto_639128 ) ) ( not ( = ?auto_639125 ?auto_639129 ) ) ( not ( = ?auto_639125 ?auto_639130 ) ) ( not ( = ?auto_639125 ?auto_639131 ) ) ( not ( = ?auto_639125 ?auto_639132 ) ) ( not ( = ?auto_639125 ?auto_639133 ) ) ( not ( = ?auto_639125 ?auto_639134 ) ) ( not ( = ?auto_639126 ?auto_639127 ) ) ( not ( = ?auto_639126 ?auto_639128 ) ) ( not ( = ?auto_639126 ?auto_639129 ) ) ( not ( = ?auto_639126 ?auto_639130 ) ) ( not ( = ?auto_639126 ?auto_639131 ) ) ( not ( = ?auto_639126 ?auto_639132 ) ) ( not ( = ?auto_639126 ?auto_639133 ) ) ( not ( = ?auto_639126 ?auto_639134 ) ) ( not ( = ?auto_639127 ?auto_639128 ) ) ( not ( = ?auto_639127 ?auto_639129 ) ) ( not ( = ?auto_639127 ?auto_639130 ) ) ( not ( = ?auto_639127 ?auto_639131 ) ) ( not ( = ?auto_639127 ?auto_639132 ) ) ( not ( = ?auto_639127 ?auto_639133 ) ) ( not ( = ?auto_639127 ?auto_639134 ) ) ( not ( = ?auto_639128 ?auto_639129 ) ) ( not ( = ?auto_639128 ?auto_639130 ) ) ( not ( = ?auto_639128 ?auto_639131 ) ) ( not ( = ?auto_639128 ?auto_639132 ) ) ( not ( = ?auto_639128 ?auto_639133 ) ) ( not ( = ?auto_639128 ?auto_639134 ) ) ( not ( = ?auto_639129 ?auto_639130 ) ) ( not ( = ?auto_639129 ?auto_639131 ) ) ( not ( = ?auto_639129 ?auto_639132 ) ) ( not ( = ?auto_639129 ?auto_639133 ) ) ( not ( = ?auto_639129 ?auto_639134 ) ) ( not ( = ?auto_639130 ?auto_639131 ) ) ( not ( = ?auto_639130 ?auto_639132 ) ) ( not ( = ?auto_639130 ?auto_639133 ) ) ( not ( = ?auto_639130 ?auto_639134 ) ) ( not ( = ?auto_639131 ?auto_639132 ) ) ( not ( = ?auto_639131 ?auto_639133 ) ) ( not ( = ?auto_639131 ?auto_639134 ) ) ( not ( = ?auto_639132 ?auto_639133 ) ) ( not ( = ?auto_639132 ?auto_639134 ) ) ( not ( = ?auto_639133 ?auto_639134 ) ) ( ON ?auto_639132 ?auto_639133 ) ( ON ?auto_639131 ?auto_639132 ) ( ON ?auto_639130 ?auto_639131 ) ( ON ?auto_639129 ?auto_639130 ) ( ON ?auto_639128 ?auto_639129 ) ( ON ?auto_639127 ?auto_639128 ) ( ON ?auto_639126 ?auto_639127 ) ( CLEAR ?auto_639124 ) ( ON ?auto_639125 ?auto_639126 ) ( CLEAR ?auto_639125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_639120 ?auto_639121 ?auto_639122 ?auto_639123 ?auto_639124 ?auto_639125 )
      ( MAKE-14PILE ?auto_639120 ?auto_639121 ?auto_639122 ?auto_639123 ?auto_639124 ?auto_639125 ?auto_639126 ?auto_639127 ?auto_639128 ?auto_639129 ?auto_639130 ?auto_639131 ?auto_639132 ?auto_639133 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_639178 - BLOCK
      ?auto_639179 - BLOCK
      ?auto_639180 - BLOCK
      ?auto_639181 - BLOCK
      ?auto_639182 - BLOCK
      ?auto_639183 - BLOCK
      ?auto_639184 - BLOCK
      ?auto_639185 - BLOCK
      ?auto_639186 - BLOCK
      ?auto_639187 - BLOCK
      ?auto_639188 - BLOCK
      ?auto_639189 - BLOCK
      ?auto_639190 - BLOCK
      ?auto_639191 - BLOCK
    )
    :vars
    (
      ?auto_639192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_639191 ?auto_639192 ) ( ON-TABLE ?auto_639178 ) ( ON ?auto_639179 ?auto_639178 ) ( ON ?auto_639180 ?auto_639179 ) ( ON ?auto_639181 ?auto_639180 ) ( not ( = ?auto_639178 ?auto_639179 ) ) ( not ( = ?auto_639178 ?auto_639180 ) ) ( not ( = ?auto_639178 ?auto_639181 ) ) ( not ( = ?auto_639178 ?auto_639182 ) ) ( not ( = ?auto_639178 ?auto_639183 ) ) ( not ( = ?auto_639178 ?auto_639184 ) ) ( not ( = ?auto_639178 ?auto_639185 ) ) ( not ( = ?auto_639178 ?auto_639186 ) ) ( not ( = ?auto_639178 ?auto_639187 ) ) ( not ( = ?auto_639178 ?auto_639188 ) ) ( not ( = ?auto_639178 ?auto_639189 ) ) ( not ( = ?auto_639178 ?auto_639190 ) ) ( not ( = ?auto_639178 ?auto_639191 ) ) ( not ( = ?auto_639178 ?auto_639192 ) ) ( not ( = ?auto_639179 ?auto_639180 ) ) ( not ( = ?auto_639179 ?auto_639181 ) ) ( not ( = ?auto_639179 ?auto_639182 ) ) ( not ( = ?auto_639179 ?auto_639183 ) ) ( not ( = ?auto_639179 ?auto_639184 ) ) ( not ( = ?auto_639179 ?auto_639185 ) ) ( not ( = ?auto_639179 ?auto_639186 ) ) ( not ( = ?auto_639179 ?auto_639187 ) ) ( not ( = ?auto_639179 ?auto_639188 ) ) ( not ( = ?auto_639179 ?auto_639189 ) ) ( not ( = ?auto_639179 ?auto_639190 ) ) ( not ( = ?auto_639179 ?auto_639191 ) ) ( not ( = ?auto_639179 ?auto_639192 ) ) ( not ( = ?auto_639180 ?auto_639181 ) ) ( not ( = ?auto_639180 ?auto_639182 ) ) ( not ( = ?auto_639180 ?auto_639183 ) ) ( not ( = ?auto_639180 ?auto_639184 ) ) ( not ( = ?auto_639180 ?auto_639185 ) ) ( not ( = ?auto_639180 ?auto_639186 ) ) ( not ( = ?auto_639180 ?auto_639187 ) ) ( not ( = ?auto_639180 ?auto_639188 ) ) ( not ( = ?auto_639180 ?auto_639189 ) ) ( not ( = ?auto_639180 ?auto_639190 ) ) ( not ( = ?auto_639180 ?auto_639191 ) ) ( not ( = ?auto_639180 ?auto_639192 ) ) ( not ( = ?auto_639181 ?auto_639182 ) ) ( not ( = ?auto_639181 ?auto_639183 ) ) ( not ( = ?auto_639181 ?auto_639184 ) ) ( not ( = ?auto_639181 ?auto_639185 ) ) ( not ( = ?auto_639181 ?auto_639186 ) ) ( not ( = ?auto_639181 ?auto_639187 ) ) ( not ( = ?auto_639181 ?auto_639188 ) ) ( not ( = ?auto_639181 ?auto_639189 ) ) ( not ( = ?auto_639181 ?auto_639190 ) ) ( not ( = ?auto_639181 ?auto_639191 ) ) ( not ( = ?auto_639181 ?auto_639192 ) ) ( not ( = ?auto_639182 ?auto_639183 ) ) ( not ( = ?auto_639182 ?auto_639184 ) ) ( not ( = ?auto_639182 ?auto_639185 ) ) ( not ( = ?auto_639182 ?auto_639186 ) ) ( not ( = ?auto_639182 ?auto_639187 ) ) ( not ( = ?auto_639182 ?auto_639188 ) ) ( not ( = ?auto_639182 ?auto_639189 ) ) ( not ( = ?auto_639182 ?auto_639190 ) ) ( not ( = ?auto_639182 ?auto_639191 ) ) ( not ( = ?auto_639182 ?auto_639192 ) ) ( not ( = ?auto_639183 ?auto_639184 ) ) ( not ( = ?auto_639183 ?auto_639185 ) ) ( not ( = ?auto_639183 ?auto_639186 ) ) ( not ( = ?auto_639183 ?auto_639187 ) ) ( not ( = ?auto_639183 ?auto_639188 ) ) ( not ( = ?auto_639183 ?auto_639189 ) ) ( not ( = ?auto_639183 ?auto_639190 ) ) ( not ( = ?auto_639183 ?auto_639191 ) ) ( not ( = ?auto_639183 ?auto_639192 ) ) ( not ( = ?auto_639184 ?auto_639185 ) ) ( not ( = ?auto_639184 ?auto_639186 ) ) ( not ( = ?auto_639184 ?auto_639187 ) ) ( not ( = ?auto_639184 ?auto_639188 ) ) ( not ( = ?auto_639184 ?auto_639189 ) ) ( not ( = ?auto_639184 ?auto_639190 ) ) ( not ( = ?auto_639184 ?auto_639191 ) ) ( not ( = ?auto_639184 ?auto_639192 ) ) ( not ( = ?auto_639185 ?auto_639186 ) ) ( not ( = ?auto_639185 ?auto_639187 ) ) ( not ( = ?auto_639185 ?auto_639188 ) ) ( not ( = ?auto_639185 ?auto_639189 ) ) ( not ( = ?auto_639185 ?auto_639190 ) ) ( not ( = ?auto_639185 ?auto_639191 ) ) ( not ( = ?auto_639185 ?auto_639192 ) ) ( not ( = ?auto_639186 ?auto_639187 ) ) ( not ( = ?auto_639186 ?auto_639188 ) ) ( not ( = ?auto_639186 ?auto_639189 ) ) ( not ( = ?auto_639186 ?auto_639190 ) ) ( not ( = ?auto_639186 ?auto_639191 ) ) ( not ( = ?auto_639186 ?auto_639192 ) ) ( not ( = ?auto_639187 ?auto_639188 ) ) ( not ( = ?auto_639187 ?auto_639189 ) ) ( not ( = ?auto_639187 ?auto_639190 ) ) ( not ( = ?auto_639187 ?auto_639191 ) ) ( not ( = ?auto_639187 ?auto_639192 ) ) ( not ( = ?auto_639188 ?auto_639189 ) ) ( not ( = ?auto_639188 ?auto_639190 ) ) ( not ( = ?auto_639188 ?auto_639191 ) ) ( not ( = ?auto_639188 ?auto_639192 ) ) ( not ( = ?auto_639189 ?auto_639190 ) ) ( not ( = ?auto_639189 ?auto_639191 ) ) ( not ( = ?auto_639189 ?auto_639192 ) ) ( not ( = ?auto_639190 ?auto_639191 ) ) ( not ( = ?auto_639190 ?auto_639192 ) ) ( not ( = ?auto_639191 ?auto_639192 ) ) ( ON ?auto_639190 ?auto_639191 ) ( ON ?auto_639189 ?auto_639190 ) ( ON ?auto_639188 ?auto_639189 ) ( ON ?auto_639187 ?auto_639188 ) ( ON ?auto_639186 ?auto_639187 ) ( ON ?auto_639185 ?auto_639186 ) ( ON ?auto_639184 ?auto_639185 ) ( ON ?auto_639183 ?auto_639184 ) ( CLEAR ?auto_639181 ) ( ON ?auto_639182 ?auto_639183 ) ( CLEAR ?auto_639182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_639178 ?auto_639179 ?auto_639180 ?auto_639181 ?auto_639182 )
      ( MAKE-14PILE ?auto_639178 ?auto_639179 ?auto_639180 ?auto_639181 ?auto_639182 ?auto_639183 ?auto_639184 ?auto_639185 ?auto_639186 ?auto_639187 ?auto_639188 ?auto_639189 ?auto_639190 ?auto_639191 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_639236 - BLOCK
      ?auto_639237 - BLOCK
      ?auto_639238 - BLOCK
      ?auto_639239 - BLOCK
      ?auto_639240 - BLOCK
      ?auto_639241 - BLOCK
      ?auto_639242 - BLOCK
      ?auto_639243 - BLOCK
      ?auto_639244 - BLOCK
      ?auto_639245 - BLOCK
      ?auto_639246 - BLOCK
      ?auto_639247 - BLOCK
      ?auto_639248 - BLOCK
      ?auto_639249 - BLOCK
    )
    :vars
    (
      ?auto_639250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_639249 ?auto_639250 ) ( ON-TABLE ?auto_639236 ) ( ON ?auto_639237 ?auto_639236 ) ( ON ?auto_639238 ?auto_639237 ) ( not ( = ?auto_639236 ?auto_639237 ) ) ( not ( = ?auto_639236 ?auto_639238 ) ) ( not ( = ?auto_639236 ?auto_639239 ) ) ( not ( = ?auto_639236 ?auto_639240 ) ) ( not ( = ?auto_639236 ?auto_639241 ) ) ( not ( = ?auto_639236 ?auto_639242 ) ) ( not ( = ?auto_639236 ?auto_639243 ) ) ( not ( = ?auto_639236 ?auto_639244 ) ) ( not ( = ?auto_639236 ?auto_639245 ) ) ( not ( = ?auto_639236 ?auto_639246 ) ) ( not ( = ?auto_639236 ?auto_639247 ) ) ( not ( = ?auto_639236 ?auto_639248 ) ) ( not ( = ?auto_639236 ?auto_639249 ) ) ( not ( = ?auto_639236 ?auto_639250 ) ) ( not ( = ?auto_639237 ?auto_639238 ) ) ( not ( = ?auto_639237 ?auto_639239 ) ) ( not ( = ?auto_639237 ?auto_639240 ) ) ( not ( = ?auto_639237 ?auto_639241 ) ) ( not ( = ?auto_639237 ?auto_639242 ) ) ( not ( = ?auto_639237 ?auto_639243 ) ) ( not ( = ?auto_639237 ?auto_639244 ) ) ( not ( = ?auto_639237 ?auto_639245 ) ) ( not ( = ?auto_639237 ?auto_639246 ) ) ( not ( = ?auto_639237 ?auto_639247 ) ) ( not ( = ?auto_639237 ?auto_639248 ) ) ( not ( = ?auto_639237 ?auto_639249 ) ) ( not ( = ?auto_639237 ?auto_639250 ) ) ( not ( = ?auto_639238 ?auto_639239 ) ) ( not ( = ?auto_639238 ?auto_639240 ) ) ( not ( = ?auto_639238 ?auto_639241 ) ) ( not ( = ?auto_639238 ?auto_639242 ) ) ( not ( = ?auto_639238 ?auto_639243 ) ) ( not ( = ?auto_639238 ?auto_639244 ) ) ( not ( = ?auto_639238 ?auto_639245 ) ) ( not ( = ?auto_639238 ?auto_639246 ) ) ( not ( = ?auto_639238 ?auto_639247 ) ) ( not ( = ?auto_639238 ?auto_639248 ) ) ( not ( = ?auto_639238 ?auto_639249 ) ) ( not ( = ?auto_639238 ?auto_639250 ) ) ( not ( = ?auto_639239 ?auto_639240 ) ) ( not ( = ?auto_639239 ?auto_639241 ) ) ( not ( = ?auto_639239 ?auto_639242 ) ) ( not ( = ?auto_639239 ?auto_639243 ) ) ( not ( = ?auto_639239 ?auto_639244 ) ) ( not ( = ?auto_639239 ?auto_639245 ) ) ( not ( = ?auto_639239 ?auto_639246 ) ) ( not ( = ?auto_639239 ?auto_639247 ) ) ( not ( = ?auto_639239 ?auto_639248 ) ) ( not ( = ?auto_639239 ?auto_639249 ) ) ( not ( = ?auto_639239 ?auto_639250 ) ) ( not ( = ?auto_639240 ?auto_639241 ) ) ( not ( = ?auto_639240 ?auto_639242 ) ) ( not ( = ?auto_639240 ?auto_639243 ) ) ( not ( = ?auto_639240 ?auto_639244 ) ) ( not ( = ?auto_639240 ?auto_639245 ) ) ( not ( = ?auto_639240 ?auto_639246 ) ) ( not ( = ?auto_639240 ?auto_639247 ) ) ( not ( = ?auto_639240 ?auto_639248 ) ) ( not ( = ?auto_639240 ?auto_639249 ) ) ( not ( = ?auto_639240 ?auto_639250 ) ) ( not ( = ?auto_639241 ?auto_639242 ) ) ( not ( = ?auto_639241 ?auto_639243 ) ) ( not ( = ?auto_639241 ?auto_639244 ) ) ( not ( = ?auto_639241 ?auto_639245 ) ) ( not ( = ?auto_639241 ?auto_639246 ) ) ( not ( = ?auto_639241 ?auto_639247 ) ) ( not ( = ?auto_639241 ?auto_639248 ) ) ( not ( = ?auto_639241 ?auto_639249 ) ) ( not ( = ?auto_639241 ?auto_639250 ) ) ( not ( = ?auto_639242 ?auto_639243 ) ) ( not ( = ?auto_639242 ?auto_639244 ) ) ( not ( = ?auto_639242 ?auto_639245 ) ) ( not ( = ?auto_639242 ?auto_639246 ) ) ( not ( = ?auto_639242 ?auto_639247 ) ) ( not ( = ?auto_639242 ?auto_639248 ) ) ( not ( = ?auto_639242 ?auto_639249 ) ) ( not ( = ?auto_639242 ?auto_639250 ) ) ( not ( = ?auto_639243 ?auto_639244 ) ) ( not ( = ?auto_639243 ?auto_639245 ) ) ( not ( = ?auto_639243 ?auto_639246 ) ) ( not ( = ?auto_639243 ?auto_639247 ) ) ( not ( = ?auto_639243 ?auto_639248 ) ) ( not ( = ?auto_639243 ?auto_639249 ) ) ( not ( = ?auto_639243 ?auto_639250 ) ) ( not ( = ?auto_639244 ?auto_639245 ) ) ( not ( = ?auto_639244 ?auto_639246 ) ) ( not ( = ?auto_639244 ?auto_639247 ) ) ( not ( = ?auto_639244 ?auto_639248 ) ) ( not ( = ?auto_639244 ?auto_639249 ) ) ( not ( = ?auto_639244 ?auto_639250 ) ) ( not ( = ?auto_639245 ?auto_639246 ) ) ( not ( = ?auto_639245 ?auto_639247 ) ) ( not ( = ?auto_639245 ?auto_639248 ) ) ( not ( = ?auto_639245 ?auto_639249 ) ) ( not ( = ?auto_639245 ?auto_639250 ) ) ( not ( = ?auto_639246 ?auto_639247 ) ) ( not ( = ?auto_639246 ?auto_639248 ) ) ( not ( = ?auto_639246 ?auto_639249 ) ) ( not ( = ?auto_639246 ?auto_639250 ) ) ( not ( = ?auto_639247 ?auto_639248 ) ) ( not ( = ?auto_639247 ?auto_639249 ) ) ( not ( = ?auto_639247 ?auto_639250 ) ) ( not ( = ?auto_639248 ?auto_639249 ) ) ( not ( = ?auto_639248 ?auto_639250 ) ) ( not ( = ?auto_639249 ?auto_639250 ) ) ( ON ?auto_639248 ?auto_639249 ) ( ON ?auto_639247 ?auto_639248 ) ( ON ?auto_639246 ?auto_639247 ) ( ON ?auto_639245 ?auto_639246 ) ( ON ?auto_639244 ?auto_639245 ) ( ON ?auto_639243 ?auto_639244 ) ( ON ?auto_639242 ?auto_639243 ) ( ON ?auto_639241 ?auto_639242 ) ( ON ?auto_639240 ?auto_639241 ) ( CLEAR ?auto_639238 ) ( ON ?auto_639239 ?auto_639240 ) ( CLEAR ?auto_639239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_639236 ?auto_639237 ?auto_639238 ?auto_639239 )
      ( MAKE-14PILE ?auto_639236 ?auto_639237 ?auto_639238 ?auto_639239 ?auto_639240 ?auto_639241 ?auto_639242 ?auto_639243 ?auto_639244 ?auto_639245 ?auto_639246 ?auto_639247 ?auto_639248 ?auto_639249 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_639294 - BLOCK
      ?auto_639295 - BLOCK
      ?auto_639296 - BLOCK
      ?auto_639297 - BLOCK
      ?auto_639298 - BLOCK
      ?auto_639299 - BLOCK
      ?auto_639300 - BLOCK
      ?auto_639301 - BLOCK
      ?auto_639302 - BLOCK
      ?auto_639303 - BLOCK
      ?auto_639304 - BLOCK
      ?auto_639305 - BLOCK
      ?auto_639306 - BLOCK
      ?auto_639307 - BLOCK
    )
    :vars
    (
      ?auto_639308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_639307 ?auto_639308 ) ( ON-TABLE ?auto_639294 ) ( ON ?auto_639295 ?auto_639294 ) ( not ( = ?auto_639294 ?auto_639295 ) ) ( not ( = ?auto_639294 ?auto_639296 ) ) ( not ( = ?auto_639294 ?auto_639297 ) ) ( not ( = ?auto_639294 ?auto_639298 ) ) ( not ( = ?auto_639294 ?auto_639299 ) ) ( not ( = ?auto_639294 ?auto_639300 ) ) ( not ( = ?auto_639294 ?auto_639301 ) ) ( not ( = ?auto_639294 ?auto_639302 ) ) ( not ( = ?auto_639294 ?auto_639303 ) ) ( not ( = ?auto_639294 ?auto_639304 ) ) ( not ( = ?auto_639294 ?auto_639305 ) ) ( not ( = ?auto_639294 ?auto_639306 ) ) ( not ( = ?auto_639294 ?auto_639307 ) ) ( not ( = ?auto_639294 ?auto_639308 ) ) ( not ( = ?auto_639295 ?auto_639296 ) ) ( not ( = ?auto_639295 ?auto_639297 ) ) ( not ( = ?auto_639295 ?auto_639298 ) ) ( not ( = ?auto_639295 ?auto_639299 ) ) ( not ( = ?auto_639295 ?auto_639300 ) ) ( not ( = ?auto_639295 ?auto_639301 ) ) ( not ( = ?auto_639295 ?auto_639302 ) ) ( not ( = ?auto_639295 ?auto_639303 ) ) ( not ( = ?auto_639295 ?auto_639304 ) ) ( not ( = ?auto_639295 ?auto_639305 ) ) ( not ( = ?auto_639295 ?auto_639306 ) ) ( not ( = ?auto_639295 ?auto_639307 ) ) ( not ( = ?auto_639295 ?auto_639308 ) ) ( not ( = ?auto_639296 ?auto_639297 ) ) ( not ( = ?auto_639296 ?auto_639298 ) ) ( not ( = ?auto_639296 ?auto_639299 ) ) ( not ( = ?auto_639296 ?auto_639300 ) ) ( not ( = ?auto_639296 ?auto_639301 ) ) ( not ( = ?auto_639296 ?auto_639302 ) ) ( not ( = ?auto_639296 ?auto_639303 ) ) ( not ( = ?auto_639296 ?auto_639304 ) ) ( not ( = ?auto_639296 ?auto_639305 ) ) ( not ( = ?auto_639296 ?auto_639306 ) ) ( not ( = ?auto_639296 ?auto_639307 ) ) ( not ( = ?auto_639296 ?auto_639308 ) ) ( not ( = ?auto_639297 ?auto_639298 ) ) ( not ( = ?auto_639297 ?auto_639299 ) ) ( not ( = ?auto_639297 ?auto_639300 ) ) ( not ( = ?auto_639297 ?auto_639301 ) ) ( not ( = ?auto_639297 ?auto_639302 ) ) ( not ( = ?auto_639297 ?auto_639303 ) ) ( not ( = ?auto_639297 ?auto_639304 ) ) ( not ( = ?auto_639297 ?auto_639305 ) ) ( not ( = ?auto_639297 ?auto_639306 ) ) ( not ( = ?auto_639297 ?auto_639307 ) ) ( not ( = ?auto_639297 ?auto_639308 ) ) ( not ( = ?auto_639298 ?auto_639299 ) ) ( not ( = ?auto_639298 ?auto_639300 ) ) ( not ( = ?auto_639298 ?auto_639301 ) ) ( not ( = ?auto_639298 ?auto_639302 ) ) ( not ( = ?auto_639298 ?auto_639303 ) ) ( not ( = ?auto_639298 ?auto_639304 ) ) ( not ( = ?auto_639298 ?auto_639305 ) ) ( not ( = ?auto_639298 ?auto_639306 ) ) ( not ( = ?auto_639298 ?auto_639307 ) ) ( not ( = ?auto_639298 ?auto_639308 ) ) ( not ( = ?auto_639299 ?auto_639300 ) ) ( not ( = ?auto_639299 ?auto_639301 ) ) ( not ( = ?auto_639299 ?auto_639302 ) ) ( not ( = ?auto_639299 ?auto_639303 ) ) ( not ( = ?auto_639299 ?auto_639304 ) ) ( not ( = ?auto_639299 ?auto_639305 ) ) ( not ( = ?auto_639299 ?auto_639306 ) ) ( not ( = ?auto_639299 ?auto_639307 ) ) ( not ( = ?auto_639299 ?auto_639308 ) ) ( not ( = ?auto_639300 ?auto_639301 ) ) ( not ( = ?auto_639300 ?auto_639302 ) ) ( not ( = ?auto_639300 ?auto_639303 ) ) ( not ( = ?auto_639300 ?auto_639304 ) ) ( not ( = ?auto_639300 ?auto_639305 ) ) ( not ( = ?auto_639300 ?auto_639306 ) ) ( not ( = ?auto_639300 ?auto_639307 ) ) ( not ( = ?auto_639300 ?auto_639308 ) ) ( not ( = ?auto_639301 ?auto_639302 ) ) ( not ( = ?auto_639301 ?auto_639303 ) ) ( not ( = ?auto_639301 ?auto_639304 ) ) ( not ( = ?auto_639301 ?auto_639305 ) ) ( not ( = ?auto_639301 ?auto_639306 ) ) ( not ( = ?auto_639301 ?auto_639307 ) ) ( not ( = ?auto_639301 ?auto_639308 ) ) ( not ( = ?auto_639302 ?auto_639303 ) ) ( not ( = ?auto_639302 ?auto_639304 ) ) ( not ( = ?auto_639302 ?auto_639305 ) ) ( not ( = ?auto_639302 ?auto_639306 ) ) ( not ( = ?auto_639302 ?auto_639307 ) ) ( not ( = ?auto_639302 ?auto_639308 ) ) ( not ( = ?auto_639303 ?auto_639304 ) ) ( not ( = ?auto_639303 ?auto_639305 ) ) ( not ( = ?auto_639303 ?auto_639306 ) ) ( not ( = ?auto_639303 ?auto_639307 ) ) ( not ( = ?auto_639303 ?auto_639308 ) ) ( not ( = ?auto_639304 ?auto_639305 ) ) ( not ( = ?auto_639304 ?auto_639306 ) ) ( not ( = ?auto_639304 ?auto_639307 ) ) ( not ( = ?auto_639304 ?auto_639308 ) ) ( not ( = ?auto_639305 ?auto_639306 ) ) ( not ( = ?auto_639305 ?auto_639307 ) ) ( not ( = ?auto_639305 ?auto_639308 ) ) ( not ( = ?auto_639306 ?auto_639307 ) ) ( not ( = ?auto_639306 ?auto_639308 ) ) ( not ( = ?auto_639307 ?auto_639308 ) ) ( ON ?auto_639306 ?auto_639307 ) ( ON ?auto_639305 ?auto_639306 ) ( ON ?auto_639304 ?auto_639305 ) ( ON ?auto_639303 ?auto_639304 ) ( ON ?auto_639302 ?auto_639303 ) ( ON ?auto_639301 ?auto_639302 ) ( ON ?auto_639300 ?auto_639301 ) ( ON ?auto_639299 ?auto_639300 ) ( ON ?auto_639298 ?auto_639299 ) ( ON ?auto_639297 ?auto_639298 ) ( CLEAR ?auto_639295 ) ( ON ?auto_639296 ?auto_639297 ) ( CLEAR ?auto_639296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_639294 ?auto_639295 ?auto_639296 )
      ( MAKE-14PILE ?auto_639294 ?auto_639295 ?auto_639296 ?auto_639297 ?auto_639298 ?auto_639299 ?auto_639300 ?auto_639301 ?auto_639302 ?auto_639303 ?auto_639304 ?auto_639305 ?auto_639306 ?auto_639307 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_639352 - BLOCK
      ?auto_639353 - BLOCK
      ?auto_639354 - BLOCK
      ?auto_639355 - BLOCK
      ?auto_639356 - BLOCK
      ?auto_639357 - BLOCK
      ?auto_639358 - BLOCK
      ?auto_639359 - BLOCK
      ?auto_639360 - BLOCK
      ?auto_639361 - BLOCK
      ?auto_639362 - BLOCK
      ?auto_639363 - BLOCK
      ?auto_639364 - BLOCK
      ?auto_639365 - BLOCK
    )
    :vars
    (
      ?auto_639366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_639365 ?auto_639366 ) ( ON-TABLE ?auto_639352 ) ( not ( = ?auto_639352 ?auto_639353 ) ) ( not ( = ?auto_639352 ?auto_639354 ) ) ( not ( = ?auto_639352 ?auto_639355 ) ) ( not ( = ?auto_639352 ?auto_639356 ) ) ( not ( = ?auto_639352 ?auto_639357 ) ) ( not ( = ?auto_639352 ?auto_639358 ) ) ( not ( = ?auto_639352 ?auto_639359 ) ) ( not ( = ?auto_639352 ?auto_639360 ) ) ( not ( = ?auto_639352 ?auto_639361 ) ) ( not ( = ?auto_639352 ?auto_639362 ) ) ( not ( = ?auto_639352 ?auto_639363 ) ) ( not ( = ?auto_639352 ?auto_639364 ) ) ( not ( = ?auto_639352 ?auto_639365 ) ) ( not ( = ?auto_639352 ?auto_639366 ) ) ( not ( = ?auto_639353 ?auto_639354 ) ) ( not ( = ?auto_639353 ?auto_639355 ) ) ( not ( = ?auto_639353 ?auto_639356 ) ) ( not ( = ?auto_639353 ?auto_639357 ) ) ( not ( = ?auto_639353 ?auto_639358 ) ) ( not ( = ?auto_639353 ?auto_639359 ) ) ( not ( = ?auto_639353 ?auto_639360 ) ) ( not ( = ?auto_639353 ?auto_639361 ) ) ( not ( = ?auto_639353 ?auto_639362 ) ) ( not ( = ?auto_639353 ?auto_639363 ) ) ( not ( = ?auto_639353 ?auto_639364 ) ) ( not ( = ?auto_639353 ?auto_639365 ) ) ( not ( = ?auto_639353 ?auto_639366 ) ) ( not ( = ?auto_639354 ?auto_639355 ) ) ( not ( = ?auto_639354 ?auto_639356 ) ) ( not ( = ?auto_639354 ?auto_639357 ) ) ( not ( = ?auto_639354 ?auto_639358 ) ) ( not ( = ?auto_639354 ?auto_639359 ) ) ( not ( = ?auto_639354 ?auto_639360 ) ) ( not ( = ?auto_639354 ?auto_639361 ) ) ( not ( = ?auto_639354 ?auto_639362 ) ) ( not ( = ?auto_639354 ?auto_639363 ) ) ( not ( = ?auto_639354 ?auto_639364 ) ) ( not ( = ?auto_639354 ?auto_639365 ) ) ( not ( = ?auto_639354 ?auto_639366 ) ) ( not ( = ?auto_639355 ?auto_639356 ) ) ( not ( = ?auto_639355 ?auto_639357 ) ) ( not ( = ?auto_639355 ?auto_639358 ) ) ( not ( = ?auto_639355 ?auto_639359 ) ) ( not ( = ?auto_639355 ?auto_639360 ) ) ( not ( = ?auto_639355 ?auto_639361 ) ) ( not ( = ?auto_639355 ?auto_639362 ) ) ( not ( = ?auto_639355 ?auto_639363 ) ) ( not ( = ?auto_639355 ?auto_639364 ) ) ( not ( = ?auto_639355 ?auto_639365 ) ) ( not ( = ?auto_639355 ?auto_639366 ) ) ( not ( = ?auto_639356 ?auto_639357 ) ) ( not ( = ?auto_639356 ?auto_639358 ) ) ( not ( = ?auto_639356 ?auto_639359 ) ) ( not ( = ?auto_639356 ?auto_639360 ) ) ( not ( = ?auto_639356 ?auto_639361 ) ) ( not ( = ?auto_639356 ?auto_639362 ) ) ( not ( = ?auto_639356 ?auto_639363 ) ) ( not ( = ?auto_639356 ?auto_639364 ) ) ( not ( = ?auto_639356 ?auto_639365 ) ) ( not ( = ?auto_639356 ?auto_639366 ) ) ( not ( = ?auto_639357 ?auto_639358 ) ) ( not ( = ?auto_639357 ?auto_639359 ) ) ( not ( = ?auto_639357 ?auto_639360 ) ) ( not ( = ?auto_639357 ?auto_639361 ) ) ( not ( = ?auto_639357 ?auto_639362 ) ) ( not ( = ?auto_639357 ?auto_639363 ) ) ( not ( = ?auto_639357 ?auto_639364 ) ) ( not ( = ?auto_639357 ?auto_639365 ) ) ( not ( = ?auto_639357 ?auto_639366 ) ) ( not ( = ?auto_639358 ?auto_639359 ) ) ( not ( = ?auto_639358 ?auto_639360 ) ) ( not ( = ?auto_639358 ?auto_639361 ) ) ( not ( = ?auto_639358 ?auto_639362 ) ) ( not ( = ?auto_639358 ?auto_639363 ) ) ( not ( = ?auto_639358 ?auto_639364 ) ) ( not ( = ?auto_639358 ?auto_639365 ) ) ( not ( = ?auto_639358 ?auto_639366 ) ) ( not ( = ?auto_639359 ?auto_639360 ) ) ( not ( = ?auto_639359 ?auto_639361 ) ) ( not ( = ?auto_639359 ?auto_639362 ) ) ( not ( = ?auto_639359 ?auto_639363 ) ) ( not ( = ?auto_639359 ?auto_639364 ) ) ( not ( = ?auto_639359 ?auto_639365 ) ) ( not ( = ?auto_639359 ?auto_639366 ) ) ( not ( = ?auto_639360 ?auto_639361 ) ) ( not ( = ?auto_639360 ?auto_639362 ) ) ( not ( = ?auto_639360 ?auto_639363 ) ) ( not ( = ?auto_639360 ?auto_639364 ) ) ( not ( = ?auto_639360 ?auto_639365 ) ) ( not ( = ?auto_639360 ?auto_639366 ) ) ( not ( = ?auto_639361 ?auto_639362 ) ) ( not ( = ?auto_639361 ?auto_639363 ) ) ( not ( = ?auto_639361 ?auto_639364 ) ) ( not ( = ?auto_639361 ?auto_639365 ) ) ( not ( = ?auto_639361 ?auto_639366 ) ) ( not ( = ?auto_639362 ?auto_639363 ) ) ( not ( = ?auto_639362 ?auto_639364 ) ) ( not ( = ?auto_639362 ?auto_639365 ) ) ( not ( = ?auto_639362 ?auto_639366 ) ) ( not ( = ?auto_639363 ?auto_639364 ) ) ( not ( = ?auto_639363 ?auto_639365 ) ) ( not ( = ?auto_639363 ?auto_639366 ) ) ( not ( = ?auto_639364 ?auto_639365 ) ) ( not ( = ?auto_639364 ?auto_639366 ) ) ( not ( = ?auto_639365 ?auto_639366 ) ) ( ON ?auto_639364 ?auto_639365 ) ( ON ?auto_639363 ?auto_639364 ) ( ON ?auto_639362 ?auto_639363 ) ( ON ?auto_639361 ?auto_639362 ) ( ON ?auto_639360 ?auto_639361 ) ( ON ?auto_639359 ?auto_639360 ) ( ON ?auto_639358 ?auto_639359 ) ( ON ?auto_639357 ?auto_639358 ) ( ON ?auto_639356 ?auto_639357 ) ( ON ?auto_639355 ?auto_639356 ) ( ON ?auto_639354 ?auto_639355 ) ( CLEAR ?auto_639352 ) ( ON ?auto_639353 ?auto_639354 ) ( CLEAR ?auto_639353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_639352 ?auto_639353 )
      ( MAKE-14PILE ?auto_639352 ?auto_639353 ?auto_639354 ?auto_639355 ?auto_639356 ?auto_639357 ?auto_639358 ?auto_639359 ?auto_639360 ?auto_639361 ?auto_639362 ?auto_639363 ?auto_639364 ?auto_639365 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_639410 - BLOCK
      ?auto_639411 - BLOCK
      ?auto_639412 - BLOCK
      ?auto_639413 - BLOCK
      ?auto_639414 - BLOCK
      ?auto_639415 - BLOCK
      ?auto_639416 - BLOCK
      ?auto_639417 - BLOCK
      ?auto_639418 - BLOCK
      ?auto_639419 - BLOCK
      ?auto_639420 - BLOCK
      ?auto_639421 - BLOCK
      ?auto_639422 - BLOCK
      ?auto_639423 - BLOCK
    )
    :vars
    (
      ?auto_639424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_639423 ?auto_639424 ) ( not ( = ?auto_639410 ?auto_639411 ) ) ( not ( = ?auto_639410 ?auto_639412 ) ) ( not ( = ?auto_639410 ?auto_639413 ) ) ( not ( = ?auto_639410 ?auto_639414 ) ) ( not ( = ?auto_639410 ?auto_639415 ) ) ( not ( = ?auto_639410 ?auto_639416 ) ) ( not ( = ?auto_639410 ?auto_639417 ) ) ( not ( = ?auto_639410 ?auto_639418 ) ) ( not ( = ?auto_639410 ?auto_639419 ) ) ( not ( = ?auto_639410 ?auto_639420 ) ) ( not ( = ?auto_639410 ?auto_639421 ) ) ( not ( = ?auto_639410 ?auto_639422 ) ) ( not ( = ?auto_639410 ?auto_639423 ) ) ( not ( = ?auto_639410 ?auto_639424 ) ) ( not ( = ?auto_639411 ?auto_639412 ) ) ( not ( = ?auto_639411 ?auto_639413 ) ) ( not ( = ?auto_639411 ?auto_639414 ) ) ( not ( = ?auto_639411 ?auto_639415 ) ) ( not ( = ?auto_639411 ?auto_639416 ) ) ( not ( = ?auto_639411 ?auto_639417 ) ) ( not ( = ?auto_639411 ?auto_639418 ) ) ( not ( = ?auto_639411 ?auto_639419 ) ) ( not ( = ?auto_639411 ?auto_639420 ) ) ( not ( = ?auto_639411 ?auto_639421 ) ) ( not ( = ?auto_639411 ?auto_639422 ) ) ( not ( = ?auto_639411 ?auto_639423 ) ) ( not ( = ?auto_639411 ?auto_639424 ) ) ( not ( = ?auto_639412 ?auto_639413 ) ) ( not ( = ?auto_639412 ?auto_639414 ) ) ( not ( = ?auto_639412 ?auto_639415 ) ) ( not ( = ?auto_639412 ?auto_639416 ) ) ( not ( = ?auto_639412 ?auto_639417 ) ) ( not ( = ?auto_639412 ?auto_639418 ) ) ( not ( = ?auto_639412 ?auto_639419 ) ) ( not ( = ?auto_639412 ?auto_639420 ) ) ( not ( = ?auto_639412 ?auto_639421 ) ) ( not ( = ?auto_639412 ?auto_639422 ) ) ( not ( = ?auto_639412 ?auto_639423 ) ) ( not ( = ?auto_639412 ?auto_639424 ) ) ( not ( = ?auto_639413 ?auto_639414 ) ) ( not ( = ?auto_639413 ?auto_639415 ) ) ( not ( = ?auto_639413 ?auto_639416 ) ) ( not ( = ?auto_639413 ?auto_639417 ) ) ( not ( = ?auto_639413 ?auto_639418 ) ) ( not ( = ?auto_639413 ?auto_639419 ) ) ( not ( = ?auto_639413 ?auto_639420 ) ) ( not ( = ?auto_639413 ?auto_639421 ) ) ( not ( = ?auto_639413 ?auto_639422 ) ) ( not ( = ?auto_639413 ?auto_639423 ) ) ( not ( = ?auto_639413 ?auto_639424 ) ) ( not ( = ?auto_639414 ?auto_639415 ) ) ( not ( = ?auto_639414 ?auto_639416 ) ) ( not ( = ?auto_639414 ?auto_639417 ) ) ( not ( = ?auto_639414 ?auto_639418 ) ) ( not ( = ?auto_639414 ?auto_639419 ) ) ( not ( = ?auto_639414 ?auto_639420 ) ) ( not ( = ?auto_639414 ?auto_639421 ) ) ( not ( = ?auto_639414 ?auto_639422 ) ) ( not ( = ?auto_639414 ?auto_639423 ) ) ( not ( = ?auto_639414 ?auto_639424 ) ) ( not ( = ?auto_639415 ?auto_639416 ) ) ( not ( = ?auto_639415 ?auto_639417 ) ) ( not ( = ?auto_639415 ?auto_639418 ) ) ( not ( = ?auto_639415 ?auto_639419 ) ) ( not ( = ?auto_639415 ?auto_639420 ) ) ( not ( = ?auto_639415 ?auto_639421 ) ) ( not ( = ?auto_639415 ?auto_639422 ) ) ( not ( = ?auto_639415 ?auto_639423 ) ) ( not ( = ?auto_639415 ?auto_639424 ) ) ( not ( = ?auto_639416 ?auto_639417 ) ) ( not ( = ?auto_639416 ?auto_639418 ) ) ( not ( = ?auto_639416 ?auto_639419 ) ) ( not ( = ?auto_639416 ?auto_639420 ) ) ( not ( = ?auto_639416 ?auto_639421 ) ) ( not ( = ?auto_639416 ?auto_639422 ) ) ( not ( = ?auto_639416 ?auto_639423 ) ) ( not ( = ?auto_639416 ?auto_639424 ) ) ( not ( = ?auto_639417 ?auto_639418 ) ) ( not ( = ?auto_639417 ?auto_639419 ) ) ( not ( = ?auto_639417 ?auto_639420 ) ) ( not ( = ?auto_639417 ?auto_639421 ) ) ( not ( = ?auto_639417 ?auto_639422 ) ) ( not ( = ?auto_639417 ?auto_639423 ) ) ( not ( = ?auto_639417 ?auto_639424 ) ) ( not ( = ?auto_639418 ?auto_639419 ) ) ( not ( = ?auto_639418 ?auto_639420 ) ) ( not ( = ?auto_639418 ?auto_639421 ) ) ( not ( = ?auto_639418 ?auto_639422 ) ) ( not ( = ?auto_639418 ?auto_639423 ) ) ( not ( = ?auto_639418 ?auto_639424 ) ) ( not ( = ?auto_639419 ?auto_639420 ) ) ( not ( = ?auto_639419 ?auto_639421 ) ) ( not ( = ?auto_639419 ?auto_639422 ) ) ( not ( = ?auto_639419 ?auto_639423 ) ) ( not ( = ?auto_639419 ?auto_639424 ) ) ( not ( = ?auto_639420 ?auto_639421 ) ) ( not ( = ?auto_639420 ?auto_639422 ) ) ( not ( = ?auto_639420 ?auto_639423 ) ) ( not ( = ?auto_639420 ?auto_639424 ) ) ( not ( = ?auto_639421 ?auto_639422 ) ) ( not ( = ?auto_639421 ?auto_639423 ) ) ( not ( = ?auto_639421 ?auto_639424 ) ) ( not ( = ?auto_639422 ?auto_639423 ) ) ( not ( = ?auto_639422 ?auto_639424 ) ) ( not ( = ?auto_639423 ?auto_639424 ) ) ( ON ?auto_639422 ?auto_639423 ) ( ON ?auto_639421 ?auto_639422 ) ( ON ?auto_639420 ?auto_639421 ) ( ON ?auto_639419 ?auto_639420 ) ( ON ?auto_639418 ?auto_639419 ) ( ON ?auto_639417 ?auto_639418 ) ( ON ?auto_639416 ?auto_639417 ) ( ON ?auto_639415 ?auto_639416 ) ( ON ?auto_639414 ?auto_639415 ) ( ON ?auto_639413 ?auto_639414 ) ( ON ?auto_639412 ?auto_639413 ) ( ON ?auto_639411 ?auto_639412 ) ( ON ?auto_639410 ?auto_639411 ) ( CLEAR ?auto_639410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_639410 )
      ( MAKE-14PILE ?auto_639410 ?auto_639411 ?auto_639412 ?auto_639413 ?auto_639414 ?auto_639415 ?auto_639416 ?auto_639417 ?auto_639418 ?auto_639419 ?auto_639420 ?auto_639421 ?auto_639422 ?auto_639423 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_639469 - BLOCK
      ?auto_639470 - BLOCK
      ?auto_639471 - BLOCK
      ?auto_639472 - BLOCK
      ?auto_639473 - BLOCK
      ?auto_639474 - BLOCK
      ?auto_639475 - BLOCK
      ?auto_639476 - BLOCK
      ?auto_639477 - BLOCK
      ?auto_639478 - BLOCK
      ?auto_639479 - BLOCK
      ?auto_639480 - BLOCK
      ?auto_639481 - BLOCK
      ?auto_639482 - BLOCK
      ?auto_639483 - BLOCK
    )
    :vars
    (
      ?auto_639484 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_639482 ) ( ON ?auto_639483 ?auto_639484 ) ( CLEAR ?auto_639483 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_639469 ) ( ON ?auto_639470 ?auto_639469 ) ( ON ?auto_639471 ?auto_639470 ) ( ON ?auto_639472 ?auto_639471 ) ( ON ?auto_639473 ?auto_639472 ) ( ON ?auto_639474 ?auto_639473 ) ( ON ?auto_639475 ?auto_639474 ) ( ON ?auto_639476 ?auto_639475 ) ( ON ?auto_639477 ?auto_639476 ) ( ON ?auto_639478 ?auto_639477 ) ( ON ?auto_639479 ?auto_639478 ) ( ON ?auto_639480 ?auto_639479 ) ( ON ?auto_639481 ?auto_639480 ) ( ON ?auto_639482 ?auto_639481 ) ( not ( = ?auto_639469 ?auto_639470 ) ) ( not ( = ?auto_639469 ?auto_639471 ) ) ( not ( = ?auto_639469 ?auto_639472 ) ) ( not ( = ?auto_639469 ?auto_639473 ) ) ( not ( = ?auto_639469 ?auto_639474 ) ) ( not ( = ?auto_639469 ?auto_639475 ) ) ( not ( = ?auto_639469 ?auto_639476 ) ) ( not ( = ?auto_639469 ?auto_639477 ) ) ( not ( = ?auto_639469 ?auto_639478 ) ) ( not ( = ?auto_639469 ?auto_639479 ) ) ( not ( = ?auto_639469 ?auto_639480 ) ) ( not ( = ?auto_639469 ?auto_639481 ) ) ( not ( = ?auto_639469 ?auto_639482 ) ) ( not ( = ?auto_639469 ?auto_639483 ) ) ( not ( = ?auto_639469 ?auto_639484 ) ) ( not ( = ?auto_639470 ?auto_639471 ) ) ( not ( = ?auto_639470 ?auto_639472 ) ) ( not ( = ?auto_639470 ?auto_639473 ) ) ( not ( = ?auto_639470 ?auto_639474 ) ) ( not ( = ?auto_639470 ?auto_639475 ) ) ( not ( = ?auto_639470 ?auto_639476 ) ) ( not ( = ?auto_639470 ?auto_639477 ) ) ( not ( = ?auto_639470 ?auto_639478 ) ) ( not ( = ?auto_639470 ?auto_639479 ) ) ( not ( = ?auto_639470 ?auto_639480 ) ) ( not ( = ?auto_639470 ?auto_639481 ) ) ( not ( = ?auto_639470 ?auto_639482 ) ) ( not ( = ?auto_639470 ?auto_639483 ) ) ( not ( = ?auto_639470 ?auto_639484 ) ) ( not ( = ?auto_639471 ?auto_639472 ) ) ( not ( = ?auto_639471 ?auto_639473 ) ) ( not ( = ?auto_639471 ?auto_639474 ) ) ( not ( = ?auto_639471 ?auto_639475 ) ) ( not ( = ?auto_639471 ?auto_639476 ) ) ( not ( = ?auto_639471 ?auto_639477 ) ) ( not ( = ?auto_639471 ?auto_639478 ) ) ( not ( = ?auto_639471 ?auto_639479 ) ) ( not ( = ?auto_639471 ?auto_639480 ) ) ( not ( = ?auto_639471 ?auto_639481 ) ) ( not ( = ?auto_639471 ?auto_639482 ) ) ( not ( = ?auto_639471 ?auto_639483 ) ) ( not ( = ?auto_639471 ?auto_639484 ) ) ( not ( = ?auto_639472 ?auto_639473 ) ) ( not ( = ?auto_639472 ?auto_639474 ) ) ( not ( = ?auto_639472 ?auto_639475 ) ) ( not ( = ?auto_639472 ?auto_639476 ) ) ( not ( = ?auto_639472 ?auto_639477 ) ) ( not ( = ?auto_639472 ?auto_639478 ) ) ( not ( = ?auto_639472 ?auto_639479 ) ) ( not ( = ?auto_639472 ?auto_639480 ) ) ( not ( = ?auto_639472 ?auto_639481 ) ) ( not ( = ?auto_639472 ?auto_639482 ) ) ( not ( = ?auto_639472 ?auto_639483 ) ) ( not ( = ?auto_639472 ?auto_639484 ) ) ( not ( = ?auto_639473 ?auto_639474 ) ) ( not ( = ?auto_639473 ?auto_639475 ) ) ( not ( = ?auto_639473 ?auto_639476 ) ) ( not ( = ?auto_639473 ?auto_639477 ) ) ( not ( = ?auto_639473 ?auto_639478 ) ) ( not ( = ?auto_639473 ?auto_639479 ) ) ( not ( = ?auto_639473 ?auto_639480 ) ) ( not ( = ?auto_639473 ?auto_639481 ) ) ( not ( = ?auto_639473 ?auto_639482 ) ) ( not ( = ?auto_639473 ?auto_639483 ) ) ( not ( = ?auto_639473 ?auto_639484 ) ) ( not ( = ?auto_639474 ?auto_639475 ) ) ( not ( = ?auto_639474 ?auto_639476 ) ) ( not ( = ?auto_639474 ?auto_639477 ) ) ( not ( = ?auto_639474 ?auto_639478 ) ) ( not ( = ?auto_639474 ?auto_639479 ) ) ( not ( = ?auto_639474 ?auto_639480 ) ) ( not ( = ?auto_639474 ?auto_639481 ) ) ( not ( = ?auto_639474 ?auto_639482 ) ) ( not ( = ?auto_639474 ?auto_639483 ) ) ( not ( = ?auto_639474 ?auto_639484 ) ) ( not ( = ?auto_639475 ?auto_639476 ) ) ( not ( = ?auto_639475 ?auto_639477 ) ) ( not ( = ?auto_639475 ?auto_639478 ) ) ( not ( = ?auto_639475 ?auto_639479 ) ) ( not ( = ?auto_639475 ?auto_639480 ) ) ( not ( = ?auto_639475 ?auto_639481 ) ) ( not ( = ?auto_639475 ?auto_639482 ) ) ( not ( = ?auto_639475 ?auto_639483 ) ) ( not ( = ?auto_639475 ?auto_639484 ) ) ( not ( = ?auto_639476 ?auto_639477 ) ) ( not ( = ?auto_639476 ?auto_639478 ) ) ( not ( = ?auto_639476 ?auto_639479 ) ) ( not ( = ?auto_639476 ?auto_639480 ) ) ( not ( = ?auto_639476 ?auto_639481 ) ) ( not ( = ?auto_639476 ?auto_639482 ) ) ( not ( = ?auto_639476 ?auto_639483 ) ) ( not ( = ?auto_639476 ?auto_639484 ) ) ( not ( = ?auto_639477 ?auto_639478 ) ) ( not ( = ?auto_639477 ?auto_639479 ) ) ( not ( = ?auto_639477 ?auto_639480 ) ) ( not ( = ?auto_639477 ?auto_639481 ) ) ( not ( = ?auto_639477 ?auto_639482 ) ) ( not ( = ?auto_639477 ?auto_639483 ) ) ( not ( = ?auto_639477 ?auto_639484 ) ) ( not ( = ?auto_639478 ?auto_639479 ) ) ( not ( = ?auto_639478 ?auto_639480 ) ) ( not ( = ?auto_639478 ?auto_639481 ) ) ( not ( = ?auto_639478 ?auto_639482 ) ) ( not ( = ?auto_639478 ?auto_639483 ) ) ( not ( = ?auto_639478 ?auto_639484 ) ) ( not ( = ?auto_639479 ?auto_639480 ) ) ( not ( = ?auto_639479 ?auto_639481 ) ) ( not ( = ?auto_639479 ?auto_639482 ) ) ( not ( = ?auto_639479 ?auto_639483 ) ) ( not ( = ?auto_639479 ?auto_639484 ) ) ( not ( = ?auto_639480 ?auto_639481 ) ) ( not ( = ?auto_639480 ?auto_639482 ) ) ( not ( = ?auto_639480 ?auto_639483 ) ) ( not ( = ?auto_639480 ?auto_639484 ) ) ( not ( = ?auto_639481 ?auto_639482 ) ) ( not ( = ?auto_639481 ?auto_639483 ) ) ( not ( = ?auto_639481 ?auto_639484 ) ) ( not ( = ?auto_639482 ?auto_639483 ) ) ( not ( = ?auto_639482 ?auto_639484 ) ) ( not ( = ?auto_639483 ?auto_639484 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_639483 ?auto_639484 )
      ( !STACK ?auto_639483 ?auto_639482 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_639531 - BLOCK
      ?auto_639532 - BLOCK
      ?auto_639533 - BLOCK
      ?auto_639534 - BLOCK
      ?auto_639535 - BLOCK
      ?auto_639536 - BLOCK
      ?auto_639537 - BLOCK
      ?auto_639538 - BLOCK
      ?auto_639539 - BLOCK
      ?auto_639540 - BLOCK
      ?auto_639541 - BLOCK
      ?auto_639542 - BLOCK
      ?auto_639543 - BLOCK
      ?auto_639544 - BLOCK
      ?auto_639545 - BLOCK
    )
    :vars
    (
      ?auto_639546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_639545 ?auto_639546 ) ( ON-TABLE ?auto_639531 ) ( ON ?auto_639532 ?auto_639531 ) ( ON ?auto_639533 ?auto_639532 ) ( ON ?auto_639534 ?auto_639533 ) ( ON ?auto_639535 ?auto_639534 ) ( ON ?auto_639536 ?auto_639535 ) ( ON ?auto_639537 ?auto_639536 ) ( ON ?auto_639538 ?auto_639537 ) ( ON ?auto_639539 ?auto_639538 ) ( ON ?auto_639540 ?auto_639539 ) ( ON ?auto_639541 ?auto_639540 ) ( ON ?auto_639542 ?auto_639541 ) ( ON ?auto_639543 ?auto_639542 ) ( not ( = ?auto_639531 ?auto_639532 ) ) ( not ( = ?auto_639531 ?auto_639533 ) ) ( not ( = ?auto_639531 ?auto_639534 ) ) ( not ( = ?auto_639531 ?auto_639535 ) ) ( not ( = ?auto_639531 ?auto_639536 ) ) ( not ( = ?auto_639531 ?auto_639537 ) ) ( not ( = ?auto_639531 ?auto_639538 ) ) ( not ( = ?auto_639531 ?auto_639539 ) ) ( not ( = ?auto_639531 ?auto_639540 ) ) ( not ( = ?auto_639531 ?auto_639541 ) ) ( not ( = ?auto_639531 ?auto_639542 ) ) ( not ( = ?auto_639531 ?auto_639543 ) ) ( not ( = ?auto_639531 ?auto_639544 ) ) ( not ( = ?auto_639531 ?auto_639545 ) ) ( not ( = ?auto_639531 ?auto_639546 ) ) ( not ( = ?auto_639532 ?auto_639533 ) ) ( not ( = ?auto_639532 ?auto_639534 ) ) ( not ( = ?auto_639532 ?auto_639535 ) ) ( not ( = ?auto_639532 ?auto_639536 ) ) ( not ( = ?auto_639532 ?auto_639537 ) ) ( not ( = ?auto_639532 ?auto_639538 ) ) ( not ( = ?auto_639532 ?auto_639539 ) ) ( not ( = ?auto_639532 ?auto_639540 ) ) ( not ( = ?auto_639532 ?auto_639541 ) ) ( not ( = ?auto_639532 ?auto_639542 ) ) ( not ( = ?auto_639532 ?auto_639543 ) ) ( not ( = ?auto_639532 ?auto_639544 ) ) ( not ( = ?auto_639532 ?auto_639545 ) ) ( not ( = ?auto_639532 ?auto_639546 ) ) ( not ( = ?auto_639533 ?auto_639534 ) ) ( not ( = ?auto_639533 ?auto_639535 ) ) ( not ( = ?auto_639533 ?auto_639536 ) ) ( not ( = ?auto_639533 ?auto_639537 ) ) ( not ( = ?auto_639533 ?auto_639538 ) ) ( not ( = ?auto_639533 ?auto_639539 ) ) ( not ( = ?auto_639533 ?auto_639540 ) ) ( not ( = ?auto_639533 ?auto_639541 ) ) ( not ( = ?auto_639533 ?auto_639542 ) ) ( not ( = ?auto_639533 ?auto_639543 ) ) ( not ( = ?auto_639533 ?auto_639544 ) ) ( not ( = ?auto_639533 ?auto_639545 ) ) ( not ( = ?auto_639533 ?auto_639546 ) ) ( not ( = ?auto_639534 ?auto_639535 ) ) ( not ( = ?auto_639534 ?auto_639536 ) ) ( not ( = ?auto_639534 ?auto_639537 ) ) ( not ( = ?auto_639534 ?auto_639538 ) ) ( not ( = ?auto_639534 ?auto_639539 ) ) ( not ( = ?auto_639534 ?auto_639540 ) ) ( not ( = ?auto_639534 ?auto_639541 ) ) ( not ( = ?auto_639534 ?auto_639542 ) ) ( not ( = ?auto_639534 ?auto_639543 ) ) ( not ( = ?auto_639534 ?auto_639544 ) ) ( not ( = ?auto_639534 ?auto_639545 ) ) ( not ( = ?auto_639534 ?auto_639546 ) ) ( not ( = ?auto_639535 ?auto_639536 ) ) ( not ( = ?auto_639535 ?auto_639537 ) ) ( not ( = ?auto_639535 ?auto_639538 ) ) ( not ( = ?auto_639535 ?auto_639539 ) ) ( not ( = ?auto_639535 ?auto_639540 ) ) ( not ( = ?auto_639535 ?auto_639541 ) ) ( not ( = ?auto_639535 ?auto_639542 ) ) ( not ( = ?auto_639535 ?auto_639543 ) ) ( not ( = ?auto_639535 ?auto_639544 ) ) ( not ( = ?auto_639535 ?auto_639545 ) ) ( not ( = ?auto_639535 ?auto_639546 ) ) ( not ( = ?auto_639536 ?auto_639537 ) ) ( not ( = ?auto_639536 ?auto_639538 ) ) ( not ( = ?auto_639536 ?auto_639539 ) ) ( not ( = ?auto_639536 ?auto_639540 ) ) ( not ( = ?auto_639536 ?auto_639541 ) ) ( not ( = ?auto_639536 ?auto_639542 ) ) ( not ( = ?auto_639536 ?auto_639543 ) ) ( not ( = ?auto_639536 ?auto_639544 ) ) ( not ( = ?auto_639536 ?auto_639545 ) ) ( not ( = ?auto_639536 ?auto_639546 ) ) ( not ( = ?auto_639537 ?auto_639538 ) ) ( not ( = ?auto_639537 ?auto_639539 ) ) ( not ( = ?auto_639537 ?auto_639540 ) ) ( not ( = ?auto_639537 ?auto_639541 ) ) ( not ( = ?auto_639537 ?auto_639542 ) ) ( not ( = ?auto_639537 ?auto_639543 ) ) ( not ( = ?auto_639537 ?auto_639544 ) ) ( not ( = ?auto_639537 ?auto_639545 ) ) ( not ( = ?auto_639537 ?auto_639546 ) ) ( not ( = ?auto_639538 ?auto_639539 ) ) ( not ( = ?auto_639538 ?auto_639540 ) ) ( not ( = ?auto_639538 ?auto_639541 ) ) ( not ( = ?auto_639538 ?auto_639542 ) ) ( not ( = ?auto_639538 ?auto_639543 ) ) ( not ( = ?auto_639538 ?auto_639544 ) ) ( not ( = ?auto_639538 ?auto_639545 ) ) ( not ( = ?auto_639538 ?auto_639546 ) ) ( not ( = ?auto_639539 ?auto_639540 ) ) ( not ( = ?auto_639539 ?auto_639541 ) ) ( not ( = ?auto_639539 ?auto_639542 ) ) ( not ( = ?auto_639539 ?auto_639543 ) ) ( not ( = ?auto_639539 ?auto_639544 ) ) ( not ( = ?auto_639539 ?auto_639545 ) ) ( not ( = ?auto_639539 ?auto_639546 ) ) ( not ( = ?auto_639540 ?auto_639541 ) ) ( not ( = ?auto_639540 ?auto_639542 ) ) ( not ( = ?auto_639540 ?auto_639543 ) ) ( not ( = ?auto_639540 ?auto_639544 ) ) ( not ( = ?auto_639540 ?auto_639545 ) ) ( not ( = ?auto_639540 ?auto_639546 ) ) ( not ( = ?auto_639541 ?auto_639542 ) ) ( not ( = ?auto_639541 ?auto_639543 ) ) ( not ( = ?auto_639541 ?auto_639544 ) ) ( not ( = ?auto_639541 ?auto_639545 ) ) ( not ( = ?auto_639541 ?auto_639546 ) ) ( not ( = ?auto_639542 ?auto_639543 ) ) ( not ( = ?auto_639542 ?auto_639544 ) ) ( not ( = ?auto_639542 ?auto_639545 ) ) ( not ( = ?auto_639542 ?auto_639546 ) ) ( not ( = ?auto_639543 ?auto_639544 ) ) ( not ( = ?auto_639543 ?auto_639545 ) ) ( not ( = ?auto_639543 ?auto_639546 ) ) ( not ( = ?auto_639544 ?auto_639545 ) ) ( not ( = ?auto_639544 ?auto_639546 ) ) ( not ( = ?auto_639545 ?auto_639546 ) ) ( CLEAR ?auto_639543 ) ( ON ?auto_639544 ?auto_639545 ) ( CLEAR ?auto_639544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_639531 ?auto_639532 ?auto_639533 ?auto_639534 ?auto_639535 ?auto_639536 ?auto_639537 ?auto_639538 ?auto_639539 ?auto_639540 ?auto_639541 ?auto_639542 ?auto_639543 ?auto_639544 )
      ( MAKE-15PILE ?auto_639531 ?auto_639532 ?auto_639533 ?auto_639534 ?auto_639535 ?auto_639536 ?auto_639537 ?auto_639538 ?auto_639539 ?auto_639540 ?auto_639541 ?auto_639542 ?auto_639543 ?auto_639544 ?auto_639545 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_639593 - BLOCK
      ?auto_639594 - BLOCK
      ?auto_639595 - BLOCK
      ?auto_639596 - BLOCK
      ?auto_639597 - BLOCK
      ?auto_639598 - BLOCK
      ?auto_639599 - BLOCK
      ?auto_639600 - BLOCK
      ?auto_639601 - BLOCK
      ?auto_639602 - BLOCK
      ?auto_639603 - BLOCK
      ?auto_639604 - BLOCK
      ?auto_639605 - BLOCK
      ?auto_639606 - BLOCK
      ?auto_639607 - BLOCK
    )
    :vars
    (
      ?auto_639608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_639607 ?auto_639608 ) ( ON-TABLE ?auto_639593 ) ( ON ?auto_639594 ?auto_639593 ) ( ON ?auto_639595 ?auto_639594 ) ( ON ?auto_639596 ?auto_639595 ) ( ON ?auto_639597 ?auto_639596 ) ( ON ?auto_639598 ?auto_639597 ) ( ON ?auto_639599 ?auto_639598 ) ( ON ?auto_639600 ?auto_639599 ) ( ON ?auto_639601 ?auto_639600 ) ( ON ?auto_639602 ?auto_639601 ) ( ON ?auto_639603 ?auto_639602 ) ( ON ?auto_639604 ?auto_639603 ) ( not ( = ?auto_639593 ?auto_639594 ) ) ( not ( = ?auto_639593 ?auto_639595 ) ) ( not ( = ?auto_639593 ?auto_639596 ) ) ( not ( = ?auto_639593 ?auto_639597 ) ) ( not ( = ?auto_639593 ?auto_639598 ) ) ( not ( = ?auto_639593 ?auto_639599 ) ) ( not ( = ?auto_639593 ?auto_639600 ) ) ( not ( = ?auto_639593 ?auto_639601 ) ) ( not ( = ?auto_639593 ?auto_639602 ) ) ( not ( = ?auto_639593 ?auto_639603 ) ) ( not ( = ?auto_639593 ?auto_639604 ) ) ( not ( = ?auto_639593 ?auto_639605 ) ) ( not ( = ?auto_639593 ?auto_639606 ) ) ( not ( = ?auto_639593 ?auto_639607 ) ) ( not ( = ?auto_639593 ?auto_639608 ) ) ( not ( = ?auto_639594 ?auto_639595 ) ) ( not ( = ?auto_639594 ?auto_639596 ) ) ( not ( = ?auto_639594 ?auto_639597 ) ) ( not ( = ?auto_639594 ?auto_639598 ) ) ( not ( = ?auto_639594 ?auto_639599 ) ) ( not ( = ?auto_639594 ?auto_639600 ) ) ( not ( = ?auto_639594 ?auto_639601 ) ) ( not ( = ?auto_639594 ?auto_639602 ) ) ( not ( = ?auto_639594 ?auto_639603 ) ) ( not ( = ?auto_639594 ?auto_639604 ) ) ( not ( = ?auto_639594 ?auto_639605 ) ) ( not ( = ?auto_639594 ?auto_639606 ) ) ( not ( = ?auto_639594 ?auto_639607 ) ) ( not ( = ?auto_639594 ?auto_639608 ) ) ( not ( = ?auto_639595 ?auto_639596 ) ) ( not ( = ?auto_639595 ?auto_639597 ) ) ( not ( = ?auto_639595 ?auto_639598 ) ) ( not ( = ?auto_639595 ?auto_639599 ) ) ( not ( = ?auto_639595 ?auto_639600 ) ) ( not ( = ?auto_639595 ?auto_639601 ) ) ( not ( = ?auto_639595 ?auto_639602 ) ) ( not ( = ?auto_639595 ?auto_639603 ) ) ( not ( = ?auto_639595 ?auto_639604 ) ) ( not ( = ?auto_639595 ?auto_639605 ) ) ( not ( = ?auto_639595 ?auto_639606 ) ) ( not ( = ?auto_639595 ?auto_639607 ) ) ( not ( = ?auto_639595 ?auto_639608 ) ) ( not ( = ?auto_639596 ?auto_639597 ) ) ( not ( = ?auto_639596 ?auto_639598 ) ) ( not ( = ?auto_639596 ?auto_639599 ) ) ( not ( = ?auto_639596 ?auto_639600 ) ) ( not ( = ?auto_639596 ?auto_639601 ) ) ( not ( = ?auto_639596 ?auto_639602 ) ) ( not ( = ?auto_639596 ?auto_639603 ) ) ( not ( = ?auto_639596 ?auto_639604 ) ) ( not ( = ?auto_639596 ?auto_639605 ) ) ( not ( = ?auto_639596 ?auto_639606 ) ) ( not ( = ?auto_639596 ?auto_639607 ) ) ( not ( = ?auto_639596 ?auto_639608 ) ) ( not ( = ?auto_639597 ?auto_639598 ) ) ( not ( = ?auto_639597 ?auto_639599 ) ) ( not ( = ?auto_639597 ?auto_639600 ) ) ( not ( = ?auto_639597 ?auto_639601 ) ) ( not ( = ?auto_639597 ?auto_639602 ) ) ( not ( = ?auto_639597 ?auto_639603 ) ) ( not ( = ?auto_639597 ?auto_639604 ) ) ( not ( = ?auto_639597 ?auto_639605 ) ) ( not ( = ?auto_639597 ?auto_639606 ) ) ( not ( = ?auto_639597 ?auto_639607 ) ) ( not ( = ?auto_639597 ?auto_639608 ) ) ( not ( = ?auto_639598 ?auto_639599 ) ) ( not ( = ?auto_639598 ?auto_639600 ) ) ( not ( = ?auto_639598 ?auto_639601 ) ) ( not ( = ?auto_639598 ?auto_639602 ) ) ( not ( = ?auto_639598 ?auto_639603 ) ) ( not ( = ?auto_639598 ?auto_639604 ) ) ( not ( = ?auto_639598 ?auto_639605 ) ) ( not ( = ?auto_639598 ?auto_639606 ) ) ( not ( = ?auto_639598 ?auto_639607 ) ) ( not ( = ?auto_639598 ?auto_639608 ) ) ( not ( = ?auto_639599 ?auto_639600 ) ) ( not ( = ?auto_639599 ?auto_639601 ) ) ( not ( = ?auto_639599 ?auto_639602 ) ) ( not ( = ?auto_639599 ?auto_639603 ) ) ( not ( = ?auto_639599 ?auto_639604 ) ) ( not ( = ?auto_639599 ?auto_639605 ) ) ( not ( = ?auto_639599 ?auto_639606 ) ) ( not ( = ?auto_639599 ?auto_639607 ) ) ( not ( = ?auto_639599 ?auto_639608 ) ) ( not ( = ?auto_639600 ?auto_639601 ) ) ( not ( = ?auto_639600 ?auto_639602 ) ) ( not ( = ?auto_639600 ?auto_639603 ) ) ( not ( = ?auto_639600 ?auto_639604 ) ) ( not ( = ?auto_639600 ?auto_639605 ) ) ( not ( = ?auto_639600 ?auto_639606 ) ) ( not ( = ?auto_639600 ?auto_639607 ) ) ( not ( = ?auto_639600 ?auto_639608 ) ) ( not ( = ?auto_639601 ?auto_639602 ) ) ( not ( = ?auto_639601 ?auto_639603 ) ) ( not ( = ?auto_639601 ?auto_639604 ) ) ( not ( = ?auto_639601 ?auto_639605 ) ) ( not ( = ?auto_639601 ?auto_639606 ) ) ( not ( = ?auto_639601 ?auto_639607 ) ) ( not ( = ?auto_639601 ?auto_639608 ) ) ( not ( = ?auto_639602 ?auto_639603 ) ) ( not ( = ?auto_639602 ?auto_639604 ) ) ( not ( = ?auto_639602 ?auto_639605 ) ) ( not ( = ?auto_639602 ?auto_639606 ) ) ( not ( = ?auto_639602 ?auto_639607 ) ) ( not ( = ?auto_639602 ?auto_639608 ) ) ( not ( = ?auto_639603 ?auto_639604 ) ) ( not ( = ?auto_639603 ?auto_639605 ) ) ( not ( = ?auto_639603 ?auto_639606 ) ) ( not ( = ?auto_639603 ?auto_639607 ) ) ( not ( = ?auto_639603 ?auto_639608 ) ) ( not ( = ?auto_639604 ?auto_639605 ) ) ( not ( = ?auto_639604 ?auto_639606 ) ) ( not ( = ?auto_639604 ?auto_639607 ) ) ( not ( = ?auto_639604 ?auto_639608 ) ) ( not ( = ?auto_639605 ?auto_639606 ) ) ( not ( = ?auto_639605 ?auto_639607 ) ) ( not ( = ?auto_639605 ?auto_639608 ) ) ( not ( = ?auto_639606 ?auto_639607 ) ) ( not ( = ?auto_639606 ?auto_639608 ) ) ( not ( = ?auto_639607 ?auto_639608 ) ) ( ON ?auto_639606 ?auto_639607 ) ( CLEAR ?auto_639604 ) ( ON ?auto_639605 ?auto_639606 ) ( CLEAR ?auto_639605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_639593 ?auto_639594 ?auto_639595 ?auto_639596 ?auto_639597 ?auto_639598 ?auto_639599 ?auto_639600 ?auto_639601 ?auto_639602 ?auto_639603 ?auto_639604 ?auto_639605 )
      ( MAKE-15PILE ?auto_639593 ?auto_639594 ?auto_639595 ?auto_639596 ?auto_639597 ?auto_639598 ?auto_639599 ?auto_639600 ?auto_639601 ?auto_639602 ?auto_639603 ?auto_639604 ?auto_639605 ?auto_639606 ?auto_639607 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_639655 - BLOCK
      ?auto_639656 - BLOCK
      ?auto_639657 - BLOCK
      ?auto_639658 - BLOCK
      ?auto_639659 - BLOCK
      ?auto_639660 - BLOCK
      ?auto_639661 - BLOCK
      ?auto_639662 - BLOCK
      ?auto_639663 - BLOCK
      ?auto_639664 - BLOCK
      ?auto_639665 - BLOCK
      ?auto_639666 - BLOCK
      ?auto_639667 - BLOCK
      ?auto_639668 - BLOCK
      ?auto_639669 - BLOCK
    )
    :vars
    (
      ?auto_639670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_639669 ?auto_639670 ) ( ON-TABLE ?auto_639655 ) ( ON ?auto_639656 ?auto_639655 ) ( ON ?auto_639657 ?auto_639656 ) ( ON ?auto_639658 ?auto_639657 ) ( ON ?auto_639659 ?auto_639658 ) ( ON ?auto_639660 ?auto_639659 ) ( ON ?auto_639661 ?auto_639660 ) ( ON ?auto_639662 ?auto_639661 ) ( ON ?auto_639663 ?auto_639662 ) ( ON ?auto_639664 ?auto_639663 ) ( ON ?auto_639665 ?auto_639664 ) ( not ( = ?auto_639655 ?auto_639656 ) ) ( not ( = ?auto_639655 ?auto_639657 ) ) ( not ( = ?auto_639655 ?auto_639658 ) ) ( not ( = ?auto_639655 ?auto_639659 ) ) ( not ( = ?auto_639655 ?auto_639660 ) ) ( not ( = ?auto_639655 ?auto_639661 ) ) ( not ( = ?auto_639655 ?auto_639662 ) ) ( not ( = ?auto_639655 ?auto_639663 ) ) ( not ( = ?auto_639655 ?auto_639664 ) ) ( not ( = ?auto_639655 ?auto_639665 ) ) ( not ( = ?auto_639655 ?auto_639666 ) ) ( not ( = ?auto_639655 ?auto_639667 ) ) ( not ( = ?auto_639655 ?auto_639668 ) ) ( not ( = ?auto_639655 ?auto_639669 ) ) ( not ( = ?auto_639655 ?auto_639670 ) ) ( not ( = ?auto_639656 ?auto_639657 ) ) ( not ( = ?auto_639656 ?auto_639658 ) ) ( not ( = ?auto_639656 ?auto_639659 ) ) ( not ( = ?auto_639656 ?auto_639660 ) ) ( not ( = ?auto_639656 ?auto_639661 ) ) ( not ( = ?auto_639656 ?auto_639662 ) ) ( not ( = ?auto_639656 ?auto_639663 ) ) ( not ( = ?auto_639656 ?auto_639664 ) ) ( not ( = ?auto_639656 ?auto_639665 ) ) ( not ( = ?auto_639656 ?auto_639666 ) ) ( not ( = ?auto_639656 ?auto_639667 ) ) ( not ( = ?auto_639656 ?auto_639668 ) ) ( not ( = ?auto_639656 ?auto_639669 ) ) ( not ( = ?auto_639656 ?auto_639670 ) ) ( not ( = ?auto_639657 ?auto_639658 ) ) ( not ( = ?auto_639657 ?auto_639659 ) ) ( not ( = ?auto_639657 ?auto_639660 ) ) ( not ( = ?auto_639657 ?auto_639661 ) ) ( not ( = ?auto_639657 ?auto_639662 ) ) ( not ( = ?auto_639657 ?auto_639663 ) ) ( not ( = ?auto_639657 ?auto_639664 ) ) ( not ( = ?auto_639657 ?auto_639665 ) ) ( not ( = ?auto_639657 ?auto_639666 ) ) ( not ( = ?auto_639657 ?auto_639667 ) ) ( not ( = ?auto_639657 ?auto_639668 ) ) ( not ( = ?auto_639657 ?auto_639669 ) ) ( not ( = ?auto_639657 ?auto_639670 ) ) ( not ( = ?auto_639658 ?auto_639659 ) ) ( not ( = ?auto_639658 ?auto_639660 ) ) ( not ( = ?auto_639658 ?auto_639661 ) ) ( not ( = ?auto_639658 ?auto_639662 ) ) ( not ( = ?auto_639658 ?auto_639663 ) ) ( not ( = ?auto_639658 ?auto_639664 ) ) ( not ( = ?auto_639658 ?auto_639665 ) ) ( not ( = ?auto_639658 ?auto_639666 ) ) ( not ( = ?auto_639658 ?auto_639667 ) ) ( not ( = ?auto_639658 ?auto_639668 ) ) ( not ( = ?auto_639658 ?auto_639669 ) ) ( not ( = ?auto_639658 ?auto_639670 ) ) ( not ( = ?auto_639659 ?auto_639660 ) ) ( not ( = ?auto_639659 ?auto_639661 ) ) ( not ( = ?auto_639659 ?auto_639662 ) ) ( not ( = ?auto_639659 ?auto_639663 ) ) ( not ( = ?auto_639659 ?auto_639664 ) ) ( not ( = ?auto_639659 ?auto_639665 ) ) ( not ( = ?auto_639659 ?auto_639666 ) ) ( not ( = ?auto_639659 ?auto_639667 ) ) ( not ( = ?auto_639659 ?auto_639668 ) ) ( not ( = ?auto_639659 ?auto_639669 ) ) ( not ( = ?auto_639659 ?auto_639670 ) ) ( not ( = ?auto_639660 ?auto_639661 ) ) ( not ( = ?auto_639660 ?auto_639662 ) ) ( not ( = ?auto_639660 ?auto_639663 ) ) ( not ( = ?auto_639660 ?auto_639664 ) ) ( not ( = ?auto_639660 ?auto_639665 ) ) ( not ( = ?auto_639660 ?auto_639666 ) ) ( not ( = ?auto_639660 ?auto_639667 ) ) ( not ( = ?auto_639660 ?auto_639668 ) ) ( not ( = ?auto_639660 ?auto_639669 ) ) ( not ( = ?auto_639660 ?auto_639670 ) ) ( not ( = ?auto_639661 ?auto_639662 ) ) ( not ( = ?auto_639661 ?auto_639663 ) ) ( not ( = ?auto_639661 ?auto_639664 ) ) ( not ( = ?auto_639661 ?auto_639665 ) ) ( not ( = ?auto_639661 ?auto_639666 ) ) ( not ( = ?auto_639661 ?auto_639667 ) ) ( not ( = ?auto_639661 ?auto_639668 ) ) ( not ( = ?auto_639661 ?auto_639669 ) ) ( not ( = ?auto_639661 ?auto_639670 ) ) ( not ( = ?auto_639662 ?auto_639663 ) ) ( not ( = ?auto_639662 ?auto_639664 ) ) ( not ( = ?auto_639662 ?auto_639665 ) ) ( not ( = ?auto_639662 ?auto_639666 ) ) ( not ( = ?auto_639662 ?auto_639667 ) ) ( not ( = ?auto_639662 ?auto_639668 ) ) ( not ( = ?auto_639662 ?auto_639669 ) ) ( not ( = ?auto_639662 ?auto_639670 ) ) ( not ( = ?auto_639663 ?auto_639664 ) ) ( not ( = ?auto_639663 ?auto_639665 ) ) ( not ( = ?auto_639663 ?auto_639666 ) ) ( not ( = ?auto_639663 ?auto_639667 ) ) ( not ( = ?auto_639663 ?auto_639668 ) ) ( not ( = ?auto_639663 ?auto_639669 ) ) ( not ( = ?auto_639663 ?auto_639670 ) ) ( not ( = ?auto_639664 ?auto_639665 ) ) ( not ( = ?auto_639664 ?auto_639666 ) ) ( not ( = ?auto_639664 ?auto_639667 ) ) ( not ( = ?auto_639664 ?auto_639668 ) ) ( not ( = ?auto_639664 ?auto_639669 ) ) ( not ( = ?auto_639664 ?auto_639670 ) ) ( not ( = ?auto_639665 ?auto_639666 ) ) ( not ( = ?auto_639665 ?auto_639667 ) ) ( not ( = ?auto_639665 ?auto_639668 ) ) ( not ( = ?auto_639665 ?auto_639669 ) ) ( not ( = ?auto_639665 ?auto_639670 ) ) ( not ( = ?auto_639666 ?auto_639667 ) ) ( not ( = ?auto_639666 ?auto_639668 ) ) ( not ( = ?auto_639666 ?auto_639669 ) ) ( not ( = ?auto_639666 ?auto_639670 ) ) ( not ( = ?auto_639667 ?auto_639668 ) ) ( not ( = ?auto_639667 ?auto_639669 ) ) ( not ( = ?auto_639667 ?auto_639670 ) ) ( not ( = ?auto_639668 ?auto_639669 ) ) ( not ( = ?auto_639668 ?auto_639670 ) ) ( not ( = ?auto_639669 ?auto_639670 ) ) ( ON ?auto_639668 ?auto_639669 ) ( ON ?auto_639667 ?auto_639668 ) ( CLEAR ?auto_639665 ) ( ON ?auto_639666 ?auto_639667 ) ( CLEAR ?auto_639666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_639655 ?auto_639656 ?auto_639657 ?auto_639658 ?auto_639659 ?auto_639660 ?auto_639661 ?auto_639662 ?auto_639663 ?auto_639664 ?auto_639665 ?auto_639666 )
      ( MAKE-15PILE ?auto_639655 ?auto_639656 ?auto_639657 ?auto_639658 ?auto_639659 ?auto_639660 ?auto_639661 ?auto_639662 ?auto_639663 ?auto_639664 ?auto_639665 ?auto_639666 ?auto_639667 ?auto_639668 ?auto_639669 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_639717 - BLOCK
      ?auto_639718 - BLOCK
      ?auto_639719 - BLOCK
      ?auto_639720 - BLOCK
      ?auto_639721 - BLOCK
      ?auto_639722 - BLOCK
      ?auto_639723 - BLOCK
      ?auto_639724 - BLOCK
      ?auto_639725 - BLOCK
      ?auto_639726 - BLOCK
      ?auto_639727 - BLOCK
      ?auto_639728 - BLOCK
      ?auto_639729 - BLOCK
      ?auto_639730 - BLOCK
      ?auto_639731 - BLOCK
    )
    :vars
    (
      ?auto_639732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_639731 ?auto_639732 ) ( ON-TABLE ?auto_639717 ) ( ON ?auto_639718 ?auto_639717 ) ( ON ?auto_639719 ?auto_639718 ) ( ON ?auto_639720 ?auto_639719 ) ( ON ?auto_639721 ?auto_639720 ) ( ON ?auto_639722 ?auto_639721 ) ( ON ?auto_639723 ?auto_639722 ) ( ON ?auto_639724 ?auto_639723 ) ( ON ?auto_639725 ?auto_639724 ) ( ON ?auto_639726 ?auto_639725 ) ( not ( = ?auto_639717 ?auto_639718 ) ) ( not ( = ?auto_639717 ?auto_639719 ) ) ( not ( = ?auto_639717 ?auto_639720 ) ) ( not ( = ?auto_639717 ?auto_639721 ) ) ( not ( = ?auto_639717 ?auto_639722 ) ) ( not ( = ?auto_639717 ?auto_639723 ) ) ( not ( = ?auto_639717 ?auto_639724 ) ) ( not ( = ?auto_639717 ?auto_639725 ) ) ( not ( = ?auto_639717 ?auto_639726 ) ) ( not ( = ?auto_639717 ?auto_639727 ) ) ( not ( = ?auto_639717 ?auto_639728 ) ) ( not ( = ?auto_639717 ?auto_639729 ) ) ( not ( = ?auto_639717 ?auto_639730 ) ) ( not ( = ?auto_639717 ?auto_639731 ) ) ( not ( = ?auto_639717 ?auto_639732 ) ) ( not ( = ?auto_639718 ?auto_639719 ) ) ( not ( = ?auto_639718 ?auto_639720 ) ) ( not ( = ?auto_639718 ?auto_639721 ) ) ( not ( = ?auto_639718 ?auto_639722 ) ) ( not ( = ?auto_639718 ?auto_639723 ) ) ( not ( = ?auto_639718 ?auto_639724 ) ) ( not ( = ?auto_639718 ?auto_639725 ) ) ( not ( = ?auto_639718 ?auto_639726 ) ) ( not ( = ?auto_639718 ?auto_639727 ) ) ( not ( = ?auto_639718 ?auto_639728 ) ) ( not ( = ?auto_639718 ?auto_639729 ) ) ( not ( = ?auto_639718 ?auto_639730 ) ) ( not ( = ?auto_639718 ?auto_639731 ) ) ( not ( = ?auto_639718 ?auto_639732 ) ) ( not ( = ?auto_639719 ?auto_639720 ) ) ( not ( = ?auto_639719 ?auto_639721 ) ) ( not ( = ?auto_639719 ?auto_639722 ) ) ( not ( = ?auto_639719 ?auto_639723 ) ) ( not ( = ?auto_639719 ?auto_639724 ) ) ( not ( = ?auto_639719 ?auto_639725 ) ) ( not ( = ?auto_639719 ?auto_639726 ) ) ( not ( = ?auto_639719 ?auto_639727 ) ) ( not ( = ?auto_639719 ?auto_639728 ) ) ( not ( = ?auto_639719 ?auto_639729 ) ) ( not ( = ?auto_639719 ?auto_639730 ) ) ( not ( = ?auto_639719 ?auto_639731 ) ) ( not ( = ?auto_639719 ?auto_639732 ) ) ( not ( = ?auto_639720 ?auto_639721 ) ) ( not ( = ?auto_639720 ?auto_639722 ) ) ( not ( = ?auto_639720 ?auto_639723 ) ) ( not ( = ?auto_639720 ?auto_639724 ) ) ( not ( = ?auto_639720 ?auto_639725 ) ) ( not ( = ?auto_639720 ?auto_639726 ) ) ( not ( = ?auto_639720 ?auto_639727 ) ) ( not ( = ?auto_639720 ?auto_639728 ) ) ( not ( = ?auto_639720 ?auto_639729 ) ) ( not ( = ?auto_639720 ?auto_639730 ) ) ( not ( = ?auto_639720 ?auto_639731 ) ) ( not ( = ?auto_639720 ?auto_639732 ) ) ( not ( = ?auto_639721 ?auto_639722 ) ) ( not ( = ?auto_639721 ?auto_639723 ) ) ( not ( = ?auto_639721 ?auto_639724 ) ) ( not ( = ?auto_639721 ?auto_639725 ) ) ( not ( = ?auto_639721 ?auto_639726 ) ) ( not ( = ?auto_639721 ?auto_639727 ) ) ( not ( = ?auto_639721 ?auto_639728 ) ) ( not ( = ?auto_639721 ?auto_639729 ) ) ( not ( = ?auto_639721 ?auto_639730 ) ) ( not ( = ?auto_639721 ?auto_639731 ) ) ( not ( = ?auto_639721 ?auto_639732 ) ) ( not ( = ?auto_639722 ?auto_639723 ) ) ( not ( = ?auto_639722 ?auto_639724 ) ) ( not ( = ?auto_639722 ?auto_639725 ) ) ( not ( = ?auto_639722 ?auto_639726 ) ) ( not ( = ?auto_639722 ?auto_639727 ) ) ( not ( = ?auto_639722 ?auto_639728 ) ) ( not ( = ?auto_639722 ?auto_639729 ) ) ( not ( = ?auto_639722 ?auto_639730 ) ) ( not ( = ?auto_639722 ?auto_639731 ) ) ( not ( = ?auto_639722 ?auto_639732 ) ) ( not ( = ?auto_639723 ?auto_639724 ) ) ( not ( = ?auto_639723 ?auto_639725 ) ) ( not ( = ?auto_639723 ?auto_639726 ) ) ( not ( = ?auto_639723 ?auto_639727 ) ) ( not ( = ?auto_639723 ?auto_639728 ) ) ( not ( = ?auto_639723 ?auto_639729 ) ) ( not ( = ?auto_639723 ?auto_639730 ) ) ( not ( = ?auto_639723 ?auto_639731 ) ) ( not ( = ?auto_639723 ?auto_639732 ) ) ( not ( = ?auto_639724 ?auto_639725 ) ) ( not ( = ?auto_639724 ?auto_639726 ) ) ( not ( = ?auto_639724 ?auto_639727 ) ) ( not ( = ?auto_639724 ?auto_639728 ) ) ( not ( = ?auto_639724 ?auto_639729 ) ) ( not ( = ?auto_639724 ?auto_639730 ) ) ( not ( = ?auto_639724 ?auto_639731 ) ) ( not ( = ?auto_639724 ?auto_639732 ) ) ( not ( = ?auto_639725 ?auto_639726 ) ) ( not ( = ?auto_639725 ?auto_639727 ) ) ( not ( = ?auto_639725 ?auto_639728 ) ) ( not ( = ?auto_639725 ?auto_639729 ) ) ( not ( = ?auto_639725 ?auto_639730 ) ) ( not ( = ?auto_639725 ?auto_639731 ) ) ( not ( = ?auto_639725 ?auto_639732 ) ) ( not ( = ?auto_639726 ?auto_639727 ) ) ( not ( = ?auto_639726 ?auto_639728 ) ) ( not ( = ?auto_639726 ?auto_639729 ) ) ( not ( = ?auto_639726 ?auto_639730 ) ) ( not ( = ?auto_639726 ?auto_639731 ) ) ( not ( = ?auto_639726 ?auto_639732 ) ) ( not ( = ?auto_639727 ?auto_639728 ) ) ( not ( = ?auto_639727 ?auto_639729 ) ) ( not ( = ?auto_639727 ?auto_639730 ) ) ( not ( = ?auto_639727 ?auto_639731 ) ) ( not ( = ?auto_639727 ?auto_639732 ) ) ( not ( = ?auto_639728 ?auto_639729 ) ) ( not ( = ?auto_639728 ?auto_639730 ) ) ( not ( = ?auto_639728 ?auto_639731 ) ) ( not ( = ?auto_639728 ?auto_639732 ) ) ( not ( = ?auto_639729 ?auto_639730 ) ) ( not ( = ?auto_639729 ?auto_639731 ) ) ( not ( = ?auto_639729 ?auto_639732 ) ) ( not ( = ?auto_639730 ?auto_639731 ) ) ( not ( = ?auto_639730 ?auto_639732 ) ) ( not ( = ?auto_639731 ?auto_639732 ) ) ( ON ?auto_639730 ?auto_639731 ) ( ON ?auto_639729 ?auto_639730 ) ( ON ?auto_639728 ?auto_639729 ) ( CLEAR ?auto_639726 ) ( ON ?auto_639727 ?auto_639728 ) ( CLEAR ?auto_639727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_639717 ?auto_639718 ?auto_639719 ?auto_639720 ?auto_639721 ?auto_639722 ?auto_639723 ?auto_639724 ?auto_639725 ?auto_639726 ?auto_639727 )
      ( MAKE-15PILE ?auto_639717 ?auto_639718 ?auto_639719 ?auto_639720 ?auto_639721 ?auto_639722 ?auto_639723 ?auto_639724 ?auto_639725 ?auto_639726 ?auto_639727 ?auto_639728 ?auto_639729 ?auto_639730 ?auto_639731 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_639779 - BLOCK
      ?auto_639780 - BLOCK
      ?auto_639781 - BLOCK
      ?auto_639782 - BLOCK
      ?auto_639783 - BLOCK
      ?auto_639784 - BLOCK
      ?auto_639785 - BLOCK
      ?auto_639786 - BLOCK
      ?auto_639787 - BLOCK
      ?auto_639788 - BLOCK
      ?auto_639789 - BLOCK
      ?auto_639790 - BLOCK
      ?auto_639791 - BLOCK
      ?auto_639792 - BLOCK
      ?auto_639793 - BLOCK
    )
    :vars
    (
      ?auto_639794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_639793 ?auto_639794 ) ( ON-TABLE ?auto_639779 ) ( ON ?auto_639780 ?auto_639779 ) ( ON ?auto_639781 ?auto_639780 ) ( ON ?auto_639782 ?auto_639781 ) ( ON ?auto_639783 ?auto_639782 ) ( ON ?auto_639784 ?auto_639783 ) ( ON ?auto_639785 ?auto_639784 ) ( ON ?auto_639786 ?auto_639785 ) ( ON ?auto_639787 ?auto_639786 ) ( not ( = ?auto_639779 ?auto_639780 ) ) ( not ( = ?auto_639779 ?auto_639781 ) ) ( not ( = ?auto_639779 ?auto_639782 ) ) ( not ( = ?auto_639779 ?auto_639783 ) ) ( not ( = ?auto_639779 ?auto_639784 ) ) ( not ( = ?auto_639779 ?auto_639785 ) ) ( not ( = ?auto_639779 ?auto_639786 ) ) ( not ( = ?auto_639779 ?auto_639787 ) ) ( not ( = ?auto_639779 ?auto_639788 ) ) ( not ( = ?auto_639779 ?auto_639789 ) ) ( not ( = ?auto_639779 ?auto_639790 ) ) ( not ( = ?auto_639779 ?auto_639791 ) ) ( not ( = ?auto_639779 ?auto_639792 ) ) ( not ( = ?auto_639779 ?auto_639793 ) ) ( not ( = ?auto_639779 ?auto_639794 ) ) ( not ( = ?auto_639780 ?auto_639781 ) ) ( not ( = ?auto_639780 ?auto_639782 ) ) ( not ( = ?auto_639780 ?auto_639783 ) ) ( not ( = ?auto_639780 ?auto_639784 ) ) ( not ( = ?auto_639780 ?auto_639785 ) ) ( not ( = ?auto_639780 ?auto_639786 ) ) ( not ( = ?auto_639780 ?auto_639787 ) ) ( not ( = ?auto_639780 ?auto_639788 ) ) ( not ( = ?auto_639780 ?auto_639789 ) ) ( not ( = ?auto_639780 ?auto_639790 ) ) ( not ( = ?auto_639780 ?auto_639791 ) ) ( not ( = ?auto_639780 ?auto_639792 ) ) ( not ( = ?auto_639780 ?auto_639793 ) ) ( not ( = ?auto_639780 ?auto_639794 ) ) ( not ( = ?auto_639781 ?auto_639782 ) ) ( not ( = ?auto_639781 ?auto_639783 ) ) ( not ( = ?auto_639781 ?auto_639784 ) ) ( not ( = ?auto_639781 ?auto_639785 ) ) ( not ( = ?auto_639781 ?auto_639786 ) ) ( not ( = ?auto_639781 ?auto_639787 ) ) ( not ( = ?auto_639781 ?auto_639788 ) ) ( not ( = ?auto_639781 ?auto_639789 ) ) ( not ( = ?auto_639781 ?auto_639790 ) ) ( not ( = ?auto_639781 ?auto_639791 ) ) ( not ( = ?auto_639781 ?auto_639792 ) ) ( not ( = ?auto_639781 ?auto_639793 ) ) ( not ( = ?auto_639781 ?auto_639794 ) ) ( not ( = ?auto_639782 ?auto_639783 ) ) ( not ( = ?auto_639782 ?auto_639784 ) ) ( not ( = ?auto_639782 ?auto_639785 ) ) ( not ( = ?auto_639782 ?auto_639786 ) ) ( not ( = ?auto_639782 ?auto_639787 ) ) ( not ( = ?auto_639782 ?auto_639788 ) ) ( not ( = ?auto_639782 ?auto_639789 ) ) ( not ( = ?auto_639782 ?auto_639790 ) ) ( not ( = ?auto_639782 ?auto_639791 ) ) ( not ( = ?auto_639782 ?auto_639792 ) ) ( not ( = ?auto_639782 ?auto_639793 ) ) ( not ( = ?auto_639782 ?auto_639794 ) ) ( not ( = ?auto_639783 ?auto_639784 ) ) ( not ( = ?auto_639783 ?auto_639785 ) ) ( not ( = ?auto_639783 ?auto_639786 ) ) ( not ( = ?auto_639783 ?auto_639787 ) ) ( not ( = ?auto_639783 ?auto_639788 ) ) ( not ( = ?auto_639783 ?auto_639789 ) ) ( not ( = ?auto_639783 ?auto_639790 ) ) ( not ( = ?auto_639783 ?auto_639791 ) ) ( not ( = ?auto_639783 ?auto_639792 ) ) ( not ( = ?auto_639783 ?auto_639793 ) ) ( not ( = ?auto_639783 ?auto_639794 ) ) ( not ( = ?auto_639784 ?auto_639785 ) ) ( not ( = ?auto_639784 ?auto_639786 ) ) ( not ( = ?auto_639784 ?auto_639787 ) ) ( not ( = ?auto_639784 ?auto_639788 ) ) ( not ( = ?auto_639784 ?auto_639789 ) ) ( not ( = ?auto_639784 ?auto_639790 ) ) ( not ( = ?auto_639784 ?auto_639791 ) ) ( not ( = ?auto_639784 ?auto_639792 ) ) ( not ( = ?auto_639784 ?auto_639793 ) ) ( not ( = ?auto_639784 ?auto_639794 ) ) ( not ( = ?auto_639785 ?auto_639786 ) ) ( not ( = ?auto_639785 ?auto_639787 ) ) ( not ( = ?auto_639785 ?auto_639788 ) ) ( not ( = ?auto_639785 ?auto_639789 ) ) ( not ( = ?auto_639785 ?auto_639790 ) ) ( not ( = ?auto_639785 ?auto_639791 ) ) ( not ( = ?auto_639785 ?auto_639792 ) ) ( not ( = ?auto_639785 ?auto_639793 ) ) ( not ( = ?auto_639785 ?auto_639794 ) ) ( not ( = ?auto_639786 ?auto_639787 ) ) ( not ( = ?auto_639786 ?auto_639788 ) ) ( not ( = ?auto_639786 ?auto_639789 ) ) ( not ( = ?auto_639786 ?auto_639790 ) ) ( not ( = ?auto_639786 ?auto_639791 ) ) ( not ( = ?auto_639786 ?auto_639792 ) ) ( not ( = ?auto_639786 ?auto_639793 ) ) ( not ( = ?auto_639786 ?auto_639794 ) ) ( not ( = ?auto_639787 ?auto_639788 ) ) ( not ( = ?auto_639787 ?auto_639789 ) ) ( not ( = ?auto_639787 ?auto_639790 ) ) ( not ( = ?auto_639787 ?auto_639791 ) ) ( not ( = ?auto_639787 ?auto_639792 ) ) ( not ( = ?auto_639787 ?auto_639793 ) ) ( not ( = ?auto_639787 ?auto_639794 ) ) ( not ( = ?auto_639788 ?auto_639789 ) ) ( not ( = ?auto_639788 ?auto_639790 ) ) ( not ( = ?auto_639788 ?auto_639791 ) ) ( not ( = ?auto_639788 ?auto_639792 ) ) ( not ( = ?auto_639788 ?auto_639793 ) ) ( not ( = ?auto_639788 ?auto_639794 ) ) ( not ( = ?auto_639789 ?auto_639790 ) ) ( not ( = ?auto_639789 ?auto_639791 ) ) ( not ( = ?auto_639789 ?auto_639792 ) ) ( not ( = ?auto_639789 ?auto_639793 ) ) ( not ( = ?auto_639789 ?auto_639794 ) ) ( not ( = ?auto_639790 ?auto_639791 ) ) ( not ( = ?auto_639790 ?auto_639792 ) ) ( not ( = ?auto_639790 ?auto_639793 ) ) ( not ( = ?auto_639790 ?auto_639794 ) ) ( not ( = ?auto_639791 ?auto_639792 ) ) ( not ( = ?auto_639791 ?auto_639793 ) ) ( not ( = ?auto_639791 ?auto_639794 ) ) ( not ( = ?auto_639792 ?auto_639793 ) ) ( not ( = ?auto_639792 ?auto_639794 ) ) ( not ( = ?auto_639793 ?auto_639794 ) ) ( ON ?auto_639792 ?auto_639793 ) ( ON ?auto_639791 ?auto_639792 ) ( ON ?auto_639790 ?auto_639791 ) ( ON ?auto_639789 ?auto_639790 ) ( CLEAR ?auto_639787 ) ( ON ?auto_639788 ?auto_639789 ) ( CLEAR ?auto_639788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_639779 ?auto_639780 ?auto_639781 ?auto_639782 ?auto_639783 ?auto_639784 ?auto_639785 ?auto_639786 ?auto_639787 ?auto_639788 )
      ( MAKE-15PILE ?auto_639779 ?auto_639780 ?auto_639781 ?auto_639782 ?auto_639783 ?auto_639784 ?auto_639785 ?auto_639786 ?auto_639787 ?auto_639788 ?auto_639789 ?auto_639790 ?auto_639791 ?auto_639792 ?auto_639793 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_639841 - BLOCK
      ?auto_639842 - BLOCK
      ?auto_639843 - BLOCK
      ?auto_639844 - BLOCK
      ?auto_639845 - BLOCK
      ?auto_639846 - BLOCK
      ?auto_639847 - BLOCK
      ?auto_639848 - BLOCK
      ?auto_639849 - BLOCK
      ?auto_639850 - BLOCK
      ?auto_639851 - BLOCK
      ?auto_639852 - BLOCK
      ?auto_639853 - BLOCK
      ?auto_639854 - BLOCK
      ?auto_639855 - BLOCK
    )
    :vars
    (
      ?auto_639856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_639855 ?auto_639856 ) ( ON-TABLE ?auto_639841 ) ( ON ?auto_639842 ?auto_639841 ) ( ON ?auto_639843 ?auto_639842 ) ( ON ?auto_639844 ?auto_639843 ) ( ON ?auto_639845 ?auto_639844 ) ( ON ?auto_639846 ?auto_639845 ) ( ON ?auto_639847 ?auto_639846 ) ( ON ?auto_639848 ?auto_639847 ) ( not ( = ?auto_639841 ?auto_639842 ) ) ( not ( = ?auto_639841 ?auto_639843 ) ) ( not ( = ?auto_639841 ?auto_639844 ) ) ( not ( = ?auto_639841 ?auto_639845 ) ) ( not ( = ?auto_639841 ?auto_639846 ) ) ( not ( = ?auto_639841 ?auto_639847 ) ) ( not ( = ?auto_639841 ?auto_639848 ) ) ( not ( = ?auto_639841 ?auto_639849 ) ) ( not ( = ?auto_639841 ?auto_639850 ) ) ( not ( = ?auto_639841 ?auto_639851 ) ) ( not ( = ?auto_639841 ?auto_639852 ) ) ( not ( = ?auto_639841 ?auto_639853 ) ) ( not ( = ?auto_639841 ?auto_639854 ) ) ( not ( = ?auto_639841 ?auto_639855 ) ) ( not ( = ?auto_639841 ?auto_639856 ) ) ( not ( = ?auto_639842 ?auto_639843 ) ) ( not ( = ?auto_639842 ?auto_639844 ) ) ( not ( = ?auto_639842 ?auto_639845 ) ) ( not ( = ?auto_639842 ?auto_639846 ) ) ( not ( = ?auto_639842 ?auto_639847 ) ) ( not ( = ?auto_639842 ?auto_639848 ) ) ( not ( = ?auto_639842 ?auto_639849 ) ) ( not ( = ?auto_639842 ?auto_639850 ) ) ( not ( = ?auto_639842 ?auto_639851 ) ) ( not ( = ?auto_639842 ?auto_639852 ) ) ( not ( = ?auto_639842 ?auto_639853 ) ) ( not ( = ?auto_639842 ?auto_639854 ) ) ( not ( = ?auto_639842 ?auto_639855 ) ) ( not ( = ?auto_639842 ?auto_639856 ) ) ( not ( = ?auto_639843 ?auto_639844 ) ) ( not ( = ?auto_639843 ?auto_639845 ) ) ( not ( = ?auto_639843 ?auto_639846 ) ) ( not ( = ?auto_639843 ?auto_639847 ) ) ( not ( = ?auto_639843 ?auto_639848 ) ) ( not ( = ?auto_639843 ?auto_639849 ) ) ( not ( = ?auto_639843 ?auto_639850 ) ) ( not ( = ?auto_639843 ?auto_639851 ) ) ( not ( = ?auto_639843 ?auto_639852 ) ) ( not ( = ?auto_639843 ?auto_639853 ) ) ( not ( = ?auto_639843 ?auto_639854 ) ) ( not ( = ?auto_639843 ?auto_639855 ) ) ( not ( = ?auto_639843 ?auto_639856 ) ) ( not ( = ?auto_639844 ?auto_639845 ) ) ( not ( = ?auto_639844 ?auto_639846 ) ) ( not ( = ?auto_639844 ?auto_639847 ) ) ( not ( = ?auto_639844 ?auto_639848 ) ) ( not ( = ?auto_639844 ?auto_639849 ) ) ( not ( = ?auto_639844 ?auto_639850 ) ) ( not ( = ?auto_639844 ?auto_639851 ) ) ( not ( = ?auto_639844 ?auto_639852 ) ) ( not ( = ?auto_639844 ?auto_639853 ) ) ( not ( = ?auto_639844 ?auto_639854 ) ) ( not ( = ?auto_639844 ?auto_639855 ) ) ( not ( = ?auto_639844 ?auto_639856 ) ) ( not ( = ?auto_639845 ?auto_639846 ) ) ( not ( = ?auto_639845 ?auto_639847 ) ) ( not ( = ?auto_639845 ?auto_639848 ) ) ( not ( = ?auto_639845 ?auto_639849 ) ) ( not ( = ?auto_639845 ?auto_639850 ) ) ( not ( = ?auto_639845 ?auto_639851 ) ) ( not ( = ?auto_639845 ?auto_639852 ) ) ( not ( = ?auto_639845 ?auto_639853 ) ) ( not ( = ?auto_639845 ?auto_639854 ) ) ( not ( = ?auto_639845 ?auto_639855 ) ) ( not ( = ?auto_639845 ?auto_639856 ) ) ( not ( = ?auto_639846 ?auto_639847 ) ) ( not ( = ?auto_639846 ?auto_639848 ) ) ( not ( = ?auto_639846 ?auto_639849 ) ) ( not ( = ?auto_639846 ?auto_639850 ) ) ( not ( = ?auto_639846 ?auto_639851 ) ) ( not ( = ?auto_639846 ?auto_639852 ) ) ( not ( = ?auto_639846 ?auto_639853 ) ) ( not ( = ?auto_639846 ?auto_639854 ) ) ( not ( = ?auto_639846 ?auto_639855 ) ) ( not ( = ?auto_639846 ?auto_639856 ) ) ( not ( = ?auto_639847 ?auto_639848 ) ) ( not ( = ?auto_639847 ?auto_639849 ) ) ( not ( = ?auto_639847 ?auto_639850 ) ) ( not ( = ?auto_639847 ?auto_639851 ) ) ( not ( = ?auto_639847 ?auto_639852 ) ) ( not ( = ?auto_639847 ?auto_639853 ) ) ( not ( = ?auto_639847 ?auto_639854 ) ) ( not ( = ?auto_639847 ?auto_639855 ) ) ( not ( = ?auto_639847 ?auto_639856 ) ) ( not ( = ?auto_639848 ?auto_639849 ) ) ( not ( = ?auto_639848 ?auto_639850 ) ) ( not ( = ?auto_639848 ?auto_639851 ) ) ( not ( = ?auto_639848 ?auto_639852 ) ) ( not ( = ?auto_639848 ?auto_639853 ) ) ( not ( = ?auto_639848 ?auto_639854 ) ) ( not ( = ?auto_639848 ?auto_639855 ) ) ( not ( = ?auto_639848 ?auto_639856 ) ) ( not ( = ?auto_639849 ?auto_639850 ) ) ( not ( = ?auto_639849 ?auto_639851 ) ) ( not ( = ?auto_639849 ?auto_639852 ) ) ( not ( = ?auto_639849 ?auto_639853 ) ) ( not ( = ?auto_639849 ?auto_639854 ) ) ( not ( = ?auto_639849 ?auto_639855 ) ) ( not ( = ?auto_639849 ?auto_639856 ) ) ( not ( = ?auto_639850 ?auto_639851 ) ) ( not ( = ?auto_639850 ?auto_639852 ) ) ( not ( = ?auto_639850 ?auto_639853 ) ) ( not ( = ?auto_639850 ?auto_639854 ) ) ( not ( = ?auto_639850 ?auto_639855 ) ) ( not ( = ?auto_639850 ?auto_639856 ) ) ( not ( = ?auto_639851 ?auto_639852 ) ) ( not ( = ?auto_639851 ?auto_639853 ) ) ( not ( = ?auto_639851 ?auto_639854 ) ) ( not ( = ?auto_639851 ?auto_639855 ) ) ( not ( = ?auto_639851 ?auto_639856 ) ) ( not ( = ?auto_639852 ?auto_639853 ) ) ( not ( = ?auto_639852 ?auto_639854 ) ) ( not ( = ?auto_639852 ?auto_639855 ) ) ( not ( = ?auto_639852 ?auto_639856 ) ) ( not ( = ?auto_639853 ?auto_639854 ) ) ( not ( = ?auto_639853 ?auto_639855 ) ) ( not ( = ?auto_639853 ?auto_639856 ) ) ( not ( = ?auto_639854 ?auto_639855 ) ) ( not ( = ?auto_639854 ?auto_639856 ) ) ( not ( = ?auto_639855 ?auto_639856 ) ) ( ON ?auto_639854 ?auto_639855 ) ( ON ?auto_639853 ?auto_639854 ) ( ON ?auto_639852 ?auto_639853 ) ( ON ?auto_639851 ?auto_639852 ) ( ON ?auto_639850 ?auto_639851 ) ( CLEAR ?auto_639848 ) ( ON ?auto_639849 ?auto_639850 ) ( CLEAR ?auto_639849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_639841 ?auto_639842 ?auto_639843 ?auto_639844 ?auto_639845 ?auto_639846 ?auto_639847 ?auto_639848 ?auto_639849 )
      ( MAKE-15PILE ?auto_639841 ?auto_639842 ?auto_639843 ?auto_639844 ?auto_639845 ?auto_639846 ?auto_639847 ?auto_639848 ?auto_639849 ?auto_639850 ?auto_639851 ?auto_639852 ?auto_639853 ?auto_639854 ?auto_639855 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_639903 - BLOCK
      ?auto_639904 - BLOCK
      ?auto_639905 - BLOCK
      ?auto_639906 - BLOCK
      ?auto_639907 - BLOCK
      ?auto_639908 - BLOCK
      ?auto_639909 - BLOCK
      ?auto_639910 - BLOCK
      ?auto_639911 - BLOCK
      ?auto_639912 - BLOCK
      ?auto_639913 - BLOCK
      ?auto_639914 - BLOCK
      ?auto_639915 - BLOCK
      ?auto_639916 - BLOCK
      ?auto_639917 - BLOCK
    )
    :vars
    (
      ?auto_639918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_639917 ?auto_639918 ) ( ON-TABLE ?auto_639903 ) ( ON ?auto_639904 ?auto_639903 ) ( ON ?auto_639905 ?auto_639904 ) ( ON ?auto_639906 ?auto_639905 ) ( ON ?auto_639907 ?auto_639906 ) ( ON ?auto_639908 ?auto_639907 ) ( ON ?auto_639909 ?auto_639908 ) ( not ( = ?auto_639903 ?auto_639904 ) ) ( not ( = ?auto_639903 ?auto_639905 ) ) ( not ( = ?auto_639903 ?auto_639906 ) ) ( not ( = ?auto_639903 ?auto_639907 ) ) ( not ( = ?auto_639903 ?auto_639908 ) ) ( not ( = ?auto_639903 ?auto_639909 ) ) ( not ( = ?auto_639903 ?auto_639910 ) ) ( not ( = ?auto_639903 ?auto_639911 ) ) ( not ( = ?auto_639903 ?auto_639912 ) ) ( not ( = ?auto_639903 ?auto_639913 ) ) ( not ( = ?auto_639903 ?auto_639914 ) ) ( not ( = ?auto_639903 ?auto_639915 ) ) ( not ( = ?auto_639903 ?auto_639916 ) ) ( not ( = ?auto_639903 ?auto_639917 ) ) ( not ( = ?auto_639903 ?auto_639918 ) ) ( not ( = ?auto_639904 ?auto_639905 ) ) ( not ( = ?auto_639904 ?auto_639906 ) ) ( not ( = ?auto_639904 ?auto_639907 ) ) ( not ( = ?auto_639904 ?auto_639908 ) ) ( not ( = ?auto_639904 ?auto_639909 ) ) ( not ( = ?auto_639904 ?auto_639910 ) ) ( not ( = ?auto_639904 ?auto_639911 ) ) ( not ( = ?auto_639904 ?auto_639912 ) ) ( not ( = ?auto_639904 ?auto_639913 ) ) ( not ( = ?auto_639904 ?auto_639914 ) ) ( not ( = ?auto_639904 ?auto_639915 ) ) ( not ( = ?auto_639904 ?auto_639916 ) ) ( not ( = ?auto_639904 ?auto_639917 ) ) ( not ( = ?auto_639904 ?auto_639918 ) ) ( not ( = ?auto_639905 ?auto_639906 ) ) ( not ( = ?auto_639905 ?auto_639907 ) ) ( not ( = ?auto_639905 ?auto_639908 ) ) ( not ( = ?auto_639905 ?auto_639909 ) ) ( not ( = ?auto_639905 ?auto_639910 ) ) ( not ( = ?auto_639905 ?auto_639911 ) ) ( not ( = ?auto_639905 ?auto_639912 ) ) ( not ( = ?auto_639905 ?auto_639913 ) ) ( not ( = ?auto_639905 ?auto_639914 ) ) ( not ( = ?auto_639905 ?auto_639915 ) ) ( not ( = ?auto_639905 ?auto_639916 ) ) ( not ( = ?auto_639905 ?auto_639917 ) ) ( not ( = ?auto_639905 ?auto_639918 ) ) ( not ( = ?auto_639906 ?auto_639907 ) ) ( not ( = ?auto_639906 ?auto_639908 ) ) ( not ( = ?auto_639906 ?auto_639909 ) ) ( not ( = ?auto_639906 ?auto_639910 ) ) ( not ( = ?auto_639906 ?auto_639911 ) ) ( not ( = ?auto_639906 ?auto_639912 ) ) ( not ( = ?auto_639906 ?auto_639913 ) ) ( not ( = ?auto_639906 ?auto_639914 ) ) ( not ( = ?auto_639906 ?auto_639915 ) ) ( not ( = ?auto_639906 ?auto_639916 ) ) ( not ( = ?auto_639906 ?auto_639917 ) ) ( not ( = ?auto_639906 ?auto_639918 ) ) ( not ( = ?auto_639907 ?auto_639908 ) ) ( not ( = ?auto_639907 ?auto_639909 ) ) ( not ( = ?auto_639907 ?auto_639910 ) ) ( not ( = ?auto_639907 ?auto_639911 ) ) ( not ( = ?auto_639907 ?auto_639912 ) ) ( not ( = ?auto_639907 ?auto_639913 ) ) ( not ( = ?auto_639907 ?auto_639914 ) ) ( not ( = ?auto_639907 ?auto_639915 ) ) ( not ( = ?auto_639907 ?auto_639916 ) ) ( not ( = ?auto_639907 ?auto_639917 ) ) ( not ( = ?auto_639907 ?auto_639918 ) ) ( not ( = ?auto_639908 ?auto_639909 ) ) ( not ( = ?auto_639908 ?auto_639910 ) ) ( not ( = ?auto_639908 ?auto_639911 ) ) ( not ( = ?auto_639908 ?auto_639912 ) ) ( not ( = ?auto_639908 ?auto_639913 ) ) ( not ( = ?auto_639908 ?auto_639914 ) ) ( not ( = ?auto_639908 ?auto_639915 ) ) ( not ( = ?auto_639908 ?auto_639916 ) ) ( not ( = ?auto_639908 ?auto_639917 ) ) ( not ( = ?auto_639908 ?auto_639918 ) ) ( not ( = ?auto_639909 ?auto_639910 ) ) ( not ( = ?auto_639909 ?auto_639911 ) ) ( not ( = ?auto_639909 ?auto_639912 ) ) ( not ( = ?auto_639909 ?auto_639913 ) ) ( not ( = ?auto_639909 ?auto_639914 ) ) ( not ( = ?auto_639909 ?auto_639915 ) ) ( not ( = ?auto_639909 ?auto_639916 ) ) ( not ( = ?auto_639909 ?auto_639917 ) ) ( not ( = ?auto_639909 ?auto_639918 ) ) ( not ( = ?auto_639910 ?auto_639911 ) ) ( not ( = ?auto_639910 ?auto_639912 ) ) ( not ( = ?auto_639910 ?auto_639913 ) ) ( not ( = ?auto_639910 ?auto_639914 ) ) ( not ( = ?auto_639910 ?auto_639915 ) ) ( not ( = ?auto_639910 ?auto_639916 ) ) ( not ( = ?auto_639910 ?auto_639917 ) ) ( not ( = ?auto_639910 ?auto_639918 ) ) ( not ( = ?auto_639911 ?auto_639912 ) ) ( not ( = ?auto_639911 ?auto_639913 ) ) ( not ( = ?auto_639911 ?auto_639914 ) ) ( not ( = ?auto_639911 ?auto_639915 ) ) ( not ( = ?auto_639911 ?auto_639916 ) ) ( not ( = ?auto_639911 ?auto_639917 ) ) ( not ( = ?auto_639911 ?auto_639918 ) ) ( not ( = ?auto_639912 ?auto_639913 ) ) ( not ( = ?auto_639912 ?auto_639914 ) ) ( not ( = ?auto_639912 ?auto_639915 ) ) ( not ( = ?auto_639912 ?auto_639916 ) ) ( not ( = ?auto_639912 ?auto_639917 ) ) ( not ( = ?auto_639912 ?auto_639918 ) ) ( not ( = ?auto_639913 ?auto_639914 ) ) ( not ( = ?auto_639913 ?auto_639915 ) ) ( not ( = ?auto_639913 ?auto_639916 ) ) ( not ( = ?auto_639913 ?auto_639917 ) ) ( not ( = ?auto_639913 ?auto_639918 ) ) ( not ( = ?auto_639914 ?auto_639915 ) ) ( not ( = ?auto_639914 ?auto_639916 ) ) ( not ( = ?auto_639914 ?auto_639917 ) ) ( not ( = ?auto_639914 ?auto_639918 ) ) ( not ( = ?auto_639915 ?auto_639916 ) ) ( not ( = ?auto_639915 ?auto_639917 ) ) ( not ( = ?auto_639915 ?auto_639918 ) ) ( not ( = ?auto_639916 ?auto_639917 ) ) ( not ( = ?auto_639916 ?auto_639918 ) ) ( not ( = ?auto_639917 ?auto_639918 ) ) ( ON ?auto_639916 ?auto_639917 ) ( ON ?auto_639915 ?auto_639916 ) ( ON ?auto_639914 ?auto_639915 ) ( ON ?auto_639913 ?auto_639914 ) ( ON ?auto_639912 ?auto_639913 ) ( ON ?auto_639911 ?auto_639912 ) ( CLEAR ?auto_639909 ) ( ON ?auto_639910 ?auto_639911 ) ( CLEAR ?auto_639910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_639903 ?auto_639904 ?auto_639905 ?auto_639906 ?auto_639907 ?auto_639908 ?auto_639909 ?auto_639910 )
      ( MAKE-15PILE ?auto_639903 ?auto_639904 ?auto_639905 ?auto_639906 ?auto_639907 ?auto_639908 ?auto_639909 ?auto_639910 ?auto_639911 ?auto_639912 ?auto_639913 ?auto_639914 ?auto_639915 ?auto_639916 ?auto_639917 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_639965 - BLOCK
      ?auto_639966 - BLOCK
      ?auto_639967 - BLOCK
      ?auto_639968 - BLOCK
      ?auto_639969 - BLOCK
      ?auto_639970 - BLOCK
      ?auto_639971 - BLOCK
      ?auto_639972 - BLOCK
      ?auto_639973 - BLOCK
      ?auto_639974 - BLOCK
      ?auto_639975 - BLOCK
      ?auto_639976 - BLOCK
      ?auto_639977 - BLOCK
      ?auto_639978 - BLOCK
      ?auto_639979 - BLOCK
    )
    :vars
    (
      ?auto_639980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_639979 ?auto_639980 ) ( ON-TABLE ?auto_639965 ) ( ON ?auto_639966 ?auto_639965 ) ( ON ?auto_639967 ?auto_639966 ) ( ON ?auto_639968 ?auto_639967 ) ( ON ?auto_639969 ?auto_639968 ) ( ON ?auto_639970 ?auto_639969 ) ( not ( = ?auto_639965 ?auto_639966 ) ) ( not ( = ?auto_639965 ?auto_639967 ) ) ( not ( = ?auto_639965 ?auto_639968 ) ) ( not ( = ?auto_639965 ?auto_639969 ) ) ( not ( = ?auto_639965 ?auto_639970 ) ) ( not ( = ?auto_639965 ?auto_639971 ) ) ( not ( = ?auto_639965 ?auto_639972 ) ) ( not ( = ?auto_639965 ?auto_639973 ) ) ( not ( = ?auto_639965 ?auto_639974 ) ) ( not ( = ?auto_639965 ?auto_639975 ) ) ( not ( = ?auto_639965 ?auto_639976 ) ) ( not ( = ?auto_639965 ?auto_639977 ) ) ( not ( = ?auto_639965 ?auto_639978 ) ) ( not ( = ?auto_639965 ?auto_639979 ) ) ( not ( = ?auto_639965 ?auto_639980 ) ) ( not ( = ?auto_639966 ?auto_639967 ) ) ( not ( = ?auto_639966 ?auto_639968 ) ) ( not ( = ?auto_639966 ?auto_639969 ) ) ( not ( = ?auto_639966 ?auto_639970 ) ) ( not ( = ?auto_639966 ?auto_639971 ) ) ( not ( = ?auto_639966 ?auto_639972 ) ) ( not ( = ?auto_639966 ?auto_639973 ) ) ( not ( = ?auto_639966 ?auto_639974 ) ) ( not ( = ?auto_639966 ?auto_639975 ) ) ( not ( = ?auto_639966 ?auto_639976 ) ) ( not ( = ?auto_639966 ?auto_639977 ) ) ( not ( = ?auto_639966 ?auto_639978 ) ) ( not ( = ?auto_639966 ?auto_639979 ) ) ( not ( = ?auto_639966 ?auto_639980 ) ) ( not ( = ?auto_639967 ?auto_639968 ) ) ( not ( = ?auto_639967 ?auto_639969 ) ) ( not ( = ?auto_639967 ?auto_639970 ) ) ( not ( = ?auto_639967 ?auto_639971 ) ) ( not ( = ?auto_639967 ?auto_639972 ) ) ( not ( = ?auto_639967 ?auto_639973 ) ) ( not ( = ?auto_639967 ?auto_639974 ) ) ( not ( = ?auto_639967 ?auto_639975 ) ) ( not ( = ?auto_639967 ?auto_639976 ) ) ( not ( = ?auto_639967 ?auto_639977 ) ) ( not ( = ?auto_639967 ?auto_639978 ) ) ( not ( = ?auto_639967 ?auto_639979 ) ) ( not ( = ?auto_639967 ?auto_639980 ) ) ( not ( = ?auto_639968 ?auto_639969 ) ) ( not ( = ?auto_639968 ?auto_639970 ) ) ( not ( = ?auto_639968 ?auto_639971 ) ) ( not ( = ?auto_639968 ?auto_639972 ) ) ( not ( = ?auto_639968 ?auto_639973 ) ) ( not ( = ?auto_639968 ?auto_639974 ) ) ( not ( = ?auto_639968 ?auto_639975 ) ) ( not ( = ?auto_639968 ?auto_639976 ) ) ( not ( = ?auto_639968 ?auto_639977 ) ) ( not ( = ?auto_639968 ?auto_639978 ) ) ( not ( = ?auto_639968 ?auto_639979 ) ) ( not ( = ?auto_639968 ?auto_639980 ) ) ( not ( = ?auto_639969 ?auto_639970 ) ) ( not ( = ?auto_639969 ?auto_639971 ) ) ( not ( = ?auto_639969 ?auto_639972 ) ) ( not ( = ?auto_639969 ?auto_639973 ) ) ( not ( = ?auto_639969 ?auto_639974 ) ) ( not ( = ?auto_639969 ?auto_639975 ) ) ( not ( = ?auto_639969 ?auto_639976 ) ) ( not ( = ?auto_639969 ?auto_639977 ) ) ( not ( = ?auto_639969 ?auto_639978 ) ) ( not ( = ?auto_639969 ?auto_639979 ) ) ( not ( = ?auto_639969 ?auto_639980 ) ) ( not ( = ?auto_639970 ?auto_639971 ) ) ( not ( = ?auto_639970 ?auto_639972 ) ) ( not ( = ?auto_639970 ?auto_639973 ) ) ( not ( = ?auto_639970 ?auto_639974 ) ) ( not ( = ?auto_639970 ?auto_639975 ) ) ( not ( = ?auto_639970 ?auto_639976 ) ) ( not ( = ?auto_639970 ?auto_639977 ) ) ( not ( = ?auto_639970 ?auto_639978 ) ) ( not ( = ?auto_639970 ?auto_639979 ) ) ( not ( = ?auto_639970 ?auto_639980 ) ) ( not ( = ?auto_639971 ?auto_639972 ) ) ( not ( = ?auto_639971 ?auto_639973 ) ) ( not ( = ?auto_639971 ?auto_639974 ) ) ( not ( = ?auto_639971 ?auto_639975 ) ) ( not ( = ?auto_639971 ?auto_639976 ) ) ( not ( = ?auto_639971 ?auto_639977 ) ) ( not ( = ?auto_639971 ?auto_639978 ) ) ( not ( = ?auto_639971 ?auto_639979 ) ) ( not ( = ?auto_639971 ?auto_639980 ) ) ( not ( = ?auto_639972 ?auto_639973 ) ) ( not ( = ?auto_639972 ?auto_639974 ) ) ( not ( = ?auto_639972 ?auto_639975 ) ) ( not ( = ?auto_639972 ?auto_639976 ) ) ( not ( = ?auto_639972 ?auto_639977 ) ) ( not ( = ?auto_639972 ?auto_639978 ) ) ( not ( = ?auto_639972 ?auto_639979 ) ) ( not ( = ?auto_639972 ?auto_639980 ) ) ( not ( = ?auto_639973 ?auto_639974 ) ) ( not ( = ?auto_639973 ?auto_639975 ) ) ( not ( = ?auto_639973 ?auto_639976 ) ) ( not ( = ?auto_639973 ?auto_639977 ) ) ( not ( = ?auto_639973 ?auto_639978 ) ) ( not ( = ?auto_639973 ?auto_639979 ) ) ( not ( = ?auto_639973 ?auto_639980 ) ) ( not ( = ?auto_639974 ?auto_639975 ) ) ( not ( = ?auto_639974 ?auto_639976 ) ) ( not ( = ?auto_639974 ?auto_639977 ) ) ( not ( = ?auto_639974 ?auto_639978 ) ) ( not ( = ?auto_639974 ?auto_639979 ) ) ( not ( = ?auto_639974 ?auto_639980 ) ) ( not ( = ?auto_639975 ?auto_639976 ) ) ( not ( = ?auto_639975 ?auto_639977 ) ) ( not ( = ?auto_639975 ?auto_639978 ) ) ( not ( = ?auto_639975 ?auto_639979 ) ) ( not ( = ?auto_639975 ?auto_639980 ) ) ( not ( = ?auto_639976 ?auto_639977 ) ) ( not ( = ?auto_639976 ?auto_639978 ) ) ( not ( = ?auto_639976 ?auto_639979 ) ) ( not ( = ?auto_639976 ?auto_639980 ) ) ( not ( = ?auto_639977 ?auto_639978 ) ) ( not ( = ?auto_639977 ?auto_639979 ) ) ( not ( = ?auto_639977 ?auto_639980 ) ) ( not ( = ?auto_639978 ?auto_639979 ) ) ( not ( = ?auto_639978 ?auto_639980 ) ) ( not ( = ?auto_639979 ?auto_639980 ) ) ( ON ?auto_639978 ?auto_639979 ) ( ON ?auto_639977 ?auto_639978 ) ( ON ?auto_639976 ?auto_639977 ) ( ON ?auto_639975 ?auto_639976 ) ( ON ?auto_639974 ?auto_639975 ) ( ON ?auto_639973 ?auto_639974 ) ( ON ?auto_639972 ?auto_639973 ) ( CLEAR ?auto_639970 ) ( ON ?auto_639971 ?auto_639972 ) ( CLEAR ?auto_639971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_639965 ?auto_639966 ?auto_639967 ?auto_639968 ?auto_639969 ?auto_639970 ?auto_639971 )
      ( MAKE-15PILE ?auto_639965 ?auto_639966 ?auto_639967 ?auto_639968 ?auto_639969 ?auto_639970 ?auto_639971 ?auto_639972 ?auto_639973 ?auto_639974 ?auto_639975 ?auto_639976 ?auto_639977 ?auto_639978 ?auto_639979 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_640027 - BLOCK
      ?auto_640028 - BLOCK
      ?auto_640029 - BLOCK
      ?auto_640030 - BLOCK
      ?auto_640031 - BLOCK
      ?auto_640032 - BLOCK
      ?auto_640033 - BLOCK
      ?auto_640034 - BLOCK
      ?auto_640035 - BLOCK
      ?auto_640036 - BLOCK
      ?auto_640037 - BLOCK
      ?auto_640038 - BLOCK
      ?auto_640039 - BLOCK
      ?auto_640040 - BLOCK
      ?auto_640041 - BLOCK
    )
    :vars
    (
      ?auto_640042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_640041 ?auto_640042 ) ( ON-TABLE ?auto_640027 ) ( ON ?auto_640028 ?auto_640027 ) ( ON ?auto_640029 ?auto_640028 ) ( ON ?auto_640030 ?auto_640029 ) ( ON ?auto_640031 ?auto_640030 ) ( not ( = ?auto_640027 ?auto_640028 ) ) ( not ( = ?auto_640027 ?auto_640029 ) ) ( not ( = ?auto_640027 ?auto_640030 ) ) ( not ( = ?auto_640027 ?auto_640031 ) ) ( not ( = ?auto_640027 ?auto_640032 ) ) ( not ( = ?auto_640027 ?auto_640033 ) ) ( not ( = ?auto_640027 ?auto_640034 ) ) ( not ( = ?auto_640027 ?auto_640035 ) ) ( not ( = ?auto_640027 ?auto_640036 ) ) ( not ( = ?auto_640027 ?auto_640037 ) ) ( not ( = ?auto_640027 ?auto_640038 ) ) ( not ( = ?auto_640027 ?auto_640039 ) ) ( not ( = ?auto_640027 ?auto_640040 ) ) ( not ( = ?auto_640027 ?auto_640041 ) ) ( not ( = ?auto_640027 ?auto_640042 ) ) ( not ( = ?auto_640028 ?auto_640029 ) ) ( not ( = ?auto_640028 ?auto_640030 ) ) ( not ( = ?auto_640028 ?auto_640031 ) ) ( not ( = ?auto_640028 ?auto_640032 ) ) ( not ( = ?auto_640028 ?auto_640033 ) ) ( not ( = ?auto_640028 ?auto_640034 ) ) ( not ( = ?auto_640028 ?auto_640035 ) ) ( not ( = ?auto_640028 ?auto_640036 ) ) ( not ( = ?auto_640028 ?auto_640037 ) ) ( not ( = ?auto_640028 ?auto_640038 ) ) ( not ( = ?auto_640028 ?auto_640039 ) ) ( not ( = ?auto_640028 ?auto_640040 ) ) ( not ( = ?auto_640028 ?auto_640041 ) ) ( not ( = ?auto_640028 ?auto_640042 ) ) ( not ( = ?auto_640029 ?auto_640030 ) ) ( not ( = ?auto_640029 ?auto_640031 ) ) ( not ( = ?auto_640029 ?auto_640032 ) ) ( not ( = ?auto_640029 ?auto_640033 ) ) ( not ( = ?auto_640029 ?auto_640034 ) ) ( not ( = ?auto_640029 ?auto_640035 ) ) ( not ( = ?auto_640029 ?auto_640036 ) ) ( not ( = ?auto_640029 ?auto_640037 ) ) ( not ( = ?auto_640029 ?auto_640038 ) ) ( not ( = ?auto_640029 ?auto_640039 ) ) ( not ( = ?auto_640029 ?auto_640040 ) ) ( not ( = ?auto_640029 ?auto_640041 ) ) ( not ( = ?auto_640029 ?auto_640042 ) ) ( not ( = ?auto_640030 ?auto_640031 ) ) ( not ( = ?auto_640030 ?auto_640032 ) ) ( not ( = ?auto_640030 ?auto_640033 ) ) ( not ( = ?auto_640030 ?auto_640034 ) ) ( not ( = ?auto_640030 ?auto_640035 ) ) ( not ( = ?auto_640030 ?auto_640036 ) ) ( not ( = ?auto_640030 ?auto_640037 ) ) ( not ( = ?auto_640030 ?auto_640038 ) ) ( not ( = ?auto_640030 ?auto_640039 ) ) ( not ( = ?auto_640030 ?auto_640040 ) ) ( not ( = ?auto_640030 ?auto_640041 ) ) ( not ( = ?auto_640030 ?auto_640042 ) ) ( not ( = ?auto_640031 ?auto_640032 ) ) ( not ( = ?auto_640031 ?auto_640033 ) ) ( not ( = ?auto_640031 ?auto_640034 ) ) ( not ( = ?auto_640031 ?auto_640035 ) ) ( not ( = ?auto_640031 ?auto_640036 ) ) ( not ( = ?auto_640031 ?auto_640037 ) ) ( not ( = ?auto_640031 ?auto_640038 ) ) ( not ( = ?auto_640031 ?auto_640039 ) ) ( not ( = ?auto_640031 ?auto_640040 ) ) ( not ( = ?auto_640031 ?auto_640041 ) ) ( not ( = ?auto_640031 ?auto_640042 ) ) ( not ( = ?auto_640032 ?auto_640033 ) ) ( not ( = ?auto_640032 ?auto_640034 ) ) ( not ( = ?auto_640032 ?auto_640035 ) ) ( not ( = ?auto_640032 ?auto_640036 ) ) ( not ( = ?auto_640032 ?auto_640037 ) ) ( not ( = ?auto_640032 ?auto_640038 ) ) ( not ( = ?auto_640032 ?auto_640039 ) ) ( not ( = ?auto_640032 ?auto_640040 ) ) ( not ( = ?auto_640032 ?auto_640041 ) ) ( not ( = ?auto_640032 ?auto_640042 ) ) ( not ( = ?auto_640033 ?auto_640034 ) ) ( not ( = ?auto_640033 ?auto_640035 ) ) ( not ( = ?auto_640033 ?auto_640036 ) ) ( not ( = ?auto_640033 ?auto_640037 ) ) ( not ( = ?auto_640033 ?auto_640038 ) ) ( not ( = ?auto_640033 ?auto_640039 ) ) ( not ( = ?auto_640033 ?auto_640040 ) ) ( not ( = ?auto_640033 ?auto_640041 ) ) ( not ( = ?auto_640033 ?auto_640042 ) ) ( not ( = ?auto_640034 ?auto_640035 ) ) ( not ( = ?auto_640034 ?auto_640036 ) ) ( not ( = ?auto_640034 ?auto_640037 ) ) ( not ( = ?auto_640034 ?auto_640038 ) ) ( not ( = ?auto_640034 ?auto_640039 ) ) ( not ( = ?auto_640034 ?auto_640040 ) ) ( not ( = ?auto_640034 ?auto_640041 ) ) ( not ( = ?auto_640034 ?auto_640042 ) ) ( not ( = ?auto_640035 ?auto_640036 ) ) ( not ( = ?auto_640035 ?auto_640037 ) ) ( not ( = ?auto_640035 ?auto_640038 ) ) ( not ( = ?auto_640035 ?auto_640039 ) ) ( not ( = ?auto_640035 ?auto_640040 ) ) ( not ( = ?auto_640035 ?auto_640041 ) ) ( not ( = ?auto_640035 ?auto_640042 ) ) ( not ( = ?auto_640036 ?auto_640037 ) ) ( not ( = ?auto_640036 ?auto_640038 ) ) ( not ( = ?auto_640036 ?auto_640039 ) ) ( not ( = ?auto_640036 ?auto_640040 ) ) ( not ( = ?auto_640036 ?auto_640041 ) ) ( not ( = ?auto_640036 ?auto_640042 ) ) ( not ( = ?auto_640037 ?auto_640038 ) ) ( not ( = ?auto_640037 ?auto_640039 ) ) ( not ( = ?auto_640037 ?auto_640040 ) ) ( not ( = ?auto_640037 ?auto_640041 ) ) ( not ( = ?auto_640037 ?auto_640042 ) ) ( not ( = ?auto_640038 ?auto_640039 ) ) ( not ( = ?auto_640038 ?auto_640040 ) ) ( not ( = ?auto_640038 ?auto_640041 ) ) ( not ( = ?auto_640038 ?auto_640042 ) ) ( not ( = ?auto_640039 ?auto_640040 ) ) ( not ( = ?auto_640039 ?auto_640041 ) ) ( not ( = ?auto_640039 ?auto_640042 ) ) ( not ( = ?auto_640040 ?auto_640041 ) ) ( not ( = ?auto_640040 ?auto_640042 ) ) ( not ( = ?auto_640041 ?auto_640042 ) ) ( ON ?auto_640040 ?auto_640041 ) ( ON ?auto_640039 ?auto_640040 ) ( ON ?auto_640038 ?auto_640039 ) ( ON ?auto_640037 ?auto_640038 ) ( ON ?auto_640036 ?auto_640037 ) ( ON ?auto_640035 ?auto_640036 ) ( ON ?auto_640034 ?auto_640035 ) ( ON ?auto_640033 ?auto_640034 ) ( CLEAR ?auto_640031 ) ( ON ?auto_640032 ?auto_640033 ) ( CLEAR ?auto_640032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_640027 ?auto_640028 ?auto_640029 ?auto_640030 ?auto_640031 ?auto_640032 )
      ( MAKE-15PILE ?auto_640027 ?auto_640028 ?auto_640029 ?auto_640030 ?auto_640031 ?auto_640032 ?auto_640033 ?auto_640034 ?auto_640035 ?auto_640036 ?auto_640037 ?auto_640038 ?auto_640039 ?auto_640040 ?auto_640041 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_640089 - BLOCK
      ?auto_640090 - BLOCK
      ?auto_640091 - BLOCK
      ?auto_640092 - BLOCK
      ?auto_640093 - BLOCK
      ?auto_640094 - BLOCK
      ?auto_640095 - BLOCK
      ?auto_640096 - BLOCK
      ?auto_640097 - BLOCK
      ?auto_640098 - BLOCK
      ?auto_640099 - BLOCK
      ?auto_640100 - BLOCK
      ?auto_640101 - BLOCK
      ?auto_640102 - BLOCK
      ?auto_640103 - BLOCK
    )
    :vars
    (
      ?auto_640104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_640103 ?auto_640104 ) ( ON-TABLE ?auto_640089 ) ( ON ?auto_640090 ?auto_640089 ) ( ON ?auto_640091 ?auto_640090 ) ( ON ?auto_640092 ?auto_640091 ) ( not ( = ?auto_640089 ?auto_640090 ) ) ( not ( = ?auto_640089 ?auto_640091 ) ) ( not ( = ?auto_640089 ?auto_640092 ) ) ( not ( = ?auto_640089 ?auto_640093 ) ) ( not ( = ?auto_640089 ?auto_640094 ) ) ( not ( = ?auto_640089 ?auto_640095 ) ) ( not ( = ?auto_640089 ?auto_640096 ) ) ( not ( = ?auto_640089 ?auto_640097 ) ) ( not ( = ?auto_640089 ?auto_640098 ) ) ( not ( = ?auto_640089 ?auto_640099 ) ) ( not ( = ?auto_640089 ?auto_640100 ) ) ( not ( = ?auto_640089 ?auto_640101 ) ) ( not ( = ?auto_640089 ?auto_640102 ) ) ( not ( = ?auto_640089 ?auto_640103 ) ) ( not ( = ?auto_640089 ?auto_640104 ) ) ( not ( = ?auto_640090 ?auto_640091 ) ) ( not ( = ?auto_640090 ?auto_640092 ) ) ( not ( = ?auto_640090 ?auto_640093 ) ) ( not ( = ?auto_640090 ?auto_640094 ) ) ( not ( = ?auto_640090 ?auto_640095 ) ) ( not ( = ?auto_640090 ?auto_640096 ) ) ( not ( = ?auto_640090 ?auto_640097 ) ) ( not ( = ?auto_640090 ?auto_640098 ) ) ( not ( = ?auto_640090 ?auto_640099 ) ) ( not ( = ?auto_640090 ?auto_640100 ) ) ( not ( = ?auto_640090 ?auto_640101 ) ) ( not ( = ?auto_640090 ?auto_640102 ) ) ( not ( = ?auto_640090 ?auto_640103 ) ) ( not ( = ?auto_640090 ?auto_640104 ) ) ( not ( = ?auto_640091 ?auto_640092 ) ) ( not ( = ?auto_640091 ?auto_640093 ) ) ( not ( = ?auto_640091 ?auto_640094 ) ) ( not ( = ?auto_640091 ?auto_640095 ) ) ( not ( = ?auto_640091 ?auto_640096 ) ) ( not ( = ?auto_640091 ?auto_640097 ) ) ( not ( = ?auto_640091 ?auto_640098 ) ) ( not ( = ?auto_640091 ?auto_640099 ) ) ( not ( = ?auto_640091 ?auto_640100 ) ) ( not ( = ?auto_640091 ?auto_640101 ) ) ( not ( = ?auto_640091 ?auto_640102 ) ) ( not ( = ?auto_640091 ?auto_640103 ) ) ( not ( = ?auto_640091 ?auto_640104 ) ) ( not ( = ?auto_640092 ?auto_640093 ) ) ( not ( = ?auto_640092 ?auto_640094 ) ) ( not ( = ?auto_640092 ?auto_640095 ) ) ( not ( = ?auto_640092 ?auto_640096 ) ) ( not ( = ?auto_640092 ?auto_640097 ) ) ( not ( = ?auto_640092 ?auto_640098 ) ) ( not ( = ?auto_640092 ?auto_640099 ) ) ( not ( = ?auto_640092 ?auto_640100 ) ) ( not ( = ?auto_640092 ?auto_640101 ) ) ( not ( = ?auto_640092 ?auto_640102 ) ) ( not ( = ?auto_640092 ?auto_640103 ) ) ( not ( = ?auto_640092 ?auto_640104 ) ) ( not ( = ?auto_640093 ?auto_640094 ) ) ( not ( = ?auto_640093 ?auto_640095 ) ) ( not ( = ?auto_640093 ?auto_640096 ) ) ( not ( = ?auto_640093 ?auto_640097 ) ) ( not ( = ?auto_640093 ?auto_640098 ) ) ( not ( = ?auto_640093 ?auto_640099 ) ) ( not ( = ?auto_640093 ?auto_640100 ) ) ( not ( = ?auto_640093 ?auto_640101 ) ) ( not ( = ?auto_640093 ?auto_640102 ) ) ( not ( = ?auto_640093 ?auto_640103 ) ) ( not ( = ?auto_640093 ?auto_640104 ) ) ( not ( = ?auto_640094 ?auto_640095 ) ) ( not ( = ?auto_640094 ?auto_640096 ) ) ( not ( = ?auto_640094 ?auto_640097 ) ) ( not ( = ?auto_640094 ?auto_640098 ) ) ( not ( = ?auto_640094 ?auto_640099 ) ) ( not ( = ?auto_640094 ?auto_640100 ) ) ( not ( = ?auto_640094 ?auto_640101 ) ) ( not ( = ?auto_640094 ?auto_640102 ) ) ( not ( = ?auto_640094 ?auto_640103 ) ) ( not ( = ?auto_640094 ?auto_640104 ) ) ( not ( = ?auto_640095 ?auto_640096 ) ) ( not ( = ?auto_640095 ?auto_640097 ) ) ( not ( = ?auto_640095 ?auto_640098 ) ) ( not ( = ?auto_640095 ?auto_640099 ) ) ( not ( = ?auto_640095 ?auto_640100 ) ) ( not ( = ?auto_640095 ?auto_640101 ) ) ( not ( = ?auto_640095 ?auto_640102 ) ) ( not ( = ?auto_640095 ?auto_640103 ) ) ( not ( = ?auto_640095 ?auto_640104 ) ) ( not ( = ?auto_640096 ?auto_640097 ) ) ( not ( = ?auto_640096 ?auto_640098 ) ) ( not ( = ?auto_640096 ?auto_640099 ) ) ( not ( = ?auto_640096 ?auto_640100 ) ) ( not ( = ?auto_640096 ?auto_640101 ) ) ( not ( = ?auto_640096 ?auto_640102 ) ) ( not ( = ?auto_640096 ?auto_640103 ) ) ( not ( = ?auto_640096 ?auto_640104 ) ) ( not ( = ?auto_640097 ?auto_640098 ) ) ( not ( = ?auto_640097 ?auto_640099 ) ) ( not ( = ?auto_640097 ?auto_640100 ) ) ( not ( = ?auto_640097 ?auto_640101 ) ) ( not ( = ?auto_640097 ?auto_640102 ) ) ( not ( = ?auto_640097 ?auto_640103 ) ) ( not ( = ?auto_640097 ?auto_640104 ) ) ( not ( = ?auto_640098 ?auto_640099 ) ) ( not ( = ?auto_640098 ?auto_640100 ) ) ( not ( = ?auto_640098 ?auto_640101 ) ) ( not ( = ?auto_640098 ?auto_640102 ) ) ( not ( = ?auto_640098 ?auto_640103 ) ) ( not ( = ?auto_640098 ?auto_640104 ) ) ( not ( = ?auto_640099 ?auto_640100 ) ) ( not ( = ?auto_640099 ?auto_640101 ) ) ( not ( = ?auto_640099 ?auto_640102 ) ) ( not ( = ?auto_640099 ?auto_640103 ) ) ( not ( = ?auto_640099 ?auto_640104 ) ) ( not ( = ?auto_640100 ?auto_640101 ) ) ( not ( = ?auto_640100 ?auto_640102 ) ) ( not ( = ?auto_640100 ?auto_640103 ) ) ( not ( = ?auto_640100 ?auto_640104 ) ) ( not ( = ?auto_640101 ?auto_640102 ) ) ( not ( = ?auto_640101 ?auto_640103 ) ) ( not ( = ?auto_640101 ?auto_640104 ) ) ( not ( = ?auto_640102 ?auto_640103 ) ) ( not ( = ?auto_640102 ?auto_640104 ) ) ( not ( = ?auto_640103 ?auto_640104 ) ) ( ON ?auto_640102 ?auto_640103 ) ( ON ?auto_640101 ?auto_640102 ) ( ON ?auto_640100 ?auto_640101 ) ( ON ?auto_640099 ?auto_640100 ) ( ON ?auto_640098 ?auto_640099 ) ( ON ?auto_640097 ?auto_640098 ) ( ON ?auto_640096 ?auto_640097 ) ( ON ?auto_640095 ?auto_640096 ) ( ON ?auto_640094 ?auto_640095 ) ( CLEAR ?auto_640092 ) ( ON ?auto_640093 ?auto_640094 ) ( CLEAR ?auto_640093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_640089 ?auto_640090 ?auto_640091 ?auto_640092 ?auto_640093 )
      ( MAKE-15PILE ?auto_640089 ?auto_640090 ?auto_640091 ?auto_640092 ?auto_640093 ?auto_640094 ?auto_640095 ?auto_640096 ?auto_640097 ?auto_640098 ?auto_640099 ?auto_640100 ?auto_640101 ?auto_640102 ?auto_640103 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_640151 - BLOCK
      ?auto_640152 - BLOCK
      ?auto_640153 - BLOCK
      ?auto_640154 - BLOCK
      ?auto_640155 - BLOCK
      ?auto_640156 - BLOCK
      ?auto_640157 - BLOCK
      ?auto_640158 - BLOCK
      ?auto_640159 - BLOCK
      ?auto_640160 - BLOCK
      ?auto_640161 - BLOCK
      ?auto_640162 - BLOCK
      ?auto_640163 - BLOCK
      ?auto_640164 - BLOCK
      ?auto_640165 - BLOCK
    )
    :vars
    (
      ?auto_640166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_640165 ?auto_640166 ) ( ON-TABLE ?auto_640151 ) ( ON ?auto_640152 ?auto_640151 ) ( ON ?auto_640153 ?auto_640152 ) ( not ( = ?auto_640151 ?auto_640152 ) ) ( not ( = ?auto_640151 ?auto_640153 ) ) ( not ( = ?auto_640151 ?auto_640154 ) ) ( not ( = ?auto_640151 ?auto_640155 ) ) ( not ( = ?auto_640151 ?auto_640156 ) ) ( not ( = ?auto_640151 ?auto_640157 ) ) ( not ( = ?auto_640151 ?auto_640158 ) ) ( not ( = ?auto_640151 ?auto_640159 ) ) ( not ( = ?auto_640151 ?auto_640160 ) ) ( not ( = ?auto_640151 ?auto_640161 ) ) ( not ( = ?auto_640151 ?auto_640162 ) ) ( not ( = ?auto_640151 ?auto_640163 ) ) ( not ( = ?auto_640151 ?auto_640164 ) ) ( not ( = ?auto_640151 ?auto_640165 ) ) ( not ( = ?auto_640151 ?auto_640166 ) ) ( not ( = ?auto_640152 ?auto_640153 ) ) ( not ( = ?auto_640152 ?auto_640154 ) ) ( not ( = ?auto_640152 ?auto_640155 ) ) ( not ( = ?auto_640152 ?auto_640156 ) ) ( not ( = ?auto_640152 ?auto_640157 ) ) ( not ( = ?auto_640152 ?auto_640158 ) ) ( not ( = ?auto_640152 ?auto_640159 ) ) ( not ( = ?auto_640152 ?auto_640160 ) ) ( not ( = ?auto_640152 ?auto_640161 ) ) ( not ( = ?auto_640152 ?auto_640162 ) ) ( not ( = ?auto_640152 ?auto_640163 ) ) ( not ( = ?auto_640152 ?auto_640164 ) ) ( not ( = ?auto_640152 ?auto_640165 ) ) ( not ( = ?auto_640152 ?auto_640166 ) ) ( not ( = ?auto_640153 ?auto_640154 ) ) ( not ( = ?auto_640153 ?auto_640155 ) ) ( not ( = ?auto_640153 ?auto_640156 ) ) ( not ( = ?auto_640153 ?auto_640157 ) ) ( not ( = ?auto_640153 ?auto_640158 ) ) ( not ( = ?auto_640153 ?auto_640159 ) ) ( not ( = ?auto_640153 ?auto_640160 ) ) ( not ( = ?auto_640153 ?auto_640161 ) ) ( not ( = ?auto_640153 ?auto_640162 ) ) ( not ( = ?auto_640153 ?auto_640163 ) ) ( not ( = ?auto_640153 ?auto_640164 ) ) ( not ( = ?auto_640153 ?auto_640165 ) ) ( not ( = ?auto_640153 ?auto_640166 ) ) ( not ( = ?auto_640154 ?auto_640155 ) ) ( not ( = ?auto_640154 ?auto_640156 ) ) ( not ( = ?auto_640154 ?auto_640157 ) ) ( not ( = ?auto_640154 ?auto_640158 ) ) ( not ( = ?auto_640154 ?auto_640159 ) ) ( not ( = ?auto_640154 ?auto_640160 ) ) ( not ( = ?auto_640154 ?auto_640161 ) ) ( not ( = ?auto_640154 ?auto_640162 ) ) ( not ( = ?auto_640154 ?auto_640163 ) ) ( not ( = ?auto_640154 ?auto_640164 ) ) ( not ( = ?auto_640154 ?auto_640165 ) ) ( not ( = ?auto_640154 ?auto_640166 ) ) ( not ( = ?auto_640155 ?auto_640156 ) ) ( not ( = ?auto_640155 ?auto_640157 ) ) ( not ( = ?auto_640155 ?auto_640158 ) ) ( not ( = ?auto_640155 ?auto_640159 ) ) ( not ( = ?auto_640155 ?auto_640160 ) ) ( not ( = ?auto_640155 ?auto_640161 ) ) ( not ( = ?auto_640155 ?auto_640162 ) ) ( not ( = ?auto_640155 ?auto_640163 ) ) ( not ( = ?auto_640155 ?auto_640164 ) ) ( not ( = ?auto_640155 ?auto_640165 ) ) ( not ( = ?auto_640155 ?auto_640166 ) ) ( not ( = ?auto_640156 ?auto_640157 ) ) ( not ( = ?auto_640156 ?auto_640158 ) ) ( not ( = ?auto_640156 ?auto_640159 ) ) ( not ( = ?auto_640156 ?auto_640160 ) ) ( not ( = ?auto_640156 ?auto_640161 ) ) ( not ( = ?auto_640156 ?auto_640162 ) ) ( not ( = ?auto_640156 ?auto_640163 ) ) ( not ( = ?auto_640156 ?auto_640164 ) ) ( not ( = ?auto_640156 ?auto_640165 ) ) ( not ( = ?auto_640156 ?auto_640166 ) ) ( not ( = ?auto_640157 ?auto_640158 ) ) ( not ( = ?auto_640157 ?auto_640159 ) ) ( not ( = ?auto_640157 ?auto_640160 ) ) ( not ( = ?auto_640157 ?auto_640161 ) ) ( not ( = ?auto_640157 ?auto_640162 ) ) ( not ( = ?auto_640157 ?auto_640163 ) ) ( not ( = ?auto_640157 ?auto_640164 ) ) ( not ( = ?auto_640157 ?auto_640165 ) ) ( not ( = ?auto_640157 ?auto_640166 ) ) ( not ( = ?auto_640158 ?auto_640159 ) ) ( not ( = ?auto_640158 ?auto_640160 ) ) ( not ( = ?auto_640158 ?auto_640161 ) ) ( not ( = ?auto_640158 ?auto_640162 ) ) ( not ( = ?auto_640158 ?auto_640163 ) ) ( not ( = ?auto_640158 ?auto_640164 ) ) ( not ( = ?auto_640158 ?auto_640165 ) ) ( not ( = ?auto_640158 ?auto_640166 ) ) ( not ( = ?auto_640159 ?auto_640160 ) ) ( not ( = ?auto_640159 ?auto_640161 ) ) ( not ( = ?auto_640159 ?auto_640162 ) ) ( not ( = ?auto_640159 ?auto_640163 ) ) ( not ( = ?auto_640159 ?auto_640164 ) ) ( not ( = ?auto_640159 ?auto_640165 ) ) ( not ( = ?auto_640159 ?auto_640166 ) ) ( not ( = ?auto_640160 ?auto_640161 ) ) ( not ( = ?auto_640160 ?auto_640162 ) ) ( not ( = ?auto_640160 ?auto_640163 ) ) ( not ( = ?auto_640160 ?auto_640164 ) ) ( not ( = ?auto_640160 ?auto_640165 ) ) ( not ( = ?auto_640160 ?auto_640166 ) ) ( not ( = ?auto_640161 ?auto_640162 ) ) ( not ( = ?auto_640161 ?auto_640163 ) ) ( not ( = ?auto_640161 ?auto_640164 ) ) ( not ( = ?auto_640161 ?auto_640165 ) ) ( not ( = ?auto_640161 ?auto_640166 ) ) ( not ( = ?auto_640162 ?auto_640163 ) ) ( not ( = ?auto_640162 ?auto_640164 ) ) ( not ( = ?auto_640162 ?auto_640165 ) ) ( not ( = ?auto_640162 ?auto_640166 ) ) ( not ( = ?auto_640163 ?auto_640164 ) ) ( not ( = ?auto_640163 ?auto_640165 ) ) ( not ( = ?auto_640163 ?auto_640166 ) ) ( not ( = ?auto_640164 ?auto_640165 ) ) ( not ( = ?auto_640164 ?auto_640166 ) ) ( not ( = ?auto_640165 ?auto_640166 ) ) ( ON ?auto_640164 ?auto_640165 ) ( ON ?auto_640163 ?auto_640164 ) ( ON ?auto_640162 ?auto_640163 ) ( ON ?auto_640161 ?auto_640162 ) ( ON ?auto_640160 ?auto_640161 ) ( ON ?auto_640159 ?auto_640160 ) ( ON ?auto_640158 ?auto_640159 ) ( ON ?auto_640157 ?auto_640158 ) ( ON ?auto_640156 ?auto_640157 ) ( ON ?auto_640155 ?auto_640156 ) ( CLEAR ?auto_640153 ) ( ON ?auto_640154 ?auto_640155 ) ( CLEAR ?auto_640154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_640151 ?auto_640152 ?auto_640153 ?auto_640154 )
      ( MAKE-15PILE ?auto_640151 ?auto_640152 ?auto_640153 ?auto_640154 ?auto_640155 ?auto_640156 ?auto_640157 ?auto_640158 ?auto_640159 ?auto_640160 ?auto_640161 ?auto_640162 ?auto_640163 ?auto_640164 ?auto_640165 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_640213 - BLOCK
      ?auto_640214 - BLOCK
      ?auto_640215 - BLOCK
      ?auto_640216 - BLOCK
      ?auto_640217 - BLOCK
      ?auto_640218 - BLOCK
      ?auto_640219 - BLOCK
      ?auto_640220 - BLOCK
      ?auto_640221 - BLOCK
      ?auto_640222 - BLOCK
      ?auto_640223 - BLOCK
      ?auto_640224 - BLOCK
      ?auto_640225 - BLOCK
      ?auto_640226 - BLOCK
      ?auto_640227 - BLOCK
    )
    :vars
    (
      ?auto_640228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_640227 ?auto_640228 ) ( ON-TABLE ?auto_640213 ) ( ON ?auto_640214 ?auto_640213 ) ( not ( = ?auto_640213 ?auto_640214 ) ) ( not ( = ?auto_640213 ?auto_640215 ) ) ( not ( = ?auto_640213 ?auto_640216 ) ) ( not ( = ?auto_640213 ?auto_640217 ) ) ( not ( = ?auto_640213 ?auto_640218 ) ) ( not ( = ?auto_640213 ?auto_640219 ) ) ( not ( = ?auto_640213 ?auto_640220 ) ) ( not ( = ?auto_640213 ?auto_640221 ) ) ( not ( = ?auto_640213 ?auto_640222 ) ) ( not ( = ?auto_640213 ?auto_640223 ) ) ( not ( = ?auto_640213 ?auto_640224 ) ) ( not ( = ?auto_640213 ?auto_640225 ) ) ( not ( = ?auto_640213 ?auto_640226 ) ) ( not ( = ?auto_640213 ?auto_640227 ) ) ( not ( = ?auto_640213 ?auto_640228 ) ) ( not ( = ?auto_640214 ?auto_640215 ) ) ( not ( = ?auto_640214 ?auto_640216 ) ) ( not ( = ?auto_640214 ?auto_640217 ) ) ( not ( = ?auto_640214 ?auto_640218 ) ) ( not ( = ?auto_640214 ?auto_640219 ) ) ( not ( = ?auto_640214 ?auto_640220 ) ) ( not ( = ?auto_640214 ?auto_640221 ) ) ( not ( = ?auto_640214 ?auto_640222 ) ) ( not ( = ?auto_640214 ?auto_640223 ) ) ( not ( = ?auto_640214 ?auto_640224 ) ) ( not ( = ?auto_640214 ?auto_640225 ) ) ( not ( = ?auto_640214 ?auto_640226 ) ) ( not ( = ?auto_640214 ?auto_640227 ) ) ( not ( = ?auto_640214 ?auto_640228 ) ) ( not ( = ?auto_640215 ?auto_640216 ) ) ( not ( = ?auto_640215 ?auto_640217 ) ) ( not ( = ?auto_640215 ?auto_640218 ) ) ( not ( = ?auto_640215 ?auto_640219 ) ) ( not ( = ?auto_640215 ?auto_640220 ) ) ( not ( = ?auto_640215 ?auto_640221 ) ) ( not ( = ?auto_640215 ?auto_640222 ) ) ( not ( = ?auto_640215 ?auto_640223 ) ) ( not ( = ?auto_640215 ?auto_640224 ) ) ( not ( = ?auto_640215 ?auto_640225 ) ) ( not ( = ?auto_640215 ?auto_640226 ) ) ( not ( = ?auto_640215 ?auto_640227 ) ) ( not ( = ?auto_640215 ?auto_640228 ) ) ( not ( = ?auto_640216 ?auto_640217 ) ) ( not ( = ?auto_640216 ?auto_640218 ) ) ( not ( = ?auto_640216 ?auto_640219 ) ) ( not ( = ?auto_640216 ?auto_640220 ) ) ( not ( = ?auto_640216 ?auto_640221 ) ) ( not ( = ?auto_640216 ?auto_640222 ) ) ( not ( = ?auto_640216 ?auto_640223 ) ) ( not ( = ?auto_640216 ?auto_640224 ) ) ( not ( = ?auto_640216 ?auto_640225 ) ) ( not ( = ?auto_640216 ?auto_640226 ) ) ( not ( = ?auto_640216 ?auto_640227 ) ) ( not ( = ?auto_640216 ?auto_640228 ) ) ( not ( = ?auto_640217 ?auto_640218 ) ) ( not ( = ?auto_640217 ?auto_640219 ) ) ( not ( = ?auto_640217 ?auto_640220 ) ) ( not ( = ?auto_640217 ?auto_640221 ) ) ( not ( = ?auto_640217 ?auto_640222 ) ) ( not ( = ?auto_640217 ?auto_640223 ) ) ( not ( = ?auto_640217 ?auto_640224 ) ) ( not ( = ?auto_640217 ?auto_640225 ) ) ( not ( = ?auto_640217 ?auto_640226 ) ) ( not ( = ?auto_640217 ?auto_640227 ) ) ( not ( = ?auto_640217 ?auto_640228 ) ) ( not ( = ?auto_640218 ?auto_640219 ) ) ( not ( = ?auto_640218 ?auto_640220 ) ) ( not ( = ?auto_640218 ?auto_640221 ) ) ( not ( = ?auto_640218 ?auto_640222 ) ) ( not ( = ?auto_640218 ?auto_640223 ) ) ( not ( = ?auto_640218 ?auto_640224 ) ) ( not ( = ?auto_640218 ?auto_640225 ) ) ( not ( = ?auto_640218 ?auto_640226 ) ) ( not ( = ?auto_640218 ?auto_640227 ) ) ( not ( = ?auto_640218 ?auto_640228 ) ) ( not ( = ?auto_640219 ?auto_640220 ) ) ( not ( = ?auto_640219 ?auto_640221 ) ) ( not ( = ?auto_640219 ?auto_640222 ) ) ( not ( = ?auto_640219 ?auto_640223 ) ) ( not ( = ?auto_640219 ?auto_640224 ) ) ( not ( = ?auto_640219 ?auto_640225 ) ) ( not ( = ?auto_640219 ?auto_640226 ) ) ( not ( = ?auto_640219 ?auto_640227 ) ) ( not ( = ?auto_640219 ?auto_640228 ) ) ( not ( = ?auto_640220 ?auto_640221 ) ) ( not ( = ?auto_640220 ?auto_640222 ) ) ( not ( = ?auto_640220 ?auto_640223 ) ) ( not ( = ?auto_640220 ?auto_640224 ) ) ( not ( = ?auto_640220 ?auto_640225 ) ) ( not ( = ?auto_640220 ?auto_640226 ) ) ( not ( = ?auto_640220 ?auto_640227 ) ) ( not ( = ?auto_640220 ?auto_640228 ) ) ( not ( = ?auto_640221 ?auto_640222 ) ) ( not ( = ?auto_640221 ?auto_640223 ) ) ( not ( = ?auto_640221 ?auto_640224 ) ) ( not ( = ?auto_640221 ?auto_640225 ) ) ( not ( = ?auto_640221 ?auto_640226 ) ) ( not ( = ?auto_640221 ?auto_640227 ) ) ( not ( = ?auto_640221 ?auto_640228 ) ) ( not ( = ?auto_640222 ?auto_640223 ) ) ( not ( = ?auto_640222 ?auto_640224 ) ) ( not ( = ?auto_640222 ?auto_640225 ) ) ( not ( = ?auto_640222 ?auto_640226 ) ) ( not ( = ?auto_640222 ?auto_640227 ) ) ( not ( = ?auto_640222 ?auto_640228 ) ) ( not ( = ?auto_640223 ?auto_640224 ) ) ( not ( = ?auto_640223 ?auto_640225 ) ) ( not ( = ?auto_640223 ?auto_640226 ) ) ( not ( = ?auto_640223 ?auto_640227 ) ) ( not ( = ?auto_640223 ?auto_640228 ) ) ( not ( = ?auto_640224 ?auto_640225 ) ) ( not ( = ?auto_640224 ?auto_640226 ) ) ( not ( = ?auto_640224 ?auto_640227 ) ) ( not ( = ?auto_640224 ?auto_640228 ) ) ( not ( = ?auto_640225 ?auto_640226 ) ) ( not ( = ?auto_640225 ?auto_640227 ) ) ( not ( = ?auto_640225 ?auto_640228 ) ) ( not ( = ?auto_640226 ?auto_640227 ) ) ( not ( = ?auto_640226 ?auto_640228 ) ) ( not ( = ?auto_640227 ?auto_640228 ) ) ( ON ?auto_640226 ?auto_640227 ) ( ON ?auto_640225 ?auto_640226 ) ( ON ?auto_640224 ?auto_640225 ) ( ON ?auto_640223 ?auto_640224 ) ( ON ?auto_640222 ?auto_640223 ) ( ON ?auto_640221 ?auto_640222 ) ( ON ?auto_640220 ?auto_640221 ) ( ON ?auto_640219 ?auto_640220 ) ( ON ?auto_640218 ?auto_640219 ) ( ON ?auto_640217 ?auto_640218 ) ( ON ?auto_640216 ?auto_640217 ) ( CLEAR ?auto_640214 ) ( ON ?auto_640215 ?auto_640216 ) ( CLEAR ?auto_640215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_640213 ?auto_640214 ?auto_640215 )
      ( MAKE-15PILE ?auto_640213 ?auto_640214 ?auto_640215 ?auto_640216 ?auto_640217 ?auto_640218 ?auto_640219 ?auto_640220 ?auto_640221 ?auto_640222 ?auto_640223 ?auto_640224 ?auto_640225 ?auto_640226 ?auto_640227 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_640275 - BLOCK
      ?auto_640276 - BLOCK
      ?auto_640277 - BLOCK
      ?auto_640278 - BLOCK
      ?auto_640279 - BLOCK
      ?auto_640280 - BLOCK
      ?auto_640281 - BLOCK
      ?auto_640282 - BLOCK
      ?auto_640283 - BLOCK
      ?auto_640284 - BLOCK
      ?auto_640285 - BLOCK
      ?auto_640286 - BLOCK
      ?auto_640287 - BLOCK
      ?auto_640288 - BLOCK
      ?auto_640289 - BLOCK
    )
    :vars
    (
      ?auto_640290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_640289 ?auto_640290 ) ( ON-TABLE ?auto_640275 ) ( not ( = ?auto_640275 ?auto_640276 ) ) ( not ( = ?auto_640275 ?auto_640277 ) ) ( not ( = ?auto_640275 ?auto_640278 ) ) ( not ( = ?auto_640275 ?auto_640279 ) ) ( not ( = ?auto_640275 ?auto_640280 ) ) ( not ( = ?auto_640275 ?auto_640281 ) ) ( not ( = ?auto_640275 ?auto_640282 ) ) ( not ( = ?auto_640275 ?auto_640283 ) ) ( not ( = ?auto_640275 ?auto_640284 ) ) ( not ( = ?auto_640275 ?auto_640285 ) ) ( not ( = ?auto_640275 ?auto_640286 ) ) ( not ( = ?auto_640275 ?auto_640287 ) ) ( not ( = ?auto_640275 ?auto_640288 ) ) ( not ( = ?auto_640275 ?auto_640289 ) ) ( not ( = ?auto_640275 ?auto_640290 ) ) ( not ( = ?auto_640276 ?auto_640277 ) ) ( not ( = ?auto_640276 ?auto_640278 ) ) ( not ( = ?auto_640276 ?auto_640279 ) ) ( not ( = ?auto_640276 ?auto_640280 ) ) ( not ( = ?auto_640276 ?auto_640281 ) ) ( not ( = ?auto_640276 ?auto_640282 ) ) ( not ( = ?auto_640276 ?auto_640283 ) ) ( not ( = ?auto_640276 ?auto_640284 ) ) ( not ( = ?auto_640276 ?auto_640285 ) ) ( not ( = ?auto_640276 ?auto_640286 ) ) ( not ( = ?auto_640276 ?auto_640287 ) ) ( not ( = ?auto_640276 ?auto_640288 ) ) ( not ( = ?auto_640276 ?auto_640289 ) ) ( not ( = ?auto_640276 ?auto_640290 ) ) ( not ( = ?auto_640277 ?auto_640278 ) ) ( not ( = ?auto_640277 ?auto_640279 ) ) ( not ( = ?auto_640277 ?auto_640280 ) ) ( not ( = ?auto_640277 ?auto_640281 ) ) ( not ( = ?auto_640277 ?auto_640282 ) ) ( not ( = ?auto_640277 ?auto_640283 ) ) ( not ( = ?auto_640277 ?auto_640284 ) ) ( not ( = ?auto_640277 ?auto_640285 ) ) ( not ( = ?auto_640277 ?auto_640286 ) ) ( not ( = ?auto_640277 ?auto_640287 ) ) ( not ( = ?auto_640277 ?auto_640288 ) ) ( not ( = ?auto_640277 ?auto_640289 ) ) ( not ( = ?auto_640277 ?auto_640290 ) ) ( not ( = ?auto_640278 ?auto_640279 ) ) ( not ( = ?auto_640278 ?auto_640280 ) ) ( not ( = ?auto_640278 ?auto_640281 ) ) ( not ( = ?auto_640278 ?auto_640282 ) ) ( not ( = ?auto_640278 ?auto_640283 ) ) ( not ( = ?auto_640278 ?auto_640284 ) ) ( not ( = ?auto_640278 ?auto_640285 ) ) ( not ( = ?auto_640278 ?auto_640286 ) ) ( not ( = ?auto_640278 ?auto_640287 ) ) ( not ( = ?auto_640278 ?auto_640288 ) ) ( not ( = ?auto_640278 ?auto_640289 ) ) ( not ( = ?auto_640278 ?auto_640290 ) ) ( not ( = ?auto_640279 ?auto_640280 ) ) ( not ( = ?auto_640279 ?auto_640281 ) ) ( not ( = ?auto_640279 ?auto_640282 ) ) ( not ( = ?auto_640279 ?auto_640283 ) ) ( not ( = ?auto_640279 ?auto_640284 ) ) ( not ( = ?auto_640279 ?auto_640285 ) ) ( not ( = ?auto_640279 ?auto_640286 ) ) ( not ( = ?auto_640279 ?auto_640287 ) ) ( not ( = ?auto_640279 ?auto_640288 ) ) ( not ( = ?auto_640279 ?auto_640289 ) ) ( not ( = ?auto_640279 ?auto_640290 ) ) ( not ( = ?auto_640280 ?auto_640281 ) ) ( not ( = ?auto_640280 ?auto_640282 ) ) ( not ( = ?auto_640280 ?auto_640283 ) ) ( not ( = ?auto_640280 ?auto_640284 ) ) ( not ( = ?auto_640280 ?auto_640285 ) ) ( not ( = ?auto_640280 ?auto_640286 ) ) ( not ( = ?auto_640280 ?auto_640287 ) ) ( not ( = ?auto_640280 ?auto_640288 ) ) ( not ( = ?auto_640280 ?auto_640289 ) ) ( not ( = ?auto_640280 ?auto_640290 ) ) ( not ( = ?auto_640281 ?auto_640282 ) ) ( not ( = ?auto_640281 ?auto_640283 ) ) ( not ( = ?auto_640281 ?auto_640284 ) ) ( not ( = ?auto_640281 ?auto_640285 ) ) ( not ( = ?auto_640281 ?auto_640286 ) ) ( not ( = ?auto_640281 ?auto_640287 ) ) ( not ( = ?auto_640281 ?auto_640288 ) ) ( not ( = ?auto_640281 ?auto_640289 ) ) ( not ( = ?auto_640281 ?auto_640290 ) ) ( not ( = ?auto_640282 ?auto_640283 ) ) ( not ( = ?auto_640282 ?auto_640284 ) ) ( not ( = ?auto_640282 ?auto_640285 ) ) ( not ( = ?auto_640282 ?auto_640286 ) ) ( not ( = ?auto_640282 ?auto_640287 ) ) ( not ( = ?auto_640282 ?auto_640288 ) ) ( not ( = ?auto_640282 ?auto_640289 ) ) ( not ( = ?auto_640282 ?auto_640290 ) ) ( not ( = ?auto_640283 ?auto_640284 ) ) ( not ( = ?auto_640283 ?auto_640285 ) ) ( not ( = ?auto_640283 ?auto_640286 ) ) ( not ( = ?auto_640283 ?auto_640287 ) ) ( not ( = ?auto_640283 ?auto_640288 ) ) ( not ( = ?auto_640283 ?auto_640289 ) ) ( not ( = ?auto_640283 ?auto_640290 ) ) ( not ( = ?auto_640284 ?auto_640285 ) ) ( not ( = ?auto_640284 ?auto_640286 ) ) ( not ( = ?auto_640284 ?auto_640287 ) ) ( not ( = ?auto_640284 ?auto_640288 ) ) ( not ( = ?auto_640284 ?auto_640289 ) ) ( not ( = ?auto_640284 ?auto_640290 ) ) ( not ( = ?auto_640285 ?auto_640286 ) ) ( not ( = ?auto_640285 ?auto_640287 ) ) ( not ( = ?auto_640285 ?auto_640288 ) ) ( not ( = ?auto_640285 ?auto_640289 ) ) ( not ( = ?auto_640285 ?auto_640290 ) ) ( not ( = ?auto_640286 ?auto_640287 ) ) ( not ( = ?auto_640286 ?auto_640288 ) ) ( not ( = ?auto_640286 ?auto_640289 ) ) ( not ( = ?auto_640286 ?auto_640290 ) ) ( not ( = ?auto_640287 ?auto_640288 ) ) ( not ( = ?auto_640287 ?auto_640289 ) ) ( not ( = ?auto_640287 ?auto_640290 ) ) ( not ( = ?auto_640288 ?auto_640289 ) ) ( not ( = ?auto_640288 ?auto_640290 ) ) ( not ( = ?auto_640289 ?auto_640290 ) ) ( ON ?auto_640288 ?auto_640289 ) ( ON ?auto_640287 ?auto_640288 ) ( ON ?auto_640286 ?auto_640287 ) ( ON ?auto_640285 ?auto_640286 ) ( ON ?auto_640284 ?auto_640285 ) ( ON ?auto_640283 ?auto_640284 ) ( ON ?auto_640282 ?auto_640283 ) ( ON ?auto_640281 ?auto_640282 ) ( ON ?auto_640280 ?auto_640281 ) ( ON ?auto_640279 ?auto_640280 ) ( ON ?auto_640278 ?auto_640279 ) ( ON ?auto_640277 ?auto_640278 ) ( CLEAR ?auto_640275 ) ( ON ?auto_640276 ?auto_640277 ) ( CLEAR ?auto_640276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_640275 ?auto_640276 )
      ( MAKE-15PILE ?auto_640275 ?auto_640276 ?auto_640277 ?auto_640278 ?auto_640279 ?auto_640280 ?auto_640281 ?auto_640282 ?auto_640283 ?auto_640284 ?auto_640285 ?auto_640286 ?auto_640287 ?auto_640288 ?auto_640289 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_640337 - BLOCK
      ?auto_640338 - BLOCK
      ?auto_640339 - BLOCK
      ?auto_640340 - BLOCK
      ?auto_640341 - BLOCK
      ?auto_640342 - BLOCK
      ?auto_640343 - BLOCK
      ?auto_640344 - BLOCK
      ?auto_640345 - BLOCK
      ?auto_640346 - BLOCK
      ?auto_640347 - BLOCK
      ?auto_640348 - BLOCK
      ?auto_640349 - BLOCK
      ?auto_640350 - BLOCK
      ?auto_640351 - BLOCK
    )
    :vars
    (
      ?auto_640352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_640351 ?auto_640352 ) ( not ( = ?auto_640337 ?auto_640338 ) ) ( not ( = ?auto_640337 ?auto_640339 ) ) ( not ( = ?auto_640337 ?auto_640340 ) ) ( not ( = ?auto_640337 ?auto_640341 ) ) ( not ( = ?auto_640337 ?auto_640342 ) ) ( not ( = ?auto_640337 ?auto_640343 ) ) ( not ( = ?auto_640337 ?auto_640344 ) ) ( not ( = ?auto_640337 ?auto_640345 ) ) ( not ( = ?auto_640337 ?auto_640346 ) ) ( not ( = ?auto_640337 ?auto_640347 ) ) ( not ( = ?auto_640337 ?auto_640348 ) ) ( not ( = ?auto_640337 ?auto_640349 ) ) ( not ( = ?auto_640337 ?auto_640350 ) ) ( not ( = ?auto_640337 ?auto_640351 ) ) ( not ( = ?auto_640337 ?auto_640352 ) ) ( not ( = ?auto_640338 ?auto_640339 ) ) ( not ( = ?auto_640338 ?auto_640340 ) ) ( not ( = ?auto_640338 ?auto_640341 ) ) ( not ( = ?auto_640338 ?auto_640342 ) ) ( not ( = ?auto_640338 ?auto_640343 ) ) ( not ( = ?auto_640338 ?auto_640344 ) ) ( not ( = ?auto_640338 ?auto_640345 ) ) ( not ( = ?auto_640338 ?auto_640346 ) ) ( not ( = ?auto_640338 ?auto_640347 ) ) ( not ( = ?auto_640338 ?auto_640348 ) ) ( not ( = ?auto_640338 ?auto_640349 ) ) ( not ( = ?auto_640338 ?auto_640350 ) ) ( not ( = ?auto_640338 ?auto_640351 ) ) ( not ( = ?auto_640338 ?auto_640352 ) ) ( not ( = ?auto_640339 ?auto_640340 ) ) ( not ( = ?auto_640339 ?auto_640341 ) ) ( not ( = ?auto_640339 ?auto_640342 ) ) ( not ( = ?auto_640339 ?auto_640343 ) ) ( not ( = ?auto_640339 ?auto_640344 ) ) ( not ( = ?auto_640339 ?auto_640345 ) ) ( not ( = ?auto_640339 ?auto_640346 ) ) ( not ( = ?auto_640339 ?auto_640347 ) ) ( not ( = ?auto_640339 ?auto_640348 ) ) ( not ( = ?auto_640339 ?auto_640349 ) ) ( not ( = ?auto_640339 ?auto_640350 ) ) ( not ( = ?auto_640339 ?auto_640351 ) ) ( not ( = ?auto_640339 ?auto_640352 ) ) ( not ( = ?auto_640340 ?auto_640341 ) ) ( not ( = ?auto_640340 ?auto_640342 ) ) ( not ( = ?auto_640340 ?auto_640343 ) ) ( not ( = ?auto_640340 ?auto_640344 ) ) ( not ( = ?auto_640340 ?auto_640345 ) ) ( not ( = ?auto_640340 ?auto_640346 ) ) ( not ( = ?auto_640340 ?auto_640347 ) ) ( not ( = ?auto_640340 ?auto_640348 ) ) ( not ( = ?auto_640340 ?auto_640349 ) ) ( not ( = ?auto_640340 ?auto_640350 ) ) ( not ( = ?auto_640340 ?auto_640351 ) ) ( not ( = ?auto_640340 ?auto_640352 ) ) ( not ( = ?auto_640341 ?auto_640342 ) ) ( not ( = ?auto_640341 ?auto_640343 ) ) ( not ( = ?auto_640341 ?auto_640344 ) ) ( not ( = ?auto_640341 ?auto_640345 ) ) ( not ( = ?auto_640341 ?auto_640346 ) ) ( not ( = ?auto_640341 ?auto_640347 ) ) ( not ( = ?auto_640341 ?auto_640348 ) ) ( not ( = ?auto_640341 ?auto_640349 ) ) ( not ( = ?auto_640341 ?auto_640350 ) ) ( not ( = ?auto_640341 ?auto_640351 ) ) ( not ( = ?auto_640341 ?auto_640352 ) ) ( not ( = ?auto_640342 ?auto_640343 ) ) ( not ( = ?auto_640342 ?auto_640344 ) ) ( not ( = ?auto_640342 ?auto_640345 ) ) ( not ( = ?auto_640342 ?auto_640346 ) ) ( not ( = ?auto_640342 ?auto_640347 ) ) ( not ( = ?auto_640342 ?auto_640348 ) ) ( not ( = ?auto_640342 ?auto_640349 ) ) ( not ( = ?auto_640342 ?auto_640350 ) ) ( not ( = ?auto_640342 ?auto_640351 ) ) ( not ( = ?auto_640342 ?auto_640352 ) ) ( not ( = ?auto_640343 ?auto_640344 ) ) ( not ( = ?auto_640343 ?auto_640345 ) ) ( not ( = ?auto_640343 ?auto_640346 ) ) ( not ( = ?auto_640343 ?auto_640347 ) ) ( not ( = ?auto_640343 ?auto_640348 ) ) ( not ( = ?auto_640343 ?auto_640349 ) ) ( not ( = ?auto_640343 ?auto_640350 ) ) ( not ( = ?auto_640343 ?auto_640351 ) ) ( not ( = ?auto_640343 ?auto_640352 ) ) ( not ( = ?auto_640344 ?auto_640345 ) ) ( not ( = ?auto_640344 ?auto_640346 ) ) ( not ( = ?auto_640344 ?auto_640347 ) ) ( not ( = ?auto_640344 ?auto_640348 ) ) ( not ( = ?auto_640344 ?auto_640349 ) ) ( not ( = ?auto_640344 ?auto_640350 ) ) ( not ( = ?auto_640344 ?auto_640351 ) ) ( not ( = ?auto_640344 ?auto_640352 ) ) ( not ( = ?auto_640345 ?auto_640346 ) ) ( not ( = ?auto_640345 ?auto_640347 ) ) ( not ( = ?auto_640345 ?auto_640348 ) ) ( not ( = ?auto_640345 ?auto_640349 ) ) ( not ( = ?auto_640345 ?auto_640350 ) ) ( not ( = ?auto_640345 ?auto_640351 ) ) ( not ( = ?auto_640345 ?auto_640352 ) ) ( not ( = ?auto_640346 ?auto_640347 ) ) ( not ( = ?auto_640346 ?auto_640348 ) ) ( not ( = ?auto_640346 ?auto_640349 ) ) ( not ( = ?auto_640346 ?auto_640350 ) ) ( not ( = ?auto_640346 ?auto_640351 ) ) ( not ( = ?auto_640346 ?auto_640352 ) ) ( not ( = ?auto_640347 ?auto_640348 ) ) ( not ( = ?auto_640347 ?auto_640349 ) ) ( not ( = ?auto_640347 ?auto_640350 ) ) ( not ( = ?auto_640347 ?auto_640351 ) ) ( not ( = ?auto_640347 ?auto_640352 ) ) ( not ( = ?auto_640348 ?auto_640349 ) ) ( not ( = ?auto_640348 ?auto_640350 ) ) ( not ( = ?auto_640348 ?auto_640351 ) ) ( not ( = ?auto_640348 ?auto_640352 ) ) ( not ( = ?auto_640349 ?auto_640350 ) ) ( not ( = ?auto_640349 ?auto_640351 ) ) ( not ( = ?auto_640349 ?auto_640352 ) ) ( not ( = ?auto_640350 ?auto_640351 ) ) ( not ( = ?auto_640350 ?auto_640352 ) ) ( not ( = ?auto_640351 ?auto_640352 ) ) ( ON ?auto_640350 ?auto_640351 ) ( ON ?auto_640349 ?auto_640350 ) ( ON ?auto_640348 ?auto_640349 ) ( ON ?auto_640347 ?auto_640348 ) ( ON ?auto_640346 ?auto_640347 ) ( ON ?auto_640345 ?auto_640346 ) ( ON ?auto_640344 ?auto_640345 ) ( ON ?auto_640343 ?auto_640344 ) ( ON ?auto_640342 ?auto_640343 ) ( ON ?auto_640341 ?auto_640342 ) ( ON ?auto_640340 ?auto_640341 ) ( ON ?auto_640339 ?auto_640340 ) ( ON ?auto_640338 ?auto_640339 ) ( ON ?auto_640337 ?auto_640338 ) ( CLEAR ?auto_640337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_640337 )
      ( MAKE-15PILE ?auto_640337 ?auto_640338 ?auto_640339 ?auto_640340 ?auto_640341 ?auto_640342 ?auto_640343 ?auto_640344 ?auto_640345 ?auto_640346 ?auto_640347 ?auto_640348 ?auto_640349 ?auto_640350 ?auto_640351 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_640400 - BLOCK
      ?auto_640401 - BLOCK
      ?auto_640402 - BLOCK
      ?auto_640403 - BLOCK
      ?auto_640404 - BLOCK
      ?auto_640405 - BLOCK
      ?auto_640406 - BLOCK
      ?auto_640407 - BLOCK
      ?auto_640408 - BLOCK
      ?auto_640409 - BLOCK
      ?auto_640410 - BLOCK
      ?auto_640411 - BLOCK
      ?auto_640412 - BLOCK
      ?auto_640413 - BLOCK
      ?auto_640414 - BLOCK
      ?auto_640415 - BLOCK
    )
    :vars
    (
      ?auto_640416 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_640414 ) ( ON ?auto_640415 ?auto_640416 ) ( CLEAR ?auto_640415 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_640400 ) ( ON ?auto_640401 ?auto_640400 ) ( ON ?auto_640402 ?auto_640401 ) ( ON ?auto_640403 ?auto_640402 ) ( ON ?auto_640404 ?auto_640403 ) ( ON ?auto_640405 ?auto_640404 ) ( ON ?auto_640406 ?auto_640405 ) ( ON ?auto_640407 ?auto_640406 ) ( ON ?auto_640408 ?auto_640407 ) ( ON ?auto_640409 ?auto_640408 ) ( ON ?auto_640410 ?auto_640409 ) ( ON ?auto_640411 ?auto_640410 ) ( ON ?auto_640412 ?auto_640411 ) ( ON ?auto_640413 ?auto_640412 ) ( ON ?auto_640414 ?auto_640413 ) ( not ( = ?auto_640400 ?auto_640401 ) ) ( not ( = ?auto_640400 ?auto_640402 ) ) ( not ( = ?auto_640400 ?auto_640403 ) ) ( not ( = ?auto_640400 ?auto_640404 ) ) ( not ( = ?auto_640400 ?auto_640405 ) ) ( not ( = ?auto_640400 ?auto_640406 ) ) ( not ( = ?auto_640400 ?auto_640407 ) ) ( not ( = ?auto_640400 ?auto_640408 ) ) ( not ( = ?auto_640400 ?auto_640409 ) ) ( not ( = ?auto_640400 ?auto_640410 ) ) ( not ( = ?auto_640400 ?auto_640411 ) ) ( not ( = ?auto_640400 ?auto_640412 ) ) ( not ( = ?auto_640400 ?auto_640413 ) ) ( not ( = ?auto_640400 ?auto_640414 ) ) ( not ( = ?auto_640400 ?auto_640415 ) ) ( not ( = ?auto_640400 ?auto_640416 ) ) ( not ( = ?auto_640401 ?auto_640402 ) ) ( not ( = ?auto_640401 ?auto_640403 ) ) ( not ( = ?auto_640401 ?auto_640404 ) ) ( not ( = ?auto_640401 ?auto_640405 ) ) ( not ( = ?auto_640401 ?auto_640406 ) ) ( not ( = ?auto_640401 ?auto_640407 ) ) ( not ( = ?auto_640401 ?auto_640408 ) ) ( not ( = ?auto_640401 ?auto_640409 ) ) ( not ( = ?auto_640401 ?auto_640410 ) ) ( not ( = ?auto_640401 ?auto_640411 ) ) ( not ( = ?auto_640401 ?auto_640412 ) ) ( not ( = ?auto_640401 ?auto_640413 ) ) ( not ( = ?auto_640401 ?auto_640414 ) ) ( not ( = ?auto_640401 ?auto_640415 ) ) ( not ( = ?auto_640401 ?auto_640416 ) ) ( not ( = ?auto_640402 ?auto_640403 ) ) ( not ( = ?auto_640402 ?auto_640404 ) ) ( not ( = ?auto_640402 ?auto_640405 ) ) ( not ( = ?auto_640402 ?auto_640406 ) ) ( not ( = ?auto_640402 ?auto_640407 ) ) ( not ( = ?auto_640402 ?auto_640408 ) ) ( not ( = ?auto_640402 ?auto_640409 ) ) ( not ( = ?auto_640402 ?auto_640410 ) ) ( not ( = ?auto_640402 ?auto_640411 ) ) ( not ( = ?auto_640402 ?auto_640412 ) ) ( not ( = ?auto_640402 ?auto_640413 ) ) ( not ( = ?auto_640402 ?auto_640414 ) ) ( not ( = ?auto_640402 ?auto_640415 ) ) ( not ( = ?auto_640402 ?auto_640416 ) ) ( not ( = ?auto_640403 ?auto_640404 ) ) ( not ( = ?auto_640403 ?auto_640405 ) ) ( not ( = ?auto_640403 ?auto_640406 ) ) ( not ( = ?auto_640403 ?auto_640407 ) ) ( not ( = ?auto_640403 ?auto_640408 ) ) ( not ( = ?auto_640403 ?auto_640409 ) ) ( not ( = ?auto_640403 ?auto_640410 ) ) ( not ( = ?auto_640403 ?auto_640411 ) ) ( not ( = ?auto_640403 ?auto_640412 ) ) ( not ( = ?auto_640403 ?auto_640413 ) ) ( not ( = ?auto_640403 ?auto_640414 ) ) ( not ( = ?auto_640403 ?auto_640415 ) ) ( not ( = ?auto_640403 ?auto_640416 ) ) ( not ( = ?auto_640404 ?auto_640405 ) ) ( not ( = ?auto_640404 ?auto_640406 ) ) ( not ( = ?auto_640404 ?auto_640407 ) ) ( not ( = ?auto_640404 ?auto_640408 ) ) ( not ( = ?auto_640404 ?auto_640409 ) ) ( not ( = ?auto_640404 ?auto_640410 ) ) ( not ( = ?auto_640404 ?auto_640411 ) ) ( not ( = ?auto_640404 ?auto_640412 ) ) ( not ( = ?auto_640404 ?auto_640413 ) ) ( not ( = ?auto_640404 ?auto_640414 ) ) ( not ( = ?auto_640404 ?auto_640415 ) ) ( not ( = ?auto_640404 ?auto_640416 ) ) ( not ( = ?auto_640405 ?auto_640406 ) ) ( not ( = ?auto_640405 ?auto_640407 ) ) ( not ( = ?auto_640405 ?auto_640408 ) ) ( not ( = ?auto_640405 ?auto_640409 ) ) ( not ( = ?auto_640405 ?auto_640410 ) ) ( not ( = ?auto_640405 ?auto_640411 ) ) ( not ( = ?auto_640405 ?auto_640412 ) ) ( not ( = ?auto_640405 ?auto_640413 ) ) ( not ( = ?auto_640405 ?auto_640414 ) ) ( not ( = ?auto_640405 ?auto_640415 ) ) ( not ( = ?auto_640405 ?auto_640416 ) ) ( not ( = ?auto_640406 ?auto_640407 ) ) ( not ( = ?auto_640406 ?auto_640408 ) ) ( not ( = ?auto_640406 ?auto_640409 ) ) ( not ( = ?auto_640406 ?auto_640410 ) ) ( not ( = ?auto_640406 ?auto_640411 ) ) ( not ( = ?auto_640406 ?auto_640412 ) ) ( not ( = ?auto_640406 ?auto_640413 ) ) ( not ( = ?auto_640406 ?auto_640414 ) ) ( not ( = ?auto_640406 ?auto_640415 ) ) ( not ( = ?auto_640406 ?auto_640416 ) ) ( not ( = ?auto_640407 ?auto_640408 ) ) ( not ( = ?auto_640407 ?auto_640409 ) ) ( not ( = ?auto_640407 ?auto_640410 ) ) ( not ( = ?auto_640407 ?auto_640411 ) ) ( not ( = ?auto_640407 ?auto_640412 ) ) ( not ( = ?auto_640407 ?auto_640413 ) ) ( not ( = ?auto_640407 ?auto_640414 ) ) ( not ( = ?auto_640407 ?auto_640415 ) ) ( not ( = ?auto_640407 ?auto_640416 ) ) ( not ( = ?auto_640408 ?auto_640409 ) ) ( not ( = ?auto_640408 ?auto_640410 ) ) ( not ( = ?auto_640408 ?auto_640411 ) ) ( not ( = ?auto_640408 ?auto_640412 ) ) ( not ( = ?auto_640408 ?auto_640413 ) ) ( not ( = ?auto_640408 ?auto_640414 ) ) ( not ( = ?auto_640408 ?auto_640415 ) ) ( not ( = ?auto_640408 ?auto_640416 ) ) ( not ( = ?auto_640409 ?auto_640410 ) ) ( not ( = ?auto_640409 ?auto_640411 ) ) ( not ( = ?auto_640409 ?auto_640412 ) ) ( not ( = ?auto_640409 ?auto_640413 ) ) ( not ( = ?auto_640409 ?auto_640414 ) ) ( not ( = ?auto_640409 ?auto_640415 ) ) ( not ( = ?auto_640409 ?auto_640416 ) ) ( not ( = ?auto_640410 ?auto_640411 ) ) ( not ( = ?auto_640410 ?auto_640412 ) ) ( not ( = ?auto_640410 ?auto_640413 ) ) ( not ( = ?auto_640410 ?auto_640414 ) ) ( not ( = ?auto_640410 ?auto_640415 ) ) ( not ( = ?auto_640410 ?auto_640416 ) ) ( not ( = ?auto_640411 ?auto_640412 ) ) ( not ( = ?auto_640411 ?auto_640413 ) ) ( not ( = ?auto_640411 ?auto_640414 ) ) ( not ( = ?auto_640411 ?auto_640415 ) ) ( not ( = ?auto_640411 ?auto_640416 ) ) ( not ( = ?auto_640412 ?auto_640413 ) ) ( not ( = ?auto_640412 ?auto_640414 ) ) ( not ( = ?auto_640412 ?auto_640415 ) ) ( not ( = ?auto_640412 ?auto_640416 ) ) ( not ( = ?auto_640413 ?auto_640414 ) ) ( not ( = ?auto_640413 ?auto_640415 ) ) ( not ( = ?auto_640413 ?auto_640416 ) ) ( not ( = ?auto_640414 ?auto_640415 ) ) ( not ( = ?auto_640414 ?auto_640416 ) ) ( not ( = ?auto_640415 ?auto_640416 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_640415 ?auto_640416 )
      ( !STACK ?auto_640415 ?auto_640414 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_640466 - BLOCK
      ?auto_640467 - BLOCK
      ?auto_640468 - BLOCK
      ?auto_640469 - BLOCK
      ?auto_640470 - BLOCK
      ?auto_640471 - BLOCK
      ?auto_640472 - BLOCK
      ?auto_640473 - BLOCK
      ?auto_640474 - BLOCK
      ?auto_640475 - BLOCK
      ?auto_640476 - BLOCK
      ?auto_640477 - BLOCK
      ?auto_640478 - BLOCK
      ?auto_640479 - BLOCK
      ?auto_640480 - BLOCK
      ?auto_640481 - BLOCK
    )
    :vars
    (
      ?auto_640482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_640481 ?auto_640482 ) ( ON-TABLE ?auto_640466 ) ( ON ?auto_640467 ?auto_640466 ) ( ON ?auto_640468 ?auto_640467 ) ( ON ?auto_640469 ?auto_640468 ) ( ON ?auto_640470 ?auto_640469 ) ( ON ?auto_640471 ?auto_640470 ) ( ON ?auto_640472 ?auto_640471 ) ( ON ?auto_640473 ?auto_640472 ) ( ON ?auto_640474 ?auto_640473 ) ( ON ?auto_640475 ?auto_640474 ) ( ON ?auto_640476 ?auto_640475 ) ( ON ?auto_640477 ?auto_640476 ) ( ON ?auto_640478 ?auto_640477 ) ( ON ?auto_640479 ?auto_640478 ) ( not ( = ?auto_640466 ?auto_640467 ) ) ( not ( = ?auto_640466 ?auto_640468 ) ) ( not ( = ?auto_640466 ?auto_640469 ) ) ( not ( = ?auto_640466 ?auto_640470 ) ) ( not ( = ?auto_640466 ?auto_640471 ) ) ( not ( = ?auto_640466 ?auto_640472 ) ) ( not ( = ?auto_640466 ?auto_640473 ) ) ( not ( = ?auto_640466 ?auto_640474 ) ) ( not ( = ?auto_640466 ?auto_640475 ) ) ( not ( = ?auto_640466 ?auto_640476 ) ) ( not ( = ?auto_640466 ?auto_640477 ) ) ( not ( = ?auto_640466 ?auto_640478 ) ) ( not ( = ?auto_640466 ?auto_640479 ) ) ( not ( = ?auto_640466 ?auto_640480 ) ) ( not ( = ?auto_640466 ?auto_640481 ) ) ( not ( = ?auto_640466 ?auto_640482 ) ) ( not ( = ?auto_640467 ?auto_640468 ) ) ( not ( = ?auto_640467 ?auto_640469 ) ) ( not ( = ?auto_640467 ?auto_640470 ) ) ( not ( = ?auto_640467 ?auto_640471 ) ) ( not ( = ?auto_640467 ?auto_640472 ) ) ( not ( = ?auto_640467 ?auto_640473 ) ) ( not ( = ?auto_640467 ?auto_640474 ) ) ( not ( = ?auto_640467 ?auto_640475 ) ) ( not ( = ?auto_640467 ?auto_640476 ) ) ( not ( = ?auto_640467 ?auto_640477 ) ) ( not ( = ?auto_640467 ?auto_640478 ) ) ( not ( = ?auto_640467 ?auto_640479 ) ) ( not ( = ?auto_640467 ?auto_640480 ) ) ( not ( = ?auto_640467 ?auto_640481 ) ) ( not ( = ?auto_640467 ?auto_640482 ) ) ( not ( = ?auto_640468 ?auto_640469 ) ) ( not ( = ?auto_640468 ?auto_640470 ) ) ( not ( = ?auto_640468 ?auto_640471 ) ) ( not ( = ?auto_640468 ?auto_640472 ) ) ( not ( = ?auto_640468 ?auto_640473 ) ) ( not ( = ?auto_640468 ?auto_640474 ) ) ( not ( = ?auto_640468 ?auto_640475 ) ) ( not ( = ?auto_640468 ?auto_640476 ) ) ( not ( = ?auto_640468 ?auto_640477 ) ) ( not ( = ?auto_640468 ?auto_640478 ) ) ( not ( = ?auto_640468 ?auto_640479 ) ) ( not ( = ?auto_640468 ?auto_640480 ) ) ( not ( = ?auto_640468 ?auto_640481 ) ) ( not ( = ?auto_640468 ?auto_640482 ) ) ( not ( = ?auto_640469 ?auto_640470 ) ) ( not ( = ?auto_640469 ?auto_640471 ) ) ( not ( = ?auto_640469 ?auto_640472 ) ) ( not ( = ?auto_640469 ?auto_640473 ) ) ( not ( = ?auto_640469 ?auto_640474 ) ) ( not ( = ?auto_640469 ?auto_640475 ) ) ( not ( = ?auto_640469 ?auto_640476 ) ) ( not ( = ?auto_640469 ?auto_640477 ) ) ( not ( = ?auto_640469 ?auto_640478 ) ) ( not ( = ?auto_640469 ?auto_640479 ) ) ( not ( = ?auto_640469 ?auto_640480 ) ) ( not ( = ?auto_640469 ?auto_640481 ) ) ( not ( = ?auto_640469 ?auto_640482 ) ) ( not ( = ?auto_640470 ?auto_640471 ) ) ( not ( = ?auto_640470 ?auto_640472 ) ) ( not ( = ?auto_640470 ?auto_640473 ) ) ( not ( = ?auto_640470 ?auto_640474 ) ) ( not ( = ?auto_640470 ?auto_640475 ) ) ( not ( = ?auto_640470 ?auto_640476 ) ) ( not ( = ?auto_640470 ?auto_640477 ) ) ( not ( = ?auto_640470 ?auto_640478 ) ) ( not ( = ?auto_640470 ?auto_640479 ) ) ( not ( = ?auto_640470 ?auto_640480 ) ) ( not ( = ?auto_640470 ?auto_640481 ) ) ( not ( = ?auto_640470 ?auto_640482 ) ) ( not ( = ?auto_640471 ?auto_640472 ) ) ( not ( = ?auto_640471 ?auto_640473 ) ) ( not ( = ?auto_640471 ?auto_640474 ) ) ( not ( = ?auto_640471 ?auto_640475 ) ) ( not ( = ?auto_640471 ?auto_640476 ) ) ( not ( = ?auto_640471 ?auto_640477 ) ) ( not ( = ?auto_640471 ?auto_640478 ) ) ( not ( = ?auto_640471 ?auto_640479 ) ) ( not ( = ?auto_640471 ?auto_640480 ) ) ( not ( = ?auto_640471 ?auto_640481 ) ) ( not ( = ?auto_640471 ?auto_640482 ) ) ( not ( = ?auto_640472 ?auto_640473 ) ) ( not ( = ?auto_640472 ?auto_640474 ) ) ( not ( = ?auto_640472 ?auto_640475 ) ) ( not ( = ?auto_640472 ?auto_640476 ) ) ( not ( = ?auto_640472 ?auto_640477 ) ) ( not ( = ?auto_640472 ?auto_640478 ) ) ( not ( = ?auto_640472 ?auto_640479 ) ) ( not ( = ?auto_640472 ?auto_640480 ) ) ( not ( = ?auto_640472 ?auto_640481 ) ) ( not ( = ?auto_640472 ?auto_640482 ) ) ( not ( = ?auto_640473 ?auto_640474 ) ) ( not ( = ?auto_640473 ?auto_640475 ) ) ( not ( = ?auto_640473 ?auto_640476 ) ) ( not ( = ?auto_640473 ?auto_640477 ) ) ( not ( = ?auto_640473 ?auto_640478 ) ) ( not ( = ?auto_640473 ?auto_640479 ) ) ( not ( = ?auto_640473 ?auto_640480 ) ) ( not ( = ?auto_640473 ?auto_640481 ) ) ( not ( = ?auto_640473 ?auto_640482 ) ) ( not ( = ?auto_640474 ?auto_640475 ) ) ( not ( = ?auto_640474 ?auto_640476 ) ) ( not ( = ?auto_640474 ?auto_640477 ) ) ( not ( = ?auto_640474 ?auto_640478 ) ) ( not ( = ?auto_640474 ?auto_640479 ) ) ( not ( = ?auto_640474 ?auto_640480 ) ) ( not ( = ?auto_640474 ?auto_640481 ) ) ( not ( = ?auto_640474 ?auto_640482 ) ) ( not ( = ?auto_640475 ?auto_640476 ) ) ( not ( = ?auto_640475 ?auto_640477 ) ) ( not ( = ?auto_640475 ?auto_640478 ) ) ( not ( = ?auto_640475 ?auto_640479 ) ) ( not ( = ?auto_640475 ?auto_640480 ) ) ( not ( = ?auto_640475 ?auto_640481 ) ) ( not ( = ?auto_640475 ?auto_640482 ) ) ( not ( = ?auto_640476 ?auto_640477 ) ) ( not ( = ?auto_640476 ?auto_640478 ) ) ( not ( = ?auto_640476 ?auto_640479 ) ) ( not ( = ?auto_640476 ?auto_640480 ) ) ( not ( = ?auto_640476 ?auto_640481 ) ) ( not ( = ?auto_640476 ?auto_640482 ) ) ( not ( = ?auto_640477 ?auto_640478 ) ) ( not ( = ?auto_640477 ?auto_640479 ) ) ( not ( = ?auto_640477 ?auto_640480 ) ) ( not ( = ?auto_640477 ?auto_640481 ) ) ( not ( = ?auto_640477 ?auto_640482 ) ) ( not ( = ?auto_640478 ?auto_640479 ) ) ( not ( = ?auto_640478 ?auto_640480 ) ) ( not ( = ?auto_640478 ?auto_640481 ) ) ( not ( = ?auto_640478 ?auto_640482 ) ) ( not ( = ?auto_640479 ?auto_640480 ) ) ( not ( = ?auto_640479 ?auto_640481 ) ) ( not ( = ?auto_640479 ?auto_640482 ) ) ( not ( = ?auto_640480 ?auto_640481 ) ) ( not ( = ?auto_640480 ?auto_640482 ) ) ( not ( = ?auto_640481 ?auto_640482 ) ) ( CLEAR ?auto_640479 ) ( ON ?auto_640480 ?auto_640481 ) ( CLEAR ?auto_640480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_640466 ?auto_640467 ?auto_640468 ?auto_640469 ?auto_640470 ?auto_640471 ?auto_640472 ?auto_640473 ?auto_640474 ?auto_640475 ?auto_640476 ?auto_640477 ?auto_640478 ?auto_640479 ?auto_640480 )
      ( MAKE-16PILE ?auto_640466 ?auto_640467 ?auto_640468 ?auto_640469 ?auto_640470 ?auto_640471 ?auto_640472 ?auto_640473 ?auto_640474 ?auto_640475 ?auto_640476 ?auto_640477 ?auto_640478 ?auto_640479 ?auto_640480 ?auto_640481 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_640532 - BLOCK
      ?auto_640533 - BLOCK
      ?auto_640534 - BLOCK
      ?auto_640535 - BLOCK
      ?auto_640536 - BLOCK
      ?auto_640537 - BLOCK
      ?auto_640538 - BLOCK
      ?auto_640539 - BLOCK
      ?auto_640540 - BLOCK
      ?auto_640541 - BLOCK
      ?auto_640542 - BLOCK
      ?auto_640543 - BLOCK
      ?auto_640544 - BLOCK
      ?auto_640545 - BLOCK
      ?auto_640546 - BLOCK
      ?auto_640547 - BLOCK
    )
    :vars
    (
      ?auto_640548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_640547 ?auto_640548 ) ( ON-TABLE ?auto_640532 ) ( ON ?auto_640533 ?auto_640532 ) ( ON ?auto_640534 ?auto_640533 ) ( ON ?auto_640535 ?auto_640534 ) ( ON ?auto_640536 ?auto_640535 ) ( ON ?auto_640537 ?auto_640536 ) ( ON ?auto_640538 ?auto_640537 ) ( ON ?auto_640539 ?auto_640538 ) ( ON ?auto_640540 ?auto_640539 ) ( ON ?auto_640541 ?auto_640540 ) ( ON ?auto_640542 ?auto_640541 ) ( ON ?auto_640543 ?auto_640542 ) ( ON ?auto_640544 ?auto_640543 ) ( not ( = ?auto_640532 ?auto_640533 ) ) ( not ( = ?auto_640532 ?auto_640534 ) ) ( not ( = ?auto_640532 ?auto_640535 ) ) ( not ( = ?auto_640532 ?auto_640536 ) ) ( not ( = ?auto_640532 ?auto_640537 ) ) ( not ( = ?auto_640532 ?auto_640538 ) ) ( not ( = ?auto_640532 ?auto_640539 ) ) ( not ( = ?auto_640532 ?auto_640540 ) ) ( not ( = ?auto_640532 ?auto_640541 ) ) ( not ( = ?auto_640532 ?auto_640542 ) ) ( not ( = ?auto_640532 ?auto_640543 ) ) ( not ( = ?auto_640532 ?auto_640544 ) ) ( not ( = ?auto_640532 ?auto_640545 ) ) ( not ( = ?auto_640532 ?auto_640546 ) ) ( not ( = ?auto_640532 ?auto_640547 ) ) ( not ( = ?auto_640532 ?auto_640548 ) ) ( not ( = ?auto_640533 ?auto_640534 ) ) ( not ( = ?auto_640533 ?auto_640535 ) ) ( not ( = ?auto_640533 ?auto_640536 ) ) ( not ( = ?auto_640533 ?auto_640537 ) ) ( not ( = ?auto_640533 ?auto_640538 ) ) ( not ( = ?auto_640533 ?auto_640539 ) ) ( not ( = ?auto_640533 ?auto_640540 ) ) ( not ( = ?auto_640533 ?auto_640541 ) ) ( not ( = ?auto_640533 ?auto_640542 ) ) ( not ( = ?auto_640533 ?auto_640543 ) ) ( not ( = ?auto_640533 ?auto_640544 ) ) ( not ( = ?auto_640533 ?auto_640545 ) ) ( not ( = ?auto_640533 ?auto_640546 ) ) ( not ( = ?auto_640533 ?auto_640547 ) ) ( not ( = ?auto_640533 ?auto_640548 ) ) ( not ( = ?auto_640534 ?auto_640535 ) ) ( not ( = ?auto_640534 ?auto_640536 ) ) ( not ( = ?auto_640534 ?auto_640537 ) ) ( not ( = ?auto_640534 ?auto_640538 ) ) ( not ( = ?auto_640534 ?auto_640539 ) ) ( not ( = ?auto_640534 ?auto_640540 ) ) ( not ( = ?auto_640534 ?auto_640541 ) ) ( not ( = ?auto_640534 ?auto_640542 ) ) ( not ( = ?auto_640534 ?auto_640543 ) ) ( not ( = ?auto_640534 ?auto_640544 ) ) ( not ( = ?auto_640534 ?auto_640545 ) ) ( not ( = ?auto_640534 ?auto_640546 ) ) ( not ( = ?auto_640534 ?auto_640547 ) ) ( not ( = ?auto_640534 ?auto_640548 ) ) ( not ( = ?auto_640535 ?auto_640536 ) ) ( not ( = ?auto_640535 ?auto_640537 ) ) ( not ( = ?auto_640535 ?auto_640538 ) ) ( not ( = ?auto_640535 ?auto_640539 ) ) ( not ( = ?auto_640535 ?auto_640540 ) ) ( not ( = ?auto_640535 ?auto_640541 ) ) ( not ( = ?auto_640535 ?auto_640542 ) ) ( not ( = ?auto_640535 ?auto_640543 ) ) ( not ( = ?auto_640535 ?auto_640544 ) ) ( not ( = ?auto_640535 ?auto_640545 ) ) ( not ( = ?auto_640535 ?auto_640546 ) ) ( not ( = ?auto_640535 ?auto_640547 ) ) ( not ( = ?auto_640535 ?auto_640548 ) ) ( not ( = ?auto_640536 ?auto_640537 ) ) ( not ( = ?auto_640536 ?auto_640538 ) ) ( not ( = ?auto_640536 ?auto_640539 ) ) ( not ( = ?auto_640536 ?auto_640540 ) ) ( not ( = ?auto_640536 ?auto_640541 ) ) ( not ( = ?auto_640536 ?auto_640542 ) ) ( not ( = ?auto_640536 ?auto_640543 ) ) ( not ( = ?auto_640536 ?auto_640544 ) ) ( not ( = ?auto_640536 ?auto_640545 ) ) ( not ( = ?auto_640536 ?auto_640546 ) ) ( not ( = ?auto_640536 ?auto_640547 ) ) ( not ( = ?auto_640536 ?auto_640548 ) ) ( not ( = ?auto_640537 ?auto_640538 ) ) ( not ( = ?auto_640537 ?auto_640539 ) ) ( not ( = ?auto_640537 ?auto_640540 ) ) ( not ( = ?auto_640537 ?auto_640541 ) ) ( not ( = ?auto_640537 ?auto_640542 ) ) ( not ( = ?auto_640537 ?auto_640543 ) ) ( not ( = ?auto_640537 ?auto_640544 ) ) ( not ( = ?auto_640537 ?auto_640545 ) ) ( not ( = ?auto_640537 ?auto_640546 ) ) ( not ( = ?auto_640537 ?auto_640547 ) ) ( not ( = ?auto_640537 ?auto_640548 ) ) ( not ( = ?auto_640538 ?auto_640539 ) ) ( not ( = ?auto_640538 ?auto_640540 ) ) ( not ( = ?auto_640538 ?auto_640541 ) ) ( not ( = ?auto_640538 ?auto_640542 ) ) ( not ( = ?auto_640538 ?auto_640543 ) ) ( not ( = ?auto_640538 ?auto_640544 ) ) ( not ( = ?auto_640538 ?auto_640545 ) ) ( not ( = ?auto_640538 ?auto_640546 ) ) ( not ( = ?auto_640538 ?auto_640547 ) ) ( not ( = ?auto_640538 ?auto_640548 ) ) ( not ( = ?auto_640539 ?auto_640540 ) ) ( not ( = ?auto_640539 ?auto_640541 ) ) ( not ( = ?auto_640539 ?auto_640542 ) ) ( not ( = ?auto_640539 ?auto_640543 ) ) ( not ( = ?auto_640539 ?auto_640544 ) ) ( not ( = ?auto_640539 ?auto_640545 ) ) ( not ( = ?auto_640539 ?auto_640546 ) ) ( not ( = ?auto_640539 ?auto_640547 ) ) ( not ( = ?auto_640539 ?auto_640548 ) ) ( not ( = ?auto_640540 ?auto_640541 ) ) ( not ( = ?auto_640540 ?auto_640542 ) ) ( not ( = ?auto_640540 ?auto_640543 ) ) ( not ( = ?auto_640540 ?auto_640544 ) ) ( not ( = ?auto_640540 ?auto_640545 ) ) ( not ( = ?auto_640540 ?auto_640546 ) ) ( not ( = ?auto_640540 ?auto_640547 ) ) ( not ( = ?auto_640540 ?auto_640548 ) ) ( not ( = ?auto_640541 ?auto_640542 ) ) ( not ( = ?auto_640541 ?auto_640543 ) ) ( not ( = ?auto_640541 ?auto_640544 ) ) ( not ( = ?auto_640541 ?auto_640545 ) ) ( not ( = ?auto_640541 ?auto_640546 ) ) ( not ( = ?auto_640541 ?auto_640547 ) ) ( not ( = ?auto_640541 ?auto_640548 ) ) ( not ( = ?auto_640542 ?auto_640543 ) ) ( not ( = ?auto_640542 ?auto_640544 ) ) ( not ( = ?auto_640542 ?auto_640545 ) ) ( not ( = ?auto_640542 ?auto_640546 ) ) ( not ( = ?auto_640542 ?auto_640547 ) ) ( not ( = ?auto_640542 ?auto_640548 ) ) ( not ( = ?auto_640543 ?auto_640544 ) ) ( not ( = ?auto_640543 ?auto_640545 ) ) ( not ( = ?auto_640543 ?auto_640546 ) ) ( not ( = ?auto_640543 ?auto_640547 ) ) ( not ( = ?auto_640543 ?auto_640548 ) ) ( not ( = ?auto_640544 ?auto_640545 ) ) ( not ( = ?auto_640544 ?auto_640546 ) ) ( not ( = ?auto_640544 ?auto_640547 ) ) ( not ( = ?auto_640544 ?auto_640548 ) ) ( not ( = ?auto_640545 ?auto_640546 ) ) ( not ( = ?auto_640545 ?auto_640547 ) ) ( not ( = ?auto_640545 ?auto_640548 ) ) ( not ( = ?auto_640546 ?auto_640547 ) ) ( not ( = ?auto_640546 ?auto_640548 ) ) ( not ( = ?auto_640547 ?auto_640548 ) ) ( ON ?auto_640546 ?auto_640547 ) ( CLEAR ?auto_640544 ) ( ON ?auto_640545 ?auto_640546 ) ( CLEAR ?auto_640545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_640532 ?auto_640533 ?auto_640534 ?auto_640535 ?auto_640536 ?auto_640537 ?auto_640538 ?auto_640539 ?auto_640540 ?auto_640541 ?auto_640542 ?auto_640543 ?auto_640544 ?auto_640545 )
      ( MAKE-16PILE ?auto_640532 ?auto_640533 ?auto_640534 ?auto_640535 ?auto_640536 ?auto_640537 ?auto_640538 ?auto_640539 ?auto_640540 ?auto_640541 ?auto_640542 ?auto_640543 ?auto_640544 ?auto_640545 ?auto_640546 ?auto_640547 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_640598 - BLOCK
      ?auto_640599 - BLOCK
      ?auto_640600 - BLOCK
      ?auto_640601 - BLOCK
      ?auto_640602 - BLOCK
      ?auto_640603 - BLOCK
      ?auto_640604 - BLOCK
      ?auto_640605 - BLOCK
      ?auto_640606 - BLOCK
      ?auto_640607 - BLOCK
      ?auto_640608 - BLOCK
      ?auto_640609 - BLOCK
      ?auto_640610 - BLOCK
      ?auto_640611 - BLOCK
      ?auto_640612 - BLOCK
      ?auto_640613 - BLOCK
    )
    :vars
    (
      ?auto_640614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_640613 ?auto_640614 ) ( ON-TABLE ?auto_640598 ) ( ON ?auto_640599 ?auto_640598 ) ( ON ?auto_640600 ?auto_640599 ) ( ON ?auto_640601 ?auto_640600 ) ( ON ?auto_640602 ?auto_640601 ) ( ON ?auto_640603 ?auto_640602 ) ( ON ?auto_640604 ?auto_640603 ) ( ON ?auto_640605 ?auto_640604 ) ( ON ?auto_640606 ?auto_640605 ) ( ON ?auto_640607 ?auto_640606 ) ( ON ?auto_640608 ?auto_640607 ) ( ON ?auto_640609 ?auto_640608 ) ( not ( = ?auto_640598 ?auto_640599 ) ) ( not ( = ?auto_640598 ?auto_640600 ) ) ( not ( = ?auto_640598 ?auto_640601 ) ) ( not ( = ?auto_640598 ?auto_640602 ) ) ( not ( = ?auto_640598 ?auto_640603 ) ) ( not ( = ?auto_640598 ?auto_640604 ) ) ( not ( = ?auto_640598 ?auto_640605 ) ) ( not ( = ?auto_640598 ?auto_640606 ) ) ( not ( = ?auto_640598 ?auto_640607 ) ) ( not ( = ?auto_640598 ?auto_640608 ) ) ( not ( = ?auto_640598 ?auto_640609 ) ) ( not ( = ?auto_640598 ?auto_640610 ) ) ( not ( = ?auto_640598 ?auto_640611 ) ) ( not ( = ?auto_640598 ?auto_640612 ) ) ( not ( = ?auto_640598 ?auto_640613 ) ) ( not ( = ?auto_640598 ?auto_640614 ) ) ( not ( = ?auto_640599 ?auto_640600 ) ) ( not ( = ?auto_640599 ?auto_640601 ) ) ( not ( = ?auto_640599 ?auto_640602 ) ) ( not ( = ?auto_640599 ?auto_640603 ) ) ( not ( = ?auto_640599 ?auto_640604 ) ) ( not ( = ?auto_640599 ?auto_640605 ) ) ( not ( = ?auto_640599 ?auto_640606 ) ) ( not ( = ?auto_640599 ?auto_640607 ) ) ( not ( = ?auto_640599 ?auto_640608 ) ) ( not ( = ?auto_640599 ?auto_640609 ) ) ( not ( = ?auto_640599 ?auto_640610 ) ) ( not ( = ?auto_640599 ?auto_640611 ) ) ( not ( = ?auto_640599 ?auto_640612 ) ) ( not ( = ?auto_640599 ?auto_640613 ) ) ( not ( = ?auto_640599 ?auto_640614 ) ) ( not ( = ?auto_640600 ?auto_640601 ) ) ( not ( = ?auto_640600 ?auto_640602 ) ) ( not ( = ?auto_640600 ?auto_640603 ) ) ( not ( = ?auto_640600 ?auto_640604 ) ) ( not ( = ?auto_640600 ?auto_640605 ) ) ( not ( = ?auto_640600 ?auto_640606 ) ) ( not ( = ?auto_640600 ?auto_640607 ) ) ( not ( = ?auto_640600 ?auto_640608 ) ) ( not ( = ?auto_640600 ?auto_640609 ) ) ( not ( = ?auto_640600 ?auto_640610 ) ) ( not ( = ?auto_640600 ?auto_640611 ) ) ( not ( = ?auto_640600 ?auto_640612 ) ) ( not ( = ?auto_640600 ?auto_640613 ) ) ( not ( = ?auto_640600 ?auto_640614 ) ) ( not ( = ?auto_640601 ?auto_640602 ) ) ( not ( = ?auto_640601 ?auto_640603 ) ) ( not ( = ?auto_640601 ?auto_640604 ) ) ( not ( = ?auto_640601 ?auto_640605 ) ) ( not ( = ?auto_640601 ?auto_640606 ) ) ( not ( = ?auto_640601 ?auto_640607 ) ) ( not ( = ?auto_640601 ?auto_640608 ) ) ( not ( = ?auto_640601 ?auto_640609 ) ) ( not ( = ?auto_640601 ?auto_640610 ) ) ( not ( = ?auto_640601 ?auto_640611 ) ) ( not ( = ?auto_640601 ?auto_640612 ) ) ( not ( = ?auto_640601 ?auto_640613 ) ) ( not ( = ?auto_640601 ?auto_640614 ) ) ( not ( = ?auto_640602 ?auto_640603 ) ) ( not ( = ?auto_640602 ?auto_640604 ) ) ( not ( = ?auto_640602 ?auto_640605 ) ) ( not ( = ?auto_640602 ?auto_640606 ) ) ( not ( = ?auto_640602 ?auto_640607 ) ) ( not ( = ?auto_640602 ?auto_640608 ) ) ( not ( = ?auto_640602 ?auto_640609 ) ) ( not ( = ?auto_640602 ?auto_640610 ) ) ( not ( = ?auto_640602 ?auto_640611 ) ) ( not ( = ?auto_640602 ?auto_640612 ) ) ( not ( = ?auto_640602 ?auto_640613 ) ) ( not ( = ?auto_640602 ?auto_640614 ) ) ( not ( = ?auto_640603 ?auto_640604 ) ) ( not ( = ?auto_640603 ?auto_640605 ) ) ( not ( = ?auto_640603 ?auto_640606 ) ) ( not ( = ?auto_640603 ?auto_640607 ) ) ( not ( = ?auto_640603 ?auto_640608 ) ) ( not ( = ?auto_640603 ?auto_640609 ) ) ( not ( = ?auto_640603 ?auto_640610 ) ) ( not ( = ?auto_640603 ?auto_640611 ) ) ( not ( = ?auto_640603 ?auto_640612 ) ) ( not ( = ?auto_640603 ?auto_640613 ) ) ( not ( = ?auto_640603 ?auto_640614 ) ) ( not ( = ?auto_640604 ?auto_640605 ) ) ( not ( = ?auto_640604 ?auto_640606 ) ) ( not ( = ?auto_640604 ?auto_640607 ) ) ( not ( = ?auto_640604 ?auto_640608 ) ) ( not ( = ?auto_640604 ?auto_640609 ) ) ( not ( = ?auto_640604 ?auto_640610 ) ) ( not ( = ?auto_640604 ?auto_640611 ) ) ( not ( = ?auto_640604 ?auto_640612 ) ) ( not ( = ?auto_640604 ?auto_640613 ) ) ( not ( = ?auto_640604 ?auto_640614 ) ) ( not ( = ?auto_640605 ?auto_640606 ) ) ( not ( = ?auto_640605 ?auto_640607 ) ) ( not ( = ?auto_640605 ?auto_640608 ) ) ( not ( = ?auto_640605 ?auto_640609 ) ) ( not ( = ?auto_640605 ?auto_640610 ) ) ( not ( = ?auto_640605 ?auto_640611 ) ) ( not ( = ?auto_640605 ?auto_640612 ) ) ( not ( = ?auto_640605 ?auto_640613 ) ) ( not ( = ?auto_640605 ?auto_640614 ) ) ( not ( = ?auto_640606 ?auto_640607 ) ) ( not ( = ?auto_640606 ?auto_640608 ) ) ( not ( = ?auto_640606 ?auto_640609 ) ) ( not ( = ?auto_640606 ?auto_640610 ) ) ( not ( = ?auto_640606 ?auto_640611 ) ) ( not ( = ?auto_640606 ?auto_640612 ) ) ( not ( = ?auto_640606 ?auto_640613 ) ) ( not ( = ?auto_640606 ?auto_640614 ) ) ( not ( = ?auto_640607 ?auto_640608 ) ) ( not ( = ?auto_640607 ?auto_640609 ) ) ( not ( = ?auto_640607 ?auto_640610 ) ) ( not ( = ?auto_640607 ?auto_640611 ) ) ( not ( = ?auto_640607 ?auto_640612 ) ) ( not ( = ?auto_640607 ?auto_640613 ) ) ( not ( = ?auto_640607 ?auto_640614 ) ) ( not ( = ?auto_640608 ?auto_640609 ) ) ( not ( = ?auto_640608 ?auto_640610 ) ) ( not ( = ?auto_640608 ?auto_640611 ) ) ( not ( = ?auto_640608 ?auto_640612 ) ) ( not ( = ?auto_640608 ?auto_640613 ) ) ( not ( = ?auto_640608 ?auto_640614 ) ) ( not ( = ?auto_640609 ?auto_640610 ) ) ( not ( = ?auto_640609 ?auto_640611 ) ) ( not ( = ?auto_640609 ?auto_640612 ) ) ( not ( = ?auto_640609 ?auto_640613 ) ) ( not ( = ?auto_640609 ?auto_640614 ) ) ( not ( = ?auto_640610 ?auto_640611 ) ) ( not ( = ?auto_640610 ?auto_640612 ) ) ( not ( = ?auto_640610 ?auto_640613 ) ) ( not ( = ?auto_640610 ?auto_640614 ) ) ( not ( = ?auto_640611 ?auto_640612 ) ) ( not ( = ?auto_640611 ?auto_640613 ) ) ( not ( = ?auto_640611 ?auto_640614 ) ) ( not ( = ?auto_640612 ?auto_640613 ) ) ( not ( = ?auto_640612 ?auto_640614 ) ) ( not ( = ?auto_640613 ?auto_640614 ) ) ( ON ?auto_640612 ?auto_640613 ) ( ON ?auto_640611 ?auto_640612 ) ( CLEAR ?auto_640609 ) ( ON ?auto_640610 ?auto_640611 ) ( CLEAR ?auto_640610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_640598 ?auto_640599 ?auto_640600 ?auto_640601 ?auto_640602 ?auto_640603 ?auto_640604 ?auto_640605 ?auto_640606 ?auto_640607 ?auto_640608 ?auto_640609 ?auto_640610 )
      ( MAKE-16PILE ?auto_640598 ?auto_640599 ?auto_640600 ?auto_640601 ?auto_640602 ?auto_640603 ?auto_640604 ?auto_640605 ?auto_640606 ?auto_640607 ?auto_640608 ?auto_640609 ?auto_640610 ?auto_640611 ?auto_640612 ?auto_640613 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_640664 - BLOCK
      ?auto_640665 - BLOCK
      ?auto_640666 - BLOCK
      ?auto_640667 - BLOCK
      ?auto_640668 - BLOCK
      ?auto_640669 - BLOCK
      ?auto_640670 - BLOCK
      ?auto_640671 - BLOCK
      ?auto_640672 - BLOCK
      ?auto_640673 - BLOCK
      ?auto_640674 - BLOCK
      ?auto_640675 - BLOCK
      ?auto_640676 - BLOCK
      ?auto_640677 - BLOCK
      ?auto_640678 - BLOCK
      ?auto_640679 - BLOCK
    )
    :vars
    (
      ?auto_640680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_640679 ?auto_640680 ) ( ON-TABLE ?auto_640664 ) ( ON ?auto_640665 ?auto_640664 ) ( ON ?auto_640666 ?auto_640665 ) ( ON ?auto_640667 ?auto_640666 ) ( ON ?auto_640668 ?auto_640667 ) ( ON ?auto_640669 ?auto_640668 ) ( ON ?auto_640670 ?auto_640669 ) ( ON ?auto_640671 ?auto_640670 ) ( ON ?auto_640672 ?auto_640671 ) ( ON ?auto_640673 ?auto_640672 ) ( ON ?auto_640674 ?auto_640673 ) ( not ( = ?auto_640664 ?auto_640665 ) ) ( not ( = ?auto_640664 ?auto_640666 ) ) ( not ( = ?auto_640664 ?auto_640667 ) ) ( not ( = ?auto_640664 ?auto_640668 ) ) ( not ( = ?auto_640664 ?auto_640669 ) ) ( not ( = ?auto_640664 ?auto_640670 ) ) ( not ( = ?auto_640664 ?auto_640671 ) ) ( not ( = ?auto_640664 ?auto_640672 ) ) ( not ( = ?auto_640664 ?auto_640673 ) ) ( not ( = ?auto_640664 ?auto_640674 ) ) ( not ( = ?auto_640664 ?auto_640675 ) ) ( not ( = ?auto_640664 ?auto_640676 ) ) ( not ( = ?auto_640664 ?auto_640677 ) ) ( not ( = ?auto_640664 ?auto_640678 ) ) ( not ( = ?auto_640664 ?auto_640679 ) ) ( not ( = ?auto_640664 ?auto_640680 ) ) ( not ( = ?auto_640665 ?auto_640666 ) ) ( not ( = ?auto_640665 ?auto_640667 ) ) ( not ( = ?auto_640665 ?auto_640668 ) ) ( not ( = ?auto_640665 ?auto_640669 ) ) ( not ( = ?auto_640665 ?auto_640670 ) ) ( not ( = ?auto_640665 ?auto_640671 ) ) ( not ( = ?auto_640665 ?auto_640672 ) ) ( not ( = ?auto_640665 ?auto_640673 ) ) ( not ( = ?auto_640665 ?auto_640674 ) ) ( not ( = ?auto_640665 ?auto_640675 ) ) ( not ( = ?auto_640665 ?auto_640676 ) ) ( not ( = ?auto_640665 ?auto_640677 ) ) ( not ( = ?auto_640665 ?auto_640678 ) ) ( not ( = ?auto_640665 ?auto_640679 ) ) ( not ( = ?auto_640665 ?auto_640680 ) ) ( not ( = ?auto_640666 ?auto_640667 ) ) ( not ( = ?auto_640666 ?auto_640668 ) ) ( not ( = ?auto_640666 ?auto_640669 ) ) ( not ( = ?auto_640666 ?auto_640670 ) ) ( not ( = ?auto_640666 ?auto_640671 ) ) ( not ( = ?auto_640666 ?auto_640672 ) ) ( not ( = ?auto_640666 ?auto_640673 ) ) ( not ( = ?auto_640666 ?auto_640674 ) ) ( not ( = ?auto_640666 ?auto_640675 ) ) ( not ( = ?auto_640666 ?auto_640676 ) ) ( not ( = ?auto_640666 ?auto_640677 ) ) ( not ( = ?auto_640666 ?auto_640678 ) ) ( not ( = ?auto_640666 ?auto_640679 ) ) ( not ( = ?auto_640666 ?auto_640680 ) ) ( not ( = ?auto_640667 ?auto_640668 ) ) ( not ( = ?auto_640667 ?auto_640669 ) ) ( not ( = ?auto_640667 ?auto_640670 ) ) ( not ( = ?auto_640667 ?auto_640671 ) ) ( not ( = ?auto_640667 ?auto_640672 ) ) ( not ( = ?auto_640667 ?auto_640673 ) ) ( not ( = ?auto_640667 ?auto_640674 ) ) ( not ( = ?auto_640667 ?auto_640675 ) ) ( not ( = ?auto_640667 ?auto_640676 ) ) ( not ( = ?auto_640667 ?auto_640677 ) ) ( not ( = ?auto_640667 ?auto_640678 ) ) ( not ( = ?auto_640667 ?auto_640679 ) ) ( not ( = ?auto_640667 ?auto_640680 ) ) ( not ( = ?auto_640668 ?auto_640669 ) ) ( not ( = ?auto_640668 ?auto_640670 ) ) ( not ( = ?auto_640668 ?auto_640671 ) ) ( not ( = ?auto_640668 ?auto_640672 ) ) ( not ( = ?auto_640668 ?auto_640673 ) ) ( not ( = ?auto_640668 ?auto_640674 ) ) ( not ( = ?auto_640668 ?auto_640675 ) ) ( not ( = ?auto_640668 ?auto_640676 ) ) ( not ( = ?auto_640668 ?auto_640677 ) ) ( not ( = ?auto_640668 ?auto_640678 ) ) ( not ( = ?auto_640668 ?auto_640679 ) ) ( not ( = ?auto_640668 ?auto_640680 ) ) ( not ( = ?auto_640669 ?auto_640670 ) ) ( not ( = ?auto_640669 ?auto_640671 ) ) ( not ( = ?auto_640669 ?auto_640672 ) ) ( not ( = ?auto_640669 ?auto_640673 ) ) ( not ( = ?auto_640669 ?auto_640674 ) ) ( not ( = ?auto_640669 ?auto_640675 ) ) ( not ( = ?auto_640669 ?auto_640676 ) ) ( not ( = ?auto_640669 ?auto_640677 ) ) ( not ( = ?auto_640669 ?auto_640678 ) ) ( not ( = ?auto_640669 ?auto_640679 ) ) ( not ( = ?auto_640669 ?auto_640680 ) ) ( not ( = ?auto_640670 ?auto_640671 ) ) ( not ( = ?auto_640670 ?auto_640672 ) ) ( not ( = ?auto_640670 ?auto_640673 ) ) ( not ( = ?auto_640670 ?auto_640674 ) ) ( not ( = ?auto_640670 ?auto_640675 ) ) ( not ( = ?auto_640670 ?auto_640676 ) ) ( not ( = ?auto_640670 ?auto_640677 ) ) ( not ( = ?auto_640670 ?auto_640678 ) ) ( not ( = ?auto_640670 ?auto_640679 ) ) ( not ( = ?auto_640670 ?auto_640680 ) ) ( not ( = ?auto_640671 ?auto_640672 ) ) ( not ( = ?auto_640671 ?auto_640673 ) ) ( not ( = ?auto_640671 ?auto_640674 ) ) ( not ( = ?auto_640671 ?auto_640675 ) ) ( not ( = ?auto_640671 ?auto_640676 ) ) ( not ( = ?auto_640671 ?auto_640677 ) ) ( not ( = ?auto_640671 ?auto_640678 ) ) ( not ( = ?auto_640671 ?auto_640679 ) ) ( not ( = ?auto_640671 ?auto_640680 ) ) ( not ( = ?auto_640672 ?auto_640673 ) ) ( not ( = ?auto_640672 ?auto_640674 ) ) ( not ( = ?auto_640672 ?auto_640675 ) ) ( not ( = ?auto_640672 ?auto_640676 ) ) ( not ( = ?auto_640672 ?auto_640677 ) ) ( not ( = ?auto_640672 ?auto_640678 ) ) ( not ( = ?auto_640672 ?auto_640679 ) ) ( not ( = ?auto_640672 ?auto_640680 ) ) ( not ( = ?auto_640673 ?auto_640674 ) ) ( not ( = ?auto_640673 ?auto_640675 ) ) ( not ( = ?auto_640673 ?auto_640676 ) ) ( not ( = ?auto_640673 ?auto_640677 ) ) ( not ( = ?auto_640673 ?auto_640678 ) ) ( not ( = ?auto_640673 ?auto_640679 ) ) ( not ( = ?auto_640673 ?auto_640680 ) ) ( not ( = ?auto_640674 ?auto_640675 ) ) ( not ( = ?auto_640674 ?auto_640676 ) ) ( not ( = ?auto_640674 ?auto_640677 ) ) ( not ( = ?auto_640674 ?auto_640678 ) ) ( not ( = ?auto_640674 ?auto_640679 ) ) ( not ( = ?auto_640674 ?auto_640680 ) ) ( not ( = ?auto_640675 ?auto_640676 ) ) ( not ( = ?auto_640675 ?auto_640677 ) ) ( not ( = ?auto_640675 ?auto_640678 ) ) ( not ( = ?auto_640675 ?auto_640679 ) ) ( not ( = ?auto_640675 ?auto_640680 ) ) ( not ( = ?auto_640676 ?auto_640677 ) ) ( not ( = ?auto_640676 ?auto_640678 ) ) ( not ( = ?auto_640676 ?auto_640679 ) ) ( not ( = ?auto_640676 ?auto_640680 ) ) ( not ( = ?auto_640677 ?auto_640678 ) ) ( not ( = ?auto_640677 ?auto_640679 ) ) ( not ( = ?auto_640677 ?auto_640680 ) ) ( not ( = ?auto_640678 ?auto_640679 ) ) ( not ( = ?auto_640678 ?auto_640680 ) ) ( not ( = ?auto_640679 ?auto_640680 ) ) ( ON ?auto_640678 ?auto_640679 ) ( ON ?auto_640677 ?auto_640678 ) ( ON ?auto_640676 ?auto_640677 ) ( CLEAR ?auto_640674 ) ( ON ?auto_640675 ?auto_640676 ) ( CLEAR ?auto_640675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_640664 ?auto_640665 ?auto_640666 ?auto_640667 ?auto_640668 ?auto_640669 ?auto_640670 ?auto_640671 ?auto_640672 ?auto_640673 ?auto_640674 ?auto_640675 )
      ( MAKE-16PILE ?auto_640664 ?auto_640665 ?auto_640666 ?auto_640667 ?auto_640668 ?auto_640669 ?auto_640670 ?auto_640671 ?auto_640672 ?auto_640673 ?auto_640674 ?auto_640675 ?auto_640676 ?auto_640677 ?auto_640678 ?auto_640679 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_640730 - BLOCK
      ?auto_640731 - BLOCK
      ?auto_640732 - BLOCK
      ?auto_640733 - BLOCK
      ?auto_640734 - BLOCK
      ?auto_640735 - BLOCK
      ?auto_640736 - BLOCK
      ?auto_640737 - BLOCK
      ?auto_640738 - BLOCK
      ?auto_640739 - BLOCK
      ?auto_640740 - BLOCK
      ?auto_640741 - BLOCK
      ?auto_640742 - BLOCK
      ?auto_640743 - BLOCK
      ?auto_640744 - BLOCK
      ?auto_640745 - BLOCK
    )
    :vars
    (
      ?auto_640746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_640745 ?auto_640746 ) ( ON-TABLE ?auto_640730 ) ( ON ?auto_640731 ?auto_640730 ) ( ON ?auto_640732 ?auto_640731 ) ( ON ?auto_640733 ?auto_640732 ) ( ON ?auto_640734 ?auto_640733 ) ( ON ?auto_640735 ?auto_640734 ) ( ON ?auto_640736 ?auto_640735 ) ( ON ?auto_640737 ?auto_640736 ) ( ON ?auto_640738 ?auto_640737 ) ( ON ?auto_640739 ?auto_640738 ) ( not ( = ?auto_640730 ?auto_640731 ) ) ( not ( = ?auto_640730 ?auto_640732 ) ) ( not ( = ?auto_640730 ?auto_640733 ) ) ( not ( = ?auto_640730 ?auto_640734 ) ) ( not ( = ?auto_640730 ?auto_640735 ) ) ( not ( = ?auto_640730 ?auto_640736 ) ) ( not ( = ?auto_640730 ?auto_640737 ) ) ( not ( = ?auto_640730 ?auto_640738 ) ) ( not ( = ?auto_640730 ?auto_640739 ) ) ( not ( = ?auto_640730 ?auto_640740 ) ) ( not ( = ?auto_640730 ?auto_640741 ) ) ( not ( = ?auto_640730 ?auto_640742 ) ) ( not ( = ?auto_640730 ?auto_640743 ) ) ( not ( = ?auto_640730 ?auto_640744 ) ) ( not ( = ?auto_640730 ?auto_640745 ) ) ( not ( = ?auto_640730 ?auto_640746 ) ) ( not ( = ?auto_640731 ?auto_640732 ) ) ( not ( = ?auto_640731 ?auto_640733 ) ) ( not ( = ?auto_640731 ?auto_640734 ) ) ( not ( = ?auto_640731 ?auto_640735 ) ) ( not ( = ?auto_640731 ?auto_640736 ) ) ( not ( = ?auto_640731 ?auto_640737 ) ) ( not ( = ?auto_640731 ?auto_640738 ) ) ( not ( = ?auto_640731 ?auto_640739 ) ) ( not ( = ?auto_640731 ?auto_640740 ) ) ( not ( = ?auto_640731 ?auto_640741 ) ) ( not ( = ?auto_640731 ?auto_640742 ) ) ( not ( = ?auto_640731 ?auto_640743 ) ) ( not ( = ?auto_640731 ?auto_640744 ) ) ( not ( = ?auto_640731 ?auto_640745 ) ) ( not ( = ?auto_640731 ?auto_640746 ) ) ( not ( = ?auto_640732 ?auto_640733 ) ) ( not ( = ?auto_640732 ?auto_640734 ) ) ( not ( = ?auto_640732 ?auto_640735 ) ) ( not ( = ?auto_640732 ?auto_640736 ) ) ( not ( = ?auto_640732 ?auto_640737 ) ) ( not ( = ?auto_640732 ?auto_640738 ) ) ( not ( = ?auto_640732 ?auto_640739 ) ) ( not ( = ?auto_640732 ?auto_640740 ) ) ( not ( = ?auto_640732 ?auto_640741 ) ) ( not ( = ?auto_640732 ?auto_640742 ) ) ( not ( = ?auto_640732 ?auto_640743 ) ) ( not ( = ?auto_640732 ?auto_640744 ) ) ( not ( = ?auto_640732 ?auto_640745 ) ) ( not ( = ?auto_640732 ?auto_640746 ) ) ( not ( = ?auto_640733 ?auto_640734 ) ) ( not ( = ?auto_640733 ?auto_640735 ) ) ( not ( = ?auto_640733 ?auto_640736 ) ) ( not ( = ?auto_640733 ?auto_640737 ) ) ( not ( = ?auto_640733 ?auto_640738 ) ) ( not ( = ?auto_640733 ?auto_640739 ) ) ( not ( = ?auto_640733 ?auto_640740 ) ) ( not ( = ?auto_640733 ?auto_640741 ) ) ( not ( = ?auto_640733 ?auto_640742 ) ) ( not ( = ?auto_640733 ?auto_640743 ) ) ( not ( = ?auto_640733 ?auto_640744 ) ) ( not ( = ?auto_640733 ?auto_640745 ) ) ( not ( = ?auto_640733 ?auto_640746 ) ) ( not ( = ?auto_640734 ?auto_640735 ) ) ( not ( = ?auto_640734 ?auto_640736 ) ) ( not ( = ?auto_640734 ?auto_640737 ) ) ( not ( = ?auto_640734 ?auto_640738 ) ) ( not ( = ?auto_640734 ?auto_640739 ) ) ( not ( = ?auto_640734 ?auto_640740 ) ) ( not ( = ?auto_640734 ?auto_640741 ) ) ( not ( = ?auto_640734 ?auto_640742 ) ) ( not ( = ?auto_640734 ?auto_640743 ) ) ( not ( = ?auto_640734 ?auto_640744 ) ) ( not ( = ?auto_640734 ?auto_640745 ) ) ( not ( = ?auto_640734 ?auto_640746 ) ) ( not ( = ?auto_640735 ?auto_640736 ) ) ( not ( = ?auto_640735 ?auto_640737 ) ) ( not ( = ?auto_640735 ?auto_640738 ) ) ( not ( = ?auto_640735 ?auto_640739 ) ) ( not ( = ?auto_640735 ?auto_640740 ) ) ( not ( = ?auto_640735 ?auto_640741 ) ) ( not ( = ?auto_640735 ?auto_640742 ) ) ( not ( = ?auto_640735 ?auto_640743 ) ) ( not ( = ?auto_640735 ?auto_640744 ) ) ( not ( = ?auto_640735 ?auto_640745 ) ) ( not ( = ?auto_640735 ?auto_640746 ) ) ( not ( = ?auto_640736 ?auto_640737 ) ) ( not ( = ?auto_640736 ?auto_640738 ) ) ( not ( = ?auto_640736 ?auto_640739 ) ) ( not ( = ?auto_640736 ?auto_640740 ) ) ( not ( = ?auto_640736 ?auto_640741 ) ) ( not ( = ?auto_640736 ?auto_640742 ) ) ( not ( = ?auto_640736 ?auto_640743 ) ) ( not ( = ?auto_640736 ?auto_640744 ) ) ( not ( = ?auto_640736 ?auto_640745 ) ) ( not ( = ?auto_640736 ?auto_640746 ) ) ( not ( = ?auto_640737 ?auto_640738 ) ) ( not ( = ?auto_640737 ?auto_640739 ) ) ( not ( = ?auto_640737 ?auto_640740 ) ) ( not ( = ?auto_640737 ?auto_640741 ) ) ( not ( = ?auto_640737 ?auto_640742 ) ) ( not ( = ?auto_640737 ?auto_640743 ) ) ( not ( = ?auto_640737 ?auto_640744 ) ) ( not ( = ?auto_640737 ?auto_640745 ) ) ( not ( = ?auto_640737 ?auto_640746 ) ) ( not ( = ?auto_640738 ?auto_640739 ) ) ( not ( = ?auto_640738 ?auto_640740 ) ) ( not ( = ?auto_640738 ?auto_640741 ) ) ( not ( = ?auto_640738 ?auto_640742 ) ) ( not ( = ?auto_640738 ?auto_640743 ) ) ( not ( = ?auto_640738 ?auto_640744 ) ) ( not ( = ?auto_640738 ?auto_640745 ) ) ( not ( = ?auto_640738 ?auto_640746 ) ) ( not ( = ?auto_640739 ?auto_640740 ) ) ( not ( = ?auto_640739 ?auto_640741 ) ) ( not ( = ?auto_640739 ?auto_640742 ) ) ( not ( = ?auto_640739 ?auto_640743 ) ) ( not ( = ?auto_640739 ?auto_640744 ) ) ( not ( = ?auto_640739 ?auto_640745 ) ) ( not ( = ?auto_640739 ?auto_640746 ) ) ( not ( = ?auto_640740 ?auto_640741 ) ) ( not ( = ?auto_640740 ?auto_640742 ) ) ( not ( = ?auto_640740 ?auto_640743 ) ) ( not ( = ?auto_640740 ?auto_640744 ) ) ( not ( = ?auto_640740 ?auto_640745 ) ) ( not ( = ?auto_640740 ?auto_640746 ) ) ( not ( = ?auto_640741 ?auto_640742 ) ) ( not ( = ?auto_640741 ?auto_640743 ) ) ( not ( = ?auto_640741 ?auto_640744 ) ) ( not ( = ?auto_640741 ?auto_640745 ) ) ( not ( = ?auto_640741 ?auto_640746 ) ) ( not ( = ?auto_640742 ?auto_640743 ) ) ( not ( = ?auto_640742 ?auto_640744 ) ) ( not ( = ?auto_640742 ?auto_640745 ) ) ( not ( = ?auto_640742 ?auto_640746 ) ) ( not ( = ?auto_640743 ?auto_640744 ) ) ( not ( = ?auto_640743 ?auto_640745 ) ) ( not ( = ?auto_640743 ?auto_640746 ) ) ( not ( = ?auto_640744 ?auto_640745 ) ) ( not ( = ?auto_640744 ?auto_640746 ) ) ( not ( = ?auto_640745 ?auto_640746 ) ) ( ON ?auto_640744 ?auto_640745 ) ( ON ?auto_640743 ?auto_640744 ) ( ON ?auto_640742 ?auto_640743 ) ( ON ?auto_640741 ?auto_640742 ) ( CLEAR ?auto_640739 ) ( ON ?auto_640740 ?auto_640741 ) ( CLEAR ?auto_640740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_640730 ?auto_640731 ?auto_640732 ?auto_640733 ?auto_640734 ?auto_640735 ?auto_640736 ?auto_640737 ?auto_640738 ?auto_640739 ?auto_640740 )
      ( MAKE-16PILE ?auto_640730 ?auto_640731 ?auto_640732 ?auto_640733 ?auto_640734 ?auto_640735 ?auto_640736 ?auto_640737 ?auto_640738 ?auto_640739 ?auto_640740 ?auto_640741 ?auto_640742 ?auto_640743 ?auto_640744 ?auto_640745 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_640796 - BLOCK
      ?auto_640797 - BLOCK
      ?auto_640798 - BLOCK
      ?auto_640799 - BLOCK
      ?auto_640800 - BLOCK
      ?auto_640801 - BLOCK
      ?auto_640802 - BLOCK
      ?auto_640803 - BLOCK
      ?auto_640804 - BLOCK
      ?auto_640805 - BLOCK
      ?auto_640806 - BLOCK
      ?auto_640807 - BLOCK
      ?auto_640808 - BLOCK
      ?auto_640809 - BLOCK
      ?auto_640810 - BLOCK
      ?auto_640811 - BLOCK
    )
    :vars
    (
      ?auto_640812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_640811 ?auto_640812 ) ( ON-TABLE ?auto_640796 ) ( ON ?auto_640797 ?auto_640796 ) ( ON ?auto_640798 ?auto_640797 ) ( ON ?auto_640799 ?auto_640798 ) ( ON ?auto_640800 ?auto_640799 ) ( ON ?auto_640801 ?auto_640800 ) ( ON ?auto_640802 ?auto_640801 ) ( ON ?auto_640803 ?auto_640802 ) ( ON ?auto_640804 ?auto_640803 ) ( not ( = ?auto_640796 ?auto_640797 ) ) ( not ( = ?auto_640796 ?auto_640798 ) ) ( not ( = ?auto_640796 ?auto_640799 ) ) ( not ( = ?auto_640796 ?auto_640800 ) ) ( not ( = ?auto_640796 ?auto_640801 ) ) ( not ( = ?auto_640796 ?auto_640802 ) ) ( not ( = ?auto_640796 ?auto_640803 ) ) ( not ( = ?auto_640796 ?auto_640804 ) ) ( not ( = ?auto_640796 ?auto_640805 ) ) ( not ( = ?auto_640796 ?auto_640806 ) ) ( not ( = ?auto_640796 ?auto_640807 ) ) ( not ( = ?auto_640796 ?auto_640808 ) ) ( not ( = ?auto_640796 ?auto_640809 ) ) ( not ( = ?auto_640796 ?auto_640810 ) ) ( not ( = ?auto_640796 ?auto_640811 ) ) ( not ( = ?auto_640796 ?auto_640812 ) ) ( not ( = ?auto_640797 ?auto_640798 ) ) ( not ( = ?auto_640797 ?auto_640799 ) ) ( not ( = ?auto_640797 ?auto_640800 ) ) ( not ( = ?auto_640797 ?auto_640801 ) ) ( not ( = ?auto_640797 ?auto_640802 ) ) ( not ( = ?auto_640797 ?auto_640803 ) ) ( not ( = ?auto_640797 ?auto_640804 ) ) ( not ( = ?auto_640797 ?auto_640805 ) ) ( not ( = ?auto_640797 ?auto_640806 ) ) ( not ( = ?auto_640797 ?auto_640807 ) ) ( not ( = ?auto_640797 ?auto_640808 ) ) ( not ( = ?auto_640797 ?auto_640809 ) ) ( not ( = ?auto_640797 ?auto_640810 ) ) ( not ( = ?auto_640797 ?auto_640811 ) ) ( not ( = ?auto_640797 ?auto_640812 ) ) ( not ( = ?auto_640798 ?auto_640799 ) ) ( not ( = ?auto_640798 ?auto_640800 ) ) ( not ( = ?auto_640798 ?auto_640801 ) ) ( not ( = ?auto_640798 ?auto_640802 ) ) ( not ( = ?auto_640798 ?auto_640803 ) ) ( not ( = ?auto_640798 ?auto_640804 ) ) ( not ( = ?auto_640798 ?auto_640805 ) ) ( not ( = ?auto_640798 ?auto_640806 ) ) ( not ( = ?auto_640798 ?auto_640807 ) ) ( not ( = ?auto_640798 ?auto_640808 ) ) ( not ( = ?auto_640798 ?auto_640809 ) ) ( not ( = ?auto_640798 ?auto_640810 ) ) ( not ( = ?auto_640798 ?auto_640811 ) ) ( not ( = ?auto_640798 ?auto_640812 ) ) ( not ( = ?auto_640799 ?auto_640800 ) ) ( not ( = ?auto_640799 ?auto_640801 ) ) ( not ( = ?auto_640799 ?auto_640802 ) ) ( not ( = ?auto_640799 ?auto_640803 ) ) ( not ( = ?auto_640799 ?auto_640804 ) ) ( not ( = ?auto_640799 ?auto_640805 ) ) ( not ( = ?auto_640799 ?auto_640806 ) ) ( not ( = ?auto_640799 ?auto_640807 ) ) ( not ( = ?auto_640799 ?auto_640808 ) ) ( not ( = ?auto_640799 ?auto_640809 ) ) ( not ( = ?auto_640799 ?auto_640810 ) ) ( not ( = ?auto_640799 ?auto_640811 ) ) ( not ( = ?auto_640799 ?auto_640812 ) ) ( not ( = ?auto_640800 ?auto_640801 ) ) ( not ( = ?auto_640800 ?auto_640802 ) ) ( not ( = ?auto_640800 ?auto_640803 ) ) ( not ( = ?auto_640800 ?auto_640804 ) ) ( not ( = ?auto_640800 ?auto_640805 ) ) ( not ( = ?auto_640800 ?auto_640806 ) ) ( not ( = ?auto_640800 ?auto_640807 ) ) ( not ( = ?auto_640800 ?auto_640808 ) ) ( not ( = ?auto_640800 ?auto_640809 ) ) ( not ( = ?auto_640800 ?auto_640810 ) ) ( not ( = ?auto_640800 ?auto_640811 ) ) ( not ( = ?auto_640800 ?auto_640812 ) ) ( not ( = ?auto_640801 ?auto_640802 ) ) ( not ( = ?auto_640801 ?auto_640803 ) ) ( not ( = ?auto_640801 ?auto_640804 ) ) ( not ( = ?auto_640801 ?auto_640805 ) ) ( not ( = ?auto_640801 ?auto_640806 ) ) ( not ( = ?auto_640801 ?auto_640807 ) ) ( not ( = ?auto_640801 ?auto_640808 ) ) ( not ( = ?auto_640801 ?auto_640809 ) ) ( not ( = ?auto_640801 ?auto_640810 ) ) ( not ( = ?auto_640801 ?auto_640811 ) ) ( not ( = ?auto_640801 ?auto_640812 ) ) ( not ( = ?auto_640802 ?auto_640803 ) ) ( not ( = ?auto_640802 ?auto_640804 ) ) ( not ( = ?auto_640802 ?auto_640805 ) ) ( not ( = ?auto_640802 ?auto_640806 ) ) ( not ( = ?auto_640802 ?auto_640807 ) ) ( not ( = ?auto_640802 ?auto_640808 ) ) ( not ( = ?auto_640802 ?auto_640809 ) ) ( not ( = ?auto_640802 ?auto_640810 ) ) ( not ( = ?auto_640802 ?auto_640811 ) ) ( not ( = ?auto_640802 ?auto_640812 ) ) ( not ( = ?auto_640803 ?auto_640804 ) ) ( not ( = ?auto_640803 ?auto_640805 ) ) ( not ( = ?auto_640803 ?auto_640806 ) ) ( not ( = ?auto_640803 ?auto_640807 ) ) ( not ( = ?auto_640803 ?auto_640808 ) ) ( not ( = ?auto_640803 ?auto_640809 ) ) ( not ( = ?auto_640803 ?auto_640810 ) ) ( not ( = ?auto_640803 ?auto_640811 ) ) ( not ( = ?auto_640803 ?auto_640812 ) ) ( not ( = ?auto_640804 ?auto_640805 ) ) ( not ( = ?auto_640804 ?auto_640806 ) ) ( not ( = ?auto_640804 ?auto_640807 ) ) ( not ( = ?auto_640804 ?auto_640808 ) ) ( not ( = ?auto_640804 ?auto_640809 ) ) ( not ( = ?auto_640804 ?auto_640810 ) ) ( not ( = ?auto_640804 ?auto_640811 ) ) ( not ( = ?auto_640804 ?auto_640812 ) ) ( not ( = ?auto_640805 ?auto_640806 ) ) ( not ( = ?auto_640805 ?auto_640807 ) ) ( not ( = ?auto_640805 ?auto_640808 ) ) ( not ( = ?auto_640805 ?auto_640809 ) ) ( not ( = ?auto_640805 ?auto_640810 ) ) ( not ( = ?auto_640805 ?auto_640811 ) ) ( not ( = ?auto_640805 ?auto_640812 ) ) ( not ( = ?auto_640806 ?auto_640807 ) ) ( not ( = ?auto_640806 ?auto_640808 ) ) ( not ( = ?auto_640806 ?auto_640809 ) ) ( not ( = ?auto_640806 ?auto_640810 ) ) ( not ( = ?auto_640806 ?auto_640811 ) ) ( not ( = ?auto_640806 ?auto_640812 ) ) ( not ( = ?auto_640807 ?auto_640808 ) ) ( not ( = ?auto_640807 ?auto_640809 ) ) ( not ( = ?auto_640807 ?auto_640810 ) ) ( not ( = ?auto_640807 ?auto_640811 ) ) ( not ( = ?auto_640807 ?auto_640812 ) ) ( not ( = ?auto_640808 ?auto_640809 ) ) ( not ( = ?auto_640808 ?auto_640810 ) ) ( not ( = ?auto_640808 ?auto_640811 ) ) ( not ( = ?auto_640808 ?auto_640812 ) ) ( not ( = ?auto_640809 ?auto_640810 ) ) ( not ( = ?auto_640809 ?auto_640811 ) ) ( not ( = ?auto_640809 ?auto_640812 ) ) ( not ( = ?auto_640810 ?auto_640811 ) ) ( not ( = ?auto_640810 ?auto_640812 ) ) ( not ( = ?auto_640811 ?auto_640812 ) ) ( ON ?auto_640810 ?auto_640811 ) ( ON ?auto_640809 ?auto_640810 ) ( ON ?auto_640808 ?auto_640809 ) ( ON ?auto_640807 ?auto_640808 ) ( ON ?auto_640806 ?auto_640807 ) ( CLEAR ?auto_640804 ) ( ON ?auto_640805 ?auto_640806 ) ( CLEAR ?auto_640805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_640796 ?auto_640797 ?auto_640798 ?auto_640799 ?auto_640800 ?auto_640801 ?auto_640802 ?auto_640803 ?auto_640804 ?auto_640805 )
      ( MAKE-16PILE ?auto_640796 ?auto_640797 ?auto_640798 ?auto_640799 ?auto_640800 ?auto_640801 ?auto_640802 ?auto_640803 ?auto_640804 ?auto_640805 ?auto_640806 ?auto_640807 ?auto_640808 ?auto_640809 ?auto_640810 ?auto_640811 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_640862 - BLOCK
      ?auto_640863 - BLOCK
      ?auto_640864 - BLOCK
      ?auto_640865 - BLOCK
      ?auto_640866 - BLOCK
      ?auto_640867 - BLOCK
      ?auto_640868 - BLOCK
      ?auto_640869 - BLOCK
      ?auto_640870 - BLOCK
      ?auto_640871 - BLOCK
      ?auto_640872 - BLOCK
      ?auto_640873 - BLOCK
      ?auto_640874 - BLOCK
      ?auto_640875 - BLOCK
      ?auto_640876 - BLOCK
      ?auto_640877 - BLOCK
    )
    :vars
    (
      ?auto_640878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_640877 ?auto_640878 ) ( ON-TABLE ?auto_640862 ) ( ON ?auto_640863 ?auto_640862 ) ( ON ?auto_640864 ?auto_640863 ) ( ON ?auto_640865 ?auto_640864 ) ( ON ?auto_640866 ?auto_640865 ) ( ON ?auto_640867 ?auto_640866 ) ( ON ?auto_640868 ?auto_640867 ) ( ON ?auto_640869 ?auto_640868 ) ( not ( = ?auto_640862 ?auto_640863 ) ) ( not ( = ?auto_640862 ?auto_640864 ) ) ( not ( = ?auto_640862 ?auto_640865 ) ) ( not ( = ?auto_640862 ?auto_640866 ) ) ( not ( = ?auto_640862 ?auto_640867 ) ) ( not ( = ?auto_640862 ?auto_640868 ) ) ( not ( = ?auto_640862 ?auto_640869 ) ) ( not ( = ?auto_640862 ?auto_640870 ) ) ( not ( = ?auto_640862 ?auto_640871 ) ) ( not ( = ?auto_640862 ?auto_640872 ) ) ( not ( = ?auto_640862 ?auto_640873 ) ) ( not ( = ?auto_640862 ?auto_640874 ) ) ( not ( = ?auto_640862 ?auto_640875 ) ) ( not ( = ?auto_640862 ?auto_640876 ) ) ( not ( = ?auto_640862 ?auto_640877 ) ) ( not ( = ?auto_640862 ?auto_640878 ) ) ( not ( = ?auto_640863 ?auto_640864 ) ) ( not ( = ?auto_640863 ?auto_640865 ) ) ( not ( = ?auto_640863 ?auto_640866 ) ) ( not ( = ?auto_640863 ?auto_640867 ) ) ( not ( = ?auto_640863 ?auto_640868 ) ) ( not ( = ?auto_640863 ?auto_640869 ) ) ( not ( = ?auto_640863 ?auto_640870 ) ) ( not ( = ?auto_640863 ?auto_640871 ) ) ( not ( = ?auto_640863 ?auto_640872 ) ) ( not ( = ?auto_640863 ?auto_640873 ) ) ( not ( = ?auto_640863 ?auto_640874 ) ) ( not ( = ?auto_640863 ?auto_640875 ) ) ( not ( = ?auto_640863 ?auto_640876 ) ) ( not ( = ?auto_640863 ?auto_640877 ) ) ( not ( = ?auto_640863 ?auto_640878 ) ) ( not ( = ?auto_640864 ?auto_640865 ) ) ( not ( = ?auto_640864 ?auto_640866 ) ) ( not ( = ?auto_640864 ?auto_640867 ) ) ( not ( = ?auto_640864 ?auto_640868 ) ) ( not ( = ?auto_640864 ?auto_640869 ) ) ( not ( = ?auto_640864 ?auto_640870 ) ) ( not ( = ?auto_640864 ?auto_640871 ) ) ( not ( = ?auto_640864 ?auto_640872 ) ) ( not ( = ?auto_640864 ?auto_640873 ) ) ( not ( = ?auto_640864 ?auto_640874 ) ) ( not ( = ?auto_640864 ?auto_640875 ) ) ( not ( = ?auto_640864 ?auto_640876 ) ) ( not ( = ?auto_640864 ?auto_640877 ) ) ( not ( = ?auto_640864 ?auto_640878 ) ) ( not ( = ?auto_640865 ?auto_640866 ) ) ( not ( = ?auto_640865 ?auto_640867 ) ) ( not ( = ?auto_640865 ?auto_640868 ) ) ( not ( = ?auto_640865 ?auto_640869 ) ) ( not ( = ?auto_640865 ?auto_640870 ) ) ( not ( = ?auto_640865 ?auto_640871 ) ) ( not ( = ?auto_640865 ?auto_640872 ) ) ( not ( = ?auto_640865 ?auto_640873 ) ) ( not ( = ?auto_640865 ?auto_640874 ) ) ( not ( = ?auto_640865 ?auto_640875 ) ) ( not ( = ?auto_640865 ?auto_640876 ) ) ( not ( = ?auto_640865 ?auto_640877 ) ) ( not ( = ?auto_640865 ?auto_640878 ) ) ( not ( = ?auto_640866 ?auto_640867 ) ) ( not ( = ?auto_640866 ?auto_640868 ) ) ( not ( = ?auto_640866 ?auto_640869 ) ) ( not ( = ?auto_640866 ?auto_640870 ) ) ( not ( = ?auto_640866 ?auto_640871 ) ) ( not ( = ?auto_640866 ?auto_640872 ) ) ( not ( = ?auto_640866 ?auto_640873 ) ) ( not ( = ?auto_640866 ?auto_640874 ) ) ( not ( = ?auto_640866 ?auto_640875 ) ) ( not ( = ?auto_640866 ?auto_640876 ) ) ( not ( = ?auto_640866 ?auto_640877 ) ) ( not ( = ?auto_640866 ?auto_640878 ) ) ( not ( = ?auto_640867 ?auto_640868 ) ) ( not ( = ?auto_640867 ?auto_640869 ) ) ( not ( = ?auto_640867 ?auto_640870 ) ) ( not ( = ?auto_640867 ?auto_640871 ) ) ( not ( = ?auto_640867 ?auto_640872 ) ) ( not ( = ?auto_640867 ?auto_640873 ) ) ( not ( = ?auto_640867 ?auto_640874 ) ) ( not ( = ?auto_640867 ?auto_640875 ) ) ( not ( = ?auto_640867 ?auto_640876 ) ) ( not ( = ?auto_640867 ?auto_640877 ) ) ( not ( = ?auto_640867 ?auto_640878 ) ) ( not ( = ?auto_640868 ?auto_640869 ) ) ( not ( = ?auto_640868 ?auto_640870 ) ) ( not ( = ?auto_640868 ?auto_640871 ) ) ( not ( = ?auto_640868 ?auto_640872 ) ) ( not ( = ?auto_640868 ?auto_640873 ) ) ( not ( = ?auto_640868 ?auto_640874 ) ) ( not ( = ?auto_640868 ?auto_640875 ) ) ( not ( = ?auto_640868 ?auto_640876 ) ) ( not ( = ?auto_640868 ?auto_640877 ) ) ( not ( = ?auto_640868 ?auto_640878 ) ) ( not ( = ?auto_640869 ?auto_640870 ) ) ( not ( = ?auto_640869 ?auto_640871 ) ) ( not ( = ?auto_640869 ?auto_640872 ) ) ( not ( = ?auto_640869 ?auto_640873 ) ) ( not ( = ?auto_640869 ?auto_640874 ) ) ( not ( = ?auto_640869 ?auto_640875 ) ) ( not ( = ?auto_640869 ?auto_640876 ) ) ( not ( = ?auto_640869 ?auto_640877 ) ) ( not ( = ?auto_640869 ?auto_640878 ) ) ( not ( = ?auto_640870 ?auto_640871 ) ) ( not ( = ?auto_640870 ?auto_640872 ) ) ( not ( = ?auto_640870 ?auto_640873 ) ) ( not ( = ?auto_640870 ?auto_640874 ) ) ( not ( = ?auto_640870 ?auto_640875 ) ) ( not ( = ?auto_640870 ?auto_640876 ) ) ( not ( = ?auto_640870 ?auto_640877 ) ) ( not ( = ?auto_640870 ?auto_640878 ) ) ( not ( = ?auto_640871 ?auto_640872 ) ) ( not ( = ?auto_640871 ?auto_640873 ) ) ( not ( = ?auto_640871 ?auto_640874 ) ) ( not ( = ?auto_640871 ?auto_640875 ) ) ( not ( = ?auto_640871 ?auto_640876 ) ) ( not ( = ?auto_640871 ?auto_640877 ) ) ( not ( = ?auto_640871 ?auto_640878 ) ) ( not ( = ?auto_640872 ?auto_640873 ) ) ( not ( = ?auto_640872 ?auto_640874 ) ) ( not ( = ?auto_640872 ?auto_640875 ) ) ( not ( = ?auto_640872 ?auto_640876 ) ) ( not ( = ?auto_640872 ?auto_640877 ) ) ( not ( = ?auto_640872 ?auto_640878 ) ) ( not ( = ?auto_640873 ?auto_640874 ) ) ( not ( = ?auto_640873 ?auto_640875 ) ) ( not ( = ?auto_640873 ?auto_640876 ) ) ( not ( = ?auto_640873 ?auto_640877 ) ) ( not ( = ?auto_640873 ?auto_640878 ) ) ( not ( = ?auto_640874 ?auto_640875 ) ) ( not ( = ?auto_640874 ?auto_640876 ) ) ( not ( = ?auto_640874 ?auto_640877 ) ) ( not ( = ?auto_640874 ?auto_640878 ) ) ( not ( = ?auto_640875 ?auto_640876 ) ) ( not ( = ?auto_640875 ?auto_640877 ) ) ( not ( = ?auto_640875 ?auto_640878 ) ) ( not ( = ?auto_640876 ?auto_640877 ) ) ( not ( = ?auto_640876 ?auto_640878 ) ) ( not ( = ?auto_640877 ?auto_640878 ) ) ( ON ?auto_640876 ?auto_640877 ) ( ON ?auto_640875 ?auto_640876 ) ( ON ?auto_640874 ?auto_640875 ) ( ON ?auto_640873 ?auto_640874 ) ( ON ?auto_640872 ?auto_640873 ) ( ON ?auto_640871 ?auto_640872 ) ( CLEAR ?auto_640869 ) ( ON ?auto_640870 ?auto_640871 ) ( CLEAR ?auto_640870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_640862 ?auto_640863 ?auto_640864 ?auto_640865 ?auto_640866 ?auto_640867 ?auto_640868 ?auto_640869 ?auto_640870 )
      ( MAKE-16PILE ?auto_640862 ?auto_640863 ?auto_640864 ?auto_640865 ?auto_640866 ?auto_640867 ?auto_640868 ?auto_640869 ?auto_640870 ?auto_640871 ?auto_640872 ?auto_640873 ?auto_640874 ?auto_640875 ?auto_640876 ?auto_640877 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_640928 - BLOCK
      ?auto_640929 - BLOCK
      ?auto_640930 - BLOCK
      ?auto_640931 - BLOCK
      ?auto_640932 - BLOCK
      ?auto_640933 - BLOCK
      ?auto_640934 - BLOCK
      ?auto_640935 - BLOCK
      ?auto_640936 - BLOCK
      ?auto_640937 - BLOCK
      ?auto_640938 - BLOCK
      ?auto_640939 - BLOCK
      ?auto_640940 - BLOCK
      ?auto_640941 - BLOCK
      ?auto_640942 - BLOCK
      ?auto_640943 - BLOCK
    )
    :vars
    (
      ?auto_640944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_640943 ?auto_640944 ) ( ON-TABLE ?auto_640928 ) ( ON ?auto_640929 ?auto_640928 ) ( ON ?auto_640930 ?auto_640929 ) ( ON ?auto_640931 ?auto_640930 ) ( ON ?auto_640932 ?auto_640931 ) ( ON ?auto_640933 ?auto_640932 ) ( ON ?auto_640934 ?auto_640933 ) ( not ( = ?auto_640928 ?auto_640929 ) ) ( not ( = ?auto_640928 ?auto_640930 ) ) ( not ( = ?auto_640928 ?auto_640931 ) ) ( not ( = ?auto_640928 ?auto_640932 ) ) ( not ( = ?auto_640928 ?auto_640933 ) ) ( not ( = ?auto_640928 ?auto_640934 ) ) ( not ( = ?auto_640928 ?auto_640935 ) ) ( not ( = ?auto_640928 ?auto_640936 ) ) ( not ( = ?auto_640928 ?auto_640937 ) ) ( not ( = ?auto_640928 ?auto_640938 ) ) ( not ( = ?auto_640928 ?auto_640939 ) ) ( not ( = ?auto_640928 ?auto_640940 ) ) ( not ( = ?auto_640928 ?auto_640941 ) ) ( not ( = ?auto_640928 ?auto_640942 ) ) ( not ( = ?auto_640928 ?auto_640943 ) ) ( not ( = ?auto_640928 ?auto_640944 ) ) ( not ( = ?auto_640929 ?auto_640930 ) ) ( not ( = ?auto_640929 ?auto_640931 ) ) ( not ( = ?auto_640929 ?auto_640932 ) ) ( not ( = ?auto_640929 ?auto_640933 ) ) ( not ( = ?auto_640929 ?auto_640934 ) ) ( not ( = ?auto_640929 ?auto_640935 ) ) ( not ( = ?auto_640929 ?auto_640936 ) ) ( not ( = ?auto_640929 ?auto_640937 ) ) ( not ( = ?auto_640929 ?auto_640938 ) ) ( not ( = ?auto_640929 ?auto_640939 ) ) ( not ( = ?auto_640929 ?auto_640940 ) ) ( not ( = ?auto_640929 ?auto_640941 ) ) ( not ( = ?auto_640929 ?auto_640942 ) ) ( not ( = ?auto_640929 ?auto_640943 ) ) ( not ( = ?auto_640929 ?auto_640944 ) ) ( not ( = ?auto_640930 ?auto_640931 ) ) ( not ( = ?auto_640930 ?auto_640932 ) ) ( not ( = ?auto_640930 ?auto_640933 ) ) ( not ( = ?auto_640930 ?auto_640934 ) ) ( not ( = ?auto_640930 ?auto_640935 ) ) ( not ( = ?auto_640930 ?auto_640936 ) ) ( not ( = ?auto_640930 ?auto_640937 ) ) ( not ( = ?auto_640930 ?auto_640938 ) ) ( not ( = ?auto_640930 ?auto_640939 ) ) ( not ( = ?auto_640930 ?auto_640940 ) ) ( not ( = ?auto_640930 ?auto_640941 ) ) ( not ( = ?auto_640930 ?auto_640942 ) ) ( not ( = ?auto_640930 ?auto_640943 ) ) ( not ( = ?auto_640930 ?auto_640944 ) ) ( not ( = ?auto_640931 ?auto_640932 ) ) ( not ( = ?auto_640931 ?auto_640933 ) ) ( not ( = ?auto_640931 ?auto_640934 ) ) ( not ( = ?auto_640931 ?auto_640935 ) ) ( not ( = ?auto_640931 ?auto_640936 ) ) ( not ( = ?auto_640931 ?auto_640937 ) ) ( not ( = ?auto_640931 ?auto_640938 ) ) ( not ( = ?auto_640931 ?auto_640939 ) ) ( not ( = ?auto_640931 ?auto_640940 ) ) ( not ( = ?auto_640931 ?auto_640941 ) ) ( not ( = ?auto_640931 ?auto_640942 ) ) ( not ( = ?auto_640931 ?auto_640943 ) ) ( not ( = ?auto_640931 ?auto_640944 ) ) ( not ( = ?auto_640932 ?auto_640933 ) ) ( not ( = ?auto_640932 ?auto_640934 ) ) ( not ( = ?auto_640932 ?auto_640935 ) ) ( not ( = ?auto_640932 ?auto_640936 ) ) ( not ( = ?auto_640932 ?auto_640937 ) ) ( not ( = ?auto_640932 ?auto_640938 ) ) ( not ( = ?auto_640932 ?auto_640939 ) ) ( not ( = ?auto_640932 ?auto_640940 ) ) ( not ( = ?auto_640932 ?auto_640941 ) ) ( not ( = ?auto_640932 ?auto_640942 ) ) ( not ( = ?auto_640932 ?auto_640943 ) ) ( not ( = ?auto_640932 ?auto_640944 ) ) ( not ( = ?auto_640933 ?auto_640934 ) ) ( not ( = ?auto_640933 ?auto_640935 ) ) ( not ( = ?auto_640933 ?auto_640936 ) ) ( not ( = ?auto_640933 ?auto_640937 ) ) ( not ( = ?auto_640933 ?auto_640938 ) ) ( not ( = ?auto_640933 ?auto_640939 ) ) ( not ( = ?auto_640933 ?auto_640940 ) ) ( not ( = ?auto_640933 ?auto_640941 ) ) ( not ( = ?auto_640933 ?auto_640942 ) ) ( not ( = ?auto_640933 ?auto_640943 ) ) ( not ( = ?auto_640933 ?auto_640944 ) ) ( not ( = ?auto_640934 ?auto_640935 ) ) ( not ( = ?auto_640934 ?auto_640936 ) ) ( not ( = ?auto_640934 ?auto_640937 ) ) ( not ( = ?auto_640934 ?auto_640938 ) ) ( not ( = ?auto_640934 ?auto_640939 ) ) ( not ( = ?auto_640934 ?auto_640940 ) ) ( not ( = ?auto_640934 ?auto_640941 ) ) ( not ( = ?auto_640934 ?auto_640942 ) ) ( not ( = ?auto_640934 ?auto_640943 ) ) ( not ( = ?auto_640934 ?auto_640944 ) ) ( not ( = ?auto_640935 ?auto_640936 ) ) ( not ( = ?auto_640935 ?auto_640937 ) ) ( not ( = ?auto_640935 ?auto_640938 ) ) ( not ( = ?auto_640935 ?auto_640939 ) ) ( not ( = ?auto_640935 ?auto_640940 ) ) ( not ( = ?auto_640935 ?auto_640941 ) ) ( not ( = ?auto_640935 ?auto_640942 ) ) ( not ( = ?auto_640935 ?auto_640943 ) ) ( not ( = ?auto_640935 ?auto_640944 ) ) ( not ( = ?auto_640936 ?auto_640937 ) ) ( not ( = ?auto_640936 ?auto_640938 ) ) ( not ( = ?auto_640936 ?auto_640939 ) ) ( not ( = ?auto_640936 ?auto_640940 ) ) ( not ( = ?auto_640936 ?auto_640941 ) ) ( not ( = ?auto_640936 ?auto_640942 ) ) ( not ( = ?auto_640936 ?auto_640943 ) ) ( not ( = ?auto_640936 ?auto_640944 ) ) ( not ( = ?auto_640937 ?auto_640938 ) ) ( not ( = ?auto_640937 ?auto_640939 ) ) ( not ( = ?auto_640937 ?auto_640940 ) ) ( not ( = ?auto_640937 ?auto_640941 ) ) ( not ( = ?auto_640937 ?auto_640942 ) ) ( not ( = ?auto_640937 ?auto_640943 ) ) ( not ( = ?auto_640937 ?auto_640944 ) ) ( not ( = ?auto_640938 ?auto_640939 ) ) ( not ( = ?auto_640938 ?auto_640940 ) ) ( not ( = ?auto_640938 ?auto_640941 ) ) ( not ( = ?auto_640938 ?auto_640942 ) ) ( not ( = ?auto_640938 ?auto_640943 ) ) ( not ( = ?auto_640938 ?auto_640944 ) ) ( not ( = ?auto_640939 ?auto_640940 ) ) ( not ( = ?auto_640939 ?auto_640941 ) ) ( not ( = ?auto_640939 ?auto_640942 ) ) ( not ( = ?auto_640939 ?auto_640943 ) ) ( not ( = ?auto_640939 ?auto_640944 ) ) ( not ( = ?auto_640940 ?auto_640941 ) ) ( not ( = ?auto_640940 ?auto_640942 ) ) ( not ( = ?auto_640940 ?auto_640943 ) ) ( not ( = ?auto_640940 ?auto_640944 ) ) ( not ( = ?auto_640941 ?auto_640942 ) ) ( not ( = ?auto_640941 ?auto_640943 ) ) ( not ( = ?auto_640941 ?auto_640944 ) ) ( not ( = ?auto_640942 ?auto_640943 ) ) ( not ( = ?auto_640942 ?auto_640944 ) ) ( not ( = ?auto_640943 ?auto_640944 ) ) ( ON ?auto_640942 ?auto_640943 ) ( ON ?auto_640941 ?auto_640942 ) ( ON ?auto_640940 ?auto_640941 ) ( ON ?auto_640939 ?auto_640940 ) ( ON ?auto_640938 ?auto_640939 ) ( ON ?auto_640937 ?auto_640938 ) ( ON ?auto_640936 ?auto_640937 ) ( CLEAR ?auto_640934 ) ( ON ?auto_640935 ?auto_640936 ) ( CLEAR ?auto_640935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_640928 ?auto_640929 ?auto_640930 ?auto_640931 ?auto_640932 ?auto_640933 ?auto_640934 ?auto_640935 )
      ( MAKE-16PILE ?auto_640928 ?auto_640929 ?auto_640930 ?auto_640931 ?auto_640932 ?auto_640933 ?auto_640934 ?auto_640935 ?auto_640936 ?auto_640937 ?auto_640938 ?auto_640939 ?auto_640940 ?auto_640941 ?auto_640942 ?auto_640943 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_640994 - BLOCK
      ?auto_640995 - BLOCK
      ?auto_640996 - BLOCK
      ?auto_640997 - BLOCK
      ?auto_640998 - BLOCK
      ?auto_640999 - BLOCK
      ?auto_641000 - BLOCK
      ?auto_641001 - BLOCK
      ?auto_641002 - BLOCK
      ?auto_641003 - BLOCK
      ?auto_641004 - BLOCK
      ?auto_641005 - BLOCK
      ?auto_641006 - BLOCK
      ?auto_641007 - BLOCK
      ?auto_641008 - BLOCK
      ?auto_641009 - BLOCK
    )
    :vars
    (
      ?auto_641010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_641009 ?auto_641010 ) ( ON-TABLE ?auto_640994 ) ( ON ?auto_640995 ?auto_640994 ) ( ON ?auto_640996 ?auto_640995 ) ( ON ?auto_640997 ?auto_640996 ) ( ON ?auto_640998 ?auto_640997 ) ( ON ?auto_640999 ?auto_640998 ) ( not ( = ?auto_640994 ?auto_640995 ) ) ( not ( = ?auto_640994 ?auto_640996 ) ) ( not ( = ?auto_640994 ?auto_640997 ) ) ( not ( = ?auto_640994 ?auto_640998 ) ) ( not ( = ?auto_640994 ?auto_640999 ) ) ( not ( = ?auto_640994 ?auto_641000 ) ) ( not ( = ?auto_640994 ?auto_641001 ) ) ( not ( = ?auto_640994 ?auto_641002 ) ) ( not ( = ?auto_640994 ?auto_641003 ) ) ( not ( = ?auto_640994 ?auto_641004 ) ) ( not ( = ?auto_640994 ?auto_641005 ) ) ( not ( = ?auto_640994 ?auto_641006 ) ) ( not ( = ?auto_640994 ?auto_641007 ) ) ( not ( = ?auto_640994 ?auto_641008 ) ) ( not ( = ?auto_640994 ?auto_641009 ) ) ( not ( = ?auto_640994 ?auto_641010 ) ) ( not ( = ?auto_640995 ?auto_640996 ) ) ( not ( = ?auto_640995 ?auto_640997 ) ) ( not ( = ?auto_640995 ?auto_640998 ) ) ( not ( = ?auto_640995 ?auto_640999 ) ) ( not ( = ?auto_640995 ?auto_641000 ) ) ( not ( = ?auto_640995 ?auto_641001 ) ) ( not ( = ?auto_640995 ?auto_641002 ) ) ( not ( = ?auto_640995 ?auto_641003 ) ) ( not ( = ?auto_640995 ?auto_641004 ) ) ( not ( = ?auto_640995 ?auto_641005 ) ) ( not ( = ?auto_640995 ?auto_641006 ) ) ( not ( = ?auto_640995 ?auto_641007 ) ) ( not ( = ?auto_640995 ?auto_641008 ) ) ( not ( = ?auto_640995 ?auto_641009 ) ) ( not ( = ?auto_640995 ?auto_641010 ) ) ( not ( = ?auto_640996 ?auto_640997 ) ) ( not ( = ?auto_640996 ?auto_640998 ) ) ( not ( = ?auto_640996 ?auto_640999 ) ) ( not ( = ?auto_640996 ?auto_641000 ) ) ( not ( = ?auto_640996 ?auto_641001 ) ) ( not ( = ?auto_640996 ?auto_641002 ) ) ( not ( = ?auto_640996 ?auto_641003 ) ) ( not ( = ?auto_640996 ?auto_641004 ) ) ( not ( = ?auto_640996 ?auto_641005 ) ) ( not ( = ?auto_640996 ?auto_641006 ) ) ( not ( = ?auto_640996 ?auto_641007 ) ) ( not ( = ?auto_640996 ?auto_641008 ) ) ( not ( = ?auto_640996 ?auto_641009 ) ) ( not ( = ?auto_640996 ?auto_641010 ) ) ( not ( = ?auto_640997 ?auto_640998 ) ) ( not ( = ?auto_640997 ?auto_640999 ) ) ( not ( = ?auto_640997 ?auto_641000 ) ) ( not ( = ?auto_640997 ?auto_641001 ) ) ( not ( = ?auto_640997 ?auto_641002 ) ) ( not ( = ?auto_640997 ?auto_641003 ) ) ( not ( = ?auto_640997 ?auto_641004 ) ) ( not ( = ?auto_640997 ?auto_641005 ) ) ( not ( = ?auto_640997 ?auto_641006 ) ) ( not ( = ?auto_640997 ?auto_641007 ) ) ( not ( = ?auto_640997 ?auto_641008 ) ) ( not ( = ?auto_640997 ?auto_641009 ) ) ( not ( = ?auto_640997 ?auto_641010 ) ) ( not ( = ?auto_640998 ?auto_640999 ) ) ( not ( = ?auto_640998 ?auto_641000 ) ) ( not ( = ?auto_640998 ?auto_641001 ) ) ( not ( = ?auto_640998 ?auto_641002 ) ) ( not ( = ?auto_640998 ?auto_641003 ) ) ( not ( = ?auto_640998 ?auto_641004 ) ) ( not ( = ?auto_640998 ?auto_641005 ) ) ( not ( = ?auto_640998 ?auto_641006 ) ) ( not ( = ?auto_640998 ?auto_641007 ) ) ( not ( = ?auto_640998 ?auto_641008 ) ) ( not ( = ?auto_640998 ?auto_641009 ) ) ( not ( = ?auto_640998 ?auto_641010 ) ) ( not ( = ?auto_640999 ?auto_641000 ) ) ( not ( = ?auto_640999 ?auto_641001 ) ) ( not ( = ?auto_640999 ?auto_641002 ) ) ( not ( = ?auto_640999 ?auto_641003 ) ) ( not ( = ?auto_640999 ?auto_641004 ) ) ( not ( = ?auto_640999 ?auto_641005 ) ) ( not ( = ?auto_640999 ?auto_641006 ) ) ( not ( = ?auto_640999 ?auto_641007 ) ) ( not ( = ?auto_640999 ?auto_641008 ) ) ( not ( = ?auto_640999 ?auto_641009 ) ) ( not ( = ?auto_640999 ?auto_641010 ) ) ( not ( = ?auto_641000 ?auto_641001 ) ) ( not ( = ?auto_641000 ?auto_641002 ) ) ( not ( = ?auto_641000 ?auto_641003 ) ) ( not ( = ?auto_641000 ?auto_641004 ) ) ( not ( = ?auto_641000 ?auto_641005 ) ) ( not ( = ?auto_641000 ?auto_641006 ) ) ( not ( = ?auto_641000 ?auto_641007 ) ) ( not ( = ?auto_641000 ?auto_641008 ) ) ( not ( = ?auto_641000 ?auto_641009 ) ) ( not ( = ?auto_641000 ?auto_641010 ) ) ( not ( = ?auto_641001 ?auto_641002 ) ) ( not ( = ?auto_641001 ?auto_641003 ) ) ( not ( = ?auto_641001 ?auto_641004 ) ) ( not ( = ?auto_641001 ?auto_641005 ) ) ( not ( = ?auto_641001 ?auto_641006 ) ) ( not ( = ?auto_641001 ?auto_641007 ) ) ( not ( = ?auto_641001 ?auto_641008 ) ) ( not ( = ?auto_641001 ?auto_641009 ) ) ( not ( = ?auto_641001 ?auto_641010 ) ) ( not ( = ?auto_641002 ?auto_641003 ) ) ( not ( = ?auto_641002 ?auto_641004 ) ) ( not ( = ?auto_641002 ?auto_641005 ) ) ( not ( = ?auto_641002 ?auto_641006 ) ) ( not ( = ?auto_641002 ?auto_641007 ) ) ( not ( = ?auto_641002 ?auto_641008 ) ) ( not ( = ?auto_641002 ?auto_641009 ) ) ( not ( = ?auto_641002 ?auto_641010 ) ) ( not ( = ?auto_641003 ?auto_641004 ) ) ( not ( = ?auto_641003 ?auto_641005 ) ) ( not ( = ?auto_641003 ?auto_641006 ) ) ( not ( = ?auto_641003 ?auto_641007 ) ) ( not ( = ?auto_641003 ?auto_641008 ) ) ( not ( = ?auto_641003 ?auto_641009 ) ) ( not ( = ?auto_641003 ?auto_641010 ) ) ( not ( = ?auto_641004 ?auto_641005 ) ) ( not ( = ?auto_641004 ?auto_641006 ) ) ( not ( = ?auto_641004 ?auto_641007 ) ) ( not ( = ?auto_641004 ?auto_641008 ) ) ( not ( = ?auto_641004 ?auto_641009 ) ) ( not ( = ?auto_641004 ?auto_641010 ) ) ( not ( = ?auto_641005 ?auto_641006 ) ) ( not ( = ?auto_641005 ?auto_641007 ) ) ( not ( = ?auto_641005 ?auto_641008 ) ) ( not ( = ?auto_641005 ?auto_641009 ) ) ( not ( = ?auto_641005 ?auto_641010 ) ) ( not ( = ?auto_641006 ?auto_641007 ) ) ( not ( = ?auto_641006 ?auto_641008 ) ) ( not ( = ?auto_641006 ?auto_641009 ) ) ( not ( = ?auto_641006 ?auto_641010 ) ) ( not ( = ?auto_641007 ?auto_641008 ) ) ( not ( = ?auto_641007 ?auto_641009 ) ) ( not ( = ?auto_641007 ?auto_641010 ) ) ( not ( = ?auto_641008 ?auto_641009 ) ) ( not ( = ?auto_641008 ?auto_641010 ) ) ( not ( = ?auto_641009 ?auto_641010 ) ) ( ON ?auto_641008 ?auto_641009 ) ( ON ?auto_641007 ?auto_641008 ) ( ON ?auto_641006 ?auto_641007 ) ( ON ?auto_641005 ?auto_641006 ) ( ON ?auto_641004 ?auto_641005 ) ( ON ?auto_641003 ?auto_641004 ) ( ON ?auto_641002 ?auto_641003 ) ( ON ?auto_641001 ?auto_641002 ) ( CLEAR ?auto_640999 ) ( ON ?auto_641000 ?auto_641001 ) ( CLEAR ?auto_641000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_640994 ?auto_640995 ?auto_640996 ?auto_640997 ?auto_640998 ?auto_640999 ?auto_641000 )
      ( MAKE-16PILE ?auto_640994 ?auto_640995 ?auto_640996 ?auto_640997 ?auto_640998 ?auto_640999 ?auto_641000 ?auto_641001 ?auto_641002 ?auto_641003 ?auto_641004 ?auto_641005 ?auto_641006 ?auto_641007 ?auto_641008 ?auto_641009 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_641060 - BLOCK
      ?auto_641061 - BLOCK
      ?auto_641062 - BLOCK
      ?auto_641063 - BLOCK
      ?auto_641064 - BLOCK
      ?auto_641065 - BLOCK
      ?auto_641066 - BLOCK
      ?auto_641067 - BLOCK
      ?auto_641068 - BLOCK
      ?auto_641069 - BLOCK
      ?auto_641070 - BLOCK
      ?auto_641071 - BLOCK
      ?auto_641072 - BLOCK
      ?auto_641073 - BLOCK
      ?auto_641074 - BLOCK
      ?auto_641075 - BLOCK
    )
    :vars
    (
      ?auto_641076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_641075 ?auto_641076 ) ( ON-TABLE ?auto_641060 ) ( ON ?auto_641061 ?auto_641060 ) ( ON ?auto_641062 ?auto_641061 ) ( ON ?auto_641063 ?auto_641062 ) ( ON ?auto_641064 ?auto_641063 ) ( not ( = ?auto_641060 ?auto_641061 ) ) ( not ( = ?auto_641060 ?auto_641062 ) ) ( not ( = ?auto_641060 ?auto_641063 ) ) ( not ( = ?auto_641060 ?auto_641064 ) ) ( not ( = ?auto_641060 ?auto_641065 ) ) ( not ( = ?auto_641060 ?auto_641066 ) ) ( not ( = ?auto_641060 ?auto_641067 ) ) ( not ( = ?auto_641060 ?auto_641068 ) ) ( not ( = ?auto_641060 ?auto_641069 ) ) ( not ( = ?auto_641060 ?auto_641070 ) ) ( not ( = ?auto_641060 ?auto_641071 ) ) ( not ( = ?auto_641060 ?auto_641072 ) ) ( not ( = ?auto_641060 ?auto_641073 ) ) ( not ( = ?auto_641060 ?auto_641074 ) ) ( not ( = ?auto_641060 ?auto_641075 ) ) ( not ( = ?auto_641060 ?auto_641076 ) ) ( not ( = ?auto_641061 ?auto_641062 ) ) ( not ( = ?auto_641061 ?auto_641063 ) ) ( not ( = ?auto_641061 ?auto_641064 ) ) ( not ( = ?auto_641061 ?auto_641065 ) ) ( not ( = ?auto_641061 ?auto_641066 ) ) ( not ( = ?auto_641061 ?auto_641067 ) ) ( not ( = ?auto_641061 ?auto_641068 ) ) ( not ( = ?auto_641061 ?auto_641069 ) ) ( not ( = ?auto_641061 ?auto_641070 ) ) ( not ( = ?auto_641061 ?auto_641071 ) ) ( not ( = ?auto_641061 ?auto_641072 ) ) ( not ( = ?auto_641061 ?auto_641073 ) ) ( not ( = ?auto_641061 ?auto_641074 ) ) ( not ( = ?auto_641061 ?auto_641075 ) ) ( not ( = ?auto_641061 ?auto_641076 ) ) ( not ( = ?auto_641062 ?auto_641063 ) ) ( not ( = ?auto_641062 ?auto_641064 ) ) ( not ( = ?auto_641062 ?auto_641065 ) ) ( not ( = ?auto_641062 ?auto_641066 ) ) ( not ( = ?auto_641062 ?auto_641067 ) ) ( not ( = ?auto_641062 ?auto_641068 ) ) ( not ( = ?auto_641062 ?auto_641069 ) ) ( not ( = ?auto_641062 ?auto_641070 ) ) ( not ( = ?auto_641062 ?auto_641071 ) ) ( not ( = ?auto_641062 ?auto_641072 ) ) ( not ( = ?auto_641062 ?auto_641073 ) ) ( not ( = ?auto_641062 ?auto_641074 ) ) ( not ( = ?auto_641062 ?auto_641075 ) ) ( not ( = ?auto_641062 ?auto_641076 ) ) ( not ( = ?auto_641063 ?auto_641064 ) ) ( not ( = ?auto_641063 ?auto_641065 ) ) ( not ( = ?auto_641063 ?auto_641066 ) ) ( not ( = ?auto_641063 ?auto_641067 ) ) ( not ( = ?auto_641063 ?auto_641068 ) ) ( not ( = ?auto_641063 ?auto_641069 ) ) ( not ( = ?auto_641063 ?auto_641070 ) ) ( not ( = ?auto_641063 ?auto_641071 ) ) ( not ( = ?auto_641063 ?auto_641072 ) ) ( not ( = ?auto_641063 ?auto_641073 ) ) ( not ( = ?auto_641063 ?auto_641074 ) ) ( not ( = ?auto_641063 ?auto_641075 ) ) ( not ( = ?auto_641063 ?auto_641076 ) ) ( not ( = ?auto_641064 ?auto_641065 ) ) ( not ( = ?auto_641064 ?auto_641066 ) ) ( not ( = ?auto_641064 ?auto_641067 ) ) ( not ( = ?auto_641064 ?auto_641068 ) ) ( not ( = ?auto_641064 ?auto_641069 ) ) ( not ( = ?auto_641064 ?auto_641070 ) ) ( not ( = ?auto_641064 ?auto_641071 ) ) ( not ( = ?auto_641064 ?auto_641072 ) ) ( not ( = ?auto_641064 ?auto_641073 ) ) ( not ( = ?auto_641064 ?auto_641074 ) ) ( not ( = ?auto_641064 ?auto_641075 ) ) ( not ( = ?auto_641064 ?auto_641076 ) ) ( not ( = ?auto_641065 ?auto_641066 ) ) ( not ( = ?auto_641065 ?auto_641067 ) ) ( not ( = ?auto_641065 ?auto_641068 ) ) ( not ( = ?auto_641065 ?auto_641069 ) ) ( not ( = ?auto_641065 ?auto_641070 ) ) ( not ( = ?auto_641065 ?auto_641071 ) ) ( not ( = ?auto_641065 ?auto_641072 ) ) ( not ( = ?auto_641065 ?auto_641073 ) ) ( not ( = ?auto_641065 ?auto_641074 ) ) ( not ( = ?auto_641065 ?auto_641075 ) ) ( not ( = ?auto_641065 ?auto_641076 ) ) ( not ( = ?auto_641066 ?auto_641067 ) ) ( not ( = ?auto_641066 ?auto_641068 ) ) ( not ( = ?auto_641066 ?auto_641069 ) ) ( not ( = ?auto_641066 ?auto_641070 ) ) ( not ( = ?auto_641066 ?auto_641071 ) ) ( not ( = ?auto_641066 ?auto_641072 ) ) ( not ( = ?auto_641066 ?auto_641073 ) ) ( not ( = ?auto_641066 ?auto_641074 ) ) ( not ( = ?auto_641066 ?auto_641075 ) ) ( not ( = ?auto_641066 ?auto_641076 ) ) ( not ( = ?auto_641067 ?auto_641068 ) ) ( not ( = ?auto_641067 ?auto_641069 ) ) ( not ( = ?auto_641067 ?auto_641070 ) ) ( not ( = ?auto_641067 ?auto_641071 ) ) ( not ( = ?auto_641067 ?auto_641072 ) ) ( not ( = ?auto_641067 ?auto_641073 ) ) ( not ( = ?auto_641067 ?auto_641074 ) ) ( not ( = ?auto_641067 ?auto_641075 ) ) ( not ( = ?auto_641067 ?auto_641076 ) ) ( not ( = ?auto_641068 ?auto_641069 ) ) ( not ( = ?auto_641068 ?auto_641070 ) ) ( not ( = ?auto_641068 ?auto_641071 ) ) ( not ( = ?auto_641068 ?auto_641072 ) ) ( not ( = ?auto_641068 ?auto_641073 ) ) ( not ( = ?auto_641068 ?auto_641074 ) ) ( not ( = ?auto_641068 ?auto_641075 ) ) ( not ( = ?auto_641068 ?auto_641076 ) ) ( not ( = ?auto_641069 ?auto_641070 ) ) ( not ( = ?auto_641069 ?auto_641071 ) ) ( not ( = ?auto_641069 ?auto_641072 ) ) ( not ( = ?auto_641069 ?auto_641073 ) ) ( not ( = ?auto_641069 ?auto_641074 ) ) ( not ( = ?auto_641069 ?auto_641075 ) ) ( not ( = ?auto_641069 ?auto_641076 ) ) ( not ( = ?auto_641070 ?auto_641071 ) ) ( not ( = ?auto_641070 ?auto_641072 ) ) ( not ( = ?auto_641070 ?auto_641073 ) ) ( not ( = ?auto_641070 ?auto_641074 ) ) ( not ( = ?auto_641070 ?auto_641075 ) ) ( not ( = ?auto_641070 ?auto_641076 ) ) ( not ( = ?auto_641071 ?auto_641072 ) ) ( not ( = ?auto_641071 ?auto_641073 ) ) ( not ( = ?auto_641071 ?auto_641074 ) ) ( not ( = ?auto_641071 ?auto_641075 ) ) ( not ( = ?auto_641071 ?auto_641076 ) ) ( not ( = ?auto_641072 ?auto_641073 ) ) ( not ( = ?auto_641072 ?auto_641074 ) ) ( not ( = ?auto_641072 ?auto_641075 ) ) ( not ( = ?auto_641072 ?auto_641076 ) ) ( not ( = ?auto_641073 ?auto_641074 ) ) ( not ( = ?auto_641073 ?auto_641075 ) ) ( not ( = ?auto_641073 ?auto_641076 ) ) ( not ( = ?auto_641074 ?auto_641075 ) ) ( not ( = ?auto_641074 ?auto_641076 ) ) ( not ( = ?auto_641075 ?auto_641076 ) ) ( ON ?auto_641074 ?auto_641075 ) ( ON ?auto_641073 ?auto_641074 ) ( ON ?auto_641072 ?auto_641073 ) ( ON ?auto_641071 ?auto_641072 ) ( ON ?auto_641070 ?auto_641071 ) ( ON ?auto_641069 ?auto_641070 ) ( ON ?auto_641068 ?auto_641069 ) ( ON ?auto_641067 ?auto_641068 ) ( ON ?auto_641066 ?auto_641067 ) ( CLEAR ?auto_641064 ) ( ON ?auto_641065 ?auto_641066 ) ( CLEAR ?auto_641065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_641060 ?auto_641061 ?auto_641062 ?auto_641063 ?auto_641064 ?auto_641065 )
      ( MAKE-16PILE ?auto_641060 ?auto_641061 ?auto_641062 ?auto_641063 ?auto_641064 ?auto_641065 ?auto_641066 ?auto_641067 ?auto_641068 ?auto_641069 ?auto_641070 ?auto_641071 ?auto_641072 ?auto_641073 ?auto_641074 ?auto_641075 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_641126 - BLOCK
      ?auto_641127 - BLOCK
      ?auto_641128 - BLOCK
      ?auto_641129 - BLOCK
      ?auto_641130 - BLOCK
      ?auto_641131 - BLOCK
      ?auto_641132 - BLOCK
      ?auto_641133 - BLOCK
      ?auto_641134 - BLOCK
      ?auto_641135 - BLOCK
      ?auto_641136 - BLOCK
      ?auto_641137 - BLOCK
      ?auto_641138 - BLOCK
      ?auto_641139 - BLOCK
      ?auto_641140 - BLOCK
      ?auto_641141 - BLOCK
    )
    :vars
    (
      ?auto_641142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_641141 ?auto_641142 ) ( ON-TABLE ?auto_641126 ) ( ON ?auto_641127 ?auto_641126 ) ( ON ?auto_641128 ?auto_641127 ) ( ON ?auto_641129 ?auto_641128 ) ( not ( = ?auto_641126 ?auto_641127 ) ) ( not ( = ?auto_641126 ?auto_641128 ) ) ( not ( = ?auto_641126 ?auto_641129 ) ) ( not ( = ?auto_641126 ?auto_641130 ) ) ( not ( = ?auto_641126 ?auto_641131 ) ) ( not ( = ?auto_641126 ?auto_641132 ) ) ( not ( = ?auto_641126 ?auto_641133 ) ) ( not ( = ?auto_641126 ?auto_641134 ) ) ( not ( = ?auto_641126 ?auto_641135 ) ) ( not ( = ?auto_641126 ?auto_641136 ) ) ( not ( = ?auto_641126 ?auto_641137 ) ) ( not ( = ?auto_641126 ?auto_641138 ) ) ( not ( = ?auto_641126 ?auto_641139 ) ) ( not ( = ?auto_641126 ?auto_641140 ) ) ( not ( = ?auto_641126 ?auto_641141 ) ) ( not ( = ?auto_641126 ?auto_641142 ) ) ( not ( = ?auto_641127 ?auto_641128 ) ) ( not ( = ?auto_641127 ?auto_641129 ) ) ( not ( = ?auto_641127 ?auto_641130 ) ) ( not ( = ?auto_641127 ?auto_641131 ) ) ( not ( = ?auto_641127 ?auto_641132 ) ) ( not ( = ?auto_641127 ?auto_641133 ) ) ( not ( = ?auto_641127 ?auto_641134 ) ) ( not ( = ?auto_641127 ?auto_641135 ) ) ( not ( = ?auto_641127 ?auto_641136 ) ) ( not ( = ?auto_641127 ?auto_641137 ) ) ( not ( = ?auto_641127 ?auto_641138 ) ) ( not ( = ?auto_641127 ?auto_641139 ) ) ( not ( = ?auto_641127 ?auto_641140 ) ) ( not ( = ?auto_641127 ?auto_641141 ) ) ( not ( = ?auto_641127 ?auto_641142 ) ) ( not ( = ?auto_641128 ?auto_641129 ) ) ( not ( = ?auto_641128 ?auto_641130 ) ) ( not ( = ?auto_641128 ?auto_641131 ) ) ( not ( = ?auto_641128 ?auto_641132 ) ) ( not ( = ?auto_641128 ?auto_641133 ) ) ( not ( = ?auto_641128 ?auto_641134 ) ) ( not ( = ?auto_641128 ?auto_641135 ) ) ( not ( = ?auto_641128 ?auto_641136 ) ) ( not ( = ?auto_641128 ?auto_641137 ) ) ( not ( = ?auto_641128 ?auto_641138 ) ) ( not ( = ?auto_641128 ?auto_641139 ) ) ( not ( = ?auto_641128 ?auto_641140 ) ) ( not ( = ?auto_641128 ?auto_641141 ) ) ( not ( = ?auto_641128 ?auto_641142 ) ) ( not ( = ?auto_641129 ?auto_641130 ) ) ( not ( = ?auto_641129 ?auto_641131 ) ) ( not ( = ?auto_641129 ?auto_641132 ) ) ( not ( = ?auto_641129 ?auto_641133 ) ) ( not ( = ?auto_641129 ?auto_641134 ) ) ( not ( = ?auto_641129 ?auto_641135 ) ) ( not ( = ?auto_641129 ?auto_641136 ) ) ( not ( = ?auto_641129 ?auto_641137 ) ) ( not ( = ?auto_641129 ?auto_641138 ) ) ( not ( = ?auto_641129 ?auto_641139 ) ) ( not ( = ?auto_641129 ?auto_641140 ) ) ( not ( = ?auto_641129 ?auto_641141 ) ) ( not ( = ?auto_641129 ?auto_641142 ) ) ( not ( = ?auto_641130 ?auto_641131 ) ) ( not ( = ?auto_641130 ?auto_641132 ) ) ( not ( = ?auto_641130 ?auto_641133 ) ) ( not ( = ?auto_641130 ?auto_641134 ) ) ( not ( = ?auto_641130 ?auto_641135 ) ) ( not ( = ?auto_641130 ?auto_641136 ) ) ( not ( = ?auto_641130 ?auto_641137 ) ) ( not ( = ?auto_641130 ?auto_641138 ) ) ( not ( = ?auto_641130 ?auto_641139 ) ) ( not ( = ?auto_641130 ?auto_641140 ) ) ( not ( = ?auto_641130 ?auto_641141 ) ) ( not ( = ?auto_641130 ?auto_641142 ) ) ( not ( = ?auto_641131 ?auto_641132 ) ) ( not ( = ?auto_641131 ?auto_641133 ) ) ( not ( = ?auto_641131 ?auto_641134 ) ) ( not ( = ?auto_641131 ?auto_641135 ) ) ( not ( = ?auto_641131 ?auto_641136 ) ) ( not ( = ?auto_641131 ?auto_641137 ) ) ( not ( = ?auto_641131 ?auto_641138 ) ) ( not ( = ?auto_641131 ?auto_641139 ) ) ( not ( = ?auto_641131 ?auto_641140 ) ) ( not ( = ?auto_641131 ?auto_641141 ) ) ( not ( = ?auto_641131 ?auto_641142 ) ) ( not ( = ?auto_641132 ?auto_641133 ) ) ( not ( = ?auto_641132 ?auto_641134 ) ) ( not ( = ?auto_641132 ?auto_641135 ) ) ( not ( = ?auto_641132 ?auto_641136 ) ) ( not ( = ?auto_641132 ?auto_641137 ) ) ( not ( = ?auto_641132 ?auto_641138 ) ) ( not ( = ?auto_641132 ?auto_641139 ) ) ( not ( = ?auto_641132 ?auto_641140 ) ) ( not ( = ?auto_641132 ?auto_641141 ) ) ( not ( = ?auto_641132 ?auto_641142 ) ) ( not ( = ?auto_641133 ?auto_641134 ) ) ( not ( = ?auto_641133 ?auto_641135 ) ) ( not ( = ?auto_641133 ?auto_641136 ) ) ( not ( = ?auto_641133 ?auto_641137 ) ) ( not ( = ?auto_641133 ?auto_641138 ) ) ( not ( = ?auto_641133 ?auto_641139 ) ) ( not ( = ?auto_641133 ?auto_641140 ) ) ( not ( = ?auto_641133 ?auto_641141 ) ) ( not ( = ?auto_641133 ?auto_641142 ) ) ( not ( = ?auto_641134 ?auto_641135 ) ) ( not ( = ?auto_641134 ?auto_641136 ) ) ( not ( = ?auto_641134 ?auto_641137 ) ) ( not ( = ?auto_641134 ?auto_641138 ) ) ( not ( = ?auto_641134 ?auto_641139 ) ) ( not ( = ?auto_641134 ?auto_641140 ) ) ( not ( = ?auto_641134 ?auto_641141 ) ) ( not ( = ?auto_641134 ?auto_641142 ) ) ( not ( = ?auto_641135 ?auto_641136 ) ) ( not ( = ?auto_641135 ?auto_641137 ) ) ( not ( = ?auto_641135 ?auto_641138 ) ) ( not ( = ?auto_641135 ?auto_641139 ) ) ( not ( = ?auto_641135 ?auto_641140 ) ) ( not ( = ?auto_641135 ?auto_641141 ) ) ( not ( = ?auto_641135 ?auto_641142 ) ) ( not ( = ?auto_641136 ?auto_641137 ) ) ( not ( = ?auto_641136 ?auto_641138 ) ) ( not ( = ?auto_641136 ?auto_641139 ) ) ( not ( = ?auto_641136 ?auto_641140 ) ) ( not ( = ?auto_641136 ?auto_641141 ) ) ( not ( = ?auto_641136 ?auto_641142 ) ) ( not ( = ?auto_641137 ?auto_641138 ) ) ( not ( = ?auto_641137 ?auto_641139 ) ) ( not ( = ?auto_641137 ?auto_641140 ) ) ( not ( = ?auto_641137 ?auto_641141 ) ) ( not ( = ?auto_641137 ?auto_641142 ) ) ( not ( = ?auto_641138 ?auto_641139 ) ) ( not ( = ?auto_641138 ?auto_641140 ) ) ( not ( = ?auto_641138 ?auto_641141 ) ) ( not ( = ?auto_641138 ?auto_641142 ) ) ( not ( = ?auto_641139 ?auto_641140 ) ) ( not ( = ?auto_641139 ?auto_641141 ) ) ( not ( = ?auto_641139 ?auto_641142 ) ) ( not ( = ?auto_641140 ?auto_641141 ) ) ( not ( = ?auto_641140 ?auto_641142 ) ) ( not ( = ?auto_641141 ?auto_641142 ) ) ( ON ?auto_641140 ?auto_641141 ) ( ON ?auto_641139 ?auto_641140 ) ( ON ?auto_641138 ?auto_641139 ) ( ON ?auto_641137 ?auto_641138 ) ( ON ?auto_641136 ?auto_641137 ) ( ON ?auto_641135 ?auto_641136 ) ( ON ?auto_641134 ?auto_641135 ) ( ON ?auto_641133 ?auto_641134 ) ( ON ?auto_641132 ?auto_641133 ) ( ON ?auto_641131 ?auto_641132 ) ( CLEAR ?auto_641129 ) ( ON ?auto_641130 ?auto_641131 ) ( CLEAR ?auto_641130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_641126 ?auto_641127 ?auto_641128 ?auto_641129 ?auto_641130 )
      ( MAKE-16PILE ?auto_641126 ?auto_641127 ?auto_641128 ?auto_641129 ?auto_641130 ?auto_641131 ?auto_641132 ?auto_641133 ?auto_641134 ?auto_641135 ?auto_641136 ?auto_641137 ?auto_641138 ?auto_641139 ?auto_641140 ?auto_641141 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_641192 - BLOCK
      ?auto_641193 - BLOCK
      ?auto_641194 - BLOCK
      ?auto_641195 - BLOCK
      ?auto_641196 - BLOCK
      ?auto_641197 - BLOCK
      ?auto_641198 - BLOCK
      ?auto_641199 - BLOCK
      ?auto_641200 - BLOCK
      ?auto_641201 - BLOCK
      ?auto_641202 - BLOCK
      ?auto_641203 - BLOCK
      ?auto_641204 - BLOCK
      ?auto_641205 - BLOCK
      ?auto_641206 - BLOCK
      ?auto_641207 - BLOCK
    )
    :vars
    (
      ?auto_641208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_641207 ?auto_641208 ) ( ON-TABLE ?auto_641192 ) ( ON ?auto_641193 ?auto_641192 ) ( ON ?auto_641194 ?auto_641193 ) ( not ( = ?auto_641192 ?auto_641193 ) ) ( not ( = ?auto_641192 ?auto_641194 ) ) ( not ( = ?auto_641192 ?auto_641195 ) ) ( not ( = ?auto_641192 ?auto_641196 ) ) ( not ( = ?auto_641192 ?auto_641197 ) ) ( not ( = ?auto_641192 ?auto_641198 ) ) ( not ( = ?auto_641192 ?auto_641199 ) ) ( not ( = ?auto_641192 ?auto_641200 ) ) ( not ( = ?auto_641192 ?auto_641201 ) ) ( not ( = ?auto_641192 ?auto_641202 ) ) ( not ( = ?auto_641192 ?auto_641203 ) ) ( not ( = ?auto_641192 ?auto_641204 ) ) ( not ( = ?auto_641192 ?auto_641205 ) ) ( not ( = ?auto_641192 ?auto_641206 ) ) ( not ( = ?auto_641192 ?auto_641207 ) ) ( not ( = ?auto_641192 ?auto_641208 ) ) ( not ( = ?auto_641193 ?auto_641194 ) ) ( not ( = ?auto_641193 ?auto_641195 ) ) ( not ( = ?auto_641193 ?auto_641196 ) ) ( not ( = ?auto_641193 ?auto_641197 ) ) ( not ( = ?auto_641193 ?auto_641198 ) ) ( not ( = ?auto_641193 ?auto_641199 ) ) ( not ( = ?auto_641193 ?auto_641200 ) ) ( not ( = ?auto_641193 ?auto_641201 ) ) ( not ( = ?auto_641193 ?auto_641202 ) ) ( not ( = ?auto_641193 ?auto_641203 ) ) ( not ( = ?auto_641193 ?auto_641204 ) ) ( not ( = ?auto_641193 ?auto_641205 ) ) ( not ( = ?auto_641193 ?auto_641206 ) ) ( not ( = ?auto_641193 ?auto_641207 ) ) ( not ( = ?auto_641193 ?auto_641208 ) ) ( not ( = ?auto_641194 ?auto_641195 ) ) ( not ( = ?auto_641194 ?auto_641196 ) ) ( not ( = ?auto_641194 ?auto_641197 ) ) ( not ( = ?auto_641194 ?auto_641198 ) ) ( not ( = ?auto_641194 ?auto_641199 ) ) ( not ( = ?auto_641194 ?auto_641200 ) ) ( not ( = ?auto_641194 ?auto_641201 ) ) ( not ( = ?auto_641194 ?auto_641202 ) ) ( not ( = ?auto_641194 ?auto_641203 ) ) ( not ( = ?auto_641194 ?auto_641204 ) ) ( not ( = ?auto_641194 ?auto_641205 ) ) ( not ( = ?auto_641194 ?auto_641206 ) ) ( not ( = ?auto_641194 ?auto_641207 ) ) ( not ( = ?auto_641194 ?auto_641208 ) ) ( not ( = ?auto_641195 ?auto_641196 ) ) ( not ( = ?auto_641195 ?auto_641197 ) ) ( not ( = ?auto_641195 ?auto_641198 ) ) ( not ( = ?auto_641195 ?auto_641199 ) ) ( not ( = ?auto_641195 ?auto_641200 ) ) ( not ( = ?auto_641195 ?auto_641201 ) ) ( not ( = ?auto_641195 ?auto_641202 ) ) ( not ( = ?auto_641195 ?auto_641203 ) ) ( not ( = ?auto_641195 ?auto_641204 ) ) ( not ( = ?auto_641195 ?auto_641205 ) ) ( not ( = ?auto_641195 ?auto_641206 ) ) ( not ( = ?auto_641195 ?auto_641207 ) ) ( not ( = ?auto_641195 ?auto_641208 ) ) ( not ( = ?auto_641196 ?auto_641197 ) ) ( not ( = ?auto_641196 ?auto_641198 ) ) ( not ( = ?auto_641196 ?auto_641199 ) ) ( not ( = ?auto_641196 ?auto_641200 ) ) ( not ( = ?auto_641196 ?auto_641201 ) ) ( not ( = ?auto_641196 ?auto_641202 ) ) ( not ( = ?auto_641196 ?auto_641203 ) ) ( not ( = ?auto_641196 ?auto_641204 ) ) ( not ( = ?auto_641196 ?auto_641205 ) ) ( not ( = ?auto_641196 ?auto_641206 ) ) ( not ( = ?auto_641196 ?auto_641207 ) ) ( not ( = ?auto_641196 ?auto_641208 ) ) ( not ( = ?auto_641197 ?auto_641198 ) ) ( not ( = ?auto_641197 ?auto_641199 ) ) ( not ( = ?auto_641197 ?auto_641200 ) ) ( not ( = ?auto_641197 ?auto_641201 ) ) ( not ( = ?auto_641197 ?auto_641202 ) ) ( not ( = ?auto_641197 ?auto_641203 ) ) ( not ( = ?auto_641197 ?auto_641204 ) ) ( not ( = ?auto_641197 ?auto_641205 ) ) ( not ( = ?auto_641197 ?auto_641206 ) ) ( not ( = ?auto_641197 ?auto_641207 ) ) ( not ( = ?auto_641197 ?auto_641208 ) ) ( not ( = ?auto_641198 ?auto_641199 ) ) ( not ( = ?auto_641198 ?auto_641200 ) ) ( not ( = ?auto_641198 ?auto_641201 ) ) ( not ( = ?auto_641198 ?auto_641202 ) ) ( not ( = ?auto_641198 ?auto_641203 ) ) ( not ( = ?auto_641198 ?auto_641204 ) ) ( not ( = ?auto_641198 ?auto_641205 ) ) ( not ( = ?auto_641198 ?auto_641206 ) ) ( not ( = ?auto_641198 ?auto_641207 ) ) ( not ( = ?auto_641198 ?auto_641208 ) ) ( not ( = ?auto_641199 ?auto_641200 ) ) ( not ( = ?auto_641199 ?auto_641201 ) ) ( not ( = ?auto_641199 ?auto_641202 ) ) ( not ( = ?auto_641199 ?auto_641203 ) ) ( not ( = ?auto_641199 ?auto_641204 ) ) ( not ( = ?auto_641199 ?auto_641205 ) ) ( not ( = ?auto_641199 ?auto_641206 ) ) ( not ( = ?auto_641199 ?auto_641207 ) ) ( not ( = ?auto_641199 ?auto_641208 ) ) ( not ( = ?auto_641200 ?auto_641201 ) ) ( not ( = ?auto_641200 ?auto_641202 ) ) ( not ( = ?auto_641200 ?auto_641203 ) ) ( not ( = ?auto_641200 ?auto_641204 ) ) ( not ( = ?auto_641200 ?auto_641205 ) ) ( not ( = ?auto_641200 ?auto_641206 ) ) ( not ( = ?auto_641200 ?auto_641207 ) ) ( not ( = ?auto_641200 ?auto_641208 ) ) ( not ( = ?auto_641201 ?auto_641202 ) ) ( not ( = ?auto_641201 ?auto_641203 ) ) ( not ( = ?auto_641201 ?auto_641204 ) ) ( not ( = ?auto_641201 ?auto_641205 ) ) ( not ( = ?auto_641201 ?auto_641206 ) ) ( not ( = ?auto_641201 ?auto_641207 ) ) ( not ( = ?auto_641201 ?auto_641208 ) ) ( not ( = ?auto_641202 ?auto_641203 ) ) ( not ( = ?auto_641202 ?auto_641204 ) ) ( not ( = ?auto_641202 ?auto_641205 ) ) ( not ( = ?auto_641202 ?auto_641206 ) ) ( not ( = ?auto_641202 ?auto_641207 ) ) ( not ( = ?auto_641202 ?auto_641208 ) ) ( not ( = ?auto_641203 ?auto_641204 ) ) ( not ( = ?auto_641203 ?auto_641205 ) ) ( not ( = ?auto_641203 ?auto_641206 ) ) ( not ( = ?auto_641203 ?auto_641207 ) ) ( not ( = ?auto_641203 ?auto_641208 ) ) ( not ( = ?auto_641204 ?auto_641205 ) ) ( not ( = ?auto_641204 ?auto_641206 ) ) ( not ( = ?auto_641204 ?auto_641207 ) ) ( not ( = ?auto_641204 ?auto_641208 ) ) ( not ( = ?auto_641205 ?auto_641206 ) ) ( not ( = ?auto_641205 ?auto_641207 ) ) ( not ( = ?auto_641205 ?auto_641208 ) ) ( not ( = ?auto_641206 ?auto_641207 ) ) ( not ( = ?auto_641206 ?auto_641208 ) ) ( not ( = ?auto_641207 ?auto_641208 ) ) ( ON ?auto_641206 ?auto_641207 ) ( ON ?auto_641205 ?auto_641206 ) ( ON ?auto_641204 ?auto_641205 ) ( ON ?auto_641203 ?auto_641204 ) ( ON ?auto_641202 ?auto_641203 ) ( ON ?auto_641201 ?auto_641202 ) ( ON ?auto_641200 ?auto_641201 ) ( ON ?auto_641199 ?auto_641200 ) ( ON ?auto_641198 ?auto_641199 ) ( ON ?auto_641197 ?auto_641198 ) ( ON ?auto_641196 ?auto_641197 ) ( CLEAR ?auto_641194 ) ( ON ?auto_641195 ?auto_641196 ) ( CLEAR ?auto_641195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_641192 ?auto_641193 ?auto_641194 ?auto_641195 )
      ( MAKE-16PILE ?auto_641192 ?auto_641193 ?auto_641194 ?auto_641195 ?auto_641196 ?auto_641197 ?auto_641198 ?auto_641199 ?auto_641200 ?auto_641201 ?auto_641202 ?auto_641203 ?auto_641204 ?auto_641205 ?auto_641206 ?auto_641207 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_641258 - BLOCK
      ?auto_641259 - BLOCK
      ?auto_641260 - BLOCK
      ?auto_641261 - BLOCK
      ?auto_641262 - BLOCK
      ?auto_641263 - BLOCK
      ?auto_641264 - BLOCK
      ?auto_641265 - BLOCK
      ?auto_641266 - BLOCK
      ?auto_641267 - BLOCK
      ?auto_641268 - BLOCK
      ?auto_641269 - BLOCK
      ?auto_641270 - BLOCK
      ?auto_641271 - BLOCK
      ?auto_641272 - BLOCK
      ?auto_641273 - BLOCK
    )
    :vars
    (
      ?auto_641274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_641273 ?auto_641274 ) ( ON-TABLE ?auto_641258 ) ( ON ?auto_641259 ?auto_641258 ) ( not ( = ?auto_641258 ?auto_641259 ) ) ( not ( = ?auto_641258 ?auto_641260 ) ) ( not ( = ?auto_641258 ?auto_641261 ) ) ( not ( = ?auto_641258 ?auto_641262 ) ) ( not ( = ?auto_641258 ?auto_641263 ) ) ( not ( = ?auto_641258 ?auto_641264 ) ) ( not ( = ?auto_641258 ?auto_641265 ) ) ( not ( = ?auto_641258 ?auto_641266 ) ) ( not ( = ?auto_641258 ?auto_641267 ) ) ( not ( = ?auto_641258 ?auto_641268 ) ) ( not ( = ?auto_641258 ?auto_641269 ) ) ( not ( = ?auto_641258 ?auto_641270 ) ) ( not ( = ?auto_641258 ?auto_641271 ) ) ( not ( = ?auto_641258 ?auto_641272 ) ) ( not ( = ?auto_641258 ?auto_641273 ) ) ( not ( = ?auto_641258 ?auto_641274 ) ) ( not ( = ?auto_641259 ?auto_641260 ) ) ( not ( = ?auto_641259 ?auto_641261 ) ) ( not ( = ?auto_641259 ?auto_641262 ) ) ( not ( = ?auto_641259 ?auto_641263 ) ) ( not ( = ?auto_641259 ?auto_641264 ) ) ( not ( = ?auto_641259 ?auto_641265 ) ) ( not ( = ?auto_641259 ?auto_641266 ) ) ( not ( = ?auto_641259 ?auto_641267 ) ) ( not ( = ?auto_641259 ?auto_641268 ) ) ( not ( = ?auto_641259 ?auto_641269 ) ) ( not ( = ?auto_641259 ?auto_641270 ) ) ( not ( = ?auto_641259 ?auto_641271 ) ) ( not ( = ?auto_641259 ?auto_641272 ) ) ( not ( = ?auto_641259 ?auto_641273 ) ) ( not ( = ?auto_641259 ?auto_641274 ) ) ( not ( = ?auto_641260 ?auto_641261 ) ) ( not ( = ?auto_641260 ?auto_641262 ) ) ( not ( = ?auto_641260 ?auto_641263 ) ) ( not ( = ?auto_641260 ?auto_641264 ) ) ( not ( = ?auto_641260 ?auto_641265 ) ) ( not ( = ?auto_641260 ?auto_641266 ) ) ( not ( = ?auto_641260 ?auto_641267 ) ) ( not ( = ?auto_641260 ?auto_641268 ) ) ( not ( = ?auto_641260 ?auto_641269 ) ) ( not ( = ?auto_641260 ?auto_641270 ) ) ( not ( = ?auto_641260 ?auto_641271 ) ) ( not ( = ?auto_641260 ?auto_641272 ) ) ( not ( = ?auto_641260 ?auto_641273 ) ) ( not ( = ?auto_641260 ?auto_641274 ) ) ( not ( = ?auto_641261 ?auto_641262 ) ) ( not ( = ?auto_641261 ?auto_641263 ) ) ( not ( = ?auto_641261 ?auto_641264 ) ) ( not ( = ?auto_641261 ?auto_641265 ) ) ( not ( = ?auto_641261 ?auto_641266 ) ) ( not ( = ?auto_641261 ?auto_641267 ) ) ( not ( = ?auto_641261 ?auto_641268 ) ) ( not ( = ?auto_641261 ?auto_641269 ) ) ( not ( = ?auto_641261 ?auto_641270 ) ) ( not ( = ?auto_641261 ?auto_641271 ) ) ( not ( = ?auto_641261 ?auto_641272 ) ) ( not ( = ?auto_641261 ?auto_641273 ) ) ( not ( = ?auto_641261 ?auto_641274 ) ) ( not ( = ?auto_641262 ?auto_641263 ) ) ( not ( = ?auto_641262 ?auto_641264 ) ) ( not ( = ?auto_641262 ?auto_641265 ) ) ( not ( = ?auto_641262 ?auto_641266 ) ) ( not ( = ?auto_641262 ?auto_641267 ) ) ( not ( = ?auto_641262 ?auto_641268 ) ) ( not ( = ?auto_641262 ?auto_641269 ) ) ( not ( = ?auto_641262 ?auto_641270 ) ) ( not ( = ?auto_641262 ?auto_641271 ) ) ( not ( = ?auto_641262 ?auto_641272 ) ) ( not ( = ?auto_641262 ?auto_641273 ) ) ( not ( = ?auto_641262 ?auto_641274 ) ) ( not ( = ?auto_641263 ?auto_641264 ) ) ( not ( = ?auto_641263 ?auto_641265 ) ) ( not ( = ?auto_641263 ?auto_641266 ) ) ( not ( = ?auto_641263 ?auto_641267 ) ) ( not ( = ?auto_641263 ?auto_641268 ) ) ( not ( = ?auto_641263 ?auto_641269 ) ) ( not ( = ?auto_641263 ?auto_641270 ) ) ( not ( = ?auto_641263 ?auto_641271 ) ) ( not ( = ?auto_641263 ?auto_641272 ) ) ( not ( = ?auto_641263 ?auto_641273 ) ) ( not ( = ?auto_641263 ?auto_641274 ) ) ( not ( = ?auto_641264 ?auto_641265 ) ) ( not ( = ?auto_641264 ?auto_641266 ) ) ( not ( = ?auto_641264 ?auto_641267 ) ) ( not ( = ?auto_641264 ?auto_641268 ) ) ( not ( = ?auto_641264 ?auto_641269 ) ) ( not ( = ?auto_641264 ?auto_641270 ) ) ( not ( = ?auto_641264 ?auto_641271 ) ) ( not ( = ?auto_641264 ?auto_641272 ) ) ( not ( = ?auto_641264 ?auto_641273 ) ) ( not ( = ?auto_641264 ?auto_641274 ) ) ( not ( = ?auto_641265 ?auto_641266 ) ) ( not ( = ?auto_641265 ?auto_641267 ) ) ( not ( = ?auto_641265 ?auto_641268 ) ) ( not ( = ?auto_641265 ?auto_641269 ) ) ( not ( = ?auto_641265 ?auto_641270 ) ) ( not ( = ?auto_641265 ?auto_641271 ) ) ( not ( = ?auto_641265 ?auto_641272 ) ) ( not ( = ?auto_641265 ?auto_641273 ) ) ( not ( = ?auto_641265 ?auto_641274 ) ) ( not ( = ?auto_641266 ?auto_641267 ) ) ( not ( = ?auto_641266 ?auto_641268 ) ) ( not ( = ?auto_641266 ?auto_641269 ) ) ( not ( = ?auto_641266 ?auto_641270 ) ) ( not ( = ?auto_641266 ?auto_641271 ) ) ( not ( = ?auto_641266 ?auto_641272 ) ) ( not ( = ?auto_641266 ?auto_641273 ) ) ( not ( = ?auto_641266 ?auto_641274 ) ) ( not ( = ?auto_641267 ?auto_641268 ) ) ( not ( = ?auto_641267 ?auto_641269 ) ) ( not ( = ?auto_641267 ?auto_641270 ) ) ( not ( = ?auto_641267 ?auto_641271 ) ) ( not ( = ?auto_641267 ?auto_641272 ) ) ( not ( = ?auto_641267 ?auto_641273 ) ) ( not ( = ?auto_641267 ?auto_641274 ) ) ( not ( = ?auto_641268 ?auto_641269 ) ) ( not ( = ?auto_641268 ?auto_641270 ) ) ( not ( = ?auto_641268 ?auto_641271 ) ) ( not ( = ?auto_641268 ?auto_641272 ) ) ( not ( = ?auto_641268 ?auto_641273 ) ) ( not ( = ?auto_641268 ?auto_641274 ) ) ( not ( = ?auto_641269 ?auto_641270 ) ) ( not ( = ?auto_641269 ?auto_641271 ) ) ( not ( = ?auto_641269 ?auto_641272 ) ) ( not ( = ?auto_641269 ?auto_641273 ) ) ( not ( = ?auto_641269 ?auto_641274 ) ) ( not ( = ?auto_641270 ?auto_641271 ) ) ( not ( = ?auto_641270 ?auto_641272 ) ) ( not ( = ?auto_641270 ?auto_641273 ) ) ( not ( = ?auto_641270 ?auto_641274 ) ) ( not ( = ?auto_641271 ?auto_641272 ) ) ( not ( = ?auto_641271 ?auto_641273 ) ) ( not ( = ?auto_641271 ?auto_641274 ) ) ( not ( = ?auto_641272 ?auto_641273 ) ) ( not ( = ?auto_641272 ?auto_641274 ) ) ( not ( = ?auto_641273 ?auto_641274 ) ) ( ON ?auto_641272 ?auto_641273 ) ( ON ?auto_641271 ?auto_641272 ) ( ON ?auto_641270 ?auto_641271 ) ( ON ?auto_641269 ?auto_641270 ) ( ON ?auto_641268 ?auto_641269 ) ( ON ?auto_641267 ?auto_641268 ) ( ON ?auto_641266 ?auto_641267 ) ( ON ?auto_641265 ?auto_641266 ) ( ON ?auto_641264 ?auto_641265 ) ( ON ?auto_641263 ?auto_641264 ) ( ON ?auto_641262 ?auto_641263 ) ( ON ?auto_641261 ?auto_641262 ) ( CLEAR ?auto_641259 ) ( ON ?auto_641260 ?auto_641261 ) ( CLEAR ?auto_641260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_641258 ?auto_641259 ?auto_641260 )
      ( MAKE-16PILE ?auto_641258 ?auto_641259 ?auto_641260 ?auto_641261 ?auto_641262 ?auto_641263 ?auto_641264 ?auto_641265 ?auto_641266 ?auto_641267 ?auto_641268 ?auto_641269 ?auto_641270 ?auto_641271 ?auto_641272 ?auto_641273 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_641324 - BLOCK
      ?auto_641325 - BLOCK
      ?auto_641326 - BLOCK
      ?auto_641327 - BLOCK
      ?auto_641328 - BLOCK
      ?auto_641329 - BLOCK
      ?auto_641330 - BLOCK
      ?auto_641331 - BLOCK
      ?auto_641332 - BLOCK
      ?auto_641333 - BLOCK
      ?auto_641334 - BLOCK
      ?auto_641335 - BLOCK
      ?auto_641336 - BLOCK
      ?auto_641337 - BLOCK
      ?auto_641338 - BLOCK
      ?auto_641339 - BLOCK
    )
    :vars
    (
      ?auto_641340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_641339 ?auto_641340 ) ( ON-TABLE ?auto_641324 ) ( not ( = ?auto_641324 ?auto_641325 ) ) ( not ( = ?auto_641324 ?auto_641326 ) ) ( not ( = ?auto_641324 ?auto_641327 ) ) ( not ( = ?auto_641324 ?auto_641328 ) ) ( not ( = ?auto_641324 ?auto_641329 ) ) ( not ( = ?auto_641324 ?auto_641330 ) ) ( not ( = ?auto_641324 ?auto_641331 ) ) ( not ( = ?auto_641324 ?auto_641332 ) ) ( not ( = ?auto_641324 ?auto_641333 ) ) ( not ( = ?auto_641324 ?auto_641334 ) ) ( not ( = ?auto_641324 ?auto_641335 ) ) ( not ( = ?auto_641324 ?auto_641336 ) ) ( not ( = ?auto_641324 ?auto_641337 ) ) ( not ( = ?auto_641324 ?auto_641338 ) ) ( not ( = ?auto_641324 ?auto_641339 ) ) ( not ( = ?auto_641324 ?auto_641340 ) ) ( not ( = ?auto_641325 ?auto_641326 ) ) ( not ( = ?auto_641325 ?auto_641327 ) ) ( not ( = ?auto_641325 ?auto_641328 ) ) ( not ( = ?auto_641325 ?auto_641329 ) ) ( not ( = ?auto_641325 ?auto_641330 ) ) ( not ( = ?auto_641325 ?auto_641331 ) ) ( not ( = ?auto_641325 ?auto_641332 ) ) ( not ( = ?auto_641325 ?auto_641333 ) ) ( not ( = ?auto_641325 ?auto_641334 ) ) ( not ( = ?auto_641325 ?auto_641335 ) ) ( not ( = ?auto_641325 ?auto_641336 ) ) ( not ( = ?auto_641325 ?auto_641337 ) ) ( not ( = ?auto_641325 ?auto_641338 ) ) ( not ( = ?auto_641325 ?auto_641339 ) ) ( not ( = ?auto_641325 ?auto_641340 ) ) ( not ( = ?auto_641326 ?auto_641327 ) ) ( not ( = ?auto_641326 ?auto_641328 ) ) ( not ( = ?auto_641326 ?auto_641329 ) ) ( not ( = ?auto_641326 ?auto_641330 ) ) ( not ( = ?auto_641326 ?auto_641331 ) ) ( not ( = ?auto_641326 ?auto_641332 ) ) ( not ( = ?auto_641326 ?auto_641333 ) ) ( not ( = ?auto_641326 ?auto_641334 ) ) ( not ( = ?auto_641326 ?auto_641335 ) ) ( not ( = ?auto_641326 ?auto_641336 ) ) ( not ( = ?auto_641326 ?auto_641337 ) ) ( not ( = ?auto_641326 ?auto_641338 ) ) ( not ( = ?auto_641326 ?auto_641339 ) ) ( not ( = ?auto_641326 ?auto_641340 ) ) ( not ( = ?auto_641327 ?auto_641328 ) ) ( not ( = ?auto_641327 ?auto_641329 ) ) ( not ( = ?auto_641327 ?auto_641330 ) ) ( not ( = ?auto_641327 ?auto_641331 ) ) ( not ( = ?auto_641327 ?auto_641332 ) ) ( not ( = ?auto_641327 ?auto_641333 ) ) ( not ( = ?auto_641327 ?auto_641334 ) ) ( not ( = ?auto_641327 ?auto_641335 ) ) ( not ( = ?auto_641327 ?auto_641336 ) ) ( not ( = ?auto_641327 ?auto_641337 ) ) ( not ( = ?auto_641327 ?auto_641338 ) ) ( not ( = ?auto_641327 ?auto_641339 ) ) ( not ( = ?auto_641327 ?auto_641340 ) ) ( not ( = ?auto_641328 ?auto_641329 ) ) ( not ( = ?auto_641328 ?auto_641330 ) ) ( not ( = ?auto_641328 ?auto_641331 ) ) ( not ( = ?auto_641328 ?auto_641332 ) ) ( not ( = ?auto_641328 ?auto_641333 ) ) ( not ( = ?auto_641328 ?auto_641334 ) ) ( not ( = ?auto_641328 ?auto_641335 ) ) ( not ( = ?auto_641328 ?auto_641336 ) ) ( not ( = ?auto_641328 ?auto_641337 ) ) ( not ( = ?auto_641328 ?auto_641338 ) ) ( not ( = ?auto_641328 ?auto_641339 ) ) ( not ( = ?auto_641328 ?auto_641340 ) ) ( not ( = ?auto_641329 ?auto_641330 ) ) ( not ( = ?auto_641329 ?auto_641331 ) ) ( not ( = ?auto_641329 ?auto_641332 ) ) ( not ( = ?auto_641329 ?auto_641333 ) ) ( not ( = ?auto_641329 ?auto_641334 ) ) ( not ( = ?auto_641329 ?auto_641335 ) ) ( not ( = ?auto_641329 ?auto_641336 ) ) ( not ( = ?auto_641329 ?auto_641337 ) ) ( not ( = ?auto_641329 ?auto_641338 ) ) ( not ( = ?auto_641329 ?auto_641339 ) ) ( not ( = ?auto_641329 ?auto_641340 ) ) ( not ( = ?auto_641330 ?auto_641331 ) ) ( not ( = ?auto_641330 ?auto_641332 ) ) ( not ( = ?auto_641330 ?auto_641333 ) ) ( not ( = ?auto_641330 ?auto_641334 ) ) ( not ( = ?auto_641330 ?auto_641335 ) ) ( not ( = ?auto_641330 ?auto_641336 ) ) ( not ( = ?auto_641330 ?auto_641337 ) ) ( not ( = ?auto_641330 ?auto_641338 ) ) ( not ( = ?auto_641330 ?auto_641339 ) ) ( not ( = ?auto_641330 ?auto_641340 ) ) ( not ( = ?auto_641331 ?auto_641332 ) ) ( not ( = ?auto_641331 ?auto_641333 ) ) ( not ( = ?auto_641331 ?auto_641334 ) ) ( not ( = ?auto_641331 ?auto_641335 ) ) ( not ( = ?auto_641331 ?auto_641336 ) ) ( not ( = ?auto_641331 ?auto_641337 ) ) ( not ( = ?auto_641331 ?auto_641338 ) ) ( not ( = ?auto_641331 ?auto_641339 ) ) ( not ( = ?auto_641331 ?auto_641340 ) ) ( not ( = ?auto_641332 ?auto_641333 ) ) ( not ( = ?auto_641332 ?auto_641334 ) ) ( not ( = ?auto_641332 ?auto_641335 ) ) ( not ( = ?auto_641332 ?auto_641336 ) ) ( not ( = ?auto_641332 ?auto_641337 ) ) ( not ( = ?auto_641332 ?auto_641338 ) ) ( not ( = ?auto_641332 ?auto_641339 ) ) ( not ( = ?auto_641332 ?auto_641340 ) ) ( not ( = ?auto_641333 ?auto_641334 ) ) ( not ( = ?auto_641333 ?auto_641335 ) ) ( not ( = ?auto_641333 ?auto_641336 ) ) ( not ( = ?auto_641333 ?auto_641337 ) ) ( not ( = ?auto_641333 ?auto_641338 ) ) ( not ( = ?auto_641333 ?auto_641339 ) ) ( not ( = ?auto_641333 ?auto_641340 ) ) ( not ( = ?auto_641334 ?auto_641335 ) ) ( not ( = ?auto_641334 ?auto_641336 ) ) ( not ( = ?auto_641334 ?auto_641337 ) ) ( not ( = ?auto_641334 ?auto_641338 ) ) ( not ( = ?auto_641334 ?auto_641339 ) ) ( not ( = ?auto_641334 ?auto_641340 ) ) ( not ( = ?auto_641335 ?auto_641336 ) ) ( not ( = ?auto_641335 ?auto_641337 ) ) ( not ( = ?auto_641335 ?auto_641338 ) ) ( not ( = ?auto_641335 ?auto_641339 ) ) ( not ( = ?auto_641335 ?auto_641340 ) ) ( not ( = ?auto_641336 ?auto_641337 ) ) ( not ( = ?auto_641336 ?auto_641338 ) ) ( not ( = ?auto_641336 ?auto_641339 ) ) ( not ( = ?auto_641336 ?auto_641340 ) ) ( not ( = ?auto_641337 ?auto_641338 ) ) ( not ( = ?auto_641337 ?auto_641339 ) ) ( not ( = ?auto_641337 ?auto_641340 ) ) ( not ( = ?auto_641338 ?auto_641339 ) ) ( not ( = ?auto_641338 ?auto_641340 ) ) ( not ( = ?auto_641339 ?auto_641340 ) ) ( ON ?auto_641338 ?auto_641339 ) ( ON ?auto_641337 ?auto_641338 ) ( ON ?auto_641336 ?auto_641337 ) ( ON ?auto_641335 ?auto_641336 ) ( ON ?auto_641334 ?auto_641335 ) ( ON ?auto_641333 ?auto_641334 ) ( ON ?auto_641332 ?auto_641333 ) ( ON ?auto_641331 ?auto_641332 ) ( ON ?auto_641330 ?auto_641331 ) ( ON ?auto_641329 ?auto_641330 ) ( ON ?auto_641328 ?auto_641329 ) ( ON ?auto_641327 ?auto_641328 ) ( ON ?auto_641326 ?auto_641327 ) ( CLEAR ?auto_641324 ) ( ON ?auto_641325 ?auto_641326 ) ( CLEAR ?auto_641325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_641324 ?auto_641325 )
      ( MAKE-16PILE ?auto_641324 ?auto_641325 ?auto_641326 ?auto_641327 ?auto_641328 ?auto_641329 ?auto_641330 ?auto_641331 ?auto_641332 ?auto_641333 ?auto_641334 ?auto_641335 ?auto_641336 ?auto_641337 ?auto_641338 ?auto_641339 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_641390 - BLOCK
      ?auto_641391 - BLOCK
      ?auto_641392 - BLOCK
      ?auto_641393 - BLOCK
      ?auto_641394 - BLOCK
      ?auto_641395 - BLOCK
      ?auto_641396 - BLOCK
      ?auto_641397 - BLOCK
      ?auto_641398 - BLOCK
      ?auto_641399 - BLOCK
      ?auto_641400 - BLOCK
      ?auto_641401 - BLOCK
      ?auto_641402 - BLOCK
      ?auto_641403 - BLOCK
      ?auto_641404 - BLOCK
      ?auto_641405 - BLOCK
    )
    :vars
    (
      ?auto_641406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_641405 ?auto_641406 ) ( not ( = ?auto_641390 ?auto_641391 ) ) ( not ( = ?auto_641390 ?auto_641392 ) ) ( not ( = ?auto_641390 ?auto_641393 ) ) ( not ( = ?auto_641390 ?auto_641394 ) ) ( not ( = ?auto_641390 ?auto_641395 ) ) ( not ( = ?auto_641390 ?auto_641396 ) ) ( not ( = ?auto_641390 ?auto_641397 ) ) ( not ( = ?auto_641390 ?auto_641398 ) ) ( not ( = ?auto_641390 ?auto_641399 ) ) ( not ( = ?auto_641390 ?auto_641400 ) ) ( not ( = ?auto_641390 ?auto_641401 ) ) ( not ( = ?auto_641390 ?auto_641402 ) ) ( not ( = ?auto_641390 ?auto_641403 ) ) ( not ( = ?auto_641390 ?auto_641404 ) ) ( not ( = ?auto_641390 ?auto_641405 ) ) ( not ( = ?auto_641390 ?auto_641406 ) ) ( not ( = ?auto_641391 ?auto_641392 ) ) ( not ( = ?auto_641391 ?auto_641393 ) ) ( not ( = ?auto_641391 ?auto_641394 ) ) ( not ( = ?auto_641391 ?auto_641395 ) ) ( not ( = ?auto_641391 ?auto_641396 ) ) ( not ( = ?auto_641391 ?auto_641397 ) ) ( not ( = ?auto_641391 ?auto_641398 ) ) ( not ( = ?auto_641391 ?auto_641399 ) ) ( not ( = ?auto_641391 ?auto_641400 ) ) ( not ( = ?auto_641391 ?auto_641401 ) ) ( not ( = ?auto_641391 ?auto_641402 ) ) ( not ( = ?auto_641391 ?auto_641403 ) ) ( not ( = ?auto_641391 ?auto_641404 ) ) ( not ( = ?auto_641391 ?auto_641405 ) ) ( not ( = ?auto_641391 ?auto_641406 ) ) ( not ( = ?auto_641392 ?auto_641393 ) ) ( not ( = ?auto_641392 ?auto_641394 ) ) ( not ( = ?auto_641392 ?auto_641395 ) ) ( not ( = ?auto_641392 ?auto_641396 ) ) ( not ( = ?auto_641392 ?auto_641397 ) ) ( not ( = ?auto_641392 ?auto_641398 ) ) ( not ( = ?auto_641392 ?auto_641399 ) ) ( not ( = ?auto_641392 ?auto_641400 ) ) ( not ( = ?auto_641392 ?auto_641401 ) ) ( not ( = ?auto_641392 ?auto_641402 ) ) ( not ( = ?auto_641392 ?auto_641403 ) ) ( not ( = ?auto_641392 ?auto_641404 ) ) ( not ( = ?auto_641392 ?auto_641405 ) ) ( not ( = ?auto_641392 ?auto_641406 ) ) ( not ( = ?auto_641393 ?auto_641394 ) ) ( not ( = ?auto_641393 ?auto_641395 ) ) ( not ( = ?auto_641393 ?auto_641396 ) ) ( not ( = ?auto_641393 ?auto_641397 ) ) ( not ( = ?auto_641393 ?auto_641398 ) ) ( not ( = ?auto_641393 ?auto_641399 ) ) ( not ( = ?auto_641393 ?auto_641400 ) ) ( not ( = ?auto_641393 ?auto_641401 ) ) ( not ( = ?auto_641393 ?auto_641402 ) ) ( not ( = ?auto_641393 ?auto_641403 ) ) ( not ( = ?auto_641393 ?auto_641404 ) ) ( not ( = ?auto_641393 ?auto_641405 ) ) ( not ( = ?auto_641393 ?auto_641406 ) ) ( not ( = ?auto_641394 ?auto_641395 ) ) ( not ( = ?auto_641394 ?auto_641396 ) ) ( not ( = ?auto_641394 ?auto_641397 ) ) ( not ( = ?auto_641394 ?auto_641398 ) ) ( not ( = ?auto_641394 ?auto_641399 ) ) ( not ( = ?auto_641394 ?auto_641400 ) ) ( not ( = ?auto_641394 ?auto_641401 ) ) ( not ( = ?auto_641394 ?auto_641402 ) ) ( not ( = ?auto_641394 ?auto_641403 ) ) ( not ( = ?auto_641394 ?auto_641404 ) ) ( not ( = ?auto_641394 ?auto_641405 ) ) ( not ( = ?auto_641394 ?auto_641406 ) ) ( not ( = ?auto_641395 ?auto_641396 ) ) ( not ( = ?auto_641395 ?auto_641397 ) ) ( not ( = ?auto_641395 ?auto_641398 ) ) ( not ( = ?auto_641395 ?auto_641399 ) ) ( not ( = ?auto_641395 ?auto_641400 ) ) ( not ( = ?auto_641395 ?auto_641401 ) ) ( not ( = ?auto_641395 ?auto_641402 ) ) ( not ( = ?auto_641395 ?auto_641403 ) ) ( not ( = ?auto_641395 ?auto_641404 ) ) ( not ( = ?auto_641395 ?auto_641405 ) ) ( not ( = ?auto_641395 ?auto_641406 ) ) ( not ( = ?auto_641396 ?auto_641397 ) ) ( not ( = ?auto_641396 ?auto_641398 ) ) ( not ( = ?auto_641396 ?auto_641399 ) ) ( not ( = ?auto_641396 ?auto_641400 ) ) ( not ( = ?auto_641396 ?auto_641401 ) ) ( not ( = ?auto_641396 ?auto_641402 ) ) ( not ( = ?auto_641396 ?auto_641403 ) ) ( not ( = ?auto_641396 ?auto_641404 ) ) ( not ( = ?auto_641396 ?auto_641405 ) ) ( not ( = ?auto_641396 ?auto_641406 ) ) ( not ( = ?auto_641397 ?auto_641398 ) ) ( not ( = ?auto_641397 ?auto_641399 ) ) ( not ( = ?auto_641397 ?auto_641400 ) ) ( not ( = ?auto_641397 ?auto_641401 ) ) ( not ( = ?auto_641397 ?auto_641402 ) ) ( not ( = ?auto_641397 ?auto_641403 ) ) ( not ( = ?auto_641397 ?auto_641404 ) ) ( not ( = ?auto_641397 ?auto_641405 ) ) ( not ( = ?auto_641397 ?auto_641406 ) ) ( not ( = ?auto_641398 ?auto_641399 ) ) ( not ( = ?auto_641398 ?auto_641400 ) ) ( not ( = ?auto_641398 ?auto_641401 ) ) ( not ( = ?auto_641398 ?auto_641402 ) ) ( not ( = ?auto_641398 ?auto_641403 ) ) ( not ( = ?auto_641398 ?auto_641404 ) ) ( not ( = ?auto_641398 ?auto_641405 ) ) ( not ( = ?auto_641398 ?auto_641406 ) ) ( not ( = ?auto_641399 ?auto_641400 ) ) ( not ( = ?auto_641399 ?auto_641401 ) ) ( not ( = ?auto_641399 ?auto_641402 ) ) ( not ( = ?auto_641399 ?auto_641403 ) ) ( not ( = ?auto_641399 ?auto_641404 ) ) ( not ( = ?auto_641399 ?auto_641405 ) ) ( not ( = ?auto_641399 ?auto_641406 ) ) ( not ( = ?auto_641400 ?auto_641401 ) ) ( not ( = ?auto_641400 ?auto_641402 ) ) ( not ( = ?auto_641400 ?auto_641403 ) ) ( not ( = ?auto_641400 ?auto_641404 ) ) ( not ( = ?auto_641400 ?auto_641405 ) ) ( not ( = ?auto_641400 ?auto_641406 ) ) ( not ( = ?auto_641401 ?auto_641402 ) ) ( not ( = ?auto_641401 ?auto_641403 ) ) ( not ( = ?auto_641401 ?auto_641404 ) ) ( not ( = ?auto_641401 ?auto_641405 ) ) ( not ( = ?auto_641401 ?auto_641406 ) ) ( not ( = ?auto_641402 ?auto_641403 ) ) ( not ( = ?auto_641402 ?auto_641404 ) ) ( not ( = ?auto_641402 ?auto_641405 ) ) ( not ( = ?auto_641402 ?auto_641406 ) ) ( not ( = ?auto_641403 ?auto_641404 ) ) ( not ( = ?auto_641403 ?auto_641405 ) ) ( not ( = ?auto_641403 ?auto_641406 ) ) ( not ( = ?auto_641404 ?auto_641405 ) ) ( not ( = ?auto_641404 ?auto_641406 ) ) ( not ( = ?auto_641405 ?auto_641406 ) ) ( ON ?auto_641404 ?auto_641405 ) ( ON ?auto_641403 ?auto_641404 ) ( ON ?auto_641402 ?auto_641403 ) ( ON ?auto_641401 ?auto_641402 ) ( ON ?auto_641400 ?auto_641401 ) ( ON ?auto_641399 ?auto_641400 ) ( ON ?auto_641398 ?auto_641399 ) ( ON ?auto_641397 ?auto_641398 ) ( ON ?auto_641396 ?auto_641397 ) ( ON ?auto_641395 ?auto_641396 ) ( ON ?auto_641394 ?auto_641395 ) ( ON ?auto_641393 ?auto_641394 ) ( ON ?auto_641392 ?auto_641393 ) ( ON ?auto_641391 ?auto_641392 ) ( ON ?auto_641390 ?auto_641391 ) ( CLEAR ?auto_641390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_641390 )
      ( MAKE-16PILE ?auto_641390 ?auto_641391 ?auto_641392 ?auto_641393 ?auto_641394 ?auto_641395 ?auto_641396 ?auto_641397 ?auto_641398 ?auto_641399 ?auto_641400 ?auto_641401 ?auto_641402 ?auto_641403 ?auto_641404 ?auto_641405 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_641457 - BLOCK
      ?auto_641458 - BLOCK
      ?auto_641459 - BLOCK
      ?auto_641460 - BLOCK
      ?auto_641461 - BLOCK
      ?auto_641462 - BLOCK
      ?auto_641463 - BLOCK
      ?auto_641464 - BLOCK
      ?auto_641465 - BLOCK
      ?auto_641466 - BLOCK
      ?auto_641467 - BLOCK
      ?auto_641468 - BLOCK
      ?auto_641469 - BLOCK
      ?auto_641470 - BLOCK
      ?auto_641471 - BLOCK
      ?auto_641472 - BLOCK
      ?auto_641473 - BLOCK
    )
    :vars
    (
      ?auto_641474 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_641472 ) ( ON ?auto_641473 ?auto_641474 ) ( CLEAR ?auto_641473 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_641457 ) ( ON ?auto_641458 ?auto_641457 ) ( ON ?auto_641459 ?auto_641458 ) ( ON ?auto_641460 ?auto_641459 ) ( ON ?auto_641461 ?auto_641460 ) ( ON ?auto_641462 ?auto_641461 ) ( ON ?auto_641463 ?auto_641462 ) ( ON ?auto_641464 ?auto_641463 ) ( ON ?auto_641465 ?auto_641464 ) ( ON ?auto_641466 ?auto_641465 ) ( ON ?auto_641467 ?auto_641466 ) ( ON ?auto_641468 ?auto_641467 ) ( ON ?auto_641469 ?auto_641468 ) ( ON ?auto_641470 ?auto_641469 ) ( ON ?auto_641471 ?auto_641470 ) ( ON ?auto_641472 ?auto_641471 ) ( not ( = ?auto_641457 ?auto_641458 ) ) ( not ( = ?auto_641457 ?auto_641459 ) ) ( not ( = ?auto_641457 ?auto_641460 ) ) ( not ( = ?auto_641457 ?auto_641461 ) ) ( not ( = ?auto_641457 ?auto_641462 ) ) ( not ( = ?auto_641457 ?auto_641463 ) ) ( not ( = ?auto_641457 ?auto_641464 ) ) ( not ( = ?auto_641457 ?auto_641465 ) ) ( not ( = ?auto_641457 ?auto_641466 ) ) ( not ( = ?auto_641457 ?auto_641467 ) ) ( not ( = ?auto_641457 ?auto_641468 ) ) ( not ( = ?auto_641457 ?auto_641469 ) ) ( not ( = ?auto_641457 ?auto_641470 ) ) ( not ( = ?auto_641457 ?auto_641471 ) ) ( not ( = ?auto_641457 ?auto_641472 ) ) ( not ( = ?auto_641457 ?auto_641473 ) ) ( not ( = ?auto_641457 ?auto_641474 ) ) ( not ( = ?auto_641458 ?auto_641459 ) ) ( not ( = ?auto_641458 ?auto_641460 ) ) ( not ( = ?auto_641458 ?auto_641461 ) ) ( not ( = ?auto_641458 ?auto_641462 ) ) ( not ( = ?auto_641458 ?auto_641463 ) ) ( not ( = ?auto_641458 ?auto_641464 ) ) ( not ( = ?auto_641458 ?auto_641465 ) ) ( not ( = ?auto_641458 ?auto_641466 ) ) ( not ( = ?auto_641458 ?auto_641467 ) ) ( not ( = ?auto_641458 ?auto_641468 ) ) ( not ( = ?auto_641458 ?auto_641469 ) ) ( not ( = ?auto_641458 ?auto_641470 ) ) ( not ( = ?auto_641458 ?auto_641471 ) ) ( not ( = ?auto_641458 ?auto_641472 ) ) ( not ( = ?auto_641458 ?auto_641473 ) ) ( not ( = ?auto_641458 ?auto_641474 ) ) ( not ( = ?auto_641459 ?auto_641460 ) ) ( not ( = ?auto_641459 ?auto_641461 ) ) ( not ( = ?auto_641459 ?auto_641462 ) ) ( not ( = ?auto_641459 ?auto_641463 ) ) ( not ( = ?auto_641459 ?auto_641464 ) ) ( not ( = ?auto_641459 ?auto_641465 ) ) ( not ( = ?auto_641459 ?auto_641466 ) ) ( not ( = ?auto_641459 ?auto_641467 ) ) ( not ( = ?auto_641459 ?auto_641468 ) ) ( not ( = ?auto_641459 ?auto_641469 ) ) ( not ( = ?auto_641459 ?auto_641470 ) ) ( not ( = ?auto_641459 ?auto_641471 ) ) ( not ( = ?auto_641459 ?auto_641472 ) ) ( not ( = ?auto_641459 ?auto_641473 ) ) ( not ( = ?auto_641459 ?auto_641474 ) ) ( not ( = ?auto_641460 ?auto_641461 ) ) ( not ( = ?auto_641460 ?auto_641462 ) ) ( not ( = ?auto_641460 ?auto_641463 ) ) ( not ( = ?auto_641460 ?auto_641464 ) ) ( not ( = ?auto_641460 ?auto_641465 ) ) ( not ( = ?auto_641460 ?auto_641466 ) ) ( not ( = ?auto_641460 ?auto_641467 ) ) ( not ( = ?auto_641460 ?auto_641468 ) ) ( not ( = ?auto_641460 ?auto_641469 ) ) ( not ( = ?auto_641460 ?auto_641470 ) ) ( not ( = ?auto_641460 ?auto_641471 ) ) ( not ( = ?auto_641460 ?auto_641472 ) ) ( not ( = ?auto_641460 ?auto_641473 ) ) ( not ( = ?auto_641460 ?auto_641474 ) ) ( not ( = ?auto_641461 ?auto_641462 ) ) ( not ( = ?auto_641461 ?auto_641463 ) ) ( not ( = ?auto_641461 ?auto_641464 ) ) ( not ( = ?auto_641461 ?auto_641465 ) ) ( not ( = ?auto_641461 ?auto_641466 ) ) ( not ( = ?auto_641461 ?auto_641467 ) ) ( not ( = ?auto_641461 ?auto_641468 ) ) ( not ( = ?auto_641461 ?auto_641469 ) ) ( not ( = ?auto_641461 ?auto_641470 ) ) ( not ( = ?auto_641461 ?auto_641471 ) ) ( not ( = ?auto_641461 ?auto_641472 ) ) ( not ( = ?auto_641461 ?auto_641473 ) ) ( not ( = ?auto_641461 ?auto_641474 ) ) ( not ( = ?auto_641462 ?auto_641463 ) ) ( not ( = ?auto_641462 ?auto_641464 ) ) ( not ( = ?auto_641462 ?auto_641465 ) ) ( not ( = ?auto_641462 ?auto_641466 ) ) ( not ( = ?auto_641462 ?auto_641467 ) ) ( not ( = ?auto_641462 ?auto_641468 ) ) ( not ( = ?auto_641462 ?auto_641469 ) ) ( not ( = ?auto_641462 ?auto_641470 ) ) ( not ( = ?auto_641462 ?auto_641471 ) ) ( not ( = ?auto_641462 ?auto_641472 ) ) ( not ( = ?auto_641462 ?auto_641473 ) ) ( not ( = ?auto_641462 ?auto_641474 ) ) ( not ( = ?auto_641463 ?auto_641464 ) ) ( not ( = ?auto_641463 ?auto_641465 ) ) ( not ( = ?auto_641463 ?auto_641466 ) ) ( not ( = ?auto_641463 ?auto_641467 ) ) ( not ( = ?auto_641463 ?auto_641468 ) ) ( not ( = ?auto_641463 ?auto_641469 ) ) ( not ( = ?auto_641463 ?auto_641470 ) ) ( not ( = ?auto_641463 ?auto_641471 ) ) ( not ( = ?auto_641463 ?auto_641472 ) ) ( not ( = ?auto_641463 ?auto_641473 ) ) ( not ( = ?auto_641463 ?auto_641474 ) ) ( not ( = ?auto_641464 ?auto_641465 ) ) ( not ( = ?auto_641464 ?auto_641466 ) ) ( not ( = ?auto_641464 ?auto_641467 ) ) ( not ( = ?auto_641464 ?auto_641468 ) ) ( not ( = ?auto_641464 ?auto_641469 ) ) ( not ( = ?auto_641464 ?auto_641470 ) ) ( not ( = ?auto_641464 ?auto_641471 ) ) ( not ( = ?auto_641464 ?auto_641472 ) ) ( not ( = ?auto_641464 ?auto_641473 ) ) ( not ( = ?auto_641464 ?auto_641474 ) ) ( not ( = ?auto_641465 ?auto_641466 ) ) ( not ( = ?auto_641465 ?auto_641467 ) ) ( not ( = ?auto_641465 ?auto_641468 ) ) ( not ( = ?auto_641465 ?auto_641469 ) ) ( not ( = ?auto_641465 ?auto_641470 ) ) ( not ( = ?auto_641465 ?auto_641471 ) ) ( not ( = ?auto_641465 ?auto_641472 ) ) ( not ( = ?auto_641465 ?auto_641473 ) ) ( not ( = ?auto_641465 ?auto_641474 ) ) ( not ( = ?auto_641466 ?auto_641467 ) ) ( not ( = ?auto_641466 ?auto_641468 ) ) ( not ( = ?auto_641466 ?auto_641469 ) ) ( not ( = ?auto_641466 ?auto_641470 ) ) ( not ( = ?auto_641466 ?auto_641471 ) ) ( not ( = ?auto_641466 ?auto_641472 ) ) ( not ( = ?auto_641466 ?auto_641473 ) ) ( not ( = ?auto_641466 ?auto_641474 ) ) ( not ( = ?auto_641467 ?auto_641468 ) ) ( not ( = ?auto_641467 ?auto_641469 ) ) ( not ( = ?auto_641467 ?auto_641470 ) ) ( not ( = ?auto_641467 ?auto_641471 ) ) ( not ( = ?auto_641467 ?auto_641472 ) ) ( not ( = ?auto_641467 ?auto_641473 ) ) ( not ( = ?auto_641467 ?auto_641474 ) ) ( not ( = ?auto_641468 ?auto_641469 ) ) ( not ( = ?auto_641468 ?auto_641470 ) ) ( not ( = ?auto_641468 ?auto_641471 ) ) ( not ( = ?auto_641468 ?auto_641472 ) ) ( not ( = ?auto_641468 ?auto_641473 ) ) ( not ( = ?auto_641468 ?auto_641474 ) ) ( not ( = ?auto_641469 ?auto_641470 ) ) ( not ( = ?auto_641469 ?auto_641471 ) ) ( not ( = ?auto_641469 ?auto_641472 ) ) ( not ( = ?auto_641469 ?auto_641473 ) ) ( not ( = ?auto_641469 ?auto_641474 ) ) ( not ( = ?auto_641470 ?auto_641471 ) ) ( not ( = ?auto_641470 ?auto_641472 ) ) ( not ( = ?auto_641470 ?auto_641473 ) ) ( not ( = ?auto_641470 ?auto_641474 ) ) ( not ( = ?auto_641471 ?auto_641472 ) ) ( not ( = ?auto_641471 ?auto_641473 ) ) ( not ( = ?auto_641471 ?auto_641474 ) ) ( not ( = ?auto_641472 ?auto_641473 ) ) ( not ( = ?auto_641472 ?auto_641474 ) ) ( not ( = ?auto_641473 ?auto_641474 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_641473 ?auto_641474 )
      ( !STACK ?auto_641473 ?auto_641472 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_641492 - BLOCK
      ?auto_641493 - BLOCK
      ?auto_641494 - BLOCK
      ?auto_641495 - BLOCK
      ?auto_641496 - BLOCK
      ?auto_641497 - BLOCK
      ?auto_641498 - BLOCK
      ?auto_641499 - BLOCK
      ?auto_641500 - BLOCK
      ?auto_641501 - BLOCK
      ?auto_641502 - BLOCK
      ?auto_641503 - BLOCK
      ?auto_641504 - BLOCK
      ?auto_641505 - BLOCK
      ?auto_641506 - BLOCK
      ?auto_641507 - BLOCK
      ?auto_641508 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_641507 ) ( ON-TABLE ?auto_641508 ) ( CLEAR ?auto_641508 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_641492 ) ( ON ?auto_641493 ?auto_641492 ) ( ON ?auto_641494 ?auto_641493 ) ( ON ?auto_641495 ?auto_641494 ) ( ON ?auto_641496 ?auto_641495 ) ( ON ?auto_641497 ?auto_641496 ) ( ON ?auto_641498 ?auto_641497 ) ( ON ?auto_641499 ?auto_641498 ) ( ON ?auto_641500 ?auto_641499 ) ( ON ?auto_641501 ?auto_641500 ) ( ON ?auto_641502 ?auto_641501 ) ( ON ?auto_641503 ?auto_641502 ) ( ON ?auto_641504 ?auto_641503 ) ( ON ?auto_641505 ?auto_641504 ) ( ON ?auto_641506 ?auto_641505 ) ( ON ?auto_641507 ?auto_641506 ) ( not ( = ?auto_641492 ?auto_641493 ) ) ( not ( = ?auto_641492 ?auto_641494 ) ) ( not ( = ?auto_641492 ?auto_641495 ) ) ( not ( = ?auto_641492 ?auto_641496 ) ) ( not ( = ?auto_641492 ?auto_641497 ) ) ( not ( = ?auto_641492 ?auto_641498 ) ) ( not ( = ?auto_641492 ?auto_641499 ) ) ( not ( = ?auto_641492 ?auto_641500 ) ) ( not ( = ?auto_641492 ?auto_641501 ) ) ( not ( = ?auto_641492 ?auto_641502 ) ) ( not ( = ?auto_641492 ?auto_641503 ) ) ( not ( = ?auto_641492 ?auto_641504 ) ) ( not ( = ?auto_641492 ?auto_641505 ) ) ( not ( = ?auto_641492 ?auto_641506 ) ) ( not ( = ?auto_641492 ?auto_641507 ) ) ( not ( = ?auto_641492 ?auto_641508 ) ) ( not ( = ?auto_641493 ?auto_641494 ) ) ( not ( = ?auto_641493 ?auto_641495 ) ) ( not ( = ?auto_641493 ?auto_641496 ) ) ( not ( = ?auto_641493 ?auto_641497 ) ) ( not ( = ?auto_641493 ?auto_641498 ) ) ( not ( = ?auto_641493 ?auto_641499 ) ) ( not ( = ?auto_641493 ?auto_641500 ) ) ( not ( = ?auto_641493 ?auto_641501 ) ) ( not ( = ?auto_641493 ?auto_641502 ) ) ( not ( = ?auto_641493 ?auto_641503 ) ) ( not ( = ?auto_641493 ?auto_641504 ) ) ( not ( = ?auto_641493 ?auto_641505 ) ) ( not ( = ?auto_641493 ?auto_641506 ) ) ( not ( = ?auto_641493 ?auto_641507 ) ) ( not ( = ?auto_641493 ?auto_641508 ) ) ( not ( = ?auto_641494 ?auto_641495 ) ) ( not ( = ?auto_641494 ?auto_641496 ) ) ( not ( = ?auto_641494 ?auto_641497 ) ) ( not ( = ?auto_641494 ?auto_641498 ) ) ( not ( = ?auto_641494 ?auto_641499 ) ) ( not ( = ?auto_641494 ?auto_641500 ) ) ( not ( = ?auto_641494 ?auto_641501 ) ) ( not ( = ?auto_641494 ?auto_641502 ) ) ( not ( = ?auto_641494 ?auto_641503 ) ) ( not ( = ?auto_641494 ?auto_641504 ) ) ( not ( = ?auto_641494 ?auto_641505 ) ) ( not ( = ?auto_641494 ?auto_641506 ) ) ( not ( = ?auto_641494 ?auto_641507 ) ) ( not ( = ?auto_641494 ?auto_641508 ) ) ( not ( = ?auto_641495 ?auto_641496 ) ) ( not ( = ?auto_641495 ?auto_641497 ) ) ( not ( = ?auto_641495 ?auto_641498 ) ) ( not ( = ?auto_641495 ?auto_641499 ) ) ( not ( = ?auto_641495 ?auto_641500 ) ) ( not ( = ?auto_641495 ?auto_641501 ) ) ( not ( = ?auto_641495 ?auto_641502 ) ) ( not ( = ?auto_641495 ?auto_641503 ) ) ( not ( = ?auto_641495 ?auto_641504 ) ) ( not ( = ?auto_641495 ?auto_641505 ) ) ( not ( = ?auto_641495 ?auto_641506 ) ) ( not ( = ?auto_641495 ?auto_641507 ) ) ( not ( = ?auto_641495 ?auto_641508 ) ) ( not ( = ?auto_641496 ?auto_641497 ) ) ( not ( = ?auto_641496 ?auto_641498 ) ) ( not ( = ?auto_641496 ?auto_641499 ) ) ( not ( = ?auto_641496 ?auto_641500 ) ) ( not ( = ?auto_641496 ?auto_641501 ) ) ( not ( = ?auto_641496 ?auto_641502 ) ) ( not ( = ?auto_641496 ?auto_641503 ) ) ( not ( = ?auto_641496 ?auto_641504 ) ) ( not ( = ?auto_641496 ?auto_641505 ) ) ( not ( = ?auto_641496 ?auto_641506 ) ) ( not ( = ?auto_641496 ?auto_641507 ) ) ( not ( = ?auto_641496 ?auto_641508 ) ) ( not ( = ?auto_641497 ?auto_641498 ) ) ( not ( = ?auto_641497 ?auto_641499 ) ) ( not ( = ?auto_641497 ?auto_641500 ) ) ( not ( = ?auto_641497 ?auto_641501 ) ) ( not ( = ?auto_641497 ?auto_641502 ) ) ( not ( = ?auto_641497 ?auto_641503 ) ) ( not ( = ?auto_641497 ?auto_641504 ) ) ( not ( = ?auto_641497 ?auto_641505 ) ) ( not ( = ?auto_641497 ?auto_641506 ) ) ( not ( = ?auto_641497 ?auto_641507 ) ) ( not ( = ?auto_641497 ?auto_641508 ) ) ( not ( = ?auto_641498 ?auto_641499 ) ) ( not ( = ?auto_641498 ?auto_641500 ) ) ( not ( = ?auto_641498 ?auto_641501 ) ) ( not ( = ?auto_641498 ?auto_641502 ) ) ( not ( = ?auto_641498 ?auto_641503 ) ) ( not ( = ?auto_641498 ?auto_641504 ) ) ( not ( = ?auto_641498 ?auto_641505 ) ) ( not ( = ?auto_641498 ?auto_641506 ) ) ( not ( = ?auto_641498 ?auto_641507 ) ) ( not ( = ?auto_641498 ?auto_641508 ) ) ( not ( = ?auto_641499 ?auto_641500 ) ) ( not ( = ?auto_641499 ?auto_641501 ) ) ( not ( = ?auto_641499 ?auto_641502 ) ) ( not ( = ?auto_641499 ?auto_641503 ) ) ( not ( = ?auto_641499 ?auto_641504 ) ) ( not ( = ?auto_641499 ?auto_641505 ) ) ( not ( = ?auto_641499 ?auto_641506 ) ) ( not ( = ?auto_641499 ?auto_641507 ) ) ( not ( = ?auto_641499 ?auto_641508 ) ) ( not ( = ?auto_641500 ?auto_641501 ) ) ( not ( = ?auto_641500 ?auto_641502 ) ) ( not ( = ?auto_641500 ?auto_641503 ) ) ( not ( = ?auto_641500 ?auto_641504 ) ) ( not ( = ?auto_641500 ?auto_641505 ) ) ( not ( = ?auto_641500 ?auto_641506 ) ) ( not ( = ?auto_641500 ?auto_641507 ) ) ( not ( = ?auto_641500 ?auto_641508 ) ) ( not ( = ?auto_641501 ?auto_641502 ) ) ( not ( = ?auto_641501 ?auto_641503 ) ) ( not ( = ?auto_641501 ?auto_641504 ) ) ( not ( = ?auto_641501 ?auto_641505 ) ) ( not ( = ?auto_641501 ?auto_641506 ) ) ( not ( = ?auto_641501 ?auto_641507 ) ) ( not ( = ?auto_641501 ?auto_641508 ) ) ( not ( = ?auto_641502 ?auto_641503 ) ) ( not ( = ?auto_641502 ?auto_641504 ) ) ( not ( = ?auto_641502 ?auto_641505 ) ) ( not ( = ?auto_641502 ?auto_641506 ) ) ( not ( = ?auto_641502 ?auto_641507 ) ) ( not ( = ?auto_641502 ?auto_641508 ) ) ( not ( = ?auto_641503 ?auto_641504 ) ) ( not ( = ?auto_641503 ?auto_641505 ) ) ( not ( = ?auto_641503 ?auto_641506 ) ) ( not ( = ?auto_641503 ?auto_641507 ) ) ( not ( = ?auto_641503 ?auto_641508 ) ) ( not ( = ?auto_641504 ?auto_641505 ) ) ( not ( = ?auto_641504 ?auto_641506 ) ) ( not ( = ?auto_641504 ?auto_641507 ) ) ( not ( = ?auto_641504 ?auto_641508 ) ) ( not ( = ?auto_641505 ?auto_641506 ) ) ( not ( = ?auto_641505 ?auto_641507 ) ) ( not ( = ?auto_641505 ?auto_641508 ) ) ( not ( = ?auto_641506 ?auto_641507 ) ) ( not ( = ?auto_641506 ?auto_641508 ) ) ( not ( = ?auto_641507 ?auto_641508 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_641508 )
      ( !STACK ?auto_641508 ?auto_641507 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_641526 - BLOCK
      ?auto_641527 - BLOCK
      ?auto_641528 - BLOCK
      ?auto_641529 - BLOCK
      ?auto_641530 - BLOCK
      ?auto_641531 - BLOCK
      ?auto_641532 - BLOCK
      ?auto_641533 - BLOCK
      ?auto_641534 - BLOCK
      ?auto_641535 - BLOCK
      ?auto_641536 - BLOCK
      ?auto_641537 - BLOCK
      ?auto_641538 - BLOCK
      ?auto_641539 - BLOCK
      ?auto_641540 - BLOCK
      ?auto_641541 - BLOCK
      ?auto_641542 - BLOCK
    )
    :vars
    (
      ?auto_641543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_641542 ?auto_641543 ) ( ON-TABLE ?auto_641526 ) ( ON ?auto_641527 ?auto_641526 ) ( ON ?auto_641528 ?auto_641527 ) ( ON ?auto_641529 ?auto_641528 ) ( ON ?auto_641530 ?auto_641529 ) ( ON ?auto_641531 ?auto_641530 ) ( ON ?auto_641532 ?auto_641531 ) ( ON ?auto_641533 ?auto_641532 ) ( ON ?auto_641534 ?auto_641533 ) ( ON ?auto_641535 ?auto_641534 ) ( ON ?auto_641536 ?auto_641535 ) ( ON ?auto_641537 ?auto_641536 ) ( ON ?auto_641538 ?auto_641537 ) ( ON ?auto_641539 ?auto_641538 ) ( ON ?auto_641540 ?auto_641539 ) ( not ( = ?auto_641526 ?auto_641527 ) ) ( not ( = ?auto_641526 ?auto_641528 ) ) ( not ( = ?auto_641526 ?auto_641529 ) ) ( not ( = ?auto_641526 ?auto_641530 ) ) ( not ( = ?auto_641526 ?auto_641531 ) ) ( not ( = ?auto_641526 ?auto_641532 ) ) ( not ( = ?auto_641526 ?auto_641533 ) ) ( not ( = ?auto_641526 ?auto_641534 ) ) ( not ( = ?auto_641526 ?auto_641535 ) ) ( not ( = ?auto_641526 ?auto_641536 ) ) ( not ( = ?auto_641526 ?auto_641537 ) ) ( not ( = ?auto_641526 ?auto_641538 ) ) ( not ( = ?auto_641526 ?auto_641539 ) ) ( not ( = ?auto_641526 ?auto_641540 ) ) ( not ( = ?auto_641526 ?auto_641541 ) ) ( not ( = ?auto_641526 ?auto_641542 ) ) ( not ( = ?auto_641526 ?auto_641543 ) ) ( not ( = ?auto_641527 ?auto_641528 ) ) ( not ( = ?auto_641527 ?auto_641529 ) ) ( not ( = ?auto_641527 ?auto_641530 ) ) ( not ( = ?auto_641527 ?auto_641531 ) ) ( not ( = ?auto_641527 ?auto_641532 ) ) ( not ( = ?auto_641527 ?auto_641533 ) ) ( not ( = ?auto_641527 ?auto_641534 ) ) ( not ( = ?auto_641527 ?auto_641535 ) ) ( not ( = ?auto_641527 ?auto_641536 ) ) ( not ( = ?auto_641527 ?auto_641537 ) ) ( not ( = ?auto_641527 ?auto_641538 ) ) ( not ( = ?auto_641527 ?auto_641539 ) ) ( not ( = ?auto_641527 ?auto_641540 ) ) ( not ( = ?auto_641527 ?auto_641541 ) ) ( not ( = ?auto_641527 ?auto_641542 ) ) ( not ( = ?auto_641527 ?auto_641543 ) ) ( not ( = ?auto_641528 ?auto_641529 ) ) ( not ( = ?auto_641528 ?auto_641530 ) ) ( not ( = ?auto_641528 ?auto_641531 ) ) ( not ( = ?auto_641528 ?auto_641532 ) ) ( not ( = ?auto_641528 ?auto_641533 ) ) ( not ( = ?auto_641528 ?auto_641534 ) ) ( not ( = ?auto_641528 ?auto_641535 ) ) ( not ( = ?auto_641528 ?auto_641536 ) ) ( not ( = ?auto_641528 ?auto_641537 ) ) ( not ( = ?auto_641528 ?auto_641538 ) ) ( not ( = ?auto_641528 ?auto_641539 ) ) ( not ( = ?auto_641528 ?auto_641540 ) ) ( not ( = ?auto_641528 ?auto_641541 ) ) ( not ( = ?auto_641528 ?auto_641542 ) ) ( not ( = ?auto_641528 ?auto_641543 ) ) ( not ( = ?auto_641529 ?auto_641530 ) ) ( not ( = ?auto_641529 ?auto_641531 ) ) ( not ( = ?auto_641529 ?auto_641532 ) ) ( not ( = ?auto_641529 ?auto_641533 ) ) ( not ( = ?auto_641529 ?auto_641534 ) ) ( not ( = ?auto_641529 ?auto_641535 ) ) ( not ( = ?auto_641529 ?auto_641536 ) ) ( not ( = ?auto_641529 ?auto_641537 ) ) ( not ( = ?auto_641529 ?auto_641538 ) ) ( not ( = ?auto_641529 ?auto_641539 ) ) ( not ( = ?auto_641529 ?auto_641540 ) ) ( not ( = ?auto_641529 ?auto_641541 ) ) ( not ( = ?auto_641529 ?auto_641542 ) ) ( not ( = ?auto_641529 ?auto_641543 ) ) ( not ( = ?auto_641530 ?auto_641531 ) ) ( not ( = ?auto_641530 ?auto_641532 ) ) ( not ( = ?auto_641530 ?auto_641533 ) ) ( not ( = ?auto_641530 ?auto_641534 ) ) ( not ( = ?auto_641530 ?auto_641535 ) ) ( not ( = ?auto_641530 ?auto_641536 ) ) ( not ( = ?auto_641530 ?auto_641537 ) ) ( not ( = ?auto_641530 ?auto_641538 ) ) ( not ( = ?auto_641530 ?auto_641539 ) ) ( not ( = ?auto_641530 ?auto_641540 ) ) ( not ( = ?auto_641530 ?auto_641541 ) ) ( not ( = ?auto_641530 ?auto_641542 ) ) ( not ( = ?auto_641530 ?auto_641543 ) ) ( not ( = ?auto_641531 ?auto_641532 ) ) ( not ( = ?auto_641531 ?auto_641533 ) ) ( not ( = ?auto_641531 ?auto_641534 ) ) ( not ( = ?auto_641531 ?auto_641535 ) ) ( not ( = ?auto_641531 ?auto_641536 ) ) ( not ( = ?auto_641531 ?auto_641537 ) ) ( not ( = ?auto_641531 ?auto_641538 ) ) ( not ( = ?auto_641531 ?auto_641539 ) ) ( not ( = ?auto_641531 ?auto_641540 ) ) ( not ( = ?auto_641531 ?auto_641541 ) ) ( not ( = ?auto_641531 ?auto_641542 ) ) ( not ( = ?auto_641531 ?auto_641543 ) ) ( not ( = ?auto_641532 ?auto_641533 ) ) ( not ( = ?auto_641532 ?auto_641534 ) ) ( not ( = ?auto_641532 ?auto_641535 ) ) ( not ( = ?auto_641532 ?auto_641536 ) ) ( not ( = ?auto_641532 ?auto_641537 ) ) ( not ( = ?auto_641532 ?auto_641538 ) ) ( not ( = ?auto_641532 ?auto_641539 ) ) ( not ( = ?auto_641532 ?auto_641540 ) ) ( not ( = ?auto_641532 ?auto_641541 ) ) ( not ( = ?auto_641532 ?auto_641542 ) ) ( not ( = ?auto_641532 ?auto_641543 ) ) ( not ( = ?auto_641533 ?auto_641534 ) ) ( not ( = ?auto_641533 ?auto_641535 ) ) ( not ( = ?auto_641533 ?auto_641536 ) ) ( not ( = ?auto_641533 ?auto_641537 ) ) ( not ( = ?auto_641533 ?auto_641538 ) ) ( not ( = ?auto_641533 ?auto_641539 ) ) ( not ( = ?auto_641533 ?auto_641540 ) ) ( not ( = ?auto_641533 ?auto_641541 ) ) ( not ( = ?auto_641533 ?auto_641542 ) ) ( not ( = ?auto_641533 ?auto_641543 ) ) ( not ( = ?auto_641534 ?auto_641535 ) ) ( not ( = ?auto_641534 ?auto_641536 ) ) ( not ( = ?auto_641534 ?auto_641537 ) ) ( not ( = ?auto_641534 ?auto_641538 ) ) ( not ( = ?auto_641534 ?auto_641539 ) ) ( not ( = ?auto_641534 ?auto_641540 ) ) ( not ( = ?auto_641534 ?auto_641541 ) ) ( not ( = ?auto_641534 ?auto_641542 ) ) ( not ( = ?auto_641534 ?auto_641543 ) ) ( not ( = ?auto_641535 ?auto_641536 ) ) ( not ( = ?auto_641535 ?auto_641537 ) ) ( not ( = ?auto_641535 ?auto_641538 ) ) ( not ( = ?auto_641535 ?auto_641539 ) ) ( not ( = ?auto_641535 ?auto_641540 ) ) ( not ( = ?auto_641535 ?auto_641541 ) ) ( not ( = ?auto_641535 ?auto_641542 ) ) ( not ( = ?auto_641535 ?auto_641543 ) ) ( not ( = ?auto_641536 ?auto_641537 ) ) ( not ( = ?auto_641536 ?auto_641538 ) ) ( not ( = ?auto_641536 ?auto_641539 ) ) ( not ( = ?auto_641536 ?auto_641540 ) ) ( not ( = ?auto_641536 ?auto_641541 ) ) ( not ( = ?auto_641536 ?auto_641542 ) ) ( not ( = ?auto_641536 ?auto_641543 ) ) ( not ( = ?auto_641537 ?auto_641538 ) ) ( not ( = ?auto_641537 ?auto_641539 ) ) ( not ( = ?auto_641537 ?auto_641540 ) ) ( not ( = ?auto_641537 ?auto_641541 ) ) ( not ( = ?auto_641537 ?auto_641542 ) ) ( not ( = ?auto_641537 ?auto_641543 ) ) ( not ( = ?auto_641538 ?auto_641539 ) ) ( not ( = ?auto_641538 ?auto_641540 ) ) ( not ( = ?auto_641538 ?auto_641541 ) ) ( not ( = ?auto_641538 ?auto_641542 ) ) ( not ( = ?auto_641538 ?auto_641543 ) ) ( not ( = ?auto_641539 ?auto_641540 ) ) ( not ( = ?auto_641539 ?auto_641541 ) ) ( not ( = ?auto_641539 ?auto_641542 ) ) ( not ( = ?auto_641539 ?auto_641543 ) ) ( not ( = ?auto_641540 ?auto_641541 ) ) ( not ( = ?auto_641540 ?auto_641542 ) ) ( not ( = ?auto_641540 ?auto_641543 ) ) ( not ( = ?auto_641541 ?auto_641542 ) ) ( not ( = ?auto_641541 ?auto_641543 ) ) ( not ( = ?auto_641542 ?auto_641543 ) ) ( CLEAR ?auto_641540 ) ( ON ?auto_641541 ?auto_641542 ) ( CLEAR ?auto_641541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_641526 ?auto_641527 ?auto_641528 ?auto_641529 ?auto_641530 ?auto_641531 ?auto_641532 ?auto_641533 ?auto_641534 ?auto_641535 ?auto_641536 ?auto_641537 ?auto_641538 ?auto_641539 ?auto_641540 ?auto_641541 )
      ( MAKE-17PILE ?auto_641526 ?auto_641527 ?auto_641528 ?auto_641529 ?auto_641530 ?auto_641531 ?auto_641532 ?auto_641533 ?auto_641534 ?auto_641535 ?auto_641536 ?auto_641537 ?auto_641538 ?auto_641539 ?auto_641540 ?auto_641541 ?auto_641542 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_641561 - BLOCK
      ?auto_641562 - BLOCK
      ?auto_641563 - BLOCK
      ?auto_641564 - BLOCK
      ?auto_641565 - BLOCK
      ?auto_641566 - BLOCK
      ?auto_641567 - BLOCK
      ?auto_641568 - BLOCK
      ?auto_641569 - BLOCK
      ?auto_641570 - BLOCK
      ?auto_641571 - BLOCK
      ?auto_641572 - BLOCK
      ?auto_641573 - BLOCK
      ?auto_641574 - BLOCK
      ?auto_641575 - BLOCK
      ?auto_641576 - BLOCK
      ?auto_641577 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_641577 ) ( ON-TABLE ?auto_641561 ) ( ON ?auto_641562 ?auto_641561 ) ( ON ?auto_641563 ?auto_641562 ) ( ON ?auto_641564 ?auto_641563 ) ( ON ?auto_641565 ?auto_641564 ) ( ON ?auto_641566 ?auto_641565 ) ( ON ?auto_641567 ?auto_641566 ) ( ON ?auto_641568 ?auto_641567 ) ( ON ?auto_641569 ?auto_641568 ) ( ON ?auto_641570 ?auto_641569 ) ( ON ?auto_641571 ?auto_641570 ) ( ON ?auto_641572 ?auto_641571 ) ( ON ?auto_641573 ?auto_641572 ) ( ON ?auto_641574 ?auto_641573 ) ( ON ?auto_641575 ?auto_641574 ) ( not ( = ?auto_641561 ?auto_641562 ) ) ( not ( = ?auto_641561 ?auto_641563 ) ) ( not ( = ?auto_641561 ?auto_641564 ) ) ( not ( = ?auto_641561 ?auto_641565 ) ) ( not ( = ?auto_641561 ?auto_641566 ) ) ( not ( = ?auto_641561 ?auto_641567 ) ) ( not ( = ?auto_641561 ?auto_641568 ) ) ( not ( = ?auto_641561 ?auto_641569 ) ) ( not ( = ?auto_641561 ?auto_641570 ) ) ( not ( = ?auto_641561 ?auto_641571 ) ) ( not ( = ?auto_641561 ?auto_641572 ) ) ( not ( = ?auto_641561 ?auto_641573 ) ) ( not ( = ?auto_641561 ?auto_641574 ) ) ( not ( = ?auto_641561 ?auto_641575 ) ) ( not ( = ?auto_641561 ?auto_641576 ) ) ( not ( = ?auto_641561 ?auto_641577 ) ) ( not ( = ?auto_641562 ?auto_641563 ) ) ( not ( = ?auto_641562 ?auto_641564 ) ) ( not ( = ?auto_641562 ?auto_641565 ) ) ( not ( = ?auto_641562 ?auto_641566 ) ) ( not ( = ?auto_641562 ?auto_641567 ) ) ( not ( = ?auto_641562 ?auto_641568 ) ) ( not ( = ?auto_641562 ?auto_641569 ) ) ( not ( = ?auto_641562 ?auto_641570 ) ) ( not ( = ?auto_641562 ?auto_641571 ) ) ( not ( = ?auto_641562 ?auto_641572 ) ) ( not ( = ?auto_641562 ?auto_641573 ) ) ( not ( = ?auto_641562 ?auto_641574 ) ) ( not ( = ?auto_641562 ?auto_641575 ) ) ( not ( = ?auto_641562 ?auto_641576 ) ) ( not ( = ?auto_641562 ?auto_641577 ) ) ( not ( = ?auto_641563 ?auto_641564 ) ) ( not ( = ?auto_641563 ?auto_641565 ) ) ( not ( = ?auto_641563 ?auto_641566 ) ) ( not ( = ?auto_641563 ?auto_641567 ) ) ( not ( = ?auto_641563 ?auto_641568 ) ) ( not ( = ?auto_641563 ?auto_641569 ) ) ( not ( = ?auto_641563 ?auto_641570 ) ) ( not ( = ?auto_641563 ?auto_641571 ) ) ( not ( = ?auto_641563 ?auto_641572 ) ) ( not ( = ?auto_641563 ?auto_641573 ) ) ( not ( = ?auto_641563 ?auto_641574 ) ) ( not ( = ?auto_641563 ?auto_641575 ) ) ( not ( = ?auto_641563 ?auto_641576 ) ) ( not ( = ?auto_641563 ?auto_641577 ) ) ( not ( = ?auto_641564 ?auto_641565 ) ) ( not ( = ?auto_641564 ?auto_641566 ) ) ( not ( = ?auto_641564 ?auto_641567 ) ) ( not ( = ?auto_641564 ?auto_641568 ) ) ( not ( = ?auto_641564 ?auto_641569 ) ) ( not ( = ?auto_641564 ?auto_641570 ) ) ( not ( = ?auto_641564 ?auto_641571 ) ) ( not ( = ?auto_641564 ?auto_641572 ) ) ( not ( = ?auto_641564 ?auto_641573 ) ) ( not ( = ?auto_641564 ?auto_641574 ) ) ( not ( = ?auto_641564 ?auto_641575 ) ) ( not ( = ?auto_641564 ?auto_641576 ) ) ( not ( = ?auto_641564 ?auto_641577 ) ) ( not ( = ?auto_641565 ?auto_641566 ) ) ( not ( = ?auto_641565 ?auto_641567 ) ) ( not ( = ?auto_641565 ?auto_641568 ) ) ( not ( = ?auto_641565 ?auto_641569 ) ) ( not ( = ?auto_641565 ?auto_641570 ) ) ( not ( = ?auto_641565 ?auto_641571 ) ) ( not ( = ?auto_641565 ?auto_641572 ) ) ( not ( = ?auto_641565 ?auto_641573 ) ) ( not ( = ?auto_641565 ?auto_641574 ) ) ( not ( = ?auto_641565 ?auto_641575 ) ) ( not ( = ?auto_641565 ?auto_641576 ) ) ( not ( = ?auto_641565 ?auto_641577 ) ) ( not ( = ?auto_641566 ?auto_641567 ) ) ( not ( = ?auto_641566 ?auto_641568 ) ) ( not ( = ?auto_641566 ?auto_641569 ) ) ( not ( = ?auto_641566 ?auto_641570 ) ) ( not ( = ?auto_641566 ?auto_641571 ) ) ( not ( = ?auto_641566 ?auto_641572 ) ) ( not ( = ?auto_641566 ?auto_641573 ) ) ( not ( = ?auto_641566 ?auto_641574 ) ) ( not ( = ?auto_641566 ?auto_641575 ) ) ( not ( = ?auto_641566 ?auto_641576 ) ) ( not ( = ?auto_641566 ?auto_641577 ) ) ( not ( = ?auto_641567 ?auto_641568 ) ) ( not ( = ?auto_641567 ?auto_641569 ) ) ( not ( = ?auto_641567 ?auto_641570 ) ) ( not ( = ?auto_641567 ?auto_641571 ) ) ( not ( = ?auto_641567 ?auto_641572 ) ) ( not ( = ?auto_641567 ?auto_641573 ) ) ( not ( = ?auto_641567 ?auto_641574 ) ) ( not ( = ?auto_641567 ?auto_641575 ) ) ( not ( = ?auto_641567 ?auto_641576 ) ) ( not ( = ?auto_641567 ?auto_641577 ) ) ( not ( = ?auto_641568 ?auto_641569 ) ) ( not ( = ?auto_641568 ?auto_641570 ) ) ( not ( = ?auto_641568 ?auto_641571 ) ) ( not ( = ?auto_641568 ?auto_641572 ) ) ( not ( = ?auto_641568 ?auto_641573 ) ) ( not ( = ?auto_641568 ?auto_641574 ) ) ( not ( = ?auto_641568 ?auto_641575 ) ) ( not ( = ?auto_641568 ?auto_641576 ) ) ( not ( = ?auto_641568 ?auto_641577 ) ) ( not ( = ?auto_641569 ?auto_641570 ) ) ( not ( = ?auto_641569 ?auto_641571 ) ) ( not ( = ?auto_641569 ?auto_641572 ) ) ( not ( = ?auto_641569 ?auto_641573 ) ) ( not ( = ?auto_641569 ?auto_641574 ) ) ( not ( = ?auto_641569 ?auto_641575 ) ) ( not ( = ?auto_641569 ?auto_641576 ) ) ( not ( = ?auto_641569 ?auto_641577 ) ) ( not ( = ?auto_641570 ?auto_641571 ) ) ( not ( = ?auto_641570 ?auto_641572 ) ) ( not ( = ?auto_641570 ?auto_641573 ) ) ( not ( = ?auto_641570 ?auto_641574 ) ) ( not ( = ?auto_641570 ?auto_641575 ) ) ( not ( = ?auto_641570 ?auto_641576 ) ) ( not ( = ?auto_641570 ?auto_641577 ) ) ( not ( = ?auto_641571 ?auto_641572 ) ) ( not ( = ?auto_641571 ?auto_641573 ) ) ( not ( = ?auto_641571 ?auto_641574 ) ) ( not ( = ?auto_641571 ?auto_641575 ) ) ( not ( = ?auto_641571 ?auto_641576 ) ) ( not ( = ?auto_641571 ?auto_641577 ) ) ( not ( = ?auto_641572 ?auto_641573 ) ) ( not ( = ?auto_641572 ?auto_641574 ) ) ( not ( = ?auto_641572 ?auto_641575 ) ) ( not ( = ?auto_641572 ?auto_641576 ) ) ( not ( = ?auto_641572 ?auto_641577 ) ) ( not ( = ?auto_641573 ?auto_641574 ) ) ( not ( = ?auto_641573 ?auto_641575 ) ) ( not ( = ?auto_641573 ?auto_641576 ) ) ( not ( = ?auto_641573 ?auto_641577 ) ) ( not ( = ?auto_641574 ?auto_641575 ) ) ( not ( = ?auto_641574 ?auto_641576 ) ) ( not ( = ?auto_641574 ?auto_641577 ) ) ( not ( = ?auto_641575 ?auto_641576 ) ) ( not ( = ?auto_641575 ?auto_641577 ) ) ( not ( = ?auto_641576 ?auto_641577 ) ) ( CLEAR ?auto_641575 ) ( ON ?auto_641576 ?auto_641577 ) ( CLEAR ?auto_641576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_641561 ?auto_641562 ?auto_641563 ?auto_641564 ?auto_641565 ?auto_641566 ?auto_641567 ?auto_641568 ?auto_641569 ?auto_641570 ?auto_641571 ?auto_641572 ?auto_641573 ?auto_641574 ?auto_641575 ?auto_641576 )
      ( MAKE-17PILE ?auto_641561 ?auto_641562 ?auto_641563 ?auto_641564 ?auto_641565 ?auto_641566 ?auto_641567 ?auto_641568 ?auto_641569 ?auto_641570 ?auto_641571 ?auto_641572 ?auto_641573 ?auto_641574 ?auto_641575 ?auto_641576 ?auto_641577 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_641595 - BLOCK
      ?auto_641596 - BLOCK
      ?auto_641597 - BLOCK
      ?auto_641598 - BLOCK
      ?auto_641599 - BLOCK
      ?auto_641600 - BLOCK
      ?auto_641601 - BLOCK
      ?auto_641602 - BLOCK
      ?auto_641603 - BLOCK
      ?auto_641604 - BLOCK
      ?auto_641605 - BLOCK
      ?auto_641606 - BLOCK
      ?auto_641607 - BLOCK
      ?auto_641608 - BLOCK
      ?auto_641609 - BLOCK
      ?auto_641610 - BLOCK
      ?auto_641611 - BLOCK
    )
    :vars
    (
      ?auto_641612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_641611 ?auto_641612 ) ( ON-TABLE ?auto_641595 ) ( ON ?auto_641596 ?auto_641595 ) ( ON ?auto_641597 ?auto_641596 ) ( ON ?auto_641598 ?auto_641597 ) ( ON ?auto_641599 ?auto_641598 ) ( ON ?auto_641600 ?auto_641599 ) ( ON ?auto_641601 ?auto_641600 ) ( ON ?auto_641602 ?auto_641601 ) ( ON ?auto_641603 ?auto_641602 ) ( ON ?auto_641604 ?auto_641603 ) ( ON ?auto_641605 ?auto_641604 ) ( ON ?auto_641606 ?auto_641605 ) ( ON ?auto_641607 ?auto_641606 ) ( ON ?auto_641608 ?auto_641607 ) ( not ( = ?auto_641595 ?auto_641596 ) ) ( not ( = ?auto_641595 ?auto_641597 ) ) ( not ( = ?auto_641595 ?auto_641598 ) ) ( not ( = ?auto_641595 ?auto_641599 ) ) ( not ( = ?auto_641595 ?auto_641600 ) ) ( not ( = ?auto_641595 ?auto_641601 ) ) ( not ( = ?auto_641595 ?auto_641602 ) ) ( not ( = ?auto_641595 ?auto_641603 ) ) ( not ( = ?auto_641595 ?auto_641604 ) ) ( not ( = ?auto_641595 ?auto_641605 ) ) ( not ( = ?auto_641595 ?auto_641606 ) ) ( not ( = ?auto_641595 ?auto_641607 ) ) ( not ( = ?auto_641595 ?auto_641608 ) ) ( not ( = ?auto_641595 ?auto_641609 ) ) ( not ( = ?auto_641595 ?auto_641610 ) ) ( not ( = ?auto_641595 ?auto_641611 ) ) ( not ( = ?auto_641595 ?auto_641612 ) ) ( not ( = ?auto_641596 ?auto_641597 ) ) ( not ( = ?auto_641596 ?auto_641598 ) ) ( not ( = ?auto_641596 ?auto_641599 ) ) ( not ( = ?auto_641596 ?auto_641600 ) ) ( not ( = ?auto_641596 ?auto_641601 ) ) ( not ( = ?auto_641596 ?auto_641602 ) ) ( not ( = ?auto_641596 ?auto_641603 ) ) ( not ( = ?auto_641596 ?auto_641604 ) ) ( not ( = ?auto_641596 ?auto_641605 ) ) ( not ( = ?auto_641596 ?auto_641606 ) ) ( not ( = ?auto_641596 ?auto_641607 ) ) ( not ( = ?auto_641596 ?auto_641608 ) ) ( not ( = ?auto_641596 ?auto_641609 ) ) ( not ( = ?auto_641596 ?auto_641610 ) ) ( not ( = ?auto_641596 ?auto_641611 ) ) ( not ( = ?auto_641596 ?auto_641612 ) ) ( not ( = ?auto_641597 ?auto_641598 ) ) ( not ( = ?auto_641597 ?auto_641599 ) ) ( not ( = ?auto_641597 ?auto_641600 ) ) ( not ( = ?auto_641597 ?auto_641601 ) ) ( not ( = ?auto_641597 ?auto_641602 ) ) ( not ( = ?auto_641597 ?auto_641603 ) ) ( not ( = ?auto_641597 ?auto_641604 ) ) ( not ( = ?auto_641597 ?auto_641605 ) ) ( not ( = ?auto_641597 ?auto_641606 ) ) ( not ( = ?auto_641597 ?auto_641607 ) ) ( not ( = ?auto_641597 ?auto_641608 ) ) ( not ( = ?auto_641597 ?auto_641609 ) ) ( not ( = ?auto_641597 ?auto_641610 ) ) ( not ( = ?auto_641597 ?auto_641611 ) ) ( not ( = ?auto_641597 ?auto_641612 ) ) ( not ( = ?auto_641598 ?auto_641599 ) ) ( not ( = ?auto_641598 ?auto_641600 ) ) ( not ( = ?auto_641598 ?auto_641601 ) ) ( not ( = ?auto_641598 ?auto_641602 ) ) ( not ( = ?auto_641598 ?auto_641603 ) ) ( not ( = ?auto_641598 ?auto_641604 ) ) ( not ( = ?auto_641598 ?auto_641605 ) ) ( not ( = ?auto_641598 ?auto_641606 ) ) ( not ( = ?auto_641598 ?auto_641607 ) ) ( not ( = ?auto_641598 ?auto_641608 ) ) ( not ( = ?auto_641598 ?auto_641609 ) ) ( not ( = ?auto_641598 ?auto_641610 ) ) ( not ( = ?auto_641598 ?auto_641611 ) ) ( not ( = ?auto_641598 ?auto_641612 ) ) ( not ( = ?auto_641599 ?auto_641600 ) ) ( not ( = ?auto_641599 ?auto_641601 ) ) ( not ( = ?auto_641599 ?auto_641602 ) ) ( not ( = ?auto_641599 ?auto_641603 ) ) ( not ( = ?auto_641599 ?auto_641604 ) ) ( not ( = ?auto_641599 ?auto_641605 ) ) ( not ( = ?auto_641599 ?auto_641606 ) ) ( not ( = ?auto_641599 ?auto_641607 ) ) ( not ( = ?auto_641599 ?auto_641608 ) ) ( not ( = ?auto_641599 ?auto_641609 ) ) ( not ( = ?auto_641599 ?auto_641610 ) ) ( not ( = ?auto_641599 ?auto_641611 ) ) ( not ( = ?auto_641599 ?auto_641612 ) ) ( not ( = ?auto_641600 ?auto_641601 ) ) ( not ( = ?auto_641600 ?auto_641602 ) ) ( not ( = ?auto_641600 ?auto_641603 ) ) ( not ( = ?auto_641600 ?auto_641604 ) ) ( not ( = ?auto_641600 ?auto_641605 ) ) ( not ( = ?auto_641600 ?auto_641606 ) ) ( not ( = ?auto_641600 ?auto_641607 ) ) ( not ( = ?auto_641600 ?auto_641608 ) ) ( not ( = ?auto_641600 ?auto_641609 ) ) ( not ( = ?auto_641600 ?auto_641610 ) ) ( not ( = ?auto_641600 ?auto_641611 ) ) ( not ( = ?auto_641600 ?auto_641612 ) ) ( not ( = ?auto_641601 ?auto_641602 ) ) ( not ( = ?auto_641601 ?auto_641603 ) ) ( not ( = ?auto_641601 ?auto_641604 ) ) ( not ( = ?auto_641601 ?auto_641605 ) ) ( not ( = ?auto_641601 ?auto_641606 ) ) ( not ( = ?auto_641601 ?auto_641607 ) ) ( not ( = ?auto_641601 ?auto_641608 ) ) ( not ( = ?auto_641601 ?auto_641609 ) ) ( not ( = ?auto_641601 ?auto_641610 ) ) ( not ( = ?auto_641601 ?auto_641611 ) ) ( not ( = ?auto_641601 ?auto_641612 ) ) ( not ( = ?auto_641602 ?auto_641603 ) ) ( not ( = ?auto_641602 ?auto_641604 ) ) ( not ( = ?auto_641602 ?auto_641605 ) ) ( not ( = ?auto_641602 ?auto_641606 ) ) ( not ( = ?auto_641602 ?auto_641607 ) ) ( not ( = ?auto_641602 ?auto_641608 ) ) ( not ( = ?auto_641602 ?auto_641609 ) ) ( not ( = ?auto_641602 ?auto_641610 ) ) ( not ( = ?auto_641602 ?auto_641611 ) ) ( not ( = ?auto_641602 ?auto_641612 ) ) ( not ( = ?auto_641603 ?auto_641604 ) ) ( not ( = ?auto_641603 ?auto_641605 ) ) ( not ( = ?auto_641603 ?auto_641606 ) ) ( not ( = ?auto_641603 ?auto_641607 ) ) ( not ( = ?auto_641603 ?auto_641608 ) ) ( not ( = ?auto_641603 ?auto_641609 ) ) ( not ( = ?auto_641603 ?auto_641610 ) ) ( not ( = ?auto_641603 ?auto_641611 ) ) ( not ( = ?auto_641603 ?auto_641612 ) ) ( not ( = ?auto_641604 ?auto_641605 ) ) ( not ( = ?auto_641604 ?auto_641606 ) ) ( not ( = ?auto_641604 ?auto_641607 ) ) ( not ( = ?auto_641604 ?auto_641608 ) ) ( not ( = ?auto_641604 ?auto_641609 ) ) ( not ( = ?auto_641604 ?auto_641610 ) ) ( not ( = ?auto_641604 ?auto_641611 ) ) ( not ( = ?auto_641604 ?auto_641612 ) ) ( not ( = ?auto_641605 ?auto_641606 ) ) ( not ( = ?auto_641605 ?auto_641607 ) ) ( not ( = ?auto_641605 ?auto_641608 ) ) ( not ( = ?auto_641605 ?auto_641609 ) ) ( not ( = ?auto_641605 ?auto_641610 ) ) ( not ( = ?auto_641605 ?auto_641611 ) ) ( not ( = ?auto_641605 ?auto_641612 ) ) ( not ( = ?auto_641606 ?auto_641607 ) ) ( not ( = ?auto_641606 ?auto_641608 ) ) ( not ( = ?auto_641606 ?auto_641609 ) ) ( not ( = ?auto_641606 ?auto_641610 ) ) ( not ( = ?auto_641606 ?auto_641611 ) ) ( not ( = ?auto_641606 ?auto_641612 ) ) ( not ( = ?auto_641607 ?auto_641608 ) ) ( not ( = ?auto_641607 ?auto_641609 ) ) ( not ( = ?auto_641607 ?auto_641610 ) ) ( not ( = ?auto_641607 ?auto_641611 ) ) ( not ( = ?auto_641607 ?auto_641612 ) ) ( not ( = ?auto_641608 ?auto_641609 ) ) ( not ( = ?auto_641608 ?auto_641610 ) ) ( not ( = ?auto_641608 ?auto_641611 ) ) ( not ( = ?auto_641608 ?auto_641612 ) ) ( not ( = ?auto_641609 ?auto_641610 ) ) ( not ( = ?auto_641609 ?auto_641611 ) ) ( not ( = ?auto_641609 ?auto_641612 ) ) ( not ( = ?auto_641610 ?auto_641611 ) ) ( not ( = ?auto_641610 ?auto_641612 ) ) ( not ( = ?auto_641611 ?auto_641612 ) ) ( ON ?auto_641610 ?auto_641611 ) ( CLEAR ?auto_641608 ) ( ON ?auto_641609 ?auto_641610 ) ( CLEAR ?auto_641609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_641595 ?auto_641596 ?auto_641597 ?auto_641598 ?auto_641599 ?auto_641600 ?auto_641601 ?auto_641602 ?auto_641603 ?auto_641604 ?auto_641605 ?auto_641606 ?auto_641607 ?auto_641608 ?auto_641609 )
      ( MAKE-17PILE ?auto_641595 ?auto_641596 ?auto_641597 ?auto_641598 ?auto_641599 ?auto_641600 ?auto_641601 ?auto_641602 ?auto_641603 ?auto_641604 ?auto_641605 ?auto_641606 ?auto_641607 ?auto_641608 ?auto_641609 ?auto_641610 ?auto_641611 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_641630 - BLOCK
      ?auto_641631 - BLOCK
      ?auto_641632 - BLOCK
      ?auto_641633 - BLOCK
      ?auto_641634 - BLOCK
      ?auto_641635 - BLOCK
      ?auto_641636 - BLOCK
      ?auto_641637 - BLOCK
      ?auto_641638 - BLOCK
      ?auto_641639 - BLOCK
      ?auto_641640 - BLOCK
      ?auto_641641 - BLOCK
      ?auto_641642 - BLOCK
      ?auto_641643 - BLOCK
      ?auto_641644 - BLOCK
      ?auto_641645 - BLOCK
      ?auto_641646 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_641646 ) ( ON-TABLE ?auto_641630 ) ( ON ?auto_641631 ?auto_641630 ) ( ON ?auto_641632 ?auto_641631 ) ( ON ?auto_641633 ?auto_641632 ) ( ON ?auto_641634 ?auto_641633 ) ( ON ?auto_641635 ?auto_641634 ) ( ON ?auto_641636 ?auto_641635 ) ( ON ?auto_641637 ?auto_641636 ) ( ON ?auto_641638 ?auto_641637 ) ( ON ?auto_641639 ?auto_641638 ) ( ON ?auto_641640 ?auto_641639 ) ( ON ?auto_641641 ?auto_641640 ) ( ON ?auto_641642 ?auto_641641 ) ( ON ?auto_641643 ?auto_641642 ) ( not ( = ?auto_641630 ?auto_641631 ) ) ( not ( = ?auto_641630 ?auto_641632 ) ) ( not ( = ?auto_641630 ?auto_641633 ) ) ( not ( = ?auto_641630 ?auto_641634 ) ) ( not ( = ?auto_641630 ?auto_641635 ) ) ( not ( = ?auto_641630 ?auto_641636 ) ) ( not ( = ?auto_641630 ?auto_641637 ) ) ( not ( = ?auto_641630 ?auto_641638 ) ) ( not ( = ?auto_641630 ?auto_641639 ) ) ( not ( = ?auto_641630 ?auto_641640 ) ) ( not ( = ?auto_641630 ?auto_641641 ) ) ( not ( = ?auto_641630 ?auto_641642 ) ) ( not ( = ?auto_641630 ?auto_641643 ) ) ( not ( = ?auto_641630 ?auto_641644 ) ) ( not ( = ?auto_641630 ?auto_641645 ) ) ( not ( = ?auto_641630 ?auto_641646 ) ) ( not ( = ?auto_641631 ?auto_641632 ) ) ( not ( = ?auto_641631 ?auto_641633 ) ) ( not ( = ?auto_641631 ?auto_641634 ) ) ( not ( = ?auto_641631 ?auto_641635 ) ) ( not ( = ?auto_641631 ?auto_641636 ) ) ( not ( = ?auto_641631 ?auto_641637 ) ) ( not ( = ?auto_641631 ?auto_641638 ) ) ( not ( = ?auto_641631 ?auto_641639 ) ) ( not ( = ?auto_641631 ?auto_641640 ) ) ( not ( = ?auto_641631 ?auto_641641 ) ) ( not ( = ?auto_641631 ?auto_641642 ) ) ( not ( = ?auto_641631 ?auto_641643 ) ) ( not ( = ?auto_641631 ?auto_641644 ) ) ( not ( = ?auto_641631 ?auto_641645 ) ) ( not ( = ?auto_641631 ?auto_641646 ) ) ( not ( = ?auto_641632 ?auto_641633 ) ) ( not ( = ?auto_641632 ?auto_641634 ) ) ( not ( = ?auto_641632 ?auto_641635 ) ) ( not ( = ?auto_641632 ?auto_641636 ) ) ( not ( = ?auto_641632 ?auto_641637 ) ) ( not ( = ?auto_641632 ?auto_641638 ) ) ( not ( = ?auto_641632 ?auto_641639 ) ) ( not ( = ?auto_641632 ?auto_641640 ) ) ( not ( = ?auto_641632 ?auto_641641 ) ) ( not ( = ?auto_641632 ?auto_641642 ) ) ( not ( = ?auto_641632 ?auto_641643 ) ) ( not ( = ?auto_641632 ?auto_641644 ) ) ( not ( = ?auto_641632 ?auto_641645 ) ) ( not ( = ?auto_641632 ?auto_641646 ) ) ( not ( = ?auto_641633 ?auto_641634 ) ) ( not ( = ?auto_641633 ?auto_641635 ) ) ( not ( = ?auto_641633 ?auto_641636 ) ) ( not ( = ?auto_641633 ?auto_641637 ) ) ( not ( = ?auto_641633 ?auto_641638 ) ) ( not ( = ?auto_641633 ?auto_641639 ) ) ( not ( = ?auto_641633 ?auto_641640 ) ) ( not ( = ?auto_641633 ?auto_641641 ) ) ( not ( = ?auto_641633 ?auto_641642 ) ) ( not ( = ?auto_641633 ?auto_641643 ) ) ( not ( = ?auto_641633 ?auto_641644 ) ) ( not ( = ?auto_641633 ?auto_641645 ) ) ( not ( = ?auto_641633 ?auto_641646 ) ) ( not ( = ?auto_641634 ?auto_641635 ) ) ( not ( = ?auto_641634 ?auto_641636 ) ) ( not ( = ?auto_641634 ?auto_641637 ) ) ( not ( = ?auto_641634 ?auto_641638 ) ) ( not ( = ?auto_641634 ?auto_641639 ) ) ( not ( = ?auto_641634 ?auto_641640 ) ) ( not ( = ?auto_641634 ?auto_641641 ) ) ( not ( = ?auto_641634 ?auto_641642 ) ) ( not ( = ?auto_641634 ?auto_641643 ) ) ( not ( = ?auto_641634 ?auto_641644 ) ) ( not ( = ?auto_641634 ?auto_641645 ) ) ( not ( = ?auto_641634 ?auto_641646 ) ) ( not ( = ?auto_641635 ?auto_641636 ) ) ( not ( = ?auto_641635 ?auto_641637 ) ) ( not ( = ?auto_641635 ?auto_641638 ) ) ( not ( = ?auto_641635 ?auto_641639 ) ) ( not ( = ?auto_641635 ?auto_641640 ) ) ( not ( = ?auto_641635 ?auto_641641 ) ) ( not ( = ?auto_641635 ?auto_641642 ) ) ( not ( = ?auto_641635 ?auto_641643 ) ) ( not ( = ?auto_641635 ?auto_641644 ) ) ( not ( = ?auto_641635 ?auto_641645 ) ) ( not ( = ?auto_641635 ?auto_641646 ) ) ( not ( = ?auto_641636 ?auto_641637 ) ) ( not ( = ?auto_641636 ?auto_641638 ) ) ( not ( = ?auto_641636 ?auto_641639 ) ) ( not ( = ?auto_641636 ?auto_641640 ) ) ( not ( = ?auto_641636 ?auto_641641 ) ) ( not ( = ?auto_641636 ?auto_641642 ) ) ( not ( = ?auto_641636 ?auto_641643 ) ) ( not ( = ?auto_641636 ?auto_641644 ) ) ( not ( = ?auto_641636 ?auto_641645 ) ) ( not ( = ?auto_641636 ?auto_641646 ) ) ( not ( = ?auto_641637 ?auto_641638 ) ) ( not ( = ?auto_641637 ?auto_641639 ) ) ( not ( = ?auto_641637 ?auto_641640 ) ) ( not ( = ?auto_641637 ?auto_641641 ) ) ( not ( = ?auto_641637 ?auto_641642 ) ) ( not ( = ?auto_641637 ?auto_641643 ) ) ( not ( = ?auto_641637 ?auto_641644 ) ) ( not ( = ?auto_641637 ?auto_641645 ) ) ( not ( = ?auto_641637 ?auto_641646 ) ) ( not ( = ?auto_641638 ?auto_641639 ) ) ( not ( = ?auto_641638 ?auto_641640 ) ) ( not ( = ?auto_641638 ?auto_641641 ) ) ( not ( = ?auto_641638 ?auto_641642 ) ) ( not ( = ?auto_641638 ?auto_641643 ) ) ( not ( = ?auto_641638 ?auto_641644 ) ) ( not ( = ?auto_641638 ?auto_641645 ) ) ( not ( = ?auto_641638 ?auto_641646 ) ) ( not ( = ?auto_641639 ?auto_641640 ) ) ( not ( = ?auto_641639 ?auto_641641 ) ) ( not ( = ?auto_641639 ?auto_641642 ) ) ( not ( = ?auto_641639 ?auto_641643 ) ) ( not ( = ?auto_641639 ?auto_641644 ) ) ( not ( = ?auto_641639 ?auto_641645 ) ) ( not ( = ?auto_641639 ?auto_641646 ) ) ( not ( = ?auto_641640 ?auto_641641 ) ) ( not ( = ?auto_641640 ?auto_641642 ) ) ( not ( = ?auto_641640 ?auto_641643 ) ) ( not ( = ?auto_641640 ?auto_641644 ) ) ( not ( = ?auto_641640 ?auto_641645 ) ) ( not ( = ?auto_641640 ?auto_641646 ) ) ( not ( = ?auto_641641 ?auto_641642 ) ) ( not ( = ?auto_641641 ?auto_641643 ) ) ( not ( = ?auto_641641 ?auto_641644 ) ) ( not ( = ?auto_641641 ?auto_641645 ) ) ( not ( = ?auto_641641 ?auto_641646 ) ) ( not ( = ?auto_641642 ?auto_641643 ) ) ( not ( = ?auto_641642 ?auto_641644 ) ) ( not ( = ?auto_641642 ?auto_641645 ) ) ( not ( = ?auto_641642 ?auto_641646 ) ) ( not ( = ?auto_641643 ?auto_641644 ) ) ( not ( = ?auto_641643 ?auto_641645 ) ) ( not ( = ?auto_641643 ?auto_641646 ) ) ( not ( = ?auto_641644 ?auto_641645 ) ) ( not ( = ?auto_641644 ?auto_641646 ) ) ( not ( = ?auto_641645 ?auto_641646 ) ) ( ON ?auto_641645 ?auto_641646 ) ( CLEAR ?auto_641643 ) ( ON ?auto_641644 ?auto_641645 ) ( CLEAR ?auto_641644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_641630 ?auto_641631 ?auto_641632 ?auto_641633 ?auto_641634 ?auto_641635 ?auto_641636 ?auto_641637 ?auto_641638 ?auto_641639 ?auto_641640 ?auto_641641 ?auto_641642 ?auto_641643 ?auto_641644 )
      ( MAKE-17PILE ?auto_641630 ?auto_641631 ?auto_641632 ?auto_641633 ?auto_641634 ?auto_641635 ?auto_641636 ?auto_641637 ?auto_641638 ?auto_641639 ?auto_641640 ?auto_641641 ?auto_641642 ?auto_641643 ?auto_641644 ?auto_641645 ?auto_641646 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_641664 - BLOCK
      ?auto_641665 - BLOCK
      ?auto_641666 - BLOCK
      ?auto_641667 - BLOCK
      ?auto_641668 - BLOCK
      ?auto_641669 - BLOCK
      ?auto_641670 - BLOCK
      ?auto_641671 - BLOCK
      ?auto_641672 - BLOCK
      ?auto_641673 - BLOCK
      ?auto_641674 - BLOCK
      ?auto_641675 - BLOCK
      ?auto_641676 - BLOCK
      ?auto_641677 - BLOCK
      ?auto_641678 - BLOCK
      ?auto_641679 - BLOCK
      ?auto_641680 - BLOCK
    )
    :vars
    (
      ?auto_641681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_641680 ?auto_641681 ) ( ON-TABLE ?auto_641664 ) ( ON ?auto_641665 ?auto_641664 ) ( ON ?auto_641666 ?auto_641665 ) ( ON ?auto_641667 ?auto_641666 ) ( ON ?auto_641668 ?auto_641667 ) ( ON ?auto_641669 ?auto_641668 ) ( ON ?auto_641670 ?auto_641669 ) ( ON ?auto_641671 ?auto_641670 ) ( ON ?auto_641672 ?auto_641671 ) ( ON ?auto_641673 ?auto_641672 ) ( ON ?auto_641674 ?auto_641673 ) ( ON ?auto_641675 ?auto_641674 ) ( ON ?auto_641676 ?auto_641675 ) ( not ( = ?auto_641664 ?auto_641665 ) ) ( not ( = ?auto_641664 ?auto_641666 ) ) ( not ( = ?auto_641664 ?auto_641667 ) ) ( not ( = ?auto_641664 ?auto_641668 ) ) ( not ( = ?auto_641664 ?auto_641669 ) ) ( not ( = ?auto_641664 ?auto_641670 ) ) ( not ( = ?auto_641664 ?auto_641671 ) ) ( not ( = ?auto_641664 ?auto_641672 ) ) ( not ( = ?auto_641664 ?auto_641673 ) ) ( not ( = ?auto_641664 ?auto_641674 ) ) ( not ( = ?auto_641664 ?auto_641675 ) ) ( not ( = ?auto_641664 ?auto_641676 ) ) ( not ( = ?auto_641664 ?auto_641677 ) ) ( not ( = ?auto_641664 ?auto_641678 ) ) ( not ( = ?auto_641664 ?auto_641679 ) ) ( not ( = ?auto_641664 ?auto_641680 ) ) ( not ( = ?auto_641664 ?auto_641681 ) ) ( not ( = ?auto_641665 ?auto_641666 ) ) ( not ( = ?auto_641665 ?auto_641667 ) ) ( not ( = ?auto_641665 ?auto_641668 ) ) ( not ( = ?auto_641665 ?auto_641669 ) ) ( not ( = ?auto_641665 ?auto_641670 ) ) ( not ( = ?auto_641665 ?auto_641671 ) ) ( not ( = ?auto_641665 ?auto_641672 ) ) ( not ( = ?auto_641665 ?auto_641673 ) ) ( not ( = ?auto_641665 ?auto_641674 ) ) ( not ( = ?auto_641665 ?auto_641675 ) ) ( not ( = ?auto_641665 ?auto_641676 ) ) ( not ( = ?auto_641665 ?auto_641677 ) ) ( not ( = ?auto_641665 ?auto_641678 ) ) ( not ( = ?auto_641665 ?auto_641679 ) ) ( not ( = ?auto_641665 ?auto_641680 ) ) ( not ( = ?auto_641665 ?auto_641681 ) ) ( not ( = ?auto_641666 ?auto_641667 ) ) ( not ( = ?auto_641666 ?auto_641668 ) ) ( not ( = ?auto_641666 ?auto_641669 ) ) ( not ( = ?auto_641666 ?auto_641670 ) ) ( not ( = ?auto_641666 ?auto_641671 ) ) ( not ( = ?auto_641666 ?auto_641672 ) ) ( not ( = ?auto_641666 ?auto_641673 ) ) ( not ( = ?auto_641666 ?auto_641674 ) ) ( not ( = ?auto_641666 ?auto_641675 ) ) ( not ( = ?auto_641666 ?auto_641676 ) ) ( not ( = ?auto_641666 ?auto_641677 ) ) ( not ( = ?auto_641666 ?auto_641678 ) ) ( not ( = ?auto_641666 ?auto_641679 ) ) ( not ( = ?auto_641666 ?auto_641680 ) ) ( not ( = ?auto_641666 ?auto_641681 ) ) ( not ( = ?auto_641667 ?auto_641668 ) ) ( not ( = ?auto_641667 ?auto_641669 ) ) ( not ( = ?auto_641667 ?auto_641670 ) ) ( not ( = ?auto_641667 ?auto_641671 ) ) ( not ( = ?auto_641667 ?auto_641672 ) ) ( not ( = ?auto_641667 ?auto_641673 ) ) ( not ( = ?auto_641667 ?auto_641674 ) ) ( not ( = ?auto_641667 ?auto_641675 ) ) ( not ( = ?auto_641667 ?auto_641676 ) ) ( not ( = ?auto_641667 ?auto_641677 ) ) ( not ( = ?auto_641667 ?auto_641678 ) ) ( not ( = ?auto_641667 ?auto_641679 ) ) ( not ( = ?auto_641667 ?auto_641680 ) ) ( not ( = ?auto_641667 ?auto_641681 ) ) ( not ( = ?auto_641668 ?auto_641669 ) ) ( not ( = ?auto_641668 ?auto_641670 ) ) ( not ( = ?auto_641668 ?auto_641671 ) ) ( not ( = ?auto_641668 ?auto_641672 ) ) ( not ( = ?auto_641668 ?auto_641673 ) ) ( not ( = ?auto_641668 ?auto_641674 ) ) ( not ( = ?auto_641668 ?auto_641675 ) ) ( not ( = ?auto_641668 ?auto_641676 ) ) ( not ( = ?auto_641668 ?auto_641677 ) ) ( not ( = ?auto_641668 ?auto_641678 ) ) ( not ( = ?auto_641668 ?auto_641679 ) ) ( not ( = ?auto_641668 ?auto_641680 ) ) ( not ( = ?auto_641668 ?auto_641681 ) ) ( not ( = ?auto_641669 ?auto_641670 ) ) ( not ( = ?auto_641669 ?auto_641671 ) ) ( not ( = ?auto_641669 ?auto_641672 ) ) ( not ( = ?auto_641669 ?auto_641673 ) ) ( not ( = ?auto_641669 ?auto_641674 ) ) ( not ( = ?auto_641669 ?auto_641675 ) ) ( not ( = ?auto_641669 ?auto_641676 ) ) ( not ( = ?auto_641669 ?auto_641677 ) ) ( not ( = ?auto_641669 ?auto_641678 ) ) ( not ( = ?auto_641669 ?auto_641679 ) ) ( not ( = ?auto_641669 ?auto_641680 ) ) ( not ( = ?auto_641669 ?auto_641681 ) ) ( not ( = ?auto_641670 ?auto_641671 ) ) ( not ( = ?auto_641670 ?auto_641672 ) ) ( not ( = ?auto_641670 ?auto_641673 ) ) ( not ( = ?auto_641670 ?auto_641674 ) ) ( not ( = ?auto_641670 ?auto_641675 ) ) ( not ( = ?auto_641670 ?auto_641676 ) ) ( not ( = ?auto_641670 ?auto_641677 ) ) ( not ( = ?auto_641670 ?auto_641678 ) ) ( not ( = ?auto_641670 ?auto_641679 ) ) ( not ( = ?auto_641670 ?auto_641680 ) ) ( not ( = ?auto_641670 ?auto_641681 ) ) ( not ( = ?auto_641671 ?auto_641672 ) ) ( not ( = ?auto_641671 ?auto_641673 ) ) ( not ( = ?auto_641671 ?auto_641674 ) ) ( not ( = ?auto_641671 ?auto_641675 ) ) ( not ( = ?auto_641671 ?auto_641676 ) ) ( not ( = ?auto_641671 ?auto_641677 ) ) ( not ( = ?auto_641671 ?auto_641678 ) ) ( not ( = ?auto_641671 ?auto_641679 ) ) ( not ( = ?auto_641671 ?auto_641680 ) ) ( not ( = ?auto_641671 ?auto_641681 ) ) ( not ( = ?auto_641672 ?auto_641673 ) ) ( not ( = ?auto_641672 ?auto_641674 ) ) ( not ( = ?auto_641672 ?auto_641675 ) ) ( not ( = ?auto_641672 ?auto_641676 ) ) ( not ( = ?auto_641672 ?auto_641677 ) ) ( not ( = ?auto_641672 ?auto_641678 ) ) ( not ( = ?auto_641672 ?auto_641679 ) ) ( not ( = ?auto_641672 ?auto_641680 ) ) ( not ( = ?auto_641672 ?auto_641681 ) ) ( not ( = ?auto_641673 ?auto_641674 ) ) ( not ( = ?auto_641673 ?auto_641675 ) ) ( not ( = ?auto_641673 ?auto_641676 ) ) ( not ( = ?auto_641673 ?auto_641677 ) ) ( not ( = ?auto_641673 ?auto_641678 ) ) ( not ( = ?auto_641673 ?auto_641679 ) ) ( not ( = ?auto_641673 ?auto_641680 ) ) ( not ( = ?auto_641673 ?auto_641681 ) ) ( not ( = ?auto_641674 ?auto_641675 ) ) ( not ( = ?auto_641674 ?auto_641676 ) ) ( not ( = ?auto_641674 ?auto_641677 ) ) ( not ( = ?auto_641674 ?auto_641678 ) ) ( not ( = ?auto_641674 ?auto_641679 ) ) ( not ( = ?auto_641674 ?auto_641680 ) ) ( not ( = ?auto_641674 ?auto_641681 ) ) ( not ( = ?auto_641675 ?auto_641676 ) ) ( not ( = ?auto_641675 ?auto_641677 ) ) ( not ( = ?auto_641675 ?auto_641678 ) ) ( not ( = ?auto_641675 ?auto_641679 ) ) ( not ( = ?auto_641675 ?auto_641680 ) ) ( not ( = ?auto_641675 ?auto_641681 ) ) ( not ( = ?auto_641676 ?auto_641677 ) ) ( not ( = ?auto_641676 ?auto_641678 ) ) ( not ( = ?auto_641676 ?auto_641679 ) ) ( not ( = ?auto_641676 ?auto_641680 ) ) ( not ( = ?auto_641676 ?auto_641681 ) ) ( not ( = ?auto_641677 ?auto_641678 ) ) ( not ( = ?auto_641677 ?auto_641679 ) ) ( not ( = ?auto_641677 ?auto_641680 ) ) ( not ( = ?auto_641677 ?auto_641681 ) ) ( not ( = ?auto_641678 ?auto_641679 ) ) ( not ( = ?auto_641678 ?auto_641680 ) ) ( not ( = ?auto_641678 ?auto_641681 ) ) ( not ( = ?auto_641679 ?auto_641680 ) ) ( not ( = ?auto_641679 ?auto_641681 ) ) ( not ( = ?auto_641680 ?auto_641681 ) ) ( ON ?auto_641679 ?auto_641680 ) ( ON ?auto_641678 ?auto_641679 ) ( CLEAR ?auto_641676 ) ( ON ?auto_641677 ?auto_641678 ) ( CLEAR ?auto_641677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_641664 ?auto_641665 ?auto_641666 ?auto_641667 ?auto_641668 ?auto_641669 ?auto_641670 ?auto_641671 ?auto_641672 ?auto_641673 ?auto_641674 ?auto_641675 ?auto_641676 ?auto_641677 )
      ( MAKE-17PILE ?auto_641664 ?auto_641665 ?auto_641666 ?auto_641667 ?auto_641668 ?auto_641669 ?auto_641670 ?auto_641671 ?auto_641672 ?auto_641673 ?auto_641674 ?auto_641675 ?auto_641676 ?auto_641677 ?auto_641678 ?auto_641679 ?auto_641680 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_641699 - BLOCK
      ?auto_641700 - BLOCK
      ?auto_641701 - BLOCK
      ?auto_641702 - BLOCK
      ?auto_641703 - BLOCK
      ?auto_641704 - BLOCK
      ?auto_641705 - BLOCK
      ?auto_641706 - BLOCK
      ?auto_641707 - BLOCK
      ?auto_641708 - BLOCK
      ?auto_641709 - BLOCK
      ?auto_641710 - BLOCK
      ?auto_641711 - BLOCK
      ?auto_641712 - BLOCK
      ?auto_641713 - BLOCK
      ?auto_641714 - BLOCK
      ?auto_641715 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_641715 ) ( ON-TABLE ?auto_641699 ) ( ON ?auto_641700 ?auto_641699 ) ( ON ?auto_641701 ?auto_641700 ) ( ON ?auto_641702 ?auto_641701 ) ( ON ?auto_641703 ?auto_641702 ) ( ON ?auto_641704 ?auto_641703 ) ( ON ?auto_641705 ?auto_641704 ) ( ON ?auto_641706 ?auto_641705 ) ( ON ?auto_641707 ?auto_641706 ) ( ON ?auto_641708 ?auto_641707 ) ( ON ?auto_641709 ?auto_641708 ) ( ON ?auto_641710 ?auto_641709 ) ( ON ?auto_641711 ?auto_641710 ) ( not ( = ?auto_641699 ?auto_641700 ) ) ( not ( = ?auto_641699 ?auto_641701 ) ) ( not ( = ?auto_641699 ?auto_641702 ) ) ( not ( = ?auto_641699 ?auto_641703 ) ) ( not ( = ?auto_641699 ?auto_641704 ) ) ( not ( = ?auto_641699 ?auto_641705 ) ) ( not ( = ?auto_641699 ?auto_641706 ) ) ( not ( = ?auto_641699 ?auto_641707 ) ) ( not ( = ?auto_641699 ?auto_641708 ) ) ( not ( = ?auto_641699 ?auto_641709 ) ) ( not ( = ?auto_641699 ?auto_641710 ) ) ( not ( = ?auto_641699 ?auto_641711 ) ) ( not ( = ?auto_641699 ?auto_641712 ) ) ( not ( = ?auto_641699 ?auto_641713 ) ) ( not ( = ?auto_641699 ?auto_641714 ) ) ( not ( = ?auto_641699 ?auto_641715 ) ) ( not ( = ?auto_641700 ?auto_641701 ) ) ( not ( = ?auto_641700 ?auto_641702 ) ) ( not ( = ?auto_641700 ?auto_641703 ) ) ( not ( = ?auto_641700 ?auto_641704 ) ) ( not ( = ?auto_641700 ?auto_641705 ) ) ( not ( = ?auto_641700 ?auto_641706 ) ) ( not ( = ?auto_641700 ?auto_641707 ) ) ( not ( = ?auto_641700 ?auto_641708 ) ) ( not ( = ?auto_641700 ?auto_641709 ) ) ( not ( = ?auto_641700 ?auto_641710 ) ) ( not ( = ?auto_641700 ?auto_641711 ) ) ( not ( = ?auto_641700 ?auto_641712 ) ) ( not ( = ?auto_641700 ?auto_641713 ) ) ( not ( = ?auto_641700 ?auto_641714 ) ) ( not ( = ?auto_641700 ?auto_641715 ) ) ( not ( = ?auto_641701 ?auto_641702 ) ) ( not ( = ?auto_641701 ?auto_641703 ) ) ( not ( = ?auto_641701 ?auto_641704 ) ) ( not ( = ?auto_641701 ?auto_641705 ) ) ( not ( = ?auto_641701 ?auto_641706 ) ) ( not ( = ?auto_641701 ?auto_641707 ) ) ( not ( = ?auto_641701 ?auto_641708 ) ) ( not ( = ?auto_641701 ?auto_641709 ) ) ( not ( = ?auto_641701 ?auto_641710 ) ) ( not ( = ?auto_641701 ?auto_641711 ) ) ( not ( = ?auto_641701 ?auto_641712 ) ) ( not ( = ?auto_641701 ?auto_641713 ) ) ( not ( = ?auto_641701 ?auto_641714 ) ) ( not ( = ?auto_641701 ?auto_641715 ) ) ( not ( = ?auto_641702 ?auto_641703 ) ) ( not ( = ?auto_641702 ?auto_641704 ) ) ( not ( = ?auto_641702 ?auto_641705 ) ) ( not ( = ?auto_641702 ?auto_641706 ) ) ( not ( = ?auto_641702 ?auto_641707 ) ) ( not ( = ?auto_641702 ?auto_641708 ) ) ( not ( = ?auto_641702 ?auto_641709 ) ) ( not ( = ?auto_641702 ?auto_641710 ) ) ( not ( = ?auto_641702 ?auto_641711 ) ) ( not ( = ?auto_641702 ?auto_641712 ) ) ( not ( = ?auto_641702 ?auto_641713 ) ) ( not ( = ?auto_641702 ?auto_641714 ) ) ( not ( = ?auto_641702 ?auto_641715 ) ) ( not ( = ?auto_641703 ?auto_641704 ) ) ( not ( = ?auto_641703 ?auto_641705 ) ) ( not ( = ?auto_641703 ?auto_641706 ) ) ( not ( = ?auto_641703 ?auto_641707 ) ) ( not ( = ?auto_641703 ?auto_641708 ) ) ( not ( = ?auto_641703 ?auto_641709 ) ) ( not ( = ?auto_641703 ?auto_641710 ) ) ( not ( = ?auto_641703 ?auto_641711 ) ) ( not ( = ?auto_641703 ?auto_641712 ) ) ( not ( = ?auto_641703 ?auto_641713 ) ) ( not ( = ?auto_641703 ?auto_641714 ) ) ( not ( = ?auto_641703 ?auto_641715 ) ) ( not ( = ?auto_641704 ?auto_641705 ) ) ( not ( = ?auto_641704 ?auto_641706 ) ) ( not ( = ?auto_641704 ?auto_641707 ) ) ( not ( = ?auto_641704 ?auto_641708 ) ) ( not ( = ?auto_641704 ?auto_641709 ) ) ( not ( = ?auto_641704 ?auto_641710 ) ) ( not ( = ?auto_641704 ?auto_641711 ) ) ( not ( = ?auto_641704 ?auto_641712 ) ) ( not ( = ?auto_641704 ?auto_641713 ) ) ( not ( = ?auto_641704 ?auto_641714 ) ) ( not ( = ?auto_641704 ?auto_641715 ) ) ( not ( = ?auto_641705 ?auto_641706 ) ) ( not ( = ?auto_641705 ?auto_641707 ) ) ( not ( = ?auto_641705 ?auto_641708 ) ) ( not ( = ?auto_641705 ?auto_641709 ) ) ( not ( = ?auto_641705 ?auto_641710 ) ) ( not ( = ?auto_641705 ?auto_641711 ) ) ( not ( = ?auto_641705 ?auto_641712 ) ) ( not ( = ?auto_641705 ?auto_641713 ) ) ( not ( = ?auto_641705 ?auto_641714 ) ) ( not ( = ?auto_641705 ?auto_641715 ) ) ( not ( = ?auto_641706 ?auto_641707 ) ) ( not ( = ?auto_641706 ?auto_641708 ) ) ( not ( = ?auto_641706 ?auto_641709 ) ) ( not ( = ?auto_641706 ?auto_641710 ) ) ( not ( = ?auto_641706 ?auto_641711 ) ) ( not ( = ?auto_641706 ?auto_641712 ) ) ( not ( = ?auto_641706 ?auto_641713 ) ) ( not ( = ?auto_641706 ?auto_641714 ) ) ( not ( = ?auto_641706 ?auto_641715 ) ) ( not ( = ?auto_641707 ?auto_641708 ) ) ( not ( = ?auto_641707 ?auto_641709 ) ) ( not ( = ?auto_641707 ?auto_641710 ) ) ( not ( = ?auto_641707 ?auto_641711 ) ) ( not ( = ?auto_641707 ?auto_641712 ) ) ( not ( = ?auto_641707 ?auto_641713 ) ) ( not ( = ?auto_641707 ?auto_641714 ) ) ( not ( = ?auto_641707 ?auto_641715 ) ) ( not ( = ?auto_641708 ?auto_641709 ) ) ( not ( = ?auto_641708 ?auto_641710 ) ) ( not ( = ?auto_641708 ?auto_641711 ) ) ( not ( = ?auto_641708 ?auto_641712 ) ) ( not ( = ?auto_641708 ?auto_641713 ) ) ( not ( = ?auto_641708 ?auto_641714 ) ) ( not ( = ?auto_641708 ?auto_641715 ) ) ( not ( = ?auto_641709 ?auto_641710 ) ) ( not ( = ?auto_641709 ?auto_641711 ) ) ( not ( = ?auto_641709 ?auto_641712 ) ) ( not ( = ?auto_641709 ?auto_641713 ) ) ( not ( = ?auto_641709 ?auto_641714 ) ) ( not ( = ?auto_641709 ?auto_641715 ) ) ( not ( = ?auto_641710 ?auto_641711 ) ) ( not ( = ?auto_641710 ?auto_641712 ) ) ( not ( = ?auto_641710 ?auto_641713 ) ) ( not ( = ?auto_641710 ?auto_641714 ) ) ( not ( = ?auto_641710 ?auto_641715 ) ) ( not ( = ?auto_641711 ?auto_641712 ) ) ( not ( = ?auto_641711 ?auto_641713 ) ) ( not ( = ?auto_641711 ?auto_641714 ) ) ( not ( = ?auto_641711 ?auto_641715 ) ) ( not ( = ?auto_641712 ?auto_641713 ) ) ( not ( = ?auto_641712 ?auto_641714 ) ) ( not ( = ?auto_641712 ?auto_641715 ) ) ( not ( = ?auto_641713 ?auto_641714 ) ) ( not ( = ?auto_641713 ?auto_641715 ) ) ( not ( = ?auto_641714 ?auto_641715 ) ) ( ON ?auto_641714 ?auto_641715 ) ( ON ?auto_641713 ?auto_641714 ) ( CLEAR ?auto_641711 ) ( ON ?auto_641712 ?auto_641713 ) ( CLEAR ?auto_641712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_641699 ?auto_641700 ?auto_641701 ?auto_641702 ?auto_641703 ?auto_641704 ?auto_641705 ?auto_641706 ?auto_641707 ?auto_641708 ?auto_641709 ?auto_641710 ?auto_641711 ?auto_641712 )
      ( MAKE-17PILE ?auto_641699 ?auto_641700 ?auto_641701 ?auto_641702 ?auto_641703 ?auto_641704 ?auto_641705 ?auto_641706 ?auto_641707 ?auto_641708 ?auto_641709 ?auto_641710 ?auto_641711 ?auto_641712 ?auto_641713 ?auto_641714 ?auto_641715 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_641733 - BLOCK
      ?auto_641734 - BLOCK
      ?auto_641735 - BLOCK
      ?auto_641736 - BLOCK
      ?auto_641737 - BLOCK
      ?auto_641738 - BLOCK
      ?auto_641739 - BLOCK
      ?auto_641740 - BLOCK
      ?auto_641741 - BLOCK
      ?auto_641742 - BLOCK
      ?auto_641743 - BLOCK
      ?auto_641744 - BLOCK
      ?auto_641745 - BLOCK
      ?auto_641746 - BLOCK
      ?auto_641747 - BLOCK
      ?auto_641748 - BLOCK
      ?auto_641749 - BLOCK
    )
    :vars
    (
      ?auto_641750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_641749 ?auto_641750 ) ( ON-TABLE ?auto_641733 ) ( ON ?auto_641734 ?auto_641733 ) ( ON ?auto_641735 ?auto_641734 ) ( ON ?auto_641736 ?auto_641735 ) ( ON ?auto_641737 ?auto_641736 ) ( ON ?auto_641738 ?auto_641737 ) ( ON ?auto_641739 ?auto_641738 ) ( ON ?auto_641740 ?auto_641739 ) ( ON ?auto_641741 ?auto_641740 ) ( ON ?auto_641742 ?auto_641741 ) ( ON ?auto_641743 ?auto_641742 ) ( ON ?auto_641744 ?auto_641743 ) ( not ( = ?auto_641733 ?auto_641734 ) ) ( not ( = ?auto_641733 ?auto_641735 ) ) ( not ( = ?auto_641733 ?auto_641736 ) ) ( not ( = ?auto_641733 ?auto_641737 ) ) ( not ( = ?auto_641733 ?auto_641738 ) ) ( not ( = ?auto_641733 ?auto_641739 ) ) ( not ( = ?auto_641733 ?auto_641740 ) ) ( not ( = ?auto_641733 ?auto_641741 ) ) ( not ( = ?auto_641733 ?auto_641742 ) ) ( not ( = ?auto_641733 ?auto_641743 ) ) ( not ( = ?auto_641733 ?auto_641744 ) ) ( not ( = ?auto_641733 ?auto_641745 ) ) ( not ( = ?auto_641733 ?auto_641746 ) ) ( not ( = ?auto_641733 ?auto_641747 ) ) ( not ( = ?auto_641733 ?auto_641748 ) ) ( not ( = ?auto_641733 ?auto_641749 ) ) ( not ( = ?auto_641733 ?auto_641750 ) ) ( not ( = ?auto_641734 ?auto_641735 ) ) ( not ( = ?auto_641734 ?auto_641736 ) ) ( not ( = ?auto_641734 ?auto_641737 ) ) ( not ( = ?auto_641734 ?auto_641738 ) ) ( not ( = ?auto_641734 ?auto_641739 ) ) ( not ( = ?auto_641734 ?auto_641740 ) ) ( not ( = ?auto_641734 ?auto_641741 ) ) ( not ( = ?auto_641734 ?auto_641742 ) ) ( not ( = ?auto_641734 ?auto_641743 ) ) ( not ( = ?auto_641734 ?auto_641744 ) ) ( not ( = ?auto_641734 ?auto_641745 ) ) ( not ( = ?auto_641734 ?auto_641746 ) ) ( not ( = ?auto_641734 ?auto_641747 ) ) ( not ( = ?auto_641734 ?auto_641748 ) ) ( not ( = ?auto_641734 ?auto_641749 ) ) ( not ( = ?auto_641734 ?auto_641750 ) ) ( not ( = ?auto_641735 ?auto_641736 ) ) ( not ( = ?auto_641735 ?auto_641737 ) ) ( not ( = ?auto_641735 ?auto_641738 ) ) ( not ( = ?auto_641735 ?auto_641739 ) ) ( not ( = ?auto_641735 ?auto_641740 ) ) ( not ( = ?auto_641735 ?auto_641741 ) ) ( not ( = ?auto_641735 ?auto_641742 ) ) ( not ( = ?auto_641735 ?auto_641743 ) ) ( not ( = ?auto_641735 ?auto_641744 ) ) ( not ( = ?auto_641735 ?auto_641745 ) ) ( not ( = ?auto_641735 ?auto_641746 ) ) ( not ( = ?auto_641735 ?auto_641747 ) ) ( not ( = ?auto_641735 ?auto_641748 ) ) ( not ( = ?auto_641735 ?auto_641749 ) ) ( not ( = ?auto_641735 ?auto_641750 ) ) ( not ( = ?auto_641736 ?auto_641737 ) ) ( not ( = ?auto_641736 ?auto_641738 ) ) ( not ( = ?auto_641736 ?auto_641739 ) ) ( not ( = ?auto_641736 ?auto_641740 ) ) ( not ( = ?auto_641736 ?auto_641741 ) ) ( not ( = ?auto_641736 ?auto_641742 ) ) ( not ( = ?auto_641736 ?auto_641743 ) ) ( not ( = ?auto_641736 ?auto_641744 ) ) ( not ( = ?auto_641736 ?auto_641745 ) ) ( not ( = ?auto_641736 ?auto_641746 ) ) ( not ( = ?auto_641736 ?auto_641747 ) ) ( not ( = ?auto_641736 ?auto_641748 ) ) ( not ( = ?auto_641736 ?auto_641749 ) ) ( not ( = ?auto_641736 ?auto_641750 ) ) ( not ( = ?auto_641737 ?auto_641738 ) ) ( not ( = ?auto_641737 ?auto_641739 ) ) ( not ( = ?auto_641737 ?auto_641740 ) ) ( not ( = ?auto_641737 ?auto_641741 ) ) ( not ( = ?auto_641737 ?auto_641742 ) ) ( not ( = ?auto_641737 ?auto_641743 ) ) ( not ( = ?auto_641737 ?auto_641744 ) ) ( not ( = ?auto_641737 ?auto_641745 ) ) ( not ( = ?auto_641737 ?auto_641746 ) ) ( not ( = ?auto_641737 ?auto_641747 ) ) ( not ( = ?auto_641737 ?auto_641748 ) ) ( not ( = ?auto_641737 ?auto_641749 ) ) ( not ( = ?auto_641737 ?auto_641750 ) ) ( not ( = ?auto_641738 ?auto_641739 ) ) ( not ( = ?auto_641738 ?auto_641740 ) ) ( not ( = ?auto_641738 ?auto_641741 ) ) ( not ( = ?auto_641738 ?auto_641742 ) ) ( not ( = ?auto_641738 ?auto_641743 ) ) ( not ( = ?auto_641738 ?auto_641744 ) ) ( not ( = ?auto_641738 ?auto_641745 ) ) ( not ( = ?auto_641738 ?auto_641746 ) ) ( not ( = ?auto_641738 ?auto_641747 ) ) ( not ( = ?auto_641738 ?auto_641748 ) ) ( not ( = ?auto_641738 ?auto_641749 ) ) ( not ( = ?auto_641738 ?auto_641750 ) ) ( not ( = ?auto_641739 ?auto_641740 ) ) ( not ( = ?auto_641739 ?auto_641741 ) ) ( not ( = ?auto_641739 ?auto_641742 ) ) ( not ( = ?auto_641739 ?auto_641743 ) ) ( not ( = ?auto_641739 ?auto_641744 ) ) ( not ( = ?auto_641739 ?auto_641745 ) ) ( not ( = ?auto_641739 ?auto_641746 ) ) ( not ( = ?auto_641739 ?auto_641747 ) ) ( not ( = ?auto_641739 ?auto_641748 ) ) ( not ( = ?auto_641739 ?auto_641749 ) ) ( not ( = ?auto_641739 ?auto_641750 ) ) ( not ( = ?auto_641740 ?auto_641741 ) ) ( not ( = ?auto_641740 ?auto_641742 ) ) ( not ( = ?auto_641740 ?auto_641743 ) ) ( not ( = ?auto_641740 ?auto_641744 ) ) ( not ( = ?auto_641740 ?auto_641745 ) ) ( not ( = ?auto_641740 ?auto_641746 ) ) ( not ( = ?auto_641740 ?auto_641747 ) ) ( not ( = ?auto_641740 ?auto_641748 ) ) ( not ( = ?auto_641740 ?auto_641749 ) ) ( not ( = ?auto_641740 ?auto_641750 ) ) ( not ( = ?auto_641741 ?auto_641742 ) ) ( not ( = ?auto_641741 ?auto_641743 ) ) ( not ( = ?auto_641741 ?auto_641744 ) ) ( not ( = ?auto_641741 ?auto_641745 ) ) ( not ( = ?auto_641741 ?auto_641746 ) ) ( not ( = ?auto_641741 ?auto_641747 ) ) ( not ( = ?auto_641741 ?auto_641748 ) ) ( not ( = ?auto_641741 ?auto_641749 ) ) ( not ( = ?auto_641741 ?auto_641750 ) ) ( not ( = ?auto_641742 ?auto_641743 ) ) ( not ( = ?auto_641742 ?auto_641744 ) ) ( not ( = ?auto_641742 ?auto_641745 ) ) ( not ( = ?auto_641742 ?auto_641746 ) ) ( not ( = ?auto_641742 ?auto_641747 ) ) ( not ( = ?auto_641742 ?auto_641748 ) ) ( not ( = ?auto_641742 ?auto_641749 ) ) ( not ( = ?auto_641742 ?auto_641750 ) ) ( not ( = ?auto_641743 ?auto_641744 ) ) ( not ( = ?auto_641743 ?auto_641745 ) ) ( not ( = ?auto_641743 ?auto_641746 ) ) ( not ( = ?auto_641743 ?auto_641747 ) ) ( not ( = ?auto_641743 ?auto_641748 ) ) ( not ( = ?auto_641743 ?auto_641749 ) ) ( not ( = ?auto_641743 ?auto_641750 ) ) ( not ( = ?auto_641744 ?auto_641745 ) ) ( not ( = ?auto_641744 ?auto_641746 ) ) ( not ( = ?auto_641744 ?auto_641747 ) ) ( not ( = ?auto_641744 ?auto_641748 ) ) ( not ( = ?auto_641744 ?auto_641749 ) ) ( not ( = ?auto_641744 ?auto_641750 ) ) ( not ( = ?auto_641745 ?auto_641746 ) ) ( not ( = ?auto_641745 ?auto_641747 ) ) ( not ( = ?auto_641745 ?auto_641748 ) ) ( not ( = ?auto_641745 ?auto_641749 ) ) ( not ( = ?auto_641745 ?auto_641750 ) ) ( not ( = ?auto_641746 ?auto_641747 ) ) ( not ( = ?auto_641746 ?auto_641748 ) ) ( not ( = ?auto_641746 ?auto_641749 ) ) ( not ( = ?auto_641746 ?auto_641750 ) ) ( not ( = ?auto_641747 ?auto_641748 ) ) ( not ( = ?auto_641747 ?auto_641749 ) ) ( not ( = ?auto_641747 ?auto_641750 ) ) ( not ( = ?auto_641748 ?auto_641749 ) ) ( not ( = ?auto_641748 ?auto_641750 ) ) ( not ( = ?auto_641749 ?auto_641750 ) ) ( ON ?auto_641748 ?auto_641749 ) ( ON ?auto_641747 ?auto_641748 ) ( ON ?auto_641746 ?auto_641747 ) ( CLEAR ?auto_641744 ) ( ON ?auto_641745 ?auto_641746 ) ( CLEAR ?auto_641745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_641733 ?auto_641734 ?auto_641735 ?auto_641736 ?auto_641737 ?auto_641738 ?auto_641739 ?auto_641740 ?auto_641741 ?auto_641742 ?auto_641743 ?auto_641744 ?auto_641745 )
      ( MAKE-17PILE ?auto_641733 ?auto_641734 ?auto_641735 ?auto_641736 ?auto_641737 ?auto_641738 ?auto_641739 ?auto_641740 ?auto_641741 ?auto_641742 ?auto_641743 ?auto_641744 ?auto_641745 ?auto_641746 ?auto_641747 ?auto_641748 ?auto_641749 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_641768 - BLOCK
      ?auto_641769 - BLOCK
      ?auto_641770 - BLOCK
      ?auto_641771 - BLOCK
      ?auto_641772 - BLOCK
      ?auto_641773 - BLOCK
      ?auto_641774 - BLOCK
      ?auto_641775 - BLOCK
      ?auto_641776 - BLOCK
      ?auto_641777 - BLOCK
      ?auto_641778 - BLOCK
      ?auto_641779 - BLOCK
      ?auto_641780 - BLOCK
      ?auto_641781 - BLOCK
      ?auto_641782 - BLOCK
      ?auto_641783 - BLOCK
      ?auto_641784 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_641784 ) ( ON-TABLE ?auto_641768 ) ( ON ?auto_641769 ?auto_641768 ) ( ON ?auto_641770 ?auto_641769 ) ( ON ?auto_641771 ?auto_641770 ) ( ON ?auto_641772 ?auto_641771 ) ( ON ?auto_641773 ?auto_641772 ) ( ON ?auto_641774 ?auto_641773 ) ( ON ?auto_641775 ?auto_641774 ) ( ON ?auto_641776 ?auto_641775 ) ( ON ?auto_641777 ?auto_641776 ) ( ON ?auto_641778 ?auto_641777 ) ( ON ?auto_641779 ?auto_641778 ) ( not ( = ?auto_641768 ?auto_641769 ) ) ( not ( = ?auto_641768 ?auto_641770 ) ) ( not ( = ?auto_641768 ?auto_641771 ) ) ( not ( = ?auto_641768 ?auto_641772 ) ) ( not ( = ?auto_641768 ?auto_641773 ) ) ( not ( = ?auto_641768 ?auto_641774 ) ) ( not ( = ?auto_641768 ?auto_641775 ) ) ( not ( = ?auto_641768 ?auto_641776 ) ) ( not ( = ?auto_641768 ?auto_641777 ) ) ( not ( = ?auto_641768 ?auto_641778 ) ) ( not ( = ?auto_641768 ?auto_641779 ) ) ( not ( = ?auto_641768 ?auto_641780 ) ) ( not ( = ?auto_641768 ?auto_641781 ) ) ( not ( = ?auto_641768 ?auto_641782 ) ) ( not ( = ?auto_641768 ?auto_641783 ) ) ( not ( = ?auto_641768 ?auto_641784 ) ) ( not ( = ?auto_641769 ?auto_641770 ) ) ( not ( = ?auto_641769 ?auto_641771 ) ) ( not ( = ?auto_641769 ?auto_641772 ) ) ( not ( = ?auto_641769 ?auto_641773 ) ) ( not ( = ?auto_641769 ?auto_641774 ) ) ( not ( = ?auto_641769 ?auto_641775 ) ) ( not ( = ?auto_641769 ?auto_641776 ) ) ( not ( = ?auto_641769 ?auto_641777 ) ) ( not ( = ?auto_641769 ?auto_641778 ) ) ( not ( = ?auto_641769 ?auto_641779 ) ) ( not ( = ?auto_641769 ?auto_641780 ) ) ( not ( = ?auto_641769 ?auto_641781 ) ) ( not ( = ?auto_641769 ?auto_641782 ) ) ( not ( = ?auto_641769 ?auto_641783 ) ) ( not ( = ?auto_641769 ?auto_641784 ) ) ( not ( = ?auto_641770 ?auto_641771 ) ) ( not ( = ?auto_641770 ?auto_641772 ) ) ( not ( = ?auto_641770 ?auto_641773 ) ) ( not ( = ?auto_641770 ?auto_641774 ) ) ( not ( = ?auto_641770 ?auto_641775 ) ) ( not ( = ?auto_641770 ?auto_641776 ) ) ( not ( = ?auto_641770 ?auto_641777 ) ) ( not ( = ?auto_641770 ?auto_641778 ) ) ( not ( = ?auto_641770 ?auto_641779 ) ) ( not ( = ?auto_641770 ?auto_641780 ) ) ( not ( = ?auto_641770 ?auto_641781 ) ) ( not ( = ?auto_641770 ?auto_641782 ) ) ( not ( = ?auto_641770 ?auto_641783 ) ) ( not ( = ?auto_641770 ?auto_641784 ) ) ( not ( = ?auto_641771 ?auto_641772 ) ) ( not ( = ?auto_641771 ?auto_641773 ) ) ( not ( = ?auto_641771 ?auto_641774 ) ) ( not ( = ?auto_641771 ?auto_641775 ) ) ( not ( = ?auto_641771 ?auto_641776 ) ) ( not ( = ?auto_641771 ?auto_641777 ) ) ( not ( = ?auto_641771 ?auto_641778 ) ) ( not ( = ?auto_641771 ?auto_641779 ) ) ( not ( = ?auto_641771 ?auto_641780 ) ) ( not ( = ?auto_641771 ?auto_641781 ) ) ( not ( = ?auto_641771 ?auto_641782 ) ) ( not ( = ?auto_641771 ?auto_641783 ) ) ( not ( = ?auto_641771 ?auto_641784 ) ) ( not ( = ?auto_641772 ?auto_641773 ) ) ( not ( = ?auto_641772 ?auto_641774 ) ) ( not ( = ?auto_641772 ?auto_641775 ) ) ( not ( = ?auto_641772 ?auto_641776 ) ) ( not ( = ?auto_641772 ?auto_641777 ) ) ( not ( = ?auto_641772 ?auto_641778 ) ) ( not ( = ?auto_641772 ?auto_641779 ) ) ( not ( = ?auto_641772 ?auto_641780 ) ) ( not ( = ?auto_641772 ?auto_641781 ) ) ( not ( = ?auto_641772 ?auto_641782 ) ) ( not ( = ?auto_641772 ?auto_641783 ) ) ( not ( = ?auto_641772 ?auto_641784 ) ) ( not ( = ?auto_641773 ?auto_641774 ) ) ( not ( = ?auto_641773 ?auto_641775 ) ) ( not ( = ?auto_641773 ?auto_641776 ) ) ( not ( = ?auto_641773 ?auto_641777 ) ) ( not ( = ?auto_641773 ?auto_641778 ) ) ( not ( = ?auto_641773 ?auto_641779 ) ) ( not ( = ?auto_641773 ?auto_641780 ) ) ( not ( = ?auto_641773 ?auto_641781 ) ) ( not ( = ?auto_641773 ?auto_641782 ) ) ( not ( = ?auto_641773 ?auto_641783 ) ) ( not ( = ?auto_641773 ?auto_641784 ) ) ( not ( = ?auto_641774 ?auto_641775 ) ) ( not ( = ?auto_641774 ?auto_641776 ) ) ( not ( = ?auto_641774 ?auto_641777 ) ) ( not ( = ?auto_641774 ?auto_641778 ) ) ( not ( = ?auto_641774 ?auto_641779 ) ) ( not ( = ?auto_641774 ?auto_641780 ) ) ( not ( = ?auto_641774 ?auto_641781 ) ) ( not ( = ?auto_641774 ?auto_641782 ) ) ( not ( = ?auto_641774 ?auto_641783 ) ) ( not ( = ?auto_641774 ?auto_641784 ) ) ( not ( = ?auto_641775 ?auto_641776 ) ) ( not ( = ?auto_641775 ?auto_641777 ) ) ( not ( = ?auto_641775 ?auto_641778 ) ) ( not ( = ?auto_641775 ?auto_641779 ) ) ( not ( = ?auto_641775 ?auto_641780 ) ) ( not ( = ?auto_641775 ?auto_641781 ) ) ( not ( = ?auto_641775 ?auto_641782 ) ) ( not ( = ?auto_641775 ?auto_641783 ) ) ( not ( = ?auto_641775 ?auto_641784 ) ) ( not ( = ?auto_641776 ?auto_641777 ) ) ( not ( = ?auto_641776 ?auto_641778 ) ) ( not ( = ?auto_641776 ?auto_641779 ) ) ( not ( = ?auto_641776 ?auto_641780 ) ) ( not ( = ?auto_641776 ?auto_641781 ) ) ( not ( = ?auto_641776 ?auto_641782 ) ) ( not ( = ?auto_641776 ?auto_641783 ) ) ( not ( = ?auto_641776 ?auto_641784 ) ) ( not ( = ?auto_641777 ?auto_641778 ) ) ( not ( = ?auto_641777 ?auto_641779 ) ) ( not ( = ?auto_641777 ?auto_641780 ) ) ( not ( = ?auto_641777 ?auto_641781 ) ) ( not ( = ?auto_641777 ?auto_641782 ) ) ( not ( = ?auto_641777 ?auto_641783 ) ) ( not ( = ?auto_641777 ?auto_641784 ) ) ( not ( = ?auto_641778 ?auto_641779 ) ) ( not ( = ?auto_641778 ?auto_641780 ) ) ( not ( = ?auto_641778 ?auto_641781 ) ) ( not ( = ?auto_641778 ?auto_641782 ) ) ( not ( = ?auto_641778 ?auto_641783 ) ) ( not ( = ?auto_641778 ?auto_641784 ) ) ( not ( = ?auto_641779 ?auto_641780 ) ) ( not ( = ?auto_641779 ?auto_641781 ) ) ( not ( = ?auto_641779 ?auto_641782 ) ) ( not ( = ?auto_641779 ?auto_641783 ) ) ( not ( = ?auto_641779 ?auto_641784 ) ) ( not ( = ?auto_641780 ?auto_641781 ) ) ( not ( = ?auto_641780 ?auto_641782 ) ) ( not ( = ?auto_641780 ?auto_641783 ) ) ( not ( = ?auto_641780 ?auto_641784 ) ) ( not ( = ?auto_641781 ?auto_641782 ) ) ( not ( = ?auto_641781 ?auto_641783 ) ) ( not ( = ?auto_641781 ?auto_641784 ) ) ( not ( = ?auto_641782 ?auto_641783 ) ) ( not ( = ?auto_641782 ?auto_641784 ) ) ( not ( = ?auto_641783 ?auto_641784 ) ) ( ON ?auto_641783 ?auto_641784 ) ( ON ?auto_641782 ?auto_641783 ) ( ON ?auto_641781 ?auto_641782 ) ( CLEAR ?auto_641779 ) ( ON ?auto_641780 ?auto_641781 ) ( CLEAR ?auto_641780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_641768 ?auto_641769 ?auto_641770 ?auto_641771 ?auto_641772 ?auto_641773 ?auto_641774 ?auto_641775 ?auto_641776 ?auto_641777 ?auto_641778 ?auto_641779 ?auto_641780 )
      ( MAKE-17PILE ?auto_641768 ?auto_641769 ?auto_641770 ?auto_641771 ?auto_641772 ?auto_641773 ?auto_641774 ?auto_641775 ?auto_641776 ?auto_641777 ?auto_641778 ?auto_641779 ?auto_641780 ?auto_641781 ?auto_641782 ?auto_641783 ?auto_641784 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_641802 - BLOCK
      ?auto_641803 - BLOCK
      ?auto_641804 - BLOCK
      ?auto_641805 - BLOCK
      ?auto_641806 - BLOCK
      ?auto_641807 - BLOCK
      ?auto_641808 - BLOCK
      ?auto_641809 - BLOCK
      ?auto_641810 - BLOCK
      ?auto_641811 - BLOCK
      ?auto_641812 - BLOCK
      ?auto_641813 - BLOCK
      ?auto_641814 - BLOCK
      ?auto_641815 - BLOCK
      ?auto_641816 - BLOCK
      ?auto_641817 - BLOCK
      ?auto_641818 - BLOCK
    )
    :vars
    (
      ?auto_641819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_641818 ?auto_641819 ) ( ON-TABLE ?auto_641802 ) ( ON ?auto_641803 ?auto_641802 ) ( ON ?auto_641804 ?auto_641803 ) ( ON ?auto_641805 ?auto_641804 ) ( ON ?auto_641806 ?auto_641805 ) ( ON ?auto_641807 ?auto_641806 ) ( ON ?auto_641808 ?auto_641807 ) ( ON ?auto_641809 ?auto_641808 ) ( ON ?auto_641810 ?auto_641809 ) ( ON ?auto_641811 ?auto_641810 ) ( ON ?auto_641812 ?auto_641811 ) ( not ( = ?auto_641802 ?auto_641803 ) ) ( not ( = ?auto_641802 ?auto_641804 ) ) ( not ( = ?auto_641802 ?auto_641805 ) ) ( not ( = ?auto_641802 ?auto_641806 ) ) ( not ( = ?auto_641802 ?auto_641807 ) ) ( not ( = ?auto_641802 ?auto_641808 ) ) ( not ( = ?auto_641802 ?auto_641809 ) ) ( not ( = ?auto_641802 ?auto_641810 ) ) ( not ( = ?auto_641802 ?auto_641811 ) ) ( not ( = ?auto_641802 ?auto_641812 ) ) ( not ( = ?auto_641802 ?auto_641813 ) ) ( not ( = ?auto_641802 ?auto_641814 ) ) ( not ( = ?auto_641802 ?auto_641815 ) ) ( not ( = ?auto_641802 ?auto_641816 ) ) ( not ( = ?auto_641802 ?auto_641817 ) ) ( not ( = ?auto_641802 ?auto_641818 ) ) ( not ( = ?auto_641802 ?auto_641819 ) ) ( not ( = ?auto_641803 ?auto_641804 ) ) ( not ( = ?auto_641803 ?auto_641805 ) ) ( not ( = ?auto_641803 ?auto_641806 ) ) ( not ( = ?auto_641803 ?auto_641807 ) ) ( not ( = ?auto_641803 ?auto_641808 ) ) ( not ( = ?auto_641803 ?auto_641809 ) ) ( not ( = ?auto_641803 ?auto_641810 ) ) ( not ( = ?auto_641803 ?auto_641811 ) ) ( not ( = ?auto_641803 ?auto_641812 ) ) ( not ( = ?auto_641803 ?auto_641813 ) ) ( not ( = ?auto_641803 ?auto_641814 ) ) ( not ( = ?auto_641803 ?auto_641815 ) ) ( not ( = ?auto_641803 ?auto_641816 ) ) ( not ( = ?auto_641803 ?auto_641817 ) ) ( not ( = ?auto_641803 ?auto_641818 ) ) ( not ( = ?auto_641803 ?auto_641819 ) ) ( not ( = ?auto_641804 ?auto_641805 ) ) ( not ( = ?auto_641804 ?auto_641806 ) ) ( not ( = ?auto_641804 ?auto_641807 ) ) ( not ( = ?auto_641804 ?auto_641808 ) ) ( not ( = ?auto_641804 ?auto_641809 ) ) ( not ( = ?auto_641804 ?auto_641810 ) ) ( not ( = ?auto_641804 ?auto_641811 ) ) ( not ( = ?auto_641804 ?auto_641812 ) ) ( not ( = ?auto_641804 ?auto_641813 ) ) ( not ( = ?auto_641804 ?auto_641814 ) ) ( not ( = ?auto_641804 ?auto_641815 ) ) ( not ( = ?auto_641804 ?auto_641816 ) ) ( not ( = ?auto_641804 ?auto_641817 ) ) ( not ( = ?auto_641804 ?auto_641818 ) ) ( not ( = ?auto_641804 ?auto_641819 ) ) ( not ( = ?auto_641805 ?auto_641806 ) ) ( not ( = ?auto_641805 ?auto_641807 ) ) ( not ( = ?auto_641805 ?auto_641808 ) ) ( not ( = ?auto_641805 ?auto_641809 ) ) ( not ( = ?auto_641805 ?auto_641810 ) ) ( not ( = ?auto_641805 ?auto_641811 ) ) ( not ( = ?auto_641805 ?auto_641812 ) ) ( not ( = ?auto_641805 ?auto_641813 ) ) ( not ( = ?auto_641805 ?auto_641814 ) ) ( not ( = ?auto_641805 ?auto_641815 ) ) ( not ( = ?auto_641805 ?auto_641816 ) ) ( not ( = ?auto_641805 ?auto_641817 ) ) ( not ( = ?auto_641805 ?auto_641818 ) ) ( not ( = ?auto_641805 ?auto_641819 ) ) ( not ( = ?auto_641806 ?auto_641807 ) ) ( not ( = ?auto_641806 ?auto_641808 ) ) ( not ( = ?auto_641806 ?auto_641809 ) ) ( not ( = ?auto_641806 ?auto_641810 ) ) ( not ( = ?auto_641806 ?auto_641811 ) ) ( not ( = ?auto_641806 ?auto_641812 ) ) ( not ( = ?auto_641806 ?auto_641813 ) ) ( not ( = ?auto_641806 ?auto_641814 ) ) ( not ( = ?auto_641806 ?auto_641815 ) ) ( not ( = ?auto_641806 ?auto_641816 ) ) ( not ( = ?auto_641806 ?auto_641817 ) ) ( not ( = ?auto_641806 ?auto_641818 ) ) ( not ( = ?auto_641806 ?auto_641819 ) ) ( not ( = ?auto_641807 ?auto_641808 ) ) ( not ( = ?auto_641807 ?auto_641809 ) ) ( not ( = ?auto_641807 ?auto_641810 ) ) ( not ( = ?auto_641807 ?auto_641811 ) ) ( not ( = ?auto_641807 ?auto_641812 ) ) ( not ( = ?auto_641807 ?auto_641813 ) ) ( not ( = ?auto_641807 ?auto_641814 ) ) ( not ( = ?auto_641807 ?auto_641815 ) ) ( not ( = ?auto_641807 ?auto_641816 ) ) ( not ( = ?auto_641807 ?auto_641817 ) ) ( not ( = ?auto_641807 ?auto_641818 ) ) ( not ( = ?auto_641807 ?auto_641819 ) ) ( not ( = ?auto_641808 ?auto_641809 ) ) ( not ( = ?auto_641808 ?auto_641810 ) ) ( not ( = ?auto_641808 ?auto_641811 ) ) ( not ( = ?auto_641808 ?auto_641812 ) ) ( not ( = ?auto_641808 ?auto_641813 ) ) ( not ( = ?auto_641808 ?auto_641814 ) ) ( not ( = ?auto_641808 ?auto_641815 ) ) ( not ( = ?auto_641808 ?auto_641816 ) ) ( not ( = ?auto_641808 ?auto_641817 ) ) ( not ( = ?auto_641808 ?auto_641818 ) ) ( not ( = ?auto_641808 ?auto_641819 ) ) ( not ( = ?auto_641809 ?auto_641810 ) ) ( not ( = ?auto_641809 ?auto_641811 ) ) ( not ( = ?auto_641809 ?auto_641812 ) ) ( not ( = ?auto_641809 ?auto_641813 ) ) ( not ( = ?auto_641809 ?auto_641814 ) ) ( not ( = ?auto_641809 ?auto_641815 ) ) ( not ( = ?auto_641809 ?auto_641816 ) ) ( not ( = ?auto_641809 ?auto_641817 ) ) ( not ( = ?auto_641809 ?auto_641818 ) ) ( not ( = ?auto_641809 ?auto_641819 ) ) ( not ( = ?auto_641810 ?auto_641811 ) ) ( not ( = ?auto_641810 ?auto_641812 ) ) ( not ( = ?auto_641810 ?auto_641813 ) ) ( not ( = ?auto_641810 ?auto_641814 ) ) ( not ( = ?auto_641810 ?auto_641815 ) ) ( not ( = ?auto_641810 ?auto_641816 ) ) ( not ( = ?auto_641810 ?auto_641817 ) ) ( not ( = ?auto_641810 ?auto_641818 ) ) ( not ( = ?auto_641810 ?auto_641819 ) ) ( not ( = ?auto_641811 ?auto_641812 ) ) ( not ( = ?auto_641811 ?auto_641813 ) ) ( not ( = ?auto_641811 ?auto_641814 ) ) ( not ( = ?auto_641811 ?auto_641815 ) ) ( not ( = ?auto_641811 ?auto_641816 ) ) ( not ( = ?auto_641811 ?auto_641817 ) ) ( not ( = ?auto_641811 ?auto_641818 ) ) ( not ( = ?auto_641811 ?auto_641819 ) ) ( not ( = ?auto_641812 ?auto_641813 ) ) ( not ( = ?auto_641812 ?auto_641814 ) ) ( not ( = ?auto_641812 ?auto_641815 ) ) ( not ( = ?auto_641812 ?auto_641816 ) ) ( not ( = ?auto_641812 ?auto_641817 ) ) ( not ( = ?auto_641812 ?auto_641818 ) ) ( not ( = ?auto_641812 ?auto_641819 ) ) ( not ( = ?auto_641813 ?auto_641814 ) ) ( not ( = ?auto_641813 ?auto_641815 ) ) ( not ( = ?auto_641813 ?auto_641816 ) ) ( not ( = ?auto_641813 ?auto_641817 ) ) ( not ( = ?auto_641813 ?auto_641818 ) ) ( not ( = ?auto_641813 ?auto_641819 ) ) ( not ( = ?auto_641814 ?auto_641815 ) ) ( not ( = ?auto_641814 ?auto_641816 ) ) ( not ( = ?auto_641814 ?auto_641817 ) ) ( not ( = ?auto_641814 ?auto_641818 ) ) ( not ( = ?auto_641814 ?auto_641819 ) ) ( not ( = ?auto_641815 ?auto_641816 ) ) ( not ( = ?auto_641815 ?auto_641817 ) ) ( not ( = ?auto_641815 ?auto_641818 ) ) ( not ( = ?auto_641815 ?auto_641819 ) ) ( not ( = ?auto_641816 ?auto_641817 ) ) ( not ( = ?auto_641816 ?auto_641818 ) ) ( not ( = ?auto_641816 ?auto_641819 ) ) ( not ( = ?auto_641817 ?auto_641818 ) ) ( not ( = ?auto_641817 ?auto_641819 ) ) ( not ( = ?auto_641818 ?auto_641819 ) ) ( ON ?auto_641817 ?auto_641818 ) ( ON ?auto_641816 ?auto_641817 ) ( ON ?auto_641815 ?auto_641816 ) ( ON ?auto_641814 ?auto_641815 ) ( CLEAR ?auto_641812 ) ( ON ?auto_641813 ?auto_641814 ) ( CLEAR ?auto_641813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_641802 ?auto_641803 ?auto_641804 ?auto_641805 ?auto_641806 ?auto_641807 ?auto_641808 ?auto_641809 ?auto_641810 ?auto_641811 ?auto_641812 ?auto_641813 )
      ( MAKE-17PILE ?auto_641802 ?auto_641803 ?auto_641804 ?auto_641805 ?auto_641806 ?auto_641807 ?auto_641808 ?auto_641809 ?auto_641810 ?auto_641811 ?auto_641812 ?auto_641813 ?auto_641814 ?auto_641815 ?auto_641816 ?auto_641817 ?auto_641818 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_641837 - BLOCK
      ?auto_641838 - BLOCK
      ?auto_641839 - BLOCK
      ?auto_641840 - BLOCK
      ?auto_641841 - BLOCK
      ?auto_641842 - BLOCK
      ?auto_641843 - BLOCK
      ?auto_641844 - BLOCK
      ?auto_641845 - BLOCK
      ?auto_641846 - BLOCK
      ?auto_641847 - BLOCK
      ?auto_641848 - BLOCK
      ?auto_641849 - BLOCK
      ?auto_641850 - BLOCK
      ?auto_641851 - BLOCK
      ?auto_641852 - BLOCK
      ?auto_641853 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_641853 ) ( ON-TABLE ?auto_641837 ) ( ON ?auto_641838 ?auto_641837 ) ( ON ?auto_641839 ?auto_641838 ) ( ON ?auto_641840 ?auto_641839 ) ( ON ?auto_641841 ?auto_641840 ) ( ON ?auto_641842 ?auto_641841 ) ( ON ?auto_641843 ?auto_641842 ) ( ON ?auto_641844 ?auto_641843 ) ( ON ?auto_641845 ?auto_641844 ) ( ON ?auto_641846 ?auto_641845 ) ( ON ?auto_641847 ?auto_641846 ) ( not ( = ?auto_641837 ?auto_641838 ) ) ( not ( = ?auto_641837 ?auto_641839 ) ) ( not ( = ?auto_641837 ?auto_641840 ) ) ( not ( = ?auto_641837 ?auto_641841 ) ) ( not ( = ?auto_641837 ?auto_641842 ) ) ( not ( = ?auto_641837 ?auto_641843 ) ) ( not ( = ?auto_641837 ?auto_641844 ) ) ( not ( = ?auto_641837 ?auto_641845 ) ) ( not ( = ?auto_641837 ?auto_641846 ) ) ( not ( = ?auto_641837 ?auto_641847 ) ) ( not ( = ?auto_641837 ?auto_641848 ) ) ( not ( = ?auto_641837 ?auto_641849 ) ) ( not ( = ?auto_641837 ?auto_641850 ) ) ( not ( = ?auto_641837 ?auto_641851 ) ) ( not ( = ?auto_641837 ?auto_641852 ) ) ( not ( = ?auto_641837 ?auto_641853 ) ) ( not ( = ?auto_641838 ?auto_641839 ) ) ( not ( = ?auto_641838 ?auto_641840 ) ) ( not ( = ?auto_641838 ?auto_641841 ) ) ( not ( = ?auto_641838 ?auto_641842 ) ) ( not ( = ?auto_641838 ?auto_641843 ) ) ( not ( = ?auto_641838 ?auto_641844 ) ) ( not ( = ?auto_641838 ?auto_641845 ) ) ( not ( = ?auto_641838 ?auto_641846 ) ) ( not ( = ?auto_641838 ?auto_641847 ) ) ( not ( = ?auto_641838 ?auto_641848 ) ) ( not ( = ?auto_641838 ?auto_641849 ) ) ( not ( = ?auto_641838 ?auto_641850 ) ) ( not ( = ?auto_641838 ?auto_641851 ) ) ( not ( = ?auto_641838 ?auto_641852 ) ) ( not ( = ?auto_641838 ?auto_641853 ) ) ( not ( = ?auto_641839 ?auto_641840 ) ) ( not ( = ?auto_641839 ?auto_641841 ) ) ( not ( = ?auto_641839 ?auto_641842 ) ) ( not ( = ?auto_641839 ?auto_641843 ) ) ( not ( = ?auto_641839 ?auto_641844 ) ) ( not ( = ?auto_641839 ?auto_641845 ) ) ( not ( = ?auto_641839 ?auto_641846 ) ) ( not ( = ?auto_641839 ?auto_641847 ) ) ( not ( = ?auto_641839 ?auto_641848 ) ) ( not ( = ?auto_641839 ?auto_641849 ) ) ( not ( = ?auto_641839 ?auto_641850 ) ) ( not ( = ?auto_641839 ?auto_641851 ) ) ( not ( = ?auto_641839 ?auto_641852 ) ) ( not ( = ?auto_641839 ?auto_641853 ) ) ( not ( = ?auto_641840 ?auto_641841 ) ) ( not ( = ?auto_641840 ?auto_641842 ) ) ( not ( = ?auto_641840 ?auto_641843 ) ) ( not ( = ?auto_641840 ?auto_641844 ) ) ( not ( = ?auto_641840 ?auto_641845 ) ) ( not ( = ?auto_641840 ?auto_641846 ) ) ( not ( = ?auto_641840 ?auto_641847 ) ) ( not ( = ?auto_641840 ?auto_641848 ) ) ( not ( = ?auto_641840 ?auto_641849 ) ) ( not ( = ?auto_641840 ?auto_641850 ) ) ( not ( = ?auto_641840 ?auto_641851 ) ) ( not ( = ?auto_641840 ?auto_641852 ) ) ( not ( = ?auto_641840 ?auto_641853 ) ) ( not ( = ?auto_641841 ?auto_641842 ) ) ( not ( = ?auto_641841 ?auto_641843 ) ) ( not ( = ?auto_641841 ?auto_641844 ) ) ( not ( = ?auto_641841 ?auto_641845 ) ) ( not ( = ?auto_641841 ?auto_641846 ) ) ( not ( = ?auto_641841 ?auto_641847 ) ) ( not ( = ?auto_641841 ?auto_641848 ) ) ( not ( = ?auto_641841 ?auto_641849 ) ) ( not ( = ?auto_641841 ?auto_641850 ) ) ( not ( = ?auto_641841 ?auto_641851 ) ) ( not ( = ?auto_641841 ?auto_641852 ) ) ( not ( = ?auto_641841 ?auto_641853 ) ) ( not ( = ?auto_641842 ?auto_641843 ) ) ( not ( = ?auto_641842 ?auto_641844 ) ) ( not ( = ?auto_641842 ?auto_641845 ) ) ( not ( = ?auto_641842 ?auto_641846 ) ) ( not ( = ?auto_641842 ?auto_641847 ) ) ( not ( = ?auto_641842 ?auto_641848 ) ) ( not ( = ?auto_641842 ?auto_641849 ) ) ( not ( = ?auto_641842 ?auto_641850 ) ) ( not ( = ?auto_641842 ?auto_641851 ) ) ( not ( = ?auto_641842 ?auto_641852 ) ) ( not ( = ?auto_641842 ?auto_641853 ) ) ( not ( = ?auto_641843 ?auto_641844 ) ) ( not ( = ?auto_641843 ?auto_641845 ) ) ( not ( = ?auto_641843 ?auto_641846 ) ) ( not ( = ?auto_641843 ?auto_641847 ) ) ( not ( = ?auto_641843 ?auto_641848 ) ) ( not ( = ?auto_641843 ?auto_641849 ) ) ( not ( = ?auto_641843 ?auto_641850 ) ) ( not ( = ?auto_641843 ?auto_641851 ) ) ( not ( = ?auto_641843 ?auto_641852 ) ) ( not ( = ?auto_641843 ?auto_641853 ) ) ( not ( = ?auto_641844 ?auto_641845 ) ) ( not ( = ?auto_641844 ?auto_641846 ) ) ( not ( = ?auto_641844 ?auto_641847 ) ) ( not ( = ?auto_641844 ?auto_641848 ) ) ( not ( = ?auto_641844 ?auto_641849 ) ) ( not ( = ?auto_641844 ?auto_641850 ) ) ( not ( = ?auto_641844 ?auto_641851 ) ) ( not ( = ?auto_641844 ?auto_641852 ) ) ( not ( = ?auto_641844 ?auto_641853 ) ) ( not ( = ?auto_641845 ?auto_641846 ) ) ( not ( = ?auto_641845 ?auto_641847 ) ) ( not ( = ?auto_641845 ?auto_641848 ) ) ( not ( = ?auto_641845 ?auto_641849 ) ) ( not ( = ?auto_641845 ?auto_641850 ) ) ( not ( = ?auto_641845 ?auto_641851 ) ) ( not ( = ?auto_641845 ?auto_641852 ) ) ( not ( = ?auto_641845 ?auto_641853 ) ) ( not ( = ?auto_641846 ?auto_641847 ) ) ( not ( = ?auto_641846 ?auto_641848 ) ) ( not ( = ?auto_641846 ?auto_641849 ) ) ( not ( = ?auto_641846 ?auto_641850 ) ) ( not ( = ?auto_641846 ?auto_641851 ) ) ( not ( = ?auto_641846 ?auto_641852 ) ) ( not ( = ?auto_641846 ?auto_641853 ) ) ( not ( = ?auto_641847 ?auto_641848 ) ) ( not ( = ?auto_641847 ?auto_641849 ) ) ( not ( = ?auto_641847 ?auto_641850 ) ) ( not ( = ?auto_641847 ?auto_641851 ) ) ( not ( = ?auto_641847 ?auto_641852 ) ) ( not ( = ?auto_641847 ?auto_641853 ) ) ( not ( = ?auto_641848 ?auto_641849 ) ) ( not ( = ?auto_641848 ?auto_641850 ) ) ( not ( = ?auto_641848 ?auto_641851 ) ) ( not ( = ?auto_641848 ?auto_641852 ) ) ( not ( = ?auto_641848 ?auto_641853 ) ) ( not ( = ?auto_641849 ?auto_641850 ) ) ( not ( = ?auto_641849 ?auto_641851 ) ) ( not ( = ?auto_641849 ?auto_641852 ) ) ( not ( = ?auto_641849 ?auto_641853 ) ) ( not ( = ?auto_641850 ?auto_641851 ) ) ( not ( = ?auto_641850 ?auto_641852 ) ) ( not ( = ?auto_641850 ?auto_641853 ) ) ( not ( = ?auto_641851 ?auto_641852 ) ) ( not ( = ?auto_641851 ?auto_641853 ) ) ( not ( = ?auto_641852 ?auto_641853 ) ) ( ON ?auto_641852 ?auto_641853 ) ( ON ?auto_641851 ?auto_641852 ) ( ON ?auto_641850 ?auto_641851 ) ( ON ?auto_641849 ?auto_641850 ) ( CLEAR ?auto_641847 ) ( ON ?auto_641848 ?auto_641849 ) ( CLEAR ?auto_641848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_641837 ?auto_641838 ?auto_641839 ?auto_641840 ?auto_641841 ?auto_641842 ?auto_641843 ?auto_641844 ?auto_641845 ?auto_641846 ?auto_641847 ?auto_641848 )
      ( MAKE-17PILE ?auto_641837 ?auto_641838 ?auto_641839 ?auto_641840 ?auto_641841 ?auto_641842 ?auto_641843 ?auto_641844 ?auto_641845 ?auto_641846 ?auto_641847 ?auto_641848 ?auto_641849 ?auto_641850 ?auto_641851 ?auto_641852 ?auto_641853 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_641871 - BLOCK
      ?auto_641872 - BLOCK
      ?auto_641873 - BLOCK
      ?auto_641874 - BLOCK
      ?auto_641875 - BLOCK
      ?auto_641876 - BLOCK
      ?auto_641877 - BLOCK
      ?auto_641878 - BLOCK
      ?auto_641879 - BLOCK
      ?auto_641880 - BLOCK
      ?auto_641881 - BLOCK
      ?auto_641882 - BLOCK
      ?auto_641883 - BLOCK
      ?auto_641884 - BLOCK
      ?auto_641885 - BLOCK
      ?auto_641886 - BLOCK
      ?auto_641887 - BLOCK
    )
    :vars
    (
      ?auto_641888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_641887 ?auto_641888 ) ( ON-TABLE ?auto_641871 ) ( ON ?auto_641872 ?auto_641871 ) ( ON ?auto_641873 ?auto_641872 ) ( ON ?auto_641874 ?auto_641873 ) ( ON ?auto_641875 ?auto_641874 ) ( ON ?auto_641876 ?auto_641875 ) ( ON ?auto_641877 ?auto_641876 ) ( ON ?auto_641878 ?auto_641877 ) ( ON ?auto_641879 ?auto_641878 ) ( ON ?auto_641880 ?auto_641879 ) ( not ( = ?auto_641871 ?auto_641872 ) ) ( not ( = ?auto_641871 ?auto_641873 ) ) ( not ( = ?auto_641871 ?auto_641874 ) ) ( not ( = ?auto_641871 ?auto_641875 ) ) ( not ( = ?auto_641871 ?auto_641876 ) ) ( not ( = ?auto_641871 ?auto_641877 ) ) ( not ( = ?auto_641871 ?auto_641878 ) ) ( not ( = ?auto_641871 ?auto_641879 ) ) ( not ( = ?auto_641871 ?auto_641880 ) ) ( not ( = ?auto_641871 ?auto_641881 ) ) ( not ( = ?auto_641871 ?auto_641882 ) ) ( not ( = ?auto_641871 ?auto_641883 ) ) ( not ( = ?auto_641871 ?auto_641884 ) ) ( not ( = ?auto_641871 ?auto_641885 ) ) ( not ( = ?auto_641871 ?auto_641886 ) ) ( not ( = ?auto_641871 ?auto_641887 ) ) ( not ( = ?auto_641871 ?auto_641888 ) ) ( not ( = ?auto_641872 ?auto_641873 ) ) ( not ( = ?auto_641872 ?auto_641874 ) ) ( not ( = ?auto_641872 ?auto_641875 ) ) ( not ( = ?auto_641872 ?auto_641876 ) ) ( not ( = ?auto_641872 ?auto_641877 ) ) ( not ( = ?auto_641872 ?auto_641878 ) ) ( not ( = ?auto_641872 ?auto_641879 ) ) ( not ( = ?auto_641872 ?auto_641880 ) ) ( not ( = ?auto_641872 ?auto_641881 ) ) ( not ( = ?auto_641872 ?auto_641882 ) ) ( not ( = ?auto_641872 ?auto_641883 ) ) ( not ( = ?auto_641872 ?auto_641884 ) ) ( not ( = ?auto_641872 ?auto_641885 ) ) ( not ( = ?auto_641872 ?auto_641886 ) ) ( not ( = ?auto_641872 ?auto_641887 ) ) ( not ( = ?auto_641872 ?auto_641888 ) ) ( not ( = ?auto_641873 ?auto_641874 ) ) ( not ( = ?auto_641873 ?auto_641875 ) ) ( not ( = ?auto_641873 ?auto_641876 ) ) ( not ( = ?auto_641873 ?auto_641877 ) ) ( not ( = ?auto_641873 ?auto_641878 ) ) ( not ( = ?auto_641873 ?auto_641879 ) ) ( not ( = ?auto_641873 ?auto_641880 ) ) ( not ( = ?auto_641873 ?auto_641881 ) ) ( not ( = ?auto_641873 ?auto_641882 ) ) ( not ( = ?auto_641873 ?auto_641883 ) ) ( not ( = ?auto_641873 ?auto_641884 ) ) ( not ( = ?auto_641873 ?auto_641885 ) ) ( not ( = ?auto_641873 ?auto_641886 ) ) ( not ( = ?auto_641873 ?auto_641887 ) ) ( not ( = ?auto_641873 ?auto_641888 ) ) ( not ( = ?auto_641874 ?auto_641875 ) ) ( not ( = ?auto_641874 ?auto_641876 ) ) ( not ( = ?auto_641874 ?auto_641877 ) ) ( not ( = ?auto_641874 ?auto_641878 ) ) ( not ( = ?auto_641874 ?auto_641879 ) ) ( not ( = ?auto_641874 ?auto_641880 ) ) ( not ( = ?auto_641874 ?auto_641881 ) ) ( not ( = ?auto_641874 ?auto_641882 ) ) ( not ( = ?auto_641874 ?auto_641883 ) ) ( not ( = ?auto_641874 ?auto_641884 ) ) ( not ( = ?auto_641874 ?auto_641885 ) ) ( not ( = ?auto_641874 ?auto_641886 ) ) ( not ( = ?auto_641874 ?auto_641887 ) ) ( not ( = ?auto_641874 ?auto_641888 ) ) ( not ( = ?auto_641875 ?auto_641876 ) ) ( not ( = ?auto_641875 ?auto_641877 ) ) ( not ( = ?auto_641875 ?auto_641878 ) ) ( not ( = ?auto_641875 ?auto_641879 ) ) ( not ( = ?auto_641875 ?auto_641880 ) ) ( not ( = ?auto_641875 ?auto_641881 ) ) ( not ( = ?auto_641875 ?auto_641882 ) ) ( not ( = ?auto_641875 ?auto_641883 ) ) ( not ( = ?auto_641875 ?auto_641884 ) ) ( not ( = ?auto_641875 ?auto_641885 ) ) ( not ( = ?auto_641875 ?auto_641886 ) ) ( not ( = ?auto_641875 ?auto_641887 ) ) ( not ( = ?auto_641875 ?auto_641888 ) ) ( not ( = ?auto_641876 ?auto_641877 ) ) ( not ( = ?auto_641876 ?auto_641878 ) ) ( not ( = ?auto_641876 ?auto_641879 ) ) ( not ( = ?auto_641876 ?auto_641880 ) ) ( not ( = ?auto_641876 ?auto_641881 ) ) ( not ( = ?auto_641876 ?auto_641882 ) ) ( not ( = ?auto_641876 ?auto_641883 ) ) ( not ( = ?auto_641876 ?auto_641884 ) ) ( not ( = ?auto_641876 ?auto_641885 ) ) ( not ( = ?auto_641876 ?auto_641886 ) ) ( not ( = ?auto_641876 ?auto_641887 ) ) ( not ( = ?auto_641876 ?auto_641888 ) ) ( not ( = ?auto_641877 ?auto_641878 ) ) ( not ( = ?auto_641877 ?auto_641879 ) ) ( not ( = ?auto_641877 ?auto_641880 ) ) ( not ( = ?auto_641877 ?auto_641881 ) ) ( not ( = ?auto_641877 ?auto_641882 ) ) ( not ( = ?auto_641877 ?auto_641883 ) ) ( not ( = ?auto_641877 ?auto_641884 ) ) ( not ( = ?auto_641877 ?auto_641885 ) ) ( not ( = ?auto_641877 ?auto_641886 ) ) ( not ( = ?auto_641877 ?auto_641887 ) ) ( not ( = ?auto_641877 ?auto_641888 ) ) ( not ( = ?auto_641878 ?auto_641879 ) ) ( not ( = ?auto_641878 ?auto_641880 ) ) ( not ( = ?auto_641878 ?auto_641881 ) ) ( not ( = ?auto_641878 ?auto_641882 ) ) ( not ( = ?auto_641878 ?auto_641883 ) ) ( not ( = ?auto_641878 ?auto_641884 ) ) ( not ( = ?auto_641878 ?auto_641885 ) ) ( not ( = ?auto_641878 ?auto_641886 ) ) ( not ( = ?auto_641878 ?auto_641887 ) ) ( not ( = ?auto_641878 ?auto_641888 ) ) ( not ( = ?auto_641879 ?auto_641880 ) ) ( not ( = ?auto_641879 ?auto_641881 ) ) ( not ( = ?auto_641879 ?auto_641882 ) ) ( not ( = ?auto_641879 ?auto_641883 ) ) ( not ( = ?auto_641879 ?auto_641884 ) ) ( not ( = ?auto_641879 ?auto_641885 ) ) ( not ( = ?auto_641879 ?auto_641886 ) ) ( not ( = ?auto_641879 ?auto_641887 ) ) ( not ( = ?auto_641879 ?auto_641888 ) ) ( not ( = ?auto_641880 ?auto_641881 ) ) ( not ( = ?auto_641880 ?auto_641882 ) ) ( not ( = ?auto_641880 ?auto_641883 ) ) ( not ( = ?auto_641880 ?auto_641884 ) ) ( not ( = ?auto_641880 ?auto_641885 ) ) ( not ( = ?auto_641880 ?auto_641886 ) ) ( not ( = ?auto_641880 ?auto_641887 ) ) ( not ( = ?auto_641880 ?auto_641888 ) ) ( not ( = ?auto_641881 ?auto_641882 ) ) ( not ( = ?auto_641881 ?auto_641883 ) ) ( not ( = ?auto_641881 ?auto_641884 ) ) ( not ( = ?auto_641881 ?auto_641885 ) ) ( not ( = ?auto_641881 ?auto_641886 ) ) ( not ( = ?auto_641881 ?auto_641887 ) ) ( not ( = ?auto_641881 ?auto_641888 ) ) ( not ( = ?auto_641882 ?auto_641883 ) ) ( not ( = ?auto_641882 ?auto_641884 ) ) ( not ( = ?auto_641882 ?auto_641885 ) ) ( not ( = ?auto_641882 ?auto_641886 ) ) ( not ( = ?auto_641882 ?auto_641887 ) ) ( not ( = ?auto_641882 ?auto_641888 ) ) ( not ( = ?auto_641883 ?auto_641884 ) ) ( not ( = ?auto_641883 ?auto_641885 ) ) ( not ( = ?auto_641883 ?auto_641886 ) ) ( not ( = ?auto_641883 ?auto_641887 ) ) ( not ( = ?auto_641883 ?auto_641888 ) ) ( not ( = ?auto_641884 ?auto_641885 ) ) ( not ( = ?auto_641884 ?auto_641886 ) ) ( not ( = ?auto_641884 ?auto_641887 ) ) ( not ( = ?auto_641884 ?auto_641888 ) ) ( not ( = ?auto_641885 ?auto_641886 ) ) ( not ( = ?auto_641885 ?auto_641887 ) ) ( not ( = ?auto_641885 ?auto_641888 ) ) ( not ( = ?auto_641886 ?auto_641887 ) ) ( not ( = ?auto_641886 ?auto_641888 ) ) ( not ( = ?auto_641887 ?auto_641888 ) ) ( ON ?auto_641886 ?auto_641887 ) ( ON ?auto_641885 ?auto_641886 ) ( ON ?auto_641884 ?auto_641885 ) ( ON ?auto_641883 ?auto_641884 ) ( ON ?auto_641882 ?auto_641883 ) ( CLEAR ?auto_641880 ) ( ON ?auto_641881 ?auto_641882 ) ( CLEAR ?auto_641881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_641871 ?auto_641872 ?auto_641873 ?auto_641874 ?auto_641875 ?auto_641876 ?auto_641877 ?auto_641878 ?auto_641879 ?auto_641880 ?auto_641881 )
      ( MAKE-17PILE ?auto_641871 ?auto_641872 ?auto_641873 ?auto_641874 ?auto_641875 ?auto_641876 ?auto_641877 ?auto_641878 ?auto_641879 ?auto_641880 ?auto_641881 ?auto_641882 ?auto_641883 ?auto_641884 ?auto_641885 ?auto_641886 ?auto_641887 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_641906 - BLOCK
      ?auto_641907 - BLOCK
      ?auto_641908 - BLOCK
      ?auto_641909 - BLOCK
      ?auto_641910 - BLOCK
      ?auto_641911 - BLOCK
      ?auto_641912 - BLOCK
      ?auto_641913 - BLOCK
      ?auto_641914 - BLOCK
      ?auto_641915 - BLOCK
      ?auto_641916 - BLOCK
      ?auto_641917 - BLOCK
      ?auto_641918 - BLOCK
      ?auto_641919 - BLOCK
      ?auto_641920 - BLOCK
      ?auto_641921 - BLOCK
      ?auto_641922 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_641922 ) ( ON-TABLE ?auto_641906 ) ( ON ?auto_641907 ?auto_641906 ) ( ON ?auto_641908 ?auto_641907 ) ( ON ?auto_641909 ?auto_641908 ) ( ON ?auto_641910 ?auto_641909 ) ( ON ?auto_641911 ?auto_641910 ) ( ON ?auto_641912 ?auto_641911 ) ( ON ?auto_641913 ?auto_641912 ) ( ON ?auto_641914 ?auto_641913 ) ( ON ?auto_641915 ?auto_641914 ) ( not ( = ?auto_641906 ?auto_641907 ) ) ( not ( = ?auto_641906 ?auto_641908 ) ) ( not ( = ?auto_641906 ?auto_641909 ) ) ( not ( = ?auto_641906 ?auto_641910 ) ) ( not ( = ?auto_641906 ?auto_641911 ) ) ( not ( = ?auto_641906 ?auto_641912 ) ) ( not ( = ?auto_641906 ?auto_641913 ) ) ( not ( = ?auto_641906 ?auto_641914 ) ) ( not ( = ?auto_641906 ?auto_641915 ) ) ( not ( = ?auto_641906 ?auto_641916 ) ) ( not ( = ?auto_641906 ?auto_641917 ) ) ( not ( = ?auto_641906 ?auto_641918 ) ) ( not ( = ?auto_641906 ?auto_641919 ) ) ( not ( = ?auto_641906 ?auto_641920 ) ) ( not ( = ?auto_641906 ?auto_641921 ) ) ( not ( = ?auto_641906 ?auto_641922 ) ) ( not ( = ?auto_641907 ?auto_641908 ) ) ( not ( = ?auto_641907 ?auto_641909 ) ) ( not ( = ?auto_641907 ?auto_641910 ) ) ( not ( = ?auto_641907 ?auto_641911 ) ) ( not ( = ?auto_641907 ?auto_641912 ) ) ( not ( = ?auto_641907 ?auto_641913 ) ) ( not ( = ?auto_641907 ?auto_641914 ) ) ( not ( = ?auto_641907 ?auto_641915 ) ) ( not ( = ?auto_641907 ?auto_641916 ) ) ( not ( = ?auto_641907 ?auto_641917 ) ) ( not ( = ?auto_641907 ?auto_641918 ) ) ( not ( = ?auto_641907 ?auto_641919 ) ) ( not ( = ?auto_641907 ?auto_641920 ) ) ( not ( = ?auto_641907 ?auto_641921 ) ) ( not ( = ?auto_641907 ?auto_641922 ) ) ( not ( = ?auto_641908 ?auto_641909 ) ) ( not ( = ?auto_641908 ?auto_641910 ) ) ( not ( = ?auto_641908 ?auto_641911 ) ) ( not ( = ?auto_641908 ?auto_641912 ) ) ( not ( = ?auto_641908 ?auto_641913 ) ) ( not ( = ?auto_641908 ?auto_641914 ) ) ( not ( = ?auto_641908 ?auto_641915 ) ) ( not ( = ?auto_641908 ?auto_641916 ) ) ( not ( = ?auto_641908 ?auto_641917 ) ) ( not ( = ?auto_641908 ?auto_641918 ) ) ( not ( = ?auto_641908 ?auto_641919 ) ) ( not ( = ?auto_641908 ?auto_641920 ) ) ( not ( = ?auto_641908 ?auto_641921 ) ) ( not ( = ?auto_641908 ?auto_641922 ) ) ( not ( = ?auto_641909 ?auto_641910 ) ) ( not ( = ?auto_641909 ?auto_641911 ) ) ( not ( = ?auto_641909 ?auto_641912 ) ) ( not ( = ?auto_641909 ?auto_641913 ) ) ( not ( = ?auto_641909 ?auto_641914 ) ) ( not ( = ?auto_641909 ?auto_641915 ) ) ( not ( = ?auto_641909 ?auto_641916 ) ) ( not ( = ?auto_641909 ?auto_641917 ) ) ( not ( = ?auto_641909 ?auto_641918 ) ) ( not ( = ?auto_641909 ?auto_641919 ) ) ( not ( = ?auto_641909 ?auto_641920 ) ) ( not ( = ?auto_641909 ?auto_641921 ) ) ( not ( = ?auto_641909 ?auto_641922 ) ) ( not ( = ?auto_641910 ?auto_641911 ) ) ( not ( = ?auto_641910 ?auto_641912 ) ) ( not ( = ?auto_641910 ?auto_641913 ) ) ( not ( = ?auto_641910 ?auto_641914 ) ) ( not ( = ?auto_641910 ?auto_641915 ) ) ( not ( = ?auto_641910 ?auto_641916 ) ) ( not ( = ?auto_641910 ?auto_641917 ) ) ( not ( = ?auto_641910 ?auto_641918 ) ) ( not ( = ?auto_641910 ?auto_641919 ) ) ( not ( = ?auto_641910 ?auto_641920 ) ) ( not ( = ?auto_641910 ?auto_641921 ) ) ( not ( = ?auto_641910 ?auto_641922 ) ) ( not ( = ?auto_641911 ?auto_641912 ) ) ( not ( = ?auto_641911 ?auto_641913 ) ) ( not ( = ?auto_641911 ?auto_641914 ) ) ( not ( = ?auto_641911 ?auto_641915 ) ) ( not ( = ?auto_641911 ?auto_641916 ) ) ( not ( = ?auto_641911 ?auto_641917 ) ) ( not ( = ?auto_641911 ?auto_641918 ) ) ( not ( = ?auto_641911 ?auto_641919 ) ) ( not ( = ?auto_641911 ?auto_641920 ) ) ( not ( = ?auto_641911 ?auto_641921 ) ) ( not ( = ?auto_641911 ?auto_641922 ) ) ( not ( = ?auto_641912 ?auto_641913 ) ) ( not ( = ?auto_641912 ?auto_641914 ) ) ( not ( = ?auto_641912 ?auto_641915 ) ) ( not ( = ?auto_641912 ?auto_641916 ) ) ( not ( = ?auto_641912 ?auto_641917 ) ) ( not ( = ?auto_641912 ?auto_641918 ) ) ( not ( = ?auto_641912 ?auto_641919 ) ) ( not ( = ?auto_641912 ?auto_641920 ) ) ( not ( = ?auto_641912 ?auto_641921 ) ) ( not ( = ?auto_641912 ?auto_641922 ) ) ( not ( = ?auto_641913 ?auto_641914 ) ) ( not ( = ?auto_641913 ?auto_641915 ) ) ( not ( = ?auto_641913 ?auto_641916 ) ) ( not ( = ?auto_641913 ?auto_641917 ) ) ( not ( = ?auto_641913 ?auto_641918 ) ) ( not ( = ?auto_641913 ?auto_641919 ) ) ( not ( = ?auto_641913 ?auto_641920 ) ) ( not ( = ?auto_641913 ?auto_641921 ) ) ( not ( = ?auto_641913 ?auto_641922 ) ) ( not ( = ?auto_641914 ?auto_641915 ) ) ( not ( = ?auto_641914 ?auto_641916 ) ) ( not ( = ?auto_641914 ?auto_641917 ) ) ( not ( = ?auto_641914 ?auto_641918 ) ) ( not ( = ?auto_641914 ?auto_641919 ) ) ( not ( = ?auto_641914 ?auto_641920 ) ) ( not ( = ?auto_641914 ?auto_641921 ) ) ( not ( = ?auto_641914 ?auto_641922 ) ) ( not ( = ?auto_641915 ?auto_641916 ) ) ( not ( = ?auto_641915 ?auto_641917 ) ) ( not ( = ?auto_641915 ?auto_641918 ) ) ( not ( = ?auto_641915 ?auto_641919 ) ) ( not ( = ?auto_641915 ?auto_641920 ) ) ( not ( = ?auto_641915 ?auto_641921 ) ) ( not ( = ?auto_641915 ?auto_641922 ) ) ( not ( = ?auto_641916 ?auto_641917 ) ) ( not ( = ?auto_641916 ?auto_641918 ) ) ( not ( = ?auto_641916 ?auto_641919 ) ) ( not ( = ?auto_641916 ?auto_641920 ) ) ( not ( = ?auto_641916 ?auto_641921 ) ) ( not ( = ?auto_641916 ?auto_641922 ) ) ( not ( = ?auto_641917 ?auto_641918 ) ) ( not ( = ?auto_641917 ?auto_641919 ) ) ( not ( = ?auto_641917 ?auto_641920 ) ) ( not ( = ?auto_641917 ?auto_641921 ) ) ( not ( = ?auto_641917 ?auto_641922 ) ) ( not ( = ?auto_641918 ?auto_641919 ) ) ( not ( = ?auto_641918 ?auto_641920 ) ) ( not ( = ?auto_641918 ?auto_641921 ) ) ( not ( = ?auto_641918 ?auto_641922 ) ) ( not ( = ?auto_641919 ?auto_641920 ) ) ( not ( = ?auto_641919 ?auto_641921 ) ) ( not ( = ?auto_641919 ?auto_641922 ) ) ( not ( = ?auto_641920 ?auto_641921 ) ) ( not ( = ?auto_641920 ?auto_641922 ) ) ( not ( = ?auto_641921 ?auto_641922 ) ) ( ON ?auto_641921 ?auto_641922 ) ( ON ?auto_641920 ?auto_641921 ) ( ON ?auto_641919 ?auto_641920 ) ( ON ?auto_641918 ?auto_641919 ) ( ON ?auto_641917 ?auto_641918 ) ( CLEAR ?auto_641915 ) ( ON ?auto_641916 ?auto_641917 ) ( CLEAR ?auto_641916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_641906 ?auto_641907 ?auto_641908 ?auto_641909 ?auto_641910 ?auto_641911 ?auto_641912 ?auto_641913 ?auto_641914 ?auto_641915 ?auto_641916 )
      ( MAKE-17PILE ?auto_641906 ?auto_641907 ?auto_641908 ?auto_641909 ?auto_641910 ?auto_641911 ?auto_641912 ?auto_641913 ?auto_641914 ?auto_641915 ?auto_641916 ?auto_641917 ?auto_641918 ?auto_641919 ?auto_641920 ?auto_641921 ?auto_641922 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_641940 - BLOCK
      ?auto_641941 - BLOCK
      ?auto_641942 - BLOCK
      ?auto_641943 - BLOCK
      ?auto_641944 - BLOCK
      ?auto_641945 - BLOCK
      ?auto_641946 - BLOCK
      ?auto_641947 - BLOCK
      ?auto_641948 - BLOCK
      ?auto_641949 - BLOCK
      ?auto_641950 - BLOCK
      ?auto_641951 - BLOCK
      ?auto_641952 - BLOCK
      ?auto_641953 - BLOCK
      ?auto_641954 - BLOCK
      ?auto_641955 - BLOCK
      ?auto_641956 - BLOCK
    )
    :vars
    (
      ?auto_641957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_641956 ?auto_641957 ) ( ON-TABLE ?auto_641940 ) ( ON ?auto_641941 ?auto_641940 ) ( ON ?auto_641942 ?auto_641941 ) ( ON ?auto_641943 ?auto_641942 ) ( ON ?auto_641944 ?auto_641943 ) ( ON ?auto_641945 ?auto_641944 ) ( ON ?auto_641946 ?auto_641945 ) ( ON ?auto_641947 ?auto_641946 ) ( ON ?auto_641948 ?auto_641947 ) ( not ( = ?auto_641940 ?auto_641941 ) ) ( not ( = ?auto_641940 ?auto_641942 ) ) ( not ( = ?auto_641940 ?auto_641943 ) ) ( not ( = ?auto_641940 ?auto_641944 ) ) ( not ( = ?auto_641940 ?auto_641945 ) ) ( not ( = ?auto_641940 ?auto_641946 ) ) ( not ( = ?auto_641940 ?auto_641947 ) ) ( not ( = ?auto_641940 ?auto_641948 ) ) ( not ( = ?auto_641940 ?auto_641949 ) ) ( not ( = ?auto_641940 ?auto_641950 ) ) ( not ( = ?auto_641940 ?auto_641951 ) ) ( not ( = ?auto_641940 ?auto_641952 ) ) ( not ( = ?auto_641940 ?auto_641953 ) ) ( not ( = ?auto_641940 ?auto_641954 ) ) ( not ( = ?auto_641940 ?auto_641955 ) ) ( not ( = ?auto_641940 ?auto_641956 ) ) ( not ( = ?auto_641940 ?auto_641957 ) ) ( not ( = ?auto_641941 ?auto_641942 ) ) ( not ( = ?auto_641941 ?auto_641943 ) ) ( not ( = ?auto_641941 ?auto_641944 ) ) ( not ( = ?auto_641941 ?auto_641945 ) ) ( not ( = ?auto_641941 ?auto_641946 ) ) ( not ( = ?auto_641941 ?auto_641947 ) ) ( not ( = ?auto_641941 ?auto_641948 ) ) ( not ( = ?auto_641941 ?auto_641949 ) ) ( not ( = ?auto_641941 ?auto_641950 ) ) ( not ( = ?auto_641941 ?auto_641951 ) ) ( not ( = ?auto_641941 ?auto_641952 ) ) ( not ( = ?auto_641941 ?auto_641953 ) ) ( not ( = ?auto_641941 ?auto_641954 ) ) ( not ( = ?auto_641941 ?auto_641955 ) ) ( not ( = ?auto_641941 ?auto_641956 ) ) ( not ( = ?auto_641941 ?auto_641957 ) ) ( not ( = ?auto_641942 ?auto_641943 ) ) ( not ( = ?auto_641942 ?auto_641944 ) ) ( not ( = ?auto_641942 ?auto_641945 ) ) ( not ( = ?auto_641942 ?auto_641946 ) ) ( not ( = ?auto_641942 ?auto_641947 ) ) ( not ( = ?auto_641942 ?auto_641948 ) ) ( not ( = ?auto_641942 ?auto_641949 ) ) ( not ( = ?auto_641942 ?auto_641950 ) ) ( not ( = ?auto_641942 ?auto_641951 ) ) ( not ( = ?auto_641942 ?auto_641952 ) ) ( not ( = ?auto_641942 ?auto_641953 ) ) ( not ( = ?auto_641942 ?auto_641954 ) ) ( not ( = ?auto_641942 ?auto_641955 ) ) ( not ( = ?auto_641942 ?auto_641956 ) ) ( not ( = ?auto_641942 ?auto_641957 ) ) ( not ( = ?auto_641943 ?auto_641944 ) ) ( not ( = ?auto_641943 ?auto_641945 ) ) ( not ( = ?auto_641943 ?auto_641946 ) ) ( not ( = ?auto_641943 ?auto_641947 ) ) ( not ( = ?auto_641943 ?auto_641948 ) ) ( not ( = ?auto_641943 ?auto_641949 ) ) ( not ( = ?auto_641943 ?auto_641950 ) ) ( not ( = ?auto_641943 ?auto_641951 ) ) ( not ( = ?auto_641943 ?auto_641952 ) ) ( not ( = ?auto_641943 ?auto_641953 ) ) ( not ( = ?auto_641943 ?auto_641954 ) ) ( not ( = ?auto_641943 ?auto_641955 ) ) ( not ( = ?auto_641943 ?auto_641956 ) ) ( not ( = ?auto_641943 ?auto_641957 ) ) ( not ( = ?auto_641944 ?auto_641945 ) ) ( not ( = ?auto_641944 ?auto_641946 ) ) ( not ( = ?auto_641944 ?auto_641947 ) ) ( not ( = ?auto_641944 ?auto_641948 ) ) ( not ( = ?auto_641944 ?auto_641949 ) ) ( not ( = ?auto_641944 ?auto_641950 ) ) ( not ( = ?auto_641944 ?auto_641951 ) ) ( not ( = ?auto_641944 ?auto_641952 ) ) ( not ( = ?auto_641944 ?auto_641953 ) ) ( not ( = ?auto_641944 ?auto_641954 ) ) ( not ( = ?auto_641944 ?auto_641955 ) ) ( not ( = ?auto_641944 ?auto_641956 ) ) ( not ( = ?auto_641944 ?auto_641957 ) ) ( not ( = ?auto_641945 ?auto_641946 ) ) ( not ( = ?auto_641945 ?auto_641947 ) ) ( not ( = ?auto_641945 ?auto_641948 ) ) ( not ( = ?auto_641945 ?auto_641949 ) ) ( not ( = ?auto_641945 ?auto_641950 ) ) ( not ( = ?auto_641945 ?auto_641951 ) ) ( not ( = ?auto_641945 ?auto_641952 ) ) ( not ( = ?auto_641945 ?auto_641953 ) ) ( not ( = ?auto_641945 ?auto_641954 ) ) ( not ( = ?auto_641945 ?auto_641955 ) ) ( not ( = ?auto_641945 ?auto_641956 ) ) ( not ( = ?auto_641945 ?auto_641957 ) ) ( not ( = ?auto_641946 ?auto_641947 ) ) ( not ( = ?auto_641946 ?auto_641948 ) ) ( not ( = ?auto_641946 ?auto_641949 ) ) ( not ( = ?auto_641946 ?auto_641950 ) ) ( not ( = ?auto_641946 ?auto_641951 ) ) ( not ( = ?auto_641946 ?auto_641952 ) ) ( not ( = ?auto_641946 ?auto_641953 ) ) ( not ( = ?auto_641946 ?auto_641954 ) ) ( not ( = ?auto_641946 ?auto_641955 ) ) ( not ( = ?auto_641946 ?auto_641956 ) ) ( not ( = ?auto_641946 ?auto_641957 ) ) ( not ( = ?auto_641947 ?auto_641948 ) ) ( not ( = ?auto_641947 ?auto_641949 ) ) ( not ( = ?auto_641947 ?auto_641950 ) ) ( not ( = ?auto_641947 ?auto_641951 ) ) ( not ( = ?auto_641947 ?auto_641952 ) ) ( not ( = ?auto_641947 ?auto_641953 ) ) ( not ( = ?auto_641947 ?auto_641954 ) ) ( not ( = ?auto_641947 ?auto_641955 ) ) ( not ( = ?auto_641947 ?auto_641956 ) ) ( not ( = ?auto_641947 ?auto_641957 ) ) ( not ( = ?auto_641948 ?auto_641949 ) ) ( not ( = ?auto_641948 ?auto_641950 ) ) ( not ( = ?auto_641948 ?auto_641951 ) ) ( not ( = ?auto_641948 ?auto_641952 ) ) ( not ( = ?auto_641948 ?auto_641953 ) ) ( not ( = ?auto_641948 ?auto_641954 ) ) ( not ( = ?auto_641948 ?auto_641955 ) ) ( not ( = ?auto_641948 ?auto_641956 ) ) ( not ( = ?auto_641948 ?auto_641957 ) ) ( not ( = ?auto_641949 ?auto_641950 ) ) ( not ( = ?auto_641949 ?auto_641951 ) ) ( not ( = ?auto_641949 ?auto_641952 ) ) ( not ( = ?auto_641949 ?auto_641953 ) ) ( not ( = ?auto_641949 ?auto_641954 ) ) ( not ( = ?auto_641949 ?auto_641955 ) ) ( not ( = ?auto_641949 ?auto_641956 ) ) ( not ( = ?auto_641949 ?auto_641957 ) ) ( not ( = ?auto_641950 ?auto_641951 ) ) ( not ( = ?auto_641950 ?auto_641952 ) ) ( not ( = ?auto_641950 ?auto_641953 ) ) ( not ( = ?auto_641950 ?auto_641954 ) ) ( not ( = ?auto_641950 ?auto_641955 ) ) ( not ( = ?auto_641950 ?auto_641956 ) ) ( not ( = ?auto_641950 ?auto_641957 ) ) ( not ( = ?auto_641951 ?auto_641952 ) ) ( not ( = ?auto_641951 ?auto_641953 ) ) ( not ( = ?auto_641951 ?auto_641954 ) ) ( not ( = ?auto_641951 ?auto_641955 ) ) ( not ( = ?auto_641951 ?auto_641956 ) ) ( not ( = ?auto_641951 ?auto_641957 ) ) ( not ( = ?auto_641952 ?auto_641953 ) ) ( not ( = ?auto_641952 ?auto_641954 ) ) ( not ( = ?auto_641952 ?auto_641955 ) ) ( not ( = ?auto_641952 ?auto_641956 ) ) ( not ( = ?auto_641952 ?auto_641957 ) ) ( not ( = ?auto_641953 ?auto_641954 ) ) ( not ( = ?auto_641953 ?auto_641955 ) ) ( not ( = ?auto_641953 ?auto_641956 ) ) ( not ( = ?auto_641953 ?auto_641957 ) ) ( not ( = ?auto_641954 ?auto_641955 ) ) ( not ( = ?auto_641954 ?auto_641956 ) ) ( not ( = ?auto_641954 ?auto_641957 ) ) ( not ( = ?auto_641955 ?auto_641956 ) ) ( not ( = ?auto_641955 ?auto_641957 ) ) ( not ( = ?auto_641956 ?auto_641957 ) ) ( ON ?auto_641955 ?auto_641956 ) ( ON ?auto_641954 ?auto_641955 ) ( ON ?auto_641953 ?auto_641954 ) ( ON ?auto_641952 ?auto_641953 ) ( ON ?auto_641951 ?auto_641952 ) ( ON ?auto_641950 ?auto_641951 ) ( CLEAR ?auto_641948 ) ( ON ?auto_641949 ?auto_641950 ) ( CLEAR ?auto_641949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_641940 ?auto_641941 ?auto_641942 ?auto_641943 ?auto_641944 ?auto_641945 ?auto_641946 ?auto_641947 ?auto_641948 ?auto_641949 )
      ( MAKE-17PILE ?auto_641940 ?auto_641941 ?auto_641942 ?auto_641943 ?auto_641944 ?auto_641945 ?auto_641946 ?auto_641947 ?auto_641948 ?auto_641949 ?auto_641950 ?auto_641951 ?auto_641952 ?auto_641953 ?auto_641954 ?auto_641955 ?auto_641956 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_641975 - BLOCK
      ?auto_641976 - BLOCK
      ?auto_641977 - BLOCK
      ?auto_641978 - BLOCK
      ?auto_641979 - BLOCK
      ?auto_641980 - BLOCK
      ?auto_641981 - BLOCK
      ?auto_641982 - BLOCK
      ?auto_641983 - BLOCK
      ?auto_641984 - BLOCK
      ?auto_641985 - BLOCK
      ?auto_641986 - BLOCK
      ?auto_641987 - BLOCK
      ?auto_641988 - BLOCK
      ?auto_641989 - BLOCK
      ?auto_641990 - BLOCK
      ?auto_641991 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_641991 ) ( ON-TABLE ?auto_641975 ) ( ON ?auto_641976 ?auto_641975 ) ( ON ?auto_641977 ?auto_641976 ) ( ON ?auto_641978 ?auto_641977 ) ( ON ?auto_641979 ?auto_641978 ) ( ON ?auto_641980 ?auto_641979 ) ( ON ?auto_641981 ?auto_641980 ) ( ON ?auto_641982 ?auto_641981 ) ( ON ?auto_641983 ?auto_641982 ) ( not ( = ?auto_641975 ?auto_641976 ) ) ( not ( = ?auto_641975 ?auto_641977 ) ) ( not ( = ?auto_641975 ?auto_641978 ) ) ( not ( = ?auto_641975 ?auto_641979 ) ) ( not ( = ?auto_641975 ?auto_641980 ) ) ( not ( = ?auto_641975 ?auto_641981 ) ) ( not ( = ?auto_641975 ?auto_641982 ) ) ( not ( = ?auto_641975 ?auto_641983 ) ) ( not ( = ?auto_641975 ?auto_641984 ) ) ( not ( = ?auto_641975 ?auto_641985 ) ) ( not ( = ?auto_641975 ?auto_641986 ) ) ( not ( = ?auto_641975 ?auto_641987 ) ) ( not ( = ?auto_641975 ?auto_641988 ) ) ( not ( = ?auto_641975 ?auto_641989 ) ) ( not ( = ?auto_641975 ?auto_641990 ) ) ( not ( = ?auto_641975 ?auto_641991 ) ) ( not ( = ?auto_641976 ?auto_641977 ) ) ( not ( = ?auto_641976 ?auto_641978 ) ) ( not ( = ?auto_641976 ?auto_641979 ) ) ( not ( = ?auto_641976 ?auto_641980 ) ) ( not ( = ?auto_641976 ?auto_641981 ) ) ( not ( = ?auto_641976 ?auto_641982 ) ) ( not ( = ?auto_641976 ?auto_641983 ) ) ( not ( = ?auto_641976 ?auto_641984 ) ) ( not ( = ?auto_641976 ?auto_641985 ) ) ( not ( = ?auto_641976 ?auto_641986 ) ) ( not ( = ?auto_641976 ?auto_641987 ) ) ( not ( = ?auto_641976 ?auto_641988 ) ) ( not ( = ?auto_641976 ?auto_641989 ) ) ( not ( = ?auto_641976 ?auto_641990 ) ) ( not ( = ?auto_641976 ?auto_641991 ) ) ( not ( = ?auto_641977 ?auto_641978 ) ) ( not ( = ?auto_641977 ?auto_641979 ) ) ( not ( = ?auto_641977 ?auto_641980 ) ) ( not ( = ?auto_641977 ?auto_641981 ) ) ( not ( = ?auto_641977 ?auto_641982 ) ) ( not ( = ?auto_641977 ?auto_641983 ) ) ( not ( = ?auto_641977 ?auto_641984 ) ) ( not ( = ?auto_641977 ?auto_641985 ) ) ( not ( = ?auto_641977 ?auto_641986 ) ) ( not ( = ?auto_641977 ?auto_641987 ) ) ( not ( = ?auto_641977 ?auto_641988 ) ) ( not ( = ?auto_641977 ?auto_641989 ) ) ( not ( = ?auto_641977 ?auto_641990 ) ) ( not ( = ?auto_641977 ?auto_641991 ) ) ( not ( = ?auto_641978 ?auto_641979 ) ) ( not ( = ?auto_641978 ?auto_641980 ) ) ( not ( = ?auto_641978 ?auto_641981 ) ) ( not ( = ?auto_641978 ?auto_641982 ) ) ( not ( = ?auto_641978 ?auto_641983 ) ) ( not ( = ?auto_641978 ?auto_641984 ) ) ( not ( = ?auto_641978 ?auto_641985 ) ) ( not ( = ?auto_641978 ?auto_641986 ) ) ( not ( = ?auto_641978 ?auto_641987 ) ) ( not ( = ?auto_641978 ?auto_641988 ) ) ( not ( = ?auto_641978 ?auto_641989 ) ) ( not ( = ?auto_641978 ?auto_641990 ) ) ( not ( = ?auto_641978 ?auto_641991 ) ) ( not ( = ?auto_641979 ?auto_641980 ) ) ( not ( = ?auto_641979 ?auto_641981 ) ) ( not ( = ?auto_641979 ?auto_641982 ) ) ( not ( = ?auto_641979 ?auto_641983 ) ) ( not ( = ?auto_641979 ?auto_641984 ) ) ( not ( = ?auto_641979 ?auto_641985 ) ) ( not ( = ?auto_641979 ?auto_641986 ) ) ( not ( = ?auto_641979 ?auto_641987 ) ) ( not ( = ?auto_641979 ?auto_641988 ) ) ( not ( = ?auto_641979 ?auto_641989 ) ) ( not ( = ?auto_641979 ?auto_641990 ) ) ( not ( = ?auto_641979 ?auto_641991 ) ) ( not ( = ?auto_641980 ?auto_641981 ) ) ( not ( = ?auto_641980 ?auto_641982 ) ) ( not ( = ?auto_641980 ?auto_641983 ) ) ( not ( = ?auto_641980 ?auto_641984 ) ) ( not ( = ?auto_641980 ?auto_641985 ) ) ( not ( = ?auto_641980 ?auto_641986 ) ) ( not ( = ?auto_641980 ?auto_641987 ) ) ( not ( = ?auto_641980 ?auto_641988 ) ) ( not ( = ?auto_641980 ?auto_641989 ) ) ( not ( = ?auto_641980 ?auto_641990 ) ) ( not ( = ?auto_641980 ?auto_641991 ) ) ( not ( = ?auto_641981 ?auto_641982 ) ) ( not ( = ?auto_641981 ?auto_641983 ) ) ( not ( = ?auto_641981 ?auto_641984 ) ) ( not ( = ?auto_641981 ?auto_641985 ) ) ( not ( = ?auto_641981 ?auto_641986 ) ) ( not ( = ?auto_641981 ?auto_641987 ) ) ( not ( = ?auto_641981 ?auto_641988 ) ) ( not ( = ?auto_641981 ?auto_641989 ) ) ( not ( = ?auto_641981 ?auto_641990 ) ) ( not ( = ?auto_641981 ?auto_641991 ) ) ( not ( = ?auto_641982 ?auto_641983 ) ) ( not ( = ?auto_641982 ?auto_641984 ) ) ( not ( = ?auto_641982 ?auto_641985 ) ) ( not ( = ?auto_641982 ?auto_641986 ) ) ( not ( = ?auto_641982 ?auto_641987 ) ) ( not ( = ?auto_641982 ?auto_641988 ) ) ( not ( = ?auto_641982 ?auto_641989 ) ) ( not ( = ?auto_641982 ?auto_641990 ) ) ( not ( = ?auto_641982 ?auto_641991 ) ) ( not ( = ?auto_641983 ?auto_641984 ) ) ( not ( = ?auto_641983 ?auto_641985 ) ) ( not ( = ?auto_641983 ?auto_641986 ) ) ( not ( = ?auto_641983 ?auto_641987 ) ) ( not ( = ?auto_641983 ?auto_641988 ) ) ( not ( = ?auto_641983 ?auto_641989 ) ) ( not ( = ?auto_641983 ?auto_641990 ) ) ( not ( = ?auto_641983 ?auto_641991 ) ) ( not ( = ?auto_641984 ?auto_641985 ) ) ( not ( = ?auto_641984 ?auto_641986 ) ) ( not ( = ?auto_641984 ?auto_641987 ) ) ( not ( = ?auto_641984 ?auto_641988 ) ) ( not ( = ?auto_641984 ?auto_641989 ) ) ( not ( = ?auto_641984 ?auto_641990 ) ) ( not ( = ?auto_641984 ?auto_641991 ) ) ( not ( = ?auto_641985 ?auto_641986 ) ) ( not ( = ?auto_641985 ?auto_641987 ) ) ( not ( = ?auto_641985 ?auto_641988 ) ) ( not ( = ?auto_641985 ?auto_641989 ) ) ( not ( = ?auto_641985 ?auto_641990 ) ) ( not ( = ?auto_641985 ?auto_641991 ) ) ( not ( = ?auto_641986 ?auto_641987 ) ) ( not ( = ?auto_641986 ?auto_641988 ) ) ( not ( = ?auto_641986 ?auto_641989 ) ) ( not ( = ?auto_641986 ?auto_641990 ) ) ( not ( = ?auto_641986 ?auto_641991 ) ) ( not ( = ?auto_641987 ?auto_641988 ) ) ( not ( = ?auto_641987 ?auto_641989 ) ) ( not ( = ?auto_641987 ?auto_641990 ) ) ( not ( = ?auto_641987 ?auto_641991 ) ) ( not ( = ?auto_641988 ?auto_641989 ) ) ( not ( = ?auto_641988 ?auto_641990 ) ) ( not ( = ?auto_641988 ?auto_641991 ) ) ( not ( = ?auto_641989 ?auto_641990 ) ) ( not ( = ?auto_641989 ?auto_641991 ) ) ( not ( = ?auto_641990 ?auto_641991 ) ) ( ON ?auto_641990 ?auto_641991 ) ( ON ?auto_641989 ?auto_641990 ) ( ON ?auto_641988 ?auto_641989 ) ( ON ?auto_641987 ?auto_641988 ) ( ON ?auto_641986 ?auto_641987 ) ( ON ?auto_641985 ?auto_641986 ) ( CLEAR ?auto_641983 ) ( ON ?auto_641984 ?auto_641985 ) ( CLEAR ?auto_641984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_641975 ?auto_641976 ?auto_641977 ?auto_641978 ?auto_641979 ?auto_641980 ?auto_641981 ?auto_641982 ?auto_641983 ?auto_641984 )
      ( MAKE-17PILE ?auto_641975 ?auto_641976 ?auto_641977 ?auto_641978 ?auto_641979 ?auto_641980 ?auto_641981 ?auto_641982 ?auto_641983 ?auto_641984 ?auto_641985 ?auto_641986 ?auto_641987 ?auto_641988 ?auto_641989 ?auto_641990 ?auto_641991 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_642009 - BLOCK
      ?auto_642010 - BLOCK
      ?auto_642011 - BLOCK
      ?auto_642012 - BLOCK
      ?auto_642013 - BLOCK
      ?auto_642014 - BLOCK
      ?auto_642015 - BLOCK
      ?auto_642016 - BLOCK
      ?auto_642017 - BLOCK
      ?auto_642018 - BLOCK
      ?auto_642019 - BLOCK
      ?auto_642020 - BLOCK
      ?auto_642021 - BLOCK
      ?auto_642022 - BLOCK
      ?auto_642023 - BLOCK
      ?auto_642024 - BLOCK
      ?auto_642025 - BLOCK
    )
    :vars
    (
      ?auto_642026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_642025 ?auto_642026 ) ( ON-TABLE ?auto_642009 ) ( ON ?auto_642010 ?auto_642009 ) ( ON ?auto_642011 ?auto_642010 ) ( ON ?auto_642012 ?auto_642011 ) ( ON ?auto_642013 ?auto_642012 ) ( ON ?auto_642014 ?auto_642013 ) ( ON ?auto_642015 ?auto_642014 ) ( ON ?auto_642016 ?auto_642015 ) ( not ( = ?auto_642009 ?auto_642010 ) ) ( not ( = ?auto_642009 ?auto_642011 ) ) ( not ( = ?auto_642009 ?auto_642012 ) ) ( not ( = ?auto_642009 ?auto_642013 ) ) ( not ( = ?auto_642009 ?auto_642014 ) ) ( not ( = ?auto_642009 ?auto_642015 ) ) ( not ( = ?auto_642009 ?auto_642016 ) ) ( not ( = ?auto_642009 ?auto_642017 ) ) ( not ( = ?auto_642009 ?auto_642018 ) ) ( not ( = ?auto_642009 ?auto_642019 ) ) ( not ( = ?auto_642009 ?auto_642020 ) ) ( not ( = ?auto_642009 ?auto_642021 ) ) ( not ( = ?auto_642009 ?auto_642022 ) ) ( not ( = ?auto_642009 ?auto_642023 ) ) ( not ( = ?auto_642009 ?auto_642024 ) ) ( not ( = ?auto_642009 ?auto_642025 ) ) ( not ( = ?auto_642009 ?auto_642026 ) ) ( not ( = ?auto_642010 ?auto_642011 ) ) ( not ( = ?auto_642010 ?auto_642012 ) ) ( not ( = ?auto_642010 ?auto_642013 ) ) ( not ( = ?auto_642010 ?auto_642014 ) ) ( not ( = ?auto_642010 ?auto_642015 ) ) ( not ( = ?auto_642010 ?auto_642016 ) ) ( not ( = ?auto_642010 ?auto_642017 ) ) ( not ( = ?auto_642010 ?auto_642018 ) ) ( not ( = ?auto_642010 ?auto_642019 ) ) ( not ( = ?auto_642010 ?auto_642020 ) ) ( not ( = ?auto_642010 ?auto_642021 ) ) ( not ( = ?auto_642010 ?auto_642022 ) ) ( not ( = ?auto_642010 ?auto_642023 ) ) ( not ( = ?auto_642010 ?auto_642024 ) ) ( not ( = ?auto_642010 ?auto_642025 ) ) ( not ( = ?auto_642010 ?auto_642026 ) ) ( not ( = ?auto_642011 ?auto_642012 ) ) ( not ( = ?auto_642011 ?auto_642013 ) ) ( not ( = ?auto_642011 ?auto_642014 ) ) ( not ( = ?auto_642011 ?auto_642015 ) ) ( not ( = ?auto_642011 ?auto_642016 ) ) ( not ( = ?auto_642011 ?auto_642017 ) ) ( not ( = ?auto_642011 ?auto_642018 ) ) ( not ( = ?auto_642011 ?auto_642019 ) ) ( not ( = ?auto_642011 ?auto_642020 ) ) ( not ( = ?auto_642011 ?auto_642021 ) ) ( not ( = ?auto_642011 ?auto_642022 ) ) ( not ( = ?auto_642011 ?auto_642023 ) ) ( not ( = ?auto_642011 ?auto_642024 ) ) ( not ( = ?auto_642011 ?auto_642025 ) ) ( not ( = ?auto_642011 ?auto_642026 ) ) ( not ( = ?auto_642012 ?auto_642013 ) ) ( not ( = ?auto_642012 ?auto_642014 ) ) ( not ( = ?auto_642012 ?auto_642015 ) ) ( not ( = ?auto_642012 ?auto_642016 ) ) ( not ( = ?auto_642012 ?auto_642017 ) ) ( not ( = ?auto_642012 ?auto_642018 ) ) ( not ( = ?auto_642012 ?auto_642019 ) ) ( not ( = ?auto_642012 ?auto_642020 ) ) ( not ( = ?auto_642012 ?auto_642021 ) ) ( not ( = ?auto_642012 ?auto_642022 ) ) ( not ( = ?auto_642012 ?auto_642023 ) ) ( not ( = ?auto_642012 ?auto_642024 ) ) ( not ( = ?auto_642012 ?auto_642025 ) ) ( not ( = ?auto_642012 ?auto_642026 ) ) ( not ( = ?auto_642013 ?auto_642014 ) ) ( not ( = ?auto_642013 ?auto_642015 ) ) ( not ( = ?auto_642013 ?auto_642016 ) ) ( not ( = ?auto_642013 ?auto_642017 ) ) ( not ( = ?auto_642013 ?auto_642018 ) ) ( not ( = ?auto_642013 ?auto_642019 ) ) ( not ( = ?auto_642013 ?auto_642020 ) ) ( not ( = ?auto_642013 ?auto_642021 ) ) ( not ( = ?auto_642013 ?auto_642022 ) ) ( not ( = ?auto_642013 ?auto_642023 ) ) ( not ( = ?auto_642013 ?auto_642024 ) ) ( not ( = ?auto_642013 ?auto_642025 ) ) ( not ( = ?auto_642013 ?auto_642026 ) ) ( not ( = ?auto_642014 ?auto_642015 ) ) ( not ( = ?auto_642014 ?auto_642016 ) ) ( not ( = ?auto_642014 ?auto_642017 ) ) ( not ( = ?auto_642014 ?auto_642018 ) ) ( not ( = ?auto_642014 ?auto_642019 ) ) ( not ( = ?auto_642014 ?auto_642020 ) ) ( not ( = ?auto_642014 ?auto_642021 ) ) ( not ( = ?auto_642014 ?auto_642022 ) ) ( not ( = ?auto_642014 ?auto_642023 ) ) ( not ( = ?auto_642014 ?auto_642024 ) ) ( not ( = ?auto_642014 ?auto_642025 ) ) ( not ( = ?auto_642014 ?auto_642026 ) ) ( not ( = ?auto_642015 ?auto_642016 ) ) ( not ( = ?auto_642015 ?auto_642017 ) ) ( not ( = ?auto_642015 ?auto_642018 ) ) ( not ( = ?auto_642015 ?auto_642019 ) ) ( not ( = ?auto_642015 ?auto_642020 ) ) ( not ( = ?auto_642015 ?auto_642021 ) ) ( not ( = ?auto_642015 ?auto_642022 ) ) ( not ( = ?auto_642015 ?auto_642023 ) ) ( not ( = ?auto_642015 ?auto_642024 ) ) ( not ( = ?auto_642015 ?auto_642025 ) ) ( not ( = ?auto_642015 ?auto_642026 ) ) ( not ( = ?auto_642016 ?auto_642017 ) ) ( not ( = ?auto_642016 ?auto_642018 ) ) ( not ( = ?auto_642016 ?auto_642019 ) ) ( not ( = ?auto_642016 ?auto_642020 ) ) ( not ( = ?auto_642016 ?auto_642021 ) ) ( not ( = ?auto_642016 ?auto_642022 ) ) ( not ( = ?auto_642016 ?auto_642023 ) ) ( not ( = ?auto_642016 ?auto_642024 ) ) ( not ( = ?auto_642016 ?auto_642025 ) ) ( not ( = ?auto_642016 ?auto_642026 ) ) ( not ( = ?auto_642017 ?auto_642018 ) ) ( not ( = ?auto_642017 ?auto_642019 ) ) ( not ( = ?auto_642017 ?auto_642020 ) ) ( not ( = ?auto_642017 ?auto_642021 ) ) ( not ( = ?auto_642017 ?auto_642022 ) ) ( not ( = ?auto_642017 ?auto_642023 ) ) ( not ( = ?auto_642017 ?auto_642024 ) ) ( not ( = ?auto_642017 ?auto_642025 ) ) ( not ( = ?auto_642017 ?auto_642026 ) ) ( not ( = ?auto_642018 ?auto_642019 ) ) ( not ( = ?auto_642018 ?auto_642020 ) ) ( not ( = ?auto_642018 ?auto_642021 ) ) ( not ( = ?auto_642018 ?auto_642022 ) ) ( not ( = ?auto_642018 ?auto_642023 ) ) ( not ( = ?auto_642018 ?auto_642024 ) ) ( not ( = ?auto_642018 ?auto_642025 ) ) ( not ( = ?auto_642018 ?auto_642026 ) ) ( not ( = ?auto_642019 ?auto_642020 ) ) ( not ( = ?auto_642019 ?auto_642021 ) ) ( not ( = ?auto_642019 ?auto_642022 ) ) ( not ( = ?auto_642019 ?auto_642023 ) ) ( not ( = ?auto_642019 ?auto_642024 ) ) ( not ( = ?auto_642019 ?auto_642025 ) ) ( not ( = ?auto_642019 ?auto_642026 ) ) ( not ( = ?auto_642020 ?auto_642021 ) ) ( not ( = ?auto_642020 ?auto_642022 ) ) ( not ( = ?auto_642020 ?auto_642023 ) ) ( not ( = ?auto_642020 ?auto_642024 ) ) ( not ( = ?auto_642020 ?auto_642025 ) ) ( not ( = ?auto_642020 ?auto_642026 ) ) ( not ( = ?auto_642021 ?auto_642022 ) ) ( not ( = ?auto_642021 ?auto_642023 ) ) ( not ( = ?auto_642021 ?auto_642024 ) ) ( not ( = ?auto_642021 ?auto_642025 ) ) ( not ( = ?auto_642021 ?auto_642026 ) ) ( not ( = ?auto_642022 ?auto_642023 ) ) ( not ( = ?auto_642022 ?auto_642024 ) ) ( not ( = ?auto_642022 ?auto_642025 ) ) ( not ( = ?auto_642022 ?auto_642026 ) ) ( not ( = ?auto_642023 ?auto_642024 ) ) ( not ( = ?auto_642023 ?auto_642025 ) ) ( not ( = ?auto_642023 ?auto_642026 ) ) ( not ( = ?auto_642024 ?auto_642025 ) ) ( not ( = ?auto_642024 ?auto_642026 ) ) ( not ( = ?auto_642025 ?auto_642026 ) ) ( ON ?auto_642024 ?auto_642025 ) ( ON ?auto_642023 ?auto_642024 ) ( ON ?auto_642022 ?auto_642023 ) ( ON ?auto_642021 ?auto_642022 ) ( ON ?auto_642020 ?auto_642021 ) ( ON ?auto_642019 ?auto_642020 ) ( ON ?auto_642018 ?auto_642019 ) ( CLEAR ?auto_642016 ) ( ON ?auto_642017 ?auto_642018 ) ( CLEAR ?auto_642017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_642009 ?auto_642010 ?auto_642011 ?auto_642012 ?auto_642013 ?auto_642014 ?auto_642015 ?auto_642016 ?auto_642017 )
      ( MAKE-17PILE ?auto_642009 ?auto_642010 ?auto_642011 ?auto_642012 ?auto_642013 ?auto_642014 ?auto_642015 ?auto_642016 ?auto_642017 ?auto_642018 ?auto_642019 ?auto_642020 ?auto_642021 ?auto_642022 ?auto_642023 ?auto_642024 ?auto_642025 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_642044 - BLOCK
      ?auto_642045 - BLOCK
      ?auto_642046 - BLOCK
      ?auto_642047 - BLOCK
      ?auto_642048 - BLOCK
      ?auto_642049 - BLOCK
      ?auto_642050 - BLOCK
      ?auto_642051 - BLOCK
      ?auto_642052 - BLOCK
      ?auto_642053 - BLOCK
      ?auto_642054 - BLOCK
      ?auto_642055 - BLOCK
      ?auto_642056 - BLOCK
      ?auto_642057 - BLOCK
      ?auto_642058 - BLOCK
      ?auto_642059 - BLOCK
      ?auto_642060 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_642060 ) ( ON-TABLE ?auto_642044 ) ( ON ?auto_642045 ?auto_642044 ) ( ON ?auto_642046 ?auto_642045 ) ( ON ?auto_642047 ?auto_642046 ) ( ON ?auto_642048 ?auto_642047 ) ( ON ?auto_642049 ?auto_642048 ) ( ON ?auto_642050 ?auto_642049 ) ( ON ?auto_642051 ?auto_642050 ) ( not ( = ?auto_642044 ?auto_642045 ) ) ( not ( = ?auto_642044 ?auto_642046 ) ) ( not ( = ?auto_642044 ?auto_642047 ) ) ( not ( = ?auto_642044 ?auto_642048 ) ) ( not ( = ?auto_642044 ?auto_642049 ) ) ( not ( = ?auto_642044 ?auto_642050 ) ) ( not ( = ?auto_642044 ?auto_642051 ) ) ( not ( = ?auto_642044 ?auto_642052 ) ) ( not ( = ?auto_642044 ?auto_642053 ) ) ( not ( = ?auto_642044 ?auto_642054 ) ) ( not ( = ?auto_642044 ?auto_642055 ) ) ( not ( = ?auto_642044 ?auto_642056 ) ) ( not ( = ?auto_642044 ?auto_642057 ) ) ( not ( = ?auto_642044 ?auto_642058 ) ) ( not ( = ?auto_642044 ?auto_642059 ) ) ( not ( = ?auto_642044 ?auto_642060 ) ) ( not ( = ?auto_642045 ?auto_642046 ) ) ( not ( = ?auto_642045 ?auto_642047 ) ) ( not ( = ?auto_642045 ?auto_642048 ) ) ( not ( = ?auto_642045 ?auto_642049 ) ) ( not ( = ?auto_642045 ?auto_642050 ) ) ( not ( = ?auto_642045 ?auto_642051 ) ) ( not ( = ?auto_642045 ?auto_642052 ) ) ( not ( = ?auto_642045 ?auto_642053 ) ) ( not ( = ?auto_642045 ?auto_642054 ) ) ( not ( = ?auto_642045 ?auto_642055 ) ) ( not ( = ?auto_642045 ?auto_642056 ) ) ( not ( = ?auto_642045 ?auto_642057 ) ) ( not ( = ?auto_642045 ?auto_642058 ) ) ( not ( = ?auto_642045 ?auto_642059 ) ) ( not ( = ?auto_642045 ?auto_642060 ) ) ( not ( = ?auto_642046 ?auto_642047 ) ) ( not ( = ?auto_642046 ?auto_642048 ) ) ( not ( = ?auto_642046 ?auto_642049 ) ) ( not ( = ?auto_642046 ?auto_642050 ) ) ( not ( = ?auto_642046 ?auto_642051 ) ) ( not ( = ?auto_642046 ?auto_642052 ) ) ( not ( = ?auto_642046 ?auto_642053 ) ) ( not ( = ?auto_642046 ?auto_642054 ) ) ( not ( = ?auto_642046 ?auto_642055 ) ) ( not ( = ?auto_642046 ?auto_642056 ) ) ( not ( = ?auto_642046 ?auto_642057 ) ) ( not ( = ?auto_642046 ?auto_642058 ) ) ( not ( = ?auto_642046 ?auto_642059 ) ) ( not ( = ?auto_642046 ?auto_642060 ) ) ( not ( = ?auto_642047 ?auto_642048 ) ) ( not ( = ?auto_642047 ?auto_642049 ) ) ( not ( = ?auto_642047 ?auto_642050 ) ) ( not ( = ?auto_642047 ?auto_642051 ) ) ( not ( = ?auto_642047 ?auto_642052 ) ) ( not ( = ?auto_642047 ?auto_642053 ) ) ( not ( = ?auto_642047 ?auto_642054 ) ) ( not ( = ?auto_642047 ?auto_642055 ) ) ( not ( = ?auto_642047 ?auto_642056 ) ) ( not ( = ?auto_642047 ?auto_642057 ) ) ( not ( = ?auto_642047 ?auto_642058 ) ) ( not ( = ?auto_642047 ?auto_642059 ) ) ( not ( = ?auto_642047 ?auto_642060 ) ) ( not ( = ?auto_642048 ?auto_642049 ) ) ( not ( = ?auto_642048 ?auto_642050 ) ) ( not ( = ?auto_642048 ?auto_642051 ) ) ( not ( = ?auto_642048 ?auto_642052 ) ) ( not ( = ?auto_642048 ?auto_642053 ) ) ( not ( = ?auto_642048 ?auto_642054 ) ) ( not ( = ?auto_642048 ?auto_642055 ) ) ( not ( = ?auto_642048 ?auto_642056 ) ) ( not ( = ?auto_642048 ?auto_642057 ) ) ( not ( = ?auto_642048 ?auto_642058 ) ) ( not ( = ?auto_642048 ?auto_642059 ) ) ( not ( = ?auto_642048 ?auto_642060 ) ) ( not ( = ?auto_642049 ?auto_642050 ) ) ( not ( = ?auto_642049 ?auto_642051 ) ) ( not ( = ?auto_642049 ?auto_642052 ) ) ( not ( = ?auto_642049 ?auto_642053 ) ) ( not ( = ?auto_642049 ?auto_642054 ) ) ( not ( = ?auto_642049 ?auto_642055 ) ) ( not ( = ?auto_642049 ?auto_642056 ) ) ( not ( = ?auto_642049 ?auto_642057 ) ) ( not ( = ?auto_642049 ?auto_642058 ) ) ( not ( = ?auto_642049 ?auto_642059 ) ) ( not ( = ?auto_642049 ?auto_642060 ) ) ( not ( = ?auto_642050 ?auto_642051 ) ) ( not ( = ?auto_642050 ?auto_642052 ) ) ( not ( = ?auto_642050 ?auto_642053 ) ) ( not ( = ?auto_642050 ?auto_642054 ) ) ( not ( = ?auto_642050 ?auto_642055 ) ) ( not ( = ?auto_642050 ?auto_642056 ) ) ( not ( = ?auto_642050 ?auto_642057 ) ) ( not ( = ?auto_642050 ?auto_642058 ) ) ( not ( = ?auto_642050 ?auto_642059 ) ) ( not ( = ?auto_642050 ?auto_642060 ) ) ( not ( = ?auto_642051 ?auto_642052 ) ) ( not ( = ?auto_642051 ?auto_642053 ) ) ( not ( = ?auto_642051 ?auto_642054 ) ) ( not ( = ?auto_642051 ?auto_642055 ) ) ( not ( = ?auto_642051 ?auto_642056 ) ) ( not ( = ?auto_642051 ?auto_642057 ) ) ( not ( = ?auto_642051 ?auto_642058 ) ) ( not ( = ?auto_642051 ?auto_642059 ) ) ( not ( = ?auto_642051 ?auto_642060 ) ) ( not ( = ?auto_642052 ?auto_642053 ) ) ( not ( = ?auto_642052 ?auto_642054 ) ) ( not ( = ?auto_642052 ?auto_642055 ) ) ( not ( = ?auto_642052 ?auto_642056 ) ) ( not ( = ?auto_642052 ?auto_642057 ) ) ( not ( = ?auto_642052 ?auto_642058 ) ) ( not ( = ?auto_642052 ?auto_642059 ) ) ( not ( = ?auto_642052 ?auto_642060 ) ) ( not ( = ?auto_642053 ?auto_642054 ) ) ( not ( = ?auto_642053 ?auto_642055 ) ) ( not ( = ?auto_642053 ?auto_642056 ) ) ( not ( = ?auto_642053 ?auto_642057 ) ) ( not ( = ?auto_642053 ?auto_642058 ) ) ( not ( = ?auto_642053 ?auto_642059 ) ) ( not ( = ?auto_642053 ?auto_642060 ) ) ( not ( = ?auto_642054 ?auto_642055 ) ) ( not ( = ?auto_642054 ?auto_642056 ) ) ( not ( = ?auto_642054 ?auto_642057 ) ) ( not ( = ?auto_642054 ?auto_642058 ) ) ( not ( = ?auto_642054 ?auto_642059 ) ) ( not ( = ?auto_642054 ?auto_642060 ) ) ( not ( = ?auto_642055 ?auto_642056 ) ) ( not ( = ?auto_642055 ?auto_642057 ) ) ( not ( = ?auto_642055 ?auto_642058 ) ) ( not ( = ?auto_642055 ?auto_642059 ) ) ( not ( = ?auto_642055 ?auto_642060 ) ) ( not ( = ?auto_642056 ?auto_642057 ) ) ( not ( = ?auto_642056 ?auto_642058 ) ) ( not ( = ?auto_642056 ?auto_642059 ) ) ( not ( = ?auto_642056 ?auto_642060 ) ) ( not ( = ?auto_642057 ?auto_642058 ) ) ( not ( = ?auto_642057 ?auto_642059 ) ) ( not ( = ?auto_642057 ?auto_642060 ) ) ( not ( = ?auto_642058 ?auto_642059 ) ) ( not ( = ?auto_642058 ?auto_642060 ) ) ( not ( = ?auto_642059 ?auto_642060 ) ) ( ON ?auto_642059 ?auto_642060 ) ( ON ?auto_642058 ?auto_642059 ) ( ON ?auto_642057 ?auto_642058 ) ( ON ?auto_642056 ?auto_642057 ) ( ON ?auto_642055 ?auto_642056 ) ( ON ?auto_642054 ?auto_642055 ) ( ON ?auto_642053 ?auto_642054 ) ( CLEAR ?auto_642051 ) ( ON ?auto_642052 ?auto_642053 ) ( CLEAR ?auto_642052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_642044 ?auto_642045 ?auto_642046 ?auto_642047 ?auto_642048 ?auto_642049 ?auto_642050 ?auto_642051 ?auto_642052 )
      ( MAKE-17PILE ?auto_642044 ?auto_642045 ?auto_642046 ?auto_642047 ?auto_642048 ?auto_642049 ?auto_642050 ?auto_642051 ?auto_642052 ?auto_642053 ?auto_642054 ?auto_642055 ?auto_642056 ?auto_642057 ?auto_642058 ?auto_642059 ?auto_642060 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_642078 - BLOCK
      ?auto_642079 - BLOCK
      ?auto_642080 - BLOCK
      ?auto_642081 - BLOCK
      ?auto_642082 - BLOCK
      ?auto_642083 - BLOCK
      ?auto_642084 - BLOCK
      ?auto_642085 - BLOCK
      ?auto_642086 - BLOCK
      ?auto_642087 - BLOCK
      ?auto_642088 - BLOCK
      ?auto_642089 - BLOCK
      ?auto_642090 - BLOCK
      ?auto_642091 - BLOCK
      ?auto_642092 - BLOCK
      ?auto_642093 - BLOCK
      ?auto_642094 - BLOCK
    )
    :vars
    (
      ?auto_642095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_642094 ?auto_642095 ) ( ON-TABLE ?auto_642078 ) ( ON ?auto_642079 ?auto_642078 ) ( ON ?auto_642080 ?auto_642079 ) ( ON ?auto_642081 ?auto_642080 ) ( ON ?auto_642082 ?auto_642081 ) ( ON ?auto_642083 ?auto_642082 ) ( ON ?auto_642084 ?auto_642083 ) ( not ( = ?auto_642078 ?auto_642079 ) ) ( not ( = ?auto_642078 ?auto_642080 ) ) ( not ( = ?auto_642078 ?auto_642081 ) ) ( not ( = ?auto_642078 ?auto_642082 ) ) ( not ( = ?auto_642078 ?auto_642083 ) ) ( not ( = ?auto_642078 ?auto_642084 ) ) ( not ( = ?auto_642078 ?auto_642085 ) ) ( not ( = ?auto_642078 ?auto_642086 ) ) ( not ( = ?auto_642078 ?auto_642087 ) ) ( not ( = ?auto_642078 ?auto_642088 ) ) ( not ( = ?auto_642078 ?auto_642089 ) ) ( not ( = ?auto_642078 ?auto_642090 ) ) ( not ( = ?auto_642078 ?auto_642091 ) ) ( not ( = ?auto_642078 ?auto_642092 ) ) ( not ( = ?auto_642078 ?auto_642093 ) ) ( not ( = ?auto_642078 ?auto_642094 ) ) ( not ( = ?auto_642078 ?auto_642095 ) ) ( not ( = ?auto_642079 ?auto_642080 ) ) ( not ( = ?auto_642079 ?auto_642081 ) ) ( not ( = ?auto_642079 ?auto_642082 ) ) ( not ( = ?auto_642079 ?auto_642083 ) ) ( not ( = ?auto_642079 ?auto_642084 ) ) ( not ( = ?auto_642079 ?auto_642085 ) ) ( not ( = ?auto_642079 ?auto_642086 ) ) ( not ( = ?auto_642079 ?auto_642087 ) ) ( not ( = ?auto_642079 ?auto_642088 ) ) ( not ( = ?auto_642079 ?auto_642089 ) ) ( not ( = ?auto_642079 ?auto_642090 ) ) ( not ( = ?auto_642079 ?auto_642091 ) ) ( not ( = ?auto_642079 ?auto_642092 ) ) ( not ( = ?auto_642079 ?auto_642093 ) ) ( not ( = ?auto_642079 ?auto_642094 ) ) ( not ( = ?auto_642079 ?auto_642095 ) ) ( not ( = ?auto_642080 ?auto_642081 ) ) ( not ( = ?auto_642080 ?auto_642082 ) ) ( not ( = ?auto_642080 ?auto_642083 ) ) ( not ( = ?auto_642080 ?auto_642084 ) ) ( not ( = ?auto_642080 ?auto_642085 ) ) ( not ( = ?auto_642080 ?auto_642086 ) ) ( not ( = ?auto_642080 ?auto_642087 ) ) ( not ( = ?auto_642080 ?auto_642088 ) ) ( not ( = ?auto_642080 ?auto_642089 ) ) ( not ( = ?auto_642080 ?auto_642090 ) ) ( not ( = ?auto_642080 ?auto_642091 ) ) ( not ( = ?auto_642080 ?auto_642092 ) ) ( not ( = ?auto_642080 ?auto_642093 ) ) ( not ( = ?auto_642080 ?auto_642094 ) ) ( not ( = ?auto_642080 ?auto_642095 ) ) ( not ( = ?auto_642081 ?auto_642082 ) ) ( not ( = ?auto_642081 ?auto_642083 ) ) ( not ( = ?auto_642081 ?auto_642084 ) ) ( not ( = ?auto_642081 ?auto_642085 ) ) ( not ( = ?auto_642081 ?auto_642086 ) ) ( not ( = ?auto_642081 ?auto_642087 ) ) ( not ( = ?auto_642081 ?auto_642088 ) ) ( not ( = ?auto_642081 ?auto_642089 ) ) ( not ( = ?auto_642081 ?auto_642090 ) ) ( not ( = ?auto_642081 ?auto_642091 ) ) ( not ( = ?auto_642081 ?auto_642092 ) ) ( not ( = ?auto_642081 ?auto_642093 ) ) ( not ( = ?auto_642081 ?auto_642094 ) ) ( not ( = ?auto_642081 ?auto_642095 ) ) ( not ( = ?auto_642082 ?auto_642083 ) ) ( not ( = ?auto_642082 ?auto_642084 ) ) ( not ( = ?auto_642082 ?auto_642085 ) ) ( not ( = ?auto_642082 ?auto_642086 ) ) ( not ( = ?auto_642082 ?auto_642087 ) ) ( not ( = ?auto_642082 ?auto_642088 ) ) ( not ( = ?auto_642082 ?auto_642089 ) ) ( not ( = ?auto_642082 ?auto_642090 ) ) ( not ( = ?auto_642082 ?auto_642091 ) ) ( not ( = ?auto_642082 ?auto_642092 ) ) ( not ( = ?auto_642082 ?auto_642093 ) ) ( not ( = ?auto_642082 ?auto_642094 ) ) ( not ( = ?auto_642082 ?auto_642095 ) ) ( not ( = ?auto_642083 ?auto_642084 ) ) ( not ( = ?auto_642083 ?auto_642085 ) ) ( not ( = ?auto_642083 ?auto_642086 ) ) ( not ( = ?auto_642083 ?auto_642087 ) ) ( not ( = ?auto_642083 ?auto_642088 ) ) ( not ( = ?auto_642083 ?auto_642089 ) ) ( not ( = ?auto_642083 ?auto_642090 ) ) ( not ( = ?auto_642083 ?auto_642091 ) ) ( not ( = ?auto_642083 ?auto_642092 ) ) ( not ( = ?auto_642083 ?auto_642093 ) ) ( not ( = ?auto_642083 ?auto_642094 ) ) ( not ( = ?auto_642083 ?auto_642095 ) ) ( not ( = ?auto_642084 ?auto_642085 ) ) ( not ( = ?auto_642084 ?auto_642086 ) ) ( not ( = ?auto_642084 ?auto_642087 ) ) ( not ( = ?auto_642084 ?auto_642088 ) ) ( not ( = ?auto_642084 ?auto_642089 ) ) ( not ( = ?auto_642084 ?auto_642090 ) ) ( not ( = ?auto_642084 ?auto_642091 ) ) ( not ( = ?auto_642084 ?auto_642092 ) ) ( not ( = ?auto_642084 ?auto_642093 ) ) ( not ( = ?auto_642084 ?auto_642094 ) ) ( not ( = ?auto_642084 ?auto_642095 ) ) ( not ( = ?auto_642085 ?auto_642086 ) ) ( not ( = ?auto_642085 ?auto_642087 ) ) ( not ( = ?auto_642085 ?auto_642088 ) ) ( not ( = ?auto_642085 ?auto_642089 ) ) ( not ( = ?auto_642085 ?auto_642090 ) ) ( not ( = ?auto_642085 ?auto_642091 ) ) ( not ( = ?auto_642085 ?auto_642092 ) ) ( not ( = ?auto_642085 ?auto_642093 ) ) ( not ( = ?auto_642085 ?auto_642094 ) ) ( not ( = ?auto_642085 ?auto_642095 ) ) ( not ( = ?auto_642086 ?auto_642087 ) ) ( not ( = ?auto_642086 ?auto_642088 ) ) ( not ( = ?auto_642086 ?auto_642089 ) ) ( not ( = ?auto_642086 ?auto_642090 ) ) ( not ( = ?auto_642086 ?auto_642091 ) ) ( not ( = ?auto_642086 ?auto_642092 ) ) ( not ( = ?auto_642086 ?auto_642093 ) ) ( not ( = ?auto_642086 ?auto_642094 ) ) ( not ( = ?auto_642086 ?auto_642095 ) ) ( not ( = ?auto_642087 ?auto_642088 ) ) ( not ( = ?auto_642087 ?auto_642089 ) ) ( not ( = ?auto_642087 ?auto_642090 ) ) ( not ( = ?auto_642087 ?auto_642091 ) ) ( not ( = ?auto_642087 ?auto_642092 ) ) ( not ( = ?auto_642087 ?auto_642093 ) ) ( not ( = ?auto_642087 ?auto_642094 ) ) ( not ( = ?auto_642087 ?auto_642095 ) ) ( not ( = ?auto_642088 ?auto_642089 ) ) ( not ( = ?auto_642088 ?auto_642090 ) ) ( not ( = ?auto_642088 ?auto_642091 ) ) ( not ( = ?auto_642088 ?auto_642092 ) ) ( not ( = ?auto_642088 ?auto_642093 ) ) ( not ( = ?auto_642088 ?auto_642094 ) ) ( not ( = ?auto_642088 ?auto_642095 ) ) ( not ( = ?auto_642089 ?auto_642090 ) ) ( not ( = ?auto_642089 ?auto_642091 ) ) ( not ( = ?auto_642089 ?auto_642092 ) ) ( not ( = ?auto_642089 ?auto_642093 ) ) ( not ( = ?auto_642089 ?auto_642094 ) ) ( not ( = ?auto_642089 ?auto_642095 ) ) ( not ( = ?auto_642090 ?auto_642091 ) ) ( not ( = ?auto_642090 ?auto_642092 ) ) ( not ( = ?auto_642090 ?auto_642093 ) ) ( not ( = ?auto_642090 ?auto_642094 ) ) ( not ( = ?auto_642090 ?auto_642095 ) ) ( not ( = ?auto_642091 ?auto_642092 ) ) ( not ( = ?auto_642091 ?auto_642093 ) ) ( not ( = ?auto_642091 ?auto_642094 ) ) ( not ( = ?auto_642091 ?auto_642095 ) ) ( not ( = ?auto_642092 ?auto_642093 ) ) ( not ( = ?auto_642092 ?auto_642094 ) ) ( not ( = ?auto_642092 ?auto_642095 ) ) ( not ( = ?auto_642093 ?auto_642094 ) ) ( not ( = ?auto_642093 ?auto_642095 ) ) ( not ( = ?auto_642094 ?auto_642095 ) ) ( ON ?auto_642093 ?auto_642094 ) ( ON ?auto_642092 ?auto_642093 ) ( ON ?auto_642091 ?auto_642092 ) ( ON ?auto_642090 ?auto_642091 ) ( ON ?auto_642089 ?auto_642090 ) ( ON ?auto_642088 ?auto_642089 ) ( ON ?auto_642087 ?auto_642088 ) ( ON ?auto_642086 ?auto_642087 ) ( CLEAR ?auto_642084 ) ( ON ?auto_642085 ?auto_642086 ) ( CLEAR ?auto_642085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_642078 ?auto_642079 ?auto_642080 ?auto_642081 ?auto_642082 ?auto_642083 ?auto_642084 ?auto_642085 )
      ( MAKE-17PILE ?auto_642078 ?auto_642079 ?auto_642080 ?auto_642081 ?auto_642082 ?auto_642083 ?auto_642084 ?auto_642085 ?auto_642086 ?auto_642087 ?auto_642088 ?auto_642089 ?auto_642090 ?auto_642091 ?auto_642092 ?auto_642093 ?auto_642094 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_642113 - BLOCK
      ?auto_642114 - BLOCK
      ?auto_642115 - BLOCK
      ?auto_642116 - BLOCK
      ?auto_642117 - BLOCK
      ?auto_642118 - BLOCK
      ?auto_642119 - BLOCK
      ?auto_642120 - BLOCK
      ?auto_642121 - BLOCK
      ?auto_642122 - BLOCK
      ?auto_642123 - BLOCK
      ?auto_642124 - BLOCK
      ?auto_642125 - BLOCK
      ?auto_642126 - BLOCK
      ?auto_642127 - BLOCK
      ?auto_642128 - BLOCK
      ?auto_642129 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_642129 ) ( ON-TABLE ?auto_642113 ) ( ON ?auto_642114 ?auto_642113 ) ( ON ?auto_642115 ?auto_642114 ) ( ON ?auto_642116 ?auto_642115 ) ( ON ?auto_642117 ?auto_642116 ) ( ON ?auto_642118 ?auto_642117 ) ( ON ?auto_642119 ?auto_642118 ) ( not ( = ?auto_642113 ?auto_642114 ) ) ( not ( = ?auto_642113 ?auto_642115 ) ) ( not ( = ?auto_642113 ?auto_642116 ) ) ( not ( = ?auto_642113 ?auto_642117 ) ) ( not ( = ?auto_642113 ?auto_642118 ) ) ( not ( = ?auto_642113 ?auto_642119 ) ) ( not ( = ?auto_642113 ?auto_642120 ) ) ( not ( = ?auto_642113 ?auto_642121 ) ) ( not ( = ?auto_642113 ?auto_642122 ) ) ( not ( = ?auto_642113 ?auto_642123 ) ) ( not ( = ?auto_642113 ?auto_642124 ) ) ( not ( = ?auto_642113 ?auto_642125 ) ) ( not ( = ?auto_642113 ?auto_642126 ) ) ( not ( = ?auto_642113 ?auto_642127 ) ) ( not ( = ?auto_642113 ?auto_642128 ) ) ( not ( = ?auto_642113 ?auto_642129 ) ) ( not ( = ?auto_642114 ?auto_642115 ) ) ( not ( = ?auto_642114 ?auto_642116 ) ) ( not ( = ?auto_642114 ?auto_642117 ) ) ( not ( = ?auto_642114 ?auto_642118 ) ) ( not ( = ?auto_642114 ?auto_642119 ) ) ( not ( = ?auto_642114 ?auto_642120 ) ) ( not ( = ?auto_642114 ?auto_642121 ) ) ( not ( = ?auto_642114 ?auto_642122 ) ) ( not ( = ?auto_642114 ?auto_642123 ) ) ( not ( = ?auto_642114 ?auto_642124 ) ) ( not ( = ?auto_642114 ?auto_642125 ) ) ( not ( = ?auto_642114 ?auto_642126 ) ) ( not ( = ?auto_642114 ?auto_642127 ) ) ( not ( = ?auto_642114 ?auto_642128 ) ) ( not ( = ?auto_642114 ?auto_642129 ) ) ( not ( = ?auto_642115 ?auto_642116 ) ) ( not ( = ?auto_642115 ?auto_642117 ) ) ( not ( = ?auto_642115 ?auto_642118 ) ) ( not ( = ?auto_642115 ?auto_642119 ) ) ( not ( = ?auto_642115 ?auto_642120 ) ) ( not ( = ?auto_642115 ?auto_642121 ) ) ( not ( = ?auto_642115 ?auto_642122 ) ) ( not ( = ?auto_642115 ?auto_642123 ) ) ( not ( = ?auto_642115 ?auto_642124 ) ) ( not ( = ?auto_642115 ?auto_642125 ) ) ( not ( = ?auto_642115 ?auto_642126 ) ) ( not ( = ?auto_642115 ?auto_642127 ) ) ( not ( = ?auto_642115 ?auto_642128 ) ) ( not ( = ?auto_642115 ?auto_642129 ) ) ( not ( = ?auto_642116 ?auto_642117 ) ) ( not ( = ?auto_642116 ?auto_642118 ) ) ( not ( = ?auto_642116 ?auto_642119 ) ) ( not ( = ?auto_642116 ?auto_642120 ) ) ( not ( = ?auto_642116 ?auto_642121 ) ) ( not ( = ?auto_642116 ?auto_642122 ) ) ( not ( = ?auto_642116 ?auto_642123 ) ) ( not ( = ?auto_642116 ?auto_642124 ) ) ( not ( = ?auto_642116 ?auto_642125 ) ) ( not ( = ?auto_642116 ?auto_642126 ) ) ( not ( = ?auto_642116 ?auto_642127 ) ) ( not ( = ?auto_642116 ?auto_642128 ) ) ( not ( = ?auto_642116 ?auto_642129 ) ) ( not ( = ?auto_642117 ?auto_642118 ) ) ( not ( = ?auto_642117 ?auto_642119 ) ) ( not ( = ?auto_642117 ?auto_642120 ) ) ( not ( = ?auto_642117 ?auto_642121 ) ) ( not ( = ?auto_642117 ?auto_642122 ) ) ( not ( = ?auto_642117 ?auto_642123 ) ) ( not ( = ?auto_642117 ?auto_642124 ) ) ( not ( = ?auto_642117 ?auto_642125 ) ) ( not ( = ?auto_642117 ?auto_642126 ) ) ( not ( = ?auto_642117 ?auto_642127 ) ) ( not ( = ?auto_642117 ?auto_642128 ) ) ( not ( = ?auto_642117 ?auto_642129 ) ) ( not ( = ?auto_642118 ?auto_642119 ) ) ( not ( = ?auto_642118 ?auto_642120 ) ) ( not ( = ?auto_642118 ?auto_642121 ) ) ( not ( = ?auto_642118 ?auto_642122 ) ) ( not ( = ?auto_642118 ?auto_642123 ) ) ( not ( = ?auto_642118 ?auto_642124 ) ) ( not ( = ?auto_642118 ?auto_642125 ) ) ( not ( = ?auto_642118 ?auto_642126 ) ) ( not ( = ?auto_642118 ?auto_642127 ) ) ( not ( = ?auto_642118 ?auto_642128 ) ) ( not ( = ?auto_642118 ?auto_642129 ) ) ( not ( = ?auto_642119 ?auto_642120 ) ) ( not ( = ?auto_642119 ?auto_642121 ) ) ( not ( = ?auto_642119 ?auto_642122 ) ) ( not ( = ?auto_642119 ?auto_642123 ) ) ( not ( = ?auto_642119 ?auto_642124 ) ) ( not ( = ?auto_642119 ?auto_642125 ) ) ( not ( = ?auto_642119 ?auto_642126 ) ) ( not ( = ?auto_642119 ?auto_642127 ) ) ( not ( = ?auto_642119 ?auto_642128 ) ) ( not ( = ?auto_642119 ?auto_642129 ) ) ( not ( = ?auto_642120 ?auto_642121 ) ) ( not ( = ?auto_642120 ?auto_642122 ) ) ( not ( = ?auto_642120 ?auto_642123 ) ) ( not ( = ?auto_642120 ?auto_642124 ) ) ( not ( = ?auto_642120 ?auto_642125 ) ) ( not ( = ?auto_642120 ?auto_642126 ) ) ( not ( = ?auto_642120 ?auto_642127 ) ) ( not ( = ?auto_642120 ?auto_642128 ) ) ( not ( = ?auto_642120 ?auto_642129 ) ) ( not ( = ?auto_642121 ?auto_642122 ) ) ( not ( = ?auto_642121 ?auto_642123 ) ) ( not ( = ?auto_642121 ?auto_642124 ) ) ( not ( = ?auto_642121 ?auto_642125 ) ) ( not ( = ?auto_642121 ?auto_642126 ) ) ( not ( = ?auto_642121 ?auto_642127 ) ) ( not ( = ?auto_642121 ?auto_642128 ) ) ( not ( = ?auto_642121 ?auto_642129 ) ) ( not ( = ?auto_642122 ?auto_642123 ) ) ( not ( = ?auto_642122 ?auto_642124 ) ) ( not ( = ?auto_642122 ?auto_642125 ) ) ( not ( = ?auto_642122 ?auto_642126 ) ) ( not ( = ?auto_642122 ?auto_642127 ) ) ( not ( = ?auto_642122 ?auto_642128 ) ) ( not ( = ?auto_642122 ?auto_642129 ) ) ( not ( = ?auto_642123 ?auto_642124 ) ) ( not ( = ?auto_642123 ?auto_642125 ) ) ( not ( = ?auto_642123 ?auto_642126 ) ) ( not ( = ?auto_642123 ?auto_642127 ) ) ( not ( = ?auto_642123 ?auto_642128 ) ) ( not ( = ?auto_642123 ?auto_642129 ) ) ( not ( = ?auto_642124 ?auto_642125 ) ) ( not ( = ?auto_642124 ?auto_642126 ) ) ( not ( = ?auto_642124 ?auto_642127 ) ) ( not ( = ?auto_642124 ?auto_642128 ) ) ( not ( = ?auto_642124 ?auto_642129 ) ) ( not ( = ?auto_642125 ?auto_642126 ) ) ( not ( = ?auto_642125 ?auto_642127 ) ) ( not ( = ?auto_642125 ?auto_642128 ) ) ( not ( = ?auto_642125 ?auto_642129 ) ) ( not ( = ?auto_642126 ?auto_642127 ) ) ( not ( = ?auto_642126 ?auto_642128 ) ) ( not ( = ?auto_642126 ?auto_642129 ) ) ( not ( = ?auto_642127 ?auto_642128 ) ) ( not ( = ?auto_642127 ?auto_642129 ) ) ( not ( = ?auto_642128 ?auto_642129 ) ) ( ON ?auto_642128 ?auto_642129 ) ( ON ?auto_642127 ?auto_642128 ) ( ON ?auto_642126 ?auto_642127 ) ( ON ?auto_642125 ?auto_642126 ) ( ON ?auto_642124 ?auto_642125 ) ( ON ?auto_642123 ?auto_642124 ) ( ON ?auto_642122 ?auto_642123 ) ( ON ?auto_642121 ?auto_642122 ) ( CLEAR ?auto_642119 ) ( ON ?auto_642120 ?auto_642121 ) ( CLEAR ?auto_642120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_642113 ?auto_642114 ?auto_642115 ?auto_642116 ?auto_642117 ?auto_642118 ?auto_642119 ?auto_642120 )
      ( MAKE-17PILE ?auto_642113 ?auto_642114 ?auto_642115 ?auto_642116 ?auto_642117 ?auto_642118 ?auto_642119 ?auto_642120 ?auto_642121 ?auto_642122 ?auto_642123 ?auto_642124 ?auto_642125 ?auto_642126 ?auto_642127 ?auto_642128 ?auto_642129 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_642147 - BLOCK
      ?auto_642148 - BLOCK
      ?auto_642149 - BLOCK
      ?auto_642150 - BLOCK
      ?auto_642151 - BLOCK
      ?auto_642152 - BLOCK
      ?auto_642153 - BLOCK
      ?auto_642154 - BLOCK
      ?auto_642155 - BLOCK
      ?auto_642156 - BLOCK
      ?auto_642157 - BLOCK
      ?auto_642158 - BLOCK
      ?auto_642159 - BLOCK
      ?auto_642160 - BLOCK
      ?auto_642161 - BLOCK
      ?auto_642162 - BLOCK
      ?auto_642163 - BLOCK
    )
    :vars
    (
      ?auto_642164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_642163 ?auto_642164 ) ( ON-TABLE ?auto_642147 ) ( ON ?auto_642148 ?auto_642147 ) ( ON ?auto_642149 ?auto_642148 ) ( ON ?auto_642150 ?auto_642149 ) ( ON ?auto_642151 ?auto_642150 ) ( ON ?auto_642152 ?auto_642151 ) ( not ( = ?auto_642147 ?auto_642148 ) ) ( not ( = ?auto_642147 ?auto_642149 ) ) ( not ( = ?auto_642147 ?auto_642150 ) ) ( not ( = ?auto_642147 ?auto_642151 ) ) ( not ( = ?auto_642147 ?auto_642152 ) ) ( not ( = ?auto_642147 ?auto_642153 ) ) ( not ( = ?auto_642147 ?auto_642154 ) ) ( not ( = ?auto_642147 ?auto_642155 ) ) ( not ( = ?auto_642147 ?auto_642156 ) ) ( not ( = ?auto_642147 ?auto_642157 ) ) ( not ( = ?auto_642147 ?auto_642158 ) ) ( not ( = ?auto_642147 ?auto_642159 ) ) ( not ( = ?auto_642147 ?auto_642160 ) ) ( not ( = ?auto_642147 ?auto_642161 ) ) ( not ( = ?auto_642147 ?auto_642162 ) ) ( not ( = ?auto_642147 ?auto_642163 ) ) ( not ( = ?auto_642147 ?auto_642164 ) ) ( not ( = ?auto_642148 ?auto_642149 ) ) ( not ( = ?auto_642148 ?auto_642150 ) ) ( not ( = ?auto_642148 ?auto_642151 ) ) ( not ( = ?auto_642148 ?auto_642152 ) ) ( not ( = ?auto_642148 ?auto_642153 ) ) ( not ( = ?auto_642148 ?auto_642154 ) ) ( not ( = ?auto_642148 ?auto_642155 ) ) ( not ( = ?auto_642148 ?auto_642156 ) ) ( not ( = ?auto_642148 ?auto_642157 ) ) ( not ( = ?auto_642148 ?auto_642158 ) ) ( not ( = ?auto_642148 ?auto_642159 ) ) ( not ( = ?auto_642148 ?auto_642160 ) ) ( not ( = ?auto_642148 ?auto_642161 ) ) ( not ( = ?auto_642148 ?auto_642162 ) ) ( not ( = ?auto_642148 ?auto_642163 ) ) ( not ( = ?auto_642148 ?auto_642164 ) ) ( not ( = ?auto_642149 ?auto_642150 ) ) ( not ( = ?auto_642149 ?auto_642151 ) ) ( not ( = ?auto_642149 ?auto_642152 ) ) ( not ( = ?auto_642149 ?auto_642153 ) ) ( not ( = ?auto_642149 ?auto_642154 ) ) ( not ( = ?auto_642149 ?auto_642155 ) ) ( not ( = ?auto_642149 ?auto_642156 ) ) ( not ( = ?auto_642149 ?auto_642157 ) ) ( not ( = ?auto_642149 ?auto_642158 ) ) ( not ( = ?auto_642149 ?auto_642159 ) ) ( not ( = ?auto_642149 ?auto_642160 ) ) ( not ( = ?auto_642149 ?auto_642161 ) ) ( not ( = ?auto_642149 ?auto_642162 ) ) ( not ( = ?auto_642149 ?auto_642163 ) ) ( not ( = ?auto_642149 ?auto_642164 ) ) ( not ( = ?auto_642150 ?auto_642151 ) ) ( not ( = ?auto_642150 ?auto_642152 ) ) ( not ( = ?auto_642150 ?auto_642153 ) ) ( not ( = ?auto_642150 ?auto_642154 ) ) ( not ( = ?auto_642150 ?auto_642155 ) ) ( not ( = ?auto_642150 ?auto_642156 ) ) ( not ( = ?auto_642150 ?auto_642157 ) ) ( not ( = ?auto_642150 ?auto_642158 ) ) ( not ( = ?auto_642150 ?auto_642159 ) ) ( not ( = ?auto_642150 ?auto_642160 ) ) ( not ( = ?auto_642150 ?auto_642161 ) ) ( not ( = ?auto_642150 ?auto_642162 ) ) ( not ( = ?auto_642150 ?auto_642163 ) ) ( not ( = ?auto_642150 ?auto_642164 ) ) ( not ( = ?auto_642151 ?auto_642152 ) ) ( not ( = ?auto_642151 ?auto_642153 ) ) ( not ( = ?auto_642151 ?auto_642154 ) ) ( not ( = ?auto_642151 ?auto_642155 ) ) ( not ( = ?auto_642151 ?auto_642156 ) ) ( not ( = ?auto_642151 ?auto_642157 ) ) ( not ( = ?auto_642151 ?auto_642158 ) ) ( not ( = ?auto_642151 ?auto_642159 ) ) ( not ( = ?auto_642151 ?auto_642160 ) ) ( not ( = ?auto_642151 ?auto_642161 ) ) ( not ( = ?auto_642151 ?auto_642162 ) ) ( not ( = ?auto_642151 ?auto_642163 ) ) ( not ( = ?auto_642151 ?auto_642164 ) ) ( not ( = ?auto_642152 ?auto_642153 ) ) ( not ( = ?auto_642152 ?auto_642154 ) ) ( not ( = ?auto_642152 ?auto_642155 ) ) ( not ( = ?auto_642152 ?auto_642156 ) ) ( not ( = ?auto_642152 ?auto_642157 ) ) ( not ( = ?auto_642152 ?auto_642158 ) ) ( not ( = ?auto_642152 ?auto_642159 ) ) ( not ( = ?auto_642152 ?auto_642160 ) ) ( not ( = ?auto_642152 ?auto_642161 ) ) ( not ( = ?auto_642152 ?auto_642162 ) ) ( not ( = ?auto_642152 ?auto_642163 ) ) ( not ( = ?auto_642152 ?auto_642164 ) ) ( not ( = ?auto_642153 ?auto_642154 ) ) ( not ( = ?auto_642153 ?auto_642155 ) ) ( not ( = ?auto_642153 ?auto_642156 ) ) ( not ( = ?auto_642153 ?auto_642157 ) ) ( not ( = ?auto_642153 ?auto_642158 ) ) ( not ( = ?auto_642153 ?auto_642159 ) ) ( not ( = ?auto_642153 ?auto_642160 ) ) ( not ( = ?auto_642153 ?auto_642161 ) ) ( not ( = ?auto_642153 ?auto_642162 ) ) ( not ( = ?auto_642153 ?auto_642163 ) ) ( not ( = ?auto_642153 ?auto_642164 ) ) ( not ( = ?auto_642154 ?auto_642155 ) ) ( not ( = ?auto_642154 ?auto_642156 ) ) ( not ( = ?auto_642154 ?auto_642157 ) ) ( not ( = ?auto_642154 ?auto_642158 ) ) ( not ( = ?auto_642154 ?auto_642159 ) ) ( not ( = ?auto_642154 ?auto_642160 ) ) ( not ( = ?auto_642154 ?auto_642161 ) ) ( not ( = ?auto_642154 ?auto_642162 ) ) ( not ( = ?auto_642154 ?auto_642163 ) ) ( not ( = ?auto_642154 ?auto_642164 ) ) ( not ( = ?auto_642155 ?auto_642156 ) ) ( not ( = ?auto_642155 ?auto_642157 ) ) ( not ( = ?auto_642155 ?auto_642158 ) ) ( not ( = ?auto_642155 ?auto_642159 ) ) ( not ( = ?auto_642155 ?auto_642160 ) ) ( not ( = ?auto_642155 ?auto_642161 ) ) ( not ( = ?auto_642155 ?auto_642162 ) ) ( not ( = ?auto_642155 ?auto_642163 ) ) ( not ( = ?auto_642155 ?auto_642164 ) ) ( not ( = ?auto_642156 ?auto_642157 ) ) ( not ( = ?auto_642156 ?auto_642158 ) ) ( not ( = ?auto_642156 ?auto_642159 ) ) ( not ( = ?auto_642156 ?auto_642160 ) ) ( not ( = ?auto_642156 ?auto_642161 ) ) ( not ( = ?auto_642156 ?auto_642162 ) ) ( not ( = ?auto_642156 ?auto_642163 ) ) ( not ( = ?auto_642156 ?auto_642164 ) ) ( not ( = ?auto_642157 ?auto_642158 ) ) ( not ( = ?auto_642157 ?auto_642159 ) ) ( not ( = ?auto_642157 ?auto_642160 ) ) ( not ( = ?auto_642157 ?auto_642161 ) ) ( not ( = ?auto_642157 ?auto_642162 ) ) ( not ( = ?auto_642157 ?auto_642163 ) ) ( not ( = ?auto_642157 ?auto_642164 ) ) ( not ( = ?auto_642158 ?auto_642159 ) ) ( not ( = ?auto_642158 ?auto_642160 ) ) ( not ( = ?auto_642158 ?auto_642161 ) ) ( not ( = ?auto_642158 ?auto_642162 ) ) ( not ( = ?auto_642158 ?auto_642163 ) ) ( not ( = ?auto_642158 ?auto_642164 ) ) ( not ( = ?auto_642159 ?auto_642160 ) ) ( not ( = ?auto_642159 ?auto_642161 ) ) ( not ( = ?auto_642159 ?auto_642162 ) ) ( not ( = ?auto_642159 ?auto_642163 ) ) ( not ( = ?auto_642159 ?auto_642164 ) ) ( not ( = ?auto_642160 ?auto_642161 ) ) ( not ( = ?auto_642160 ?auto_642162 ) ) ( not ( = ?auto_642160 ?auto_642163 ) ) ( not ( = ?auto_642160 ?auto_642164 ) ) ( not ( = ?auto_642161 ?auto_642162 ) ) ( not ( = ?auto_642161 ?auto_642163 ) ) ( not ( = ?auto_642161 ?auto_642164 ) ) ( not ( = ?auto_642162 ?auto_642163 ) ) ( not ( = ?auto_642162 ?auto_642164 ) ) ( not ( = ?auto_642163 ?auto_642164 ) ) ( ON ?auto_642162 ?auto_642163 ) ( ON ?auto_642161 ?auto_642162 ) ( ON ?auto_642160 ?auto_642161 ) ( ON ?auto_642159 ?auto_642160 ) ( ON ?auto_642158 ?auto_642159 ) ( ON ?auto_642157 ?auto_642158 ) ( ON ?auto_642156 ?auto_642157 ) ( ON ?auto_642155 ?auto_642156 ) ( ON ?auto_642154 ?auto_642155 ) ( CLEAR ?auto_642152 ) ( ON ?auto_642153 ?auto_642154 ) ( CLEAR ?auto_642153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_642147 ?auto_642148 ?auto_642149 ?auto_642150 ?auto_642151 ?auto_642152 ?auto_642153 )
      ( MAKE-17PILE ?auto_642147 ?auto_642148 ?auto_642149 ?auto_642150 ?auto_642151 ?auto_642152 ?auto_642153 ?auto_642154 ?auto_642155 ?auto_642156 ?auto_642157 ?auto_642158 ?auto_642159 ?auto_642160 ?auto_642161 ?auto_642162 ?auto_642163 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_642182 - BLOCK
      ?auto_642183 - BLOCK
      ?auto_642184 - BLOCK
      ?auto_642185 - BLOCK
      ?auto_642186 - BLOCK
      ?auto_642187 - BLOCK
      ?auto_642188 - BLOCK
      ?auto_642189 - BLOCK
      ?auto_642190 - BLOCK
      ?auto_642191 - BLOCK
      ?auto_642192 - BLOCK
      ?auto_642193 - BLOCK
      ?auto_642194 - BLOCK
      ?auto_642195 - BLOCK
      ?auto_642196 - BLOCK
      ?auto_642197 - BLOCK
      ?auto_642198 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_642198 ) ( ON-TABLE ?auto_642182 ) ( ON ?auto_642183 ?auto_642182 ) ( ON ?auto_642184 ?auto_642183 ) ( ON ?auto_642185 ?auto_642184 ) ( ON ?auto_642186 ?auto_642185 ) ( ON ?auto_642187 ?auto_642186 ) ( not ( = ?auto_642182 ?auto_642183 ) ) ( not ( = ?auto_642182 ?auto_642184 ) ) ( not ( = ?auto_642182 ?auto_642185 ) ) ( not ( = ?auto_642182 ?auto_642186 ) ) ( not ( = ?auto_642182 ?auto_642187 ) ) ( not ( = ?auto_642182 ?auto_642188 ) ) ( not ( = ?auto_642182 ?auto_642189 ) ) ( not ( = ?auto_642182 ?auto_642190 ) ) ( not ( = ?auto_642182 ?auto_642191 ) ) ( not ( = ?auto_642182 ?auto_642192 ) ) ( not ( = ?auto_642182 ?auto_642193 ) ) ( not ( = ?auto_642182 ?auto_642194 ) ) ( not ( = ?auto_642182 ?auto_642195 ) ) ( not ( = ?auto_642182 ?auto_642196 ) ) ( not ( = ?auto_642182 ?auto_642197 ) ) ( not ( = ?auto_642182 ?auto_642198 ) ) ( not ( = ?auto_642183 ?auto_642184 ) ) ( not ( = ?auto_642183 ?auto_642185 ) ) ( not ( = ?auto_642183 ?auto_642186 ) ) ( not ( = ?auto_642183 ?auto_642187 ) ) ( not ( = ?auto_642183 ?auto_642188 ) ) ( not ( = ?auto_642183 ?auto_642189 ) ) ( not ( = ?auto_642183 ?auto_642190 ) ) ( not ( = ?auto_642183 ?auto_642191 ) ) ( not ( = ?auto_642183 ?auto_642192 ) ) ( not ( = ?auto_642183 ?auto_642193 ) ) ( not ( = ?auto_642183 ?auto_642194 ) ) ( not ( = ?auto_642183 ?auto_642195 ) ) ( not ( = ?auto_642183 ?auto_642196 ) ) ( not ( = ?auto_642183 ?auto_642197 ) ) ( not ( = ?auto_642183 ?auto_642198 ) ) ( not ( = ?auto_642184 ?auto_642185 ) ) ( not ( = ?auto_642184 ?auto_642186 ) ) ( not ( = ?auto_642184 ?auto_642187 ) ) ( not ( = ?auto_642184 ?auto_642188 ) ) ( not ( = ?auto_642184 ?auto_642189 ) ) ( not ( = ?auto_642184 ?auto_642190 ) ) ( not ( = ?auto_642184 ?auto_642191 ) ) ( not ( = ?auto_642184 ?auto_642192 ) ) ( not ( = ?auto_642184 ?auto_642193 ) ) ( not ( = ?auto_642184 ?auto_642194 ) ) ( not ( = ?auto_642184 ?auto_642195 ) ) ( not ( = ?auto_642184 ?auto_642196 ) ) ( not ( = ?auto_642184 ?auto_642197 ) ) ( not ( = ?auto_642184 ?auto_642198 ) ) ( not ( = ?auto_642185 ?auto_642186 ) ) ( not ( = ?auto_642185 ?auto_642187 ) ) ( not ( = ?auto_642185 ?auto_642188 ) ) ( not ( = ?auto_642185 ?auto_642189 ) ) ( not ( = ?auto_642185 ?auto_642190 ) ) ( not ( = ?auto_642185 ?auto_642191 ) ) ( not ( = ?auto_642185 ?auto_642192 ) ) ( not ( = ?auto_642185 ?auto_642193 ) ) ( not ( = ?auto_642185 ?auto_642194 ) ) ( not ( = ?auto_642185 ?auto_642195 ) ) ( not ( = ?auto_642185 ?auto_642196 ) ) ( not ( = ?auto_642185 ?auto_642197 ) ) ( not ( = ?auto_642185 ?auto_642198 ) ) ( not ( = ?auto_642186 ?auto_642187 ) ) ( not ( = ?auto_642186 ?auto_642188 ) ) ( not ( = ?auto_642186 ?auto_642189 ) ) ( not ( = ?auto_642186 ?auto_642190 ) ) ( not ( = ?auto_642186 ?auto_642191 ) ) ( not ( = ?auto_642186 ?auto_642192 ) ) ( not ( = ?auto_642186 ?auto_642193 ) ) ( not ( = ?auto_642186 ?auto_642194 ) ) ( not ( = ?auto_642186 ?auto_642195 ) ) ( not ( = ?auto_642186 ?auto_642196 ) ) ( not ( = ?auto_642186 ?auto_642197 ) ) ( not ( = ?auto_642186 ?auto_642198 ) ) ( not ( = ?auto_642187 ?auto_642188 ) ) ( not ( = ?auto_642187 ?auto_642189 ) ) ( not ( = ?auto_642187 ?auto_642190 ) ) ( not ( = ?auto_642187 ?auto_642191 ) ) ( not ( = ?auto_642187 ?auto_642192 ) ) ( not ( = ?auto_642187 ?auto_642193 ) ) ( not ( = ?auto_642187 ?auto_642194 ) ) ( not ( = ?auto_642187 ?auto_642195 ) ) ( not ( = ?auto_642187 ?auto_642196 ) ) ( not ( = ?auto_642187 ?auto_642197 ) ) ( not ( = ?auto_642187 ?auto_642198 ) ) ( not ( = ?auto_642188 ?auto_642189 ) ) ( not ( = ?auto_642188 ?auto_642190 ) ) ( not ( = ?auto_642188 ?auto_642191 ) ) ( not ( = ?auto_642188 ?auto_642192 ) ) ( not ( = ?auto_642188 ?auto_642193 ) ) ( not ( = ?auto_642188 ?auto_642194 ) ) ( not ( = ?auto_642188 ?auto_642195 ) ) ( not ( = ?auto_642188 ?auto_642196 ) ) ( not ( = ?auto_642188 ?auto_642197 ) ) ( not ( = ?auto_642188 ?auto_642198 ) ) ( not ( = ?auto_642189 ?auto_642190 ) ) ( not ( = ?auto_642189 ?auto_642191 ) ) ( not ( = ?auto_642189 ?auto_642192 ) ) ( not ( = ?auto_642189 ?auto_642193 ) ) ( not ( = ?auto_642189 ?auto_642194 ) ) ( not ( = ?auto_642189 ?auto_642195 ) ) ( not ( = ?auto_642189 ?auto_642196 ) ) ( not ( = ?auto_642189 ?auto_642197 ) ) ( not ( = ?auto_642189 ?auto_642198 ) ) ( not ( = ?auto_642190 ?auto_642191 ) ) ( not ( = ?auto_642190 ?auto_642192 ) ) ( not ( = ?auto_642190 ?auto_642193 ) ) ( not ( = ?auto_642190 ?auto_642194 ) ) ( not ( = ?auto_642190 ?auto_642195 ) ) ( not ( = ?auto_642190 ?auto_642196 ) ) ( not ( = ?auto_642190 ?auto_642197 ) ) ( not ( = ?auto_642190 ?auto_642198 ) ) ( not ( = ?auto_642191 ?auto_642192 ) ) ( not ( = ?auto_642191 ?auto_642193 ) ) ( not ( = ?auto_642191 ?auto_642194 ) ) ( not ( = ?auto_642191 ?auto_642195 ) ) ( not ( = ?auto_642191 ?auto_642196 ) ) ( not ( = ?auto_642191 ?auto_642197 ) ) ( not ( = ?auto_642191 ?auto_642198 ) ) ( not ( = ?auto_642192 ?auto_642193 ) ) ( not ( = ?auto_642192 ?auto_642194 ) ) ( not ( = ?auto_642192 ?auto_642195 ) ) ( not ( = ?auto_642192 ?auto_642196 ) ) ( not ( = ?auto_642192 ?auto_642197 ) ) ( not ( = ?auto_642192 ?auto_642198 ) ) ( not ( = ?auto_642193 ?auto_642194 ) ) ( not ( = ?auto_642193 ?auto_642195 ) ) ( not ( = ?auto_642193 ?auto_642196 ) ) ( not ( = ?auto_642193 ?auto_642197 ) ) ( not ( = ?auto_642193 ?auto_642198 ) ) ( not ( = ?auto_642194 ?auto_642195 ) ) ( not ( = ?auto_642194 ?auto_642196 ) ) ( not ( = ?auto_642194 ?auto_642197 ) ) ( not ( = ?auto_642194 ?auto_642198 ) ) ( not ( = ?auto_642195 ?auto_642196 ) ) ( not ( = ?auto_642195 ?auto_642197 ) ) ( not ( = ?auto_642195 ?auto_642198 ) ) ( not ( = ?auto_642196 ?auto_642197 ) ) ( not ( = ?auto_642196 ?auto_642198 ) ) ( not ( = ?auto_642197 ?auto_642198 ) ) ( ON ?auto_642197 ?auto_642198 ) ( ON ?auto_642196 ?auto_642197 ) ( ON ?auto_642195 ?auto_642196 ) ( ON ?auto_642194 ?auto_642195 ) ( ON ?auto_642193 ?auto_642194 ) ( ON ?auto_642192 ?auto_642193 ) ( ON ?auto_642191 ?auto_642192 ) ( ON ?auto_642190 ?auto_642191 ) ( ON ?auto_642189 ?auto_642190 ) ( CLEAR ?auto_642187 ) ( ON ?auto_642188 ?auto_642189 ) ( CLEAR ?auto_642188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_642182 ?auto_642183 ?auto_642184 ?auto_642185 ?auto_642186 ?auto_642187 ?auto_642188 )
      ( MAKE-17PILE ?auto_642182 ?auto_642183 ?auto_642184 ?auto_642185 ?auto_642186 ?auto_642187 ?auto_642188 ?auto_642189 ?auto_642190 ?auto_642191 ?auto_642192 ?auto_642193 ?auto_642194 ?auto_642195 ?auto_642196 ?auto_642197 ?auto_642198 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_642216 - BLOCK
      ?auto_642217 - BLOCK
      ?auto_642218 - BLOCK
      ?auto_642219 - BLOCK
      ?auto_642220 - BLOCK
      ?auto_642221 - BLOCK
      ?auto_642222 - BLOCK
      ?auto_642223 - BLOCK
      ?auto_642224 - BLOCK
      ?auto_642225 - BLOCK
      ?auto_642226 - BLOCK
      ?auto_642227 - BLOCK
      ?auto_642228 - BLOCK
      ?auto_642229 - BLOCK
      ?auto_642230 - BLOCK
      ?auto_642231 - BLOCK
      ?auto_642232 - BLOCK
    )
    :vars
    (
      ?auto_642233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_642232 ?auto_642233 ) ( ON-TABLE ?auto_642216 ) ( ON ?auto_642217 ?auto_642216 ) ( ON ?auto_642218 ?auto_642217 ) ( ON ?auto_642219 ?auto_642218 ) ( ON ?auto_642220 ?auto_642219 ) ( not ( = ?auto_642216 ?auto_642217 ) ) ( not ( = ?auto_642216 ?auto_642218 ) ) ( not ( = ?auto_642216 ?auto_642219 ) ) ( not ( = ?auto_642216 ?auto_642220 ) ) ( not ( = ?auto_642216 ?auto_642221 ) ) ( not ( = ?auto_642216 ?auto_642222 ) ) ( not ( = ?auto_642216 ?auto_642223 ) ) ( not ( = ?auto_642216 ?auto_642224 ) ) ( not ( = ?auto_642216 ?auto_642225 ) ) ( not ( = ?auto_642216 ?auto_642226 ) ) ( not ( = ?auto_642216 ?auto_642227 ) ) ( not ( = ?auto_642216 ?auto_642228 ) ) ( not ( = ?auto_642216 ?auto_642229 ) ) ( not ( = ?auto_642216 ?auto_642230 ) ) ( not ( = ?auto_642216 ?auto_642231 ) ) ( not ( = ?auto_642216 ?auto_642232 ) ) ( not ( = ?auto_642216 ?auto_642233 ) ) ( not ( = ?auto_642217 ?auto_642218 ) ) ( not ( = ?auto_642217 ?auto_642219 ) ) ( not ( = ?auto_642217 ?auto_642220 ) ) ( not ( = ?auto_642217 ?auto_642221 ) ) ( not ( = ?auto_642217 ?auto_642222 ) ) ( not ( = ?auto_642217 ?auto_642223 ) ) ( not ( = ?auto_642217 ?auto_642224 ) ) ( not ( = ?auto_642217 ?auto_642225 ) ) ( not ( = ?auto_642217 ?auto_642226 ) ) ( not ( = ?auto_642217 ?auto_642227 ) ) ( not ( = ?auto_642217 ?auto_642228 ) ) ( not ( = ?auto_642217 ?auto_642229 ) ) ( not ( = ?auto_642217 ?auto_642230 ) ) ( not ( = ?auto_642217 ?auto_642231 ) ) ( not ( = ?auto_642217 ?auto_642232 ) ) ( not ( = ?auto_642217 ?auto_642233 ) ) ( not ( = ?auto_642218 ?auto_642219 ) ) ( not ( = ?auto_642218 ?auto_642220 ) ) ( not ( = ?auto_642218 ?auto_642221 ) ) ( not ( = ?auto_642218 ?auto_642222 ) ) ( not ( = ?auto_642218 ?auto_642223 ) ) ( not ( = ?auto_642218 ?auto_642224 ) ) ( not ( = ?auto_642218 ?auto_642225 ) ) ( not ( = ?auto_642218 ?auto_642226 ) ) ( not ( = ?auto_642218 ?auto_642227 ) ) ( not ( = ?auto_642218 ?auto_642228 ) ) ( not ( = ?auto_642218 ?auto_642229 ) ) ( not ( = ?auto_642218 ?auto_642230 ) ) ( not ( = ?auto_642218 ?auto_642231 ) ) ( not ( = ?auto_642218 ?auto_642232 ) ) ( not ( = ?auto_642218 ?auto_642233 ) ) ( not ( = ?auto_642219 ?auto_642220 ) ) ( not ( = ?auto_642219 ?auto_642221 ) ) ( not ( = ?auto_642219 ?auto_642222 ) ) ( not ( = ?auto_642219 ?auto_642223 ) ) ( not ( = ?auto_642219 ?auto_642224 ) ) ( not ( = ?auto_642219 ?auto_642225 ) ) ( not ( = ?auto_642219 ?auto_642226 ) ) ( not ( = ?auto_642219 ?auto_642227 ) ) ( not ( = ?auto_642219 ?auto_642228 ) ) ( not ( = ?auto_642219 ?auto_642229 ) ) ( not ( = ?auto_642219 ?auto_642230 ) ) ( not ( = ?auto_642219 ?auto_642231 ) ) ( not ( = ?auto_642219 ?auto_642232 ) ) ( not ( = ?auto_642219 ?auto_642233 ) ) ( not ( = ?auto_642220 ?auto_642221 ) ) ( not ( = ?auto_642220 ?auto_642222 ) ) ( not ( = ?auto_642220 ?auto_642223 ) ) ( not ( = ?auto_642220 ?auto_642224 ) ) ( not ( = ?auto_642220 ?auto_642225 ) ) ( not ( = ?auto_642220 ?auto_642226 ) ) ( not ( = ?auto_642220 ?auto_642227 ) ) ( not ( = ?auto_642220 ?auto_642228 ) ) ( not ( = ?auto_642220 ?auto_642229 ) ) ( not ( = ?auto_642220 ?auto_642230 ) ) ( not ( = ?auto_642220 ?auto_642231 ) ) ( not ( = ?auto_642220 ?auto_642232 ) ) ( not ( = ?auto_642220 ?auto_642233 ) ) ( not ( = ?auto_642221 ?auto_642222 ) ) ( not ( = ?auto_642221 ?auto_642223 ) ) ( not ( = ?auto_642221 ?auto_642224 ) ) ( not ( = ?auto_642221 ?auto_642225 ) ) ( not ( = ?auto_642221 ?auto_642226 ) ) ( not ( = ?auto_642221 ?auto_642227 ) ) ( not ( = ?auto_642221 ?auto_642228 ) ) ( not ( = ?auto_642221 ?auto_642229 ) ) ( not ( = ?auto_642221 ?auto_642230 ) ) ( not ( = ?auto_642221 ?auto_642231 ) ) ( not ( = ?auto_642221 ?auto_642232 ) ) ( not ( = ?auto_642221 ?auto_642233 ) ) ( not ( = ?auto_642222 ?auto_642223 ) ) ( not ( = ?auto_642222 ?auto_642224 ) ) ( not ( = ?auto_642222 ?auto_642225 ) ) ( not ( = ?auto_642222 ?auto_642226 ) ) ( not ( = ?auto_642222 ?auto_642227 ) ) ( not ( = ?auto_642222 ?auto_642228 ) ) ( not ( = ?auto_642222 ?auto_642229 ) ) ( not ( = ?auto_642222 ?auto_642230 ) ) ( not ( = ?auto_642222 ?auto_642231 ) ) ( not ( = ?auto_642222 ?auto_642232 ) ) ( not ( = ?auto_642222 ?auto_642233 ) ) ( not ( = ?auto_642223 ?auto_642224 ) ) ( not ( = ?auto_642223 ?auto_642225 ) ) ( not ( = ?auto_642223 ?auto_642226 ) ) ( not ( = ?auto_642223 ?auto_642227 ) ) ( not ( = ?auto_642223 ?auto_642228 ) ) ( not ( = ?auto_642223 ?auto_642229 ) ) ( not ( = ?auto_642223 ?auto_642230 ) ) ( not ( = ?auto_642223 ?auto_642231 ) ) ( not ( = ?auto_642223 ?auto_642232 ) ) ( not ( = ?auto_642223 ?auto_642233 ) ) ( not ( = ?auto_642224 ?auto_642225 ) ) ( not ( = ?auto_642224 ?auto_642226 ) ) ( not ( = ?auto_642224 ?auto_642227 ) ) ( not ( = ?auto_642224 ?auto_642228 ) ) ( not ( = ?auto_642224 ?auto_642229 ) ) ( not ( = ?auto_642224 ?auto_642230 ) ) ( not ( = ?auto_642224 ?auto_642231 ) ) ( not ( = ?auto_642224 ?auto_642232 ) ) ( not ( = ?auto_642224 ?auto_642233 ) ) ( not ( = ?auto_642225 ?auto_642226 ) ) ( not ( = ?auto_642225 ?auto_642227 ) ) ( not ( = ?auto_642225 ?auto_642228 ) ) ( not ( = ?auto_642225 ?auto_642229 ) ) ( not ( = ?auto_642225 ?auto_642230 ) ) ( not ( = ?auto_642225 ?auto_642231 ) ) ( not ( = ?auto_642225 ?auto_642232 ) ) ( not ( = ?auto_642225 ?auto_642233 ) ) ( not ( = ?auto_642226 ?auto_642227 ) ) ( not ( = ?auto_642226 ?auto_642228 ) ) ( not ( = ?auto_642226 ?auto_642229 ) ) ( not ( = ?auto_642226 ?auto_642230 ) ) ( not ( = ?auto_642226 ?auto_642231 ) ) ( not ( = ?auto_642226 ?auto_642232 ) ) ( not ( = ?auto_642226 ?auto_642233 ) ) ( not ( = ?auto_642227 ?auto_642228 ) ) ( not ( = ?auto_642227 ?auto_642229 ) ) ( not ( = ?auto_642227 ?auto_642230 ) ) ( not ( = ?auto_642227 ?auto_642231 ) ) ( not ( = ?auto_642227 ?auto_642232 ) ) ( not ( = ?auto_642227 ?auto_642233 ) ) ( not ( = ?auto_642228 ?auto_642229 ) ) ( not ( = ?auto_642228 ?auto_642230 ) ) ( not ( = ?auto_642228 ?auto_642231 ) ) ( not ( = ?auto_642228 ?auto_642232 ) ) ( not ( = ?auto_642228 ?auto_642233 ) ) ( not ( = ?auto_642229 ?auto_642230 ) ) ( not ( = ?auto_642229 ?auto_642231 ) ) ( not ( = ?auto_642229 ?auto_642232 ) ) ( not ( = ?auto_642229 ?auto_642233 ) ) ( not ( = ?auto_642230 ?auto_642231 ) ) ( not ( = ?auto_642230 ?auto_642232 ) ) ( not ( = ?auto_642230 ?auto_642233 ) ) ( not ( = ?auto_642231 ?auto_642232 ) ) ( not ( = ?auto_642231 ?auto_642233 ) ) ( not ( = ?auto_642232 ?auto_642233 ) ) ( ON ?auto_642231 ?auto_642232 ) ( ON ?auto_642230 ?auto_642231 ) ( ON ?auto_642229 ?auto_642230 ) ( ON ?auto_642228 ?auto_642229 ) ( ON ?auto_642227 ?auto_642228 ) ( ON ?auto_642226 ?auto_642227 ) ( ON ?auto_642225 ?auto_642226 ) ( ON ?auto_642224 ?auto_642225 ) ( ON ?auto_642223 ?auto_642224 ) ( ON ?auto_642222 ?auto_642223 ) ( CLEAR ?auto_642220 ) ( ON ?auto_642221 ?auto_642222 ) ( CLEAR ?auto_642221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_642216 ?auto_642217 ?auto_642218 ?auto_642219 ?auto_642220 ?auto_642221 )
      ( MAKE-17PILE ?auto_642216 ?auto_642217 ?auto_642218 ?auto_642219 ?auto_642220 ?auto_642221 ?auto_642222 ?auto_642223 ?auto_642224 ?auto_642225 ?auto_642226 ?auto_642227 ?auto_642228 ?auto_642229 ?auto_642230 ?auto_642231 ?auto_642232 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_642251 - BLOCK
      ?auto_642252 - BLOCK
      ?auto_642253 - BLOCK
      ?auto_642254 - BLOCK
      ?auto_642255 - BLOCK
      ?auto_642256 - BLOCK
      ?auto_642257 - BLOCK
      ?auto_642258 - BLOCK
      ?auto_642259 - BLOCK
      ?auto_642260 - BLOCK
      ?auto_642261 - BLOCK
      ?auto_642262 - BLOCK
      ?auto_642263 - BLOCK
      ?auto_642264 - BLOCK
      ?auto_642265 - BLOCK
      ?auto_642266 - BLOCK
      ?auto_642267 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_642267 ) ( ON-TABLE ?auto_642251 ) ( ON ?auto_642252 ?auto_642251 ) ( ON ?auto_642253 ?auto_642252 ) ( ON ?auto_642254 ?auto_642253 ) ( ON ?auto_642255 ?auto_642254 ) ( not ( = ?auto_642251 ?auto_642252 ) ) ( not ( = ?auto_642251 ?auto_642253 ) ) ( not ( = ?auto_642251 ?auto_642254 ) ) ( not ( = ?auto_642251 ?auto_642255 ) ) ( not ( = ?auto_642251 ?auto_642256 ) ) ( not ( = ?auto_642251 ?auto_642257 ) ) ( not ( = ?auto_642251 ?auto_642258 ) ) ( not ( = ?auto_642251 ?auto_642259 ) ) ( not ( = ?auto_642251 ?auto_642260 ) ) ( not ( = ?auto_642251 ?auto_642261 ) ) ( not ( = ?auto_642251 ?auto_642262 ) ) ( not ( = ?auto_642251 ?auto_642263 ) ) ( not ( = ?auto_642251 ?auto_642264 ) ) ( not ( = ?auto_642251 ?auto_642265 ) ) ( not ( = ?auto_642251 ?auto_642266 ) ) ( not ( = ?auto_642251 ?auto_642267 ) ) ( not ( = ?auto_642252 ?auto_642253 ) ) ( not ( = ?auto_642252 ?auto_642254 ) ) ( not ( = ?auto_642252 ?auto_642255 ) ) ( not ( = ?auto_642252 ?auto_642256 ) ) ( not ( = ?auto_642252 ?auto_642257 ) ) ( not ( = ?auto_642252 ?auto_642258 ) ) ( not ( = ?auto_642252 ?auto_642259 ) ) ( not ( = ?auto_642252 ?auto_642260 ) ) ( not ( = ?auto_642252 ?auto_642261 ) ) ( not ( = ?auto_642252 ?auto_642262 ) ) ( not ( = ?auto_642252 ?auto_642263 ) ) ( not ( = ?auto_642252 ?auto_642264 ) ) ( not ( = ?auto_642252 ?auto_642265 ) ) ( not ( = ?auto_642252 ?auto_642266 ) ) ( not ( = ?auto_642252 ?auto_642267 ) ) ( not ( = ?auto_642253 ?auto_642254 ) ) ( not ( = ?auto_642253 ?auto_642255 ) ) ( not ( = ?auto_642253 ?auto_642256 ) ) ( not ( = ?auto_642253 ?auto_642257 ) ) ( not ( = ?auto_642253 ?auto_642258 ) ) ( not ( = ?auto_642253 ?auto_642259 ) ) ( not ( = ?auto_642253 ?auto_642260 ) ) ( not ( = ?auto_642253 ?auto_642261 ) ) ( not ( = ?auto_642253 ?auto_642262 ) ) ( not ( = ?auto_642253 ?auto_642263 ) ) ( not ( = ?auto_642253 ?auto_642264 ) ) ( not ( = ?auto_642253 ?auto_642265 ) ) ( not ( = ?auto_642253 ?auto_642266 ) ) ( not ( = ?auto_642253 ?auto_642267 ) ) ( not ( = ?auto_642254 ?auto_642255 ) ) ( not ( = ?auto_642254 ?auto_642256 ) ) ( not ( = ?auto_642254 ?auto_642257 ) ) ( not ( = ?auto_642254 ?auto_642258 ) ) ( not ( = ?auto_642254 ?auto_642259 ) ) ( not ( = ?auto_642254 ?auto_642260 ) ) ( not ( = ?auto_642254 ?auto_642261 ) ) ( not ( = ?auto_642254 ?auto_642262 ) ) ( not ( = ?auto_642254 ?auto_642263 ) ) ( not ( = ?auto_642254 ?auto_642264 ) ) ( not ( = ?auto_642254 ?auto_642265 ) ) ( not ( = ?auto_642254 ?auto_642266 ) ) ( not ( = ?auto_642254 ?auto_642267 ) ) ( not ( = ?auto_642255 ?auto_642256 ) ) ( not ( = ?auto_642255 ?auto_642257 ) ) ( not ( = ?auto_642255 ?auto_642258 ) ) ( not ( = ?auto_642255 ?auto_642259 ) ) ( not ( = ?auto_642255 ?auto_642260 ) ) ( not ( = ?auto_642255 ?auto_642261 ) ) ( not ( = ?auto_642255 ?auto_642262 ) ) ( not ( = ?auto_642255 ?auto_642263 ) ) ( not ( = ?auto_642255 ?auto_642264 ) ) ( not ( = ?auto_642255 ?auto_642265 ) ) ( not ( = ?auto_642255 ?auto_642266 ) ) ( not ( = ?auto_642255 ?auto_642267 ) ) ( not ( = ?auto_642256 ?auto_642257 ) ) ( not ( = ?auto_642256 ?auto_642258 ) ) ( not ( = ?auto_642256 ?auto_642259 ) ) ( not ( = ?auto_642256 ?auto_642260 ) ) ( not ( = ?auto_642256 ?auto_642261 ) ) ( not ( = ?auto_642256 ?auto_642262 ) ) ( not ( = ?auto_642256 ?auto_642263 ) ) ( not ( = ?auto_642256 ?auto_642264 ) ) ( not ( = ?auto_642256 ?auto_642265 ) ) ( not ( = ?auto_642256 ?auto_642266 ) ) ( not ( = ?auto_642256 ?auto_642267 ) ) ( not ( = ?auto_642257 ?auto_642258 ) ) ( not ( = ?auto_642257 ?auto_642259 ) ) ( not ( = ?auto_642257 ?auto_642260 ) ) ( not ( = ?auto_642257 ?auto_642261 ) ) ( not ( = ?auto_642257 ?auto_642262 ) ) ( not ( = ?auto_642257 ?auto_642263 ) ) ( not ( = ?auto_642257 ?auto_642264 ) ) ( not ( = ?auto_642257 ?auto_642265 ) ) ( not ( = ?auto_642257 ?auto_642266 ) ) ( not ( = ?auto_642257 ?auto_642267 ) ) ( not ( = ?auto_642258 ?auto_642259 ) ) ( not ( = ?auto_642258 ?auto_642260 ) ) ( not ( = ?auto_642258 ?auto_642261 ) ) ( not ( = ?auto_642258 ?auto_642262 ) ) ( not ( = ?auto_642258 ?auto_642263 ) ) ( not ( = ?auto_642258 ?auto_642264 ) ) ( not ( = ?auto_642258 ?auto_642265 ) ) ( not ( = ?auto_642258 ?auto_642266 ) ) ( not ( = ?auto_642258 ?auto_642267 ) ) ( not ( = ?auto_642259 ?auto_642260 ) ) ( not ( = ?auto_642259 ?auto_642261 ) ) ( not ( = ?auto_642259 ?auto_642262 ) ) ( not ( = ?auto_642259 ?auto_642263 ) ) ( not ( = ?auto_642259 ?auto_642264 ) ) ( not ( = ?auto_642259 ?auto_642265 ) ) ( not ( = ?auto_642259 ?auto_642266 ) ) ( not ( = ?auto_642259 ?auto_642267 ) ) ( not ( = ?auto_642260 ?auto_642261 ) ) ( not ( = ?auto_642260 ?auto_642262 ) ) ( not ( = ?auto_642260 ?auto_642263 ) ) ( not ( = ?auto_642260 ?auto_642264 ) ) ( not ( = ?auto_642260 ?auto_642265 ) ) ( not ( = ?auto_642260 ?auto_642266 ) ) ( not ( = ?auto_642260 ?auto_642267 ) ) ( not ( = ?auto_642261 ?auto_642262 ) ) ( not ( = ?auto_642261 ?auto_642263 ) ) ( not ( = ?auto_642261 ?auto_642264 ) ) ( not ( = ?auto_642261 ?auto_642265 ) ) ( not ( = ?auto_642261 ?auto_642266 ) ) ( not ( = ?auto_642261 ?auto_642267 ) ) ( not ( = ?auto_642262 ?auto_642263 ) ) ( not ( = ?auto_642262 ?auto_642264 ) ) ( not ( = ?auto_642262 ?auto_642265 ) ) ( not ( = ?auto_642262 ?auto_642266 ) ) ( not ( = ?auto_642262 ?auto_642267 ) ) ( not ( = ?auto_642263 ?auto_642264 ) ) ( not ( = ?auto_642263 ?auto_642265 ) ) ( not ( = ?auto_642263 ?auto_642266 ) ) ( not ( = ?auto_642263 ?auto_642267 ) ) ( not ( = ?auto_642264 ?auto_642265 ) ) ( not ( = ?auto_642264 ?auto_642266 ) ) ( not ( = ?auto_642264 ?auto_642267 ) ) ( not ( = ?auto_642265 ?auto_642266 ) ) ( not ( = ?auto_642265 ?auto_642267 ) ) ( not ( = ?auto_642266 ?auto_642267 ) ) ( ON ?auto_642266 ?auto_642267 ) ( ON ?auto_642265 ?auto_642266 ) ( ON ?auto_642264 ?auto_642265 ) ( ON ?auto_642263 ?auto_642264 ) ( ON ?auto_642262 ?auto_642263 ) ( ON ?auto_642261 ?auto_642262 ) ( ON ?auto_642260 ?auto_642261 ) ( ON ?auto_642259 ?auto_642260 ) ( ON ?auto_642258 ?auto_642259 ) ( ON ?auto_642257 ?auto_642258 ) ( CLEAR ?auto_642255 ) ( ON ?auto_642256 ?auto_642257 ) ( CLEAR ?auto_642256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_642251 ?auto_642252 ?auto_642253 ?auto_642254 ?auto_642255 ?auto_642256 )
      ( MAKE-17PILE ?auto_642251 ?auto_642252 ?auto_642253 ?auto_642254 ?auto_642255 ?auto_642256 ?auto_642257 ?auto_642258 ?auto_642259 ?auto_642260 ?auto_642261 ?auto_642262 ?auto_642263 ?auto_642264 ?auto_642265 ?auto_642266 ?auto_642267 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_642285 - BLOCK
      ?auto_642286 - BLOCK
      ?auto_642287 - BLOCK
      ?auto_642288 - BLOCK
      ?auto_642289 - BLOCK
      ?auto_642290 - BLOCK
      ?auto_642291 - BLOCK
      ?auto_642292 - BLOCK
      ?auto_642293 - BLOCK
      ?auto_642294 - BLOCK
      ?auto_642295 - BLOCK
      ?auto_642296 - BLOCK
      ?auto_642297 - BLOCK
      ?auto_642298 - BLOCK
      ?auto_642299 - BLOCK
      ?auto_642300 - BLOCK
      ?auto_642301 - BLOCK
    )
    :vars
    (
      ?auto_642302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_642301 ?auto_642302 ) ( ON-TABLE ?auto_642285 ) ( ON ?auto_642286 ?auto_642285 ) ( ON ?auto_642287 ?auto_642286 ) ( ON ?auto_642288 ?auto_642287 ) ( not ( = ?auto_642285 ?auto_642286 ) ) ( not ( = ?auto_642285 ?auto_642287 ) ) ( not ( = ?auto_642285 ?auto_642288 ) ) ( not ( = ?auto_642285 ?auto_642289 ) ) ( not ( = ?auto_642285 ?auto_642290 ) ) ( not ( = ?auto_642285 ?auto_642291 ) ) ( not ( = ?auto_642285 ?auto_642292 ) ) ( not ( = ?auto_642285 ?auto_642293 ) ) ( not ( = ?auto_642285 ?auto_642294 ) ) ( not ( = ?auto_642285 ?auto_642295 ) ) ( not ( = ?auto_642285 ?auto_642296 ) ) ( not ( = ?auto_642285 ?auto_642297 ) ) ( not ( = ?auto_642285 ?auto_642298 ) ) ( not ( = ?auto_642285 ?auto_642299 ) ) ( not ( = ?auto_642285 ?auto_642300 ) ) ( not ( = ?auto_642285 ?auto_642301 ) ) ( not ( = ?auto_642285 ?auto_642302 ) ) ( not ( = ?auto_642286 ?auto_642287 ) ) ( not ( = ?auto_642286 ?auto_642288 ) ) ( not ( = ?auto_642286 ?auto_642289 ) ) ( not ( = ?auto_642286 ?auto_642290 ) ) ( not ( = ?auto_642286 ?auto_642291 ) ) ( not ( = ?auto_642286 ?auto_642292 ) ) ( not ( = ?auto_642286 ?auto_642293 ) ) ( not ( = ?auto_642286 ?auto_642294 ) ) ( not ( = ?auto_642286 ?auto_642295 ) ) ( not ( = ?auto_642286 ?auto_642296 ) ) ( not ( = ?auto_642286 ?auto_642297 ) ) ( not ( = ?auto_642286 ?auto_642298 ) ) ( not ( = ?auto_642286 ?auto_642299 ) ) ( not ( = ?auto_642286 ?auto_642300 ) ) ( not ( = ?auto_642286 ?auto_642301 ) ) ( not ( = ?auto_642286 ?auto_642302 ) ) ( not ( = ?auto_642287 ?auto_642288 ) ) ( not ( = ?auto_642287 ?auto_642289 ) ) ( not ( = ?auto_642287 ?auto_642290 ) ) ( not ( = ?auto_642287 ?auto_642291 ) ) ( not ( = ?auto_642287 ?auto_642292 ) ) ( not ( = ?auto_642287 ?auto_642293 ) ) ( not ( = ?auto_642287 ?auto_642294 ) ) ( not ( = ?auto_642287 ?auto_642295 ) ) ( not ( = ?auto_642287 ?auto_642296 ) ) ( not ( = ?auto_642287 ?auto_642297 ) ) ( not ( = ?auto_642287 ?auto_642298 ) ) ( not ( = ?auto_642287 ?auto_642299 ) ) ( not ( = ?auto_642287 ?auto_642300 ) ) ( not ( = ?auto_642287 ?auto_642301 ) ) ( not ( = ?auto_642287 ?auto_642302 ) ) ( not ( = ?auto_642288 ?auto_642289 ) ) ( not ( = ?auto_642288 ?auto_642290 ) ) ( not ( = ?auto_642288 ?auto_642291 ) ) ( not ( = ?auto_642288 ?auto_642292 ) ) ( not ( = ?auto_642288 ?auto_642293 ) ) ( not ( = ?auto_642288 ?auto_642294 ) ) ( not ( = ?auto_642288 ?auto_642295 ) ) ( not ( = ?auto_642288 ?auto_642296 ) ) ( not ( = ?auto_642288 ?auto_642297 ) ) ( not ( = ?auto_642288 ?auto_642298 ) ) ( not ( = ?auto_642288 ?auto_642299 ) ) ( not ( = ?auto_642288 ?auto_642300 ) ) ( not ( = ?auto_642288 ?auto_642301 ) ) ( not ( = ?auto_642288 ?auto_642302 ) ) ( not ( = ?auto_642289 ?auto_642290 ) ) ( not ( = ?auto_642289 ?auto_642291 ) ) ( not ( = ?auto_642289 ?auto_642292 ) ) ( not ( = ?auto_642289 ?auto_642293 ) ) ( not ( = ?auto_642289 ?auto_642294 ) ) ( not ( = ?auto_642289 ?auto_642295 ) ) ( not ( = ?auto_642289 ?auto_642296 ) ) ( not ( = ?auto_642289 ?auto_642297 ) ) ( not ( = ?auto_642289 ?auto_642298 ) ) ( not ( = ?auto_642289 ?auto_642299 ) ) ( not ( = ?auto_642289 ?auto_642300 ) ) ( not ( = ?auto_642289 ?auto_642301 ) ) ( not ( = ?auto_642289 ?auto_642302 ) ) ( not ( = ?auto_642290 ?auto_642291 ) ) ( not ( = ?auto_642290 ?auto_642292 ) ) ( not ( = ?auto_642290 ?auto_642293 ) ) ( not ( = ?auto_642290 ?auto_642294 ) ) ( not ( = ?auto_642290 ?auto_642295 ) ) ( not ( = ?auto_642290 ?auto_642296 ) ) ( not ( = ?auto_642290 ?auto_642297 ) ) ( not ( = ?auto_642290 ?auto_642298 ) ) ( not ( = ?auto_642290 ?auto_642299 ) ) ( not ( = ?auto_642290 ?auto_642300 ) ) ( not ( = ?auto_642290 ?auto_642301 ) ) ( not ( = ?auto_642290 ?auto_642302 ) ) ( not ( = ?auto_642291 ?auto_642292 ) ) ( not ( = ?auto_642291 ?auto_642293 ) ) ( not ( = ?auto_642291 ?auto_642294 ) ) ( not ( = ?auto_642291 ?auto_642295 ) ) ( not ( = ?auto_642291 ?auto_642296 ) ) ( not ( = ?auto_642291 ?auto_642297 ) ) ( not ( = ?auto_642291 ?auto_642298 ) ) ( not ( = ?auto_642291 ?auto_642299 ) ) ( not ( = ?auto_642291 ?auto_642300 ) ) ( not ( = ?auto_642291 ?auto_642301 ) ) ( not ( = ?auto_642291 ?auto_642302 ) ) ( not ( = ?auto_642292 ?auto_642293 ) ) ( not ( = ?auto_642292 ?auto_642294 ) ) ( not ( = ?auto_642292 ?auto_642295 ) ) ( not ( = ?auto_642292 ?auto_642296 ) ) ( not ( = ?auto_642292 ?auto_642297 ) ) ( not ( = ?auto_642292 ?auto_642298 ) ) ( not ( = ?auto_642292 ?auto_642299 ) ) ( not ( = ?auto_642292 ?auto_642300 ) ) ( not ( = ?auto_642292 ?auto_642301 ) ) ( not ( = ?auto_642292 ?auto_642302 ) ) ( not ( = ?auto_642293 ?auto_642294 ) ) ( not ( = ?auto_642293 ?auto_642295 ) ) ( not ( = ?auto_642293 ?auto_642296 ) ) ( not ( = ?auto_642293 ?auto_642297 ) ) ( not ( = ?auto_642293 ?auto_642298 ) ) ( not ( = ?auto_642293 ?auto_642299 ) ) ( not ( = ?auto_642293 ?auto_642300 ) ) ( not ( = ?auto_642293 ?auto_642301 ) ) ( not ( = ?auto_642293 ?auto_642302 ) ) ( not ( = ?auto_642294 ?auto_642295 ) ) ( not ( = ?auto_642294 ?auto_642296 ) ) ( not ( = ?auto_642294 ?auto_642297 ) ) ( not ( = ?auto_642294 ?auto_642298 ) ) ( not ( = ?auto_642294 ?auto_642299 ) ) ( not ( = ?auto_642294 ?auto_642300 ) ) ( not ( = ?auto_642294 ?auto_642301 ) ) ( not ( = ?auto_642294 ?auto_642302 ) ) ( not ( = ?auto_642295 ?auto_642296 ) ) ( not ( = ?auto_642295 ?auto_642297 ) ) ( not ( = ?auto_642295 ?auto_642298 ) ) ( not ( = ?auto_642295 ?auto_642299 ) ) ( not ( = ?auto_642295 ?auto_642300 ) ) ( not ( = ?auto_642295 ?auto_642301 ) ) ( not ( = ?auto_642295 ?auto_642302 ) ) ( not ( = ?auto_642296 ?auto_642297 ) ) ( not ( = ?auto_642296 ?auto_642298 ) ) ( not ( = ?auto_642296 ?auto_642299 ) ) ( not ( = ?auto_642296 ?auto_642300 ) ) ( not ( = ?auto_642296 ?auto_642301 ) ) ( not ( = ?auto_642296 ?auto_642302 ) ) ( not ( = ?auto_642297 ?auto_642298 ) ) ( not ( = ?auto_642297 ?auto_642299 ) ) ( not ( = ?auto_642297 ?auto_642300 ) ) ( not ( = ?auto_642297 ?auto_642301 ) ) ( not ( = ?auto_642297 ?auto_642302 ) ) ( not ( = ?auto_642298 ?auto_642299 ) ) ( not ( = ?auto_642298 ?auto_642300 ) ) ( not ( = ?auto_642298 ?auto_642301 ) ) ( not ( = ?auto_642298 ?auto_642302 ) ) ( not ( = ?auto_642299 ?auto_642300 ) ) ( not ( = ?auto_642299 ?auto_642301 ) ) ( not ( = ?auto_642299 ?auto_642302 ) ) ( not ( = ?auto_642300 ?auto_642301 ) ) ( not ( = ?auto_642300 ?auto_642302 ) ) ( not ( = ?auto_642301 ?auto_642302 ) ) ( ON ?auto_642300 ?auto_642301 ) ( ON ?auto_642299 ?auto_642300 ) ( ON ?auto_642298 ?auto_642299 ) ( ON ?auto_642297 ?auto_642298 ) ( ON ?auto_642296 ?auto_642297 ) ( ON ?auto_642295 ?auto_642296 ) ( ON ?auto_642294 ?auto_642295 ) ( ON ?auto_642293 ?auto_642294 ) ( ON ?auto_642292 ?auto_642293 ) ( ON ?auto_642291 ?auto_642292 ) ( ON ?auto_642290 ?auto_642291 ) ( CLEAR ?auto_642288 ) ( ON ?auto_642289 ?auto_642290 ) ( CLEAR ?auto_642289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_642285 ?auto_642286 ?auto_642287 ?auto_642288 ?auto_642289 )
      ( MAKE-17PILE ?auto_642285 ?auto_642286 ?auto_642287 ?auto_642288 ?auto_642289 ?auto_642290 ?auto_642291 ?auto_642292 ?auto_642293 ?auto_642294 ?auto_642295 ?auto_642296 ?auto_642297 ?auto_642298 ?auto_642299 ?auto_642300 ?auto_642301 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_642320 - BLOCK
      ?auto_642321 - BLOCK
      ?auto_642322 - BLOCK
      ?auto_642323 - BLOCK
      ?auto_642324 - BLOCK
      ?auto_642325 - BLOCK
      ?auto_642326 - BLOCK
      ?auto_642327 - BLOCK
      ?auto_642328 - BLOCK
      ?auto_642329 - BLOCK
      ?auto_642330 - BLOCK
      ?auto_642331 - BLOCK
      ?auto_642332 - BLOCK
      ?auto_642333 - BLOCK
      ?auto_642334 - BLOCK
      ?auto_642335 - BLOCK
      ?auto_642336 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_642336 ) ( ON-TABLE ?auto_642320 ) ( ON ?auto_642321 ?auto_642320 ) ( ON ?auto_642322 ?auto_642321 ) ( ON ?auto_642323 ?auto_642322 ) ( not ( = ?auto_642320 ?auto_642321 ) ) ( not ( = ?auto_642320 ?auto_642322 ) ) ( not ( = ?auto_642320 ?auto_642323 ) ) ( not ( = ?auto_642320 ?auto_642324 ) ) ( not ( = ?auto_642320 ?auto_642325 ) ) ( not ( = ?auto_642320 ?auto_642326 ) ) ( not ( = ?auto_642320 ?auto_642327 ) ) ( not ( = ?auto_642320 ?auto_642328 ) ) ( not ( = ?auto_642320 ?auto_642329 ) ) ( not ( = ?auto_642320 ?auto_642330 ) ) ( not ( = ?auto_642320 ?auto_642331 ) ) ( not ( = ?auto_642320 ?auto_642332 ) ) ( not ( = ?auto_642320 ?auto_642333 ) ) ( not ( = ?auto_642320 ?auto_642334 ) ) ( not ( = ?auto_642320 ?auto_642335 ) ) ( not ( = ?auto_642320 ?auto_642336 ) ) ( not ( = ?auto_642321 ?auto_642322 ) ) ( not ( = ?auto_642321 ?auto_642323 ) ) ( not ( = ?auto_642321 ?auto_642324 ) ) ( not ( = ?auto_642321 ?auto_642325 ) ) ( not ( = ?auto_642321 ?auto_642326 ) ) ( not ( = ?auto_642321 ?auto_642327 ) ) ( not ( = ?auto_642321 ?auto_642328 ) ) ( not ( = ?auto_642321 ?auto_642329 ) ) ( not ( = ?auto_642321 ?auto_642330 ) ) ( not ( = ?auto_642321 ?auto_642331 ) ) ( not ( = ?auto_642321 ?auto_642332 ) ) ( not ( = ?auto_642321 ?auto_642333 ) ) ( not ( = ?auto_642321 ?auto_642334 ) ) ( not ( = ?auto_642321 ?auto_642335 ) ) ( not ( = ?auto_642321 ?auto_642336 ) ) ( not ( = ?auto_642322 ?auto_642323 ) ) ( not ( = ?auto_642322 ?auto_642324 ) ) ( not ( = ?auto_642322 ?auto_642325 ) ) ( not ( = ?auto_642322 ?auto_642326 ) ) ( not ( = ?auto_642322 ?auto_642327 ) ) ( not ( = ?auto_642322 ?auto_642328 ) ) ( not ( = ?auto_642322 ?auto_642329 ) ) ( not ( = ?auto_642322 ?auto_642330 ) ) ( not ( = ?auto_642322 ?auto_642331 ) ) ( not ( = ?auto_642322 ?auto_642332 ) ) ( not ( = ?auto_642322 ?auto_642333 ) ) ( not ( = ?auto_642322 ?auto_642334 ) ) ( not ( = ?auto_642322 ?auto_642335 ) ) ( not ( = ?auto_642322 ?auto_642336 ) ) ( not ( = ?auto_642323 ?auto_642324 ) ) ( not ( = ?auto_642323 ?auto_642325 ) ) ( not ( = ?auto_642323 ?auto_642326 ) ) ( not ( = ?auto_642323 ?auto_642327 ) ) ( not ( = ?auto_642323 ?auto_642328 ) ) ( not ( = ?auto_642323 ?auto_642329 ) ) ( not ( = ?auto_642323 ?auto_642330 ) ) ( not ( = ?auto_642323 ?auto_642331 ) ) ( not ( = ?auto_642323 ?auto_642332 ) ) ( not ( = ?auto_642323 ?auto_642333 ) ) ( not ( = ?auto_642323 ?auto_642334 ) ) ( not ( = ?auto_642323 ?auto_642335 ) ) ( not ( = ?auto_642323 ?auto_642336 ) ) ( not ( = ?auto_642324 ?auto_642325 ) ) ( not ( = ?auto_642324 ?auto_642326 ) ) ( not ( = ?auto_642324 ?auto_642327 ) ) ( not ( = ?auto_642324 ?auto_642328 ) ) ( not ( = ?auto_642324 ?auto_642329 ) ) ( not ( = ?auto_642324 ?auto_642330 ) ) ( not ( = ?auto_642324 ?auto_642331 ) ) ( not ( = ?auto_642324 ?auto_642332 ) ) ( not ( = ?auto_642324 ?auto_642333 ) ) ( not ( = ?auto_642324 ?auto_642334 ) ) ( not ( = ?auto_642324 ?auto_642335 ) ) ( not ( = ?auto_642324 ?auto_642336 ) ) ( not ( = ?auto_642325 ?auto_642326 ) ) ( not ( = ?auto_642325 ?auto_642327 ) ) ( not ( = ?auto_642325 ?auto_642328 ) ) ( not ( = ?auto_642325 ?auto_642329 ) ) ( not ( = ?auto_642325 ?auto_642330 ) ) ( not ( = ?auto_642325 ?auto_642331 ) ) ( not ( = ?auto_642325 ?auto_642332 ) ) ( not ( = ?auto_642325 ?auto_642333 ) ) ( not ( = ?auto_642325 ?auto_642334 ) ) ( not ( = ?auto_642325 ?auto_642335 ) ) ( not ( = ?auto_642325 ?auto_642336 ) ) ( not ( = ?auto_642326 ?auto_642327 ) ) ( not ( = ?auto_642326 ?auto_642328 ) ) ( not ( = ?auto_642326 ?auto_642329 ) ) ( not ( = ?auto_642326 ?auto_642330 ) ) ( not ( = ?auto_642326 ?auto_642331 ) ) ( not ( = ?auto_642326 ?auto_642332 ) ) ( not ( = ?auto_642326 ?auto_642333 ) ) ( not ( = ?auto_642326 ?auto_642334 ) ) ( not ( = ?auto_642326 ?auto_642335 ) ) ( not ( = ?auto_642326 ?auto_642336 ) ) ( not ( = ?auto_642327 ?auto_642328 ) ) ( not ( = ?auto_642327 ?auto_642329 ) ) ( not ( = ?auto_642327 ?auto_642330 ) ) ( not ( = ?auto_642327 ?auto_642331 ) ) ( not ( = ?auto_642327 ?auto_642332 ) ) ( not ( = ?auto_642327 ?auto_642333 ) ) ( not ( = ?auto_642327 ?auto_642334 ) ) ( not ( = ?auto_642327 ?auto_642335 ) ) ( not ( = ?auto_642327 ?auto_642336 ) ) ( not ( = ?auto_642328 ?auto_642329 ) ) ( not ( = ?auto_642328 ?auto_642330 ) ) ( not ( = ?auto_642328 ?auto_642331 ) ) ( not ( = ?auto_642328 ?auto_642332 ) ) ( not ( = ?auto_642328 ?auto_642333 ) ) ( not ( = ?auto_642328 ?auto_642334 ) ) ( not ( = ?auto_642328 ?auto_642335 ) ) ( not ( = ?auto_642328 ?auto_642336 ) ) ( not ( = ?auto_642329 ?auto_642330 ) ) ( not ( = ?auto_642329 ?auto_642331 ) ) ( not ( = ?auto_642329 ?auto_642332 ) ) ( not ( = ?auto_642329 ?auto_642333 ) ) ( not ( = ?auto_642329 ?auto_642334 ) ) ( not ( = ?auto_642329 ?auto_642335 ) ) ( not ( = ?auto_642329 ?auto_642336 ) ) ( not ( = ?auto_642330 ?auto_642331 ) ) ( not ( = ?auto_642330 ?auto_642332 ) ) ( not ( = ?auto_642330 ?auto_642333 ) ) ( not ( = ?auto_642330 ?auto_642334 ) ) ( not ( = ?auto_642330 ?auto_642335 ) ) ( not ( = ?auto_642330 ?auto_642336 ) ) ( not ( = ?auto_642331 ?auto_642332 ) ) ( not ( = ?auto_642331 ?auto_642333 ) ) ( not ( = ?auto_642331 ?auto_642334 ) ) ( not ( = ?auto_642331 ?auto_642335 ) ) ( not ( = ?auto_642331 ?auto_642336 ) ) ( not ( = ?auto_642332 ?auto_642333 ) ) ( not ( = ?auto_642332 ?auto_642334 ) ) ( not ( = ?auto_642332 ?auto_642335 ) ) ( not ( = ?auto_642332 ?auto_642336 ) ) ( not ( = ?auto_642333 ?auto_642334 ) ) ( not ( = ?auto_642333 ?auto_642335 ) ) ( not ( = ?auto_642333 ?auto_642336 ) ) ( not ( = ?auto_642334 ?auto_642335 ) ) ( not ( = ?auto_642334 ?auto_642336 ) ) ( not ( = ?auto_642335 ?auto_642336 ) ) ( ON ?auto_642335 ?auto_642336 ) ( ON ?auto_642334 ?auto_642335 ) ( ON ?auto_642333 ?auto_642334 ) ( ON ?auto_642332 ?auto_642333 ) ( ON ?auto_642331 ?auto_642332 ) ( ON ?auto_642330 ?auto_642331 ) ( ON ?auto_642329 ?auto_642330 ) ( ON ?auto_642328 ?auto_642329 ) ( ON ?auto_642327 ?auto_642328 ) ( ON ?auto_642326 ?auto_642327 ) ( ON ?auto_642325 ?auto_642326 ) ( CLEAR ?auto_642323 ) ( ON ?auto_642324 ?auto_642325 ) ( CLEAR ?auto_642324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_642320 ?auto_642321 ?auto_642322 ?auto_642323 ?auto_642324 )
      ( MAKE-17PILE ?auto_642320 ?auto_642321 ?auto_642322 ?auto_642323 ?auto_642324 ?auto_642325 ?auto_642326 ?auto_642327 ?auto_642328 ?auto_642329 ?auto_642330 ?auto_642331 ?auto_642332 ?auto_642333 ?auto_642334 ?auto_642335 ?auto_642336 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_642354 - BLOCK
      ?auto_642355 - BLOCK
      ?auto_642356 - BLOCK
      ?auto_642357 - BLOCK
      ?auto_642358 - BLOCK
      ?auto_642359 - BLOCK
      ?auto_642360 - BLOCK
      ?auto_642361 - BLOCK
      ?auto_642362 - BLOCK
      ?auto_642363 - BLOCK
      ?auto_642364 - BLOCK
      ?auto_642365 - BLOCK
      ?auto_642366 - BLOCK
      ?auto_642367 - BLOCK
      ?auto_642368 - BLOCK
      ?auto_642369 - BLOCK
      ?auto_642370 - BLOCK
    )
    :vars
    (
      ?auto_642371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_642370 ?auto_642371 ) ( ON-TABLE ?auto_642354 ) ( ON ?auto_642355 ?auto_642354 ) ( ON ?auto_642356 ?auto_642355 ) ( not ( = ?auto_642354 ?auto_642355 ) ) ( not ( = ?auto_642354 ?auto_642356 ) ) ( not ( = ?auto_642354 ?auto_642357 ) ) ( not ( = ?auto_642354 ?auto_642358 ) ) ( not ( = ?auto_642354 ?auto_642359 ) ) ( not ( = ?auto_642354 ?auto_642360 ) ) ( not ( = ?auto_642354 ?auto_642361 ) ) ( not ( = ?auto_642354 ?auto_642362 ) ) ( not ( = ?auto_642354 ?auto_642363 ) ) ( not ( = ?auto_642354 ?auto_642364 ) ) ( not ( = ?auto_642354 ?auto_642365 ) ) ( not ( = ?auto_642354 ?auto_642366 ) ) ( not ( = ?auto_642354 ?auto_642367 ) ) ( not ( = ?auto_642354 ?auto_642368 ) ) ( not ( = ?auto_642354 ?auto_642369 ) ) ( not ( = ?auto_642354 ?auto_642370 ) ) ( not ( = ?auto_642354 ?auto_642371 ) ) ( not ( = ?auto_642355 ?auto_642356 ) ) ( not ( = ?auto_642355 ?auto_642357 ) ) ( not ( = ?auto_642355 ?auto_642358 ) ) ( not ( = ?auto_642355 ?auto_642359 ) ) ( not ( = ?auto_642355 ?auto_642360 ) ) ( not ( = ?auto_642355 ?auto_642361 ) ) ( not ( = ?auto_642355 ?auto_642362 ) ) ( not ( = ?auto_642355 ?auto_642363 ) ) ( not ( = ?auto_642355 ?auto_642364 ) ) ( not ( = ?auto_642355 ?auto_642365 ) ) ( not ( = ?auto_642355 ?auto_642366 ) ) ( not ( = ?auto_642355 ?auto_642367 ) ) ( not ( = ?auto_642355 ?auto_642368 ) ) ( not ( = ?auto_642355 ?auto_642369 ) ) ( not ( = ?auto_642355 ?auto_642370 ) ) ( not ( = ?auto_642355 ?auto_642371 ) ) ( not ( = ?auto_642356 ?auto_642357 ) ) ( not ( = ?auto_642356 ?auto_642358 ) ) ( not ( = ?auto_642356 ?auto_642359 ) ) ( not ( = ?auto_642356 ?auto_642360 ) ) ( not ( = ?auto_642356 ?auto_642361 ) ) ( not ( = ?auto_642356 ?auto_642362 ) ) ( not ( = ?auto_642356 ?auto_642363 ) ) ( not ( = ?auto_642356 ?auto_642364 ) ) ( not ( = ?auto_642356 ?auto_642365 ) ) ( not ( = ?auto_642356 ?auto_642366 ) ) ( not ( = ?auto_642356 ?auto_642367 ) ) ( not ( = ?auto_642356 ?auto_642368 ) ) ( not ( = ?auto_642356 ?auto_642369 ) ) ( not ( = ?auto_642356 ?auto_642370 ) ) ( not ( = ?auto_642356 ?auto_642371 ) ) ( not ( = ?auto_642357 ?auto_642358 ) ) ( not ( = ?auto_642357 ?auto_642359 ) ) ( not ( = ?auto_642357 ?auto_642360 ) ) ( not ( = ?auto_642357 ?auto_642361 ) ) ( not ( = ?auto_642357 ?auto_642362 ) ) ( not ( = ?auto_642357 ?auto_642363 ) ) ( not ( = ?auto_642357 ?auto_642364 ) ) ( not ( = ?auto_642357 ?auto_642365 ) ) ( not ( = ?auto_642357 ?auto_642366 ) ) ( not ( = ?auto_642357 ?auto_642367 ) ) ( not ( = ?auto_642357 ?auto_642368 ) ) ( not ( = ?auto_642357 ?auto_642369 ) ) ( not ( = ?auto_642357 ?auto_642370 ) ) ( not ( = ?auto_642357 ?auto_642371 ) ) ( not ( = ?auto_642358 ?auto_642359 ) ) ( not ( = ?auto_642358 ?auto_642360 ) ) ( not ( = ?auto_642358 ?auto_642361 ) ) ( not ( = ?auto_642358 ?auto_642362 ) ) ( not ( = ?auto_642358 ?auto_642363 ) ) ( not ( = ?auto_642358 ?auto_642364 ) ) ( not ( = ?auto_642358 ?auto_642365 ) ) ( not ( = ?auto_642358 ?auto_642366 ) ) ( not ( = ?auto_642358 ?auto_642367 ) ) ( not ( = ?auto_642358 ?auto_642368 ) ) ( not ( = ?auto_642358 ?auto_642369 ) ) ( not ( = ?auto_642358 ?auto_642370 ) ) ( not ( = ?auto_642358 ?auto_642371 ) ) ( not ( = ?auto_642359 ?auto_642360 ) ) ( not ( = ?auto_642359 ?auto_642361 ) ) ( not ( = ?auto_642359 ?auto_642362 ) ) ( not ( = ?auto_642359 ?auto_642363 ) ) ( not ( = ?auto_642359 ?auto_642364 ) ) ( not ( = ?auto_642359 ?auto_642365 ) ) ( not ( = ?auto_642359 ?auto_642366 ) ) ( not ( = ?auto_642359 ?auto_642367 ) ) ( not ( = ?auto_642359 ?auto_642368 ) ) ( not ( = ?auto_642359 ?auto_642369 ) ) ( not ( = ?auto_642359 ?auto_642370 ) ) ( not ( = ?auto_642359 ?auto_642371 ) ) ( not ( = ?auto_642360 ?auto_642361 ) ) ( not ( = ?auto_642360 ?auto_642362 ) ) ( not ( = ?auto_642360 ?auto_642363 ) ) ( not ( = ?auto_642360 ?auto_642364 ) ) ( not ( = ?auto_642360 ?auto_642365 ) ) ( not ( = ?auto_642360 ?auto_642366 ) ) ( not ( = ?auto_642360 ?auto_642367 ) ) ( not ( = ?auto_642360 ?auto_642368 ) ) ( not ( = ?auto_642360 ?auto_642369 ) ) ( not ( = ?auto_642360 ?auto_642370 ) ) ( not ( = ?auto_642360 ?auto_642371 ) ) ( not ( = ?auto_642361 ?auto_642362 ) ) ( not ( = ?auto_642361 ?auto_642363 ) ) ( not ( = ?auto_642361 ?auto_642364 ) ) ( not ( = ?auto_642361 ?auto_642365 ) ) ( not ( = ?auto_642361 ?auto_642366 ) ) ( not ( = ?auto_642361 ?auto_642367 ) ) ( not ( = ?auto_642361 ?auto_642368 ) ) ( not ( = ?auto_642361 ?auto_642369 ) ) ( not ( = ?auto_642361 ?auto_642370 ) ) ( not ( = ?auto_642361 ?auto_642371 ) ) ( not ( = ?auto_642362 ?auto_642363 ) ) ( not ( = ?auto_642362 ?auto_642364 ) ) ( not ( = ?auto_642362 ?auto_642365 ) ) ( not ( = ?auto_642362 ?auto_642366 ) ) ( not ( = ?auto_642362 ?auto_642367 ) ) ( not ( = ?auto_642362 ?auto_642368 ) ) ( not ( = ?auto_642362 ?auto_642369 ) ) ( not ( = ?auto_642362 ?auto_642370 ) ) ( not ( = ?auto_642362 ?auto_642371 ) ) ( not ( = ?auto_642363 ?auto_642364 ) ) ( not ( = ?auto_642363 ?auto_642365 ) ) ( not ( = ?auto_642363 ?auto_642366 ) ) ( not ( = ?auto_642363 ?auto_642367 ) ) ( not ( = ?auto_642363 ?auto_642368 ) ) ( not ( = ?auto_642363 ?auto_642369 ) ) ( not ( = ?auto_642363 ?auto_642370 ) ) ( not ( = ?auto_642363 ?auto_642371 ) ) ( not ( = ?auto_642364 ?auto_642365 ) ) ( not ( = ?auto_642364 ?auto_642366 ) ) ( not ( = ?auto_642364 ?auto_642367 ) ) ( not ( = ?auto_642364 ?auto_642368 ) ) ( not ( = ?auto_642364 ?auto_642369 ) ) ( not ( = ?auto_642364 ?auto_642370 ) ) ( not ( = ?auto_642364 ?auto_642371 ) ) ( not ( = ?auto_642365 ?auto_642366 ) ) ( not ( = ?auto_642365 ?auto_642367 ) ) ( not ( = ?auto_642365 ?auto_642368 ) ) ( not ( = ?auto_642365 ?auto_642369 ) ) ( not ( = ?auto_642365 ?auto_642370 ) ) ( not ( = ?auto_642365 ?auto_642371 ) ) ( not ( = ?auto_642366 ?auto_642367 ) ) ( not ( = ?auto_642366 ?auto_642368 ) ) ( not ( = ?auto_642366 ?auto_642369 ) ) ( not ( = ?auto_642366 ?auto_642370 ) ) ( not ( = ?auto_642366 ?auto_642371 ) ) ( not ( = ?auto_642367 ?auto_642368 ) ) ( not ( = ?auto_642367 ?auto_642369 ) ) ( not ( = ?auto_642367 ?auto_642370 ) ) ( not ( = ?auto_642367 ?auto_642371 ) ) ( not ( = ?auto_642368 ?auto_642369 ) ) ( not ( = ?auto_642368 ?auto_642370 ) ) ( not ( = ?auto_642368 ?auto_642371 ) ) ( not ( = ?auto_642369 ?auto_642370 ) ) ( not ( = ?auto_642369 ?auto_642371 ) ) ( not ( = ?auto_642370 ?auto_642371 ) ) ( ON ?auto_642369 ?auto_642370 ) ( ON ?auto_642368 ?auto_642369 ) ( ON ?auto_642367 ?auto_642368 ) ( ON ?auto_642366 ?auto_642367 ) ( ON ?auto_642365 ?auto_642366 ) ( ON ?auto_642364 ?auto_642365 ) ( ON ?auto_642363 ?auto_642364 ) ( ON ?auto_642362 ?auto_642363 ) ( ON ?auto_642361 ?auto_642362 ) ( ON ?auto_642360 ?auto_642361 ) ( ON ?auto_642359 ?auto_642360 ) ( ON ?auto_642358 ?auto_642359 ) ( CLEAR ?auto_642356 ) ( ON ?auto_642357 ?auto_642358 ) ( CLEAR ?auto_642357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_642354 ?auto_642355 ?auto_642356 ?auto_642357 )
      ( MAKE-17PILE ?auto_642354 ?auto_642355 ?auto_642356 ?auto_642357 ?auto_642358 ?auto_642359 ?auto_642360 ?auto_642361 ?auto_642362 ?auto_642363 ?auto_642364 ?auto_642365 ?auto_642366 ?auto_642367 ?auto_642368 ?auto_642369 ?auto_642370 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_642389 - BLOCK
      ?auto_642390 - BLOCK
      ?auto_642391 - BLOCK
      ?auto_642392 - BLOCK
      ?auto_642393 - BLOCK
      ?auto_642394 - BLOCK
      ?auto_642395 - BLOCK
      ?auto_642396 - BLOCK
      ?auto_642397 - BLOCK
      ?auto_642398 - BLOCK
      ?auto_642399 - BLOCK
      ?auto_642400 - BLOCK
      ?auto_642401 - BLOCK
      ?auto_642402 - BLOCK
      ?auto_642403 - BLOCK
      ?auto_642404 - BLOCK
      ?auto_642405 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_642405 ) ( ON-TABLE ?auto_642389 ) ( ON ?auto_642390 ?auto_642389 ) ( ON ?auto_642391 ?auto_642390 ) ( not ( = ?auto_642389 ?auto_642390 ) ) ( not ( = ?auto_642389 ?auto_642391 ) ) ( not ( = ?auto_642389 ?auto_642392 ) ) ( not ( = ?auto_642389 ?auto_642393 ) ) ( not ( = ?auto_642389 ?auto_642394 ) ) ( not ( = ?auto_642389 ?auto_642395 ) ) ( not ( = ?auto_642389 ?auto_642396 ) ) ( not ( = ?auto_642389 ?auto_642397 ) ) ( not ( = ?auto_642389 ?auto_642398 ) ) ( not ( = ?auto_642389 ?auto_642399 ) ) ( not ( = ?auto_642389 ?auto_642400 ) ) ( not ( = ?auto_642389 ?auto_642401 ) ) ( not ( = ?auto_642389 ?auto_642402 ) ) ( not ( = ?auto_642389 ?auto_642403 ) ) ( not ( = ?auto_642389 ?auto_642404 ) ) ( not ( = ?auto_642389 ?auto_642405 ) ) ( not ( = ?auto_642390 ?auto_642391 ) ) ( not ( = ?auto_642390 ?auto_642392 ) ) ( not ( = ?auto_642390 ?auto_642393 ) ) ( not ( = ?auto_642390 ?auto_642394 ) ) ( not ( = ?auto_642390 ?auto_642395 ) ) ( not ( = ?auto_642390 ?auto_642396 ) ) ( not ( = ?auto_642390 ?auto_642397 ) ) ( not ( = ?auto_642390 ?auto_642398 ) ) ( not ( = ?auto_642390 ?auto_642399 ) ) ( not ( = ?auto_642390 ?auto_642400 ) ) ( not ( = ?auto_642390 ?auto_642401 ) ) ( not ( = ?auto_642390 ?auto_642402 ) ) ( not ( = ?auto_642390 ?auto_642403 ) ) ( not ( = ?auto_642390 ?auto_642404 ) ) ( not ( = ?auto_642390 ?auto_642405 ) ) ( not ( = ?auto_642391 ?auto_642392 ) ) ( not ( = ?auto_642391 ?auto_642393 ) ) ( not ( = ?auto_642391 ?auto_642394 ) ) ( not ( = ?auto_642391 ?auto_642395 ) ) ( not ( = ?auto_642391 ?auto_642396 ) ) ( not ( = ?auto_642391 ?auto_642397 ) ) ( not ( = ?auto_642391 ?auto_642398 ) ) ( not ( = ?auto_642391 ?auto_642399 ) ) ( not ( = ?auto_642391 ?auto_642400 ) ) ( not ( = ?auto_642391 ?auto_642401 ) ) ( not ( = ?auto_642391 ?auto_642402 ) ) ( not ( = ?auto_642391 ?auto_642403 ) ) ( not ( = ?auto_642391 ?auto_642404 ) ) ( not ( = ?auto_642391 ?auto_642405 ) ) ( not ( = ?auto_642392 ?auto_642393 ) ) ( not ( = ?auto_642392 ?auto_642394 ) ) ( not ( = ?auto_642392 ?auto_642395 ) ) ( not ( = ?auto_642392 ?auto_642396 ) ) ( not ( = ?auto_642392 ?auto_642397 ) ) ( not ( = ?auto_642392 ?auto_642398 ) ) ( not ( = ?auto_642392 ?auto_642399 ) ) ( not ( = ?auto_642392 ?auto_642400 ) ) ( not ( = ?auto_642392 ?auto_642401 ) ) ( not ( = ?auto_642392 ?auto_642402 ) ) ( not ( = ?auto_642392 ?auto_642403 ) ) ( not ( = ?auto_642392 ?auto_642404 ) ) ( not ( = ?auto_642392 ?auto_642405 ) ) ( not ( = ?auto_642393 ?auto_642394 ) ) ( not ( = ?auto_642393 ?auto_642395 ) ) ( not ( = ?auto_642393 ?auto_642396 ) ) ( not ( = ?auto_642393 ?auto_642397 ) ) ( not ( = ?auto_642393 ?auto_642398 ) ) ( not ( = ?auto_642393 ?auto_642399 ) ) ( not ( = ?auto_642393 ?auto_642400 ) ) ( not ( = ?auto_642393 ?auto_642401 ) ) ( not ( = ?auto_642393 ?auto_642402 ) ) ( not ( = ?auto_642393 ?auto_642403 ) ) ( not ( = ?auto_642393 ?auto_642404 ) ) ( not ( = ?auto_642393 ?auto_642405 ) ) ( not ( = ?auto_642394 ?auto_642395 ) ) ( not ( = ?auto_642394 ?auto_642396 ) ) ( not ( = ?auto_642394 ?auto_642397 ) ) ( not ( = ?auto_642394 ?auto_642398 ) ) ( not ( = ?auto_642394 ?auto_642399 ) ) ( not ( = ?auto_642394 ?auto_642400 ) ) ( not ( = ?auto_642394 ?auto_642401 ) ) ( not ( = ?auto_642394 ?auto_642402 ) ) ( not ( = ?auto_642394 ?auto_642403 ) ) ( not ( = ?auto_642394 ?auto_642404 ) ) ( not ( = ?auto_642394 ?auto_642405 ) ) ( not ( = ?auto_642395 ?auto_642396 ) ) ( not ( = ?auto_642395 ?auto_642397 ) ) ( not ( = ?auto_642395 ?auto_642398 ) ) ( not ( = ?auto_642395 ?auto_642399 ) ) ( not ( = ?auto_642395 ?auto_642400 ) ) ( not ( = ?auto_642395 ?auto_642401 ) ) ( not ( = ?auto_642395 ?auto_642402 ) ) ( not ( = ?auto_642395 ?auto_642403 ) ) ( not ( = ?auto_642395 ?auto_642404 ) ) ( not ( = ?auto_642395 ?auto_642405 ) ) ( not ( = ?auto_642396 ?auto_642397 ) ) ( not ( = ?auto_642396 ?auto_642398 ) ) ( not ( = ?auto_642396 ?auto_642399 ) ) ( not ( = ?auto_642396 ?auto_642400 ) ) ( not ( = ?auto_642396 ?auto_642401 ) ) ( not ( = ?auto_642396 ?auto_642402 ) ) ( not ( = ?auto_642396 ?auto_642403 ) ) ( not ( = ?auto_642396 ?auto_642404 ) ) ( not ( = ?auto_642396 ?auto_642405 ) ) ( not ( = ?auto_642397 ?auto_642398 ) ) ( not ( = ?auto_642397 ?auto_642399 ) ) ( not ( = ?auto_642397 ?auto_642400 ) ) ( not ( = ?auto_642397 ?auto_642401 ) ) ( not ( = ?auto_642397 ?auto_642402 ) ) ( not ( = ?auto_642397 ?auto_642403 ) ) ( not ( = ?auto_642397 ?auto_642404 ) ) ( not ( = ?auto_642397 ?auto_642405 ) ) ( not ( = ?auto_642398 ?auto_642399 ) ) ( not ( = ?auto_642398 ?auto_642400 ) ) ( not ( = ?auto_642398 ?auto_642401 ) ) ( not ( = ?auto_642398 ?auto_642402 ) ) ( not ( = ?auto_642398 ?auto_642403 ) ) ( not ( = ?auto_642398 ?auto_642404 ) ) ( not ( = ?auto_642398 ?auto_642405 ) ) ( not ( = ?auto_642399 ?auto_642400 ) ) ( not ( = ?auto_642399 ?auto_642401 ) ) ( not ( = ?auto_642399 ?auto_642402 ) ) ( not ( = ?auto_642399 ?auto_642403 ) ) ( not ( = ?auto_642399 ?auto_642404 ) ) ( not ( = ?auto_642399 ?auto_642405 ) ) ( not ( = ?auto_642400 ?auto_642401 ) ) ( not ( = ?auto_642400 ?auto_642402 ) ) ( not ( = ?auto_642400 ?auto_642403 ) ) ( not ( = ?auto_642400 ?auto_642404 ) ) ( not ( = ?auto_642400 ?auto_642405 ) ) ( not ( = ?auto_642401 ?auto_642402 ) ) ( not ( = ?auto_642401 ?auto_642403 ) ) ( not ( = ?auto_642401 ?auto_642404 ) ) ( not ( = ?auto_642401 ?auto_642405 ) ) ( not ( = ?auto_642402 ?auto_642403 ) ) ( not ( = ?auto_642402 ?auto_642404 ) ) ( not ( = ?auto_642402 ?auto_642405 ) ) ( not ( = ?auto_642403 ?auto_642404 ) ) ( not ( = ?auto_642403 ?auto_642405 ) ) ( not ( = ?auto_642404 ?auto_642405 ) ) ( ON ?auto_642404 ?auto_642405 ) ( ON ?auto_642403 ?auto_642404 ) ( ON ?auto_642402 ?auto_642403 ) ( ON ?auto_642401 ?auto_642402 ) ( ON ?auto_642400 ?auto_642401 ) ( ON ?auto_642399 ?auto_642400 ) ( ON ?auto_642398 ?auto_642399 ) ( ON ?auto_642397 ?auto_642398 ) ( ON ?auto_642396 ?auto_642397 ) ( ON ?auto_642395 ?auto_642396 ) ( ON ?auto_642394 ?auto_642395 ) ( ON ?auto_642393 ?auto_642394 ) ( CLEAR ?auto_642391 ) ( ON ?auto_642392 ?auto_642393 ) ( CLEAR ?auto_642392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_642389 ?auto_642390 ?auto_642391 ?auto_642392 )
      ( MAKE-17PILE ?auto_642389 ?auto_642390 ?auto_642391 ?auto_642392 ?auto_642393 ?auto_642394 ?auto_642395 ?auto_642396 ?auto_642397 ?auto_642398 ?auto_642399 ?auto_642400 ?auto_642401 ?auto_642402 ?auto_642403 ?auto_642404 ?auto_642405 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_642423 - BLOCK
      ?auto_642424 - BLOCK
      ?auto_642425 - BLOCK
      ?auto_642426 - BLOCK
      ?auto_642427 - BLOCK
      ?auto_642428 - BLOCK
      ?auto_642429 - BLOCK
      ?auto_642430 - BLOCK
      ?auto_642431 - BLOCK
      ?auto_642432 - BLOCK
      ?auto_642433 - BLOCK
      ?auto_642434 - BLOCK
      ?auto_642435 - BLOCK
      ?auto_642436 - BLOCK
      ?auto_642437 - BLOCK
      ?auto_642438 - BLOCK
      ?auto_642439 - BLOCK
    )
    :vars
    (
      ?auto_642440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_642439 ?auto_642440 ) ( ON-TABLE ?auto_642423 ) ( ON ?auto_642424 ?auto_642423 ) ( not ( = ?auto_642423 ?auto_642424 ) ) ( not ( = ?auto_642423 ?auto_642425 ) ) ( not ( = ?auto_642423 ?auto_642426 ) ) ( not ( = ?auto_642423 ?auto_642427 ) ) ( not ( = ?auto_642423 ?auto_642428 ) ) ( not ( = ?auto_642423 ?auto_642429 ) ) ( not ( = ?auto_642423 ?auto_642430 ) ) ( not ( = ?auto_642423 ?auto_642431 ) ) ( not ( = ?auto_642423 ?auto_642432 ) ) ( not ( = ?auto_642423 ?auto_642433 ) ) ( not ( = ?auto_642423 ?auto_642434 ) ) ( not ( = ?auto_642423 ?auto_642435 ) ) ( not ( = ?auto_642423 ?auto_642436 ) ) ( not ( = ?auto_642423 ?auto_642437 ) ) ( not ( = ?auto_642423 ?auto_642438 ) ) ( not ( = ?auto_642423 ?auto_642439 ) ) ( not ( = ?auto_642423 ?auto_642440 ) ) ( not ( = ?auto_642424 ?auto_642425 ) ) ( not ( = ?auto_642424 ?auto_642426 ) ) ( not ( = ?auto_642424 ?auto_642427 ) ) ( not ( = ?auto_642424 ?auto_642428 ) ) ( not ( = ?auto_642424 ?auto_642429 ) ) ( not ( = ?auto_642424 ?auto_642430 ) ) ( not ( = ?auto_642424 ?auto_642431 ) ) ( not ( = ?auto_642424 ?auto_642432 ) ) ( not ( = ?auto_642424 ?auto_642433 ) ) ( not ( = ?auto_642424 ?auto_642434 ) ) ( not ( = ?auto_642424 ?auto_642435 ) ) ( not ( = ?auto_642424 ?auto_642436 ) ) ( not ( = ?auto_642424 ?auto_642437 ) ) ( not ( = ?auto_642424 ?auto_642438 ) ) ( not ( = ?auto_642424 ?auto_642439 ) ) ( not ( = ?auto_642424 ?auto_642440 ) ) ( not ( = ?auto_642425 ?auto_642426 ) ) ( not ( = ?auto_642425 ?auto_642427 ) ) ( not ( = ?auto_642425 ?auto_642428 ) ) ( not ( = ?auto_642425 ?auto_642429 ) ) ( not ( = ?auto_642425 ?auto_642430 ) ) ( not ( = ?auto_642425 ?auto_642431 ) ) ( not ( = ?auto_642425 ?auto_642432 ) ) ( not ( = ?auto_642425 ?auto_642433 ) ) ( not ( = ?auto_642425 ?auto_642434 ) ) ( not ( = ?auto_642425 ?auto_642435 ) ) ( not ( = ?auto_642425 ?auto_642436 ) ) ( not ( = ?auto_642425 ?auto_642437 ) ) ( not ( = ?auto_642425 ?auto_642438 ) ) ( not ( = ?auto_642425 ?auto_642439 ) ) ( not ( = ?auto_642425 ?auto_642440 ) ) ( not ( = ?auto_642426 ?auto_642427 ) ) ( not ( = ?auto_642426 ?auto_642428 ) ) ( not ( = ?auto_642426 ?auto_642429 ) ) ( not ( = ?auto_642426 ?auto_642430 ) ) ( not ( = ?auto_642426 ?auto_642431 ) ) ( not ( = ?auto_642426 ?auto_642432 ) ) ( not ( = ?auto_642426 ?auto_642433 ) ) ( not ( = ?auto_642426 ?auto_642434 ) ) ( not ( = ?auto_642426 ?auto_642435 ) ) ( not ( = ?auto_642426 ?auto_642436 ) ) ( not ( = ?auto_642426 ?auto_642437 ) ) ( not ( = ?auto_642426 ?auto_642438 ) ) ( not ( = ?auto_642426 ?auto_642439 ) ) ( not ( = ?auto_642426 ?auto_642440 ) ) ( not ( = ?auto_642427 ?auto_642428 ) ) ( not ( = ?auto_642427 ?auto_642429 ) ) ( not ( = ?auto_642427 ?auto_642430 ) ) ( not ( = ?auto_642427 ?auto_642431 ) ) ( not ( = ?auto_642427 ?auto_642432 ) ) ( not ( = ?auto_642427 ?auto_642433 ) ) ( not ( = ?auto_642427 ?auto_642434 ) ) ( not ( = ?auto_642427 ?auto_642435 ) ) ( not ( = ?auto_642427 ?auto_642436 ) ) ( not ( = ?auto_642427 ?auto_642437 ) ) ( not ( = ?auto_642427 ?auto_642438 ) ) ( not ( = ?auto_642427 ?auto_642439 ) ) ( not ( = ?auto_642427 ?auto_642440 ) ) ( not ( = ?auto_642428 ?auto_642429 ) ) ( not ( = ?auto_642428 ?auto_642430 ) ) ( not ( = ?auto_642428 ?auto_642431 ) ) ( not ( = ?auto_642428 ?auto_642432 ) ) ( not ( = ?auto_642428 ?auto_642433 ) ) ( not ( = ?auto_642428 ?auto_642434 ) ) ( not ( = ?auto_642428 ?auto_642435 ) ) ( not ( = ?auto_642428 ?auto_642436 ) ) ( not ( = ?auto_642428 ?auto_642437 ) ) ( not ( = ?auto_642428 ?auto_642438 ) ) ( not ( = ?auto_642428 ?auto_642439 ) ) ( not ( = ?auto_642428 ?auto_642440 ) ) ( not ( = ?auto_642429 ?auto_642430 ) ) ( not ( = ?auto_642429 ?auto_642431 ) ) ( not ( = ?auto_642429 ?auto_642432 ) ) ( not ( = ?auto_642429 ?auto_642433 ) ) ( not ( = ?auto_642429 ?auto_642434 ) ) ( not ( = ?auto_642429 ?auto_642435 ) ) ( not ( = ?auto_642429 ?auto_642436 ) ) ( not ( = ?auto_642429 ?auto_642437 ) ) ( not ( = ?auto_642429 ?auto_642438 ) ) ( not ( = ?auto_642429 ?auto_642439 ) ) ( not ( = ?auto_642429 ?auto_642440 ) ) ( not ( = ?auto_642430 ?auto_642431 ) ) ( not ( = ?auto_642430 ?auto_642432 ) ) ( not ( = ?auto_642430 ?auto_642433 ) ) ( not ( = ?auto_642430 ?auto_642434 ) ) ( not ( = ?auto_642430 ?auto_642435 ) ) ( not ( = ?auto_642430 ?auto_642436 ) ) ( not ( = ?auto_642430 ?auto_642437 ) ) ( not ( = ?auto_642430 ?auto_642438 ) ) ( not ( = ?auto_642430 ?auto_642439 ) ) ( not ( = ?auto_642430 ?auto_642440 ) ) ( not ( = ?auto_642431 ?auto_642432 ) ) ( not ( = ?auto_642431 ?auto_642433 ) ) ( not ( = ?auto_642431 ?auto_642434 ) ) ( not ( = ?auto_642431 ?auto_642435 ) ) ( not ( = ?auto_642431 ?auto_642436 ) ) ( not ( = ?auto_642431 ?auto_642437 ) ) ( not ( = ?auto_642431 ?auto_642438 ) ) ( not ( = ?auto_642431 ?auto_642439 ) ) ( not ( = ?auto_642431 ?auto_642440 ) ) ( not ( = ?auto_642432 ?auto_642433 ) ) ( not ( = ?auto_642432 ?auto_642434 ) ) ( not ( = ?auto_642432 ?auto_642435 ) ) ( not ( = ?auto_642432 ?auto_642436 ) ) ( not ( = ?auto_642432 ?auto_642437 ) ) ( not ( = ?auto_642432 ?auto_642438 ) ) ( not ( = ?auto_642432 ?auto_642439 ) ) ( not ( = ?auto_642432 ?auto_642440 ) ) ( not ( = ?auto_642433 ?auto_642434 ) ) ( not ( = ?auto_642433 ?auto_642435 ) ) ( not ( = ?auto_642433 ?auto_642436 ) ) ( not ( = ?auto_642433 ?auto_642437 ) ) ( not ( = ?auto_642433 ?auto_642438 ) ) ( not ( = ?auto_642433 ?auto_642439 ) ) ( not ( = ?auto_642433 ?auto_642440 ) ) ( not ( = ?auto_642434 ?auto_642435 ) ) ( not ( = ?auto_642434 ?auto_642436 ) ) ( not ( = ?auto_642434 ?auto_642437 ) ) ( not ( = ?auto_642434 ?auto_642438 ) ) ( not ( = ?auto_642434 ?auto_642439 ) ) ( not ( = ?auto_642434 ?auto_642440 ) ) ( not ( = ?auto_642435 ?auto_642436 ) ) ( not ( = ?auto_642435 ?auto_642437 ) ) ( not ( = ?auto_642435 ?auto_642438 ) ) ( not ( = ?auto_642435 ?auto_642439 ) ) ( not ( = ?auto_642435 ?auto_642440 ) ) ( not ( = ?auto_642436 ?auto_642437 ) ) ( not ( = ?auto_642436 ?auto_642438 ) ) ( not ( = ?auto_642436 ?auto_642439 ) ) ( not ( = ?auto_642436 ?auto_642440 ) ) ( not ( = ?auto_642437 ?auto_642438 ) ) ( not ( = ?auto_642437 ?auto_642439 ) ) ( not ( = ?auto_642437 ?auto_642440 ) ) ( not ( = ?auto_642438 ?auto_642439 ) ) ( not ( = ?auto_642438 ?auto_642440 ) ) ( not ( = ?auto_642439 ?auto_642440 ) ) ( ON ?auto_642438 ?auto_642439 ) ( ON ?auto_642437 ?auto_642438 ) ( ON ?auto_642436 ?auto_642437 ) ( ON ?auto_642435 ?auto_642436 ) ( ON ?auto_642434 ?auto_642435 ) ( ON ?auto_642433 ?auto_642434 ) ( ON ?auto_642432 ?auto_642433 ) ( ON ?auto_642431 ?auto_642432 ) ( ON ?auto_642430 ?auto_642431 ) ( ON ?auto_642429 ?auto_642430 ) ( ON ?auto_642428 ?auto_642429 ) ( ON ?auto_642427 ?auto_642428 ) ( ON ?auto_642426 ?auto_642427 ) ( CLEAR ?auto_642424 ) ( ON ?auto_642425 ?auto_642426 ) ( CLEAR ?auto_642425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_642423 ?auto_642424 ?auto_642425 )
      ( MAKE-17PILE ?auto_642423 ?auto_642424 ?auto_642425 ?auto_642426 ?auto_642427 ?auto_642428 ?auto_642429 ?auto_642430 ?auto_642431 ?auto_642432 ?auto_642433 ?auto_642434 ?auto_642435 ?auto_642436 ?auto_642437 ?auto_642438 ?auto_642439 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_642458 - BLOCK
      ?auto_642459 - BLOCK
      ?auto_642460 - BLOCK
      ?auto_642461 - BLOCK
      ?auto_642462 - BLOCK
      ?auto_642463 - BLOCK
      ?auto_642464 - BLOCK
      ?auto_642465 - BLOCK
      ?auto_642466 - BLOCK
      ?auto_642467 - BLOCK
      ?auto_642468 - BLOCK
      ?auto_642469 - BLOCK
      ?auto_642470 - BLOCK
      ?auto_642471 - BLOCK
      ?auto_642472 - BLOCK
      ?auto_642473 - BLOCK
      ?auto_642474 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_642474 ) ( ON-TABLE ?auto_642458 ) ( ON ?auto_642459 ?auto_642458 ) ( not ( = ?auto_642458 ?auto_642459 ) ) ( not ( = ?auto_642458 ?auto_642460 ) ) ( not ( = ?auto_642458 ?auto_642461 ) ) ( not ( = ?auto_642458 ?auto_642462 ) ) ( not ( = ?auto_642458 ?auto_642463 ) ) ( not ( = ?auto_642458 ?auto_642464 ) ) ( not ( = ?auto_642458 ?auto_642465 ) ) ( not ( = ?auto_642458 ?auto_642466 ) ) ( not ( = ?auto_642458 ?auto_642467 ) ) ( not ( = ?auto_642458 ?auto_642468 ) ) ( not ( = ?auto_642458 ?auto_642469 ) ) ( not ( = ?auto_642458 ?auto_642470 ) ) ( not ( = ?auto_642458 ?auto_642471 ) ) ( not ( = ?auto_642458 ?auto_642472 ) ) ( not ( = ?auto_642458 ?auto_642473 ) ) ( not ( = ?auto_642458 ?auto_642474 ) ) ( not ( = ?auto_642459 ?auto_642460 ) ) ( not ( = ?auto_642459 ?auto_642461 ) ) ( not ( = ?auto_642459 ?auto_642462 ) ) ( not ( = ?auto_642459 ?auto_642463 ) ) ( not ( = ?auto_642459 ?auto_642464 ) ) ( not ( = ?auto_642459 ?auto_642465 ) ) ( not ( = ?auto_642459 ?auto_642466 ) ) ( not ( = ?auto_642459 ?auto_642467 ) ) ( not ( = ?auto_642459 ?auto_642468 ) ) ( not ( = ?auto_642459 ?auto_642469 ) ) ( not ( = ?auto_642459 ?auto_642470 ) ) ( not ( = ?auto_642459 ?auto_642471 ) ) ( not ( = ?auto_642459 ?auto_642472 ) ) ( not ( = ?auto_642459 ?auto_642473 ) ) ( not ( = ?auto_642459 ?auto_642474 ) ) ( not ( = ?auto_642460 ?auto_642461 ) ) ( not ( = ?auto_642460 ?auto_642462 ) ) ( not ( = ?auto_642460 ?auto_642463 ) ) ( not ( = ?auto_642460 ?auto_642464 ) ) ( not ( = ?auto_642460 ?auto_642465 ) ) ( not ( = ?auto_642460 ?auto_642466 ) ) ( not ( = ?auto_642460 ?auto_642467 ) ) ( not ( = ?auto_642460 ?auto_642468 ) ) ( not ( = ?auto_642460 ?auto_642469 ) ) ( not ( = ?auto_642460 ?auto_642470 ) ) ( not ( = ?auto_642460 ?auto_642471 ) ) ( not ( = ?auto_642460 ?auto_642472 ) ) ( not ( = ?auto_642460 ?auto_642473 ) ) ( not ( = ?auto_642460 ?auto_642474 ) ) ( not ( = ?auto_642461 ?auto_642462 ) ) ( not ( = ?auto_642461 ?auto_642463 ) ) ( not ( = ?auto_642461 ?auto_642464 ) ) ( not ( = ?auto_642461 ?auto_642465 ) ) ( not ( = ?auto_642461 ?auto_642466 ) ) ( not ( = ?auto_642461 ?auto_642467 ) ) ( not ( = ?auto_642461 ?auto_642468 ) ) ( not ( = ?auto_642461 ?auto_642469 ) ) ( not ( = ?auto_642461 ?auto_642470 ) ) ( not ( = ?auto_642461 ?auto_642471 ) ) ( not ( = ?auto_642461 ?auto_642472 ) ) ( not ( = ?auto_642461 ?auto_642473 ) ) ( not ( = ?auto_642461 ?auto_642474 ) ) ( not ( = ?auto_642462 ?auto_642463 ) ) ( not ( = ?auto_642462 ?auto_642464 ) ) ( not ( = ?auto_642462 ?auto_642465 ) ) ( not ( = ?auto_642462 ?auto_642466 ) ) ( not ( = ?auto_642462 ?auto_642467 ) ) ( not ( = ?auto_642462 ?auto_642468 ) ) ( not ( = ?auto_642462 ?auto_642469 ) ) ( not ( = ?auto_642462 ?auto_642470 ) ) ( not ( = ?auto_642462 ?auto_642471 ) ) ( not ( = ?auto_642462 ?auto_642472 ) ) ( not ( = ?auto_642462 ?auto_642473 ) ) ( not ( = ?auto_642462 ?auto_642474 ) ) ( not ( = ?auto_642463 ?auto_642464 ) ) ( not ( = ?auto_642463 ?auto_642465 ) ) ( not ( = ?auto_642463 ?auto_642466 ) ) ( not ( = ?auto_642463 ?auto_642467 ) ) ( not ( = ?auto_642463 ?auto_642468 ) ) ( not ( = ?auto_642463 ?auto_642469 ) ) ( not ( = ?auto_642463 ?auto_642470 ) ) ( not ( = ?auto_642463 ?auto_642471 ) ) ( not ( = ?auto_642463 ?auto_642472 ) ) ( not ( = ?auto_642463 ?auto_642473 ) ) ( not ( = ?auto_642463 ?auto_642474 ) ) ( not ( = ?auto_642464 ?auto_642465 ) ) ( not ( = ?auto_642464 ?auto_642466 ) ) ( not ( = ?auto_642464 ?auto_642467 ) ) ( not ( = ?auto_642464 ?auto_642468 ) ) ( not ( = ?auto_642464 ?auto_642469 ) ) ( not ( = ?auto_642464 ?auto_642470 ) ) ( not ( = ?auto_642464 ?auto_642471 ) ) ( not ( = ?auto_642464 ?auto_642472 ) ) ( not ( = ?auto_642464 ?auto_642473 ) ) ( not ( = ?auto_642464 ?auto_642474 ) ) ( not ( = ?auto_642465 ?auto_642466 ) ) ( not ( = ?auto_642465 ?auto_642467 ) ) ( not ( = ?auto_642465 ?auto_642468 ) ) ( not ( = ?auto_642465 ?auto_642469 ) ) ( not ( = ?auto_642465 ?auto_642470 ) ) ( not ( = ?auto_642465 ?auto_642471 ) ) ( not ( = ?auto_642465 ?auto_642472 ) ) ( not ( = ?auto_642465 ?auto_642473 ) ) ( not ( = ?auto_642465 ?auto_642474 ) ) ( not ( = ?auto_642466 ?auto_642467 ) ) ( not ( = ?auto_642466 ?auto_642468 ) ) ( not ( = ?auto_642466 ?auto_642469 ) ) ( not ( = ?auto_642466 ?auto_642470 ) ) ( not ( = ?auto_642466 ?auto_642471 ) ) ( not ( = ?auto_642466 ?auto_642472 ) ) ( not ( = ?auto_642466 ?auto_642473 ) ) ( not ( = ?auto_642466 ?auto_642474 ) ) ( not ( = ?auto_642467 ?auto_642468 ) ) ( not ( = ?auto_642467 ?auto_642469 ) ) ( not ( = ?auto_642467 ?auto_642470 ) ) ( not ( = ?auto_642467 ?auto_642471 ) ) ( not ( = ?auto_642467 ?auto_642472 ) ) ( not ( = ?auto_642467 ?auto_642473 ) ) ( not ( = ?auto_642467 ?auto_642474 ) ) ( not ( = ?auto_642468 ?auto_642469 ) ) ( not ( = ?auto_642468 ?auto_642470 ) ) ( not ( = ?auto_642468 ?auto_642471 ) ) ( not ( = ?auto_642468 ?auto_642472 ) ) ( not ( = ?auto_642468 ?auto_642473 ) ) ( not ( = ?auto_642468 ?auto_642474 ) ) ( not ( = ?auto_642469 ?auto_642470 ) ) ( not ( = ?auto_642469 ?auto_642471 ) ) ( not ( = ?auto_642469 ?auto_642472 ) ) ( not ( = ?auto_642469 ?auto_642473 ) ) ( not ( = ?auto_642469 ?auto_642474 ) ) ( not ( = ?auto_642470 ?auto_642471 ) ) ( not ( = ?auto_642470 ?auto_642472 ) ) ( not ( = ?auto_642470 ?auto_642473 ) ) ( not ( = ?auto_642470 ?auto_642474 ) ) ( not ( = ?auto_642471 ?auto_642472 ) ) ( not ( = ?auto_642471 ?auto_642473 ) ) ( not ( = ?auto_642471 ?auto_642474 ) ) ( not ( = ?auto_642472 ?auto_642473 ) ) ( not ( = ?auto_642472 ?auto_642474 ) ) ( not ( = ?auto_642473 ?auto_642474 ) ) ( ON ?auto_642473 ?auto_642474 ) ( ON ?auto_642472 ?auto_642473 ) ( ON ?auto_642471 ?auto_642472 ) ( ON ?auto_642470 ?auto_642471 ) ( ON ?auto_642469 ?auto_642470 ) ( ON ?auto_642468 ?auto_642469 ) ( ON ?auto_642467 ?auto_642468 ) ( ON ?auto_642466 ?auto_642467 ) ( ON ?auto_642465 ?auto_642466 ) ( ON ?auto_642464 ?auto_642465 ) ( ON ?auto_642463 ?auto_642464 ) ( ON ?auto_642462 ?auto_642463 ) ( ON ?auto_642461 ?auto_642462 ) ( CLEAR ?auto_642459 ) ( ON ?auto_642460 ?auto_642461 ) ( CLEAR ?auto_642460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_642458 ?auto_642459 ?auto_642460 )
      ( MAKE-17PILE ?auto_642458 ?auto_642459 ?auto_642460 ?auto_642461 ?auto_642462 ?auto_642463 ?auto_642464 ?auto_642465 ?auto_642466 ?auto_642467 ?auto_642468 ?auto_642469 ?auto_642470 ?auto_642471 ?auto_642472 ?auto_642473 ?auto_642474 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_642492 - BLOCK
      ?auto_642493 - BLOCK
      ?auto_642494 - BLOCK
      ?auto_642495 - BLOCK
      ?auto_642496 - BLOCK
      ?auto_642497 - BLOCK
      ?auto_642498 - BLOCK
      ?auto_642499 - BLOCK
      ?auto_642500 - BLOCK
      ?auto_642501 - BLOCK
      ?auto_642502 - BLOCK
      ?auto_642503 - BLOCK
      ?auto_642504 - BLOCK
      ?auto_642505 - BLOCK
      ?auto_642506 - BLOCK
      ?auto_642507 - BLOCK
      ?auto_642508 - BLOCK
    )
    :vars
    (
      ?auto_642509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_642508 ?auto_642509 ) ( ON-TABLE ?auto_642492 ) ( not ( = ?auto_642492 ?auto_642493 ) ) ( not ( = ?auto_642492 ?auto_642494 ) ) ( not ( = ?auto_642492 ?auto_642495 ) ) ( not ( = ?auto_642492 ?auto_642496 ) ) ( not ( = ?auto_642492 ?auto_642497 ) ) ( not ( = ?auto_642492 ?auto_642498 ) ) ( not ( = ?auto_642492 ?auto_642499 ) ) ( not ( = ?auto_642492 ?auto_642500 ) ) ( not ( = ?auto_642492 ?auto_642501 ) ) ( not ( = ?auto_642492 ?auto_642502 ) ) ( not ( = ?auto_642492 ?auto_642503 ) ) ( not ( = ?auto_642492 ?auto_642504 ) ) ( not ( = ?auto_642492 ?auto_642505 ) ) ( not ( = ?auto_642492 ?auto_642506 ) ) ( not ( = ?auto_642492 ?auto_642507 ) ) ( not ( = ?auto_642492 ?auto_642508 ) ) ( not ( = ?auto_642492 ?auto_642509 ) ) ( not ( = ?auto_642493 ?auto_642494 ) ) ( not ( = ?auto_642493 ?auto_642495 ) ) ( not ( = ?auto_642493 ?auto_642496 ) ) ( not ( = ?auto_642493 ?auto_642497 ) ) ( not ( = ?auto_642493 ?auto_642498 ) ) ( not ( = ?auto_642493 ?auto_642499 ) ) ( not ( = ?auto_642493 ?auto_642500 ) ) ( not ( = ?auto_642493 ?auto_642501 ) ) ( not ( = ?auto_642493 ?auto_642502 ) ) ( not ( = ?auto_642493 ?auto_642503 ) ) ( not ( = ?auto_642493 ?auto_642504 ) ) ( not ( = ?auto_642493 ?auto_642505 ) ) ( not ( = ?auto_642493 ?auto_642506 ) ) ( not ( = ?auto_642493 ?auto_642507 ) ) ( not ( = ?auto_642493 ?auto_642508 ) ) ( not ( = ?auto_642493 ?auto_642509 ) ) ( not ( = ?auto_642494 ?auto_642495 ) ) ( not ( = ?auto_642494 ?auto_642496 ) ) ( not ( = ?auto_642494 ?auto_642497 ) ) ( not ( = ?auto_642494 ?auto_642498 ) ) ( not ( = ?auto_642494 ?auto_642499 ) ) ( not ( = ?auto_642494 ?auto_642500 ) ) ( not ( = ?auto_642494 ?auto_642501 ) ) ( not ( = ?auto_642494 ?auto_642502 ) ) ( not ( = ?auto_642494 ?auto_642503 ) ) ( not ( = ?auto_642494 ?auto_642504 ) ) ( not ( = ?auto_642494 ?auto_642505 ) ) ( not ( = ?auto_642494 ?auto_642506 ) ) ( not ( = ?auto_642494 ?auto_642507 ) ) ( not ( = ?auto_642494 ?auto_642508 ) ) ( not ( = ?auto_642494 ?auto_642509 ) ) ( not ( = ?auto_642495 ?auto_642496 ) ) ( not ( = ?auto_642495 ?auto_642497 ) ) ( not ( = ?auto_642495 ?auto_642498 ) ) ( not ( = ?auto_642495 ?auto_642499 ) ) ( not ( = ?auto_642495 ?auto_642500 ) ) ( not ( = ?auto_642495 ?auto_642501 ) ) ( not ( = ?auto_642495 ?auto_642502 ) ) ( not ( = ?auto_642495 ?auto_642503 ) ) ( not ( = ?auto_642495 ?auto_642504 ) ) ( not ( = ?auto_642495 ?auto_642505 ) ) ( not ( = ?auto_642495 ?auto_642506 ) ) ( not ( = ?auto_642495 ?auto_642507 ) ) ( not ( = ?auto_642495 ?auto_642508 ) ) ( not ( = ?auto_642495 ?auto_642509 ) ) ( not ( = ?auto_642496 ?auto_642497 ) ) ( not ( = ?auto_642496 ?auto_642498 ) ) ( not ( = ?auto_642496 ?auto_642499 ) ) ( not ( = ?auto_642496 ?auto_642500 ) ) ( not ( = ?auto_642496 ?auto_642501 ) ) ( not ( = ?auto_642496 ?auto_642502 ) ) ( not ( = ?auto_642496 ?auto_642503 ) ) ( not ( = ?auto_642496 ?auto_642504 ) ) ( not ( = ?auto_642496 ?auto_642505 ) ) ( not ( = ?auto_642496 ?auto_642506 ) ) ( not ( = ?auto_642496 ?auto_642507 ) ) ( not ( = ?auto_642496 ?auto_642508 ) ) ( not ( = ?auto_642496 ?auto_642509 ) ) ( not ( = ?auto_642497 ?auto_642498 ) ) ( not ( = ?auto_642497 ?auto_642499 ) ) ( not ( = ?auto_642497 ?auto_642500 ) ) ( not ( = ?auto_642497 ?auto_642501 ) ) ( not ( = ?auto_642497 ?auto_642502 ) ) ( not ( = ?auto_642497 ?auto_642503 ) ) ( not ( = ?auto_642497 ?auto_642504 ) ) ( not ( = ?auto_642497 ?auto_642505 ) ) ( not ( = ?auto_642497 ?auto_642506 ) ) ( not ( = ?auto_642497 ?auto_642507 ) ) ( not ( = ?auto_642497 ?auto_642508 ) ) ( not ( = ?auto_642497 ?auto_642509 ) ) ( not ( = ?auto_642498 ?auto_642499 ) ) ( not ( = ?auto_642498 ?auto_642500 ) ) ( not ( = ?auto_642498 ?auto_642501 ) ) ( not ( = ?auto_642498 ?auto_642502 ) ) ( not ( = ?auto_642498 ?auto_642503 ) ) ( not ( = ?auto_642498 ?auto_642504 ) ) ( not ( = ?auto_642498 ?auto_642505 ) ) ( not ( = ?auto_642498 ?auto_642506 ) ) ( not ( = ?auto_642498 ?auto_642507 ) ) ( not ( = ?auto_642498 ?auto_642508 ) ) ( not ( = ?auto_642498 ?auto_642509 ) ) ( not ( = ?auto_642499 ?auto_642500 ) ) ( not ( = ?auto_642499 ?auto_642501 ) ) ( not ( = ?auto_642499 ?auto_642502 ) ) ( not ( = ?auto_642499 ?auto_642503 ) ) ( not ( = ?auto_642499 ?auto_642504 ) ) ( not ( = ?auto_642499 ?auto_642505 ) ) ( not ( = ?auto_642499 ?auto_642506 ) ) ( not ( = ?auto_642499 ?auto_642507 ) ) ( not ( = ?auto_642499 ?auto_642508 ) ) ( not ( = ?auto_642499 ?auto_642509 ) ) ( not ( = ?auto_642500 ?auto_642501 ) ) ( not ( = ?auto_642500 ?auto_642502 ) ) ( not ( = ?auto_642500 ?auto_642503 ) ) ( not ( = ?auto_642500 ?auto_642504 ) ) ( not ( = ?auto_642500 ?auto_642505 ) ) ( not ( = ?auto_642500 ?auto_642506 ) ) ( not ( = ?auto_642500 ?auto_642507 ) ) ( not ( = ?auto_642500 ?auto_642508 ) ) ( not ( = ?auto_642500 ?auto_642509 ) ) ( not ( = ?auto_642501 ?auto_642502 ) ) ( not ( = ?auto_642501 ?auto_642503 ) ) ( not ( = ?auto_642501 ?auto_642504 ) ) ( not ( = ?auto_642501 ?auto_642505 ) ) ( not ( = ?auto_642501 ?auto_642506 ) ) ( not ( = ?auto_642501 ?auto_642507 ) ) ( not ( = ?auto_642501 ?auto_642508 ) ) ( not ( = ?auto_642501 ?auto_642509 ) ) ( not ( = ?auto_642502 ?auto_642503 ) ) ( not ( = ?auto_642502 ?auto_642504 ) ) ( not ( = ?auto_642502 ?auto_642505 ) ) ( not ( = ?auto_642502 ?auto_642506 ) ) ( not ( = ?auto_642502 ?auto_642507 ) ) ( not ( = ?auto_642502 ?auto_642508 ) ) ( not ( = ?auto_642502 ?auto_642509 ) ) ( not ( = ?auto_642503 ?auto_642504 ) ) ( not ( = ?auto_642503 ?auto_642505 ) ) ( not ( = ?auto_642503 ?auto_642506 ) ) ( not ( = ?auto_642503 ?auto_642507 ) ) ( not ( = ?auto_642503 ?auto_642508 ) ) ( not ( = ?auto_642503 ?auto_642509 ) ) ( not ( = ?auto_642504 ?auto_642505 ) ) ( not ( = ?auto_642504 ?auto_642506 ) ) ( not ( = ?auto_642504 ?auto_642507 ) ) ( not ( = ?auto_642504 ?auto_642508 ) ) ( not ( = ?auto_642504 ?auto_642509 ) ) ( not ( = ?auto_642505 ?auto_642506 ) ) ( not ( = ?auto_642505 ?auto_642507 ) ) ( not ( = ?auto_642505 ?auto_642508 ) ) ( not ( = ?auto_642505 ?auto_642509 ) ) ( not ( = ?auto_642506 ?auto_642507 ) ) ( not ( = ?auto_642506 ?auto_642508 ) ) ( not ( = ?auto_642506 ?auto_642509 ) ) ( not ( = ?auto_642507 ?auto_642508 ) ) ( not ( = ?auto_642507 ?auto_642509 ) ) ( not ( = ?auto_642508 ?auto_642509 ) ) ( ON ?auto_642507 ?auto_642508 ) ( ON ?auto_642506 ?auto_642507 ) ( ON ?auto_642505 ?auto_642506 ) ( ON ?auto_642504 ?auto_642505 ) ( ON ?auto_642503 ?auto_642504 ) ( ON ?auto_642502 ?auto_642503 ) ( ON ?auto_642501 ?auto_642502 ) ( ON ?auto_642500 ?auto_642501 ) ( ON ?auto_642499 ?auto_642500 ) ( ON ?auto_642498 ?auto_642499 ) ( ON ?auto_642497 ?auto_642498 ) ( ON ?auto_642496 ?auto_642497 ) ( ON ?auto_642495 ?auto_642496 ) ( ON ?auto_642494 ?auto_642495 ) ( CLEAR ?auto_642492 ) ( ON ?auto_642493 ?auto_642494 ) ( CLEAR ?auto_642493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_642492 ?auto_642493 )
      ( MAKE-17PILE ?auto_642492 ?auto_642493 ?auto_642494 ?auto_642495 ?auto_642496 ?auto_642497 ?auto_642498 ?auto_642499 ?auto_642500 ?auto_642501 ?auto_642502 ?auto_642503 ?auto_642504 ?auto_642505 ?auto_642506 ?auto_642507 ?auto_642508 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_642527 - BLOCK
      ?auto_642528 - BLOCK
      ?auto_642529 - BLOCK
      ?auto_642530 - BLOCK
      ?auto_642531 - BLOCK
      ?auto_642532 - BLOCK
      ?auto_642533 - BLOCK
      ?auto_642534 - BLOCK
      ?auto_642535 - BLOCK
      ?auto_642536 - BLOCK
      ?auto_642537 - BLOCK
      ?auto_642538 - BLOCK
      ?auto_642539 - BLOCK
      ?auto_642540 - BLOCK
      ?auto_642541 - BLOCK
      ?auto_642542 - BLOCK
      ?auto_642543 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_642543 ) ( ON-TABLE ?auto_642527 ) ( not ( = ?auto_642527 ?auto_642528 ) ) ( not ( = ?auto_642527 ?auto_642529 ) ) ( not ( = ?auto_642527 ?auto_642530 ) ) ( not ( = ?auto_642527 ?auto_642531 ) ) ( not ( = ?auto_642527 ?auto_642532 ) ) ( not ( = ?auto_642527 ?auto_642533 ) ) ( not ( = ?auto_642527 ?auto_642534 ) ) ( not ( = ?auto_642527 ?auto_642535 ) ) ( not ( = ?auto_642527 ?auto_642536 ) ) ( not ( = ?auto_642527 ?auto_642537 ) ) ( not ( = ?auto_642527 ?auto_642538 ) ) ( not ( = ?auto_642527 ?auto_642539 ) ) ( not ( = ?auto_642527 ?auto_642540 ) ) ( not ( = ?auto_642527 ?auto_642541 ) ) ( not ( = ?auto_642527 ?auto_642542 ) ) ( not ( = ?auto_642527 ?auto_642543 ) ) ( not ( = ?auto_642528 ?auto_642529 ) ) ( not ( = ?auto_642528 ?auto_642530 ) ) ( not ( = ?auto_642528 ?auto_642531 ) ) ( not ( = ?auto_642528 ?auto_642532 ) ) ( not ( = ?auto_642528 ?auto_642533 ) ) ( not ( = ?auto_642528 ?auto_642534 ) ) ( not ( = ?auto_642528 ?auto_642535 ) ) ( not ( = ?auto_642528 ?auto_642536 ) ) ( not ( = ?auto_642528 ?auto_642537 ) ) ( not ( = ?auto_642528 ?auto_642538 ) ) ( not ( = ?auto_642528 ?auto_642539 ) ) ( not ( = ?auto_642528 ?auto_642540 ) ) ( not ( = ?auto_642528 ?auto_642541 ) ) ( not ( = ?auto_642528 ?auto_642542 ) ) ( not ( = ?auto_642528 ?auto_642543 ) ) ( not ( = ?auto_642529 ?auto_642530 ) ) ( not ( = ?auto_642529 ?auto_642531 ) ) ( not ( = ?auto_642529 ?auto_642532 ) ) ( not ( = ?auto_642529 ?auto_642533 ) ) ( not ( = ?auto_642529 ?auto_642534 ) ) ( not ( = ?auto_642529 ?auto_642535 ) ) ( not ( = ?auto_642529 ?auto_642536 ) ) ( not ( = ?auto_642529 ?auto_642537 ) ) ( not ( = ?auto_642529 ?auto_642538 ) ) ( not ( = ?auto_642529 ?auto_642539 ) ) ( not ( = ?auto_642529 ?auto_642540 ) ) ( not ( = ?auto_642529 ?auto_642541 ) ) ( not ( = ?auto_642529 ?auto_642542 ) ) ( not ( = ?auto_642529 ?auto_642543 ) ) ( not ( = ?auto_642530 ?auto_642531 ) ) ( not ( = ?auto_642530 ?auto_642532 ) ) ( not ( = ?auto_642530 ?auto_642533 ) ) ( not ( = ?auto_642530 ?auto_642534 ) ) ( not ( = ?auto_642530 ?auto_642535 ) ) ( not ( = ?auto_642530 ?auto_642536 ) ) ( not ( = ?auto_642530 ?auto_642537 ) ) ( not ( = ?auto_642530 ?auto_642538 ) ) ( not ( = ?auto_642530 ?auto_642539 ) ) ( not ( = ?auto_642530 ?auto_642540 ) ) ( not ( = ?auto_642530 ?auto_642541 ) ) ( not ( = ?auto_642530 ?auto_642542 ) ) ( not ( = ?auto_642530 ?auto_642543 ) ) ( not ( = ?auto_642531 ?auto_642532 ) ) ( not ( = ?auto_642531 ?auto_642533 ) ) ( not ( = ?auto_642531 ?auto_642534 ) ) ( not ( = ?auto_642531 ?auto_642535 ) ) ( not ( = ?auto_642531 ?auto_642536 ) ) ( not ( = ?auto_642531 ?auto_642537 ) ) ( not ( = ?auto_642531 ?auto_642538 ) ) ( not ( = ?auto_642531 ?auto_642539 ) ) ( not ( = ?auto_642531 ?auto_642540 ) ) ( not ( = ?auto_642531 ?auto_642541 ) ) ( not ( = ?auto_642531 ?auto_642542 ) ) ( not ( = ?auto_642531 ?auto_642543 ) ) ( not ( = ?auto_642532 ?auto_642533 ) ) ( not ( = ?auto_642532 ?auto_642534 ) ) ( not ( = ?auto_642532 ?auto_642535 ) ) ( not ( = ?auto_642532 ?auto_642536 ) ) ( not ( = ?auto_642532 ?auto_642537 ) ) ( not ( = ?auto_642532 ?auto_642538 ) ) ( not ( = ?auto_642532 ?auto_642539 ) ) ( not ( = ?auto_642532 ?auto_642540 ) ) ( not ( = ?auto_642532 ?auto_642541 ) ) ( not ( = ?auto_642532 ?auto_642542 ) ) ( not ( = ?auto_642532 ?auto_642543 ) ) ( not ( = ?auto_642533 ?auto_642534 ) ) ( not ( = ?auto_642533 ?auto_642535 ) ) ( not ( = ?auto_642533 ?auto_642536 ) ) ( not ( = ?auto_642533 ?auto_642537 ) ) ( not ( = ?auto_642533 ?auto_642538 ) ) ( not ( = ?auto_642533 ?auto_642539 ) ) ( not ( = ?auto_642533 ?auto_642540 ) ) ( not ( = ?auto_642533 ?auto_642541 ) ) ( not ( = ?auto_642533 ?auto_642542 ) ) ( not ( = ?auto_642533 ?auto_642543 ) ) ( not ( = ?auto_642534 ?auto_642535 ) ) ( not ( = ?auto_642534 ?auto_642536 ) ) ( not ( = ?auto_642534 ?auto_642537 ) ) ( not ( = ?auto_642534 ?auto_642538 ) ) ( not ( = ?auto_642534 ?auto_642539 ) ) ( not ( = ?auto_642534 ?auto_642540 ) ) ( not ( = ?auto_642534 ?auto_642541 ) ) ( not ( = ?auto_642534 ?auto_642542 ) ) ( not ( = ?auto_642534 ?auto_642543 ) ) ( not ( = ?auto_642535 ?auto_642536 ) ) ( not ( = ?auto_642535 ?auto_642537 ) ) ( not ( = ?auto_642535 ?auto_642538 ) ) ( not ( = ?auto_642535 ?auto_642539 ) ) ( not ( = ?auto_642535 ?auto_642540 ) ) ( not ( = ?auto_642535 ?auto_642541 ) ) ( not ( = ?auto_642535 ?auto_642542 ) ) ( not ( = ?auto_642535 ?auto_642543 ) ) ( not ( = ?auto_642536 ?auto_642537 ) ) ( not ( = ?auto_642536 ?auto_642538 ) ) ( not ( = ?auto_642536 ?auto_642539 ) ) ( not ( = ?auto_642536 ?auto_642540 ) ) ( not ( = ?auto_642536 ?auto_642541 ) ) ( not ( = ?auto_642536 ?auto_642542 ) ) ( not ( = ?auto_642536 ?auto_642543 ) ) ( not ( = ?auto_642537 ?auto_642538 ) ) ( not ( = ?auto_642537 ?auto_642539 ) ) ( not ( = ?auto_642537 ?auto_642540 ) ) ( not ( = ?auto_642537 ?auto_642541 ) ) ( not ( = ?auto_642537 ?auto_642542 ) ) ( not ( = ?auto_642537 ?auto_642543 ) ) ( not ( = ?auto_642538 ?auto_642539 ) ) ( not ( = ?auto_642538 ?auto_642540 ) ) ( not ( = ?auto_642538 ?auto_642541 ) ) ( not ( = ?auto_642538 ?auto_642542 ) ) ( not ( = ?auto_642538 ?auto_642543 ) ) ( not ( = ?auto_642539 ?auto_642540 ) ) ( not ( = ?auto_642539 ?auto_642541 ) ) ( not ( = ?auto_642539 ?auto_642542 ) ) ( not ( = ?auto_642539 ?auto_642543 ) ) ( not ( = ?auto_642540 ?auto_642541 ) ) ( not ( = ?auto_642540 ?auto_642542 ) ) ( not ( = ?auto_642540 ?auto_642543 ) ) ( not ( = ?auto_642541 ?auto_642542 ) ) ( not ( = ?auto_642541 ?auto_642543 ) ) ( not ( = ?auto_642542 ?auto_642543 ) ) ( ON ?auto_642542 ?auto_642543 ) ( ON ?auto_642541 ?auto_642542 ) ( ON ?auto_642540 ?auto_642541 ) ( ON ?auto_642539 ?auto_642540 ) ( ON ?auto_642538 ?auto_642539 ) ( ON ?auto_642537 ?auto_642538 ) ( ON ?auto_642536 ?auto_642537 ) ( ON ?auto_642535 ?auto_642536 ) ( ON ?auto_642534 ?auto_642535 ) ( ON ?auto_642533 ?auto_642534 ) ( ON ?auto_642532 ?auto_642533 ) ( ON ?auto_642531 ?auto_642532 ) ( ON ?auto_642530 ?auto_642531 ) ( ON ?auto_642529 ?auto_642530 ) ( CLEAR ?auto_642527 ) ( ON ?auto_642528 ?auto_642529 ) ( CLEAR ?auto_642528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_642527 ?auto_642528 )
      ( MAKE-17PILE ?auto_642527 ?auto_642528 ?auto_642529 ?auto_642530 ?auto_642531 ?auto_642532 ?auto_642533 ?auto_642534 ?auto_642535 ?auto_642536 ?auto_642537 ?auto_642538 ?auto_642539 ?auto_642540 ?auto_642541 ?auto_642542 ?auto_642543 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_642561 - BLOCK
      ?auto_642562 - BLOCK
      ?auto_642563 - BLOCK
      ?auto_642564 - BLOCK
      ?auto_642565 - BLOCK
      ?auto_642566 - BLOCK
      ?auto_642567 - BLOCK
      ?auto_642568 - BLOCK
      ?auto_642569 - BLOCK
      ?auto_642570 - BLOCK
      ?auto_642571 - BLOCK
      ?auto_642572 - BLOCK
      ?auto_642573 - BLOCK
      ?auto_642574 - BLOCK
      ?auto_642575 - BLOCK
      ?auto_642576 - BLOCK
      ?auto_642577 - BLOCK
    )
    :vars
    (
      ?auto_642578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_642577 ?auto_642578 ) ( not ( = ?auto_642561 ?auto_642562 ) ) ( not ( = ?auto_642561 ?auto_642563 ) ) ( not ( = ?auto_642561 ?auto_642564 ) ) ( not ( = ?auto_642561 ?auto_642565 ) ) ( not ( = ?auto_642561 ?auto_642566 ) ) ( not ( = ?auto_642561 ?auto_642567 ) ) ( not ( = ?auto_642561 ?auto_642568 ) ) ( not ( = ?auto_642561 ?auto_642569 ) ) ( not ( = ?auto_642561 ?auto_642570 ) ) ( not ( = ?auto_642561 ?auto_642571 ) ) ( not ( = ?auto_642561 ?auto_642572 ) ) ( not ( = ?auto_642561 ?auto_642573 ) ) ( not ( = ?auto_642561 ?auto_642574 ) ) ( not ( = ?auto_642561 ?auto_642575 ) ) ( not ( = ?auto_642561 ?auto_642576 ) ) ( not ( = ?auto_642561 ?auto_642577 ) ) ( not ( = ?auto_642561 ?auto_642578 ) ) ( not ( = ?auto_642562 ?auto_642563 ) ) ( not ( = ?auto_642562 ?auto_642564 ) ) ( not ( = ?auto_642562 ?auto_642565 ) ) ( not ( = ?auto_642562 ?auto_642566 ) ) ( not ( = ?auto_642562 ?auto_642567 ) ) ( not ( = ?auto_642562 ?auto_642568 ) ) ( not ( = ?auto_642562 ?auto_642569 ) ) ( not ( = ?auto_642562 ?auto_642570 ) ) ( not ( = ?auto_642562 ?auto_642571 ) ) ( not ( = ?auto_642562 ?auto_642572 ) ) ( not ( = ?auto_642562 ?auto_642573 ) ) ( not ( = ?auto_642562 ?auto_642574 ) ) ( not ( = ?auto_642562 ?auto_642575 ) ) ( not ( = ?auto_642562 ?auto_642576 ) ) ( not ( = ?auto_642562 ?auto_642577 ) ) ( not ( = ?auto_642562 ?auto_642578 ) ) ( not ( = ?auto_642563 ?auto_642564 ) ) ( not ( = ?auto_642563 ?auto_642565 ) ) ( not ( = ?auto_642563 ?auto_642566 ) ) ( not ( = ?auto_642563 ?auto_642567 ) ) ( not ( = ?auto_642563 ?auto_642568 ) ) ( not ( = ?auto_642563 ?auto_642569 ) ) ( not ( = ?auto_642563 ?auto_642570 ) ) ( not ( = ?auto_642563 ?auto_642571 ) ) ( not ( = ?auto_642563 ?auto_642572 ) ) ( not ( = ?auto_642563 ?auto_642573 ) ) ( not ( = ?auto_642563 ?auto_642574 ) ) ( not ( = ?auto_642563 ?auto_642575 ) ) ( not ( = ?auto_642563 ?auto_642576 ) ) ( not ( = ?auto_642563 ?auto_642577 ) ) ( not ( = ?auto_642563 ?auto_642578 ) ) ( not ( = ?auto_642564 ?auto_642565 ) ) ( not ( = ?auto_642564 ?auto_642566 ) ) ( not ( = ?auto_642564 ?auto_642567 ) ) ( not ( = ?auto_642564 ?auto_642568 ) ) ( not ( = ?auto_642564 ?auto_642569 ) ) ( not ( = ?auto_642564 ?auto_642570 ) ) ( not ( = ?auto_642564 ?auto_642571 ) ) ( not ( = ?auto_642564 ?auto_642572 ) ) ( not ( = ?auto_642564 ?auto_642573 ) ) ( not ( = ?auto_642564 ?auto_642574 ) ) ( not ( = ?auto_642564 ?auto_642575 ) ) ( not ( = ?auto_642564 ?auto_642576 ) ) ( not ( = ?auto_642564 ?auto_642577 ) ) ( not ( = ?auto_642564 ?auto_642578 ) ) ( not ( = ?auto_642565 ?auto_642566 ) ) ( not ( = ?auto_642565 ?auto_642567 ) ) ( not ( = ?auto_642565 ?auto_642568 ) ) ( not ( = ?auto_642565 ?auto_642569 ) ) ( not ( = ?auto_642565 ?auto_642570 ) ) ( not ( = ?auto_642565 ?auto_642571 ) ) ( not ( = ?auto_642565 ?auto_642572 ) ) ( not ( = ?auto_642565 ?auto_642573 ) ) ( not ( = ?auto_642565 ?auto_642574 ) ) ( not ( = ?auto_642565 ?auto_642575 ) ) ( not ( = ?auto_642565 ?auto_642576 ) ) ( not ( = ?auto_642565 ?auto_642577 ) ) ( not ( = ?auto_642565 ?auto_642578 ) ) ( not ( = ?auto_642566 ?auto_642567 ) ) ( not ( = ?auto_642566 ?auto_642568 ) ) ( not ( = ?auto_642566 ?auto_642569 ) ) ( not ( = ?auto_642566 ?auto_642570 ) ) ( not ( = ?auto_642566 ?auto_642571 ) ) ( not ( = ?auto_642566 ?auto_642572 ) ) ( not ( = ?auto_642566 ?auto_642573 ) ) ( not ( = ?auto_642566 ?auto_642574 ) ) ( not ( = ?auto_642566 ?auto_642575 ) ) ( not ( = ?auto_642566 ?auto_642576 ) ) ( not ( = ?auto_642566 ?auto_642577 ) ) ( not ( = ?auto_642566 ?auto_642578 ) ) ( not ( = ?auto_642567 ?auto_642568 ) ) ( not ( = ?auto_642567 ?auto_642569 ) ) ( not ( = ?auto_642567 ?auto_642570 ) ) ( not ( = ?auto_642567 ?auto_642571 ) ) ( not ( = ?auto_642567 ?auto_642572 ) ) ( not ( = ?auto_642567 ?auto_642573 ) ) ( not ( = ?auto_642567 ?auto_642574 ) ) ( not ( = ?auto_642567 ?auto_642575 ) ) ( not ( = ?auto_642567 ?auto_642576 ) ) ( not ( = ?auto_642567 ?auto_642577 ) ) ( not ( = ?auto_642567 ?auto_642578 ) ) ( not ( = ?auto_642568 ?auto_642569 ) ) ( not ( = ?auto_642568 ?auto_642570 ) ) ( not ( = ?auto_642568 ?auto_642571 ) ) ( not ( = ?auto_642568 ?auto_642572 ) ) ( not ( = ?auto_642568 ?auto_642573 ) ) ( not ( = ?auto_642568 ?auto_642574 ) ) ( not ( = ?auto_642568 ?auto_642575 ) ) ( not ( = ?auto_642568 ?auto_642576 ) ) ( not ( = ?auto_642568 ?auto_642577 ) ) ( not ( = ?auto_642568 ?auto_642578 ) ) ( not ( = ?auto_642569 ?auto_642570 ) ) ( not ( = ?auto_642569 ?auto_642571 ) ) ( not ( = ?auto_642569 ?auto_642572 ) ) ( not ( = ?auto_642569 ?auto_642573 ) ) ( not ( = ?auto_642569 ?auto_642574 ) ) ( not ( = ?auto_642569 ?auto_642575 ) ) ( not ( = ?auto_642569 ?auto_642576 ) ) ( not ( = ?auto_642569 ?auto_642577 ) ) ( not ( = ?auto_642569 ?auto_642578 ) ) ( not ( = ?auto_642570 ?auto_642571 ) ) ( not ( = ?auto_642570 ?auto_642572 ) ) ( not ( = ?auto_642570 ?auto_642573 ) ) ( not ( = ?auto_642570 ?auto_642574 ) ) ( not ( = ?auto_642570 ?auto_642575 ) ) ( not ( = ?auto_642570 ?auto_642576 ) ) ( not ( = ?auto_642570 ?auto_642577 ) ) ( not ( = ?auto_642570 ?auto_642578 ) ) ( not ( = ?auto_642571 ?auto_642572 ) ) ( not ( = ?auto_642571 ?auto_642573 ) ) ( not ( = ?auto_642571 ?auto_642574 ) ) ( not ( = ?auto_642571 ?auto_642575 ) ) ( not ( = ?auto_642571 ?auto_642576 ) ) ( not ( = ?auto_642571 ?auto_642577 ) ) ( not ( = ?auto_642571 ?auto_642578 ) ) ( not ( = ?auto_642572 ?auto_642573 ) ) ( not ( = ?auto_642572 ?auto_642574 ) ) ( not ( = ?auto_642572 ?auto_642575 ) ) ( not ( = ?auto_642572 ?auto_642576 ) ) ( not ( = ?auto_642572 ?auto_642577 ) ) ( not ( = ?auto_642572 ?auto_642578 ) ) ( not ( = ?auto_642573 ?auto_642574 ) ) ( not ( = ?auto_642573 ?auto_642575 ) ) ( not ( = ?auto_642573 ?auto_642576 ) ) ( not ( = ?auto_642573 ?auto_642577 ) ) ( not ( = ?auto_642573 ?auto_642578 ) ) ( not ( = ?auto_642574 ?auto_642575 ) ) ( not ( = ?auto_642574 ?auto_642576 ) ) ( not ( = ?auto_642574 ?auto_642577 ) ) ( not ( = ?auto_642574 ?auto_642578 ) ) ( not ( = ?auto_642575 ?auto_642576 ) ) ( not ( = ?auto_642575 ?auto_642577 ) ) ( not ( = ?auto_642575 ?auto_642578 ) ) ( not ( = ?auto_642576 ?auto_642577 ) ) ( not ( = ?auto_642576 ?auto_642578 ) ) ( not ( = ?auto_642577 ?auto_642578 ) ) ( ON ?auto_642576 ?auto_642577 ) ( ON ?auto_642575 ?auto_642576 ) ( ON ?auto_642574 ?auto_642575 ) ( ON ?auto_642573 ?auto_642574 ) ( ON ?auto_642572 ?auto_642573 ) ( ON ?auto_642571 ?auto_642572 ) ( ON ?auto_642570 ?auto_642571 ) ( ON ?auto_642569 ?auto_642570 ) ( ON ?auto_642568 ?auto_642569 ) ( ON ?auto_642567 ?auto_642568 ) ( ON ?auto_642566 ?auto_642567 ) ( ON ?auto_642565 ?auto_642566 ) ( ON ?auto_642564 ?auto_642565 ) ( ON ?auto_642563 ?auto_642564 ) ( ON ?auto_642562 ?auto_642563 ) ( ON ?auto_642561 ?auto_642562 ) ( CLEAR ?auto_642561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_642561 )
      ( MAKE-17PILE ?auto_642561 ?auto_642562 ?auto_642563 ?auto_642564 ?auto_642565 ?auto_642566 ?auto_642567 ?auto_642568 ?auto_642569 ?auto_642570 ?auto_642571 ?auto_642572 ?auto_642573 ?auto_642574 ?auto_642575 ?auto_642576 ?auto_642577 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_642596 - BLOCK
      ?auto_642597 - BLOCK
      ?auto_642598 - BLOCK
      ?auto_642599 - BLOCK
      ?auto_642600 - BLOCK
      ?auto_642601 - BLOCK
      ?auto_642602 - BLOCK
      ?auto_642603 - BLOCK
      ?auto_642604 - BLOCK
      ?auto_642605 - BLOCK
      ?auto_642606 - BLOCK
      ?auto_642607 - BLOCK
      ?auto_642608 - BLOCK
      ?auto_642609 - BLOCK
      ?auto_642610 - BLOCK
      ?auto_642611 - BLOCK
      ?auto_642612 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_642612 ) ( not ( = ?auto_642596 ?auto_642597 ) ) ( not ( = ?auto_642596 ?auto_642598 ) ) ( not ( = ?auto_642596 ?auto_642599 ) ) ( not ( = ?auto_642596 ?auto_642600 ) ) ( not ( = ?auto_642596 ?auto_642601 ) ) ( not ( = ?auto_642596 ?auto_642602 ) ) ( not ( = ?auto_642596 ?auto_642603 ) ) ( not ( = ?auto_642596 ?auto_642604 ) ) ( not ( = ?auto_642596 ?auto_642605 ) ) ( not ( = ?auto_642596 ?auto_642606 ) ) ( not ( = ?auto_642596 ?auto_642607 ) ) ( not ( = ?auto_642596 ?auto_642608 ) ) ( not ( = ?auto_642596 ?auto_642609 ) ) ( not ( = ?auto_642596 ?auto_642610 ) ) ( not ( = ?auto_642596 ?auto_642611 ) ) ( not ( = ?auto_642596 ?auto_642612 ) ) ( not ( = ?auto_642597 ?auto_642598 ) ) ( not ( = ?auto_642597 ?auto_642599 ) ) ( not ( = ?auto_642597 ?auto_642600 ) ) ( not ( = ?auto_642597 ?auto_642601 ) ) ( not ( = ?auto_642597 ?auto_642602 ) ) ( not ( = ?auto_642597 ?auto_642603 ) ) ( not ( = ?auto_642597 ?auto_642604 ) ) ( not ( = ?auto_642597 ?auto_642605 ) ) ( not ( = ?auto_642597 ?auto_642606 ) ) ( not ( = ?auto_642597 ?auto_642607 ) ) ( not ( = ?auto_642597 ?auto_642608 ) ) ( not ( = ?auto_642597 ?auto_642609 ) ) ( not ( = ?auto_642597 ?auto_642610 ) ) ( not ( = ?auto_642597 ?auto_642611 ) ) ( not ( = ?auto_642597 ?auto_642612 ) ) ( not ( = ?auto_642598 ?auto_642599 ) ) ( not ( = ?auto_642598 ?auto_642600 ) ) ( not ( = ?auto_642598 ?auto_642601 ) ) ( not ( = ?auto_642598 ?auto_642602 ) ) ( not ( = ?auto_642598 ?auto_642603 ) ) ( not ( = ?auto_642598 ?auto_642604 ) ) ( not ( = ?auto_642598 ?auto_642605 ) ) ( not ( = ?auto_642598 ?auto_642606 ) ) ( not ( = ?auto_642598 ?auto_642607 ) ) ( not ( = ?auto_642598 ?auto_642608 ) ) ( not ( = ?auto_642598 ?auto_642609 ) ) ( not ( = ?auto_642598 ?auto_642610 ) ) ( not ( = ?auto_642598 ?auto_642611 ) ) ( not ( = ?auto_642598 ?auto_642612 ) ) ( not ( = ?auto_642599 ?auto_642600 ) ) ( not ( = ?auto_642599 ?auto_642601 ) ) ( not ( = ?auto_642599 ?auto_642602 ) ) ( not ( = ?auto_642599 ?auto_642603 ) ) ( not ( = ?auto_642599 ?auto_642604 ) ) ( not ( = ?auto_642599 ?auto_642605 ) ) ( not ( = ?auto_642599 ?auto_642606 ) ) ( not ( = ?auto_642599 ?auto_642607 ) ) ( not ( = ?auto_642599 ?auto_642608 ) ) ( not ( = ?auto_642599 ?auto_642609 ) ) ( not ( = ?auto_642599 ?auto_642610 ) ) ( not ( = ?auto_642599 ?auto_642611 ) ) ( not ( = ?auto_642599 ?auto_642612 ) ) ( not ( = ?auto_642600 ?auto_642601 ) ) ( not ( = ?auto_642600 ?auto_642602 ) ) ( not ( = ?auto_642600 ?auto_642603 ) ) ( not ( = ?auto_642600 ?auto_642604 ) ) ( not ( = ?auto_642600 ?auto_642605 ) ) ( not ( = ?auto_642600 ?auto_642606 ) ) ( not ( = ?auto_642600 ?auto_642607 ) ) ( not ( = ?auto_642600 ?auto_642608 ) ) ( not ( = ?auto_642600 ?auto_642609 ) ) ( not ( = ?auto_642600 ?auto_642610 ) ) ( not ( = ?auto_642600 ?auto_642611 ) ) ( not ( = ?auto_642600 ?auto_642612 ) ) ( not ( = ?auto_642601 ?auto_642602 ) ) ( not ( = ?auto_642601 ?auto_642603 ) ) ( not ( = ?auto_642601 ?auto_642604 ) ) ( not ( = ?auto_642601 ?auto_642605 ) ) ( not ( = ?auto_642601 ?auto_642606 ) ) ( not ( = ?auto_642601 ?auto_642607 ) ) ( not ( = ?auto_642601 ?auto_642608 ) ) ( not ( = ?auto_642601 ?auto_642609 ) ) ( not ( = ?auto_642601 ?auto_642610 ) ) ( not ( = ?auto_642601 ?auto_642611 ) ) ( not ( = ?auto_642601 ?auto_642612 ) ) ( not ( = ?auto_642602 ?auto_642603 ) ) ( not ( = ?auto_642602 ?auto_642604 ) ) ( not ( = ?auto_642602 ?auto_642605 ) ) ( not ( = ?auto_642602 ?auto_642606 ) ) ( not ( = ?auto_642602 ?auto_642607 ) ) ( not ( = ?auto_642602 ?auto_642608 ) ) ( not ( = ?auto_642602 ?auto_642609 ) ) ( not ( = ?auto_642602 ?auto_642610 ) ) ( not ( = ?auto_642602 ?auto_642611 ) ) ( not ( = ?auto_642602 ?auto_642612 ) ) ( not ( = ?auto_642603 ?auto_642604 ) ) ( not ( = ?auto_642603 ?auto_642605 ) ) ( not ( = ?auto_642603 ?auto_642606 ) ) ( not ( = ?auto_642603 ?auto_642607 ) ) ( not ( = ?auto_642603 ?auto_642608 ) ) ( not ( = ?auto_642603 ?auto_642609 ) ) ( not ( = ?auto_642603 ?auto_642610 ) ) ( not ( = ?auto_642603 ?auto_642611 ) ) ( not ( = ?auto_642603 ?auto_642612 ) ) ( not ( = ?auto_642604 ?auto_642605 ) ) ( not ( = ?auto_642604 ?auto_642606 ) ) ( not ( = ?auto_642604 ?auto_642607 ) ) ( not ( = ?auto_642604 ?auto_642608 ) ) ( not ( = ?auto_642604 ?auto_642609 ) ) ( not ( = ?auto_642604 ?auto_642610 ) ) ( not ( = ?auto_642604 ?auto_642611 ) ) ( not ( = ?auto_642604 ?auto_642612 ) ) ( not ( = ?auto_642605 ?auto_642606 ) ) ( not ( = ?auto_642605 ?auto_642607 ) ) ( not ( = ?auto_642605 ?auto_642608 ) ) ( not ( = ?auto_642605 ?auto_642609 ) ) ( not ( = ?auto_642605 ?auto_642610 ) ) ( not ( = ?auto_642605 ?auto_642611 ) ) ( not ( = ?auto_642605 ?auto_642612 ) ) ( not ( = ?auto_642606 ?auto_642607 ) ) ( not ( = ?auto_642606 ?auto_642608 ) ) ( not ( = ?auto_642606 ?auto_642609 ) ) ( not ( = ?auto_642606 ?auto_642610 ) ) ( not ( = ?auto_642606 ?auto_642611 ) ) ( not ( = ?auto_642606 ?auto_642612 ) ) ( not ( = ?auto_642607 ?auto_642608 ) ) ( not ( = ?auto_642607 ?auto_642609 ) ) ( not ( = ?auto_642607 ?auto_642610 ) ) ( not ( = ?auto_642607 ?auto_642611 ) ) ( not ( = ?auto_642607 ?auto_642612 ) ) ( not ( = ?auto_642608 ?auto_642609 ) ) ( not ( = ?auto_642608 ?auto_642610 ) ) ( not ( = ?auto_642608 ?auto_642611 ) ) ( not ( = ?auto_642608 ?auto_642612 ) ) ( not ( = ?auto_642609 ?auto_642610 ) ) ( not ( = ?auto_642609 ?auto_642611 ) ) ( not ( = ?auto_642609 ?auto_642612 ) ) ( not ( = ?auto_642610 ?auto_642611 ) ) ( not ( = ?auto_642610 ?auto_642612 ) ) ( not ( = ?auto_642611 ?auto_642612 ) ) ( ON ?auto_642611 ?auto_642612 ) ( ON ?auto_642610 ?auto_642611 ) ( ON ?auto_642609 ?auto_642610 ) ( ON ?auto_642608 ?auto_642609 ) ( ON ?auto_642607 ?auto_642608 ) ( ON ?auto_642606 ?auto_642607 ) ( ON ?auto_642605 ?auto_642606 ) ( ON ?auto_642604 ?auto_642605 ) ( ON ?auto_642603 ?auto_642604 ) ( ON ?auto_642602 ?auto_642603 ) ( ON ?auto_642601 ?auto_642602 ) ( ON ?auto_642600 ?auto_642601 ) ( ON ?auto_642599 ?auto_642600 ) ( ON ?auto_642598 ?auto_642599 ) ( ON ?auto_642597 ?auto_642598 ) ( ON ?auto_642596 ?auto_642597 ) ( CLEAR ?auto_642596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_642596 )
      ( MAKE-17PILE ?auto_642596 ?auto_642597 ?auto_642598 ?auto_642599 ?auto_642600 ?auto_642601 ?auto_642602 ?auto_642603 ?auto_642604 ?auto_642605 ?auto_642606 ?auto_642607 ?auto_642608 ?auto_642609 ?auto_642610 ?auto_642611 ?auto_642612 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_642630 - BLOCK
      ?auto_642631 - BLOCK
      ?auto_642632 - BLOCK
      ?auto_642633 - BLOCK
      ?auto_642634 - BLOCK
      ?auto_642635 - BLOCK
      ?auto_642636 - BLOCK
      ?auto_642637 - BLOCK
      ?auto_642638 - BLOCK
      ?auto_642639 - BLOCK
      ?auto_642640 - BLOCK
      ?auto_642641 - BLOCK
      ?auto_642642 - BLOCK
      ?auto_642643 - BLOCK
      ?auto_642644 - BLOCK
      ?auto_642645 - BLOCK
      ?auto_642646 - BLOCK
    )
    :vars
    (
      ?auto_642647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_642630 ?auto_642631 ) ) ( not ( = ?auto_642630 ?auto_642632 ) ) ( not ( = ?auto_642630 ?auto_642633 ) ) ( not ( = ?auto_642630 ?auto_642634 ) ) ( not ( = ?auto_642630 ?auto_642635 ) ) ( not ( = ?auto_642630 ?auto_642636 ) ) ( not ( = ?auto_642630 ?auto_642637 ) ) ( not ( = ?auto_642630 ?auto_642638 ) ) ( not ( = ?auto_642630 ?auto_642639 ) ) ( not ( = ?auto_642630 ?auto_642640 ) ) ( not ( = ?auto_642630 ?auto_642641 ) ) ( not ( = ?auto_642630 ?auto_642642 ) ) ( not ( = ?auto_642630 ?auto_642643 ) ) ( not ( = ?auto_642630 ?auto_642644 ) ) ( not ( = ?auto_642630 ?auto_642645 ) ) ( not ( = ?auto_642630 ?auto_642646 ) ) ( not ( = ?auto_642631 ?auto_642632 ) ) ( not ( = ?auto_642631 ?auto_642633 ) ) ( not ( = ?auto_642631 ?auto_642634 ) ) ( not ( = ?auto_642631 ?auto_642635 ) ) ( not ( = ?auto_642631 ?auto_642636 ) ) ( not ( = ?auto_642631 ?auto_642637 ) ) ( not ( = ?auto_642631 ?auto_642638 ) ) ( not ( = ?auto_642631 ?auto_642639 ) ) ( not ( = ?auto_642631 ?auto_642640 ) ) ( not ( = ?auto_642631 ?auto_642641 ) ) ( not ( = ?auto_642631 ?auto_642642 ) ) ( not ( = ?auto_642631 ?auto_642643 ) ) ( not ( = ?auto_642631 ?auto_642644 ) ) ( not ( = ?auto_642631 ?auto_642645 ) ) ( not ( = ?auto_642631 ?auto_642646 ) ) ( not ( = ?auto_642632 ?auto_642633 ) ) ( not ( = ?auto_642632 ?auto_642634 ) ) ( not ( = ?auto_642632 ?auto_642635 ) ) ( not ( = ?auto_642632 ?auto_642636 ) ) ( not ( = ?auto_642632 ?auto_642637 ) ) ( not ( = ?auto_642632 ?auto_642638 ) ) ( not ( = ?auto_642632 ?auto_642639 ) ) ( not ( = ?auto_642632 ?auto_642640 ) ) ( not ( = ?auto_642632 ?auto_642641 ) ) ( not ( = ?auto_642632 ?auto_642642 ) ) ( not ( = ?auto_642632 ?auto_642643 ) ) ( not ( = ?auto_642632 ?auto_642644 ) ) ( not ( = ?auto_642632 ?auto_642645 ) ) ( not ( = ?auto_642632 ?auto_642646 ) ) ( not ( = ?auto_642633 ?auto_642634 ) ) ( not ( = ?auto_642633 ?auto_642635 ) ) ( not ( = ?auto_642633 ?auto_642636 ) ) ( not ( = ?auto_642633 ?auto_642637 ) ) ( not ( = ?auto_642633 ?auto_642638 ) ) ( not ( = ?auto_642633 ?auto_642639 ) ) ( not ( = ?auto_642633 ?auto_642640 ) ) ( not ( = ?auto_642633 ?auto_642641 ) ) ( not ( = ?auto_642633 ?auto_642642 ) ) ( not ( = ?auto_642633 ?auto_642643 ) ) ( not ( = ?auto_642633 ?auto_642644 ) ) ( not ( = ?auto_642633 ?auto_642645 ) ) ( not ( = ?auto_642633 ?auto_642646 ) ) ( not ( = ?auto_642634 ?auto_642635 ) ) ( not ( = ?auto_642634 ?auto_642636 ) ) ( not ( = ?auto_642634 ?auto_642637 ) ) ( not ( = ?auto_642634 ?auto_642638 ) ) ( not ( = ?auto_642634 ?auto_642639 ) ) ( not ( = ?auto_642634 ?auto_642640 ) ) ( not ( = ?auto_642634 ?auto_642641 ) ) ( not ( = ?auto_642634 ?auto_642642 ) ) ( not ( = ?auto_642634 ?auto_642643 ) ) ( not ( = ?auto_642634 ?auto_642644 ) ) ( not ( = ?auto_642634 ?auto_642645 ) ) ( not ( = ?auto_642634 ?auto_642646 ) ) ( not ( = ?auto_642635 ?auto_642636 ) ) ( not ( = ?auto_642635 ?auto_642637 ) ) ( not ( = ?auto_642635 ?auto_642638 ) ) ( not ( = ?auto_642635 ?auto_642639 ) ) ( not ( = ?auto_642635 ?auto_642640 ) ) ( not ( = ?auto_642635 ?auto_642641 ) ) ( not ( = ?auto_642635 ?auto_642642 ) ) ( not ( = ?auto_642635 ?auto_642643 ) ) ( not ( = ?auto_642635 ?auto_642644 ) ) ( not ( = ?auto_642635 ?auto_642645 ) ) ( not ( = ?auto_642635 ?auto_642646 ) ) ( not ( = ?auto_642636 ?auto_642637 ) ) ( not ( = ?auto_642636 ?auto_642638 ) ) ( not ( = ?auto_642636 ?auto_642639 ) ) ( not ( = ?auto_642636 ?auto_642640 ) ) ( not ( = ?auto_642636 ?auto_642641 ) ) ( not ( = ?auto_642636 ?auto_642642 ) ) ( not ( = ?auto_642636 ?auto_642643 ) ) ( not ( = ?auto_642636 ?auto_642644 ) ) ( not ( = ?auto_642636 ?auto_642645 ) ) ( not ( = ?auto_642636 ?auto_642646 ) ) ( not ( = ?auto_642637 ?auto_642638 ) ) ( not ( = ?auto_642637 ?auto_642639 ) ) ( not ( = ?auto_642637 ?auto_642640 ) ) ( not ( = ?auto_642637 ?auto_642641 ) ) ( not ( = ?auto_642637 ?auto_642642 ) ) ( not ( = ?auto_642637 ?auto_642643 ) ) ( not ( = ?auto_642637 ?auto_642644 ) ) ( not ( = ?auto_642637 ?auto_642645 ) ) ( not ( = ?auto_642637 ?auto_642646 ) ) ( not ( = ?auto_642638 ?auto_642639 ) ) ( not ( = ?auto_642638 ?auto_642640 ) ) ( not ( = ?auto_642638 ?auto_642641 ) ) ( not ( = ?auto_642638 ?auto_642642 ) ) ( not ( = ?auto_642638 ?auto_642643 ) ) ( not ( = ?auto_642638 ?auto_642644 ) ) ( not ( = ?auto_642638 ?auto_642645 ) ) ( not ( = ?auto_642638 ?auto_642646 ) ) ( not ( = ?auto_642639 ?auto_642640 ) ) ( not ( = ?auto_642639 ?auto_642641 ) ) ( not ( = ?auto_642639 ?auto_642642 ) ) ( not ( = ?auto_642639 ?auto_642643 ) ) ( not ( = ?auto_642639 ?auto_642644 ) ) ( not ( = ?auto_642639 ?auto_642645 ) ) ( not ( = ?auto_642639 ?auto_642646 ) ) ( not ( = ?auto_642640 ?auto_642641 ) ) ( not ( = ?auto_642640 ?auto_642642 ) ) ( not ( = ?auto_642640 ?auto_642643 ) ) ( not ( = ?auto_642640 ?auto_642644 ) ) ( not ( = ?auto_642640 ?auto_642645 ) ) ( not ( = ?auto_642640 ?auto_642646 ) ) ( not ( = ?auto_642641 ?auto_642642 ) ) ( not ( = ?auto_642641 ?auto_642643 ) ) ( not ( = ?auto_642641 ?auto_642644 ) ) ( not ( = ?auto_642641 ?auto_642645 ) ) ( not ( = ?auto_642641 ?auto_642646 ) ) ( not ( = ?auto_642642 ?auto_642643 ) ) ( not ( = ?auto_642642 ?auto_642644 ) ) ( not ( = ?auto_642642 ?auto_642645 ) ) ( not ( = ?auto_642642 ?auto_642646 ) ) ( not ( = ?auto_642643 ?auto_642644 ) ) ( not ( = ?auto_642643 ?auto_642645 ) ) ( not ( = ?auto_642643 ?auto_642646 ) ) ( not ( = ?auto_642644 ?auto_642645 ) ) ( not ( = ?auto_642644 ?auto_642646 ) ) ( not ( = ?auto_642645 ?auto_642646 ) ) ( ON ?auto_642630 ?auto_642647 ) ( not ( = ?auto_642646 ?auto_642647 ) ) ( not ( = ?auto_642645 ?auto_642647 ) ) ( not ( = ?auto_642644 ?auto_642647 ) ) ( not ( = ?auto_642643 ?auto_642647 ) ) ( not ( = ?auto_642642 ?auto_642647 ) ) ( not ( = ?auto_642641 ?auto_642647 ) ) ( not ( = ?auto_642640 ?auto_642647 ) ) ( not ( = ?auto_642639 ?auto_642647 ) ) ( not ( = ?auto_642638 ?auto_642647 ) ) ( not ( = ?auto_642637 ?auto_642647 ) ) ( not ( = ?auto_642636 ?auto_642647 ) ) ( not ( = ?auto_642635 ?auto_642647 ) ) ( not ( = ?auto_642634 ?auto_642647 ) ) ( not ( = ?auto_642633 ?auto_642647 ) ) ( not ( = ?auto_642632 ?auto_642647 ) ) ( not ( = ?auto_642631 ?auto_642647 ) ) ( not ( = ?auto_642630 ?auto_642647 ) ) ( ON ?auto_642631 ?auto_642630 ) ( ON ?auto_642632 ?auto_642631 ) ( ON ?auto_642633 ?auto_642632 ) ( ON ?auto_642634 ?auto_642633 ) ( ON ?auto_642635 ?auto_642634 ) ( ON ?auto_642636 ?auto_642635 ) ( ON ?auto_642637 ?auto_642636 ) ( ON ?auto_642638 ?auto_642637 ) ( ON ?auto_642639 ?auto_642638 ) ( ON ?auto_642640 ?auto_642639 ) ( ON ?auto_642641 ?auto_642640 ) ( ON ?auto_642642 ?auto_642641 ) ( ON ?auto_642643 ?auto_642642 ) ( ON ?auto_642644 ?auto_642643 ) ( ON ?auto_642645 ?auto_642644 ) ( ON ?auto_642646 ?auto_642645 ) ( CLEAR ?auto_642646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_642646 ?auto_642645 ?auto_642644 ?auto_642643 ?auto_642642 ?auto_642641 ?auto_642640 ?auto_642639 ?auto_642638 ?auto_642637 ?auto_642636 ?auto_642635 ?auto_642634 ?auto_642633 ?auto_642632 ?auto_642631 ?auto_642630 )
      ( MAKE-17PILE ?auto_642630 ?auto_642631 ?auto_642632 ?auto_642633 ?auto_642634 ?auto_642635 ?auto_642636 ?auto_642637 ?auto_642638 ?auto_642639 ?auto_642640 ?auto_642641 ?auto_642642 ?auto_642643 ?auto_642644 ?auto_642645 ?auto_642646 ) )
  )

)

