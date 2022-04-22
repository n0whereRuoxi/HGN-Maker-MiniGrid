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
      ?auto_90131 - BLOCK
    )
    :vars
    (
      ?auto_90132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90131 ?auto_90132 ) ( CLEAR ?auto_90131 ) ( HAND-EMPTY ) ( not ( = ?auto_90131 ?auto_90132 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90131 ?auto_90132 )
      ( !PUTDOWN ?auto_90131 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90138 - BLOCK
      ?auto_90139 - BLOCK
    )
    :vars
    (
      ?auto_90140 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_90138 ) ( ON ?auto_90139 ?auto_90140 ) ( CLEAR ?auto_90139 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90138 ) ( not ( = ?auto_90138 ?auto_90139 ) ) ( not ( = ?auto_90138 ?auto_90140 ) ) ( not ( = ?auto_90139 ?auto_90140 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90139 ?auto_90140 )
      ( !STACK ?auto_90139 ?auto_90138 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90148 - BLOCK
      ?auto_90149 - BLOCK
    )
    :vars
    (
      ?auto_90150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90149 ?auto_90150 ) ( not ( = ?auto_90148 ?auto_90149 ) ) ( not ( = ?auto_90148 ?auto_90150 ) ) ( not ( = ?auto_90149 ?auto_90150 ) ) ( ON ?auto_90148 ?auto_90149 ) ( CLEAR ?auto_90148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90148 )
      ( MAKE-2PILE ?auto_90148 ?auto_90149 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90159 - BLOCK
      ?auto_90160 - BLOCK
      ?auto_90161 - BLOCK
    )
    :vars
    (
      ?auto_90162 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_90160 ) ( ON ?auto_90161 ?auto_90162 ) ( CLEAR ?auto_90161 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90159 ) ( ON ?auto_90160 ?auto_90159 ) ( not ( = ?auto_90159 ?auto_90160 ) ) ( not ( = ?auto_90159 ?auto_90161 ) ) ( not ( = ?auto_90159 ?auto_90162 ) ) ( not ( = ?auto_90160 ?auto_90161 ) ) ( not ( = ?auto_90160 ?auto_90162 ) ) ( not ( = ?auto_90161 ?auto_90162 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90161 ?auto_90162 )
      ( !STACK ?auto_90161 ?auto_90160 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90173 - BLOCK
      ?auto_90174 - BLOCK
      ?auto_90175 - BLOCK
    )
    :vars
    (
      ?auto_90176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90175 ?auto_90176 ) ( ON-TABLE ?auto_90173 ) ( not ( = ?auto_90173 ?auto_90174 ) ) ( not ( = ?auto_90173 ?auto_90175 ) ) ( not ( = ?auto_90173 ?auto_90176 ) ) ( not ( = ?auto_90174 ?auto_90175 ) ) ( not ( = ?auto_90174 ?auto_90176 ) ) ( not ( = ?auto_90175 ?auto_90176 ) ) ( CLEAR ?auto_90173 ) ( ON ?auto_90174 ?auto_90175 ) ( CLEAR ?auto_90174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90173 ?auto_90174 )
      ( MAKE-3PILE ?auto_90173 ?auto_90174 ?auto_90175 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90187 - BLOCK
      ?auto_90188 - BLOCK
      ?auto_90189 - BLOCK
    )
    :vars
    (
      ?auto_90190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90189 ?auto_90190 ) ( not ( = ?auto_90187 ?auto_90188 ) ) ( not ( = ?auto_90187 ?auto_90189 ) ) ( not ( = ?auto_90187 ?auto_90190 ) ) ( not ( = ?auto_90188 ?auto_90189 ) ) ( not ( = ?auto_90188 ?auto_90190 ) ) ( not ( = ?auto_90189 ?auto_90190 ) ) ( ON ?auto_90188 ?auto_90189 ) ( ON ?auto_90187 ?auto_90188 ) ( CLEAR ?auto_90187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90187 )
      ( MAKE-3PILE ?auto_90187 ?auto_90188 ?auto_90189 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90202 - BLOCK
      ?auto_90203 - BLOCK
      ?auto_90204 - BLOCK
      ?auto_90205 - BLOCK
    )
    :vars
    (
      ?auto_90206 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_90204 ) ( ON ?auto_90205 ?auto_90206 ) ( CLEAR ?auto_90205 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90202 ) ( ON ?auto_90203 ?auto_90202 ) ( ON ?auto_90204 ?auto_90203 ) ( not ( = ?auto_90202 ?auto_90203 ) ) ( not ( = ?auto_90202 ?auto_90204 ) ) ( not ( = ?auto_90202 ?auto_90205 ) ) ( not ( = ?auto_90202 ?auto_90206 ) ) ( not ( = ?auto_90203 ?auto_90204 ) ) ( not ( = ?auto_90203 ?auto_90205 ) ) ( not ( = ?auto_90203 ?auto_90206 ) ) ( not ( = ?auto_90204 ?auto_90205 ) ) ( not ( = ?auto_90204 ?auto_90206 ) ) ( not ( = ?auto_90205 ?auto_90206 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90205 ?auto_90206 )
      ( !STACK ?auto_90205 ?auto_90204 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90220 - BLOCK
      ?auto_90221 - BLOCK
      ?auto_90222 - BLOCK
      ?auto_90223 - BLOCK
    )
    :vars
    (
      ?auto_90224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90223 ?auto_90224 ) ( ON-TABLE ?auto_90220 ) ( ON ?auto_90221 ?auto_90220 ) ( not ( = ?auto_90220 ?auto_90221 ) ) ( not ( = ?auto_90220 ?auto_90222 ) ) ( not ( = ?auto_90220 ?auto_90223 ) ) ( not ( = ?auto_90220 ?auto_90224 ) ) ( not ( = ?auto_90221 ?auto_90222 ) ) ( not ( = ?auto_90221 ?auto_90223 ) ) ( not ( = ?auto_90221 ?auto_90224 ) ) ( not ( = ?auto_90222 ?auto_90223 ) ) ( not ( = ?auto_90222 ?auto_90224 ) ) ( not ( = ?auto_90223 ?auto_90224 ) ) ( CLEAR ?auto_90221 ) ( ON ?auto_90222 ?auto_90223 ) ( CLEAR ?auto_90222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90220 ?auto_90221 ?auto_90222 )
      ( MAKE-4PILE ?auto_90220 ?auto_90221 ?auto_90222 ?auto_90223 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90238 - BLOCK
      ?auto_90239 - BLOCK
      ?auto_90240 - BLOCK
      ?auto_90241 - BLOCK
    )
    :vars
    (
      ?auto_90242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90241 ?auto_90242 ) ( ON-TABLE ?auto_90238 ) ( not ( = ?auto_90238 ?auto_90239 ) ) ( not ( = ?auto_90238 ?auto_90240 ) ) ( not ( = ?auto_90238 ?auto_90241 ) ) ( not ( = ?auto_90238 ?auto_90242 ) ) ( not ( = ?auto_90239 ?auto_90240 ) ) ( not ( = ?auto_90239 ?auto_90241 ) ) ( not ( = ?auto_90239 ?auto_90242 ) ) ( not ( = ?auto_90240 ?auto_90241 ) ) ( not ( = ?auto_90240 ?auto_90242 ) ) ( not ( = ?auto_90241 ?auto_90242 ) ) ( ON ?auto_90240 ?auto_90241 ) ( CLEAR ?auto_90238 ) ( ON ?auto_90239 ?auto_90240 ) ( CLEAR ?auto_90239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90238 ?auto_90239 )
      ( MAKE-4PILE ?auto_90238 ?auto_90239 ?auto_90240 ?auto_90241 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90256 - BLOCK
      ?auto_90257 - BLOCK
      ?auto_90258 - BLOCK
      ?auto_90259 - BLOCK
    )
    :vars
    (
      ?auto_90260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90259 ?auto_90260 ) ( not ( = ?auto_90256 ?auto_90257 ) ) ( not ( = ?auto_90256 ?auto_90258 ) ) ( not ( = ?auto_90256 ?auto_90259 ) ) ( not ( = ?auto_90256 ?auto_90260 ) ) ( not ( = ?auto_90257 ?auto_90258 ) ) ( not ( = ?auto_90257 ?auto_90259 ) ) ( not ( = ?auto_90257 ?auto_90260 ) ) ( not ( = ?auto_90258 ?auto_90259 ) ) ( not ( = ?auto_90258 ?auto_90260 ) ) ( not ( = ?auto_90259 ?auto_90260 ) ) ( ON ?auto_90258 ?auto_90259 ) ( ON ?auto_90257 ?auto_90258 ) ( ON ?auto_90256 ?auto_90257 ) ( CLEAR ?auto_90256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90256 )
      ( MAKE-4PILE ?auto_90256 ?auto_90257 ?auto_90258 ?auto_90259 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_90275 - BLOCK
      ?auto_90276 - BLOCK
      ?auto_90277 - BLOCK
      ?auto_90278 - BLOCK
      ?auto_90279 - BLOCK
    )
    :vars
    (
      ?auto_90280 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_90278 ) ( ON ?auto_90279 ?auto_90280 ) ( CLEAR ?auto_90279 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90275 ) ( ON ?auto_90276 ?auto_90275 ) ( ON ?auto_90277 ?auto_90276 ) ( ON ?auto_90278 ?auto_90277 ) ( not ( = ?auto_90275 ?auto_90276 ) ) ( not ( = ?auto_90275 ?auto_90277 ) ) ( not ( = ?auto_90275 ?auto_90278 ) ) ( not ( = ?auto_90275 ?auto_90279 ) ) ( not ( = ?auto_90275 ?auto_90280 ) ) ( not ( = ?auto_90276 ?auto_90277 ) ) ( not ( = ?auto_90276 ?auto_90278 ) ) ( not ( = ?auto_90276 ?auto_90279 ) ) ( not ( = ?auto_90276 ?auto_90280 ) ) ( not ( = ?auto_90277 ?auto_90278 ) ) ( not ( = ?auto_90277 ?auto_90279 ) ) ( not ( = ?auto_90277 ?auto_90280 ) ) ( not ( = ?auto_90278 ?auto_90279 ) ) ( not ( = ?auto_90278 ?auto_90280 ) ) ( not ( = ?auto_90279 ?auto_90280 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90279 ?auto_90280 )
      ( !STACK ?auto_90279 ?auto_90278 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_90297 - BLOCK
      ?auto_90298 - BLOCK
      ?auto_90299 - BLOCK
      ?auto_90300 - BLOCK
      ?auto_90301 - BLOCK
    )
    :vars
    (
      ?auto_90302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90301 ?auto_90302 ) ( ON-TABLE ?auto_90297 ) ( ON ?auto_90298 ?auto_90297 ) ( ON ?auto_90299 ?auto_90298 ) ( not ( = ?auto_90297 ?auto_90298 ) ) ( not ( = ?auto_90297 ?auto_90299 ) ) ( not ( = ?auto_90297 ?auto_90300 ) ) ( not ( = ?auto_90297 ?auto_90301 ) ) ( not ( = ?auto_90297 ?auto_90302 ) ) ( not ( = ?auto_90298 ?auto_90299 ) ) ( not ( = ?auto_90298 ?auto_90300 ) ) ( not ( = ?auto_90298 ?auto_90301 ) ) ( not ( = ?auto_90298 ?auto_90302 ) ) ( not ( = ?auto_90299 ?auto_90300 ) ) ( not ( = ?auto_90299 ?auto_90301 ) ) ( not ( = ?auto_90299 ?auto_90302 ) ) ( not ( = ?auto_90300 ?auto_90301 ) ) ( not ( = ?auto_90300 ?auto_90302 ) ) ( not ( = ?auto_90301 ?auto_90302 ) ) ( CLEAR ?auto_90299 ) ( ON ?auto_90300 ?auto_90301 ) ( CLEAR ?auto_90300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90297 ?auto_90298 ?auto_90299 ?auto_90300 )
      ( MAKE-5PILE ?auto_90297 ?auto_90298 ?auto_90299 ?auto_90300 ?auto_90301 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_90319 - BLOCK
      ?auto_90320 - BLOCK
      ?auto_90321 - BLOCK
      ?auto_90322 - BLOCK
      ?auto_90323 - BLOCK
    )
    :vars
    (
      ?auto_90324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90323 ?auto_90324 ) ( ON-TABLE ?auto_90319 ) ( ON ?auto_90320 ?auto_90319 ) ( not ( = ?auto_90319 ?auto_90320 ) ) ( not ( = ?auto_90319 ?auto_90321 ) ) ( not ( = ?auto_90319 ?auto_90322 ) ) ( not ( = ?auto_90319 ?auto_90323 ) ) ( not ( = ?auto_90319 ?auto_90324 ) ) ( not ( = ?auto_90320 ?auto_90321 ) ) ( not ( = ?auto_90320 ?auto_90322 ) ) ( not ( = ?auto_90320 ?auto_90323 ) ) ( not ( = ?auto_90320 ?auto_90324 ) ) ( not ( = ?auto_90321 ?auto_90322 ) ) ( not ( = ?auto_90321 ?auto_90323 ) ) ( not ( = ?auto_90321 ?auto_90324 ) ) ( not ( = ?auto_90322 ?auto_90323 ) ) ( not ( = ?auto_90322 ?auto_90324 ) ) ( not ( = ?auto_90323 ?auto_90324 ) ) ( ON ?auto_90322 ?auto_90323 ) ( CLEAR ?auto_90320 ) ( ON ?auto_90321 ?auto_90322 ) ( CLEAR ?auto_90321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90319 ?auto_90320 ?auto_90321 )
      ( MAKE-5PILE ?auto_90319 ?auto_90320 ?auto_90321 ?auto_90322 ?auto_90323 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_90341 - BLOCK
      ?auto_90342 - BLOCK
      ?auto_90343 - BLOCK
      ?auto_90344 - BLOCK
      ?auto_90345 - BLOCK
    )
    :vars
    (
      ?auto_90346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90345 ?auto_90346 ) ( ON-TABLE ?auto_90341 ) ( not ( = ?auto_90341 ?auto_90342 ) ) ( not ( = ?auto_90341 ?auto_90343 ) ) ( not ( = ?auto_90341 ?auto_90344 ) ) ( not ( = ?auto_90341 ?auto_90345 ) ) ( not ( = ?auto_90341 ?auto_90346 ) ) ( not ( = ?auto_90342 ?auto_90343 ) ) ( not ( = ?auto_90342 ?auto_90344 ) ) ( not ( = ?auto_90342 ?auto_90345 ) ) ( not ( = ?auto_90342 ?auto_90346 ) ) ( not ( = ?auto_90343 ?auto_90344 ) ) ( not ( = ?auto_90343 ?auto_90345 ) ) ( not ( = ?auto_90343 ?auto_90346 ) ) ( not ( = ?auto_90344 ?auto_90345 ) ) ( not ( = ?auto_90344 ?auto_90346 ) ) ( not ( = ?auto_90345 ?auto_90346 ) ) ( ON ?auto_90344 ?auto_90345 ) ( ON ?auto_90343 ?auto_90344 ) ( CLEAR ?auto_90341 ) ( ON ?auto_90342 ?auto_90343 ) ( CLEAR ?auto_90342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90341 ?auto_90342 )
      ( MAKE-5PILE ?auto_90341 ?auto_90342 ?auto_90343 ?auto_90344 ?auto_90345 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_90363 - BLOCK
      ?auto_90364 - BLOCK
      ?auto_90365 - BLOCK
      ?auto_90366 - BLOCK
      ?auto_90367 - BLOCK
    )
    :vars
    (
      ?auto_90368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90367 ?auto_90368 ) ( not ( = ?auto_90363 ?auto_90364 ) ) ( not ( = ?auto_90363 ?auto_90365 ) ) ( not ( = ?auto_90363 ?auto_90366 ) ) ( not ( = ?auto_90363 ?auto_90367 ) ) ( not ( = ?auto_90363 ?auto_90368 ) ) ( not ( = ?auto_90364 ?auto_90365 ) ) ( not ( = ?auto_90364 ?auto_90366 ) ) ( not ( = ?auto_90364 ?auto_90367 ) ) ( not ( = ?auto_90364 ?auto_90368 ) ) ( not ( = ?auto_90365 ?auto_90366 ) ) ( not ( = ?auto_90365 ?auto_90367 ) ) ( not ( = ?auto_90365 ?auto_90368 ) ) ( not ( = ?auto_90366 ?auto_90367 ) ) ( not ( = ?auto_90366 ?auto_90368 ) ) ( not ( = ?auto_90367 ?auto_90368 ) ) ( ON ?auto_90366 ?auto_90367 ) ( ON ?auto_90365 ?auto_90366 ) ( ON ?auto_90364 ?auto_90365 ) ( ON ?auto_90363 ?auto_90364 ) ( CLEAR ?auto_90363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90363 )
      ( MAKE-5PILE ?auto_90363 ?auto_90364 ?auto_90365 ?auto_90366 ?auto_90367 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90386 - BLOCK
      ?auto_90387 - BLOCK
      ?auto_90388 - BLOCK
      ?auto_90389 - BLOCK
      ?auto_90390 - BLOCK
      ?auto_90391 - BLOCK
    )
    :vars
    (
      ?auto_90392 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_90390 ) ( ON ?auto_90391 ?auto_90392 ) ( CLEAR ?auto_90391 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90386 ) ( ON ?auto_90387 ?auto_90386 ) ( ON ?auto_90388 ?auto_90387 ) ( ON ?auto_90389 ?auto_90388 ) ( ON ?auto_90390 ?auto_90389 ) ( not ( = ?auto_90386 ?auto_90387 ) ) ( not ( = ?auto_90386 ?auto_90388 ) ) ( not ( = ?auto_90386 ?auto_90389 ) ) ( not ( = ?auto_90386 ?auto_90390 ) ) ( not ( = ?auto_90386 ?auto_90391 ) ) ( not ( = ?auto_90386 ?auto_90392 ) ) ( not ( = ?auto_90387 ?auto_90388 ) ) ( not ( = ?auto_90387 ?auto_90389 ) ) ( not ( = ?auto_90387 ?auto_90390 ) ) ( not ( = ?auto_90387 ?auto_90391 ) ) ( not ( = ?auto_90387 ?auto_90392 ) ) ( not ( = ?auto_90388 ?auto_90389 ) ) ( not ( = ?auto_90388 ?auto_90390 ) ) ( not ( = ?auto_90388 ?auto_90391 ) ) ( not ( = ?auto_90388 ?auto_90392 ) ) ( not ( = ?auto_90389 ?auto_90390 ) ) ( not ( = ?auto_90389 ?auto_90391 ) ) ( not ( = ?auto_90389 ?auto_90392 ) ) ( not ( = ?auto_90390 ?auto_90391 ) ) ( not ( = ?auto_90390 ?auto_90392 ) ) ( not ( = ?auto_90391 ?auto_90392 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90391 ?auto_90392 )
      ( !STACK ?auto_90391 ?auto_90390 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90412 - BLOCK
      ?auto_90413 - BLOCK
      ?auto_90414 - BLOCK
      ?auto_90415 - BLOCK
      ?auto_90416 - BLOCK
      ?auto_90417 - BLOCK
    )
    :vars
    (
      ?auto_90418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90417 ?auto_90418 ) ( ON-TABLE ?auto_90412 ) ( ON ?auto_90413 ?auto_90412 ) ( ON ?auto_90414 ?auto_90413 ) ( ON ?auto_90415 ?auto_90414 ) ( not ( = ?auto_90412 ?auto_90413 ) ) ( not ( = ?auto_90412 ?auto_90414 ) ) ( not ( = ?auto_90412 ?auto_90415 ) ) ( not ( = ?auto_90412 ?auto_90416 ) ) ( not ( = ?auto_90412 ?auto_90417 ) ) ( not ( = ?auto_90412 ?auto_90418 ) ) ( not ( = ?auto_90413 ?auto_90414 ) ) ( not ( = ?auto_90413 ?auto_90415 ) ) ( not ( = ?auto_90413 ?auto_90416 ) ) ( not ( = ?auto_90413 ?auto_90417 ) ) ( not ( = ?auto_90413 ?auto_90418 ) ) ( not ( = ?auto_90414 ?auto_90415 ) ) ( not ( = ?auto_90414 ?auto_90416 ) ) ( not ( = ?auto_90414 ?auto_90417 ) ) ( not ( = ?auto_90414 ?auto_90418 ) ) ( not ( = ?auto_90415 ?auto_90416 ) ) ( not ( = ?auto_90415 ?auto_90417 ) ) ( not ( = ?auto_90415 ?auto_90418 ) ) ( not ( = ?auto_90416 ?auto_90417 ) ) ( not ( = ?auto_90416 ?auto_90418 ) ) ( not ( = ?auto_90417 ?auto_90418 ) ) ( CLEAR ?auto_90415 ) ( ON ?auto_90416 ?auto_90417 ) ( CLEAR ?auto_90416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90412 ?auto_90413 ?auto_90414 ?auto_90415 ?auto_90416 )
      ( MAKE-6PILE ?auto_90412 ?auto_90413 ?auto_90414 ?auto_90415 ?auto_90416 ?auto_90417 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90438 - BLOCK
      ?auto_90439 - BLOCK
      ?auto_90440 - BLOCK
      ?auto_90441 - BLOCK
      ?auto_90442 - BLOCK
      ?auto_90443 - BLOCK
    )
    :vars
    (
      ?auto_90444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90443 ?auto_90444 ) ( ON-TABLE ?auto_90438 ) ( ON ?auto_90439 ?auto_90438 ) ( ON ?auto_90440 ?auto_90439 ) ( not ( = ?auto_90438 ?auto_90439 ) ) ( not ( = ?auto_90438 ?auto_90440 ) ) ( not ( = ?auto_90438 ?auto_90441 ) ) ( not ( = ?auto_90438 ?auto_90442 ) ) ( not ( = ?auto_90438 ?auto_90443 ) ) ( not ( = ?auto_90438 ?auto_90444 ) ) ( not ( = ?auto_90439 ?auto_90440 ) ) ( not ( = ?auto_90439 ?auto_90441 ) ) ( not ( = ?auto_90439 ?auto_90442 ) ) ( not ( = ?auto_90439 ?auto_90443 ) ) ( not ( = ?auto_90439 ?auto_90444 ) ) ( not ( = ?auto_90440 ?auto_90441 ) ) ( not ( = ?auto_90440 ?auto_90442 ) ) ( not ( = ?auto_90440 ?auto_90443 ) ) ( not ( = ?auto_90440 ?auto_90444 ) ) ( not ( = ?auto_90441 ?auto_90442 ) ) ( not ( = ?auto_90441 ?auto_90443 ) ) ( not ( = ?auto_90441 ?auto_90444 ) ) ( not ( = ?auto_90442 ?auto_90443 ) ) ( not ( = ?auto_90442 ?auto_90444 ) ) ( not ( = ?auto_90443 ?auto_90444 ) ) ( ON ?auto_90442 ?auto_90443 ) ( CLEAR ?auto_90440 ) ( ON ?auto_90441 ?auto_90442 ) ( CLEAR ?auto_90441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90438 ?auto_90439 ?auto_90440 ?auto_90441 )
      ( MAKE-6PILE ?auto_90438 ?auto_90439 ?auto_90440 ?auto_90441 ?auto_90442 ?auto_90443 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90464 - BLOCK
      ?auto_90465 - BLOCK
      ?auto_90466 - BLOCK
      ?auto_90467 - BLOCK
      ?auto_90468 - BLOCK
      ?auto_90469 - BLOCK
    )
    :vars
    (
      ?auto_90470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90469 ?auto_90470 ) ( ON-TABLE ?auto_90464 ) ( ON ?auto_90465 ?auto_90464 ) ( not ( = ?auto_90464 ?auto_90465 ) ) ( not ( = ?auto_90464 ?auto_90466 ) ) ( not ( = ?auto_90464 ?auto_90467 ) ) ( not ( = ?auto_90464 ?auto_90468 ) ) ( not ( = ?auto_90464 ?auto_90469 ) ) ( not ( = ?auto_90464 ?auto_90470 ) ) ( not ( = ?auto_90465 ?auto_90466 ) ) ( not ( = ?auto_90465 ?auto_90467 ) ) ( not ( = ?auto_90465 ?auto_90468 ) ) ( not ( = ?auto_90465 ?auto_90469 ) ) ( not ( = ?auto_90465 ?auto_90470 ) ) ( not ( = ?auto_90466 ?auto_90467 ) ) ( not ( = ?auto_90466 ?auto_90468 ) ) ( not ( = ?auto_90466 ?auto_90469 ) ) ( not ( = ?auto_90466 ?auto_90470 ) ) ( not ( = ?auto_90467 ?auto_90468 ) ) ( not ( = ?auto_90467 ?auto_90469 ) ) ( not ( = ?auto_90467 ?auto_90470 ) ) ( not ( = ?auto_90468 ?auto_90469 ) ) ( not ( = ?auto_90468 ?auto_90470 ) ) ( not ( = ?auto_90469 ?auto_90470 ) ) ( ON ?auto_90468 ?auto_90469 ) ( ON ?auto_90467 ?auto_90468 ) ( CLEAR ?auto_90465 ) ( ON ?auto_90466 ?auto_90467 ) ( CLEAR ?auto_90466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90464 ?auto_90465 ?auto_90466 )
      ( MAKE-6PILE ?auto_90464 ?auto_90465 ?auto_90466 ?auto_90467 ?auto_90468 ?auto_90469 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90490 - BLOCK
      ?auto_90491 - BLOCK
      ?auto_90492 - BLOCK
      ?auto_90493 - BLOCK
      ?auto_90494 - BLOCK
      ?auto_90495 - BLOCK
    )
    :vars
    (
      ?auto_90496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90495 ?auto_90496 ) ( ON-TABLE ?auto_90490 ) ( not ( = ?auto_90490 ?auto_90491 ) ) ( not ( = ?auto_90490 ?auto_90492 ) ) ( not ( = ?auto_90490 ?auto_90493 ) ) ( not ( = ?auto_90490 ?auto_90494 ) ) ( not ( = ?auto_90490 ?auto_90495 ) ) ( not ( = ?auto_90490 ?auto_90496 ) ) ( not ( = ?auto_90491 ?auto_90492 ) ) ( not ( = ?auto_90491 ?auto_90493 ) ) ( not ( = ?auto_90491 ?auto_90494 ) ) ( not ( = ?auto_90491 ?auto_90495 ) ) ( not ( = ?auto_90491 ?auto_90496 ) ) ( not ( = ?auto_90492 ?auto_90493 ) ) ( not ( = ?auto_90492 ?auto_90494 ) ) ( not ( = ?auto_90492 ?auto_90495 ) ) ( not ( = ?auto_90492 ?auto_90496 ) ) ( not ( = ?auto_90493 ?auto_90494 ) ) ( not ( = ?auto_90493 ?auto_90495 ) ) ( not ( = ?auto_90493 ?auto_90496 ) ) ( not ( = ?auto_90494 ?auto_90495 ) ) ( not ( = ?auto_90494 ?auto_90496 ) ) ( not ( = ?auto_90495 ?auto_90496 ) ) ( ON ?auto_90494 ?auto_90495 ) ( ON ?auto_90493 ?auto_90494 ) ( ON ?auto_90492 ?auto_90493 ) ( CLEAR ?auto_90490 ) ( ON ?auto_90491 ?auto_90492 ) ( CLEAR ?auto_90491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90490 ?auto_90491 )
      ( MAKE-6PILE ?auto_90490 ?auto_90491 ?auto_90492 ?auto_90493 ?auto_90494 ?auto_90495 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90516 - BLOCK
      ?auto_90517 - BLOCK
      ?auto_90518 - BLOCK
      ?auto_90519 - BLOCK
      ?auto_90520 - BLOCK
      ?auto_90521 - BLOCK
    )
    :vars
    (
      ?auto_90522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90521 ?auto_90522 ) ( not ( = ?auto_90516 ?auto_90517 ) ) ( not ( = ?auto_90516 ?auto_90518 ) ) ( not ( = ?auto_90516 ?auto_90519 ) ) ( not ( = ?auto_90516 ?auto_90520 ) ) ( not ( = ?auto_90516 ?auto_90521 ) ) ( not ( = ?auto_90516 ?auto_90522 ) ) ( not ( = ?auto_90517 ?auto_90518 ) ) ( not ( = ?auto_90517 ?auto_90519 ) ) ( not ( = ?auto_90517 ?auto_90520 ) ) ( not ( = ?auto_90517 ?auto_90521 ) ) ( not ( = ?auto_90517 ?auto_90522 ) ) ( not ( = ?auto_90518 ?auto_90519 ) ) ( not ( = ?auto_90518 ?auto_90520 ) ) ( not ( = ?auto_90518 ?auto_90521 ) ) ( not ( = ?auto_90518 ?auto_90522 ) ) ( not ( = ?auto_90519 ?auto_90520 ) ) ( not ( = ?auto_90519 ?auto_90521 ) ) ( not ( = ?auto_90519 ?auto_90522 ) ) ( not ( = ?auto_90520 ?auto_90521 ) ) ( not ( = ?auto_90520 ?auto_90522 ) ) ( not ( = ?auto_90521 ?auto_90522 ) ) ( ON ?auto_90520 ?auto_90521 ) ( ON ?auto_90519 ?auto_90520 ) ( ON ?auto_90518 ?auto_90519 ) ( ON ?auto_90517 ?auto_90518 ) ( ON ?auto_90516 ?auto_90517 ) ( CLEAR ?auto_90516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90516 )
      ( MAKE-6PILE ?auto_90516 ?auto_90517 ?auto_90518 ?auto_90519 ?auto_90520 ?auto_90521 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_90543 - BLOCK
      ?auto_90544 - BLOCK
      ?auto_90545 - BLOCK
      ?auto_90546 - BLOCK
      ?auto_90547 - BLOCK
      ?auto_90548 - BLOCK
      ?auto_90549 - BLOCK
    )
    :vars
    (
      ?auto_90550 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_90548 ) ( ON ?auto_90549 ?auto_90550 ) ( CLEAR ?auto_90549 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90543 ) ( ON ?auto_90544 ?auto_90543 ) ( ON ?auto_90545 ?auto_90544 ) ( ON ?auto_90546 ?auto_90545 ) ( ON ?auto_90547 ?auto_90546 ) ( ON ?auto_90548 ?auto_90547 ) ( not ( = ?auto_90543 ?auto_90544 ) ) ( not ( = ?auto_90543 ?auto_90545 ) ) ( not ( = ?auto_90543 ?auto_90546 ) ) ( not ( = ?auto_90543 ?auto_90547 ) ) ( not ( = ?auto_90543 ?auto_90548 ) ) ( not ( = ?auto_90543 ?auto_90549 ) ) ( not ( = ?auto_90543 ?auto_90550 ) ) ( not ( = ?auto_90544 ?auto_90545 ) ) ( not ( = ?auto_90544 ?auto_90546 ) ) ( not ( = ?auto_90544 ?auto_90547 ) ) ( not ( = ?auto_90544 ?auto_90548 ) ) ( not ( = ?auto_90544 ?auto_90549 ) ) ( not ( = ?auto_90544 ?auto_90550 ) ) ( not ( = ?auto_90545 ?auto_90546 ) ) ( not ( = ?auto_90545 ?auto_90547 ) ) ( not ( = ?auto_90545 ?auto_90548 ) ) ( not ( = ?auto_90545 ?auto_90549 ) ) ( not ( = ?auto_90545 ?auto_90550 ) ) ( not ( = ?auto_90546 ?auto_90547 ) ) ( not ( = ?auto_90546 ?auto_90548 ) ) ( not ( = ?auto_90546 ?auto_90549 ) ) ( not ( = ?auto_90546 ?auto_90550 ) ) ( not ( = ?auto_90547 ?auto_90548 ) ) ( not ( = ?auto_90547 ?auto_90549 ) ) ( not ( = ?auto_90547 ?auto_90550 ) ) ( not ( = ?auto_90548 ?auto_90549 ) ) ( not ( = ?auto_90548 ?auto_90550 ) ) ( not ( = ?auto_90549 ?auto_90550 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90549 ?auto_90550 )
      ( !STACK ?auto_90549 ?auto_90548 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_90573 - BLOCK
      ?auto_90574 - BLOCK
      ?auto_90575 - BLOCK
      ?auto_90576 - BLOCK
      ?auto_90577 - BLOCK
      ?auto_90578 - BLOCK
      ?auto_90579 - BLOCK
    )
    :vars
    (
      ?auto_90580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90579 ?auto_90580 ) ( ON-TABLE ?auto_90573 ) ( ON ?auto_90574 ?auto_90573 ) ( ON ?auto_90575 ?auto_90574 ) ( ON ?auto_90576 ?auto_90575 ) ( ON ?auto_90577 ?auto_90576 ) ( not ( = ?auto_90573 ?auto_90574 ) ) ( not ( = ?auto_90573 ?auto_90575 ) ) ( not ( = ?auto_90573 ?auto_90576 ) ) ( not ( = ?auto_90573 ?auto_90577 ) ) ( not ( = ?auto_90573 ?auto_90578 ) ) ( not ( = ?auto_90573 ?auto_90579 ) ) ( not ( = ?auto_90573 ?auto_90580 ) ) ( not ( = ?auto_90574 ?auto_90575 ) ) ( not ( = ?auto_90574 ?auto_90576 ) ) ( not ( = ?auto_90574 ?auto_90577 ) ) ( not ( = ?auto_90574 ?auto_90578 ) ) ( not ( = ?auto_90574 ?auto_90579 ) ) ( not ( = ?auto_90574 ?auto_90580 ) ) ( not ( = ?auto_90575 ?auto_90576 ) ) ( not ( = ?auto_90575 ?auto_90577 ) ) ( not ( = ?auto_90575 ?auto_90578 ) ) ( not ( = ?auto_90575 ?auto_90579 ) ) ( not ( = ?auto_90575 ?auto_90580 ) ) ( not ( = ?auto_90576 ?auto_90577 ) ) ( not ( = ?auto_90576 ?auto_90578 ) ) ( not ( = ?auto_90576 ?auto_90579 ) ) ( not ( = ?auto_90576 ?auto_90580 ) ) ( not ( = ?auto_90577 ?auto_90578 ) ) ( not ( = ?auto_90577 ?auto_90579 ) ) ( not ( = ?auto_90577 ?auto_90580 ) ) ( not ( = ?auto_90578 ?auto_90579 ) ) ( not ( = ?auto_90578 ?auto_90580 ) ) ( not ( = ?auto_90579 ?auto_90580 ) ) ( CLEAR ?auto_90577 ) ( ON ?auto_90578 ?auto_90579 ) ( CLEAR ?auto_90578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90573 ?auto_90574 ?auto_90575 ?auto_90576 ?auto_90577 ?auto_90578 )
      ( MAKE-7PILE ?auto_90573 ?auto_90574 ?auto_90575 ?auto_90576 ?auto_90577 ?auto_90578 ?auto_90579 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_90603 - BLOCK
      ?auto_90604 - BLOCK
      ?auto_90605 - BLOCK
      ?auto_90606 - BLOCK
      ?auto_90607 - BLOCK
      ?auto_90608 - BLOCK
      ?auto_90609 - BLOCK
    )
    :vars
    (
      ?auto_90610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90609 ?auto_90610 ) ( ON-TABLE ?auto_90603 ) ( ON ?auto_90604 ?auto_90603 ) ( ON ?auto_90605 ?auto_90604 ) ( ON ?auto_90606 ?auto_90605 ) ( not ( = ?auto_90603 ?auto_90604 ) ) ( not ( = ?auto_90603 ?auto_90605 ) ) ( not ( = ?auto_90603 ?auto_90606 ) ) ( not ( = ?auto_90603 ?auto_90607 ) ) ( not ( = ?auto_90603 ?auto_90608 ) ) ( not ( = ?auto_90603 ?auto_90609 ) ) ( not ( = ?auto_90603 ?auto_90610 ) ) ( not ( = ?auto_90604 ?auto_90605 ) ) ( not ( = ?auto_90604 ?auto_90606 ) ) ( not ( = ?auto_90604 ?auto_90607 ) ) ( not ( = ?auto_90604 ?auto_90608 ) ) ( not ( = ?auto_90604 ?auto_90609 ) ) ( not ( = ?auto_90604 ?auto_90610 ) ) ( not ( = ?auto_90605 ?auto_90606 ) ) ( not ( = ?auto_90605 ?auto_90607 ) ) ( not ( = ?auto_90605 ?auto_90608 ) ) ( not ( = ?auto_90605 ?auto_90609 ) ) ( not ( = ?auto_90605 ?auto_90610 ) ) ( not ( = ?auto_90606 ?auto_90607 ) ) ( not ( = ?auto_90606 ?auto_90608 ) ) ( not ( = ?auto_90606 ?auto_90609 ) ) ( not ( = ?auto_90606 ?auto_90610 ) ) ( not ( = ?auto_90607 ?auto_90608 ) ) ( not ( = ?auto_90607 ?auto_90609 ) ) ( not ( = ?auto_90607 ?auto_90610 ) ) ( not ( = ?auto_90608 ?auto_90609 ) ) ( not ( = ?auto_90608 ?auto_90610 ) ) ( not ( = ?auto_90609 ?auto_90610 ) ) ( ON ?auto_90608 ?auto_90609 ) ( CLEAR ?auto_90606 ) ( ON ?auto_90607 ?auto_90608 ) ( CLEAR ?auto_90607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90603 ?auto_90604 ?auto_90605 ?auto_90606 ?auto_90607 )
      ( MAKE-7PILE ?auto_90603 ?auto_90604 ?auto_90605 ?auto_90606 ?auto_90607 ?auto_90608 ?auto_90609 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_90633 - BLOCK
      ?auto_90634 - BLOCK
      ?auto_90635 - BLOCK
      ?auto_90636 - BLOCK
      ?auto_90637 - BLOCK
      ?auto_90638 - BLOCK
      ?auto_90639 - BLOCK
    )
    :vars
    (
      ?auto_90640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90639 ?auto_90640 ) ( ON-TABLE ?auto_90633 ) ( ON ?auto_90634 ?auto_90633 ) ( ON ?auto_90635 ?auto_90634 ) ( not ( = ?auto_90633 ?auto_90634 ) ) ( not ( = ?auto_90633 ?auto_90635 ) ) ( not ( = ?auto_90633 ?auto_90636 ) ) ( not ( = ?auto_90633 ?auto_90637 ) ) ( not ( = ?auto_90633 ?auto_90638 ) ) ( not ( = ?auto_90633 ?auto_90639 ) ) ( not ( = ?auto_90633 ?auto_90640 ) ) ( not ( = ?auto_90634 ?auto_90635 ) ) ( not ( = ?auto_90634 ?auto_90636 ) ) ( not ( = ?auto_90634 ?auto_90637 ) ) ( not ( = ?auto_90634 ?auto_90638 ) ) ( not ( = ?auto_90634 ?auto_90639 ) ) ( not ( = ?auto_90634 ?auto_90640 ) ) ( not ( = ?auto_90635 ?auto_90636 ) ) ( not ( = ?auto_90635 ?auto_90637 ) ) ( not ( = ?auto_90635 ?auto_90638 ) ) ( not ( = ?auto_90635 ?auto_90639 ) ) ( not ( = ?auto_90635 ?auto_90640 ) ) ( not ( = ?auto_90636 ?auto_90637 ) ) ( not ( = ?auto_90636 ?auto_90638 ) ) ( not ( = ?auto_90636 ?auto_90639 ) ) ( not ( = ?auto_90636 ?auto_90640 ) ) ( not ( = ?auto_90637 ?auto_90638 ) ) ( not ( = ?auto_90637 ?auto_90639 ) ) ( not ( = ?auto_90637 ?auto_90640 ) ) ( not ( = ?auto_90638 ?auto_90639 ) ) ( not ( = ?auto_90638 ?auto_90640 ) ) ( not ( = ?auto_90639 ?auto_90640 ) ) ( ON ?auto_90638 ?auto_90639 ) ( ON ?auto_90637 ?auto_90638 ) ( CLEAR ?auto_90635 ) ( ON ?auto_90636 ?auto_90637 ) ( CLEAR ?auto_90636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90633 ?auto_90634 ?auto_90635 ?auto_90636 )
      ( MAKE-7PILE ?auto_90633 ?auto_90634 ?auto_90635 ?auto_90636 ?auto_90637 ?auto_90638 ?auto_90639 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_90663 - BLOCK
      ?auto_90664 - BLOCK
      ?auto_90665 - BLOCK
      ?auto_90666 - BLOCK
      ?auto_90667 - BLOCK
      ?auto_90668 - BLOCK
      ?auto_90669 - BLOCK
    )
    :vars
    (
      ?auto_90670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90669 ?auto_90670 ) ( ON-TABLE ?auto_90663 ) ( ON ?auto_90664 ?auto_90663 ) ( not ( = ?auto_90663 ?auto_90664 ) ) ( not ( = ?auto_90663 ?auto_90665 ) ) ( not ( = ?auto_90663 ?auto_90666 ) ) ( not ( = ?auto_90663 ?auto_90667 ) ) ( not ( = ?auto_90663 ?auto_90668 ) ) ( not ( = ?auto_90663 ?auto_90669 ) ) ( not ( = ?auto_90663 ?auto_90670 ) ) ( not ( = ?auto_90664 ?auto_90665 ) ) ( not ( = ?auto_90664 ?auto_90666 ) ) ( not ( = ?auto_90664 ?auto_90667 ) ) ( not ( = ?auto_90664 ?auto_90668 ) ) ( not ( = ?auto_90664 ?auto_90669 ) ) ( not ( = ?auto_90664 ?auto_90670 ) ) ( not ( = ?auto_90665 ?auto_90666 ) ) ( not ( = ?auto_90665 ?auto_90667 ) ) ( not ( = ?auto_90665 ?auto_90668 ) ) ( not ( = ?auto_90665 ?auto_90669 ) ) ( not ( = ?auto_90665 ?auto_90670 ) ) ( not ( = ?auto_90666 ?auto_90667 ) ) ( not ( = ?auto_90666 ?auto_90668 ) ) ( not ( = ?auto_90666 ?auto_90669 ) ) ( not ( = ?auto_90666 ?auto_90670 ) ) ( not ( = ?auto_90667 ?auto_90668 ) ) ( not ( = ?auto_90667 ?auto_90669 ) ) ( not ( = ?auto_90667 ?auto_90670 ) ) ( not ( = ?auto_90668 ?auto_90669 ) ) ( not ( = ?auto_90668 ?auto_90670 ) ) ( not ( = ?auto_90669 ?auto_90670 ) ) ( ON ?auto_90668 ?auto_90669 ) ( ON ?auto_90667 ?auto_90668 ) ( ON ?auto_90666 ?auto_90667 ) ( CLEAR ?auto_90664 ) ( ON ?auto_90665 ?auto_90666 ) ( CLEAR ?auto_90665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90663 ?auto_90664 ?auto_90665 )
      ( MAKE-7PILE ?auto_90663 ?auto_90664 ?auto_90665 ?auto_90666 ?auto_90667 ?auto_90668 ?auto_90669 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_90693 - BLOCK
      ?auto_90694 - BLOCK
      ?auto_90695 - BLOCK
      ?auto_90696 - BLOCK
      ?auto_90697 - BLOCK
      ?auto_90698 - BLOCK
      ?auto_90699 - BLOCK
    )
    :vars
    (
      ?auto_90700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90699 ?auto_90700 ) ( ON-TABLE ?auto_90693 ) ( not ( = ?auto_90693 ?auto_90694 ) ) ( not ( = ?auto_90693 ?auto_90695 ) ) ( not ( = ?auto_90693 ?auto_90696 ) ) ( not ( = ?auto_90693 ?auto_90697 ) ) ( not ( = ?auto_90693 ?auto_90698 ) ) ( not ( = ?auto_90693 ?auto_90699 ) ) ( not ( = ?auto_90693 ?auto_90700 ) ) ( not ( = ?auto_90694 ?auto_90695 ) ) ( not ( = ?auto_90694 ?auto_90696 ) ) ( not ( = ?auto_90694 ?auto_90697 ) ) ( not ( = ?auto_90694 ?auto_90698 ) ) ( not ( = ?auto_90694 ?auto_90699 ) ) ( not ( = ?auto_90694 ?auto_90700 ) ) ( not ( = ?auto_90695 ?auto_90696 ) ) ( not ( = ?auto_90695 ?auto_90697 ) ) ( not ( = ?auto_90695 ?auto_90698 ) ) ( not ( = ?auto_90695 ?auto_90699 ) ) ( not ( = ?auto_90695 ?auto_90700 ) ) ( not ( = ?auto_90696 ?auto_90697 ) ) ( not ( = ?auto_90696 ?auto_90698 ) ) ( not ( = ?auto_90696 ?auto_90699 ) ) ( not ( = ?auto_90696 ?auto_90700 ) ) ( not ( = ?auto_90697 ?auto_90698 ) ) ( not ( = ?auto_90697 ?auto_90699 ) ) ( not ( = ?auto_90697 ?auto_90700 ) ) ( not ( = ?auto_90698 ?auto_90699 ) ) ( not ( = ?auto_90698 ?auto_90700 ) ) ( not ( = ?auto_90699 ?auto_90700 ) ) ( ON ?auto_90698 ?auto_90699 ) ( ON ?auto_90697 ?auto_90698 ) ( ON ?auto_90696 ?auto_90697 ) ( ON ?auto_90695 ?auto_90696 ) ( CLEAR ?auto_90693 ) ( ON ?auto_90694 ?auto_90695 ) ( CLEAR ?auto_90694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90693 ?auto_90694 )
      ( MAKE-7PILE ?auto_90693 ?auto_90694 ?auto_90695 ?auto_90696 ?auto_90697 ?auto_90698 ?auto_90699 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_90723 - BLOCK
      ?auto_90724 - BLOCK
      ?auto_90725 - BLOCK
      ?auto_90726 - BLOCK
      ?auto_90727 - BLOCK
      ?auto_90728 - BLOCK
      ?auto_90729 - BLOCK
    )
    :vars
    (
      ?auto_90730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90729 ?auto_90730 ) ( not ( = ?auto_90723 ?auto_90724 ) ) ( not ( = ?auto_90723 ?auto_90725 ) ) ( not ( = ?auto_90723 ?auto_90726 ) ) ( not ( = ?auto_90723 ?auto_90727 ) ) ( not ( = ?auto_90723 ?auto_90728 ) ) ( not ( = ?auto_90723 ?auto_90729 ) ) ( not ( = ?auto_90723 ?auto_90730 ) ) ( not ( = ?auto_90724 ?auto_90725 ) ) ( not ( = ?auto_90724 ?auto_90726 ) ) ( not ( = ?auto_90724 ?auto_90727 ) ) ( not ( = ?auto_90724 ?auto_90728 ) ) ( not ( = ?auto_90724 ?auto_90729 ) ) ( not ( = ?auto_90724 ?auto_90730 ) ) ( not ( = ?auto_90725 ?auto_90726 ) ) ( not ( = ?auto_90725 ?auto_90727 ) ) ( not ( = ?auto_90725 ?auto_90728 ) ) ( not ( = ?auto_90725 ?auto_90729 ) ) ( not ( = ?auto_90725 ?auto_90730 ) ) ( not ( = ?auto_90726 ?auto_90727 ) ) ( not ( = ?auto_90726 ?auto_90728 ) ) ( not ( = ?auto_90726 ?auto_90729 ) ) ( not ( = ?auto_90726 ?auto_90730 ) ) ( not ( = ?auto_90727 ?auto_90728 ) ) ( not ( = ?auto_90727 ?auto_90729 ) ) ( not ( = ?auto_90727 ?auto_90730 ) ) ( not ( = ?auto_90728 ?auto_90729 ) ) ( not ( = ?auto_90728 ?auto_90730 ) ) ( not ( = ?auto_90729 ?auto_90730 ) ) ( ON ?auto_90728 ?auto_90729 ) ( ON ?auto_90727 ?auto_90728 ) ( ON ?auto_90726 ?auto_90727 ) ( ON ?auto_90725 ?auto_90726 ) ( ON ?auto_90724 ?auto_90725 ) ( ON ?auto_90723 ?auto_90724 ) ( CLEAR ?auto_90723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90723 )
      ( MAKE-7PILE ?auto_90723 ?auto_90724 ?auto_90725 ?auto_90726 ?auto_90727 ?auto_90728 ?auto_90729 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_90754 - BLOCK
      ?auto_90755 - BLOCK
      ?auto_90756 - BLOCK
      ?auto_90757 - BLOCK
      ?auto_90758 - BLOCK
      ?auto_90759 - BLOCK
      ?auto_90760 - BLOCK
      ?auto_90761 - BLOCK
    )
    :vars
    (
      ?auto_90762 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_90760 ) ( ON ?auto_90761 ?auto_90762 ) ( CLEAR ?auto_90761 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90754 ) ( ON ?auto_90755 ?auto_90754 ) ( ON ?auto_90756 ?auto_90755 ) ( ON ?auto_90757 ?auto_90756 ) ( ON ?auto_90758 ?auto_90757 ) ( ON ?auto_90759 ?auto_90758 ) ( ON ?auto_90760 ?auto_90759 ) ( not ( = ?auto_90754 ?auto_90755 ) ) ( not ( = ?auto_90754 ?auto_90756 ) ) ( not ( = ?auto_90754 ?auto_90757 ) ) ( not ( = ?auto_90754 ?auto_90758 ) ) ( not ( = ?auto_90754 ?auto_90759 ) ) ( not ( = ?auto_90754 ?auto_90760 ) ) ( not ( = ?auto_90754 ?auto_90761 ) ) ( not ( = ?auto_90754 ?auto_90762 ) ) ( not ( = ?auto_90755 ?auto_90756 ) ) ( not ( = ?auto_90755 ?auto_90757 ) ) ( not ( = ?auto_90755 ?auto_90758 ) ) ( not ( = ?auto_90755 ?auto_90759 ) ) ( not ( = ?auto_90755 ?auto_90760 ) ) ( not ( = ?auto_90755 ?auto_90761 ) ) ( not ( = ?auto_90755 ?auto_90762 ) ) ( not ( = ?auto_90756 ?auto_90757 ) ) ( not ( = ?auto_90756 ?auto_90758 ) ) ( not ( = ?auto_90756 ?auto_90759 ) ) ( not ( = ?auto_90756 ?auto_90760 ) ) ( not ( = ?auto_90756 ?auto_90761 ) ) ( not ( = ?auto_90756 ?auto_90762 ) ) ( not ( = ?auto_90757 ?auto_90758 ) ) ( not ( = ?auto_90757 ?auto_90759 ) ) ( not ( = ?auto_90757 ?auto_90760 ) ) ( not ( = ?auto_90757 ?auto_90761 ) ) ( not ( = ?auto_90757 ?auto_90762 ) ) ( not ( = ?auto_90758 ?auto_90759 ) ) ( not ( = ?auto_90758 ?auto_90760 ) ) ( not ( = ?auto_90758 ?auto_90761 ) ) ( not ( = ?auto_90758 ?auto_90762 ) ) ( not ( = ?auto_90759 ?auto_90760 ) ) ( not ( = ?auto_90759 ?auto_90761 ) ) ( not ( = ?auto_90759 ?auto_90762 ) ) ( not ( = ?auto_90760 ?auto_90761 ) ) ( not ( = ?auto_90760 ?auto_90762 ) ) ( not ( = ?auto_90761 ?auto_90762 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90761 ?auto_90762 )
      ( !STACK ?auto_90761 ?auto_90760 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_90788 - BLOCK
      ?auto_90789 - BLOCK
      ?auto_90790 - BLOCK
      ?auto_90791 - BLOCK
      ?auto_90792 - BLOCK
      ?auto_90793 - BLOCK
      ?auto_90794 - BLOCK
      ?auto_90795 - BLOCK
    )
    :vars
    (
      ?auto_90796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90795 ?auto_90796 ) ( ON-TABLE ?auto_90788 ) ( ON ?auto_90789 ?auto_90788 ) ( ON ?auto_90790 ?auto_90789 ) ( ON ?auto_90791 ?auto_90790 ) ( ON ?auto_90792 ?auto_90791 ) ( ON ?auto_90793 ?auto_90792 ) ( not ( = ?auto_90788 ?auto_90789 ) ) ( not ( = ?auto_90788 ?auto_90790 ) ) ( not ( = ?auto_90788 ?auto_90791 ) ) ( not ( = ?auto_90788 ?auto_90792 ) ) ( not ( = ?auto_90788 ?auto_90793 ) ) ( not ( = ?auto_90788 ?auto_90794 ) ) ( not ( = ?auto_90788 ?auto_90795 ) ) ( not ( = ?auto_90788 ?auto_90796 ) ) ( not ( = ?auto_90789 ?auto_90790 ) ) ( not ( = ?auto_90789 ?auto_90791 ) ) ( not ( = ?auto_90789 ?auto_90792 ) ) ( not ( = ?auto_90789 ?auto_90793 ) ) ( not ( = ?auto_90789 ?auto_90794 ) ) ( not ( = ?auto_90789 ?auto_90795 ) ) ( not ( = ?auto_90789 ?auto_90796 ) ) ( not ( = ?auto_90790 ?auto_90791 ) ) ( not ( = ?auto_90790 ?auto_90792 ) ) ( not ( = ?auto_90790 ?auto_90793 ) ) ( not ( = ?auto_90790 ?auto_90794 ) ) ( not ( = ?auto_90790 ?auto_90795 ) ) ( not ( = ?auto_90790 ?auto_90796 ) ) ( not ( = ?auto_90791 ?auto_90792 ) ) ( not ( = ?auto_90791 ?auto_90793 ) ) ( not ( = ?auto_90791 ?auto_90794 ) ) ( not ( = ?auto_90791 ?auto_90795 ) ) ( not ( = ?auto_90791 ?auto_90796 ) ) ( not ( = ?auto_90792 ?auto_90793 ) ) ( not ( = ?auto_90792 ?auto_90794 ) ) ( not ( = ?auto_90792 ?auto_90795 ) ) ( not ( = ?auto_90792 ?auto_90796 ) ) ( not ( = ?auto_90793 ?auto_90794 ) ) ( not ( = ?auto_90793 ?auto_90795 ) ) ( not ( = ?auto_90793 ?auto_90796 ) ) ( not ( = ?auto_90794 ?auto_90795 ) ) ( not ( = ?auto_90794 ?auto_90796 ) ) ( not ( = ?auto_90795 ?auto_90796 ) ) ( CLEAR ?auto_90793 ) ( ON ?auto_90794 ?auto_90795 ) ( CLEAR ?auto_90794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_90788 ?auto_90789 ?auto_90790 ?auto_90791 ?auto_90792 ?auto_90793 ?auto_90794 )
      ( MAKE-8PILE ?auto_90788 ?auto_90789 ?auto_90790 ?auto_90791 ?auto_90792 ?auto_90793 ?auto_90794 ?auto_90795 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_90822 - BLOCK
      ?auto_90823 - BLOCK
      ?auto_90824 - BLOCK
      ?auto_90825 - BLOCK
      ?auto_90826 - BLOCK
      ?auto_90827 - BLOCK
      ?auto_90828 - BLOCK
      ?auto_90829 - BLOCK
    )
    :vars
    (
      ?auto_90830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90829 ?auto_90830 ) ( ON-TABLE ?auto_90822 ) ( ON ?auto_90823 ?auto_90822 ) ( ON ?auto_90824 ?auto_90823 ) ( ON ?auto_90825 ?auto_90824 ) ( ON ?auto_90826 ?auto_90825 ) ( not ( = ?auto_90822 ?auto_90823 ) ) ( not ( = ?auto_90822 ?auto_90824 ) ) ( not ( = ?auto_90822 ?auto_90825 ) ) ( not ( = ?auto_90822 ?auto_90826 ) ) ( not ( = ?auto_90822 ?auto_90827 ) ) ( not ( = ?auto_90822 ?auto_90828 ) ) ( not ( = ?auto_90822 ?auto_90829 ) ) ( not ( = ?auto_90822 ?auto_90830 ) ) ( not ( = ?auto_90823 ?auto_90824 ) ) ( not ( = ?auto_90823 ?auto_90825 ) ) ( not ( = ?auto_90823 ?auto_90826 ) ) ( not ( = ?auto_90823 ?auto_90827 ) ) ( not ( = ?auto_90823 ?auto_90828 ) ) ( not ( = ?auto_90823 ?auto_90829 ) ) ( not ( = ?auto_90823 ?auto_90830 ) ) ( not ( = ?auto_90824 ?auto_90825 ) ) ( not ( = ?auto_90824 ?auto_90826 ) ) ( not ( = ?auto_90824 ?auto_90827 ) ) ( not ( = ?auto_90824 ?auto_90828 ) ) ( not ( = ?auto_90824 ?auto_90829 ) ) ( not ( = ?auto_90824 ?auto_90830 ) ) ( not ( = ?auto_90825 ?auto_90826 ) ) ( not ( = ?auto_90825 ?auto_90827 ) ) ( not ( = ?auto_90825 ?auto_90828 ) ) ( not ( = ?auto_90825 ?auto_90829 ) ) ( not ( = ?auto_90825 ?auto_90830 ) ) ( not ( = ?auto_90826 ?auto_90827 ) ) ( not ( = ?auto_90826 ?auto_90828 ) ) ( not ( = ?auto_90826 ?auto_90829 ) ) ( not ( = ?auto_90826 ?auto_90830 ) ) ( not ( = ?auto_90827 ?auto_90828 ) ) ( not ( = ?auto_90827 ?auto_90829 ) ) ( not ( = ?auto_90827 ?auto_90830 ) ) ( not ( = ?auto_90828 ?auto_90829 ) ) ( not ( = ?auto_90828 ?auto_90830 ) ) ( not ( = ?auto_90829 ?auto_90830 ) ) ( ON ?auto_90828 ?auto_90829 ) ( CLEAR ?auto_90826 ) ( ON ?auto_90827 ?auto_90828 ) ( CLEAR ?auto_90827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90822 ?auto_90823 ?auto_90824 ?auto_90825 ?auto_90826 ?auto_90827 )
      ( MAKE-8PILE ?auto_90822 ?auto_90823 ?auto_90824 ?auto_90825 ?auto_90826 ?auto_90827 ?auto_90828 ?auto_90829 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_90856 - BLOCK
      ?auto_90857 - BLOCK
      ?auto_90858 - BLOCK
      ?auto_90859 - BLOCK
      ?auto_90860 - BLOCK
      ?auto_90861 - BLOCK
      ?auto_90862 - BLOCK
      ?auto_90863 - BLOCK
    )
    :vars
    (
      ?auto_90864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90863 ?auto_90864 ) ( ON-TABLE ?auto_90856 ) ( ON ?auto_90857 ?auto_90856 ) ( ON ?auto_90858 ?auto_90857 ) ( ON ?auto_90859 ?auto_90858 ) ( not ( = ?auto_90856 ?auto_90857 ) ) ( not ( = ?auto_90856 ?auto_90858 ) ) ( not ( = ?auto_90856 ?auto_90859 ) ) ( not ( = ?auto_90856 ?auto_90860 ) ) ( not ( = ?auto_90856 ?auto_90861 ) ) ( not ( = ?auto_90856 ?auto_90862 ) ) ( not ( = ?auto_90856 ?auto_90863 ) ) ( not ( = ?auto_90856 ?auto_90864 ) ) ( not ( = ?auto_90857 ?auto_90858 ) ) ( not ( = ?auto_90857 ?auto_90859 ) ) ( not ( = ?auto_90857 ?auto_90860 ) ) ( not ( = ?auto_90857 ?auto_90861 ) ) ( not ( = ?auto_90857 ?auto_90862 ) ) ( not ( = ?auto_90857 ?auto_90863 ) ) ( not ( = ?auto_90857 ?auto_90864 ) ) ( not ( = ?auto_90858 ?auto_90859 ) ) ( not ( = ?auto_90858 ?auto_90860 ) ) ( not ( = ?auto_90858 ?auto_90861 ) ) ( not ( = ?auto_90858 ?auto_90862 ) ) ( not ( = ?auto_90858 ?auto_90863 ) ) ( not ( = ?auto_90858 ?auto_90864 ) ) ( not ( = ?auto_90859 ?auto_90860 ) ) ( not ( = ?auto_90859 ?auto_90861 ) ) ( not ( = ?auto_90859 ?auto_90862 ) ) ( not ( = ?auto_90859 ?auto_90863 ) ) ( not ( = ?auto_90859 ?auto_90864 ) ) ( not ( = ?auto_90860 ?auto_90861 ) ) ( not ( = ?auto_90860 ?auto_90862 ) ) ( not ( = ?auto_90860 ?auto_90863 ) ) ( not ( = ?auto_90860 ?auto_90864 ) ) ( not ( = ?auto_90861 ?auto_90862 ) ) ( not ( = ?auto_90861 ?auto_90863 ) ) ( not ( = ?auto_90861 ?auto_90864 ) ) ( not ( = ?auto_90862 ?auto_90863 ) ) ( not ( = ?auto_90862 ?auto_90864 ) ) ( not ( = ?auto_90863 ?auto_90864 ) ) ( ON ?auto_90862 ?auto_90863 ) ( ON ?auto_90861 ?auto_90862 ) ( CLEAR ?auto_90859 ) ( ON ?auto_90860 ?auto_90861 ) ( CLEAR ?auto_90860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90856 ?auto_90857 ?auto_90858 ?auto_90859 ?auto_90860 )
      ( MAKE-8PILE ?auto_90856 ?auto_90857 ?auto_90858 ?auto_90859 ?auto_90860 ?auto_90861 ?auto_90862 ?auto_90863 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_90890 - BLOCK
      ?auto_90891 - BLOCK
      ?auto_90892 - BLOCK
      ?auto_90893 - BLOCK
      ?auto_90894 - BLOCK
      ?auto_90895 - BLOCK
      ?auto_90896 - BLOCK
      ?auto_90897 - BLOCK
    )
    :vars
    (
      ?auto_90898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90897 ?auto_90898 ) ( ON-TABLE ?auto_90890 ) ( ON ?auto_90891 ?auto_90890 ) ( ON ?auto_90892 ?auto_90891 ) ( not ( = ?auto_90890 ?auto_90891 ) ) ( not ( = ?auto_90890 ?auto_90892 ) ) ( not ( = ?auto_90890 ?auto_90893 ) ) ( not ( = ?auto_90890 ?auto_90894 ) ) ( not ( = ?auto_90890 ?auto_90895 ) ) ( not ( = ?auto_90890 ?auto_90896 ) ) ( not ( = ?auto_90890 ?auto_90897 ) ) ( not ( = ?auto_90890 ?auto_90898 ) ) ( not ( = ?auto_90891 ?auto_90892 ) ) ( not ( = ?auto_90891 ?auto_90893 ) ) ( not ( = ?auto_90891 ?auto_90894 ) ) ( not ( = ?auto_90891 ?auto_90895 ) ) ( not ( = ?auto_90891 ?auto_90896 ) ) ( not ( = ?auto_90891 ?auto_90897 ) ) ( not ( = ?auto_90891 ?auto_90898 ) ) ( not ( = ?auto_90892 ?auto_90893 ) ) ( not ( = ?auto_90892 ?auto_90894 ) ) ( not ( = ?auto_90892 ?auto_90895 ) ) ( not ( = ?auto_90892 ?auto_90896 ) ) ( not ( = ?auto_90892 ?auto_90897 ) ) ( not ( = ?auto_90892 ?auto_90898 ) ) ( not ( = ?auto_90893 ?auto_90894 ) ) ( not ( = ?auto_90893 ?auto_90895 ) ) ( not ( = ?auto_90893 ?auto_90896 ) ) ( not ( = ?auto_90893 ?auto_90897 ) ) ( not ( = ?auto_90893 ?auto_90898 ) ) ( not ( = ?auto_90894 ?auto_90895 ) ) ( not ( = ?auto_90894 ?auto_90896 ) ) ( not ( = ?auto_90894 ?auto_90897 ) ) ( not ( = ?auto_90894 ?auto_90898 ) ) ( not ( = ?auto_90895 ?auto_90896 ) ) ( not ( = ?auto_90895 ?auto_90897 ) ) ( not ( = ?auto_90895 ?auto_90898 ) ) ( not ( = ?auto_90896 ?auto_90897 ) ) ( not ( = ?auto_90896 ?auto_90898 ) ) ( not ( = ?auto_90897 ?auto_90898 ) ) ( ON ?auto_90896 ?auto_90897 ) ( ON ?auto_90895 ?auto_90896 ) ( ON ?auto_90894 ?auto_90895 ) ( CLEAR ?auto_90892 ) ( ON ?auto_90893 ?auto_90894 ) ( CLEAR ?auto_90893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90890 ?auto_90891 ?auto_90892 ?auto_90893 )
      ( MAKE-8PILE ?auto_90890 ?auto_90891 ?auto_90892 ?auto_90893 ?auto_90894 ?auto_90895 ?auto_90896 ?auto_90897 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_90924 - BLOCK
      ?auto_90925 - BLOCK
      ?auto_90926 - BLOCK
      ?auto_90927 - BLOCK
      ?auto_90928 - BLOCK
      ?auto_90929 - BLOCK
      ?auto_90930 - BLOCK
      ?auto_90931 - BLOCK
    )
    :vars
    (
      ?auto_90932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90931 ?auto_90932 ) ( ON-TABLE ?auto_90924 ) ( ON ?auto_90925 ?auto_90924 ) ( not ( = ?auto_90924 ?auto_90925 ) ) ( not ( = ?auto_90924 ?auto_90926 ) ) ( not ( = ?auto_90924 ?auto_90927 ) ) ( not ( = ?auto_90924 ?auto_90928 ) ) ( not ( = ?auto_90924 ?auto_90929 ) ) ( not ( = ?auto_90924 ?auto_90930 ) ) ( not ( = ?auto_90924 ?auto_90931 ) ) ( not ( = ?auto_90924 ?auto_90932 ) ) ( not ( = ?auto_90925 ?auto_90926 ) ) ( not ( = ?auto_90925 ?auto_90927 ) ) ( not ( = ?auto_90925 ?auto_90928 ) ) ( not ( = ?auto_90925 ?auto_90929 ) ) ( not ( = ?auto_90925 ?auto_90930 ) ) ( not ( = ?auto_90925 ?auto_90931 ) ) ( not ( = ?auto_90925 ?auto_90932 ) ) ( not ( = ?auto_90926 ?auto_90927 ) ) ( not ( = ?auto_90926 ?auto_90928 ) ) ( not ( = ?auto_90926 ?auto_90929 ) ) ( not ( = ?auto_90926 ?auto_90930 ) ) ( not ( = ?auto_90926 ?auto_90931 ) ) ( not ( = ?auto_90926 ?auto_90932 ) ) ( not ( = ?auto_90927 ?auto_90928 ) ) ( not ( = ?auto_90927 ?auto_90929 ) ) ( not ( = ?auto_90927 ?auto_90930 ) ) ( not ( = ?auto_90927 ?auto_90931 ) ) ( not ( = ?auto_90927 ?auto_90932 ) ) ( not ( = ?auto_90928 ?auto_90929 ) ) ( not ( = ?auto_90928 ?auto_90930 ) ) ( not ( = ?auto_90928 ?auto_90931 ) ) ( not ( = ?auto_90928 ?auto_90932 ) ) ( not ( = ?auto_90929 ?auto_90930 ) ) ( not ( = ?auto_90929 ?auto_90931 ) ) ( not ( = ?auto_90929 ?auto_90932 ) ) ( not ( = ?auto_90930 ?auto_90931 ) ) ( not ( = ?auto_90930 ?auto_90932 ) ) ( not ( = ?auto_90931 ?auto_90932 ) ) ( ON ?auto_90930 ?auto_90931 ) ( ON ?auto_90929 ?auto_90930 ) ( ON ?auto_90928 ?auto_90929 ) ( ON ?auto_90927 ?auto_90928 ) ( CLEAR ?auto_90925 ) ( ON ?auto_90926 ?auto_90927 ) ( CLEAR ?auto_90926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90924 ?auto_90925 ?auto_90926 )
      ( MAKE-8PILE ?auto_90924 ?auto_90925 ?auto_90926 ?auto_90927 ?auto_90928 ?auto_90929 ?auto_90930 ?auto_90931 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_90958 - BLOCK
      ?auto_90959 - BLOCK
      ?auto_90960 - BLOCK
      ?auto_90961 - BLOCK
      ?auto_90962 - BLOCK
      ?auto_90963 - BLOCK
      ?auto_90964 - BLOCK
      ?auto_90965 - BLOCK
    )
    :vars
    (
      ?auto_90966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90965 ?auto_90966 ) ( ON-TABLE ?auto_90958 ) ( not ( = ?auto_90958 ?auto_90959 ) ) ( not ( = ?auto_90958 ?auto_90960 ) ) ( not ( = ?auto_90958 ?auto_90961 ) ) ( not ( = ?auto_90958 ?auto_90962 ) ) ( not ( = ?auto_90958 ?auto_90963 ) ) ( not ( = ?auto_90958 ?auto_90964 ) ) ( not ( = ?auto_90958 ?auto_90965 ) ) ( not ( = ?auto_90958 ?auto_90966 ) ) ( not ( = ?auto_90959 ?auto_90960 ) ) ( not ( = ?auto_90959 ?auto_90961 ) ) ( not ( = ?auto_90959 ?auto_90962 ) ) ( not ( = ?auto_90959 ?auto_90963 ) ) ( not ( = ?auto_90959 ?auto_90964 ) ) ( not ( = ?auto_90959 ?auto_90965 ) ) ( not ( = ?auto_90959 ?auto_90966 ) ) ( not ( = ?auto_90960 ?auto_90961 ) ) ( not ( = ?auto_90960 ?auto_90962 ) ) ( not ( = ?auto_90960 ?auto_90963 ) ) ( not ( = ?auto_90960 ?auto_90964 ) ) ( not ( = ?auto_90960 ?auto_90965 ) ) ( not ( = ?auto_90960 ?auto_90966 ) ) ( not ( = ?auto_90961 ?auto_90962 ) ) ( not ( = ?auto_90961 ?auto_90963 ) ) ( not ( = ?auto_90961 ?auto_90964 ) ) ( not ( = ?auto_90961 ?auto_90965 ) ) ( not ( = ?auto_90961 ?auto_90966 ) ) ( not ( = ?auto_90962 ?auto_90963 ) ) ( not ( = ?auto_90962 ?auto_90964 ) ) ( not ( = ?auto_90962 ?auto_90965 ) ) ( not ( = ?auto_90962 ?auto_90966 ) ) ( not ( = ?auto_90963 ?auto_90964 ) ) ( not ( = ?auto_90963 ?auto_90965 ) ) ( not ( = ?auto_90963 ?auto_90966 ) ) ( not ( = ?auto_90964 ?auto_90965 ) ) ( not ( = ?auto_90964 ?auto_90966 ) ) ( not ( = ?auto_90965 ?auto_90966 ) ) ( ON ?auto_90964 ?auto_90965 ) ( ON ?auto_90963 ?auto_90964 ) ( ON ?auto_90962 ?auto_90963 ) ( ON ?auto_90961 ?auto_90962 ) ( ON ?auto_90960 ?auto_90961 ) ( CLEAR ?auto_90958 ) ( ON ?auto_90959 ?auto_90960 ) ( CLEAR ?auto_90959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90958 ?auto_90959 )
      ( MAKE-8PILE ?auto_90958 ?auto_90959 ?auto_90960 ?auto_90961 ?auto_90962 ?auto_90963 ?auto_90964 ?auto_90965 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_90992 - BLOCK
      ?auto_90993 - BLOCK
      ?auto_90994 - BLOCK
      ?auto_90995 - BLOCK
      ?auto_90996 - BLOCK
      ?auto_90997 - BLOCK
      ?auto_90998 - BLOCK
      ?auto_90999 - BLOCK
    )
    :vars
    (
      ?auto_91000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90999 ?auto_91000 ) ( not ( = ?auto_90992 ?auto_90993 ) ) ( not ( = ?auto_90992 ?auto_90994 ) ) ( not ( = ?auto_90992 ?auto_90995 ) ) ( not ( = ?auto_90992 ?auto_90996 ) ) ( not ( = ?auto_90992 ?auto_90997 ) ) ( not ( = ?auto_90992 ?auto_90998 ) ) ( not ( = ?auto_90992 ?auto_90999 ) ) ( not ( = ?auto_90992 ?auto_91000 ) ) ( not ( = ?auto_90993 ?auto_90994 ) ) ( not ( = ?auto_90993 ?auto_90995 ) ) ( not ( = ?auto_90993 ?auto_90996 ) ) ( not ( = ?auto_90993 ?auto_90997 ) ) ( not ( = ?auto_90993 ?auto_90998 ) ) ( not ( = ?auto_90993 ?auto_90999 ) ) ( not ( = ?auto_90993 ?auto_91000 ) ) ( not ( = ?auto_90994 ?auto_90995 ) ) ( not ( = ?auto_90994 ?auto_90996 ) ) ( not ( = ?auto_90994 ?auto_90997 ) ) ( not ( = ?auto_90994 ?auto_90998 ) ) ( not ( = ?auto_90994 ?auto_90999 ) ) ( not ( = ?auto_90994 ?auto_91000 ) ) ( not ( = ?auto_90995 ?auto_90996 ) ) ( not ( = ?auto_90995 ?auto_90997 ) ) ( not ( = ?auto_90995 ?auto_90998 ) ) ( not ( = ?auto_90995 ?auto_90999 ) ) ( not ( = ?auto_90995 ?auto_91000 ) ) ( not ( = ?auto_90996 ?auto_90997 ) ) ( not ( = ?auto_90996 ?auto_90998 ) ) ( not ( = ?auto_90996 ?auto_90999 ) ) ( not ( = ?auto_90996 ?auto_91000 ) ) ( not ( = ?auto_90997 ?auto_90998 ) ) ( not ( = ?auto_90997 ?auto_90999 ) ) ( not ( = ?auto_90997 ?auto_91000 ) ) ( not ( = ?auto_90998 ?auto_90999 ) ) ( not ( = ?auto_90998 ?auto_91000 ) ) ( not ( = ?auto_90999 ?auto_91000 ) ) ( ON ?auto_90998 ?auto_90999 ) ( ON ?auto_90997 ?auto_90998 ) ( ON ?auto_90996 ?auto_90997 ) ( ON ?auto_90995 ?auto_90996 ) ( ON ?auto_90994 ?auto_90995 ) ( ON ?auto_90993 ?auto_90994 ) ( ON ?auto_90992 ?auto_90993 ) ( CLEAR ?auto_90992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90992 )
      ( MAKE-8PILE ?auto_90992 ?auto_90993 ?auto_90994 ?auto_90995 ?auto_90996 ?auto_90997 ?auto_90998 ?auto_90999 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_91027 - BLOCK
      ?auto_91028 - BLOCK
      ?auto_91029 - BLOCK
      ?auto_91030 - BLOCK
      ?auto_91031 - BLOCK
      ?auto_91032 - BLOCK
      ?auto_91033 - BLOCK
      ?auto_91034 - BLOCK
      ?auto_91035 - BLOCK
    )
    :vars
    (
      ?auto_91036 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_91034 ) ( ON ?auto_91035 ?auto_91036 ) ( CLEAR ?auto_91035 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91027 ) ( ON ?auto_91028 ?auto_91027 ) ( ON ?auto_91029 ?auto_91028 ) ( ON ?auto_91030 ?auto_91029 ) ( ON ?auto_91031 ?auto_91030 ) ( ON ?auto_91032 ?auto_91031 ) ( ON ?auto_91033 ?auto_91032 ) ( ON ?auto_91034 ?auto_91033 ) ( not ( = ?auto_91027 ?auto_91028 ) ) ( not ( = ?auto_91027 ?auto_91029 ) ) ( not ( = ?auto_91027 ?auto_91030 ) ) ( not ( = ?auto_91027 ?auto_91031 ) ) ( not ( = ?auto_91027 ?auto_91032 ) ) ( not ( = ?auto_91027 ?auto_91033 ) ) ( not ( = ?auto_91027 ?auto_91034 ) ) ( not ( = ?auto_91027 ?auto_91035 ) ) ( not ( = ?auto_91027 ?auto_91036 ) ) ( not ( = ?auto_91028 ?auto_91029 ) ) ( not ( = ?auto_91028 ?auto_91030 ) ) ( not ( = ?auto_91028 ?auto_91031 ) ) ( not ( = ?auto_91028 ?auto_91032 ) ) ( not ( = ?auto_91028 ?auto_91033 ) ) ( not ( = ?auto_91028 ?auto_91034 ) ) ( not ( = ?auto_91028 ?auto_91035 ) ) ( not ( = ?auto_91028 ?auto_91036 ) ) ( not ( = ?auto_91029 ?auto_91030 ) ) ( not ( = ?auto_91029 ?auto_91031 ) ) ( not ( = ?auto_91029 ?auto_91032 ) ) ( not ( = ?auto_91029 ?auto_91033 ) ) ( not ( = ?auto_91029 ?auto_91034 ) ) ( not ( = ?auto_91029 ?auto_91035 ) ) ( not ( = ?auto_91029 ?auto_91036 ) ) ( not ( = ?auto_91030 ?auto_91031 ) ) ( not ( = ?auto_91030 ?auto_91032 ) ) ( not ( = ?auto_91030 ?auto_91033 ) ) ( not ( = ?auto_91030 ?auto_91034 ) ) ( not ( = ?auto_91030 ?auto_91035 ) ) ( not ( = ?auto_91030 ?auto_91036 ) ) ( not ( = ?auto_91031 ?auto_91032 ) ) ( not ( = ?auto_91031 ?auto_91033 ) ) ( not ( = ?auto_91031 ?auto_91034 ) ) ( not ( = ?auto_91031 ?auto_91035 ) ) ( not ( = ?auto_91031 ?auto_91036 ) ) ( not ( = ?auto_91032 ?auto_91033 ) ) ( not ( = ?auto_91032 ?auto_91034 ) ) ( not ( = ?auto_91032 ?auto_91035 ) ) ( not ( = ?auto_91032 ?auto_91036 ) ) ( not ( = ?auto_91033 ?auto_91034 ) ) ( not ( = ?auto_91033 ?auto_91035 ) ) ( not ( = ?auto_91033 ?auto_91036 ) ) ( not ( = ?auto_91034 ?auto_91035 ) ) ( not ( = ?auto_91034 ?auto_91036 ) ) ( not ( = ?auto_91035 ?auto_91036 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91035 ?auto_91036 )
      ( !STACK ?auto_91035 ?auto_91034 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_91065 - BLOCK
      ?auto_91066 - BLOCK
      ?auto_91067 - BLOCK
      ?auto_91068 - BLOCK
      ?auto_91069 - BLOCK
      ?auto_91070 - BLOCK
      ?auto_91071 - BLOCK
      ?auto_91072 - BLOCK
      ?auto_91073 - BLOCK
    )
    :vars
    (
      ?auto_91074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91073 ?auto_91074 ) ( ON-TABLE ?auto_91065 ) ( ON ?auto_91066 ?auto_91065 ) ( ON ?auto_91067 ?auto_91066 ) ( ON ?auto_91068 ?auto_91067 ) ( ON ?auto_91069 ?auto_91068 ) ( ON ?auto_91070 ?auto_91069 ) ( ON ?auto_91071 ?auto_91070 ) ( not ( = ?auto_91065 ?auto_91066 ) ) ( not ( = ?auto_91065 ?auto_91067 ) ) ( not ( = ?auto_91065 ?auto_91068 ) ) ( not ( = ?auto_91065 ?auto_91069 ) ) ( not ( = ?auto_91065 ?auto_91070 ) ) ( not ( = ?auto_91065 ?auto_91071 ) ) ( not ( = ?auto_91065 ?auto_91072 ) ) ( not ( = ?auto_91065 ?auto_91073 ) ) ( not ( = ?auto_91065 ?auto_91074 ) ) ( not ( = ?auto_91066 ?auto_91067 ) ) ( not ( = ?auto_91066 ?auto_91068 ) ) ( not ( = ?auto_91066 ?auto_91069 ) ) ( not ( = ?auto_91066 ?auto_91070 ) ) ( not ( = ?auto_91066 ?auto_91071 ) ) ( not ( = ?auto_91066 ?auto_91072 ) ) ( not ( = ?auto_91066 ?auto_91073 ) ) ( not ( = ?auto_91066 ?auto_91074 ) ) ( not ( = ?auto_91067 ?auto_91068 ) ) ( not ( = ?auto_91067 ?auto_91069 ) ) ( not ( = ?auto_91067 ?auto_91070 ) ) ( not ( = ?auto_91067 ?auto_91071 ) ) ( not ( = ?auto_91067 ?auto_91072 ) ) ( not ( = ?auto_91067 ?auto_91073 ) ) ( not ( = ?auto_91067 ?auto_91074 ) ) ( not ( = ?auto_91068 ?auto_91069 ) ) ( not ( = ?auto_91068 ?auto_91070 ) ) ( not ( = ?auto_91068 ?auto_91071 ) ) ( not ( = ?auto_91068 ?auto_91072 ) ) ( not ( = ?auto_91068 ?auto_91073 ) ) ( not ( = ?auto_91068 ?auto_91074 ) ) ( not ( = ?auto_91069 ?auto_91070 ) ) ( not ( = ?auto_91069 ?auto_91071 ) ) ( not ( = ?auto_91069 ?auto_91072 ) ) ( not ( = ?auto_91069 ?auto_91073 ) ) ( not ( = ?auto_91069 ?auto_91074 ) ) ( not ( = ?auto_91070 ?auto_91071 ) ) ( not ( = ?auto_91070 ?auto_91072 ) ) ( not ( = ?auto_91070 ?auto_91073 ) ) ( not ( = ?auto_91070 ?auto_91074 ) ) ( not ( = ?auto_91071 ?auto_91072 ) ) ( not ( = ?auto_91071 ?auto_91073 ) ) ( not ( = ?auto_91071 ?auto_91074 ) ) ( not ( = ?auto_91072 ?auto_91073 ) ) ( not ( = ?auto_91072 ?auto_91074 ) ) ( not ( = ?auto_91073 ?auto_91074 ) ) ( CLEAR ?auto_91071 ) ( ON ?auto_91072 ?auto_91073 ) ( CLEAR ?auto_91072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_91065 ?auto_91066 ?auto_91067 ?auto_91068 ?auto_91069 ?auto_91070 ?auto_91071 ?auto_91072 )
      ( MAKE-9PILE ?auto_91065 ?auto_91066 ?auto_91067 ?auto_91068 ?auto_91069 ?auto_91070 ?auto_91071 ?auto_91072 ?auto_91073 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_91103 - BLOCK
      ?auto_91104 - BLOCK
      ?auto_91105 - BLOCK
      ?auto_91106 - BLOCK
      ?auto_91107 - BLOCK
      ?auto_91108 - BLOCK
      ?auto_91109 - BLOCK
      ?auto_91110 - BLOCK
      ?auto_91111 - BLOCK
    )
    :vars
    (
      ?auto_91112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91111 ?auto_91112 ) ( ON-TABLE ?auto_91103 ) ( ON ?auto_91104 ?auto_91103 ) ( ON ?auto_91105 ?auto_91104 ) ( ON ?auto_91106 ?auto_91105 ) ( ON ?auto_91107 ?auto_91106 ) ( ON ?auto_91108 ?auto_91107 ) ( not ( = ?auto_91103 ?auto_91104 ) ) ( not ( = ?auto_91103 ?auto_91105 ) ) ( not ( = ?auto_91103 ?auto_91106 ) ) ( not ( = ?auto_91103 ?auto_91107 ) ) ( not ( = ?auto_91103 ?auto_91108 ) ) ( not ( = ?auto_91103 ?auto_91109 ) ) ( not ( = ?auto_91103 ?auto_91110 ) ) ( not ( = ?auto_91103 ?auto_91111 ) ) ( not ( = ?auto_91103 ?auto_91112 ) ) ( not ( = ?auto_91104 ?auto_91105 ) ) ( not ( = ?auto_91104 ?auto_91106 ) ) ( not ( = ?auto_91104 ?auto_91107 ) ) ( not ( = ?auto_91104 ?auto_91108 ) ) ( not ( = ?auto_91104 ?auto_91109 ) ) ( not ( = ?auto_91104 ?auto_91110 ) ) ( not ( = ?auto_91104 ?auto_91111 ) ) ( not ( = ?auto_91104 ?auto_91112 ) ) ( not ( = ?auto_91105 ?auto_91106 ) ) ( not ( = ?auto_91105 ?auto_91107 ) ) ( not ( = ?auto_91105 ?auto_91108 ) ) ( not ( = ?auto_91105 ?auto_91109 ) ) ( not ( = ?auto_91105 ?auto_91110 ) ) ( not ( = ?auto_91105 ?auto_91111 ) ) ( not ( = ?auto_91105 ?auto_91112 ) ) ( not ( = ?auto_91106 ?auto_91107 ) ) ( not ( = ?auto_91106 ?auto_91108 ) ) ( not ( = ?auto_91106 ?auto_91109 ) ) ( not ( = ?auto_91106 ?auto_91110 ) ) ( not ( = ?auto_91106 ?auto_91111 ) ) ( not ( = ?auto_91106 ?auto_91112 ) ) ( not ( = ?auto_91107 ?auto_91108 ) ) ( not ( = ?auto_91107 ?auto_91109 ) ) ( not ( = ?auto_91107 ?auto_91110 ) ) ( not ( = ?auto_91107 ?auto_91111 ) ) ( not ( = ?auto_91107 ?auto_91112 ) ) ( not ( = ?auto_91108 ?auto_91109 ) ) ( not ( = ?auto_91108 ?auto_91110 ) ) ( not ( = ?auto_91108 ?auto_91111 ) ) ( not ( = ?auto_91108 ?auto_91112 ) ) ( not ( = ?auto_91109 ?auto_91110 ) ) ( not ( = ?auto_91109 ?auto_91111 ) ) ( not ( = ?auto_91109 ?auto_91112 ) ) ( not ( = ?auto_91110 ?auto_91111 ) ) ( not ( = ?auto_91110 ?auto_91112 ) ) ( not ( = ?auto_91111 ?auto_91112 ) ) ( ON ?auto_91110 ?auto_91111 ) ( CLEAR ?auto_91108 ) ( ON ?auto_91109 ?auto_91110 ) ( CLEAR ?auto_91109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91103 ?auto_91104 ?auto_91105 ?auto_91106 ?auto_91107 ?auto_91108 ?auto_91109 )
      ( MAKE-9PILE ?auto_91103 ?auto_91104 ?auto_91105 ?auto_91106 ?auto_91107 ?auto_91108 ?auto_91109 ?auto_91110 ?auto_91111 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_91141 - BLOCK
      ?auto_91142 - BLOCK
      ?auto_91143 - BLOCK
      ?auto_91144 - BLOCK
      ?auto_91145 - BLOCK
      ?auto_91146 - BLOCK
      ?auto_91147 - BLOCK
      ?auto_91148 - BLOCK
      ?auto_91149 - BLOCK
    )
    :vars
    (
      ?auto_91150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91149 ?auto_91150 ) ( ON-TABLE ?auto_91141 ) ( ON ?auto_91142 ?auto_91141 ) ( ON ?auto_91143 ?auto_91142 ) ( ON ?auto_91144 ?auto_91143 ) ( ON ?auto_91145 ?auto_91144 ) ( not ( = ?auto_91141 ?auto_91142 ) ) ( not ( = ?auto_91141 ?auto_91143 ) ) ( not ( = ?auto_91141 ?auto_91144 ) ) ( not ( = ?auto_91141 ?auto_91145 ) ) ( not ( = ?auto_91141 ?auto_91146 ) ) ( not ( = ?auto_91141 ?auto_91147 ) ) ( not ( = ?auto_91141 ?auto_91148 ) ) ( not ( = ?auto_91141 ?auto_91149 ) ) ( not ( = ?auto_91141 ?auto_91150 ) ) ( not ( = ?auto_91142 ?auto_91143 ) ) ( not ( = ?auto_91142 ?auto_91144 ) ) ( not ( = ?auto_91142 ?auto_91145 ) ) ( not ( = ?auto_91142 ?auto_91146 ) ) ( not ( = ?auto_91142 ?auto_91147 ) ) ( not ( = ?auto_91142 ?auto_91148 ) ) ( not ( = ?auto_91142 ?auto_91149 ) ) ( not ( = ?auto_91142 ?auto_91150 ) ) ( not ( = ?auto_91143 ?auto_91144 ) ) ( not ( = ?auto_91143 ?auto_91145 ) ) ( not ( = ?auto_91143 ?auto_91146 ) ) ( not ( = ?auto_91143 ?auto_91147 ) ) ( not ( = ?auto_91143 ?auto_91148 ) ) ( not ( = ?auto_91143 ?auto_91149 ) ) ( not ( = ?auto_91143 ?auto_91150 ) ) ( not ( = ?auto_91144 ?auto_91145 ) ) ( not ( = ?auto_91144 ?auto_91146 ) ) ( not ( = ?auto_91144 ?auto_91147 ) ) ( not ( = ?auto_91144 ?auto_91148 ) ) ( not ( = ?auto_91144 ?auto_91149 ) ) ( not ( = ?auto_91144 ?auto_91150 ) ) ( not ( = ?auto_91145 ?auto_91146 ) ) ( not ( = ?auto_91145 ?auto_91147 ) ) ( not ( = ?auto_91145 ?auto_91148 ) ) ( not ( = ?auto_91145 ?auto_91149 ) ) ( not ( = ?auto_91145 ?auto_91150 ) ) ( not ( = ?auto_91146 ?auto_91147 ) ) ( not ( = ?auto_91146 ?auto_91148 ) ) ( not ( = ?auto_91146 ?auto_91149 ) ) ( not ( = ?auto_91146 ?auto_91150 ) ) ( not ( = ?auto_91147 ?auto_91148 ) ) ( not ( = ?auto_91147 ?auto_91149 ) ) ( not ( = ?auto_91147 ?auto_91150 ) ) ( not ( = ?auto_91148 ?auto_91149 ) ) ( not ( = ?auto_91148 ?auto_91150 ) ) ( not ( = ?auto_91149 ?auto_91150 ) ) ( ON ?auto_91148 ?auto_91149 ) ( ON ?auto_91147 ?auto_91148 ) ( CLEAR ?auto_91145 ) ( ON ?auto_91146 ?auto_91147 ) ( CLEAR ?auto_91146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91141 ?auto_91142 ?auto_91143 ?auto_91144 ?auto_91145 ?auto_91146 )
      ( MAKE-9PILE ?auto_91141 ?auto_91142 ?auto_91143 ?auto_91144 ?auto_91145 ?auto_91146 ?auto_91147 ?auto_91148 ?auto_91149 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_91179 - BLOCK
      ?auto_91180 - BLOCK
      ?auto_91181 - BLOCK
      ?auto_91182 - BLOCK
      ?auto_91183 - BLOCK
      ?auto_91184 - BLOCK
      ?auto_91185 - BLOCK
      ?auto_91186 - BLOCK
      ?auto_91187 - BLOCK
    )
    :vars
    (
      ?auto_91188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91187 ?auto_91188 ) ( ON-TABLE ?auto_91179 ) ( ON ?auto_91180 ?auto_91179 ) ( ON ?auto_91181 ?auto_91180 ) ( ON ?auto_91182 ?auto_91181 ) ( not ( = ?auto_91179 ?auto_91180 ) ) ( not ( = ?auto_91179 ?auto_91181 ) ) ( not ( = ?auto_91179 ?auto_91182 ) ) ( not ( = ?auto_91179 ?auto_91183 ) ) ( not ( = ?auto_91179 ?auto_91184 ) ) ( not ( = ?auto_91179 ?auto_91185 ) ) ( not ( = ?auto_91179 ?auto_91186 ) ) ( not ( = ?auto_91179 ?auto_91187 ) ) ( not ( = ?auto_91179 ?auto_91188 ) ) ( not ( = ?auto_91180 ?auto_91181 ) ) ( not ( = ?auto_91180 ?auto_91182 ) ) ( not ( = ?auto_91180 ?auto_91183 ) ) ( not ( = ?auto_91180 ?auto_91184 ) ) ( not ( = ?auto_91180 ?auto_91185 ) ) ( not ( = ?auto_91180 ?auto_91186 ) ) ( not ( = ?auto_91180 ?auto_91187 ) ) ( not ( = ?auto_91180 ?auto_91188 ) ) ( not ( = ?auto_91181 ?auto_91182 ) ) ( not ( = ?auto_91181 ?auto_91183 ) ) ( not ( = ?auto_91181 ?auto_91184 ) ) ( not ( = ?auto_91181 ?auto_91185 ) ) ( not ( = ?auto_91181 ?auto_91186 ) ) ( not ( = ?auto_91181 ?auto_91187 ) ) ( not ( = ?auto_91181 ?auto_91188 ) ) ( not ( = ?auto_91182 ?auto_91183 ) ) ( not ( = ?auto_91182 ?auto_91184 ) ) ( not ( = ?auto_91182 ?auto_91185 ) ) ( not ( = ?auto_91182 ?auto_91186 ) ) ( not ( = ?auto_91182 ?auto_91187 ) ) ( not ( = ?auto_91182 ?auto_91188 ) ) ( not ( = ?auto_91183 ?auto_91184 ) ) ( not ( = ?auto_91183 ?auto_91185 ) ) ( not ( = ?auto_91183 ?auto_91186 ) ) ( not ( = ?auto_91183 ?auto_91187 ) ) ( not ( = ?auto_91183 ?auto_91188 ) ) ( not ( = ?auto_91184 ?auto_91185 ) ) ( not ( = ?auto_91184 ?auto_91186 ) ) ( not ( = ?auto_91184 ?auto_91187 ) ) ( not ( = ?auto_91184 ?auto_91188 ) ) ( not ( = ?auto_91185 ?auto_91186 ) ) ( not ( = ?auto_91185 ?auto_91187 ) ) ( not ( = ?auto_91185 ?auto_91188 ) ) ( not ( = ?auto_91186 ?auto_91187 ) ) ( not ( = ?auto_91186 ?auto_91188 ) ) ( not ( = ?auto_91187 ?auto_91188 ) ) ( ON ?auto_91186 ?auto_91187 ) ( ON ?auto_91185 ?auto_91186 ) ( ON ?auto_91184 ?auto_91185 ) ( CLEAR ?auto_91182 ) ( ON ?auto_91183 ?auto_91184 ) ( CLEAR ?auto_91183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91179 ?auto_91180 ?auto_91181 ?auto_91182 ?auto_91183 )
      ( MAKE-9PILE ?auto_91179 ?auto_91180 ?auto_91181 ?auto_91182 ?auto_91183 ?auto_91184 ?auto_91185 ?auto_91186 ?auto_91187 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_91217 - BLOCK
      ?auto_91218 - BLOCK
      ?auto_91219 - BLOCK
      ?auto_91220 - BLOCK
      ?auto_91221 - BLOCK
      ?auto_91222 - BLOCK
      ?auto_91223 - BLOCK
      ?auto_91224 - BLOCK
      ?auto_91225 - BLOCK
    )
    :vars
    (
      ?auto_91226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91225 ?auto_91226 ) ( ON-TABLE ?auto_91217 ) ( ON ?auto_91218 ?auto_91217 ) ( ON ?auto_91219 ?auto_91218 ) ( not ( = ?auto_91217 ?auto_91218 ) ) ( not ( = ?auto_91217 ?auto_91219 ) ) ( not ( = ?auto_91217 ?auto_91220 ) ) ( not ( = ?auto_91217 ?auto_91221 ) ) ( not ( = ?auto_91217 ?auto_91222 ) ) ( not ( = ?auto_91217 ?auto_91223 ) ) ( not ( = ?auto_91217 ?auto_91224 ) ) ( not ( = ?auto_91217 ?auto_91225 ) ) ( not ( = ?auto_91217 ?auto_91226 ) ) ( not ( = ?auto_91218 ?auto_91219 ) ) ( not ( = ?auto_91218 ?auto_91220 ) ) ( not ( = ?auto_91218 ?auto_91221 ) ) ( not ( = ?auto_91218 ?auto_91222 ) ) ( not ( = ?auto_91218 ?auto_91223 ) ) ( not ( = ?auto_91218 ?auto_91224 ) ) ( not ( = ?auto_91218 ?auto_91225 ) ) ( not ( = ?auto_91218 ?auto_91226 ) ) ( not ( = ?auto_91219 ?auto_91220 ) ) ( not ( = ?auto_91219 ?auto_91221 ) ) ( not ( = ?auto_91219 ?auto_91222 ) ) ( not ( = ?auto_91219 ?auto_91223 ) ) ( not ( = ?auto_91219 ?auto_91224 ) ) ( not ( = ?auto_91219 ?auto_91225 ) ) ( not ( = ?auto_91219 ?auto_91226 ) ) ( not ( = ?auto_91220 ?auto_91221 ) ) ( not ( = ?auto_91220 ?auto_91222 ) ) ( not ( = ?auto_91220 ?auto_91223 ) ) ( not ( = ?auto_91220 ?auto_91224 ) ) ( not ( = ?auto_91220 ?auto_91225 ) ) ( not ( = ?auto_91220 ?auto_91226 ) ) ( not ( = ?auto_91221 ?auto_91222 ) ) ( not ( = ?auto_91221 ?auto_91223 ) ) ( not ( = ?auto_91221 ?auto_91224 ) ) ( not ( = ?auto_91221 ?auto_91225 ) ) ( not ( = ?auto_91221 ?auto_91226 ) ) ( not ( = ?auto_91222 ?auto_91223 ) ) ( not ( = ?auto_91222 ?auto_91224 ) ) ( not ( = ?auto_91222 ?auto_91225 ) ) ( not ( = ?auto_91222 ?auto_91226 ) ) ( not ( = ?auto_91223 ?auto_91224 ) ) ( not ( = ?auto_91223 ?auto_91225 ) ) ( not ( = ?auto_91223 ?auto_91226 ) ) ( not ( = ?auto_91224 ?auto_91225 ) ) ( not ( = ?auto_91224 ?auto_91226 ) ) ( not ( = ?auto_91225 ?auto_91226 ) ) ( ON ?auto_91224 ?auto_91225 ) ( ON ?auto_91223 ?auto_91224 ) ( ON ?auto_91222 ?auto_91223 ) ( ON ?auto_91221 ?auto_91222 ) ( CLEAR ?auto_91219 ) ( ON ?auto_91220 ?auto_91221 ) ( CLEAR ?auto_91220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91217 ?auto_91218 ?auto_91219 ?auto_91220 )
      ( MAKE-9PILE ?auto_91217 ?auto_91218 ?auto_91219 ?auto_91220 ?auto_91221 ?auto_91222 ?auto_91223 ?auto_91224 ?auto_91225 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_91255 - BLOCK
      ?auto_91256 - BLOCK
      ?auto_91257 - BLOCK
      ?auto_91258 - BLOCK
      ?auto_91259 - BLOCK
      ?auto_91260 - BLOCK
      ?auto_91261 - BLOCK
      ?auto_91262 - BLOCK
      ?auto_91263 - BLOCK
    )
    :vars
    (
      ?auto_91264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91263 ?auto_91264 ) ( ON-TABLE ?auto_91255 ) ( ON ?auto_91256 ?auto_91255 ) ( not ( = ?auto_91255 ?auto_91256 ) ) ( not ( = ?auto_91255 ?auto_91257 ) ) ( not ( = ?auto_91255 ?auto_91258 ) ) ( not ( = ?auto_91255 ?auto_91259 ) ) ( not ( = ?auto_91255 ?auto_91260 ) ) ( not ( = ?auto_91255 ?auto_91261 ) ) ( not ( = ?auto_91255 ?auto_91262 ) ) ( not ( = ?auto_91255 ?auto_91263 ) ) ( not ( = ?auto_91255 ?auto_91264 ) ) ( not ( = ?auto_91256 ?auto_91257 ) ) ( not ( = ?auto_91256 ?auto_91258 ) ) ( not ( = ?auto_91256 ?auto_91259 ) ) ( not ( = ?auto_91256 ?auto_91260 ) ) ( not ( = ?auto_91256 ?auto_91261 ) ) ( not ( = ?auto_91256 ?auto_91262 ) ) ( not ( = ?auto_91256 ?auto_91263 ) ) ( not ( = ?auto_91256 ?auto_91264 ) ) ( not ( = ?auto_91257 ?auto_91258 ) ) ( not ( = ?auto_91257 ?auto_91259 ) ) ( not ( = ?auto_91257 ?auto_91260 ) ) ( not ( = ?auto_91257 ?auto_91261 ) ) ( not ( = ?auto_91257 ?auto_91262 ) ) ( not ( = ?auto_91257 ?auto_91263 ) ) ( not ( = ?auto_91257 ?auto_91264 ) ) ( not ( = ?auto_91258 ?auto_91259 ) ) ( not ( = ?auto_91258 ?auto_91260 ) ) ( not ( = ?auto_91258 ?auto_91261 ) ) ( not ( = ?auto_91258 ?auto_91262 ) ) ( not ( = ?auto_91258 ?auto_91263 ) ) ( not ( = ?auto_91258 ?auto_91264 ) ) ( not ( = ?auto_91259 ?auto_91260 ) ) ( not ( = ?auto_91259 ?auto_91261 ) ) ( not ( = ?auto_91259 ?auto_91262 ) ) ( not ( = ?auto_91259 ?auto_91263 ) ) ( not ( = ?auto_91259 ?auto_91264 ) ) ( not ( = ?auto_91260 ?auto_91261 ) ) ( not ( = ?auto_91260 ?auto_91262 ) ) ( not ( = ?auto_91260 ?auto_91263 ) ) ( not ( = ?auto_91260 ?auto_91264 ) ) ( not ( = ?auto_91261 ?auto_91262 ) ) ( not ( = ?auto_91261 ?auto_91263 ) ) ( not ( = ?auto_91261 ?auto_91264 ) ) ( not ( = ?auto_91262 ?auto_91263 ) ) ( not ( = ?auto_91262 ?auto_91264 ) ) ( not ( = ?auto_91263 ?auto_91264 ) ) ( ON ?auto_91262 ?auto_91263 ) ( ON ?auto_91261 ?auto_91262 ) ( ON ?auto_91260 ?auto_91261 ) ( ON ?auto_91259 ?auto_91260 ) ( ON ?auto_91258 ?auto_91259 ) ( CLEAR ?auto_91256 ) ( ON ?auto_91257 ?auto_91258 ) ( CLEAR ?auto_91257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91255 ?auto_91256 ?auto_91257 )
      ( MAKE-9PILE ?auto_91255 ?auto_91256 ?auto_91257 ?auto_91258 ?auto_91259 ?auto_91260 ?auto_91261 ?auto_91262 ?auto_91263 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_91293 - BLOCK
      ?auto_91294 - BLOCK
      ?auto_91295 - BLOCK
      ?auto_91296 - BLOCK
      ?auto_91297 - BLOCK
      ?auto_91298 - BLOCK
      ?auto_91299 - BLOCK
      ?auto_91300 - BLOCK
      ?auto_91301 - BLOCK
    )
    :vars
    (
      ?auto_91302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91301 ?auto_91302 ) ( ON-TABLE ?auto_91293 ) ( not ( = ?auto_91293 ?auto_91294 ) ) ( not ( = ?auto_91293 ?auto_91295 ) ) ( not ( = ?auto_91293 ?auto_91296 ) ) ( not ( = ?auto_91293 ?auto_91297 ) ) ( not ( = ?auto_91293 ?auto_91298 ) ) ( not ( = ?auto_91293 ?auto_91299 ) ) ( not ( = ?auto_91293 ?auto_91300 ) ) ( not ( = ?auto_91293 ?auto_91301 ) ) ( not ( = ?auto_91293 ?auto_91302 ) ) ( not ( = ?auto_91294 ?auto_91295 ) ) ( not ( = ?auto_91294 ?auto_91296 ) ) ( not ( = ?auto_91294 ?auto_91297 ) ) ( not ( = ?auto_91294 ?auto_91298 ) ) ( not ( = ?auto_91294 ?auto_91299 ) ) ( not ( = ?auto_91294 ?auto_91300 ) ) ( not ( = ?auto_91294 ?auto_91301 ) ) ( not ( = ?auto_91294 ?auto_91302 ) ) ( not ( = ?auto_91295 ?auto_91296 ) ) ( not ( = ?auto_91295 ?auto_91297 ) ) ( not ( = ?auto_91295 ?auto_91298 ) ) ( not ( = ?auto_91295 ?auto_91299 ) ) ( not ( = ?auto_91295 ?auto_91300 ) ) ( not ( = ?auto_91295 ?auto_91301 ) ) ( not ( = ?auto_91295 ?auto_91302 ) ) ( not ( = ?auto_91296 ?auto_91297 ) ) ( not ( = ?auto_91296 ?auto_91298 ) ) ( not ( = ?auto_91296 ?auto_91299 ) ) ( not ( = ?auto_91296 ?auto_91300 ) ) ( not ( = ?auto_91296 ?auto_91301 ) ) ( not ( = ?auto_91296 ?auto_91302 ) ) ( not ( = ?auto_91297 ?auto_91298 ) ) ( not ( = ?auto_91297 ?auto_91299 ) ) ( not ( = ?auto_91297 ?auto_91300 ) ) ( not ( = ?auto_91297 ?auto_91301 ) ) ( not ( = ?auto_91297 ?auto_91302 ) ) ( not ( = ?auto_91298 ?auto_91299 ) ) ( not ( = ?auto_91298 ?auto_91300 ) ) ( not ( = ?auto_91298 ?auto_91301 ) ) ( not ( = ?auto_91298 ?auto_91302 ) ) ( not ( = ?auto_91299 ?auto_91300 ) ) ( not ( = ?auto_91299 ?auto_91301 ) ) ( not ( = ?auto_91299 ?auto_91302 ) ) ( not ( = ?auto_91300 ?auto_91301 ) ) ( not ( = ?auto_91300 ?auto_91302 ) ) ( not ( = ?auto_91301 ?auto_91302 ) ) ( ON ?auto_91300 ?auto_91301 ) ( ON ?auto_91299 ?auto_91300 ) ( ON ?auto_91298 ?auto_91299 ) ( ON ?auto_91297 ?auto_91298 ) ( ON ?auto_91296 ?auto_91297 ) ( ON ?auto_91295 ?auto_91296 ) ( CLEAR ?auto_91293 ) ( ON ?auto_91294 ?auto_91295 ) ( CLEAR ?auto_91294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91293 ?auto_91294 )
      ( MAKE-9PILE ?auto_91293 ?auto_91294 ?auto_91295 ?auto_91296 ?auto_91297 ?auto_91298 ?auto_91299 ?auto_91300 ?auto_91301 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_91331 - BLOCK
      ?auto_91332 - BLOCK
      ?auto_91333 - BLOCK
      ?auto_91334 - BLOCK
      ?auto_91335 - BLOCK
      ?auto_91336 - BLOCK
      ?auto_91337 - BLOCK
      ?auto_91338 - BLOCK
      ?auto_91339 - BLOCK
    )
    :vars
    (
      ?auto_91340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91339 ?auto_91340 ) ( not ( = ?auto_91331 ?auto_91332 ) ) ( not ( = ?auto_91331 ?auto_91333 ) ) ( not ( = ?auto_91331 ?auto_91334 ) ) ( not ( = ?auto_91331 ?auto_91335 ) ) ( not ( = ?auto_91331 ?auto_91336 ) ) ( not ( = ?auto_91331 ?auto_91337 ) ) ( not ( = ?auto_91331 ?auto_91338 ) ) ( not ( = ?auto_91331 ?auto_91339 ) ) ( not ( = ?auto_91331 ?auto_91340 ) ) ( not ( = ?auto_91332 ?auto_91333 ) ) ( not ( = ?auto_91332 ?auto_91334 ) ) ( not ( = ?auto_91332 ?auto_91335 ) ) ( not ( = ?auto_91332 ?auto_91336 ) ) ( not ( = ?auto_91332 ?auto_91337 ) ) ( not ( = ?auto_91332 ?auto_91338 ) ) ( not ( = ?auto_91332 ?auto_91339 ) ) ( not ( = ?auto_91332 ?auto_91340 ) ) ( not ( = ?auto_91333 ?auto_91334 ) ) ( not ( = ?auto_91333 ?auto_91335 ) ) ( not ( = ?auto_91333 ?auto_91336 ) ) ( not ( = ?auto_91333 ?auto_91337 ) ) ( not ( = ?auto_91333 ?auto_91338 ) ) ( not ( = ?auto_91333 ?auto_91339 ) ) ( not ( = ?auto_91333 ?auto_91340 ) ) ( not ( = ?auto_91334 ?auto_91335 ) ) ( not ( = ?auto_91334 ?auto_91336 ) ) ( not ( = ?auto_91334 ?auto_91337 ) ) ( not ( = ?auto_91334 ?auto_91338 ) ) ( not ( = ?auto_91334 ?auto_91339 ) ) ( not ( = ?auto_91334 ?auto_91340 ) ) ( not ( = ?auto_91335 ?auto_91336 ) ) ( not ( = ?auto_91335 ?auto_91337 ) ) ( not ( = ?auto_91335 ?auto_91338 ) ) ( not ( = ?auto_91335 ?auto_91339 ) ) ( not ( = ?auto_91335 ?auto_91340 ) ) ( not ( = ?auto_91336 ?auto_91337 ) ) ( not ( = ?auto_91336 ?auto_91338 ) ) ( not ( = ?auto_91336 ?auto_91339 ) ) ( not ( = ?auto_91336 ?auto_91340 ) ) ( not ( = ?auto_91337 ?auto_91338 ) ) ( not ( = ?auto_91337 ?auto_91339 ) ) ( not ( = ?auto_91337 ?auto_91340 ) ) ( not ( = ?auto_91338 ?auto_91339 ) ) ( not ( = ?auto_91338 ?auto_91340 ) ) ( not ( = ?auto_91339 ?auto_91340 ) ) ( ON ?auto_91338 ?auto_91339 ) ( ON ?auto_91337 ?auto_91338 ) ( ON ?auto_91336 ?auto_91337 ) ( ON ?auto_91335 ?auto_91336 ) ( ON ?auto_91334 ?auto_91335 ) ( ON ?auto_91333 ?auto_91334 ) ( ON ?auto_91332 ?auto_91333 ) ( ON ?auto_91331 ?auto_91332 ) ( CLEAR ?auto_91331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91331 )
      ( MAKE-9PILE ?auto_91331 ?auto_91332 ?auto_91333 ?auto_91334 ?auto_91335 ?auto_91336 ?auto_91337 ?auto_91338 ?auto_91339 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_91370 - BLOCK
      ?auto_91371 - BLOCK
      ?auto_91372 - BLOCK
      ?auto_91373 - BLOCK
      ?auto_91374 - BLOCK
      ?auto_91375 - BLOCK
      ?auto_91376 - BLOCK
      ?auto_91377 - BLOCK
      ?auto_91378 - BLOCK
      ?auto_91379 - BLOCK
    )
    :vars
    (
      ?auto_91380 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_91378 ) ( ON ?auto_91379 ?auto_91380 ) ( CLEAR ?auto_91379 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91370 ) ( ON ?auto_91371 ?auto_91370 ) ( ON ?auto_91372 ?auto_91371 ) ( ON ?auto_91373 ?auto_91372 ) ( ON ?auto_91374 ?auto_91373 ) ( ON ?auto_91375 ?auto_91374 ) ( ON ?auto_91376 ?auto_91375 ) ( ON ?auto_91377 ?auto_91376 ) ( ON ?auto_91378 ?auto_91377 ) ( not ( = ?auto_91370 ?auto_91371 ) ) ( not ( = ?auto_91370 ?auto_91372 ) ) ( not ( = ?auto_91370 ?auto_91373 ) ) ( not ( = ?auto_91370 ?auto_91374 ) ) ( not ( = ?auto_91370 ?auto_91375 ) ) ( not ( = ?auto_91370 ?auto_91376 ) ) ( not ( = ?auto_91370 ?auto_91377 ) ) ( not ( = ?auto_91370 ?auto_91378 ) ) ( not ( = ?auto_91370 ?auto_91379 ) ) ( not ( = ?auto_91370 ?auto_91380 ) ) ( not ( = ?auto_91371 ?auto_91372 ) ) ( not ( = ?auto_91371 ?auto_91373 ) ) ( not ( = ?auto_91371 ?auto_91374 ) ) ( not ( = ?auto_91371 ?auto_91375 ) ) ( not ( = ?auto_91371 ?auto_91376 ) ) ( not ( = ?auto_91371 ?auto_91377 ) ) ( not ( = ?auto_91371 ?auto_91378 ) ) ( not ( = ?auto_91371 ?auto_91379 ) ) ( not ( = ?auto_91371 ?auto_91380 ) ) ( not ( = ?auto_91372 ?auto_91373 ) ) ( not ( = ?auto_91372 ?auto_91374 ) ) ( not ( = ?auto_91372 ?auto_91375 ) ) ( not ( = ?auto_91372 ?auto_91376 ) ) ( not ( = ?auto_91372 ?auto_91377 ) ) ( not ( = ?auto_91372 ?auto_91378 ) ) ( not ( = ?auto_91372 ?auto_91379 ) ) ( not ( = ?auto_91372 ?auto_91380 ) ) ( not ( = ?auto_91373 ?auto_91374 ) ) ( not ( = ?auto_91373 ?auto_91375 ) ) ( not ( = ?auto_91373 ?auto_91376 ) ) ( not ( = ?auto_91373 ?auto_91377 ) ) ( not ( = ?auto_91373 ?auto_91378 ) ) ( not ( = ?auto_91373 ?auto_91379 ) ) ( not ( = ?auto_91373 ?auto_91380 ) ) ( not ( = ?auto_91374 ?auto_91375 ) ) ( not ( = ?auto_91374 ?auto_91376 ) ) ( not ( = ?auto_91374 ?auto_91377 ) ) ( not ( = ?auto_91374 ?auto_91378 ) ) ( not ( = ?auto_91374 ?auto_91379 ) ) ( not ( = ?auto_91374 ?auto_91380 ) ) ( not ( = ?auto_91375 ?auto_91376 ) ) ( not ( = ?auto_91375 ?auto_91377 ) ) ( not ( = ?auto_91375 ?auto_91378 ) ) ( not ( = ?auto_91375 ?auto_91379 ) ) ( not ( = ?auto_91375 ?auto_91380 ) ) ( not ( = ?auto_91376 ?auto_91377 ) ) ( not ( = ?auto_91376 ?auto_91378 ) ) ( not ( = ?auto_91376 ?auto_91379 ) ) ( not ( = ?auto_91376 ?auto_91380 ) ) ( not ( = ?auto_91377 ?auto_91378 ) ) ( not ( = ?auto_91377 ?auto_91379 ) ) ( not ( = ?auto_91377 ?auto_91380 ) ) ( not ( = ?auto_91378 ?auto_91379 ) ) ( not ( = ?auto_91378 ?auto_91380 ) ) ( not ( = ?auto_91379 ?auto_91380 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91379 ?auto_91380 )
      ( !STACK ?auto_91379 ?auto_91378 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_91391 - BLOCK
      ?auto_91392 - BLOCK
      ?auto_91393 - BLOCK
      ?auto_91394 - BLOCK
      ?auto_91395 - BLOCK
      ?auto_91396 - BLOCK
      ?auto_91397 - BLOCK
      ?auto_91398 - BLOCK
      ?auto_91399 - BLOCK
      ?auto_91400 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_91399 ) ( ON-TABLE ?auto_91400 ) ( CLEAR ?auto_91400 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91391 ) ( ON ?auto_91392 ?auto_91391 ) ( ON ?auto_91393 ?auto_91392 ) ( ON ?auto_91394 ?auto_91393 ) ( ON ?auto_91395 ?auto_91394 ) ( ON ?auto_91396 ?auto_91395 ) ( ON ?auto_91397 ?auto_91396 ) ( ON ?auto_91398 ?auto_91397 ) ( ON ?auto_91399 ?auto_91398 ) ( not ( = ?auto_91391 ?auto_91392 ) ) ( not ( = ?auto_91391 ?auto_91393 ) ) ( not ( = ?auto_91391 ?auto_91394 ) ) ( not ( = ?auto_91391 ?auto_91395 ) ) ( not ( = ?auto_91391 ?auto_91396 ) ) ( not ( = ?auto_91391 ?auto_91397 ) ) ( not ( = ?auto_91391 ?auto_91398 ) ) ( not ( = ?auto_91391 ?auto_91399 ) ) ( not ( = ?auto_91391 ?auto_91400 ) ) ( not ( = ?auto_91392 ?auto_91393 ) ) ( not ( = ?auto_91392 ?auto_91394 ) ) ( not ( = ?auto_91392 ?auto_91395 ) ) ( not ( = ?auto_91392 ?auto_91396 ) ) ( not ( = ?auto_91392 ?auto_91397 ) ) ( not ( = ?auto_91392 ?auto_91398 ) ) ( not ( = ?auto_91392 ?auto_91399 ) ) ( not ( = ?auto_91392 ?auto_91400 ) ) ( not ( = ?auto_91393 ?auto_91394 ) ) ( not ( = ?auto_91393 ?auto_91395 ) ) ( not ( = ?auto_91393 ?auto_91396 ) ) ( not ( = ?auto_91393 ?auto_91397 ) ) ( not ( = ?auto_91393 ?auto_91398 ) ) ( not ( = ?auto_91393 ?auto_91399 ) ) ( not ( = ?auto_91393 ?auto_91400 ) ) ( not ( = ?auto_91394 ?auto_91395 ) ) ( not ( = ?auto_91394 ?auto_91396 ) ) ( not ( = ?auto_91394 ?auto_91397 ) ) ( not ( = ?auto_91394 ?auto_91398 ) ) ( not ( = ?auto_91394 ?auto_91399 ) ) ( not ( = ?auto_91394 ?auto_91400 ) ) ( not ( = ?auto_91395 ?auto_91396 ) ) ( not ( = ?auto_91395 ?auto_91397 ) ) ( not ( = ?auto_91395 ?auto_91398 ) ) ( not ( = ?auto_91395 ?auto_91399 ) ) ( not ( = ?auto_91395 ?auto_91400 ) ) ( not ( = ?auto_91396 ?auto_91397 ) ) ( not ( = ?auto_91396 ?auto_91398 ) ) ( not ( = ?auto_91396 ?auto_91399 ) ) ( not ( = ?auto_91396 ?auto_91400 ) ) ( not ( = ?auto_91397 ?auto_91398 ) ) ( not ( = ?auto_91397 ?auto_91399 ) ) ( not ( = ?auto_91397 ?auto_91400 ) ) ( not ( = ?auto_91398 ?auto_91399 ) ) ( not ( = ?auto_91398 ?auto_91400 ) ) ( not ( = ?auto_91399 ?auto_91400 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_91400 )
      ( !STACK ?auto_91400 ?auto_91399 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_91411 - BLOCK
      ?auto_91412 - BLOCK
      ?auto_91413 - BLOCK
      ?auto_91414 - BLOCK
      ?auto_91415 - BLOCK
      ?auto_91416 - BLOCK
      ?auto_91417 - BLOCK
      ?auto_91418 - BLOCK
      ?auto_91419 - BLOCK
      ?auto_91420 - BLOCK
    )
    :vars
    (
      ?auto_91421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91420 ?auto_91421 ) ( ON-TABLE ?auto_91411 ) ( ON ?auto_91412 ?auto_91411 ) ( ON ?auto_91413 ?auto_91412 ) ( ON ?auto_91414 ?auto_91413 ) ( ON ?auto_91415 ?auto_91414 ) ( ON ?auto_91416 ?auto_91415 ) ( ON ?auto_91417 ?auto_91416 ) ( ON ?auto_91418 ?auto_91417 ) ( not ( = ?auto_91411 ?auto_91412 ) ) ( not ( = ?auto_91411 ?auto_91413 ) ) ( not ( = ?auto_91411 ?auto_91414 ) ) ( not ( = ?auto_91411 ?auto_91415 ) ) ( not ( = ?auto_91411 ?auto_91416 ) ) ( not ( = ?auto_91411 ?auto_91417 ) ) ( not ( = ?auto_91411 ?auto_91418 ) ) ( not ( = ?auto_91411 ?auto_91419 ) ) ( not ( = ?auto_91411 ?auto_91420 ) ) ( not ( = ?auto_91411 ?auto_91421 ) ) ( not ( = ?auto_91412 ?auto_91413 ) ) ( not ( = ?auto_91412 ?auto_91414 ) ) ( not ( = ?auto_91412 ?auto_91415 ) ) ( not ( = ?auto_91412 ?auto_91416 ) ) ( not ( = ?auto_91412 ?auto_91417 ) ) ( not ( = ?auto_91412 ?auto_91418 ) ) ( not ( = ?auto_91412 ?auto_91419 ) ) ( not ( = ?auto_91412 ?auto_91420 ) ) ( not ( = ?auto_91412 ?auto_91421 ) ) ( not ( = ?auto_91413 ?auto_91414 ) ) ( not ( = ?auto_91413 ?auto_91415 ) ) ( not ( = ?auto_91413 ?auto_91416 ) ) ( not ( = ?auto_91413 ?auto_91417 ) ) ( not ( = ?auto_91413 ?auto_91418 ) ) ( not ( = ?auto_91413 ?auto_91419 ) ) ( not ( = ?auto_91413 ?auto_91420 ) ) ( not ( = ?auto_91413 ?auto_91421 ) ) ( not ( = ?auto_91414 ?auto_91415 ) ) ( not ( = ?auto_91414 ?auto_91416 ) ) ( not ( = ?auto_91414 ?auto_91417 ) ) ( not ( = ?auto_91414 ?auto_91418 ) ) ( not ( = ?auto_91414 ?auto_91419 ) ) ( not ( = ?auto_91414 ?auto_91420 ) ) ( not ( = ?auto_91414 ?auto_91421 ) ) ( not ( = ?auto_91415 ?auto_91416 ) ) ( not ( = ?auto_91415 ?auto_91417 ) ) ( not ( = ?auto_91415 ?auto_91418 ) ) ( not ( = ?auto_91415 ?auto_91419 ) ) ( not ( = ?auto_91415 ?auto_91420 ) ) ( not ( = ?auto_91415 ?auto_91421 ) ) ( not ( = ?auto_91416 ?auto_91417 ) ) ( not ( = ?auto_91416 ?auto_91418 ) ) ( not ( = ?auto_91416 ?auto_91419 ) ) ( not ( = ?auto_91416 ?auto_91420 ) ) ( not ( = ?auto_91416 ?auto_91421 ) ) ( not ( = ?auto_91417 ?auto_91418 ) ) ( not ( = ?auto_91417 ?auto_91419 ) ) ( not ( = ?auto_91417 ?auto_91420 ) ) ( not ( = ?auto_91417 ?auto_91421 ) ) ( not ( = ?auto_91418 ?auto_91419 ) ) ( not ( = ?auto_91418 ?auto_91420 ) ) ( not ( = ?auto_91418 ?auto_91421 ) ) ( not ( = ?auto_91419 ?auto_91420 ) ) ( not ( = ?auto_91419 ?auto_91421 ) ) ( not ( = ?auto_91420 ?auto_91421 ) ) ( CLEAR ?auto_91418 ) ( ON ?auto_91419 ?auto_91420 ) ( CLEAR ?auto_91419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_91411 ?auto_91412 ?auto_91413 ?auto_91414 ?auto_91415 ?auto_91416 ?auto_91417 ?auto_91418 ?auto_91419 )
      ( MAKE-10PILE ?auto_91411 ?auto_91412 ?auto_91413 ?auto_91414 ?auto_91415 ?auto_91416 ?auto_91417 ?auto_91418 ?auto_91419 ?auto_91420 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_91432 - BLOCK
      ?auto_91433 - BLOCK
      ?auto_91434 - BLOCK
      ?auto_91435 - BLOCK
      ?auto_91436 - BLOCK
      ?auto_91437 - BLOCK
      ?auto_91438 - BLOCK
      ?auto_91439 - BLOCK
      ?auto_91440 - BLOCK
      ?auto_91441 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91441 ) ( ON-TABLE ?auto_91432 ) ( ON ?auto_91433 ?auto_91432 ) ( ON ?auto_91434 ?auto_91433 ) ( ON ?auto_91435 ?auto_91434 ) ( ON ?auto_91436 ?auto_91435 ) ( ON ?auto_91437 ?auto_91436 ) ( ON ?auto_91438 ?auto_91437 ) ( ON ?auto_91439 ?auto_91438 ) ( not ( = ?auto_91432 ?auto_91433 ) ) ( not ( = ?auto_91432 ?auto_91434 ) ) ( not ( = ?auto_91432 ?auto_91435 ) ) ( not ( = ?auto_91432 ?auto_91436 ) ) ( not ( = ?auto_91432 ?auto_91437 ) ) ( not ( = ?auto_91432 ?auto_91438 ) ) ( not ( = ?auto_91432 ?auto_91439 ) ) ( not ( = ?auto_91432 ?auto_91440 ) ) ( not ( = ?auto_91432 ?auto_91441 ) ) ( not ( = ?auto_91433 ?auto_91434 ) ) ( not ( = ?auto_91433 ?auto_91435 ) ) ( not ( = ?auto_91433 ?auto_91436 ) ) ( not ( = ?auto_91433 ?auto_91437 ) ) ( not ( = ?auto_91433 ?auto_91438 ) ) ( not ( = ?auto_91433 ?auto_91439 ) ) ( not ( = ?auto_91433 ?auto_91440 ) ) ( not ( = ?auto_91433 ?auto_91441 ) ) ( not ( = ?auto_91434 ?auto_91435 ) ) ( not ( = ?auto_91434 ?auto_91436 ) ) ( not ( = ?auto_91434 ?auto_91437 ) ) ( not ( = ?auto_91434 ?auto_91438 ) ) ( not ( = ?auto_91434 ?auto_91439 ) ) ( not ( = ?auto_91434 ?auto_91440 ) ) ( not ( = ?auto_91434 ?auto_91441 ) ) ( not ( = ?auto_91435 ?auto_91436 ) ) ( not ( = ?auto_91435 ?auto_91437 ) ) ( not ( = ?auto_91435 ?auto_91438 ) ) ( not ( = ?auto_91435 ?auto_91439 ) ) ( not ( = ?auto_91435 ?auto_91440 ) ) ( not ( = ?auto_91435 ?auto_91441 ) ) ( not ( = ?auto_91436 ?auto_91437 ) ) ( not ( = ?auto_91436 ?auto_91438 ) ) ( not ( = ?auto_91436 ?auto_91439 ) ) ( not ( = ?auto_91436 ?auto_91440 ) ) ( not ( = ?auto_91436 ?auto_91441 ) ) ( not ( = ?auto_91437 ?auto_91438 ) ) ( not ( = ?auto_91437 ?auto_91439 ) ) ( not ( = ?auto_91437 ?auto_91440 ) ) ( not ( = ?auto_91437 ?auto_91441 ) ) ( not ( = ?auto_91438 ?auto_91439 ) ) ( not ( = ?auto_91438 ?auto_91440 ) ) ( not ( = ?auto_91438 ?auto_91441 ) ) ( not ( = ?auto_91439 ?auto_91440 ) ) ( not ( = ?auto_91439 ?auto_91441 ) ) ( not ( = ?auto_91440 ?auto_91441 ) ) ( CLEAR ?auto_91439 ) ( ON ?auto_91440 ?auto_91441 ) ( CLEAR ?auto_91440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_91432 ?auto_91433 ?auto_91434 ?auto_91435 ?auto_91436 ?auto_91437 ?auto_91438 ?auto_91439 ?auto_91440 )
      ( MAKE-10PILE ?auto_91432 ?auto_91433 ?auto_91434 ?auto_91435 ?auto_91436 ?auto_91437 ?auto_91438 ?auto_91439 ?auto_91440 ?auto_91441 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_91452 - BLOCK
      ?auto_91453 - BLOCK
      ?auto_91454 - BLOCK
      ?auto_91455 - BLOCK
      ?auto_91456 - BLOCK
      ?auto_91457 - BLOCK
      ?auto_91458 - BLOCK
      ?auto_91459 - BLOCK
      ?auto_91460 - BLOCK
      ?auto_91461 - BLOCK
    )
    :vars
    (
      ?auto_91462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91461 ?auto_91462 ) ( ON-TABLE ?auto_91452 ) ( ON ?auto_91453 ?auto_91452 ) ( ON ?auto_91454 ?auto_91453 ) ( ON ?auto_91455 ?auto_91454 ) ( ON ?auto_91456 ?auto_91455 ) ( ON ?auto_91457 ?auto_91456 ) ( ON ?auto_91458 ?auto_91457 ) ( not ( = ?auto_91452 ?auto_91453 ) ) ( not ( = ?auto_91452 ?auto_91454 ) ) ( not ( = ?auto_91452 ?auto_91455 ) ) ( not ( = ?auto_91452 ?auto_91456 ) ) ( not ( = ?auto_91452 ?auto_91457 ) ) ( not ( = ?auto_91452 ?auto_91458 ) ) ( not ( = ?auto_91452 ?auto_91459 ) ) ( not ( = ?auto_91452 ?auto_91460 ) ) ( not ( = ?auto_91452 ?auto_91461 ) ) ( not ( = ?auto_91452 ?auto_91462 ) ) ( not ( = ?auto_91453 ?auto_91454 ) ) ( not ( = ?auto_91453 ?auto_91455 ) ) ( not ( = ?auto_91453 ?auto_91456 ) ) ( not ( = ?auto_91453 ?auto_91457 ) ) ( not ( = ?auto_91453 ?auto_91458 ) ) ( not ( = ?auto_91453 ?auto_91459 ) ) ( not ( = ?auto_91453 ?auto_91460 ) ) ( not ( = ?auto_91453 ?auto_91461 ) ) ( not ( = ?auto_91453 ?auto_91462 ) ) ( not ( = ?auto_91454 ?auto_91455 ) ) ( not ( = ?auto_91454 ?auto_91456 ) ) ( not ( = ?auto_91454 ?auto_91457 ) ) ( not ( = ?auto_91454 ?auto_91458 ) ) ( not ( = ?auto_91454 ?auto_91459 ) ) ( not ( = ?auto_91454 ?auto_91460 ) ) ( not ( = ?auto_91454 ?auto_91461 ) ) ( not ( = ?auto_91454 ?auto_91462 ) ) ( not ( = ?auto_91455 ?auto_91456 ) ) ( not ( = ?auto_91455 ?auto_91457 ) ) ( not ( = ?auto_91455 ?auto_91458 ) ) ( not ( = ?auto_91455 ?auto_91459 ) ) ( not ( = ?auto_91455 ?auto_91460 ) ) ( not ( = ?auto_91455 ?auto_91461 ) ) ( not ( = ?auto_91455 ?auto_91462 ) ) ( not ( = ?auto_91456 ?auto_91457 ) ) ( not ( = ?auto_91456 ?auto_91458 ) ) ( not ( = ?auto_91456 ?auto_91459 ) ) ( not ( = ?auto_91456 ?auto_91460 ) ) ( not ( = ?auto_91456 ?auto_91461 ) ) ( not ( = ?auto_91456 ?auto_91462 ) ) ( not ( = ?auto_91457 ?auto_91458 ) ) ( not ( = ?auto_91457 ?auto_91459 ) ) ( not ( = ?auto_91457 ?auto_91460 ) ) ( not ( = ?auto_91457 ?auto_91461 ) ) ( not ( = ?auto_91457 ?auto_91462 ) ) ( not ( = ?auto_91458 ?auto_91459 ) ) ( not ( = ?auto_91458 ?auto_91460 ) ) ( not ( = ?auto_91458 ?auto_91461 ) ) ( not ( = ?auto_91458 ?auto_91462 ) ) ( not ( = ?auto_91459 ?auto_91460 ) ) ( not ( = ?auto_91459 ?auto_91461 ) ) ( not ( = ?auto_91459 ?auto_91462 ) ) ( not ( = ?auto_91460 ?auto_91461 ) ) ( not ( = ?auto_91460 ?auto_91462 ) ) ( not ( = ?auto_91461 ?auto_91462 ) ) ( ON ?auto_91460 ?auto_91461 ) ( CLEAR ?auto_91458 ) ( ON ?auto_91459 ?auto_91460 ) ( CLEAR ?auto_91459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_91452 ?auto_91453 ?auto_91454 ?auto_91455 ?auto_91456 ?auto_91457 ?auto_91458 ?auto_91459 )
      ( MAKE-10PILE ?auto_91452 ?auto_91453 ?auto_91454 ?auto_91455 ?auto_91456 ?auto_91457 ?auto_91458 ?auto_91459 ?auto_91460 ?auto_91461 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_91473 - BLOCK
      ?auto_91474 - BLOCK
      ?auto_91475 - BLOCK
      ?auto_91476 - BLOCK
      ?auto_91477 - BLOCK
      ?auto_91478 - BLOCK
      ?auto_91479 - BLOCK
      ?auto_91480 - BLOCK
      ?auto_91481 - BLOCK
      ?auto_91482 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91482 ) ( ON-TABLE ?auto_91473 ) ( ON ?auto_91474 ?auto_91473 ) ( ON ?auto_91475 ?auto_91474 ) ( ON ?auto_91476 ?auto_91475 ) ( ON ?auto_91477 ?auto_91476 ) ( ON ?auto_91478 ?auto_91477 ) ( ON ?auto_91479 ?auto_91478 ) ( not ( = ?auto_91473 ?auto_91474 ) ) ( not ( = ?auto_91473 ?auto_91475 ) ) ( not ( = ?auto_91473 ?auto_91476 ) ) ( not ( = ?auto_91473 ?auto_91477 ) ) ( not ( = ?auto_91473 ?auto_91478 ) ) ( not ( = ?auto_91473 ?auto_91479 ) ) ( not ( = ?auto_91473 ?auto_91480 ) ) ( not ( = ?auto_91473 ?auto_91481 ) ) ( not ( = ?auto_91473 ?auto_91482 ) ) ( not ( = ?auto_91474 ?auto_91475 ) ) ( not ( = ?auto_91474 ?auto_91476 ) ) ( not ( = ?auto_91474 ?auto_91477 ) ) ( not ( = ?auto_91474 ?auto_91478 ) ) ( not ( = ?auto_91474 ?auto_91479 ) ) ( not ( = ?auto_91474 ?auto_91480 ) ) ( not ( = ?auto_91474 ?auto_91481 ) ) ( not ( = ?auto_91474 ?auto_91482 ) ) ( not ( = ?auto_91475 ?auto_91476 ) ) ( not ( = ?auto_91475 ?auto_91477 ) ) ( not ( = ?auto_91475 ?auto_91478 ) ) ( not ( = ?auto_91475 ?auto_91479 ) ) ( not ( = ?auto_91475 ?auto_91480 ) ) ( not ( = ?auto_91475 ?auto_91481 ) ) ( not ( = ?auto_91475 ?auto_91482 ) ) ( not ( = ?auto_91476 ?auto_91477 ) ) ( not ( = ?auto_91476 ?auto_91478 ) ) ( not ( = ?auto_91476 ?auto_91479 ) ) ( not ( = ?auto_91476 ?auto_91480 ) ) ( not ( = ?auto_91476 ?auto_91481 ) ) ( not ( = ?auto_91476 ?auto_91482 ) ) ( not ( = ?auto_91477 ?auto_91478 ) ) ( not ( = ?auto_91477 ?auto_91479 ) ) ( not ( = ?auto_91477 ?auto_91480 ) ) ( not ( = ?auto_91477 ?auto_91481 ) ) ( not ( = ?auto_91477 ?auto_91482 ) ) ( not ( = ?auto_91478 ?auto_91479 ) ) ( not ( = ?auto_91478 ?auto_91480 ) ) ( not ( = ?auto_91478 ?auto_91481 ) ) ( not ( = ?auto_91478 ?auto_91482 ) ) ( not ( = ?auto_91479 ?auto_91480 ) ) ( not ( = ?auto_91479 ?auto_91481 ) ) ( not ( = ?auto_91479 ?auto_91482 ) ) ( not ( = ?auto_91480 ?auto_91481 ) ) ( not ( = ?auto_91480 ?auto_91482 ) ) ( not ( = ?auto_91481 ?auto_91482 ) ) ( ON ?auto_91481 ?auto_91482 ) ( CLEAR ?auto_91479 ) ( ON ?auto_91480 ?auto_91481 ) ( CLEAR ?auto_91480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_91473 ?auto_91474 ?auto_91475 ?auto_91476 ?auto_91477 ?auto_91478 ?auto_91479 ?auto_91480 )
      ( MAKE-10PILE ?auto_91473 ?auto_91474 ?auto_91475 ?auto_91476 ?auto_91477 ?auto_91478 ?auto_91479 ?auto_91480 ?auto_91481 ?auto_91482 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_91493 - BLOCK
      ?auto_91494 - BLOCK
      ?auto_91495 - BLOCK
      ?auto_91496 - BLOCK
      ?auto_91497 - BLOCK
      ?auto_91498 - BLOCK
      ?auto_91499 - BLOCK
      ?auto_91500 - BLOCK
      ?auto_91501 - BLOCK
      ?auto_91502 - BLOCK
    )
    :vars
    (
      ?auto_91503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91502 ?auto_91503 ) ( ON-TABLE ?auto_91493 ) ( ON ?auto_91494 ?auto_91493 ) ( ON ?auto_91495 ?auto_91494 ) ( ON ?auto_91496 ?auto_91495 ) ( ON ?auto_91497 ?auto_91496 ) ( ON ?auto_91498 ?auto_91497 ) ( not ( = ?auto_91493 ?auto_91494 ) ) ( not ( = ?auto_91493 ?auto_91495 ) ) ( not ( = ?auto_91493 ?auto_91496 ) ) ( not ( = ?auto_91493 ?auto_91497 ) ) ( not ( = ?auto_91493 ?auto_91498 ) ) ( not ( = ?auto_91493 ?auto_91499 ) ) ( not ( = ?auto_91493 ?auto_91500 ) ) ( not ( = ?auto_91493 ?auto_91501 ) ) ( not ( = ?auto_91493 ?auto_91502 ) ) ( not ( = ?auto_91493 ?auto_91503 ) ) ( not ( = ?auto_91494 ?auto_91495 ) ) ( not ( = ?auto_91494 ?auto_91496 ) ) ( not ( = ?auto_91494 ?auto_91497 ) ) ( not ( = ?auto_91494 ?auto_91498 ) ) ( not ( = ?auto_91494 ?auto_91499 ) ) ( not ( = ?auto_91494 ?auto_91500 ) ) ( not ( = ?auto_91494 ?auto_91501 ) ) ( not ( = ?auto_91494 ?auto_91502 ) ) ( not ( = ?auto_91494 ?auto_91503 ) ) ( not ( = ?auto_91495 ?auto_91496 ) ) ( not ( = ?auto_91495 ?auto_91497 ) ) ( not ( = ?auto_91495 ?auto_91498 ) ) ( not ( = ?auto_91495 ?auto_91499 ) ) ( not ( = ?auto_91495 ?auto_91500 ) ) ( not ( = ?auto_91495 ?auto_91501 ) ) ( not ( = ?auto_91495 ?auto_91502 ) ) ( not ( = ?auto_91495 ?auto_91503 ) ) ( not ( = ?auto_91496 ?auto_91497 ) ) ( not ( = ?auto_91496 ?auto_91498 ) ) ( not ( = ?auto_91496 ?auto_91499 ) ) ( not ( = ?auto_91496 ?auto_91500 ) ) ( not ( = ?auto_91496 ?auto_91501 ) ) ( not ( = ?auto_91496 ?auto_91502 ) ) ( not ( = ?auto_91496 ?auto_91503 ) ) ( not ( = ?auto_91497 ?auto_91498 ) ) ( not ( = ?auto_91497 ?auto_91499 ) ) ( not ( = ?auto_91497 ?auto_91500 ) ) ( not ( = ?auto_91497 ?auto_91501 ) ) ( not ( = ?auto_91497 ?auto_91502 ) ) ( not ( = ?auto_91497 ?auto_91503 ) ) ( not ( = ?auto_91498 ?auto_91499 ) ) ( not ( = ?auto_91498 ?auto_91500 ) ) ( not ( = ?auto_91498 ?auto_91501 ) ) ( not ( = ?auto_91498 ?auto_91502 ) ) ( not ( = ?auto_91498 ?auto_91503 ) ) ( not ( = ?auto_91499 ?auto_91500 ) ) ( not ( = ?auto_91499 ?auto_91501 ) ) ( not ( = ?auto_91499 ?auto_91502 ) ) ( not ( = ?auto_91499 ?auto_91503 ) ) ( not ( = ?auto_91500 ?auto_91501 ) ) ( not ( = ?auto_91500 ?auto_91502 ) ) ( not ( = ?auto_91500 ?auto_91503 ) ) ( not ( = ?auto_91501 ?auto_91502 ) ) ( not ( = ?auto_91501 ?auto_91503 ) ) ( not ( = ?auto_91502 ?auto_91503 ) ) ( ON ?auto_91501 ?auto_91502 ) ( ON ?auto_91500 ?auto_91501 ) ( CLEAR ?auto_91498 ) ( ON ?auto_91499 ?auto_91500 ) ( CLEAR ?auto_91499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91493 ?auto_91494 ?auto_91495 ?auto_91496 ?auto_91497 ?auto_91498 ?auto_91499 )
      ( MAKE-10PILE ?auto_91493 ?auto_91494 ?auto_91495 ?auto_91496 ?auto_91497 ?auto_91498 ?auto_91499 ?auto_91500 ?auto_91501 ?auto_91502 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_91514 - BLOCK
      ?auto_91515 - BLOCK
      ?auto_91516 - BLOCK
      ?auto_91517 - BLOCK
      ?auto_91518 - BLOCK
      ?auto_91519 - BLOCK
      ?auto_91520 - BLOCK
      ?auto_91521 - BLOCK
      ?auto_91522 - BLOCK
      ?auto_91523 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91523 ) ( ON-TABLE ?auto_91514 ) ( ON ?auto_91515 ?auto_91514 ) ( ON ?auto_91516 ?auto_91515 ) ( ON ?auto_91517 ?auto_91516 ) ( ON ?auto_91518 ?auto_91517 ) ( ON ?auto_91519 ?auto_91518 ) ( not ( = ?auto_91514 ?auto_91515 ) ) ( not ( = ?auto_91514 ?auto_91516 ) ) ( not ( = ?auto_91514 ?auto_91517 ) ) ( not ( = ?auto_91514 ?auto_91518 ) ) ( not ( = ?auto_91514 ?auto_91519 ) ) ( not ( = ?auto_91514 ?auto_91520 ) ) ( not ( = ?auto_91514 ?auto_91521 ) ) ( not ( = ?auto_91514 ?auto_91522 ) ) ( not ( = ?auto_91514 ?auto_91523 ) ) ( not ( = ?auto_91515 ?auto_91516 ) ) ( not ( = ?auto_91515 ?auto_91517 ) ) ( not ( = ?auto_91515 ?auto_91518 ) ) ( not ( = ?auto_91515 ?auto_91519 ) ) ( not ( = ?auto_91515 ?auto_91520 ) ) ( not ( = ?auto_91515 ?auto_91521 ) ) ( not ( = ?auto_91515 ?auto_91522 ) ) ( not ( = ?auto_91515 ?auto_91523 ) ) ( not ( = ?auto_91516 ?auto_91517 ) ) ( not ( = ?auto_91516 ?auto_91518 ) ) ( not ( = ?auto_91516 ?auto_91519 ) ) ( not ( = ?auto_91516 ?auto_91520 ) ) ( not ( = ?auto_91516 ?auto_91521 ) ) ( not ( = ?auto_91516 ?auto_91522 ) ) ( not ( = ?auto_91516 ?auto_91523 ) ) ( not ( = ?auto_91517 ?auto_91518 ) ) ( not ( = ?auto_91517 ?auto_91519 ) ) ( not ( = ?auto_91517 ?auto_91520 ) ) ( not ( = ?auto_91517 ?auto_91521 ) ) ( not ( = ?auto_91517 ?auto_91522 ) ) ( not ( = ?auto_91517 ?auto_91523 ) ) ( not ( = ?auto_91518 ?auto_91519 ) ) ( not ( = ?auto_91518 ?auto_91520 ) ) ( not ( = ?auto_91518 ?auto_91521 ) ) ( not ( = ?auto_91518 ?auto_91522 ) ) ( not ( = ?auto_91518 ?auto_91523 ) ) ( not ( = ?auto_91519 ?auto_91520 ) ) ( not ( = ?auto_91519 ?auto_91521 ) ) ( not ( = ?auto_91519 ?auto_91522 ) ) ( not ( = ?auto_91519 ?auto_91523 ) ) ( not ( = ?auto_91520 ?auto_91521 ) ) ( not ( = ?auto_91520 ?auto_91522 ) ) ( not ( = ?auto_91520 ?auto_91523 ) ) ( not ( = ?auto_91521 ?auto_91522 ) ) ( not ( = ?auto_91521 ?auto_91523 ) ) ( not ( = ?auto_91522 ?auto_91523 ) ) ( ON ?auto_91522 ?auto_91523 ) ( ON ?auto_91521 ?auto_91522 ) ( CLEAR ?auto_91519 ) ( ON ?auto_91520 ?auto_91521 ) ( CLEAR ?auto_91520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91514 ?auto_91515 ?auto_91516 ?auto_91517 ?auto_91518 ?auto_91519 ?auto_91520 )
      ( MAKE-10PILE ?auto_91514 ?auto_91515 ?auto_91516 ?auto_91517 ?auto_91518 ?auto_91519 ?auto_91520 ?auto_91521 ?auto_91522 ?auto_91523 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_91534 - BLOCK
      ?auto_91535 - BLOCK
      ?auto_91536 - BLOCK
      ?auto_91537 - BLOCK
      ?auto_91538 - BLOCK
      ?auto_91539 - BLOCK
      ?auto_91540 - BLOCK
      ?auto_91541 - BLOCK
      ?auto_91542 - BLOCK
      ?auto_91543 - BLOCK
    )
    :vars
    (
      ?auto_91544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91543 ?auto_91544 ) ( ON-TABLE ?auto_91534 ) ( ON ?auto_91535 ?auto_91534 ) ( ON ?auto_91536 ?auto_91535 ) ( ON ?auto_91537 ?auto_91536 ) ( ON ?auto_91538 ?auto_91537 ) ( not ( = ?auto_91534 ?auto_91535 ) ) ( not ( = ?auto_91534 ?auto_91536 ) ) ( not ( = ?auto_91534 ?auto_91537 ) ) ( not ( = ?auto_91534 ?auto_91538 ) ) ( not ( = ?auto_91534 ?auto_91539 ) ) ( not ( = ?auto_91534 ?auto_91540 ) ) ( not ( = ?auto_91534 ?auto_91541 ) ) ( not ( = ?auto_91534 ?auto_91542 ) ) ( not ( = ?auto_91534 ?auto_91543 ) ) ( not ( = ?auto_91534 ?auto_91544 ) ) ( not ( = ?auto_91535 ?auto_91536 ) ) ( not ( = ?auto_91535 ?auto_91537 ) ) ( not ( = ?auto_91535 ?auto_91538 ) ) ( not ( = ?auto_91535 ?auto_91539 ) ) ( not ( = ?auto_91535 ?auto_91540 ) ) ( not ( = ?auto_91535 ?auto_91541 ) ) ( not ( = ?auto_91535 ?auto_91542 ) ) ( not ( = ?auto_91535 ?auto_91543 ) ) ( not ( = ?auto_91535 ?auto_91544 ) ) ( not ( = ?auto_91536 ?auto_91537 ) ) ( not ( = ?auto_91536 ?auto_91538 ) ) ( not ( = ?auto_91536 ?auto_91539 ) ) ( not ( = ?auto_91536 ?auto_91540 ) ) ( not ( = ?auto_91536 ?auto_91541 ) ) ( not ( = ?auto_91536 ?auto_91542 ) ) ( not ( = ?auto_91536 ?auto_91543 ) ) ( not ( = ?auto_91536 ?auto_91544 ) ) ( not ( = ?auto_91537 ?auto_91538 ) ) ( not ( = ?auto_91537 ?auto_91539 ) ) ( not ( = ?auto_91537 ?auto_91540 ) ) ( not ( = ?auto_91537 ?auto_91541 ) ) ( not ( = ?auto_91537 ?auto_91542 ) ) ( not ( = ?auto_91537 ?auto_91543 ) ) ( not ( = ?auto_91537 ?auto_91544 ) ) ( not ( = ?auto_91538 ?auto_91539 ) ) ( not ( = ?auto_91538 ?auto_91540 ) ) ( not ( = ?auto_91538 ?auto_91541 ) ) ( not ( = ?auto_91538 ?auto_91542 ) ) ( not ( = ?auto_91538 ?auto_91543 ) ) ( not ( = ?auto_91538 ?auto_91544 ) ) ( not ( = ?auto_91539 ?auto_91540 ) ) ( not ( = ?auto_91539 ?auto_91541 ) ) ( not ( = ?auto_91539 ?auto_91542 ) ) ( not ( = ?auto_91539 ?auto_91543 ) ) ( not ( = ?auto_91539 ?auto_91544 ) ) ( not ( = ?auto_91540 ?auto_91541 ) ) ( not ( = ?auto_91540 ?auto_91542 ) ) ( not ( = ?auto_91540 ?auto_91543 ) ) ( not ( = ?auto_91540 ?auto_91544 ) ) ( not ( = ?auto_91541 ?auto_91542 ) ) ( not ( = ?auto_91541 ?auto_91543 ) ) ( not ( = ?auto_91541 ?auto_91544 ) ) ( not ( = ?auto_91542 ?auto_91543 ) ) ( not ( = ?auto_91542 ?auto_91544 ) ) ( not ( = ?auto_91543 ?auto_91544 ) ) ( ON ?auto_91542 ?auto_91543 ) ( ON ?auto_91541 ?auto_91542 ) ( ON ?auto_91540 ?auto_91541 ) ( CLEAR ?auto_91538 ) ( ON ?auto_91539 ?auto_91540 ) ( CLEAR ?auto_91539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91534 ?auto_91535 ?auto_91536 ?auto_91537 ?auto_91538 ?auto_91539 )
      ( MAKE-10PILE ?auto_91534 ?auto_91535 ?auto_91536 ?auto_91537 ?auto_91538 ?auto_91539 ?auto_91540 ?auto_91541 ?auto_91542 ?auto_91543 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_91555 - BLOCK
      ?auto_91556 - BLOCK
      ?auto_91557 - BLOCK
      ?auto_91558 - BLOCK
      ?auto_91559 - BLOCK
      ?auto_91560 - BLOCK
      ?auto_91561 - BLOCK
      ?auto_91562 - BLOCK
      ?auto_91563 - BLOCK
      ?auto_91564 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91564 ) ( ON-TABLE ?auto_91555 ) ( ON ?auto_91556 ?auto_91555 ) ( ON ?auto_91557 ?auto_91556 ) ( ON ?auto_91558 ?auto_91557 ) ( ON ?auto_91559 ?auto_91558 ) ( not ( = ?auto_91555 ?auto_91556 ) ) ( not ( = ?auto_91555 ?auto_91557 ) ) ( not ( = ?auto_91555 ?auto_91558 ) ) ( not ( = ?auto_91555 ?auto_91559 ) ) ( not ( = ?auto_91555 ?auto_91560 ) ) ( not ( = ?auto_91555 ?auto_91561 ) ) ( not ( = ?auto_91555 ?auto_91562 ) ) ( not ( = ?auto_91555 ?auto_91563 ) ) ( not ( = ?auto_91555 ?auto_91564 ) ) ( not ( = ?auto_91556 ?auto_91557 ) ) ( not ( = ?auto_91556 ?auto_91558 ) ) ( not ( = ?auto_91556 ?auto_91559 ) ) ( not ( = ?auto_91556 ?auto_91560 ) ) ( not ( = ?auto_91556 ?auto_91561 ) ) ( not ( = ?auto_91556 ?auto_91562 ) ) ( not ( = ?auto_91556 ?auto_91563 ) ) ( not ( = ?auto_91556 ?auto_91564 ) ) ( not ( = ?auto_91557 ?auto_91558 ) ) ( not ( = ?auto_91557 ?auto_91559 ) ) ( not ( = ?auto_91557 ?auto_91560 ) ) ( not ( = ?auto_91557 ?auto_91561 ) ) ( not ( = ?auto_91557 ?auto_91562 ) ) ( not ( = ?auto_91557 ?auto_91563 ) ) ( not ( = ?auto_91557 ?auto_91564 ) ) ( not ( = ?auto_91558 ?auto_91559 ) ) ( not ( = ?auto_91558 ?auto_91560 ) ) ( not ( = ?auto_91558 ?auto_91561 ) ) ( not ( = ?auto_91558 ?auto_91562 ) ) ( not ( = ?auto_91558 ?auto_91563 ) ) ( not ( = ?auto_91558 ?auto_91564 ) ) ( not ( = ?auto_91559 ?auto_91560 ) ) ( not ( = ?auto_91559 ?auto_91561 ) ) ( not ( = ?auto_91559 ?auto_91562 ) ) ( not ( = ?auto_91559 ?auto_91563 ) ) ( not ( = ?auto_91559 ?auto_91564 ) ) ( not ( = ?auto_91560 ?auto_91561 ) ) ( not ( = ?auto_91560 ?auto_91562 ) ) ( not ( = ?auto_91560 ?auto_91563 ) ) ( not ( = ?auto_91560 ?auto_91564 ) ) ( not ( = ?auto_91561 ?auto_91562 ) ) ( not ( = ?auto_91561 ?auto_91563 ) ) ( not ( = ?auto_91561 ?auto_91564 ) ) ( not ( = ?auto_91562 ?auto_91563 ) ) ( not ( = ?auto_91562 ?auto_91564 ) ) ( not ( = ?auto_91563 ?auto_91564 ) ) ( ON ?auto_91563 ?auto_91564 ) ( ON ?auto_91562 ?auto_91563 ) ( ON ?auto_91561 ?auto_91562 ) ( CLEAR ?auto_91559 ) ( ON ?auto_91560 ?auto_91561 ) ( CLEAR ?auto_91560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91555 ?auto_91556 ?auto_91557 ?auto_91558 ?auto_91559 ?auto_91560 )
      ( MAKE-10PILE ?auto_91555 ?auto_91556 ?auto_91557 ?auto_91558 ?auto_91559 ?auto_91560 ?auto_91561 ?auto_91562 ?auto_91563 ?auto_91564 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_91575 - BLOCK
      ?auto_91576 - BLOCK
      ?auto_91577 - BLOCK
      ?auto_91578 - BLOCK
      ?auto_91579 - BLOCK
      ?auto_91580 - BLOCK
      ?auto_91581 - BLOCK
      ?auto_91582 - BLOCK
      ?auto_91583 - BLOCK
      ?auto_91584 - BLOCK
    )
    :vars
    (
      ?auto_91585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91584 ?auto_91585 ) ( ON-TABLE ?auto_91575 ) ( ON ?auto_91576 ?auto_91575 ) ( ON ?auto_91577 ?auto_91576 ) ( ON ?auto_91578 ?auto_91577 ) ( not ( = ?auto_91575 ?auto_91576 ) ) ( not ( = ?auto_91575 ?auto_91577 ) ) ( not ( = ?auto_91575 ?auto_91578 ) ) ( not ( = ?auto_91575 ?auto_91579 ) ) ( not ( = ?auto_91575 ?auto_91580 ) ) ( not ( = ?auto_91575 ?auto_91581 ) ) ( not ( = ?auto_91575 ?auto_91582 ) ) ( not ( = ?auto_91575 ?auto_91583 ) ) ( not ( = ?auto_91575 ?auto_91584 ) ) ( not ( = ?auto_91575 ?auto_91585 ) ) ( not ( = ?auto_91576 ?auto_91577 ) ) ( not ( = ?auto_91576 ?auto_91578 ) ) ( not ( = ?auto_91576 ?auto_91579 ) ) ( not ( = ?auto_91576 ?auto_91580 ) ) ( not ( = ?auto_91576 ?auto_91581 ) ) ( not ( = ?auto_91576 ?auto_91582 ) ) ( not ( = ?auto_91576 ?auto_91583 ) ) ( not ( = ?auto_91576 ?auto_91584 ) ) ( not ( = ?auto_91576 ?auto_91585 ) ) ( not ( = ?auto_91577 ?auto_91578 ) ) ( not ( = ?auto_91577 ?auto_91579 ) ) ( not ( = ?auto_91577 ?auto_91580 ) ) ( not ( = ?auto_91577 ?auto_91581 ) ) ( not ( = ?auto_91577 ?auto_91582 ) ) ( not ( = ?auto_91577 ?auto_91583 ) ) ( not ( = ?auto_91577 ?auto_91584 ) ) ( not ( = ?auto_91577 ?auto_91585 ) ) ( not ( = ?auto_91578 ?auto_91579 ) ) ( not ( = ?auto_91578 ?auto_91580 ) ) ( not ( = ?auto_91578 ?auto_91581 ) ) ( not ( = ?auto_91578 ?auto_91582 ) ) ( not ( = ?auto_91578 ?auto_91583 ) ) ( not ( = ?auto_91578 ?auto_91584 ) ) ( not ( = ?auto_91578 ?auto_91585 ) ) ( not ( = ?auto_91579 ?auto_91580 ) ) ( not ( = ?auto_91579 ?auto_91581 ) ) ( not ( = ?auto_91579 ?auto_91582 ) ) ( not ( = ?auto_91579 ?auto_91583 ) ) ( not ( = ?auto_91579 ?auto_91584 ) ) ( not ( = ?auto_91579 ?auto_91585 ) ) ( not ( = ?auto_91580 ?auto_91581 ) ) ( not ( = ?auto_91580 ?auto_91582 ) ) ( not ( = ?auto_91580 ?auto_91583 ) ) ( not ( = ?auto_91580 ?auto_91584 ) ) ( not ( = ?auto_91580 ?auto_91585 ) ) ( not ( = ?auto_91581 ?auto_91582 ) ) ( not ( = ?auto_91581 ?auto_91583 ) ) ( not ( = ?auto_91581 ?auto_91584 ) ) ( not ( = ?auto_91581 ?auto_91585 ) ) ( not ( = ?auto_91582 ?auto_91583 ) ) ( not ( = ?auto_91582 ?auto_91584 ) ) ( not ( = ?auto_91582 ?auto_91585 ) ) ( not ( = ?auto_91583 ?auto_91584 ) ) ( not ( = ?auto_91583 ?auto_91585 ) ) ( not ( = ?auto_91584 ?auto_91585 ) ) ( ON ?auto_91583 ?auto_91584 ) ( ON ?auto_91582 ?auto_91583 ) ( ON ?auto_91581 ?auto_91582 ) ( ON ?auto_91580 ?auto_91581 ) ( CLEAR ?auto_91578 ) ( ON ?auto_91579 ?auto_91580 ) ( CLEAR ?auto_91579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91575 ?auto_91576 ?auto_91577 ?auto_91578 ?auto_91579 )
      ( MAKE-10PILE ?auto_91575 ?auto_91576 ?auto_91577 ?auto_91578 ?auto_91579 ?auto_91580 ?auto_91581 ?auto_91582 ?auto_91583 ?auto_91584 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_91596 - BLOCK
      ?auto_91597 - BLOCK
      ?auto_91598 - BLOCK
      ?auto_91599 - BLOCK
      ?auto_91600 - BLOCK
      ?auto_91601 - BLOCK
      ?auto_91602 - BLOCK
      ?auto_91603 - BLOCK
      ?auto_91604 - BLOCK
      ?auto_91605 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91605 ) ( ON-TABLE ?auto_91596 ) ( ON ?auto_91597 ?auto_91596 ) ( ON ?auto_91598 ?auto_91597 ) ( ON ?auto_91599 ?auto_91598 ) ( not ( = ?auto_91596 ?auto_91597 ) ) ( not ( = ?auto_91596 ?auto_91598 ) ) ( not ( = ?auto_91596 ?auto_91599 ) ) ( not ( = ?auto_91596 ?auto_91600 ) ) ( not ( = ?auto_91596 ?auto_91601 ) ) ( not ( = ?auto_91596 ?auto_91602 ) ) ( not ( = ?auto_91596 ?auto_91603 ) ) ( not ( = ?auto_91596 ?auto_91604 ) ) ( not ( = ?auto_91596 ?auto_91605 ) ) ( not ( = ?auto_91597 ?auto_91598 ) ) ( not ( = ?auto_91597 ?auto_91599 ) ) ( not ( = ?auto_91597 ?auto_91600 ) ) ( not ( = ?auto_91597 ?auto_91601 ) ) ( not ( = ?auto_91597 ?auto_91602 ) ) ( not ( = ?auto_91597 ?auto_91603 ) ) ( not ( = ?auto_91597 ?auto_91604 ) ) ( not ( = ?auto_91597 ?auto_91605 ) ) ( not ( = ?auto_91598 ?auto_91599 ) ) ( not ( = ?auto_91598 ?auto_91600 ) ) ( not ( = ?auto_91598 ?auto_91601 ) ) ( not ( = ?auto_91598 ?auto_91602 ) ) ( not ( = ?auto_91598 ?auto_91603 ) ) ( not ( = ?auto_91598 ?auto_91604 ) ) ( not ( = ?auto_91598 ?auto_91605 ) ) ( not ( = ?auto_91599 ?auto_91600 ) ) ( not ( = ?auto_91599 ?auto_91601 ) ) ( not ( = ?auto_91599 ?auto_91602 ) ) ( not ( = ?auto_91599 ?auto_91603 ) ) ( not ( = ?auto_91599 ?auto_91604 ) ) ( not ( = ?auto_91599 ?auto_91605 ) ) ( not ( = ?auto_91600 ?auto_91601 ) ) ( not ( = ?auto_91600 ?auto_91602 ) ) ( not ( = ?auto_91600 ?auto_91603 ) ) ( not ( = ?auto_91600 ?auto_91604 ) ) ( not ( = ?auto_91600 ?auto_91605 ) ) ( not ( = ?auto_91601 ?auto_91602 ) ) ( not ( = ?auto_91601 ?auto_91603 ) ) ( not ( = ?auto_91601 ?auto_91604 ) ) ( not ( = ?auto_91601 ?auto_91605 ) ) ( not ( = ?auto_91602 ?auto_91603 ) ) ( not ( = ?auto_91602 ?auto_91604 ) ) ( not ( = ?auto_91602 ?auto_91605 ) ) ( not ( = ?auto_91603 ?auto_91604 ) ) ( not ( = ?auto_91603 ?auto_91605 ) ) ( not ( = ?auto_91604 ?auto_91605 ) ) ( ON ?auto_91604 ?auto_91605 ) ( ON ?auto_91603 ?auto_91604 ) ( ON ?auto_91602 ?auto_91603 ) ( ON ?auto_91601 ?auto_91602 ) ( CLEAR ?auto_91599 ) ( ON ?auto_91600 ?auto_91601 ) ( CLEAR ?auto_91600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91596 ?auto_91597 ?auto_91598 ?auto_91599 ?auto_91600 )
      ( MAKE-10PILE ?auto_91596 ?auto_91597 ?auto_91598 ?auto_91599 ?auto_91600 ?auto_91601 ?auto_91602 ?auto_91603 ?auto_91604 ?auto_91605 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_91616 - BLOCK
      ?auto_91617 - BLOCK
      ?auto_91618 - BLOCK
      ?auto_91619 - BLOCK
      ?auto_91620 - BLOCK
      ?auto_91621 - BLOCK
      ?auto_91622 - BLOCK
      ?auto_91623 - BLOCK
      ?auto_91624 - BLOCK
      ?auto_91625 - BLOCK
    )
    :vars
    (
      ?auto_91626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91625 ?auto_91626 ) ( ON-TABLE ?auto_91616 ) ( ON ?auto_91617 ?auto_91616 ) ( ON ?auto_91618 ?auto_91617 ) ( not ( = ?auto_91616 ?auto_91617 ) ) ( not ( = ?auto_91616 ?auto_91618 ) ) ( not ( = ?auto_91616 ?auto_91619 ) ) ( not ( = ?auto_91616 ?auto_91620 ) ) ( not ( = ?auto_91616 ?auto_91621 ) ) ( not ( = ?auto_91616 ?auto_91622 ) ) ( not ( = ?auto_91616 ?auto_91623 ) ) ( not ( = ?auto_91616 ?auto_91624 ) ) ( not ( = ?auto_91616 ?auto_91625 ) ) ( not ( = ?auto_91616 ?auto_91626 ) ) ( not ( = ?auto_91617 ?auto_91618 ) ) ( not ( = ?auto_91617 ?auto_91619 ) ) ( not ( = ?auto_91617 ?auto_91620 ) ) ( not ( = ?auto_91617 ?auto_91621 ) ) ( not ( = ?auto_91617 ?auto_91622 ) ) ( not ( = ?auto_91617 ?auto_91623 ) ) ( not ( = ?auto_91617 ?auto_91624 ) ) ( not ( = ?auto_91617 ?auto_91625 ) ) ( not ( = ?auto_91617 ?auto_91626 ) ) ( not ( = ?auto_91618 ?auto_91619 ) ) ( not ( = ?auto_91618 ?auto_91620 ) ) ( not ( = ?auto_91618 ?auto_91621 ) ) ( not ( = ?auto_91618 ?auto_91622 ) ) ( not ( = ?auto_91618 ?auto_91623 ) ) ( not ( = ?auto_91618 ?auto_91624 ) ) ( not ( = ?auto_91618 ?auto_91625 ) ) ( not ( = ?auto_91618 ?auto_91626 ) ) ( not ( = ?auto_91619 ?auto_91620 ) ) ( not ( = ?auto_91619 ?auto_91621 ) ) ( not ( = ?auto_91619 ?auto_91622 ) ) ( not ( = ?auto_91619 ?auto_91623 ) ) ( not ( = ?auto_91619 ?auto_91624 ) ) ( not ( = ?auto_91619 ?auto_91625 ) ) ( not ( = ?auto_91619 ?auto_91626 ) ) ( not ( = ?auto_91620 ?auto_91621 ) ) ( not ( = ?auto_91620 ?auto_91622 ) ) ( not ( = ?auto_91620 ?auto_91623 ) ) ( not ( = ?auto_91620 ?auto_91624 ) ) ( not ( = ?auto_91620 ?auto_91625 ) ) ( not ( = ?auto_91620 ?auto_91626 ) ) ( not ( = ?auto_91621 ?auto_91622 ) ) ( not ( = ?auto_91621 ?auto_91623 ) ) ( not ( = ?auto_91621 ?auto_91624 ) ) ( not ( = ?auto_91621 ?auto_91625 ) ) ( not ( = ?auto_91621 ?auto_91626 ) ) ( not ( = ?auto_91622 ?auto_91623 ) ) ( not ( = ?auto_91622 ?auto_91624 ) ) ( not ( = ?auto_91622 ?auto_91625 ) ) ( not ( = ?auto_91622 ?auto_91626 ) ) ( not ( = ?auto_91623 ?auto_91624 ) ) ( not ( = ?auto_91623 ?auto_91625 ) ) ( not ( = ?auto_91623 ?auto_91626 ) ) ( not ( = ?auto_91624 ?auto_91625 ) ) ( not ( = ?auto_91624 ?auto_91626 ) ) ( not ( = ?auto_91625 ?auto_91626 ) ) ( ON ?auto_91624 ?auto_91625 ) ( ON ?auto_91623 ?auto_91624 ) ( ON ?auto_91622 ?auto_91623 ) ( ON ?auto_91621 ?auto_91622 ) ( ON ?auto_91620 ?auto_91621 ) ( CLEAR ?auto_91618 ) ( ON ?auto_91619 ?auto_91620 ) ( CLEAR ?auto_91619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91616 ?auto_91617 ?auto_91618 ?auto_91619 )
      ( MAKE-10PILE ?auto_91616 ?auto_91617 ?auto_91618 ?auto_91619 ?auto_91620 ?auto_91621 ?auto_91622 ?auto_91623 ?auto_91624 ?auto_91625 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_91637 - BLOCK
      ?auto_91638 - BLOCK
      ?auto_91639 - BLOCK
      ?auto_91640 - BLOCK
      ?auto_91641 - BLOCK
      ?auto_91642 - BLOCK
      ?auto_91643 - BLOCK
      ?auto_91644 - BLOCK
      ?auto_91645 - BLOCK
      ?auto_91646 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91646 ) ( ON-TABLE ?auto_91637 ) ( ON ?auto_91638 ?auto_91637 ) ( ON ?auto_91639 ?auto_91638 ) ( not ( = ?auto_91637 ?auto_91638 ) ) ( not ( = ?auto_91637 ?auto_91639 ) ) ( not ( = ?auto_91637 ?auto_91640 ) ) ( not ( = ?auto_91637 ?auto_91641 ) ) ( not ( = ?auto_91637 ?auto_91642 ) ) ( not ( = ?auto_91637 ?auto_91643 ) ) ( not ( = ?auto_91637 ?auto_91644 ) ) ( not ( = ?auto_91637 ?auto_91645 ) ) ( not ( = ?auto_91637 ?auto_91646 ) ) ( not ( = ?auto_91638 ?auto_91639 ) ) ( not ( = ?auto_91638 ?auto_91640 ) ) ( not ( = ?auto_91638 ?auto_91641 ) ) ( not ( = ?auto_91638 ?auto_91642 ) ) ( not ( = ?auto_91638 ?auto_91643 ) ) ( not ( = ?auto_91638 ?auto_91644 ) ) ( not ( = ?auto_91638 ?auto_91645 ) ) ( not ( = ?auto_91638 ?auto_91646 ) ) ( not ( = ?auto_91639 ?auto_91640 ) ) ( not ( = ?auto_91639 ?auto_91641 ) ) ( not ( = ?auto_91639 ?auto_91642 ) ) ( not ( = ?auto_91639 ?auto_91643 ) ) ( not ( = ?auto_91639 ?auto_91644 ) ) ( not ( = ?auto_91639 ?auto_91645 ) ) ( not ( = ?auto_91639 ?auto_91646 ) ) ( not ( = ?auto_91640 ?auto_91641 ) ) ( not ( = ?auto_91640 ?auto_91642 ) ) ( not ( = ?auto_91640 ?auto_91643 ) ) ( not ( = ?auto_91640 ?auto_91644 ) ) ( not ( = ?auto_91640 ?auto_91645 ) ) ( not ( = ?auto_91640 ?auto_91646 ) ) ( not ( = ?auto_91641 ?auto_91642 ) ) ( not ( = ?auto_91641 ?auto_91643 ) ) ( not ( = ?auto_91641 ?auto_91644 ) ) ( not ( = ?auto_91641 ?auto_91645 ) ) ( not ( = ?auto_91641 ?auto_91646 ) ) ( not ( = ?auto_91642 ?auto_91643 ) ) ( not ( = ?auto_91642 ?auto_91644 ) ) ( not ( = ?auto_91642 ?auto_91645 ) ) ( not ( = ?auto_91642 ?auto_91646 ) ) ( not ( = ?auto_91643 ?auto_91644 ) ) ( not ( = ?auto_91643 ?auto_91645 ) ) ( not ( = ?auto_91643 ?auto_91646 ) ) ( not ( = ?auto_91644 ?auto_91645 ) ) ( not ( = ?auto_91644 ?auto_91646 ) ) ( not ( = ?auto_91645 ?auto_91646 ) ) ( ON ?auto_91645 ?auto_91646 ) ( ON ?auto_91644 ?auto_91645 ) ( ON ?auto_91643 ?auto_91644 ) ( ON ?auto_91642 ?auto_91643 ) ( ON ?auto_91641 ?auto_91642 ) ( CLEAR ?auto_91639 ) ( ON ?auto_91640 ?auto_91641 ) ( CLEAR ?auto_91640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91637 ?auto_91638 ?auto_91639 ?auto_91640 )
      ( MAKE-10PILE ?auto_91637 ?auto_91638 ?auto_91639 ?auto_91640 ?auto_91641 ?auto_91642 ?auto_91643 ?auto_91644 ?auto_91645 ?auto_91646 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_91657 - BLOCK
      ?auto_91658 - BLOCK
      ?auto_91659 - BLOCK
      ?auto_91660 - BLOCK
      ?auto_91661 - BLOCK
      ?auto_91662 - BLOCK
      ?auto_91663 - BLOCK
      ?auto_91664 - BLOCK
      ?auto_91665 - BLOCK
      ?auto_91666 - BLOCK
    )
    :vars
    (
      ?auto_91667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91666 ?auto_91667 ) ( ON-TABLE ?auto_91657 ) ( ON ?auto_91658 ?auto_91657 ) ( not ( = ?auto_91657 ?auto_91658 ) ) ( not ( = ?auto_91657 ?auto_91659 ) ) ( not ( = ?auto_91657 ?auto_91660 ) ) ( not ( = ?auto_91657 ?auto_91661 ) ) ( not ( = ?auto_91657 ?auto_91662 ) ) ( not ( = ?auto_91657 ?auto_91663 ) ) ( not ( = ?auto_91657 ?auto_91664 ) ) ( not ( = ?auto_91657 ?auto_91665 ) ) ( not ( = ?auto_91657 ?auto_91666 ) ) ( not ( = ?auto_91657 ?auto_91667 ) ) ( not ( = ?auto_91658 ?auto_91659 ) ) ( not ( = ?auto_91658 ?auto_91660 ) ) ( not ( = ?auto_91658 ?auto_91661 ) ) ( not ( = ?auto_91658 ?auto_91662 ) ) ( not ( = ?auto_91658 ?auto_91663 ) ) ( not ( = ?auto_91658 ?auto_91664 ) ) ( not ( = ?auto_91658 ?auto_91665 ) ) ( not ( = ?auto_91658 ?auto_91666 ) ) ( not ( = ?auto_91658 ?auto_91667 ) ) ( not ( = ?auto_91659 ?auto_91660 ) ) ( not ( = ?auto_91659 ?auto_91661 ) ) ( not ( = ?auto_91659 ?auto_91662 ) ) ( not ( = ?auto_91659 ?auto_91663 ) ) ( not ( = ?auto_91659 ?auto_91664 ) ) ( not ( = ?auto_91659 ?auto_91665 ) ) ( not ( = ?auto_91659 ?auto_91666 ) ) ( not ( = ?auto_91659 ?auto_91667 ) ) ( not ( = ?auto_91660 ?auto_91661 ) ) ( not ( = ?auto_91660 ?auto_91662 ) ) ( not ( = ?auto_91660 ?auto_91663 ) ) ( not ( = ?auto_91660 ?auto_91664 ) ) ( not ( = ?auto_91660 ?auto_91665 ) ) ( not ( = ?auto_91660 ?auto_91666 ) ) ( not ( = ?auto_91660 ?auto_91667 ) ) ( not ( = ?auto_91661 ?auto_91662 ) ) ( not ( = ?auto_91661 ?auto_91663 ) ) ( not ( = ?auto_91661 ?auto_91664 ) ) ( not ( = ?auto_91661 ?auto_91665 ) ) ( not ( = ?auto_91661 ?auto_91666 ) ) ( not ( = ?auto_91661 ?auto_91667 ) ) ( not ( = ?auto_91662 ?auto_91663 ) ) ( not ( = ?auto_91662 ?auto_91664 ) ) ( not ( = ?auto_91662 ?auto_91665 ) ) ( not ( = ?auto_91662 ?auto_91666 ) ) ( not ( = ?auto_91662 ?auto_91667 ) ) ( not ( = ?auto_91663 ?auto_91664 ) ) ( not ( = ?auto_91663 ?auto_91665 ) ) ( not ( = ?auto_91663 ?auto_91666 ) ) ( not ( = ?auto_91663 ?auto_91667 ) ) ( not ( = ?auto_91664 ?auto_91665 ) ) ( not ( = ?auto_91664 ?auto_91666 ) ) ( not ( = ?auto_91664 ?auto_91667 ) ) ( not ( = ?auto_91665 ?auto_91666 ) ) ( not ( = ?auto_91665 ?auto_91667 ) ) ( not ( = ?auto_91666 ?auto_91667 ) ) ( ON ?auto_91665 ?auto_91666 ) ( ON ?auto_91664 ?auto_91665 ) ( ON ?auto_91663 ?auto_91664 ) ( ON ?auto_91662 ?auto_91663 ) ( ON ?auto_91661 ?auto_91662 ) ( ON ?auto_91660 ?auto_91661 ) ( CLEAR ?auto_91658 ) ( ON ?auto_91659 ?auto_91660 ) ( CLEAR ?auto_91659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91657 ?auto_91658 ?auto_91659 )
      ( MAKE-10PILE ?auto_91657 ?auto_91658 ?auto_91659 ?auto_91660 ?auto_91661 ?auto_91662 ?auto_91663 ?auto_91664 ?auto_91665 ?auto_91666 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_91678 - BLOCK
      ?auto_91679 - BLOCK
      ?auto_91680 - BLOCK
      ?auto_91681 - BLOCK
      ?auto_91682 - BLOCK
      ?auto_91683 - BLOCK
      ?auto_91684 - BLOCK
      ?auto_91685 - BLOCK
      ?auto_91686 - BLOCK
      ?auto_91687 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91687 ) ( ON-TABLE ?auto_91678 ) ( ON ?auto_91679 ?auto_91678 ) ( not ( = ?auto_91678 ?auto_91679 ) ) ( not ( = ?auto_91678 ?auto_91680 ) ) ( not ( = ?auto_91678 ?auto_91681 ) ) ( not ( = ?auto_91678 ?auto_91682 ) ) ( not ( = ?auto_91678 ?auto_91683 ) ) ( not ( = ?auto_91678 ?auto_91684 ) ) ( not ( = ?auto_91678 ?auto_91685 ) ) ( not ( = ?auto_91678 ?auto_91686 ) ) ( not ( = ?auto_91678 ?auto_91687 ) ) ( not ( = ?auto_91679 ?auto_91680 ) ) ( not ( = ?auto_91679 ?auto_91681 ) ) ( not ( = ?auto_91679 ?auto_91682 ) ) ( not ( = ?auto_91679 ?auto_91683 ) ) ( not ( = ?auto_91679 ?auto_91684 ) ) ( not ( = ?auto_91679 ?auto_91685 ) ) ( not ( = ?auto_91679 ?auto_91686 ) ) ( not ( = ?auto_91679 ?auto_91687 ) ) ( not ( = ?auto_91680 ?auto_91681 ) ) ( not ( = ?auto_91680 ?auto_91682 ) ) ( not ( = ?auto_91680 ?auto_91683 ) ) ( not ( = ?auto_91680 ?auto_91684 ) ) ( not ( = ?auto_91680 ?auto_91685 ) ) ( not ( = ?auto_91680 ?auto_91686 ) ) ( not ( = ?auto_91680 ?auto_91687 ) ) ( not ( = ?auto_91681 ?auto_91682 ) ) ( not ( = ?auto_91681 ?auto_91683 ) ) ( not ( = ?auto_91681 ?auto_91684 ) ) ( not ( = ?auto_91681 ?auto_91685 ) ) ( not ( = ?auto_91681 ?auto_91686 ) ) ( not ( = ?auto_91681 ?auto_91687 ) ) ( not ( = ?auto_91682 ?auto_91683 ) ) ( not ( = ?auto_91682 ?auto_91684 ) ) ( not ( = ?auto_91682 ?auto_91685 ) ) ( not ( = ?auto_91682 ?auto_91686 ) ) ( not ( = ?auto_91682 ?auto_91687 ) ) ( not ( = ?auto_91683 ?auto_91684 ) ) ( not ( = ?auto_91683 ?auto_91685 ) ) ( not ( = ?auto_91683 ?auto_91686 ) ) ( not ( = ?auto_91683 ?auto_91687 ) ) ( not ( = ?auto_91684 ?auto_91685 ) ) ( not ( = ?auto_91684 ?auto_91686 ) ) ( not ( = ?auto_91684 ?auto_91687 ) ) ( not ( = ?auto_91685 ?auto_91686 ) ) ( not ( = ?auto_91685 ?auto_91687 ) ) ( not ( = ?auto_91686 ?auto_91687 ) ) ( ON ?auto_91686 ?auto_91687 ) ( ON ?auto_91685 ?auto_91686 ) ( ON ?auto_91684 ?auto_91685 ) ( ON ?auto_91683 ?auto_91684 ) ( ON ?auto_91682 ?auto_91683 ) ( ON ?auto_91681 ?auto_91682 ) ( CLEAR ?auto_91679 ) ( ON ?auto_91680 ?auto_91681 ) ( CLEAR ?auto_91680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91678 ?auto_91679 ?auto_91680 )
      ( MAKE-10PILE ?auto_91678 ?auto_91679 ?auto_91680 ?auto_91681 ?auto_91682 ?auto_91683 ?auto_91684 ?auto_91685 ?auto_91686 ?auto_91687 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_91698 - BLOCK
      ?auto_91699 - BLOCK
      ?auto_91700 - BLOCK
      ?auto_91701 - BLOCK
      ?auto_91702 - BLOCK
      ?auto_91703 - BLOCK
      ?auto_91704 - BLOCK
      ?auto_91705 - BLOCK
      ?auto_91706 - BLOCK
      ?auto_91707 - BLOCK
    )
    :vars
    (
      ?auto_91708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91707 ?auto_91708 ) ( ON-TABLE ?auto_91698 ) ( not ( = ?auto_91698 ?auto_91699 ) ) ( not ( = ?auto_91698 ?auto_91700 ) ) ( not ( = ?auto_91698 ?auto_91701 ) ) ( not ( = ?auto_91698 ?auto_91702 ) ) ( not ( = ?auto_91698 ?auto_91703 ) ) ( not ( = ?auto_91698 ?auto_91704 ) ) ( not ( = ?auto_91698 ?auto_91705 ) ) ( not ( = ?auto_91698 ?auto_91706 ) ) ( not ( = ?auto_91698 ?auto_91707 ) ) ( not ( = ?auto_91698 ?auto_91708 ) ) ( not ( = ?auto_91699 ?auto_91700 ) ) ( not ( = ?auto_91699 ?auto_91701 ) ) ( not ( = ?auto_91699 ?auto_91702 ) ) ( not ( = ?auto_91699 ?auto_91703 ) ) ( not ( = ?auto_91699 ?auto_91704 ) ) ( not ( = ?auto_91699 ?auto_91705 ) ) ( not ( = ?auto_91699 ?auto_91706 ) ) ( not ( = ?auto_91699 ?auto_91707 ) ) ( not ( = ?auto_91699 ?auto_91708 ) ) ( not ( = ?auto_91700 ?auto_91701 ) ) ( not ( = ?auto_91700 ?auto_91702 ) ) ( not ( = ?auto_91700 ?auto_91703 ) ) ( not ( = ?auto_91700 ?auto_91704 ) ) ( not ( = ?auto_91700 ?auto_91705 ) ) ( not ( = ?auto_91700 ?auto_91706 ) ) ( not ( = ?auto_91700 ?auto_91707 ) ) ( not ( = ?auto_91700 ?auto_91708 ) ) ( not ( = ?auto_91701 ?auto_91702 ) ) ( not ( = ?auto_91701 ?auto_91703 ) ) ( not ( = ?auto_91701 ?auto_91704 ) ) ( not ( = ?auto_91701 ?auto_91705 ) ) ( not ( = ?auto_91701 ?auto_91706 ) ) ( not ( = ?auto_91701 ?auto_91707 ) ) ( not ( = ?auto_91701 ?auto_91708 ) ) ( not ( = ?auto_91702 ?auto_91703 ) ) ( not ( = ?auto_91702 ?auto_91704 ) ) ( not ( = ?auto_91702 ?auto_91705 ) ) ( not ( = ?auto_91702 ?auto_91706 ) ) ( not ( = ?auto_91702 ?auto_91707 ) ) ( not ( = ?auto_91702 ?auto_91708 ) ) ( not ( = ?auto_91703 ?auto_91704 ) ) ( not ( = ?auto_91703 ?auto_91705 ) ) ( not ( = ?auto_91703 ?auto_91706 ) ) ( not ( = ?auto_91703 ?auto_91707 ) ) ( not ( = ?auto_91703 ?auto_91708 ) ) ( not ( = ?auto_91704 ?auto_91705 ) ) ( not ( = ?auto_91704 ?auto_91706 ) ) ( not ( = ?auto_91704 ?auto_91707 ) ) ( not ( = ?auto_91704 ?auto_91708 ) ) ( not ( = ?auto_91705 ?auto_91706 ) ) ( not ( = ?auto_91705 ?auto_91707 ) ) ( not ( = ?auto_91705 ?auto_91708 ) ) ( not ( = ?auto_91706 ?auto_91707 ) ) ( not ( = ?auto_91706 ?auto_91708 ) ) ( not ( = ?auto_91707 ?auto_91708 ) ) ( ON ?auto_91706 ?auto_91707 ) ( ON ?auto_91705 ?auto_91706 ) ( ON ?auto_91704 ?auto_91705 ) ( ON ?auto_91703 ?auto_91704 ) ( ON ?auto_91702 ?auto_91703 ) ( ON ?auto_91701 ?auto_91702 ) ( ON ?auto_91700 ?auto_91701 ) ( CLEAR ?auto_91698 ) ( ON ?auto_91699 ?auto_91700 ) ( CLEAR ?auto_91699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91698 ?auto_91699 )
      ( MAKE-10PILE ?auto_91698 ?auto_91699 ?auto_91700 ?auto_91701 ?auto_91702 ?auto_91703 ?auto_91704 ?auto_91705 ?auto_91706 ?auto_91707 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_91719 - BLOCK
      ?auto_91720 - BLOCK
      ?auto_91721 - BLOCK
      ?auto_91722 - BLOCK
      ?auto_91723 - BLOCK
      ?auto_91724 - BLOCK
      ?auto_91725 - BLOCK
      ?auto_91726 - BLOCK
      ?auto_91727 - BLOCK
      ?auto_91728 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91728 ) ( ON-TABLE ?auto_91719 ) ( not ( = ?auto_91719 ?auto_91720 ) ) ( not ( = ?auto_91719 ?auto_91721 ) ) ( not ( = ?auto_91719 ?auto_91722 ) ) ( not ( = ?auto_91719 ?auto_91723 ) ) ( not ( = ?auto_91719 ?auto_91724 ) ) ( not ( = ?auto_91719 ?auto_91725 ) ) ( not ( = ?auto_91719 ?auto_91726 ) ) ( not ( = ?auto_91719 ?auto_91727 ) ) ( not ( = ?auto_91719 ?auto_91728 ) ) ( not ( = ?auto_91720 ?auto_91721 ) ) ( not ( = ?auto_91720 ?auto_91722 ) ) ( not ( = ?auto_91720 ?auto_91723 ) ) ( not ( = ?auto_91720 ?auto_91724 ) ) ( not ( = ?auto_91720 ?auto_91725 ) ) ( not ( = ?auto_91720 ?auto_91726 ) ) ( not ( = ?auto_91720 ?auto_91727 ) ) ( not ( = ?auto_91720 ?auto_91728 ) ) ( not ( = ?auto_91721 ?auto_91722 ) ) ( not ( = ?auto_91721 ?auto_91723 ) ) ( not ( = ?auto_91721 ?auto_91724 ) ) ( not ( = ?auto_91721 ?auto_91725 ) ) ( not ( = ?auto_91721 ?auto_91726 ) ) ( not ( = ?auto_91721 ?auto_91727 ) ) ( not ( = ?auto_91721 ?auto_91728 ) ) ( not ( = ?auto_91722 ?auto_91723 ) ) ( not ( = ?auto_91722 ?auto_91724 ) ) ( not ( = ?auto_91722 ?auto_91725 ) ) ( not ( = ?auto_91722 ?auto_91726 ) ) ( not ( = ?auto_91722 ?auto_91727 ) ) ( not ( = ?auto_91722 ?auto_91728 ) ) ( not ( = ?auto_91723 ?auto_91724 ) ) ( not ( = ?auto_91723 ?auto_91725 ) ) ( not ( = ?auto_91723 ?auto_91726 ) ) ( not ( = ?auto_91723 ?auto_91727 ) ) ( not ( = ?auto_91723 ?auto_91728 ) ) ( not ( = ?auto_91724 ?auto_91725 ) ) ( not ( = ?auto_91724 ?auto_91726 ) ) ( not ( = ?auto_91724 ?auto_91727 ) ) ( not ( = ?auto_91724 ?auto_91728 ) ) ( not ( = ?auto_91725 ?auto_91726 ) ) ( not ( = ?auto_91725 ?auto_91727 ) ) ( not ( = ?auto_91725 ?auto_91728 ) ) ( not ( = ?auto_91726 ?auto_91727 ) ) ( not ( = ?auto_91726 ?auto_91728 ) ) ( not ( = ?auto_91727 ?auto_91728 ) ) ( ON ?auto_91727 ?auto_91728 ) ( ON ?auto_91726 ?auto_91727 ) ( ON ?auto_91725 ?auto_91726 ) ( ON ?auto_91724 ?auto_91725 ) ( ON ?auto_91723 ?auto_91724 ) ( ON ?auto_91722 ?auto_91723 ) ( ON ?auto_91721 ?auto_91722 ) ( CLEAR ?auto_91719 ) ( ON ?auto_91720 ?auto_91721 ) ( CLEAR ?auto_91720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91719 ?auto_91720 )
      ( MAKE-10PILE ?auto_91719 ?auto_91720 ?auto_91721 ?auto_91722 ?auto_91723 ?auto_91724 ?auto_91725 ?auto_91726 ?auto_91727 ?auto_91728 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_91739 - BLOCK
      ?auto_91740 - BLOCK
      ?auto_91741 - BLOCK
      ?auto_91742 - BLOCK
      ?auto_91743 - BLOCK
      ?auto_91744 - BLOCK
      ?auto_91745 - BLOCK
      ?auto_91746 - BLOCK
      ?auto_91747 - BLOCK
      ?auto_91748 - BLOCK
    )
    :vars
    (
      ?auto_91749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91748 ?auto_91749 ) ( not ( = ?auto_91739 ?auto_91740 ) ) ( not ( = ?auto_91739 ?auto_91741 ) ) ( not ( = ?auto_91739 ?auto_91742 ) ) ( not ( = ?auto_91739 ?auto_91743 ) ) ( not ( = ?auto_91739 ?auto_91744 ) ) ( not ( = ?auto_91739 ?auto_91745 ) ) ( not ( = ?auto_91739 ?auto_91746 ) ) ( not ( = ?auto_91739 ?auto_91747 ) ) ( not ( = ?auto_91739 ?auto_91748 ) ) ( not ( = ?auto_91739 ?auto_91749 ) ) ( not ( = ?auto_91740 ?auto_91741 ) ) ( not ( = ?auto_91740 ?auto_91742 ) ) ( not ( = ?auto_91740 ?auto_91743 ) ) ( not ( = ?auto_91740 ?auto_91744 ) ) ( not ( = ?auto_91740 ?auto_91745 ) ) ( not ( = ?auto_91740 ?auto_91746 ) ) ( not ( = ?auto_91740 ?auto_91747 ) ) ( not ( = ?auto_91740 ?auto_91748 ) ) ( not ( = ?auto_91740 ?auto_91749 ) ) ( not ( = ?auto_91741 ?auto_91742 ) ) ( not ( = ?auto_91741 ?auto_91743 ) ) ( not ( = ?auto_91741 ?auto_91744 ) ) ( not ( = ?auto_91741 ?auto_91745 ) ) ( not ( = ?auto_91741 ?auto_91746 ) ) ( not ( = ?auto_91741 ?auto_91747 ) ) ( not ( = ?auto_91741 ?auto_91748 ) ) ( not ( = ?auto_91741 ?auto_91749 ) ) ( not ( = ?auto_91742 ?auto_91743 ) ) ( not ( = ?auto_91742 ?auto_91744 ) ) ( not ( = ?auto_91742 ?auto_91745 ) ) ( not ( = ?auto_91742 ?auto_91746 ) ) ( not ( = ?auto_91742 ?auto_91747 ) ) ( not ( = ?auto_91742 ?auto_91748 ) ) ( not ( = ?auto_91742 ?auto_91749 ) ) ( not ( = ?auto_91743 ?auto_91744 ) ) ( not ( = ?auto_91743 ?auto_91745 ) ) ( not ( = ?auto_91743 ?auto_91746 ) ) ( not ( = ?auto_91743 ?auto_91747 ) ) ( not ( = ?auto_91743 ?auto_91748 ) ) ( not ( = ?auto_91743 ?auto_91749 ) ) ( not ( = ?auto_91744 ?auto_91745 ) ) ( not ( = ?auto_91744 ?auto_91746 ) ) ( not ( = ?auto_91744 ?auto_91747 ) ) ( not ( = ?auto_91744 ?auto_91748 ) ) ( not ( = ?auto_91744 ?auto_91749 ) ) ( not ( = ?auto_91745 ?auto_91746 ) ) ( not ( = ?auto_91745 ?auto_91747 ) ) ( not ( = ?auto_91745 ?auto_91748 ) ) ( not ( = ?auto_91745 ?auto_91749 ) ) ( not ( = ?auto_91746 ?auto_91747 ) ) ( not ( = ?auto_91746 ?auto_91748 ) ) ( not ( = ?auto_91746 ?auto_91749 ) ) ( not ( = ?auto_91747 ?auto_91748 ) ) ( not ( = ?auto_91747 ?auto_91749 ) ) ( not ( = ?auto_91748 ?auto_91749 ) ) ( ON ?auto_91747 ?auto_91748 ) ( ON ?auto_91746 ?auto_91747 ) ( ON ?auto_91745 ?auto_91746 ) ( ON ?auto_91744 ?auto_91745 ) ( ON ?auto_91743 ?auto_91744 ) ( ON ?auto_91742 ?auto_91743 ) ( ON ?auto_91741 ?auto_91742 ) ( ON ?auto_91740 ?auto_91741 ) ( ON ?auto_91739 ?auto_91740 ) ( CLEAR ?auto_91739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91739 )
      ( MAKE-10PILE ?auto_91739 ?auto_91740 ?auto_91741 ?auto_91742 ?auto_91743 ?auto_91744 ?auto_91745 ?auto_91746 ?auto_91747 ?auto_91748 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_91760 - BLOCK
      ?auto_91761 - BLOCK
      ?auto_91762 - BLOCK
      ?auto_91763 - BLOCK
      ?auto_91764 - BLOCK
      ?auto_91765 - BLOCK
      ?auto_91766 - BLOCK
      ?auto_91767 - BLOCK
      ?auto_91768 - BLOCK
      ?auto_91769 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91769 ) ( not ( = ?auto_91760 ?auto_91761 ) ) ( not ( = ?auto_91760 ?auto_91762 ) ) ( not ( = ?auto_91760 ?auto_91763 ) ) ( not ( = ?auto_91760 ?auto_91764 ) ) ( not ( = ?auto_91760 ?auto_91765 ) ) ( not ( = ?auto_91760 ?auto_91766 ) ) ( not ( = ?auto_91760 ?auto_91767 ) ) ( not ( = ?auto_91760 ?auto_91768 ) ) ( not ( = ?auto_91760 ?auto_91769 ) ) ( not ( = ?auto_91761 ?auto_91762 ) ) ( not ( = ?auto_91761 ?auto_91763 ) ) ( not ( = ?auto_91761 ?auto_91764 ) ) ( not ( = ?auto_91761 ?auto_91765 ) ) ( not ( = ?auto_91761 ?auto_91766 ) ) ( not ( = ?auto_91761 ?auto_91767 ) ) ( not ( = ?auto_91761 ?auto_91768 ) ) ( not ( = ?auto_91761 ?auto_91769 ) ) ( not ( = ?auto_91762 ?auto_91763 ) ) ( not ( = ?auto_91762 ?auto_91764 ) ) ( not ( = ?auto_91762 ?auto_91765 ) ) ( not ( = ?auto_91762 ?auto_91766 ) ) ( not ( = ?auto_91762 ?auto_91767 ) ) ( not ( = ?auto_91762 ?auto_91768 ) ) ( not ( = ?auto_91762 ?auto_91769 ) ) ( not ( = ?auto_91763 ?auto_91764 ) ) ( not ( = ?auto_91763 ?auto_91765 ) ) ( not ( = ?auto_91763 ?auto_91766 ) ) ( not ( = ?auto_91763 ?auto_91767 ) ) ( not ( = ?auto_91763 ?auto_91768 ) ) ( not ( = ?auto_91763 ?auto_91769 ) ) ( not ( = ?auto_91764 ?auto_91765 ) ) ( not ( = ?auto_91764 ?auto_91766 ) ) ( not ( = ?auto_91764 ?auto_91767 ) ) ( not ( = ?auto_91764 ?auto_91768 ) ) ( not ( = ?auto_91764 ?auto_91769 ) ) ( not ( = ?auto_91765 ?auto_91766 ) ) ( not ( = ?auto_91765 ?auto_91767 ) ) ( not ( = ?auto_91765 ?auto_91768 ) ) ( not ( = ?auto_91765 ?auto_91769 ) ) ( not ( = ?auto_91766 ?auto_91767 ) ) ( not ( = ?auto_91766 ?auto_91768 ) ) ( not ( = ?auto_91766 ?auto_91769 ) ) ( not ( = ?auto_91767 ?auto_91768 ) ) ( not ( = ?auto_91767 ?auto_91769 ) ) ( not ( = ?auto_91768 ?auto_91769 ) ) ( ON ?auto_91768 ?auto_91769 ) ( ON ?auto_91767 ?auto_91768 ) ( ON ?auto_91766 ?auto_91767 ) ( ON ?auto_91765 ?auto_91766 ) ( ON ?auto_91764 ?auto_91765 ) ( ON ?auto_91763 ?auto_91764 ) ( ON ?auto_91762 ?auto_91763 ) ( ON ?auto_91761 ?auto_91762 ) ( ON ?auto_91760 ?auto_91761 ) ( CLEAR ?auto_91760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91760 )
      ( MAKE-10PILE ?auto_91760 ?auto_91761 ?auto_91762 ?auto_91763 ?auto_91764 ?auto_91765 ?auto_91766 ?auto_91767 ?auto_91768 ?auto_91769 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_91780 - BLOCK
      ?auto_91781 - BLOCK
      ?auto_91782 - BLOCK
      ?auto_91783 - BLOCK
      ?auto_91784 - BLOCK
      ?auto_91785 - BLOCK
      ?auto_91786 - BLOCK
      ?auto_91787 - BLOCK
      ?auto_91788 - BLOCK
      ?auto_91789 - BLOCK
    )
    :vars
    (
      ?auto_91790 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91780 ?auto_91781 ) ) ( not ( = ?auto_91780 ?auto_91782 ) ) ( not ( = ?auto_91780 ?auto_91783 ) ) ( not ( = ?auto_91780 ?auto_91784 ) ) ( not ( = ?auto_91780 ?auto_91785 ) ) ( not ( = ?auto_91780 ?auto_91786 ) ) ( not ( = ?auto_91780 ?auto_91787 ) ) ( not ( = ?auto_91780 ?auto_91788 ) ) ( not ( = ?auto_91780 ?auto_91789 ) ) ( not ( = ?auto_91781 ?auto_91782 ) ) ( not ( = ?auto_91781 ?auto_91783 ) ) ( not ( = ?auto_91781 ?auto_91784 ) ) ( not ( = ?auto_91781 ?auto_91785 ) ) ( not ( = ?auto_91781 ?auto_91786 ) ) ( not ( = ?auto_91781 ?auto_91787 ) ) ( not ( = ?auto_91781 ?auto_91788 ) ) ( not ( = ?auto_91781 ?auto_91789 ) ) ( not ( = ?auto_91782 ?auto_91783 ) ) ( not ( = ?auto_91782 ?auto_91784 ) ) ( not ( = ?auto_91782 ?auto_91785 ) ) ( not ( = ?auto_91782 ?auto_91786 ) ) ( not ( = ?auto_91782 ?auto_91787 ) ) ( not ( = ?auto_91782 ?auto_91788 ) ) ( not ( = ?auto_91782 ?auto_91789 ) ) ( not ( = ?auto_91783 ?auto_91784 ) ) ( not ( = ?auto_91783 ?auto_91785 ) ) ( not ( = ?auto_91783 ?auto_91786 ) ) ( not ( = ?auto_91783 ?auto_91787 ) ) ( not ( = ?auto_91783 ?auto_91788 ) ) ( not ( = ?auto_91783 ?auto_91789 ) ) ( not ( = ?auto_91784 ?auto_91785 ) ) ( not ( = ?auto_91784 ?auto_91786 ) ) ( not ( = ?auto_91784 ?auto_91787 ) ) ( not ( = ?auto_91784 ?auto_91788 ) ) ( not ( = ?auto_91784 ?auto_91789 ) ) ( not ( = ?auto_91785 ?auto_91786 ) ) ( not ( = ?auto_91785 ?auto_91787 ) ) ( not ( = ?auto_91785 ?auto_91788 ) ) ( not ( = ?auto_91785 ?auto_91789 ) ) ( not ( = ?auto_91786 ?auto_91787 ) ) ( not ( = ?auto_91786 ?auto_91788 ) ) ( not ( = ?auto_91786 ?auto_91789 ) ) ( not ( = ?auto_91787 ?auto_91788 ) ) ( not ( = ?auto_91787 ?auto_91789 ) ) ( not ( = ?auto_91788 ?auto_91789 ) ) ( ON ?auto_91780 ?auto_91790 ) ( not ( = ?auto_91789 ?auto_91790 ) ) ( not ( = ?auto_91788 ?auto_91790 ) ) ( not ( = ?auto_91787 ?auto_91790 ) ) ( not ( = ?auto_91786 ?auto_91790 ) ) ( not ( = ?auto_91785 ?auto_91790 ) ) ( not ( = ?auto_91784 ?auto_91790 ) ) ( not ( = ?auto_91783 ?auto_91790 ) ) ( not ( = ?auto_91782 ?auto_91790 ) ) ( not ( = ?auto_91781 ?auto_91790 ) ) ( not ( = ?auto_91780 ?auto_91790 ) ) ( ON ?auto_91781 ?auto_91780 ) ( ON ?auto_91782 ?auto_91781 ) ( ON ?auto_91783 ?auto_91782 ) ( ON ?auto_91784 ?auto_91783 ) ( ON ?auto_91785 ?auto_91784 ) ( ON ?auto_91786 ?auto_91785 ) ( ON ?auto_91787 ?auto_91786 ) ( ON ?auto_91788 ?auto_91787 ) ( ON ?auto_91789 ?auto_91788 ) ( CLEAR ?auto_91789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_91789 ?auto_91788 ?auto_91787 ?auto_91786 ?auto_91785 ?auto_91784 ?auto_91783 ?auto_91782 ?auto_91781 ?auto_91780 )
      ( MAKE-10PILE ?auto_91780 ?auto_91781 ?auto_91782 ?auto_91783 ?auto_91784 ?auto_91785 ?auto_91786 ?auto_91787 ?auto_91788 ?auto_91789 ) )
  )

)

