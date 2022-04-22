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
      ?auto_61121 - BLOCK
    )
    :vars
    (
      ?auto_61122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61121 ?auto_61122 ) ( CLEAR ?auto_61121 ) ( HAND-EMPTY ) ( not ( = ?auto_61121 ?auto_61122 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61121 ?auto_61122 )
      ( !PUTDOWN ?auto_61121 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61128 - BLOCK
      ?auto_61129 - BLOCK
    )
    :vars
    (
      ?auto_61130 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61128 ) ( ON ?auto_61129 ?auto_61130 ) ( CLEAR ?auto_61129 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61128 ) ( not ( = ?auto_61128 ?auto_61129 ) ) ( not ( = ?auto_61128 ?auto_61130 ) ) ( not ( = ?auto_61129 ?auto_61130 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61129 ?auto_61130 )
      ( !STACK ?auto_61129 ?auto_61128 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61138 - BLOCK
      ?auto_61139 - BLOCK
    )
    :vars
    (
      ?auto_61140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61139 ?auto_61140 ) ( not ( = ?auto_61138 ?auto_61139 ) ) ( not ( = ?auto_61138 ?auto_61140 ) ) ( not ( = ?auto_61139 ?auto_61140 ) ) ( ON ?auto_61138 ?auto_61139 ) ( CLEAR ?auto_61138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61138 )
      ( MAKE-2PILE ?auto_61138 ?auto_61139 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61149 - BLOCK
      ?auto_61150 - BLOCK
      ?auto_61151 - BLOCK
    )
    :vars
    (
      ?auto_61152 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61150 ) ( ON ?auto_61151 ?auto_61152 ) ( CLEAR ?auto_61151 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61149 ) ( ON ?auto_61150 ?auto_61149 ) ( not ( = ?auto_61149 ?auto_61150 ) ) ( not ( = ?auto_61149 ?auto_61151 ) ) ( not ( = ?auto_61149 ?auto_61152 ) ) ( not ( = ?auto_61150 ?auto_61151 ) ) ( not ( = ?auto_61150 ?auto_61152 ) ) ( not ( = ?auto_61151 ?auto_61152 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61151 ?auto_61152 )
      ( !STACK ?auto_61151 ?auto_61150 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61163 - BLOCK
      ?auto_61164 - BLOCK
      ?auto_61165 - BLOCK
    )
    :vars
    (
      ?auto_61166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61165 ?auto_61166 ) ( ON-TABLE ?auto_61163 ) ( not ( = ?auto_61163 ?auto_61164 ) ) ( not ( = ?auto_61163 ?auto_61165 ) ) ( not ( = ?auto_61163 ?auto_61166 ) ) ( not ( = ?auto_61164 ?auto_61165 ) ) ( not ( = ?auto_61164 ?auto_61166 ) ) ( not ( = ?auto_61165 ?auto_61166 ) ) ( CLEAR ?auto_61163 ) ( ON ?auto_61164 ?auto_61165 ) ( CLEAR ?auto_61164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61163 ?auto_61164 )
      ( MAKE-3PILE ?auto_61163 ?auto_61164 ?auto_61165 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61177 - BLOCK
      ?auto_61178 - BLOCK
      ?auto_61179 - BLOCK
    )
    :vars
    (
      ?auto_61180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61179 ?auto_61180 ) ( not ( = ?auto_61177 ?auto_61178 ) ) ( not ( = ?auto_61177 ?auto_61179 ) ) ( not ( = ?auto_61177 ?auto_61180 ) ) ( not ( = ?auto_61178 ?auto_61179 ) ) ( not ( = ?auto_61178 ?auto_61180 ) ) ( not ( = ?auto_61179 ?auto_61180 ) ) ( ON ?auto_61178 ?auto_61179 ) ( ON ?auto_61177 ?auto_61178 ) ( CLEAR ?auto_61177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61177 )
      ( MAKE-3PILE ?auto_61177 ?auto_61178 ?auto_61179 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61192 - BLOCK
      ?auto_61193 - BLOCK
      ?auto_61194 - BLOCK
      ?auto_61195 - BLOCK
    )
    :vars
    (
      ?auto_61196 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61194 ) ( ON ?auto_61195 ?auto_61196 ) ( CLEAR ?auto_61195 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61192 ) ( ON ?auto_61193 ?auto_61192 ) ( ON ?auto_61194 ?auto_61193 ) ( not ( = ?auto_61192 ?auto_61193 ) ) ( not ( = ?auto_61192 ?auto_61194 ) ) ( not ( = ?auto_61192 ?auto_61195 ) ) ( not ( = ?auto_61192 ?auto_61196 ) ) ( not ( = ?auto_61193 ?auto_61194 ) ) ( not ( = ?auto_61193 ?auto_61195 ) ) ( not ( = ?auto_61193 ?auto_61196 ) ) ( not ( = ?auto_61194 ?auto_61195 ) ) ( not ( = ?auto_61194 ?auto_61196 ) ) ( not ( = ?auto_61195 ?auto_61196 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61195 ?auto_61196 )
      ( !STACK ?auto_61195 ?auto_61194 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61210 - BLOCK
      ?auto_61211 - BLOCK
      ?auto_61212 - BLOCK
      ?auto_61213 - BLOCK
    )
    :vars
    (
      ?auto_61214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61213 ?auto_61214 ) ( ON-TABLE ?auto_61210 ) ( ON ?auto_61211 ?auto_61210 ) ( not ( = ?auto_61210 ?auto_61211 ) ) ( not ( = ?auto_61210 ?auto_61212 ) ) ( not ( = ?auto_61210 ?auto_61213 ) ) ( not ( = ?auto_61210 ?auto_61214 ) ) ( not ( = ?auto_61211 ?auto_61212 ) ) ( not ( = ?auto_61211 ?auto_61213 ) ) ( not ( = ?auto_61211 ?auto_61214 ) ) ( not ( = ?auto_61212 ?auto_61213 ) ) ( not ( = ?auto_61212 ?auto_61214 ) ) ( not ( = ?auto_61213 ?auto_61214 ) ) ( CLEAR ?auto_61211 ) ( ON ?auto_61212 ?auto_61213 ) ( CLEAR ?auto_61212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61210 ?auto_61211 ?auto_61212 )
      ( MAKE-4PILE ?auto_61210 ?auto_61211 ?auto_61212 ?auto_61213 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61228 - BLOCK
      ?auto_61229 - BLOCK
      ?auto_61230 - BLOCK
      ?auto_61231 - BLOCK
    )
    :vars
    (
      ?auto_61232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61231 ?auto_61232 ) ( ON-TABLE ?auto_61228 ) ( not ( = ?auto_61228 ?auto_61229 ) ) ( not ( = ?auto_61228 ?auto_61230 ) ) ( not ( = ?auto_61228 ?auto_61231 ) ) ( not ( = ?auto_61228 ?auto_61232 ) ) ( not ( = ?auto_61229 ?auto_61230 ) ) ( not ( = ?auto_61229 ?auto_61231 ) ) ( not ( = ?auto_61229 ?auto_61232 ) ) ( not ( = ?auto_61230 ?auto_61231 ) ) ( not ( = ?auto_61230 ?auto_61232 ) ) ( not ( = ?auto_61231 ?auto_61232 ) ) ( ON ?auto_61230 ?auto_61231 ) ( CLEAR ?auto_61228 ) ( ON ?auto_61229 ?auto_61230 ) ( CLEAR ?auto_61229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61228 ?auto_61229 )
      ( MAKE-4PILE ?auto_61228 ?auto_61229 ?auto_61230 ?auto_61231 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61246 - BLOCK
      ?auto_61247 - BLOCK
      ?auto_61248 - BLOCK
      ?auto_61249 - BLOCK
    )
    :vars
    (
      ?auto_61250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61249 ?auto_61250 ) ( not ( = ?auto_61246 ?auto_61247 ) ) ( not ( = ?auto_61246 ?auto_61248 ) ) ( not ( = ?auto_61246 ?auto_61249 ) ) ( not ( = ?auto_61246 ?auto_61250 ) ) ( not ( = ?auto_61247 ?auto_61248 ) ) ( not ( = ?auto_61247 ?auto_61249 ) ) ( not ( = ?auto_61247 ?auto_61250 ) ) ( not ( = ?auto_61248 ?auto_61249 ) ) ( not ( = ?auto_61248 ?auto_61250 ) ) ( not ( = ?auto_61249 ?auto_61250 ) ) ( ON ?auto_61248 ?auto_61249 ) ( ON ?auto_61247 ?auto_61248 ) ( ON ?auto_61246 ?auto_61247 ) ( CLEAR ?auto_61246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61246 )
      ( MAKE-4PILE ?auto_61246 ?auto_61247 ?auto_61248 ?auto_61249 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61265 - BLOCK
      ?auto_61266 - BLOCK
      ?auto_61267 - BLOCK
      ?auto_61268 - BLOCK
      ?auto_61269 - BLOCK
    )
    :vars
    (
      ?auto_61270 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61268 ) ( ON ?auto_61269 ?auto_61270 ) ( CLEAR ?auto_61269 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61265 ) ( ON ?auto_61266 ?auto_61265 ) ( ON ?auto_61267 ?auto_61266 ) ( ON ?auto_61268 ?auto_61267 ) ( not ( = ?auto_61265 ?auto_61266 ) ) ( not ( = ?auto_61265 ?auto_61267 ) ) ( not ( = ?auto_61265 ?auto_61268 ) ) ( not ( = ?auto_61265 ?auto_61269 ) ) ( not ( = ?auto_61265 ?auto_61270 ) ) ( not ( = ?auto_61266 ?auto_61267 ) ) ( not ( = ?auto_61266 ?auto_61268 ) ) ( not ( = ?auto_61266 ?auto_61269 ) ) ( not ( = ?auto_61266 ?auto_61270 ) ) ( not ( = ?auto_61267 ?auto_61268 ) ) ( not ( = ?auto_61267 ?auto_61269 ) ) ( not ( = ?auto_61267 ?auto_61270 ) ) ( not ( = ?auto_61268 ?auto_61269 ) ) ( not ( = ?auto_61268 ?auto_61270 ) ) ( not ( = ?auto_61269 ?auto_61270 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61269 ?auto_61270 )
      ( !STACK ?auto_61269 ?auto_61268 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61287 - BLOCK
      ?auto_61288 - BLOCK
      ?auto_61289 - BLOCK
      ?auto_61290 - BLOCK
      ?auto_61291 - BLOCK
    )
    :vars
    (
      ?auto_61292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61291 ?auto_61292 ) ( ON-TABLE ?auto_61287 ) ( ON ?auto_61288 ?auto_61287 ) ( ON ?auto_61289 ?auto_61288 ) ( not ( = ?auto_61287 ?auto_61288 ) ) ( not ( = ?auto_61287 ?auto_61289 ) ) ( not ( = ?auto_61287 ?auto_61290 ) ) ( not ( = ?auto_61287 ?auto_61291 ) ) ( not ( = ?auto_61287 ?auto_61292 ) ) ( not ( = ?auto_61288 ?auto_61289 ) ) ( not ( = ?auto_61288 ?auto_61290 ) ) ( not ( = ?auto_61288 ?auto_61291 ) ) ( not ( = ?auto_61288 ?auto_61292 ) ) ( not ( = ?auto_61289 ?auto_61290 ) ) ( not ( = ?auto_61289 ?auto_61291 ) ) ( not ( = ?auto_61289 ?auto_61292 ) ) ( not ( = ?auto_61290 ?auto_61291 ) ) ( not ( = ?auto_61290 ?auto_61292 ) ) ( not ( = ?auto_61291 ?auto_61292 ) ) ( CLEAR ?auto_61289 ) ( ON ?auto_61290 ?auto_61291 ) ( CLEAR ?auto_61290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61287 ?auto_61288 ?auto_61289 ?auto_61290 )
      ( MAKE-5PILE ?auto_61287 ?auto_61288 ?auto_61289 ?auto_61290 ?auto_61291 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61309 - BLOCK
      ?auto_61310 - BLOCK
      ?auto_61311 - BLOCK
      ?auto_61312 - BLOCK
      ?auto_61313 - BLOCK
    )
    :vars
    (
      ?auto_61314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61313 ?auto_61314 ) ( ON-TABLE ?auto_61309 ) ( ON ?auto_61310 ?auto_61309 ) ( not ( = ?auto_61309 ?auto_61310 ) ) ( not ( = ?auto_61309 ?auto_61311 ) ) ( not ( = ?auto_61309 ?auto_61312 ) ) ( not ( = ?auto_61309 ?auto_61313 ) ) ( not ( = ?auto_61309 ?auto_61314 ) ) ( not ( = ?auto_61310 ?auto_61311 ) ) ( not ( = ?auto_61310 ?auto_61312 ) ) ( not ( = ?auto_61310 ?auto_61313 ) ) ( not ( = ?auto_61310 ?auto_61314 ) ) ( not ( = ?auto_61311 ?auto_61312 ) ) ( not ( = ?auto_61311 ?auto_61313 ) ) ( not ( = ?auto_61311 ?auto_61314 ) ) ( not ( = ?auto_61312 ?auto_61313 ) ) ( not ( = ?auto_61312 ?auto_61314 ) ) ( not ( = ?auto_61313 ?auto_61314 ) ) ( ON ?auto_61312 ?auto_61313 ) ( CLEAR ?auto_61310 ) ( ON ?auto_61311 ?auto_61312 ) ( CLEAR ?auto_61311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61309 ?auto_61310 ?auto_61311 )
      ( MAKE-5PILE ?auto_61309 ?auto_61310 ?auto_61311 ?auto_61312 ?auto_61313 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61331 - BLOCK
      ?auto_61332 - BLOCK
      ?auto_61333 - BLOCK
      ?auto_61334 - BLOCK
      ?auto_61335 - BLOCK
    )
    :vars
    (
      ?auto_61336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61335 ?auto_61336 ) ( ON-TABLE ?auto_61331 ) ( not ( = ?auto_61331 ?auto_61332 ) ) ( not ( = ?auto_61331 ?auto_61333 ) ) ( not ( = ?auto_61331 ?auto_61334 ) ) ( not ( = ?auto_61331 ?auto_61335 ) ) ( not ( = ?auto_61331 ?auto_61336 ) ) ( not ( = ?auto_61332 ?auto_61333 ) ) ( not ( = ?auto_61332 ?auto_61334 ) ) ( not ( = ?auto_61332 ?auto_61335 ) ) ( not ( = ?auto_61332 ?auto_61336 ) ) ( not ( = ?auto_61333 ?auto_61334 ) ) ( not ( = ?auto_61333 ?auto_61335 ) ) ( not ( = ?auto_61333 ?auto_61336 ) ) ( not ( = ?auto_61334 ?auto_61335 ) ) ( not ( = ?auto_61334 ?auto_61336 ) ) ( not ( = ?auto_61335 ?auto_61336 ) ) ( ON ?auto_61334 ?auto_61335 ) ( ON ?auto_61333 ?auto_61334 ) ( CLEAR ?auto_61331 ) ( ON ?auto_61332 ?auto_61333 ) ( CLEAR ?auto_61332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61331 ?auto_61332 )
      ( MAKE-5PILE ?auto_61331 ?auto_61332 ?auto_61333 ?auto_61334 ?auto_61335 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61353 - BLOCK
      ?auto_61354 - BLOCK
      ?auto_61355 - BLOCK
      ?auto_61356 - BLOCK
      ?auto_61357 - BLOCK
    )
    :vars
    (
      ?auto_61358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61357 ?auto_61358 ) ( not ( = ?auto_61353 ?auto_61354 ) ) ( not ( = ?auto_61353 ?auto_61355 ) ) ( not ( = ?auto_61353 ?auto_61356 ) ) ( not ( = ?auto_61353 ?auto_61357 ) ) ( not ( = ?auto_61353 ?auto_61358 ) ) ( not ( = ?auto_61354 ?auto_61355 ) ) ( not ( = ?auto_61354 ?auto_61356 ) ) ( not ( = ?auto_61354 ?auto_61357 ) ) ( not ( = ?auto_61354 ?auto_61358 ) ) ( not ( = ?auto_61355 ?auto_61356 ) ) ( not ( = ?auto_61355 ?auto_61357 ) ) ( not ( = ?auto_61355 ?auto_61358 ) ) ( not ( = ?auto_61356 ?auto_61357 ) ) ( not ( = ?auto_61356 ?auto_61358 ) ) ( not ( = ?auto_61357 ?auto_61358 ) ) ( ON ?auto_61356 ?auto_61357 ) ( ON ?auto_61355 ?auto_61356 ) ( ON ?auto_61354 ?auto_61355 ) ( ON ?auto_61353 ?auto_61354 ) ( CLEAR ?auto_61353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61353 )
      ( MAKE-5PILE ?auto_61353 ?auto_61354 ?auto_61355 ?auto_61356 ?auto_61357 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61376 - BLOCK
      ?auto_61377 - BLOCK
      ?auto_61378 - BLOCK
      ?auto_61379 - BLOCK
      ?auto_61380 - BLOCK
      ?auto_61381 - BLOCK
    )
    :vars
    (
      ?auto_61382 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61380 ) ( ON ?auto_61381 ?auto_61382 ) ( CLEAR ?auto_61381 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61376 ) ( ON ?auto_61377 ?auto_61376 ) ( ON ?auto_61378 ?auto_61377 ) ( ON ?auto_61379 ?auto_61378 ) ( ON ?auto_61380 ?auto_61379 ) ( not ( = ?auto_61376 ?auto_61377 ) ) ( not ( = ?auto_61376 ?auto_61378 ) ) ( not ( = ?auto_61376 ?auto_61379 ) ) ( not ( = ?auto_61376 ?auto_61380 ) ) ( not ( = ?auto_61376 ?auto_61381 ) ) ( not ( = ?auto_61376 ?auto_61382 ) ) ( not ( = ?auto_61377 ?auto_61378 ) ) ( not ( = ?auto_61377 ?auto_61379 ) ) ( not ( = ?auto_61377 ?auto_61380 ) ) ( not ( = ?auto_61377 ?auto_61381 ) ) ( not ( = ?auto_61377 ?auto_61382 ) ) ( not ( = ?auto_61378 ?auto_61379 ) ) ( not ( = ?auto_61378 ?auto_61380 ) ) ( not ( = ?auto_61378 ?auto_61381 ) ) ( not ( = ?auto_61378 ?auto_61382 ) ) ( not ( = ?auto_61379 ?auto_61380 ) ) ( not ( = ?auto_61379 ?auto_61381 ) ) ( not ( = ?auto_61379 ?auto_61382 ) ) ( not ( = ?auto_61380 ?auto_61381 ) ) ( not ( = ?auto_61380 ?auto_61382 ) ) ( not ( = ?auto_61381 ?auto_61382 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61381 ?auto_61382 )
      ( !STACK ?auto_61381 ?auto_61380 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61402 - BLOCK
      ?auto_61403 - BLOCK
      ?auto_61404 - BLOCK
      ?auto_61405 - BLOCK
      ?auto_61406 - BLOCK
      ?auto_61407 - BLOCK
    )
    :vars
    (
      ?auto_61408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61407 ?auto_61408 ) ( ON-TABLE ?auto_61402 ) ( ON ?auto_61403 ?auto_61402 ) ( ON ?auto_61404 ?auto_61403 ) ( ON ?auto_61405 ?auto_61404 ) ( not ( = ?auto_61402 ?auto_61403 ) ) ( not ( = ?auto_61402 ?auto_61404 ) ) ( not ( = ?auto_61402 ?auto_61405 ) ) ( not ( = ?auto_61402 ?auto_61406 ) ) ( not ( = ?auto_61402 ?auto_61407 ) ) ( not ( = ?auto_61402 ?auto_61408 ) ) ( not ( = ?auto_61403 ?auto_61404 ) ) ( not ( = ?auto_61403 ?auto_61405 ) ) ( not ( = ?auto_61403 ?auto_61406 ) ) ( not ( = ?auto_61403 ?auto_61407 ) ) ( not ( = ?auto_61403 ?auto_61408 ) ) ( not ( = ?auto_61404 ?auto_61405 ) ) ( not ( = ?auto_61404 ?auto_61406 ) ) ( not ( = ?auto_61404 ?auto_61407 ) ) ( not ( = ?auto_61404 ?auto_61408 ) ) ( not ( = ?auto_61405 ?auto_61406 ) ) ( not ( = ?auto_61405 ?auto_61407 ) ) ( not ( = ?auto_61405 ?auto_61408 ) ) ( not ( = ?auto_61406 ?auto_61407 ) ) ( not ( = ?auto_61406 ?auto_61408 ) ) ( not ( = ?auto_61407 ?auto_61408 ) ) ( CLEAR ?auto_61405 ) ( ON ?auto_61406 ?auto_61407 ) ( CLEAR ?auto_61406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61402 ?auto_61403 ?auto_61404 ?auto_61405 ?auto_61406 )
      ( MAKE-6PILE ?auto_61402 ?auto_61403 ?auto_61404 ?auto_61405 ?auto_61406 ?auto_61407 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61428 - BLOCK
      ?auto_61429 - BLOCK
      ?auto_61430 - BLOCK
      ?auto_61431 - BLOCK
      ?auto_61432 - BLOCK
      ?auto_61433 - BLOCK
    )
    :vars
    (
      ?auto_61434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61433 ?auto_61434 ) ( ON-TABLE ?auto_61428 ) ( ON ?auto_61429 ?auto_61428 ) ( ON ?auto_61430 ?auto_61429 ) ( not ( = ?auto_61428 ?auto_61429 ) ) ( not ( = ?auto_61428 ?auto_61430 ) ) ( not ( = ?auto_61428 ?auto_61431 ) ) ( not ( = ?auto_61428 ?auto_61432 ) ) ( not ( = ?auto_61428 ?auto_61433 ) ) ( not ( = ?auto_61428 ?auto_61434 ) ) ( not ( = ?auto_61429 ?auto_61430 ) ) ( not ( = ?auto_61429 ?auto_61431 ) ) ( not ( = ?auto_61429 ?auto_61432 ) ) ( not ( = ?auto_61429 ?auto_61433 ) ) ( not ( = ?auto_61429 ?auto_61434 ) ) ( not ( = ?auto_61430 ?auto_61431 ) ) ( not ( = ?auto_61430 ?auto_61432 ) ) ( not ( = ?auto_61430 ?auto_61433 ) ) ( not ( = ?auto_61430 ?auto_61434 ) ) ( not ( = ?auto_61431 ?auto_61432 ) ) ( not ( = ?auto_61431 ?auto_61433 ) ) ( not ( = ?auto_61431 ?auto_61434 ) ) ( not ( = ?auto_61432 ?auto_61433 ) ) ( not ( = ?auto_61432 ?auto_61434 ) ) ( not ( = ?auto_61433 ?auto_61434 ) ) ( ON ?auto_61432 ?auto_61433 ) ( CLEAR ?auto_61430 ) ( ON ?auto_61431 ?auto_61432 ) ( CLEAR ?auto_61431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61428 ?auto_61429 ?auto_61430 ?auto_61431 )
      ( MAKE-6PILE ?auto_61428 ?auto_61429 ?auto_61430 ?auto_61431 ?auto_61432 ?auto_61433 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61454 - BLOCK
      ?auto_61455 - BLOCK
      ?auto_61456 - BLOCK
      ?auto_61457 - BLOCK
      ?auto_61458 - BLOCK
      ?auto_61459 - BLOCK
    )
    :vars
    (
      ?auto_61460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61459 ?auto_61460 ) ( ON-TABLE ?auto_61454 ) ( ON ?auto_61455 ?auto_61454 ) ( not ( = ?auto_61454 ?auto_61455 ) ) ( not ( = ?auto_61454 ?auto_61456 ) ) ( not ( = ?auto_61454 ?auto_61457 ) ) ( not ( = ?auto_61454 ?auto_61458 ) ) ( not ( = ?auto_61454 ?auto_61459 ) ) ( not ( = ?auto_61454 ?auto_61460 ) ) ( not ( = ?auto_61455 ?auto_61456 ) ) ( not ( = ?auto_61455 ?auto_61457 ) ) ( not ( = ?auto_61455 ?auto_61458 ) ) ( not ( = ?auto_61455 ?auto_61459 ) ) ( not ( = ?auto_61455 ?auto_61460 ) ) ( not ( = ?auto_61456 ?auto_61457 ) ) ( not ( = ?auto_61456 ?auto_61458 ) ) ( not ( = ?auto_61456 ?auto_61459 ) ) ( not ( = ?auto_61456 ?auto_61460 ) ) ( not ( = ?auto_61457 ?auto_61458 ) ) ( not ( = ?auto_61457 ?auto_61459 ) ) ( not ( = ?auto_61457 ?auto_61460 ) ) ( not ( = ?auto_61458 ?auto_61459 ) ) ( not ( = ?auto_61458 ?auto_61460 ) ) ( not ( = ?auto_61459 ?auto_61460 ) ) ( ON ?auto_61458 ?auto_61459 ) ( ON ?auto_61457 ?auto_61458 ) ( CLEAR ?auto_61455 ) ( ON ?auto_61456 ?auto_61457 ) ( CLEAR ?auto_61456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61454 ?auto_61455 ?auto_61456 )
      ( MAKE-6PILE ?auto_61454 ?auto_61455 ?auto_61456 ?auto_61457 ?auto_61458 ?auto_61459 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61480 - BLOCK
      ?auto_61481 - BLOCK
      ?auto_61482 - BLOCK
      ?auto_61483 - BLOCK
      ?auto_61484 - BLOCK
      ?auto_61485 - BLOCK
    )
    :vars
    (
      ?auto_61486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61485 ?auto_61486 ) ( ON-TABLE ?auto_61480 ) ( not ( = ?auto_61480 ?auto_61481 ) ) ( not ( = ?auto_61480 ?auto_61482 ) ) ( not ( = ?auto_61480 ?auto_61483 ) ) ( not ( = ?auto_61480 ?auto_61484 ) ) ( not ( = ?auto_61480 ?auto_61485 ) ) ( not ( = ?auto_61480 ?auto_61486 ) ) ( not ( = ?auto_61481 ?auto_61482 ) ) ( not ( = ?auto_61481 ?auto_61483 ) ) ( not ( = ?auto_61481 ?auto_61484 ) ) ( not ( = ?auto_61481 ?auto_61485 ) ) ( not ( = ?auto_61481 ?auto_61486 ) ) ( not ( = ?auto_61482 ?auto_61483 ) ) ( not ( = ?auto_61482 ?auto_61484 ) ) ( not ( = ?auto_61482 ?auto_61485 ) ) ( not ( = ?auto_61482 ?auto_61486 ) ) ( not ( = ?auto_61483 ?auto_61484 ) ) ( not ( = ?auto_61483 ?auto_61485 ) ) ( not ( = ?auto_61483 ?auto_61486 ) ) ( not ( = ?auto_61484 ?auto_61485 ) ) ( not ( = ?auto_61484 ?auto_61486 ) ) ( not ( = ?auto_61485 ?auto_61486 ) ) ( ON ?auto_61484 ?auto_61485 ) ( ON ?auto_61483 ?auto_61484 ) ( ON ?auto_61482 ?auto_61483 ) ( CLEAR ?auto_61480 ) ( ON ?auto_61481 ?auto_61482 ) ( CLEAR ?auto_61481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61480 ?auto_61481 )
      ( MAKE-6PILE ?auto_61480 ?auto_61481 ?auto_61482 ?auto_61483 ?auto_61484 ?auto_61485 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61506 - BLOCK
      ?auto_61507 - BLOCK
      ?auto_61508 - BLOCK
      ?auto_61509 - BLOCK
      ?auto_61510 - BLOCK
      ?auto_61511 - BLOCK
    )
    :vars
    (
      ?auto_61512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61511 ?auto_61512 ) ( not ( = ?auto_61506 ?auto_61507 ) ) ( not ( = ?auto_61506 ?auto_61508 ) ) ( not ( = ?auto_61506 ?auto_61509 ) ) ( not ( = ?auto_61506 ?auto_61510 ) ) ( not ( = ?auto_61506 ?auto_61511 ) ) ( not ( = ?auto_61506 ?auto_61512 ) ) ( not ( = ?auto_61507 ?auto_61508 ) ) ( not ( = ?auto_61507 ?auto_61509 ) ) ( not ( = ?auto_61507 ?auto_61510 ) ) ( not ( = ?auto_61507 ?auto_61511 ) ) ( not ( = ?auto_61507 ?auto_61512 ) ) ( not ( = ?auto_61508 ?auto_61509 ) ) ( not ( = ?auto_61508 ?auto_61510 ) ) ( not ( = ?auto_61508 ?auto_61511 ) ) ( not ( = ?auto_61508 ?auto_61512 ) ) ( not ( = ?auto_61509 ?auto_61510 ) ) ( not ( = ?auto_61509 ?auto_61511 ) ) ( not ( = ?auto_61509 ?auto_61512 ) ) ( not ( = ?auto_61510 ?auto_61511 ) ) ( not ( = ?auto_61510 ?auto_61512 ) ) ( not ( = ?auto_61511 ?auto_61512 ) ) ( ON ?auto_61510 ?auto_61511 ) ( ON ?auto_61509 ?auto_61510 ) ( ON ?auto_61508 ?auto_61509 ) ( ON ?auto_61507 ?auto_61508 ) ( ON ?auto_61506 ?auto_61507 ) ( CLEAR ?auto_61506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61506 )
      ( MAKE-6PILE ?auto_61506 ?auto_61507 ?auto_61508 ?auto_61509 ?auto_61510 ?auto_61511 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_61533 - BLOCK
      ?auto_61534 - BLOCK
      ?auto_61535 - BLOCK
      ?auto_61536 - BLOCK
      ?auto_61537 - BLOCK
      ?auto_61538 - BLOCK
      ?auto_61539 - BLOCK
    )
    :vars
    (
      ?auto_61540 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61538 ) ( ON ?auto_61539 ?auto_61540 ) ( CLEAR ?auto_61539 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61533 ) ( ON ?auto_61534 ?auto_61533 ) ( ON ?auto_61535 ?auto_61534 ) ( ON ?auto_61536 ?auto_61535 ) ( ON ?auto_61537 ?auto_61536 ) ( ON ?auto_61538 ?auto_61537 ) ( not ( = ?auto_61533 ?auto_61534 ) ) ( not ( = ?auto_61533 ?auto_61535 ) ) ( not ( = ?auto_61533 ?auto_61536 ) ) ( not ( = ?auto_61533 ?auto_61537 ) ) ( not ( = ?auto_61533 ?auto_61538 ) ) ( not ( = ?auto_61533 ?auto_61539 ) ) ( not ( = ?auto_61533 ?auto_61540 ) ) ( not ( = ?auto_61534 ?auto_61535 ) ) ( not ( = ?auto_61534 ?auto_61536 ) ) ( not ( = ?auto_61534 ?auto_61537 ) ) ( not ( = ?auto_61534 ?auto_61538 ) ) ( not ( = ?auto_61534 ?auto_61539 ) ) ( not ( = ?auto_61534 ?auto_61540 ) ) ( not ( = ?auto_61535 ?auto_61536 ) ) ( not ( = ?auto_61535 ?auto_61537 ) ) ( not ( = ?auto_61535 ?auto_61538 ) ) ( not ( = ?auto_61535 ?auto_61539 ) ) ( not ( = ?auto_61535 ?auto_61540 ) ) ( not ( = ?auto_61536 ?auto_61537 ) ) ( not ( = ?auto_61536 ?auto_61538 ) ) ( not ( = ?auto_61536 ?auto_61539 ) ) ( not ( = ?auto_61536 ?auto_61540 ) ) ( not ( = ?auto_61537 ?auto_61538 ) ) ( not ( = ?auto_61537 ?auto_61539 ) ) ( not ( = ?auto_61537 ?auto_61540 ) ) ( not ( = ?auto_61538 ?auto_61539 ) ) ( not ( = ?auto_61538 ?auto_61540 ) ) ( not ( = ?auto_61539 ?auto_61540 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61539 ?auto_61540 )
      ( !STACK ?auto_61539 ?auto_61538 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_61563 - BLOCK
      ?auto_61564 - BLOCK
      ?auto_61565 - BLOCK
      ?auto_61566 - BLOCK
      ?auto_61567 - BLOCK
      ?auto_61568 - BLOCK
      ?auto_61569 - BLOCK
    )
    :vars
    (
      ?auto_61570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61569 ?auto_61570 ) ( ON-TABLE ?auto_61563 ) ( ON ?auto_61564 ?auto_61563 ) ( ON ?auto_61565 ?auto_61564 ) ( ON ?auto_61566 ?auto_61565 ) ( ON ?auto_61567 ?auto_61566 ) ( not ( = ?auto_61563 ?auto_61564 ) ) ( not ( = ?auto_61563 ?auto_61565 ) ) ( not ( = ?auto_61563 ?auto_61566 ) ) ( not ( = ?auto_61563 ?auto_61567 ) ) ( not ( = ?auto_61563 ?auto_61568 ) ) ( not ( = ?auto_61563 ?auto_61569 ) ) ( not ( = ?auto_61563 ?auto_61570 ) ) ( not ( = ?auto_61564 ?auto_61565 ) ) ( not ( = ?auto_61564 ?auto_61566 ) ) ( not ( = ?auto_61564 ?auto_61567 ) ) ( not ( = ?auto_61564 ?auto_61568 ) ) ( not ( = ?auto_61564 ?auto_61569 ) ) ( not ( = ?auto_61564 ?auto_61570 ) ) ( not ( = ?auto_61565 ?auto_61566 ) ) ( not ( = ?auto_61565 ?auto_61567 ) ) ( not ( = ?auto_61565 ?auto_61568 ) ) ( not ( = ?auto_61565 ?auto_61569 ) ) ( not ( = ?auto_61565 ?auto_61570 ) ) ( not ( = ?auto_61566 ?auto_61567 ) ) ( not ( = ?auto_61566 ?auto_61568 ) ) ( not ( = ?auto_61566 ?auto_61569 ) ) ( not ( = ?auto_61566 ?auto_61570 ) ) ( not ( = ?auto_61567 ?auto_61568 ) ) ( not ( = ?auto_61567 ?auto_61569 ) ) ( not ( = ?auto_61567 ?auto_61570 ) ) ( not ( = ?auto_61568 ?auto_61569 ) ) ( not ( = ?auto_61568 ?auto_61570 ) ) ( not ( = ?auto_61569 ?auto_61570 ) ) ( CLEAR ?auto_61567 ) ( ON ?auto_61568 ?auto_61569 ) ( CLEAR ?auto_61568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61563 ?auto_61564 ?auto_61565 ?auto_61566 ?auto_61567 ?auto_61568 )
      ( MAKE-7PILE ?auto_61563 ?auto_61564 ?auto_61565 ?auto_61566 ?auto_61567 ?auto_61568 ?auto_61569 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_61593 - BLOCK
      ?auto_61594 - BLOCK
      ?auto_61595 - BLOCK
      ?auto_61596 - BLOCK
      ?auto_61597 - BLOCK
      ?auto_61598 - BLOCK
      ?auto_61599 - BLOCK
    )
    :vars
    (
      ?auto_61600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61599 ?auto_61600 ) ( ON-TABLE ?auto_61593 ) ( ON ?auto_61594 ?auto_61593 ) ( ON ?auto_61595 ?auto_61594 ) ( ON ?auto_61596 ?auto_61595 ) ( not ( = ?auto_61593 ?auto_61594 ) ) ( not ( = ?auto_61593 ?auto_61595 ) ) ( not ( = ?auto_61593 ?auto_61596 ) ) ( not ( = ?auto_61593 ?auto_61597 ) ) ( not ( = ?auto_61593 ?auto_61598 ) ) ( not ( = ?auto_61593 ?auto_61599 ) ) ( not ( = ?auto_61593 ?auto_61600 ) ) ( not ( = ?auto_61594 ?auto_61595 ) ) ( not ( = ?auto_61594 ?auto_61596 ) ) ( not ( = ?auto_61594 ?auto_61597 ) ) ( not ( = ?auto_61594 ?auto_61598 ) ) ( not ( = ?auto_61594 ?auto_61599 ) ) ( not ( = ?auto_61594 ?auto_61600 ) ) ( not ( = ?auto_61595 ?auto_61596 ) ) ( not ( = ?auto_61595 ?auto_61597 ) ) ( not ( = ?auto_61595 ?auto_61598 ) ) ( not ( = ?auto_61595 ?auto_61599 ) ) ( not ( = ?auto_61595 ?auto_61600 ) ) ( not ( = ?auto_61596 ?auto_61597 ) ) ( not ( = ?auto_61596 ?auto_61598 ) ) ( not ( = ?auto_61596 ?auto_61599 ) ) ( not ( = ?auto_61596 ?auto_61600 ) ) ( not ( = ?auto_61597 ?auto_61598 ) ) ( not ( = ?auto_61597 ?auto_61599 ) ) ( not ( = ?auto_61597 ?auto_61600 ) ) ( not ( = ?auto_61598 ?auto_61599 ) ) ( not ( = ?auto_61598 ?auto_61600 ) ) ( not ( = ?auto_61599 ?auto_61600 ) ) ( ON ?auto_61598 ?auto_61599 ) ( CLEAR ?auto_61596 ) ( ON ?auto_61597 ?auto_61598 ) ( CLEAR ?auto_61597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61593 ?auto_61594 ?auto_61595 ?auto_61596 ?auto_61597 )
      ( MAKE-7PILE ?auto_61593 ?auto_61594 ?auto_61595 ?auto_61596 ?auto_61597 ?auto_61598 ?auto_61599 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_61623 - BLOCK
      ?auto_61624 - BLOCK
      ?auto_61625 - BLOCK
      ?auto_61626 - BLOCK
      ?auto_61627 - BLOCK
      ?auto_61628 - BLOCK
      ?auto_61629 - BLOCK
    )
    :vars
    (
      ?auto_61630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61629 ?auto_61630 ) ( ON-TABLE ?auto_61623 ) ( ON ?auto_61624 ?auto_61623 ) ( ON ?auto_61625 ?auto_61624 ) ( not ( = ?auto_61623 ?auto_61624 ) ) ( not ( = ?auto_61623 ?auto_61625 ) ) ( not ( = ?auto_61623 ?auto_61626 ) ) ( not ( = ?auto_61623 ?auto_61627 ) ) ( not ( = ?auto_61623 ?auto_61628 ) ) ( not ( = ?auto_61623 ?auto_61629 ) ) ( not ( = ?auto_61623 ?auto_61630 ) ) ( not ( = ?auto_61624 ?auto_61625 ) ) ( not ( = ?auto_61624 ?auto_61626 ) ) ( not ( = ?auto_61624 ?auto_61627 ) ) ( not ( = ?auto_61624 ?auto_61628 ) ) ( not ( = ?auto_61624 ?auto_61629 ) ) ( not ( = ?auto_61624 ?auto_61630 ) ) ( not ( = ?auto_61625 ?auto_61626 ) ) ( not ( = ?auto_61625 ?auto_61627 ) ) ( not ( = ?auto_61625 ?auto_61628 ) ) ( not ( = ?auto_61625 ?auto_61629 ) ) ( not ( = ?auto_61625 ?auto_61630 ) ) ( not ( = ?auto_61626 ?auto_61627 ) ) ( not ( = ?auto_61626 ?auto_61628 ) ) ( not ( = ?auto_61626 ?auto_61629 ) ) ( not ( = ?auto_61626 ?auto_61630 ) ) ( not ( = ?auto_61627 ?auto_61628 ) ) ( not ( = ?auto_61627 ?auto_61629 ) ) ( not ( = ?auto_61627 ?auto_61630 ) ) ( not ( = ?auto_61628 ?auto_61629 ) ) ( not ( = ?auto_61628 ?auto_61630 ) ) ( not ( = ?auto_61629 ?auto_61630 ) ) ( ON ?auto_61628 ?auto_61629 ) ( ON ?auto_61627 ?auto_61628 ) ( CLEAR ?auto_61625 ) ( ON ?auto_61626 ?auto_61627 ) ( CLEAR ?auto_61626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61623 ?auto_61624 ?auto_61625 ?auto_61626 )
      ( MAKE-7PILE ?auto_61623 ?auto_61624 ?auto_61625 ?auto_61626 ?auto_61627 ?auto_61628 ?auto_61629 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_61653 - BLOCK
      ?auto_61654 - BLOCK
      ?auto_61655 - BLOCK
      ?auto_61656 - BLOCK
      ?auto_61657 - BLOCK
      ?auto_61658 - BLOCK
      ?auto_61659 - BLOCK
    )
    :vars
    (
      ?auto_61660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61659 ?auto_61660 ) ( ON-TABLE ?auto_61653 ) ( ON ?auto_61654 ?auto_61653 ) ( not ( = ?auto_61653 ?auto_61654 ) ) ( not ( = ?auto_61653 ?auto_61655 ) ) ( not ( = ?auto_61653 ?auto_61656 ) ) ( not ( = ?auto_61653 ?auto_61657 ) ) ( not ( = ?auto_61653 ?auto_61658 ) ) ( not ( = ?auto_61653 ?auto_61659 ) ) ( not ( = ?auto_61653 ?auto_61660 ) ) ( not ( = ?auto_61654 ?auto_61655 ) ) ( not ( = ?auto_61654 ?auto_61656 ) ) ( not ( = ?auto_61654 ?auto_61657 ) ) ( not ( = ?auto_61654 ?auto_61658 ) ) ( not ( = ?auto_61654 ?auto_61659 ) ) ( not ( = ?auto_61654 ?auto_61660 ) ) ( not ( = ?auto_61655 ?auto_61656 ) ) ( not ( = ?auto_61655 ?auto_61657 ) ) ( not ( = ?auto_61655 ?auto_61658 ) ) ( not ( = ?auto_61655 ?auto_61659 ) ) ( not ( = ?auto_61655 ?auto_61660 ) ) ( not ( = ?auto_61656 ?auto_61657 ) ) ( not ( = ?auto_61656 ?auto_61658 ) ) ( not ( = ?auto_61656 ?auto_61659 ) ) ( not ( = ?auto_61656 ?auto_61660 ) ) ( not ( = ?auto_61657 ?auto_61658 ) ) ( not ( = ?auto_61657 ?auto_61659 ) ) ( not ( = ?auto_61657 ?auto_61660 ) ) ( not ( = ?auto_61658 ?auto_61659 ) ) ( not ( = ?auto_61658 ?auto_61660 ) ) ( not ( = ?auto_61659 ?auto_61660 ) ) ( ON ?auto_61658 ?auto_61659 ) ( ON ?auto_61657 ?auto_61658 ) ( ON ?auto_61656 ?auto_61657 ) ( CLEAR ?auto_61654 ) ( ON ?auto_61655 ?auto_61656 ) ( CLEAR ?auto_61655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61653 ?auto_61654 ?auto_61655 )
      ( MAKE-7PILE ?auto_61653 ?auto_61654 ?auto_61655 ?auto_61656 ?auto_61657 ?auto_61658 ?auto_61659 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_61683 - BLOCK
      ?auto_61684 - BLOCK
      ?auto_61685 - BLOCK
      ?auto_61686 - BLOCK
      ?auto_61687 - BLOCK
      ?auto_61688 - BLOCK
      ?auto_61689 - BLOCK
    )
    :vars
    (
      ?auto_61690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61689 ?auto_61690 ) ( ON-TABLE ?auto_61683 ) ( not ( = ?auto_61683 ?auto_61684 ) ) ( not ( = ?auto_61683 ?auto_61685 ) ) ( not ( = ?auto_61683 ?auto_61686 ) ) ( not ( = ?auto_61683 ?auto_61687 ) ) ( not ( = ?auto_61683 ?auto_61688 ) ) ( not ( = ?auto_61683 ?auto_61689 ) ) ( not ( = ?auto_61683 ?auto_61690 ) ) ( not ( = ?auto_61684 ?auto_61685 ) ) ( not ( = ?auto_61684 ?auto_61686 ) ) ( not ( = ?auto_61684 ?auto_61687 ) ) ( not ( = ?auto_61684 ?auto_61688 ) ) ( not ( = ?auto_61684 ?auto_61689 ) ) ( not ( = ?auto_61684 ?auto_61690 ) ) ( not ( = ?auto_61685 ?auto_61686 ) ) ( not ( = ?auto_61685 ?auto_61687 ) ) ( not ( = ?auto_61685 ?auto_61688 ) ) ( not ( = ?auto_61685 ?auto_61689 ) ) ( not ( = ?auto_61685 ?auto_61690 ) ) ( not ( = ?auto_61686 ?auto_61687 ) ) ( not ( = ?auto_61686 ?auto_61688 ) ) ( not ( = ?auto_61686 ?auto_61689 ) ) ( not ( = ?auto_61686 ?auto_61690 ) ) ( not ( = ?auto_61687 ?auto_61688 ) ) ( not ( = ?auto_61687 ?auto_61689 ) ) ( not ( = ?auto_61687 ?auto_61690 ) ) ( not ( = ?auto_61688 ?auto_61689 ) ) ( not ( = ?auto_61688 ?auto_61690 ) ) ( not ( = ?auto_61689 ?auto_61690 ) ) ( ON ?auto_61688 ?auto_61689 ) ( ON ?auto_61687 ?auto_61688 ) ( ON ?auto_61686 ?auto_61687 ) ( ON ?auto_61685 ?auto_61686 ) ( CLEAR ?auto_61683 ) ( ON ?auto_61684 ?auto_61685 ) ( CLEAR ?auto_61684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61683 ?auto_61684 )
      ( MAKE-7PILE ?auto_61683 ?auto_61684 ?auto_61685 ?auto_61686 ?auto_61687 ?auto_61688 ?auto_61689 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_61713 - BLOCK
      ?auto_61714 - BLOCK
      ?auto_61715 - BLOCK
      ?auto_61716 - BLOCK
      ?auto_61717 - BLOCK
      ?auto_61718 - BLOCK
      ?auto_61719 - BLOCK
    )
    :vars
    (
      ?auto_61720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61719 ?auto_61720 ) ( not ( = ?auto_61713 ?auto_61714 ) ) ( not ( = ?auto_61713 ?auto_61715 ) ) ( not ( = ?auto_61713 ?auto_61716 ) ) ( not ( = ?auto_61713 ?auto_61717 ) ) ( not ( = ?auto_61713 ?auto_61718 ) ) ( not ( = ?auto_61713 ?auto_61719 ) ) ( not ( = ?auto_61713 ?auto_61720 ) ) ( not ( = ?auto_61714 ?auto_61715 ) ) ( not ( = ?auto_61714 ?auto_61716 ) ) ( not ( = ?auto_61714 ?auto_61717 ) ) ( not ( = ?auto_61714 ?auto_61718 ) ) ( not ( = ?auto_61714 ?auto_61719 ) ) ( not ( = ?auto_61714 ?auto_61720 ) ) ( not ( = ?auto_61715 ?auto_61716 ) ) ( not ( = ?auto_61715 ?auto_61717 ) ) ( not ( = ?auto_61715 ?auto_61718 ) ) ( not ( = ?auto_61715 ?auto_61719 ) ) ( not ( = ?auto_61715 ?auto_61720 ) ) ( not ( = ?auto_61716 ?auto_61717 ) ) ( not ( = ?auto_61716 ?auto_61718 ) ) ( not ( = ?auto_61716 ?auto_61719 ) ) ( not ( = ?auto_61716 ?auto_61720 ) ) ( not ( = ?auto_61717 ?auto_61718 ) ) ( not ( = ?auto_61717 ?auto_61719 ) ) ( not ( = ?auto_61717 ?auto_61720 ) ) ( not ( = ?auto_61718 ?auto_61719 ) ) ( not ( = ?auto_61718 ?auto_61720 ) ) ( not ( = ?auto_61719 ?auto_61720 ) ) ( ON ?auto_61718 ?auto_61719 ) ( ON ?auto_61717 ?auto_61718 ) ( ON ?auto_61716 ?auto_61717 ) ( ON ?auto_61715 ?auto_61716 ) ( ON ?auto_61714 ?auto_61715 ) ( ON ?auto_61713 ?auto_61714 ) ( CLEAR ?auto_61713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61713 )
      ( MAKE-7PILE ?auto_61713 ?auto_61714 ?auto_61715 ?auto_61716 ?auto_61717 ?auto_61718 ?auto_61719 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_61744 - BLOCK
      ?auto_61745 - BLOCK
      ?auto_61746 - BLOCK
      ?auto_61747 - BLOCK
      ?auto_61748 - BLOCK
      ?auto_61749 - BLOCK
      ?auto_61750 - BLOCK
      ?auto_61751 - BLOCK
    )
    :vars
    (
      ?auto_61752 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61750 ) ( ON ?auto_61751 ?auto_61752 ) ( CLEAR ?auto_61751 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61744 ) ( ON ?auto_61745 ?auto_61744 ) ( ON ?auto_61746 ?auto_61745 ) ( ON ?auto_61747 ?auto_61746 ) ( ON ?auto_61748 ?auto_61747 ) ( ON ?auto_61749 ?auto_61748 ) ( ON ?auto_61750 ?auto_61749 ) ( not ( = ?auto_61744 ?auto_61745 ) ) ( not ( = ?auto_61744 ?auto_61746 ) ) ( not ( = ?auto_61744 ?auto_61747 ) ) ( not ( = ?auto_61744 ?auto_61748 ) ) ( not ( = ?auto_61744 ?auto_61749 ) ) ( not ( = ?auto_61744 ?auto_61750 ) ) ( not ( = ?auto_61744 ?auto_61751 ) ) ( not ( = ?auto_61744 ?auto_61752 ) ) ( not ( = ?auto_61745 ?auto_61746 ) ) ( not ( = ?auto_61745 ?auto_61747 ) ) ( not ( = ?auto_61745 ?auto_61748 ) ) ( not ( = ?auto_61745 ?auto_61749 ) ) ( not ( = ?auto_61745 ?auto_61750 ) ) ( not ( = ?auto_61745 ?auto_61751 ) ) ( not ( = ?auto_61745 ?auto_61752 ) ) ( not ( = ?auto_61746 ?auto_61747 ) ) ( not ( = ?auto_61746 ?auto_61748 ) ) ( not ( = ?auto_61746 ?auto_61749 ) ) ( not ( = ?auto_61746 ?auto_61750 ) ) ( not ( = ?auto_61746 ?auto_61751 ) ) ( not ( = ?auto_61746 ?auto_61752 ) ) ( not ( = ?auto_61747 ?auto_61748 ) ) ( not ( = ?auto_61747 ?auto_61749 ) ) ( not ( = ?auto_61747 ?auto_61750 ) ) ( not ( = ?auto_61747 ?auto_61751 ) ) ( not ( = ?auto_61747 ?auto_61752 ) ) ( not ( = ?auto_61748 ?auto_61749 ) ) ( not ( = ?auto_61748 ?auto_61750 ) ) ( not ( = ?auto_61748 ?auto_61751 ) ) ( not ( = ?auto_61748 ?auto_61752 ) ) ( not ( = ?auto_61749 ?auto_61750 ) ) ( not ( = ?auto_61749 ?auto_61751 ) ) ( not ( = ?auto_61749 ?auto_61752 ) ) ( not ( = ?auto_61750 ?auto_61751 ) ) ( not ( = ?auto_61750 ?auto_61752 ) ) ( not ( = ?auto_61751 ?auto_61752 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61751 ?auto_61752 )
      ( !STACK ?auto_61751 ?auto_61750 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_61778 - BLOCK
      ?auto_61779 - BLOCK
      ?auto_61780 - BLOCK
      ?auto_61781 - BLOCK
      ?auto_61782 - BLOCK
      ?auto_61783 - BLOCK
      ?auto_61784 - BLOCK
      ?auto_61785 - BLOCK
    )
    :vars
    (
      ?auto_61786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61785 ?auto_61786 ) ( ON-TABLE ?auto_61778 ) ( ON ?auto_61779 ?auto_61778 ) ( ON ?auto_61780 ?auto_61779 ) ( ON ?auto_61781 ?auto_61780 ) ( ON ?auto_61782 ?auto_61781 ) ( ON ?auto_61783 ?auto_61782 ) ( not ( = ?auto_61778 ?auto_61779 ) ) ( not ( = ?auto_61778 ?auto_61780 ) ) ( not ( = ?auto_61778 ?auto_61781 ) ) ( not ( = ?auto_61778 ?auto_61782 ) ) ( not ( = ?auto_61778 ?auto_61783 ) ) ( not ( = ?auto_61778 ?auto_61784 ) ) ( not ( = ?auto_61778 ?auto_61785 ) ) ( not ( = ?auto_61778 ?auto_61786 ) ) ( not ( = ?auto_61779 ?auto_61780 ) ) ( not ( = ?auto_61779 ?auto_61781 ) ) ( not ( = ?auto_61779 ?auto_61782 ) ) ( not ( = ?auto_61779 ?auto_61783 ) ) ( not ( = ?auto_61779 ?auto_61784 ) ) ( not ( = ?auto_61779 ?auto_61785 ) ) ( not ( = ?auto_61779 ?auto_61786 ) ) ( not ( = ?auto_61780 ?auto_61781 ) ) ( not ( = ?auto_61780 ?auto_61782 ) ) ( not ( = ?auto_61780 ?auto_61783 ) ) ( not ( = ?auto_61780 ?auto_61784 ) ) ( not ( = ?auto_61780 ?auto_61785 ) ) ( not ( = ?auto_61780 ?auto_61786 ) ) ( not ( = ?auto_61781 ?auto_61782 ) ) ( not ( = ?auto_61781 ?auto_61783 ) ) ( not ( = ?auto_61781 ?auto_61784 ) ) ( not ( = ?auto_61781 ?auto_61785 ) ) ( not ( = ?auto_61781 ?auto_61786 ) ) ( not ( = ?auto_61782 ?auto_61783 ) ) ( not ( = ?auto_61782 ?auto_61784 ) ) ( not ( = ?auto_61782 ?auto_61785 ) ) ( not ( = ?auto_61782 ?auto_61786 ) ) ( not ( = ?auto_61783 ?auto_61784 ) ) ( not ( = ?auto_61783 ?auto_61785 ) ) ( not ( = ?auto_61783 ?auto_61786 ) ) ( not ( = ?auto_61784 ?auto_61785 ) ) ( not ( = ?auto_61784 ?auto_61786 ) ) ( not ( = ?auto_61785 ?auto_61786 ) ) ( CLEAR ?auto_61783 ) ( ON ?auto_61784 ?auto_61785 ) ( CLEAR ?auto_61784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_61778 ?auto_61779 ?auto_61780 ?auto_61781 ?auto_61782 ?auto_61783 ?auto_61784 )
      ( MAKE-8PILE ?auto_61778 ?auto_61779 ?auto_61780 ?auto_61781 ?auto_61782 ?auto_61783 ?auto_61784 ?auto_61785 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_61812 - BLOCK
      ?auto_61813 - BLOCK
      ?auto_61814 - BLOCK
      ?auto_61815 - BLOCK
      ?auto_61816 - BLOCK
      ?auto_61817 - BLOCK
      ?auto_61818 - BLOCK
      ?auto_61819 - BLOCK
    )
    :vars
    (
      ?auto_61820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61819 ?auto_61820 ) ( ON-TABLE ?auto_61812 ) ( ON ?auto_61813 ?auto_61812 ) ( ON ?auto_61814 ?auto_61813 ) ( ON ?auto_61815 ?auto_61814 ) ( ON ?auto_61816 ?auto_61815 ) ( not ( = ?auto_61812 ?auto_61813 ) ) ( not ( = ?auto_61812 ?auto_61814 ) ) ( not ( = ?auto_61812 ?auto_61815 ) ) ( not ( = ?auto_61812 ?auto_61816 ) ) ( not ( = ?auto_61812 ?auto_61817 ) ) ( not ( = ?auto_61812 ?auto_61818 ) ) ( not ( = ?auto_61812 ?auto_61819 ) ) ( not ( = ?auto_61812 ?auto_61820 ) ) ( not ( = ?auto_61813 ?auto_61814 ) ) ( not ( = ?auto_61813 ?auto_61815 ) ) ( not ( = ?auto_61813 ?auto_61816 ) ) ( not ( = ?auto_61813 ?auto_61817 ) ) ( not ( = ?auto_61813 ?auto_61818 ) ) ( not ( = ?auto_61813 ?auto_61819 ) ) ( not ( = ?auto_61813 ?auto_61820 ) ) ( not ( = ?auto_61814 ?auto_61815 ) ) ( not ( = ?auto_61814 ?auto_61816 ) ) ( not ( = ?auto_61814 ?auto_61817 ) ) ( not ( = ?auto_61814 ?auto_61818 ) ) ( not ( = ?auto_61814 ?auto_61819 ) ) ( not ( = ?auto_61814 ?auto_61820 ) ) ( not ( = ?auto_61815 ?auto_61816 ) ) ( not ( = ?auto_61815 ?auto_61817 ) ) ( not ( = ?auto_61815 ?auto_61818 ) ) ( not ( = ?auto_61815 ?auto_61819 ) ) ( not ( = ?auto_61815 ?auto_61820 ) ) ( not ( = ?auto_61816 ?auto_61817 ) ) ( not ( = ?auto_61816 ?auto_61818 ) ) ( not ( = ?auto_61816 ?auto_61819 ) ) ( not ( = ?auto_61816 ?auto_61820 ) ) ( not ( = ?auto_61817 ?auto_61818 ) ) ( not ( = ?auto_61817 ?auto_61819 ) ) ( not ( = ?auto_61817 ?auto_61820 ) ) ( not ( = ?auto_61818 ?auto_61819 ) ) ( not ( = ?auto_61818 ?auto_61820 ) ) ( not ( = ?auto_61819 ?auto_61820 ) ) ( ON ?auto_61818 ?auto_61819 ) ( CLEAR ?auto_61816 ) ( ON ?auto_61817 ?auto_61818 ) ( CLEAR ?auto_61817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61812 ?auto_61813 ?auto_61814 ?auto_61815 ?auto_61816 ?auto_61817 )
      ( MAKE-8PILE ?auto_61812 ?auto_61813 ?auto_61814 ?auto_61815 ?auto_61816 ?auto_61817 ?auto_61818 ?auto_61819 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_61846 - BLOCK
      ?auto_61847 - BLOCK
      ?auto_61848 - BLOCK
      ?auto_61849 - BLOCK
      ?auto_61850 - BLOCK
      ?auto_61851 - BLOCK
      ?auto_61852 - BLOCK
      ?auto_61853 - BLOCK
    )
    :vars
    (
      ?auto_61854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61853 ?auto_61854 ) ( ON-TABLE ?auto_61846 ) ( ON ?auto_61847 ?auto_61846 ) ( ON ?auto_61848 ?auto_61847 ) ( ON ?auto_61849 ?auto_61848 ) ( not ( = ?auto_61846 ?auto_61847 ) ) ( not ( = ?auto_61846 ?auto_61848 ) ) ( not ( = ?auto_61846 ?auto_61849 ) ) ( not ( = ?auto_61846 ?auto_61850 ) ) ( not ( = ?auto_61846 ?auto_61851 ) ) ( not ( = ?auto_61846 ?auto_61852 ) ) ( not ( = ?auto_61846 ?auto_61853 ) ) ( not ( = ?auto_61846 ?auto_61854 ) ) ( not ( = ?auto_61847 ?auto_61848 ) ) ( not ( = ?auto_61847 ?auto_61849 ) ) ( not ( = ?auto_61847 ?auto_61850 ) ) ( not ( = ?auto_61847 ?auto_61851 ) ) ( not ( = ?auto_61847 ?auto_61852 ) ) ( not ( = ?auto_61847 ?auto_61853 ) ) ( not ( = ?auto_61847 ?auto_61854 ) ) ( not ( = ?auto_61848 ?auto_61849 ) ) ( not ( = ?auto_61848 ?auto_61850 ) ) ( not ( = ?auto_61848 ?auto_61851 ) ) ( not ( = ?auto_61848 ?auto_61852 ) ) ( not ( = ?auto_61848 ?auto_61853 ) ) ( not ( = ?auto_61848 ?auto_61854 ) ) ( not ( = ?auto_61849 ?auto_61850 ) ) ( not ( = ?auto_61849 ?auto_61851 ) ) ( not ( = ?auto_61849 ?auto_61852 ) ) ( not ( = ?auto_61849 ?auto_61853 ) ) ( not ( = ?auto_61849 ?auto_61854 ) ) ( not ( = ?auto_61850 ?auto_61851 ) ) ( not ( = ?auto_61850 ?auto_61852 ) ) ( not ( = ?auto_61850 ?auto_61853 ) ) ( not ( = ?auto_61850 ?auto_61854 ) ) ( not ( = ?auto_61851 ?auto_61852 ) ) ( not ( = ?auto_61851 ?auto_61853 ) ) ( not ( = ?auto_61851 ?auto_61854 ) ) ( not ( = ?auto_61852 ?auto_61853 ) ) ( not ( = ?auto_61852 ?auto_61854 ) ) ( not ( = ?auto_61853 ?auto_61854 ) ) ( ON ?auto_61852 ?auto_61853 ) ( ON ?auto_61851 ?auto_61852 ) ( CLEAR ?auto_61849 ) ( ON ?auto_61850 ?auto_61851 ) ( CLEAR ?auto_61850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61846 ?auto_61847 ?auto_61848 ?auto_61849 ?auto_61850 )
      ( MAKE-8PILE ?auto_61846 ?auto_61847 ?auto_61848 ?auto_61849 ?auto_61850 ?auto_61851 ?auto_61852 ?auto_61853 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_61880 - BLOCK
      ?auto_61881 - BLOCK
      ?auto_61882 - BLOCK
      ?auto_61883 - BLOCK
      ?auto_61884 - BLOCK
      ?auto_61885 - BLOCK
      ?auto_61886 - BLOCK
      ?auto_61887 - BLOCK
    )
    :vars
    (
      ?auto_61888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61887 ?auto_61888 ) ( ON-TABLE ?auto_61880 ) ( ON ?auto_61881 ?auto_61880 ) ( ON ?auto_61882 ?auto_61881 ) ( not ( = ?auto_61880 ?auto_61881 ) ) ( not ( = ?auto_61880 ?auto_61882 ) ) ( not ( = ?auto_61880 ?auto_61883 ) ) ( not ( = ?auto_61880 ?auto_61884 ) ) ( not ( = ?auto_61880 ?auto_61885 ) ) ( not ( = ?auto_61880 ?auto_61886 ) ) ( not ( = ?auto_61880 ?auto_61887 ) ) ( not ( = ?auto_61880 ?auto_61888 ) ) ( not ( = ?auto_61881 ?auto_61882 ) ) ( not ( = ?auto_61881 ?auto_61883 ) ) ( not ( = ?auto_61881 ?auto_61884 ) ) ( not ( = ?auto_61881 ?auto_61885 ) ) ( not ( = ?auto_61881 ?auto_61886 ) ) ( not ( = ?auto_61881 ?auto_61887 ) ) ( not ( = ?auto_61881 ?auto_61888 ) ) ( not ( = ?auto_61882 ?auto_61883 ) ) ( not ( = ?auto_61882 ?auto_61884 ) ) ( not ( = ?auto_61882 ?auto_61885 ) ) ( not ( = ?auto_61882 ?auto_61886 ) ) ( not ( = ?auto_61882 ?auto_61887 ) ) ( not ( = ?auto_61882 ?auto_61888 ) ) ( not ( = ?auto_61883 ?auto_61884 ) ) ( not ( = ?auto_61883 ?auto_61885 ) ) ( not ( = ?auto_61883 ?auto_61886 ) ) ( not ( = ?auto_61883 ?auto_61887 ) ) ( not ( = ?auto_61883 ?auto_61888 ) ) ( not ( = ?auto_61884 ?auto_61885 ) ) ( not ( = ?auto_61884 ?auto_61886 ) ) ( not ( = ?auto_61884 ?auto_61887 ) ) ( not ( = ?auto_61884 ?auto_61888 ) ) ( not ( = ?auto_61885 ?auto_61886 ) ) ( not ( = ?auto_61885 ?auto_61887 ) ) ( not ( = ?auto_61885 ?auto_61888 ) ) ( not ( = ?auto_61886 ?auto_61887 ) ) ( not ( = ?auto_61886 ?auto_61888 ) ) ( not ( = ?auto_61887 ?auto_61888 ) ) ( ON ?auto_61886 ?auto_61887 ) ( ON ?auto_61885 ?auto_61886 ) ( ON ?auto_61884 ?auto_61885 ) ( CLEAR ?auto_61882 ) ( ON ?auto_61883 ?auto_61884 ) ( CLEAR ?auto_61883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61880 ?auto_61881 ?auto_61882 ?auto_61883 )
      ( MAKE-8PILE ?auto_61880 ?auto_61881 ?auto_61882 ?auto_61883 ?auto_61884 ?auto_61885 ?auto_61886 ?auto_61887 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_61914 - BLOCK
      ?auto_61915 - BLOCK
      ?auto_61916 - BLOCK
      ?auto_61917 - BLOCK
      ?auto_61918 - BLOCK
      ?auto_61919 - BLOCK
      ?auto_61920 - BLOCK
      ?auto_61921 - BLOCK
    )
    :vars
    (
      ?auto_61922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61921 ?auto_61922 ) ( ON-TABLE ?auto_61914 ) ( ON ?auto_61915 ?auto_61914 ) ( not ( = ?auto_61914 ?auto_61915 ) ) ( not ( = ?auto_61914 ?auto_61916 ) ) ( not ( = ?auto_61914 ?auto_61917 ) ) ( not ( = ?auto_61914 ?auto_61918 ) ) ( not ( = ?auto_61914 ?auto_61919 ) ) ( not ( = ?auto_61914 ?auto_61920 ) ) ( not ( = ?auto_61914 ?auto_61921 ) ) ( not ( = ?auto_61914 ?auto_61922 ) ) ( not ( = ?auto_61915 ?auto_61916 ) ) ( not ( = ?auto_61915 ?auto_61917 ) ) ( not ( = ?auto_61915 ?auto_61918 ) ) ( not ( = ?auto_61915 ?auto_61919 ) ) ( not ( = ?auto_61915 ?auto_61920 ) ) ( not ( = ?auto_61915 ?auto_61921 ) ) ( not ( = ?auto_61915 ?auto_61922 ) ) ( not ( = ?auto_61916 ?auto_61917 ) ) ( not ( = ?auto_61916 ?auto_61918 ) ) ( not ( = ?auto_61916 ?auto_61919 ) ) ( not ( = ?auto_61916 ?auto_61920 ) ) ( not ( = ?auto_61916 ?auto_61921 ) ) ( not ( = ?auto_61916 ?auto_61922 ) ) ( not ( = ?auto_61917 ?auto_61918 ) ) ( not ( = ?auto_61917 ?auto_61919 ) ) ( not ( = ?auto_61917 ?auto_61920 ) ) ( not ( = ?auto_61917 ?auto_61921 ) ) ( not ( = ?auto_61917 ?auto_61922 ) ) ( not ( = ?auto_61918 ?auto_61919 ) ) ( not ( = ?auto_61918 ?auto_61920 ) ) ( not ( = ?auto_61918 ?auto_61921 ) ) ( not ( = ?auto_61918 ?auto_61922 ) ) ( not ( = ?auto_61919 ?auto_61920 ) ) ( not ( = ?auto_61919 ?auto_61921 ) ) ( not ( = ?auto_61919 ?auto_61922 ) ) ( not ( = ?auto_61920 ?auto_61921 ) ) ( not ( = ?auto_61920 ?auto_61922 ) ) ( not ( = ?auto_61921 ?auto_61922 ) ) ( ON ?auto_61920 ?auto_61921 ) ( ON ?auto_61919 ?auto_61920 ) ( ON ?auto_61918 ?auto_61919 ) ( ON ?auto_61917 ?auto_61918 ) ( CLEAR ?auto_61915 ) ( ON ?auto_61916 ?auto_61917 ) ( CLEAR ?auto_61916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61914 ?auto_61915 ?auto_61916 )
      ( MAKE-8PILE ?auto_61914 ?auto_61915 ?auto_61916 ?auto_61917 ?auto_61918 ?auto_61919 ?auto_61920 ?auto_61921 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_61948 - BLOCK
      ?auto_61949 - BLOCK
      ?auto_61950 - BLOCK
      ?auto_61951 - BLOCK
      ?auto_61952 - BLOCK
      ?auto_61953 - BLOCK
      ?auto_61954 - BLOCK
      ?auto_61955 - BLOCK
    )
    :vars
    (
      ?auto_61956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61955 ?auto_61956 ) ( ON-TABLE ?auto_61948 ) ( not ( = ?auto_61948 ?auto_61949 ) ) ( not ( = ?auto_61948 ?auto_61950 ) ) ( not ( = ?auto_61948 ?auto_61951 ) ) ( not ( = ?auto_61948 ?auto_61952 ) ) ( not ( = ?auto_61948 ?auto_61953 ) ) ( not ( = ?auto_61948 ?auto_61954 ) ) ( not ( = ?auto_61948 ?auto_61955 ) ) ( not ( = ?auto_61948 ?auto_61956 ) ) ( not ( = ?auto_61949 ?auto_61950 ) ) ( not ( = ?auto_61949 ?auto_61951 ) ) ( not ( = ?auto_61949 ?auto_61952 ) ) ( not ( = ?auto_61949 ?auto_61953 ) ) ( not ( = ?auto_61949 ?auto_61954 ) ) ( not ( = ?auto_61949 ?auto_61955 ) ) ( not ( = ?auto_61949 ?auto_61956 ) ) ( not ( = ?auto_61950 ?auto_61951 ) ) ( not ( = ?auto_61950 ?auto_61952 ) ) ( not ( = ?auto_61950 ?auto_61953 ) ) ( not ( = ?auto_61950 ?auto_61954 ) ) ( not ( = ?auto_61950 ?auto_61955 ) ) ( not ( = ?auto_61950 ?auto_61956 ) ) ( not ( = ?auto_61951 ?auto_61952 ) ) ( not ( = ?auto_61951 ?auto_61953 ) ) ( not ( = ?auto_61951 ?auto_61954 ) ) ( not ( = ?auto_61951 ?auto_61955 ) ) ( not ( = ?auto_61951 ?auto_61956 ) ) ( not ( = ?auto_61952 ?auto_61953 ) ) ( not ( = ?auto_61952 ?auto_61954 ) ) ( not ( = ?auto_61952 ?auto_61955 ) ) ( not ( = ?auto_61952 ?auto_61956 ) ) ( not ( = ?auto_61953 ?auto_61954 ) ) ( not ( = ?auto_61953 ?auto_61955 ) ) ( not ( = ?auto_61953 ?auto_61956 ) ) ( not ( = ?auto_61954 ?auto_61955 ) ) ( not ( = ?auto_61954 ?auto_61956 ) ) ( not ( = ?auto_61955 ?auto_61956 ) ) ( ON ?auto_61954 ?auto_61955 ) ( ON ?auto_61953 ?auto_61954 ) ( ON ?auto_61952 ?auto_61953 ) ( ON ?auto_61951 ?auto_61952 ) ( ON ?auto_61950 ?auto_61951 ) ( CLEAR ?auto_61948 ) ( ON ?auto_61949 ?auto_61950 ) ( CLEAR ?auto_61949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61948 ?auto_61949 )
      ( MAKE-8PILE ?auto_61948 ?auto_61949 ?auto_61950 ?auto_61951 ?auto_61952 ?auto_61953 ?auto_61954 ?auto_61955 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_61982 - BLOCK
      ?auto_61983 - BLOCK
      ?auto_61984 - BLOCK
      ?auto_61985 - BLOCK
      ?auto_61986 - BLOCK
      ?auto_61987 - BLOCK
      ?auto_61988 - BLOCK
      ?auto_61989 - BLOCK
    )
    :vars
    (
      ?auto_61990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61989 ?auto_61990 ) ( not ( = ?auto_61982 ?auto_61983 ) ) ( not ( = ?auto_61982 ?auto_61984 ) ) ( not ( = ?auto_61982 ?auto_61985 ) ) ( not ( = ?auto_61982 ?auto_61986 ) ) ( not ( = ?auto_61982 ?auto_61987 ) ) ( not ( = ?auto_61982 ?auto_61988 ) ) ( not ( = ?auto_61982 ?auto_61989 ) ) ( not ( = ?auto_61982 ?auto_61990 ) ) ( not ( = ?auto_61983 ?auto_61984 ) ) ( not ( = ?auto_61983 ?auto_61985 ) ) ( not ( = ?auto_61983 ?auto_61986 ) ) ( not ( = ?auto_61983 ?auto_61987 ) ) ( not ( = ?auto_61983 ?auto_61988 ) ) ( not ( = ?auto_61983 ?auto_61989 ) ) ( not ( = ?auto_61983 ?auto_61990 ) ) ( not ( = ?auto_61984 ?auto_61985 ) ) ( not ( = ?auto_61984 ?auto_61986 ) ) ( not ( = ?auto_61984 ?auto_61987 ) ) ( not ( = ?auto_61984 ?auto_61988 ) ) ( not ( = ?auto_61984 ?auto_61989 ) ) ( not ( = ?auto_61984 ?auto_61990 ) ) ( not ( = ?auto_61985 ?auto_61986 ) ) ( not ( = ?auto_61985 ?auto_61987 ) ) ( not ( = ?auto_61985 ?auto_61988 ) ) ( not ( = ?auto_61985 ?auto_61989 ) ) ( not ( = ?auto_61985 ?auto_61990 ) ) ( not ( = ?auto_61986 ?auto_61987 ) ) ( not ( = ?auto_61986 ?auto_61988 ) ) ( not ( = ?auto_61986 ?auto_61989 ) ) ( not ( = ?auto_61986 ?auto_61990 ) ) ( not ( = ?auto_61987 ?auto_61988 ) ) ( not ( = ?auto_61987 ?auto_61989 ) ) ( not ( = ?auto_61987 ?auto_61990 ) ) ( not ( = ?auto_61988 ?auto_61989 ) ) ( not ( = ?auto_61988 ?auto_61990 ) ) ( not ( = ?auto_61989 ?auto_61990 ) ) ( ON ?auto_61988 ?auto_61989 ) ( ON ?auto_61987 ?auto_61988 ) ( ON ?auto_61986 ?auto_61987 ) ( ON ?auto_61985 ?auto_61986 ) ( ON ?auto_61984 ?auto_61985 ) ( ON ?auto_61983 ?auto_61984 ) ( ON ?auto_61982 ?auto_61983 ) ( CLEAR ?auto_61982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61982 )
      ( MAKE-8PILE ?auto_61982 ?auto_61983 ?auto_61984 ?auto_61985 ?auto_61986 ?auto_61987 ?auto_61988 ?auto_61989 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62017 - BLOCK
      ?auto_62018 - BLOCK
      ?auto_62019 - BLOCK
      ?auto_62020 - BLOCK
      ?auto_62021 - BLOCK
      ?auto_62022 - BLOCK
      ?auto_62023 - BLOCK
      ?auto_62024 - BLOCK
      ?auto_62025 - BLOCK
    )
    :vars
    (
      ?auto_62026 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_62024 ) ( ON ?auto_62025 ?auto_62026 ) ( CLEAR ?auto_62025 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62017 ) ( ON ?auto_62018 ?auto_62017 ) ( ON ?auto_62019 ?auto_62018 ) ( ON ?auto_62020 ?auto_62019 ) ( ON ?auto_62021 ?auto_62020 ) ( ON ?auto_62022 ?auto_62021 ) ( ON ?auto_62023 ?auto_62022 ) ( ON ?auto_62024 ?auto_62023 ) ( not ( = ?auto_62017 ?auto_62018 ) ) ( not ( = ?auto_62017 ?auto_62019 ) ) ( not ( = ?auto_62017 ?auto_62020 ) ) ( not ( = ?auto_62017 ?auto_62021 ) ) ( not ( = ?auto_62017 ?auto_62022 ) ) ( not ( = ?auto_62017 ?auto_62023 ) ) ( not ( = ?auto_62017 ?auto_62024 ) ) ( not ( = ?auto_62017 ?auto_62025 ) ) ( not ( = ?auto_62017 ?auto_62026 ) ) ( not ( = ?auto_62018 ?auto_62019 ) ) ( not ( = ?auto_62018 ?auto_62020 ) ) ( not ( = ?auto_62018 ?auto_62021 ) ) ( not ( = ?auto_62018 ?auto_62022 ) ) ( not ( = ?auto_62018 ?auto_62023 ) ) ( not ( = ?auto_62018 ?auto_62024 ) ) ( not ( = ?auto_62018 ?auto_62025 ) ) ( not ( = ?auto_62018 ?auto_62026 ) ) ( not ( = ?auto_62019 ?auto_62020 ) ) ( not ( = ?auto_62019 ?auto_62021 ) ) ( not ( = ?auto_62019 ?auto_62022 ) ) ( not ( = ?auto_62019 ?auto_62023 ) ) ( not ( = ?auto_62019 ?auto_62024 ) ) ( not ( = ?auto_62019 ?auto_62025 ) ) ( not ( = ?auto_62019 ?auto_62026 ) ) ( not ( = ?auto_62020 ?auto_62021 ) ) ( not ( = ?auto_62020 ?auto_62022 ) ) ( not ( = ?auto_62020 ?auto_62023 ) ) ( not ( = ?auto_62020 ?auto_62024 ) ) ( not ( = ?auto_62020 ?auto_62025 ) ) ( not ( = ?auto_62020 ?auto_62026 ) ) ( not ( = ?auto_62021 ?auto_62022 ) ) ( not ( = ?auto_62021 ?auto_62023 ) ) ( not ( = ?auto_62021 ?auto_62024 ) ) ( not ( = ?auto_62021 ?auto_62025 ) ) ( not ( = ?auto_62021 ?auto_62026 ) ) ( not ( = ?auto_62022 ?auto_62023 ) ) ( not ( = ?auto_62022 ?auto_62024 ) ) ( not ( = ?auto_62022 ?auto_62025 ) ) ( not ( = ?auto_62022 ?auto_62026 ) ) ( not ( = ?auto_62023 ?auto_62024 ) ) ( not ( = ?auto_62023 ?auto_62025 ) ) ( not ( = ?auto_62023 ?auto_62026 ) ) ( not ( = ?auto_62024 ?auto_62025 ) ) ( not ( = ?auto_62024 ?auto_62026 ) ) ( not ( = ?auto_62025 ?auto_62026 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62025 ?auto_62026 )
      ( !STACK ?auto_62025 ?auto_62024 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62036 - BLOCK
      ?auto_62037 - BLOCK
      ?auto_62038 - BLOCK
      ?auto_62039 - BLOCK
      ?auto_62040 - BLOCK
      ?auto_62041 - BLOCK
      ?auto_62042 - BLOCK
      ?auto_62043 - BLOCK
      ?auto_62044 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_62043 ) ( ON-TABLE ?auto_62044 ) ( CLEAR ?auto_62044 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62036 ) ( ON ?auto_62037 ?auto_62036 ) ( ON ?auto_62038 ?auto_62037 ) ( ON ?auto_62039 ?auto_62038 ) ( ON ?auto_62040 ?auto_62039 ) ( ON ?auto_62041 ?auto_62040 ) ( ON ?auto_62042 ?auto_62041 ) ( ON ?auto_62043 ?auto_62042 ) ( not ( = ?auto_62036 ?auto_62037 ) ) ( not ( = ?auto_62036 ?auto_62038 ) ) ( not ( = ?auto_62036 ?auto_62039 ) ) ( not ( = ?auto_62036 ?auto_62040 ) ) ( not ( = ?auto_62036 ?auto_62041 ) ) ( not ( = ?auto_62036 ?auto_62042 ) ) ( not ( = ?auto_62036 ?auto_62043 ) ) ( not ( = ?auto_62036 ?auto_62044 ) ) ( not ( = ?auto_62037 ?auto_62038 ) ) ( not ( = ?auto_62037 ?auto_62039 ) ) ( not ( = ?auto_62037 ?auto_62040 ) ) ( not ( = ?auto_62037 ?auto_62041 ) ) ( not ( = ?auto_62037 ?auto_62042 ) ) ( not ( = ?auto_62037 ?auto_62043 ) ) ( not ( = ?auto_62037 ?auto_62044 ) ) ( not ( = ?auto_62038 ?auto_62039 ) ) ( not ( = ?auto_62038 ?auto_62040 ) ) ( not ( = ?auto_62038 ?auto_62041 ) ) ( not ( = ?auto_62038 ?auto_62042 ) ) ( not ( = ?auto_62038 ?auto_62043 ) ) ( not ( = ?auto_62038 ?auto_62044 ) ) ( not ( = ?auto_62039 ?auto_62040 ) ) ( not ( = ?auto_62039 ?auto_62041 ) ) ( not ( = ?auto_62039 ?auto_62042 ) ) ( not ( = ?auto_62039 ?auto_62043 ) ) ( not ( = ?auto_62039 ?auto_62044 ) ) ( not ( = ?auto_62040 ?auto_62041 ) ) ( not ( = ?auto_62040 ?auto_62042 ) ) ( not ( = ?auto_62040 ?auto_62043 ) ) ( not ( = ?auto_62040 ?auto_62044 ) ) ( not ( = ?auto_62041 ?auto_62042 ) ) ( not ( = ?auto_62041 ?auto_62043 ) ) ( not ( = ?auto_62041 ?auto_62044 ) ) ( not ( = ?auto_62042 ?auto_62043 ) ) ( not ( = ?auto_62042 ?auto_62044 ) ) ( not ( = ?auto_62043 ?auto_62044 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_62044 )
      ( !STACK ?auto_62044 ?auto_62043 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62054 - BLOCK
      ?auto_62055 - BLOCK
      ?auto_62056 - BLOCK
      ?auto_62057 - BLOCK
      ?auto_62058 - BLOCK
      ?auto_62059 - BLOCK
      ?auto_62060 - BLOCK
      ?auto_62061 - BLOCK
      ?auto_62062 - BLOCK
    )
    :vars
    (
      ?auto_62063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62062 ?auto_62063 ) ( ON-TABLE ?auto_62054 ) ( ON ?auto_62055 ?auto_62054 ) ( ON ?auto_62056 ?auto_62055 ) ( ON ?auto_62057 ?auto_62056 ) ( ON ?auto_62058 ?auto_62057 ) ( ON ?auto_62059 ?auto_62058 ) ( ON ?auto_62060 ?auto_62059 ) ( not ( = ?auto_62054 ?auto_62055 ) ) ( not ( = ?auto_62054 ?auto_62056 ) ) ( not ( = ?auto_62054 ?auto_62057 ) ) ( not ( = ?auto_62054 ?auto_62058 ) ) ( not ( = ?auto_62054 ?auto_62059 ) ) ( not ( = ?auto_62054 ?auto_62060 ) ) ( not ( = ?auto_62054 ?auto_62061 ) ) ( not ( = ?auto_62054 ?auto_62062 ) ) ( not ( = ?auto_62054 ?auto_62063 ) ) ( not ( = ?auto_62055 ?auto_62056 ) ) ( not ( = ?auto_62055 ?auto_62057 ) ) ( not ( = ?auto_62055 ?auto_62058 ) ) ( not ( = ?auto_62055 ?auto_62059 ) ) ( not ( = ?auto_62055 ?auto_62060 ) ) ( not ( = ?auto_62055 ?auto_62061 ) ) ( not ( = ?auto_62055 ?auto_62062 ) ) ( not ( = ?auto_62055 ?auto_62063 ) ) ( not ( = ?auto_62056 ?auto_62057 ) ) ( not ( = ?auto_62056 ?auto_62058 ) ) ( not ( = ?auto_62056 ?auto_62059 ) ) ( not ( = ?auto_62056 ?auto_62060 ) ) ( not ( = ?auto_62056 ?auto_62061 ) ) ( not ( = ?auto_62056 ?auto_62062 ) ) ( not ( = ?auto_62056 ?auto_62063 ) ) ( not ( = ?auto_62057 ?auto_62058 ) ) ( not ( = ?auto_62057 ?auto_62059 ) ) ( not ( = ?auto_62057 ?auto_62060 ) ) ( not ( = ?auto_62057 ?auto_62061 ) ) ( not ( = ?auto_62057 ?auto_62062 ) ) ( not ( = ?auto_62057 ?auto_62063 ) ) ( not ( = ?auto_62058 ?auto_62059 ) ) ( not ( = ?auto_62058 ?auto_62060 ) ) ( not ( = ?auto_62058 ?auto_62061 ) ) ( not ( = ?auto_62058 ?auto_62062 ) ) ( not ( = ?auto_62058 ?auto_62063 ) ) ( not ( = ?auto_62059 ?auto_62060 ) ) ( not ( = ?auto_62059 ?auto_62061 ) ) ( not ( = ?auto_62059 ?auto_62062 ) ) ( not ( = ?auto_62059 ?auto_62063 ) ) ( not ( = ?auto_62060 ?auto_62061 ) ) ( not ( = ?auto_62060 ?auto_62062 ) ) ( not ( = ?auto_62060 ?auto_62063 ) ) ( not ( = ?auto_62061 ?auto_62062 ) ) ( not ( = ?auto_62061 ?auto_62063 ) ) ( not ( = ?auto_62062 ?auto_62063 ) ) ( CLEAR ?auto_62060 ) ( ON ?auto_62061 ?auto_62062 ) ( CLEAR ?auto_62061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_62054 ?auto_62055 ?auto_62056 ?auto_62057 ?auto_62058 ?auto_62059 ?auto_62060 ?auto_62061 )
      ( MAKE-9PILE ?auto_62054 ?auto_62055 ?auto_62056 ?auto_62057 ?auto_62058 ?auto_62059 ?auto_62060 ?auto_62061 ?auto_62062 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62073 - BLOCK
      ?auto_62074 - BLOCK
      ?auto_62075 - BLOCK
      ?auto_62076 - BLOCK
      ?auto_62077 - BLOCK
      ?auto_62078 - BLOCK
      ?auto_62079 - BLOCK
      ?auto_62080 - BLOCK
      ?auto_62081 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62081 ) ( ON-TABLE ?auto_62073 ) ( ON ?auto_62074 ?auto_62073 ) ( ON ?auto_62075 ?auto_62074 ) ( ON ?auto_62076 ?auto_62075 ) ( ON ?auto_62077 ?auto_62076 ) ( ON ?auto_62078 ?auto_62077 ) ( ON ?auto_62079 ?auto_62078 ) ( not ( = ?auto_62073 ?auto_62074 ) ) ( not ( = ?auto_62073 ?auto_62075 ) ) ( not ( = ?auto_62073 ?auto_62076 ) ) ( not ( = ?auto_62073 ?auto_62077 ) ) ( not ( = ?auto_62073 ?auto_62078 ) ) ( not ( = ?auto_62073 ?auto_62079 ) ) ( not ( = ?auto_62073 ?auto_62080 ) ) ( not ( = ?auto_62073 ?auto_62081 ) ) ( not ( = ?auto_62074 ?auto_62075 ) ) ( not ( = ?auto_62074 ?auto_62076 ) ) ( not ( = ?auto_62074 ?auto_62077 ) ) ( not ( = ?auto_62074 ?auto_62078 ) ) ( not ( = ?auto_62074 ?auto_62079 ) ) ( not ( = ?auto_62074 ?auto_62080 ) ) ( not ( = ?auto_62074 ?auto_62081 ) ) ( not ( = ?auto_62075 ?auto_62076 ) ) ( not ( = ?auto_62075 ?auto_62077 ) ) ( not ( = ?auto_62075 ?auto_62078 ) ) ( not ( = ?auto_62075 ?auto_62079 ) ) ( not ( = ?auto_62075 ?auto_62080 ) ) ( not ( = ?auto_62075 ?auto_62081 ) ) ( not ( = ?auto_62076 ?auto_62077 ) ) ( not ( = ?auto_62076 ?auto_62078 ) ) ( not ( = ?auto_62076 ?auto_62079 ) ) ( not ( = ?auto_62076 ?auto_62080 ) ) ( not ( = ?auto_62076 ?auto_62081 ) ) ( not ( = ?auto_62077 ?auto_62078 ) ) ( not ( = ?auto_62077 ?auto_62079 ) ) ( not ( = ?auto_62077 ?auto_62080 ) ) ( not ( = ?auto_62077 ?auto_62081 ) ) ( not ( = ?auto_62078 ?auto_62079 ) ) ( not ( = ?auto_62078 ?auto_62080 ) ) ( not ( = ?auto_62078 ?auto_62081 ) ) ( not ( = ?auto_62079 ?auto_62080 ) ) ( not ( = ?auto_62079 ?auto_62081 ) ) ( not ( = ?auto_62080 ?auto_62081 ) ) ( CLEAR ?auto_62079 ) ( ON ?auto_62080 ?auto_62081 ) ( CLEAR ?auto_62080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_62073 ?auto_62074 ?auto_62075 ?auto_62076 ?auto_62077 ?auto_62078 ?auto_62079 ?auto_62080 )
      ( MAKE-9PILE ?auto_62073 ?auto_62074 ?auto_62075 ?auto_62076 ?auto_62077 ?auto_62078 ?auto_62079 ?auto_62080 ?auto_62081 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62091 - BLOCK
      ?auto_62092 - BLOCK
      ?auto_62093 - BLOCK
      ?auto_62094 - BLOCK
      ?auto_62095 - BLOCK
      ?auto_62096 - BLOCK
      ?auto_62097 - BLOCK
      ?auto_62098 - BLOCK
      ?auto_62099 - BLOCK
    )
    :vars
    (
      ?auto_62100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62099 ?auto_62100 ) ( ON-TABLE ?auto_62091 ) ( ON ?auto_62092 ?auto_62091 ) ( ON ?auto_62093 ?auto_62092 ) ( ON ?auto_62094 ?auto_62093 ) ( ON ?auto_62095 ?auto_62094 ) ( ON ?auto_62096 ?auto_62095 ) ( not ( = ?auto_62091 ?auto_62092 ) ) ( not ( = ?auto_62091 ?auto_62093 ) ) ( not ( = ?auto_62091 ?auto_62094 ) ) ( not ( = ?auto_62091 ?auto_62095 ) ) ( not ( = ?auto_62091 ?auto_62096 ) ) ( not ( = ?auto_62091 ?auto_62097 ) ) ( not ( = ?auto_62091 ?auto_62098 ) ) ( not ( = ?auto_62091 ?auto_62099 ) ) ( not ( = ?auto_62091 ?auto_62100 ) ) ( not ( = ?auto_62092 ?auto_62093 ) ) ( not ( = ?auto_62092 ?auto_62094 ) ) ( not ( = ?auto_62092 ?auto_62095 ) ) ( not ( = ?auto_62092 ?auto_62096 ) ) ( not ( = ?auto_62092 ?auto_62097 ) ) ( not ( = ?auto_62092 ?auto_62098 ) ) ( not ( = ?auto_62092 ?auto_62099 ) ) ( not ( = ?auto_62092 ?auto_62100 ) ) ( not ( = ?auto_62093 ?auto_62094 ) ) ( not ( = ?auto_62093 ?auto_62095 ) ) ( not ( = ?auto_62093 ?auto_62096 ) ) ( not ( = ?auto_62093 ?auto_62097 ) ) ( not ( = ?auto_62093 ?auto_62098 ) ) ( not ( = ?auto_62093 ?auto_62099 ) ) ( not ( = ?auto_62093 ?auto_62100 ) ) ( not ( = ?auto_62094 ?auto_62095 ) ) ( not ( = ?auto_62094 ?auto_62096 ) ) ( not ( = ?auto_62094 ?auto_62097 ) ) ( not ( = ?auto_62094 ?auto_62098 ) ) ( not ( = ?auto_62094 ?auto_62099 ) ) ( not ( = ?auto_62094 ?auto_62100 ) ) ( not ( = ?auto_62095 ?auto_62096 ) ) ( not ( = ?auto_62095 ?auto_62097 ) ) ( not ( = ?auto_62095 ?auto_62098 ) ) ( not ( = ?auto_62095 ?auto_62099 ) ) ( not ( = ?auto_62095 ?auto_62100 ) ) ( not ( = ?auto_62096 ?auto_62097 ) ) ( not ( = ?auto_62096 ?auto_62098 ) ) ( not ( = ?auto_62096 ?auto_62099 ) ) ( not ( = ?auto_62096 ?auto_62100 ) ) ( not ( = ?auto_62097 ?auto_62098 ) ) ( not ( = ?auto_62097 ?auto_62099 ) ) ( not ( = ?auto_62097 ?auto_62100 ) ) ( not ( = ?auto_62098 ?auto_62099 ) ) ( not ( = ?auto_62098 ?auto_62100 ) ) ( not ( = ?auto_62099 ?auto_62100 ) ) ( ON ?auto_62098 ?auto_62099 ) ( CLEAR ?auto_62096 ) ( ON ?auto_62097 ?auto_62098 ) ( CLEAR ?auto_62097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_62091 ?auto_62092 ?auto_62093 ?auto_62094 ?auto_62095 ?auto_62096 ?auto_62097 )
      ( MAKE-9PILE ?auto_62091 ?auto_62092 ?auto_62093 ?auto_62094 ?auto_62095 ?auto_62096 ?auto_62097 ?auto_62098 ?auto_62099 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62110 - BLOCK
      ?auto_62111 - BLOCK
      ?auto_62112 - BLOCK
      ?auto_62113 - BLOCK
      ?auto_62114 - BLOCK
      ?auto_62115 - BLOCK
      ?auto_62116 - BLOCK
      ?auto_62117 - BLOCK
      ?auto_62118 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62118 ) ( ON-TABLE ?auto_62110 ) ( ON ?auto_62111 ?auto_62110 ) ( ON ?auto_62112 ?auto_62111 ) ( ON ?auto_62113 ?auto_62112 ) ( ON ?auto_62114 ?auto_62113 ) ( ON ?auto_62115 ?auto_62114 ) ( not ( = ?auto_62110 ?auto_62111 ) ) ( not ( = ?auto_62110 ?auto_62112 ) ) ( not ( = ?auto_62110 ?auto_62113 ) ) ( not ( = ?auto_62110 ?auto_62114 ) ) ( not ( = ?auto_62110 ?auto_62115 ) ) ( not ( = ?auto_62110 ?auto_62116 ) ) ( not ( = ?auto_62110 ?auto_62117 ) ) ( not ( = ?auto_62110 ?auto_62118 ) ) ( not ( = ?auto_62111 ?auto_62112 ) ) ( not ( = ?auto_62111 ?auto_62113 ) ) ( not ( = ?auto_62111 ?auto_62114 ) ) ( not ( = ?auto_62111 ?auto_62115 ) ) ( not ( = ?auto_62111 ?auto_62116 ) ) ( not ( = ?auto_62111 ?auto_62117 ) ) ( not ( = ?auto_62111 ?auto_62118 ) ) ( not ( = ?auto_62112 ?auto_62113 ) ) ( not ( = ?auto_62112 ?auto_62114 ) ) ( not ( = ?auto_62112 ?auto_62115 ) ) ( not ( = ?auto_62112 ?auto_62116 ) ) ( not ( = ?auto_62112 ?auto_62117 ) ) ( not ( = ?auto_62112 ?auto_62118 ) ) ( not ( = ?auto_62113 ?auto_62114 ) ) ( not ( = ?auto_62113 ?auto_62115 ) ) ( not ( = ?auto_62113 ?auto_62116 ) ) ( not ( = ?auto_62113 ?auto_62117 ) ) ( not ( = ?auto_62113 ?auto_62118 ) ) ( not ( = ?auto_62114 ?auto_62115 ) ) ( not ( = ?auto_62114 ?auto_62116 ) ) ( not ( = ?auto_62114 ?auto_62117 ) ) ( not ( = ?auto_62114 ?auto_62118 ) ) ( not ( = ?auto_62115 ?auto_62116 ) ) ( not ( = ?auto_62115 ?auto_62117 ) ) ( not ( = ?auto_62115 ?auto_62118 ) ) ( not ( = ?auto_62116 ?auto_62117 ) ) ( not ( = ?auto_62116 ?auto_62118 ) ) ( not ( = ?auto_62117 ?auto_62118 ) ) ( ON ?auto_62117 ?auto_62118 ) ( CLEAR ?auto_62115 ) ( ON ?auto_62116 ?auto_62117 ) ( CLEAR ?auto_62116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_62110 ?auto_62111 ?auto_62112 ?auto_62113 ?auto_62114 ?auto_62115 ?auto_62116 )
      ( MAKE-9PILE ?auto_62110 ?auto_62111 ?auto_62112 ?auto_62113 ?auto_62114 ?auto_62115 ?auto_62116 ?auto_62117 ?auto_62118 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62128 - BLOCK
      ?auto_62129 - BLOCK
      ?auto_62130 - BLOCK
      ?auto_62131 - BLOCK
      ?auto_62132 - BLOCK
      ?auto_62133 - BLOCK
      ?auto_62134 - BLOCK
      ?auto_62135 - BLOCK
      ?auto_62136 - BLOCK
    )
    :vars
    (
      ?auto_62137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62136 ?auto_62137 ) ( ON-TABLE ?auto_62128 ) ( ON ?auto_62129 ?auto_62128 ) ( ON ?auto_62130 ?auto_62129 ) ( ON ?auto_62131 ?auto_62130 ) ( ON ?auto_62132 ?auto_62131 ) ( not ( = ?auto_62128 ?auto_62129 ) ) ( not ( = ?auto_62128 ?auto_62130 ) ) ( not ( = ?auto_62128 ?auto_62131 ) ) ( not ( = ?auto_62128 ?auto_62132 ) ) ( not ( = ?auto_62128 ?auto_62133 ) ) ( not ( = ?auto_62128 ?auto_62134 ) ) ( not ( = ?auto_62128 ?auto_62135 ) ) ( not ( = ?auto_62128 ?auto_62136 ) ) ( not ( = ?auto_62128 ?auto_62137 ) ) ( not ( = ?auto_62129 ?auto_62130 ) ) ( not ( = ?auto_62129 ?auto_62131 ) ) ( not ( = ?auto_62129 ?auto_62132 ) ) ( not ( = ?auto_62129 ?auto_62133 ) ) ( not ( = ?auto_62129 ?auto_62134 ) ) ( not ( = ?auto_62129 ?auto_62135 ) ) ( not ( = ?auto_62129 ?auto_62136 ) ) ( not ( = ?auto_62129 ?auto_62137 ) ) ( not ( = ?auto_62130 ?auto_62131 ) ) ( not ( = ?auto_62130 ?auto_62132 ) ) ( not ( = ?auto_62130 ?auto_62133 ) ) ( not ( = ?auto_62130 ?auto_62134 ) ) ( not ( = ?auto_62130 ?auto_62135 ) ) ( not ( = ?auto_62130 ?auto_62136 ) ) ( not ( = ?auto_62130 ?auto_62137 ) ) ( not ( = ?auto_62131 ?auto_62132 ) ) ( not ( = ?auto_62131 ?auto_62133 ) ) ( not ( = ?auto_62131 ?auto_62134 ) ) ( not ( = ?auto_62131 ?auto_62135 ) ) ( not ( = ?auto_62131 ?auto_62136 ) ) ( not ( = ?auto_62131 ?auto_62137 ) ) ( not ( = ?auto_62132 ?auto_62133 ) ) ( not ( = ?auto_62132 ?auto_62134 ) ) ( not ( = ?auto_62132 ?auto_62135 ) ) ( not ( = ?auto_62132 ?auto_62136 ) ) ( not ( = ?auto_62132 ?auto_62137 ) ) ( not ( = ?auto_62133 ?auto_62134 ) ) ( not ( = ?auto_62133 ?auto_62135 ) ) ( not ( = ?auto_62133 ?auto_62136 ) ) ( not ( = ?auto_62133 ?auto_62137 ) ) ( not ( = ?auto_62134 ?auto_62135 ) ) ( not ( = ?auto_62134 ?auto_62136 ) ) ( not ( = ?auto_62134 ?auto_62137 ) ) ( not ( = ?auto_62135 ?auto_62136 ) ) ( not ( = ?auto_62135 ?auto_62137 ) ) ( not ( = ?auto_62136 ?auto_62137 ) ) ( ON ?auto_62135 ?auto_62136 ) ( ON ?auto_62134 ?auto_62135 ) ( CLEAR ?auto_62132 ) ( ON ?auto_62133 ?auto_62134 ) ( CLEAR ?auto_62133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62128 ?auto_62129 ?auto_62130 ?auto_62131 ?auto_62132 ?auto_62133 )
      ( MAKE-9PILE ?auto_62128 ?auto_62129 ?auto_62130 ?auto_62131 ?auto_62132 ?auto_62133 ?auto_62134 ?auto_62135 ?auto_62136 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62147 - BLOCK
      ?auto_62148 - BLOCK
      ?auto_62149 - BLOCK
      ?auto_62150 - BLOCK
      ?auto_62151 - BLOCK
      ?auto_62152 - BLOCK
      ?auto_62153 - BLOCK
      ?auto_62154 - BLOCK
      ?auto_62155 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62155 ) ( ON-TABLE ?auto_62147 ) ( ON ?auto_62148 ?auto_62147 ) ( ON ?auto_62149 ?auto_62148 ) ( ON ?auto_62150 ?auto_62149 ) ( ON ?auto_62151 ?auto_62150 ) ( not ( = ?auto_62147 ?auto_62148 ) ) ( not ( = ?auto_62147 ?auto_62149 ) ) ( not ( = ?auto_62147 ?auto_62150 ) ) ( not ( = ?auto_62147 ?auto_62151 ) ) ( not ( = ?auto_62147 ?auto_62152 ) ) ( not ( = ?auto_62147 ?auto_62153 ) ) ( not ( = ?auto_62147 ?auto_62154 ) ) ( not ( = ?auto_62147 ?auto_62155 ) ) ( not ( = ?auto_62148 ?auto_62149 ) ) ( not ( = ?auto_62148 ?auto_62150 ) ) ( not ( = ?auto_62148 ?auto_62151 ) ) ( not ( = ?auto_62148 ?auto_62152 ) ) ( not ( = ?auto_62148 ?auto_62153 ) ) ( not ( = ?auto_62148 ?auto_62154 ) ) ( not ( = ?auto_62148 ?auto_62155 ) ) ( not ( = ?auto_62149 ?auto_62150 ) ) ( not ( = ?auto_62149 ?auto_62151 ) ) ( not ( = ?auto_62149 ?auto_62152 ) ) ( not ( = ?auto_62149 ?auto_62153 ) ) ( not ( = ?auto_62149 ?auto_62154 ) ) ( not ( = ?auto_62149 ?auto_62155 ) ) ( not ( = ?auto_62150 ?auto_62151 ) ) ( not ( = ?auto_62150 ?auto_62152 ) ) ( not ( = ?auto_62150 ?auto_62153 ) ) ( not ( = ?auto_62150 ?auto_62154 ) ) ( not ( = ?auto_62150 ?auto_62155 ) ) ( not ( = ?auto_62151 ?auto_62152 ) ) ( not ( = ?auto_62151 ?auto_62153 ) ) ( not ( = ?auto_62151 ?auto_62154 ) ) ( not ( = ?auto_62151 ?auto_62155 ) ) ( not ( = ?auto_62152 ?auto_62153 ) ) ( not ( = ?auto_62152 ?auto_62154 ) ) ( not ( = ?auto_62152 ?auto_62155 ) ) ( not ( = ?auto_62153 ?auto_62154 ) ) ( not ( = ?auto_62153 ?auto_62155 ) ) ( not ( = ?auto_62154 ?auto_62155 ) ) ( ON ?auto_62154 ?auto_62155 ) ( ON ?auto_62153 ?auto_62154 ) ( CLEAR ?auto_62151 ) ( ON ?auto_62152 ?auto_62153 ) ( CLEAR ?auto_62152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62147 ?auto_62148 ?auto_62149 ?auto_62150 ?auto_62151 ?auto_62152 )
      ( MAKE-9PILE ?auto_62147 ?auto_62148 ?auto_62149 ?auto_62150 ?auto_62151 ?auto_62152 ?auto_62153 ?auto_62154 ?auto_62155 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62165 - BLOCK
      ?auto_62166 - BLOCK
      ?auto_62167 - BLOCK
      ?auto_62168 - BLOCK
      ?auto_62169 - BLOCK
      ?auto_62170 - BLOCK
      ?auto_62171 - BLOCK
      ?auto_62172 - BLOCK
      ?auto_62173 - BLOCK
    )
    :vars
    (
      ?auto_62174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62173 ?auto_62174 ) ( ON-TABLE ?auto_62165 ) ( ON ?auto_62166 ?auto_62165 ) ( ON ?auto_62167 ?auto_62166 ) ( ON ?auto_62168 ?auto_62167 ) ( not ( = ?auto_62165 ?auto_62166 ) ) ( not ( = ?auto_62165 ?auto_62167 ) ) ( not ( = ?auto_62165 ?auto_62168 ) ) ( not ( = ?auto_62165 ?auto_62169 ) ) ( not ( = ?auto_62165 ?auto_62170 ) ) ( not ( = ?auto_62165 ?auto_62171 ) ) ( not ( = ?auto_62165 ?auto_62172 ) ) ( not ( = ?auto_62165 ?auto_62173 ) ) ( not ( = ?auto_62165 ?auto_62174 ) ) ( not ( = ?auto_62166 ?auto_62167 ) ) ( not ( = ?auto_62166 ?auto_62168 ) ) ( not ( = ?auto_62166 ?auto_62169 ) ) ( not ( = ?auto_62166 ?auto_62170 ) ) ( not ( = ?auto_62166 ?auto_62171 ) ) ( not ( = ?auto_62166 ?auto_62172 ) ) ( not ( = ?auto_62166 ?auto_62173 ) ) ( not ( = ?auto_62166 ?auto_62174 ) ) ( not ( = ?auto_62167 ?auto_62168 ) ) ( not ( = ?auto_62167 ?auto_62169 ) ) ( not ( = ?auto_62167 ?auto_62170 ) ) ( not ( = ?auto_62167 ?auto_62171 ) ) ( not ( = ?auto_62167 ?auto_62172 ) ) ( not ( = ?auto_62167 ?auto_62173 ) ) ( not ( = ?auto_62167 ?auto_62174 ) ) ( not ( = ?auto_62168 ?auto_62169 ) ) ( not ( = ?auto_62168 ?auto_62170 ) ) ( not ( = ?auto_62168 ?auto_62171 ) ) ( not ( = ?auto_62168 ?auto_62172 ) ) ( not ( = ?auto_62168 ?auto_62173 ) ) ( not ( = ?auto_62168 ?auto_62174 ) ) ( not ( = ?auto_62169 ?auto_62170 ) ) ( not ( = ?auto_62169 ?auto_62171 ) ) ( not ( = ?auto_62169 ?auto_62172 ) ) ( not ( = ?auto_62169 ?auto_62173 ) ) ( not ( = ?auto_62169 ?auto_62174 ) ) ( not ( = ?auto_62170 ?auto_62171 ) ) ( not ( = ?auto_62170 ?auto_62172 ) ) ( not ( = ?auto_62170 ?auto_62173 ) ) ( not ( = ?auto_62170 ?auto_62174 ) ) ( not ( = ?auto_62171 ?auto_62172 ) ) ( not ( = ?auto_62171 ?auto_62173 ) ) ( not ( = ?auto_62171 ?auto_62174 ) ) ( not ( = ?auto_62172 ?auto_62173 ) ) ( not ( = ?auto_62172 ?auto_62174 ) ) ( not ( = ?auto_62173 ?auto_62174 ) ) ( ON ?auto_62172 ?auto_62173 ) ( ON ?auto_62171 ?auto_62172 ) ( ON ?auto_62170 ?auto_62171 ) ( CLEAR ?auto_62168 ) ( ON ?auto_62169 ?auto_62170 ) ( CLEAR ?auto_62169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62165 ?auto_62166 ?auto_62167 ?auto_62168 ?auto_62169 )
      ( MAKE-9PILE ?auto_62165 ?auto_62166 ?auto_62167 ?auto_62168 ?auto_62169 ?auto_62170 ?auto_62171 ?auto_62172 ?auto_62173 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62184 - BLOCK
      ?auto_62185 - BLOCK
      ?auto_62186 - BLOCK
      ?auto_62187 - BLOCK
      ?auto_62188 - BLOCK
      ?auto_62189 - BLOCK
      ?auto_62190 - BLOCK
      ?auto_62191 - BLOCK
      ?auto_62192 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62192 ) ( ON-TABLE ?auto_62184 ) ( ON ?auto_62185 ?auto_62184 ) ( ON ?auto_62186 ?auto_62185 ) ( ON ?auto_62187 ?auto_62186 ) ( not ( = ?auto_62184 ?auto_62185 ) ) ( not ( = ?auto_62184 ?auto_62186 ) ) ( not ( = ?auto_62184 ?auto_62187 ) ) ( not ( = ?auto_62184 ?auto_62188 ) ) ( not ( = ?auto_62184 ?auto_62189 ) ) ( not ( = ?auto_62184 ?auto_62190 ) ) ( not ( = ?auto_62184 ?auto_62191 ) ) ( not ( = ?auto_62184 ?auto_62192 ) ) ( not ( = ?auto_62185 ?auto_62186 ) ) ( not ( = ?auto_62185 ?auto_62187 ) ) ( not ( = ?auto_62185 ?auto_62188 ) ) ( not ( = ?auto_62185 ?auto_62189 ) ) ( not ( = ?auto_62185 ?auto_62190 ) ) ( not ( = ?auto_62185 ?auto_62191 ) ) ( not ( = ?auto_62185 ?auto_62192 ) ) ( not ( = ?auto_62186 ?auto_62187 ) ) ( not ( = ?auto_62186 ?auto_62188 ) ) ( not ( = ?auto_62186 ?auto_62189 ) ) ( not ( = ?auto_62186 ?auto_62190 ) ) ( not ( = ?auto_62186 ?auto_62191 ) ) ( not ( = ?auto_62186 ?auto_62192 ) ) ( not ( = ?auto_62187 ?auto_62188 ) ) ( not ( = ?auto_62187 ?auto_62189 ) ) ( not ( = ?auto_62187 ?auto_62190 ) ) ( not ( = ?auto_62187 ?auto_62191 ) ) ( not ( = ?auto_62187 ?auto_62192 ) ) ( not ( = ?auto_62188 ?auto_62189 ) ) ( not ( = ?auto_62188 ?auto_62190 ) ) ( not ( = ?auto_62188 ?auto_62191 ) ) ( not ( = ?auto_62188 ?auto_62192 ) ) ( not ( = ?auto_62189 ?auto_62190 ) ) ( not ( = ?auto_62189 ?auto_62191 ) ) ( not ( = ?auto_62189 ?auto_62192 ) ) ( not ( = ?auto_62190 ?auto_62191 ) ) ( not ( = ?auto_62190 ?auto_62192 ) ) ( not ( = ?auto_62191 ?auto_62192 ) ) ( ON ?auto_62191 ?auto_62192 ) ( ON ?auto_62190 ?auto_62191 ) ( ON ?auto_62189 ?auto_62190 ) ( CLEAR ?auto_62187 ) ( ON ?auto_62188 ?auto_62189 ) ( CLEAR ?auto_62188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62184 ?auto_62185 ?auto_62186 ?auto_62187 ?auto_62188 )
      ( MAKE-9PILE ?auto_62184 ?auto_62185 ?auto_62186 ?auto_62187 ?auto_62188 ?auto_62189 ?auto_62190 ?auto_62191 ?auto_62192 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62202 - BLOCK
      ?auto_62203 - BLOCK
      ?auto_62204 - BLOCK
      ?auto_62205 - BLOCK
      ?auto_62206 - BLOCK
      ?auto_62207 - BLOCK
      ?auto_62208 - BLOCK
      ?auto_62209 - BLOCK
      ?auto_62210 - BLOCK
    )
    :vars
    (
      ?auto_62211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62210 ?auto_62211 ) ( ON-TABLE ?auto_62202 ) ( ON ?auto_62203 ?auto_62202 ) ( ON ?auto_62204 ?auto_62203 ) ( not ( = ?auto_62202 ?auto_62203 ) ) ( not ( = ?auto_62202 ?auto_62204 ) ) ( not ( = ?auto_62202 ?auto_62205 ) ) ( not ( = ?auto_62202 ?auto_62206 ) ) ( not ( = ?auto_62202 ?auto_62207 ) ) ( not ( = ?auto_62202 ?auto_62208 ) ) ( not ( = ?auto_62202 ?auto_62209 ) ) ( not ( = ?auto_62202 ?auto_62210 ) ) ( not ( = ?auto_62202 ?auto_62211 ) ) ( not ( = ?auto_62203 ?auto_62204 ) ) ( not ( = ?auto_62203 ?auto_62205 ) ) ( not ( = ?auto_62203 ?auto_62206 ) ) ( not ( = ?auto_62203 ?auto_62207 ) ) ( not ( = ?auto_62203 ?auto_62208 ) ) ( not ( = ?auto_62203 ?auto_62209 ) ) ( not ( = ?auto_62203 ?auto_62210 ) ) ( not ( = ?auto_62203 ?auto_62211 ) ) ( not ( = ?auto_62204 ?auto_62205 ) ) ( not ( = ?auto_62204 ?auto_62206 ) ) ( not ( = ?auto_62204 ?auto_62207 ) ) ( not ( = ?auto_62204 ?auto_62208 ) ) ( not ( = ?auto_62204 ?auto_62209 ) ) ( not ( = ?auto_62204 ?auto_62210 ) ) ( not ( = ?auto_62204 ?auto_62211 ) ) ( not ( = ?auto_62205 ?auto_62206 ) ) ( not ( = ?auto_62205 ?auto_62207 ) ) ( not ( = ?auto_62205 ?auto_62208 ) ) ( not ( = ?auto_62205 ?auto_62209 ) ) ( not ( = ?auto_62205 ?auto_62210 ) ) ( not ( = ?auto_62205 ?auto_62211 ) ) ( not ( = ?auto_62206 ?auto_62207 ) ) ( not ( = ?auto_62206 ?auto_62208 ) ) ( not ( = ?auto_62206 ?auto_62209 ) ) ( not ( = ?auto_62206 ?auto_62210 ) ) ( not ( = ?auto_62206 ?auto_62211 ) ) ( not ( = ?auto_62207 ?auto_62208 ) ) ( not ( = ?auto_62207 ?auto_62209 ) ) ( not ( = ?auto_62207 ?auto_62210 ) ) ( not ( = ?auto_62207 ?auto_62211 ) ) ( not ( = ?auto_62208 ?auto_62209 ) ) ( not ( = ?auto_62208 ?auto_62210 ) ) ( not ( = ?auto_62208 ?auto_62211 ) ) ( not ( = ?auto_62209 ?auto_62210 ) ) ( not ( = ?auto_62209 ?auto_62211 ) ) ( not ( = ?auto_62210 ?auto_62211 ) ) ( ON ?auto_62209 ?auto_62210 ) ( ON ?auto_62208 ?auto_62209 ) ( ON ?auto_62207 ?auto_62208 ) ( ON ?auto_62206 ?auto_62207 ) ( CLEAR ?auto_62204 ) ( ON ?auto_62205 ?auto_62206 ) ( CLEAR ?auto_62205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62202 ?auto_62203 ?auto_62204 ?auto_62205 )
      ( MAKE-9PILE ?auto_62202 ?auto_62203 ?auto_62204 ?auto_62205 ?auto_62206 ?auto_62207 ?auto_62208 ?auto_62209 ?auto_62210 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62221 - BLOCK
      ?auto_62222 - BLOCK
      ?auto_62223 - BLOCK
      ?auto_62224 - BLOCK
      ?auto_62225 - BLOCK
      ?auto_62226 - BLOCK
      ?auto_62227 - BLOCK
      ?auto_62228 - BLOCK
      ?auto_62229 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62229 ) ( ON-TABLE ?auto_62221 ) ( ON ?auto_62222 ?auto_62221 ) ( ON ?auto_62223 ?auto_62222 ) ( not ( = ?auto_62221 ?auto_62222 ) ) ( not ( = ?auto_62221 ?auto_62223 ) ) ( not ( = ?auto_62221 ?auto_62224 ) ) ( not ( = ?auto_62221 ?auto_62225 ) ) ( not ( = ?auto_62221 ?auto_62226 ) ) ( not ( = ?auto_62221 ?auto_62227 ) ) ( not ( = ?auto_62221 ?auto_62228 ) ) ( not ( = ?auto_62221 ?auto_62229 ) ) ( not ( = ?auto_62222 ?auto_62223 ) ) ( not ( = ?auto_62222 ?auto_62224 ) ) ( not ( = ?auto_62222 ?auto_62225 ) ) ( not ( = ?auto_62222 ?auto_62226 ) ) ( not ( = ?auto_62222 ?auto_62227 ) ) ( not ( = ?auto_62222 ?auto_62228 ) ) ( not ( = ?auto_62222 ?auto_62229 ) ) ( not ( = ?auto_62223 ?auto_62224 ) ) ( not ( = ?auto_62223 ?auto_62225 ) ) ( not ( = ?auto_62223 ?auto_62226 ) ) ( not ( = ?auto_62223 ?auto_62227 ) ) ( not ( = ?auto_62223 ?auto_62228 ) ) ( not ( = ?auto_62223 ?auto_62229 ) ) ( not ( = ?auto_62224 ?auto_62225 ) ) ( not ( = ?auto_62224 ?auto_62226 ) ) ( not ( = ?auto_62224 ?auto_62227 ) ) ( not ( = ?auto_62224 ?auto_62228 ) ) ( not ( = ?auto_62224 ?auto_62229 ) ) ( not ( = ?auto_62225 ?auto_62226 ) ) ( not ( = ?auto_62225 ?auto_62227 ) ) ( not ( = ?auto_62225 ?auto_62228 ) ) ( not ( = ?auto_62225 ?auto_62229 ) ) ( not ( = ?auto_62226 ?auto_62227 ) ) ( not ( = ?auto_62226 ?auto_62228 ) ) ( not ( = ?auto_62226 ?auto_62229 ) ) ( not ( = ?auto_62227 ?auto_62228 ) ) ( not ( = ?auto_62227 ?auto_62229 ) ) ( not ( = ?auto_62228 ?auto_62229 ) ) ( ON ?auto_62228 ?auto_62229 ) ( ON ?auto_62227 ?auto_62228 ) ( ON ?auto_62226 ?auto_62227 ) ( ON ?auto_62225 ?auto_62226 ) ( CLEAR ?auto_62223 ) ( ON ?auto_62224 ?auto_62225 ) ( CLEAR ?auto_62224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62221 ?auto_62222 ?auto_62223 ?auto_62224 )
      ( MAKE-9PILE ?auto_62221 ?auto_62222 ?auto_62223 ?auto_62224 ?auto_62225 ?auto_62226 ?auto_62227 ?auto_62228 ?auto_62229 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62239 - BLOCK
      ?auto_62240 - BLOCK
      ?auto_62241 - BLOCK
      ?auto_62242 - BLOCK
      ?auto_62243 - BLOCK
      ?auto_62244 - BLOCK
      ?auto_62245 - BLOCK
      ?auto_62246 - BLOCK
      ?auto_62247 - BLOCK
    )
    :vars
    (
      ?auto_62248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62247 ?auto_62248 ) ( ON-TABLE ?auto_62239 ) ( ON ?auto_62240 ?auto_62239 ) ( not ( = ?auto_62239 ?auto_62240 ) ) ( not ( = ?auto_62239 ?auto_62241 ) ) ( not ( = ?auto_62239 ?auto_62242 ) ) ( not ( = ?auto_62239 ?auto_62243 ) ) ( not ( = ?auto_62239 ?auto_62244 ) ) ( not ( = ?auto_62239 ?auto_62245 ) ) ( not ( = ?auto_62239 ?auto_62246 ) ) ( not ( = ?auto_62239 ?auto_62247 ) ) ( not ( = ?auto_62239 ?auto_62248 ) ) ( not ( = ?auto_62240 ?auto_62241 ) ) ( not ( = ?auto_62240 ?auto_62242 ) ) ( not ( = ?auto_62240 ?auto_62243 ) ) ( not ( = ?auto_62240 ?auto_62244 ) ) ( not ( = ?auto_62240 ?auto_62245 ) ) ( not ( = ?auto_62240 ?auto_62246 ) ) ( not ( = ?auto_62240 ?auto_62247 ) ) ( not ( = ?auto_62240 ?auto_62248 ) ) ( not ( = ?auto_62241 ?auto_62242 ) ) ( not ( = ?auto_62241 ?auto_62243 ) ) ( not ( = ?auto_62241 ?auto_62244 ) ) ( not ( = ?auto_62241 ?auto_62245 ) ) ( not ( = ?auto_62241 ?auto_62246 ) ) ( not ( = ?auto_62241 ?auto_62247 ) ) ( not ( = ?auto_62241 ?auto_62248 ) ) ( not ( = ?auto_62242 ?auto_62243 ) ) ( not ( = ?auto_62242 ?auto_62244 ) ) ( not ( = ?auto_62242 ?auto_62245 ) ) ( not ( = ?auto_62242 ?auto_62246 ) ) ( not ( = ?auto_62242 ?auto_62247 ) ) ( not ( = ?auto_62242 ?auto_62248 ) ) ( not ( = ?auto_62243 ?auto_62244 ) ) ( not ( = ?auto_62243 ?auto_62245 ) ) ( not ( = ?auto_62243 ?auto_62246 ) ) ( not ( = ?auto_62243 ?auto_62247 ) ) ( not ( = ?auto_62243 ?auto_62248 ) ) ( not ( = ?auto_62244 ?auto_62245 ) ) ( not ( = ?auto_62244 ?auto_62246 ) ) ( not ( = ?auto_62244 ?auto_62247 ) ) ( not ( = ?auto_62244 ?auto_62248 ) ) ( not ( = ?auto_62245 ?auto_62246 ) ) ( not ( = ?auto_62245 ?auto_62247 ) ) ( not ( = ?auto_62245 ?auto_62248 ) ) ( not ( = ?auto_62246 ?auto_62247 ) ) ( not ( = ?auto_62246 ?auto_62248 ) ) ( not ( = ?auto_62247 ?auto_62248 ) ) ( ON ?auto_62246 ?auto_62247 ) ( ON ?auto_62245 ?auto_62246 ) ( ON ?auto_62244 ?auto_62245 ) ( ON ?auto_62243 ?auto_62244 ) ( ON ?auto_62242 ?auto_62243 ) ( CLEAR ?auto_62240 ) ( ON ?auto_62241 ?auto_62242 ) ( CLEAR ?auto_62241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62239 ?auto_62240 ?auto_62241 )
      ( MAKE-9PILE ?auto_62239 ?auto_62240 ?auto_62241 ?auto_62242 ?auto_62243 ?auto_62244 ?auto_62245 ?auto_62246 ?auto_62247 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62258 - BLOCK
      ?auto_62259 - BLOCK
      ?auto_62260 - BLOCK
      ?auto_62261 - BLOCK
      ?auto_62262 - BLOCK
      ?auto_62263 - BLOCK
      ?auto_62264 - BLOCK
      ?auto_62265 - BLOCK
      ?auto_62266 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62266 ) ( ON-TABLE ?auto_62258 ) ( ON ?auto_62259 ?auto_62258 ) ( not ( = ?auto_62258 ?auto_62259 ) ) ( not ( = ?auto_62258 ?auto_62260 ) ) ( not ( = ?auto_62258 ?auto_62261 ) ) ( not ( = ?auto_62258 ?auto_62262 ) ) ( not ( = ?auto_62258 ?auto_62263 ) ) ( not ( = ?auto_62258 ?auto_62264 ) ) ( not ( = ?auto_62258 ?auto_62265 ) ) ( not ( = ?auto_62258 ?auto_62266 ) ) ( not ( = ?auto_62259 ?auto_62260 ) ) ( not ( = ?auto_62259 ?auto_62261 ) ) ( not ( = ?auto_62259 ?auto_62262 ) ) ( not ( = ?auto_62259 ?auto_62263 ) ) ( not ( = ?auto_62259 ?auto_62264 ) ) ( not ( = ?auto_62259 ?auto_62265 ) ) ( not ( = ?auto_62259 ?auto_62266 ) ) ( not ( = ?auto_62260 ?auto_62261 ) ) ( not ( = ?auto_62260 ?auto_62262 ) ) ( not ( = ?auto_62260 ?auto_62263 ) ) ( not ( = ?auto_62260 ?auto_62264 ) ) ( not ( = ?auto_62260 ?auto_62265 ) ) ( not ( = ?auto_62260 ?auto_62266 ) ) ( not ( = ?auto_62261 ?auto_62262 ) ) ( not ( = ?auto_62261 ?auto_62263 ) ) ( not ( = ?auto_62261 ?auto_62264 ) ) ( not ( = ?auto_62261 ?auto_62265 ) ) ( not ( = ?auto_62261 ?auto_62266 ) ) ( not ( = ?auto_62262 ?auto_62263 ) ) ( not ( = ?auto_62262 ?auto_62264 ) ) ( not ( = ?auto_62262 ?auto_62265 ) ) ( not ( = ?auto_62262 ?auto_62266 ) ) ( not ( = ?auto_62263 ?auto_62264 ) ) ( not ( = ?auto_62263 ?auto_62265 ) ) ( not ( = ?auto_62263 ?auto_62266 ) ) ( not ( = ?auto_62264 ?auto_62265 ) ) ( not ( = ?auto_62264 ?auto_62266 ) ) ( not ( = ?auto_62265 ?auto_62266 ) ) ( ON ?auto_62265 ?auto_62266 ) ( ON ?auto_62264 ?auto_62265 ) ( ON ?auto_62263 ?auto_62264 ) ( ON ?auto_62262 ?auto_62263 ) ( ON ?auto_62261 ?auto_62262 ) ( CLEAR ?auto_62259 ) ( ON ?auto_62260 ?auto_62261 ) ( CLEAR ?auto_62260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62258 ?auto_62259 ?auto_62260 )
      ( MAKE-9PILE ?auto_62258 ?auto_62259 ?auto_62260 ?auto_62261 ?auto_62262 ?auto_62263 ?auto_62264 ?auto_62265 ?auto_62266 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62276 - BLOCK
      ?auto_62277 - BLOCK
      ?auto_62278 - BLOCK
      ?auto_62279 - BLOCK
      ?auto_62280 - BLOCK
      ?auto_62281 - BLOCK
      ?auto_62282 - BLOCK
      ?auto_62283 - BLOCK
      ?auto_62284 - BLOCK
    )
    :vars
    (
      ?auto_62285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62284 ?auto_62285 ) ( ON-TABLE ?auto_62276 ) ( not ( = ?auto_62276 ?auto_62277 ) ) ( not ( = ?auto_62276 ?auto_62278 ) ) ( not ( = ?auto_62276 ?auto_62279 ) ) ( not ( = ?auto_62276 ?auto_62280 ) ) ( not ( = ?auto_62276 ?auto_62281 ) ) ( not ( = ?auto_62276 ?auto_62282 ) ) ( not ( = ?auto_62276 ?auto_62283 ) ) ( not ( = ?auto_62276 ?auto_62284 ) ) ( not ( = ?auto_62276 ?auto_62285 ) ) ( not ( = ?auto_62277 ?auto_62278 ) ) ( not ( = ?auto_62277 ?auto_62279 ) ) ( not ( = ?auto_62277 ?auto_62280 ) ) ( not ( = ?auto_62277 ?auto_62281 ) ) ( not ( = ?auto_62277 ?auto_62282 ) ) ( not ( = ?auto_62277 ?auto_62283 ) ) ( not ( = ?auto_62277 ?auto_62284 ) ) ( not ( = ?auto_62277 ?auto_62285 ) ) ( not ( = ?auto_62278 ?auto_62279 ) ) ( not ( = ?auto_62278 ?auto_62280 ) ) ( not ( = ?auto_62278 ?auto_62281 ) ) ( not ( = ?auto_62278 ?auto_62282 ) ) ( not ( = ?auto_62278 ?auto_62283 ) ) ( not ( = ?auto_62278 ?auto_62284 ) ) ( not ( = ?auto_62278 ?auto_62285 ) ) ( not ( = ?auto_62279 ?auto_62280 ) ) ( not ( = ?auto_62279 ?auto_62281 ) ) ( not ( = ?auto_62279 ?auto_62282 ) ) ( not ( = ?auto_62279 ?auto_62283 ) ) ( not ( = ?auto_62279 ?auto_62284 ) ) ( not ( = ?auto_62279 ?auto_62285 ) ) ( not ( = ?auto_62280 ?auto_62281 ) ) ( not ( = ?auto_62280 ?auto_62282 ) ) ( not ( = ?auto_62280 ?auto_62283 ) ) ( not ( = ?auto_62280 ?auto_62284 ) ) ( not ( = ?auto_62280 ?auto_62285 ) ) ( not ( = ?auto_62281 ?auto_62282 ) ) ( not ( = ?auto_62281 ?auto_62283 ) ) ( not ( = ?auto_62281 ?auto_62284 ) ) ( not ( = ?auto_62281 ?auto_62285 ) ) ( not ( = ?auto_62282 ?auto_62283 ) ) ( not ( = ?auto_62282 ?auto_62284 ) ) ( not ( = ?auto_62282 ?auto_62285 ) ) ( not ( = ?auto_62283 ?auto_62284 ) ) ( not ( = ?auto_62283 ?auto_62285 ) ) ( not ( = ?auto_62284 ?auto_62285 ) ) ( ON ?auto_62283 ?auto_62284 ) ( ON ?auto_62282 ?auto_62283 ) ( ON ?auto_62281 ?auto_62282 ) ( ON ?auto_62280 ?auto_62281 ) ( ON ?auto_62279 ?auto_62280 ) ( ON ?auto_62278 ?auto_62279 ) ( CLEAR ?auto_62276 ) ( ON ?auto_62277 ?auto_62278 ) ( CLEAR ?auto_62277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62276 ?auto_62277 )
      ( MAKE-9PILE ?auto_62276 ?auto_62277 ?auto_62278 ?auto_62279 ?auto_62280 ?auto_62281 ?auto_62282 ?auto_62283 ?auto_62284 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62295 - BLOCK
      ?auto_62296 - BLOCK
      ?auto_62297 - BLOCK
      ?auto_62298 - BLOCK
      ?auto_62299 - BLOCK
      ?auto_62300 - BLOCK
      ?auto_62301 - BLOCK
      ?auto_62302 - BLOCK
      ?auto_62303 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62303 ) ( ON-TABLE ?auto_62295 ) ( not ( = ?auto_62295 ?auto_62296 ) ) ( not ( = ?auto_62295 ?auto_62297 ) ) ( not ( = ?auto_62295 ?auto_62298 ) ) ( not ( = ?auto_62295 ?auto_62299 ) ) ( not ( = ?auto_62295 ?auto_62300 ) ) ( not ( = ?auto_62295 ?auto_62301 ) ) ( not ( = ?auto_62295 ?auto_62302 ) ) ( not ( = ?auto_62295 ?auto_62303 ) ) ( not ( = ?auto_62296 ?auto_62297 ) ) ( not ( = ?auto_62296 ?auto_62298 ) ) ( not ( = ?auto_62296 ?auto_62299 ) ) ( not ( = ?auto_62296 ?auto_62300 ) ) ( not ( = ?auto_62296 ?auto_62301 ) ) ( not ( = ?auto_62296 ?auto_62302 ) ) ( not ( = ?auto_62296 ?auto_62303 ) ) ( not ( = ?auto_62297 ?auto_62298 ) ) ( not ( = ?auto_62297 ?auto_62299 ) ) ( not ( = ?auto_62297 ?auto_62300 ) ) ( not ( = ?auto_62297 ?auto_62301 ) ) ( not ( = ?auto_62297 ?auto_62302 ) ) ( not ( = ?auto_62297 ?auto_62303 ) ) ( not ( = ?auto_62298 ?auto_62299 ) ) ( not ( = ?auto_62298 ?auto_62300 ) ) ( not ( = ?auto_62298 ?auto_62301 ) ) ( not ( = ?auto_62298 ?auto_62302 ) ) ( not ( = ?auto_62298 ?auto_62303 ) ) ( not ( = ?auto_62299 ?auto_62300 ) ) ( not ( = ?auto_62299 ?auto_62301 ) ) ( not ( = ?auto_62299 ?auto_62302 ) ) ( not ( = ?auto_62299 ?auto_62303 ) ) ( not ( = ?auto_62300 ?auto_62301 ) ) ( not ( = ?auto_62300 ?auto_62302 ) ) ( not ( = ?auto_62300 ?auto_62303 ) ) ( not ( = ?auto_62301 ?auto_62302 ) ) ( not ( = ?auto_62301 ?auto_62303 ) ) ( not ( = ?auto_62302 ?auto_62303 ) ) ( ON ?auto_62302 ?auto_62303 ) ( ON ?auto_62301 ?auto_62302 ) ( ON ?auto_62300 ?auto_62301 ) ( ON ?auto_62299 ?auto_62300 ) ( ON ?auto_62298 ?auto_62299 ) ( ON ?auto_62297 ?auto_62298 ) ( CLEAR ?auto_62295 ) ( ON ?auto_62296 ?auto_62297 ) ( CLEAR ?auto_62296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62295 ?auto_62296 )
      ( MAKE-9PILE ?auto_62295 ?auto_62296 ?auto_62297 ?auto_62298 ?auto_62299 ?auto_62300 ?auto_62301 ?auto_62302 ?auto_62303 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62313 - BLOCK
      ?auto_62314 - BLOCK
      ?auto_62315 - BLOCK
      ?auto_62316 - BLOCK
      ?auto_62317 - BLOCK
      ?auto_62318 - BLOCK
      ?auto_62319 - BLOCK
      ?auto_62320 - BLOCK
      ?auto_62321 - BLOCK
    )
    :vars
    (
      ?auto_62322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62321 ?auto_62322 ) ( not ( = ?auto_62313 ?auto_62314 ) ) ( not ( = ?auto_62313 ?auto_62315 ) ) ( not ( = ?auto_62313 ?auto_62316 ) ) ( not ( = ?auto_62313 ?auto_62317 ) ) ( not ( = ?auto_62313 ?auto_62318 ) ) ( not ( = ?auto_62313 ?auto_62319 ) ) ( not ( = ?auto_62313 ?auto_62320 ) ) ( not ( = ?auto_62313 ?auto_62321 ) ) ( not ( = ?auto_62313 ?auto_62322 ) ) ( not ( = ?auto_62314 ?auto_62315 ) ) ( not ( = ?auto_62314 ?auto_62316 ) ) ( not ( = ?auto_62314 ?auto_62317 ) ) ( not ( = ?auto_62314 ?auto_62318 ) ) ( not ( = ?auto_62314 ?auto_62319 ) ) ( not ( = ?auto_62314 ?auto_62320 ) ) ( not ( = ?auto_62314 ?auto_62321 ) ) ( not ( = ?auto_62314 ?auto_62322 ) ) ( not ( = ?auto_62315 ?auto_62316 ) ) ( not ( = ?auto_62315 ?auto_62317 ) ) ( not ( = ?auto_62315 ?auto_62318 ) ) ( not ( = ?auto_62315 ?auto_62319 ) ) ( not ( = ?auto_62315 ?auto_62320 ) ) ( not ( = ?auto_62315 ?auto_62321 ) ) ( not ( = ?auto_62315 ?auto_62322 ) ) ( not ( = ?auto_62316 ?auto_62317 ) ) ( not ( = ?auto_62316 ?auto_62318 ) ) ( not ( = ?auto_62316 ?auto_62319 ) ) ( not ( = ?auto_62316 ?auto_62320 ) ) ( not ( = ?auto_62316 ?auto_62321 ) ) ( not ( = ?auto_62316 ?auto_62322 ) ) ( not ( = ?auto_62317 ?auto_62318 ) ) ( not ( = ?auto_62317 ?auto_62319 ) ) ( not ( = ?auto_62317 ?auto_62320 ) ) ( not ( = ?auto_62317 ?auto_62321 ) ) ( not ( = ?auto_62317 ?auto_62322 ) ) ( not ( = ?auto_62318 ?auto_62319 ) ) ( not ( = ?auto_62318 ?auto_62320 ) ) ( not ( = ?auto_62318 ?auto_62321 ) ) ( not ( = ?auto_62318 ?auto_62322 ) ) ( not ( = ?auto_62319 ?auto_62320 ) ) ( not ( = ?auto_62319 ?auto_62321 ) ) ( not ( = ?auto_62319 ?auto_62322 ) ) ( not ( = ?auto_62320 ?auto_62321 ) ) ( not ( = ?auto_62320 ?auto_62322 ) ) ( not ( = ?auto_62321 ?auto_62322 ) ) ( ON ?auto_62320 ?auto_62321 ) ( ON ?auto_62319 ?auto_62320 ) ( ON ?auto_62318 ?auto_62319 ) ( ON ?auto_62317 ?auto_62318 ) ( ON ?auto_62316 ?auto_62317 ) ( ON ?auto_62315 ?auto_62316 ) ( ON ?auto_62314 ?auto_62315 ) ( ON ?auto_62313 ?auto_62314 ) ( CLEAR ?auto_62313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62313 )
      ( MAKE-9PILE ?auto_62313 ?auto_62314 ?auto_62315 ?auto_62316 ?auto_62317 ?auto_62318 ?auto_62319 ?auto_62320 ?auto_62321 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62332 - BLOCK
      ?auto_62333 - BLOCK
      ?auto_62334 - BLOCK
      ?auto_62335 - BLOCK
      ?auto_62336 - BLOCK
      ?auto_62337 - BLOCK
      ?auto_62338 - BLOCK
      ?auto_62339 - BLOCK
      ?auto_62340 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62340 ) ( not ( = ?auto_62332 ?auto_62333 ) ) ( not ( = ?auto_62332 ?auto_62334 ) ) ( not ( = ?auto_62332 ?auto_62335 ) ) ( not ( = ?auto_62332 ?auto_62336 ) ) ( not ( = ?auto_62332 ?auto_62337 ) ) ( not ( = ?auto_62332 ?auto_62338 ) ) ( not ( = ?auto_62332 ?auto_62339 ) ) ( not ( = ?auto_62332 ?auto_62340 ) ) ( not ( = ?auto_62333 ?auto_62334 ) ) ( not ( = ?auto_62333 ?auto_62335 ) ) ( not ( = ?auto_62333 ?auto_62336 ) ) ( not ( = ?auto_62333 ?auto_62337 ) ) ( not ( = ?auto_62333 ?auto_62338 ) ) ( not ( = ?auto_62333 ?auto_62339 ) ) ( not ( = ?auto_62333 ?auto_62340 ) ) ( not ( = ?auto_62334 ?auto_62335 ) ) ( not ( = ?auto_62334 ?auto_62336 ) ) ( not ( = ?auto_62334 ?auto_62337 ) ) ( not ( = ?auto_62334 ?auto_62338 ) ) ( not ( = ?auto_62334 ?auto_62339 ) ) ( not ( = ?auto_62334 ?auto_62340 ) ) ( not ( = ?auto_62335 ?auto_62336 ) ) ( not ( = ?auto_62335 ?auto_62337 ) ) ( not ( = ?auto_62335 ?auto_62338 ) ) ( not ( = ?auto_62335 ?auto_62339 ) ) ( not ( = ?auto_62335 ?auto_62340 ) ) ( not ( = ?auto_62336 ?auto_62337 ) ) ( not ( = ?auto_62336 ?auto_62338 ) ) ( not ( = ?auto_62336 ?auto_62339 ) ) ( not ( = ?auto_62336 ?auto_62340 ) ) ( not ( = ?auto_62337 ?auto_62338 ) ) ( not ( = ?auto_62337 ?auto_62339 ) ) ( not ( = ?auto_62337 ?auto_62340 ) ) ( not ( = ?auto_62338 ?auto_62339 ) ) ( not ( = ?auto_62338 ?auto_62340 ) ) ( not ( = ?auto_62339 ?auto_62340 ) ) ( ON ?auto_62339 ?auto_62340 ) ( ON ?auto_62338 ?auto_62339 ) ( ON ?auto_62337 ?auto_62338 ) ( ON ?auto_62336 ?auto_62337 ) ( ON ?auto_62335 ?auto_62336 ) ( ON ?auto_62334 ?auto_62335 ) ( ON ?auto_62333 ?auto_62334 ) ( ON ?auto_62332 ?auto_62333 ) ( CLEAR ?auto_62332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62332 )
      ( MAKE-9PILE ?auto_62332 ?auto_62333 ?auto_62334 ?auto_62335 ?auto_62336 ?auto_62337 ?auto_62338 ?auto_62339 ?auto_62340 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62350 - BLOCK
      ?auto_62351 - BLOCK
      ?auto_62352 - BLOCK
      ?auto_62353 - BLOCK
      ?auto_62354 - BLOCK
      ?auto_62355 - BLOCK
      ?auto_62356 - BLOCK
      ?auto_62357 - BLOCK
      ?auto_62358 - BLOCK
    )
    :vars
    (
      ?auto_62359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62350 ?auto_62351 ) ) ( not ( = ?auto_62350 ?auto_62352 ) ) ( not ( = ?auto_62350 ?auto_62353 ) ) ( not ( = ?auto_62350 ?auto_62354 ) ) ( not ( = ?auto_62350 ?auto_62355 ) ) ( not ( = ?auto_62350 ?auto_62356 ) ) ( not ( = ?auto_62350 ?auto_62357 ) ) ( not ( = ?auto_62350 ?auto_62358 ) ) ( not ( = ?auto_62351 ?auto_62352 ) ) ( not ( = ?auto_62351 ?auto_62353 ) ) ( not ( = ?auto_62351 ?auto_62354 ) ) ( not ( = ?auto_62351 ?auto_62355 ) ) ( not ( = ?auto_62351 ?auto_62356 ) ) ( not ( = ?auto_62351 ?auto_62357 ) ) ( not ( = ?auto_62351 ?auto_62358 ) ) ( not ( = ?auto_62352 ?auto_62353 ) ) ( not ( = ?auto_62352 ?auto_62354 ) ) ( not ( = ?auto_62352 ?auto_62355 ) ) ( not ( = ?auto_62352 ?auto_62356 ) ) ( not ( = ?auto_62352 ?auto_62357 ) ) ( not ( = ?auto_62352 ?auto_62358 ) ) ( not ( = ?auto_62353 ?auto_62354 ) ) ( not ( = ?auto_62353 ?auto_62355 ) ) ( not ( = ?auto_62353 ?auto_62356 ) ) ( not ( = ?auto_62353 ?auto_62357 ) ) ( not ( = ?auto_62353 ?auto_62358 ) ) ( not ( = ?auto_62354 ?auto_62355 ) ) ( not ( = ?auto_62354 ?auto_62356 ) ) ( not ( = ?auto_62354 ?auto_62357 ) ) ( not ( = ?auto_62354 ?auto_62358 ) ) ( not ( = ?auto_62355 ?auto_62356 ) ) ( not ( = ?auto_62355 ?auto_62357 ) ) ( not ( = ?auto_62355 ?auto_62358 ) ) ( not ( = ?auto_62356 ?auto_62357 ) ) ( not ( = ?auto_62356 ?auto_62358 ) ) ( not ( = ?auto_62357 ?auto_62358 ) ) ( ON ?auto_62350 ?auto_62359 ) ( not ( = ?auto_62358 ?auto_62359 ) ) ( not ( = ?auto_62357 ?auto_62359 ) ) ( not ( = ?auto_62356 ?auto_62359 ) ) ( not ( = ?auto_62355 ?auto_62359 ) ) ( not ( = ?auto_62354 ?auto_62359 ) ) ( not ( = ?auto_62353 ?auto_62359 ) ) ( not ( = ?auto_62352 ?auto_62359 ) ) ( not ( = ?auto_62351 ?auto_62359 ) ) ( not ( = ?auto_62350 ?auto_62359 ) ) ( ON ?auto_62351 ?auto_62350 ) ( ON ?auto_62352 ?auto_62351 ) ( ON ?auto_62353 ?auto_62352 ) ( ON ?auto_62354 ?auto_62353 ) ( ON ?auto_62355 ?auto_62354 ) ( ON ?auto_62356 ?auto_62355 ) ( ON ?auto_62357 ?auto_62356 ) ( ON ?auto_62358 ?auto_62357 ) ( CLEAR ?auto_62358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_62358 ?auto_62357 ?auto_62356 ?auto_62355 ?auto_62354 ?auto_62353 ?auto_62352 ?auto_62351 ?auto_62350 )
      ( MAKE-9PILE ?auto_62350 ?auto_62351 ?auto_62352 ?auto_62353 ?auto_62354 ?auto_62355 ?auto_62356 ?auto_62357 ?auto_62358 ) )
  )

)

