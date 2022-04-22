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
      ?auto_25165 - BLOCK
    )
    :vars
    (
      ?auto_25166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25165 ?auto_25166 ) ( CLEAR ?auto_25165 ) ( HAND-EMPTY ) ( not ( = ?auto_25165 ?auto_25166 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25165 ?auto_25166 )
      ( !PUTDOWN ?auto_25165 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25172 - BLOCK
      ?auto_25173 - BLOCK
    )
    :vars
    (
      ?auto_25174 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25172 ) ( ON ?auto_25173 ?auto_25174 ) ( CLEAR ?auto_25173 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25172 ) ( not ( = ?auto_25172 ?auto_25173 ) ) ( not ( = ?auto_25172 ?auto_25174 ) ) ( not ( = ?auto_25173 ?auto_25174 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25173 ?auto_25174 )
      ( !STACK ?auto_25173 ?auto_25172 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25182 - BLOCK
      ?auto_25183 - BLOCK
    )
    :vars
    (
      ?auto_25184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25183 ?auto_25184 ) ( not ( = ?auto_25182 ?auto_25183 ) ) ( not ( = ?auto_25182 ?auto_25184 ) ) ( not ( = ?auto_25183 ?auto_25184 ) ) ( ON ?auto_25182 ?auto_25183 ) ( CLEAR ?auto_25182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25182 )
      ( MAKE-2PILE ?auto_25182 ?auto_25183 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25193 - BLOCK
      ?auto_25194 - BLOCK
      ?auto_25195 - BLOCK
    )
    :vars
    (
      ?auto_25196 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25194 ) ( ON ?auto_25195 ?auto_25196 ) ( CLEAR ?auto_25195 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25193 ) ( ON ?auto_25194 ?auto_25193 ) ( not ( = ?auto_25193 ?auto_25194 ) ) ( not ( = ?auto_25193 ?auto_25195 ) ) ( not ( = ?auto_25193 ?auto_25196 ) ) ( not ( = ?auto_25194 ?auto_25195 ) ) ( not ( = ?auto_25194 ?auto_25196 ) ) ( not ( = ?auto_25195 ?auto_25196 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25195 ?auto_25196 )
      ( !STACK ?auto_25195 ?auto_25194 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25207 - BLOCK
      ?auto_25208 - BLOCK
      ?auto_25209 - BLOCK
    )
    :vars
    (
      ?auto_25210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25209 ?auto_25210 ) ( ON-TABLE ?auto_25207 ) ( not ( = ?auto_25207 ?auto_25208 ) ) ( not ( = ?auto_25207 ?auto_25209 ) ) ( not ( = ?auto_25207 ?auto_25210 ) ) ( not ( = ?auto_25208 ?auto_25209 ) ) ( not ( = ?auto_25208 ?auto_25210 ) ) ( not ( = ?auto_25209 ?auto_25210 ) ) ( CLEAR ?auto_25207 ) ( ON ?auto_25208 ?auto_25209 ) ( CLEAR ?auto_25208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25207 ?auto_25208 )
      ( MAKE-3PILE ?auto_25207 ?auto_25208 ?auto_25209 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25221 - BLOCK
      ?auto_25222 - BLOCK
      ?auto_25223 - BLOCK
    )
    :vars
    (
      ?auto_25224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25223 ?auto_25224 ) ( not ( = ?auto_25221 ?auto_25222 ) ) ( not ( = ?auto_25221 ?auto_25223 ) ) ( not ( = ?auto_25221 ?auto_25224 ) ) ( not ( = ?auto_25222 ?auto_25223 ) ) ( not ( = ?auto_25222 ?auto_25224 ) ) ( not ( = ?auto_25223 ?auto_25224 ) ) ( ON ?auto_25222 ?auto_25223 ) ( ON ?auto_25221 ?auto_25222 ) ( CLEAR ?auto_25221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25221 )
      ( MAKE-3PILE ?auto_25221 ?auto_25222 ?auto_25223 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25236 - BLOCK
      ?auto_25237 - BLOCK
      ?auto_25238 - BLOCK
      ?auto_25239 - BLOCK
    )
    :vars
    (
      ?auto_25240 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25238 ) ( ON ?auto_25239 ?auto_25240 ) ( CLEAR ?auto_25239 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25236 ) ( ON ?auto_25237 ?auto_25236 ) ( ON ?auto_25238 ?auto_25237 ) ( not ( = ?auto_25236 ?auto_25237 ) ) ( not ( = ?auto_25236 ?auto_25238 ) ) ( not ( = ?auto_25236 ?auto_25239 ) ) ( not ( = ?auto_25236 ?auto_25240 ) ) ( not ( = ?auto_25237 ?auto_25238 ) ) ( not ( = ?auto_25237 ?auto_25239 ) ) ( not ( = ?auto_25237 ?auto_25240 ) ) ( not ( = ?auto_25238 ?auto_25239 ) ) ( not ( = ?auto_25238 ?auto_25240 ) ) ( not ( = ?auto_25239 ?auto_25240 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25239 ?auto_25240 )
      ( !STACK ?auto_25239 ?auto_25238 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25254 - BLOCK
      ?auto_25255 - BLOCK
      ?auto_25256 - BLOCK
      ?auto_25257 - BLOCK
    )
    :vars
    (
      ?auto_25258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25257 ?auto_25258 ) ( ON-TABLE ?auto_25254 ) ( ON ?auto_25255 ?auto_25254 ) ( not ( = ?auto_25254 ?auto_25255 ) ) ( not ( = ?auto_25254 ?auto_25256 ) ) ( not ( = ?auto_25254 ?auto_25257 ) ) ( not ( = ?auto_25254 ?auto_25258 ) ) ( not ( = ?auto_25255 ?auto_25256 ) ) ( not ( = ?auto_25255 ?auto_25257 ) ) ( not ( = ?auto_25255 ?auto_25258 ) ) ( not ( = ?auto_25256 ?auto_25257 ) ) ( not ( = ?auto_25256 ?auto_25258 ) ) ( not ( = ?auto_25257 ?auto_25258 ) ) ( CLEAR ?auto_25255 ) ( ON ?auto_25256 ?auto_25257 ) ( CLEAR ?auto_25256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25254 ?auto_25255 ?auto_25256 )
      ( MAKE-4PILE ?auto_25254 ?auto_25255 ?auto_25256 ?auto_25257 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25272 - BLOCK
      ?auto_25273 - BLOCK
      ?auto_25274 - BLOCK
      ?auto_25275 - BLOCK
    )
    :vars
    (
      ?auto_25276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25275 ?auto_25276 ) ( ON-TABLE ?auto_25272 ) ( not ( = ?auto_25272 ?auto_25273 ) ) ( not ( = ?auto_25272 ?auto_25274 ) ) ( not ( = ?auto_25272 ?auto_25275 ) ) ( not ( = ?auto_25272 ?auto_25276 ) ) ( not ( = ?auto_25273 ?auto_25274 ) ) ( not ( = ?auto_25273 ?auto_25275 ) ) ( not ( = ?auto_25273 ?auto_25276 ) ) ( not ( = ?auto_25274 ?auto_25275 ) ) ( not ( = ?auto_25274 ?auto_25276 ) ) ( not ( = ?auto_25275 ?auto_25276 ) ) ( ON ?auto_25274 ?auto_25275 ) ( CLEAR ?auto_25272 ) ( ON ?auto_25273 ?auto_25274 ) ( CLEAR ?auto_25273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25272 ?auto_25273 )
      ( MAKE-4PILE ?auto_25272 ?auto_25273 ?auto_25274 ?auto_25275 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25290 - BLOCK
      ?auto_25291 - BLOCK
      ?auto_25292 - BLOCK
      ?auto_25293 - BLOCK
    )
    :vars
    (
      ?auto_25294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25293 ?auto_25294 ) ( not ( = ?auto_25290 ?auto_25291 ) ) ( not ( = ?auto_25290 ?auto_25292 ) ) ( not ( = ?auto_25290 ?auto_25293 ) ) ( not ( = ?auto_25290 ?auto_25294 ) ) ( not ( = ?auto_25291 ?auto_25292 ) ) ( not ( = ?auto_25291 ?auto_25293 ) ) ( not ( = ?auto_25291 ?auto_25294 ) ) ( not ( = ?auto_25292 ?auto_25293 ) ) ( not ( = ?auto_25292 ?auto_25294 ) ) ( not ( = ?auto_25293 ?auto_25294 ) ) ( ON ?auto_25292 ?auto_25293 ) ( ON ?auto_25291 ?auto_25292 ) ( ON ?auto_25290 ?auto_25291 ) ( CLEAR ?auto_25290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25290 )
      ( MAKE-4PILE ?auto_25290 ?auto_25291 ?auto_25292 ?auto_25293 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25309 - BLOCK
      ?auto_25310 - BLOCK
      ?auto_25311 - BLOCK
      ?auto_25312 - BLOCK
      ?auto_25313 - BLOCK
    )
    :vars
    (
      ?auto_25314 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25312 ) ( ON ?auto_25313 ?auto_25314 ) ( CLEAR ?auto_25313 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25309 ) ( ON ?auto_25310 ?auto_25309 ) ( ON ?auto_25311 ?auto_25310 ) ( ON ?auto_25312 ?auto_25311 ) ( not ( = ?auto_25309 ?auto_25310 ) ) ( not ( = ?auto_25309 ?auto_25311 ) ) ( not ( = ?auto_25309 ?auto_25312 ) ) ( not ( = ?auto_25309 ?auto_25313 ) ) ( not ( = ?auto_25309 ?auto_25314 ) ) ( not ( = ?auto_25310 ?auto_25311 ) ) ( not ( = ?auto_25310 ?auto_25312 ) ) ( not ( = ?auto_25310 ?auto_25313 ) ) ( not ( = ?auto_25310 ?auto_25314 ) ) ( not ( = ?auto_25311 ?auto_25312 ) ) ( not ( = ?auto_25311 ?auto_25313 ) ) ( not ( = ?auto_25311 ?auto_25314 ) ) ( not ( = ?auto_25312 ?auto_25313 ) ) ( not ( = ?auto_25312 ?auto_25314 ) ) ( not ( = ?auto_25313 ?auto_25314 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25313 ?auto_25314 )
      ( !STACK ?auto_25313 ?auto_25312 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25331 - BLOCK
      ?auto_25332 - BLOCK
      ?auto_25333 - BLOCK
      ?auto_25334 - BLOCK
      ?auto_25335 - BLOCK
    )
    :vars
    (
      ?auto_25336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25335 ?auto_25336 ) ( ON-TABLE ?auto_25331 ) ( ON ?auto_25332 ?auto_25331 ) ( ON ?auto_25333 ?auto_25332 ) ( not ( = ?auto_25331 ?auto_25332 ) ) ( not ( = ?auto_25331 ?auto_25333 ) ) ( not ( = ?auto_25331 ?auto_25334 ) ) ( not ( = ?auto_25331 ?auto_25335 ) ) ( not ( = ?auto_25331 ?auto_25336 ) ) ( not ( = ?auto_25332 ?auto_25333 ) ) ( not ( = ?auto_25332 ?auto_25334 ) ) ( not ( = ?auto_25332 ?auto_25335 ) ) ( not ( = ?auto_25332 ?auto_25336 ) ) ( not ( = ?auto_25333 ?auto_25334 ) ) ( not ( = ?auto_25333 ?auto_25335 ) ) ( not ( = ?auto_25333 ?auto_25336 ) ) ( not ( = ?auto_25334 ?auto_25335 ) ) ( not ( = ?auto_25334 ?auto_25336 ) ) ( not ( = ?auto_25335 ?auto_25336 ) ) ( CLEAR ?auto_25333 ) ( ON ?auto_25334 ?auto_25335 ) ( CLEAR ?auto_25334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25331 ?auto_25332 ?auto_25333 ?auto_25334 )
      ( MAKE-5PILE ?auto_25331 ?auto_25332 ?auto_25333 ?auto_25334 ?auto_25335 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25353 - BLOCK
      ?auto_25354 - BLOCK
      ?auto_25355 - BLOCK
      ?auto_25356 - BLOCK
      ?auto_25357 - BLOCK
    )
    :vars
    (
      ?auto_25358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25357 ?auto_25358 ) ( ON-TABLE ?auto_25353 ) ( ON ?auto_25354 ?auto_25353 ) ( not ( = ?auto_25353 ?auto_25354 ) ) ( not ( = ?auto_25353 ?auto_25355 ) ) ( not ( = ?auto_25353 ?auto_25356 ) ) ( not ( = ?auto_25353 ?auto_25357 ) ) ( not ( = ?auto_25353 ?auto_25358 ) ) ( not ( = ?auto_25354 ?auto_25355 ) ) ( not ( = ?auto_25354 ?auto_25356 ) ) ( not ( = ?auto_25354 ?auto_25357 ) ) ( not ( = ?auto_25354 ?auto_25358 ) ) ( not ( = ?auto_25355 ?auto_25356 ) ) ( not ( = ?auto_25355 ?auto_25357 ) ) ( not ( = ?auto_25355 ?auto_25358 ) ) ( not ( = ?auto_25356 ?auto_25357 ) ) ( not ( = ?auto_25356 ?auto_25358 ) ) ( not ( = ?auto_25357 ?auto_25358 ) ) ( ON ?auto_25356 ?auto_25357 ) ( CLEAR ?auto_25354 ) ( ON ?auto_25355 ?auto_25356 ) ( CLEAR ?auto_25355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25353 ?auto_25354 ?auto_25355 )
      ( MAKE-5PILE ?auto_25353 ?auto_25354 ?auto_25355 ?auto_25356 ?auto_25357 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25375 - BLOCK
      ?auto_25376 - BLOCK
      ?auto_25377 - BLOCK
      ?auto_25378 - BLOCK
      ?auto_25379 - BLOCK
    )
    :vars
    (
      ?auto_25380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25379 ?auto_25380 ) ( ON-TABLE ?auto_25375 ) ( not ( = ?auto_25375 ?auto_25376 ) ) ( not ( = ?auto_25375 ?auto_25377 ) ) ( not ( = ?auto_25375 ?auto_25378 ) ) ( not ( = ?auto_25375 ?auto_25379 ) ) ( not ( = ?auto_25375 ?auto_25380 ) ) ( not ( = ?auto_25376 ?auto_25377 ) ) ( not ( = ?auto_25376 ?auto_25378 ) ) ( not ( = ?auto_25376 ?auto_25379 ) ) ( not ( = ?auto_25376 ?auto_25380 ) ) ( not ( = ?auto_25377 ?auto_25378 ) ) ( not ( = ?auto_25377 ?auto_25379 ) ) ( not ( = ?auto_25377 ?auto_25380 ) ) ( not ( = ?auto_25378 ?auto_25379 ) ) ( not ( = ?auto_25378 ?auto_25380 ) ) ( not ( = ?auto_25379 ?auto_25380 ) ) ( ON ?auto_25378 ?auto_25379 ) ( ON ?auto_25377 ?auto_25378 ) ( CLEAR ?auto_25375 ) ( ON ?auto_25376 ?auto_25377 ) ( CLEAR ?auto_25376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25375 ?auto_25376 )
      ( MAKE-5PILE ?auto_25375 ?auto_25376 ?auto_25377 ?auto_25378 ?auto_25379 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25397 - BLOCK
      ?auto_25398 - BLOCK
      ?auto_25399 - BLOCK
      ?auto_25400 - BLOCK
      ?auto_25401 - BLOCK
    )
    :vars
    (
      ?auto_25402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25401 ?auto_25402 ) ( not ( = ?auto_25397 ?auto_25398 ) ) ( not ( = ?auto_25397 ?auto_25399 ) ) ( not ( = ?auto_25397 ?auto_25400 ) ) ( not ( = ?auto_25397 ?auto_25401 ) ) ( not ( = ?auto_25397 ?auto_25402 ) ) ( not ( = ?auto_25398 ?auto_25399 ) ) ( not ( = ?auto_25398 ?auto_25400 ) ) ( not ( = ?auto_25398 ?auto_25401 ) ) ( not ( = ?auto_25398 ?auto_25402 ) ) ( not ( = ?auto_25399 ?auto_25400 ) ) ( not ( = ?auto_25399 ?auto_25401 ) ) ( not ( = ?auto_25399 ?auto_25402 ) ) ( not ( = ?auto_25400 ?auto_25401 ) ) ( not ( = ?auto_25400 ?auto_25402 ) ) ( not ( = ?auto_25401 ?auto_25402 ) ) ( ON ?auto_25400 ?auto_25401 ) ( ON ?auto_25399 ?auto_25400 ) ( ON ?auto_25398 ?auto_25399 ) ( ON ?auto_25397 ?auto_25398 ) ( CLEAR ?auto_25397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25397 )
      ( MAKE-5PILE ?auto_25397 ?auto_25398 ?auto_25399 ?auto_25400 ?auto_25401 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_25420 - BLOCK
      ?auto_25421 - BLOCK
      ?auto_25422 - BLOCK
      ?auto_25423 - BLOCK
      ?auto_25424 - BLOCK
      ?auto_25425 - BLOCK
    )
    :vars
    (
      ?auto_25426 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25424 ) ( ON ?auto_25425 ?auto_25426 ) ( CLEAR ?auto_25425 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25420 ) ( ON ?auto_25421 ?auto_25420 ) ( ON ?auto_25422 ?auto_25421 ) ( ON ?auto_25423 ?auto_25422 ) ( ON ?auto_25424 ?auto_25423 ) ( not ( = ?auto_25420 ?auto_25421 ) ) ( not ( = ?auto_25420 ?auto_25422 ) ) ( not ( = ?auto_25420 ?auto_25423 ) ) ( not ( = ?auto_25420 ?auto_25424 ) ) ( not ( = ?auto_25420 ?auto_25425 ) ) ( not ( = ?auto_25420 ?auto_25426 ) ) ( not ( = ?auto_25421 ?auto_25422 ) ) ( not ( = ?auto_25421 ?auto_25423 ) ) ( not ( = ?auto_25421 ?auto_25424 ) ) ( not ( = ?auto_25421 ?auto_25425 ) ) ( not ( = ?auto_25421 ?auto_25426 ) ) ( not ( = ?auto_25422 ?auto_25423 ) ) ( not ( = ?auto_25422 ?auto_25424 ) ) ( not ( = ?auto_25422 ?auto_25425 ) ) ( not ( = ?auto_25422 ?auto_25426 ) ) ( not ( = ?auto_25423 ?auto_25424 ) ) ( not ( = ?auto_25423 ?auto_25425 ) ) ( not ( = ?auto_25423 ?auto_25426 ) ) ( not ( = ?auto_25424 ?auto_25425 ) ) ( not ( = ?auto_25424 ?auto_25426 ) ) ( not ( = ?auto_25425 ?auto_25426 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25425 ?auto_25426 )
      ( !STACK ?auto_25425 ?auto_25424 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_25446 - BLOCK
      ?auto_25447 - BLOCK
      ?auto_25448 - BLOCK
      ?auto_25449 - BLOCK
      ?auto_25450 - BLOCK
      ?auto_25451 - BLOCK
    )
    :vars
    (
      ?auto_25452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25451 ?auto_25452 ) ( ON-TABLE ?auto_25446 ) ( ON ?auto_25447 ?auto_25446 ) ( ON ?auto_25448 ?auto_25447 ) ( ON ?auto_25449 ?auto_25448 ) ( not ( = ?auto_25446 ?auto_25447 ) ) ( not ( = ?auto_25446 ?auto_25448 ) ) ( not ( = ?auto_25446 ?auto_25449 ) ) ( not ( = ?auto_25446 ?auto_25450 ) ) ( not ( = ?auto_25446 ?auto_25451 ) ) ( not ( = ?auto_25446 ?auto_25452 ) ) ( not ( = ?auto_25447 ?auto_25448 ) ) ( not ( = ?auto_25447 ?auto_25449 ) ) ( not ( = ?auto_25447 ?auto_25450 ) ) ( not ( = ?auto_25447 ?auto_25451 ) ) ( not ( = ?auto_25447 ?auto_25452 ) ) ( not ( = ?auto_25448 ?auto_25449 ) ) ( not ( = ?auto_25448 ?auto_25450 ) ) ( not ( = ?auto_25448 ?auto_25451 ) ) ( not ( = ?auto_25448 ?auto_25452 ) ) ( not ( = ?auto_25449 ?auto_25450 ) ) ( not ( = ?auto_25449 ?auto_25451 ) ) ( not ( = ?auto_25449 ?auto_25452 ) ) ( not ( = ?auto_25450 ?auto_25451 ) ) ( not ( = ?auto_25450 ?auto_25452 ) ) ( not ( = ?auto_25451 ?auto_25452 ) ) ( CLEAR ?auto_25449 ) ( ON ?auto_25450 ?auto_25451 ) ( CLEAR ?auto_25450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25446 ?auto_25447 ?auto_25448 ?auto_25449 ?auto_25450 )
      ( MAKE-6PILE ?auto_25446 ?auto_25447 ?auto_25448 ?auto_25449 ?auto_25450 ?auto_25451 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_25472 - BLOCK
      ?auto_25473 - BLOCK
      ?auto_25474 - BLOCK
      ?auto_25475 - BLOCK
      ?auto_25476 - BLOCK
      ?auto_25477 - BLOCK
    )
    :vars
    (
      ?auto_25478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25477 ?auto_25478 ) ( ON-TABLE ?auto_25472 ) ( ON ?auto_25473 ?auto_25472 ) ( ON ?auto_25474 ?auto_25473 ) ( not ( = ?auto_25472 ?auto_25473 ) ) ( not ( = ?auto_25472 ?auto_25474 ) ) ( not ( = ?auto_25472 ?auto_25475 ) ) ( not ( = ?auto_25472 ?auto_25476 ) ) ( not ( = ?auto_25472 ?auto_25477 ) ) ( not ( = ?auto_25472 ?auto_25478 ) ) ( not ( = ?auto_25473 ?auto_25474 ) ) ( not ( = ?auto_25473 ?auto_25475 ) ) ( not ( = ?auto_25473 ?auto_25476 ) ) ( not ( = ?auto_25473 ?auto_25477 ) ) ( not ( = ?auto_25473 ?auto_25478 ) ) ( not ( = ?auto_25474 ?auto_25475 ) ) ( not ( = ?auto_25474 ?auto_25476 ) ) ( not ( = ?auto_25474 ?auto_25477 ) ) ( not ( = ?auto_25474 ?auto_25478 ) ) ( not ( = ?auto_25475 ?auto_25476 ) ) ( not ( = ?auto_25475 ?auto_25477 ) ) ( not ( = ?auto_25475 ?auto_25478 ) ) ( not ( = ?auto_25476 ?auto_25477 ) ) ( not ( = ?auto_25476 ?auto_25478 ) ) ( not ( = ?auto_25477 ?auto_25478 ) ) ( ON ?auto_25476 ?auto_25477 ) ( CLEAR ?auto_25474 ) ( ON ?auto_25475 ?auto_25476 ) ( CLEAR ?auto_25475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25472 ?auto_25473 ?auto_25474 ?auto_25475 )
      ( MAKE-6PILE ?auto_25472 ?auto_25473 ?auto_25474 ?auto_25475 ?auto_25476 ?auto_25477 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_25498 - BLOCK
      ?auto_25499 - BLOCK
      ?auto_25500 - BLOCK
      ?auto_25501 - BLOCK
      ?auto_25502 - BLOCK
      ?auto_25503 - BLOCK
    )
    :vars
    (
      ?auto_25504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25503 ?auto_25504 ) ( ON-TABLE ?auto_25498 ) ( ON ?auto_25499 ?auto_25498 ) ( not ( = ?auto_25498 ?auto_25499 ) ) ( not ( = ?auto_25498 ?auto_25500 ) ) ( not ( = ?auto_25498 ?auto_25501 ) ) ( not ( = ?auto_25498 ?auto_25502 ) ) ( not ( = ?auto_25498 ?auto_25503 ) ) ( not ( = ?auto_25498 ?auto_25504 ) ) ( not ( = ?auto_25499 ?auto_25500 ) ) ( not ( = ?auto_25499 ?auto_25501 ) ) ( not ( = ?auto_25499 ?auto_25502 ) ) ( not ( = ?auto_25499 ?auto_25503 ) ) ( not ( = ?auto_25499 ?auto_25504 ) ) ( not ( = ?auto_25500 ?auto_25501 ) ) ( not ( = ?auto_25500 ?auto_25502 ) ) ( not ( = ?auto_25500 ?auto_25503 ) ) ( not ( = ?auto_25500 ?auto_25504 ) ) ( not ( = ?auto_25501 ?auto_25502 ) ) ( not ( = ?auto_25501 ?auto_25503 ) ) ( not ( = ?auto_25501 ?auto_25504 ) ) ( not ( = ?auto_25502 ?auto_25503 ) ) ( not ( = ?auto_25502 ?auto_25504 ) ) ( not ( = ?auto_25503 ?auto_25504 ) ) ( ON ?auto_25502 ?auto_25503 ) ( ON ?auto_25501 ?auto_25502 ) ( CLEAR ?auto_25499 ) ( ON ?auto_25500 ?auto_25501 ) ( CLEAR ?auto_25500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25498 ?auto_25499 ?auto_25500 )
      ( MAKE-6PILE ?auto_25498 ?auto_25499 ?auto_25500 ?auto_25501 ?auto_25502 ?auto_25503 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_25524 - BLOCK
      ?auto_25525 - BLOCK
      ?auto_25526 - BLOCK
      ?auto_25527 - BLOCK
      ?auto_25528 - BLOCK
      ?auto_25529 - BLOCK
    )
    :vars
    (
      ?auto_25530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25529 ?auto_25530 ) ( ON-TABLE ?auto_25524 ) ( not ( = ?auto_25524 ?auto_25525 ) ) ( not ( = ?auto_25524 ?auto_25526 ) ) ( not ( = ?auto_25524 ?auto_25527 ) ) ( not ( = ?auto_25524 ?auto_25528 ) ) ( not ( = ?auto_25524 ?auto_25529 ) ) ( not ( = ?auto_25524 ?auto_25530 ) ) ( not ( = ?auto_25525 ?auto_25526 ) ) ( not ( = ?auto_25525 ?auto_25527 ) ) ( not ( = ?auto_25525 ?auto_25528 ) ) ( not ( = ?auto_25525 ?auto_25529 ) ) ( not ( = ?auto_25525 ?auto_25530 ) ) ( not ( = ?auto_25526 ?auto_25527 ) ) ( not ( = ?auto_25526 ?auto_25528 ) ) ( not ( = ?auto_25526 ?auto_25529 ) ) ( not ( = ?auto_25526 ?auto_25530 ) ) ( not ( = ?auto_25527 ?auto_25528 ) ) ( not ( = ?auto_25527 ?auto_25529 ) ) ( not ( = ?auto_25527 ?auto_25530 ) ) ( not ( = ?auto_25528 ?auto_25529 ) ) ( not ( = ?auto_25528 ?auto_25530 ) ) ( not ( = ?auto_25529 ?auto_25530 ) ) ( ON ?auto_25528 ?auto_25529 ) ( ON ?auto_25527 ?auto_25528 ) ( ON ?auto_25526 ?auto_25527 ) ( CLEAR ?auto_25524 ) ( ON ?auto_25525 ?auto_25526 ) ( CLEAR ?auto_25525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25524 ?auto_25525 )
      ( MAKE-6PILE ?auto_25524 ?auto_25525 ?auto_25526 ?auto_25527 ?auto_25528 ?auto_25529 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_25550 - BLOCK
      ?auto_25551 - BLOCK
      ?auto_25552 - BLOCK
      ?auto_25553 - BLOCK
      ?auto_25554 - BLOCK
      ?auto_25555 - BLOCK
    )
    :vars
    (
      ?auto_25556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25555 ?auto_25556 ) ( not ( = ?auto_25550 ?auto_25551 ) ) ( not ( = ?auto_25550 ?auto_25552 ) ) ( not ( = ?auto_25550 ?auto_25553 ) ) ( not ( = ?auto_25550 ?auto_25554 ) ) ( not ( = ?auto_25550 ?auto_25555 ) ) ( not ( = ?auto_25550 ?auto_25556 ) ) ( not ( = ?auto_25551 ?auto_25552 ) ) ( not ( = ?auto_25551 ?auto_25553 ) ) ( not ( = ?auto_25551 ?auto_25554 ) ) ( not ( = ?auto_25551 ?auto_25555 ) ) ( not ( = ?auto_25551 ?auto_25556 ) ) ( not ( = ?auto_25552 ?auto_25553 ) ) ( not ( = ?auto_25552 ?auto_25554 ) ) ( not ( = ?auto_25552 ?auto_25555 ) ) ( not ( = ?auto_25552 ?auto_25556 ) ) ( not ( = ?auto_25553 ?auto_25554 ) ) ( not ( = ?auto_25553 ?auto_25555 ) ) ( not ( = ?auto_25553 ?auto_25556 ) ) ( not ( = ?auto_25554 ?auto_25555 ) ) ( not ( = ?auto_25554 ?auto_25556 ) ) ( not ( = ?auto_25555 ?auto_25556 ) ) ( ON ?auto_25554 ?auto_25555 ) ( ON ?auto_25553 ?auto_25554 ) ( ON ?auto_25552 ?auto_25553 ) ( ON ?auto_25551 ?auto_25552 ) ( ON ?auto_25550 ?auto_25551 ) ( CLEAR ?auto_25550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25550 )
      ( MAKE-6PILE ?auto_25550 ?auto_25551 ?auto_25552 ?auto_25553 ?auto_25554 ?auto_25555 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_25577 - BLOCK
      ?auto_25578 - BLOCK
      ?auto_25579 - BLOCK
      ?auto_25580 - BLOCK
      ?auto_25581 - BLOCK
      ?auto_25582 - BLOCK
      ?auto_25583 - BLOCK
    )
    :vars
    (
      ?auto_25584 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25582 ) ( ON ?auto_25583 ?auto_25584 ) ( CLEAR ?auto_25583 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25577 ) ( ON ?auto_25578 ?auto_25577 ) ( ON ?auto_25579 ?auto_25578 ) ( ON ?auto_25580 ?auto_25579 ) ( ON ?auto_25581 ?auto_25580 ) ( ON ?auto_25582 ?auto_25581 ) ( not ( = ?auto_25577 ?auto_25578 ) ) ( not ( = ?auto_25577 ?auto_25579 ) ) ( not ( = ?auto_25577 ?auto_25580 ) ) ( not ( = ?auto_25577 ?auto_25581 ) ) ( not ( = ?auto_25577 ?auto_25582 ) ) ( not ( = ?auto_25577 ?auto_25583 ) ) ( not ( = ?auto_25577 ?auto_25584 ) ) ( not ( = ?auto_25578 ?auto_25579 ) ) ( not ( = ?auto_25578 ?auto_25580 ) ) ( not ( = ?auto_25578 ?auto_25581 ) ) ( not ( = ?auto_25578 ?auto_25582 ) ) ( not ( = ?auto_25578 ?auto_25583 ) ) ( not ( = ?auto_25578 ?auto_25584 ) ) ( not ( = ?auto_25579 ?auto_25580 ) ) ( not ( = ?auto_25579 ?auto_25581 ) ) ( not ( = ?auto_25579 ?auto_25582 ) ) ( not ( = ?auto_25579 ?auto_25583 ) ) ( not ( = ?auto_25579 ?auto_25584 ) ) ( not ( = ?auto_25580 ?auto_25581 ) ) ( not ( = ?auto_25580 ?auto_25582 ) ) ( not ( = ?auto_25580 ?auto_25583 ) ) ( not ( = ?auto_25580 ?auto_25584 ) ) ( not ( = ?auto_25581 ?auto_25582 ) ) ( not ( = ?auto_25581 ?auto_25583 ) ) ( not ( = ?auto_25581 ?auto_25584 ) ) ( not ( = ?auto_25582 ?auto_25583 ) ) ( not ( = ?auto_25582 ?auto_25584 ) ) ( not ( = ?auto_25583 ?auto_25584 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25583 ?auto_25584 )
      ( !STACK ?auto_25583 ?auto_25582 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_25592 - BLOCK
      ?auto_25593 - BLOCK
      ?auto_25594 - BLOCK
      ?auto_25595 - BLOCK
      ?auto_25596 - BLOCK
      ?auto_25597 - BLOCK
      ?auto_25598 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25597 ) ( ON-TABLE ?auto_25598 ) ( CLEAR ?auto_25598 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25592 ) ( ON ?auto_25593 ?auto_25592 ) ( ON ?auto_25594 ?auto_25593 ) ( ON ?auto_25595 ?auto_25594 ) ( ON ?auto_25596 ?auto_25595 ) ( ON ?auto_25597 ?auto_25596 ) ( not ( = ?auto_25592 ?auto_25593 ) ) ( not ( = ?auto_25592 ?auto_25594 ) ) ( not ( = ?auto_25592 ?auto_25595 ) ) ( not ( = ?auto_25592 ?auto_25596 ) ) ( not ( = ?auto_25592 ?auto_25597 ) ) ( not ( = ?auto_25592 ?auto_25598 ) ) ( not ( = ?auto_25593 ?auto_25594 ) ) ( not ( = ?auto_25593 ?auto_25595 ) ) ( not ( = ?auto_25593 ?auto_25596 ) ) ( not ( = ?auto_25593 ?auto_25597 ) ) ( not ( = ?auto_25593 ?auto_25598 ) ) ( not ( = ?auto_25594 ?auto_25595 ) ) ( not ( = ?auto_25594 ?auto_25596 ) ) ( not ( = ?auto_25594 ?auto_25597 ) ) ( not ( = ?auto_25594 ?auto_25598 ) ) ( not ( = ?auto_25595 ?auto_25596 ) ) ( not ( = ?auto_25595 ?auto_25597 ) ) ( not ( = ?auto_25595 ?auto_25598 ) ) ( not ( = ?auto_25596 ?auto_25597 ) ) ( not ( = ?auto_25596 ?auto_25598 ) ) ( not ( = ?auto_25597 ?auto_25598 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_25598 )
      ( !STACK ?auto_25598 ?auto_25597 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_25606 - BLOCK
      ?auto_25607 - BLOCK
      ?auto_25608 - BLOCK
      ?auto_25609 - BLOCK
      ?auto_25610 - BLOCK
      ?auto_25611 - BLOCK
      ?auto_25612 - BLOCK
    )
    :vars
    (
      ?auto_25613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25612 ?auto_25613 ) ( ON-TABLE ?auto_25606 ) ( ON ?auto_25607 ?auto_25606 ) ( ON ?auto_25608 ?auto_25607 ) ( ON ?auto_25609 ?auto_25608 ) ( ON ?auto_25610 ?auto_25609 ) ( not ( = ?auto_25606 ?auto_25607 ) ) ( not ( = ?auto_25606 ?auto_25608 ) ) ( not ( = ?auto_25606 ?auto_25609 ) ) ( not ( = ?auto_25606 ?auto_25610 ) ) ( not ( = ?auto_25606 ?auto_25611 ) ) ( not ( = ?auto_25606 ?auto_25612 ) ) ( not ( = ?auto_25606 ?auto_25613 ) ) ( not ( = ?auto_25607 ?auto_25608 ) ) ( not ( = ?auto_25607 ?auto_25609 ) ) ( not ( = ?auto_25607 ?auto_25610 ) ) ( not ( = ?auto_25607 ?auto_25611 ) ) ( not ( = ?auto_25607 ?auto_25612 ) ) ( not ( = ?auto_25607 ?auto_25613 ) ) ( not ( = ?auto_25608 ?auto_25609 ) ) ( not ( = ?auto_25608 ?auto_25610 ) ) ( not ( = ?auto_25608 ?auto_25611 ) ) ( not ( = ?auto_25608 ?auto_25612 ) ) ( not ( = ?auto_25608 ?auto_25613 ) ) ( not ( = ?auto_25609 ?auto_25610 ) ) ( not ( = ?auto_25609 ?auto_25611 ) ) ( not ( = ?auto_25609 ?auto_25612 ) ) ( not ( = ?auto_25609 ?auto_25613 ) ) ( not ( = ?auto_25610 ?auto_25611 ) ) ( not ( = ?auto_25610 ?auto_25612 ) ) ( not ( = ?auto_25610 ?auto_25613 ) ) ( not ( = ?auto_25611 ?auto_25612 ) ) ( not ( = ?auto_25611 ?auto_25613 ) ) ( not ( = ?auto_25612 ?auto_25613 ) ) ( CLEAR ?auto_25610 ) ( ON ?auto_25611 ?auto_25612 ) ( CLEAR ?auto_25611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_25606 ?auto_25607 ?auto_25608 ?auto_25609 ?auto_25610 ?auto_25611 )
      ( MAKE-7PILE ?auto_25606 ?auto_25607 ?auto_25608 ?auto_25609 ?auto_25610 ?auto_25611 ?auto_25612 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_25621 - BLOCK
      ?auto_25622 - BLOCK
      ?auto_25623 - BLOCK
      ?auto_25624 - BLOCK
      ?auto_25625 - BLOCK
      ?auto_25626 - BLOCK
      ?auto_25627 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25627 ) ( ON-TABLE ?auto_25621 ) ( ON ?auto_25622 ?auto_25621 ) ( ON ?auto_25623 ?auto_25622 ) ( ON ?auto_25624 ?auto_25623 ) ( ON ?auto_25625 ?auto_25624 ) ( not ( = ?auto_25621 ?auto_25622 ) ) ( not ( = ?auto_25621 ?auto_25623 ) ) ( not ( = ?auto_25621 ?auto_25624 ) ) ( not ( = ?auto_25621 ?auto_25625 ) ) ( not ( = ?auto_25621 ?auto_25626 ) ) ( not ( = ?auto_25621 ?auto_25627 ) ) ( not ( = ?auto_25622 ?auto_25623 ) ) ( not ( = ?auto_25622 ?auto_25624 ) ) ( not ( = ?auto_25622 ?auto_25625 ) ) ( not ( = ?auto_25622 ?auto_25626 ) ) ( not ( = ?auto_25622 ?auto_25627 ) ) ( not ( = ?auto_25623 ?auto_25624 ) ) ( not ( = ?auto_25623 ?auto_25625 ) ) ( not ( = ?auto_25623 ?auto_25626 ) ) ( not ( = ?auto_25623 ?auto_25627 ) ) ( not ( = ?auto_25624 ?auto_25625 ) ) ( not ( = ?auto_25624 ?auto_25626 ) ) ( not ( = ?auto_25624 ?auto_25627 ) ) ( not ( = ?auto_25625 ?auto_25626 ) ) ( not ( = ?auto_25625 ?auto_25627 ) ) ( not ( = ?auto_25626 ?auto_25627 ) ) ( CLEAR ?auto_25625 ) ( ON ?auto_25626 ?auto_25627 ) ( CLEAR ?auto_25626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_25621 ?auto_25622 ?auto_25623 ?auto_25624 ?auto_25625 ?auto_25626 )
      ( MAKE-7PILE ?auto_25621 ?auto_25622 ?auto_25623 ?auto_25624 ?auto_25625 ?auto_25626 ?auto_25627 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_25635 - BLOCK
      ?auto_25636 - BLOCK
      ?auto_25637 - BLOCK
      ?auto_25638 - BLOCK
      ?auto_25639 - BLOCK
      ?auto_25640 - BLOCK
      ?auto_25641 - BLOCK
    )
    :vars
    (
      ?auto_25642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25641 ?auto_25642 ) ( ON-TABLE ?auto_25635 ) ( ON ?auto_25636 ?auto_25635 ) ( ON ?auto_25637 ?auto_25636 ) ( ON ?auto_25638 ?auto_25637 ) ( not ( = ?auto_25635 ?auto_25636 ) ) ( not ( = ?auto_25635 ?auto_25637 ) ) ( not ( = ?auto_25635 ?auto_25638 ) ) ( not ( = ?auto_25635 ?auto_25639 ) ) ( not ( = ?auto_25635 ?auto_25640 ) ) ( not ( = ?auto_25635 ?auto_25641 ) ) ( not ( = ?auto_25635 ?auto_25642 ) ) ( not ( = ?auto_25636 ?auto_25637 ) ) ( not ( = ?auto_25636 ?auto_25638 ) ) ( not ( = ?auto_25636 ?auto_25639 ) ) ( not ( = ?auto_25636 ?auto_25640 ) ) ( not ( = ?auto_25636 ?auto_25641 ) ) ( not ( = ?auto_25636 ?auto_25642 ) ) ( not ( = ?auto_25637 ?auto_25638 ) ) ( not ( = ?auto_25637 ?auto_25639 ) ) ( not ( = ?auto_25637 ?auto_25640 ) ) ( not ( = ?auto_25637 ?auto_25641 ) ) ( not ( = ?auto_25637 ?auto_25642 ) ) ( not ( = ?auto_25638 ?auto_25639 ) ) ( not ( = ?auto_25638 ?auto_25640 ) ) ( not ( = ?auto_25638 ?auto_25641 ) ) ( not ( = ?auto_25638 ?auto_25642 ) ) ( not ( = ?auto_25639 ?auto_25640 ) ) ( not ( = ?auto_25639 ?auto_25641 ) ) ( not ( = ?auto_25639 ?auto_25642 ) ) ( not ( = ?auto_25640 ?auto_25641 ) ) ( not ( = ?auto_25640 ?auto_25642 ) ) ( not ( = ?auto_25641 ?auto_25642 ) ) ( ON ?auto_25640 ?auto_25641 ) ( CLEAR ?auto_25638 ) ( ON ?auto_25639 ?auto_25640 ) ( CLEAR ?auto_25639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25635 ?auto_25636 ?auto_25637 ?auto_25638 ?auto_25639 )
      ( MAKE-7PILE ?auto_25635 ?auto_25636 ?auto_25637 ?auto_25638 ?auto_25639 ?auto_25640 ?auto_25641 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_25650 - BLOCK
      ?auto_25651 - BLOCK
      ?auto_25652 - BLOCK
      ?auto_25653 - BLOCK
      ?auto_25654 - BLOCK
      ?auto_25655 - BLOCK
      ?auto_25656 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25656 ) ( ON-TABLE ?auto_25650 ) ( ON ?auto_25651 ?auto_25650 ) ( ON ?auto_25652 ?auto_25651 ) ( ON ?auto_25653 ?auto_25652 ) ( not ( = ?auto_25650 ?auto_25651 ) ) ( not ( = ?auto_25650 ?auto_25652 ) ) ( not ( = ?auto_25650 ?auto_25653 ) ) ( not ( = ?auto_25650 ?auto_25654 ) ) ( not ( = ?auto_25650 ?auto_25655 ) ) ( not ( = ?auto_25650 ?auto_25656 ) ) ( not ( = ?auto_25651 ?auto_25652 ) ) ( not ( = ?auto_25651 ?auto_25653 ) ) ( not ( = ?auto_25651 ?auto_25654 ) ) ( not ( = ?auto_25651 ?auto_25655 ) ) ( not ( = ?auto_25651 ?auto_25656 ) ) ( not ( = ?auto_25652 ?auto_25653 ) ) ( not ( = ?auto_25652 ?auto_25654 ) ) ( not ( = ?auto_25652 ?auto_25655 ) ) ( not ( = ?auto_25652 ?auto_25656 ) ) ( not ( = ?auto_25653 ?auto_25654 ) ) ( not ( = ?auto_25653 ?auto_25655 ) ) ( not ( = ?auto_25653 ?auto_25656 ) ) ( not ( = ?auto_25654 ?auto_25655 ) ) ( not ( = ?auto_25654 ?auto_25656 ) ) ( not ( = ?auto_25655 ?auto_25656 ) ) ( ON ?auto_25655 ?auto_25656 ) ( CLEAR ?auto_25653 ) ( ON ?auto_25654 ?auto_25655 ) ( CLEAR ?auto_25654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25650 ?auto_25651 ?auto_25652 ?auto_25653 ?auto_25654 )
      ( MAKE-7PILE ?auto_25650 ?auto_25651 ?auto_25652 ?auto_25653 ?auto_25654 ?auto_25655 ?auto_25656 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_25664 - BLOCK
      ?auto_25665 - BLOCK
      ?auto_25666 - BLOCK
      ?auto_25667 - BLOCK
      ?auto_25668 - BLOCK
      ?auto_25669 - BLOCK
      ?auto_25670 - BLOCK
    )
    :vars
    (
      ?auto_25671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25670 ?auto_25671 ) ( ON-TABLE ?auto_25664 ) ( ON ?auto_25665 ?auto_25664 ) ( ON ?auto_25666 ?auto_25665 ) ( not ( = ?auto_25664 ?auto_25665 ) ) ( not ( = ?auto_25664 ?auto_25666 ) ) ( not ( = ?auto_25664 ?auto_25667 ) ) ( not ( = ?auto_25664 ?auto_25668 ) ) ( not ( = ?auto_25664 ?auto_25669 ) ) ( not ( = ?auto_25664 ?auto_25670 ) ) ( not ( = ?auto_25664 ?auto_25671 ) ) ( not ( = ?auto_25665 ?auto_25666 ) ) ( not ( = ?auto_25665 ?auto_25667 ) ) ( not ( = ?auto_25665 ?auto_25668 ) ) ( not ( = ?auto_25665 ?auto_25669 ) ) ( not ( = ?auto_25665 ?auto_25670 ) ) ( not ( = ?auto_25665 ?auto_25671 ) ) ( not ( = ?auto_25666 ?auto_25667 ) ) ( not ( = ?auto_25666 ?auto_25668 ) ) ( not ( = ?auto_25666 ?auto_25669 ) ) ( not ( = ?auto_25666 ?auto_25670 ) ) ( not ( = ?auto_25666 ?auto_25671 ) ) ( not ( = ?auto_25667 ?auto_25668 ) ) ( not ( = ?auto_25667 ?auto_25669 ) ) ( not ( = ?auto_25667 ?auto_25670 ) ) ( not ( = ?auto_25667 ?auto_25671 ) ) ( not ( = ?auto_25668 ?auto_25669 ) ) ( not ( = ?auto_25668 ?auto_25670 ) ) ( not ( = ?auto_25668 ?auto_25671 ) ) ( not ( = ?auto_25669 ?auto_25670 ) ) ( not ( = ?auto_25669 ?auto_25671 ) ) ( not ( = ?auto_25670 ?auto_25671 ) ) ( ON ?auto_25669 ?auto_25670 ) ( ON ?auto_25668 ?auto_25669 ) ( CLEAR ?auto_25666 ) ( ON ?auto_25667 ?auto_25668 ) ( CLEAR ?auto_25667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25664 ?auto_25665 ?auto_25666 ?auto_25667 )
      ( MAKE-7PILE ?auto_25664 ?auto_25665 ?auto_25666 ?auto_25667 ?auto_25668 ?auto_25669 ?auto_25670 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_25679 - BLOCK
      ?auto_25680 - BLOCK
      ?auto_25681 - BLOCK
      ?auto_25682 - BLOCK
      ?auto_25683 - BLOCK
      ?auto_25684 - BLOCK
      ?auto_25685 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25685 ) ( ON-TABLE ?auto_25679 ) ( ON ?auto_25680 ?auto_25679 ) ( ON ?auto_25681 ?auto_25680 ) ( not ( = ?auto_25679 ?auto_25680 ) ) ( not ( = ?auto_25679 ?auto_25681 ) ) ( not ( = ?auto_25679 ?auto_25682 ) ) ( not ( = ?auto_25679 ?auto_25683 ) ) ( not ( = ?auto_25679 ?auto_25684 ) ) ( not ( = ?auto_25679 ?auto_25685 ) ) ( not ( = ?auto_25680 ?auto_25681 ) ) ( not ( = ?auto_25680 ?auto_25682 ) ) ( not ( = ?auto_25680 ?auto_25683 ) ) ( not ( = ?auto_25680 ?auto_25684 ) ) ( not ( = ?auto_25680 ?auto_25685 ) ) ( not ( = ?auto_25681 ?auto_25682 ) ) ( not ( = ?auto_25681 ?auto_25683 ) ) ( not ( = ?auto_25681 ?auto_25684 ) ) ( not ( = ?auto_25681 ?auto_25685 ) ) ( not ( = ?auto_25682 ?auto_25683 ) ) ( not ( = ?auto_25682 ?auto_25684 ) ) ( not ( = ?auto_25682 ?auto_25685 ) ) ( not ( = ?auto_25683 ?auto_25684 ) ) ( not ( = ?auto_25683 ?auto_25685 ) ) ( not ( = ?auto_25684 ?auto_25685 ) ) ( ON ?auto_25684 ?auto_25685 ) ( ON ?auto_25683 ?auto_25684 ) ( CLEAR ?auto_25681 ) ( ON ?auto_25682 ?auto_25683 ) ( CLEAR ?auto_25682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25679 ?auto_25680 ?auto_25681 ?auto_25682 )
      ( MAKE-7PILE ?auto_25679 ?auto_25680 ?auto_25681 ?auto_25682 ?auto_25683 ?auto_25684 ?auto_25685 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_25693 - BLOCK
      ?auto_25694 - BLOCK
      ?auto_25695 - BLOCK
      ?auto_25696 - BLOCK
      ?auto_25697 - BLOCK
      ?auto_25698 - BLOCK
      ?auto_25699 - BLOCK
    )
    :vars
    (
      ?auto_25700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25699 ?auto_25700 ) ( ON-TABLE ?auto_25693 ) ( ON ?auto_25694 ?auto_25693 ) ( not ( = ?auto_25693 ?auto_25694 ) ) ( not ( = ?auto_25693 ?auto_25695 ) ) ( not ( = ?auto_25693 ?auto_25696 ) ) ( not ( = ?auto_25693 ?auto_25697 ) ) ( not ( = ?auto_25693 ?auto_25698 ) ) ( not ( = ?auto_25693 ?auto_25699 ) ) ( not ( = ?auto_25693 ?auto_25700 ) ) ( not ( = ?auto_25694 ?auto_25695 ) ) ( not ( = ?auto_25694 ?auto_25696 ) ) ( not ( = ?auto_25694 ?auto_25697 ) ) ( not ( = ?auto_25694 ?auto_25698 ) ) ( not ( = ?auto_25694 ?auto_25699 ) ) ( not ( = ?auto_25694 ?auto_25700 ) ) ( not ( = ?auto_25695 ?auto_25696 ) ) ( not ( = ?auto_25695 ?auto_25697 ) ) ( not ( = ?auto_25695 ?auto_25698 ) ) ( not ( = ?auto_25695 ?auto_25699 ) ) ( not ( = ?auto_25695 ?auto_25700 ) ) ( not ( = ?auto_25696 ?auto_25697 ) ) ( not ( = ?auto_25696 ?auto_25698 ) ) ( not ( = ?auto_25696 ?auto_25699 ) ) ( not ( = ?auto_25696 ?auto_25700 ) ) ( not ( = ?auto_25697 ?auto_25698 ) ) ( not ( = ?auto_25697 ?auto_25699 ) ) ( not ( = ?auto_25697 ?auto_25700 ) ) ( not ( = ?auto_25698 ?auto_25699 ) ) ( not ( = ?auto_25698 ?auto_25700 ) ) ( not ( = ?auto_25699 ?auto_25700 ) ) ( ON ?auto_25698 ?auto_25699 ) ( ON ?auto_25697 ?auto_25698 ) ( ON ?auto_25696 ?auto_25697 ) ( CLEAR ?auto_25694 ) ( ON ?auto_25695 ?auto_25696 ) ( CLEAR ?auto_25695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25693 ?auto_25694 ?auto_25695 )
      ( MAKE-7PILE ?auto_25693 ?auto_25694 ?auto_25695 ?auto_25696 ?auto_25697 ?auto_25698 ?auto_25699 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_25708 - BLOCK
      ?auto_25709 - BLOCK
      ?auto_25710 - BLOCK
      ?auto_25711 - BLOCK
      ?auto_25712 - BLOCK
      ?auto_25713 - BLOCK
      ?auto_25714 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25714 ) ( ON-TABLE ?auto_25708 ) ( ON ?auto_25709 ?auto_25708 ) ( not ( = ?auto_25708 ?auto_25709 ) ) ( not ( = ?auto_25708 ?auto_25710 ) ) ( not ( = ?auto_25708 ?auto_25711 ) ) ( not ( = ?auto_25708 ?auto_25712 ) ) ( not ( = ?auto_25708 ?auto_25713 ) ) ( not ( = ?auto_25708 ?auto_25714 ) ) ( not ( = ?auto_25709 ?auto_25710 ) ) ( not ( = ?auto_25709 ?auto_25711 ) ) ( not ( = ?auto_25709 ?auto_25712 ) ) ( not ( = ?auto_25709 ?auto_25713 ) ) ( not ( = ?auto_25709 ?auto_25714 ) ) ( not ( = ?auto_25710 ?auto_25711 ) ) ( not ( = ?auto_25710 ?auto_25712 ) ) ( not ( = ?auto_25710 ?auto_25713 ) ) ( not ( = ?auto_25710 ?auto_25714 ) ) ( not ( = ?auto_25711 ?auto_25712 ) ) ( not ( = ?auto_25711 ?auto_25713 ) ) ( not ( = ?auto_25711 ?auto_25714 ) ) ( not ( = ?auto_25712 ?auto_25713 ) ) ( not ( = ?auto_25712 ?auto_25714 ) ) ( not ( = ?auto_25713 ?auto_25714 ) ) ( ON ?auto_25713 ?auto_25714 ) ( ON ?auto_25712 ?auto_25713 ) ( ON ?auto_25711 ?auto_25712 ) ( CLEAR ?auto_25709 ) ( ON ?auto_25710 ?auto_25711 ) ( CLEAR ?auto_25710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25708 ?auto_25709 ?auto_25710 )
      ( MAKE-7PILE ?auto_25708 ?auto_25709 ?auto_25710 ?auto_25711 ?auto_25712 ?auto_25713 ?auto_25714 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_25722 - BLOCK
      ?auto_25723 - BLOCK
      ?auto_25724 - BLOCK
      ?auto_25725 - BLOCK
      ?auto_25726 - BLOCK
      ?auto_25727 - BLOCK
      ?auto_25728 - BLOCK
    )
    :vars
    (
      ?auto_25729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25728 ?auto_25729 ) ( ON-TABLE ?auto_25722 ) ( not ( = ?auto_25722 ?auto_25723 ) ) ( not ( = ?auto_25722 ?auto_25724 ) ) ( not ( = ?auto_25722 ?auto_25725 ) ) ( not ( = ?auto_25722 ?auto_25726 ) ) ( not ( = ?auto_25722 ?auto_25727 ) ) ( not ( = ?auto_25722 ?auto_25728 ) ) ( not ( = ?auto_25722 ?auto_25729 ) ) ( not ( = ?auto_25723 ?auto_25724 ) ) ( not ( = ?auto_25723 ?auto_25725 ) ) ( not ( = ?auto_25723 ?auto_25726 ) ) ( not ( = ?auto_25723 ?auto_25727 ) ) ( not ( = ?auto_25723 ?auto_25728 ) ) ( not ( = ?auto_25723 ?auto_25729 ) ) ( not ( = ?auto_25724 ?auto_25725 ) ) ( not ( = ?auto_25724 ?auto_25726 ) ) ( not ( = ?auto_25724 ?auto_25727 ) ) ( not ( = ?auto_25724 ?auto_25728 ) ) ( not ( = ?auto_25724 ?auto_25729 ) ) ( not ( = ?auto_25725 ?auto_25726 ) ) ( not ( = ?auto_25725 ?auto_25727 ) ) ( not ( = ?auto_25725 ?auto_25728 ) ) ( not ( = ?auto_25725 ?auto_25729 ) ) ( not ( = ?auto_25726 ?auto_25727 ) ) ( not ( = ?auto_25726 ?auto_25728 ) ) ( not ( = ?auto_25726 ?auto_25729 ) ) ( not ( = ?auto_25727 ?auto_25728 ) ) ( not ( = ?auto_25727 ?auto_25729 ) ) ( not ( = ?auto_25728 ?auto_25729 ) ) ( ON ?auto_25727 ?auto_25728 ) ( ON ?auto_25726 ?auto_25727 ) ( ON ?auto_25725 ?auto_25726 ) ( ON ?auto_25724 ?auto_25725 ) ( CLEAR ?auto_25722 ) ( ON ?auto_25723 ?auto_25724 ) ( CLEAR ?auto_25723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25722 ?auto_25723 )
      ( MAKE-7PILE ?auto_25722 ?auto_25723 ?auto_25724 ?auto_25725 ?auto_25726 ?auto_25727 ?auto_25728 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_25737 - BLOCK
      ?auto_25738 - BLOCK
      ?auto_25739 - BLOCK
      ?auto_25740 - BLOCK
      ?auto_25741 - BLOCK
      ?auto_25742 - BLOCK
      ?auto_25743 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25743 ) ( ON-TABLE ?auto_25737 ) ( not ( = ?auto_25737 ?auto_25738 ) ) ( not ( = ?auto_25737 ?auto_25739 ) ) ( not ( = ?auto_25737 ?auto_25740 ) ) ( not ( = ?auto_25737 ?auto_25741 ) ) ( not ( = ?auto_25737 ?auto_25742 ) ) ( not ( = ?auto_25737 ?auto_25743 ) ) ( not ( = ?auto_25738 ?auto_25739 ) ) ( not ( = ?auto_25738 ?auto_25740 ) ) ( not ( = ?auto_25738 ?auto_25741 ) ) ( not ( = ?auto_25738 ?auto_25742 ) ) ( not ( = ?auto_25738 ?auto_25743 ) ) ( not ( = ?auto_25739 ?auto_25740 ) ) ( not ( = ?auto_25739 ?auto_25741 ) ) ( not ( = ?auto_25739 ?auto_25742 ) ) ( not ( = ?auto_25739 ?auto_25743 ) ) ( not ( = ?auto_25740 ?auto_25741 ) ) ( not ( = ?auto_25740 ?auto_25742 ) ) ( not ( = ?auto_25740 ?auto_25743 ) ) ( not ( = ?auto_25741 ?auto_25742 ) ) ( not ( = ?auto_25741 ?auto_25743 ) ) ( not ( = ?auto_25742 ?auto_25743 ) ) ( ON ?auto_25742 ?auto_25743 ) ( ON ?auto_25741 ?auto_25742 ) ( ON ?auto_25740 ?auto_25741 ) ( ON ?auto_25739 ?auto_25740 ) ( CLEAR ?auto_25737 ) ( ON ?auto_25738 ?auto_25739 ) ( CLEAR ?auto_25738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25737 ?auto_25738 )
      ( MAKE-7PILE ?auto_25737 ?auto_25738 ?auto_25739 ?auto_25740 ?auto_25741 ?auto_25742 ?auto_25743 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_25751 - BLOCK
      ?auto_25752 - BLOCK
      ?auto_25753 - BLOCK
      ?auto_25754 - BLOCK
      ?auto_25755 - BLOCK
      ?auto_25756 - BLOCK
      ?auto_25757 - BLOCK
    )
    :vars
    (
      ?auto_25758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25757 ?auto_25758 ) ( not ( = ?auto_25751 ?auto_25752 ) ) ( not ( = ?auto_25751 ?auto_25753 ) ) ( not ( = ?auto_25751 ?auto_25754 ) ) ( not ( = ?auto_25751 ?auto_25755 ) ) ( not ( = ?auto_25751 ?auto_25756 ) ) ( not ( = ?auto_25751 ?auto_25757 ) ) ( not ( = ?auto_25751 ?auto_25758 ) ) ( not ( = ?auto_25752 ?auto_25753 ) ) ( not ( = ?auto_25752 ?auto_25754 ) ) ( not ( = ?auto_25752 ?auto_25755 ) ) ( not ( = ?auto_25752 ?auto_25756 ) ) ( not ( = ?auto_25752 ?auto_25757 ) ) ( not ( = ?auto_25752 ?auto_25758 ) ) ( not ( = ?auto_25753 ?auto_25754 ) ) ( not ( = ?auto_25753 ?auto_25755 ) ) ( not ( = ?auto_25753 ?auto_25756 ) ) ( not ( = ?auto_25753 ?auto_25757 ) ) ( not ( = ?auto_25753 ?auto_25758 ) ) ( not ( = ?auto_25754 ?auto_25755 ) ) ( not ( = ?auto_25754 ?auto_25756 ) ) ( not ( = ?auto_25754 ?auto_25757 ) ) ( not ( = ?auto_25754 ?auto_25758 ) ) ( not ( = ?auto_25755 ?auto_25756 ) ) ( not ( = ?auto_25755 ?auto_25757 ) ) ( not ( = ?auto_25755 ?auto_25758 ) ) ( not ( = ?auto_25756 ?auto_25757 ) ) ( not ( = ?auto_25756 ?auto_25758 ) ) ( not ( = ?auto_25757 ?auto_25758 ) ) ( ON ?auto_25756 ?auto_25757 ) ( ON ?auto_25755 ?auto_25756 ) ( ON ?auto_25754 ?auto_25755 ) ( ON ?auto_25753 ?auto_25754 ) ( ON ?auto_25752 ?auto_25753 ) ( ON ?auto_25751 ?auto_25752 ) ( CLEAR ?auto_25751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25751 )
      ( MAKE-7PILE ?auto_25751 ?auto_25752 ?auto_25753 ?auto_25754 ?auto_25755 ?auto_25756 ?auto_25757 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_25766 - BLOCK
      ?auto_25767 - BLOCK
      ?auto_25768 - BLOCK
      ?auto_25769 - BLOCK
      ?auto_25770 - BLOCK
      ?auto_25771 - BLOCK
      ?auto_25772 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25772 ) ( not ( = ?auto_25766 ?auto_25767 ) ) ( not ( = ?auto_25766 ?auto_25768 ) ) ( not ( = ?auto_25766 ?auto_25769 ) ) ( not ( = ?auto_25766 ?auto_25770 ) ) ( not ( = ?auto_25766 ?auto_25771 ) ) ( not ( = ?auto_25766 ?auto_25772 ) ) ( not ( = ?auto_25767 ?auto_25768 ) ) ( not ( = ?auto_25767 ?auto_25769 ) ) ( not ( = ?auto_25767 ?auto_25770 ) ) ( not ( = ?auto_25767 ?auto_25771 ) ) ( not ( = ?auto_25767 ?auto_25772 ) ) ( not ( = ?auto_25768 ?auto_25769 ) ) ( not ( = ?auto_25768 ?auto_25770 ) ) ( not ( = ?auto_25768 ?auto_25771 ) ) ( not ( = ?auto_25768 ?auto_25772 ) ) ( not ( = ?auto_25769 ?auto_25770 ) ) ( not ( = ?auto_25769 ?auto_25771 ) ) ( not ( = ?auto_25769 ?auto_25772 ) ) ( not ( = ?auto_25770 ?auto_25771 ) ) ( not ( = ?auto_25770 ?auto_25772 ) ) ( not ( = ?auto_25771 ?auto_25772 ) ) ( ON ?auto_25771 ?auto_25772 ) ( ON ?auto_25770 ?auto_25771 ) ( ON ?auto_25769 ?auto_25770 ) ( ON ?auto_25768 ?auto_25769 ) ( ON ?auto_25767 ?auto_25768 ) ( ON ?auto_25766 ?auto_25767 ) ( CLEAR ?auto_25766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25766 )
      ( MAKE-7PILE ?auto_25766 ?auto_25767 ?auto_25768 ?auto_25769 ?auto_25770 ?auto_25771 ?auto_25772 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_25780 - BLOCK
      ?auto_25781 - BLOCK
      ?auto_25782 - BLOCK
      ?auto_25783 - BLOCK
      ?auto_25784 - BLOCK
      ?auto_25785 - BLOCK
      ?auto_25786 - BLOCK
    )
    :vars
    (
      ?auto_25787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25780 ?auto_25781 ) ) ( not ( = ?auto_25780 ?auto_25782 ) ) ( not ( = ?auto_25780 ?auto_25783 ) ) ( not ( = ?auto_25780 ?auto_25784 ) ) ( not ( = ?auto_25780 ?auto_25785 ) ) ( not ( = ?auto_25780 ?auto_25786 ) ) ( not ( = ?auto_25781 ?auto_25782 ) ) ( not ( = ?auto_25781 ?auto_25783 ) ) ( not ( = ?auto_25781 ?auto_25784 ) ) ( not ( = ?auto_25781 ?auto_25785 ) ) ( not ( = ?auto_25781 ?auto_25786 ) ) ( not ( = ?auto_25782 ?auto_25783 ) ) ( not ( = ?auto_25782 ?auto_25784 ) ) ( not ( = ?auto_25782 ?auto_25785 ) ) ( not ( = ?auto_25782 ?auto_25786 ) ) ( not ( = ?auto_25783 ?auto_25784 ) ) ( not ( = ?auto_25783 ?auto_25785 ) ) ( not ( = ?auto_25783 ?auto_25786 ) ) ( not ( = ?auto_25784 ?auto_25785 ) ) ( not ( = ?auto_25784 ?auto_25786 ) ) ( not ( = ?auto_25785 ?auto_25786 ) ) ( ON ?auto_25780 ?auto_25787 ) ( not ( = ?auto_25786 ?auto_25787 ) ) ( not ( = ?auto_25785 ?auto_25787 ) ) ( not ( = ?auto_25784 ?auto_25787 ) ) ( not ( = ?auto_25783 ?auto_25787 ) ) ( not ( = ?auto_25782 ?auto_25787 ) ) ( not ( = ?auto_25781 ?auto_25787 ) ) ( not ( = ?auto_25780 ?auto_25787 ) ) ( ON ?auto_25781 ?auto_25780 ) ( ON ?auto_25782 ?auto_25781 ) ( ON ?auto_25783 ?auto_25782 ) ( ON ?auto_25784 ?auto_25783 ) ( ON ?auto_25785 ?auto_25784 ) ( ON ?auto_25786 ?auto_25785 ) ( CLEAR ?auto_25786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_25786 ?auto_25785 ?auto_25784 ?auto_25783 ?auto_25782 ?auto_25781 ?auto_25780 )
      ( MAKE-7PILE ?auto_25780 ?auto_25781 ?auto_25782 ?auto_25783 ?auto_25784 ?auto_25785 ?auto_25786 ) )
  )

)

