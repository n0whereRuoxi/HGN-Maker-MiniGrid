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
      ?auto_56161 - BLOCK
    )
    :vars
    (
      ?auto_56162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56161 ?auto_56162 ) ( CLEAR ?auto_56161 ) ( HAND-EMPTY ) ( not ( = ?auto_56161 ?auto_56162 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56161 ?auto_56162 )
      ( !PUTDOWN ?auto_56161 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56168 - BLOCK
      ?auto_56169 - BLOCK
    )
    :vars
    (
      ?auto_56170 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_56168 ) ( ON ?auto_56169 ?auto_56170 ) ( CLEAR ?auto_56169 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56168 ) ( not ( = ?auto_56168 ?auto_56169 ) ) ( not ( = ?auto_56168 ?auto_56170 ) ) ( not ( = ?auto_56169 ?auto_56170 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56169 ?auto_56170 )
      ( !STACK ?auto_56169 ?auto_56168 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56178 - BLOCK
      ?auto_56179 - BLOCK
    )
    :vars
    (
      ?auto_56180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56179 ?auto_56180 ) ( not ( = ?auto_56178 ?auto_56179 ) ) ( not ( = ?auto_56178 ?auto_56180 ) ) ( not ( = ?auto_56179 ?auto_56180 ) ) ( ON ?auto_56178 ?auto_56179 ) ( CLEAR ?auto_56178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56178 )
      ( MAKE-2PILE ?auto_56178 ?auto_56179 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56189 - BLOCK
      ?auto_56190 - BLOCK
      ?auto_56191 - BLOCK
    )
    :vars
    (
      ?auto_56192 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_56190 ) ( ON ?auto_56191 ?auto_56192 ) ( CLEAR ?auto_56191 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56189 ) ( ON ?auto_56190 ?auto_56189 ) ( not ( = ?auto_56189 ?auto_56190 ) ) ( not ( = ?auto_56189 ?auto_56191 ) ) ( not ( = ?auto_56189 ?auto_56192 ) ) ( not ( = ?auto_56190 ?auto_56191 ) ) ( not ( = ?auto_56190 ?auto_56192 ) ) ( not ( = ?auto_56191 ?auto_56192 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56191 ?auto_56192 )
      ( !STACK ?auto_56191 ?auto_56190 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56203 - BLOCK
      ?auto_56204 - BLOCK
      ?auto_56205 - BLOCK
    )
    :vars
    (
      ?auto_56206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56205 ?auto_56206 ) ( ON-TABLE ?auto_56203 ) ( not ( = ?auto_56203 ?auto_56204 ) ) ( not ( = ?auto_56203 ?auto_56205 ) ) ( not ( = ?auto_56203 ?auto_56206 ) ) ( not ( = ?auto_56204 ?auto_56205 ) ) ( not ( = ?auto_56204 ?auto_56206 ) ) ( not ( = ?auto_56205 ?auto_56206 ) ) ( CLEAR ?auto_56203 ) ( ON ?auto_56204 ?auto_56205 ) ( CLEAR ?auto_56204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56203 ?auto_56204 )
      ( MAKE-3PILE ?auto_56203 ?auto_56204 ?auto_56205 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56217 - BLOCK
      ?auto_56218 - BLOCK
      ?auto_56219 - BLOCK
    )
    :vars
    (
      ?auto_56220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56219 ?auto_56220 ) ( not ( = ?auto_56217 ?auto_56218 ) ) ( not ( = ?auto_56217 ?auto_56219 ) ) ( not ( = ?auto_56217 ?auto_56220 ) ) ( not ( = ?auto_56218 ?auto_56219 ) ) ( not ( = ?auto_56218 ?auto_56220 ) ) ( not ( = ?auto_56219 ?auto_56220 ) ) ( ON ?auto_56218 ?auto_56219 ) ( ON ?auto_56217 ?auto_56218 ) ( CLEAR ?auto_56217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56217 )
      ( MAKE-3PILE ?auto_56217 ?auto_56218 ?auto_56219 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56232 - BLOCK
      ?auto_56233 - BLOCK
      ?auto_56234 - BLOCK
      ?auto_56235 - BLOCK
    )
    :vars
    (
      ?auto_56236 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_56234 ) ( ON ?auto_56235 ?auto_56236 ) ( CLEAR ?auto_56235 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56232 ) ( ON ?auto_56233 ?auto_56232 ) ( ON ?auto_56234 ?auto_56233 ) ( not ( = ?auto_56232 ?auto_56233 ) ) ( not ( = ?auto_56232 ?auto_56234 ) ) ( not ( = ?auto_56232 ?auto_56235 ) ) ( not ( = ?auto_56232 ?auto_56236 ) ) ( not ( = ?auto_56233 ?auto_56234 ) ) ( not ( = ?auto_56233 ?auto_56235 ) ) ( not ( = ?auto_56233 ?auto_56236 ) ) ( not ( = ?auto_56234 ?auto_56235 ) ) ( not ( = ?auto_56234 ?auto_56236 ) ) ( not ( = ?auto_56235 ?auto_56236 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56235 ?auto_56236 )
      ( !STACK ?auto_56235 ?auto_56234 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56250 - BLOCK
      ?auto_56251 - BLOCK
      ?auto_56252 - BLOCK
      ?auto_56253 - BLOCK
    )
    :vars
    (
      ?auto_56254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56253 ?auto_56254 ) ( ON-TABLE ?auto_56250 ) ( ON ?auto_56251 ?auto_56250 ) ( not ( = ?auto_56250 ?auto_56251 ) ) ( not ( = ?auto_56250 ?auto_56252 ) ) ( not ( = ?auto_56250 ?auto_56253 ) ) ( not ( = ?auto_56250 ?auto_56254 ) ) ( not ( = ?auto_56251 ?auto_56252 ) ) ( not ( = ?auto_56251 ?auto_56253 ) ) ( not ( = ?auto_56251 ?auto_56254 ) ) ( not ( = ?auto_56252 ?auto_56253 ) ) ( not ( = ?auto_56252 ?auto_56254 ) ) ( not ( = ?auto_56253 ?auto_56254 ) ) ( CLEAR ?auto_56251 ) ( ON ?auto_56252 ?auto_56253 ) ( CLEAR ?auto_56252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56250 ?auto_56251 ?auto_56252 )
      ( MAKE-4PILE ?auto_56250 ?auto_56251 ?auto_56252 ?auto_56253 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56268 - BLOCK
      ?auto_56269 - BLOCK
      ?auto_56270 - BLOCK
      ?auto_56271 - BLOCK
    )
    :vars
    (
      ?auto_56272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56271 ?auto_56272 ) ( ON-TABLE ?auto_56268 ) ( not ( = ?auto_56268 ?auto_56269 ) ) ( not ( = ?auto_56268 ?auto_56270 ) ) ( not ( = ?auto_56268 ?auto_56271 ) ) ( not ( = ?auto_56268 ?auto_56272 ) ) ( not ( = ?auto_56269 ?auto_56270 ) ) ( not ( = ?auto_56269 ?auto_56271 ) ) ( not ( = ?auto_56269 ?auto_56272 ) ) ( not ( = ?auto_56270 ?auto_56271 ) ) ( not ( = ?auto_56270 ?auto_56272 ) ) ( not ( = ?auto_56271 ?auto_56272 ) ) ( ON ?auto_56270 ?auto_56271 ) ( CLEAR ?auto_56268 ) ( ON ?auto_56269 ?auto_56270 ) ( CLEAR ?auto_56269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56268 ?auto_56269 )
      ( MAKE-4PILE ?auto_56268 ?auto_56269 ?auto_56270 ?auto_56271 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56286 - BLOCK
      ?auto_56287 - BLOCK
      ?auto_56288 - BLOCK
      ?auto_56289 - BLOCK
    )
    :vars
    (
      ?auto_56290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56289 ?auto_56290 ) ( not ( = ?auto_56286 ?auto_56287 ) ) ( not ( = ?auto_56286 ?auto_56288 ) ) ( not ( = ?auto_56286 ?auto_56289 ) ) ( not ( = ?auto_56286 ?auto_56290 ) ) ( not ( = ?auto_56287 ?auto_56288 ) ) ( not ( = ?auto_56287 ?auto_56289 ) ) ( not ( = ?auto_56287 ?auto_56290 ) ) ( not ( = ?auto_56288 ?auto_56289 ) ) ( not ( = ?auto_56288 ?auto_56290 ) ) ( not ( = ?auto_56289 ?auto_56290 ) ) ( ON ?auto_56288 ?auto_56289 ) ( ON ?auto_56287 ?auto_56288 ) ( ON ?auto_56286 ?auto_56287 ) ( CLEAR ?auto_56286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56286 )
      ( MAKE-4PILE ?auto_56286 ?auto_56287 ?auto_56288 ?auto_56289 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56305 - BLOCK
      ?auto_56306 - BLOCK
      ?auto_56307 - BLOCK
      ?auto_56308 - BLOCK
      ?auto_56309 - BLOCK
    )
    :vars
    (
      ?auto_56310 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_56308 ) ( ON ?auto_56309 ?auto_56310 ) ( CLEAR ?auto_56309 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56305 ) ( ON ?auto_56306 ?auto_56305 ) ( ON ?auto_56307 ?auto_56306 ) ( ON ?auto_56308 ?auto_56307 ) ( not ( = ?auto_56305 ?auto_56306 ) ) ( not ( = ?auto_56305 ?auto_56307 ) ) ( not ( = ?auto_56305 ?auto_56308 ) ) ( not ( = ?auto_56305 ?auto_56309 ) ) ( not ( = ?auto_56305 ?auto_56310 ) ) ( not ( = ?auto_56306 ?auto_56307 ) ) ( not ( = ?auto_56306 ?auto_56308 ) ) ( not ( = ?auto_56306 ?auto_56309 ) ) ( not ( = ?auto_56306 ?auto_56310 ) ) ( not ( = ?auto_56307 ?auto_56308 ) ) ( not ( = ?auto_56307 ?auto_56309 ) ) ( not ( = ?auto_56307 ?auto_56310 ) ) ( not ( = ?auto_56308 ?auto_56309 ) ) ( not ( = ?auto_56308 ?auto_56310 ) ) ( not ( = ?auto_56309 ?auto_56310 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56309 ?auto_56310 )
      ( !STACK ?auto_56309 ?auto_56308 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56327 - BLOCK
      ?auto_56328 - BLOCK
      ?auto_56329 - BLOCK
      ?auto_56330 - BLOCK
      ?auto_56331 - BLOCK
    )
    :vars
    (
      ?auto_56332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56331 ?auto_56332 ) ( ON-TABLE ?auto_56327 ) ( ON ?auto_56328 ?auto_56327 ) ( ON ?auto_56329 ?auto_56328 ) ( not ( = ?auto_56327 ?auto_56328 ) ) ( not ( = ?auto_56327 ?auto_56329 ) ) ( not ( = ?auto_56327 ?auto_56330 ) ) ( not ( = ?auto_56327 ?auto_56331 ) ) ( not ( = ?auto_56327 ?auto_56332 ) ) ( not ( = ?auto_56328 ?auto_56329 ) ) ( not ( = ?auto_56328 ?auto_56330 ) ) ( not ( = ?auto_56328 ?auto_56331 ) ) ( not ( = ?auto_56328 ?auto_56332 ) ) ( not ( = ?auto_56329 ?auto_56330 ) ) ( not ( = ?auto_56329 ?auto_56331 ) ) ( not ( = ?auto_56329 ?auto_56332 ) ) ( not ( = ?auto_56330 ?auto_56331 ) ) ( not ( = ?auto_56330 ?auto_56332 ) ) ( not ( = ?auto_56331 ?auto_56332 ) ) ( CLEAR ?auto_56329 ) ( ON ?auto_56330 ?auto_56331 ) ( CLEAR ?auto_56330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56327 ?auto_56328 ?auto_56329 ?auto_56330 )
      ( MAKE-5PILE ?auto_56327 ?auto_56328 ?auto_56329 ?auto_56330 ?auto_56331 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56349 - BLOCK
      ?auto_56350 - BLOCK
      ?auto_56351 - BLOCK
      ?auto_56352 - BLOCK
      ?auto_56353 - BLOCK
    )
    :vars
    (
      ?auto_56354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56353 ?auto_56354 ) ( ON-TABLE ?auto_56349 ) ( ON ?auto_56350 ?auto_56349 ) ( not ( = ?auto_56349 ?auto_56350 ) ) ( not ( = ?auto_56349 ?auto_56351 ) ) ( not ( = ?auto_56349 ?auto_56352 ) ) ( not ( = ?auto_56349 ?auto_56353 ) ) ( not ( = ?auto_56349 ?auto_56354 ) ) ( not ( = ?auto_56350 ?auto_56351 ) ) ( not ( = ?auto_56350 ?auto_56352 ) ) ( not ( = ?auto_56350 ?auto_56353 ) ) ( not ( = ?auto_56350 ?auto_56354 ) ) ( not ( = ?auto_56351 ?auto_56352 ) ) ( not ( = ?auto_56351 ?auto_56353 ) ) ( not ( = ?auto_56351 ?auto_56354 ) ) ( not ( = ?auto_56352 ?auto_56353 ) ) ( not ( = ?auto_56352 ?auto_56354 ) ) ( not ( = ?auto_56353 ?auto_56354 ) ) ( ON ?auto_56352 ?auto_56353 ) ( CLEAR ?auto_56350 ) ( ON ?auto_56351 ?auto_56352 ) ( CLEAR ?auto_56351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56349 ?auto_56350 ?auto_56351 )
      ( MAKE-5PILE ?auto_56349 ?auto_56350 ?auto_56351 ?auto_56352 ?auto_56353 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56371 - BLOCK
      ?auto_56372 - BLOCK
      ?auto_56373 - BLOCK
      ?auto_56374 - BLOCK
      ?auto_56375 - BLOCK
    )
    :vars
    (
      ?auto_56376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56375 ?auto_56376 ) ( ON-TABLE ?auto_56371 ) ( not ( = ?auto_56371 ?auto_56372 ) ) ( not ( = ?auto_56371 ?auto_56373 ) ) ( not ( = ?auto_56371 ?auto_56374 ) ) ( not ( = ?auto_56371 ?auto_56375 ) ) ( not ( = ?auto_56371 ?auto_56376 ) ) ( not ( = ?auto_56372 ?auto_56373 ) ) ( not ( = ?auto_56372 ?auto_56374 ) ) ( not ( = ?auto_56372 ?auto_56375 ) ) ( not ( = ?auto_56372 ?auto_56376 ) ) ( not ( = ?auto_56373 ?auto_56374 ) ) ( not ( = ?auto_56373 ?auto_56375 ) ) ( not ( = ?auto_56373 ?auto_56376 ) ) ( not ( = ?auto_56374 ?auto_56375 ) ) ( not ( = ?auto_56374 ?auto_56376 ) ) ( not ( = ?auto_56375 ?auto_56376 ) ) ( ON ?auto_56374 ?auto_56375 ) ( ON ?auto_56373 ?auto_56374 ) ( CLEAR ?auto_56371 ) ( ON ?auto_56372 ?auto_56373 ) ( CLEAR ?auto_56372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56371 ?auto_56372 )
      ( MAKE-5PILE ?auto_56371 ?auto_56372 ?auto_56373 ?auto_56374 ?auto_56375 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56393 - BLOCK
      ?auto_56394 - BLOCK
      ?auto_56395 - BLOCK
      ?auto_56396 - BLOCK
      ?auto_56397 - BLOCK
    )
    :vars
    (
      ?auto_56398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56397 ?auto_56398 ) ( not ( = ?auto_56393 ?auto_56394 ) ) ( not ( = ?auto_56393 ?auto_56395 ) ) ( not ( = ?auto_56393 ?auto_56396 ) ) ( not ( = ?auto_56393 ?auto_56397 ) ) ( not ( = ?auto_56393 ?auto_56398 ) ) ( not ( = ?auto_56394 ?auto_56395 ) ) ( not ( = ?auto_56394 ?auto_56396 ) ) ( not ( = ?auto_56394 ?auto_56397 ) ) ( not ( = ?auto_56394 ?auto_56398 ) ) ( not ( = ?auto_56395 ?auto_56396 ) ) ( not ( = ?auto_56395 ?auto_56397 ) ) ( not ( = ?auto_56395 ?auto_56398 ) ) ( not ( = ?auto_56396 ?auto_56397 ) ) ( not ( = ?auto_56396 ?auto_56398 ) ) ( not ( = ?auto_56397 ?auto_56398 ) ) ( ON ?auto_56396 ?auto_56397 ) ( ON ?auto_56395 ?auto_56396 ) ( ON ?auto_56394 ?auto_56395 ) ( ON ?auto_56393 ?auto_56394 ) ( CLEAR ?auto_56393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56393 )
      ( MAKE-5PILE ?auto_56393 ?auto_56394 ?auto_56395 ?auto_56396 ?auto_56397 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56416 - BLOCK
      ?auto_56417 - BLOCK
      ?auto_56418 - BLOCK
      ?auto_56419 - BLOCK
      ?auto_56420 - BLOCK
      ?auto_56421 - BLOCK
    )
    :vars
    (
      ?auto_56422 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_56420 ) ( ON ?auto_56421 ?auto_56422 ) ( CLEAR ?auto_56421 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56416 ) ( ON ?auto_56417 ?auto_56416 ) ( ON ?auto_56418 ?auto_56417 ) ( ON ?auto_56419 ?auto_56418 ) ( ON ?auto_56420 ?auto_56419 ) ( not ( = ?auto_56416 ?auto_56417 ) ) ( not ( = ?auto_56416 ?auto_56418 ) ) ( not ( = ?auto_56416 ?auto_56419 ) ) ( not ( = ?auto_56416 ?auto_56420 ) ) ( not ( = ?auto_56416 ?auto_56421 ) ) ( not ( = ?auto_56416 ?auto_56422 ) ) ( not ( = ?auto_56417 ?auto_56418 ) ) ( not ( = ?auto_56417 ?auto_56419 ) ) ( not ( = ?auto_56417 ?auto_56420 ) ) ( not ( = ?auto_56417 ?auto_56421 ) ) ( not ( = ?auto_56417 ?auto_56422 ) ) ( not ( = ?auto_56418 ?auto_56419 ) ) ( not ( = ?auto_56418 ?auto_56420 ) ) ( not ( = ?auto_56418 ?auto_56421 ) ) ( not ( = ?auto_56418 ?auto_56422 ) ) ( not ( = ?auto_56419 ?auto_56420 ) ) ( not ( = ?auto_56419 ?auto_56421 ) ) ( not ( = ?auto_56419 ?auto_56422 ) ) ( not ( = ?auto_56420 ?auto_56421 ) ) ( not ( = ?auto_56420 ?auto_56422 ) ) ( not ( = ?auto_56421 ?auto_56422 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56421 ?auto_56422 )
      ( !STACK ?auto_56421 ?auto_56420 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56442 - BLOCK
      ?auto_56443 - BLOCK
      ?auto_56444 - BLOCK
      ?auto_56445 - BLOCK
      ?auto_56446 - BLOCK
      ?auto_56447 - BLOCK
    )
    :vars
    (
      ?auto_56448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56447 ?auto_56448 ) ( ON-TABLE ?auto_56442 ) ( ON ?auto_56443 ?auto_56442 ) ( ON ?auto_56444 ?auto_56443 ) ( ON ?auto_56445 ?auto_56444 ) ( not ( = ?auto_56442 ?auto_56443 ) ) ( not ( = ?auto_56442 ?auto_56444 ) ) ( not ( = ?auto_56442 ?auto_56445 ) ) ( not ( = ?auto_56442 ?auto_56446 ) ) ( not ( = ?auto_56442 ?auto_56447 ) ) ( not ( = ?auto_56442 ?auto_56448 ) ) ( not ( = ?auto_56443 ?auto_56444 ) ) ( not ( = ?auto_56443 ?auto_56445 ) ) ( not ( = ?auto_56443 ?auto_56446 ) ) ( not ( = ?auto_56443 ?auto_56447 ) ) ( not ( = ?auto_56443 ?auto_56448 ) ) ( not ( = ?auto_56444 ?auto_56445 ) ) ( not ( = ?auto_56444 ?auto_56446 ) ) ( not ( = ?auto_56444 ?auto_56447 ) ) ( not ( = ?auto_56444 ?auto_56448 ) ) ( not ( = ?auto_56445 ?auto_56446 ) ) ( not ( = ?auto_56445 ?auto_56447 ) ) ( not ( = ?auto_56445 ?auto_56448 ) ) ( not ( = ?auto_56446 ?auto_56447 ) ) ( not ( = ?auto_56446 ?auto_56448 ) ) ( not ( = ?auto_56447 ?auto_56448 ) ) ( CLEAR ?auto_56445 ) ( ON ?auto_56446 ?auto_56447 ) ( CLEAR ?auto_56446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56442 ?auto_56443 ?auto_56444 ?auto_56445 ?auto_56446 )
      ( MAKE-6PILE ?auto_56442 ?auto_56443 ?auto_56444 ?auto_56445 ?auto_56446 ?auto_56447 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56468 - BLOCK
      ?auto_56469 - BLOCK
      ?auto_56470 - BLOCK
      ?auto_56471 - BLOCK
      ?auto_56472 - BLOCK
      ?auto_56473 - BLOCK
    )
    :vars
    (
      ?auto_56474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56473 ?auto_56474 ) ( ON-TABLE ?auto_56468 ) ( ON ?auto_56469 ?auto_56468 ) ( ON ?auto_56470 ?auto_56469 ) ( not ( = ?auto_56468 ?auto_56469 ) ) ( not ( = ?auto_56468 ?auto_56470 ) ) ( not ( = ?auto_56468 ?auto_56471 ) ) ( not ( = ?auto_56468 ?auto_56472 ) ) ( not ( = ?auto_56468 ?auto_56473 ) ) ( not ( = ?auto_56468 ?auto_56474 ) ) ( not ( = ?auto_56469 ?auto_56470 ) ) ( not ( = ?auto_56469 ?auto_56471 ) ) ( not ( = ?auto_56469 ?auto_56472 ) ) ( not ( = ?auto_56469 ?auto_56473 ) ) ( not ( = ?auto_56469 ?auto_56474 ) ) ( not ( = ?auto_56470 ?auto_56471 ) ) ( not ( = ?auto_56470 ?auto_56472 ) ) ( not ( = ?auto_56470 ?auto_56473 ) ) ( not ( = ?auto_56470 ?auto_56474 ) ) ( not ( = ?auto_56471 ?auto_56472 ) ) ( not ( = ?auto_56471 ?auto_56473 ) ) ( not ( = ?auto_56471 ?auto_56474 ) ) ( not ( = ?auto_56472 ?auto_56473 ) ) ( not ( = ?auto_56472 ?auto_56474 ) ) ( not ( = ?auto_56473 ?auto_56474 ) ) ( ON ?auto_56472 ?auto_56473 ) ( CLEAR ?auto_56470 ) ( ON ?auto_56471 ?auto_56472 ) ( CLEAR ?auto_56471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56468 ?auto_56469 ?auto_56470 ?auto_56471 )
      ( MAKE-6PILE ?auto_56468 ?auto_56469 ?auto_56470 ?auto_56471 ?auto_56472 ?auto_56473 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56494 - BLOCK
      ?auto_56495 - BLOCK
      ?auto_56496 - BLOCK
      ?auto_56497 - BLOCK
      ?auto_56498 - BLOCK
      ?auto_56499 - BLOCK
    )
    :vars
    (
      ?auto_56500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56499 ?auto_56500 ) ( ON-TABLE ?auto_56494 ) ( ON ?auto_56495 ?auto_56494 ) ( not ( = ?auto_56494 ?auto_56495 ) ) ( not ( = ?auto_56494 ?auto_56496 ) ) ( not ( = ?auto_56494 ?auto_56497 ) ) ( not ( = ?auto_56494 ?auto_56498 ) ) ( not ( = ?auto_56494 ?auto_56499 ) ) ( not ( = ?auto_56494 ?auto_56500 ) ) ( not ( = ?auto_56495 ?auto_56496 ) ) ( not ( = ?auto_56495 ?auto_56497 ) ) ( not ( = ?auto_56495 ?auto_56498 ) ) ( not ( = ?auto_56495 ?auto_56499 ) ) ( not ( = ?auto_56495 ?auto_56500 ) ) ( not ( = ?auto_56496 ?auto_56497 ) ) ( not ( = ?auto_56496 ?auto_56498 ) ) ( not ( = ?auto_56496 ?auto_56499 ) ) ( not ( = ?auto_56496 ?auto_56500 ) ) ( not ( = ?auto_56497 ?auto_56498 ) ) ( not ( = ?auto_56497 ?auto_56499 ) ) ( not ( = ?auto_56497 ?auto_56500 ) ) ( not ( = ?auto_56498 ?auto_56499 ) ) ( not ( = ?auto_56498 ?auto_56500 ) ) ( not ( = ?auto_56499 ?auto_56500 ) ) ( ON ?auto_56498 ?auto_56499 ) ( ON ?auto_56497 ?auto_56498 ) ( CLEAR ?auto_56495 ) ( ON ?auto_56496 ?auto_56497 ) ( CLEAR ?auto_56496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56494 ?auto_56495 ?auto_56496 )
      ( MAKE-6PILE ?auto_56494 ?auto_56495 ?auto_56496 ?auto_56497 ?auto_56498 ?auto_56499 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56520 - BLOCK
      ?auto_56521 - BLOCK
      ?auto_56522 - BLOCK
      ?auto_56523 - BLOCK
      ?auto_56524 - BLOCK
      ?auto_56525 - BLOCK
    )
    :vars
    (
      ?auto_56526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56525 ?auto_56526 ) ( ON-TABLE ?auto_56520 ) ( not ( = ?auto_56520 ?auto_56521 ) ) ( not ( = ?auto_56520 ?auto_56522 ) ) ( not ( = ?auto_56520 ?auto_56523 ) ) ( not ( = ?auto_56520 ?auto_56524 ) ) ( not ( = ?auto_56520 ?auto_56525 ) ) ( not ( = ?auto_56520 ?auto_56526 ) ) ( not ( = ?auto_56521 ?auto_56522 ) ) ( not ( = ?auto_56521 ?auto_56523 ) ) ( not ( = ?auto_56521 ?auto_56524 ) ) ( not ( = ?auto_56521 ?auto_56525 ) ) ( not ( = ?auto_56521 ?auto_56526 ) ) ( not ( = ?auto_56522 ?auto_56523 ) ) ( not ( = ?auto_56522 ?auto_56524 ) ) ( not ( = ?auto_56522 ?auto_56525 ) ) ( not ( = ?auto_56522 ?auto_56526 ) ) ( not ( = ?auto_56523 ?auto_56524 ) ) ( not ( = ?auto_56523 ?auto_56525 ) ) ( not ( = ?auto_56523 ?auto_56526 ) ) ( not ( = ?auto_56524 ?auto_56525 ) ) ( not ( = ?auto_56524 ?auto_56526 ) ) ( not ( = ?auto_56525 ?auto_56526 ) ) ( ON ?auto_56524 ?auto_56525 ) ( ON ?auto_56523 ?auto_56524 ) ( ON ?auto_56522 ?auto_56523 ) ( CLEAR ?auto_56520 ) ( ON ?auto_56521 ?auto_56522 ) ( CLEAR ?auto_56521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56520 ?auto_56521 )
      ( MAKE-6PILE ?auto_56520 ?auto_56521 ?auto_56522 ?auto_56523 ?auto_56524 ?auto_56525 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56546 - BLOCK
      ?auto_56547 - BLOCK
      ?auto_56548 - BLOCK
      ?auto_56549 - BLOCK
      ?auto_56550 - BLOCK
      ?auto_56551 - BLOCK
    )
    :vars
    (
      ?auto_56552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56551 ?auto_56552 ) ( not ( = ?auto_56546 ?auto_56547 ) ) ( not ( = ?auto_56546 ?auto_56548 ) ) ( not ( = ?auto_56546 ?auto_56549 ) ) ( not ( = ?auto_56546 ?auto_56550 ) ) ( not ( = ?auto_56546 ?auto_56551 ) ) ( not ( = ?auto_56546 ?auto_56552 ) ) ( not ( = ?auto_56547 ?auto_56548 ) ) ( not ( = ?auto_56547 ?auto_56549 ) ) ( not ( = ?auto_56547 ?auto_56550 ) ) ( not ( = ?auto_56547 ?auto_56551 ) ) ( not ( = ?auto_56547 ?auto_56552 ) ) ( not ( = ?auto_56548 ?auto_56549 ) ) ( not ( = ?auto_56548 ?auto_56550 ) ) ( not ( = ?auto_56548 ?auto_56551 ) ) ( not ( = ?auto_56548 ?auto_56552 ) ) ( not ( = ?auto_56549 ?auto_56550 ) ) ( not ( = ?auto_56549 ?auto_56551 ) ) ( not ( = ?auto_56549 ?auto_56552 ) ) ( not ( = ?auto_56550 ?auto_56551 ) ) ( not ( = ?auto_56550 ?auto_56552 ) ) ( not ( = ?auto_56551 ?auto_56552 ) ) ( ON ?auto_56550 ?auto_56551 ) ( ON ?auto_56549 ?auto_56550 ) ( ON ?auto_56548 ?auto_56549 ) ( ON ?auto_56547 ?auto_56548 ) ( ON ?auto_56546 ?auto_56547 ) ( CLEAR ?auto_56546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56546 )
      ( MAKE-6PILE ?auto_56546 ?auto_56547 ?auto_56548 ?auto_56549 ?auto_56550 ?auto_56551 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_56573 - BLOCK
      ?auto_56574 - BLOCK
      ?auto_56575 - BLOCK
      ?auto_56576 - BLOCK
      ?auto_56577 - BLOCK
      ?auto_56578 - BLOCK
      ?auto_56579 - BLOCK
    )
    :vars
    (
      ?auto_56580 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_56578 ) ( ON ?auto_56579 ?auto_56580 ) ( CLEAR ?auto_56579 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56573 ) ( ON ?auto_56574 ?auto_56573 ) ( ON ?auto_56575 ?auto_56574 ) ( ON ?auto_56576 ?auto_56575 ) ( ON ?auto_56577 ?auto_56576 ) ( ON ?auto_56578 ?auto_56577 ) ( not ( = ?auto_56573 ?auto_56574 ) ) ( not ( = ?auto_56573 ?auto_56575 ) ) ( not ( = ?auto_56573 ?auto_56576 ) ) ( not ( = ?auto_56573 ?auto_56577 ) ) ( not ( = ?auto_56573 ?auto_56578 ) ) ( not ( = ?auto_56573 ?auto_56579 ) ) ( not ( = ?auto_56573 ?auto_56580 ) ) ( not ( = ?auto_56574 ?auto_56575 ) ) ( not ( = ?auto_56574 ?auto_56576 ) ) ( not ( = ?auto_56574 ?auto_56577 ) ) ( not ( = ?auto_56574 ?auto_56578 ) ) ( not ( = ?auto_56574 ?auto_56579 ) ) ( not ( = ?auto_56574 ?auto_56580 ) ) ( not ( = ?auto_56575 ?auto_56576 ) ) ( not ( = ?auto_56575 ?auto_56577 ) ) ( not ( = ?auto_56575 ?auto_56578 ) ) ( not ( = ?auto_56575 ?auto_56579 ) ) ( not ( = ?auto_56575 ?auto_56580 ) ) ( not ( = ?auto_56576 ?auto_56577 ) ) ( not ( = ?auto_56576 ?auto_56578 ) ) ( not ( = ?auto_56576 ?auto_56579 ) ) ( not ( = ?auto_56576 ?auto_56580 ) ) ( not ( = ?auto_56577 ?auto_56578 ) ) ( not ( = ?auto_56577 ?auto_56579 ) ) ( not ( = ?auto_56577 ?auto_56580 ) ) ( not ( = ?auto_56578 ?auto_56579 ) ) ( not ( = ?auto_56578 ?auto_56580 ) ) ( not ( = ?auto_56579 ?auto_56580 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56579 ?auto_56580 )
      ( !STACK ?auto_56579 ?auto_56578 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_56603 - BLOCK
      ?auto_56604 - BLOCK
      ?auto_56605 - BLOCK
      ?auto_56606 - BLOCK
      ?auto_56607 - BLOCK
      ?auto_56608 - BLOCK
      ?auto_56609 - BLOCK
    )
    :vars
    (
      ?auto_56610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56609 ?auto_56610 ) ( ON-TABLE ?auto_56603 ) ( ON ?auto_56604 ?auto_56603 ) ( ON ?auto_56605 ?auto_56604 ) ( ON ?auto_56606 ?auto_56605 ) ( ON ?auto_56607 ?auto_56606 ) ( not ( = ?auto_56603 ?auto_56604 ) ) ( not ( = ?auto_56603 ?auto_56605 ) ) ( not ( = ?auto_56603 ?auto_56606 ) ) ( not ( = ?auto_56603 ?auto_56607 ) ) ( not ( = ?auto_56603 ?auto_56608 ) ) ( not ( = ?auto_56603 ?auto_56609 ) ) ( not ( = ?auto_56603 ?auto_56610 ) ) ( not ( = ?auto_56604 ?auto_56605 ) ) ( not ( = ?auto_56604 ?auto_56606 ) ) ( not ( = ?auto_56604 ?auto_56607 ) ) ( not ( = ?auto_56604 ?auto_56608 ) ) ( not ( = ?auto_56604 ?auto_56609 ) ) ( not ( = ?auto_56604 ?auto_56610 ) ) ( not ( = ?auto_56605 ?auto_56606 ) ) ( not ( = ?auto_56605 ?auto_56607 ) ) ( not ( = ?auto_56605 ?auto_56608 ) ) ( not ( = ?auto_56605 ?auto_56609 ) ) ( not ( = ?auto_56605 ?auto_56610 ) ) ( not ( = ?auto_56606 ?auto_56607 ) ) ( not ( = ?auto_56606 ?auto_56608 ) ) ( not ( = ?auto_56606 ?auto_56609 ) ) ( not ( = ?auto_56606 ?auto_56610 ) ) ( not ( = ?auto_56607 ?auto_56608 ) ) ( not ( = ?auto_56607 ?auto_56609 ) ) ( not ( = ?auto_56607 ?auto_56610 ) ) ( not ( = ?auto_56608 ?auto_56609 ) ) ( not ( = ?auto_56608 ?auto_56610 ) ) ( not ( = ?auto_56609 ?auto_56610 ) ) ( CLEAR ?auto_56607 ) ( ON ?auto_56608 ?auto_56609 ) ( CLEAR ?auto_56608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56603 ?auto_56604 ?auto_56605 ?auto_56606 ?auto_56607 ?auto_56608 )
      ( MAKE-7PILE ?auto_56603 ?auto_56604 ?auto_56605 ?auto_56606 ?auto_56607 ?auto_56608 ?auto_56609 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_56633 - BLOCK
      ?auto_56634 - BLOCK
      ?auto_56635 - BLOCK
      ?auto_56636 - BLOCK
      ?auto_56637 - BLOCK
      ?auto_56638 - BLOCK
      ?auto_56639 - BLOCK
    )
    :vars
    (
      ?auto_56640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56639 ?auto_56640 ) ( ON-TABLE ?auto_56633 ) ( ON ?auto_56634 ?auto_56633 ) ( ON ?auto_56635 ?auto_56634 ) ( ON ?auto_56636 ?auto_56635 ) ( not ( = ?auto_56633 ?auto_56634 ) ) ( not ( = ?auto_56633 ?auto_56635 ) ) ( not ( = ?auto_56633 ?auto_56636 ) ) ( not ( = ?auto_56633 ?auto_56637 ) ) ( not ( = ?auto_56633 ?auto_56638 ) ) ( not ( = ?auto_56633 ?auto_56639 ) ) ( not ( = ?auto_56633 ?auto_56640 ) ) ( not ( = ?auto_56634 ?auto_56635 ) ) ( not ( = ?auto_56634 ?auto_56636 ) ) ( not ( = ?auto_56634 ?auto_56637 ) ) ( not ( = ?auto_56634 ?auto_56638 ) ) ( not ( = ?auto_56634 ?auto_56639 ) ) ( not ( = ?auto_56634 ?auto_56640 ) ) ( not ( = ?auto_56635 ?auto_56636 ) ) ( not ( = ?auto_56635 ?auto_56637 ) ) ( not ( = ?auto_56635 ?auto_56638 ) ) ( not ( = ?auto_56635 ?auto_56639 ) ) ( not ( = ?auto_56635 ?auto_56640 ) ) ( not ( = ?auto_56636 ?auto_56637 ) ) ( not ( = ?auto_56636 ?auto_56638 ) ) ( not ( = ?auto_56636 ?auto_56639 ) ) ( not ( = ?auto_56636 ?auto_56640 ) ) ( not ( = ?auto_56637 ?auto_56638 ) ) ( not ( = ?auto_56637 ?auto_56639 ) ) ( not ( = ?auto_56637 ?auto_56640 ) ) ( not ( = ?auto_56638 ?auto_56639 ) ) ( not ( = ?auto_56638 ?auto_56640 ) ) ( not ( = ?auto_56639 ?auto_56640 ) ) ( ON ?auto_56638 ?auto_56639 ) ( CLEAR ?auto_56636 ) ( ON ?auto_56637 ?auto_56638 ) ( CLEAR ?auto_56637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56633 ?auto_56634 ?auto_56635 ?auto_56636 ?auto_56637 )
      ( MAKE-7PILE ?auto_56633 ?auto_56634 ?auto_56635 ?auto_56636 ?auto_56637 ?auto_56638 ?auto_56639 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_56663 - BLOCK
      ?auto_56664 - BLOCK
      ?auto_56665 - BLOCK
      ?auto_56666 - BLOCK
      ?auto_56667 - BLOCK
      ?auto_56668 - BLOCK
      ?auto_56669 - BLOCK
    )
    :vars
    (
      ?auto_56670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56669 ?auto_56670 ) ( ON-TABLE ?auto_56663 ) ( ON ?auto_56664 ?auto_56663 ) ( ON ?auto_56665 ?auto_56664 ) ( not ( = ?auto_56663 ?auto_56664 ) ) ( not ( = ?auto_56663 ?auto_56665 ) ) ( not ( = ?auto_56663 ?auto_56666 ) ) ( not ( = ?auto_56663 ?auto_56667 ) ) ( not ( = ?auto_56663 ?auto_56668 ) ) ( not ( = ?auto_56663 ?auto_56669 ) ) ( not ( = ?auto_56663 ?auto_56670 ) ) ( not ( = ?auto_56664 ?auto_56665 ) ) ( not ( = ?auto_56664 ?auto_56666 ) ) ( not ( = ?auto_56664 ?auto_56667 ) ) ( not ( = ?auto_56664 ?auto_56668 ) ) ( not ( = ?auto_56664 ?auto_56669 ) ) ( not ( = ?auto_56664 ?auto_56670 ) ) ( not ( = ?auto_56665 ?auto_56666 ) ) ( not ( = ?auto_56665 ?auto_56667 ) ) ( not ( = ?auto_56665 ?auto_56668 ) ) ( not ( = ?auto_56665 ?auto_56669 ) ) ( not ( = ?auto_56665 ?auto_56670 ) ) ( not ( = ?auto_56666 ?auto_56667 ) ) ( not ( = ?auto_56666 ?auto_56668 ) ) ( not ( = ?auto_56666 ?auto_56669 ) ) ( not ( = ?auto_56666 ?auto_56670 ) ) ( not ( = ?auto_56667 ?auto_56668 ) ) ( not ( = ?auto_56667 ?auto_56669 ) ) ( not ( = ?auto_56667 ?auto_56670 ) ) ( not ( = ?auto_56668 ?auto_56669 ) ) ( not ( = ?auto_56668 ?auto_56670 ) ) ( not ( = ?auto_56669 ?auto_56670 ) ) ( ON ?auto_56668 ?auto_56669 ) ( ON ?auto_56667 ?auto_56668 ) ( CLEAR ?auto_56665 ) ( ON ?auto_56666 ?auto_56667 ) ( CLEAR ?auto_56666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56663 ?auto_56664 ?auto_56665 ?auto_56666 )
      ( MAKE-7PILE ?auto_56663 ?auto_56664 ?auto_56665 ?auto_56666 ?auto_56667 ?auto_56668 ?auto_56669 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_56693 - BLOCK
      ?auto_56694 - BLOCK
      ?auto_56695 - BLOCK
      ?auto_56696 - BLOCK
      ?auto_56697 - BLOCK
      ?auto_56698 - BLOCK
      ?auto_56699 - BLOCK
    )
    :vars
    (
      ?auto_56700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56699 ?auto_56700 ) ( ON-TABLE ?auto_56693 ) ( ON ?auto_56694 ?auto_56693 ) ( not ( = ?auto_56693 ?auto_56694 ) ) ( not ( = ?auto_56693 ?auto_56695 ) ) ( not ( = ?auto_56693 ?auto_56696 ) ) ( not ( = ?auto_56693 ?auto_56697 ) ) ( not ( = ?auto_56693 ?auto_56698 ) ) ( not ( = ?auto_56693 ?auto_56699 ) ) ( not ( = ?auto_56693 ?auto_56700 ) ) ( not ( = ?auto_56694 ?auto_56695 ) ) ( not ( = ?auto_56694 ?auto_56696 ) ) ( not ( = ?auto_56694 ?auto_56697 ) ) ( not ( = ?auto_56694 ?auto_56698 ) ) ( not ( = ?auto_56694 ?auto_56699 ) ) ( not ( = ?auto_56694 ?auto_56700 ) ) ( not ( = ?auto_56695 ?auto_56696 ) ) ( not ( = ?auto_56695 ?auto_56697 ) ) ( not ( = ?auto_56695 ?auto_56698 ) ) ( not ( = ?auto_56695 ?auto_56699 ) ) ( not ( = ?auto_56695 ?auto_56700 ) ) ( not ( = ?auto_56696 ?auto_56697 ) ) ( not ( = ?auto_56696 ?auto_56698 ) ) ( not ( = ?auto_56696 ?auto_56699 ) ) ( not ( = ?auto_56696 ?auto_56700 ) ) ( not ( = ?auto_56697 ?auto_56698 ) ) ( not ( = ?auto_56697 ?auto_56699 ) ) ( not ( = ?auto_56697 ?auto_56700 ) ) ( not ( = ?auto_56698 ?auto_56699 ) ) ( not ( = ?auto_56698 ?auto_56700 ) ) ( not ( = ?auto_56699 ?auto_56700 ) ) ( ON ?auto_56698 ?auto_56699 ) ( ON ?auto_56697 ?auto_56698 ) ( ON ?auto_56696 ?auto_56697 ) ( CLEAR ?auto_56694 ) ( ON ?auto_56695 ?auto_56696 ) ( CLEAR ?auto_56695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56693 ?auto_56694 ?auto_56695 )
      ( MAKE-7PILE ?auto_56693 ?auto_56694 ?auto_56695 ?auto_56696 ?auto_56697 ?auto_56698 ?auto_56699 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_56723 - BLOCK
      ?auto_56724 - BLOCK
      ?auto_56725 - BLOCK
      ?auto_56726 - BLOCK
      ?auto_56727 - BLOCK
      ?auto_56728 - BLOCK
      ?auto_56729 - BLOCK
    )
    :vars
    (
      ?auto_56730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56729 ?auto_56730 ) ( ON-TABLE ?auto_56723 ) ( not ( = ?auto_56723 ?auto_56724 ) ) ( not ( = ?auto_56723 ?auto_56725 ) ) ( not ( = ?auto_56723 ?auto_56726 ) ) ( not ( = ?auto_56723 ?auto_56727 ) ) ( not ( = ?auto_56723 ?auto_56728 ) ) ( not ( = ?auto_56723 ?auto_56729 ) ) ( not ( = ?auto_56723 ?auto_56730 ) ) ( not ( = ?auto_56724 ?auto_56725 ) ) ( not ( = ?auto_56724 ?auto_56726 ) ) ( not ( = ?auto_56724 ?auto_56727 ) ) ( not ( = ?auto_56724 ?auto_56728 ) ) ( not ( = ?auto_56724 ?auto_56729 ) ) ( not ( = ?auto_56724 ?auto_56730 ) ) ( not ( = ?auto_56725 ?auto_56726 ) ) ( not ( = ?auto_56725 ?auto_56727 ) ) ( not ( = ?auto_56725 ?auto_56728 ) ) ( not ( = ?auto_56725 ?auto_56729 ) ) ( not ( = ?auto_56725 ?auto_56730 ) ) ( not ( = ?auto_56726 ?auto_56727 ) ) ( not ( = ?auto_56726 ?auto_56728 ) ) ( not ( = ?auto_56726 ?auto_56729 ) ) ( not ( = ?auto_56726 ?auto_56730 ) ) ( not ( = ?auto_56727 ?auto_56728 ) ) ( not ( = ?auto_56727 ?auto_56729 ) ) ( not ( = ?auto_56727 ?auto_56730 ) ) ( not ( = ?auto_56728 ?auto_56729 ) ) ( not ( = ?auto_56728 ?auto_56730 ) ) ( not ( = ?auto_56729 ?auto_56730 ) ) ( ON ?auto_56728 ?auto_56729 ) ( ON ?auto_56727 ?auto_56728 ) ( ON ?auto_56726 ?auto_56727 ) ( ON ?auto_56725 ?auto_56726 ) ( CLEAR ?auto_56723 ) ( ON ?auto_56724 ?auto_56725 ) ( CLEAR ?auto_56724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56723 ?auto_56724 )
      ( MAKE-7PILE ?auto_56723 ?auto_56724 ?auto_56725 ?auto_56726 ?auto_56727 ?auto_56728 ?auto_56729 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_56753 - BLOCK
      ?auto_56754 - BLOCK
      ?auto_56755 - BLOCK
      ?auto_56756 - BLOCK
      ?auto_56757 - BLOCK
      ?auto_56758 - BLOCK
      ?auto_56759 - BLOCK
    )
    :vars
    (
      ?auto_56760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56759 ?auto_56760 ) ( not ( = ?auto_56753 ?auto_56754 ) ) ( not ( = ?auto_56753 ?auto_56755 ) ) ( not ( = ?auto_56753 ?auto_56756 ) ) ( not ( = ?auto_56753 ?auto_56757 ) ) ( not ( = ?auto_56753 ?auto_56758 ) ) ( not ( = ?auto_56753 ?auto_56759 ) ) ( not ( = ?auto_56753 ?auto_56760 ) ) ( not ( = ?auto_56754 ?auto_56755 ) ) ( not ( = ?auto_56754 ?auto_56756 ) ) ( not ( = ?auto_56754 ?auto_56757 ) ) ( not ( = ?auto_56754 ?auto_56758 ) ) ( not ( = ?auto_56754 ?auto_56759 ) ) ( not ( = ?auto_56754 ?auto_56760 ) ) ( not ( = ?auto_56755 ?auto_56756 ) ) ( not ( = ?auto_56755 ?auto_56757 ) ) ( not ( = ?auto_56755 ?auto_56758 ) ) ( not ( = ?auto_56755 ?auto_56759 ) ) ( not ( = ?auto_56755 ?auto_56760 ) ) ( not ( = ?auto_56756 ?auto_56757 ) ) ( not ( = ?auto_56756 ?auto_56758 ) ) ( not ( = ?auto_56756 ?auto_56759 ) ) ( not ( = ?auto_56756 ?auto_56760 ) ) ( not ( = ?auto_56757 ?auto_56758 ) ) ( not ( = ?auto_56757 ?auto_56759 ) ) ( not ( = ?auto_56757 ?auto_56760 ) ) ( not ( = ?auto_56758 ?auto_56759 ) ) ( not ( = ?auto_56758 ?auto_56760 ) ) ( not ( = ?auto_56759 ?auto_56760 ) ) ( ON ?auto_56758 ?auto_56759 ) ( ON ?auto_56757 ?auto_56758 ) ( ON ?auto_56756 ?auto_56757 ) ( ON ?auto_56755 ?auto_56756 ) ( ON ?auto_56754 ?auto_56755 ) ( ON ?auto_56753 ?auto_56754 ) ( CLEAR ?auto_56753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56753 )
      ( MAKE-7PILE ?auto_56753 ?auto_56754 ?auto_56755 ?auto_56756 ?auto_56757 ?auto_56758 ?auto_56759 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_56784 - BLOCK
      ?auto_56785 - BLOCK
      ?auto_56786 - BLOCK
      ?auto_56787 - BLOCK
      ?auto_56788 - BLOCK
      ?auto_56789 - BLOCK
      ?auto_56790 - BLOCK
      ?auto_56791 - BLOCK
    )
    :vars
    (
      ?auto_56792 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_56790 ) ( ON ?auto_56791 ?auto_56792 ) ( CLEAR ?auto_56791 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56784 ) ( ON ?auto_56785 ?auto_56784 ) ( ON ?auto_56786 ?auto_56785 ) ( ON ?auto_56787 ?auto_56786 ) ( ON ?auto_56788 ?auto_56787 ) ( ON ?auto_56789 ?auto_56788 ) ( ON ?auto_56790 ?auto_56789 ) ( not ( = ?auto_56784 ?auto_56785 ) ) ( not ( = ?auto_56784 ?auto_56786 ) ) ( not ( = ?auto_56784 ?auto_56787 ) ) ( not ( = ?auto_56784 ?auto_56788 ) ) ( not ( = ?auto_56784 ?auto_56789 ) ) ( not ( = ?auto_56784 ?auto_56790 ) ) ( not ( = ?auto_56784 ?auto_56791 ) ) ( not ( = ?auto_56784 ?auto_56792 ) ) ( not ( = ?auto_56785 ?auto_56786 ) ) ( not ( = ?auto_56785 ?auto_56787 ) ) ( not ( = ?auto_56785 ?auto_56788 ) ) ( not ( = ?auto_56785 ?auto_56789 ) ) ( not ( = ?auto_56785 ?auto_56790 ) ) ( not ( = ?auto_56785 ?auto_56791 ) ) ( not ( = ?auto_56785 ?auto_56792 ) ) ( not ( = ?auto_56786 ?auto_56787 ) ) ( not ( = ?auto_56786 ?auto_56788 ) ) ( not ( = ?auto_56786 ?auto_56789 ) ) ( not ( = ?auto_56786 ?auto_56790 ) ) ( not ( = ?auto_56786 ?auto_56791 ) ) ( not ( = ?auto_56786 ?auto_56792 ) ) ( not ( = ?auto_56787 ?auto_56788 ) ) ( not ( = ?auto_56787 ?auto_56789 ) ) ( not ( = ?auto_56787 ?auto_56790 ) ) ( not ( = ?auto_56787 ?auto_56791 ) ) ( not ( = ?auto_56787 ?auto_56792 ) ) ( not ( = ?auto_56788 ?auto_56789 ) ) ( not ( = ?auto_56788 ?auto_56790 ) ) ( not ( = ?auto_56788 ?auto_56791 ) ) ( not ( = ?auto_56788 ?auto_56792 ) ) ( not ( = ?auto_56789 ?auto_56790 ) ) ( not ( = ?auto_56789 ?auto_56791 ) ) ( not ( = ?auto_56789 ?auto_56792 ) ) ( not ( = ?auto_56790 ?auto_56791 ) ) ( not ( = ?auto_56790 ?auto_56792 ) ) ( not ( = ?auto_56791 ?auto_56792 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56791 ?auto_56792 )
      ( !STACK ?auto_56791 ?auto_56790 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_56818 - BLOCK
      ?auto_56819 - BLOCK
      ?auto_56820 - BLOCK
      ?auto_56821 - BLOCK
      ?auto_56822 - BLOCK
      ?auto_56823 - BLOCK
      ?auto_56824 - BLOCK
      ?auto_56825 - BLOCK
    )
    :vars
    (
      ?auto_56826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56825 ?auto_56826 ) ( ON-TABLE ?auto_56818 ) ( ON ?auto_56819 ?auto_56818 ) ( ON ?auto_56820 ?auto_56819 ) ( ON ?auto_56821 ?auto_56820 ) ( ON ?auto_56822 ?auto_56821 ) ( ON ?auto_56823 ?auto_56822 ) ( not ( = ?auto_56818 ?auto_56819 ) ) ( not ( = ?auto_56818 ?auto_56820 ) ) ( not ( = ?auto_56818 ?auto_56821 ) ) ( not ( = ?auto_56818 ?auto_56822 ) ) ( not ( = ?auto_56818 ?auto_56823 ) ) ( not ( = ?auto_56818 ?auto_56824 ) ) ( not ( = ?auto_56818 ?auto_56825 ) ) ( not ( = ?auto_56818 ?auto_56826 ) ) ( not ( = ?auto_56819 ?auto_56820 ) ) ( not ( = ?auto_56819 ?auto_56821 ) ) ( not ( = ?auto_56819 ?auto_56822 ) ) ( not ( = ?auto_56819 ?auto_56823 ) ) ( not ( = ?auto_56819 ?auto_56824 ) ) ( not ( = ?auto_56819 ?auto_56825 ) ) ( not ( = ?auto_56819 ?auto_56826 ) ) ( not ( = ?auto_56820 ?auto_56821 ) ) ( not ( = ?auto_56820 ?auto_56822 ) ) ( not ( = ?auto_56820 ?auto_56823 ) ) ( not ( = ?auto_56820 ?auto_56824 ) ) ( not ( = ?auto_56820 ?auto_56825 ) ) ( not ( = ?auto_56820 ?auto_56826 ) ) ( not ( = ?auto_56821 ?auto_56822 ) ) ( not ( = ?auto_56821 ?auto_56823 ) ) ( not ( = ?auto_56821 ?auto_56824 ) ) ( not ( = ?auto_56821 ?auto_56825 ) ) ( not ( = ?auto_56821 ?auto_56826 ) ) ( not ( = ?auto_56822 ?auto_56823 ) ) ( not ( = ?auto_56822 ?auto_56824 ) ) ( not ( = ?auto_56822 ?auto_56825 ) ) ( not ( = ?auto_56822 ?auto_56826 ) ) ( not ( = ?auto_56823 ?auto_56824 ) ) ( not ( = ?auto_56823 ?auto_56825 ) ) ( not ( = ?auto_56823 ?auto_56826 ) ) ( not ( = ?auto_56824 ?auto_56825 ) ) ( not ( = ?auto_56824 ?auto_56826 ) ) ( not ( = ?auto_56825 ?auto_56826 ) ) ( CLEAR ?auto_56823 ) ( ON ?auto_56824 ?auto_56825 ) ( CLEAR ?auto_56824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_56818 ?auto_56819 ?auto_56820 ?auto_56821 ?auto_56822 ?auto_56823 ?auto_56824 )
      ( MAKE-8PILE ?auto_56818 ?auto_56819 ?auto_56820 ?auto_56821 ?auto_56822 ?auto_56823 ?auto_56824 ?auto_56825 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_56852 - BLOCK
      ?auto_56853 - BLOCK
      ?auto_56854 - BLOCK
      ?auto_56855 - BLOCK
      ?auto_56856 - BLOCK
      ?auto_56857 - BLOCK
      ?auto_56858 - BLOCK
      ?auto_56859 - BLOCK
    )
    :vars
    (
      ?auto_56860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56859 ?auto_56860 ) ( ON-TABLE ?auto_56852 ) ( ON ?auto_56853 ?auto_56852 ) ( ON ?auto_56854 ?auto_56853 ) ( ON ?auto_56855 ?auto_56854 ) ( ON ?auto_56856 ?auto_56855 ) ( not ( = ?auto_56852 ?auto_56853 ) ) ( not ( = ?auto_56852 ?auto_56854 ) ) ( not ( = ?auto_56852 ?auto_56855 ) ) ( not ( = ?auto_56852 ?auto_56856 ) ) ( not ( = ?auto_56852 ?auto_56857 ) ) ( not ( = ?auto_56852 ?auto_56858 ) ) ( not ( = ?auto_56852 ?auto_56859 ) ) ( not ( = ?auto_56852 ?auto_56860 ) ) ( not ( = ?auto_56853 ?auto_56854 ) ) ( not ( = ?auto_56853 ?auto_56855 ) ) ( not ( = ?auto_56853 ?auto_56856 ) ) ( not ( = ?auto_56853 ?auto_56857 ) ) ( not ( = ?auto_56853 ?auto_56858 ) ) ( not ( = ?auto_56853 ?auto_56859 ) ) ( not ( = ?auto_56853 ?auto_56860 ) ) ( not ( = ?auto_56854 ?auto_56855 ) ) ( not ( = ?auto_56854 ?auto_56856 ) ) ( not ( = ?auto_56854 ?auto_56857 ) ) ( not ( = ?auto_56854 ?auto_56858 ) ) ( not ( = ?auto_56854 ?auto_56859 ) ) ( not ( = ?auto_56854 ?auto_56860 ) ) ( not ( = ?auto_56855 ?auto_56856 ) ) ( not ( = ?auto_56855 ?auto_56857 ) ) ( not ( = ?auto_56855 ?auto_56858 ) ) ( not ( = ?auto_56855 ?auto_56859 ) ) ( not ( = ?auto_56855 ?auto_56860 ) ) ( not ( = ?auto_56856 ?auto_56857 ) ) ( not ( = ?auto_56856 ?auto_56858 ) ) ( not ( = ?auto_56856 ?auto_56859 ) ) ( not ( = ?auto_56856 ?auto_56860 ) ) ( not ( = ?auto_56857 ?auto_56858 ) ) ( not ( = ?auto_56857 ?auto_56859 ) ) ( not ( = ?auto_56857 ?auto_56860 ) ) ( not ( = ?auto_56858 ?auto_56859 ) ) ( not ( = ?auto_56858 ?auto_56860 ) ) ( not ( = ?auto_56859 ?auto_56860 ) ) ( ON ?auto_56858 ?auto_56859 ) ( CLEAR ?auto_56856 ) ( ON ?auto_56857 ?auto_56858 ) ( CLEAR ?auto_56857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56852 ?auto_56853 ?auto_56854 ?auto_56855 ?auto_56856 ?auto_56857 )
      ( MAKE-8PILE ?auto_56852 ?auto_56853 ?auto_56854 ?auto_56855 ?auto_56856 ?auto_56857 ?auto_56858 ?auto_56859 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_56886 - BLOCK
      ?auto_56887 - BLOCK
      ?auto_56888 - BLOCK
      ?auto_56889 - BLOCK
      ?auto_56890 - BLOCK
      ?auto_56891 - BLOCK
      ?auto_56892 - BLOCK
      ?auto_56893 - BLOCK
    )
    :vars
    (
      ?auto_56894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56893 ?auto_56894 ) ( ON-TABLE ?auto_56886 ) ( ON ?auto_56887 ?auto_56886 ) ( ON ?auto_56888 ?auto_56887 ) ( ON ?auto_56889 ?auto_56888 ) ( not ( = ?auto_56886 ?auto_56887 ) ) ( not ( = ?auto_56886 ?auto_56888 ) ) ( not ( = ?auto_56886 ?auto_56889 ) ) ( not ( = ?auto_56886 ?auto_56890 ) ) ( not ( = ?auto_56886 ?auto_56891 ) ) ( not ( = ?auto_56886 ?auto_56892 ) ) ( not ( = ?auto_56886 ?auto_56893 ) ) ( not ( = ?auto_56886 ?auto_56894 ) ) ( not ( = ?auto_56887 ?auto_56888 ) ) ( not ( = ?auto_56887 ?auto_56889 ) ) ( not ( = ?auto_56887 ?auto_56890 ) ) ( not ( = ?auto_56887 ?auto_56891 ) ) ( not ( = ?auto_56887 ?auto_56892 ) ) ( not ( = ?auto_56887 ?auto_56893 ) ) ( not ( = ?auto_56887 ?auto_56894 ) ) ( not ( = ?auto_56888 ?auto_56889 ) ) ( not ( = ?auto_56888 ?auto_56890 ) ) ( not ( = ?auto_56888 ?auto_56891 ) ) ( not ( = ?auto_56888 ?auto_56892 ) ) ( not ( = ?auto_56888 ?auto_56893 ) ) ( not ( = ?auto_56888 ?auto_56894 ) ) ( not ( = ?auto_56889 ?auto_56890 ) ) ( not ( = ?auto_56889 ?auto_56891 ) ) ( not ( = ?auto_56889 ?auto_56892 ) ) ( not ( = ?auto_56889 ?auto_56893 ) ) ( not ( = ?auto_56889 ?auto_56894 ) ) ( not ( = ?auto_56890 ?auto_56891 ) ) ( not ( = ?auto_56890 ?auto_56892 ) ) ( not ( = ?auto_56890 ?auto_56893 ) ) ( not ( = ?auto_56890 ?auto_56894 ) ) ( not ( = ?auto_56891 ?auto_56892 ) ) ( not ( = ?auto_56891 ?auto_56893 ) ) ( not ( = ?auto_56891 ?auto_56894 ) ) ( not ( = ?auto_56892 ?auto_56893 ) ) ( not ( = ?auto_56892 ?auto_56894 ) ) ( not ( = ?auto_56893 ?auto_56894 ) ) ( ON ?auto_56892 ?auto_56893 ) ( ON ?auto_56891 ?auto_56892 ) ( CLEAR ?auto_56889 ) ( ON ?auto_56890 ?auto_56891 ) ( CLEAR ?auto_56890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56886 ?auto_56887 ?auto_56888 ?auto_56889 ?auto_56890 )
      ( MAKE-8PILE ?auto_56886 ?auto_56887 ?auto_56888 ?auto_56889 ?auto_56890 ?auto_56891 ?auto_56892 ?auto_56893 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_56920 - BLOCK
      ?auto_56921 - BLOCK
      ?auto_56922 - BLOCK
      ?auto_56923 - BLOCK
      ?auto_56924 - BLOCK
      ?auto_56925 - BLOCK
      ?auto_56926 - BLOCK
      ?auto_56927 - BLOCK
    )
    :vars
    (
      ?auto_56928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56927 ?auto_56928 ) ( ON-TABLE ?auto_56920 ) ( ON ?auto_56921 ?auto_56920 ) ( ON ?auto_56922 ?auto_56921 ) ( not ( = ?auto_56920 ?auto_56921 ) ) ( not ( = ?auto_56920 ?auto_56922 ) ) ( not ( = ?auto_56920 ?auto_56923 ) ) ( not ( = ?auto_56920 ?auto_56924 ) ) ( not ( = ?auto_56920 ?auto_56925 ) ) ( not ( = ?auto_56920 ?auto_56926 ) ) ( not ( = ?auto_56920 ?auto_56927 ) ) ( not ( = ?auto_56920 ?auto_56928 ) ) ( not ( = ?auto_56921 ?auto_56922 ) ) ( not ( = ?auto_56921 ?auto_56923 ) ) ( not ( = ?auto_56921 ?auto_56924 ) ) ( not ( = ?auto_56921 ?auto_56925 ) ) ( not ( = ?auto_56921 ?auto_56926 ) ) ( not ( = ?auto_56921 ?auto_56927 ) ) ( not ( = ?auto_56921 ?auto_56928 ) ) ( not ( = ?auto_56922 ?auto_56923 ) ) ( not ( = ?auto_56922 ?auto_56924 ) ) ( not ( = ?auto_56922 ?auto_56925 ) ) ( not ( = ?auto_56922 ?auto_56926 ) ) ( not ( = ?auto_56922 ?auto_56927 ) ) ( not ( = ?auto_56922 ?auto_56928 ) ) ( not ( = ?auto_56923 ?auto_56924 ) ) ( not ( = ?auto_56923 ?auto_56925 ) ) ( not ( = ?auto_56923 ?auto_56926 ) ) ( not ( = ?auto_56923 ?auto_56927 ) ) ( not ( = ?auto_56923 ?auto_56928 ) ) ( not ( = ?auto_56924 ?auto_56925 ) ) ( not ( = ?auto_56924 ?auto_56926 ) ) ( not ( = ?auto_56924 ?auto_56927 ) ) ( not ( = ?auto_56924 ?auto_56928 ) ) ( not ( = ?auto_56925 ?auto_56926 ) ) ( not ( = ?auto_56925 ?auto_56927 ) ) ( not ( = ?auto_56925 ?auto_56928 ) ) ( not ( = ?auto_56926 ?auto_56927 ) ) ( not ( = ?auto_56926 ?auto_56928 ) ) ( not ( = ?auto_56927 ?auto_56928 ) ) ( ON ?auto_56926 ?auto_56927 ) ( ON ?auto_56925 ?auto_56926 ) ( ON ?auto_56924 ?auto_56925 ) ( CLEAR ?auto_56922 ) ( ON ?auto_56923 ?auto_56924 ) ( CLEAR ?auto_56923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56920 ?auto_56921 ?auto_56922 ?auto_56923 )
      ( MAKE-8PILE ?auto_56920 ?auto_56921 ?auto_56922 ?auto_56923 ?auto_56924 ?auto_56925 ?auto_56926 ?auto_56927 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_56954 - BLOCK
      ?auto_56955 - BLOCK
      ?auto_56956 - BLOCK
      ?auto_56957 - BLOCK
      ?auto_56958 - BLOCK
      ?auto_56959 - BLOCK
      ?auto_56960 - BLOCK
      ?auto_56961 - BLOCK
    )
    :vars
    (
      ?auto_56962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56961 ?auto_56962 ) ( ON-TABLE ?auto_56954 ) ( ON ?auto_56955 ?auto_56954 ) ( not ( = ?auto_56954 ?auto_56955 ) ) ( not ( = ?auto_56954 ?auto_56956 ) ) ( not ( = ?auto_56954 ?auto_56957 ) ) ( not ( = ?auto_56954 ?auto_56958 ) ) ( not ( = ?auto_56954 ?auto_56959 ) ) ( not ( = ?auto_56954 ?auto_56960 ) ) ( not ( = ?auto_56954 ?auto_56961 ) ) ( not ( = ?auto_56954 ?auto_56962 ) ) ( not ( = ?auto_56955 ?auto_56956 ) ) ( not ( = ?auto_56955 ?auto_56957 ) ) ( not ( = ?auto_56955 ?auto_56958 ) ) ( not ( = ?auto_56955 ?auto_56959 ) ) ( not ( = ?auto_56955 ?auto_56960 ) ) ( not ( = ?auto_56955 ?auto_56961 ) ) ( not ( = ?auto_56955 ?auto_56962 ) ) ( not ( = ?auto_56956 ?auto_56957 ) ) ( not ( = ?auto_56956 ?auto_56958 ) ) ( not ( = ?auto_56956 ?auto_56959 ) ) ( not ( = ?auto_56956 ?auto_56960 ) ) ( not ( = ?auto_56956 ?auto_56961 ) ) ( not ( = ?auto_56956 ?auto_56962 ) ) ( not ( = ?auto_56957 ?auto_56958 ) ) ( not ( = ?auto_56957 ?auto_56959 ) ) ( not ( = ?auto_56957 ?auto_56960 ) ) ( not ( = ?auto_56957 ?auto_56961 ) ) ( not ( = ?auto_56957 ?auto_56962 ) ) ( not ( = ?auto_56958 ?auto_56959 ) ) ( not ( = ?auto_56958 ?auto_56960 ) ) ( not ( = ?auto_56958 ?auto_56961 ) ) ( not ( = ?auto_56958 ?auto_56962 ) ) ( not ( = ?auto_56959 ?auto_56960 ) ) ( not ( = ?auto_56959 ?auto_56961 ) ) ( not ( = ?auto_56959 ?auto_56962 ) ) ( not ( = ?auto_56960 ?auto_56961 ) ) ( not ( = ?auto_56960 ?auto_56962 ) ) ( not ( = ?auto_56961 ?auto_56962 ) ) ( ON ?auto_56960 ?auto_56961 ) ( ON ?auto_56959 ?auto_56960 ) ( ON ?auto_56958 ?auto_56959 ) ( ON ?auto_56957 ?auto_56958 ) ( CLEAR ?auto_56955 ) ( ON ?auto_56956 ?auto_56957 ) ( CLEAR ?auto_56956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56954 ?auto_56955 ?auto_56956 )
      ( MAKE-8PILE ?auto_56954 ?auto_56955 ?auto_56956 ?auto_56957 ?auto_56958 ?auto_56959 ?auto_56960 ?auto_56961 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_56988 - BLOCK
      ?auto_56989 - BLOCK
      ?auto_56990 - BLOCK
      ?auto_56991 - BLOCK
      ?auto_56992 - BLOCK
      ?auto_56993 - BLOCK
      ?auto_56994 - BLOCK
      ?auto_56995 - BLOCK
    )
    :vars
    (
      ?auto_56996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56995 ?auto_56996 ) ( ON-TABLE ?auto_56988 ) ( not ( = ?auto_56988 ?auto_56989 ) ) ( not ( = ?auto_56988 ?auto_56990 ) ) ( not ( = ?auto_56988 ?auto_56991 ) ) ( not ( = ?auto_56988 ?auto_56992 ) ) ( not ( = ?auto_56988 ?auto_56993 ) ) ( not ( = ?auto_56988 ?auto_56994 ) ) ( not ( = ?auto_56988 ?auto_56995 ) ) ( not ( = ?auto_56988 ?auto_56996 ) ) ( not ( = ?auto_56989 ?auto_56990 ) ) ( not ( = ?auto_56989 ?auto_56991 ) ) ( not ( = ?auto_56989 ?auto_56992 ) ) ( not ( = ?auto_56989 ?auto_56993 ) ) ( not ( = ?auto_56989 ?auto_56994 ) ) ( not ( = ?auto_56989 ?auto_56995 ) ) ( not ( = ?auto_56989 ?auto_56996 ) ) ( not ( = ?auto_56990 ?auto_56991 ) ) ( not ( = ?auto_56990 ?auto_56992 ) ) ( not ( = ?auto_56990 ?auto_56993 ) ) ( not ( = ?auto_56990 ?auto_56994 ) ) ( not ( = ?auto_56990 ?auto_56995 ) ) ( not ( = ?auto_56990 ?auto_56996 ) ) ( not ( = ?auto_56991 ?auto_56992 ) ) ( not ( = ?auto_56991 ?auto_56993 ) ) ( not ( = ?auto_56991 ?auto_56994 ) ) ( not ( = ?auto_56991 ?auto_56995 ) ) ( not ( = ?auto_56991 ?auto_56996 ) ) ( not ( = ?auto_56992 ?auto_56993 ) ) ( not ( = ?auto_56992 ?auto_56994 ) ) ( not ( = ?auto_56992 ?auto_56995 ) ) ( not ( = ?auto_56992 ?auto_56996 ) ) ( not ( = ?auto_56993 ?auto_56994 ) ) ( not ( = ?auto_56993 ?auto_56995 ) ) ( not ( = ?auto_56993 ?auto_56996 ) ) ( not ( = ?auto_56994 ?auto_56995 ) ) ( not ( = ?auto_56994 ?auto_56996 ) ) ( not ( = ?auto_56995 ?auto_56996 ) ) ( ON ?auto_56994 ?auto_56995 ) ( ON ?auto_56993 ?auto_56994 ) ( ON ?auto_56992 ?auto_56993 ) ( ON ?auto_56991 ?auto_56992 ) ( ON ?auto_56990 ?auto_56991 ) ( CLEAR ?auto_56988 ) ( ON ?auto_56989 ?auto_56990 ) ( CLEAR ?auto_56989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56988 ?auto_56989 )
      ( MAKE-8PILE ?auto_56988 ?auto_56989 ?auto_56990 ?auto_56991 ?auto_56992 ?auto_56993 ?auto_56994 ?auto_56995 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_57022 - BLOCK
      ?auto_57023 - BLOCK
      ?auto_57024 - BLOCK
      ?auto_57025 - BLOCK
      ?auto_57026 - BLOCK
      ?auto_57027 - BLOCK
      ?auto_57028 - BLOCK
      ?auto_57029 - BLOCK
    )
    :vars
    (
      ?auto_57030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57029 ?auto_57030 ) ( not ( = ?auto_57022 ?auto_57023 ) ) ( not ( = ?auto_57022 ?auto_57024 ) ) ( not ( = ?auto_57022 ?auto_57025 ) ) ( not ( = ?auto_57022 ?auto_57026 ) ) ( not ( = ?auto_57022 ?auto_57027 ) ) ( not ( = ?auto_57022 ?auto_57028 ) ) ( not ( = ?auto_57022 ?auto_57029 ) ) ( not ( = ?auto_57022 ?auto_57030 ) ) ( not ( = ?auto_57023 ?auto_57024 ) ) ( not ( = ?auto_57023 ?auto_57025 ) ) ( not ( = ?auto_57023 ?auto_57026 ) ) ( not ( = ?auto_57023 ?auto_57027 ) ) ( not ( = ?auto_57023 ?auto_57028 ) ) ( not ( = ?auto_57023 ?auto_57029 ) ) ( not ( = ?auto_57023 ?auto_57030 ) ) ( not ( = ?auto_57024 ?auto_57025 ) ) ( not ( = ?auto_57024 ?auto_57026 ) ) ( not ( = ?auto_57024 ?auto_57027 ) ) ( not ( = ?auto_57024 ?auto_57028 ) ) ( not ( = ?auto_57024 ?auto_57029 ) ) ( not ( = ?auto_57024 ?auto_57030 ) ) ( not ( = ?auto_57025 ?auto_57026 ) ) ( not ( = ?auto_57025 ?auto_57027 ) ) ( not ( = ?auto_57025 ?auto_57028 ) ) ( not ( = ?auto_57025 ?auto_57029 ) ) ( not ( = ?auto_57025 ?auto_57030 ) ) ( not ( = ?auto_57026 ?auto_57027 ) ) ( not ( = ?auto_57026 ?auto_57028 ) ) ( not ( = ?auto_57026 ?auto_57029 ) ) ( not ( = ?auto_57026 ?auto_57030 ) ) ( not ( = ?auto_57027 ?auto_57028 ) ) ( not ( = ?auto_57027 ?auto_57029 ) ) ( not ( = ?auto_57027 ?auto_57030 ) ) ( not ( = ?auto_57028 ?auto_57029 ) ) ( not ( = ?auto_57028 ?auto_57030 ) ) ( not ( = ?auto_57029 ?auto_57030 ) ) ( ON ?auto_57028 ?auto_57029 ) ( ON ?auto_57027 ?auto_57028 ) ( ON ?auto_57026 ?auto_57027 ) ( ON ?auto_57025 ?auto_57026 ) ( ON ?auto_57024 ?auto_57025 ) ( ON ?auto_57023 ?auto_57024 ) ( ON ?auto_57022 ?auto_57023 ) ( CLEAR ?auto_57022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57022 )
      ( MAKE-8PILE ?auto_57022 ?auto_57023 ?auto_57024 ?auto_57025 ?auto_57026 ?auto_57027 ?auto_57028 ?auto_57029 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_57057 - BLOCK
      ?auto_57058 - BLOCK
      ?auto_57059 - BLOCK
      ?auto_57060 - BLOCK
      ?auto_57061 - BLOCK
      ?auto_57062 - BLOCK
      ?auto_57063 - BLOCK
      ?auto_57064 - BLOCK
      ?auto_57065 - BLOCK
    )
    :vars
    (
      ?auto_57066 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_57064 ) ( ON ?auto_57065 ?auto_57066 ) ( CLEAR ?auto_57065 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57057 ) ( ON ?auto_57058 ?auto_57057 ) ( ON ?auto_57059 ?auto_57058 ) ( ON ?auto_57060 ?auto_57059 ) ( ON ?auto_57061 ?auto_57060 ) ( ON ?auto_57062 ?auto_57061 ) ( ON ?auto_57063 ?auto_57062 ) ( ON ?auto_57064 ?auto_57063 ) ( not ( = ?auto_57057 ?auto_57058 ) ) ( not ( = ?auto_57057 ?auto_57059 ) ) ( not ( = ?auto_57057 ?auto_57060 ) ) ( not ( = ?auto_57057 ?auto_57061 ) ) ( not ( = ?auto_57057 ?auto_57062 ) ) ( not ( = ?auto_57057 ?auto_57063 ) ) ( not ( = ?auto_57057 ?auto_57064 ) ) ( not ( = ?auto_57057 ?auto_57065 ) ) ( not ( = ?auto_57057 ?auto_57066 ) ) ( not ( = ?auto_57058 ?auto_57059 ) ) ( not ( = ?auto_57058 ?auto_57060 ) ) ( not ( = ?auto_57058 ?auto_57061 ) ) ( not ( = ?auto_57058 ?auto_57062 ) ) ( not ( = ?auto_57058 ?auto_57063 ) ) ( not ( = ?auto_57058 ?auto_57064 ) ) ( not ( = ?auto_57058 ?auto_57065 ) ) ( not ( = ?auto_57058 ?auto_57066 ) ) ( not ( = ?auto_57059 ?auto_57060 ) ) ( not ( = ?auto_57059 ?auto_57061 ) ) ( not ( = ?auto_57059 ?auto_57062 ) ) ( not ( = ?auto_57059 ?auto_57063 ) ) ( not ( = ?auto_57059 ?auto_57064 ) ) ( not ( = ?auto_57059 ?auto_57065 ) ) ( not ( = ?auto_57059 ?auto_57066 ) ) ( not ( = ?auto_57060 ?auto_57061 ) ) ( not ( = ?auto_57060 ?auto_57062 ) ) ( not ( = ?auto_57060 ?auto_57063 ) ) ( not ( = ?auto_57060 ?auto_57064 ) ) ( not ( = ?auto_57060 ?auto_57065 ) ) ( not ( = ?auto_57060 ?auto_57066 ) ) ( not ( = ?auto_57061 ?auto_57062 ) ) ( not ( = ?auto_57061 ?auto_57063 ) ) ( not ( = ?auto_57061 ?auto_57064 ) ) ( not ( = ?auto_57061 ?auto_57065 ) ) ( not ( = ?auto_57061 ?auto_57066 ) ) ( not ( = ?auto_57062 ?auto_57063 ) ) ( not ( = ?auto_57062 ?auto_57064 ) ) ( not ( = ?auto_57062 ?auto_57065 ) ) ( not ( = ?auto_57062 ?auto_57066 ) ) ( not ( = ?auto_57063 ?auto_57064 ) ) ( not ( = ?auto_57063 ?auto_57065 ) ) ( not ( = ?auto_57063 ?auto_57066 ) ) ( not ( = ?auto_57064 ?auto_57065 ) ) ( not ( = ?auto_57064 ?auto_57066 ) ) ( not ( = ?auto_57065 ?auto_57066 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57065 ?auto_57066 )
      ( !STACK ?auto_57065 ?auto_57064 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_57076 - BLOCK
      ?auto_57077 - BLOCK
      ?auto_57078 - BLOCK
      ?auto_57079 - BLOCK
      ?auto_57080 - BLOCK
      ?auto_57081 - BLOCK
      ?auto_57082 - BLOCK
      ?auto_57083 - BLOCK
      ?auto_57084 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_57083 ) ( ON-TABLE ?auto_57084 ) ( CLEAR ?auto_57084 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57076 ) ( ON ?auto_57077 ?auto_57076 ) ( ON ?auto_57078 ?auto_57077 ) ( ON ?auto_57079 ?auto_57078 ) ( ON ?auto_57080 ?auto_57079 ) ( ON ?auto_57081 ?auto_57080 ) ( ON ?auto_57082 ?auto_57081 ) ( ON ?auto_57083 ?auto_57082 ) ( not ( = ?auto_57076 ?auto_57077 ) ) ( not ( = ?auto_57076 ?auto_57078 ) ) ( not ( = ?auto_57076 ?auto_57079 ) ) ( not ( = ?auto_57076 ?auto_57080 ) ) ( not ( = ?auto_57076 ?auto_57081 ) ) ( not ( = ?auto_57076 ?auto_57082 ) ) ( not ( = ?auto_57076 ?auto_57083 ) ) ( not ( = ?auto_57076 ?auto_57084 ) ) ( not ( = ?auto_57077 ?auto_57078 ) ) ( not ( = ?auto_57077 ?auto_57079 ) ) ( not ( = ?auto_57077 ?auto_57080 ) ) ( not ( = ?auto_57077 ?auto_57081 ) ) ( not ( = ?auto_57077 ?auto_57082 ) ) ( not ( = ?auto_57077 ?auto_57083 ) ) ( not ( = ?auto_57077 ?auto_57084 ) ) ( not ( = ?auto_57078 ?auto_57079 ) ) ( not ( = ?auto_57078 ?auto_57080 ) ) ( not ( = ?auto_57078 ?auto_57081 ) ) ( not ( = ?auto_57078 ?auto_57082 ) ) ( not ( = ?auto_57078 ?auto_57083 ) ) ( not ( = ?auto_57078 ?auto_57084 ) ) ( not ( = ?auto_57079 ?auto_57080 ) ) ( not ( = ?auto_57079 ?auto_57081 ) ) ( not ( = ?auto_57079 ?auto_57082 ) ) ( not ( = ?auto_57079 ?auto_57083 ) ) ( not ( = ?auto_57079 ?auto_57084 ) ) ( not ( = ?auto_57080 ?auto_57081 ) ) ( not ( = ?auto_57080 ?auto_57082 ) ) ( not ( = ?auto_57080 ?auto_57083 ) ) ( not ( = ?auto_57080 ?auto_57084 ) ) ( not ( = ?auto_57081 ?auto_57082 ) ) ( not ( = ?auto_57081 ?auto_57083 ) ) ( not ( = ?auto_57081 ?auto_57084 ) ) ( not ( = ?auto_57082 ?auto_57083 ) ) ( not ( = ?auto_57082 ?auto_57084 ) ) ( not ( = ?auto_57083 ?auto_57084 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_57084 )
      ( !STACK ?auto_57084 ?auto_57083 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_57094 - BLOCK
      ?auto_57095 - BLOCK
      ?auto_57096 - BLOCK
      ?auto_57097 - BLOCK
      ?auto_57098 - BLOCK
      ?auto_57099 - BLOCK
      ?auto_57100 - BLOCK
      ?auto_57101 - BLOCK
      ?auto_57102 - BLOCK
    )
    :vars
    (
      ?auto_57103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57102 ?auto_57103 ) ( ON-TABLE ?auto_57094 ) ( ON ?auto_57095 ?auto_57094 ) ( ON ?auto_57096 ?auto_57095 ) ( ON ?auto_57097 ?auto_57096 ) ( ON ?auto_57098 ?auto_57097 ) ( ON ?auto_57099 ?auto_57098 ) ( ON ?auto_57100 ?auto_57099 ) ( not ( = ?auto_57094 ?auto_57095 ) ) ( not ( = ?auto_57094 ?auto_57096 ) ) ( not ( = ?auto_57094 ?auto_57097 ) ) ( not ( = ?auto_57094 ?auto_57098 ) ) ( not ( = ?auto_57094 ?auto_57099 ) ) ( not ( = ?auto_57094 ?auto_57100 ) ) ( not ( = ?auto_57094 ?auto_57101 ) ) ( not ( = ?auto_57094 ?auto_57102 ) ) ( not ( = ?auto_57094 ?auto_57103 ) ) ( not ( = ?auto_57095 ?auto_57096 ) ) ( not ( = ?auto_57095 ?auto_57097 ) ) ( not ( = ?auto_57095 ?auto_57098 ) ) ( not ( = ?auto_57095 ?auto_57099 ) ) ( not ( = ?auto_57095 ?auto_57100 ) ) ( not ( = ?auto_57095 ?auto_57101 ) ) ( not ( = ?auto_57095 ?auto_57102 ) ) ( not ( = ?auto_57095 ?auto_57103 ) ) ( not ( = ?auto_57096 ?auto_57097 ) ) ( not ( = ?auto_57096 ?auto_57098 ) ) ( not ( = ?auto_57096 ?auto_57099 ) ) ( not ( = ?auto_57096 ?auto_57100 ) ) ( not ( = ?auto_57096 ?auto_57101 ) ) ( not ( = ?auto_57096 ?auto_57102 ) ) ( not ( = ?auto_57096 ?auto_57103 ) ) ( not ( = ?auto_57097 ?auto_57098 ) ) ( not ( = ?auto_57097 ?auto_57099 ) ) ( not ( = ?auto_57097 ?auto_57100 ) ) ( not ( = ?auto_57097 ?auto_57101 ) ) ( not ( = ?auto_57097 ?auto_57102 ) ) ( not ( = ?auto_57097 ?auto_57103 ) ) ( not ( = ?auto_57098 ?auto_57099 ) ) ( not ( = ?auto_57098 ?auto_57100 ) ) ( not ( = ?auto_57098 ?auto_57101 ) ) ( not ( = ?auto_57098 ?auto_57102 ) ) ( not ( = ?auto_57098 ?auto_57103 ) ) ( not ( = ?auto_57099 ?auto_57100 ) ) ( not ( = ?auto_57099 ?auto_57101 ) ) ( not ( = ?auto_57099 ?auto_57102 ) ) ( not ( = ?auto_57099 ?auto_57103 ) ) ( not ( = ?auto_57100 ?auto_57101 ) ) ( not ( = ?auto_57100 ?auto_57102 ) ) ( not ( = ?auto_57100 ?auto_57103 ) ) ( not ( = ?auto_57101 ?auto_57102 ) ) ( not ( = ?auto_57101 ?auto_57103 ) ) ( not ( = ?auto_57102 ?auto_57103 ) ) ( CLEAR ?auto_57100 ) ( ON ?auto_57101 ?auto_57102 ) ( CLEAR ?auto_57101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_57094 ?auto_57095 ?auto_57096 ?auto_57097 ?auto_57098 ?auto_57099 ?auto_57100 ?auto_57101 )
      ( MAKE-9PILE ?auto_57094 ?auto_57095 ?auto_57096 ?auto_57097 ?auto_57098 ?auto_57099 ?auto_57100 ?auto_57101 ?auto_57102 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_57113 - BLOCK
      ?auto_57114 - BLOCK
      ?auto_57115 - BLOCK
      ?auto_57116 - BLOCK
      ?auto_57117 - BLOCK
      ?auto_57118 - BLOCK
      ?auto_57119 - BLOCK
      ?auto_57120 - BLOCK
      ?auto_57121 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57121 ) ( ON-TABLE ?auto_57113 ) ( ON ?auto_57114 ?auto_57113 ) ( ON ?auto_57115 ?auto_57114 ) ( ON ?auto_57116 ?auto_57115 ) ( ON ?auto_57117 ?auto_57116 ) ( ON ?auto_57118 ?auto_57117 ) ( ON ?auto_57119 ?auto_57118 ) ( not ( = ?auto_57113 ?auto_57114 ) ) ( not ( = ?auto_57113 ?auto_57115 ) ) ( not ( = ?auto_57113 ?auto_57116 ) ) ( not ( = ?auto_57113 ?auto_57117 ) ) ( not ( = ?auto_57113 ?auto_57118 ) ) ( not ( = ?auto_57113 ?auto_57119 ) ) ( not ( = ?auto_57113 ?auto_57120 ) ) ( not ( = ?auto_57113 ?auto_57121 ) ) ( not ( = ?auto_57114 ?auto_57115 ) ) ( not ( = ?auto_57114 ?auto_57116 ) ) ( not ( = ?auto_57114 ?auto_57117 ) ) ( not ( = ?auto_57114 ?auto_57118 ) ) ( not ( = ?auto_57114 ?auto_57119 ) ) ( not ( = ?auto_57114 ?auto_57120 ) ) ( not ( = ?auto_57114 ?auto_57121 ) ) ( not ( = ?auto_57115 ?auto_57116 ) ) ( not ( = ?auto_57115 ?auto_57117 ) ) ( not ( = ?auto_57115 ?auto_57118 ) ) ( not ( = ?auto_57115 ?auto_57119 ) ) ( not ( = ?auto_57115 ?auto_57120 ) ) ( not ( = ?auto_57115 ?auto_57121 ) ) ( not ( = ?auto_57116 ?auto_57117 ) ) ( not ( = ?auto_57116 ?auto_57118 ) ) ( not ( = ?auto_57116 ?auto_57119 ) ) ( not ( = ?auto_57116 ?auto_57120 ) ) ( not ( = ?auto_57116 ?auto_57121 ) ) ( not ( = ?auto_57117 ?auto_57118 ) ) ( not ( = ?auto_57117 ?auto_57119 ) ) ( not ( = ?auto_57117 ?auto_57120 ) ) ( not ( = ?auto_57117 ?auto_57121 ) ) ( not ( = ?auto_57118 ?auto_57119 ) ) ( not ( = ?auto_57118 ?auto_57120 ) ) ( not ( = ?auto_57118 ?auto_57121 ) ) ( not ( = ?auto_57119 ?auto_57120 ) ) ( not ( = ?auto_57119 ?auto_57121 ) ) ( not ( = ?auto_57120 ?auto_57121 ) ) ( CLEAR ?auto_57119 ) ( ON ?auto_57120 ?auto_57121 ) ( CLEAR ?auto_57120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_57113 ?auto_57114 ?auto_57115 ?auto_57116 ?auto_57117 ?auto_57118 ?auto_57119 ?auto_57120 )
      ( MAKE-9PILE ?auto_57113 ?auto_57114 ?auto_57115 ?auto_57116 ?auto_57117 ?auto_57118 ?auto_57119 ?auto_57120 ?auto_57121 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_57131 - BLOCK
      ?auto_57132 - BLOCK
      ?auto_57133 - BLOCK
      ?auto_57134 - BLOCK
      ?auto_57135 - BLOCK
      ?auto_57136 - BLOCK
      ?auto_57137 - BLOCK
      ?auto_57138 - BLOCK
      ?auto_57139 - BLOCK
    )
    :vars
    (
      ?auto_57140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57139 ?auto_57140 ) ( ON-TABLE ?auto_57131 ) ( ON ?auto_57132 ?auto_57131 ) ( ON ?auto_57133 ?auto_57132 ) ( ON ?auto_57134 ?auto_57133 ) ( ON ?auto_57135 ?auto_57134 ) ( ON ?auto_57136 ?auto_57135 ) ( not ( = ?auto_57131 ?auto_57132 ) ) ( not ( = ?auto_57131 ?auto_57133 ) ) ( not ( = ?auto_57131 ?auto_57134 ) ) ( not ( = ?auto_57131 ?auto_57135 ) ) ( not ( = ?auto_57131 ?auto_57136 ) ) ( not ( = ?auto_57131 ?auto_57137 ) ) ( not ( = ?auto_57131 ?auto_57138 ) ) ( not ( = ?auto_57131 ?auto_57139 ) ) ( not ( = ?auto_57131 ?auto_57140 ) ) ( not ( = ?auto_57132 ?auto_57133 ) ) ( not ( = ?auto_57132 ?auto_57134 ) ) ( not ( = ?auto_57132 ?auto_57135 ) ) ( not ( = ?auto_57132 ?auto_57136 ) ) ( not ( = ?auto_57132 ?auto_57137 ) ) ( not ( = ?auto_57132 ?auto_57138 ) ) ( not ( = ?auto_57132 ?auto_57139 ) ) ( not ( = ?auto_57132 ?auto_57140 ) ) ( not ( = ?auto_57133 ?auto_57134 ) ) ( not ( = ?auto_57133 ?auto_57135 ) ) ( not ( = ?auto_57133 ?auto_57136 ) ) ( not ( = ?auto_57133 ?auto_57137 ) ) ( not ( = ?auto_57133 ?auto_57138 ) ) ( not ( = ?auto_57133 ?auto_57139 ) ) ( not ( = ?auto_57133 ?auto_57140 ) ) ( not ( = ?auto_57134 ?auto_57135 ) ) ( not ( = ?auto_57134 ?auto_57136 ) ) ( not ( = ?auto_57134 ?auto_57137 ) ) ( not ( = ?auto_57134 ?auto_57138 ) ) ( not ( = ?auto_57134 ?auto_57139 ) ) ( not ( = ?auto_57134 ?auto_57140 ) ) ( not ( = ?auto_57135 ?auto_57136 ) ) ( not ( = ?auto_57135 ?auto_57137 ) ) ( not ( = ?auto_57135 ?auto_57138 ) ) ( not ( = ?auto_57135 ?auto_57139 ) ) ( not ( = ?auto_57135 ?auto_57140 ) ) ( not ( = ?auto_57136 ?auto_57137 ) ) ( not ( = ?auto_57136 ?auto_57138 ) ) ( not ( = ?auto_57136 ?auto_57139 ) ) ( not ( = ?auto_57136 ?auto_57140 ) ) ( not ( = ?auto_57137 ?auto_57138 ) ) ( not ( = ?auto_57137 ?auto_57139 ) ) ( not ( = ?auto_57137 ?auto_57140 ) ) ( not ( = ?auto_57138 ?auto_57139 ) ) ( not ( = ?auto_57138 ?auto_57140 ) ) ( not ( = ?auto_57139 ?auto_57140 ) ) ( ON ?auto_57138 ?auto_57139 ) ( CLEAR ?auto_57136 ) ( ON ?auto_57137 ?auto_57138 ) ( CLEAR ?auto_57137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_57131 ?auto_57132 ?auto_57133 ?auto_57134 ?auto_57135 ?auto_57136 ?auto_57137 )
      ( MAKE-9PILE ?auto_57131 ?auto_57132 ?auto_57133 ?auto_57134 ?auto_57135 ?auto_57136 ?auto_57137 ?auto_57138 ?auto_57139 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_57150 - BLOCK
      ?auto_57151 - BLOCK
      ?auto_57152 - BLOCK
      ?auto_57153 - BLOCK
      ?auto_57154 - BLOCK
      ?auto_57155 - BLOCK
      ?auto_57156 - BLOCK
      ?auto_57157 - BLOCK
      ?auto_57158 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57158 ) ( ON-TABLE ?auto_57150 ) ( ON ?auto_57151 ?auto_57150 ) ( ON ?auto_57152 ?auto_57151 ) ( ON ?auto_57153 ?auto_57152 ) ( ON ?auto_57154 ?auto_57153 ) ( ON ?auto_57155 ?auto_57154 ) ( not ( = ?auto_57150 ?auto_57151 ) ) ( not ( = ?auto_57150 ?auto_57152 ) ) ( not ( = ?auto_57150 ?auto_57153 ) ) ( not ( = ?auto_57150 ?auto_57154 ) ) ( not ( = ?auto_57150 ?auto_57155 ) ) ( not ( = ?auto_57150 ?auto_57156 ) ) ( not ( = ?auto_57150 ?auto_57157 ) ) ( not ( = ?auto_57150 ?auto_57158 ) ) ( not ( = ?auto_57151 ?auto_57152 ) ) ( not ( = ?auto_57151 ?auto_57153 ) ) ( not ( = ?auto_57151 ?auto_57154 ) ) ( not ( = ?auto_57151 ?auto_57155 ) ) ( not ( = ?auto_57151 ?auto_57156 ) ) ( not ( = ?auto_57151 ?auto_57157 ) ) ( not ( = ?auto_57151 ?auto_57158 ) ) ( not ( = ?auto_57152 ?auto_57153 ) ) ( not ( = ?auto_57152 ?auto_57154 ) ) ( not ( = ?auto_57152 ?auto_57155 ) ) ( not ( = ?auto_57152 ?auto_57156 ) ) ( not ( = ?auto_57152 ?auto_57157 ) ) ( not ( = ?auto_57152 ?auto_57158 ) ) ( not ( = ?auto_57153 ?auto_57154 ) ) ( not ( = ?auto_57153 ?auto_57155 ) ) ( not ( = ?auto_57153 ?auto_57156 ) ) ( not ( = ?auto_57153 ?auto_57157 ) ) ( not ( = ?auto_57153 ?auto_57158 ) ) ( not ( = ?auto_57154 ?auto_57155 ) ) ( not ( = ?auto_57154 ?auto_57156 ) ) ( not ( = ?auto_57154 ?auto_57157 ) ) ( not ( = ?auto_57154 ?auto_57158 ) ) ( not ( = ?auto_57155 ?auto_57156 ) ) ( not ( = ?auto_57155 ?auto_57157 ) ) ( not ( = ?auto_57155 ?auto_57158 ) ) ( not ( = ?auto_57156 ?auto_57157 ) ) ( not ( = ?auto_57156 ?auto_57158 ) ) ( not ( = ?auto_57157 ?auto_57158 ) ) ( ON ?auto_57157 ?auto_57158 ) ( CLEAR ?auto_57155 ) ( ON ?auto_57156 ?auto_57157 ) ( CLEAR ?auto_57156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_57150 ?auto_57151 ?auto_57152 ?auto_57153 ?auto_57154 ?auto_57155 ?auto_57156 )
      ( MAKE-9PILE ?auto_57150 ?auto_57151 ?auto_57152 ?auto_57153 ?auto_57154 ?auto_57155 ?auto_57156 ?auto_57157 ?auto_57158 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_57168 - BLOCK
      ?auto_57169 - BLOCK
      ?auto_57170 - BLOCK
      ?auto_57171 - BLOCK
      ?auto_57172 - BLOCK
      ?auto_57173 - BLOCK
      ?auto_57174 - BLOCK
      ?auto_57175 - BLOCK
      ?auto_57176 - BLOCK
    )
    :vars
    (
      ?auto_57177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57176 ?auto_57177 ) ( ON-TABLE ?auto_57168 ) ( ON ?auto_57169 ?auto_57168 ) ( ON ?auto_57170 ?auto_57169 ) ( ON ?auto_57171 ?auto_57170 ) ( ON ?auto_57172 ?auto_57171 ) ( not ( = ?auto_57168 ?auto_57169 ) ) ( not ( = ?auto_57168 ?auto_57170 ) ) ( not ( = ?auto_57168 ?auto_57171 ) ) ( not ( = ?auto_57168 ?auto_57172 ) ) ( not ( = ?auto_57168 ?auto_57173 ) ) ( not ( = ?auto_57168 ?auto_57174 ) ) ( not ( = ?auto_57168 ?auto_57175 ) ) ( not ( = ?auto_57168 ?auto_57176 ) ) ( not ( = ?auto_57168 ?auto_57177 ) ) ( not ( = ?auto_57169 ?auto_57170 ) ) ( not ( = ?auto_57169 ?auto_57171 ) ) ( not ( = ?auto_57169 ?auto_57172 ) ) ( not ( = ?auto_57169 ?auto_57173 ) ) ( not ( = ?auto_57169 ?auto_57174 ) ) ( not ( = ?auto_57169 ?auto_57175 ) ) ( not ( = ?auto_57169 ?auto_57176 ) ) ( not ( = ?auto_57169 ?auto_57177 ) ) ( not ( = ?auto_57170 ?auto_57171 ) ) ( not ( = ?auto_57170 ?auto_57172 ) ) ( not ( = ?auto_57170 ?auto_57173 ) ) ( not ( = ?auto_57170 ?auto_57174 ) ) ( not ( = ?auto_57170 ?auto_57175 ) ) ( not ( = ?auto_57170 ?auto_57176 ) ) ( not ( = ?auto_57170 ?auto_57177 ) ) ( not ( = ?auto_57171 ?auto_57172 ) ) ( not ( = ?auto_57171 ?auto_57173 ) ) ( not ( = ?auto_57171 ?auto_57174 ) ) ( not ( = ?auto_57171 ?auto_57175 ) ) ( not ( = ?auto_57171 ?auto_57176 ) ) ( not ( = ?auto_57171 ?auto_57177 ) ) ( not ( = ?auto_57172 ?auto_57173 ) ) ( not ( = ?auto_57172 ?auto_57174 ) ) ( not ( = ?auto_57172 ?auto_57175 ) ) ( not ( = ?auto_57172 ?auto_57176 ) ) ( not ( = ?auto_57172 ?auto_57177 ) ) ( not ( = ?auto_57173 ?auto_57174 ) ) ( not ( = ?auto_57173 ?auto_57175 ) ) ( not ( = ?auto_57173 ?auto_57176 ) ) ( not ( = ?auto_57173 ?auto_57177 ) ) ( not ( = ?auto_57174 ?auto_57175 ) ) ( not ( = ?auto_57174 ?auto_57176 ) ) ( not ( = ?auto_57174 ?auto_57177 ) ) ( not ( = ?auto_57175 ?auto_57176 ) ) ( not ( = ?auto_57175 ?auto_57177 ) ) ( not ( = ?auto_57176 ?auto_57177 ) ) ( ON ?auto_57175 ?auto_57176 ) ( ON ?auto_57174 ?auto_57175 ) ( CLEAR ?auto_57172 ) ( ON ?auto_57173 ?auto_57174 ) ( CLEAR ?auto_57173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57168 ?auto_57169 ?auto_57170 ?auto_57171 ?auto_57172 ?auto_57173 )
      ( MAKE-9PILE ?auto_57168 ?auto_57169 ?auto_57170 ?auto_57171 ?auto_57172 ?auto_57173 ?auto_57174 ?auto_57175 ?auto_57176 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_57187 - BLOCK
      ?auto_57188 - BLOCK
      ?auto_57189 - BLOCK
      ?auto_57190 - BLOCK
      ?auto_57191 - BLOCK
      ?auto_57192 - BLOCK
      ?auto_57193 - BLOCK
      ?auto_57194 - BLOCK
      ?auto_57195 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57195 ) ( ON-TABLE ?auto_57187 ) ( ON ?auto_57188 ?auto_57187 ) ( ON ?auto_57189 ?auto_57188 ) ( ON ?auto_57190 ?auto_57189 ) ( ON ?auto_57191 ?auto_57190 ) ( not ( = ?auto_57187 ?auto_57188 ) ) ( not ( = ?auto_57187 ?auto_57189 ) ) ( not ( = ?auto_57187 ?auto_57190 ) ) ( not ( = ?auto_57187 ?auto_57191 ) ) ( not ( = ?auto_57187 ?auto_57192 ) ) ( not ( = ?auto_57187 ?auto_57193 ) ) ( not ( = ?auto_57187 ?auto_57194 ) ) ( not ( = ?auto_57187 ?auto_57195 ) ) ( not ( = ?auto_57188 ?auto_57189 ) ) ( not ( = ?auto_57188 ?auto_57190 ) ) ( not ( = ?auto_57188 ?auto_57191 ) ) ( not ( = ?auto_57188 ?auto_57192 ) ) ( not ( = ?auto_57188 ?auto_57193 ) ) ( not ( = ?auto_57188 ?auto_57194 ) ) ( not ( = ?auto_57188 ?auto_57195 ) ) ( not ( = ?auto_57189 ?auto_57190 ) ) ( not ( = ?auto_57189 ?auto_57191 ) ) ( not ( = ?auto_57189 ?auto_57192 ) ) ( not ( = ?auto_57189 ?auto_57193 ) ) ( not ( = ?auto_57189 ?auto_57194 ) ) ( not ( = ?auto_57189 ?auto_57195 ) ) ( not ( = ?auto_57190 ?auto_57191 ) ) ( not ( = ?auto_57190 ?auto_57192 ) ) ( not ( = ?auto_57190 ?auto_57193 ) ) ( not ( = ?auto_57190 ?auto_57194 ) ) ( not ( = ?auto_57190 ?auto_57195 ) ) ( not ( = ?auto_57191 ?auto_57192 ) ) ( not ( = ?auto_57191 ?auto_57193 ) ) ( not ( = ?auto_57191 ?auto_57194 ) ) ( not ( = ?auto_57191 ?auto_57195 ) ) ( not ( = ?auto_57192 ?auto_57193 ) ) ( not ( = ?auto_57192 ?auto_57194 ) ) ( not ( = ?auto_57192 ?auto_57195 ) ) ( not ( = ?auto_57193 ?auto_57194 ) ) ( not ( = ?auto_57193 ?auto_57195 ) ) ( not ( = ?auto_57194 ?auto_57195 ) ) ( ON ?auto_57194 ?auto_57195 ) ( ON ?auto_57193 ?auto_57194 ) ( CLEAR ?auto_57191 ) ( ON ?auto_57192 ?auto_57193 ) ( CLEAR ?auto_57192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57187 ?auto_57188 ?auto_57189 ?auto_57190 ?auto_57191 ?auto_57192 )
      ( MAKE-9PILE ?auto_57187 ?auto_57188 ?auto_57189 ?auto_57190 ?auto_57191 ?auto_57192 ?auto_57193 ?auto_57194 ?auto_57195 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_57205 - BLOCK
      ?auto_57206 - BLOCK
      ?auto_57207 - BLOCK
      ?auto_57208 - BLOCK
      ?auto_57209 - BLOCK
      ?auto_57210 - BLOCK
      ?auto_57211 - BLOCK
      ?auto_57212 - BLOCK
      ?auto_57213 - BLOCK
    )
    :vars
    (
      ?auto_57214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57213 ?auto_57214 ) ( ON-TABLE ?auto_57205 ) ( ON ?auto_57206 ?auto_57205 ) ( ON ?auto_57207 ?auto_57206 ) ( ON ?auto_57208 ?auto_57207 ) ( not ( = ?auto_57205 ?auto_57206 ) ) ( not ( = ?auto_57205 ?auto_57207 ) ) ( not ( = ?auto_57205 ?auto_57208 ) ) ( not ( = ?auto_57205 ?auto_57209 ) ) ( not ( = ?auto_57205 ?auto_57210 ) ) ( not ( = ?auto_57205 ?auto_57211 ) ) ( not ( = ?auto_57205 ?auto_57212 ) ) ( not ( = ?auto_57205 ?auto_57213 ) ) ( not ( = ?auto_57205 ?auto_57214 ) ) ( not ( = ?auto_57206 ?auto_57207 ) ) ( not ( = ?auto_57206 ?auto_57208 ) ) ( not ( = ?auto_57206 ?auto_57209 ) ) ( not ( = ?auto_57206 ?auto_57210 ) ) ( not ( = ?auto_57206 ?auto_57211 ) ) ( not ( = ?auto_57206 ?auto_57212 ) ) ( not ( = ?auto_57206 ?auto_57213 ) ) ( not ( = ?auto_57206 ?auto_57214 ) ) ( not ( = ?auto_57207 ?auto_57208 ) ) ( not ( = ?auto_57207 ?auto_57209 ) ) ( not ( = ?auto_57207 ?auto_57210 ) ) ( not ( = ?auto_57207 ?auto_57211 ) ) ( not ( = ?auto_57207 ?auto_57212 ) ) ( not ( = ?auto_57207 ?auto_57213 ) ) ( not ( = ?auto_57207 ?auto_57214 ) ) ( not ( = ?auto_57208 ?auto_57209 ) ) ( not ( = ?auto_57208 ?auto_57210 ) ) ( not ( = ?auto_57208 ?auto_57211 ) ) ( not ( = ?auto_57208 ?auto_57212 ) ) ( not ( = ?auto_57208 ?auto_57213 ) ) ( not ( = ?auto_57208 ?auto_57214 ) ) ( not ( = ?auto_57209 ?auto_57210 ) ) ( not ( = ?auto_57209 ?auto_57211 ) ) ( not ( = ?auto_57209 ?auto_57212 ) ) ( not ( = ?auto_57209 ?auto_57213 ) ) ( not ( = ?auto_57209 ?auto_57214 ) ) ( not ( = ?auto_57210 ?auto_57211 ) ) ( not ( = ?auto_57210 ?auto_57212 ) ) ( not ( = ?auto_57210 ?auto_57213 ) ) ( not ( = ?auto_57210 ?auto_57214 ) ) ( not ( = ?auto_57211 ?auto_57212 ) ) ( not ( = ?auto_57211 ?auto_57213 ) ) ( not ( = ?auto_57211 ?auto_57214 ) ) ( not ( = ?auto_57212 ?auto_57213 ) ) ( not ( = ?auto_57212 ?auto_57214 ) ) ( not ( = ?auto_57213 ?auto_57214 ) ) ( ON ?auto_57212 ?auto_57213 ) ( ON ?auto_57211 ?auto_57212 ) ( ON ?auto_57210 ?auto_57211 ) ( CLEAR ?auto_57208 ) ( ON ?auto_57209 ?auto_57210 ) ( CLEAR ?auto_57209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57205 ?auto_57206 ?auto_57207 ?auto_57208 ?auto_57209 )
      ( MAKE-9PILE ?auto_57205 ?auto_57206 ?auto_57207 ?auto_57208 ?auto_57209 ?auto_57210 ?auto_57211 ?auto_57212 ?auto_57213 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_57224 - BLOCK
      ?auto_57225 - BLOCK
      ?auto_57226 - BLOCK
      ?auto_57227 - BLOCK
      ?auto_57228 - BLOCK
      ?auto_57229 - BLOCK
      ?auto_57230 - BLOCK
      ?auto_57231 - BLOCK
      ?auto_57232 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57232 ) ( ON-TABLE ?auto_57224 ) ( ON ?auto_57225 ?auto_57224 ) ( ON ?auto_57226 ?auto_57225 ) ( ON ?auto_57227 ?auto_57226 ) ( not ( = ?auto_57224 ?auto_57225 ) ) ( not ( = ?auto_57224 ?auto_57226 ) ) ( not ( = ?auto_57224 ?auto_57227 ) ) ( not ( = ?auto_57224 ?auto_57228 ) ) ( not ( = ?auto_57224 ?auto_57229 ) ) ( not ( = ?auto_57224 ?auto_57230 ) ) ( not ( = ?auto_57224 ?auto_57231 ) ) ( not ( = ?auto_57224 ?auto_57232 ) ) ( not ( = ?auto_57225 ?auto_57226 ) ) ( not ( = ?auto_57225 ?auto_57227 ) ) ( not ( = ?auto_57225 ?auto_57228 ) ) ( not ( = ?auto_57225 ?auto_57229 ) ) ( not ( = ?auto_57225 ?auto_57230 ) ) ( not ( = ?auto_57225 ?auto_57231 ) ) ( not ( = ?auto_57225 ?auto_57232 ) ) ( not ( = ?auto_57226 ?auto_57227 ) ) ( not ( = ?auto_57226 ?auto_57228 ) ) ( not ( = ?auto_57226 ?auto_57229 ) ) ( not ( = ?auto_57226 ?auto_57230 ) ) ( not ( = ?auto_57226 ?auto_57231 ) ) ( not ( = ?auto_57226 ?auto_57232 ) ) ( not ( = ?auto_57227 ?auto_57228 ) ) ( not ( = ?auto_57227 ?auto_57229 ) ) ( not ( = ?auto_57227 ?auto_57230 ) ) ( not ( = ?auto_57227 ?auto_57231 ) ) ( not ( = ?auto_57227 ?auto_57232 ) ) ( not ( = ?auto_57228 ?auto_57229 ) ) ( not ( = ?auto_57228 ?auto_57230 ) ) ( not ( = ?auto_57228 ?auto_57231 ) ) ( not ( = ?auto_57228 ?auto_57232 ) ) ( not ( = ?auto_57229 ?auto_57230 ) ) ( not ( = ?auto_57229 ?auto_57231 ) ) ( not ( = ?auto_57229 ?auto_57232 ) ) ( not ( = ?auto_57230 ?auto_57231 ) ) ( not ( = ?auto_57230 ?auto_57232 ) ) ( not ( = ?auto_57231 ?auto_57232 ) ) ( ON ?auto_57231 ?auto_57232 ) ( ON ?auto_57230 ?auto_57231 ) ( ON ?auto_57229 ?auto_57230 ) ( CLEAR ?auto_57227 ) ( ON ?auto_57228 ?auto_57229 ) ( CLEAR ?auto_57228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57224 ?auto_57225 ?auto_57226 ?auto_57227 ?auto_57228 )
      ( MAKE-9PILE ?auto_57224 ?auto_57225 ?auto_57226 ?auto_57227 ?auto_57228 ?auto_57229 ?auto_57230 ?auto_57231 ?auto_57232 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_57242 - BLOCK
      ?auto_57243 - BLOCK
      ?auto_57244 - BLOCK
      ?auto_57245 - BLOCK
      ?auto_57246 - BLOCK
      ?auto_57247 - BLOCK
      ?auto_57248 - BLOCK
      ?auto_57249 - BLOCK
      ?auto_57250 - BLOCK
    )
    :vars
    (
      ?auto_57251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57250 ?auto_57251 ) ( ON-TABLE ?auto_57242 ) ( ON ?auto_57243 ?auto_57242 ) ( ON ?auto_57244 ?auto_57243 ) ( not ( = ?auto_57242 ?auto_57243 ) ) ( not ( = ?auto_57242 ?auto_57244 ) ) ( not ( = ?auto_57242 ?auto_57245 ) ) ( not ( = ?auto_57242 ?auto_57246 ) ) ( not ( = ?auto_57242 ?auto_57247 ) ) ( not ( = ?auto_57242 ?auto_57248 ) ) ( not ( = ?auto_57242 ?auto_57249 ) ) ( not ( = ?auto_57242 ?auto_57250 ) ) ( not ( = ?auto_57242 ?auto_57251 ) ) ( not ( = ?auto_57243 ?auto_57244 ) ) ( not ( = ?auto_57243 ?auto_57245 ) ) ( not ( = ?auto_57243 ?auto_57246 ) ) ( not ( = ?auto_57243 ?auto_57247 ) ) ( not ( = ?auto_57243 ?auto_57248 ) ) ( not ( = ?auto_57243 ?auto_57249 ) ) ( not ( = ?auto_57243 ?auto_57250 ) ) ( not ( = ?auto_57243 ?auto_57251 ) ) ( not ( = ?auto_57244 ?auto_57245 ) ) ( not ( = ?auto_57244 ?auto_57246 ) ) ( not ( = ?auto_57244 ?auto_57247 ) ) ( not ( = ?auto_57244 ?auto_57248 ) ) ( not ( = ?auto_57244 ?auto_57249 ) ) ( not ( = ?auto_57244 ?auto_57250 ) ) ( not ( = ?auto_57244 ?auto_57251 ) ) ( not ( = ?auto_57245 ?auto_57246 ) ) ( not ( = ?auto_57245 ?auto_57247 ) ) ( not ( = ?auto_57245 ?auto_57248 ) ) ( not ( = ?auto_57245 ?auto_57249 ) ) ( not ( = ?auto_57245 ?auto_57250 ) ) ( not ( = ?auto_57245 ?auto_57251 ) ) ( not ( = ?auto_57246 ?auto_57247 ) ) ( not ( = ?auto_57246 ?auto_57248 ) ) ( not ( = ?auto_57246 ?auto_57249 ) ) ( not ( = ?auto_57246 ?auto_57250 ) ) ( not ( = ?auto_57246 ?auto_57251 ) ) ( not ( = ?auto_57247 ?auto_57248 ) ) ( not ( = ?auto_57247 ?auto_57249 ) ) ( not ( = ?auto_57247 ?auto_57250 ) ) ( not ( = ?auto_57247 ?auto_57251 ) ) ( not ( = ?auto_57248 ?auto_57249 ) ) ( not ( = ?auto_57248 ?auto_57250 ) ) ( not ( = ?auto_57248 ?auto_57251 ) ) ( not ( = ?auto_57249 ?auto_57250 ) ) ( not ( = ?auto_57249 ?auto_57251 ) ) ( not ( = ?auto_57250 ?auto_57251 ) ) ( ON ?auto_57249 ?auto_57250 ) ( ON ?auto_57248 ?auto_57249 ) ( ON ?auto_57247 ?auto_57248 ) ( ON ?auto_57246 ?auto_57247 ) ( CLEAR ?auto_57244 ) ( ON ?auto_57245 ?auto_57246 ) ( CLEAR ?auto_57245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57242 ?auto_57243 ?auto_57244 ?auto_57245 )
      ( MAKE-9PILE ?auto_57242 ?auto_57243 ?auto_57244 ?auto_57245 ?auto_57246 ?auto_57247 ?auto_57248 ?auto_57249 ?auto_57250 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_57261 - BLOCK
      ?auto_57262 - BLOCK
      ?auto_57263 - BLOCK
      ?auto_57264 - BLOCK
      ?auto_57265 - BLOCK
      ?auto_57266 - BLOCK
      ?auto_57267 - BLOCK
      ?auto_57268 - BLOCK
      ?auto_57269 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57269 ) ( ON-TABLE ?auto_57261 ) ( ON ?auto_57262 ?auto_57261 ) ( ON ?auto_57263 ?auto_57262 ) ( not ( = ?auto_57261 ?auto_57262 ) ) ( not ( = ?auto_57261 ?auto_57263 ) ) ( not ( = ?auto_57261 ?auto_57264 ) ) ( not ( = ?auto_57261 ?auto_57265 ) ) ( not ( = ?auto_57261 ?auto_57266 ) ) ( not ( = ?auto_57261 ?auto_57267 ) ) ( not ( = ?auto_57261 ?auto_57268 ) ) ( not ( = ?auto_57261 ?auto_57269 ) ) ( not ( = ?auto_57262 ?auto_57263 ) ) ( not ( = ?auto_57262 ?auto_57264 ) ) ( not ( = ?auto_57262 ?auto_57265 ) ) ( not ( = ?auto_57262 ?auto_57266 ) ) ( not ( = ?auto_57262 ?auto_57267 ) ) ( not ( = ?auto_57262 ?auto_57268 ) ) ( not ( = ?auto_57262 ?auto_57269 ) ) ( not ( = ?auto_57263 ?auto_57264 ) ) ( not ( = ?auto_57263 ?auto_57265 ) ) ( not ( = ?auto_57263 ?auto_57266 ) ) ( not ( = ?auto_57263 ?auto_57267 ) ) ( not ( = ?auto_57263 ?auto_57268 ) ) ( not ( = ?auto_57263 ?auto_57269 ) ) ( not ( = ?auto_57264 ?auto_57265 ) ) ( not ( = ?auto_57264 ?auto_57266 ) ) ( not ( = ?auto_57264 ?auto_57267 ) ) ( not ( = ?auto_57264 ?auto_57268 ) ) ( not ( = ?auto_57264 ?auto_57269 ) ) ( not ( = ?auto_57265 ?auto_57266 ) ) ( not ( = ?auto_57265 ?auto_57267 ) ) ( not ( = ?auto_57265 ?auto_57268 ) ) ( not ( = ?auto_57265 ?auto_57269 ) ) ( not ( = ?auto_57266 ?auto_57267 ) ) ( not ( = ?auto_57266 ?auto_57268 ) ) ( not ( = ?auto_57266 ?auto_57269 ) ) ( not ( = ?auto_57267 ?auto_57268 ) ) ( not ( = ?auto_57267 ?auto_57269 ) ) ( not ( = ?auto_57268 ?auto_57269 ) ) ( ON ?auto_57268 ?auto_57269 ) ( ON ?auto_57267 ?auto_57268 ) ( ON ?auto_57266 ?auto_57267 ) ( ON ?auto_57265 ?auto_57266 ) ( CLEAR ?auto_57263 ) ( ON ?auto_57264 ?auto_57265 ) ( CLEAR ?auto_57264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57261 ?auto_57262 ?auto_57263 ?auto_57264 )
      ( MAKE-9PILE ?auto_57261 ?auto_57262 ?auto_57263 ?auto_57264 ?auto_57265 ?auto_57266 ?auto_57267 ?auto_57268 ?auto_57269 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_57279 - BLOCK
      ?auto_57280 - BLOCK
      ?auto_57281 - BLOCK
      ?auto_57282 - BLOCK
      ?auto_57283 - BLOCK
      ?auto_57284 - BLOCK
      ?auto_57285 - BLOCK
      ?auto_57286 - BLOCK
      ?auto_57287 - BLOCK
    )
    :vars
    (
      ?auto_57288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57287 ?auto_57288 ) ( ON-TABLE ?auto_57279 ) ( ON ?auto_57280 ?auto_57279 ) ( not ( = ?auto_57279 ?auto_57280 ) ) ( not ( = ?auto_57279 ?auto_57281 ) ) ( not ( = ?auto_57279 ?auto_57282 ) ) ( not ( = ?auto_57279 ?auto_57283 ) ) ( not ( = ?auto_57279 ?auto_57284 ) ) ( not ( = ?auto_57279 ?auto_57285 ) ) ( not ( = ?auto_57279 ?auto_57286 ) ) ( not ( = ?auto_57279 ?auto_57287 ) ) ( not ( = ?auto_57279 ?auto_57288 ) ) ( not ( = ?auto_57280 ?auto_57281 ) ) ( not ( = ?auto_57280 ?auto_57282 ) ) ( not ( = ?auto_57280 ?auto_57283 ) ) ( not ( = ?auto_57280 ?auto_57284 ) ) ( not ( = ?auto_57280 ?auto_57285 ) ) ( not ( = ?auto_57280 ?auto_57286 ) ) ( not ( = ?auto_57280 ?auto_57287 ) ) ( not ( = ?auto_57280 ?auto_57288 ) ) ( not ( = ?auto_57281 ?auto_57282 ) ) ( not ( = ?auto_57281 ?auto_57283 ) ) ( not ( = ?auto_57281 ?auto_57284 ) ) ( not ( = ?auto_57281 ?auto_57285 ) ) ( not ( = ?auto_57281 ?auto_57286 ) ) ( not ( = ?auto_57281 ?auto_57287 ) ) ( not ( = ?auto_57281 ?auto_57288 ) ) ( not ( = ?auto_57282 ?auto_57283 ) ) ( not ( = ?auto_57282 ?auto_57284 ) ) ( not ( = ?auto_57282 ?auto_57285 ) ) ( not ( = ?auto_57282 ?auto_57286 ) ) ( not ( = ?auto_57282 ?auto_57287 ) ) ( not ( = ?auto_57282 ?auto_57288 ) ) ( not ( = ?auto_57283 ?auto_57284 ) ) ( not ( = ?auto_57283 ?auto_57285 ) ) ( not ( = ?auto_57283 ?auto_57286 ) ) ( not ( = ?auto_57283 ?auto_57287 ) ) ( not ( = ?auto_57283 ?auto_57288 ) ) ( not ( = ?auto_57284 ?auto_57285 ) ) ( not ( = ?auto_57284 ?auto_57286 ) ) ( not ( = ?auto_57284 ?auto_57287 ) ) ( not ( = ?auto_57284 ?auto_57288 ) ) ( not ( = ?auto_57285 ?auto_57286 ) ) ( not ( = ?auto_57285 ?auto_57287 ) ) ( not ( = ?auto_57285 ?auto_57288 ) ) ( not ( = ?auto_57286 ?auto_57287 ) ) ( not ( = ?auto_57286 ?auto_57288 ) ) ( not ( = ?auto_57287 ?auto_57288 ) ) ( ON ?auto_57286 ?auto_57287 ) ( ON ?auto_57285 ?auto_57286 ) ( ON ?auto_57284 ?auto_57285 ) ( ON ?auto_57283 ?auto_57284 ) ( ON ?auto_57282 ?auto_57283 ) ( CLEAR ?auto_57280 ) ( ON ?auto_57281 ?auto_57282 ) ( CLEAR ?auto_57281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57279 ?auto_57280 ?auto_57281 )
      ( MAKE-9PILE ?auto_57279 ?auto_57280 ?auto_57281 ?auto_57282 ?auto_57283 ?auto_57284 ?auto_57285 ?auto_57286 ?auto_57287 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_57298 - BLOCK
      ?auto_57299 - BLOCK
      ?auto_57300 - BLOCK
      ?auto_57301 - BLOCK
      ?auto_57302 - BLOCK
      ?auto_57303 - BLOCK
      ?auto_57304 - BLOCK
      ?auto_57305 - BLOCK
      ?auto_57306 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57306 ) ( ON-TABLE ?auto_57298 ) ( ON ?auto_57299 ?auto_57298 ) ( not ( = ?auto_57298 ?auto_57299 ) ) ( not ( = ?auto_57298 ?auto_57300 ) ) ( not ( = ?auto_57298 ?auto_57301 ) ) ( not ( = ?auto_57298 ?auto_57302 ) ) ( not ( = ?auto_57298 ?auto_57303 ) ) ( not ( = ?auto_57298 ?auto_57304 ) ) ( not ( = ?auto_57298 ?auto_57305 ) ) ( not ( = ?auto_57298 ?auto_57306 ) ) ( not ( = ?auto_57299 ?auto_57300 ) ) ( not ( = ?auto_57299 ?auto_57301 ) ) ( not ( = ?auto_57299 ?auto_57302 ) ) ( not ( = ?auto_57299 ?auto_57303 ) ) ( not ( = ?auto_57299 ?auto_57304 ) ) ( not ( = ?auto_57299 ?auto_57305 ) ) ( not ( = ?auto_57299 ?auto_57306 ) ) ( not ( = ?auto_57300 ?auto_57301 ) ) ( not ( = ?auto_57300 ?auto_57302 ) ) ( not ( = ?auto_57300 ?auto_57303 ) ) ( not ( = ?auto_57300 ?auto_57304 ) ) ( not ( = ?auto_57300 ?auto_57305 ) ) ( not ( = ?auto_57300 ?auto_57306 ) ) ( not ( = ?auto_57301 ?auto_57302 ) ) ( not ( = ?auto_57301 ?auto_57303 ) ) ( not ( = ?auto_57301 ?auto_57304 ) ) ( not ( = ?auto_57301 ?auto_57305 ) ) ( not ( = ?auto_57301 ?auto_57306 ) ) ( not ( = ?auto_57302 ?auto_57303 ) ) ( not ( = ?auto_57302 ?auto_57304 ) ) ( not ( = ?auto_57302 ?auto_57305 ) ) ( not ( = ?auto_57302 ?auto_57306 ) ) ( not ( = ?auto_57303 ?auto_57304 ) ) ( not ( = ?auto_57303 ?auto_57305 ) ) ( not ( = ?auto_57303 ?auto_57306 ) ) ( not ( = ?auto_57304 ?auto_57305 ) ) ( not ( = ?auto_57304 ?auto_57306 ) ) ( not ( = ?auto_57305 ?auto_57306 ) ) ( ON ?auto_57305 ?auto_57306 ) ( ON ?auto_57304 ?auto_57305 ) ( ON ?auto_57303 ?auto_57304 ) ( ON ?auto_57302 ?auto_57303 ) ( ON ?auto_57301 ?auto_57302 ) ( CLEAR ?auto_57299 ) ( ON ?auto_57300 ?auto_57301 ) ( CLEAR ?auto_57300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57298 ?auto_57299 ?auto_57300 )
      ( MAKE-9PILE ?auto_57298 ?auto_57299 ?auto_57300 ?auto_57301 ?auto_57302 ?auto_57303 ?auto_57304 ?auto_57305 ?auto_57306 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_57316 - BLOCK
      ?auto_57317 - BLOCK
      ?auto_57318 - BLOCK
      ?auto_57319 - BLOCK
      ?auto_57320 - BLOCK
      ?auto_57321 - BLOCK
      ?auto_57322 - BLOCK
      ?auto_57323 - BLOCK
      ?auto_57324 - BLOCK
    )
    :vars
    (
      ?auto_57325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57324 ?auto_57325 ) ( ON-TABLE ?auto_57316 ) ( not ( = ?auto_57316 ?auto_57317 ) ) ( not ( = ?auto_57316 ?auto_57318 ) ) ( not ( = ?auto_57316 ?auto_57319 ) ) ( not ( = ?auto_57316 ?auto_57320 ) ) ( not ( = ?auto_57316 ?auto_57321 ) ) ( not ( = ?auto_57316 ?auto_57322 ) ) ( not ( = ?auto_57316 ?auto_57323 ) ) ( not ( = ?auto_57316 ?auto_57324 ) ) ( not ( = ?auto_57316 ?auto_57325 ) ) ( not ( = ?auto_57317 ?auto_57318 ) ) ( not ( = ?auto_57317 ?auto_57319 ) ) ( not ( = ?auto_57317 ?auto_57320 ) ) ( not ( = ?auto_57317 ?auto_57321 ) ) ( not ( = ?auto_57317 ?auto_57322 ) ) ( not ( = ?auto_57317 ?auto_57323 ) ) ( not ( = ?auto_57317 ?auto_57324 ) ) ( not ( = ?auto_57317 ?auto_57325 ) ) ( not ( = ?auto_57318 ?auto_57319 ) ) ( not ( = ?auto_57318 ?auto_57320 ) ) ( not ( = ?auto_57318 ?auto_57321 ) ) ( not ( = ?auto_57318 ?auto_57322 ) ) ( not ( = ?auto_57318 ?auto_57323 ) ) ( not ( = ?auto_57318 ?auto_57324 ) ) ( not ( = ?auto_57318 ?auto_57325 ) ) ( not ( = ?auto_57319 ?auto_57320 ) ) ( not ( = ?auto_57319 ?auto_57321 ) ) ( not ( = ?auto_57319 ?auto_57322 ) ) ( not ( = ?auto_57319 ?auto_57323 ) ) ( not ( = ?auto_57319 ?auto_57324 ) ) ( not ( = ?auto_57319 ?auto_57325 ) ) ( not ( = ?auto_57320 ?auto_57321 ) ) ( not ( = ?auto_57320 ?auto_57322 ) ) ( not ( = ?auto_57320 ?auto_57323 ) ) ( not ( = ?auto_57320 ?auto_57324 ) ) ( not ( = ?auto_57320 ?auto_57325 ) ) ( not ( = ?auto_57321 ?auto_57322 ) ) ( not ( = ?auto_57321 ?auto_57323 ) ) ( not ( = ?auto_57321 ?auto_57324 ) ) ( not ( = ?auto_57321 ?auto_57325 ) ) ( not ( = ?auto_57322 ?auto_57323 ) ) ( not ( = ?auto_57322 ?auto_57324 ) ) ( not ( = ?auto_57322 ?auto_57325 ) ) ( not ( = ?auto_57323 ?auto_57324 ) ) ( not ( = ?auto_57323 ?auto_57325 ) ) ( not ( = ?auto_57324 ?auto_57325 ) ) ( ON ?auto_57323 ?auto_57324 ) ( ON ?auto_57322 ?auto_57323 ) ( ON ?auto_57321 ?auto_57322 ) ( ON ?auto_57320 ?auto_57321 ) ( ON ?auto_57319 ?auto_57320 ) ( ON ?auto_57318 ?auto_57319 ) ( CLEAR ?auto_57316 ) ( ON ?auto_57317 ?auto_57318 ) ( CLEAR ?auto_57317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57316 ?auto_57317 )
      ( MAKE-9PILE ?auto_57316 ?auto_57317 ?auto_57318 ?auto_57319 ?auto_57320 ?auto_57321 ?auto_57322 ?auto_57323 ?auto_57324 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_57335 - BLOCK
      ?auto_57336 - BLOCK
      ?auto_57337 - BLOCK
      ?auto_57338 - BLOCK
      ?auto_57339 - BLOCK
      ?auto_57340 - BLOCK
      ?auto_57341 - BLOCK
      ?auto_57342 - BLOCK
      ?auto_57343 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57343 ) ( ON-TABLE ?auto_57335 ) ( not ( = ?auto_57335 ?auto_57336 ) ) ( not ( = ?auto_57335 ?auto_57337 ) ) ( not ( = ?auto_57335 ?auto_57338 ) ) ( not ( = ?auto_57335 ?auto_57339 ) ) ( not ( = ?auto_57335 ?auto_57340 ) ) ( not ( = ?auto_57335 ?auto_57341 ) ) ( not ( = ?auto_57335 ?auto_57342 ) ) ( not ( = ?auto_57335 ?auto_57343 ) ) ( not ( = ?auto_57336 ?auto_57337 ) ) ( not ( = ?auto_57336 ?auto_57338 ) ) ( not ( = ?auto_57336 ?auto_57339 ) ) ( not ( = ?auto_57336 ?auto_57340 ) ) ( not ( = ?auto_57336 ?auto_57341 ) ) ( not ( = ?auto_57336 ?auto_57342 ) ) ( not ( = ?auto_57336 ?auto_57343 ) ) ( not ( = ?auto_57337 ?auto_57338 ) ) ( not ( = ?auto_57337 ?auto_57339 ) ) ( not ( = ?auto_57337 ?auto_57340 ) ) ( not ( = ?auto_57337 ?auto_57341 ) ) ( not ( = ?auto_57337 ?auto_57342 ) ) ( not ( = ?auto_57337 ?auto_57343 ) ) ( not ( = ?auto_57338 ?auto_57339 ) ) ( not ( = ?auto_57338 ?auto_57340 ) ) ( not ( = ?auto_57338 ?auto_57341 ) ) ( not ( = ?auto_57338 ?auto_57342 ) ) ( not ( = ?auto_57338 ?auto_57343 ) ) ( not ( = ?auto_57339 ?auto_57340 ) ) ( not ( = ?auto_57339 ?auto_57341 ) ) ( not ( = ?auto_57339 ?auto_57342 ) ) ( not ( = ?auto_57339 ?auto_57343 ) ) ( not ( = ?auto_57340 ?auto_57341 ) ) ( not ( = ?auto_57340 ?auto_57342 ) ) ( not ( = ?auto_57340 ?auto_57343 ) ) ( not ( = ?auto_57341 ?auto_57342 ) ) ( not ( = ?auto_57341 ?auto_57343 ) ) ( not ( = ?auto_57342 ?auto_57343 ) ) ( ON ?auto_57342 ?auto_57343 ) ( ON ?auto_57341 ?auto_57342 ) ( ON ?auto_57340 ?auto_57341 ) ( ON ?auto_57339 ?auto_57340 ) ( ON ?auto_57338 ?auto_57339 ) ( ON ?auto_57337 ?auto_57338 ) ( CLEAR ?auto_57335 ) ( ON ?auto_57336 ?auto_57337 ) ( CLEAR ?auto_57336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57335 ?auto_57336 )
      ( MAKE-9PILE ?auto_57335 ?auto_57336 ?auto_57337 ?auto_57338 ?auto_57339 ?auto_57340 ?auto_57341 ?auto_57342 ?auto_57343 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_57353 - BLOCK
      ?auto_57354 - BLOCK
      ?auto_57355 - BLOCK
      ?auto_57356 - BLOCK
      ?auto_57357 - BLOCK
      ?auto_57358 - BLOCK
      ?auto_57359 - BLOCK
      ?auto_57360 - BLOCK
      ?auto_57361 - BLOCK
    )
    :vars
    (
      ?auto_57362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57361 ?auto_57362 ) ( not ( = ?auto_57353 ?auto_57354 ) ) ( not ( = ?auto_57353 ?auto_57355 ) ) ( not ( = ?auto_57353 ?auto_57356 ) ) ( not ( = ?auto_57353 ?auto_57357 ) ) ( not ( = ?auto_57353 ?auto_57358 ) ) ( not ( = ?auto_57353 ?auto_57359 ) ) ( not ( = ?auto_57353 ?auto_57360 ) ) ( not ( = ?auto_57353 ?auto_57361 ) ) ( not ( = ?auto_57353 ?auto_57362 ) ) ( not ( = ?auto_57354 ?auto_57355 ) ) ( not ( = ?auto_57354 ?auto_57356 ) ) ( not ( = ?auto_57354 ?auto_57357 ) ) ( not ( = ?auto_57354 ?auto_57358 ) ) ( not ( = ?auto_57354 ?auto_57359 ) ) ( not ( = ?auto_57354 ?auto_57360 ) ) ( not ( = ?auto_57354 ?auto_57361 ) ) ( not ( = ?auto_57354 ?auto_57362 ) ) ( not ( = ?auto_57355 ?auto_57356 ) ) ( not ( = ?auto_57355 ?auto_57357 ) ) ( not ( = ?auto_57355 ?auto_57358 ) ) ( not ( = ?auto_57355 ?auto_57359 ) ) ( not ( = ?auto_57355 ?auto_57360 ) ) ( not ( = ?auto_57355 ?auto_57361 ) ) ( not ( = ?auto_57355 ?auto_57362 ) ) ( not ( = ?auto_57356 ?auto_57357 ) ) ( not ( = ?auto_57356 ?auto_57358 ) ) ( not ( = ?auto_57356 ?auto_57359 ) ) ( not ( = ?auto_57356 ?auto_57360 ) ) ( not ( = ?auto_57356 ?auto_57361 ) ) ( not ( = ?auto_57356 ?auto_57362 ) ) ( not ( = ?auto_57357 ?auto_57358 ) ) ( not ( = ?auto_57357 ?auto_57359 ) ) ( not ( = ?auto_57357 ?auto_57360 ) ) ( not ( = ?auto_57357 ?auto_57361 ) ) ( not ( = ?auto_57357 ?auto_57362 ) ) ( not ( = ?auto_57358 ?auto_57359 ) ) ( not ( = ?auto_57358 ?auto_57360 ) ) ( not ( = ?auto_57358 ?auto_57361 ) ) ( not ( = ?auto_57358 ?auto_57362 ) ) ( not ( = ?auto_57359 ?auto_57360 ) ) ( not ( = ?auto_57359 ?auto_57361 ) ) ( not ( = ?auto_57359 ?auto_57362 ) ) ( not ( = ?auto_57360 ?auto_57361 ) ) ( not ( = ?auto_57360 ?auto_57362 ) ) ( not ( = ?auto_57361 ?auto_57362 ) ) ( ON ?auto_57360 ?auto_57361 ) ( ON ?auto_57359 ?auto_57360 ) ( ON ?auto_57358 ?auto_57359 ) ( ON ?auto_57357 ?auto_57358 ) ( ON ?auto_57356 ?auto_57357 ) ( ON ?auto_57355 ?auto_57356 ) ( ON ?auto_57354 ?auto_57355 ) ( ON ?auto_57353 ?auto_57354 ) ( CLEAR ?auto_57353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57353 )
      ( MAKE-9PILE ?auto_57353 ?auto_57354 ?auto_57355 ?auto_57356 ?auto_57357 ?auto_57358 ?auto_57359 ?auto_57360 ?auto_57361 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_57372 - BLOCK
      ?auto_57373 - BLOCK
      ?auto_57374 - BLOCK
      ?auto_57375 - BLOCK
      ?auto_57376 - BLOCK
      ?auto_57377 - BLOCK
      ?auto_57378 - BLOCK
      ?auto_57379 - BLOCK
      ?auto_57380 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57380 ) ( not ( = ?auto_57372 ?auto_57373 ) ) ( not ( = ?auto_57372 ?auto_57374 ) ) ( not ( = ?auto_57372 ?auto_57375 ) ) ( not ( = ?auto_57372 ?auto_57376 ) ) ( not ( = ?auto_57372 ?auto_57377 ) ) ( not ( = ?auto_57372 ?auto_57378 ) ) ( not ( = ?auto_57372 ?auto_57379 ) ) ( not ( = ?auto_57372 ?auto_57380 ) ) ( not ( = ?auto_57373 ?auto_57374 ) ) ( not ( = ?auto_57373 ?auto_57375 ) ) ( not ( = ?auto_57373 ?auto_57376 ) ) ( not ( = ?auto_57373 ?auto_57377 ) ) ( not ( = ?auto_57373 ?auto_57378 ) ) ( not ( = ?auto_57373 ?auto_57379 ) ) ( not ( = ?auto_57373 ?auto_57380 ) ) ( not ( = ?auto_57374 ?auto_57375 ) ) ( not ( = ?auto_57374 ?auto_57376 ) ) ( not ( = ?auto_57374 ?auto_57377 ) ) ( not ( = ?auto_57374 ?auto_57378 ) ) ( not ( = ?auto_57374 ?auto_57379 ) ) ( not ( = ?auto_57374 ?auto_57380 ) ) ( not ( = ?auto_57375 ?auto_57376 ) ) ( not ( = ?auto_57375 ?auto_57377 ) ) ( not ( = ?auto_57375 ?auto_57378 ) ) ( not ( = ?auto_57375 ?auto_57379 ) ) ( not ( = ?auto_57375 ?auto_57380 ) ) ( not ( = ?auto_57376 ?auto_57377 ) ) ( not ( = ?auto_57376 ?auto_57378 ) ) ( not ( = ?auto_57376 ?auto_57379 ) ) ( not ( = ?auto_57376 ?auto_57380 ) ) ( not ( = ?auto_57377 ?auto_57378 ) ) ( not ( = ?auto_57377 ?auto_57379 ) ) ( not ( = ?auto_57377 ?auto_57380 ) ) ( not ( = ?auto_57378 ?auto_57379 ) ) ( not ( = ?auto_57378 ?auto_57380 ) ) ( not ( = ?auto_57379 ?auto_57380 ) ) ( ON ?auto_57379 ?auto_57380 ) ( ON ?auto_57378 ?auto_57379 ) ( ON ?auto_57377 ?auto_57378 ) ( ON ?auto_57376 ?auto_57377 ) ( ON ?auto_57375 ?auto_57376 ) ( ON ?auto_57374 ?auto_57375 ) ( ON ?auto_57373 ?auto_57374 ) ( ON ?auto_57372 ?auto_57373 ) ( CLEAR ?auto_57372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57372 )
      ( MAKE-9PILE ?auto_57372 ?auto_57373 ?auto_57374 ?auto_57375 ?auto_57376 ?auto_57377 ?auto_57378 ?auto_57379 ?auto_57380 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_57390 - BLOCK
      ?auto_57391 - BLOCK
      ?auto_57392 - BLOCK
      ?auto_57393 - BLOCK
      ?auto_57394 - BLOCK
      ?auto_57395 - BLOCK
      ?auto_57396 - BLOCK
      ?auto_57397 - BLOCK
      ?auto_57398 - BLOCK
    )
    :vars
    (
      ?auto_57399 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57390 ?auto_57391 ) ) ( not ( = ?auto_57390 ?auto_57392 ) ) ( not ( = ?auto_57390 ?auto_57393 ) ) ( not ( = ?auto_57390 ?auto_57394 ) ) ( not ( = ?auto_57390 ?auto_57395 ) ) ( not ( = ?auto_57390 ?auto_57396 ) ) ( not ( = ?auto_57390 ?auto_57397 ) ) ( not ( = ?auto_57390 ?auto_57398 ) ) ( not ( = ?auto_57391 ?auto_57392 ) ) ( not ( = ?auto_57391 ?auto_57393 ) ) ( not ( = ?auto_57391 ?auto_57394 ) ) ( not ( = ?auto_57391 ?auto_57395 ) ) ( not ( = ?auto_57391 ?auto_57396 ) ) ( not ( = ?auto_57391 ?auto_57397 ) ) ( not ( = ?auto_57391 ?auto_57398 ) ) ( not ( = ?auto_57392 ?auto_57393 ) ) ( not ( = ?auto_57392 ?auto_57394 ) ) ( not ( = ?auto_57392 ?auto_57395 ) ) ( not ( = ?auto_57392 ?auto_57396 ) ) ( not ( = ?auto_57392 ?auto_57397 ) ) ( not ( = ?auto_57392 ?auto_57398 ) ) ( not ( = ?auto_57393 ?auto_57394 ) ) ( not ( = ?auto_57393 ?auto_57395 ) ) ( not ( = ?auto_57393 ?auto_57396 ) ) ( not ( = ?auto_57393 ?auto_57397 ) ) ( not ( = ?auto_57393 ?auto_57398 ) ) ( not ( = ?auto_57394 ?auto_57395 ) ) ( not ( = ?auto_57394 ?auto_57396 ) ) ( not ( = ?auto_57394 ?auto_57397 ) ) ( not ( = ?auto_57394 ?auto_57398 ) ) ( not ( = ?auto_57395 ?auto_57396 ) ) ( not ( = ?auto_57395 ?auto_57397 ) ) ( not ( = ?auto_57395 ?auto_57398 ) ) ( not ( = ?auto_57396 ?auto_57397 ) ) ( not ( = ?auto_57396 ?auto_57398 ) ) ( not ( = ?auto_57397 ?auto_57398 ) ) ( ON ?auto_57390 ?auto_57399 ) ( not ( = ?auto_57398 ?auto_57399 ) ) ( not ( = ?auto_57397 ?auto_57399 ) ) ( not ( = ?auto_57396 ?auto_57399 ) ) ( not ( = ?auto_57395 ?auto_57399 ) ) ( not ( = ?auto_57394 ?auto_57399 ) ) ( not ( = ?auto_57393 ?auto_57399 ) ) ( not ( = ?auto_57392 ?auto_57399 ) ) ( not ( = ?auto_57391 ?auto_57399 ) ) ( not ( = ?auto_57390 ?auto_57399 ) ) ( ON ?auto_57391 ?auto_57390 ) ( ON ?auto_57392 ?auto_57391 ) ( ON ?auto_57393 ?auto_57392 ) ( ON ?auto_57394 ?auto_57393 ) ( ON ?auto_57395 ?auto_57394 ) ( ON ?auto_57396 ?auto_57395 ) ( ON ?auto_57397 ?auto_57396 ) ( ON ?auto_57398 ?auto_57397 ) ( CLEAR ?auto_57398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_57398 ?auto_57397 ?auto_57396 ?auto_57395 ?auto_57394 ?auto_57393 ?auto_57392 ?auto_57391 ?auto_57390 )
      ( MAKE-9PILE ?auto_57390 ?auto_57391 ?auto_57392 ?auto_57393 ?auto_57394 ?auto_57395 ?auto_57396 ?auto_57397 ?auto_57398 ) )
  )

)

